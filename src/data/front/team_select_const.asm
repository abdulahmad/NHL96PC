; Strings and constants of front/team_select (src/front/team_select), in link order.
bits 32
%include "hockey.inc"
section s_11203C progbits alloc noexec write align=1
global str_Rk02d2, str_Pal10, str_Bkgd24, str_Ahl02, str_Ahl12, str_Ahl22, str_Ahr02, str_Ahr12
global str_Ahr22, str_Aal02, str_Aal12, str_Aal22, str_Aar02, str_Aar12, str_Aar22, str_Swt02
global str_Swt1, str_Set0, str_Set1, str_Set2, str_Rul1, str_Rul2, str_Rul3, str_HaBck0
global str_HaBck1, str_Rk22, str_SwtD, str_Ldat
str_Rk02d2:                                     ; string 'rk%02d'; used by DrawAwayTeamPanel,
                                                ; DrawHomeTeamPanel
        db 072h,06Bh,025h,030h,032h,064h,00h
str_Pal10:                                      ; string '!pal'; used by TeamSelectScreen
        db 021h,070h,061h,06Ch,00h
str_Bkgd24:                                     ; string 'bkgd'; used by TeamSelectScreen
        db 062h,06Bh,067h,064h,00h
str_Ahl02:                                      ; string 'ahl0'; used by TeamSelectScreen
        db 061h,068h,06Ch,030h,00h
str_Ahl12:                                      ; string 'ahl1'; used by TeamSelectScreen
        db 061h,068h,06Ch,031h,00h
str_Ahl22:                                      ; string 'ahl2'; used by TeamSelectScreen
        db 061h,068h,06Ch,032h,00h
str_Ahr02:                                      ; string 'ahr0'; used by TeamSelectScreen
        db 061h,068h,072h,030h,00h
str_Ahr12:                                      ; string 'ahr1'; used by TeamSelectScreen
        db 061h,068h,072h,031h,00h
str_Ahr22:                                      ; string 'ahr2'; used by TeamSelectScreen
        db 061h,068h,072h,032h,00h
str_Aal02:                                      ; string 'aal0'; used by TeamSelectScreen
        db 061h,061h,06Ch,030h,00h
str_Aal12:                                      ; string 'aal1'; used by TeamSelectScreen
        db 061h,061h,06Ch,031h,00h
str_Aal22:                                      ; string 'aal2'; used by TeamSelectScreen
        db 061h,061h,06Ch,032h,00h
str_Aar02:                                      ; string 'aar0'; used by TeamSelectScreen
        db 061h,061h,072h,030h,00h
str_Aar12:                                      ; string 'aar1'; used by TeamSelectScreen
        db 061h,061h,072h,031h,00h
str_Aar22:                                      ; string 'aar2'; used by TeamSelectScreen
        db 061h,061h,072h,032h,00h
str_Swt02:                                      ; string 'swt0'; used by TeamSelectScreen
        db 073h,077h,074h,030h,00h
str_Swt1:                                       ; string 'swt1'; used by TeamSelectScreen
        db 073h,077h,074h,031h,00h
str_Set0:                                       ; string 'set0'; used by TeamSelectScreen
        db 073h,065h,074h,030h,00h
str_Set1:                                       ; string 'set1'; used by TeamSelectScreen
        db 073h,065h,074h,031h,00h
str_Set2:                                       ; string 'set2'; used by TeamSelectScreen
        db 073h,065h,074h,032h,00h
str_Rul1:                                       ; string 'rul1'; used by TeamSelectScreen
        db 072h,075h,06Ch,031h,00h
str_Rul2:                                       ; string 'rul2'; used by TeamSelectScreen
        db 072h,075h,06Ch,032h,00h
str_Rul3:                                       ; string 'rul3'; used by TeamSelectScreen
        db 072h,075h,06Ch,033h,00h
str_HaBck0:                                     ; string 'ha-bck0'; used by TeamSelectScreen
        db 068h,061h,02Dh,062h,063h,06Bh,030h,00h
str_HaBck1:                                     ; string 'ha-bck1'; used by TeamSelectScreen
        db 068h,061h,02Dh,062h,063h,06Bh,031h,00h
str_Rk22:                                       ; string 'rk22'; used by TeamSelectScreen
        db 072h,06Bh,032h,032h,00h
str_SwtD:                                       ; string 'swt%d'; used by TeamSelectScreen
        db 073h,077h,074h,025h,064h,00h
str_Ldat:                                       ; string 'ldat'; used by TeamSelectScreen
        db 06Ch,064h,061h,074h,00h
