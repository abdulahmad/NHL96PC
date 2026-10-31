#!/bin/sh
# verify_segment.sh <name>: prebuild check, then build that one segment from its stub and compare it (tools/verify_segment.py).
cd "$(dirname "$0")/.."
python3 tools/prebuild.py >/dev/null || exit 1
exec python3 tools/verify_segment.py "$@"
