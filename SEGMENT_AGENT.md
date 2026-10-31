# NHL 96 PC segment agent

This file is the queue and the history. Do not rewrite it as a whole file. Edit it in place.
(Adapted from NHL95PC, NHL96Genesis and NHL94SNES.)

## Current rules (Oct 2026)

This repo is a **disassembly only**: labelled 32-bit x86 assembly that reassembles byte-identical with NASM. No C decompilation and no
compiler matching.

Naming lineage: 92G -> 93G -> 94G -> 95G -> 96G; 94PC -> **95PC -> 96PC** (96PC from 95PC plus the 96G features).
- Name priority, matched by purpose (calls, constants, structure fields, strings, what the code does), not identical code:
  1. the **NHL95PC** name (its `name_map_94.csv` names already carry 93G/94G provenance), else
  2. the **NHL96Genesis** name for 96 features (96G names trace back through 95G, 94G), else
  3. Watcom C runtime and EACSNDF/EACLIB library names (as NHL95PC names them), else
  4. a name from what the code clearly does, with the evidence in `docs/name_map.csv`.
- Earlier games' names win: a 96G name inherited from 92G-95G beats a 95PC name that 95PC made up from behaviour.
- Clash rule: the earliest game's meaning keeps a name; the later item gets a new one.
- Casing: keep the source game's casing exactly. Watcom register-call symbols keep their trailing underscore where 95PC uses it.

Source style (same as the sibling repos):
- No rename-history, provenance or origin-tag comments ("was X", "from 93G", "renamed"). That history lives in `docs/name_map.csv` only.
- No hardcoded addresses in comments, and no hand-kept derived counts (sizes, numbers of entries, totals) the assembler can compute.
- Never write an address where a label works: pointers, table offsets and sizes are label expressions. A number is only for a
  value with no label yet (inside a still-incbin segment), or an incbin split point.
