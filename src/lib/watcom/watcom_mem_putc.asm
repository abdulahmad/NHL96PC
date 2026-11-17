; Watcom C runtime: mem_putc_.
bits 32
%include "hockey.inc"
section s_ADC05 progbits alloc exec nowrite align=1
global mem_putc_
;-----------------------------------------------------------------------------
; mem_putc_                                                     ADC05  library
; Run-time library: stores one character into a memory string stream (sprintf output)
;-----------------------------------------------------------------------------
mem_putc_:
        push ebx
        push ecx
        mov bl, dl
        mov edx, dword [eax]
        lea ecx, [byte edx+01h]
        mov dword [eax], ecx
        mov byte [edx], bl
        inc dword [byte eax+010h]
        pop ecx
        pop ebx
        ret
