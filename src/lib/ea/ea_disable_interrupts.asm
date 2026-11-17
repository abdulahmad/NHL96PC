; EA library: DisableInterrupts, EnableInterrupts.
bits 32
%include "hockey.inc"
section s_C2440 progbits alloc exec nowrite align=1
global DisableInterrupts, EnableInterrupts
;-----------------------------------------------------------------------------
; DisableInterrupts                                               C2440  96 PC
; Disables interrupts
;-----------------------------------------------------------------------------
DisableInterrupts:
        cli
        ret
;-----------------------------------------------------------------------------
; EnableInterrupts                                                C2442  96 PC
; Enables interrupts
;-----------------------------------------------------------------------------
EnableInterrupts:
        sti
        ret