- No macros. Plain instructions and data directives only.
- Local labels in 92 style: `.loop`, `.next`, `.done`, `.exit`, and plain numbers for trivial jumps.
- File headers are short plain-English stories of what the file does.
- Never reuse a name for a different item (clash rule: the earliest game's meaning keeps the name; the later item gets a new one).
- No guessing: a wrong name is worse than an auto name. Unsure items go under Unsure in `docs/HANDOFF.md`.

## Current segment

obj1_00000. <- CURRENT

## Sources

- Reference EXE: `lst/HOCKEY.EXE` (committed for now, temporary).
- File layout: 0x000000 DOS/16M loader stub (MZ), 0x00F474 DOS/4GW kernel ('BW'), 0x026654 Watcom wstub (MZ, e_lfanew -> LE),
  0x0290A4 LE header, object table, page map, resident names, entry table, fixup page table and fixup records, then
  the object pages from 0x073854 (the LE data-pages offset is counted from the wstub). The same structure as NHL95PC (see its
  BUILD_NOTES.md); the extender parts stay incbin (third-party binaries).
- Segments: one per 4 KB LE page (the last page of object 4 is short). Pages are split further as routines are found.
- Names: NHL95PC (https://github.com/abdulahmad/NHL95PC: `src/inc/symbols.inc`, `name_map_94.csv`, `EXE_SEGMAP95PC.md`),
  NHL96Genesis (https://github.com/abdulahmad/NHL96Genesis).

## Build and verify

- `./build.sh`: prebuild check, `nasm -f bin -I src/ src/hockey96pc.asm` -> `output/HOCKEY.EXE`, SHA-1 compare. MATCH or MISMATCH.
- `sh tools/verify_segment.sh <segment>`: assembles its stub alone and compares with the EXE range, then the full build's. `--all` for all.
- `sh tools/verify_all.sh`: deletes output/ and Extracted/, rebuilds, checks every segment. Last line MATCH or FAIL.

## Segment files and stubs

- A page file has no `section` or `org`: `src/hockey96pc.asm` includes it inside `section objN vstart=objN_base`, so its labels are linear
  addresses. Its stub carries `bits 32` and `org <page's linear address>`.
- Outside labels a page uses: equates in its stub. A label another converted segment defines: an equate in your stub only.
- Fixups: the bytes of every absolute address are fixed up by DOS/4GW from the LE fixup records. The records stay incbin for now; once the
  code is labelled they can be generated from the labels (NHL95PC's rebuild_exe.py has the wlink record order).
- NASM limits: no division or shift of an address from another section in a bin build; `num_pages`-style counts are label differences in
  one section, `last_page_size` stays a number.

## History

- 2026-10-31: bootstrap. 283 incbin segments (3 extender parts, LE header area, 279 object pages), a stub per segment, prebuild
  EXE check, extractor, NASM build and verify (MATCH). Trial: LE header fields and object table as source, `start` entry label.

## Segment map

| File | Status | File offset | Bytes |
|---|---|---|---|
| dos16m_loader | incbin | 0x000000 | 62580 |
| dos4gw_kernel | incbin | 0x00F474 | 94688 |
| wstub | incbin | 0x026654 | 10832 |
| le_header | incbin (header fields and object table are source) | 0x0290A4 | 305072 |
| obj1_00000 | incbin <- CURRENT | 0x073854 | 4096 |
| obj1_01000 | incbin | 0x074854 | 4096 |
| obj1_02000 | incbin | 0x075854 | 4096 |
| obj1_03000 | incbin | 0x076854 | 4096 |
| obj1_04000 | incbin | 0x077854 | 4096 |
| obj1_05000 | incbin | 0x078854 | 4096 |
| obj1_06000 | incbin | 0x079854 | 4096 |
| obj1_07000 | incbin | 0x07A854 | 4096 |
| obj1_08000 | incbin | 0x07B854 | 4096 |
| obj1_09000 | incbin | 0x07C854 | 4096 |
| obj1_0A000 | incbin | 0x07D854 | 4096 |
| obj1_0B000 | incbin | 0x07E854 | 4096 |
| obj1_0C000 | incbin | 0x07F854 | 4096 |
| obj1_0D000 | incbin | 0x080854 | 4096 |
| obj1_0E000 | incbin | 0x081854 | 4096 |
| obj1_0F000 | incbin | 0x082854 | 4096 |
| obj1_10000 | incbin | 0x083854 | 4096 |
| obj1_11000 | incbin | 0x084854 | 4096 |
| obj1_12000 | incbin | 0x085854 | 4096 |
| obj1_13000 | incbin | 0x086854 | 4096 |
| obj1_14000 | incbin | 0x087854 | 4096 |
| obj1_15000 | incbin | 0x088854 | 4096 |
| obj1_16000 | incbin | 0x089854 | 4096 |
| obj1_17000 | incbin | 0x08A854 | 4096 |
| obj1_18000 | incbin | 0x08B854 | 4096 |
| obj1_19000 | incbin | 0x08C854 | 4096 |
| obj1_1A000 | incbin | 0x08D854 | 4096 |
| obj1_1B000 | incbin | 0x08E854 | 4096 |
| obj1_1C000 | incbin | 0x08F854 | 4096 |
| obj1_1D000 | incbin | 0x090854 | 4096 |
| obj1_1E000 | incbin | 0x091854 | 4096 |
| obj1_1F000 | incbin | 0x092854 | 4096 |
| obj1_20000 | incbin | 0x093854 | 4096 |
| obj1_21000 | incbin | 0x094854 | 4096 |
| obj1_22000 | incbin | 0x095854 | 4096 |
| obj1_23000 | incbin | 0x096854 | 4096 |
| obj1_24000 | incbin | 0x097854 | 4096 |
| obj1_25000 | incbin | 0x098854 | 4096 |
| obj1_26000 | incbin | 0x099854 | 4096 |
| obj1_27000 | incbin | 0x09A854 | 4096 |
| obj1_28000 | incbin | 0x09B854 | 4096 |
| obj1_29000 | incbin | 0x09C854 | 4096 |
| obj1_2A000 | incbin | 0x09D854 | 4096 |
| obj1_2B000 | incbin | 0x09E854 | 4096 |
| obj1_2C000 | incbin | 0x09F854 | 4096 |
| obj1_2D000 | incbin | 0x0A0854 | 4096 |
| obj1_2E000 | incbin | 0x0A1854 | 4096 |
| obj1_2F000 | incbin | 0x0A2854 | 4096 |
| obj1_30000 | incbin | 0x0A3854 | 4096 |
| obj1_31000 | incbin | 0x0A4854 | 4096 |
| obj1_32000 | incbin | 0x0A5854 | 4096 |
| obj1_33000 | incbin | 0x0A6854 | 4096 |
| obj1_34000 | incbin | 0x0A7854 | 4096 |
| obj1_35000 | incbin | 0x0A8854 | 4096 |
| obj1_36000 | incbin | 0x0A9854 | 4096 |
| obj1_37000 | incbin | 0x0AA854 | 4096 |
| obj1_38000 | incbin | 0x0AB854 | 4096 |
| obj1_39000 | incbin | 0x0AC854 | 4096 |
| obj1_3A000 | incbin | 0x0AD854 | 4096 |
| obj1_3B000 | incbin | 0x0AE854 | 4096 |
| obj1_3C000 | incbin | 0x0AF854 | 4096 |
| obj1_3D000 | incbin | 0x0B0854 | 4096 |
| obj1_3E000 | incbin | 0x0B1854 | 4096 |
| obj1_3F000 | incbin | 0x0B2854 | 4096 |
| obj1_40000 | incbin | 0x0B3854 | 4096 |
| obj1_41000 | incbin | 0x0B4854 | 4096 |
| obj1_42000 | incbin | 0x0B5854 | 4096 |
| obj1_43000 | incbin | 0x0B6854 | 4096 |
| obj1_44000 | incbin | 0x0B7854 | 4096 |
| obj1_45000 | incbin | 0x0B8854 | 4096 |
| obj1_46000 | incbin | 0x0B9854 | 4096 |
| obj1_47000 | incbin | 0x0BA854 | 4096 |
| obj1_48000 | incbin | 0x0BB854 | 4096 |
| obj1_49000 | incbin | 0x0BC854 | 4096 |
| obj1_4A000 | incbin | 0x0BD854 | 4096 |
| obj1_4B000 | incbin | 0x0BE854 | 4096 |
| obj1_4C000 | incbin | 0x0BF854 | 4096 |
| obj1_4D000 | incbin | 0x0C0854 | 4096 |
| obj1_4E000 | incbin | 0x0C1854 | 4096 |
| obj1_4F000 | incbin | 0x0C2854 | 4096 |
| obj1_50000 | incbin | 0x0C3854 | 4096 |
| obj1_51000 | incbin | 0x0C4854 | 4096 |
| obj1_52000 | incbin | 0x0C5854 | 4096 |
| obj1_53000 | incbin | 0x0C6854 | 4096 |
| obj1_54000 | incbin | 0x0C7854 | 4096 |
| obj1_55000 | incbin | 0x0C8854 | 4096 |
| obj1_56000 | incbin | 0x0C9854 | 4096 |
| obj1_57000 | incbin | 0x0CA854 | 4096 |
| obj1_58000 | incbin | 0x0CB854 | 4096 |
| obj1_59000 | incbin | 0x0CC854 | 4096 |
| obj1_5A000 | incbin | 0x0CD854 | 4096 |
| obj1_5B000 | incbin | 0x0CE854 | 4096 |
| obj1_5C000 | incbin | 0x0CF854 | 4096 |
| obj1_5D000 | incbin | 0x0D0854 | 4096 |
| obj1_5E000 | incbin | 0x0D1854 | 4096 |
| obj1_5F000 | incbin | 0x0D2854 | 4096 |
| obj1_60000 | incbin | 0x0D3854 | 4096 |
| obj1_61000 | incbin | 0x0D4854 | 4096 |
| obj1_62000 | incbin | 0x0D5854 | 4096 |
| obj1_63000 | incbin | 0x0D6854 | 4096 |
| obj1_64000 | incbin | 0x0D7854 | 4096 |
| obj1_65000 | incbin | 0x0D8854 | 4096 |
| obj1_66000 | incbin | 0x0D9854 | 4096 |
| obj1_67000 | incbin | 0x0DA854 | 4096 |
| obj1_68000 | incbin | 0x0DB854 | 4096 |
| obj1_69000 | incbin | 0x0DC854 | 4096 |
| obj1_6A000 | incbin | 0x0DD854 | 4096 |
| obj1_6B000 | incbin | 0x0DE854 | 4096 |
| obj1_6C000 | incbin | 0x0DF854 | 4096 |
| obj1_6D000 | incbin | 0x0E0854 | 4096 |
| obj1_6E000 | incbin | 0x0E1854 | 4096 |
| obj1_6F000 | incbin | 0x0E2854 | 4096 |
| obj1_70000 | incbin | 0x0E3854 | 4096 |
| obj1_71000 | incbin | 0x0E4854 | 4096 |
| obj1_72000 | incbin | 0x0E5854 | 4096 |
| obj1_73000 | incbin | 0x0E6854 | 4096 |
| obj1_74000 | incbin | 0x0E7854 | 4096 |
| obj1_75000 | incbin | 0x0E8854 | 4096 |
| obj1_76000 | incbin | 0x0E9854 | 4096 |
| obj1_77000 | incbin | 0x0EA854 | 4096 |
| obj1_78000 | incbin | 0x0EB854 | 4096 |
| obj1_79000 | incbin | 0x0EC854 | 4096 |
| obj1_7A000 | incbin | 0x0ED854 | 4096 |
| obj1_7B000 | incbin | 0x0EE854 | 4096 |
| obj1_7C000 | incbin | 0x0EF854 | 4096 |
| obj1_7D000 | incbin | 0x0F0854 | 4096 |
| obj1_7E000 | incbin | 0x0F1854 | 4096 |
| obj1_7F000 | incbin | 0x0F2854 | 4096 |
| obj1_80000 | incbin | 0x0F3854 | 4096 |
| obj1_81000 | incbin | 0x0F4854 | 4096 |
| obj1_82000 | incbin | 0x0F5854 | 4096 |
| obj1_83000 | incbin | 0x0F6854 | 4096 |
| obj1_84000 | incbin | 0x0F7854 | 4096 |
| obj1_85000 | incbin | 0x0F8854 | 4096 |
| obj1_86000 | incbin | 0x0F9854 | 4096 |
| obj1_87000 | incbin | 0x0FA854 | 4096 |
| obj1_88000 | incbin | 0x0FB854 | 4096 |
| obj1_89000 | incbin | 0x0FC854 | 4096 |
| obj1_8A000 | incbin | 0x0FD854 | 4096 |
| obj1_8B000 | incbin | 0x0FE854 | 4096 |
| obj1_8C000 | incbin | 0x0FF854 | 4096 |
| obj1_8D000 | incbin | 0x100854 | 4096 |
| obj1_8E000 | incbin | 0x101854 | 4096 |
| obj1_8F000 | incbin | 0x102854 | 4096 |
| obj1_90000 | incbin | 0x103854 | 4096 |
| obj1_91000 | incbin | 0x104854 | 4096 |
| obj1_92000 | incbin | 0x105854 | 4096 |
| obj1_93000 | incbin | 0x106854 | 4096 |
| obj1_94000 | incbin | 0x107854 | 4096 |
| obj1_95000 | incbin | 0x108854 | 4096 |
| obj1_96000 | incbin | 0x109854 | 4096 |
| obj1_97000 | incbin | 0x10A854 | 4096 |
| obj1_98000 | incbin | 0x10B854 | 4096 |
| obj1_99000 | incbin | 0x10C854 | 4096 |
| obj1_9A000 | incbin | 0x10D854 | 4096 |
| obj1_9B000 | incbin | 0x10E854 | 4096 |
| obj1_9C000 | incbin | 0x10F854 | 4096 |
| obj1_9D000 | incbin | 0x110854 | 4096 |
| obj1_9E000 | incbin | 0x111854 | 4096 |
| obj1_9F000 | incbin | 0x112854 | 4096 |
| obj1_A0000 | incbin | 0x113854 | 4096 |
| obj1_A1000 | incbin | 0x114854 | 4096 |
| obj1_A2000 | incbin | 0x115854 | 4096 |
| obj1_A3000 | incbin | 0x116854 | 4096 |
| obj1_A4000 | incbin | 0x117854 | 4096 |
| obj1_A5000 | incbin | 0x118854 | 4096 |
| obj1_A6000 | incbin | 0x119854 | 4096 |
| obj1_A7000 | incbin | 0x11A854 | 4096 |
| obj1_A8000 | incbin | 0x11B854 | 4096 |
| obj1_A9000 | incbin | 0x11C854 | 4096 |
| obj1_AA000 | incbin | 0x11D854 | 4096 |
| obj1_AB000 | incbin | 0x11E854 | 4096 |
| obj1_AC000 | incbin | 0x11F854 | 4096 |
| obj1_AD000 | incbin | 0x120854 | 4096 |
| obj1_AE000 | incbin | 0x121854 | 4096 |
| obj1_AF000 | incbin | 0x122854 | 4096 |
| obj1_B0000 | incbin | 0x123854 | 4096 |
| obj1_B1000 | incbin | 0x124854 | 4096 |
| obj1_B2000 | incbin | 0x125854 | 4096 |
| obj1_B3000 | incbin | 0x126854 | 4096 |
| obj1_B4000 | incbin | 0x127854 | 4096 |
| obj1_B5000 | incbin | 0x128854 | 4096 |
| obj1_B6000 | incbin | 0x129854 | 4096 |
| obj1_B7000 | incbin | 0x12A854 | 4096 |
| obj1_B8000 | incbin | 0x12B854 | 4096 |
| obj1_B9000 | incbin | 0x12C854 | 4096 |
| obj1_BA000 | incbin | 0x12D854 | 4096 |
| obj1_BB000 | incbin | 0x12E854 | 4096 |
| obj1_BC000 | incbin | 0x12F854 | 4096 |
| obj1_BD000 | incbin | 0x130854 | 4096 |
| obj1_BE000 | incbin | 0x131854 | 4096 |
| obj1_BF000 | incbin | 0x132854 | 4096 |
| obj1_C0000 | incbin | 0x133854 | 4096 |
| obj1_C1000 | incbin | 0x134854 | 4096 |
| obj1_C2000 | incbin | 0x135854 | 4096 |
| obj1_C3000 | incbin | 0x136854 | 4096 |
| obj1_C4000 | incbin | 0x137854 | 4096 |
| obj1_C5000 | incbin | 0x138854 | 4096 |
| obj1_C6000 | incbin | 0x139854 | 4096 |
| obj1_C7000 | incbin | 0x13A854 | 4096 |
| obj1_C8000 | incbin | 0x13B854 | 4096 |
| obj1_C9000 | incbin | 0x13C854 | 4096 |
| obj1_CA000 | incbin | 0x13D854 | 4096 |
| obj1_CB000 | incbin | 0x13E854 | 4096 |
| obj1_CC000 | incbin | 0x13F854 | 4096 |
| obj1_CD000 | incbin | 0x140854 | 4096 |
| obj1_CE000 | incbin | 0x141854 | 4096 |
| obj1_CF000 | incbin | 0x142854 | 4096 |
| obj1_D0000 | incbin | 0x143854 | 4096 |
| obj1_D1000 | incbin | 0x144854 | 4096 |
| obj1_D2000 | incbin | 0x145854 | 4096 |
| obj2_00000 | incbin | 0x146854 | 4096 |
| obj3_00000 | incbin | 0x147854 | 4096 |
| obj4_00000 | incbin | 0x148854 | 4096 |
| obj4_01000 | incbin | 0x149854 | 4096 |
| obj4_02000 | incbin | 0x14A854 | 4096 |
| obj4_03000 | incbin | 0x14B854 | 4096 |
| obj4_04000 | incbin | 0x14C854 | 4096 |
| obj4_05000 | incbin | 0x14D854 | 4096 |
| obj4_06000 | incbin | 0x14E854 | 4096 |
| obj4_07000 | incbin | 0x14F854 | 4096 |
| obj4_08000 | incbin | 0x150854 | 4096 |
| obj4_09000 | incbin | 0x151854 | 4096 |
| obj4_0A000 | incbin | 0x152854 | 4096 |
| obj4_0B000 | incbin | 0x153854 | 4096 |
| obj4_0C000 | incbin | 0x154854 | 4096 |
| obj4_0D000 | incbin | 0x155854 | 4096 |
| obj4_0E000 | incbin | 0x156854 | 4096 |
| obj4_0F000 | incbin | 0x157854 | 4096 |
| obj4_10000 | incbin | 0x158854 | 4096 |
| obj4_11000 | incbin | 0x159854 | 4096 |
| obj4_12000 | incbin | 0x15A854 | 4096 |
| obj4_13000 | incbin | 0x15B854 | 4096 |
| obj4_14000 | incbin | 0x15C854 | 4096 |
| obj4_15000 | incbin | 0x15D854 | 4096 |
| obj4_16000 | incbin | 0x15E854 | 4096 |
| obj4_17000 | incbin | 0x15F854 | 4096 |
| obj4_18000 | incbin | 0x160854 | 4096 |
| obj4_19000 | incbin | 0x161854 | 4096 |
| obj4_1A000 | incbin | 0x162854 | 4096 |
| obj4_1B000 | incbin | 0x163854 | 4096 |
| obj4_1C000 | incbin | 0x164854 | 4096 |
| obj4_1D000 | incbin | 0x165854 | 4096 |
| obj4_1E000 | incbin | 0x166854 | 4096 |
| obj4_1F000 | incbin | 0x167854 | 4096 |
| obj4_20000 | incbin | 0x168854 | 4096 |
| obj4_21000 | incbin | 0x169854 | 4096 |
| obj4_22000 | incbin | 0x16A854 | 4096 |
| obj4_23000 | incbin | 0x16B854 | 4096 |
| obj4_24000 | incbin | 0x16C854 | 4096 |
| obj4_25000 | incbin | 0x16D854 | 4096 |
| obj4_26000 | incbin | 0x16E854 | 4096 |
| obj4_27000 | incbin | 0x16F854 | 4096 |
| obj4_28000 | incbin | 0x170854 | 4096 |
| obj4_29000 | incbin | 0x171854 | 4096 |
| obj4_2A000 | incbin | 0x172854 | 4096 |
| obj4_2B000 | incbin | 0x173854 | 4096 |
| obj4_2C000 | incbin | 0x174854 | 4096 |
| obj4_2D000 | incbin | 0x175854 | 4096 |
| obj4_2E000 | incbin | 0x176854 | 4096 |
| obj4_2F000 | incbin | 0x177854 | 4096 |
| obj4_30000 | incbin | 0x178854 | 4096 |
| obj4_31000 | incbin | 0x179854 | 4096 |
| obj4_32000 | incbin | 0x17A854 | 4096 |
| obj4_33000 | incbin | 0x17B854 | 4096 |
| obj4_34000 | incbin | 0x17C854 | 4096 |
| obj4_35000 | incbin | 0x17D854 | 4096 |
| obj4_36000 | incbin | 0x17E854 | 4096 |
| obj4_37000 | incbin | 0x17F854 | 4096 |
| obj4_38000 | incbin | 0x180854 | 4096 |
| obj4_39000 | incbin | 0x181854 | 4096 |
| obj4_3A000 | incbin | 0x182854 | 4096 |
| obj4_3B000 | incbin | 0x183854 | 4096 |
| obj4_3C000 | incbin | 0x184854 | 4096 |
| obj4_3D000 | incbin | 0x185854 | 4096 |
| obj4_3E000 | incbin | 0x186854 | 4096 |
| obj4_3F000 | incbin | 0x187854 | 4096 |
| obj4_40000 | incbin | 0x188854 | 4096 |
| obj4_41000 | incbin | 0x189854 | 1431 |
