; Initialised data of front/postgame (src/front/postgame).
bits 32
%include "hockey.inc"
section s_114DD2 progbits alloc noexec write align=1
global GameStatsLabelX, GameStatsTop, GameStatsRight, GameStatsColX, GameStatsLabelPos, GameStatsRowStep, GameStatsScroll, StarsSlideFrom
global StarsSlideTo, StarsSlideTarget, StarsSpritePath, StarsCardX, StarsCardY, StarsNameX, StarsNameXs, StarsTextX
global StarsTextXs, StarsRandomTimer, StarsTimerFace, StarsTimerName, StarsTimerCard, StarsShowFaces, StarsShowNames, StarsShowCards
global StarsPhase, StarsCurrent
GameStatsLabelX:                                ; Game stats page: label column x; used by DrawGameStats
        db 03Ch,01h
GameStatsTop:                                   ; Game stats page: first row y; used by DrawGameStats
        db 082h,00h
GameStatsRight:                                 ; Game stats page: right edge; used by DrawGameStats
        db 0FCh,01h
GameStatsColX:                                  ; Game stats page: column x positions; used by DrawGameStats
        db 0A9h,00h,037h,01h
GameStatsLabelPos:                              ; Game stats page: label positions (part of the column table);
                                                ; used by DrawGameStats, GameStatsScreen
        db 07Eh,00h,0ABh,00h,0D8h,00h,08h,01h
GameStatsRowStep:                               ; Game stats page: row spacing; used by GameStatsScreen
        db 038h,01h
GameStatsScroll:                                ; Game stats page: page shown; used by DrawGameStats,
                                                ; GameStatsScreen
        db 00h,00h
StarsSlideFrom:                                 ; Three stars screen: slide start positions; used by
                                                ; AnimateStarsScreen
        db 00h,00h,00h,00h,05Ah,00h,00h,00h
StarsSlideTo:                                   ; Three stars screen: slide end positions; used by
                                                ; AnimateStarsScreen
        db 040h,01h,00h,00h
StarsSlideTarget:                               ; Three stars screen: slide target positions; used by
                                                ; AnimateStarsScreen
        db 05Ah,00h,00h,00h,040h,01h,00h,00h
StarsSpritePath:                                ; Three stars screen: sprite path points; used by
                                                ; AnimateStarsScreen
        db 0DAh,00h,00h,00h,00h,00h,00h,00h,0DBh,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,07h,02h,00h,00h
        db 04Ch,00h,00h,00h,07Fh,02h,00h,00h,04Ch,00h,00h,00h,07Fh,02h,00h,00h
        db 01Fh,01h,00h,00h,07h,02h,00h,00h,01Fh,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01Eh,01h,00h,00h
        db 05h,01h,00h,00h,0A9h,01h,00h,00h,05h,01h,00h,00h,0A9h,01h,00h,00h
        db 04Fh,01h,00h,00h,01Eh,01h,00h,00h,04Fh,01h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
StarsCardX:                                     ; Three stars screen: card x; used by AnimateStarsScreen
        db 0FEh,00h,00h,00h
StarsCardY:                                     ; Three stars screen: card y; used by AnimateStarsScreen
        db 09Dh,00h,00h,00h
StarsNameX:                                     ; Three stars screen: name x; used by ThreeStarsScreen
        db 036h,02h,00h,00h
StarsNameXs:                                    ; Three stars screen: name x per star; used by
                                                ; ThreeStarsScreen
        db 0A0h,00h,00h,00h,0EAh,00h,00h,00h,0ABh,01h,00h,00h,0F6h,01h,00h,00h
        db 0D8h,00h,00h,00h,01Eh,02h,00h,00h,0B8h,01h,00h,00h
StarsTextX:                                     ; Three stars screen: text x; used by ThreeStarsScreen
        db 0EBh,00h,00h,00h
StarsTextXs:                                    ; Three stars screen: text x per star; used by
                                                ; ThreeStarsScreen
        db 05h,01h,00h,00h,06Ah,01h,00h,00h,0D8h,00h,00h,00h,019h,02h,00h,00h
        db 03Fh,01h,00h,00h
StarsRandomTimer:                               ; tick count for the next random three stars animation; used
                                                ; by AnimateStarsScreen, ThreeStarsScreen
        db 00h,00h,00h,00h
StarsTimerFace:                                 ; Three stars screen: face timer; used by AnimateStarsScreen,
                                                ; ThreeStarsScreen
        db 00h,00h,00h,00h
StarsTimerName:                                 ; Three stars screen: name timer; used by AnimateStarsScreen,
                                                ; ThreeStarsScreen
        db 00h,00h,00h,00h
StarsTimerCard:                                 ; Three stars screen: card timer; used by AnimateStarsScreen,
                                                ; ThreeStarsScreen
        db 00h,00h,00h,00h
StarsShowFaces:                                 ; Three stars screen: faces shown; used by AnimateStarsScreen,
                                                ; ThreeStarsScreen
        db 00h,00h
StarsShowNames:                                 ; Three stars screen: names shown; used by AnimateStarsScreen,
                                                ; ThreeStarsScreen
        db 00h,00h
StarsShowCards:                                 ; Three stars screen: cards shown; used by AnimateStarsScreen,
                                                ; ThreeStarsScreen
        db 00h,00h
StarsPhase:                                     ; Three stars screen: phase (2 when done); used by
                                                ; AnimateStarsScreen, ThreeStarsScreen
        db 00h,00h
StarsCurrent:                                   ; Three stars screen: star being shown; used by
                                                ; AnimateStarsScreen, ThreeStarsScreen
        db 00h,00h,00h,00h
