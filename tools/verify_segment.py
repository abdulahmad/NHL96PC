#!/usr/bin/env python3
# verify_segment.py: check segments against the retail EXE, two ways.
#   python3 tools/verify_segment.py <name>   build that segment on its own from src/stubinc/<name>_stub.asm
#                                            (output/seg/<name>.bin) and compare it with its bytes of the EXE; also compare
#                                            the same range of the full build (output/<exe>) when it exists.
#   python3 tools/verify_segment.py --all    every segment; prints only the ones that differ, then MATCH or FAIL.
# A segment's range is its file offset and size in segmap.json. Prints "<name>: MATCH" or "<name>: DIFFER at file offset ...".
import json, os, subprocess, sys
sys.path.insert(0, os.path.dirname(__file__))
from exefile import ROOT, SEGMAP, need
NASM = os.environ.get('NASM', 'nasm')
_, exe = need()
full = os.path.join(ROOT, 'output', SEGMAP['exe']['file'])
fullb = open(full, 'rb').read() if os.path.exists(full) else None

def diff(a, b):
    if a == b: return None
    d = 0
    while d < len(a) and d < len(b) and a[d] == b[d]: d += 1
    return d

def check(s):
    stub = os.path.join('src', 'stubinc', s['name'] + '_stub.asm')
    out = os.path.join('output', 'seg', s['name'] + '.bin'); os.makedirs(os.path.dirname(os.path.join(ROOT, out)), exist_ok=True)
    r = subprocess.run([NASM, '-f', 'bin', '-I', 'src/', '-o', out, stub], cwd=ROOT, capture_output=True, text=True)
    if r.returncode: return f"{s['name']}: ASSEMBLY FAILED\n{r.stderr.strip()}"
    ref = exe[s['off']:s['off'] + s['size']]
    d = diff(open(os.path.join(ROOT, out), 'rb').read(), ref)
    if d is not None: return f"{s['name']}: DIFFER at file offset 0x{s['off'] + d:X} (segment build)"
    if fullb is not None:
        d = diff(fullb[s['off']:s['off'] + s['size']], ref)
        if d is not None: return f"{s['name']}: DIFFER at file offset 0x{s['off'] + d:X} (full build)"
    return None

arg = sys.argv[1] if len(sys.argv) > 1 else None
if arg == '--all':
    bad = [r for r in (check(s) for s in SEGMAP['segments']) if r]
    for r in bad: print(r)
    print('FAIL' if bad else 'MATCH'); sys.exit(1 if bad else 0)
seg = next((s for s in SEGMAP['segments'] if s['name'] == arg), None)
if not seg: print('usage: python3 tools/verify_segment.py <segment name | --all>  (names are in segmap.json)'); sys.exit(1)
r = check(seg); print(r or f'{arg}: MATCH'); sys.exit(1 if r else 0)
