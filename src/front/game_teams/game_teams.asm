; The teams of a game: rosters and lines from the mode's files, the end-of-game clean-up (96 PC).
bits 32
%include "hockey.inc"
section s_1F300 progbits alloc exec nowrite align=1
extern byte_115109, byte_11510A, byte_11510B, byte_11510C, byte_115114, byte_115115, byte_115116, byte_115117
extern byte_117575, byte_157191, awroster, byte_157FD2, byte_158646, pad2dev, pad1dev, curperiod
extern dword_1150D8, dword_1571B3, dword_15803D, dword_1580A1, dword_158654, TeamRosterPtrs
extern ObjCleanupSlot, PlayoffTreeData, dword_17D162, dword_17D267, FatalError, FileClose, FileOpenRead
extern FileReadAt, GameLoopActive, gameopts, GameOver, gmode, hmroster, hmrosterpos, lseek_
extern MakeDataPath, optflags, strcpy_, FreeGameSprites, SetCrowdTarget, GetLangText, MakeSeasonDbPath, MakePlayoffDbPath
extern FreeMemBlock, DosFindFirst, hmplstats, hmglstats, hmglattr, hmplattr, awlinetab, hmteamrec
extern unk_1580AD, awteamrec, unk_1583C8, hmlinetab, word_11510D, word_156E6E, word_156E70, word_156E72
extern word_156E74, word_156E76, word_156E78, word_156E7A, hmglstats_w2, word_157AFC, hmtmpdst, hmtmglpdst
global EndGameCleanup, LoadGameRosters, InitGameTeams, ReadPlayerRecord, OpenRosterDb, FillTeamRoster, unk_2018D
;-----------------------------------------------------------------------------
; EndGameCleanup                               1F300  96 PC, medium confidence
; After a game: sound off, GameOver, clears the game mode flag and the player
; slots, frees the game's buffers; the game loop is no longer running
;-----------------------------------------------------------------------------
EndGameCleanup:
        push ebx
        push ecx
        push edx
        xor eax, eax
        call SetCrowdTarget
        call GameOver
        and byte [gmode], 7Fh
        xor eax, eax
.1:
        add eax, 0A0h
        mov dword [dword eax+ObjCleanupSlot], 0
        cmp eax, 0AA0h
        jne short .1
        call FreeGameSprites
        cmp dword [dword_158654], byte 0
        je short .2
        push dword [dword_158654]
        call FreeMemBlock
        mov dword [dword_158654], 0
        add esp, byte 4
.2:
        mov dword [GameLoopActive], 0
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadGameRosters                              1F362  96 PC, medium confidence
; Loads both teams' rosters and lines for the game from the files of the game
; mode (exhibition, season, playoff, modem)
;-----------------------------------------------------------------------------
LoadGameRosters:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 68h, 0
        push eax
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 1
        jb short .1
        jbe short .2
        cmp eax, byte 2
        jbe short .3
        cmp eax, byte 4
        jbe short .4
        jmp short .6
.1:
        test eax, eax
        jne short .6
        mov edx, 7
        jmp short .5
.2:
        mov ebx, 4
        lea eax, [byte ebp-03Ch]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        jmp short .6
.3:
        cmp dword [dword_17D267], byte 0
        jne short .2
        mov ebx, 4
        lea eax, [byte ebp-03Ch]
        mov edx, dword [dword_17D162]
        call MakePlayoffDbPath
        jmp short .6
.4:
        mov edx, 10Eh
.5:
        lea eax, [byte ebp-03Ch]
        call MakeDataPath
.6:
        test byte [optflags], 70h
        jne short .7
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne near .13
.7:
        lea ebx, [byte ebp-068h]
        lea eax, [byte ebp-03Ch]
        xor edx, edx
        call DosFindFirst
        test eax, eax
        je short .8
        lea eax, [byte ebp-03Ch]
        push eax
        mov eax, 1B9h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 8
.8:
        lea edx, [byte ebp-04h]
        lea eax, [byte ebp-03Ch]
        call FileOpenRead
        test eax, eax
        je short .9
        lea eax, [byte ebp-03Ch]
        push eax
        mov eax, 1BAh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 8
