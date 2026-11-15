# NHL 96 PC HOCKEY.EXE segment map

Generated from `segmap96pc.json` (written by `tools/build/build_segmap.py`). The link order is `src/segments.txt`.
The boundaries are provisional module boundaries (see `docs/PLAN.md`): where a segment follows an NHL95PC module the
note says so; `placeholder` segments are named by their start address until the segment agent names them.

File layout: 0x000000 DOS/16M loader stub, 0x00F474 DOS/4GW kernel, 0x026654 Watcom wstub, 0x0290A4 LE header and tables,
0x073854 object pages. The extender parts are taken from your EXE at build time (third-party binaries).

| LE object | Base | Size | In file | Holds |
|---|---|---|---|---|
| 1 `cseg01` | 0x10000 | 0xD28A0 | all | 32-bit code: front end, engine, libraries |
| 2 `cseg02` | 0xF0000 | 0x34 | all | 16-bit stub |
| 3 `dseg03` | 0x100000 | 0x18 | all | small data |
| 4 `dseg04` | 0x110000 | 0x99260 | 0x41597 | data, then BSS |

## cseg01 (112 segments)

| Start | End | Size | File | Note |
|---|---|---|---|---|
| 10000 | 10010 | 10 | `src/lib/watcom/watcom_begtext.asm` | Watcom ___begtext |
| 10010 | 1456D | 455D | `src/front/front_10010.asm` | placeholder |
| 1456D | 186DC | 416F | `src/front/front_1456D.asm` | placeholder |
| 186DC | 201CD | 7AF1 | `src/front/main/main.asm` | holds main_ (FLIRT); startup, CDSTREAM, asset loading |
| 201CD | 22522 | 2355 | `src/front/front_201CD.asm` | placeholder |
| 22522 | 2A692 | 8170 | `src/front/rink_model/rink_model.asm` | rink and stands model parts by name (zamboni, glass, boards, crowd) |
| 2A692 | 2D9D9 | 3347 | `src/front/front_2A692.asm` | placeholder |
| 2D9D9 | 313D2 | 39F9 | `src/engine/engine_2D9D9.asm` | placeholder |
| 313D2 | 38070 | 6C9E | `src/engine/logic/logic.asm` | NHL95PC module (matched functions) |
| 38070 | 3A7A4 | 2734 | `src/engine/input/input.asm` | NHL95PC module (matched functions) |
| 3A7A4 | 3E6EC | 3F48 | `src/engine/faceoff/faceoff.asm` | NHL95PC module (matched functions) |
| 3E6EC | 465BA | 7ECE | `src/engine/collide/collide.asm` | NHL95PC module (matched functions) |
| 465BA | 4B7BB | 5201 | `src/engine/hockey/hockey.asm` | NHL95PC module (matched functions) |
| 4B7BB | 4DED8 | 271D | `src/engine/skate/skate.asm` | NHL95PC module (matched functions) |
| 4DED8 | 4F453 | 157B | `src/engine/engine_4DED8.asm` | placeholder |
| 4F453 | 50154 | D01 | `src/engine/gamelog/gamelog.asm` | goal and penalty log lines; holds a matched NHL95PC gamelog function |
| 50154 | 51F18 | 1DC4 | `src/engine/penalty/penalty.asm` | NHL95PC module (matched functions) |
| 51F18 | 54519 | 2601 | `src/engine/lines/lines.asm` | NHL95PC module (matched functions) |
| 54519 | 584A0 | 3F87 | `src/front/replay_controls/replay_controls.asm` | replay control buttons (rew, play, fwd, camera); 95PC module name |
| 584A0 | 5D993 | 54F3 | `src/front/front_584A0.asm` | placeholder |
| 5D993 | 64F59 | 75C6 | `src/front/front_5D993.asm` | placeholder |
| 64F59 | 67000 | 20A7 | `src/front/front_64F59.asm` | placeholder |
| 67000 | 6A891 | 3891 | `src/front/front_67000.asm` | placeholder |
| 6A891 | 6E233 | 39A2 | `src/front/pause_menu/pause_menu.asm` | pause menu buttons (PAUSREG, quit, return, replay, controls, stats) |
| 6E233 | 711ED | 2FBA | `src/front/front_6E233.asm` | placeholder |
| 711ED | 741BD | 2FD0 | `src/front/modem_setup/modem_setup.asm` | modem setup screens (Generic Hayes-Compatible, tone/pulse) |
| 741BD | 77642 | 3485 | `src/front/front_741BD.asm` | placeholder |
| 77642 | 794FF | 1EBD | `src/front/front_77642.asm` | placeholder |
| 794FF | 7D580 | 4081 | `src/front/front_794FF.asm` | placeholder |
| 7D580 | 7FF7F | 29FF | `src/front/calendar/calendar.asm` | Month Choice / Calendar Choices; 95PC module name |
| 7FF7F | 81EEA | 1F6B | `src/front/front_7FF7F.asm` | placeholder |
| 81EEA | 849D5 | 2AEB | `src/front/front_81EEA.asm` | placeholder |
| 849D5 | 88E09 | 4434 | `src/front/front_849D5.asm` | placeholder |
| 88E09 | 8C3DD | 35D4 | `src/front/front_88E09.asm` | placeholder |
| 8C3DD | 90879 | 449C | `src/front/front_8C3DD.asm` | placeholder |
| 90879 | 93E6A | 35F1 | `src/front/front_90879.asm` | placeholder |
| 93E6A | 971E9 | 337F | `src/front/front_93E6A.asm` | placeholder |
| 971E9 | 9CFE3 | 5DFA | `src/front/front_971E9.asm` | placeholder |
| 9CFE3 | A17D5 | 47F2 | `src/front/front_9CFE3.asm` | placeholder |
| A17D5 | A4FD7 | 3802 | `src/front/front_A17D5.asm` | placeholder |
| A4FD7 | A8B9B | 3BC4 | `src/front/playoff/playoff.asm` | PLAYOFF.NDX, series length buttons; 95PC module name |
| A8B9B | A9CB3 | 1118 | `src/lib/lib_A8B9B.asm` | placeholder |
| A9CB3 | AA5C4 | 911 | `src/lib/watcom/watcom_clib_01.asm` | NHL95PC module (matched functions) |
| AA5C4 | AA988 | 3C4 | `src/lib/ea/ea_timer.asm` | NHL95PC module (matched functions) |
| AA988 | AB834 | EAC | `src/lib/ea/ea_gfx_01.asm` | NHL95PC module (matched functions) |
| AB834 | AC9F0 | 11BC | `src/lib/ea/ea_memman.asm` | NHL95PC module (matched functions) |
| AC9F0 | ACED8 | 4E8 | `src/lib/ea/ea_fileblock_01.asm` | NHL95PC module (matched functions) |
| ACED8 | AD680 | 7A8 | `src/lib/ea/ea_debug_01.asm` | NHL95PC module (matched functions) |
| AD680 | ADC18 | 598 | `src/lib/ea/ea_gfx_02.asm` | NHL95PC module (matched functions) |
| ADC18 | AEE40 | 1228 | `src/lib/watcom/watcom_clib_02.asm` | NHL95PC module (matched functions) |
| AEE40 | B03F2 | 15B2 | `src/lib/ea/ea_unpack.asm` | NHL95PC module (matched functions) |
| B03F2 | B2158 | 1D66 | `src/lib/watcom/watcom_clib_03.asm` | NHL95PC module (matched functions) |
| B2158 | B2200 | A8 | `src/lib/ea/ea_window.asm` | NHL95PC module (matched functions) |
| B2200 | B22E0 | E0 | `src/lib/watcom/watcom_clib_04.asm` | NHL95PC module (matched functions) |
| B22E0 | B2B30 | 850 | `src/lib/ea/ea_fileblock_02.asm` | NHL95PC module (matched functions) |
| B2B30 | B2C98 | 168 | `src/lib/ea/ea_gfx_03.asm` | NHL95PC module (matched functions) |
| B2C98 | B7410 | 4778 | `src/lib/watcom/watcom_clib_05.asm` | NHL95PC module (matched functions) |
| B7410 | B75A0 | 190 | `src/lib/ea/ea_gfx_04.asm` | NHL95PC module (matched functions) |
| B75A0 | BA3D0 | 2E30 | `src/lib/ea/ea_shpi_01.asm` | NHL95PC module (matched functions) |
| BA3D0 | BC73C | 236C | `src/lib/ea/ea_gfx_05.asm` | NHL95PC module (matched functions) |
| BC73C | BE8C5 | 2189 | `src/lib/watcom/watcom_clib_06.asm` | NHL95PC module (matched functions) |
| BE8C5 | BF02C | 767 | `src/lib/ea/ea_fileblock_03.asm` | NHL95PC module (matched functions) |
| BF02C | BF070 | 44 | `src/lib/ea/ea_sound_hl.asm` | NHL95PC module (matched functions) |
| BF070 | BF534 | 4C4 | `src/lib/watcom/watcom_clib_07.asm` | NHL95PC module (matched functions) |
| BF534 | BF949 | 415 | `src/lib/ea/ea_vesa_init.asm` | NHL95PC module (matched functions) |
| BF949 | C27F8 | 2EAF | `src/lib/watcom/watcom_clib_08.asm` | NHL95PC module (matched functions) |
| C27F8 | C2CB0 | 4B8 | `src/lib/ea/ea_kbd_exit.asm` | NHL95PC module (matched functions) |
| C2CB0 | C31C4 | 514 | `src/lib/watcom/watcom_clib_09.asm` | NHL95PC module (matched functions) |
| C31C4 | C3724 | 560 | `src/lib/dos4gw/dos4gw_dpmi_glue_01.asm` | NHL95PC module (matched functions) |
| C3724 | C3727 | 3 | `src/lib/ea/ea_mcga_window.asm` | NHL95PC module (matched functions) |
| C3727 | C39C2 | 29B | `src/lib/watcom/watcom_clib_10.asm` | NHL95PC module (matched functions) |
| C39C2 | C3BE0 | 21E | `src/lib/dos4gw/dos4gw_dpmi_glue_02.asm` | NHL95PC module (matched functions) |
| C3BE0 | C3CC0 | E0 | `src/lib/watcom/watcom_clib_11.asm` | NHL95PC module (matched functions) |
| C3CC0 | C3E38 | 178 | `src/lib/ea/ea_shapes_01.asm` | NHL95PC module (matched functions) |
| C3E38 | C40B4 | 27C | `src/lib/ea/ea_misc.asm` | NHL95PC module (matched functions) |
| C40B4 | C4DE0 | D2C | `src/lib/watcom/watcom_clib_12.asm` | NHL95PC module (matched functions) |
| C4DE0 | C4EA1 | C1 | `src/lib/ea/ea_shapes_02.asm` | NHL95PC module (matched functions) |
| C4EA1 | CA6E0 | 583F | `src/lib/watcom/watcom_clib_13.asm` | NHL95PC module (matched functions) |
| CA6E0 | CA835 | 155 | `src/lib/ea/ea_snap.asm` | NHL95PC module (matched functions) |
| CA835 | CE06B | 3836 | `src/lib/watcom/watcom_clib_14.asm` | NHL95PC module (matched functions) |
| CE06B | CFDF1 | 1D86 | `src/lib/sound/snd_soundblaster.asm` | NHL95PC module (matched functions) |
| CFDF1 | D002F | 23E | `src/lib/watcom/watcom_clib_15.asm` | NHL95PC module (matched functions) |
| D002F | D01B5 | 186 | `src/lib/dos4gw/dos4gw_dpmi_glue_03.asm` | NHL95PC module (matched functions) |
| D01B5 | D0360 | 1AB | `src/lib/watcom/watcom_clib_16.asm` | NHL95PC module (matched functions) |
| D0360 | D0692 | 332 | `src/lib/ea/ea_shpi_02.asm` | NHL95PC module (matched functions) |
| D0692 | D069B | 9 | `src/lib/sound/snd_pcspeaker.asm` | NHL95PC module (matched functions) |
| D069B | D14D1 | E36 | `src/lib/watcom/watcom_clib_17.asm` | NHL95PC module (matched functions) |
| D14D1 | D284C | 137B | `src/lib/dos4gw/dos4gw_dpmi_glue_04.asm` | NHL95PC module (matched functions) |
| D284C | D59DB | 318F | `src/lib/watcom/watcom_emu387.asm` | NHL95PC module (matched functions) |
| D59DB | D6120 | 745 | `src/lib/sound/snd_hw_sb.asm` | NHL95PC module (matched functions) |
| D6120 | D79CC | 18AC | `src/lib/sound/snd_gus_sdk_01.asm` | NHL95PC module (matched functions) |
| D79CC | D7BB2 | 1E6 | `src/lib/video/vesa_banked_blit_01.asm` | NHL95PC module (matched functions) |
| D7BB2 | D7DB0 | 1FE | `src/lib/watcom/watcom_clib_18.asm` | NHL95PC module (matched functions) |
| D7DB0 | DA5AF | 27FF | `src/lib/ea/ea_debug_02.asm` | NHL95PC module (matched functions) |
| DA5AF | DA5D0 | 21 | `src/lib/watcom/watcom_clib_19.asm` | NHL95PC module (matched functions) |
| DA5D0 | DB9FA | 142A | `src/lib/sound/snd_gus_sdk_02.asm` | NHL95PC module (matched functions) |
| DB9FA | DBFA8 | 5AE | `src/lib/watcom/watcom_clib_20.asm` | NHL95PC module (matched functions) |
| DBFA8 | DCBB0 | C08 | `src/lib/ea/ea_unpackf_blit.asm` | NHL95PC module (matched functions) |
| DCBB0 | DCC25 | 75 | `src/lib/sound/snd_gus_sdk_03.asm` | NHL95PC module (matched functions) |
| DCC25 | DD6C4 | A9F | `src/lib/watcom/watcom_clib_21.asm` | NHL95PC module (matched functions) |
| DD6C4 | DE084 | 9C0 | `src/lib/video/video_bios_vga_01.asm` | NHL95PC module (matched functions) |
| DE084 | DF8AC | 1828 | `src/lib/video/vesa_banked_blit_02.asm` | NHL95PC module (matched functions) |
| DF8AC | DFC33 | 387 | `src/lib/input/input_mouse.asm` | NHL95PC module (matched functions) |
| DFC33 | DFEB4 | 281 | `src/lib/input/input_keyboard_01.asm` | NHL95PC module (matched functions) |
| DFEB4 | E0658 | 7A4 | `src/lib/input/input_joystick_misc_01.asm` | NHL95PC module (matched functions) |
| E0658 | E0834 | 1DC | `src/lib/ea/ea_fileio_01.asm` | NHL95PC module (matched functions) |
| E0834 | E0898 | 64 | `src/lib/input/input_keyboard_02.asm` | NHL95PC module (matched functions) |
| E0898 | E1824 | F8C | `src/lib/input/input_joystick_misc_02.asm` | NHL95PC module (matched functions) |
| E1824 | E193C | 118 | `src/lib/video/video_bios_vga_02.asm` | NHL95PC module (matched functions) |
| E193C | E1970 | 34 | `src/lib/input/input_joystick_misc_03.asm` | NHL95PC module (matched functions) |
| E1970 | E19F0 | 80 | `src/lib/ea/ea_fileio_02.asm` | NHL95PC module (matched functions) |
| E19F0 | E28A0 | EB0 | `src/lib/video/video_bios_vga_03.asm` | NHL95PC module (matched functions) |

