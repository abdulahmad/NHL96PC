; Fights: the hit check, fighting and watching the fight.
bits 32
%include "hockey.inc"
%include "spa.inc"
section s_36F55 progbits alloc exec nowrite align=1
extern assrefgoalpa_83F, CheckHitAnims, Crowdlevel, CrowdReaction, CwdExciteLvl, donothing, FightAnimTab, PenBuf
extern PenBuf_pl, PenCntDwn, PlaySfx, puckc, randomd0, regd0, regd1, SetSPA
extern sfx, skateto, SortCords, SwapPosition_91, updateanim, vecdist, vtoa, xc1
extern yc1
global chkhit, assfight, assfwatch
;-----------------------------------------------------------------------------
; chkhit                                         36F55  93G, medium confidence
; Called only from assfight: acts when the animation frame changes, crowd and
; sfx on a hit
;-----------------------------------------------------------------------------
chkhit:
        push ebx
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov ebx, eax
        mov ecx, edx
        movsx esi, word [byte eax+038h]
        movsx edi, word [byte eax+03Ah]
        cmp word [byte eax+038h], byte 0
        je near SwapPosition_91
        lea eax, [esi+edi]
        movsx eax, word [nosplit eax*2+CheckHitAnims]
        test eax, eax
        jge short .1
        neg eax
.1:
        movsx edx, word [byte ebx+SPAcnt]
        cmp eax, edx
        jne near SwapPosition_91
        cmp esi, 46Bh
        jne short .4
        cmp edi, byte 0Ah
        jne short .4
        and byte [byte ebx+pflags2], 0DFh
        movsx eax, word [xc1]
        cmp eax, byte 5Ah
        jle short .2
        mov eax, 5Ah
.2:
        cmp eax, byte 0FFFFFFA6h
        jge short .3
        mov eax, 0FFFFFFA6h
.3:
        shl eax, 2
        test eax, eax
        jmp near SwapPosition_91
.4:
        cmp esi, 4B1h
        jne short .5
        mov dword [byte ebp-04h], 14h
        jmp short .7
.5:
        cmp esi, 4CBh
        jne short .6
        mov dword [byte ebp-04h], 11h
        jmp short .7
.6:
        mov dword [byte ebp-04h], 16h
.7:
        movsx eax, word [byte ebx+Xpos+2]
        mov dword [byte ebp-0Ch], eax
        mov edx, dword [byte ebp-0Ch]
        movsx eax, word [byte ecx+Xpos+2]
        sub edx, eax
        mov eax, edx
        test edx, edx
        jge short .8
        neg eax
.8:
        cmp eax, dword [byte ebp-04h]
        jg short .10
        movsx eax, word [byte ebx+Ypos+2]
        movsx edx, word [byte ecx+Ypos+2]
        sub eax, edx
        test eax, eax
        jge short .9
        neg eax
.9:
        cmp eax, byte 8
        jle near .17
.10:
        cmp esi, 57Fh
        je short .11
        cmp esi, 5B7h
        jne short .12
.11:
        cmp edi, byte 4
        jne short .12
        mov word [byte ebx+SPA], SPAfgrabend
        or byte [byte ebx+pflags2], 2
        jmp short .13
.12:
        cmp esi, SPAfswing
        jne short .13
        cmp edi, byte 2
        jne short .13
        mov edx, SPAfightstance
        mov eax, ebx
        and byte [byte ebx+pflags2], 0FDh
        call SetSPA
        mov eax, ebx
        call updateanim
.13:
        cmp esi, 4B1h
        jne short .14
        cmp edi, byte 8
        je short .15
.14:
        cmp esi, 4CBh
        jne near SwapPosition_91
        cmp edi, byte 2
        jne near SwapPosition_91
.15:
        mov eax, 28h
.16:
        call PlaySfx
        jmp near SwapPosition_91
.17:
        cmp esi, 57Fh
        je short .18
        cmp esi, 5B7h
        jne near .24
.18:
        cmp edi, byte 4
        jne near .24
        cmp esi, 57Fh
        jne short .19
        mov eax, 595h
        jmp short .20
.19:
        mov eax, SPAfheld2
