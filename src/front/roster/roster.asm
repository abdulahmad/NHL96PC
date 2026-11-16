; The roster screens: trades, free agents, creating players, team ranks (96 PC).
bits 32
%include "hockey.inc"
extern BottomBarArt
extern SeasonUsers
section s_971E9 progbits alloc exec nowrite align=1
extern __CHP, __STOSD, AutoSetLines, SkaterRatingOrder, GoalieRatingOrder, TitleTextStyle, SeasonUserSlot
extern PlayerPosCodes, LinesWorkTable, DrawColorText, DrawColorTextRight, DrawFrameAt, DrawScrollBar
extern F32_0p001, F32_0p0208333, F32_0p00333333, F32_390, F32_0p005, F32_100, F32_neg50, F32_0p002
extern F32_0p0111111, F32_0p1, F32_0p0142857, F32_0p0333333, F32_58, F32_90, F32_0p01, F32_347
extern CareerDb, TeamDb, statsplayoffs, AttributeDb, CareerDbSize, TeamDbSize, PlayoffStatsSize, AttributeDbSize
extern RosterDbPtrs, RosterPlayerIds, SkaterRatingTextIds, GoalieRatingTextIds, TradeTextIds, RosterFirstRun, RatingsGoalieShown, RatingsSkaterShown
extern LoadingArtFrame, TeamStatsBitmap, PlayoffTreeData, RosterFileHandle, PlayerRecPtrs, PlayerHeightPtrs, PlayerWeightPtrs
extern RosterFirstNamePtrs, RosterJerseyPtrs, RosterPlayerPtrs, RosterProfilePtrs, RosterLastNamePtrs, TeamScoringScore
extern CreatePlayerShapes, TeamRatingScore, LineForwardCount, RosterBackFile, LineDefenceCount, LinesEditMode, LinesEditTeam
extern EditText, FadeOut, FadePalette, FillBox, FillRect, FreeScrollBar, gameopts, GetLangText
extern GetTeamNameArt, InitMenuItems, InitVScrollBar, LoadExhibitionStats, LoadModemStats, LoadPackedFile, LoadSeasonStats, LoadTeamLogo
extern MakeDataPath, MakeDirPath, MakeSeasonDbPath, MessageBox, PositionTags, OpenScreen, optflags, PlayerRatingsScreen
extern PutBlock, qsort_, F64_0p9, F64_0p1_CreatePlayerRatings, rand_, RunEditLines, RunMenu, ScrollBarDown
extern ScrollBarToMouse, ScrollBarUp, SetDrawBitmap, SetScreenColors, SetScrollBarPos, SetTextColors, SetTickDeadline, SlideInSideBar
extern SlideInTitleBar, SortTeamPlayers, sprintf_, str_Arl1, str_Arl2, str_Arl3, str_Arr1, str_Arr2
extern str_Arr3, str_Ball5, str_Bkgd19, str_C2dCS, str_Com1, str_Com2, str_Com3, str_Cre1
extern str_Cre2, str_Cre3, str_D12, str_DBPTRs2, str_Def1, str_Def2, str_Def3, str_El11
extern str_El12, str_El13, str_El21, str_El22, str_El23, str_FName2, str_Fre1, str_Fre2
extern str_Fre3, str_FreeAgents, str_FREEAGNTDB, str_GOL0, str_HeightNWeight2, str_LFRE, str_LName2, str_NME0
extern str_NME1, str_NME2, str_NUM0, str_NUM1, str_NUM2, str_Pal26, str_Player2, str_Profiles2
extern str_RosterSort, str_S12, str_S1dg2, str_S1dw2, str_S1ug2, str_S1up2, str_S23, str_S2dg2
extern str_S2dw2, str_S2ug2, str_S2up2, str_S33, str_S3dg2, str_S3dw2, str_S3ug2, str_S3up2
extern str_S4, str_S4dg, str_S4dw, str_S4ug, str_S4up, str_SD6, str_SGID, str_SS4
extern str_StatDBPTRs2, str_Tra12, str_Tra22, str_Tra32, str_TraD, strcat_, strcpy_, DrawArt
extern AllocMemBlock, FreeMemBlock, CreateBitmap, TintRows, FreeBitmap, DosFileInfo, atoi_, OpenArtArchiveErr
extern SaveFileBlock, DrawArtOpaqueAtOwnPos, SetScreenTarget, FindShape, TickDeadlinePassed, RosterTextBuf, LineForwardOrder, LineDefenceOrder
extern RosterRecords, RosterHotspots, str_X_RosterScreen, RosterKeyTable, str_Punct_CreatePlayerScreen, CreateSkaterNavLinks, CreateGoalieNavLinks
global RunRosterScreens, RunRosterScreens_230, RunRosterScreens_231, RosterScreen, DrawRosterTeams, DrawRosterTeams_17B, FormatRosterLine, FormatRosterLine_26D
global DrawRosterPlayerInfo, RosterSlotStatus, CountRosterSlots, FindRosterSlot, ListRosterPlayers, ValidateRoster, EditPlayerName, EditPlayerName_131
global ConfirmTrade, ResetTeamLines, CycleLoadingArt, jpt_9ADF0, jpt_9AE04, CreatePlayerScreen, CreatePlayerScreen_6BE, CreatePlayerScreen_71A
global CreatePlayerScreen_8D1, CreatePlayerScreen_8DA, CreatePlayerScreen_8E3, CreatePlayerScreen_8EC, CreatePlayerScreen_8F5, CreatePlayerScreen_BD2, CreatePlayerScreen_CF7, CreatePlayerScreen_DBB
global DrawCreatePlayerRow, RatingBar, CreatePlayerLimits, CreatePlayerRatings, CompareRankA, CompareRankB, SortTeamRatings, TeamRankScoring
global TeamRankScoring_48, TeamRankScoring_4A, TeamRankSkating, TeamRankOffence, TeamRankDefence, TeamRankGoalie, ComputeTeamRanks
;-----------------------------------------------------------------------------
; RunRosterScreens                             971E9  96 PC, medium confidence
; From the exhibition and season menus: sets up the stat tables (StatDBPTRs,
; DBPTRs, Player #, Profiles, ...), runs the roster, edit lines, ratings and
; player card screens, frees them
;-----------------------------------------------------------------------------
RunRosterScreens:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov edi, eax
        push byte 0
        push dword 0E0h
        push str_StatDBPTRs2
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0E0h
        push str_DBPTRs2
        mov dword [RosterDbPtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0E0h
        push str_Player2
        mov dword [RosterPlayerPtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0E0h
        push str_FName2
        mov dword [RosterFirstNamePtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0E0h
        push str_LName2
        mov dword [RosterLastNamePtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0E0h
        mov esi, 54CA39h
        mov dword [byte ebp-04h], 0
        push str_Profiles2
        mov dword [byte ebp-08h], 0
        mov dword [RosterProfilePtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [RosterJerseyPtrs], eax
.1:
        push byte 0
        push dword 0C00h
        push str_HeightNWeight2
        call AllocMemBlock
        mov edx, dword [byte ebp-08h]
        add esp, byte 0Ch
        add dword [byte ebp-08h], byte 4
        mov dword [dword edx+PlayerHeightPtrs], eax
        cmp dword [byte ebp-08h], byte 8
        jne short .1
        mov dword [RosterFirstRun], 1
.2:
        cmp esi, 54CA39h
        jne near .9
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 10h
        jne short .4
        mov ebx, dword [byte ebp-04h]
        mov eax, 63h
        mov edx, dword [PlayoffTreeData]
.3:
        mov ecx, edi
        jmp short .6
.4:
        cmp eax, byte 20h
        jne short .5
        mov ebx, dword [byte ebp-04h]
        mov eax, 63h
        mov edx, dword [RosterFileHandle]
        jmp short .3
.5:
        mov ebx, dword [byte ebp-04h]
        mov eax, 63h
        mov ecx, edi
        xor edx, edx
.6:
        call RosterScreen
        mov esi, eax
        cmp esi, byte 0Fh
        jne short .7
        mov eax, 1
        mov esi, 54CA39h
        mov dword [byte ebp-04h], 1
        call RunEditLines
.7:
        cmp esi, byte 11h
        jne short .8
        call CreatePlayerScreen
        mov esi, 54CA39h
        mov dword [byte ebp-04h], 1
.8:
        cmp esi, 54CA38h
        jne near .2
        mov ebx, 1
        mov eax, 1Ch
        mov esi, 54CA39h
        mov ecx, edi
        xor edx, edx
        mov dword [byte ebp-04h], 1
        call PlayerRatingsScreen
        jmp near .2
.9:
        push dword [RosterDbPtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterPlayerPtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterFirstNamePtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterLastNamePtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterProfilePtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterJerseyPtrs]
        xor esi, esi
        call FreeMemBlock
        add esp, byte 4
.10:
        push dword [dword esi+PlayerHeightPtrs]
        call FreeMemBlock
        add esi, byte 4
        add esp, byte 4
        cmp esi, byte 8
        jne short .10
        mov dword [RosterDbPtrs], 0
        cmp dword [RosterPlayerIds], byte 0
        je short RunRosterScreens_230
        push dword [RosterPlayerIds]
        call FreeMemBlock
        mov dword [RosterPlayerIds], 0
        add esp, byte 4
RunRosterScreens_230:
        leave
RunRosterScreens_231:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RosterScreen                                 97420  96 PC, medium confidence
; The roster screen: trades between teams, signing free agents (FREEAGNT.DB),
; creating players, by team lists (s1__-s4__)
;-----------------------------------------------------------------------------
RosterScreen:
        push esi
        push edi
        enter 373Ch, 0
        push eax
        push edx
        push ebx
        push ecx
        sub ebp, 82h
        mov ecx, 90h
        lea edi, [dword ebp-0A5Eh]
        mov dword [byte ebp+03Eh], 0FFFFFFFFh
        mov dword [byte ebp+02Eh], 0
        mov dword [byte ebp+02Ah], 0
        mov dword [byte ebp+026h], 0
        mov dword [byte ebp+022h], 0
        mov dword [byte ebp+016h], 0
        mov esi, RosterHotspots
        mov dword [byte ebp+012h], 0
        mov dword [byte ebp+0Eh], 0
        rep movsd
        mov dword [byte ebp+0Ah], 0
        mov ecx, 30h
        lea edi, [dword ebp-017Eh]
        mov esi, str_X_RosterScreen
        mov dword [byte ebp+06h], 0
        mov dword [byte ebp+02h], 0
        rep movsd
        mov dword [byte ebp-02h], 0
        mov ecx, 30h
        lea edi, [dword ebp-023Eh]
        mov esi, RosterKeyTable
        mov dword [byte ebp-06h], 0
        mov dword [byte ebp-0Ah], 0
        rep movsd
        mov dword [byte ebp-0Eh], 0
        mov eax, dword [gameopts]
        mov dword [byte ebp-012h], 0
        mov dword [byte ebp-016h], 0
        mov edx, dword [byte eax+01h]
        mov dword [byte ebp+03Ah], 0FFFFFFFFh
        and edx, 1F000h
        mov dword [byte ebp-01Ah], 0
        cmp edx, 1A000h
        jbe short .1
        and dword [byte eax+01h], 0FFFE0FFFh
.1:
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        and edx, 3E0000h
        cmp edx, 340000h
        jbe short .2
        and byte [byte eax+03h], 0C1h
.2:
        mov eax, dword [gameopts]
        mov ebx, dword [byte eax+01h]
        mov edx, dword [byte eax+01h]
        shl ebx, 0Fh
        shl edx, 0Ah
        shr ebx, 1Bh
        shr edx, 1Bh
        cmp ebx, edx
        jne short .3
        inc edx
        and edx, byte 1Fh
        and byte [byte eax+03h], 0C1h
        shl edx, 11h
        or dword [byte eax+01h], edx
.3:
        cmp dword [dword ebp-036CAh], byte 0
        je short .6
        mov edx, dword [byte ebp-01Ah]
        xor ebx, ebx
        xor eax, eax
        shl edx, 2
.4:
        movsx ecx, byte [dword eax+SeasonUserSlot]
        cmp ecx, byte 1
        jne short .5
        movsx ecx, byte [dword eax+SeasonUsers+1Ah]
        cmp ecx, byte 0FFFFFFFFh
        jne short .5
        cmp byte [dword eax+SeasonUsers+1Bh], 0
        jne short .5
        add edx, byte 4
        inc dword [byte ebp-01Ah]
        mov dword [dword edx+ebp-0C2h], ebx
.5:
        inc ebx
        add eax, byte 1Ah
        cmp ebx, byte 1Ah
        jge short .8
        jmp short .4
.6:
        xor edx, edx
        xor eax, eax
.7:
        inc dword [byte ebp-01Ah]
        mov dword [dword eax+ebp-0BEh], edx
        inc edx
        add eax, byte 4
        cmp edx, byte 1Bh
        jl short .7
.8:
        lea edx, [dword ebp-036BAh]
        mov eax, 30h
        call InitMenuItems
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
        xor eax, eax
        call GetLangText
        xor eax, eax
        call GetLangText
        mov dword [byte ebp-02Ah], eax
        mov eax, 1
        call GetLangText
        mov dword [byte ebp-026h], eax
        cmp dword [dword ebp-036C6h], byte 0
        jne near .13
        cmp dword [dword ebp-036C2h], 3E8h
        jge short .9
        call LoadExhibitionStats
        jmp short .10
.9:
        mov eax, dword [dword ebp-036C2h]
        call LoadSeasonStats
.10:
        mov edx, 2
        lea eax, [byte ebp-052h]
        xor ebx, ebx
        call MakeDirPath
        mov edx, str_FREEAGNTDB
        lea eax, [byte ebp-052h]
        call strcat_
        lea eax, [byte ebp-052h]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        je short .11
        push byte 0
        lea eax, [byte ebp-052h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [RosterBackFile], eax
        jmp short .13
.11:
        push eax
        push byte 70h
        push str_FreeAgents
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [RosterBackFile], eax
        xor eax, eax
.12:
        mov edx, dword [RosterBackFile]
        mov dword [edx+eax], 0FFFFFFFFh
        add eax, byte 4
        cmp eax, byte 70h
        jne short .12
.13:
        cmp dword [dword ebp-036CAh], byte 0
        je short .14
        mov eax, 13Dh
        jmp short .15
.14:
        mov eax, 108h
.15:
        xor edx, edx
        call LoadPackedFile
        mov dword [byte ebp+046h], eax
        push str_Pal26
        push dword [byte ebp+046h]
        mov esi, RosterTextBuf
        call FindShape
        add esp, byte 8
        lea edx, [byte eax+010h]
        mov ecx, 0C0h
        lea edi, [dword eax+0202h]
        rep movsb
        mov eax, edx
        call SetScreenColors
        lea eax, [dword ebp-033Eh]
        push eax
        push edx
        push byte 0
        push byte 0
        push dword 10000h
        mov dword [byte ebp+042h], edx
        call TintRows
        add esp, byte 14h
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        mov eax, 6
        call OpenScreen
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S33
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 1
        mov ebx, dword [byte ebp-01Ah]
        push byte 0
        lea edx, [dword ebp-031F2h]
        lea eax, [dword ebp-0476h]
        call InitVScrollBar
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S4
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 1
        mov ebx, dword [byte ebp-01Ah]
        push byte 0
        lea edx, [dword ebp-0305Ah]
        lea eax, [dword ebp-05AEh]
        call InitVScrollBar
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S12
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        mov ebx, 1Ch
        push byte 0
        lea edx, [dword ebp-02EC2h]
        lea eax, [dword ebp-081Eh]
        call InitVScrollBar
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S23
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        mov ebx, 1Ch
        push byte 0
        lea edx, [dword ebp-02D2Ah]
        lea eax, [dword ebp-06E6h]
        call InitVScrollBar
        cmp dword [dword ebp-036CAh], byte 0
        jne short .16
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        shl edx, 0Fh
        lea eax, [dword ebp-0476h]
        shr edx, 1Bh
        call SetScrollBarPos
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        shl edx, 0Ah
        lea eax, [dword ebp-05AEh]
        shr edx, 1Bh
        call SetScrollBarPos
        jmp short .21
.16:
        xor ecx, ecx
        xor ebx, ebx
.17:
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        shl edx, 0Fh
        shr edx, 1Bh
        cmp edx, dword [dword ebx+ebp-0BEh]
        jne short .18
        lea eax, [dword ebp-0476h]
        jmp short .19
.18:
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        cmp eax, dword [dword ebx+ebp-0BEh]
        jne short .20
        lea eax, [dword ebp-05AEh]
.19:
        mov edx, ecx
        call SetScrollBarPos
.20:
        inc ecx
        add ebx, byte 4
        cmp ecx, byte 1Ah
        jl short .17
.21:
        cmp dword [dword ebp-0452h], byte 0
        jne short .22
        cmp dword [dword ebp-058Ah], byte 0
        jne short .22
        mov edx, 1
        lea eax, [dword ebp-05AEh]
        call SetScrollBarPos
.22:
        lea eax, [dword ebp-081Eh]
        push eax
        lea eax, [dword ebp-033Eh]
        push eax
        mov eax, dword [dword ebp-0452h]
        lea ecx, [dword ebp-0E6Ah]
        mov ebx, dword [byte ebp+046h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        xor eax, eax
        call DrawRosterTeams
        lea eax, [dword ebp-06E6h]
        push eax
        lea eax, [dword ebp-033Eh]
        push eax
        mov eax, dword [dword ebp-058Ah]
        lea ecx, [dword ebp-01682h]
        mov ebx, dword [byte ebp+046h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        mov eax, 1
        call DrawRosterTeams
        lea eax, [dword ebp-0476h]
        call DrawScrollBar
        lea eax, [dword ebp-05AEh]
        lea edi, [dword ebp-036BAh]
        call DrawScrollBar
        lea eax, [dword ebp-081Eh]
        mov esi, TeamStatsBitmap
        call DrawScrollBar
        lea eax, [dword ebp-06E6h]
        mov ecx, 66h
        call DrawScrollBar
        rep movsb
        mov ecx, 66h
        lea edi, [dword ebp-03654h]
        mov esi, BottomBarArt+56h
        rep movsb
        cmp dword [dword ebp-036CAh], byte 0
        jne near .23
        push str_Fre1
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push str_Fre2
        push dword [byte ebp+046h]
        mov dword [dword ebp-0356Eh], eax
        call FindShape
        add esp, byte 8
        push str_Fre3
        push dword [byte ebp+046h]
        mov dword [dword ebp-0356Ah], eax
        call FindShape
        add esp, byte 8
        push str_Fre1
        push dword [byte ebp+046h]
        mov dword [dword ebp-03566h], eax
        call FindShape
        add esp, byte 8
        push str_Fre1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-03562h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0355Eh], eax
        mov eax, dword [dword ebp-03562h]
        add eax, byte 28h
        add esp, byte 8
        mov dword [dword ebp-0354Eh], eax
        mov eax, dword [dword ebp-0355Eh]
        mov dword [dword ebp-03578h], 6
        add eax, byte 0Ah
        push str_Cre1
        mov dword [dword ebp-0354Ah], eax
        lea eax, [dword ebp-0A5Eh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-03574h], eax
        call FindShape
        add esp, byte 8
        push str_Cre2
        push dword [byte ebp+046h]
        mov dword [dword ebp-03508h], eax
        call FindShape
        add esp, byte 8
        push str_Cre3
        push dword [byte ebp+046h]
        mov dword [dword ebp-03504h], eax
        call FindShape
        add esp, byte 8
        push str_Cre1
        push dword [byte ebp+046h]
        mov dword [dword ebp-03500h], eax
        call FindShape
        add esp, byte 8
        push str_Cre1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-034FCh], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-034F8h], eax
        mov eax, dword [dword ebp-034FCh]
        add eax, byte 28h
        mov dword [dword ebp-034E8h], eax
        mov eax, dword [dword ebp-034F8h]
        add eax, byte 0Ah
        add esp, byte 8
        mov dword [dword ebp-034E4h], eax
        push str_Arl1
        mov dword [dword ebp-03512h], 6
        lea eax, [dword ebp-0A1Eh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-0350Eh], eax
        call FindShape
        add esp, byte 8
        push str_Arl2
        push dword [byte ebp+046h]
        mov dword [dword ebp-034A2h], eax
        call FindShape
        add esp, byte 8
        push str_Arl3
        push dword [byte ebp+046h]
        mov dword [dword ebp-0349Eh], eax
        call FindShape
        add esp, byte 8
        push str_Arl1
        push dword [byte ebp+046h]
        mov dword [dword ebp-0349Ah], eax
        call FindShape
        add esp, byte 8
        push str_Arl1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-03496h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-03492h], eax
        mov eax, dword [dword ebp-03496h]
        add eax, byte 0Ah
        add esp, byte 8
        mov dword [dword ebp-03482h], eax
        mov eax, dword [dword ebp-03492h]
        mov dword [dword ebp-034ACh], 3
        add eax, byte 23h
        push str_Arr1
        mov dword [dword ebp-0347Eh], eax
        lea eax, [dword ebp-095Eh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-034A8h], eax
        call FindShape
        add esp, byte 8
        push str_Arr2
        push dword [byte ebp+046h]
        mov dword [dword ebp-0343Ch], eax
        call FindShape
        add esp, byte 8
        push str_Arr3
        push dword [byte ebp+046h]
        mov dword [dword ebp-03438h], eax
        call FindShape
        add esp, byte 8
        push str_Arr1
        push dword [byte ebp+046h]
        mov dword [dword ebp-03434h], eax
        call FindShape
        add esp, byte 8
        push str_Arr1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-03430h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0342Ch], eax
        mov eax, dword [dword ebp-03430h]
        add eax, byte 32h
        mov dword [dword ebp-0341Ch], eax
        mov eax, dword [dword ebp-0342Ch]
        add eax, byte 1Eh
        add esp, byte 8
        mov dword [dword ebp-03418h], eax
        lea eax, [dword ebp-099Eh]
        mov dword [dword ebp-03446h], 3
        mov dword [dword ebp-03442h], eax
.23:
        push str_Tra12
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push str_Tra22
        push dword [byte ebp+046h]
        mov dword [dword ebp-033D6h], eax
        call FindShape
        add esp, byte 8
        push str_Tra32
        push dword [byte ebp+046h]
        mov dword [dword ebp-033D2h], eax
        call FindShape
        add esp, byte 8
        push str_Tra12
        push dword [byte ebp+046h]
        mov dword [dword ebp-033CEh], eax
        call FindShape
        add esp, byte 8
        push str_Tra12
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-033CAh], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-033C6h], eax
        mov eax, dword [dword ebp-033CAh]
        add eax, byte 28h
        add esp, byte 8
        mov dword [dword ebp-033B6h], eax
        mov eax, dword [dword ebp-033C6h]
        mov dword [dword ebp-033E0h], 6
        add eax, byte 0Ah
        push str_Com1
        mov dword [dword ebp-033B2h], eax
        lea eax, [dword ebp-09DEh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-033DCh], eax
        call FindShape
        add esp, byte 8
        push str_Com2
        push dword [byte ebp+046h]
        mov dword [dword ebp-03370h], eax
        call FindShape
        add esp, byte 8
        push str_Com3
        push dword [byte ebp+046h]
        mov dword [dword ebp-0336Ch], eax
        call FindShape
        add esp, byte 8
        push str_Com1
        push dword [byte ebp+046h]
        mov dword [dword ebp-03368h], eax
        call FindShape
        add esp, byte 8
        push str_Com1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-03364h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-03360h], eax
        mov eax, dword [dword ebp-03364h]
        add eax, byte 28h
        mov dword [dword ebp-03350h], eax
        mov eax, dword [dword ebp-03360h]
        add esp, byte 8
        add eax, byte 0Ah
        mov dword [dword ebp-0337Ah], 6
        mov dword [dword ebp-0334Ch], eax
        cmp dword [dword ebp-036CAh], byte 0
        jne short .24
        lea eax, [dword ebp-091Eh]
        jmp short .25
.24:
        lea eax, [dword ebp-013Eh]
.25:
        mov dword [dword ebp-03376h], eax
        jne near .26
        push str_Def1
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push str_Def2
        push dword [byte ebp+046h]
        mov dword [dword ebp-0330Ah], eax
        call FindShape
        add esp, byte 8
        push str_Def3
        push dword [byte ebp+046h]
        mov dword [dword ebp-03306h], eax
        call FindShape
        add esp, byte 8
        push str_Def1
        push dword [byte ebp+046h]
        mov dword [dword ebp-03302h], eax
        call FindShape
        add esp, byte 8
        push str_Def1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-032FEh], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-032FAh], eax
        mov eax, dword [dword ebp-032FEh]
        add eax, byte 28h
        mov dword [dword ebp-032EAh], eax
        mov eax, dword [dword ebp-032FAh]
        add eax, byte 0Ah
        add esp, byte 8
        mov dword [dword ebp-032E6h], eax
        lea eax, [dword ebp-08DEh]
        mov dword [dword ebp-03314h], 6
        mov dword [dword ebp-03310h], eax
