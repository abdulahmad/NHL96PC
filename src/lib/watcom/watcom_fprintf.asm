; Watcom C runtime: fprintf_.
bits 32
%include "hockey.inc"
section s_BE939 progbits alloc exec nowrite align=1
extern __fprtf_
global fprintf_
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; fprintf_                                                      BE93C  library
; Run-time library fprintf: formats to a stream
;-----------------------------------------------------------------------------
fprintf_:
        push ebx
        push edx
        sub esp, byte 4
        lea ebx, [byte esp+018h]
        mov eax, dword [byte esp+010h]
        mov edx, dword [byte esp+014h]
        mov dword [esp], ebx
        mov ebx, esp
        call __fprtf_
        add esp, byte 4
        db 05Ah                                 ; insn: pop edx
        db 05Bh                                 ; insn: pop ebx
        ret
