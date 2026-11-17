; Watcom C runtime: __CHP.
bits 32
%include "hockey.inc"
section s_BC73C progbits alloc exec nowrite align=1
global __CHP
;-----------------------------------------------------------------------------
; __CHP                                                         BC73C  library
; Run-time library: rounds the x87 top of stack to an integer (chop)
;-----------------------------------------------------------------------------
__CHP:
        push eax
        wait
        fnstcw word [esp]
        wait
        push dword [esp]
        mov byte [byte esp+01h], 1Fh
        fldcw word [esp]
        frndint
        fldcw word [byte esp+04h]
        wait
        lea esp, [byte esp+08h]
        ret
