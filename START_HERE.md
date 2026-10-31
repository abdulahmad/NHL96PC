# START HERE (instructions for the agent and new contributors)

Welcome. This repo is set up for **StaticEck**, who leads the NHL '96 PC disassembly, and the agents working with him. Read this file, then
`SEGMENT_AGENT.md` (rules, queue and history), `CONTRIBUTING.md` and `docs/HANDOFF.md`.

This repo is a disassembly only: labelled 32-bit x86 assembly (NASM) that reassembles to the byte-identical `HOCKEY.EXE`. No C, no compiler.
NHL95PC has a C matching effort; that part does not apply here. Its asm layout, names and LE knowledge (BUILD_NOTES.md) do.

## Hard rules

- Never change an EXE byte. Every commit must build to MATCH (SHA-1 `426fb8c0c80088c6a2c56a9dac50509cb9c24540`).
- `lst/HOCKEY.EXE` and the IDA listing `lst/HOCKEY.EXE.lst` are committed for now (temporary). Never commit game data, `Extracted/`, `output/` or patches.
- Never force-push, never rewrite pushed history, never push a commit that does not MATCH. Small commits.
- No macros. No address where a label works.

## 1. Setup

NASM 2.15+ and Python 3. If the EXE is missing, `./build.sh` prints the path, SHA-1, CRC32 and size.

## 2. Build and confirm MATCH

`./build.sh` (last line `MATCH output/HOCKEY.EXE`), `sh tools/verify_all.sh` (last line `MATCH`). If not MATCH on a fresh clone, stop and report.

## 3. The IDA listing

`lst/HOCKEY.EXE.lst` is Abdul's IDA listing of the same EXE. Its addresses are the repo's linear addresses (obj1 at 0x10000, obj2 at
0xF0000, obj3 at 0x100000, obj4 at 0x110000). Start each page from it: IDA's code/data split, cross-references and auto names, then
rename by purpose (NHL95PC first, NHL96Genesis as a fallback). The offset differences and collapsed functions are listed in
`SEGMENT_AGENT.md` (IDA listing).

## 4. Work loop

Run `PROMPT.md` once per segment (page), in object order starting at obj1_00000. After each: MATCH, `sh tools/verify_segment.sh <segment>`,
commit, push, update `docs/HANDOFF.md`. Stop after 8 pages and report.

## 5. When stuck

- Something that cannot be expressed without changing bytes: leave it and list it in `docs/HANDOFF.md`.
- 5 failed builds in a row: go back to the last MATCH state and note what was tried.
