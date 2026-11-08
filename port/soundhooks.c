/* NHL96_AUDIOLOG: log the arguments and results of the game's sound start-up routines (listing names), so a log shows which step
 * gives up. Each entry is patched with a jump to a small stub that logs, runs the displaced instructions and returns through a
 * second stub that logs EAX. Only with NHL96_AUDIOLOG=1; the routines are not re-entered, so one saved return address each is enough. */
#include "host.h"
#include "audio.h"
#include <string.h>
#ifdef _WIN32
#include <windows.h>
#else
#include <sys/mman.h>
#endif

void patch_jmp(void *from, void *to);

static const struct { uint32_t addr; int len; uint8_t first; const char *name; } hooks[] = {
    { 0x694B9, 6, 0x53, "sub_694B9 sound start (eax card, edx flag)" },
    { 0xC157F, 6, 0x53, "sub_C157F driver start (eax driver, edx)" },
    { 0xCEA3B, 8, 0x53, "sub_CEA3B SB driver init" },
    { 0xCEDDE, 8, 0x53, "sub_CEDDE SB Pro driver init" },
    { 0xCF2D8, 8, 0x53, "sub_CF2D8 SB16 driver init" },
    { 0xCE0A9, 6, 0x56, "sub_CE0A9 BLASTER parse" },
    { 0xCE2E8, 6, 0x52, "sub_CE2E8 DSP version" },
    { 0xAB798, 8, 0x56, "sub_AB798 DOS memory alloc" },
    { 0xCF59A, 9, 0x53, "sub_CF59A SB16 start" },
};
#define NH (sizeof hooks / sizeof hooks[0])
static uint32_t saved_ret[NH];

/* pushad frame: edi esi ebp esp ebx edx ecx eax, then the caller's return address and stack arguments */
void hook_enter(int i, uint32_t *f)
{
    alog("call %s: eax %x edx %x ebx %x ecx %x, stack %x %x %x, from %x", hooks[i].name, f[7], f[5], f[4], f[6], f[9], f[10], f[11],
         ORIG_FROM((void *)(uintptr_t)f[8]));
}

void hook_leave(int i, uint32_t *f)
{
    alog("  %s -> %d (%x)", hooks[i].name, (int)f[7], f[7]);
}

static uint8_t *emit32(uint8_t *p, uint32_t v) { memcpy(p, &v, 4); return p + 4; }
static uint8_t *emit_rel(uint8_t *p, uint8_t op, void *to) { *p++ = op; return emit32(p, (uint32_t)((uintptr_t)to - ((uintptr_t)p + 4))); }

static uint8_t *emit_call_logger(uint8_t *p, int i, void *fn)
{
    *p++ = 0x60; *p++ = 0x89; *p++ = 0xE0; *p++ = 0x50;          /* pushad; mov eax, esp; push eax */
    *p++ = 0x68; p = emit32(p, i);                               /* push i */
    p = emit_rel(p, 0xE8, fn);                                   /* call */
    *p++ = 0x83; *p++ = 0xC4; *p++ = 0x08; *p++ = 0x61;          /* add esp, 8; popad */
    return p;
}

void install_sound_hooks(void)
{
    uint8_t *mem, *p;
    unsigned i;
    if (!alog_on || sizeof(void *) != 4) return;
#ifdef _WIN32
    mem = VirtualAlloc(0, 4096, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
#else
    mem = mmap(0, 4096, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (mem == MAP_FAILED) mem = 0;
#endif
    if (!mem) return;
    p = mem;
    for (i = 0; i < NH; i++) {
        uint8_t *at = GAME_ADDR(hooks[i].addr), *entry, *ret;
        if (at[0] != hooks[i].first) { alog("hook %s: unexpected code %02x, not hooked", hooks[i].name, at[0]); continue; }
        ret = p;
        p = emit_call_logger(p, i, (void *)hook_leave);
        *p++ = 0xFF; *p++ = 0x35; p = emit32(p, (uint32_t)(uintptr_t)&saved_ret[i]);   /* push [saved] */
        *p++ = 0xC3;
        entry = p;
        p = emit_call_logger(p, i, (void *)hook_enter);
        *p++ = 0x8F; *p++ = 0x05; p = emit32(p, (uint32_t)(uintptr_t)&saved_ret[i]);   /* pop [saved] */
        *p++ = 0x68; p = emit32(p, (uint32_t)(uintptr_t)ret);                          /* push ret stub */
        memcpy(p, at, hooks[i].len); p += hooks[i].len;
        p = emit_rel(p, 0xE9, at + hooks[i].len);
        patch_jmp(at, entry);
    }
    alog("sound hooks installed");
}
