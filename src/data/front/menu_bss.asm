; BSS of front/menu (src/front/menu).
bits 32
%include "hockey.inc"
section s_17C3E4 nobits alloc noexec write align=1
global MenuLastMouseX, MenuLastMouseY, MenuLastButtons, MenuButtons, MenuViewTop, MenuViewBottom, MenuViewLeft, MenuViewRight
global MenuRemoteItem, MenuRemoteLayer, MenuLocalCursorY, MenuLocalCursorX, MenuItemLeaveFunc, MenuLocalLayer, MenuCurrentItem, MenuSavedRemoteArt
global MenuLocalItem, MenuRemoteCursorY, MenuRemoteCursorX, MenuSavedCursorArt, MenuViewCallback, MenuItemEnterFunc, MenuItemHoverFunc, MenuItemExitFunc
global MenuRepeatTick, MenuBackdropBmp, MenuBackdropPixels, MenuSavedViewWidth, MenuSavedViewHeight, MenuLinkKey, MenuCursorArt, MenuBitmapReady
global MenuStarted, MenuViewSaved, MenuCursorX, MenuCursorY, MenuCursorShown, MenuMouseMode, MenuStartSelection, ArenaClipName
MenuLastMouseX:                                 ; Menu mouse x last frame; used by PollMenuInput, RunMenu
        resb 4
MenuLastMouseY:                                 ; Menu mouse y last frame; used by PollMenuInput, RunMenu
        resb 4
MenuLastButtons:                                ; Menu mouse buttons last frame; used by PollMenuInput,
                                                ; RunMenu
        resb 4
MenuButtons:                                    ; Menu mouse buttons this frame; used by PollMenuInput,
                                                ; RunMenu
        resb 4
MenuViewTop:                                    ; Menu view top; used by RunMenu, SetGameBackdrop
        resb 4
MenuViewBottom:                                 ; Menu view bottom; used by RunMenu
        resb 4
MenuViewLeft:                                   ; Menu view left; used by RunMenu, SetGameBackdrop
        resb 4
MenuViewRight:                                  ; Menu view right; used by RunMenu
        resb 4
MenuRemoteItem:                                 ; menu item under the remote cursor; used by RunMenu
        resb 4
MenuRemoteLayer:                                ; remote cursor draw layer; used by RunMenu
        resb 4
MenuLocalCursorY:                               ; local cursor y; used by RunMenu
        resb 4
MenuLocalCursorX:                               ; local cursor x; used by RunMenu
        resb 4
MenuItemLeaveFunc:                              ; menu item leave routine; used by RunMenu
        resb 4
MenuLocalLayer:                                 ; local cursor draw layer; used by RunMenu
        resb 4
MenuCurrentItem:                                ; Menu item under the cursor; used by RunMenu
        resb 4
MenuSavedRemoteArt:                             ; saved remote cursor art; used by RunMenu
        resb 4
MenuLocalItem:                                  ; menu item under the local cursor; used by RunMenu
        resb 4
MenuRemoteCursorY:                              ; remote cursor y; used by RunMenu
        resb 4
MenuRemoteCursorX:                              ; remote cursor x; used by RunMenu
        resb 4
MenuSavedCursorArt:                             ; Saved cursor art; used by RunMenu
        resb 4
MenuViewCallback:                               ; Routine called when the menu view is restored; used by
                                                ; RunMenu, SetGameBackdrop
        resb 4
MenuItemEnterFunc:                              ; menu item enter routine; used by RunMenu
        resb 4
MenuItemHoverFunc:                              ; Menu item hover routine; used by RunMenu
        resb 4
MenuItemExitFunc:                               ; Menu item leave routine; used by RunMenu
        resb 4
MenuRepeatTick:                                 ; Tick of the next menu key repeat; used by PollMenuInput
        resb 4
MenuBackdropBmp:                                ; Menu backdrop bitmap; used by RunMenu, SetGameBackdrop
        resb 4
MenuBackdropPixels:                             ; Menu backdrop pixels; used by RunMenu, SetGameBackdrop
        resb 4
MenuSavedViewWidth:                             ; Saved menu view width; used by GetSavedViewSize, RunMenu
        resb 4
MenuSavedViewHeight:                            ; Saved menu view height; used by GetSavedViewSize, RunMenu
        resb 4
MenuLinkKey:                                    ; Menu key sent over the link; used by PollMenuInput
        resb 4
MenuCursorArt:                                  ; local cursor art; used by RunMenu, SetGameBackdrop
        resb 4
MenuBitmapReady:                                ; Set once the menu bitmaps exist; used by RunMenu,
                                                ; SetGameBackdrop
        resb 4
MenuStarted:                                    ; Set once the menu has started; used by RunMenu
        resb 2
MenuViewSaved:                                  ; set while the menu view is saved; used by RunMenu
        resb 2
MenuCursorX:                                    ; Local cursor x; used by RunMenu
        resb 2
MenuCursorY:                                    ; Local cursor y; used by RunMenu
        resb 2
MenuCursorShown:                                ; Cursor shown; used by RunMenu
        resb 2
MenuMouseMode:                                  ; Menu mouse mode; used by RunMenu, SetMenuMouse
        resb 2
MenuStartSelection:                             ; Selection the next menu starts on; used by RunMenu,
                                                ; SetMenuMouse
        resb 4
ArenaClipName:                                  ; Arena clip file name; used by PlayArenaClip
        resb 40
