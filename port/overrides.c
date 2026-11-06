/* Game routines that talk to hardware are replaced at their entry by a jump to host code (or by a plain ret). */
#include "host.h"
#include <string.h>
#include <SDL.h>

#ifdef _WIN32
#define SYM(s) "_" s
#else
#define SYM(s) s
#endif

void patch_bytes(void *at, const void *bytes, size_t n)
{
    memcpy(at, bytes, n);
}

static void stub_zero(void *at)
{
    static const uint8_t code[] = { 0x31, 0xC0, 0xC3 };
    patch_bytes(at, code, sizeof code);
}

void patch_jmp(void *from, void *to)
{
    uint8_t code[5];
    int32_t rel = (int32_t)((uintptr_t)to - ((uintptr_t)from + 5));
    code[0] = 0xE9;
    memcpy(code + 1, &rel, 4);
    patch_bytes(from, code, 5);
}

#ifdef _WIN32
/* __setenvp_ (D7C08) would load FS with the DOS/4GW environment selector (FS is the TEB on Windows). Build the same table from the flat
 * block (cstart.c): environ at 14F09C, the flag bytes at 14F0A0, the block pointer at 12442D. This was an empty stub, so environ stayed 0,
 * getenv_ (C2CF7) returned 0 for everything and the sound code (CE0CB: BLASTER, D6128: ULTRASND) found no card: no sound on Windows. */
#define ORIG_ENVIRON  0x14F09Cu
#define ORIG_ENVFLAGS 0x14F0A0u
void host_setenvp(void)
{
    static char *env[65];
    static uint8_t flags[64];
    uint32_t blk;
    char *p;
    int n = 0;
    if (*(uint32_t *)GAME_ADDR(ORIG_ENVIRON)) return;
    memcpy(&blk, GAME_ADDR(ORIG_CRT_ENV), 4);
    p = (char *)(uintptr_t)blk;
    for (; p && *p && n < 64; p += strlen(p) + 1) { env[n++] = p; TRACE("env %s\n", p); }
    env[n] = 0;
    *(uint32_t *)GAME_ADDR(ORIG_ENVIRON) = (uint32_t)(uintptr_t)env;
    *(uint32_t *)GAME_ADDR(ORIG_ENVFLAGS) = (uint32_t)(uintptr_t)flags;
}

__attribute__((naked)) static void setenvp_entry(void)
{
    __asm__ volatile("pushal\n\tcall _host_setenvp\n\tpopal\n\tret");
}
#endif

volatile int intro_skip;
volatile int intro_title;
volatile int host_allow_irq;

void host_set_deadline(uint32_t ticks)
{
    uint32_t *count = (uint32_t *)GAME_ADDR(ORIG_TICKCOUNT);
    uint32_t *dead = (uint32_t *)GAME_ADDR(ORIG_TICKDEADLINE);
    if (intro_skip) ticks = 0;
    *dead = *count + ticks;
}

/* Spinning on tickcount in host code deadlocks on Windows: plat_kick_game only delivers IRQs when EIP is in the game image, so
 * the PIT handler never runs and WaitTicks(1) at the end of a TGV (sub_69C98) hangs forever. That matched "freeze after Pioneer /
 * freeze when skipping EA or Pioneer". Allow the kick while we wait, and sleep so the main thread can raise the timer and poll input. */
void host_wait_ticks(uint32_t ticks)
{
    uint32_t *count = (uint32_t *)GAME_ADDR(ORIG_TICKCOUNT);
    uint32_t until;
    if (intro_skip) ticks = 0;
    until = *count + ticks;
    host_allow_irq = 1;
    while ((int32_t)(*count - until) < 0) plat_sleep_ms(1);
    host_allow_irq = 0;
}