## cseg02 (1 segments)

| Start | End | Size | File | Note |
|---|---|---|---|---|
| F0000 | F0034 | 34 | `src/cseg02/cseg02.asm` |  |

## dseg03 (1 segments)

| Start | End | Size | File | Note |
|---|---|---|---|---|
| 100000 | 100018 | 18 | `src/dseg03/dseg03.asm` |  |

## dseg04 (134 segments)

| Start | End | Size | File | Note |
|---|---|---|---|---|
| 110000 | 110101 | 101 | `src/data/shared_data_01.asm` | owner: shared |
| 110101 | 1102EC | 1EB | `src/data/front/front_1456D_data_01.asm` | owner: front/front_1456D.asm |
| 1102EC | 110730 | 444 | `src/data/front/main_data_01.asm` | owner: front/main/main.asm |
| 110730 | 110836 | 106 | `src/data/front/front_201CD_data_01.asm` | owner: front/front_201CD.asm |
| 110836 | 110B48 | 312 | `src/data/front/rink_model_data_01.asm` | owner: front/rink_model/rink_model.asm |
| 110B48 | 110DA4 | 25C | `src/data/front/front_2A692_data_01.asm` | owner: front/front_2A692.asm |
| 110DA4 | 110EB0 | 10C | `src/data/engine/engine_4DED8_data_01.asm` | owner: engine/engine_4DED8.asm |
| 110EB0 | 111008 | 158 | `src/data/front/replay_controls_data_01.asm` | owner: front/replay_controls/replay_controls.asm |
| 111008 | 1111DE | 1D6 | `src/data/front/front_584A0_data_01.asm` | owner: front/front_584A0.asm |
| 1111DE | 11187C | 69E | `src/data/front/front_5D993_data_01.asm` | owner: front/front_5D993.asm |
| 11187C | 111D84 | 508 | `src/data/front/front_64F59_data_01.asm` | owner: front/front_64F59.asm |
| 111D84 | 111E88 | 104 | `src/data/front/pause_menu_data_01.asm` | owner: front/pause_menu/pause_menu.asm |
| 111E88 | 111F8B | 103 | `src/data/front/front_6E233_data_01.asm` | owner: front/front_6E233.asm |
| 111F8B | 11208E | 103 | `src/data/front/modem_setup_data_01.asm` | owner: front/modem_setup/modem_setup.asm |
| 11208E | 1121A4 | 116 | `src/data/front/front_741BD_data_01.asm` | owner: front/front_741BD.asm |
| 1121A4 | 1122A8 | 104 | `src/data/front/front_77642_data_01.asm` | owner: front/front_77642.asm |
| 1122A8 | 1123AC | 104 | `src/data/front/front_794FF_data_01.asm` | owner: front/front_794FF.asm |
| 1123AC | 1124B0 | 104 | `src/data/front/calendar_data_01.asm` | owner: front/calendar/calendar.asm |
| 1124B0 | 1125B2 | 102 | `src/data/front/front_849D5_data_01.asm` | owner: front/front_849D5.asm |
| 1125B2 | 1126C4 | 112 | `src/data/front/front_88E09_data_01.asm` | owner: front/front_88E09.asm |
| 1126C4 | 1128C6 | 202 | `src/data/front/front_8C3DD_data_01.asm` | owner: front/front_8C3DD.asm |
| 1128C6 | 112A2C | 166 | `src/data/front/front_90879_data_01.asm` | owner: front/front_90879.asm |
| 112A2C | 112B33 | 107 | `src/data/front/front_93E6A_data_01.asm` | owner: front/front_93E6A.asm |
| 112B33 | 112D7C | 249 | `src/data/front/front_971E9_data_01.asm` | owner: front/front_971E9.asm |
| 112D7C | 112E7D | 101 | `src/data/front/front_9CFE3_data_01.asm` | owner: front/front_9CFE3.asm |
| 112E7D | 112F94 | 117 | `src/data/front/front_A17D5_data_01.asm` | owner: front/front_A17D5.asm |
| 112F94 | 11309C | 108 | `src/data/front/playoff_data_01.asm` | owner: front/playoff/playoff.asm |
| 11309C | 11319C | 100 | `src/data/lib/lib_A8B9B_data_01.asm` | owner: lib/lib_A8B9B.asm |
| 11319C | 113438 | 29C | `src/data/lib/ea/ea_memman_data_01.asm` | owner: lib/ea/ea_memman.asm |
| 113438 | 1135A8 | 170 | `src/data/lib/ea/ea_fileblock_01_data_01.asm` | owner: lib/ea/ea_fileblock_01.asm |
| 1135A8 | 1136C4 | 11C | `src/data/lib/ea/ea_unpack_data_01.asm` | owner: lib/ea/ea_unpack.asm |
| 1136C4 | 11388C | 1C8 | `src/data/lib/watcom/watcom_clib_05_data_01.asm` | owner: lib/watcom/watcom_clib_05.asm |
| 11388C | 1139D8 | 14C | `src/data/lib/ea/ea_shpi_01_data_01.asm` | owner: lib/ea/ea_shpi_01.asm |
| 1139D8 | 113B10 | 138 | `src/data/lib/watcom/watcom_clib_07_data_01.asm` | owner: lib/watcom/watcom_clib_07.asm |
| 113B10 | 113EE0 | 3D0 | `src/data/lib/watcom/watcom_clib_08_data_01.asm` | owner: lib/watcom/watcom_clib_08.asm |
| 113EE0 | 1140E8 | 208 | `src/data/lib/watcom/watcom_clib_13_data_01.asm` | owner: lib/watcom/watcom_clib_13.asm |
| 1140E8 | 114330 | 248 | `src/data/lib/sound/snd_soundblaster_data_01.asm` | owner: lib/sound/snd_soundblaster.asm |
| 114330 | 1149B4 | 684 | `src/data/lib/ea/ea_debug_02_data_01.asm` | owner: lib/ea/ea_debug_02.asm |
| 1149B4 | 114B40 | 18C | `src/data/lib/watcom/watcom_clib_21_data_01.asm` | owner: lib/watcom/watcom_clib_21.asm |
| 114B40 | 114DD2 | 292 | `src/data/front/front_10010_data_01.asm` | owner: front/front_10010.asm |
| 114DD2 | 115098 | 2C6 | `src/data/front/front_1456D_data_02.asm` | owner: front/front_1456D.asm |
| 115098 | 1175AD | 2515 | `src/data/front/main_data_02.asm` | owner: front/main/main.asm |
| 1175AD | 1177F4 | 247 | `src/data/front/rink_model_data_02.asm` | owner: front/rink_model/rink_model.asm |
| 1177F4 | 117938 | 144 | `src/data/front/front_2A692_data_02.asm` | owner: front/front_2A692.asm |
| 117938 | 118E82 | 154A | `src/data/engine/penalty_data_01.asm` | owner: engine/penalty/penalty.asm |
| 118E82 | 11918B | 309 | `src/data/engine/hockey_data_01.asm` | owner: engine/hockey/hockey.asm |
| 11918B | 119D08 | B7D | `src/data/engine/engine_4DED8_data_02.asm` | owner: engine/engine_4DED8.asm |
| 119D08 | 119E44 | 13C | `src/data/engine/engine_2D9D9_data_01.asm` | owner: engine/engine_2D9D9.asm |
| 119E44 | 119F4A | 106 | `src/data/engine/logic_data_01.asm` | owner: engine/logic/logic.asm |
| 119F4A | 11A310 | 3C6 | `src/data/engine/input_data_01.asm` | owner: engine/input/input.asm |
| 11A310 | 11A410 | 100 | `src/data/engine/lines_data_01.asm` | owner: engine/lines/lines.asm |
| 11A410 | 11B238 | E28 | `src/data/front/replay_controls_data_02.asm` | owner: front/replay_controls/replay_controls.asm |
| 11B238 | 11B338 | 100 | `src/data/front/front_584A0_data_02.asm` | owner: front/front_584A0.asm |
| 11B338 | 11D1C8 | 1E90 | `src/data/front/front_5D993_data_02.asm` | owner: front/front_5D993.asm |
| 11D1C8 | 11D74F | 587 | `src/data/front/front_67000_data_01.asm` | owner: front/front_67000.asm |
| 11D74F | 11D92C | 1DD | `src/data/front/front_77642_data_02.asm` | owner: front/front_77642.asm |
| 11D92C | 11DFC8 | 69C | `src/data/front/front_6E233_data_02.asm` | owner: front/front_6E233.asm |
| 11DFC8 | 11E2D4 | 30C | `src/data/front/front_741BD_data_02.asm` | owner: front/front_741BD.asm |
| 11E2D4 | 11E624 | 350 | `src/data/front/front_77642_data_03.asm` | owner: front/front_77642.asm |
| 11E624 | 11E890 | 26C | `src/data/front/front_88E09_data_02.asm` | owner: front/front_88E09.asm |
| 11E890 | 11E9C0 | 130 | `src/data/front/front_93E6A_data_02.asm` | owner: front/front_93E6A.asm |
| 11E9C0 | 11ED30 | 370 | `src/data/front/front_9CFE3_data_02.asm` | owner: front/front_9CFE3.asm |
| 11ED30 | 11EE94 | 164 | `src/data/front/front_A17D5_data_02.asm` | owner: front/front_A17D5.asm |
| 11EE94 | 11F4BC | 628 | `src/data/front/playoff_data_02.asm` | owner: front/playoff/playoff.asm |
| 11F4BC | 11F5DC | 120 | `src/data/lib/lib_A8B9B_data_02.asm` | owner: lib/lib_A8B9B.asm |
| 11F5DC | 11F708 | 12C | `src/data/lib/watcom/watcom_clib_05_data_02.asm` | owner: lib/watcom/watcom_clib_05.asm |
| 11F708 | 11F8DC | 1D4 | `src/data/lib/input/input_keyboard_01_data_01.asm` | owner: lib/input/input_keyboard_01.asm |
| 11F8DC | 11FD54 | 478 | `src/data/lib/input/input_joystick_misc_01_data_01.asm` | owner: lib/input/input_joystick_misc_01.asm |
| 11FD54 | 1210D0 | 137C | `src/data/lib/watcom/watcom_clib_03_data_01.asm` | owner: lib/watcom/watcom_clib_03.asm |
| 1210D0 | 121B38 | A68 | `src/data/lib/input/input_joystick_misc_01_data_02.asm` | owner: lib/input/input_joystick_misc_01.asm |
| 121B38 | 1222C8 | 790 | `src/data/lib/watcom/watcom_clib_05_data_03.asm` | owner: lib/watcom/watcom_clib_05.asm |
| 1222C8 | 1228D6 | 60E | `src/data/lib/input/input_joystick_misc_02_data_01.asm` | owner: lib/input/input_joystick_misc_02.asm |
| 1228D6 | 123A94 | 11BE | `src/data/lib/watcom/watcom_clib_05_data_04.asm` | owner: lib/watcom/watcom_clib_05.asm |
| 123A94 | 123BB0 | 11C | `src/data/lib/input/input_joystick_misc_02_data_02.asm` | owner: lib/input/input_joystick_misc_02.asm |
| 123BB0 | 123DA4 | 1F4 | `src/data/lib/watcom/watcom_clib_08_data_02.asm` | owner: lib/watcom/watcom_clib_08.asm |
| 123DA4 | 124020 | 27C | `src/data/lib/video/video_bios_vga_02_data_01.asm` | owner: lib/video/video_bios_vga_02.asm |
| 124020 | 124124 | 104 | `src/data/lib/ea/ea_fileio_02_data_01.asm` | owner: lib/ea/ea_fileio_02.asm |
| 124124 | 124244 | 120 | `src/data/lib/watcom/watcom_clib_13_data_02.asm` | owner: lib/watcom/watcom_clib_13.asm |
| 124244 | 1248DC | 698 | `src/data/lib/video/video_bios_vga_03_data_01.asm` | owner: lib/video/video_bios_vga_03.asm |
| 1248DC | 14F01C | 2A740 | `src/data/lib/watcom/watcom_clib_14_data_01.asm` | owner: lib/watcom/watcom_clib_14.asm |
| 14F01C | 14FAC0 | AA4 | `src/data/lib/sound/snd_soundblaster_data_02.asm` | owner: lib/sound/snd_soundblaster.asm |
| 14FAC0 | 14FBF4 | 134 | `src/data/lib/video/video_bios_vga_03_data_02.asm` | owner: lib/video/video_bios_vga_03.asm |
| 14FBF4 | 1512F0 | 16FC | `src/data/lib/watcom/watcom_emu387_data_01.asm` | owner: lib/watcom/watcom_emu387.asm |
| 1512F0 | 151418 | 128 | `src/data/lib/sound/snd_hw_sb_data_01.asm` | owner: lib/sound/snd_hw_sb.asm |
| 151418 | 151598 | 180 | `src/data/lib/sound/snd_gus_sdk_02_data_01.asm` | owner: lib/sound/snd_gus_sdk_02.asm |
| 151598 | 15159C | 4 | `src/data/lib/sound/snd_gus_sdk_02_bss_01.asm` | owner: lib/sound/snd_gus_sdk_02.asm |
| 15159C | 151AE4 | 548 | `src/data/front/front_10010_bss_01.asm` | owner: front/front_10010.asm |
| 151AE4 | 152920 | E3C | `src/data/front/front_1456D_bss_01.asm` | owner: front/front_1456D.asm |
| 152920 | 158CBA | 639A | `src/data/front/main_bss_01.asm` | owner: front/main/main.asm |
| 158CBA | 158F24 | 26A | `src/data/front/front_201CD_bss_01.asm` | owner: front/front_201CD.asm |
| 158F24 | 159C57 | D33 | `src/data/front/rink_model_bss_01.asm` | owner: front/rink_model/rink_model.asm |
| 159C57 | 159F58 | 301 | `src/data/front/front_201CD_bss_02.asm` | owner: front/front_201CD.asm |
| 159F58 | 15EA0C | 4AB4 | `src/data/front/rink_model_bss_02.asm` | owner: front/rink_model/rink_model.asm |
| 15EA0C | 164F1C | 6510 | `src/data/front/front_2A692_bss_01.asm` | owner: front/front_2A692.asm |
| 164F1C | 165366 | 44A | `src/data/front/replay_controls_bss_01.asm` | owner: front/replay_controls/replay_controls.asm |
| 165366 | 1656DE | 378 | `src/data/engine/engine_2D9D9_bss_01.asm` | owner: engine/engine_2D9D9.asm |
| 1656DE | 16583E | 160 | `src/data/front/front_1456D_bss_02.asm` | owner: front/front_1456D.asm |
| 16583E | 165953 | 115 | `src/data/engine/hockey_bss_01.asm` | owner: engine/hockey/hockey.asm |
| 165953 | 176B68 | 11215 | `src/data/engine/faceoff_bss_01.asm` | owner: engine/faceoff/faceoff.asm |
| 176B68 | 176CA8 | 140 | `src/data/front/main_bss_02.asm` | owner: front/main/main.asm |
| 176CA8 | 176F94 | 2EC | `src/data/engine/lines_bss_01.asm` | owner: engine/lines/lines.asm |
| 176F94 | 1770D8 | 144 | `src/data/front/replay_controls_bss_02.asm` | owner: front/replay_controls/replay_controls.asm |
| 1770D8 | 1774C4 | 3EC | `src/data/engine/lines_bss_02.asm` | owner: engine/lines/lines.asm |
| 1774C4 | 17828C | DC8 | `src/data/front/replay_controls_bss_03.asm` | owner: front/replay_controls/replay_controls.asm |
| 17828C | 179CBC | 1A30 | `src/data/front/front_584A0_bss_01.asm` | owner: front/front_584A0.asm |
| 179CBC | 17C3F8 | 273C | `src/data/front/front_5D993_bss_01.asm` | owner: front/front_5D993.asm |
| 17C3F8 | 17C5BC | 1C4 | `src/data/front/front_64F59_bss_01.asm` | owner: front/front_64F59.asm |
| 17C5BC | 17C9AA | 3EE | `src/data/front/front_67000_bss_01.asm` | owner: front/front_67000.asm |
| 17C9AA | 17CECD | 523 | `src/data/front/front_10010_bss_02.asm` | owner: front/front_10010.asm |
| 17CECD | 17D166 | 299 | `src/data/front/front_794FF_bss_01.asm` | owner: front/front_794FF.asm |
| 17D166 | 17D4E8 | 382 | `src/data/front/playoff_bss_01.asm` | owner: front/playoff/playoff.asm |
| 17D4E8 | 17D678 | 190 | `src/data/front/pause_menu_bss_01.asm` | owner: front/pause_menu/pause_menu.asm |
| 17D678 | 17D7D4 | 15C | `src/data/front/front_741BD_bss_01.asm` | owner: front/front_741BD.asm |
| 17D7D4 | 17D928 | 154 | `src/data/front/calendar_bss_01.asm` | owner: front/calendar/calendar.asm |
| 17D928 | 17DB7C | 254 | `src/data/front/front_81EEA_bss_01.asm` | owner: front/front_81EEA.asm |
| 17DB7C | 17DC7C | 100 | `src/data/front/front_849D5_bss_01.asm` | owner: front/front_849D5.asm |
| 17DC7C | 17E9D4 | D58 | `src/data/front/front_88E09_bss_01.asm` | owner: front/front_88E09.asm |
| 17E9D4 | 182128 | 3754 | `src/data/front/front_8C3DD_bss_01.asm` | owner: front/front_8C3DD.asm |
| 182128 | 182294 | 16C | `src/data/front/front_93E6A_bss_01.asm` | owner: front/front_93E6A.asm |
| 182294 | 183028 | D94 | `src/data/front/front_971E9_bss_01.asm` | owner: front/front_971E9.asm |
| 183028 | 1843F8 | 13D0 | `src/data/front/front_9CFE3_bss_01.asm` | owner: front/front_9CFE3.asm |
| 1843F8 | 1845FC | 204 | `src/data/front/front_A17D5_bss_01.asm` | owner: front/front_A17D5.asm |
| 1845FC | 184B38 | 53C | `src/data/front/playoff_bss_02.asm` | owner: front/playoff/playoff.asm |
| 184B38 | 185740 | C08 | `src/data/lib/lib_A8B9B_bss_01.asm` | owner: lib/lib_A8B9B.asm |
| 185740 | 185C4C | 50C | `src/data/lib/ea/ea_debug_01_bss_01.asm` | owner: lib/ea/ea_debug_01.asm |
| 185C4C | 190E90 | B244 | `src/data/lib/watcom/watcom_clib_05_bss_01.asm` | owner: lib/watcom/watcom_clib_05.asm |
| 190E90 | 191AB0 | C20 | `src/data/lib/ea/ea_shpi_01_bss_01.asm` | owner: lib/ea/ea_shpi_01.asm |
| 191AB0 | 1983E0 | 6930 | `src/data/lib/ea/ea_gfx_05_bss_01.asm` | owner: lib/ea/ea_gfx_05.asm |
| 1983E0 | 19B654 | 3274 | `src/data/lib/watcom/watcom_clib_06_bss_01.asm` | owner: lib/watcom/watcom_clib_06.asm |
| 19B654 | 19B760 | 10C | `src/data/lib/watcom/watcom_clib_07_bss_01.asm` | owner: lib/watcom/watcom_clib_07.asm |
| 19B760 | 1A0FB0 | 5850 | `src/data/lib/watcom/watcom_clib_08_bss_01.asm` | owner: lib/watcom/watcom_clib_08.asm |
| 1A0FB0 | 1A10B0 | 100 | `src/data/lib/sound/snd_soundblaster_bss_01.asm` | owner: lib/sound/snd_soundblaster.asm |
| 1A10B0 | 1A11BC | 10C | `src/data/lib/watcom/watcom_clib_17_bss_01.asm` | owner: lib/watcom/watcom_clib_17.asm |
| 1A11BC | 1A9260 | 80A4 | `src/data/lib/ea/ea_debug_02_bss_01.asm` | owner: lib/ea/ea_debug_02.asm |
