#!/usr/bin/env python3
"""name_map_files.py - bring the file column of docs/name_map.csv up to date after files are split or renamed.

  python3 tools/names/name_map_files.py [--check]

Each row with a file gets the source file (src/segments.txt) whose address range holds its address. Rows with no
file (library names) stay as they are. Line endings and quoting of the CSV are kept."""
import csv, io, os, sys
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def main():
    rows = []
    for l in open(os.path.join(ROOT, 'src', 'segments.txt')):
        p = l.split()
        if len(p) == 6 and not l.startswith('#'): rows.append((int(p[1], 16), int(p[2], 16), 'src/' + p[5]))
    path = os.path.join(ROOT, 'docs', 'name_map.csv')
    raw = open(path, newline='').read()
    nl = '\r\n' if '\r\n' in raw else '\n'
    R = list(csv.reader(io.StringIO(raw)))
    n = 0
    for r in R[1:]:
        if len(r) < 7 or not r[6]: continue
        try: a = int(r[0], 16)
        except ValueError: continue
        f = next((f for s, e, f in rows if s <= a < e), None)
        if f and f != r[6]: r[6] = f; n += 1
    print('%d rows %s' % (n, 'out of date' if '--check' in sys.argv else 'updated'))
    if '--check' in sys.argv: sys.exit(1 if n else 0)
    o = io.StringIO(); csv.writer(o, lineterminator=nl).writerows(R)
    open(path, 'w', newline='').write(o.getvalue())


if __name__ == '__main__':
    main()
