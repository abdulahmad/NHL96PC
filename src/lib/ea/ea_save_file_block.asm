; EA library: SaveFileBlock.
bits 32
%include "hockey.inc"
section s_B22A1 progbits alloc exec nowrite align=1
extern savefileblocka
global SaveFileBlock
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; SaveFileBlock                                   B22B0  96 PC, low confidence
; Writes a block of memory to a file through savefileblocka
;-----------------------------------------------------------------------------
SaveFileBlock:
        sub esp, byte 28h
        mov eax, dword [byte esp+030h]
        mov dword [esp], eax
        mov eax, dword [byte esp+034h]
        push byte 1
        mov dword [byte esp+018h], eax
        lea eax, [byte esp+04h]
        push eax
        mov ebx, dword [byte esp+034h]
        xor edx, edx
        push ebx
        mov dword [byte esp+024h], edx
        call savefileblocka
        add esp, byte 0Ch
        add esp, byte 28h
        ret
