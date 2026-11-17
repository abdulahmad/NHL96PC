; Goalie pull: pulling the goalie late and returning goalies.
bits 32
%include "hockey.inc"
section s_4629D progbits alloc exec nowrite align=1
extern awslotcount, awtmstruct, fox, gameclock, gmode, gsp, hmslotcount, hmtmstruct
extern penshotmode, puckc, pucky, setpersonel
global CPgoalie, ChkGoalies, ReturnGoalies, ChkPullGoalieLate
;-----------------------------------------------------------------------------
; CPgoalie                           4629D  94G logic94.asm, medium confidence
; Computer team t pulls its goalie when no penalty shot runs, gsp is 2 (third
; period), t trails o by 1-2 goals (up to gsp).
;
; At most 60 s are left and the puck y is on the attacking side (sign flipped
; by the first SortCords entry's pflags bit 7).
;
; The goalie byte gets -1, the goalie's menu item is unchecked (2) and
; "pulled" checked (1) in goaliemenuflags, then setpersonel.
;-----------------------------------------------------------------------------
CPgoalie:
        push ecx
        cmp dword [penshotmode], byte 0
        jne short .2
        movsx ecx, word [gsp]
        cmp ecx, byte 2
        jne short .2
        mov dx, word [byte edx+010h]
        sub dx, word [byte eax+010h]
        test dx, dx
        jle short .2
        movsx edx, dx
        cmp edx, ecx
        jg short .2
        movsx edx, word [gameclock]
        cmp edx, byte 3Ch
        jg short .2
        mov edx, dword [dword eax+012Eh]
        mov dl, byte [byte edx+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne short .1
        neg ebx
.1:
        test bx, bx
        jl short .2
        mov byte [byte eax+03Bh], 0FFh
        call setpersonel
.2:
        pop ecx
        ret
;-----------------------------------------------------------------------------
; ChkGoalies                       462F8  93G logic93_4.asm, medium confidence
; (computer pulls goalie on delayed penalty), once a second from periodicevents.
;-----------------------------------------------------------------------------
ChkGoalies:
        push ebx
        push ecx
        push edx
        push esi
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .7
        mov eax, hmtmstruct
        mov esi, awtmstruct
        xor ecx, ecx
        jmp near .6
.1:
        cmp word [byte eax+03Ah], byte 0
        jl near .5
        mov edx, dword [puckc]
        cmp byte [edx], 0
        jl short .5
        movsx edx, byte [edx]
        cmp edx, byte 6
        setl dl
        movzx edx, dl
        mov ebx, edx
        test cx, cx
        sete dl
        movzx edx, dl
        xor ebx, edx
        jne short .5
        mov dl, byte [gmode]
        and dl, 8
        movsx edx, dl
        test edx, edx
        je short .2
        mov byte [byte eax+03Bh], 0FFh
        call setpersonel
        jmp short .5
.2:
        test cx, cx
        je short .3
        mov edx, dword [awslotcount]
        jmp short .4
.3:
        mov edx, dword [hmslotcount]
.4:
        test edx, edx
        jne short .5
        mov edx, dword [pucky]
        movsx ebx, word [edx]
        mov edx, esi
        call CPgoalie
.5:
        mov eax, awtmstruct
        mov esi, hmtmstruct
        inc ecx
.6:
        movsx edx, cx
        cmp edx, byte 2
        jl near .1
.7:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ReturnGoalies                    463AE  93G logic93_4.asm, medium confidence
; (computer returns a pulled goalie), from puckfaceoff.
;-----------------------------------------------------------------------------
ReturnGoalies:
        push ebx
        push ecx
        push edx
        mov eax, hmtmstruct
        mov edx, awtmstruct
        xor ecx, ecx
        jmp short .5
.1:
        mov bx, word [byte eax+03Ah]
        xor bh, bh
        and bl, 0F0h
        movsx ebx, bx
        test ebx, ebx
        jne short .4
        mov byte [byte eax+03Bh], 0
        test cx, cx
        je short .2
        mov ebx, dword [awslotcount]
        jmp short .3
.2:
        mov ebx, dword [hmslotcount]
.3:
        test ebx, ebx
        jne short .4
        movsx ebx, word [fox]
        call CPgoalie
.4:
        mov eax, awtmstruct
        mov edx, hmtmstruct
        inc ecx
.5:
        movsx ebx, cx
        cmp ebx, byte 2
        jl short .1
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ChkPullGoalieLate                            4640D  95 PC, medium confidence
; Player logic caller: 0 unless 3rd period (gsp 2) with at most 60 s left and
; the team is not human-controlled.
;
; Then a team-struct check (likely the score: pull the goalie late, not fully
; traced)
;-----------------------------------------------------------------------------
ChkPullGoalieLate:
        push ebx
        push ecx
        push edx
        push esi
        mov edx, eax
        imul eax, dword 136h
        add eax, hmtmstruct
        test edx, edx
        sete bl
        movzx ebx, bl
        imul ebx, dword 136h
        mov ecx, hmtmstruct
        movsx esi, word [gsp]
        add ecx, ebx
        movsx ebx, word [fox]
        cmp esi, byte 2
        je short .2
.1:
        xor eax, eax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        movsx esi, word [gameclock]
        cmp esi, byte 3Ch
        jg short .1
        test edx, edx
        je short .3
        mov edx, dword [awslotcount]
        jmp short .4
.3:
        mov edx, dword [hmslotcount]
.4:
        test edx, edx
        jne short .1
        movsx ecx, word [byte ecx+010h]
        movsx edx, word [byte eax+010h]
        sub ecx, edx
        mov edx, ecx
        test ecx, ecx
        jle short .1
        cmp ecx, byte 2
        jg short .1
        mov eax, dword [dword eax+012Eh]
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .5
        neg ebx
.5:
        test ebx, ebx
        jl short .1
        mov eax, 1
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
