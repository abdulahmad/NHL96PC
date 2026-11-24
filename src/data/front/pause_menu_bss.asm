; BSS of front/pause_menu (src/front/pause_menu).
bits 32
%include "hockey.inc"
section s_17D4E8 nobits alloc noexec write align=1
global PauseRegBuffer, PauseBoxXs, PauseBoxYs, PauseListH, PauseTitleW, PauseMsgTop, PauseMsgBottom, PauseMsgExtra
global PauseTitleX, PauseListY, PauseMsgTime, PauseFrameBmp, PauseClockArea, PauseTitleItems, PauseItemList, PauseScaleStep
global FrontShapeFile, PauseTextBuf
PauseRegBuffer:                                 ; pause screen register buffer; used by PauseMenu
        resb 4
PauseBoxXs:                                     ; pause menu box x positions in use; used by DrawPauseButtons,
                                                ; PauseGame, PauseMenu
        resb 4
PauseBoxYs:                                     ; pause menu box y positions in use; used by DrawPauseButtons,
                                                ; PauseGame, PauseMenu
        resb 4
PauseListH:                                     ; pause menu list height; used by DrawPauseFrame, PauseGame
        resb 4
PauseTitleW:                                    ; pause menu title width; used by DrawPauseFrame, PauseGame
        resb 4
PauseMsgTop:                                    ; pause screen message, top line; used by PauseGame, PauseMenu
        resb 4
PauseMsgBottom:                                 ; pause screen message, bottom line; used by PauseGame,
                                                ; PauseMenu
        resb 4
PauseMsgExtra:                                  ; pause screen extra message; used by PauseGame
        resb 4
PauseTitleX:                                    ; pause menu title x position; used by DrawPauseFrame,
                                                ; PauseGame
        resb 4
PauseListY:                                     ; pause menu list y position; used by DrawPauseFrame,
                                                ; PauseGame
        resb 4
PauseMsgTime:                                   ; used by DrawPauseFrame, PauseGame, RunPausedFrame
        resb 4
PauseFrameBmp:                                  ; pause menu frame bitmap; used by DrawPauseFrame, PauseGame
        resb 4
PauseClockArea:                                 ; pause clock area; used by DrawPauseFrame, PauseBackToGame,
                                                ; PauseGame ...
        resb 4
PauseTitleItems:                                ; pause menu title items in use; used by DrawPauseButtons,
                                                ; DrawPauseFrame, PauseGame
        resb 4
PauseItemList:                                  ; pause menu items in use; used by DrawPauseButtons,
                                                ; DrawPauseFrame, PauseGame
        resb 4
PauseScaleStep:                                 ; pause menu scale step; used by DrawPauseFrame, PauseGame
        resb 4
FrontShapeFile:                                 ; front end shape file; used by DrawInGameMenuFrame,
                                                ; DrawPauseButtons, DrawPauseFrame ...
        resb 4
PauseTextBuf:                                   ; pause screen text buffer; used by DrawPauseFrame, PauseMenu
        resb 52
