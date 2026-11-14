"""Repo root and import path for the tools tree (build/names)."""
import os, sys
TOOLS = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(TOOLS)
SUBS = ('build', 'names')

def add_path():
    for sub in SUBS:
        p = os.path.join(TOOLS, sub)
        if os.path.isdir(p) and p not in sys.path:
            sys.path.insert(0, p)
    if TOOLS not in sys.path:
        sys.path.append(TOOLS)

add_path()
