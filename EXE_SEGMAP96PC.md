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
| 110000 | 11000C | C | `src/data/shared_data_01.asm` | owner: shared |
| 11000C | 110030 | 24 | `src/data/pc/modem_game_const.asm` | owner: pc/modem_game/modem_game.asm |
| 110030 | 1100F7 | C7 | `src/data/front/postgame_const.asm` | owner: front/postgame/postgame.asm |
| 1100F7 | 11029C | 1A5 | `src/data/front/play_game_const.asm` | owner: front/play_game/play_game.asm |
| 11029C | 1102EC | 50 | `src/data/pc/link_const.asm` | owner: pc/link/link.asm |
| 1102EC | 1102F8 | C | `src/data/front/name_index_const.asm` | owner: front/name_index/name_index.asm |
| 1102F8 | 110308 | 10 | `src/data/front/edit_text_const.asm` | owner: front/edit_text/edit_text.asm |
| 110308 | 110331 | 29 | `src/data/front/message_box_const.asm` | owner: front/message_box/message_box.asm |
| 110331 | 1104D0 | 19F | `src/data/front/main_const.asm` | owner: front/main/main.asm |
| 1104D0 | 11061C | 14C | `src/data/pc/async_const.asm` | owner: pc/async/async.asm |
| 11061C | 1106E8 | CC | `src/data/pc/cdstream_const.asm` | owner: pc/cdstream/cdstream.asm |
| 1106E8 | 110718 | 30 | `src/data/pc/file_io_const.asm` | owner: pc/file_io/file_io.asm |
| 110718 | 110730 | 18 | `src/data/pc/data_files_const.asm` | owner: pc/data_files/data_files.asm |
| 110730 | 110768 | 38 | `src/data/front/pad_setup_const.asm` | owner: front/pad_setup/pad_setup.asm |
| 110768 | 110B48 | 3E0 | `src/data/front/rink_model_const.asm` | owner: front/rink_model/rink_model.asm |
| 110B48 | 110D88 | 240 | `src/data/pc/users_const.asm` | owner: pc/users/users.asm |
| 110D88 | 110DA4 | 1C | `src/data/engine/threestars_const.asm` | owner: engine/threestars/threestars.asm |
| 110DA4 | 110DC0 | 1C | `src/data/engine/savestate_const.asm` | owner: engine/savestate/savestate.asm |
| 110DC0 | 110E44 | 84 | `src/data/engine/gamelog_const.asm` | owner: engine/gamelog/gamelog.asm |
| 110E44 | 110EB0 | 6C | `src/data/engine/lines_const.asm` | owner: engine/lines/lines.asm |
| 110EB0 | 111008 | 158 | `src/data/front/replay_controls_const.asm` | owner: front/replay_controls/replay_controls.asm |
| 111008 | 111084 | 7C | `src/data/front/game_view_const.asm` | owner: front/game_view/game_view.asm |
| 111084 | 1111DE | 15A | `src/data/front/camera_const.asm` | owner: front/camera/camera.asm |
| 1111DE | 111248 | 6A | `src/data/front/player_art_const.asm` | owner: front/player_art/player_art.asm |
| 111248 | 111288 | 40 | `src/data/front/screen_art_const.asm` | owner: front/screen_art/screen_art.asm |
| 111288 | 111818 | 590 | `src/data/front/intro_const.asm` | owner: front/intro/intro.asm |
| 111818 | 11187C | 64 | `src/data/front/draw_const.asm` | owner: front/draw/draw.asm |
| 11187C | 11192C | B0 | `src/data/front/menu_const.asm` | owner: front/menu/menu.asm |
| 11192C | 111938 | C | `src/data/front/speech_const.asm` | owner: front/speech/speech.asm |
| 111938 | 111940 | 8 | `src/data/front/movie_const.asm` | owner: front/movie/movie.asm |
| 111940 | 111D84 | 444 | `src/data/front/settings_const.asm` | owner: front/settings/settings.asm |
| 111D84 | 111E44 | C0 | `src/data/front/pause_menu_const.asm` | owner: front/pause_menu/pause_menu.asm |
| 111E44 | 111ED0 | 8C | `src/data/front/controller_screen_const.asm` | owner: front/controller_screen/controller_screen.asm |
| 111ED0 | 11203C | 16C | `src/data/pc/modem_setup_const.asm` | owner: pc/modem_setup/modem_setup.asm |
| 11203C | 1120D1 | 95 | `src/data/front/team_select_const.asm` | owner: front/team_select/team_select.asm |
| 1120D1 | 1120E0 | F | `src/data/front/lang_text_const.asm` | owner: front/lang_text/lang_text.asm |
| 1120E0 | 1121CC | EC | `src/data/front/new_season_const.asm` | owner: front/new_season/new_season.asm |
| 1121CC | 1122F8 | 12C | `src/data/front/season_menu_const.asm` | owner: front/season_menu/season_menu.asm |
| 1122F8 | 112308 | 10 | `src/data/front/scroll_bar_const.asm` | owner: front/scroll_bar/scroll_bar.asm |
| 112308 | 1123D0 | C8 | `src/data/front/calendar_const.asm` | owner: front/calendar/calendar.asm |
| 1123D0 | 1123EC | 1C | `src/data/front/season_db_const.asm` | owner: front/season_db/season_db.asm |
| 1123EC | 112488 | 9C | `src/data/front/sim_game_const.asm` | owner: front/sim_game/sim_game.asm |
| 112488 | 112534 | AC | `src/data/front/pregame_const.asm` | owner: front/pregame/pregame.asm |
| 112534 | 11253C | 8 | `src/data/front/line_draw_const.asm` | owner: front/line_draw/line_draw.asm |
| 11253C | 1126C4 | 188 | `src/data/front/stats_menu_const.asm` | owner: front/stats_menu/stats_menu.asm |
| 1126C4 | 1128B5 | 1F1 | `src/data/front/player_stats_const.asm` | owner: front/player_stats/player_stats.asm |
| 1128B5 | 112A2C | 177 | `src/data/front/player_cards_const.asm` | owner: front/player_cards/player_cards.asm |
| 112A2C | 112B28 | FC | `src/data/front/player_ratings_const.asm` | owner: front/player_ratings/player_ratings.asm |
| 112B28 | 112D2C | 204 | `src/data/front/roster_const.asm` | owner: front/roster/roster.asm |
| 112D2C | 112E34 | 108 | `src/data/front/edit_lines_const.asm` | owner: front/edit_lines/edit_lines.asm |
| 112E34 | 112F00 | CC | `src/data/front/ingame_menu_const.asm` | owner: front/ingame_menu/ingame_menu.asm |
| 112F00 | 112F94 | 94 | `src/data/pc/modem_teams_const.asm` | owner: pc/modem_teams/modem_teams.asm |
| 112F94 | 1130F8 | 164 | `src/data/front/playoff_const.asm` | owner: front/playoff/playoff.asm |
| 1130F8 | 113110 | 18 | `src/data/lib/ea/ea_timer_const.asm` | owner: lib/ea/ea_timer.asm |
| 113110 | 11319C | 8C | `src/data/lib/ea/ea_draw_shape_at_own_pos_const.asm` | owner: lib/ea/ea_draw_shape_at_own_pos.asm |
| 11319C | 113438 | 29C | `src/data/lib/ea/ea_memman_const.asm` | owner: lib/ea/ea_memman.asm |
| 113438 | 113484 | 4C | `src/data/lib/ea/ea_debug_printf_const.asm` | owner: lib/ea/ea_debug_printf.asm |
| 113484 | 1135A8 | 124 | `src/data/lib/ea/ea_debug_log_const.asm` | owner: lib/ea/ea_debug_log.asm |
| 1135A8 | 1135E8 | 40 | `src/data/lib/ea/ea_unpack_const.asm` | owner: lib/ea/ea_unpack.asm |
| 1135E8 | 113600 | 18 | `src/data/lib/ea/ea_dos_file_info_const.asm` | owner: lib/ea/ea_dos_file_info.asm |
| 113600 | 11362C | 2C | `src/data/lib/ea/ea_save_data_file_const.asm` | owner: lib/ea/ea_save_data_file.asm |
| 11362C | 113738 | 10C | `src/data/lib/ea/ea_grab_largest_block_const.asm` | owner: lib/ea/ea_grab_largest_block.asm |
| 113738 | 113740 | 8 | `src/data/lib/ea/ea_build_aa_pal_lut_const.asm` | owner: lib/ea/ea_build_aa_pal_lut.asm |
| 113740 | 113794 | 54 | `src/data/lib/cd/cd_open_file_const.asm` | owner: lib/cd/cd_open_file.asm |
| 113794 | 11388C | F8 | `src/data/lib/cd/cd_find_file_const.asm` | owner: lib/cd/cd_find_file.asm |
| 11388C | 113954 | C8 | `src/data/lib/ori3d/ori_set_rink_view_const.asm` | owner: lib/ori3d/ori_set_rink_view.asm |
| 113954 | 1139A8 | 54 | `src/data/lib/ori3d/ori_transform_vector_const.asm` | owner: lib/ori3d/ori_transform_vector.asm |
| 1139A8 | 1139D8 | 30 | `src/data/lib/ori3d/ori_find_group_const.asm` | owner: lib/ori3d/ori_find_group.asm |
| 1139D8 | 113A50 | 78 | `src/data/lib/video/video_vesa_get_info_const.asm` | owner: lib/video/video_vesa_get_info.asm |
| 113A50 | 113B10 | C0 | `src/data/lib/ea/ea_vesa_init_const.asm` | owner: lib/ea/ea_vesa_init.asm |
| 113B10 | 113E28 | 318 | `src/data/lib/sound/snd_speech_queue_service_const.asm` | owner: lib/sound/snd_speech_queue_service.asm |
| 113E28 | 113E64 | 3C | `src/data/lib/ea/ea_tgv_build_huff_table_const.asm` | owner: lib/ea/ea_tgv_build_huff_table.asm |
| 113E64 | 113E98 | 34 | `src/data/lib/ea/ea_kbd_exit_const.asm` | owner: lib/ea/ea_kbd_exit.asm |
| 113E98 | 113EBC | 24 | `src/data/lib/ea/ea_fill_row_table_const.asm` | owner: lib/ea/ea_fill_row_table.asm |
| 113EBC | 113EE0 | 24 | `src/data/lib/ea/ea_load_file_cached_const.asm` | owner: lib/ea/ea_load_file_cached.asm |
| 113EE0 | 113F68 | 88 | `src/data/lib/input/input_joystick_calibrate_screen_const.asm` | owner: lib/input/input_joystick_calibrate_screen.asm |
| 113F68 | 113F74 | C | `src/data/lib/ea/ea_show_keyboard_on_const.asm` | owner: lib/ea/ea_show_keyboard_on.asm |
| 113F74 | 114004 | 90 | `src/data/lib/ea/ea_shutdown_system_const.asm` | owner: lib/ea/ea_shutdown_system.asm |
| 114004 | 11407C | 78 | `src/data/lib/ea/ea_big_file_type_const.asm` | owner: lib/ea/ea_big_file_type.asm |
| 11407C | 1140E8 | 6C | `src/data/lib/ori3d/ori_fill_span_list_const.asm` | owner: lib/ori3d/ori_fill_span_list.asm |
| 1140E8 | 11412C | 44 | `src/data/lib/sound/snd_soundblaster_const.asm` | owner: lib/sound/snd_soundblaster.asm |
| 11412C | 11415C | 30 | `src/data/lib/watcom/watcom_memset_const.asm` | owner: lib/watcom/watcom_memset.asm |
| 11415C | 114180 | 24 | `src/data/lib/watcom/watcom_flushall_getche_const.asm` | owner: lib/watcom/watcom_flushall_getche.asm |
| 114180 | 114194 | 14 | `src/data/lib/video/video_is_text_mode_width_const.asm` | owner: lib/video/video_is_text_mode_width.asm |
| 114194 | 1141B4 | 20 | `src/data/lib/input/input_pointer_on_target_const.asm` | owner: lib/input/input_pointer_on_target.asm |
| 1141B4 | 1142A8 | F4 | `src/data/lib/ori3d/ori_build_edge_table_min_const.asm` | owner: lib/ori3d/ori_build_edge_table_min.asm |
| 1142A8 | 1142B8 | 10 | `src/data/lib/watcom/watcom_emu387_const.asm` | owner: lib/watcom/watcom_emu387.asm |
| 1142B8 | 114330 | 78 | `src/data/lib/sound/snd_hw_sb_const.asm` | owner: lib/sound/snd_hw_sb.asm |
| 114330 | 1149A4 | 674 | `src/data/lib/ea/ea_debug_get_key_const.asm` | owner: lib/ea/ea_debug_get_key.asm |
| 1149A4 | 1149B4 | 10 | `src/data/lib/ea/ea_unpackf_blit_const.asm` | owner: lib/ea/ea_unpackf_blit.asm |
| 1149B4 | 114B40 | 18C | `src/data/lib/watcom/watcom_nan_inf_const.asm` | owner: lib/watcom/watcom_nan_inf.asm |
| 114B40 | 114CE2 | 1A2 | `src/data/front/controls_data.asm` | owner: front/controls/controls.asm |
| 114CE2 | 114DD2 | F0 | `src/data/pc/modem_game_data.asm` | owner: pc/modem_game/modem_game.asm |
| 114DD2 | 114F04 | 132 | `src/data/front/postgame_data.asm` | owner: front/postgame/postgame.asm |
| 114F04 | 114F1C | 18 | `src/data/front/play_game_data.asm` | owner: front/play_game/play_game.asm |
| 114F1C | 1150C4 | 1A8 | `src/data/pc/link_data.asm` | owner: pc/link/link.asm |
| 1150C4 | 1150D4 | 10 | `src/data/front/message_box_data.asm` | owner: front/message_box/message_box.asm |
| 1150D4 | 1150E0 | C | `src/data/front/main_data.asm` | owner: front/main/main.asm |
| 1150E0 | 1150E8 | 8 | `src/data/pc/async_data.asm` | owner: pc/async/async.asm |
| 1150E8 | 1150FC | 14 | `src/data/pc/cdstream_data.asm` | owner: pc/cdstream/cdstream.asm |
| 1150FC | 115115 | 19 | `src/data/front/game_setup_data.asm` | owner: front/game_setup/game_setup.asm |
| 115115 | 1174E0 | 23CB | `src/data/pc/data_files_data.asm` | owner: pc/data_files/data_files.asm |
| 1174E0 | 117575 | 95 | `src/data/front/stats_tables_data.asm` | owner: front/stats_tables/stats_tables.asm |
| 117575 | 117588 | 13 | `src/data/front/game_teams_data.asm` | owner: front/game_teams/game_teams.asm |
| 117588 | 1175A4 | 1C | `src/data/front/pad_setup_data.asm` | owner: front/pad_setup/pad_setup.asm |
| 1175A4 | 1177F4 | 250 | `src/data/front/rink_model_data.asm` | owner: front/rink_model/rink_model.asm |
| 1177F4 | 117938 | 144 | `src/data/front/front_2A692_data_02.asm` | owner: front/front_2A692.asm |
| 117938 | 117A9C | 164 | `src/data/engine/penalty_data_01.asm` | owner: engine/penalty/penalty.asm |
| 117A9C | 118E82 | 13E6 | `src/data/engine/frames.asm` | owner: engine/hockey/hockey.asm |
| 118E82 | 11918B | 309 | `src/data/engine/hockey_data_01.asm` | owner: engine/hockey/hockey.asm |
| 11918B | 119D08 | B7D | `src/data/engine/engine_4DED8_data_02.asm` | owner: engine/engine_4DED8.asm |
| 119D08 | 119E44 | 13C | `src/data/engine/engine_2D9D9_data_01.asm` | owner: engine/engine_2D9D9.asm |
| 119E44 | 119F4A | 106 | `src/data/engine/logic_data_01.asm` | owner: engine/logic/logic.asm |
| 119F4A | 11A310 | 3C6 | `src/data/engine/input_data_01.asm` | owner: engine/input/input.asm |
| 11A310 | 11A3F8 | E8 | `src/data/engine/lines_data.asm` | owner: engine/lines/lines.asm |
| 11A3F8 | 11B238 | E40 | `src/data/front/replay_controls_data.asm` | owner: front/replay_controls/replay_controls.asm |
| 11B238 | 11B314 | DC | `src/data/front/game_view_data.asm` | owner: front/game_view/game_view.asm |
| 11B314 | 11BB38 | 824 | `src/data/front/camera_data.asm` | owner: front/camera/camera.asm |
| 11BB38 | 11BCE0 | 1A8 | `src/data/front/player_art_data.asm` | owner: front/player_art/player_art.asm |
| 11BCE0 | 11BDA8 | C8 | `src/data/front/screen_art_data.asm` | owner: front/screen_art/screen_art.asm |
| 11BDA8 | 11D18C | 13E4 | `src/data/front/intro_data.asm` | owner: front/intro/intro.asm |
| 11D18C | 11D1A8 | 1C | `src/data/front/draw_data.asm` | owner: front/draw/draw.asm |
| 11D1A8 | 11D1C8 | 20 | `src/data/front/menu_data.asm` | owner: front/menu/menu.asm |
| 11D1C8 | 11D3B8 | 1F0 | `src/data/front/sound_data.asm` | owner: front/sound/sound.asm |
| 11D3B8 | 11D3C8 | 10 | `src/data/front/movie_data.asm` | owner: front/movie/movie.asm |
| 11D3C8 | 11D7A0 | 3D8 | `src/data/front/settings_data.asm` | owner: front/settings/settings.asm |
| 11D7A0 | 11D92C | 18C | `src/data/front/pause_menu_data.asm` | owner: front/pause_menu/pause_menu.asm |
| 11D92C | 11DF80 | 654 | `src/data/front/controller_screen_data.asm` | owner: front/controller_screen/controller_screen.asm |
| 11DF80 | 11E280 | 300 | `src/data/pc/modem_setup_data.asm` | owner: pc/modem_setup/modem_setup.asm |
| 11E280 | 11E2C0 | 40 | `src/data/front/team_select_data.asm` | owner: front/team_select/team_select.asm |
| 11E2C0 | 11E2D4 | 14 | `src/data/front/lang_text_data.asm` | owner: front/lang_text/lang_text.asm |
| 11E2D4 | 11E39C | C8 | `src/data/front/new_season_data.asm` | owner: front/new_season/new_season.asm |
| 11E39C | 11E3A0 | 4 | `src/data/front/season_menu_data.asm` | owner: front/season_menu/season_menu.asm |
| 11E3A0 | 11E4B8 | 118 | `src/data/front/calendar_data.asm` | owner: front/calendar/calendar.asm |
| 11E4B8 | 11E5FC | 144 | `src/data/front/sim_game_data.asm` | owner: front/sim_game/sim_game.asm |
| 11E5FC | 11E674 | 78 | `src/data/front/stats_menu_data.asm` | owner: front/stats_menu/stats_menu.asm |
| 11E674 | 11E764 | F0 | `src/data/front/player_stats_data.asm` | owner: front/player_stats/player_stats.asm |
| 11E764 | 11E890 | 12C | `src/data/front/player_cards_data.asm` | owner: front/player_cards/player_cards.asm |
| 11E890 | 11E8D4 | 44 | `src/data/front/player_ratings_data.asm` | owner: front/player_ratings/player_ratings.asm |
| 11E8D4 | 11E91C | 48 | `src/data/front/roster_data.asm` | owner: front/roster/roster.asm |
| 11E91C | 11ED30 | 414 | `src/data/front/edit_lines_data.asm` | owner: front/edit_lines/edit_lines.asm |
| 11ED30 | 11ED38 | 8 | `src/data/front/ingame_menu_data.asm` | owner: front/ingame_menu/ingame_menu.asm |
| 11ED38 | 11ED78 | 40 | `src/data/pc/modem_teams_data.asm` | owner: pc/modem_teams/modem_teams.asm |
| 11ED78 | 11F568 | 7F0 | `src/data/front/playoff_data.asm` | owner: front/playoff/playoff.asm |
| 11F568 | 11F5DC | 74 | `src/data/lib/input/input_mouse_data_01.asm` | owner: lib/input/input_mouse.asm |
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
