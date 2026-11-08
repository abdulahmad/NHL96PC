/* The part of the Watcom start-up that depends on DOS/4GW: selectors for the
 * PSP and environment. The host fills the same CRT variables for a flat process
 * and then runs __InitRtns / __CMain (host.c) as the original start would. */
#include "host.h"
#include "audio.h"

static char envblock[4096];

static void store16(uint32_t orig, uint16_t v) { memcpy(GAME_ADDR(orig), &v, 2); }
static void store32(uint32_t orig, uint32_t v) { memcpy(GAME_ADDR(orig), &v, 4); }

static void build_environment(const char *program)
{
    char *p = envblock;
    static const char *const pass[] = { "PATH", "TEMP", "TMP", "NO87", "BLASTER", "ULTRASND", "ULTRADIR", "NHL96_SOUND", 0 };
    int i;
    const char *none = getenv("NHL96_SOUND");
    for (i = 0; pass[i]; i++) {
        const char *v = getenv(pass[i]);
        if (!v && !(none && !strcmp(none, "none"))) {
            if (!strcmp(pass[i], "BLASTER")) v = DEFAULT_BLASTER;
            if (!strcmp(pass[i], "ULTRASND")) v = DEFAULT_ULTRASND;
        }
        if (v) p += sprintf(p, "%s=%s", pass[i], v) + 1;
    }
    *p++ = 0;
    *p++ = 1;
    *p++ = 0;
    sprintf(p, "C:\\NHL96\\%s", program);
}

void host_cstart(int argc, char **argv)
{
    char *dst = (char *)GAME_ADDR(ORIG_CMDLINE);
    char *cmd, *e;
    int i, no87 = 0;
    uint16_t ds;
    uint32_t espv;
    __asm__ volatile("mov %%ds, %0" : "=r"(ds));
    __asm__ volatile("mov %%esp, %0" : "=r"(espv));
    espv &= ~3u;
    store16(ORIG_CRT_SEL, ds);
    store16(ORIG_CRT_ENVSEL, ds);
    store16(ORIG_GETDS_SEL, ds);
    store32(ORIG_CRT_ESP, espv);
    store32(ORIG_CRT_ESP2, espv);
    store32(ORIG_CRT_ESP3, espv);
    GAME_ADDR(ORIG_CRT_DOSMAJ)[0] = 5;
    GAME_ADDR(ORIG_CRT_DOSMIN)[0] = 0;
    GAME_ADDR(ORIG_CRT_IS4G)[0] = 1;
    GAME_ADDR(ORIG_CRT_FLAT)[0] = 0;

    build_environment("HOCKEY.EXE");
    memcpy((void *)0x32000, envblock, sizeof envblock);
    store32(ORIG_CRT_ENV, 0x32000);

    /* Watcom __CMain treats the command-line pointer as an alloca size compared
     * with (esp - cmdend). Relocated object-4 addresses are ~500 MB, which
     * subtracts the pthread stack into unmapped memory. Keep these pointers in
     * the DOS hole below 1 MB, like the 95 port's original-address image. */
    dst = (char *)0x30000;
    memset(dst, 0, 0x1000);
    dst = (char *)(((uintptr_t)dst + 0xF) & ~0xFu);
    store32(ORIG_CRT_CMDLINAL, (uint32_t)(uintptr_t)dst);
    cmd = dst;
    for (i = 1; i < argc; i++) {
        if (i > 1) *cmd++ = ' ';
        cmd += sprintf(cmd, "%s", argv[i]);
    }
    *cmd++ = 0;
    *cmd++ = 0;
    cmd--;
    for (e = envblock; *e; e += strlen(e) + 1) {
        if (!strncasecmp(e, "no87=", 5)) no87++;
    }
    e += 1 + 2;
    strcpy(cmd, e);
    cmd += strlen(e) + 1;
    store16(ORIG_CRT_NO87, (uint16_t)no87);
    store32(ORIG_CRT_CMDEND, (uint32_t)(uintptr_t)cmd);
    store32(ORIG_CRT_CMD, (uint32_t)(uintptr_t)dst);
    /* FS/ES must be a usable data selector: Watcom start copies DS into the CRT
     * selector words and the C library then does `mov fs, [word]; mov es, fs`.
     * Loaded last: on Windows FS is the thread's TEB, and the C runtime calls above
     * (getenv's exception frame reads fs:0) crash once it holds DS. */
    __asm__ volatile("mov %0, %%fs" :: "r"(ds) : "memory");
    __asm__ volatile("mov %0, %%es" :: "r"(ds) : "memory");
}
