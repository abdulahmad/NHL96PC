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
/* __setenvp_ would load FS with a DOS/4GW selector. Build the table from the flat block. */
void host_setenvp(void)
{
    static char *env[65];
    static uint8_t flags[64];
    (void)env; (void)flags;
}

__attribute__((naked)) static void setenvp_entry(void)
{
    __asm__ volatile("pushal\n\tcall _host_setenvp\n\tpopal\n\tret");
}
#endif

volatile int intro_skip;
volatile int intro_title;

void host_set_deadline(uint32_t ticks)
{
    uint32_t *count = (uint32_t *)GAME_ADDR(ORIG_TICKCOUNT);
    uint32_t *dead = (uint32_t *)GAME_ADDR(ORIG_TICKDEADLINE);
    if (intro_skip) ticks = 0;
    *dead = *count + ticks;
}

void host_wait_ticks(uint32_t ticks)
{
    uint32_t *count = (uint32_t *)GAME_ADDR(ORIG_TICKCOUNT);
    uint32_t until;
    if (intro_skip) ticks = 0;
    until = *count + ticks;
    while ((int32_t)(*count - until) < 0) ;
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
    install_flag_traps();
}
