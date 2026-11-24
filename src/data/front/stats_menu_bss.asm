; BSS of front/stats_menu (src/front/stats_menu).
bits 32
%include "hockey.inc"
section s_17DC74 nobits alloc noexec write align=1
extern PlayerStatsButtonArt
global StatsButtonArt, TeamStatsTabArt, TeamStatsTabLit, TeamStatsButtonPos
StatsButtonArt:                                 ; team stats screen button bitmaps, released and pressed; used
                                                ; by AnimateTeamStatsButton, AnimateTeamStatsButtons,
                                                ; TeamStatsScreen
        resb 4
        resb 4


global TeamStatsButtonBmps
global TeamStatsHeaderArt, TeamStatRows, TeamStatRowValues

global TeamStatColumns
global TeamStatSortColumn, PlayerStatsButtonArt
global TeamHomePoints, TeamPowerPlayPct, TeamPenaltyKillPct, TeamPoints, TeamRoadPoints, TeamPointsPct
        resb 4
        resb 180
TeamStatsTabArt:                                ; team stats tab bitmap per column pair; used by
                                                ; AnimateTeamStatsButton, AnimateTeamStatsButtons,
                                                ; CompareTeamStatRows ...
        resb 4
TeamStatsTabLit:                                ; team stats tab bitmap, highlighted; used by
                                                ; AnimateTeamStatsButton, AnimateTeamStatsButtons,
                                                ; CompareTeamStatRows ...
        resb 4
TeamStatsButtonPos:                             ; team stats button positions; used by TeamStatsScreen
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 12
        resb 4
        resb 4
TeamStatsButtonBmps:                            ; team stats button bitmaps built for the screen; used by
                                                ; TeamStatsScreen
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 356
TeamStatsHeaderArt:                             ; team stats column header bitmaps; used by
                                                ; AnimateTeamStatsButton, AnimateTeamStatsButtons,
                                                ; TeamStatsScreen
        resb 4
        resb 4
        resb 120
TeamStatRows:                                   ; team stats table rows (28h bytes per team); used by
                                                ; BuildTeamStatTables, DrawTeamStatsTable, DumpSaveTimes ...
        resb 4
        resb 4
        resb 4
        resb 4
TeamStatRowValues:                              ; stat values within each team stats row; used by
                                                ; BuildTeamStatTables, CompareTeamStatRows, DrawTeamStatsTable
                                                ; ...
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 988
TeamStatColumns:                                ; team stats column descriptors; used by BuildTeamStatTables,
                                                ; CompareTeamStatRows, DrawTeamStatsTable ...
        resb 16
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 1204
TeamHomePoints:                                 ; home points per team; used by BuildTeamStatTables,
                                                ; DumpSaveTimes
        resb 52
TeamPowerPlayPct:                               ; power play percentage per team (tenths); used by
                                                ; BuildTeamStatTables, DumpSaveTimes
        resb 52
TeamStatSortColumn:                             ; column the team stats table is sorted by; used by
                                                ; CompareTeamStatRows, DrawTeamStatsTable, ExportTeamStats ...
        resb 4
TeamPenaltyKillPct:                             ; penalty kill percentage per team (tenths); used by
                                                ; BuildTeamStatTables, DumpSaveTimes
        resb 52
TeamPoints:                                     ; points per team; used by BuildTeamStatTables, DumpSaveTimes
        resb 52
TeamRoadPoints:                                 ; road points per team; used by BuildTeamStatTables,
                                                ; DumpSaveTimes
        resb 52
TeamPointsPct:                                  ; points percentage per team (tenths); used by
                                                ; BuildTeamStatTables, DumpSaveTimes
        resb 52
