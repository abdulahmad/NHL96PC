; Watcom C runtime: _dos_getdate_, _dos_gettime_.
bits 32
%include "hockey.inc"
section s_B1003 progbits alloc exec nowrite align=1
global _dos_getdate_, _dos_gettime_
        db 00h
;-----------------------------------------------------------------------------
; _dos_getdate_                                                 B1004  library
; Run-time library _dos_getdate: the DOS date
;-----------------------------------------------------------------------------
_dos_getdate_:
        push edx
        push ecx
        push ebx
        mov ebx, eax
        mov ah, 2Ah
        int 21h
        mov word [byte ebx+02h], cx
        mov byte [byte ebx+01h], dh
        mov byte [ebx], dl
        mov byte [byte ebx+04h], al
        sub eax, eax
        pop ebx
        pop ecx
        pop edx
        ret
;-----------------------------------------------------------------------------
; _dos_gettime_                                                 B101F  library
; Run-time library _dos_gettime: the DOS time
;-----------------------------------------------------------------------------
_dos_gettime_:
        push edx
        push ecx
        push ebx
        mov ebx, eax
        mov ah, 2Ch
        int 21h
        mov byte [ebx], ch
        mov byte [byte ebx+01h], cl
        mov byte [byte ebx+02h], dh
        mov byte [byte ebx+03h], dl
        sub eax, eax
        pop ebx
        pop ecx
        pop edx
        ret
