# NHL 96 PC compared with the other versions

For each feature: is 96 PC the same as 96 Genesis, 96 SNES, 95 PC and 94 PC, and if not, how it differs. Under each
answer is the code that shows it: the routine or table and its file in each repo. Files are paths in this repo, or in
[NHL96Genesis](https://github.com/abdulahmad/NHL96Genesis), [NHL95PC](https://github.com/abdulahmad/NHL95PC) and
[NHL94PC](https://github.com/abdulahmad/NHL94PC).

There is no 96 SNES code to compare, so every 96 SNES answer is "not confirmed in code". "Not found" means the
search of that repo found nothing; the code is not fully named yet. Written 2026-11-24.

## At a glance

| Feature | 96 Genesis | 95 PC | 94 PC |
|---|---|---|---|
| Skill levels | Different | New | New |
| Manual goalie | Same | New | New |
| Up to 4 players | Same | New | New |
| Fighting | Same idea | New | New |
| Penalty-kill AI | Different | New | New |
| Covering a pinching D | Different | New | New |
| Power-play AI | Same (none) | Same | Same |
| Goalie AI | Different | Changed | Changed |
| Drop pass | Different | Same | New |
| One-timer pass | Not confirmed | Not confirmed | Not confirmed |
| Fake shot, shot block | Different | Same | New |
| Spin-o-rama | Missing on PC | Same (none) | Same (none) |
| Shootout mode | Missing on PC | Same (none) | Same (none) |
| Timeouts | Missing on PC | Same (none) | Same (none) |
| Trade rejection | Missing on PC | Same (none) | Same (none) |
| User records | Same idea | New | New |
| Modem play | PC only | New | New |
| Line-change modes | Not confirmed | Changed | Changed |
| Penalty shots | Same idea | Same | Same |
| Stanley Cup on ice | Different | Changed | Changed |

"New" means 96 PC has it and that PC game doesn't. 96 SNES is left out of the table: no code.

## Skill levels

- **96 PC:** three levels, Rookie, Pro and All-Star: `optflags` bits 7-8 (0, 80h, 100h). The menu cycles through all
  three (`MainMenuScreen_774`, src/front/menu/menu.asm).
- The level is read all over the game: skating (`playeracc`, src/engine/skate/skate.asm; `BurstDrainEnergy`),
  shooting and puck handling (`doshot`, `puckstick`, `PickPuckRebound`, src/engine/puckphys/puckphys.asm;
  `GetHotOrStick`, src/engine/hockey/hockey.asm), checking (`checkcheck`, src/engine/checking/checking.asm;
  `checkpuckcoll_ccx`, src/engine/pass/pass.asm) and the goalies (`goaliesave`, `goaliehome`, `goalieposition`,
  `assgoalie`, src/engine/faceoff/faceoff.asm, through `GoalieDepthTab`).
- **vs 96 Genesis: different.** 96G also has three levels (`OptSkill`, src/front/options96.asm), but it changes less:
  gravity tables shared by Pro and All-Star (`SetSkillLevel`), the CPU check chance (`check4check`,
  src/engine/logic/puck.asm: 3 on Pro, 6 on All-Star, 1 on Rookie), role switching off on Rookie (`GetRoleAss`,
  src/engine/input/shot.asm) and the goalie reach table (`wallcollskater`, src/engine/collide/collide96.asm).
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: new.** Neither has a skill option (none found in src/).

## Manual goalie control

- **96 PC:** with the option on (`gameopts` byte 1, bit 80h), `changeplayer` hands the human the team's goalie
  (position 0) (src/engine/hockey/hockey.asm). `AutoSwitchPlayer` (src/engine/faceoff/faceoff.asm) tests the same bit.
- **vs 96 Genesis: same.** 96G has a Manual/Auto option (`OptGoalie`, src/ram96.asm; `GoalieItem`, options96.asm)
  and a human goalie assignment (`assgoaliectrl`, src/engine/logic/ass.asm).
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: new.** 95 PC's `changeplayer` only picks players with position above 0
  (src/engine/chgplayer/changeplayer.c), so the goalie is only controlled while he has the puck. 94 PC has no goalie
  option either.

## Number of players

- **96 PC:** four control slots (`SlotTable`, `InitSlotTable`, src/front/controls/controls.asm; `HandleSlotButtons`,
  src/front/play_game/play_game.asm), with Gravis GrIP pads (`GripScanSlots`, `GripReadSlots`, controls.asm).
- **vs 96 Genesis: same,** four with the 4 Way Play adapter (`Detect4WayPlay`, src/engine/fourway96.asm).
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: new.** Both take two pads; 95 PC's input record is two pads plus a hot key.

## Fighting

- **96 PC:** `checkfight` and `checkfight_sf` (src/engine/collide/collide.asm), the `assfight` and `assfwatch`
  assignments, an on/off option (`gameopts` byte 2, bit 1). A fight is penalty type 20h, which `penmintab`
  (src/data/engine/penalty_data_01.asm) makes five minutes.
- **vs 96 Genesis: same idea, separate code.** 96G has fight96.asm (`EngageFight`, `SetFightingMajors`). 96 PC's
  fight routines follow the NHLPA 93 Genesis ones instead.
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: new.** No fight code in either; 96 PC's `penmintab` is 95 PC's with four entries added.
- Four-minute double minors: 96G has `DoubleMinorPenalties` (logic96.asm). In 96 PC, not confirmed in code.

## Penalty-kill AI

- **96 PC:** `assextra3` (src/engine/assign/assign.asm) compares the two teams' skaters on the ice. When the team is
  short and has three or four skaters, it sends them to penalty-kill spots. Called from `asscenterd`, `asswingd` and
  `assnearest`.
- **vs 96 Genesis: different code, same aim.** 96G has a short-handed copy of each role routine, `asstab` $24-$2F
  (`assdefo5` .. `asscenterd4`, src/engine/logic/logic96.asm), picked by the team's skater count.
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: new.** 95 PC's role routines have no strength test (for example
  src/engine/logic/asscenterd.c).

## Covering for a defenceman out of position

- **96 PC:** `SwapDefWithFwd` (src/engine/logic/logic.asm): a defenceman deep in the attacking zone swaps places with
  a forward (`SwapPosition`), who gets the `asscoverdefo` / `asscoverdefd` assignment (assign.asm). Works at any
  strength.
- **vs 96 Genesis: different code, same aim.** 96G reassigns roles once a second instead (`SetRoles`,
  `SetTeamRoles`, `RoleTable`, src/engine/input/shot.asm), only at full strength.
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: new.** No swap or role remap in either.

## Power-play AI

- **96 PC:** no power-play-only code. `assextra4` (src/engine/logic/logic.asm) places the forwards on offence from
  two spot tables by zone, with no strength test. It does test the offsides option (`gameopts` byte 1, bit 2, the
  bit `ChkDelayedOffside` uses).
- **vs 96 Genesis: same: none.** 96G's offence spots moved closer to the net than 95G's (the `.table` in
  `asscentero` and `asswingo`, logic96.asm), but at every strength.
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: same: none.**

## Goalie AI

- **96 PC:** a new positioning layer: `goalieposition`, `goaliehome`, `goalieskateto`, `goaliechasepuck` and
  `GoalieDepthTab` (src/engine/faceoff/faceoff.asm), with depth set by the skill level, and new animations
  (`SPAgshufflel` / `SPAgshuffler`, `SPAgsavetoe`, `SPAgsavekick`).
- **vs 96 Genesis: different.** 96G changed how a save is picked instead (`goaliesave`, src/engine/logic/puck.asm:
  `SPAgblock`, `SPAgcatchlow`, reach saves).
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: changed.** Neither has the positioning routines or the new animations (none found). Whether
  goalies stop more shots: not confirmed in code.

## Drop pass

- **96 PC: same as 95 PC.** A pass to a teammate trailing the carrier in the attacking zone, with the shooting lane
  blocked, is dropped dead (`PassLaneChk` 403CE, `ScatterPass` 40524, `dopass`, src/engine/pass/pass.asm). It works for
  humans (`dopass` from `passmode`, src/engine/input/input.asm) and for the computer (`chk4pass` sets the flag at
  +53h; the new `CompPass` drops too). There is no drop animation.
- The numbers were retuned for the 96 rink:

| Constant | 95 PC | 96 PC |
|---|---|---|
| Blue-line limit | 4Eh | 74h |
| Max depth | 76h | 9Ch |
| Gap limits | 3Ch, 28h | 3Ch, 28h |
| No-touch time | 28h | 3Ch |

  74h is also the blue line in `ChkOffsides` (src/engine/shoot/shoot.asm).
- **vs 96 Genesis: different.** 96G keeps 95G's button drop pass: `dopass` (src/engine/input/shot.asm) gives a
  flagged pass `nopuck` 18h instead of 10h.
- **vs 96 SNES:** not confirmed in code.
- **vs 94 PC: new.** 94 PC's `dopass` (src/engine/physics.asm) has no drop branch.

## One-timers and one-timer passes

- **96 PC:** one-timer shots as in 95 and 94 PC (`OneTimerChk`, src/engine/input/input.asm). It also has a new flag,
  `OneTimerPasser` (src/data/engine/savestate_data_01.asm), set in the input code and cleared by every pass. It is
  likely the one-timer pass, but that is not confirmed in code.
- **vs 96 Genesis:** 96G has a one-timer pass (`OneTimerPass`, src/engine/logic/timer.asm). Same as 96 PC: not
  confirmed in code.
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC:** one-timer shots the same. Neither has the `OneTimerPasser` flag.
- Give-and-go: not confirmed in code in any version.

## Fake shot and shot block

- **96 PC: same as 95 PC.** Fake shot and fake one-timer (`SPAfakeshotf/b`, `SPAfakeonetimef/b`,
  src/data/engine/penalty_data_01.asm); four shot-block animations through `CanBlockShot` (input.asm) and
  `BlockShotDive` (src/engine/checking/checking.asm).
- **vs 96 Genesis: different.** 96G has one fake (`SPAfake`, src/frames96.asm) and one block, `CanBlock`
  (src/engine/replay/block.asm), for a human player only.
- **vs 96 SNES:** not confirmed in code.
- **vs 94 PC: new.** 94 PC has neither the fake-shot animations (`SPAfakeshotf` not found; its `SPAfake`, 92Bh, is
  95 PC's `SPAfake`, not a shot) nor block code.

## Spin-o-rama

- **96 PC: missing.** None of the 224 named 96 PC animations is a spin, and no input routine for one was found.
  The "spin" names in the code are the puck model and the logos (`SpinPuckModel`, src/front/game_view/game_view.asm).
- **vs 96 Genesis:** not confirmed in code. Its spin was not located; 96G has eight new animations with only number
  names (`SPA0344` .. `SPA36F8`, src/frames96.asm).
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: same: none.**

## Shootout mode

- **96 PC: missing.** `StartShootoutPath` (src/engine/shootoutpath/shootoutpath.asm) is the penalty-shot skate path,
  which 95 PC also has (src/engine/shootoutpath/StartShootoutPath.c). No shootout mode was found.
- **vs 96 Genesis: missing on PC.** 96G has one (`ShootoutInit`, `EndShootout`, src/front/shootout/path.asm).
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: same: none.**

## Timeouts

- **96 PC: missing.** The only "timeout" names are link and hardware timeouts.
- **vs 96 Genesis: missing on PC.** 96G has `TimeoutMenu` and `PauseMenuNoTimeout` (src/engine/pause/).
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: same: none.**

## Trades

- **96 PC:** trades between any two teams, checked only by `ConfirmTrade`'s question box
  (src/front/roster/roster.asm). No trade-value check was found.
- **vs 96 Genesis: different.** 96G limits trades to three players a team (`CheckTrade`) and can reject a lopsided one
  (`TradeValue`, " rejects trade.", src/front/trade/edit.asm).
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC:** they have their own trade screens (`ExecuteTrade`, src/front/trade/ in 95 PC;
  src/front/trade.asm in 94 PC). 94 PC adds a trade deadline (`TradePlayers`). Whether 96 PC has a deadline: not
  confirmed in code.

## User records

- **96 PC:** `CreateUserRecord`, `UpdateUserRecords`, `DrawUserRecords` (src/pc/users/users.asm); the records are
  kept per skill level.
- **vs 96 Genesis: same idea.** 96G has a User Records option (`OptUserRec`, `UserRecItem`,
  src/front/options96.asm).
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: new.** No user records found in either.

## Modem play

- **96 PC:** modem and null-modem play (src/pc/modem_game/, src/pc/link/; see docs/MODEM.md).
- **vs 96 Genesis and 96 SNES:** PC only.
- **vs 95 PC and 94 PC: new.** No modem code found in either.

## Line changes and special-teams lines

- **96 PC:** line changes are a two-bit setting (`gameopts` byte 1, 30h), read by `lcselect`, `chk4lc`, `SetLCmode`
  and others. Which value is Manual, Automatic or None: not confirmed in code. On the power play or penalty kill,
  `lcselect` (src/engine/input/input.asm) allows only lines 1 and 2, taken from the PP or PK lines.
- **vs 95 PC: changed.** 95 PC has one on/off bit (`gameopts` bit 2); the PP/PK line choice is the same.
- **vs 94 PC:** changed the same way.
- **vs 96 Genesis and 96 SNES:** not confirmed in code.

## Penalty shots

- **96 PC: same as 95 PC.** `PenShotAssign`, `EndPenaltyShot` (src/engine/penalty/penalty.asm,
  src/engine/faceoff/faceoff.asm).
- **vs 96 Genesis: same idea.** `PenShotChk` (src/engine/penalty/penalty96.asm).
- **vs 96 SNES:** not confirmed in code.
- **vs 94 PC: same idea.** `PenShotAssign`, `PenShotStart` (src/engine/faceoff.asm).

## Stanley Cup presentation

- **96 PC:** players take, follow and leave with the cup on the ice: new assignments `asscupfollow`, `asscuptake` and
  `asscupleave` (src/engine/assign/assign.asm).
- **vs 96 Genesis: different.** 96G shows a cup celebration screen (`CupCelebration`, src/front/title/title96.asm).
- **vs 96 SNES:** not confirmed in code.
- **vs 95 PC and 94 PC: changed.** Both have cup animations (`SPAgetcup`, `SPAbrcup`) but no cup assignments.

## Box features

What the code has for each feature on the 96 box (96 PC; the 96 Genesis box has the same lines):

- **Penalty-kill defence, covering a teammate out of position on D:** in the code on both, with different code. See
  Penalty-kill AI and Covering for a defenceman.
- **Power-play offence, teammates skate to the slot:** no power-play-only code on either. 96G's offence spots moved
  closer to the net at every strength; whether 96 PC's spots differ from 95 PC's: not confirmed in code.
- **Better goalies:** reworked on 96 PC and 96 Genesis, differently (see Goalie AI). Whether they save more: not
  confirmed in code. 96 SNES: not confirmed in code.
