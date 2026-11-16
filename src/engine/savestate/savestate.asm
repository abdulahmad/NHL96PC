; Saved game state: save and load the game in progress (95 PC pc/game_saveload).
bits 32
%include "hockey.inc"
section s_4DED8 progbits alloc exec nowrite align=1
extern awtmstruct, byte_1178C8, byte_157640, byte_15864E, byte_15864F, byte_158650, byte_158651, byte_158652
extern byte_176AE2, byte_176B84, byte_176B90, byte_17CC37, collflag, curperiod, dword_114F16, dword_1150D8
extern dword_118E89, dword_119173, dword_11917F, dword_119183, dword_11918F, dword_119193, dword_1191AF, dword_1191B3
extern dword_1191B7, dword_1191BB, dword_1191BF, dword_1191C3, dword_11B364, dword_151B84, dword_1657EA, dword_1657EE
extern dword_1657F2, dword_1657F6, dword_1657FA, dword_1657FE, dword_165802, dword_165806, dword_165920, dword_165924
extern dword_165928, dword_16592C, dword_165930, dword_165934, dword_165938, dword_16593C, dword_16596C, dword_17CB2F
extern dword_17CBE7, dword_17CC17, dword_17CEC3, dword_17D162, dword_17D267, energywarn, exitgame, fadeinpending
extern FileReadAt, fodir1, fodir2, fox, foy, gameclock, gameopts, gameover
extern GetPeriodTime, gmode, gmode2, goalevent, gsp, hmroster, hmtmstruct, lastplayer
extern lasttouch, lcblink, lcboxon, lcline, LineChangeLine, LineChangeReq, off_11786C, OOlist
extern optflags, passplayer, PBnum, Pencntdwn, Pencntdwn2, penshotctl, penshotlive, penshotmode
extern penshotplayer, penshotstart, penshottimer, PlList, psendcount, refhitcount, seed, sflags
extern shotongoal, shotontarget, SortCords, sprintf_, SprSort, str_05d, str_05dCsg, str_CsgDb
extern str_DB, strcat_, FileMissing, DeleteFiles, FileOpenRead, FileClose, FileWriteAt, MakeDirPath
extern LoadGameRosters, sub_48A4D, sub_535D5, sub_B7256, threat, unk_115108, unk_115113, unk_156E6C
extern unk_156FFC, unk_157AF8, unk_157B0A, unk_157B1C, unk_157B4F, unk_157B82, unk_157D8F, unk_157F9C
extern unk_157FDA, unk_1582F5, unk_158610, unk_164B5C, unk_17CB2E, unk_17CED5, word_1178A8, word_1178AC
extern word_1178AE, word_1178B4, word_1178B8, word_1178CA, word_1178CC, word_1178CE, word_1178D0, word_1178F4
extern word_1178F6, word_1178F8, word_1178FA, word_1178FC, word_117902, word_118E8F, word_118E9F, word_118EA3
extern word_118EA5, word_118EA7, word_118EA9, word_118EAB, word_118EAF, word_118EB1, word_118EB3, word_118EB7
extern word_118FAF, word_118FB1, word_11910B, word_11910F, word_119111, word_119113, word_119169, word_11916B
extern word_11918B, word_11B274, word_11B276, word_11D3A2, word_16474C, word_16474E, word_164792, word_164794
extern word_1656D2, word_1656D6, word_165942, word_16594E, word_165950, word_176B44, word_176B7C, word_176B80
extern word_176B88, word_176B8A, word_176B8C, word_176B8E, yc1
global SaveGameState, SaveGameState_7DD, LoadGameState, sub_4F08B, sub_4F08B_C2, sub_4F08B_C4, sub_4F08B_C8, sub_4F159
global sub_4F2A8, sub_4F385, sub_4F452
;-----------------------------------------------------------------------------
; SaveGameState                                4DED8  95 PC, medium confidence
; Writes the in-game state to the open file eax with FileWriteAt (buffer,
; length): ctl1side (4), the 17 SortCords entries (66h bytes each), both team
; structs (D4h each), hmlinetab / awlinetab (30h each), then the game globals
; one by one (clock, scores, flags, PenBuf, ...); "Error Saving Game"
; (str_ErrSaveGame) on a failed write; called from demo_savegame and the
; in-game save
;-----------------------------------------------------------------------------
SaveGameState:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 9Ch, 0
        push eax
        sub ebp, 82h
        xor ebx, ebx
        xor esi, esi
