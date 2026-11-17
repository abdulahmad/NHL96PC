; Input: PollHotkeys.
bits 32
%include "hockey.inc"
section s_E1927 progbits alloc exec nowrite align=1
extern DispatchHotkey, KbdGetKey
global PollHotkeys
;-----------------------------------------------------------------------------
; PollHotkeys                                     E1927  96 PC, low confidence
; Reads a key and dispatches its hotkey handler
;-----------------------------------------------------------------------------
PollHotkeys:
        call KbdGetKey
        LD or, eax, eax
        je short .1
        push eax
        call DispatchHotkey
        add esp, byte 4
.1:
        ret
        db 00h,00h
