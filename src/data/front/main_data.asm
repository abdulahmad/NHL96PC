; Initialised data of front/main (src/front/main).
bits 32
%include "hockey.inc"
section s_1150D4 progbits alloc noexec write align=1
extern str_KWKJSKxxxxxx
global FrontShapesFile, SaveFileHandle, CpuTestPattern
FrontShapesFile:                                ; front end shape file; used by OpenFrontEndFromGame,
                                                ; PauseBackToGame, PauseToFrontEnd ...
        db 00h,00h,00h,00h
SaveFileHandle:                                 ; save file handle (-1 when closed); used by ControllerScreen,
                                                ; HighlightsMenu, LoadGameRosters ...
        db 0FFh,0FFh,0FFh,0FFh
CpuTestPattern:                                 ; CPU test pattern pointer; used by StartUp
        dd str_KWKJSKxxxxxx
