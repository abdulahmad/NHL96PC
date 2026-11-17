; Watcom C runtime: SaveStackSegment, __CHK, __GRO, __STK.
bits 32
%include "hockey.inc"
section s_D142B progbits alloc exec nowrite align=1
extern __fatal_runtime_error_, _STACKLOW, SavedStackSegment, str_StackOverflow
global SaveStackSegment, __CHK, __GRO, __STK
        db 00h
;-----------------------------------------------------------------------------
; SaveStackSegment                                D142C  96 PC, low confidence
; Saves the stack segment selector
;-----------------------------------------------------------------------------
SaveStackSegment:
        o16 mov word [SavedStackSegment], ss
        ret
;-----------------------------------------------------------------------------
; __CHK                                                         D1434  library
; Run-time library: stack overflow check
;-----------------------------------------------------------------------------
__CHK:
        xchg eax, dword [byte esp+04h]
        call __STK
        mov eax, dword [byte esp+04h]
        ret 4
;-----------------------------------------------------------------------------
; __GRO                                                         D1444  library
; Run-time library: stack grow check
;-----------------------------------------------------------------------------
__GRO:
        ret 4
;-----------------------------------------------------------------------------
; __STK                                                         D1447  library
; Run-time library: stack check on routine entry
;-----------------------------------------------------------------------------
__STK:
        cmp eax, esp
        jae short .1
        sub eax, esp
        neg eax
        cmp eax, dword [_STACKLOW]
        jbe short .1
        ret
.1:
        mov ax, ss
        cmp ax, word [SavedStackSegment]
        je short .2
        ret
.2:
        mov eax, str_StackOverflow
        mov edx, 1
        call __fatal_runtime_error_