.26:
        push str_El11
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push str_El12
        push dword [byte ebp+046h]
        mov dword [dword ebp-032A4h], eax
        call FindShape
        add esp, byte 8
        push str_El13
        push dword [byte ebp+046h]
        mov dword [dword ebp-032A0h], eax
        call FindShape
        add esp, byte 8
        push str_El11
        push dword [byte ebp+046h]
        mov dword [dword ebp-0329Ch], eax
        call FindShape
        add esp, byte 8
        push str_El11
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-03298h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-03294h], eax
        mov eax, dword [dword ebp-03298h]
        add eax, byte 28h
        mov dword [dword ebp-03284h], eax
        mov eax, dword [dword ebp-03294h]
        add esp, byte 8
        add eax, byte 0Ah
        mov dword [dword ebp-032AEh], 6
        mov dword [dword ebp-03280h], eax
        cmp dword [dword ebp-036CAh], byte 0
        jne short .27
        lea eax, [dword ebp-089Eh]
        jmp short .28
.27:
        lea eax, [dword ebp-017Eh]
.28:
        mov dword [dword ebp-032AAh], eax
        push str_El21
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push str_El22
        push dword [byte ebp+046h]
        mov dword [dword ebp-0323Eh], eax
        call FindShape
        add esp, byte 8
        push str_El23
        push dword [byte ebp+046h]
        mov dword [dword ebp-0323Ah], eax
        call FindShape
        add esp, byte 8
        push str_El21
        push dword [byte ebp+046h]
        mov dword [dword ebp-03236h], eax
        call FindShape
        add esp, byte 8
        push str_El21
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-03232h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0322Eh], eax
        mov eax, dword [dword ebp-03232h]
        add eax, byte 28h
        mov dword [dword ebp-0321Eh], eax
        mov eax, dword [dword ebp-0322Eh]
        add esp, byte 8
        add eax, byte 0Ah
        mov dword [dword ebp-03248h], 6
        mov dword [dword ebp-0321Ah], eax
        cmp dword [dword ebp-036CAh], byte 0
        jne short .29
        lea eax, [dword ebp-085Eh]
        jmp short .30
.29:
        lea eax, [dword ebp-0FEh]
.30:
        mov dword [dword ebp-03244h], eax
        push str_S3up2
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push str_S3ug2
        push dword [byte ebp+046h]
        mov dword [dword ebp-031D8h], eax
        call FindShape
        add esp, byte 8
        push str_S3up2
        push dword [byte ebp+046h]
        mov dword [dword ebp-031D4h], eax
        call FindShape
        add esp, byte 8
        push str_S3up2
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-031CCh], eax
        call FindShape
        add esp, byte 8
        push str_S3dw2
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-031C8h], eax
        call FindShape
        add esp, byte 8
        push str_S3dg2
        push dword [byte ebp+046h]
        mov dword [dword ebp-030A6h], eax
        call FindShape
        add esp, byte 8
        push str_S3dw2
        push dword [byte ebp+046h]
        mov dword [dword ebp-030A2h], eax
        call FindShape
        add esp, byte 8
        push str_S3dw2
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-0309Ah], eax
        call FindShape
        add esp, byte 8
        push str_S4up
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-03096h], eax
        call FindShape
        add esp, byte 8
        push str_S4ug
        push dword [byte ebp+046h]
        mov dword [dword ebp-03040h], eax
        call FindShape
        add esp, byte 8
        push str_S4up
        push dword [byte ebp+046h]
        mov dword [dword ebp-0303Ch], eax
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        mov dword [dword ebp-03034h], eax
        push str_S4up
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push str_S4dw
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-03030h], eax
        call FindShape
        add esp, byte 8
        push str_S4dg
        push dword [byte ebp+046h]
        mov dword [dword ebp-02F0Eh], eax
        call FindShape
        add esp, byte 8
        push str_S4dw
        push dword [byte ebp+046h]
        mov dword [dword ebp-02F0Ah], eax
        call FindShape
        add esp, byte 8
        push str_S4dw
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-02F02h], eax
        call FindShape
        add esp, byte 8
        push str_S1up2
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-02EFEh], eax
        call FindShape
        add esp, byte 8
        push str_S1ug2
        push dword [byte ebp+046h]
        mov dword [dword ebp-02EA8h], eax
        call FindShape
        add esp, byte 8
        push str_S1up2
        push dword [byte ebp+046h]
        mov dword [dword ebp-02EA4h], eax
        call FindShape
        add esp, byte 8
        push str_S1up2
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-02E9Ch], eax
        call FindShape
        add esp, byte 8
        push str_S1dw2
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-02E98h], eax
        call FindShape
        add esp, byte 8
        push str_S1dg2
        push dword [byte ebp+046h]
        mov dword [dword ebp-02D76h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-02D72h], eax
        push str_S1dw2
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push str_S1dw2
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-02D6Ah], eax
        call FindShape
        add esp, byte 8
        push str_S2up2
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-02D66h], eax
        call FindShape
        add esp, byte 8
        push str_S2ug2
        push dword [byte ebp+046h]
        mov dword [dword ebp-02D10h], eax
        call FindShape
        add esp, byte 8
        push str_S2up2
        push dword [byte ebp+046h]
        mov dword [dword ebp-02D0Ch], eax
        call FindShape
        add esp, byte 8
        push str_S2up2
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-02D04h], eax
        call FindShape
        add esp, byte 8
        push str_S2dw2
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp+046h]
        mov dword [dword ebp-02D00h], eax
        call FindShape
        add esp, byte 8
        push str_S2dg2
        push dword [byte ebp+046h]
        mov dword [dword ebp-02BDEh], eax
        call FindShape
        add esp, byte 8
        push str_S2dw2
        push dword [byte ebp+046h]
        mov dword [dword ebp-02BDAh], eax
        call FindShape
        add esp, byte 8
        xor edi, edi
        push str_S2dw2
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+046h]
        mov dword [dword ebp-02BD2h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp+062h], edi
        mov dword [dword ebp-02BCEh], eax
        lea eax, [dword ebp-0239Ah]
        add esp, byte 8
        mov dword [byte ebp+066h], eax
.31:
        mov ebx, edi
        lea eax, [byte edi+01h]
        imul eax, byte 14h
        add eax, 0DCh
        mov dword [byte ebp+056h], eax
        imul eax, edi, byte 14h
        mov ecx, dword [byte ebp+062h]
        xor esi, esi
        add eax, 0DCh
        shl ebx, 7
        mov dword [byte ebp+05Ah], eax
        mov eax, dword [byte ebp+066h]
        add ecx, 0B28h
        mov dword [byte ebp+05Eh], eax
.32:
        test esi, esi
        jne short .33
        mov eax, 50h
        jmp short .34
.33:
        mov eax, 1AEh
.34:
        mov dword [dword ebx+ebp-0239Ah], eax
        mov eax, dword [byte ebp+05Ah]
        mov dword [dword ebx+ebp-02396h], eax
        jne short .35
        mov eax, 50h
        jmp short .36
.35:
        mov eax, 1AEh
.36:
        add eax, 0A0h
        mov dword [dword ebx+ebp-02392h], eax
        mov eax, dword [byte ebp+05Ah]
        mov dword [dword ebx+ebp-0238Eh], eax
        test esi, esi
        jne short .37
        mov eax, 50h
        jmp short .38
.37:
        mov eax, 1AEh
.38:
        add eax, 0A0h
        mov dword [dword ebx+ebp-0238Ah], eax
        mov eax, dword [byte ebp+056h]
        mov dword [dword ebx+ebp-02386h], eax
        test esi, esi
        jne short .39
        mov eax, 50h
        jmp short .40
.39:
        mov eax, 1AEh
.40:
        mov dword [dword ebx+ebp-02382h], eax
        mov eax, dword [byte ebp+056h]
        mov dword [dword ebx+ebp-0237Eh], eax
        mov eax, dword [byte ebp+05Eh]
        mov dword [dword ecx+ebp-036A6h], eax
        mov eax, dword [dword ebx+ebp-0239Ah]
        add eax, dword [dword ebx+ebp-02392h]
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov dword [dword ecx+ebp-03680h], eax
        mov eax, dword [dword ebx+ebp-02396h]
        add eax, dword [dword ebx+ebp-02386h]
        cdq
        LD sub, eax, edx
        sar eax, 1
        add ecx, 3FCh
        add ebx, byte 40h
        inc esi
        mov dword [dword ecx+ebp-03AA6h], 4
        add dword [byte ebp+05Eh], byte 40h
        mov dword [dword ecx+ebp-03A78h], eax
        cmp esi, byte 2
        jl near .32
        add dword [byte ebp+062h], byte 66h
        inc edi
        add dword [byte ebp+066h], 80h
        cmp edi, byte 0Ah
        jl near .31
        mov ebx, 3
        mov edx, dword [byte ebp+042h]
        xor eax, eax
        call FadePalette
        cmp dword [RatingsGoalieShown], byte 0FFFFFFFFh
        je near .64
        xor edx, edx
        xor eax, eax
.41:
        cmp edx, dword [RatingsGoalieShown]
        sete bl
        mov byte [dword eax+ebp-0E46h], bl
        cmp edx, dword [RatingsSkaterShown]
        sete bl
        add eax, byte 25h
        inc edx
        mov byte [dword eax+ebp-01683h], bl
        cmp edx, byte 1Ch
        jl short .41
        mov eax, dword [dword ebp-0452h]
        lea ebx, [byte ebp+032h]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        sete al
        lea edx, [byte ebp+036h]
        movzx ecx, al
        lea eax, [dword ebp-0E6Ah]
        call CountRosterSlots
        mov eax, dword [dword ebp-058Ah]
        lea ebx, [byte ebp+01Ah]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        sete al
        lea edx, [byte ebp+01Eh]
        movzx ecx, al
        lea eax, [dword ebp-01682h]
        call CountRosterSlots
        lea eax, [byte ebp-016h]
        push eax
        lea eax, [byte ebp-0Eh]
        push eax
        lea eax, [byte ebp-02h]
        push eax
        lea eax, [byte ebp-06h]
        lea ecx, [byte ebp+0Eh]
        push eax
        lea eax, [byte ebp+0Ah]
        lea ebx, [byte ebp+012h]
        push eax
        lea edx, [byte ebp+016h]
        lea eax, [dword ebp-01682h]
        call RosterSlotStatus
        lea eax, [byte ebp-012h]
        push eax
        lea eax, [byte ebp-0Ah]
        push eax
        lea eax, [byte ebp+06h]
        push eax
        lea eax, [byte ebp+02h]
        lea ecx, [byte ebp+026h]
        push eax
        lea eax, [byte ebp+022h]
        lea ebx, [byte ebp+02Ah]
        push eax
        lea edx, [byte ebp+02Eh]
        lea eax, [dword ebp-0E6Ah]
        call RosterSlotStatus
        mov eax, dword [dword ebp-0452h]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        jne short .42
        mov dword [byte ebp+02h], 3
        mov dword [byte ebp+06h], 12h
        mov dword [byte ebp-0Ah], 19h
        mov dword [byte ebp-012h], 19h
.42:
        mov eax, dword [dword ebp-058Ah]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        jne short .43
        mov dword [byte ebp-06h], 3
        mov dword [byte ebp-02h], 12h
        mov dword [byte ebp-0Eh], 19h
        mov dword [byte ebp-016h], 19h
.43:
        mov eax, dword [byte ebp+02Eh]
        add eax, dword [byte ebp+02Ah]
        je short .44
        mov eax, dword [byte ebp+016h]
        add eax, dword [byte ebp+012h]
        jne short .45
.44:
        mov eax, 5
        xor edx, edx
        jmp short .48
.45:
        mov edx, dword [byte ebp+06h]
        mov eax, dword [dword ebp-0452h]
        add edx, dword [byte ebp+012h]
        shl eax, 2
        cmp edx, byte 12h
        jge short .46
        mov edx, dword [dword eax+ebp-0BEh]
        mov eax, 2
        jmp short .48
.46:
        mov ebx, dword [byte ebp-02h]
        mov edx, dword [dword ebp-058Ah]
        add ebx, dword [byte ebp+02Ah]
        shl edx, 2
        cmp ebx, byte 12h
        jge short .49
        mov eax, 2
.47:
        mov edx, dword [dword edx+ebp-0BEh]
.48:
        call ConfirmTrade
        jmp near .63
.49:
        mov ebx, dword [byte ebp+02h]
        add ebx, dword [byte ebp+016h]
        cmp ebx, byte 2
        jge short .51
        mov edx, dword [dword eax+ebp-0BEh]
.50:
        xor eax, eax
        jmp short .48
.51:
        mov ebx, dword [byte ebp-06h]
        add ebx, dword [byte ebp+02Eh]
        cmp ebx, byte 2
        jge short .52
        mov edx, dword [dword edx+ebp-0BEh]
        jmp short .50
.52:
        mov ebx, dword [byte ebp+036h]
        add ebx, dword [byte ebp+02Eh]
        cmp ebx, dword [byte ebp+016h]
        jge short .53
        mov edx, dword [dword eax+ebp-0BEh]
        mov eax, 1
        jmp short .48
.53:
        mov ebx, dword [byte ebp+01Eh]
        add ebx, dword [byte ebp+016h]
        cmp ebx, dword [byte ebp+02Eh]
        jge short .54
        mov eax, 1
        jmp short .47
.54:
        mov ebx, dword [byte ebp+032h]
        add ebx, dword [byte ebp+02Ah]
        cmp ebx, dword [byte ebp+012h]
        jge short .55
        mov edx, dword [dword eax+ebp-0BEh]
        mov eax, 3
        jmp short .48
.55:
        mov ebx, dword [byte ebp+01Ah]
        add ebx, dword [byte ebp+012h]
        cmp ebx, dword [byte ebp+02Ah]
        jge short .56
        mov eax, 3
        jmp near .47
.56:
        mov ebx, dword [byte ebp-0Ah]
        add ebx, dword [byte ebp+0Eh]
        cmp ebx, byte 0Ch
        jge short .57
        mov edx, dword [dword eax+ebp-0BEh]
        mov eax, 6
        jmp near .48
.57:
        mov ebx, dword [byte ebp-0Eh]
        add ebx, dword [byte ebp+026h]
        cmp ebx, byte 0Ch
        jge short .58
        mov eax, 6
        jmp near .47
.58:
        mov ebx, dword [byte ebp-012h]
        add ebx, dword [byte ebp+0Ah]
        cmp ebx, byte 6
        jge short .59
        mov edx, dword [dword eax+ebp-0BEh]
        mov eax, 7
        jmp near .48
.59:
        mov eax, dword [byte ebp-016h]
        add eax, dword [byte ebp+022h]
        cmp eax, byte 6
        jge short .60
        mov eax, 7
        jmp near .47
.60:
        lea edx, [dword ebp-0E6Ah]
        lea eax, [dword ebp-01276h]
        mov dword [RosterFirstRun], 0
        call FindRosterSlot
        lea edx, [dword ebp-01682h]
        lea eax, [dword ebp-01A8Eh]
        call FindRosterSlot
        mov eax, dword [dword ebp-0452h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        lea eax, [dword ebp-0E6Ah]
        call ValidateRoster
        mov eax, dword [dword ebp-058Ah]
        mov edx, dword [dword ebp+eax*4-0BEh]
        lea eax, [dword ebp-01682h]
        call ValidateRoster
        mov eax, dword [dword ebp-0452h]
        mov ecx, 3
        mov ebx, dword [byte ebp+012h]
        push dword [dword ebp+eax*4-0BEh]
        mov eax, 19h
        lea edx, [dword ebp-01A8Eh]
        sub eax, dword [byte ebp+032h]
        sub ecx, dword [byte ebp+036h]
        sub eax, dword [byte ebp+02Ah]
        sub ecx, dword [byte ebp+02Eh]
        push eax
        add ebx, dword [byte ebp+016h]
        lea eax, [dword ebp-0E6Ah]
        call ListRosterPlayers
        mov eax, dword [dword ebp-058Ah]
        mov ecx, 3
        mov ebx, dword [byte ebp+02Ah]
        push dword [dword ebp+eax*4-0BEh]
        mov eax, 19h
        lea edx, [dword ebp-01276h]
        sub eax, dword [byte ebp+01Ah]
        sub ecx, dword [byte ebp+01Eh]
        sub eax, dword [byte ebp+012h]
        add ebx, dword [byte ebp+02Eh]
        push eax
        sub ecx, dword [byte ebp+016h]
        lea eax, [dword ebp-01682h]
        call ListRosterPlayers
        mov eax, dword [dword ebp-0452h]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call ResetTeamLines
        mov eax, dword [dword ebp-058Ah]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call ResetTeamLines
        mov eax, dword [dword ebp-0452h]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        je short .61
        lea eax, [dword ebp-0E6Ah]
        call EditPlayerName
.61:
        mov eax, dword [dword ebp-058Ah]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        je short .62
        lea eax, [dword ebp-01682h]
        call EditPlayerName
.62:
        mov eax, dword [dword ebp-0452h]
        lea edx, [dword ebp-0E6Ah]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call FormatRosterLine
        mov esi, eax
        lea eax, [dword ebp-081Eh]
        call FreeScrollBar
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S12
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        lea edx, [dword ebp-02EC2h]
        push byte 0
        mov ebx, esi
        lea eax, [dword ebp-081Eh]
        call InitVScrollBar
        lea eax, [dword ebp-081Eh]
        call DrawScrollBar
        mov eax, dword [dword ebp-058Ah]
        lea edx, [dword ebp-01682h]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call FormatRosterLine
        mov esi, eax
        lea eax, [dword ebp-06E6h]
        call FreeScrollBar
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S23
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        lea edx, [dword ebp-02D2Ah]
        push byte 0
        mov ebx, esi
        lea eax, [dword ebp-06E6h]
        call InitVScrollBar
        lea eax, [dword ebp-06E6h]
        mov ecx, dword [byte ebp+046h]
        call DrawScrollBar
        lea eax, [dword ebp-033Eh]
        lea edx, [dword ebp-0E6Ah]
        push eax
        mov ebx, dword [dword ebp-07FAh]
        xor eax, eax
        call DrawRosterPlayerInfo
        lea eax, [dword ebp-033Eh]
        mov ecx, dword [byte ebp+046h]
        mov ebx, dword [dword ebp-06C2h]
        push eax
        lea edx, [dword ebp-01682h]
        mov eax, 1
        call DrawRosterPlayerInfo
.63:
        mov dword [RatingsGoalieShown], 0FFFFFFFFh
        mov dword [RatingsSkaterShown], 0FFFFFFFFh
.64:
        lea eax, [dword ebp-036BAh]
        lea edx, [dword ebp-023Eh]
        lea ebx, [byte eax+042h]
        lea eax, [dword edx+0C0h]
        mov dword [byte ebp+06Ah], eax
.65:
        mov ecx, 4
        mov esi, edx
        mov edi, ebx
        rep movsb
        add edx, byte 4
        add ebx, byte 66h
        cmp edx, dword [byte ebp+06Ah]
        jne short .65
        mov eax, dword [byte ebp-01Ah]
        dec eax
        mov dword [byte ebp+052h], eax
        mov eax, RosterRecords
        add eax, 690h
        mov dword [byte ebp+07Eh], eax
        jmp near .129
.66:
        cmp dword [byte ebp+03Eh], byte 0Ah
        jb near .168
        jbe near .172
        mov eax, dword [dword ebp-058Ah]
        jmp near .173
.67:
        cmp dword [byte ebp+03Eh], byte 4
        jb short .68
        jbe near .102
        cmp dword [byte ebp+03Eh], byte 6
        jb near .103
        jbe near .131
        jmp near .135
.68:
        cmp dword [byte ebp+03Eh], byte 1
        jb short .69
        jbe short .71
        cmp dword [byte ebp+03Eh], byte 3
        je near .80
        jmp near .130
.69:
        cmp dword [byte ebp+03Eh], byte 0
        jne near .130
        cmp dword [RosterFirstRun], byte 0
        jne short .70
        push byte 2
        push byte 1
        push dword 0F0h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp-02Ah]
        push byte 0
        mov eax, 1FDh
        mov edx, 2
        call GetLangText
        call MessageBox
        test eax, eax
        jne near .129
.70:
        call SlideInSideBar
        mov eax, dword [dword ebp-036BEh]
        push dword [RosterBackFile]
        mov dword [byte ebp+03Ah], eax
        call FreeMemBlock
        add esp, byte 4
        jmp near .129
.71:
        xor edx, edx
        imul edx, dword 31Bh
.72:
        mov eax, dword [statsplayoffs]
        add eax, edx
        lea esi, [dword eax+0D3h]
        mov ecx, 30h
        lea edi, [dword eax+0111h]
        add edx, 31Bh
        rep movsb
        cmp edx, 50BEh
        jne short .72
        cmp dword [dword ebp-036CAh], byte 0
        jne short .73
        mov edx, 3
        lea eax, [byte ebp-052h]
        call MakeDataPath
        jmp short .74
.73:
        lea eax, [byte ebp-052h]
        mov edx, dword [PlayoffTreeData]
        xor ebx, ebx
        call MakeSeasonDbPath
