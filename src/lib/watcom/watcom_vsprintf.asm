; Watcom C runtime: vsprintf_, VfprintfThunk, fputs_.
bits 32
%include "hockey.inc"
section s_C3C22 progbits alloc exec nowrite align=1
extern __flush_, __fprtf_, __ioalloc_, __prtf_, fputc_, mem_putc__0
global vsprintf_, VfprintfThunk, fputs_
;-----------------------------------------------------------------------------
; vsprintf_                                                     C3C22  library
; Run-time library vsprintf: formats into a string
;-----------------------------------------------------------------------------
vsprintf_:
        push ecx
        push esi
        mov esi, eax
        mov ecx, mem_putc__0
        call __prtf_
        mov byte [esi+eax], 0
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; VfprintfThunk                                   C3C37  96 PC, low confidence
; Jumps to __fprtf_
;-----------------------------------------------------------------------------
VfprintfThunk:
        jmp near __fprtf_
;-----------------------------------------------------------------------------
; fputs_                                                        C3C3C  library
; Run-time library fputs: writes a string to a stream
;-----------------------------------------------------------------------------
fputs_:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        mov ecx, eax
        mov ebx, edx
        cmp dword [byte edx+08h], byte 0
        jne short .1
        mov eax, ebx
        call __ioalloc_
.1:
        mov ah, byte [byte ebx+0Dh]
        xor edi, edi
        test ah, 4
        je short .2
        mov dl, ah
        and dl, 0F9h
        mov dh, dl
        mov byte [byte ebx+0Dh], dl
        or dh, 2
        mov edi, 1
        mov byte [byte ebx+0Dh], dh
.2:
        mov ebp, ecx
        xor esi, esi
.3:
        xor eax, eax
        mov al, byte [ecx]
        test eax, eax
        je short .4
        mov edx, ebx
        inc ecx
        call fputc_
        cmp eax, byte 0FFFFFFFFh
        jne short .3
        mov esi, eax
.4:
        test edi, edi
        je short .5
        mov al, byte [byte ebx+0Dh]
        and al, 0F9h
        mov ah, al
        mov byte [byte ebx+0Dh], al
        or ah, 4
        mov byte [byte ebx+0Dh], ah
        test esi, esi
        jne short .5
        mov eax, ebx
        call __flush_
        mov esi, eax
.5:
        test esi, esi
        jne short .6
        mov esi, ecx
        sub esi, ebp
.6:
        mov eax, esi
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        db 00h,00h,00h
