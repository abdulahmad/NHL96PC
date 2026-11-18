; Offsides: offside and two-line pass checks, touch-up and puck flip.
bits 32
%include "hockey.inc"
%include "spa.inc"
section s_34D49 progbits alloc exec nowrite align=1
extern AddPenalty, assexit, awtmap, gameopts, gmode, gmode2, hmtmap, icingPlayer
extern iflags, LastPlayerTouch, lasttouch, LastTouchTeam, PassDistY, penshotlive, penshotstart, PuckChasers
extern PuckObject, puckx, pucky, regd0, SetSPA, SortCords, StoppageFlag
global a2offsides, ChkTwoLinePass, a2touchpuck, assexitjump, ResetFaceoffSkater, puckflip
;-----------------------------------------------------------------------------
; a2offsides                         34D49  94G logic94.asm, medium confidence
; Offsides check for p (offsides option on, no penalty shot): the puck is past
; the blue line (4Eh.
;
; toward p's attacking end) while p's team has its offside flag (tmflags bit
; 4) and play is not stopped (gmode bit 4): call offsides (AddPenalty kind 8),
; return 1.
;-----------------------------------------------------------------------------
a2offsides:
        push edx
        mov edx, dword [gameopts]
        test byte [byte edx+01h], 2
        jne short .2
.1:
        xor eax, eax
        pop edx
        ret
.2:
        cmp dword [penshotlive], byte 0
        jne short .1
        cmp dword [penshotstart], byte 0
        jne short .1
        mov edx, dword [pucky]
        mov dx, word [edx]
        mov word [regd0], dx
        mov dl, byte [byte eax+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .3
        neg word [regd0]
.3:
        movsx edx, word [regd0]
        cmp edx, byte 74h
        jl short .1
        mov edx, dword [dword eax+088h]
        mov dx, word [byte edx+046h]
        xor dh, dh
        and dl, 10h
        movsx edx, dx
        test edx, edx
        je short .1
        mov dl, byte [gmode]
        and dl, 10h
        movsx edx, dl
        test edx, edx
        jne short .1
        mov edx, 8
        call AddPenalty
        mov eax, 1
        pop edx
        ret
;-----------------------------------------------------------------------------
; ChkTwoLinePass                               34DD3  95 PC, medium confidence
; Two-line pass option (gameopts bit 3, not in highlight mode): receiver eax
; was past the red line (pflags2 bit 7 from MarkTwoLinePlayers.
;
; Or on the attacking side) and the pass came from a teammate in his own half
; (lasttouch): returns 1 for a two-line pass whistle; called by a2touchpuck
;-----------------------------------------------------------------------------
ChkTwoLinePass:
        push ebx
        push edx
        mov dl, byte [gmode]
        and dl, 10h
        movsx edx, dl
        test edx, edx
        je short .2
.1:
        xor eax, eax
        pop edx
        pop ebx
        ret
.2:
        mov edx, dword [gameopts]
        test byte [byte edx+01h], 4
        je short .1
        mov dl, byte [byte eax+045h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .3
        mov dl, byte [byte eax+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        sete dl
        movzx ebx, dl
        mov edx, dword [pucky]
        cmp word [edx], byte 0
        setg dl
        movzx edx, dl
        xor edx, ebx
        jne short .1
.3:
        mov dx, word [dword eax+086h]
        cmp dx, word [lasttouch]
        je short .1
        movsx edx, dx
        cmp edx, byte 6
        setl dl
        movzx edx, dl
        mov ebx, edx
        movsx edx, word [lasttouch]
        cmp edx, byte 6
        setl dl
        movzx edx, dl
        xor edx, ebx
        jne short .1
        mov dl, byte [byte eax+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .4
        movsx edx, word [PassDistY]
        cmp edx, byte 74h
        jl near .1
        cmp word [byte eax+06h], byte 0
        jle short .5
        jmp near .1
.4:
        movsx edx, word [PassDistY]
        cmp edx, byte 0FFFFFF8Ch
        jg near .1
        cmp word [byte eax+06h], byte 0
        jl near .1
.5:
        mov eax, 1
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; a2touchpuck                        34EA6  94G logic94.asm, medium confidence
; Player p touched the puck. Unless a two-line pass (ChkTwoLinePass) or a
; stoppage: remember the touch place and player (ltx lty lasttouch).
;
; In p's team: a new toucher (pnum) shifts the last-toucher words (+30h ->
; +32h -> +34h; unless tmflags bit 3 was set, which is just cleared) and a
; repeat of +34h clears its top byte (-1).
;
; The same toucher clears pflags bit 3 of the team. A skater with a position
; clears gmode2 bit 4. Not offside but a two-line pass: penalty 1Dh on p.
;
; With iflags bits 2 and 0 set and a skater of the other side than iflags bit
; 1: penalty 6 on player icingPlayer.
;-----------------------------------------------------------------------------
a2touchpuck:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        sete al
        movzx eax, al
        mov dword [nosplit eax*4+PuckChasers], 0
        mov eax, ebx
        call ChkTwoLinePass
        mov ecx, eax
        test ax, ax
        jne short .1
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne short .1
        mov eax, dword [puckx]
        mov ax, word [eax]
        mov word [LastTouchTeam], ax
        mov eax, dword [pucky]
        mov ax, word [eax]
        mov word [PassDistY], ax
        mov ax, word [byte ebx+02h]
        mov word [LastPlayerTouch], ax
        mov ax, word [byte ebx+06h]
        mov word [StoppageFlag], ax
        mov ax, word [dword ebx+086h]
        mov word [lasttouch], ax
.1:
        mov eax, dword [dword ebx+088h]
        movsx dx, byte [byte ebx+047h]
        cmp dx, word [byte eax+032h]
        je short .4
        mov dx, word [byte eax+046h]
        xor dh, dh
        and dl, 8
        movsx edx, dx
        test edx, edx
        je short .2
        and byte [byte eax+046h], 0F7h
        jmp short .3
.2:
        mov dx, word [byte eax+034h]
        mov word [byte eax+036h], dx
        mov dx, word [byte eax+032h]
        mov word [byte eax+034h], dx
.3:
        movsx dx, byte [byte ebx+047h]
        mov word [byte eax+032h], dx
        cmp dx, word [byte eax+036h]
        jne short .5
        mov byte [byte eax+037h], 0FFh
        jmp short .5
.4:
        mov dx, word [byte eax+046h]
        xor dh, dh
        and dl, 8
        movsx edx, dx
        test edx, edx
        je short .5
        and byte [byte eax+046h], 0F7h
.5:
        cmp word [byte ebx+01Ah], byte 0
        je short .6
        and byte [gmode2], 0EFh
.6:
        mov eax, ebx
        call a2offsides
        test ax, ax
        jne short .7
        test cx, cx
        je short .7
        mov edx, 1Dh
        mov eax, ebx
        call AddPenalty
.7:
        mov al, byte [iflags]
        and al, 4
        movsx eax, al
        test eax, eax
        je short .8
        mov al, byte [iflags]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .8
        cmp word [byte ebx+01Ah], byte 0
        je short .8
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        mov edx, eax
        mov al, byte [iflags]
        and al, 2
        movsx eax, al
        test eax, eax
        setne al
        movzx eax, al
        xor eax, edx
        je short .8
        movsx eax, byte [icingPlayer]
        imul eax, dword 0A0h
        mov edx, 6
        add eax, SortCords
        call AddPenalty
        pop edx
        pop ecx
        pop ebx
        ret
.8:
        mov byte [iflags], 0
        mov al, byte [dword ebx+086h]
        mov byte [icingPlayer], al
        mov eax, dword [pucky]
        mov ax, word [eax]
        mov word [regd0], ax
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .9
        mov byte [iflags], 2
        neg word [regd0]
.9:
        cmp word [regd0], byte 0
        jl short .11
        mov ax, word [hmtmap]
        sub ax, word [awtmap]
        mov word [regd0], ax
        mov al, byte [byte ebx+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        je short .10
        neg word [regd0]
.10:
        cmp word [regd0], byte 0
        jl short .11
        mov eax, dword [gameopts]
        test byte [byte eax+01h], 8
        je short .11
        or byte [iflags], 4
.11:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assexitjump                                  3509F  96 PC, medium confidence
; Jumps to assexit
;-----------------------------------------------------------------------------
assexitjump:
        push edx
        jmp near assexit
;-----------------------------------------------------------------------------
; ResetFaceoffSkater                              350A5  96 PC, low confidence
; Resets a skater's animation and flags before a faceoff
;-----------------------------------------------------------------------------
ResetFaceoffSkater:
        push edx
        movsx edx, word [byte eax+03Ah]
        cmp edx, byte 4
        jl short .1
        cmp edx, byte 0Ch
        jge short .1
        xor byte [byte eax+036h], 2
.1:
        mov word [byte eax+03Ah], 0
        mov word [byte eax+03Ch], 0FFFFh
        or byte [byte eax+036h], 4
        mov word [PuckObject+4Ah], 0
        pop edx
        ret
;-----------------------------------------------------------------------------
; puckflip                           350D3  94G logic94.asm, medium confidence
; Flip the puck. PC addition: when Xvel + Yvel of p is below 14h the puck is
; too slow and puckunflip runs instead.
;
; Else facedir ^= regd0 & 1, kept in 0-3, SPAcnt = -1 (st SPAcnt) and the
; puck-flip animation (SPApflip).
;-----------------------------------------------------------------------------
puckflip:
        push ebx
        push edx
        movsx ebx, word [byte eax+0Ch]
        movsx edx, word [byte eax+0Eh]
        add edx, ebx
        cmp edx, byte 14h
        jge short .2
        movsx ebx, word [byte eax+03Ah]
        mov edx, eax
        cmp ebx, byte 4
        jl short .1
        cmp ebx, byte 0Ch
        jge short .1
        xor byte [byte eax+036h], 2
.1:
        mov word [byte edx+03Ah], 0
        mov word [byte edx+03Ch], 0FFFFh
        or byte [byte edx+036h], 4
        mov word [PuckObject+4Ah], 0
        pop edx
        pop ebx
        ret
.2:
        mov dx, word [regd0]
        xor dh, dh
        and dl, 1
        xor dx, word [byte eax+036h]
        xor dh, dh
        and dl, 3
        mov word [byte eax+036h], dx
        mov edx, SPApflip
        mov word [byte eax+03Ch], 0FFFFh
        call SetSPA
        mov word [PuckObject+4Ah], 1
        pop edx
        pop ebx
        ret