.9:
        mov eax, dword [byte ebp-04h]
        xor ebx, ebx
        xor edx, edx
        call lseek_
        test eax, eax
        je short .10
        mov eax, 1BBh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.10:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        imul edx, eax, dword 31Bh
        xor ebx, ebx
        mov eax, dword [byte ebp-04h]
        call lseek_
        test eax, eax
        jge short .11
        mov eax, 1BCh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.11:
        mov ecx, 31Bh
        mov ebx, 0FFFFFFFFh
        mov edx, hmteamrec
        mov eax, dword [byte ebp-04h]
        call FileReadAt
        test eax, eax
        je short .12
        mov eax, 1BDh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.12:
        lea eax, [byte ebp-04h]
        call FileClose
        jmp short .14
.13:
        mov ecx, 31Bh
        mov ebx, 0FFFFFFFFh
        mov edx, hmteamrec
        mov eax, dword [dword_1150D8]
        call FileReadAt
.14:
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 1
        jb short .15
        jbe short .16
        cmp eax, byte 2
        jbe short .17
        cmp eax, byte 4
        jbe short .18
        jmp short .20
.15:
        test eax, eax
        jne short .20
        mov edx, 7
        jmp short .19
.16:
        mov ebx, 4
        lea eax, [byte ebp-03Ch]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        jmp short .20
.17:
        cmp dword [dword_17D267], byte 0
        jne short .16
        mov ebx, 4
        lea eax, [byte ebp-03Ch]
        mov edx, dword [dword_17D162]
        call MakePlayoffDbPath
        jmp short .20
.18:
        mov edx, 10Eh
.19:
        lea eax, [byte ebp-03Ch]
        call MakeDataPath
.20:
        test byte [optflags], 70h
        jne short .21
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne near .27
.21:
        lea ebx, [byte ebp-068h]
        lea eax, [byte ebp-03Ch]
        xor edx, edx
        call DosFindFirst
        test eax, eax
        je short .22
        lea eax, [byte ebp-03Ch]
        push eax
        mov eax, 1B9h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 8
.22:
        lea edx, [byte ebp-04h]
        lea eax, [byte ebp-03Ch]
        call FileOpenRead
        test eax, eax
        je short .23
        lea eax, [byte ebp-03Ch]
        push eax
        mov eax, 1BAh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 8
.23:
        mov eax, dword [byte ebp-04h]
        xor ebx, ebx
        xor edx, edx
        call lseek_
        test eax, eax
        je short .24
        mov eax, 1BBh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.24:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul edx, eax, dword 31Bh
        xor ebx, ebx
        mov eax, dword [byte ebp-04h]
        call lseek_
        test eax, eax
        jge short .25
        mov eax, 1BCh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.25:
        mov ecx, 31Bh
        mov ebx, 0FFFFFFFFh
        mov edx, awteamrec
        mov eax, dword [byte ebp-04h]
        call FileReadAt
        test eax, eax
        je short .26
        mov eax, 1BDh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.26:
        lea eax, [byte ebp-04h]
        call FileClose
        jmp short .28
.27:
        mov ecx, 31Bh
        mov ebx, 0FFFFFFFFh
        mov edx, awteamrec
        mov eax, dword [dword_1150D8]
        call FileReadAt
.28:
        lea eax, [byte ebp-014h]
        lea ecx, [byte ebp-0Ch]
        push eax
        lea eax, [byte ebp-010h]
        lea ebx, [byte ebp-08h]
        push eax
        lea edx, [byte ebp-04h]
        mov eax, dword [byte ebp-06Ch]
        call OpenRosterDb
        push byte 0
        mov ecx, dword [byte ebp-0Ch]
        mov ebx, dword [byte ebp-08h]
        push dword [byte ebp-014h]
        mov edx, dword [byte ebp-04h]
        push dword [byte ebp-010h]
        mov eax, dword [byte ebp-06Ch]
        call FillTeamRoster
        lea eax, [byte ebp-04h]
        call FileClose
        lea eax, [byte ebp-08h]
        call FileClose
        lea eax, [byte ebp-0Ch]
        call FileClose
        test byte [byte ebp-06Ch], 6
        jne short .29
        lea eax, [byte ebp-010h]
        call FileClose
