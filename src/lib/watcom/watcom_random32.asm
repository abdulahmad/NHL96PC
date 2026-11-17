; Watcom C runtime: Random32.
bits 32
%include "hockey.inc"
section s_E0898 progbits alloc exec nowrite align=1
extern RandIndex, RandomState
global Random32
;-----------------------------------------------------------------------------
; Random32                                     E0898  96 PC, medium confidence
; Same code as in the next game
;-----------------------------------------------------------------------------
Random32:
        mov eax, dword [RandIndex]
        add eax, dword [RandomState+10h]
        mov dword [RandomState+10h], eax
        adc eax, dword [RandomState+0Ch]
        mov dword [RandomState+0Ch], eax
        adc eax, dword [RandomState+8]
        mov dword [RandomState+8], eax
        adc eax, dword [RandomState+4]
        mov dword [RandomState+4], eax
        adc eax, dword [RandomState]
        mov dword [RandomState], eax
        inc dword [RandIndex]
        jne short .1
        inc dword [RandomState+10h]
        jne short .1
        inc dword [RandomState+0Ch]
        jne short .1
        inc dword [RandomState+8]
        jne short .1
        inc dword [RandomState+4]
        jne short .1
        inc dword [RandomState]
        inc eax
.1:
        ret
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        add eax, 0F22D0E56h
        mov dword [RandomState], eax
        add eax, 96041893h
        mov dword [RandomState+4], eax
        add eax, 3DF3B646h
        mov dword [RandomState+8], eax
        add eax, 40DDE76Dh
        mov dword [RandomState+0Ch], eax
        db 05h,0E1h,07Ah,032h,097h              ; insn: add eax,97327AE1h
        db 0A3h                                 ; insn: mov [RandomState+10h],eax
        dd RandomState+10h
        add eax, 0D1A9FBE7h
        mov dword [RandIndex], eax
        leave
        ret
