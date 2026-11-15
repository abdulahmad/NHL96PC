#!/usr/bin/env python3
"""func_features.py - per-function features of a HOCKEY.EXE for cross-game matching (95 PC <-> 96 PC).

  python3 tools/names/func_features.py REPO OUT.pkl

REPO is a checkout of NHL96PC or NHL95PC with build/parts present (rebuild_exe.py extract; for NHL95PC also a
finished `make`, whose objects give the current label names). Uses REPO's own tools/build/fixup_labels.py, so the
same instruction sweep that generated its sources. Output: dict(funcs=[...], names={addr: name}, files=[(start, end,
file)]) where each function has
  start, end      linear range (entry to the next entry)
  strict          one token per instruction: its bytes with fixup fields and out-of-function branch fields zeroed
  loose           one token per instruction: mnemonic + registers (no constants)
  calls           near call/jmp targets that leave the function, in order
  refs            (instruction index, target) for every fixup field, in order
  consts          immediates of 100h and up that carry no fixup, in order
"""
import os, sys, pickle, bisect

def main():
    repo, out = os.path.abspath(sys.argv[1]), sys.argv[2]
    sys.path.insert(0, os.path.join(repo, 'tools')); sys.path.insert(0, os.path.join(repo, 'tools/build'))
    os.chdir(repo)
    import iced_x86 as I
    import fixup_labels as FL
    A = FL.analyse(use_listing=os.path.exists(os.path.join(repo, 'tools/funcs.pkl')))
    REG = {getattr(I.Register, n): n.lower() for n in dir(I.Register) if not n.startswith('_') and isinstance(getattr(I.Register, n), int)}
    MN = {getattr(I.Mnemonic, n): n.lower() for n in dir(I.Mnemonic) if not n.startswith('_') and isinstance(getattr(I.Mnemonic, n), int)}
    fe = sorted(a for a in A.fentry if A.CB <= a < A.CE)
    srcs = sorted(s for s in A.tgt if A.CB <= s < A.CE)
    funcs = []; cur = None; k = 0
    ins_list = A.insns
    starts = [x[0] for x in ins_list]
    for fi, f0 in enumerate(fe):
        f1 = fe[fi + 1] if fi + 1 < len(fe) else A.CE
        i0 = bisect.bisect_left(starts, f0); i1 = bisect.bisect_left(starts, f1)
        strict = []; loose = []; calls = []; refs = []; consts = []
        for a, n, kind, ins in ins_list[i0:i1]:
            raw = bytearray(A.byte(a, n))
            j0 = bisect.bisect_left(srcs, a); fx = []
            while j0 < len(srcs) and srcs[j0] < a + n: fx.append(srcs[j0]); j0 += 1
            for s in fx:
                for q in range(4):
                    if s - a + q < n: raw[s - a + q] = 0
                refs.append((len(strict), A.tgt[s]))
            if kind != 'insn':
                strict.append('D%d' % n if fx else 'D' + raw.hex()); loose.append('D'); continue
            isbr = ins.is_call_near or ins.is_jmp_short_or_near or ins.is_jcc_short_or_near
            if isbr:
                t = ins.near_branch_target
                if not (f0 <= t < f1):
                    calls.append(t)
                    if n >= 5: raw[-4:] = b'\0\0\0\0'
                    else: raw[-1] = 0
            strict.append(raw.hex())
            ops = [MN.get(ins.mnemonic, '?')]
            for o in range(ins.op_count):
                ok = ins.op_kind(o)
                if ok == I.OpKind.REGISTER: ops.append(REG[ins.op_register(o)])
                elif ok == I.OpKind.MEMORY: ops.append('[%s,%s]' % (REG[ins.memory_base], REG[ins.memory_index]))
                else:
                    ops.append('i')
                    if ok in (I.OpKind.IMMEDIATE32, I.OpKind.IMMEDIATE16, I.OpKind.IMMEDIATE8TO32, I.OpKind.IMMEDIATE8, I.OpKind.IMMEDIATE8TO16) and not fx:
                        v = ins.immediate(o) & 0xFFFFFFFF
                        if 0x100 <= v < 0xFFFFFF00: consts.append(v)
            loose.append(' '.join(ops))
        funcs.append(dict(start=f0, end=f1, strict=strict, loose=loose, calls=calls, refs=refs, consts=consts))
    names = dict(A.names); files = []
    seg_txt = os.path.join(repo, 'src/segments.txt')
    if os.path.exists(seg_txt) and os.path.isdir(os.path.join(repo, 'build/obj0')) or os.path.isdir(os.path.join(repo, 'build/obj')):
        from link_src import read_layout
        import update_symbols
        segs = read_layout()
        objdir = os.path.join(repo, 'build/obj0') if os.path.isdir(os.path.join(repo, 'build/obj0')) else os.path.join(repo, 'build/obj')
        names = {a: n for n, a in update_symbols.addresses(objdir, segs).items()}
        files = [(s['start'], s['end'], s['src'], s['module']) for s in segs]
    else:
        files = [(s[0], s[1], '', s[2]) for s in A.segs]
    objs = {k: (o['base'], o['vsize'], bytes(o['img'])) for k, o in A.objs.items()}
    pickle.dump(dict(funcs=funcs, names=names, files=files, objs=objs, tgt_code=None), open(out, 'wb'))
    print(repo, 'functions', len(funcs), 'names', len(names), 'files', len(files))

if __name__ == '__main__':
    main()
