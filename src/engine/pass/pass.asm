; Passing: pass lanes, choosing a receiver, pass modes and the pass itself; puck and body bumps.
bits 32
%include "hockey.inc"
%include "spa.inc"
section s_3F5E4 progbits alloc exec nowrite align=1
extern AddPenalty2, assexitjump, assinsert, AvgCline, awtmap, awtmstruct, bannermsg, bannertimer
extern BlockShotDive_127, changeplayer, CompLine, CompShoot, dirtab, dirtab_y, gameclock, gameopts
extern GetHot, GetHotOrStick, GetHotStick, gmode, gmode2, hmtmap, hmtmstruct, IntSqrt
extern lastplayer, lasttouch, onetimerflag, OneTimerPasser, OOlist, OOlistpos, optflags, passdir
extern PassHoldFrames, passplayer, passspeed, PassTargetLocked, penshotlive, penshotstart, PlaySfx, PtrAwayNet
extern PtrHomeNet, PtrPuckFlags, puckbody, puckc, PuckChaserPlayer, PuckChasers, puckcross, puckgoalie
extern puckstick, puckvx, puckvy, puckvz, puckx, pucky, puckz, randomd0
extern regd0, regd1, regd2, regd3, regd4, SetControlledPlayer, setpersonel, SetSPA
extern sflags, ShotLaneOpen, SortCords, threat, vecdist, VisTeam, vtoa, Ylist
global checkob, SkillForAnim, ChkDelayedOffside, checkpuckcoll_ccx, checkpuckcoll, CheckBump, GetLowestPen, chk4lc
global chk4lcauto, PassLaneChk, ScatterPass, dopass, CompPass, passmode, setpassmode, setpassmode_F
global passtoa0, chk4pass, chk4pass_2F, chk4pass_4F1, chk4pass_4F6, chk4pass_4F7, SetPassDirection
;-----------------------------------------------------------------------------
; checkob                            3F5E4  94G logic94.asm, medium confidence
; Brings up the warning referee when a player of the team is over the blue
; line
;-----------------------------------------------------------------------------
checkob:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov edx, dword [gameopts]
        xor esi, esi
        xor ebx, ebx
        test byte [byte edx+01h], 2
        je near chk4pass_4F6
        cmp dword [penshotlive], byte 0
        jne near chk4pass_4F6
        cmp dword [penshotstart], byte 0
        jne near chk4pass_4F6
        movsx edx, word [dword eax+SCnum]
        cmp edx, byte 6
        jge short .1
        xor edx, edx
        jmp short .2
.1:
        mov edx, 6
.2:
        imul edx, dword 0A0h
        mov cl, byte [byte eax+pflags]
        and cl, 80h
        movzx ecx, cl
        add edx, SortCords
        test ecx, ecx
        jne near .8
        movsx ecx, word [byte eax+Ypos+2]
        cmp ecx, byte 0FFFFFF88h
        jle short .3
        cmp word [byte eax+Yvel], byte 0
        jg short .3
        mov ebx, 4
.3:
        lea ecx, [byte ebx+074h]
        mov edi, ecx
        mov ebx, dword [pucky]
        neg edi
        movsx ebx, word [ebx]
        cmp edi, ebx
        jg near .13
        mov dword [byte ebp-08h], ecx
        xor bl, bl
        jmp short .7
.4:
        cmp word [byte edx+01Ah], byte 0
        jl short .6
        mov ecx, dword [byte ebp-08h]
        movsx edi, word [byte edx+06h]
        neg ecx
        cmp ecx, edi
        jle short .6
.5:
        mov esi, 1
        jmp near .13
.6:
        add edx, 0A0h
        inc bl
.7:
        movsx ecx, bl
        cmp ecx, byte 6
        jl short .4
        jmp short .13
.8:
        movsx ecx, word [byte eax+Ypos+2]
        cmp ecx, byte 78h
        jge short .9
        cmp word [byte eax+Yvel], byte 0
        jl short .9
        mov ebx, 4
.9:
        mov ecx, dword [pucky]
        movsx ecx, word [ecx]
        mov dword [byte ebp-04h], ecx
        lea ecx, [byte ebx+074h]
        cmp ecx, dword [byte ebp-04h]
        jl short .13
        xor bl, bl
        jmp short .12
.10:
        cmp word [byte edx+01Ah], byte 0
        jl short .11
        movsx edi, word [byte edx+06h]
        cmp ecx, edi
        jl short .5
.11:
        add edx, 0A0h
        inc bl
.12:
        movsx edi, bl
        cmp edi, byte 6
        jl short .10
.13:
        mov dx, word [gmode2]
        xor dh, dh
        and dl, 80h
        test si, si
        je short .14
        movsx edx, dx
        test edx, edx
        jne near chk4pass_4F6
        movsx edx, word [bannermsg]
        or byte [gmode2], 80h
        cmp edx, byte 5
        jge near chk4pass_4F6
        mov al, byte [byte eax+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx edx, al
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        setl al
        movzx eax, al
        xor edx, eax
        je near chk4pass_4F6
        mov word [bannermsg], 5
        mov word [bannertimer], 0
        jmp near chk4pass_4F6
.14:
        movsx eax, dx
        test eax, eax
        je near chk4pass_4F6
        movsx eax, word [bannermsg]
        and byte [gmode2], 7Fh
        cmp eax, byte 5
        jne near chk4pass_4F6
        cmp word [bannertimer], byte 0
        jne near chk4pass_4F6
        mov word [bannermsg], 0FFFFh
        jmp near chk4pass_4F6
;-----------------------------------------------------------------------------
; SkillForAnim                                 3F7AC  95 PC, medium confidence
; Returns the stick-handling attribute byte (5Dh / 62h / 65h) that fits the
; player's current animation (SPA codes 0B1h, 0C9h, 0E1h, 101h, 119h, 11D5h.
;
; 121Dh); checkpuckcoll
;-----------------------------------------------------------------------------
SkillForAnim:
        push edx
        mov dx, word [byte eax+SPA]
        cmp dx, SPAgstickr
        jb short .2
        jbe near .11
        cmp dx, SPAgofallglove
        jb short .1
        jbe short .3
        cmp dx, SPAgofallstick
        je short .11
        jmp near .12
.1:
        cmp dx, SPAgstickl
        je short .7
        jmp short .12
.2:
        cmp dx, SPAgglover
        jb short .12
        jbe short .6
        cmp dx, SPAgglovel
        jne short .12
.3:
        cmp byte [byte eax+handed], 0
        jne short .5
.4:
        mov al, byte [byte eax+passacc]
        jmp short .10
.5:
        mov al, byte [byte eax+aggress]
        jmp short .10
.6:
        cmp byte [byte eax+handed], 0
        jne short .4
        jmp short .5
.7:
        cmp byte [byte eax+handed], 0
        jne short .9
.8:
        mov al, byte [byte eax+endurance]
        jmp short .10
.9:
        mov al, byte [byte eax+spodds]
.10:
        movzx eax, al
        pop edx
        ret
.11:
        cmp byte [byte eax+handed], 0
        jne short .8
        jmp short .9
.12:
        movzx eax, byte [byte eax+shotspd]
        pop edx
        ret
;-----------------------------------------------------------------------------
; ChkDelayedOffside                            3F825  95 PC, medium confidence
; Offsides option: the flagged team touches the puck in the zone -> AddPenalty2 8 on
; SortCords[lasttouch], returns 1. Called from checkpuckcoll_ccx before puckstick puckgoalie.
;-----------------------------------------------------------------------------
ChkDelayedOffside:
        push edx
        mov edx, dword [gameopts]
        test byte [byte edx+01h], 2
        jne short .2
.1:
        xor eax, eax
        pop edx
        ret
.2:
        mov dl, byte [gmode]
        and dl, 10h
        movsx edx, dl
        test edx, edx
        jne short .1
        cmp dword [penshotlive], byte 0
        jne short .1
        cmp dword [penshotstart], byte 0
        jne short .1
        mov edx, dword [pucky]
        movsx edx, word [edx]
        test edx, edx
        jge short .3
        neg edx
