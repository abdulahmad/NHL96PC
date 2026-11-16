; The season menus: the season menu, standings, picking a season or record from a name index (96 PC).
bits 32
%include "hockey.inc"
extern BottomBarArt
extern SeasonUsers
section s_794FF progbits alloc exec nowrite align=1
extern __STOSB, BlackPalette, TitleTextStyle, SeasonUserTeam, SeasonUserSim, SeasonUserFlag, SeasonUserSlot
extern SeasonGameHome, SeasonGameAway, PlayoffTeams, PlayoffRoundNum
extern PlayoffUserTeam, PlayoffHomeTeam, PlayoffAwayTeam, PlayoffTeamIn, DrawArtOpaque, DrawColorText, DrawColorTextCentred, DrawScrollBar
extern DrawSeasonTeams, SaveFileHandle, gameresult, seasondb, statsfromleague, statsplayoffs, SeasonDbSize, PlayoffStatsSize
extern TeamDivisions, TeamConferenceIds, SeasonTeamOrder, SeasonMenuLast, MatchupLayer, TeamStatsBitmap, SeasonGameOpts
extern PlayoffTreeData, SeasonType, SeasonPlayoffs, SeasonOver, SeasonDay, SeasonGamePending, SeasonRandomSeed, PlayoffGameOpts
extern PlayoffSlotTeams, PlayoffSimTeams, statsbgshapes, SeasonMenuActive, FadeOut, FadePalette, FileClose, FileOpenRead
extern FillBox, FillMusicStream, FreeScrollBar, FreeStatsTables, gameopts, GetLangText, HideMessage, HideProgressBox
extern InitMenuItems, InitVScrollBar, SeasonMenuChoiceJumpTable, SeasonMenuLastJumpTable, LoadPackedFile, LoadSeasonStats, MakeDirPath, MakePlayoffDbPath
extern MakeSeasonDbPath, MessageBox, MusicDone, NameIndexFree, NameIndexId, NameIndexLoad, NameIndexPath, NameIndexRemove
extern NameIndexSave, NewSeasonScreen, OpenScreen, PlayMenuGame, PlayMusic, PutBlock, qsort_, ResetSeasonFiles
extern RunControllerScreen, RunMenu, ScrollBarDown, ScrollBarUp, SetDrawBitmap, SetGreyPalette, SetScreenColors, SetScrollBarPos
extern SetTextColors, SetTickDeadline, ShowMessage, ShowProgressBox, SlideInSideBar, SlideInTitleBar, SoundSecondsToBytes, sprintf_
extern srand_, str_1EST, str_1WST, str_AR00, str_AR01, str_AR10, str_AR11, str_BALL3
extern str_Bkgd10, str_BKGD11, str_BT003, str_Bt015, str_BT016, str_Bt025, str_BT026, str_Bt02d3
extern str_Bt09, str_Bt104, str_BT105, str_Bt114, str_BT115, str_BT122, str_Bt193, str_Bt203
extern str_Bt283, str_Bt293, str_D6, str_dbgDash, str_Del1, str_Del2, str_Del3, str_Mod1
extern str_Mod2, str_Mod3, str_Pal15, str_Pal16, str_S, str_S05dCnzDb4, str_S05dCnzDb5, str_S05dCsgDb2
extern str_S05dCsgDb3, str_SEASONNDX2, str_SLDR, str_Sta12, str_Sta22, str_Sta32, str_star, str_Stn1
extern str_Stn2, str_Stn3, str_Tra1, str_Tra2, str_Tra3, strcpy_, strlen_, LoadDataFileLib
extern GameOptionsScreen, ReadSeasonDbHeader, ReadPlayoffDbHeader, DeleteSeasonFiles, DeleteSeasonDb, CalendarScreen, UpdateTeamDbs, SimSeasonGames
extern SaveSeasonTeams, SimulateGame, RunStatsMenu, RunRosterScreens, PlayoffTreeScreen, SeedPlayoffs, PlayoffRound1, PlayoffRound2
extern PlayoffRound3, PlayoffFinal, ClearPlayoffTree, SaveLeagueDb, DrawArt, DrawShape, PutBlockAtOwnPos, FreeMemBlock
extern CreateBitmap, TintRows, DrawRectOutline, FreeBitmap, DosFileInfo, atoi_, OpenArtArchiveErr, OpenArtArchive
extern SaveFileBlock, DrawArtOpaqueAtOwnPos, UnlinkJump, FileSizeByName, SetScreenTarget, SetPaletteEntries, FindShape, ClearClipRect
extern TextSetFont, TickDeadlinePassed, str_WesternConference2, SeasonUserRecords, SeasonUserName, PlayoffHeader, PlayoffName, str_Punct
extern SeasonMenuHotspots, StandingsHotspots, SimPlayoffBracketOrder, UpdateProgressBox
global SeasonMenuScreen, SeasonMenuScreen_794, SeasonMenuScreen_7AC, SeasonMenuScreen_858, SeasonMenuScreen_9D7, SeasonMenuScreen_A07, SeasonMenuScreen_A34, SeasonMenuScreen_A61
global SeasonMenuScreen_ADF, SeasonMenuScreen_AEB, SeasonMenuScreen_AF7, SeasonMenuScreen_B7E, SeasonMenuScreen_C05, SeasonMenuScreen_C68, SeasonMenuScreen_D9C, StandingsScreen
global CompareTeamPoints, DrawStandings, SimulateRestOfSeason, PickIndexHotspots, SeasonMenuCommands, SeasonMenuCommandJumpTable, RunSeasonMenus, RunSeasonMenus_6E
global RunSeasonMenus_CB, RunSeasonMenus_D2, RunSeasonMenus_138, RunSeasonMenus_182, RunSeasonMenus_189, RunSeasonMenus_1E1, RunSeasonMenus_224, RunSeasonMenus_238
global RunSeasonMenus_24E, RunSeasonMenus_25A, RunSeasonMenus_533, PickIndexEntryScreen, DrawIndexEntries
;-----------------------------------------------------------------------------
; SeasonMenuScreen                             794FF  96 PC, medium confidence
; The season menu (stn1-3, sta1-3, bt%02d buttons) of the current season
;-----------------------------------------------------------------------------
SeasonMenuScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0C44h, 0
        sub ebp, 82h
        lea edi, [byte ebp+03Ah]
        mov esi, str_Punct
        movsd
        movsd
        movsd
        movsd
        movsd
        movsd
        mov ecx, 60h
        lea edi, [dword ebp-03A2h]
        mov esi, SeasonMenuHotspots
        lea edx, [dword ebp-0BC2h]
        xor eax, eax
        rep movsd
        call GetLangText
        mov dword [byte ebp+062h], eax
        mov eax, 10h
        call InitMenuItems
        call SetScreenTarget
        mov eax, 5Fh
        xor edx, edx
        mov esi, str_WesternConference2
        call LoadDataFileLib
        push str_Pal15
        add esi, 1F2h
        push eax
        mov dword [byte ebp+06Ah], eax
        mov dword [byte ebp+072h], eax
        call FindShape
        add esp, byte 8
        lea edx, [byte eax+010h]
        mov ecx, 0C0h
        lea edi, [dword eax+0202h]
        rep movsb
        push str_Bkgd10
        push dword [byte ebp+06Ah]
        mov dword [byte ebp+07Ah], edx
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
        push SeasonUserTeam
        mov eax, 1D7h
        call GetLangText
        push eax
        lea eax, [byte ebp-022h]
        lea edi, [dword ebp-0BC2h]
        push eax
        mov ebx, 4Bh
        mov edx, 140h
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-022h]
        mov esi, TeamStatsBitmap
        call DrawColorTextCentred
        mov eax, dword [byte ebp+07Ah]
        lea ebx, [dword ebp-0122h]
        call SetScreenColors
        mov eax, 6
        lea edx, [dword ebp-0222h]
        call OpenScreen
        mov eax, dword [byte ebp+07Ah]
        mov ecx, 66h
        call SetGreyPalette
        rep movsb
        mov ecx, 66h
        lea edi, [dword ebp-0B5Ch]
        mov esi, BottomBarArt+56h
        mov byte [dword ebp-0B7Dh], 4
        rep movsb
        mov dword [byte ebp+07Eh], 0FFFFFFFFh
        mov byte [dword ebp-0B18h], 6
        mov byte [dword ebp-0B17h], 1
        mov byte [dword ebp-0B1Ah], 1
        mov byte [dword ebp-0B19h], 1
        cmp dword [SeasonMenuLast], byte 0FFFFFFFFh
        jne near .7
        xor edx, edx
        xor eax, eax
.1:
        movsx ebx, byte [dword edx+SeasonUserSlot]
        cmp ebx, byte 1
        jne short .6
        mov esi, dword [dword eax+TeamDivisions]
        cmp esi, byte 2
        jb short .2
        jbe short .3
        cmp esi, byte 4
        jb short .6
        jbe short .4
        cmp esi, byte 8
        je short .5
        jmp short .6
.2:
        cmp esi, ebx
        jne short .6
        mov dword [SeasonMenuLast], 0
        jmp short .6
.3:
        mov dword [SeasonMenuLast], ebx
        jmp short .6
.4:
        mov dword [SeasonMenuLast], 2
        jmp short .6
.5:
        mov dword [SeasonMenuLast], 3
.6:
        add eax, byte 4
        add edx, byte 1Ah
        cmp eax, byte 68h
        jne short .1
.7:
        imul eax, dword [SeasonMenuLast], byte 9
        inc eax
        push eax
        push str_Bt02d3
        lea eax, [byte ebp+052h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+052h]
        push eax
        push dword [byte ebp+072h]
        call FindShape
        mov dword [dword ebp-0A76h], eax
        imul eax, dword [SeasonMenuLast], byte 9
        add esp, byte 8
        inc eax
        inc eax
        push eax
        push str_Bt02d3
        lea eax, [byte ebp+052h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+052h]
        push eax
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0A72h], eax
        lea eax, [byte ebp+052h]
        push eax
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0A6Eh], eax
        lea eax, [byte ebp+052h]
        push eax
        push dword [byte ebp+072h]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        mov dword [dword ebp-0A6Ah], eax
        lea eax, [byte ebp+052h]
        push eax
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0A80h], 8
        mov dword [dword ebp-0A66h], eax
        lea eax, [dword ebp-03A2h]
        mov byte [dword ebp-0A4Dh], 0Ah
        mov dword [dword ebp-0A7Ch], eax
        mov eax, dword [dword ebp-0A6Ah]
        mov byte [dword ebp-0A4Ch], 0
        add eax, byte 0Ah
        push str_Stn1
        mov dword [dword ebp-0A56h], eax
        mov eax, dword [dword ebp-0A66h]
        mov byte [dword ebp-0A4Bh], 1
        add eax, byte 0Ah
        push dword [byte ebp+072h]
        mov dword [dword ebp-0A52h], eax
        call FindShape
        add esp, byte 8
        push str_Stn2
        push dword [byte ebp+072h]
        mov dword [dword ebp-0A10h], eax
        call FindShape
        add esp, byte 8
        push str_Stn3
        push dword [byte ebp+072h]
        mov dword [dword ebp-0A0Ch], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0A08h], eax
        push str_Stn1
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push str_Stn1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+072h]
        mov dword [dword ebp-0A04h], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0A1Ah], 8
        mov byte [dword ebp-09E6h], 0
        mov dword [dword ebp-0A00h], eax
        lea eax, [dword ebp-0362h]
        mov byte [dword ebp-09E5h], 5
        mov dword [dword ebp-0A16h], eax
        mov eax, dword [dword ebp-0A04h]
        mov byte [dword ebp-09E7h], 7
        add eax, byte 0Ah
        push str_Sta12
        mov dword [dword ebp-09F0h], eax
        mov eax, dword [dword ebp-0A00h]
        mov byte [dword ebp-09E8h], 0Dh
        add eax, byte 0Ah
        push dword [byte ebp+072h]
        mov dword [dword ebp-09ECh], eax
        call FindShape
        add esp, byte 8
        push str_Sta22
        push dword [byte ebp+072h]
        mov dword [dword ebp-09AAh], eax
        call FindShape
        add esp, byte 8
        push str_Sta32
        push dword [byte ebp+072h]
        mov dword [dword ebp-09A6h], eax
        call FindShape
        add esp, byte 8
        push str_Sta12
        push dword [byte ebp+072h]
        mov dword [dword ebp-09A2h], eax
        call FindShape
        add esp, byte 8
        push str_Sta12
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+072h]
        mov dword [dword ebp-099Eh], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-09B4h], 8
        mov byte [dword ebp-0980h], 4
        mov dword [dword ebp-099Ah], eax
        lea eax, [dword ebp-0322h]
        mov byte [dword ebp-097Fh], 6
        mov dword [dword ebp-09B0h], eax
        mov eax, dword [dword ebp-099Eh]
        mov byte [dword ebp-0981h], 7
        add eax, byte 0Ah
        push str_Tra1
        mov dword [dword ebp-098Ah], eax
        mov eax, dword [dword ebp-099Ah]
        mov byte [dword ebp-0982h], 0Dh
        add eax, byte 0Ah
        push dword [byte ebp+072h]
        mov dword [dword ebp-0986h], eax
        call FindShape
        add esp, byte 8
        push str_Tra2
        push dword [byte ebp+072h]
        mov dword [dword ebp-0944h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0940h], eax
        push str_Tra3
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push str_Tra1
        push dword [byte ebp+072h]
        mov dword [dword ebp-093Ch], eax
        call FindShape
        add esp, byte 8
        push str_Tra1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+072h]
        mov dword [dword ebp-0938h], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-094Eh], 8
        mov byte [dword ebp-091Ah], 5
        mov dword [dword ebp-0934h], eax
        lea eax, [dword ebp-02E2h]
        mov byte [dword ebp-0919h], 1
        mov dword [dword ebp-094Ah], eax
        mov eax, dword [dword ebp-0938h]
        mov byte [dword ebp-091Bh], 8
        add eax, byte 0Ah
        push str_Del1
        mov dword [dword ebp-0924h], eax
        mov eax, dword [dword ebp-0934h]
        mov byte [dword ebp-091Ch], 0Eh
        add eax, byte 0Ah
        push dword [byte ebp+072h]
        mov dword [dword ebp-0920h], eax
        call FindShape
        add esp, byte 8
        push str_Del2
        push dword [byte ebp+072h]
        mov dword [dword ebp-08DEh], eax
        call FindShape
        add esp, byte 8
        push str_Del3
        push dword [byte ebp+072h]
        mov dword [dword ebp-08DAh], eax
        call FindShape
        add esp, byte 8
        push str_Del1
        push dword [byte ebp+072h]
        mov dword [dword ebp-08D6h], eax
        call FindShape
        add esp, byte 8
        push str_Del1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+072h]
        mov dword [dword ebp-08D2h], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-08E8h], 8
        mov dword [dword ebp-08CEh], eax
        lea eax, [dword ebp-02A2h]
        mov byte [dword ebp-08B4h], 0
        mov dword [dword ebp-08E4h], eax
        mov eax, dword [dword ebp-08D2h]
        mov byte [dword ebp-08B3h], 8
        add eax, byte 0Ah
        push str_Mod1
        mov dword [dword ebp-08BEh], eax
        mov eax, dword [dword ebp-08CEh]
        mov byte [dword ebp-08B6h], 4
        add eax, byte 0Ah
        push dword [byte ebp+072h]
        mov dword [dword ebp-08BAh], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0878h], eax
        push str_Mod2
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push str_Mod3
        push dword [byte ebp+072h]
        mov dword [dword ebp-0874h], eax
        call FindShape
        add esp, byte 8
        push str_Mod1
        push dword [byte ebp+072h]
        mov dword [dword ebp-0870h], eax
        call FindShape
        add esp, byte 8
        push str_Mod1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+072h]
        mov dword [dword ebp-086Ch], eax
        call FindShape
        lea edx, [dword ebp-0562h]
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [dword ebp-0868h], eax
        lea eax, [dword ebp-0262h]
        mov dword [dword ebp-0882h], 8
        mov dword [dword ebp-087Eh], eax
        mov eax, dword [dword ebp-086Ch]
        mov byte [dword ebp-084Eh], 7
        add eax, byte 0Ah
        mov byte [dword ebp-084Dh], 1
        mov dword [dword ebp-0858h], eax
        mov eax, dword [dword ebp-0868h]
        mov byte [dword ebp-0850h], 6
        add eax, byte 0Ah
        lea ebx, [dword edx+01C0h]
        mov dword [dword ebp-0854h], eax
        mov eax, 396h
