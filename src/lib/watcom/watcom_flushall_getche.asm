; Watcom C runtime: __flushall_, getche_, fputc_, NoFloatSupport, ultoa_ and 2 more.
bits 32
%include "hockey.inc"
section s_D01B5 progbits alloc exec nowrite align=1
extern __ClosedStreams, __fatal_runtime_error_, __flush_, __ioalloc_, __set_errno_, str_FloatingPointSupportNot, UngetChar
global __flushall_, getche_, fputc_, NoFloatSupport, str_0123456789abcdefghijklmnopqr_ultoa_, ultoa_, ltoa_, toupper_
;-----------------------------------------------------------------------------
; __flushall_                                                   D01B5  library
; Run-time library: flushes every open stream whose flags match the mask
;-----------------------------------------------------------------------------
__flushall_:
        push ebx
        push ecx
        push edx
        mov ecx, eax
        mov edx, dword [__ClosedStreams]
        xor ebx, ebx
        jmp short .3
.1:
        mov eax, dword [byte edx+04h]
        test dword [byte eax+0Ch], ecx
        je short .2
        inc ebx
        test byte [byte eax+0Dh], 10h
        je short .2
        call __flush_
.2:
        mov edx, dword [edx]
.3:
        test edx, edx
        jne short .1
        mov eax, ebx
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; getche_                                                       D01E4  library
; Run-time library getche: reads a key and echoes it
;-----------------------------------------------------------------------------
getche_:
        push edx
        xor edx, edx
        mov eax, dword [UngetChar]
        mov dword [UngetChar], edx
        test eax, eax
        jne short .1
        mov ah, 1
        int 21h
        and eax, 0FFh
.1:
        pop edx
        ret
;-----------------------------------------------------------------------------
; fputc_                                                        D0201  library
; Run-time library fputc: writes a character to a stream
;-----------------------------------------------------------------------------
fputc_:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        mov ebx, eax
        test byte [byte edx+0Ch], 2
        jne short .2
        mov eax, 4
        call __set_errno_
        or byte [byte edx+0Ch], 20h
.1:
        mov eax, 0FFFFFFFFh
        jmp near .7
.2:
        cmp dword [byte edx+08h], byte 0
        jne short .3
        mov eax, edx
        call __ioalloc_
.3:
        mov ecx, 400h
        cmp ebx, byte 0Ah
        jne short .4
        mov al, byte [byte edx+0Ch]
        mov ecx, 600h
        test al, 40h
        jne short .4
        or byte [byte edx+0Dh], 10h
        mov eax, dword [edx]
        mov byte [eax], 0Dh
        mov esi, dword [edx]
        inc esi
        mov edi, dword [byte edx+04h]
        mov dword [edx], esi
        inc edi
        mov ebp, dword [byte edx+014h]
        mov dword [byte edx+04h], edi
        cmp edi, ebp
        jne short .4
        mov eax, edx
        call __flush_
        test eax, eax
        jne short .1
.4:
        or byte [byte edx+0Dh], 10h
        mov eax, dword [edx]
        mov byte [eax], bl
        mov eax, dword [edx]
        inc eax
        mov esi, dword [byte edx+04h]
        mov dword [edx], eax
        inc esi
        mov edi, dword [byte edx+0Ch]
        mov dword [byte edx+04h], esi
        test ecx, edi
        jne short .5
        cmp esi, dword [byte edx+014h]
        jne short .6
.5:
        mov eax, edx
        call __flush_
        test eax, eax
        jne short .1
.6:
        xor eax, eax
        mov al, bl
.7:
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; NoFloatSupport                               D02A8  96 PC, medium confidence
; Reports that floating-point support is not loaded and exits
;-----------------------------------------------------------------------------
NoFloatSupport:
        push edx
        mov eax, str_FloatingPointSupportNot
        mov edx, 1
        call __fatal_runtime_error_
        pop edx
        ret
str_0123456789abcdefghijklmnopqr_ultoa_:        ; string "0123456789abcdefghijklmnopqrstuvwxyz"; used by
                                                ; ultoa_
        db 030h,031h,032h,033h,034h,035h,036h,037h,038h,039h,061h,062h,063h,064h,065h,066h
        db 067h,068h,069h,06Ah,06Bh,06Ch,06Dh,06Eh,06Fh,070h,071h,072h,073h,074h,075h,076h
        db 077h,078h,079h,07Ah,00h
;-----------------------------------------------------------------------------
; ultoa_                                                        D02DF  library
; Run-time library ultoa: an unsigned long to a string
;-----------------------------------------------------------------------------
ultoa_:
        push ecx
        push esi
        push ebp
        sub esp, byte 28h
        push edx
        mov ebp, ebx
        mov esi, edx
        xor dl, dl
        lea ecx, [byte esp+05h]
        mov byte [byte esp+04h], dl
.1:
        lea ebx, [byte esp+028h]
        mov dword [byte esp+028h], ebp
        xor edx, edx
        div dword [ebx]
        mov dword [ebx], edx
        mov edx, dword [byte esp+028h]
        mov dl, byte [dword cs:edx+str_0123456789abcdefghijklmnopqr_ultoa_]
        mov byte [ecx], dl
        inc ecx
        test eax, eax
        jne short .1
.2:
        dec ecx
        mov al, byte [ecx]
        mov byte [esi], al
        inc esi
        test al, al
        jne short .2
        mov eax, dword [esp]
        add esp, byte 2Ch
        pop ebp
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; ltoa_                                                         D0328  library
; Run-time library ltoa: a long to a string
;-----------------------------------------------------------------------------
ltoa_:
        push ecx
        mov ecx, edx
        cmp ebx, byte 0Ah
        jne short .1
        test eax, eax
        jge short .1
        neg eax
        mov byte [edx], 2Dh
        inc edx
.1:
        call ultoa_
        mov eax, ecx
        pop ecx
        ret
;-----------------------------------------------------------------------------
; toupper_                                                      D0343  library
; Run-time library toupper: a character to upper case
;-----------------------------------------------------------------------------
toupper_:
        cmp eax, byte 61h
        jl short .1
        cmp eax, byte 7Ah
        jg short .1
        sub eax, byte 20h
.1:
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
