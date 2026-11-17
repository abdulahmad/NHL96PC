; Watcom C runtime: outp_, inp_.
bits 32
%include "hockey.inc"
section s_DA5AF progbits alloc exec nowrite align=1
global outp_, inp_
;-----------------------------------------------------------------------------
; outp_                                                         DA5AF  library
; Run-time library outp: writes a byte to an I/O port
;-----------------------------------------------------------------------------
outp_:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        mov edx, eax
        mov al, cl
        out dx, al
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; inp_                                                          DA5BD  library
; Run-time library inp: reads a byte from an I/O port
;-----------------------------------------------------------------------------
inp_:
        push edx
        mov edx, eax
        sub eax, eax
        in al, dx
        pop edx
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
