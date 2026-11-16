; The season database: team files after games, schedule days into the records, simulating the season games (96 PC).
bits 32
%include "hockey.inc"
section s_7FF7F progbits alloc exec nowrite align=1
extern BlackPalette, HmGoalieSwapped, HmStarterGoalieMarks, AwGoalieSwapped, TitleTextStyle, SeasonUserSim, SeasonUserSlot, PlayoffTeams
extern PlayoffRoundNum, PlayoffUserTeam, PlayoffHomeTeam, PlayoffAwayTeam, CompareTeamPoints, seasondb, TeamDb, statsplayoffs
extern SeasonDbSize, PlayoffStatsSize, SimStatWeights, hmtmlines, hmtmplstats, hmtmglstats, hmtmroster, SeasonGameOpts
extern PlayoffTreeData, SeasonType, SeasonPlayoffs, SeasonDay, SeasonRandomSeed, PlayoffGameOpts, RosterFileHandle, PlayoffSlotTeams
extern PlayoffSimTeams, PlayoffsActive, PlayoffFlags, FillMusicStream, gameopts, GetLangText, HideMessage, HideProgressBox
extern LoadSeasonStats, MakeDirPath, MakePlayoffDbPath, MakeSeasonDbPath, qsort_, ShowMessage, ShowProgressBox, SimulateGame
extern SoundIdle, SoundSecondsToBytes, sprintf_, srand_, str_05dCNZDB, str_S05dCNZDB, strcat_, strlen_
extern PlayoffRound1, PlayoffRound2, PlayoffRound3, PlayoffFinal, ClearPlayoffTree, FreeMemBlock, OpenArtArchiveErr, SaveFileBlock
extern FileSizeByName, SeasonUserRecords, SeasonUserName, PlayoffHeader, PlayoffName, SeasonPlayoffBracketOrder, UpdateProgressBox, hmtmPwrPlays
extern hmscore, awscore
global UpdateTeamDbs, UpdateTeamDbs_86F, ApplyDayResults, SimSeasonGames, ApplyPlayoffDayResults, SaveSeasonTeams, SimGameZero
;-----------------------------------------------------------------------------
; UpdateTeamDbs                                   7FF7F  96 PC, low confidence
; (season, mode): loads and saves the two game teams' %05d%cNZ.DB files (home
; / away from gameopts)
;-----------------------------------------------------------------------------
UpdateTeamDbs:
        push ebx
        push ecx
        push esi
        push edi
        enter 0E8h, 0
        sub ebp, 82h
        mov esi, eax
        mov dword [byte ebp-0Ah], edx
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        mov eax, dword [byte eax+01h]
        shl edx, 0Fh
        shl eax, 0Ah
        shr edx, 1Bh
        shr eax, 1Bh
        mov dword [byte ebp+0Eh], edx
        mov dword [byte ebp+0Ah], eax
        cmp dword [byte ebp-0Ah], byte 0
        jne short .2
        mov edx, 4
        lea eax, [byte ebp-066h]
        xor ebx, ebx
        call MakeDirPath
        mov eax, dword [SeasonDay]
.1:
        add eax, byte 41h
        push eax
        push dword [PlayoffTreeData]
        jmp short .4
.2:
        cmp dword [PlayoffsActive], byte 0
        je short .3
        mov edx, 4
        lea eax, [byte ebp-066h]
        xor ebx, ebx
        call MakeDirPath
        movsx eax, byte [PlayoffUserTeam]
        mov eax, dword [nosplit eax*4+PlayoffSlotTeams]
        jmp short .1
.3:
        mov edx, 6
        lea eax, [byte ebp-066h]
        xor ebx, ebx
        call MakeDirPath
        movsx eax, byte [PlayoffUserTeam]
        mov eax, dword [nosplit eax*4+PlayoffSlotTeams]
        add eax, byte 41h
        push eax
        push dword [RosterFileHandle]
