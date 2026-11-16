# Contributing to NHL 96 PC

A bit-perfect disassembly (no decompilation) of NHL Hockey 96 for DOS, assembled with NASM.

Read [AGENTS.md](AGENTS.md) first (gates, units, credit). Who decides names and folders, and learned corrections:
[docs/RULES.md](docs/RULES.md). Where this repo stands: [docs/HANDOFF.md](docs/HANDOFF.md).

`main` is the working branch (2026-11-15: the Overbar, season and cleanup work was folded into it). It must keep
building the DOS EXE byte-identical and the Overbar port.
The plan and its reasons: [docs/PLAN.md](docs/PLAN.md). The build: [docs/ASM_BUILD.md](docs/ASM_BUILD.md).

Any port, mod or fork carries the credit in AGENTS.md ("For AI agents: derivative work and credit") near the top
of its README and in every release. Add it first.

- MATCH: `./build.sh` must print MATCH before every commit and push, and `python3 tools/build/update_symbols.py --check`
  must say up to date. A comment-only or rename-only change must not change a byte.
- Pairing: after a move or rename, `tools/gate.sh` in nhl-disasm-report; no count may rise.
- Small commits; never force-push. Stay on the cleanup branch.
- Names: see SEGMENT_AGENT.md (95PC, then 96G, then library names, then behaviour). Rename only with
  `tools/names/rename_symbol.py`. Every renamed routine and data item gets a row in `docs/name_map.csv`
  (`address,name,auto_name,source,confidence,evidence,file`; `source` is `95PC`, `96G`, `95G`, `94G`, `93G`, `92G`, `WATCOM`, `EACSNDF`,
  `EACLIB` or `new`). Lineage lives only in that file: never write `92 <name>`, `from 92 <name>`, or another game's name
  in source comments.
- Comments: see "Comments" below.
- Source style (2026-11-15 cleanup, same as NHL95PC): no address on each line (`tools/build/asmaddr.py` prints it),
  instructions indented 8 spaces, comments after an instruction at column 48, `db ...  ; insn: ...` for an instruction
  kept as bytes, a header between rule lines on every game routine (`; Name  ADDRESS  SOURCE`, then what it does;
  `tools/build/format_asm.py --headers`), jump targets as local labels (`.1`; `tools/names/localize_labels.py`) unless
  another routine jumps there (`<Routine>_<offset>`). `tools/build/format_asm.py --check` must pass.
- No macros except `LD` (docs/ASM_BUILD.md). Labels instead of addresses wherever NASM can compute them.
- Do not commit game data, `build/`, other `*.lst` files or patches (`lst/HOCKEY.EXE` and its IDA listing are committed temporarily).

## Comments

Adapted from NHL94SNES CONTRIBUTING.md (sections 4 and 5) for the PC sources. `python3 tools/build/check_comments.py`
checks these rules (`--summary` gives a count per rule); it must not report more problems after your change than
before it, and a file you finish must come out clean. A comment-only change must not change a byte (MATCH).

What to write:

- **Every routine** has a header between two rule lines: `; Name <spaces> ADDRESS  SOURCE`, then what it does,
  what it takes (registers, stack arguments, globals it reads) and what it returns or changes. Say where it is called
  from when that explains it. Library routines too: a Watcom or EA library routine says what the library call does.
- **Every variable declaration** has a comment on its label line: data and BSS labels, tables, strings, equates and
  structure fields. Say what it holds: units, range, flag bits, what one table entry is and how many there are, and
  which routines own it. A string says where it is shown or used.
- **Every file** starts with a header that says what the file holds and how it relates to its neighbours. It does not
  list the routines in order.
- Routines read as a story when you work on them: a short comment for each step (3 to 8 instructions), what the
  registers hold, why a branch is taken, where the flow falls through.
- Anything not obvious gets a comment: magic numbers, bit tests (name the flag), x87 stack use, shared tails, code
  kept as bytes, self-modifying code.
- Only write what you checked in the code. If you cannot tell why something is done, describe what the instructions
  do or write "probably". Never invent names.

What not to write:

- No IDA names (`sub_`, `loc_`, `unk_`, `dword_`, `byte_`, `off_`, `asc_`, `jpt_` ...). Write the real name.
- No raw addresses or structure offsets in comments: write the name (`PUCKX`, not `168CD8h`) or say what the value
  means. The only addresses allowed are the ADDRESS field of a routine header and the address range of a file header.
- No other game's names (`94G`, `NHL 95`, `96 PC`, `Genesis` ...). Lineage lives only in `docs/name_map.csv`; the
  SOURCE field of a routine header is the one place it shows.
- No source-file or segment names, no history (`was X`, `renamed from`): that is in git and `docs/name_map.csv`.

Layout (the 2026-11-15 cleanup layout, not the SNES tabs):

- Labels, comment lines and `%` lines start in column 0; instructions and data are indented 8 spaces.
- A comment after an instruction or on a label line starts at column 48, or one space after code that reaches past it.
  Its continuation lines start at column 48 too.
- No comment line is wider than 110 columns (data lines aside).
- A comment that explains one instruction goes to its right, not on its own line above it. A comment on its own line
  is a block header for the steps below it.
- A header or block comment has paragraphs of at most 3 lines, separated by a `;` line. Keep headers short: what
  the routine is for, its inputs and result, and the few notes nobody could guess.
