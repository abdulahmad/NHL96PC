; Strings and constants of front/roster (src/front/roster), in link order.
bits 32
%include "hockey.inc"
section s_112B28 progbits alloc noexec write align=1
global str_StatDBPTRs2, str_DBPTRs2, str_Player2, str_FName2, str_LName2, str_Profiles2, str_HeightNWeight2, str_FREEAGNTDB
global str_FreeAgents, str_Pal26, str_Bkgd19, str_S33, str_Ball5, str_S4, str_S12, str_S23
global str_Fre1, str_Fre2, str_Fre3, str_Cre1, str_Cre2, str_Cre3, str_Arl1, str_Arl2
global str_Arl3, str_Arr1, str_Arr2, str_Arr3, str_Tra12, str_Tra22, str_Tra32, str_Com1
global str_Com2, str_Com3, str_Def1, str_Def2, str_Def3, str_El11, str_El12, str_El13
global str_El21, str_El22, str_El23, str_S3up2, str_S3ug2, str_S3dw2, str_S3dg2, str_S4up
global str_S4ug, str_S4dw, str_S4dg, str_S1up2, str_S1ug2, str_S1dw2, str_S1dg2, str_S2up2
global str_S2ug2, str_S2dw2, str_S2dg2, str_TraD, str_RosterSort, str_LFRE, str_C2dCS, str_SGID
global str_SD6, str_GOL0, str_NME0, str_NME1, str_NME2, str_NUM0, str_NUM1, str_NUM2
global str_SS4, str_D12, F32_0p001, F32_0p0208333, F32_0p00333333, F32_390, F32_0p005, F32_100
global F32_neg50, F32_0p002, F32_0p0111111, F32_0p1, F32_0p0142857, F32_0p0333333, F32_58, F32_90
global F32_0p01, F64_0p9, F64_0p1_CreatePlayerRatings, F32_347
str_StatDBPTRs2:                                ; string 'StatDBPTRs'; used by RunRosterScreens
        db 053h,074h,061h,074h,044h,042h,050h,054h,052h,073h,00h
str_DBPTRs2:                                    ; string 'DBPTRs'; used by RunRosterScreens
        db 044h,042h,050h,054h,052h,073h,00h
str_Player2:                                    ; string 'Player #'; used by RunRosterScreens
        db 050h,06Ch,061h,079h,065h,072h,020h,023h,00h
str_FName2:                                     ; string 'FName'; used by RunRosterScreens
        db 046h,04Eh,061h,06Dh,065h,00h
str_LName2:                                     ; string 'LName'; used by RunRosterScreens
        db 04Ch,04Eh,061h,06Dh,065h,00h
str_Profiles2:                                  ; string 'Profiles'; used by RunRosterScreens
        db 050h,072h,06Fh,066h,069h,06Ch,065h,073h,00h
str_HeightNWeight2:                             ; string 'Height 'n' Weight'; used by RunRosterScreens
        db 048h,065h,069h,067h,068h,074h,020h,027h,06Eh,027h,020h,057h,065h,069h,067h,068h
        db 074h,00h
str_FREEAGNTDB:                                 ; string 'FREEAGNT.DB'; used by RosterScreen
        db 046h,052h,045h,045h,041h,047h,04Eh,054h,02Eh,044h,042h,00h
str_FreeAgents:                                 ; string 'free agents'; used by RosterScreen
        db 066h,072h,065h,065h,020h,061h,067h,065h,06Eh,074h,073h,00h
str_Pal26:                                      ; string '!pal'; used by CreatePlayerScreen, RosterScreen
        db 021h,070h,061h,06Ch,00h
str_Bkgd19:                                     ; string 'bkgd'; used by CreatePlayerScreen,
                                                ; DrawCreatePlayerRow, DrawRosterPlayerInfo ...
        db 062h,06Bh,067h,064h,00h
str_S33:                                        ; string 's3__'; used by RosterScreen
        db 073h,033h,05Fh,05Fh,00h
str_Ball5:                                      ; string 'ball'; used by DrawRosterTeams, RosterScreen
        db 062h,061h,06Ch,06Ch,00h
str_S4:                                         ; string 's4__'; used by RosterScreen
        db 073h,034h,05Fh,05Fh,00h
str_S12:                                        ; string 's1__'; used by DrawRosterTeams, RosterScreen
        db 073h,031h,05Fh,05Fh,00h
str_S23:                                        ; string 's2__'; used by DrawRosterTeams, RosterScreen
        db 073h,032h,05Fh,05Fh,00h
str_Fre1:                                       ; string 'fre1'; used by RosterScreen
        db 066h,072h,065h,031h,00h
str_Fre2:                                       ; string 'fre2'; used by RosterScreen
        db 066h,072h,065h,032h,00h
