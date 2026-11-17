; Watcom C runtime: __setEFGfmt_, ReturnFalse.
bits 32
%include "hockey.inc"
section s_CFDF1 progbits alloc exec nowrite align=1
extern __cnvs2d_, __EFG_printf, __EFG_scanf, _EFG_Format_
global __setEFGfmt_, ReturnFalse
;-----------------------------------------------------------------------------
; __setEFGfmt_                                                  CFDF1  library
; Run-time library: installs the float format hook for printf
;-----------------------------------------------------------------------------
__setEFGfmt_:
        push ebx
        push edx
        mov edx, _EFG_Format_
        mov ebx, __cnvs2d_
        mov dword [__EFG_printf], edx
        mov dword [__EFG_scanf], ebx
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ReturnFalse                                     CFE0C  96 PC, low confidence
; Returns 0; the debug viewers' empty check
;-----------------------------------------------------------------------------
ReturnFalse:
        mov eax, 0
        ret
