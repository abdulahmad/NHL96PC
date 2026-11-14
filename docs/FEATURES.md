# NHL 96 PC features: what is known

Working notes for the feature-by-feature discovery (2026-11-09). Addresses are linear (the IDA listing's). Names are in
`docs/name_map.csv`. Confidence is stated; nothing here is a guess dressed as a fact.

## Input slots and 4 players (known)

- The game has 4 controller slots. `PollControllers` walks 4 entries of `SlotTable` (7 bytes: on byte, device word, buttons
  dword). The device word picks the reader (keyboard 1/2, joystick, other); the setup struct (pointer in a global) holds each
  slot's team at +5+slot and its device at +9+2*slot. The direction nibble (bits 2-5) is remapped by team side.
- `InputRecordTimer` (timer callback) pushes a 0x12-byte record (4 slot dwords + ticks) every 4th tick into a ring of 5.
  The game loop reads the ring. A recorded game plays back through `PlaybackInputRecord`.
- `HandleSlotButtons` decodes each slot dword per frame: bit 0 pause, bit 1 replay, bits 10-13 line change request for team 0
  (one bit per line 0-3), bits 14-17 the same for team 1, bit 18/19 goalie pull for team 0/1 (`PullGoalie`).
  Nothing here distinguishes slots 2/3 from 0/1 except the team stored in the setup struct, so 4-player play is a setup
  matter (slot team and device), not a different input path.
- Consequence for 95 PC: the record is 3 bytes per 5 ticks there (two pads plus a hot key). 96 PC widened it to 4 dwords.

## Line changes (partly known)

- Manual: the request lands in `LineChangeReq`/`LineChangeLine` (per team). The per-team control routine (page 0x38xxx,
  `sub_38F9F`) consumes it: if the request is set, no faceoff/stoppage gate blocks it and the team matches, it calls
  `sub_38A0F` with the line and clears the request. That is the same shape as 95 PC.
- Auto line changes: not found yet. Candidate tests: bits 2-3 of the game options dword (`test dword, 0Ch` in the name builder
  at 0x1E3E8) look like a 2-bit mode, but the menu text is not in the EXE (see below).

## Goalie control (not found)

- Only goalie *pull* is in the slot decode (bits 18/19). No manual goalie control path has been identified yet. The 95 PC
  `changeplayer` / `doinput` goalie checks have not been matched to 96 PC addresses.

## Difficulty (not found)

- No skill level has been found. Physics routines have not been traced yet. The 9 bits of the game options dword at
  the options screen (screen code 0x58C89 onward) are toggles (bit 0..8 -> byte flags), a menu page index (bits 9-12) and the
  cursor row (bits 14-17); none of them is a 3-way difficulty.

## Why the menus are hard to read from the EXE

All menu and option text is fetched by index (`sub_77355(n)` returns string n) from a table loaded from game data, which is not
in this repo. The EXE has only team names and file names. To find difficulty / line change / goalie options, either trace
the game at run time (set a breakpoint on the options dword while toggling a menu row) or read the string table from the retail
data files and match index numbers to the `sub_77355` call sites. A run on the laptop would settle it fast.

## Game options bits (from the 95 PC layout, same offsets seen at the options screen)

bit 1 offsides, bit 2 line changes, bit 3 two-line pass, bit 6 music, bit 7 sfx, bit 8 speech (95 PC names; the options screen
copies bits 0-8 into the byte flags it shows). Not yet confirmed against 96 PC behaviour.

## Other anchors

`HandleSlotButtons` is called from the frame runner (`RunSimFrames`); the in-game loop is the routine at 0x17025, a new game
starts at 0x17494, the attract demo at 0x1739F.
