"""refprop.py REPO95 REPO96 - leads: unnamed 96 routines whose named references match one 95 routine not yet in 96.
Prints `96_label 95_name score ...`; check each with order_check.py before renaming."""
import re, glob, sys, collections, math
AUTO = re.compile(r'^(sub|loc|locret|byte|word|dword|off|unk|asc|nullsub|j|str|flt|dbl|jpt|def)_')
KW = set('mov add sub cmp jmp call push pop lea test and or xor inc dec byte word dword short near ptr eax ebx ecx edx esi edi ebp esp ax bx cx dx si di al bl cl dl ah bh ch dh movsx movzx imul idiv shl shr sar neg not ret retn je jne jl jle jg jge jb jbe ja jae jz jnz js jns es ds cs fs gs cdq sete setne nop leave enter rep movsd movsb stosd stosb'.split())
def funcs(repo):
    d = {}; order = []
    for p in sorted(glob.glob(repo + '/src/**/*.asm', recursive=True)):
        if '/data/' in p or '/lib/' in p: continue
        cur = None
        for l in open(p, errors='replace'):
            m = re.match(r'^([A-Za-z_][A-Za-z0-9_]*):', l)
            if m:
                nm = m.group(1)
                if nm.startswith(('loc_', 'locret_')) or (cur and nm.startswith(cur + '_')): continue
                cur = nm; d[cur] = collections.Counter(); order.append((p, nm)); continue
            if cur is None or l.startswith(('global', 'extern', ';', '%', 'section')): continue
            code = l.split(';')[0]
            for t in re.findall(r'[A-Za-z_][A-Za-z0-9_]*', code):
                if t.lower() in KW or AUTO.match(t) or re.fullmatch(r'[0-9A-Fa-f]+h', t): continue
                d[cur][t] += 1
            d[cur]['#n'] += 1
    return d
a = funcs(sys.argv[1]); b = funcs(sys.argv[2])
df = collections.Counter()
for n, c in a.items():
    for t in c: df[t] += 1
N = len(a)
def w(t): return math.log(N / (1 + df[t])) if t != '#n' else 0
cand = {n: c for n, c in a.items() if not AUTO.match(n) and n not in b}
res = []
for q, cq in b.items():
    if not q.startswith('sub_'): continue
    sq = {t for t in cq if t != '#n'}
    if len(sq) < 3: continue
    best = []
    for n, cn in cand.items():
        sn = {t for t in cn if t != '#n'}
        inter = sq & sn
        if len(inter) < 3: continue
        s = sum(w(t) for t in inter) / (sum(w(t) for t in sq | sn) + 1e-9)
        best.append((s, n, len(inter), len(sq), len(sn), cq['#n'], cn['#n']))
    best.sort(reverse=True)
    if best and best[0][0] > 0.45 and (len(best) < 2 or best[0][0] > best[1][0] * 1.25):
        res.append((best[0], q))
for (s, n, i, lq, ln, nq, nn), q in sorted(res, reverse=True):
    print('%s %s %.2f common %d of %d/%d lines %d/%d' % (q, n, s, i, lq, ln, nq, nn))
