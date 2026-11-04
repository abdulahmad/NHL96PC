/* The Sound Blaster (Pro, or 16 when BLASTER says T6: DSP 4.05 with the 0Bxh/0Cxh commands and 16-bit DMA on the H channel): the DSP at base+6..0xE, the mixer at base+4/5, and 8-bit PCM played from a DMA channel. The FM
 * ports (base+0..3, base+8/9) go to the OPL in sound_ports.c. */
#include "host.h"
#include "audio.h"
#include <math.h>

static int base = 0x220, irq = 7, dma = 1, hdma = 5, version = 0x0302;
static int sb16_rate;                    /* 41h/42h: the sample rate itself (0: from the time constant) */
static int fmt16, fmt_stereo, fmt_signed; /* the format of a 0Bxh/0Cxh transfer */
static int irq16_pending;
static uint32_t n_cmds, n_irqs, n_resets, n_reads;   /* NHL96_AUDIOLOG counters */
static uint8_t outbuf[64];
static int out_n;
static int resetting;
static int cmd = -1, cmd_need, cmd_got;
static uint8_t cmd_data[4];
static int speaker_on;
static int time_constant = 0xA6;          /* 11 kHz */
static uint32_t block_size = 0x7FF;       /* set by 0x48: bytes minus one */
static int active, autoinit, paused, high_speed;
static int64_t remaining;                 /* bytes left in the current block, or silent samples */
static int silence;
static int irq_pending;
static uint8_t test_reg;
static int direct_level = 128;
static uint8_t mixer_idx, mixer[256];
static double acc;
static int64_t pump_last_ns;              /* the clock of the DMA pump (sb_pump), and the fraction of a sample it owes */
static double pump_acc;
static int prev_l, prev_r, cur_l, cur_r;      /* cur: the last sample taken from the DMA channel; prev, out: the output side */
static int out_l, out_r;

static void mixer_reset(void)
{
    memset(mixer, 0, sizeof mixer);
    mixer[0x04] = 0xCC; mixer[0x0A] = 0x00; mixer[0x0C] = 0x00; mixer[0x0E] = 0x00;
    mixer[0x22] = 0xEE; mixer[0x26] = 0xEE; mixer[0x28] = 0x00; mixer[0x2E] = 0x00;
}

static void sb_render(int32_t *out, int frames, int rate);

void sb_init(int b, int i, int d, int h, int v)
{
    base = b; irq = i; dma = d; hdma = h; version = v;
    mixer_reset();
    audio_add_source(sb_render);
}

int sb_base(void) { return base; }

static int stereo(void) { return fmt_stereo || ((mixer[0x0E] >> 1) & 1); }

static double sample_rate(void)
{
    double r;
    if (sb16_rate) return sb16_rate;
    r = 1000000.0 / (256 - time_constant);
    return stereo() ? r / 2 : r;
}

static void raise_irq(void)
{
    n_irqs++;
    irq_pending = 1;
    irq_raise(irq);
}

static void dsp_reset(void)
{
    if (n_resets++ < 20) alog("sb: DSP reset");
    active = autoinit = paused = high_speed = silence = 0;
    remaining = 0;
    irq_pending = 0;
    speaker_on = 0;
    cmd = -1;
    out_n = 0;
    outbuf[out_n++] = 0xAA;
    time_constant = 0xA6;
    block_size = 0x7FF;
    sb16_rate = 0; fmt16 = fmt_stereo = fmt_signed = 0; irq16_pending = 0;
    mixer_reset();
}

static void push_out(uint8_t b)
{
    if (out_n < (int)sizeof outbuf) outbuf[out_n++] = b;
}

static int cmd_params(int c)
{
    switch (c) {
    case 0x10: case 0x40: case 0xE0: case 0xE4: case 0x38: return 1;
    case 0x14: case 0x16: case 0x17: case 0x48: case 0x80: case 0x41: case 0x42: case 0x24: return 2;
    default: return (c >= 0xB0 && c <= 0xCF) ? 3 : 0;
    }
}

