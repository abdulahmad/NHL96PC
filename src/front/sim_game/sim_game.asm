; Simulating a game without playing it: scores and player / team stats (96 PC).
bits 32
%include "hockey.inc"
section s_81EEA progbits alloc exec nowrite align=1
extern __CHP, asc_112433, awtmgoalie, byte_16580A, byte_16580B, byte_16580C, byte_165940, byte_17CC36
extern byte_17CFB1, byte_17D26F, byte_17DADF, byte_17DAE0, byte_17DB12, byte_17DB44, byte_17DB78, seasondb
extern statsfromleague, statsplayoffs, dword_11E4B8, dword_11E4C4, dword_11E514, hmtmlines, dword_1657F6, dword_1657FA
extern dword_1657FE, dword_17CB2F, dword_17CEC3, dword_17CED6, dword_17D1E2, dword_17D928, dword_17D930, dword_17D938
extern dword_17D950, dword_17DA18, dword_17DA20, dword_17DA28, dword_17DA30, dword_17DA38, dword_17DA40, dword_17DA48
extern AwayShotTotals, dword_17DA54, dword_17DA58, dword_17DA5C, dword_17DA60, dword_17DA68, dword_17DA6C, dword_17DA70
extern dword_17DA74, dword_17DA78, dword_17DA80, dword_17DA84, dword_17DA88, dword_17DA90, dword_17DA98, dword_17DA9C
extern dword_17DAA0, dword_17DAA4, dword_17DAA8, dword_17DAAC, dword_17DAB0, dword_17DAB4, dword_17DAB8, dword_17DABC
extern dword_17DAC0, dword_17DAC4, dword_17DAC8, dword_17DACC, dword_17DAD0, dword_17DAD4, dword_17DAD8, dword_17DADC
extern gameopts, hmtmgoalie, optflags, qword_11244E, qword_112456, qword_11245E, qword_112466, qword_11246E
extern qword_112476, qword_11247E, rand_, str_Aps, str_GSUMMARYDB, str_Pblank, str_Pgblank, str_Pk
extern str_Ps, str_Tmdata, str_Tmgstats, str_Tmstats, str_Tset, PlayerDbRecord, StatsDb5Record, StatsDb1Record
extern AllocMemBlock, FreeMemBlock, UnlinkJump, tag_agset, tag_apset, tag_gset, tag_pset, unk_112428
extern unk_11242B, unk_81ED1, UpdateTeamDbs, word_1656DC, word_1656E2, hmscore, word_165812, awscore
extern word_17DB76
global SimulateGame, unk_849C1, unk_849C7, unk_849CB, unk_849D1
;-----------------------------------------------------------------------------
; SimulateGame                                 81EEA  96 PC, medium confidence
; Simulates one game without playing it: scores, player and team stats (pk,
; ps, tmstats, tmgstats, tmdata) by rand
;-----------------------------------------------------------------------------
SimulateGame:
        push esi
        push edi
        enter 254h, 0
        push eax
        push edx
        push ebx
        push ecx
        sub ebp, 132h
        mov dword [byte ebp-062h], 0
        mov ax, word [unk_81ED1]
        mov edx, 5
        mov word [dword ebp+0D6h], ax
.1:
        mov ebx, edx
        imul eax, dword [byte ebp-062h], byte 5
.2:
        inc eax
        mov byte [dword eax+ebp-0D7h], 0
        mov byte [dword eax+ebp-0CBh], 0
        cmp eax, ebx
        jne short .2
        inc dword [byte ebp-062h]
        add edx, byte 5
        cmp dword [byte ebp-062h], byte 2
        jl short .1
        mov eax, dword [dword ebp-012Ah]
        movzx eax, byte [byte eax+02h]
        mov dword [dword_17DAA8], eax
        mov eax, dword [dword ebp-012Ah]
        mov byte [dword ebp+0126h], 0
        movzx eax, byte [byte eax+03h]
        mov byte [dword ebp+0122h], 0
        mov dword [dword_17DAAC], eax
        cmp dword [dword ebp-012Eh], byte 0
        je short .3
        lea eax, [dword ebp+0D6h]
        mov dword [dword ebp-0BEh], eax
        lea eax, [dword ebp+0D7h]
        jmp short .4
.3:
        mov eax, dword [dword ebp-012Ah]
        add eax, byte 4
        mov dword [dword ebp-0BEh], eax
        mov eax, dword [dword ebp-012Ah]
        add eax, byte 5
.4:
        mov dword [dword ebp-0BAh], eax
        mov eax, dword [dword ebp-012Ah]
        mov dword [byte ebp-072h], 0
        mov dword [byte ebp-062h], 0
        mov dword [dword ebp+09Ah], 64h
        mov dword [dword ebp+09Eh], 0Ch
        mov dword [dword ebp-0A6h], 0
        mov byte [byte eax+04h], 0
        xor esi, esi
        mov byte [byte eax+05h], 0
.5:
        push byte 0
        push byte 64h
        push str_Pk
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push byte 64h
        push str_Ps
        mov dword [dword esi+dword_17DA90], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push byte 64h
        push tag_pset
        mov dword [dword esi+dword_17D930], eax
        call AllocMemBlock
        mov dword [dword esi+dword_17DA48], eax
        imul eax, dword [byte ebp-062h], byte 64h
        mov dword [dword ebp+08Ah], eax
        mov eax, dword [dword ebp+09Ah]
        add esp, byte 0Ch
        mov dword [dword ebp+08Eh], eax
.6:
        push byte 0
        push byte 2Fh
        push str_Pblank
        call AllocMemBlock
        mov edx, dword [dword ebp+08Ah]
        mov ecx, 2Fh
        add esp, byte 0Ch
        mov edi, eax
        mov dword [dword edx+dword_17D950], eax
        xor eax, eax
        add dword [dword ebp+08Ah], byte 4
        rep stosb
        mov eax, dword [dword ebp+08Ah]
        cmp eax, dword [dword ebp+08Eh]
        jne short .6
        imul eax, dword [byte ebp-062h], byte 0Ch
        mov dword [dword ebp+092h], eax
        mov eax, dword [dword ebp+09Eh]
        mov dword [dword ebp+096h], eax
.7:
        push byte 0
        push byte 36h
        push str_Pgblank
        call AllocMemBlock
        mov edx, dword [dword ebp+092h]
        mov ecx, 36h
        add esp, byte 0Ch
        mov edi, eax
        mov dword [dword edx+dword_17D938], eax
        xor eax, eax
        add dword [dword ebp+092h], byte 4
        rep stosb
        mov eax, dword [dword ebp+092h]
        cmp eax, dword [dword ebp+096h]
        jne short .7
        push byte 0
        push dword 190h
        push str_Tmstats
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push byte 12h
        push str_Tmgstats
        mov dword [dword esi+dword_17DA18], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 433h
        push str_Tmdata
        mov dword [dword esi+dword_17D928], eax
        call AllocMemBlock
        mov ecx, 190h
        add esp, byte 0Ch
        mov edi, dword [dword esi+dword_17DA18]
        mov dword [dword esi+dword_17DA38], eax
        xor eax, eax
        rep stosb
        mov ecx, 433h
        mov edi, dword [dword esi+dword_17DA38]
        xor eax, eax
        mov edx, dword [dword ebp-0A6h]
        rep stosb
        mov eax, dword [dword esi+dword_17DA18]
        mov dword [dword edx+dword_1657F6], eax
        mov eax, dword [dword esi+dword_17D928]
        mov dword [dword edx+dword_1657FA], eax
        imul eax, dword [dword esi+dword_17DAA8], dword 31Bh
        mov edx, dword [statsplayoffs]
        add eax, edx
        mov edx, dword [dword ebp-0A6h]
        mov word [dword edx+word_1656E2], 0
        push byte 0
        mov word [dword edx+word_1656DC], 0
        mov dword [dword esi+dword_17DA80], eax
        mov byte [dword edx+byte_16580B], 0
        add eax, 0D3h
        mov byte [dword edx+byte_16580C], 0
        push dword 497h
        mov dword [dword edx+hmtmlines], eax
        mov eax, dword [dword esi+dword_17DA38]
        push str_Aps
        mov dword [dword edx+dword_1657FE], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push byte 64h
        push tag_apset
        mov dword [dword esi+dword_17DA28], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0Ch
        push unk_112428
        mov dword [dword esi+dword_17DA40], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0Ch
        push unk_11242B
        mov dword [dword esi+dword_17DA88], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0Ch
        push tag_gset
        mov dword [dword esi+dword_17DA20], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0Ch
        push asc_112433
        mov dword [dword esi+dword_17DA58], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0Ch
        push tag_agset
        mov dword [dword esi+dword_17DA78], eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [dword esi+dword_17DA60], eax
        cmp dword [dword ebp-012Eh], byte 0
        je short .8
        push byte 0
        push byte 12h
        push str_Tset
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [dword esi+AwayShotTotals], eax
.8:
        add dword [dword ebp+09Ah], byte 64h
        add dword [dword ebp+09Eh], byte 0Ch
        add dword [dword ebp-0A6h], 136h
        inc dword [byte ebp-062h]
        add esi, byte 4
        cmp dword [byte ebp-062h], byte 2
        jl near .5
        mov dword [byte ebp-06Eh], 0
        mov dword [byte ebp-062h], 0
        xor ebx, ebx
.9:
        mov eax, dword [byte ebp-062h]
        mov byte [dword eax+ebp+0E6h], 0
        imul eax, dword [dword ebx+dword_17DAA8], dword 31Bh
        mov edx, dword [statsplayoffs]
        add eax, edx
        mov dword [dword ebx+dword_17DA80], eax
        cmp dword [dword ebp-0126h], byte 0
        je short .10
        cmp dword [dword ebp-012Eh], byte 0
        jne short .12
        add eax, byte 41h
        jmp short .11
.10:
        cmp dword [dword ebp-012Eh], byte 0
        jne short .12
        add eax, byte 2Fh
.11:
        mov dword [dword ebx+AwayShotTotals], eax
.12:
        mov eax, dword [byte ebp-062h]
        mov byte [dword eax+ebp+0DAh], 0B4h
        imul eax, dword [dword ebx+dword_17DAA8], byte 63h
        mov edx, dword [statsfromleague]
        add eax, edx
        mov dword [dword ebx+dword_17DA68], 0
        mov dword [dword ebx+dword_17DA30], eax
        mov ecx, eax
        movzx eax, word [byte eax+037h]
        imul eax, dword 3E8h
        movzx esi, word [byte ecx+039h]
        cdq
        idiv esi
        mov dword [dword ebx+dword_17DA98], eax
        movzx eax, word [byte ecx+03Bh]
        imul eax, dword 3E8h
        movzx ecx, word [byte ecx+03Dh]
        cdq
        idiv ecx
        add ebx, byte 4
        inc dword [byte ebp-062h]
        mov dword [dword ebx+dword_17DA9C], eax
        cmp dword [byte ebp-062h], byte 2
        jl near .9
        mov dword [byte ebp-062h], 0
        mov dword [dword ebp-0A2h], 0
        mov dword [dword ebp+0A2h], 0
        mov dword [dword ebp+0A6h], 0
        jmp near .38
.13:
        mov dword [byte ebp-066h], 0
        mov ebx, dword [byte ebp-062h]
        mov eax, dword [dword ebp+0A2h]
        mov edi, dword [dword ebp-0A2h]
        xor ecx, ecx
        shl ebx, 2
        mov dword [byte ebp-05Ah], eax
        jmp near .28
.14:
        mov byte [dword edi+ebp-0122h], 0
        mov byte [dword edi+byte_17DB44], 0
        mov eax, dword [dword ebx+dword_17DA80]
        mov byte [dword edi+byte_17DB12], 0
        mov byte [dword edi+byte_17DAE0], 0
        mov eax, dword [byte ecx+eax+063h]
        cmp eax, byte 0FFFFFFFFh
        je near .27
        call PlayerDbRecord
        mov edx, eax
        mov eax, dword [dword ebx+dword_17DA90]
        mov dword [ecx+eax], edx
        cmp dword [byte ebp-06Eh], byte 0
        jne near .22
        mov eax, dword [dword ebx+dword_17DA90]
        mov eax, dword [ecx+eax]
        mov eax, dword [byte eax+028h]
        call StatsDb1Record
        mov edx, eax
        mov eax, dword [dword ebx+dword_17DA28]
        mov dword [ecx+eax], edx
        mov eax, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+eax]
        cmp word [esi], byte 0
        je near .17
        cmp word [byte esi+0Eh], byte 0
        je short .15
        movzx eax, word [byte esi+02h]
        imul eax, byte 64h
        movzx edx, word [byte esi+0Eh]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        cmp eax, byte 14h
        jl short .15
        imul ax, word [byte esi+0Eh], byte 3
        mov word [byte esi+0Eh], ax
