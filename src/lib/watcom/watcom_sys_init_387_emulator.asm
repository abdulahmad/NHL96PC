; Watcom C runtime: __sys_init_387_emulator.
bits 32
%include "hockey.inc"
section s_CA6AF progbits alloc exec nowrite align=1
extern DefaultControlWord, InitFpuFlags
global __sys_init_387_emulator
        db 00h
;-----------------------------------------------------------------------------
; __sys_init_387_emulator                                       CA6B0  library
; Run-time library: installs the x87 emulator when there is no FPU
;-----------------------------------------------------------------------------
__sys_init_387_emulator:
        push es
        push ecx
        push ebx
        push edx
        fninit
        push eax
        fnstcw word [esp]
        pop eax
        cmp ah, 3
        je short .1
        inc ebp
.1:
        or ebp, ebp
        je short .2
        call InitFpuFlags
.2:
        wait
        fninit
        fldcw word [DefaultControlWord]
        fldz
        fldz
        fldz
        fldz
        pop edx
        pop ebx
        pop ecx
        pop es
        ret
