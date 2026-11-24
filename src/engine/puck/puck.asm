; Puck states: normal puck and no puck.
bits 32
%include "hockey.inc"
section s_348C9 progbits alloc exec nowrite align=1
extern psendcount, pucknorm_body, PuckObject
global pucknorm, pucknothing
;-----------------------------------------------------------------------------
; pucknorm                           348C9  94G logic94.asm, medium confidence
; Assignment table slot 18h: clears pfna, temp1 (+26h) = 0, temp2 (+28h) =
; 78h, then pucknorm_body
;-----------------------------------------------------------------------------
pucknorm:
        push edx
        mov dl, byte [byte eax+pflags]
        and dl, 2
        movzx edx, dl
        test edx, edx
        je short .1
        mov word [byte eax+temp1], 0
        mov word [byte eax+temp2], 78h
        and byte [byte eax+pflags], 0FDh
        mov dword [psendcount], 0
.1:
        call pucknorm_body
        pop edx
        ret
;-----------------------------------------------------------------------------
; pucknothing                                           348F8  94G logic94.asm
; Assignment table slot 1Ah: the puck with nothing to do
;-----------------------------------------------------------------------------
pucknothing:
        push ebx
        push edx
        mov edx, eax
        movsx ebx, word [byte eax+03Ah]
        cmp ebx, byte 4
        jl short .1
        cmp ebx, byte 0Ch
        jge short .1
        xor byte [byte eax+036h], 2
.1:
        mov word [byte eax+03Ah], 0
        mov word [byte eax+03Ch], 0FFFFh
        or byte [byte eax+036h], 4
        mov word [PuckObject+4Ah], 0
        pop edx
        pop ebx
        ret