.15:
        mov eax, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+eax]
        cmp word [byte esi+0Eh], byte 0
        je short .16
        movzx eax, word [byte esi+02h]
        imul eax, byte 64h
        movzx edx, word [byte esi+0Eh]
        mov dword [byte ebp-05Eh], edx
        cdq
        idiv dword [byte ebp-05Eh]
        cmp eax, byte 0Fh
        jl short .16
        cmp dword [byte ebp-05Eh], byte 3Ch
        jge short .16
        shl word [byte esi+0Eh], 1
.16:
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+0Eh]
        imul eax, byte 54h
        movzx edx, word [esi]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+0Eh], ax
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+0Ch]
        imul eax, byte 54h
        movzx edx, word [esi]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+0Ch], ax
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+0Ah]
        imul eax, byte 54h
        movzx edx, word [esi]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+0Ah], ax
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+08h]
        imul eax, byte 54h
        movzx edx, word [esi]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+08h], ax
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+04h]
        imul eax, byte 54h
        movzx edx, word [esi]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+04h], ax
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+02h]
        imul eax, byte 54h
        movzx edx, word [esi]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+02h], ax
        mov eax, dword [dword ebx+dword_17DA28]
        mov eax, dword [ecx+eax]
        mov dx, word [byte eax+02h]
        add dx, word [byte eax+04h]
        mov word [byte eax+06h], dx
        mov eax, dword [dword ebx+dword_17DA28]
        mov eax, dword [ecx+eax]
        mov word [eax], 54h
.17:
        mov eax, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+eax]
        cmp word [byte esi+012h], byte 0
        je near .19
        cmp word [byte esi+020h], byte 0
        je short .18
        movzx eax, word [byte esi+014h]
        imul eax, byte 64h
        movzx edx, word [byte esi+020h]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        cmp eax, byte 20h
        jle short .18
        imul ax, word [byte esi+020h], byte 3
        mov word [byte esi+020h], ax
.18:
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+020h]
        imul eax, byte 54h
        movzx edx, word [byte esi+012h]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+020h], ax
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+01Eh]
        imul eax, byte 54h
        movzx edx, word [byte esi+012h]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+01Eh], ax
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+01Ch]
        imul eax, byte 54h
        movzx edx, word [byte esi+012h]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+01Ch], ax
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+01Ah]
        imul eax, byte 54h
        movzx edx, word [byte esi+012h]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+01Ah], ax
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+016h]
        imul eax, byte 54h
        movzx edx, word [byte esi+012h]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+016h], ax
        mov esi, dword [dword ebx+dword_17DA28]
        mov esi, dword [ecx+esi]
        movzx eax, word [byte esi+014h]
        imul eax, byte 54h
        movzx edx, word [byte esi+012h]
        mov dword [byte ebp+06Ah], edx
        cdq
        idiv dword [byte ebp+06Ah]
        mov word [byte esi+014h], ax
        mov eax, dword [dword ebx+dword_17DA28]
        mov eax, dword [ecx+eax]
        mov dx, word [byte eax+014h]
        add dx, word [byte eax+016h]
        mov word [byte eax+018h], dx
        mov eax, dword [dword ebx+dword_17DA28]
        mov eax, dword [ecx+eax]
        mov word [byte eax+012h], 54h
.19:
        cmp dword [dword ebp-0126h], byte 0
        je short .20
        mov eax, dword [dword ebx+dword_17DA28]
        mov edx, dword [ecx+eax]
        mov eax, dword [dword ebx+dword_17DA40]
        add edx, byte 12h
        mov dword [ecx+eax], edx
        jmp short .21
.20:
        mov eax, dword [dword ebx+dword_17DA28]
        mov edx, dword [dword ebx+dword_17DA40]
        mov eax, dword [ecx+eax]
        mov dword [ecx+edx], eax
.21:
        mov eax, dword [dword ebx+dword_17DA28]
        mov eax, dword [ecx+eax]
        movzx eax, word [byte eax+0Ch]
        add dword [dword ebx+dword_17DA68], eax
.22:
        cmp dword [byte ebp-06Eh], byte 0
        jne short .27
        mov eax, dword [dword ebx+dword_17DA90]
        mov eax, dword [ecx+eax]
        mov eax, dword [byte eax+02Ch]
        cmp dword [dword ebp-012Eh], byte 0
        je short .23
        mov eax, dword [byte ebp-05Ah]
        mov edx, dword [dword ebx+dword_17D930]
        mov eax, dword [dword ecx+eax+dword_17D950]
        mov dword [ecx+edx], eax
        jmp short .24
.23:
        call StatsDb5Record
        mov edx, eax
        mov eax, dword [dword ebx+dword_17D930]
        mov dword [ecx+eax], edx
.24:
        cmp dword [dword ebp-0126h], byte 0
        je short .25
        mov eax, dword [dword ebx+dword_17D930]
        mov edx, dword [ecx+eax]
        mov eax, dword [dword ebx+dword_17DA48]
        add edx, byte 12h
        jmp short .26
.25:
        mov edx, dword [dword ebx+dword_17D930]
        mov eax, dword [dword ebx+dword_17DA48]
        mov edx, dword [ecx+edx]
.26:
        mov dword [ecx+eax], edx
.27:
        inc dword [byte ebp-066h]
        inc edi
        add ecx, byte 4
.28:
        cmp ecx, byte 64h
        jge short .29
        cmp dword [byte ebp-06Eh], byte 0
        je near .14
.29:
        mov dword [byte ebp-066h], 0
        mov ebx, dword [byte ebp-062h]
        mov ecx, dword [dword ebp+0A6h]
        xor esi, esi
        shl ebx, 2
        jmp near .36
.30:
        mov eax, dword [dword ebx+dword_17DA80]
        mov eax, dword [dword esi+eax+0C7h]
        cmp eax, byte 0FFFFFFFFh
        je near .35
        call PlayerDbRecord
        mov edx, eax
        mov eax, dword [dword ebx+dword_17DA88]
        mov dword [esi+eax], edx
        cmp dword [byte ebp-06Eh], byte 0
        jne short .31
        mov eax, dword [dword ebx+dword_17DA88]
        mov eax, dword [esi+eax]
        mov eax, dword [byte eax+028h]
        call StatsDb1Record
        mov edx, eax
        mov eax, dword [dword ebx+dword_17DA78]
        mov dword [esi+eax], edx
        mov eax, dword [dword ebx+dword_17DA78]
        mov edx, dword [dword ebx+dword_17DA60]
        mov eax, dword [esi+eax]
        mov dword [edx+esi], eax
.31:
        cmp dword [byte ebp-06Eh], byte 0
        jne short .35
        mov eax, dword [dword ebx+dword_17DA88]
        mov eax, dword [esi+eax]
        mov eax, dword [byte eax+02Ch]
        cmp dword [dword ebp-012Eh], byte 0
        je short .32
        mov eax, dword [dword ebx+dword_17DA20]
        mov edx, dword [dword ecx+esi+dword_17D938]
        jmp short .33
.32:
        call StatsDb5Record
        mov edx, eax
        mov eax, dword [dword ebx+dword_17DA20]
.33:
        mov dword [esi+eax], edx
        cmp dword [dword ebp-0126h], byte 0
        je short .34
        mov eax, dword [dword ebx+dword_17DA20]
        mov edx, dword [esi+eax]
        mov eax, dword [dword ebx+dword_17DA58]
        add edx, byte 16h
        mov dword [esi+eax], edx
        jmp short .35
.34:
        mov eax, dword [dword ebx+dword_17DA20]
        mov edx, dword [dword ebx+dword_17DA58]
        mov eax, dword [esi+eax]
        mov dword [edx+esi], eax
.35:
        inc dword [byte ebp-066h]
        add esi, byte 4
.36:
        cmp esi, byte 0Ch
        jge short .37
        cmp dword [byte ebp-06Eh], byte 0
        je near .30
.37:
        add dword [dword ebp-0A2h], byte 19h
        add dword [dword ebp+0A2h], byte 64h
        add dword [dword ebp+0A6h], byte 0Ch
        inc dword [byte ebp-062h]
.38:
        cmp dword [byte ebp-062h], byte 2
        jge short .39
        cmp dword [byte ebp-06Eh], byte 0
        je near .13
.39:
        mov dword [byte ebp-062h], 0
        mov esi, 19h
        xor ebx, ebx
        jmp near .60
.40:
        mov eax, dword [byte ebp-062h]
        mov byte [dword eax+ebp+0D2h], 5
        imul eax, dword [dword ebx+dword_17DA68], dword 3E8h
        mov ecx, 54h
        cdq
        idiv ecx
        mov ecx, 7FFFh
        mov dword [dword ebx+dword_17DA68], eax
        call rand_
        cdq
        idiv ecx
        mov eax, edx
        and eax, ecx
        mov ecx, 3E8h
        cdq
        idiv ecx
        cmp edx, 136h
        jle short .41
        mov eax, dword [dword ebx+dword_17DA80]
        mov al, byte [dword eax+0107h]
        mov edx, dword [byte ebp-062h]
        sub al, 19h
        mov dword [dword ebx+ebp-0B6h], 0
        jmp short .42
.41:
        mov eax, dword [dword ebx+dword_17DA80]
        mov al, byte [dword eax+0108h]
        mov edx, dword [byte ebp-062h]
        sub al, 19h
        mov dword [dword ebx+ebp-0B6h], 1
.42:
        mov byte [dword edx+ebp+0CEh], al
        mov eax, dword [dword ebx+AwayShotTotals]
        mov edx, dword [byte ebp-062h]
        inc byte [eax]
        movzx edx, byte [dword edx+ebp+0CEh]
        mov eax, dword [dword ebx+dword_17DA58]
        shl edx, 2
        mov eax, dword [edx+eax]
        mov edx, esi
        inc word [eax]
        imul eax, dword [byte ebp-062h], byte 19h
.43:
        inc eax
        mov byte [dword eax+byte_17DADF], 0
        cmp eax, edx
        jne short .43
        imul eax, dword [byte ebp-062h], byte 19h
        mov dword [byte ebp-066h], 19h
        mov edi, dword [dword ebx+dword_17DA80]
        mov dword [byte ebp-066h], 0
        lea ecx, [byte edi+03h]
        mov dword [byte ebp-052h], eax
.44:
        imul eax, dword [byte ebp-066h], byte 3
        mov dword [dword ebp+0AAh], ecx
        add eax, edi
.45:
        mov dl, byte [dword eax+0D3h]
        movzx edx, dl
        mov dword [byte ebp-056h], edx
        cmp edx, byte 19h
        jge short .46
        mov edx, dword [byte ebp-052h]
        add edx, dword [byte ebp-056h]
        inc byte [dword edx+byte_17DAE0]
.46:
        inc eax
        cmp eax, dword [dword ebp+0AAh]
        jne short .45
        inc dword [byte ebp-066h]
        add ecx, byte 3
        cmp dword [byte ebp-066h], byte 4
        jl short .44
        imul eax, dword [byte ebp-062h], byte 19h
        mov dword [byte ebp-04Ah], eax
        mov eax, dword [dword ebx+dword_17DA80]
        mov dword [byte ebp-066h], 0
        mov dword [byte ebp-04Eh], eax
        lea ecx, [byte eax+02h]
.47:
        mov eax, dword [byte ebp-066h]
        add eax, eax
        mov dword [dword ebp+0AEh], ecx
        add eax, dword [byte ebp-04Eh]
.48:
        mov dl, byte [dword eax+0DFh]
        movzx edx, dl
        cmp edx, byte 19h
        jge short .49
        add edx, dword [byte ebp-04Ah]
        inc byte [dword edx+byte_17DAE0]
.49:
        inc eax
        cmp eax, dword [dword ebp+0AEh]
        jne short .48
        inc dword [byte ebp-066h]
        inc ecx
        inc ecx
        cmp dword [byte ebp-066h], byte 3
        jl short .47
        imul eax, dword [byte ebp-062h], byte 19h
        mov dword [byte ebp-042h], eax
        mov eax, dword [dword ebx+dword_17DA80]
        mov dword [byte ebp-066h], 0
        mov dword [byte ebp-046h], eax
        lea ecx, [byte eax+05h]
