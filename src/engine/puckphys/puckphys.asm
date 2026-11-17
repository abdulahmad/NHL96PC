; Puck physics: puck against bodies, shadow, glue, goalie and stick contact, rebounds and shots.
bits 32
%include "hockey.inc"
section s_43026 progbits alloc exec nowrite align=1
extern a2touchpuck, assextra2, assreplace, BlockShotDive_122, BlockShotDive_127, chk4pass_2F, chk4pass_4F1, chk4pass_4F6
extern ChkShotStat, Crowdlevel, CwdExciteLvl, EndPenaltyShot, FallDown, GetHot, GiveControl, gmode
extern gmode2, iflags, lastplayer, ltack, OffsideCalled, onetimerflag, OneTimerPasser, optflags
extern PassCompleted, passdir, passplayer, passspeed, PassTargetLocked, penshotlive, PlaySfx, PtrPuckFlags
extern puckc, PuckChasers, puckflip, puckvx, puckvy, puckvz, puckx, pucky
extern puckz, randomd0, regd0, regd1, regd2, SetSPA, sflags, sflags3
extern sfx, ShotLaneOpen, shotongoal, shotontarget, shotsets, ShotTypeParams, SortCords, SpeechPatchNext
extern vecdist, VisTeam, vtoa
global puckbody, PuckIChk, puckshadow, puckglue, PickPuckRebound, puckgoalie, puckstick, SetShotMode
global ShotMode, Findhittype, shotdiradj, doshot
;-----------------------------------------------------------------------------
; puckbody                         43026  94G collide94.asm, medium confidence
; The puck hits a player's body: a2touchpuck, GetHot, puckflip, sfx; called
; from checkpuckcoll
;-----------------------------------------------------------------------------
puckbody:
        push ebx
        push ecx
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov edi, edx
        movsx eax, word [byte eax+012h]
        cmp eax, 230h
        jl short .3
        cmp eax, 260h
        jge short .3
        cmp eax, 248h
        jl short .1
        cmp eax, 250h
        jl short .2
.1:
        movsx eax, word [byte esi+012h]
        cmp eax, 258h
        jl near .8
        cmp eax, 260h
        jge near .8
.2:
        movsx eax, word [byte esi+0Ah]
        cmp eax, byte 8
        jg near BlockShotDive_127
        jmp near .8
.3:
        movsx eax, word [byte esi+0Ah]
        cmp eax, byte 8
        jg short .5
        mov eax, dword [puckvy]
        movsx eax, word [eax]
        push eax
        mov eax, dword [puckvx]
        movsx eax, word [eax]
        push eax
        call vecdist
        shr eax, 0Ah
        add esp, byte 8
        mov dword [byte ebp-08h], eax
        cmp eax, byte 10h
        jle short .4
        mov dword [byte ebp-08h], 10h
.4:
        mov edx, 20h
        jmp short .7
.5:
        mov eax, dword [puckvy]
        movsx eax, word [eax]
        push eax
        mov eax, dword [puckvx]
        movsx eax, word [eax]
        push eax
        call vecdist
        shr eax, 0Ah
        add esp, byte 8
        mov dword [byte ebp-08h], eax
        cmp eax, byte 10h
        jle short .6
        mov dword [byte ebp-08h], 10h
.6:
        mov edx, 28h
.7:
        movzx ax, byte [byte esi+05Ah]
        sub edx, eax
        mov eax, edx
        sub eax, dword [byte ebp-08h]
        cwde
        call randomd0
        test ax, ax
        jne near BlockShotDive_127
.8:
        movsx eax, word [dword edi+086h]
        cmp eax, byte 10h
        je short .9
        mov eax, edi
        call a2touchpuck
.9:
        mov word [byte esi+010h], 0
        mov word [byte edi+03Eh], 8
        mov ax, word [byte esi+02h]
        sub ax, word [byte edi+02h]
        mov word [regd0], ax
        mov ax, word [byte esi+06h]
        sub ax, word [byte edi+06h]
        mov word [regd1], ax
        jne short .10
        mov eax, edi
        call GetHot
.10:
        mov al, byte [regd0]
        mov cx, word [byte esi+0Ch]
        mov byte [byte esi+0Dh], al
        mov al, byte [regd1]
        mov dx, word [byte esi+0Eh]
        mov byte [byte esi+0Fh], al
        mov eax, esi
        call puckflip
        mov eax, 2
        call randomd0
        test ax, ax
        je short .11
        mov eax, 0Fh
        jmp short .12
.11:
        mov eax, 11h
.12:
        movsx ebx, word [byte esi+0Ah]
        mov dword [byte ebp-04h], eax
        cmp ebx, byte 8
        jg short .16
        movsx eax, word [byte edi+038h]
        cmp eax, 3A7h
        je near BlockShotDive_127
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jge near BlockShotDive_127
        cmp ebx, byte 3
        jge short .14
        mov eax, 13h
.13:
        call PlaySfx
        jmp near BlockShotDive_127
.14:
        movsx eax, dx
        push eax
        movsx eax, cx
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, 1770h
        jbe short .15
        mov eax, 10h
        jmp short .13
.15:
        movsx eax, word [byte ebp-04h]
        jmp short .13
.16:
        movsx ebx, cx
        imul ebx, ebx
        movsx eax, dx
        imul eax, eax
        lea edx, [ebx+eax]
        cmp edx, 2255100h
        jle short .17
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jge short .17
        mov dword [byte ebp-04h], 10h
.17:
        cmp edx, 17D7840h
        jle short .18
        movsx eax, word [byte esi+0Ah]
        cmp eax, byte 12h
        jl short .18
        mov eax, dword [puckvz]
        cmp word [eax], byte 0
        jl short .18
        mov edx, edi
        mov eax, esi
        mov dword [byte ebp-04h], 29h
        call FallDown
.18:
        movsx eax, word [byte edi+038h]
        cmp eax, 3A7h
        je short .19
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jge short .19
        movsx eax, word [byte ebp-04h]
        call PlaySfx
