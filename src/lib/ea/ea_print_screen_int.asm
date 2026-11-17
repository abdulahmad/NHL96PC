; EA library: PrintScreenInt.
bits 32
%include "hockey.inc"
section s_C27A2 progbits alloc exec nowrite align=1
extern DrawArtFast, DrawArtOpaque, SetScreenTarget
global PrintScreenInt
        db 00h,00h
;-----------------------------------------------------------------------------
; PrintScreenInt                               C27A4  96 PC, medium confidence
; Calls the BIOS print screen interrupt
;-----------------------------------------------------------------------------
PrintScreenInt:
        int 5
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h
        push ecx
        push esi
        push edi
        push ebp
        mov esi, eax
        mov edi, edx
        mov ebp, ebx
        call SetScreenTarget
        push ebp
        push edi
        mov edx, dword [byte esi+02Ch]
        push edx
        call DrawArtFast
        add esp, byte 0Ch
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
        db 08Bh,0C0h
        push ecx
        push esi
        push edi
        push ebp
        mov esi, eax
        mov edi, edx
        mov ebp, ebx
        call SetScreenTarget
        push ebp
        push edi
        mov edx, dword [byte esi+02Ch]
        push edx
        call DrawArtOpaque
        add esp, byte 0Ch
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
        db 08Bh,0C0h
