# NHL Hockey 96 for DOS

> **🤝 Making a mod, hack, port or other derivative work from this repo? You must credit me and everyone credited in this repo, clearly, in your own repo and in every release. See [Credits and derivative works](#credits-and-derivative-works).**

> **Temporary:** the retail HOCKEY.EXE is committed in `lst/` for convenience while the repo is young. It will be removed as the repo gets closer to final; after that you supply your own copy (the build finds it by SHA-1 and size, any file name, and tells you exactly what it needs when it is missing). The IDA listing `lst/HOCKEY.EXE.lst` is committed on the same temporary basis. Patch files are never committed.

> **📀 The other game files are needed to run the game.** This repo builds `HOCKEY.EXE` only; the game's data (`*.VIV`, `*.FSH`, `*.ASF`, `*.QFS` and the rest of the install) is not here.

## 🚧 Current Status

- Bootstrapped: the EXE is split into the DOS/4GW extender (DOS/16M loader, DOS/4GW kernel, Watcom wstub), the LE header and tables, and the game image's four LE objects, one 4 KB page per segment (283 segments). Each is an `incbin`, and the NASM build is byte-identical to the retail EXE.
- Every segment also builds on its own from its stub (`src/stubinc/<segment>_stub.asm`).
- Trial: the LE header fields and object table are source (`src/le/le_header.asm`), with table offsets as label expressions and the entry point (`start`) as a label. Nothing else is disassembled yet.
- This is a **disassembly only**: labelled 32-bit x86 assembly that reassembles byte-identical. There is no C decompilation or compiler matching.

**AI agent or new contributor: start with [START_HERE.md](START_HERE.md).**

| | |
|---|---|
| File | `lst/HOCKEY.EXE` (any name in the repo folder works) |
| IDA listing | `lst/HOCKEY.EXE.lst` (reference for contributors; the build does not use it) |
| Size | 1,613,291 bytes |
| SHA-1 | `426fb8c0c80088c6a2c56a9dac50509cb9c24540` |
| CRC32 | `0E04F0D5` |
| Format | Watcom C/C++32 program (runtime "(c) Copyright by WATCOM International Corp. 1988-1994", the same 10.0-family runtime as NHL95PC) bound with DOS/4GW Professional; EACSNDF.LIB 32-bit sound library (build Aug 28 1995) |

## Lineage

NHL '96 PC is based on [NHL95PC](https://github.com/abdulahmad/NHL95PC) and [NHL96Genesis](https://github.com/abdulahmad/NHL96Genesis). Names come from those repos, matched by purpose, not by identical code, and the earlier game's name wins: 95PC (whose names already carry 93G/94G) first, then 96G for what is new in 96; a 96G name inherited from an earlier Genesis game beats a 95PC name made up from behaviour. See SEGMENT_AGENT.md.

## Layout

- `src/hockey96pc.asm` includes the whole file in order: `section exe` (extender stubs and LE header, file offsets), then `section objN vstart=objN_base` per LE object (labels are linear addresses), one page file after another.
- `src/inc/le_objects.inc`: the objects' base addresses and sizes. `segmap.json`: every segment's name, file offset, size, source file.
- `src/stubinc/<segment>_stub.asm` builds one segment on its own: `bits`, `org`, outside labels as equates, then the segment file.
- `tools/prebuild.py`, `tools/extract.py`, `tools/verify_segment.py` / `.sh`, `tools/verify_all.sh`: as in NHL94PC.

| LE object | Base | Size | Flags | First page | Pages |
|---|---|---|---|---|---|
| 1 | 0x10000 | 0xD28A0 | 0x2005 | 1 | 211 |
| 2 | 0xF0000 | 0x34 | 0x0005 | 212 | 1 |
| 3 | 0x100000 | 0x18 | 0x2003 | 213 | 1 |
| 4 | 0x110000 | 0x99260 | 0x2003 | 214 | 66 |

## Build

Needs NASM 2.15+ and Python 3. `./build.sh` ends with `MATCH output/HOCKEY.EXE`. `sh tools/verify_all.sh` is the clean check (last line MATCH).

## AI assistance

This project is AI-assisted. The work is directed by a strict ruleset and curated by hand, with the aim of producing clean, correct, correctly labelled and commented code that closely matches what the original developers likely had. We can't guarantee it's perfect, and ultimately this will always be a work in progress. If you see something that needs fixing, raise an issue, or even better, raise a PR.

## Credits and derivative works

Thanks to chaos, StaticEck, McMarkis and Drezz for their help with the disassembly.

Special thanks to smozoma and kingraph, whose past contributions to the NHL modding community made this work easier.

And thank you to the original developers of the game.

This project is the result of my work and the work of the people credited above. If you build anything from it, including mods, ROM or EXE hacks, ports, released forks, tools, or any other derivative work, you must credit us:

- Put the credit in your repo's README, near the top and not buried in a footer, and in the notes of every release you publish, including any text file shipped inside a release archive.
- Name me and link to this repository.
- Name everyone credited here: chaos, StaticEck, McMarkis (Mhopkinsinc) and Drezz, with special thanks to smozoma and kingraph.
- If you only use part of this repo (docs, a tool, labels, a file format description), the credit still applies.
- If you are unsure, over-credit.

Credit is the condition for using this work. Please do not release a derivative without it.
