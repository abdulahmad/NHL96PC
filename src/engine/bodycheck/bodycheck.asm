; Body checks: fall frames, net collisions, falling down and the check itself.
bits 32
%include "hockey.inc"
%include "spa.inc"
section s_41FDA progbits alloc exec nowrite align=1
extern AddPenalty, AddPenalty2, assexitjump, BlockShotDive_127, BreakGlass, CanRemovePlayer, checkagr, collflag
extern Crowdlevel, CwdExciteLvl, FallDownsOff, GameEventStub, GameHitCount, gameopts, GlassOn, gmode
extern lastimpact, NearestGlassPoint, PBnum, PenBuf, penshotctl, penshotplayer, PlaySfx, puckc
extern QuickShotChk, randomd0, setInjuryType, SetSPA, sflags, sfx, ShakeGlass, Stop4Pen
extern vecdist, vtoa
global FallFrameByDir, FallFrameByFacing, NetCollide, FallDown, Bcheck, holdcheck
;-----------------------------------------------------------------------------
; FallFrameByDir                                  41FDA  96 PC, low confidence
; Called from FallDown and NetCollide: picks one of four fall frames from the
; hit direction relative to facing
;-----------------------------------------------------------------------------
FallFrameByDir:
        push ecx
        movsx edx, word [byte eax+036h]
        mov ecx, edx
        sub ecx, ebx
        test cl, 1
        je short .1
        inc edx
        and edx, byte 7
        mov word [byte eax+036h], dx
.1:
        sub edx, ebx
        sar edx, 1
        and edx, byte 3
        jne short .2
        mov eax, 14Bh
        pop ecx
        ret
