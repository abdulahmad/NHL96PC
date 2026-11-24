; Strings and constants of front/stats_menu (src/front/stats_menu), in link order.
bits 32
%include "hockey.inc"
section s_11253C progbits alloc noexec write align=1
global str_000, str_SEA2, str_PLY2, str_LEA, str_DIV, str_CON, str_WES, str_EAS
global str_PAC, str_NOR, str_CEN, str_ATL, str_Menupicks, str_Bkgd15, str_Pal20, str_SD2
global str_SEA0, str_CON0, str_WES0, str_PRN0, str_PRN1, str_PRN2, str_LGR0, str_LGR1
global str_LGR2, str_TEA0, str_TEA1, str_TEA2, str_AR30, str_AR31, str_AR20, str_AR21
global str_AR002, str_AR012, str_AR102, str_AR112, str_HED2, str_HED1, str_VERT, str_VBAL
global str_HORZ, str_HBAL, str_D5, str_D7, str_10002, str_03d, str_DDD4, str_DD2
global str_Wt2, str_S2, str_Space2, str_Punct_ExportTeamStats, str_dbgD, str_D8, str_DashExport, str_SavetimeOut
global str_D42, str_spDDDD, str_Punct_DumpSaveTimes, F64_0p1, str_TXT, str_FLM0, str_FLM1, str_FLM2
global str_FLM3, str_FLM4, str_FLM5, str_FLM6, str_FLM7, str_DEF, str_ALL, str_FOR
global str_GOL, str_PLR, str_PLY3, str_ROK, str_SEA3
str_000:                                        ; string '000'; used by TeamStatsColumnLabels
        db 030h,030h,030h,00h
str_SEA2:                                       ; string 'SEA'; used by TeamStatsColumnLabels
        db 053h,045h,041h,00h
str_PLY2:                                       ; string 'PLY'; used by TeamStatsColumnLabels
        db 050h,04Ch,059h,00h
str_LEA:                                        ; string 'LEA'; used by TeamStatsColumnLabels
        db 04Ch,045h,041h,00h
str_DIV:                                        ; string 'DIV'; used by TeamStatsColumnLabels
        db 044h,049h,056h,00h
str_CON:                                        ; string 'CON'; used by TeamStatsColumnLabels
        db 043h,04Fh,04Eh,00h
str_WES:                                        ; string 'WES'; used by TeamStatsColumnLabels
        db 057h,045h,053h,00h
str_EAS:                                        ; string 'EAS'; used by TeamStatsColumnLabels
        db 045h,041h,053h,00h
str_PAC:                                        ; string 'PAC'; used by TeamStatsColumnLabels
        db 050h,041h,043h,00h
str_NOR:                                        ; string 'NOR'; used by TeamStatsColumnLabels
        db 04Eh,04Fh,052h,00h
str_CEN:                                        ; string 'CEN'; used by TeamStatsColumnLabels
        db 043h,045h,04Eh,00h
str_ATL:                                        ; string 'ATL'; used by TeamStatsColumnLabels
        db 041h,054h,04Ch,00h
str_Menupicks:                                  ; string 'Menupicks'; used by TeamStatsScreen
        db 04Dh,065h,06Eh,075h,070h,069h,063h,06Bh,073h,00h
str_Bkgd15:                                     ; string 'bkgd'; used by DrawTeamStatsTable, TeamStatsScreen
        db 062h,06Bh,067h,064h,00h
str_Pal20:                                      ; string '!pal'; used by TeamStatsScreen
        db 021h,070h,061h,06Ch,00h
str_SD2:                                        ; string '%s%d'; used by TeamStatsScreen
        db 025h,073h,025h,064h,00h
str_SEA0:                                       ; string 'SEA0'; used by TeamStatsScreen
        db 053h,045h,041h,030h,00h
str_CON0:                                       ; string 'CON0'; used by TeamStatsScreen
        db 043h,04Fh,04Eh,030h,00h
