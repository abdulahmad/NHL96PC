#ifndef GAME_H
#define GAME_H
#include <stdint.h>

/* Original linear addresses of the LE objects (DOS/4GW). The host maps a copy
 * at game_image and applies the LE fixups for that load address. */
#define OBJ1_BASE     0x10000u
#define OBJ1_SIZE     0xD28A0u
#define OBJ2_BASE     0xF0000u
#define OBJ2_SIZE     0x34u
#define OBJ3_BASE     0x100000u
#define OBJ3_SIZE     0x18u
#define OBJ4_BASE     0x110000u
#define OBJ4_SIZE     0x99260u
#define GAME_SPAN     (OBJ4_BASE + OBJ4_SIZE - OBJ1_BASE)

#define ORIG_START         0xB6308u
#define ORIG_INITRTNS      0xC5A48u
#define ORIG_CMAIN         0xC59F8u
#define ORIG_HOOK387       0xD5666u
#define ORIG_UNHOOK387     0xD5730u
#define ORIG_SETENVP       0xD7C08u
#define ORIG_SETDEADLINE   0xDFEE1u
#define ORIG_WAITTICKS     0xDFF0Fu
#define ORIG_VIDSAVE       0xE2484u
#define ORIG_VIDRESTORE    0xE24C4u
#define ORIG_TICKCOUNT     0x11F9A4u
#define ORIG_TICKDEADLINE  0x11F8DCu
#define ORIG_CMDLINE       0x1A1258u
#define ORIG_CRT_ESP       0x124410u
#define ORIG_CRT_ESP2      0x1243FCu
#define ORIG_CRT_ESP3      0x1243F8u
#define ORIG_CRT_SEL       0x124408u
#define ORIG_CRT_CMD       0x124414u
#define ORIG_CRT_CMDEND    0x12440Cu
#define ORIG_CRT_CMDLINAL  0x124400u
#define ORIG_CRT_DOSMAJ    0x124433u
#define ORIG_CRT_DOSMIN    0x124434u
#define ORIG_CRT_IS4G      0x12442Au
#define ORIG_CRT_FLAT      0x12442Bu
#define ORIG_CRT_ENV       0x12442Du
#define ORIG_CRT_ENVSEL    0x124431u
#define ORIG_CRT_NO87      0x124428u
/* Below 1 MB: the command line and the environment strings the C library keeps pointers into, then the DOS memory pool
 * (dos.c). The pool must not overlap them: the game takes all the DOS memory it can get and writes over it, which erased the
 * environment, so the sound driver's getenv("BLASTER") found nothing and the game started without sound. */
#define LOW_CMDLINE        0x20000u
#define LOW_ENVBLOCK       0x22000u
#define LOW_DOS_POOL       0x24000u
#define ORIG_SND_CARD      0x11D1DAu  /* dword_11D1DA: the sound driver sub_694B9 started (-1: none) */
#define ORIG_SND_DRIVER    0x1248CCu  /* dword_1248CC: the driver table index sub_C157F made current (0: none) */
#define ORIG_SND_FLAGS     0x11D1DEu  /* dword_11D1DE: the sound code's state bits */
#define ORIG_TIMER_LIST    0x18566Cu  /* dword_18566C: the 8 callbacks the timer interrupt (sub_AA5C4) calls */
#define ORIG_CFG_SOUND     0x17CA1Cu  /* dword_17CA1C: GLOBAL.SET options (bits 0-2 the card) */
#define ORIG_GETDS_SEL     0xB65DDu   /* __GETDS: mov ds, cs:[this word] (interrupt handlers) */

extern uint8_t *game_image;            /* mapped bytes for orig OBJ1_BASE .. end */
extern int32_t game_slide;             /* runtime_addr - original_linear */
extern uint8_t *game_code;             /* start of object 1 in the map */
extern uint32_t game_code_size;

#define GAME_ADDR(orig) ((uint8_t *)((uintptr_t)(orig) + (uintptr_t)game_slide))
#define ORIG_FROM(p)    ((uint32_t)((uintptr_t)(p) - (uintptr_t)game_slide))
#define IN_GAME_CODE(p) ((uintptr_t)(p) >= (uintptr_t)game_code && (uintptr_t)(p) < (uintptr_t)game_code + game_code_size)

int game_load(void);                   /* map the LE objects of HOCKEY.EXE */
const char *game_exe_path(void);

#endif
