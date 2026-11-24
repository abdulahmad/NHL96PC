#!/bin/sh
# One-command build: HOCKEY.EXE from src/ + sha1 check.  Usage: ./build.sh [path/to/HOCKEY.EXE]
# Steps: extract the third-party stubs and LE metadata from your EXE, nasm every src/ file, check spa.inc against
# the SPA tables (tools/build/check_spa.py), link, sha1 check.
# The last line is MATCH or MISMATCH. See docs/ASM_BUILD.md.
set -e
cd "$(dirname "$0")"
PY="${PYTHON:-python3}"
NASM="${NASM:-nasm}"
EXE="${1:-lst/HOCKEY.EXE}"
[ -f "$EXE" ] || { echo "HOCKEY.EXE not found: expected lst/HOCKEY.EXE (1613291 bytes, SHA-1 426fb8c0c80088c6a2c56a9dac50509cb9c24540) or pass a path" >&2; exit 1; }
command -v "$NASM" >/dev/null || { echo "nasm not found (apt install nasm / brew install nasm; or set NASM=)" >&2; exit 1; }
"$PY" tools/build/rebuild_exe.py extract "$EXE" build/parts
"$PY" tools/build/gen_teamstrings.py "$EXE" build/teamstrings.bin
JOBS="$(getconf _NPROCESSORS_ONLN 2>/dev/null || echo 4)"
SRCS="$(awk '!/^#/ && NF {print "src/" $6}' src/segments.txt)"
echo "assembling $(echo "$SRCS" | wc -l) files with $JOBS jobs"
echo "$SRCS" | xargs -P "$JOBS" -I{} sh -c '
  o="build/obj/${1#src/}"; o="${o%.asm}.o"; mkdir -p "$(dirname "$o")"
  if [ ! -f "$o" ] || [ "$1" -nt "$o" ] || [ -n "$(find src/inc -newer "$o" -print -quit)" ]; then '"$NASM"' -O0 -f elf32 -I src/inc/ -o "$o" "$1"; fi' _ {}
NASM="$NASM" "$PY" tools/build/check_spa.py
"$PY" tools/build/link_src.py --obj build/obj --parts build/parts --out build/HOCKEY.EXE