static void start_block(int len_minus_one, int auto_init, int high)
{
    remaining = (int64_t)len_minus_one + 1;
    autoinit = auto_init;
    high_speed = high;
    active = 1;
    paused = 0;
    silence = 0;
    acc = 1.0;
    pump_last_ns = plat_now_ns(); pump_acc = 0;                  /* the clock starts with the block */
    alog("sb: start %s%s %s block %d rate %.0f%s dma%d (channel %s, speaker %s)", auto_init ? "auto-init" : "single", high ? " high-speed" : "",
         fmt16 ? "16-bit" : "8-bit", len_minus_one + 1, sample_rate(), stereo() ? " stereo" : "", fmt16 ? hdma : dma,
         dma_masked(fmt16 ? hdma : dma) ? "MASKED" : "unmasked", speaker_on ? "on" : "off");
    TRACE("sb: start %s%s block %d rate %.0f%s dma%d\n", auto_init ? "auto-init " : "single ", high ? "high-speed" : "", len_minus_one + 1,
          sample_rate(), stereo() ? " stereo" : "", fmt16 ? hdma : dma);
}

static void run_command(int c)
{
    uint8_t *d = cmd_data;
    if (++n_cmds <= 400 || c < 0x10 || (c >= 0x14 && c <= 0x1F) || (c >= 0x90 && c <= 0xCF)) {
        int k, np = cmd_params(c);
        char ps[16] = "";
        for (k = 0; k < np; k++) sprintf(ps + 3 * k, " %02x", d[k]);
        alog("sb: DSP %02x%s", c, ps);
    }
    if (c >= 0xB0 && c <= 0xCF) {               /* SB16 transfer: command bit 2 auto-init, mode byte bit 4 signed, bit 5 stereo */
        fmt16 = c < 0xC0; fmt_stereo = (d[0] >> 5) & 1; fmt_signed = (d[0] >> 4) & 1;
        block_size = d[1] | (d[2] << 8);
        if (!sb16_rate) sb16_rate = (int)(1000000.0 / (256 - time_constant));
        start_block(block_size, (c >> 2) & 1, 0);
        return;
    }
    if (c == 0x14 || c == 0x1C || c == 0x90 || c == 0x91) fmt16 = fmt_signed = fmt_stereo = 0;    /* an 8-bit SB/SB Pro transfer */
    if (c == 0x40) sb16_rate = 0;
    switch (c) {
    case 0x10: direct_level = d[0]; break;
    case 0x14: start_block(d[0] | (d[1] << 8), 0, 0); break;
    case 0x1C: start_block(block_size, 1, 0); break;
    case 0x91: start_block(block_size, 0, 1); break;
    case 0x90: start_block(block_size, 1, 1); break;
    case 0x40: time_constant = d[0]; break;
    case 0x41: case 0x42: sb16_rate = (d[0] << 8) | d[1]; if (!sb16_rate) sb16_rate = 5000; break;
    case 0x48: block_size = d[0] | (d[1] << 8); break;
    case 0x80: remaining = (d[0] | (d[1] << 8)) + 1; silence = 1; active = 1; autoinit = 0; acc = 1.0; pump_last_ns = plat_now_ns(); pump_acc = 0; break;
    case 0xD0: case 0xD5: paused = 1; break;
    case 0xD4: case 0xD6: paused = 0; break;
    case 0xDA: case 0xD9: autoinit = 0; break;
    case 0xD1: speaker_on = 1; break;
    case 0xD3: speaker_on = 0; break;
    case 0xD8: push_out(speaker_on ? 0xFF : 0x00); break;
    case 0xE0: out_n = 0; push_out(~d[0]); break;
    case 0xE1: push_out(version >> 8); push_out(version & 0xFF); break;
    case 0xE4: test_reg = d[0]; break;
    case 0xE8: push_out(test_reg); break;
    case 0xF2: raise_irq(); break;
    case 0x20: push_out(0x80); break;
    case 0x04: push_out(0xFF); break;
    default: TRACE("sb: unknown DSP command %02x\n", c); break;
    }
}