.19:
        mov al, byte [byte edi+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near BlockShotDive_127
        movsx eax, word [dword edi+086h]
        cmp eax, byte 10h
        je near BlockShotDive_127
        movsx eax, word [byte esi+0Ah]
        cmp eax, byte 10h
        jl near BlockShotDive_127
        mov edx, 3A7h
        mov eax, edi
        or byte [byte edi+044h], 20h
        jmp near BlockShotDive_122
;-----------------------------------------------------------------------------
; PuckIChk                           43294  94G logic94.asm, medium confidence
; (icing). iflags bit 2 ifok, bit 0 ifcgl, bit 1 ifdir; loose puck past the goal
; line: |puckx| > 2Ch sets ifcgl (icing), else clears ifok.
;-----------------------------------------------------------------------------
PuckIChk:
        mov al, byte [iflags]
        and al, 4
        movsx eax, al
        test eax, eax
        je near .6
        mov al, byte [iflags]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .6
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jge short .6
        mov al, byte [iflags]
        and al, 2
        movsx eax, al
        test eax, eax
        jne short .1
        mov eax, dword [pucky]
        movsx eax, word [eax]
        cmp eax, 0FFFFFE9Ch
        jge short .6
        jmp short .2
.1:
        mov eax, dword [pucky]
        movsx eax, word [eax]
        cmp eax, 164h
        jl short .6
.2:
        mov eax, dword [puckx]
        cmp word [eax], byte 0
        jge short .3
        movsx eax, word [eax]
        neg eax
        jmp short .4
.3:
        movsx eax, word [eax]
.4:
        cmp eax, byte 2Ch
        jg short .5
        and byte [iflags], 0FBh
        ret
.5:
        or byte [iflags], 1
.6:
        ret
;-----------------------------------------------------------------------------
; puckshadow                                            4331A  94G logic94.asm
; Assignment table slot 19h: the puck shadow object
;-----------------------------------------------------------------------------
puckshadow:
        push edx
        movsx edx, word [byte eax+012h]
        cmp edx, 0ED9h
        jne short .1
        mov edx, dword [puckx]
        mov dx, word [edx]
        mov word [byte eax+02h], dx
        mov edx, dword [pucky]
        mov dx, word [edx]
        mov word [byte eax+0Ah], 0
        mov word [byte eax+06h], dx
        inc word [byte eax+06h]
.1:
        pop edx
        ret
;-----------------------------------------------------------------------------
; puckglue                         4334D  94G collide94.asm, medium confidence
; (92 puckstick.glue): player p takes the puck. puckc gets his SCnum a live
; penalty shot ends when his team's tmpsplayer takes it.
;
; The other team's assist slots are cleared and its tmflags bit 3 set.
;
; After a faceoff (sflags3 bit 4) count a faceoff won (and one won in the
; attacking end), raise Crowdlevel by 200 (max 1000) and the home crowd's
; CwdExciteLvl by 10; otherwise play sfx 9Bh .
;
; Then the pass completion, clear the pass/shot dir modes (sflags bits 2-3); a
; goalie checks the shot stat and gets temp5 hold time (5 after SPA 181h, else
; 8Ch). Falls into setd0player: GiveControl(regd0).
;
; The attacking-end count is two increments (if / else if): one `||` test
; moved the registers of the Crowdlevel clamp after it.
;-----------------------------------------------------------------------------
puckglue:
        push ebx
        push ecx
        push esi
        mov ebx, eax
        mov esi, edx
        mov ax, word [dword eax+086h]
        mov word [regd0], ax
        mov edx, dword [puckc]
        mov al, byte [regd0]
        mov byte [edx], al
        mov edx, dword [dword ebx+088h]
        mov ecx, dword [dword ebx+08Ch]
        cmp dword [penshotlive], byte 0
        je short .1
        movsx ax, byte [byte ebx+047h]
        cmp ax, word [byte edx+032h]
        jne short .1
        call EndPenaltyShot
        mov dword [OneTimerPasser], 0
        mov dword [onetimerflag], 0
        mov dword [shotongoal], 0
.1:
        mov byte [byte ecx+035h], 0FFh
        mov byte [byte ecx+037h], 0FFh
        or byte [byte ecx+046h], 8
        mov ax, word [sflags3]
        xor ah, ah
        and al, 10h
        cwde
        test eax, eax
        je near .6
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        and byte [sflags3], 0EFh
        test eax, eax
        jne short .4
        inc word [byte edx+014h]
        mov ecx, dword [pucky]
        movsx eax, word [ecx]
        cmp eax, byte 74h
        jle short .2
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .3
.2:
        mov ecx, dword [pucky]
        movsx eax, word [ecx]
        cmp eax, byte 0FFFFFF8Ch
        jge short .4
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .4
.3:
        inc word [byte edx+016h]
.4:
        mov eax, 1
        call sfx
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jg short .5
        add word [Crowdlevel], 0C8h
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jle short .5
        mov word [Crowdlevel], 3E8h
.5:
        mov al, byte [byte ebx+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne near .16
        add word [CwdExciteLvl], byte 0Ah
        jmp near .16
.6:
        test esi, esi
        jne near .16
        cmp word [byte ebx+01Ah], byte 0
        jne near .14
        movsx edx, word [byte ebx+038h]
        cmp edx, 5F9h
        je short .7
        cmp edx, 5F3h
        jne short .8
.7:
        mov ecx, dword [puckz]
        movsx eax, word [ecx]
        cmp eax, byte 8
        jg short .8
        mov eax, 2
        call randomd0
        test ax, ax
        je short .8
        mov eax, 13h
        jmp near .15
.8:
        cmp edx, 671h
        je short .10
        cmp edx, 65Fh
        je short .10
        cmp edx, 6DFh
        je short .9
        cmp edx, 5E3h
        je short .9
        cmp edx, 68Bh
        je short .9
        cmp edx, 691h
        je short .9
        cmp edx, 5F9h
        je short .9
        cmp edx, 5F3h
        jne short .11
.9:
        mov ecx, dword [puckz]
        movsx eax, word [ecx]
        cmp eax, byte 8
        jg short .11
.10:
        mov eax, 14h
        jmp short .15
.11:
        cmp edx, 5EDh
        jne short .12
        mov eax, 11h
        jmp short .15
.12:
        cmp edx, 6A7h
        jne short .13
        mov eax, 10h
        jmp short .15
.13:
        mov eax, 12h
        jmp short .15
.14:
        mov eax, 9
.15:
        call PlaySfx
.16:
        mov eax, ebx
        call PassCompleted
        and byte [sflags], 0F3h
        cmp word [byte ebx+01Ah], byte 0
        jne short .18
        xor eax, eax
        call ChkShotStat
        call EndPenaltyShot
        movsx eax, word [byte ebx+038h]
        cmp eax, 623h
        jne short .17
        mov word [byte ebx+02Eh], 5
        jmp short .18
.17:
        mov word [byte ebx+02Eh], 8Ch
.18:
        mov al, byte [byte ebx+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        je short .19
        mov al, byte [byte ebx+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov edx, eax
        shl edx, 2
        mov dword [dword edx+PuckChasers], 0
.19:
        mov al, byte [byte ebx+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov edx, eax
        shl edx, 2
        cmp dword [dword edx+PuckChasers], byte 0
        jne short .20
        movsx eax, word [regd0]
        call GiveControl
.20:
        mov edx, dword [PtrPuckFlags]
        mov word [byte edx+048h], 0
        mov edx, dword [PtrPuckFlags]
        mov byte [byte edx+05Bh], 0
        mov edx, dword [PtrPuckFlags]
        mov byte [byte edx+05Ch], 0
        mov edx, dword [PtrPuckFlags]
        mov byte [byte edx+05Fh], 0
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PickPuckRebound                                 43605  96 PC, low confidence
; Works out where the puck goes off a goalie or a stick
;-----------------------------------------------------------------------------
PickPuckRebound:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1Ch, 0
        mov edi, eax
        test word [optflags], 180h
        setne al
        movzx eax, al
        mov esi, dword [PtrPuckFlags]
        add eax, byte 3
        movzx edx, byte [byte esi+05Bh]
        mov dword [byte ebp-014h], eax
        mov dword [byte ebp-010h], eax
        movzx eax, byte [byte esi+05Ch]
        add edx, eax
        mov eax, dword [puckx]
        mov dword [byte ebp-018h], edx
        movsx edx, word [byte edi+02h]
        movsx eax, word [eax]
        sub eax, edx
        mov dword [byte ebp-04h], eax
        mov eax, dword [pucky]
        movsx edx, word [byte edi+06h]
        movsx eax, word [eax]
        sub eax, edx
        push eax
        push dword [byte ebp-04h]
        mov dword [byte ebp-01Ch], eax
        call vecdist
        add esp, byte 8
        cmp eax, dword [byte ebp-014h]
        jl near chk4pass_2F
        cmp dword [byte ebp-04h], byte 0
        jge short .1
        mov eax, dword [byte ebp-04h]
        neg eax
        jmp short .2
.1:
        mov eax, dword [byte ebp-04h]
.2:
        cmp eax, dword [byte ebp-010h]
        jl near chk4pass_2F
        movsx edx, word [byte ebp-01Ch]
        movsx eax, word [byte ebp-04h]
        call vtoa
        cwde
        mov dword [byte ebp-08h], eax
        movsx eax, word [dword edi+086h]
        cmp eax, byte 6
        jge short .3
        mov eax, 6
        jmp short .4
.3:
        xor eax, eax
.4:
        imul eax, dword 0A0h
        mov esi, SortCords
        mov dword [byte ebp-0Ch], 0
        add esi, eax
.5:
        cmp word [byte esi+01Ah], byte 0
        jle near .9
        cmp esi, 1BDh
        jb short .6
        cmp esi, 2AFh
        jbe short .9
.6:
        movsx edx, word [byte esi+02h]
        movsx eax, word [byte edi+02h]
        sub edx, eax
        mov dword [byte ebp-04h], edx
        movsx eax, word [byte edi+06h]
        movsx edx, word [byte esi+06h]
        sub edx, eax
        push edx
        push dword [byte ebp-04h]
        mov dword [byte ebp-01Ch], edx
        call vecdist
        movsx edx, word [byte ebp-01Ch]
        add esp, byte 8
        mov ebx, eax
        movsx eax, word [byte ebp-04h]
        call vtoa
        movsx edx, ax
        cmp word [byte esi+06h], byte 0
        jge short .7
        movsx eax, word [byte esi+06h]
        neg eax
        jmp short .8
.7:
        movsx eax, word [byte esi+06h]
.8:
        cmp eax, 164h
        jge short .9
        cmp ebx, byte 14h
        jge short .9
        mov eax, edx
        sub eax, dword [byte ebp-08h]
        inc eax
        and eax, byte 7
        cmp eax, byte 3
        jge short .9
        inc dword [byte ebp-018h]
.9:
        inc dword [byte ebp-0Ch]
        add esi, 0A0h
        cmp dword [byte ebp-0Ch], byte 6
        jl near .5
        mov eax, dword [puckvy]
        movsx eax, word [eax]
        push eax
        mov eax, dword [puckvx]
        movsx eax, word [eax]
        push eax
        call vecdist
        shr eax, 0Bh
        add dword [byte ebp-018h], eax
        mov ax, word [gmode2]
        xor ah, ah
        and al, 20h
        cwde
        add esp, byte 8
        test eax, eax
        je short .10
        mov al, byte [byte edi+044h]
        and al, 40h
        movzx edx, al
        mov ax, word [gmode2]
        xor ah, ah
        and al, 40h
        cwde
        xor edx, eax
        je short .10
        add dword [byte ebp-018h], byte 2
.10:
        movsx eax, word [byte ebp-018h]
        call randomd0
        cwde
        mov dword [byte ebp-018h], eax
        mov eax, dword [optflags]
        and eax, 180h
        cmp eax, 100h
        jne short .11
        mov eax, 1Eh
        jmp short .13
.11:
        cmp eax, 80h
        jne short .12
        mov eax, 18h
        jmp short .13
.12:
        mov eax, 12h
.13:
        cmp eax, dword [byte ebp-018h]
        jge near chk4pass_2F
        jmp near chk4pass_4F1
;-----------------------------------------------------------------------------
; puckgoalie                       437EB  94G collide94.asm, medium confidence
; The puck pk hits goalie p (regd0 / regd1 = the gap from checkpuckcoll_ccx).
;
; Nothing happens during a stoppage (gmode bit 4) or while p's frame is
; 206h-215h with the puck at height 5 or more.
;
; regd2 = the save side: 2 for a low puck (Zpos <= 8), plus 1 unless the
; direction of the hit relative to facedir has bit 2, doubled, flipped by 2
; with attribute bit 3.
;
; A hard shot (|vx| + |vy| above 4268h, or above 1770h during SPA 119Dh-121Dh)
; by the other team's shotplayer from more than 58h out is a big save (byte
; +63h), when gmode2 bit 4 is set and pflags bit 6 is not.
;
; Then ChkShotStat, a2touchpuck and the save sounds (7Dh / A1h for a fast puck
; while the clock runs, else 9Dh or A3h).
;
; A loose puck slow enough for his shotspd (random below ((shotspd * 5 / 4 +
; 2) << 9) + 2000h) is caught unless pflags2 bit 2 is set: stopped, dropped to
; height 8, velocity quartered, puckglue.
;
; A carried puck is knocked loose: its carrier gets nopuck 14h, lastplayer,
; and the pass and shot dir modes are cleared.
;
; Otherwise the puck rebounds: height at most 0Ah, p's nopuck 0Ah and temp4 4,
; the velocity high bytes from half the gap (GetHot when the y gap is 0),
; puckflip. No result.
;-----------------------------------------------------------------------------
puckgoalie:
        push ebx
        push ecx
        push esi
        push edi
        enter 4, 0
        mov edi, eax
        mov esi, edx
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        mov dword [byte ebp-04h], 0
        test eax, eax
        jne near BlockShotDive_127
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .1
        movsx eax, word [dword edx+086h]
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
        je near BlockShotDive_127
.1:
        mov word [regd2], 0
        movsx eax, word [byte edi+0Ah]
        cmp eax, byte 8
        jg short .2
        mov word [regd2], 2
.2:
        mov ax, word [regd1]
        neg eax
        movsx edx, ax
        mov ax, word [regd0]
        neg eax
        cwde
        call vtoa
        sub ax, word [byte esi+036h]
        mov edx, eax
        xor dh, ah
        xor ah, ah
        and al, 3
        and dl, 7
        cwde
        mov word [regd0], dx
        test eax, eax
        jne short .3
        mov eax, 100h
        call randomd0
        mov word [regd0], ax
.3:
        mov ax, word [regd0]
        xor ah, ah
        and al, 4
        cwde
        sar eax, 2
        xor al, 1
        mov edx, eax
        movsx eax, word [regd2]
        add eax, edx
        mov word [regd2], ax
        shl word [regd2], 1
        mov ax, word [byte esi+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        je short .4
        xor byte [regd2], 2
.4:
        mov ax, word [byte esi+012h]
        cwde
        cmp eax, 270Fh
        jl short .5
        cmp eax, 271Fh
        jge short .5
        mov eax, dword [puckz]
        movsx eax, word [eax]
        cmp eax, byte 5
        jge near BlockShotDive_127
.5:
        mov eax, esi
        call PickPuckRebound
        test eax, eax
        jne near BlockShotDive_127
        mov dword [byte esi+076h], eax
        mov al, byte [byte esi+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne near .13
        mov ax, word [gmode2]
        xor ah, ah
        and al, 10h
        cwde
        test eax, eax
        je near .13
        movsx eax, word [dword esi+086h]
        cmp eax, byte 6
        setl al
        movzx edx, al
        movsx eax, word [VisTeam]
        cmp eax, byte 6
        setl al
        movzx eax, al
        xor eax, edx
        je near .13
        movsx eax, word [VisTeam]
        imul eax, dword 0A0h
        cmp word [dword eax+SortCords+6], byte 0
        jge short .6
        movsx eax, word [dword eax+SortCords+6]
        neg eax
        jmp short .7
.6:
        movsx eax, word [dword eax+SortCords+6]
.7:
        cmp eax, byte 7Eh
        jle near .13
        movsx eax, word [VisTeam]
        imul eax, dword 0A0h
        cmp word [dword eax+SortCords+6], byte 0
        setg al
        movzx edx, al
        mov al, byte [byte esi+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        xor eax, edx
        je short .13
        mov eax, dword [puckvy]
        cmp word [eax], byte 0
        jge short .8
        movsx edx, word [eax]
        neg edx
        jmp short .9
.8:
        movsx edx, word [eax]
.9:
        mov eax, dword [puckvx]
        cmp word [eax], byte 0
        jge short .10
        movsx eax, word [eax]
        neg eax
        jmp short .11
.10:
        movsx eax, word [eax]
.11:
        add eax, edx
        cwde
        cmp eax, 2328h
        jg short .12
        cmp eax, 1770h
        jle short .13
        movsx eax, word [byte esi+038h]
        cmp eax, 623h
        jl short .13
        cmp eax, 65Fh
        jg short .13
.12:
        mov dword [byte ebp-04h], 1
.13:
        mov al, byte [byte esi+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        je short .16
        cmp word [VisTeam], byte 0
        jl short .16
        movsx eax, word [dword esi+086h]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov edx, eax
        movsx eax, word [VisTeam]
        cmp eax, byte 6
        setl al
        movzx eax, al
        xor eax, edx
        je short .16
        movsx eax, word [VisTeam]
        imul eax, dword 0A0h
        cmp word [dword eax+SortCords+6], byte 0
        jge short .14
        movsx eax, word [dword eax+SortCords+6]
        neg eax
        jmp short .15
.14:
        movsx eax, word [dword eax+SortCords+6]
.15:
        cmp eax, byte 7Eh
.16:
        xor eax, eax
        call ChkShotStat
        mov eax, esi
        call a2touchpuck
        mov eax, dword [puckvy]
        cmp word [eax], byte 0
        jge short .17
        movsx eax, word [eax]
        neg eax
        jmp short .18
.17:
        movsx eax, word [eax]
.18:
        cmp eax, 0BB8h
        jle near .23
        movsx eax, word [byte esi+038h]
        cmp eax, 671h
        je short .20
        cmp eax, 65Fh
        je short .20
        cmp eax, 6DFh
        je short .19
        cmp eax, 68Bh
        je short .19
        cmp eax, 691h
        je short .19
        cmp eax, 5F9h
        je short .19
        cmp eax, 5F3h
        jne short .21
.19:
        mov edx, dword [puckz]
        movsx edx, word [edx]
        cmp edx, byte 8
        jg short .21
.20:
        mov eax, 14h
        jmp short .24
.21:
        cmp eax, 5EDh
        jne short .22
        mov eax, 11h
        jmp short .24
.22:
        mov eax, 12h
        jmp short .24
.23:
        mov eax, 11h
.24:
        call PlaySfx
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jge near .26
        movzx ax, byte [byte esi+05Bh]
        inc eax
        inc eax
        shl eax, 9
        cwde
        call randomd0
        add ah, 20h
        mov word [regd0], ax
        mov eax, dword [puckvy]
        movsx eax, word [eax]
        push eax
        mov eax, dword [puckvx]
        movsx eax, word [eax]
        push eax
        call vecdist
        movsx edx, word [regd0]
        add esp, byte 8
        cmp eax, edx
        ja near .27
        mov al, byte [byte esi+045h]
        and al, 4
        movzx eax, al
        test eax, eax
        jne short .27
        mov eax, dword [puckvz]
        mov word [eax], 0
        mov eax, dword [puckz]
        movsx edx, word [eax]
        cmp edx, byte 8
        jle short .25
        mov word [eax], 8
.25:
        mov eax, dword [puckvx]
        sar word [eax], 2
        mov eax, dword [puckvy]
        mov edx, 1
        sar word [eax], 2
        mov eax, esi
        call puckglue
        movsx eax, word [byte ebp-04h]
        mov dword [byte esi+076h], eax
        jmp near BlockShotDive_127
.26:
        movsx edx, byte [eax]
        imul edx, dword 0A0h
        add edx, SortCords
        mov byte [eax], 0FFh
        mov word [byte edx+03Eh], 14h
        mov ax, word [dword edx+086h]
        and byte [sflags], 0F3h
        mov word [lastplayer], ax
.27:
        mov eax, dword [puckvz]
        mov word [eax], 0
        mov eax, dword [puckz]
        movsx edx, word [eax]
        cmp edx, byte 0Ah
        jle short .28
        mov word [eax], 0Ah
.28:
        mov word [byte esi+03Eh], 0Ah
        mov word [byte esi+02Ch], 4
        mov ax, word [byte edi+02h]
        sub ax, word [byte esi+02h]
        mov word [regd0], ax
        mov ax, word [byte edi+06h]
        sub ax, word [byte esi+06h]
        mov word [regd1], ax
        jne short .29
        mov eax, esi
        call GetHot
.29:
        cmp word [regd1], byte 0
        jne short .30
        inc word [regd1]
.30:
        movsx edx, word [regd1]
        movsx eax, word [byte esi+0Eh]
        xor eax, edx
        test eax, eax
        jl short .31
        neg word [regd1]
.31:
        movsx eax, byte [regd0]
        sar eax, 1
        mov byte [byte edi+0Dh], al
        movsx eax, byte [regd1]
        sar eax, 1
        mov byte [byte edi+0Fh], al
        mov eax, edi
        call puckflip
        jmp near BlockShotDive_127
;-----------------------------------------------------------------------------
; puckstick                        43C7E  94G collide94.asm, medium confidence
; The puck touches player p's stick (regd0 = the squared distance from
; checkpuckcoll_ccx); ends in PassLaneChk_ret5a.
;
; A goalie does nothing during a highlight (gmode bit 4). Otherwise his save
; flag (byte 63h) is cleared, then set again for a fast shot from the far
; side.
;
; That shot is one by the other team's shotplayer from beyond 58h, from the
; far side (by pflags bit 7), with |vy| over 2EE0h (over 1770h with SPA
; 119Dh-121Dh); then ChkShotStat.
;
; Then pflags bit 0 is cleared.
;
; With a carrier (puckc) on the other team, in range (regd0 up to 24h) and p
; not in SPA 13C5h-14ADh, p may steal the puck. A goalie always steals.
;
; A skater steals only from a skater, on randomd0(carrier pde + 20h - p's pde,
; an eighth more against a carrier with pflags bit 3 and p without) up to 2.
;
; After a steal both get nopuck pde + 14h, lastplayer = the carrier, sflags
; bits 2-3 are cleared, and the stick deflects the puck.
;
; Without a carrier (a goalie only within 40h): regd0 = puck speed squared,
; regd1 = (13000 + 700 * stickhand) squared, with no stickhand bonus under
; gmode2 bit 4.
;
; Outside SPA 13C5h-14ADh p catches a slow enough puck, or as the pass
; receiver (passplayer) on randomd0(2): vz cleared, puckglue.
;
; A goalie who catches it keeps it below z 8 with vx and vy quartered and his
; save flag set. Else nopuck 8 and the stick deflect: sfx 99h, a2touchpuck,
; deflect(puck).
;-----------------------------------------------------------------------------
puckstick:
        push ebx
        push ecx
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov ebx, edx
        movsx eax, word [passplayer]
        xor ecx, ecx
        mov dword [byte ebp-04h], eax
        cmp word [byte edx+01Ah], byte 0
        jne near .8
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne near BlockShotDive_127
        mov dword [byte edx+076h], ecx
        cmp word [SpeechPatchNext], byte 0
        jne near .8
        mov al, byte [byte edx+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne near .8
        mov ax, word [gmode2]
        xor ah, ah
        and al, 10h
        cwde
        test eax, eax
        je near .8
        movsx eax, word [dword edx+086h]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov edi, eax
        movsx eax, word [VisTeam]
        cmp eax, byte 6
        setl al
        movzx eax, al
        xor eax, edi
        je near .8
        movsx eax, word [VisTeam]
        imul eax, dword 0A0h
        cmp word [dword eax+SortCords+6], byte 0
        jge short .1
        movsx eax, word [dword eax+SortCords+6]
        neg eax
        jmp short .2
.1:
        movsx eax, word [dword eax+SortCords+6]
.2:
        cmp eax, byte 7Eh
        jle near .8
        movsx eax, word [VisTeam]
        imul eax, dword 0A0h
        cmp word [dword eax+SortCords+6], byte 0
        setg al
        movzx eax, al
        mov edi, eax
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        xor eax, edi
        je short .8
        mov eax, dword [puckvy]
        cmp word [eax], byte 0
        jge short .3
        movsx eax, word [eax]
        neg eax
        jmp short .4
.3:
        movsx eax, word [eax]
.4:
        cmp eax, 2328h
        jg short .7
        mov eax, dword [puckvy]
        cmp word [eax], byte 0
        jge short .5
        movsx eax, word [eax]
        neg eax
        jmp short .6
.5:
        movsx eax, word [eax]
.6:
        cmp eax, 1770h
        jle short .8
        movsx eax, word [byte ebx+038h]
        cmp eax, 623h
        jl short .8
        cmp eax, 65Fh
        jg short .8
.7:
        mov ecx, 1
.8:
        and byte [byte ebx+044h], 0FEh
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl near .17
        movsx eax, word [byte ebx+038h]
        cmp eax, 2A3h
        jl short .9
        cmp eax, 2BFh
        jle near BlockShotDive_127
.9:
        mov eax, dword [puckc]
        movsx eax, byte [eax]
        imul eax, dword 0A0h
        mov ecx, SortCords
        add ecx, eax
        movzx edi, byte [byte ebx+044h]
        movzx eax, byte [byte ecx+044h]
        xor eax, edi
        test al, 40h
        je near BlockShotDive_127
        cmp dword [regd0], byte 24h
        ja near BlockShotDive_127
        cmp word [byte ebx+01Ah], byte 0
        je near .14
        cmp word [byte ecx+01Ah], byte 0
        je near BlockShotDive_127
        movsx eax, byte [byte ecx+047h]
        mov edi, dword [dword ecx+088h]
        movsx eax, word [byte edi+eax*2+048h]
        movzx edi, byte [byte ecx+060h]
        imul eax, edi
        sar eax, 0Ch
        cwde
        mov edi, dword [dword ebx+088h]
        mov dword [byte ebp-08h], eax
        movsx eax, byte [byte ebx+047h]
        movsx edi, word [byte edi+eax*2+048h]
        movzx eax, byte [byte ebx+060h]
        imul eax, edi
        sar eax, 0Ch
        mov edi, dword [byte ebp-08h]
        cwde
        add edi, byte 20h
        sub edi, eax
        mov eax, dword [optflags]
        and eax, 180h
        mov word [regd0], di
        cmp eax, 100h
        jae short .10
        mov al, byte [byte ecx+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        je short .10
        mov al, byte [byte ebx+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        jne short .10
        movsx edi, di
        mov eax, edi
        cdq
        shl edx, 3
        LD sbb, eax, edx
        sar eax, 3
        add eax, edi
        mov word [regd0], ax
.10:
        mov eax, dword [optflags]
        and eax, 180h
        cmp eax, 100h
        jne short .11
        mov edi, 8
        jmp short .13
.11:
        cmp eax, 80h
        jne short .12
        mov edi, 6
        jmp short .13
.12:
        mov edi, 3
.13:
        movsx eax, word [regd0]
        call randomd0
        cwde
        cmp eax, edi
        jg near BlockShotDive_127
.14:
        movsx eax, byte [byte ecx+047h]
        mov edi, dword [dword ecx+088h]
        movsx eax, word [byte edi+eax*2+048h]
        movzx edi, byte [byte ecx+060h]
        imul eax, edi
        sar eax, 0Ch
        mov edi, 24h
        cwde
        sub edi, eax
        mov word [byte ecx+03Eh], di
        cmp word [byte ecx+01Ah], byte 0
        jne short .15
        sub word [byte ecx+03Eh], byte 0Ah
.15:
        movsx edi, byte [byte ebx+047h]
        mov eax, dword [dword ebx+088h]
        add edi, edi
        movsx edi, word [byte edi+eax+048h]
        movzx eax, byte [byte ebx+060h]
        imul eax, edi
        sar eax, 0Ch
        mov edi, 24h
        cwde
        sub edi, eax
        mov word [byte ebx+03Eh], di
        cmp word [byte ebx+01Ah], byte 0
        jne short .16
        sub word [byte ebx+03Eh], byte 0Ah
.16:
        mov ax, word [dword ecx+086h]
        and byte [sflags], 0F3h
        mov word [lastplayer], ax
        jmp near .29
.17:
        cmp word [byte ebx+01Ah], byte 0
        jne short .18
        cmp dword [regd0], byte 40h
        ja near BlockShotDive_127
.18:
        mov eax, dword [puckvx]
        mov ax, word [eax]
        mov word [regd0], ax
        movsx edi, word [regd0]
        imul edi, edi
        mov eax, dword [puckvy]
        mov ax, word [eax]
        mov word [regd1], ax
        cwde
        imul eax, eax
        add edi, eax
        mov ax, word [gmode2]
        xor ah, ah
        and al, 10h
        mov word [regd1], 0
        cwde
        mov dword [regd0], edi
        test eax, eax
        jne short .19
        movzx ax, byte [byte ebx+060h]
        imul eax, dword 2BCh
        jmp short .20
.19:
        mov eax, dword [PtrPuckFlags]
        movsx eax, word [byte eax+048h]
        cmp eax, byte 1
        jne short .21
        movzx ax, byte [byte ebx+060h]
        imul eax, dword 190h
.20:
        mov word [regd1], ax
.21:
        add word [regd1], 32C8h
        movsx eax, word [regd1]
        imul eax, eax
        mov dword [regd1], eax
        movsx eax, word [byte ebx+038h]
        cmp eax, 2A3h
        jl short .22
        cmp eax, 2BFh
        jle short .23
.22:
        mov eax, 1
        jmp short .24
.23:
        xor eax, eax
.24:
        test eax, eax
        je near .28
        mov eax, dword [regd0]
        cmp eax, dword [regd1]
        jbe short .25
        mov ax, word [dword ebx+086h]
        cmp ax, word [passplayer]
        jne near .28
        mov eax, 2
        call randomd0
        test ax, ax
        je near .28
.25:
        mov eax, dword [puckvz]
        xor edx, edx
        mov word [eax], 0
        mov eax, ebx
        call puckglue
        cmp word [byte ebx+01Ah], byte 0
        jne short .27
        mov eax, dword [puckz]
        movsx esi, word [eax]
        cmp esi, byte 8
        jle short .26
        mov word [eax], 8
.26:
        mov eax, dword [puckvx]
        sar word [eax], 2
        mov eax, dword [puckvy]
        sar word [eax], 2
        mov dword [byte ebx+076h], ecx
        jmp near BlockShotDive_127
.27:
        movsx eax, word [dword ebx+086h]
        cmp eax, dword [byte ebp-04h]
        jne near BlockShotDive_127
        mov al, byte [byte ebx+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne near BlockShotDive_127
        mov eax, ebx
        call assextra2
        test eax, eax
        je near BlockShotDive_127
        mov eax, 1
        call sfx
        jmp near BlockShotDive_127
.28:
        mov word [byte ebx+03Eh], 8
        cmp word [byte ebx+01Ah], byte 0
        jne short .29
        mov eax, ebx
        call PickPuckRebound
        test eax, eax
        jne near BlockShotDive_127
.29:
        cmp word [byte ebx+01Ah], byte 0
        jne near .34
        xor eax, eax
        movsx ecx, word [byte ebx+038h]
        call ChkShotStat
        cmp ecx, 671h
        je short .31
        cmp ecx, 65Fh
        je short .31
        cmp ecx, 6DFh
        je short .30
        cmp ecx, 68Bh
        je short .30
        cmp ecx, 691h
        je short .30
        cmp ecx, 5F9h
        je short .30
        cmp ecx, 5F3h
        jne short .32
.30:
        mov eax, dword [puckz]
        movsx eax, word [eax]
        cmp eax, byte 8
        jg short .32
.31:
        mov eax, 14h
        jmp short .35
.32:
        cmp ecx, 5EDh
        jne short .33
        mov eax, 11h
        jmp short .35
.33:
        mov eax, 12h
        jmp short .35
.34:
        mov eax, 9
.35:
        call PlaySfx
        mov eax, ebx
        call a2touchpuck
        mov eax, dword [puckc]
        mov byte [eax], 0FFh
        mov eax, 2000h
        call randomd0
        db 081h,0E8h,00h,010h,00h,00h           ; insn: sub eax,1000h
        mov word [byte esi+0Eh], ax
        mov eax, 2000h
        call randomd0
        db 081h,0E8h,00h,010h,00h,00h           ; insn: sub eax,1000h
        mov word [byte esi+0Ch], ax
        mov eax, 1000h
        call randomd0
        mov word [byte esi+010h], ax
        mov word [regd0], ax
        mov eax, esi
        call puckflip
        mov word [byte ebx+03Eh], 0Ah
        jmp near BlockShotDive_127
;-----------------------------------------------------------------------------
; SetShotMode                        441EF  94G logic94.asm, medium confidence
; P winds up a shot: pass direction 8 (shot), sflags bit 3.
;
; regd0 = direction from p to the attacked goal (x 0, y +/-F0h by pflags bit
; 7), passspeed = 15, then the slap (SPA 491h, when Findhittype finds a hit
; type) or wrist shot animation (3F9h).
;-----------------------------------------------------------------------------
SetShotMode:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov word [passdir], 8
        mov word [regd0], 0
        or byte [sflags], 8
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .1
        mov edx, 0FFFFFE94h
        jmp short .2
.1:
        mov edx, 16Ch
.2:
        mov word [regd1], dx
        mov eax, edx
        sub ax, word [byte ebx+06h]
        movsx edx, ax
        mov ax, word [regd0]
        sub ax, word [byte ebx+02h]
        cwde
        call vtoa
        mov word [passspeed], 0Fh
        mov word [regd0], ax
        mov cx, word [byte ebx+036h]
        sub ecx, eax
        mov ax, word [byte ebx+054h]
        xor al, al
        and ah, 8
        xor ch, ch
        cwde
        and cl, 7
        test eax, eax
        je short .3
        mov eax, 1
        movsx ecx, cx
        shl eax, cl
        test al, 0F0h
        setne al
        movzx ax, al
        mov ecx, eax
        jmp short .4
.3:
        mov eax, 1
        movsx ecx, cx
        shl eax, cl
        test al, 1Eh
        setne al
        movzx cx, al
.4:
        test cx, cx
        je short .5
        mov edx, 0DDh
        jmp short .6
.5:
        mov edx, 0BDh
.6:
        mov eax, ebx
        call SetSPA
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ShotMode                           442B3  94G logic94.asm, medium confidence
; Shot wind-up of p (frame counter SPAnum): from frame 14 shoot (doshot).
; Without regd0 bit 3 the aim direction (regd0 & 7) becomes passdir.
;
; Before frame 10 a release (regd1 bit 4 or 6) ends the wind-up: clear sflags
; bit 3, flag 20h, and switch the slap SPAs 3F9h/491h/DD3h/E2Bh to their
; follow-through 1265h/12DDh/ 1355h/138Dh.
;
; Otherwise before frame 8 count passspeed and jump to the mirrored frame (14
; - SPAnum) for a weak shooter (shotspd < 10) past frame 4 or when regd2 bit 5
; is set.
;-----------------------------------------------------------------------------
ShotMode:
        push ebx
        mov ebx, edx
        movsx edx, word [byte eax+03Ah]
        cmp edx, byte 0Ah
        jl short .1
        call doshot
        pop ebx
        ret
.1:
        mov dx, word [regd0]
        xor dh, dh
        and dl, 8
        movsx edx, dx
        test edx, edx
        jne short .2
        mov byte [OffsideCalled], 0
        and byte [regd0], 7
        mov dx, word [regd0]
        mov word [passdir], dx
.2:
        movsx edx, word [byte eax+03Ah]
        cmp edx, byte 8
        jg near .16
        jne short .3
        mov dx, word [regd2]
        xor dh, dh
        and dl, 20h
        movsx edx, dx
        test edx, edx
        jne short .3
        mov word [byte eax+03Ch], 2
.3:
        mov dx, word [regd1]
        xor dh, dh
        and dl, 10h
        movsx edx, dx
        test edx, edx
        jne short .4
        mov dx, word [regd1]
        xor dh, dh
        and dl, 40h
        movsx edx, dx
        test edx, edx
        je near .10
.4:
        and byte [sflags], 0F7h
        mov dx, word [byte eax+038h]
        or byte [byte eax+044h], 20h
        cmp dx, 0DDh
        jb short .5
        jbe short .6
        cmp dx, 10Dh
        jb short .9
        jbe short .7
        cmp dx, 117h
        je short .8
        jmp short .9
.5:
        cmp dx, 0BDh
        jne short .9
        mov word [byte eax+038h], 0EDh
        jmp short .9
.6:
        mov word [byte eax+038h], 0FDh
        jmp short .9
.7:
        mov word [byte eax+038h], 121h
        jmp short .9
.8:
        mov word [byte eax+038h], 129h
.9:
        test ebx, ebx
        jl near .16
        mov dword [nosplit ebx*4+PassTargetLocked], 1
        pop ebx
        ret
.10:
        movsx edx, word [byte eax+03Ah]
        cmp edx, byte 8
        jg short .11
        movzx edx, byte [byte eax+05Bh]
        cmp edx, byte 0Ah
        jge short .12
.11:
        movsx edx, word [byte eax+03Ah]
        cmp edx, byte 4
        jg short .13
.12:
        inc word [passspeed]
.13:
        movsx edx, word [passspeed]
        cmp edx, byte 23h
        jle short .14
        mov word [passspeed], 23h
.14:
        mov dx, word [regd2]
        xor dh, dh
        and dl, 20h
        movsx edx, dx
        test edx, edx
        je short .16
        movsx edx, word [byte eax+038h]
        cmp edx, 0BDh
        jne short .15
        movsx edx, word [byte eax+03Ah]
        cmp edx, byte 6
        jge short .15
        mov word [byte eax+038h], 0CDh
.15:
        mov word [byte eax+03Ah], 0Ah
.16:
        pop ebx
        ret
;-----------------------------------------------------------------------------
; Findhittype                        44418  94G logic94.asm, medium confidence
; Type of swing for player p shooting in direction dir.
;
; d = (facedir - dir) & 7; returns 1 (backhand) when bit d of F0h (sprite
; X-flipped, attribute bit 3) or of 1Eh (not flipped) is set, else 0
; (forehand).
;-----------------------------------------------------------------------------
Findhittype:
        push ecx
        mov cx, word [byte eax+036h]
        mov ax, word [byte eax+054h]
        sub ecx, edx
        xor al, al
        mov edx, ecx
        and ah, 8
        xor dh, ch
        cwde
        and dl, 7
        test eax, eax
        je short .1
        mov eax, 1
        movsx ecx, dx
        shl eax, cl
        test al, 0F0h
        jmp short .2
.1:
        mov eax, 1
        movsx ecx, dx
        shl eax, cl
        test al, 1Eh
.2:
        setne al
        movzx ax, al
        pop ecx
        ret
        push edx
        mov edx, eax
        mov eax, dword [puckc]
        mov byte [eax], 0FFh
        mov eax, 2000h
        call randomd0
        db 081h,0E8h,00h,010h,00h,00h           ; insn: sub eax,1000h
        mov word [byte edx+0Eh], ax
        mov eax, 2000h
        call randomd0
        db 081h,0E8h,00h,010h,00h,00h           ; insn: sub eax,1000h
        mov word [byte edx+0Ch], ax
        mov eax, 1000h
        call randomd0
        mov word [byte edx+010h], ax
        mov word [regd0], ax
        mov eax, edx
        call puckflip
        pop edx
        ret
;-----------------------------------------------------------------------------
; shotdiradj                         444A7  95G input95.asm, medium confidence
; Where a computer player or a one-timer shoots. pflags bit 3 bails out,
; then the goalie on that side of SortCords
;-----------------------------------------------------------------------------
shotdiradj:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 18h, 0
        mov esi, eax
        mov al, byte [byte eax+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        jne near chk4pass_4F6
        mov eax, dword [dword esi+08Ch]
        mov ax, word [dword eax+0100h]
        test ax, ax
        jge short .1
        mov word [passdir], 8
        jmp near chk4pass_4F6
.1:
        cwde
        imul eax, dword 0A0h
        add eax, SortCords
        movsx edx, word [byte eax+0Ch]
        movsx ecx, word [byte eax+02h]
        sar edx, 9
        mov edi, dword [puckx]
        add ecx, edx
        movsx edx, word [edi]
        sub ecx, edx
        movsx edx, cx
        mov dword [byte ebp-0Ch], edx
        movsx edx, word [byte eax+0Eh]
        sar edx, 9
        movsx eax, word [byte eax+06h]
        add edx, eax
        mov eax, dword [pucky]
        movsx eax, word [eax]
        sub edx, eax
        movsx edi, dx
        push edi
        push dword [byte ebp-0Ch]
        call vecdist
        add esp, byte 8
        mov dword [byte ebp-04h], eax
        test ax, ax
        jne short .2
        mov eax, 1
        mov dword [byte ebp-04h], eax
.2:
        mov al, byte [byte esi+044h]
        and al, 80h
        mov edx, 12h
        movzx eax, al
        mov dword [byte ebp-08h], 164h
        test eax, eax
        jne short .3
        mov dword [byte ebp-08h], 0FFFFFE9Ch
.3:
        mov eax, dword [puckx]
        movsx ecx, word [eax]
        movsx eax, dx
        mov dword [byte ebp-018h], eax
        sub eax, ecx
        imul eax, edi
        mov edx, dword [pucky]
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [edx]
        sub ebx, edx
        mov edx, ebx
        mov ebx, dword [byte ebp-0Ch]
        imul ebx, edx
        mov edx, ebx
        sub edx, eax
        mov eax, edx
        movsx edx, word [byte ebp-04h]
        mov dword [byte ebp-010h], edx
        cdq
        idiv dword [byte ebp-010h]
        mov dword [byte ebp-014h], ebx
        mov ebx, eax
        mov eax, dword [byte ebp-018h]
        neg eax
        sub eax, ecx
        imul eax, edi
        mov edx, dword [byte ebp-014h]
        sub edx, eax
        mov eax, edx
        cdq
        idiv dword [byte ebp-010h]
        add ebx, eax
        test bx, bx
        jge short .4
        movsx eax, bx
        neg eax
        jmp short .5
.4:
        movsx eax, bx
.5:
        cmp eax, byte 2Ch
        jle short .6
        mov word [passdir], 0
        jmp near chk4pass_4F6
.6:
        mov al, byte [byte esi+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .7
        neg ebx
.7:
        test bx, bx
        jl short .8
        mov word [passdir], 2
        jmp near chk4pass_4F6
.8:
        mov word [passdir], 6
        jmp near chk4pass_4F6
;-----------------------------------------------------------------------------
; doshot                             44609  94G logic94.asm, medium confidence
; The stick is at the puck, so launch it toward the goal: shotdiradj, shot
; speed, sfx, assreplace
;-----------------------------------------------------------------------------
doshot:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 14h, 0
        mov esi, eax
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        sete al
        movzx ecx, al
        add ecx, byte 0Ch
        imul ecx, dword 0A0h
        mov eax, esi
        call shotdiradj
        mov ax, word [dword esi+086h]
        and byte [sflags], 0F7h
        mov word [VisTeam], ax
        or byte [byte esi+044h], 20h
        mov eax, dword [puckc]
        movsx ax, byte [eax]
        add ecx, SortCords
        cmp ax, word [dword esi+086h]
        je short .1
        movsx eax, word [byte esi+038h]
        cmp eax, 10Dh
        je short .1
        cmp eax, 117h
        je short .1
        mov eax, 0Bh
        call PlaySfx
        jmp near chk4pass_4F6
.1:
        mov eax, dword [PtrPuckFlags]
        or byte [gmode2], 10h
        mov word [byte eax+048h], 2
        mov eax, dword [PtrPuckFlags]
        mov dl, byte [byte esi+05Bh]
        mov byte [byte eax+05Bh], dl
        mov eax, dword [PtrPuckFlags]
        mov dl, byte [byte esi+05Ch]
        mov byte [byte eax+05Ch], dl
        mov eax, dword [PtrPuckFlags]
        mov dl, byte [onetimerflag]
        mov byte [byte eax+05Fh], dl
        movsx eax, word [byte esi+038h]
        cmp eax, 0DDh
        je short .2
        cmp eax, 117h
        jne short .3
.2:
        movsx eax, word [passspeed]
        mov edx, eax
        sar edx, 2
        sub eax, edx
        mov dword [byte ebp-0Ch], 0Bh
        mov word [passspeed], ax
        jmp short .4
.3:
        mov dword [byte ebp-0Ch], 0Ah
.4:
        movzx bx, byte [byte esi+05Bh]
        inc ebx
        inc ebx
        cmp word [byte esi+0Ch], byte 0
        jge short .5
        movsx eax, word [byte esi+0Ch]
        neg eax
        jmp short .6
.5:
        movsx eax, word [byte esi+0Ch]
.6:
        cmp word [byte esi+0Eh], byte 0
        jge short .7
        movsx edx, word [byte esi+0Eh]
        neg edx
        jmp short .8
.7:
        movsx edx, word [byte esi+0Eh]
.8:
        add eax, edx
        cmp eax, 1F4h
        jge short .10
.9:
        inc ebx
        inc ebx
        jmp short .13
.10:
        cmp word [byte esi+06h], byte 0
        jge short .11
        movsx eax, word [byte esi+06h]
        neg eax
        jmp short .12
.11:
        movsx eax, word [byte esi+06h]
.12:
        cmp eax, 15Ah
        jge short .13
        movsx edx, word [byte esi+0Eh]
        movsx eax, word [byte esi+0Ch]
        call vtoa
        movsx edi, ax
        mov ax, word [byte esi+06h]
        sub ax, word [byte ecx+06h]
        movsx edx, ax
        mov ax, word [byte esi+02h]
        sub ax, word [byte ecx+02h]
        cwde
        call vtoa
        cwde
        sub edi, eax
        lea eax, [byte edi+01h]
        and eax, byte 7
        cmp eax, byte 1
        je short .9
        cmp eax, byte 3
        jge short .13
        inc ebx
.13:
        movsx eax, bx
        cmp eax, byte 0Eh
        jle short .14
        inc ebx
.14:
        movsx eax, bx
        cmp eax, byte 0Dh
        jle short .15
        inc ebx
.15:
        movsx eax, bx
        cmp eax, byte 0Ah
        jle short .16
        inc ebx
.16:
        mov eax, dword [optflags]
        and eax, 180h
        cmp eax, 80h
        jne short .17
        inc ebx
.17:
        mov eax, dword [optflags]
        and eax, 180h
        cmp eax, 100h
        jne short .18
        inc ebx
.18:
        movsx eax, byte [byte esi+047h]
        mov edx, dword [dword esi+088h]
        movsx edx, word [byte edx+eax*2+048h]
        movsx eax, bx
        imul eax, edx
        sar eax, 0Ch
        movsx edx, ax
        movsx eax, word [passspeed]
        add edx, byte 14h
        imul eax, edx
        mov word [passspeed], ax
        cwde
        imul eax, dword 5249h
        shr eax, 10h
        mov word [passspeed], ax
        cmp dword [shotongoal], byte 0
        je short .19
        call ShotLaneOpen
        mov eax, dword [shotontarget]
        mov dword [shotongoal], eax
.19:
        movsx eax, word [passspeed]
        mov edx, 3
        sar eax, 4
        sub edx, eax
        movsx eax, dx
        cmp eax, byte 0FFFFFFF8h
        jle short .20
        mov dword [byte ebp-0Ch], 0Bh
.20:
        movsx eax, word [byte esi+038h]
        cmp eax, 10Dh
        je short .21
        cmp eax, 117h
        jne short .22
.21:
        mov dword [byte ebp-0Ch], 0Ah
.22:
        mov eax, dword [puckc]
        mov byte [eax], 0FFh
        mov word [byte esi+03Eh], 10h
        mov ax, word [dword esi+086h]
        mov word [lastplayer], ax
        mov al, byte [byte esi+044h]
        and al, 80h
        movzx eax, al
        mov edx, 164h
        test eax, eax
        jne short .23
        mov edx, 0FFFFFE9Ch
.23:
        movsx edi, word [passdir]
        mov ebx, dword [puckx]
        mov ax, word [nosplit edi*4+shotsets]
        sub ax, word [ebx]
        mov dword [byte ebp-08h], eax
        mov eax, dword [pucky]
        sub dx, word [eax]
        movsx eax, dx
        push eax
        movsx eax, word [byte ebp-08h]
        push eax
        mov di, word [nosplit edi*4+ShotTypeParams]
        mov dword [byte ebp-04h], edx
        call vecdist
        add esp, byte 8
        mov ecx, eax
        test ax, ax
        jne short .24
        mov ecx, 1
.24:
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne near .35
        movzx eax, byte [byte esi+05Ch]
        movzx dx, byte [byte esi+05Ch]
        cmp eax, byte 0Eh
        jle short .25
        inc edx
.25:
        movsx eax, dx
        cmp eax, byte 0Dh
        jle short .26
        inc edx
.26:
        movsx eax, cx
        cmp eax, 0C8h
        jg short .27
        movzx ebx, byte [byte esi+05Ch]
        add ebx, ebx
        add ebx, byte 3Ch
        cmp eax, ebx
        jle near .35
        movzx ax, byte [byte esi+05Ch]
        add eax, 10h
        cwde
        call randomd0
        cwde
        cmp eax, byte 0Eh
        jg near .35
.27:
        movsx eax, word [passspeed]
        sar eax, 4
        mov dword [byte ebp-014h], eax
        movsx eax, dx
        mov edx, dword [byte ebp-014h]
        sub edx, eax
        mov eax, edx
        movsx edx, cx
        add eax, byte 10h
        imul eax, edx
        movzx eax, ax
        sar eax, 7
        mov ebx, eax
        cwde
        cmp eax, byte 55h
        jle short .28
        mov ebx, 55h
.28:
        movsx eax, cx
        cmp eax, 0FAh
        jge short .29
        sar bx, 1
.29:
        mov eax, ebx
        add eax, ebx
        cwde
        call randomd0
        sub eax, ebx
        add dword [byte ebp-08h], eax
        movsx eax, bx
        cmp eax, byte 3Ch
        jle short .30
        mov ebx, 3Ch
.30:
        cmp word [byte ebp-04h], byte 0
        jge short .31
        movsx edx, bx
        sar edx, 1
        jmp short .32
.31:
        movsx edx, bx
.32:
        mov eax, edx
        add eax, edx
        cwde
        call randomd0
        sub eax, edx
        add dword [byte ebp-04h], eax
        movsx eax, bx
        mov dword [byte ebp-010h], eax
        mov edx, eax
        movsx eax, cx
        sar edx, 1
        cmp eax, 0A0h
        jge short .33
        mov eax, dword [byte ebp-010h]
        mov dword [byte ebp-014h], 3
        cdq
        idiv dword [byte ebp-014h]
        mov edx, eax
.33:
        movsx eax, cx
        cmp eax, byte 50h
        jge short .34
        movsx eax, bx
        sar eax, 2
        mov edx, eax
.34:
        movsx eax, dx
        call randomd0
        add edi, eax
.35:
        movsx eax, word [passspeed]
        imul edx, eax, byte 44h
        movsx eax, word [byte ebp-08h]
        imul eax, edx
        movsx ebx, cx
        cdq
        idiv ebx
        mov ebx, eax
        test eax, eax
        jge short .36
        neg eax
.36:
        cmp eax, 7D00h
        jle short .38
        test ebx, ebx
        jge short .37
        mov ebx, 0FFFF8300h
        jmp short .38
.37:
        mov ebx, 7D00h
.38:
        mov eax, dword [puckvx]
        mov word [eax], bx
        movsx eax, word [passspeed]
        imul eax, byte 44h
        movsx edx, word [byte ebp-04h]
        imul eax, edx
        movsx ebx, cx
        cdq
        idiv ebx
        mov ebx, eax
        test eax, eax
        jge short .39
        neg eax
.39:
        cmp eax, 7D00h
        jle short .41
        test ebx, ebx
        jge short .40
        mov ebx, 0FFFF8300h
        jmp short .41
.40:
        mov ebx, 7D00h
.41:
        mov eax, dword [puckvy]
        mov word [eax], bx
        cmp dword [penshotlive], byte 0
        je near .50
        mov eax, dword [puckvx]
        movsx ebx, word [byte esi+0Ch]
        movsx eax, word [eax]
        xor eax, ebx
        test eax, eax
        jl short .45
        cmp word [byte esi+0Ch], byte 0
        jge short .42
        neg ebx
.42:
        mov eax, dword [puckvx]
        cmp word [eax], byte 0
        jge short .43
        movsx eax, word [eax]
        neg eax
        jmp short .44
.43:
        movsx eax, word [eax]
.44:
        cmp eax, ebx
        jge short .45
        mov dx, word [byte esi+0Ch]
        mov eax, dword [puckvx]
        add edx, 1F4h
        mov word [eax], dx
.45:
        mov edx, dword [puckvy]
        movsx eax, word [byte esi+0Eh]
        movsx edx, word [edx]
        xor edx, eax
        test edx, edx
        jl short .50
        cmp word [byte esi+0Eh], byte 0
        jge short .46
        mov ebx, eax
        neg ebx
        jmp short .47
.46:
        mov ebx, eax
.47:
        mov eax, dword [puckvy]
        cmp word [eax], byte 0
        jge short .48
        movsx eax, word [eax]
        neg eax
        jmp short .49
.48:
        movsx eax, word [eax]
.49:
        cmp eax, ebx
        jge short .50
        mov dx, word [byte esi+0Eh]
        mov eax, dword [puckvy]
        add edx, 1F4h
        mov word [eax], dx
.50:
        test di, di
        je short .52
        movsx eax, word [passspeed]
        mov dword [byte ebp-014h], eax
        imul edx, eax, byte 44h
        movsx eax, di
        imul eax, edx
        movsx ecx, cx
        xor edx, edx
        div ecx
        mov edi, eax
        imul eax, ecx, dword 0B33h
        xor edx, edx
        div dword [byte ebp-014h]
        add edi, eax
        movzx eax, di
        cmp eax, 1800h
        jle short .51
        mov edi, 1800h
.51:
        mov eax, dword [puckvz]
        mov word [eax], di
.52:
        movsx eax, word [byte ebp-0Ch]
        call PlaySfx
        cmp dword [penshotlive], byte 0
        je near chk4pass_4F6
        mov edx, 11h
        mov eax, esi
        call assreplace
        jmp near chk4pass_4F6
        test ax, ax
        je short .53
        mov eax, 1Eh
        jmp short .54
.53:
        cmp word [ltack], byte 0
        sete al
        movzx ax, al
        mov word [ltack], ax
        mov eax, 1Dh
.54:
        cwde
        jmp near PlaySfx
