; Skater assignments: box, bench, Stanley Cup skate, defence and wings.
bits 32
%include "hockey.inc"
%include "spa.inc"
section s_2F3DF progbits alloc exec nowrite align=1
extern assextra4, assextra6, assinsert, assreplace, PBflags, check4bench, check4check, donothing
extern ExtraAttackerOn, ExtraAttackerTeam, ExtraAttackerPlayer, ExtraAttackerPending, EvadePC, gmode, gmode2, puckvy
extern PtrRefObject, PBnum, PenCntDwn, playeracc, puckc, puckx, pucky, randomd0
extern ReadJoy1, regd0, regd1, regd2, regd3, SetExitGame, SetSPA, skateto
extern SkateToSpot, slotteam, SortCords, RunPreGameSkate_450, RunPreGameSkate_451, assexitjump, GameEventStub, PlayArenaClip
extern SwapPosition, updateanim, vecdist, vtoa, CupLeaveSlot, CupLeaveSlotNext, CupGoalieSlot, CupGoalieSlotNext
extern CupHomeGoalieSlot, CupHomeGoalieSlotNext
global TurnToward, SkateToTarget, assboxenter, assbenchside, assstanley, asscupfollow, asscuptake, asscupleave
global assextra2, GetPartner, defotarget, assdefo, asscoverdefo, defdtarget, assdefd, asscoverdefd
global assextra3, asswingd
;-----------------------------------------------------------------------------
; TurnToward                                   2F3DF  96 PC, medium confidence
; Every 8 ticks turns the facing direction (+36h) one step toward direction
; edx
;-----------------------------------------------------------------------------
TurnToward:
        push ebx
        dec word [byte eax+026h]
        cmp word [byte eax+026h], byte 0
        jge short .3
        movsx ebx, word [byte eax+036h]
        add word [byte eax+026h], byte 8
        cmp edx, ebx
        je short .3
        sub edx, ebx
        and edx, byte 7
        cmp edx, byte 4
        jle short .1
        mov edx, 0FFFFFFFFh
        jmp short .2
.1:
        mov edx, 1
.2:
        movsx ebx, word [byte eax+036h]
        add edx, ebx
        and edx, byte 7
        mov word [byte eax+036h], dx
.3:
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SkateToTarget                                2F41D  96 PC, medium confidence
; Direction to the target point (+2Ah, +2Ch) with vtoa, TurnToward, then
; playeracc
;-----------------------------------------------------------------------------
SkateToTarget:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov eax, dword [PtrRefObject]
        movsx eax, word [byte eax+02Eh]
        imul eax, dword 0A0h
        mov ecx, SortCords
        add ecx, eax
        mov ax, word [byte ebx+temp4]
        sub ax, word [byte ebx+Ypos+2]
        movsx edx, ax
        mov ax, word [byte ebx+temp3]
        sub ax, word [byte ebx+Xpos+2]
        cwde
        call vtoa
        mov word [regd0], ax
        movsx eax, word [byte ebx+assnum]
        movsx eax, byte [byte ebx+eax+01Eh]
        cmp eax, byte 33h
        jne short .1
        mov eax, dword [PtrRefObject]
        cmp word [byte eax+02Eh], byte 0
        jl short .1
        mov ax, word [byte ecx+06h]
        sub ax, word [byte ebx+Ypos+2]
        movsx edx, ax
        mov ax, word [byte ecx+02h]
        sub ax, word [byte ebx+Xpos+2]
        cwde
        call vtoa
        movsx edx, ax
        jmp short .2
.1:
        movsx edx, word [regd0]
.2:
        cmp edx, byte 7
        jg short .3
        mov eax, ebx
        call TurnToward
.3:
        movsx eax, word [regd0]
        cmp eax, byte 7
        jg short .5
        mov eax, dword [PtrRefObject]
        mov dx, word [dword ebx+SCnum]
        cmp dx, word [byte eax+02Eh]
        jne short .4
        movsx eax, word [byte ebx+temp1]
        mov ecx, 3
        cdq
        idiv ecx
        test edx, edx
        jne short .5
.4:
        movsx edx, word [regd0]
        mov eax, ebx
        call playeracc
.5:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assboxenter                                                     2F4E2  95 PC
; Asstab 2Ah: PenCntDwn 12Ch.
;
; skates to x -91h,y 6, then seats the player in the box (pflags 20h, tmpde
; 800h, SetBoxDoorObject) and opens the box door sprite (sortobj15)
;-----------------------------------------------------------------------------
assboxenter:
        push ebx
        push edx
        mov ebx, eax
        mov word [PenCntDwn], 0BB8h
        mov al, byte [byte eax+pflags]
        and al, 20h
        movzx eax, al
        test eax, eax
        je short .1
        movsx eax, word [byte ebx+SPA]
        cmp eax, SPAgetcup
        jne near .11
        movsx eax, word [byte ebx+SPAnum]
        cmp eax, byte 8
        jl near .11
        mov eax, dword [PtrRefObject]
        mov word [byte eax+temp1], 0C8h
        movsx edx, byte [byte ebx+pnum]
        mov eax, dword [dword ebx+tmptr]
        mov word [byte eax+edx*2+tmpde], 800h
        mov eax, dword [PtrRefObject]
        mov dx, word [dword ebx+SCnum]
        mov word [byte eax+temp5], dx
        mov eax, ebx
        call assexitjump
        pop edx
        pop ebx
        ret
