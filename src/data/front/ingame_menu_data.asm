; Initialised data of front/ingame_menu (src/front/ingame_menu).
bits 32
%include "hockey.inc"
section s_11ED30 progbits alloc noexec write align=1
global InGameMenuStartTick, InGameMenuDrawn
InGameMenuStartTick:                            ; tick count when the in-game menu opened; used by
                                                ; DrawInGameMenuFrame, InGameMenu, InGameReturnMenu ...
        db 00h,00h,00h,00h
InGameMenuDrawn:                                ; in-game menu frame has been drawn; used by
                                                ; DrawInGameMenuFrame, InGameReturnMenu
        db 00h,00h,00h,00h
