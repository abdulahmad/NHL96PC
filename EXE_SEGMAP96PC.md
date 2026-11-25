# NHL 96 PC HOCKEY.EXE segment map

Generated from `src/segments.txt` (files, ranges and link order) with the notes of `segmap96pc.json` where the file is the same.
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

## cseg01 (262 segments)

| Start | End | Size | File | Note |
|---|---|---|---|---|
| 10000 | 10010 | 10 | `src/lib/watcom/watcom_begtext.asm` | Watcom ___begtext |
| 10010 | 122A6 | 2296 | `src/front/controls/controls.asm` |  |
| 122A6 | 1456D | 22C7 | `src/pc/modem_game/modem_game.asm` | Modem game session: open, connect and close a modem game, sync points, blocks, pad input exchange and the chat box (96 PC). |
| 1456D | 168DA | 236D | `src/front/postgame/postgame.asm` |  |
| 168DA | 17675 | D9B | `src/front/play_game/play_game.asm` | Playing a game: from the menus by game mode, the input record timer, the game loop, the demo game (95 PC front/main, 96 PC). |
| 17675 | 18E80 | 180B | `src/pc/link/link.asm` | Modem commands (AT) and the serial link protocol: packets, acks and resends, the link timer (96 PC). |
| 18E80 | 19382 | 502 | `src/front/team_ranks/team_ranks.asm` | Front-end main: start-up, async and CD streaming, text edit fields and screen helpers (to be split as they get named). |
| 19382 | 197ED | 46B | `src/front/name_index/name_index.asm` | NAMEINDEX files: the index of saved files in a directory (names, titles, ids) (96 PC). |
| 197ED | 1A04E | 861 | `src/front/edit_text/edit_text.asm` | Text entry field (96 PC). |
| 1A04E | 1B046 | FF8 | `src/front/message_box/message_box.asm` | Message boxes: with buttons, without, and with a progress bar (96 PC). |
| 1B046 | 1B807 | 7C1 | `src/front/main/main.asm` | Front-end main: main_, start-up and shut-down, the front-end screen loop, team logos (96 PC). |
| 1B807 | 1C627 | E20 | `src/pc/async/async.asm` | EA async file reader: request queue, read rate, timer (EA library, names from its debug messages). |
| 1C627 | 1D6C1 | 109A | `src/pc/cdstream/cdstream.asm` | EA CD stream: ring-buffered data streams off the CD (EA library, names from its debug messages). |
| 1D6C1 | 1DC65 | 5A4 | `src/front/game_setup/game_setup.asm` | Setting up a game: players at the start, SetupGame, SetupDemoGame, the game variables (95 PC front/main). |
| 1DC65 | 1E33C | 6D7 | `src/pc/file_io/file_io.asm` | DOS file helpers: open, create, close, read / write at an offset, copy, delete (96 PC). |
| 1E33C | 1E3C8 | 8C | `src/front/series/series.asm` | Playoff series: the Cup or a series clinched (96 PC). |
| 1E3C8 | 1EA14 | 64C | `src/pc/data_files/data_files.asm` | Game data files: their paths by id and directory, loading them (96 PC). |
| 1EA14 | 1F300 | 8EC | `src/front/stats_tables/stats_tables.asm` | The stats tables of the game mode: loading and freeing them (96 PC). |
| 1F300 | 201CD | ECD | `src/front/game_teams/game_teams.asm` | The teams of a game: rosters and lines from the mode's files, the end-of-game clean-up (96 PC). |
| 201CD | 21984 | 17B7 | `src/front/pad_setup/pad_setup.asm` |  |
| 21984 | 2A3D6 | 8A52 | `src/front/rink_model/rink_model.asm` | 3D rink: the ice and boards model, its textures and the software 3D renderer of the 96 rink view (96 PC; to be split as it gets named). |
| 2A3D6 | 2D9D9 | 3603 | `src/pc/users/users.asm` | User records: LOCAL.NDX of user names, the user record files, picking users for the controllers, the user records screen (96 PC). |
| 2D9D9 | 2F3DF | 1A06 | `src/engine/threestars/threestars.asm` |  |
| 2F3DF | 313D2 | 1FF3 | `src/engine/assign/assign.asm` | Skater assignments: box, bench, Stanley Cup skate, defence and wings (94G logic94). |
| 313D2 | 34300 | 2F2E | `src/engine/logic/logic.asm` | NHL95PC module (matched functions) |
| 34300 | 348C9 | 5C9 | `src/engine/puckcarrier/puckcarrier.asm` | Faceoff assignments: the faceoff and faceoff player assignments. |
| 348C9 | 3492A | 61 | `src/engine/puck/puck.asm` | Puck states: normal puck and no puck. |
| 3492A | 34D49 | 41F | `src/engine/linechange/linechange.asm` | Line changes: requests, modes and the faceoff line change. |
| 34D49 | 35149 | 400 | `src/engine/offsides/offsides.asm` | Offsides: offside and two-line pass checks, touch-up and puck flip. |
| 35149 | 36BF8 | 1AAF | `src/engine/referee/referee.asm` | Referee: moving to the dot, following play, whistle, signals and the drop. |
| 36BF8 | 36F55 | 35D | `src/engine/shootoutpath/shootoutpath.asm` | Shootout path: path points, starting the path and the penalty shooter. |
| 36F55 | 37ED0 | F7B | `src/engine/fight/fight.asm` | Fights: the hit check, fighting and watching the fight. |
| 37ED0 | 38070 | 1A0 | `src/engine/assignment_ring/assignment_ring.asm` | Assignment ring: replacing and pushing a player's assignment, and the extra attacker zone check. |
| 38070 | 3A7A4 | 2734 | `src/engine/input/input.asm` | NHL95PC module (matched functions) |
| 3A7A4 | 3E6EC | 3F48 | `src/engine/faceoff/faceoff.asm` | NHL95PC module (matched functions) |
| 3E6EC | 3F5E4 | EF8 | `src/engine/checking/checking.asm` | NHL95PC module (matched functions) |
| 3F5E4 | 41393 | 1DAF | `src/engine/pass/pass.asm` | Passing: pass lanes, choosing a receiver, pass modes and the pass itself; puck and body bumps. |
| 41393 | 41FDA | C47 | `src/engine/shoot/shoot.asm` | Shooting: picking the target, shooting or aiming, shot stats, two-line pass marks and injury types. |
| 41FDA | 43026 | 104C | `src/engine/bodycheck/bodycheck.asm` | Body checks: fall frames, net collisions, falling down and the check itself. |
| 43026 | 44B99 | 1B73 | `src/engine/puckphys/puckphys.asm` | Puck physics: puck against bodies, shadow, glue, goalie and stick contact, rebounds and shots. |
| 44B99 | 4629D | 1704 | `src/engine/collide/collide.asm` | Collisions: player, wall and goal collisions, and the fight check on a hard hit. |
| 4629D | 464A6 | 209 | `src/engine/goaliepull/goaliepull.asm` | Goalie pull: pulling the goalie late and returning goalies. |
| 464A6 | 465BA | 114 | `src/engine/chgplayer/chgplayer.asm` | Player switching: the controlled player. |
| 465BA | 4B7BB | 5201 | `src/engine/hockey/hockey.asm` | NHL95PC module (matched functions) |
| 4B7BB | 4DED8 | 271D | `src/engine/skate/skate.asm` | NHL95PC module (matched functions) |
| 4DED8 | 4F453 | 157B | `src/engine/savestate/savestate.asm` |  |
| 4F453 | 50154 | D01 | `src/engine/gamelog/gamelog.asm` | goal and penalty log lines; holds a matched NHL95PC gamelog function |
| 50154 | 51F18 | 1DC4 | `src/engine/penalty/penalty.asm` | NHL95PC module (matched functions) |
| 51F18 | 54519 | 2601 | `src/engine/lines/lines.asm` | NHL95PC module (matched functions) |
| 54519 | 584A0 | 3F87 | `src/front/replay_controls/replay_controls.asm` | replay control buttons (rew, play, fwd, camera); 95PC module name |
| 584A0 | 5D707 | 5267 | `src/front/game_view/game_view.asm` |  |
| 5D707 | 61AD1 | 43CA | `src/front/camera/camera.asm` | The game camera: its path polynomials and the camera shots (96 PC). |
| 61AD1 | 625F7 | B26 | `src/front/player_art/player_art.asm` | Player sprite art: the sprite banks (fight.ref, total.ref, oldshp.qfs, cup.ref), the UNPACK frame cache, team palettes, jersey colours and numbers (96 PC). |
| 625F7 | 62FD8 | 9E1 | `src/front/screen_art/screen_art.asm` | Front-end screen art: load and free it, team name images, the screen frame and its sliding bars (96 PC). |
| 62FD8 | 63968 | 990 | `src/front/intro/intro.asm` | The intro at start-up (screens and movies) and the slide shows, the credits at shut-down (96 PC). |
| 63968 | 64721 | DB9 | `src/front/draw/draw.asm` | Drawing helpers: palette fades, the graphics mode, bitmap copies, text in colours, boxes, colour remapping (96 PC). |
| 64721 | 67000 | 28DF | `src/front/menu/menu.asm` | Menus: the menu items, the menu input (mouse, pads, joysticks, keys) and its sounds, the menu loop (96 PC; still to be named). |
| 67000 | 689D1 | 19D1 | `src/front/speech/speech.asm` |  |
| 689D1 | 68D25 | 354 | `src/front/music/music.asm` | Music on the CD stream: queue, play, fade, stop and feed it (96 PC). |
| 68D25 | 69B1E | DF9 | `src/front/sound/sound.asm` | Digital sound effects, crowd noise, arena clips, the sound card start-up, the game and front-end sound banks and the sound idle call (96 PC). |
| 69B1E | 6A341 | 823 | `src/front/movie/movie.asm` | TGV movies: open the movie and its audio stream, decode and show the frames, play a movie file between screens (96 PC). |
| 6A341 | 6A7D3 | 492 | `src/front/settings/settings.asm` | GLOBAL.SET, the settings file SETUP writes, read at start and written back; the EXHIBIT.NDX start of the front-end menus (96 PC). |
| 6A7D3 | 6CF0D | 273A | `src/front/pause_menu/pause_menu.asm` | The in-game menu: RunInGameMenu and the pause menu screens of a game (96 PC; its routines still to be named). |
| 6CF0D | 711ED | 42E0 | `src/front/controller_screen/controller_screen.asm` | The controller screen before a game: which controller plays for which team, with the users' names (96 PC). |
| 711ED | 76071 | 4E84 | `src/pc/modem_setup/modem_setup.asm` | modem setup screens (Generic Hayes-Compatible, tone/pulse) |
| 76071 | 771F0 | 117F | `src/front/team_select/team_select.asm` | The exhibition team select screen: home and away team panels (logo, name, rank) (96 PC). |
| 771F0 | 77442 | 252 | `src/front/lang_text/lang_text.asm` | The language text: the Localize buffer, the text index and blocks, GetLangText (96 PC). |
| 77442 | 794FF | 20BD | `src/front/new_season/new_season.asm` | The new season: its set-up screen, creating the season files, the season and playoff database paths (96 PC). |
| 794FF | 7CCB8 | 37B9 | `src/front/season_menu/season_menu.asm` |  |
| 7CCB8 | 7D580 | 8C8 | `src/front/scroll_bar/scroll_bar.asm` | The scroll bar widget of the front-end lists (96 PC). |
| 7D580 | 7FF7F | 29FF | `src/front/calendar/calendar.asm` | Month Choice / Calendar Choices; 95PC module name |
| 7FF7F | 81EEA | 1F6B | `src/front/season_db/season_db.asm` |  |
| 81EEA | 849D5 | 2AEB | `src/front/sim_game/sim_game.asm` |  |
| 849D5 | 873AE | 29D9 | `src/front/pregame/pregame.asm` |  |
| 873AE | 884BD | 110F | `src/front/line_draw/line_draw.asm` | The 3D view's line drawer: the anti-alias colour table, clipping, fixed-point lines (96 PC). |
| 884BD | 8BF56 | 3A99 | `src/front/stats_menu/stats_menu.asm` | The stats menus: season and conference picks, leaders, stat tables, text export (96 PC; still being named). |
| 8BF56 | 903B5 | 445F | `src/front/player_stats/player_stats.asm` | The player stats screen: its rows, filters, sorting, drawing and text export (96 PC). |
| 903B5 | 93E6A | 3AB5 | `src/front/player_cards/player_cards.asm` | The player card screen: player profiles with their pictures and season stats, the league logos, text export (96 PC; still being named). |
| 93E6A | 971E9 | 337F | `src/front/player_ratings/player_ratings.asm` |  |
| 971E9 | 9CB19 | 5930 | `src/front/roster/roster.asm` |  |
| 9CB19 | A17D5 | 4CBC | `src/front/edit_lines/edit_lines.asm` | The edit lines screen and the automatic lines (96 PC). |
| A17D5 | A3851 | 207C | `src/front/ingame_menu/ingame_menu.asm` |  |
| A3851 | A4FD7 | 1786 | `src/pc/modem_teams/modem_teams.asm` | The modem / link game set-up from the main menu: team select and the steps to the game (96 PC). |
| A4FD7 | A9BC9 | 4BF2 | `src/front/playoff/playoff.asm` | PLAYOFF.NDX, series length buttons; 95PC module name |
| A9BC9 | A9CB3 | EA | `src/lib/watcom/watcom_searchenv.asm` | Watcom C runtime: _searchenv, the environment path search. |
| A9CB3 | AA5C4 | 911 | `src/lib/watcom/watcom_strcpy.asm` | NHL95PC module (matched functions) |
| AA5C4 | AA988 | 3C4 | `src/lib/ea/ea_timer.asm` | NHL95PC module (matched functions) |
| AA988 | AB834 | EAC | `src/lib/ea/ea_draw_shape_at_own_pos.asm` | NHL95PC module (matched functions) |
| AB834 | AC9F0 | 11BC | `src/lib/ea/ea_memman.asm` | NHL95PC module (matched functions) |
| AC9F0 | ACED8 | 4E8 | `src/lib/ea/ea_debug_printf.asm` | NHL95PC module (matched functions) |
| ACED8 | AD680 | 7A8 | `src/lib/ea/ea_debug_log.asm` | NHL95PC module (matched functions) |
| AD680 | ADC05 | 585 | `src/lib/ea/ea_fill_rect.asm` | NHL95PC module (matched functions) |
| ADC05 | ADC18 | 13 | `src/lib/watcom/watcom_mem_putc.asm` | Watcom C runtime: mem_putc_. |
| ADC18 | ADC48 | 30 | `src/lib/watcom/watcom_sprintf.asm` | NHL95PC module (matched functions) |
| ADC48 | AEE40 | 11F8 | `src/lib/ea/ea_unpack_huffman.asm` | EA library: UnpackHuffman. |
| AEE40 | B03F2 | 15B2 | `src/lib/ea/ea_unpack.asm` | NHL95PC module (matched functions) |
| B03F2 | B042C | 3A | `src/lib/watcom/watcom_get_rand_state.asm` | NHL95PC module (matched functions) |
| B042C | B1003 | BD7 | `src/lib/ea/ea_dos_file_info.asm` | EA library: DosFileInfo, LoadResourceBlockShared, LoadResourceData, LoadResourceDataShared, LoadFileData and 10 more. |
| B1003 | B1039 | 36 | `src/lib/watcom/watcom_dos_getdate.asm` | Watcom C runtime: _dos_getdate_, _dos_gettime_. |
| B1039 | B16C9 | 690 | `src/lib/serial/serial_configure.asm` | Serial port: SerialConfigure, SerialOpen, SerialClose, SerialCloseAll, SerialSetBaud and 16 more. |
| B16C9 | B1824 | 15B | `src/lib/watcom/watcom_strstr.asm` | Watcom C runtime: strstr_, atoi_, strlen_, strncmp_. |
| B1824 | B186C | 48 | `src/lib/serial/serial_link_crc16.asm` | Serial port: LinkCrc16. |
| B186C | B20CE | 862 | `src/lib/watcom/watcom_open.asm` | Watcom C runtime: open_, sopen_, __set_binary_, lseek_, read_ and 4 more. |
| B20CE | B2158 | 8A | `src/lib/ea/ea_open_art_archive_err.asm` | EA library: OpenArtArchiveErr, OpenArtArchive, LoadDataFileErr, LoadFileAllocQuiet. |
| B2158 | B2200 | A8 | `src/lib/ea/ea_window.asm` | NHL95PC module (matched functions) |
| B2200 | B22A1 | A1 | `src/lib/watcom/watcom_strcmp.asm` | NHL95PC module (matched functions) |
| B22A1 | B22E0 | 3F | `src/lib/ea/ea_save_file_block.asm` | EA library: SaveFileBlock. |
| B22E0 | B2B30 | 850 | `src/lib/ea/ea_save_data_file.asm` | NHL95PC module (matched functions) |
| B2B30 | B2C98 | 168 | `src/lib/ea/ea_draw_art_opaque.asm` | NHL95PC module (matched functions) |
| B2C98 | B2CD9 | 41 | `src/lib/watcom/watcom_printf.asm` | NHL95PC module (matched functions) |
| B2CD9 | B3145 | 46C | `src/lib/ea/ea_grab_largest_block.asm` | EA library: GrabLargestBlock, InitMemoryPool, InitMemoryPoolDefault, SetupMemoryPool. |
| B3145 | B31BE | 79 | `src/lib/input/input_num_lock_off.asm` | Input: NumLockOff, InstallHotkeys. |
| B31BE | B32D4 | 116 | `src/lib/ea/ea_nearest_colour.asm` | EA library: NearestColour. |
| B32D4 | B3358 | 84 | `src/lib/watcom/watcom_detect_cpu.asm` | Watcom C runtime: DetectCPU. |
| B3358 | B6305 | 2FAD | `src/lib/ea/ea_build_aa_pal_lut.asm` | EA library: BuildAaPalLut, CreateAaPalLut, BuildPaletteShadeTable, AaSetFull, AaSetHalf and 13 more. |
| B6305 | B65DD | 2D8 | `src/lib/watcom/watcom_start.asm` | Watcom C runtime: start, WriteConsoleMessage, RestoreDS. |
| B65DD | B6991 | 3B4 | `src/lib/cd/cd_open_file.asm` | CD-ROM: CdOpenFile, CdOpenStream, CdHandleEntry, CdCloseFile, CdReadSectors and 3 more. |
| B6991 | B69B6 | 25 | `src/lib/watcom/watcom_strncpy.asm` | Watcom C runtime: strncpy_. |
| B69B6 | B71A6 | 7F0 | `src/lib/cd/cd_find_file.asm` | CD-ROM: CdFindFile, DriveLetterIndex, IsCdDrive, AllocCdBuffer, DetectMscdex and 4 more. |
| B71A6 | B7301 | 15B | `src/lib/watcom/watcom_dos_close.asm` | Watcom C runtime: _dos_close_, _dos_commit_, _dos_open_, DosFindFirst, DosFindNext and 9 more. |
| B7301 | B73CA | C9 | `src/lib/ea/ea_open_resource_archive.asm` | EA library: OpenResourceArchive, GetResourceArchiveName. |
| B73CA | B7410 | 46 | `src/lib/watcom/watcom_stricmp.asm` | Watcom C runtime: stricmp_. |
| B7410 | B75A0 | 190 | `src/lib/ea/ea_read_file_cached_into.asm` | NHL95PC module (matched functions) |
| B75A0 | B78B8 | 318 | `src/lib/ea/ea_read_file_range.asm` | NHL95PC module (matched functions) |
| B78B8 | BA3D0 | 2B18 | `src/lib/ori3d/ori_set_rink_view.asm` | 3D library: SetRinkView, TransformRinkPoints, TransformRinkObject, ProjectRinkObject, FillTexturePoly and 43 more. |
| BA3D0 | BB603 | 1233 | `src/lib/ori3d/ori_project_point_list.asm` | NHL95PC module (matched functions) |
| BB603 | BB9C2 | 3BF | `src/lib/ea/ea_blit_art_scaled.asm` | EA library: BlitArtScaled, DrawArtScaled, DrawArtScaledHotspot. |
| BB9C2 | BC73C | D7A | `src/lib/ori3d/ori_transform_vector.asm` | 3D library: TransformVector, MultiplyMatrix, ProjectPointsPersp, DrawPolyList, SetRinkMatrix and 19 more. |
| BC73C | BC759 | 1D | `src/lib/watcom/watcom_chp.asm` | NHL95PC module (matched functions) |
| BC759 | BE8BE | 2165 | `src/lib/ori3d/ori_find_group.asm` | 3D library: OriFindGroup, OriFindPartition, OriGetPartition, ShadedPolyStepEdge, ShadedSpansLeftClipped and 18 more. |
| BE8BE | BE8C5 | 7 | `src/lib/watcom/watcom_init387_emulator.asm` | Watcom C runtime: Init387Emulator. |
| BE8C5 | BE926 | 61 | `src/lib/watcom/watcom_fini387_emulator.asm` | NHL95PC module (matched functions) |
| BE926 | BE939 | 13 | `src/lib/ori3d/ori_fixed_inverse.asm` | 3D library: FixedInverse. |
| BE939 | BE95D | 24 | `src/lib/watcom/watcom_fprintf.asm` | Watcom C runtime: fprintf_. |
| BE95D | BEA22 | C5 | `src/lib/ori3d/ori_int_sqrt.asm` | 3D library: IntSqrt. |
| BEA22 | BEAE4 | C2 | `src/lib/ea/ea_sort_indices.asm` | EA library: SortIndices. |
| BEAE4 | BEC24 | 140 | `src/lib/ori3d/ori_build_persp_table.asm` | 3D library: BuildPerspTable, ProjectPointWide. |
| BEC24 | BF02C | 408 | `src/lib/ea/ea_scale_art_remap_rows.asm` | EA library: ScaleArtRemapRows, DrawArtScaledRemap, FlipArtHorizontal. |
| BF02C | BF070 | 44 | `src/lib/ea/ea_sound_hl.asm` | NHL95PC module (matched functions) |
| BF070 | BF113 | A3 | `src/lib/watcom/watcom_stosb.asm` | NHL95PC module (matched functions) |
| BF113 | BF2F5 | 1E2 | `src/lib/ea/ea_draw_art_fast.asm` | EA library: DrawArtFast, FindShapeListQuiet, FindShapeList. |
| BF2F5 | BF534 | 23F | `src/lib/video/video_vesa_get_info.asm` | Video: VesaGetInfo, VesaGetModeInfo. |
| BF534 | BF949 | 415 | `src/lib/ea/ea_vesa_init.asm` | NHL95PC module (matched functions) |
| BF949 | BF950 | 7 | `src/lib/watcom/watcom_abs.asm` | NHL95PC module (matched functions) |
| BF950 | C1883 | 1F33 | `src/lib/sound/snd_speech_queue_service.asm` | Sound: SpeechQueueService, ClearSpeechSlot, ResetSpeechQueue, OpenSpeechQueue, SetSpeechQueueVolume and 58 more. |
| C1883 | C2440 | BBD | `src/lib/ea/ea_tgv_build_huff_table.asm` | TGV movie decoder: BuildHuffTable, DecodeHuffRuns, TgvDecodeDeltaFrame, TgvDecodeKeyFrame, TgvAllocDecoder and 6 more. |
| C2440 | C2444 | 4 | `src/lib/ea/ea_disable_interrupts.asm` | EA library: DisableInterrupts, EnableInterrupts. |
| C2444 | C24CE | 8A | `src/lib/watcom/watcom_getcwd.asm` | Watcom C runtime: getcwd_. |
| C24CE | C26F9 | 22B | `src/lib/ea/ea_copy_row_keyed.asm` | EA library: CopyRowKeyed, DrawArtKeyed, DrawArtKeyedAtOrigin, PutBlockKeyed. |
| C26F9 | C27A2 | A9 | `src/lib/watcom/watcom_utoa.asm` | Watcom C runtime: utoa_, itoa_, memcmp_. |
| C27A2 | C27F8 | 56 | `src/lib/ea/ea_print_screen_int.asm` | EA library: PrintScreenInt. |
| C27F8 | C2CB0 | 4B8 | `src/lib/ea/ea_kbd_exit.asm` | NHL95PC module (matched functions) |
| C2CB0 | C31C4 | 514 | `src/lib/watcom/watcom_errno_ptr.asm` | NHL95PC module (matched functions) |
| C31C4 | C3724 | 560 | `src/lib/dos4gw/dos4gw_free_dpmiblocks.asm` | NHL95PC module (matched functions) |
| C3724 | C3727 | 3 | `src/lib/ea/ea_mcga_window.asm` | NHL95PC module (matched functions) |
| C3727 | C39C2 | 29B | `src/lib/watcom/watcom_ioalloc.asm` | NHL95PC module (matched functions) |
| C39C2 | C3A21 | 5F | `src/lib/dos4gw/dos4gw_dos_setvect.asm` | NHL95PC module (matched functions) |
| C3A21 | C3BE0 | 1BF | `src/lib/ea/ea_draw_shape_opaque.asm` | EA library: DrawShapeOpaqueHot, DrawShapeOpaque, ResetMemLock. |
| C3BE0 | C3C22 | 42 | `src/lib/ea/ea_mem_lock.asm` | NHL95PC module (matched functions) |
| C3C22 | C3CC0 | 9E | `src/lib/watcom/watcom_vsprintf.asm` | Watcom C runtime: vsprintf_, VfprintfThunk, fputs_. |
| C3CC0 | C3E38 | 178 | `src/lib/ea/ea_fill_row_table.asm` | NHL95PC module (matched functions) |
| C3E38 | C40B4 | 27C | `src/lib/ea/ea_fill_rect_spans.asm` | NHL95PC module (matched functions) |
| C40B4 | C4AFA | A46 | `src/lib/watcom/watcom_prtf.asm` | NHL95PC module (matched functions) |
| C4AFA | C4DE0 | 2E6 | `src/lib/ea/ea_ref_pack_size.asm` | EA library: RefPackSize, GetPalette, ArtBitDepth, PixelToRgb. |
| C4DE0 | C4EA1 | C1 | `src/lib/ea/ea_load_file_cached.asm` | NHL95PC module (matched functions) |
| C4EA1 | C4F9B | FA | `src/lib/watcom/watcom_isatty.asm` | NHL95PC module (matched functions) |
| C4F9B | C511A | 17F | `src/lib/ea/ea_draw_ellipse.asm` | EA library: DrawEllipse, DrawEllipseClipped. |
| C511A | C53E5 | 2CB | `src/lib/watcom/watcom_file_putc.asm` | Watcom C runtime: file_putc_, __fprtf_, _nexpand_, __HeapManager_expand_, _nmsize_. |
| C53E5 | C540B | 26 | `src/lib/dos4gw/dos4gw_int386.asm` | DOS/4GW: int386_. |
| C540B | C59DF | 5D4 | `src/lib/input/input_joystick_calibrate_screen.asm` | Input: JoystickCalibrateScreen. |
| C59DF | C59F8 | 19 | `src/lib/ea/ea_show_keyboard_on.asm` | EA library: ShowKeyboardOn. |
| C59F8 | C5AE3 | EB | `src/lib/watcom/watcom_cmain.asm` | Watcom C runtime: __CMain, __InitRtns, __FiniRtns, FpuHookStub. |
| C5AE3 | C5D56 | 273 | `src/lib/ea/ea_shutdown_system.asm` | EA library: ShutdownSystem, InitSystem, PrintBoxedText. |
| C5D56 | C5FFD | 2A7 | `src/lib/cd/cd_dir_search.asm` | CD-ROM: CdDirSearch. |
| C5FFD | C6011 | 14 | `src/lib/ea/ea_to_upper_char.asm` | EA library: ToUpperChar. |
| C6011 | C6052 | 41 | `src/lib/dos4gw/dos4gw_segread.asm` | DOS/4GW: segread_, int386x_. |
| C6052 | C6084 | 32 | `src/lib/watcom/watcom_doserror.asm` | Watcom C runtime: __doserror_, unlink_. |
| C6084 | C6591 | 50D | `src/lib/ea/ea_big_file_type.asm` | EA library: BigFileType, LocateBigEntry, LocateBigData, LocateBigs, WalkBigFile. |
| C6591 | C9CF8 | 3767 | `src/lib/ori3d/ori_poly_cross_product.asm` | 3D library: PolyCrossProduct, RasterMappedTriangle, DrawMappedTriangle, RasterMappedTriangleShadow, DrawMappedTriangleShadow and 10 more. |
| C9CF8 | C9D4F | 57 | `src/lib/watcom/watcom_strnicmp.asm` | Watcom C runtime: strnicmp_. |
| C9D4F | C9E68 | 119 | `src/lib/ori3d/ori_vec_length3.asm` | 3D library: VecLength3, NormalizeVec3. |
| C9E68 | C9FB7 | 14F | `src/lib/watcom/watcom_mul32_to64.asm` | Watcom C runtime: Mul32To64, Div64By32, Sar64, Shl64, min_. |
| C9FB7 | CA6AF | 6F8 | `src/lib/ori3d/ori_fill_span_list.asm` | 3D library: FillSpanList, BuildSpanOffsets, RemapSpanList, OriApplyMorph, OriRotateY and 1 more. |
| CA6AF | CA6E0 | 31 | `src/lib/watcom/watcom_sys_init_387_emulator.asm` | Watcom C runtime: __sys_init_387_emulator. |
| CA6E0 | CA835 | 155 | `src/lib/ea/ea_snap.asm` | NHL95PC module (matched functions) |
| CA835 | CAA80 | 24B | `src/lib/watcom/watcom_sys_fini_387_emulator.asm` | NHL95PC module (matched functions) |
| CAA80 | CE06B | 35EB | `src/lib/sound/snd_play_sample_on_channel.asm` | Sound: PlaySampleOnChannel, FreeBankMemory, UpdateChannelGain, ResetMixChannel, SetMixerMode and 26 more. |
| CE06B | CFDF1 | 1D86 | `src/lib/sound/snd_soundblaster.asm` | NHL95PC module (matched functions) |
| CFDF1 | CFE12 | 21 | `src/lib/watcom/watcom_set_efgfmt.asm` | NHL95PC module (matched functions) |
| CFE12 | CFEA7 | 95 | `src/lib/ea/ea_print_centred_boxed.asm` | EA library: PrintCentredBoxed, ResetClipRect, ResetClipWindow. |
| CFEA7 | D002F | 188 | `src/lib/watcom/watcom_memset.asm` | Watcom C runtime: memset_, __InitFiles_, __full_io_exit_, fcloseall_, docloseall_ and 1 more. |
| D002F | D01B0 | 181 | `src/lib/dos4gw/dos4gw_sbrk.asm` | NHL95PC module (matched functions) |
| D01B0 | D01B5 | 5 | `src/lib/watcom/watcom_flushall.asm` | Watcom C runtime: flushall_. |
| D01B5 | D0360 | 1AB | `src/lib/watcom/watcom_flushall_getche.asm` | NHL95PC module (matched functions) |
| D0360 | D0692 | 332 | `src/lib/ea/ea_split_file_ext.asm` | NHL95PC module (matched functions) |
| D0692 | D069B | 9 | `src/lib/sound/snd_pcspeaker.asm` | NHL95PC module (matched functions) |
| D069B | D06A6 | B | `src/lib/watcom/watcom_common_init.asm` | NHL95PC module (matched functions) |
| D06A6 | D07FC | 156 | `src/lib/video/video_is_text_mode_width.asm` | Video: IsTextModeWidth, SaveTextScreen, RestoreTextScreen. |
| D07FC | D1366 | B6A | `src/lib/input/input_pointer_on_target.asm` | Input: PointerOnTarget, DrawPointer, UpdatePointerPos, HidePointerKeep, HidePointer and 7 more. |
| D1366 | D142B | C5 | `src/lib/ea/ea_draw_text_boxed_at.asm` | EA library: DrawTextBoxedAt. |
| D142B | D1474 | 49 | `src/lib/watcom/watcom_save_stack_segment.asm` | Watcom C runtime: SaveStackSegment, __CHK, __GRO, __STK. |
| D1474 | D14D1 | 5D | `src/lib/dos4gw/dos4gw_int386x.asm` | DOS/4GW: __int386x_, IntrLoadSegRegs. |
| D14D1 | D1555 | 84 | `src/lib/dos4gw/dos4gw_do_intr.asm` | NHL95PC module (matched functions) |
| D1555 | D243E | EE9 | `src/lib/ori3d/ori_build_edge_table_min.asm` | 3D library: BuildEdgeTableMin, BuildEdgeTableMax, BuildFixedTableMin, BuildFixedTableMax, MapPolySpans and 3 more. |
| D243E | D284C | 40E | `src/lib/dos4gw/dos4gw_int7_pl3.asm` | DOS/4GW: __int7_pl3, __int7_X32VM, __int7. |
| D284C | D59DB | 318F | `src/lib/watcom/watcom_emu387.asm` | NHL95PC module (matched functions) |
| D59DB | D6120 | 745 | `src/lib/sound/snd_hw_sb.asm` | NHL95PC module (matched functions) |
| D6120 | D79CC | 18AC | `src/lib/sound/snd_gus_get_env_config.asm` | NHL95PC module (matched functions) |
| D79CC | D7A42 | 76 | `src/lib/sound/snd_sb_isr_auto_init.asm` | NHL95PC module (matched functions) |
| D7A42 | D7AD5 | 93 | `src/lib/ea/ea_blit_block_remap_keyed.asm` | EA library: BlitBlockRemapKeyed. |
| D7AD5 | D7BB2 | DD | `src/lib/watcom/watcom_efg_format.asm` | Watcom C runtime: _EFG_Format_. |
| D7BB2 | D7D43 | 191 | `src/lib/watcom/watcom_forcedecpt.asm` | NHL95PC module (matched functions) |
| D7D43 | D7DB0 | 6D | `src/lib/ea/ea_put_bytes_le.asm` | EA library: PutBytesLE. |
| D7DB0 | DA5AF | 27FF | `src/lib/ea/ea_debug_get_key.asm` | NHL95PC module (matched functions) |
| DA5AF | DA5D0 | 21 | `src/lib/watcom/watcom_outp.asm` | NHL95PC module (matched functions) |
| DA5D0 | DB131 | B61 | `src/lib/sound/snd_gus_setup_dma_channel.asm` | NHL95PC module (matched functions) |
| DB131 | DB13A | 9 | `src/lib/watcom/watcom_inpw.asm` | Watcom C runtime: inpw_. |
| DB13A | DB1A7 | 6D | `src/lib/sound/snd_gus_run_init_table.asm` | Sound: GusRunInitTable. |
| DB1A7 | DB1B2 | B | `src/lib/watcom/watcom_outpw.asm` | Watcom C runtime: outpw_. |
| DB1B2 | DB9F4 | 842 | `src/lib/sound/snd_gus_peek.asm` | Sound: GusPeek, GusPoke, GusPokeFill, GusTestDramBank, GusInitPlayDma and 5 more. |
| DB9F4 | DB9FA | 6 | `src/lib/watcom/watcom_set_max_prec.asm` | Watcom C runtime: _SetMaxPrec_. |
| DB9FA | DBF61 | 567 | `src/lib/watcom/watcom_do_eformat.asm` | NHL95PC module (matched functions) |
| DBF61 | DBFA8 | 47 | `src/lib/dos4gw/dos4gw_enter_wvideo.asm` | DOS/4GW: __EnterWVIDEO_. |
| DBFA8 | DCBB0 | C08 | `src/lib/ea/ea_unpackf_blit.asm` | NHL95PC module (matched functions) |
| DCBB0 | DCC25 | 75 | `src/lib/sound/snd_gus_convert_addr16.asm` | NHL95PC module (matched functions) |
| DCC25 | DD120 | 4FB | `src/lib/watcom/watcom_nan_inf.asm` | NHL95PC module (matched functions) |
| DD120 | DD32B | 20B | `src/lib/ea/ea_draw_art_shadow.asm` | EA library: DrawArtShadow, FlipArtVertical, TranslateArtPixels. |
| DD32B | DD57B | 250 | `src/lib/watcom/watcom_modf.asm` | Watcom C runtime: modf_, __CmpBigInt, __Rnd2Int, __Bin2String, BigIntCallHook and 2 more. |
| DD57B | DD6C4 | 149 | `src/lib/ea/ea_copy_row_shadow.asm` | EA library: CopyRowShadow. |
| DD6C4 | DD6DE | 1A | `src/lib/ea/ea_set_screen_target.asm` | NHL95PC module (matched functions) |
| DD6DE | DD705 | 27 | `src/lib/video/video_get_palette_range.asm` | Video: GetPaletteRange. |
| DD705 | DD7B8 | B3 | `src/lib/ea/ea_set_draw_bitmap.asm` | EA library: SetDrawBitmap, FillRectColor, SetClipWindow. |
| DD7B8 | DD8AD | F5 | `src/lib/video/video_set_palette_entries.asm` | Video: SetPaletteEntries, SetTextMode, SetPaletteEntries8, ReadPaletteEntries8. |
| DD8AD | DDE72 | 5C5 | `src/lib/ea/ea_set_remap_table.asm` | EA library: SetRemapTable, GetRemapTable, SetColourRemap, GetColourRemap, SetBlitSource and 7 more. |
| DDE72 | DE084 | 212 | `src/lib/video/video_read_port_stable.asm` | Video: ReadPortStable, WaitRetrace, WaitRetraceEdges, WaitDisplayRetrace, SetCrtcStart and 3 more. |
| DE084 | DE3D8 | 354 | `src/lib/ea/ea_set_clip_rect.asm` | NHL95PC module (matched functions) |
| DE3D8 | DE4A0 | C8 | `src/lib/video/video_vesa_set_bank.asm` | Video: VesaSetBank, VesaSetBankBody, VesaSetMode, VgaSetModeTwice. |
| DE4A0 | DF55B | 10BB | `src/lib/ea/ea_blit_block.asm` | EA library: BlitBlockHot, BlitBlock, BlitBlockXor, BlitBlockAnd, AndPixel and 15 more. |
| DF55B | DF5BD | 62 | `src/lib/video/video_save_video_state.asm` | Video: SaveVideoState, RestoreVideoState. |
| DF5BD | DF8AC | 2EF | `src/lib/ea/ea_unpack_art_rle.asm` | EA library: UnpackArtRle, BlitBlockShadow, CopyRowShadowFast. |
| DF8AC | DFC33 | 387 | `src/lib/input/input_mouse.asm` | NHL95PC module (matched functions) |
| DFC33 | DFEB4 | 281 | `src/lib/input/input_remove_keyboard_handler.asm` | NHL95PC module (matched functions) |
| DFEB4 | E04CE | 61A | `src/lib/input/input_get_ticks.asm` | NHL95PC module (matched functions) |
| E04CE | E0520 | 52 | `src/lib/ea/ea_add_exit_handler.asm` | EA library: AddExitHandler, ExitProgram, FindShape, FindShapeQuiet. |
| E0520 | E0584 | 64 | `src/lib/watcom/watcom_bcopy.asm` | Watcom C runtime: bcopy. |
| E0584 | E05DA | 56 | `src/lib/ea/ea_clear_clip_rect.asm` | EA library: ClearClipRect. |
| E05DA | E0658 | 7E | `src/lib/input/input_install_break_handler.asm` | Input: InstallBreakHandler, RemoveBreakHandler. |
| E0658 | E0834 | 1DC | `src/lib/ea/ea_dos_call_split_dx.asm` | NHL95PC module (matched functions) |
| E0834 | E0898 | 64 | `src/lib/ea/ea_fatal_error.asm` | NHL95PC module (matched functions) |
| E0898 | E0948 | B0 | `src/lib/watcom/watcom_random32.asm` | NHL95PC module (matched functions) |
| E0948 | E1824 | EDC | `src/lib/ori3d/ori_fill_polygon.asm` | 3D library: FillPolygonBlend, FillPolygon, FillPolygonArgs, FillPolygonCore, FillBandEdges and 15 more. |
| E1824 | E1927 | 103 | `src/lib/ea/ea_fill_mem.asm` | NHL95PC module (matched functions) |
| E1927 | E193C | 15 | `src/lib/input/input_poll_hotkeys.asm` | Input: PollHotkeys. |
| E193C | E1970 | 34 | `src/lib/ea/ea_save_draw_state.asm` | NHL95PC module (matched functions) |
| E1970 | E19F0 | 80 | `src/lib/ea/ea_find_first_file.asm` | NHL95PC module (matched functions) |
| E19F0 | E22DB | 8EB | `src/lib/ea/ea_setup_rect_fill_blend.asm` | NHL95PC module (matched functions) |
| E22DB | E2436 | 15B | `src/lib/input/input_dispatch_hotkey.asm` | Input: DispatchHotkey, SetHotkey. |
| E2436 | E2484 | 4E | `src/lib/watcom/watcom_printf_save_regs.asm` | Watcom C runtime: PrintfSaveRegs. |
| E2484 | E25DE | 15A | `src/lib/video/video_save_text_mode.asm` | Video: SaveTextMode, RestoreTextMode. |
| E25DE | E2729 | 14B | `src/lib/ea/ea_angle_from_delta.asm` | EA library: AngleFromDelta, SinLookup, CosLookup, DebugLineCount. |
| E2729 | E2823 | FA | `src/lib/input/input_read_key_pad_bits.asm` | Input: ReadKeyPadBits. |
| E2823 | E28A0 | 7D | `src/lib/ea/ea_sin_cos_lookup.asm` | EA library: SinCosLookup. |