.50:
        imul eax, dword [byte ebp-066h], byte 5
        mov edx, dword [byte ebp-046h]
        mov dword [byte ebp+07Ah], ecx
        add edx, eax
.51:
        mov al, byte [dword edx+0E5h]
        movzx eax, al
        cmp eax, byte 19h
        jge short .52
        add eax, dword [byte ebp-042h]
        inc byte [dword eax+byte_17DAE0]
.52:
        inc edx
        cmp edx, dword [byte ebp+07Ah]
        jne short .51
        inc dword [byte ebp-066h]
        add ecx, byte 5
        cmp dword [byte ebp-066h], byte 2
        jl short .50
        imul eax, dword [byte ebp-062h], byte 19h
        mov dword [byte ebp-03Ah], eax
        mov eax, dword [dword ebx+dword_17DA80]
        mov dword [byte ebp-066h], 0
        mov dword [byte ebp-03Eh], eax
        lea ecx, [byte eax+04h]
.53:
        mov eax, dword [byte ebp-066h]
        shl eax, 2
        mov dword [dword ebp+0B2h], ecx
        add eax, dword [byte ebp-03Eh]
.54:
        mov dl, byte [dword eax+0F9h]
        movzx edx, dl
        cmp edx, byte 19h
        jge short .55
        add edx, dword [byte ebp-03Ah]
        inc byte [dword edx+byte_17DAE0]
.55:
        inc eax
        cmp eax, dword [dword ebp+0B2h]
        jne short .54
        inc dword [byte ebp-066h]
        add ecx, byte 4
        cmp dword [byte ebp-066h], byte 2
        jl short .53
        mov edx, dword [dword ebx+dword_17DA80]
        mov eax, edx
        inc edx
        inc edx
        mov dword [dword ebp-09Eh], edx
        imul ecx, dword [byte ebp-062h], byte 19h
.56:
        mov dl, byte [dword eax+0F7h]
        movzx edx, dl
        cmp edx, byte 19h
        jge short .57
        inc byte [dword ecx+edx+byte_17DAE0]
.57:
        inc eax
        cmp eax, dword [dword ebp-09Eh]
        jne short .56
        mov edi, ebx
        xor ecx, ecx
        imul eax, dword [byte ebp-062h], byte 19h
.58:
        cmp byte [dword eax+byte_17DAE0], 0
        je short .59
        mov edx, dword [dword edi+dword_17DA48]
        mov edx, dword [ecx+edx]
        inc word [edx]
.59:
        inc eax
        add ecx, byte 4
        mov byte [dword eax+byte_17DADF], 0
        cmp ecx, byte 64h
        jne short .58
        inc dword [byte ebp-062h]
        add esi, byte 19h
        add ebx, byte 4
.60:
        cmp dword [byte ebp-062h], byte 2
        jge short .61
        cmp dword [byte ebp-06Eh], byte 0
        je near .40
.61:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        and eax, 600h
        cmp eax, 400h
        jne short .62
        mov dword [byte ebp-07Ah], 3Ch
        jmp short .64
.62:
        cmp eax, 200h
        jne short .63
        mov dword [byte ebp-07Ah], 1Eh
        jmp short .64
.63:
        mov dword [byte ebp-07Ah], 0Fh
.64:
        mov eax, dword [byte ebp-07Ah]
        mov dword [byte ebp-066h], 0
        dec eax
        mov dword [byte ebp-076h], 0
        mov dword [byte ebp+076h], eax
        jmp near .140
.65:
        cmp byte [dword ebp+0126h], 0
        jne short .69
        xor esi, esi
.66:
        mov edi, esi
        mov ebx, esi
        xor ecx, ecx
.67:
        call rand_
        mov dword [dword ebp+0CAh], 0Ah
        cdq
        idiv dword [dword ebp+0CAh]
        cmp edx, ecx
        je short .68
        mov eax, edx
        mov edx, dword [dword edi+eax*4+dword_11E4C4]
        xor dword [dword ebx+dword_11E4C4], edx
        mov edx, dword [dword ebx+dword_11E4C4]
        xor dword [dword edi+eax*4+dword_11E4C4], edx
        mov eax, dword [dword edi+eax*4+dword_11E4C4]
        xor dword [dword ebx+dword_11E4C4], eax
.68:
        inc ecx
        add ebx, byte 4
        cmp ecx, byte 0Ah
        jl short .67
        add esi, byte 28h
        cmp esi, byte 50h
        jne short .66
.69:
        cmp byte [dword ebp+0122h], 0
        jne short .73
        xor esi, esi
.70:
        mov edi, esi
        mov ebx, esi
        xor ecx, ecx
.71:
        call rand_
        mov dword [dword ebp+0CAh], 3
        cdq
        idiv dword [dword ebp+0CAh]
        cmp edx, ecx
        je short .72
        mov eax, edx
        mov edx, dword [dword edi+eax*4+dword_11E514]
        xor dword [dword ebx+dword_11E514], edx
        mov edx, dword [dword ebx+dword_11E514]
        xor dword [dword edi+eax*4+dword_11E514], edx
        mov eax, dword [dword edi+eax*4+dword_11E514]
        xor dword [dword ebx+dword_11E514], eax
.72:
        inc ecx
        add ebx, byte 4
        cmp ecx, byte 3
        jl short .71
        add esi, byte 0Ch
        cmp esi, byte 18h
        jne short .70
.73:
        mov dword [byte ebp-062h], 2
        xor edx, edx
        mov dword [byte ebp-062h], 0
.74:
        mov eax, dword [byte ebp-062h]
        mov ebx, dword [byte ebp-062h]
        mov al, byte [dword eax+ebp+0D2h]
        mov byte [dword ebx+ebp+0D2h], 0
        mov byte [dword ebx+ebp+0DEh], al
        lea ebx, [ebx+ebx*4]
        mov eax, ebx
        lea ecx, [byte ebx+05h]
        mov ebx, dword [byte ebp-062h]
.75:
        cmp byte [dword eax+ebp-0D6h], 0
        jbe short .76
        dec byte [dword eax+ebp-0D6h]
.76:
        cmp byte [dword eax+ebp-0D6h], 0
        jne short .77
        inc byte [dword ebx+ebp+0D2h]
.77:
        inc eax
        cmp eax, ecx
        jne short .75
        add edx, byte 4
        inc dword [byte ebp-062h]
        mov dword [dword edx+dword_17DA6C], 0
        cmp dword [byte ebp-062h], byte 2
        jl short .74
        mov al, byte [dword ebp+0DEh]
        cmp al, byte [dword ebp+0D2h]
        jne short .78
        mov al, byte [dword ebp+0DFh]
        cmp al, byte [dword ebp+0D3h]
        je short .81
.78:
        mov al, byte [dword ebp+0D2h]
        cmp al, byte [dword ebp+0D3h]
        jbe short .79
        mov al, byte [dword ebp+0DEh]
        cmp al, byte [dword ebp+0DFh]
        ja short .79
        mov eax, dword [AwayShotTotals]
        inc word [byte eax+0Ah]
        mov eax, dword [dword_17DA54]
        inc word [word_1656DC]
        jmp short .80
.79:
        mov al, byte [dword ebp+0D3h]
        cmp al, byte [dword ebp+0D2h]
        jbe short .81
        mov al, byte [dword ebp+0DFh]
        cmp al, byte [dword ebp+0DEh]
        ja short .81
        mov eax, dword [dword_17DA54]
        inc word [byte eax+0Ah]
        mov eax, dword [AwayShotTotals]
        inc word [word_165812]
.80:
        inc word [byte eax+0Eh]
.81:
        mov al, byte [dword ebp+0D2h]
        cmp al, byte [dword ebp+0D3h]
        jbe short .82
        mov eax, dword [dword_17DA98]
        add eax, eax
        add eax, dword [dword_17DAA4]
        cdq
        shl edx, 3
        LD sbb, eax, edx
        sar eax, 3
        movzx ebx, byte [dword ebp+0D3h]
        movzx edx, byte [dword ebp+0D2h]
        sub edx, ebx
        imul eax, edx
        mov dword [dword_17DA70], eax
        neg eax
        add eax, eax
        mov dword [dword_17DA74], eax
        jmp short .83
.82:
        mov al, byte [dword ebp+0D3h]
        cmp al, byte [dword ebp+0D2h]
        jbe short .83
        mov eax, dword [dword_17DA9C]
        add eax, eax
        add eax, dword [dword_17DAA0]
        cdq
        shl edx, 3
        LD sbb, eax, edx
        sar eax, 3
        movzx ebx, byte [dword ebp+0D3h]
        movzx edx, byte [dword ebp+0D2h]
        sub ebx, edx
        imul eax, ebx
        mov dword [dword_17DA74], eax
        neg eax
        add eax, eax
        mov dword [dword_17DA70], eax
.83:
        mov dword [byte ebp-062h], 0
        mov eax, dword [byte ebp-076h]
        mov dword [dword ebp-09Ah], 5
        mov dword [dword ebp+0BAh], 0
        mov dword [byte ebp+036h], 0
        mov dword [byte ebp+03Ah], 0
        xor edi, edi
        xor ebx, ebx
        inc eax
        mov dword [dword ebp-096h], edi
        mov dword [byte ebp+02h], eax
.84:
        call rand_
        mov ecx, 3E8h
        cdq
        idiv ecx
        mov esi, dword [byte ebp-062h]
        movzx esi, byte [dword esi+ebp+0DAh]
        mov eax, dword [dword ebx+dword_17DA68]
        mov ecx, edx
        cdq
        idiv esi
        cmp ecx, eax
        jge near .95
        mov eax, dword [gameopts]
        test byte [byte eax+01h], 1
        je near .95
        mov byte [dword ebp+0F2h], 0FFh
        mov eax, dword [dword ebp+0BAh]
        mov dword [byte ebp-026h], ebx
        mov dword [byte ebp-036h], eax
        mov eax, dword [dword ebx+dword_17DA80]
        mov dword [byte ebp-02Ah], edi
        mov dword [byte ebp-032h], eax
        mov eax, dword [dword ebx+dword_17DA40]
        xor ecx, ecx
        mov dword [byte ebp-02Eh], eax
.85:
        movzx eax, byte [dword ebp+0126h]
        shl eax, 2
        add eax, dword [byte ebp-036h]
        imul eax, dword [dword eax+dword_11E4C4], byte 3
        add eax, dword [byte ebp-032h]
        mov al, byte [dword ecx+eax+0D3h]
        movzx esi, al
        mov byte [dword ebp+010Eh], al
        mov eax, esi
        shl eax, 2
        add eax, dword [byte ebp-02Eh]
        mov eax, dword [eax]
        movzx eax, word [byte eax+0Ch]
        imul eax, dword 3E8h
        mov dword [dword ebp+0CAh], 54h
        cdq
        idiv dword [dword ebp+0CAh]
        mov dword [dword ebp+0CAh], 3Ch
        cdq
        idiv dword [dword ebp+0CAh]
        mov edx, eax
        mov eax, dword [byte ebp-02Ah]
        add eax, esi
        movzx eax, byte [dword eax+ebp-0122h]
        imul eax, dword 3E8h
        sub edx, eax
        movzx eax, byte [dword ebp+0F2h]
        mov dword [dword_17DAD0], edx
        cmp eax, 0FFh
        je short .86
        cmp edx, dword [dword_17DAD4]
        jle short .87
.86:
        mov edx, dword [byte ebp-026h]
        movzx eax, byte [dword ebp+010Eh]
        mov edx, dword [dword edx+dword_17DA48]
        mov eax, dword [edx+eax*4]
        mov dword [dword_17DAC4], eax
        mov eax, dword [dword_17DAD0]
        mov dword [dword_17DAD4], eax
        mov al, byte [dword ebp+010Eh]
        mov byte [dword ebp+0F2h], cl
        mov byte [dword ebp+010Ah], al
.87:
        inc ecx
        cmp ecx, byte 3
        jl near .85
        mov eax, dword [byte ebp+036h]
        xor ecx, ecx
        mov dword [byte ebp-022h], eax
        mov al, cl
        add al, 3
        mov byte [dword ebp+011Ah], al
        mov eax, dword [dword ebx+dword_17DA80]
        mov dword [dword ebp+086h], ebx
        mov dword [byte ebp-01Eh], eax
        mov eax, dword [dword ebx+dword_17DA40]
        mov dword [byte ebp-012h], edi
        mov dword [byte ebp-016h], eax
