; Initialised data of front/new_season (src/front/new_season).
bits 32
%include "hockey.inc"
section s_11E2D4 progbits alloc noexec write align=1
extern str_ATT2, str_CAR, str_CRT, str_INC, str_KEY, str_PLY, str_SCH, str_SEA
extern str_SET, str_TEM, str_TRD
global SixTeamColX, SixTeamRowY, SevenTeamColX, SevenTeamRowY, SixTeamGrid, SevenTeamGrid, SeasonDbExts
SixTeamColX:                                    ; team column x positions for a six team division; used by
                                                ; DrawSeasonTeams
        db 032h,00h,00h,00h,0B0h,00h,00h,00h,02Eh,01h,00h,00h,032h,00h,00h,00h
        db 0B0h,00h,00h,00h,02Eh,01h,00h,00h
SixTeamRowY:                                    ; team row y positions for a six team division; used by
                                                ; DrawSeasonTeams
        db 02h,00h,00h,00h,02h,00h,00h,00h,02h,00h,00h,00h,078h,00h,00h,00h
        db 078h,00h,00h,00h,078h,00h,00h,00h
SevenTeamColX:                                  ; team column x positions for a seven team division; used by
                                                ; DrawSeasonTeams
        db 04h,00h,00h,00h,073h,00h,00h,00h,0E2h,00h,00h,00h,065h,01h,00h,00h
        db 032h,00h,00h,00h,0B0h,00h,00h,00h,02Eh,01h,00h,00h
SevenTeamRowY:                                  ; team row y positions for a seven team division; used by
                                                ; DrawSeasonTeams
        db 02h,00h,00h,00h,02h,00h,00h,00h,02h,00h,00h,00h,02h,00h,00h,00h
        db 078h,00h,00h,00h,078h,00h,00h,00h,078h,00h,00h,00h
SixTeamGrid:                                    ; team grid for a six team division; used by DrawSeasonTeams
        db 063h,03h,063h,01h,063h,04h,00h,02h,063h,05h,01h,063h,00h,063h,063h,04h
        db 01h,063h,03h,05h,02h,063h,04h,063h
SevenTeamGrid:                                  ; team grid for a seven team division; used by DrawSeasonTeams
        db 063h,04h,063h,01h,063h,05h,00h,02h,063h,06h,01h,03h,063h,06h,02h,063h
        db 01h,063h,063h,05h,02h,063h,04h,06h,03h,063h,05h,063h
SeasonDbExts:                                   ; season database file extensions; used by MakePlayoffDbPath,
                                                ; MakeSeasonDbPath
        dd str_KEY
        dd str_CAR
        dd str_ATT2
        dd str_CRT
        dd str_TEM
        dd str_SEA
        dd str_SCH
        dd str_SET
        dd str_INC
        dd str_TRD
        dd str_PLY
