; Strings and constants of front/season_db (src/front/season_db), in link order.
bits 32
%include "hockey.inc"
section s_1123D0 progbits alloc noexec write align=1
global str_05dCNZDB, str_S05dCNZDB
str_05dCNZDB:                                   ; string '%05d%cNZ.DB'; used by UpdateTeamDbs
        db 025h,030h,035h,064h,025h,063h,04Eh,05Ah,02Eh,044h,042h,00h
str_S05dCNZDB:                                  ; string '%s%05d%cNZ.DB'; used by SaveSeasonTeams,
                                                ; SimSeasonGames
        db 025h,073h,025h,030h,035h,064h,025h,063h,04Eh,05Ah,02Eh,044h,042h,00h,00h,00h
