; Line changes: requests, modes and the faceoff line change.
bits 32
%include "hockey.inc"
section s_3492A progbits alloc exec nowrite align=1
extern assrefgoalpa_83E, awplattr, awtmstruct, dirtab, dirtab_y, Endfaceoff_ftab_m1, fodir1, fodir2
extern fofdata2, fofdata2_w4, fofdata2_w6, gameopts, getlchoice, gmode, gmode2, hmplattr
extern hmtmstruct, lasttouch, lcblink, lcblinktime, lcboxon, lcline, lcsel, lctimer
extern OffsideCalled, PlayFlags, PlaySfx, PtrPuckObject, puckz, randomd0, regd0, regd2
extern regd3, regd4, sflags, sflags3, SortCords, StopArenaClip
global RequestLineChange, SetLCmode, StartFaceoffLineChange, Endfaceoff
;-----------------------------------------------------------------------------
; RequestLineChange                            3492A  95 PC, medium confidence
; Team from pflags+44h bit 40h: getlchoice (or the team's current line
; hmtmstruct/awtmstruct+2Ah) into lcline, lcsel, lctimer=3Ch.
;
; lcblink/lcblinktime=0Ch, lcboxon=1; clears the home line timer
;-----------------------------------------------------------------------------
RequestLineChange:
        push ebx
        push edx
        mov dl, byte [byte eax+044h]
        and dl, 40h
        movzx edx, dl
        test edx, edx
        setne dl
        mov word [regd0], 1
        movzx dx, dl
        call getlchoice
        mov ebx, edx
        cmp word [regd0], byte 0
        jge short .3
        movsx eax, dx
        mov word [nosplit eax*2+lcsel], 0
        test dx, dx
        jle short .1
        mov eax, awtmstruct
        jmp short .2
.1:
        mov eax, hmtmstruct
.2:
        movsx edx, bx
        mov ax, word [byte eax+02Ch]
        mov word [nosplit edx*2+lcline], ax
        jmp short .4
.3:
        movsx eax, dx
        mov dx, word [regd0]
        mov word [nosplit eax*2+lcsel], 1
        mov word [nosplit eax*2+lcline], dx
.4:
        movsx eax, bx
        mov word [nosplit eax*2+lctimer], 3Ch
        mov word [nosplit eax*2+lcblink], 1
        mov word [nosplit eax*2+lcblinktime], 0Ch
        mov word [nosplit eax*2+lcboxon], 1
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetLCmode                          349D1  94G logic94.asm, medium confidence
; Put player p's team into line change mode: only with line changes on
; (gameopts bit 2) and when the team is not in it already (tmflags bit 1.
;
; Then set). Clears sflags bits 2-3 (sflags), keeps the joystick on p (pflags2
; pf2lcm) and asks for the line change box.
;-----------------------------------------------------------------------------
SetLCmode:
        push ebx
        push edx
        mov edx, dword [gameopts]
        test byte [byte edx+01h], 30h
        je short .1
        mov edx, dword [dword eax+tmptr]
        mov bx, word [byte edx+tmflags]
        xor bh, bh
        and bl, 2
        movsx ebx, bx
        test ebx, ebx
        jne short .1
        or byte [byte edx+tmflags], 2
        and byte [sflags], 0F3h
        or byte [byte eax+045h], 8
        call RequestLineChange
.1:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; StartFaceoffLineChange             34A0C  94G logic94.asm, medium confidence
; start a line change for player p's team before a faceoff. r is the object
; that waits for the change.
;
; Clears pf2lcm, calls SetLCmode(p); when the team went into line change mode
; (pf2lcm set again): away player (pfteam) -> r->temp2 = 168h and r->temp4 =
; p's SCnum, home player -> r->temp1 = 258h and r->temp3 = SCnum.
;-----------------------------------------------------------------------------
StartFaceoffLineChange:
        push ebx
        push ecx
        mov ebx, eax
        and byte [byte edx+pflags2], 0F7h
        mov eax, dword [gameopts]
        test byte [byte eax+01h], 30h
        je short .1
        mov eax, dword [dword edx+tmptr]
        mov cx, word [byte eax+tmflags]
        xor ch, ch
        and cl, 2
        movsx ecx, cx
        test ecx, ecx
        jne short .1
        or byte [byte eax+tmflags], 2
        and byte [sflags], 0F3h
        mov eax, edx
        or byte [byte edx+pflags2], 8
        call RequestLineChange