.88:
        movzx eax, byte [dword ebp+0122h]
        shl eax, 2
        add eax, dword [byte ebp-022h]
        mov eax, dword [dword eax+dword_11E514]
        add eax, eax
        add eax, dword [byte ebp-01Eh]
        mov al, byte [dword ecx+eax+0DFh]
        movzx esi, al
        mov byte [dword ebp+0102h], al
        mov eax, esi
        shl eax, 2
        mov dword [byte ebp-01Ah], eax
        mov eax, dword [byte ebp-016h]
        add eax, dword [byte ebp-01Ah]
        mov eax, dword [eax]
        movzx eax, word [byte eax+0Ch]
        imul eax, dword 3E8h
        mov dword [byte ebp+06Ah], 54h
        cdq
        idiv dword [byte ebp+06Ah]
        mov dword [dword ebp+0CAh], 3Ch
        cdq
        idiv dword [dword ebp+0CAh]
        mov edx, eax
        mov eax, dword [byte ebp-012h]
        add eax, esi
        movzx eax, byte [dword eax+ebp-0122h]
        imul eax, dword 3E8h
        sub edx, eax
        mov dword [dword_17DAD0], edx
        cmp edx, dword [dword_17DAD4]
        jle short .89
        mov eax, dword [dword ebp+086h]
        mov eax, dword [dword eax+dword_17DA48]
        add eax, dword [byte ebp-01Ah]
        mov eax, dword [eax]
        mov dword [dword_17DAC4], eax
        mov al, byte [dword ebp+011Ah]
        mov byte [dword ebp+0F2h], al
        mov al, byte [dword ebp+0102h]
        mov dword [dword_17DAD4], edx
        mov byte [dword ebp+010Ah], al
.89:
        inc ecx
        inc byte [dword ebp+011Ah]
        cmp ecx, byte 2
        jl near .88
        movzx eax, byte [dword ebp+0F2h]
        add eax, dword [dword ebp-096h]
        cmp byte [dword eax+ebp-0D6h], 0
        jne near .92
        call rand_
        mov ecx, 3E8h
        cdq
        idiv ecx
        cmp edx, byte 3Ch
        jge short .90
        mov dl, 5
        jmp short .91
.90:
        mov dl, 2
.91:
        movzx eax, byte [dword ebp+0F2h]
        mov dh, dl
        add eax, dword [dword ebp-096h]
        inc dh
        mov byte [dword eax+ebp-0D6h], dh
        movzx cx, dl
        mov eax, dword [dword_17DAC4]
        movzx edx, byte [dword ebp+010Ah]
        add word [byte eax+0Ch], cx
        add edx, edi
        mov eax, dword [dword ebx+AwayShotTotals]
        inc byte [dword edx+ebp-0122h]
        add word [byte eax+010h], cx
        mov eax, dword [byte ebp+03Ah]
        sub dword [dword ebx+dword_17DA68], 3E8h
        inc word [dword eax+word_1656E2]
.92:
        mov eax, dword [byte ebp-062h]
        add dword [dword ebp-09Ah], byte 5
        add dword [dword ebp+0BAh], byte 28h
        add dword [byte ebp+036h], byte 0Ch
        add dword [byte ebp+03Ah], 136h
        add dword [dword ebp-096h], byte 5
        mov edx, dword [dword ebx+dword_17DA58]
        movzx eax, byte [dword eax+ebp+0CEh]
        add edi, byte 19h
        mov eax, dword [edx+eax*4]
        add ebx, byte 4
        inc dword [byte ebp-062h]
        inc word [byte eax+0Ch]
        cmp dword [byte ebp-062h], byte 2
        jl near .84
        inc byte [dword ebp+0126h]
        movzx eax, byte [dword ebp+0126h]
        cmp eax, byte 0Ah
        jne short .93
        mov byte [dword ebp+0126h], 0
.93:
        inc byte [dword ebp+0122h]
        movzx eax, byte [dword ebp+0122h]
        cmp eax, byte 3
        jne short .94
        mov byte [dword ebp+0122h], 0
.94:
        mov eax, dword [byte ebp-066h]
        cmp eax, dword [byte ebp+076h]
        jne near .139
        lea ebx, [byte eax-01h]
        cmp dword [dword ebp-0126h], byte 0
        je near .137
        mov eax, dword [dword ebp-0BEh]
        mov dl, byte [eax]
        mov eax, dword [dword ebp-0BAh]
        cmp dl, byte [eax]
        jne near .139
        jmp near .138
.95:
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        movzx edx, byte [dword eax+ebp+0CEh]
        shl edx, 2
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        mov eax, dword [nosplit eax*4+dword_17DA60]
        mov eax, dword [edx+eax]
        cmp word [eax], byte 0
        je short .96
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        movzx edx, byte [dword eax+ebp+0CEh]
        shl edx, 2
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        mov eax, dword [nosplit eax*4+dword_17DA60]
        mov eax, dword [edx+eax]
        movzx eax, word [byte eax+012h]
        imul esi, eax, dword 3E8h
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        movzx edx, byte [dword eax+ebp+0CEh]
        shl edx, 2
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        mov eax, dword [nosplit eax*4+dword_17DA60]
        mov eax, dword [edx+eax]
        movzx ecx, word [eax]
        mov eax, esi
        cdq
        idiv ecx
        mov ecx, 3Ch
        cdq
        idiv ecx
        mov dword [dword_17DABC], eax
        jmp short .97
.96:
        mov dword [dword_17DABC], 3E8h
.97:
        mov eax, dword [dword ebx+dword_17DA80]
        mov esi, dword [dword ebp+0BAh]
        mov dword [byte ebp-0Eh], eax
        mov eax, dword [dword ebx+dword_17DA40]
        xor ecx, ecx
        mov dword [byte ebp-0Ah], eax
.98:
        movzx eax, byte [dword ebp+0126h]
        imul eax, dword [dword esi+eax*4+dword_11E4C4], byte 3
        add eax, dword [byte ebp-0Eh]
        mov al, byte [dword ecx+eax+0D3h]
        movzx eax, al
        shl eax, 2
        add eax, dword [byte ebp-0Ah]
        mov eax, dword [eax]
        movzx eax, word [byte eax+0Eh]
        imul eax, dword 3E8h
        mov dword [dword ebp+0CAh], 54h
        cdq
        idiv dword [dword ebp+0CAh]
        mov dword [dword ebp+0CAh], 3Ch
        cdq
        idiv dword [dword ebp+0CAh]
        inc ecx
        add dword [dword_17DABC], eax
        cmp ecx, byte 3
        jl short .98
        mov eax, dword [dword ebx+dword_17DA80]
        mov esi, dword [byte ebp+036h]
        mov dword [byte ebp-06h], eax
        mov eax, dword [dword ebx+dword_17DA40]
        xor ecx, ecx
        mov dword [byte ebp-02h], eax
.99:
        movzx eax, byte [dword ebp+0122h]
        mov eax, dword [dword esi+eax*4+dword_11E514]
        add eax, eax
        add eax, dword [byte ebp-06h]
        mov al, byte [dword ecx+eax+0DFh]
        movzx eax, al
        shl eax, 2
        add eax, dword [byte ebp-02h]
        mov eax, dword [eax]
        movzx eax, word [byte eax+0Eh]
        imul eax, dword 3E8h
        mov dword [dword ebp+0CAh], 54h
        cdq
        idiv dword [dword ebp+0CAh]
        mov dword [dword ebp+0CAh], 3Ch
        cdq
        idiv dword [dword ebp+0CAh]
        inc ecx
        add dword [dword_17DABC], eax
        cmp ecx, byte 2
        jl short .99
        movzx eax, byte [dword ebp+0126h]
        shl eax, 2
        add eax, dword [dword ebp+0BAh]
        mov edx, dword [dword ebp-096h]
        add edx, dword [dword eax+dword_11E4C4]
        movzx eax, byte [dword edx+ebp-0CAh]
        imul eax, dword 3E8h
        mov edx, dword [dword_17DABC]
        imul edx, dword [byte ebp+02h]
        fild dword [byte ebp-07Ah]
        fmul qword [qword_11244E]
        sub edx, eax
        mov dword [dword_17DABC], edx
        fild dword [dword_17DABC]
        fdivrp
        fcomp qword [qword_11247E]
        fnstsw ax
        sahf
        jbe near .92
        mov byte [dword ebp+0EAh], 0FFh
        mov eax, dword [dword ebp+0BAh]
        mov esi, dword [dword ebp-096h]
        mov dword [byte ebp+016h], ebx
        mov dword [byte ebp+06h], eax
        mov eax, dword [dword ebx+dword_17DA80]
        mov dword [byte ebp+012h], edi
        mov dword [byte ebp+0Ah], eax
        mov eax, dword [dword ebx+dword_17DA40]
        xor ecx, ecx
        mov dword [byte ebp+0Eh], eax
.100:
        movzx eax, byte [dword ebp+0126h]
        shl eax, 2
        add eax, dword [byte ebp+06h]
        imul eax, dword [dword eax+dword_11E4C4], byte 3
        add eax, dword [byte ebp+0Ah]
        mov al, byte [dword ecx+eax+0D3h]
        mov byte [dword ebp+0106h], al
        movzx eax, al
        mov dword [byte ebp+07Eh], eax
        shl eax, 2
        add eax, dword [byte ebp+0Eh]
        mov eax, dword [eax]
        movzx eax, word [byte eax+0Eh]
        imul eax, dword 3E8h
        mov dword [dword ebp+0CAh], 54h
        cdq
        idiv dword [dword ebp+0CAh]
        mov dword [dword ebp+0CAh], 3Ch
        cdq
        idiv dword [dword ebp+0CAh]
        mov dword [byte ebp+06Ah], eax
        mov eax, dword [byte ebp+012h]
        add eax, dword [byte ebp+07Eh]
        movzx eax, byte [dword eax+byte_17DB44]
        imul eax, dword 3E8h
        mov edx, dword [byte ebp+06Ah]
        sub edx, eax
        movzx eax, byte [dword ebp+0EAh]
        mov dword [dword_17DAD8], edx
        cmp eax, 0FFh
        je short .101
        cmp edx, dword [dword_17DADC]
        jle short .102
.101:
        cmp byte [dword esi+ebp-0D6h], 0
        jne short .102
        movzx eax, byte [dword ebp+0106h]
        shl eax, 2
        mov dword [byte ebp+06Ah], eax
        mov eax, dword [byte ebp+016h]
        mov eax, dword [dword eax+dword_17DA48]
        add eax, dword [byte ebp+06Ah]
        mov eax, dword [eax]
        mov dword [dword_17DAC4], eax
        mov eax, dword [dword_17DAD8]
        mov dword [dword_17DADC], eax
        mov al, byte [dword ebp+0106h]
        mov byte [dword ebp+0EAh], cl
        mov byte [dword ebp+010Ah], al
.102:
        inc ecx
        inc esi
        cmp ecx, byte 3
        jl near .100
        mov eax, dword [byte ebp+036h]
        mov edx, dword [dword ebp-096h]
        mov dword [dword ebp+082h], ebx
        mov dword [byte ebp+01Ah], eax
        mov eax, dword [dword ebx+dword_17DA80]
        mov dword [byte ebp+032h], edi
        mov dword [byte ebp+01Eh], eax
        mov eax, dword [dword ebx+dword_17DA40]
        xor ecx, ecx
        mov dword [byte ebp+02Ah], eax
