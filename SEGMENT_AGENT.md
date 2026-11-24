# NHL 96 PC segment agent

The segment queue is finished; its table (file names as of 2026-11-14, before the module re-cut) is archived in
[docs/archive/SEGMENT_QUEUE.md](docs/archive/SEGMENT_QUEUE.md). This file keeps the naming rules.
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

None. No auto names (`sub_`, `loc_`, `dword_` ...) are left in `src/` (checked 2026-11-24).

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
5. MATCH after each batch. Small commits on a short branch off `main`, one PR into `main`. Never force-push.
6. Mark the row (`done`, or `partial` with what is left), move CURRENT to the next row, update `docs/HANDOFF.md`.
7. Stop after 5 failed builds in a row and report the file, the first differing address, built and retail bytes, and the line.

## Queue

Finished. The table is in [docs/archive/SEGMENT_QUEUE.md](docs/archive/SEGMENT_QUEUE.md).
