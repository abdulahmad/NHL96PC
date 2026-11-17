; DOS/4GW: __EnterWVIDEO_.
bits 32
%include "hockey.inc"
section s_DBF61 progbits alloc exec nowrite align=1
extern WVideoActive
global __EnterWVIDEO_
;-----------------------------------------------------------------------------
; __EnterWVIDEO_                                                DBF61  library
; Run-time library: debugger hook (WVIDEO entry)
;-----------------------------------------------------------------------------
__EnterWVIDEO_:
        cmp byte [WVideoActive], 0
        je short .2
        and edx, 0FFFFh
        push edx
        push eax
        int3
        jmp short .1
        push edi
        push esi
        dec ecx
        inc esp
        inc ebp
        dec edi
.1:
        mov eax, 1
        add esp, byte 8
        ret
.2:
        xor eax, eax
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h
        push edx
        mov edx, dword [byte eax+02h]
        mov eax, dword [byte eax+04h]
        sar edx, 10h
        sar eax, 10h
        imul eax, edx
        add eax, byte 10h
        pop edx
        ret
        db 08Dh,040h,00h
