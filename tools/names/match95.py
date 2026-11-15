#!/usr/bin/env python3
"""match95.py - match NHL 96 PC functions and data to NHL 95 PC (names and module layout carried over).

  python3 tools/names/func_features.py ../NHL95PC build/f95.pkl      (NHL95PC built with `make CBUILD=0` first)
  python3 tools/names/func_features.py . build/f96.pkl
  python3 tools/names/match95.py build/f95.pkl build/f96.pkl [--out tools/names/match95.csv]

Stages (each match records its method, so the evidence can be reviewed):
  exact     the same instruction bytes once fixup fields and call targets are zeroed (libraries: Watcom, EA, sound)
  loose     the same mnemonic/register sequence, unique on both sides
  callsite  the n-th call of an exact/loose pair, when both sides make the same number of calls
  sem       game code (96 was compiled without stack checks, so bytes differ): score over shared string literals,
            matched callees and callers, matched data and rare constants; accepted only as a mutual best match with a
            clear margin
Data: a string literal with the same text (unique on both sides); a data target at the same fixup position of an
exact/loose pair; a data target referenced by the same set of matched functions (unique on both sides, 2+ functions).
Output CSV: kind,addr96,addr95,name95,file95,method,score,evidence. Nothing is renamed here: gen_src.py /
rename_symbol.py take the names from docs/name_map.csv, which import_match95.py fills from the high-confidence rows."""
import sys, pickle, csv, math, re, argparse, bisect, difflib
from collections import defaultdict, Counter

AUTO = re.compile(r'(sub|loc|locret|byte|word|dword|unk|off|asc|stru|qword|flt|dbl|tbyte|nullsub|j_sub|jpt|def|algn|funcs)_[0-9A-Fa-f]+$|unknown_libname_\d+$')

class Game:
    def __init__(s, path):
        d = pickle.load(open(path, 'rb')); s.F = d['funcs']; s.names = d['names']; s.files = d['files']; s.objs = d['objs']
        s.by = {f['start']: i for i, f in enumerate(s.F)}; s.starts = [f['start'] for f in s.F]
        s.cb, s.cv, _ = s.objs[1]
        for i, f in enumerate(s.F): f['i'] = i
        s.callers = defaultdict(set)
        for i, f in enumerate(s.F):
            f['callees'] = [s.by[t] for t in f['calls'] if t in s.by]
            for c in f['callees']: s.callers[c].add(i)
    def iscode(s, a): return s.cb <= a < s.cb + s.cv
    def byte(s, a, n):
        for k, (b, v, img) in s.objs.items():
            if b <= a < b + len(img): return img[a - b:a - b + n]
        return b''
    def cstr(s, a):
        if s.iscode(a): return None
        bs = s.byte(a, 200); z = bs.find(b'\0')
        if z < 4 or not all(32 <= c < 127 or c in (9, 10, 13) for c in bs[:z]): return None
        return bs[:z].decode('latin1')
    def file(s, a):
        for s0, s1, src, mod in s.files:
            if s0 <= a < s1: return src or mod
        return ''
    def fname(s, i): return s.names.get(s.F[i]['start'], 'sub_%05X' % s.F[i]['start'])

