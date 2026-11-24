; Faceoff assignments: the faceoff and faceoff player assignments.
bits 32
%include "hockey.inc"
%include "spa.inc"
section s_34300 progbits alloc exec nowrite align=1
extern a2touchpuck, AddPenalty2, awtmnear, checkpuckcoll, ChkOffsides, EndPenaltyShot, findpc, fodir1
extern fodir2, fofdata2, GetHot, gmode, gmode2, hmtmnear, MarkTwoLinePlayers, penshotlive
extern penshotteam, PlaySfx, PlaySfxOr, psendcount, PtrPuckFlags, puckc, puckcross2, puckcross6
extern PuckIChk, PuckObject, puckvy, puckx, pucky, randomd0, regd0, regd1
extern SetSPA, sfx, SortCords, updateanim
global assfaceoff, assexit, assexit_12, assfaceoffpl, pucknorm_body
;-----------------------------------------------------------------------------
; assfaceoff                                            34300  94G logic94.asm
; Assignment table slot 16h: take a faceoff position
;-----------------------------------------------------------------------------
assfaceoff:
        push edx
        mov dl, byte [byte eax+044h]
        and dl, 20h
        movzx edx, dl
        test edx, edx
        jne short assexit_12
        mov dx, word [gmode2]
        xor dh, dh
        and dl, 1
        movsx edx, dx
        test edx, edx
        jne short assexit_12
assexit:
        mov dx, word [byte eax+01Ch]
        inc edx
        xor dh, dh
        or byte [byte eax+044h], 2
        and dl, 7
        mov word [byte eax+01Ch], dx
assexit_12:
        pop edx
        ret
;-----------------------------------------------------------------------------
; assfaceoffpl                                        34335  95G faceoff95.asm
; The faceoff participant. pflags bit 5 returns; faceoff flag clear calls
; assexit; bit 1 clears temp1 and sets the faceoff frame
;-----------------------------------------------------------------------------
assfaceoffpl:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .29
        mov ax, word [gmode2]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        jne short .1
        mov ax, word [byte ebx+assnum]
        inc eax
        mov word [byte ebx+nopuck], 14h
        xor ah, ah
        or byte [byte ebx+pflags], 2
        and al, 7
        mov word [byte ebx+assnum], ax
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        mov al, byte [byte ebx+pflags]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .3
        mov edx, SPAfaceoff
        mov word [byte ebx+temp1], 0
        mov eax, ebx
        and byte [byte ebx+pflags], 0FDh
        call SetSPA
        mov eax, ebx
        call updateanim
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        je short .2
        mov eax, 0Ah
        call randomd0
        add eax, 14h
        mov word [byte ebx+temp5], ax
        jmp short .3
.2:
        mov word [byte ebx+temp5], 28h
.3:
        mov al, byte [byte ebx+pflags]
        and al, 40h
        movzx eax, al
        mov edx, fofdata2
        test eax, eax
        je short .4
        add edx, byte 4
.4:
        mov ax, word [byte ebx+frame]
        movsx ecx, ax
        cmp ecx, 198h
        jl short .6
        cmp ecx, 19Fh
        jg short .6
        movsx eax, word [byte ebx+SPAcnt]
        cmp eax, byte 7
        jne short .5
        mov eax, 6
        call PlaySfx
.5:
        mov word [regd0], 2
        jmp short .9
.6:
        cwde
        cmp eax, 188h
        jl short .8
        cmp eax, 18Fh
        jg short .8
        movsx eax, word [byte ebx+SPAcnt]
        cmp eax, byte 7
        jne short .7
        call PlaySfx
.7:
        mov word [regd0], 3
        jmp short .9
.8:
        mov word [regd0], 1
.9:
        cmp byte [byte ebx+handed], 0
        jne short .10
        add word [regd0], byte 3
.10:
        mov ax, word [regd0]
        mov word [edx], ax
        mov al, byte [byte ebx+pflags]
        and al, 8
        movzx eax, al
        test eax, eax
        jne near .29
        mov al, byte [byte ebx+pflags2]
        and al, 2
        movzx eax, al
        test eax, eax
        jne near .29
        or byte [byte ebx+pflags2], 2
        cmp word [byte ebx+temp5], byte 0
        jge short .11
        mov eax, dword [PtrPuckFlags]
        movzx eax, word [byte eax+026h]
        cmp eax, byte 10h
        jle short .12
        mov eax, 8
        call randomd0
        test ax, ax
        je short .12
.11:
        dec word [byte ebx+temp5]
        cmp word [byte ebx+temp5], byte 0
        jge near .29
        mov eax, 38Bh
        jmp near .28
