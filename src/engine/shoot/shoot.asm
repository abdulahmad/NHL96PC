; Shooting: picking the target, shooting or aiming, shot stats, two-line pass marks and injury types.
bits 32
%include "hockey.inc"
section s_41393 progbits alloc exec nowrite align=1
extern assreplace, AwayShotCount, AwSortCords, awtmstruct, CamInjuredObj, camx, chk4pass_4F6, chk4pass_4F7
extern clockticks, CountShotOnGoal, Crowdlevel, CrowdReaction, CwdExciteLvl, dirtab, dirtab_y, gameclock
extern gameopts, gmode, gmode2, hmtmstruct, HomeShotCount, injurystop, lastimpact, lastplayer
extern lasttouch, passdir, passspeed, PenBuf, PenBuf_pl, penshotlive, penshotstart, PerTimeTotal
extern PlaySfx, PostInjuryEvent, PtrPuckFlags, puckc, puckvx, puckvy, puckvz, puckx
extern pucky, randomd0, regd0, regd1, regd2, regd3, regd4, regd5
extern RemoveFromLines, SetSPA, sflags, sfx, SortCords, threat, vecdist, VisTeam
extern vtoa, xc1, yc1
global PickShotTarget, ShootPuck, ShootOrAim, chk4shot, CompShoot, ChkOffsides, MarkTwoLinePlayers, ChkShotStat
global setInjuryType
;-----------------------------------------------------------------------------
; PickShotTarget                                  41393  96 PC, low confidence
; Picks where a shot is aimed
;-----------------------------------------------------------------------------
PickShotTarget:
        push ebx
        push ecx
        push edx
        mov dl, byte [byte eax+pflags]
        and dl, 8
        movzx ebx, dl
        test ebx, ebx
        jne near .8
        mov dx, word [byte eax+facedir]
        movsx ebx, dx
        cmp ebx, byte 1
        jl short .3
        cmp ebx, byte 3
        jg short .3
