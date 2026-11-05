/* The mixer: an SDL audio device plus the list of sound devices that render into it. NHL96_WAV=file.wav also writes everything
 * that was mixed to a WAV file (16-bit stereo), which is how the sound code is tested without speakers. */
#include "host.h"
#include "audio.h"
#include <stdarg.h>
#include <math.h>

#define MAX_SOURCES 8
#define CHUNK 1024

static audio_render_fn sources[MAX_SOURCES];
static int nsources;
static SDL_AudioDeviceID dev;
static SDL_mutex *mutex;
static int out_rate = 44100;
static FILE *wav;
static uint32_t wav_bytes;
static int64_t pump_last;
int alog_on;
static FILE *alog_f;
static double alog_sq;                  /* the output of the last second: sum of squares, samples, peak */
static uint32_t alog_n;
static int alog_peak;
static int beep_frames;                 /* NHL96_BEEP: a test tone at start-up, to tell the output from the emulation */

int audio_rate(void) { return out_rate; }
void audio_lock(void) { if (mutex) SDL_LockMutex(mutex); }
void audio_unlock(void) { if (mutex) SDL_UnlockMutex(mutex); }
void audio_add_source(audio_render_fn fn) { if (nsources < MAX_SOURCES) sources[nsources++] = fn; }

static void wav_header(void)
{
    uint32_t v;
    uint16_t h;
    if (!wav) return;
    fseek(wav, 0, SEEK_SET);
    fwrite("RIFF", 1, 4, wav); v = 36 + wav_bytes; fwrite(&v, 4, 1, wav);
    fwrite("WAVEfmt ", 1, 8, wav); v = 16; fwrite(&v, 4, 1, wav);
    h = 1; fwrite(&h, 2, 1, wav); h = 2; fwrite(&h, 2, 1, wav);
    v = out_rate; fwrite(&v, 4, 1, wav); v = out_rate * 4; fwrite(&v, 4, 1, wav);
    h = 4; fwrite(&h, 2, 1, wav); h = 16; fwrite(&h, 2, 1, wav);
    fwrite("data", 1, 4, wav); fwrite(&wav_bytes, 4, 1, wav);
}

/* Where the program writes its own files (the diagnostics log and the captures): next to the program, or the current folder. */
static void out_path(char *buf, size_t n, const char *name)
{
    const char *base = SDL_GetBasePath();
    snprintf(buf, n, "%s%s", base ? base : "", name);
}

/* The sound diagnostics (the log and the Ctrl+F11 recording) are for finding out what goes wrong on a machine that cannot be attached to a
 * debugger, and are off unless NHL96_AUDIO_DEBUG is set. */
int audio_debug(void)
{
    static int on = -1;
    if (on < 0) on = getenv("NHL96_AUDIO_DEBUG") != NULL;
    return on;
}

/* nhl96-audio.log: timing facts about the sound emulation, appended. */
void audio_log(const char *fmt, ...)
{
    char path[1100];
    FILE *f;
    va_list ap;
    static int64_t t0;
    if (!audio_debug()) return;
    if (!t0) t0 = plat_now_ns();
    out_path(path, sizeof path, "nhl96-audio.log");
    f = fopen(path, "a");
    if (!f) f = fopen("nhl96-audio.log", "a");
    if (!f) return;
    fprintf(f, "[%7.1f s] ", (plat_now_ns() - t0) / 1e9);
    va_start(ap, fmt);
    vfprintf(f, fmt, ap);
    va_end(ap);
    fputc('\n', f);
    fclose(f);
}

/* Ctrl+F11: start or stop recording what is mixed to nhl96-capture-N.wav (16-bit stereo) */
void audio_capture_toggle(void)
{
    static int n;
    char path[1100], name[64];
    audio_lock();
    if (wav) {
        wav_header();
        fclose(wav);
        wav = 0;
        audio_log("capture stopped (%u bytes)", wav_bytes);
        video_set_title("NHL Hockey 96 - capture saved");
    } else {
        snprintf(name, sizeof name, "nhl96-capture-%d.wav", ++n);
        out_path(path, sizeof path, name);
        wav_bytes = 0;
        wav = fopen(path, "wb");
        if (wav) { wav_header(); audio_log("capture started: %s", path); video_set_title("NHL Hockey 96 - RECORDING (Ctrl+F11 stops)"); }
        else audio_log("cannot create %s", path);
    }
    audio_unlock();
}

/* mix `frames` stereo frames into out (interleaved int16) */
static void mix(int16_t *out, int frames)
{
    static int32_t acc[CHUNK * 2];
    while (frames > 0) {
        int n = frames < CHUNK ? frames : CHUNK, i;
        memset(acc, 0, n * 2 * sizeof(int32_t));
        SDL_LockMutex(mutex);
        for (i = 0; i < nsources; i++) sources[i](acc, n, out_rate);
        SDL_UnlockMutex(mutex);
        if (beep_frames > 0) {
            static uint32_t ph;
            for (i = 0; i < n && beep_frames > 0; i++, beep_frames--, ph++) {
                int32_t v = (ph / 50) & 1 ? 6000 : -6000;          /* 441 Hz square wave */
                acc[2 * i] += v; acc[2 * i + 1] += v;
            }
        }
        for (i = 0; i < n * 2; i++) {
            int32_t v = acc[i];
            if (alog_on) { int a = v < 0 ? -v : v; alog_sq += (double)v * v; if (a > alog_peak) alog_peak = a; }
            out[i] = audio_muted ? 0 : v > 32767 ? 32767 : v < -32768 ? -32768 : (int16_t)v;
        }
        if (alog_on) alog_n += n * 2;
        SDL_LockMutex(mutex);
        if (wav) { fwrite(out, 4, n, wav); wav_bytes += n * 4; wav_header(); fseek(wav, 0, SEEK_END); }
        SDL_UnlockMutex(mutex);
        out += n * 2;
        frames -= n;
    }
}

