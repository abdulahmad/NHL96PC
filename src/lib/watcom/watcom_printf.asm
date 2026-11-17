; Watcom C runtime: printf_, chdir_.
bits 32
%include "hockey.inc"
section s_B2C98 progbits alloc exec nowrite align=1
extern __fprtf_, __set_errno_dos_, __stdout_buf
global printf_, chdir_
;-----------------------------------------------------------------------------
; printf_                                                       B2C98  library
; Run-time library printf: formats to standard output
;-----------------------------------------------------------------------------
printf_:
        push ebx
        push edx
        sub esp, byte 4
        lea ebx, [byte esp+014h]
        mov eax, __stdout_buf
        mov edx, dword [byte esp+010h]
        mov dword [esp], ebx
        mov ebx, esp
        call __fprtf_
        add esp, byte 4
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; chdir_                                                        B2CBA  library
; Run-time library chdir: changes the current directory
;-----------------------------------------------------------------------------
chdir_:
        push edx
        mov edx, eax
        mov ah, 3Bh
        int 21h
        rcl eax, 1
        ror eax, 1
        test eax, eax
        jge short .1
        and eax, 0FFFFh
        call __set_errno_dos_
        pop edx
        ret
.1:
        xor eax, eax
        pop edx
        ret