.74:
        push dword [TeamDbSize]
        push dword [TeamDb]
        lea eax, [byte ebp-052h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        cmp dword [dword ebp-036CAh], byte 0
        jne short .75
        mov edx, 7
        lea eax, [byte ebp-052h]
        call MakeDataPath
        jmp short .76
.75:
        mov ebx, 4
        lea eax, [byte ebp-052h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
.76:
        push dword [PlayoffStatsSize]
        push dword [statsplayoffs]
        lea eax, [byte ebp-052h]
        push eax
        call SaveFileBlock
        mov edx, 2
        add esp, byte 0Ch
        lea eax, [byte ebp-052h]
        xor ebx, ebx
        call MakeDirPath
        mov edx, str_FREEAGNTDB
        lea eax, [byte ebp-052h]
        call strcat_
        lea eax, [byte ebp-052h]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        je short .78
        cmp dword [dword ebp-036CAh], byte 0
        jne short .78
.77:
        push byte 70h
        push dword [RosterBackFile]
        lea eax, [byte ebp-052h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        jmp short .79
.78:
        cmp dword [dword ebp-036CAh], byte 0
        je short .77
.79:
        push dword [RosterBackFile]
        call FreeMemBlock
        add esp, byte 4
        mov eax, dword [dword ebp-036BEh]
        mov dword [byte ebp+03Ah], eax
        call SlideInTitleBar
        call ComputeTeamRanks
        jmp near .129
.80:
        mov eax, dword [dword ebp-0452h]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        jne short .81
        mov dword [byte ebp+03Eh], 5
        jmp near .102
.81:
        mov eax, dword [dword ebp-058Ah]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        je near .101
        lea edx, [dword ebp-01E9Ah]
        mov eax, 1Ah
        mov ecx, 1
        lea ebx, [byte ebp+032h]
        call FormatRosterLine
        lea edx, [byte ebp+036h]
        lea eax, [dword ebp-01E9Ah]
        call CountRosterSlots
        lea eax, [byte ebp-012h]
        push eax
        lea eax, [byte ebp-0Ah]
        push eax
        lea eax, [byte ebp+06h]
        push eax
        lea eax, [byte ebp+02h]
        lea ecx, [byte ebp+026h]
        push eax
        lea eax, [byte ebp+022h]
        lea ebx, [byte ebp+02Ah]
        push eax
        lea edx, [byte ebp+02Eh]
        lea eax, [dword ebp-0E6Ah]
        call RosterSlotStatus
        lea eax, [byte ebp-016h]
        push eax
        lea eax, [byte ebp-0Eh]
        push eax
        lea eax, [byte ebp-02h]
        push eax
        lea eax, [byte ebp-06h]
        lea ecx, [byte ebp+0Eh]
        push eax
        lea eax, [byte ebp+0Ah]
        lea ebx, [byte ebp+012h]
        push eax
        lea edx, [byte ebp+016h]
        lea eax, [dword ebp-01682h]
        call RosterSlotStatus
        mov eax, dword [byte ebp+02Eh]
        add eax, dword [byte ebp+016h]
        add eax, dword [byte ebp+02Ah]
        add eax, dword [byte ebp+012h]
        jne short .82
        mov eax, dword [dword ebp-0452h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        jmp near .106
.82:
        cmp dword [byte ebp+06h], byte 12h
        jge short .85
        mov eax, dword [dword ebp-0452h]
.83:
        mov edx, dword [dword ebp+eax*4-0BEh]
.84:
        mov eax, 2
        jmp near .124
.85:
        cmp dword [byte ebp-02h], byte 12h
        jge short .86
        mov eax, dword [dword ebp-058Ah]
        jmp short .83
.86:
        cmp dword [byte ebp+02h], byte 2
        jge short .88
        mov eax, dword [dword ebp-0452h]
.87:
        mov edx, dword [dword ebp+eax*4-0BEh]
        jmp near .113
.88:
        cmp dword [byte ebp-06h], byte 2
        jge short .89
        mov eax, dword [dword ebp-058Ah]
        jmp short .87
.89:
        mov eax, dword [byte ebp+02Eh]
        add eax, dword [byte ebp+016h]
        cmp eax, dword [byte ebp+036h]
        jg short .90
        mov eax, dword [byte ebp+02Ah]
        add eax, dword [byte ebp+012h]
        cmp eax, dword [byte ebp+032h]
        jle short .92
.90:
        mov eax, 4
.91:
        xor edx, edx
        jmp near .124
.92:
        cmp dword [byte ebp-0Ah], byte 0Ch
        jge short .95
        mov eax, dword [dword ebp-0452h]
.93:
        mov edx, dword [dword ebp+eax*4-0BEh]
.94:
        mov eax, 6
        jmp near .124
.95:
        cmp dword [byte ebp-0Eh], byte 0Ch
        jge short .96
        mov eax, dword [dword ebp-058Ah]
        jmp short .93
.96:
        cmp dword [byte ebp-012h], byte 6
        jge short .99
        mov eax, dword [dword ebp-0452h]
.97:
        mov edx, dword [dword ebp+eax*4-0BEh]
.98:
        mov eax, 7
        jmp near .124
.99:
        cmp dword [byte ebp-016h], byte 6
        jge short .100
        mov eax, dword [dword ebp-058Ah]
        jmp short .97
.100:
        lea edx, [dword ebp-0E6Ah]
        lea eax, [dword ebp-01276h]
        mov dword [RosterFirstRun], 0
        call FindRosterSlot
        mov eax, dword [dword ebp-0452h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        lea eax, [dword ebp-0E6Ah]
        mov ecx, 0FFFFFFFFh
        call ValidateRoster
        push byte 1Ah
        mov ebx, dword [byte ebp+02Ah]
        lea edx, [dword ebp-01276h]
        push byte 0FFFFFFFFh
        lea eax, [dword ebp-01E9Ah]
        add ebx, dword [byte ebp+02Eh]
        call ListRosterPlayers
        lea edx, [dword ebp-01682h]
        lea eax, [dword ebp-01276h]
        call FindRosterSlot
        mov eax, dword [dword ebp-058Ah]
        mov edx, dword [dword ebp+eax*4-0BEh]
        lea eax, [dword ebp-01682h]
        mov ecx, 0FFFFFFFFh
        call ValidateRoster
        push byte 1Ah
        mov ebx, dword [byte ebp+012h]
        lea edx, [dword ebp-01276h]
        push byte 0FFFFFFFFh
        lea eax, [dword ebp-01E9Ah]
        add ebx, dword [byte ebp+016h]
        call ListRosterPlayers
        mov eax, dword [dword ebp-0452h]
        lea edx, [dword ebp-0E6Ah]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call FormatRosterLine
        mov esi, eax
        lea eax, [dword ebp-081Eh]
        call FreeScrollBar
        mov eax, str_Ball5
        push eax
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_S12
        push eax
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_Bkgd19
        push eax
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        lea edx, [dword ebp-02EC2h]
        push byte 0
        mov ebx, esi
        lea eax, [dword ebp-081Eh]
        call InitVScrollBar
        lea eax, [dword ebp-081Eh]
        call DrawScrollBar
        mov eax, dword [dword ebp-058Ah]
        lea edx, [dword ebp-01682h]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call FormatRosterLine
        mov esi, eax
        lea eax, [dword ebp-06E6h]
        call FreeScrollBar
        mov eax, str_Ball5
        push eax
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_S23
        push eax
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_Bkgd19
        push eax
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        lea edx, [dword ebp-02D2Ah]
        push byte 0
        mov ebx, esi
        lea eax, [dword ebp-06E6h]
        call InitVScrollBar
        lea eax, [dword ebp-06E6h]
        mov ecx, dword [byte ebp+046h]
        call DrawScrollBar
        lea eax, [dword ebp-033Eh]
        lea edx, [dword ebp-0E6Ah]
        push eax
        mov ebx, dword [dword ebp-07FAh]
        xor eax, eax
        call DrawRosterPlayerInfo
        lea eax, [dword ebp-033Eh]
        mov ecx, dword [byte ebp+046h]
        mov ebx, dword [dword ebp-06C2h]
        push eax
        lea edx, [dword ebp-01682h]
        mov eax, 1
        call DrawRosterPlayerInfo
        mov eax, dword [dword ebp-0452h]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call ResetTeamLines
        mov eax, dword [dword ebp-058Ah]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call ResetTeamLines
        jmp near .129
.101:
        mov dword [byte ebp+03Eh], 6
.102:
        cmp dword [byte ebp+03Eh], byte 4
        jne short .103
        mov eax, 1Ah
        xor edx, edx
        call FormatRosterLine
        cmp eax, byte 1Ch
        jge near .90
        mov dword [byte ebp+03Ah], 11h
        mov dword [RosterFirstRun], 0
        jmp near .129
.103:
        cmp dword [byte ebp+03Eh], byte 5
        jne near .131
        mov eax, dword [dword ebp-0452h]
        lea ebx, [byte ebp+032h]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        sete al
        lea edx, [byte ebp+036h]
        movzx ecx, al
        lea eax, [dword ebp-0E6Ah]
        call CountRosterSlots
        lea eax, [byte ebp-012h]
        push eax
        lea eax, [byte ebp-0Ah]
        push eax
        lea eax, [byte ebp+06h]
        push eax
        lea eax, [byte ebp+02h]
        lea ecx, [byte ebp+026h]
        push eax
        lea eax, [byte ebp+022h]
        lea ebx, [byte ebp+02Ah]
        push eax
        lea edx, [byte ebp+02Eh]
        lea eax, [dword ebp-01682h]
        call RosterSlotStatus
        mov eax, dword [dword ebp-058Ah]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        jne short .104
        mov dword [byte ebp+02h], 3
        mov dword [byte ebp+06h], 19h
        mov dword [byte ebp-0Ah], 19h
        mov dword [byte ebp-012h], 19h
.104:
        mov eax, dword [byte ebp+02Eh]
        add eax, dword [byte ebp+016h]
        mov edx, dword [byte ebp+012h]
        add eax, dword [byte ebp+02Ah]
        add edx, eax
        mov eax, dword [dword ebp-0452h]
        shl eax, 2
        test edx, edx
        jne short .107
.105:
        mov edx, dword [dword eax+ebp-0BEh]
.106:
        mov eax, 8
        jmp near .124
.107:
        cmp dword [dword ebp-0452h], byte 1Ah
        jne short .109
        mov edx, dword [byte ebp+02Ah]
        add edx, dword [byte ebp+02Eh]
        cmp edx, dword [byte ebp+036h]
        jl short .109
.108:
        mov edx, dword [dword eax+ebp-0BEh]
        jmp near .139
.109:
        mov edx, dword [dword ebp-058Ah]
        shl edx, 2
        cmp dword [byte ebp+06h], byte 12h
        jge short .111
.110:
        mov eax, 2
        jmp short .123
.111:
        cmp dword [byte ebp+02h], byte 2
        jge short .114
.112:
        mov edx, dword [dword edx+ebp-0BEh]
.113:
        xor eax, eax
        jmp short .124
.114:
        mov ebx, dword [dword ebp-0452h]
        mov eax, dword [byte ebp+02Eh]
        shl ebx, 2
        cmp eax, dword [byte ebp+036h]
        jle short .116
.115:
        mov eax, 1
        jmp short .118
.116:
        mov eax, dword [byte ebp+02Ah]
        cmp eax, dword [byte ebp+032h]
        jle short .119
.117:
        mov eax, 3
.118:
        mov edx, dword [dword ebx+ebp-0BEh]
        jmp short .124
.119:
        cmp dword [byte ebp-0Ah], byte 0Ch
        jge short .121
.120:
        mov eax, 6
        jmp short .123
.121:
        cmp dword [byte ebp-012h], byte 6
        jge short .125
.122:
        mov eax, 7
.123:
        mov edx, dword [dword edx+ebp-0BEh]
.124:
        call ConfirmTrade
        jmp near .129
.125:
        lea edx, [dword ebp-01682h]
        lea eax, [dword ebp-01276h]
        mov dword [RosterFirstRun], 0
        call FindRosterSlot
        mov eax, dword [dword ebp-058Ah]
        mov edx, dword [dword ebp+eax*4-0BEh]
        lea eax, [dword ebp-01682h]
        call ValidateRoster
        mov eax, dword [dword ebp-0452h]
        mov ecx, 3
        mov ebx, dword [byte ebp+02Ah]
        push dword [dword ebp+eax*4-0BEh]
        mov eax, 19h
        lea edx, [dword ebp-01276h]
        sub eax, dword [byte ebp+032h]
        sub ecx, dword [byte ebp+036h]
        push eax
        add ebx, dword [byte ebp+02Eh]
        lea eax, [dword ebp-0E6Ah]
        call ListRosterPlayers
        mov eax, dword [dword ebp-0452h]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call ResetTeamLines
        mov eax, dword [dword ebp-058Ah]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call ResetTeamLines
        mov eax, dword [dword ebp-0452h]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        je short .126
        lea eax, [dword ebp-0E6Ah]
        call EditPlayerName
.126:
        lea edx, [dword ebp-0E6Ah]
        mov eax, dword [dword ebp-0452h]
        call FormatRosterLine
        mov esi, eax
        lea eax, [dword ebp-081Eh]
        call FreeScrollBar
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S12
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        lea edx, [dword ebp-02EC2h]
        push byte 0
        mov ebx, esi
        lea eax, [dword ebp-081Eh]
        call InitVScrollBar
        lea eax, [dword ebp-081Eh]
        lea edx, [dword ebp-01682h]
        call DrawScrollBar
        mov eax, dword [dword ebp-058Ah]
.127:
        call FormatRosterLine
        mov esi, eax
        lea eax, [dword ebp-06E6h]
        call FreeScrollBar
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S23
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        lea edx, [dword ebp-02D2Ah]
        push byte 0
        mov ebx, esi
        lea eax, [dword ebp-06E6h]
        call InitVScrollBar
        lea eax, [dword ebp-06E6h]
        mov ecx, dword [byte ebp+046h]
        call DrawScrollBar
        lea eax, [dword ebp-033Eh]
        lea edx, [dword ebp-0E6Ah]
        push eax
        mov ebx, dword [dword ebp-07FAh]
        xor eax, eax
        call DrawRosterPlayerInfo
.128:
        lea eax, [dword ebp-033Eh]
        mov ecx, dword [byte ebp+046h]
        mov ebx, dword [dword ebp-06C2h]
        push eax
        lea edx, [dword ebp-01682h]
        mov eax, 1
        call DrawRosterPlayerInfo
.129:
        cmp dword [byte ebp+03Ah], byte 0FFFFFFFFh
        jne near .207
        push byte 3
        lea eax, [byte ebp+03Eh]
        mov ebx, 0FFFFFFFFh
        push byte 0
        lea edx, [dword ebp-036BAh]
        xor ecx, ecx
        push eax
        mov eax, 30h
        mov dword [byte ebp+03Eh], 0FFFFFFFFh
        call RunMenu
        cmp dword [byte ebp+03Eh], byte 8
        jb near .67
        jbe near .156
        cmp dword [byte ebp+03Eh], byte 0Ch
        jb near .66
        cmp dword [byte ebp+03Eh], byte 0Fh
        jbe near .175
        cmp dword [byte ebp+03Eh], byte 14h
        jb near .184
        cmp dword [byte ebp+03Eh], byte 17h
        jbe near .193
        cmp dword [byte ebp+03Eh], byte 1Bh
        jbe near .198
.130:
        cmp dword [byte ebp+03Eh], byte 1Bh
        jle near .205
        cmp dword [byte ebp+03Eh], byte 26h
        jge near .205
        mov eax, dword [byte ebp+03Eh]
        add eax, dword [dword ebp-07FAh]
        sub eax, byte 1Ch
        imul eax, byte 25h
        cmp byte [dword eax+ebp-0E46h], 0
        je near .203
        mov byte [dword eax+ebp-0E46h], 0
        jmp near .204
.131:
        mov eax, dword [dword ebp-058Ah]
        lea ebx, [byte ebp+032h]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        sete al
        lea edx, [byte ebp+036h]
        movzx ecx, al
        lea eax, [dword ebp-01682h]
        call CountRosterSlots
        lea eax, [byte ebp-012h]
        push eax
        lea eax, [byte ebp-0Ah]
        push eax
        lea eax, [byte ebp+06h]
        push eax
        lea eax, [byte ebp+02h]
        lea ecx, [byte ebp+026h]
        push eax
        lea eax, [byte ebp+022h]
        lea ebx, [byte ebp+02Ah]
        push eax
        lea edx, [byte ebp+02Eh]
        lea eax, [dword ebp-0E6Ah]
        call RosterSlotStatus
        cmp dword [dword ebp-0452h], byte 1Ah
        jne short .132
        mov dword [byte ebp+02h], 3
        mov dword [byte ebp+06h], 19h
        mov dword [byte ebp-0Ah], 19h
        mov dword [byte ebp-012h], 19h
.132:
        mov eax, dword [byte ebp+02Eh]
        add eax, dword [byte ebp+016h]
        mov edx, dword [byte ebp+012h]
        add eax, dword [byte ebp+02Ah]
        add edx, eax
        mov eax, dword [dword ebp-0452h]
        shl eax, 2
        test edx, edx
        je near .105
        cmp dword [dword ebp-058Ah], byte 1Ah
        jne short .133
        mov edx, dword [byte ebp+02Ah]
        add edx, dword [byte ebp+02Eh]
        cmp edx, dword [byte ebp+032h]
        jge near .108
.133:
        mov edx, dword [dword ebp-0452h]
        shl edx, 2
        cmp dword [byte ebp+06h], byte 12h
        jl near .110
        cmp dword [byte ebp+02h], byte 2
        jl near .112
        mov ebx, dword [dword ebp-058Ah]
        mov eax, dword [byte ebp+02Eh]
        shl ebx, 2
        cmp eax, dword [byte ebp+036h]
        jg near .115
        mov eax, dword [byte ebp+02Ah]
        cmp eax, dword [byte ebp+032h]
        jg near .117
        cmp dword [byte ebp-0Ah], byte 0Ch
        jl near .120
        cmp dword [byte ebp-012h], byte 6
        jl near .122
        lea edx, [dword ebp-0E6Ah]
        lea eax, [dword ebp-01276h]
        mov dword [RosterFirstRun], 0
        call FindRosterSlot
        mov eax, dword [dword ebp-0452h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        lea eax, [dword ebp-0E6Ah]
        call ValidateRoster
        mov eax, dword [dword ebp-058Ah]
        mov ecx, 3
        mov ebx, dword [byte ebp+02Ah]
        push dword [dword ebp+eax*4-0BEh]
        mov eax, 19h
        lea edx, [dword ebp-01276h]
        sub eax, dword [byte ebp+032h]
        sub ecx, dword [byte ebp+036h]
        push eax
        add ebx, dword [byte ebp+02Eh]
        lea eax, [dword ebp-01682h]
        call ListRosterPlayers
        mov eax, dword [dword ebp-0452h]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call ResetTeamLines
        mov eax, dword [dword ebp-058Ah]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call ResetTeamLines
        mov eax, dword [dword ebp-058Ah]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        je short .134
        lea eax, [dword ebp-01682h]
        call EditPlayerName
.134:
        lea edx, [dword ebp-0E6Ah]
        mov eax, dword [dword ebp-0452h]
        call FormatRosterLine
        mov esi, eax
        lea eax, [dword ebp-081Eh]
        call FreeScrollBar
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S12
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        lea edx, [dword ebp-02EC2h]
        push byte 0
        mov ebx, esi
        lea eax, [dword ebp-081Eh]
        call InitVScrollBar
        lea eax, [dword ebp-081Eh]
        call DrawScrollBar
        mov eax, dword [dword ebp-058Ah]
        lea edx, [dword ebp-01682h]
        mov eax, dword [dword ebp+eax*4-0BEh]
        jmp near .127
.135:
        mov eax, dword [dword ebp-0452h]
        lea ebx, [byte ebp+032h]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        sete al
        lea edx, [byte ebp+036h]
        movzx ecx, al
        lea eax, [dword ebp-0E6Ah]
        call CountRosterSlots
        mov eax, dword [dword ebp-058Ah]
        lea ebx, [byte ebp+01Ah]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        sete al
        lea edx, [byte ebp+01Eh]
        movzx ecx, al
        lea eax, [dword ebp-01682h]
        call CountRosterSlots
        lea eax, [byte ebp-016h]
        push eax
        lea eax, [byte ebp-0Eh]
        push eax
        lea eax, [byte ebp-02h]
        push eax
        lea eax, [byte ebp-06h]
        lea ecx, [byte ebp+0Eh]
        push eax
        lea eax, [byte ebp+0Ah]
        lea ebx, [byte ebp+012h]
        push eax
        lea edx, [byte ebp+016h]
        lea eax, [dword ebp-01682h]
        call RosterSlotStatus
        lea eax, [byte ebp-012h]
        push eax
        lea eax, [byte ebp-0Ah]
        push eax
        lea eax, [byte ebp+06h]
        push eax
        lea eax, [byte ebp+02h]
        lea ecx, [byte ebp+026h]
        push eax
        lea eax, [byte ebp+022h]
        lea ebx, [byte ebp+02Ah]
        push eax
        lea edx, [byte ebp+02Eh]
        lea eax, [dword ebp-0E6Ah]
        call RosterSlotStatus
        mov eax, dword [dword ebp-0452h]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        jne short .136
        mov dword [byte ebp+02h], 3
        mov dword [byte ebp+06h], 12h
        mov dword [byte ebp-0Ah], 19h
        mov dword [byte ebp-012h], 19h
.136:
        mov eax, dword [dword ebp-058Ah]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        jne short .137
        mov dword [byte ebp-06h], 3
        mov dword [byte ebp-02h], 12h
        mov dword [byte ebp-0Eh], 19h
        mov dword [byte ebp-016h], 19h
.137:
        cmp dword [dword ebp-0452h], byte 1Ah
        jne short .140
        mov eax, dword [byte ebp+036h]
        mov edx, dword [byte ebp+012h]
        add eax, dword [byte ebp+02Ah]
        add edx, dword [byte ebp+016h]
        add eax, dword [byte ebp+02Eh]
        cmp edx, eax
        jl short .140
        mov eax, dword [dword ebp-0452h]
.138:
        mov edx, dword [dword ebp+eax*4-0BEh]
.139:
        mov eax, 4
        jmp near .124
.140:
        cmp dword [dword ebp-058Ah], byte 1Ah
        jne short .141
        mov eax, dword [byte ebp+01Eh]
        mov edx, dword [byte ebp+02Ah]
        add eax, dword [byte ebp+02Ah]
        add edx, dword [byte ebp+02Eh]
        add eax, dword [byte ebp+02Eh]
        cmp edx, eax
        jl short .141
        mov eax, dword [dword ebp-058Ah]
        jmp short .138
.141:
        mov eax, dword [byte ebp+02Eh]
        add eax, dword [byte ebp+02Ah]
        je short .142
        mov eax, dword [byte ebp+016h]
        add eax, dword [byte ebp+012h]
        jne short .143
.142:
        mov eax, 5
        jmp near .91
.143:
        mov edx, dword [byte ebp+06h]
        mov eax, dword [dword ebp-0452h]
        add edx, dword [byte ebp+012h]
        shl eax, 2
        cmp edx, byte 12h
        jge short .144
        mov edx, dword [dword eax+ebp-0BEh]
        jmp near .84
.144:
        mov ebx, dword [byte ebp-02h]
        mov edx, dword [dword ebp-058Ah]
        add ebx, dword [byte ebp+02Ah]
        shl edx, 2
        cmp ebx, byte 12h
        jl near .110
        mov ebx, dword [byte ebp+02h]
        add ebx, dword [byte ebp+016h]
        cmp ebx, byte 2
        jge short .145
        mov edx, dword [dword eax+ebp-0BEh]
        jmp near .113
.145:
        mov ebx, dword [byte ebp-06h]
        add ebx, dword [byte ebp+02Eh]
        cmp ebx, byte 2
        jl near .112
        mov ebx, dword [byte ebp+036h]
        add ebx, dword [byte ebp+02Eh]
        cmp ebx, dword [byte ebp+016h]
        jge short .146
        mov edx, dword [dword eax+ebp-0BEh]
        mov eax, 1
        jmp near .124
.146:
        mov ebx, dword [byte ebp+01Eh]
        add ebx, dword [byte ebp+016h]
        cmp ebx, dword [byte ebp+02Eh]
        jge short .147
        mov eax, 1
        jmp near .123
.147:
        mov ebx, dword [byte ebp+032h]
        add ebx, dword [byte ebp+02Ah]
        cmp ebx, dword [byte ebp+012h]
        jge short .148
        mov edx, dword [dword eax+ebp-0BEh]
        mov eax, 3
        jmp near .124
.148:
        mov ebx, dword [byte ebp+01Ah]
        add ebx, dword [byte ebp+012h]
        cmp ebx, dword [byte ebp+02Ah]
        jge short .149
        mov eax, 3
        jmp near .123
.149:
        mov ebx, dword [byte ebp-0Ah]
        add ebx, dword [byte ebp+0Eh]
        cmp ebx, byte 0Ch
        jge short .150
        mov edx, dword [dword eax+ebp-0BEh]
        jmp near .94
.150:
        mov ebx, dword [byte ebp-0Eh]
        add ebx, dword [byte ebp+026h]
        cmp ebx, byte 0Ch
        jl near .120
        mov ebx, dword [byte ebp-012h]
        add ebx, dword [byte ebp+0Ah]
        cmp ebx, byte 6
        jge short .151
        mov edx, dword [dword eax+ebp-0BEh]
        jmp near .98
.151:
        mov eax, dword [byte ebp-016h]
        add eax, dword [byte ebp+022h]
        cmp eax, byte 6
        jl near .122
        lea edx, [dword ebp-0E6Ah]
        lea eax, [dword ebp-01276h]
        mov dword [RosterFirstRun], 0
        call FindRosterSlot
        lea edx, [dword ebp-01682h]
        lea eax, [dword ebp-01A8Eh]
        call FindRosterSlot
        mov eax, dword [dword ebp-0452h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        lea eax, [dword ebp-0E6Ah]
        call ValidateRoster
        mov eax, dword [dword ebp-058Ah]
        mov edx, dword [dword ebp+eax*4-0BEh]
        lea eax, [dword ebp-01682h]
        call ValidateRoster
        mov eax, dword [dword ebp-0452h]
        mov ecx, 3
        mov ebx, dword [byte ebp+012h]
        push dword [dword ebp+eax*4-0BEh]
        mov eax, 19h
        lea edx, [dword ebp-01A8Eh]
        sub eax, dword [byte ebp+032h]
        sub ecx, dword [byte ebp+036h]
        sub eax, dword [byte ebp+02Ah]
        sub ecx, dword [byte ebp+02Eh]
        push eax
        add ebx, dword [byte ebp+016h]
        lea eax, [dword ebp-0E6Ah]
        call ListRosterPlayers
        mov eax, dword [dword ebp-058Ah]
        mov ecx, 3
        mov ebx, dword [byte ebp+02Ah]
        push dword [dword ebp+eax*4-0BEh]
        mov eax, 19h
        lea edx, [dword ebp-01276h]
        sub eax, dword [byte ebp+01Ah]
        sub ecx, dword [byte ebp+01Eh]
        sub eax, dword [byte ebp+012h]
        add ebx, dword [byte ebp+02Eh]
        push eax
        sub ecx, dword [byte ebp+016h]
        lea eax, [dword ebp-01682h]
        call ListRosterPlayers
        mov eax, dword [dword ebp-0452h]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call ResetTeamLines
        mov eax, dword [dword ebp-058Ah]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call ResetTeamLines
        mov eax, dword [dword ebp-0452h]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        je short .152
        lea eax, [dword ebp-0E6Ah]
        call EditPlayerName
.152:
        mov eax, dword [dword ebp-058Ah]
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        je short .153
        lea eax, [dword ebp-01682h]
        call EditPlayerName
.153:
        mov eax, dword [dword ebp-0452h]
        lea edx, [dword ebp-0E6Ah]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call FormatRosterLine
        mov esi, eax
        lea eax, [dword ebp-081Eh]
        call FreeScrollBar
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S12
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        lea edx, [dword ebp-02EC2h]
        push byte 0
        mov ebx, esi
        lea eax, [dword ebp-081Eh]
        call InitVScrollBar
        lea eax, [dword ebp-081Eh]
        call DrawScrollBar
        mov eax, dword [dword ebp-058Ah]
        lea edx, [dword ebp-01682h]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call FormatRosterLine
        mov esi, eax
        lea eax, [dword ebp-06E6h]
        call FreeScrollBar
        push str_Ball5
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_S23
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        lea edx, [dword ebp-02D2Ah]
        push byte 0
        mov ebx, esi
        lea eax, [dword ebp-06E6h]
        call InitVScrollBar
        lea eax, [dword ebp-06E6h]
        mov ecx, dword [byte ebp+046h]
        call DrawScrollBar
        lea eax, [dword ebp-033Eh]
        lea edx, [dword ebp-0E6Ah]
        push eax
        mov ebx, dword [dword ebp-07FAh]
        xor eax, eax
        call DrawRosterPlayerInfo
        lea eax, [dword ebp-033Eh]
        mov ecx, dword [byte ebp+046h]
        mov ebx, dword [dword ebp-06C2h]
        lea edx, [dword ebp-01682h]
        push eax
        mov eax, 1
        mov edi, 4
        call DrawRosterPlayerInfo
.154:
        push edi
        push str_TraD
        lea eax, [byte ebp-022h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-022h]
        push eax
        push dword [byte ebp+046h]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.155:
        call TickDeadlinePassed
        test eax, eax
        je short .155
        inc edi
        cmp edi, byte 9
        jge near .129
        jmp short .154
.156:
        cmp dword [RosterPlayerIds], byte 0
        jne short .157
        push byte 0
        push dword 0E0h
        mov eax, str_RosterSort
        push eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [RosterPlayerIds], eax
.157:
        mov dword [byte ebp+072h], RosterRecords
        xor ebx, ebx
        xor edx, edx
        mov dword [byte ebp+06Eh], ebx
.158:
        mov eax, dword [RosterPlayerIds]
        mov dword [edx+eax], ebx
        mov eax, dword [byte ebp+06Eh]
        cmp dword [dword eax+ebp-0E4Ah], byte 0FFFFFFFFh
        je near .161
        mov esi, dword [TeamDb]
        add esi, dword [dword eax+ebp-0E4Ah]
        imul eax, ebx, byte 3Ch
        mov ecx, 3Ch
        mov edi, dword [byte ebp+072h]
        mov dword [byte ebp+04Ah], eax
        rep movsb
        mov eax, dword [byte ebp+06Eh]
        cmp dword [dword eax+ebp-0E4Ah], 0A5F0h
        jbe short .159
        mov eax, dword [RosterDbPtrs]
        mov dword [edx+eax], 0FFFFFFFFh
        jmp short .160
.159:
        mov ecx, dword [byte ebp+04Ah]
        mov eax, dword [RosterDbPtrs]
        mov ecx, dword [dword ecx+RosterRecords+28h]
        mov dword [edx+eax], ecx
.160:
        imul eax, ebx, byte 3Ch
        mov esi, dword [byte ebp+072h]
        mov ecx, dword [RosterJerseyPtrs]
        add esi, byte 30h
        mov dword [ecx+edx], esi
        mov ecx, dword [byte ebp+072h]
        mov esi, dword [byte ebp+072h]
        mov dword [dword edx+PlayerRecPtrs], ecx
        mov ecx, dword [RosterFirstNamePtrs]
        inc esi
        mov dword [ecx+edx], esi
        mov esi, dword [byte ebp+072h]
        mov ecx, dword [RosterLastNamePtrs]
        add esi, byte 3
        mov dword [ecx+edx], esi
        mov esi, dword [byte ebp+072h]
        mov ecx, dword [RosterProfilePtrs]
        add esi, byte 13h
        mov dword [ecx+edx], esi
        mov cl, byte [dword eax+RosterRecords+2]
        mov byte [dword ebx+PlayerPosCodes], cl
        mov ecx, dword [RosterPlayerPtrs]
        mov eax, dword [dword eax+RosterRecords+24h]
        mov dword [ecx+edx], eax
        mov ecx, dword [byte ebp+072h]
        mov eax, dword [PlayerHeightPtrs]
        add ecx, byte 38h
        mov dword [edx+eax], ecx
        mov ecx, dword [byte ebp+072h]
        mov eax, dword [PlayerWeightPtrs]
        add ecx, byte 39h
        mov dword [edx+eax], ecx
        jmp short .162
.161:
        mov byte [dword ebx+PlayerPosCodes], 58h
.162:
        add dword [byte ebp+06Eh], byte 25h
        add dword [byte ebp+072h], byte 3Ch
        inc ebx
        add edx, byte 4
        cmp ebx, byte 1Ch
        jl near .158
        mov ebx, 1Ch
        mov dword [byte ebp+076h], 0
        mov eax, dword [byte ebp+07Eh]
        mov edx, 70h
        mov dword [byte ebp+07Ah], eax
.163:
        mov eax, dword [RosterPlayerIds]
        mov dword [edx+eax], ebx
        mov eax, dword [byte ebp+076h]
        cmp dword [dword eax+ebp-01662h], byte 0FFFFFFFFh
        je near .166
        mov esi, dword [TeamDb]
        add esi, dword [dword eax+ebp-01662h]
        imul eax, ebx, byte 3Ch
        mov ecx, 3Ch
        mov edi, dword [byte ebp+07Ah]
        mov dword [byte ebp+04Eh], eax
        rep movsb
        mov eax, dword [byte ebp+076h]
        cmp dword [dword eax+ebp-01662h], 0A5F0h
        jbe short .164
        mov eax, dword [RosterDbPtrs]
        mov dword [edx+eax], 0FFFFFFFFh
        jmp short .165
.164:
        mov ecx, dword [byte ebp+04Eh]
        mov eax, dword [RosterDbPtrs]
        mov ecx, dword [dword ecx+RosterRecords+28h]
        mov dword [edx+eax], ecx
.165:
        imul eax, ebx, byte 3Ch
        mov esi, dword [byte ebp+07Ah]
        mov ecx, dword [RosterJerseyPtrs]
        add esi, byte 30h
        mov dword [ecx+edx], esi
        mov ecx, dword [byte ebp+07Ah]
        mov esi, dword [byte ebp+07Ah]
        mov dword [dword edx+PlayerRecPtrs], ecx
        mov ecx, dword [RosterFirstNamePtrs]
        inc esi
        mov dword [ecx+edx], esi
        mov esi, dword [byte ebp+07Ah]
        mov ecx, dword [RosterLastNamePtrs]
        add esi, byte 3
        mov dword [ecx+edx], esi
        mov esi, dword [byte ebp+07Ah]
        mov ecx, dword [RosterProfilePtrs]
        add esi, byte 13h
        mov dword [ecx+edx], esi
        mov cl, byte [dword eax+RosterRecords+2]
        mov byte [dword ebx+PlayerPosCodes], cl
        mov ecx, dword [RosterPlayerPtrs]
        mov eax, dword [dword eax+RosterRecords+24h]
        mov dword [ecx+edx], eax
        mov ecx, dword [byte ebp+07Ah]
        mov eax, dword [PlayerHeightPtrs]
        add ecx, byte 38h
        mov dword [edx+eax], ecx
        mov ecx, dword [byte ebp+07Ah]
        mov eax, dword [PlayerWeightPtrs]
        add ecx, byte 39h
        mov dword [edx+eax], ecx
        jmp short .167
.166:
        mov byte [dword ebx+PlayerPosCodes], 58h
.167:
        add dword [byte ebp+076h], byte 25h
        add dword [byte ebp+07Ah], byte 3Ch
        inc ebx
        add edx, byte 4
        cmp ebx, byte 38h
        jl near .163
        mov eax, dword [dword ebp-0452h]
        lea edx, [dword ebp-0E6Ah]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call FormatRosterLine
        test eax, eax
        je near .129
        mov eax, dword [dword ebp-058Ah]
        lea edx, [dword ebp-01682h]
        mov eax, dword [dword ebp+eax*4-0BEh]
        call FormatRosterLine
        test eax, eax
        je near .129
        mov edx, dword [dword ebp-0452h]
        mov edx, dword [dword ebp+edx*4-0BEh]
        mov eax, dword [gameopts]
        and edx, byte 1Fh
        and dword [byte eax+01h], 0FFFE0FFFh
        shl edx, 0Ch
        or dword [byte eax+01h], edx
        mov edx, dword [dword ebp-058Ah]
        mov edx, dword [dword ebp+edx*4-0BEh]
        mov eax, dword [gameopts]
        and edx, byte 1Fh
        and byte [byte eax+03h], 0C1h
        shl edx, 11h
        mov dword [byte ebp+03Ah], 54CA38h
        jmp near .174
.168:
        push byte 2
        push byte 1
        push dword 0F0h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp-02Ah]
        push byte 0
        mov eax, 1FEh
        mov edx, 2
        call GetLangText
        call MessageBox
        test eax, eax
        jne near .129
        mov dword [RosterFirstRun], eax
        call LoadModemStats
        xor eax, eax
        shl eax, 2
.169:
        mov edx, dword [RosterBackFile]
        mov dword [edx+eax], 0FFFFFFFFh
        add eax, byte 4
        cmp eax, byte 70h
        jne short .169
        lea eax, [dword ebp-081Eh]
        push eax
        lea eax, [dword ebp-033Eh]
        push eax
        mov eax, dword [dword ebp-0452h]
        lea ecx, [dword ebp-0E6Ah]
        mov ebx, dword [byte ebp+046h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        xor eax, eax
        call DrawRosterTeams
        lea eax, [dword ebp-06E6h]
        push eax
        lea eax, [dword ebp-033Eh]
        push eax
        mov eax, dword [dword ebp-058Ah]
        lea ecx, [dword ebp-01682h]
        mov ebx, dword [byte ebp+046h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        mov eax, 1
        call DrawRosterTeams
        lea eax, [dword ebp-081Eh]
        xor edx, edx
        call SetScrollBarPos
        lea eax, [dword ebp-06E6h]
        xor edx, edx
        call SetScrollBarPos
        lea eax, [dword ebp-081Eh]
        call DrawScrollBar
.170:
        lea eax, [dword ebp-06E6h]
.171:
        call DrawScrollBar
        jmp near .129
.172:
        mov eax, dword [dword ebp-0452h]
.173:
        cmp dword [dword ebp+eax*4-0BEh], byte 1Ah
        je near .129
        mov dword [RosterFirstRun], 0
        mov dword [LinesEditMode], 1
        mov eax, dword [dword ebp+eax*4-0BEh]
        mov edx, dword [dword ebp-0452h]
        mov dword [LinesEditTeam], eax
        mov edx, dword [dword ebp+edx*4-0BEh]
        mov eax, dword [gameopts]
        and edx, byte 1Fh
        and dword [byte eax+01h], 0FFFE0FFFh
        shl edx, 0Ch
        or dword [byte eax+01h], edx
        mov edx, dword [dword ebp-058Ah]
        mov edx, dword [dword ebp+edx*4-0BEh]
        mov eax, dword [gameopts]
        and edx, byte 1Fh
        and byte [byte eax+03h], 0C1h
        shl edx, 11h
        mov dword [byte ebp+03Ah], 0Fh
.174:
        or dword [byte eax+01h], edx
        jmp near .129
.175:
        cmp dword [byte ebp+03Eh], byte 0Dh
        jb short .176
        cmp dword [byte ebp+03Eh], byte 0Eh
        jbe short .177
        cmp dword [byte ebp+03Eh], byte 0Fh
        je short .178
        jmp short .179
.176:
        cmp dword [byte ebp+03Eh], byte 0Ch
        jne short .179
        lea eax, [dword ebp-0476h]
        call ScrollBarUp
        jmp short .179
.177:
        lea eax, [dword ebp-0476h]
        call ScrollBarToMouse
        jmp short .179
.178:
        lea eax, [dword ebp-0476h]
        call ScrollBarDown
.179:
        mov eax, dword [dword ebp-0452h]
        cmp eax, dword [dword ebp-058Ah]
        jne short .183
        cmp eax, dword [byte ebp+052h]
        je short .181
        cmp dword [byte ebp+03Eh], byte 0Ch
        jne short .180
        test eax, eax
        jne short .181
.180:
        mov edx, dword [dword ebp-0452h]
        lea eax, [dword ebp-0476h]
        inc edx
        jmp short .182
.181:
        mov edx, dword [dword ebp-0452h]
        lea eax, [dword ebp-0476h]
        dec edx
.182:
        call SetScrollBarPos
.183:
        lea eax, [dword ebp-081Eh]
        xor edx, edx
        call SetScrollBarPos
        lea eax, [dword ebp-081Eh]
        push eax
        lea eax, [dword ebp-033Eh]
        push eax
        mov eax, dword [dword ebp-0452h]
        lea ecx, [dword ebp-0E6Ah]
        mov ebx, dword [byte ebp+046h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        xor eax, eax
        call DrawRosterTeams
        lea eax, [dword ebp-0476h]
        call DrawScrollBar
        lea eax, [dword ebp-081Eh]
        call DrawScrollBar
        mov edx, dword [dword ebp-0452h]
        mov edx, dword [dword ebp+edx*4-0BEh]
        mov eax, dword [gameopts]
        and edx, byte 1Fh
        and dword [byte eax+01h], 0FFFE0FFFh
        shl edx, 0Ch
        jmp near .174
.184:
        cmp dword [byte ebp+03Eh], byte 11h
        jb short .185
        cmp dword [byte ebp+03Eh], byte 12h
        jbe short .186
        cmp dword [byte ebp+03Eh], byte 13h
        je short .187
        jmp short .188
.185:
        cmp dword [byte ebp+03Eh], byte 10h
        jne short .188
        lea eax, [dword ebp-05AEh]
        call ScrollBarUp
        jmp short .188
.186:
        lea eax, [dword ebp-05AEh]
        call ScrollBarToMouse
        jmp short .188
.187:
        lea eax, [dword ebp-05AEh]
        call ScrollBarDown
.188:
        mov eax, dword [dword ebp-0452h]
        cmp eax, dword [dword ebp-058Ah]
        jne short .192
        cmp eax, dword [byte ebp+052h]
        je short .190
        cmp dword [byte ebp+03Eh], byte 10h
        jne short .189
        test eax, eax
        jne short .190
.189:
        mov edx, dword [dword ebp-058Ah]
        lea eax, [dword ebp-05AEh]
        inc edx
        jmp short .191
.190:
        mov edx, dword [dword ebp-058Ah]
        lea eax, [dword ebp-05AEh]
        dec edx
.191:
        call SetScrollBarPos
.192:
        lea eax, [dword ebp-06E6h]
        xor edx, edx
        call SetScrollBarPos
        lea eax, [dword ebp-06E6h]
        push eax
        lea eax, [dword ebp-033Eh]
        push eax
        mov eax, dword [dword ebp-058Ah]
        lea ecx, [dword ebp-01682h]
        mov ebx, dword [byte ebp+046h]
        mov edx, dword [dword ebp+eax*4-0BEh]
        mov eax, 1
        call DrawRosterTeams
        lea eax, [dword ebp-05AEh]
        call DrawScrollBar
        lea eax, [dword ebp-06E6h]
        call DrawScrollBar
        mov edx, dword [dword ebp-058Ah]
        mov eax, dword [gameopts]
        and edx, byte 1Fh
        and byte [byte eax+03h], 0C1h
        shl edx, 11h
        jmp near .174
.193:
        cmp dword [byte ebp+03Eh], byte 15h
        jb short .194
        cmp dword [byte ebp+03Eh], byte 16h
        jbe short .195
        cmp dword [byte ebp+03Eh], byte 17h
        je short .196
        jmp short .197
.194:
        cmp dword [byte ebp+03Eh], byte 14h
        jne short .197
        lea eax, [dword ebp-081Eh]
        call ScrollBarUp
        jmp short .197
.195:
        lea eax, [dword ebp-081Eh]
        call ScrollBarToMouse
        jmp short .197
.196:
        lea eax, [dword ebp-081Eh]
        call ScrollBarDown
.197:
        lea eax, [dword ebp-033Eh]
        mov ecx, dword [byte ebp+046h]
        mov ebx, dword [dword ebp-07FAh]
        push eax
        lea edx, [dword ebp-0E6Ah]
        xor eax, eax
        call DrawRosterPlayerInfo
        lea eax, [dword ebp-081Eh]
        jmp near .171
.198:
        cmp dword [byte ebp+03Eh], byte 19h
        jb short .199
        cmp dword [byte ebp+03Eh], byte 1Ah
        jbe short .200
        cmp dword [byte ebp+03Eh], byte 1Bh
        je short .201
        jmp short .202
.199:
        cmp dword [byte ebp+03Eh], byte 18h
        jne short .202
        lea eax, [dword ebp-06E6h]
        call ScrollBarUp
        jmp short .202
.200:
        lea eax, [dword ebp-06E6h]
        call ScrollBarToMouse
        jmp short .202
.201:
        lea eax, [dword ebp-06E6h]
        call ScrollBarDown
.202:
        lea eax, [dword ebp-033Eh]
        mov ecx, dword [byte ebp+046h]
        mov ebx, dword [dword ebp-06C2h]
        push eax
        lea edx, [dword ebp-01682h]
        mov eax, 1
        call DrawRosterPlayerInfo
        jmp near .170
.203:
        movzx edx, byte [dword eax+ebp-0E4Ch]
        cmp edx, byte 64h
        je short .204
        mov byte [dword eax+ebp-0E46h], 1
.204:
        lea eax, [dword ebp-033Eh]
        mov ecx, dword [byte ebp+046h]
        mov ebx, dword [dword ebp-07FAh]
        push eax
        lea edx, [dword ebp-0E6Ah]
        xor eax, eax
        call DrawRosterPlayerInfo
.205:
        cmp dword [byte ebp+03Eh], byte 25h
        jle near .129
        cmp dword [byte ebp+03Eh], byte 30h
        jge near .129
        mov eax, dword [byte ebp+03Eh]
        add eax, dword [dword ebp-06C2h]
        sub eax, byte 26h
        imul eax, byte 25h
        cmp byte [dword eax+ebp-0165Eh], 0
        je short .206
        mov byte [dword eax+ebp-0165Eh], 0
        jmp near .128
.206:
        movzx edx, byte [dword eax+ebp-01664h]
        cmp edx, byte 64h
        je near .128
        mov byte [dword eax+ebp-0165Eh], 1
        jmp near .128
.207:
        lea eax, [dword ebp-05AEh]
        call FreeScrollBar
        lea eax, [dword ebp-0476h]
        call FreeScrollBar
        lea eax, [dword ebp-06E6h]
        call FreeScrollBar
        lea eax, [dword ebp-081Eh]
        call FreeScrollBar
        push dword [byte ebp+046h]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 3
        call FadeOut
        mov eax, dword [byte ebp+03Ah]
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawRosterTeams                                 9A1DB  96 PC, low confidence
; The roster screen's team logos, names and player lists (LFRE free agents)
;-----------------------------------------------------------------------------
DrawRosterTeams:
        push esi
        push edi
        enter 18h, 0
        mov edi, dword [byte ebp+014h]
        mov dword [byte ebp-08h], eax
        mov dword [byte ebp-04h], edx
        mov esi, ebx
        mov dword [byte ebp-014h], ecx
        push byte 0
        push byte 64h
        mov eax, dword [byte edi+030h]
        push dword 0B4h
        mov dword [byte ebp-018h], eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte ebp-0Ch], eax
        call SetDrawBitmap
        add esp, byte 4
        cmp dword [byte ebp-08h], byte 0
        jne short .1
        push byte 0FFFFFFABh
        push byte 0FFFFFFBAh
        jmp short .2
.1:
        push byte 0FFFFFFABh
        push dword 0FFFFFE70h
.2:
        push str_Bkgd19
        push esi
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        cmp dword [byte ebp-04h], byte 1Ah
        je short .3
        mov eax, dword [byte ebp-04h]
        call LoadTeamLogo
        xor ecx, ecx
        xor ebx, ebx
        mov edx, eax
        mov eax, 0C000h
        call DrawFrameAt
        mov eax, dword [byte ebp-04h]
        mov ecx, 5Ah
        call GetTeamNameArt
        xor ebx, ebx
        mov edx, eax
        mov eax, 0D999h
        jmp short .4
.3:
        push str_LFRE
        push esi
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0C000h
.4:
        call DrawFrameAt
        call SetScreenTarget
        cmp dword [byte ebp-08h], byte 0
        jne short .5
        push byte 55h
        mov eax, dword [byte ebp-0Ch]
        push byte 46h
        jmp short .6
.5:
        push byte 55h
        mov eax, dword [byte ebp-0Ch]
        push dword 190h
.6:
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [byte ebp-0Ch]
        call FreeBitmap
        add esp, byte 4
        mov edx, dword [byte ebp-014h]
        mov eax, dword [byte ebp-04h]
        call FormatRosterLine
        mov dword [byte ebp-010h], eax
        cmp dword [byte ebp-08h], byte 0
        jne short .7
        mov eax, edi
        call FreeScrollBar
        push str_Ball5
        push esi
        call FindShape
        add esp, byte 8
        push eax
        push str_S12
        jmp short .8
.7:
        mov eax, edi
        call FreeScrollBar
        push str_Ball5
        push esi
        call FindShape
        add esp, byte 8
        push eax
        push str_S23
.8:
        push esi
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd19
        push esi
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        mov ebx, dword [byte ebp-010h]
        push byte 0
        mov edx, dword [byte ebp-018h]
        mov eax, edi
        call InitVScrollBar
        mov eax, edi
        call DrawScrollBar
        push dword [byte ebp+010h]
        mov edx, dword [byte ebp-014h]
        mov eax, dword [byte ebp-08h]
        mov ecx, esi
        xor ebx, ebx
        call DrawRosterPlayerInfo
DrawRosterTeams_17B:
        leave
        pop edi
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; FormatRosterLine                                9A35C  96 PC, low confidence
; Formats the player lines of a roster list ("%c  %2d  %c. %s")
;-----------------------------------------------------------------------------
FormatRosterLine:
        push ebx
        push ecx
        push esi
        push edi
        enter 14h, 0
        mov esi, eax
        mov dword [byte ebp-04h], edx
        mov dword [byte ebp-0Ch], 0
        test edx, edx
        je short .2
        lea ecx, [dword edx+040Ch]
        mov dword [byte ebp-010h], ecx
.1:
        mov byte [byte edx+024h], 0
        mov byte [byte edx+01Fh], 2
        mov ecx, 14h
        mov byte [byte edx+01Eh], 64h
        mov edi, edx
        mov dword [byte edx+020h], 0FFFFFFFFh
        xor eax, eax
        add edx, byte 25h
        rep stosb
        cmp edx, dword [byte ebp-010h]
        jne short .1
.2:
        cmp esi, byte 1Ah
        jne near .12
        mov ecx, dword [byte ebp-04h]
        xor esi, esi
.3:
        mov edx, dword [RosterBackFile]
        add edx, esi
        cmp dword [edx], byte 0FFFFFFFFh
        je near .11
        inc dword [byte ebp-0Ch]
        cmp dword [byte ebp-04h], byte 0
        je near .11
        mov edi, dword [TeamDb]
        mov edx, dword [edx]
        add edx, edi
        test byte [optflags], 0Ch
        jne short .4
        mov bl, byte [byte edx+02h]
        jmp short .10
.4:
        mov al, byte [byte edx+02h]
        cmp al, 47h
        jb short .5
        jbe short .6
        cmp al, 4Ch
        jb short .10
        jbe short .8
        cmp al, 52h
        je short .9
        jmp short .10
.5:
        cmp al, 43h
        jb short .10
        jbe short .7
        cmp al, 44h
        jne short .10
        mov bl, 41h
        jmp short .10
.6:
        mov bl, 54h
        jmp short .10
.7:
        mov bl, 4Dh
        jmp short .10
.8:
        mov bl, 4Ch
        jmp short .10
.9:
        mov bl, al
.10:
        lea edi, [byte edx+013h]
        push edi
        movsx edi, byte [byte edx+03h]
        push edi
        movzx edi, byte [byte edx+01h]
        push edi
        movsx edi, bl
        push edi
        push str_C2dCS
        push ecx
        call sprintf_
        mov al, byte [byte edx+01h]
        mov byte [byte ecx+01Eh], al
        movsx edx, byte [byte edx+02h]
        add esp, byte 18h
        cmp edx, byte 47h
        sete al
        mov byte [byte ecx+01Fh], al
        mov edx, dword [RosterBackFile]
        mov edx, dword [edx+esi]
        mov dword [byte ecx+020h], edx
.11:
        add esi, byte 4
        add ecx, byte 25h
        cmp esi, byte 70h
        je near .32
        jmp near .3
.12:
        imul esi, dword 31Bh
        mov edx, dword [statsplayoffs]
        mov ecx, dword [byte ebp-04h]
        add edx, esi
        xor edi, edi
        mov dword [byte ebp-08h], edx
        mov esi, edx
        jmp near .21
.13:
        mov edx, dword [TeamDb]
        inc dword [byte ebp-0Ch]
        add edx, dword [byte esi+063h]
        test byte [optflags], 0Ch
        jne short .14
        mov bl, byte [byte edx+02h]
        jmp short .20
.14:
        mov al, byte [byte edx+02h]
        cmp al, 47h
        jb short .15
        jbe short .16
        cmp al, 4Ch
        jb short .20
        jbe short .17
        cmp al, 52h
        je short .18
        jmp short .20
.15:
        cmp al, 43h
        jb short .20
        jbe short .19
        cmp al, 44h
        jne short .20
        mov bl, 41h
        jmp short .20
.16:
        mov bl, 54h
        jmp short .20
.17:
        mov bl, 4Ch
        jmp short .20
.18:
        mov bl, al
        jmp short .20
.19:
        mov bl, 4Dh
.20:
        lea eax, [byte edx+013h]
        push eax
        movsx eax, byte [byte edx+03h]
        push eax
        movzx eax, byte [byte edx+01h]
        push eax
        movsx eax, bl
        push eax
        push str_C2dCS
        push ecx
        call sprintf_
        mov byte [byte ecx+01Fh], 0
        add esi, byte 4
        mov al, byte [byte edx+01h]
        inc edi
        mov byte [byte ecx+01Eh], al
        add ecx, byte 25h
        mov edx, dword [byte esi+05Fh]
        add esp, byte 18h
        mov dword [byte ecx-05h], edx
.21:
        cmp edi, byte 19h
        jge short .22
        cmp dword [byte esi+063h], byte 0FFFFFFFFh
        jne near .13
.22:
        imul esi, edi, byte 25h
        mov ecx, dword [byte ebp-08h]
        lea edx, [byte ecx+0Ch]
        mov dword [byte ebp-014h], edx
        add esi, dword [byte ebp-04h]
.23:
        cmp dword [dword ecx+0C7h], byte 0FFFFFFFFh
        je near .31
        mov edx, dword [TeamDb]
        inc dword [byte ebp-0Ch]
        add edx, dword [dword ecx+0C7h]
        test byte [optflags], 0Ch
        jne short .24
        mov bl, byte [byte edx+02h]
        jmp short .30
.24:
        mov al, byte [byte edx+02h]
        cmp al, 47h
        jb short .25
        jbe short .26
        cmp al, 4Ch
        jb short .30
        jbe short .27
        cmp al, 52h
        je short .28
        jmp short .30
.25:
        cmp al, 43h
        jb short .30
        jbe short .29
        cmp al, 44h
        jne short .30
        mov bl, 41h
        jmp short .30
.26:
        mov bl, 54h
        jmp short .30
.27:
        mov bl, 4Ch
        jmp short .30
.28:
        mov bl, al
        jmp short .30
.29:
        mov bl, 4Dh
.30:
        lea eax, [byte edx+013h]
        push eax
        movsx eax, byte [byte edx+03h]
        push eax
        movzx eax, byte [byte edx+01h]
        push eax
        movsx eax, bl
        push eax
        push str_C2dCS
        push esi
        call sprintf_
        mov byte [byte esi+01Fh], 1
        mov al, byte [byte edx+01h]
        inc edi
        mov byte [byte esi+01Eh], al
        add esi, byte 25h
        mov edx, dword [dword ecx+0C7h]
        add esp, byte 18h
        mov dword [byte esi-05h], edx
.31:
        add ecx, byte 4
        cmp ecx, dword [byte ebp-014h]
        jne near .23
.32:
        mov eax, dword [byte ebp-0Ch]
FormatRosterLine_26D:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawRosterPlayerInfo                            9A5CF  96 PC, low confidence
; The picked player's info box on the roster screen
;-----------------------------------------------------------------------------
DrawRosterPlayerInfo:
        push esi
        push edi
        enter 14h, 0
        push eax
        push edx
        mov esi, ebx
        mov dword [byte ebp-010h], ecx
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
        push byte 0
        push dword 0C8h
        push dword 0A0h
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte ebp-04h], 0
        mov edi, eax
        call SetDrawBitmap
        add esp, byte 4
        cmp dword [byte ebp-018h], byte 0
        jne short .1
        push dword 0FFFFFF24h
        push byte 0FFFFFFB0h
        jmp short .2
.1:
        push dword 0FFFFFF24h
        push dword 0FFFFFE52h
.2:
        push str_Bkgd19
        push dword [byte ebp-010h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        mov dword [byte ebp-0Ch], esi
        lea eax, [byte esi+0Ah]
        imul esi, byte 25h
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-04h]
        add eax, byte 3
        mov dword [byte ebp-08h], eax
        add esi, dword [byte ebp-01Ch]
        jmp short .5
.3:
        cmp byte [byte esi+024h], 0
        je short .4
        mov eax, dword [byte ebp-04h]
        mov ecx, 0A0h
        add eax, byte 14h
        mov ebx, dword [byte ebp-04h]
        push eax
        xor edx, edx
        mov eax, dword [byte ebp+010h]
        call FillBox
.4:
        mov ebx, dword [byte ebp-08h]
        mov edx, 3
        add dword [byte ebp-04h], byte 14h
        mov eax, esi
        inc dword [byte ebp-0Ch]
        call DrawColorText
        add dword [byte ebp-08h], byte 14h
        add esi, byte 25h
.5:
        mov eax, dword [byte ebp-0Ch]
        cmp eax, dword [byte ebp-014h]
        jl short .3
        call SetScreenTarget
        cmp dword [byte ebp-018h], byte 0
        jne short .6
        push dword 0DCh
        push byte 50h
        jmp short .7
.6:
        push dword 0DCh
        push dword 1AEh
.7:
        push dword [byte edi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push edi
        call FreeBitmap
        add esp, byte 4
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; RosterSlotStatus                                9A6D6  96 PC, low confidence
; Returns the status letter for a roster slot
;-----------------------------------------------------------------------------
RosterSlotStatus:
        push esi
        push edi
        enter 8, 0
        mov edi, dword [byte ebp+014h]
        mov dword [byte ebp-04h], eax
        mov esi, ecx
        mov eax, dword [byte ebp+018h]
        mov dword [edi], 0
        mov dword [eax], 0
        mov eax, dword [byte ebp+01Ch]
        mov dword [eax], 0
        mov eax, dword [byte ebp+020h]
        mov dword [eax], 0
        mov dword [edx], 0
        mov dword [ebx], 0
        mov eax, dword [byte ebp+010h]
        mov dword [ecx], 0
        mov dword [eax], 0
        mov eax, dword [byte ebp-04h]
        lea ecx, [dword eax+040Ch]
        mov dword [byte ebp-08h], ecx
.1:
        cmp byte [byte eax+024h], 0
        je short .2
        movzx ecx, byte [byte eax+01Fh]
        cmp ecx, byte 1
        jne short .2
        add dword [edx], ecx
        jmp short .3
.2:
        movzx ecx, byte [byte eax+01Fh]
        cmp ecx, byte 1
        jne short .3
        add dword [edi], ecx
.3:
        cmp byte [byte eax+024h], 0
        je short .4
        cmp byte [byte eax+01Fh], 0
        jne short .4
        inc dword [ebx]
        jmp short .5
.4:
        cmp byte [byte eax+01Fh], 0
        jne short .5
        mov ecx, dword [byte ebp+018h]
        inc dword [ecx]
.5:
        cmp byte [byte eax+024h], 0
        je short .6
        cmp byte [byte eax+01Fh], 0
        jne short .6
        movsx ecx, byte [eax]
        cmp ecx, byte 44h
        je short .6
        cmp ecx, byte 41h
        je short .6
        inc dword [esi]
        jmp short .7
.6:
        cmp byte [byte eax+01Fh], 0
        jne short .7
        movsx ecx, byte [eax]
        cmp ecx, byte 44h
        je short .7
        cmp ecx, byte 41h
        je short .7
        mov ecx, dword [byte ebp+01Ch]
        inc dword [ecx]
.7:
        cmp byte [byte eax+024h], 0
        je short .9
        movsx ecx, byte [eax]
        cmp ecx, byte 44h
        je short .8
        cmp ecx, byte 41h
        jne short .9
.8:
        mov ecx, dword [byte ebp+010h]
        jmp short .11
.9:
        movsx ecx, byte [eax]
        cmp ecx, byte 44h
        je short .10
        cmp ecx, byte 41h
        jne short .12
.10:
        mov ecx, dword [byte ebp+020h]
.11:
        inc dword [ecx]
.12:
        add eax, byte 25h
        cmp eax, dword [byte ebp-08h]
        jne near .1
        leave
        pop edi
        pop esi
        ret 14h
;-----------------------------------------------------------------------------
; CountRosterSlots                                9A7D6  96 PC, low confidence
; Counts the filled roster slots of one kind
;-----------------------------------------------------------------------------
CountRosterSlots:
        push esi
        push edi
        enter 4, 0
        mov edi, eax
        mov esi, ecx
        test ecx, ecx
        je short .1
        mov dword [edx], 1Ch
        mov dword [ebx], 1Ch
        jmp short .2
.1:
        mov dword [edx], 3
        mov dword [ebx], 19h
.2:
        mov eax, edi
        add edi, 40Ch
        mov dword [byte ebp-04h], edi
.3:
        movzx edi, byte [byte eax+01Fh]
        cmp edi, byte 1
        jne short .5
        test esi, esi
        je short .4
        sub dword [edx], edi
        sub dword [ebx], edi
        jmp short .5
.4:
        sub dword [edx], edi
.5:
        cmp byte [byte eax+01Fh], 0
        jne short .7
        test esi, esi
        je short .6
        dec dword [edx]
.6:
        dec dword [ebx]
.7:
        add eax, byte 25h
        cmp eax, dword [byte ebp-04h]
        jne short .3
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; FindRosterSlot                                  9A838  96 PC, low confidence
; Finds a roster slot
;-----------------------------------------------------------------------------
FindRosterSlot:
        push ebx
        push ecx
        push esi
        push edi
        enter 4, 0
        mov ebx, eax
        mov eax, edx
        lea eax, [dword edx+040Ch]
        mov dword [byte ebp-04h], eax
.1:
        cmp byte [byte edx+024h], 0
        je short .2
        mov ecx, 25h
        mov esi, edx
        mov edi, ebx
        rep movsb
        add ebx, byte 25h
.2:
        add edx, byte 25h
        cmp edx, dword [byte ebp-04h]
        jne short .1
        jmp near FormatRosterLine_26D
;-----------------------------------------------------------------------------
; ListRosterPlayers                               9A86E  96 PC, low confidence
; Builds the roster list shown on the screen
;-----------------------------------------------------------------------------
ListRosterPlayers:
        push esi
        push edi
        enter 14h, 0
        push eax
        mov edi, edx
        mov dword [byte ebp-014h], ebx
        mov dword [byte ebp-04h], ecx
        imul eax, dword [byte ebp+014h], dword 31Bh
        mov edx, dword [statsplayoffs]
        mov dword [byte ebp-08h], 0
        add edx, eax
        mov eax, dword [byte ebp+010h]
        mov ebx, ecx
        shl eax, 2
        shl ebx, 2
        add eax, edx
        add ebx, edx
        mov dword [byte ebp-0Ch], eax
        mov edx, edi
        jmp near .9
.1:
        mov eax, dword [TeamDb]
        add eax, dword [byte edx+020h]
        mov cl, byte [byte ebp+014h]
        mov byte [eax], cl
        cmp byte [byte edx+01Fh], 0
        jne short .2
        cmp dword [byte ebp+014h], byte 1Ah
        je short .2
        mov ecx, dword [byte ebp-0Ch]
        inc dword [byte ebp+010h]
        mov eax, dword [byte edx+020h]
        add dword [byte ebp-0Ch], byte 4
        mov dword [byte ecx+063h], eax
        jmp short .3
.2:
        cmp dword [byte ebp+014h], byte 1Ah
        je short .3
        add ebx, byte 4
        mov eax, dword [byte edx+020h]
        inc dword [byte ebp-04h]
        mov dword [dword ebx+0C3h], eax
.3:
        cmp dword [byte ebp+014h], byte 1Ah
        jne short .6
        mov ecx, edx
        xor edi, edi
.4:
        mov eax, edi
        mov esi, dword [RosterBackFile]
        shl eax, 2
        add eax, esi
        cmp dword [eax], byte 0FFFFFFFFh
        jne short .5
        mov edi, dword [byte ecx+020h]
        mov dword [eax], edi
        mov edi, 1Dh
.5:
        inc edi
        cmp edi, byte 1Ch
        jl short .4
.6:
        mov dword [byte ebp-010h], edx
        xor edi, edi
.7:
        imul eax, edi, byte 25h
        add eax, dword [byte ebp-018h]
        movzx ecx, byte [byte eax+01Fh]
        cmp ecx, byte 2
        jne short .8
        mov ecx, 25h
        mov esi, dword [byte ebp-010h]
        mov edi, eax
        rep movsb
        mov edi, 1Dh
.8:
        inc edi
        cmp edi, byte 1Ch
        jl short .7
        inc dword [byte ebp-08h]
        add edx, byte 25h
.9:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte ebp-014h]
        jl near .1
        jmp near DrawRosterTeams_17B
;-----------------------------------------------------------------------------
; ValidateRoster                                  9A95A  96 PC, low confidence
; Checks a roster's size and goalies
;-----------------------------------------------------------------------------
ValidateRoster:
        push ebx
        push ecx
        push esi
        push edi
        enter 18h, 0
        mov ebx, eax
        imul ecx, edx, dword 31Bh
        mov dword [byte ebp-0Ch], 0
        mov esi, dword [statsplayoffs]
        mov dword [byte ebp-018h], 0
        add esi, ecx
        mov dword [byte ebp-010h], 0
        mov dword [byte ebp-014h], esi
        cmp edx, byte 1Ah
        jne near .7
        mov dword [byte ebp-04h], 0
.1:
        imul edx, dword [byte ebp-04h], byte 25h
        cmp byte [byte edx+ebx+024h], 0
        je near .6
        mov esi, dword [byte ebp-04h]
        inc esi
        mov edi, esi
        inc dword [byte ebp-0Ch]
        shl edi, 2
        jmp short .3
.2:
        mov edx, dword [RosterBackFile]
        mov ecx, dword [edx+edi]
        add edi, byte 4
        inc esi
        mov dword [byte edx+edi-08h], ecx
.3:
        cmp edi, byte 70h
        jl short .2
        imul edi, dword [byte ebp-04h], byte 25h
        mov ecx, 1Bh
        sub ecx, dword [byte ebp-04h]
        imul ecx, byte 25h
        mov edx, dword [RosterBackFile]
        mov dword [byte edx+06Ch], 0FFFFFFFFh
        mov edx, dword [byte ebp-04h]
        inc edx
        imul edx, byte 25h
        lea esi, [ebx+edx]
        add edi, ebx
        rep movsb
        mov esi, 1Ch
        sub esi, dword [byte ebp-0Ch]
        imul edx, esi, byte 25h
        add edx, ebx
        jmp short .5
.4:
        mov ecx, 14h
        mov byte [byte edx+024h], 0
        mov edi, edx
        mov byte [byte edx+01Fh], 2
        xor eax, eax
        mov byte [byte edx+01Eh], 64h
        rep stosb
        inc esi
        add edx, byte 25h
.5:
        cmp esi, byte 1Ch
        jl short .4
        dec dword [byte ebp-04h]
.6:
        inc dword [byte ebp-04h]
        cmp dword [byte ebp-04h], byte 1Ch
        jl near .1
        jmp near FormatRosterLine_26D
.7:
        mov dword [byte ebp-08h], 0
.8:
        imul edx, dword [byte ebp-08h], byte 25h
        cmp byte [byte edx+ebx+01Fh], 0
        jne short .9
        inc dword [byte ebp-018h]
.9:
        imul edx, dword [byte ebp-08h], byte 25h
        movzx edx, byte [byte edx+ebx+01Fh]
        cmp edx, byte 1
        jne short .10
        add dword [byte ebp-010h], edx
.10:
        imul edx, dword [byte ebp-08h], byte 25h
        add edx, ebx
        cmp byte [byte edx+024h], 0
        je near .19
        inc dword [byte ebp-0Ch]
        cmp byte [byte edx+01Fh], 0
        jne short .13
        mov esi, dword [byte ebp-018h]
        mov edx, esi
        shl edx, 2
        add edx, dword [byte ebp-014h]
        jmp short .12
.11:
        add edx, byte 4
        mov ecx, dword [byte edx+05Fh]
        inc esi
        mov dword [byte edx+05Bh], ecx
.12:
        cmp esi, byte 19h
        jl short .11
        mov edx, dword [byte ebp-014h]
        dec dword [byte ebp-018h]
        mov dword [dword edx+0C3h], 0FFFFFFFFh
        jmp short .16
.13:
        mov esi, dword [byte ebp-010h]
        mov edx, esi
        shl edx, 2
        add edx, dword [byte ebp-014h]
        jmp short .15
.14:
        add edx, byte 4
        mov ecx, dword [dword edx+0C3h]
        inc esi
        mov dword [dword edx+0BFh], ecx
.15:
        cmp esi, byte 3
        jl short .14
        mov edx, dword [byte ebp-014h]
        dec dword [byte ebp-010h]
        mov dword [dword edx+0CFh], 0FFFFFFFFh
.16:
        imul edi, dword [byte ebp-08h], byte 25h
        mov ecx, 1Bh
        sub ecx, dword [byte ebp-08h]
        imul ecx, byte 25h
        mov edx, dword [byte ebp-08h]
        inc edx
        imul edx, byte 25h
        lea esi, [ebx+edx]
        add edi, ebx
        rep movsb
        mov esi, 1Ch
        sub esi, dword [byte ebp-0Ch]
        imul edx, esi, byte 25h
        add edx, ebx
        jmp short .18
.17:
        mov ecx, 14h
        mov byte [byte edx+024h], 0
        mov edi, edx
        mov byte [byte edx+01Fh], 2
        xor eax, eax
        mov byte [byte edx+01Eh], 64h
        rep stosb
        inc esi
        add edx, byte 25h
.18:
        cmp esi, byte 1Ch
        jl short .17
        dec dword [byte ebp-08h]
.19:
        inc dword [byte ebp-08h]
        cmp dword [byte ebp-08h], byte 1Ch
        jl near .8
        jmp near FormatRosterLine_26D
;-----------------------------------------------------------------------------
; EditPlayerName                                  9AB3B  96 PC, low confidence
; Edits a created player's name (EditText)
;-----------------------------------------------------------------------------
EditPlayerName:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0A4h, 0
        push eax
        sub ebp, 82h
        mov ecx, 28h
        lea edi, [byte ebp+042h]
        xor eax, eax
        rep stosb
        mov eax, dword [byte ebp-026h]
        mov dword [byte ebp+06Eh], 0
        mov dword [byte ebp+06Ah], eax
.1:
        imul edx, dword [byte ebp+06Eh], byte 25h
        mov eax, dword [byte ebp+06Ah]
        movzx eax, byte [byte eax+01Eh]
        cmp eax, byte 64h
        je near EditPlayerName_131
        mov esi, dword [byte ebp+06Ah]
        mov dword [byte ebp+07Ah], esi
        mov esi, dword [byte ebp-026h]
        add esi, edx
        mov dword [byte ebp+076h], esi
        lea edx, [byte esi+06h]
        mov eax, 1
        mov dword [byte ebp+072h], edx
.2:
        test eax, eax
        je near .8
        xor eax, eax
        mov esi, dword [byte ebp-026h]
        mov dword [byte ebp+07Eh], eax
        jmp short .5
.3:
        lea eax, [byte ebp+042h]
        mov edx, dword [byte ebp+07Ah]
        call atoi_
        mov byte [byte edx+01Eh], al
        mov eax, dword [byte ebp+07Ah]
        mov edx, dword [TeamDb]
        mov ecx, 28h
        add edx, dword [byte eax+020h]
        lea eax, [byte ebp+042h]
        lea edi, [byte ebp+042h]
        call atoi_
        mov byte [byte edx+01h], al
        xor eax, eax
        rep stosb
        mov eax, 1
.4:
        inc dword [byte ebp+07Eh]
        add esi, byte 25h
.5:
        mov edx, dword [byte ebp+07Eh]
        cmp edx, dword [byte ebp+06Eh]
        jge short .2
        mov edi, dword [byte ebp+076h]
        mov dl, byte [byte esi+01Eh]
        cmp dl, byte [byte edi+01Eh]
        jne short .4
        mov edx, dword [byte ebp+07Eh]
        cmp edx, dword [byte ebp+06Eh]
        je short .4
        push dword [byte ebp+072h]
        movzx eax, byte [byte esi+01Eh]
        push eax
        mov eax, 1FFh
        call GetLangText
        push eax
        lea eax, [byte ebp-022h]
        push eax
        call sprintf_
        add esp, byte 10h
.6:
        lea eax, [byte ebp+042h]
        call atoi_
        cmp eax, byte 63h
        jg short .7
        lea eax, [byte ebp+042h]
        call atoi_
        cmp eax, byte 1
        jge near .3
.7:
        lea eax, [byte ebp+042h]
        push eax
        push dword 0F0h
        mov ecx, 3
        mov ebx, TitleTextStyle
        push dword 140h
        lea edx, [byte ebp-022h]
        xor eax, eax
        call EditText
        jmp short .6
.8:
        inc dword [byte ebp+06Eh]
        add dword [byte ebp+06Ah], byte 25h
        cmp dword [byte ebp+06Eh], byte 1Ch
        jl near .1
EditPlayerName_131:
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near RunRosterScreens_231
;-----------------------------------------------------------------------------
; ConfirmTrade                                    9AC78  96 PC, low confidence
; The trade question message box with both team names
;-----------------------------------------------------------------------------
ConfirmTrade:
        push ebx
        push ecx
        enter 68h, 0
        mov ebx, eax
        imul edx, dword 31Bh
        xor eax, eax
        call GetLangText
        mov dword [byte ebp-04h], eax
        mov eax, dword [statsplayoffs]
        add eax, edx
        add eax, byte 1Eh
        push eax
        mov eax, ebx
        mov eax, dword [nosplit eax*4+TradeTextIds]
        call GetLangText
        push eax
        lea eax, [byte ebp-068h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov ecx, TitleTextStyle
        mov edx, 1
        push byte 0
        lea ebx, [byte ebp-04h]
        lea eax, [byte ebp-068h]
        call MessageBox
        leave
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ResetTeamLines                                  9ACDF  96 PC, low confidence
; (team): after a roster change sorts the team's players and sets its lines
; again (AutoSetLines), not for team 1Ah
;-----------------------------------------------------------------------------
ResetTeamLines:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        cmp eax, byte 1Ah
        je near RunRosterScreens_230
        imul edx, eax, dword 31Bh
        push byte 1
        mov ecx, LineForwardCount
        mov ebx, LineForwardOrder
        mov eax, dword [statsplayoffs]
        push LineDefenceCount
        add eax, edx
        mov edx, LineDefenceOrder
        mov dword [byte ebp-04h], eax
        call SortTeamPlayers
        mov ecx, 1Ch
        mov edx, 1
        mov eax, LineForwardOrder
        mov edi, LinesWorkTable
        call __STOSD
        mov ecx, 3Eh
        mov eax, 64h
        mov esi, LinesWorkTable
        rep stosb
        mov eax, LineForwardOrder
        mov edi, dword [byte ebp-04h]
        mov ecx, 3Eh
        mov ebx, dword [LineDefenceCount]
        mov edx, dword [LineForwardCount]
        add edi, 0D3h
        call AutoSetLines
        rep movsb
        mov edi, dword [byte ebp-04h]
        mov ecx, 3Eh
        mov esi, LinesWorkTable
        add edi, 111h
        rep movsb
        jmp near RunRosterScreens_230
;-----------------------------------------------------------------------------
; CycleLoadingArt                                 9AD86  96 PC, low confidence
; Steps the SGI%d animation frames while waiting
;-----------------------------------------------------------------------------
CycleLoadingArt:
        push ebx
        push ecx
        push edx
        enter 8, 0
        call TickDeadlinePassed
        test eax, eax
        je short .2
        inc dword [LoadingArtFrame]
        cmp dword [LoadingArtFrame], byte 8
        jle short .1
        mov dword [LoadingArtFrame], 1
.1:
        push dword [LoadingArtFrame]
        push str_SGID
        lea eax, [byte ebp-08h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push byte 14h
        call SetTickDeadline
        add esp, byte 4
        lea eax, [byte ebp-08h]
        push eax
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
.2:
        leave
        pop edx
        pop ecx
        pop ebx
        ret
jpt_9ADF0:
        dd CreatePlayerScreen_6BE
        dd CreatePlayerScreen_71A
        dd CreatePlayerScreen_BD2
        dd CreatePlayerScreen_CF7
        dd CreatePlayerScreen_DBB
jpt_9AE04:
        dd CreatePlayerScreen_8D1
        dd CreatePlayerScreen_8DA
        dd CreatePlayerScreen_8E3
        dd CreatePlayerScreen_8EC
        dd CreatePlayerScreen_8F5
;-----------------------------------------------------------------------------
; CreatePlayerScreen                              9AE18  96 PC, low confidence
; The create player screen (GOL0, NME0-2 name, NUM0-2 number buttons, random
; ratings by CreatePlayerRatings), from the roster screen
;-----------------------------------------------------------------------------
CreatePlayerScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1FB4h, 0
        sub ebp, 82h
        mov ecx, 30h
        lea edi, [dword ebp-02DEh]
        mov esi, str_Punct_CreatePlayerScreen
        rep movsd
        mov ecx, 84h
        lea edi, [dword ebp-04EEh]
        mov esi, CreateSkaterNavLinks
        rep movsd
        mov dword [byte ebp+056h], 0FFFFFFFFh
        mov ecx, 84h
        lea edi, [dword ebp-06FEh]
        mov esi, CreateGoalieNavLinks
        lea edx, [dword ebp-01F32h]
        xor eax, eax
        rep movsd
        call GetLangText
        mov dword [byte ebp+022h], eax
        mov eax, 1
        mov ecx, 15h
        call GetLangText
        mov dword [byte ebp+026h], eax
        mov eax, 21h
        lea edi, [byte ebp-036h]
        call InitMenuItems
        xor eax, eax
        rep stosb
        mov ecx, 11h
        lea edi, [byte ebp-01Eh]
        xor eax, eax
        xor edx, edx
        rep stosb
        mov eax, 13Ah
        call LoadPackedFile
        push str_Pal26
        push eax
        mov dword [CreatePlayerShapes], eax
        call FindShape
        mov edx, eax
        add eax, byte 10h
        mov dword [byte ebp+052h], 0
        mov dword [byte ebp+05Ah], eax
        mov al, byte [byte ebp+052h]
        mov ah, 7
        mul ah
        mov dword [byte ebp+04Ah], 0
        mov dword [byte ebp+046h], 5Ah
        mov dword [byte ebp+042h], 46h
        mov dword [byte ebp+036h], 0
        mov bl, al
        add esp, byte 8
        neg bl
        lea eax, [dword edx+02AAh]
        add bl, 3Fh
.1:
        mov byte [eax], 3Fh
        mov byte [byte eax+02h], 0
        inc dword [byte ebp+052h]
        mov byte [byte eax+01h], bl
        sub bl, 7
        add eax, byte 3
        cmp dword [byte ebp+052h], byte 8
        jl short .1
        mov eax, dword [byte ebp+05Ah]
        call SetScreenColors
        push str_Bkgd19
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+062h], 0
        push eax
        mov dword [byte ebp+066h], 0
        mov dword [byte ebp+06Ah], 0
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        mov eax, 6
        xor esi, esi
        call OpenScreen
.2:
        mov dword [byte ebp+04Eh], 0
        mov eax, dword [byte ebp+062h]
        mov edi, esi
        mov dword [byte ebp+05Eh], eax
.3:
        push dword [byte ebp+04Eh]
        mov eax, dword [byte ebp+05Eh]
        push dword [dword eax+PositionTags]
        push str_SD6
        lea eax, [byte ebp-07Ah]
        push eax
        call sprintf_
        add esp, byte 10h
        push byte 0
        push str_GOL0
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_GOL0
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [dword edi+ebp-021Eh], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_GOL0
        push dword [CreatePlayerShapes]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_GOL0
        push dword [CreatePlayerShapes]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd19
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0
        lea eax, [byte ebp-07Ah]
        push eax
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        push eax
        add edi, byte 4
        inc dword [byte ebp+04Eh]
        call DrawArt
        add esp, byte 0Ch
        cmp dword [byte ebp+04Eh], byte 9
        jl near .3
        mov eax, dword [byte ebp+066h]
        mov edi, esi
        mov ebx, esi
        xor ecx, ecx
.4:
        mov edx, dword [dword ebx+ebp-0216h]
        mov edx, dword [byte edx+02Ch]
        mov dword [dword eax+ebp-010Ah], edx
        cmp ecx, byte 3
        je short .5
        mov edx, dword [dword ebx+ebp-0206h]
        jmp short .6
.5:
        mov edx, dword [dword edi+ebp-021Eh]
.6:
        mov edx, dword [byte edx+02Ch]
        mov dword [dword eax+ebp-016Ah], edx
        add eax, byte 4
        inc ecx
        add ebx, byte 4
        cmp ecx, byte 4
        jl short .4
        mov eax, dword [dword esi+ebp-021Eh]
        mov edx, dword [byte ebp+06Ah]
        mov eax, dword [byte eax+02Ch]
        add dword [byte ebp+062h], byte 4
        mov dword [dword edx+ebp-0AAh], eax
        mov eax, dword [dword esi+ebp-021Ah]
        add dword [byte ebp+066h], byte 10h
        add esi, byte 24h
        mov eax, dword [byte eax+02Ch]
        add dword [byte ebp+06Ah], byte 8
        mov dword [dword edx+ebp-0A6h], eax
        cmp dword [byte ebp+062h], byte 14h
        jne near .2
        push byte 0
        push dword 0C8h
        mov byte [byte ebp-0Ah], 0
        mov byte [byte ebp+06h], 0
        push dword 1D6h
        lea edi, [dword ebp-01F32h]
        mov esi, TeamStatsBitmap
        call CreateBitmap
        mov ecx, 66h
        rep movsb
        add esp, byte 0Ch
        mov ecx, 66h
        lea edi, [dword ebp-01ECCh]
        mov esi, BottomBarArt+56h
        mov dword [byte ebp+03Eh], eax
        push str_NME0
        rep movsb
        lea eax, [dword ebp-02DEh]
        mov dword [dword ebp-01E56h], 6
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01E52h], eax
        call FindShape
        add esp, byte 8
        push str_NME1
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01E4Ch], eax
        call FindShape
        add esp, byte 8
        push str_NME2
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01E48h], eax
        call FindShape
        add esp, byte 8
        push str_NME0
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01E44h], eax
        call FindShape
        add esp, byte 8
        push str_NME0
        movsx eax, word [byte eax+0Ch]
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01E40h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-01E3Ch], eax
        mov eax, dword [dword ebp-01E40h]
        add eax, byte 28h
        add esp, byte 8
        mov dword [dword ebp-01E2Ch], eax
        mov eax, dword [dword ebp-01E3Ch]
        mov dword [dword ebp-01DF0h], 6
        add eax, byte 0Ah
        push str_NUM0
        mov dword [dword ebp-01E28h], eax
        lea eax, [dword ebp-029Eh]
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01DECh], eax
        call FindShape
        add esp, byte 8
        push str_NUM1
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01DE6h], eax
        call FindShape
        add esp, byte 8
        push str_NUM2
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01DE2h], eax
        call FindShape
        add esp, byte 8
        push str_NUM0
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01DDEh], eax
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        mov dword [dword ebp-01DDAh], eax
        push str_NUM0
        push dword [CreatePlayerShapes]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-01DD6h], eax
        mov eax, dword [dword ebp-01DDAh]
        add eax, byte 28h
        mov dword [dword ebp-01DC6h], eax
        mov eax, dword [dword ebp-01DD6h]
        mov ebx, dword [byte ebp+04Ah]
        add eax, byte 0Ah
        add esp, byte 8
        mov dword [dword ebp-01DC2h], eax
        lea eax, [dword ebp-025Eh]
        mov dword [dword ebp-01D8Ah], 8
        mov dword [dword ebp-01D86h], eax
        mov eax, dword [dword ebp+ebx*8-0AAh]
        push str_GOL0
        mov dword [dword ebp-01D80h], eax
        mov eax, dword [dword ebp+ebx*8-0A6h]
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01D7Ch], eax
        call FindShape
        add esp, byte 8
        push str_GOL0
        movsx eax, word [byte eax+0Ch]
        push dword [CreatePlayerShapes]
        mov dword [dword ebp-01D74h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp+052h], 0
        mov dword [dword ebp-01D70h], eax
        mov eax, dword [dword ebp-01D74h]
        mov ecx, dword [byte ebp+04Ah]
        add eax, byte 28h
        lea ebx, [byte ebp-036h]
        mov dword [dword ebp-01D60h], eax
        mov eax, dword [dword ebp-01D70h]
        lea edx, [byte ebp-01Eh]
        add eax, byte 0Ah
        add esp, byte 8
        mov dword [dword ebp-01D5Ch], eax
        lea eax, [dword ebp-0120Ah]
        xor esi, esi
        call CreatePlayerLimits
        lea eax, [dword ebp-0120Ah]
        mov ecx, 1FEh
        lea edi, [byte eax+040h]
        mov ebx, 264h
        mov dword [byte ebp+06Eh], eax