volatile int audio_muted;                        /* set while a window menu is open (menu_win.c) */

static void SDLCALL callback(void *user, Uint8 *stream, int len)
{
    (void)user;
    mix((int16_t *)stream, len / 4);
}

void alog(const char *fmt, ...)
{
    static int64_t t0;
    va_list ap;
    static int checked;
    if (!checked) { const char *e = getenv("NHL96_AUDIOLOG"); checked = 1; if (e && *e && *e != '0') alog_on = 1; }
    if (!alog_on) return;
    if (!alog_f) {
        char path[1100];
        out_path(path, sizeof path, "nhl96-audiolog.txt");
        alog_f = fopen(path, "w");
        if (!alog_f) alog_f = fopen("nhl96-audiolog.txt", "w");
        if (!alog_f) { alog_on = 0; return; }
        t0 = plat_now_ns();
    }
    fprintf(alog_f, "%7.3f ", (plat_now_ns() - t0) / 1e9);
    va_start(ap, fmt);
    vfprintf(alog_f, fmt, ap);
    va_end(ap);
    fputc('\n', alog_f);
    fflush(alog_f);
}

/* once a second: what the mixer put out, the Sound Blaster and its DMA channel, the interrupts, and the game's own sound state */
void alog_second(void)
{
    static int64_t last;
    int64_t now = plat_now_ns();
    char sb[256], d1[128], d5[128], iq[256];
    double rms;
    int peak, i, timers = 0;
    uint32_t n;
    if (!alog_on || now - last < 1000000000LL) return;
    last = now;
    audio_lock();
    n = alog_n; rms = n ? sqrt(alog_sq / n) : 0; peak = alog_peak;
    alog_sq = 0; alog_n = 0; alog_peak = 0;
    sb_log_state(sb, sizeof sb);
    audio_unlock();
    dma_log_state(1, d1, sizeof d1);
    dma_log_state(5, d5, sizeof d5);
    irq_log_state(iq, sizeof iq);
    for (i = 0; i < 8; i++) if (((volatile uint32_t *)GAME_ADDR(ORIG_TIMER_LIST))[i]) timers++;
    alog("out: %u samples rms %.0f peak %d%s | %s | dma1 %s | dma5 %s | %s | game: card %d driver %d flags %x opts %08x timer callbacks %d",
         n, rms, peak, audio_muted ? " MUTED" : "", sb, d1, d5, iq,
         *(volatile int32_t *)GAME_ADDR(ORIG_SND_CARD), *(volatile int32_t *)GAME_ADDR(ORIG_SND_DRIVER),
         (unsigned)*(volatile int32_t *)GAME_ADDR(ORIG_SND_FLAGS), (unsigned)*(volatile uint32_t *)GAME_ADDR(ORIG_CFG_SOUND), timers);
}

void audio_init(void)
{
    SDL_AudioSpec want, have;
    const char *w = getenv("NHL96_WAV");
    const char *e = getenv("NHL96_AUDIOLOG");
    alog_on = e && *e && *e != '0';
    e = getenv("NHL96_BEEP");
    mutex = SDL_CreateMutex();
    memset(&want, 0, sizeof want);
    want.freq = 44100; want.format = AUDIO_S16SYS; want.channels = 2; want.samples = getenv("NHL96_AUDIO_FRAMES") ? atoi(getenv("NHL96_AUDIO_FRAMES")) : 512; want.callback = callback;
    dev = SDL_OpenAudioDevice(0, 0, &want, &have, 0);
    if (dev) {
        out_rate = have.freq; SDL_PauseAudioDevice(dev, 0);
        alog("SDL audio driver %s: device open, %d Hz, %d channels, format %04x, %d frames", SDL_GetCurrentAudioDriver() ? SDL_GetCurrentAudioDriver() : "?",
             have.freq, have.channels, (unsigned)have.format, have.samples);
        audio_log("audio device: %d Hz, buffer %d frames (%.1f ms)", have.freq, have.samples, 1000.0 * have.samples / have.freq);
    }
    else {
        fprintf(stderr, "no audio device (%s): sound is mixed but not played\n", SDL_GetError());
        alog("NO AUDIO DEVICE: %s (SDL audio driver %s)", SDL_GetError(), SDL_GetCurrentAudioDriver() ? SDL_GetCurrentAudioDriver() : "none");
    }
    if (e && *e && *e != '0') { beep_frames = out_rate * 2; alog("NHL96_BEEP: 2 s test tone"); }
    if (w) { wav = fopen(w, "wb"); if (wav) wav_header(); }
    pump_last = plat_now_ns();
    speaker_init();
    opl_init();
}

/* Without an audio device nothing calls the mixer, so the devices that count samples (the Sound Blaster's block interrupts) would
 * never finish: run it from the main thread at the pace of the clock. */
void audio_pump(void)
{
    static int16_t scratch[CHUNK * 2];
    int64_t now = plat_now_ns();
    int frames;
    if (dev) return;
    frames = (int)((now - pump_last) * out_rate / 1000000000LL);
    if (frames > CHUNK) frames = CHUNK;
    if (frames <= 0) return;
    pump_last += (int64_t)frames * 1000000000LL / out_rate;
    mix(scratch, frames);
}