__attribute__((naked)) static void set_deadline_entry(void)
{
    __asm__ volatile(
        "movl 4(%esp), %eax\n\t"
        "pushal\n\t"
        "push %eax\n\t"
        "call " SYM("host_set_deadline") "\n\t"
        "addl $4, %esp\n\t"
        "popal\n\t"
        "ret");
}

__attribute__((naked)) static void wait_ticks_entry(void)
{
    __asm__ volatile(
        "movl 4(%esp), %eax\n\t"
        "pushal\n\t"
        "push %eax\n\t"
        "call " SYM("host_wait_ticks") "\n\t"
        "addl $4, %esp\n\t"
        "popal\n\t"
        "ret");
}

/* The TGV player waits for vertical retrace before writing a palette chunk (sub_DDE7B then 256× outsb to 3C9). The original busy-waits
 * with ~100000 port reads; each `in` is a privilege trap here, so a palette keyframe stalled for seconds and looked like a freeze, and
 * video_present could sample the DAC mid-write (one wrong frame every few seconds). Sleep until the emulated retrace edge instead. */
void host_wait_retrace(void)
{
    uint32_t mode = *(uint32_t *)GAME_ADDR(0x1248C8);
    int64_t now, ph;
    if (mode > 1) { *(uint32_t *)GAME_ADDR(0x123AC4) = 0x186A0; return; }
    host_allow_irq = 1;
    if (mode != 1) {                             /* mode 0: leave retrace first (same as the original loopne) */
        for (;;) {
            now = intro_skip ? plat_now_ns() * 40 : plat_now_ns();
            ph = now % 14285714LL;
            if (ph >= 1200000) break;
            plat_sleep_ms(0);
        }
    }
    for (;;) {                                   /* enter retrace */
        now = intro_skip ? plat_now_ns() * 40 : plat_now_ns();
        ph = now % 14285714LL;
        if (ph < 1200000) break;
        if (14285714LL - ph > 2000000) plat_sleep_ms((int)((14285714LL - ph) / 1000000));
        else plat_sleep_ms(0);
    }
    video_on_retrace();                     /* apply pending page flip when no TGV palette chunk follows */
    *(uint32_t *)GAME_ADDR(0x123AC4) = 0x186A0;
    host_allow_irq = 0;
}

__attribute__((naked)) static void wait_retrace_entry(void)
{
    __asm__ volatile(
        "pushal\n\t"
        "call " SYM("host_wait_retrace") "\n\t"
        "popal\n\t"
        "ret");
}

void install_overrides(void)
{
#ifdef _WIN32
    patch_jmp(GAME_ADDR(ORIG_SETENVP), setenvp_entry);
#endif
    stub_zero(GAME_ADDR(ORIG_HOOK387));
    stub_zero(GAME_ADDR(ORIG_UNHOOK387));
    stub_zero(GAME_ADDR(ORIG_VIDSAVE));
    stub_zero(GAME_ADDR(ORIG_VIDRESTORE));
    if (GAME_ADDR(ORIG_SETDEADLINE)[0] == 0x8B) patch_jmp(GAME_ADDR(ORIG_SETDEADLINE), set_deadline_entry);
    if (GAME_ADDR(ORIG_WAITTICKS)[0] == 0x8B) patch_jmp(GAME_ADDR(ORIG_WAITTICKS), wait_ticks_entry);
    if (GAME_ADDR(ORIG_WAITRETRACE)[0] == 0xBA) patch_jmp(GAME_ADDR(ORIG_WAITRETRACE), wait_retrace_entry);
    if (GAME_ADDR(ORIG_WAITRETRACE2)[0] == 0xBA) patch_jmp(GAME_ADDR(ORIG_WAITRETRACE2), wait_retrace_entry);
    if (GAME_ADDR(ORIG_WAITRETRACE3)[0] == 0xBA) patch_jmp(GAME_ADDR(ORIG_WAITRETRACE3), wait_retrace_entry);
    install_flag_traps();
    { extern void install_sound_hooks(void); install_sound_hooks(); }
}