.12:
        mov eax, dword [dword ebx+tmptr]
        cmp word [byte eax+tmgoalie], byte 0
        setge dl
        movzx dx, dl
        mov ax, word [byte eax+tmap]
        sub eax, edx
        mov edx, eax
        cwde
        cmp eax, byte 4
        jne short .13
        xor eax, eax
        jmp short .14
.13:
        mov eax, 2
        call randomd0
.14:
        mov cl, byte [byte ebx+pflags]
        and cl, 80h
        movzx ecx, cl
        test ecx, ecx
        je short .19
        movsx edx, dx
        cmp edx, byte 3
        jne short .17
        test ax, ax
        je short .15
        mov edx, 2
        jmp short .16
.15:
        mov edx, 6
.16:
        mov word [fodir2], dx
        jmp short .24
.17:
        test ax, ax
        je short .18
        mov edx, 3
        jmp short .16
.18:
        mov edx, 5
        jmp short .16
.19:
        movsx edx, dx
        cmp edx, byte 3
        jne short .21
        test ax, ax
        je short .20
        mov edx, 6
        jmp short .23
.20:
        mov edx, 2
        jmp short .23
.21:
        test ax, ax
        je short .22
        mov edx, 7
        jmp short .23
.22:
        mov edx, 1
.23:
        mov word [fodir1], dx
.24:
        cmp byte [byte ebx+handed], 0
        setne dl
        movzx dx, dl
        mov word [byte ebx+temp5], 0FFFFh
        xor eax, edx
        mov edx, dword [PtrPuckFlags]
        movsx edx, word [byte edx+026h]
        cmp edx, byte 11h
        jge short .26
        or byte [byte ebx+pflags], 20h
        test ax, ax
        je short .25
        mov eax, 38Fh
        jmp short .28
.25:
        mov eax, 399h
        jmp short .28
.26:
        test ax, ax
        je short .27
        mov eax, 395h
        jmp short .28
.27:
        mov eax, SPAfaceoffpokerhold
.28:
        movsx edx, ax
        mov eax, ebx
        call SetSPA
.29:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; pucknorm_body                      345B1  94G logic94.asm, medium confidence
; The puck's normal assignment after the new-assignment part; ends in
; ass_popx.
;
; Counts down the two line-crossing timers (puckcross) and every 5 ticks
; recomputes them (temp1, findpc).
;
; A carried puck is pulled a quarter of the way toward its carrier's hot spot
; (a2touchpuck, GetHot into regd0 / regd1) and takes his velocity.
;
; Then the ice, offside and two-line checks (PuckIChk, ChkOffsides,
; MarkTwoLinePlayers).
;
; While the clock runs, a carried puck resets temp2 (78h) and the penalty-shot
; send count (psendcount).
;
; A loose puck on a live penalty shot moving back toward the shooter's own end
; for 1Eh ticks ends the shot (EndPenaltyShot); the end comes from puckvy,
; penshotteam and the gmode bit 1 rink flip.
;
; A puck that has stopped (same position as last tick), outside the middle (x
; A3h, y 10Eh) or with hmtmnear / awtmnear at 14h or less, counts temp2 down.
;
; At 0 that calls a delay of game (AddPenalty2 3); a moving puck resets temp2.
;
; A puck almost still on the ice (z speed below 100h, z 0) is put flat
; (puckunflip); then the collisions (checkpuckcoll). p: the puck. No result.
;-----------------------------------------------------------------------------
pucknorm_body:
        push ebx
        push ecx
        push edx
        push esi
        mov ebx, eax
        dec word [puckcross2]
        dec word [puckcross6]
        dec word [byte eax+temp1]
        cmp word [byte eax+temp1], byte 0
        jge short .1
        add word [byte eax+temp1], byte 5
        call findpc