.8:
        add eax, byte 66h
        mov dword [dword eax+ebp-0C14h], edx
        add edx, byte 40h
        mov dword [dword eax+ebp-0C18h], 4
        cmp edx, ebx
        jne short .8
        push byte 0
        push dword 0FAh
        push dword 226h
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push byte 64h
        push dword 96h
        mov esi, eax
        mov dword [byte ebp+076h], eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [byte ebp+05Eh], eax
        lea eax, [byte ebp+03Ah]
        push eax
        lea eax, [dword ebp-0122h]
        push eax
        lea eax, [dword ebp-0222h]
        push eax
        push dword 9Bh
        lea ecx, [dword ebp-082Ch]
        push byte 32h
        lea eax, [dword ebp-0562h]
        mov ebx, dword [SeasonMenuLast]
        push eax
        mov edx, esi
        mov eax, dword [byte ebp+072h]
        call DrawSeasonTeams
        cmp dword [SeasonOver], byte 1
        jne short .9
        mov dword [byte ebp+07Eh], 0FFFFFFFFh
.9:
        xor edi, edi
        xor esi, esi
        jmp short .12
.10:
        cmp dword [dword esi+ebp-0BA8h], byte 0
        je short .11
        push dword [dword esi+ebp-0B98h]
        push dword [dword esi+ebp-0B9Ch]
        push dword [dword esi+ebp-0BA8h]
        call DrawArt
        add esp, byte 0Ch
.11:
        add esi, byte 66h
        inc edi
.12:
        mov eax, dword [SeasonMenuLast]
        mov eax, dword [nosplit eax*4+SeasonTeamOrder]
        add eax, byte 9
        cmp edi, eax
        jl short .10
        mov ebx, 3
        mov edx, dword [byte ebp+07Ah]
        xor eax, eax
        mov dword [byte ebp+06Eh], 0FFFFFFFFh
        call FadePalette
        jmp short SeasonMenuScreen_7AC.17
.13:
        cmp dword [byte ebp+066h], byte 8
        ja near SeasonMenuScreen_C68
        mov eax, dword [byte ebp+066h]
        jmp dword [nosplit cs:eax*4+SeasonMenuChoiceJumpTable]
SeasonMenuScreen_794:
        mov dword [byte ebp+06Eh], 2710h
        mov dword [SeasonMenuLast], 0FFFFFFFFh
        call SlideInSideBar
        jmp short SeasonMenuScreen_7AC.17
SeasonMenuScreen_7AC:
        call SlideInTitleBar
        cmp dword [byte ebp+07Eh], byte 0FFFFFFFFh
        jne short .19
.14:
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov eax, 29h
.15:
        mov ecx, TitleTextStyle
        push byte 0
        lea ebx, [byte ebp+062h]
.16:
        mov edx, 1
        call GetLangText
        call MessageBox
.17:
        cmp dword [byte ebp+06Eh], byte 0
        jge near SeasonMenuScreen_C68.40
        mov dword [byte ebp+066h], 0FFFFFFFFh
.18:
        cmp dword [byte ebp+066h], byte 0
        jge short SeasonMenuScreen.13
        push byte 3
        push byte 0
        lea eax, [byte ebp+066h]
        push eax
        mov eax, dword [SeasonMenuLast]
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-0BC2h]
        mov eax, dword [nosplit eax*4+SeasonTeamOrder]
        xor ecx, ecx
        add eax, byte 9
        call RunMenu
        jmp short .18
.19:
        imul eax, dword [byte ebp+07Eh], byte 1Ah
        cmp byte [dword eax+SeasonUserSlot], 0
        jne short .21
.20:
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov eax, 2Ah
        jmp short .15
.21:
        mov eax, dword [byte ebp+07Eh]
        mov dword [byte ebp+06Eh], 2714h
        mov dword [SeasonDay], eax
        jmp short .17
SeasonMenuScreen_858:
        push byte 0
        push str_Bt015
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_Bt015
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov edi, eax
        call SetDrawBitmap
        add esp, byte 4
        push str_Bt015
        push dword [byte ebp+072h]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_Bt015
        push dword [byte ebp+072h]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd10
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        call SetScreenTarget
        imul esi, dword [SeasonMenuLast], byte 9
        mov dword [byte ebp+07Eh], 0FFFFFFFFh
        inc esi
        inc esi
        jmp near .27
.22:
        inc eax
        cmp esi, eax
        jne short .23
        lea esi, [byte eax+01h]
.23:
        cmp esi, byte 26h
        jne short .24
        push str_Bt025
        lea eax, [byte ebp+052h]
        push eax
        call sprintf_
        add esp, byte 8
        jmp short .25
.24:
        push esi
        push str_Bt02d3
        lea eax, [byte ebp+052h]
        push eax
        call sprintf_
        add esp, byte 0Ch
.25:
        push str_Bt015
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_Bt015
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [byte edi+02Ch]
        call DrawArtOpaque
        add esp, byte 0Ch
        lea eax, [byte ebp+052h]
        push eax
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        call DrawShape
        add esp, byte 4
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.26:
        call TickDeadlinePassed
        test eax, eax
        je short .26
        inc esi
.27:
        mov eax, dword [SeasonMenuLast]
        inc eax
        lea eax, [eax+eax*8]
        lea edx, [byte eax+02h]
        cmp esi, edx
        jl near .22
        push edi
        call FreeBitmap
        inc dword [SeasonMenuLast]
        add esp, byte 4
        cmp dword [SeasonMenuLast], byte 4
        jne short .28
        mov dword [SeasonMenuLast], 0
.28:
        mov eax, dword [SeasonMenuLast]
        cmp eax, byte 3
        ja near SeasonMenuScreen_A61.30
        jmp dword [nosplit cs:eax*4+SeasonMenuLastJumpTable]
SeasonMenuScreen_9D7:
        push str_Bt015
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push str_Bt025
        push dword [byte ebp+072h]
        mov dword [dword ebp-0A76h], eax
        call FindShape
        add esp, byte 8
        push str_Bt025
        jmp near SeasonMenuScreen_A61.29
SeasonMenuScreen_A07:
        push str_Bt104
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push str_Bt114
        push dword [byte ebp+072h]
        mov dword [dword ebp-0A76h], eax
        call FindShape
        add esp, byte 8
        push str_Bt114
        jmp short SeasonMenuScreen_A61.29
SeasonMenuScreen_A34:
        push str_Bt193
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push str_Bt203
        push dword [byte ebp+072h]
        mov dword [dword ebp-0A76h], eax
        call FindShape
        add esp, byte 8
        push str_Bt203
        jmp short SeasonMenuScreen_A61.29
SeasonMenuScreen_A61:
        push str_Bt283
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push str_Bt293
        push dword [byte ebp+072h]
        mov dword [dword ebp-0A76h], eax
        call FindShape
        add esp, byte 8
        push str_Bt293
.29:
        push dword [byte ebp+072h]
        mov dword [dword ebp-0A72h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0A6Eh], eax
.30:
        lea eax, [byte ebp+03Ah]
        push eax
        lea eax, [dword ebp-0122h]
        push eax
        lea eax, [dword ebp-0222h]
        push eax
        push dword 9Bh
        lea ecx, [dword ebp-082Ch]
        push byte 32h
        lea eax, [dword ebp-0562h]
        mov edx, dword [byte ebp+076h]
        push eax
        mov ebx, dword [SeasonMenuLast]
        mov eax, dword [byte ebp+072h]
.31:
        call DrawSeasonTeams
        jmp near SeasonMenuScreen_7AC.17
SeasonMenuScreen_ADF:
        mov dword [byte ebp+06Eh], 2713h
        jmp near SeasonMenuScreen_7AC.17
SeasonMenuScreen_AEB:
        mov dword [byte ebp+06Eh], 2716h
        jmp near SeasonMenuScreen_7AC.17
SeasonMenuScreen_AF7:
        xor edx, edx
        xor eax, eax
.32:
        movsx ebx, byte [dword eax+SeasonUserSlot]
        cmp ebx, byte 1
        jne short .33
        movsx ebx, byte [dword eax+SeasonUsers+1Ah]
        cmp ebx, byte 0FFFFFFFFh
        je short .33
        inc edx
        jmp short .34
.33:
        movsx ebx, byte [dword eax+SeasonUserSlot]
        cmp ebx, byte 1
        jne short .34
        movsx ebx, byte [dword eax+SeasonUsers+1Bh]
        cmp ebx, byte 1
        jne short .34
        add edx, ebx
.34:
        add eax, byte 1Ah
        cmp eax, 2A4h
        jne short .32
        mov eax, dword [SeasonOver]
        sub eax, edx
        cmp eax, byte 1
        jle short .35
        mov dword [byte ebp+06Eh], 2718h
        jmp near SeasonMenuScreen_7AC.17
.35:
        xor eax, eax
        call GetLangText
        push byte 2
        push byte 0
        push dword 0F0h
        mov ecx, TitleTextStyle
        push dword 140h
        lea ebx, [byte ebp+062h]
        mov dword [byte ebp+062h], eax
        push byte 0
        mov eax, 260h
        jmp near SeasonMenuScreen_7AC.16
SeasonMenuScreen_B7E:
        xor edx, edx
        xor eax, eax
.36:
        movsx ebx, byte [dword eax+SeasonUserFlag]
        cmp ebx, byte 1
        jne short .37
        add edx, ebx
.37:
        add eax, byte 1Ah
        cmp eax, 2A4h
        jne short .36
        cmp dword [byte ebp+07Eh], byte 0FFFFFFFFh
        je near SeasonMenuScreen_7AC.14
        imul eax, dword [byte ebp+07Eh], byte 1Ah
        movsx eax, byte [dword eax+SeasonUserSlot]
        cmp eax, byte 1
        je short .38
        test edx, edx
        jle near SeasonMenuScreen_7AC.20
.38:
        mov edx, dword [byte ebp+07Ah]
        mov eax, dword [byte ebp+07Eh]
        call SimulateRestOfSeason
        lea eax, [byte ebp+03Ah]
        push eax
        lea eax, [dword ebp-0122h]
        push eax
        lea eax, [dword ebp-0222h]
        push eax
        push dword 9Bh
        lea ecx, [dword ebp-082Ch]
        mov edx, dword [byte ebp+076h]
        push byte 32h
        lea eax, [dword ebp-0562h]
        mov ebx, dword [SeasonMenuLast]
        push eax
        mov eax, dword [byte ebp+072h]
        mov dword [byte ebp+07Eh], 0FFFFFFFFh
        jmp near SeasonMenuScreen_A61.31
