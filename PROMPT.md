# Segment prompt

Paste this into a new agent session. One file per prompt. Do not edit this prompt.

```text
Read START_HERE.md, SEGMENT_AGENT.md and CONTRIBUTING.md before you change any asm. Take the CURRENT row of the queue in SEGMENT_AGENT.md. That file is the only file this session. This repo is a disassembly only (labelled 32-bit x86 NASM that reassembles byte-identical); do not write C.

NHL '96 PC is based on NHL 95 PC and NHL 96 Genesis. Names follow the Current rules section of SEGMENT_AGENT.md: code that does the same job as NHL95PC takes its name, 96 features take the NHL96Genesis name, else a name from what the code clearly does. Match by purpose, not identical code; the earlier game's name wins. Watcom runtime and EACSNDF routines keep their library names (as in NHL95PC).

1. Run ./build.sh first. It must print MATCH before you change anything. If it does not, stop and report.
2. Read the file next to its NHL95PC counterpart (same path under src/) when it has one, and the rows for its addresses in docs/name_map.csv and tools/names/match95.csv. Medium-confidence rows are leads: confirm each by reading both routines.
3. Rename every auto name defined in the file (sub_, loc_, dword_, off_, asc_ ...) by purpose with tools/names/rename_symbol.py (never search and replace): routines, locals (92 style), the data the file owns. Give every routine a header comment (what, args, result). No guessing: leave an auto name and list it under Unsure in docs/HANDOFF.md.
4. ./build.sh must print MATCH after each batch, and python3 tools/build/update_symbols.py --check must say up to date.
5. Mark the queue row, move CURRENT, update docs/HANDOFF.md. Commit and push to fable-work. Do not merge to main.

Stop after 5 failed builds in a row and report the file, first differing address, built and retail bytes, and the line you wrote.
```