.1:
        mov al, byte [byte ebx+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .2
        mov word [byte ebx+temp2], 8
        mov word [byte ebx+temp4], 0
        mov word [byte ebx+temp3], 0FF8Bh
        mov word [byte ebx+temp1], 0
        mov word [byte ebx+temp5], 0
        and byte [byte ebx+pflags], 0FDh
.2:
        movsx eax, word [byte ebx+temp1]
        cmp eax, 0C8h
        jne short .3
        mov eax, dword [PtrRefObject]
        or byte [byte eax+pflags], 20h
        mov edx, SPAgvcup
        mov eax, dword [PtrRefObject]
        call SetSPA
        mov edx, SPAgetcup
        mov eax, ebx
        or byte [byte ebx+pflags], 20h
        call SetSPA
        mov eax, ebx
        call updateanim
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        mov word [byte ebx+facedir], 5
        test eax, eax
        setne al
        movzx eax, al
        call GameEventStub
        mov byte [PBflags], 0
        mov byte [PBnum], 0
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        mov word [byte ebx+temp1], 12Ch
        test eax, eax
        jne near .11
        mov eax, 49h
        call PlayArenaClip
        pop edx
        pop ebx
        ret
.3:
        cmp eax, byte 64h
        jne short .4
        mov eax, dword [PtrRefObject]
        movsx edx, word [byte eax+temp1]
        cmp edx, byte 64h
        jne near .11
        mov byte [byte eax+046h], 0
        mov eax, dword [PtrRefObject]
        or byte [byte eax+pflags], 20h
        mov edx, SPAboxdooropen
        mov eax, dword [PtrRefObject]
        call SetSPA
        mov byte [byte ebx+046h], 0
        mov edx, SPAboxenter
        and byte [byte ebx+attribute], 0F7h
        mov eax, ebx
        or byte [byte ebx+pflags], 20h
        call SetSPA
        mov eax, ebx
        call updateanim
        mov word [byte ebx+temp1], 0C8h
        pop edx
        pop ebx
        ret
.4:
        dec word [byte ebx+temp1]
        cmp word [byte ebx+temp1], byte 0
        jge near .10
        mov ax, word [byte ebx+Ypos+2]
        add word [byte ebx+temp1], byte 8
        sub ax, word [byte ebx+temp4]
        mov word [regd1], ax
        mov ax, word [byte ebx+Xpos+2]
        sub ax, word [byte ebx+temp3]
        mov word [regd0], ax
        cmp word [regd1], byte 0
        jge short .5
        movsx eax, word [regd1]
        neg eax
        jmp short .6
.5:
        movsx eax, word [regd1]
.6:
        cmp eax, byte 4
        jg near .10
        movsx eax, word [regd0]
        cmp eax, byte 4
        jg near .10
        mov ax, word [byte ebx+temp4]
        mov word [byte ebx+Yvel], 0
        mov word [byte ebx+Ypos+2], ax
        mov ax, word [byte ebx+temp3]
        mov edx, SPAstandrest
        mov word [byte ebx+Xpos+2], ax
        mov eax, ebx
        mov word [byte ebx+Xvel], 0
        call SetSPA
        movsx eax, word [byte ebx+facedir]
        or byte [byte ebx+pflags], 4
        cmp eax, byte 6
        je short .9
        cmp eax, byte 7
        jge short .7
        cmp eax, byte 2
        jle short .7
        mov eax, 1
        jmp short .8
.7:
        mov eax, 0FFFFFFFFh
.8:
        movsx edx, word [byte ebx+facedir]
        add eax, edx
        and eax, byte 7
        mov word [byte ebx+facedir], ax
.9:
        movsx eax, word [byte ebx+facedir]
        cmp eax, byte 6
        jne short .11
        mov edx, SPAcupwaitl
        mov eax, ebx
        mov word [byte ebx+temp1], 64h
        call SetSPA
        pop edx
        pop ebx
        ret
.10:
        mov al, byte [byte ebx+pflags]
        and al, 4
        movzx eax, al
        test eax, eax
        jne short .11
        mov ax, word [byte ebx+temp3]
        mov word [regd0], ax
        mov ax, word [byte ebx+temp4]
        xor edx, edx
        mov word [regd1], ax
        mov eax, ebx
        call SkateToSpot
.11:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assbenchside                                                    2F763  95 PC
; Asstab 2Bh (clockcont_0): when the camera is at the left boards (camx <=
; -20h.
;
; |camy| <= 14h) places the sprite at x -0BEh,y 3 and plays bench-side
; animations 0E97h / 0EB5h; waits on PaSpeechBusy
;-----------------------------------------------------------------------------
assbenchside:
        push ebx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+pflags]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .10
        mov al, byte [byte ebx+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .1
        mov word [byte ebx+temp1], 0FFFFh
        mov word [byte ebx+Xpos+2], 0FF56h
        mov word [byte ebx+Ypos+2], 0
        mov word [byte ebx+Yvel], 0
        mov byte [byte ebx+046h], 0
        and byte [byte ebx+pflags], 0FDh
        mov ax, word [byte ebx+Yvel]
        mov edx, SPAbrcup
        mov word [byte ebx+Xvel], ax
        mov eax, ebx
        mov word [byte ebx+temp1], 0
        call SetSPA
        mov word [byte ebx+facedir], 2
        mov dword [byte ebx+072h], 0C8h
.1:
        cmp dword [byte ebx+072h], byte 0
        jl short .2
        dec dword [byte ebx+072h]
        pop edx
        pop ebx
        ret
.2:
        movsx eax, word [byte ebx+temp1]
        cmp eax, byte 64h
        jge short .5
        movsx eax, word [byte ebx+Xpos+2]
        cmp eax, byte 0FFFFFF81h
        jl short .3
        mov edx, 8C1h
        mov eax, ebx
        mov word [byte ebx+temp1], 64h
        jmp short .4
.3:
        mov edx, SPAclap
        mov eax, ebx
.4:
        call SetSPA
        add dword [ebx], 4000h
        pop edx
        pop ebx
        ret
.5:
        cmp eax, 12Ch
        jne near .9
        mov edx, dword [PtrRefObject]
        movsx eax, word [byte edx+02Eh]
        imul eax, dword 0A0h
        add eax, SortCords
        cmp word [byte edx+02Eh], byte 0
        jl short .6
        movsx edx, word [byte eax+Ypos+2]
        cmp edx, byte 0FFFFFF8Ch
        jle short .6
        cmp word [byte eax+Xpos+2], byte 0
        jle short .6
        mov eax, ebx
        xor edx, edx
        mov word [byte ebx+frame], 0FFFFh
        call SetSPA
        mov dword [byte ebx+07Eh], 0
.6:
        xor edx, edx
        xor ebx, ebx
.7:
        cmp word [dword ebx+slotteam], byte 0
        je short .8
        mov eax, edx
        call ReadJoy1
        mov ax, word [regd1]
        xor ah, ah
        and al, 70h
        cwde
        test eax, eax
        je short .8
        call SetExitGame
.8:
        inc edx
        inc ebx
        inc ebx
        cmp edx, byte 4
        jge short .10
        jmp short .7
.9:
        cmp eax, 0C8h
        jl short .10
        mov edx, SPAbenchstand
        mov eax, ebx
        call SetSPA
        movsx eax, word [byte ebx+temp1]
        cmp eax, 0C8h
        jne short .10
        mov eax, dword [PtrRefObject]
        cmp word [byte eax+temp5], byte 0
        jl short .10
        mov word [byte ebx+temp1], 12Ch
.10:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assstanley                                            2F8BF  94G logic94.asm
; Assignment table slot 8: the Stanley Cup skate after the final
;-----------------------------------------------------------------------------
assstanley:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        mov al, byte [byte eax+pflags]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .27
        mov al, byte [byte esi+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .1
        mov word [byte esi+temp1], 0
        mov word [byte esi+temp5], 0FFFFh
        mov ax, word [byte esi+Xpos+2]
        mov dword [byte esi+072h], 0
        mov word [byte esi+temp3], ax
        mov ax, word [byte esi+Ypos+2]
        mov word [byte esi+temp4], ax
        mov eax, 0C8h
        and byte [byte esi+pflags], 0FDh
        call randomd0
        cwde
        add eax, 0C8h
        xor edx, edx
        mov dword [byte esi+06Eh], eax
        mov eax, esi
        mov byte [byte esi+046h], 0
        call SetSPA
        movsx eax, byte [byte esi+pnum]
        mov edx, dword [dword esi+tmptr]
        mov word [byte edx+eax*2+tmpde], 0
        mov byte [byte esi+legstr], 0
        mov byte [byte esi+weight], 0Fh
        and byte [byte esi+pflags], 0FBh
        or byte [byte esi+pflags2], 20h
        mov al, byte [byte esi+legstr]
        mov byte [byte esi+legspd], al
.1:
        cmp dword [byte esi+06Eh], byte 0
        jl short .2
        dec dword [byte esi+06Eh]
.2:
        cmp word [byte esi+temp5], byte 0
        jge near .25
        cmp word [byte esi+Ypos+2], byte 0
        jge short .3
        movsx eax, word [byte esi+Ypos+2]
        neg eax
        jmp short .4
.3:
        movsx eax, word [byte esi+Ypos+2]
.4:
        cmp eax, 100h
        jge short .8
.5:
        cmp word [byte esi+Xpos+2], byte 0
        jge short .7
        mov eax, 0FFFFFFECh
.6:
        movsx edx, word [byte esi+Ypos+2]
        add eax, edx
        mov word [byte esi+temp4], ax
        jmp short .13
.7:
        mov eax, 14h
        jmp short .6
.8:
        movsx eax, word [byte esi+Xpos+2]
        cmp eax, byte 5Ah
        jle short .9
        cmp word [byte esi+Ypos+2], byte 0
        jl short .5
.9:
        movsx eax, word [byte esi+Xpos+2]
        cmp eax, byte 0FFFFFFA6h
        jge short .10
        cmp word [byte esi+Ypos+2], byte 0
        jg short .5
.10:
        cmp word [byte esi+Ypos+2], byte 0
        jge short .11
        mov eax, 14h
        jmp short .12
.11:
        mov eax, 0FFFFFFECh
.12:
        movsx edx, word [byte esi+Xpos+2]
        add eax, edx
        mov word [byte esi+temp3], ax
.13:
        cmp word [byte esi+SPA], byte 0
        jne near .26
        movsx eax, byte [byte esi+pnum]
        mov edx, dword [dword esi+tmptr]
        mov word [byte edx+eax*2+tmpde], 300h
        mov edx, SPAcupstand
        mov eax, esi
        call SetSPA
        mov eax, 100h
        call randomd0
        cwde
        cmp eax, 80h
        jle near .21
        cmp dword [byte esi+06Eh], byte 0
        jge near .21
        mov eax, 6
        call randomd0
        movsx edx, ax
        movsx eax, word [dword esi+SCnum]
        cmp eax, byte 6
        jge short .14
        xor eax, eax
        jmp short .15
.14:
        mov eax, 6
.15:
        imul eax, dword 0A0h
        imul ebx, edx, dword 0A0h
        add eax, SortCords
.16:
        add eax, ebx
        mov bx, word [dword eax+SCnum]
        cmp bx, word [dword esi+SCnum]
        je short .17
        cmp word [byte eax+position], byte 0
        jg short .20
.17:
        lea eax, [byte edx+01h]
        mov ebx, 6
        cdq
        idiv ebx
        movsx eax, word [dword esi+SCnum]
        cmp eax, ebx
        jge short .18
        xor eax, eax
        jmp short .19
.18:
        mov eax, ebx
.19:
        imul eax, dword 0A0h
        mov ebx, SortCords
        add ebx, eax
        imul eax, edx, dword 0A0h
        jmp short .16
.20:
        mov dword [byte esi+072h], 64h
        mov edx, 34h
        mov word [byte esi+temp5], bx
        call assinsert
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.21:
        cmp eax, byte 40h
        jge short .23
        mov edx, SPAstanley
.22:
        mov eax, esi
        call SetSPA
        jmp short .26
.23:
        cmp eax, 80h
        jge short .24
        mov edx, 98Bh
        jmp short .22
.24:
        movsx eax, word [byte esi+Yvel]
        push eax
        movsx eax, word [byte esi+Xvel]
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, 1F4h
        jbe short .26
        mov edx, 909h
        jmp short .22
.25:
        movsx eax, word [byte esi+temp5]
        imul eax, dword 0A0h
        add eax, SortCords
        mov dx, word [byte eax+Ypos+2]
        mov ax, word [byte eax+Xpos+2]
        sub dx, word [byte esi+Ypos+2]
        sub ax, word [byte esi+Xpos+2]
        movsx edx, dx
        cwde
        call vtoa
        movsx edx, ax
        mov eax, esi
        call TurnToward
.26:
        cmp dword [byte esi+072h], byte 64h
        je short .27
        mov eax, esi
        call SkateToTarget
.27:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; asscupfollow                                 2FB3D  96 PC, medium confidence
; Asstab entry 33h, given by clockcont on a cup win and to a player who
; handed the cup on: skates around near the cup holder and celebrates
;-----------------------------------------------------------------------------
asscupfollow:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov esi, eax
        mov eax, dword [PtrRefObject]
        movsx eax, word [byte eax+02Eh]
        imul eax, dword 0A0h
        mov ebx, SortCords
        add ebx, eax
        mov al, byte [byte esi+pflags]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near RunPreGameSkate_451
        mov al, byte [byte esi+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .2
        mov word [byte esi+temp3], 0FFD6h
        mov word [byte esi+temp4], 0
        mov word [byte esi+temp5], 0
        mov word [byte esi+temp1], 0
        mov byte [byte esi+046h], 0
        and byte [byte esi+pflags], 0FDh
        cmp word [byte esi+position], byte 0
        jle short .1
        mov edx, SPAcupidle
        mov eax, esi
        call SetSPA
.1:
        movsx eax, byte [byte esi+pnum]
        mov edx, dword [dword esi+tmptr]
        mov word [byte edx+eax*2+tmpde], 64h
        mov byte [byte esi+legstr], 0Ah
        mov byte [byte esi+weight], 5
        and byte [byte esi+pflags], 0FBh
        and byte [byte esi+pflags2], 0DFh
        mov al, byte [byte esi+legstr]
        mov byte [byte esi+legspd], al
.2:
        mov eax, dword [PtrRefObject]
        cmp word [byte eax+02Eh], byte 0
        jl near .8
        cmp word [byte esi+Xvel], byte 0
        jle short .3
        mov eax, 0FFFFFFF8h
        jmp short .4
.3:
        mov eax, 8
.4:
        movsx edx, word [byte ebx+02h]
        add edx, eax
        mov eax, 28h
        call randomd0
        cwde
        sub eax, byte 14h
        add eax, edx
        mov word [byte esi+temp3], ax
        cmp word [byte esi+Yvel], byte 0
        jle short .5
        mov eax, 0FFFFFFF8h
        jmp short .6
.5:
        mov eax, 8
.6:
        movsx edx, word [byte ebx+06h]
        add edx, eax
        mov eax, 28h
        call randomd0
        cwde
        sub eax, byte 14h
        add eax, edx
        mov word [byte esi+temp4], ax
        mov eax, 20h
        call randomd0
        movsx edi, ax
        movsx edx, word [byte esi+temp4]
        movsx eax, word [byte esi+Ypos+2]
        sub edx, eax
        push edx
        movsx eax, word [byte esi+Xpos+2]
        movsx edx, word [byte esi+temp3]
        sub edx, eax
        push edx
        add edi, byte 40h
        call vecdist
        add esp, byte 8
        cmp eax, edi
        jbe short .7
        or byte [byte esi+pflags2], 20h
        jmp short .8
.7:
        and byte [byte esi+pflags2], 0DFh
.8:
        cmp word [byte esi+position], byte 0
        jne short .11
        mov eax, esi
        or byte [byte esi+048h], 3
        call SkateToTarget
        movsx eax, word [byte esi+Yvel]
        push eax
        movsx eax, word [byte esi+Xvel]
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, 1F4h
        jle short .9
        mov edx, SPAcupfollow2
        jmp short .10
.9:
        mov edx, SPAcupfollowhold
.10:
        mov eax, esi
        call SetSPA
        mov ax, word [byte esi+temp4]
        sub ax, word [byte esi+Ypos+2]
        movsx edx, ax
        mov ax, word [byte esi+temp3]
        sub ax, word [byte esi+Xpos+2]
        cwde
        call vtoa
        movsx edx, ax
        mov eax, esi
        call TurnToward
        jmp near RunPreGameSkate_451
.11:
        mov eax, esi
        call SkateToTarget
        movsx eax, word [byte esi+Yvel]
        push eax
        movsx eax, word [byte esi+Xvel]
        push eax
        call vecdist
        mov edx, eax
        mov al, byte [byte esi+pflags2]
        and al, 2
        movzx eax, al
        add esp, byte 8
        test eax, eax
        jne near RunPreGameSkate_451
        mov eax, 100h
        call randomd0
        cwde
        cmp word [byte esi+temp5], byte 0
        jne near .17
        cmp word [byte esi+SPA], byte 0
        jne near RunPreGameSkate_451
        cmp eax, 0C8h
        jle short .12
        mov edx, SPAcupturn
        mov eax, esi
        or byte [byte esi+pflags2], 2
        call SetSPA
        mov word [byte esi+temp5], 1
        jmp near RunPreGameSkate_451
.12:
        cmp edx, 1F4h
        jle short .14
        mov edx, 92Dh
.13:
        mov eax, esi
        jmp near .21
.14:
        mov ebx, 3
        cdq
        idiv ebx
        test edx, edx
        jne short .15
        mov edx, 983h
        jmp short .13
.15:
        cmp edx, byte 1
        jne short .16
        mov edx, 925h
        jmp short .13
.16:
        mov edx, 929h
        jmp short .13
.17:
        cmp word [byte esi+SPA], byte 0
        jne near RunPreGameSkate_451
        cmp eax, 0C8h
        jle short .18
        mov edx, SPAcuptake
        mov eax, esi
        or byte [byte esi+pflags2], 2
        call SetSPA
        mov word [byte esi+temp5], 0
        jmp near RunPreGameSkate_451
.18:
        cmp eax, byte 28h
        jge short .19
        mov edx, 953h
        mov eax, esi
        or byte [byte esi+pflags2], 2
        jmp short .21
.19:
        cmp edx, 1F4h
        jle short .20
        mov edx, SPAcupfollow
        jmp short .13
.20:
        mov edx, SPAcupturnhold
        mov eax, esi
.21:
        call SetSPA
        jmp near RunPreGameSkate_451
;-----------------------------------------------------------------------------
; asscuptake                                   2FDE3  96 PC, medium confidence
; Asstab entry 34h, set by assstanley: skates to the cup holder, turns to
; face him and takes the cup (he gets 33h, the taker assignment 8)
;-----------------------------------------------------------------------------
asscuptake:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov eax, dword [PtrRefObject]
        movsx edx, word [byte eax+02Eh]
        imul edx, dword 0A0h
        mov edi, SortCords
        add edi, edx
        cmp word [byte eax+02Eh], byte 0
        jl near RunPreGameSkate_450
        mov al, byte [byte esi+pflags]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near RunPreGameSkate_450
        mov al, byte [byte esi+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .3
        mov word [byte esi+temp1], 0
        mov byte [byte esi+046h], 0
        movsx eax, word [byte esi+temp5]
        and byte [byte esi+pflags], 0FDh
        cmp eax, byte 1
        jne short .1
        mov edx, SPAcuptake
        mov eax, esi
        or byte [byte esi+pflags], 20h
        call SetSPA
        mov word [byte esi+temp5], 0
        jmp short .2
.1:
        mov edx, SPAcupidle
        mov eax, esi
        call SetSPA
.2:
        and byte [byte esi+pflags], 0FBh
        or byte [byte esi+pflags2], 20h
.3:
        movsx eax, word [byte esi+temp1]
        cmp eax, byte 64h
        jne short .6
        mov ax, word [byte edi+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        je short .4
        and byte [byte esi+attribute], 0F7h
        jmp short .5
.4:
        or byte [byte esi+attribute], 8
.5:
        mov edx, SPAcupstand
        mov eax, esi
        or byte [byte esi+pflags], 20h
        call SetSPA
        mov edx, 8
        mov eax, esi
        call assreplace
        mov eax, dword [PtrRefObject]
        mov dx, word [dword esi+SCnum]
        mov word [byte eax+02Eh], dx
        mov edx, SPAcuptake
        mov eax, edi
        or byte [byte edi+pflags], 20h
        call SetSPA
        mov edx, 33h
        mov eax, edi
        call assreplace
        jmp near RunPreGameSkate_450
.6:
        mov ax, word [byte edi+Xpos+2]
        mov word [byte esi+temp3], ax
        mov ax, word [byte edi+Ypos+2]
        mov word [byte esi+temp4], ax
        movsx edx, word [byte esi+temp3]
        movsx eax, word [byte esi+Xpos+2]
        sub edx, eax
        mov dword [byte ebp-04h], edx
        movsx eax, word [byte esi+Ypos+2]
        movsx edx, word [byte esi+temp4]
        sub edx, eax
        push edx
        push dword [byte ebp-04h]
        mov dword [byte ebp-08h], edx
        call vecdist
        add esp, byte 8
        cmp eax, byte 0Ah
        jae short .8
        mov ax, word [byte edi+Xvel]
        mov word [byte esi+Xvel], ax
        mov ax, word [byte edi+Yvel]
        movsx edx, word [byte ebp-08h]
        mov word [byte esi+Yvel], ax
        movsx eax, word [byte ebp-04h]
        call vtoa
        cwde
        movsx edx, word [byte esi+facedir]
        cmp edx, eax
        jne short .7
        add eax, byte 4
        movsx edx, word [byte edi+facedir]
        and eax, byte 7
        cmp edx, eax
        jne near RunPreGameSkate_450
        mov edx, SPAcuptakeend
        mov eax, esi
        or byte [byte esi+pflags], 20h
        call SetSPA
        mov word [byte esi+temp1], 64h
        jmp near RunPreGameSkate_450
.7:
        mov edx, eax
        mov eax, esi
        call TurnToward
        jmp near RunPreGameSkate_450
.8:
        mov eax, esi
        call SkateToTarget
        jmp near RunPreGameSkate_450
;-----------------------------------------------------------------------------
; asscupleave                                  2FF84  96 PC, medium confidence
; Asstab entry 35h, given by clockcont to the losing team on a cup win:
; skates to the bench door, then is put on the bench
;-----------------------------------------------------------------------------
asscupleave:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .23
        mov al, byte [byte ebx+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .3
        mov al, byte [byte ebx+pflags]
        and al, 40h
        mov word [byte ebx+temp2], 8
        movzx eax, al
        and byte [byte ebx+pflags], 0FDh
        test eax, eax
        jne short .1
        mov eax, 0FFFFFFC6h
        jmp short .2
.1:
        mov eax, 3Ah
.2:
        mov word [byte ebx+temp3], 0FF4Eh
        mov word [byte ebx+temp1], 0
        mov word [byte ebx+temp4], ax
        or byte [byte ebx+pflags2], 20h
.3:
        movsx eax, word [byte ebx+temp1]
        cmp eax, byte 64h
        je near .18
        cmp word [byte ebx+position], byte 0
        jl near .18
        jne short .4
        or byte [byte ebx+048h], 3
.4:
        dec word [byte ebx+temp1]
        cmp word [byte ebx+temp1], byte 0
        jge near .14
        add word [byte ebx+temp1], byte 8
        mov dx, word [byte ebx+Xpos+2]
        mov ax, word [byte ebx+Ypos+2]
        sub dx, word [byte ebx+temp3]
        sub ax, word [byte ebx+temp4]
        mov word [regd0], dx
        test ax, ax
        jge short .5
        cwde
        neg eax
        jmp short .6
.5:
        cwde
.6:
        cmp eax, byte 20h
        jg near .14
        movsx eax, word [regd0]
        cmp eax, byte 20h
        jg near .14
        cmp word [byte ebx+position], byte 0
        jne short .7
        mov eax, SPAgready2
        jmp short .8
.7:
        mov eax, SPAstandrest
.8:
        mov word [regd1], ax
        movsx edx, ax
        mov eax, ebx
        call SetSPA
        movsx eax, word [byte ebx+facedir]
        or byte [byte ebx+pflags], 4
        cmp eax, byte 6
        je short .11
        cmp eax, byte 2
        jl short .9
        cmp eax, byte 6
        jge short .9
        mov eax, 1
        jmp short .10
.9:
        mov eax, 0FFFFFFFFh
.10:
        movsx edx, word [byte ebx+facedir]
        add eax, edx
        and eax, byte 7
        mov word [byte ebx+facedir], ax
.11:
        mov word [byte ebx+Yvel], 0
        mov word [byte ebx+Xvel], 0F800h
        movsx eax, word [regd0]
        cmp eax, byte 10h
        jg near .23
        movsx eax, word [byte ebx+facedir]
        mov word [byte ebx+Xvel], 0
        cmp eax, byte 6
        jne near .23
        mov word [byte ebx+Xvel], 0F800h
        mov word [byte ebx+Xpos+2], 0FF56h
        cmp word [byte ebx+position], byte 0
        jne short .12
        mov eax, SPAgwallleft
        jmp short .13
.12:
        mov eax, SPAwallleft
.13:
        movsx edx, ax
        mov eax, ebx
        call SetSPA
        mov word [byte ebx+temp1], 64h
        or byte [byte ebx+pflags], 20h
        pop edx
        pop ecx
        pop ebx
        ret
.14:
        mov al, byte [byte ebx+pflags]
        and al, 4
        movzx eax, al
        test eax, eax
        jne near .23
        mov ax, word [byte ebx+temp3]
        mov word [regd0], ax
        mov ax, word [byte ebx+temp4]
        mov word [regd1], ax
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne short .15
        cmp word [byte ebx+position], byte 0
        jne short .16
.15:
        xor edx, edx
        jmp short .17
.16:
        mov edx, EvadePC
.17:
        mov eax, ebx
        call skateto
        pop edx
        pop ecx
        pop ebx
        ret
.18:
        mov byte [byte ebx+newpnum], 0FFh
        mov byte [byte ebx+newpos], 0FFh
        xor byte [byte ebx+pflags], 40h
        cmp word [byte ebx+position], byte 0
        jne short .19
        inc word [byte ebx+position]
.19:
        mov edx, 7
        mov eax, ebx
        and byte [byte ebx+pflags2], 0BEh
        call assinsert
        mov word [byte ebx+Xvel], 0
        mov word [byte ebx+Yvel], 0
        mov ax, word [dword ebx+SCnum]
        mov word [byte ebx+048h], 0
        sub eax, byte 6
        mov word [regd0], ax
        mov ecx, eax
        test ax, ax
        jl short .20
        inc eax
        mov word [regd0], ax
.20:
        mov ax, word [regd0]
        neg eax
        imul eax, byte 0Eh
        mov word [byte ebx+Xpos+2], 0FF56h
        mov word [byte ebx+facedir], 2
        mov dword [dword ebx+09Ch], 1
        and byte [byte ebx+pflags], 0CFh
        mov edx, SPAwallright
        mov word [byte ebx+Ypos+2], ax
        mov eax, ebx
        or byte [byte ebx+pflags], 20h
        call SetSPA
        test cx, cx
        jge short .21
        add ecx, byte 7
.21:
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 6
        setl al
        movzx eax, al
        imul edx, eax, dword 126h
        movsx eax, cx
        imul eax, byte 2Ah
        mov word [dword edx+eax+CupLeaveSlotNext], 0FFFFh
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 6
        setl al
        movzx eax, al
        imul edx, eax, dword 126h
        movsx eax, cx
        imul eax, byte 2Ah
        mov word [dword edx+eax+CupLeaveSlot], 0FFFFh
        cmp word [dword ebx+SCnum], byte 0
        jne short .22
        mov word [CupHomeGoalieSlotNext], 0FFFFh
        mov word [CupHomeGoalieSlot], 0FFFFh
        pop edx
        pop ecx
        pop ebx
        ret
.22:
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 0Bh
        jne short .23
        mov word [CupGoalieSlotNext], 0FFFFh
        mov word [CupGoalieSlot], 0FFFFh
.23:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assextra2                                       30274  96 PC, low confidence
; Placeholder (Abdul 2026-11-15): called from puckstick; tests the zone
; analysis of assextra6 for this player
;-----------------------------------------------------------------------------
assextra2:
        push ebx
        push edx
        mov edx, eax
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx ebx, al
        cmp word [byte edx+06h], byte 0
        setl al
        movzx eax, al
        xor eax, ebx
        je near .5
        cmp word [byte edx+06h], byte 0
        jge short .1
        movsx eax, word [byte edx+06h]
        neg eax
        jmp short .2
.1:
        movsx eax, word [byte edx+06h]
.2:
        cmp eax, byte 7Eh
        jle short .5
        cmp word [byte edx+06h], byte 0
        jge short .3
        movsx eax, word [byte edx+06h]
        neg eax
        jmp short .4
.3:
        movsx eax, word [byte edx+06h]
.4:
        cmp eax, 15Ah
        jge short .5
        call assextra6
        cmp dword [ExtraAttackerPending], byte 0
        je short .5
        cmp dword [ExtraAttackerOn], byte 1
        jne short .5
        cmp dword [ExtraAttackerTeam], byte 0
        jne short .5
        movsx eax, word [dword edx+086h]
        cmp eax, dword [ExtraAttackerPlayer]
        jne short .5
        mov eax, 1
        pop edx
        pop ebx
        ret
.5:
        xor eax, eax
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GetPartner                                   30309  96 PC, medium confidence
; Returns the SortCords entry of the other player of a pair (position 1 or 2)
; through the team position map, else 0
;-----------------------------------------------------------------------------
GetPartner:
        push edx
        mov edx, dword [byte eax+066h]
        cmp edx, byte 1
        je short .1
        cmp edx, byte 2
        je short .1
        xor eax, eax
        pop edx
        ret
.1:
        cmp edx, byte 1
        sete dl
        movzx edx, dl
        mov eax, dword [dword eax+088h]
        inc edx
        movsx edx, byte [dword edx+eax+0102h]
        imul eax, edx, dword 0A0h
        add eax, SortCords
        pop edx
        ret
;-----------------------------------------------------------------------------
; defotarget                                      30340  96 PC, low confidence
; Called from assdefo and assnearest: defenceman's target on offence, same
; shape as defdtarget
;-----------------------------------------------------------------------------
defotarget:
        push ebx
        push ecx
        push edx
        push esi
        cmp dword [byte eax+066h], byte 2
        jne short .1
        mov edx, 55h
        jmp short .2
.1:
        mov edx, 0FFFFFFABh
.2:
        mov word [regd0], dx
        mov edx, dword [pucky]
        mov dx, word [edx]
        mov word [regd2], dx
        mov dl, byte [byte eax+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .3
        neg word [regd2]
.3:
        mov edx, dword [puckc]
        cmp byte [edx], 0
        jl short .6
        movsx edx, word [dword eax+SCnum]
        cmp edx, byte 6
        setl dl
        movzx ebx, dl
        mov edx, dword [puckc]
        movsx edx, byte [edx]
        cmp edx, byte 6
        setl dl
        movzx edx, dl
        cmp edx, ebx
        jne short .6
        mov dx, word [gmode2]
        xor dh, dh
        and dl, 80h
        movsx edx, dx
        test edx, edx
        je short .6
        mov dl, byte [byte eax+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .4
        movsx edx, word [byte eax+Ypos+2]
        neg edx
        jmp short .5
.4:
        movsx edx, word [byte eax+Ypos+2]
.5:
        cmp edx, byte 64h
        jle short .6
        mov word [regd1], 64h
        jmp short .9
.6:
        movsx edx, word [regd2]
        cmp edx, byte 0FFFFFF8Ch
        jge short .7
        mov word [regd1], 0FEECh
        jmp short .9
.7:
        cmp edx, byte 74h
        jge short .8
        mov word [regd1], 0FF9Ch
        jmp short .9
.8:
        mov word [regd1], 84h
.9:
        mov dl, byte [byte eax+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .10
        neg word [regd0]
        neg word [regd1]
.10:
        mov edx, dword [puckx]
        movsx ebx, word [edx]
        movsx ecx, word [regd0]
        mov esi, ebx
        xor esi, ecx
        test esi, esi
        jl short .11
        mov dx, word [edx]
        mov word [regd0], dx
        jmp short .12
.11:
        sar ebx, 1
        add ebx, ecx
        mov word [regd0], bx
.12:
        mov dx, word [regd0]
        mov word [byte eax+temp3], dx
        mov dx, word [regd1]
        mov word [byte eax+temp4], dx
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assdefo                                               30483  94G logic94.asm
; Assignment table slot 1: a defenceman while his team attacks
;-----------------------------------------------------------------------------
assdefo:
        push ebx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .10
        mov eax, ebx
        call check4bench
        test ax, ax
        jne near .10
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .1
        mov eax, ebx
        call donothing
        pop edx
        pop ebx
        ret
.1:
        mov al, byte [byte ebx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        jne near .10
        mov al, byte [byte ebx+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .2
        mov dword [byte ebx+072h], 0
        mov word [byte ebx+temp2], 8
        and byte [byte ebx+pflags], 0FDh
        mov eax, dword [byte ebx+072h]
        mov dword [byte ebx+06Eh], eax
.2:
        dec dword [byte ebx+06Eh]
        cmp dword [byte ebx+06Eh], byte 0
        jge short .3
        movzx eax, byte [byte ebx+aidef]
        mov dword [byte ebx+06Eh], eax
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .3
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov edx, eax
        mov eax, dword [puckc]
        movsx eax, byte [eax]
        cmp eax, byte 6
        setl al
        movzx eax, al
        xor eax, edx
        je short .3
        movsx eax, word [byte ebx+assnum]
        mov edx, 2
        mov byte [byte ebx+eax+01Eh], dl
        or byte [byte ebx+pflags], 2
        pop edx
        pop ebx
        ret
.3:
        cmp dword [byte ebx+066h], byte 2
        jle short .4
        cmp dword [byte ebx+06Ah], byte 0
        jge short .7
        mov eax, ebx
        movsx edx, word [byte ebx+position]
        jmp short .6
.4:
        movsx eax, word [byte ebx+position]
        cmp eax, byte 1
        je short .5
        cmp eax, byte 2
        jne short .7
.5:
        movsx edx, word [byte ebx+position]
        cmp edx, dword [byte ebx+066h]
        je short .7
        mov eax, ebx
.6:
        call SwapPosition
.7:
        dec dword [byte ebx+072h]
        cmp dword [byte ebx+072h], byte 0
        jge short .9
        movzx eax, byte [byte ebx+aioff]
        mov dword [byte ebx+072h], eax
        cmp dword [byte ebx+066h], byte 2
        jle short .8
        mov eax, ebx
        call assextra4
        jmp short .9
.8:
        mov eax, ebx
        call defotarget
.9:
        mov ax, word [byte ebx+temp3]
        mov word [regd0], ax
        mov ax, word [byte ebx+temp4]
        mov edx, EvadePC
        mov word [regd1], ax
        mov eax, ebx
        call skateto
.10:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; asscoverdefo                                 305C2  96 PC, medium confidence
; Asstab entry 30h, given by SwapDefWithFwd to the forward who takes over a
; defence spot: holds the point (y 84h) while his team attacks.
;
; Else switches to 2Fh; swaps back when the link (+6Ah) ends
;-----------------------------------------------------------------------------
asscoverdefo:
        push ebx
        push ecx
        push edx
        push esi
        mov ebx, eax
        mov al, byte [byte eax+pflags]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .19
        mov eax, ebx
        call check4bench
        test ax, ax
        jne near .19
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .1
        mov eax, ebx
        call donothing
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        mov al, byte [byte ebx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        jne near .19
        mov al, byte [byte ebx+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .2
        mov dword [byte ebx+072h], 0
        mov word [byte ebx+temp2], 8
        and byte [byte ebx+pflags], 0FDh
        mov eax, dword [byte ebx+072h]
        mov dword [byte ebx+06Eh], eax
.2:
        cmp dword [byte ebx+06Ah], byte 0
        jge short .4
        mov eax, ebx
        movsx edx, word [byte ebx+position]
        mov dword [byte ebx+06Ah], 0FFFFFFFFh
.3:
        call SwapPosition
        mov ax, word [byte ebx+assnum]
        inc eax
        xor ah, ah
        or byte [byte ebx+pflags], 2
        and al, 7
        mov word [byte ebx+assnum], ax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.4:
        imul eax, dword [byte ebx+06Ah], dword 0A0h
        add eax, SortCords
        mov dx, word [byte ebx+Ypos+2]
        cmp dx, word [byte eax+Ypos+2]
        setl dl
        movzx edx, dl
        mov ecx, edx
        mov dl, byte [byte ebx+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        setne dl
        movzx edx, dl
        xor edx, ecx
        je short .5
        movsx edx, word [byte eax+position]
        cmp edx, byte 2
        jle short .5
        mov dword [byte ebx+06Ah], 0FFFFFFFFh
        mov dword [byte eax+06Ah], 0FFFFFFFFh
        movsx edx, word [byte eax+position]
        mov eax, ebx
        jmp short .3
.5:
        dec dword [byte ebx+06Eh]
        cmp dword [byte ebx+06Eh], byte 0
        jge near .12
        movzx eax, byte [byte ebx+aidef]
        mov dword [byte ebx+06Eh], eax
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .7
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov edx, eax
        mov eax, dword [puckc]
        movsx eax, byte [eax]
        cmp eax, byte 6
        setl al
        movzx eax, al
        cmp eax, edx
        jne short .7
        mov ax, word [gmode2]
        xor ah, ah
        and al, 80h
        cwde
        test eax, eax
        je short .7
.6:
        movsx eax, word [byte ebx+assnum]
        mov edx, 2Fh
        mov byte [byte ebx+eax+01Eh], dl
        or byte [byte ebx+pflags], 2
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.7:
        mov eax, dword [pucky]
        mov ax, word [eax]
        mov word [regd1], ax
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .8
        neg word [regd1]
.8:
        movsx eax, word [regd1]
        cmp eax, byte 79h
        jl short .6
        mov ax, word [gmode2]
        xor ah, ah
        and al, 20h
        cwde
        test eax, eax
        je short .9
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx edx, al
        mov ax, word [gmode2]
        xor ah, ah
        and al, 40h
        cwde
        xor eax, edx
        je short .10
.9:
        mov eax, 1
.10:
        test eax, eax
        jne short .11
        movsx eax, word [regd1]
        cmp eax, 0A6h
        jge short .12
.11:
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .12
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov edx, eax
        mov eax, dword [puckc]
        movsx eax, byte [eax]
        cmp eax, byte 6
        setl al
        movzx eax, al
        xor eax, edx
        jne near .6
.12:
        dec dword [byte ebx+072h]
        cmp dword [byte ebx+072h], byte 0
        jge near .18
        movzx eax, byte [byte ebx+aioff]
        mov dword [byte ebx+072h], eax
        cmp dword [byte ebx+066h], byte 2
        jne short .13
        mov eax, 55h
        jmp short .14
.13:
        mov eax, 0FFFFFFABh
.14:
        mov word [regd1], 84h
        mov word [regd0], ax
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .15
        mov word [regd1], 0FF7Ch
        neg word [regd0]
.15:
        mov eax, dword [puckx]
        movsx ecx, word [eax]
        movsx edx, word [regd0]
        mov esi, ecx
        xor esi, edx
        test esi, esi
        jl short .16
        mov ax, word [eax]
        mov word [regd0], ax
        jmp short .17
.16:
        sar ecx, 1
        add edx, ecx
        mov word [regd0], dx
.17:
        mov ax, word [regd0]
        mov word [byte ebx+temp3], ax
        mov ax, word [regd1]
        mov word [byte ebx+temp4], ax
.18:
        mov ax, word [byte ebx+temp3]
        mov word [regd0], ax
        mov ax, word [byte ebx+temp4]
        mov edx, EvadePC
        mov word [regd1], ax
        mov eax, ebx
        call skateto
.19:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; defdtarget                                   30873  96 PC, medium confidence
; Called from assdefd, assnearest, asscoverdefd: defenceman's target on
; defence: his side (x 55h) and a y behind the deepest opponent
;-----------------------------------------------------------------------------
defdtarget:
        push ebx
        push ecx
        push edx
        cmp dword [byte eax+066h], byte 2
        jne short .1
        mov edx, 55h
        jmp short .2
.1:
        mov edx, 0FFFFFFABh
.2:
        mov word [byte eax+temp3], dx
        movsx edx, word [dword eax+SCnum]
        cmp edx, byte 6
        jge short .3
        mov edx, 6
        jmp short .4
.3:
        xor edx, edx
.4:
        imul edx, dword 0A0h
        mov word [regd2], 6
        mov bl, byte [byte eax+pflags]
        and bl, 80h
        movzx ebx, bl
        add edx, SortCords
        test ebx, ebx
        je near .11
        mov word [regd0], 3E8h
.5:
        mov bl, byte [byte edx+pflags2]
        and bl, 4
        movzx ebx, bl
        test ebx, ebx
        jne short .7
        cmp word [byte edx+position], byte 0
        jl short .7
        mov bx, word [byte edx+Yvel]
        mov word [regd1], bx
        test bx, bx
        jle short .6
        mov word [regd1], 0
.6:
        movsx ebx, word [regd1]
        movsx ecx, word [byte edx+Ypos+2]
        sar ebx, 5
        add ebx, ecx
        mov word [regd1], bx
        cmp bx, word [regd0]
        jg short .7
        mov word [regd0], bx
.7:
        add edx, 0A0h
        dec word [regd2]
        jne short .5
        movsx edx, word [regd0]
        cmp edx, 0FFFFFF14h
        jle short .8
        sub word [regd0], byte 1Eh
        jmp short .9
.8:
        cmp edx, 196h
        jle short .9
        sub word [regd0], byte 0Fh
.9:
        movsx edx, word [regd0]
        cmp edx, 0FFFFFED8h
        jg short .10
        mov word [regd0], 0FEBAh
.10:
        mov dx, word [regd0]
        mov word [byte eax+temp4], dx
        jmp near .18
.11:
        mov word [regd0], 0FC18h
.12:
        mov bl, byte [byte edx+pflags2]
        and bl, 4
        movzx ebx, bl
        test ebx, ebx
        jne short .14
        cmp word [byte edx+position], byte 0
        jl short .14
        mov bx, word [byte edx+Yvel]
        mov word [regd1], bx
        test bx, bx
        jge short .13
        mov word [regd1], 0
.13:
        movsx ebx, word [regd1]
        movsx ecx, word [byte edx+Ypos+2]
        sar ebx, 5
        add ebx, ecx
        mov word [regd1], bx
        cmp bx, word [regd0]
        jl short .14
        mov word [regd0], bx
.14:
        add edx, 0A0h
        dec word [regd2]
        jne short .12
        movsx edx, word [regd0]
        cmp edx, 0ECh
        jge short .15
        add word [regd0], byte 1Eh
        jmp short .16
.15:
        cmp edx, 132h
        jge short .16
        add word [regd0], byte 0Fh
.16:
        movsx edx, word [regd0]
        cmp edx, 128h
        jl short .17
        mov word [regd0], 146h
.17:
        mov dx, word [regd0]
        mov word [byte eax+temp4], dx
        neg word [byte eax+temp3]
.18:
        mov edx, dword [puckx]
        movsx ebx, word [byte eax+temp3]
        movsx edx, word [edx]
        xor edx, ebx
        test edx, edx
        jge short .23
        mov word [byte eax+temp3], 0
        cmp word [regd0], byte 0
        jge short .19
        movsx edx, word [regd0]
        neg edx
        jmp short .20
.19:
        movsx edx, word [regd0]
.20:
        cmp edx, 146h
        jne short .23
        cmp word [regd0], byte 0
        jge short .21
        mov edx, 0FFFFFEC4h
        jmp short .22
.21:
        mov edx, 13Ch
.22:
        mov word [byte eax+temp4], dx
.23:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assdefd                                               30A9B  94G logic94.asm
; Assignment table slot 2: a defenceman while his team defends
;-----------------------------------------------------------------------------
assdefd:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .15
        mov eax, ebx
        call check4bench
        test ax, ax
        jne near .15
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .1
        mov eax, ebx
        call donothing
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        mov al, byte [byte ebx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        jne near .15
        mov al, byte [byte ebx+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .2
        mov dword [byte ebx+06Eh], 0
        mov word [byte ebx+temp2], 8
        and byte [byte ebx+pflags], 0FDh
        mov eax, dword [byte ebx+06Eh]
        mov dword [byte ebx+072h], eax
.2:
        cmp dword [byte ebx+06Ah], byte 0
        jl short .4
        imul ecx, dword [byte ebx+06Ah], dword 0A0h
        add ecx, SortCords
        mov ax, word [byte ebx+Ypos+2]
        cmp ax, word [byte ecx+06h]
        setg al
        movzx eax, al
        mov edx, eax
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        xor eax, edx
        je short .4
        cmp dword [byte ebx+066h], byte 2
        jle short .3
        mov eax, ebx
        movsx edx, word [byte ebx+position]
        call SwapPosition
.3:
        mov dword [byte ebx+06Ah], 0FFFFFFFFh
        mov dword [byte ecx+06Ah], 0FFFFFFFFh
        pop edx
        pop ecx
        pop ebx
        ret
.4:
        dec dword [byte ebx+072h]
        cmp dword [byte ebx+072h], byte 0
        jge near .10
        movzx eax, byte [byte ebx+aioff]
        mov dword [byte ebx+072h], eax
        mov ecx, dword [pucky]
        mov ax, word [ecx]
        mov ecx, dword [puckvy]
        mov word [regd1], ax
        movsx eax, word [ecx]
        sar eax, 6
        mov word [regd3], ax
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .5
        neg word [regd1]
        neg word [regd3]
.5:
        cmp word [regd3], byte 0
        jge short .6
        mov word [regd3], 0
.6:
        mov ax, word [regd1]
        add word [regd3], ax
        movsx eax, word [regd3]
        cmp eax, byte 74h
        jl near .10
        mov ecx, dword [puckc]
        cmp byte [ecx], 0
        jl near .10
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov edx, eax
        movsx eax, byte [ecx]
        cmp eax, byte 6
        setl al
        movzx eax, al
        cmp eax, edx
        jne short .10
        mov ax, word [gmode2]
        xor ah, ah
        and al, 20h
        cwde
        test eax, eax
        je short .7
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx edx, al
        mov ax, word [gmode2]
        xor ah, ah
        and al, 40h
        cwde
        xor eax, edx
        jne short .8
.7:
        mov ecx, 1
        jmp short .9
.8:
        xor ecx, ecx
.9:
        test ecx, ecx
        je short .10
        mov ax, word [gmode2]
        xor ah, ah
        and al, 80h
        cwde
        test eax, eax
        jne short .10
        movsx ecx, word [byte ebx+assnum]
        mov eax, 1
        mov byte [byte ecx+ebx+01Eh], al
        or byte [byte ebx+pflags], 2
        pop edx
        pop ecx
        pop ebx
        ret
.10:
        dec dword [byte ebx+06Eh]
        cmp dword [byte ebx+06Eh], byte 0
        jge short .11
        movzx eax, byte [byte ebx+aidef]
        mov dword [byte ebx+06Eh], eax
        mov eax, ebx
        call defdtarget
.11:
        mov ax, word [byte ebx+temp3]
        mov word [regd0], ax
        mov ax, word [byte ebx+temp4]
        mov word [regd1], ax
        cmp dword [byte ebx+06Ah], byte 0
        jl short .14
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .12
        mov eax, 0FFFFFFECh
        jmp short .13
.12:
        mov eax, 14h
.13:
        movsx ecx, word [regd1]
        add ecx, eax
        mov word [regd1], cx
.14:
        mov eax, ebx
        xor edx, edx
        call skateto
        mov eax, ebx
        call check4check
.15:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; asscoverdefd                                 30CDA  96 PC, medium confidence
; Asstab entry 2Fh, the defending half of asscoverdefo: target from
; defdtarget, skateto, check4check; swaps positions back when the link ends
;-----------------------------------------------------------------------------
asscoverdefd:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        imul ecx, dword [byte eax+06Ah], dword 0A0h
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        add ecx, SortCords
        test eax, eax
        jne near .10
        mov eax, ebx
        call check4bench
        test ax, ax
        jne near .10
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .1
        mov eax, ebx
        call donothing
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        mov al, byte [byte ebx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        jne near .10
        mov al, byte [byte ebx+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .2
        mov dword [byte ebx+06Eh], 0
        mov word [byte ebx+temp2], 8
        and byte [byte ebx+pflags], 0FDh
        mov eax, dword [byte ebx+06Eh]
        mov dword [byte ebx+072h], eax
.2:
        cmp dword [byte ebx+06Ah], byte 0
        jge short .5
        mov eax, ebx
        movsx edx, word [byte ebx+position]
        mov dword [byte ebx+06Ah], 0FFFFFFFFh
.3:
        call SwapPosition
        mov ax, word [byte ebx+assnum]
        inc eax
.4:
        xor ah, ah
        or byte [byte ebx+pflags], 2
        and al, 7
        mov word [byte ebx+assnum], ax
        pop edx
        pop ecx
        pop ebx
        ret
.5:
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .7
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 6
        setl al
        movzx edx, al
        mov eax, dword [puckc]
        movsx eax, byte [eax]
        cmp eax, byte 6
        setl al
        movzx eax, al
        cmp eax, edx
        jne short .7
        cmp dword [byte ebx+06Ah], byte 0
        jl short .6
        mov dword [byte ecx+06Ah], 0FFFFFFFFh
        cmp dword [byte ecx+066h], byte 2
        jle short .6
        mov eax, ecx
        movsx edx, word [byte ecx+01Ah]
        call SwapPosition
.6:
        mov ax, word [byte ebx+assnum]
        inc eax
        mov dword [byte ebx+06Ah], 0FFFFFFFFh
        jmp short .4
.7:
        cmp dword [byte ebx+06Ah], byte 0
        jl short .8
        mov ax, word [byte ebx+Ypos+2]
        cmp ax, word [byte ecx+06h]
        setl al
        movzx eax, al
        mov edx, eax
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        xor eax, edx
        je short .8
        cmp dword [byte ecx+066h], byte 2
        jle short .8
        mov dword [byte ebx+06Ah], 0FFFFFFFFh
        mov eax, ecx
        movsx edx, word [byte ecx+01Ah]
        mov dword [byte ecx+06Ah], 0FFFFFFFFh
        jmp near .3
.8:
        dec dword [byte ebx+06Eh]
        cmp dword [byte ebx+06Eh], byte 0
        jge short .9
        movzx eax, byte [byte ebx+aidef]
        mov dword [byte ebx+06Eh], eax
        mov eax, ebx
        call defdtarget
.9:
        mov ax, word [byte ebx+temp3]
        mov word [regd0], ax
        mov ax, word [byte ebx+temp4]
        mov edx, EvadePC
        mov word [regd1], ax
        mov eax, ebx
        call skateto
        mov eax, ebx
        call check4check
.10:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assextra3                                       30E6B  96 PC, low confidence
; Placeholder (Abdul 2026-11-15): called from asscenterd, asswingd,
; assnearest; forwards' positioning on defence, not read yet
;-----------------------------------------------------------------------------
assextra3:
        push ebx
        push ecx
        push edx
        mov edx, dword [dword eax+tmptr]
        cmp word [byte edx+tmgoalie], byte 0
        setge bl
        movzx ebx, bl
        movsx edx, word [byte edx+tmap]
        sub edx, ebx
        mov ebx, dword [dword eax+optmptr]
        cmp word [byte ebx+tmgoalie], byte 0
        setge bl
        movzx ebx, bl
        mov ecx, ebx
        mov ebx, dword [dword eax+optmptr]
        movsx ebx, word [byte ebx+tmap]
        sub ebx, ecx
        mov ecx, ebx
        mov ebx, dword [byte eax+066h]
        cmp ecx, edx
        jle near .16
        cmp edx, byte 3
        jne near .4
        mov edx, dword [puckx]
        movsx edx, word [edx]
        sar edx, 1
        mov word [regd0], dx
        mov edx, dword [pucky]
        mov dx, word [edx]
        mov word [regd2], dx
        mov dl, byte [byte eax+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .1
        neg word [regd2]
.1:
        movsx edx, word [regd2]
        mov word [regd1], 0FF64h
        cmp edx, byte 0FFFFFF8Ch
        jl short .2
        lea ebx, [dword edx-09Ch]
        sar ebx, 1
        mov word [regd1], bx
        cmp edx, byte 74h
        jle near .14
        mov edx, dword [puckc]
        cmp byte [edx], 0
        jge near .14
        movsx edx, bx
        cmp edx, byte 60h
        jge near .14
        mov word [regd1], 56h
        jmp near .14
.2:
        cmp edx, 0FFFFFED8h
        jge short .3
        mov word [regd1], 0FF00h
        jmp near .14
.3:
        cmp edx, 0FFFFFF64h
        jle near .14
        mov word [regd1], 0FF64h
        jmp near .14
.4:
        cmp edx, byte 4
        jne near .16
        mov edx, dword [puckx]
        movsx ecx, word [edx]
        sar ecx, 1
        mov word [regd0], cx
        cmp word [edx], byte 0
        setl dl
        movzx edx, dl
        mov ecx, edx
        cmp ebx, byte 3
        sete dl
        movzx edx, dl
        xor ecx, edx
        mov dl, byte [byte eax+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        sete dl
        movzx edx, dl
        xor edx, ecx
        je short .10
        mov edx, dword [puckx]
        cmp word [edx], byte 0
        jge short .5
        movsx edx, word [edx]
        neg edx
        jmp short .6
.5:
        movsx edx, word [edx]
.6:
        cmp edx, byte 71h
        jle short .7
        mov word [regd0], 0
        jmp short .11
.7:
        cmp ebx, byte 3
        jne short .8
        mov edx, 0FFFFFFC8h
        jmp short .9
.8:
        mov edx, 38h
.9:
        mov word [regd0], dx
        jmp short .11
.10:
        mov dl, byte [byte eax+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .11
        neg word [regd0]
.11:
        mov edx, dword [pucky]
        mov dx, word [edx]
        mov word [regd2], dx
        mov dl, byte [byte eax+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .12
        neg word [regd0]
        neg word [regd2]
.12:
        movsx edx, word [regd2]
        mov word [regd1], 0FF64h
        cmp edx, byte 0FFFFFF8Ch
        jl short .15
.13:
        lea ebx, [dword edx-09Ch]
        sar ebx, 1
        mov word [regd1], bx
        cmp edx, byte 74h
        jle short .14
        mov edx, dword [puckc]
        cmp byte [edx], 0
        jge short .14
        movsx edx, bx
        cmp edx, byte 60h
        jge short .14
        mov word [regd1], 56h
.14:
        mov dl, byte [byte eax+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne near .28
        neg word [regd1]
        jmp near .28
.15:
        cmp edx, 0FFFFFED8h
        jge near .3
        mov word [regd1], 0FF14h
        jmp short .14
.16:
        cmp ebx, byte 4
        jne short .18
        mov edx, dword [puckx]
        movsx edx, word [edx]
        sar edx, 1
        mov word [regd0], dx
        mov edx, dword [pucky]
        mov dx, word [edx]
        mov word [regd2], dx
        mov dl, byte [byte eax+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .17
        neg word [regd2]
.17:
        movsx edx, word [regd2]
        mov word [regd1], 0FF64h
        cmp edx, byte 0FFFFFF8Ch
        jl near .14
        jmp near .13
.18:
        cmp ebx, byte 5
        jne short .19
        mov edx, 0FFFFFF8Fh
        jmp short .20
.19:
        mov edx, 71h
.20:
        mov word [regd1], 0C4h
        mov word [regd2], 64h
        mov dword [regd0], edx
        mov dl, byte [byte eax+pflags]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        je near .25
        mov word [regd1], 0FF3Ch
        mov edx, dword [puckc]
        mov word [regd2], 0FF9Ch
        neg word [regd0]
        cmp byte [edx], 0
        jl short .22
        movsx edx, word [dword eax+SCnum]
        cmp edx, byte 6
        setl dl
        movzx edx, dl
        mov ebx, edx
        mov edx, dword [puckc]
        movsx edx, byte [edx]
        cmp edx, byte 6
        setl dl
        movzx edx, dl
        cmp edx, ebx
        jne short .22
        mov dx, word [gmode2]
        xor dh, dh
        and dl, 80h
        movsx edx, dx
        test edx, edx
        je short .22
        movsx edx, word [regd2]
        movsx ebx, word [byte eax+Ypos+2]
        neg edx
        cmp ebx, edx
        jle short .22
.21:
        mov dx, word [regd2]
        mov word [regd1], dx
        neg word [regd1]
        jmp near .27
.22:
        mov edx, dword [pucky]
        mov bx, word [regd2]
        cmp bx, word [edx]
        jg short .24
.23:
        mov dx, word [edx]
        mov word [regd1], dx
        jmp near .27
.24:
        mov word [regd2], 0FE9Ch
        cmp word [edx], 0FE9Ch
        jg near .27
        mov word [regd1], 0FE9Ch
        jmp near .27
.25:
        mov edx, dword [puckc]
        cmp byte [edx], 0
        jl short .26
        movsx edx, word [dword eax+SCnum]
        cmp edx, byte 6
        setl dl
        movzx ebx, dl
        mov edx, dword [puckc]
        movsx edx, byte [edx]
        cmp edx, byte 6
        setl dl
        movzx edx, dl
        cmp edx, ebx
        jne short .26
        mov dx, word [gmode2]
        xor dh, dh
        and dl, 80h
        movsx edx, dx
        test edx, edx
        je short .26
        movsx edx, word [regd2]
        movsx ebx, word [byte eax+Ypos+2]
        neg edx
        cmp ebx, edx
        jl near .21
.26:
        mov edx, dword [pucky]
        mov bx, word [regd2]
        cmp bx, word [edx]
        jge near .23
        mov word [regd2], 164h
        cmp word [edx], 164h
        jl short .27
        mov word [regd1], 164h
.27:
        mov edx, dword [puckx]
        movsx ebx, word [regd0]
        movsx ecx, word [edx]
        xor ebx, ecx
        test ebx, ebx
        jl short .28
        mov dx, word [edx]
        mov word [regd0], dx
.28:
        mov dx, word [regd0]
        mov word [byte eax+temp3], dx
        mov dx, word [regd1]
        mov word [byte eax+temp4], dx
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; asswingd                                              312D7  94G logic94.asm
; Assignment table slot 3: a winger while his team defends
;-----------------------------------------------------------------------------
asswingd:
        push ebx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .5
        mov eax, ebx
        call check4bench
        test ax, ax
        jne near .5
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .1
        mov eax, ebx
        call donothing
        pop edx
        pop ebx
        ret
.1:
        mov al, byte [byte ebx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        jne near .5
        mov al, byte [byte ebx+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .2
        mov dword [byte ebx+06Eh], 0
        mov word [byte ebx+temp2], 8
        and byte [byte ebx+pflags], 0FDh
        mov eax, dword [byte ebx+06Eh]
        mov dword [byte ebx+072h], eax
.2:
        dec dword [byte ebx+072h]
        cmp dword [byte ebx+072h], byte 0
        jge short .3
        movzx eax, byte [byte ebx+aioff]
        mov dword [byte ebx+072h], eax
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .3
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov edx, eax
        mov eax, dword [puckc]
        movsx eax, byte [eax]
        cmp eax, byte 6
        setl al
        movzx eax, al
        cmp eax, edx
        jne short .3
        movsx eax, word [byte ebx+assnum]
        mov edx, 4
        mov byte [byte ebx+eax+01Eh], dl
        or byte [byte ebx+pflags], 2
        pop edx
        pop ebx
        ret
.3:
        dec dword [byte ebx+06Eh]
        cmp dword [byte ebx+06Eh], byte 0
        jge short .4
        movzx eax, byte [byte ebx+aidef]
        mov dword [byte ebx+06Eh], eax
        mov eax, ebx
        call assextra3
.4:
        mov ax, word [byte ebx+temp3]
        mov word [regd0], ax
        mov ax, word [byte ebx+temp4]
        xor edx, edx
        mov word [regd1], ax
        mov eax, ebx
        call skateto
.5:
        pop edx
        pop ebx
        ret