SeasonMenuScreen_C05:
        mov dword [gameopts], SeasonUserRecords
        mov ecx, 0B9h
        xor eax, eax
        mov edi, PlayoffHeader
        call GameOptionsScreen
        mov esi, dword [gameopts]
        rep movsb
        mov ecx, 0B9h
        mov edi, SeasonUserRecords
        mov esi, dword [gameopts]
        mov ebx, 0Ah
        rep movsb
        lea eax, [byte ebp+012h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword 39Dh
        push PlayoffHeader
        lea eax, [byte ebp+012h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        jmp near SeasonMenuScreen_7AC.17
SeasonMenuScreen_C68:
        cmp dword [byte ebp+07Eh], byte 0FFFFFFFFh
        je short .39
        mov eax, dword [byte ebp+05Ah]
        shl eax, 6
        push dword [dword eax+ebp-055Eh]
        push dword [dword eax+ebp-0562h]
        mov eax, dword [byte ebp+05Eh]
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.39:
        imul eax, dword [SeasonMenuLast], byte 7
        add eax, dword [byte ebp+066h]
        movzx eax, byte [dword eax+SeasonTeamOrder+7]
        mov dword [byte ebp+07Eh], eax
        mov eax, dword [byte ebp+066h]
        sub eax, byte 9
        mov esi, eax
        push dword 0FDh
        shl esi, 6
        push dword [dword esi+ebp-054Eh]
        push dword [dword esi+ebp-0552h]
        push dword [dword esi+ebp-055Eh]
        push dword [dword esi+ebp-0562h]
        mov dword [byte ebp+05Ah], eax
        call DrawRectOutline
        add esp, byte 14h
        mov eax, dword [dword esi+ebp-054Eh]
        push dword 0FDh
        dec eax
        push eax
        mov eax, dword [dword esi+ebp-0552h]
        dec eax
        push eax
        mov eax, dword [dword esi+ebp-055Eh]
        inc eax
        push eax
        mov eax, dword [dword esi+ebp-0562h]
        inc eax
        push eax
        call DrawRectOutline
        add esp, byte 14h
        push dword [byte ebp+05Eh]
        call SetDrawBitmap
        mov eax, dword [dword esi+ebp-055Eh]
        neg eax
        add esp, byte 4
        add eax, 9Bh
        push eax
        mov eax, dword [dword esi+ebp-0562h]
        neg eax
        add eax, byte 32h
        push eax
        mov eax, dword [byte ebp+076h]
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        call SetScreenTarget
        jmp near SeasonMenuScreen_7AC.17
.40:
        mov ebx, 7
        lea eax, [byte ebp+012h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword 3A7h
        push SeasonUserRecords
        lea eax, [byte ebp+012h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        push dword [byte ebp+072h]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 3
        call FadeOut
        push dword [byte ebp+076h]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp+05Eh]
        call FreeBitmap
SeasonMenuScreen_D9C:
        mov eax, dword [byte ebp+06Eh]
        add esp, byte 4
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; StandingsScreen                              7A2AE  96 PC, medium confidence
; The standings screen by conference (1WST, 1EST)
;-----------------------------------------------------------------------------
StandingsScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 188h, 0
        sub ebp, 82h
        mov dword [byte ebp+07Ah], 0
        mov ecx, 10h
        lea edi, [byte ebp-03Ah]
        mov esi, StandingsHotspots
        mov eax, 0FCh
        xor edx, edx
        rep movsd
        call SetTextColors
        cmp dword [statsfromleague], byte 0
        jne short .1
        mov eax, dword [PlayoffTreeData]
        call LoadSeasonStats
.1:
        mov ebx, 6
        lea eax, [byte ebp+03Ah]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push byte 0
        lea eax, [byte ebp+03Ah]
        push eax
        call OpenArtArchiveErr
        lea edx, [dword ebp-0106h]
        add esp, byte 8
        mov dword [statsbgshapes], eax
        mov eax, 2
        call InitMenuItems
        mov eax, 60h
        xor edx, edx
        call LoadPackedFile
        push str_Pal15
        push eax
        mov dword [byte ebp+076h], eax
        mov dword [byte ebp+07Eh], eax
        call FindShape
        add esp, byte 8
        push str_Bkgd10
        add eax, byte 10h
        push dword [byte ebp+076h]
        mov dword [byte ebp+072h], eax
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        push SeasonUserTeam
        mov eax, 1D7h
        call GetLangText
        push eax
        lea eax, [byte ebp+06h]
        push eax
        mov ebx, 4Bh
        call sprintf_
        add esp, byte 0Ch
        mov edx, 140h
        lea eax, [byte ebp+06h]
        call DrawColorTextCentred
        mov eax, dword [byte ebp+072h]
        call SetScreenColors
        mov eax, 2
        call OpenScreen
        push byte 0
        push dword 15Eh
        push dword 1C2h
        call CreateBitmap
        mov dword [byte ebp+06Ah], eax
        add esp, byte 0Ch
        mov dword [byte ebp+066h], eax
        push dword [MatchupLayer]
        lea edi, [dword ebp-0106h]
        call TextSetFont
        add esp, byte 4
        mov esi, BottomBarArt+56h
        mov ecx, 66h
        push str_1WST
        rep movsb
        push dword [byte ebp+076h]
        mov byte [dword ebp-0C4h], 1
        call FindShape
        add esp, byte 8
        push str_Bt015
        push dword [byte ebp+076h]
        mov dword [dword ebp-086h], eax
        call FindShape
        add esp, byte 8
        push str_Bt015
        push dword [byte ebp+076h]
        mov dword [dword ebp-082h], eax
        call FindShape
        add esp, byte 8
        push str_1WST
        push dword [byte ebp+076h]
        mov dword [byte ebp-07Eh], eax
        call FindShape
        add esp, byte 8
        push str_1WST
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+076h]
        mov dword [byte ebp-07Ah], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp-076h], eax
        mov eax, dword [byte ebp-07Ah]
        mov ecx, dword [byte ebp+072h]
        add eax, byte 0Ah
        mov ebx, dword [byte ebp+076h]
        mov dword [byte ebp-066h], eax
        mov eax, dword [byte ebp-076h]
        mov edx, dword [byte ebp+06Ah]
        add eax, byte 0Ah
        add esp, byte 8
        mov dword [byte ebp-062h], eax
        lea eax, [byte ebp-03Ah]
        mov byte [byte ebp-05Dh], 0
        mov dword [dword ebp-08Ch], eax
        mov eax, dword [byte ebp+07Ah]
        mov dword [dword ebp-090h], 8
        call DrawStandings
        mov ebx, 3
        mov edx, dword [byte ebp+072h]
        xor eax, eax
        mov dword [byte ebp+06Eh], 0FFFFFFFFh
        call FadePalette
.2:
        cmp dword [byte ebp+06Eh], byte 0
        jge near .18
        mov dword [byte ebp+062h], 0FFFFFFFFh
.3:
        cmp dword [byte ebp+062h], byte 0
        jge short .4
        push byte 3
        lea eax, [byte ebp+062h]
        push byte 0
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-0106h]
        push eax
        xor ecx, ecx
        mov eax, 2
        call RunMenu
        jmp short .3
.4:
        jbe short .5
        cmp dword [byte ebp+062h], byte 1
        je short .6
        jmp short .2
.5:
        call SlideInTitleBar
        mov dword [byte ebp+06Eh], 2712h
        jmp short .2
.6:
        push byte 0
        push str_Bt015
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_Bt015
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push str_Bt015
        push dword [byte ebp+07Eh]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_Bt015
        push dword [byte ebp+07Eh]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd10
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        call SetScreenTarget
        cmp dword [byte ebp+07Ah], byte 0
        jbe short .7
        cmp dword [byte ebp+07Ah], byte 1
        je near .10
        jmp near .16
.7:
        mov edi, 2
.8:
        push edi
        push str_Bt02d3
        lea eax, [byte ebp+05Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push str_Bt015
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_Bt015
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [byte esi+02Ch]
        call DrawArtOpaque
        add esp, byte 0Ch
        lea eax, [byte ebp+05Ah]
        push eax
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push eax
        call DrawShape
        add esp, byte 4
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.9:
        call TickDeadlinePassed
        test eax, eax
        je short .9
        inc edi
        cmp edi, byte 9
        jle short .8
        push str_1EST
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push str_Bt09
        push dword [byte ebp+07Eh]
        mov dword [dword ebp-086h], eax
        call FindShape
        add esp, byte 8
        push str_Bt09
        jmp near .15
.10:
        mov edi, 9
.11:
        cmp edi, byte 11h
        jne short .12
        push str_Bt015
        lea eax, [byte ebp+05Ah]
        push eax
        call sprintf_
        add esp, byte 8
        jmp short .13
.12:
        push edi
        push str_Bt02d3
        lea eax, [byte ebp+05Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
.13:
        push str_Bt015
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_Bt015
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [byte esi+02Ch]
        call DrawArtOpaque
        add esp, byte 0Ch
        lea eax, [byte ebp+05Ah]
        push eax
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push eax
        call DrawShape
        add esp, byte 4
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.14:
        call TickDeadlinePassed
        test eax, eax
        je short .14
        inc edi
        cmp edi, byte 11h
        jle near .11
        push str_1WST
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push str_Bt015
        push dword [byte ebp+07Eh]
        mov dword [dword ebp-086h], eax
        call FindShape
        add esp, byte 8
        push str_Bt015
.15:
        push dword [byte ebp+07Eh]
        mov dword [dword ebp-082h], eax
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-07Eh], eax
.16:
        push esi
        inc dword [byte ebp+07Ah]
        call FreeBitmap
        add esp, byte 4
        cmp dword [byte ebp+07Ah], byte 2
        jne short .17
        mov dword [byte ebp+07Ah], 0
.17:
        mov ecx, dword [byte ebp+072h]
        mov ebx, dword [byte ebp+07Eh]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+07Ah]
        call DrawStandings
        jmp near .2
.18:
        push dword [byte ebp+07Eh]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+066h]
        call FreeBitmap
        add esp, byte 4
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        mov eax, 3
        call FadeOut
        push dword [statsbgshapes]
        call FreeMemBlock
        jmp near SeasonMenuScreen_D9C
;-----------------------------------------------------------------------------
; CompareTeamPoints                            7A787  96 PC, medium confidence
; Qsort compare of two teams by points (2 x wins + ties from the team record
; +30h, +32h), for the standings
;-----------------------------------------------------------------------------
CompareTeamPoints:
        push ebx
        push ecx
        push esi
        push edi
        enter 2Ch, 0
        mov ebx, eax
        movsx eax, byte [eax]
        imul eax, dword 31Bh
        mov esi, dword [statsplayoffs]
        movzx ecx, byte [byte esi+eax+030h]
        movzx eax, byte [byte esi+eax+032h]
        add ecx, ecx
        add ecx, eax
        movsx eax, byte [edx]
        imul eax, dword 31Bh
        mov dword [byte ebp-01Ch], ecx
        movzx ecx, byte [byte esi+eax+030h]
        movzx eax, byte [byte esi+eax+032h]
        add ecx, ecx
        add ecx, eax
        mov al, byte [ebx]
        mov dword [byte ebp-018h], ecx
        cmp al, byte [edx]
        jne short .1
        xor eax, eax
        jmp near .17
.1:
        cmp dword [SeasonType], byte 2
        jne short .2
        mov ecx, 19h
        jmp short .4
.2:
        cmp dword [SeasonType], byte 1
        jne short .3
        mov ecx, 30h
        jmp short .4
.3:
        mov ecx, 54h
.4:
        mov eax, dword [byte ebp-01Ch]
        cmp eax, dword [byte ebp-018h]
        je short .5
        mov eax, dword [byte ebp-018h]
        sub eax, dword [byte ebp-01Ch]
        jmp near .17
.5:
        movsx eax, byte [ebx]
        mov dword [byte ebp-024h], eax
        imul eax, dword 31Bh
        movzx eax, byte [byte esi+eax+030h]
        mov dword [byte ebp-010h], eax
        movsx eax, byte [edx]
        mov dword [byte ebp-020h], eax
        imul eax, dword 31Bh
        movzx eax, byte [byte esi+eax+030h]
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-010h]
        cmp eax, dword [byte ebp-014h]
        je short .6
        mov eax, dword [byte ebp-014h]
        sub eax, dword [byte ebp-010h]
        jmp near .17
.6:
        imul eax, dword [byte ebp-024h], byte 1Ah
        movsx eax, byte [dword eax+SeasonUserSlot]
        cmp eax, byte 1
        jne short .7
        imul eax, dword [byte ebp-020h], byte 1Ah
        cmp byte [dword eax+SeasonUserSlot], 0
        jne short .7
        mov eax, 0FFFFFFFFh
        jmp near .17
.7:
        movsx eax, byte [edx]
        imul eax, byte 1Ah
        movsx eax, byte [dword eax+SeasonUserSlot]
        cmp eax, byte 1
        jne short .8
        movsx eax, byte [ebx]
        imul eax, byte 1Ah
        cmp byte [dword eax+SeasonUserSlot], 0
        jne short .8
        mov eax, 1
        jmp near .17
.8:
        mov dword [byte ebp-04h], 0
        xor edi, edi
        shl ecx, 2
        mov dword [byte ebp-08h], edi
        mov dword [byte ebp-0Ch], ecx
        jmp near .14
.9:
        movsx eax, byte [ebx]
        imul eax, dword 31Bh
        add eax, esi
        mov ecx, dword [statsbgshapes]
        add eax, dword [byte ebp-08h]
        add ecx, dword [dword eax+014Fh]
        mov eax, ecx
        movzx ecx, byte [byte ecx+03h]
        mov dword [byte ebp-028h], ecx
        movsx ecx, byte [edx]
        mov dword [byte ebp-02Ch], ecx
        mov ecx, dword [byte ebp-028h]
        cmp ecx, dword [byte ebp-02Ch]
        jne short .11
        mov cl, byte [byte eax+05h]
        cmp cl, byte [byte eax+04h]
        jbe short .10
        inc dword [byte ebp-04h]
        jmp short .11
.10:
        mov cl, byte [byte eax+04h]
        cmp cl, byte [byte eax+05h]
        jbe short .11
        inc edi
.11:
        movzx ecx, byte [byte eax+02h]
        mov dword [byte ebp-02Ch], ecx
        movsx ecx, byte [edx]
        mov dword [byte ebp-028h], ecx
        mov ecx, dword [byte ebp-02Ch]
        cmp ecx, dword [byte ebp-028h]
        jne short .13
        mov cl, byte [byte eax+05h]
        cmp cl, byte [byte eax+04h]
        jbe short .12
        inc edi
        jmp short .13
.12:
        mov cl, byte [byte eax+04h]
        cmp cl, byte [byte eax+05h]
        jbe short .13
        inc dword [byte ebp-04h]
.13:
        add dword [byte ebp-08h], byte 4
.14:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte ebp-0Ch]
        jl short .9
        cmp edi, dword [byte ebp-04h]
        je short .15
        mov eax, dword [byte ebp-04h]
        sub eax, edi
        jmp short .17
.15:
        movsx ecx, byte [ebx]
        imul eax, ecx, dword 31Bh
        movsx edx, byte [edx]
        movzx edi, word [byte esi+eax+033h]
        movzx ebx, word [byte esi+eax+035h]
        imul eax, edx, dword 31Bh
        sub edi, ebx
        mov ebx, edi
        movzx edi, word [byte esi+eax+033h]
        movzx eax, word [byte esi+eax+035h]
        sub edi, eax
        mov eax, edi
        cmp ebx, edi
        je short .16
        sub eax, ebx
        jmp short .17
.16:
        mov eax, ecx
        sub eax, edx
.17:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawStandings                                7A97E  96 PC, medium confidence
; Draws the sorted standings table (with "*" marks and "-" for none)
;-----------------------------------------------------------------------------
DrawStandings:
        push esi
        push edi
        enter 2ACh, 0
        push eax
        push edx
        sub ebp, 82h
        mov edi, ebx
        mov dword [byte ebp+03Ah], ecx
        mov byte [byte ebp+072h], 0FFh
        mov byte [byte ebp+07Eh], 0FFh
        push edx
        mov byte [byte ebp+07Ah], 0FFh
        mov byte [byte ebp+076h], 0FFh
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF7Eh
        push byte 0FFFFFF9Ch
        push str_Bkgd10
        push edi
        mov dword [byte ebp+04Eh], 0
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+04Ah], 0
        mov esi, 1
        push eax
        mov dword [byte ebp+05Eh], 0
        mov dword [byte ebp+046h], 0
        call PutBlock
        mov edi, dword [statsplayoffs]
        add esp, byte 0Ch
.1:
        mov eax, dword [byte ebp+046h]
        mov dl, byte [byte ebp+046h]
        inc dword [byte ebp+046h]
        mov byte [byte eax+ebp-02Ah], dl
        cmp dword [byte ebp+046h], byte 1Ah
        jl short .1
        mov ecx, CompareTeamPoints
        mov ebx, 1
        mov edx, 1Ah
        lea eax, [byte ebp-02Ah]
        mov dword [byte ebp+046h], 0
        call qsort_
