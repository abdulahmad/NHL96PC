#!/usr/bin/env python3
"""where.py RUNTIME_EIP -- map a runtime address of build/hockey-linux back to the original LE linear address.
The loader maps object 1 at 0x20000000 (slide = 0x20000000 - 0x10000) unless NHL96_SLIDE is set."""
import os, sys
slide = int(os.environ.get('NHL96_SLIDE', '0x1FFF0000'), 0)
a = int(sys.argv[1], 16)
orig = a - slide
print('original address %X (runtime %X, slide %+d)' % (orig, a, slide))
