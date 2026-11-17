; Referee: moving to the dot, following play, whistle, signals and the drop.
bits 32
%include "hockey.inc"
section s_35149 progbits alloc exec nowrite align=1
extern AssRefGoalData, AssRefGoalTeam, awscore, awtmstruct, clockticks, DemoMode, dirtab, dirtab_y
extern doplayeracc, EvadePlayers, fox, foy, gameclock, GameLoopActive, gameopts, gmode
extern gmode2, goalevent, GoalSignalState, gsp, hmscore, hmtmstruct, injurystop, joysampling
extern ovltimer, PenBuf, PenShotAssign, penshotmode, PerTimeTotal, PlayArenaClip, PlaySfxOr, PostGoalEvent
extern PtrPuckFlags, PtrRefObject, puckc, PuckInNet, puckvx, puckvy, puckvz, puckx
extern pucky, puckz, randomd0, refsigdir, RefSignalAnims, RefStep, regd0, regd1
extern regd2, SetExitGame, SetSPA, skateto, SortCords, StoppageReason, SwapPosition_91, vtoa
extern yc1
global assrefatdot, assreffollow, SkateToSpot, CrowdOnStoppage, assrefwhistle, assrefsignal, assrefgoalpa, assrefgoalpa_839
global assrefgoalpa_83E, assrefgoalpa_83F, assrefdrop, rtss, assrefgoalline
;-----------------------------------------------------------------------------
; assrefatdot                                                     35149  95 PC
; Asstab 1Eh (StartHL2, puckfaceoff2): while play is stopped (injurystop 0,
; clock running) holds the referee at the faceoff spot fox/C90B4 offset +-0Fh.
;
; facing 2/6
;-----------------------------------------------------------------------------
assrefatdot:
        push ebx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .8
        cmp word [byte ebx+038h], byte 0
        jne short .1
        movsx eax, word [byte ebx+012h]
        cmp eax, byte 0FFFFFFFFh
        jne short .1
        mov edx, 7A7h
        mov eax, ebx
        call SetSPA
.1:
        cmp word [injurystop], byte 0
        jne near .8
        cmp word [gameclock], byte 0
        jne short .2
        cmp word [clockticks], byte 0
        je near .8
.2:
        mov al, byte [byte ebx+044h]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .5
        and byte [byte ebx+044h], 0FDh
        cmp word [foy], byte 0
        jg short .3
        mov eax, 2
        jmp short .4
.3:
        mov eax, 6
.4:
        mov edx, 7A7h
        mov word [byte ebx+036h], ax
        mov eax, ebx
        call SetSPA
        mov dword [byte ebx+076h], 0
        and byte [byte ebx+044h], 0FBh
        and byte [byte ebx+045h], 0DFh
.5:
        mov ax, word [gmode2]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        jne short .8
        cmp word [foy], byte 0
        jg short .6
        movsx eax, word [foy]
        sub eax, byte 0Fh
        jmp short .7
.6:
        movsx eax, word [foy]
        add eax, byte 0Fh
.7:
        mov word [byte ebx+02h], ax
        mov ax, word [fox]
        mov word [byte ebx+0Eh], 0
        mov word [byte ebx+06h], ax
        mov ax, word [byte ebx+0Eh]
        mov word [byte ebx+0Ch], ax
