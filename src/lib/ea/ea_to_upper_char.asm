; EA library: ToUpperChar.
bits 32
%include "hockey.inc"
section s_C5FFD progbits alloc exec nowrite align=1
global ToUpperChar
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; ToUpperChar                                  C6000  96 PC, medium confidence
; Converts a lower case letter to upper case
;-----------------------------------------------------------------------------
ToUpperChar:
        mov eax, dword [byte esp+04h]
        cmp eax, byte 61h
        jb short .1
        cmp eax, byte 7Ah
        ja short .1
        sub al, 20h
.1:
        ret
