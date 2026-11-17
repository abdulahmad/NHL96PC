; EA library: RefPackSize, GetPalette, ArtBitDepth, PixelToRgb.
bits 32
%include "hockey.inc"
section s_C4AFA progbits alloc exec nowrite align=1
extern DrawBitsPerPixel, PaletteHookFn, PaletteShadow
global RefPackSize, GetPalette, ArtBitDepthJumpTable, ArtBitDepth, ArtBitDepth_19, ArtBitDepth_1F, ArtBitDepth_25, ArtBitDepth_2B
global ArtBitDepth_31, ArtBitDepth_37, ArtBitDepth_3D, PixelToRgb
        db 00h,00h
;-----------------------------------------------------------------------------
; RefPackSize                                     C4AFC  96 PC, low confidence
; Returns the unpacked size from a RefPack header
;-----------------------------------------------------------------------------
RefPackSize:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFFCh
        push esi
        push edi
        mov ecx, dword [byte ebp+010h]
        mov ebx, dword [byte ebp+08h]
        mov edi, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], 0
        LD or, ebx, ebx
        je near .8
        mov ax, word [ebx]
        lea ebx, [byte ebx+02h]
        and al, 1
        je short .1
        lea ebx, [byte ebx+03h]
.1:
        LD xor, eax, eax
        mov al, byte [ebx]
        shl eax, 10h
        mov ah, byte [byte ebx+01h]
        mov al, byte [byte ebx+02h]
        lea ebx, [byte ebx+03h]
        mov dword [byte ebp-04h], eax
        cmp ecx, byte 0
        je near .8
        LD xor, ecx, ecx
        jmp short .4
        db 02Eh,08Bh,0C0h
.2:
        lea esi, [byte ebx+02h]
        rep movsb
        LD mov, ebx, esi
        LD mov, ch, dl
        LD mov, cl, dh
        and edx, byte 1Ch
        shr ch, 5
        shr edx, 2
        neg ecx
        lea esi, [byte ecx+edi-01h]
        lea ecx, [byte edx+03h]
        rep movsb
        or cl, byte [ebx]
        mov edx, dword [ebx]
        js short .5
.3:
        and ecx, byte 3
        jne short .2
        lea ebx, [byte ebx+02h]
        LD mov, ch, dl
        LD mov, cl, dh
        and edx, byte 1Ch
        shr ch, 5
        shr edx, 2
        neg ecx
        lea esi, [byte ecx+edi-01h]
        lea ecx, [byte edx+03h]
        rep movsb
.4:
        or cl, byte [ebx]
        mov edx, dword [ebx]
        jns short .3
.5:
        LD add, cl, cl
        js short .6
        LD mov, cl, dh
        lea esi, [byte ebx+03h]
        shr ecx, 6
        and ecx, byte 3
        rep movsb
        LD mov, ebx, esi
        LD mov, ecx, edx
        shr ecx, 10h
        LD mov, ch, dh
        and ch, 3Fh
        neg ecx
        lea esi, [byte ecx+edi-01h]
        and edx, byte 3Fh
        lea ecx, [byte edx+04h]
        rep movsb
        or cl, byte [ebx]
        mov edx, dword [ebx]
        jns short .3
        jmp short .5
        db 08Bh,0C0h
.6:
        LD add, cl, cl
        jns short .9
        cmp dl, 0FCh
        jae short .7
        and edx, byte 1Fh
        lea esi, [byte ebx+01h]
        lea ecx, [byte edx+01h]
        rep movsd
        LD mov, ebx, esi
        or cl, byte [esi]
        mov edx, dword [esi]
        jns short .3
        jmp short .5
        db 08Bh,0C0h
.7:
        LD mov, ecx, edx
        lea esi, [byte ebx+01h]
        and ecx, byte 3
        rep movsb
.8:
        mov eax, dword [byte ebp-04h]
        pop edi
        pop esi
        leave
        ret
        db 02Eh,08Bh,0C0h
.9:
        LD mov, ecx, edx
        lea esi, [byte ebx+04h]
        and ecx, byte 3
        rep movsb
        LD mov, ebx, esi
        LD mov, ecx, edx
        LD mov, eax, edx
        and ecx, byte 10h
        shr eax, 8
        shl ecx, 0Ch
        LD mov, cl, ah
        LD mov, ch, al
        neg ecx
        lea esi, [byte ecx+edi-01h]
        rol edx, 8
        shr dh, 2
        and edx, 3FFh
        cmp ecx, byte 0FFFFFFFCh
        jge short .10
        lea ecx, [byte edx+05h]
        lea edx, [byte edx+05h]
        shr ecx, 2
        and edx, byte 3
        rep movsd
        LD mov, ecx, edx
        rep movsb
        or cl, byte [ebx]
        mov edx, dword [ebx]
        jns near .3
        jmp near .5
        db 02Eh,08Bh,0C0h