/* Playback is paced by the clock, not by the audio device: the DMA position the game's driver reads back (it decides when to refill
 * its buffer from it) has to move smoothly, like on the card, and the audio device asks for samples in bursts of 20 ms or more.
 * sb_pump takes the samples that are due by the time of day from the DMA channel (raising the block interrupts) into a queue;
 * sb_render only resamples the queue to the output. sb_pump runs with the audio lock held: from the mixer, from the main loop and
 * when the game reads the DMA position. */
#define FIFO_SIZE 8192
static int16_t fifo_l[FIFO_SIZE], fifo_r[FIFO_SIZE];
static uint32_t fifo_head, fifo_tail;           /* tail: next to read */

static void fifo_push(int l, int r)
{
    if (fifo_head - fifo_tail >= FIFO_SIZE) fifo_tail++;              /* full: the oldest is dropped */
    fifo_l[fifo_head % FIFO_SIZE] = (int16_t)l;
    fifo_r[fifo_head % FIFO_SIZE] = (int16_t)r;
    fifo_head++;
}

extern volatile int intro_skip;

/* one sample from the DMA channel of the transfer, as a signed 16-bit value */
static int take_sample(void)
{
    int v;
    if (fmt16) {
        uint8_t *p = (uint8_t *)dma_address(hdma);
        v = (int16_t)(p[0] | (p[1] << 8));
        if (!fmt_signed) v -= 32768;
        dma_advance(hdma, 1);
    } else {
        uint8_t *p = (uint8_t *)dma_address(dma);
        v = fmt_signed ? (int8_t)p[0] << 8 : (p[0] - 128) << 8;
        dma_advance(dma, 1);
    }
    return v;
}

static void sb_pump_locked(void)
{
    int64_t now = plat_now_ns(), dt = now - pump_last_ns;
    double due;
    int n, i;
    pump_last_ns = now;
    if (!active) { pump_acc = 0; return; }
    if (dt > 100000000LL) dt = 100000000LL;                       /* after a long stall: do not play it all at once */
    due = pump_acc + dt * sample_rate() * (intro_skip ? 40 : 1) / 1e9;        /* skipping the splash screens: the music is over sooner */
    n = (int)due;
    pump_acc = due - n;
    for (i = 0; i < n && active; i++) {
        int l = cur_l, r = cur_r;
        if (paused) { l = r = 0; }
        else if (silence) { l = r = 0; remaining--; }
        else if (dma_masked(fmt16 ? hdma : dma)) { /* the card has nothing to play: hold the last sample */ }
        else {
            l = take_sample(); r = l;
            remaining--;
            if (stereo() && remaining > 0) {
                r = take_sample();
                remaining--;
            }
        }
        cur_l = l; cur_r = r;
        if (trace_on) {                                 /* NHL96_TRACE: the loudness of every 512 samples, to compare with the GUS stream */
            static double sq; static int cnt;
            sq += (double)l * l;
            if (++cnt == 512) { fprintf(stderr, "sb: block rms %.0f\n", sqrt(sq / 512)); sq = 0; cnt = 0; }
        }
        fifo_push(l, r);
        if (!paused && remaining <= 0) {
            if (fmt16) { irq16_pending = 1; irq_raise(irq); } else raise_irq();
            if (autoinit && !silence) remaining = (int64_t)block_size + 1;
            else { active = 0; silence = 0; }
        }
    }
}

void sb_pump(void)                      /* any thread; takes the audio lock */
{
    if (!active) return;
    audio_lock();
    sb_pump_locked();
    audio_unlock();
}