.1:
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl near .5
        movsx eax, byte [eax]
        imul eax, dword 0A0h
        mov ecx, SortCords
        add ecx, eax
        mov eax, ecx
        call a2touchpuck
        mov eax, ecx
        call GetHot
        movsx edx, word [regd0]
        movsx eax, word [byte ecx+Xpos+2]
        add edx, eax
        movsx eax, word [byte ebx+Xpos+2]
        sub edx, eax
        sar edx, 2
        add eax, edx
        mov word [byte ebx+Xpos+2], ax
        movsx edx, word [regd1]
        movsx eax, word [byte ecx+Ypos+2]
        add edx, eax
        movsx eax, word [byte ebx+Ypos+2]
        sub edx, eax
        sar edx, 2
        add eax, edx
        mov word [byte ebx+Ypos+2], ax
        mov ax, word [byte ecx+Xvel]
        mov word [byte ebx+Xvel], ax
        mov ax, word [byte ecx+Yvel]
        mov word [byte ebx+Yvel], ax
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .6
        inc dword [byte ebx+076h]
        cmp word [byte ecx+position], byte 0
        jle near .6
        cmp dword [penshotlive], byte 0
        jne near .6
        mov al, byte [byte ecx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        jne near .4
        mov ax, word [gmode2]
        xor ah, ah
        and al, 20h
        cwde
        test eax, eax
        je near .4
        mov ax, word [gmode2]
        xor ah, ah
        and al, 40h
        cwde
        test eax, eax
        jne short .4
        cmp word [byte ecx+Ypos+2], byte 0
        jge short .2
        movsx eax, word [byte ecx+Ypos+2]
        neg eax
        jmp short .3
.2:
        movsx eax, word [byte ecx+Ypos+2]
.3:
        cmp eax, byte 7Eh
        jle short .4
        mov al, byte [byte ecx+pflags]
        and al, 80h
        movzx eax, al
        test eax, eax
        setne al
        movzx eax, al
        cmp word [byte ecx+Ypos+2], byte 0
        setl dl
        movzx edx, dl
        xor eax, edx
        je short .4
        cmp dword [byte ebx+076h], 258h
        jl short .4
        mov eax, dword [byte ebx+076h]
        sub eax, 258h
        mov esi, 258h
        cdq
        idiv esi
        test edx, edx
        jne short .4
        mov eax, 7
        call sfx
        jmp short .6
.4:
        mov al, byte [byte ecx+pflags]
        and al, 40h
        movzx eax, al
        test eax, eax
        je short .6
        cmp dword [byte ebx+076h], 258h
        jl short .6
        mov eax, dword [byte ebx+076h]
        sub eax, 258h
        mov ecx, 258h
        cdq
        idiv ecx
        test edx, edx
        jne short .6
        mov eax, 45h
        call PlaySfxOr
        jmp short .6
.5:
        mov dword [byte ebx+076h], 0
.6:
        call PuckIChk
        mov eax, ebx
        call ChkOffsides
        mov eax, ebx
        call MarkTwoLinePlayers
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .18
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .8
        mov dword [psendcount], 0
.7:
        mov word [byte ebx+temp2], 78h
        jmp near .18
.8:
        mov al, byte [gmode]
        and al, 2
        movsx eax, al
        test eax, eax
        sete al
        mov edx, dword [penshotteam]
        movzx eax, al
        xor edx, eax
        cmp dword [penshotlive], byte 0
        je short .11
        test edx, edx
        jne short .9
        mov eax, dword [puckvy]
        cmp word [eax], byte 0
        jge short .10
.9:
        test edx, edx
        je short .11
        mov eax, dword [puckvy]
        cmp word [eax], byte 0
        jg short .11
.10:
        inc dword [psendcount]
        cmp dword [psendcount], byte 1Eh
        jl short .12
        call EndPenaltyShot
.11:
        mov dword [psendcount], 0
.12:
        mov ax, word [byte ebx+Xpos+2]
        cmp ax, word [dword ebx+OldXpos+2]
        jne short .7
        mov ax, word [byte ebx+Ypos+2]
        cmp ax, word [dword ebx+OldYpos+2]
        jne near .7
        mov eax, dword [puckx]
        cmp word [eax], byte 0
        jge short .13
        movsx eax, word [eax]
        neg eax
        jmp short .14
.13:
        movsx eax, word [eax]
.14:
        cmp eax, 0ADh
        jge short .17
        mov eax, dword [pucky]
        cmp word [eax], byte 0
        jge short .15
        movsx eax, word [eax]
        neg eax
        jmp short .16
.15:
        movsx eax, word [eax]
.16:
        cmp eax, 10Eh
        jge short .17
        cmp dword [hmtmnear], byte 14h
        jle short .17
        cmp dword [awtmnear], byte 14h
        jg near .7
.17:
        dec word [byte ebx+temp2]
        cmp word [byte ebx+temp2], byte 0
        jge short .18
        mov edx, 3
        mov eax, ebx
        call AddPenalty2
.18:
        cmp word [byte ebx+Zvel], byte 0
        jge short .19
        movsx eax, word [byte ebx+Zvel]
        neg eax
        jmp short .20
.19:
        movsx eax, word [byte ebx+Zvel]
.20:
        cmp eax, 100h
        jge short .22
        cmp word [byte ebx+Zpos+2], byte 0
        jne short .22
        movsx edx, word [byte ebx+SPAnum]
        mov eax, ebx
        cmp edx, byte 4
        jl short .21
        cmp edx, byte 0Ch
        jge short .21
        xor byte [byte ebx+036h], 2
.21:
        mov word [byte eax+SPAnum], 0
        mov word [byte eax+SPAcnt], 0FFFFh
        or byte [byte eax+036h], 4
        mov word [PuckObject+4Ah], 0
.22:
        mov eax, ebx
        call checkpuckcoll
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
