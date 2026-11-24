; BSS of front/game_teams (src/front/game_teams).
bits 32
%include "hockey.inc"
section s_152FE8 nobits alloc noexec write align=1
global curperiod, SpriteArtPtrs, SpriteFrameArt, hmplstats, awplstats, hmroster, hmrosterflags, hmrosterpos
global RosterStatsBase, awroster, AttractResetFlag, hmglstats, awglstats, hmglattr, awglattr, hmplattr
global awplattr, awlinetab, hmteamrec, awteamrec, hmlinetab, UnusedStateByte, UnusedStateFlag, UnusedStateMode
global pad2dev, pad1dev, GameExtraBlock, DataFilePath
curperiod:                                      ; used by ClockTick, DrawGameFrame, InGameMenu ...
        resb 4
SpriteArtPtrs:                                  ; art pointer for each sprite frame; used by DrawBenchPlayers,
                                                ; DrawControlMarker, DrawGameFrame ...
        resb 484
SpriteFrameArt:                                 ; art for each player sprite frame; used by DrawPlayerShadows,
                                                ; DrawPlayers, PlaceGoalNets
        resb 15516
hmplstats:                                      ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 2
        resb 2
        resb 2
        resb 2
        resb 2
        resb 2
        resb 2
        resb 386
awplstats:                                      ; Away skater game stats; used by LoadGameState,
                                                ; WatchHighlight, clearteams
        resb 362
        resb 38
hmroster:                                       ; used by BuildDefaultLines, BuildEventLines, CanFillLineSlot
                                                ; ...
        resb 5
hmrosterflags:                                  ; flags byte in each home roster entry; used by
                                                ; BuildEventLines, DrawPlayerNamePanel, DrawRosterNumber ...
        resb 1
hmrosterpos:                                    ; used by CanFillLineSlot, EditLinesScreen, FillDressedSlots
                                                ; ...
        resb 1
        resb 32
RosterStatsBase:                                ; roster player stat words, indexed by team and player; used
                                                ; by FillTeamRoster, PostGoalEvent, PostPenaltyEvent ...
        resb 1165
awroster:                                       ; Away roster; used by LoadGameRosters, LoadGameState,
                                                ; clearteams
        resb 1204
AttractResetFlag:                               ; flag cleared when an attract or menu game starts; used by
                                                ; PlayMenuGame, RunAttractMode
        resb 4
hmglstats:                                      ; Home goalie game stats (clearteams: hmtmglstats); used by
                                                ; InitGameTeams, LoadGameState, PickThreeStars ...
        resb 2
        resb 2
        resb 4
        resb 6
        resb 4
awglstats:                                      ; Away goalie game stats; used by LoadGameState, clearteams
        resb 18
hmglattr:                                       ; Home goalie attributes (clearteams: hmtmglattr); used by
                                                ; AutoSetLines, FillTeamRoster, LoadGameState ...
        resb 51
awglattr:                                       ; Away goalie attributes; used by LoadGameState, clearteams
        resb 51
hmplattr:                                       ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 19
        resb 506
awplattr:                                       ; Away skater attributes (clearteams: awtmplattr); used by
                                                ; Endfaceoff, LoadGameState, clearteams
        resb 19
        resb 506
awlinetab:                                      ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 54
        resb 8
hmteamrec:                                      ; Home team record (clearteams: hmtmteamrec); used by
                                                ; DrawPlayerPctPanel, DrawScorePanel, DrawTimeLeftPanel ...
        resb 30
        resb 69
        resb 100
        resb 12
        resb 584
awteamrec:                                      ; Away team record; used by DrawScorePanel, DrawTimeLeftPanel,
                                                ; LoadGameRosters ...
        resb 30
        resb 181
        resb 584
hmlinetab:                                      ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 54
        resb 8
UnusedStateByte:                                ; saved and restored with the game state, otherwise unused;
                                                ; used by LoadGameState, SaveGameState
        resb 1
UnusedStateFlag:                                ; saved and restored with the game state, otherwise unused;
                                                ; used by LoadGameState, SaveGameState
        resb 1
UnusedStateMode:                                ; saved and restored with the game state, otherwise unused;
                                                ; used by LoadGameState, SaveGameState
        resb 1
pad2dev:                                        ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 1
pad1dev:                                        ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 2
GameExtraBlock:                                 ; extra memory block freed when a game ends; used by
                                                ; EndGameCleanup
        resb 4
DataFilePath:                                   ; data file path buffer; used by LoadArtArchiveFile,
                                                ; LoadDataFile, LoadDataFileHandle ...
        resb 1634
