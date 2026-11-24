# START HERE (instructions for the agent and new contributors)

Read this file, then `AGENTS.md`, `SEGMENT_AGENT.md` (naming rules), `CONTRIBUTING.md`, `docs/PLAN.md` and `docs/HANDOFF.md`.

This repo is a disassembly only: labelled 32-bit x86 assembly (NASM) that reassembles to the byte-identical `HOCKEY.EXE`. No C, no
compiler. It is modelled on NHL95PC: the same build tools, the same file layout and the same names wherever the two games share code.

## Hard rules

- Never change an EXE byte. Every commit must build to MATCH (SHA-1 `426fb8c0c80088c6a2c56a9dac50509cb9c24540`).
- `lst/HOCKEY.EXE` (and the IDA listing `lst/HOCKEY.EXE.lst`, if you have it) are your own copies and are not in the repo. Never commit them, game data, `build/` or patches.
- Never force-push, never rewrite pushed history, never push a commit that does not MATCH. Small commits.
- No macros except `LD`. No address where a label works.
- Work on a short branch off the current `main` and open one pull request into `main`.

## 1. Setup

NASM 2.15.05 (NASM 2.16 encodes `xchg reg,reg` the other way round and the EXE does not match) and Python 3. Nothing else is needed to build. (`tools/build/gen_src.py` and the matcher also need `pip install iced-x86`;
they are maintainer tools.)

## 2. Build and confirm MATCH

`./build.sh`: the last line is `MATCH: build/HOCKEY.EXE is byte-identical to the retail HOCKEY.EXE`. If not on a fresh clone, stop and report.

## 3. Work loop

The segment naming queue is finished (no auto names are left in `src/`). Remaining work is in `TODO.md` and the Now block of
`docs/HANDOFF.md`. After each change: MATCH, commit, open the PR, update `docs/HANDOFF.md`.

## 4. When stuck

- Something that cannot be expressed without changing bytes: leave it and list it in `docs/HANDOFF.md`.
- 5 failed builds in a row: go back to the last MATCH state and note what was tried.
