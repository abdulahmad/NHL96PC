; EA library: BlitBlockRemapKeyed.
bits 32
%include "hockey.inc"
section s_D7A42 progbits alloc exec nowrite align=1
extern ColourRemap, DrawDestBuffer, DrawRowBytes, DrawVideoBase
global BlitBlockRemapKeyed, BlitBlockRemapKeyed_34
        db 0EBh, BlitBlockRemapKeyed_34-($+2)
;-----------------------------------------------------------------------------
; BlitBlockRemapKeyed                             D7A44  96 PC, low confidence
; Draws a block through the colour remap at x, y, clipped
;-----------------------------------------------------------------------------
BlitBlockRemapKeyed:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFECh
        push ds
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        jmp short BlitBlockRemapKeyed_34
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFECh
        push ds
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        movsx eax, word [byte esi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-08h], eax
BlitBlockRemapKeyed_34:
        mov ebx, dword [byte ebp-08h]
        shl ebx, 2
        add ebx, dword [DrawDestBuffer]
        mov edi, dword [ebx]
        add edi, dword [byte ebp-04h]
        add edi, dword [DrawVideoBase]
        mov edx, dword [DrawRowBytes]
        movsx eax, word [byte esi+04h]
        mov dword [byte ebp-0Ch], eax
        LD sub, edx, eax
        movsx eax, word [byte esi+06h]
        mov dword [byte ebp-010h], eax
        cld
        add esi, byte 10h
        LD xor, ebx, ebx
        LD xor, eax, eax
.1:
        mov ecx, dword [byte ebp-0Ch]
.2:
        mov al, byte [esi]
        inc esi
        mov al, byte [dword eax+ColourRemap]
        cmp al, 0FFh
        je short .3
        mov byte [edi], al
        inc edi
        dec ecx
        jne short .2
        jmp short .4
.3:
        inc edi
        dec ecx
        jne short .2
.4:
        LD add, edi, edx
        dec dword [byte ebp-010h]
        jg short .1
        pop edi
        pop esi
        pop ds
        leave
        ret