.4:
        push str_05dCNZDB
        lea eax, [byte ebp-052h]
        push eax
        call sprintf_
        add esp, byte 10h
        lea edx, [byte ebp-052h]
        lea eax, [byte ebp-066h]
        call strcat_
        push byte 0
        lea eax, [byte ebp-066h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [byte ebp+06h], eax
        cmp dword [byte ebp-0Ah], byte 0
        jne short .11
        cmp dword [SeasonType], byte 2
        jne short .5
        mov dword [byte ebp-02h], 19h
        jmp short .7
.5:
        cmp dword [SeasonType], byte 1
        jne short .6
        mov dword [byte ebp-02h], 30h
        jmp short .7
.6:
        mov dword [byte ebp-02h], 54h
.7:
        imul eax, dword [SeasonDay], dword 31Bh
        mov edx, dword [statsplayoffs]
        mov dword [byte ebp+012h], 0
        add eax, edx
        jmp short .10
.8:
        cmp esi, dword [dword eax+014Fh]
        jne short .9
        mov edi, edx
.9:
        inc dword [byte ebp+012h]
        add eax, byte 4
.10:
        mov edx, dword [byte ebp+012h]
        cmp edx, dword [byte ebp-02h]
        jge short .16
        jmp short .8
.11:
        cmp dword [PlayoffsActive], byte 0
        je short .14
        cmp dword [SeasonType], byte 2
        jne short .12
        mov dword [byte ebp-02h], 19h
        jmp short .15
.12:
        cmp dword [SeasonType], byte 1
        jne short .13
        mov dword [byte ebp-02h], 30h
        jmp short .15
.13:
        mov dword [byte ebp-02h], 54h
        jmp short .15
.14:
        mov dword [byte ebp-02h], 0
.15:
        movsx eax, byte [PlayoffRoundNum]
        imul edx, eax, byte 7
        mov eax, dword [PlayoffFlags]
        shl eax, 1Ah
        shr eax, 1Dh
        add edx, eax
        mov eax, dword [PlayoffFlags]
        and eax, byte 7
        mov edi, dword [byte ebp-02h]
        add eax, edx
        add edi, eax
.16:
        imul ecx, dword [byte ebp+0Eh], dword 31Bh
        imul edx, dword [byte ebp+0Ah], dword 31Bh
        mov eax, dword [statsplayoffs]
        lea ebx, [eax+ecx]
        add eax, edx
        mov dword [byte ebp-06h], eax
        movsx eax, byte [HmGoalieSwapped]
        movzx eax, byte [dword ebx+eax+0107h]
        imul ebx, edi, dword 3E8h
        sub eax, byte 19h
        mov dword [byte ebp-03Eh], eax
        movsx eax, byte [AwGoalieSwapped]
        add eax, dword [byte ebp-06h]
        movzx eax, byte [dword eax+0107h]
        sub eax, byte 19h
        mov dword [byte ebp-03Ah], eax
        mov eax, ebx
        add eax, dword [byte ebp+06h]
        mov byte [eax], 2
        imul eax, dword [byte ebp+0Ah], byte 1Ah
        mov dword [byte ebp+01Ah], eax
        imul eax, dword [byte ebp+0Eh], byte 1Ah
        mov dword [byte ebp+012h], 0
        mov dword [byte ebp-01Ah], 0
        mov dword [byte ebp-016h], 0
        mov dword [byte ebp+01Eh], ecx
        mov dword [byte ebp+016h], eax
        mov al, byte [byte ebp+012h]
        mov dword [byte ebp+022h], edx
        add al, 0F0h
        inc ebx
        mov byte [byte ebp+072h], al
.17:
        cmp dword [byte ebp+012h], byte 0
        jne short .18
        cmp dword [byte ebp-0Ah], byte 0
        jne short .18
        mov eax, dword [byte ebp+0Eh]
        cmp eax, dword [SeasonDay]
        je near .21
        mov eax, dword [byte ebp+016h]
        cmp byte [dword eax+SeasonUserSlot], 0
        je near .21
.18:
        cmp dword [byte ebp+012h], byte 1
        jne short .19
        cmp dword [byte ebp-0Ah], byte 0
        jne short .19
        mov eax, dword [byte ebp+0Ah]
        cmp eax, dword [SeasonDay]
        je near .21
        mov eax, dword [byte ebp+01Ah]
        cmp byte [dword eax+SeasonUserSlot], 0
        je near .21
.19:
        cmp dword [byte ebp+012h], byte 0
        jne short .20
        cmp dword [byte ebp-0Ah], byte 0
        je short .20
        movsx eax, byte [PlayoffUserTeam]
        mov edx, dword [byte ebp+0Eh]
        cmp edx, dword [nosplit eax*4+PlayoffSlotTeams]
        je short .21
        movsx eax, byte [PlayoffHomeTeam]
        imul eax, dword [nosplit eax*4+PlayoffSlotTeams], byte 1Ah
        cmp byte [dword eax+PlayoffTeams], 0
        je short .21
.20:
        cmp dword [byte ebp+012h], byte 1
        jne near .71
        cmp dword [byte ebp-0Ah], byte 0
        je near .71
        movsx eax, byte [PlayoffUserTeam]
        mov edx, dword [byte ebp+0Eh]
        cmp edx, dword [nosplit eax*4+PlayoffSlotTeams]
        je short .21
        movsx eax, byte [PlayoffAwayTeam]
        imul eax, dword [nosplit eax*4+PlayoffSlotTeams], byte 1Ah
        cmp byte [dword eax+PlayoffTeams], 0
        jne near .71
.21:
        cmp dword [byte ebp+012h], byte 0
        jne short .22
        mov edx, dword [byte ebp+01Eh]
        jmp short .23
.22:
        mov edx, dword [byte ebp+022h]
.23:
        mov eax, dword [statsplayoffs]
        add edx, eax
        mov dword [byte ebp-0Eh], edx
        mov eax, ebx
        add eax, dword [byte ebp+06h]
        mov dl, byte [byte ebp+072h]
        inc ebx
        mov byte [eax], dl
        mov eax, dword [byte ebp+06h]
        add eax, ebx
        mov edx, dword [byte ebp-0Eh]
        mov dword [byte ebp+062h], eax
        lea eax, [byte edx+064h]
        mov dword [byte ebp+066h], eax
.24:
        mov ecx, 4
        lea esi, [byte ebp+02h]
        mov edi, dword [byte ebp+062h]
        add ebx, byte 4
        mov eax, dword [byte edx+063h]
        add edx, byte 4
        add dword [byte ebp+062h], byte 4
        mov dword [byte ebp+02h], eax
        rep movsb
        cmp edx, dword [byte ebp+066h]
        jne short .24
        mov eax, dword [byte ebp+06h]
        add eax, ebx
        mov edx, dword [byte ebp-0Eh]
        mov dword [byte ebp-02Eh], eax
        lea eax, [byte edx+0Ch]
        mov dword [byte ebp-02Ah], eax
.25:
        mov ecx, 4
        lea esi, [byte ebp+02h]
        mov edi, dword [byte ebp-02Eh]
        add ebx, byte 4
        mov eax, dword [dword edx+0C7h]
        add edx, byte 4
        add dword [byte ebp-02Eh], byte 4
        mov dword [byte ebp+02h], eax
        rep movsb
        cmp edx, dword [byte ebp-02Ah]
        jne short .25
        mov eax, ebx
        add eax, dword [byte ebp+06h]
        mov esi, dword [byte ebp-016h]
        mov byte [eax], 0FFh
        xor eax, eax
        inc ebx
        mov dword [byte ebp-026h], eax
.26:
        mov edx, dword [byte ebp-026h]
        xor ecx, ecx
        mov dword [byte ebp+026h], edx
        jmp short .28
.27:
        mov edi, ebx
        mov ebx, edx
        mov edx, dword [byte ebp+06h]
        inc ecx
        mov byte [edx+edi], al
.28:
        mov edx, dword [dword esi+hmtmplstats]
        add edx, dword [byte ebp+026h]
        movsx edx, word [edx]
        mov dword [byte ebp+04Eh], edx
        lea edx, [byte ebx+01h]
        cmp ecx, dword [byte ebp+04Eh]
        jl short .27
        inc eax
        add dword [byte ebp-026h], byte 10h
        cmp eax, byte 19h
        jl short .26
        mov eax, ebx
        add eax, dword [byte ebp+06h]
        mov esi, dword [byte ebp-016h]
        mov ebx, edx
        mov byte [eax], 0FEh
        xor edx, edx
        xor eax, eax
.29:
        mov dword [byte ebp+056h], 0
        mov dword [byte ebp+02Eh], edx
        jmp short .31
.30:
        mov ecx, ebx
        add ecx, dword [byte ebp+06h]
        inc dword [byte ebp+056h]
        mov ebx, edi
        mov byte [ecx], al
.31:
        mov ecx, dword [dword esi+hmtmplstats]
        add ecx, dword [byte ebp+02Eh]
        movsx ecx, word [byte ecx+0Eh]
        mov dword [byte ebp+04Eh], ecx
        mov ecx, dword [byte ebp+056h]
        lea edi, [byte ebx+01h]
        cmp ecx, dword [byte ebp+04Eh]
        jl short .30
        inc eax
        add edx, byte 10h
        cmp eax, byte 19h
        jl short .29
        mov eax, ebx
        add eax, dword [byte ebp+06h]
        mov esi, dword [byte ebp-016h]
        mov ebx, edi
        mov byte [eax], 0FDh
        xor edi, edi
        xor eax, eax
.32:
        mov ecx, dword [dword esi+hmtmroster]
        add ecx, edi
        movzx edx, byte [ecx]
        cmp edx, byte 2
        je short .33
        cmp byte [ecx], 0
        je short .33
        mov edx, ebx
        add edx, dword [byte ebp+06h]
        inc ebx
        mov byte [edx], al
.33:
        inc eax
        add edi, byte 2Bh
        cmp eax, byte 19h
        jl short .32
        mov eax, ebx
        mov esi, dword [byte ebp-016h]
        add eax, dword [byte ebp+06h]
        xor ecx, ecx
        inc ebx
        mov byte [eax], 0FCh
        xor eax, eax
.34:
        mov dword [byte ebp+06Eh], 0
        mov dword [byte ebp+032h], ecx
        jmp short .36
.35:
        mov edi, ebx
        mov ebx, edx
        mov edx, dword [byte ebp+06h]
        inc dword [byte ebp+06Eh]
        mov byte [edx+edi], al
.36:
        mov edx, dword [dword esi+hmtmplstats]
        add edx, dword [byte ebp+032h]
        movsx edx, word [byte edx+02h]
        mov edi, dword [byte ebp+06Eh]
        mov dword [byte ebp+04Eh], edx
        lea edx, [byte ebx+01h]
        cmp edi, dword [byte ebp+04Eh]
        jl short .35
        inc eax
        add ecx, byte 10h
        cmp eax, byte 19h
        jl short .34
        mov eax, ebx
        add eax, dword [byte ebp+06h]
        mov esi, dword [byte ebp-016h]
        mov byte [eax], 0FBh
        xor eax, eax
        mov ebx, edx
        mov dword [byte ebp-022h], eax
.37:
        mov ecx, dword [byte ebp-022h]
        xor edx, edx
        mov dword [byte ebp+036h], ecx
        jmp short .39
.38:
        mov ecx, ebx
        add ecx, dword [byte ebp+06h]
        inc edx
        mov ebx, edi
        mov byte [ecx], al
.39:
        mov ecx, dword [dword esi+hmtmplstats]
        add ecx, dword [byte ebp+036h]
        movsx ecx, word [byte ecx+04h]
        lea edi, [byte ebx+01h]
        cmp edx, ecx
        jl short .38
        inc eax
        add dword [byte ebp-022h], byte 10h
        cmp eax, byte 19h
        jl short .37
        mov eax, ebx
        add eax, dword [byte ebp+06h]
        mov edx, dword [byte ebp-016h]
        mov ebx, edi
        mov byte [eax], 0FAh
        xor eax, eax
.40:
        mov esi, dword [dword edx+hmtmplstats]
        mov cl, byte [byte esi+eax+06h]
        mov esi, ebx
        add eax, byte 10h
        add esi, dword [byte ebp+06h]
        add cl, 80h
        inc ebx
        mov byte [esi], cl
        cmp eax, 190h
        jne short .40
        mov edx, dword [byte ebp-016h]
        mov eax, ebx
        xor ecx, ecx
        add eax, dword [byte ebp+06h]
        inc ebx
        mov dword [byte ebp+03Ah], edx
        mov byte [eax], 0F9h
        xor eax, eax
.41:
        mov dword [byte ebp+03Eh], ecx
        xor esi, esi
        jmp short .43
.42:
        mov edi, ebx
        mov ebx, edx
        mov edx, dword [byte ebp+06h]
        inc esi
        mov byte [edx+edi], al
.43:
        mov edx, dword [byte ebp+03Ah]
        mov edx, dword [dword edx+hmtmplstats]
        add edx, dword [byte ebp+03Eh]
        movsx edx, word [byte edx+08h]
        mov dword [byte ebp+04Eh], edx
        lea edx, [byte ebx+01h]
        cmp esi, dword [byte ebp+04Eh]
        jl short .42
        inc eax
        add ecx, byte 10h
        cmp eax, byte 19h
        jl short .41
        mov eax, ebx
        add eax, dword [byte ebp+06h]
        mov ecx, dword [byte ebp-016h]
        mov ebx, edx
        mov byte [eax], 0F8h
        xor edx, edx
        xor eax, eax
.44:
        mov dword [byte ebp+052h], 0
        mov dword [byte ebp+042h], edx
        jmp short .46
.45:
        mov edi, ebx
        mov ebx, esi
        mov esi, dword [byte ebp+06h]
        inc dword [byte ebp+052h]
        mov byte [edi+esi], al
.46:
        mov esi, dword [dword ecx+hmtmplstats]
        add esi, dword [byte ebp+042h]
        movsx esi, word [byte esi+0Ah]
        mov edi, dword [byte ebp+052h]
        mov dword [byte ebp+04Eh], esi
        lea esi, [byte ebx+01h]
        cmp edi, dword [byte ebp+04Eh]
        jl short .45
        inc eax
        add edx, byte 10h
        cmp eax, byte 19h
        jl short .44
        mov eax, dword [byte ebp+06h]
        mov byte [ebx+eax], 0F7h
        mov dl, byte [dword ecx+hmtmPwrPlays]
        lea ebx, [byte esi+01h]
        mov byte [esi+eax], dl
        mov eax, ebx
        mov esi, dword [byte ebp-016h]
        add eax, dword [byte ebp+06h]
        xor edx, edx
        inc ebx
        mov byte [eax], 0F6h
        xor eax, eax
.47:
        mov ecx, dword [dword esi+hmtmglstats]
        cmp word [ecx+edx], byte 0
        jle short .48
        mov ecx, ebx
        add ecx, dword [byte ebp+06h]
        inc ebx
        mov byte [ecx], al
.48:
        inc eax
        add edx, byte 6
        cmp eax, byte 3
        jl short .47
        mov eax, ebx
        add eax, dword [byte ebp+06h]
        mov byte [eax], 0F5h
        mov eax, dword [byte ebp-016h]
        inc ebx
        mov dword [byte ebp+046h], eax
        mov eax, dword [byte ebp+06h]
        add eax, ebx
        mov dword [byte ebp-01Eh], 0
        mov dword [byte ebp+06Ah], eax
.49:
        mov ecx, dword [byte ebp+046h]
        mov ecx, dword [dword ecx+hmtmglstats]
        add ecx, dword [byte ebp-01Eh]
        movsx eax, word [ecx]
        mov esi, 3Ch
        cdq
        idiv esi
        test edx, edx
        je short .50
        mov ax, word [ecx]
        mov esi, 3Ch
        cwd
        idiv si
        mov word [ecx], ax
        mov eax, dword [byte ebp+046h]
        mov eax, dword [dword eax+hmtmglstats]
        add eax, dword [byte ebp-01Eh]
        inc word [eax]
        jmp short .51
.50:
        mov ax, word [ecx]
        mov esi, 3Ch
        cwd
        idiv si
        mov word [ecx], ax
.51:
        mov esi, dword [byte ebp+046h]
        mov ecx, 2
        mov edi, dword [byte ebp+06Ah]
        inc ebx
        inc ebx
        mov esi, dword [dword esi+hmtmglstats]
        add dword [byte ebp+06Ah], byte 2
        add esi, dword [byte ebp-01Eh]
        add dword [byte ebp-01Eh], byte 6
        rep movsb
        cmp dword [byte ebp-01Eh], byte 12h
        jne short .49
        mov ecx, dword [byte ebp-016h]
        mov edx, dword [byte ebp-01Ah]
        xor eax, eax
        cmp dword [byte ebp+012h], byte 0
        sete byte [byte ebp+07Ah]
        sete byte [byte ebp+076h]
        mov dword [byte ebp+04Ah], edx
.52:
        mov edx, dword [byte ebp+04Ah]
        lea esi, [byte ebx+01h]
        cmp eax, dword [byte edx+ebp-03Eh]
        jne short .55
        movzx edx, byte [byte ebp+076h]
        imul edx, dword 136h
        mov di, word [dword ecx+hmscore]
        cmp di, word [dword edx+hmscore]
        jne short .53
        mov edx, ebx
        mov ebx, esi
        mov esi, dword [byte ebp+06h]
        mov byte [edx+esi], 3
        jmp short .56
.53:
        movzx edx, byte [byte ebp+07Ah]
        imul edx, dword 136h
        cmp di, word [dword edx+hmscore]
        jle short .54
        mov edx, ebx
        mov ebx, esi
        mov esi, dword [byte ebp+06h]
        mov byte [edx+esi], 1
        jmp short .56
.54:
        mov edx, ebx
        mov ebx, esi
        mov esi, dword [byte ebp+06h]
        mov byte [edx+esi], 2
        jmp short .56
.55:
        mov edx, ebx
        mov ebx, esi
        mov esi, dword [byte ebp+06h]
        mov byte [edx+esi], 5
.56:
        inc eax
        cmp eax, byte 3
        jl short .52
        mov edx, dword [byte ebp-01Ah]
        xor eax, eax
        cmp dword [byte ebp+012h], byte 0
        sete byte [byte ebp+07Eh]
.57:
        cmp eax, dword [byte edx+ebp-03Eh]
        jne short .58
        movzx ecx, byte [byte ebp+07Eh]
        imul ecx, dword 136h
        cmp word [dword ecx+hmscore], byte 0
        jne short .58
        mov esi, ebx
        add esi, dword [byte ebp+06h]
        inc ebx
        mov byte [esi], 4
        jmp short .59
.58:
        mov esi, ebx
        add esi, dword [byte ebp+06h]
        inc ebx
        mov byte [esi], 5
.59:
        inc eax
        cmp eax, byte 3
        jl short .57
        mov edx, dword [byte ebp-016h]
        mov eax, ebx
        xor esi, esi
        add eax, dword [byte ebp+06h]
        inc ebx
        mov dword [byte ebp+02Ah], edx
        mov byte [eax], 0F4h
        xor eax, eax
.60:
        mov dword [byte ebp-036h], esi
        xor edx, edx
        jmp short .63
.61:
        cmp word [ecx], byte 0
        je short .62
        mov ecx, ebx
        add ecx, dword [byte ebp+06h]
        mov ebx, edi
        mov byte [ecx], al
.62:
        inc edx
.63:
        mov ecx, dword [byte ebp+02Ah]
        mov ecx, dword [dword ecx+hmtmglstats]
        add ecx, dword [byte ebp-036h]
        movsx edi, word [byte ecx+04h]
        mov dword [byte ebp+04Eh], edi
        lea edi, [byte ebx+01h]
        cmp edx, dword [byte ebp+04Eh]
        jl short .61
        inc eax
        add esi, byte 6
        cmp eax, byte 3
        jl short .60
        mov eax, ebx
        mov edx, dword [byte ebp-016h]
        add eax, dword [byte ebp+06h]
        mov ebx, edi
        mov dword [byte ebp+05Ah], edx
        mov byte [eax], 0EFh
        xor eax, eax
.64:
        xor edi, edi
        jmp short .66
.65:
        mov esi, dword [byte ebp+05Ah]
        mov esi, dword [dword esi+hmtmlines]
        inc edi
        mov cl, byte [byte esi+eax+034h]
        mov esi, ebx
        sub cl, 19h
        add esi, dword [byte ebp+06h]
        mov ebx, dword [byte ebp-012h]
        mov byte [esi], cl
.66:
        lea esi, [byte ebx+01h]
        movsx ecx, byte [dword edx+HmStarterGoalieMarks]
        mov dword [byte ebp-012h], esi
        cmp edi, ecx
        jl short .65
        inc eax
        inc edx
        cmp eax, byte 2
        jl short .64
        mov eax, ebx
        mov edx, dword [byte ebp-016h]
        add eax, dword [byte ebp+06h]
        mov ebx, esi
        mov dword [byte ebp+05Eh], edx
        mov byte [eax], 0F3h
        xor esi, esi
        xor eax, eax
.67:
        mov dword [byte ebp-032h], esi
        xor edx, edx
        jmp short .70
.68:
        cmp word [ecx], byte 0
        je short .69
        mov ecx, ebx
        add ecx, dword [byte ebp+06h]
        inc ebx
        mov byte [ecx], al
.69:
        inc edx
.70:
        mov ecx, dword [byte ebp+05Eh]
        mov ecx, dword [dword ecx+hmtmglstats]
        add ecx, dword [byte ebp-032h]
        movsx edi, word [byte ecx+02h]
        cmp edx, edi
        jl short .68
        inc eax
        add esi, byte 6
        cmp eax, byte 3
        jl short .67
.71:
        inc byte [byte ebp+072h]
        add dword [byte ebp-01Ah], byte 4
        inc dword [byte ebp+012h]
        add dword [byte ebp-016h], 136h
        cmp dword [byte ebp+012h], byte 2
        jl near .17
        mov eax, dword [byte ebp+06h]
        mov byte [ebx+eax], 0F2h
        cmp dword [byte ebp-0Ah], byte 0
        jne short .72
        imul eax, dword [byte ebp-02h], dword 3E8h
        jmp short .73
.72:
        mov eax, dword [byte ebp-02h]
        add eax, byte 1Ch
        imul eax, dword 3E8h
.73:
        push eax
        push dword [byte ebp+06h]
        lea eax, [byte ebp-066h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        push dword [byte ebp+06h]
        call FreeMemBlock
        add esp, byte 4
UpdateTeamDbs_86F:
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ApplyDayResults                                 807FA  96 PC, low confidence
; (day): walks one schedule day (3E8h bytes a day, F0h / F2h marks) and
; updates the team records (31Bh each)
;-----------------------------------------------------------------------------
ApplyDayResults:
        push esi
        push edi
        enter 0ACh, 0
        push ebx
        push ecx
        sub ebp, 82h
        imul edx, dword 3E8h
        mov eax, dword [statsplayoffs]
        mov dword [byte ebp+062h], edx
        mov dword [byte ebp+05Eh], eax
        inc dword [byte ebp+062h]
.1:
        mov eax, dword [byte ebp-032h]
        add eax, dword [byte ebp+062h]
        cmp byte [eax], 0F2h
        je near .47
        cmp byte [eax], 0F0h
        jne short .2
        mov eax, dword [byte ebp-02Eh]
        movzx eax, byte [byte eax+02h]
        imul eax, dword 31Bh
        mov edx, dword [byte ebp+05Eh]
        add edx, eax
        mov eax, dword [byte ebp-02Eh]
        movzx eax, byte [byte eax+03h]
        imul eax, dword 31Bh
        mov dword [byte ebp+06Ah], edx
        mov edx, dword [byte ebp+05Eh]
        add edx, eax
        mov eax, dword [byte ebp+06Ah]
        inc byte [byte eax+02Fh]
        mov eax, dword [byte ebp-02Eh]
        mov byte [byte ebp+07Eh], 0
        movzx eax, byte [byte eax+04h]
        mov dword [byte ebp+066h], edx
        cmp eax, 0FFh
        jne short .3
        mov edx, dword [byte ebp-02Eh]
        mov al, byte [hmscore]
        mov byte [byte edx+04h], al
        jmp short .3
.2:
        mov eax, dword [byte ebp-02Eh]
        movzx eax, byte [byte eax+03h]
        imul eax, dword 31Bh
        mov edx, dword [byte ebp+05Eh]
        add edx, eax
        mov eax, dword [byte ebp-02Eh]
        movzx eax, byte [byte eax+02h]
        imul eax, dword 31Bh
        mov dword [byte ebp+06Ah], edx
        mov edx, dword [byte ebp+05Eh]
        add edx, eax
        mov eax, dword [byte ebp+06Ah]
        inc byte [byte eax+02Fh]
        mov eax, dword [byte ebp-02Eh]
        mov byte [byte ebp+07Eh], 1
        movzx eax, byte [byte eax+05h]
        mov dword [byte ebp+066h], edx
        cmp eax, 0FFh
        jne short .3
        mov edx, dword [byte ebp-02Eh]
        mov al, byte [awscore]
        mov byte [byte edx+05h], al
.3:
        inc dword [byte ebp+062h]
        lea edx, [byte ebp-02Ah]
        mov ebx, dword [byte ebp+062h]
        lea eax, [byte edx+064h]
        add ebx, dword [byte ebp-032h]
        mov dword [byte ebp+06Eh], eax
.4:
        mov ecx, 4
        mov esi, ebx
        mov edi, edx
        add dword [byte ebp+062h], byte 4
        rep movsb
        add edx, byte 4
        add ebx, byte 4
        cmp edx, dword [byte ebp+06Eh]
        jne short .4
        lea eax, [byte ebp-02Ah]
        lea edx, [byte eax+064h]
        mov ebx, dword [byte ebp+062h]
        add eax, byte 70h
        add ebx, dword [byte ebp-032h]
        mov dword [byte ebp+072h], eax
.5:
        mov ecx, 4
        mov esi, ebx
        mov edi, edx
        add dword [byte ebp+062h], byte 4
        rep movsb
        add edx, byte 4
        add ebx, byte 4
        cmp edx, dword [byte ebp+072h]
        jne short .5
        mov edx, dword [byte ebp+062h]
        add edx, dword [byte ebp-032h]
.6:
        mov eax, dword [byte ebp+062h]
        inc eax
        cmp byte [edx], 0FFh
        je short .7
        inc edx
        mov dword [byte ebp+062h], eax
        jmp short .6
.7:
        mov edx, dword [byte ebp-032h]
        mov ebx, eax
        add edx, eax
.8:
        inc ebx
        cmp byte [edx], 0FEh
        je short .9
        movzx eax, byte [edx]
        mov ecx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4-02Ah]
        add eax, ecx
        mov ecx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc word [byte ecx+eax+02h]
        inc word [byte ecx+eax+06h]
        mov eax, dword [byte ebp+06Ah]
        inc word [byte eax+033h]
        mov eax, dword [byte ebp+066h]
        inc edx
        inc word [byte eax+035h]
        jmp short .8
.9:
        mov eax, dword [byte ebp-032h]
        mov edx, ebx
        add eax, ebx
.10:
        lea ebx, [byte edx+01h]
        cmp byte [eax], 0FDh
        je short .11
        movzx edx, byte [eax]
        mov ecx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4-02Ah]
        add edx, ecx
        mov ecx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc eax
        inc word [byte ecx+edx+0Eh]
        mov edx, ebx
        jmp short .10
