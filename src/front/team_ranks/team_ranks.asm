; Team ranks by power play and penalty kill % for the pre-game screen.
bits 32
%include "hockey.inc"
section s_18E80 progbits alloc exec nowrite align=1
extern PenaltyKillRanks, PowerPlayRanks, PlayoffTreeData, RosterFileHandle, PlayoffsActive, lseek_, MakeDataPath, open_
extern qsort_, read_, MakeSeasonDbPath, CloseFile
global GetSpecialTeamsRanks, ComparePowerPlayPct, ComparePenaltyKillPct
;-----------------------------------------------------------------------------
; GetSpecialTeamsRanks                         18E80  96 PC, medium confidence
; (team, game mode, out): reads every team's record for the mode (exhibition /
; season / playoff stats file).
;
; works out power play % and penalty kill % (x1000), sorts the teams (qsort)
; and stores this team's rank in each
;-----------------------------------------------------------------------------
GetSpecialTeamsRanks:
        push ecx
        push esi
        push edi
        enter 418h, 0
        push eax
        sub ebp, 82h
        mov esi, ebx
        cmp edx, byte 3
        jne near .8
        mov edx, 110h
        lea eax, [byte ebp+052h]
        call MakeDataPath
        push dword 200h
        lea eax, [byte ebp+052h]
        push eax
        mov dword [byte ebp+076h], 0
        xor ecx, ecx
        call open_
        add esp, byte 8
        mov edi, eax
.1:
        mov edx, dword [byte ebp+076h]
        mov eax, edi
        xor ebx, ebx
        call lseek_
        mov ebx, 63h
        lea edx, [byte ebp-012h]
        mov eax, edi
        call read_
        cmp word [byte ebp+027h], byte 0
        je short .2
        movzx eax, word [byte ebp+025h]
        imul eax, dword 3E8h
        movzx ebx, word [byte ebp+027h]
        cdq
        idiv ebx
        mov dword [dword ecx+PowerPlayRanks], eax
        jmp short .3
.2:
        mov dword [dword ecx+PowerPlayRanks], 0
.3:
        cmp dword [dword ecx+PowerPlayRanks], 3E8h
        jle short .4
        mov dword [dword ecx+PowerPlayRanks], 3E8h
.4:
        cmp word [byte ebp+02Bh], byte 0
        je short .5
        movzx eax, word [byte ebp+029h]
        imul eax, dword 3E8h
        movzx ebx, word [byte ebp+02Bh]
        cdq
        idiv ebx
        mov edx, 3E8h
        sub edx, eax
        mov dword [dword ecx+PenaltyKillRanks], edx
        jmp short .6
.5:
        mov dword [dword ecx+PenaltyKillRanks], 0
.6:
        cmp dword [dword ecx+PenaltyKillRanks], byte 0
        jge short .7
        mov dword [dword ecx+PenaltyKillRanks], 0
.7:
        add ecx, byte 4
        add dword [byte ebp+076h], byte 63h
        cmp ecx, byte 68h
        jne near .1
        jmp near .34
.8:
        test edx, edx
        jne near .16
        mov edx, 6
        lea eax, [byte ebp+052h]
        call MakeDataPath
        push dword 200h
        lea eax, [byte ebp+052h]
        push eax
        mov dword [byte ebp+07Ah], 0
        xor ecx, ecx
        call open_
        add esp, byte 8
        mov edi, eax
.9:
        mov edx, dword [byte ebp+07Ah]
        mov eax, edi
        xor ebx, ebx
        call lseek_
        mov ebx, 63h
        lea edx, [byte ebp-012h]
        mov eax, edi
        call read_
        cmp word [byte ebp+027h], byte 0
        je short .10
        movzx eax, word [byte ebp+025h]
        imul eax, dword 3E8h
        movzx ebx, word [byte ebp+027h]
        cdq
        idiv ebx
        mov dword [dword ecx+PowerPlayRanks], eax
        jmp short .11
.10:
        mov dword [dword ecx+PowerPlayRanks], 0
.11:
        cmp dword [dword ecx+PowerPlayRanks], 3E8h
        jle short .12
        mov dword [dword ecx+PowerPlayRanks], 3E8h