.1:
        test ebx, ebx
        jne short .2
        cmp esi, 0AA0h
        jge short .2
        mov ecx, 82h
        mov ebx, 0FFFFFFFFh
        mov edx, esi
        mov eax, dword [byte ebp-01Eh]
        add edx, SortCords
        add esi, 0A0h
        call FileWriteAt
        mov ebx, eax
        jmp short .1
.2:
        test ebx, ebx
        jne short .3
        mov ecx, 10Ch
        mov ebx, 0FFFFFFFFh
        mov edx, hmtmstruct
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.3:
        test ebx, ebx
        jne short .4
        mov ecx, 10Ch
        mov ebx, 0FFFFFFFFh
        mov edx, awtmstruct
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.4:
        test ebx, ebx
        jne short .5
        mov ecx, 3Eh
        mov ebx, 0FFFFFFFFh
        mov edx, unk_158610
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.5:
        test ebx, ebx
        jne short .6
        mov ecx, 3Eh
        mov ebx, 0FFFFFFFFh
        mov edx, unk_157F9C
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.6:
        test ebx, ebx
        jne near .9
        lea eax, [byte ebp-01Ah]
.7:
        mov dx, word [dword ebx+word_165950]
        inc ebx
        inc ebx
        mov word [eax], dx
        inc eax
        inc eax
        cmp ebx, byte 0Ch
        jne short .7
        mov dx, word [word_1178A8]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lastplayer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178AC]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178AE]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [passplayer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [threat]
        xor ebx, ebx
        mov word [eax], dx
        inc eax
        inc eax
.8:
        mov dx, word [dword ebx+word_164794]
        inc ebx
        inc ebx
        mov word [eax], dx
        inc eax
        inc eax
        cmp ebx, byte 8
        jne short .8
        mov dx, word [word_16474C]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_16474E]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lasttouch]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_176B8E]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_176B8C]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178B4]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [yc1]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178B8]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [foy]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [fox]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [fodir1]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [fodir2]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [sflags]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [gmode2]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [byte_1178C8]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178CA]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178CC]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178CE]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178D0]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [Pencntdwn]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178F4]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178F6]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178F8]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178FA]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1178FC]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [gsp]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [gameclock]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_117902]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_118E89]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118E8F]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [exitgame]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [gameover]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_11910B]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [refhitcount]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_11910F]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_176B7C]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_119111]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_119113]
        mov word [eax], dx
        inc eax
        inc eax
        mov edx, dword [seed]
        mov dword [eax], edx
        add eax, ebx
        mov dx, word [PBnum]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [byte_176B84]
        mov word [eax], dx
        mov edx, dword [optflags]
        shl edx, 19h
        inc eax
        inc eax
        shr edx, 1Dh
        mov word [eax], dx
        inc eax
        inc eax
        mov dl, byte [byte_158652]
        mov byte [eax], dl
        mov dl, byte [byte_158651]
        mov byte [byte eax+01h], dl
        inc eax
        inc eax
        mov dx, word [word_176B88]
        mov ecx, 80h
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_176B8A]
        mov ebx, 0FFFFFFFFh
        mov word [eax], dx
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.9:
        test ebx, ebx
        jne near .15
        lea eax, [byte ebp-01Ah]