str_WES0:                                       ; string 'WES0'; used by TeamStatsScreen
        db 057h,045h,053h,030h,00h
str_PRN0:                                       ; string 'PRN0'; used by TeamStatsScreen
        db 050h,052h,04Eh,030h,00h
str_PRN1:                                       ; string 'PRN1'; used by TeamStatsScreen
        db 050h,052h,04Eh,031h,00h
str_PRN2:                                       ; string 'PRN2'; used by TeamStatsScreen
        db 050h,052h,04Eh,032h,00h
str_LGR0:                                       ; string 'LGR0'; used by TeamStatsScreen
        db 04Ch,047h,052h,030h,00h
str_LGR1:                                       ; string 'LGR1'; used by TeamStatsScreen
        db 04Ch,047h,052h,031h,00h
str_LGR2:                                       ; string 'LGR2'; used by TeamStatsScreen
        db 04Ch,047h,052h,032h,00h
str_TEA0:                                       ; string 'TEA0'; used by TeamStatsScreen
        db 054h,045h,041h,030h,00h
str_TEA1:                                       ; string 'TEA1'; used by TeamStatsScreen
        db 054h,045h,041h,031h,00h
str_TEA2:                                       ; string 'TEA2'; used by TeamStatsScreen
        db 054h,045h,041h,032h,00h
str_AR30:                                       ; string 'AR30'; used by TeamStatsScreen
        db 041h,052h,033h,030h,00h
str_AR31:                                       ; string 'AR31'; used by TeamStatsScreen
        db 041h,052h,033h,031h,00h
str_AR20:                                       ; string 'AR20'; used by TeamStatsScreen
        db 041h,052h,032h,030h,00h
str_AR21:                                       ; string 'AR21'; used by TeamStatsScreen
        db 041h,052h,032h,031h,00h
str_AR002:                                      ; string 'AR00'; used by TeamStatsScreen
        db 041h,052h,030h,030h,00h
str_AR012:                                      ; string 'AR01'; used by TeamStatsScreen
        db 041h,052h,030h,031h,00h
str_AR102:                                      ; string 'AR10'; used by TeamStatsScreen
        db 041h,052h,031h,030h,00h
str_AR112:                                      ; string 'AR11'; used by TeamStatsScreen
        db 041h,052h,031h,031h,00h
str_HED2:                                       ; string 'HED2'; used by TeamStatsScreen
        db 048h,045h,044h,032h,00h
str_HED1:                                       ; string 'HED1'; used by TeamStatsScreen
        db 048h,045h,044h,031h,00h
str_VERT:                                       ; string 'VERT'; used by TeamStatsScreen
        db 056h,045h,052h,054h,00h
str_VBAL:                                       ; string 'VBAL'; used by TeamStatsScreen
        db 056h,042h,041h,04Ch,00h
str_HORZ:                                       ; string 'HORZ'; used by TeamStatsScreen
        db 048h,04Fh,052h,05Ah,00h
str_HBAL:                                       ; string 'HBAL'; used by TeamStatsScreen
        db 048h,042h,041h,04Ch,00h
str_D5:                                         ; string '%d.'; used by DrawTeamStatsTable, ExportTeamStats
        db 025h,064h,02Eh,00h
str_D7:                                         ; string '%d'; used by DrawTeamStatsTable
        db 025h,064h,00h
str_10002:                                      ; string '1.000'; used by DrawTeamStatsTable
        db 031h,02Eh,030h,030h,030h,00h
str_03d:                                        ; string '.%03d'; used by DrawTeamStatsTable
        db 02Eh,025h,030h,033h,064h,00h
str_DDD4:                                       ; string '%d-%d-%d'; used by DrawTeamStatsTable,
                                                ; ExportTeamStats
        db 025h,064h,02Dh,025h,064h,02Dh,025h,064h,00h
str_DD2:                                        ; string '%d.%d%%'; used by DrawTeamStatsTable,
                                                ; ExportTeamStats
        db 025h,064h,02Eh,025h,064h,025h,025h,00h