.20:
        movsx edx, ax
        mov eax, ecx
        call SetSPA
        mov ax, word [dword ecx+SCnum]
        or byte [byte ecx+pflags2], 2
        cmp ax, word [dword ebx+SCnum]
        jge short .21
        mov eax, ecx
        call updateanim
.21:
        cmp esi, 57Fh
        mov eax, 78h
        mov dword [byte ebx+06Eh], eax
        mov eax, 0FFFFFF88h
        mov dword [byte ecx+06Eh], eax
        movsx eax, word [byte ecx+facedir]
        cmp eax, byte 2
        jne short .22
        mov eax, 0FFFFFFECh
        jmp short .23
.22:
        mov eax, 14h
.23:
        movsx edx, word [byte ebx+Xpos+2]
        add eax, edx
        mov word [byte ecx+Xpos+2], ax
.24:
        cmp esi, 5A3h
        jne short .25
        cmp edi, byte 4
        je short .26
.25:
        cmp esi, 5CBh
        jne near .37
        cmp edi, byte 6
        jne near .37
.26:
        add word [Crowdlevel], byte 50h
        add word [CwdExciteLvl], byte 0Ah
        dec word [byte ecx+temp3]
        cmp word [byte ecx+temp3], byte 0
        jge near .35
        xor eax, eax
.27:
        movsx edx, byte [dword eax+PenBuf]
        cmp edx, byte 20h
        jne short .28
        movsx dx, byte [dword eax+PenBuf_pl]
        cmp dx, word [dword ebx+SCnum]
        jne short .28
        mov byte [dword eax+PenBuf], 21h
        jmp short .29
.28:
        inc eax
        inc eax
        cmp eax, byte 40h
        jl short .27
.29:
        mov word [PenCntDwn], 3Ch
        mov word [byte ebx+temp3], 0FFFFh
        add word [Crowdlevel], 258h
        add word [CwdExciteLvl], byte 1Eh
        mov dword [byte ecx+06Eh], 0
        mov eax, dword [byte ecx+06Eh]
        mov dword [byte ebx+06Eh], eax
        or byte [byte ecx+pflags], 20h
        cmp esi, 5A3h
        jne short .30
        mov eax, 4F7h
        jmp short .31
.30:
        mov eax, SPAffall
.31:
        movsx edx, ax
        mov eax, ecx
        call SetSPA
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne short .32
        mov eax, 7Fh
        call CrowdReaction
.32:
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne short .33
        mov eax, 0Bh
        jmp short .34
.33:
        mov eax, 5
.34:
        call sfx
        mov edx, SPAfwin
        mov eax, ebx
        or byte [byte ebx+pflags], 20h
        call SetSPA
        mov eax, ebx
        call updateanim
        jmp short .36
.35:
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne short .36
        mov eax, 2
        call sfx
.36:
        cmp esi, 5A3h
        sete al
        movzx eax, al
        add eax, byte 26h
        jmp near .16
.37:
        cmp esi, 4B1h
        jne short .38
        cmp edi, byte 8
        je short .39
.38:
        cmp esi, 4CBh
        jne near .56
        cmp edi, byte 2
        jne near .56
.39:
        add word [Crowdlevel], byte 50h
        add word [CwdExciteLvl], byte 0Ah
        cmp esi, 4CBh
        jne short .40
        mov edi, 64h
        jmp short .41
.40:
        mov edi, 0FAh
.41:
        movsx eax, word [byte ebx+temp3]
        add eax, byte 5
        imul edi, eax
        movsx edx, word [byte ecx+facedir]
        lea eax, [byte ecx+0Ch]
        cmp edx, byte 2
        jne short .42
        mov dword [byte ebp-08h], edi
        neg dword [byte ebp-08h]
        jmp short .43
.42:
        mov dword [byte ebp-08h], edi
.43:
        movsx edi, word [eax]
        add edi, dword [byte ebp-08h]
        mov word [eax], di
        mov word [byte ebx+Xvel], 0
        or byte [byte ecx+pflags2], 2
        dec word [byte ecx+temp3]
        cmp word [byte ecx+temp3], byte 0
        jge near .51
        xor eax, eax
.44:
        movsx edx, byte [dword eax+PenBuf]
        cmp edx, byte 20h
        jne short .45
        movsx dx, byte [dword eax+PenBuf_pl]
        cmp dx, word [dword ebx+SCnum]
        jne short .45
        mov byte [dword eax+PenBuf], 21h
        jmp short .46