.10:
        mov dx, word [dword ebx+PlList]
        inc ebx
        inc ebx
        mov word [eax], dx
        inc eax
        inc eax
        cmp ebx, byte 0Ch
        jne short .10
        mov dl, byte [byte_15864F]
        mov byte [eax], dl
        mov dl, byte [byte_158650]
        mov byte [byte eax+01h], dl
        inc eax
        inc eax
        mov dl, byte [byte_15864E]
        mov byte [eax], dl
        mov dl, byte [dword_119173]
        mov byte [byte eax+01h], dl
        inc eax
        inc eax
        mov dl, byte [collflag]
        mov byte [eax], dl
        mov dl, byte [gmode]
        mov byte [byte eax+01h], dl
        inc eax
        inc eax
        mov dx, word [energywarn]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118E9F]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcblink]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118EA3]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118EA5]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118EA7]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118EA9]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118EAB]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcline]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118EAF]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118EB1]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118EB3]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcboxon]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_118EB7]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [LineChangeReq]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1656D2]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [LineChangeLine]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_1656D6]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [curperiod]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_119169]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_11916B]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_11D3A2]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [Pencntdwn2]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_151B84]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_114F16]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [shotongoal]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotplayer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_11917F]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_119183]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotctl]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [word_11918B]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_11918F]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_119193]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotmode]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotstart]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshottimer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [shotontarget]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotlive]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [psendcount]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_1191AF]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_1191B3]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_1191B7]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_1191BB]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_1191BF]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [dword_1191C3]
        mov word [eax], dx
        mov ebx, dword [dword_11B364]
        inc eax
        inc eax
.11:
        cmp dword [byte ebx+0Dh], byte 0
        je short .12
        mov edx, dword [byte ebx+0Dh]
        cmp dword [byte edx+08h], byte 0Bh
        jle short .12
        mov ebx, edx
        jmp short .11
.12:
        lea edx, [byte eax+02h]
        cmp dword [byte ebx+08h], byte 63h
        jne short .13
        mov word [eax], 0FFFFh
        mov word [edx], 0FFFFh
        jmp short .14
.13:
        mov cx, word [ebx]
        mov word [eax], cx
        mov ax, word [byte ebx+04h]
        mov word [edx], ax
.14:
        mov ecx, 70h
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.15:
        test ebx, ebx
        jne short .16
        mov ecx, 42h
        mov ebx, 0FFFFFFFFh
        mov edx, byte_176AE2
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.16:
        test ebx, ebx
        jne short .17
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, byte_176B90
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.17:
        test ebx, ebx
        jne short .18
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, goalevent
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.18:
        test ebx, ebx
        jne short .19
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, unk_115108
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.19:
        test ebx, ebx
        jne short .20
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, unk_115113
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.20:
        test ebx, ebx
        jne near .23
        lea eax, [byte ebp-01Ah]
        mov dword [byte ebp+076h], ebx
        mov dword [byte ebp+07Eh], ebx
        mov dword [byte ebp+072h], eax
.21:
        test ebx, ebx
        jne short .23
        cmp dword [byte ebp+076h], byte 32h
        jge short .23
        mov eax, dword [byte ebp+07Eh]
        add eax, byte 10h
        cmp eax, 80h
        jbe short .22
        mov ecx, dword [byte ebp+07Eh]
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
        lea eax, [byte ebp-01Ah]
        mov dword [byte ebp+07Eh], 0
        mov dword [byte ebp+072h], eax
.22:
        mov eax, dword [byte ebp+076h]
        mov ecx, 19h
        cdq
        idiv ecx
        imul esi, eax, dword 190h
        mov eax, dword [byte ebp+076h]
        cdq
        idiv ecx
        mov edi, dword [byte ebp+072h]
        shl edx, 4
        add dword [byte ebp+07Eh], byte 10h
        lea esi, [dword edx+esi+unk_156E6C]
        add dword [byte ebp+072h], byte 10h
        inc dword [byte ebp+076h]
        movsd
        movsd
        movsd
        movsd
        jmp short .21
.23:
        test ebx, ebx
        jne near .26
        mov ecx, dword [byte ebp+072h]
        mov dword [byte ebp+07Ah], ebx
.24:
        test ebx, ebx
        jne short .26
        cmp dword [byte ebp+07Ah], byte 6
        jge short .26
        mov eax, dword [byte ebp+07Eh]
        add eax, byte 6
        cmp eax, 80h
        jbe short .25
        mov ecx, dword [byte ebp+07Eh]
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        lea ecx, [byte ebp-01Ah]
        mov dword [byte ebp+07Eh], 0
        mov ebx, eax
