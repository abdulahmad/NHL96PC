; Watcom C runtime: Mul32To64, Div64By32, Sar64, Shl64, min_.
bits 32
%include "hockey.inc"
section s_C9E68 progbits alloc exec nowrite align=1
global Mul32To64, Div64By32, Sar64, Shl64, min_
;-----------------------------------------------------------------------------
; Mul32To64                                    C9E68  96 PC, medium confidence
; Multiplies two numbers to a 64-bit result
;-----------------------------------------------------------------------------
Mul32To64:
        imul edx
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        ret
;-----------------------------------------------------------------------------
; Div64By32                                    C9E70  96 PC, medium confidence
; Divides a 64-bit value by a 32-bit one; followed by the signed and
; remainder variants
;-----------------------------------------------------------------------------
Div64By32:
        push edx
        mov eax, dword [byte esp+08h]
        mov edx, dword [byte esp+0Ch]
        div dword [byte esp+010h]
        pop edx
        ret 0Ch
        push edx
        mov eax, dword [byte esp+08h]
        mov edx, dword [byte esp+0Ch]
        idiv dword [byte esp+010h]
        pop edx
        ret 0Ch
        push edx
        mov eax, dword [byte esp+08h]
        mov edx, dword [byte esp+0Ch]
        div dword [byte esp+010h]
        LD mov, eax, edx
        pop edx
        ret 0Ch
        push edx
        mov eax, dword [byte esp+08h]
        mov edx, dword [byte esp+0Ch]
        idiv dword [byte esp+010h]
        LD mov, eax, edx
        pop edx
        ret 0Ch
        mov eax, dword [byte esp+04h]
        add eax, dword [byte esp+0Ch]
        mov dword [esi], eax
        mov eax, dword [byte esp+08h]
        adc eax, dword [byte esp+010h]
        mov dword [byte esi+04h], eax
        ret 10h
        push ecx
        push edx
        mov eax, dword [byte esp+0Ch]
        mov edx, dword [byte esp+010h]
        mov ecx, dword [byte esp+014h]
        cmp ecx, byte 20h
        jge short .1
        shld edx, eax, cl
        shl eax, cl
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        pop edx
        pop ecx
        ret 0Ch
.1:
        sub ecx, byte 20h
        LD mov, edx, eax
        LD xor, eax, eax
        shl edx, cl
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        pop edx
        pop ecx
        ret 0Ch
        push ecx
        push edx
        mov eax, dword [byte esp+0Ch]
        mov edx, dword [byte esp+010h]
        mov ecx, dword [byte esp+014h]
        cmp ecx, byte 20h
        jge short .2
        shrd eax, edx, cl
        shr edx, cl
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        pop edx
        pop ecx
        ret 0Ch
.2:
        sub ecx, byte 20h
        LD mov, eax, edx
        LD xor, edx, edx
        shr eax, cl
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        pop edx
        pop ecx
        ret 0Ch
;-----------------------------------------------------------------------------
; Sar64                                        C9F3A  96 PC, medium confidence
; Shifts a 64-bit number right, keeping the sign
;-----------------------------------------------------------------------------
Sar64:
        push ecx
        push edx
        mov eax, dword [byte esp+0Ch]
        mov edx, dword [byte esp+010h]
        mov ecx, dword [byte esp+014h]
        cmp ecx, byte 20h
        jge short .1
        shrd eax, edx, cl
        sar edx, cl
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        pop edx
        pop ecx
        ret 0Ch
.1:
        sub ecx, byte 20h
        LD mov, eax, edx
        cdq
        sar eax, cl
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        pop edx
        pop ecx
        ret 0Ch
        push edx
        mov eax, dword [byte esp+08h]
        mov edx, dword [byte esp+0Ch]
        not eax
        not edx
        add eax, byte 1
        adc edx, byte 0
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        pop edx
        ret 8
;-----------------------------------------------------------------------------
; Shl64                                           C9F8A  96 PC, low confidence
; Shifts a 64-bit value left
;-----------------------------------------------------------------------------
Shl64:
        push ecx
        LD mov, ecx, edx
        cmp ecx, byte 20h
        jge short .1
        cdq
        shld edx, eax, cl
        shl eax, cl
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        pop ecx
        ret
.1:
        sub ecx, byte 20h
        LD mov, edx, eax
        LD xor, eax, eax
        shl edx, cl
        mov dword [esi], eax
        mov dword [byte esi+04h], edx
        pop ecx
        ret
        db 00h
;-----------------------------------------------------------------------------
; min_                                                          C9FB0  library
; Returns the smaller of two signed numbers
;-----------------------------------------------------------------------------
min_:
        cmp eax, edx
        jl short .1
        mov eax, edx
.1:
        ret
