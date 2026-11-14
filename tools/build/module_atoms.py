#!/usr/bin/env python3
"""module_atoms.py - evidence for the module (C file) split of the 96 PC code object.

  python3 tools/build/module_atoms.py build/f96.pkl [tools/names/match95.csv]

An atom is a run of functions the compiler output proves came from one C file (the same clues NHL95PC's
docs/MODULE_LAYOUT.md uses):
  * a jump from one function into the body of another (Watcom merges exits only inside one compilation unit)
  * overlapping string-literal ranges (each module has its own literal pool, laid down in link order)
Atoms are minimum groups: a module is one or more neighbouring atoms. Prints one line per atom: start, size,
functions, the NHL95PC modules its matched functions come from, and the first strings it uses."""
import sys, pickle, csv, bisect
from collections import Counter

def atoms(path, matchcsv=None, game_end=None):
    b = pickle.load(open(path, 'rb')); objs = b['objs']; cb, cv, cimg = objs[1]
    F = b['funcs']; starts = [f['start'] for f in F]
    datas = [(bb, img) for k, (bb, v, img) in objs.items() if k > 1]
    def cstr(a, n=40):
        for bb, img in datas:
            if bb <= a < bb + len(img):
                bs = img[a - bb:a - bb + 200]; z = bs.find(b'\0')
                if z >= 2 and all(32 <= c < 127 or c in (9, 10, 13) for c in bs[:z]): return bs[:z].decode()[:n]
        return None
    # the game's literal pool: strings used by exactly one neighbourhood; library pools come later in the object
    lit = {}
    for i, f in enumerate(F):
        for _, t in f['refs']:
            if cstr(t) is not None: lit.setdefault(t, set()).add(i)
    local = {t for t, s in lit.items() if max(s) - min(s) <= 40}       # used only by functions close together
    # drop strings that are out of pool order (globals laid down elsewhere): a literal belongs to the pool only if
    # the literals of the functions around it are near it
    order = sorted(local, key=lambda t: (min(lit[t]), t))
    keep = set()
    for k, t in enumerate(order):
        near = order[max(0, k - 6):k] + order[k + 1:k + 7]
        if sum(1 for u in near if abs(u - t) <= 0x400) >= len(near) // 2 + 1: keep.add(t)
    local = keep
    parent = list(range(len(F)))
    def find(x):
        while parent[x] != x: parent[x] = parent[parent[x]]; x = parent[x]
        return x
    def join(i, j):
        for k in range(min(i, j), max(i, j)): parent[find(k + 1)] = find(k)
    for i, f in enumerate(F):
        for t in f['calls']:
            if cb <= t < cb + cv and t not in b_starts(starts):
                j = bisect.bisect_right(starts, t) - 1
                if j >= 0 and abs(j - i) <= 60: join(i, j)
    rng = []
    for i, f in enumerate(F):
        ts = [t for _, t in f['refs'] if t in local]
        rng.append((min(ts), max(ts)) if ts else None)
    last = None
    for i in range(len(F)):
        if rng[i] is None: continue
        if last is not None and rng[i][0] <= rng[last][1] and i - last <= 40:
            join(last, i)
            rng[i] = (min(rng[i][0], rng[last][0]), max(rng[i][1], rng[last][1]))
        last = i
    m95 = {}
    if matchcsv:
        for r in csv.DictReader(open(matchcsv)):
            if r['kind'] == 'func': m95[int(r['addr96'], 16)] = r
    out = []; i = 0
    while i < len(F):
        j = i
        while j + 1 < len(F) and find(j + 1) == find(i): j += 1
        fs = F[i:j + 1]
        mods = Counter()
        for f in fs:
            r = m95.get(f['start'])
            if r: mods[r['file95'].rsplit('.', 1)[0]] += f['end'] - f['start']
        strs = []
        for f in fs:
            for _, t in f['refs']:
                s = cstr(t, 14)
                if s and s not in strs: strs.append(s)
        out.append(dict(start=fs[0]['start'], end=fs[-1]['end'], n=len(fs), mods=mods, strs=strs))
        i = j + 1
    return out

_bs = {}
def b_starts(starts):
    if id(starts) not in _bs: _bs[id(starts)] = set(starts)
    return _bs[id(starts)]

if __name__ == '__main__':
    for a in atoms(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else None):
        print('%05X %5X %3d %s | %s' % (a['start'], a['end'] - a['start'], a['n'],
              ','.join('%s:%X' % (k.split('/')[-1], v) for k, v in a['mods'].most_common(2)), ' '.join(a['strs'][:6])[:70]))