def main():
    ap = argparse.ArgumentParser(); ap.add_argument('f95'); ap.add_argument('f96'); ap.add_argument('--out', default='tools/names/match95.csv')
    a = ap.parse_args()
    A, B = Game(a.f95), Game(a.f96)
    M = {}; R = {}; how = {}          # 95 index -> 96 index, reverse, (method, score, evidence)
    for G in (A, B):
        for f in G.F: f['mn'] = [x.split()[0] for x in f['loose']]
    rcache = {}
    def ratio(i, j):
        if (i, j) not in rcache:
            x, y = A.F[i]['mn'], B.F[j]['mn']
            rcache[i, j] = 0.0 if min(len(x), len(y)) * 2 < max(len(x), len(y)) else difflib.SequenceMatcher(None, x, y, autojunk=False).ratio()
        return rcache[i, j]
    def put(i, j, method, score=1.0, ev=''):
        if i in M or j in R: return False
        M[i] = j; R[j] = i; how[i] = (method, score, ev); return True
    # ---- exact / loose
    for key, method in ((lambda f: '|'.join(f['strict']), 'exact'), (lambda f: '|'.join(f['loose']), 'loose')):
        da, db = defaultdict(list), defaultdict(list)
        for f in A.F:
            if f['i'] not in M and len(f['strict']) >= (3 if method == 'exact' else 8): da[key(f)].append(f['i'])
        for f in B.F:
            if f['i'] not in R and len(f['strict']) >= (3 if method == 'exact' else 8): db[key(f)].append(f['i'])
        for k, v in da.items():
            if len(v) == 1 and len(db.get(k, ())) == 1: put(v[0], db[k][0], method, 1.0, '%d instructions' % len(A.F[v[0]]['strict']))
    # ---- call sites of byte-equal pairs
    changed = True
    while changed:
        changed = False
        for i, j in list(M.items()):
            if how[i][0] not in ('exact', 'loose', 'callsite'): continue
            ca, cb = A.F[i]['calls'], B.F[j]['calls']
            if len(ca) != len(cb): continue
            for x, y in zip(ca, cb):
                if x in A.by and y in B.by:
                    fx, fy = A.F[A.by[x]], B.F[B.by[y]]
                    if fx['i'] in M or fy['i'] in R: continue
                    la, lb = len(fx['loose']), len(fy['loose'])
                    if min(la, lb) * 2 < max(la, lb): continue
                    if put(fx['i'], fy['i'], 'callsite', 0.9, 'called at the same place of %s' % A.fname(i)): changed = True
    # ---- similar: mnemonic sequences that are nearly the same (mutual best with a margin), 25+ instructions
    import numpy as np
    def similar(minlen, thr, margin):
        ua = [f['i'] for f in A.F if f['i'] not in M and len(f['mn']) >= minlen]; ub = [f['i'] for f in B.F if f['i'] not in R and len(f['mn']) >= minlen]
        if not ua or not ub: return 0
        voc = {}
        def vec(L, G):
            V = np.zeros((len(L), 400), dtype=np.float32)
            for r_, i in enumerate(L):
                for m_ in G.F[i]['mn']: V[r_, voc.setdefault(m_, len(voc) % 400)] += 1
            return V / np.maximum(np.linalg.norm(V, axis=1, keepdims=True), 1e-9)
        C = vec(ua, A) @ vec(ub, B).T
        top = np.argsort(-C, axis=1)[:, :6]
        ba = {}; bb = defaultdict(list)
        for r_, i in enumerate(ua):
            sc = sorted(((ratio(i, ub[c]), ub[c]) for c in top[r_]), reverse=True)
            ba[i] = sc
            for v, j in sc: bb[j].append((v, i))
        n = 0
        for i, sc in ba.items():
            v, j = sc[0]; v2 = sc[1][0] if len(sc) > 1 else 0
            o = sorted(bb[j], reverse=True)
            if o[0][1] == i and v >= thr and v - max(v2, o[1][0] if len(o) > 1 else 0) >= margin:
                if put(i, j, 'similar', round(v, 3), 'mnemonic similarity %.2f over %d instructions' % (v, len(A.F[i]['mn']))): n += 1
        return n
    print('similar +%d' % similar(25, 0.85, 0.08), file=sys.stderr)
    # ---- data anchors: strings with the same text, unique on both sides
    D = {}; Dhow = {}
    def strs(G):
        out = defaultdict(set)
        for f in G.F:
            for _, t in f['refs']:
                s = G.cstr(t)
                if s is not None: out[s].add(t)
        return out
    sa, sb = strs(A), strs(B)
    for s, ta in sa.items():
        if len(ta) == 1 and len(sb.get(s, ())) == 1:
            x, y = next(iter(ta)), next(iter(sb[s])); D[x] = y; Dhow[x] = ('string', repr(s)[:60])
    # positional data refs of byte-equal pairs
    def positional():
        for i, j in M.items():
            if how[i][0] not in ('exact', 'loose'): continue
            ra, rb = A.F[i]['refs'], B.F[j]['refs']
            if len(ra) != len(rb): continue
            for (p, x), (q, y) in zip(ra, rb):
                if p == q and not A.iscode(x) and not B.iscode(y) and x not in D: D[x] = y; Dhow[x] = ('position', 'same fixup of %s' % A.fname(i))
    positional()
    # ---- semantic stage
    def feats(G, f, side):
        out = Counter()
        for _, t in f['refs']:
            if G.iscode(t): continue
            s = G.cstr(t)
            if s is not None: out['S:' + s] += 1
            if side == 'a' and t in D: out['D:%X' % D[t]] += 1
            elif side == 'b' and t in Drev: out['D:%X' % t] += 1
        for c in f['callees']:
            if side == 'a' and c in M: out['C:%d' % M[c]] += 1
            elif side == 'b' and c in R: out['C:%d' % c] += 1
        for c in G.callers[f['i']]:
            if side == 'a' and c in M: out['R:%d' % M[c]] += 1
            elif side == 'b' and c in R: out['R:%d' % c] += 1
        for v in set(f['consts']): out['K:%X' % v] += 1
        return out
    for rnd in range(12):
        Drev = {y: x for x, y in D.items()}
        fa = {f['i']: feats(A, f, 'a') for f in A.F if f['i'] not in M}
        fb = {f['i']: feats(B, f, 'b') for f in B.F if f['i'] not in R}
        df = Counter()
        for d in list(fa.values()) + list(fb.values()):
            for k in d: df[k] += 1
        w = {k: 1.0 / math.log(2 + n) * (2.0 if k[0] in 'SCD' else 1.0) for k, n in df.items()}
        inv = defaultdict(list)
        for j, d in fb.items():
            for k in d: inv[k].append(j)
        def score(da, db):
            num = sum(w[k] * min(da[k], db[k]) for k in da if k in db)
            den = sum(w[k] * max(da[k], db.get(k, 0)) for k in da) + sum(w[k] * db[k] for k in db if k not in da)
            return num / den if den else 0.0, num
        best_a = {}; cand_b = defaultdict(list)
        for i, da in fa.items():
            cands = Counter()
            for k in da:
                if len(inv[k]) <= 40:
                    for j in inv[k]: cands[j] += 1
            sc = sorted(((score(da, fb[j]) + (j,)) for j in cands), reverse=True)[:3]
            if sc: best_a[i] = sc
            for s_, num, j in sc: cand_b[j].append((s_, num, i))
        new = 0
        for i, sc in best_a.items():
            s1, num, j = sc[0]; s2 = sc[1][0] if len(sc) > 1 else 0.0
            cb = sorted(cand_b[j], reverse=True)
            if cb[0][2] != i: continue
            s2b = cb[1][0] if len(cb) > 1 else 0.0
            if s1 >= 0.45 and num >= 1.2 and s1 >= 1.5 * max(s2, s2b) + 0.05 and (ratio(i, j) >= 0.5 or max(len(A.F[i]['mn']), len(B.F[j]['mn'])) < 8 and s1 >= 0.9):
                shared = sorted((k for k in fa[i] if k in fb[j]), key=lambda k: -w[k])[:4]
                if put(i, j, 'sem', round(s1, 3), '; '.join(k[:40] for k in shared)): new += 1
        # neighbours: unmatched functions between two matched pairs that keep their order, aligned by mnemonic similarity
        anchors = sorted(M.items())
        keep = []; last = -1
        for i, j in anchors:        # longest run kept simple: drop pairs that break the order
            if j > last: keep.append((i, j)); last = j
        for (i0, j0), (i1, j1) in zip(keep, keep[1:]):
            ua = [i for i in range(i0 + 1, i1) if i not in M]; ub = [j for j in range(j0 + 1, j1) if j not in R]
            if not ua or not ub or len(ua) * len(ub) > 400: continue
            # order-preserving alignment that maximises the sum of ratios
            n, m = len(ua), len(ub); T = [[0.0] * (m + 1) for _ in range(n + 1)]
            for x in range(n - 1, -1, -1):
                for y in range(m - 1, -1, -1):
                    r_ = ratio(ua[x], ub[y]); T[x][y] = max(T[x + 1][y], T[x][y + 1], T[x + 1][y + 1] + (r_ if r_ >= 0.6 else -1))
            x = y = 0
            while x < n and y < m:
                r_ = ratio(ua[x], ub[y])
                if r_ >= 0.6 and T[x][y] == T[x + 1][y + 1] + r_:
                    if min(len(A.F[ua[x]]['mn']), len(B.F[ub[y]]['mn'])) >= 6 and put(ua[x], ub[y], 'neighbour', round(r_, 3), 'between %s and %s, mnemonic similarity %.2f' % (A.fname(i0), A.fname(i1), r_)): new += 1
                    x += 1; y += 1
                elif T[x][y] == T[x + 1][y]: x += 1
                else: y += 1
        # data referenced by the same set of matched functions
        ra, rb = defaultdict(set), defaultdict(set)
        for i, j in M.items():
            for _, t in A.F[i]['refs']:
                if not A.iscode(t) and t not in D: ra[t].add(j)
            for _, t in B.F[j]['refs']:
                if not B.iscode(t) and t not in Drev: rb[t].add(j)
        sa2, sb2 = defaultdict(list), defaultdict(list)
        for t, s in ra.items(): sa2[frozenset(s)].append(t)
        for t, s in rb.items(): sb2[frozenset(s)].append(t)
        nd = 0
        for k, v in sa2.items():
            if len(k) >= 2 and len(v) == 1 and len(sb2.get(k, ())) == 1:
                D[v[0]] = sb2[k][0]; Dhow[v[0]] = ('refset', 'referenced by the same %d matched functions' % len(k)); nd += 1
        if not new: new += similar(15, 0.8, 0.1)
        print('round', rnd, 'functions +%d (total %d)' % (new, len(M)), 'data +%d (total %d)' % (nd, len(D)), file=sys.stderr)
        if not new and not nd: break
    # ---- output
    rows = []
    for i, j in sorted(M.items(), key=lambda x: B.F[x[1]]['start']):
        m, s, ev = how[i]
        rows.append(('func', '%05X' % B.F[j]['start'], '%05X' % A.F[i]['start'], A.fname(i), A.file(A.F[i]['start']), m, s, ev))
    for x, y in sorted(D.items(), key=lambda x: x[1]):
        m, ev = Dhow[x]
        rows.append(('data', '%05X' % y, '%05X' % x, A.names.get(x, ''), A.file(x), m, 1.0 if m != 'refset' else 0.8, ev))
    with open(a.out, 'w', newline='') as fo:
        w_ = csv.writer(fo); w_.writerow('kind,addr96,addr95,name95,file95,method,score,evidence'.split(','))
        w_.writerows(rows)
    c = Counter(r[5] for r in rows if r[0] == 'func'); cd = Counter(r[5] for r in rows if r[0] == 'data')
    named = sum(1 for r in rows if r[0] == 'func' and not AUTO.match(r[3]))
    print('functions: 95 %d, 96 %d, matched %d %s, with a real 95 name %d' % (len(A.F), len(B.F), len(M), dict(c), named))
    print('data: matched %d %s, with a real 95 name %d' % (len(D), dict(cd), sum(1 for r in rows if r[0] == 'data' and r[3] and not AUTO.match(r[3]))))

if __name__ == '__main__':
    main()