.2:
        movsx eax, byte [byte ebp+072h]
        cmp eax, byte 0FFFFFFFFh
        jne short .3
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx eax, byte [byte edi+eax+02Eh]
        cmp eax, byte 1
        jne short .3
        mov eax, dword [byte ebp+046h]
        mov al, byte [byte eax+ebp-02Ah]
        mov byte [byte ebp+072h], al
.3:
        movsx eax, byte [byte ebp+07Eh]
        cmp eax, byte 0FFFFFFFFh
        jne short .4
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx eax, byte [byte edi+eax+02Eh]
        cmp eax, byte 2
        jne short .4
        mov eax, dword [byte ebp+046h]
        mov al, byte [byte eax+ebp-02Ah]
        mov byte [byte ebp+07Eh], al
.4:
        movsx eax, byte [byte ebp+076h]
        cmp eax, byte 0FFFFFFFFh
        jne short .5
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx eax, byte [byte edi+eax+02Eh]
        cmp eax, byte 4
        jne short .5
        mov eax, dword [byte ebp+046h]
        mov al, byte [byte eax+ebp-02Ah]
        mov byte [byte ebp+076h], al
.5:
        movsx eax, byte [byte ebp+07Ah]
        cmp eax, byte 0FFFFFFFFh
        jne short .6
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx eax, byte [byte edi+eax+02Eh]
        cmp eax, byte 8
        jne short .6
        mov eax, dword [byte ebp+046h]
        mov al, byte [byte eax+ebp-02Ah]
        mov byte [byte ebp+07Ah], al
.6:
        inc dword [byte ebp+046h]
        cmp dword [byte ebp+046h], byte 1Ah
        jl near .2
        mov edx, 4
        mov dword [byte ebp+046h], 0
.7:
        mov eax, dword [byte ebp+046h]
        mov al, byte [byte eax+ebp-02Ah]
        cmp al, byte [byte ebp+072h]
        je short .8
        mov eax, dword [byte ebp+046h]
        mov al, byte [byte eax+ebp-02Ah]
        cmp al, byte [byte ebp+07Eh]
        je short .8
        mov eax, dword [byte ebp+046h]
        mov al, byte [byte eax+ebp-02Ah]
        cmp al, byte [byte ebp+076h]
        je short .8
        mov eax, dword [byte ebp+046h]
        mov al, byte [byte eax+ebp-02Ah]
        cmp al, byte [byte ebp+07Ah]
        jne short .9
.8:
        dec edx
        jmp short .10
.9:
        mov eax, dword [byte ebp+046h]
        mov ebx, dword [byte ebp+046h]
        add eax, edx
        mov bl, byte [byte ebx+ebp-02Ah]
        mov byte [byte eax+ebp+0Eh], bl
.10:
        inc dword [byte ebp+046h]
        cmp dword [byte ebp+046h], byte 1Ah
        jl short .7
        lea edx, [byte ebp+07Eh]
        lea eax, [byte ebp+072h]
        call CompareTeamPoints
        test eax, eax
        jge short .11
        mov al, byte [byte ebp+072h]
        mov byte [byte ebp+0Eh], al
        mov al, byte [byte ebp+07Eh]
        jmp short .12
.11:
        mov al, byte [byte ebp+07Eh]
        mov byte [byte ebp+0Eh], al
        mov al, byte [byte ebp+072h]
.12:
        mov byte [byte ebp+0Fh], al
        lea edx, [byte ebp+07Ah]
        lea eax, [byte ebp+076h]
        call CompareTeamPoints
        test eax, eax
        jge short .13
        mov al, byte [byte ebp+076h]
        mov byte [byte ebp+010h], al
        mov al, byte [byte ebp+07Ah]
        jmp short .14
.13:
        mov al, byte [byte ebp+07Ah]
        mov byte [byte ebp+010h], al
        mov al, byte [byte ebp+076h]
.14:
        mov byte [byte ebp+011h], al
        mov dword [byte ebp+046h], 0
.15:
        mov eax, dword [byte ebp+046h]
        mov edx, dword [byte ebp+046h]
        mov al, byte [byte eax+ebp+0Eh]
        inc dword [byte ebp+046h]
        mov byte [byte edx+ebp-02Ah], al
        cmp dword [byte ebp+046h], byte 1Ah
        jl short .15
        mov eax, 0FCh
        xor edx, edx
        mov edi, dword [statsplayoffs]
        call SetTextColors
        xor ebx, ebx
        mov eax, 2Bh
        mov edx, 0Ah
        call GetLangText
        call DrawColorText
        mov eax, 30h
        mov edx, 0D2h
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        mov eax, 2Ch
        mov edx, 0FAh
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        mov eax, 2Dh
        mov edx, 122h
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        mov eax, 2Eh
        mov edx, 14Ah
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        mov eax, 2Fh
        mov edx, 172h
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        lea eax, [dword ebp-012Ah]
        push eax
        push dword [byte ebp+03Ah]
        push byte 0
        push dword 10000h
        push byte 0
        call TintRows
        add esp, byte 14h
        lea eax, [dword ebp-022Ah]
        push eax
        push dword [byte ebp+03Ah]
        push byte 0
        push byte 0
        push dword 10000h
        call TintRows
        mov eax, dword [SeasonType]
        add esp, byte 14h
        cmp eax, byte 1
        jb short .16
        jbe short .17
        cmp eax, byte 2
        je short .18
        jmp short .19
.16:
        test eax, eax
        jne short .19
        mov dword [byte ebp+06Eh], 54h
        jmp short .19
.17:
        mov dword [byte ebp+06Eh], 30h
        jmp short .19
.18:
        mov dword [byte ebp+06Eh], 19h
.19:
        mov dword [byte ebp+056h], 0
        mov dword [byte ebp+046h], 0
        mov dword [byte ebp+052h], 0
.20:
        mov eax, dword [byte ebp+046h]
        mov byte [byte eax+ebp-0Eh], 0
        imul eax, dword 31Bh
        mov dword [byte ebp+062h], 0
        movzx eax, byte [byte edi+eax+02Fh]
        mov dword [byte ebp+066h], 0
        cmp eax, dword [byte ebp+06Eh]
        jl short .21
        inc dword [byte ebp+056h]
.21:
        imul edx, dword [byte ebp+046h], dword 31Bh
        mov dword [byte ebp+06Ah], 0
        mov eax, dword [byte ebp+052h]
        mov dword [byte ebp+05Ah], 0
        mov dword [byte ebp+036h], eax
        mov eax, edi
        add edx, edi
.22:
        mov ebx, dword [byte ebp+06Ah]
        cmp ebx, dword [byte ebp+046h]
        je near .24
        mov ebx, dword [byte ebp+05Ah]
        mov ebx, dword [dword ebx+TeamConferenceIds]
        mov ecx, dword [byte ebp+036h]
        cmp ebx, dword [dword ecx+TeamConferenceIds]
        jne near .24
        movzx ebx, byte [byte edx+030h]
        add ebx, ebx
        mov dword [byte ebp+042h], ebx
        mov ecx, dword [byte ebp+042h]
        movzx ebx, byte [byte edx+032h]
        add ecx, ebx
        movzx ebx, byte [byte eax+030h]
        add ebx, ebx
        mov dword [byte ebp+042h], ebx
        mov dword [byte ebp+03Eh], ecx
        mov ecx, dword [byte ebp+042h]
        movzx ebx, byte [byte eax+032h]
        add ecx, ebx
        mov dword [byte ebp+042h], ecx
        movzx ebx, byte [byte eax+02Fh]
        mov ecx, dword [byte ebp+06Eh]
        sub ecx, ebx
        lea ebx, [ecx+ecx]
        add ebx, dword [byte ebp+042h]
        cmp ebx, dword [byte ebp+03Eh]
        jl short .23
        inc dword [byte ebp+062h]
.23:
        movzx ebx, byte [byte eax+030h]
        add ebx, ebx
        mov dword [byte ebp+042h], ebx
        mov ecx, dword [byte ebp+042h]
        movzx ebx, byte [byte eax+032h]
        add ecx, ebx
        movzx ebx, byte [byte edx+030h]
        add ebx, ebx
        mov dword [byte ebp+042h], ebx
        mov dword [byte ebp+03Eh], ecx
        mov ecx, dword [byte ebp+042h]
        movzx ebx, byte [byte edx+032h]
        add ecx, ebx
        mov dword [byte ebp+042h], ecx
        movzx ebx, byte [byte edx+02Fh]
        mov ecx, dword [byte ebp+06Eh]
        sub ecx, ebx
        lea ebx, [ecx+ecx]
        add ebx, dword [byte ebp+042h]
        cmp ebx, dword [byte ebp+03Eh]
        jge short .24
        inc dword [byte ebp+066h]
.24:
        add dword [byte ebp+05Ah], byte 4
        inc dword [byte ebp+06Ah]
        add eax, 31Bh
        cmp dword [byte ebp+06Ah], byte 1Ah
        jl near .22
        cmp dword [byte ebp+062h], byte 8
        jge short .25
        mov eax, dword [byte ebp+046h]
        mov byte [byte eax+ebp-0Eh], 1
.25:
        cmp dword [byte ebp+066h], byte 7
        jle short .26
        mov eax, dword [byte ebp+046h]
        mov byte [byte eax+ebp-0Eh], 2
.26:
        inc dword [byte ebp+046h]
        add dword [byte ebp+052h], byte 4
        cmp dword [byte ebp+046h], byte 1Ah
        jl near .20
        cmp dword [byte ebp+056h], byte 1Ah
        jne short .27
        mov ecx, 1Ah
        mov edx, 3030303h
        lea eax, [byte ebp-0Eh]
        call __STOSB
.27:
        mov dword [byte ebp+046h], 0
.28:
        cmp esi, byte 9
        jne short .29
        cmp dword [byte ebp+05Eh], byte 8
        je near .38
.29:
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx eax, byte [byte edi+eax+02Eh]
        cmp eax, byte 2
        jg short .30
        cmp dword [dword ebp-022Eh], byte 0
        je short .31
.30:
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx eax, byte [byte edi+eax+02Eh]
        cmp eax, byte 2
        jle near .40
        cmp dword [dword ebp-022Eh], byte 1
        jne near .40
.31:
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        movsx eax, byte [byte eax+ebp-0Eh]
        cmp eax, byte 1
        jne short .32
        imul eax, esi, byte 14h
        lea edx, [byte eax+012h]
        mov ecx, 186h
        lea ebx, [byte eax-02h]
        push edx
        lea eax, [dword ebp-012Ah]
        xor edx, edx
        mov dword [byte ebp+04Ah], 1
        call FillBox
.32:
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        movsx eax, byte [byte eax+ebp-0Eh]
        cmp eax, byte 2
        jne short .33
        imul ebx, esi, byte 14h
        mov ecx, 186h
        lea eax, [byte ebx+012h]
        xor edx, edx
        push eax
        dec ebx
        dec ebx
        lea eax, [dword ebp-022Ah]
        mov dword [byte ebp+04Eh], 1
        call FillBox
.33:
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        movsx eax, byte [byte eax+ebp-0Eh]
        cmp eax, byte 3
        jne short .34
        cmp esi, byte 9
        jge short .34
        imul eax, esi, byte 14h
        lea edx, [byte eax+012h]
        mov ecx, 186h
        lea ebx, [byte eax-02h]
        push edx
        lea eax, [dword ebp-012Ah]
        xor edx, edx
        mov dword [byte ebp+04Eh], 1
        jmp short .35
.34:
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        movsx eax, byte [byte eax+ebp-0Eh]
        cmp eax, byte 3
        jne short .36
        imul ebx, esi, byte 14h
        mov ecx, 186h
        lea eax, [byte ebx+012h]
        xor edx, edx
        push eax
        dec ebx
        dec ebx
        lea eax, [dword ebp-022Ah]
        mov dword [byte ebp+04Ah], 1
.35:
        call FillBox
.36:
        cmp esi, byte 3
        jge short .37
        imul ebx, esi, byte 14h
        mov eax, str_star
        xor edx, edx
        call DrawColorText
.37:
        imul ecx, esi, byte 14h
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        mov edx, 0Ah
        add eax, edi
        mov ebx, ecx
        add eax, byte 5
        call DrawColorText
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx eax, byte [byte edi+eax+02Fh]
        push eax
        push str_D6
        lea eax, [byte ebp+02Ah]
        push eax
        mov edx, 0D2h
        call sprintf_
        add esp, byte 0Ch
        mov ebx, ecx
        lea eax, [byte ebp+02Ah]
        call DrawColorTextCentred
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx eax, byte [byte edi+eax+030h]
        push eax
        push str_D6
        lea eax, [byte ebp+02Ah]
        push eax
        mov edx, 0FAh
        call sprintf_
        add esp, byte 0Ch
        mov ebx, ecx
        lea eax, [byte ebp+02Ah]
        call DrawColorTextCentred
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx eax, byte [byte edi+eax+031h]
        push eax
        push str_D6
        lea eax, [byte ebp+02Ah]
        push eax
        mov edx, 122h
        call sprintf_
        add esp, byte 0Ch
        mov ebx, ecx
        lea eax, [byte ebp+02Ah]
        call DrawColorTextCentred
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx eax, byte [byte edi+eax+032h]
        push eax
        push str_D6
        lea eax, [byte ebp+02Ah]
        push eax
        mov edx, 14Ah
        call sprintf_
        add esp, byte 0Ch
        mov ebx, ecx
        lea eax, [byte ebp+02Ah]
        call DrawColorTextCentred
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        movzx edx, byte [byte edi+eax+030h]
        movzx eax, byte [byte edi+eax+032h]
        add edx, edx
        add eax, edx
        push eax
        push str_D6
        lea eax, [byte ebp+02Ah]
        push eax
        mov ebx, ecx
        call sprintf_
        add esp, byte 0Ch
        mov edx, 172h
        lea eax, [byte ebp+02Ah]
        call DrawColorTextCentred
        mov eax, dword [byte ebp+046h]
        movsx eax, byte [byte eax+ebp-02Ah]
        imul eax, dword 31Bh
        inc esi
        cmp byte [byte edi+eax+02Fh], 0
        jbe short .40
        inc dword [byte ebp+05Eh]
        jmp short .40
.38:
        imul eax, esi, byte 14h
        xor ecx, ecx
        mov dword [byte ebp+032h], eax
.39:
        mov ebx, dword [byte ebp+032h]
        mov eax, str_dbgDash
        mov edx, ecx
        add ecx, byte 0Ah
        call DrawColorText
        cmp ecx, 15Eh
        jl short .39
        dec dword [byte ebp+046h]
        inc esi
