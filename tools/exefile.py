#!/usr/bin/env python3
# exefile.py: the retail EXE this build needs, and where it is. It is found in the repo's root folder by its content
# (size, then SHA-1), so the file can have any name; the usual name is tried first. Used by prebuild.py, extract.py,
# verify_segment.py and build.sh. Command line: python3 tools/exefile.py   (prints the path, or why it is missing)
import hashlib, json, os, sys, zlib
ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
SEGMAP = json.load(open(os.path.join(ROOT, 'segmap.json')))
EXE = SEGMAP['exe']

def sha1_of(b): return hashlib.sha1(b).hexdigest()

def find():
    # lst/<file> is the copy committed for convenience (temporary: it leaves the repo later); then the repo folder.
    names = ['lst/' + EXE['file'], EXE['file']] + sorted(f for f in os.listdir(ROOT) if f != EXE['file'] and f.lower().endswith('.exe'))
    wrong = None
    for n in names:
        p = os.path.join(ROOT, n)
        if not os.path.isfile(p): continue
        if os.path.getsize(p) != EXE['size'] and n != EXE['file']: continue
        d = open(p, 'rb').read()
        if len(d) == EXE['size'] and sha1_of(d) == EXE['sha1']: return p, d, None
        if n in (EXE['file'], 'lst/' + EXE['file']): wrong = (p, sha1_of(d), len(d))
    return None, None, wrong

def need():
    p, d, wrong = find()
    if p: return p, d
    print('', file=sys.stderr)
    print('*** BUILD STOPPED: game EXE needed ***', file=sys.stderr)
    if wrong:
        print(f'Found {wrong[0]}, but it is not the right file: SHA-1 {wrong[1]}, {wrong[2]} bytes.', file=sys.stderr)
    print(f"This build needs {EXE['label']}:", file=sys.stderr)
    print(f"    Put it at:  {os.path.join(ROOT, 'lst', EXE['file'])} (or anywhere in {ROOT}: any name works, it is found by SHA-1 and size)", file=sys.stderr)
    print(f"    SHA-1:      {EXE['sha1']}", file=sys.stderr)
    print(f"    CRC32:      {EXE['crc32']}", file=sys.stderr)
    print(f"    Size:       {EXE['size']} bytes", file=sys.stderr)
    print('lst/ holds a copy for now; when it is gone, copy the EXE from your own copy of the game.', file=sys.stderr)
    sys.exit(1)

if __name__ == '__main__':
    print(need()[0])