str_Fre3:                                       ; string 'fre3'; used by RosterScreen
        db 066h,072h,065h,033h,00h
str_Cre1:                                       ; string 'cre1'; used by RosterScreen
        db 063h,072h,065h,031h,00h
str_Cre2:                                       ; string 'cre2'; used by RosterScreen
        db 063h,072h,065h,032h,00h
str_Cre3:                                       ; string 'cre3'; used by RosterScreen
        db 063h,072h,065h,033h,00h
str_Arl1:                                       ; string 'arl1'; used by RosterScreen
        db 061h,072h,06Ch,031h,00h
str_Arl2:                                       ; string 'arl2'; used by RosterScreen
        db 061h,072h,06Ch,032h,00h
str_Arl3:                                       ; string 'arl3'; used by RosterScreen
        db 061h,072h,06Ch,033h,00h
str_Arr1:                                       ; string 'arr1'; used by RosterScreen
        db 061h,072h,072h,031h,00h
str_Arr2:                                       ; string 'arr2'; used by RosterScreen
        db 061h,072h,072h,032h,00h
str_Arr3:                                       ; string 'arr3'; used by RosterScreen
        db 061h,072h,072h,033h,00h
str_Tra12:                                      ; string 'tra1'; used by RosterScreen
        db 074h,072h,061h,031h,00h
str_Tra22:                                      ; string 'tra2'; used by RosterScreen
        db 074h,072h,061h,032h,00h
str_Tra32:                                      ; string 'tra3'; used by RosterScreen
        db 074h,072h,061h,033h,00h
str_Com1:                                       ; string 'com1'; used by RosterScreen
        db 063h,06Fh,06Dh,031h,00h
str_Com2:                                       ; string 'com2'; used by RosterScreen
        db 063h,06Fh,06Dh,032h,00h
str_Com3:                                       ; string 'com3'; used by RosterScreen
        db 063h,06Fh,06Dh,033h,00h
str_Def1:                                       ; string 'def1'; used by RosterScreen
        db 064h,065h,066h,031h,00h
str_Def2:                                       ; string 'def2'; used by RosterScreen
        db 064h,065h,066h,032h,00h
str_Def3:                                       ; string 'def3'; used by RosterScreen
        db 064h,065h,066h,033h,00h
str_El11:                                       ; string 'el11'; used by RosterScreen
        db 065h,06Ch,031h,031h,00h
str_El12:                                       ; string 'el12'; used by RosterScreen
        db 065h,06Ch,031h,032h,00h
str_El13:                                       ; string 'el13'; used by RosterScreen
        db 065h,06Ch,031h,033h,00h
str_El21:                                       ; string 'el21'; used by RosterScreen
        db 065h,06Ch,032h,031h,00h
str_El22:                                       ; string 'el22'; used by RosterScreen
        db 065h,06Ch,032h,032h,00h
str_El23:                                       ; string 'el23'; used by RosterScreen
        db 065h,06Ch,032h,033h,00h
str_S3up2:                                      ; string 's3up'; used by RosterScreen
        db 073h,033h,075h,070h,00h
str_S3ug2:                                      ; string 's3ug'; used by RosterScreen
        db 073h,033h,075h,067h,00h
str_S3dw2:                                      ; string 's3dw'; used by RosterScreen
        db 073h,033h,064h,077h,00h
str_S3dg2:                                      ; string 's3dg'; used by RosterScreen
        db 073h,033h,064h,067h,00h
str_S4up:                                       ; string 's4up'; used by RosterScreen
        db 073h,034h,075h,070h,00h
str_S4ug:                                       ; string 's4ug'; used by RosterScreen
        db 073h,034h,075h,067h,00h
str_S4dw:                                       ; string 's4dw'; used by RosterScreen
        db 073h,034h,064h,077h,00h
str_S4dg:                                       ; string 's4dg'; used by RosterScreen
        db 073h,034h,064h,067h,00h
str_S1up2:                                      ; string 's1up'; used by RosterScreen
        db 073h,031h,075h,070h,00h
str_S1ug2:                                      ; string 's1ug'; used by RosterScreen
        db 073h,031h,075h,067h,00h
str_S1dw2:                                      ; string 's1dw'; used by RosterScreen
        db 073h,031h,064h,077h,00h
str_S1dg2:                                      ; string 's1dg'; used by RosterScreen
        db 073h,031h,064h,067h,00h
str_S2up2:                                      ; string 's2up'; used by RosterScreen
        db 073h,032h,075h,070h,00h
str_S2ug2:                                      ; string 's2ug'; used by RosterScreen
        db 073h,032h,075h,067h,00h
str_S2dw2:                                      ; string 's2dw'; used by RosterScreen
        db 073h,032h,064h,077h,00h