.11:
        mov eax, dword [byte ebp-032h]
        mov edx, ebx
        add eax, ebx
.12:
        lea ebx, [byte edx+01h]
        cmp byte [eax], 0FCh
        je short .13
        movzx edx, byte [eax]
        mov ecx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4-02Ah]
        add edx, ecx
        mov ecx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc eax
        inc word [ecx+edx]
        mov edx, ebx
        jmp short .12
.13:
        mov edx, dword [byte ebp-032h]
        mov eax, ebx
        add edx, ebx
.14:
        lea ebx, [byte eax+01h]
        cmp byte [edx], 0FBh
        je short .15
        movzx eax, byte [edx]
        mov ecx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4-02Ah]
        add eax, ecx
        mov ecx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc word [byte ecx+eax+04h]
        inc edx
        inc word [byte ecx+eax+06h]
        mov eax, ebx
        jmp short .14
.15:
        mov eax, dword [byte ebp-032h]
        mov esi, ebx
        add eax, ebx
.16:
        inc esi
        cmp byte [eax], 0FAh
        je short .17
        movzx edx, byte [eax]
        mov ebx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4-02Ah]
        add edx, ebx
        mov ebx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc word [byte edx+ebx+0Ch]
        mov edx, dword [byte ebp+06Ah]
        inc eax
        inc word [byte edx+03Fh]
        jmp short .16
