; Watcom C runtime: Fini387Emulator.
bits 32
%include "hockey.inc"
section s_BE8C5 progbits alloc exec nowrite align=1
extern __sys_fini_387_emulator
global Fini387Emulator
;-----------------------------------------------------------------------------
; Fini387Emulator                                 BE8C5  95 PC, low confidence
; Shut down entry of the 387 emulator: jumps to the emulator shut down
;-----------------------------------------------------------------------------
Fini387Emulator:
        jmp near __sys_fini_387_emulator
        db 00h,00h
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        imul edx
        ret
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        mul edx
        ret
        mov eax, dword [byte esp+04h]
        cdq
        mov ebx, dword [byte esp+08h]
        idiv ebx
        ret
        mov eax, dword [byte esp+04h]
        LD xor, edx, edx
        mov ebx, dword [byte esp+08h]
        div ebx
        ret
        mov eax, dword [byte esp+04h]
        cdq
        mov ebx, dword [byte esp+08h]
        idiv ebx
        ret
        mov edx, dword [byte esp+04h]
        LD xor, eax, eax
        mov ebx, dword [byte esp+08h]
        div ebx
        shr eax, 0Ch
        ret
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        mov ebx, dword [byte esp+0Ch]
        div ebx
        ret
