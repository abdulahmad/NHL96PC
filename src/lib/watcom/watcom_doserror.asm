; Watcom C runtime: __doserror_, unlink_.
bits 32
%include "hockey.inc"
section s_C6052 progbits alloc exec nowrite align=1
extern __set_errno_dos_
global __doserror_, unlink_
;-----------------------------------------------------------------------------
; __doserror_                                                   C6052  library
; Run-time library: sets errno from a DOS error
;-----------------------------------------------------------------------------
__doserror_:
        jae short .1
        and eax, 0FFFFh
        push eax
        call __set_errno_dos_
        pop eax
        jmp short .2
.1:
        sub eax, eax
.2:
        ret
;-----------------------------------------------------------------------------
; unlink_                                                       C6065  library
; Run-time library unlink: deletes a file
;-----------------------------------------------------------------------------
unlink_:
        push edx
        mov edx, eax
        mov ah, 41h
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