.1:
        mov al, byte [byte edx+pflags2]
        and al, 8
        movzx eax, al
        test eax, eax
        je short .3
        mov al, byte [byte edx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        je short .2
        mov word [byte ebx+temp2], 168h
        mov ax, word [dword edx+SCnum]
        mov word [byte ebx+temp4], ax
        pop ecx
        pop ebx
        ret
.2:
        mov word [byte ebx+temp1], 258h
        mov ax, word [dword edx+SCnum]
        mov word [byte ebx+temp3], ax
.3:
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; Endfaceoff                         34A8B  94G logic94.asm, medium confidence
; Drops the puck: picks the faceoff winner and sends the puck off; ends in
; ass_popx.
;
; Stops the sample, plays sfx ABh and ends the faceoff (gmode2 bits 0 and 2,
; the clock bit of gmode, p's pflags2 bit 0, sflags3 bit 4).
;
; The odds (regd2) are 10h less the first centre's faceoff stance
; (Endfaceoff_ftab_m1 by fofdata2) plus the second's.
;
; Add the away centre's faceoff rating less the home centre's (awplattr_b13 /
; hmplattr_b13 by pnum; the centres are the skaters with position 4).
;
; randomd0(21h) below the odds gives the puck to the away centre (lasttouch,
; his input fofdata2_w6), else to the home centre (fofdata2_w2).
;
; The winner's input bit 0Bh picks the direction (fodir2 with y speed -800h,
; else fodir1 / +800h).
;
; A held direction (bit 3 clear) is used 3 times in 4, else a random one of
; the 5 around the y direction, mirrored by the sign of the y speed.
;
; The puck p gets that velocity (dirtab * 20h, plus the y speed), a random z
; velocity (below 800h) and z 0.
;
; It loses pflags bit 2 and takes assignment 18h (pucknorm); the referee
; (SortCords + 16) takes 1Fh and refXvel is set to 500h toward his side. No
; result.
;-----------------------------------------------------------------------------
Endfaceoff:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov edx, eax
        mov eax, 64h
        call StopArenaClip
        mov eax, 2
        call randomd0
        test ax, ax
        sete al
        movzx eax, al
        add eax, byte 6
        call PlaySfx
        and byte [gmode2], 0FAh
        and byte [gmode], 0FEh
        and byte [byte edx+pflags2], 0FEh
        movsx eax, word [fofdata2]
        mov ebx, 10h
        movsx ax, byte [dword eax+Endfaceoff_ftab_m1]
        sub ebx, eax
        movsx eax, word [fofdata2_w4]
        movsx ax, byte [dword eax+Endfaceoff_ftab_m1]
        mov dword [byte ebp-04h], 0
        add ebx, eax
        or byte [sflags3], 10h
        mov word [regd2], bx
        jmp short .2
.1:
        imul eax, dword 0A0h
        movsx eax, word [dword eax+SortCords+1Ah]
        cmp eax, byte 4
        je short .3
        inc dword [byte ebp-04h]
.2:
        movsx eax, word [byte ebp-04h]
        cmp eax, byte 6
        jl short .1
.3:
        mov esi, 6
        jmp short .5
.4:
        imul eax, dword 0A0h
        movsx eax, word [dword eax+SortCords+1Ah]
        cmp eax, byte 4
        je short .6
        inc esi
.5:
        movsx eax, si
        cmp eax, byte 0Ch
        jl short .4
.6:
        movsx ecx, si
        imul ecx, dword 0A0h
        movsx eax, byte [dword ecx+SortCords+47h]
        imul eax, byte 15h
        movsx ebx, word [byte ebp-04h]
        imul ebx, dword 0A0h
        movzx ax, byte [dword eax+awplattr+13h]
        mov dword [byte ebp-08h], eax
        movsx eax, byte [dword ebx+SortCords+47h]
        imul eax, byte 15h
        mov edi, dword [byte ebp-08h]
        movzx ax, byte [dword eax+hmplattr+13h]
        sub edi, eax
        mov eax, 21h
        add word [regd2], di
        call randomd0
        cmp ax, word [regd2]
        jge short .7
        mov eax, 0Ah
        mov di, word [fofdata2_w6]
        mov word [lasttouch], si
        call randomd0
        add eax, 8
        mov word [dword ebx+SortCords+3Eh], ax
        jmp short .8
.7:
        mov eax, dword [byte ebp-04h]
        mov word [lasttouch], ax
        mov eax, 0Ah
        mov di, word [PlayFlags]
        call randomd0
        add eax, 8
        mov word [dword ecx+SortCords+3Eh], ax
.8:
        and edi, 800h
        movsx eax, di
        test eax, eax
        je short .9
        mov ax, word [fodir2]
        mov word [regd4], 0F800h
        jmp short .10
.9:
        mov ax, word [fodir1]
        mov word [regd4], 800h
.10:
        mov word [regd3], ax
        mov ax, word [regd3]
        mov word [regd0], ax
        xor ah, ah
        and al, 8
        cwde
        test eax, eax
        jne short .11
        mov byte [OffsideCalled], 0
        mov eax, 4
        and byte [regd0], 7
        call randomd0
        test ax, ax
        jne short .13
        mov eax, 5
        call randomd0
        dec eax
        dec eax
        xor ah, ah
        and al, 7
        mov word [regd0], ax
        cmp word [regd4], byte 0
        jge short .13
        jmp short .12
.11:
        mov eax, 5
        call randomd0
        dec eax
        dec eax
        xor ah, ah
        and al, 7
        mov word [regd0], ax
        cmp word [regd4], byte 0
        jge short .13
.12:
        xor byte [regd0], 4
.13:
        mov ax, word [regd0]
        add eax, eax
        movsx ebx, ax
        mov bx, word [nosplit ebx*2+dirtab]
        mov word [regd0], ax
        shl ebx, 5
        mov word [byte edx+Xvel], bx
        movsx eax, word [regd0]
        mov bx, word [nosplit eax*2+dirtab_y]
        mov ax, word [regd4]
        shl ebx, 5
        add ebx, eax
        mov eax, 800h
        mov word [byte edx+Yvel], bx
        call randomd0
        mov word [byte edx+Zvel], ax
        mov eax, dword [puckz]
        mov word [eax], 0
        mov ebx, 18h
        movsx eax, word [byte edx+assnum]
        and byte [byte edx+pflags], 0FBh
        mov byte [byte edx+eax+01Eh], bl
        or byte [byte edx+pflags], 2
        mov edx, dword [PtrPuckObject]
        movsx eax, word [byte edx+assnum]
        mov ebx, 1Fh
        mov byte [byte edx+eax+01Eh], bl
        or byte [byte edx+pflags], 2
        mov edx, dword [PtrPuckObject]
        cmp word [byte edx+Xpos+2], byte 0
        jle short .14
        mov eax, 500h
        jmp short .15
.14:
        mov eax, 0FFFFFB00h
.15:
        mov edx, eax
        mov eax, dword [PtrPuckObject]
        mov word [byte eax+0Ch], dx
        jmp near assrefgoalpa_83E
