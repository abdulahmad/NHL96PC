; Assignment ring: replacing and pushing a player's assignment, and the extra attacker zone check.
bits 32
%include "hockey.inc"
%include "spa.inc"
section s_37ED0 progbits alloc exec nowrite align=1
extern assrefgoalpa_83E, ExtraAttackerOn, ExtraAttackerPending, ExtraAttackerPlayer, ExtraAttackerTeam, ExtraGoalieOut, gmode, OOlist
extern puckc, pucky, SortCords
global assextra6, assreplace, assreplace_1, assinsert
;-----------------------------------------------------------------------------
; assextra6                                       37ED0  96 PC, low confidence
; Placeholder (Abdul 2026-11-15): called from updateplayers and assextra2;
; zone analysis into ExtraAttackerPending.., not read yet
;-----------------------------------------------------------------------------
assextra6:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 10h, 0
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .3
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .1
        movsx eax, word [eax]
        neg eax
        jmp short .2
.1:
        movsx eax, word [eax]
.2:
        cmp eax, 164h
        jle short .4
.3:
        mov dword [ExtraAttackerPending], 0
        jmp near assrefgoalpa_83E
.4:
        mov eax, dword [puckc]
        mov dword [ExtraAttackerPending], 1
        movsx eax, byte [eax]
        cmp eax, byte 6
        setl dl
        movzx ebx, dl
        mov dl, byte [gmode]
        and dl, 2
        movsx edx, dl
        test edx, edx
        sete dl
        movzx edx, dl
        xor edx, ebx
        je short .5
        mov edi, 11h
        mov dword [byte ebp-0Ch], 1
        xor edx, edx
        jmp short .6
.5:
        mov edi, 0FFFFFFFFh
        mov edx, 10h
        mov dword [byte ebp-0Ch], edi
.6:
        mov esi, 0FFFFFFFFh
        mov dword [ExtraAttackerTeam], 0
        mov dword [ExtraAttackerOn], 0
        cmp eax, byte 6
        setl byte [byte ebp-04h]
        jmp near .15
.7:
        movsx ebx, byte [dword edx+OOlist]
        cmp ebx, byte 0Ch
        jge near .14
        imul eax, ebx, dword 0A0h
        add eax, SortCords
        cmp word [byte eax+01Ah], byte 0
        je near .14
        cmp word [byte eax+06h], byte 0
        jge short .8
        movsx ecx, word [byte eax+06h]
        mov dword [byte ebp-010h], ecx
        neg dword [byte ebp-010h]
        jmp short .9
.8:
        movsx ecx, word [byte eax+06h]
        mov dword [byte ebp-010h], ecx
.9:
        cmp dword [byte ebp-010h], 164h
        jg near .14
        mov cl, byte [byte eax+045h]
        and cl, 4
        movzx ecx, cl
        test ecx, ecx
        jne short .14
        movsx eax, word [byte eax+038h]
        cmp eax, SPAboardback
        jl short .10
        cmp eax, SPAinjury1
        jle short .14
.10:
        movzx ecx, byte [byte ebp-04h]
        cmp ebx, byte 6
        setl byte [byte ebp-08h]
        movzx eax, byte [byte ebp-08h]
        cmp ecx, eax
        jne short .12
        cmp dword [ExtraAttackerOn], byte 0
        jne short .11
        mov dword [ExtraAttackerPlayer], ebx
.11:
        mov esi, 1
        add dword [ExtraAttackerOn], esi
        jmp short .14
.12:
        cmp dword [ExtraAttackerTeam], byte 0
        jne short .13
        mov dword [ExtraGoalieOut], ebx
.13:
        cmp esi, byte 1
        je near assrefgoalpa_83E
        inc dword [ExtraAttackerTeam]
        xor esi, esi
.14:
        add edx, dword [byte ebp-0Ch]
.15:
        cmp edx, edi
        jne near .7
        jmp near assrefgoalpa_83E
;-----------------------------------------------------------------------------
; assreplace                         3804E  94G logic94.asm, medium confidence
; Replace player p's current assignment (asslist[assnum]) with a and set pfna
; so it starts on the next update.
;-----------------------------------------------------------------------------
assreplace:
        push ebx
assreplace_1:
        mov ebx, edx
        movsx edx, word [byte eax+01Ch]
        mov byte [byte edx+eax+01Eh], bl
        or byte [byte eax+044h], 2
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assinsert                          3805F  94G logic94.asm, medium confidence
; Push assignment a on player p's 8-entry assignment ring (assnum - 1, mod
; 8), so the current one resumes when a ends; then assreplace.
;-----------------------------------------------------------------------------
assinsert:
        push ebx
        mov bx, word [byte eax+01Ch]
        dec ebx
        xor bh, bh
        and bl, 7
        mov word [byte eax+01Ch], bx
        jmp short assreplace_1
