#!/usr/bin/env python3
"""chunk_names.py - rename the chunk labels of renamed routines: IDA's sub_XXXXX_OFF / localize_labels' sub_XXXXX_OFF
(a label at offset OFF into routine sub_XXXXX) becomes NEW_OFF once sub_XXXXX is named NEW in docs/name_map.csv.

  python3 tools/names/chunk_names.py [--write FILE]

Prints the renames (rename_symbol.py --batch format, no_record); --write puts them in FILE."""
import csv, glob, os, re, sys
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
new = {}
for r in csv.DictReader(open(os.path.join(ROOT, 'docs', 'name_map.csv'), newline='')):
    a = r.get('auto_name') or ''
    if a.startswith('sub_') and r['name'] != a: new[a] = r['name']
labels = set()
for f in glob.glob(os.path.join(ROOT, 'src', '**', '*.asm'), recursive=True):
    for l in open(f, encoding='latin1'):
        m = re.match(r'^(sub_[0-9A-F]+)_([0-9A-F]+x*):', l)
        if m and m.group(1) in new: labels.add((m.group(1), m.group(2)))
out = ['%s_%s %s_%s {no_record}' % (b, o, new[b], o) for b, o in sorted(labels)]
if '--write' in sys.argv:
    open(sys.argv[sys.argv.index('--write') + 1], 'w').write('\n'.join(out) + '\n')
print('\n'.join(out) if '--write' not in sys.argv else '%d chunk labels' % len(out))
