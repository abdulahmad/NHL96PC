; Watcom C runtime: isatty_, _dosret0_, __set_errno_dos_, __IOMode_, __SetIOMode_.
bits 32
%include "hockey.inc"
section s_C4EA1 progbits alloc exec nowrite align=1
extern __io_mode, __NHandles, __set_doserrno_, __set_errno_, _osmajor, DosErrnoTable
global isatty_, _dosret0_, __set_errno_dos_, __IOMode_, __SetIOMode_
;-----------------------------------------------------------------------------
; isatty_                                                       C4EA1  library
; Run-time library isatty: whether a handle is a terminal
;-----------------------------------------------------------------------------
isatty_:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov al, 0
        mov ah, 44h
        int 21h
        rcl edx, 1
        ror edx, 1
        test dl, 80h
        setne al
        and eax, 0FFh
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; _dosret0_                                                     C4EBF  library
; Run-time library: returns 0 or sets errno from a DOS call
;-----------------------------------------------------------------------------
_dosret0_:
        test edx, edx
        jne short .1
        xor eax, eax
        ret
.1:
        test edx, edx
        jne short __set_errno_dos_
        ret
;-----------------------------------------------------------------------------
; __set_errno_dos_                                              C4ECB  library
; Run-time library: stores a DOS error code and maps it to errno
;-----------------------------------------------------------------------------
__set_errno_dos_:
        push ebx
        push edx
        mov edx, eax
        mov bl, al
        xor eax, eax
        mov al, dl
        call __set_doserrno_
        cmp edx, 100h
        jae short .5
        cmp byte [_osmajor], 3
        jb short .3
        cmp dl, 50h
        jne short .1
        mov bl, 0Eh
        jmp short .3
.1:
        cmp dl, 22h
        jb short .2
        mov bl, 13h
        jmp short .3
.2:
        cmp dl, 20h
        jb short .3
        mov bl, 5
.3:
        cmp bl, 13h
        jbe short .4
        mov bl, 13h
.4:
        xor edx, edx
        mov dl, bl
        mov eax, dword [dword edx+DosErrnoTable]
        sar eax, 18h
        jmp short .6
.5:
        mov eax, edx
        shr eax, 8
        and eax, 0FFh
.6:
        call __set_errno_
        mov eax, 0FFFFFFFFh
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __IOMode_                                                     C4F31  library
; Run-time library: the mode bits of a file handle
;-----------------------------------------------------------------------------
__IOMode_:
        push ebx
        push ecx
        push edx
        mov edx, eax
        cmp eax, dword [__NHandles]
        jb short .1
        xor eax, eax
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        cmp eax, byte 5
        jg short .2
        mov ebx, eax
        mov eax, dword [__io_mode]
        shl ebx, 2
        add eax, ebx
        mov cl, byte [byte eax+01h]
        test cl, 40h
        jne short .2
        mov ch, cl
        or ch, 40h
        mov byte [byte eax+01h], ch
        mov eax, edx
        call isatty_
        test eax, eax
        je short .2
        mov eax, dword [__io_mode]
        or byte [byte ebx+eax+01h], 20h
.2:
        mov eax, dword [__io_mode]
        mov eax, dword [eax+edx*4]
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __SetIOMode_                                                  C4F86  library
; Run-time library: sets the mode bits of a file handle
;-----------------------------------------------------------------------------
__SetIOMode_:
        push ebx
        or dh, 40h
        mov ebx, edx
        mov edx, eax
        mov eax, dword [__io_mode]
        shl edx, 2
        mov dword [edx+eax], ebx
        pop ebx
        ret