.29:
        lea eax, [byte ebp-014h]
        lea ecx, [byte ebp-0Ch]
        push eax
        lea eax, [byte ebp-010h]
        lea ebx, [byte ebp-08h]
        push eax
        lea edx, [byte ebp-04h]
        mov eax, dword [byte ebp-06Ch]
        call OpenRosterDb
        push byte 1
        mov ecx, dword [byte ebp-0Ch]
        mov ebx, dword [byte ebp-08h]
        push dword [byte ebp-014h]
        mov edx, dword [byte ebp-04h]
        push dword [byte ebp-010h]
        mov eax, dword [byte ebp-06Ch]
        call FillTeamRoster
        lea eax, [byte ebp-04h]
        call FileClose
        lea eax, [byte ebp-08h]
        call FileClose
        lea eax, [byte ebp-0Ch]
        call FileClose
        test byte [byte ebp-06Ch], 6
        jne short .30
        lea eax, [byte ebp-010h]
        call FileClose
.30:
        cmp dword [byte ebp-06Ch], byte 0
        je short .31
        cmp dword [byte ebp-06Ch], byte 2
        jne short .32
.31:
        mov ecx, 3Eh
        mov edi, hmlinetab
        mov esi, unk_1580AD
        rep movsb
        mov ecx, 3Eh
        mov edi, awlinetab
        mov esi, unk_1583C8
        rep movsb
.32:
        xor eax, eax
.33:
        movzx edx, byte [dword eax+byte_158646]
        cmp edx, byte 64h
        je short .34
        imul edx, byte 2Bh
        mov byte [dword edx+hmroster], 2
.34:
        movzx edx, byte [dword eax+byte_157FD2]
        cmp edx, byte 64h
        je short .35
        imul edx, byte 2Bh
        mov byte [dword edx+awroster], 2
.35:
        inc eax
        cmp eax, byte 8
        jl short .33
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; InitGameTeams                                1F771  96 PC, medium confidence
; (home, away): sets the teams and options of the game to play (period -1,
; game summary fields) and LoadGameRosters
;-----------------------------------------------------------------------------
InitGameTeams:
        push ebx
        push ecx
        push esi
        push edi
        mov dword [curperiod], 0FFFFFFFFh
        mov byte [pad1dev], al
        mov byte [byte_115109], al
        mov eax, dword [gameopts]
        mov byte [pad2dev], dl
        mov byte [byte_11510A], dl
        mov edx, dword [byte eax+01h]
        shl edx, 0Fh
        shr edx, 1Bh
        mov byte [byte_11510B], dl
        mov ebx, 190h
        mov eax, dword [byte eax+01h]
        xor edx, edx
        mov word [word_11510D], 1
        mov byte [byte_115114], 0
        shl eax, 0Ah
        mov byte [byte_115115], 0
        shr eax, 1Bh
        mov byte [byte_115116], 0
        mov byte [byte_11510C], al
        xor eax, eax
        mov byte [byte_115117], 0
        call LoadGameRosters
        mov word [word_156E7A], 0
        mov word [word_156E78], 0
        mov word [word_156E76], 0
        mov word [word_156E74], 0
        mov word [word_156E72], 0
        mov word [word_156E70], 0
        mov word [word_156E6E], 0
        mov word [hmplstats], 0
.1:
        mov ecx, ebx
        imul eax, edx, dword 190h
.2:
        mov esi, hmplstats
        lea edi, [dword eax+hmplstats]
        add eax, byte 10h
        movsd
        movsd
        movsd
        movsd
        cmp eax, ecx
        jne short .2
        inc edx
        add ebx, 190h
        cmp edx, byte 2
        jl short .1
        mov word [word_157AFC], 0
        mov word [hmglstats_w2], 0
        mov word [hmglstats], 0
        mov ebx, 12h
        xor edx, edx
.3:
        mov ecx, ebx
        imul eax, edx, byte 12h
