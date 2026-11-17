; Video: VesaGetInfo, VesaGetModeInfo.
bits 32
%include "hockey.inc"
section s_BF2F5 progbits alloc exec nowrite align=1
extern AllocMemBlock, FatalError, FreeMemBlock, int386x_, segread_, str_GetvesainfoINVALIDDOSSEGMENT, str_GetvesainfoINVALIDVESAINFOVE, str_VESA
extern str_VESAMEM, strncmp_, VesaModeInfo, VesaRealModeRegs
global VesaGetInfo, VesaGetModeInfo
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; VesaGetInfo                                     BF300  96 PC, low confidence
; Reads the VESA controller information (4F00h) into a low memory buffer
;-----------------------------------------------------------------------------
VesaGetInfo:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        sub esp, byte 48h
        mov ebp, eax
        push dword 200h
        push dword 400h
        xor edx, edx
        push str_VESAMEM
        mov dword [byte esp+050h], edx
        call AllocMemBlock
        mov esi, eax
        add esp, byte 0Ch
        shr esi, 4
        mov dword [VesaModeInfo], eax
        cmp esi, 0A000h
        jg short .1
        cmp esi, 7C0h
        jge short .2
.1:
        push esi
        push str_GetvesainfoINVALIDDOSSEGMENT
        call FatalError
        add esp, byte 8
.2:
        mov ecx, 32h
        mov edi, VesaRealModeRegs
        mov ebx, 4F00h
        xor eax, eax
        mov edx, 300h
        rep stosb
        lea eax, [byte esp+038h]
        mov dword [VesaRealModeRegs+1Ch], ebx
        mov word [VesaRealModeRegs+22h], si
        mov edi, ebp
        xor ecx, ecx
        mov ebx, 10h
        mov esi, VesaRealModeRegs
        mov dword [VesaRealModeRegs], ecx
        call segread_
        mov eax, VesaRealModeRegs
        mov word [byte esp+01Ch], dx
        mov word [byte esp+020h], bx
        xor ecx, ecx
        mov ebx, esp
        mov edx, ds
        mov word [byte esp+024h], cx
        lea ecx, [byte esp+038h]
        mov eax, 31h
        mov word [byte esp+038h], dx
        lea edx, [byte esp+01Ch]
        mov dword [byte esp+030h], esi
        call int386x_
        mov ecx, 100h
        mov ebx, 4
        mov esi, dword [VesaModeInfo]
        mov edx, str_VESA
        rep movsb
        mov eax, ebp
        call strncmp_
        test eax, eax
        je short .3
        push str_GetvesainfoINVALIDVESAINFOVE
        call FatalError
        add esp, byte 4
.3:
        mov eax, dword [VesaRealModeRegs+1Ch]
        and eax, 0FFFFh
        cmp eax, byte 4Fh
        jne short .4
        mov dword [byte esp+044h], 1
.4:
        mov ebp, dword [VesaModeInfo]
        push ebp
        call FreeMemBlock
        add esp, byte 4
        mov eax, dword [byte esp+044h]
        add esp, byte 48h
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; VesaGetModeInfo                                 BF42C  96 PC, low confidence
; Reads a VESA mode's information (4F01h) into a low memory buffer
;-----------------------------------------------------------------------------
VesaGetModeInfo:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        sub esp, byte 48h
        mov esi, eax
        mov ebp, edx
        push dword 200h
        push dword 400h
        xor edx, edx
        push str_VESAMEM
        mov edi, VesaRealModeRegs
        mov dword [byte esp+050h], edx
        call AllocMemBlock
        mov ecx, 32h
        mov ebx, 4F01h
        add esp, byte 0Ch
        mov dword [VesaModeInfo], eax
        mov edx, eax
        xor eax, eax
        shr edx, 4
        rep stosb
        lea eax, [byte esp+038h]
        mov dword [VesaRealModeRegs+1Ch], ebx
        mov dword [VesaRealModeRegs+18h], esi
        mov word [VesaRealModeRegs+22h], dx
        mov edi, ebp
        xor ecx, ecx
        mov edx, 300h
        mov ebx, 10h
        mov esi, VesaRealModeRegs
        mov dword [VesaRealModeRegs], ecx
        call segread_
        mov eax, VesaRealModeRegs
        mov word [esp], dx
        mov word [byte esp+04h], bx
        xor ecx, ecx
        lea ebx, [byte esp+01Ch]
        mov edx, ds
        mov word [byte esp+08h], cx
        lea ecx, [byte esp+038h]
        mov eax, 31h
        mov word [byte esp+038h], dx
        mov edx, esp
        mov dword [byte esp+014h], esi
        call int386x_
        mov ecx, 100h
        mov esi, dword [VesaModeInfo]
        rep movsb
        mov eax, dword [VesaRealModeRegs+1Ch]
        and eax, 0FFFFh
        cmp eax, byte 4Fh
        jne short .1
        mov dword [byte esp+044h], 1
.1:
        mov ebp, dword [VesaModeInfo]
        push ebp
        call FreeMemBlock
        add esp, byte 4
        mov eax, dword [byte esp+044h]
        add esp, byte 48h
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        db 090h
        push edx
        sub esp, 100h
        mov edx, esp
        call VesaGetModeInfo
        add esp, 100h
        pop edx
        ret
        db 08Bh,0C0h