.17:
        mov edx, dword [byte ebp-032h]
        mov eax, 0FFFFFFFCh
        mov ebx, esi
        add edx, esi
.18:
        cmp byte [edx], 0F9h
        je short .20
        add eax, byte 4
        cmp dword [byte eax+ebp-02Ah], byte 0FFFFFFFFh
        je short .19
        mov ecx, dword [TeamDb]
        add ecx, dword [byte eax+ebp-02Ah]
        mov esi, dword [seasondb]
        mov ecx, dword [byte ecx+02Ch]
        add ecx, esi
        movzx si, byte [edx]
        sub esi, 80h
        add word [byte ecx+010h], si
.19:
        inc edx
        inc ebx
        jmp short .18
.20:
        mov eax, dword [byte ebp-032h]
        inc ebx
        add eax, ebx
.21:
        inc ebx
        cmp byte [eax], 0F8h
        je short .22
        movzx edx, byte [eax]
        mov ecx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4-02Ah]
        add edx, ecx
        mov ecx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc word [byte ecx+edx+08h]
        mov edx, dword [byte ebp+06Ah]
        inc word [byte edx+037h]
        mov edx, dword [byte ebp+066h]
        inc eax
        inc word [byte edx+03Bh]
        jmp short .21
.22:
        mov eax, dword [byte ebp-032h]
        mov edx, ebx
        add eax, ebx
.23:
        lea ebx, [byte edx+01h]
        cmp byte [eax], 0F7h
        je short .24
        movzx edx, byte [eax]
        mov ecx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4-02Ah]
        add edx, ecx
        mov ecx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc eax
        inc word [byte ecx+edx+0Ah]
        mov edx, ebx
        jmp short .23
.24:
        mov eax, dword [byte ebp-032h]
        mov ecx, dword [byte ebp+06Ah]
        movzx dx, byte [ebx+eax]
        add word [byte ecx+039h], dx
        mov edx, dword [byte ebp+066h]
        movzx ax, byte [ebx+eax]
        inc ebx
        inc ebx
        add word [byte edx+03Dh], ax
        mov edx, dword [byte ebp-032h]
        add edx, ebx
.25:
        lea ecx, [byte ebx+01h]
        cmp byte [edx], 0F5h
        je short .26
        movzx eax, byte [edx]
        mov ebx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4+03Ah]
        add eax, ebx
        mov ebx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc edx
        inc word [ebx+eax]
        mov ebx, ecx
        jmp short .25
.26:
        mov ebx, ecx
        add ecx, dword [byte ebp-032h]
        xor edx, edx
        mov dword [byte ebp+076h], ecx
.27:
        mov eax, dword [TeamDb]
        add eax, dword [byte edx+ebp+03Ah]
        cmp dword [byte edx+ebp+03Ah], byte 0FFFFFFFFh
        je short .28
        mov esi, dword [byte ebp+076h]
        mov ecx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        lea edi, [byte ebp+07Ah]
        add eax, ecx
        mov ecx, 2
        mov dword [byte ebp+05Ah], eax
        rep movsb
        mov ecx, dword [byte ebp+05Ah]
        mov eax, dword [byte ebp+07Ah]
        add word [byte ecx+0Ch], ax
.28:
        add dword [byte ebp+076h], byte 2
        add edx, byte 4
        inc ebx
        inc ebx
        cmp edx, byte 0Ch
        jne short .27
        mov edx, dword [byte ebp-032h]
        xor ecx, ecx
        add edx, ebx
.29:
        mov eax, dword [TeamDb]
        add eax, dword [byte ecx+ebp+03Ah]
        cmp dword [byte ecx+ebp+03Ah], byte 0FFFFFFFFh
        je short .32
        mov esi, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        add eax, esi
        movzx esi, byte [edx]
        cmp esi, byte 1
        jne short .30
        inc word [byte eax+02h]
.30:
        movzx esi, byte [edx]
        cmp esi, byte 2
        jne short .31
        inc word [byte eax+04h]
.31:
        movzx esi, byte [edx]
        cmp esi, byte 3
        jne short .32
        inc word [byte eax+06h]
.32:
        inc edx
        add ecx, byte 4
        inc ebx
        cmp ecx, byte 0Ch
        jne short .29
        mov ecx, dword [byte ebp-032h]
        xor eax, eax
        add ecx, ebx
.33:
        mov edx, dword [TeamDb]
        add edx, dword [byte eax+ebp+03Ah]
        cmp dword [byte eax+ebp+03Ah], byte 0FFFFFFFFh
        je short .34
        mov esi, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        add edx, esi
        movzx esi, byte [ecx]
        cmp esi, byte 4
        jne short .34
        inc word [byte edx+08h]
.34:
        inc ecx
        add eax, byte 4
        inc ebx
        cmp eax, byte 0Ch
        jne short .33
        mov eax, dword [byte ebp-032h]
        inc ebx
        add eax, ebx
.35:
        inc ebx
        cmp byte [eax], 0EFh
        je short .36
        movzx edx, byte [eax]
        mov ecx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4+03Ah]
        add edx, ecx
        mov ecx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc eax
        inc word [byte ecx+edx+0Eh]
        jmp short .35
.36:
        mov ecx, ebx
        add ebx, dword [byte ebp-032h]
.37:
        inc ecx
        cmp byte [ebx], 0F3h
        je short .38
        movzx eax, byte [ebx]
        mov edx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4+03Ah]
        add eax, edx
        mov edx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc ebx
        inc word [byte edx+eax+0Ah]
        jmp short .37
.38:
        mov dword [byte ebp+062h], ecx
        add ecx, dword [byte ebp-032h]
.39:
        movzx eax, byte [ecx]
        cmp eax, 0F0h
        je short .40
        cmp eax, 0F1h
        je short .40
        cmp byte [ecx], 0F2h
        je short .40
        mov edx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4+03Ah]
        add eax, edx
        mov edx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc dword [byte ebp+062h]
        inc ecx
        inc word [byte edx+eax+012h]
        jmp short .39
.40:
        xor ecx, ecx
.41:
        cmp dword [byte ecx+ebp+03Ah], byte 0FFFFFFFFh
        je near .46
        mov eax, dword [TeamDb]
        add eax, dword [byte ecx+ebp+03Ah]
        mov ebx, dword [seasondb]
        add ebx, dword [byte eax+02Ch]
        mov ax, word [byte ebx+0Eh]
        cmp ax, word [byte ebx+012h]
        ja short .42
        cmp word [byte ebx+012h], byte 0
        jbe short .42
        movzx eax, ax
        imul eax, dword 3E8h
        movzx esi, word [byte ebx+012h]
        cdq
        idiv esi
        mov edx, 3E8h
        sub edx, eax
        mov word [byte ebx+014h], dx
        jmp short .43
.42:
        mov word [byte ebx+014h], 0
.43:
        movzx eax, word [byte ebx+014h]
        cmp eax, 3E8h
        jle short .44
        mov word [byte ebx+014h], 3E8h
.44:
        cmp word [byte ebx+0Ch], byte 0
        jbe short .45
        mov eax, dword [SeasonGameOpts]
        shl eax, 15h
        shr eax, 1Eh
        imul eax, dword [nosplit eax*4+SimStatWeights], byte 64h
        movzx edx, word [byte ebx+0Eh]
        imul eax, edx
        movzx esi, word [byte ebx+0Ch]
        cdq
        idiv esi
        mov word [byte ebx+010h], ax
        jmp short .46
.45:
        mov word [byte ebx+010h], 0
.46:
        add ecx, byte 4
        cmp ecx, byte 0Ch
        jge near .1
        jmp near .41
.47:
        mov eax, dword [byte ebp-02Eh]
        movzx eax, byte [byte eax+04h]
        cmp eax, 0FFh
        je near .53
        mov eax, dword [byte ebp-02Eh]
        movzx eax, byte [byte eax+05h]
        cmp eax, 0FFh
        je near .53
        mov eax, dword [byte ebp-02Eh]
        mov edx, dword [byte ebp-02Eh]
        mov al, byte [byte eax+04h]
        cmp al, byte [byte edx+05h]
        jne short .49
        mov eax, dword [byte ebp+06Ah]
        inc byte [byte eax+032h]
        mov eax, dword [byte ebp+066h]
        inc byte [byte eax+032h]
        cmp byte [byte ebp+07Eh], 0
        jne short .48
        mov eax, dword [byte ebp+06Ah]
        inc byte [byte eax+05Ah]
        mov eax, dword [byte ebp+066h]
        inc byte [byte eax+056h]
        jmp near .53
