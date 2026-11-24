; Initialised data of front/stats_tables (src/front/stats_tables).
bits 32
%include "hockey.inc"
section s_1174E0 progbits alloc noexec write align=1
global seasondb, CareerDb, statsfromleague, TeamDb, statsplayoffs, AttributeDb, PlayerAttrFile, LeagueRecordsFile
global SeasonDbSize, CareerDbSize, LeagueStatsSize, TeamDbSize, PlayoffStatsSize, AttributeDbSize, PlayerAttrFileSize, LeagueRecordsSize
global str_Punct_PlayerDbRecord
seasondb:                                       ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h,00h,00h,00h
CareerDb:                                       ; career stats database; used by CareerDbRecord,
                                                ; CreatePlayerScreen, FreeStatsTables ...
        db 00h,00h,00h,00h
statsfromleague:                                ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h,00h,00h,00h
TeamDb:                                         ; team stats database; used by ApplyDayResults,
                                                ; ApplyPlayoffDayResults, BuildPlayerStatRows ...
        db 00h,00h,00h,00h
statsplayoffs:                                  ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h,00h,00h,00h
AttributeDb:                                    ; attribute database; used by AttributeDbRecord,
                                                ; CreatePlayerScreen, FreeStatsTables ...
        db 00h,00h,00h,00h
PlayerAttrFile:                                 ; player attribute data file; used by FreeStatsTables,
                                                ; LoadExhibitionStats, LoadSeasonStats ...
        db 00h,00h,00h,00h
LeagueRecordsFile:                              ; league records data file; used by FreeStatsTables,
                                                ; LeagueRecordsRecord, LoadExhibitionStats ...
        db 00h,00h,00h,00h
SeasonDbSize:                                   ; season database size; used by ApplyDayResults,
                                                ; ApplyPlayoffDayResults, FreeStatsTables ...
        db 00h,00h,00h,00h
CareerDbSize:                                   ; career database size; used by CreatePlayerScreen,
                                                ; FreeStatsTables, LoadExhibitionStats ...
        db 00h,00h,00h,00h
LeagueStatsSize:                                ; league stats size; used by FreeStatsTables,
                                                ; LoadExhibitionStats, LoadModemStats ...
        db 00h,00h,00h,00h
TeamDbSize:                                     ; team database size; used by CreatePlayerScreen,
                                                ; FreeStatsTables, LoadExhibitionStats ...
        db 00h,00h,00h,00h
PlayoffStatsSize:                               ; playoff stats size; used by ApplyPlayoffDayResults,
                                                ; FreeStatsTables, LoadExhibitionStats ...
        db 00h,00h,00h,00h
AttributeDbSize:                                ; attribute database size; used by CreatePlayerScreen,
                                                ; FreeStatsTables, LoadExhibitionStats ...
        db 00h,00h,00h,00h
PlayerAttrFileSize:                             ; player attribute file size; used by FreeStatsTables,
                                                ; LoadExhibitionStats, LoadSeasonStats ...
        db 00h,00h,00h,00h
LeagueRecordsSize:                              ; league records file size; used by FreeStatsTables,
                                                ; LoadExhibitionStats, LoadModemStats ...
        db 00h,00h,00h,00h,02Eh,00h
str_Punct_PlayerDbRecord:                       ; string " "; used by PlayerDbRecord
        db 020h,00h,0Ch,015h,00h,00h,025h,073h,02Eh,064h,062h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,025h,073h,02Eh,064h,062h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h
