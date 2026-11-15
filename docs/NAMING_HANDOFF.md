# Naming handoff (2026-11-15)

State of the naming pass on NHL95PC and NHL96PC. Work on branch `fable-work` in both repos, then bring it into `main`
and the Overbar branches (see "Merging"). No decompilation. Skip Watcom internals and sound driver internals.

## Done
- NHL96PC: the whole EXE builds byte-identical from `src/`. Names carried from NHL95PC (strings, library, engine
  routines by assignment table index, call position, module order, shared references). Every address the SDL2 port
  uses is a label; the port writes `SYM_<label>` and `tools/build/gen_port_syms.py` writes `port/game_syms.h`.
- NHL95PC: strings, engine data, most front-end data, the most-called library routines, every symbol the port links.

## Remaining queue
1. NHL96PC engine: about 157 `sub_` routines in `src/engine/` (queue order: SEGMENT_AGENT.md, row 0
   `src/engine/logic/logic.asm`). The scripted leads are used up; each one needs reading next to its NHL95PC
   neighbour. Open leads that need a read first: `sub_41BFC` ChkShotStat, `sub_43026` puckbody, `sub_4711E`
   GetHotOrStick, `sub_488E9` GetPeriodTime, `sub_48922` ResetClock, `sub_4B247` StartGame, `sub_4FB38` PostGoalEvent,
   `sub_4FDC0` PostPenaltyEvent. Rejected (break the 95 module order, do not retry): dostop at 4B748, newcheck at
   68E31, Stop4Pen, puckunflip at 3FF26, `sub_30E6B` as assreplace. `sub_3251A` (after asspuckc_chkdir) has no 95
   partner.
2. NHL96PC: team struct fields (stride looks like 136h), then front-end files in SEGMENT_AGENT.md order.
3. NHL95PC: about 146 front-end data labels (`src/data/front`) and about 35 engine data labels. Take names from 94G
   `ram94`/`tables94`, 95G `ram95`, 94 SNES `ram94s.asm` first.
4. Measure: auto names in `extern` lines. 95 about 1,760 (from 3,213), 96 about 5,500.

## Scripts (NHL96PC `tools/names/`, docstrings give the commands)
- `rename_symbol.py --batch file`: the only way to rename; rebuilds and restores on a mismatch. A duplicate new name
  aborts the batch.
- Carry from 95: run `make CBUILD=0` in NHL95PC first (names come from its `build/obj0`), then `func_features.py`,
  `match95.py`, `import_match95.py`.
- `callprop.py ../NHL95PC . [--align N]`: callee names from routines named in both games. Re-run after each batch.
- `refprop.py ../NHL95PC .`: unnamed 96 routines whose named references match one 95 routine.
- `order_check.py`: pipe `96_label 95_name` lines in; `ORDER-OK` means the same named neighbours in both games.
  Only apply leads that are ORDER-OK.
- `tools/build/gen_port_syms.py [--check]` on the port branch after any rename of a label the port uses.

## Verify
- NHL96PC: `./build.sh` must end with MATCH; `python3 tools/build/update_symbols.py --check`.
- NHL95PC: `make CBUILD=0` and `SDL_VIDEODRIVER=dummy make -j8 CBUILD=1` must both print MATCH (CBUILD=1 needs
  dosbox and `pip install capstone`).
- Ports (Linux): `apt-get install gcc-multilib g++-multilib libsdl2-dev:i386`, `git submodule update --init`,
  `make sdl2`.

## Merging
- NHL96PC: `fable-work` into `main` (fast-forward) and into `cursor/overbar-96pc-6801` (merge commit), then
  `./build.sh`, `gen_port_syms.py --check`, `make sdl2`.
- NHL95PC: `fable-work` into `main` and into `cursor/overbar-95pc-6801`, and fast-forward `overbar-console-features`
  to it. The 95 port links by symbol name: after a rename, rename the same tokens in `port/*.c` (old label, its
  address in `src/inc/symbols.inc`, new label) and run `make sdl2`.
