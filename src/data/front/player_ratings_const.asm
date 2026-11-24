; Strings and constants of front/player_ratings (src/front/player_ratings), in link order.
bits 32
%include "hockey.inc"
section s_112A2C progbits alloc noexec write align=1
global str_XTbl2, str_Bkgd18, str_Pal24, str_SD5, str_RAT02, str_HD012, str_HD023, str_Ban2
global str_S1, str_BALL4, str_S22, str_S32, str_S1up, str_S1ug, str_S1dw, str_S1dg
global str_S2up, str_S2ug, str_S2dw, str_S2dg, str_TR00, str_TR01, str_TR02, str_S3up
global str_S3ug, str_S3dw, str_S3dg, str_TR0D, str_D11, str_DD9, str_DD10, str_NAV
global str_003, str_FSH5, str_Plyr3, str_PROFILEFSH3, str_Card3, str_Ard3, str_DSS4, F64_2p54_DrawRatingsName
global F64_0p454545_DrawRatingsName, str_PosCEN, str_LFT, str_RHT, str_PosDEF, str_PosGOL
str_XTbl2:                                      ; string 'X-tbl'; used by PlayerRatingsScreen
        db 058h,02Dh,074h,062h,06Ch,00h
str_Bkgd18:                                     ; string 'bkgd'; used by DrawRatingBars, DrawRatingsList,
                                                ; DrawRatingsName ...
        db 062h,06Bh,067h,064h,00h
str_Pal24:                                      ; string '!pal'; used by LoadRatingsPicture,
                                                ; PlayerRatingsScreen
        db 021h,070h,061h,06Ch,00h
str_SD5:                                        ; string '%s%d'; used by PlayerRatingsScreen
        db 025h,073h,025h,064h,00h
str_RAT02:                                      ; string 'RAT0'; used by PlayerRatingsScreen
        db 052h,041h,054h,030h,00h
str_HD012:                                      ; string 'HD01'; used by PlayerRatingsScreen
        db 048h,044h,030h,031h,00h
str_HD023:                                      ; string 'HD02'; used by PlayerRatingsScreen
        db 048h,044h,030h,032h,00h
str_Ban2:                                       ; string 'ban2'; used by PlayerRatingsScreen
        db 062h,061h,06Eh,032h,00h
str_S1:                                         ; string 's1 '; used by PlayerRatingsScreen
        db 073h,031h,020h,020h,00h
str_BALL4:                                      ; string 'BALL'; used by DrawRatingsList, PlayerRatingsScreen
        db 042h,041h,04Ch,04Ch,00h
str_S22:                                        ; string 's2 '; used by PlayerRatingsScreen
        db 073h,032h,020h,020h,00h
str_S32:                                        ; string 's3 '; used by DrawRatingsList, PlayerRatingsScreen
        db 073h,033h,020h,020h,00h
str_S1up:                                       ; string 's1up'; used by PlayerRatingsScreen
        db 073h,031h,075h,070h,00h
str_S1ug:                                       ; string 's1ug'; used by PlayerRatingsScreen
        db 073h,031h,075h,067h,00h
str_S1dw:                                       ; string 's1dw'; used by PlayerRatingsScreen
        db 073h,031h,064h,077h,00h
str_S1dg:                                       ; string 's1dg'; used by PlayerRatingsScreen
        db 073h,031h,064h,067h,00h
str_S2up:                                       ; string 's2up'; used by PlayerRatingsScreen
        db 073h,032h,075h,070h,00h
str_S2ug:                                       ; string 's2ug'; used by PlayerRatingsScreen
        db 073h,032h,075h,067h,00h
str_S2dw:                                       ; string 's2dw'; used by PlayerRatingsScreen
        db 073h,032h,064h,077h,00h
str_S2dg:                                       ; string 's2dg'; used by PlayerRatingsScreen
        db 073h,032h,064h,067h,00h
str_TR00:                                       ; string 'TR00'; used by PlayerRatingsScreen
        db 054h,052h,030h,030h,00h
str_TR01:                                       ; string 'TR01'; used by PlayerRatingsScreen
        db 054h,052h,030h,031h,00h
str_TR02:                                       ; string 'TR02'; used by PlayerRatingsScreen
        db 054h,052h,030h,032h,00h
str_S3up:                                       ; string 's3up'; used by PlayerRatingsScreen
        db 073h,033h,075h,070h,00h
str_S3ug:                                       ; string 's3ug'; used by PlayerRatingsScreen
        db 073h,033h,075h,067h,00h
str_S3dw:                                       ; string 's3dw'; used by PlayerRatingsScreen
        db 073h,033h,064h,077h,00h
str_S3dg:                                       ; string 's3dg'; used by PlayerRatingsScreen
        db 073h,033h,064h,067h,00h
str_TR0D:                                       ; string 'TR0%d'; used by PlayerRatingsScreen
        db 054h,052h,030h,025h,064h,00h
str_D11:                                        ; string '%d'; used by DrawRatingBars, LoadRatingsPicture
        db 025h,064h,00h
str_DD9:                                        ; string '%d.%d'; used by DrawRatingBars
        db 025h,064h,02Eh,025h,064h,00h
str_DD10:                                       ; string '%d.%d%%'; used by DrawRatingBars
        db 025h,064h,02Eh,025h,064h,025h,025h,00h
str_NAV:                                        ; string 'NAV'; used by DrawRatingBars
        db 04Eh,041h,056h,00h
str_003:                                        ; string '0.0%'; used by DrawRatingBars
        db 030h,02Eh,030h,025h,00h
str_FSH5:                                       ; string '****.FSH'; used by LoadRatingsPicture
        db 02Ah,02Ah,02Ah,02Ah,02Eh,046h,053h,048h,00h
str_Plyr3:                                      ; string 'plyr'; used by LoadRatingsPicture
        db 070h,06Ch,079h,072h,00h
str_PROFILEFSH3:                                ; string 'PROFILE.FSH'; used by LoadRatingsPicture
        db 050h,052h,04Fh,046h,049h,04Ch,045h,02Eh,046h,053h,048h,00h
str_Card3:                                      ; string 'card'; used by LoadRatingsPicture
        db 063h,061h,072h,064h,00h
str_Ard3:                                       ; string '!ard'; used by LoadRatingsPicture
        db 021h,061h,072h,064h,00h
str_DSS4:                                       ; string '#%d %s %s'; used by DrawRatingsName
        db 023h,025h,064h,020h,025h,073h,020h,025h,073h,00h
F64_2p54_DrawRatingsName:                       ; double constant 2.54; used by DrawRatingsName
        db 052h,0B8h,01Eh,085h,0EBh,051h,04h,040h
F64_0p454545_DrawRatingsName:                   ; double constant 0.454545; used by DrawRatingsName
        db 018h,05Dh,074h,0D1h,045h,017h,0DDh,03Fh,00h,00h
str_PosCEN:                                     ; centre position tag
        db 043h,045h,04Eh,00h
str_LFT:                                        ; string "LFT"
        db 04Ch,046h,054h,00h
str_RHT:                                        ; string "RHT"
        db 052h,048h,054h,00h
str_PosDEF:                                     ; defence position tag
        db 044h,045h,046h,00h
str_PosGOL:                                     ; goalie position tag
        db 047h,04Fh,04Ch,00h