.4:
        mov esi, hmglstats
        lea edi, [dword eax+hmglstats]
        add eax, byte 6
        movsd
        movsw
        cmp eax, ecx
        jne short .4
        inc edx
        add ebx, byte 12h
        cmp edx, byte 2
        jl short .3
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ReadPlayerRecord                                1F8A6  96 PC, low confidence
; Seeks and reads one player's records (3Ch bytes and more) from the open
; roster files, fatal error on a failure
;-----------------------------------------------------------------------------
ReadPlayerRecord:
        push esi
        push edi
        enter 0Ch, 0
        mov esi, dword [byte ebp+014h]
        mov dword [byte ebp-04h], eax
        mov dword [byte ebp-0Ch], edx
        mov edi, ebx
        mov dword [byte ebp-08h], ecx
        test byte [optflags], 70h
        jne short .1
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne near .7
.1:
        mov eax, dword [byte ebp-04h]
        xor ebx, ebx
        xor edx, edx
        call lseek_
        test eax, eax
        je short .2
        mov eax, 1BEh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.2:
        mov edx, dword [byte ebp+010h]
        mov eax, dword [byte ebp-04h]
        xor ebx, ebx
        call lseek_
        test eax, eax
        jge short .3
        mov eax, 1BFh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.3:
        mov ecx, 3Ch
        mov ebx, 0FFFFFFFFh
        mov eax, dword [byte ebp-04h]
        mov edx, esi
        call FileReadAt
        test eax, eax
        je short .4
        mov eax, 1C0h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.4:
        mov eax, dword [byte ebp-0Ch]
        xor ebx, ebx
        xor edx, edx
        call lseek_
        test eax, eax
        je short .5
        mov eax, 1C1h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.5:
        mov eax, dword [byte ebp-0Ch]
        mov edx, dword [byte esi+024h]
        xor ebx, ebx
        call lseek_
        test eax, eax
        jge short .6
        mov eax, 1C2h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.6:
        mov ecx, dword [byte ebp+01Ch]
        mov ebx, 0FFFFFFFFh
        mov edx, dword [byte ebp+018h]
        mov eax, dword [byte ebp-0Ch]
        call FileReadAt
        test eax, eax
        je short .8
        mov eax, 1C3h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
        jmp short .8
.7:
        mov ecx, 3Ch
        mov ebx, 0FFFFFFFFh
        mov eax, dword [dword_1150D8]
        mov edx, esi
        call FileReadAt
        mov ecx, dword [byte ebp+01Ch]
        mov ebx, 0FFFFFFFFh
        mov edx, dword [byte ebp+018h]
        mov eax, dword [dword_1150D8]
        call FileReadAt
.8:
        mov eax, edi
        xor ebx, ebx
        xor edx, edx
        call lseek_
        test eax, eax
        je short .9
        mov eax, 1C4h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.9:
        mov eax, edi
        mov edx, dword [byte esi+02Ch]
        xor ebx, ebx
        call lseek_
        test eax, eax
        jge short .10
        mov eax, 1C5h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.10:
        mov ecx, dword [byte ebp+024h]
        mov ebx, 0FFFFFFFFh
        mov edx, dword [byte ebp+020h]
        mov eax, edi
        call FileReadAt
        test eax, eax
        je short .11
        mov eax, 1C6h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.11:
        cmp dword [byte ebp+02Ch], byte 0
        je short .14
        mov eax, dword [byte ebp-08h]
        xor ebx, ebx
        xor edx, edx
        call lseek_
        test eax, eax
        je short .12
        mov eax, 1C7h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.12:
        mov eax, dword [byte ebp-08h]
        mov edx, dword [byte esi+028h]
        xor ebx, ebx
        call lseek_
        test eax, eax
        jge short .13
        mov eax, 1C8h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.13:
        mov ecx, dword [byte ebp+02Ch]
        mov ebx, 0FFFFFFFFh
        mov edx, dword [byte ebp+028h]
        mov eax, dword [byte ebp-08h]
        call FileReadAt
        test eax, eax
        je short .14
        mov eax, 1C9h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.14:
        leave
        pop edi
        pop esi
        ret 20h
