#!/usr/bin/env python3
"""callprop.py REPO95 REPO96 [--align [MINVOTES]] - propose 96 names for called routines.

Takes every routine that has the same name in both repos and pairs their calls (Watcom __CHK left out).
Default: only routine pairs whose call lists have the same length, paired by position. --align: lists of different
length are aligned (a named call must equal its partner; an unnamed 96 call may pair with any 95 call), kept when
80% lines up around 2 or more named anchors; MINVOTES (default 2) is the least number of aligned calls.
Prints `96_label 95_name votes routines`. These are leads: check the address order against the NHL95PC module
before feeding them to rename_symbol.py, then run again, since every new name adds routine pairs.

  python3 tools/names/callprop.py ../NHL95PC .
  python3 tools/names/callprop.py ../NHL95PC . --align 1"""
import re, glob, sys, collections

AUTO = re.compile(r'^(sub|loc|locret|byte|word|dword|off|unk|asc|nullsub|j)_')


def funcs(repo):
    """routine name -> ordered list of called symbols, for every code file of the repo"""
    d = {}
    for p in glob.glob(repo + '/src/**/*.asm', recursive=True):
        if '/data/' in p: continue
        cur = None; calls = []
        for l in open(p, errors='replace'):
            m = re.match(r'^([A-Za-z_][A-Za-z0-9_]*):', l)
            if m:
                nm = m.group(1)
                if nm.startswith(('loc_', 'locret_')) or (cur and nm.startswith(cur + '_')): continue
                if cur: d[cur] = calls
                cur = nm; calls = []
            else:
                c = re.match(r'call\s+(\w+)', l.strip())
                if c and c.group(1) != '__CHK': calls.append(c.group(1))
        if cur: d[cur] = calls
    return d


def align(x, y):
    """longest pairing of x (95 calls) with y (96 calls): equal names, or an unnamed 96 call with anything"""
    n, m = len(x), len(y)
    def sc(p, q): return 1 if AUTO.match(q) else (3 if p == q else -9)
    D = [[0] * (m + 1) for _ in range(n + 1)]
    for i in range(n - 1, -1, -1):
        for j in range(m - 1, -1, -1):
            s = sc(x[i], y[j])
            D[i][j] = max(D[i + 1][j], D[i][j + 1], D[i + 1][j + 1] + s if s > 0 else -1)
    i = j = 0; out = []
    while i < n and j < m:
        s = sc(x[i], y[j])
        if s > 0 and D[i][j] == D[i + 1][j + 1] + s: out.append((x[i], y[j])); i += 1; j += 1
        elif D[i][j] == D[i + 1][j]: i += 1
        else: j += 1
    return out


def main():
    a = funcs(sys.argv[1]); b = funcs(sys.argv[2])
    loose = '--align' in sys.argv
    minv = 1
    if loose:
        k = sys.argv.index('--align')
        minv = int(sys.argv[k + 1]) if len(sys.argv) > k + 1 else 2
    votes = collections.defaultdict(collections.Counter); ev = collections.defaultdict(set)
    for n in a:
        if AUTO.match(n) or n not in b: continue
        ca, cb = a[n], b[n]
        if not ca or not cb: continue
        if loose:
            al = align(ca, cb)
            if len(al) < 0.8 * max(len(ca), len(cb)) or sum(1 for p, q in al if p == q) < 2: continue
        else:
            if len(ca) != len(cb): continue
            if any(not AUTO.match(p) and not AUTO.match(q) and p != q for p, q in zip(ca, cb)): continue
            al = list(zip(ca, cb))
        for p, q in al:
            if AUTO.match(q) and not AUTO.match(p): votes[q][p] += 1; ev[(q, p)].add(n)
    for q, c in sorted(votes.items()):
        (p, k), = c.most_common(1)
        if len(c) > 1 and (not loose or k < 0.75 * sum(c.values())): print('#CONFLICT', q, dict(c)); continue
        if p in b: print('#TAKEN', q, p, k); continue
        if k < minv: continue
        print(q, p, k, ','.join(sorted(ev[(q, p)])[:5]))


if __name__ == '__main__':
    main()
