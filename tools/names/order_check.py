"""order_check.py < leads - run from the NHL96PC root; each line `96_label 95_name`; prints the named neighbours in both games."""
import re, glob, sys
def order(repo):
    o = []
    for p in sorted(glob.glob(repo + '/src/**/*.asm', recursive=True)):
        if '/data/' in p: continue
        cur = None
        for l in open(p, errors='replace'):
            m = re.match(r'^([A-Za-z_][A-Za-z0-9_]*):', l)
            if m:
                nm = m.group(1)
                if nm.startswith(('loc_', 'locret_')) or (cur and nm.startswith(cur + '_')): continue
                cur = nm; o.append(nm)
    return o
a = order('../NHL95PC'); b = order('.')
sb = set(b); sa = set(a)
for l in sys.stdin:
    q, n = l.split()[:2]
    i = a.index(n); j = b.index(q)
    pa = next((x for x in reversed(a[:i]) if x in sb), None); na = next((x for x in a[i+1:] if x in sb), None)
    pb = next((x for x in reversed(b[:j]) if x in sa), None); nb = next((x for x in b[j+1:] if x in sa), None)
    print('%-10s %-18s 95:[%s .. %s] 96:[%s .. %s] %s' % (q, n, pa, na, pb, nb, 'ORDER-OK' if (pa, na) == (pb, nb) else ('half' if pa == pb or na == nb else '')))
