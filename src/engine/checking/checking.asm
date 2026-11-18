; Checking decisions: blocking shots, choosing to check, aggression and checking the puck carrier.
bits 32
%include "hockey.inc"
%include "spa.inc"
section s_3E6EC progbits alloc exec nowrite align=1
extern Acheck, AddPenalty, awtmap, Bcheck, blockspd, blockspd_y, burst, CanBlockShot
extern CheckBump, CheckPowerTab, FallDown, gameopts, gmode, gmode2, gsp, hmtmap
extern holdcheck, lastimpact, nethit, optflags, PenBuf, penshotctl, penshotplayer, PlaySfx
extern puckc, puckvz, puckx, pucky, puckz, QuickShotChk, randomd0, refhitcount
extern regd0, regd1, regd2, SetSPA, SortCords, vecdist, vtoa, wallcoll
extern wcradiusx, wcradiusy
global BlockShotDive, BlockShotDive_122, BlockShotDive_127, TryBlockShot, check4check, checkagr, FacingBoards, checkcheck
global checkgoalp, checkint
;-----------------------------------------------------------------------------
; BlockShotDive                                3E6EC  95 PC, medium confidence
; eax = player, edx = dive direction from CanBlockShot. High puck or fast Zvel: SPA 14ADh /
; 1475h; else a sliding block. blockspd is the X speed and blockspd_y the Y speed for that facing.
;-----------------------------------------------------------------------------
BlockShotDive:
        push ebx
        push ecx
        push esi
        push edi
        enter 4, 0
        mov ebx, edx
        movsx dx, byte [byte eax+052h]
        or byte [byte eax+044h], 20h
        mov word [byte eax+036h], dx
        cmp ebx, byte 0Ah
        je short .1
        cmp ebx, byte 3
        jne short .3
.1:
        mov edx, dword [puckz]
        movsx edx, word [edx]
        cmp edx, byte 3
        jge short .2
        mov edx, dword [puckvz]
        movsx edx, word [edx]
        cmp edx, 7D0h
        jge short .2
        mov ebx, 2BFh
        jmp near .18
.2:
        mov ebx, 2BBh
        jmp near .18
.3:
        mov dx, word [byte eax+04Ah]
        mov esi, edx
        add esi, edx
        mov word [byte eax+036h], dx
        movsx edx, si
        mov dx, word [nosplit edx*2+blockspd_y]
        cmp ebx, byte 3
        jge short .4
        neg edx
.4:
        movsx edi, dx
        movsx ecx, word [byte eax+0Eh]
        xor edi, ecx
        test edi, edi
        jl short .8
        cmp word [byte eax+0Eh], byte 0
        jge short .5
        neg ecx
.5:
        test dx, dx
        jge short .6
        movsx edi, dx
        mov dword [byte ebp-04h], edi
        neg dword [byte ebp-04h]
        jmp short .7
.6:
        movsx edi, dx
        mov dword [byte ebp-04h], edi
.7:
        cmp ecx, dword [byte ebp-04h]
        jle short .8
        sar word [byte eax+0Eh], 1
        jmp short .9
.8:
        sar word [byte eax+0Eh], 3
.9:
        add word [byte eax+0Eh], dx
        movsx edx, si
        mov dx, word [nosplit edx*2+blockspd]
        cmp ebx, byte 3
        jge short .10
        neg edx
.10:
        cmp byte [byte eax+065h], 0
        sete cl
        movzx ecx, cl
        cmp ebx, byte 3
        setl bl
        movzx ebx, bl
        xor ebx, ecx
        je short .11
        mov ebx, 2A3h
        jmp short .12
.11:
        mov ebx, 2AFh
.12:
        movsx esi, dx
        movsx ecx, word [byte eax+0Ch]
        xor esi, ecx
        test esi, esi
        jl short .16
        cmp word [byte eax+0Ch], byte 0
        jge short .13
        neg ecx
.13:
        test dx, dx
        jge short .14
        movsx esi, dx
        neg esi
        jmp short .15
.14:
        movsx esi, dx
.15:
        cmp ecx, esi
        jle short .16
        sar word [byte eax+0Ch], 1
        jmp short .17
.16:
        sar word [byte eax+0Ch], 3
.17:
        add word [byte eax+0Ch], dx
.18:
        movsx edx, bx
