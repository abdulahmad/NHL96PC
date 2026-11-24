# Handoff

## Now

- Stage / unit: none open. The data re-cut by owner is merged (#40–#43); no auto names are left in `src/`.
- Branch: none. New work is a short branch off the current `main` and one PR into `main`.
- Port: SDL2 native port (`port/`, `make sdl2` -> `build/hockey-linux`) is on `main`, with Overbar in `port/overbar`. The port loads
  `lst/HOCKEY.EXE` and uses original addresses; the names in its comments follow `src/inc/symbols.inc`.
- Last check: `./build.sh` MATCH with NASM 2.15.05.
- Next: see `TODO.md` (front-end module boundaries); run the port with real game data.

## State (2026-11-24)

- The whole EXE is NASM source: 263 code files and 232 data files (objects 2 and 3 included); the LE fixup tables are regenerated
  from the labels. Only the extender parts and LE header fields come from the EXE. Details: docs/PLAN.md, docs/ASM_BUILD.md.
- 6,583 cross-file symbols, all named (FLIRT library names, NHL95PC matches, and the naming pass); no auto names are left.
- Every code file has a module name; the front-end boundaries are still provisional.

## Known facts

- Watcom C/C++32 10.0-family runtime, like NHL95PC. EACSNDF.LIB "32 Bit Sound Library - Build: Aug 28 1995". DOS/4GW Professional.
- Entry point `start` in object 1. Stack: top of object 4. Object 4 is file data to 0x151597, then BSS.
- 96 game code was compiled without stack checks; see docs/RULES.md (Learned).
- Code layout: front end 10010-2D9D9, engine 2D9D9-53260, front end 53260-A8B9B, libraries from A8B9B.

## Unsure / open

- Object 2 (52 bytes of 16-bit code: `push ax / push dx / mov al, 20h`, the Sound Blaster real-mode interrupt stub,
  `src/lib/sound/snd_sb_real_mode_isr.asm`) and object 3 (24 bytes starting 87 83 81 82, `src/data/lib/sound/snd_sb_dma_ports.asm`).
- Front-end module boundaries are provisional (docs/PLAN.md, decision 4).
