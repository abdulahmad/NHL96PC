#!/bin/sh
# build.sh: check the EXE (tools/prebuild.py, which also cuts Extracted/ on the first run), assemble src/hockey96pc.asm with nasm into
# output/HOCKEY.EXE, and compare it byte for byte with the retail EXE. The last line is MATCH or MISMATCH.
cd "$(dirname "$0")"
NASM="${NASM:-nasm}"
command -v "$NASM" >/dev/null || { echo "nasm not found (apt install nasm / brew install nasm; or set NASM=)"; exit 1; }
python3 tools/prebuild.py || exit 1
mkdir -p output; rm -f output/HOCKEY.EXE
"$NASM" -f bin -I src/ -o output/HOCKEY.EXE src/hockey96pc.asm || { echo "MISMATCH (assembly failed)"; exit 1; }
ref=$(python3 tools/exefile.py) || exit 1
if command -v sha1sum >/dev/null; then SHA="sha1sum"; else SHA="shasum -a 1"; fi
a=$($SHA "$ref" | cut -d' ' -f1); b=$($SHA output/HOCKEY.EXE | cut -d' ' -f1)
echo "ref $a  $(wc -c <"$ref") bytes"; echo "out $b  $(wc -c <output/HOCKEY.EXE) bytes"
if [ "$a" = "$b" ]; then echo "MATCH output/HOCKEY.EXE"; else echo MISMATCH; cmp -l "$ref" output/HOCKEY.EXE | head -20; exit 1; fi
