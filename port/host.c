/* SDL2 host for the NHL 96 PC rebuild. The original 32-bit game code (the LE
 * objects of HOCKEY.EXE) runs unchanged as a thread of this program. Instructions
 * that only DOS or the PC hardware could execute (int n, in, out, cli, sti) fault;
 * the platform layer hands them to the emulation here. The main thread owns SDL. */
#include "host.h"
#include "audio.h"
void sound_init(void);
#include <SDL.h>

int trace_on;
static int g_argc;
static char **g_argv;

void sndinit_test(void);
void game_run(int argc, char **argv)
{
    if (getenv("NHL96_SNDINIT")) sndinit_test();
    host_cstart(argc, argv);
    __asm__ volatile(
        "movl $0xFF, %%eax\n\t"
        "call *%0\n\t"
        "xorl %%ebp, %%ebp\n\t"
        "call *%1"
        :
        : "r"(GAME_ADDR(ORIG_INITRTNS)), "r"(GAME_ADDR(ORIG_CMAIN))
        : "eax", "edx", "ecx", "ebp", "memory");
    host_exit(0);
}

/* NHL96_SNDINIT=1: after the C library start-up, call the game's getenv_ (C2CF7) for BLASTER, its BLASTER parser (sub_CE0A9) and the
 * sound start (sub_C157F with the driver sub_694B9 picks for the card in GLOBAL.SET), log what they return, and exit. */
static uint32_t gcall(uint32_t fn, uint32_t a, uint32_t d, uint32_t b, uint32_t c)
{
    uint32_t r;
    __asm__ volatile("push %%ebp\n\tcall *%5\n\tpop %%ebp" : "=a"(r), "+d"(d), "+b"(b), "+c"(c) : "0"(a), "r"(GAME_ADDR(fn)) : "esi", "edi", "memory", "cc");
    return r;
}

void sndinit_test(void)
{
    static char name[] = "BLASTER";
    static int32_t v[4];
    uint32_t r;
    host_cstart(g_argc, g_argv);
    __asm__ volatile("movl $0xFF, %%eax\n\tcall *%0" : : "r"(GAME_ADDR(ORIG_INITRTNS)) : "eax", "edx", "ecx", "ebx", "esi", "edi", "memory");
    r = gcall(0xC2CF7, (uint32_t)(uintptr_t)name, 0, 0, 0);
    alog("sndinit: environ %08x, getenv(BLASTER) -> %08x %s", *(uint32_t *)GAME_ADDR(0x14F09Cu), r, r ? (char *)(uintptr_t)r : "(null)");
    printf("getenv(BLASTER) -> %s\n", r ? (char *)(uintptr_t)r : "(null)");
    r = gcall(0xCE0A9, (uint32_t)(uintptr_t)&v[0], (uint32_t)(uintptr_t)&v[1], (uint32_t)(uintptr_t)&v[2], (uint32_t)(uintptr_t)&v[3]);
    printf("parse -> %d: A %x I %d D %d H %d\n", (int)r, v[0], v[1], v[2], v[3]);
    alog("sndinit: sub_CE0A9 -> %d A %x I %d D %d H %d", (int)r, v[0], v[1], v[2], v[3]);
    {
        const char *c = getenv("NHL96_SNDINIT");
        int drv = atoi(c) > 1 ? atoi(c) : 5;
        r = gcall(0xC157F, drv, 0xFFFFFFFFu, 0, 0);
        printf("driver %d init -> %d, current driver %d\n", drv, (int)r, *(int32_t *)GAME_ADDR(ORIG_SND_DRIVER));
        printf("image at %p; sb16: version %x, dmabuf %08x/%08x, buffer len %d\n", (void *)GAME_ADDR(0x10000), *(int32_t *)GAME_ADDR(0x1A107Cu),
               *(uint32_t *)GAME_ADDR(0x1A1078u), *(uint32_t *)GAME_ADDR(0x14F05Cu), *(int32_t *)GAME_ADDR(0x1A105Cu));
        alog("sndinit: sub_C157F(%d) -> %d, dword_1248CC %d", drv, (int)r, *(int32_t *)GAME_ADDR(ORIG_SND_DRIVER));
    }
    fflush(stdout);
    host_exit(0);
}

void game_args(int *argc, char ***argv)
{
    *argc = g_argc;
    *argv = g_argv;
}

extern volatile int intro_skip;

int main(int argc, char **argv)
{
    int64_t next_tick, next_frame;
    g_argc = argc; g_argv = argv;
    trace_on = getenv("NHL96_TRACE") != 0;
    stats_init();
    SDL_SetMainReady();
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS | SDL_INIT_AUDIO | SDL_INIT_JOYSTICK | SDL_INIT_GAMECONTROLLER) < 0) { fprintf(stderr, "SDL_Init: %s\n", SDL_GetError()); return 1; }
    video_init();
    input_init();
    sound_init();
    if (map_low_memory()) fprintf(stderr, "cannot map DOS memory below 1 MB\n");
    if (getenv("NHL96_SOUNDTEST")) { extern int soundtest(void); return soundtest(); }
    dos_default_config();
    if (game_load()) return 1;
    plat_make_image_writable();
    install_overrides();
    plat_install_traps();
    if (getenv("NHL96_CRASHTEST")) { volatile int *p = 0; *p = 1; }
    plat_start_game();

    next_tick = next_frame = plat_now_ns();
    for (;;) {
        int64_t now = plat_now_ns();
        input_poll();
        if (video_vrr()) {
            if (video_changed() || now >= next_frame) { video_present(); next_frame = now + 100000000LL; }
        } else if (now >= next_frame) {
            video_present();
            next_frame += video_present_ns();
            if (now - next_frame > 100000000) next_frame = now;
        }
        while (now >= next_tick) {
            irq_raise(0);
            next_tick += 1000000000LL / irq_pit_hz() / (intro_skip ? 20 : 1);
            if (now - next_tick > 200000000) { next_tick = now; break; }
        }
        sb_pump();
        gus_pump();
        if (mpu_roms_missing())
            SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_WARNING, "NHL Hockey 96",
                "The MT-32 is selected, but its ROM images were not found, so there will be no sound.\n\n"
                "Put MT32_CONTROL.ROM and MT32_PCM.ROM in a folder named roms next to the program (or in the game folder), "
                "or set NHL96_MT32_ROMS to the folder that has them.", 0);
        audio_pump();
        irq_poll();
        stats_report();
        plat_sleep_ms(1);
    }
    return 0;
}