.40:
        inc dword [byte ebp+046h]
        cmp dword [byte ebp+046h], byte 1Ah
        jl near .28
        cmp dword [byte ebp+04Ah], byte 0
        je short .41
        push dword 15Ch
        mov ecx, 0C8h
        mov ebx, 148h
        lea eax, [dword ebp-012Ah]
        xor edx, edx
        call FillBox
        mov eax, 31h
        mov ebx, 14Ah
        mov edx, 64h
        call GetLangText
        call DrawColorTextCentred
.41:
        cmp dword [byte ebp+04Eh], byte 0
        je short .42
        push dword 15Ch
        mov ecx, 19Ah
        mov ebx, 148h
        mov edx, 0D2h
        lea eax, [dword ebp-022Ah]
        call FillBox
        mov eax, 32h
        mov ebx, 14Ah
        mov edx, 136h
        call GetLangText
        call DrawColorTextCentred
.42:
        call SetScreenTarget
        push dword 82h
        mov eax, dword [dword ebp-0232h]
        push byte 64h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; SimulateRestOfSeason                            7B15A  96 PC, low confidence
; Simulates the rest of the season's games and the playoffs, with a progress
; box
;-----------------------------------------------------------------------------
SimulateRestOfSeason:
        push ebx
        push ecx
        push esi
        push edi
        enter 160h, 0
        push eax
        sub ebp, 82h
        lea eax, [dword ebp-0AAh]
        mov dword [byte ebp+026h], eax
        lea eax, [byte ebp-07Eh]
        mov dword [byte ebp+02Ah], eax
        mov eax, 33h
        call GetLangText
        mov edx, eax
        lea eax, [dword ebp-0AAh]
        call strcpy_
        mov eax, 1
        mov dword [byte ebp+04Eh], 0
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-07Eh]
        xor esi, esi
        call strcpy_
        mov eax, 1
        xor edi, edi
        call GetLangText
        mov dword [byte ebp+036h], eax
        cmp dword [SeasonType], byte 2
        jne short .1
        mov dword [byte ebp+066h], 19h
        jmp short .3
.1:
        cmp dword [SeasonType], byte 1
        jne short .2
        mov dword [byte ebp+066h], 30h
        jmp short .3
.2:
        mov dword [byte ebp+066h], 54h
.3:
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
        cmp dword [statsfromleague], byte 0
        jne short .4
        mov eax, 34h
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, TitleTextStyle
        call GetLangText
        call ShowMessage
        mov eax, dword [PlayoffTreeData]
        call LoadSeasonStats
        call HideMessage
.4:
        call SetScreenTarget
        mov dword [byte ebp+04Ah], 8Ch
        xor edx, edx
.5:
        movsx eax, byte [dword edx+SeasonUserSlot]
        cmp eax, byte 1
        jne short .6
        add edi, eax
.6:
        add edx, byte 1Ah
        cmp edx, 2A4h
        jne short .5
        cmp dword [dword ebp-0E2h], byte 0FFFFFFFFh
        je short .7
        imul eax, dword [dword ebp-0E2h], byte 1Ah
        add eax, SeasonUserName
        push eax
        mov eax, 38h
        call GetLangText
        push eax
        lea eax, [dword ebp-0DEh]
        push eax
        call sprintf_
        add esp, byte 0Ch
.7:
        cmp dword [dword ebp-0E2h], byte 0FFFFFFFFh
        jne short .9
        push byte 2
        push byte 0
        push dword 0F0h
        mov eax, 36h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp+036h]
        push byte 0
        mov edx, 1
        mov esi, 1
.8:
        call GetLangText
        call MessageBox
        jmp short .11
.9:
        cmp edi, byte 1
        jne short .10
        push byte 2
        push byte 0
        push dword 0F0h
        mov eax, 37h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp+036h]
        push byte 0
        mov edx, edi
        mov esi, edi
        jmp short .8
.10:
        push byte 2
        mov eax, dword [byte ebp+04Ah]
        push byte 0
        add eax, byte 64h
        push eax
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp+026h]
        push byte 0
        mov edx, 2
        lea eax, [dword ebp-0DEh]
        call MessageBox
        cmp eax, byte 1
        jne short .11
        mov esi, eax
.11:
        test esi, esi
        jne near .52
        mov ebx, 6
        lea eax, [byte ebp-052h]
        mov edx, dword [PlayoffTreeData]
        mov dword [byte ebp+06Ah], 1
        call MakeSeasonDbPath
        push esi
        lea eax, [byte ebp-052h]
        mov dword [byte ebp+05Ah], 41h
        push eax
        mov dword [byte ebp+03Ah], esi
        mov dword [byte ebp+056h], esi
        call OpenArtArchiveErr
        mov ecx, 0F0h
        mov ebx, 140h
        add esp, byte 8
        mov dword [statsbgshapes], eax
        mov edi, eax
        push dword [byte ebp+04Eh]
        mov eax, 39h
        mov edx, TitleTextStyle
        call GetLangText
        call ShowProgressBox
        mov edx, 4
        lea eax, [byte ebp-052h]
        xor ebx, ebx
        mov dword [byte ebp+046h], esi
        call MakeDirPath
.12:
        movsx eax, byte [dword esi+SeasonUserFlag]
        cmp eax, byte 1
        je short .13
        mov eax, dword [byte ebp+056h]
        cmp eax, dword [dword ebp-0E2h]
        jne near .21
        movsx eax, byte [dword esi+SeasonUserSlot]
        cmp eax, byte 1
        jne near .21
.13:
        movsx eax, byte [dword esi+SeasonUsers+1Ah]
        add eax, byte 41h
        push eax
        push dword [PlayoffTreeData]
        lea eax, [byte ebp-052h]
        push eax
        push str_S05dCsgDb2
        lea eax, [byte ebp-032h]
        push eax
        call sprintf_
        add esp, byte 14h
        lea eax, [byte ebp-032h]
        xor edx, edx
        call UnlinkJump
        movsx ebx, byte [dword esi+SeasonUsers+1Ah]
.14:
        movsx eax, byte [dword edx+SeasonUsers+1Ah]
        cmp eax, ebx
        jne short .15
        mov byte [dword edx+SeasonUsers+1Ah], 0FFh
