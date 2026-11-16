#!/usr/bin/env python3
# merge_labels.py FILE START END NAME "desc": fold every label in [START,END) of a bss/data file into one array label NAME;
# references to inner labels become NAME+off. Addresses come from the hex suffix or docs/name_map.csv.
import sys, re, csv, glob, os
os.chdir(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..'))
f, s, e, name, desc = sys.argv[1], int(sys.argv[2], 16), int(sys.argv[3], 16), sys.argv[4], sys.argv[5]
nm = {r['name']: int(r['address'], 16) for r in csv.DictReader(open('docs/name_map.csv'))}
L = open(f).read().split('\n')
labs = []
for i, l in enumerate(L):
    m = re.match(r'^([A-Za-z_]\w*):', l)
    if not m: continue
    lb = m.group(1); g = re.match(r'^(?:unk|dword|word|byte|qword|off|tbyte)_([0-9A-F]+)$', lb)
    a = int(g.group(1), 16) if g else nm.get(lb)
    if a is not None and s <= a < e: labs.append((a, lb, i))
labs.sort()
assert labs and labs[0][0] == s, 'no label at start'
first = labs[0][1]
rep = {lb: (name if a == s else '%s+%sh' % (name, ('0' if '%X' % (a - s) > '9' else '') + '%X' % (a - s)) if (a - s) >= 10 else '%s+%d' % (name, a - s)) for a, lb, i in labs}
for a, lb, i in labs:
    if a == s: L[i] = re.sub(r'^\w+:(.*)$', name + r':\1', L[i])
    else: L[i] = None
L = [l for l in L if l is not None]
txt = '\n'.join(L)
# globals: drop inner, rename first
def fixg(m):
    names = [x.strip() for x in m.group(1).split(',')]
    names = [rep[x] if x == first else x for x in names if x not in rep or x == first]
    return 'global ' + ', '.join(names) if names else ''
txt = re.sub(r'^global (.*)$', fixg, txt, flags=re.M)
# NASM encodes [r1+r2+label+const] with the registers' base/index roles swapped, so such a merge cannot match
inner = [lb for a, lb, i in labs if a != s]
if inner:
    inner_pat = re.compile(r'\[(?:dword |byte )?e(?:[abcd]x|[sd]i|bp|sp)\+e(?:[abcd]x|[sd]i|bp)\+(%s)\b' % '|'.join(map(re.escape, inner)))
    for q in glob.glob('src/**/*.asm', recursive=True):
        m = inner_pat.search(open(q, encoding='latin1').read())
        if m: sys.exit('not merged: %s is used as [reg+reg+label] in %s; name it on its own' % (m.group(1), q))
    # NASM 2.16 also turns [nosplit reg*2+label+const] into [reg+reg+label+const], so an inner label scaled by 2 must stay on its own
    scaled_pat = re.compile(r'\[(?:dword |byte )?(?:nosplit )?e(?:[abcd]x|[sd]i|bp)\*2\+(%s)\b' % '|'.join(map(re.escape, inner)))
    for q in glob.glob('src/**/*.asm', recursive=True):
        m = scaled_pat.search(open(q, encoding='latin1').read())
        if m: sys.exit('not merged: %s is used as [reg*2+label] in %s; name it on its own' % (m.group(1), q))
open(f, 'w').write(txt)
pat = re.compile(r'\b(' + '|'.join(re.escape(k) for k in rep) + r')\b')
for p in glob.glob('src/**/*.asm', recursive=True) + glob.glob('src/**/*.inc', recursive=True):
    if p.endswith('symbols.inc'): continue
    t = open(p, encoding='latin1').read()
    if not pat.search(t): continue
    def fixe(m):
        seen = []
        for x in [x.strip() for x in m.group(2).split(',')]:
            x = name if x in rep else x
            if x not in seen: seen.append(x)
        return m.group(1) + ', '.join(seen)
    t = re.sub(r'^((?:extern|global) )(.*)$', fixe, t, flags=re.M)
    open(p, 'w', encoding='latin1').write(pat.sub(lambda m: rep[m.group(1)], t))
# name_map: first row renamed; inner rows dropped
rows = list(csv.DictReader(open('docs/name_map.csv'))); hdr = rows[0].keys()
out = []; done = False
inner = {lb for a, lb, i in labs if a != s}
for r in rows:
    if r['name'] in inner or r['auto_name'] in inner: continue
    if r['name'] == first or r['auto_name'] == first:
        r['name'] = name; r['confidence'] = 'low'; r['evidence'] = desc; done = True
    out.append(r)
if not done:
    out.append(dict(address='%X' % s, name=name, auto_name=first, source='new', confidence='low', evidence=desc, file=f))
w = csv.DictWriter(open('docs/name_map.csv', 'w', newline=''), fieldnames=list(hdr), lineterminator='\r\n'); w.writeheader(); w.writerows(out)
print('merged %d labels into %s' % (len(labs), name))
