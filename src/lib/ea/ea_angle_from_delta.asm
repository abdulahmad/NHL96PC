; EA library: AngleFromDelta, SinLookup, CosLookup, DebugLineCount.
bits 32
%include "hockey.inc"
section s_E25DE progbits alloc exec nowrite align=1
extern AngleOctantTable, RetraceMode, SinTable, TickWaitTarget, TimerTickStep
global AngleFromDelta, AngleFromDeltaJumpTable, SinLookup, CosLookup, DebugLineCount
        db 00h,00h
;-----------------------------------------------------------------------------
; AngleFromDelta                                  E25E0  96 PC, low confidence
; Returns the angle of a 2D vector from the ratio of its components
;-----------------------------------------------------------------------------
AngleFromDelta:
        push ebp
        LD mov, ebp, esp
        LD xor, ebx, ebx
        mov ecx, dword [byte ebp+0Ch]
        mov edx, dword [byte ebp+08h]
        LD or, ecx, ecx
        jge short .1
        or ebx, byte 8
        neg ecx
.1:
        LD or, edx, edx
        jge short .2
        or ebx, byte 10h
        neg edx
.2:
        LD cmp, edx, ecx
        jl short .3
        je short .4
        xchg ecx, edx
        or ebx, byte 4
.3:
        LD xor, eax, eax
        div ecx
        shr eax, 18h
        adc eax, byte 0
        movzx eax, byte [dword eax+AngleOctantTable]
        jmp dword [dword cs:ebx+AngleFromDeltaJumpTable]
.4:
        mov eax, 80h
        jmp dword [dword cs:ebx+AngleFromDeltaJumpTable]
AngleFromDeltaJumpTable:                        ; jump table for the switch cases of AngleFromDelta
        dd .2
        dd .1
        dd .3
        dd .4
        dd .5
        dd .6
        dd .7
        dd .8
.1:
        neg eax
        add eax, 100h
.2:
        leave
        ret
.3:
        neg eax
        add eax, 200h
        leave
        ret
.4:
        add eax, 100h
        leave
        ret
.5:
        neg eax
        leave
        ret
.6:
        sub eax, 100h
        leave
        ret
.7:
        sub eax, 200h
        leave
        ret
.8:
        neg eax
        sub eax, 100h
        leave
        ret
;-----------------------------------------------------------------------------
; SinLookup                                       E2680  96 PC, low confidence
; Returns the sine of a 10-bit angle from the quarter-wave table
;-----------------------------------------------------------------------------
SinLookup:
        mov eax, dword [byte esp+04h]
        shl ah, 7
        LD sbb, edx, edx
        LD add, ah, ah
        LD sbb, ecx, ecx
        LD xor, eax, ecx
        and eax, 0FFh
        LD sub, eax, ecx
        mov eax, dword [nosplit eax*4+SinTable]
        LD xor, eax, edx
        LD sub, eax, edx
        ret
;-----------------------------------------------------------------------------
; CosLookup                                       E26A2  96 PC, low confidence
; Returns the cosine of a 10-bit angle from the quarter-wave table
;-----------------------------------------------------------------------------
CosLookup:
        mov eax, dword [byte esp+04h]
        lea ecx, [dword eax+0100h]
        shl ch, 7
        LD sbb, edx, edx
        LD add, ch, ch
        LD sbb, ecx, ecx
        LD xor, eax, ecx
        and eax, 0FFh
        LD sub, eax, ecx
        mov eax, dword [nosplit eax*4+SinTable]
        LD xor, eax, edx
        LD sub, eax, edx
        ret
        db 00h,00h
        mov dword [RetraceMode], 0
        ret
        db 00h
        mov eax, dword [TimerTickStep]
        ret
        mov eax, dword [byte esp+04h]
        add eax, dword [TimerTickStep]
        mov dword [TickWaitTarget], eax
        ret
.1:
        mov eax, dword [TimerTickStep]
        sub eax, dword [TickWaitTarget]
        js short .1
        ret
        mov ebx, dword [TimerTickStep]
        sub ebx, dword [TickWaitTarget]
        LD sbb, eax, eax
        inc eax
        ret
;-----------------------------------------------------------------------------
; DebugLineCount                                  E270C  96 PC, low confidence
; Returns the debug line count
;-----------------------------------------------------------------------------
DebugLineCount:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFFCh
        mov eax, dword [TimerTickStep]
        add eax, dword [byte ebp+08h]
        mov dword [byte ebp-04h], eax
.1:
        mov eax, dword [TimerTickStep]
        sub eax, dword [byte ebp-04h]
        js short .1
        leave
        ret
