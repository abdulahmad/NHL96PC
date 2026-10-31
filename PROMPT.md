# Segment prompt

Paste this into a new agent session. One segment (page) per prompt. Do not edit this prompt.

```text
Read START_HERE.md, SEGMENT_AGENT.md and CONTRIBUTING.md before you write any asm. Take the first segment in the segment map of SEGMENT_AGENT.md that is still incbin. That file is the only segment this session. This repo is a disassembly only (labelled 32-bit x86 NASM that reassembles byte-identical); do not write C.

NHL '96 PC is based on NHL 95 PC and NHL 96 Genesis. Names follow the Current rules section of SEGMENT_AGENT.md: code that does the same job as NHL95PC takes its name, 96 features take the NHL96Genesis name, else a name from what the code clearly does. Match by purpose, not identical code; the earlier game's name wins. Watcom runtime and EACSNDF routines keep their library names (as in NHL95PC).

1. Run ./build.sh first. It must print MATCH before you change anything. If it does not, stop and report.
2. Start from the IDA listing lst/HOCKEY.EXE.lst: find the page's linear range (its stub's org; obj2 is printed as cseg02 offsets, add 0xF0000) and take IDA's code/data split, cross-references and auto names from it. Translate the MASM to NASM and put it into src/obj<N>/<segment>.asm in place of its incbin. For collapsed functions or anything IDA got wrong, disassemble the bytes yourself (objdump -D -b binary -mi386 -M intel --adjust-vma=<addr>, or ndisasm -b 32 -o <addr>). Use the cross-references to name callers and data. Never edit the listing. The page's linear address is its stub's org. A routine that crosses into the next page: move the split to the routine boundary (cut the next file's incbin) in the same commit.
3. Separate code from data. Every 32-bit absolute address in the object is a fixup in the LE fixup table: write it as the label of its target (an equate in the stub while the target is still incbin). Do not change the fixup tables.
4. Rename every IDA auto name (sub_, loc_, dword_, off_, byte_, a... strings) by purpose: routines, locals (92 style), data. Use NHL95PC's names where the routine does the same job (its symbols.inc / name map), 96G's for 96 features.
5. ./build.sh must print MATCH after each batch of edits, then sh tools/verify_segment.sh <segment> must print MATCH.
6. In SEGMENT_AGENT.md mark the row, add a History line, set Current segment. Update docs/HANDOFF.md and docs/name_map.csv. Commit and push to main.

Stop after 5 failed builds in a row and report the file, first differing file offset, built and retail bytes, and the line you wrote.
```