.48:
        mov eax, dword [byte ebp+06Ah]
        inc byte [byte eax+056h]
        mov eax, dword [byte ebp+066h]
        inc byte [byte eax+05Ah]
        jmp short .53
.49:
        mov al, byte [byte edx+04h]
        cmp al, byte [byte edx+05h]
        jbe short .51
        cmp byte [byte ebp+07Eh], 0
        jne short .50
        mov eax, dword [byte ebp+06Ah]
        inc byte [byte eax+030h]
        inc byte [byte eax+058h]
        mov eax, dword [byte ebp+066h]
        inc byte [byte eax+031h]
        inc byte [byte eax+055h]
        jmp short .53
.50:
        mov eax, dword [byte ebp+06Ah]
        inc byte [byte eax+031h]
        inc byte [byte eax+055h]
        mov eax, dword [byte ebp+066h]
        inc byte [byte eax+030h]
        inc byte [byte eax+058h]
        jmp short .53
.51:
        cmp byte [byte ebp+07Eh], 0
        jne short .52
        mov eax, dword [byte ebp+066h]
        inc byte [byte eax+030h]
        inc byte [byte eax+054h]
        mov eax, dword [byte ebp+06Ah]
        inc byte [byte eax+059h]
        inc byte [byte eax+031h]
        jmp short .53
.52:
        mov eax, dword [byte ebp+066h]
        inc byte [byte eax+059h]
        inc byte [byte eax+031h]
        mov eax, dword [byte ebp+06Ah]
        inc byte [byte eax+030h]
        inc byte [byte eax+054h]