.7:
        mov eax, dword [byte ebp+06Eh]
        mov dword [dword ecx+ebp-01F1Eh], eax
        mov eax, dword [byte ebp+052h]
        mov dword [byte ebp+07Eh], 2
        cdq
        idiv dword [byte ebp+07Eh]
        mov dword [dword ecx+ebp-01F22h], 4
        mov dword [dword ebx+ebp-01F22h], 4
        mov dword [dword ebx+ebp-01F1Eh], edi
        or byte [dword ecx+ebp-01EECh], 1
        or byte [dword ebx+ebp-01EECh], 1
        test edx, edx
        jne short .8
        mov eax, dword [dword esi+ebp-0120Ah]
        add eax, byte 5
        jmp short .9
.8:
        mov eax, dword [dword esi+ebp-01202h]
        sub eax, byte 5
.9:
        mov dword [dword ecx+ebp-01EF8h], eax
        mov eax, dword [dword esi+ebp-01206h]
        add eax, byte 3
        mov dword [dword ecx+ebp-01EF4h], eax
        mov eax, dword [byte ebp+052h]
        mov dword [byte ebp+07Eh], 2
        cdq
        idiv dword [byte ebp+07Eh]
        test edx, edx
        jne short .10
        mov eax, dword [dword esi+ebp-011C2h]
        sub eax, byte 5
        jmp short .11
