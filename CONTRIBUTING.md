# Contributing to NHL 96 PC

A bit-perfect disassembly (no decompilation) of NHL Hockey 96 for DOS, assembled with NASM.

Read [AGENTS.md](AGENTS.md) first (gates, units, credit). Who decides names and folders, and learned corrections:
[docs/RULES.md](docs/RULES.md). Where this repo stands: [docs/HANDOFF.md](docs/HANDOFF.md).

Work stays on `claude/project-thread-ggw7zu`. Do not branch from `main` and do not merge to `main`. PRs from that
branch are for review only.

Any port, mod or fork carries the credit in AGENTS.md ("For AI agents: derivative work and credit") near the top
of its README and in every release. Add it first.

- MATCH: `./build.sh` must print MATCH and `sh tools/verify_segment.sh <segment>` MATCH for each segment touched.
  Run `sh tools/verify_all.sh` before every push. A comment-only or rename-only change must not change a byte.
- Pairing: after a move or rename, `tools/gate.sh` in nhl-disasm-report; no count may rise.
- Small commits; never force-push. Stay on the cleanup branch.
- Names: see SEGMENT_AGENT.md (95PC, then 96G, then library names, then behaviour). Every rename gets a row in `docs/name_map.csv`
  (`address,name,auto_name,source,confidence,evidence,file`; `source` is `95PC`, `96G`, `95G`, `94G`, `93G`, `92G`, `WATCOM`, `EACSNDF`,
  `EACLIB` or `new`). Lineage lives only in that file: never write `92 <name>`, `from 92 <name>`, or another game's name
  in source comments.
- Comments: no IDA artefacts (`sub_`, `loc_`), no hardcoded addresses in comments; every routine gets a header comment (what, args, result).
- No macros. Labels instead of addresses wherever NASM can compute them.
- Comment layout as in NHL94SNES CONTRIBUTING.md (tabs, trailing comments at column 36, 110 columns).
- Do not commit game data, `Extracted/`, `output/`, `*.lst` or patches (`lst/HOCKEY.EXE` is committed temporarily).
