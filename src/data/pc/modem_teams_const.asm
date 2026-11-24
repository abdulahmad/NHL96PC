; Strings and constants of pc/modem_teams (src/pc/modem_teams), in link order.
bits 32
%include "hockey.inc"
section s_112F00 progbits alloc noexec write align=1
global str_Rk02d, str_Pal29, str_Bkgd21, str_Ahl0, str_Ahl1, str_Ahl2, str_Ahr0, str_Ahr1
global str_Ahr2, str_Aal0, str_Aal1, str_Aal2, str_Aar0, str_Aar1, str_Aar2, str_Swt0
global str_Swt12, str_Rul13, str_Rul23, str_Rul33, str_HaBck02, str_HaBck12, str_Rk222, str_SwtD2
global str_7GM, str_5GM, str_3GM, str_1GM
str_Rk02d:                                      ; string 'rk%02d'; used by DrawModemAwayPanel,
                                                ; DrawModemHomePanel
        db 072h,06Bh,025h,030h,032h,064h,00h
str_Pal29:                                      ; string '!pal'; used by ModemTeamSelectScreen
        db 021h,070h,061h,06Ch,00h
str_Bkgd21:                                     ; string 'bkgd'; used by ModemTeamSelectScreen
        db 062h,06Bh,067h,064h,00h
str_Ahl0:                                       ; string 'ahl0'; used by ModemTeamSelectScreen
        db 061h,068h,06Ch,030h,00h
str_Ahl1:                                       ; string 'ahl1'; used by ModemTeamSelectScreen
        db 061h,068h,06Ch,031h,00h
str_Ahl2:                                       ; string 'ahl2'; used by ModemTeamSelectScreen
        db 061h,068h,06Ch,032h,00h
str_Ahr0:                                       ; string 'ahr0'; used by ModemTeamSelectScreen
        db 061h,068h,072h,030h,00h
str_Ahr1:                                       ; string 'ahr1'; used by ModemTeamSelectScreen
        db 061h,068h,072h,031h,00h
str_Ahr2:                                       ; string 'ahr2'; used by ModemTeamSelectScreen
        db 061h,068h,072h,032h,00h
str_Aal0:                                       ; string 'aal0'; used by ModemTeamSelectScreen
        db 061h,061h,06Ch,030h,00h
str_Aal1:                                       ; string 'aal1'; used by ModemTeamSelectScreen
        db 061h,061h,06Ch,031h,00h
str_Aal2:                                       ; string 'aal2'; used by ModemTeamSelectScreen
        db 061h,061h,06Ch,032h,00h
str_Aar0:                                       ; string 'aar0'; used by ModemTeamSelectScreen
        db 061h,061h,072h,030h,00h
str_Aar1:                                       ; string 'aar1'; used by ModemTeamSelectScreen
        db 061h,061h,072h,031h,00h
str_Aar2:                                       ; string 'aar2'; used by ModemTeamSelectScreen
        db 061h,061h,072h,032h,00h
str_Swt0:                                       ; string 'swt0'; used by ModemTeamSelectScreen
        db 073h,077h,074h,030h,00h
str_Swt12:                                      ; string 'swt1'; used by ModemTeamSelectScreen
        db 073h,077h,074h,031h,00h
str_Rul13:                                      ; string 'rul1'; used by ModemTeamSelectScreen
        db 072h,075h,06Ch,031h,00h
str_Rul23:                                      ; string 'rul2'; used by ModemTeamSelectScreen
        db 072h,075h,06Ch,032h,00h
str_Rul33:                                      ; string 'rul3'; used by ModemTeamSelectScreen
        db 072h,075h,06Ch,033h,00h
str_HaBck02:                                    ; string 'ha-bck0'; used by ModemTeamSelectScreen
        db 068h,061h,02Dh,062h,063h,06Bh,030h,00h
str_HaBck12:                                    ; string 'ha-bck1'; used by ModemTeamSelectScreen
        db 068h,061h,02Dh,062h,063h,06Bh,031h,00h
str_Rk222:                                      ; string 'rk22'; used by ModemTeamSelectScreen
        db 072h,06Bh,032h,032h,00h
str_SwtD2:                                      ; string 'swt%d'; used by ModemTeamSelectScreen
        db 073h,077h,074h,025h,064h,00h,00h,00h,00h
str_7GM:                                        ; string '7GM'; used by PlayoffSeriesLabels
        db 037h,047h,04Dh,00h
str_5GM:                                        ; string '5GM'; used by PlayoffSeriesLabels
        db 035h,047h,04Dh,00h
str_3GM:                                        ; string '3GM'; used by PlayoffSeriesLabels
        db 033h,047h,04Dh,00h
str_1GM:                                        ; string '1GM'; used by PlayoffSeriesLabels
        db 031h,047h,04Dh,00h