.15:
        add edx, byte 1Ah
        cmp edx, 2A4h
        jne short .14
        inc dword [byte ebp+03Ah]
        mov eax, dword [byte ebp+03Ah]
        dec dword [SeasonOver]
        call UpdateProgressBox
        push dword [byte ebp+05Ah]
        push dword [PlayoffTreeData]
        lea eax, [byte ebp-052h]
        push eax
        push str_S05dCnzDb4
        lea eax, [byte ebp-032h]
        push eax
        call sprintf_
        add esp, byte 14h
        lea eax, [byte ebp-032h]
        mov ebx, 7
        call UnlinkJump
        mov byte [dword esi+SeasonUserSlot], 0
        lea eax, [byte ebp-032h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword 3A7h
        push SeasonUserRecords
        lea eax, [byte ebp-032h]
        push eax
        mov dword [byte ebp+06Eh], 2
        call SaveFileBlock
        add esp, byte 0Ch
        jmp short .20
.16:
        mov edx, dword [statsbgshapes]
        add edx, dword [byte ebp+06Eh]
        movzx eax, byte [byte edx+02h]
        cmp eax, dword [byte ebp+056h]
        jne short .17
        movzx eax, byte [byte edx+03h]
        imul eax, byte 1Ah
        movsx eax, byte [dword eax+SeasonUserSlot]
        cmp eax, byte 1
        jne short .18
.17:
        movzx eax, byte [byte edx+03h]
        cmp eax, dword [byte ebp+056h]
        jne short .19
        movzx eax, byte [byte edx+02h]
        imul eax, byte 1Ah
        movsx eax, byte [dword eax+SeasonUserSlot]
        cmp eax, byte 1
        je short .19
.18:
        movzx eax, byte [byte edx+04h]
        cmp eax, 0FFh
        jne short .19
        push byte 0
        mov ecx, 0FFFFFFFFh
        xor ebx, ebx
        xor eax, eax
        call SimulateGame
.19:
        add dword [byte ebp+06Eh], byte 6
.20:
        movzx eax, word [edi]
        cmp eax, dword [byte ebp+06Eh]
        jg short .16
.21:
        movsx eax, byte [dword esi+SeasonUserSlot]
        cmp eax, byte 1
        jne short .23
        mov eax, dword [statsplayoffs]
        add eax, dword [byte ebp+046h]
        movzx eax, byte [byte eax+02Fh]
        cmp eax, dword [byte ebp+066h]
        jne short .22
        cmp dword [byte ebp+06Ah], byte 1
        jne short .22
        mov dword [byte ebp+06Ah], 1
        jmp short .23
.22:
        mov dword [byte ebp+06Ah], 0
.23:
        inc dword [byte ebp+05Ah]
        add dword [byte ebp+046h], 31Bh
        inc dword [byte ebp+056h]
        add esi, byte 1Ah
        cmp dword [byte ebp+056h], byte 1Ah
        jl near .12
        cmp dword [byte ebp+06Ah], byte 1
        jne near .51
        imul eax, dword [byte ebp+066h], byte 1Ah
        sar eax, 1
        imul eax, byte 6
        inc eax
        inc eax
        mov dword [byte ebp+052h], eax
.24:
        movzx esi, word [edi]
        cmp esi, dword [byte ebp+052h]
        jge short .26
        mov edx, dword [statsbgshapes]
        add edx, esi
        movzx eax, byte [byte edx+02h]
        imul eax, byte 1Ah
        cmp byte [dword eax+SeasonUserSlot], 0
        jne short .25
        movzx eax, byte [byte edx+03h]
        imul eax, byte 1Ah
        cmp byte [dword eax+SeasonUserSlot], 0
        jne short .25
        mov eax, dword [SeasonRandomSeed]
        add eax, esi
        mov ecx, 0FFFFFFFFh
        call srand_
        push byte 0
        xor ebx, ebx
        xor eax, eax
        call SimulateGame
.25:
        add word [edi], byte 6
        jmp short .24
.26:
        mov dword [SeasonPlayoffs], 1
        mov byte [byte ebp+076h], 0FFh
        lea edi, [byte ebp+02Eh]
        mov esi, SimPlayoffBracketOrder
        mov byte [byte ebp+072h], 0FFh
        mov byte [byte ebp+07Ah], 0FFh
        movsd
        movsd
        mov byte [byte ebp+07Eh], 0FFh
        mov eax, dword [statsplayoffs]
        mov dword [byte ebp+062h], 0
        mov dword [byte ebp+05Eh], eax
        xor eax, eax
.27:
        add eax, byte 1Ah
        mov edx, dword [byte ebp+062h]
        mov bl, byte [byte ebp+062h]
        mov byte [dword eax+SeasonUserSim], 1
        inc dword [byte ebp+062h]
        mov byte [byte edx+ebp+0Ah], bl
        cmp dword [byte ebp+062h], byte 1Ah
        jl short .27
        mov ecx, CompareTeamPoints
        mov ebx, 1
        mov edx, 1Ah
        lea eax, [byte ebp+0Ah]
        mov dword [byte ebp+062h], 0
        call qsort_
.28:
        movsx eax, byte [byte ebp+076h]
        cmp eax, byte 0FFFFFFFFh
        jne short .29
        mov eax, dword [byte ebp+062h]
        movsx eax, byte [byte eax+ebp+0Ah]
        imul eax, dword 31Bh
        add eax, dword [byte ebp+05Eh]
        movzx eax, byte [byte eax+02Eh]
        cmp eax, byte 1
        jne short .29
        mov eax, dword [byte ebp+062h]
        mov al, byte [byte eax+ebp+0Ah]
        mov byte [byte ebp+076h], al
.29:
        movsx eax, byte [byte ebp+072h]
        cmp eax, byte 0FFFFFFFFh
        jne short .30
        mov eax, dword [byte ebp+062h]
        movsx eax, byte [byte eax+ebp+0Ah]
        imul eax, dword 31Bh
        add eax, dword [byte ebp+05Eh]
        movzx eax, byte [byte eax+02Eh]
        cmp eax, byte 2
        jne short .30
        mov eax, dword [byte ebp+062h]
        mov al, byte [byte eax+ebp+0Ah]
        mov byte [byte ebp+072h], al
.30:
        movsx eax, byte [byte ebp+07Ah]
        cmp eax, byte 0FFFFFFFFh
        jne short .31
        mov eax, dword [byte ebp+062h]
        movsx eax, byte [byte eax+ebp+0Ah]
        imul eax, dword 31Bh
        add eax, dword [byte ebp+05Eh]
        movzx eax, byte [byte eax+02Eh]
        cmp eax, byte 4
        jne short .31
        mov eax, dword [byte ebp+062h]
        mov al, byte [byte eax+ebp+0Ah]
        mov byte [byte ebp+07Ah], al
.31:
        movsx eax, byte [byte ebp+07Eh]
        cmp eax, byte 0FFFFFFFFh
        jne short .32
        mov eax, dword [byte ebp+062h]
        movsx eax, byte [byte eax+ebp+0Ah]
        imul eax, dword 31Bh
        add eax, dword [byte ebp+05Eh]
        movzx eax, byte [byte eax+02Eh]
        cmp eax, byte 8
        jne short .32
        mov eax, dword [byte ebp+062h]
        mov al, byte [byte eax+ebp+0Ah]
        mov byte [byte ebp+07Eh], al
.32:
        inc dword [byte ebp+062h]
        cmp dword [byte ebp+062h], byte 1Ah
        jl near .28
        mov ah, 4
        mov dword [byte ebp+062h], 0
.33:
        mov edx, dword [byte ebp+062h]
        mov al, byte [byte edx+ebp+0Ah]
        cmp al, byte [byte ebp+076h]
        je short .34
        cmp al, byte [byte ebp+072h]
        je short .34
        cmp al, byte [byte ebp+07Ah]
        je short .34
        cmp al, byte [byte ebp+07Eh]
        jne short .35
.34:
        dec ah
        jmp short .36
.35:
        movsx edx, ah
        mov ebx, dword [byte ebp+062h]
        add edx, dword [byte ebp+062h]
        mov al, byte [byte ebx+ebp+0Ah]
        mov byte [byte edx+ebp-012h], al
.36:
        inc dword [byte ebp+062h]
        cmp dword [byte ebp+062h], byte 1Ah
        jl short .33
        lea edx, [byte ebp+072h]
        lea eax, [byte ebp+076h]
        call CompareTeamPoints
        test eax, eax
        jge short .37
        mov al, byte [byte ebp+076h]
        mov byte [byte ebp-012h], al
        mov al, byte [byte ebp+072h]
        jmp short .38
.37:
        mov al, byte [byte ebp+072h]
        mov byte [byte ebp-012h], al
        mov al, byte [byte ebp+076h]
.38:
        mov byte [byte ebp-011h], al
        lea edx, [byte ebp+07Eh]
        lea eax, [byte ebp+07Ah]
        call CompareTeamPoints
        test eax, eax
        jge short .39
        mov al, byte [byte ebp+07Ah]
        mov byte [byte ebp-010h], al
        mov al, byte [byte ebp+07Eh]
        jmp short .40
.39:
        mov al, byte [byte ebp+07Eh]
        mov byte [byte ebp-010h], al
        mov al, byte [byte ebp+07Ah]
.40:
        mov byte [byte ebp-0Fh], al
        mov dword [byte ebp+062h], 0
.41:
        mov eax, dword [byte ebp+062h]
        mov edx, dword [byte ebp+062h]
        mov al, byte [byte eax+ebp-012h]
        inc dword [byte ebp+062h]
        mov byte [byte edx+ebp+0Ah], al
        cmp dword [byte ebp+062h], byte 1Ah
        jl short .41
        mov dword [byte ebp+062h], 0
        xor al, al
.42:
        movsx edx, al
        movsx ebx, byte [byte edx+ebp+0Ah]
        imul edx, ebx, dword 31Bh
        add edx, dword [byte ebp+05Eh]
        movzx edx, byte [byte edx+02Eh]
        cmp edx, byte 4
        je short .43
        cmp edx, byte 8
        jne short .44
.43:
        inc al
        jmp short .42
.44:
        mov edx, dword [byte ebp+062h]
        inc al
        movsx edx, byte [byte edx+ebp+02Eh]
        inc dword [byte ebp+062h]
        mov dword [nosplit edx*4+PlayoffSlotTeams], ebx
        cmp dword [byte ebp+062h], byte 8
        jl short .42
        mov dword [byte ebp+062h], 0
        xor al, al
.45:
        movsx edx, al
        movsx ebx, byte [byte edx+ebp+0Ah]
        imul edx, ebx, dword 31Bh
        add edx, dword [byte ebp+05Eh]
        movzx edx, byte [byte edx+02Eh]
        cmp edx, byte 1
        je short .46
        cmp edx, byte 2
        jne short .47
.46:
        inc al
        jmp short .45
.47:
        mov edx, dword [byte ebp+062h]
        inc al
        movsx edx, byte [byte edx+ebp+02Eh]
        inc dword [byte ebp+062h]
        mov dword [nosplit edx*4+PlayoffSimTeams], ebx
        cmp dword [byte ebp+062h], byte 8
        jl short .45
        mov dword [byte ebp+042h], 0
        mov dword [byte ebp+062h], 0
        mov ebx, PlayoffName
        xor edx, edx
.48:
        imul eax, dword [byte ebp+062h], byte 1Ah
        imul esi, dword [dword edx+PlayoffSlotTeams], byte 1Ah
        mov ecx, 1Ah
        mov edi, ebx
        add esi, SeasonUserName
        mov dword [byte ebp+03Eh], eax
        rep movsb
        mov eax, dword [byte ebp+03Eh]
        cmp byte [dword eax+PlayoffTeams], 0
        jne short .49
        imul eax, dword [dword edx+PlayoffSlotTeams], dword 31Bh
        add eax, dword [byte ebp+05Eh]
        add eax, byte 1Eh
        call strlen_
        imul esi, dword [dword edx+PlayoffSlotTeams], dword 31Bh
        mov edi, ebx
        add esi, dword [byte ebp+05Eh]
        mov ecx, eax
        add esi, byte 1Eh
        rep movsb
        jmp short .50
.49:
        inc dword [byte ebp+042h]
.50:
        inc dword [byte ebp+062h]
        add ebx, byte 1Ah
        add edx, byte 4
        cmp dword [byte ebp+062h], byte 10h
        jl short .48
        cmp dword [byte ebp+042h], byte 0
        jne short .51
        call PlayoffRound1
        call PlayoffRound2
        call PlayoffRound3
        call PlayoffFinal
.51:
        mov ebx, 7
        lea eax, [byte ebp-052h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword 3A7h
        push SeasonUserRecords
        lea eax, [byte ebp-052h]
        push eax
        call SaveFileBlock
        mov ebx, 0Ah
        add esp, byte 0Ch
        lea eax, [byte ebp-052h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword 39Dh
        push PlayoffHeader
        lea eax, [byte ebp-052h]
        push eax
        call SaveFileBlock
        mov ebx, 5
        add esp, byte 0Ch
        lea eax, [byte ebp-052h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword [SeasonDbSize]
        push dword [seasondb]
        lea eax, [byte ebp-052h]
        push eax
        call SaveFileBlock
        mov ebx, 6
        add esp, byte 0Ch
        lea eax, [byte ebp-052h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        lea eax, [byte ebp-052h]
        push eax
        call FileSizeByName
        add esp, byte 4
        push eax
        push dword [statsbgshapes]
        lea eax, [byte ebp-052h]
        push eax
        call SaveFileBlock
        mov ebx, 4
        add esp, byte 0Ch
        lea eax, [byte ebp-052h]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        push dword [PlayoffStatsSize]
        push dword [statsplayoffs]
        lea eax, [byte ebp-052h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        push dword [statsbgshapes]
        call FreeMemBlock
        add esp, byte 4
        call HideProgressBox
.52:
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PickIndexHotspots                               7B991  96 PC, low confidence
; Name index screen click areas
;-----------------------------------------------------------------------------
PickIndexHotspots:                              ; name index screen click areas; used by PickIndexEntryScreen
        db 074h,00h,00h,00h,0BAh,01h,00h,00h,082h,00h,00h,00h,0B4h,01h,00h,00h
        db 0F0h,00h,00h,00h,0B4h,01h,00h,00h,0FCh,00h,00h,00h,0BBh,01h,00h,00h
        db 0FCh,00h,00h,00h,0C6h,01h,00h,00h,0EEh,00h,00h,00h,0CAh,01h,00h,00h
        db 07Fh,00h,00h,00h,0CAh,01h,00h,00h,074h,00h,00h,00h,0C2h,01h,00h,00h
        db 08Dh,01h,00h,00h,0BAh,01h,00h,00h,096h,01h,00h,00h,0B4h,01h,00h,00h
        db 07h,02h,00h,00h,0B4h,01h,00h,00h,013h,02h,00h,00h,0BBh,01h,00h,00h
        db 013h,02h,00h,00h,0C4h,01h,00h,00h,05h,02h,00h,00h,0CBh,01h,00h,00h
        db 097h,01h,00h,00h,0CBh,01h,00h,00h,08Dh,01h,00h,00h,0C2h,01h,00h,00h
SeasonMenuCommands:                             ; used by RunSeasonMenus
        db 0A1h,0A5h,03h,027h,02h,027h,01h,027h,00h,027h,0FFh,026h,0FEh,026h,0FDh,026h
        db 0FCh,026h,0FBh,026h,00h,00h
SeasonMenuCommandJumpTable:                     ; jump table for the switch cases of RunSeasonMenus
        dd RunSeasonMenus_CB
        dd RunSeasonMenus_25A
        dd RunSeasonMenus_138
        dd RunSeasonMenus_6E
        dd RunSeasonMenus_D2
        dd RunSeasonMenus_182
        dd RunSeasonMenus_189
        dd RunSeasonMenus_1E1
        dd RunSeasonMenus_224
        dd RunSeasonMenus_238
        dd RunSeasonMenus_24E
        dd RunSeasonMenus_533
;-----------------------------------------------------------------------------
; RunSeasonMenus                               7BA57  96 PC, medium confidence
; From RunFrontEnd: loads SEASON.NDX and runs the season screens
;-----------------------------------------------------------------------------
RunSeasonMenus:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 328h, 0
        mov dword [SaveFileHandle], 0FFFFFFFFh
        mov edx, 4
        lea eax, [byte ebp-028h]
        xor ebx, ebx
        mov dword [SeasonMenuActive], 0
        call MakeDirPath
        cmp dword [SeasonMenuActive], byte 0
        jne short .1
        mov edx, str_SEASONNDX2
        lea eax, [byte ebp-028h]
        call NameIndexLoad
        mov dword [SeasonMenuActive], eax
.1:
        cmp dword [SeasonMenuActive], byte 0
        je short .2
        mov eax, dword [SeasonMenuActive]
        cmp dword [byte eax+066h], byte 0
        jne short .3
.2:
        mov ecx, 2711h
        jmp short .4
.3:
        mov ecx, 2710h
.4:
        xor esi, esi
        jmp near RunSeasonMenus_138.6
RunSeasonMenus_6E:
        mov eax, esi
        call NewSeasonScreen
        mov edx, dword [SeasonMenuActive]
        mov edi, eax
        mov ecx, eax
        xor eax, eax
        xor ebx, ebx
        call NameIndexFree
        mov edx, 4
        lea eax, [byte ebp-028h]
        mov dword [SeasonMenuActive], 0
        call MakeDirPath
        mov edx, str_SEASONNDX2
        lea eax, [byte ebp-028h]
        call NameIndexLoad
        mov dword [SeasonMenuActive], eax
        cmp edi, 2710h
        jne near RunSeasonMenus_138.6
        test eax, eax
        je short RunSeasonMenus_CB
        cmp dword [byte eax+066h], byte 0
        jne near RunSeasonMenus_138.6
RunSeasonMenus_CB:
        xor ecx, ecx
        jmp near RunSeasonMenus_138.6
RunSeasonMenus_D2:
        call SeasonMenuScreen
        mov ecx, eax
        cmp eax, 2714h
        jne near RunSeasonMenus_138.6
        cmp dword [SeasonPlayoffs], byte 0
        jne short RunSeasonMenus_138.6
        imul eax, dword [SeasonDay], byte 1Ah
        movsx edx, byte [dword eax+SeasonUsers+1Ah]
        cmp edx, byte 0FFFFFFFFh
        je short RunSeasonMenus_138.6
        movsx eax, byte [dword eax+SeasonUsers+1Ah]
        and eax, byte 1Fh
        and dword [SeasonGameOpts], 0FFFE0FFFh
        shl eax, 0Ch
        or dword [SeasonGameOpts], eax
        call ReadSeasonDbHeader
        mov dword [SaveFileHandle], eax
        mov eax, dword [PlayoffTreeData]
        mov ecx, 2715h
        call LoadSeasonStats
        jmp short RunSeasonMenus_138.6
RunSeasonMenus_138:
        push byte 0
        mov ecx, 2711h
        mov ebx, 2712h
        mov edx, SeasonMenuActive
        mov eax, 1
        call PickIndexEntryScreen
        xor esi, esi
.5:
        mov ecx, eax
.6:
        test ecx, ecx
        je near RunSeasonMenus_533.28
        lea eax, [byte ecx-015h]
        cmp eax, 0A5A1h
        ja near RunSeasonMenus_CB
        mov ecx, 0Ch
        mov edi, SeasonMenuCommands
        repne scasw
        jmp dword [nosplit cs:ecx*4+SeasonMenuCommandJumpTable]
RunSeasonMenus_182:
        call StandingsScreen
        jmp short RunSeasonMenus_138.5
RunSeasonMenus_189:
        cmp dword [SeasonPlayoffs], byte 0
        jne short .7
        call CalendarScreen
        jmp short RunSeasonMenus_138.5
.7:
        mov eax, 1
        call PlayoffTreeScreen
        cmp eax, 2714h
        je short RunSeasonMenus_138.5
        cmp eax, 0A5B6h
        jne short .8
        mov eax, dword [PlayoffGameOpts]
        shl eax, 0Fh
        shr eax, 1Bh
        mov ecx, 2715h
        call ReadPlayoffDbHeader
        mov dword [gameopts], PlayoffHeader
        mov dword [SaveFileHandle], eax
        jmp short RunSeasonMenus_138.6
.8:
        mov ecx, 2712h
        jmp near RunSeasonMenus_138.6
RunSeasonMenus_1E1:
        mov eax, 2714h
        call RunControllerScreen
        mov ecx, eax
        cmp eax, 2714h
        jne near RunSeasonMenus_138.6
        cmp dword [SaveFileHandle], byte 0FFFFFFFFh
        je near RunSeasonMenus_138.6
        mov eax, SaveFileHandle
        call FileClose
        cmp dword [statsfromleague], byte 0
        jne short RunSeasonMenus_189.8
        mov eax, dword [PlayoffTreeData]
        call LoadSeasonStats
        jmp short RunSeasonMenus_189.8
RunSeasonMenus_224:
        mov eax, dword [PlayoffTreeData]
        mov ecx, 2712h
        call RunStatsMenu
        jmp near RunSeasonMenus_138.6
RunSeasonMenus_238:
        mov ecx, 2711h
        xor eax, eax
        mov esi, 1
.9:
        call RunRosterScreens
        jmp near RunSeasonMenus_138.6
RunSeasonMenus_24E:
        mov eax, 1
        mov ecx, 2712h
        jmp short RunSeasonMenus_238.9
RunSeasonMenus_25A:
        cmp dword [SeasonPlayoffs], byte 0
        je near .22
        mov eax, dword [SaveFileHandle]
        mov ecx, 2714h
        call PlayMenuGame
        cmp dword [gameresult], byte 1
        jne near .21
        call DeleteSeasonDb
        movsx eax, byte [PlayoffHomeTeam]
        imul eax, byte 1Ah
        movsx eax, byte [dword eax+PlayoffTeams]
        cmp eax, byte 1
        jne short .10
        mov al, byte [PlayoffHomeTeam]
        mov edx, 1
        mov byte [PlayoffUserTeam], al
        xor eax, eax
        call UpdateTeamDbs
.10:
        movsx eax, byte [PlayoffAwayTeam]
        imul eax, byte 1Ah
        movsx eax, byte [dword eax+PlayoffTeams]
        cmp eax, byte 1
        jne short .11
        mov al, byte [PlayoffAwayTeam]
        mov edx, 1
        mov byte [PlayoffUserTeam], al
        xor eax, eax
        call UpdateTeamDbs
.11:
        call SaveSeasonTeams
        xor eax, eax
        call SeedPlayoffs
        cmp byte [PlayoffRoundNum], 0
        jne short .12
        call PlayoffRound1
        jmp short .15
.12:
        movsx eax, byte [PlayoffRoundNum]
        cmp eax, byte 1
        jne short .13
        call PlayoffRound2
        jmp short .15
.13:
        cmp eax, byte 2
        jne short .14
        call PlayoffRound3
        jmp short .15
.14:
        cmp eax, byte 3
        jne short .15
        call PlayoffFinal
.15:
        call ClearPlayoffTree
        mov edx, dword [PlayoffTeamIn]
        xor edi, edi
        xor eax, eax
.16:
        cmp byte [edx+eax], 0
        je short .17
        mov edi, 1
.17:
        inc eax
        cmp eax, byte 0Fh
        jl short .16
        test edi, edi
        jne short .21
        cmp byte [PlayoffRoundNum], 0
        jne short .18
        call PlayoffRound1
.18:
        movsx eax, byte [PlayoffRoundNum]
        cmp eax, byte 1
        jne short .19
        call PlayoffRound2
.19:
        movsx eax, byte [PlayoffRoundNum]
        cmp eax, byte 2
        jne short .20
        call PlayoffRound3
.20:
        movsx eax, byte [PlayoffRoundNum]
        cmp eax, byte 3
        jne short .21
        call PlayoffFinal
.21:
        mov eax, 1
        call SaveLeagueDb
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call MusicDone
        test eax, eax
        jne near RunSeasonMenus_138.6
        call PlayMusic
        jmp near RunSeasonMenus_138.6
.22:
        mov eax, dword [SaveFileHandle]
        mov dword [gameopts], SeasonUserRecords
        call PlayMenuGame
        mov eax, dword [statsplayoffs]
        mov dword [byte ebp-08h], eax
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call MusicDone
        test eax, eax
        jne short .23
        call PlayMusic
.23:
        cmp dword [gameresult], byte 1
        jne near RunSeasonMenus_189.8
        call SetScreenTarget
        push byte 0
        call ClearClipRect
        movzx eax, byte [SeasonGameHome]
        add esp, byte 4
        cmp eax, byte 4
        jg short .24
        jne short .25
        movzx edx, byte [SeasonGameAway]
        cmp edx, byte 6
        jle short .25
        cmp eax, byte 7
        jge short .25
.24:
        movzx eax, byte [SeasonGameHome+2]
        imul eax, byte 1Ah
        mov byte [dword eax+SeasonUsers+1Bh], 1
        movzx eax, byte [SeasonGameHome+3]
        imul eax, byte 1Ah
        mov byte [dword eax+SeasonUsers+1Bh], 1
.25:
        call DeleteSeasonFiles
        mov ecx, 300h
        mov eax, dword [SeasonDay]
        lea edi, [dword ebp-0328h]
        mov dword [byte ebp-04h], eax
        xor eax, eax
        rep stosb
        lea eax, [dword ebp-0328h]
        call SetScreenColors
        lea eax, [dword ebp-0328h]
        push eax
        push dword 100h
        push byte 0
        call SetPaletteEntries
        mov eax, 3Eh
        mov ecx, 0C8h
        add esp, byte 0Ch
        mov ebx, 140h
        mov edx, TitleTextStyle
        call GetLangText
        call ShowMessage
        imul ecx, dword [SeasonDay], dword 31Bh
        mov eax, dword [SeasonGamePending]
        add ecx, dword [byte ebp-08h]
        movzx edx, byte [SeasonGameHome+2]
        mov ecx, dword [dword ecx+eax*4+014Fh]
        imul eax, edx, byte 1Ah
        movsx eax, byte [dword eax+SeasonUserSlot]
        cmp eax, byte 1
        jne short .26
        mov dword [SeasonDay], edx
        mov eax, ecx
        xor edx, edx
        call UpdateTeamDbs
.26:
        movzx edx, byte [SeasonGameHome+3]
        imul eax, edx, byte 1Ah
        movsx eax, byte [dword eax+SeasonUserSlot]
        cmp eax, byte 1
        jne short .27
        mov dword [SeasonDay], edx
        mov eax, ecx
        xor edx, edx
        call UpdateTeamDbs
.27:
        call HideMessage
        mov eax, dword [byte ebp-04h]
        xor edx, edx
        mov dword [SeasonDay], eax
        mov eax, ecx
        call SimSeasonGames
        call BlackPalette
        mov ecx, 2714h
        jmp near RunSeasonMenus_138.6
RunSeasonMenus_533:
        mov eax, 0A5B5h
        call RunControllerScreen
        jmp near RunSeasonMenus_138.5
.28:
        mov edx, dword [SeasonMenuActive]
        xor eax, eax
        call NameIndexFree
        mov eax, ecx
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PickIndexEntryScreen                            7BFAF  96 PC, low confidence
; Picks an entry of a name index (seasons, exhibition records) from a
; scrolling list (BALL, ">%s"), with new / delete buttons (BT10-BT12)
;-----------------------------------------------------------------------------
PickIndexEntryScreen:
        push esi
        push edi
        enter 0C34h, 0
        push eax
        push edx
        push ebx
        push ecx
        sub ebp, byte 7Eh
        mov ecx, 20h
        lea edi, [dword ebp-0AAh]
        mov esi, PickIndexHotspots
        mov eax, 1
        rep movsd
        call GetLangText
        mov dword [byte ebp+04Eh], eax
        xor eax, eax
        call GetLangText
        push byte 0
        push dword 0C2h
        push dword 1AEh
        mov dword [byte ebp+06Eh], 0
        mov dword [byte ebp+052h], eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [byte ebp+066h], eax
        cmp dword [dword ebp-0BBAh], byte 1
        jb short .1
        jbe short .2
        cmp dword [dword ebp-0BBAh], byte 2
        jbe short .3
        cmp dword [dword ebp-0BBAh], byte 5
        je short .4
        jmp short .6
.1:
        cmp dword [dword ebp-0BBAh], byte 0
        jne short .6
        mov eax, 4Eh
        jmp short .5
.2:
        mov eax, 5Eh
        jmp short .5
.3:
        mov eax, 50h
        jmp short .5
.4:
        mov eax, 4Fh
.5:
        xor edx, edx
        call LoadPackedFile
        mov dword [byte ebp+072h], eax
.6:
        push str_Pal16
        push dword [byte ebp+072h]
        call FindShape
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp+05Eh], eax
        call SetScreenColors
        call SetScreenTarget
        push str_BKGD11
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        lea edi, [dword ebp-0BB6h]
        mov esi, TeamStatsBitmap
        call PutBlockAtOwnPos
        add esp, byte 4
        mov eax, 6
        lea edx, [dword ebp-0BB6h]
        call OpenScreen
        mov eax, 13h
        mov ecx, 66h
        call InitMenuItems
        rep movsb
        mov byte [dword ebp-0B71h], 7
        mov byte [dword ebp-0B72h], 0
        mov byte [dword ebp-0B73h], 0
        mov ecx, 66h
        lea edi, [dword ebp-0B50h]
        mov esi, BottomBarArt+56h
        mov byte [dword ebp-0B74h], 0
        push str_BT003
        rep movsb
        push dword [byte ebp+072h]
        mov byte [dword ebp-0B0Eh], 6
        cmp dword [dword ebp-0BBAh], byte 5
        setne al
        mov byte [dword ebp-0B0Bh], 1
        add al, 7
        mov byte [dword ebp-0B0Dh], 1
        mov byte [dword ebp-0B0Ch], al
        call FindShape
        add esp, byte 8
        push str_BT016
        push dword [byte ebp+072h]
        mov dword [dword ebp-08D2h], eax
        call FindShape
        add esp, byte 8
        push str_BT026
        push dword [byte ebp+072h]
        mov dword [dword ebp-08CEh], eax
        call FindShape
        mov dword [dword ebp-08CAh], eax
        mov eax, dword [dword ebp-08D2h]
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-08C6h], eax
        mov eax, dword [dword ebp-08D2h]
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-08B2h], 0C9h
        mov dword [dword ebp-08AEh], 1BFh
        mov dword [dword ebp-08DCh], 8
        mov dword [dword ebp-08C2h], eax
        lea eax, [dword ebp-0AAh]
        mov byte [dword ebp-08A8h], 0
        mov dword [dword ebp-08D8h], eax
        cmp dword [dword ebp-0BBAh], byte 5
        je short .7
        mov byte [dword ebp-08A7h], 8
        jmp short .8
.7:
        mov byte [dword ebp-08A7h], 1
.8:
        mov eax, dword [dword ebp-0BBEh]
        mov eax, dword [eax]
        mov al, byte [byte eax+066h]
        add al, 8
        mov byte [dword ebp-08AAh], al
        movzx eax, al
        cmp eax, byte 11h
        jle short .9
        mov byte [dword ebp-08AAh], 11h
.9:
        cmp dword [dword ebp-0BBAh], byte 5
        je near .10
        push str_BT105
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push str_BT115
        push dword [byte ebp+072h]
        mov dword [dword ebp-086Ch], eax
        call FindShape
        add esp, byte 8
        push str_BT122
        push dword [byte ebp+072h]
        mov dword [dword ebp-0868h], eax
        call FindShape
        mov dword [dword ebp-0864h], eax
        mov eax, dword [dword ebp-086Ch]
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-0860h], eax
        mov eax, dword [dword ebp-086Ch]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-084Ch], 1EEh
        mov dword [dword ebp-0848h], 1BFh
        mov dword [dword ebp-085Ch], eax
        lea eax, [byte ebp-06Ah]
        mov dword [dword ebp-0876h], 8
        mov dword [dword ebp-0872h], eax
        mov eax, dword [dword ebp-0BBEh]
        mov byte [dword ebp-0842h], 7
        mov byte [dword ebp-0841h], 1
        mov eax, dword [eax]
        mov al, byte [byte eax+066h]
        add al, 8
        mov byte [dword ebp-0844h], al
        movzx eax, al
        add esp, byte 8
        cmp eax, byte 11h
        jle short .11
        mov byte [dword ebp-0844h], 11h
        jmp short .11
.10:
        mov word [dword ebp-086Eh], 2
.11:
        push str_BALL3
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        push str_SLDR
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        push str_BKGD11
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, dword [dword ebp-0BBEh]
        mov ecx, 9
        mov eax, dword [eax]
        lea edx, [dword ebp-0A84h]
        push byte 0
        mov ebx, dword [byte eax+066h]
        lea eax, [dword ebp-01E2h]
        call InitVScrollBar
        push str_AR00
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push str_AR01
        push dword [byte ebp+072h]
        mov dword [dword ebp-0A6Ah], eax
        call FindShape
        mov dword [dword ebp-0A66h], eax
        mov eax, dword [dword ebp-0A6Ah]
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_AR10
        mov dword [dword ebp-0A5Eh], eax
        mov eax, dword [dword ebp-0A6Ah]
        push dword [byte ebp+072h]
        movsx eax, word [byte eax+0Eh]
        mov byte [dword ebp-0A41h], 6
        mov byte [dword ebp-0A40h], 9
        mov dword [dword ebp-0A5Ah], eax
        call FindShape
        add esp, byte 8
        push str_AR11
        push dword [byte ebp+072h]
        mov dword [dword ebp-0938h], eax
        call FindShape
        mov dword [dword ebp-0934h], eax
        mov eax, dword [dword ebp-0938h]
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-092Ch], eax
        mov eax, dword [dword ebp-0938h]
        mov esi, 0CEh
        movsx eax, word [byte eax+0Eh]
        xor ecx, ecx
        mov dword [dword ebp-0928h], eax
        mov al, cl
        mov ebx, 0BAh
        add al, 0Ah
        add esp, byte 8
        mov byte [byte ebp+07Ah], al
        mov al, cl
        mov byte [dword ebp-0910h], 3
        add al, 8
        mov byte [dword ebp-090Fh], 1
        mov byte [byte ebp+076h], al
        lea eax, [dword ebp-0422h]
        mov byte [dword ebp-090Eh], 9
        mov dword [byte ebp+05Ah], eax
        mov eax, 396h