.53:
        mov ebx, 5
        lea eax, [byte ebp+046h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword [SeasonDbSize]
        push dword [seasondb]
        lea eax, [byte ebp+046h]
        push eax
        call SaveFileBlock
        mov eax, 1
        add esp, byte 0Ch
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; SimSeasonGames                               80E4D  96 PC, medium confidence
; Simulates the scheduled season games up to a day with a progress box
; (SimulateGame for each), from the season menus and the calendar
;-----------------------------------------------------------------------------
SimSeasonGames:
        push ebx
        push ecx
        push esi
        push edi
        enter 0E4h, 0
        push eax
        push edx
        sub ebp, 82h
        mov dword [byte ebp+032h], 0
        mov dword [byte ebp+026h], 0
        mov eax, 3
        mov ebx, 6
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [statsplayoffs]
        mov edx, dword [PlayoffTreeData]
        mov dword [byte ebp+042h], eax
        lea eax, [byte ebp-062h]
        mov dword [byte ebp+05Eh], 1
        call MakeSeasonDbPath
        cmp dword [byte ebp-06Ah], byte 0
        jne short .1
        push byte 0
        lea eax, [byte ebp-062h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [byte ebp-06Ah], eax
        jmp short .2
.1:
        mov dword [byte ebp+026h], 1
.2:
        mov esi, dword [byte ebp-06Ah]
        cmp word [esi], byte 0
        jne short .3
        mov word [esi], 2
.3:
        movzx eax, word [esi]
        cmp eax, dword [byte ebp-066h]
        jg near .10
        mov edx, dword [byte ebp-066h]
        sub edx, eax
        mov ecx, 0F0h
        lea eax, [byte edx+06h]
        mov ebx, 140h
        push eax
        mov eax, 4Fh
        mov edx, TitleTextStyle
        call GetLangText
        call ShowProgressBox
.4:
        movzx eax, word [esi]
        cmp eax, dword [byte ebp-066h]
        jg short .6
        add dword [byte ebp+032h], byte 6
        call SoundIdle
        mov eax, dword [byte ebp+032h]
        mov edi, dword [byte ebp-06Ah]
        call UpdateProgressBox
        movzx edx, word [esi]
        add edi, edx
        movzx eax, byte [byte edi+02h]
        imul eax, byte 1Ah
        cmp byte [dword eax+SeasonUserSlot], 0
        jne short .5
        movzx eax, byte [byte edi+03h]
        imul eax, byte 1Ah
        cmp byte [dword eax+SeasonUserSlot], 0
        jne short .5
        mov eax, dword [SeasonRandomSeed]
        mov ecx, 0FFFFFFFFh
        add eax, edx
        xor ebx, ebx
        call srand_
        push byte 0
        mov edx, edi
        xor eax, eax
        call SimulateGame
.5:
        add word [esi], byte 6
        jmp short .4
.6:
        movzx edx, byte [byte edi+01h]
        mov dword [byte ebp+04Ah], edx
        movzx edx, byte [edi]
        mov edi, dword [byte ebp-06Ah]
        mov dword [byte ebp+046h], edx
        add edi, eax
.7:
        movzx eax, byte [byte edi+01h]
        cmp eax, dword [byte ebp+04Ah]
        jne short .9
        movzx eax, byte [edi]
        cmp eax, dword [byte ebp+046h]
        jne short .9
        mov edi, dword [byte ebp-06Ah]
        movzx edx, word [esi]
        add edi, edx
        movzx eax, byte [byte edi+02h]
        imul eax, byte 1Ah
        cmp byte [dword eax+SeasonUserSlot], 0
        jne short .8
        movzx eax, byte [byte edi+03h]
        imul eax, byte 1Ah
        cmp byte [dword eax+SeasonUserSlot], 0
        jne short .8
        movzx eax, byte [byte edi+01h]
        cmp eax, dword [byte ebp+04Ah]
        jne short .8
        movzx eax, byte [edi]
        cmp eax, dword [byte ebp+046h]
        jne short .8
        mov eax, dword [SeasonRandomSeed]
        mov ecx, 0FFFFFFFFh
        add eax, edx
        xor ebx, ebx
        call srand_
        push byte 0
        mov edx, edi
        xor eax, eax
        call SimulateGame
.8:
        add word [esi], byte 6
        jmp short .7
.9:
        mov ebx, 6
        sub word [esi], byte 6
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        lea eax, [byte ebp-062h]
        push eax
        call FileSizeByName
        add esp, byte 4
        push eax
        push dword [byte ebp-06Ah]
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        mov ebx, 5
        add esp, byte 0Ch
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword [SeasonDbSize]
        push dword [seasondb]
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        mov ebx, 6
        add esp, byte 0Ch
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        lea eax, [byte ebp-062h]
        push eax
        call FileSizeByName
        add esp, byte 4
        push eax
        push dword [byte ebp-06Ah]
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        mov ebx, 4
        add esp, byte 0Ch
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword [PlayoffStatsSize]
        push dword [statsplayoffs]
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        call HideProgressBox
.10:
        mov eax, 50h
        mov ecx, 0C8h
        mov ebx, 140h
        mov edx, TitleTextStyle
        call GetLangText
        call ShowMessage
        cmp dword [SeasonType], byte 2
        jne short .11
        mov dword [byte ebp+06Ah], 19h
        jmp short .13
.11:
        cmp dword [SeasonType], byte 1
        jne short .12
        mov dword [byte ebp+06Ah], 30h
        jmp short .13
.12:
        mov dword [byte ebp+06Ah], 54h
.13:
        imul eax, dword [byte ebp+06Ah], dword 3E8h
        mov dword [byte ebp+05Ah], 0
        mov dword [byte ebp+04Eh], 0
        mov dword [byte ebp+03Eh], eax
        mov eax, dword [byte ebp+042h]
        mov dword [byte ebp+036h], 41h
        mov dword [byte ebp+02Ah], eax
.14:
        call SoundIdle
        mov eax, dword [byte ebp+04Eh]
        movsx eax, byte [dword eax+SeasonUserSlot]
        cmp eax, byte 1
        jne near .21
        mov edx, 4
        lea eax, [byte ebp-062h]
        xor ebx, ebx
        call MakeDirPath
        push dword [byte ebp+036h]
        push dword [PlayoffTreeData]
        lea eax, [byte ebp-062h]
        push eax
        push str_S05dCNZDB
        lea eax, [byte ebp-042h]
        push eax
        call sprintf_
        add esp, byte 14h
        push byte 0
        lea eax, [byte ebp-042h]
        push eax
        mov dword [byte ebp+056h], 0
        mov dword [byte ebp+066h], 0
        call OpenArtArchiveErr
        mov dword [byte ebp+062h], eax
        mov edi, eax
        mov eax, dword [byte ebp+02Ah]
        add esp, byte 8
        mov dword [byte ebp+02Eh], eax
        jmp short .18
.15:
        imul eax, dword 3E8h
        mov dword [byte ebp+03Ah], eax
        movsx eax, byte [edi]
        cmp eax, byte 2
        jne short .16
        mov eax, dword [byte ebp+02Eh]
        mov ebx, dword [byte ebp-06Ah]
        mov ecx, dword [byte ebp+062h]
        mov edx, dword [byte ebp+066h]
        add ebx, dword [dword eax+014Fh]
        mov eax, dword [byte ebp+05Ah]
        call ApplyDayResults
        test eax, eax
        je short .16
        mov byte [edi], 1
.16:
        mov eax, dword [byte ebp+062h]
        add eax, dword [byte ebp+03Ah]
        movsx eax, byte [eax]
        cmp eax, byte 1
        jne short .17
        add dword [byte ebp+056h], eax
.17:
        add dword [byte ebp+02Eh], byte 4
        inc dword [byte ebp+066h]
        add edi, 3E8h
.18:
        mov eax, dword [byte ebp+066h]
        cmp eax, dword [byte ebp+06Ah]
        jl short .15
        mov eax, dword [byte ebp+056h]
        cmp eax, dword [byte ebp+06Ah]
        jne short .19
        cmp dword [byte ebp+05Eh], byte 1
        jne short .19
        mov dword [byte ebp+05Eh], 1
        jmp short .20
.19:
        mov dword [byte ebp+05Eh], 0
.20:
        push dword [byte ebp+03Eh]
        push dword [byte ebp+062h]
        lea eax, [byte ebp-042h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        push dword [byte ebp+062h]
        call FreeMemBlock
        add esp, byte 4
.21:
        add dword [byte ebp+04Eh], byte 1Ah
        add dword [byte ebp+02Ah], 31Bh
        inc dword [byte ebp+05Ah]
        inc dword [byte ebp+036h]
        cmp dword [byte ebp+05Ah], byte 1Ah
        jl near .14
        cmp dword [byte ebp+05Eh], byte 1
        jne near .50
        imul eax, dword [byte ebp+06Ah], byte 1Ah
        sar eax, 1
        imul eax, byte 6
        lea edi, [byte eax+02h]
.22:
        movzx eax, word [esi]
        cmp eax, edi
        jge short .24
        mov edx, dword [byte ebp-06Ah]
        add edx, eax
        movzx ebx, byte [byte edx+02h]
        imul ebx, byte 1Ah
        cmp byte [dword ebx+SeasonUserSlot], 0
        jne short .23
        movzx ebx, byte [byte edx+03h]
        imul ebx, byte 1Ah
        cmp byte [dword ebx+SeasonUserSlot], 0
        jne short .23
        add eax, dword [SeasonRandomSeed]
        mov ecx, 0FFFFFFFFh
        call srand_
        push byte 0
        xor ebx, ebx
        xor eax, eax
        call SimulateGame
.23:
        add word [esi], byte 6
        jmp short .22
.24:
        mov dword [SeasonPlayoffs], 1
        mov byte [byte ebp+07Eh], 0FFh
        lea edi, [byte ebp+016h]
        mov esi, SeasonPlayoffBracketOrder
        mov byte [byte ebp+07Ah], 0FFh
        mov byte [byte ebp+072h], 0FFh
        movsd
        movsd
        mov byte [byte ebp+076h], 0FFh
        mov eax, dword [statsplayoffs]
        mov dword [byte ebp+022h], 0
        mov dword [byte ebp+06Eh], eax
        xor eax, eax
.25:
        add eax, byte 1Ah
        mov edx, dword [byte ebp+022h]
        mov bl, byte [byte ebp+022h]
        mov byte [dword eax+SeasonUserSim], 1
        inc dword [byte ebp+022h]
        mov byte [byte edx+ebp-022h], bl
        cmp dword [byte ebp+022h], byte 1Ah
        jl short .25
        mov ecx, CompareTeamPoints
        mov ebx, 1
        mov edx, 1Ah
        lea eax, [byte ebp-022h]
        mov dword [byte ebp+022h], 0
        call qsort_
.26:
        movsx eax, byte [byte ebp+07Eh]
        cmp eax, byte 0FFFFFFFFh
        jne short .27
        mov eax, dword [byte ebp+022h]
        movsx eax, byte [byte eax+ebp-022h]
        imul eax, dword 31Bh
        add eax, dword [byte ebp+06Eh]
        movzx eax, byte [byte eax+02Eh]
        cmp eax, byte 1
        jne short .27
        mov eax, dword [byte ebp+022h]
        mov al, byte [byte eax+ebp-022h]
        mov byte [byte ebp+07Eh], al
.27:
        movsx eax, byte [byte ebp+07Ah]
        cmp eax, byte 0FFFFFFFFh
        jne short .28
        mov eax, dword [byte ebp+022h]
        movsx eax, byte [byte eax+ebp-022h]
        imul eax, dword 31Bh
        add eax, dword [byte ebp+06Eh]
        movzx eax, byte [byte eax+02Eh]
        cmp eax, byte 2
        jne short .28
        mov eax, dword [byte ebp+022h]
        mov al, byte [byte eax+ebp-022h]
        mov byte [byte ebp+07Ah], al
.28:
        movsx eax, byte [byte ebp+072h]
        cmp eax, byte 0FFFFFFFFh
        jne short .29
        mov eax, dword [byte ebp+022h]
        movsx eax, byte [byte eax+ebp-022h]
        imul eax, dword 31Bh
        add eax, dword [byte ebp+06Eh]
        movzx eax, byte [byte eax+02Eh]
        cmp eax, byte 4
        jne short .29
        mov eax, dword [byte ebp+022h]
        mov al, byte [byte eax+ebp-022h]
        mov byte [byte ebp+072h], al
.29:
        movsx eax, byte [byte ebp+076h]
        cmp eax, byte 0FFFFFFFFh
        jne short .30
        mov eax, dword [byte ebp+022h]
        movsx eax, byte [byte eax+ebp-022h]
        imul eax, dword 31Bh
        add eax, dword [byte ebp+06Eh]
        movzx eax, byte [byte eax+02Eh]
        cmp eax, byte 8
        jne short .30
        mov eax, dword [byte ebp+022h]
        mov al, byte [byte eax+ebp-022h]
        mov byte [byte ebp+076h], al
.30:
        inc dword [byte ebp+022h]
        cmp dword [byte ebp+022h], byte 1Ah
        jl near .26
        mov ah, 4
        mov dword [byte ebp+022h], 0
.31:
        mov edx, dword [byte ebp+022h]
        mov al, byte [byte edx+ebp-022h]
        cmp al, byte [byte ebp+07Eh]
        je short .32
        cmp al, byte [byte ebp+07Ah]
        je short .32
        cmp al, byte [byte ebp+072h]
        je short .32
        cmp al, byte [byte ebp+076h]
        jne short .33
.32:
        dec ah
        jmp short .34
.33:
        movsx edx, ah
        mov ebx, dword [byte ebp+022h]
        add edx, dword [byte ebp+022h]
        mov al, byte [byte ebx+ebp-022h]
        mov byte [byte edx+ebp-06h], al
.34:
        inc dword [byte ebp+022h]
        cmp dword [byte ebp+022h], byte 1Ah
        jl short .31
        lea edx, [byte ebp+07Ah]
        lea eax, [byte ebp+07Eh]
        call CompareTeamPoints
        test eax, eax
        jge short .35
        mov al, byte [byte ebp+07Eh]
        mov byte [byte ebp-06h], al
        mov al, byte [byte ebp+07Ah]
        jmp short .36
.35:
        mov al, byte [byte ebp+07Ah]
        mov byte [byte ebp-06h], al
        mov al, byte [byte ebp+07Eh]
.36:
        mov byte [byte ebp-05h], al
        lea edx, [byte ebp+076h]
        lea eax, [byte ebp+072h]
        call CompareTeamPoints
        test eax, eax
        jge short .37
        mov al, byte [byte ebp+072h]
        mov byte [byte ebp-04h], al
        mov al, byte [byte ebp+076h]
        jmp short .38
.37:
        mov al, byte [byte ebp+076h]
        mov byte [byte ebp-04h], al
        mov al, byte [byte ebp+072h]
.38:
        mov byte [byte ebp-03h], al
        mov dword [byte ebp+022h], 0
.39:
        mov eax, dword [byte ebp+022h]
        mov edx, dword [byte ebp+022h]
        mov al, byte [byte eax+ebp-06h]
        inc dword [byte ebp+022h]
        mov byte [byte edx+ebp-022h], al
        cmp dword [byte ebp+022h], byte 1Ah
        jl short .39
        mov dword [byte ebp+022h], 0
        xor al, al
.40:
        movsx edx, al
        movsx ebx, byte [byte edx+ebp-022h]
        imul edx, ebx, dword 31Bh
        add edx, dword [byte ebp+06Eh]
        movzx edx, byte [byte edx+02Eh]
        cmp edx, byte 4
        je short .41
        cmp edx, byte 8
        jne short .42
.41:
        inc al
        jmp short .40
.42:
        mov edx, dword [byte ebp+022h]
        inc al
        movsx edx, byte [byte edx+ebp+016h]
        inc dword [byte ebp+022h]
        mov dword [nosplit edx*4+PlayoffSlotTeams], ebx
        cmp dword [byte ebp+022h], byte 8
        jl short .40
        mov dword [byte ebp+022h], 0
        xor al, al
.43:
        movsx edx, al
        movsx ebx, byte [byte edx+ebp-022h]
        imul edx, ebx, dword 31Bh
        add edx, dword [byte ebp+06Eh]
        movzx edx, byte [byte edx+02Eh]
        cmp edx, byte 1
        je short .44
        cmp edx, byte 2
        jne short .45
.44:
        inc al
        jmp short .43
.45:
        mov edx, dword [byte ebp+022h]
        inc al
        movsx edx, byte [byte edx+ebp+016h]
        inc dword [byte ebp+022h]
        mov dword [nosplit edx*4+PlayoffSimTeams], ebx
        cmp dword [byte ebp+022h], byte 8
        jl short .43
        mov dword [byte ebp+052h], 0
        mov dword [byte ebp+022h], 0
        mov ebx, PlayoffName
        xor edx, edx
.46:
        imul eax, dword [byte ebp+022h], byte 1Ah
        imul esi, dword [dword edx+PlayoffSlotTeams], byte 1Ah
        mov ecx, 1Ah
        mov edi, ebx
        add esi, SeasonUserName
        mov dword [byte ebp+01Eh], eax
        rep movsb
        mov eax, dword [byte ebp+01Eh]
        cmp byte [dword eax+PlayoffTeams], 0
        jne short .47
        imul eax, dword [dword edx+PlayoffSlotTeams], dword 31Bh
        add eax, dword [byte ebp+06Eh]
        add eax, byte 1Eh
        call strlen_
        imul esi, dword [dword edx+PlayoffSlotTeams], dword 31Bh
        mov edi, ebx
        add esi, dword [byte ebp+06Eh]
        mov ecx, eax
        add esi, byte 1Eh
        rep movsb
        jmp short .48
.47:
        inc dword [byte ebp+052h]
.48:
        inc dword [byte ebp+022h]
        add ebx, byte 1Ah
        add edx, byte 4
        cmp dword [byte ebp+022h], byte 10h
        jl short .46
        cmp dword [byte ebp+052h], byte 0
        jne short .49
        call ClearPlayoffTree
        call PlayoffRound1
        call PlayoffRound2
        call PlayoffRound3
        call PlayoffFinal
.49:
        mov ebx, 7
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword 3A7h
        push SeasonUserRecords
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        mov ebx, 0Ah
        add esp, byte 0Ch
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword 39Dh
        push PlayoffHeader
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        mov ebx, 6
        add esp, byte 0Ch
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        lea eax, [byte ebp-062h]
        push eax
        call FileSizeByName
        add esp, byte 4
        push eax
        push dword [byte ebp-06Ah]
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        mov ebx, 5
        add esp, byte 0Ch
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword [SeasonDbSize]
        push dword [seasondb]
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        mov ebx, 6
        add esp, byte 0Ch
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        lea eax, [byte ebp-062h]
        push eax
        call FileSizeByName
        add esp, byte 4
        push eax
        push dword [byte ebp-06Ah]
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        mov ebx, 4
        add esp, byte 0Ch
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword [PlayoffStatsSize]
        push dword [statsplayoffs]
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
.50:
        mov ebx, 6
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        lea eax, [byte ebp-062h]
        push eax
        call FileSizeByName
        add esp, byte 4
        push eax
        push dword [byte ebp-06Ah]
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        cmp dword [byte ebp+026h], byte 0
        jne short .51
        push dword [byte ebp-06Ah]
        call FreeMemBlock
        add esp, byte 4
.51:
        mov ebx, 4
        lea eax, [byte ebp-062h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword [PlayoffStatsSize]
        push dword [statsplayoffs]
        lea eax, [byte ebp-062h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        call HideMessage
        cmp dword [byte ebp+026h], byte 0
        jne short .52
        call BlackPalette
.52:
        mov eax, dword [PlayoffTreeData]
        call LoadSeasonStats
        jmp near UpdateTeamDbs_86F
;-----------------------------------------------------------------------------
; ApplyPlayoffDayResults                          81721  96 PC, low confidence
; (day): the same for a playoff day (MakePlayoffDbPath)
;-----------------------------------------------------------------------------
ApplyPlayoffDayResults:
        push ecx
        push esi
        push edi
        enter 0B4h, 0
        push ebx
        sub ebp, 82h
        imul edx, dword 3E8h
        mov byte [byte ebp+076h], 0FFh
        mov byte [byte ebp+07Eh], 0FFh
        mov eax, dword [statsplayoffs]
        mov dword [byte ebp+056h], edx
        mov dword [byte ebp+052h], eax
        inc dword [byte ebp+056h]
.1:
        mov eax, dword [byte ebp-036h]
        add eax, dword [byte ebp+056h]
        cmp byte [eax], 0F2h
        je near .45
        cmp byte [eax], 0F0h
        jne short .2
        movsx eax, byte [PlayoffHomeTeam]
        imul eax, dword [nosplit eax*4+PlayoffSlotTeams], dword 31Bh
        mov edx, dword [byte ebp+052h]
        add edx, eax
        movsx eax, byte [PlayoffAwayTeam]
        imul eax, dword [nosplit eax*4+PlayoffSlotTeams], dword 31Bh
        mov dword [byte ebp+05Eh], edx
        mov edx, dword [byte ebp+052h]
        add edx, eax
        mov byte [byte ebp+07Ah], 0
        mov dword [byte ebp+05Ah], edx
        mov edx, dword [byte ebp+05Eh]
        movzx eax, byte [byte ebp+07Eh]
        inc byte [byte edx+041h]
        cmp eax, 0FFh
        jne short .3
        mov al, byte [hmscore]
        mov byte [byte ebp+07Eh], al
        jmp short .3
.2:
        movsx eax, byte [PlayoffHomeTeam]
        imul eax, dword [nosplit eax*4+PlayoffSlotTeams], dword 31Bh
        mov edx, dword [byte ebp+052h]
        add edx, eax
        movsx eax, byte [PlayoffAwayTeam]
        imul eax, dword [nosplit eax*4+PlayoffSlotTeams], dword 31Bh
        mov dword [byte ebp+05Ah], edx
        mov edx, dword [byte ebp+052h]
        mov byte [byte ebp+07Ah], 1
        add edx, eax
        movzx eax, byte [byte ebp+076h]
        mov dword [byte ebp+05Eh], edx
        inc byte [byte edx+041h]
        cmp eax, 0FFh
        jne short .3
        mov al, byte [awscore]
        mov byte [byte ebp+076h], al
.3:
        inc dword [byte ebp+056h]
        lea edx, [byte ebp-032h]
        mov ebx, dword [byte ebp+056h]
        lea eax, [byte edx+064h]
        add ebx, dword [byte ebp-036h]
        mov dword [byte ebp+062h], eax
.4:
        mov ecx, 4
        mov esi, ebx
        mov edi, edx
        add dword [byte ebp+056h], byte 4
        rep movsb
        add edx, byte 4
        add ebx, byte 4
        cmp edx, dword [byte ebp+062h]
        jne short .4
        lea eax, [byte ebp-032h]
        lea edx, [byte eax+064h]
        mov ebx, dword [byte ebp+056h]
        add eax, byte 70h
        add ebx, dword [byte ebp-036h]
        mov dword [byte ebp+066h], eax
.5:
        mov ecx, 4
        mov esi, ebx
        mov edi, edx
        add dword [byte ebp+056h], byte 4
        rep movsb
        add edx, byte 4
        add ebx, byte 4
        cmp edx, dword [byte ebp+066h]
        jne short .5
        mov edx, dword [byte ebp+056h]
        add edx, dword [byte ebp-036h]
.6:
        mov eax, dword [byte ebp+056h]
        inc eax
        cmp byte [edx], 0FFh
        je short .7
        inc edx
        mov dword [byte ebp+056h], eax
        jmp short .6
.7:
        mov edx, dword [byte ebp-036h]
        mov ebx, eax
        add edx, eax
.8:
        inc ebx
        cmp byte [edx], 0FEh
        je short .9
        movzx eax, byte [edx]
        mov ecx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4-032h]
        add eax, ecx
        mov ecx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc word [byte ecx+eax+014h]
        inc word [byte ecx+eax+018h]
        mov eax, dword [byte ebp+05Eh]
        inc word [byte eax+045h]
        mov eax, dword [byte ebp+05Ah]
        inc edx
        inc word [byte eax+047h]
        jmp short .8
.9:
        mov eax, dword [byte ebp-036h]
        mov edx, ebx
        add eax, ebx
.10:
        lea ebx, [byte edx+01h]
        cmp byte [eax], 0FDh
        je short .11
        movzx edx, byte [eax]
        mov ecx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4-032h]
        add edx, ecx
        mov ecx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc eax
        inc word [byte ecx+edx+020h]
        mov edx, ebx
        jmp short .10
.11:
        mov eax, dword [byte ebp-036h]
        mov edx, ebx
        add eax, ebx
.12:
        lea ebx, [byte edx+01h]
        cmp byte [eax], 0FCh
        je short .13
        movzx edx, byte [eax]
        mov ecx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4-032h]
        add edx, ecx
        mov ecx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc eax
        inc word [byte ecx+edx+012h]
        mov edx, ebx
        jmp short .12
.13:
        mov edx, dword [byte ebp-036h]
        mov eax, ebx
        add edx, ebx
.14:
        lea ebx, [byte eax+01h]
        cmp byte [edx], 0FBh
        je short .15
        movzx eax, byte [edx]
        mov ecx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4-032h]
        add eax, ecx
        mov ecx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc word [byte ecx+eax+016h]
        inc edx
        inc word [byte ecx+eax+018h]
        mov eax, ebx
        jmp short .14
.15:
        mov eax, dword [byte ebp-036h]
        mov esi, ebx
        add eax, ebx
.16:
        inc esi
        cmp byte [eax], 0FAh
        je short .17
        movzx edx, byte [eax]
        mov ebx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4-032h]
        add edx, ebx
        mov ebx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc word [byte edx+ebx+01Eh]
        mov edx, dword [byte ebp+05Eh]
        inc eax
        inc word [byte edx+051h]
        jmp short .16
