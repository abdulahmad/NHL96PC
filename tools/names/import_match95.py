#!/usr/bin/env python3
"""import_match95.py - add the trustworthy rows of tools/names/match95.csv to docs/name_map.csv (source 95PC).

  python3 tools/names/import_match95.py [--dry]

Taken: functions matched exact / loose / callsite (high), similar and neighbour with similarity 0.75+ (medium), sem
with score 0.6+ (medium); data matched by string or fixup position (high) or by reference set (medium). Only when
NHL95PC has a real name (not sub_/loc_/dword_ ...). An address that already has a name keeps it, and a name already
in use is never given to a second address. Run before gen_src.py (bootstrap) or feed the rows to rename_symbol.py."""
import os, sys, csv, re
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
AUTO = re.compile(r'(sub|loc|locret|byte|word|dword|unk|off|asc|stru|qword|flt|dbl|tbyte|nullsub|j_sub|jpt|def|algn|funcs)_[0-9A-Fa-f]+$|unknown_libname_\d+$|j_')
HDR = 'address,name,auto_name,source,confidence,evidence,file'.split(',')

def main():
    nm = os.path.join(ROOT, 'docs/name_map.csv')
    rows = list(csv.DictReader(open(nm)))
    have = {int(r['address'], 16) for r in rows}; used = {r['name'] for r in rows}
    add = []
    for r in csv.DictReader(open(os.path.join(ROOT, 'tools/names/match95.csv'))):
        a = int(r['addr96'], 16); n = r['name95']; m = r['method']; sc = float(r['score'])
        if not n or AUTO.match(n) or a in have or n in used: continue
        if m in ('exact', 'loose', 'callsite', 'string', 'position'): conf = 'high'
        elif m in ('similar', 'neighbour') and sc >= 0.75: conf = 'medium'
        elif m == 'sem' and sc >= 0.6: conf = 'medium'
        elif m == 'refset': conf = 'medium'
        else: continue
        add.append(dict(address='%05X' % a, name=n, auto_name='', source='95PC', confidence=conf,
                        evidence='NHL95PC %s (%s): %s' % (r['addr95'], m, r['evidence'][:90]), file=''))
        have.add(a); used.add(n)
    print('adding', len(add), 'rows:', {c: sum(1 for x in add if x['confidence'] == c) for c in ('high', 'medium')})
    if '--dry' in sys.argv: return
    rows = sorted(rows + add, key=lambda r: int(r['address'], 16))
    with open(nm, 'w', newline='') as fo:
        w = csv.DictWriter(fo, HDR); w.writeheader(); w.writerows(rows)

if __name__ == '__main__':
    main()