.103:
        movzx eax, byte [dword ebp+0122h]
        shl eax, 2
        add eax, dword [byte ebp+01Ah]
        mov eax, dword [dword eax+dword_11E514]
        add eax, eax
        add eax, dword [byte ebp+01Eh]
        mov al, byte [dword ecx+eax+0DFh]
        mov byte [dword ebp+0112h], al
        movzx eax, al
        mov dword [byte ebp+022h], eax
        shl eax, 2
        mov dword [byte ebp+026h], eax
        mov eax, dword [byte ebp+02Ah]
        add eax, dword [byte ebp+026h]
        mov eax, dword [eax]
        movzx eax, word [byte eax+0Eh]
        imul eax, dword 3E8h
        mov dword [byte ebp+06Ah], eax
        mov eax, dword [byte ebp+032h]
        add eax, dword [byte ebp+022h]
        movzx eax, byte [dword eax+byte_17DB44]
        imul eax, dword 3E8h
        fild dword [byte ebp+06Ah]
        fmul qword [qword_112456]
        fmul qword [qword_11245E]
        fmul qword [qword_112466]
        mov dword [byte ebp+06Ah], eax
        fild dword [byte ebp+06Ah]
        fsubp
        call __CHP
        fistp dword [dword_17DAD8]
        mov eax, dword [dword_17DAD8]
        cmp eax, dword [dword_17DADC]
        jle short .104
        cmp byte [dword edx+ebp-0D3h], 0
        jne short .104
        mov eax, dword [dword ebp+082h]
        mov eax, dword [dword eax+dword_17DA48]
        add eax, dword [byte ebp+026h]
        mov eax, dword [eax]
        mov dword [dword_17DAC4], eax
        mov eax, dword [dword_17DAD8]
        mov dword [dword_17DADC], eax
        mov al, byte [dword ebp+0112h]
        mov byte [dword ebp+010Ah], al
.104:
        inc ecx
        inc edx
        cmp ecx, byte 2
        jl near .103
        movzx eax, byte [dword ebp+0126h]
        shl eax, 2
        add eax, dword [dword ebp+0BAh]
        mov edx, dword [dword ebp-096h]
        add edx, dword [dword eax+dword_11E4C4]
        mov eax, edx
        movzx edx, byte [dword ebp+010Ah]
        inc byte [dword eax+ebp-0CAh]
        lea eax, [edi+edx]
        mov edx, dword [dword_17DAC4]
        inc byte [dword eax+byte_17DB44]
        inc word [byte edx+0Eh]
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        movzx edx, byte [dword eax+ebp+0CEh]
        shl edx, 2
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        mov eax, dword [nosplit eax*4+dword_17DA58]
        mov eax, dword [edx+eax]
        mov edx, dword [byte ebp-062h]
        xor dl, 1
        inc word [byte eax+012h]
        movzx eax, byte [dword edx+ebp+0CEh]
        mov edx, dword [nosplit edx*4+dword_17DA60]
        mov eax, dword [edx+eax*4]
        cmp word [byte eax+012h], byte 0
        je short .105
        movzx edx, word [byte eax+0Eh]
        imul edx, dword 3E8h
        movzx ecx, word [byte eax+012h]
        mov eax, edx
        cdq
        idiv ecx
        mov dword [dword_17DAB8], eax
        jmp short .106
.105:
        call rand_
        mov ecx, 7FFFh
        cdq
        idiv ecx
        mov eax, edx
        and eax, ecx
        mov ecx, 0Ah
        cdq
        idiv ecx
        inc edx
        mov dword [dword_17DAB8], edx
.106:
        mov eax, dword [byte ebp-062h]
        movzx eax, byte [dword eax+ebp+0E6h]
        imul eax, dword 3E8h
        mov ecx, 21h
        cdq
        idiv ecx
        sub dword [dword_17DAB8], eax
        mov eax, dword [byte ebp-076h]
        add dword [dword_17DAB8], 0A5h
        cmp eax, dword [byte ebp+076h]
        jne short .107
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        mov eax, dword [dword ebp+eax*4-0BEh]
        movzx edx, byte [eax]
        mov eax, dword [dword ebx+ebp-0BEh]
        movzx eax, byte [eax]
        dec eax
        cmp edx, eax
        jne short .107
        mov dword [dword_17DAB8], 3E8h
.107:
        movzx eax, byte [dword ebp+010Ah]
        mov edx, dword [dword ebx+dword_17DA40]
        mov eax, dword [edx+eax*4]
        cmp word [byte eax+0Eh], byte 0
        je short .110
        movzx eax, word [byte eax+02h]
        sub eax, byte 19h
        mov dword [byte ebp+03Eh], eax
        test eax, eax
        jle short .108
        fild dword [byte ebp+03Eh]
        fmul qword [qword_11246E]
        fmul qword [qword_112476]
        call __CHP
        fistp dword [dword_17DACC]
        jmp short .109
.108:
        imul eax, byte 0Ah
        mov dword [dword_17DACC], eax
.109:
        movzx eax, byte [dword ebp+010Ah]
        mov edx, dword [dword ebx+dword_17DA40]
        mov eax, dword [edx+eax*4]
        movzx edx, word [byte eax+02h]
        imul edx, dword 3E8h
        movzx ecx, word [byte eax+0Eh]
        mov eax, edx
        cdq
        idiv ecx
        mov edx, dword [dword_17DACC]
        add eax, edx
        mov dword [dword_17DAC8], eax
        jmp short .111
.110:
        call rand_
        mov ecx, 7FFFh
        cdq
        idiv ecx
        mov eax, edx
        and eax, ecx
        mov ecx, 0Ah
        cdq
        idiv ecx
        inc edx
        mov dword [dword_17DAC8], edx
.111:
        mov eax, dword [byte ebp-076h]
        cmp eax, dword [byte ebp-07Ah]
        jl short .112
        mov eax, dword [dword ebp-0132h]
        cmp eax, dword [byte ebp-062h]
        jne short .112
        mov dword [dword_17DAC0], 3E8h
        jmp short .114
.112:
        movzx eax, byte [dword ebp+010Ah]
        mov edx, dword [dword ebx+dword_17DA40]
        mov eax, dword [edx+eax*4]
        cmp word [byte eax+0Eh], byte 0
        jne short .113
        cmp dword [dword ebp-0126h], byte 0
        je short .113
        mov dword [dword_17DAC0], 32h
        jmp short .114
.113:
        mov eax, dword [dword_17DAC8]
        add eax, dword [dword_17DAB8]
        cdq
        LD sub, eax, edx
        sar eax, 1
        add eax, dword [dword ebx+dword_17DA70]
        add eax, byte 1Ah
        mov dword [dword_17DAC0], eax
.114:
        call rand_
        mov ecx, 3E8h
        cdq
        idiv ecx
        mov esi, edx
        cmp dword [dword ebp-0132h], byte 0
        je short .115
        cmp dword [dword ebp-0132h], byte 1
        jne short .117
.115:
        mov eax, dword [byte ebp-062h]
        cmp eax, dword [dword ebp-0132h]
        je short .117
        mov ecx, eax
        xor cl, 1
        mov edx, dword [byte ebp-062h]
        movzx eax, byte [dword ecx+ebp+0E6h]
        movzx edx, byte [dword edx+ebp+0E6h]
        dec eax
        cmp edx, eax
        jge short .116
        cmp byte [dword ecx+ebp+0E6h], 0
        jne short .117
.116:
        mov esi, dword [dword_17DAC0]
        inc esi
.117:
        cmp esi, dword [dword_17DAC0]
        jg near .92
        mov al, byte [dword ebp+010Ah]
        mov byte [dword ebp+012Eh], al
        mov eax, dword [dword_17DAC4]
        inc word [byte eax+02h]
        mov eax, dword [dword_17DAC4]
        movzx edx, byte [dword ebp+010Ah]
        inc word [byte eax+06h]
        lea eax, [edi+edx]
        mov edx, dword [byte ebp-062h]
        xor dl, 1
        movzx ecx, byte [dword edx+ebp+0CEh]
        mov edx, dword [nosplit edx*4+dword_17DA58]
        inc byte [dword eax+byte_17DAE0]
        mov eax, dword [edx+ecx*4]
        inc word [byte eax+0Eh]
        mov eax, dword [dword ebx+AwayShotTotals]
        inc word [byte eax+04h]
        mov eax, dword [byte ebp-076h]
        cmp eax, dword [byte ebp+076h]
        jne near .119
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        mov eax, dword [dword ebp+eax*4-0BEh]
        movzx edx, byte [eax]
        mov eax, dword [dword ebx+ebp-0BEh]
        movzx eax, byte [eax]
        dec eax
        cmp edx, eax
        jne short .119
        cmp dword [dword ebp-012Eh], byte 0
        je short .118
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        imul eax, dword 136h
        lea edx, [dword eax+byte_16580B]
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        movzx eax, byte [dword eax+ebp+0CEh]
        inc byte [edx+eax]
        jmp short .119
.118:
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        movzx edx, byte [dword eax+ebp+0CEh]
        shl edx, 2
        cmp dword [byte ebp-062h], byte 0
        sete al
        movzx eax, al
        mov eax, dword [nosplit eax*4+dword_17DA58]
        mov eax, dword [edx+eax]
        inc word [byte eax+0Ah]
.119:
        mov eax, dword [dword ebx+ebp-0BEh]
        inc byte [eax]
        mov eax, dword [byte ebp-062h]
        inc byte [dword eax+ebp+0E6h]
        cmp dword [dword ebx+dword_17DA70], byte 0
        jle short .122
        mov eax, dword [dword ebx+AwayShotTotals]
        inc word [byte eax+08h]
        mov edx, dword [byte ebp-062h]
        mov eax, dword [dword_17DAC4]
        xor dl, 1
        inc word [byte eax+08h]
        mov eax, dword [nosplit edx*4+AwayShotTotals]
        mov edx, dword [dword ebp-09Ah]
        inc word [byte eax+0Ch]
        mov eax, dword [dword ebp-096h]
.120:
        cmp byte [dword eax+ebp-0D6h], 0
        jbe short .121
        mov byte [dword eax+ebp-0D6h], 0
.121:
        inc eax
        cmp eax, edx
        jne short .120
.122:
        mov eax, dword [byte ebp-062h]
        xor al, 1
        mov eax, dword [nosplit eax*4+AwayShotTotals]
        inc word [byte eax+06h]
        cmp dword [dword ebx+dword_17DA70], byte 0
        jge short .123
        mov eax, dword [dword_17DAC4]
        inc word [byte eax+0Ah]
.123:
        cmp dword [dword ebx+dword_17DA70], byte 0
        jne near .126
        mov edx, dword [byte ebp-062h]
        mov eax, dword [dword ebp+0BAh]
        xor dl, 1
        mov dword [byte ebp+042h], eax
        imul eax, edx, byte 28h
        mov dword [byte ebp+046h], ebx
        xor ecx, ecx
        mov dword [byte ebp+04Ah], eax
        shl edx, 2
.124:
        movzx eax, byte [dword ebp+0126h]
        shl eax, 2
        mov dword [byte ebp+07Eh], eax
        mov eax, dword [byte ebp+042h]
        add eax, dword [byte ebp+07Eh]
        imul eax, dword [dword eax+dword_11E4C4], byte 3
        mov dword [byte ebp+06Ah], eax
        mov eax, dword [byte ebp+046h]
        mov eax, dword [dword eax+dword_17DA80]
        add eax, dword [byte ebp+06Ah]
        mov al, byte [dword ecx+eax+0D3h]
        movzx eax, al
        shl eax, 2
        mov dword [byte ebp+06Ah], eax
        mov eax, dword [byte ebp+046h]
        mov eax, dword [dword eax+dword_17DA48]
        add eax, dword [byte ebp+06Ah]
        mov eax, dword [eax]
        inc word [byte eax+010h]
        mov eax, dword [byte ebp+04Ah]
        add eax, dword [byte ebp+07Eh]
        imul eax, dword [dword eax+dword_11E4C4], byte 3
        mov esi, dword [dword edx+dword_17DA80]
        add eax, esi
        mov al, byte [dword ecx+eax+0D3h]
        movzx eax, al
        mov esi, dword [dword edx+dword_17DA48]
        shl eax, 2
        add eax, esi
        mov eax, dword [eax]
        inc ecx
        dec word [byte eax+010h]
        cmp ecx, byte 3
        jl near .124
        mov eax, dword [byte ebp+036h]
        mov dword [byte ebp+04Eh], eax
        mov eax, dword [byte ebp-062h]
        xor al, 1
        imul edx, eax, byte 0Ch
        mov esi, ebx
        xor ecx, ecx
        shl eax, 2
        mov dword [byte ebp+052h], edx
        mov dword [byte ebp+056h], eax
