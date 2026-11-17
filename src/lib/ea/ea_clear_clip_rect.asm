; EA library: ClearClipRect.
bits 32
%include "hockey.inc"
section s_E0584 progbits alloc exec nowrite align=1
extern BreakCallFunc, DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, FillRect, RestoreDS
global ClearClipRect, ClearClipRect_30
;-----------------------------------------------------------------------------
; ClearClipRect                                   E0584  96 PC, low confidence
; Fills the clip rectangle with a colour
;-----------------------------------------------------------------------------
ClearClipRect:
        mov eax, dword [byte esp+04h]
        push eax
        mov edx, dword [DrawClipBottom]
        mov ebx, dword [DrawClipTop]
        LD sub, edx, ebx
        mov eax, dword [DrawClipRight]
        mov ecx, dword [DrawClipLeft]
        LD sub, eax, ecx
        push edx
        push eax
        push ebx
        push ecx
        call FillRect
        add esp, byte 14h
        ret
        db 00h,00h,00h
ClearClipRect_30:
        sti
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        push ds
        push es
        push fs
        push gs
        call RestoreDS
        call dword [cs:BreakCallFunc]
        pop gs
        pop fs
        pop es
        pop ds
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        iret