static void sb_render(int32_t *out, int frames, int rate)
{
    int i;
    double step;
    sb_pump_locked();
    if (!active && fifo_head == fifo_tail) {
        if (speaker_on && direct_level != 128) {            /* direct DAC writes: hold the last value */
            int32_t v = (direct_level - 128) << 6;
            for (i = 0; i < frames; i++) { out[2 * i] += v; out[2 * i + 1] += v; }
        }
        return;
    }
    step = sample_rate() / rate;
    for (i = 0; i < frames; i++) {
        double t;
        while (acc >= 1.0) {
            acc -= 1.0;
            prev_l = out_l; prev_r = out_r;
            if (fifo_tail != fifo_head) { out_l = fifo_l[fifo_tail % FIFO_SIZE]; out_r = fifo_r[fifo_tail % FIFO_SIZE]; fifo_tail++; }
            /* an empty queue repeats the last sample */
        }
        t = acc > 1.0 ? 1.0 : acc;              /* the part of the sample period since the last sample was taken: ramp from the previous one */
        if (speaker_on || version >= 0x0400) {  /* (the SB16 ignores D1h/D3h) to this one (one sample of delay), not back toward the previous */
            out[2 * i] += (int32_t)(prev_l + (out_l - prev_l) * t);
            out[2 * i + 1] += (int32_t)(prev_r + (out_r - prev_r) * t);
        }
        acc += step;
    }
}

uint32_t sb_in(unsigned port)
{
    uint32_t v = 0xFF;
    audio_lock();
    switch (port - base) {
    case 0x5: v = mixer[mixer_idx];
        if (mixer_idx == 0x80) v = irq == 2 ? 1 : irq == 5 ? 2 : irq == 7 ? 4 : 8;
        if (mixer_idx == 0x81) v = (1 << dma) | (version >= 0x0400 && hdma >= 5 ? 1 << hdma : 0);
        if (mixer_idx == 0x82) v = (irq_pending ? 1 : 0) | (irq16_pending ? 2 : 0);
        break;
    case 0xA:
        n_reads++;
        if (out_n) { v = outbuf[0]; memmove(outbuf, outbuf + 1, --out_n); }
        break;
    case 0xC: v = 0x7F; break;                              /* ready for a command */
    case 0xE: v = (out_n ? 0x80 : 0) | 0x7F; irq_pending = 0; break;
    case 0xF: v = 0x7F; irq16_pending = 0; break;            /* SB16: acknowledges the 16-bit interrupt */
    case 0x6: v = 0xFF; break;
    }
    audio_unlock();
    return v;
}

void sb_out(unsigned port, uint32_t val)
{
    audio_lock();
    switch (port - base) {
    case 0x4: mixer_idx = val; break;
    case 0x5: if (mixer_idx == 0) mixer_reset(); else mixer[mixer_idx] = val; break;
    case 0x6:
        if (val & 1) resetting = 1;
        else if (resetting) { resetting = 0; dsp_reset(); }
        break;
    case 0xC:
        if (cmd < 0) {
            cmd = val & 0xFF; cmd_need = cmd_params(cmd); cmd_got = 0;
            if (!cmd_need) { run_command(cmd); cmd = -1; }
        } else {
            cmd_data[cmd_got++] = val;
            if (cmd_got >= cmd_need) { run_command(cmd); cmd = -1; }
        }
        break;
    }
    audio_unlock();
}

/* NHL96_AUDIOLOG: one line of state (audio lock held) */
void sb_log_state(char *buf, int n)
{
    snprintf(buf, n, "sb: %s%s%s rate %.0f left %lld speaker %s, %u DSP commands, %u data reads, %u irqs raised, irq pending %d/%d",
             active ? (autoinit ? "playing auto-init" : "playing single") : "idle", paused ? " PAUSED" : "", silence ? " silence" : "",
             sample_rate(), (long long)remaining, speaker_on ? "on" : "off", n_cmds, n_reads, n_irqs, irq_pending, irq16_pending);
    n_cmds = n_reads = n_irqs = 0;
}
