; Watcom C runtime: abs_.
bits 32
%include "hockey.inc"
section s_BF949 progbits alloc exec nowrite align=1
global abs_
;-----------------------------------------------------------------------------
; abs_                                                          BF949  library
; Run-time library abs: the absolute value of an integer
;-----------------------------------------------------------------------------
abs_:
        test eax, eax
        jge short .1
        neg eax
.1:
        ret