.1:
        mov al, byte [byte eax+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .2
        mov eax, 1
        jmp short .7
.2:
        mov eax, 3
        jmp short .7
.3:
        movsx ebx, dx
        cmp ebx, byte 5
        jl short .5
        cmp ebx, byte 7
        jg short .5
        mov al, byte [byte eax+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .4
        mov eax, 7
        jmp short .7
.4:
        mov eax, 5
        jmp short .7
.5:
        cmp byte [byte eax+handed], 0
        sete bl
        movzx ecx, bl
        test dx, dx
        sete dl
        movzx ebx, dl
        xor ebx, ecx
        jne short .1
        mov al, byte [byte eax+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .6
        mov eax, 7
        jmp short .7
.6:
        mov eax, 5
.7:
        mov word [passdir], ax
.8:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ShootPuck                                       41432  96 PC, low confidence
; Shoots the puck: speed, height, aim and sound
;-----------------------------------------------------------------------------
ShootPuck:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        mov ebx, eax
        call PickShotTarget
        and byte [sflags], 0F7h
        or byte [byte ebx+pflags], 20h
        mov eax, dword [puckc]
        mov byte [eax], 0FFh
        mov word [byte ebx+nopuck], 10h
        mov ax, word [dword ebx+SCnum]
        mov word [lastplayer], ax
        mov word [VisTeam], ax
        and byte [byte ebx+048h], 0FEh
        mov eax, dword [PtrPuckFlags]
        or byte [gmode2], 10h
        mov word [byte eax+048h], 2
        cmp word [byte ebx+position], byte 0
        jne short .1
        movsx edx, byte [byte ebx+pnum]
        imul edx, byte 11h
        mov eax, dword [dword ebx+tmptr]
        mov eax, dword [dword eax+011Ah]
        movzx si, byte [byte edx+eax+010h]
        jmp short .2
.1:
        movzx si, byte [byte ebx+passacc]
.2:
        mov eax, esi
        shl eax, 2
        add eax, 0A0h
        mov word [passspeed], ax
        movsx edi, ax
        movsx eax, word [passdir]
        movsx eax, word [nosplit eax*4+dirtab_y]
        imul eax, edi
        shl eax, 0Ah
        mov dword [byte ebp-04h], 0BB8h
        cdq
        idiv dword [byte ebp-04h]
        mov ecx, eax
        mov eax, dword [puckvy]
        add cx, word [byte ebx+Yvel]
        mov word [eax], cx
        movsx eax, word [passdir]
        movsx eax, word [nosplit eax*4+dirtab]
        imul eax, edi
        shl eax, 0Ah
        mov edi, 0BB8h
        cdq
        idiv edi
        mov ecx, eax
        mov eax, dword [puckvx]
        add cx, word [byte ebx+Xvel]
        mov word [eax], cx
        mov eax, 11h
        sub eax, esi
        shl eax, 7
        add ah, 8
        cwde
        call randomd0
        add ah, 8
        mov edx, eax
        mov eax, dword [puckvz]
        mov word [eax], dx
        cmp word [byte ebx+position], byte 0
        jne short .4
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        sete al
        movzx eax, al
        mov edx, eax
        mov eax, dword [puckvy]
        cmp word [eax], byte 0
        setl al
        movzx eax, al
        xor eax, edx
        je short .3
        mov eax, dword [puckvy]
        mov dx, word [eax]
        neg edx
        mov word [eax], dx
.3:
        mov ecx, 6A1h
        mov eax, 18h
        or byte [byte ebx+pflags2], 2
        jmp short .9
.4:
        mov eax, dword [puckvy]
        movsx edx, word [eax]
        mov eax, dword [puckvx]
        movsx eax, word [eax]
        call vtoa
        mov cx, word [byte ebx+facedir]
        sub ecx, eax
        mov ax, word [byte ebx+054h]
        xor al, al
        and ah, 8
        xor ch, ch
        cwde
        and cl, 7
        test eax, eax
        je short .5
        mov eax, 1
        movsx ecx, cx
        shl eax, cl
        test al, 0F0h
        jmp short .6
.5:
        mov eax, 1
        movsx ecx, cx
        shl eax, cl
        test al, 1Eh
.6:
        setne al
        movzx ax, al
        mov ecx, eax
        test cx, cx
        jne short .7
        mov ecx, 0AFh
        jmp short .8
.7:
        mov ecx, 0B5h
.8:
        mov eax, 8
.9:
        call PlaySfx
        movsx edx, cx
        mov eax, ebx
        call SetSPA
        or byte [byte ebx+pflags], 20h
        jmp near chk4pass_4F6
;-----------------------------------------------------------------------------
; ShootOrAim                                      415FF  96 PC, low confidence
; Shoots when the shot button is released, else stores the aim direction
;-----------------------------------------------------------------------------
ShootOrAim:
        push edx
        mov dx, word [regd2]
        xor dh, dh
        and dl, 20h
        movsx edx, dx
        test edx, edx
        je short .1
        call ShootPuck
        pop edx
        ret
.1:
        mov ax, word [regd0]
        xor ah, ah
        and al, 8
        cwde
        test eax, eax
        jne short .2
        mov ax, word [regd0]
        xor ah, ah
        and al, 7
        or byte [regd0], 8
        mov word [passdir], ax
.2:
        pop edx
        ret
;-----------------------------------------------------------------------------
; chk4shot                           41642  94G logic94.asm, medium confidence
; (computer looks for a shot). regd4 = 20h - spodds; shot lane test; jumps to
; chk4lc_shoot (CompShoot) to shoot.
;-----------------------------------------------------------------------------
chk4shot:
        push ebx
        push ecx
        push edx
        push esi
        mov ebx, eax
        cmp dword [penshotlive], byte 0
        jne short .2
        mov ax, word [gmode2]
        xor ah, ah
        and al, 20h
        cwde
        test eax, eax
        je short .1
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx edx, al
        mov ax, word [gmode2]
        xor ah, ah
        and al, 40h
        cwde
        xor eax, edx
        je short .1
        cmp word [threat], byte 0
        je short .1
        mov eax, 4
        call randomd0
        test ax, ax
        je near .20
.1:
        movsx eax, word [gameclock]
        cmp eax, byte 4
        jge short .2
        mov edx, dword [dword ebx+tmptr]
        mov eax, dword [dword ebx+optmptr]
        mov dx, word [byte edx+tmscore]
        cmp dx, word [byte eax+tmscore]
        jl near .20
.2:
        mov edx, 20h
        movzx ax, byte [byte ebx+spodds]
        sub edx, eax
        mov word [regd4], dx
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .3
        mov eax, 0FFFFFE9Ch
        jmp short .4
.3:
        mov eax, 164h
.4:
        mov word [regd1], ax
        mov eax, dword [pucky]
        mov ax, word [eax]
        sub word [regd1], ax
        movsx edx, word [regd1]
        mov esi, edx
        imul esi, edx
        mov eax, dword [puckx]
        mov ax, word [eax]
        mov word [regd0], ax
        neg word [regd0]
        movsx eax, word [regd0]
        mov ecx, eax
        imul ecx, eax
        add ecx, esi
        cmp ecx, 2710h
        ja near .13
        mov ecx, dword [dword ebx+optmptr]
        cmp word [byte ecx+tmgoalie], byte 0
        jge short .6
.5:
        mov word [regd4], 1
        jmp near .15
.6:
        call vtoa
        mov word [regd5], ax
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 6
        jge short .7
        mov eax, 6
        jmp short .8
.7:
        xor eax, eax
.8:
        imul eax, dword 0A0h
        mov ecx, SortCords
        mov word [regd3], 6
        add ecx, eax
.9:
        cmp word [byte ecx+position], byte 0
        jne short .10
        mov al, byte [byte ecx+pflags2]
        and al, 2
        movzx eax, al
        test eax, eax
        je near .12
        jmp short .5
.10:
        mov eax, dword [puckx]
        mov dx, word [byte ecx+Xpos+2]
        sub dx, word [eax]
        mov word [regd0], dx
        mov eax, dword [pucky]
        mov dx, word [byte ecx+Ypos+2]
        sub dx, word [eax]
        movsx eax, word [regd0]
        mov word [regd1], dx
        movsx edx, dx
        call vtoa
        cmp ax, word [regd5]
        jne short .11
        mov ax, word [regd4]
        add eax, eax
        mov word [regd4], ax
.11:
        mov ax, word [gmode2]
        xor ah, ah
        and al, 20h
        cwde
        test eax, eax
        je short .12
        mov dx, word [gmode2]
        mov al, byte [byte ebx+pflags]
        xor dh, dh
        and al, 40h
        and dl, 40h
        movzx eax, al
        movsx edx, dx
        xor eax, edx
        jne short .12
        mov ax, word [regd4]
        add eax, eax
        mov word [regd4], ax
.12:
        add ecx, 0A0h
        dec word [regd3]
        jne near .9
        jmp short .15
.13:
        mov eax, dword [dword ebx+optmptr]
        cmp word [byte eax+tmgoalie], byte 0
        jge short .14
        cmp ecx, 9C40h
        jbe near .5
.14:
        shl word [regd4], 4
.15:
        movsx eax, word [regd4]
        call randomd0
        cwde
        cmp eax, byte 8
        jle short .17
.16:
        xor eax, eax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.17:
        mov eax, dword [pucky]
        mov ax, word [eax]
        mov word [regd0], ax
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .18
        neg word [regd0]
.18:
        cmp word [regd0], byte 0
        jl short .16
        mov edx, 164h
        mov ax, word [regd0]
        sub edx, eax
        mov word [regd1], dx
        test dx, dx
        jl short .16
        cmp dword [penshotlive], byte 0
        je short .19
        cwde
        cmp eax, 0B0h
        jl short .16
.19:
        mov ax, word [gmode2]
        xor ah, ah
        and al, 80h
        cwde
        test eax, eax
        jne short .16
.20:
        mov eax, ebx
        call CompShoot
        mov eax, 1
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompShoot                        418E7  93G logic93_3.asm, medium confidence
; temp2 = swing time (E8h - pucky by pfgoal) 8, max 14h; assreplace ashoot (12h).
;-----------------------------------------------------------------------------
CompShoot:
        push edx
        mov edx, dword [pucky]
        mov dx, word [edx]
        mov word [regd0], dx
        mov dl, byte [byte eax+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .1
        neg word [regd0]
.1:
        mov edx, 164h
        sub dx, word [regd0]
        movzx edx, dx
        sar edx, 3
        mov word [regd1], dx
        movsx edx, dx
        cmp edx, byte 14h
        jl short .2
        mov edx, 14h
.2:
        mov word [byte eax+028h], dx
        mov edx, 12h
        call assreplace
        pop edx
        ret
;-----------------------------------------------------------------------------
; ChkOffsides                      41942  93G logic93_5.asm, medium confidence
; ClearOffsidesIfAllPlayers. Offsides option (gameopts bit 1): a team's
; offsides flag (tmflags bit 4) is cleared once none of its skaters is past the blue line (4Eh).
;-----------------------------------------------------------------------------
ChkOffsides:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov edx, eax
        mov eax, dword [gameopts]
        test byte [byte eax+01h], 2
        je near chk4pass_4F7
        cmp dword [penshotlive], byte 0
        jne near chk4pass_4F7
        cmp dword [penshotstart], byte 0
        jne near chk4pass_4F7
        mov eax, hmtmstruct
        xor edi, edi
        jmp near .8
.1:
        mov bx, word [byte eax+046h]
        xor bh, bh
        and bl, 10h
        movsx ebx, bx
        test ebx, ebx
        je short .7
        mov ebx, dword [dword eax+012Eh]
        xor esi, esi
        jmp short .5
.2:
        cmp word [byte ebx+position], byte 0
        jl short .4
        mov cx, word [byte ebx+Ypos+2]
        mov word [regd0], cx
        mov cl, byte [byte ebx+pflags]
        and cl, 80h
        movzx ecx, cl
        test ecx, ecx
        jne short .3
        neg word [regd0]
.3:
        movsx ecx, word [regd0]
        cmp ecx, byte 74h
        jg short .6
.4:
        add ebx, 0A0h
        inc esi
.5:
        movsx ecx, si
        cmp ecx, byte 6
        jl short .2
.6:
        movsx ebx, si
        cmp ebx, byte 6
        jl short .7
        and byte [byte eax+046h], 0EFh
.7:
        mov eax, awtmstruct
        inc edi
.8:
        movsx ebx, di
        cmp ebx, byte 2
        jl short .1
        mov word [regd0], 70h
        cmp word [byte edx+06h], byte 70h
        jl near .15
        cmp word [dword edx+096h], byte 70h
        jge near chk4pass_4F7
        call CountShotOnGoal
        mov al, byte [gmode]
        and al, 2
        movsx eax, al
        add word [regd0], byte 0Ah
        test eax, eax
        je short .9
        mov edx, awtmstruct
        jmp short .10
.9:
        mov edx, hmtmstruct
.10:
        mov eax, dword [dword edx+012Eh]
        movsx ecx, word [dword eax+SCnum]
        mov ebx, edx
        cmp ecx, byte 6
        setl cl
        movzx esi, cl
        movsx ecx, word [lasttouch]
        cmp ecx, byte 6
        setl cl
        movzx ecx, cl
        xor ecx, esi
        je short .12
.11:
        and byte [byte edx+046h], 0EFh
        jmp near chk4pass_4F7
.12:
        mov esi, 6
.13:
        cmp word [byte eax+position], byte 0
        jl short .14
        mov dx, word [regd0]
        cmp dx, word [byte eax+Ypos+2]
        jge short .14
        or byte [byte ebx+046h], 10h
.14:
        add eax, 0A0h
        dec si
        je near chk4pass_4F7
        jmp short .13
.15:
        mov word [regd0], 0FF90h
        cmp word [byte edx+06h], byte 0FF90h
        jg near chk4pass_4F7
        cmp word [dword edx+096h], byte 0FF90h
        jle near chk4pass_4F7
        call CountShotOnGoal
        mov al, byte [gmode]
        and al, 2
        movsx eax, al
        sub word [regd0], byte 0Ah
        test eax, eax
        jne short .16
        mov edx, awtmstruct
        jmp short .17
.16:
        mov edx, hmtmstruct
.17:
        mov eax, dword [dword edx+012Eh]
        movsx ecx, word [dword eax+SCnum]
        mov ebx, edx
        cmp ecx, byte 6
        setl cl
        movzx esi, cl
        movsx ecx, word [lasttouch]
        cmp ecx, byte 6
        setl cl
        movzx ecx, cl
        xor ecx, esi
        jne near .11
        mov edx, 6
.18:
        cmp word [byte eax+position], byte 0
        jl short .19
        mov si, word [regd0]
        cmp si, word [byte eax+Ypos+2]
        jle short .19
        or byte [byte ebx+046h], 10h
.19:
        add eax, 0A0h
        dec dx
        jne short .18
        jmp near chk4pass_4F7
;-----------------------------------------------------------------------------
; MarkTwoLinePlayers                           41B41  95 PC, medium confidence
; Two-line pass option (gameopts bit 3): sets pflags2 bit 7 on the skaters of
; the team past the red line (Ypos sign by gmode bit 1).
;
; clears it on the others; ChkTwoLinePass (from a2touchpuck) reads the flag
;-----------------------------------------------------------------------------
MarkTwoLinePlayers:
        push ebx
        push edx
        mov ebx, eax
        mov eax, dword [gameopts]
        test byte [byte eax+01h], 4
        je near .10
        mov al, byte [gmode]
        and al, 2
        movsx eax, al
        test eax, eax
        je short .1
        mov eax, AwSortCords
        mov edx, SortCords
        jmp short .2
.1:
        mov eax, SortCords
        mov edx, AwSortCords
.2:
        cmp word [byte ebx+06h], byte 0
        jl short .6
        cmp word [dword ebx+096h], byte 0
        jge near .10
        mov ebx, 6
.3:
        cmp word [byte eax+position], byte 0
        jl short .4
        cmp word [byte eax+Ypos+2], byte 0
        jle short .4
        or byte [byte eax+pflags2], 80h
        jmp short .5
.4:
        and byte [byte eax+pflags2], 7Fh
.5:
        add edx, 0A0h
        add eax, 0A0h
        and byte [byte edx-05Bh], 7Fh
        dec bx
        je short .10
        jmp short .3
.6:
        cmp word [dword ebx+096h], byte 0
        jl short .10
        mov ebx, 6
.7:
        cmp word [byte edx+position], byte 0
        jl short .8
        cmp word [byte edx+Ypos+2], byte 0
        jge short .8
        or byte [byte edx+pflags2], 80h
        jmp short .9
.8:
        and byte [byte edx+pflags2], 7Fh
.9:
        add eax, 0A0h
        add edx, 0A0h
        and byte [byte eax-05Bh], 7Fh
        dec bx
        jne short .7
.10:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ChkShotStat                    41BFC  93G penalty93_2.asm, medium confidence
; If the shot flag (gmode2 bit 4) was set: clear it, Crowdlevel +100,
; shot counts for the shooter and the goalie.
;-----------------------------------------------------------------------------
ChkShotStat:
        push ebx
        push ecx
        push edx
        push esi
        mov ebx, eax
        mov ax, word [gmode2]
        xor ah, ah
        and al, 10h
        cwde
        test eax, eax
        je near .17
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        and byte [gmode2], 0EFh
        test eax, eax
        jne near .17
        xor edx, edx
        jmp short .3
.1:
        add eax, eax
        cmp byte [dword eax+PenBuf], 0
        je short .4
        movsx esi, byte [dword eax+PenBuf]
        cmp esi, byte 8
        jne short .2
        movsx eax, byte [dword eax+PenBuf_pl]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov esi, eax
        movsx eax, word [VisTeam]
        cmp eax, byte 6
        setl al
        movzx eax, al
        cmp esi, eax
        je near .17
.2:
        inc edx
.3:
        movsx eax, dx
        cmp eax, byte 20h
        jl short .1
.4:
        movsx eax, word [VisTeam]
        imul eax, dword 0A0h
        mov esi, SortCords
        add esi, eax
        mov al, byte [byte esi+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov edx, eax
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        setg al
        movzx eax, al
        xor eax, edx
        jne near .17
        test ebx, ebx
        jne near .11
        mov al, byte [byte esi+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        je near .9
        cmp dword [penshotlive], byte 0
        je short .5
        mov eax, 0Ch
        call sfx
        mov eax, 7Fh
        call CrowdReaction
        jmp near .11
.5:
        cmp word [byte esi+Ypos+2], byte 0
        jge short .6
        movsx eax, word [byte esi+Ypos+2]
        neg eax
        jmp short .7
.6:
        movsx eax, word [byte esi+Ypos+2]
.7:
        cmp eax, byte 7Eh
        jle short .8
        mov al, byte [byte esi+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov edx, eax
        cmp word [byte esi+Ypos+2], byte 0
        setl al
        movzx eax, al
        xor eax, edx
        je short .8
        mov eax, dword [puckvx]
        movsx eax, word [eax]
        push eax
        mov eax, dword [puckvy]
        movsx eax, word [eax]
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, 2328h
        jbe short .8
        mov eax, 0Ch
        jmp short .10
.8:
        mov eax, 1
        jmp short .10
.9:
        mov eax, 3
.10:
        call sfx
.11:
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jg short .12
        add word [Crowdlevel], byte 64h
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jle short .12
        mov word [Crowdlevel], 3E8h
.12:
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        add word [CwdExciteLvl], byte 0Ah
        test eax, eax
        jne near .17
        mov eax, dword [dword esi+tmptr]
        mov edx, dword [dword esi+optmptr]
        inc word [eax]
        mov bx, word [gmode2]
        xor bh, bh
        and bl, 20h
        movsx ebx, bx
        test ebx, ebx
        je short .13
        mov bx, word [byte eax+tmap]
        cmp bx, word [byte edx+tmap]
        jle short .13
        inc word [byte eax+tmPPShots]
.13:
        mov bl, byte [byte esi+pflags]
        and bl, 40h
        movzx ebx, bl
        test ebx, ebx
        jne short .14
        inc byte [HomeShotCount]
        jmp short .15
.14:
        inc byte [AwayShotCount]
.15:
        movsx esi, byte [byte esi+pnum]
        cmp esi, byte 19h
        jge short .16
        shl esi, 4
        mov eax, dword [dword eax+011Eh]
        inc word [byte esi+eax+0Eh]
.16:
        cmp word [byte edx+03Ah], byte 0
        jl short .17
        mov eax, dword [dword edx+0112h]
        movsx ebx, word [byte edx+03Ah]
        movzx ax, byte [byte ebx+eax+034h]
        sub eax, byte 19h
        test ax, ax
        jl short .17
        cwde
        cmp eax, byte 3
        jge short .17
        imul eax, byte 6
        mov edx, dword [dword edx+0122h]
        inc word [byte edx+eax+02h]
.17:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; setInjuryType                  41E46  93G hockey93_03.asm, medium confidence
; Player unavailable (pflags2 bit 2), crowd up, sfx A1h, camera locked
; on him (xc1/yc1, sfslock).
;-----------------------------------------------------------------------------
setInjuryType:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov esi, eax
        or byte [byte eax+045h], 4
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jg short .1
        add word [Crowdlevel], 12Ch
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jle short .1
        mov word [Crowdlevel], 3E8h
.1:
        mov eax, 3
        add word [CwdExciteLvl], byte 1Eh
        call sfx
        mov ax, word [byte esi+Xpos+2]
        mov word [xc1], ax
        mov ax, word [byte esi+Ypos+2]
        mov word [yc1], ax
        mov ax, word [byte esi+Xpos+2]
        cmp ax, word [camx]
        jge short .2
        add word [yc1], byte 32h
.2:
        or byte [sflags], 40h
        movsx eax, byte [byte esi+pnum]
        imul ebx, eax, byte 15h
        mov edx, dword [dword esi+tmptr]
        mov eax, dword [dword edx+0116h]
        movzx ax, byte [byte ebx+eax+0Fh]
        add eax, 8
        cwde
        call randomd0
        cwde
        cmp eax, byte 6
        setg al
        movzx eax, al
        mov edi, eax
        test eax, eax
        jle short .3
        movsx eax, word [lastimpact]
        cmp eax, byte 2Dh
        jle short .3
        movsx eax, byte [byte esi+pnum]
        mov word [dword edx+eax*2+tmpdst], 0FFFCh
        movsx eax, byte [byte esi+pnum]
        imul eax, byte 2Bh
        mov edx, dword [dword edx+tmroster]
        mov byte [edx+eax], 1
        jmp short .4
.3:
        movsx eax, byte [byte esi+pnum]
        mov word [dword edx+eax*2+080h], 0FFFDh
        movsx eax, byte [byte esi+pnum]
        imul eax, byte 2Bh
        mov edx, dword [dword edx+0126h]
        mov edi, 0FFFFFFFFh
        mov byte [edx+eax], 6
.4:
        mov ax, word [dword esi+SCnum]
        add eax, 10h
        mov word [injurystop], ax
        movsx eax, word [dword esi+SCnum]
        movsx ebx, word [PerTimeTotal]
        mov dword [CamInjuredObj], eax
        movsx eax, word [gameclock]
        sub ebx, eax
        cmp eax, byte 3Ch
        jge short .5
        cmp word [clockticks], byte 0
        je short .5
        dec ebx
.5:
        mov eax, ebx
        mov ecx, 3Ch
        cdq
        idiv ecx
        push byte 0
        push byte 0
        mov eax, ebx
        push edx
        cdq
        idiv ecx
        mov cl, byte [byte esi+pflags]
        and cl, 40h
        mov ebx, edi
        movzx ecx, cl
        movsx edx, byte [byte esi+pnum]
        test ecx, ecx
        setne cl
        movzx ecx, cl
        mov edi, ecx
        mov ecx, eax
        mov eax, edi
        call PostInjuryEvent
        mov al, byte [byte esi+pflags]
        and al, 40h
        movzx eax, al
        movsx edx, byte [byte esi+pnum]
        test eax, eax
        setne al
        movzx ax, al
        cwde
        call RemoveFromLines
        jmp near chk4pass_4F7
