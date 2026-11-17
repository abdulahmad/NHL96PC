; EA library: MemLock, MemUnlock, mem_putc__0.
bits 32
%include "hockey.inc"
section s_C3BE0 progbits alloc exec nowrite align=1
global MemLock, MemUnlock, mem_putc__0
;-----------------------------------------------------------------------------
; MemLock                                         C3BE0  96 PC, low confidence
; Sets the memory lock; followed by the try-lock
;-----------------------------------------------------------------------------
MemLock:
        mov eax, dword [byte esp+04h]
        mov dword [eax], 1
        ret
        db 090h
        mov eax, dword [byte esp+04h]
        cmp dword [eax], byte 0
        je short .1
        xor eax, eax
        ret
.1:
        mov dword [eax], 1
        mov eax, 1
        ret
;-----------------------------------------------------------------------------
; MemUnlock                                    C3C04  96 PC, medium confidence
; Clears the memory lock
;-----------------------------------------------------------------------------
MemUnlock:
        mov eax, dword [byte esp+04h]
        mov dword [eax], 0
        ret
;-----------------------------------------------------------------------------
; mem_putc__0                                                   C3C0F  library
; Run-time library: stores one character into a memory string stream (vsprintf output)
;-----------------------------------------------------------------------------
mem_putc__0:
        push ebx
        push ecx
        mov bl, dl
        mov edx, dword [eax]
        lea ecx, [byte edx+01h]
        mov dword [eax], ecx
        mov byte [edx], bl
        inc dword [byte eax+010h]
        pop ecx
        pop ebx
        ret
