#!/usr/bin/env python3
# extract.py: cut the retail EXE into the segment files that the incbin segments include (Extracted/segments/<name>.bin),
# as listed in segmap.json, then write Extracted/.extract-complete.json last. tools/prebuild.py runs it when needed.
import hashlib, json, os, shutil, sys
sys.path.insert(0, os.path.dirname(__file__))
from exefile import ROOT, SEGMAP, need, sha1_of
path, exe = need()
out = os.path.join(ROOT, 'Extracted'); shutil.rmtree(out, ignore_errors=True); os.makedirs(os.path.join(out, 'segments'))
files = []
for s in SEGMAP['segments']:
    name = f"segments/{s['name']}.bin"
    open(os.path.join(out, name), 'wb').write(exe[s['off']:s['off'] + s['size']])
    files.append({'path': name, 'size': s['size']})
assert sum(s['size'] for s in SEGMAP['segments']) == len(exe)
json.dump({'exeSha1': sha1_of(exe), 'extractorSha1': sha1_of(open(__file__, 'rb').read()),
           'segmapSha1': sha1_of(open(os.path.join(ROOT, 'segmap.json'), 'rb').read()), 'files': files},
          open(os.path.join(out, '.extract-complete.json'), 'w'), indent=1)
print(f'EXE: {path} sha1 {sha1_of(exe)}')
print(f'Extracted {len(files)} slices')
