; Initialised data of front/stats_menu (src/front/stats_menu).
bits 32
%include "hockey.inc"
section s_11E5FC progbits alloc noexec write align=1
global TeamMovieTextIds, TeamStatTextIds, TeamStatsPlayoffs, StatsMenuItems, StatsMenuChoice, RosterDbPtrs
TeamMovieTextIds:                               ; text ids for team movies; used by GetTeamMovieText,
                                                ; PlayTeamMovie
        db 0F5h,00h,0D9h,01h,05Ah,01h,0E3h,00h,079h,02h,09Ch,02h,08Eh,00h,027h,01h
        db 094h,01h,0B5h,01h,073h,02h,0Bh,00h,021h,02h,05Ah,02h,07Fh,02h,061h,01h
        db 02Ch,00h,0C0h,00h,074h,00h,072h,00h
TeamStatTextIds:                                ; team stats column text ids; used by DrawTeamStatsTable,
                                                ; ExportTeamStats
        db 01h,01h,00h,00h,02h,01h,00h,00h,03h,01h,00h,00h,04h,01h,00h,00h
        db 05h,01h,00h,00h,06h,01h,00h,00h,07h,01h,00h,00h,08h,01h,00h,00h
        db 09h,01h,00h,00h,0Ah,01h,00h,00h,0Bh,01h,00h,00h,0Ch,01h,00h,00h
        db 0Dh,01h,00h,00h,0Eh,01h,00h,00h,0Fh,01h,00h,00h,010h,01h,00h,00h
TeamStatsPlayoffs:                              ; team stats show the playoffs; used by TeamStatsScreen
        db 00h,00h,00h,00h
StatsMenuItems:                                 ; stats menu items; used by TeamStatsScreen
        db 04h,00h,00h,00h
StatsMenuChoice:                                ; stats menu choice; used by TeamStatsScreen
        db 00h,00h,00h,00h
RosterDbPtrs:                                   ; roster database pointers; used by DrawPlayerCardStats,
                                                ; DrawRatingBars, EditLinesScreen ...
        db 00h,00h,00h,00h