str_Wt2:                                        ; string 'wt'; used by DumpSaveTimes, ExportTeamStats
        db 077h,074h,00h
str_S2:                                         ; string '%s'; used by ExportTeamStats
        db 025h,073h,00h
str_Space2:                                     ; string ' '; used by ExportTeamStats
        db 020h,00h
str_Punct_ExportTeamStats:                      ; string "\n"; used by ExportTeamStats
        db 0Ah,00h
str_dbgD:                                       ; string '%d '; used by ExportTeamStats
        db 025h,064h,020h,00h
str_D8:                                         ; string '.%d '; used by ExportTeamStats
        db 02Eh,025h,064h,020h,00h
str_DashExport:                                 ; dash shown for a missing stat in the export; used by
                                                ; ExportTeamStats
        db 02Dh,00h
str_SavetimeOut:                                ; string 'savetime.out'; used by DumpSaveTimes
        db 073h,061h,076h,065h,074h,069h,06Dh,065h,02Eh,06Fh,075h,074h,00h
str_D42:                                        ; string '[%d][4] = {'; used by DumpSaveTimes
        db 05Bh,025h,064h,05Dh,05Bh,034h,05Dh,020h,03Dh,020h,07Bh,00h
str_spDDDD:                                     ; string ' {%d,%d,%d,%d}, '; used by DumpSaveTimes
        db 09h,09h,07Bh,025h,064h,02Ch,025h,064h,02Ch,025h,064h,02Ch,025h,064h,07Dh,02Ch
        db 0Ah,00h
str_Punct_DumpSaveTimes:                        ; string "};"; used by DumpSaveTimes
        db 07Dh,03Bh,00h
F64_0p1:                                        ; double constant 0.1; used by DumpSaveTimes
        db 09Ah,099h,099h,099h,099h,099h,0B9h,03Fh
str_TXT:                                        ; string '.TXT'; used by CheckExportName
        db 02Eh,054h,058h,054h,00h,00h
str_FLM0:                                       ; string 'FLM0'
        db 046h,04Ch,04Dh,030h,00h
str_FLM1:                                       ; string 'FLM1'
        db 046h,04Ch,04Dh,031h,00h
str_FLM2:                                       ; string 'FLM2'
        db 046h,04Ch,04Dh,032h,00h
str_FLM3:                                       ; string 'FLM3'
        db 046h,04Ch,04Dh,033h,00h
str_FLM4:                                       ; string 'FLM4'
        db 046h,04Ch,04Dh,034h,00h
str_FLM5:                                       ; string 'FLM5'
        db 046h,04Ch,04Dh,035h,00h
str_FLM6:                                       ; string 'FLM6'
        db 046h,04Ch,04Dh,036h,00h
str_FLM7:                                       ; string 'FLM7'
        db 046h,04Ch,04Dh,037h,00h
str_DEF:                                        ; string 'DEF'; used by PlayerStatsColumnLabels
        db 044h,045h,046h,00h
str_ALL:                                        ; string 'ALL'; used by PlayerStatsColumnLabels
        db 041h,04Ch,04Ch,00h
str_FOR:                                        ; string 'FOR'; used by PlayerStatsColumnLabels
        db 046h,04Fh,052h,00h
str_GOL:                                        ; string 'GOL'; used by PlayerStatsColumnLabels
        db 047h,04Fh,04Ch,00h
str_PLR:                                        ; string 'PLR'; used by PlayerStatsColumnLabels
        db 050h,04Ch,052h,00h
str_PLY3:                                       ; string 'PLY'; used by PlayerStatsColumnLabels
        db 050h,04Ch,059h,00h
str_ROK:                                        ; string 'ROK'; used by PlayerStatsColumnLabels
        db 052h,04Fh,04Bh,00h
str_SEA3:                                       ; string 'SEA'; used by PlayerStatsColumnLabels
        db 053h,045h,041h,00h
