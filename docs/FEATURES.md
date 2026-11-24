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
- Manual (Control Setup, p.18-20): four control slots. The stars on the ice are Red, Blue, Teal and Purple (p.20; star
  colours not confirmed in code). The devices are the mouse, the keyboard and two joysticks. The box and the reference card add the Gravis GrIP 4-player
  adaptor, which the code supports (`InitGrip`, `GripScanSlots`, `GripReadSlots`).
- Manual (Hot Key Commands, p.36): F1-F4 and F5-F8 change lines for each team, and F9 / F10 pull each team's goalie.
  That matches the slot bits above (line change bits 10-17, goalie pull bits 18/19).

## Line changes (partly known)

- Manual: the request lands in `LineChangeReq`/`LineChangeLine` (per team). The per-team control routine (page 0x38xxx,
  `sub_38F9F`) consumes it: if the request is set, no faceoff/stoppage gate blocks it and the team matches, it calls
  `sub_38A0F` with the line and clears the request. That is the same shape as 95 PC.
- Auto line changes: not found yet. Candidate tests: bits 2-3 of the game options dword (`test dword, 0Ch` in the name builder
  at 0x1E3E8) look like a 2-bit mode, but the menu text is not in the EXE (see below).
- Code: line changes are `gameopts` byte 1, bits 30h (two bits), read by `lcselect`, `chk4lc`, `SetLCmode`,
  `StartFaceoffLineChange`, `RestoreBenchEnergy` and others. The manual's Rules screen has Manual / Automatic / None
  (p.15); which value is which is not confirmed in code. On special teams `lcselect` allows only lines 1 and 2.

## Goalie control (found)

- `gameopts` byte 1, bit 80h turns it on. With it set, `changeplayer` (src/engine/hockey/hockey.asm) gives the slot the
  team's goalie (position 0, `restorepl`, `HomeControlSlot`); `AutoSwitchPlayer` (src/engine/faceoff/faceoff.asm) and
  `puckfaceoff2` test the same bit. 95 PC's `changeplayer` only picks players with position above 0.
- The manual's Rules screen calls it Goalie Controls ON / OFF (p.15): hold PASS until the star is on the goalie,
  SHOOT saves, PASS + SHOOT poke checks (p.2, p.23). The button mapping: not confirmed in code.

## Difficulty (found)

- `optflags` bits 7-8: 0 Rookie, 80h Pro, 100h All-Star. `MainMenuScreen_774` (src/front/menu/menu.asm) cycles through
  all three, although the manual names only Rookie and All-Star (p.5).
- Readers: `playeracc` and `BurstDrainEnergy` (skating), `doshot`, `puckstick` and `PickPuckRebound` (puck),
  `GetHotOrStick`, `checkcheck` and `checkpuckcoll_ccx` (checking and puck control), `goaliesave`, `goaliehome`,
  `goalieposition` and `assgoalie` (goalies, through `GoalieDepthTab`), and `UpdateUserRecords` and
  `ModemGameConnect`.
- The options-screen bits below are the Rules screen, not the level.

## Why the menus are hard to read from the EXE

All menu and option text is fetched by index (`sub_77355(n)` returns string n) from a table loaded from game data, which is not
in this repo. The EXE has only team names and file names. To find difficulty / line change / goalie options, either trace
the game at run time (set a breakpoint on the options dword while toggling a menu row) or read the string table from the retail
data files and match index numbers to the `sub_77355` call sites. A run on the laptop would settle it fast.

## Rules screen rows (manual)

The Rules screen (p.15) lists, top to bottom: Penalties, Offsides, Two Line Passes, Icing, Line Changes (Manual /
Automatic / None), Injuries, Goalie Controls, Fighting, Period Length (5, 10 or 20 minutes), Speed Game. Use this order
to match the option bits and the string indices to names; the row-to-bit mapping beyond the bits below is not
confirmed in code.

## Game options bits (from the 95 PC layout, same offsets seen at the options screen)

bit 1 offsides, bit 2 line changes, bit 3 two-line pass, bit 6 music, bit 7 sfx, bit 8 speech (95 PC names; the options screen
copies bits 0-8 into the byte flags it shows). Not yet confirmed against 96 PC behaviour.

`gameopts` byte 1, value 2, is the offsides test in `ChkDelayedOffside`; `assextra4` tests the same bit (code, 2026-11-24).
Other bits seen in code: byte 1 bit 4 two-line pass (`ChkTwoLinePass`), byte 1 30h line changes, byte 1 80h goalie
control (`changeplayer`), byte 2 bit 1 fighting (`checkfight`).

## Drop pass (kept from 95 PC)

Code only (2026-11-24); traced statically, not watched in a running game.

| Piece | 95 PC | 96 PC |
|---|---|---|
| `PassLaneChk` | 54C09 | 403CE, same tests |
| `ScatterPass` | 54D63 | 40524, same body |
| `dopass` human branch | yes | yes |
| `dopass` CPU branch (+53h) | yes | yes |
| `chk4pass` sets +53h | yes | yes, 2 call sites |
| `CompPass` | none | new, also drops |
| Animation | pass only | pass only (AFh, B5h) |

The constants were retuned for the 96 rink:

| Constant | 95 PC | 96 PC |
|---|---|---|
| Blue-line limit | 4Eh | 74h |
| Max depth | 76h | 9Ch |
| Gap limits | 3Ch, 28h | 3Ch, 28h |
| No-touch time | 28h | 3Ch |

74h is also the blue line in `ChkOffsides` (src/engine/shoot/shoot.asm). The drop is reachable: human passes go
`passmode` / `setpassmode` (src/engine/input/input.asm) to `dopass`; the computer goes through `chk4pass` and `CompPass`
(called from src/engine/logic/logic.asm). The manual does not mention a drop pass.

## Penalty kill and covering D (code)

- `assextra3` (src/engine/assign/assign.asm): compares the team's skaters (team +38h, less the goalie) with the other
  team's. When the team is short with 3 or 4 skaters it uses special targets; otherwise it places players by role.
  Called from asscenterd, asswingd and assnearest.
- `SwapDefWithFwd` (src/engine/logic/logic.asm): a defenceman deep in the attacking zone swaps positions with a forward
  (`SwapPosition`); the forward gets `asscoverdefo` / `asscoverdefd`. It works at every strength.
- No power-play-only branch was found. `assextra4` places the forwards on offence from two spot tables,
  `asscentero_dedata` (the centre's) and `asswingo_dedata` (the wingers'), without a strength test. They are 95 PC's
  tables of the same names, rescaled to the bigger rink.

See docs/CONSOLE_LINEAGE.md for the comparison with 95 PC and the 96 consoles.

## Other anchors

`HandleSlotButtons` is called from the frame runner (`RunSimFrames`); the in-game loop is the routine at 0x17025, a new game
starts at 0x17494, the attract demo at 0x1739F.
