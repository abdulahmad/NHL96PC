; Shootout path: path points, starting the path and the penalty shooter.
bits 32
%include "hockey.inc"
section s_36BF8 progbits alloc exec nowrite align=1
extern donothing, doshot, Findhittype, gmode, passdir, passspeed, PathPointTab, PenShotPathPoints
extern pspathdir, pspathside, puckc, randomd0, regd0, regd1, SetSPA, ShootoutPathData_y
extern skateto, sopathend, sopathpoint, sopathx, sopathy, updateanim, vtoa
global NextPathPoint, StartShootoutPath, asspenshooter
;-----------------------------------------------------------------------------
; NextPathPoint                                  36BF8  94G shootoutpath94.asm
; Advances the path index (sopathpoint) and loads the next point x/y/end from
; the 3-dword table ShootoutPathData (x negated by the path side).
;
; called by asspenshooter
;-----------------------------------------------------------------------------
NextPathPoint:
        push edx
        imul edx, dword [sopathpoint], byte 3
        mov eax, dword [nosplit edx*4+PenShotPathPoints]
        cmp dword [pspathside], byte 0
        jge short .1
        neg eax
.1:
        mov dword [sopathx], eax
        mov eax, edx
        inc dword [sopathpoint]
        mov edx, dword [nosplit edx*4+PathPointTab]
        mov eax, dword [nosplit eax*4+ShootoutPathData_y]
        mov dword [sopathy], edx
        mov dword [sopathend], eax
        pop edx
        ret
;-----------------------------------------------------------------------------
; StartShootoutPath           36C3A  94G shootoutpath94.asm, medium confidence
; Starts the shootout / penalty shot skate path, building it from the path
; table
;-----------------------------------------------------------------------------
StartShootoutPath:
        push ebx
        mov ebx, eax
        cmp edx, byte 3Ah
        jl near .8
        movsx edx, word [byte eax+02h]
        test edx, edx
        jge short .1
        neg edx
.1:
        cmp edx, byte 14h
        jle short .2
        mov dword [sopathx], 0
        mov dword [pspathside], 0
        jmp short .7
.2:
        mov eax, 4
        mov edx, 2Ch
        call randomd0
        test ax, ax
        je short .3
        cmp byte [byte ebx+065h], 0
        je short .5
        jmp short .4
.3:
        mov eax, 10h
        call randomd0
        cwde
        cmp eax, byte 8
        jge short .5
.4:
        mov edx, 0FFFFFFD4h
.5:
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx ebx, al
        test ebx, ebx
        jne short .6
        neg edx
.6:
        mov dword [sopathx], edx
        mov dword [pspathside], edx
.7:
        mov dword [sopathpoint], 2
        mov dword [sopathy], 12Ah
        mov dword [sopathend], 10Dh
        pop ebx
        ret
.8:
        mov eax, 4
        mov edx, 3Dh
        call randomd0
        test ax, ax
        je short .9
        cmp byte [byte ebx+065h], 0
        je short .11
        jmp short .10
.9:
        mov eax, 10h
        call randomd0
        cwde
        cmp eax, byte 8
        jge short .11
.10:
        mov edx, 0FFFFFFC3h
.11:
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .12
        neg edx
.12:
        mov dword [sopathy], 4Dh
        mov dword [sopathend], 3Ah
        mov dword [sopathx], edx
        mov dword [pspathside], edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; asspenshooter                                                   36D37  95 PC
; Asstab 2Eh (asspuckc, SetupPenaltyShot): penalty-shot carrier: assexit if
; not carrying.
;
; PickShotAim, then dekes and shoots on the goal (passdir, passspeed)
;-----------------------------------------------------------------------------
asspenshooter:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov ecx, dword [puckc]
        movsx ax, byte [ecx]
        cmp ax, word [dword ebx+086h]
        je short .2
.1:
        mov ax, word [byte ebx+01Ch]
        inc eax
        xor ah, ah
        or byte [byte ebx+044h], 2
        and al, 7
        mov word [byte ebx+01Ch], ax
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        mov al, byte [byte ebx+044h]
        and al, 8
        movzx eax, al
        test eax, eax
        jne short .1
        mov al, byte [byte ebx+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .16
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .3
        mov edx, 1
        mov eax, ebx
        call SetSPA
        mov eax, ebx
        mov word [byte ebx+03Eh], 3Ch
        call donothing
        pop edx
        pop ecx
        pop ebx
        ret
.3:
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        movsx ecx, word [byte ebx+06h]
        test eax, eax
        jne short .4
        neg ecx
.4:
        mov al, byte [byte ebx+044h]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .5
        mov word [byte ebx+026h], 0
        mov byte [byte ebx+029h], 0
        mov byte [byte ebx+028h], 8
        mov eax, 4
        and byte [byte ebx+044h], 0FDh
        mov edx, ecx
        mov dword [sopathpoint], 0
        call randomd0
        mov word [byte ebx+02Ah], ax
        mov eax, ebx
        call StartShootoutPath
.5:
        cmp dword [sopathend], byte 0
        jge near .13
        movsx ecx, word [byte ebx+036h]
        sub ecx, dword [pspathdir]
        je near .14
        inc ecx
        and ecx, byte 7
        cmp ecx, byte 3
        jl short .6
        mov eax, 4
        call randomd0
        test ax, ax
        je short .7
.6:
        cmp ecx, byte 3
        jge near .14
        mov eax, 20h
        call randomd0
        test ax, ax
        jne near .14
.7:
        mov eax, 2
        call randomd0
        movsx ecx, ax
        inc ecx
        inc ecx
        cmp dword [pspathside], byte 0
        jge short .8
        add ecx, byte 3
.8:
        mov word [passdir], cx
        movzx ax, byte [byte ebx+05Bh]
        add eax, 14h
        mov word [passspeed], ax
        mov ax, word [byte ebx+02h]
        mov word [regd0], ax
        neg word [regd0]
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .9
        mov eax, 0FFFFFE9Ch
        jmp short .10
.9:
        mov eax, 164h
.10:
        movsx edx, word [byte ebx+06h]
        sub eax, edx
        mov word [regd1], ax
        movsx edx, ax
        movsx eax, word [regd0]
        call vtoa
        movsx ecx, ax
        movsx edx, cx
        mov eax, ebx
        call Findhittype
        test ax, ax
        je short .11
        mov ecx, 10Dh
        jmp short .12
.11:
        mov ecx, 117h
.12:
        movsx edx, cx
        mov eax, ebx
        call SetSPA
        mov eax, ebx
        call updateanim
        mov eax, ebx
        mov word [byte ebx+03Ch], 2
        call doshot
        pop edx
        pop ecx
        pop ebx
        ret
.13:
        cmp ecx, dword [sopathend]
        jl short .14
        call NextPathPoint
        movsx eax, word [byte ebx+036h]
        mov dword [pspathdir], eax
.14:
        mov ax, word [sopathx]
        mov word [regd0], ax
        mov ax, word [sopathy]
        mov word [regd1], ax
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .15
        neg word [regd1]
.15:
        mov eax, ebx
        xor edx, edx
        sub byte [byte ebx+029h], 2
        call skateto
.16:
        pop edx
        pop ecx
        pop ebx
        ret