.10:
        mov eax, dword [dword esi+ebp-011CAh]
        inc eax
        inc eax
.11:
        mov dword [dword ebx+ebp-01EF8h], eax
        add dword [byte ebp+06Eh], 80h
        inc dword [byte ebp+052h]
        add edi, 80h
        add ecx, 0CCh
        mov eax, dword [dword esi+ebp-011C6h]
        add ebx, 0CCh
        add eax, byte 3
        add esi, 80h
        mov dword [dword ebx+ebp-01FC0h], eax
        cmp dword [byte ebp+052h], byte 0Eh
        jl near .7
        push dword [byte ebp+03Eh]
        mov ecx, dword [byte ebp+046h]
        lea ebx, [byte ebp-01Eh]
        lea edx, [byte ebp-036h]
        mov eax, dword [byte ebp+04Ah]
        push dword [byte ebp+042h]
        xor esi, esi
        call DrawCreatePlayerRow
.12:
        cmp dword [dword esi+ebp-01F18h], byte 0
        je short .13
        push dword [dword esi+ebp-01F08h]
        push dword [dword esi+ebp-01F0Ch]
        push dword [dword esi+ebp-01F18h]
        call DrawArt
        add esp, byte 0Ch
.13:
        add esi, byte 66h
        cmp esi, 0D26h
        jne short .12
        mov ebx, 3
        mov edx, dword [byte ebp+05Ah]
        xor eax, eax
        call FadePalette
        push byte 14h
        call SetTickDeadline
        lea eax, [dword ebp-01F32h]
        lea ebx, [dword ebp-04EEh]
        lea edx, [byte eax+042h]
        mov dword [byte ebp+03Ah], 0Eh
        lea eax, [dword ebx+0210h]
        add esp, byte 4
        mov dword [byte ebp+072h], eax