.45:
        inc eax
        inc eax
        cmp eax, byte 40h
        jl short .44
.46:
        mov word [PenCntDwn], 3Ch
        mov word [byte ebx+temp3], 0FFFFh
        add word [Crowdlevel], 258h
        add word [CwdExciteLvl], byte 1Eh
        or byte [byte ecx+pflags], 20h
        cmp esi, 4B1h
        jne short .47
        mov eax, 4D9h
        jmp short .48
.47:
        mov eax, SPAffall2
.48:
        movsx edx, ax
        mov eax, ecx
        call SetSPA
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne short .49
        mov eax, 7Fh
        call CrowdReaction
.49:
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne short .50
        mov eax, 0Bh
        jmp short .54
.50:
        mov eax, 5
        jmp short .54
.51:
        cmp esi, 4B1h
        jne short .52
        mov edx, SPAfhith
        jmp short .53
.52:
        mov edx, SPAfhitl
.53:
        mov eax, ecx
        call SetSPA
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne short .55
        mov eax, 2
.54:
        call sfx
.55:
        cmp esi, 4B1h
        sete al
        movzx eax, al
        add eax, byte 25h
        jmp near .16
.56:
        cmp esi, 55Bh
        jne near SwapPosition_91
        cmp edi, byte 2
        jne near SwapPosition_91
        mov edx, SPAfswinghit
        mov eax, ecx
        or byte [byte ecx+pflags2], 2
        call SetSPA
        mov ax, word [dword ecx+SCnum]
        cmp ax, word [dword ebx+SCnum]
        jge near SwapPosition_91
        mov eax, ecx
        call updateanim
        jmp near SwapPosition_91
;-----------------------------------------------------------------------------
; assfight                                                          37410  93G
; Assignment table slot 31h, the assignment checkfight_sf inserts;
; PenCntDwn < 0 ends it; calls chkhit
;-----------------------------------------------------------------------------
assfight:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov esi, eax
        movsx eax, word [byte eax+038h]
        cmp dword [byte esi+06Eh], byte 0
        jle short .1
        dec dword [byte esi+06Eh]
        jmp short .2
.1:
        jge short .2
        inc dword [byte esi+06Eh]
.2:
        mov dl, byte [byte esi+pflags]
        and dl, 20h
        movzx edx, dl
        test edx, edx
        jne near assrefgoalpa_83F
        cmp word [PenCntDwn], byte 0
        jge near .8
        movsx edx, word [byte esi+SPA]
        cmp edx, SPAfightdrop
        je near .8
        cmp dword [byte esi+06Eh], byte 0
        je short .6
        cmp eax, SPAfhighl
        je short .3
        cmp eax, 5CBh
        je short .3
        cmp eax, 5ADh
        je short .3
        cmp eax, 5D7h
        jne short .4
.3:
        or byte [byte esi+pflags], 20h
        jmp near assrefgoalpa_83F
.4:
        cmp eax, SPAfwin
        je short .5
        mov edx, SPAfight
        mov eax, esi
        call SetSPA
.5:
        mov dword [byte esi+06Eh], 0
        jmp short .7
.6:
        cmp eax, 55Bh
        je short .3
        cmp eax, 56Dh
        je short .3
.7:
        mov eax, esi
        call donothing
        jmp near assrefgoalpa_83F