.17:
        mov eax, dword [byte ebp-036h]
        mov edx, 0FFFFFFFCh
        mov ebx, esi
        add eax, esi
.18:
        cmp byte [eax], 0F9h
        je short .20
        add edx, byte 4
        cmp dword [byte edx+ebp-032h], byte 0FFFFFFFFh
        je short .19
        mov ecx, dword [TeamDb]
        add ecx, dword [byte edx+ebp-032h]
        mov esi, dword [seasondb]
        mov ecx, dword [byte ecx+02Ch]
        add ecx, esi
        movzx si, byte [eax]
        sub esi, 80h
        add word [byte ecx+022h], si
.19:
        inc eax
        inc ebx
        jmp short .18
.20:
        mov eax, dword [byte ebp-036h]
        inc ebx
        add eax, ebx
.21:
        inc ebx
        cmp byte [eax], 0F8h
        je short .22
        movzx edx, byte [eax]
        mov ecx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4-032h]
        add edx, ecx
        mov ecx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc word [byte ecx+edx+01Ah]
        mov edx, dword [byte ebp+05Eh]
        inc word [byte edx+049h]
        mov edx, dword [byte ebp+05Ah]
        inc eax
        inc word [byte edx+04Dh]
        jmp short .21
.22:
        mov edx, dword [byte ebp-036h]
        mov eax, ebx
        add edx, ebx
.23:
        lea ebx, [byte eax+01h]
        cmp byte [edx], 0F7h
        je short .24
        movzx eax, byte [edx]
        mov ecx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4-032h]
        add eax, ecx
        mov ecx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc edx
        inc word [byte ecx+eax+01Ch]
        mov eax, ebx
        jmp short .23
.24:
        mov eax, dword [byte ebp-036h]
        mov ecx, dword [byte ebp+05Eh]
        movzx dx, byte [ebx+eax]
        add word [byte ecx+04Bh], dx
        mov edx, dword [byte ebp+05Ah]
        movzx ax, byte [ebx+eax]
        inc ebx
        inc ebx
        add word [byte edx+04Fh], ax
        mov edx, dword [byte ebp-036h]
        add edx, ebx
.25:
        lea ecx, [byte ebx+01h]
        cmp byte [edx], 0F5h
        je short .26
        movzx eax, byte [edx]
        mov ebx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4+032h]
        add eax, ebx
        mov ebx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc edx
        inc word [byte ebx+eax+016h]
        mov ebx, ecx
        jmp short .25
.26:
        mov ebx, ecx
        add ecx, dword [byte ebp-036h]
        xor edx, edx
        mov dword [byte ebp+06Ah], ecx
.27:
        mov eax, dword [TeamDb]
        add eax, dword [byte edx+ebp+032h]
        cmp dword [byte edx+ebp+032h], byte 0FFFFFFFFh
        je short .28
        mov esi, dword [byte ebp+06Ah]
        mov ecx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        lea edi, [byte ebp+072h]
        add eax, ecx
        mov ecx, 2
        mov dword [byte ebp+06Eh], eax
        rep movsb
        mov ecx, dword [byte ebp+06Eh]
        mov eax, dword [byte ebp+072h]
        add word [byte ecx+022h], ax
