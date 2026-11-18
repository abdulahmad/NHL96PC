#!/usr/bin/env python3
"""gen_teamstrings.py EXE OUT - copy the team city and nickname strings (tools/build/teamstrings.csv) out of your HOCKEY.EXE
into OUT (build/teamstrings.bin), in csv order. src/ includes them with incbin, so it holds no team names itself."""
import sys, os
exe = open(sys.argv[1], 'rb').read()
out = bytearray()
for line in open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'teamstrings.csv')):
    if line.startswith('#') or not line.strip():
        continue
    _, off, n = line.strip().split(',')
    out += exe[int(off):int(off) + int(n)]
os.makedirs(os.path.dirname(os.path.abspath(sys.argv[2])), exist_ok=True)
open(sys.argv[2], 'wb').write(out)
