; DOS/4GW: _DoINTR_, IntrLoadRegs.
bits 32
%include "hockey.inc"
section s_D14D1 progbits alloc exec nowrite align=1
global _DoINTR_, IntrLoadRegs, IntrStubs
;-----------------------------------------------------------------------------
; _DoINTR_                                                      D14D1  library
; Run-time library: the intr call helper
;-----------------------------------------------------------------------------
_DoINTR_:
        pusha
        push gs
        push fs
        push es
        push ds
        push edx
        call IntrLoadRegs
        push ebx
        push ds
        push ebp
        mov ebp, esp
        mov ebx, dword [byte ebp+0Ch]
        mov ds, word [byte ebp+010h]
        mov dword [ebx], eax
        pushf
        pop eax
        mov word [byte ebx+024h], ax
        mov dword [byte ebx+08h], ecx
        mov dword [byte ebx+0Ch], edx
        mov dword [byte ebx+014h], esi
        mov dword [byte ebx+018h], edi
        pop dword [byte ebx+010h]
        pop eax
        mov word [byte ebx+01Ch], ax
        pop dword [byte ebx+04h]
        o16 mov word [byte ebx+01Eh], es
        o16 mov word [byte ebx+020h], fs
        o16 mov word [byte ebx+022h], gs
        add esp, byte 8
        pop es
        pop fs
        pop gs
        popa
        ret
;-----------------------------------------------------------------------------
; IntrLoadRegs                                    D151E  96 PC, low confidence
; Loads the full register set from a REGPACK and selects the interrupt stub
; to call
;-----------------------------------------------------------------------------
IntrLoadRegs:
        and eax, 0FFh
        lea eax, [eax+eax*2]
        db 02Eh,08Dh,080h
        dd IntrStubs
        push eax
        mov ebx, edx
        push dword [byte ebx+01Ch]
        mov eax, dword [ebx]
        mov ecx, dword [byte ebx+08h]
        mov edx, dword [byte ebx+0Ch]
        mov esi, dword [byte ebx+014h]
        mov edi, dword [byte ebx+018h]
        mov ebp, dword [byte ebx+010h]
        mov es, word [byte ebx+01Eh]
        mov fs, word [byte ebx+020h]
        mov gs, word [byte ebx+022h]
        mov ebx, dword [byte ebx+04h]
        pop ds
        ret
IntrStubs:                                      ; used by IntrLoadRegs, IntrLoadSegRegs
        db 0CDh,00h
        ret