;-----------------------------------------------------------------------------
; OpenRosterDb                                 1FACB  96 PC, medium confidence
; Opens the roster database for the game kind (optflags): data file 3, the
; season or playoff db, or data file 109h
;-----------------------------------------------------------------------------
OpenRosterDb:
        push esi
        push edi
        enter 58h, 0
        push eax
        mov esi, edx
        mov dword [byte ebp-04h], ebx
        mov edi, ecx
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 1
        jb short .1
        jbe short .2
        cmp eax, byte 2
        jbe short .3
        cmp eax, byte 4
        jbe short .4
        jmp short .6
.1:
        test eax, eax
        jne short .6
        mov edx, 3
        jmp short .5
.2:
        lea eax, [byte ebp-02Ch]
        mov edx, dword [PlayoffTreeData]
        xor ebx, ebx
        call MakeSeasonDbPath
        jmp short .6
.3:
        cmp dword [dword_17D267], byte 0
        jne short .2
        lea eax, [byte ebp-02Ch]
        mov edx, dword [dword_17D162]
        xor ebx, ebx
        call MakePlayoffDbPath
        jmp short .6
.4:
        mov edx, 109h
.5:
        lea eax, [byte ebp-02Ch]
        call MakeDataPath
.6:
        lea ebx, [byte ebp-058h]
        lea eax, [byte ebp-02Ch]
        xor edx, edx
        call DosFindFirst
        test eax, eax
        je short .7
        mov eax, 1CAh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.7:
        lea eax, [byte ebp-02Ch]
        mov edx, esi
        call FileOpenRead
        test eax, eax
        je short .8
        mov eax, 1CBh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.8:
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 1
        jb short .9
        jbe short .10
        cmp eax, byte 2
        jbe short .11
        cmp eax, byte 4
        jbe short .12
        jmp short .14
.9:
        test eax, eax
        jne short .14
        mov edx, 5
        jmp short .13
.10:
        mov ebx, 2
        lea eax, [byte ebp-02Ch]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        jmp short .14
.11:
        cmp dword [dword_17D267], byte 0
        jne short .10
        mov ebx, 2
        lea eax, [byte ebp-02Ch]
        mov edx, dword [dword_17D162]
        call MakePlayoffDbPath
        jmp short .14
.12:
        mov edx, 10Fh
.13:
        lea eax, [byte ebp-02Ch]
        call MakeDataPath
.14:
        lea ebx, [byte ebp-058h]
        lea eax, [byte ebp-02Ch]
        xor edx, edx
        call DosFindFirst
        test eax, eax
        je short .15
        mov eax, 1CCh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.15:
        mov edx, dword [byte ebp-04h]
        lea eax, [byte ebp-02Ch]
        call FileOpenRead
        test eax, eax
        je short .16
        mov eax, 1CDh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.16:
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 1
        jb short .17
        jbe short .18
        cmp eax, byte 2
        jbe short .19
        cmp eax, byte 4
        jbe short .20
        jmp short .22
.17:
        test eax, eax
        jne short .22
        mov edx, 8
        jmp short .21
.18:
        mov ebx, 5
        lea eax, [byte ebp-02Ch]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        jmp short .22
.19:
        cmp dword [dword_17D267], byte 0
        jne short .18
        mov ebx, 5
        lea eax, [byte ebp-02Ch]
        mov edx, dword [dword_17D162]
        call MakePlayoffDbPath
        jmp short .22
.20:
        mov edx, 10Ch
.21:
        lea eax, [byte ebp-02Ch]
        call MakeDataPath
.22:
        lea ebx, [byte ebp-058h]
        lea eax, [byte ebp-02Ch]
        xor edx, edx
        call DosFindFirst
        test eax, eax
        je short .23
        mov eax, 1CEh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.23:
        lea eax, [byte ebp-02Ch]
        mov edx, edi
        call FileOpenRead
        test eax, eax
        je short .24
        mov eax, 1CFh
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.24:
        test byte [byte ebp-05Ch], 6
        je short .25
        mov eax, dword [byte ebp+014h]
        mov dword [eax], 0
        jmp near .34