.12:
        mov edx, ecx
        imul edi, ecx, byte 14h
        shl edx, 6
        mov dword [dword edx+ebp-0422h], 5Ch
        mov dword [dword edx+ebp-041Ah], 20Ah
        mov dword [dword edx+ebp-0412h], 20Ah
        add eax, byte 66h
        mov dword [dword edx+ebp-040Ah], 5Ch
        mov dword [dword eax+ebp-0C0Ch], 4
        mov dword [dword edx+ebp-041Eh], ebx
        mov byte [dword eax+ebp-0BD8h], 0
        mov dword [dword edx+ebp-0416h], ebx
        mov byte [dword eax+ebp-0BD7h], 3
        mov dword [dword edx+ebp-040Eh], esi
        mov dword [dword eax+ebp-0BE2h], 133h
        mov dword [dword edx+ebp-0406h], esi
        mov edx, dword [byte ebp+05Ah]
        add esi, byte 14h
        add ebx, byte 14h
        add dword [byte ebp+05Ah], byte 40h
        mov dword [dword eax+ebp-0C08h], edx
        mov dl, byte [byte ebp+076h]
        inc byte [byte ebp+076h]
        mov byte [dword eax+ebp-0BDAh], dl
        mov dl, byte [byte ebp+07Ah]
        inc ecx
        mov byte [dword eax+ebp-0BD9h], dl
        lea edx, [dword edi+0C4h]
        inc byte [byte ebp+07Ah]
        mov dword [dword eax+ebp-0BDEh], edx
        cmp ecx, byte 9
        jl near .12
        movzx eax, byte [dword ebp-08AAh]
        imul eax, byte 66h
        mov byte [dword ebp-07DEh], 9
        mov byte [dword ebp-04ADh], 7
        mov ebx, dword [byte ebp+072h]
        mov byte [dword eax+ebp-0B73h], 7
        lea eax, [dword ebp-01E2h]
        mov edx, dword [byte ebp+066h]
        call DrawScrollBar
        mov eax, dword [dword ebp-0BBEh]
        push dword [byte ebp+06Eh]
        mov ecx, dword [dword ebp-01BEh]
        mov eax, dword [eax]
        call DrawIndexEntries
        mov ebx, 3
        mov edx, dword [byte ebp+05Eh]
        xor eax, eax
        mov dword [byte ebp+06Ah], 0FFFFFFFFh
        call FadePalette
        jmp near .21
.13:
        push byte 2
        push byte 0
        lea eax, [byte ebp+056h]
        push eax
        mov eax, dword [dword ebp-0BBEh]
        mov ebx, 0FFFFFFFFh
        mov eax, dword [eax]
        mov esi, 9
        lea edx, [dword ebp-0BB6h]
        add esi, dword [byte eax+066h]
        xor ecx, ecx
        mov eax, esi
        jmp near .23
.14:
        cmp dword [byte ebp+056h], byte 3
        jb short .15
        cmp dword [byte ebp+056h], byte 4
        jbe near .31
        cmp dword [byte ebp+056h], byte 7
        jb near .34
        jbe near .35
        cmp dword [byte ebp+056h], byte 8
        je near .49
        jmp near .50
.15:
        cmp dword [byte ebp+056h], byte 0
        jbe short .16
        cmp dword [byte ebp+056h], byte 1
        je short .17
        jmp near .50
.16:
        call SlideInSideBar
        mov eax, dword [dword ebp+08Eh]
        jmp near .20
