; Watcom C runtime: sprintf_.
bits 32
%include "hockey.inc"
section s_ADC18 progbits alloc exec nowrite align=1
extern __prtf_, mem_putc_
global sprintf_
;-----------------------------------------------------------------------------
; sprintf_                                                      ADC18  library
; Run-time library sprintf: formats into a string
;-----------------------------------------------------------------------------
sprintf_:
        push ebx
        push ecx
        push edx
        sub esp, byte 4
        lea eax, [byte esp+01Ch]
        mov edx, dword [byte esp+018h]
        mov ebx, esp
        mov ecx, mem_putc_
        mov dword [esp], eax
        mov eax, dword [byte esp+014h]
        call __prtf_
        mov edx, dword [byte esp+014h]
        mov byte [edx+eax], 0
        add esp, byte 4
        pop edx
        pop ecx
        pop ebx
        ret
