; Collisions: player, wall and goal collisions, and the fight check on a hard hit.
bits 32
%include "hockey.inc"
%include "spa.inc"
section s_44B99 progbits alloc exec nowrite align=1
extern AddPenalty, AddPenalty2, assinsert, AwFightFlags, BreakGlass, CanRemovePlayer, checkcheck, checkgoalp
extern checkint, CloseTextOverlay, collflag, Crowdlevel, CrowdReaction, CwdExciteLvl, doplayeracc, EndPenaltyShot
extern FightingOn, GameHitCount, gameopts, GetHot, GiveControl, GlassOn, gmode, gmode2
extern Goal, HmFightFlags, lastimpact, LastShooterTeam, lasttouch, ltack, NearestGlassPoint, nethit
extern onetimerflag, OneTimerPasser, OOlist, OOlistpos, passplayer, PBnum, PlaySfx, PtrPuckFlags
extern puckc, puckflip, puckx, pucky, puckz, randomd0, RefObject, regd0
extern regd1, regd2, regd3, regd4, regd5, RinkB00FirstVert, RinkEdgeKind, SetSPA
extern sflags, sfx, shotongoal, SortCords, vecdist, vtoa, wcradiusx, wcradiusy
extern yc1, Ylist
global checkcoll, checkwallcoll, checkgoal, wallcoll, wallcollb, checkplcoll, SetInst, checkfight_sf
global checkfight, checkcx
;-----------------------------------------------------------------------------
; checkcoll                        44B99  94G collide94.asm, medium confidence
; eax = object: wall collision (checkwallcoll) at the hot spot and the stick end,
; then player collisions (checkplcoll). Called from updateplayers.
;-----------------------------------------------------------------------------
checkcoll:
        push ecx
        push esi
        push edi
        enter 8, 0
        mov ecx, eax
        mov esi, edx
        mov dword [byte ebp-08h], ebx
        mov dword [nethit], 0
        mov byte [collflag], 0
        mov al, byte [byte eax+044h]
        and al, 4
        movzx edx, al
        test edx, edx
        jne near .2
        mov ax, word [dword ecx+082h]
        mov word [wcradiusx], ax
        mov ax, word [dword ecx+084h]
        mov word [wcradiusy], ax
        mov eax, ecx
        movsx ebx, word [byte ecx+06h]
        movsx edx, word [byte ecx+02h]
        call checkwallcoll
        movsx edx, word [byte ecx+030h]
        movsx ebx, word [byte ecx+032h]
        or edx, ebx
        jne short .1
        movsx edx, word [dword ecx+086h]
        cmp edx, byte 0Bh
        jg short .1
        mov eax, ecx
        call GetHot
        mov word [wcradiusx], 1
        mov word [wcradiusy], 1
        mov ax, word [byte ecx+06h]
        add ax, word [regd1]
        movsx ebx, ax
        mov ax, word [byte ecx+02h]
        add ax, word [regd0]
        movsx edx, ax
        mov eax, ecx
        call checkwallcoll
.1:
        movsx ebx, word [byte ebp-08h]
        movsx edx, si
        mov eax, ecx
        call checkplcoll
.2:
        cmp byte [collflag], 0
        je short .4
        movsx edx, word [byte ecx+038h]
        cmp edx, SPAboardback
        jl short .3
        cmp edx, SPAboardfrontglass
        jle near .9
.3:
        mov ax, word [dword ecx+092h]
        mov word [byte ecx+02h], ax
        mov ax, word [dword ecx+096h]
        mov word [byte ecx+06h], ax
        leave
        pop edi
        pop esi
        pop ecx
        ret
.4:
        mov ax, word [dword ecx+086h]
        movsx edx, ax
        movsx esi, ax
        mov di, word [nosplit edx*2+OOlistpos]
.5:
        movsx ecx, di
        cmp ecx, byte 10h
        je short .6
        movsx dx, byte [dword ecx+OOlist+1]
        mov word [byte ebp-04h], dx
        movsx edx, byte [dword ecx+OOlist+1]
        mov ebx, dword [byte ebp-08h]
        cmp bx, word [nosplit edx*2+Ylist]
        jle short .6
        movsx edx, word [byte ebp-04h]
        mov bl, byte [byte ebp-04h]
        inc edi
        mov byte [dword ecx+OOlist+1], al
        inc word [nosplit esi*2+OOlistpos]
        mov byte [dword ecx+OOlist], bl
        dec word [nosplit edx*2+OOlistpos]
        jmp short .5
.6:
        movsx edi, ax
        mov di, word [nosplit edi*2+OOlistpos]
        test di, di
        je short .8
        movsx esi, ax
.7:
        movsx ecx, di
        movsx dx, byte [dword ecx+OOlist-1]
        mov word [byte ebp-04h], dx
        movsx edx, byte [dword ecx+OOlist-1]
        mov ebx, dword [byte ebp-08h]
        cmp bx, word [nosplit edx*2+Ylist]
        jge short .8
        movsx edx, word [byte ebp-04h]
        mov bl, byte [byte ebp-04h]
        mov byte [dword ecx+OOlist-1], al
        dec word [nosplit esi*2+OOlistpos]
        mov byte [dword ecx+OOlist], bl
        inc word [nosplit edx*2+OOlistpos]
        dec di
        jne short .7
.8:
        movsx edx, ax
        mov eax, dword [byte ebp-08h]
        mov word [nosplit edx*2+Ylist], ax
.9:
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; checkwallcoll                    44D62  94G collide94.asm, medium confidence
; Wall collisions: vecdist against the corner radius, wallcollb, checkgoal
;-----------------------------------------------------------------------------
checkwallcoll:
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov esi, eax
        mov dword [byte ebp-0Ch], edx
        mov edi, ebx
        mov eax, 0AAh
        sub ax, word [wcradiusx]
        mov dword [byte ebp-04h], eax
        mov eax, 190h
        sub ax, word [wcradiusy]
        mov dword [byte ebp-08h], eax
        mov eax, 40h
        sub eax, dword [byte ebp-04h]
        mov word [regd4], ax
        mov eax, 40h
        sub eax, dword [byte ebp-08h]
        mov word [regd5], ax
        cmp bx, ax
        jle short .1
        neg word [regd5]
        cmp bx, word [regd5]
        jl near .4
