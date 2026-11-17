; Watcom C runtime: DetectCPU.
bits 32
%include "hockey.inc"
section s_B32D4 progbits alloc exec nowrite align=1
extern CpuFeatures, CpuHasCpuid, CpuIs386, CpuIs486, CpuType
global DetectCPU
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DetectCPU                                                       B32E0  95 PC
; Detects the CPU type (386, 486, Pentium) and its CPUID features
;-----------------------------------------------------------------------------
DetectCPU:
        mov dword [CpuIs386], 1
        mov dword [CpuIs486], 1
        smsw eax
        and eax, byte 1
        mov dword [CpuFeatures], eax
        pushf
        LD mov, edx, esp
        and esp, byte 0FFFFFFFCh
        pushf
        pop eax
        LD mov, ecx, eax
        xor eax, 40000h
        push eax
        popf
        pushf
        pop eax
        LD xor, eax, ecx
        shr eax, 12h
        and eax, byte 1
        push ecx
        popf
        LD mov, esp, edx
        popf
        mov dword [CpuType], eax
        cmp eax, byte 0
        je short .1
        pushf
        pop eax
        LD mov, ecx, eax
        or eax, 200000h
        push eax
        popf
        pushf
        pop eax
        LD xor, eax, ecx
        je short .1
        mov eax, 1
        cpuid
        and eax, 0F00h
        shr eax, 8
        cmp al, 5
        jl short .1
        mov dword [CpuHasCpuid], 1
.1:
        ret