.125:
        movzx edx, byte [dword ebp+0122h]
        mov eax, dword [byte ebp+04Eh]
        mov eax, dword [dword eax+edx*4+dword_11E514]
        add eax, eax
        mov dword [byte ebp+06Ah], eax
        mov eax, dword [dword esi+dword_17DA80]
        add eax, dword [byte ebp+06Ah]
        mov al, byte [dword ecx+eax+0DFh]
        movzx eax, al
        shl eax, 2
        mov dword [byte ebp+06Ah], eax
        mov eax, dword [dword esi+dword_17DA48]
        add eax, dword [byte ebp+06Ah]
        mov eax, dword [eax]
        inc word [byte eax+010h]
        mov eax, dword [byte ebp+052h]
        mov eax, dword [dword eax+edx*4+dword_11E514]
        mov edx, dword [byte ebp+056h]
        add eax, eax
        mov edx, dword [dword edx+dword_17DA80]
        add eax, edx
        mov al, byte [dword ecx+eax+0DFh]
        mov edx, dword [byte ebp+056h]
        movzx eax, al
        mov edx, dword [dword edx+dword_17DA48]
        mov eax, dword [edx+eax*4]
        inc ecx
        dec word [byte eax+010h]
        cmp ecx, byte 2
        jl short .125
.126:
        mov byte [byte_17DB78], 0
        mov ecx, 3E8h
        call rand_
        cdq
        idiv ecx
        cmp edx, 320h
        jg short .127
        mov eax, dword [byte ebp-062h]
        movzx eax, byte [dword eax+ebp+0D2h]
        cmp eax, byte 2
        jl short .127
        mov byte [byte_17DB78], 2
        jmp short .128
.127:
        cmp edx, 384h
        jg short .128
        mov eax, dword [byte ebp-062h]
        movzx eax, byte [dword eax+ebp+0D2h]
        cmp eax, byte 1
        jl short .128
        mov byte [byte_17DB78], 1
.128:
        mov eax, dword [byte ebp+036h]
        mov byte [dword ebp+012Ah], 0FFh
        mov dword [dword ebp-0AEh], eax
        mov eax, dword [dword ebp-096h]
        mov esi, ebx
        mov dword [byte ebp+072h], eax
        mov eax, dword [dword ebp+0BAh]
        mov dword [dword ebp-0AAh], edi
        mov dword [byte ebp+05Ah], eax
.129:
        cmp byte [byte_17DB78], 0
        je near .92
        mov eax, dword [dword esi+dword_17DA80]
        mov dword [byte ebp+05Eh], eax
        mov eax, dword [dword esi+dword_17DA40]
        mov byte [dword ebp+0F6h], 0FFh
        mov dword [byte ebp+062h], eax
        mov eax, dword [byte ebp+072h]
        xor ecx, ecx
        mov dword [byte ebp+02Eh], eax
.130:
        movzx eax, byte [dword ebp+0126h]
        shl eax, 2
        add eax, dword [byte ebp+05Ah]
        imul eax, dword [dword eax+dword_11E4C4], byte 3
        add eax, dword [byte ebp+05Eh]
        mov al, byte [dword ecx+eax+0D3h]
        mov byte [dword ebp+0FEh], al
        movzx eax, al
        mov dword [byte ebp+07Eh], eax
        shl eax, 2
        add eax, dword [byte ebp+062h]
        mov eax, dword [eax]
        movzx eax, word [byte eax+04h]
        imul eax, dword 3E8h
        mov dword [dword ebp+0CAh], 54h
        cdq
        idiv dword [dword ebp+0CAh]
        mov dword [dword ebp+0CAh], 3Ch
        cdq
        idiv dword [dword ebp+0CAh]
        mov dword [byte ebp+06Ah], eax
        mov eax, dword [dword ebp-0AAh]
        add eax, dword [byte ebp+07Eh]
        movzx eax, byte [dword eax+byte_17DB12]
        imul eax, dword 3E8h
        mov edx, dword [byte ebp+06Ah]
        sub edx, eax
        movzx eax, byte [dword ebp+0F6h]
        mov dword [dword_17DAB4], edx
        cmp eax, 0FFh
        je short .131
        cmp edx, dword [dword_17DAB0]
        jle short .132
.131:
        mov eax, dword [byte ebp+02Eh]
        cmp byte [dword eax+ebp-0D6h], 0
        jne short .132
        mov al, byte [dword ebp+012Eh]
        cmp al, byte [dword ebp+0FEh]
        je short .132
        mov al, byte [dword ebp+012Ah]
        cmp al, byte [dword ebp+0FEh]
        je short .132
        movzx eax, byte [dword ebp+0FEh]
        mov edx, dword [dword esi+dword_17DA48]
        shl eax, 2
        add eax, edx
        mov eax, dword [eax]
        mov dword [dword_17DAC4], eax
        mov eax, dword [dword_17DAB4]
        mov byte [dword ebp+0F6h], cl
        mov dword [dword_17DAB0], eax
        mov al, byte [dword ebp+0FEh]
        mov byte [dword ebp+010Ah], al
.132:
        inc ecx
        inc dword [byte ebp+02Eh]
        cmp ecx, byte 3
        jl near .130
        mov eax, dword [dword esi+dword_17DA80]
        mov dword [byte ebp+066h], eax
        mov eax, dword [dword esi+dword_17DA40]
        mov dword [byte ebp+06Eh], eax
        mov eax, dword [byte ebp+072h]
        xor ecx, ecx
        mov dword [dword ebp+0B6h], eax
        mov al, cl
        add al, 3
        mov byte [dword ebp+011Eh], al
.133:
        movzx eax, byte [dword ebp+0122h]
        shl eax, 2
        add eax, dword [dword ebp-0AEh]
        mov eax, dword [dword eax+dword_11E514]
        add eax, eax
        add eax, dword [byte ebp+066h]
        mov al, byte [dword ecx+eax+0DFh]
        mov byte [dword ebp+0FAh], al
        movzx eax, al
        mov dword [byte ebp+06Ah], eax
        shl eax, 2
        add eax, dword [byte ebp+06Eh]
        mov eax, dword [eax]
        movzx eax, word [byte eax+04h]
        imul eax, dword 3E8h
        mov dword [dword ebp+0CAh], 54h
        cdq
        idiv dword [dword ebp+0CAh]
        mov dword [dword ebp+0CAh], 3Ch
        cdq
        idiv dword [dword ebp+0CAh]
        mov dword [byte ebp+07Eh], eax
        mov eax, dword [dword ebp-0AAh]
        add eax, dword [byte ebp+06Ah]
        movzx eax, byte [dword eax+byte_17DB12]
        imul eax, dword 3E8h
        mov edx, dword [byte ebp+07Eh]
        sub edx, eax
        movzx eax, byte [dword ebp+0F6h]
        mov dword [dword_17DAB4], edx
        cmp eax, 0FFh
        je short .134
        cmp edx, dword [dword_17DAB0]
        jle short .135
.134:
        mov eax, dword [dword ebp+0B6h]
        cmp byte [dword eax+ebp-0D3h], 0
        jne short .135
        mov al, byte [dword ebp+012Eh]
        cmp al, byte [dword ebp+0FAh]
        je short .135
        mov al, byte [dword ebp+012Ah]
        cmp al, byte [dword ebp+0FAh]
        je short .135
        movzx eax, byte [dword ebp+0FAh]
        mov edx, dword [dword esi+dword_17DA48]
        shl eax, 2
        add eax, edx
        mov eax, dword [eax]
        mov dword [dword_17DAC4], eax
        mov al, byte [dword ebp+011Eh]
        mov byte [dword ebp+0F6h], al
        mov eax, dword [dword_17DAB4]
        mov dword [dword_17DAB0], eax
        mov al, byte [dword ebp+0FAh]
        mov byte [dword ebp+010Ah], al
.135:
        inc dword [dword ebp+0B6h]
        inc ecx
        inc byte [dword ebp+011Eh]
        cmp ecx, byte 2
        jl near .133
        movzx eax, byte [dword ebp+0F6h]
        cmp eax, 0FFh
        je short .136
        mov al, byte [dword ebp+010Ah]
        mov byte [dword ebp+012Ah], al
        movzx eax, al
        add eax, dword [dword ebp-0AAh]
        mov edx, dword [dword_17DAC4]
        inc byte [dword eax+byte_17DB12]
        inc word [byte edx+04h]
        mov eax, dword [dword_17DAC4]
        inc word [byte eax+06h]
        dec byte [byte_17DB78]
        jmp near .129
.136:
        mov byte [byte_17DB78], 0
        jmp near .129
.137:
        mov eax, dword [dword ebp-0BEh]
        mov dl, byte [eax]
        mov eax, dword [dword ebp-0BAh]
        cmp dl, byte [eax]
        jne short .139
        cmp dword [byte ebp-072h], byte 5
        jge short .139
        inc dword [byte ebp-072h]
.138:
        mov dword [byte ebp-066h], ebx
.139:
        inc dword [byte ebp-066h]
        inc dword [byte ebp-076h]
.140:
        mov eax, dword [byte ebp-066h]
        cmp eax, dword [byte ebp-07Ah]
        jge short .141
        cmp dword [byte ebp-06Eh], byte 0
        je near .65
.141:
        mov eax, dword [dword ebp-0BEh]
        mov dl, byte [eax]
        mov eax, dword [dword ebp-0BAh]
        cmp dl, byte [eax]
        jne short .142
        mov eax, dword [AwayShotTotals]
        inc byte [byte eax+03h]
        mov eax, dword [dword_17DA54]
        inc byte [byte eax+03h]
        movzx eax, byte [dword ebp+0CEh]
        mov edx, dword [dword_17DA58]
        mov eax, dword [edx+eax*4]
        inc word [byte eax+06h]
        movzx eax, byte [dword ebp+0CFh]
        mov edx, dword [dword_17DA5C]
        mov eax, dword [edx+eax*4]
        inc word [byte eax+06h]
        cmp dword [dword ebp-012Eh], byte 0
        jne near .146
        mov eax, dword [dword_17DA80]
        inc byte [byte eax+05Ah]
        mov eax, dword [dword_17DA84]
        inc byte [byte eax+056h]
        jmp near .146
.142:
        mov eax, dword [dword ebp-0BEh]
        mov dl, byte [eax]
        mov eax, dword [dword ebp-0BAh]
        cmp dl, byte [eax]
        jbe near .144
        mov eax, dword [AwayShotTotals]
        inc byte [byte eax+01h]
        mov eax, dword [dword_17DA54]
        inc byte [byte eax+02h]
        movzx eax, byte [dword ebp+0CEh]
        mov edx, dword [dword_17DA58]
        mov eax, dword [edx+eax*4]
        inc word [byte eax+02h]
        movzx edx, byte [dword ebp+0CFh]
        mov eax, dword [dword_17DA5C]
        shl edx, 2
        mov eax, dword [edx+eax]
        inc word [byte eax+04h]
        cmp dword [dword ebp-012Eh], byte 0
        jne near .146
        cmp dword [dword ebp-0126h], byte 0
        jne short .143
        mov eax, dword [dword_17DA80]
        inc byte [byte eax+058h]
        mov eax, dword [dword_17DA84]
        inc byte [byte eax+055h]
        jmp near .146
.143:
        mov eax, dword [dword_17DA80]
        inc byte [byte eax+060h]
        mov eax, dword [dword_17DA84]
        inc byte [byte eax+05Dh]
        jmp short .146
.144:
        mov eax, dword [dword_17DA54]
        inc byte [byte eax+01h]
        mov eax, dword [AwayShotTotals]
        inc byte [byte eax+02h]
        movzx edx, byte [dword ebp+0CFh]
        mov eax, dword [dword_17DA5C]
        shl edx, 2
        mov eax, dword [edx+eax]
        inc word [byte eax+02h]
        movzx eax, byte [dword ebp+0CEh]
        mov edx, dword [dword_17DA58]
        mov eax, dword [edx+eax*4]
        inc word [byte eax+04h]
        cmp dword [dword ebp-012Eh], byte 0
        jne short .146
        cmp dword [dword ebp-0126h], byte 0
        jne short .145
        mov eax, dword [dword_17DA80]
        inc byte [byte eax+059h]
        mov eax, dword [dword_17DA84]
        inc byte [byte eax+054h]
        jmp short .146
.145:
        mov eax, dword [dword_17DA80]
        inc byte [byte eax+061h]
        mov eax, dword [dword_17DA84]
        inc byte [byte eax+05Ch]
.146:
        xor eax, eax
        xor ecx, ecx
        mov dword [byte ebp-062h], eax
        jmp short .151
.147:
        mov dword [byte ebp-066h], 0
        mov edx, ecx
        jmp short .149
