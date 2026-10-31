# Handoff

## State (2026-10-31)

- Full build MATCH (SHA-1 `426fb8c0c80088c6a2c56a9dac50509cb9c24540`, 1,613,291 bytes); `tools/verify_all.sh` MATCH (full build and all 283 segments built on
  their own). Onboarding: StaticEck.
- Everything is incbin except the LE header fields and object table (`src/le/le_header.asm`). Next: obj1_00000.

- IDA listing `lst/HOCKEY.EXE.lst` added (Abdul's, LE loader, MetaPC). Its addresses match the repo's objects and pages; it is the
  starting point for each page (SEGMENT_AGENT.md, IDA listing).

## Known facts

- Watcom C/C++32 runtime string "(c) Copyright by WATCOM International Corp. 1988-1994": the 10.0 family, like NHL95PC (10.5 says
  1988-1995). EACSNDF.LIB "32 Bit Sound Library - Build: Aug 28 1995". DOS/4GW Professional (Rational Systems 1990-1994).
- Entry point `start` in object 1 (the same name NHL95PC gives its entry). Stack: top of object 4.
- No C work here: the toolchain is NASM 2.15+ and Python 3 only.

- IDA: the entry `1:000A6308h` is object-relative (linear 0xB6308); `cseg02` is printed with offsets (add 0xF0000); `dseg04` from
  0x152000 is BSS; 233 functions are collapsed in the listing (bodies must be disassembled from the EXE).

## Unsure / open

- Object 2 (52 bytes) and object 3 (24 bytes): what they hold.
- Fixup records stay incbin until generated from labels.
