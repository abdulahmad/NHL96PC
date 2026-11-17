; Input: NumLockOff, InstallHotkeys.
bits 32
%include "hockey.inc"
section s_B3145 progbits alloc exec nowrite align=1
extern AskExitToDos, JoystickCalibrateScreen, KbdPeekKey, PauseUntilKey, SetHotkey, SetHotkey_5B, SetHotkey_81, ShowKeyboardOn
global NumLockOff, InstallHotkeys
;-----------------------------------------------------------------------------
; NumLockOff                                   B3145  96 PC, medium confidence
; Turns Num Lock off in the BIOS keyboard flags
;-----------------------------------------------------------------------------
NumLockOff:
        and byte [0417h], 0DFh
        call KbdPeekKey
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; InstallHotkeys                                  B3160  96 PC, low confidence
; Sets the debug hotkeys (joystick calibration, keyboard display and others)
;-----------------------------------------------------------------------------
InstallHotkeys:
        push JoystickCalibrateScreen
        push byte 0Ah
        call SetHotkey
        add esp, byte 8
        push ShowKeyboardOn
        push byte 0Bh
        call SetHotkey
        add esp, byte 8
        push PauseUntilKey
        push byte 10h
        call SetHotkey
        add esp, byte 8
        push SetHotkey_81
        push dword 3200h
        call SetHotkey
        add esp, byte 8
        push SetHotkey_5B
        push byte 13h
        call SetHotkey
        add esp, byte 8
        push AskExitToDos
        push byte 18h
        call SetHotkey
        add esp, byte 8
        ret