.25:
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 1
        jb short .26
        jbe short .27
        cmp eax, byte 2
        jbe short .28
        cmp eax, byte 4
        jbe short .29
        jmp short .31
.26:
        test eax, eax
        jne short .31
        mov edx, 0BAh
        jmp short .30
.27:
        mov ebx, 1
        lea eax, [byte ebp-02Ch]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        jmp short .31
.28:
        cmp dword [dword_17D267], byte 0
        jne short .27
        mov ebx, 1
        lea eax, [byte ebp-02Ch]
        mov edx, dword [dword_17D162]
        call MakePlayoffDbPath
        jmp short .31
.29:
        mov edx, 113h
.30:
        lea eax, [byte ebp-02Ch]
        call MakeDataPath
.31:
        lea ebx, [byte ebp-058h]
        lea eax, [byte ebp-02Ch]
        xor edx, edx
        call DosFindFirst
        test eax, eax
        je short .32
        mov eax, 1D0h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.32:
        mov edx, dword [byte ebp+010h]
        lea eax, [byte ebp-02Ch]
        call FileOpenRead
        test eax, eax
        je short .33
        mov eax, 1D1h
        call GetLangText
        push eax
        call FatalError
        add esp, byte 4
.33:
        mov eax, dword [byte ebp+014h]
        mov dword [eax], 28h
.34:
        leave
        pop edi
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; FillTeamRoster                               1FDB0  96 PC, medium confidence
; (team): fills the team's hmroster records (name, position, number) from
; ReadPlayerRecord, for LoadGameRosters
;-----------------------------------------------------------------------------
FillTeamRoster:
        push esi
        push edi
        enter 130h, 0
        push eax
        push edx
        push ebx
        push ecx
        sub ebp, byte 76h
        imul esi, dword [dword ebp+08Eh], dword 190h
        imul edi, dword [dword ebp+08Eh], dword 20Dh
        imul eax, dword [dword ebp+08Eh], dword 4B4h
        imul edx, dword [dword ebp+08Eh], dword 136h
        imul ecx, dword [dword ebp+08Eh], dword 31Bh
        mov ebx, hmroster
        mov dword [byte ebp+06Ah], ecx
        mov dword [byte ebp+04Ah], edx
        mov dword [byte ebp+056h], eax
        mov dword [byte ebp+042h], edi
        add ebx, eax
        mov dword [byte ebp+072h], esi
        lea ecx, [byte ebx+017h]
        add edx, byte 32h
        mov dword [byte ebp+05Ah], ecx
        add ebx, byte 7
        mov dword [byte ebp+03Eh], edx
        mov dword [byte ebp+05Eh], ebx
.1:
        mov eax, dword [byte ebp+06Ah]
        cmp dword [dword eax+dword_15803D], byte 0
        jl near .12
        cmp dword [dword eax+dword_15803D], byte 0FFFFFFFFh
        je near .12
        push dword [dword ebp+08Ah]
        lea eax, [byte ebp-016h]
        push eax
        push byte 2Fh
        lea eax, [byte ebp-046h]
        push eax
        push byte 15h
        lea eax, [byte ebp+012h]
        push eax
        lea eax, [dword ebp-0BAh]
        mov ecx, dword [dword ebp+086h]
        push eax
        mov eax, dword [byte ebp+06Ah]
        mov ebx, dword [dword ebp-0CAh]
        mov edx, dword [dword ebp-0C6h]
        push dword [dword eax+dword_15803D]
        mov eax, dword [dword ebp-0C2h]
        call ReadPlayerRecord
        mov edx, dword [byte ebp+056h]
        mov al, byte [dword ebp-0B9h]
        mov byte [dword edx+byte_157191], al
        mov al, byte [dword ebp-0B8h]
        mov byte [dword edx+hmrosterpos], al
        lea edx, [dword ebp-0B7h]
        mov eax, dword [byte ebp+05Eh]
        call strcpy_
        lea edx, [dword ebp-0A7h]
        mov eax, dword [byte ebp+05Ah]
        call strcpy_
        mov eax, dword [byte ebp+06Ah]
        mov edx, dword [byte ebp+056h]
        mov eax, dword [dword eax+dword_15803D]
        mov dword [dword edx+dword_1571B3], eax
        cmp dword [dword ebp-0BEh], byte 0
        je short .2
        cmp dword [dword ebp-0BEh], byte 2
        jne short .7