.8:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assreffollow                                                    35232  95 PC
; Asstab 1Fh (StartHL2, Endfaceoff, Goal): picks a spot by puck zone (x
; +-46h/78h/90h, y +-0EDh/0E8h or camy) and skates the referee there.
;
; idles (doplayeracc 8) when the clock is stopped
;-----------------------------------------------------------------------------
assreffollow:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov eax, dword [puckc]
        movsx eax, byte [eax]
        imul eax, dword 0A0h
        mov ecx, SortCords
        add ecx, eax
        mov al, byte [byte ebx+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .37
        cmp word [gameclock], byte 0
        jne short .1
        cmp word [clockticks], byte 0
        jne short .1
        mov edx, 8
        mov eax, ebx
        call doplayeracc
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        mov al, byte [byte ebx+044h]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .2
        mov edx, 763h
        mov eax, ebx
        and byte [byte ebx+044h], 0FDh
        call SetSPA
.2:
        mov eax, dword [PtrPuckFlags]
        mov al, byte [byte eax+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        je short .9
        cmp word [byte ebx+02h], byte 0
        jge short .3
        mov eax, 0FFFFFF56h
        jmp short .4
.3:
        mov eax, 0AAh
.4:
        mov word [byte ebx+02Ah], ax
        cmp word [yc1], byte 0
        jge short .5
        movsx eax, word [yc1]
        neg eax
        jmp short .6
.5:
        movsx eax, word [yc1]
.6:
        cmp eax, byte 74h
        jle short .7
        mov word [byte ebx+02Ch], 0
        jmp near .30
.7:
        mov ax, word [byte ebx+06h]
        cmp ax, word [yc1]
        jle short .8
        mov eax, 0B0h
        jmp near .29
.8:
        mov eax, 0FFFFFF50h
        jmp near .29
.9:
        mov eax, dword [puckx]
        cmp word [eax], byte 0
        jge short .10
        movsx eax, word [eax]
        neg eax
        jmp short .11
.10:
        movsx eax, word [eax]
.11:
        cmp eax, byte 32h
        jge near .19
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .12
        movsx eax, word [eax]
        neg eax
        jmp short .13
.12:
        movsx eax, word [eax]
.13:
        cmp eax, 128h
        jle short .19
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .14
        movsx eax, word [eax]
        neg eax
        jmp short .15
.14:
        movsx eax, word [eax]
.15:
        cmp eax, 164h
        jge short .19
        cmp word [byte ebx+02h], byte 0
        jle short .16
        mov eax, 55h
        jmp short .17
.16:
        mov eax, 0FFFFFFABh
.17:
        mov word [byte ebx+02Ah], ax
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jle short .18
        mov eax, 17Dh
        jmp near .29
.18:
        mov eax, 0FFFFFE83h
        jmp near .29
.19:
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .20
        movsx eax, word [eax]
        neg eax
        jmp short .21
.20:
        movsx eax, word [eax]
.21:
        cmp eax, 88h
        jle short .26
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .22
        mov al, byte [byte ecx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx ecx, al
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        setl al
        movzx eax, al
        xor ecx, eax
        je short .26
.22:
        cmp word [byte ebx+02h], byte 0
        jle short .23
        mov eax, 71h
        jmp short .24
.23:
        mov eax, 0FFFFFF8Fh
.24:
        mov word [byte ebx+02Ah], ax
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jle short .25
        mov eax, 164h
        jmp short .29
.25:
        mov eax, 0FFFFFE9Ch
        jmp short .29
.26:
        cmp word [byte ebx+02h], byte 0
        jle short .27
        mov eax, 7Fh
        jmp short .28
.27:
        mov eax, 0FFFFFF81h
.28:
        mov word [byte ebx+02Ah], ax
        mov ecx, dword [puckvy]
        mov eax, dword [pucky]
        movsx ecx, word [ecx]
        movsx eax, word [eax]
        sar ecx, 9
        sub eax, ecx
.29:
        mov word [byte ebx+02Ch], ax
.30:
        mov ax, word [byte ebx+02Ah]
        mov word [regd0], ax
        mov ax, word [byte ebx+02Ch]
        mov word [regd1], ax
        movsx ecx, word [regd0]
        movsx eax, word [byte ebx+02h]
        sub eax, ecx
        test eax, eax
        jge short .31
        neg eax
.31:
        cmp eax, byte 28h
        jge short .34
        cmp word [regd0], byte 0
        jge short .32
        movsx eax, word [regd0]
        neg eax
        jmp short .33
.32:
        movsx eax, word [regd0]
.33:
        cmp eax, byte 7Fh
        jge short .34
        mov ax, word [byte ebx+02h]
        mov word [regd0], ax
.34:
        movsx ecx, word [regd1]
        movsx eax, word [byte ebx+06h]
        sub eax, ecx
        test eax, eax
        jge short .35
        neg eax
.35:
        cmp eax, byte 28h
        jge short .36
        mov ax, word [byte ebx+06h]
        mov word [regd1], ax
.36:
        mov edx, EvadePlayers
        mov eax, ebx
        call skateto
.37:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SkateToSpot                                                     354D0  95 PC
; Player eax skates to regd0/regd1; within 8 in x and y it snaps there and
; stops (Xvel/Yvel 0), else skateto with SetSPA / vtoa facing.
;
; used by the PC scripted assignments
;-----------------------------------------------------------------------------
SkateToSpot:
        push ebx
        push ecx
        push esi
        push edi
        enter 1Ch, 0
        mov ebx, eax
        mov cx, word [regd0]
        sub cx, word [byte eax+02h]
        test cx, cx
        jge short .1
        movsx eax, cx
        neg eax
        jmp short .2
.1:
        movsx eax, cx
.2:
        mov si, word [regd1]
        sub si, word [byte ebx+06h]
        mov dword [byte ebp-010h], eax
        test si, si
        jge short .3
        movsx eax, si
        neg eax
        jmp short .4
.3:
        movsx eax, si
.4:
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte ebp-010h]
        cmp eax, byte 8
        jge short .5
        movsx eax, word [byte ebp-04h]
        cmp eax, byte 8
        jge short .5
        mov word [byte ebx+0Eh], 0
        mov ax, word [byte ebx+0Eh]
        mov word [byte ebx+0Ch], ax
        mov ax, word [regd0]
        mov word [byte ebx+02h], ax
        mov ax, word [regd1]
        mov word [byte ebx+06h], ax
        jmp near SwapPosition_91
.5:
        cmp word [byte ebx+02h], byte 0
        jge short .6
        movsx eax, word [byte ebx+02h]
        neg eax
        jmp short .7
.6:
        movsx eax, word [byte ebx+02h]
.7:
        mov edi, eax
        cmp word [byte ebx+06h], byte 0
        jge short .8
        movsx eax, word [byte ebx+06h]
        neg eax
        jmp short .9
.8:
        movsx eax, word [byte ebx+06h]
.9:
        mov dword [byte ebp-014h], eax
        cmp word [regd1], byte 0
        jge short .10
        movsx eax, word [regd1]
        mov dword [byte ebp-018h], eax
        neg dword [byte ebp-018h]
        jmp short .11
.10:
        movsx eax, word [regd1]
        mov dword [byte ebp-018h], eax
.11:
        mov eax, dword [byte ebp-018h]
        mov dword [byte ebp-0Ch], eax
        movsx eax, di
        cmp eax, byte 1Eh
        jg near .20
        movsx eax, word [byte ebp-014h]
        cmp eax, 16Eh
        jl near .20
        movsx eax, word [byte ebp-0Ch]
        cmp eax, 16Eh
        jge near .20
        cmp word [byte ebx+06h], byte 0
        jge short .12
        mov eax, 0FFFFFE88h
        jmp short .13
.12:
        mov eax, 178h
.13:
        mov word [regd1], ax
        cmp word [regd0], byte 0
        jge short .14
        mov eax, 0FFFFFFD8h
        jmp short .15
.14:
        mov eax, 28h
.15:
        mov word [regd0], ax
        cmp word [byte ebx+0Eh], byte 0
        setg al
        movzx edi, al
        cmp word [byte ebx+06h], byte 0
        setg al
        movzx eax, al
        xor eax, edi
        je short .16
        mov word [byte ebx+0Eh], 0
.16:
        mov cx, word [regd0]
        sub cx, word [byte ebx+02h]
        test cx, cx
        jge short .17
        movsx eax, cx
        neg eax
        jmp short .18
.17:
        movsx eax, cx
.18:
        mov si, word [regd1]
        sub si, word [byte ebx+06h]
        mov dword [byte ebp-010h], eax
        test si, si
        jge short .19
        movsx eax, si
        neg eax
        jmp near .31
.19:
        movsx eax, si
        jmp near .31
.20:
        movsx eax, di
        cmp eax, byte 10h
        jl near .32
        cmp eax, byte 1Eh
        jg near .32
        movsx eax, word [byte ebp-014h]
        cmp eax, 164h
        jl near .32
        movsx eax, word [byte ebx+06h]
        mov dword [byte ebp-01Ch], eax
        movsx eax, word [regd1]
        xor eax, dword [byte ebp-01Ch]
        test eax, eax
        jl near .32
        movsx eax, word [byte ebp-0Ch]
        cmp eax, 164h
        jge near .32
        cmp eax, 15Ch
        jle near .32
        cmp word [regd0], byte 0
        jge short .21
        movsx eax, word [regd0]
        neg eax
        jmp short .22
.21:
        movsx eax, word [regd0]
.22:
        cmp eax, byte 14h
        jge near .32
        cmp word [byte ebx+06h], byte 0
        jge short .23
        mov eax, 0FFFFFEA8h
        jmp short .24
.23:
        mov eax, 158h
.24:
        mov word [regd1], ax
        cmp word [byte ebx+02h], byte 0
        jge short .25
        mov eax, 0FFFFFFD8h
        jmp short .26
.25:
        mov eax, 28h
.26:
        mov word [regd0], ax
        cmp word [byte ebx+0Ch], byte 0
        setg al
        movzx edi, al
        cmp word [byte ebx+02h], byte 0
        setg al
        movzx eax, al
        xor eax, edi
        je short .27
        mov word [byte ebx+0Ch], 0
.27:
        mov cx, word [regd0]
        sub cx, word [byte ebx+02h]
        test cx, cx
        jge short .28
        movsx eax, cx
        neg eax
        jmp short .29
.28:
        movsx eax, cx
.29:
        mov si, word [regd1]
        sub si, word [byte ebx+06h]
        mov dword [byte ebp-010h], eax
        test si, si
        jge short .30
        movsx eax, si
        neg eax
        jmp short .31
.30:
        movsx eax, si
.31:
        mov dword [byte ebp-04h], eax
.32:
        mov eax, ebx
        call skateto
        movsx eax, word [byte ebp-010h]
        cmp eax, byte 19h
        jge near .38
        movsx eax, word [byte ebp-04h]
        cmp eax, byte 19h
        jge short .38
        cmp word [byte ebx+0Ch], byte 0
        jge short .33
        movsx eax, word [byte ebx+0Ch]
        neg eax
        jmp short .34
.33:
        movsx eax, word [byte ebx+0Ch]
.34:
        cmp eax, 9C4h
        jle short .35
        movsx edi, word [byte ebx+0Ch]
        mov eax, edi
        cdq
        shl edx, 2
        LD sbb, eax, edx
        sar eax, 2
        sub edi, eax
        mov word [byte ebx+0Ch], di
.35:
        cmp word [byte ebx+0Eh], byte 0
        jge short .36
        movsx eax, word [byte ebx+0Eh]
        neg eax
        jmp short .37
.36:
        movsx eax, word [byte ebx+0Eh]
.37:
        cmp eax, 9C4h
        jle short .38
        movsx edi, word [byte ebx+0Eh]
        mov eax, edi
        cdq
        shl edx, 2
        LD sbb, eax, edx
        sar eax, 2
        sub edi, eax
        mov word [byte ebx+0Eh], di
.38:
        movsx eax, word [dword ebx+086h]
        cmp eax, byte 10h
        jne short .39
        mov edi, 763h
        mov dword [byte ebp-08h], 751h
        jmp short .42
.39:
        cmp word [byte ebx+01Ah], byte 0
        jne short .40
        mov edi, 5E3h
        mov dword [byte ebp-08h], 679h
        jmp short .42
.40:
        mov al, byte [byte ebx+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        je short .41
        mov edi, 467h
        mov dword [byte ebp-08h], 455h
        jmp short .42
.41:
        mov edi, 1
        mov dword [byte ebp-08h], 9
.42:
        movsx eax, word [byte ebp-010h]
        cmp eax, byte 8
        jl short .50
        cmp word [byte ebx+0Ch], byte 0
        jge short .43
        movsx eax, word [byte ebx+0Ch]
        neg eax
        jmp short .44
.43:
        movsx eax, word [byte ebx+0Ch]
.44:
        cmp eax, 640h
        jge short .50
        cmp word [byte ebx+0Ch], byte 0
        jne short .45
        cmp di, word [byte ebx+038h]
        jne short .45
        movsx edx, word [byte ebp-08h]
        jmp short .46
.45:
        cmp word [byte ebx+038h], byte 0
        jne short .47
        movsx edx, di
.46:
        mov eax, ebx
        call SetSPA
.47:
        test cx, cx
        jle short .48
        mov eax, 640h
        jmp short .49
.48:
        mov eax, 0FFFFF9C0h
.49:
        mov word [byte ebx+0Ch], ax
.50:
        movsx eax, word [byte ebp-04h]
        cmp eax, byte 8
        jl short .58
        cmp word [byte ebx+0Eh], byte 0
        jge short .51
        movsx eax, word [byte ebx+0Eh]
        neg eax
        jmp short .52
.51:
        movsx eax, word [byte ebx+0Eh]
.52:
        cmp eax, 640h
        jge short .58
        cmp word [byte ebx+0Eh], byte 0
        jne short .53
        cmp di, word [byte ebx+038h]
        jne short .53
        movsx edx, word [byte ebp-08h]
        jmp short .54
.53:
        cmp word [byte ebx+038h], byte 0
        jne short .55
        movsx edx, di
.54:
        mov eax, ebx
        call SetSPA
.55:
        test si, si
        jle short .56
        mov eax, 640h
        jmp short .57
.56:
        mov eax, 0FFFFF9C0h
.57:
        mov word [byte ebx+0Eh], ax
.58:
        mov ax, word [regd1]
        sub ax, word [byte ebx+06h]
        movsx edx, ax
        mov ax, word [regd0]
        sub ax, word [byte ebx+02h]
        cwde
        call vtoa
        sub ax, word [byte ebx+036h]
        xor ah, ah
        and al, 7
        cwde
        lea edx, [byte eax+01h]
        and edx, byte 7
        cmp edx, byte 2
        jle near SwapPosition_91
        cmp byte [byte ebx+029h], 0
        jne near SwapPosition_91
        cmp eax, byte 5
        jge short .59
        mov eax, 1
        jmp short .60
.59:
        mov eax, 0FFFFFFFFh
.60:
        movsx edx, word [byte ebx+036h]
        add eax, edx
        and eax, byte 7
        mov word [byte ebx+036h], ax
        jmp near SwapPosition_91
;-----------------------------------------------------------------------------
; CrowdOnStoppage                                                 35951  95 PC
; On a whistle (ovltimer -1, not replay) picks crowd/music reactions by RefPen
; and clock: PlayCrowdSample 2 late in the period, 5 at period end.
;
; team music when musicon and gameopts+1 bit 0
;-----------------------------------------------------------------------------
CrowdOnStoppage:
        push ebx
        push ecx
        push edx
        movsx eax, word [StoppageReason]
        cmp eax, byte 1Dh
        je short .1
        cmp eax, byte 1Eh
        je short .1
        cmp eax, byte 3
        je short .1
        cmp eax, byte 4
        je short .1
        cmp eax, byte 8
        je short .1
        cmp eax, byte 6
        jne near .9
.1:
        movsx ebx, word [gameclock]
        mov eax, ebx
        mov ecx, 3Ch
        cdq
        idiv ecx
        test eax, eax
        jne short .2
        mov eax, ebx
        cdq
        idiv ecx
        cmp edx, byte 14h
        jl near .9
.2:
        mov eax, 40h
        call randomd0
        test ax, ax
        jne short .3
        mov eax, 46h
        xor edx, edx
        call PlaySfxOr
        pop edx
        pop ecx
        pop ebx
        ret
.3:
        mov eax, dword [gameopts]
        test byte [byte eax+02h], 8
        jne near .9
        mov eax, 52h
        call randomd0
        cwde
        cmp eax, byte 3Dh
        jg near .9
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        and eax, 1F000h
        cmp eax, 14000h
        jne short .4
        mov eax, 64h
        call randomd0
        cwde
        cmp eax, byte 19h
        jge short .4
        mov eax, 0A8h
        jmp near .8
.4:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        and eax, 1F000h
        cmp eax, 13000h
        jne short .5
        mov eax, 64h
        call randomd0
        cwde
        cmp eax, byte 19h
        jge short .5
        mov eax, 0A9h
        jmp short .8
.5:
        cmp dword [DemoMode], byte 0
        je short .7
        mov eax, 0Ah
        call randomd0
        cwde
        cmp eax, byte 8
        jge short .7
.6:
        mov eax, 5
        call randomd0
        cwde
        add eax, 0AAh
        jmp short .8
.7:
        mov eax, 64h
        call randomd0
        cwde
        cmp eax, byte 0Eh
        jl short .6
        mov eax, 29h
        call randomd0
        cwde
        add eax, byte 7Fh
.8:
        call PlayArenaClip
.9:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assrefwhistle                                                   35A8D  95 PC
; Asstab 24h: on a stoppage (clock 0, or period-3 tie broken) sets RefStep
; -1, ovltimer 258h, puck to assignment 1Bh and the referee to 1Eh
;-----------------------------------------------------------------------------
assrefwhistle:
        push ebx
        push ecx
        push edx
        enter 4, 0
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .15
        mov al, byte [byte ebx+044h]
        and al, 2
        movzx eax, al
        test eax, eax
        je near .8
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        test eax, eax
        je short .1
        and byte [byte ebx+044h], 0FDh
        jmp near .8
.1:
        cmp word [injurystop], byte 0
        jne short .3
        cmp word [gameclock], byte 0
        jne short .2
        cmp word [clockticks], byte 0
        je short .3
.2:
        movsx eax, word [gsp]
        cmp eax, byte 3
        jne short .6
        mov ax, word [hmscore]
        cmp ax, word [awscore]
        je short .6
.3:
        movsx eax, word [ovltimer]
        mov word [RefStep], 0FFFFh
        cmp eax, byte 0FFFFFFFFh
        jl near .15
        cmp eax, 100h
        jne short .4
        mov word [ovltimer], 258h
.4:
        mov eax, dword [PtrPuckFlags]
        mov word [byte ebp-04h], 1Bh
        movsx edx, word [byte eax+01Ch]
        mov cl, byte [byte ebp-04h]
        mov byte [byte edx+eax+01Eh], cl
        or byte [byte eax+044h], 2
        movsx eax, word [byte ebx+01Ch]
        mov edx, 1Eh
.5:
        mov byte [byte ebx+eax+01Eh], dl
        or byte [byte ebx+044h], 2
        leave
        pop edx
        pop ecx
        pop ebx
        ret
.6:
        mov word [RefStep], 1
        and byte [byte ebx+044h], 0FDh
        cmp dword [byte ebx+076h], byte 0
        jne short .7
        call PenShotAssign
        call CrowdOnStoppage
.7:
        mov word [byte ebx+028h], 8
        mov word [byte ebx+02Ch], 0
        mov word [byte ebx+02Ah], 0AAh
        mov word [byte ebx+026h], 0
        mov word [byte ebx+030h], 0
        mov edx, 763h
        mov word [byte ebx+032h], 0
        mov eax, ebx
        or byte [byte ebx+045h], 20h
        call SetSPA
        movsx eax, word [ovltimer]
        cmp eax, 100h
        jne short .8
        mov word [ovltimer], 258h
.8:
        mov ax, word [byte ebx+06h]
        sub ax, word [byte ebx+02Ch]
        mov word [regd0], ax
        test ax, ax
        jge short .9
        cwde
        neg eax
        jmp short .10
.9:
        cwde
.10:
        cmp eax, byte 6
        jg near .14
        mov ax, word [byte ebx+02h]
        sub ax, word [byte ebx+02Ah]
        mov word [regd0], ax
        cwde
        cmp eax, byte 0FFFFFFF6h
        jl near .14
        dec word [byte ebx+026h]
        cmp word [byte ebx+026h], byte 0
        jge near .15
        mov edx, 763h
        mov eax, ebx
        add word [byte ebx+026h], byte 8
        call SetSPA
        mov dword [regd2], 2
        mov ax, word [regd2]
        cmp ax, word [byte ebx+036h]
        je short .13
        sub ax, word [byte ebx+036h]
        xor ah, ah
        and al, 7
        mov word [regd2], ax
        cwde
        cmp eax, byte 5
        jge short .11
        mov eax, 1
        jmp short .12
.11:
        mov eax, 0FFFFFFFFh
.12:
        movsx edx, word [byte ebx+036h]
        add eax, edx
        and eax, byte 7
        mov word [byte ebx+036h], ax
.13:
        mov word [byte ebx+0Eh], 0
        mov word [byte ebx+0Ch], 0
        mov ax, word [regd2]
        cmp ax, word [byte ebx+036h]
        jne short .15
        mov edx, 7EDh
        mov eax, ebx
        or byte [byte ebx+044h], 20h
        call SetSPA
        movsx eax, word [byte ebx+01Ch]
        mov edx, 22h
        jmp near .5
.14:
        mov ax, word [byte ebx+02Ah]
        mov word [regd0], ax
        mov ax, word [byte ebx+02Ch]
        xor edx, edx
        mov word [regd1], ax
        mov eax, ebx
        call SkateToSpot
.15:
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assrefsignal                                                    35CBC  95 PC
; Asstab 20h: skates to x 0A0h,y 0 (the timekeeper side), plays 0A5Bh; when
; RefPen is 7 (goal) posts PostGoalEvent with scorer/assists and period time.
;
; Then assreplace 21h
;-----------------------------------------------------------------------------
assrefsignal:
        push ebx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .11
        mov al, byte [byte ebx+044h]
        and al, 2
        movzx eax, al
        test eax, eax
        je near .4
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        test eax, eax
        je short .1
        movsx eax, word [StoppageReason]
        cmp eax, byte 2
        jne short .1
        call SetExitGame
        pop edx
        pop ebx
        ret
.1:
        and byte [byte ebx+044h], 0FDh
        movsx eax, word [StoppageReason]
        cmp word [nosplit eax*2+refsigdir], byte 0
        jge short .3
.2:
        movsx eax, word [byte ebx+01Ch]
        mov edx, 21h
        mov byte [byte ebx+eax+01Eh], dl
        or byte [byte ebx+044h], 2
        pop edx
        pop ebx
        ret
.3:
        mov word [byte ebx+028h], 8
        mov word [byte ebx+02Ch], 0
        mov word [byte ebx+02Ah], 0AAh
        mov word [byte ebx+026h], 0
        mov word [byte ebx+030h], 0
        mov word [byte ebx+032h], 0
        or byte [byte ebx+045h], 20h
.4:
        mov ax, word [byte ebx+06h]
        sub ax, word [byte ebx+02Ch]
        mov word [regd0], ax
        test ax, ax
        jge short .5
        cwde
        neg eax
        jmp short .6
.5:
        cwde
.6:
        cmp eax, byte 0Ch
        jg near .10
        mov ax, word [byte ebx+02h]
        sub ax, word [byte ebx+02Ah]
        mov word [regd0], ax
        cwde
        cmp eax, byte 0FFFFFFECh
        jl near .10
        dec word [byte ebx+026h]
        cmp word [byte ebx+026h], byte 0
        jge near .11
        mov edx, 763h
        mov eax, ebx
        add word [byte ebx+026h], byte 8
        call SetSPA
        movsx eax, word [StoppageReason]
        mov ax, word [nosplit eax*2+refsigdir]
        mov word [regd2], ax
        cmp ax, word [byte ebx+036h]
        je short .9
        sub ax, word [byte ebx+036h]
        xor ah, ah
        and al, 7
        mov word [regd1], ax
        cwde
        cmp eax, byte 5
        jge short .7
        mov eax, 1
        jmp short .8
.7:
        mov eax, 0FFFFFFFFh
.8:
        movsx edx, word [byte ebx+036h]
        add eax, edx
        and eax, byte 7
        mov word [byte ebx+036h], ax
.9:
        mov word [byte ebx+0Eh], 0
        mov word [byte ebx+0Ch], 0
        mov ax, word [regd2]
        cmp ax, word [byte ebx+036h]
        jne short .11
        or byte [byte ebx+044h], 20h
        movsx eax, word [StoppageReason]
        movsx edx, word [nosplit eax*2+RefSignalAnims]
        mov eax, ebx
        call SetSPA
        jmp near .2
.10:
        mov ax, word [byte ebx+02Ah]
        mov word [regd0], ax
        mov ax, word [byte ebx+02Ch]
        xor edx, edx
        mov word [regd1], ax
        mov eax, ebx
        call SkateToSpot
.11:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assrefgoalpa                                 35E4D  95 PC, medium confidence
; Asstab 21h (assrefsignal, EndPenaltyShot, assrefpenshot): once ovltimer >=
; 0ECh and goalevent == 1.
;
; calls PaGoal with the scorer/assist jerseys (goalevent_b1..E9AD7) and team
; abbrev, then clears E9AD3
;-----------------------------------------------------------------------------
assrefgoalpa:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        je near .7
        movsx eax, word [byte ebx+038h]
        cmp eax, 791h
        jne near assrefgoalpa_83E
        mov ax, word [byte ebx+03Ch]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        jne near .4
        call PuckInNet
        test eax, eax
        jge near .4
        movsx edx, word [byte ebx+036h]
        movsx edx, word [nosplit edx*4+dirtab]
        movsx eax, word [byte ebx+02h]
        sar edx, 5
        add edx, eax
        mov eax, dword [puckx]
        movsx eax, word [eax]
        sub edx, eax
        mov word [regd0], dx
        movsx eax, word [byte ebx+036h]
        movsx eax, word [nosplit eax*4+dirtab_y]
        movsx edx, word [byte ebx+06h]
        sar eax, 5
        add edx, eax
        mov eax, dword [pucky]
        movsx eax, word [eax]
        sub edx, eax
        mov word [regd1], dx
        cmp word [regd0], byte 0
        je short .2
        jle short .1
        dec word [byte ebx+02h]
        jmp short .2
.1:
        inc word [byte ebx+02h]
.2:
        cmp word [regd1], byte 0
        je short .4
        jle short .3
        dec word [byte ebx+06h]
        jmp short .4
.3:
        inc word [byte ebx+06h]
.4:
        movsx eax, word [byte ebx+03Ah]
        cmp eax, byte 6
        jne near assrefgoalpa_83E
        mov eax, dword [puckc]
        mov byte [eax], 10h
        mov eax, dword [puckz]
        mov word [eax], 0FF9Ch
.5:
        movsx eax, word [byte ebx+01Ch]
        mov edx, 22h
.6:
        mov byte [byte ebx+eax+01Eh], dl
        or byte [byte ebx+044h], 2
        jmp near assrefgoalpa_83E
.7:
        cmp word [ovltimer], byte 0
        jl near .8
        movsx eax, word [ovltimer]
        cmp eax, 100h
        jge near .8
        mov edx, 763h
        mov eax, ebx
        call SetSPA
        movsx eax, word [ovltimer]
        cmp eax, 0ECh
        jl near assrefgoalpa_83E
        movsx eax, byte [goalevent]
        cmp eax, byte 1
        jne near assrefgoalpa_83E
        movzx eax, byte [AssRefGoalTeam]
        movzx dx, byte [AssRefGoalData]
        cmp eax, 0FFh
        movsx eax, dx
        cmp eax, 0FFh
        mov ax, word [GameLoopActive]
        mov dword [GameLoopActive], 0
        mov word [joysampling], ax
        cwde
        mov dword [GameLoopActive], eax
        movsx eax, word [gsp]
        mov byte [goalevent], 0FFh
        cmp eax, byte 3
        jl near assrefgoalpa_83E
        mov word [ovltimer], 38h
        jmp near assrefgoalpa_83E
.8:
        cmp byte [PenBuf], 0
        je short .9
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        test eax, eax
        jne short .9
        mov edx, 763h
        mov eax, ebx
        call SetSPA
        mov word [RefStep], 0FFFFh
        jmp near assrefgoalpa_83E
.9:
        mov eax, dword [puckx]
        cmp word [eax], byte 0
        jge short .10
        movsx eax, word [eax]
        neg eax
        jmp short .11
.10:
        movsx eax, word [eax]
.11:
        cmp eax, 0AAh
        jg short .14
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .12
        movsx eax, word [eax]
        neg eax
        jmp short .13
.12:
        movsx eax, word [eax]
.13:
        cmp eax, 19Ah
        jle short .15
.14:
        movsx eax, word [byte ebx+01Ch]
        mov edx, 24h
        jmp near .6
.15:
        mov al, byte [byte ebx+044h]
        and al, 2
        movzx eax, al
        test eax, eax
        je near .21
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        test eax, eax
        je short .16
        and byte [byte ebx+044h], 0FDh
        jmp near .21
.16:
        cmp word [injurystop], byte 0
        jne short .18
        cmp word [gameclock], byte 0
        jne short .17
        cmp word [clockticks], byte 0
        je short .18
.17:
        movsx eax, word [gsp]
        cmp eax, byte 3
        jne short .20
        mov ax, word [hmscore]
        cmp ax, word [awscore]
        je short .20
.18:
        movsx eax, word [ovltimer]
        mov word [RefStep], 0FFFFh
        cmp eax, byte 0FFFFFFFFh
        jl near assrefgoalpa_83E
        cmp eax, 100h
        jne short .19
        mov word [ovltimer], 258h
.19:
        mov eax, dword [PtrPuckFlags]
        mov word [byte ebp-08h], 1Bh
        movsx ecx, word [byte eax+01Ch]
        mov dl, byte [byte ebp-08h]
        mov byte [byte ecx+eax+01Eh], dl
        or byte [byte eax+044h], 2
        movsx eax, word [byte ebx+01Ch]
        mov edx, 1Eh
        jmp near .6
.20:
        mov word [RefStep], 1
        and byte [byte ebx+044h], 0FDh
        call PenShotAssign
        mov dword [byte ebx+076h], 1
        mov word [byte ebx+028h], 8
        mov word [byte ebx+026h], 0
        mov word [byte ebx+02Eh], 0
        mov word [byte ebx+030h], 0
        mov edx, 763h
        mov word [byte ebx+032h], 0
        mov eax, ebx
        or byte [byte ebx+045h], 20h
        call SetSPA
        call CrowdOnStoppage
        movsx eax, word [ovltimer]
        cmp eax, 100h
        jne short .21
        mov word [ovltimer], 258h
.21:
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .22
        mov byte [eax], 0FFh
        mov eax, dword [PtrPuckFlags]
        movsx ecx, word [byte eax+01Ch]
        add ecx, eax
        movsx edx, byte [byte ecx+01Eh]
        cmp edx, byte 18h
        jne short .22
        mov word [byte ebp-04h], 1Ah
        mov dl, byte [byte ebp-04h]
        mov byte [byte ecx+01Eh], dl
        or byte [byte eax+044h], 2
.22:
        movsx eax, word [byte ebx+02Eh]
        cmp eax, 258h
        jle short .23
        mov eax, dword [puckc]
        mov byte [eax], 10h
        mov eax, dword [puckvx]
        mov word [eax], 0
        mov eax, dword [puckvy]
        mov word [eax], 0
        mov eax, dword [puckvz]
        mov word [eax], 0
        mov eax, dword [puckz]
        mov word [eax], 64h
        jmp near .5
.23:
        mov eax, dword [puckx]
        cmp word [eax], byte 0
        jge short .24
        movsx eax, word [eax]
        neg eax
        jmp short .25
.24:
        movsx eax, word [eax]
.25:
        cmp eax, byte 6
        jne near .32
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .26
        movsx eax, word [eax]
        neg eax
        jmp short .27
.26:
        movsx eax, word [eax]
.27:
        cmp eax, 16Ch
        jne short .32
        mov eax, dword [puckx]
        mov ax, word [eax]
        mov word [byte ebx+02Ah], ax
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .28
        mov eax, 0FFFFFEA1h
        jmp short .29
.28:
        mov eax, 15Fh
.29:
        mov word [byte ebx+02Ch], ax
        mov ax, word [byte ebx+02h]
        sub ax, word [byte ebx+02Ah]
        mov word [regd0], ax
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .30
        mov eax, 0FFFFFE96h
        jmp short .31
.30:
        mov eax, 16Ah
.31:
        movsx edx, word [byte ebx+06h]
        sub edx, eax
        jmp near .43
.32:
        mov edx, dword [puckvx]
        mov eax, dword [puckx]
        movsx edx, word [edx]
        movsx eax, word [eax]
        sar edx, 7
        add eax, edx
        mov word [byte ebx+02Ah], ax
        mov edx, dword [puckvy]
        mov eax, dword [pucky]
        movsx edx, word [edx]
        movsx eax, word [eax]
        sar edx, 7
        add eax, edx
        mov word [byte ebx+02Ch], ax
        mov eax, dword [puckvy]
        movsx edx, word [eax]
        mov eax, dword [puckvx]
        movsx eax, word [eax]
        call vtoa
        mov word [regd0], ax
        mov ecx, dword [pucky]
        mov ax, word [byte ebx+06h]
        sub ax, word [ecx]
        mov ecx, dword [puckx]
        movsx edx, ax
        mov ax, word [byte ebx+02h]
        sub ax, word [ecx]
        cwde
        call vtoa
        movsx edx, word [regd0]
        mov word [regd1], ax
        cmp edx, byte 7
        jg short .33
        movsx edx, ax
        cmp edx, byte 7
        jg short .33
        cmp ax, word [regd0]
        jne short .34
.33:
        mov eax, dword [puckx]
        mov ax, word [eax]
        mov word [byte ebx+02Ah], ax
        mov eax, dword [pucky]
        mov ax, word [eax]
        mov word [byte ebx+02Ch], ax
.34:
        mov eax, dword [pucky]
        movsx edi, word [byte ebx+02Ch]
        movsx edx, word [eax]
        lea ecx, [dword edi-0164h]
        lea eax, [dword edx-0164h]
        xor eax, ecx
        test eax, eax
        jge short .38
        movsx eax, word [byte ebx+02Ah]
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [puckx]
        mov ecx, 164h
        mov esi, dword [byte ebp-0Ch]
        movsx eax, word [eax]
        sub ecx, edx
        sub esi, eax
        imul ecx, esi
        mov esi, edi
        sub esi, edx
        je short .35
        mov eax, ecx
        cdq
        idiv esi
        mov ecx, eax
.35:
        mov eax, dword [puckx]
        mov ax, word [eax]
        add ecx, eax
        mov word [regd0], cx
        test cx, cx
        jge short .36
        movsx eax, cx
        neg eax
        jmp short .37
.36:
        movsx eax, cx
.37:
        cmp eax, byte 19h
        jge short .38
        mov eax, dword [puckx]
        mov ax, word [eax]
        mov word [byte ebx+02Ah], ax
        mov eax, dword [pucky]
        mov ax, word [eax]
        mov word [byte ebx+02Ch], ax
.38:
        mov eax, dword [pucky]
        movsx edx, word [byte ebx+02Ch]
        movsx eax, word [eax]
        lea ecx, [dword edx+0164h]
        lea esi, [dword eax+0164h]
        xor ecx, esi
        test ecx, ecx
        jge short .42
        movsx esi, word [byte ebx+02Ah]
        mov dword [byte ebp-0Ch], esi
        mov esi, dword [puckx]
        mov ecx, 0FFFFFE9Ch
        mov edi, dword [byte ebp-0Ch]
        movsx esi, word [esi]
        sub ecx, eax
        sub edi, esi
        imul ecx, edi
        mov esi, edx
        sub esi, eax
        je short .39
        mov eax, ecx
        cdq
        idiv esi
        mov ecx, eax
.39:
        mov eax, dword [puckx]
        mov ax, word [eax]
        add ecx, eax
        mov word [regd0], cx
        test cx, cx
        jge short .40
        movsx eax, cx
        neg eax
        jmp short .41
.40:
        movsx eax, cx
.41:
        cmp eax, byte 19h
        jge short .42
        mov eax, dword [puckx]
        mov ax, word [eax]
        mov word [byte ebx+02Ah], ax
        mov eax, dword [pucky]
        mov ax, word [eax]
        mov word [byte ebx+02Ch], ax
.42:
        mov eax, dword [puckx]
        mov dx, word [byte ebx+02h]
        sub dx, word [eax]
        mov word [regd0], dx
        mov eax, dword [pucky]
        mov dx, word [byte ebx+06h]
        sub dx, word [eax]
.43:
        mov word [regd1], dx
        cmp word [regd0], byte 0
        jge short .44
        movsx eax, word [regd0]
        neg eax
        jmp short .45
.44:
        movsx eax, word [regd0]
.45:
        cmp eax, byte 0Ch
        jg near .65
        cmp word [regd1], byte 0
        jge short .46
        movsx eax, word [regd1]
        neg eax
        jmp short .47
.46:
        movsx eax, word [regd1]
.47:
        cmp eax, byte 0Ch
        jg near .65
        mov eax, dword [puckx]
        cmp word [eax], byte 0
        jge short .48
        movsx eax, word [eax]
        neg eax
        jmp short .49
.48:
        movsx eax, word [eax]
.49:
        cmp eax, byte 6
        jne short .54
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .50
        movsx eax, word [eax]
        neg eax
        jmp short .51
.50:
        movsx eax, word [eax]
.51:
        cmp eax, 16Ch
        jne short .54
        cmp word [byte ebx+06h], byte 0
        jge short .52
        movsx eax, word [byte ebx+06h]
        neg eax
        jmp short .53
.52:
        movsx eax, word [byte ebx+06h]
.53:
        cmp eax, 164h
        jg short .55
.54:
        mov eax, 1
        jmp short .56
.55:
        xor eax, eax
.56:
        test eax, eax
        je near .65
        mov eax, dword [pucky]
        mov ax, word [eax]
        sub ax, word [byte ebx+06h]
        movsx edx, ax
        mov eax, dword [puckx]
        mov ax, word [eax]
        sub ax, word [byte ebx+02h]
        cwde
        call vtoa
        mov word [regd2], ax
        mov ax, word [byte ebx+026h]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .60
        call PuckInNet
        test eax, eax
        jge short .60
        mov dx, word [regd2]
        xor dh, dh
        and dl, 7
        movsx eax, dx
        movsx eax, word [nosplit eax*4+dirtab]
        movsx ecx, word [regd0]
        sar eax, 5
        add ecx, eax
        je short .58
        test ecx, ecx
        jle short .57
        dec word [byte ebx+02h]
        jmp short .58
.57:
        inc word [byte ebx+02h]
.58:
        movsx eax, dx
        movsx eax, word [nosplit eax*4+dirtab_y]
        movsx edx, word [regd1]
        sar eax, 5
        add eax, edx
        je short .60
        test eax, eax
        jle short .59
        dec word [byte ebx+06h]
        jmp short .60
.59:
        inc word [byte ebx+06h]
.60:
        dec word [byte ebx+026h]
        cmp word [byte ebx+026h], byte 0
        jge near assrefgoalpa_83E
        mov edx, 763h
        mov eax, ebx
        add word [byte ebx+026h], byte 8
        call SetSPA
        movsx eax, word [regd2]
        cmp eax, byte 8
        jge short .62
        movsx edx, word [byte ebx+036h]
        sub eax, edx
        inc eax
        and eax, byte 7
        cmp eax, byte 2
        jle short .62
        mov ax, word [regd2]
        sub ax, word [byte ebx+036h]
        xor ah, ah
        and al, 7
        mov word [regd2], ax
        cwde
        cmp eax, byte 5
        jge short .61
        mov eax, 1
        jmp short .64
.61:
        mov eax, 0FFFFFFFFh
        jmp short .64
.62:
        mov word [byte ebx+0Eh], 0
        mov ax, word [byte ebx+0Eh]
        mov word [byte ebx+0Ch], ax
        mov eax, dword [puckvx]
        mov word [eax], 0
        mov eax, dword [puckvy]
        mov word [eax], 0
        mov eax, dword [puckvz]
        mov word [eax], 0
        mov eax, dword [puckz]
        mov word [eax], 0
        movsx eax, word [regd2]
        cmp eax, byte 8
        jge short .63
        mov ax, word [regd2]
        mov word [byte ebx+036h], ax
.63:
        mov edx, 791h
        mov eax, ebx
        or byte [byte ebx+044h], 20h
        call SetSPA
        jmp short assrefgoalpa_83E
.64:
        movsx edx, word [byte ebx+036h]
        add eax, edx
        and eax, byte 7
        mov word [byte ebx+036h], ax
.65:
        mov ax, word [byte ebx+02Ah]
        inc word [byte ebx+02Eh]
        mov word [regd0], ax
        mov ax, word [byte ebx+02Ch]
        xor edx, edx
        mov word [regd1], ax
        mov eax, ebx
assrefgoalpa_839:
        call SkateToSpot
assrefgoalpa_83E:
        leave
assrefgoalpa_83F:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assrefdrop                                   36692  95 PC, medium confidence
; Asstab 22h: in penshotmode switches to 2Ch; else skates to the faceoff spot
; (+-0Fh), puts the puck in hand (puckc 10h, z -64h, v 0)
;-----------------------------------------------------------------------------
assrefdrop:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        cmp dword [penshotmode], byte 0
        je short .2
        movsx eax, word [byte eax+01Ch]
        mov edx, 2Ch
.1:
        mov byte [byte ebx+eax+01Eh], dl
        or byte [byte ebx+044h], 2
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .19
        mov al, byte [byte ebx+044h]
        and al, 2
        movzx eax, al
        test eax, eax
        je near .7
        mov word [byte ebx+028h], 8
        mov word [byte ebx+026h], 0
        and byte [byte ebx+044h], 0FDh
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        test eax, eax
        je short .3
        mov word [byte ebx+02Ah], 0AAh
        mov word [byte ebx+02Ch], 0
        jmp short .6
.3:
        cmp word [foy], byte 0
        jg short .4
        movsx eax, word [foy]
        sub eax, byte 0Fh
        jmp short .5
.4:
        movsx eax, word [foy]
        add eax, byte 0Fh
.5:
        mov word [byte ebx+02Ah], ax
        mov ax, word [fox]
        mov word [byte ebx+02Ch], ax
.6:
        mov word [byte ebx+030h], 0
        mov word [byte ebx+032h], 0
        or byte [byte ebx+045h], 20h
        mov eax, dword [puckc]
        mov byte [eax], 10h
        mov eax, dword [puckvx]
        mov word [eax], 0
        mov eax, dword [puckvy]
        mov word [eax], 0
        mov eax, dword [puckvz]
        mov word [eax], 0
        mov eax, dword [puckz]
        mov edx, 763h
        mov word [eax], 0FF9Ch
        mov eax, ebx
        call SetSPA
.7:
        movsx eax, word [byte ebx+02h]
        movsx edx, word [byte ebx+02Ah]
        sub eax, edx
        imul eax, eax
        movsx ecx, word [byte ebx+06h]
        movsx edx, word [byte ebx+02Ch]
        sub ecx, edx
        mov edx, ecx
        imul edx, ecx
        add eax, edx
        cmp eax, byte 40h
        jge near .18
        cmp word [byte ebx+0Ch], byte 0
        jge short .8
        movsx eax, word [byte ebx+0Ch]
        neg eax
        jmp short .9
.8:
        movsx eax, word [byte ebx+0Ch]
.9:
        cmp eax, byte 10h
        jge near .18
        cmp word [byte ebx+0Eh], byte 0
        jge short .10
        movsx eax, word [byte ebx+0Eh]
        neg eax
        jmp short .11
.10:
        movsx eax, word [byte ebx+0Eh]
.11:
        cmp eax, byte 10h
        jge near .18
        mov ax, word [byte ebx+02Ah]
        dec word [byte ebx+026h]
        mov word [byte ebx+02h], ax
        mov ax, word [byte ebx+02Ch]
        mov word [byte ebx+06h], ax
        cmp word [byte ebx+026h], byte 0
        jge near .19
        mov edx, 763h
        mov eax, ebx
        add word [byte ebx+026h], byte 8
        call SetSPA
        cmp word [foy], byte 0
        jg short .12
        mov eax, 2
        jmp short .13
.12:
        mov eax, 6
.13:
        mov dword [regd2], eax
        mov ax, word [regd2]
        cmp ax, word [byte ebx+036h]
        je short .16
        sub ax, word [byte ebx+036h]
        xor ah, ah
        and al, 7
        mov word [regd2], ax
        cwde
        cmp eax, byte 5
        jge short .14
        mov eax, 1
        jmp short .15
.14:
        mov eax, 0FFFFFFFFh
.15:
        movsx edx, word [byte ebx+036h]
        add eax, edx
        and eax, byte 7
        mov word [byte ebx+036h], ax
        pop edx
        pop ecx
        pop ebx
        ret
.16:
        mov word [byte ebx+0Eh], 0
        mov ax, word [byte ebx+0Eh]
        mov word [byte ebx+0Ch], ax
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        mov word [RefStep], 0FFFFh
        test eax, eax
        je short .17
        mov eax, dword [PtrRefObject]
        cmp word [byte eax+02Eh], byte 0
        jl near .19
        mov eax, ebx
        xor edx, edx
        call SetSPA
        mov dword [byte ebx+07Eh], 0
        mov word [byte ebx+012h], 0FFFFh
        mov word [byte ebx+02h], 0AAh
        mov word [byte ebx+06h], 0
        movsx eax, word [byte ebx+01Ch]
        xor edx, edx
        mov byte [byte ebx+eax+01Eh], dl
        or byte [byte ebx+044h], 2
        mov ebx, dword [PtrPuckFlags]
        mov word [byte ebx+012h], 0FFFFh
        mov ebx, dword [PtrPuckFlags]
        movsx eax, word [byte ebx+01Ch]
        mov edx, 1Ah
        mov byte [byte ebx+eax+01Eh], dl
        or byte [byte ebx+044h], 2
        mov eax, dword [puckc]
        mov byte [eax], 0FFh
        pop edx
        pop ecx
        pop ebx
        ret
.17:
        movsx eax, word [byte ebx+01Ch]
        mov edx, 1Eh
        jmp near .1
.18:
        mov ax, word [byte ebx+02Ah]
        mov word [regd0], ax
        mov ax, word [byte ebx+02Ch]
        xor edx, edx
        mov word [regd1], ax
        mov eax, ebx
        call SkateToSpot
.19:
        pop edx
        pop ecx
        pop ebx
;-----------------------------------------------------------------------------
; rtss                                                36924  94G collide94.asm
; Assignment table slot 0: empty assignment, returns at once
;-----------------------------------------------------------------------------
rtss:
        ret
;-----------------------------------------------------------------------------
; assrefgoalline                                                  36925  95 PC
; Asstab 23h: skates the referee to x +-32h, y +-0E6h (beside the net on the
; puck's end) and holds there
;-----------------------------------------------------------------------------
assrefgoalline:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near assrefgoalpa_83E
        mov al, byte [byte esi+044h]
        and al, 2
        movzx eax, al
        test eax, eax
        je near .17
        mov word [byte esi+028h], 8
        mov word [byte esi+026h], 0
        and byte [byte esi+044h], 0FDh
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jle short .1
        mov eax, 162h
        jmp short .2
.1:
        mov eax, 0FFFFFE9Eh
.2:
        mov word [byte esi+02Ch], ax
        cmp word [byte esi+02h], byte 0
        jle short .3
        mov eax, 38h
        jmp short .4
.3:
        mov eax, 0FFFFFFC8h
.4:
        mov word [byte esi+030h], 0
        mov word [byte esi+032h], 0
        mov word [byte esi+02Ah], ax
        or byte [byte esi+045h], 20h
        mov al, byte [gmode]
        and al, 2
        movsx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov edi, eax
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        setl al
        movzx eax, al
        xor edi, eax
        test edi, edi
        jle short .5
        mov ebx, awtmstruct
        jmp short .6
.5:
        mov ebx, hmtmstruct
.6:
        movsx ecx, word [PerTimeTotal]
        movsx eax, word [gameclock]
        sub ecx, eax
        cmp eax, byte 3Ch
        jge short .7
        cmp word [clockticks], byte 0
        je short .7
        dec ecx
.7:
        mov eax, ecx
        mov dword [byte ebp-04h], 3Ch
        cdq
        idiv dword [byte ebp-04h]
        mov dword [byte ebp-04h], 3Ch
        mov eax, ecx
        push edx
        cdq
        idiv dword [byte ebp-04h]
        push eax
        movsx eax, word [GoalSignalState]
        push eax
        cmp word [byte ebx+036h], byte 0
        jge short .8
        mov eax, 0FFFFFFFFh
        jmp short .9
.8:
        movsx eax, word [byte ebx+036h]
.9:
        mov ecx, eax
        cmp word [byte ebx+034h], byte 0
        jge short .10
        mov eax, 0FFFFFFFFh
        jmp short .11
.10:
        movsx eax, word [byte ebx+034h]
.11:
        movsx edx, word [byte ebx+032h]
        mov ebx, eax
        mov eax, edi
        call PostGoalEvent
        test edi, edi
        je short .12
        mov eax, 0Ah
        jmp short .13
.12:
        mov eax, 14h
.13:
        movsx edx, word [gameclock]
        cmp edx, eax
        jl short .14
        movsx eax, word [gsp]
        cmp eax, byte 3
        jl short .17
.14:
        test edi, edi
        je short .15
        mov eax, 0FFFFFED4h
        jmp short .16
.15:
        mov eax, 0FFFFFD44h
.16:
        mov word [ovltimer], ax
.17:
        mov ax, word [byte esi+06h]
        sub ax, word [byte esi+02Ch]
        mov word [regd0], ax
        test ax, ax
        jge short .18
        cwde
        neg eax
        jmp short .19
.18:
        cwde
.19:
        cmp eax, byte 0Ch
        jg near .31
        cmp word [byte esi+06h], byte 0
        jge short .20
        movsx edx, word [byte esi+06h]
        neg edx
        jmp short .21
.20:
        movsx edx, word [byte esi+06h]
.21:
        cmp word [byte esi+02Ch], byte 0
        jge short .22
        movsx eax, word [byte esi+02Ch]
        neg eax
        jmp short .23
.22:
        movsx eax, word [byte esi+02Ch]
.23:
        cmp edx, eax
        jg near .31
        mov ax, word [byte esi+02h]
        sub ax, word [byte esi+02Ah]
        mov word [regd0], ax
        test ax, ax
        jge short .24
        cwde
        neg eax
        jmp short .25
.24:
        cwde
.25:
        cmp eax, byte 0Ch
        jg near .31
        dec word [byte esi+026h]
        cmp word [byte esi+026h], byte 0
        jge near assrefgoalpa_83E
        mov edx, 763h
        mov eax, esi
        add word [byte esi+026h], byte 8
        call SetSPA
        mov ax, word [byte esi+02Ch]
        sub ax, word [byte esi+06h]
        movsx edx, ax
        mov ax, word [byte esi+02h]
        neg eax
        cwde
        call vtoa
        cwde
        mov dword [regd2], eax
        mov ax, word [regd2]
        cmp ax, word [byte esi+036h]
        je short .28
        sub ax, word [byte esi+036h]
        xor ah, ah
        and al, 7
        mov word [regd2], ax
        cwde
        cmp eax, byte 5
        jge short .26
        mov eax, 1
        jmp short .27
.26:
        mov eax, 0FFFFFFFFh
.27:
        movsx edx, word [byte esi+036h]
        add eax, edx
        and eax, byte 7
        mov word [byte esi+036h], ax
        jmp near assrefgoalpa_83E
.28:
        mov word [byte esi+0Eh], 0
        or byte [byte esi+044h], 20h
        mov ax, word [byte esi+0Eh]
        mov word [byte esi+0Ch], ax
        mov al, byte [gmode]
        and al, 2
        movsx eax, al
        test eax, eax
        sete al
        movzx edx, al
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        setl al
        movzx eax, al
        xor eax, edx
        je short .29
        mov eax, 7F9h
        jmp short .30
.29:
        mov eax, 805h
.30:
        movsx edx, ax
        mov eax, esi
        call SetSPA
        movsx eax, word [byte esi+01Ch]
        mov edx, 20h
        mov byte [byte esi+eax+01Eh], dl
        or byte [byte esi+044h], 2
        jmp near assrefgoalpa_83E
.31:
        mov ax, word [byte esi+02Ah]
        mov word [regd0], ax
        mov ax, word [byte esi+02Ch]
        xor edx, edx
        mov word [regd1], ax
        mov eax, esi
        jmp near assrefgoalpa_839
