; Watcom C runtime: Init387Emulator.
bits 32
%include "hockey.inc"
section s_BE8BE progbits alloc exec nowrite align=1
extern __sys_init_387_emulator
global Init387Emulator
        db 00h,00h
;-----------------------------------------------------------------------------
; Init387Emulator                                 BE8C0  96 PC, low confidence
; Jumps to the 387 emulator set-up
;-----------------------------------------------------------------------------
Init387Emulator:
        jmp near __sys_init_387_emulator
