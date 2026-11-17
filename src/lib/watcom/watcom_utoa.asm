; Watcom C runtime: utoa_, itoa_, memcmp_.
bits 32
%include "hockey.inc"
section s_C26F9 progbits alloc exec nowrite align=1
global _Alphabet, utoa_, itoa_, memcmp_
_Alphabet:                                      ; run-time library digit and letter characters; used by utoa_
        db 030h,031h,032h,033h,034h,035h,036h,037h,038h,039h,061h,062h,063h,064h,065h,066h
        db 067h,068h,069h,06Ah,06Bh,06Ch,06Dh,06Eh,06Fh,070h,071h,072h,073h,074h,075h,076h
        db 077h,078h,079h,07Ah,00h
;-----------------------------------------------------------------------------
; utoa_                                                         C271E  library
; Run-time library utoa: an unsigned integer to a string
;-----------------------------------------------------------------------------
utoa_:
        push ecx
        push esi
        push edi
        push ebp
        sub esp, byte 28h
        mov ebp, edx
        mov edi, ebx
        mov esi, edx
        xor dl, dl
        lea ecx, [byte esp+01h]
        mov byte [esp], dl
.1:
        lea ebx, [byte esp+024h]
        mov dword [byte esp+024h], edi
        xor edx, edx
        div dword [ebx]
        mov dword [ebx], eax
        mov al, byte [dword cs:edx+_Alphabet]
        mov byte [ecx], al
        mov eax, dword [byte esp+024h]
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
        mov eax, ebp
        add esp, byte 28h
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; itoa_                                                         C2768  library
; Run-time library itoa: an integer to a string
;-----------------------------------------------------------------------------
itoa_:
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
        call utoa_
        mov eax, ecx
        pop ecx
        ret
        db 00h
;-----------------------------------------------------------------------------
; memcmp_                                                       C2784  library
; Run-time library memcmp: compares two blocks
;-----------------------------------------------------------------------------
memcmp_:
        push ecx
        push esi
        push edi
        mov esi, eax
        mov edi, edx
        mov ecx, ebx
        push es
        mov eax, ds
        mov es, eax
        xor eax, eax
        repe cmpsb
        je short .1
        sbb eax, eax
        sbb eax, byte 0FFFFFFFFh
.1:
        pop es
        pop edi
        pop esi
        pop ecx
        ret
