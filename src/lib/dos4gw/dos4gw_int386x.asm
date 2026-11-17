; DOS/4GW: __int386x_, IntrLoadSegRegs.
bits 32
%include "hockey.inc"
section s_D1474 progbits alloc exec nowrite align=1
extern IntrStubs
global __int386x_, IntrLoadSegRegs
;-----------------------------------------------------------------------------
; __int386x_                                                    D1474  library
; Raises a software interrupt with the given registers and segment registers
;-----------------------------------------------------------------------------
__int386x_:
        push ebp
        push es
        push ebx
        push ds
        push edx
        call IntrLoadSegRegs
        push ds
        push edi
        mov ebp, esp
        mov edi, dword [byte ebp+08h]
        mov ds, word [byte ebp+0Ch]
        mov dword [edi], eax
        mov dword [byte edi+04h], ebx
        mov dword [byte edi+08h], ecx
        mov dword [byte edi+0Ch], edx
        mov dword [byte edi+010h], esi
        pop dword [byte edi+014h]
        sbb eax, eax
        mov dword [byte edi+018h], eax
        pop eax
        pop ebx
        pop ebx
        pop ebx
        mov word [byte ebx+06h], ax
        o16 mov word [ebx], es
        pop es
        pop ebp
        ret
;-----------------------------------------------------------------------------
; IntrLoadSegRegs                                 D14AC  96 PC, low confidence
; Loads the register set and segment registers for a protected-mode interrupt
; call
;-----------------------------------------------------------------------------
IntrLoadSegRegs:
        lea esi, [esi+esi*2]
        lea eax, [dword cs:esi+IntrStubs]
        push eax
        mov es, word [ebx]
        mov bp, word [byte ebx+06h]
        mov eax, dword [edi]
        mov ebx, dword [byte edi+04h]
        mov ecx, dword [byte edi+08h]
        mov edx, dword [byte edi+0Ch]
        mov esi, dword [byte edi+010h]
        mov edi, dword [byte edi+014h]
        mov ds, ebp
        ret