.148:
        add edx, byte 4
        inc dword [byte ebp-066h]
        mov dword [dword edx+ebp-0F2h], 0FFh
.149:
        cmp dword [byte ebp-066h], byte 2
        jge short .150
        cmp dword [byte ebp-06Eh], byte 0
        je short .148
.150:
        inc dword [byte ebp-062h]
        add ecx, byte 8
.151:
        cmp ecx, byte 18h
        jge short .152
        cmp dword [byte ebp-06Eh], byte 0
        je short .147
.152:
        mov edx, dword [dword ebp-0BEh]
        cmp byte [edx], 0
        jne short .153
        movzx ebx, byte [dword ebp+0CFh]
        mov edx, dword [dword_17DA5C]
        shl ebx, 2
        mov edx, dword [edx+ebx]
        inc word [byte edx+08h]
        movzx edx, byte [dword ebp+0CFh]
        lea ecx, [byte edx+019h]
        cmp eax, byte 4
        jge short .153
        lea ebx, [dword ebp-0EEh]
        mov edx, eax
        mov dword [ebx+edx*8], 1
        inc eax
        mov dword [byte ebx+edx*8+04h], ecx
.153:
        mov edx, dword [dword ebp-0BAh]
        cmp byte [edx], 0
        jne short .154
        movzx edx, byte [dword ebp+0CEh]
        mov ebx, dword [dword_17DA58]
        mov edx, dword [ebx+edx*4]
        inc word [byte edx+08h]
        movzx edx, byte [dword ebp+0CEh]
        lea ecx, [byte edx+019h]
        cmp eax, byte 4
        jge short .154
        lea edx, [dword ebp-0EEh]
        mov ebx, eax
        mov dword [edx+ebx*8], 0
        inc eax
        mov dword [byte edx+ebx*8+04h], ecx
.154:
        mov dh, 0FFh
        xor ecx, ecx
        xor esi, esi
        mov dl, dh
        mov dword [byte ebp-062h], ecx
        jmp near .161
.155:
        mov dword [byte ebp-066h], 0
        mov ebx, esi
        jmp short .159
.156:
        movzx edi, byte [dword ebx+byte_17DAE0]
        add edi, edi
        mov dword [dword ebp+0CAh], edi
        movzx edi, byte [dword ebx+byte_17DB12]
        mov dword [byte ebp+07Eh], edi
        mov edi, dword [dword ebp+0CAh]
        add edi, dword [byte ebp+07Eh]
        mov dword [byte ebp+07Eh], edi
        movzx edi, byte [dword ebx+byte_17DB44]
        mov dword [dword ebp+0CAh], edi
        mov edi, dword [byte ebp+07Eh]
        add edi, dword [dword ebp+0CAh]
        mov dword [byte ebp-06Ah], edi
        movzx edi, dl
        cmp edi, 0FFh
        je short .157
        cmp ecx, dword [byte ebp-06Ah]
        jge short .158
.157:
        mov dh, byte [byte ebp-062h]
        mov ecx, dword [byte ebp-06Ah]
        mov dl, byte [byte ebp-066h]
.158:
        inc dword [byte ebp-066h]
        inc ebx
.159:
        cmp dword [byte ebp-066h], byte 19h
        jge short .160
        cmp dword [byte ebp-06Eh], byte 0
        je short .156
.160:
        inc dword [byte ebp-062h]
        add esi, byte 19h
.161:
        cmp dword [byte ebp-062h], byte 2
        jge short .162
        cmp dword [byte ebp-06Eh], byte 0
        je near .155
.162:
        movzx esi, dh
        cmp esi, 0FFh
        je short .163
        movzx ecx, dl
        cmp eax, byte 4
        jge short .163
        lea ebx, [dword ebp-0EEh]
        mov edx, eax
        mov dword [ebx+edx*8], esi
        inc eax
        mov dword [byte ebx+edx*8+04h], ecx
.163:
        mov byte [dword ebp+0116h], 0FFh
        mov byte [dword ebp+0EEh], 0FFh
        xor ecx, ecx
        xor ebx, ebx
        mov dword [byte ebp-062h], ecx
        jmp short .170
.164:
        mov dword [byte ebp-066h], 0
        mov edx, ebx
        jmp short .168
.165:
        movzx esi, byte [dword ebp+0EEh]
        movzx edi, byte [dword edx+byte_17DAE0]
        cmp esi, 0FFh
        je short .166
        cmp edi, ecx
        jle short .167
.166:
        mov cl, byte [byte ebp-062h]
        mov byte [dword ebp+0116h], cl
        mov cl, byte [byte ebp-066h]
        mov byte [dword ebp+0EEh], cl
        mov ecx, edi
.167:
        inc dword [byte ebp-066h]
        inc edx
.168:
        cmp dword [byte ebp-066h], byte 19h
        jge short .169
        cmp dword [byte ebp-06Eh], byte 0
        je short .165
.169:
        inc dword [byte ebp-062h]
        add ebx, byte 19h
.170:
        cmp dword [byte ebp-062h], byte 2
        jge short .171
        cmp dword [byte ebp-06Eh], byte 0
        je short .164
.171:
        movzx ecx, byte [dword ebp+0116h]
        cmp ecx, 0FFh
        je short .172
        movzx esi, byte [dword ebp+0EEh]
        cmp eax, byte 4
        jge short .172
        lea ebx, [dword ebp-0EEh]
        mov edx, eax
        mov dword [ebx+edx*8], ecx
        inc eax
        mov dword [byte ebx+edx*8+04h], esi
.172:
        mov dh, 0FFh
        xor ecx, ecx
        xor esi, esi
        mov dl, dh
        mov dword [byte ebp-062h], ecx
        jmp short .179
.173:
        mov dword [byte ebp-066h], 0
        mov ebx, esi
        jmp short .177
.174:
        movzx edi, byte [dword ebx+byte_17DB12]
        mov dword [dword ebp+0C6h], edi
        movzx edi, dl
        cmp edi, 0FFh
        je short .175
        cmp ecx, dword [dword ebp+0C6h]
        jge short .176
.175:
        mov dh, byte [byte ebp-062h]
        mov ecx, dword [dword ebp+0C6h]
        mov dl, byte [byte ebp-066h]
.176:
        inc dword [byte ebp-066h]
        inc ebx
.177:
        cmp dword [byte ebp-066h], byte 19h
        jge short .178
        cmp dword [byte ebp-06Eh], byte 0
        je short .174
.178:
        inc dword [byte ebp-062h]
        add esi, byte 19h
.179:
        cmp dword [byte ebp-062h], byte 2
        jge short .180
        cmp dword [byte ebp-06Eh], byte 0
        je short .173
.180:
        movzx ebx, dh
        cmp ebx, 0FFh
        je short .181
        movzx ecx, dl
        cmp eax, byte 4
        jge short .181
        mov edx, eax
        lea eax, [dword ebp-0EEh]
        shl edx, 3
        mov dword [edx+eax], ebx
        mov dword [byte edx+eax+04h], ecx
.181:
        mov dword [byte ebp-062h], 0
        xor ebx, ebx
        xor edx, edx
        jmp short .185
.182:
        mov al, byte [dword ebx+ebp-0EEh]
        mov ah, byte [dword ebx+ebp-0EAh]
        movzx ecx, al
        cmp ecx, 0FFh
        je short .184
        movzx eax, ah
        cmp eax, 0FFh
        je short .184
        mov esi, eax
        shl ecx, 2
        shl esi, 2
        cmp eax, byte 19h
        jl short .183
        mov eax, dword [dword ecx+dword_17DA20]
        mov eax, dword [byte esi+eax-064h]
        inc word [byte edx+eax+030h]
        jmp short .184
.183:
        mov eax, dword [dword ecx+dword_17D930]
        mov eax, dword [esi+eax]
        inc word [byte edx+eax+028h]
.184:
        inc dword [byte ebp-062h]
        add ebx, byte 8
        inc edx
        inc edx
.185:
        cmp edx, byte 6
        jge short .186
        cmp dword [byte ebp-06Eh], byte 0
        je short .182
.186:
        mov dword [byte ebp-062h], 0
        xor ebx, ebx
.187:
        mov eax, dword [byte ebp-062h]
        movzx edx, byte [dword eax+ebp+0CEh]
        mov eax, dword [dword ebx+dword_17DA58]
        mov eax, dword [eax+edx*4]
        cmp word [eax], byte 0
        je short .190
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 20h
        jne short .188
        mov eax, dword [dword_17CED6]
        jmp short .189
.188:
        mov eax, dword [dword_17CB2F]
.189:
        shl eax, 15h
        shr eax, 1Eh
        mov edx, dword [nosplit eax*4+dword_11E4B8]
        mov ecx, dword [byte ebp-062h]
        mov eax, dword [dword ebx+dword_17DA58]
        movzx ecx, byte [dword ecx+ebp+0CEh]
        mov ecx, dword [eax+ecx*4]
        movzx eax, word [byte ecx+0Eh]
        imul eax, byte 64h
        imul eax, edx
        movzx esi, word [byte ecx+0Ch]
        cdq
        idiv esi
        mov word [byte ecx+010h], ax
        jmp short .191
.190:
        mov word [byte eax+010h], 0
.191:
        mov eax, dword [byte ebp-062h]
        mov ecx, dword [dword ebx+dword_17DA58]
        movzx eax, byte [dword eax+ebp+0CEh]
        mov eax, dword [ecx+eax*4]
        mov ax, word [byte eax+012h]
        mov word [word_17DB76], ax
        test ax, ax
        je short .192
        mov eax, dword [byte ebp-062h]
        movzx eax, byte [dword eax+ebp+0CEh]
        movzx esi, word [word_17DB76]
        mov ecx, dword [ecx+eax*4]
        mov edx, esi
        movzx eax, word [byte ecx+0Eh]
        sub edx, eax
        imul edi, edx, dword 3E8h
        mov eax, esi
        cdq
        LD sub, eax, edx
        sar eax, 1
        add eax, edi
        cdq
        idiv esi
        mov word [byte ecx+014h], ax
        jmp short .193
.192:
        mov eax, dword [byte ebp-062h]
        movzx eax, byte [dword eax+ebp+0CEh]
        mov eax, dword [ecx+eax*4]
        mov word [byte eax+014h], 0
.193:
        inc dword [byte ebp-062h]
        add ebx, byte 4
        cmp dword [byte ebp-062h], byte 2
        jl near .187
        mov dword [byte ebp-062h], 0
        mov dword [dword ebp+0BEh], 0
        jmp near .203
.194:
        mov dword [byte ebp-066h], 0
        mov ebx, dword [dword ebp+0BEh]
        xor edx, edx
        jmp short .197
.195:
        mov eax, dword [dword ebx+dword_17DA80]
        mov eax, dword [byte edx+eax+063h]
        cmp eax, byte 0FFFFFFFFh
        je short .196
        cmp dword [dword ebp-012Eh], byte 0
        jne short .196
        mov eax, dword [dword ebx+dword_17DA90]
        mov eax, dword [edx+eax]
        mov edi, dword [byte eax+02Ch]
        mov eax, dword [dword ebx+dword_17D930]
        mov esi, dword [edx+eax]
        mov eax, dword [seasondb]
        mov ecx, 2Fh
        add edi, eax
        rep movsb
.196:
        inc dword [byte ebp-066h]
        add edx, byte 4
.197:
        cmp edx, byte 64h
        jge short .198
        cmp dword [byte ebp-06Eh], byte 0
        je short .195
.198:
        mov dword [byte ebp-066h], 0
        mov ebx, dword [dword ebp+0BEh]
        xor edx, edx
        jmp short .201
.199:
        mov eax, dword [dword ebx+dword_17DA80]
        mov eax, dword [dword edx+eax+0C7h]
        cmp eax, byte 0FFFFFFFFh
        je short .200
        cmp dword [dword ebp-012Eh], byte 0
        jne short .200
        mov eax, dword [dword ebx+dword_17DA88]
        mov eax, dword [edx+eax]
        mov edi, dword [byte eax+02Ch]
        mov eax, dword [dword ebx+dword_17DA20]
        mov esi, dword [edx+eax]
        mov eax, dword [seasondb]
        mov ecx, 2Fh
        add edi, eax
        rep movsb
.200:
        inc dword [byte ebp-066h]
        add edx, byte 4