.28:
        add dword [byte ebp+06Ah], byte 2
        add edx, byte 4
        inc ebx
        inc ebx
        cmp edx, byte 0Ch
        jne short .27
        mov ecx, dword [byte ebp-036h]
        xor edx, edx
        add ecx, ebx
.29:
        mov eax, dword [TeamDb]
        add eax, dword [byte edx+ebp+032h]
        cmp dword [byte edx+ebp+032h], byte 0FFFFFFFFh
        je short .31
        mov esi, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        add eax, esi
        movzx esi, byte [ecx]
        cmp esi, byte 1
        jne short .30
        inc word [byte eax+018h]
.30:
        movzx esi, byte [ecx]
        cmp esi, byte 2
        jne short .31
        inc word [byte eax+01Ah]
.31:
        inc ecx
        add edx, byte 4
        inc ebx
        cmp edx, byte 0Ch
        jne short .29
        mov ecx, dword [byte ebp-036h]
        xor eax, eax
        add ecx, ebx
.32:
        mov edx, dword [TeamDb]
        add edx, dword [byte eax+ebp+032h]
        cmp dword [byte eax+ebp+032h], byte 0FFFFFFFFh
        je short .33
        mov esi, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        add edx, esi
        movzx esi, byte [ecx]
        cmp esi, byte 4
        jne short .33
        inc word [byte edx+01Eh]
.33:
        inc ecx
        add eax, byte 4
        inc ebx
        cmp eax, byte 0Ch
        jne short .32
        mov eax, dword [byte ebp-036h]
        inc ebx
        add eax, ebx
.34:
        inc ebx
        cmp byte [eax], 0EFh
        je short .35
        movzx edx, byte [eax]
        mov ecx, dword [TeamDb]
        mov edx, dword [byte ebp+edx*4+032h]
        add edx, ecx
        mov ecx, dword [seasondb]
        mov edx, dword [byte edx+02Ch]
        inc eax
        inc word [byte ecx+edx+024h]
        jmp short .34
.35:
        mov ecx, ebx
        add ebx, dword [byte ebp-036h]
.36:
        inc ecx
        cmp byte [ebx], 0F3h
        je short .37
        movzx eax, byte [ebx]
        mov edx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4+032h]
        add eax, edx
        mov edx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc ebx
        inc word [byte edx+eax+020h]
        jmp short .36
.37:
        mov dword [byte ebp+056h], ecx
        add ecx, dword [byte ebp-036h]
.38:
        movzx eax, byte [ecx]
        cmp eax, 0F0h
        je short .39
        cmp eax, 0F1h
        je short .39
        cmp byte [ecx], 0F2h
        je short .39
        mov edx, dword [TeamDb]
        mov eax, dword [byte ebp+eax*4+032h]
        add eax, edx
        mov edx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc dword [byte ebp+056h]
        inc ecx
        inc word [byte edx+eax+028h]
        jmp short .38
.39:
        xor ecx, ecx
.40:
        cmp dword [byte ecx+ebp+032h], byte 0FFFFFFFFh
        je near .44
        mov eax, dword [TeamDb]
        add eax, dword [byte ecx+ebp+032h]
        mov ebx, dword [seasondb]
        add ebx, dword [byte eax+02Ch]
        cmp word [byte ebx+028h], byte 0
        jbe short .41
        movzx eax, word [byte ebx+024h]
        imul eax, dword 3E8h
        movzx esi, word [byte ebx+028h]
        cdq
        idiv esi
        mov edx, 3E8h
        sub edx, eax
        mov word [byte ebx+02Ah], dx
        jmp short .42
.41:
        mov word [byte ebx+02Ah], 0
.42:
        cmp word [byte ebx+022h], byte 0
        jbe short .43
        mov eax, dword [PlayoffGameOpts]
        shl eax, 15h
        shr eax, 1Eh
        imul eax, dword [nosplit eax*4+SimStatWeights], byte 64h
        movzx edx, word [byte ebx+024h]
        imul eax, edx
        movzx esi, word [byte ebx+022h]
        cdq
        idiv esi
        mov word [byte ebx+026h], ax
        jmp short .44
.43:
        mov word [byte ebx+026h], 0
.44:
        add ecx, byte 4
        cmp ecx, byte 0Ch
        jge near .1
        jmp near .40
.45:
        movzx eax, byte [byte ebp+07Eh]
        cmp eax, 0FFh
        je near .49
        movzx eax, byte [byte ebp+076h]
        cmp eax, 0FFh
        je short .49
        mov al, byte [byte ebp+07Eh]
        cmp al, byte [byte ebp+076h]
        jbe short .47
        cmp byte [byte ebp+07Ah], 0
        jne short .46
        mov eax, dword [byte ebp+05Eh]
        inc byte [byte eax+042h]
        inc byte [byte eax+060h]
        mov eax, dword [byte ebp+05Ah]
        inc byte [byte eax+043h]
        inc byte [byte eax+05Dh]
        jmp short .49
.46:
        mov eax, dword [byte ebp+05Eh]
        inc byte [byte eax+043h]
        inc byte [byte eax+05Dh]
        mov eax, dword [byte ebp+05Ah]
        inc byte [byte eax+042h]
        inc byte [byte eax+060h]
        jmp short .49
.47:
        cmp byte [byte ebp+07Ah], 0
        jne short .48
        mov eax, dword [byte ebp+05Ah]
        inc byte [byte eax+042h]
        inc byte [byte eax+05Ch]
        mov eax, dword [byte ebp+05Eh]
        inc byte [byte eax+061h]
        inc byte [byte eax+043h]
        jmp short .49
.48:
        mov eax, dword [byte ebp+05Ah]
        inc byte [byte eax+061h]
        inc byte [byte eax+043h]
        mov eax, dword [byte ebp+05Eh]
        inc byte [byte eax+042h]
        inc byte [byte eax+05Ch]
.49:
        cmp dword [PlayoffsActive], byte 0
        je short .50
        mov ebx, 5
        lea eax, [byte ebp+03Eh]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        jmp short .51
.50:
        mov ebx, 5
        lea eax, [byte ebp+03Eh]
        mov edx, dword [RosterFileHandle]
        call MakePlayoffDbPath
.51:
        push dword [SeasonDbSize]
        push dword [seasondb]
        lea eax, [byte ebp+03Eh]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        cmp dword [PlayoffsActive], byte 0
        je short .52
        mov ebx, 4
        lea eax, [byte ebp+03Eh]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        jmp short .53
.52:
        mov ebx, 4
        lea eax, [byte ebp+03Eh]
        mov edx, dword [RosterFileHandle]
        call MakePlayoffDbPath
.53:
        push dword [PlayoffStatsSize]
        push dword [statsplayoffs]
        lea eax, [byte ebp+03Eh]
        push eax
        call SaveFileBlock
        mov eax, 1
        add esp, byte 0Ch
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; SaveSeasonTeams                                 81D7C  96 PC, low confidence
; Writes the changed teams' %s%05d%cNZ.DB files (PlayoffTeams marks)
;-----------------------------------------------------------------------------
SaveSeasonTeams:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 5Ch, 0
        mov dword [byte ebp-014h], 0
        mov dword [byte ebp-08h], 0
        xor esi, esi
.1:
        mov eax, dword [byte ebp-08h]
        movsx eax, byte [dword eax+PlayoffTeams]
        cmp eax, byte 1
        jne near .9
        cmp dword [PlayoffsActive], byte 0
        je short .4
        mov edx, 4
        lea eax, [byte ebp-05Ch]
        xor ebx, ebx
        call MakeDirPath
        mov eax, dword [dword esi+PlayoffSlotTeams]
        add eax, byte 41h
        push eax
        push dword [PlayoffTreeData]
        lea eax, [byte ebp-05Ch]
        push eax
        push str_S05dCNZDB
        lea eax, [byte ebp-034h]
        push eax
        call sprintf_
        add esp, byte 14h
        cmp dword [SeasonType], byte 2
        jne short .2
        mov edi, 19h
        jmp short .5
.2:
        cmp dword [SeasonType], byte 1
        jne short .3
        mov edi, 30h
        jmp short .5
.3:
        mov edi, 54h
        jmp short .5
.4:
        mov edx, 6
        lea eax, [byte ebp-05Ch]
        xor ebx, ebx
        call MakeDirPath
        mov eax, dword [dword esi+PlayoffSlotTeams]
        add eax, byte 41h
        push eax
        push dword [RosterFileHandle]
        lea eax, [byte ebp-05Ch]
        push eax
        push str_S05dCNZDB
        lea eax, [byte ebp-034h]
        push eax
        xor edi, edi
        call sprintf_
        add esp, byte 14h
.5:
        push byte 0
        lea eax, [byte ebp-034h]
        push eax
        mov dword [byte ebp-04h], edi
        call OpenArtArchiveErr
        lea ecx, [byte edi+01Ch]
        mov dword [byte ebp-010h], ecx
        imul ecx, edi, dword 3E8h
        add esp, byte 8
        mov dword [byte ebp-0Ch], eax
        add ecx, eax
        jmp short .8
.6:
        movsx eax, byte [ecx]
        cmp eax, byte 2
        jne short .7
        mov ebx, dword [byte ebp-0Ch]
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-014h]
        call ApplyPlayoffDayResults
        test eax, eax
        je short .7
        mov byte [ecx], 1
.7:
        inc dword [byte ebp-04h]
        add ecx, 3E8h
.8:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte ebp-010h]
        jl short .6
        imul eax, dword [byte ebp-010h], dword 3E8h
        push eax
        push dword [byte ebp-0Ch]
        lea eax, [byte ebp-034h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        push dword [byte ebp-0Ch]
        call FreeMemBlock
        add esp, byte 4
.9:
        add dword [byte ebp-08h], byte 1Ah
        inc dword [byte ebp-014h]
        add esi, byte 4
        cmp dword [byte ebp-014h], byte 10h
        jl near .1
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
SimGameZero:                                    ; used by SimulateGame
        db 00h,00h
        push esi
        mov esi, edx
        cmp dword [eax], byte 4
        jge short .1
        mov edx, dword [eax]
        mov dword [esi+edx*8], ebx
        mov edx, dword [eax]
        mov dword [byte esi+edx*8+04h], ecx
        inc dword [eax]
.1:
        pop esi
        ret
