; Player switching: the controlled player.
bits 32
%include "hockey.inc"
%include "spa.inc"
section s_464A6 progbits alloc exec nowrite align=1
extern HomeControlSlot, restorepl
global SetSPA, SetControlledPlayer
;-----------------------------------------------------------------------------
; SetSPA                                                464A6  94G logic94.asm
; Sets the sprite animation of a player; regd1 = the new animation
;-----------------------------------------------------------------------------
SetSPA:
        push ebx
        push ecx
        mov ebx, eax
        movsx eax, word [byte eax+038h]
        cmp dx, word [byte ebx+038h]
        je near .10
        movsx ecx, dx
        cmp ecx, byte SPAskate
        je short .1
        cmp ecx, byte SPAskatewp
        je short .1
        cmp ecx, SPAburst
        je short .1
        cmp ecx, 343h
        je short .1
        cmp ecx, 375h
        je short .1
        cmp ecx, SPAskatefast
        jne near .8
.1:
        movsx ecx, dx
        cmp ecx, SPAskatefast
        jne short .4
        cmp eax, byte SPAskate
        je short .2
        cmp eax, byte SPAskatewp
        je short .2
        cmp eax, SPAburst
        je short .2
        cmp eax, 343h
        je short .2
        cmp eax, 375h
        jne near .8
.2:
        mov word [byte ebx+038h], dx
        test dx, dx
        je short .3
        movsx eax, dx
        mov dword [byte ebx+07Eh], eax
.3:
        sar word [byte ebx+03Ah], 1
        pop ecx
        pop ebx
        ret
.4:
        cmp eax, byte SPAskate
        je short .5
        cmp eax, byte SPAskatewp
        je short .5
        cmp eax, SPAburst
        je short .5
        cmp eax, 343h
        je short .5
        cmp eax, 375h
        jne short .6
.5:
        mov word [byte ebx+038h], dx
        test dx, dx
        je short .10
        jmp short .9
.6:
        cmp eax, SPAskatefast
        jne short .8
        mov word [byte ebx+038h], dx
        test dx, dx
        je short .7
        mov dword [byte ebx+07Eh], ecx
.7:
        shl word [byte ebx+03Ah], 1
        pop ecx
        pop ebx
        ret
.8:
        mov word [byte ebx+03Ah], 0
        mov byte [byte ebx+046h], 0
        mov word [byte ebx+03Ch], 0FFFFh
        mov word [byte ebx+038h], dx
        test dx, dx
        je short .10
.9:
        movsx eax, dx
        mov dword [byte ebx+07Eh], eax
.10:
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetControlledPlayer                             46593  96 PC, low confidence
; Gives a control slot a new player
;-----------------------------------------------------------------------------
SetControlledPlayer:
        push ebx
        push ecx
        lea ebx, [eax+eax]
        movsx ecx, word [dword ebx+HomeControlSlot]
        cmp edx, ecx
        je short .1
        cwde
        movsx ecx, dx
        mov edx, eax
        mov eax, ecx
        call restorepl
        mov word [dword ebx+HomeControlSlot], ax
.1:
        pop ecx
        pop ebx
        ret
