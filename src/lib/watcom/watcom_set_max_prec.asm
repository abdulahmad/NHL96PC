; Watcom C runtime: _SetMaxPrec_.
bits 32
%include "hockey.inc"
section s_DB9F4 progbits alloc exec nowrite align=1
extern MaxPrecision
global _SetMaxPrec_
;-----------------------------------------------------------------------------
; _SetMaxPrec_                                                  DB9F4  library
; Run-time library: limits the precision of a float format
;-----------------------------------------------------------------------------
_SetMaxPrec_:
        mov dword [MaxPrecision], eax
        ret
