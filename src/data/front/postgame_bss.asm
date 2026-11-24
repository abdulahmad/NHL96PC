; BSS of front/postgame (src/front/postgame).
bits 32
%include "hockey.inc"
section s_151AE4 nobits alloc noexec write align=1
global StarsBgBmp, StarsSaveBmp, StarsFaceBmps, StarsCardBmps, StarsPanelBmp, StarsNameBmps, StarsTitleBmp, StarsAnimStep
global StarsCardBmp, StarsShapeFile, StarsSlideX, StarsSlideY, StarsSlideStep
StarsBgBmp:                                     ; Three stars screen: background bitmap; used by
                                                ; AnimateStarsScreen
        resb 4
StarsSaveBmp:                                   ; Three stars screen: saved background under the cards; used
                                                ; by AnimateStarsScreen
        resb 4
StarsFaceBmps:                                  ; Three stars screen: player face bitmaps; used by
                                                ; AnimateStarsScreen, ThreeStarsScreen
        resb 28
StarsCardBmps:                                  ; Three stars screen: card bitmaps; used by ThreeStarsScreen
        resb 68
StarsPanelBmp:                                  ; Three stars screen: panel bitmap; used by
                                                ; AnimateStarsScreen, ThreeStarsScreen
        resb 4
StarsNameBmps:                                  ; Three stars screen: name bitmaps; used by AnimateStarsScreen
        resb 20
StarsTitleBmp:                                  ; Three stars screen: title bitmap; used by
                                                ; AnimateStarsScreen, ThreeStarsScreen
        resb 4
StarsAnimStep:                                  ; Three stars screen: animation step; used by
                                                ; AnimateStarsScreen, ThreeStarsScreen
        resb 4
StarsCardBmp:                                   ; Three stars screen: card being animated; used by
                                                ; AnimateStarsScreen, ThreeStarsScreen
        resb 4
StarsShapeFile:                                 ; Three stars screen: shape file; used by AnimateStarsScreen,
                                                ; ThreeStarsScreen
        resb 4
StarsSlideX:                                    ; Three stars screen: slide x; used by AnimateStarsScreen,
                                                ; ThreeStarsScreen
        resb 4
StarsSlideY:                                    ; Three stars screen: slide y; used by AnimateStarsScreen
        resb 4
StarsSlideStep:                                 ; Three stars screen: slide step; used by AnimateStarsScreen
        resb 4
