# NHL 96 PC segment agent

This file is the queue. Do not rewrite it as a whole file. Edit the current row in place.
(Adapted from NHL95PC's SEGMENT_AGENT.md; the plan and its reasons are in docs/PLAN.md.)

## Current rules (Nov 2026)

This repo is a **disassembly only**: labelled 32-bit x86 assembly that reassembles byte-identical with NASM. No C decompilation and no
compiler matching.

Naming lineage: 92G -> 93G -> 94G -> 95G -> 96G; 94PC -> **95PC -> 96PC** (96PC from 95PC plus the 96G features).
- Name priority, matched by purpose (calls, constants, structure fields, strings, what the code does), not identical code:
  1. the **NHL95PC** name (its names already carry 93G/94G provenance), else
  2. the **NHL96Genesis** name for 96 features (96G names trace back through 95G, 94G), else
  3. Watcom C runtime and EACSNDF/EACLIB library names (as NHL95PC names them), else
  4. a name from what the code clearly does, with the evidence in `docs/name_map.csv`.
- Earlier games' names win: a 96G name inherited from 92G-95G beats a 95PC name that 95PC made up from behaviour.
- Clash rule: the earliest game's meaning keeps a name; the later item gets a new one. Never reuse a name for a different item.
- Casing: keep the source game's casing exactly. Watcom register-call symbols keep their trailing underscore where 95PC uses it.
- No guessing: a wrong name is worse than an auto name. Unsure items go under Unsure in `docs/HANDOFF.md`.

Source style (same as the sibling repos):
- No rename-history, provenance or origin-tag comments ("was X", "from 93G", "renamed"). That history lives in `docs/name_map.csv` only.
- No hardcoded addresses in comments you write, and no hand-kept derived counts the assembler can compute. (Instruction lines carry no
  address since the 2026-11-15 cleanup: `python3 tools/build/asmaddr.py ADDR|FILE:LINE|LABEL` and `--show FILE` give it.)
- Never write an address where a label works: pointers, table offsets and sizes are label expressions.
- No macros, except `LD` (src/inc/x86enc.inc, see docs/ASM_BUILD.md). Plain instructions and data directives only.
- Local labels in 92 style: `.loop`, `.next`, `.done`, `.exit`, and plain numbers for trivial jumps.
- Every routine gets a header comment (what, args, result). File headers are short plain-English stories of what the file does.
- Comment layout as in NHL94SNES CONTRIBUTING.md (tabs, trailing comments at column 36, 110 columns).

## Current segment

Queue row 0: `src/engine/logic/logic.asm`. <- CURRENT

## Sources

- Source of truth: `src/`. Search `src/` for an address to find its line. Do not run `tools/build/gen_src.py` on `src/`: it regenerates
  the tree and throws away every name and comment (it refuses without `--force`).
- Reference EXE `lst/HOCKEY.EXE` and Abdul's IDA listing `lst/HOCKEY.EXE.lst` (your own copies, gitignored, not in the repo). The listing is a
  reference for cross-references and IDA's view of a routine; never edit it, and the build never reads it. Its addresses are the
  linear addresses in `src/` (`cseg02` is printed as offsets: add 0xF0000; 233 library functions are collapsed).
- Name evidence:
  - `docs/name_map.csv`: one row per named address (`address,name,auto_name,source,confidence,evidence,file`). Rows with source
    `95PC` and confidence `medium` are behaviour matches: re-read the routine against NHL95PC before trusting the name.
  - `tools/names/match95.csv`: every candidate match to NHL95PC (function and data), with method, score and evidence. Rows that
    were not imported are leads, not names.
  - NHL95PC (https://github.com/abdulahmad/NHL95PC): `src/` (same file path where this repo's file follows a 95 module),
    `src/inc/symbols.inc`, `src/inc/structs.inc`, `docs/name_map.csv`. A local checkout works the same; search it with `rg`.
  - NHL96Genesis (https://github.com/abdulahmad/NHL96Genesis) for 96 features.
  - `docs/FEATURES.md`: what the discovery pass found (input slots, line changes, goalie pull).
- Layout and build: `docs/ASM_BUILD.md`, `EXE_SEGMAP96PC.md`, `segmap96pc.json`.

## Lineage notes for 96

- 96 was compiled without Watcom stack checks (no `push N / call __CHK` prologue), so game code differs from 95 byte for byte even
  where the C was the same. Match by behaviour: the same calls in the same order, the same constants and structure offsets.
- The libraries (Watcom runtime, EA memory/shape/file libraries, EACSNDF and its drivers, keyboard/mouse/joystick, VGA) are largely
  byte-identical to 95 and already carry its names where 95 has them.
- The engine (2D9D9-53260) follows the 95 modules in the same order. The front end is mostly new in 96 (menu text is not in the EXE).

## Build

```
./build.sh          # needs nasm, python3; the last line must be MATCH: build/HOCKEY.EXE is byte-identical ...
```
A file that assembles to a different size is a link error. An undefined or duplicate symbol is a link error too. Only a build made
this session counts. After the file's last change also run `python3 tools/build/update_symbols.py --check` (must say up to date;
`rename_symbol.py` keeps it current).

## Tools

- `python3 tools/names/auto_names.py <module>`: what is still to name in a file (auto names defined in it must reach 0; auto data
  names it uses; auto code names it calls elsewhere; `[reg+NNh]` operands without a field name). `--summary` for every file.
- `python3 tools/names/rename_symbol.py OLD NEW --evidence "..." --source 95PC|96G|...|new [--confidence medium]`: renames
  everywhere, rebuilds (must MATCH, else everything is restored) and records the row. `NEW` starting with `.` makes a local label.
  `--batch file` for many renames with one build. Never rename by search and replace.
- After a file is done: re-run the matcher (commands in `tools/names/match95.py`), so the names just confirmed become anchors.

## One session, one file

1. `./build.sh` must print MATCH before you change anything. If it does not, stop and report.
2. Take the CURRENT queue row. Read the file top to bottom next to its NHL95PC counterpart (same path) if it has one.
3. For each routine: confirm or correct an imported name, or name it by the priority above; rename its `loc_` labels to locals;
   name the data it owns; write the header comment. Use `rename_symbol.py` for every rename.
4. A placeholder file (`front_<ADDR>`, `engine_<ADDR>`, `lib_<ADDR>`): once its purpose is clear, give it a module name and folder
   (the NHL95PC module name if it does the same job): rename the file, its `segments.txt` line and its `segmap96pc.json` entry in
   one commit. If it holds two modules, note the boundary in `docs/HANDOFF.md`; do not split inside an atom
   (`tools/build/module_atoms.py`).
5. MATCH after each batch. Small commits, pushed to `fable-work`. Never force-push.
6. Mark the row (`done`, or `partial` with what is left), move CURRENT to the next row, update `docs/HANDOFF.md`.
7. Stop after 5 failed builds in a row and report the file, the first differing address, built and retail bytes, and the line.

## Queue

Order: engine files that follow an NHL95PC module, the other engine files, named front-end files, placeholder front-end files,
libraries. `Auto` is the number of auto names defined in the file on 2026-11-14.

| # | File | Range | Bytes | Auto | Note | State |
|---|---|---|---|---|---|---|
| 0 | `src/engine/logic/logic.asm` | 313D2-38070 | 6C9E | 1019 | NHL95PC module (matched functions) | todo |
| 1 | `src/engine/input/input.asm` | 38070-3A7A4 | 2734 | 326 | NHL95PC module (matched functions) | todo |
| 2 | `src/engine/faceoff/faceoff.asm` | 3A7A4-3E6EC | 3F48 | 542 | NHL95PC module (matched functions) | todo |
| 3 | `src/engine/collide/collide.asm` | 3E6EC-465BA | 7ECE | 1031 | NHL95PC module (matched functions) | todo |
| 4 | `src/engine/hockey/hockey.asm` | 465BA-4B7BB | 5201 | 762 | NHL95PC module (matched functions) | todo |
| 5 | `src/engine/skate/skate.asm` | 4B7BB-4DED8 | 271D | 412 | NHL95PC module (matched functions) | todo |
| 6 | `src/engine/gamelog/gamelog.asm` | 4F453-50154 | D01 | 64 | goal and penalty log lines; holds a matched NHL95PC gamelog function | todo |
| 7 | `src/engine/penalty/penalty.asm` | 50154-51F18 | 1DC4 | 251 | NHL95PC module (matched functions) | todo |
| 8 | `src/engine/lines/lines.asm` | 51F18-54519 | 2601 | 366 | NHL95PC module (matched functions) | todo |
| 9 | `src/engine/engine_2D9D9.asm` | 2D9D9-313D2 | 39F9 | 440 | placeholder | todo |
| 10 | `src/engine/engine_4DED8.asm` | 4DED8-4F453 | 157B | 84 | placeholder | todo |
| 11 | `src/front/main/main.asm` | 186DC-201CD | 7AF1 | 815 | holds main_ (FLIRT); startup, CDSTREAM, asset loading | todo |
| 12 | `src/front/rink_model/rink_model.asm` | 22522-2A692 | 8170 | 699 | rink and stands model parts by name (zamboni, glass, boards, crowd) | todo |
| 13 | `src/front/replay_controls/replay_controls.asm` | 54519-584A0 | 3F87 | 345 | replay control buttons (rew, play, fwd, camera); 95PC module name | todo |
| 14 | `src/front/pause_menu/pause_menu.asm` | 6A891-6E233 | 39A2 | 349 | pause menu buttons (PAUSREG, quit, return, replay, controls, stats) | todo |
| 15 | `src/front/modem_setup/modem_setup.asm` | 711ED-741BD | 2FD0 | 209 | modem setup screens (Generic Hayes-Compatible, tone/pulse) | todo |
| 16 | `src/front/calendar/calendar.asm` | 7D580-7FF7F | 29FF | 101 | Month Choice / Calendar Choices; 95PC module name | todo |
| 17 | `src/front/playoff/playoff.asm` | A4FD7-A8B9B | 3BC4 | 349 | PLAYOFF.NDX, series length buttons; 95PC module name | todo |
| 18 | `src/front/front_10010.asm` | 10010-1456D | 455D | 489 | placeholder | todo |
| 19 | `src/front/front_1456D.asm` | 1456D-186DC | 416F | 323 | placeholder | todo |
| 20 | `src/front/front_201CD.asm` | 201CD-22522 | 2355 | 173 | placeholder | todo |
| 21 | `src/front/front_2A692.asm` | 2A692-2D9D9 | 3347 | 293 | placeholder | todo |
| 22 | `src/front/front_584A0.asm` | 584A0-5D993 | 54F3 | 503 | placeholder | todo |
| 23 | `src/front/front_5D993.asm` | 5D993-64F59 | 75C6 | 875 | placeholder | todo |
| 24 | `src/front/front_64F59.asm` | 64F59-67000 | 20A7 | 242 | placeholder | todo |
| 25 | `src/front/front_67000.asm` | 67000-6A891 | 3891 | 536 | placeholder | todo |
| 26 | `src/front/front_6E233.asm` | 6E233-711ED | 2FBA | 166 | placeholder | todo |
| 27 | `src/front/front_741BD.asm` | 741BD-77642 | 3485 | 196 | placeholder | todo |
| 28 | `src/front/front_77642.asm` | 77642-794FF | 1EBD | 138 | placeholder | todo |
| 29 | `src/front/front_794FF.asm` | 794FF-7D580 | 4081 | 324 | placeholder | todo |
| 30 | `src/front/front_7FF7F.asm` | 7FF7F-81EEA | 1F6B | 248 | placeholder | todo |
| 31 | `src/front/front_81EEA.asm` | 81EEA-849D5 | 2AEB | 230 | placeholder | todo |
| 32 | `src/front/front_849D5.asm` | 849D5-88E09 | 4434 | 335 | placeholder | todo |
| 33 | `src/front/front_88E09.asm` | 88E09-8C3DD | 35D4 | 300 | placeholder | todo |
| 34 | `src/front/front_8C3DD.asm` | 8C3DD-90879 | 449C | 366 | placeholder | todo |
| 35 | `src/front/front_90879.asm` | 90879-93E6A | 35F1 | 409 | placeholder | todo |
| 36 | `src/front/front_93E6A.asm` | 93E6A-971E9 | 337F | 333 | placeholder | todo |
| 37 | `src/front/front_971E9.asm` | 971E9-9CFE3 | 5DFA | 547 | placeholder | todo |
| 38 | `src/front/front_9CFE3.asm` | 9CFE3-A17D5 | 47F2 | 466 | placeholder | todo |
| 39 | `src/front/front_A17D5.asm` | A17D5-A4FD7 | 3802 | 187 | placeholder | todo |
| 40 | `src/lib/watcom/watcom_begtext.asm` | 10000-10010 | 10 | 1 | Watcom ___begtext | todo |
| 41 | `src/lib/lib_A8B9B.asm` | A8B9B-A9CB3 | 1118 | 86 | placeholder | todo |
| 42 | `src/lib/watcom/watcom_clib_01.asm` | A9CB3-AA5C4 | 911 | 109 | NHL95PC module (matched functions) | todo |
| 43 | `src/lib/ea/ea_timer.asm` | AA5C4-AA988 | 3C4 | 28 | NHL95PC module (matched functions) | todo |
| 44 | `src/lib/ea/ea_gfx_01.asm` | AA988-AB834 | EAC | 82 | NHL95PC module (matched functions) | todo |
| 45 | `src/lib/ea/ea_memman.asm` | AB834-AC9F0 | 11BC | 139 | NHL95PC module (matched functions) | todo |
| 46 | `src/lib/ea/ea_fileblock_01.asm` | AC9F0-ACED8 | 4E8 | 36 | NHL95PC module (matched functions) | todo |
| 47 | `src/lib/ea/ea_debug_01.asm` | ACED8-AD680 | 7A8 | 59 | NHL95PC module (matched functions) | todo |
| 48 | `src/lib/ea/ea_gfx_02.asm` | AD680-ADC18 | 598 | 52 | NHL95PC module (matched functions) | todo |
| 49 | `src/lib/watcom/watcom_clib_02.asm` | ADC18-AEE40 | 1228 | 72 | NHL95PC module (matched functions) | todo |
| 50 | `src/lib/ea/ea_unpack.asm` | AEE40-B03F2 | 15B2 | 154 | NHL95PC module (matched functions) | todo |
| 51 | `src/lib/watcom/watcom_clib_03.asm` | B03F2-B2158 | 1D66 | 273 | NHL95PC module (matched functions) | todo |
| 52 | `src/lib/ea/ea_window.asm` | B2158-B2200 | A8 | 4 | NHL95PC module (matched functions) | todo |
| 53 | `src/lib/watcom/watcom_clib_04.asm` | B2200-B22E0 | E0 | 5 | NHL95PC module (matched functions) | todo |
| 54 | `src/lib/ea/ea_fileblock_02.asm` | B22E0-B2B30 | 850 | 55 | NHL95PC module (matched functions) | todo |
| 55 | `src/lib/ea/ea_gfx_03.asm` | B2B30-B2C98 | 168 | 9 | NHL95PC module (matched functions) | todo |
| 56 | `src/lib/watcom/watcom_clib_05.asm` | B2C98-B7410 | 4778 | 621 | NHL95PC module (matched functions) | todo |
| 57 | `src/lib/ea/ea_gfx_04.asm` | B7410-B75A0 | 190 | 11 | NHL95PC module (matched functions) | todo |
| 58 | `src/lib/ea/ea_shpi_01.asm` | B75A0-BA3D0 | 2E30 | 233 | NHL95PC module (matched functions) | todo |
| 59 | `src/lib/ea/ea_gfx_05.asm` | BA3D0-BC73C | 236C | 238 | NHL95PC module (matched functions) | todo |
| 60 | `src/lib/watcom/watcom_clib_06.asm` | BC73C-BE8C5 | 2189 | 155 | NHL95PC module (matched functions) | todo |
| 61 | `src/lib/ea/ea_fileblock_03.asm` | BE8C5-BF02C | 767 | 54 | NHL95PC module (matched functions) | todo |
| 62 | `src/lib/ea/ea_sound_hl.asm` | BF02C-BF070 | 44 | 5 | NHL95PC module (matched functions) | todo |
| 63 | `src/lib/watcom/watcom_clib_07.asm` | BF070-BF534 | 4C4 | 30 | NHL95PC module (matched functions) | todo |
| 64 | `src/lib/ea/ea_vesa_init.asm` | BF534-BF949 | 415 | 39 | NHL95PC module (matched functions) | todo |
| 65 | `src/lib/watcom/watcom_clib_08.asm` | BF949-C27F8 | 2EAF | 459 | NHL95PC module (matched functions) | todo |
| 66 | `src/lib/ea/ea_kbd_exit.asm` | C27F8-C2CB0 | 4B8 | 11 | NHL95PC module (matched functions) | todo |
| 67 | `src/lib/watcom/watcom_clib_09.asm` | C2CB0-C31C4 | 514 | 54 | NHL95PC module (matched functions) | todo |
| 68 | `src/lib/dos4gw/dos4gw_dpmi_glue_01.asm` | C31C4-C3724 | 560 | 50 | NHL95PC module (matched functions) | todo |
| 69 | `src/lib/ea/ea_mcga_window.asm` | C3724-C3727 | 3 | 1 | NHL95PC module (matched functions) | todo |
| 70 | `src/lib/watcom/watcom_clib_10.asm` | C3727-C39C2 | 29B | 24 | NHL95PC module (matched functions) | todo |
| 71 | `src/lib/dos4gw/dos4gw_dpmi_glue_02.asm` | C39C2-C3BE0 | 21E | 23 | NHL95PC module (matched functions) | todo |
| 72 | `src/lib/watcom/watcom_clib_11.asm` | C3BE0-C3CC0 | E0 | 10 | NHL95PC module (matched functions) | todo |
| 73 | `src/lib/ea/ea_shapes_01.asm` | C3CC0-C3E38 | 178 | 18 | NHL95PC module (matched functions) | todo |
| 74 | `src/lib/ea/ea_misc.asm` | C3E38-C40B4 | 27C | 18 | NHL95PC module (matched functions) | todo |
| 75 | `src/lib/watcom/watcom_clib_12.asm` | C40B4-C4DE0 | D2C | 174 | NHL95PC module (matched functions) | todo |
| 76 | `src/lib/ea/ea_shapes_02.asm` | C4DE0-C4EA1 | C1 | 4 | NHL95PC module (matched functions) | todo |
| 77 | `src/lib/watcom/watcom_clib_13.asm` | C4EA1-CA6E0 | 583F | 477 | NHL95PC module (matched functions) | todo |
| 78 | `src/lib/ea/ea_snap.asm` | CA6E0-CA835 | 155 | 11 | NHL95PC module (matched functions) | todo |
| 79 | `src/lib/watcom/watcom_clib_14.asm` | CA835-CE06B | 3836 | 171 | NHL95PC module (matched functions) | todo |
| 80 | `src/lib/sound/snd_soundblaster.asm` | CE06B-CFDF1 | 1D86 | 288 | NHL95PC module (matched functions) | todo |
| 81 | `src/lib/watcom/watcom_clib_15.asm` | CFDF1-D002F | 23E | 16 | NHL95PC module (matched functions) | todo |
| 82 | `src/lib/dos4gw/dos4gw_dpmi_glue_03.asm` | D002F-D01B5 | 186 | 19 | NHL95PC module (matched functions) | todo |
| 83 | `src/lib/watcom/watcom_clib_16.asm` | D01B5-D0360 | 1AB | 17 | NHL95PC module (matched functions) | todo |
| 84 | `src/lib/ea/ea_shpi_02.asm` | D0360-D0692 | 332 | 20 | NHL95PC module (matched functions) | todo |
| 85 | `src/lib/sound/snd_pcspeaker.asm` | D0692-D069B | 9 | 1 | NHL95PC module (matched functions) | todo |
| 86 | `src/lib/watcom/watcom_clib_17.asm` | D069B-D14D1 | E36 | 81 | NHL95PC module (matched functions) | todo |
| 87 | `src/lib/dos4gw/dos4gw_dpmi_glue_04.asm` | D14D1-D284C | 137B | 102 | NHL95PC module (matched functions) | todo |
| 88 | `src/lib/watcom/watcom_emu387.asm` | D284C-D59DB | 318F | 477 | NHL95PC module (matched functions) | todo |
| 89 | `src/lib/sound/snd_hw_sb.asm` | D59DB-D6120 | 745 | 114 | NHL95PC module (matched functions) | todo |
| 90 | `src/lib/sound/snd_gus_sdk_01.asm` | D6120-D79CC | 18AC | 109 | NHL95PC module (matched functions) | todo |
| 91 | `src/lib/video/vesa_banked_blit_01.asm` | D79CC-D7BB2 | 1E6 | 24 | NHL95PC module (matched functions) | todo |
| 92 | `src/lib/watcom/watcom_clib_18.asm` | D7BB2-D7DB0 | 1FE | 26 | NHL95PC module (matched functions) | todo |
| 93 | `src/lib/ea/ea_debug_02.asm` | D7DB0-DA5AF | 27FF | 302 | NHL95PC module (matched functions) | todo |
| 94 | `src/lib/watcom/watcom_clib_19.asm` | DA5AF-DA5D0 | 21 | 0 | NHL95PC module (matched functions) | todo |
| 95 | `src/lib/sound/snd_gus_sdk_02.asm` | DA5D0-DB9FA | 142A | 164 | NHL95PC module (matched functions) | todo |
| 96 | `src/lib/watcom/watcom_clib_20.asm` | DB9FA-DBFA8 | 5AE | 80 | NHL95PC module (matched functions) | todo |
| 97 | `src/lib/ea/ea_unpackf_blit.asm` | DBFA8-DCBB0 | C08 | 35 | NHL95PC module (matched functions) | todo |
| 98 | `src/lib/sound/snd_gus_sdk_03.asm` | DCBB0-DCC25 | 75 | 2 | NHL95PC module (matched functions) | todo |
| 99 | `src/lib/watcom/watcom_clib_21.asm` | DCC25-DD6C4 | A9F | 93 | NHL95PC module (matched functions) | todo |
| 100 | `src/lib/video/video_bios_vga_01.asm` | DD6C4-DE084 | 9C0 | 97 | NHL95PC module (matched functions) | todo |
| 101 | `src/lib/video/vesa_banked_blit_02.asm` | DE084-DF8AC | 1828 | 287 | NHL95PC module (matched functions) | todo |
| 102 | `src/lib/input/input_mouse.asm` | DF8AC-DFC33 | 387 | 23 | NHL95PC module (matched functions) | todo |
| 103 | `src/lib/input/input_keyboard_01.asm` | DFC33-DFEB4 | 281 | 26 | NHL95PC module (matched functions) | todo |
| 104 | `src/lib/input/input_joystick_misc_01.asm` | DFEB4-E0658 | 7A4 | 87 | NHL95PC module (matched functions) | todo |
| 105 | `src/lib/ea/ea_fileio_01.asm` | E0658-E0834 | 1DC | 20 | NHL95PC module (matched functions) | todo |
| 106 | `src/lib/input/input_keyboard_02.asm` | E0834-E0898 | 64 | 2 | NHL95PC module (matched functions) | todo |
| 107 | `src/lib/input/input_joystick_misc_02.asm` | E0898-E1824 | F8C | 191 | NHL95PC module (matched functions) | todo |
| 108 | `src/lib/video/video_bios_vga_02.asm` | E1824-E193C | 118 | 16 | NHL95PC module (matched functions) | todo |
| 109 | `src/lib/input/input_joystick_misc_03.asm` | E193C-E1970 | 34 | 2 | NHL95PC module (matched functions) | todo |
| 110 | `src/lib/ea/ea_fileio_02.asm` | E1970-E19F0 | 80 | 7 | NHL95PC module (matched functions) | todo |
| 111 | `src/lib/video/video_bios_vga_03.asm` | E19F0-E28A0 | EB0 | 179 | NHL95PC module (matched functions) | todo |

The data files (`src/data/`, 134) are not queue rows: data and BSS names come from the code files as they are worked through.
