; Strings and constants of engine/savestate (src/engine/savestate), in link order.
bits 32
%include "hockey.inc"
section s_110DA4 progbits alloc noexec write align=1
global str_05d, str_CsgDb, str_05dCsg, str_DB
str_05d:                                        ; string '%05d'; used by DeleteSeasonDb, DeleteSeasonFiles,
                                                ; ReadPlayoffDbHeader ...
        db 025h,030h,035h,064h,00h
str_CsgDb:                                      ; string '%csg.db'; used by DeleteSeasonDb, DeleteSeasonFiles,
                                                ; ReadPlayoffDbHeader ...
        db 025h,063h,073h,067h,02Eh,064h,062h,00h
str_05dCsg:                                     ; string '%05d%csg'; used by DeleteSeasonFiles
        db 025h,030h,035h,064h,025h,063h,073h,067h,00h
str_DB:                                         ; string 'DB'; used by DeleteSeasonFiles
        db 044h,042h,00h,00h,00h,00h
