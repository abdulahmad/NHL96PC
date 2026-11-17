; Watcom C runtime: flushall_.
bits 32
%include "hockey.inc"
section s_D01B0 progbits alloc exec nowrite align=1
global flushall_
;-----------------------------------------------------------------------------
; flushall_                                                     D01B0  library
; Run-time library flushall: writes out every stream
;-----------------------------------------------------------------------------
flushall_:
        mov eax, 0FFFFFFFFh