## cseg02 (1 segments)

| Start | End | Size | File | Note |
|---|---|---|---|---|
| F0000 | F0034 | 34 | `src/lib/sound/snd_sb_real_mode_isr.asm` |  |

## dseg03 (1 segments)

| Start | End | Size | File | Note |
|---|---|---|---|---|
| 100000 | 100018 | 18 | `src/data/lib/sound/snd_sb_dma_ports.asm` |  |

## dseg04 (231 segments)

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
| 1177F4 | 117938 | 144 | `src/data/engine/faceoff_data_01.asm` |  |
| 117938 | 117A9C | 164 | `src/data/engine/penalty_data_01.asm` | owner: engine/penalty/penalty.asm |
| 117A9C | 118E82 | 13E6 | `src/data/engine/frames.asm` | owner: engine/hockey/hockey.asm |
| 118E82 | 11918B | 309 | `src/data/engine/hockey_data_01.asm` | owner: engine/hockey/hockey.asm |
| 11918B | 119D08 | B7D | `src/data/engine/savestate_data_01.asm` |  |
| 119D08 | 119E44 | 13C | `src/data/engine/threestars_data_01.asm` |  |
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
| 11F5DC | 11F708 | 12C | `src/data/lib/input/input_remove_keyboard_handler_data_01.asm` |  |
| 11F708 | 11F8DC | 1D4 | `src/data/lib/input/input_remove_keyboard_handler_data_02.asm` |  |
| 11F8DC | 11FD54 | 478 | `src/data/lib/input/input_get_ticks_data_01.asm` |  |
| 11FD54 | 1210D0 | 137C | `src/data/lib/serial/serial_configure_data_01.asm` |  |
| 1210D0 | 121B38 | A68 | `src/data/lib/input/input_install_break_handler_data_01.asm` |  |
| 121B38 | 1222C8 | 790 | `src/data/lib/cd/cd_open_file_data_01.asm` |  |
| 1222C8 | 1228D6 | 60E | `src/data/lib/watcom/watcom_random32_data_01.asm` |  |
| 1228D6 | 123A94 | 11BE | `src/data/lib/ea/ea_blit_block_data_01.asm` |  |
| 123A94 | 123BB0 | 11C | `src/data/lib/ori3d/ori_fill_polygon_data_01.asm` |  |
| 123BB0 | 123DA4 | 1F4 | `src/data/lib/sound/snd_speech_queue_service_data_02.asm` |  |
| 123DA4 | 124020 | 27C | `src/data/lib/ea/ea_fill_mem_data_01.asm` |  |
| 124020 | 124124 | 104 | `src/data/lib/ea/ea_find_first_file_data_01.asm` |  |
| 124124 | 124244 | 120 | `src/data/lib/watcom/watcom_isatty_data_01.asm` |  |
| 124244 | 1248DC | 698 | `src/data/lib/sound/snd_speech_queue_service_data_03.asm` |  |
| 1248DC | 14F01C | 2A740 | `src/data/lib/sound/snd_play_sample_on_channel_data_01.asm` |  |
| 14F01C | 14FAC0 | AA4 | `src/data/lib/sound/snd_soundblaster_data_02.asm` | owner: lib/sound/snd_soundblaster.asm |
| 14FAC0 | 14FBF4 | 134 | `src/data/lib/input/input_read_key_pad_bits_data_01.asm` |  |
| 14FBF4 | 1512F0 | 16FC | `src/data/lib/watcom/watcom_emu387_data_01.asm` | owner: lib/watcom/watcom_emu387.asm |
| 1512F0 | 151418 | 128 | `src/data/lib/sound/snd_hw_sb_data_01.asm` | owner: lib/sound/snd_hw_sb.asm |
| 151418 | 151598 | 180 | `src/data/lib/sound/snd_gus_get_env_config_data_01.asm` |  |
| 151598 | 15179C | 204 | `src/data/front/controls_bss.asm` | owner: front/controls/controls.asm |
| 15179C | 151AE4 | 348 | `src/data/pc/modem_game_bss.asm` | owner: pc/modem_game/modem_game.asm |
| 151AE4 | 151B80 | 9C | `src/data/front/postgame_bss.asm` | owner: front/postgame/postgame.asm |
| 151B80 | 151B87 | 7 | `src/data/front/play_game_bss.asm` | owner: front/play_game/play_game.asm |
| 151B87 | 152A6C | EE5 | `src/data/pc/link_bss.asm` | owner: pc/link/link.asm |
| 152A6C | 152B3C | D0 | `src/data/front/team_ranks_bss.asm` | owner: front/team_ranks/team_ranks.asm |
| 152B3C | 152C44 | 108 | `src/data/front/message_box_bss.asm` | owner: front/message_box/message_box.asm |
| 152C44 | 152F60 | 31C | `src/data/front/main_bss.asm` | owner: front/main/main.asm |
| 152F60 | 152FD8 | 78 | `src/data/pc/async_bss.asm` | owner: pc/async/async.asm |
| 152FD8 | 152FE8 | 10 | `src/data/pc/cdstream_bss.asm` | owner: pc/cdstream/cdstream.asm |
| 152FE8 | 158CBA | 5CD2 | `src/data/front/game_teams_bss.asm` | owner: front/game_teams/game_teams.asm |
| 158CBA | 158D78 | BE | `src/data/front/pad_setup_bss.asm` | owner: front/pad_setup/pad_setup.asm |
| 158D78 | 15EA0C | 5C94 | `src/data/front/rink_model_bss.asm` | owner: front/rink_model/rink_model.asm |
| 15EA0C | 164F1C | 6510 | `src/data/pc/users_bss_01.asm` |  |
| 164F1C | 165366 | 44A | `src/data/front/replay_controls_bss_01.asm` | owner: front/replay_controls/replay_controls.asm |
| 165366 | 1656DE | 378 | `src/data/front/game_view_bss_01.asm` |  |
| 1656DE | 16583E | 160 | `src/data/engine/hockey_bss_02.asm` |  |
| 16583E | 165953 | 115 | `src/data/engine/hockey_bss_01.asm` | owner: engine/hockey/hockey.asm |
| 165953 | 176B68 | 11215 | `src/data/engine/faceoff_bss_01.asm` | owner: engine/faceoff/faceoff.asm |
| 176B68 | 176CA8 | 140 | `src/data/front/main_bss_02.asm` | owner: front/main/main.asm |
| 176CA8 | 17710C | 464 | `src/data/engine/lines_bss.asm` | owner: engine/lines/lines.asm |
| 17710C | 17828C | 1180 | `src/data/front/replay_controls_bss.asm` | owner: front/replay_controls/replay_controls.asm |
| 17828C | 179CBC | 1A30 | `src/data/front/game_view_bss.asm` | owner: front/game_view/game_view.asm |
| 179CBC | 179E48 | 18C | `src/data/front/camera_bss.asm` | owner: front/camera/camera.asm |
| 179E48 | 17BA7C | 1C34 | `src/data/front/player_art_bss.asm` | owner: front/player_art/player_art.asm |
| 17BA7C | 17BDD4 | 358 | `src/data/front/screen_art_bss.asm` | owner: front/screen_art/screen_art.asm |
| 17BDD4 | 17BDE0 | C | `src/data/front/intro_bss.asm` | owner: front/intro/intro.asm |
| 17BDE0 | 17C3E4 | 604 | `src/data/front/draw_bss.asm` | owner: front/draw/draw.asm |
| 17C3E4 | 17C49C | B8 | `src/data/front/menu_bss.asm` | owner: front/menu/menu.asm |
| 17C49C | 17C644 | 1A8 | `src/data/front/speech_bss.asm` | owner: front/speech/speech.asm |
| 17C644 | 17C9A0 | 35C | `src/data/front/movie_bss.asm` | owner: front/movie/movie.asm |
| 17C9A0 | 17C9AA | A | `src/data/front/settings_bss.asm` | owner: front/settings/settings.asm |
| 17C9AA | 17CECD | 523 | `src/data/pc/modem_setup_bss_01.asm` |  |
| 17CECD | 17D166 | 299 | `src/data/front/playoff_bss_03.asm` |  |
| 17D166 | 17D4E8 | 382 | `src/data/front/playoff_bss_01.asm` | owner: front/playoff/playoff.asm |
| 17D4E8 | 17D560 | 78 | `src/data/front/pause_menu_bss.asm` | owner: front/pause_menu/pause_menu.asm |
| 17D560 | 17D590 | 30 | `src/data/front/controller_screen_bss.asm` | owner: front/controller_screen/controller_screen.asm |
| 17D590 | 17D688 | F8 | `src/data/pc/modem_setup_bss.asm` | owner: pc/modem_setup/modem_setup.asm |
| 17D688 | 17D694 | C | `src/data/front/team_select_bss.asm` | owner: front/team_select/team_select.asm |
| 17D694 | 17D6C8 | 34 | `src/data/front/lang_text_bss.asm` | owner: front/lang_text/lang_text.asm |
| 17D6C8 | 17D7CC | 104 | `src/data/front/new_season_bss.asm` | owner: front/new_season/new_season.asm |
| 17D7CC | 17D7D4 | 8 | `src/data/front/season_menu_bss.asm` | owner: front/season_menu/season_menu.asm |
| 17D7D4 | 17D928 | 154 | `src/data/front/calendar_bss.asm` | owner: front/calendar/calendar.asm |
| 17D928 | 17DB7C | 254 | `src/data/front/sim_game_bss.asm` | owner: front/sim_game/sim_game.asm |
| 17DB7C | 17DC18 | 9C | `src/data/front/pregame_bss.asm` | owner: front/pregame/pregame.asm |
| 17DC18 | 17DC74 | 5C | `src/data/front/line_draw_bss.asm` | owner: front/line_draw/line_draw.asm |
| 17DC74 | 17E9D0 | D5C | `src/data/front/stats_menu_bss.asm` | owner: front/stats_menu/stats_menu.asm |
| 17E9D0 | 1820F4 | 3724 | `src/data/front/player_stats_bss.asm` | owner: front/player_stats/player_stats.asm |
| 1820F4 | 182128 | 34 | `src/data/front/player_cards_bss.asm` | owner: front/player_cards/player_cards.asm |
| 182128 | 1821B4 | 8C | `src/data/front/player_ratings_bss.asm` | owner: front/player_ratings/player_ratings.asm |
| 1821B4 | 183028 | E74 | `src/data/front/roster_bss.asm` | owner: front/roster/roster.asm |
| 183028 | 1843F8 | 13D0 | `src/data/front/edit_lines_bss.asm` | owner: front/edit_lines/edit_lines.asm |
| 1843F8 | 1846F0 | 2F8 | `src/data/front/ingame_menu_bss.asm` | owner: front/ingame_menu/ingame_menu.asm |
| 1846F0 | 1846FC | C | `src/data/pc/modem_teams_bss.asm` | owner: pc/modem_teams/modem_teams.asm |
| 1846FC | 184B38 | 43C | `src/data/front/playoff_bss.asm` | owner: front/playoff/playoff.asm |
| 184B38 | 185740 | C08 | `src/data/lib/ea/ea_memman_bss_01.asm` |  |
| 185740 | 185C4C | 50C | `src/data/lib/ea/ea_dos_file_info_bss_01.asm` |  |
| 185C4C | 190E90 | B244 | `src/data/lib/ea/ea_build_aa_pal_lut_bss_01.asm` |  |
| 190E90 | 191AB0 | C20 | `src/data/lib/ori3d/ori_set_rink_view_bss_01.asm` |  |
| 191AB0 | 1983E0 | 6930 | `src/data/lib/ori3d/ori_project_point_list_bss_01.asm` |  |
| 1983E0 | 19B654 | 3274 | `src/data/lib/ori3d/ori_find_group_bss_01.asm` |  |
| 19B654 | 19B760 | 10C | `src/data/lib/sound/snd_speech_queue_service_bss_01.asm` |  |
| 19B760 | 1A0FB0 | 5850 | `src/data/lib/sound/snd_speech_queue_service_bss_02.asm` |  |
| 1A0FB0 | 1A10B0 | 100 | `src/data/lib/sound/snd_soundblaster_bss_01.asm` | owner: lib/sound/snd_soundblaster.asm |
| 1A10B0 | 1A11BC | 10C | `src/data/lib/input/input_pointer_on_target_bss_01.asm` |  |
| 1A11BC | 1A9260 | 80A4 | `src/data/lib/ea/ea_debug_get_key_bss_01.asm` |  |
