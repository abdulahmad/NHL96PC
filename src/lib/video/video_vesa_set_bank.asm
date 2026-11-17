; Video: VesaSetBank, VesaSetBankBody, VesaSetMode, VgaSetModeTwice.
bits 32
%include "hockey.inc"
section s_DE3D8 progbits alloc exec nowrite align=1
extern VesaBank, VesaBankFunc, VesaBankShift
global VesaSetBank, VesaSetBankJumpTable, VesaSetBankBody, VesaSetMode, VgaSetModeTwice
;-----------------------------------------------------------------------------
; VesaSetBank                                     DE3D8  96 PC, low confidence
; Switches the VESA bank window when the wanted bank differs
;-----------------------------------------------------------------------------
VesaSetBank:
        cmp al, byte [VesaBankShift]
        je short VesaSetBankBody
        mov byte [VesaBankShift], al
        cmp eax, byte 0
        jl short VesaSetBankBody
        push edx
        mov edx, dword [VesaBank]
        jmp dword [nosplit edx*4+VesaSetBankJumpTable]
VesaSetBankJumpTable:                           ; jump table for the switch cases of VesaSetBank
        dd .1
        dd VesaSetBankBody.2
.1:
        push ebx
        push ecx
        push ebp
        push esi
        push edi
        mov ecx, dword [VesaBankFunc]
        shl al, cl
        movzx edx, al
        mov eax, 4F05h
        LD xor, ebx, ebx
        int 10h
        pop edi
        pop esi
        pop ebp
        pop ecx
        pop ebx
        pop edx
;-----------------------------------------------------------------------------
; VesaSetBankBody                                 DE41F  96 PC, low confidence
; Sets the VESA bank when it changes
;-----------------------------------------------------------------------------
VesaSetBankBody:
        ret
.2:
        push ebx
        push ecx
        push ebp
        push esi
        push edi
        mov ecx, dword [VesaBankFunc]
        shl al, cl
        movzx edx, al
        push edx
        mov eax, 4F05h
        LD xor, ebx, ebx
        int 10h
        pop edx
        mov eax, 4F05h
        mov ebx, 1
        int 10h
        pop edi
        pop esi
        pop ebp
        pop ecx
        pop ebx
        pop edx
        ret
;-----------------------------------------------------------------------------
; VesaSetMode                                  DE44E  96 PC, medium confidence
; Sets a VESA video mode (int 10h, 4F02h)
;-----------------------------------------------------------------------------
VesaSetMode:
        mov ebx, dword [byte esp+04h]
        mov ax, 4F02h
        push ebp
        push esi
        push edi
        int 10h
        pop edi
        pop esi
        pop ebp
        ret
;-----------------------------------------------------------------------------
; VgaSetModeTwice                                 DE45F  96 PC, low confidence
; Sets mode 12h without clearing, then the given video mode
;-----------------------------------------------------------------------------
VgaSetModeTwice:
        push ebp
        push esi
        push edi
        mov eax, 92h
        int 10h
        mov eax, dword [byte esp+010h]
        int 10h
        pop edi
        pop esi
        pop ebp
        ret
        push ebp
        push esi
        push edi
        push ecx
        LD mov, ecx, eax
        mov eax, 4F07h
        mov ebx, 0
        int 10h
        pop ecx
        pop edi
        pop esi
        pop ebp
        ret
        push ebp
        push esi
        push edi
        push ecx
        movzx ebx, al
        movzx edx, dx
        mov eax, 4F05h
        int 10h
        pop ecx
        pop edi
        pop esi
        pop ebp
        ret