.14:
        mov ecx, 4
        mov esi, ebx
        mov edi, edx
        rep movsb
        add ebx, byte 10h
        add edx, byte 66h
        cmp ebx, dword [byte ebp+072h]
        jne short .14
        lea eax, [dword ebp-01F32h]
        add eax, byte 42h
        mov dword [byte ebp+07Ah], eax
        jmp near CreatePlayerScreen_BD2.29
CreatePlayerScreen_6BE:
        call SlideInSideBar
        xor eax, eax
        call GetLangText
        mov dword [byte ebp+022h], eax
        mov eax, 1
        call GetLangText
        push byte 2
        push byte 1
        push dword 0F0h
        mov ecx, TitleTextStyle
        push dword 140h
        lea ebx, [byte ebp+022h]
        mov dword [byte ebp+026h], eax
        push byte 0
        mov eax, 200h
        mov edx, 2
        call GetLangText
        call MessageBox
        test eax, eax
        jne near CreatePlayerScreen_BD2.29
        mov dword [byte ebp+036h], 1
        jmp near CreatePlayerScreen_BD2.29
CreatePlayerScreen_71A:
        lea edx, [dword ebp-0B0Ah]
        mov eax, 1Ah
        mov ecx, 1
        lea ebx, [byte ebp+02Ah]
        call FormatRosterLine
        lea edx, [byte ebp+02Eh]
        lea eax, [dword ebp-0B0Ah]
        call CountRosterSlots
        call SlideInTitleBar
        xor eax, eax
        call GetLangText
        mov dword [byte ebp+022h], eax
        mov eax, 1
        call GetLangText
        mov dword [byte ebp+026h], eax
        lea eax, [byte ebp+016h]
        call atoi_
        cmp eax, byte 1
        jge short .16
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov eax, 201h
.15:
        mov ecx, TitleTextStyle
        push byte 0
        lea ebx, [byte ebp+022h]
        mov edx, 1
        call GetLangText
        call MessageBox
        jmp near CreatePlayerScreen_BD2.29
.16:
        cmp byte [byte ebp-0Ah], 0
        jne short .17
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov eax, 202h
        jmp short .15
.17:
        mov eax, dword [TeamDb]
        movsx edx, byte [dword eax+0C34Fh]
        imul edx, byte 3Ch
        add eax, 0C350h
        add eax, edx
        mov dword [byte ebp+032h], eax
        lea eax, [byte ebp+016h]
        mov edx, dword [byte ebp+032h]
        call atoi_
        mov byte [byte edx+01h], al
        lea eax, [byte ebp+06h]
        mov dword [byte ebp+036h], 1
        push eax
        lea eax, [byte ebp-0Ah]
        mov byte [edx], 1Ah
        push eax
        cmp dword [byte ebp+04Ah], byte 4
        jne short .18
        mov eax, 22Ah
        jmp short .19
.18:
        mov eax, 229h
.19:
        call GetLangText
        push eax
        lea eax, [byte ebp-07Ah]
        push eax
        call sprintf_
        add esp, byte 10h
        mov eax, 0D8h
        call GetLangText
        mov dword [byte ebp+022h], eax
        mov eax, 0D9h
        call GetLangText
        mov dword [byte ebp+026h], eax
        cmp dword [byte ebp+04Ah], byte 4
        jne short .20
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp+022h]
        push byte 0
        mov edx, 2
        lea eax, [byte ebp-07Ah]
        call MessageBox
        test eax, eax
        sete al
        mov byte [byte ebp-01Eh], al
        jmp short .21
.20:
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp+022h]
        push byte 0
        mov edx, 2
        lea eax, [byte ebp-07Ah]
        call MessageBox
        mov byte [byte ebp-036h], al
.21:
        mov eax, 1
        mov byte [byte ebp-019h], 9
        call GetLangText
        mov dword [byte ebp+022h], eax
        xor eax, eax
        call GetLangText
        mov dword [byte ebp+026h], eax
        mov eax, dword [byte ebp+032h]
        lea edx, [byte ebp-0Ah]
        add eax, byte 3
        call strcpy_
        mov eax, dword [byte ebp+032h]
        lea edx, [byte ebp+06h]
        add eax, byte 13h
        call strcpy_
        cmp dword [byte ebp+04Ah], byte 4
        ja short CreatePlayerScreen_8F5.22
        mov eax, dword [byte ebp+04Ah]
        jmp dword [nosplit cs:eax*4+jpt_9AE04]
CreatePlayerScreen_8D1:
        mov eax, dword [byte ebp+032h]
        mov byte [byte eax+02h], 43h
        jmp short CreatePlayerScreen_8F5.22
CreatePlayerScreen_8DA:
        mov eax, dword [byte ebp+032h]
        mov byte [byte eax+02h], 4Ch
        jmp short CreatePlayerScreen_8F5.22
CreatePlayerScreen_8E3:
        mov eax, dword [byte ebp+032h]
        mov byte [byte eax+02h], 52h
        jmp short CreatePlayerScreen_8F5.22
CreatePlayerScreen_8EC:
        mov eax, dword [byte ebp+032h]
        mov byte [byte eax+02h], 44h
        jmp short CreatePlayerScreen_8F5.22
CreatePlayerScreen_8F5:
        mov eax, dword [byte ebp+032h]
        mov byte [byte eax+02h], 47h
.22:
        cmp dword [byte ebp+04Ah], byte 4
        jne short .23
        mov eax, dword [byte ebp+032h]
        mov ecx, 11h
        mov edi, dword [AttributeDb]
        lea esi, [byte ebp-01Eh]
        jmp short .26
.23:
        cmp byte [byte ebp-022h], 0
        jne short .24
        mov byte [byte ebp-022h], 7
        jmp short .25
.24:
        movzx eax, byte [byte ebp-022h]
        imul eax, byte 6
        mov ebx, 0Fh
        cdq
        idiv ebx
        add eax, byte 7
        mov byte [byte ebp-022h], al
.25:
        mov eax, dword [byte ebp+032h]
        mov ecx, 15h
        mov edi, dword [AttributeDb]
        lea esi, [byte ebp-036h]