.1:
        mov edx, dword [byte ebp-0Ch]
        cmp dx, word [regd4]
        jl short .2
        neg word [regd4]
        cmp dx, word [regd4]
        jle near .3
.2:
        mov edx, dword [byte ebp-0Ch]
        mov ax, word [regd4]
        sub edx, eax
        mov ax, word [regd5]
        mov word [regd1], dx
        mov edx, edi
        sub edx, eax
        movsx eax, word [regd1]
        push eax
        movsx eax, dx
        push eax
        mov word [regd0], dx
        call vecdist
        neg word [regd1]
        add esp, byte 8
        movsx ebx, ax
        mov word [regd3], ax
        cmp ebx, byte 40h
        jl short .4
        movsx eax, word [regd0]
        shl eax, 8
        cdq
        idiv ebx
        mov word [regd0], ax
        movsx eax, word [regd1]
        shl eax, 8
        cdq
        idiv ebx
        mov word [regd1], ax
        mov eax, esi
        call wallcollb
        jmp short .4
.3:
        movsx ecx, di
        movsx ebx, dx
        cmp ax, word [regd5]
        sete al
        movzx eax, al
        add eax, byte 0Ch
        imul eax, dword 0A0h
        mov edx, SortCords
        add edx, eax
        mov eax, esi
        call checkgoal
.4:
        mov ax, word [byte esi+032h]
        or ax, word [byte esi+030h]
        mov word [regd0], ax
        jne short .6
        mov word [regd0], 100h
        mov word [regd1], ax
        cmp di, word [byte ebp-08h]
        jge short .5
        neg dword [byte ebp-08h]
        mov word [regd0], 0FF00h
        cmp di, word [byte ebp-08h]
        jle short .5
        mov word [regd0], ax
        mov eax, dword [byte ebp-0Ch]
        mov word [regd1], 0FF00h
        cmp ax, word [byte ebp-04h]
        jge short .5
        neg dword [byte ebp-04h]
        mov word [regd1], 100h
        cmp ax, word [byte ebp-04h]
        jg short .6
.5:
        mov eax, esi
        call wallcollb
.6:
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; checkgoal                        44EF5  94G collide94.asm, medium confidence
; Collision with a goal net: checkgoalp for players, Goal for the puck,
; puckflip / sfx on the frame
;-----------------------------------------------------------------------------
checkgoal:
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        mov edi, edx
        mov eax, ecx
        movsx edx, word [byte esi+0Ah]
        cmp edx, byte 10h
        jg near .20
        movsx edx, word [dword esi+086h]
        cmp edx, byte 0Eh
        je short .1
        movsx ecx, cx
        movsx ebx, bx
        mov edx, edi
        mov eax, esi
        call checkgoalp
        leave
        pop edi
        pop esi
        ret
.1:
        sub bx, word [byte edi+02h]
        test bx, bx
        jge short .2
        movsx edx, bx
        neg edx
        jmp short .3
.2:
        movsx edx, bx
.3:
        movsx ecx, word [wcradiusx]
        add ecx, byte 0Ch
        cmp edx, ecx
        jg near .20
        movsx edx, word [dword edi+086h]
        sub ax, word [byte edi+06h]
        cmp edx, byte 0Ch
        jne short .4
        mov edx, 8
        jmp short .5
.4:
        mov edx, 0FFFFFFF8h
.5:
        cwde
        sub eax, edx
        test ax, ax
        jge short .6
        movsx edx, ax
        neg edx
        jmp short .7
.6:
        movsx edx, ax
.7:
        cmp edx, byte 6
        jg near .20
        movsx edx, bx
        imul edx, edx
        mov dword [byte ebp-04h], edx
        movsx edx, ax
        imul edx, edx
        add edx, dword [byte ebp-04h]
        cmp edx, 0E1h
        jg near .20
        mov word [regd4], 0FFF4h
        mov word [regd5], 0FFFAh
        movsx edx, word [dword esi+09Ah]
        cmp edx, byte 10h
        jl short .8
        mov ax, word [dword esi+09Ah]
        mov word [byte esi+0Ah], ax
        cmp word [byte esi+010h], byte 0
        jge near .20
        neg word [byte esi+010h]
        sar word [byte esi+010h], 1
        leave
        pop edi
        pop esi
        ret
