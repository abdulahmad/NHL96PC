; Initialised data of front/pause_menu (src/front/pause_menu).
bits 32
%include "hockey.inc"
section s_11D7A0 progbits alloc noexec write align=1
global InGameMenuRequest, InGameMenuItems, PauseMenuItemsShort, InGameMenuLayout, PauseMenuItemsLong, InGameBoxXList, InGameBoxYList, PauseMenuBoxX
global PauseMenuBoxY, PauseMenuTextIds, PauseMenuTextIdsAlt, ControllerSlotX, ControllerSlotY, MenuFrameColours, InMenuOverlay, PauseRedraw
global PauseMenuOpen, PauseFrameDrawn
InGameMenuRequest:                              ; 1 pause menu, 2 replay menu, 3 other; used by
                                                ; Gameloop_gameovercall, Gameloop_hotkeyscall,
                                                ; Gameloop_inputcheck ...
        db 00h,00h,00h,00h
InGameMenuItems:                                ; in-game menu item list; used by InGameMenu, PauseGame
        db 04h,00h,01Bh,00h,032h,00h,037h,00h,08h,01h,0Dh,01h,023h,01h,03Bh,01h
        db 042h,00h,047h,00h,0BFh,00h,0FBh,00h
PauseMenuItemsShort:                            ; short pause menu item list; used by InGameMenu, PauseGame
        db 02h,00h,016h,00h,02Ah,00h,02Ch,00h,03Ah,00h,049h,00h,060h,00h,0Fh,00h
        db 0A8h,00h,0ADh,00h,0AFh,00h,0C3h,00h
InGameMenuLayout:                               ; in-game menu box layout; used by InGameMenu, PauseGame
        db 09h,00h,038h,00h,066h,00h,06Dh,00h,010h,02h,019h,02h,048h,02h,076h,02h
        db 087h,00h,095h,00h,07Bh,01h,0F6h,01h
PauseMenuItemsLong:                             ; long pause menu item list; used by InGameMenu, PauseGame
        db 06h,00h,036h,00h,064h,00h,06Ah,00h,08Ah,00h,098h,00h,0C4h,00h,022h,00h
        db 093h,01h,09Dh,01h,0A1h,01h,0CEh,01h
InGameBoxXList:                                 ; in-game menu box X positions; used by InGameMenu, PauseGame
        db 04Eh,00h,0A7h,00h,07Dh,00h
InGameBoxYList:                                 ; in-game menu box Y positions; used by InGameMenu, PauseGame
        db 046h,00h,05Dh,00h,07Fh,00h
PauseMenuBoxX:                                  ; pause menu box x positions; used by InGameMenu, PauseGame
        db 088h,00h,046h,01h,0EBh,00h
PauseMenuBoxY:                                  ; pause menu box y positions; used by InGameMenu, PauseGame
        db 0ABh,00h,0EBh,00h,02Dh,01h
PauseMenuTextIds:                               ; pause menu text ids; used by InGameMenu, PauseMenu
        db 03Bh,00h,00h,00h,080h,00h,00h,00h,06Dh,00h,00h,00h,0A1h,00h,00h,00h
        db 03Ch,00h,00h,00h,0A3h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01h,01h,00h,00h,080h,00h,00h,00h,00h,01h,00h,00h,0A1h,00h,00h,00h
        db 0D1h,00h,00h,00h,0A0h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
PauseMenuTextIdsAlt:                            ; pause menu text ids when the option bit is set; used by
                                                ; InGameMenu, PauseMenu
        db 07Bh,00h,00h,00h,031h,01h,00h,00h,0DDh,00h,00h,00h,079h,01h,00h,00h
        db 079h,00h,00h,00h,079h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0FEh,01h,00h,00h,033h,01h,00h,00h,0FFh,01h,00h,00h,07Ch,01h,00h,00h
        db 09Bh,01h,00h,00h,07Ch,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h
ControllerSlotX:                                ; controller screen slot x position; used by ControllerScreen
        db 00h,00h,00h,00h
ControllerSlotY:                                ; controller screen slot y position; used by ControllerScreen
        db 00h,00h,00h,00h,00h,00h,00h,00h
MenuFrameColours:                               ; in-game menu frame colours; used by DrawInGameMenuFrame,
                                                ; InGameMenu, PauseGame ...
        db 030h
        db 00h,041h
InMenuOverlay:                                  ; set while a menu overlays the game; used by
                                                ; CopyZonesToScreen, DrawDirtyZones, DrawGameFrame ...
        db 00h,00h,00h,00h
PauseRedraw:                                    ; pause screen needs redrawing; used by DrawPauseFrame,
                                                ; PauseGame, RunPausedFrame
        db 01h,00h,00h,00h
PauseMenuOpen:                                  ; pause menu is open; used by PauseBackToGame, PauseGame,
                                                ; PauseMenu
        db 01h,00h
PauseFrameDrawn:                                ; pause frame has been drawn; used by DrawPauseFrame,
                                                ; PauseGame
        db 00h,00h,00h
