; EA library: FatalError.
bits 32
%include "hockey.inc"
section s_E0834 progbits alloc exec nowrite align=1
extern bailout_vec, FatalErrorHook, GraphicsReady, PrintBoxedText, PrintfSaveRegs, RestoreTextMode, SavedTextScreen, SetScreenTarget
extern WaitKey
global FatalError
;-----------------------------------------------------------------------------
; FatalError                                                      E0834  95 PC
; Prints an error message, in a box when graphics are up, and exits to DOS
;-----------------------------------------------------------------------------
FatalError:
        pop eax
        cmp dword [FatalErrorHook], byte 0
        jne short .2
        cmp dword [GraphicsReady], byte 0
        je short .1
        call SetScreenTarget
        push byte 0
        push byte 0
        call PrintBoxedText
        add esp, byte 8
        call WaitKey
.1:
        call RestoreTextMode
        call PrintfSaveRegs
        LD xor, eax, eax
        mov dword [SavedTextScreen], eax
        call dword [bailout_vec]
.2:
        push dword [FatalErrorHook]
        call RestoreTextMode
        call PrintfSaveRegs
        call dword [bailout_vec]
        ret
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov dword [FatalErrorHook], eax
        leave
        ret
