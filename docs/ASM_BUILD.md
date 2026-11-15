# Assembly build

`./build.sh` (NASM 2.15+ and Python 3):

1. `tools/build/rebuild_exe.py extract lst/HOCKEY.EXE build/parts`: checks the SHA-1 and takes the third-party
   parts from your EXE: the DOS/16M loader, the DOS/4GW kernel, the Watcom wstub, the LE header fields and the order
   of the fixup records.
2. `nasm -O0 -f elf32 -I src/inc/` for every file of `src/segments.txt`.
3. `tools/build/link_src.py`: each file holds one section `s_<ADDR>`, placed at that linear address. Globals are
   resolved by name. `R_386_32` becomes a 32-bit LE fixup (the stored value is object-relative, as wlink writes it);
   `R_386_PC32` and `R_386_PC8` are resolved in place. The fixup set comes from the relocations only; the EXE's own
   table gives the record order. The EXE is written and compared: the last line is `MATCH` or `MISMATCH`, with the
   first differing addresses.

Layout rules:

- `src/segments.txt` is the link list: object, start, end, initialised bytes, module, file. A file must assemble to
  exactly its size (`assembled size ..., segment size ...` is a link error). Replace an instruction only with one
  of the same length.
- Every instruction line ends with `; <address>`, its address in the EXE.
- `src/inc/hockey.inc` is included by every file: equates and the `LD` macro only, no bytes.
- `LD op, dst, src` (`src/inc/x86enc.inc`): the load form of a reg,reg instruction, which NASM never emits by
  itself. It is the only macro.
- `jmp 0:label wrt ..gotoff`: a far jump whose offset carries a 16:32 pointer fixup. `wrt ..gotoff` makes NASM
  write a relocation the linker recognises (`R_386_GOTOFF`) and turns into LE source type 6; the field stays zero
  in the file, as wlink leaves it.
- A raw `db` line with an instruction in its comment is an encoding NASM would choose differently. Keep the bytes.
- `src/inc/symbols.inc` is the generated index of cross-file labels (`tools/build/update_symbols.py`); never edit it.
- `port/game_syms.h` (port branch only) is generated the same way by `tools/build/gen_port_syms.py`: the port writes a game address as `SYM_<label>`; run the tool after a rename, a missing label is an error.

Tools:

| tool | use |
|---|---|
| `tools/names/rename_symbol.py OLD NEW --evidence ... --source ...` | rename everywhere, rebuild (must MATCH), record in docs/name_map.csv |
| `tools/names/auto_names.py <module>` / `--summary` | what is still to name in a file |
| `tools/names/func_features.py`, `match95.py`, `import_match95.py` | match against NHL95PC (docstrings give the commands) |
| `tools/build/module_atoms.py`, `build_segmap.py` | module evidence and the segment map (maintainers) |
| `tools/build/gen_src.py` | regenerates `src/` from the EXE: it throws away hand edits and refuses without `--force` |