.25:
        mov eax, dword [byte ebp+07Ah]
        mov esi, 3
        cdq
        idiv esi
        imul esi, eax, byte 12h
        mov eax, dword [byte ebp+07Ah]
        mov edi, 3
        cdq
        idiv edi
        imul edx, byte 6
        add dword [byte ebp+07Eh], byte 6
        mov edi, ecx
        lea esi, [dword edx+esi+unk_157AF8]
        inc dword [byte ebp+07Ah]
        add ecx, byte 6
        movsd
        movsw
        jmp short .24
.26:
        test ebx, ebx
        jne short SaveGameState_7DD
        cmp dword [byte ebp+07Eh], byte 0
        je short SaveGameState_7DD
        mov ecx, dword [byte ebp+07Eh]
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
SaveGameState_7DD:
        mov eax, ebx
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near sub_4F08B_C8
;-----------------------------------------------------------------------------
; LoadGameState                                4E6C3  95 PC, medium confidence
; Reads back what SaveGameState wrote, in the same order, with FileReadAt
; from file eax; "Error Loading Game" (str_ErrLoadGame) on a failed read;
; called from gamesave_io
;-----------------------------------------------------------------------------
LoadGameState:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 9Ch, 0
        push eax
        sub ebp, 82h
        mov dword [byte ebp+07Eh], 0
        xor ebx, ebx
        xor esi, esi
.1:
        test ebx, ebx
        jne short .2
        cmp esi, 0AA0h
        jge short .2
        inc dword [byte ebp+07Eh]
        mov ecx, 82h
        mov ebx, 0FFFFFFFFh
        mov edx, esi
        mov eax, dword [byte ebp-01Eh]
        add edx, SortCords
        add esi, 0A0h
        call FileReadAt
        mov ebx, eax
        jmp short .1
.2:
        test ebx, ebx
        jne short .3
        mov ecx, 10Ch
        mov ebx, 0FFFFFFFFh
        mov edx, hmtmstruct
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.3:
        test ebx, ebx
        jne short .4
        mov ecx, 10Ch
        mov ebx, 0FFFFFFFFh
        mov edx, awtmstruct
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.4:
        test ebx, ebx
        jne short .5
        mov ecx, 3Eh
        mov ebx, 0FFFFFFFFh
        mov edx, unk_158610
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.5:
        test ebx, ebx
        jne short .6
        mov ecx, 3Eh
        mov ebx, 0FFFFFFFFh
        mov edx, unk_157F9C
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.6:
        test ebx, ebx
        jne near .9
        mov ecx, 80h
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
        test eax, eax
        jne near .9
        lea eax, [byte ebp-01Ah]
        xor edx, edx
.7:
        inc edx
        inc edx
        mov cx, word [eax]
        inc eax
        inc eax
        mov word [dword edx+word_16594E], cx
        cmp edx, byte 0Ch
        jne short .7
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178A8], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lastplayer], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178AC], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178AE], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [passplayer], dx
        mov dx, word [eax]
        mov word [threat], dx
        inc eax
        inc eax
        xor edx, edx
.8:
        inc edx
        inc edx
        mov cx, word [eax]
        inc eax
        inc eax
        mov word [dword edx+word_164792], cx
        cmp edx, byte 8
        jne short .8
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_16474C], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_16474E], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lasttouch], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_176B8E], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_176B8C], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178B4], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [yc1], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178B8], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [foy], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [fox], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [fodir1], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [fodir2], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [sflags], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [gmode2], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [byte_1178C8], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178CA], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178CC], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178CE], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178D0], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [Pencntdwn], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178F4], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178F6], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178F8], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178FA], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1178FC], dx
        mov dx, word [eax]
        mov word [gsp], dx
        inc eax
        inc eax
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [gameclock], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_117902], dx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_118E89], edx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118E8F], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [exitgame], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [gameover], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_11910B], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [refhitcount], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_11910F], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_176B7C], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_119111], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_119113], dx
        mov edx, dword [eax]
        add eax, byte 8
        mov dword [seed], edx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [PBnum], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [byte_176B84], dx
        movsx edx, word [eax]
        and edx, byte 7
        and byte [optflags], 8Fh
        shl edx, 4
        inc eax
        inc eax
        or dword [optflags], edx
        mov dl, byte [eax]
        mov byte [byte_158652], dl
        mov dl, byte [byte eax+01h]
        inc eax
        inc eax
        mov byte [byte_158651], dl
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_176B88], dx
        mov ax, word [eax]
        mov word [word_176B8A], ax