.3:
        cmp edx, 164h
        jg short .1
        mov dl, byte [byte eax+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        je short .4
        mov edx, 2
.4:
        movsx edx, word [nosplit edx*2+puckcross]
        test edx, edx
        jge short .5
        neg edx
.5:
        cmp edx, byte 2Ch
        jg short .1
        mov dx, word [gmode2]
        xor dh, dh
        and dl, 80h
        movsx edx, dx
        test edx, edx
        je short .1
        movsx eax, word [dword eax+086h]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov edx, eax
        movsx eax, word [lasttouch]
        cmp eax, byte 6
        setl al
        movzx eax, al
        cmp eax, edx
        je near .1
        movsx eax, word [lasttouch]
        imul eax, dword 0A0h
        mov edx, 8
        add eax, SortCords
        call AddPenalty2
        mov eax, 1
        pop edx
        ret
;-----------------------------------------------------------------------------
; checkpuckcoll_ccx                                   3F8F4  94G collide94.asm
; The per-object puck test of checkpuckcoll: stick, body or goalie
;-----------------------------------------------------------------------------
checkpuckcoll_ccx:
        push ebx
        push ecx
        push esi
        push edi
        enter 4, 0
        mov edi, eax
        mov eax, dword [puckc]
        movsx ax, byte [eax]
        cmp dx, ax
        je near BlockShotDive_127
        movsx eax, dx
        cmp eax, byte 0Bh
        jle short .1
        cmp eax, byte 10h
        jne near BlockShotDive_127
.1:
        movsx eax, dx
        imul eax, dword 0A0h
        mov esi, SortCords
        add esi, eax
        mov al, byte [byte esi+pflags]
        and al, 4
        movzx eax, al
        test eax, eax
        jne near BlockShotDive_127
        cmp word [byte esi+nopuck], byte 0
        jne near BlockShotDive_127
        mov al, byte [byte esi+pflags2]
        and al, 4
        movzx eax, al
        test eax, eax
        jne near .19
        cmp word [byte esi+position], byte 0
        jne near .19
        mov eax, esi
        call SkillForAnim
        mov dword [byte ebp-04h], eax
        mov eax, dword [puckvy]
        movsx eax, word [eax]
        push eax
        mov eax, dword [puckvx]
        movsx eax, word [eax]
        push eax
        call vecdist
        add esp, byte 8
        mov edx, eax
        test ax, ax
        jne short .2
        mov edx, 1
.2:
        movsx eax, word [byte ebp-04h]
        shl eax, 0Bh
        sub eax, 0FA0h
        movsx ebx, dx
        cdq
        idiv ebx
        mov dword [byte ebp-04h], eax
        test ax, ax
        jge short .3
        mov dword [byte ebp-04h], 0
.3:
        movsx eax, word [byte ebp-04h]
        cmp eax, byte 4
        jle short .4
        mov dword [byte ebp-04h], 4
.4:
        mov eax, esi
        call GetHotOrStick
        cmp word [regd0], byte 0
        jge short .5
        movsx eax, word [regd0]
        neg eax
        jmp short .6
.5:
        movsx eax, word [regd0]
.6:
        mov word [regd2], ax
        cwde
        shl eax, 2
        mov ebx, 3
        cdq
        idiv ebx
        mov word [regd4], ax
        cmp word [regd1], byte 0
        jge short .7
        movsx ecx, word [regd1]
        neg ecx
        jmp short .8
.7:
        movsx ecx, word [regd1]
.8:
        movsx eax, cx
        shl eax, 2
        mov ebx, 3
        cdq
        idiv ebx
        mov word [regd3], ax
        mov eax, dword [byte ebp-04h]
        add word [regd2], ax
        mov eax, dword [optflags]
        and eax, 180h
        cmp eax, 80h
        jne short .9
        movsx ebx, word [regd2]
        mov eax, ebx
        cdq
        shl edx, 2
        LD sbb, eax, edx
        sar eax, 2
        sub ebx, eax
        mov word [regd2], bx
.9:
        test word [optflags], 180h
        jne short .10
        movsx ebx, word [regd2]
        mov eax, ebx
        cdq
        shl edx, 2
        LD sbb, eax, edx
        sar eax, 2
        sub ebx, eax
        mov word [regd2], bx
.10:
        mov eax, esi
        call GetHot
        mov ebx, dword [puckx]
        mov ax, word [byte esi+Xpos+2]
        sub ax, word [ebx]
        add word [regd0], ax
        cmp word [regd0], byte 0
        jge short .11
        movsx eax, word [regd0]
        neg eax
        jmp short .12
.11:
        movsx eax, word [regd0]
.12:
        mov word [regd0], ax
        cmp ax, word [regd2]
        jge near .18
        mov ebx, dword [pucky]
        mov ax, word [byte esi+Ypos+2]
        sub ax, word [ebx]
        add word [regd1], ax
        cmp word [regd1], byte 0
        jge short .13
        movsx eax, word [regd1]
        neg eax
        jmp short .14
.13:
        movsx eax, word [regd1]
.14:
        mov word [regd1], ax
        cmp ax, word [regd2]
        jge near .18
        mov ax, word [regd4]
        add eax, ecx
        movsx edx, ax
        cmp edx, byte 5
        jg short .15
        mov edx, 5
.15:
        mov eax, dword [puckz]
        add edx, dword [byte ebp-04h]
        cmp dx, word [eax]
        jl near .18
        mov edx, ecx
        sub dx, word [regd4]
        sub edx, dword [byte ebp-04h]
        test dx, dx
        jl short .16
        cmp dx, word [eax]
        jge near .18
.16:
        movsx edx, word [regd0]
        imul edx, edx
        movsx eax, word [regd1]
        imul eax, eax
        add edx, eax
        movsx eax, word [regd2]
        imul eax, eax
        mov dword [regd0], edx
        mov dword [regd1], eax
        cmp word [byte edi+nopuck], byte 0
        jle short .17
        sar dword [regd1], 2
.17:
        mov eax, dword [PtrPuckFlags]
        movzx eax, byte [byte eax+05Bh]
        call randomd0
        mov edx, dword [regd1]
        cwde
        sar edx, 8
        imul eax, edx
        sub dword [regd1], eax
        mov eax, dword [PtrPuckFlags]
        movzx eax, byte [byte eax+05Ch]
        call randomd0
        mov edx, dword [regd1]
        cwde
        sar edx, 8
        imul eax, edx
        sub dword [regd1], eax
        mov ax, word [regd1]
        cmp ax, word [regd0]
        jl near .18
        mov eax, esi
        call ChkDelayedOffside
        mov edx, esi
        mov eax, edi
        call puckstick
.18:
        cmp word [byte esi+position], byte 0
        jne near .30
        mov ax, word [byte esi+Xpos+2]
        sub ax, word [byte edi+Xpos+2]
        mov word [regd0], ax
        test ax, ax
        jge near .26
        cwde
        neg eax
        jmp near .27
.19:
        mov al, byte [byte esi+pflags2]
        and al, 4
        movzx eax, al
        test eax, eax
        jne short .18
        cmp word [byte esi+position], byte 0
        jl short .18
        movsx eax, dx
        cmp eax, byte 10h
        je short .18
        movsx eax, word [byte edi+Zpos+2]
        cmp eax, byte 5
        jg short .18
        movsx eax, word [byte edi+Zvel]
        cmp eax, 200h
        jg short .18
        mov eax, esi
        call GetHot
        mov ax, word [byte esi+Xpos+2]
        sub ax, word [byte edi+Xpos+2]
        add word [regd0], ax
        cmp word [regd0], byte 0
        jge short .20
        movsx eax, word [regd0]
        neg eax
        jmp short .21
.20:
        movsx eax, word [regd0]
.21:
        cmp eax, byte 0Eh
        jg near .18
        mov ax, word [byte esi+Ypos+2]
        sub ax, word [byte edi+Ypos+2]
        add word [regd1], ax
        cmp word [regd1], byte 0
        jge short .22
        movsx eax, word [regd1]
        neg eax
        jmp short .23
.22:
        movsx eax, word [regd1]
.23:
        cmp eax, byte 0Eh
        jg near .18
        movsx edx, word [regd0]
        imul edx, edx
        movsx eax, word [regd1]
        imul eax, eax
        add edx, eax
        mov dword [regd1], 0C4h
        mov dword [regd0], edx
        cmp word [byte edi+nopuck], byte 0
        jle short .24
        sar word [regd1], 2
.24:
        mov eax, dword [regd0]
        cmp eax, dword [regd1]
        ja near .18
        mov ax, word [byte esi+frame]
        cwde
        cmp eax, 240h
        jl short .25
        cmp eax, 260h
        jge short .25
        cmp dword [regd0], byte 24h
        ja near .18
.25:
        mov edx, esi
        mov eax, edi
        call puckstick
        jmp near BlockShotDive_127
.26:
        cwde
.27:
        cmp eax, byte 0Ah
        jg near BlockShotDive_127
        mov ax, word [byte esi+Ypos+2]
        sub ax, word [byte edi+Ypos+2]
        mov word [regd1], ax
        test ax, ax
        jge short .28
        cwde
        neg eax
        jmp short .29
.28:
        cwde
.29:
        cmp eax, byte 0Ah
        jg near BlockShotDive_127
        movsx edx, word [regd0]
        imul edx, edx
        movsx eax, word [regd1]
        imul eax, eax
        add eax, edx
        cmp eax, byte 64h
        ja near BlockShotDive_127
        mov eax, esi
        call ChkDelayedOffside
        mov edx, esi
        mov eax, edi
        call puckgoalie
        jmp near BlockShotDive_127
.30:
        mov cx, word [byte esi+frame]
        movsx eax, cx
        cmp eax, 240h
        jl near .37
        cmp eax, 260h
        jge near .37
        mov eax, dword [puckz]
        movsx eax, word [eax]
        cmp eax, byte 8
        jge near .37
        mov eax, esi
        call GetHotStick
        sar word [regd0], 1
        sar word [regd1], 1
        cmp word [regd0], byte 0
        jge short .31
        movsx eax, word [regd0]
        neg eax
        jmp short .32
.31:
        movsx eax, word [regd0]
.32:
        mov edx, eax
        mov ax, word [byte esi+Xpos+2]
        sub ax, word [byte edi+Xpos+2]
        add word [regd0], ax
        cmp word [regd0], byte 0
        jge short .33
        movsx eax, word [regd0]
        neg eax
        jmp short .34
.33:
        movsx eax, word [regd0]
.34:
        movsx ebx, dx
        cmp eax, ebx
        jg short .37
        mov ax, word [byte esi+Ypos+2]
        sub ax, word [byte edi+Ypos+2]
        add word [regd1], ax
        cmp word [regd1], byte 0
        jge short .35
        movsx ebx, word [regd1]
        neg ebx
        jmp short .36
.35:
        movsx ebx, word [regd1]
.36:
        movsx eax, dx
        cmp ebx, eax
        jg short .37
        imul eax, eax
        movsx edx, word [regd0]
        imul edx, edx
        movsx ebx, word [regd1]
        imul ebx, ebx
        add edx, ebx
        mov dword [regd0], edx
        cmp eax, edx
        jae near .43
.37:
        mov eax, 8
        movsx ecx, cx
        mov edx, 40h
        cmp ecx, 44Fh
        jle short .38
        mov eax, 10h
        mov edx, 100h
.38:
        mov bx, word [byte esi+Xpos+2]
        sub bx, word [byte edi+Xpos+2]
        mov word [regd0], bx
        test bx, bx
        jge short .39
        movsx ebx, bx
        neg ebx
        jmp short .40
.39:
        movsx ebx, bx
.40:
        movsx ecx, ax
        cmp ebx, ecx
        jg near BlockShotDive_127
        mov bx, word [byte esi+Ypos+2]
        sub bx, word [byte edi+Ypos+2]
        mov word [regd1], bx
        test bx, bx
        jge short .41
        movsx ebx, bx
        neg ebx
        jmp short .42
.41:
        movsx ebx, bx
.42:
        cwde
        cmp ebx, eax
        jg near BlockShotDive_127
        movsx ebx, word [regd0]
        imul ebx, ebx
        movsx eax, word [regd1]
        imul eax, eax
        add ebx, eax
        movsx eax, dx
        mov dword [regd0], ebx
        cmp eax, ebx
        jb near BlockShotDive_127
.43:
        mov edx, esi
        mov eax, edi
        call puckbody
        jmp near BlockShotDive_127
;-----------------------------------------------------------------------------
; checkpuckcoll                    3FF26  94G collide94.asm, medium confidence
; Puck collisions: stop past y 190h, return above Z 16, walk the OOlist up
; and down within 40 and test each object (checkpuckcoll_ccx)
;-----------------------------------------------------------------------------
checkpuckcoll:
        push ebx
        push ecx
        push edx
        push esi
        mov ebx, eax
        cmp word [byte eax+06h], byte 0
        jge short .1
        movsx eax, word [byte eax+06h]
        neg eax
        jmp short .2
.1:
        movsx eax, word [byte eax+06h]
.2:
        cmp eax, 1F4h
        jle short .3
        mov word [byte ebx+Yvel], 0
        mov ax, word [byte ebx+Yvel]
        mov word [byte ebx+Xvel], ax
.3:
        movsx eax, word [byte ebx+Zpos+2]
        cmp eax, byte 18h
        jg near .8
        movsx eax, word [dword ebx+SCnum]
        mov cx, word [nosplit eax*2+OOlistpos]
        jmp short .5
.4:
        movsx dx, byte [dword eax+OOlist+1]
        movsx eax, byte [dword eax+OOlist+1]
        movsx esi, word [byte ebx+Ypos+2]
        movsx eax, word [nosplit eax*2+Ylist]
        sub eax, esi
        cmp eax, byte 28h
        jg short .6
        movsx edx, dx
        mov eax, ebx
        call checkpuckcoll_ccx
        inc ecx
.5:
        movsx eax, cx
        cmp eax, byte 10h
        jne short .4
.6:
        movsx ecx, word [dword ebx+SCnum]
        mov cx, word [nosplit ecx*2+OOlistpos]
        test cx, cx
        je short .8
.7:
        movsx eax, cx
        movsx si, byte [dword eax+OOlist-1]
        movsx eax, byte [dword eax+OOlist-1]
        movsx edx, word [nosplit eax*2+Ylist]
        movsx eax, word [byte ebx+Ypos+2]
        sub eax, edx
        cmp eax, byte 28h
        jg short .8
        movsx edx, si
        mov eax, ebx
        call checkpuckcoll_ccx
        dec cx
        jne short .7
.8:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CheckBump                        3FFF3  94G collide94.asm, medium confidence
; Player p runs into the puck carrier c.
;
; One time in 20h (randomd0), with the puck within 28h in y of c and p faster
; than 1B58h in x or y: c takes a quarter of p's velocity, p stops, sflags bit
; 6 (sfslock) is set and, while the clock runs.
;
; p gets penalty 1Eh (AddPenalty2). Returns 1 then, else 0.
;-----------------------------------------------------------------------------
CheckBump:
        push ebx
        push ecx
        push esi
        mov ebx, eax
        mov eax, 20h
        call randomd0
        test ax, ax
        jne near .10
        mov eax, dword [pucky]
        mov ax, word [eax]
        sub ax, word [byte edx+06h]
        test ax, ax
        jge short .1
        cwde
        neg eax
        jmp short .2
.1:
        cwde
.2:
        cmp eax, byte 28h
        jg near .10
        mov cx, word [byte ebx+0Ch]
        mov ax, word [byte ebx+0Eh]
        test cx, cx
        jge short .3
        movsx esi, cx
        neg esi
        jmp short .4
.3:
        movsx esi, cx
.4:
        cmp esi, 1B58h
        jg short .7
        test ax, ax
        jge short .5
        movsx esi, ax
        neg esi
        jmp short .6
.5:
        movsx esi, ax
.6:
        cmp esi, 1B58h
        jle short .10
.7:
        movsx esi, cx
        cwde
        sar esi, 2
        sar eax, 2
        mov word [byte edx+0Ch], si
        mov word [byte edx+0Eh], ax
        mov word [byte ebx+0Ch], 0
        mov word [byte ebx+0Eh], 0
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        or byte [sflags], 40h
        test eax, eax
        je short .9
.8:
        mov eax, 1
        pop esi
        pop ecx
        pop ebx
        ret
.9:
        mov edx, 1Eh
        mov eax, ebx
        call AddPenalty2
        jmp short .8
.10:
        xor eax, eax
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GetLowestPen                     400B1  94G penalty94.asm, medium confidence
; Shorthanded team from tmap: walks its box list (+0B6h) summing the
; non-coincidental tmpdst (+7Eh, &3FFFh) time steps.
;
; Then compares with the power-play team's list; returns the power-play time
; left
;-----------------------------------------------------------------------------
GetLowestPen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        mov ax, word [hmtmap]
        sub ax, word [awtmap]
        test ax, ax
        jle short .1
        mov ebx, hmtmstruct
        mov dword [byte ebp-04h], awtmstruct
        jmp short .3
.1:
        jl short .2
        xor eax, eax
        jmp near chk4pass_4F6
.2:
        mov ebx, awtmstruct
        mov dword [byte ebp-04h], hmtmstruct
.3:
        mov ecx, dword [byte ebp-04h]
        xor esi, esi
        xor eax, eax
        add ecx, 0B8h
.4:
        movsx dx, byte [ecx]
        inc ecx
        test dx, dx
        jl short .5
        movsx edx, dx
        add edx, edx
        add edx, dword [byte ebp-04h]
        mov dx, word [dword edx+080h]
        test dx, dx
        jl short .4
        mov edi, edx
        and edi, 2000h
        movsx edi, di
        test edi, edi
        jne short .4
        and dh, 3
        sub edx, esi
        mov esi, edx
        add eax, edx
        jmp short .4
.5:
        movsx edx, word [byte ebx+038h]
        cmp edx, byte 6
        je near chk4pass_4F6
        lea ecx, [dword ebx+0B8h]
        sub eax, esi
.6:
        movsx dx, byte [ecx]
        inc ecx
        test dx, dx
        jl near chk4pass_4F6
        movsx edx, dx
        mov dx, word [dword ebx+edx*2+080h]
        test dx, dx
        jl short .6
        mov edi, edx
        and edi, 2000h
        movsx edi, di
        test edi, edi
        jne short .6
        and dh, 3
        cmp ax, dx
        jl near chk4pass_4F6
        add eax, esi
        jmp near chk4pass_4F6
;-----------------------------------------------------------------------------
; chk4lc                           40189  93G logic93_3.asm, medium confidence
; (see if computer should call line change).
;
; Puck in own half below the blue line, 1 in 4, not pflags2 bit 3; PC adds
; clock penalty checks (GetLowestPen). Then CompLine, setpersonel and
; chk4lc_shoot: CompShoot dumps the puck. Returns 1 when it did.
;-----------------------------------------------------------------------------
chk4lc:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov ebx, eax
        mov ecx, dword [gameopts]
        test byte [byte ecx+01h], 30h
        je near .3
        cmp dword [penshotlive], byte 0
        jne near .3
        mov ecx, dword [pucky]
        mov ax, word [ecx]
        mov word [regd0], ax
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .1
        neg word [regd0]
.1:
        cmp word [regd0], byte 0
        jl near .3
        movsx eax, word [regd0]
        cmp eax, byte 74h
        jg short .3
        mov eax, 4
        call randomd0
        test ax, ax
        jne short .3
        mov al, byte [byte ebx+pflags2]
        and al, 8
        movzx eax, al
        test eax, eax
        jne short .3
        mov ecx, dword [dword ebx+tmptr]
        mov al, byte [dword ecx+0D6h]
        mov esi, dword [dword ebx+optmptr]
        and al, 40h
        mov dx, word [byte ecx+tmap]
        movzx eax, al
        sub dx, word [byte esi+tmap]
        test eax, eax
        je short .4
        movsx eax, word [gameclock]
        cmp eax, byte 0Fh
        jl short .3
.2:
        test dx, dx
        je short .8
        call GetLowestPen
        cwde
        cmp eax, byte 0Fh
        jge short .8
.3:
        xor eax, eax
        jmp near chk4pass_4F7
.4:
        mov eax, ecx
        call AvgCline
        movsx eax, word [gameclock]
        cmp eax, byte 0Fh
        jl short .3
        cmp eax, byte 1Eh
        jge short .5
        cmp word [regd0], 800h
        ja short .3
.5:
        test dx, dx
        je short .6
        mov eax, 0F33h
        jmp short .7
.6:
        mov eax, dword [dword ecx+0D8h]
.7:
        movzx edi, word [regd0]
        cmp eax, edi
        jb short .3
        jmp short .2
.8:
        mov edx, ecx
        mov eax, esi
        call CompLine
        mov eax, ecx
        call setpersonel
        mov eax, ebx
        call CompShoot
        mov eax, 1
        jmp near chk4pass_4F7
;-----------------------------------------------------------------------------
; chk4lcauto                                      402AD  96 PC, low confidence
; Called from assnearest when the line option (gameopts +1 bits 4-5) is 20h:
; one time in four compares the lines (GetLowestPen, AvgCline.
;
; CompLine) and calls setpersonel
;-----------------------------------------------------------------------------
chk4lcauto:
        push ebx
        push ecx
        push edx
        push esi
        mov edx, eax
        mov ebx, dword [gameopts]
        mov eax, dword [byte ebx+01h]
        and eax, byte 30h
        cmp eax, byte 20h
        jne near .3
        mov al, byte [byte edx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        je near .3
        cmp dword [penshotlive], byte 0
        jne near .3
        mov ebx, dword [pucky]
        mov ax, word [ebx]
        mov word [regd0], ax
        mov al, byte [byte edx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .1
        neg word [regd0]
.1:
        cmp word [regd0], byte 0
        jl short .3
        mov eax, 4
        call randomd0
        test ax, ax
        jne short .3
        mov al, byte [byte edx+pflags2]
        and al, 8
        movzx eax, al
        test eax, eax
        jne short .3
        mov ebx, dword [dword edx+tmptr]
        mov al, byte [dword ebx+0D6h]
        mov ecx, dword [dword edx+optmptr]
        and al, 40h
        mov dx, word [byte ebx+tmap]
        movzx eax, al
        sub dx, word [byte ecx+tmap]
        test eax, eax
        je short .4
        movsx eax, word [gameclock]
        cmp eax, byte 0Fh
        jl short .3
.2:
        test dx, dx
        je short .8
        call GetLowestPen
        cwde
        cmp eax, byte 0Fh
        jge short .8
.3:
        xor eax, eax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.4:
        mov eax, ebx
        call AvgCline
        movsx eax, word [gameclock]
        cmp eax, byte 0Fh
        jl short .3
        cmp eax, byte 1Eh
        jge short .5
        cmp word [regd0], 800h
        ja short .3
.5:
        test dx, dx
        je short .6
        mov eax, 0F33h
        jmp short .7
.6:
        mov eax, dword [dword ebx+0D8h]
.7:
        movzx esi, word [regd0]
        cmp esi, eax
        ja short .3
        jmp short .2
.8:
        mov edx, ebx
        mov eax, ecx
        call CompLine
        mov eax, ebx
        call setpersonel
        mov eax, 1
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PassLaneChk                                  403CE  95 PC, medium confidence
; The drop pass check (95 PC PassLaneChk) for passer eax / receiver edx: 1 when
; the passer is not the goalie, ShotLaneOpen says the shot lane is blocked, the
; passer is past the attacking blue line (74h, the 96 rink; 95 PC 4Eh) and no
; deeper than 9Ch, and the receiver trails him within 3Ch / 28h heading the
; same way; then dopass drops the puck with ScatterPass. Used by chk4pass (the
; passlane byte +53h) and dopass
;-----------------------------------------------------------------------------
PassLaneChk:
        push ebx
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov ecx, eax
        mov ebx, edx
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx edi, al
        mov esi, edi
        cmp word [byte ecx+position], byte 0
        jne short .2
.1:
        xor eax, eax
        jmp near BlockShotDive_127
.2:
        call ShotLaneOpen
        test eax, eax
        jne short .1
        movsx edx, word [byte edx+06h]
        movsx eax, word [byte ecx+Ypos+2]
        test edi, edi
        je short .3
        mov edi, 74h
        jmp short .4
.3:
        mov edi, 0FFFFFF8Ch
.4:
        cmp eax, edi
        setg byte [byte ebp-04h]
        movzx edi, byte [byte ebp-04h]
        xor edi, esi
        jne short .1
        test eax, eax
        jge short .5
        mov dword [byte ebp-0Ch], eax
        neg dword [byte ebp-0Ch]
        jmp short .6
.5:
        mov dword [byte ebp-0Ch], eax
.6:
        test edx, edx
        jge short .7
        mov dword [byte ebp-08h], edx
        neg dword [byte ebp-08h]
        jmp short .8
.7:
        mov dword [byte ebp-08h], edx
.8:
        mov edi, dword [byte ebp-0Ch]
        cmp edi, dword [byte ebp-08h]
        jle short .1
        test eax, eax
        jge short .9
        mov edi, eax
        neg edi
        jmp short .10
.9:
        mov edi, eax
.10:
        cmp edi, 9Ch
        jg short .1
        test esi, esi
        je short .11
        cmp word [byte ebx+Yvel], byte 0
        jl short .1
        cmp word [byte ecx+Yvel], byte 0
        jl near .1
.11:
        test esi, esi
        jne short .12
        cmp word [byte ebx+Yvel], byte 0
        jg near .1
        cmp word [byte ecx+Yvel], byte 0
        jg near .1
.12:
        movsx esi, word [byte ebx+Yvel]
        sar esi, 8
        add esi, edx
        lea edi, [byte eax-074h]
        sub esi, byte 74h
        xor esi, edi
        test esi, esi
        jl near .1
        sub edx, eax
        test edx, edx
        jge short .13
        neg edx
.13:
        cmp edx, byte 3Ch
        jg near .1
        movsx edx, word [byte ecx+Xpos+2]
        movsx eax, word [byte ebx+Xpos+2]
        sub edx, eax
        mov eax, edx
        test edx, edx
        jge short .14
        neg eax
.14:
        cmp eax, byte 28h
        jg near .1
        movsx edx, word [byte ebx+Yvel]
        movsx eax, word [byte ebx+Xvel]
        call vtoa
        movsx esi, ax
        cmp esi, byte 8
        jne short .15
        movsx esi, word [byte ebx+facedir]
.15:
        mov ax, word [byte ecx+Ypos+2]
        sub ax, word [byte ebx+Ypos+2]
        movsx edx, ax
        mov ax, word [byte ecx+Xpos+2]
        sub ax, word [byte ebx+Xpos+2]
        cwde
        call vtoa
        cwde
        sub esi, eax
        inc esi
        and esi, byte 7
        cmp esi, byte 3
        jge near .1
        mov eax, 1
        jmp near BlockShotDive_127
;-----------------------------------------------------------------------------
; ScatterPass                                  40524  95 PC, medium confidence
; (player, receiver): counts a pass attempt (team +26h, hmpassatt) unless
; replay, sets passplayer, receiver gets asstab 13h (asspassrec).
;
; puck gets random vx/vy scaled by (12h - passing skill +5Dh)*14h
;-----------------------------------------------------------------------------
ScatterPass:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        mov word [byte eax+03Eh], 3Ch
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne short .1
        mov eax, dword [dword ebx+tmptr]
        inc word [byte eax+tmpasses]
.1:
        mov ax, word [dword ecx+086h]
        mov edx, 13h
        mov word [passplayer], ax
        mov eax, ecx
        mov byte [byte ebx+passlane], 0
        call assinsert
        mov eax, dword [puckvz]
        mov word [eax], 0
        mov ecx, 12h
        movzx ax, byte [byte ebx+passacc]
        sub ecx, eax
        imul eax, ecx, byte 14h
        cwde
        call randomd0
        mov ecx, eax
        mov eax, dword [puckvx]
        mov word [eax], cx
        movzx ax, byte [byte ebx+passacc]
        mov ebx, 12h
        sub ebx, eax
        imul eax, ebx, byte 14h
        cwde
        call randomd0
        mov ebx, eax
        mov eax, dword [puckvy]
        mov word [eax], bx
        mov eax, dword [PtrPuckFlags]
        mov word [byte eax+03Eh], 0
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        mov edi, eax
        movsx eax, word [dword eax+086h]
        mov dword [byte ebp-04h], 0
        cmp eax, byte 6
        jge short .2
        xor eax, eax
        jmp short .3
.2:
        mov eax, 6
.3:
        imul eax, dword 0A0h
        mov esi, SortCords
        mov dword [byte ebp-0Ch], 3E8h
        mov dword [byte ebp-08h], 0
        add esi, eax
.4:
        cmp esi, edi
        je near .5
        cmp word [byte esi+position], byte 0
        jle near .5
        mov al, byte [byte esi+pflags2]
        and al, 4
        movzx eax, al
        test eax, eax
        jne short .5
        mov ax, word [byte edi+Ypos+2]
        cmp ax, word [byte esi+Ypos+2]
        setg al
        movzx ecx, al
        mov al, byte [byte edi+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        xor eax, ecx
        jne short .5
        movsx ecx, word [byte esi+Ypos+2]
        movsx eax, word [byte esi+Yvel]
        mov edx, 8
        add eax, ecx
        movsx ecx, word [byte edi+Ypos+2]
        sub edx, ecx
        mov ecx, edx
        sar eax, cl
        push eax
        movsx ecx, word [byte esi+Xvel]
        movsx eax, word [byte esi+Xpos+2]
        mov edx, 8
        add eax, ecx
        movsx ecx, word [byte edi+Xpos+2]
        sub edx, ecx
        mov ecx, edx
        sar eax, cl
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, dword [byte ebp-0Ch]
        jge short .5
        mov dword [byte ebp-0Ch], eax
        mov dword [byte ebp-04h], esi
.5:
        inc dword [byte ebp-08h]
        add esi, 0A0h
        cmp dword [byte ebp-08h], byte 6
        jl near .4
        mov eax, dword [byte ebp-04h]
        jmp near chk4pass_4F6
;-----------------------------------------------------------------------------
; dopass                             406A0  94G logic94.asm, medium confidence
; Passes the puck in passdir, to the best teammate there if any
;-----------------------------------------------------------------------------
dopass:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 14h, 0
        mov ebx, eax
        mov dword [OneTimerPasser], 0
        mov eax, dword [puckc]
        mov dword [onetimerflag], 0
        and byte [sflags], 0FBh
        mov byte [eax], 0FFh
        mov word [byte ebx+nopuck], 10h
        mov ax, word [dword ebx+SCnum]
        mov word [lastplayer], ax
        mov word [VisTeam], ax
        mov eax, dword [PtrPuckFlags]
        or byte [gmode2], 10h
        mov word [byte eax+048h], 1
        mov al, byte [byte ebx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        jne short .2
        cmp byte [byte ebx+passlane], 0
        je short .2
        movsx eax, word [byte ebx+048h]
        imul eax, dword 0A0h
        mov edx, SortCords
        add edx, eax
.1:
        mov eax, ebx
        call ScatterPass
        jmp near chk4pass_4F6
.2:
        cmp word [byte ebx+position], byte 0
        jne short .3
        movsx edx, byte [byte ebx+pnum]
        imul edx, byte 11h
        mov eax, dword [dword ebx+tmptr]
        mov eax, dword [dword eax+tmglattr]
        movzx ax, byte [byte edx+eax+010h]
        jmp short .4
.3:
        movzx ax, byte [byte ebx+passacc]
.4:
        shl eax, 2
        add eax, 0A0h
        mov word [passspeed], ax
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 6
        jge short .5
        xor eax, eax
        jmp short .6
.5:
        mov eax, 6
.6:
        imul eax, dword 0A0h
        mov ecx, SortCords
        mov dword [byte ebp-014h], 0FFFFFFFFh
        mov dword [byte ebp-08h], 6
        xor esi, esi
        add ecx, eax
.7:
        cmp ebx, ecx
        je near .11
        cmp word [byte ecx+position], byte 0
        jle near .11
        mov al, byte [byte ecx+pflags2]
        and al, 4
        movzx eax, al
        test eax, eax
        jne near .11
        mov eax, dword [puckx]
        mov di, word [byte ecx+Xpos+2]
        mov dx, word [byte ecx+Ypos+2]
        sub di, word [eax]
        mov eax, dword [pucky]
        mov dword [byte ebp-04h], edx
        mov ax, word [eax]
        sub dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-04h]
        cwde
        movsx edi, di
        mov dword [byte ebp-010h], eax
        mov edx, eax
        mov eax, edi
        call vtoa
        sub ax, word [passdir]
        xor ah, ah
        and al, 7
        movsx edx, ax
        cmp edx, byte 1
        jle short .8
        cmp edx, byte 7
        jne short .11
.8:
        imul edi, edi
        mov edx, dword [byte ebp-010h]
        imul edx, edx
        add edx, edi
        test ax, ax
        jne short .9
        xor edi, edi
        jmp short .10
.9:
        mov edi, 10000h
.10:
        add edi, edx
        cmp edi, dword [byte ebp-014h]
        ja short .11
        mov dword [byte ebp-014h], edi
        mov esi, ecx
.11:
        add ecx, 0A0h
        dec word [byte ebp-08h]
        jne near .7
        test esi, esi
        je short .13
        mov al, byte [byte ebx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        je short .12
        mov edx, esi
        mov eax, ebx
        call PassLaneChk
        test eax, eax
        je short .12
        mov edx, esi
        jmp near .1
.12:
        mov eax, esi
        call passtoa0
        jmp short .14
.13:
        movsx eax, word [passdir]
        movsx ecx, word [passspeed]
        movsx eax, word [nosplit eax*4+dirtab_y]
        imul eax, ecx
        shl eax, 0Ah
        mov dword [byte ebp-0Ch], 0BB8h
        cdq
        idiv dword [byte ebp-0Ch]
        mov edi, eax
        mov eax, dword [puckvy]
        add di, word [byte ebx+Yvel]
        mov word [eax], di
        movsx eax, word [passdir]
        movsx eax, word [nosplit eax*4+dirtab]
        imul eax, ecx
        shl eax, 0Ah
        mov ecx, 0BB8h
        cdq
        idiv ecx
        mov edi, eax
        mov eax, dword [puckvx]
        add di, word [byte ebx+Xvel]
        mov word [eax], di
        mov eax, 1000h
        call randomd0
        mov ecx, eax
        mov eax, dword [puckvz]
        mov word [eax], cx
.14:
        cmp word [byte ebx+position], byte 0
        jne short .16
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        sete al
        movzx ecx, al
        mov eax, dword [puckvy]
        cmp word [eax], byte 0
        setl dl
        movzx edx, dl
        xor edx, ecx
        je short .15
        mov dx, word [eax]
        neg edx
        mov word [eax], dx
.15:
        mov eax, 6A1h
        or byte [byte ebx+pflags2], 2
        jmp short .20
.16:
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
        je short .17
        mov eax, 1
        movsx ecx, cx
        shl eax, cl
        test al, 0F0h
        jmp short .18
.17:
        mov eax, 1
        movsx ecx, cx
        shl eax, cl
        test al, 1Eh
.18:
        setne al
        movzx cx, al
        test cx, cx
        jne short .19
        mov eax, 0AFh
        jmp short .20
.19:
        mov eax, 0B5h
.20:
        movsx edx, ax
        mov eax, ebx
        call SetSPA
        mov eax, 8
        or byte [byte ebx+pflags], 20h
        call PlaySfx
        mov al, byte [byte ebx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        je near chk4pass_4F6
        cmp word [byte ebx+position], byte 0
        jne near chk4pass_4F6
        test esi, esi
        je short .21
        mov al, byte [byte esi+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        jne short .21
        movsx edx, word [dword esi+086h]
        mov eax, dword [byte ebx+ctlslot]
        call SetControlledPlayer
        jmp near chk4pass_4F6
.21:
        mov eax, ebx
        movsx edx, word [byte ebx+ctlslot]
        call changeplayer
        jmp near chk4pass_4F6
;-----------------------------------------------------------------------------
; CompPass                                     409D5  96 PC, medium confidence
; Called from asspuckc: the computer's pass to player edx: releases the puck,
; PassLaneChk, ScatterPass or passtoa0
;-----------------------------------------------------------------------------
CompPass:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        mov dword [OneTimerPasser], 0
        mov eax, dword [puckc]
        mov dword [onetimerflag], 0
        and byte [sflags], 0FBh
        mov byte [eax], 0FFh
        mov word [byte ebx+nopuck], 10h
        mov ax, word [dword ebx+SCnum]
        mov word [lastplayer], ax
        mov word [VisTeam], ax
        mov eax, dword [PtrPuckFlags]
        or byte [gmode2], 10h
        mov word [byte eax+048h], 1
        cmp word [byte ebx+position], byte 0
        jne short .1
        mov eax, 8
        jmp short .2
.1:
        movzx ax, byte [byte ebx+passacc]
.2:
        shl eax, 2
        add eax, 0A0h
        mov edx, ecx
        mov word [passspeed], ax
        mov eax, ebx
        call PassLaneChk
        test eax, eax
        je short .3
        mov edx, ecx
        mov eax, ebx
        call ScatterPass
        pop ecx
        pop ebx
        ret
.3:
        mov eax, ecx
        call passtoa0
        cmp word [byte ebx+position], byte 0
        jne short .5
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
        je short .4
        mov ecx, dword [puckvy]
        mov ax, word [ecx]
        neg eax
        mov word [ecx], ax
.4:
        mov ecx, 6A1h
        or byte [byte ebx+pflags2], 2
        jmp short .9
.5:
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
        je short .6
        mov eax, 1
        movsx ecx, cx
        shl eax, cl
        test al, 0F0h
        jmp short .7
.6:
        mov eax, 1
        movsx ecx, cx
        shl eax, cl
        test al, 1Eh
.7:
        setne al
        movzx cx, al
        test cx, cx
        jne short .8
        mov ecx, 0AFh
        jmp short .9
.8:
        mov ecx, 0B5h
.9:
        movsx edx, cx
        mov eax, ebx
        call SetSPA
        mov eax, 8
        or byte [byte ebx+pflags], 20h
        call PlaySfx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; passmode                           40B2A  94G logic94.asm, medium confidence
; Pass mode input: B changed (regd2 bit 4) -> dopass, else dpad&7 -> passdir
;-----------------------------------------------------------------------------
passmode:
        push ebx
        push ecx
        mov ebx, edx
        mov dx, word [regd2]
        xor dh, dh
        and dl, 10h
        movsx edx, dx
        test edx, edx
        je short .1
        mov dx, word [regd3]
        xor dh, dh
        and dl, 10h
        movsx edx, dx
        test edx, edx
        jne short .1
        call dopass
        pop ecx
        pop ebx
        ret
.1:
        mov dx, word [regd3]
        xor dh, dh
        and dl, 10h
        movsx edx, dx
        test edx, edx
        jne short .2
        and byte [sflags], 0FBh
        pop ecx
        pop ebx
        ret
.2:
        mov dx, word [regd0]
        xor dh, dh
        and dl, 8
        movsx edx, dx
        test edx, edx
        jne near .3
        mov dx, word [regd0]
        xor dh, dh
        and dl, 7
        or byte [regd0], 8
        mov word [passdir], dx
        cmp word [byte eax+position], byte 0
        je short .3
        cmp dword [nosplit ebx*4+PassHoldFrames], byte 1Eh
        jle short .3
        mov dl, byte [byte eax+pflags]
        and dl, 40h
        movzx edx, dl
        test edx, edx
        setne dl
        movzx edx, dl
        mov dword [nosplit edx*4+PuckChasers], 1
        mov dl, byte [byte eax+pflags]
        and dl, 40h
        movzx edx, dl
        movsx ecx, word [dword eax+SCnum]
        test edx, edx
        setne dl
        movzx edx, dl
        mov dword [nosplit edx*4+PuckChaserPlayer], ecx
        call dopass
        mov dword [nosplit ebx*4+PassTargetLocked], 1
        mov dword [nosplit ebx*4+PassHoldFrames], 0
.3:
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; setpassmode                        40C14  94G logic94.asm, medium confidence
; Starts pass mode
;-----------------------------------------------------------------------------
setpassmode:
        mov ax, word [byte eax+036h]
        xor ah, ah
        and al, 7
        or byte [sflags], 4
setpassmode_F:
        mov word [passdir], ax
        ret
;-----------------------------------------------------------------------------
; passtoa0                           40C2A  94G logic94.asm, medium confidence
; Passes the puck to the given player
;-----------------------------------------------------------------------------
passtoa0:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1Ch, 0
        mov esi, eax
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne short .1
        mov eax, dword [dword esi+tmptr]
        inc word [byte eax+tmpasses]
.1:
        mov ax, word [dword esi+SCnum]
        mov edx, 13h
        mov word [passplayer], ax
        mov eax, esi
        call assinsert
        mov eax, esi
        call GetHot
        mov dx, word [regd0]
        mov eax, dword [puckx]
        add dx, word [byte esi+Xpos+2]
        sub dx, word [eax]
        mov dword [byte ebp-018h], edx
        movsx ecx, dx
        mov dx, word [regd1]
        mov eax, dword [pucky]
        add dx, word [byte esi+Ypos+2]
        sub dx, word [eax]
        movsx eax, word [byte esi+Xvel]
        imul eax, dword 0F0h
        sar eax, 10h
        mov dword [byte ebp-08h], eax
        movsx eax, word [byte esi+Yvel]
        imul eax, dword 0F0h
        sar ecx, 2
        mov ebx, dword [byte ebp-08h]
        imul ebx, ecx
        mov dword [byte ebp-014h], edx
        movsx edx, dx
        sar eax, 10h
        sar edx, 2
        mov dword [byte ebp-04h], eax
        imul eax, edx
        add eax, ebx
        add eax, eax
        mov dword [byte ebp-0Ch], eax
        movsx eax, word [passspeed]
        sar eax, 2
        mov ebx, eax
        movsx eax, word [byte ebp-08h]
        imul eax, eax
        mov dword [byte ebp-01Ch], eax
        movsx eax, word [byte ebp-04h]
        imul eax, eax
        mov edi, dword [byte ebp-01Ch]
        add edi, eax
        movsx eax, bx
        imul eax, eax
        movsx ebx, cx
        imul ebx, ebx
        movsx ecx, dx
        imul ecx, ecx
        sub edi, eax
        movsx eax, word [byte ebp-0Ch]
        imul eax, eax
        add ecx, ebx
        movsx ebx, di
        imul ecx, ebx
        shl ecx, 2
        sub eax, ecx
        mov ecx, eax
        test eax, eax
        jle short .2
        push eax
        call IntSqrt
        add esp, byte 4
        mov ecx, eax
        jmp short .3
.2:
        xor ecx, eax
.3:
        sar di, 2
        test di, di
        jne short .4
        mov edi, 1
.4:
        xor ebx, ebx
        jmp short .6
.5:
        mov word [byte ebp-010h], cx
        movsx eax, word [byte ebp-010h]
        mov dword [byte ebp-01Ch], eax
        movsx eax, word [byte ebp-0Ch]
        mov edx, dword [byte ebp-01Ch]
        sub edx, eax
        mov eax, edx
        movsx edx, di
        mov dword [byte ebp-01Ch], edx
        cdq
        idiv dword [byte ebp-01Ch]
        neg ecx
        mov word [byte ebp-010h], ax
        test ax, ax
        jge short .7
        inc ebx
.6:
        movsx eax, bx
        cmp eax, byte 2
        jl short .5
.7:
        cmp word [byte ebp-010h], byte 0
        jg short .8
        mov word [byte ebp-010h], 1
.8:
        movsx eax, word [byte ebp-010h]
        cmp eax, byte 18h
        jle short .9
        mov word [byte ebp-010h], 18h
.9:
        movsx eax, word [byte ebp-010h]
        cmp eax, byte 0Ch
        jl short .10
        mov eax, 0Ch
.10:
        movsx bx, al
        movsx eax, al
        cmp eax, byte 6
        jle short .11
        movsx ebx, bx
        lea eax, [byte ebx+01h]
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov ecx, eax
        mov eax, ebx
        cdq
        LD sub, eax, edx
        sar eax, 1
        cwde
        call randomd0
        movsx ebx, ax
        add ebx, ecx
.11:
        mov eax, dword [puckvz]
        movsx ecx, word [byte ebp-08h]
        mov byte [byte eax+01h], bl
        movsx ebx, word [byte ebp-010h]
        imul ecx, ebx
        mov al, byte [byte ebp-010h]
        shl al, 3
        sub al, 0Ah
        mov byte [byte esi+027h], al
        movsx eax, al
        sub eax, byte 6
        mov edx, eax
        mov eax, dword [PtrPuckFlags]
        sar ecx, 1
        mov word [byte eax+03Eh], dx
        movsx eax, word [byte ebp-018h]
        add ecx, eax
        mov eax, dword [puckx]
        mov dword [regd0], ecx
        mov ax, word [eax]
        add ax, word [regd0]
        mov word [byte esi+temp3], ax
        movsx eax, word [byte ebp-04h]
        imul ebx, eax
        movsx eax, word [byte ebp-014h]
        sar ebx, 1
        add ebx, eax
        mov eax, dword [pucky]
        mov dword [regd1], ebx
        mov ax, word [eax]
        add ax, word [regd1]
        mov word [byte esi+temp4], ax
        imul eax, dword [byte ebp-010h], byte 78h
        mov word [byte ebp-010h], ax
        mov eax, dword [regd0]
        shl eax, 10h
        movsx ebx, word [byte ebp-010h]
        cdq
        idiv ebx
        mov esi, eax
        mov eax, dword [puckvx]
        mov word [eax], si
        mov eax, dword [regd1]
        shl eax, 10h
        cdq
        idiv ebx
        mov esi, eax
        mov eax, dword [puckvy]
        mov word [eax], si
        jmp near chk4pass_4F6
;-----------------------------------------------------------------------------
; chk4pass                           40E82  94G logic94.asm, medium confidence
; (computer looks for a good pass): threat spodds roll, target by vtoa
; (PassLaneChk), dopass, assexit.
;-----------------------------------------------------------------------------
chk4pass:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        mov esi, eax
        mov byte [byte eax+053h], 0
        cmp word [threat], byte 0
        jne short chk4pass_2F.1
        movzx ax, byte [byte eax+05Fh]
        add eax, 10h
        cwde
        call randomd0
        cwde
        cmp eax, byte 9
        jle short chk4pass_2F.1
chk4pass_2F:
        xor eax, eax
        jmp near chk4pass_4F6
.1:
        mov eax, 6
        call randomd0
        mov word [regd0], ax
        movsx edx, word [dword esi+SCnum]
        cmp edx, byte 6
        jl short .2
        add eax, 6
        mov word [regd0], ax
.2:
        mov ax, word [regd0]
        cmp ax, word [dword esi+SCnum]
        je short chk4pass_2F
        cwde
        imul eax, dword 0A0h
        mov edi, SortCords
        add edi, eax
        cmp word [byte edi+position], byte 0
        jle short chk4pass_2F
        mov al, byte [byte edi+pflags2]
        and al, 4
        movzx eax, al
        test eax, eax
        jne short chk4pass_2F
        mov al, byte [byte edi+pflags]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne short chk4pass_2F
        cmp word [byte esi+position], byte 0
        je near .22
        mov al, byte [byte esi+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov ebx, dword [pucky]
        mov edx, eax
        cmp word [ebx], byte 0
        setg al
        movzx eax, al
        xor eax, edx
        je near .22
        movsx ebx, word [byte edi+Xvel]
        movsx eax, word [byte edi+Xpos+2]
        sar ebx, 8
        add ebx, eax
        test ebx, ebx
        jge short .3
        neg ebx
.3:
        cmp ebx, byte 32h
        jg short .6
        movsx ebx, word [byte edi+Yvel]
        movsx eax, word [byte edi+Ypos+2]
        sar ebx, 8
        add ebx, eax
        test ebx, ebx
        jge short .4
        neg ebx
.4:
        cmp ebx, 128h
        jle short .6
        movsx ebx, word [byte edi+Yvel]
        movsx eax, word [byte edi+Ypos+2]
        sar ebx, 8
        add ebx, eax
        test ebx, ebx
        jge short .5
        neg ebx
.5:
        cmp ebx, 167h
        jl near chk4pass_2F
.6:
        mov al, byte [byte esi+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .7
        mov ebx, dword [PtrAwayNet]
        jmp short .8
.7:
        mov ebx, dword [PtrHomeNet]
.8:
        mov ax, word [byte edi+Ypos+2]
        sub ax, word [byte esi+Ypos+2]
        movsx edx, ax
        mov ax, word [byte edi+Xpos+2]
        sub ax, word [byte esi+Xpos+2]
        cwde
        call vtoa
        mov ecx, eax
        mov ax, word [byte ebx+06h]
        sub ax, word [byte esi+Ypos+2]
        movsx edx, ax
        mov ax, word [byte ebx+02h]
        sub ax, word [byte esi+Xpos+2]
        cwde
        call vtoa
        cmp cx, ax
        jne short .9
        movsx edx, word [byte ebx+06h]
        movsx eax, word [byte esi+Ypos+2]
        sub edx, eax
        push edx
        movsx eax, word [byte esi+Xpos+2]
        movsx edx, word [byte ebx+02h]
        sub edx, eax
        push edx
        call vecdist
        mov dword [byte ebp-0Ch], eax
        movsx edx, word [byte edi+Ypos+2]
        movsx eax, word [byte esi+Ypos+2]
        add esp, byte 8
        sub edx, eax
        push edx
        movsx eax, word [byte esi+Xpos+2]
        movsx edx, word [byte edi+Xpos+2]
        sub edx, eax
        push edx
        call vecdist
        mov edx, dword [byte ebp-0Ch]
        add edx, byte 20h
        add esp, byte 8
        cmp eax, edx
        jb near chk4pass_2F
.9:
        mov ebx, dword [puckx]
        cmp word [ebx], byte 0
        jge short .10
        movsx eax, word [ebx]
        neg eax
        jmp short .11
.10:
        movsx eax, word [ebx]
.11:
        cmp eax, byte 32h
        jg near .22
        mov ebx, dword [pucky]
        cmp word [ebx], byte 0
        jge short .12
        movsx eax, word [ebx]
        neg eax
        jmp short .13
.12:
        movsx eax, word [ebx]
.13:
        cmp eax, 128h
        jle near .22
        mov ebx, dword [pucky]
        cmp word [ebx], byte 0
        jge short .14
        movsx eax, word [ebx]
        neg eax
        jmp short .15
.14:
        movsx eax, word [ebx]
.15:
        cmp eax, 167h
        jl near chk4pass_2F
        mov ax, word [byte edi+Xpos+2]
        mov word [regd0], ax
        mov ax, word [byte edi+Ypos+2]
        mov word [regd1], ax
        cmp word [regd0], byte 0
        jge short .16
        movsx eax, word [regd0]
        neg eax
        jmp short .17
.16:
        movsx eax, word [regd0]
.17:
        cmp eax, byte 3Ch
        jl near chk4pass_2F
        mov ebx, dword [puckx]
        movsx eax, word [regd0]
        movsx edx, word [ebx]
        xor eax, edx
        test eax, eax
        jge short .22
        mov ebx, dword [pucky]
        cmp word [ebx], byte 0
        jge short .18
        movsx eax, word [ebx]
        neg eax
        jmp short .19
.18:
        movsx eax, word [ebx]
.19:
        lea edx, [dword eax-0164h]
        cmp word [regd1], byte 0
        jge short .20
        movsx eax, word [regd1]
        neg eax
        jmp short .21
.20:
        movsx eax, word [regd1]
.21:
        sub eax, 164h
        xor eax, edx
        test eax, eax
        jl near chk4pass_2F
.22:
        mov ax, word [byte edi+Ypos+2]
        mov word [regd0], ax
        mov ax, word [byte esi+Ypos+2]
        mov word [regd1], ax
        mov al, byte [byte esi+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .23
        neg word [regd0]
        neg word [regd1]
.23:
        mov ebx, dword [gameopts]
        test byte [byte ebx+01h], 2
        je short .25
        movsx edx, word [regd1]
        movsx eax, word [regd0]
        sub edx, byte 74h
        sub eax, byte 74h
        xor eax, edx
        test eax, eax
        jge short .25
        mov edx, edi
        mov eax, esi
        call PassLaneChk
        mov byte [byte esi+passlane], al
        test al, al
        jne short .26
.24:
        xor ah, ah
        jmp near chk4pass_4F6
.25:
        movsx eax, word [regd0]
        cmp eax, byte 74h
        jg short .27
        mov ax, word [regd1]
        sub word [regd0], ax
        movsx eax, word [regd0]
        cmp eax, byte 0FFFFFFF1h
        jge short .27
        mov edx, edi
        mov eax, esi
        call PassLaneChk
        mov byte [byte esi+passlane], al
        test al, al
        je short .24
.26:
        mov ax, word [dword edi+SCnum]
        mov word [byte esi+048h], ax
.27:
        mov ebx, dword [gameopts]
        test byte [byte ebx+01h], 4
        je short .28
        mov al, byte [byte edi+pflags2]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .28
        movsx eax, word [regd1]
        cmp eax, byte 0FFFFFF8Ch
        jge short .28
        cmp word [regd0], byte 0
        jg near chk4pass_2F
.28:
        mov al, byte [byte edi+puckdir]
        xor al, 4
        cbw
        mov word [passdir], ax
        movsx eax, word [byte edi+puckdist]
        mov dword [regd2], eax
        movsx eax, word [dword esi+SCnum]
        cmp eax, byte 6
        jge short .29
        mov eax, 6
        jmp short .30
.29:
        xor eax, eax
.30:
        imul eax, dword 0A0h
        mov edi, SortCords
        mov word [regd3], 6
        add edi, eax
.31:
        movsx eax, word [byte edi+puckdist]
        mov dword [byte ebp-08h], eax
        mov al, byte [byte edi+puckdir]
        xor al, 4
        cbw
        mov dword [byte ebp-04h], eax
        mov ax, word [passdir]
        sub eax, dword [byte ebp-04h]
        inc eax
        xor ah, ah
        and al, 7
        movsx edx, word [byte edi+facedir]
        mov dword [byte ebp-04h], eax
        movsx eax, byte [byte edi+puckdir]
        sub edx, eax
        lea eax, [byte edx+01h]
        and eax, byte 7
        cmp eax, byte 2
        jg short .32
        movsx eax, byte [byte edi+0Fh]
        push eax
        movsx eax, byte [byte edi+0Dh]
        push eax
        call vecdist
        add esp, byte 8
        sub dword [byte ebp-08h], eax
.32:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [regd2]
        jg near .38
        movsx eax, word [byte ebp-04h]
        cmp eax, byte 1
        je near chk4pass_2F
        mov ebx, dword [pucky]
        cmp word [ebx], byte 0
        jge short .33
        movsx eax, word [ebx]
        neg eax
        jmp short .34
.33:
        movsx eax, word [ebx]
.34:
        cmp eax, byte 74h
        jle short .35
        mov al, byte [byte esi+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        mov ebx, dword [pucky]
        movzx edx, al
        cmp word [ebx], byte 0
        setg al
        movzx eax, al
        xor eax, edx
        je short .35
        movsx eax, word [byte ebp-04h]
        cmp eax, byte 2
        jle near chk4pass_2F
.35:
        cmp word [byte esi+position], byte 0
        jne short .38
        cmp dword [byte ebp-08h], byte 1Eh
        jl near chk4pass_2F
        movsx eax, word [byte ebp-04h]
        cmp eax, byte 2
        jg short .36
        cmp dword [byte ebp-08h], byte 3Ch
        jl near chk4pass_2F
.36:
        movsx eax, word [byte ebp-04h]
        cmp eax, byte 3
        je short .37
        cmp eax, byte 7
        jne short .38
.37:
        cmp dword [byte ebp-08h], byte 28h
        jl near chk4pass_2F
.38:
        add edi, 0A0h
        dec word [regd3]
        jne near .31
        mov eax, esi
        call dopass
        cmp word [byte esi+position], byte 0
        je near chk4pass_2F
        mov eax, esi
        call assexitjump
chk4pass_4F1:
        mov eax, 1
chk4pass_4F6:
        leave
chk4pass_4F7:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetPassDirection                                4137F  96 PC, low confidence
; Stores the pass direction from the player's facing
;-----------------------------------------------------------------------------
SetPassDirection:
        mov ax, word [byte eax+036h]
        xor ah, ah
        and al, 7
        or byte [sflags], 8
        jmp near setpassmode_F
