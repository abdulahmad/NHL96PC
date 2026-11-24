; Initialised data of the input, EA and Watcom library files from input_mouse on (src/lib), in link order.
bits 32
%include "hockey.inc"
section s_11F568 progbits alloc noexec write align=1
global mouseminx, mouseminy, mousemaxx, mousemaxy, MouseDeltaX, MouseButtonState, MouseSavedSensX, MouseSavedSensY
global MouseSavedThreshold, MouseForceTwoButtons, GraphicsReady, MousePresent, mousex, mousey, MouseMoved, PointerCount
global MouseButtons, joyenablemask, ViewScreenWidth, ViewScreenHeight, MenuScreenBitmap, ScreenPitch, ScreenBuffer, ScreenModeWidth
global ScreenModeHeight
mouseminx:                                      ; used by MouseRead, MouseReadMotion, PollMenuInput ...
        db 00h,00h,00h,00h
mouseminy:                                      ; mouse library: pointer range, top; used by MouseRead,
                                                ; MouseReadMotion, PollMenuInput ...
        db 00h,00h,00h,00h
mousemaxx:                                      ; mouse library: pointer range, right (exclusive); used by
                                                ; MouseRead, MouseReadMotion, PollMenuInput ...
        db 040h,01h,00h,00h
mousemaxy:                                      ; mouse library: pointer range, bottom (exclusive); used by
                                                ; MouseRead, MouseReadMotion, PollMenuInput ...
        db 0C8h,00h,00h,00h
MouseDeltaX:                                    ; mouse motion X since the last read; used by MouseReadMotion
        db 00h,00h,00h,00h
MouseButtonState:                               ; mouse button state; used by MouseReadButtons,
                                                ; MouseReadMotion
        db 01h,00h,00h,00h
MouseSavedSensX:                                ; mouse X sensitivity saved at start up; used by InitMouse,
                                                ; MouseRestoreSensitivity
        db 00h,00h
MouseSavedSensY:                                ; mouse Y sensitivity saved at start up; used by InitMouse,
                                                ; MouseRestoreSensitivity
        db 00h,00h
MouseSavedThreshold:                            ; mouse double speed threshold saved at start up; used by
                                                ; InitMouse, MouseRestoreSensitivity
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h
MouseForceTwoButtons:                           ; treat the mouse as two buttons; used by InitMouse
        db 00h,00h,00h,00h,01h,00h,00h,00h
GraphicsReady:                                  ; graphics are set up; used by DumpMemoryMap, FatalError,
                                                ; InitSystem ...
        db 00h,00h,00h,00h
MousePresent:                                   ; mouse driver found; used by InitMouse, InitPointer,
                                                ; InitSystem ...
        db 00h,00h,00h,00h
mousex:                                         ; used by ControlPicksScreen, ControlSetupScreen,
                                                ; ControllerScreen ...
        db 00h,00h,00h,00h
mousey:                                         ; used by ControlPicksScreen, ControlSetupScreen,
                                                ; ControllerScreen ...
        db 00h,00h,00h,00h
MouseMoved:                                     ; mouse moved since the last read; used by MouseReadMotion,
                                                ; PointerService, UpdatePointerPos
        db 00h,00h,00h,00h
PointerCount:                                   ; mouse pointer show count; used by HidePointer,
                                                ; HidePointerKeep, InitMouse ...
        db 00h,00h,00h,00h
MouseButtons:                                   ; mouse buttons; used by InitMouse
        db 00h,00h,00h,00h
joyenablemask:                                  ; used by JoyResetCentres, JoystickCalibrateScreen,
                                                ; ReadJoystickPorts ...
        db 00h,00h,00h,00h
ViewScreenWidth:                                ; full screen width the game view is sized against; used by
                                                ; AddZone, CenterMouse, ControllerUsersPanel ...
        db 00h,00h,00h,00h
ViewScreenHeight:                               ; full screen height the game view is sized against; used by
                                                ; AddZone, CenterMouse, ControllerUsersPanel ...
        db 00h,00h,00h,00h
MenuScreenBitmap:                               ; menu screen bitmap; used by CreateBitmap, CreateBitmapDepth,
                                                ; InitSystem ...
        db 00h,00h,00h,00h
ScreenPitch:                                    ; screen pitch; used by TgvShowFrameRate, initgraphics
        db 00h,00h,00h,00h
ScreenBuffer:                                   ; screen buffer; used by TgvShowFrameRate, initgraphics
        db 00h,00h,00h,00h
ScreenModeWidth:                                ; screen mode width; used by initgraphics
        db 040h,01h,00h,00h
ScreenModeHeight:                               ; screen mode height; used by initgraphics
        db 0C8h,00h,00h,00h
