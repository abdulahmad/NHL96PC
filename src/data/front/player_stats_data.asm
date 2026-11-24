; Initialised data of front/player_stats (src/front/player_stats).
bits 32
%include "hockey.inc"
section s_11E674 progbits alloc noexec write align=1
extern str_FLM0, str_FLM1, str_FLM2, str_FLM3, str_FLM4, str_FLM5, str_FLM6, str_FLM7
global PlayerStatsGoalies, RosterPlayerIds, SkaterColTextIds, SkaterCardTextIds, GoalieColTextIds, GoalieCardTextIds, CardFlameFrames, TeamHasCompare
global CompareButtonDef, PlayerStatsSort, PlayerStatsSeason
PlayerStatsGoalies:                             ; player stats show goalies; used by ComparePlayerStatRows,
                                                ; CountPlayerStatRows, DrawPlayerStatsTable ...
        db 00h,00h,00h,00h
RosterPlayerIds:                                ; id of each roster player; used by EditLinesScreen,
                                                ; PlayerRatingsScreen, PlayerStatsScreen ...
        db 00h,00h,00h,00h
SkaterColTextIds:                               ; skater stats column text ids; used by DrawPlayerStatsTable,
                                                ; ExportPlayerStats
        db 0DAh,00h,00h,00h,0DBh,00h,00h,00h
SkaterCardTextIds:                              ; skater card stat text ids; used by DrawPlayerCardStats,
                                                ; DrawRatingsTitle, ExportPlayerCard
        db 0DCh,00h,00h,00h,0DDh,00h,00h,00h,0DEh,00h,00h,00h,0DFh,00h,00h,00h
        db 0E0h,00h,00h,00h,0E1h,00h,00h,00h,0E2h,00h,00h,00h,0E3h,00h,00h,00h
        db 0E4h,00h,00h,00h,0E5h,00h,00h,00h
GoalieColTextIds:                               ; goalie stats column text ids; used by DrawPlayerStatsTable,
                                                ; ExportPlayerStats
        db 0E6h,00h,00h,00h,0E7h,00h,00h,00h
GoalieCardTextIds:                              ; goalie card stat text ids; used by DrawPlayerCardStats,
                                                ; DrawRatingsTitle, ExportPlayerCard
        db 0E8h,00h,00h,00h,0E9h,00h,00h,00h,0EAh,00h,00h,00h,0EBh,00h,00h,00h
        db 0ECh,00h,00h,00h,0EDh,00h,00h,00h,0EEh,00h,00h,00h,0EFh,00h,00h,00h
        db 0F0h,00h,00h,00h,0F1h,00h,00h,00h,0F2h,00h,00h,00h
CardFlameFrames:                                ; flame animation frame names for the card title; used by
                                                ; ShowPlayerCardTitle, ShowPlayerStatsTitle
        dd str_FLM0
        dd str_FLM1
        dd str_FLM2
        dd str_FLM3
        dd str_FLM4
        dd str_FLM5
        dd str_FLM6
        dd str_FLM7
TeamHasCompare:                                 ; teams that have a compare button; used by PlayerStatsScreen
        db 01h,00h,00h,00h,01h,00h,01h,00h,00h,00h,00h,00h,01h,00h,00h,00h
        db 01h,01h,01h,01h,01h,00h,00h,01h,00h,00h
CompareButtonDef:                               ; compare button definition; used by PlayerStatsScreen
        db 026h,02h,00h,00h,046h,00h,00h,00h,076h,02h,00h,00h,046h,00h,00h,00h
        db 076h,02h,00h,00h,082h,00h,00h,00h,026h,02h,00h,00h,082h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
PlayerStatsSort:                                ; player stats sort column; used by PlayerStatsScreen
        db 00h,00h,00h,00h
PlayerStatsSeason:                              ; player stats show the season; used by PlayerStatsScreen
        db 00h,00h,00h,00h,00h,00h