.8:
        mov byte [collflag], 0FFh
        and byte [byte esi+044h], 7Fh
        mov edx, dword [puckc]
        cmp byte [edx], 0
        jl short .10
        movsx ecx, byte [edx]
        imul ecx, dword 0A0h
        mov dword [byte ebp-04h], ecx
        mov ecx, SortCords
        add ecx, dword [byte ebp-04h]
        mov byte [edx], 0FFh
        mov word [byte ecx+03Eh], 8
        mov edx, dword [pucky]
        mov dx, word [edx]
        mov word [regd1], dx
        mov dl, byte [byte ecx+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .9
        neg word [regd1]
.9:
        cmp word [regd1], byte 0
        jge short .10
        or byte [byte esi+044h], 80h
.10:
        mov word [regd0], 0FF00h
        mov edx, dword [byte esi+04h]
        sub edx, dword [dword esi+094h]
        sar edx, 8
        mov dword [regd1], edx
        test edx, edx
        je near .18
        jle short .11
        mov word [regd0], 100h
        neg word [regd5]
.11:
        add word [regd5], ax
        mov eax, dword [esi]
        sub eax, dword [dword esi+090h]
        sar eax, 8
        mov dword [regd3], eax
        movsx eax, word [regd5]
        movsx edx, word [regd3]
        imul eax, edx
        movsx ecx, word [regd1]
        cdq
        idiv ecx
        mov dword [regd5], eax
        cmp eax, 10000h
        jae near .18
        sub bx, word [regd5]
        cmp bx, word [regd4]
        jl near .18
        neg word [regd4]
        cmp bx, word [regd4]
        jg near .18
        mov word [regd1], 0
        mov ax, word [byte esi+06h]
        xor ax, word [regd0]
        mov word [regd3], ax
        test ax, ax
        jl near .19
        neg word [regd0]
        mov al, byte [byte esi+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne near .19
        movsx eax, word [byte esi+0Ah]
        cmp eax, byte 10h
        je short .12
        dec word [regd4]
        cmp bx, word [regd4]
        jg short .12
        neg word [regd4]
        cmp bx, word [regd4]
        jl short .12
        mov eax, edi
        call Goal
        leave
        pop edi
        pop esi
        ret
.12:
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        and byte [gmode2], 0EFh
        test eax, eax
        je short .13
        mov eax, 15h
        call PlaySfx
        jmp short .15
.13:
        movsx eax, word [Crowdlevel]
        cmp eax, 4B0h
        jg short .14
        add word [Crowdlevel], 1F4h
        movsx eax, word [Crowdlevel]
        cmp eax, 4B0h
        jle short .14
        mov word [Crowdlevel], 4B0h
.14:
        mov eax, 15h
        add word [CwdExciteLvl], byte 28h
        call PlaySfx
        mov eax, 3
        call sfx
.15:
        movsx eax, word [byte esi+0Eh]
        push eax
        movsx eax, word [byte esi+0Ch]
        push eax
        call vecdist
        mov word [regd0], ax
        cwde
        add esp, byte 8
        cmp eax, 1000h
        jle short .16
        mov word [regd0], 1000h
.16:
        mov ax, word [regd0]
        add eax, eax
        cwde
        call randomd0
        mov dx, word [regd0]
        sub eax, edx
        mov word [byte esi+0Ch], ax
        mov ax, word [regd0]
        add eax, eax
        cwde
        call randomd0
        mov dx, word [regd0]
        sub eax, edx
        mov word [byte esi+010h], ax
        movsx eax, word [regd0]
        call randomd0
        mov word [regd0], ax
        cmp word [byte esi+06h], byte 0
        jl short .17
        neg word [regd0]
.17:
        mov ax, word [regd0]
        mov word [byte esi+0Eh], ax
        mov eax, esi
        call puckflip
        call EndPenaltyShot
        mov dword [OneTimerPasser], 0
        mov dword [onetimerflag], 0
        mov dword [shotongoal], 0
        leave
        pop edi
        pop esi
        ret
.18:
        mov word [regd0], 0
        mov word [regd1], 100h
        mov ax, word [byte esi+02h]
        sub ax, word [dword esi+092h]
        test ax, ax
        jl short .19
        mov word [regd1], 0FF00h
.19:
        mov eax, esi
        mov dword [nethit], 1
        call wallcoll
.20:
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; wallcoll                         452BB  94G collide94.asm, medium confidence
; Bounces off a wall with cos/sin: randomd0, puckflip, sfx; called from
; checkgoalp, checkgoal and wallcollb
;-----------------------------------------------------------------------------
wallcoll:
        push ebx
        push ecx
        push edx
        push esi
        mov edx, eax
        mov ax, word [regd0]
        mov word [byte edx+030h], ax
        mov ax, word [regd1]
        mov word [byte edx+032h], ax
        movsx ebx, word [regd0]
        movsx eax, word [byte edx+0Eh]
        mov esi, ebx
        imul esi, eax
        movsx ecx, word [byte edx+0Ch]
        movsx eax, word [regd1]
        imul ecx, eax
        sub esi, ecx
        sar esi, 8
        movsx ecx, si
        neg ecx
        mov word [regd2], cx
        movsx ecx, word [byte edx+0Ch]
        imul ecx, ebx
        movsx ebx, word [byte edx+0Eh]
        imul eax, ebx
        add eax, ecx
        sar eax, 8
        mov word [regd3], ax
        movsx eax, word [dword edx+086h]
        cmp eax, byte 0Eh
        jne near .15
        mov word [passplayer], 0FFFFh
        and byte [gmode2], 0EFh
        cmp word [regd2], byte 0
        jl short .6
        mov eax, dword [puckc]
        mov dword [nethit], 0
        cmp byte [eax], 0
        jge near .29
        cmp word [byte edx+0Ch], byte 0
        je short .3
        lea eax, [byte edx+0Ch]
        jle short .1
        mov ecx, 1
        jmp short .2
.1:
        mov ecx, 0FFFFFFFFh
.2:
        movsx ebx, word [eax]
        sub ebx, ecx
        mov word [eax], bx
.3:
        cmp word [byte edx+0Eh], byte 0
        je near .29
        lea eax, [byte edx+0Eh]
        jle short .4
        mov ebx, 1
        jmp short .5
.4:
        mov ebx, 0FFFFFFFFh
.5:
        movsx edx, word [eax]
        sub edx, ebx
        mov word [eax], dx
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.6:
        sar word [regd2], 2
        movsx eax, word [regd2]
        mov ebx, eax
        sar ebx, 2
        sub eax, ebx
        mov word [regd2], ax
        cwde
        cmp eax, 0FFFFFC00h
        jg near .10
        mov eax, 800h
        call randomd0
        mov word [byte edx+010h], ax
        mov eax, edx
        neg word [byte edx+010h]
        call puckflip
        cmp dword [nethit], byte 0
        jne short .10
        movsx eax, word [regd2]
        sar eax, 0Ah
        add eax, byte 4
        test ax, ax
        movsx eax, word [byte edx+0Ah]
        cmp eax, dword [RinkB00FirstVert]
        jg short .8
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jge short .10
        mov eax, dword [puckz]
        cmp word [eax], byte 0
        jne short .7
        mov eax, 0Dh
        jmp short .9
.7:
        mov eax, 0Ch
        jmp short .9
.8:
        mov eax, 0Eh
.9:
        call PlaySfx
.10:
        movsx eax, word [regd3]
        sar eax, 6
        cwde
        mov ebx, eax
        sar ebx, 2
        sub eax, ebx
        sub word [regd3], ax
        sar ax, 1
        sub word [regd3], ax
        movsx ecx, word [regd0]
        movsx eax, word [regd3]
        imul ecx, eax
        movsx ebx, word [regd1]
        movsx eax, word [regd2]
        imul eax, ebx
        sub ecx, eax
        sar ecx, 8
        mov word [byte edx+0Ch], cx
        movsx eax, word [regd1]
        movsx ecx, word [regd3]
        imul ecx, eax
        movsx ebx, word [regd0]
        movsx eax, word [regd2]
        imul eax, ebx
        add eax, ecx
        sar eax, 8
        mov word [byte edx+0Eh], ax
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .13
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .11
        movsx eax, word [eax]
        neg eax
        jmp short .12
.11:
        movsx eax, word [eax]
.12:
        cmp eax, 164h
        jle short .14
.13:
        call EndPenaltyShot
.14:
        mov dword [OneTimerPasser], 0
        mov dword [onetimerflag], 0
        mov dword [shotongoal], 0
        jmp near .28
.15:
        movsx eax, word [regd2]
        cmp eax, 3E8h
        jle short .16
        mov dword [nethit], 0
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.16:
        cmp eax, 0FFFFF000h
        jg short .19
        movsx eax, word [byte edx+018h]
        cmp eax, byte 0Ah
        jge short .18
        movsx eax, word [byte edx+038h]
        cmp eax, SPAcheckskate
        jl short .17
        cmp eax, SPAcheckburstr
        jle short .18
.17:
        movsx eax, word [byte edx+038h]
        cmp eax, SPAburst
        jne short .19
.18:
        cmp dword [nethit], byte 0
        jne short .19
        mov eax, 1Ah
        call PlaySfx
.19:
        sar word [regd2], 2
        movsx eax, word [regd2]
        cmp eax, 0FFFFFC7Ch
        jl short .20
        mov word [regd2], 0FC18h
.20:
        movsx ecx, word [regd0]
        movsx eax, word [regd3]
        imul ecx, eax
        movsx ebx, word [regd1]
        movsx eax, word [regd2]
        imul eax, ebx
        sub ecx, eax
        mov eax, ecx
        sar eax, 8
        mov word [byte edx+0Ch], ax
        movsx ecx, word [regd1]
        movsx eax, word [regd3]
        imul ecx, eax
        movsx ebx, word [regd0]
        movsx eax, word [regd2]
        imul eax, ebx
        add eax, ecx
        sar eax, 8
        mov word [byte edx+0Eh], ax
        cmp dword [nethit], byte 0
        je near .28
        movsx eax, word [dword edx+092h]
        cmp eax, byte 0FFFFFFE8h
        jg short .21
        cmp word [byte edx+0Ch], byte 0
        jg short .22
.21:
        movsx eax, word [dword edx+092h]
        cmp eax, byte 18h
        jl short .23
        cmp word [byte edx+0Ch], byte 0
        jge short .23
.22:
        mov word [byte edx+0Ch], 0
        mov ax, word [dword edx+092h]
        mov word [byte edx+02h], ax
.23:
        movsx eax, word [dword edx+096h]
        cmp eax, 174h
        jle short .24
        cmp word [byte edx+0Eh], byte 0
        jl short .27
.24:
        movsx eax, word [dword edx+096h]
        cmp eax, 0FFFFFE8Ch
        jge short .25
        cmp word [byte edx+0Eh], byte 0
        jg short .27
.25:
        movsx eax, word [dword edx+096h]
        cmp eax, 164h
        jge short .26
        cmp word [dword edx+096h], byte 0
        jle short .26
        cmp word [byte edx+0Eh], byte 0
        jg short .27
.26:
        movsx eax, word [dword edx+096h]
        cmp eax, 0FFFFFE9Ch
        jle short .28
        cmp word [dword edx+096h], byte 0
        jge short .28
        cmp word [byte edx+0Eh], byte 0
        jge short .28
.27:
        mov word [byte edx+0Eh], 0
        mov ax, word [dword edx+096h]
        mov word [byte edx+06h], ax
.28:
        mov dword [nethit], 0
        cmp word [byte edx+010h], byte 0
        jle short .29
        mov word [byte edx+010h], 0
.29:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; wallcollb                                           456AF  94G collide94.asm
; Check for the puck over the wall (called from checkwallcoll). Not the puck
; (SCnum 0Eh), or Zpos up to 12h: wallcoll.
;
; Zpos above 1Dh, or above 12h with Ypos below F8h: out of play.
;
; Otherwise only at |Xpos| 28h-38h with Yvel >= FA0h and lty >= 26h (else
; wallcoll): halve Yvel, SPA 821h on the next struct (the glass) at x 3Fh -40h
; (by the puck's side), y 10Bh, sfx AEh.
;
; Crowdlevel +1200 (max 1500) and CwdExciteLvl +15, then out of play.
;
; Out of play: sfslock (sflags bit 6), pfnc (pflags bit 2), attribute bit 15
; when Ypos < 0, the next struct's frame -1 and, while the clock runs, penalty
; 3 for the last player to touch the puck (lasttouch); the penalty shot ends.
;-----------------------------------------------------------------------------
wallcollb:
        push ebx
        push ecx
        push edx
        push esi
        enter 24h, 0
        mov esi, eax
        movsx eax, word [dword eax+086h]
        cmp eax, byte 0Eh
        je short .2
.1:
        mov eax, esi
        call wallcoll
        jmp near .15
.2:
        movsx edx, word [byte esi+06h]
        movsx eax, word [byte esi+02h]
        call RinkEdgeKind
        movsx edx, word [byte esi+0Ah]
        mov ebx, eax
        cmp edx, eax
        jg near .8
        movsx eax, word [byte esi+02h]
        shl eax, 2
        mov dword [byte ebp-0Ch], eax
        movsx eax, word [byte esi+06h]
        shl eax, 2
        lea edx, [byte ebp-018h]
        mov dword [byte ebp-04h], eax
        lea eax, [byte ebp-0Ch]
        call NearestGlassPoint
        cmp byte [GlassOn], 0
        je short .1
        mov eax, dword [byte ebp-04h]
        sub eax, dword [byte ebp-010h]
        test eax, eax
        jge short .3
        neg eax
.3:
        cmp eax, byte 32h
        jg short .1
        mov eax, dword [byte ebp-0Ch]
        sub eax, dword [byte ebp-018h]
        test eax, eax
        jge short .4
        neg eax
.4:
        cmp eax, byte 32h
        jg short .1
        cmp word [byte esi+02h], byte 0
        jge short .7
        cmp word [byte esi+06h], byte 0
        jge short .5
        movsx eax, word [byte esi+06h]
        neg eax
        jmp short .6
.5:
        movsx eax, word [byte esi+06h]
.6:
        cmp eax, byte 74h
        jl near .1
.7:
        lea edx, [byte ebx-08h]
        movsx eax, word [byte esi+0Ah]
        cmp eax, edx
        jle near .1
        movsx eax, word [byte esi+0Eh]
        push eax
        movsx eax, word [byte esi+0Ch]
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, 3A98h
        jb near .1
        mov eax, 3
        sar word [byte esi+0Eh], 2
        call sfx
        movsx eax, word [byte esi+02h]
        shl eax, 2
        mov dword [byte ebp-024h], eax
        movsx eax, word [byte esi+0Ah]
        shl eax, 2
        mov dword [byte ebp-020h], eax
        movsx eax, word [byte esi+06h]
        shl eax, 2
        mov edx, 4
        mov dword [byte ebp-01Ch], eax
        lea eax, [byte ebp-024h]
        call BreakGlass
        mov eax, 24h
        call PlaySfx
        jmp near .12
.8:
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .12
        movsx eax, word [lasttouch]
        imul eax, dword 0A0h
        mov edx, SortCords
        add edx, eax
        cmp word [byte edx+01Ah], byte 0
        jne near .12
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .9
        movsx eax, word [eax]
        neg eax
        jmp short .10
.9:
        movsx eax, word [eax]
.10:
        cmp eax, byte 74h
        jg short .11
        mov eax, dword [puckx]
        cmp word [eax], byte 0
        jle short .12
.11:
        mov eax, dword [gameopts]
        test byte [byte eax+01h], 1
        je short .12
        mov al, byte [byte edx+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        movsx eax, byte [dword eax+PBnum]
        cmp eax, byte 8
        jge short .12
        mov eax, edx
        call CanRemovePlayer
        test eax, eax
        je short .12
        movsx eax, word [lasttouch]
        imul eax, dword 0A0h
        mov edx, 1Fh
        add eax, SortCords
        call AddPenalty
.12:
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne short .13
        movsx eax, word [lasttouch]
        imul eax, dword 0A0h
        mov edx, 3
        add eax, SortCords
        call AddPenalty2
.13:
        or byte [sflags], 40h
        or byte [byte esi+044h], 4
        cmp word [byte esi+06h], byte 0
        jge short .14
        or byte [byte esi+055h], 80h
.14:
        mov word [dword esi+0B2h], 0FFFFh
        call EndPenaltyShot
        mov dword [OneTimerPasser], 0
        mov dword [onetimerflag], 0
        mov dword [shotongoal], 0
.15:
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; checkplcoll                      458E4  94G collide94.asm, medium confidence
; Collisions with the other players: regd2/regd3 = x/y, the player struct;
; walks the sort list
;-----------------------------------------------------------------------------
checkplcoll:
        push ecx
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov dword [byte ebp-08h], edx
        mov dword [byte ebp-04h], ebx
        mov al, byte [byte eax+045h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .5
        movsx eax, word [dword esi+086h]
        cmp eax, byte 0Bh
        jle short .1
        cmp eax, byte 10h
        jne near .5
.1:
        movsx eax, word [dword esi+086h]
        mov di, word [nosplit eax*2+OOlistpos]
.2:
        movsx eax, di
        cmp eax, byte 10h
        je short .3
        movsx dx, byte [dword eax+OOlist+1]
        movsx eax, byte [dword eax+OOlist+1]
        mov ax, word [nosplit eax*2+Ylist]
        sub eax, dword [byte ebp-04h]
        movsx ebx, ax
        cmp ebx, byte 10h
        jg short .3
        movsx ecx, dx
        mov eax, esi
        movsx edx, word [byte ebp-08h]
        inc edi
        call checkcx
        jmp short .2
.3:
        movsx edi, word [dword esi+086h]
        mov di, word [nosplit edi*2+OOlistpos]
        test di, di
        je short .5
.4:
        movsx eax, di
        movsx dx, byte [dword eax+OOlist-1]
        movsx eax, byte [dword eax+OOlist-1]
        mov ebx, dword [byte ebp-04h]
        sub bx, word [nosplit eax*2+Ylist]
        movsx ebx, bx
        cmp ebx, byte 10h
        jg short .5
        movsx ecx, dx
        mov eax, esi
        movsx edx, word [byte ebp-08h]
        call checkcx
        dec di
        jne short .4
.5:
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; SetInst                                                           459B2  93G
; Fight rating test, called twice from checkfight; sets the fight flag (+45h
; bit 0) on both
;-----------------------------------------------------------------------------
SetInst:
        push ecx
        push esi
        mov ecx, eax
        mov esi, ebx
        movzx eax, byte [byte eax+063h]
        cmp eax, byte 7
        je near .3
        movzx ebx, byte [byte edx+063h]
        cmp ebx, byte 7
        je short .3
        cmp eax, byte 7
        jle short .1
        mov ebx, 0Ah
        jmp short .2
.1:
        mov ebx, 0Fh
.2:
        cmp ebx, esi
        jl short .3
        movsx eax, bx
        call randomd0
        cwde
        cmp eax, byte 6
        jl short .3
        mov eax, dword [dword edx+088h]
        movsx esi, byte [byte edx+047h]
        movzx eax, byte [dword esi+eax+0E4h]
        mov esi, 10h
        add eax, eax
        sub esi, eax
        cmp esi, ebx
        jg short .3
        or byte [byte edx+045h], 1
        mov al, byte [byte ecx+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        jne short .3
        mov eax, 7Fh
        or byte [byte ecx+045h], 1
        call CrowdReaction
.3:
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; checkfight_sf                                                     45A31  93G
; Starts the fight for one player: AddPenalty2 20h, assignment 31h, Xvel by
; facing, SetSPA 46Bh
;-----------------------------------------------------------------------------
checkfight_sf:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        mov ax, word [dword edx+086h]
        mov edx, 20h
        mov word [byte ebx+014h], ax
        mov eax, ebx
        call AddPenalty2
        movsx eax, word [dword ebx+086h]
        mov edx, 31h
        call GiveControl
        mov eax, ebx
        call assinsert
        mov eax, dword [puckc]
        movsx ax, byte [eax]
        cmp ax, word [dword ebx+086h]
        jne short .1
        mov word [byte ebx+03Eh], 78h
        mov eax, dword [puckc]
        mov byte [eax], 0FFh
.1:
        movsx eax, word [byte ebx+036h]
        and byte [byte ebx+055h], 0F7h
        cmp eax, byte 2
        jne short .4
        mov word [byte ebx+0Ch], 0FE70h
        movsx eax, word [byte ebx+02h]
        movsx ecx, word [byte ecx+02h]
        sub eax, ecx
        test eax, eax
        jge short .2
        mov ecx, eax
        neg ecx
        jmp short .3
.2:
        mov ecx, eax
.3:
        mov eax, ecx
        cmp ecx, byte 10h
        jge short .6
        mov ecx, 10h
        sub ecx, eax
        imul eax, ecx, byte 64h
        sub word [byte ebx+0Ch], ax
        jmp short .6
.4:
        mov word [byte ebx+0Ch], 190h
        movsx eax, word [byte ebx+02h]
        movsx ecx, word [byte ecx+02h]
        sub eax, ecx
        mov ecx, eax
        test eax, eax
        jge short .5
        neg ecx
.5:
        mov eax, ecx
        cmp ecx, byte 10h
        jge short .6
        mov ecx, 10h
        sub ecx, eax
        imul eax, ecx, byte 64h
        add word [byte ebx+0Ch], ax
.6:
        mov edx, SPAfightdrop
        or byte [byte ebx+045h], 26h
        mov eax, ebx
        and byte [byte ebx+044h], 0DFh
        call SetSPA
        movsx eax, word [byte ebx+036h]
        cmp eax, byte 2
        jne short .7
        or byte [RefObject+48h], 1
        mov ax, word [byte ebx+02h]
        mov word [RefObject+4Eh], ax
        mov ax, word [byte ebx+06h]
        mov word [RefObject+50h], ax
        mov al, byte [dword ebx+086h]
        mov byte [RefObject+52h], al
        pop ecx
        pop ebx
        ret
.7:
        or byte [RefObject+48h], 2
        movsx eax, word [byte ebx+02h]
        mov dword [RefObject+72h], eax
        movsx eax, word [byte ebx+06h]
        mov dword [RefObject+76h], eax
        mov al, byte [dword ebx+086h]
        mov byte [RefObject+53h], al
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; checkfight                                                        45B60  93G
; Called from checkcx with impact >= 10 on both: SetInst both ways with 10 +
; max(0, 40 - count)/4, crowd +1000, fighters face each other.
;
; The others get the watch assignment 32h, the puck 1Ah
;-----------------------------------------------------------------------------
checkfight:
        push ebx
        push ecx
        push esi
        push edi
        mov ecx, eax
        mov esi, edx
        mov eax, dword [gameopts]
        test byte [byte eax+02h], 1
        je near .21
        cmp dword [FightingOn], byte 0
        je near .21
        movsx eax, word [dword ecx+086h]
        cmp eax, byte 0Bh
        jg near .21
        movsx eax, word [dword edx+086h]
        cmp eax, byte 0Bh
        jg near .21
        movsx eax, word [byte ecx+018h]
        cmp eax, byte 0Ah
        jl near .21
        movsx eax, word [byte edx+018h]
        cmp eax, byte 0Ah
        jl near .21
        mov al, byte [byte ecx+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .21
        mov al, byte [byte edx+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .21
        mov al, byte [byte ecx+045h]
        and al, 10h
        movzx eax, al
        test eax, eax
        jne near .21
        mov al, byte [byte edx+045h]
        and al, 10h
        movzx eax, al
        test eax, eax
        jne near .21
        cmp word [byte ecx+01Ah], byte 0
        jle near .21
        cmp word [byte edx+01Ah], byte 0
        jle near .21
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .21
        mov eax, dword [PtrPuckFlags]
        mov dl, byte [byte eax+045h]
        and dl, 1
        movzx edx, dl
        test edx, edx
        jne near .21
        movsx edx, word [byte eax+01Ch]
        movsx eax, byte [byte edx+eax+01Eh]
        cmp eax, byte 1Bh
        je near .21
        mov edi, 28h
        sub edi, dword [GameHitCount]
        test edi, edi
        jge short .1
        xor edi, edi
.1:
        sar edi, 2
        mov edx, esi
        add edi, byte 0Ah
        mov eax, ecx
        mov ebx, edi
        call SetInst
        mov ebx, edi
        mov edx, ecx
        mov eax, esi
        call SetInst
        mov al, byte [byte ecx+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        je near .21
        mov dword [GameHitCount], 0
        mov edi, HmFightFlags
        mov eax, AwFightFlags
        dec dword [FightingOn]
        xor edx, edx
.2:
        mov byte [eax], 0
        inc edx
        mov bl, byte [eax]
        inc eax
        mov byte [edi], bl
        inc edi
        cmp edx, byte 1Ch
        jl short .2
        and byte [sflags], 0F3h
        add word [Crowdlevel], 3E8h
        add word [CwdExciteLvl], byte 23h
        mov eax, 7
        movsx edx, word [dword ecx+086h]
        call CloseTextOverlay
        movsx edx, word [byte ecx+06h]
        movsx eax, word [byte esi+06h]
        add eax, edx
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov word [yc1], ax
        test ax, ax
        jge short .3
        cwde
        neg eax
        jmp short .4
.3:
        cwde
.4:
        cmp eax, 15Ch
        jle near .13
        cmp word [yc1], byte 0
        jge short .5
        movsx eax, word [yc1]
        neg eax
        jmp short .6
.5:
        movsx eax, word [yc1]
.6:
        cmp eax, 178h
        jge short .13
        cmp word [yc1], byte 0
        jge short .7
        movsx eax, word [yc1]
        neg eax
        jmp short .8
.7:
        movsx eax, word [yc1]
.8:
        cmp eax, 16Ch
        jle short .10
        cmp word [yc1], byte 0
        jge short .9
        mov eax, 0FFFFFEA4h
        jmp short .12
.9:
        mov eax, 15Ch
        jmp short .12
.10:
        cmp word [yc1], byte 0
        jge short .11
        mov eax, 0FFFFFE88h
        jmp short .12
.11:
        mov eax, 178h
.12:
        mov word [yc1], ax
.13:
        or byte [sflags], 40h
        mov ax, word [byte ecx+02h]
        cmp ax, word [byte esi+02h]
        jge short .14
        mov eax, 2
        jmp short .15
.14:
        mov eax, 6
.15:
        mov word [byte ecx+036h], ax
        mov ax, word [byte ecx+02h]
        cmp ax, word [byte esi+02h]
        jge short .16
        mov eax, 6
        jmp short .17
.16:
        mov eax, 2
.17:
        mov edx, esi
        mov word [byte esi+036h], ax
        mov eax, ecx
        call checkfight_sf
        mov edx, ecx
        mov eax, esi
        call checkfight_sf
        mov ecx, SortCords
        xor esi, esi
.18:
        mov al, byte [byte ecx+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        jne short .20
        cmp word [byte ecx+01Ah], byte 0
        jg short .19
        jne short .20
.19:
        mov al, byte [byte ecx+045h]
        and al, 4
        movzx eax, al
        test eax, eax
        jne short .20
        mov edx, 32h
        mov eax, ecx
        call assinsert
.20:
        inc esi
        add ecx, 0A0h
        cmp esi, byte 0Ch
        jl short .18
        mov eax, dword [puckc]
        mov byte [eax], 0FFh
        mov eax, dword [PtrPuckFlags]
        or byte [byte eax+045h], 1
        mov edx, 1Ah
        mov eax, dword [PtrPuckFlags]
        call assinsert
        mov byte [collflag], 0FFh
.21:
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; checkcx                          45E3D  94G collide94.asm, medium confidence
; Possible collision with one OOlist neighbour: x range and distance, impact,
; newcheck sound, checkint (interference), checkcheck (contact events).
;-----------------------------------------------------------------------------
checkcx:
        push esi
        push edi
        enter 14h, 0
        mov esi, eax
        mov edi, edx
        movsx eax, cx
        imul eax, dword 0A0h
        mov ecx, SortCords
        add ecx, eax
        mov al, byte [byte ecx+044h]
        and al, 4
        movzx eax, al
        test eax, eax
        jne near .17
        mov al, byte [byte ecx+045h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .17
        movsx eax, word [dword ecx+086h]
        cmp eax, byte 0Bh
        jle short .1
        cmp eax, byte 10h
        jne near .17
.1:
        mov eax, dword [PtrPuckFlags]
        mov al, byte [byte eax+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        je short .2
        mov al, byte [byte esi+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov edx, eax
        mov al, byte [byte ecx+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        xor eax, edx
        jne near .17
.2:
        mov ax, word [byte ecx+02h]
        mov word [byte ebp-0Ch], ax
        sub word [byte ebp-0Ch], di
        cmp word [byte ebp-0Ch], byte 0
        jge short .3
        movsx eax, word [byte ebp-0Ch]
        neg eax
        jmp short .4
.3:
        movsx eax, word [byte ebp-0Ch]
.4:
        cmp eax, byte 10h
        jg near .17
        movsx edx, word [byte ebp-0Ch]
        imul edx, edx
        movsx eax, bx
        imul eax, eax
        add edx, eax
        mov dword [regd0], edx
        cmp edx, 100h
        jg near .17
        mov ax, word [byte esi+0Ch]
        sub ax, word [byte ecx+0Ch]
        mov dword [byte ebp-04h], eax
        mov ax, word [byte esi+0Eh]
        sub ax, word [byte ecx+0Eh]
        mov di, word [byte ecx+06h]
        mov dword [byte ebp-08h], eax
        mov ax, word [byte ecx+02h]
        sub di, word [byte esi+06h]
        sub ax, word [byte esi+02h]
        movsx edx, di
        mov word [byte ebp-0Ch], ax
        movsx eax, word [byte ebp-08h]
        imul edx, eax
        movsx eax, word [byte ebp-0Ch]
        mov dword [byte ebp-010h], eax
        movsx eax, word [byte ebp-04h]
        imul eax, dword [byte ebp-010h]
        add edx, eax
        mov dword [regd1], edx
        test edx, edx
        jl near .17
        sar dword [regd1], 4
        movsx eax, word [dword esi+086h]
        cmp eax, byte 10h
        je short .5
        movsx eax, word [dword ecx+086h]
        cmp eax, byte 10h
        je short .5
        movzx edx, byte [byte esi+044h]
        movzx eax, byte [byte ecx+044h]
        xor eax, edx
        test al, 40h
        je near .11
.5:
        movsx eax, word [regd1]
        sar eax, 8
        mov word [regd4], ax
        cwde
        cmp eax, byte 5
        jg short .6
        mov dword [regd4], 5
.6:
        mov ax, word [regd4]
        mov word [lastimpact], ax
        add word [byte esi+018h], ax
        mov ax, word [regd4]
        add word [byte ecx+018h], ax
        mov al, byte [byte ecx+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        jne short .7
        mov ax, word [dword esi+086h]
        mov word [byte ecx+014h], ax
.7:
        mov al, byte [byte esi+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        jne short .8
        mov ax, word [dword ecx+086h]
        mov word [byte esi+014h], ax
.8:
        movsx eax, word [regd4]
        cmp eax, byte 14h
        jl short .10
        mov eax, dword [puckc]
        movsx ax, byte [eax]
        cmp ax, word [dword esi+086h]
        je short .9
        cmp ax, word [dword ecx+086h]
        jne short .10
.9:
        cmp word [ltack], byte 0
        sete al
        movzx ax, al
        mov word [ltack], ax
        mov eax, 1Dh
        call PlaySfx
.10:
        mov edx, ecx
        mov eax, esi
        call checkint
        movsx ebx, word [regd4]
        mov edx, ecx
        mov eax, esi
        call checkcheck
        mov edx, ecx
        mov eax, esi
        call checkfight
.11:
        mov ax, word [regd1]
        mov word [regd4], ax
        cmp byte [collflag], 0
        jl near .17
        movsx eax, word [byte ebp-04h]
        movsx edx, di
        imul edx, eax
        movsx eax, word [byte ebp-08h]
        mov dword [byte ebp-010h], edx
        movsx edx, word [byte ebp-0Ch]
        imul eax, edx
        mov edx, dword [byte ebp-010h]
        sub edx, eax
        mov eax, edx
        sar eax, 4
        mov dword [regd0], edx
        mov word [regd5], ax
        movzx ax, byte [byte esi+056h]
        add eax, 8Ch
        mov word [regd0], ax
        cmp word [byte esi+01Ah], byte 0
        jne short .12
        add word [regd0], byte 28h
.12:
        movzx ax, byte [byte ecx+056h]
        add eax, 8Ch
        mov word [regd1], ax
        cmp word [byte ecx+01Ah], byte 0
        jne short .13
        add word [regd1], byte 28h
.13:
        mov ax, word [regd0]
        movsx edx, word [regd4]
        add word [regd1], ax
        cwde
        imul eax, edx
        movsx ebx, word [regd1]
        cdq
        idiv ebx
        mov dword [regd0], eax
        mov dword [regd1], eax
        movsx edx, di
        movsx eax, word [regd5]
        imul eax, edx
        movsx ebx, word [byte ebp-0Ch]
        mov dword [byte ebp-010h], eax
        mov eax, dword [regd0]
        imul eax, ebx
        add eax, dword [byte ebp-010h]
        sar eax, 4
        mov word [LastShooterTeam], 0
        mov dword [byte ebp-014h], eax
        mov ax, word [byte ecx+0Ch]
        add eax, dword [byte ebp-014h]
        mov word [byte esi+0Ch], ax
        movsx eax, word [regd5]
        imul eax, ebx
        mov edi, dword [regd0]
        imul edi, edx
        sub edi, eax
        mov eax, edi
        sar eax, 4
        mov dword [byte ebp-014h], eax
        mov ax, word [byte ecx+0Eh]
        add eax, dword [byte ebp-014h]
        mov word [byte esi+0Eh], ax
        imul ebx, dword [regd1]
        sar ebx, 4
        add word [byte ecx+0Ch], bx
        imul edx, dword [regd1]
        sar edx, 4
        add word [byte ecx+0Eh], dx
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        mov byte [collflag], 0FFh
        test eax, eax
        jne near .17
        movzx edx, byte [byte esi+044h]
        movzx eax, byte [byte ecx+044h]
        xor eax, edx
        test al, 40h
        jne near .17
        mov ax, word [byte ecx+06h]
        sub ax, word [byte esi+06h]
        movsx edx, ax
        mov ax, word [byte ecx+02h]
        sub ax, word [byte esi+02h]
        cwde
        call vtoa
        mov ebx, eax
        mov word [byte ebp-0Ch], ax
        mov al, byte [byte esi+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        jne short .15
        mov ax, word [byte esi+02Ch]
        sub ax, word [byte esi+06h]
        movsx edx, ax
        mov ax, word [byte esi+02Ah]
        sub ax, word [byte esi+02h]
        cwde
        call vtoa
        cmp ax, bx
        je short .14
        cmp word [byte esi+0Ch], byte 0
        jne short .15
        cmp word [byte esi+0Eh], byte 0
        jne short .15
        cmp bx, word [byte esi+036h]
        jne short .15
.14:
        mov al, byte [byte ebp-0Ch]
        inc al
        inc al
        and al, 7
        movsx edx, al
        mov byte [byte esi+028h], al
        mov eax, esi
        call doplayeracc
.15:
        mov al, byte [byte ecx+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        jne short .17
        mov eax, dword [byte ebp-0Ch]
        add eax, 4
        xor ah, ah
        and al, 7
        mov word [byte ebp-0Ch], ax
        mov ax, word [byte ecx+02Ch]
        sub ax, word [byte ecx+06h]
        movsx edx, ax
        mov ax, word [byte ecx+02Ah]
        sub ax, word [byte ecx+02h]
        cwde
        call vtoa
        cmp ax, word [byte ebp-0Ch]
        je short .16
        cmp word [byte esi+0Ch], byte 0
        jne short .17
        cmp word [byte esi+0Eh], byte 0
        jne short .17
        mov ax, word [byte ecx+036h]
        cmp ax, word [byte ebp-0Ch]
        jne short .17
.16:
        mov al, byte [byte ebp-0Ch]
        inc al
        inc al
        and al, 7
        movsx edx, al
        mov byte [byte ecx+028h], al
        mov eax, ecx
        call doplayeracc
.17:
        leave
        pop edi
        pop esi
        ret
