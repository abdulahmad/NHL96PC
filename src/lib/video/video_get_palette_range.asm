; Video: GetPaletteRange.
bits 32
%include "hockey.inc"
section s_DD6DE progbits alloc exec nowrite align=1
global GetPaletteRange
        db 00h,00h
;-----------------------------------------------------------------------------
; GetPaletteRange                                 DD6E0  96 PC, low confidence
; Reads a range of palette entries from the VGA DAC into a buffer
;-----------------------------------------------------------------------------
GetPaletteRange:
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
.1:
        in al, dx
        mov byte [edi], al
        inc edi
        dec ecx
        jne short .1
        pop edi
        leave
        ret
