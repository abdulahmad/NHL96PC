; Initialised data of front/menu (src/front/menu).
bits 32
%include "hockey.inc"
section s_11D1A8 progbits alloc noexec write align=1
global MenuMouseX, MenuMouseY, MenuMouseButtons, MenuViewStored, MenuLinkActive, MenuClipActive, MenuInputPaused, MenuMoveSfx
global MenuSelectSfx, MenuInputReady
MenuMouseX:                                     ; Menu mouse x; used by ControlSetupScreen, DrawTreeLine,
                                                ; EditLinesHoverPanel ...
        db 00h,00h,00h,00h
MenuMouseY:                                     ; Menu mouse y; used by DrawTreeLine, EditLinesHoverPanel,
                                                ; EditLinesScreen ...
        db 00h,00h,00h,00h
MenuMouseButtons:                               ; Menu mouse buttons; used by PollMenuInput, RunMenu
        db 00h,00h,00h,00h
MenuViewStored:                                 ; Set while the menu view is saved; used by
                                                ; EditLinesHoverPanel, EditLinesScreen, RunMenu
        db 00h,00h
MenuLinkActive:                                 ; Set when the menu is driven over a link; used by RunMenu,
                                                ; SetMenuMouse
        db 00h,00h
MenuClipActive:                                 ; Set while the menu clip rectangle is used; used by RunMenu,
                                                ; SetGameBackdrop
        db 00h,00h
MenuInputPaused:                                ; Menu input paused; used by PollMenuInput, SetGameBackdrop
        db 00h,00h
MenuMoveSfx:                                    ; Menu move sound, -1 for none; used by PollMenuInput,
                                                ; SetMenuMoveSfx
        db 0FFh,0FFh,0FFh,0FFh
MenuSelectSfx:                                  ; Menu select sound, -1 for none; used by RunMenu,
                                                ; SetMenuSelectSfx
        db 0FFh,0FFh,0FFh,0FFh
MenuInputReady:                                 ; Menu input ready; used by PollMenuInput
        db 00h,00h,00h,00h