str_S2dg2:                                      ; string 's2dg'; used by RosterScreen
        db 073h,032h,064h,067h,00h
str_TraD:                                       ; string 'tra%d'; used by RosterScreen
        db 074h,072h,061h,025h,064h,00h
str_RosterSort:                                 ; string 'Roster Sort'; used by RosterScreen
        db 052h,06Fh,073h,074h,065h,072h,020h,053h,06Fh,072h,074h,00h
str_LFRE:                                       ; string 'LFRE'; used by DrawRosterTeams
        db 04Ch,046h,052h,045h,00h
str_C2dCS:                                      ; string '%c %2d %c. %s'; used by FormatRosterLine
        db 025h,063h,020h,020h,025h,032h,064h,020h,020h,025h,063h,02Eh,020h,025h,073h,00h
str_SGID:                                       ; string 'SGI%d'; used by CycleLoadingArt
        db 053h,047h,049h,025h,064h,00h
str_SD6:                                        ; string '%s%d'; used by CreatePlayerScreen
        db 025h,073h,025h,064h,00h
str_GOL0:                                       ; string 'GOL0'; used by CreatePlayerScreen
        db 047h,04Fh,04Ch,030h,00h
str_NME0:                                       ; string 'NME0'; used by CreatePlayerScreen
        db 04Eh,04Dh,045h,030h,00h
str_NME1:                                       ; string 'NME1'; used by CreatePlayerScreen
        db 04Eh,04Dh,045h,031h,00h
str_NME2:                                       ; string 'NME2'; used by CreatePlayerScreen
        db 04Eh,04Dh,045h,032h,00h
str_NUM0:                                       ; string 'NUM0'; used by CreatePlayerScreen
        db 04Eh,055h,04Dh,030h,00h
str_NUM1:                                       ; string 'NUM1'; used by CreatePlayerScreen
        db 04Eh,055h,04Dh,031h,00h
str_NUM2:                                       ; string 'NUM2'; used by CreatePlayerScreen
        db 04Eh,055h,04Dh,032h,00h
str_SS4:                                        ; string '%s %s'; used by CreatePlayerScreen
        db 025h,073h,020h,025h,073h,00h
str_D12:                                        ; string '%d'; used by CreatePlayerScreen
        db 025h,064h,00h
F32_0p001:                                      ; float constant 0.001; used by CreatePlayerRatings
        db 06Fh,012h,083h,03Ah
F32_0p0208333:                                  ; float constant 0.0208333; used by CreatePlayerRatings
        db 0ABh,0AAh,0AAh,03Ch
F32_0p00333333:                                 ; float constant 0.00333333; used by CreatePlayerRatings
        db 0Eh,074h,05Ah,03Bh
F32_390:                                        ; float constant 390; used by CreatePlayerRatings
        db 00h,00h,0C3h,043h
F32_0p005:                                      ; float constant 0.005; used by CreatePlayerRatings
        db 0Ah,0D7h,0A3h,03Bh
F32_100:                                        ; float constant 100; used by CreatePlayerRatings
        db 00h,00h,0C8h,042h
F32_neg50:                                      ; float constant -50; used by CreatePlayerRatings
        db 00h,00h,048h,0C2h
F32_0p002:                                      ; float constant 0.002; used by CreatePlayerRatings
        db 06Fh,012h,03h,03Bh
F32_0p0111111:                                  ; float constant 0.0111111; used by CreatePlayerRatings
        db 061h,0Bh,036h,03Ch
F32_0p1:                                        ; float constant 0.1; used by CreatePlayerRatings
        db 0CDh,0CCh,0CCh,03Dh
F32_0p0142857:                                  ; float constant 0.0142857; used by CreatePlayerRatings
        db 0A1h,0Eh,06Ah,03Ch
F32_0p0333333:                                  ; float constant 0.0333333; used by CreatePlayerRatings
        db 089h,088h,08h,03Dh
F32_58:                                         ; float constant 58; used by CreatePlayerRatings
        db 00h,00h,068h,042h
F32_90:                                         ; float constant 90; used by CreatePlayerRatings
        db 00h,00h,0B4h,042h
F32_0p01:                                       ; float constant 0.01; used by CreatePlayerRatings
        db 0Ah,0D7h,023h,03Ch
F64_0p9:                                        ; double constant 0.9; used by CreatePlayerRatings
        db 0CDh,0CCh,0CCh,0CCh,0CCh,0CCh,0ECh,03Fh
F64_0p1_CreatePlayerRatings:                    ; double constant 0.1; used by CreatePlayerRatings
        db 09Ah,099h,099h,099h,099h,099h,0B9h,03Fh
F32_347:                                        ; float constant 347; used by CreatePlayerRatings
        db 00h,080h,0ADh,043h,00h,00h