BlockShotDive_122:
        call SetSPA
BlockShotDive_127:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; TryBlockShot                                 3E819  95 PC, medium confidence
; Random roll from attribute 5Ah (easier for the human team's opponents,
; gmode2 bits 5/6), then CanBlockShot and BlockShotDive.
;
; called from check4check
;-----------------------------------------------------------------------------
TryBlockShot:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov ax, word [gmode2]
        xor ah, ah
        and al, 20h
        cwde
        mov ecx, 8
        test eax, eax
        je short .1
        mov al, byte [byte ebx+044h]
        and al, 40h
        movzx edx, al
        mov ax, word [gmode2]
        xor ah, ah
        and al, 40h
        cwde
        xor eax, edx
        je short .1
        mov ecx, 4
.1:
        mov edx, 0Fh
        movzx eax, byte [byte ebx+05Ah]
        sub edx, eax
        lea eax, [edx+ecx]
        cdq
        LD sub, eax, edx
        sar eax, 1
        cwde
        call randomd0
        cwde
        cmp eax, byte 1
        jg short .2
        mov eax, ebx
        call CanBlockShot
        test eax, eax
        je short .2
        mov edx, eax
        mov eax, ebx
        call BlockShotDive
.2:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; check4check                        3E885  94G logic94.asm, medium confidence
; Looks for a good chance to check an opponent.
;
; The odds are 20 less p's checking rating, half again with penalties on
; (gameopts bit 0); a roll of randomd0(twice that) over 8 skips.
;
; Otherwise walk the six opponents: one on the ice (position), not
; animation-locked (pfalock) and not fighting (pflags2 bit 0), within 30 in x
; and y.
;
; straight ahead of p (vtoa of the offset equals facedir) gets checked: 1 in 4
; Acheck, else burst. With nobody to check, p may try to block a shot
; (TryBlockShot). regd0-regd2 are scratch. p: the player. No result.
;-----------------------------------------------------------------------------
check4check:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov edx, 14h
        movzx ax, byte [byte eax+064h]
        sub edx, eax
        mov ecx, dword [gameopts]
        mov word [regd0], dx
        test byte [byte ecx+01h], 1
        je short .1
        movsx eax, dx
        mov edx, eax
        sar edx, 1
        add eax, edx
        mov word [regd0], ax
.1:
        shl word [regd0], 2
        cmp word [byte ebx+02h], byte 0
        jge short .2
        movsx eax, word [byte ebx+02h]
        neg eax
        jmp short .3
.2:
        movsx eax, word [byte ebx+02h]
.3:
        cmp eax, byte 46h
        jge short .6
        cmp word [byte ebx+06h], byte 0
        jge short .4
        movsx eax, word [byte ebx+06h]
        neg eax
        jmp short .5
.4:
        movsx eax, word [byte ebx+06h]
.5:
        cmp eax, 11Eh
        jle short .6
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov edx, eax
        cmp word [byte ebx+06h], byte 0
        setg al
        movzx eax, al
        xor eax, edx
        je short .6
        mov ax, word [regd0]
        cwd
        LD sub, ax, dx
        sar ax, 1
        mov word [regd0], ax
.6:
        cmp word [byte ebx+02h], byte 0
        jge short .7
        movsx eax, word [byte ebx+02h]
        neg eax
        jmp short .8
.7:
        movsx eax, word [byte ebx+02h]
.8:
        cmp eax, byte 28h
        jge short .11
        cmp word [byte ebx+06h], byte 0
        jge short .9
        movsx eax, word [byte ebx+06h]
        neg eax
        jmp short .10
.9:
        movsx eax, word [byte ebx+06h]
.10:
        cmp eax, 13Ch
        jle short .11
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx edx, al
        cmp word [byte ebx+06h], byte 0
        setg al
        movzx eax, al
        xor eax, edx
        je short .11
        mov ax, word [regd0]
        cwd
        LD sub, ax, dx
        sar ax, 1
        mov word [regd0], ax
.11:
        movsx eax, word [regd0]
        call randomd0
        cwde
        cmp eax, byte 10h
        jg near .21
        movsx eax, word [dword ebx+086h]
        cmp eax, byte 6
        jge short .12
        mov eax, 6
        jmp short .13
.12:
        xor eax, eax
