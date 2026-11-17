; Input: InstallBreakHandler, RemoveBreakHandler.
bits 32
%include "hockey.inc"
section s_E05DA progbits alloc exec nowrite align=1
extern AddExitHandler, BreakCallFunc, BreakDataSelector, ClearClipRect_30, DosGetVector, DosSetVector, SavedBreakOffset, SavedBreakSelector
global InstallBreakHandler, RemoveBreakHandler
;-----------------------------------------------------------------------------
; InstallBreakHandler                             E05DA  96 PC, low confidence
; Installs a Ctrl-Break handler through a real-mode callback in DOS memory
; and registers its removal at exit
;-----------------------------------------------------------------------------
InstallBreakHandler:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov dword [BreakCallFunc], eax
        mov ax, cs
        mov word [BreakDataSelector], ax
        cmp word [SavedBreakSelector], byte 0
        jne short .1
        mov ebx, 24h
        call DosGetVector
        mov dword [SavedBreakOffset], eax
        mov word [SavedBreakSelector], dx
        mov ebx, 24h
        mov dx, cs
        mov eax, ClearClipRect_30
        call DosSetVector
        push RemoveBreakHandler
        call AddExitHandler
        add esp, byte 4
.1:
        leave
        ret
;-----------------------------------------------------------------------------
; RemoveBreakHandler                              E062F  96 PC, low confidence
; Frees the DOS memory of the Ctrl-Break callback and clears its selector
;-----------------------------------------------------------------------------
RemoveBreakHandler:
        pusha
        mov ebx, 24h
        mov dx, word [SavedBreakSelector]
        mov eax, dword [SavedBreakOffset]
        LD or, dx, dx
        je short .1
        call DosSetVector
        mov word [SavedBreakSelector], 0
.1:
        popa
        ret
        db 00h,00h