.9:
        test ebx, ebx
        jne near .11
        mov ecx, 70h
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
        test eax, eax
        jne near .11
        lea eax, [byte ebp-01Ah]
        xor edx, edx
.10:
        inc edx
        inc edx
        mov cx, word [eax]
        inc eax
        inc eax
        mov word [dword edx+word_165942], cx
        cmp edx, byte 0Ch
        jne short .10
        mov dl, byte [eax]
        mov byte [byte_15864F], dl
        mov dl, byte [byte eax+01h]
        inc eax
        inc eax
        mov byte [byte_158650], dl
        mov dl, byte [eax]
        mov byte [byte_15864E], dl
        movsx edx, byte [byte eax+01h]
        inc eax
        inc eax
        mov dword [dword_119173], edx
        mov dl, byte [eax]
        mov byte [collflag], dl
        mov dl, byte [byte eax+01h]
        inc eax
        inc eax
        mov byte [gmode], dl
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [energywarn], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118E9F], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcblink], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118EA3], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118EA5], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118EA7], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118EA9], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118EAB], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcline], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118EAF], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118EB1], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118EB3], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcboxon], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_118EB7], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [LineChangeReq], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1656D2], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [LineChangeLine], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_1656D6], dx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [curperiod], edx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_119169], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_11916B], dx
        mov dx, word [eax]
        mov word [word_11D3A2], dx
        inc eax
        inc eax
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [Pencntdwn2], dx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_151B84], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_114F16], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [shotongoal], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotplayer], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_11917F], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_119183], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotctl], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [word_11918B], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_11918F], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_119193], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotmode], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotstart], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshottimer], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [shotontarget], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotlive], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [psendcount], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_1191AF], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_1191B3], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_1191B7], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_1191BB], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_1191BF], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [dword_1191C3], edx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [word_11B274], dx
        mov ax, word [eax]
        mov word [word_11B276], ax
.11:
        test ebx, ebx
        jne short .12
        mov ecx, 42h
        mov ebx, 0FFFFFFFFh
        mov edx, byte_176AE2
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.12:
        test ebx, ebx
        jne short .13
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, byte_176B90
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.13:
        test ebx, ebx
        jne short .14
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, goalevent
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.14:
        test ebx, ebx
        jne short .15
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, unk_115108
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.15:
        test ebx, ebx
        jne short .16
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, unk_115113
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.16:
        test ebx, ebx
        jne near .22
        mov dword [byte ebp+07Eh], ebx
        mov dword [byte ebp+07Ah], ebx
.17:
        test ebx, ebx
        jne near .20
        cmp dword [byte ebp+07Eh], byte 32h
        jge short .20
        cmp dword [byte ebp+07Ah], byte 0
        jne short .19
        mov dword [byte ebp+07Ah], 80h
        cmp dword [byte ebp+07Eh], byte 30h
        jl short .18
        mov dword [byte ebp+07Ah], 44h
.18:
        mov ecx, dword [byte ebp+07Ah]
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
        lea eax, [byte ebp-01Ah]
        mov dword [byte ebp+076h], eax
.19:
        mov eax, dword [byte ebp+07Eh]
        mov esi, 19h
        cdq
        idiv esi
        imul esi, eax, dword 190h
        mov eax, dword [byte ebp+07Eh]
        mov edi, 19h
        cdq
        idiv edi
        mov ecx, dword [byte ebp+076h]
        shl edx, 4
        sub dword [byte ebp+07Ah], byte 10h
        lea edi, [dword edx+esi+unk_156E6C]
        mov esi, ecx
        add dword [byte ebp+076h], byte 10h
        inc dword [byte ebp+07Eh]
        movsd
        movsd
        movsd
        movsd
        jmp short .17
