; Initialised data of front/player_cards (src/front/player_cards).
bits 32
%include "hockey.inc"
section s_11E764 progbits alloc noexec write align=1
extern str_0009, str_0109, str_0177, str_0410, str_0427, str_0509, str_0707, str_0834
extern str_0844, str_1033, str_1227, str_1230, str_1404, str_1688, str_1720, str_1931
extern str_2293, str_2309, str_2314, str_2316, str_2409
global CardPhotoNames, SkaterRatingTextIds, SkaterRatingOrder, GoalieRatingOrder, GoalieRatingTextIds, CardView, CardSliding, CardArtLoaded
global CardRemapOn
CardPhotoNames:                                 ; special player card photo names; used by DrawPlayerCardName
        dd str_0410
        dd str_0707
        dd str_0177
        dd str_1230
        dd str_2314
        dd str_2309
        dd str_0427
        dd str_2293
        dd str_1931
        dd str_0109
        dd str_1688
        dd str_1404
        dd str_2316
        dd str_1033
        dd str_0509
        dd str_0844
        dd str_1227
        dd str_2409
        dd str_1720
        dd str_0009
        dd str_0834
        db 099h,00h,00h,00h,09Ah,00h,00h,00h,09Bh,00h,00h,00h,09Ch,00h,00h,00h
        db 09Dh,00h,00h,00h,09Eh,00h,00h,00h,09Fh,00h,00h,00h,0A0h,00h,00h,00h
        db 0A1h,00h,00h,00h,0A2h,00h,00h,00h
SkaterRatingTextIds:                            ; skater rating text ids; used by DrawCreatePlayerRow,
                                                ; DrawPlayerCardStats, DrawRatingsTitle ...
        db 0A3h,00h,00h,00h,0A4h,00h,00h,00h,0A5h,00h,00h,00h,0A6h,00h,00h,00h
        db 0A7h,00h,00h,00h,0A8h,00h,00h,00h,0A9h,00h,00h,00h,0AAh,00h,00h,00h
        db 0ABh,00h,00h,00h,0ACh,00h,00h,00h,0ADh,00h,00h,00h,0AEh,00h,00h,00h
        db 0AFh,00h,00h,00h,0B0h,00h,00h,00h,0B1h,00h,00h,00h,0B2h,00h,00h,00h
        db 0B3h,00h,00h,00h,0B4h,00h,00h,00h,0B6h,00h,00h,00h,0B7h,00h,00h,00h
        db 0B8h,00h,00h,00h,0B9h,00h,00h,00h,0BAh,00h,00h,00h,0BBh,00h,00h,00h
        db 0B5h,00h,00h,00h
SkaterRatingOrder:                              ; order of skater ratings on the card; used by
                                                ; CreatePlayerLimits, CreatePlayerScreen, DrawCreatePlayerRow
                                                ; ...
        db 01h,02h,04h,05h,06h,07h,09h,0Ah,0Bh,0Ch,0Dh,0Eh,013h,014h
GoalieRatingOrder:                              ; order of goalie ratings on the card; used by
                                                ; CreatePlayerLimits, CreatePlayerScreen, DrawCreatePlayerRow
                                                ; ...
        db 01h,02h,03h,04h,06h,07h,0Ah,0Bh,010h
GoalieRatingTextIds:                            ; goalie rating text ids; used by DrawCreatePlayerRow,
                                                ; DrawPlayerCardStats, DrawRatingsTitle ...
        db 0BCh,00h,00h,00h,0BDh,00h,00h,00h,0BEh,00h,00h,00h,0BFh,00h,00h,00h
        db 0C1h,00h,00h,00h,0C2h,00h,00h,00h,0C3h,00h,00h,00h,0C4h,00h,00h,00h
        db 0C0h,00h,00h,00h
CardView:                                       ; player card view; used by PlayerCardScreen, SwitchPlayerCard
        db 00h,00h,00h,00h
CardSliding:                                    ; player card is sliding; used by LoadPlayerCardArt,
                                                ; SlideCardLeft, SlideCardRight
        db 00h,00h,00h,00h
CardArtLoaded:                                  ; player card art is loaded; used by LoadPlayerCardArt,
                                                ; PlayerCardScreen
        db 01h,00h,00h,00h
CardRemapOn:                                    ; player card colour remap is on; used by LoadPlayerCardArt,
                                                ; SlideCardLeft, SlideCardRight ...
        db 01h,00h,00h,00h,00h