.26:
        add edi, dword [byte eax+024h]
        rep movsb
        mov eax, dword [byte ebp+032h]
        mov ebx, dword [CareerDb]
        mov edx, dword [AttributeDb]
        add ebx, dword [byte eax+028h]
        add edx, dword [byte eax+024h]
        call CreatePlayerRatings
        cmp dword [byte ebp+04Ah], byte 4
        jne short .27
        mov eax, dword [byte ebp+032h]
        mov edi, dword [CareerDb]
        mov ecx, 2Ch
        add edi, dword [byte eax+028h]
        xor eax, eax
        rep stosb
.27:
        mov eax, dword [TeamDb]
        movsx eax, byte [dword eax+0C34Fh]
        imul ebx, eax, byte 3Ch
        mov edx, 1Ch
        sub edx, dword [byte ebp+02Ah]
        mov eax, dword [RosterBackFile]
        shl edx, 2
        add ebx, 0C350h
        mov dword [edx+eax], ebx
        mov eax, dword [TeamDb]
        mov edx, 3
        inc byte [dword eax+0C34Fh]
        lea eax, [byte ebp-056h]
        call MakeDataPath
        push dword [TeamDbSize]
        push dword [TeamDb]
        lea eax, [byte ebp-056h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        mov edx, 5
        lea eax, [byte ebp-056h]
        call MakeDataPath
        push dword [AttributeDbSize]
        push dword [AttributeDb]
        lea eax, [byte ebp-056h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        mov edx, 0BAh
        lea eax, [byte ebp-056h]
        call MakeDataPath
        push dword [CareerDbSize]
        push dword [CareerDb]
        lea eax, [byte ebp-056h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        mov eax, 2
        call GetLangText
        mov dword [byte ebp+022h], eax
        mov eax, 3
        call GetLangText
        mov dword [byte ebp+026h], eax
        cmp dword [byte ebp+02Eh], byte 1
        jle near CreatePlayerScreen_BD2.29
        mov eax, dword [TeamDb]
        movsx eax, byte [dword eax+0C34Fh]
        cmp eax, byte 3Ch
        jge near CreatePlayerScreen_BD2.29
        push byte 2
        push byte 1
        push dword 0F0h
        push dword 140h
        mov eax, 203h
        mov ecx, TitleTextStyle
        push byte 0
        lea ebx, [byte ebp+022h]
        mov edx, 2
        call GetLangText
        call MessageBox
        test eax, eax
        jne near CreatePlayerScreen_BD2.29
        mov byte [byte ebp+016h], 0
        mov byte [byte ebp-0Ah], 0
        mov byte [byte ebp+06h], 0
        mov ecx, 11h
        lea edi, [byte ebp-01Eh]
        mov dword [byte ebp+036h], eax
        rep stosb
        mov ecx, 15h
        lea edi, [byte ebp-036h]
        xor eax, eax
        rep stosb
        push byte 0
        push byte 14h
        push dword 140h
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF38h
        push byte 0FFFFFFC4h
        push str_Bkgd19
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        lea eax, [byte ebp+06h]
        push eax
        lea eax, [byte ebp-0Ah]
        push eax
        push str_SS4
        lea eax, [byte ebp-07Ah]
        push eax
        xor ebx, ebx
        call sprintf_
        add esp, byte 10h
        xor edx, edx
        lea eax, [byte ebp-07Ah]
        call DrawColorText
        call SetScreenTarget
        push dword 0C8h
        push byte 3Ch
        push dword [byte esi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push esi
        call FreeBitmap
        add esp, byte 4
        push byte 0
        push byte 14h
        push byte 28h
        mov dword [byte ebp+046h], 5Ah
        mov dword [byte ebp+042h], 46h
        call CreateBitmap
        mov esi, eax
        add esp, byte 0Ch
        push eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF38h
        push dword 0FFFFFDEEh
        push str_Bkgd19
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        lea eax, [byte ebp+016h]
        add esp, byte 0Ch
        xor ebx, ebx
        xor edx, edx
        call DrawColorText
        call SetScreenTarget
        push dword 0C8h
        push dword 212h
        push dword [byte esi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push esi
        call FreeBitmap
        add esp, byte 4
        mov ecx, 5Ah
        push dword [byte ebp+03Eh]
        lea ebx, [byte ebp-01Eh]
        push byte 46h
        lea edx, [byte ebp-036h]
        mov eax, dword [byte ebp+04Ah]
        call DrawCreatePlayerRow
        jmp near CreatePlayerScreen_BD2.29
CreatePlayerScreen_BD2:
        lea eax, [byte ebp-0Ah]
        push eax
        push dword 0F0h
        mov ecx, 0Ch
        push dword 140h
        mov eax, 204h
        mov ebx, TitleTextStyle
        call GetLangText
        mov edx, eax
        xor eax, eax
        call EditText
        lea eax, [byte ebp+06h]
        push eax
        push dword 0F0h
        mov ecx, 0Ch
        push dword 140h
        mov eax, 205h
        mov ebx, TitleTextStyle
        call GetLangText
        mov edx, eax
        xor eax, eax
        call EditText
        push byte 0
        push byte 14h
        push dword 140h
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF38h
        push byte 0FFFFFFC4h
        push str_Bkgd19
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        lea eax, [byte ebp+06h]
        push eax
        lea eax, [byte ebp-0Ah]
        push eax
        push str_SS4
        lea eax, [byte ebp-07Ah]
        push eax
        xor ebx, ebx
        call sprintf_
        add esp, byte 10h
        xor edx, edx
        lea eax, [byte ebp-07Ah]
        call DrawColorText
        call SetScreenTarget
        push dword 0C8h
        push byte 3Ch
.28:
        push dword [byte esi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push esi
        call FreeBitmap
        add esp, byte 4
.29:
        cmp dword [byte ebp+036h], byte 0
        jne near CreatePlayerScreen_DBB.50
        push byte 3
        push byte 0
        lea eax, [byte ebp+056h]
        mov ecx, CycleLoadingArt
        push eax
        mov eax, dword [byte ebp+03Ah]
        mov ebx, 0FFFFFFFFh
        add eax, eax
        lea edx, [dword ebp-01F32h]
        add eax, byte 5
        mov dword [byte ebp+056h], 0FFFFFFFFh
        call RunMenu
        cmp dword [byte ebp+056h], byte 4
        ja near CreatePlayerScreen_DBB.40
        mov eax, dword [byte ebp+056h]
        jmp dword [nosplit cs:eax*4+jpt_9ADF0]
CreatePlayerScreen_CF7:
        mov byte [byte ebp+016h], 0
.30:
        lea eax, [byte ebp+016h]
        call atoi_
        cmp eax, byte 1
        jl short .31
        lea eax, [byte ebp+016h]
        call atoi_
        cmp eax, byte 63h
        jle short .32
.31:
        lea eax, [byte ebp+016h]
        push eax
        push dword 0F0h
        mov ecx, 3
        push dword 140h
        mov eax, 206h
        mov ebx, TitleTextStyle
        call GetLangText
        mov edx, eax
        xor eax, eax
        call EditText
        jmp short .30
.32:
        lea eax, [byte ebp+016h]
        call atoi_
        push eax
        push str_D12
        lea eax, [byte ebp+016h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push byte 0
        push byte 14h
        push byte 28h
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF38h
        push dword 0FFFFFDEEh
        push str_Bkgd19
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        lea eax, [byte ebp+016h]
        add esp, byte 0Ch
        xor ebx, ebx
        xor edx, edx
        call DrawColorText
        call SetScreenTarget
        push dword 0C8h
        push dword 212h
        jmp near CreatePlayerScreen_BD2.28
CreatePlayerScreen_DBB:
        mov eax, dword [byte ebp+04Ah]
        shl eax, 4
        mov esi, eax
        lea edi, [byte eax+010h]
.33:
        push str_GOL0
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_GOL0
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [dword esi+ebp-010Ah]
        call PutBlock
        add esp, byte 0Ch
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.34:
        call TickDeadlinePassed
        test eax, eax
        je short .34
        add esi, byte 4
        cmp esi, edi
        jne short .33
        inc dword [byte ebp+04Ah]
        mov eax, dword [byte ebp+04Ah]
        mov ebx, 5
        cdq
        idiv ebx
        mov eax, edx
        shl eax, 4
        mov dword [byte ebp+04Ah], edx
        mov esi, eax
        lea edi, [byte eax+010h]
.35:
        push str_GOL0
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_GOL0
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [dword esi+ebp-016Ah]
        call PutBlock
        add esp, byte 0Ch
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.36:
        call TickDeadlinePassed
        test eax, eax
        je short .36
        add esi, byte 4
        cmp esi, edi
        jne short .35
        mov ebx, dword [byte ebp+04Ah]
        push dword [byte ebp+03Eh]
        mov ecx, dword [byte ebp+046h]
        lea edx, [byte ebp-036h]
        mov eax, dword [dword ebp+ebx*8-0AAh]
        push dword [byte ebp+042h]
        mov dword [dword ebp-01D80h], eax
        mov eax, dword [dword ebp+ebx*8-0A6h]
        lea ebx, [byte ebp-01Eh]
        mov dword [dword ebp-01D7Ch], eax
        mov eax, dword [byte ebp+04Ah]
        call DrawCreatePlayerRow
        cmp dword [byte ebp+04Ah], byte 4
        jne short .38
        mov dword [byte ebp+03Ah], 9
        mov dword [byte ebp+052h], 0
        mov edx, dword [byte ebp+07Ah]
        lea ebx, [dword ebp-06FEh]
.37:
        mov ecx, 4
        mov esi, ebx
        mov edi, edx
        inc dword [byte ebp+052h]
        rep movsb
        add edx, byte 66h
        add ebx, byte 10h
        cmp dword [byte ebp+052h], byte 21h
        jge near CreatePlayerScreen_BD2.29
        jmp short .37
.38:
        mov dword [byte ebp+03Ah], 0Eh
        mov dword [byte ebp+052h], 0
        mov edx, dword [byte ebp+07Ah]
        lea ebx, [dword ebp-04EEh]
.39:
        mov ecx, 4
        mov esi, ebx
        mov edi, edx
        inc dword [byte ebp+052h]
        rep movsb
        add edx, byte 66h
        add ebx, byte 10h
        cmp dword [byte ebp+052h], byte 21h
        jge near CreatePlayerScreen_BD2.29
        jmp short .39
.40:
        mov ecx, dword [byte ebp+056h]
        sub ecx, byte 5
        mov eax, ecx
        cdq
        LD sub, eax, edx
        sar eax, 1
        cmp dword [byte ebp+04Ah], byte 4
        je short .41
        movsx ebx, byte [dword eax+SkaterRatingOrder]
        lea eax, [byte ebp-036h]
        jmp short .42
.41:
        movsx ebx, byte [dword eax+GoalieRatingOrder]
        lea eax, [byte ebp-01Eh]
.42:
        add ebx, eax
        mov eax, ecx
        mov esi, 2
        cdq
        idiv esi
        test edx, edx
        jne short .44
        cmp byte [ebx], 0
        je short .44
        dec byte [ebx]
        cmp dword [byte ebp+04Ah], byte 4
        jne short .43
        inc dword [byte ebp+042h]
        jmp near .49
.43:
        mov eax, ecx
        cdq
        idiv esi
        cmp eax, byte 0Bh
        je near .49
        inc dword [byte ebp+046h]
        jmp near .49
.44:
        cmp dword [byte ebp+046h], byte 0
        jle short .45
        cmp dword [byte ebp+04Ah], byte 4
        jne short .47
.45:
        mov eax, ecx
        cdq
        LD sub, eax, edx
        sar eax, 1
        cmp eax, byte 0Bh
        jne short .46
        cmp dword [byte ebp+04Ah], byte 4
        jne short .47
.46:
        cmp dword [byte ebp+042h], byte 0
        jle short .49
        cmp dword [byte ebp+04Ah], byte 4
        jne short .49
.47:
        movsx eax, byte [ebx]
        cmp eax, byte 0Eh
        je short .49
        mov eax, ecx
        mov esi, 2
        cdq
        idiv esi
        cmp edx, byte 1
        jne short .49
        inc byte [ebx]
        cmp dword [byte ebp+04Ah], byte 4
        jne short .48
        sub dword [byte ebp+042h], edx
        jmp short .49
.48:
        mov eax, ecx
        cdq
        idiv esi
        cmp eax, byte 0Bh
        je short .49
        dec dword [byte ebp+046h]
.49:
        push dword [byte ebp+03Eh]
        mov ecx, dword [byte ebp+046h]
        lea ebx, [byte ebp-01Eh]
        lea edx, [byte ebp-036h]
        push dword [byte ebp+042h]
        mov eax, dword [byte ebp+04Ah]
        call DrawCreatePlayerRow
        mov ecx, dword [byte ebp+04Ah]
        lea ebx, [byte ebp-036h]
        lea edx, [byte ebp-01Eh]
        lea eax, [dword ebp-0120Ah]
        call CreatePlayerLimits
        jmp near CreatePlayerScreen_BD2.29
.50:
        mov eax, 3
        mov dword [byte ebp+052h], 0
        mov edi, 24h
        call FadeOut
.51:
        mov dword [byte ebp+076h], edi
        imul esi, dword [byte ebp+052h], byte 24h
.52:
        push dword [dword esi+ebp-021Eh]
        call FreeBitmap
        add esi, byte 4
        add esp, byte 4
        cmp esi, dword [byte ebp+076h]
        jne short .52
        inc dword [byte ebp+052h]
        add edi, byte 24h
        cmp dword [byte ebp+052h], byte 5
        jl short .51
        push dword [byte ebp+03Eh]
        call FreeBitmap
        add esp, byte 4
        push dword [CreatePlayerShapes]
        call FreeMemBlock
        add esp, byte 4
        jmp near EditPlayerName_131
;-----------------------------------------------------------------------------
; DrawCreatePlayerRow                             9BEA0  96 PC, low confidence
; One rating row (text and RatingBar) on the create player screen
;-----------------------------------------------------------------------------
DrawCreatePlayerRow:
        push esi
        push edi
        enter 30h, 0
        push eax
        push edx
        push ebx
        mov esi, ecx
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
        push dword [byte ebp+014h]
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF06h
        push byte 0FFFFFFA1h
        push str_Bkgd19
        push dword [CreatePlayerShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov dword [byte ebp-04h], 28h
        call PutBlock
        mov eax, 207h
        add esp, byte 0Ch
        xor ebx, ebx
        xor edx, edx
        call GetLangText
        call DrawColorText
        cmp dword [byte ebp-034h], byte 4
        jne short .1
        push dword 0DEh
        push byte 0Ah
        mov ecx, 78h
        push dword 14Ah
        mov edx, 46h
        mov eax, dword [byte ebp+010h]
        push byte 5
        xor ebx, ebx
        mov dword [byte ebp-010h], 9
        jmp short .2
.1:
        push dword 0DEh
        push byte 0Ah
        mov ecx, 78h
        push dword 14Ah
        mov edx, 5Ah
        mov eax, esi
        push byte 5
        xor ebx, ebx
        mov dword [byte ebp-010h], 0Eh
.2:
        call RatingBar
        mov eax, dword [byte ebp-04h]
        xor esi, esi
        add eax, byte 5
        xor edi, edi
        mov dword [byte ebp-08h], eax
        jmp near .8
.3:
        mov eax, esi
        mov ebx, 2
        cdq
        idiv ebx
        mov ebx, edx
        cmp dword [byte ebp-034h], byte 4
        jne short .4
        mov eax, dword [dword edi+GoalieRatingTextIds]
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-030h]
        call strcpy_
        movsx eax, byte [dword esi+GoalieRatingOrder]
        add eax, dword [byte ebp-03Ch]
        jmp short .5
.4:
        mov eax, dword [dword edi+SkaterRatingTextIds]
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-030h]
        call strcpy_
        movsx eax, byte [dword esi+SkaterRatingOrder]
        add eax, dword [byte ebp-038h]
.5:
        movsx eax, byte [eax]
        shl eax, 2
        add eax, byte 28h
        mov dword [byte ebp-0Ch], eax
        test ebx, ebx
        jne short .6
        mov ebx, dword [byte ebp-04h]
        mov edx, 64h
        lea eax, [byte ebp-030h]
        call DrawColorTextRight
        push dword 0DEh
        push byte 0Ah
        mov ecx, 6Eh
        push byte 64h
        mov edx, 64h
        mov eax, dword [byte ebp-0Ch]
        push dword [byte ebp-08h]
        xor ebx, ebx
        call RatingBar
        jmp short .7
.6:
        mov ebx, dword [byte ebp-04h]
        mov edx, 15Eh
        lea eax, [byte ebp-030h]
        call DrawColorText
        push dword 0DEh
        push byte 0Ah
        mov ecx, 0F0h
        mov ebx, 1
        push byte 64h
        mov edx, 64h
        mov eax, dword [byte ebp-0Ch]
        push dword [byte ebp-08h]
        add dword [byte ebp-04h], byte 14h
        call RatingBar
        add dword [byte ebp-08h], byte 14h
.7:
        add edi, byte 4
        inc esi
.8:
        cmp esi, dword [byte ebp-010h]
        jl near .3
        call SetScreenTarget
        push dword 0FAh
        mov eax, dword [byte ebp+014h]
        push byte 5Fh
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        jmp near DrawRosterTeams_17B
;-----------------------------------------------------------------------------
; RatingBar                                    9C060  96 PC, medium confidence
; (value, x, y, w, h): draws a rating bar (FillRect)
;-----------------------------------------------------------------------------
RatingBar:
        push esi
        push edi
        enter 1Ch, 0
        push eax
        push edx
        push ebx
        mov edi, ecx
        xor esi, esi
        push esi
        push dword [byte ebp+018h]
        push dword [byte ebp+014h]
        push dword [byte ebp+010h]
        push ecx
        call FillRect
        mov eax, dword [byte ebp+014h]
        cdq
        shl edx, 3
        LD sbb, eax, edx
        sar eax, 3
        mov ebx, dword [byte ebp+014h]
        imul ebx, dword [byte ebp-020h]
        mov ecx, eax
        mov eax, dword [byte ebp+018h]
        dec eax
        add esp, byte 14h
        mov dword [byte ebp-04h], eax
        cmp dword [byte ebp-028h], byte 0
        jne short .4
        mov eax, ebx
        cdq
        idiv dword [byte ebp-024h]
        mov ebx, edi
        mov dword [byte ebp-08h], ecx
        add ebx, eax
        mov eax, dword [byte ebp-04h]
        mov dword [byte ebp-0Ch], ebx
        mov dword [byte ebp-018h], eax
        jmp short .3
.1:
        inc esi
        cmp esi, dword [byte ebp-08h]
        jle short .2
        inc dword [byte ebp+01Ch]
        xor esi, esi
.2:
        push dword [byte ebp+01Ch]
        push dword [byte ebp-018h]
        push byte 1
        push dword [byte ebp+010h]
        push edi
        call FillRect
        add esp, byte 14h
        inc edi
.3:
        cmp edi, dword [byte ebp-0Ch]
        jge short .8
        jmp short .1
.4:
        mov eax, ebx
        cdq
        idiv dword [byte ebp-024h]
        add edi, dword [byte ebp+014h]
        mov ebx, edi
        mov dword [byte ebp-014h], ecx
        sub ebx, eax
        mov eax, dword [byte ebp-04h]
        mov dword [byte ebp-010h], ebx
        mov dword [byte ebp-01Ch], eax
        jmp short .7
.5:
        inc esi
        cmp esi, dword [byte ebp-014h]
        jle short .6
        inc dword [byte ebp+01Ch]
        xor esi, esi
.6:
        push dword [byte ebp+01Ch]
        push dword [byte ebp-01Ch]
        push byte 1
        push dword [byte ebp+010h]
        push edi
        call FillRect
        add esp, byte 14h
        dec edi
.7:
        cmp edi, dword [byte ebp-010h]
        jg short .5
.8:
        leave
        pop edi
        pop esi
        ret 10h
;-----------------------------------------------------------------------------
; CreatePlayerLimits                              9C127  96 PC, low confidence
; Applies the rating limits when creating a player
;-----------------------------------------------------------------------------
CreatePlayerLimits:
        push esi
        push edi
        enter 8, 0
        push edx
        push ebx
        mov edi, ecx
        cmp ecx, byte 4
        jne short .1
        mov dword [byte ebp-08h], 9
        jmp short .2
.1:
        mov dword [byte ebp-08h], 0Eh
.2:
        mov ebx, eax
        xor ecx, ecx
        jmp near .8
.3:
        cmp edi, byte 4
        je short .4
        movsx esi, byte [dword ecx+SkaterRatingOrder]
        add esi, dword [byte ebp-010h]
        jmp short .5
.4:
        movsx esi, byte [dword ecx+GoalieRatingOrder]
        add esi, dword [byte ebp-0Ch]
.5:
        mov eax, ecx
        mov dword [byte ebp-04h], 2
        cdq
        idiv dword [byte ebp-04h]
        test edx, edx
        jne short .6
        mov dword [byte ebx+018h], 0CDh
        mov eax, dword [byte ebx+018h]
        mov dword [ebx], eax
        movsx eax, byte [esi]
        lea eax, [eax+eax*4]
        add eax, 0DBh
        mov dword [byte ebx+010h], eax
        mov dword [byte ebx+08h], eax
        movsx eax, byte [esi]
        lea eax, [eax+eax*4]
        mov dword [byte ebx+050h], 131h
        add eax, 0E6h
        mov dword [byte ebx+058h], eax
        mov dword [byte ebx+040h], eax
        mov eax, dword [byte ebx+050h]
        mov dword [byte ebx+048h], eax
        jmp short .7
.6:
        mov edx, 19Ah
        movsx eax, byte [esi]
        mov dword [byte ebx+010h], 1B3h
        lea eax, [eax+eax*4]
        mov dword [byte ebx+058h], 14Fh
        sub edx, eax
        mov dword [byte ebx+018h], edx
        mov eax, dword [byte ebx+010h]
        mov dword [ebx], edx
        mov dword [byte ebx+08h], eax
        mov eax, dword [byte ebx+058h]
        mov dword [byte ebx+040h], eax
        movsx eax, byte [esi]
        mov edx, 194h
        lea eax, [eax+eax*4]
        sub edx, eax
        mov dword [byte ebx+050h], edx
        mov dword [byte ebx+048h], edx
.7:
        mov eax, ecx
        cdq
        LD sub, eax, edx
        sar eax, 1
        imul eax, byte 14h
        add ebx, 80h
        lea edx, [dword eax+0127h]
        mov dword [byte ebx-074h], edx
        mov dword [byte ebx-07Ch], edx
        mov dword [byte ebx-034h], edx
        add eax, 131h
        mov dword [byte ebx-03Ch], edx
        mov dword [byte ebx-064h], eax
        mov dword [byte ebx-06Ch], eax
        mov dword [byte ebx-024h], eax
        inc ecx
        mov dword [byte ebx-02Ch], eax
.8:
        cmp ecx, dword [byte ebp-08h]
        jl near .3
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; CreatePlayerRatings                             9C238  96 PC, low confidence
; Random ratings for a created player around the picked levels
;-----------------------------------------------------------------------------
CreatePlayerRatings:
        push ecx
        push esi
        push edi
        enter 64h, 0
        mov esi, eax
        mov al, byte [byte edx+01h]
        movzx eax, al
        add eax, byte 5
        lea eax, [eax+eax*4]
        mov dword [byte ebp-04h], eax
        mov al, byte [byte edx+02h]
        movzx eax, al
        add eax, byte 5
        lea eax, [eax+eax*4]
        mov dword [byte ebp-044h], eax
        mov al, byte [byte edx+04h]
        movzx eax, al
        add eax, byte 5
        lea eax, [eax+eax*4]
        mov dword [byte ebp-058h], eax
        mov al, byte [byte edx+05h]
        movzx eax, al
        add eax, byte 5
        lea eax, [eax+eax*4]
        mov dword [byte ebp-050h], eax
        mov al, byte [byte edx+06h]
        movzx eax, al
        add eax, byte 5
        lea eax, [eax+eax*4]
        mov dword [byte ebp-040h], eax
        mov al, byte [byte edx+07h]
        movzx eax, al
        add eax, byte 5
        lea eax, [eax+eax*4]
        mov dword [byte ebp-03Ch], eax
        mov al, byte [byte edx+09h]
        movzx eax, al
        add eax, byte 5
        lea eax, [eax+eax*4]
        fild dword [byte ebp-04h]
        mov dword [byte ebp-04h], eax
        mov al, byte [byte edx+0Ah]
        fstp dword [byte ebp-034h]
        movzx eax, al
        fild dword [byte ebp-044h]
        add eax, byte 5
        fstp dword [byte ebp-030h]
        lea eax, [eax+eax*4]
        fild dword [byte ebp-058h]
        mov dword [byte ebp-044h], eax
        mov al, byte [byte edx+0Bh]
        fstp dword [byte ebp-04Ch]
        movzx eax, al
        fild dword [byte ebp-050h]
        add eax, byte 5
        fstp dword [byte ebp-010h]
        lea eax, [eax+eax*4]
        fild dword [byte ebp-040h]
        mov dword [byte ebp-040h], eax
        mov al, byte [byte edx+0Ch]
        fstp dword [byte ebp-064h]
        movzx eax, al
        fild dword [byte ebp-03Ch]
        add eax, byte 5
        fstp dword [byte ebp-02Ch]
        lea eax, [eax+eax*4]
        fild dword [byte ebp-04h]
        mov dword [byte ebp-04h], eax
        mov al, byte [byte edx+0Dh]
        fstp dword [byte ebp-028h]
        movzx eax, al
        fild dword [byte ebp-044h]
        add eax, byte 5
        fstp dword [byte ebp-014h]
        lea eax, [eax+eax*4]
        fild dword [byte ebp-040h]
        mov dword [byte ebp-03Ch], eax
        mov al, byte [byte edx+0Eh]
        fstp dword [byte ebp-024h]
        movzx eax, al
        fild dword [byte ebp-04h]
        add eax, byte 5
        fstp dword [byte ebp-0Ch]
        lea eax, [eax+eax*4]
        fild dword [byte ebp-03Ch]
        mov dword [byte ebp-03Ch], eax
        fstp dword [byte ebp-054h]
        fild dword [byte ebp-03Ch]
        fstp dword [byte ebp-038h]
        call rand_
        mov ecx, 14Dh
        cdq
        idiv ecx
        mov dword [byte ebp-04h], edx
        fild dword [byte ebp-04h]
        fmul dword [F32_0p001]
        fld1
        fsubrp
        mov ecx, 15h
        fstp dword [byte ebp-048h]
        call rand_
        cdq
        idiv ecx
        add edx, byte 1Ch
        mov dword [byte ebp-03Ch], edx
        fild dword [byte ebp-03Ch]
        fmul dword [F32_0p0208333]
        fstp dword [byte ebp-08h]
        fld dword [byte ebp-014h]
        fld st0
        fld dword [byte ebp-054h]
        fxch
        fadd st1
        fadd dword [byte ebp-038h]
        fmul dword [F32_0p00333333]
        fmul dword [F32_390]
        fmul dword [byte ebp-08h]
        fmul dword [byte ebp-048h]
        call __CHP
        fistp dword [byte ebp-04h]
        fld st1
        fadd dword [byte ebp-024h]
        fmul dword [F32_0p005]
        fmul dword [F32_100]
        fadd dword [F32_neg50]
        fmul dword [byte ebp-08h]
        mov eax, dword [byte ebp-03Ch]
        fmul dword [byte ebp-048h]
        mov word [ebx], ax
        mov eax, dword [byte ebp-04h]
        call __CHP
        fistp dword [byte ebp-04h]
        fld dword [byte ebp-030h]
        faddp st2
        fxch
        fadd dword [byte ebp-064h]
        mov word [byte ebx+0Eh], ax
        fadd dword [byte ebp-034h]
        mov eax, dword [byte ebp-04h]
        faddp
        mov word [byte ebx+010h], ax
        fmul dword [F32_0p002]
        movsx eax, byte [byte esi+02h]
        fstp dword [byte ebp-020h]
        cmp eax, byte 44h
        je short .1
        fld dword [byte ebp-038h]
        fld st0
        fmul dword [F32_0p0142857]
        fstp dword [byte ebp-01Ch]
        fsubr dword [F32_100]
        fmul dword [F32_0p0333333]
        jmp short .2
.1:
        fld dword [byte ebp-038h]
        fld st0
        fmul dword [F32_0p0111111]
        fstp dword [byte ebp-01Ch]
        fsubr dword [F32_100]
        fmul dword [F32_0p1]
.2:
        fstp dword [byte ebp-018h]
        fld1
        fcomp dword [byte ebp-01Ch]
        fnstsw ax
        sahf
        jbe short .3
        fld dword [byte ebp-01Ch]
        fmul dword [F32_58]
        call __CHP
        fistp dword [byte ebp-04h]
        mov eax, dword [byte ebp-04h]
        movzx ecx, ax
        jmp short .4
.3:
        mov ecx, 3Ah
.4:
        fld1
        fcomp dword [byte ebp-018h]
        fnstsw ax
        sahf
        jbe short .5
        fld dword [byte ebp-018h]
        fmul dword [F32_90]
        call __CHP
        fistp dword [byte ebp-04h]
        mov eax, dword [byte ebp-04h]
        movzx edx, ax
        jmp short .6
.5:
        mov edx, 5Ah
.6:
        fld dword [byte ebp-04Ch]
        fadd dword [byte ebp-02Ch]
        movzx eax, cx
        fmul dword [F32_0p005]
        mov dword [byte ebp-03Ch], eax
        fild dword [byte ebp-03Ch]
        fmulp
        movzx eax, dx
        fld dword [byte ebp-028h]
        fmul dword [F32_0p01]
        mov dword [byte ebp-04h], eax
        fild dword [byte ebp-04h]
        fmulp
        fld dword [byte ebp-020h]
        fmul to st2
        fxch st2
        fld dword [byte ebp-08h]
        fxch
        fmul st1
        fld dword [byte ebp-048h]
        fxch
        fmul st1
        call __CHP
        fistp dword [byte ebp-04h]
        fxch st3
        fmulp st2
        fmulp
        mov eax, dword [byte ebp-04h]
        fmulp
        mov ecx, eax
        call __CHP
        fistp dword [byte ebp-04h]
        mov eax, dword [byte ebp-04h]
        movzx edi, cx
        movzx esi, ax
        mov edx, eax
        lea eax, [edi+esi]
        cmp eax, 80h
        jle short .7
        cdq
        shl edx, 7
        LD sbb, eax, edx
        sar eax, 7
        mov ecx, eax
        mov eax, edi
        cdq
        idiv ecx
        mov ecx, eax
        movzx eax, ax
        add eax, esi
        cdq
        shl edx, 7
        LD sbb, eax, edx
        sar eax, 7
        mov edi, eax
        mov eax, esi
        cdq
        idiv edi
        mov edx, eax
.7:
        mov word [byte ebx+02h], cx
        mov ax, word [byte ebx+02h]
        mov word [byte ebx+04h], dx
        add eax, edx
        mov word [byte ebx+06h], ax
        movzx eax, word [byte ebx+02h]
        mov ecx, 0Ah
        cdq
        idiv ecx
        mov word [byte ebx+08h], ax
        test ax, ax
        jbe short .8
        movzx ecx, ax
        call rand_
        cdq
        idiv ecx
        mov word [byte ebx+0Ah], dx
        jmp short .9
.8:
        mov word [byte ebx+0Ah], 0
.9:
        fld dword [byte ebp-0Ch]
        fmul qword [F64_0p9]
        fstp dword [byte ebp-0Ch]
        fld dword [byte ebp-010h]
        fmul qword [F64_0p1_CreatePlayerRatings]
        fstp dword [byte ebp-010h]
        fld dword [byte ebp-0Ch]
        fadd dword [byte ebp-010h]
        fmul dword [F32_0p01]
        fmul dword [F32_347]
        fmul dword [byte ebp-08h]
        fmul dword [byte ebp-048h]
        call __CHP
        fistp dword [byte ebp-04h]
        mov eax, dword [byte ebp-04h]
        mov word [byte ebx+0Ch], ax
        leave
        pop edi
        pop esi
        pop ecx
        ret
        movzx eax, al
        add eax, byte 5
        lea eax, [eax+eax*4]
        ret
;-----------------------------------------------------------------------------
; CompareRankA                                    9C5AF  96 PC, low confidence
; Qsort compare by TeamRatingScore
;-----------------------------------------------------------------------------
CompareRankA:
        push ebx
        mov edx, dword [edx]
        mov ebx, dword [eax]
        mov eax, dword [nosplit edx*4+TeamRatingScore]
        sub eax, dword [nosplit ebx*4+TeamRatingScore]
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompareRankB                                    9C5C4  96 PC, low confidence
; Qsort compare by TeamScoringScore
;-----------------------------------------------------------------------------
CompareRankB:
        push ebx
        mov edx, dword [edx]
        mov ebx, dword [eax]
        mov eax, dword [nosplit edx*4+TeamScoringScore]
        sub eax, dword [nosplit ebx*4+TeamScoringScore]
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SortTeamRatings                              9C5D9  96 PC, medium confidence
; Sorts the player ratings of a team and totals the best ones
;-----------------------------------------------------------------------------
SortTeamRatings:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 64h, 0
        mov edi, eax
        xor esi, esi
        xor edx, edx
        xor eax, eax
        jmp short .2
.1:
        mov dword [byte eax+ebp-064h], edx
        add eax, byte 4
        inc edx
.2:
        cmp edx, edi
        jl short .1
        mov ecx, CompareRankA
        mov ebx, 4
        lea eax, [byte ebp-064h]
        mov edx, edi
        call qsort_
        xor edx, edx
        xor eax, eax
        jmp short .8
.3:
        cmp edx, byte 5
        jge short .5
        mov ebx, dword [byte eax+ebp-064h]
        imul ebx, dword [nosplit ebx*4+TeamRatingScore], byte 3
.4:
        add esi, ebx
        jmp short .7
.5:
        cmp edx, byte 0Ah
        jge short .6
        mov ebx, dword [byte eax+ebp-064h]
        mov ebx, dword [nosplit ebx*4+TeamRatingScore]
        add ebx, ebx
        jmp short .4
.6:
        cmp edx, byte 16h
        jge short .7
        mov ebx, dword [byte eax+ebp-064h]
        add esi, dword [nosplit ebx*4+TeamRatingScore]
.7:
        add eax, byte 4
        inc edx
.8:
        cmp edx, edi
        jl short .3
        mov eax, esi
        jmp near RunRosterScreens_230
;-----------------------------------------------------------------------------
; TeamRankScoring                                 9C65A  96 PC, low confidence
; Team rating from one player rating, for the team ranks
;-----------------------------------------------------------------------------
TeamRankScoring:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        imul eax, dword 31Bh
        mov ebx, dword [statsplayoffs]
        xor edx, edx
        add eax, ebx
        xor ebx, ebx
.1:
        mov esi, ebx
        shl esi, 2
        cmp dword [byte eax+063h], byte 0FFFFFFFFh
        je short .2
        mov ecx, dword [TeamDb]
        mov edi, dword [CareerDb]
        add ecx, dword [byte eax+063h]
        add edi, dword [byte ecx+028h]
        movzx ecx, word [byte edi+06h]
        inc edx
        mov dword [dword esi+TeamRatingScore], ecx
.2:
        inc ebx
        add eax, byte 4
        cmp ebx, byte 19h
        jl short .1
TeamRankScoring_48:
        mov eax, edx
TeamRankScoring_4A:
        call SortTeamRatings
        jmp near RunRosterScreens_231
;-----------------------------------------------------------------------------
; TeamRankSkating                                 9C6AE  96 PC, low confidence
; Team rating from another player rating, for the team ranks
;-----------------------------------------------------------------------------
TeamRankSkating:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        imul eax, dword 31Bh
        mov ebx, dword [statsplayoffs]
        xor edx, edx
        add eax, ebx
        xor ebx, ebx
.1:
        mov esi, ebx
        shl esi, 2
        cmp dword [byte eax+063h], byte 0FFFFFFFFh
        je short .2
        mov ecx, dword [TeamDb]
        mov edi, dword [CareerDb]
        add ecx, dword [byte eax+063h]
        add edi, dword [byte ecx+028h]
        movzx ecx, word [byte edi+08h]
        inc edx
        mov dword [dword esi+TeamRatingScore], ecx
.2:
        inc ebx
        add eax, byte 4
        cmp ebx, byte 19h
        jl short .1
        jmp short TeamRankScoring_48
;-----------------------------------------------------------------------------
; TeamRankOffence                                 9C6F8  96 PC, low confidence
; Team rating from three skater ratings, for the team ranks
;-----------------------------------------------------------------------------
TeamRankOffence:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        imul eax, dword 31Bh
        mov ebx, dword [statsplayoffs]
        xor esi, esi
        xor ecx, ecx
        add ebx, eax
.1:
        mov eax, ecx
        shl eax, 2
        cmp dword [byte ebx+063h], byte 0FFFFFFFFh
        je short .2
        mov edx, dword [TeamDb]
        mov edi, dword [AttributeDb]
        add edx, dword [byte ebx+063h]
        add edi, dword [byte edx+024h]
        mov edx, edi
        movzx edi, byte [byte edi+03h]
        mov dword [dword eax+TeamRatingScore], edi
        movzx edi, byte [byte edx+0Bh]
        add dword [dword eax+TeamRatingScore], edi
        inc esi
        movzx edx, byte [byte edx+05h]
        add dword [dword eax+TeamRatingScore], edx
.2:
        inc ecx
        add ebx, byte 4
        cmp ecx, byte 19h
        jl short .1
        mov eax, esi
        jmp near TeamRankScoring_4A
;-----------------------------------------------------------------------------
; TeamRankDefence                                 9C75D  96 PC, low confidence
; Team rating from three other skater ratings, for the team ranks
;-----------------------------------------------------------------------------
TeamRankDefence:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        imul edx, eax, dword 31Bh
        xor ecx, ecx
        mov eax, dword [statsplayoffs]
        xor esi, esi
        lea ebx, [eax+edx]
.1:
        mov eax, esi
        shl eax, 2
        cmp dword [byte ebx+063h], byte 0FFFFFFFFh
        je short .2
        mov edx, dword [TeamDb]
        mov edi, dword [AttributeDb]
        add edx, dword [byte ebx+063h]
        add edi, dword [byte edx+024h]
        mov edx, edi
        movzx edi, byte [byte edi+02h]
        mov dword [dword eax+TeamRatingScore], edi
        movzx edi, byte [byte edx+01h]
        add dword [dword eax+TeamRatingScore], edi
        movzx edi, byte [byte edx+0Bh]
        add dword [dword eax+TeamRatingScore], edi
        inc ecx
        movzx edx, byte [byte edx+05h]
        add dword [dword eax+TeamRatingScore], edx
.2:
        inc esi
        add ebx, byte 4
        cmp esi, byte 19h
        jl short .1
        mov eax, ecx
        jmp near TeamRankScoring_4A
;-----------------------------------------------------------------------------
; TeamRankGoalie                                  9C7CC  96 PC, low confidence
; Team rating from the starting goalie, for the team ranks
;-----------------------------------------------------------------------------
TeamRankGoalie:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        mov ebx, eax
        imul edx, eax, dword 31Bh
        mov eax, dword [statsplayoffs]
        add edx, eax
        xor ecx, ecx
        mov eax, edx
        add edx, byte 0Ch
        xor esi, esi
        mov dword [byte ebp-04h], edx
.1:
        cmp dword [dword eax+0C7h], byte 0FFFFFFFFh
        je short .2
        mov edx, dword [TeamDb]
        mov edi, dword [CareerDb]
        add edx, dword [dword eax+0C7h]
        add edi, dword [byte edx+028h]
        mov edx, edi
        movzx edi, word [byte edi+012h]
        movzx edx, word [byte edx+0Eh]
        add ecx, edi
        add esi, edx
.2:
        add eax, byte 4
        cmp eax, dword [byte ebp-04h]
        jne short .1
        cmp ebx, byte 1Ah
        jge short .3
        test ecx, ecx
        jle short .3
        imul eax, esi, dword 3E8h
        cdq
        idiv ecx
        mov edx, 3E8h
        sub edx, eax
        mov eax, edx
        jmp near RunRosterScreens_230
.3:
        cmp ebx, byte 1Ah
        jge short .4
        xor eax, eax
        jmp near RunRosterScreens_230
.4:
        jne short .5
        mov eax, 3E8h
        jmp near RunRosterScreens_230
.5:
        mov eax, 3E7h
        jmp near RunRosterScreens_230
;-----------------------------------------------------------------------------
; ComputeTeamRanks                             9C866  96 PC, medium confidence
; The teams' ranks (26 or 28 teams by optflags) from their rosters' ratings
; (qsort), for the team select and pre-game screens
;-----------------------------------------------------------------------------
ComputeTeamRanks:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 74h, 0
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 10h
        je short .1
        cmp eax, byte 20h
        jne short .2
.1:
        mov esi, 1Ah
        jmp short .3
.2:
        mov esi, 1Ch
.3:
        mov dword [byte ebp-04h], 0
        xor edx, edx
        jmp short .5
.4:
        add edx, byte 4
        mov eax, dword [byte ebp-04h]
        inc dword [byte ebp-04h]
        mov dword [byte edx+ebp-078h], eax
        call TeamRankScoring
        mov dword [dword edx+TeamScoringScore-4], eax
.5:
        cmp esi, dword [byte ebp-04h]
        jg short .4
        mov ecx, CompareRankB
        mov ebx, 4
        lea eax, [byte ebp-074h]
        mov edx, esi
        mov dword [byte ebp-04h], 0
        call qsort_
        xor eax, eax
        jmp short .7
.6:
        add eax, byte 4
        mov edx, dword [gameopts]
        mov bl, byte [byte ebp-04h]
        add edx, dword [byte eax+ebp-078h]
        inc bl
        inc dword [byte ebp-04h]
        mov byte [byte edx+011h], bl
.7:
        cmp esi, dword [byte ebp-04h]
        jg short .6
        mov dword [byte ebp-04h], 0
        xor edx, edx
        jmp short .9
.8:
        add edx, byte 4
        mov eax, dword [byte ebp-04h]
        inc dword [byte ebp-04h]
        mov dword [byte edx+ebp-078h], eax
        call TeamRankDefence
        mov dword [dword edx+TeamScoringScore-4], eax
.9:
        cmp esi, dword [byte ebp-04h]
        jg short .8
        mov ecx, CompareRankB
        mov ebx, 4
        lea eax, [byte ebp-074h]
        mov edx, esi
        mov dword [byte ebp-04h], 0
        call qsort_
        xor eax, eax
        jmp short .11
.10:
        add eax, byte 4
        mov edx, dword [gameopts]
        mov bl, byte [byte ebp-04h]
        add edx, dword [byte eax+ebp-078h]
        inc bl
        inc dword [byte ebp-04h]
        mov byte [byte edx+02Dh], bl
.11:
        cmp esi, dword [byte ebp-04h]
        jg short .10
        mov dword [byte ebp-04h], 0
        xor edx, edx
        jmp short .13
.12:
        add edx, byte 4
        mov eax, dword [byte ebp-04h]
        inc dword [byte ebp-04h]
        mov dword [byte edx+ebp-078h], eax
        call TeamRankOffence
        mov dword [dword edx+TeamScoringScore-4], eax
.13:
        cmp esi, dword [byte ebp-04h]
        jg short .12
        mov ecx, CompareRankB
        mov ebx, 4
        lea eax, [byte ebp-074h]
        mov edx, esi
        mov dword [byte ebp-04h], 0
        call qsort_
        xor eax, eax
        jmp short .15
.14:
        add eax, byte 4
        mov edx, dword [gameopts]
        mov bl, byte [byte ebp-04h]
        add edx, dword [byte eax+ebp-078h]
        inc bl
        inc dword [byte ebp-04h]
        mov byte [byte edx+049h], bl
.15:
        cmp esi, dword [byte ebp-04h]
        jg short .14
        mov dword [byte ebp-04h], 0
        xor edx, edx
        jmp short .17
.16:
        add edx, byte 4
        mov eax, dword [byte ebp-04h]
        inc dword [byte ebp-04h]
        mov dword [byte edx+ebp-078h], eax
        call TeamRankGoalie
        mov dword [dword edx+TeamScoringScore-4], eax
.17:
        cmp esi, dword [byte ebp-04h]
        jg short .16
        mov ecx, CompareRankB
        mov ebx, 4
        lea eax, [byte ebp-074h]
        mov edx, esi
        mov dword [byte ebp-04h], 0
        call qsort_
        xor eax, eax
        jmp short .19
.18:
        add eax, byte 4
        mov edx, dword [gameopts]
        mov bl, byte [byte ebp-04h]
        add edx, dword [byte eax+ebp-078h]
        inc bl
        inc dword [byte ebp-04h]
        mov byte [byte edx+065h], bl
.19:
        cmp esi, dword [byte ebp-04h]
        jg short .18
        mov dword [byte ebp-04h], 0
        xor edx, edx
        jmp short .21
.20:
        add edx, byte 4
        mov eax, dword [byte ebp-04h]
        inc dword [byte ebp-04h]
        mov dword [byte edx+ebp-078h], eax
        call TeamRankSkating
        mov dword [dword edx+TeamScoringScore-4], eax
.21:
        cmp esi, dword [byte ebp-04h]
        jg short .20
        mov ecx, CompareRankB
        mov ebx, 4
        lea eax, [byte ebp-074h]
        mov edx, esi
        mov dword [byte ebp-04h], 0
        call qsort_
        xor eax, eax
        jmp short .23
.22:
        add eax, byte 4
        mov edx, dword [gameopts]
        mov bl, byte [byte ebp-04h]
        add edx, dword [byte eax+ebp-078h]
        inc bl
        inc dword [byte ebp-04h]
        mov byte [dword edx+081h], bl
.23:
        cmp esi, dword [byte ebp-04h]
        jg short .22
        mov dword [byte ebp-04h], 0
        xor eax, eax
        jmp short .26
.24:
        mov edx, dword [byte ebp-04h]
        mov dword [dword eax+TeamScoringScore], 0
        xor ebx, ebx
        mov dword [byte eax+ebp-074h], edx
        mov edx, eax
.25:
        mov ecx, dword [gameopts]
        add ecx, ebx
        add ecx, dword [byte ebp-04h]
        mov edi, 1Ch
        movsx ecx, byte [byte ecx+011h]
        sub edi, ecx
        add ebx, byte 1Ch
        add dword [dword edx+TeamScoringScore], edi
        cmp ebx, 8Ch
        jne short .25
        inc dword [byte ebp-04h]
        add eax, byte 4
.26:
        cmp esi, dword [byte ebp-04h]
        jg short .24
        mov ecx, CompareRankB
        mov ebx, 4
        lea eax, [byte ebp-074h]
        mov edx, esi
        mov dword [byte ebp-04h], 0
        call qsort_
        xor edx, edx
        jmp short .28
.27:
        add edx, byte 4
        mov eax, dword [gameopts]
        mov bl, byte [byte ebp-04h]
        add eax, dword [byte edx+ebp-078h]
        inc bl
        inc dword [byte ebp-04h]
        mov byte [dword eax+09Dh], bl
.28:
        cmp esi, dword [byte ebp-04h]
        jg short .27
        jmp near RunRosterScreens_230
