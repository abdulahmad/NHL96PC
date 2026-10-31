# Contributing to NHL 96 PC

A bit-perfect disassembly (no decompilation) of NHL Hockey 96 for DOS, assembled with NASM.

- `main` only takes byte-identical changes: `./build.sh` must print MATCH and `sh tools/verify_segment.sh <segment>` MATCH for each segment
  touched. Run `sh tools/verify_all.sh` before every push.
- Small commits; never force-push. Contributors can work from a fork and open PRs.
- Names: see SEGMENT_AGENT.md (95PC, then 96G, then library names, then behaviour). Every rename gets a row in `docs/name_map.csv`
  (`address,name,auto_name,source,confidence,evidence,file`; `source` is `95PC`, `96G`, `95G`, `94G`, `93G`, `92G`, `WATCOM`, `EACSNDF`,
  `EACLIB` or `new`).
- Comments: no IDA artefacts (`sub_`, `loc_`), no hardcoded addresses in comments; every routine gets a header comment (what, args, result).
- No macros. Labels instead of addresses wherever NASM can compute them.
- Comment layout as in NHL94SNES CONTRIBUTING.md (tabs, trailing comments at column 36, 110 columns).
- Do not commit game data, `Extracted/`, `output/`, `*.lst` or patches (`lst/HOCKEY.EXE` is committed temporarily).
