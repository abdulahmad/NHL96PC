; Watcom C runtime: bcopy.
bits 32
%include "hockey.inc"
section s_E0520 progbits alloc exec nowrite align=1
global bcopy
;-----------------------------------------------------------------------------
; bcopy                                           E0520  96 PC, low confidence
; (src, dst, n): copies n bytes, backwards when they overlap (BSD order)
;-----------------------------------------------------------------------------
bcopy:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov edi, dword [byte ebp+0Ch]
        mov ecx, dword [byte ebp+010h]
        LD cmp, edi, esi
        ja short .2
        cld
        cmp ecx, byte 10h
        jge short .1
        rep movsb
        pop edi
        pop esi
        leave
        ret
.1:
        LD mov, eax, edi
        mov edx, dword [esi]
        neg eax
        mov dword [edi], edx
        and eax, byte 3
        lea esi, [eax+esi]
        lea edi, [eax+edi]
        LD sub, ecx, eax
        LD mov, ebx, ecx
        shr ecx, 2
        rep movsd
        LD mov, ecx, ebx
        and ecx, byte 3
        rep movsb
        pop edi
        pop esi
        leave
        ret
.2:
        std
        lea esi, [byte ecx+esi-04h]
        lea edi, [byte ecx+edi-04h]
        shr ecx, 2
        rep movsd
        mov ecx, dword [byte ebp+010h]
        and ecx, byte 3
        lea esi, [byte esi+03h]
        lea edi, [byte edi+03h]
        rep movsb
        cld
        pop edi
        pop esi
        leave
        ret