.10:
        lea ecx, [byte edx+05h]
        rep movsb
        or cl, byte [ebx]
        mov edx, dword [ebx]
        jns near .3
        jmp near .5
;-----------------------------------------------------------------------------
; GetPalette                                   C4C6C  96 PC, medium confidence
; Reads palette entries (start, count, dst) from the VGA DAC, or through the
; hooked reader
;-----------------------------------------------------------------------------
GetPalette:
        cmp dword [PaletteHookFn], byte 0
        je short .1
        jmp dword [PaletteHookFn]
.1:
        push ebp
        LD mov, ebp, esp
        push edi
        mov edi, dword [byte ebp+010h]
        mov edx, 3C7h
        mov eax, dword [byte ebp+08h]
        out dx, al
        mov ebx, dword [byte ebp+0Ch]
        lea ecx, [ebx+ebx*2]
        mov edx, 3C9h
.2:
        in al, dx
        shl al, 2
        LD mov, ah, al
        shr ah, 6
        LD or, al, ah
        mov byte [edi], al
        inc edi
        dec ecx
        jne short .2
        pop edi
        leave
        ret
        db 00h,00h,00h,00h,00h,00h
ArtBitDepthJumpTable:                           ; jump table for the switch cases of ArtBitDepth
        dd ArtBitDepth_19
        dd ArtBitDepth_1F
        dd ArtBitDepth_25
        dd ArtBitDepth_3D
        dd ArtBitDepth_37
        dd ArtBitDepth_2B
        dd ArtBitDepth_31
;-----------------------------------------------------------------------------
; ArtBitDepth                                  C4CCC  96 PC, medium confidence
; Returns the bits per pixel of an art from its type byte
;-----------------------------------------------------------------------------
ArtBitDepth:
        mov eax, dword [byte esp+04h]
        mov eax, dword [eax]
        and eax, byte 7Fh
        sub eax, byte 79h
        cmp eax, byte 6
        ja short ArtBitDepth_3D
        db 02Eh,0FFh,024h,085h                  ; insn: jmp dword [cs:eax*4+ArtBitDepthJumpTable]
        dd ArtBitDepthJumpTable
ArtBitDepth_19:
        mov eax, 1
        ret
ArtBitDepth_1F:
        mov eax, 4
        ret
ArtBitDepth_25:
        mov eax, 8
        ret
ArtBitDepth_2B:
        mov eax, 10h
        ret
ArtBitDepth_31:
        mov eax, 18h
        ret
ArtBitDepth_37:
        mov eax, 20h
        ret
ArtBitDepth_3D:
        xor eax, eax
        ret
        mov edx, dword [byte esp+04h]
        xor eax, eax
        cmp edx, byte 8
        jb short .2
        jbe short .5
        cmp edx, byte 18h
        jb short .1
        jbe short .7
        cmp edx, byte 20h
        je short .8
        ret
.1:
        cmp edx, byte 10h
        je short .6
        ret
.2:
        cmp edx, byte 1
        jb short .9
        jbe short .3
        cmp edx, byte 4
        je short .4
        ret
.3:
        mov eax, 79h
        ret
.4:
        mov eax, 7Ah
        ret
.5:
        mov eax, 7Bh
        ret
.6:
        mov eax, 7Eh
        ret
.7:
        mov eax, 7Fh
        ret
.8:
        mov eax, 7Dh
.9:
        ret
        db 08Dh,040h,00h
        mov eax, dword [byte esp+04h]
        mov eax, dword [byte eax+02h]
        sar eax, 10h
        ret
        db 090h
        mov eax, dword [byte esp+04h]
        mov eax, dword [byte eax+04h]
        sar eax, 10h
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; PixelToRgb                                      C4D80  96 PC, low confidence
; Converts a screen pixel value at the current depth to a 24-bit RGB colour
;-----------------------------------------------------------------------------
PixelToRgb:
        mov edx, dword [byte esp+04h]
        mov eax, dword [DrawBitsPerPixel]
        cmp eax, byte 10h
        jb short .1
        jbe short .2
        cmp eax, byte 18h
        jb short .5
        jbe short .3
        cmp eax, byte 20h
        je short .3
        xor eax, eax
        ret
.1:
        cmp eax, byte 4
        jb short .5
        jbe short .4
        cmp eax, byte 8
        je short .4
        xor eax, eax
        ret
.2:
        mov eax, edx
        mov ecx, edx
        sar eax, 0Ah
        sar ecx, 5
        and edx, byte 1Fh
        and eax, byte 1Fh
        and ecx, byte 1Fh
        shl eax, 13h
        shl ecx, 0Bh
        shl edx, 3
        or eax, ecx
        or eax, edx
        ret
.3:
        mov eax, edx
        ret
.4:
        mov eax, dword [nosplit edx*4+PaletteShadow]
        ret
.5:
        xor eax, eax
        ret
        db 00h,00h,00h
