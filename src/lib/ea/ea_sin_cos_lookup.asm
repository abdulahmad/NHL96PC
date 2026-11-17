; EA library: SinCosLookup.
bits 32
%include "hockey.inc"
section s_E2823 progbits alloc exec nowrite align=1
extern CosTable, SinCosTable, SinTable
global SinCosLookup
        db 00h
;-----------------------------------------------------------------------------
; SinCosLookup                                    E2824  96 PC, low confidence
; Returns the sine and cosine of an angle from the quarter-wave tables
;-----------------------------------------------------------------------------
SinCosLookup:
        mov eax, dword [byte esp+04h]
        mov ebx, dword [byte esp+08h]
        mov ecx, dword [byte esp+0Ch]
        movzx eax, ax
        and ah, 3
        jnp short .1
        jne short .3
        mov edx, dword [nosplit eax*4+SinTable]
        mov dword [ebx], edx
        neg eax
        mov edx, dword [nosplit eax*4+CosTable]
        mov dword [ecx], edx
        ret
.1:
        dec ah
        jne short .2
        neg eax
        mov edx, dword [nosplit eax*4+CosTable]
        mov dword [ebx], edx
        neg eax
        mov edx, dword [nosplit eax*4+SinTable]
        neg edx
        mov dword [ecx], edx
        ret
.2:
        mov edx, dword [nosplit eax*4+SinCosTable]
        neg edx
        mov dword [ebx], edx
        neg eax
        mov edx, dword [nosplit eax*4+SinTable+800h]
        neg edx
        mov dword [ecx], edx
        ret
.3:
        neg eax
        mov edx, dword [nosplit eax*4+SinTable+1000h]
        neg edx
        mov dword [ebx], edx
        neg eax
        LD xor, ah, ah
        mov edx, dword [nosplit eax*4+SinTable]
        mov dword [ecx], edx
        ret
