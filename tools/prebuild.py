#!/usr/bin/env python3
# prebuild.py: run before every build (build.sh, tools/verify_all.sh, tools/verify_segment.py).
# The EXE must be present (and the right version); then makes sure Extracted/ is complete and runs tools/extract.py if
# it is not. If the EXE is missing or wrong, stops with the folder, usual file name, SHA-1, CRC32 and size it must have.
import json, os, subprocess, sys
sys.path.insert(0, os.path.dirname(__file__))
from exefile import ROOT, EXE, need, sha1_of
EXTRACTED = os.path.join(ROOT, 'Extracted'); MARKER = os.path.join(EXTRACTED, '.extract-complete.json')
EXTRACTOR = os.path.join(ROOT, 'tools', 'extract.py')

def state():
    if not os.path.exists(MARKER): return 'Extracted/ is missing or incomplete'
    try: m = json.load(open(MARKER))
    except Exception: return 'the Extracted/ marker is unreadable'
    if m.get('extractorSha1') != sha1_of(open(EXTRACTOR, 'rb').read()): return 'tools/extract.py changed'
    if m.get('segmapSha1') != sha1_of(open(os.path.join(ROOT, 'segmap.json'), 'rb').read()): return 'segmap.json changed'
    if m.get('exeSha1') != EXE['sha1']: return 'Extracted/ came from another EXE'
    for f in m['files']:
        p = os.path.join(EXTRACTED, f['path'])
        if not os.path.exists(p) or os.path.getsize(p) != f['size']: return f"Extracted/{f['path']} is missing or wrong"
    return None

need()
why = state()
if not why: print('prebuild: EXE OK, Extracted/ complete.'); sys.exit(0)
print(f'prebuild: {why}; extracting ...')
r = subprocess.run([sys.executable, EXTRACTOR], cwd=ROOT, capture_output=True, text=True)
if r.returncode or state():
    print(r.stdout + r.stderr, file=sys.stderr); print('*** BUILD STOPPED: extraction failed ***', file=sys.stderr); sys.exit(1)
for l in r.stdout.splitlines(): print('prebuild: ' + l)