.2:
        mov al, byte [pad1dev]
        cmp al, byte [byte ebp-020h]
        jae short .4
.3:
        mov eax, dword [byte ebp+056h]
        mov byte [dword eax+hmroster], 1
        jmp short .9
.4:
        jbe short .6
.5:
        mov eax, dword [byte ebp+056h]
        mov byte [dword eax+hmroster], 3
        jmp short .9
.6:
        mov al, byte [pad2dev]
        cmp al, byte [byte ebp-01Fh]
        jb short .3
        jmp short .5
.7:
        mov eax, dword [byte ebp+04Ah]
        movsx eax, word [dword eax+hmtmpdst]
        test eax, eax
        jle short .8
        mov byte [dword edx+hmroster], 5
        jmp short .9
.8:
        neg eax
        mov al, byte [nosplit eax*2+byte_117575]
        mov byte [dword edx+hmroster], al
.9:
        mov edi, dword [byte ebp+042h]
        lea esi, [byte ebp+012h]
        lea edi, [dword edi+hmplattr]
        movsd
        movsd
        movsd
        movsd
        movsd
        movsb
        test byte [dword ebp-0BEh], 6
        jne near .13
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 10h
        jne short .11
        mov edx, dword [byte ebp+072h]
        movzx eax, word [byte ebp+0Eh]
        mov dword [dword edx+TeamRosterPtrs], eax
        mov edx, eax
        movzx eax, word [byte ebp+010h]
        add eax, edx
        mov edx, dword [byte ebp+072h]
        mov dword [dword edx+TeamRosterPtrs+4], eax
        movzx eax, word [byte ebp-044h]
        mov dword [dword edx+TeamRosterPtrs+8], eax
        mov edx, eax
        movzx eax, word [byte ebp-042h]
.10:
        add eax, edx
        mov edx, dword [byte ebp+072h]
        mov dword [dword edx+TeamRosterPtrs+0Ch], eax
        jmp short .13
.11:
        mov eax, dword [byte ebp+072h]
        mov dword [dword eax+TeamRosterPtrs], 0
        mov edx, dword [byte ebp+072h]
        mov eax, dword [dword eax+TeamRosterPtrs]
        mov dword [dword edx+TeamRosterPtrs+4], eax
        movzx eax, word [byte ebp-032h]
        mov dword [dword edx+TeamRosterPtrs+8], eax
        mov edx, eax
        movzx eax, word [byte ebp-030h]
        jmp short .10
.12:
        mov eax, dword [byte ebp+056h]
        mov byte [dword eax+hmroster], 0
.13:
        add dword [byte ebp+06Ah], byte 4
        add dword [byte ebp+05Ah], byte 2Bh
        add dword [byte ebp+05Eh], byte 2Bh
        add dword [byte ebp+04Ah], byte 2
        add dword [byte ebp+056h], byte 2Bh
        add dword [byte ebp+042h], byte 15h
        mov eax, dword [byte ebp+04Ah]
        add dword [byte ebp+072h], byte 10h
        cmp eax, dword [byte ebp+03Eh]
        jne near .1
        imul ebx, dword [dword ebp+08Eh], byte 33h
        imul eax, dword [dword ebp+08Eh], dword 4B4h
        imul edx, dword [dword ebp+08Eh], dword 136h
        imul ecx, dword [dword ebp+08Eh], dword 31Bh
        mov dword [byte ebp+062h], edx
        lea edx, [dword eax+0433h]
        mov dword [byte ebp+066h], 0
        mov dword [byte ebp+04Eh], edx
        mov edx, hmroster
        mov dword [byte ebp+06Eh], ecx
        add edx, eax
        mov dword [byte ebp+046h], ebx
        mov dword [byte ebp+052h], edx
