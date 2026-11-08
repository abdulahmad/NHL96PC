# SDL2 port (branch `sdl2-port`)

The game runs through SDL2 on Linux and on Windows without changing the byte-exact sources in `src/`. `make sdl2` links the host in
`port/` into `build/hockey-linux`, a 32-bit Linux program. `make sdl2-win` (or `port/setup-win.sh`) does the same with mingw-w64 into
`build/win/hockey-win32.exe`. Both run the same host code; only `port/plat_linux.c` and `port/plat_win.c` differ.

`src/` is still only incbin (no C matching). The host does **not** ELF-link the NASM sources: those pages are unfixed LE objects.
`port/le_load.c` loads retail `lst/HOCKEY.EXE` (or `NHL96_EXE`), maps the four LE objects at `0x20000000` so they do not overlap the
VGA window at `0xA0000`, and applies the type-7/6/8 fixups. Watcom `start` is skipped (selector `0x24` / `ES:0x5C`); the host fills
the CRT variables and calls `__InitRtns` / `__CMain` like the 95 port.

`./build.sh` still prints `MATCH`. `main` still only takes byte-identical changes; this branch adds `port/`, this file and the `sdl2`
target.

## How it works

The game is a flat 32-bit program written for DOS/4GW. It does four things Linux does not allow, and the host answers each:

| the game does | the host |
|---|---|
| `int 21h`, `int 31h`, `int 10h`, `int 33h`, `int 16h`, `int 2Fh` | the instruction faults (SIGSEGV); `port/emu.c` decodes it and `port/dos.c` / `port/video.c` / `port/input.c` answer like DOS, DPMI, the VESA BIOS and the mouse driver (files are opened below `$NHL96_ROOT`, default the current directory) |
| `in` / `out`, `cli` / `sti` | the same fault; `port/ports.c` has the VGA DAC, retrace bit, PIT, keyboard, speaker and joystick ports |
| hooks IRQ 0 (timer) and IRQ 1 (keyboard) | `port/irq.c`: the main thread signals the game thread; the tick rate follows the PIT divisor |
| draws into the VGA window at `0xA0000` and switches banks with `int 10h 4F05h` | `port/video.c` keeps the whole frame buffer and the main thread turns it into an SDL texture |

Threads: the main thread owns SDL; the game runs in a second thread. Signal handlers use their own stack because the game's `esp` is
not aligned for the C library.

Routines that cannot work here are replaced at their entry (`port/overrides.c`): the floating-point emulator hook, video mode save
and restore, and the tick wait used to skip the intro. `pushf` / `popf` in object 1 (`port/flagops.h`) become `int3` so `vif` tracks
the interrupt flag.

DOS memory (`0x10000`-`0xFFFFF`) is mapped at the same addresses. DPMI blocks are placed below 2 GB (the Watcom heap compares
addresses as signed numbers) and at most 32 MB each.

## Build and run (Linux)

The host menu, overlay and scaler are [Overbar](https://github.com/abdulahmad/overbar), the git submodule `port/overbar`:
clone with `--recurse-submodules`, or run `git submodule update --init` once after a plain clone. The build scripts
read Overbar's file list from `port/overbar/sources.txt`.

```
# or: port/setup.sh /path/to/game/files
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install gcc-multilib g++-multilib libsdl2-dev:i386 nasm make python3 pkg-config
make sdl2
cd /path/to/NHL96/game/files        # the directory with the installed game data
/path/to/NHL96PC/build/hockey-linux # or NHL96_ROOT=/path/to/game/files
```

The host also needs `lst/HOCKEY.EXE` (committed for now) or `NHL96_EXE`. The game's data files are not in this repository.

## Windows

```
port/setup-win.sh                    # from Linux or WSL
# or, in an MSYS2 "MINGW32" shell:
pacman -S --needed mingw-w64-i686-gcc mingw-w64-i686-SDL2 mingw-w64-i686-pkgconf nasm make python
port/build-win.sh
```

The result is `build/win/hockey-win32.exe` and `SDL2.dll`. Run it in the folder with the game's data, or set `NHL96_ROOT`.

## Online play

Overbar's Online page (`` ` `` or F11, then Online) hosts or joins; then both players start a new game from the menus. The host's
teams, options, controller slots and random seeds go to the guest, slot 0 plays the host's team and slot 1 the other, each machine
reading its own controller. It plays with rollback (Overbar's `overbar/net.h` and `overbar/rollback.h`, the session glue in
`overbar/netgame.h`); `port/netplay.c` is the game's part:

- each pass of the game loop (sub_17025) is one step: its "is there an input record?" (170A5) asks netplay.c, which makes the
  record from every machine's buttons (32 bits a slot, two Overbar pads) with 4 ticks; the record timer (sub_16C4D) does nothing;
- the game's clock (tickcount, 11F9A4) counts 4 a step from the first step, not the timer interrupt's ticks;
- a state is the game's image and DOS / DPMI memory (write-watched on Windows) without the live keyboard and stick input, plus the
  game thread's stack; a wrong guess loads one and plays the steps since again, with nothing shown;
- online there are no menus from the loop (pre-game menu, pause, instant replay), no intermission and no direct hot keys.

Test aid (two copies on one machine): `NHL96_ONLINE=host` and `NHL96_ONLINE=join` (port `NHL96_PORT`, default 41960),
`NHL96_NETSIM=delay,jitter,loss%`, `NHL96_AUTOPAD=1` (made-up buttons), `NHL96_REGIONS=1` (per-region hashes every 200 steps in
the log), `NHL96_SOUND=none` (the sound cards are not in the states yet).

## Diagnostics

`NHL96_TRACE=1` logs interrupts and port accesses. `NHL96_STATS=1` prints trap counts every 2 s. `NHL96_SOUNDTEST=1` drives each
emulated sound device and exits (no EXE required). `NHL96_KEYS`, `NHL96_DUMP`, `NHL96_MT32_ROMS`, `NHL96_SOUND=none` match the 95
port. `port/where.py ADDR` maps a runtime address (load at `0x20000000`) back to the original linear address.

## Layout vs 94 / 95

NHL95PC ELF-links the NASM objects and runs them in place. NHL94PC is 16-bit and uses libx86emu. NHL96PC is 32-bit LE like 95, but
the sources are still incbin, so this port uses 95's trap host plus 94's idea of loading the EXE.