.20:
        mov ecx, dword [byte ebp+076h]
        mov dword [byte ebp+07Eh], 0
.21:
        mov eax, dword [byte ebp+07Eh]
        mov esi, 3
        cdq
        idiv esi
        imul esi, eax, byte 12h
        mov eax, dword [byte ebp+07Eh]
        mov edi, 3
        cdq
        idiv edi
        imul edx, byte 6
        mov dword [byte ebp+072h], ecx
        lea edi, [dword edx+esi+unk_157AF8]
        mov esi, dword [byte ebp+072h]
        add ecx, byte 6
        inc dword [byte ebp+07Eh]
        movsd
        movsw
        cmp dword [byte ebp+07Eh], byte 6
        jl short .21
.22:
        test ebx, ebx
        jne near .37
        call GetPeriodTime
        mov word [word_176B80], ax
        test byte [optflags], 70h
        je short .23
        mov eax, 1
        call LoadGameRosters
.23:
        mov dword [byte ebp+07Eh], 0
        mov eax, dword [off_11786C]
        xor edx, edx
        xor esi, esi
        mov dword [dword_16596C], eax
        call sub_535D5
        mov dword [fadeinpending], 1
        mov dword [dword_165806], SortCords
        mov dword [dword_1657EE], unk_157B82
        mov dword [dword_1657F2], unk_157B1C
        mov dword [dword_1657EA], unk_158610
        mov dword [dword_1657F6], unk_156E6C
        mov dword [dword_1657FA], unk_157AF8
        mov dword [dword_1657FE], hmroster
        mov dword [dword_165802], unk_157FDA
        mov dword [dword_16593C], unk_164B5C
        mov dword [dword_165924], unk_157D8F
        mov dword [dword_165928], unk_157B4F
        mov dword [dword_165920], unk_157F9C
        mov dword [dword_16592C], unk_156FFC
        mov dword [dword_165930], unk_157B0A
        mov dword [dword_165934], byte_157640
        mov dword [dword_165938], unk_1582F5
        mov eax, SortCords
        and byte [sflags], 0EFh
.24:
        mov ecx, dword [byte ebp+07Eh]
        mov word [dword eax+086h], cx
        mov cx, word [dword edx+word_118FAF]
        mov word [dword eax+082h], cx
        mov cx, word [dword edx+word_118FB1]
        mov word [dword eax+084h], cx
        mov cl, byte [byte eax+044h]
        and cl, 40h
        movzx ecx, cl
        test ecx, ecx
        je short .25
        mov ecx, awtmstruct
        jmp short .26
.25:
        mov ecx, hmtmstruct
.26:
        mov dword [dword eax+088h], ecx
        mov cl, byte [byte eax+044h]
        and cl, 40h
        movzx ecx, cl
        test ecx, ecx
        jne short .27
        mov ecx, awtmstruct
        jmp short .28
.27:
        mov ecx, hmtmstruct
.28:
        mov dword [dword eax+08Ch], ecx
        mov ecx, dword [eax]
        mov dword [dword eax+090h], ecx
        mov ecx, dword [byte eax+04h]
        mov dword [dword eax+094h], ecx
        mov ecx, dword [byte eax+08h]
        mov dword [dword eax+098h], ecx
        movsx ecx, word [byte eax+038h]
        mov dword [dword eax+09Ch], 0
        cmp ecx, 425h
        je short .29
        cmp ecx, 441h
        jne short .30
.29:
        movsx ecx, word [byte eax+02h]
        cmp ecx, 0AAh
        jge short .35
.30:
        movsx ecx, word [byte eax+038h]
        cmp ecx, 3BFh
        je short .31
        cmp ecx, 6C7h
        jne short .32