.12:
        cmp word [byte ebp+02Bh], byte 0
        je short .13
        movzx eax, word [byte ebp+029h]
        imul eax, dword 3E8h
        movzx ebx, word [byte ebp+02Bh]
        cdq
        idiv ebx
        mov edx, 3E8h
        sub edx, eax
        mov dword [dword ecx+PenaltyKillRanks], edx
        jmp short .14
.13:
        mov dword [dword ecx+PenaltyKillRanks], 0
.14:
        cmp dword [dword ecx+PenaltyKillRanks], byte 0
        jge short .15
        mov dword [dword ecx+PenaltyKillRanks], 0
.15:
        add ecx, byte 4
        add dword [byte ebp+07Ah], byte 63h
        cmp ecx, byte 68h
        jne near .9
        jmp near .34
.16:
        cmp edx, byte 1
        jne near .24
        mov ebx, 4
        lea eax, [byte ebp+052h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword 200h
        lea eax, [byte ebp+052h]
        push eax
        mov dword [byte ebp+07Eh], 0
        xor ecx, ecx
        call open_
        add esp, byte 8
        mov edi, eax
.17:
        mov edx, dword [byte ebp+07Eh]
        mov eax, edi
        xor ebx, ebx
        call lseek_
        mov ebx, 31Bh
        lea edx, [dword ebp-0396h]
        mov eax, edi
        call read_
        cmp word [dword ebp-035Dh], byte 0
        je short .18
        movzx eax, word [dword ebp-035Fh]
        imul eax, dword 3E8h
        movzx ebx, word [dword ebp-035Dh]
        cdq
        idiv ebx
        mov dword [dword ecx+PowerPlayRanks], eax
        jmp short .19
.18:
        mov dword [dword ecx+PowerPlayRanks], 0
.19:
        cmp dword [dword ecx+PowerPlayRanks], 3E8h
        jle short .20
        mov dword [dword ecx+PowerPlayRanks], 3E8h
.20:
        cmp word [dword ebp-0359h], byte 0
        je short .21
        movzx eax, word [dword ebp-035Bh]
        imul eax, dword 3E8h
        movzx ebx, word [dword ebp-0359h]
        cdq
        idiv ebx
        mov edx, 3E8h
        sub edx, eax
        mov dword [dword ecx+PenaltyKillRanks], edx
        jmp short .22
.21:
        mov dword [dword ecx+PenaltyKillRanks], 0
.22:
        cmp dword [dword ecx+PenaltyKillRanks], byte 0
        jge short .23
        mov dword [dword ecx+PenaltyKillRanks], 0
.23:
        add ecx, byte 4
        add dword [byte ebp+07Eh], 31Bh
        cmp ecx, byte 68h
        jne near .17
        jmp near .34
.24:
        cmp edx, byte 2
        jne near .35
        cmp dword [PlayoffsActive], byte 0
        je short .25
        mov ebx, 4
        lea eax, [byte ebp+052h]
        mov edx, dword [PlayoffTreeData]
        jmp short .26
.25:
        mov ebx, 4
        lea eax, [byte ebp+052h]
        mov edx, dword [RosterFileHandle]
.26:
        call MakeSeasonDbPath
        push dword 200h
        lea eax, [byte ebp+052h]
        push eax
        mov dword [byte ebp+072h], 0
        xor ecx, ecx
        call open_
        add esp, byte 8
        mov edi, eax
.27:
        mov edx, dword [byte ebp+072h]
        mov eax, edi
        xor ebx, ebx
        call lseek_
        mov ebx, 31Bh
        lea edx, [dword ebp-0396h]
        mov eax, edi
        call read_
        cmp word [dword ebp-034Bh], byte 0
        je short .28
        movzx eax, word [dword ebp-034Dh]
        imul eax, dword 3E8h
        movzx ebx, word [dword ebp-034Bh]
        cdq
        idiv ebx
        mov dword [dword ecx+PowerPlayRanks], eax
        jmp short .29
.28:
        mov dword [dword ecx+PowerPlayRanks], 0
.29:
        cmp dword [dword ecx+PowerPlayRanks], 3E8h
        jle short .30
        mov dword [dword ecx+PowerPlayRanks], 3E8h
.30:
        cmp word [dword ebp-0347h], byte 0
        je short .31
        movzx eax, word [dword ebp-0349h]
        imul eax, dword 3E8h
        movzx ebx, word [dword ebp-0347h]
        cdq
        idiv ebx
        mov edx, 3E8h
        sub edx, eax
        mov dword [dword ecx+PenaltyKillRanks], edx
        jmp short .32
.31:
        mov dword [dword ecx+PenaltyKillRanks], 0
.32:
        cmp dword [dword ecx+PenaltyKillRanks], byte 0
        jge short .33
        mov dword [dword ecx+PenaltyKillRanks], 0
.33:
        add ecx, byte 4
        add dword [byte ebp+072h], 31Bh
        cmp ecx, byte 68h
        jne near .27
.34:
        mov eax, edi
        call CloseFile
.35:
        xor edx, edx
        xor eax, eax
.36:
        mov dword [byte eax+ebp-07Ah], edx
        inc edx
        add eax, byte 4
        cmp edx, byte 1Ah
        jl short .36
        mov ecx, ComparePowerPlayPct
        mov ebx, 4
        mov edx, 1Ah
        lea eax, [byte ebp-07Ah]
        call qsort_
        mov eax, dword [dword ebp-039Ah]
        mov eax, dword [nosplit eax*4+PowerPlayRanks]
        xor edx, edx
        mov dword [byte esi+04h], eax
        xor eax, eax
.37:
        mov ebx, dword [byte eax+ebp-07Ah]
        cmp ebx, dword [dword ebp-039Ah]
        jne short .38
        lea ebx, [byte edx+01h]
        mov dword [esi], ebx
.38:
        inc edx
        add eax, byte 4
        cmp edx, byte 1Ah
        jl short .37
        xor edx, edx
        xor eax, eax
.39:
        mov dword [byte eax+ebp-07Ah], edx
        inc edx
        add eax, byte 4
        cmp edx, byte 1Ah
        jl short .39
        mov ecx, ComparePenaltyKillPct
        mov ebx, 4
        mov edx, 1Ah
        lea eax, [byte ebp-07Ah]
        call qsort_
        mov eax, dword [dword ebp-039Ah]
        mov eax, dword [nosplit eax*4+PenaltyKillRanks]
        xor edx, edx
        mov dword [byte esi+0Ch], eax
        xor eax, eax
.40:
        mov ebx, dword [byte eax+ebp-07Ah]
        cmp ebx, dword [dword ebp-039Ah]
        jne short .41
        lea ebx, [byte edx+01h]
        mov dword [byte esi+08h], ebx
.41:
        inc edx
        add eax, byte 4
        cmp edx, byte 1Ah
        jl short .40
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; ComparePowerPlayPct                          19336  96 PC, medium confidence
; Qsort comparator for GetSpecialTeamsRanks: by power play % (PowerPlayRanks),
; then team number
;-----------------------------------------------------------------------------
ComparePowerPlayPct:
        push ebx
        push ecx
        mov ebx, dword [eax]
        mov ecx, dword [nosplit ebx*4+PowerPlayRanks]
        mov ebx, dword [edx]
        mov ebx, dword [nosplit ebx*4+PowerPlayRanks]
        cmp ecx, ebx
        je short .1
        mov eax, ebx
        sub eax, ecx
        pop ecx
        pop ebx
        ret
.1:
        mov eax, dword [eax]
        sub eax, dword [edx]
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ComparePenaltyKillPct                        1935C  96 PC, medium confidence
; Qsort comparator for GetSpecialTeamsRanks: by penalty kill %
; (PenaltyKillRanks), then team number
;-----------------------------------------------------------------------------
ComparePenaltyKillPct:
        push ebx
        push ecx
        mov ebx, dword [eax]
        mov ecx, dword [nosplit ebx*4+PenaltyKillRanks]
        mov ebx, dword [edx]
        mov ebx, dword [nosplit ebx*4+PenaltyKillRanks]
        cmp ecx, ebx
        je short .1
        mov eax, ebx
        sub eax, ecx
        pop ecx
        pop ebx
        ret
.1:
        mov eax, dword [eax]
        sub eax, dword [edx]
        pop ecx
        pop ebx
        ret
