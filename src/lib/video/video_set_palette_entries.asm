; Video: SetPaletteEntries, SetTextMode, SetPaletteEntries8, ReadPaletteEntries8.
bits 32
%include "hockey.inc"
section s_DD7B8 progbits alloc exec nowrite align=1
extern ClearScreenColour, GraphicsReady, PaletteShadow
global SetPaletteEntries, SetTextMode, SetPaletteEntries8, ReadPaletteEntries8
;-----------------------------------------------------------------------------
; SetPaletteEntries                            DD7B8  96 PC, medium confidence
; Writes 6-bit palette entries (start, count, rgb) to the VGA DAC and the
; palette copy
;-----------------------------------------------------------------------------
SetPaletteEntries:
        push esi
        push edi
        push ebp
        mov ebp, dword [byte esp+018h]
        mov edx, 3C8h
        mov eax, dword [byte esp+010h]
        out dx, al
        lea edi, [nosplit eax*4+PaletteShadow]
        mov ebx, dword [byte esp+014h]
        inc edx
.1:
        mov eax, dword [byte ebp+00h]
        and eax, 3F3F3Fh
        lea eax, [nosplit eax*4-01000000h]
        mov dword [edi], eax
        lea esi, [byte ebp+00h]
        mov ecx, 3
        rep outsb
        dec ebx
        lea ebp, [byte ebp+03h]
        lea edi, [byte edi+04h]
        jne short .1
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; SetTextMode                                  DD800  96 PC, medium confidence
; Closes the graphics screen and sets 80x25 colour text mode
;-----------------------------------------------------------------------------
SetTextMode:
        push byte 0
        call ClearScreenColour
        add esp, byte 4
        and byte [0410h], 0CFh
        or byte [0410h], 10h
        mov eax, 3
        int 10h
        mov ah, 0Bh
        LD xor, ebx, ebx
        int 10h
        mov dword [GraphicsReady], 0
        ret
;-----------------------------------------------------------------------------
; SetPaletteEntries8                           DD830  96 PC, medium confidence
; Writes 8-bit palette entries to the VGA DAC (scaled to 6 bits) and the
; palette copy
;-----------------------------------------------------------------------------
SetPaletteEntries8:
        push esi
        push edi
        push ebp
        mov ebp, dword [byte esp+018h]
        mov edx, 3C8h
        mov eax, dword [byte esp+010h]
        out dx, al
        lea edi, [nosplit eax*4+PaletteShadow]
        mov ebx, dword [byte esp+014h]
        inc edx
        push edx
.1:
        mov eax, dword [byte ebp+00h]
        or eax, 0FF000000h
        mov dword [edi], eax
        shr eax, 2
        and eax, 3F3F3Fh
        mov dword [esp], eax
        lea esi, [esp]
        mov ecx, 3
        rep outsb
        dec ebx
        lea ebp, [byte ebp+03h]
        lea edi, [byte edi+04h]
        jne short .1
        pop edx
        pop ebp
        pop edi
        pop esi
        ret
        db 00h
;-----------------------------------------------------------------------------
; ReadPaletteEntries8                          DD87C  96 PC, medium confidence
; Reads palette entries from the VGA DAC as 8-bit RGB
;-----------------------------------------------------------------------------
ReadPaletteEntries8:
        push ebp
        LD mov, ebp, esp
        push edi
        mov edi, dword [byte ebp+010h]
        mov edx, 3C7h
        mov eax, dword [byte ebp+08h]
        out dx, al
        mov ecx, dword [byte ebp+0Ch]
        mov edx, 3C9h
.1:
        mov ah, 0FFh
        in al, dx
        shl eax, 8
        in al, dx
        shl eax, 8
        in al, dx
        shl eax, 2
        mov dword [edi], eax
        add edi, byte 4
        dec ecx
        jg short .1
        pop edi
        leave
        ret
