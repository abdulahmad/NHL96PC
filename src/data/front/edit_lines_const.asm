; Strings and constants of front/edit_lines (src/front/edit_lines), in link order.
bits 32
%include "hockey.inc"
section s_112D2C progbits alloc noexec write align=1
global str_StatDBPTRs3, str_DBPTRs3, str_Player3, str_FName3, str_LName3, str_Profiles3, str_HeightNWeight3, str_DonrussCards
global str_Bt092, str_Bh09, str_Bkgd20, str_Slid2, str_Ball6, str_Slu12, str_Slup, str_Sld12
global str_Sldw, str_Pal28, str_Nhl1, str_Nhl2, str_Nhl3, str_Scr12, str_Scr22, str_Scr3
global str_Drs1, str_Drs2, str_Drs3, str_Sta13, str_Sta23, str_Sta33, str_Bh17, str_Bt02d4
global str_Bt17, str_Bh01, str_Bt018, str_LinesSort, str_Bkpp, str_Bkpk, str_Jers, str_Jrhl
global str_CD2, str_CS4
str_StatDBPTRs3:                                ; string 'StatDBPTRs'; used by RunEditLines
        db 053h,074h,061h,074h,044h,042h,050h,054h,052h,073h,00h
str_DBPTRs3:                                    ; string 'DBPTRs'; used by RunEditLines
        db 044h,042h,050h,054h,052h,073h,00h
str_Player3:                                    ; string 'Player #'; used by RunEditLines
        db 050h,06Ch,061h,079h,065h,072h,020h,023h,00h
str_FName3:                                     ; string 'FName'; used by RunEditLines
        db 046h,04Eh,061h,06Dh,065h,00h
str_LName3:                                     ; string 'LName'; used by RunEditLines
        db 04Ch,04Eh,061h,06Dh,065h,00h
str_Profiles3:                                  ; string 'Profiles'; used by RunEditLines
        db 050h,072h,06Fh,066h,069h,06Ch,065h,073h,00h
str_HeightNWeight3:                             ; string 'Height 'n' Weight'; used by RunEditLines
        db 048h,065h,069h,067h,068h,074h,020h,027h,06Eh,027h,020h,057h,065h,069h,067h,068h
        db 074h,00h
str_DonrussCards:                               ; string 'donruss cards'; used by RunEditLines
        db 064h,06Fh,06Eh,072h,075h,073h,073h,020h,063h,061h,072h,064h,073h,00h
str_Bt092:                                      ; string 'bt09'; used by EditLinesScreen
        db 062h,074h,030h,039h,00h
str_Bh09:                                       ; string 'bh09'; used by EditLinesScreen
        db 062h,068h,030h,039h,00h
str_Bkgd20:                                     ; string 'bkgd'; used by DrawLinesPanel, DrawLinesPlayerList,
                                                ; EditLinesScreen
        db 062h,06Bh,067h,064h,00h
str_Slid2:                                      ; string 'slid'; used by EditLinesScreen
        db 073h,06Ch,069h,064h,00h
str_Ball6:                                      ; string 'ball'; used by EditLinesScreen
        db 062h,061h,06Ch,06Ch,00h
str_Slu12:                                      ; string 'slu1'; used by EditLinesScreen
        db 073h,06Ch,075h,031h,00h
str_Slup:                                       ; string 'slup'; used by EditLinesScreen
        db 073h,06Ch,075h,070h,00h
str_Sld12:                                      ; string 'sld1'; used by EditLinesScreen
        db 073h,06Ch,064h,031h,00h
str_Sldw:                                       ; string 'sldw'; used by EditLinesScreen
        db 073h,06Ch,064h,077h,00h
str_Pal28:                                      ; string '!pal'; used by EditLinesScreen
        db 021h,070h,061h,06Ch,00h
str_Nhl1:                                       ; string 'nhl1'; used by EditLinesScreen
        db 06Eh,068h,06Ch,031h,00h
str_Nhl2:                                       ; string 'nhl2'; used by EditLinesScreen
        db 06Eh,068h,06Ch,032h,00h
str_Nhl3:                                       ; string 'nhl3'; used by EditLinesScreen
        db 06Eh,068h,06Ch,033h,00h
str_Scr12:                                      ; string 'scr1'; used by EditLinesScreen
        db 073h,063h,072h,031h,00h
str_Scr22:                                      ; string 'scr2'; used by EditLinesScreen
        db 073h,063h,072h,032h,00h
str_Scr3:                                       ; string 'scr3'; used by EditLinesScreen
        db 073h,063h,072h,033h,00h
str_Drs1:                                       ; string 'drs1'; used by EditLinesScreen
        db 064h,072h,073h,031h,00h
str_Drs2:                                       ; string 'drs2'; used by EditLinesScreen
        db 064h,072h,073h,032h,00h
str_Drs3:                                       ; string 'drs3'; used by EditLinesScreen
        db 064h,072h,073h,033h,00h
str_Sta13:                                      ; string 'sta1'; used by EditLinesScreen
        db 073h,074h,061h,031h,00h
str_Sta23:                                      ; string 'sta2'; used by EditLinesScreen
        db 073h,074h,061h,032h,00h
str_Sta33:                                      ; string 'sta3'; used by EditLinesScreen
        db 073h,074h,061h,033h,00h
str_Bh17:                                       ; string 'bh17'; used by EditLinesScreen
        db 062h,068h,031h,037h,00h
str_Bt02d4:                                     ; string 'bt%02d'; used by EditLinesScreen
        db 062h,074h,025h,030h,032h,064h,00h
str_Bt17:                                       ; string 'bt17'; used by EditLinesScreen
        db 062h,074h,031h,037h,00h
str_Bh01:                                       ; string 'bh01'; used by EditLinesScreen
        db 062h,068h,030h,031h,00h
str_Bt018:                                      ; string 'bt01'; used by EditLinesScreen
        db 062h,074h,030h,031h,00h
str_LinesSort:                                  ; string 'Lines Sort'; used by EditLinesScreen
        db 04Ch,069h,06Eh,065h,073h,020h,053h,06Fh,072h,074h,00h
str_Bkpp:                                       ; string 'bkpp'; used by DrawLinesPanel
        db 062h,06Bh,070h,070h,00h
str_Bkpk:                                       ; string 'bkpk'; used by DrawLinesPanel
        db 062h,06Bh,070h,06Bh,00h
str_Jers:                                       ; string 'jers'; used by DrawLineJersey
        db 06Ah,065h,072h,073h,00h
str_Jrhl:                                       ; string 'jrhl'; used by DrawLineJersey
        db 06Ah,072h,068h,06Ch,00h
str_CD2:                                        ; string '%c %d'; used by DrawLinesPlayerList
        db 025h,063h,020h,025h,064h,00h
str_CS4:                                        ; string '%c. %s'; used by DrawLinesPlayerList
        db 025h,063h,02Eh,020h,025h,073h,00h,00h,00h,00h
