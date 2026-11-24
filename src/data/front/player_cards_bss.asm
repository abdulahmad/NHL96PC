; BSS of front/player_cards (src/front/player_cards).
bits 32
%include "hockey.inc"
section s_1820F4 nobits alloc noexec write align=1
global CardRemapTable, CardPhotoBmp, CardRemapPlain, CardSlideFrom, CardSlideTo, CardJerseyNumber, BackgroundShapes, CardSlideBmp
global CardRemapIndex, CardTitleTime, CardXlatTable, CardSlideStep, CardTitleShown
CardRemapTable:                                 ; player card colour remap table; used by PlayerCardScreen,
                                                ; SwitchPlayerCard
        resb 4
CardPhotoBmp:                                   ; player card photo bitmap; used by LoadPlayerCardArt,
                                                ; PlayerCardScreen
        resb 4
CardRemapPlain:                                 ; player card plain colour remap; used by PlayerCardScreen,
                                                ; SwitchPlayerCard
        resb 4
CardSlideFrom:                                  ; player card slide start; used by PlayerCardScreen,
                                                ; SwitchPlayerCard
        resb 4
CardSlideTo:                                    ; player card slide end; used by PlayerCardScreen,
                                                ; SwitchPlayerCard
        resb 4
CardJerseyNumber:                               ; jersey number of the player on the card; used by
                                                ; LoadPlayerCardArt
        resb 4
BackgroundShapes:                               ; background shape file; used by DrawLeagueLogo,
                                                ; DrawPlayoffSlotLogo, DrawPlayoffTeamList ...
        resb 4
CardSlideBmp:                                   ; player card slide bitmap; used by LoadPlayerCardArt,
                                                ; PlayerCardScreen, SwitchPlayerCard
        resb 4
CardRemapIndex:                                 ; player card remap index; used by PlayerCardScreen,
                                                ; SwitchPlayerCard
        resb 4
CardTitleTime:                                  ; tick count for the next card title frame; used by
                                                ; ShowPlayerCardTitle
        resb 4
CardXlatTable:                                  ; player card colour translation table; used by
                                                ; LoadPlayerCardArt, PlayerCardScreen
        resb 4
CardSlideStep:                                  ; player card slide step; used by PlayerCardScreen,
                                                ; SwitchPlayerCard
        resb 4
CardTitleShown:                                 ; player card title has been shown; used by
                                                ; DrawPlayerCardName, PlayerCardScreen, ShowPlayerCardTitle
        resb 4
