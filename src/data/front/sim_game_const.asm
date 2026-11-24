; Strings and constants of front/sim_game (src/front/sim_game), in link order.
bits 32
%include "hockey.inc"
section s_1123EC progbits alloc noexec write align=1
global str_Pk, str_Ps, tag_pset, str_Pblank, str_Pgblank, str_Tmstats, str_Tmgstats, str_Tmdata
global str_Aps, tag_apset, str_Gk, str_Gs, tag_gset, str_Ags, tag_agset, str_Tset
global str_GSUMMARYDB, F64_0p333333, F64_0p75, F64_0p0119048, F64_0p0166667, F64_0p8, F64_10, F64_1000
str_Pk:                                         ; string 'pk'; used by SimulateGame
        db 070h,06Bh,00h
str_Ps:                                         ; string 'ps'; used by SimulateGame
        db 070h,073h,00h
tag_pset:                                       ; used by SimulateGame
        db 070h,073h,065h,074h,00h
str_Pblank:                                     ; string 'pblank'; used by SimulateGame
        db 070h,062h,06Ch,061h,06Eh,06Bh,00h
str_Pgblank:                                    ; string 'pgblank'; used by SimulateGame
        db 070h,067h,062h,06Ch,061h,06Eh,06Bh,00h
str_Tmstats:                                    ; string 'tmstats'; used by SimulateGame
        db 074h,06Dh,073h,074h,061h,074h,073h,00h
str_Tmgstats:                                   ; string 'tmgstats'; used by SimulateGame
        db 074h,06Dh,067h,073h,074h,061h,074h,073h,00h
str_Tmdata:                                     ; string 'tmdata'; used by SimulateGame
        db 074h,06Dh,064h,061h,074h,061h,00h
str_Aps:                                        ; string 'aps'; used by SimulateGame
        db 061h,070h,073h,00h
tag_apset:                                      ; used by SimulateGame
        db 061h,070h,073h,065h,074h,00h
str_Gk:                                         ; string "gk"; used by SimulateGame
        db 067h,06Bh,00h
str_Gs:                                         ; string "gs"; used by SimulateGame
        db 067h,073h,00h
tag_gset:                                       ; used by SimulateGame
        db 067h,073h,065h,074h,00h
str_Ags:                                        ; string "ags"; used by SimulateGame
        db 061h,067h,073h,00h
tag_agset:                                      ; used by SimulateGame
        db 061h,067h,073h,065h,074h,00h
str_Tset:                                       ; string 'tset'; used by SimulateGame
        db 074h,073h,065h,074h,00h
str_GSUMMARYDB:                                 ; string 'GSUMMARY.DB'; used by SimulateGame
        db 047h,053h,055h,04Dh,04Dh,041h,052h,059h,02Eh,044h,042h,00h
F64_0p333333:                                   ; double constant 0.333333; used by SimulateGame
        db 055h,055h,055h,055h,055h,055h,0D5h,03Fh
F64_0p75:                                       ; double constant 0.75; used by SimulateGame
        db 00h,00h,00h,00h,00h,00h,0E8h,03Fh
F64_0p0119048:                                  ; double constant 0.0119048; used by SimulateGame
        db 018h,086h,061h,018h,086h,061h,088h,03Fh
F64_0p0166667:                                  ; double constant 0.0166667; used by SimulateGame
        db 011h,011h,011h,011h,011h,011h,091h,03Fh
F64_0p8:                                        ; double constant 0.8; used by SimulateGame
        db 09Ah,099h,099h,099h,099h,099h,0E9h,03Fh
F64_10:                                         ; double constant 10; used by SimulateGame
        db 00h,00h,00h,00h,00h,00h,024h,040h
F64_1000:                                       ; double constant 1000; used by SimulateGame
        db 00h,00h,00h,00h,00h,040h,08Fh,040h,00h,00h
