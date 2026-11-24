; Strings and constants of front/player_art (src/front/player_art), in link order.
bits 32
%include "hockey.inc"
section s_1111DE progbits alloc noexec write align=1
global str_TeampalQda, str_FightRef, str_TotalRef, str_OldshpQfs, str_OLDSHPQFS2, str_Unpacked, str_RinkpalQfs, str_Pal6
global str_NewpalQfs, str_CupRef, str_UNPACK
str_TeampalQda:                                 ; string 'teampal.qda'; used by LoadTeamPalette
        db 074h,065h,061h,06Dh,070h,061h,06Ch,02Eh,071h,064h,061h,00h
str_FightRef:                                   ; string 'fight.ref'; used by LoadFightSprites,
                                                ; LoadPlayerSprites
        db 066h,069h,067h,068h,074h,02Eh,072h,065h,066h,00h
str_TotalRef:                                   ; string 'total.ref'; used by LoadPlayerSprites,
                                                ; LoadTotalSprites
        db 074h,06Fh,074h,061h,06Ch,02Eh,072h,065h,066h,00h
str_OldshpQfs:                                  ; string 'oldshp.qfs'; used by LoadPlayerSprites
        db 06Fh,06Ch,064h,073h,068h,070h,02Eh,071h,066h,073h,00h
str_OLDSHPQFS2:                                 ; string 'OLDSHP.QFS'; used by LoadPlayerSprites
        db 04Fh,04Ch,044h,053h,048h,050h,02Eh,051h,046h,053h,00h
str_Unpacked:                                   ; string 'unpacked'; used by LoadPlayerSprites
        db 075h,06Eh,070h,061h,063h,06Bh,065h,064h,00h
str_RinkpalQfs:                                 ; string 'rinkpal.qfs'; used by LoadPlayerSprites
        db 072h,069h,06Eh,06Bh,070h,061h,06Ch,02Eh,071h,066h,073h,00h
str_Pal6:                                       ; string '!pal'; used by LoadPlayerSprites
        db 021h,070h,061h,06Ch,00h
str_NewpalQfs:                                  ; string 'newpal.qfs'; used by LoadGameSprites
        db 06Eh,065h,077h,070h,061h,06Ch,02Eh,071h,066h,073h,00h
str_CupRef:                                     ; string 'cup.ref'; used by LoadCupSprites
        db 063h,075h,070h,02Eh,072h,065h,066h,00h
str_UNPACK:                                     ; string 'UNPACK'; used by GetSpriteFrame
        db 055h,04Eh,050h,041h,043h,04Bh,00h