.13:
        imul eax, dword 0A0h
        mov ecx, SortCords
        mov word [regd2], 6
        add ecx, eax
.14:
        cmp word [byte ecx+01Ah], byte 0
        je near .20
        mov al, byte [byte ecx+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .20
        mov al, byte [byte ecx+045h]
        and al, 1
        movzx eax, al
        test eax, eax
        jne near .20
        mov ax, word [byte ecx+02h]
        sub ax, word [byte ebx+02h]
        mov word [regd0], ax
        test ax, ax
        jge short .15
        cwde
        neg eax
        jmp short .16
.15:
        cwde
.16:
        cmp eax, byte 1Eh
        jg short .20
        mov ax, word [byte ecx+06h]
        sub ax, word [byte ebx+06h]
        mov word [regd1], ax
        test ax, ax
        jge short .17
        cwde
        neg eax
        jmp short .18
.17:
        cwde
.18:
        cmp eax, byte 1Eh
        jg short .20
        movsx edx, word [regd1]
        movsx eax, word [regd0]
        call vtoa
        cmp ax, word [byte ebx+036h]
        jne short .20
        mov eax, 4
        call randomd0
        test ax, ax
        je short .19
        mov eax, ebx
        call burst
        pop edx
        pop ecx
        pop ebx
        ret
.19:
        mov edx, ecx
        mov eax, ebx
        call Acheck
        pop edx
        pop ecx
        pop ebx
        ret
.20:
        add ecx, 0A0h
        dec word [regd2]
        jne near .14
        mov eax, ebx
        call TryBlockShot
.21:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; checkagr                         3EA92  94G collide94.asm, medium confidence
; Random roll for an aggressive act (fight penalty) by p: range (20 - aggress)
; * 16, doubled with pflags bit 3.
;
; halved within 40 of the puck in both x and y, x8 after the second period,
; doubled without gameopts bit 9, x4 per power-play man down (other tmap - own
; tmap >= 1, >= 2) and x4 against the puck carrier's team during a stoppage.
;
; randomd0 of 1.5 times that. Returns 0 for a hit.
;-----------------------------------------------------------------------------
checkagr:
        push ebx
        push ecx
        push edx
        mov ebx, 14h
        movzx dx, byte [byte eax+062h]
        sub ebx, edx
        mov edx, ebx
        mov bl, byte [byte eax+044h]
        and bl, 8
        movzx ebx, bl
        shl edx, 4
        test ebx, ebx
        je short .1
        add edx, edx
.1:
        mov ebx, dword [puckx]
        movsx ecx, word [byte eax+02h]
        movsx ebx, word [ebx]
        sub ecx, ebx
        mov ebx, ecx
        test ecx, ecx
        jge short .2
        neg ebx
.2:
        cmp ebx, byte 28h
        jg short .4
        mov ebx, dword [pucky]
        movsx ecx, word [byte eax+06h]
        movsx ebx, word [ebx]
        sub ecx, ebx
        mov ebx, ecx
        test ecx, ecx
        jge short .3
        neg ebx
.3:
        cmp ebx, byte 28h
        jg short .4
        sar dx, 3
.4:
        movsx ebx, word [gsp]
        cmp ebx, byte 2
        jle short .5
        shl edx, 3
.5:
        mov ebx, dword [dword eax+08Ch]
        mov ecx, dword [dword eax+088h]
        mov bx, word [byte ebx+038h]
        sub bx, word [byte ecx+038h]
        movsx ecx, bx
        add edx, edx
        cmp ecx, byte 1
        jl short .6
        shl edx, 2
.6:
        movsx ebx, bx
        cmp ebx, byte 2
        jl short .7
        shl edx, 2
.7:
        mov bl, byte [gmode]
        and bl, 8
        movsx ebx, bl
        test ebx, ebx
        je short .8
        mov ebx, dword [puckc]
        cmp byte [ebx], 0
        jl short .8
        movsx eax, word [dword eax+086h]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov ebx, eax
        mov eax, dword [puckc]
        movsx eax, byte [eax]
        cmp eax, byte 6
        setl al
        movzx eax, al
        xor eax, ebx
        je short .8
        shl edx, 2
.8:
        movsx eax, dx
        mov ebx, eax
        sar ebx, 1
        add eax, ebx
        cwde
        call randomd0
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FacingBoards                                 3EB84  95 PC, medium confidence
; 1 when the player is near the boards or the end boards (|x| > 78h, |y| >
; E8h/F2h) and facing them (facedir); checkcheck uses it
;-----------------------------------------------------------------------------
FacingBoards:
        push ebx
        push ecx
        push edx
        mov bx, word [byte eax+02h]
        mov dx, word [byte eax+06h]
        movsx ebx, bx
        mov ax, word [byte eax+036h]
        cmp ebx, 0FFFFFF7Eh
        jge short .4
        movsx ebx, ax
        cmp ebx, byte 6
        je short .3
        movsx ecx, dx
        cmp ecx, 164h
        jle short .1
        cmp ebx, byte 7
        je short .3
.1:
        movsx ebx, dx
        cmp ebx, 0FFFFFE9Ch
        jge near .8
        cwde
        cmp eax, byte 5
.2:
        jne near .8
.3:
        mov eax, 1
        pop edx
        pop ecx
        pop ebx
        ret
.4:
        cmp ebx, 82h
        jle short .6
        movsx ebx, ax
        cmp ebx, byte 2
        je short .3
        movsx ecx, dx
        cmp ecx, 164h
        jle short .5
        cmp ebx, byte 1
        je short .3
.5:
        movsx ebx, dx
        cmp ebx, 0FFFFFE9Ch
        jge short .8
        cwde
        cmp eax, byte 3
        jmp short .2
.6:
        movsx ebx, dx
        cmp ebx, 16Eh
        jle short .7
        test ax, ax
        je short .3
.7:
        movsx ebx, dx
        cmp ebx, 0FFFFFE92h
        jge short .8
        cwde
        cmp eax, byte 4
        jmp short .2
.8:
        xor eax, eax
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; checkcheck                       3EC30  94G collide94.asm, medium confidence
; Two players in contact: hold (holdcheck), B-check (Bcheck), hits into
; the boards (FacingBoards), penalties (checkagr, AddPenalty), FallDown.
;-----------------------------------------------------------------------------
checkcheck:
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov esi, eax
        mov ecx, edx
        mov dword [byte ebp-0Ch], ebx
        mov byte [byte ebp-04h], 0
        jmp near .57
.1:
        movsx eax, word [byte ecx+038h]
        cmp eax, SPAHold
        je short .2
        cmp eax, SPAhook
        jne short .3
.2:
        mov edx, ecx
        mov eax, esi
        call holdcheck
        jmp near .56
.3:
        cmp eax, 2DBh
        jne short .4
        mov edx, ecx
        mov eax, esi
        call Bcheck
        jmp near .56
.4:
        movsx eax, word [byte esi+038h]
        cmp eax, SPAburst
        je short .8
        cmp eax, SPAcheckskate
        jl short .5
        cmp eax, SPAcheckburstr
        jle short .6
.5:
        mov eax, 1
        jmp short .7
.6:
        xor eax, eax
.7:
        test eax, eax
        je short .8
        movsx eax, word [byte esi+038h]
        cmp eax, SPAchecktarget
        jl near .56
        cmp eax, SPAchecktargetr
        jg near .56
.8:
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .9
        mov word [byte esi+018h], 100h
        mov word [byte ecx+018h], 100h
.9:
        mov ax, word [byte ecx+06h]
        sub ax, word [byte esi+06h]
        movsx edx, ax
        mov ax, word [byte ecx+02h]
        sub ax, word [byte esi+02h]
        cwde
        call vtoa
        mov dword [byte ebp-08h], eax
        mov ebx, eax
        mov ax, word [byte esi+054h]
        xor al, al
        sub bx, word [byte esi+036h]
        and ah, 8
        xor bh, bh
        cwde
        and bl, 7
        test eax, eax
        je short .10
        mov eax, 8
        sub eax, ebx
        mov ebx, eax
        xor bh, ah
        and bl, 7
.10:
        or byte [byte esi+044h], 20h
        cmp word [byte ecx+02h], byte 0
        jge short .11
        movsx eax, word [byte ecx+02h]
        neg eax
        jmp short .12
.11:
        movsx eax, word [byte ecx+02h]
.12:
        cmp eax, 9Ah
        jg short .17
        mov al, byte [byte esi+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov edx, eax
        cmp word [byte esi+06h], byte 0
        setg al
        movzx eax, al
        xor eax, edx
        je short .18
        cmp word [byte ecx+06h], byte 0
        jge short .13
        movsx eax, word [byte ecx+06h]
        neg eax
        jmp short .14
.13:
        movsx eax, word [byte ecx+06h]
.14:
        sub eax, 164h
        cmp eax, byte 3Ch
        jge short .18
        cmp word [byte ecx+02h], byte 0
        jge short .15
        movsx eax, word [byte ecx+02h]
        neg eax
        jmp short .16
.15:
        movsx eax, word [byte ecx+02h]
.16:
        cmp eax, byte 55h
        jge short .18
.17:
        mov edx, 14h
        jmp short .19
.18:
        mov edx, 1Eh
.19:
        movsx eax, word [byte esi+038h]
        cmp eax, SPAchecktarget
        jl short .20
        cmp eax, SPAchecktargetr
        jle near .38
.20:
        movsx eax, word [dword ecx+086h]
        cmp eax, byte 10h
        je near .27
        movsx eax, word [byte esi+038h]
        cmp eax, SPAcheckskate
        jl short .27
        cmp eax, SPAcheckburstr
        jg short .27
        cmp eax, SPAcheckskate
        jne short .25
        movsx eax, bx
        lea edx, [byte eax+01h]
        and edx, byte 7
        cmp edx, byte 2
        jg short .22
.21:
        mov edx, 319h
        jmp near .37
.22:
        cmp eax, byte 4
        jle short .24
        mov eax, 31Fh
.23:
        movsx edx, ax
        jmp near .37
.24:
        mov eax, 325h
        jmp short .23
.25:
        cmp eax, 355h
        je short .26
        cmp eax, 35Fh
        jne near .38
.26:
        test bx, bx
        je short .21
        movsx eax, bx
        jmp short .22
.27:
        movsx eax, word [dword ecx+086h]
        cmp eax, byte 10h
        je near .36
        movsx eax, dx
        movzx di, byte [byte esi+062h]
        call randomd0
        cmp ax, di
        jge near .36
        movsx eax, bx
        inc eax
        and eax, byte 7
        cmp eax, byte 2
        jg near .36
        movsx eax, word [byte esi+02h]
        movsx edx, word [byte ecx+02h]
        sub eax, edx
        test eax, eax
        jge short .28
        neg eax
.28:
        cmp eax, byte 14h
        jge near .36
        movsx edx, word [byte esi+06h]
        movsx eax, word [byte ecx+06h]
        sub edx, eax
        mov eax, edx
        test edx, edx
        jge short .29
        neg eax
.29:
        cmp eax, byte 14h
        jge short .36
        cmp word [byte ecx+0Ch], byte 0
        jge short .30
        movsx eax, word [byte ecx+0Ch]
        neg eax
        jmp short .31
.30:
        movsx eax, word [byte ecx+0Ch]
.31:
        cmp eax, 1F4h
        jge short .34
        cmp word [byte ecx+0Eh], byte 0
        jge short .32
        movsx eax, word [byte ecx+0Eh]
        neg eax
        jmp short .33
.32:
        movsx eax, word [byte ecx+0Eh]
.33:
        cmp eax, 1F4h
        jl short .35
.34:
        movsx edx, word [byte ecx+0Eh]
        movsx eax, word [byte ecx+0Ch]
        movsx edi, word [byte esi+036h]
        call vtoa
        cwde
        sub eax, edi
        inc eax
        inc eax
        test al, 3
        je short .36
.35:
        mov edx, SPAcrosscheck
        jmp short .37
.36:
        movsx eax, bx
        movsx edx, word [nosplit eax*2+CheckPowerTab]
.37:
        mov eax, esi
        call SetSPA
.38:
        cmp word [byte ecx+01Ah], byte 0
        je near .56
        movsx eax, word [byte ebp-0Ch]
        cmp eax, byte 14h
        jl near .56
        mov eax, dword [optflags]
        and eax, 180h
        mov ebx, 64h
        cmp eax, 80h
        jne short .39
        mov ebx, 96h
.39:
        test word [optflags], 180h
        jne short .40
        add ebx, byte 32h
.40:
        movsx eax, bx
        movzx edx, byte [byte esi+056h]
        sub eax, edx
        mov edx, eax
        movzx eax, byte [byte ecx+056h]
        add eax, edx
        sar eax, 1
        movsx edx, word [byte ecx+018h]
        sub eax, edx
        mov ebx, eax
        test ax, ax
        jle near .42
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne short .41
        mov eax, ecx
        call QuickShotChk
        test eax, eax
        je short .41
        cmp dword [penshotplayer], byte 0
        jl short .42
.41:
        movsx eax, bx
        call randomd0
        movzx dx, byte [byte esi+064h]
        cmp ax, dx
        jle short .42
        movsx eax, word [dword ecx+086h]
        cmp eax, byte 10h
        je near .56
        mov eax, esi
        call checkagr
        cwde
        cmp eax, byte 4
        jg near .56
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne near .56
        mov eax, 2
        call randomd0
        test ax, ax
        setne al
        movzx eax, al
        add eax, byte 0Bh
        movsx edx, ax
        mov eax, esi
        call AddPenalty
        jmp near .56
.42:
        movsx eax, word [dword ecx+086h]
        cmp eax, byte 10h
        jne short .43
        mov al, byte [byte esi+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        je near .56
        inc word [refhitcount]
        movsx eax, word [refhitcount]
        cmp eax, byte 3
        jl near .55
        mov word [refhitcount], 0
        jmp near .55
.43:
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne near .55
        mov eax, ecx
        call QuickShotChk
        test eax, eax
        je short .44
        cmp dword [penshotplayer], byte 0
        jge near .55
        movsx eax, word [dword ecx+086h]
        mov dword [penshotplayer], eax
        mov eax, dword [byte ecx+07Ah]
        mov edx, 1Ah
        mov dword [penshotctl], eax
        jmp near .48
.44:
        movsx eax, word [byte ecx+018h]
        cmp eax, byte 23h
        jle short .45
        movsx edx, word [byte ebp-08h]
        movsx eax, word [byte esi+036h]
        sub edx, eax
        inc edx
        and edx, byte 7
        cmp edx, byte 2
        jg short .45
        movsx edx, word [byte ecx+036h]
        sub edx, eax
        inc edx
        and edx, byte 7
        cmp edx, byte 2
        jg short .45
        mov eax, ecx
        call FacingBoards
        test ax, ax
        je short .45
        mov eax, esi
        call checkagr
        cwde
        cmp eax, byte 14h
        jge short .45
        mov edx, 18h
        jmp short .48
.45:
        mov eax, esi
        call checkagr
        cwde
        cmp eax, byte 3
        jg near .52
        movsx eax, word [byte esi+038h]
        cmp eax, SPAcrosscheck
        jne short .49
        mov eax, 0Ah
        call randomd0
        cwde
        cmp eax, byte 8
        jle short .46
        mov eax, 13h
        jmp short .47
.46:
        mov eax, 0Eh
.47:
        movsx edx, ax
.48:
        mov eax, esi
        call AddPenalty
        jmp near .55
.49:
        movsx eax, word [byte ecx+018h]
        cmp eax, byte 23h
        jle short .50
        mov eax, 4
        call randomd0
        test ax, ax
        jne short .50
        mov edx, 19h
        jmp short .48
.50:
        mov eax, 0Ah
        call randomd0
        cwde
        cmp eax, byte 6
        jle short .51
        mov eax, 15h
        jmp short .47
.51:
        mov eax, 0Dh
        jmp short .47
.52:
        mov al, byte [gmode]
        and al, 8
        movsx eax, al
        test eax, eax
        jne near .55
        movsx eax, word [dword esi+086h]
        cmp eax, byte 6
        jge near .55
        movsx eax, word [dword ecx+086h]
        cmp eax, byte 5
        jle near .55
        cmp eax, byte 0Ch
        jge near .55
        mov ax, word [hmtmap]
        cmp ax, word [awtmap]
        jle short .53
        mov eax, 4
        jmp short .54
.53:
        mov eax, 0Ch
.54:
        cwde
        call randomd0
        test ax, ax
        jne short .55
        mov edx, ecx
        mov eax, esi
        call FallDown
        mov eax, dword [dword ecx+088h]
        movsx edx, word [byte eax+026h]
        cmp edx, byte 2
        jle short .58
        mov eax, dword [dword esi+088h]
        add edx, edx
        movsx eax, word [byte eax+026h]
        cmp edx, eax
        jle short .58
        cmp byte [PenBuf], 0
        jg short .58
        movsx eax, word [byte ecx+038h]
        cmp eax, SPAstumble
        je short .58
        cmp eax, SPAinjury1
        je short .58
        mov eax, 47h
        call PlaySfx
        leave
        pop edi
        pop esi
        pop ecx
        ret
.55:
        mov edx, ecx
        mov eax, esi
        call FallDown
.56:
        inc byte [byte ebp-04h]
        mov eax, ecx
        mov ecx, esi
        mov esi, eax
.57:
        movsx eax, byte [byte ebp-04h]
        cmp eax, byte 2
        jl near .1
.58:
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; checkgoalp                       3F212  94G collide94.asm, medium confidence
; Collision of a player with a goal net; entered from checkgoal
;-----------------------------------------------------------------------------
checkgoalp:
        push esi
        push edi
        enter 10h, 0
        mov esi, eax
        movsx eax, word [wcradiusx]
        cmp eax, byte 1
        jne short .1
        mov eax, dword [puckc]
        movsx ax, byte [eax]
        cmp ax, word [dword esi+086h]
        jne short .1
        cmp word [byte esi+01Ah], byte 0
        jle short .1
        mov eax, 1
        jmp short .2
.1:
        xor eax, eax
.2:
        mov dword [byte ebp-04h], eax
        movsx eax, word [dword esi+086h]
        cmp eax, byte 0Bh
        jle short .3
        cmp eax, byte 10h
        jne near .22
.3:
        movsx eax, word [dword edx+086h]
        sub cx, word [byte edx+06h]
        cmp eax, byte 0Ch
        jne short .4
        mov eax, 8
        jmp short .5
.4:
        mov eax, 0FFFFFFF8h
.5:
        movsx ecx, cx
        sub bx, word [byte edx+02h]
        sub ecx, eax
        test bx, bx
        jge short .6
        movsx eax, bx
        neg eax
        jmp short .7
.6:
        movsx eax, bx
.7:
        movsx edi, word [wcradiusx]
        add edi, byte 0Ch
        cmp eax, edi
        jg near .22
        cmp dword [byte ebp-04h], byte 0
        je short .8
        movsx eax, word [dword edx+086h]
        cmp eax, byte 0Ch
        sete al
        movzx eax, al
        mov dword [byte ebp-010h], eax
        test cx, cx
        setl al
        movzx eax, al
        xor eax, dword [byte ebp-010h]
        jne short .8
        mov al, byte [byte esi+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        jne short .11
        mov al, byte [byte esi+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov dword [byte ebp-08h], eax
        movsx eax, word [dword edx+086h]
        cmp eax, byte 0Ch
        sete al
        movzx eax, al
        xor eax, dword [byte ebp-08h]
        je short .11
.8:
        test cx, cx
        jge short .10
        movsx eax, cx
        neg eax
.9:
        movsx edi, word [wcradiusy]
        add edi, byte 6
        jmp short .16
.10:
        movsx eax, cx
        jmp short .9
.11:
        test bx, bx
        jge short .12
        movsx eax, bx
        neg eax
        jmp short .13
.12:
        movsx eax, bx
.13:
        movsx edi, word [wcradiusx]
        add edi, byte 0Ah
        cmp eax, edi
        jg short .8
        test cx, cx
        jge short .14
        movsx eax, cx
        neg eax
        jmp short .15
.14:
        movsx eax, cx
.15:
        movsx edi, word [wcradiusy]
        inc edi
.16:
        cmp eax, edi
        jg near .22
        movsx eax, bx
        imul eax, eax
        mov dword [byte ebp-0Ch], eax
        movsx eax, cx
        imul eax, eax
        mov word [regd0], cx
        mov word [regd1], bx
        add eax, dword [byte ebp-0Ch]
        neg word [regd0]
        cmp eax, 169h
        jg near .22
        movsx eax, word [dword esi+086h]
        cmp eax, byte 10h
        je short .17
        mov eax, esi
        call CheckBump
        test ax, ax
        jne near .22
.17:
        movsx eax, cx
        push eax
        movsx eax, bx
        push eax
        call vecdist
        mov ecx, eax
        movsx eax, word [regd0]
        inc ecx
        shl eax, 8
        movzx ebx, cx
        cdq
        idiv ebx
        mov word [regd0], ax
        cwde
        add esp, byte 8
        cmp eax, 0FFh
        jle short .18
        mov word [regd0], 0FFh
.18:
        movsx eax, word [regd0]
        cmp eax, 0FFFFFF01h
        jge short .19
        mov word [regd0], 0FF01h
.19:
        movsx eax, word [regd1]
        shl eax, 8
        movzx ebx, cx
        cdq
        idiv ebx
        mov word [regd1], ax
        cwde
        cmp eax, 0FFh
        jle short .20
        mov word [regd1], 0FFh
.20:
        movsx eax, word [regd1]
        cmp eax, 0FFFFFF01h
        jge short .21
        mov word [regd1], 0FF01h
.21:
        mov eax, esi
        mov dword [nethit], 1
        call wallcoll
.22:
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; checkint                         3F44A  94G collide94.asm, medium confidence
; Interference penalty: a checkagr-style roll with randomd0, then AddPenalty
; and FallDown; called from checkcx
;-----------------------------------------------------------------------------
checkint:
        push ebx
        push ecx
        push esi
        enter 4, 0
        mov ebx, eax
        mov ecx, edx
        movsx eax, word [byte eax+038h]
        cmp eax, SPAburst
        je short .1
        cmp eax, SPAcheckskate
        jne short .2
.1:
        mov esi, 1
        jmp short .3
.2:
        xor esi, esi
.3:
        mov byte [byte ebp-04h], 0
        jmp near .15
.4:
        cmp word [byte ecx+01Ah], byte 0
        jne near .14
        movsx eax, word [dword ebx+086h]
        cmp eax, byte 10h
        je near .14
        mov ax, word [byte ecx+048h]
        xor ah, ah
        and al, 4
        cwde
        test eax, eax
        jne near .14
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .14
        mov eax, dword [puckc]
        movsx ax, byte [eax]
        cmp ax, word [dword ebx+086h]
        je short .7
        test esi, esi
        je short .5
        mov eax, 0Fh
        jmp short .6
.5:
        mov eax, 19h
.6:
        movsx edx, word [byte ebx+018h]
        cmp edx, eax
        jle near .14
.7:
        movsx eax, word [byte ebx+018h]
        cmp eax, byte 2
        jle near .14
        mov edx, ebx
        mov eax, ecx
        call FallDown
        movsx edx, word [lastimpact]
        cmp edx, byte 8
        jl near .14
        mov eax, dword [puckc]
        movsx ax, byte [eax]
        cmp ax, word [dword ebx+086h]
        jne short .8
        cmp edx, byte 0Ah
        jl near .14
.8:
        cmp word [byte ecx+06h], byte 0
        jge short .9
        movsx eax, word [byte ecx+06h]
        neg eax
        jmp short .10
.9:
        movsx eax, word [byte ecx+06h]
.10:
        cmp eax, 0A0h
        jl near .14
        movsx eax, word [dword ebx+086h]
        cmp eax, byte 10h
        je near .14
        movsx edx, byte [byte ebx+047h]
        mov eax, dword [dword ebx+088h]
        add edx, edx
        movsx eax, word [dword edx+eax+080h]
        cmp eax, byte 0FFFFFFFDh
        jle short .14
        test esi, esi
        je short .11
        mov eax, 14h
        jmp short .12
.11:
        mov eax, 1Eh
.12:
        movsx edx, word [byte ecx+018h]
        cmp edx, eax
        jle short .14
        mov al, byte [byte ebx+045h]
        and al, 10h
        movzx eax, al
        test eax, eax
        jne short .14
        test esi, esi
        jne short .13
        mov edx, 14h
        movzx ax, byte [byte ebx+062h]
        sub edx, eax
        movsx eax, dx
        call randomd0
        cwde
        cmp eax, byte 2
        jg short .14
.13:
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne short .14
        mov edx, 11h
        mov eax, ebx
        call AddPenalty
.14:
        inc byte [byte ebp-04h]
        mov eax, ebx
        mov ebx, ecx
        mov ecx, eax
.15:
        movsx eax, byte [byte ebp-04h]
        cmp eax, byte 2
        jl near .4
        leave
        pop esi
        pop ecx
        pop ebx
        ret