.2:
        cmp edx, byte 1
        jne short .4
        mov ax, word [byte eax+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        jne short .6
.3:
        mov eax, 17Fh
        pop ecx
        ret
.4:
        cmp edx, byte 2
        jne short .5
        mov eax, 131h
        pop ecx
        ret
.5:
        mov ax, word [byte eax+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        jne short .3
.6:
        mov eax, 165h
        pop ecx
        ret
;-----------------------------------------------------------------------------
; FallFrameByFacing                               4203B  96 PC, low confidence
; Called from FallDown: picks one of two fall frames from the facing
; direction
;-----------------------------------------------------------------------------
FallFrameByFacing:
        push ebx
        movsx ebx, word [byte eax+036h]
        cmp ebx, byte 1
        jl short .2
        cmp ebx, byte 3
        jg short .2
.1:
        mov eax, 199h
        pop ebx
        ret
.2:
        cmp ebx, byte 5
        jl short .3
        cmp ebx, byte 7
        jle short .4
.3:
        movsx eax, word [byte eax+036h]
        sub edx, eax
        inc edx
        inc edx
        and edx, byte 7
        cmp edx, byte 4
        jl short .1
.4:
        mov eax, 1ABh
        pop ebx
        ret
;-----------------------------------------------------------------------------
; NetCollide                                   42072  95 PC, medium confidence
; Player near a net (x +-60h.
;
; y +-0CAh): when inside the frame snaps the player to the net edge for his
; facing (FallDown_pinxl / CCBEC / CCBFC offset tables), stops him and returns
; the bump animation (0F0Fh / 0F55h / 0FE1h)
;-----------------------------------------------------------------------------
NetCollide:
        push ecx
        push esi
        push edi
        enter 14h, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-010h], ebx
        cmp word [byte eax+02h], byte 0
        jl short .1
        mov eax, 6Ah
        jmp short .2
.1:
        mov eax, 0FFFFFF96h
.2:
        movsx edx, word [byte esi+Xpos+2]
        sub edx, eax
        mov dword [byte ebp-04h], eax
        mov dword [byte ebp-0Ch], edx
        cmp word [byte esi+Ypos+2], byte 0
        jl short .3
        mov eax, 150h
        jmp short .4
.3:
        mov eax, 0FFFFFEB0h
.4:
        movsx edx, word [byte esi+Ypos+2]
        sub edx, eax
        push edx
        mov dword [byte ebp-08h], eax
        push dword [byte ebp-0Ch]
        mov dword [byte ebp-014h], edx
        call vecdist
        add esp, byte 8
        mov ecx, eax
        cmp eax, byte 36h
        setge al
        mov edx, dword [byte ebp-010h]
        movzx eax, al
        mov dword [edx], eax
        cmp ecx, byte 28h
        jl near .34
        mov eax, dword [byte ebp-0Ch]
        shl eax, 6
        cdq
        idiv ecx
        mov ebx, eax
        mov eax, dword [byte ebp-014h]
        shl eax, 6
        cdq
        idiv ecx
        test eax, eax
        jge short .5
        mov ecx, eax
        neg ecx
        jmp short .6
.5:
        mov ecx, eax
.6:
        test ebx, ebx
        jge short .7
        mov edx, ebx
        neg edx
        jmp short .8
.7:
        mov edx, ebx
.8:
        cmp ecx, edx
        jl near .22
        cmp dword [byte ebp-08h], byte 0
        jl near .16
        lea edx, [byte edi+02h]
        and edx, byte 7
        cmp edx, byte 5
        jl near .34
        mov edx, dword [byte ebp-04h]
        mov word [byte esi+Xvel], 0
        add edx, ebx
        mov word [byte esi+Xpos+2], dx
        mov edx, dword [byte ebp-08h]
        mov word [byte esi+Yvel], 0
        add edx, eax
        mov word [byte esi+Ypos+2], dx
        test ebx, ebx
        jge short .9
        neg ebx
.9:
        add ebx, ebx
        test eax, eax
        jge short .10
        neg eax
.10:
        cmp eax, ebx
        jge short .15
        lea eax, [byte esi+02h]
        cmp dword [byte ebp-04h], byte 0
        jge short .11
        mov edx, 0Bh
        jmp short .12
.11:
        mov edx, 0FFFFFFF5h
.12:
        movsx ebx, word [eax]
        add ebx, edx
        movsx edx, word [byte ebp-08h]
        mov word [eax], bx
        movsx eax, word [byte ebp-04h]
        sub word [byte esi+Ypos+2], byte 0Bh
.13:
        call vtoa
        movsx ebx, ax
        mov edx, edi
        mov eax, esi
.14:
        call FallFrameByDir
        leave
        pop edi
        pop esi
        pop ecx
        ret
.15:
        mov edx, edi
        mov eax, esi
        xor ebx, ebx
        sub word [byte esi+Ypos+2], byte 0Fh
        jmp short .14
.16:
        lea edx, [byte edi+01h]
        and edx, byte 7
        cmp edx, byte 3
        jge near .34
        mov edx, dword [byte ebp-04h]
        mov word [byte esi+Xvel], 0
        add edx, ebx
        mov word [byte esi+Xpos+2], dx
        mov edx, dword [byte ebp-08h]
        mov word [byte esi+Yvel], 0
        add edx, eax
        mov word [byte esi+Ypos+2], dx
        test ebx, ebx
        jge short .17
        neg ebx
.17:
        add ebx, ebx
        test eax, eax
        jge short .18
        neg eax
.18:
        cmp eax, ebx
        jge short .21
        lea eax, [byte esi+02h]
        cmp dword [byte ebp-04h], byte 0
        jge short .19
        mov edx, 0Bh
        jmp short .20
.19:
        mov edx, 0FFFFFFF5h
.20:
        movsx ebx, word [eax]
        add ebx, edx
        movsx edx, word [byte ebp-08h]
        mov word [eax], bx
        movsx eax, word [byte ebp-04h]
        add word [byte esi+Ypos+2], byte 0Bh
        jmp near .13
.21:
        mov ebx, 4
        mov edx, edi
        mov eax, esi
        add word [byte esi+Ypos+2], byte 0Fh
        jmp near .14
.22:
        cmp dword [byte ebp-04h], byte 0
        jl near .28
        cmp edi, byte 5
        jl near .34
        mov edx, dword [byte ebp-04h]
        mov word [byte esi+Xvel], 0
        add edx, ebx
        mov word [byte esi+Xpos+2], dx
        mov edx, dword [byte ebp-08h]
        mov word [byte esi+Yvel], 0
        add edx, eax
        mov word [byte esi+Ypos+2], dx
        test eax, eax
        jge short .23
        neg eax
.23:
        add eax, eax
        test ebx, ebx
        jge short .24
        neg ebx
.24:
        cmp ebx, eax
        jge short .27
        lea eax, [byte esi+06h]
        cmp dword [byte ebp-08h], byte 0
        jge short .25
        mov edx, 0Bh
        jmp short .26
.25:
        mov edx, 0FFFFFFF5h
.26:
        movsx ebx, word [eax]
        add ebx, edx
        movsx edx, word [byte ebp-08h]
        mov word [eax], bx
        movsx eax, word [byte ebp-04h]
        sub word [byte esi+Xpos+2], byte 0Bh
        jmp near .13
.27:
        mov ebx, 2
        mov edx, edi
        mov eax, esi
        sub word [byte esi+Xpos+2], byte 0Fh
        jmp near .14
.28:
        test edi, edi
        je near .34
        lea edx, [byte edi-01h]
        cmp edx, byte 3
        jge near .34
        mov edx, dword [byte ebp-04h]
        mov word [byte esi+Xvel], 0
        add edx, ebx
        mov word [byte esi+Xpos+2], dx
        mov edx, dword [byte ebp-08h]
        mov word [byte esi+Yvel], 0
        add edx, eax
        mov word [byte esi+Ypos+2], dx
        test eax, eax
        jge short .29
        neg eax
.29:
        add eax, eax
        test ebx, ebx
        jge short .30
        neg ebx
.30:
        cmp ebx, eax
        jge short .33
        lea eax, [byte esi+06h]
        cmp dword [byte ebp-08h], byte 0
        jge short .31
        mov edx, 0Bh
        jmp short .32
.31:
        mov edx, 0FFFFFFF5h
.32:
        movsx ebx, word [eax]
        add ebx, edx
        movsx edx, word [byte ebp-08h]
        mov word [eax], bx
        movsx eax, word [byte ebp-04h]
        add word [byte esi+Xpos+2], byte 0Bh
        jmp near .13
.33:
        mov ebx, 6
        mov edx, edi
        mov eax, esi
        add word [byte esi+Xpos+2], byte 0Fh
        jmp near .14
.34:
        movsx eax, word [byte esi+SPA]
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; FallDown                         42342  94G collide94.asm, medium confidence
; A player falls after a hit: fall animation, newcheck, injury (setInjuryType),
; penalty roll (checkagr AddPenalty2).
;-----------------------------------------------------------------------------
FallDown:
        push ebx
        push ecx
        push esi
        push edi
        enter 24h, 0
        mov esi, eax
        mov ecx, edx
        mov edx, dword [dword eax+088h]
        mov eax, dword [dword ecx+tmptr]
        mov dword [byte ebp-0Ch], 0
        mov dword [byte ebp-08h], eax
        movsx eax, word [dword ecx+SCnum]
        mov dword [byte ebp-04h], 0
        cmp eax, byte 0Bh
        jle short .1
        cmp eax, byte 10h
        jne near BlockShotDive_127
.1:
        mov al, byte [byte ecx+pflags2]
        and al, 1
        movzx eax, al
        test eax, eax
        jne near BlockShotDive_127
        cmp word [byte ecx+position], byte 0
        je near BlockShotDive_127
        mov bx, word [byte ecx+SPA]
        movsx eax, bx
        cmp eax, SPAfallback
        jl short .2
        cmp eax, SPAblockright
        jle near BlockShotDive_127
.2:
        movsx eax, word [dword ecx+SCnum]
        cmp eax, byte 10h
        jne short .4
        movsx eax, bx
        cmp eax, SPAreffallback
        je near BlockShotDive_127
        mov edx, SPAreffallback
        or byte [byte ecx+pflags], 20h
        mov eax, ecx
        or byte [byte ecx+pflags2], 2
        call SetSPA
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jg short .3
        add word [Crowdlevel], 1F4h
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jle short .3
        mov word [Crowdlevel], 3E8h
.3:
        mov eax, 1Eh
        add word [CwdExciteLvl], byte 0Fh
        call PlaySfx
        mov eax, 0Ch
        jmp near .85
.4:
        movzx eax, byte [byte ecx+stickhand]
        cmp eax, byte 0Ch
        jl short .5
        mov eax, 10h
        call randomd0
        cwde
        movsx edi, word [byte ecx+impact]
        add eax, byte 10h
        cmp eax, edi
        jle short .5
        mov ebx, 299h
        mov word [byte ecx+040h], 3Ch
        jmp near .63
.5:
        cmp word [byte esi+position], byte 0
        je short .7
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne short .7
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne short .6
        inc word [byte edx+026h]
.6:
        movsx eax, byte [byte esi+pnum]
        inc byte [dword edx+eax+0E4h]
        inc dword [GameHitCount]
        cmp byte [byte esi+fighting], 0
        jne short .7
        inc dword [GameHitCount]
.7:
        mov word [byte ecx+nopuck], 78h
        mov ax, word [byte esi+Ypos+2]
        sub ax, word [byte ecx+Ypos+2]
        movsx edx, ax
        mov ax, word [byte esi+Xpos+2]
        sub ax, word [byte ecx+Xpos+2]
        cwde
        call vtoa
        mov edi, eax
        cmp word [byte esi+position], byte 0
        je short .8
        movsx eax, word [dword esi+SCnum]
        cmp eax, byte 6
        setl al
        movzx eax, al
        mov edx, eax
        movsx eax, word [dword ecx+SCnum]
        cmp eax, byte 6
        setl al
        movzx eax, al
        cmp edx, eax
        je short .8
        movsx eax, word [byte esi+SPA]
        cmp eax, SPAsweepchk
        jne short .9
.8:
        mov bx, word [byte ecx+SPA]
        jmp near .49
.9:
        cmp word [byte ecx+Xpos+2], byte 0
        jge short .10
        movsx eax, word [byte ecx+Xpos+2]
        neg eax
        jmp short .11
.10:
        movsx eax, word [byte ecx+Xpos+2]
.11:
        cmp eax, byte 6Ah
        jg short .14
        cmp word [byte ecx+Ypos+2], byte 0
        jge short .12
        movsx eax, word [byte ecx+Ypos+2]
        neg eax
        jmp short .13
.12:
        movsx eax, word [byte ecx+Ypos+2]
.13:
        cmp eax, 150h
        jle near .49
.14:
        mov dword [byte ebp-0Ch], 0
        movsx eax, word [byte ecx+Xpos+2]
        cmp eax, byte 6Ah
        jl near .21
        cmp word [byte ecx+Ypos+2], byte 0
        jge short .15
        movsx eax, word [byte ecx+Ypos+2]
        neg eax
        jmp short .16
.15:
        movsx eax, word [byte ecx+Ypos+2]
.16:
        cmp eax, 150h
        jle short .19
.17:
        lea ebx, [byte ebp-0Ch]
        movsx edx, di
        mov eax, ecx
        call NetCollide
.18:
        mov ebx, eax
        jmp near .30
.19:
        movsx eax, di
        cmp eax, byte 5
        jl near .30
        movsx eax, word [byte ecx+Xpos+2]
        cmp eax, 92h
        jl near .30
        movsx eax, word [byte ecx+Xpos+2]
        mov word [byte ecx+Xvel], 0
        cmp eax, 0A3h
        setg al
        mov ebx, 2
        movzx eax, al
        movsx edx, di
        mov dword [byte ebp-0Ch], eax
        mov eax, ecx
        mov word [byte ecx+Xpos+2], 9Bh
.20:
        call FallFrameByDir
        jmp short .18
.21:
        cmp eax, byte 0FFFFFF96h
        jg near .25
        cmp word [byte ecx+Ypos+2], byte 0
        jge short .22
        movsx eax, word [byte ecx+Ypos+2]
        neg eax
        jmp short .23
.22:
        movsx eax, word [byte ecx+Ypos+2]
.23:
        cmp eax, 150h
        jg near .17
        test di, di
        je near .30
        movsx eax, di
        cmp eax, byte 4
        jge near .30
        movsx eax, word [byte ecx+Xpos+2]
        cmp eax, 0FFFFFF6Eh
        jg near .30
        movsx eax, word [byte ecx+Ypos+2]
        mov word [byte ecx+Xvel], 0
        cmp eax, byte 0FFFFFF96h
        jl short .24
        cmp eax, byte 6Ah
        jge short .24
        mov word [byte ecx+Yvel], 0
        movsx eax, word [byte ecx+Xpos+2]
        mov word [byte ecx+facedir], 6
        cmp eax, 0FFFFFF62h
        setl al
        movzx eax, al
        movsx edx, di
        mov dword [byte ebp-0Ch], eax
        mov eax, ecx
        mov word [byte ecx+Xpos+2], 0FF62h
        call FallFrameByFacing
        jmp near .18
.24:
        movsx eax, word [byte ecx+Xpos+2]
        cmp eax, 0FFFFFF5Dh
        setl al
        mov ebx, 6
        movzx eax, al
        movsx edx, di
        mov dword [byte ebp-0Ch], eax
        mov eax, ecx
        mov word [byte ecx+Xpos+2], 0FF65h
        jmp near .20
.25:
        movsx edx, word [byte ecx+Ypos+2]
        cmp edx, 150h
        jl short .27
        cmp word [byte ecx+Xpos+2], byte 0
        jge short .26
        neg eax
.26:
        cmp eax, byte 6Ah
        jg near .17
        movsx eax, di
        inc eax
        inc eax
        and eax, byte 7
        cmp eax, byte 5
        jl near .30
        movsx eax, word [byte ecx+Ypos+2]
        cmp eax, 178h
        jl near .30
        cmp eax, 189h
        setg al
        movsx edx, di
        movzx eax, al
        xor ebx, ebx
        mov dword [byte ebp-0Ch], eax
        mov eax, ecx
        mov word [byte ecx+Ypos+2], 181h
        jmp short .29
.27:
        cmp edx, 0FFFFFEB0h
        jg short .30
        cmp word [byte ecx+Xpos+2], byte 0
        jge short .28
        neg eax
.28:
        cmp eax, byte 6Ah
        jg near .17
        movsx eax, di
        inc eax
        and eax, byte 7
        cmp eax, byte 3
        jge short .30
        movsx eax, word [byte ecx+Ypos+2]
        cmp eax, 0FFFFFE88h
        jg short .30
        cmp eax, 0FFFFFE77h
        setl al
        mov ebx, 4
        movzx eax, al
        movsx edx, di
        mov dword [byte ebp-0Ch], eax
        mov eax, ecx
        mov word [byte ecx+Ypos+2], 0FE7Fh
.29:
        call FallFrameByDir
        mov ebx, eax
        mov word [byte ecx+Yvel], 0
.30:
        cmp word [byte ecx+Xpos+2], byte 0
        jge short .31
        movsx eax, word [byte ecx+Xpos+2]
        neg eax
        jmp short .32
.31:
        movsx eax, word [byte ecx+Xpos+2]
.32:
        cmp eax, byte 6Ah
        jl short .35
        cmp word [byte ecx+Ypos+2], byte 0
        jge short .33
        movsx eax, word [byte ecx+Ypos+2]
        neg eax
        jmp short .34
.33:
        movsx eax, word [byte ecx+Ypos+2]
.34:
        cmp eax, 150h
        jge near .49
.35:
        cmp word [byte ecx+Xpos+2], byte 0
        jg short .38
        cmp word [byte ecx+Ypos+2], byte 0
        jge short .36
        movsx eax, word [byte ecx+Ypos+2]
        neg eax
        jmp short .37
.36:
        movsx eax, word [byte ecx+Ypos+2]
.37:
        cmp eax, byte 79h
        jle near .49
.38:
        movsx eax, word [byte ecx+Xpos+2]
        shl eax, 2
        mov dword [byte ebp-018h], eax
        movsx eax, word [byte ecx+Ypos+2]
        shl eax, 2
        mov dword [byte ebp-010h], eax
        movsx eax, word [lastimpact]
        cmp eax, byte 19h
        jle near .48
        movsx eax, bx
        cmp eax, 131h
        je short .39
        cmp eax, 14Bh
        jne near .48
.39:
        lea edx, [byte ebp-024h]
        lea eax, [byte ebp-018h]
        call NearestGlassPoint
        cmp byte [GlassOn], 0
        je near .48
        mov eax, dword [byte ebp-010h]
        sub eax, dword [byte ebp-01Ch]
        test eax, eax
        jge short .40
        neg eax
.40:
        cmp eax, byte 32h
        jge near .48
        mov eax, dword [byte ebp-018h]
        sub eax, dword [byte ebp-024h]
        test eax, eax
        jge short .41
        neg eax
.41:
        cmp eax, byte 32h
        jge near .48
        movsx eax, bx
        cmp eax, 131h
        jne short .42
        mov ebx, 199h
        jmp short .43
.42:
        mov ebx, 1ABh
.43:
        movsx eax, word [byte ecx+Xpos+2]
        cmp eax, 9Bh
        jne short .44
        add word [byte ecx+Xpos+2], byte 3
        jmp short .47
.44:
        cmp eax, 0FFFFFF65h
        jne short .45
        sub word [byte ecx+Xpos+2], byte 3
        jmp short .47
.45:
        movsx eax, word [byte ecx+Ypos+2]
        cmp eax, 0FFFFFE7Fh
        jne short .46
        sub word [byte ecx+Ypos+2], byte 3
        jmp short .47
.46:
        add word [byte ecx+Ypos+2], byte 3
.47:
        mov eax, 3
        call sfx
        xor edx, edx
        lea eax, [byte ebp-018h]
        call BreakGlass
        mov eax, 24h
        mov dword [byte ebp-04h], 1
        call PlaySfx
.48:
        cmp dword [byte ebp-04h], byte 0
        jne short .49
        movsx eax, bx
        cmp eax, 131h
        jl short .49
        cmp eax, 17Fh
        jg short .49
        mov edx, 10000h
        lea eax, [byte ebp-018h]
        call ShakeGlass
.49:
        cmp bx, word [byte ecx+SPA]
        jne near .60
        sub di, word [byte ecx+facedir]
        inc edi
        and edi, byte 7
        cmp di, byte 2
        ja short .51
        movsx eax, word [lastimpact]
        mov ebx, 1BDh
        cmp eax, byte 28h
        jle near .63
        movzx eax, byte [byte esi+checking]
        cmp eax, byte 0Ah
        jl near .63
        movsx eax, word [dword esi+SCnum]
        cmp eax, byte 0Bh
        jg near .63
        mov al, byte [byte esi+pflags]
        and al, 40h
        movzx eax, al
        mov ebx, 1EFh
.50:
        test eax, eax
        setne al
        movzx eax, al
        call GameEventStub
        jmp near .63
.51:
        movsx eax, word [dword esi+SCnum]
        cmp eax, byte 0Eh
        jne near .57
        movsx eax, di
        cmp eax, byte 3
        je short .52
        cmp eax, byte 7
        jne near .57
.52:
        movsx eax, word [byte esi+frame]
        mov ebx, 1BDh
        cmp eax, 230h
        jl near .63
        cmp eax, 240h
        jge near .63
        cmp dword [penshotplayer], byte 0
        jge near .63
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .63
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne near .63
        mov eax, dword [gameopts]
        test byte [byte eax+01h], 40h
        je near .63
        mov al, byte [byte ecx+pflags2]
        and al, 10h
        movzx eax, al
        test eax, eax
        jne near .63
        movsx eax, byte [byte ecx+pnum]
        imul eax, byte 15h
        mov edx, dword [byte ebp-08h]
        mov edx, dword [dword edx+tmplattr]
        movzx edx, byte [byte edx+eax+0Fh]
        mov al, byte [byte ecx+pflags]
        and al, 8
        movzx eax, al
        add edx, byte 4
        test eax, eax
        je short .53
        mov eax, 0C8h
        jmp short .54
.53:
        mov eax, 0A0h
.54:
        cwde
        call randomd0
        cwde
        cmp eax, edx
        jg near .63
        mov eax, ecx
        call CanRemovePlayer
        test eax, eax
        je near .63
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jg short .55
        add word [Crowdlevel], 1F4h
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jle short .55
        mov word [Crowdlevel], 3E8h
.55:
        mov edx, SPAinjury1
        add word [CwdExciteLvl], byte 0Fh
        mov eax, ecx
        or byte [byte ecx+pflags], 20h
        call SetSPA
        mov eax, ecx
        mov edx, 0Ah
        call setInjuryType
.56:
        mov eax, esi
        call AddPenalty2
        jmp near BlockShotDive_127
.57:
        movsx eax, word [lastimpact]
        cmp eax, byte 28h
        jle short .59
        movzx eax, byte [byte esi+checking]
        cmp eax, byte 0Ah
        jl short .59
        movsx eax, word [dword esi+SCnum]
        cmp eax, byte 0Bh
        jg short .59
        movsx eax, di
        mov ebx, 1EFh
        cmp eax, byte 3
        jle short .58
        cmp eax, byte 7
        jge short .58
        mov ebx, 20Dh
.58:
        mov al, byte [byte esi+pflags]
        and al, 40h
        movzx eax, al
        jmp near .50
.59:
        mov ebx, 1D5h
        jmp short .63
.60:
        mov eax, dword [puckc]
        add word [Crowdlevel], byte 64h
        movsx ax, byte [eax]
        cmp ax, word [dword ecx+SCnum]
        je short .63
        mov eax, esi
        call checkagr
        cwde
        cmp eax, byte 3
        jg short .63
        movsx eax, bx
        cmp eax, 131h
        jl short .63
        cmp eax, 17Fh
        jg short .63
        movsx eax, word [byte ecx+impact]
        cmp eax, byte 23h
        jle short .61
        mov eax, 18h
        jmp short .62
.61:
        mov eax, 14h
.62:
        movsx edx, ax
        mov eax, esi
        call AddPenalty
.63:
        movsx eax, bx
        cmp eax, 131h
        jl short .64
        cmp eax, 1ABh
        jg short .64
        mov ax, word [byte ecx+Xpos+2]
        mov word [dword ecx+OldXpos+2], ax
        mov ax, word [byte ecx+Ypos+2]
        mov word [dword ecx+OldYpos+2], ax
.64:
        movsx edx, bx
        mov eax, ecx
        or byte [byte ecx+pflags], 20h
        call SetSPA
        cmp dword [byte ebp-0Ch], byte 0
        je short .65
        add word [byte ecx+SPAnum], byte 2
.65:
        movsx eax, word [byte ecx+assnum]
        movsx eax, byte [byte ecx+eax+01Eh]
        cmp eax, byte 12h
        jne short .66
        mov eax, ecx
        call assexitjump
.66:
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jg short .67
        add word [Crowdlevel], 1F4h
        movsx eax, word [Crowdlevel]
        cmp eax, 3E8h
        jle short .67
        mov word [Crowdlevel], 3E8h
.67:
        add word [CwdExciteLvl], byte 0Fh
        cmp dword [FallDownsOff], byte 0
        jne short .70
        mov edx, dword [puckc]
        cmp byte [edx], 0
        jl short .68
        movsx ax, byte [edx]
        cmp ax, word [dword ecx+SCnum]
        je short .70
.68:
        movsx eax, bx
        cmp eax, 131h
        jl short .69
        cmp eax, 1ABh
.69:
        mov eax, 1Eh
        call PlaySfx
        mov eax, 2
        call sfx
        cmp dword [byte ebp-04h], byte 0
        je near BlockShotDive_127
        mov edx, 3
        jmp near .56
.70:
        mov eax, dword [puckc]
        mov byte [eax], 0FFh
        mov eax, 1Eh
        call PlaySfx
        cmp dword [byte ebp-04h], byte 0
        je short .72
        mov edx, 3
.71:
        mov eax, esi
        call AddPenalty2
        jmp near .83
.72:
        cmp dword [penshotplayer], byte 0
        jge near .83
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne near .83
        mov eax, dword [gameopts]
        test byte [byte eax+01h], 40h
        je near .83
        mov al, byte [byte ecx+pflags2]
        and al, 10h
        movzx eax, al
        test eax, eax
        jne near .83
        cmp dword [FallDownsOff], byte 0
        jne short .75
        movsx eax, word [byte ecx+SPA]
        cmp eax, SPAfallback
        jne near .83
        movsx edx, word [byte ecx+impact]
        cmp edx, byte 32h
        jle near .83
        movsx eax, word [lastimpact]
        cmp eax, byte 1Eh
        jle near .83
        movsx eax, byte [byte ecx+pnum]
        imul eax, byte 15h
        mov ebx, dword [byte ebp-08h]
        mov ebx, dword [dword ebx+tmplattr]
        sar edx, 4
        movzx eax, byte [byte ebx+eax+0Fh]
        add edx, eax
        mov al, byte [byte ecx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        je short .73
        mov eax, 190h
        jmp short .74
.73:
        mov eax, 140h
.74:
        cwde
        call randomd0
        cwde
        cmp eax, edx
        jg near .83
.75:
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .83
        mov eax, ecx
        call CanRemovePlayer
        test eax, eax
        je near .83
        mov edx, SPAinjury1
        mov eax, ecx
        or byte [byte ecx+pflags], 20h
        call SetSPA
        mov eax, ecx
        call setInjuryType
        cmp word [byte esi+position], byte 0
        je short .76
        mov eax, dword [gameopts]
        test byte [byte eax+01h], 1
        je short .76
        mov al, byte [byte esi+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        movsx eax, byte [dword eax+PBnum]
        cmp eax, byte 8
        jge short .76
        mov eax, esi
        call CanRemovePlayer
        test eax, eax
        jne short .77
.76:
        mov edx, 0Ah
        jmp near .71
.77:
        mov ax, word [byte ecx+Ypos+2]
        sub ax, word [byte esi+Ypos+2]
        movsx edx, ax
        mov ax, word [byte ecx+Xpos+2]
        sub ax, word [byte esi+Xpos+2]
        cwde
        call vtoa
        mov edx, eax
        movsx edx, dx
        movsx eax, word [byte esi+facedir]
        sub edx, eax
        inc edx
        and edx, byte 7
        cmp edx, byte 2
        jg short .78
        movsx edx, word [byte ecx+facedir]
        sub edx, eax
        lea eax, [byte edx+01h]
        and eax, byte 7
        cmp eax, byte 2
        jg short .78
        mov edx, 19h
        jmp short .79
.78:
        mov edx, 9
.79:
        mov eax, esi
        call AddPenalty2
        xor eax, eax
        jmp short .82
.80:
        cmp byte [nosplit edx*2+PenBuf], 0
        jne short .81
        dec eax
        cwde
        call Stop4Pen
        jmp short .83
.81:
        inc eax
.82:
        movsx edx, ax
        cmp edx, byte 20h
        jl short .80
.83:
        mov al, byte [byte ecx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        je short .84
        mov eax, 2
        jmp short .85
.84:
        mov eax, 2
        call randomd0
        test ax, ax
        setne al
        movzx eax, al
        add eax, byte 5
.85:
        call sfx
        jmp near BlockShotDive_127
;-----------------------------------------------------------------------------
; Bcheck                           42DC4  94G collide94.asm, medium confidence
; A player in the B-check animation hits the other player (FallDown,
; checkagr, AddPenalty)
;-----------------------------------------------------------------------------
Bcheck:
        push ebx
        push ecx
        push esi
        mov ebx, eax
        mov ecx, edx
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .5
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 10h
        je near .5
        cmp word [byte ebx+position], byte 0
        je near .5
        mov al, byte [byte ebx+pflags2]
        and al, 1
        movzx eax, al
        test eax, eax
        jne near .5
        mov eax, dword [gameopts]
        test byte [byte eax+01h], 1
        jne short .1
        mov al, byte [byte edx+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        je short .1
        movzx dx, byte [byte edx+064h]
        movzx ax, byte [byte ebx+legstr]
        add edx, byte 10h
        sub edx, eax
        movsx eax, dx
        call randomd0
        cwde
        cmp eax, byte 0Ch
        jl near .5
.1:
        mov ax, word [byte ebx+Ypos+2]
        sub ax, word [byte ecx+Ypos+2]
        movsx edx, ax
        mov ax, word [byte ebx+Xpos+2]
        sub ax, word [byte ecx+Xpos+2]
        cwde
        movsx esi, word [byte ecx+facedir]
        call vtoa
        cwde
        sub eax, esi
        inc eax
        and eax, byte 7
        cmp eax, byte 2
        jg short .5
        mov edx, ebx
        mov eax, ecx
        call FallDown
        mov eax, ebx
        call QuickShotChk
        test eax, eax
        je short .2
        cmp dword [penshotplayer], byte 0
        jge short .4
        movsx eax, word [dword ebx+SCnum]
        mov dword [penshotplayer], eax
        mov eax, dword [byte ebx+ctlslot]
        mov edx, 1Ah
        mov dword [penshotctl], eax
        jmp short .3
.2:
        mov eax, ecx
        call checkagr
        cwde
        cmp eax, byte 4
        jg short .4
        mov edx, 10h
.3:
        mov eax, ecx
        call AddPenalty
.4:
        mov byte [collflag], 0FFh
.5:
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; holdcheck                        42EC3  94G collide94.asm, medium confidence
; Player a grabbing player b.
;
; Not when a is already held (pflags bit 5), is SCnum 16, has no position or
; pflags2 bit 0 is set; only when b faces a (direction from b to a within one
; step of b's facedir).
;
; Dropping the puck carrier clears sflags bit 3; both skate on at their mean
; velocity, both get pflags bit 5, a takes SPA 669h and b 651h (88Bh unless b
; is in 639h).
;
; On a quick shot chance (QuickShotChk) with no penalty shot pending, a gets
; the penalty shot (penshotctl 1 2 -1 by controller) and b a penalty 1Ah, the
; puck is loose (puckc -1) and b's nopuck 20h.
;
; Else unless a's checking aggression (checkagr) is over 6, b gets holding
; (12h when in SPA 651h, else 0Fh). Then collflag -1.
;-----------------------------------------------------------------------------
holdcheck:
        push ebx
        push ecx
        push esi
        mov ebx, eax
        mov ecx, edx
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .8
        movsx eax, word [dword ebx+SCnum]
        cmp eax, byte 10h
        je near .8
        cmp word [byte ebx+position], byte 0
        je near .8
        mov al, byte [byte ebx+pflags2]
        and al, 1
        movzx eax, al
        test eax, eax
        jne near .8
        mov ax, word [byte ebx+Ypos+2]
        sub ax, word [byte edx+06h]
        movsx esi, word [byte edx+036h]
        movsx edx, ax
        mov ax, word [byte ebx+Xpos+2]
        sub ax, word [byte ecx+Xpos+2]
        cwde
        call vtoa
        cwde
        sub eax, esi
        inc eax
        and eax, byte 7
        cmp eax, byte 2
        jg near .8
        mov eax, dword [puckc]
        movsx ax, byte [eax]
        cmp ax, word [dword ebx+SCnum]
        jne short .1
        and byte [sflags], 0F7h
.1:
        movsx eax, word [byte ebx+Xvel]
        movsx edx, word [byte ecx+Xvel]
        add eax, edx
        sar eax, 1
        mov word [byte ebx+Xvel], ax
        mov word [byte ecx+Xvel], ax
        movsx edx, word [byte ebx+Yvel]
        movsx eax, word [byte ecx+Yvel]
        add eax, edx
        sar eax, 1
        mov word [byte ebx+Yvel], ax
        mov edx, SPAstand
        mov word [byte ecx+Yvel], ax
        mov eax, ebx
        or byte [byte ebx+pflags], 20h
        call SetSPA
        movsx eax, word [byte ecx+SPA]
        or byte [byte ecx+pflags], 20h
        cmp eax, SPAHold
        jne short .2
        mov eax, SPAHold2
        jmp short .3
.2:
        mov eax, SPAhook2
.3:
        movsx edx, ax
        mov eax, ecx
        call SetSPA
        mov eax, ebx
        call QuickShotChk
        test eax, eax
        je short .4
        cmp dword [penshotplayer], byte 0
        jge short .7
        movsx eax, word [dword ebx+SCnum]
        mov dword [penshotplayer], eax
        mov eax, dword [byte ebx+ctlslot]
        mov edx, 1Ah
        mov dword [penshotctl], eax
        mov eax, ecx
        call AddPenalty
        mov ebx, dword [puckc]
        mov byte [ebx], 0FFh
        mov word [byte ecx+nopuck], 20h
        jmp short .7
.4:
        mov eax, ecx
        call checkagr
        cwde
        cmp eax, byte 6
        jg short .7
        movsx eax, word [byte ecx+SPA]
        cmp eax, SPAHold2
        jne short .5
        mov eax, 12h
        jmp short .6
.5:
        mov eax, 0Fh
.6:
        movsx edx, ax
        mov eax, ecx
        call AddPenalty
.7:
        mov byte [collflag], 0FFh
.8:
        pop esi
        pop ecx
        pop ebx
        ret
