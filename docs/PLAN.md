# Plan: bit-perfect disassembly of NHL 96 PC

Goal: `HOCKEY.EXE` (1,613,291 bytes, SHA-1 `426fb8c0c80088c6a2c56a9dac50509cb9c24540`) rebuilt byte for byte from
labelled NASM source, modelled on NHL95PC, with the NHL95PC symbols and file layout kept wherever the two games
share code. No C decompilation for now. Work goes to `main` through small pull requests.

## Where it stands (2026-11-24)

- `./build.sh` prints MATCH (NASM 2.15.05). The four LE objects are source: 263 code files and 232 data files, one data file
  per owning code module, including the 16-bit stub and the small object 3 (`EXE_SEGMAP96PC.md`, `src/segments.txt`). Every absolute address is a label; the linker regenerates the LE fixup tables.
  Only the DOS/4GW extender parts and the LE header fields are taken from the EXE (as in NHL95PC).
- 6,583 cross-file symbols (`src/inc/symbols.inc`); no auto names (`sub_`, `loc_`, `dword_` ...) are left in `src/`. The
  segment queue is finished; structure fields are equates (`src/inc/structs.inc`).

## Decisions and why

1. **NHL95PC gets a naming pass first; no grouping pass.** NHL95PC is already cut into proven modules
   (`src/engine|front|pc|lib|data`, its docs/MODULE_LAYOUT.md) and its segment queue is complete, so the files stay
   as they are. Its game routines are all named, but on 2026-11-14 3,213 of its 6,302 cross-file symbols were still
   auto names (data labels and library routines). The first plan here skipped that; the maintainer corrected it on
   2026-11-15. The pass runs on NHL95PC `fable-work`: names come from 94 Genesis, 94 SNES or 95 Genesis where they
   have one, and are PC names otherwise. After each batch `tools/names/match95.py` and `import_match95.py` carry the
   new names into 96, so 96 file naming waits for the engine and front-end data of 95.
2. **The NHL95PC pipeline replaces the page-per-incbin bootstrap.** Converting 279 pages by hand from the IDA
   listing would take months and write every address by hand. The 95 tools (LE split and rebuild, fixup labels,
   emitter, linker) were ported and generalised (four objects, 16:32 pointer fixups) and gave a full matching tree
   in one step. The IDA listing still feeds function starts, data items and FLIRT library names.
3. **One macro, `LD`, is allowed** (`src/inc/x86enc.inc`, the same file as NHL95PC). NASM cannot be told to pick
   the load form of a reg,reg instruction, which the hand-written asm libraries use; the alternative is raw `db`.
   No other macros.
4. **Module layout follows NHL95PC where the code matches, and is provisional elsewhere.** 96 was compiled without
   stack checks, so only the libraries are byte-identical to 95 (about 250 functions). The game engine was matched
   by behaviour (strings, callees, data, constants, instruction similarity, order): its modules sit at
   2D9D9-53260 in the 95 order (logic, input, faceoff, collide, hockey, skate, penalty, lines) and take the 95
   paths. The front end (10010-2D9D9, 53260-A8B9B) is mostly new in 96: eight segments have a clear theme and a name;
   25 segments (front end, two engine stretches, one library stretch) are placeholders named by address. Atoms (function runs proven to share a C file by shared exits and
   literal-pool order, `tools/build/module_atoms.py`) are never split.
5. **Only trustworthy names were imported** (docs/name_map.csv, source `95PC`): exact, call-site and string
   matches as high; behaviour matches above a threshold as medium. The other candidate matches stay in
   `tools/names/match95.csv` as leads for the segment agent, who confirms each by reading the code.

## Steps

| # | Step | State |
|---|---|---|
| 1 | Port the NHL95PC build tools; EXE round trip | done |
| 2 | Full source tree, byte-identical build | done |
| 3 | Match against NHL95PC; module layout; first names | done |
| 4 | Segment agent docs, naming rules, CONTRIBUTING on `fable-work` | done |
| 5 | Segment queue: name every routine, local and data item, one file per session, engine files first (SEGMENT_AGENT.md) | done |
| 6 | Re-run `match95.py` after each engine file (names found feed the matcher as anchors) | with 5 |
| 7 | Name and re-cut the placeholder front-end segments as their purpose becomes clear | done (boundaries still provisional) |
| 8 | Structure fields as equates (`src/inc/structs.inc`), aligned with NHL95PC's `structs.inc` | done |
| 9 | Data files: cut by owner once the code files are named | done (#40–#43) |
| 10 | Remove `lst/HOCKEY.EXE` and the listing from the repo | done 2026-11-18 (latest commit only; you supply your own) |

## Risks and open points

- The medium-confidence imports are behaviour matches. The segment agent re-reads each one when it works the file;
  a wrong one is renamed and the evidence corrected.
- The module boundaries of the front end are not proven. Moving a boundary is a `segmap96pc.json` change plus
  moving text between two files; the build stays MATCH because every file is placed at its own address.
- 16:32 pointer fixups (four `jmp far` in the serial interrupt code) are written `jmp 0:label wrt ..gotoff`; the
  linker turns that relocation into the LE far-pointer record (docs/ASM_BUILD.md).
