; Strings and constants of front/pregame (src/front/pregame), in link order.
bits 32
%include "hockey.inc"
section s_112488 progbits alloc noexec write align=1
global str_H07d, str_FSH, str_Down, str_A07d, str_Home, str_PalFsh, str_Pal3, str_dbgSpace
global str_Bkgd13, str_04d2, str_SCHEDULE2, str_BKGD14, str_Xlate, str_FSH3, str_ProfileFsh, str_Ard
global str_Card, str_Plyr, str_LG02d, str_SS3, str_MightyDucksOfAnaheim, str_DSS, str_PreGameBlank, str_PALS
global str_D2, str_CS3
str_H07d:                                       ; string 'H%07d'; used by PreGameMatchupScreen
        db 048h,025h,030h,037h,064h,00h
str_FSH:                                        ; string '.FSH'; used by PreGameMatchupScreen
        db 02Eh,046h,053h,048h,00h
str_Down:                                       ; string 'down'; used by PreGameMatchupScreen
        db 064h,06Fh,077h,06Eh,00h
str_A07d:                                       ; string 'A%07d'; used by PreGameMatchupScreen
        db 041h,025h,030h,037h,064h,00h
str_Home:                                       ; string 'home'; used by PreGameMatchupScreen
        db 068h,06Fh,06Dh,065h,00h
str_PalFsh:                                     ; string 'pal.fsh'; used by PreGameMatchupScreen
        db 070h,061h,06Ch,02Eh,066h,073h,068h,00h
str_Pal3:                                       ; string '!pal'; used by PreGameDefenceCards,
                                                ; PreGameForwardCards, PreGameMatchupScreen ...
        db 021h,070h,061h,06Ch,00h
str_dbgSpace:                                   ; string ' '; used by PreGameMatchupScreen
        db 020h,00h
str_Bkgd13:                                     ; string 'bkgd'; used by PreGameTeamsScreen
        db 062h,06Bh,067h,064h,00h
str_04d2:                                       ; string '%04d'; used by PreGameTeamsScreen
        db 025h,030h,034h,064h,00h
str_SCHEDULE2:                                  ; string 'SCHEDULE'; used by PreGameTeamsScreen
        db 053h,043h,048h,045h,044h,055h,04Ch,045h,00h
str_BKGD14:                                     ; string 'BKGD'; used by PreGameDefenceCards,
                                                ; PreGameForwardCards, PreGameScoutingCards
        db 042h,04Bh,047h,044h,00h
str_Xlate:                                      ; string 'Xlate'; used by PreGameScoutingCards
        db 058h,06Ch,061h,074h,065h,00h
str_FSH3:                                       ; string '****.FSH'; used by PreGameDefenceCards,
                                                ; PreGameForwardCards, PreGameScoutingCards
        db 02Ah,02Ah,02Ah,02Ah,02Eh,046h,053h,048h,00h
str_ProfileFsh:                                 ; string 'profile.fsh'; used by PreGameDefenceCards,
                                                ; PreGameForwardCards, PreGameScoutingCards
        db 070h,072h,06Fh,066h,069h,06Ch,065h,02Eh,066h,073h,068h,00h
str_Ard:                                        ; string '!ard'; used by PreGameDefenceCards,
                                                ; PreGameForwardCards, PreGameScoutingCards
        db 021h,061h,072h,064h,00h
str_Card:                                       ; string 'card'; used by PreGameDefenceCards,
                                                ; PreGameForwardCards, PreGameScoutingCards
        db 063h,061h,072h,064h,00h
str_Plyr:                                       ; string 'plyr'; used by PreGameDefenceCards,
                                                ; PreGameForwardCards, PreGameScoutingCards
        db 070h,06Ch,079h,072h,00h
str_LG02d:                                      ; string 'LG%02d'; used by PreGameScoutingCards
        db 04Ch,047h,025h,030h,032h,064h,00h
str_SS3:                                        ; string '%s %s'; used by PreGameScoutingCards
        db 025h,073h,020h,025h,073h,00h
str_MightyDucksOfAnaheim:                       ; string 'Mighty Ducks of Anaheim'; used by
                                                ; PreGameScoutingCards
        db 04Dh,069h,067h,068h,074h,079h,020h,044h,075h,063h,06Bh,073h,020h,06Fh,066h,020h
        db 041h,06Eh,061h,068h,065h,069h,06Dh,00h
str_DSS:                                        ; string '#%d %s %s'; used by PreGameScoutingCards
        db 023h,025h,064h,020h,025h,073h,020h,025h,073h,00h
str_PreGameBlank:                               ; empty caption on the player cards screen; used by
                                                ; PreGameScoutingCards
        db 00h
str_PALS:                                       ; string 'PALS'; used by PreGameDefenceCards,
                                                ; PreGameForwardCards
        db 050h,041h,04Ch,053h,00h
str_D2:                                         ; string '#%d'; used by PreGameDefenceCards,
                                                ; PreGameForwardCards
        db 023h,025h,064h,00h
str_CS3:                                        ; string '%c %s'; used by PreGameDefenceCards,
                                                ; PreGameForwardCards
        db 025h,063h,020h,025h,073h,00h,00h