.8:
        mov al, byte [byte esi+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .12
        mov eax, dword [dword esi+tmptr]
        movsx edx, byte [byte esi+pnum]
        and byte [byte esi+pflags], 0FDh
        movsx edx, word [byte eax+edx*2+tmpde]
        mov al, byte [byte esi+fighting]
        and al, 7
        movzx eax, al
        add eax, byte 8
        imul edx, eax
        sar edx, 0Ch
        cmp edx, byte 5
        jge short .9
        mov edx, 5
.9:
        mov word [byte esi+temp2], 0
        movsx eax, word [byte esi+facedir]
        mov word [byte esi+temp3], dx
        cmp eax, byte 2
        jne short .10
        mov eax, 5Ah
        jmp short .11
.10:
        mov eax, 0FFFFFFFFh
.11:
        mov dword [byte esi+076h], 0
        mov dword [byte esi+06Eh], 0
        mov word [byte esi+temp4], ax
.12:
        movsx eax, word [byte esi+impactp]
        imul eax, dword 0A0h
        mov edi, SortCords
        add edi, eax
        cmp word [byte esi+temp3], byte 0
        jge short .13
        cmp word [byte esi+SPA], byte 0
        jne near assrefgoalpa_83F
        mov edx, SPAfight
        mov eax, esi
        call SetSPA
        jmp near assrefgoalpa_83F
.13:
        movsx edx, word [byte esi+Xpos+2]
        movsx eax, word [byte edi+Xpos+2]
        add eax, edx
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov word [xc1], ax
        mov al, byte [byte esi+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        jne near .41
        mov al, byte [byte esi+pflags2]
        and al, 2
        movzx eax, al
        test eax, eax
        jne near .41
        cmp dword [byte esi+06Eh], byte 0
        jle near .22
        movsx eax, word [byte esi+frame]
        cmp eax, 0BE9h
        jl short .14
        cmp eax, 0BEAh
        jle short .15
.14:
        movsx eax, word [byte esi+frame]
        cmp eax, 0C03h
        jl short .16
        cmp eax, 0C0Eh
        jg short .16
.15:
        mov eax, 1
        jmp short .17
.16:
        xor eax, eax
.17:
        mov ebx, eax
        test eax, eax
        je short .18
        mov eax, 5A3h
        jmp short .19
.18:
        mov eax, SPAflowl
.19:
        movsx edx, ax
        mov eax, esi
        call SetSPA
        mov eax, esi
        or byte [byte esi+pflags2], 2
        call updateanim
        xor edx, edx
        mov eax, edi
        call SetSPA
        test ebx, ebx
        je short .20
        mov eax, 5ADh
        jmp short .21
.20:
        mov eax, SPAflowr
.21:
        movsx edx, ax
        mov eax, edi
        call SetSPA
        mov ax, word [dword edi+SCnum]
        or byte [byte edi+pflags2], 2
        cmp ax, word [dword esi+SCnum]
        jge near .50
        mov eax, edi
        call updateanim
        jmp near .50
.22:
        jge short .28
.23:
        movsx eax, word [byte edi+frame]
        cmp eax, 0BE9h
        jl short .24
        cmp eax, 0BEAh
        jle short .25
.24:
        movsx eax, word [byte edi+frame]
        cmp eax, 0C03h
        jl short .27
        cmp eax, 0C0Eh
        jg short .27
.25:
        mov eax, 59Fh
.26:
        movsx edx, ax
        jmp near .49
.27:
        mov eax, 5C7h
        jmp short .26
.28:
        movsx edx, word [byte esi+Xpos+2]
        movsx eax, word [byte edi+Xpos+2]
        sub edx, eax
        movsx eax, word [byte esi+Xvel]
        sar eax, 8
        add edx, eax
        movsx eax, word [byte edi+Xvel]
        sar eax, 8
        sub edx, eax
        mov eax, edx
        test edx, edx
        jge short .29
        neg eax
.29:
        mov ecx, eax
        cmp eax, byte 14h
        jg short .35
        mov eax, 0Dh
        call randomd0
        movsx edx, ax
        cmp edx, byte 6
        jle short .30
        inc edx
        and edx, byte 3
.30:
        cmp edx, byte 4
        jne short .32
        movsx eax, word [byte esi+Xpos+2]
        movsx ebx, word [byte edi+Xpos+2]
        sub eax, ebx
        test eax, eax
        jge short .31
        neg eax
.31:
        cmp eax, byte 10h
        jge short .32
        mov edx, 1
.32:
        cmp ecx, byte 10h
        jle short .34
        cmp edx, byte 1
        je short .33
        cmp edx, byte 3
        jne short .34
.33:
        xor edx, edx
.34:
        mov eax, esi
        movsx edx, word [nosplit edx*4+FightAnimTab]
        call SetSPA
        or byte [byte esi+pflags2], 2
        jmp near .50
.35:
        cmp word [byte esi+Xvel], byte 0
        jge short .36
        movsx eax, word [byte esi+Xvel]
        neg eax
        jmp short .37
.36:
        movsx eax, word [byte esi+Xvel]
.37:
        cmp eax, 3E8h
        jle short .40
        movsx eax, word [byte esi+facedir]
        cmp eax, byte 2
        sete al
        movzx eax, al
        cmp word [byte esi+Xvel], byte 0
        setl dl
        movzx edx, dl
        xor eax, edx
        je short .39
.38:
        mov edx, 495h
        jmp near .49
.39:
        mov edx, 4A3h
        jmp near .49
.40:
        mov edx, 483h
        jmp near .49
.41:
        mov al, byte [byte esi+pflags2]
        and al, 2
        movzx eax, al
        test eax, eax
        jne near .50
        cmp dword [byte esi+06Eh], byte 0
        jle short .45
        movsx eax, word [byte esi+frame]
        cmp eax, 0BE9h
        jl short .42
        cmp eax, 0BEAh
        jle short .43
.42:
        movsx eax, word [byte esi+frame]
        cmp eax, 0C03h
        jl short .44
        cmp eax, 0C0Eh
        jg short .44
.43:
        mov eax, 59Bh
        jmp near .26
.44:
        mov eax, 5C3h
        jmp near .26
.45:
        jl near .23
        cmp word [byte esi+Xvel], byte 0
        jge short .46
        movsx eax, word [byte esi+Xvel]
        neg eax
        jmp short .47
.46:
        movsx eax, word [byte esi+Xvel]
.47:
        cmp eax, 3E8h
        jle short .48
        movsx eax, word [byte esi+facedir]
        cmp eax, byte 2
        sete al
        movzx eax, al
        mov edx, eax
        cmp word [byte esi+Xvel], byte 0
        setl al
        movzx eax, al
        xor eax, edx
        jne near .38
        jmp near .39
.48:
        mov edx, SPAfightstance
.49:
        mov eax, esi
        call SetSPA
.50:
        mov edx, edi
        mov eax, esi
        call chkhit
        movsx eax, word [byte esi+SPA]
        cmp eax, SPAfswinghit
        je short .51
        cmp eax, SPAfightdrop
        je near .66
        cmp dword [byte esi+06Eh], byte 0
        jl near .66
        mov al, byte [byte esi+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        jne near .66
.51:
        cmp dword [byte esi+06Eh], byte 0
        jle short .54
        movsx edx, word [byte esi+facedir]
        lea eax, [byte esi+0Ch]
        cmp edx, byte 2
        jne short .52
        movsx edx, word [xc1]
        sub edx, byte 0Ah
        jmp short .53
.52:
        movsx edx, word [xc1]
        add edx, byte 0Ah
.53:
        movsx ebx, word [byte esi+Xpos+2]
        sub edx, ebx
        mov ebx, edx
        shl ebx, 3
        jmp near .65
.54:
        movsx eax, word [byte esi+SPA]
        cmp eax, SPAfhitl
        je short .55
        cmp eax, SPAfhith
        jne short .57
.55:
        movsx edx, word [byte esi+facedir]
        lea eax, [byte esi+0Ch]
        cmp edx, byte 2
        jne short .56
        movsx edx, word [xc1]
        sub edx, byte 14h
        jmp short .53
.56:
        movsx edx, word [xc1]
        add edx, byte 14h
        jmp short .53
.57:
        cmp eax, 4B1h
        jne short .58
        movsx eax, word [byte esi+SPAnum]
        cmp eax, byte 8
        jge short .59
.58:
        movsx eax, word [byte esi+SPA]
        cmp eax, SPAflow
        jne short .62
        movsx eax, word [byte esi+SPAnum]
        cmp eax, byte 2
        jl short .62
.59:
        movsx edx, word [byte esi+facedir]
        lea eax, [byte esi+0Ch]
        cmp edx, byte 2
        jne short .60
        movsx edx, word [xc1]
        sub edx, byte 8
        jmp short .61
.60:
        movsx edx, word [xc1]
        add edx, byte 8
.61:
        movsx ebx, word [byte esi+Xpos+2]
        sub edx, ebx
        mov ebx, edx
        shl ebx, 2
        jmp short .65
.62:
        movsx edx, word [byte esi+facedir]
        lea eax, [byte esi+0Ch]
        cmp edx, byte 2
        jne short .63
        movsx edx, word [xc1]
        sub edx, byte 8
        jmp short .64
.63:
        movsx edx, word [xc1]
        add edx, byte 8
.64:
        movsx ebx, word [byte esi+Xpos+2]
        sub edx, ebx
        mov ebx, edx
        shl ebx, 3
.65:
        movsx edx, word [eax]
        add edx, ebx
        mov word [eax], dx
        cmp dword [byte esi+06Eh], byte 0
        jle short .66
        mov ax, word [byte esi+Xvel]
        mov word [byte edi+Xvel], ax
.66:
        cmp dword [byte esi+06Eh], byte 0
        jge near .83
        movsx eax, word [byte esi+facedir]
        cmp eax, byte 2
        jne short .67
        mov eax, 0FFFFFFECh
        jmp short .68
.67:
        mov eax, 14h
.68:
        movsx edx, word [byte edi+Xpos+2]
        add eax, edx
        movsx edx, word [byte esi+Ypos+2]
        cmp eax, 0FFFFFF60h
        jl near .77
        cmp eax, 0A0h
        jg near .77
        test edx, edx
        jge short .69
        mov ebx, edx
        neg ebx
        jmp short .70
.69:
        mov ebx, edx
.70:
        cmp ebx, 150h
        jle near .80
        test eax, eax
        jge short .71
        mov ebx, eax
        neg ebx
        jmp short .72
.71:
        mov ebx, eax
.72:
        cmp ebx, byte 6Ah
        jle near .80
        test edx, edx
        jge short .73
        mov ebx, 0FFFFFEB0h
        jmp short .74
.73:
        mov ebx, 150h
.74:
        sub edx, ebx
        push edx
        test eax, eax
        jge short .75
        mov edx, 0FFFFFF96h
        jmp short .76
.75:
        mov edx, 6Ah
.76:
        sub eax, edx
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, byte 36h
        jbe short .80
.77:
        mov word [byte edi+Xvel], 0
        mov ax, word [byte edi+Xvel]
        mov word [byte esi+Xvel], ax
        mov ax, word [dword esi+OldXpos+2]
        mov word [byte esi+Xpos+2], ax
        movsx eax, word [byte esi+facedir]
        cmp eax, byte 2
        jne short .78
        mov eax, 14h
        jmp short .79
.78:
        mov eax, 0FFFFFFECh
.79:
        movsx edx, word [byte esi+Xpos+2]
        add eax, edx
        mov word [byte edi+Xpos+2], ax
        mov word [dword edi+OldXpos+2], ax
        jmp short .83
.80:
        movsx eax, word [byte esi+facedir]
        cmp eax, byte 2
        jne short .81
        mov eax, 0FFFFFFECh
        jmp short .82
.81:
        mov eax, 14h
.82:
        movsx edx, word [byte edi+Xpos+2]
        add eax, edx
        mov word [byte esi+Xpos+2], ax
.83:
        cmp dword [byte esi+06Eh], byte 0
        jne short .86
        movsx eax, word [byte esi+Xpos+2]
        movsx edx, word [byte edi+Xpos+2]
        sub eax, edx
        test eax, eax
        jge short .84
        neg eax
.84:
        cmp eax, byte 0Ah
        jge short .86
        movsx eax, word [byte esi+facedir]
        cmp eax, byte 2
        jne short .85
        movsx eax, word [byte esi+Xvel]
        cmp eax, 0FFFFFE70h
        jle short .86
        mov word [byte esi+Xvel], 0FE70h
        jmp short .86
.85:
        movsx eax, word [byte esi+Xvel]
        cmp eax, 190h
        jge short .86
        mov word [byte esi+Xvel], 190h
.86:
        movsx eax, word [yc1]
        movsx edx, word [byte esi+Ypos+2]
        sub eax, edx
        mov edx, eax
        shl edx, 8
        cmp edx, 1000h
        jle short .87
        mov edx, 1000h
.87:
        cmp edx, 0FFFFF000h
        jge short .88
        mov edx, 0FFFFF000h
.88:
        mov word [byte esi+Yvel], dx
        jmp near assrefgoalpa_83F
;-----------------------------------------------------------------------------
; assfwatch                                                         37AA5  93G
; Assignment table slot 32h, the assignment checkfight gives every other
; player: watch the fight
;-----------------------------------------------------------------------------
assfwatch:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .53
        mov al, byte [byte ebx+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je near .11
        and byte [byte ebx+pflags], 0FDh
        mov eax, dword [puckc]
        movsx dx, byte [eax]
        cmp dx, word [dword ebx+SCnum]
        jne short .1
        mov byte [eax], 0FFh
        mov word [byte ebx+nopuck], 78h
.1:
        mov word [byte ebx+temp2], 8
        cmp word [yc1], byte 0
        jge short .2
        movsx eax, word [yc1]
        neg eax
        jmp short .3
.2:
        movsx eax, word [yc1]
.3:
        cmp eax, byte 74h
        jle short .6
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne short .4
        mov eax, 0FFFFFFC6h
        jmp short .5
.4:
        mov eax, 3Ah
.5:
        mov word [byte ebx+temp4], ax
        mov eax, 5
        mov edx, 2
        call randomd0
        sub edx, eax
        imul eax, edx, byte 0Fh
        mov word [byte ebx+temp3], 0FF4Eh
        add word [byte ebx+temp4], ax
        jmp short .10
.6:
        mov al, byte [byte ebx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .7
        mov eax, 0FFFFFF6Ch
        jmp short .8
.7:
        mov eax, 94h
.8:
        mov word [byte ebx+temp4], ax
        mov eax, 0Ch
        call randomd0
        sub eax, byte 6
        add word [byte ebx+temp4], ax
        mov ax, word [byte ebx+temp4]
        cmp ax, word [byte ebx+Ypos+2]
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
        je short .9
        mov ax, word [byte ebx+Ypos+2]
        mov word [byte ebx+temp4], ax
.9:
        mov ax, word [byte ebx+Xpos+2]
        mov word [byte ebx+temp3], ax
.10:
        mov word [byte ebx+temp1], 0
        mov word [byte ebx+temp5], 0
        cmp word [byte ebx+position], byte 0
        jne short .11
        or byte [byte ebx+048h], 3
.11:
        movsx eax, word [byte ebx+temp1]
        cmp eax, byte 64h
        je near .47
        movsx edx, word [byte ebx+Ypos+2]
        movsx eax, word [byte ebx+temp4]
        sub edx, eax
        mov eax, edx
        mov dx, word [byte ebx+Xpos+2]
        sub dx, word [byte ebx+temp3]
        mov word [regd0], dx
        dec word [byte ebx+temp1]
        cmp word [byte ebx+temp1], byte 0
        jge near .29
        add word [byte ebx+temp1], byte 8
        cmp word [regd0], byte 0
        jge short .12
        movsx edx, word [regd0]
        neg edx
        jmp short .13
.12:
        movsx edx, word [regd0]
.13:
        cmp edx, byte 28h
        jge short .14
        sar word [byte ebx+Xvel], 1
.14:
        test eax, eax
        jge short .15
        mov edx, eax
        neg edx
        jmp short .16
.15:
        mov edx, eax
.16:
        cmp edx, byte 28h
        jge short .17
        sar word [byte ebx+Yvel], 1
.17:
        test eax, eax
        jge short .18
        mov edx, eax
        neg edx
        jmp short .19
.18:
        mov edx, eax
.19:
        cmp edx, byte 18h
        jg near .29
        cmp word [regd0], byte 0
        jge short .20
        movsx edx, word [regd0]
        neg edx
        jmp short .21
.20:
        movsx edx, word [regd0]
.21:
        cmp edx, byte 1Eh
        jg near .29
        mov word [byte ebx+Yvel], 0
        mov ax, word [byte ebx+Yvel]
        mov word [byte ebx+Xvel], ax
        cmp word [byte ebx+position], byte 0
        jne short .22
        mov eax, SPAgready2
        jmp short .23
.22:
        mov eax, 1
.23:
        mov word [regd1], ax
        movsx edx, ax
        mov eax, ebx
        call SetSPA
        mov ax, word [yc1]
        sub ax, word [byte ebx+Ypos+2]
        movsx edx, ax
        mov ax, word [xc1]
        sub ax, word [byte ebx+Xpos+2]
        cwde
        call vtoa
        cwde
        movsx edx, word [byte ebx+facedir]
        cmp edx, eax
        je short .26
        mov ecx, eax
        sub ecx, edx
        mov edx, ecx
        and edx, byte 7
        cmp edx, byte 4
        jge short .24
        mov edx, 1
        jmp short .25
.24:
        mov edx, 0FFFFFFFFh
.25:
        movsx ecx, word [byte ebx+facedir]
        add edx, ecx
        and edx, byte 7
        mov word [byte ebx+facedir], dx
.26:
        movsx edx, word [byte ebx+facedir]
        cmp edx, eax
        jne near .53
        mov word [byte ebx+temp1], 64h
        cmp word [byte ebx+position], byte 0
        jne short .27
        mov eax, SPAgready2
        jmp short .28
.27:
        mov eax, 1
.28:
        movsx edx, ax
        mov eax, ebx
        call SetSPA
        pop edx
        pop ecx
        pop ebx
        ret
.29:
        test eax, eax
        jge short .30
        neg eax
.30:
        cmp eax, byte 18h
        jg short .33
        cmp word [regd0], byte 0
        jge short .31
        movsx eax, word [regd0]
        neg eax
        jmp short .32
.31:
        movsx eax, word [regd0]
.32:
        cmp eax, byte 1Eh
        jle near .53
.33:
        mov ax, word [byte ebx+temp3]
        mov word [regd0], ax
        mov ax, word [byte ebx+temp4]
        mov word [regd1], ax
        movsx eax, word [yc1]
        movsx edx, word [byte ebx+Ypos+2]
        sub edx, eax
        mov eax, edx
        test edx, edx
        jge short .34
        neg eax
.34:
        cmp eax, byte 1Eh
        jl short .36
        movsx eax, word [yc1]
        movsx edx, word [byte ebx+Ypos+2]
        sub edx, eax
        mov eax, edx
        test edx, edx
        jge short .35
        neg eax
.35:
        cmp eax, byte 50h
        jge near .46
        movsx eax, word [yc1]
        movsx ecx, word [byte ebx+Ypos+2]
        movsx edx, word [regd1]
        sub ecx, eax
        sub edx, eax
        xor edx, ecx
        test edx, edx
        jge near .46
.36:
        movsx edx, word [xc1]
        movsx eax, word [byte ebx+Xpos+2]
        sub eax, edx
        test eax, eax
        jge short .37
        neg eax
.37:
        cmp eax, byte 3Ch
        jge near .46
        mov ax, word [byte ebx+temp4]
        cmp ax, word [yc1]
        jle short .38
        mov eax, 1Eh
        jmp short .39
.38:
        mov eax, 0FFFFFFE2h
.39:
        movsx edx, word [byte ebx+Ypos+2]
        add eax, edx
        mov word [regd1], ax
        mov ax, word [byte ebx+Xpos+2]
        cmp ax, word [xc1]
        jge short .40
        mov eax, 0FFFFFFB0h
        jmp short .41
.40:
        mov eax, 50h
.41:
        movsx edx, word [xc1]
        add eax, edx
        mov word [regd0], ax
        test ax, ax
        jge short .42
        cwde
        neg eax
        jmp short .43
.42:
        cwde
.43:
        cmp eax, 0AAh
        jle short .46
        mov ax, word [byte ebx+Xpos+2]
        cmp ax, word [xc1]
        jge short .44
        mov eax, 50h
        jmp short .45
.44:
        mov eax, 0FFFFFFB0h
.45:
        movsx edx, word [xc1]
        add eax, edx
        mov word [regd0], ax
.46:
        mov eax, ebx
        xor edx, edx
        call skateto
        pop edx
        pop ecx
        pop ebx
        ret
.47:
        cmp word [byte ebx+SPA], byte 0
        jne short .52
        cmp word [byte ebx+position], byte 0
        jne short .50
        mov eax, 2
        call randomd0
        test ax, ax
        je short .48
        mov eax, SPAgready
        jmp short .49
.48:
        mov eax, 6F7h
.49:
        movsx edx, ax
        jmp short .51
.50:
        mov edx, SPAstand
.51:
        mov eax, ebx
        call SetSPA
.52:
        mov ax, word [yc1]
        sub ax, word [byte ebx+Ypos+2]
        movsx edx, ax
        mov ax, word [xc1]
        sub ax, word [byte ebx+Xpos+2]
        cwde
        call vtoa
        mov word [byte ebx+facedir], ax
.53:
        pop edx
        pop ecx
        pop ebx
        ret