.31:
        movsx ecx, word [byte eax+03Ah]
        cmp ecx, byte 8
        jl short .35
.32:
        movsx ecx, word [byte eax+038h]
        cmp ecx, 3ADh
        je short .33
        cmp ecx, 6B5h
        jne short .34
.33:
        movsx ecx, word [byte eax+03Ah]
        cmp ecx, byte 8
        jge short .35
.34:
        movsx ecx, word [byte eax+038h]
        cmp ecx, 199h
        jl short .36
        cmp ecx, 1ABh
        jg short .36
        movsx ecx, word [byte eax+03Ah]
        cmp ecx, byte 4
        jl short .36
.35:
        mov dword [dword eax+09Ch], 1
.36:
        mov edi, dword [byte ebp+07Eh]
        mov cl, byte [byte ebp+07Eh]
        add edx, byte 12h
        inc esi
        inc esi
        add eax, 0A0h
        mov byte [dword edi+OOlist], cl
        mov ecx, dword [byte ebp+07Eh]
        inc dword [byte ebp+07Eh]
        mov word [dword esi+word_176B44], cx
        cmp dword [byte ebp+07Eh], byte 11h
        jl near .24
        call sub_48A4D
        call SprSort
.37:
        lea eax, [byte ebp-01Eh]
        call FileClose
        mov dword [dword_1150D8], 0FFFFFFFFh
        jmp near SaveGameState_7DD
;-----------------------------------------------------------------------------
; sub_4F08B                                                       4F08B  96 PC
;-----------------------------------------------------------------------------
sub_4F08B:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 3ECh, 0
        mov dword [byte ebp-04h], 0FFFFFFFFh
        mov edx, 4
        lea eax, [byte ebp-044h]
        xor ebx, ebx
        mov dword [gameopts], unk_17CB2E
        call MakeDirPath
        push dword [dword_17CBE7]
        push str_05d
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-010h]
        lea eax, [byte ebp-044h]
        call strcat_
        mov eax, dword [dword_17CB2F]
        shl eax, 0Fh
        shr eax, 1Bh
        add eax, byte 41h
        push eax
        push str_CsgDb
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-010h]
        lea eax, [byte ebp-044h]
        call strcat_
        lea edx, [byte ebp-04h]
        lea eax, [byte ebp-044h]
        call FileOpenRead
        test eax, eax
        jne short sub_4F08B_C4
        mov ecx, 3A7h
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-03ECh]
        mov eax, dword [byte ebp-04h]
        call FileReadAt
        test eax, eax
        je short .1
        lea eax, [byte ebp-04h]
        call FileClose
        mov dword [byte ebp-04h], 0FFFFFFFFh
        jmp short sub_4F08B_C4
.1:
        mov ecx, 0B9h
        lea esi, [dword ebp-03ECh]
        mov edi, unk_17CB2E
sub_4F08B_C2:
        rep movsb
sub_4F08B_C4:
        mov eax, dword [byte ebp-04h]
        leave
sub_4F08B_C8:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_4F159                                                       4F159  96 PC
;-----------------------------------------------------------------------------
sub_4F159:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 78Ch, 0
        mov esi, eax
        mov dword [byte ebp-04h], 0FFFFFFFFh
        mov dword [gameopts], unk_17CED5
        cmp dword [dword_17CC17], byte 0
        je short .1
        mov edx, 4
        lea eax, [byte ebp-044h]
        xor ebx, ebx
        call MakeDirPath
        push dword [dword_17CBE7]
        jmp short .2
.1:
        mov edx, 6
        lea eax, [byte ebp-044h]
        xor ebx, ebx
        call MakeDirPath
        push dword [dword_17D162]
.2:
        push str_05d
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-010h]
        lea eax, [byte ebp-044h]
        call strcat_
        add esi, byte 41h
        push esi
        push str_CsgDb
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-010h]
        lea eax, [byte ebp-044h]
        call strcat_
        cmp dword [dword_17CC17], byte 0
        je short .4
        lea edx, [byte ebp-04h]
        lea eax, [byte ebp-044h]
        call FileOpenRead
        test eax, eax
        jne short .4
        mov ecx, 3A7h
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-078Ch]
        mov eax, dword [byte ebp-04h]
        call FileReadAt
        test eax, eax
        je short .3
        lea eax, [byte ebp-04h]
        call FileClose
        mov dword [byte ebp-04h], 0FFFFFFFFh
        jmp short .4