.201:
        cmp edx, byte 0Ch
        jge short .202
        cmp dword [byte ebp-06Eh], byte 0
        je short .199
.202:
        add dword [dword ebp+0BEh], byte 4
        inc dword [byte ebp-062h]
.203:
        cmp dword [dword ebp+0BEh], byte 8
        jge short .204
        cmp dword [byte ebp-06Eh], byte 0
        je near .194
.204:
        cmp dword [dword ebp-012Eh], byte 0
        je near .221
        mov eax, str_GSUMMARYDB
        mov dword [dword ebp-08Eh], 0
        mov dword [dword ebp-08Ah], 0
        call UnlinkJump
.205:
        mov ebx, dword [dword ebp-08Ah]
        mov eax, dword [dword ebp-08Eh]
        xor ecx, ecx
        xor esi, esi
        mov dword [dword ebp-092h], ecx
.206:
        mov edx, dword [dword ebx+dword_17DA80]
        mov edx, dword [byte edx+esi+063h]
        cmp edx, byte 0FFFFFFFFh
        je near .208
        mov edx, dword [dword ebx+dword_17DA48]
        mov edi, dword [dword eax+dword_1657F6]
        mov edx, dword [edx+esi]
        add edi, ecx
        mov dx, word [byte edx+02h]
        mov word [edi], dx
        mov edi, dword [dword eax+dword_1657F6]
        mov edx, dword [dword ebx+dword_17DA48]
        add edi, ecx
        mov edx, dword [edx+esi]
        mov dword [dword ebp+0CAh], edi
        mov di, word [byte edx+0Eh]
        mov edx, dword [dword ebp+0CAh]
        mov word [byte edx+0Eh], di
        mov edi, dword [dword eax+dword_1657F6]
        mov edx, dword [dword ebx+dword_17DA48]
        add edi, ecx
        mov edx, dword [edx+esi]
        mov dword [dword ebp+0CAh], edi
        mov di, word [byte edx+04h]
        mov edx, dword [dword ebp+0CAh]
        mov word [byte edx+02h], di
        mov edi, dword [dword eax+dword_1657F6]
        mov edx, dword [dword ebx+dword_17DA48]
        add edi, ecx
        mov edx, dword [edx+esi]
        mov dword [dword ebp+0CAh], edi
        mov di, word [byte edx+0Ch]
        mov edx, dword [dword ebp+0CAh]
        mov word [byte edx+04h], di
        mov edi, dword [dword eax+dword_1657F6]
        mov edx, dword [dword ebx+dword_17DA48]
        add edi, ecx
        mov edx, dword [edx+esi]
        mov dword [dword ebp+0CAh], edi
        mov di, word [byte edx+010h]
        mov edx, dword [dword ebp+0CAh]
        mov word [byte edx+06h], di
        mov edi, dword [dword eax+dword_1657F6]
        mov edx, dword [dword ebx+dword_17DA48]
        add edi, ecx
        mov edx, dword [edx+esi]
        mov dword [dword ebp+0CAh], edi
        mov di, word [byte edx+08h]
        mov edx, dword [dword ebp+0CAh]
        mov word [byte edx+08h], di
        mov edi, dword [dword eax+dword_1657F6]
        mov edx, dword [dword ebx+dword_17DA48]
        add edi, ecx
        mov edx, dword [edx+esi]
        mov dword [dword ebp+0CAh], edi
        mov di, word [byte edx+0Ah]
        mov edx, dword [dword ebp+0CAh]
        mov word [byte edx+0Ah], di
        mov edx, dword [dword ebx+dword_17DA48]
        mov edx, dword [edx+esi]
        cmp word [edx], byte 0
        je short .207
        mov edi, dword [dword eax+dword_1657FE]
        add edi, dword [dword ebp-092h]
        mov byte [edi], 4
        jmp short .209
.207:
        mov edi, dword [dword eax+dword_1657FE]
        add edi, dword [dword ebp-092h]
        mov byte [edi], 2
        jmp short .209
.208:
        mov edx, dword [dword eax+dword_1657F6]
        mov word [ecx+edx], 0
        mov edx, dword [dword eax+dword_1657F6]
        mov word [byte ecx+edx+0Eh], 0
        mov edx, dword [dword eax+dword_1657F6]
        mov word [byte ecx+edx+02h], 0
        mov edx, dword [dword eax+dword_1657F6]
        mov word [byte ecx+edx+04h], 0
        mov edx, dword [dword eax+dword_1657F6]
        mov word [byte ecx+edx+06h], 0
        mov edx, dword [dword eax+dword_1657F6]
        mov word [byte ecx+edx+08h], 0
        mov edx, dword [dword eax+dword_1657F6]
        mov word [byte ecx+edx+0Ah], 0
        mov edi, dword [dword eax+dword_1657FE]
        add edi, dword [dword ebp-092h]
        mov byte [edi], 0
.209:
        add dword [dword ebp-092h], byte 2Bh
        add esi, byte 4
        add ecx, byte 10h
        cmp esi, byte 64h
        jne near .206
        mov ebx, dword [dword ebp-08Ah]
        mov eax, dword [dword ebp-08Eh]
        xor ecx, ecx
        xor esi, esi
.210:
        mov edx, dword [dword ebx+dword_17DA80]
        mov edx, dword [dword edx+esi+0C7h]
        cmp edx, byte 0FFFFFFFFh
        je short .211
        mov edx, dword [dword ebx+dword_17DA58]
        mov edx, dword [edx+esi]
        imul dx, word [byte edx+0Ch], byte 3Ch
        mov dword [dword ebp+0E2h], edx
        mov edx, dword [dword eax+dword_1657FA]
        mov edi, dword [dword ebp+0E2h]
        mov word [ecx+edx], di
        mov edx, dword [dword ebx+dword_17DA58]
        mov edi, dword [dword eax+dword_1657FA]
        mov edx, dword [edx+esi]
        add edi, ecx
        mov dx, word [byte edx+0Eh]
        mov word [byte edi+04h], dx
        mov edx, dword [dword ebx+dword_17DA58]
        mov edi, dword [dword eax+dword_1657FA]
        mov edx, dword [edx+esi]
        add edi, ecx
        mov dx, word [byte edx+012h]
        mov word [byte edi+02h], dx
        jmp short .212
.211:
        mov edx, dword [dword eax+dword_1657FA]
        mov word [ecx+edx], 0
        mov edx, dword [dword eax+dword_1657FA]
        mov word [byte ecx+edx+02h], 0
        mov edx, dword [dword eax+dword_1657FA]
        mov word [byte ecx+edx+04h], 0
.212:
        add esi, byte 4
        add ecx, byte 6
        cmp esi, byte 0Ch
        jne near .210
        add dword [dword ebp-08Ah], byte 4
        add dword [dword ebp-08Eh], 136h
        cmp dword [dword ebp-08Ah], byte 8
        jne near .205
        mov al, byte [dword ebp-0B6h]
        mov byte [byte_16580A], al
        mov al, byte [dword ebp-0B2h]
        mov byte [byte_165940], al
        mov eax, dword [dword ebp-0BEh]
        movzx ax, byte [eax]
        mov word [hmscore], ax
        mov eax, dword [dword ebp-0BAh]
        movzx ax, byte [eax]
        mov word [awscore], ax
        movzx ax, byte [dword ebp+0CEh]
        mov word [hmtmgoalie], ax
        movzx ax, byte [dword ebp+0CFh]
        mov word [awtmgoalie], ax
        mov eax, dword [dword ebp-012Ah]
        mov byte [byte eax+04h], 0FFh
        mov byte [byte eax+05h], 0FFh
        mov esi, dword [dword_17CEC3]
        cmp dword [dword ebp-0126h], byte 0
        jne near .216
        mov dword [byte ebp-062h], 0
        xor ebx, ebx
.213:
        mov eax, dword [dword ebp-012Ah]
        movzx eax, byte [byte eax+02h]
        cmp eax, dword [byte ebp-062h]
        je short .214
        mov eax, dword [dword ebp-012Ah]
        movzx eax, byte [byte eax+03h]
        cmp eax, dword [byte ebp-062h]
        jne short .215
.214:
        movsx eax, byte [dword ebx+byte_17CC36]
        cmp eax, byte 1
        jne short .215
        mov eax, dword [byte ebp-062h]
        mov edx, dword [dword ebp-012Ah]
        mov dword [dword_17CEC3], eax
        movzx edx, byte [byte edx+02h]
        mov eax, dword [gameopts]
        and edx, byte 1Fh
        and dword [byte eax+01h], 0FFFE0FFFh
        shl edx, 0Ch
        or dword [byte eax+01h], edx
        mov edx, dword [dword ebp-012Ah]
        movzx edx, byte [byte edx+03h]
        mov eax, dword [gameopts]
        and edx, byte 1Fh
        and byte [byte eax+03h], 0C1h
        shl edx, 11h
        or dword [byte eax+01h], edx
        mov eax, dword [dword ebp+0142h]
        xor edx, edx
        call UpdateTeamDbs
.215:
        inc dword [byte ebp-062h]
        add ebx, byte 1Ah
        cmp dword [byte ebp-062h], byte 1Ah
        jge short .220
        jmp near .213
.216:
        mov dword [byte ebp-062h], 0
        xor ebx, ebx
        xor ecx, ecx
.217:
        mov eax, dword [dword ebp-012Ah]
        movzx eax, byte [byte eax+02h]
        cmp eax, dword [dword ebx+dword_17D1E2]
        je short .218
        mov eax, dword [dword ebp-012Ah]
        movzx eax, byte [byte eax+03h]
        cmp eax, dword [dword ebx+dword_17D1E2]
        jne short .219
.218:
        movsx eax, byte [dword ecx+byte_17CFB1]
        cmp eax, byte 1
        jne short .219
        mov al, byte [byte ebp-062h]
        mov edx, 1
        mov byte [byte_17D26F], al
        xor eax, eax
        call UpdateTeamDbs
.219:
        inc dword [byte ebp-062h]
        add ebx, byte 4
        add ecx, byte 1Ah
        cmp dword [byte ebp-062h], byte 10h
        jl short .217
.220:
        mov dword [dword_17CEC3], esi
.221:
        mov dword [byte ebp-062h], 0
        mov dword [byte ebp-07Eh], 64h
        mov dword [dword ebp+0C2h], 0Ch
        xor esi, esi
.222:
        imul edi, dword [byte ebp-062h], byte 64h
        push dword [dword esi+dword_17DA60]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+dword_17DA78]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+dword_17DA58]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+dword_17DA20]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+dword_17DA88]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+dword_17DA40]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+dword_17DA28]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+dword_17DA48]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+dword_17D930]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+dword_17DA90]
        call FreeMemBlock
        mov eax, dword [byte ebp-07Eh]
        add esp, byte 4
        mov dword [dword ebp-086h], eax
.223:
        push dword [dword edi+dword_17D950]
        call FreeMemBlock
        add edi, byte 4
        add esp, byte 4
        cmp edi, dword [dword ebp-086h]
        jne short .223
        mov eax, dword [dword ebp+0C2h]
        mov dword [dword ebp-082h], eax
        imul edi, dword [byte ebp-062h], byte 0Ch
.224:
        push dword [dword edi+dword_17D938]
        call FreeMemBlock
        add edi, byte 4
        add esp, byte 4
        cmp edi, dword [dword ebp-082h]
        jne short .224
        cmp dword [dword ebp-012Eh], byte 0
        je short .225
        push dword [dword esi+AwayShotTotals]
        call FreeMemBlock
        add esp, byte 4
.225:
        push dword [dword esi+dword_17DA18]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+dword_17D928]
        add dword [byte ebp-07Eh], byte 64h
        call FreeMemBlock
        add esp, byte 4
        add dword [dword ebp+0C2h], byte 0Ch
        inc dword [byte ebp-062h]
        push dword [dword esi+dword_17DA38]
        add esi, byte 4
        call FreeMemBlock
        add esp, byte 4
        cmp dword [byte ebp-062h], byte 2
        jl near .222
        mov eax, dword [byte ebp-06Eh]
        lea esp, [dword ebp+0132h]
        pop ebp
        pop edi
        pop esi
        ret 4
unk_849C1:
        db 0EAh,00h,074h,01h,0F9h,01h
unk_849C7:
        db 085h,00h,020h,01h
unk_849CB:
        db 01Dh,01h,0A7h,01h,00h,00h
unk_849D1:
        db 085h,00h,020h,01h
