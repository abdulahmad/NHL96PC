; EA library: ShowKeyboardOn.
bits 32
%include "hockey.inc"
section s_C59DF progbits alloc exec nowrite align=1
extern joyenablemask, ShowMessageBox, str_KEYBOARDON
global ShowKeyboardOn
        db 00h
;-----------------------------------------------------------------------------
; ShowKeyboardOn                                  C59E0  96 PC, low confidence
; Shows the keyboard on message
;-----------------------------------------------------------------------------
ShowKeyboardOn:
        push byte 8
        xor edx, edx
        push str_KEYBOARDON
        mov dword [joyenablemask], edx
        call ShowMessageBox
        add esp, byte 8
        ret