.14:
        mov eax, dword [byte ebp+06Eh]
        cmp dword [dword eax+dword_1580A1], byte 0
        jl near .23
        cmp dword [dword eax+dword_1580A1], byte 0FFFFFFFFh
        je near .23
        push byte 0
        push byte 0
        push byte 36h
        lea eax, [byte ebp-07Eh]
        push eax
        push byte 11h
        lea eax, [byte ebp+02Ah]
        push eax
        lea eax, [dword ebp-0BAh]
        mov ebx, dword [dword ebp-0CAh]
        push eax
        mov eax, dword [byte ebp+06Eh]
        mov edx, dword [dword ebp-0C6h]
        xor ecx, ecx
        push dword [dword eax+dword_1580A1]
        mov eax, dword [dword ebp-0C2h]
        call ReadPlayerRecord
        mov eax, dword [byte ebp+066h]
        add eax, byte 19h
        imul ebx, eax, byte 2Bh
        mov edx, dword [byte ebp+04Eh]
        mov al, byte [dword ebp-0B9h]
        mov byte [dword edx+byte_157191], al
        mov al, byte [dword ebp-0B8h]
        add ebx, dword [byte ebp+052h]
        mov byte [dword edx+hmrosterpos], al
        lea edx, [dword ebp-0B7h]
        lea eax, [byte ebx+07h]
        call strcpy_
        lea edx, [dword ebp-0A7h]
        lea eax, [byte ebx+017h]
        call strcpy_
        mov eax, dword [byte ebp+06Eh]
        mov edx, dword [byte ebp+04Eh]
        mov eax, dword [dword eax+dword_1580A1]
        mov dword [dword edx+dword_1571B3], eax
        cmp dword [dword ebp-0BEh], byte 0
        je short .15
        cmp dword [dword ebp-0BEh], byte 2
        jne short .20
.15:
        mov al, byte [pad1dev]
        cmp al, byte [byte ebp-050h]
        jae short .17
.16:
        mov eax, dword [byte ebp+04Eh]
        mov byte [dword eax+hmroster], 1
        jmp short .22
.17:
        jbe short .19
.18:
        mov eax, dword [byte ebp+04Eh]
        mov byte [dword eax+hmroster], 3
        jmp short .22
.19:
        mov al, byte [pad2dev]
        cmp al, byte [byte ebp-04Fh]
        jb short .16
        jmp short .18
.20:
        mov eax, dword [byte ebp+062h]
        movsx eax, word [dword eax+hmtmglpdst]
        test eax, eax
        jle short .21
        mov byte [dword edx+hmroster], 5
        jmp short .22
.21:
        neg eax
        mov al, byte [nosplit eax*2+byte_117575]
        mov byte [dword edx+hmroster], al
.22:
        mov edi, dword [byte ebp+046h]
        lea esi, [byte ebp+02Ah]
        lea edi, [dword edi+hmglattr]
        movsd
        movsd
        movsd
        movsd
        movsb
        jmp short .24
.23:
        mov eax, dword [byte ebp+04Eh]
        mov byte [dword eax+hmroster], 0
.24:
        add dword [byte ebp+06Eh], byte 4
        add dword [byte ebp+062h], byte 2
        add dword [byte ebp+04Eh], byte 2Bh
        inc dword [byte ebp+066h]
        add dword [byte ebp+046h], byte 11h
        cmp dword [byte ebp+066h], byte 3
        jl near .14
        lea esp, [byte ebp+076h]
        pop ebp
        pop edi
        pop esi
        ret 0Ch
unk_2018D:
        db 08h,01h,00h,00h,0C3h,01h,00h,00h,014h,01h,00h,00h,0BDh,01h,00h,00h
        db 083h,01h,00h,00h,0BDh,01h,00h,00h,08Fh,01h,00h,00h,0C3h,01h,00h,00h
        db 08Fh,01h,00h,00h,0CEh,01h,00h,00h,083h,01h,00h,00h,0D3h,01h,00h,00h
        db 012h,01h,00h,00h,0D3h,01h,00h,00h,08h,01h,00h,00h,0CBh,01h,00h,00h
