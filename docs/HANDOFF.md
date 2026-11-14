# Handoff

## Now

- Branch: `fable-work`. Do not merge to main.
- Last check: `./build.sh` MATCH (2026-11-14), `update_symbols.py --check` up to date.
- Next: queue row 0, `src/engine/logic/logic.asm` (SEGMENT_AGENT.md).

## State (2026-11-14)

- The whole EXE is NASM source: 112 code files, 134 data files, `cseg02` and `dseg03`; the LE fixup tables are regenerated
  from the labels. Only the extender parts and LE header fields come from the EXE. Details: docs/PLAN.md, docs/ASM_BUILD.md.
- 7,845 cross-file symbols, 297 named: FLIRT library names (source WATCOM), the discovery thread's names (new), and the
  trustworthy NHL95PC matches (95PC; `medium` rows are behaviour matches to confirm).
- 78 code files follow an NHL95PC module by matching, 8 are named by theme, 25 are placeholders named by address.

## Known facts

- Watcom C/C++32 10.0-family runtime, like NHL95PC. EACSNDF.LIB "32 Bit Sound Library - Build: Aug 28 1995". DOS/4GW Professional.
- Entry point `start` in object 1. Stack: top of object 4. Object 4 is file data to 0x151597, then BSS.
- 96 game code was compiled without stack checks; see docs/RULES.md (Learned).
- Code layout: front end 10010-2D9D9, engine 2D9D9-53260, front end 53260-A8B9B, libraries from A8B9B.

## Unsure / open

- Object 2 (52 bytes of 16-bit code: `push ax / push dx / mov al, 20h`, an interrupt stub) and object 3 (24 bytes starting
  87 83 81 82): named after their objects for now.
- Front-end module boundaries are provisional (docs/PLAN.md, decision 4).
