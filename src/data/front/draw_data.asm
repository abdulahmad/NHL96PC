; Initialised data of front/draw (src/front/draw).
bits 32
%include "hockey.inc"
section s_11D18C progbits alloc noexec write align=1
global textcolor, textshadow, ModeLinear, GraphicsFixOn, StartupPalette, NearestColorCount, NearestColorLimit
textcolor:                                      ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 0Fh,00h,00h,00h
textshadow:                                     ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        db 00h,00h,00h,00h
ModeLinear:                                     ; set when the graphics mode has a linear frame buffer; used
                                                ; by SetGraphicsMode, SetScreenMode, WatchHighlight
        db 02h,00h,00h,00h
GraphicsFixOn:                                  ; Graphics fix on; used by InitGraphicsFix, SetGraphicsMode
        db 00h,00h,00h,00h
StartupPalette:                                 ; Start-up palette; used by SetScreenPalette, StartUp
        db 00h,00h,00h,00h
NearestColorCount:                              ; Colours searched by NearestColor; used by NearestColor,
                                                ; RemapScreenColors
        db 00h,00h,00h,00h
NearestColorLimit:                              ; Nearest colour limit (14h); used by NearestColor,
                                                ; RemapScreenColors
        db 014h,00h,00h,00h