.17:
        cmp dword [byte ebp+06Eh], byte 0FFFFFFFFh
        jle near .21
        call SlideInTitleBar
        mov eax, dword [dword ebp-0BBEh]
        mov edx, dword [byte ebp+06Eh]
        mov ecx, dword [dword ebp-0BBEh]
        mov eax, dword [eax]
        lea ebx, [byte ebp+026h]
        call NameIndexId
        mov ecx, dword [ecx]
        mov edx, eax
        mov eax, ecx
        call NameIndexPath
        cmp dword [dword ebp-0BBAh], byte 1
        jb short .18
        jbe near .26
        cmp dword [dword ebp-0BBAh], byte 2
        jbe near .29
        cmp dword [dword ebp-0BBAh], byte 5
        je near .28
        jmp short .21
.18:
        cmp dword [dword ebp-0BBAh], byte 0
        jne short .21
        mov edx, SaveFileHandle
        lea eax, [byte ebp+026h]
        call FileOpenRead
        test eax, eax
        jne short .24
.19:
        mov eax, dword [dword ebp-0BC2h]
.20:
        mov dword [byte ebp+06Ah], eax
.21:
        cmp dword [byte ebp+06Ah], byte 0FFFFFFFFh
        jne near .51
        mov dword [byte ebp+056h], 0FFFFFFFFh
.22:
        cmp dword [byte ebp+056h], byte 0
        jge near .14
        mov eax, dword [dword ebp-0BBEh]
        mov eax, dword [eax]
        cmp dword [byte eax+066h], byte 9
        jle near .13
        push byte 2
        lea eax, [byte ebp+056h]
        push byte 0
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-0BB6h]
        push eax
        xor ecx, ecx
        mov eax, 12h
.23:
        call RunMenu
        jmp short .22
.24:
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp+052h]
        push byte 0
        mov eax, 3Fh
.25:
        mov edx, 1
        call GetLangText
        call MessageBox
        jmp short .21
.26:
        lea eax, [byte ebp+026h]
.27:
        movsx edx, byte [eax]
        inc eax
        cmp edx, byte 5Ch
        jne short .27
        call atoi_
        mov ebx, 7
        mov dword [byte ebp+062h], eax
        mov edx, eax
        lea eax, [byte ebp+026h]
        call MakeSeasonDbPath
        push byte 0
        lea eax, [byte ebp+026h]
        push eax
        call OpenArtArchive
        mov edx, eax
        add esp, byte 8
        test eax, eax
        je near .21
        mov ecx, 3A7h
        mov edi, SeasonUserRecords
        mov esi, eax
        rep movsb
        push edx
        call FreeMemBlock
        add esp, byte 4
        mov ebx, 0Ah
        call FreeStatsTables
        mov eax, dword [dword ebp-0BC2h]
        mov edx, dword [byte ebp+062h]
        mov dword [byte ebp+06Ah], eax
        lea eax, [byte ebp+026h]
        call MakeSeasonDbPath
        push byte 0
        lea eax, [byte ebp+026h]
        push eax
        mov edi, PlayoffHeader
        call OpenArtArchive
        mov ecx, 39Dh
        add esp, byte 8
        mov esi, eax
        mov edx, eax
        rep movsb
        push edx
        call FreeMemBlock
        add esp, byte 4
        jmp near .21
.28:
        mov edx, SaveFileHandle
        lea eax, [byte ebp+026h]
        call FileOpenRead
        test eax, eax
        je near .19
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov eax, 40h
        mov ecx, TitleTextStyle
        push byte 0
        lea ebx, [byte ebp+052h]
        jmp near .25
.29:
        lea eax, [byte ebp+026h]
.30:
        movsx edx, byte [eax]
        inc eax
        cmp edx, byte 5Ch
        jne short .30
        call atoi_
        mov ebx, 7
        mov edx, eax
        lea eax, [byte ebp+026h]
        call MakePlayoffDbPath
        push byte 0
        lea eax, [byte ebp+026h]
        push eax
        call OpenArtArchive
        mov edx, eax
        add esp, byte 8
        test eax, eax
        je near .21
        mov ecx, 39Dh
        mov edi, PlayoffHeader
        mov esi, eax
        rep movsb
        push edx
        call FreeMemBlock
        add esp, byte 4
        call FreeStatsTables
        jmp near .19
.31:
        lea eax, [dword ebp-01E2h]
        mov ebx, dword [byte ebp+072h]
        mov edx, dword [byte ebp+066h]
        call ScrollBarUp
.32:
        mov eax, dword [dword ebp-0BBEh]
        push dword [byte ebp+06Eh]
        mov ecx, dword [dword ebp-01BEh]
        mov eax, dword [eax]
        call DrawIndexEntries
        lea eax, [dword ebp-01E2h]
.33:
        call DrawScrollBar
        jmp near .21
.34:
        lea eax, [dword ebp-01E2h]
        mov ebx, dword [byte ebp+072h]
        mov edx, dword [byte ebp+066h]
        call ScrollBarDown
        jmp short .32
.35:
        cmp dword [byte ebp+06Eh], byte 0FFFFFFFFh
        je near .21
        imul edx, dword [byte ebp+06Eh], byte 36h
        mov eax, dword [dword ebp-0BBEh]
        mov eax, dword [eax]
        add eax, byte 6Eh
        add eax, edx
        add eax, byte 0Dh
        push eax
        mov eax, 1D8h
        call GetLangText
        push eax
        lea eax, [byte ebp-02Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp+04Eh]
        push byte 0
        mov edx, 2
        lea eax, [byte ebp-02Ah]
        call MessageBox
        cmp eax, byte 1
        jne near .46
        cmp eax, dword [dword ebp-0BBAh]
        ja short .36
        jae short .38
        cmp dword [dword ebp-0BBAh], byte 2
        jbe near .40
        cmp dword [dword ebp-0BBAh], byte 5
        je short .37
        jmp near .45
.36:
        cmp dword [dword ebp-0BBAh], byte 0
        jne near .45
.37:
        mov eax, dword [dword ebp-0BBEh]
        mov edx, dword [byte ebp+06Eh]
        mov ecx, dword [dword ebp-0BBEh]
        mov eax, dword [eax]
        lea ebx, [byte ebp+026h]
        call NameIndexId
        mov ecx, dword [ecx]
        mov edx, eax
        mov eax, ecx
        call NameIndexPath
        lea eax, [byte ebp+026h]
        call UnlinkJump
        jmp near .45
.38:
        mov eax, dword [dword ebp-0BBEh]
        mov edx, dword [byte ebp+06Eh]
        mov ecx, dword [dword ebp-0BBEh]
        mov eax, dword [eax]
        lea ebx, [byte ebp+026h]
        call NameIndexId
        mov ecx, dword [ecx]
        mov edx, eax
        mov eax, ecx
        call NameIndexPath
        lea eax, [byte ebp+026h]
.39:
        movsx edx, byte [eax]
        inc eax
        cmp edx, byte 5Ch
        jne short .39
        call atoi_
        call ResetSeasonFiles
        jmp near .45
.40:
        mov eax, dword [dword ebp-0BBEh]
        mov edx, dword [byte ebp+06Eh]
        mov ecx, dword [dword ebp-0BBEh]
        mov eax, dword [eax]
        lea ebx, [byte ebp+026h]
        call NameIndexId
        mov ecx, dword [ecx]
        mov edx, eax
        mov eax, ecx
        call NameIndexPath
        lea eax, [byte ebp+026h]
.41:
        movsx edx, byte [eax]
        inc eax
        cmp edx, byte 5Ch
        jne short .41
        call atoi_
        mov ecx, eax
        mov edi, eax
        mov edx, eax
        xor ebx, ebx
        lea eax, [byte ebp+026h]
        call MakePlayoffDbPath
        lea eax, [byte ebp+026h]
        mov ebx, 5
        call UnlinkJump
        mov edx, ecx
        lea eax, [byte ebp+026h]
        call MakePlayoffDbPath
        lea eax, [byte ebp+026h]
        mov ebx, 1
        call UnlinkJump
        mov edx, ecx
        lea eax, [byte ebp+026h]
        call MakePlayoffDbPath
        lea eax, [byte ebp+026h]
        mov ebx, 2
        call UnlinkJump
        mov edx, ecx
        lea eax, [byte ebp+026h]
        call MakePlayoffDbPath
        lea eax, [byte ebp+026h]
        mov ebx, 3
        call UnlinkJump
        mov edx, ecx
        lea eax, [byte ebp+026h]
        call MakePlayoffDbPath
        lea eax, [byte ebp+026h]
        mov ebx, 4
        call UnlinkJump
        mov edx, ecx
        lea eax, [byte ebp+026h]
        call MakePlayoffDbPath
        lea eax, [byte ebp+026h]
        mov ebx, 7
        call UnlinkJump
        mov edx, ecx
        lea eax, [byte ebp+026h]
        call MakePlayoffDbPath
        lea eax, [byte ebp+026h]
        mov edx, 6
        call UnlinkJump
        xor ebx, ebx
        lea eax, [byte ebp-02Ah]
        mov esi, 61h
        call MakeDirPath
.42:
        push esi
        push edi
        lea eax, [byte ebp-02Ah]
        push eax
        push str_S05dCsgDb3
        lea eax, [byte ebp+026h]
        push eax
        call sprintf_
        add esp, byte 14h
        lea eax, [byte ebp+026h]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        je short .43
        lea eax, [byte ebp+026h]
        call UnlinkJump
.43:
        push esi
        push edi
        lea eax, [byte ebp-02Ah]
        push eax
        push str_S05dCnzDb5
        lea eax, [byte ebp+026h]
        push eax
        call sprintf_
        add esp, byte 14h
        lea eax, [byte ebp+026h]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        je short .44
        lea eax, [byte ebp+026h]
        call UnlinkJump
.44:
        inc esi
        cmp esi, byte 7Bh
        jne short .42
.45:
        mov edx, dword [byte ebp+06Eh]
        mov eax, dword [dword ebp-0BBEh]
        add edx, 3E8h
        mov eax, dword [eax]
        call NameIndexRemove
        mov edx, dword [dword ebp-0BBEh]
        mov dword [edx], eax
        call NameIndexSave
.46:
        lea eax, [dword ebp-01E2h]
        xor edx, edx
        mov ebx, dword [byte ebp+072h]
        call SetScrollBarPos
        lea eax, [dword ebp-01E2h]
        mov edx, dword [byte ebp+066h]
        call DrawScrollBar
        mov eax, dword [dword ebp-0BBEh]
        push dword [byte ebp+06Eh]
        mov ecx, dword [dword ebp-01BEh]
        mov eax, dword [eax]
        call DrawIndexEntries
        mov eax, dword [dword ebp-0BBEh]
        mov eax, dword [eax]
        mov al, byte [byte eax+066h]
        add al, 8
        mov byte [dword ebp-08AAh], al
        movzx eax, al
        cmp eax, byte 11h
        jle short .47
        mov byte [dword ebp-08AAh], 11h
.47:
        movzx eax, byte [dword ebp-08AAh]
        imul eax, byte 66h
        mov byte [dword eax+ebp-0B73h], 7
        mov eax, dword [dword ebp-0BBEh]
        mov eax, dword [eax]
        cmp dword [byte eax+066h], byte 0
        jne short .48
        mov eax, dword [dword ebp-0BC6h]
        mov dword [byte ebp+06Ah], eax
.48:
        push byte 0
        mov eax, dword [dword ebp-0BBEh]
        mov ecx, dword [dword ebp-01BEh]
        mov ebx, dword [byte ebp+072h]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [eax]
        call DrawIndexEntries
        lea eax, [dword ebp-01E2h]
        call FreeScrollBar
        push str_BALL3
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        push str_SLDR
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        push str_BKGD11
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, dword [dword ebp-0BBEh]
        mov ecx, 9
        mov eax, dword [eax]
        lea edx, [dword ebp-0A84h]
        push byte 0
        mov ebx, dword [byte eax+066h]
        lea eax, [dword ebp-01E2h]
        call InitVScrollBar
        lea eax, [dword ebp-01E2h]
        mov dword [byte ebp+06Eh], 0
        jmp near .33
.49:
        mov eax, dword [dword ebp-0BC6h]
        jmp near .20
.50:
        mov eax, dword [dword ebp-01BEh]
        add eax, dword [byte ebp+056h]
        sub eax, byte 9
        mov ecx, dword [dword ebp-01BEh]
        mov dword [byte ebp+06Eh], eax
        push eax
        mov eax, dword [dword ebp-0BBEh]
        mov ebx, dword [byte ebp+072h]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [eax]
        call DrawIndexEntries
        jmp near .21
.51:
        push dword [byte ebp+072h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+066h]
        call FreeBitmap
        add esp, byte 4
        lea eax, [dword ebp-01E2h]
        call FreeScrollBar
        mov eax, 3
        call FadeOut
        mov eax, dword [byte ebp+06Ah]
        lea esp, [byte ebp+07Eh]
        pop ebp
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; DrawIndexEntries                                7CBE5  96 PC, low confidence
; Draws the visible entries of that list (">%s" marks the current one)
;-----------------------------------------------------------------------------
DrawIndexEntries:
        push esi
        push edi
        enter 48h, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-014h], ebx
        mov dword [byte ebp-08h], ecx
        push edx
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF46h
        push byte 0FFFFFFA4h
        push str_BKGD11
        push dword [byte ebp-014h]
        call FindShape
        add esp, byte 8
        push eax
        mov dword [byte ebp-0Ch], 0
        call PutBlock
        add esp, byte 0Ch
        lea eax, [byte esi+06Eh]
        cmp dword [byte esi+066h], byte 9
        jge short .1
        mov ecx, dword [byte esi+066h]
        jmp short .2
.1:
        mov ecx, dword [byte ebp-08h]
        add ecx, byte 9
.2:
        mov dword [byte ebp-010h], ecx
        imul esi, dword [byte ebp-08h], byte 36h
        mov ecx, dword [byte ebp-08h]
        mov dword [byte ebp-04h], ecx
        imul ecx, dword [byte ebp-0Ch], byte 14h
        add esi, byte 0Dh
        add esi, eax
        jmp short .6
.3:
        cmp eax, dword [byte ebp+010h]
        jne short .4
        mov eax, 0FDh
        jmp short .5
.4:
        mov eax, 0FCh
.5:
        xor edx, edx
        call SetTextColors
        push esi
        lea eax, [byte ebp-048h]
        inc dword [byte ebp-0Ch]
        push str_S
        inc dword [byte ebp-04h]
        mov ebx, ecx
        push eax
        xor edx, edx
        add ecx, byte 14h
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-048h]
        add esi, byte 36h
        call DrawColorText
.6:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte ebp-010h]
        jl short .3
        call SetScreenTarget
        push dword 0BAh
        push byte 5Ch
        push dword [byte edi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        leave
        pop edi
        pop esi
        ret 4
