; Watcom C runtime: __CommonInit_.
bits 32
%include "hockey.inc"
section s_D069B progbits alloc exec nowrite align=1
extern __amblksiz
global __CommonInit_
;-----------------------------------------------------------------------------
; __CommonInit_                                                 D069B  library
; Run-time library: common start-up (DPMI lock of the DS restore code)
;-----------------------------------------------------------------------------
__CommonInit_:
        mov dword [__amblksiz], 8000h
        ret
