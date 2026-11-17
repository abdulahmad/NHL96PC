; EA library: NearestColour.
bits 32
%include "hockey.inc"
section s_B31BE progbits alloc exec nowrite align=1
extern ColourLookup, GetPalette, NearestColourCache, QuantizeTable
global NearestColour
        db 00h,00h
;-----------------------------------------------------------------------------
; NearestColour                                B31C0  96 PC, medium confidence
; Finds the palette index nearest an RGB colour, through the 15-bit lookup
; when one is built
;-----------------------------------------------------------------------------
NearestColour:
        push esi
        push edi
        push ebp
        sub esp, 310h
        mov esi, dword [dword esp+0320h]
        mov edx, dword [ColourLookup]
        test edx, edx
        je short .1
        mov ecx, esi
        mov edx, esi
        mov eax, esi
        shr ecx, 13h
        shr edx, 0Bh
        shr eax, 3
        and ecx, byte 1Fh
        and edx, byte 1Fh
        shl ecx, 0Ah
        shl edx, 5
        and eax, byte 1Fh
        or edx, ecx
        or eax, edx
        mov edx, dword [ColourLookup]
        mov al, byte [edx+eax]
        and eax, 0FFh
        jmp near .6
.1:
        cmp dword [NearestColourCache], byte 0
        jne short .2
        mov eax, esp
        push eax
        push dword 100h
        push edx
        call GetPalette
        add esp, byte 0Ch
.2:
        mov eax, esi
        shr eax, 10h
        and eax, 0FFh
        mov dword [dword esp+0300h], eax
        mov eax, esi
        shr eax, 8
        mov ecx, 270Fh
        and eax, 0FFh
        and esi, 0FFh
        mov dword [dword esp+0308h], eax
        mov eax, dword [NearestColourCache]
        mov dword [dword esp+0304h], esi
        test eax, eax
        jne short .3
        mov eax, esp
.3:
        xor edx, edx
.4:
        inc eax
        movzx ebp, byte [byte eax-01h]
        movzx esi, byte [eax]
        movzx edi, byte [byte eax+01h]
        add eax, byte 2
        mov bl, byte [dword edx+QuantizeTable]
        test bl, bl
        je short .5
        mov ebx, dword [dword esp+0308h]
        sub ebx, esi
        mov esi, ebx
        imul esi, ebx
        mov ebx, dword [dword esp+0300h]
        sub ebx, ebp
        imul ebx, ebx
        add esi, ebx
        mov ebx, dword [dword esp+0304h]
        sub ebx, edi
        imul ebx, ebx
        add ebx, esi
        cmp ebx, ecx
        jge short .5
        mov ecx, ebx
        mov dword [dword esp+030Ch], edx
.5:
        inc edx
        cmp edx, 100h
        jl short .4
        mov eax, dword [dword esp+030Ch]
.6:
        add esp, 310h
        pop ebp
        pop edi
        pop esi
        ret