.3:
        mov ecx, 0B9h
        lea esi, [dword ebp-078Ch]
        mov edi, unk_17CB2E
        rep movsb
.4:
        cmp dword [byte ebp-04h], byte 0FFFFFFFFh
        jne short .5
        lea edx, [byte ebp-04h]
        lea eax, [byte ebp-044h]
        call FileOpenRead
        test eax, eax
        jne near sub_4F08B_C4
.5:
        mov ecx, 39Dh
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-03E4h]
        mov eax, dword [byte ebp-04h]
        call FileReadAt
        test eax, eax
        je short .6
        lea eax, [byte ebp-04h]
        call FileClose
        mov dword [byte ebp-04h], 0FFFFFFFFh
        jmp near sub_4F08B_C4
.6:
        cmp dword [dword_17CC17], byte 0
        jne near sub_4F08B_C4
        mov ecx, 0B9h
        lea esi, [dword ebp-03E4h]
        mov edi, unk_17CED5
        jmp near sub_4F08B_C2
;-----------------------------------------------------------------------------
; sub_4F2A8                                                       4F2A8  96 PC
;-----------------------------------------------------------------------------
sub_4F2A8:
        push ebx
        push edx
        enter 40h, 0
        mov edx, 4
        lea eax, [byte ebp-040h]
        xor ebx, ebx
        call MakeDirPath
        push dword [dword_17CBE7]
        push str_05d
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-040h]
        call strcat_
        mov eax, dword [dword_17CB2F]
        shl eax, 0Fh
        shr eax, 1Bh
        add eax, byte 41h
        push eax
        push str_CsgDb
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-040h]
        call strcat_
        lea eax, [byte ebp-040h]
        call FileMissing
        cmp eax, byte 1
        jne short .1
        mov edx, 4
        lea eax, [byte ebp-040h]
        xor ebx, ebx
        call MakeDirPath
        mov eax, dword [dword_17CEC3]
        add eax, byte 41h
        push eax
        push dword [dword_17CBE7]
        push str_05dCsg
        lea eax, [byte ebp-0Ch]
        push eax
        mov ebx, str_DB
        call sprintf_
        add esp, byte 10h
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-040h]
        call DeleteFiles
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        shl edx, 0Fh
        shr edx, 1Bh
        imul edx, byte 1Ah
        mov byte [dword edx+byte_17CC37], 0FFh
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul eax, byte 1Ah
        mov byte [dword eax+byte_17CC37], 0FFh
.1:
        leave
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_4F385                                                       4F385  96 PC
;-----------------------------------------------------------------------------
sub_4F385:
        push ebx
        push edx
        enter 40h, 0
        cmp dword [dword_17D267], byte 0
        je short .1
        mov edx, 4
        lea eax, [byte ebp-040h]
        xor ebx, ebx
        call MakeDirPath
        push dword [dword_17CBE7]
        push str_05d
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        shl edx, 0Fh
        shr edx, 1Bh
        imul edx, byte 1Ah
        mov byte [dword edx+byte_17CC37], 0FFh
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul eax, byte 1Ah
        add esp, byte 0Ch
        mov byte [dword eax+byte_17CC37], 0FFh
        jmp short .2
.1:
        mov edx, 6
        lea eax, [byte ebp-040h]
        xor ebx, ebx
        call MakeDirPath
        push dword [dword_17D162]
        push str_05d
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
.2:
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-040h]
        call strcat_
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        add eax, byte 41h
        push eax
        push str_CsgDb
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-040h]
        call strcat_
        lea eax, [byte ebp-040h]
        call sub_B7256
        leave
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_4F452                                                       4F452  96 PC
;-----------------------------------------------------------------------------
sub_4F452:
        ret
