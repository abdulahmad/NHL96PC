#!/usr/bin/env python3
"""dossier.py FILE [ROUTINE...] - a compact summary of every routine in one asm file, for naming by reading.

  python3 tools/names/dossier.py src/front/front_10010.asm            every routine of the file
  python3 tools/names/dossier.py src/front/front_10010.asm sub_10A2C  one routine

Per routine: address, size in lines, callers (who calls / jumps to it, with their file), callees, the strings it
uses (with their text), the data labels it reads or writes, its larger constants, and whether it ends in ret.
Nothing is changed. Names still need the reading: this only collects the evidence in one place."""
import collections, glob, os, re, sys
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
sys.path.insert(0, os.path.join(ROOT, 'tools', 'build'))
import asmaddr

DEF = re.compile(r'^([A-Za-z_][\w@$?]*):')
TOK = re.compile(r'(?<![\w.$?@])([A-Za-z_][\w@$?]*)')
KW = set('''mov add sub cmp jmp call push pop lea test and or xor inc dec byte word dword short near ptr eax ebx ecx edx
esi edi ebp esp ax bx cx dx si di al bl cl dl ah bh ch dh movsx movzx imul idiv div mul shl shr sar sal neg not ret
retn je jne jl jle jg jge jb jbe ja jae jz jnz js jns jc jnc es ds cs fs gs cdq cwd cwde sete setne setl setg setle
setge setb seta setbe setae nop leave enter rep repe repne movsd movsb movsw stosd stosb stosw lodsb lodsw lodsd
scasb cmpsb nosplit LD adc sbb rol ror bt bts btr xchg cld std cli sti in out int iret iretd loop pushad popad
pushfd popfd fld fstp fild fistp fmul fadd fsub fdiv fcomp fnstsw sahf wait db dw dd insn'''.split())


def strings():
    out = {}
    for f in glob.glob(os.path.join(ROOT, 'src', '**', '*.asm'), recursive=True):
        L = open(f, encoding='latin1').read().split('\n')
        for k, l in enumerate(L):
            m = DEF.match(l)
            if not m or not m.group(1).startswith(('str_', 'asc_', 'aS', 'msg_')): continue
            txt = ''
            for l2 in L[k + 1:k + 6]:
                s = l2.split(';')[0].strip()
                if not s.startswith('db'): break
                for x in re.findall(r"'[^']*'|[0-9A-Fa-f]+h|\d+", s[2:]):
                    if x.startswith("'"): txt += x[1:-1]; continue
                    v = int(x[:-1], 16) if x.endswith('h') else int(x)
                    if v == 0: txt += '\\0'; break
                    txt += chr(v) if 32 <= v < 127 else '.'
                if '\\0' in txt: break
            out[m.group(1)] = txt.replace('\\0', '')[:60]
    return out


def main():
    path = os.path.abspath(sys.argv[1]); want = set(sys.argv[2:])
    S = strings()
    files = asmaddr.asm_files()
    # routines of every file, and who references what
    rout_of = {}            # label -> (file, routine)
    refs = collections.defaultdict(set)   # label -> {routine names that use it}
    texts = {}
    for f in files:
        L = open(f, encoding='latin1').read().split('\n'); texts[f] = L
        cur = None
        for l in L:
            m = DEF.match(l)
            if m:
                cur = m.group(1); rout_of[cur] = (f, cur); continue
            if l.startswith(('extern', 'global', ';', '%')) or cur is None: continue
            for t in TOK.findall(l.split(';')[0]): refs[t].add(cur)
    L = texts[path]; A = asmaddr.addrs(path)
    idx = sorted(A)
    import bisect
    blocks = []; cur = None
    for k, l in enumerate(L):
        m = DEF.match(l)
        if m: cur = [m.group(1), k, []]; blocks.append(cur); continue
        if cur and not l.startswith(('extern', 'global', ';')): cur[2].append(l)
    for name, k, body in blocks:
        if want and name not in want: continue
        if not name.startswith('sub_') and not want: continue
        j = bisect.bisect_left(idx, k); a = A[idx[j]] if j < len(idx) else 0
        calls, data, strs, consts = [], collections.Counter(), [], set()
        for l in body:
            code = l.split(';')[0]
            c = re.match(r'\s*(call|jmp)\s+(?:near\s+|short\s+)?(?:dword\s+)?\[?([A-Za-z_][\w@$?]*)', code)
            if c and c.group(1) == 'call': calls.append(c.group(2))
            for t in TOK.findall(code):
                if t in KW or (c and t == c.group(2)): continue
                if t in S: strs.append('%s="%s"' % (t, S[t]))
                elif t in rout_of and not t.startswith(name): data[t] += 1
            consts.update(x for x in re.findall(r'\b([0-9A-F]{3,}h)\b', code))
        callers = sorted(r for r in refs.get(name, ()) if r != name)
        ret = any(l.strip().startswith('ret') for l in body)
        print('== %s %05X  %d lines%s' % (name, a, len(body), '' if ret else '  (no ret: falls through or jumps out)'))
        if callers: print('   from: ' + ', '.join(callers[:12]) + (' ...' if len(callers) > 12 else ''))
        if calls: print('   calls: ' + ', '.join(dict.fromkeys(calls)))
        if strs: print('   strings: ' + ', '.join(dict.fromkeys(strs)))
        if data: print('   data: ' + ', '.join(n for n, _ in data.most_common(14)))
        if consts: print('   consts: ' + ' '.join(sorted(consts)[:14]))


if __name__ == '__main__':
    main()
