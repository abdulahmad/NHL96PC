; The player stats screen: its rows, filters, sorting, drawing and text export (96 PC).
bits 32
%include "hockey.inc"
section s_8BF56 progbits alloc exec nowrite align=1
extern __CHP, str_FiveSpaces, str_FourSpaces, TeamHasCompare, HmGoalieSwapped, HmStarterGoalieMarks, TitleTextStyle, SeasonUserTeam
extern SaveFileName, PlayerPosCodes, PlayerRowTeam, PlayerRowShown, PlayerStatsCompare, StatsFromGame
extern CheckExportName, DrawColorText, DrawColorTextCentred, DrawScrollBar, statsfromleague, TeamDb, statsplayoffs, SimStatWeights
extern RosterDbPtrs, PlayerStatsGoalies, RosterPlayerIds, SkaterColTextIds, GoalieColTextIds, PlayerStatsSort, PlayerStatsSeason, hmtmplstats
extern hmtmglstats, hmtmroster, MatchupLayer, TeamStatsBitmap, MenuBoxStyle, PlayoffTreeData, RosterFileHandle, PlayoffsActive
extern PlayerStatsButtonArt, PlayerStatsTabArt, PlayerStatsTabLit, PlayerStatsButtonPos

extern PlayerStatsButtonBmps
extern PlayerStatsHeaderArt, PlayerRecPtrs
extern PlayerHeightPtrs, PlayerWeightPtrs









extern TitleBlinkTime, PlayerStatsShapes
extern RatingsPlayerId, PlayerStatsRowCount, PlayerStatRowsUsed, PlayerStatsMode, TitleBlinkFrame, PlayerCardArt, EditLinesBuffer, RosterFirstNamePtrs
extern RosterJerseyPtrs, StatColumnPtrs
extern RosterPlayerPtrs, RosterProfilePtrs, RosterLastNamePtrs
extern BackgroundShapes, EditText, FadeOut, FadePalette, fclose_, FillBox, FillMusicStream, fopen_
extern fprintf_, FreeScrollBar, gameopts, GetLangText, GetTicks, HideProgressBox, InitHScrollBar, InitMenuItems
extern InitVScrollBar, LinkSync, LinkSyncWithMessage, LoadExhibitionStats, LoadModemStats, LoadPlayoffStats, LoadSeasonStats, MessageBox
extern ModemChat, MusicDone, LogoNames, CardFlameFrames, OpenScreen, optflags, PlayMusic, PutBlock
extern qsort_, F64_0p454545, F64_2p54, F64_2p54_ExportPlayerStats, F64_0p454545_ExportPlayerStats, RunMenu, ScrollBarDown, ScrollBarPageDown
extern ScrollBarPageUp, ScrollBarToMouse, ScrollBarUp, SetDrawBitmap, SetScreenColors, SetScrollBarPos, SetTextColors, SetTickDeadline
extern ShowProgressBox, SlideInBottomBar, SlideInSideBar, SoundIdle, SoundSecondsToBytes, sprintf_, str_03d2, str_10003
extern str_ALL0, str_AR003, str_AR013, str_AR103, str_AR113, str_AR202, str_AR212, str_AR302
extern str_AR312, str_BKGD16, str_BT004, str_BT017, str_BT04, str_BT106, str_BT116, str_BT204
extern str_BT21, str_BT30, str_BT31, str_BT40, str_BT41, str_BT50, str_BT51, str_CD
extern str_D02d, str_D10, str_D9, str_DBPTRs, str_DD3, str_DD4, str_DD5, str_DonRuss
extern str_FName, str_GlobalSort, str_HBAL2, str_HD01, str_HD02, str_HD03, str_HeightNWeight, str_LName
extern str_LocalSort, str_Pal21, str_Player, str_PLR0, str_PlusMinus, str_Profiles, str_S3, str_SD3
extern str_SEA02, str_Shot, str_SLDH, str_SLDV, str_Space, str_StatDBPTRs, str_Stats, str_VBAL2
extern str_Wt3, strcat_, strcmp_, strcpy_, strlen_, LoadDataFileLib, PlayerDbRecord, SeasonDbRecord
extern CareerDbRecord, DrawArt, AllocMemBlock, FreeMemBlock, CreateBitmap, TintRows, TintRect, FreeBitmap
extern DosFileInfo, DrawArtOpaqueAtOwnPos, DrawArtOpaqueHotspot, DrawArtKeyed, SetScreenTarget, FindShape, TextSetFont, TickDeadlinePassed
extern str_Punct_ExportPlayerStats, CompareButtonDef, PlayerStatsItems, PlayerStatsHScroll
extern PlayerStatsVScroll, PlayerStatsNavLinks, PlayerStatsHotspots, PlayerStatsColumnLabels, UpdateProgressBox, SlotsTwoPlayer, hmscore, PlayerStatColFlags


global AnimatePlayerStatsButton, AnimatePlayerStatsButtons, ComparePlayerNames, ComparePlayerStatRows, ShowPlayerStatsTitle, PlayerStatsSortJumpTable, PlayerStatsModeJumpTable, PlayerStatsChoiceJumpTable
global PlayerStatsSortResetJumpTable, PlayerStatsScreen, PlayerStatsScreen_FF0, PlayerStatsScreen_1008, PlayerStatsScreen_1020, PlayerStatsScreen_1038, PlayerStatsScreen_13B5, PlayerStatsScreen_13BC
global PlayerStatsScreen_13D1, PlayerStatsScreen_13DD, PlayerStatsScreen_1630, PlayerStatsScreen_1641, PlayerStatsScreen_1693, PlayerStatsScreen_18F3, PlayerStatsScreen_1C1D, PlayerStatsScreen_1C3D
global PlayerStatsScreen_1D23, PlayerStatsScreen_1D52, PlayerStatsScreen_1DCF, PlayerStatsScreen_1E07, PlayerStatsScreen_1E55, PlayerStatsScreen_1E90, PlayerStatsScreen_1EEB, PlayerStatsScreen_1F0E
global PlayerStatsScreen_1F1B, PlayerStatsScreen_1FAF, PlayerStatsScreen_1FBA, PlayerStatsScreen_1FC5, FillSkaterStatRows, FillSkaterStatRows_37A, FillSkaterStatRows_387, FillGoalieStatRows
global DrawPlayerStatsTable, CountPlayerStatRows, FindPlayerStatRow, ExportPlayerStatsJumpTable, ExportPlayerStats, ExportPlayerStats_146, ExportPlayerStats_171, ExportPlayerStats_178
global ExportPlayerStats_17F, BuildPlayerStatRows
;-----------------------------------------------------------------------------
; AnimatePlayerStatsButton                        8BF56  96 PC, low confidence
; Plays a button's frames (4 ticks each) on the player stats screen
;-----------------------------------------------------------------------------
AnimatePlayerStatsButton:
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        push eax
        mov edi, edx
        mov esi, ebx
        mov dword [byte ebp-08h], 0
.1:
        imul eax, dword [edi], byte 0Ch
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        add eax, dword [byte ebp-08h]
        push dword [dword eax+PlayerStatsHeaderArt]
        call PutBlock
        add esp, byte 0Ch
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.2:
        call TickDeadlinePassed
        test eax, eax
        je short .2
        add dword [byte ebp-08h], byte 4
        cmp dword [byte ebp-08h], byte 0Ch
        jne short .1
        mov eax, dword [byte ebp-010h]
        shl eax, 4
        mov dword [byte ebp-04h], eax
        add eax, byte 10h
        mov dword [byte ebp-0Ch], eax
.3:
        push dword [byte esi+02Ah]
        mov eax, dword [byte ebp-04h]
        push dword [byte esi+026h]
        push dword [dword eax+PlayerStatsButtonArt]
        call PutBlock
        add esp, byte 0Ch
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.4:
        call TickDeadlinePassed
        test eax, eax
        je short .4
        add dword [byte ebp-04h], byte 4
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte ebp-0Ch]
        jne short .3
        mov eax, dword [byte ebp-010h]
        mov edx, dword [nosplit eax*8+PlayerStatsTabArt]
        mov dword [byte esi+01Ah], edx
        mov eax, dword [nosplit eax*8+PlayerStatsTabLit]
        mov dword [byte esi+01Eh], eax
        mov eax, dword [byte ebp-010h]
        mov dword [edi], eax
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; AnimatePlayerStatsButtons                       8C006  96 PC, low confidence
; The same for a row of buttons
;-----------------------------------------------------------------------------
AnimatePlayerStatsButtons:
        push esi
        push edi
        enter 20h, 0
        mov edi, dword [byte ebp+014h]
        mov dword [byte ebp-0Ch], eax
        mov dword [byte ebp-01Ch], edx
        mov esi, ebx
        mov dword [byte ebp-08h], ecx
        mov dword [byte ebp-04h], 0
.1:
        cmp dword [byte ebp-0Ch], byte 0FFFFFFFFh
        je short .2
        mov eax, dword [byte ebp-01Ch]
        imul eax, dword [eax], byte 0Ch
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        add eax, dword [byte ebp-04h]
        push dword [dword eax+PlayerStatsHeaderArt]
        call PutBlock
        add esp, byte 0Ch
.2:
        cmp dword [byte ebp-08h], byte 0FFFFFFFFh
        je short .3
        mov eax, dword [byte ebp+010h]
        imul eax, dword [eax], byte 0Ch
        push dword [byte edi+02Ah]
        push dword [byte edi+026h]
        add eax, dword [byte ebp-04h]
        push dword [dword eax+PlayerStatsHeaderArt]
        call PutBlock
        add esp, byte 0Ch
.3:
        cmp dword [byte ebp+018h], byte 0FFFFFFFFh
        je short .4
        mov eax, dword [byte ebp+020h]
        push dword [byte eax+02Ah]
        push dword [byte eax+026h]
        mov eax, dword [byte ebp+01Ch]
        imul eax, dword [eax], byte 0Ch
        add eax, dword [byte ebp-04h]
        push dword [dword eax+PlayerStatsHeaderArt]
        call PutBlock
        add esp, byte 0Ch
.4:
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.5:
        call TickDeadlinePassed
        test eax, eax
        je short .5
        add dword [byte ebp-04h], byte 4
        cmp dword [byte ebp-04h], byte 0Ch
        jne near .1
        mov eax, dword [byte ebp+018h]
        mov ebx, dword [byte ebp-08h]
        mov edx, dword [byte ebp-0Ch]
        shl eax, 4
        shl edx, 4
        shl ebx, 4
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-010h], eax
        add eax, byte 10h
        mov dword [byte ebp-014h], ebx
        mov dword [byte ebp-020h], eax
.6:
        cmp dword [byte ebp-0Ch], byte 0FFFFFFFFh
        je short .7
        push dword [byte esi+02Ah]
        mov eax, dword [byte ebp-018h]
        push dword [byte esi+026h]
        push dword [dword eax+PlayerStatsButtonArt]
        call PutBlock
        add esp, byte 0Ch
.7:
        cmp dword [byte ebp-08h], byte 0FFFFFFFFh
        je short .8
        push dword [byte edi+02Ah]
        mov eax, dword [byte ebp-014h]
        push dword [byte edi+026h]
        push dword [dword eax+PlayerStatsButtonArt]
        call PutBlock
        add esp, byte 0Ch
.8:
        cmp dword [byte ebp+018h], byte 0FFFFFFFFh
        je short .9
        mov eax, dword [byte ebp+020h]
        push dword [byte eax+02Ah]
        push dword [byte eax+026h]
        mov eax, dword [byte ebp-010h]
        push dword [dword eax+PlayerStatsButtonArt]
        call PutBlock
        add esp, byte 0Ch
.9:
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.10:
        call TickDeadlinePassed
        test eax, eax
        je short .10
        add dword [byte ebp-010h], byte 4
        add dword [byte ebp-018h], byte 4
        mov eax, dword [byte ebp-010h]
        add dword [byte ebp-014h], byte 4
        cmp eax, dword [byte ebp-020h]
        jne near .6
        cmp dword [byte ebp-0Ch], byte 0FFFFFFFFh
        je short .11
        mov edx, dword [byte ebp-01Ch]
        mov eax, dword [byte ebp-0Ch]
        mov dword [edx], eax
        mov edx, dword [nosplit eax*8+PlayerStatsTabArt]
        mov dword [byte esi+01Ah], edx
        mov eax, dword [nosplit eax*8+PlayerStatsTabLit]
        mov dword [byte esi+01Eh], eax
.11:
        cmp dword [byte ebp-08h], byte 0FFFFFFFFh
        je short .12
        mov eax, dword [byte ebp-08h]
        mov edx, dword [nosplit eax*8+PlayerStatsTabArt]
        mov dword [byte edi+01Ah], edx
        mov eax, dword [nosplit eax*8+PlayerStatsTabLit]
        mov edx, dword [byte ebp+010h]
        mov dword [byte edi+01Eh], eax
        mov eax, dword [byte ebp-08h]
        mov dword [edx], eax
.12:
        cmp dword [byte ebp+018h], byte 0FFFFFFFFh
        je short .13
        mov esi, dword [byte ebp+018h]
        mov edx, dword [byte ebp+020h]
        mov eax, dword [nosplit esi*8+PlayerStatsTabArt]
        mov dword [byte edx+01Ah], eax
        mov eax, dword [nosplit esi*8+PlayerStatsTabLit]
        mov dword [byte edx+01Eh], eax
        mov edx, dword [byte ebp+01Ch]
        mov dword [edx], esi
.13:
        leave
        pop edi
        pop esi
        ret 14h
;-----------------------------------------------------------------------------
; ComparePlayerNames                           8C1C6  96 PC, medium confidence
; Qsort compare of two players by last name, then first name (RosterProfilePtrs /
; 1820EC)
;-----------------------------------------------------------------------------
ComparePlayerNames:
        push ebx
        push ecx
        push esi
        mov ebx, eax
        mov ecx, edx
        mov esi, dword [RosterProfilePtrs]
        mov eax, dword [edx]
        mov edx, dword [esi+eax*4]
        mov eax, dword [ebx]
        mov eax, dword [esi+eax*4]
        call strcmp_
        test eax, eax
        jne short .1
        mov eax, dword [RosterLastNamePtrs]
        mov ecx, dword [ecx]
        mov ebx, dword [ebx]
        mov edx, dword [eax+ecx*4]
        mov eax, dword [eax+ebx*4]
        jmp short .2
.1:
        mov eax, dword [ecx]
        mov ecx, dword [RosterProfilePtrs]
        mov edx, dword [ecx+eax*4]
        mov eax, dword [ebx]
        mov eax, dword [ecx+eax*4]
.2:
        call strcmp_
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ComparePlayerStatRows                           8C210  96 PC, low confidence
; Qsort compare of two player stat rows by the sort column (PlayerStatsMode),
; names on ties
;-----------------------------------------------------------------------------
ComparePlayerStatRows:
        push ebx
        push ecx
        push esi
        push edi
        enter 4, 0
        cmp dword [PlayerStatsMode], byte 0FFFFFFFFh
        je near .13
        cmp dword [PlayerStatsMode], byte 4
        jne near .4
        cmp dword [PlayerStatsGoalies], byte 0
        je near .4
        mov ecx, dword [StatColumnPtrs+4]
        mov ebx, dword [edx]
        mov ebx, dword [ecx+ebx*4]
        cmp word [ebx], byte 0
        jne short .1
        mov ebx, dword [eax]
        mov ebx, dword [ecx+ebx*4]
        cmp word [ebx], byte 0
        je near .13
.1:
        mov ecx, dword [edx]
        mov esi, dword [StatColumnPtrs+4]
        shl ecx, 2
        mov ebx, dword [ecx+esi]
        cmp word [ebx], byte 0
        jne short .2
        mov eax, 0FFFFFFFFh
        jmp near .14
.2:
        mov edi, dword [eax]
        shl edi, 2
        mov ebx, dword [edi+esi]
        cmp word [ebx], byte 0
        jne short .3
        mov eax, 1
        jmp near .14
.3:
        mov ebx, dword [PlayerStatsMode]
        mov ebx, dword [nosplit ebx*4+RosterJerseyPtrs]
        mov ecx, dword [ecx+ebx]
        mov ebx, dword [edi+ebx]
        mov si, word [ecx]
        cmp si, word [ebx]
        je near .13
        movzx eax, si
        movzx edx, word [ebx]
        jmp near .11
.4:
        cmp dword [PlayerStatsGoalies], byte 1
        jne short .5
        cmp dword [PlayerStatsMode], byte 2
        jle short .5
        mov ebx, dword [PlayerStatsMode]
        mov esi, dword [edx]
        mov ecx, dword [nosplit ebx*4+RosterJerseyPtrs]
        mov ebx, dword [ecx+esi*4]
        mov esi, dword [eax]
        mov ecx, dword [ecx+esi*4]
        mov si, word [ebx]
        cmp si, word [ecx]
        je near .13
        movzx edx, si
        movzx eax, word [ecx]
        jmp near .11
.5:
        cmp dword [PlayerStatsMode], byte 2
        jge short .6
        mov ebx, dword [PlayerStatsMode]
        mov esi, dword [edx]
        mov ebx, dword [nosplit ebx*4+PlayerHeightPtrs]
        mov ecx, dword [eax]
        mov esi, dword [ebx+esi*4]
        mov ebx, dword [ebx+ecx*4]
        mov cl, byte [esi]
        cmp cl, byte [ebx]
        je near .13
        movzx edx, cl
        movzx eax, byte [ebx]
        jmp near .11
.6:
        cmp dword [PlayerStatsMode], byte 8
        jne short .7
        mov ebx, dword [StatColumnPtrs]
        mov ecx, dword [edx]
        mov esi, dword [eax]
        mov ecx, dword [ebx+ecx*4]
        mov ebx, dword [ebx+esi*4]
        mov si, word [ecx]
        cmp si, word [ebx]
        je near .13
        movsx edx, si
        movsx eax, word [ebx]
        jmp short .11
.7:
        jge short .12
        mov ecx, dword [edx]
        mov ebx, dword [PlayerStatsMode]
        shl ecx, 2
        mov ebx, dword [nosplit ebx*4+RosterJerseyPtrs]
        mov esi, dword [eax]
        mov dword [byte ebp-04h], ecx
        mov ecx, dword [ecx+ebx]
        shl esi, 2
        mov di, word [ecx]
        mov ebx, dword [esi+ebx]
        cmp di, word [ebx]
        je short .8
        movzx edx, di
        jmp short .10
.8:
        mov ecx, dword [byte ebp-04h]
        mov ebx, dword [StatColumnPtrs+10h]
        mov ecx, dword [ecx+ebx]
        mov ebx, dword [esi+ebx]
        mov si, word [ecx]
        cmp si, word [ebx]
        je short .13
.9:
        movzx edx, si
.10:
        movzx eax, word [ebx]
.11:
        sub edx, eax
        mov eax, edx
        jmp short .14
.12:
        mov ebx, dword [PlayerStatsMode]
        mov ecx, dword [edx]
        mov ebx, dword [nosplit ebx*4+RosterFirstNamePtrs]
        mov esi, dword [eax]
        mov ecx, dword [ebx+ecx*4]
        mov ebx, dword [ebx+esi*4]
        mov si, word [ecx]
        cmp si, word [ebx]
        jne short .9
.13:
        call ComparePlayerNames
.14:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ShowPlayerStatsTitle                            8C3DD  96 PC, low confidence
; Shows the player stats title strip (BKGD) for a moment
;-----------------------------------------------------------------------------
ShowPlayerStatsTitle:
        push ebx
        push ecx
        push edx
        push esi
        cmp byte [PlayerStatsCompare], 0
        je near .2
        push byte 0
        push byte 3Ch
        push byte 50h
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 0FFFFFFBAh
        push dword 0FFFFFDDAh
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        call GetTicks
        mov edx, dword [TitleBlinkTime]
        add edx, byte 0Ah
        cmp eax, edx
        jle short .1
        inc dword [TitleBlinkFrame]
        call GetTicks
        mov dword [TitleBlinkTime], eax
.1:
        mov eax, dword [TitleBlinkFrame]
        mov ebx, 8
        cdq
        idiv ebx
        push dword [nosplit edx*4+CardFlameFrames]
        push dword [PlayerStatsShapes]
        mov dword [TitleBlinkFrame], edx
        call FindShape
        add esp, byte 8
        push byte 0
        push byte 0
        push eax
        mov dword [PlayerCardArt], eax
        call DrawArt
        add esp, byte 0Ch
        call SetScreenTarget
        push byte 46h
        push dword 226h
        push dword [byte esi+02Ch]
        call DrawArtOpaqueHotspot
        add esp, byte 0Ch
        push esi
        call FreeBitmap
        add esp, byte 4
.2:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
PlayerStatsSortJumpTable:                       ; jump table for the switch cases of PlayerStatsScreen
        dd PlayerStatsScreen_FF0
        dd PlayerStatsScreen_1008
        dd PlayerStatsScreen_1020
        dd PlayerStatsScreen_1038
PlayerStatsModeJumpTable:                       ; jump table for the switch cases of PlayerStatsScreen
        dd PlayerStatsScreen_13B5
        dd PlayerStatsScreen_13D1
        dd PlayerStatsScreen_13BC
        dd PlayerStatsScreen_13DD
PlayerStatsChoiceJumpTable:                     ; jump table for the switch cases of PlayerStatsScreen
        dd PlayerStatsScreen_1630
        dd PlayerStatsScreen_1641
        dd PlayerStatsScreen_1693
        dd PlayerStatsScreen_18F3
        dd PlayerStatsScreen_1C1D
        dd PlayerStatsScreen_1E07
        dd PlayerStatsScreen_1E55
        dd PlayerStatsScreen_1E90
        dd PlayerStatsScreen_1FAF
        dd PlayerStatsScreen_1FBA
        dd PlayerStatsScreen_1FBA
        dd PlayerStatsScreen_1FC5
        dd PlayerStatsScreen_1EEB
        dd PlayerStatsScreen_1F0E
        dd PlayerStatsScreen_1F0E
        dd PlayerStatsScreen_1F1B
PlayerStatsSortResetJumpTable:                  ; jump table for the switch cases of PlayerStatsScreen
        dd PlayerStatsScreen_1C3D
        dd PlayerStatsScreen_1D23
        dd PlayerStatsScreen_1D52
        dd PlayerStatsScreen_1DCF
;-----------------------------------------------------------------------------
; PlayerStatsScreen                                               8C51B  96 PC
; The player stats screen (StatDBPTRs, "Player #", "+/-", FName, LName,
; DonRuss): sortable columns, filters, scroll bar, export
;-----------------------------------------------------------------------------
PlayerStatsScreen:
        push ebx
        push ecx
        push esi
        push edi
        enter 1C50h, 0
        push eax
        push edx
        sub ebp, 82h
        mov ecx, 148h
        lea edi, [dword ebp-0B8Eh]
        mov esi, PlayerStatsNavLinks
        rep movsd
        mov ecx, 60h
        lea edi, [dword ebp-046Eh]
        mov esi, PlayerStatsHotspots
        rep movsd
        mov dword [byte ebp+036h], 0FFFFFFFFh
        mov ecx, 8
        lea edi, [byte ebp-01Eh]
        mov esi, PlayerStatsColumnLabels
        mov dword [byte ebp+01Eh], 7
        mov dword [byte ebp+01Ah], 4
        rep movsd
        mov dword [byte ebp+016h], 1
        mov dword [PlayerCardArt], 0
        call GetTicks
        mov dword [TitleBlinkTime], eax
        cmp dword [RosterDbPtrs], byte 0
        jne near .3
        push byte 0
        push dword 0C00h
        push str_StatDBPTRs
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0C00h
        push str_DBPTRs
        mov dword [RosterDbPtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0C00h
        push str_Player
        mov dword [RosterPlayerPtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0C00h
        push str_PlusMinus
        mov dword [RosterFirstNamePtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0C00h
        push str_FName
        mov dword [StatColumnPtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0C00h
        push str_LName
        mov dword [RosterLastNamePtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0C00h
        push str_DonRuss
        mov dword [RosterProfilePtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0C00h
        push str_Profiles
        xor esi, esi
        mov dword [EditLinesBuffer], eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [RosterJerseyPtrs], eax
.1:
        push byte 0
        push dword 0C00h
        push str_Stats
        add esi, byte 4
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [dword esi+StatColumnPtrs], eax
        cmp esi, byte 2Ch
        jne short .1
        xor esi, esi
.2:
        push byte 0
        push dword 0C00h
        push str_HeightNWeight
        add esi, byte 4
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [dword esi+PlayerHeightPtrs-4], eax
        cmp esi, byte 8
        jne short .2
.3:
        cmp dword [RosterPlayerIds], byte 0
        jne short .4
        push byte 0
        push dword 0C00h
        push str_LocalSort
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [RosterPlayerIds], eax
.4:
        push byte 0
        push dword 0C00h
        push str_GlobalSort
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 600h
        mov dword [byte ebp+04Ah], 14h
        push str_Shot
        mov dword [byte ebp+04Eh], 8Ch
        mov dword [byte ebp+07Ah], eax
        call AllocMemBlock
        mov dword [RatingsPlayerId], 3E7h
        mov dword [PlayerStatsMode], 5
        mov edx, PlayerStatsItems
        add esp, byte 0Ch
        mov dword [byte ebp+032h], eax
        mov eax, 52h
        xor ebx, ebx
        call InitMenuItems
.5:
        mov eax, ebx
        imul esi, ebx, byte 66h
        lea edx, [dword ebp-01BCEh]
        shl eax, 6
        add eax, edx
        mov dword [byte ebp+046h], 14Fh
        mov dword [byte ebp+0Eh], eax
        mov eax, dword [byte ebp+04Eh]
        mov dword [byte ebp+0Ah], 118h
        mov dword [byte ebp+012h], eax
        mov eax, dword [byte ebp+04Ah]
        xor ecx, ecx
        add eax, 8Ch
        add esi, 6C6h
        mov dword [byte ebp+076h], eax
.6:
        mov eax, ebx
        shl eax, 6
        test ecx, ecx
        jne short .7
        mov dword [dword eax+ebp-01BCEh], 46h
        mov dword [dword eax+ebp-01BC6h], 14Fh
        mov dword [dword eax+ebp-01BBEh], 14Fh
        mov edx, dword [byte ebp+012h]
        mov dword [dword eax+ebp-01BB6h], 46h
        mov dword [dword eax+ebp-01BCAh], edx
        mov dword [dword eax+ebp-01BC2h], edx
        mov edx, dword [byte ebp+076h]
        mov dword [dword eax+ebp-01BBAh], edx
        jmp short .8
.7:
        mov edx, dword [byte ebp+0Ah]
        mov dword [dword eax+ebp-01BCEh], edx
        mov edx, dword [byte ebp+012h]
        mov dword [dword eax+ebp-01BCAh], edx
        mov edx, dword [byte ebp+046h]
        mov dword [dword eax+ebp-01BC6h], edx
        mov edx, dword [byte ebp+012h]
        mov dword [dword eax+ebp-01BC2h], edx
        mov edx, dword [byte ebp+046h]
        mov dword [dword eax+ebp-01BBEh], edx
        mov edx, dword [byte ebp+076h]
        mov dword [dword eax+ebp-01BBAh], edx
        mov edx, dword [byte ebp+0Ah]
        mov dword [dword eax+ebp-01BB6h], edx
        mov edx, dword [byte ebp+076h]
.8:
        mov dword [dword eax+ebp-01BB2h], edx
        mov edi, ebx
        mov eax, dword [byte ebp+0Eh]
        shl edi, 6
        mov dword [dword esi+PlayerStatsItems+14h], eax
        mov eax, dword [dword edi+ebp-01BCEh]
        add eax, dword [dword edi+ebp-01BC6h]
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov dword [dword esi+PlayerStatsItems+3Ah], eax
        mov eax, dword [dword edi+ebp-01BCAh]
        add eax, dword [dword edi+ebp-01BBAh]
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov dword [dword esi+PlayerStatsItems+10h], 4
        mov dword [dword esi+PlayerStatsItems+3Eh], eax
        test ecx, ecx
        jne short .9
        add dword [dword esi+PlayerStatsItems+3Ah], byte 1Eh
.9:
        add dword [byte ebp+0Eh], byte 40h
        add dword [byte ebp+046h], byte 37h
        add dword [byte ebp+0Ah], byte 37h
        add esi, byte 66h
        inc ecx
        inc ebx
        cmp ecx, byte 5
        jl near .6
        add dword [byte ebp+04Ah], byte 14h
        add dword [byte ebp+04Eh], byte 14h
        cmp dword [byte ebp+04Ah], 118h
        jne near .5
        mov eax, 6
        call SoundSecondsToBytes
        call FillMusicStream
        call MusicDone
        test eax, eax
        jne short .10
        call PlayMusic
.10:
        mov eax, 105h
        xor edx, edx
        call LoadDataFileLib
        push str_Pal21
        push eax
        mov dword [PlayerStatsShapes], eax
        call FindShape
        add esp, byte 8
        lea esi, [byte eax+010h]
        cmp dword [dword ebp-01BD2h], byte 63h
        jne short .11
        mov eax, 106h
        xor edx, edx
        jmp short .12
.11:
        mov eax, dword [dword ebp-01BD2h]
        xor edx, edx
        add eax, 165h
.12:
        call LoadDataFileLib
        mov dword [BackgroundShapes], eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push str_Pal21
        push dword [BackgroundShapes]
        mov dword [byte ebp+02Eh], eax
        call FindShape
        add esp, byte 8
        add eax, byte 10h
        lea ebx, [dword esi+0258h]
        mov dword [byte ebp+02Ah], eax
        call SetScreenColors
        mov eax, dword [byte ebp+02Ah]
        xor edx, edx
        add eax, 258h
.13:
        inc edx
        mov cl, byte [ebx]
        inc ebx
        mov byte [eax], cl
        inc eax
        cmp edx, byte 5Ah
        jl short .13
        lea eax, [dword ebp-066Eh]
        push eax
        push dword [byte ebp+02Ah]
        push dword 8000h
        call TintRect
        add esp, byte 0Ch
        lea eax, [dword ebp-056Eh]
        push eax
        push dword [byte ebp+02Ah]
        push dword 0C000h
        push dword 8000h
        push dword 8000h
        xor esi, esi
        call TintRows
        add esp, byte 14h
.14:
        push byte 0
        push str_BT004
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+06h]
        add esp, byte 8
        add eax, byte 4
        push eax
        push str_BT004
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+04h]
        add esp, byte 8
        add eax, byte 4
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte esi+ebp-042h], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_BT004
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_BT004
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        add esi, byte 4
        call PutBlock
        add esp, byte 0Ch
        cmp esi, byte 0Ch
        jne near .14
        push dword [byte ebp-042h]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push str_BT004
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        push dword [byte ebp-03Eh]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push str_BT017
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        push dword [byte ebp-03Ah]
        call SetDrawBitmap
        add esp, byte 4
        push byte 4
        push byte 4
        push str_BT017
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        cmp dword [dword ebp-01BD2h], byte 63h
        jne near .16
        xor esi, esi
.15:
        push byte 0
        push str_BT106
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+06h]
        add esp, byte 8
        add eax, byte 4
        push eax
        push str_BT106
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+04h]
        add esp, byte 8
        add eax, byte 4
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte esi+ebp-036h], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_BT106
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_BT106
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        add esi, byte 4
        call PutBlock
        add esp, byte 0Ch
        cmp esi, byte 0Ch
        jne near .15
        push dword [byte ebp-036h]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push str_BT106
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        push dword [byte ebp-032h]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push str_BT116
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        push dword [byte ebp-02Eh]
        call SetDrawBitmap
        add esp, byte 4
        push byte 4
        push byte 4
        push str_BT116
        jmp near .18
.16:
        xor esi, esi
.17:
        push byte 0
        push str_BT21
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+06h]
        add esp, byte 8
        add eax, byte 4
        push eax
        push str_BT21
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+04h]
        add esp, byte 8
        add eax, byte 4
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte esi+ebp-036h], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_BT21
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_BT21
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        add esi, byte 4
        call PutBlock
        add esp, byte 0Ch
        cmp esi, byte 0Ch
        jne near .17
        push dword [byte ebp-036h]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push str_BT204
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        push dword [byte ebp-032h]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push str_BT21
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        push dword [byte ebp-02Eh]
        call SetDrawBitmap
        add esp, byte 4
        push byte 4
        push byte 4
        push str_BT21
.18:
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        xor esi, esi
.19:
        push byte 0
        push str_BT31
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+06h]
        add esp, byte 8
        add eax, byte 4
        push eax
        push str_BT31
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+04h]
        add esp, byte 8
        add eax, byte 4
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte esi+ebp-02Ah], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_BT31
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_BT31
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        add esi, byte 4
        call PutBlock
        add esp, byte 0Ch
        cmp esi, byte 0Ch
        jne near .19
        push dword [byte ebp-02Ah]
        call SetDrawBitmap
        add esp, byte 4
        cmp dword [dword ebp-01BD6h], byte 64h
        jne short .20
        cmp byte [StatsFromGame], 0
        je short .20
        push byte 0
        push byte 0
        push str_BT40
        jmp short .22
.20:
        cmp dword [dword ebp-01BD6h], byte 64h
        jne short .21
        cmp byte [StatsFromGame], 0
        jne short .21
        push byte 0
        push byte 0
        push str_BT50
        jmp short .22
.21:
        push byte 0
        push byte 0
        push str_BT30
.22:
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        push dword [byte ebp-026h]
        call SetDrawBitmap
        add esp, byte 4
        cmp dword [dword ebp-01BD6h], byte 64h
        jne short .23
        cmp byte [StatsFromGame], 0
        je short .23
        push byte 0
        push byte 0
        push str_BT41
        jmp short .25
.23:
        cmp dword [dword ebp-01BD6h], byte 64h
        jne short .24
        cmp byte [StatsFromGame], 0
        jne short .24
        push byte 0
        push byte 0
        push str_BT51
        jmp short .25
.24:
        push byte 0
        push byte 0
        push str_BT31
.25:
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        push dword [byte ebp-022h]
        call SetDrawBitmap
        add esp, byte 4
        cmp dword [dword ebp-01BD6h], byte 64h
        jne short .26
        cmp byte [StatsFromGame], 0
        je short .26
        push byte 4
        push byte 4
        push str_BT41
        jmp short .28
.26:
        cmp dword [dword ebp-01BD6h], byte 64h
        jne short .27
        cmp byte [StatsFromGame], 0
        jne short .27
        push byte 4
        push byte 4
        push str_BT51
        jmp short .28
.27:
        push byte 4
        push byte 4
        push str_BT31
.28:
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        mov dword [byte ebp+056h], 0
        mov dword [byte ebp+05Ah], 0
        xor edi, edi
        mov dword [byte ebp+05Eh], 0
        mov dword [byte ebp+022h], edi
.29:
        mov dword [byte ebp+07Eh], 0
        mov eax, dword [byte ebp+05Ah]
        mov esi, dword [byte ebp+056h]
        mov dword [byte ebp+042h], eax
        mov dword [byte ebp+052h], esi
.30:
        push dword [byte ebp+07Eh]
        mov eax, dword [byte ebp+042h]
        push dword [byte eax+ebp-01Eh]
        push str_SD3
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 10h
        push byte 0
        push str_SEA02
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_SEA02
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        mov edx, dword [byte ebp+052h]
        push eax
        mov dword [dword edx+PlayerStatsButtonBmps], eax
        call SetDrawBitmap
        add esp, byte 4
        lea eax, [byte ebp+02h]
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        lea eax, [byte ebp+02h]
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0
        lea eax, [byte ebp+02h]
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        inc dword [byte ebp+07Eh]
        add dword [byte ebp+052h], byte 4
        call DrawArtKeyed
        add esp, byte 0Ch
        cmp dword [byte ebp+07Eh], byte 8
        jl near .30
        mov eax, dword [dword esi+PlayerStatsButtonBmps+8]
        mov edx, dword [byte ebp+022h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword edx+PlayerStatsHeaderArt], eax
        mov eax, dword [dword esi+PlayerStatsButtonBmps+0Ch]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword edx+PlayerStatsHeaderArt+4], eax
        mov eax, dword [dword esi+PlayerStatsButtonBmps+10h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword edx+PlayerStatsHeaderArt+8], eax
        mov eax, dword [dword esi+PlayerStatsButtonBmps+14h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword edi+PlayerStatsButtonArt], eax
        mov eax, dword [dword esi+PlayerStatsButtonBmps+18h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword edi+PlayerStatsButtonArt+4], eax
        mov eax, dword [dword esi+PlayerStatsButtonBmps+1Ch]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword edi+PlayerStatsButtonArt+8], eax
        mov eax, dword [dword esi+PlayerStatsButtonBmps+4]
        mov edx, dword [byte eax+02Ch]
        mov ebx, dword [byte ebp+05Eh]
        mov dword [dword edi+PlayerStatsButtonArt+0Ch], edx
        mov edx, dword [dword esi+PlayerStatsButtonBmps]
        add dword [byte ebp+056h], byte 20h
        add dword [byte ebp+05Ah], byte 4
        mov edx, dword [byte edx+02Ch]
        add edi, byte 10h
        mov dword [dword ebx+PlayerStatsTabArt], edx
        add dword [byte ebp+05Eh], byte 8
        mov eax, dword [byte eax+02Ch]
        add dword [byte ebp+022h], byte 0Ch
        mov dword [dword ebx+PlayerStatsTabLit], eax
        cmp dword [byte ebp+05Ah], byte 20h
        jne near .29
        call SetScreenTarget
        push byte 0
        push dword 104h
        push dword 1E0h
        call CreateBitmap
        add esp, byte 0Ch
        push dword [byte ebp+02Eh]
        mov dword [byte ebp+026h], eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        cmp dword [dword ebp-01BD6h], byte 64h
        je short .31
        push str_HD01
        jmp short .32
.31:
        cmp dword [dword ebp-01BD2h], byte 1Ah
        jge short .33
        push str_BT04
.32:
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
.33:
        cmp dword [dword ebp-01BD6h], 3E8h
        jl short .34
        cmp dword [dword ebp-01BD6h], 2AF8h
        jge short .34
        push str_HD03
        jmp short .35
.34:
        cmp dword [dword ebp-01BD6h], 2AF7h
        jle short .36
        push str_HD02
.35:
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
.36:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .37
        mov eax, 5
        jmp short .38
.37:
        mov eax, 4
.38:
        call OpenScreen
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
        cmp dword [dword ebp-01BD6h], 2AF7h
        jg short .39
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 20h
        jne short .40
.39:
        mov dword [PlayerStatsSeason], 1
        jmp short .41
.40:
        mov dword [PlayerStatsSeason], 0
.41:
        cmp dword [dword ebp-01BD6h], 3E8h
        jl short .42
        cmp dword [dword ebp-01BD6h], 2AF8h
        jge short .42
        push SeasonUserTeam
        mov eax, 1D7h
        jmp short .43
.42:
        cmp dword [dword ebp-01BD6h], 2AF8h
        jl short .44
        push SaveFileName
        mov eax, 1D9h
.43:
        call GetLangText
        push eax
        lea eax, [byte ebp-07Eh]
        push eax
        mov ebx, 4Bh
        call sprintf_
        add esp, byte 0Ch
        mov edx, 140h
        lea eax, [byte ebp-07Eh]
        call DrawColorTextCentred
.44:
        mov ecx, 66h
        mov ax, word [SlotsTwoPlayer]
        mov edi, PlayerStatsItems
        xor ah, ah
        mov esi, TeamStatsBitmap
        and al, 1
        mov byte [PlayerStatsCompare], 0
        cwde
        rep movsb
        test eax, eax
        je short .45
        mov ecx, 66h
        mov edi, PlayerStatsItems+66h
        mov esi, MenuBoxStyle
        rep movsb
        jmp near .46
.45:
        cmp dword [dword ebp-01BD2h], byte 63h
        je near .46
        mov eax, dword [dword ebp-01BD2h]
        cmp byte [dword eax+TeamHasCompare], 0
        je short .46
        cmp dword [dword ebp-01BD6h], 3E8h
        jge short .46
        cmp dword [dword ebp-01BD6h], byte 64h
        je short .46
        mov dword [PlayerStatsItems+76h], 4
        mov dword [PlayerStatsItems+7Ah], CompareButtonDef
        mov dword [PlayerStatsItems+8Ch], 226h
        mov dword [PlayerStatsItems+90h], 46h
        mov dword [PlayerStatsItems+0A0h], 230h
        mov dword [PlayerStatsItems+0A4h], 50h
        mov eax, dword [PlayerCardArt]
        mov byte [PlayerStatsCompare], 1
        mov dword [PlayerStatsItems+80h], eax
        mov dword [PlayerStatsItems+84h], eax
        mov dword [PlayerStatsItems+88h], eax
.46:
        lea eax, [dword ebp-046Eh]
        mov dword [PlayerStatsItems+0DCh], 4
        mov dword [PlayerStatsItems+0E0h], eax
        cmp dword [dword ebp-01BD2h], byte 63h
        jne near .49
        cmp dword [PlayerStatsSeason], byte 0
        je short .47
        mov eax, dword [PlayerStatsButtonPos+20h]
        mov dword [PlayerStatsItems+0E6h], eax
        mov eax, dword [PlayerStatsButtonPos+24h]
        mov dword [byte ebp+01Eh], 5
        jmp short .48
.47:
        mov eax, dword [PlayerStatsButtonPos+30h]
        mov dword [PlayerStatsItems+0E6h], eax
        mov eax, dword [PlayerStatsButtonPos+34h]
        mov dword [byte ebp+01Eh], 7
.48:
        mov dword [PlayerStatsItems+0EAh], eax
        push str_SEA02
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push str_SEA02
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+0F2h], eax
        call FindShape
        add esp, byte 8
        push str_BT106
        movsx eax, word [byte eax+0Eh]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+0F6h], eax
        call FindShape
        add esp, byte 8
        push str_BT106
        jmp near .52
.49:
        cmp dword [PlayerStatsSeason], byte 0
        je short .50
        mov eax, dword [PlayerStatsButtonPos+20h]
        mov dword [PlayerStatsItems+0E6h], eax
        mov eax, dword [PlayerStatsButtonPos+24h]
        mov dword [byte ebp+01Eh], 5
        jmp short .51
.50:
        mov eax, dword [PlayerStatsButtonPos+30h]
        mov dword [PlayerStatsItems+0E6h], eax
        mov eax, dword [PlayerStatsButtonPos+34h]
        mov dword [byte ebp+01Eh], 7
.51:
        mov dword [PlayerStatsItems+0EAh], eax
        push str_SEA02
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push str_SEA02
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+0F2h], eax
        call FindShape
        add esp, byte 8
        push str_BT204
        movsx eax, word [byte eax+0Eh]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+0F6h], eax
        call FindShape
        add esp, byte 8
        push str_BT204
.52:
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+28Ah], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [PlayerStatsItems+28Eh], eax
        mov eax, dword [PlayerStatsItems+0F2h]
        add eax, byte 28h
        mov dword [PlayerStatsItems+106h], eax
        mov eax, dword [PlayerStatsItems+0F6h]
        add eax, byte 0Ah
        mov dword [PlayerStatsItems+10Ah], eax
        mov eax, dword [PlayerStatsItems+28Ah]
        add eax, byte 28h
        mov dword [PlayerStatsItems+29Eh], eax
        mov eax, dword [PlayerStatsItems+28Eh]
        add eax, byte 0Ah
        mov dword [PlayerStatsItems+2A2h], eax
        lea eax, [dword ebp-042Eh]
        mov dword [PlayerStatsItems+142h], 4
        mov dword [PlayerStatsItems+146h], eax
        cmp dword [PlayerStatsGoalies], byte 0
        jne short .53
        mov eax, dword [PlayerStatsButtonPos+18h]
        mov dword [PlayerStatsItems+14Ch], eax
        mov eax, dword [PlayerStatsButtonPos+1Ch]
        mov dword [byte ebp+01Ah], 4
        jmp short .54
.53:
        mov eax, dword [PlayerStatsButtonPos+10h]
        mov dword [PlayerStatsItems+14Ch], eax
        mov eax, dword [PlayerStatsButtonPos+14h]
        mov dword [byte ebp+01Ah], 3
.54:
        mov dword [PlayerStatsItems+150h], eax
        push str_PLR0
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push str_PLR0
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+158h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [PlayerStatsItems+15Ch], eax
        mov eax, dword [PlayerStatsItems+158h]
        add eax, byte 28h
        mov dword [PlayerStatsItems+16Ch], eax
        mov eax, dword [PlayerStatsItems+15Ch]
        add eax, byte 0Ah
        mov dword [PlayerStatsItems+170h], eax
        lea eax, [dword ebp-03EEh]
        add esp, byte 8
        mov dword [PlayerStatsItems+1ACh], eax
        mov eax, dword [PlayerStatsSort]
        mov dword [PlayerStatsItems+1A8h], 4
        cmp eax, byte 3
        ja short PlayerStatsScreen_1038.56
        jmp dword [nosplit cs:eax*4+PlayerStatsSortJumpTable]
PlayerStatsScreen_FF0:
        mov eax, dword [PlayerStatsButtonPos]
        mov dword [PlayerStatsItems+1B2h], eax
        mov eax, dword [PlayerStatsButtonPos+4]
        mov dword [byte ebp+016h], 1
        jmp short PlayerStatsScreen_1038.55
PlayerStatsScreen_1008:
        mov eax, dword [PlayerStatsButtonPos+8]
        mov dword [PlayerStatsItems+1B2h], eax
        mov eax, dword [PlayerStatsButtonPos+0Ch]
        mov dword [byte ebp+016h], 2
        jmp short PlayerStatsScreen_1038.55
PlayerStatsScreen_1020:
        mov eax, dword [PlayerStatsTabArt]
        mov dword [PlayerStatsItems+1B2h], eax
        mov eax, dword [PlayerStatsTabLit]
        mov dword [byte ebp+016h], 0
        jmp short PlayerStatsScreen_1038.55
PlayerStatsScreen_1038:
        mov eax, dword [PlayerStatsButtonPos+28h]
        mov dword [PlayerStatsItems+1B2h], eax
        mov eax, dword [PlayerStatsButtonPos+2Ch]
        mov dword [byte ebp+016h], 6
.55:
        mov dword [PlayerStatsItems+1B6h], eax
.56:
        push str_ALL0
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push str_ALL0
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+1BEh], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [PlayerStatsItems+1C2h], eax
        mov eax, dword [PlayerStatsItems+1BEh]
        add eax, byte 28h
        mov dword [PlayerStatsItems+1D2h], eax
        mov eax, dword [PlayerStatsItems+1C2h]
        add eax, byte 0Ah
        mov dword [PlayerStatsItems+1D6h], eax
        lea eax, [dword ebp-03AEh]
        mov dword [PlayerStatsItems+212h], eax
        mov eax, dword [byte ebp-042h]
        mov dword [PlayerStatsItems+20Eh], 6
        mov eax, dword [byte eax+02Ch]
        mov dword [PlayerStatsItems+218h], eax
        mov eax, dword [byte ebp-03Eh]
        mov eax, dword [byte eax+02Ch]
        add esp, byte 8
        mov dword [PlayerStatsItems+21Ch], eax
        mov eax, dword [byte ebp-03Ah]
        push str_BT017
        mov eax, dword [byte eax+02Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+220h], eax
        call FindShape
        add esp, byte 8
        push str_BT017
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+224h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [PlayerStatsItems+228h], eax
        mov eax, dword [PlayerStatsItems+224h]
        add eax, byte 28h
        mov dword [PlayerStatsItems+238h], eax
        mov eax, dword [PlayerStatsItems+228h]
        add eax, byte 0Ah
        add esp, byte 8
        mov dword [PlayerStatsItems+23Ch], eax
        cmp dword [dword ebp-01BD6h], byte 64h
        je short .57
        lea eax, [dword ebp-036Eh]
        mov dword [PlayerStatsItems+278h], eax
        mov eax, dword [byte ebp-036h]
        mov dword [PlayerStatsItems+274h], 6
        mov eax, dword [byte eax+02Ch]
        mov dword [PlayerStatsItems+27Eh], eax
        mov eax, dword [byte ebp-032h]
        mov eax, dword [byte eax+02Ch]
        mov dword [PlayerStatsItems+282h], eax
        mov eax, dword [byte ebp-02Eh]
        mov eax, dword [byte eax+02Ch]
        mov dword [PlayerStatsItems+286h], eax
.57:
        lea eax, [dword ebp-032Eh]
        mov dword [PlayerStatsItems+2DEh], eax
        mov eax, dword [byte ebp-02Ah]
        mov dword [PlayerStatsItems+2DAh], 6
        mov eax, dword [byte eax+02Ch]
        mov dword [PlayerStatsItems+2E4h], eax
        mov eax, dword [byte ebp-026h]
        mov eax, dword [byte eax+02Ch]
        mov dword [PlayerStatsItems+2E8h], eax
        mov eax, dword [byte ebp-022h]
        push str_BT30
        mov eax, dword [byte eax+02Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+2ECh], eax
        call FindShape
        add esp, byte 8
        push str_BT30
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+2F0h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [PlayerStatsItems+2F4h], eax
        mov eax, dword [PlayerStatsItems+2F0h]
        add eax, byte 28h
        add esp, byte 8
        mov dword [PlayerStatsItems+304h], eax
        mov eax, dword [PlayerStatsItems+2F4h]
        push str_AR003
        add eax, byte 0Ah
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsItems+308h], eax
        call FindShape
        add esp, byte 8
        push str_AR013
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsVScroll+1Ah], eax
        call FindShape
        add esp, byte 8
        push str_AR003
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsVScroll+1Eh], eax
        call FindShape
        add esp, byte 8
        push str_AR003
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsVScroll+26h], eax
        call FindShape
        add esp, byte 8
        push str_AR103
        movsx eax, word [byte eax+0Eh]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsVScroll+2Ah], eax
        call FindShape
        add esp, byte 8
        push str_AR113
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsVScroll+14Ch], eax
        call FindShape
        add esp, byte 8
        push str_AR103
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsVScroll+150h], eax
        call FindShape
        add esp, byte 8
        push str_AR103
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsVScroll+158h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [PlayerStatsVScroll+15Ch], eax
        push str_AR202
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push str_AR212
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsHScroll+1Ah], eax
        call FindShape
        add esp, byte 8
        push str_AR202
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsHScroll+1Eh], eax
        call FindShape
        add esp, byte 8
        push str_AR202
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsHScroll+26h], eax
        call FindShape
        add esp, byte 8
        push str_AR302
        movsx eax, word [byte eax+0Eh]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsHScroll+2Ah], eax
        call FindShape
        add esp, byte 8
        push str_AR312
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsHScroll+14Ch], eax
        call FindShape
        add esp, byte 8
        push str_AR302
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsHScroll+150h], eax
        call FindShape
        add esp, byte 8
        push str_AR302
        movsx eax, word [byte eax+0Ch]
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsHScroll+158h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [PlayerStatsHScroll+15Ch], eax
        cmp dword [dword ebp-01BD6h], byte 64h
        jne short PlayerStatsScreen_13DD.59
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 3
        ja short PlayerStatsScreen_13DD.58
        jmp dword [nosplit cs:eax*4+PlayerStatsModeJumpTable]
PlayerStatsScreen_13B5:
        call LoadExhibitionStats
        jmp short PlayerStatsScreen_13DD.58
PlayerStatsScreen_13BC:
        cmp dword [PlayoffsActive], byte 0
        jne short PlayerStatsScreen_13D1
        mov eax, dword [RosterFileHandle]
        call LoadPlayoffStats
        jmp short PlayerStatsScreen_13DD.58
PlayerStatsScreen_13D1:
        mov eax, dword [PlayoffTreeData]
        call LoadSeasonStats
        jmp short PlayerStatsScreen_13DD.58
PlayerStatsScreen_13DD:
        call LoadModemStats
.58:
        mov edx, dword [byte ebp+032h]
        mov eax, dword [byte ebp+07Ah]
        movsx ebx, byte [StatsFromGame]
        call BuildPlayerStatRows
        jmp short .61
.59:
        cmp dword [dword ebp-01BD6h], 2AF8h
        jge short .60
        cmp dword [PlayerStatsSeason], byte 0
        jne short .60
        mov ebx, dword [dword ebp-01BD6h]
        mov edx, dword [byte ebp+032h]
        mov eax, dword [byte ebp+07Ah]
        call FillSkaterStatRows
        jmp short .61
.60:
        mov ebx, dword [dword ebp-01BD6h]
        mov edx, dword [byte ebp+032h]
        mov eax, dword [byte ebp+07Ah]
        call FillGoalieStatRows
.61:
        push dword [dword ebp-01BD6h]
        mov ecx, dword [dword ebp-01BD2h]
        mov eax, dword [byte ebp+07Ah]
        mov ebx, dword [PlayerStatsSort]
        mov edx, dword [RosterPlayerIds]
        call CountPlayerStatRows
        push str_VBAL2
        push dword [PlayerStatsShapes]
        mov dword [PlayerStatsRowCount], eax
        call FindShape
        add esp, byte 8
        push eax
        push str_SLDV
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ch
        mov edx, PlayerStatsVScroll
        push byte 0
        mov ebx, dword [PlayerStatsRowCount]
        lea eax, [dword ebp-02EEh]
        call InitVScrollBar
        push str_HBAL2
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_SLDH
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push byte 0
        cmp dword [PlayerStatsGoalies], byte 0
        sete al
        movzx ebx, al
        mov eax, 0Bh
        sub eax, ebx
        mov ecx, 4
        lea ebx, [byte eax+02h]
        mov edx, PlayerStatsHScroll
        lea eax, [dword ebp-01B6h]
        call InitHScrollBar
        mov edx, 2
        lea eax, [dword ebp-01B6h]
        call SetScrollBarPos
        lea eax, [dword ebp-02EEh]
        call DrawScrollBar
        lea eax, [dword ebp-01B6h]
        call DrawScrollBar
        lea eax, [dword ebp-066Eh]
        push eax
        mov edx, dword [byte ebp+026h]
        push dword [RatingsPlayerId]
        mov ecx, dword [RosterPlayerIds]
        push dword [dword ebp-0192h]
        mov ebx, dword [BackgroundShapes]
        push dword [dword ebp-02CAh]
        mov eax, dword [PlayerStatsRowCount]
        call DrawPlayerStatsTable
        lea ebx, [dword ebp-0B8Eh]
        mov edx, PlayerStatsItems
        lea eax, [dword ebx+0520h]
        add edx, byte 42h
        mov dword [byte ebp+062h], eax
.62:
        mov ecx, 4
        mov esi, ebx
        mov edi, edx
        rep movsb
        add ebx, byte 10h
        add edx, byte 66h
        cmp ebx, dword [byte ebp+062h]
        jne short .62
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        jne short .63
        cmp byte [PlayerStatsCompare], 0
        je short .64
.63:
        mov byte [PlayerStatsItems+1DDh], 1
        mov byte [PlayerStatsVScroll+42h], 1
.64:
        xor esi, esi
.65:
        cmp dword [dword esi+PlayerStatsItems+1Ah], byte 0
        je short .66
        push dword [dword esi+PlayerStatsItems+2Ah]
        push dword [dword esi+PlayerStatsItems+26h]
        push dword [dword esi+PlayerStatsItems+1Ah]
        call DrawArtKeyed
        add esp, byte 0Ch
.66:
        add esi, byte 66h
        cmp esi, 20ACh
        jne short .65
        call MusicDone
        test eax, eax
        jne short .67
        call PlayMusic
.67:
        mov ebx, 3
        mov edx, dword [byte ebp+02Ah]
        xor eax, eax
        call FadePalette
        mov dword [byte ebp+03Eh], 0FFFFFFFFh
        jmp near PlayerStatsScreen_1F1B.105
.68:
        cmp dword [byte ebp+03Eh], byte 0Fh
        ja near PlayerStatsScreen_1FC5.107
        mov eax, dword [byte ebp+03Eh]
        jmp dword [nosplit cs:eax*4+PlayerStatsChoiceJumpTable]
PlayerStatsScreen_1630:
        call SlideInSideBar
        mov dword [byte ebp+036h], 0A410h
        jmp near PlayerStatsScreen_1F1B.105
PlayerStatsScreen_1641:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .69
        call SlideInBottomBar
        push dword [MatchupLayer]
        call TextSetFont
        mov eax, 0FEh
        add esp, byte 4
        mov ecx, 0FCh
        mov ebx, 0FAh
        push eax
        mov edx, 0F7h
        mov eax, 1
        call ModemChat
        jmp near PlayerStatsScreen_1F1B.105
.69:
        mov dword [byte ebp+036h], 0A414h
        jmp near PlayerStatsScreen_1F1B.105
PlayerStatsScreen_1693:
        cmp dword [dword ebp-01BD6h], byte 64h
        je near PlayerStatsScreen_1F1B.104
        cmp dword [PlayerStatsSeason], byte 0
        jne near .72
        mov dword [PlayerStatsSeason], 1
        mov ebx, dword [dword ebp-01BD6h]
        mov edx, dword [byte ebp+032h]
        mov eax, dword [byte ebp+07Ah]
        mov ecx, dword [dword ebp-01BD2h]
        call FillGoalieStatRows
        push dword [dword ebp-01BD6h]
        mov eax, dword [byte ebp+07Ah]
        mov ebx, dword [PlayerStatsSort]
        mov edx, dword [RosterPlayerIds]
        call CountPlayerStatRows
        mov dword [PlayerStatsRowCount], eax
        lea eax, [dword ebp-02EEh]
        call FreeScrollBar
        mov eax, str_VBAL2
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_SLDV
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_BKGD16
        push eax
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        cmp dword [dword ebp-01BD2h], byte 63h
        jne short .70
        cmp dword [PlayerStatsGoalies], byte 0
        jne short .70
        mov eax, 1
        jmp short .71
.70:
        xor eax, eax
.71:
        mov ecx, 0Ch
        mov edx, PlayerStatsVScroll
        push eax
        mov ebx, dword [PlayerStatsRowCount]
        lea eax, [dword ebp-02EEh]
        call InitVScrollBar
        lea ecx, [dword ebp-02EEh]
        mov eax, RatingsPlayerId
        mov ebx, dword [PlayerStatsRowCount]
        mov edx, dword [RosterPlayerIds]
        call FindPlayerStatRow
        lea eax, [dword ebp-02EEh]
        call DrawScrollBar
        push PlayerStatsItems+198h
        lea eax, [byte ebp+016h]
        push eax
        push dword [byte ebp+016h]
        mov ebx, PlayerStatsItems+0CCh
        push PlayerStatsItems+132h
        lea eax, [byte ebp+01Ah]
        lea edx, [byte ebp+01Eh]
        push eax
        mov ecx, dword [byte ebp+01Ah]
        mov eax, 5
        jmp near .75
.72:
        cmp dword [dword ebp-01BD6h], 2AF8h
        jge near PlayerStatsScreen_1F1B.104
        cmp dword [dword ebp-01BD6h], byte 64h
        je near PlayerStatsScreen_1F1B.104
        mov dword [PlayerStatsSeason], 0
        mov ebx, dword [dword ebp-01BD6h]
        mov edx, dword [byte ebp+032h]
        mov eax, dword [byte ebp+07Ah]
        mov ecx, dword [dword ebp-01BD2h]
        call FillSkaterStatRows
        push dword [dword ebp-01BD6h]
        mov eax, dword [byte ebp+07Ah]
        mov ebx, dword [PlayerStatsSort]
        mov edx, dword [RosterPlayerIds]
        call CountPlayerStatRows
        mov dword [PlayerStatsRowCount], eax
        lea eax, [dword ebp-02EEh]
        call FreeScrollBar
        mov eax, str_VBAL2
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_SLDV
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_BKGD16
        push eax
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        cmp dword [dword ebp-01BD2h], byte 63h
        jne short .73
        cmp dword [PlayerStatsGoalies], byte 0
        jne short .73
        mov eax, 1
        jmp short .74
.73:
        xor eax, eax
.74:
        mov ecx, 0Ch
        mov edx, PlayerStatsVScroll
        push eax
        mov ebx, dword [PlayerStatsRowCount]
        lea eax, [dword ebp-02EEh]
        call InitVScrollBar
        lea ecx, [dword ebp-02EEh]
        mov eax, RatingsPlayerId
        mov ebx, dword [PlayerStatsRowCount]
        mov edx, dword [RosterPlayerIds]
        call FindPlayerStatRow
        lea eax, [dword ebp-02EEh]
        call DrawScrollBar
        push PlayerStatsItems+198h
        lea eax, [byte ebp+016h]
        push eax
        push dword [byte ebp+016h]
        mov ebx, PlayerStatsItems+0CCh
        push PlayerStatsItems+132h
        lea eax, [byte ebp+01Ah]
        lea edx, [byte ebp+01Eh]
        push eax
        mov ecx, dword [byte ebp+01Ah]
        mov eax, 7
.75:
        call AnimatePlayerStatsButtons
        jmp near PlayerStatsScreen_1F1B.104
PlayerStatsScreen_18F3:
        cmp dword [PlayerStatsGoalies], byte 0
        jne near .78
        mov dword [RatingsPlayerId], 3E7h
        mov dword [PlayerStatsGoalies], 1
        cmp dword [PlayerStatsSort], byte 3
        je short .76
        mov eax, PlayerStatsItems+198h
        push eax
        lea eax, [byte ebp+016h]
        push eax
        push byte 1
        jmp short .77
.76:
        mov eax, PlayerStatsItems+198h
        push eax
        lea eax, [byte ebp+016h]
        push eax
        push byte 6
.77:
        mov eax, PlayerStatsItems+132h
        mov ecx, 3
        push eax
        lea eax, [byte ebp+01Ah]
        xor ebx, ebx
        push eax
        xor edx, edx
        mov eax, 0FFFFFFFFh
        call AnimatePlayerStatsButtons
        lea eax, [dword ebp-01B6h]
        call FreeScrollBar
        push str_HBAL2
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_SLDH
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 4
        mov ebx, 0Dh
        jmp near .79
.78:
        mov eax, PlayerStatsItems+198h
        push eax
        lea eax, [byte ebp+016h]
        push eax
        mov dword [RatingsPlayerId], 3E7h
        mov ecx, 4
        push dword [byte ebp+016h]
        mov eax, PlayerStatsItems+132h
        xor ebx, ebx
        push eax
        lea eax, [byte ebp+01Ah]
        xor edx, edx
        push eax
        mov eax, 0FFFFFFFFh
        mov dword [PlayerStatsGoalies], 0
        call AnimatePlayerStatsButtons
        lea eax, [dword ebp-01B6h]
        call FreeScrollBar
        mov eax, str_HBAL2
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_SLDH
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_BKGD16
        push eax
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 4
        mov ebx, 0Ch
.79:
        push byte 0
        mov edx, PlayerStatsHScroll
        lea eax, [dword ebp-01B6h]
        call InitHScrollBar
        lea eax, [dword ebp-01B6h]
        call DrawScrollBar
        cmp dword [PlayerStatsGoalies], byte 0
        jne near .84
        push dword [dword ebp-01BD6h]
        mov ecx, dword [dword ebp-01BD2h]
        mov eax, dword [byte ebp+07Ah]
        mov ebx, dword [PlayerStatsSort]
        mov edx, dword [RosterPlayerIds]
.80:
        call CountPlayerStatRows
        mov dword [PlayerStatsRowCount], eax
        lea eax, [dword ebp-02EEh]
        call FreeScrollBar
        push str_VBAL2
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_SLDV
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        cmp dword [dword ebp-01BD2h], byte 63h
        jne short .83
        cmp dword [PlayerStatsGoalies], byte 0
        jne short .83
.81:
        mov eax, 1
.82:
        mov ecx, 0Ch
        mov edx, PlayerStatsVScroll
        push eax
        mov ebx, dword [PlayerStatsRowCount]
        lea eax, [dword ebp-02EEh]
        call InitVScrollBar
        lea eax, [dword ebp-02EEh]
        call DrawScrollBar
        jmp near PlayerStatsScreen_1F1B.104
.83:
        xor eax, eax
        jmp short .82
.84:
        cmp dword [PlayerStatsSort], byte 3
        jne short .85
        mov dword [PlayerStatsSort], 3
        jmp short .86
.85:
        mov dword [PlayerStatsSort], 0
.86:
        push dword [dword ebp-01BD6h]
        mov ecx, dword [dword ebp-01BD2h]
        mov eax, dword [byte ebp+07Ah]
        mov ebx, dword [PlayerStatsSort]
        mov edx, dword [RosterPlayerIds]
        call CountPlayerStatRows
        mov dword [PlayerStatsRowCount], eax
        lea eax, [dword ebp-02EEh]
        call FreeScrollBar
        push str_VBAL2
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_SLDV
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_BKGD16
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        cmp dword [dword ebp-01BD2h], byte 63h
        jne short .87
        cmp dword [PlayerStatsGoalies], byte 0
        jne short .87
        mov eax, 1
        jmp short .88
.87:
        xor eax, eax
.88:
        mov ecx, 0Ch
        mov edx, PlayerStatsVScroll
        push eax
        mov ebx, dword [PlayerStatsRowCount]
        lea eax, [dword ebp-02EEh]
        call InitVScrollBar
        lea eax, [dword ebp-066Eh]
        push eax
        mov edx, dword [byte ebp+026h]
        push dword [RatingsPlayerId]
        mov ecx, dword [RosterPlayerIds]
        push dword [dword ebp-0192h]
        mov ebx, dword [BackgroundShapes]
        push dword [dword ebp-02CAh]
        mov eax, dword [PlayerStatsRowCount]
        call DrawPlayerStatsTable
        lea eax, [dword ebp-02EEh]
        call DrawScrollBar
        jmp near PlayerStatsScreen_1F1B.105
PlayerStatsScreen_1C1D:
        mov eax, dword [PlayerStatsSort]
        mov dword [RatingsPlayerId], 3E7h
        cmp eax, byte 3
        ja near PlayerStatsScreen_1F1B.104
        jmp dword [nosplit cs:eax*4+PlayerStatsSortResetJumpTable]
PlayerStatsScreen_1C3D:
        cmp dword [PlayerStatsGoalies], byte 0
        je near .92
        mov dword [PlayerStatsSort], 3
        mov ebx, PlayerStatsItems+198h
        lea edx, [byte ebp+016h]
        mov eax, 6
        mov ecx, dword [dword ebp-01BD2h]
        call AnimatePlayerStatsButton
        push dword [dword ebp-01BD6h]
        mov ebx, 3
.89:
        mov eax, dword [byte ebp+07Ah]
        mov edx, dword [RosterPlayerIds]
        call CountPlayerStatRows
        mov dword [PlayerStatsRowCount], eax
        lea eax, [dword ebp-02EEh]
        call FreeScrollBar
        mov eax, str_VBAL2
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_SLDV
        push eax
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov eax, str_BKGD16
        push eax
.90:
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        cmp dword [dword ebp-01BD2h], byte 63h
        jne short .91
        cmp dword [PlayerStatsGoalies], byte 0
        je near PlayerStatsScreen_18F3.81
.91:
        xor eax, eax
        jmp near PlayerStatsScreen_18F3.82
.92:
        mov dword [PlayerStatsSort], 1
        mov ebx, PlayerStatsItems+198h
        lea edx, [byte ebp+016h]
        mov eax, 2
        mov ecx, dword [dword ebp-01BD2h]
        call AnimatePlayerStatsButton
        push dword [dword ebp-01BD6h]
        mov ebx, 1
        jmp near .89
PlayerStatsScreen_1D23:
        mov dword [PlayerStatsSort], 2
        mov ebx, PlayerStatsItems+198h
        lea edx, [byte ebp+016h]
        xor eax, eax
        mov ecx, dword [dword ebp-01BD2h]
        call AnimatePlayerStatsButton
        push dword [dword ebp-01BD6h]
        mov ebx, 2
        jmp near PlayerStatsScreen_1C3D.89
PlayerStatsScreen_1D52:
        mov dword [PlayerStatsSort], 3
        mov ebx, PlayerStatsItems+198h
        lea edx, [byte ebp+016h]
        mov eax, 6
        mov ecx, dword [dword ebp-01BD2h]
        call AnimatePlayerStatsButton
        push dword [dword ebp-01BD6h]
        mov ebx, 3
        mov eax, dword [byte ebp+07Ah]
        mov edx, dword [RosterPlayerIds]
        call CountPlayerStatRows
        mov dword [PlayerStatsRowCount], eax
        lea eax, [dword ebp-02EEh]
        call FreeScrollBar
        push str_VBAL2
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_SLDV
        push dword [PlayerStatsShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_BKGD16
        jmp near PlayerStatsScreen_1C3D.90
PlayerStatsScreen_1DCF:
        mov dword [PlayerStatsSort], 0
        mov ebx, PlayerStatsItems+198h
        lea edx, [byte ebp+016h]
        mov eax, 1
        mov ecx, dword [dword ebp-01BD2h]
        call AnimatePlayerStatsButton
        push dword [dword ebp-01BD6h]
        mov eax, dword [byte ebp+07Ah]
        mov edx, dword [RosterPlayerIds]
        xor ebx, ebx
        jmp near PlayerStatsScreen_18F3.80
PlayerStatsScreen_1E07:
        cmp dword [byte ebp+03Ah], byte 1
        jne short .93
        push dword [dword ebp-01BD6h]
        mov ebx, dword [dword ebp-01BD2h]
        mov ecx, dword [PlayerStatsSort]
        mov edx, dword [PlayerStatsRowCount]
        push dword [PlayerStatsSeason]
        mov eax, dword [RosterPlayerIds]
        call ExportPlayerStats
        xor eax, eax
        call LinkSync
        jmp near PlayerStatsScreen_1F1B.105
.93:
        mov eax, 21Dh
        call GetLangText
        call LinkSyncWithMessage
        jmp near PlayerStatsScreen_1F1B.105
PlayerStatsScreen_1E55:
        cmp dword [dword ebp-01BD2h], byte 63h
        jne short .94
        cmp dword [RatingsPlayerId], 3E7h
        je near PlayerStatsScreen_1F1B.105
        mov eax, dword [RatingsPlayerId]
        mov eax, dword [nosplit eax*4+PlayerRecPtrs]
        movsx eax, byte [eax]
        add eax, 0A416h
        jmp short PlayerStatsScreen_1E90.97
.94:
        mov dword [byte ebp+036h], 0A412h
        jmp near PlayerStatsScreen_1F1B.105
PlayerStatsScreen_1E90:
        cmp dword [dword ebp-01BD6h], byte 64h
        je short .95
        cmp dword [RatingsPlayerId], 3E7h
        je near PlayerStatsScreen_1F1B.105
        mov dword [byte ebp+036h], 0A411h
        jmp near PlayerStatsScreen_1F1B.105
.95:
        cmp byte [StatsFromGame], 0
        sete al
        mov byte [StatsFromGame], al
        test al, al
        je short .98
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
.96:
        shr eax, 1Bh
.97:
        mov dword [byte ebp+036h], eax
        jmp near PlayerStatsScreen_1F1B.105
.98:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        jmp short .96
PlayerStatsScreen_1EEB:
        cmp dword [dword ebp-01BD2h], byte 63h
        jne short .99
        lea eax, [dword ebp-02EEh]
        call ScrollBarPageUp
        jmp short PlayerStatsScreen_1F1B.104
.99:
        lea eax, [dword ebp-02EEh]
.100:
        call ScrollBarUp
        jmp short PlayerStatsScreen_1F1B.104
PlayerStatsScreen_1F0E:
        lea eax, [dword ebp-02EEh]
.101:
        call ScrollBarToMouse
        jmp short PlayerStatsScreen_1F1B.104
PlayerStatsScreen_1F1B:
        cmp dword [dword ebp-01BD2h], byte 63h
        jne short .102
        lea eax, [dword ebp-02EEh]
        call ScrollBarPageDown
        jmp short .104
.102:
        lea eax, [dword ebp-02EEh]
.103:
        call ScrollBarDown
.104:
        lea eax, [dword ebp-066Eh]
        push eax
        mov edx, dword [byte ebp+026h]
        push dword [RatingsPlayerId]
        mov ecx, dword [RosterPlayerIds]
        push dword [dword ebp-0192h]
        mov ebx, dword [BackgroundShapes]
        push dword [dword ebp-02CAh]
        mov eax, dword [PlayerStatsRowCount]
        call DrawPlayerStatsTable
.105:
        cmp dword [byte ebp+036h], byte 0FFFFFFFFh
        jne near PlayerStatsScreen_1FC5.111
        mov dword [byte ebp+03Eh], 0FFFFFFFFh
.106:
        cmp dword [byte ebp+03Eh], byte 0
        jge near PlayerStatsScreen_13DD.68
        push byte 3
        lea eax, [byte ebp+03Eh]
        push byte 0
        mov ecx, ShowPlayerStatsTitle
        mov ebx, 0FFFFFFFFh
        push eax
        mov edx, PlayerStatsItems
        mov eax, 52h
        call RunMenu
        mov dword [byte ebp+03Ah], eax
        jmp short .106
PlayerStatsScreen_1FAF:
        lea eax, [dword ebp-01B6h]
        jmp near PlayerStatsScreen_1EEB.100
PlayerStatsScreen_1FBA:
        lea eax, [dword ebp-01B6h]
        jmp near PlayerStatsScreen_1F0E.101
PlayerStatsScreen_1FC5:
        lea eax, [dword ebp-01B6h]
        jmp near PlayerStatsScreen_1F1B.103
.107:
        cmp dword [byte ebp+03Eh], byte 10h
        jle short PlayerStatsScreen_1F1B.105
        mov eax, dword [byte ebp+03Eh]
        sub eax, byte 11h
        mov ebx, 5
        cdq
        idiv ebx
        test edx, edx
        je short .108
        add edx, dword [dword ebp-0192h]
        dec edx
        mov dword [PlayerStatsMode], edx
        jmp short .109
.108:
        cmp dword [byte ebp+03Eh], byte 11h
        jne short .109
        mov dword [PlayerStatsMode], 0FFFFFFFFh
.109:
        mov eax, dword [byte ebp+03Eh]
        sub eax, byte 11h
        mov ebx, 5
        cdq
        idiv ebx
        mov edx, dword [RosterPlayerIds]
        add eax, dword [dword ebp-02CAh]
        mov ecx, ComparePlayerStatRows
        mov ebx, 4
        mov eax, dword [byte edx+eax*4-04h]
        mov edx, dword [PlayerStatRowsUsed]
        mov dword [RatingsPlayerId], eax
        mov eax, dword [byte ebp+07Ah]
        call qsort_
        push dword [dword ebp-01BD6h]
        mov ecx, dword [dword ebp-01BD2h]
        mov eax, dword [byte ebp+07Ah]
        mov ebx, dword [PlayerStatsSort]
        mov edx, dword [RosterPlayerIds]
        call CountPlayerStatRows
        mov dword [PlayerStatsRowCount], eax
        cmp dword [byte ebp+03Eh], byte 16h
        jge short .110
        lea eax, [dword ebp-02EEh]
        xor edx, edx
        mov dword [RatingsPlayerId], 3E7h
        call SetScrollBarPos
        lea eax, [dword ebp-02EEh]
        call DrawScrollBar
        jmp near PlayerStatsScreen_1F1B.104
.110:
        lea ecx, [dword ebp-02EEh]
        mov edx, dword [RosterPlayerIds]
        mov ebx, eax
        mov eax, RatingsPlayerId
        call FindPlayerStatRow
        jmp near PlayerStatsScreen_1F1B.104
.111:
        lea eax, [dword ebp-02EEh]
        call FreeScrollBar
        push dword [byte ebp+026h]
        call FreeBitmap
        add esp, byte 4
        push dword [BackgroundShapes]
        call FreeMemBlock
        add esp, byte 4
        push dword [PlayerStatsShapes]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+032h]
        call FreeMemBlock
        add esp, byte 4
        mov dword [byte ebp+06Ah], 20h
        push dword [byte ebp+07Ah]
        xor edi, edi
        call FreeMemBlock
        add esp, byte 4
.112:
        mov esi, edi
        mov eax, dword [byte ebp+06Ah]
        shl esi, 5
        mov dword [byte ebp+066h], eax
.113:
        push dword [dword esi+PlayerStatsButtonBmps]
        call FreeBitmap
        add esi, byte 4
        add esp, byte 4
        cmp esi, dword [byte ebp+066h]
        jne short .113
        inc edi
        add dword [byte ebp+06Ah], byte 20h
        cmp edi, byte 8
        jl short .112
        mov dword [byte ebp+072h], 0Ch
        xor edi, edi
.114:
        mov eax, dword [byte ebp+072h]
        mov dword [byte ebp+06Eh], eax
        imul esi, edi, byte 0Ch
.115:
        push dword [byte esi+ebp-042h]
        call FreeBitmap
        add esi, byte 4
        add esp, byte 4
        cmp esi, dword [byte ebp+06Eh]
        jne short .115
        inc edi
        add dword [byte ebp+072h], byte 0Ch
        cmp edi, byte 3
        jl short .114
        lea eax, [dword ebp-01B6h]
        call FreeScrollBar
        mov eax, 3
        call FadeOut
        cmp dword [dword ebp-01BD6h], byte 64h
        jne near .118
        push dword [RosterFirstNamePtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [StatColumnPtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterLastNamePtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterProfilePtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterPlayerPtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterDbPtrs]
        xor esi, esi
        call FreeMemBlock
        add esp, byte 4
.116:
        push dword [dword esi+StatColumnPtrs+4]
        call FreeMemBlock
        add esi, byte 4
        add esp, byte 4
        cmp esi, byte 2Ch
        jne short .116
        xor esi, esi
.117:
        push dword [dword esi+PlayerHeightPtrs]
        call FreeMemBlock
        add esi, byte 4
        add esp, byte 4
        cmp esi, byte 8
        jne short .117
        push dword [EditLinesBuffer]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterJerseyPtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterPlayerIds]
        mov dword [RosterDbPtrs], 0
        call FreeMemBlock
        mov dword [RosterPlayerIds], 0
        add esp, byte 4
.118:
        mov eax, dword [byte ebp+036h]
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FillSkaterStatRows                              8E76B  96 PC, low confidence
; Fills the player stat rows of the skaters from the stats database
;-----------------------------------------------------------------------------
FillSkaterStatRows:
        push ecx
        push esi
        push edi
        enter 20h, 0
        push eax
        push edx
        push ebx
        xor esi, esi
        mov dword [byte ebp-04h], esi
.1:
        mov edx, dword [byte ebp-04h]
        mov ebx, esi
        mov eax, dword [statsplayoffs]
        shl ebx, 2
        add edx, eax
        lea ecx, [esi+esi]
        mov dword [byte ebp-0Ch], edx
        mov dword [byte ebp-08h], edx
        lea eax, [byte edx+064h]
        add ecx, dword [byte ebp-028h]
        mov dword [byte ebp-01Ch], eax
.2:
        mov edx, dword [byte ebp-08h]
        mov edx, dword [byte edx+063h]
        mov eax, edx
        call PlayerDbRecord
        mov dword [byte ebp-010h], eax
        cmp edx, byte 0FFFFFFFFh
        je near .8
        mov edx, dword [RosterLastNamePtrs]
        lea edi, [byte eax+03h]
        mov dword [edx+ebx], edi
        mov edx, dword [RosterProfilePtrs]
        lea edi, [byte eax+013h]
        mov dword [edx+ebx], edi
        mov dl, byte [byte eax+02h]
        mov byte [dword esi+PlayerPosCodes], dl
        mov edx, dword [RosterFirstNamePtrs]
        lea edi, [byte eax+01h]
        mov dword [edx+ebx], edi
        mov edx, dword [EditLinesBuffer]
        lea edi, [byte eax+034h]
        mov dword [edx+ebx], edi
        mov edx, dword [RosterJerseyPtrs]
        lea edi, [byte eax+030h]
        mov dword [edx+ebx], edi
        mov dword [dword ebx+PlayerRecPtrs], eax
        mov edx, dword [RosterPlayerPtrs]
        mov edi, dword [byte eax+024h]
        mov dword [edx+ebx], edi
        mov edx, dword [PlayerHeightPtrs]
        lea edi, [byte eax+038h]
        mov dword [edx+ebx], edi
        mov edx, dword [PlayerWeightPtrs]
        lea edi, [byte eax+039h]
        mov dword [edx+ebx], edi
        cmp dword [byte ebp-02Ch], 3E8h
        jge short .3
        mov edi, dword [byte eax+028h]
        mov edx, dword [RosterDbPtrs]
        mov eax, edi
        mov dword [edx+ebx], edi
        call CareerDbRecord
        jmp short .4
.3:
        mov edi, dword [byte eax+02Ch]
        mov edx, dword [RosterDbPtrs]
        mov eax, edi
        mov dword [edx+ebx], edi
        call SeasonDbRecord
.4:
        mov edx, dword [StatColumnPtrs]
        lea edi, [byte eax+010h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+4]
        mov dword [edx+ebx], eax
        mov edx, dword [StatColumnPtrs+8]
        lea edi, [byte eax+02h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+0Ch]
        lea edi, [byte eax+04h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+10h]
        lea edi, [byte eax+06h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+14h]
        lea edi, [byte eax+08h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+18h]
        lea edi, [byte eax+0Ah]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+1Ch]
        lea edi, [byte eax+0Ch]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+20h]
        lea edi, [byte eax+0Eh]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+24h]
        mov dword [edx+ebx], ecx
        mov edx, dword [StatColumnPtrs+28h]
        mov dword [edx+ebx], 0
        mov edx, dword [StatColumnPtrs+2Ch]
        mov dword [edx+ebx], 0
        cmp word [byte eax+0Eh], byte 0
        je short .5
        movzx edx, word [byte eax+02h]
        imul edx, dword 3E8h
        movzx eax, word [byte eax+0Eh]
        mov dword [byte ebp-020h], eax
        mov eax, edx
        cdq
        idiv dword [byte ebp-020h]
        mov word [ecx], ax
        jmp short .6
.5:
        mov word [ecx], 0
.6:
        movzx eax, word [ecx]
        cmp eax, 3E8h
        jle short .7
        mov word [ecx], 3E8h
.7:
        mov eax, dword [byte ebp-010h]
        add ebx, byte 4
        movsx eax, byte [byte eax+03Ah]
        inc esi
        cmp eax, byte 59h
        sete al
        inc ecx
        inc ecx
        mov byte [dword esi+PlayerRowTeam], al
.8:
        add dword [byte ebp-08h], byte 4
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte ebp-01Ch]
        jne near .2
        mov ecx, dword [byte ebp-0Ch]
        mov ebx, esi
        lea eax, [byte ecx+0Ch]
        shl ebx, 2
        mov dword [byte ebp-018h], eax
.9:
        mov edi, dword [dword ecx+0C7h]
        mov eax, edi
        call PlayerDbRecord
        mov edx, eax
        mov dword [byte ebp-014h], eax
        cmp edi, byte 0FFFFFFFFh
        je near .12
        mov edi, edx
        mov eax, dword [RosterLastNamePtrs]
        add edi, byte 3
        mov dword [ebx+eax], edi
        mov edi, edx
        mov eax, dword [RosterProfilePtrs]
        add edi, byte 13h
        mov dword [ebx+eax], edi
        mov al, byte [byte edx+02h]
        mov edi, edx
        mov byte [dword esi+PlayerPosCodes], al
        mov eax, dword [RosterFirstNamePtrs]
        inc edi
        mov dword [ebx+eax], edi
        mov edi, edx
        mov eax, dword [EditLinesBuffer]
        add edi, byte 34h
        mov dword [ebx+eax], edi
        mov edi, edx
        mov eax, dword [RosterJerseyPtrs]
        add edi, byte 30h
        mov dword [ebx+eax], edi
        mov dword [dword ebx+PlayerRecPtrs], edx
        mov eax, dword [RosterPlayerPtrs]
        mov edi, dword [byte edx+024h]
        mov dword [ebx+eax], edi
        mov edi, edx
        mov eax, dword [PlayerHeightPtrs]
        add edi, byte 38h
        mov dword [ebx+eax], edi
        mov edi, edx
        mov eax, dword [PlayerWeightPtrs]
        add edi, byte 39h
        mov dword [ebx+eax], edi
        cmp dword [byte ebp-02Ch], 3E8h
        jge short .10
        mov eax, dword [byte edx+028h]
        call CareerDbRecord
        mov edi, dword [RosterDbPtrs]
        add edi, ebx
        mov edx, dword [byte edx+028h]
        jmp short .11
.10:
        mov eax, dword [byte edx+02Ch]
        call SeasonDbRecord
        mov edi, dword [RosterDbPtrs]
        add edi, ebx
        mov edx, dword [byte edx+02Ch]
.11:
        mov dword [edi], edx
        mov edx, dword [StatColumnPtrs]
        mov dword [edx+ebx], 0
        mov edx, dword [StatColumnPtrs+4]
        mov dword [edx+ebx], eax
        mov edx, dword [StatColumnPtrs+8]
        lea edi, [byte eax+0Ch]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+0Ch]
        lea edi, [byte eax+010h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+10h]
        lea edi, [byte eax+02h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+14h]
        lea edi, [byte eax+04h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+18h]
        lea edi, [byte eax+06h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+1Ch]
        lea edi, [byte eax+0Ah]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+20h]
        lea edi, [byte eax+08h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+24h]
        lea edi, [byte eax+0Eh]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+28h]
        lea edi, [byte eax+012h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+2Ch]
        add eax, byte 14h
        mov dword [edx+ebx], eax
        mov eax, dword [byte ebp-014h]
        movsx eax, byte [byte eax+03Ah]
        inc esi
        cmp eax, byte 59h
        sete al
        add ebx, byte 4
        mov byte [dword esi+PlayerRowTeam], al
.12:
        add ecx, byte 4
        cmp ecx, dword [byte ebp-018h]
        jne near .9
        add dword [byte ebp-04h], 31Bh
        cmp dword [byte ebp-04h], 50BEh
        jne near .1
        mov eax, dword [byte ebp-024h]
        xor edx, edx
        jmp short .14
.13:
        mov dword [eax], edx
        add eax, byte 4
        inc edx
.14:
        cmp edx, esi
        jl short .13
FillSkaterStatRows_37A:
        mov ecx, ComparePlayerStatRows
        mov ebx, 4
        mov eax, dword [byte ebp-024h]
FillSkaterStatRows_387:
        mov edx, esi
        call qsort_
        mov dword [PlayerStatRowsUsed], esi
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; FillGoalieStatRows                              8EB04  96 PC, low confidence
; Fills the player stat rows of the goalies
;-----------------------------------------------------------------------------
FillGoalieStatRows:
        push ecx
        push esi
        push edi
        enter 20h, 0
        push eax
        push edx
        push ebx
        xor esi, esi
        mov dword [byte ebp-08h], esi
.1:
        mov edx, dword [byte ebp-08h]
        lea ecx, [esi+esi]
        mov eax, dword [statsplayoffs]
        add ecx, dword [byte ebp-028h]
        add edx, eax
        mov ebx, esi
        mov dword [byte ebp-0Ch], edx
        mov dword [byte ebp-04h], edx
        lea eax, [byte edx+064h]
        shl ebx, 2
        mov dword [byte ebp-01Ch], eax
.2:
        mov edx, dword [byte ebp-04h]
        mov edx, dword [byte edx+063h]
        mov eax, edx
        call PlayerDbRecord
        mov dword [byte ebp-010h], eax
        cmp edx, byte 0FFFFFFFFh
        je near .7
        mov edx, dword [RosterLastNamePtrs]
        lea edi, [byte eax+03h]
        mov dword [edx+ebx], edi
        mov edx, dword [RosterProfilePtrs]
        lea edi, [byte eax+013h]
        mov dword [edx+ebx], edi
        mov dl, byte [byte eax+02h]
        mov byte [dword esi+PlayerPosCodes], dl
        mov edx, dword [RosterFirstNamePtrs]
        lea edi, [byte eax+01h]
        mov dword [edx+ebx], edi
        mov edx, dword [EditLinesBuffer]
        lea edi, [byte eax+034h]
        mov dword [edx+ebx], edi
        mov edx, dword [RosterJerseyPtrs]
        lea edi, [byte eax+030h]
        mov dword [edx+ebx], edi
        mov dword [dword ebx+PlayerRecPtrs], eax
        mov edx, dword [RosterPlayerPtrs]
        mov edi, dword [byte eax+024h]
        mov dword [edx+ebx], edi
        mov edx, dword [PlayerHeightPtrs]
        lea edi, [byte eax+038h]
        mov dword [edx+ebx], edi
        mov edx, dword [PlayerWeightPtrs]
        lea edi, [byte eax+039h]
        mov dword [edx+ebx], edi
        cmp dword [byte ebp-02Ch], 3E8h
        jge short .3
        mov edi, dword [byte eax+028h]
        mov edx, dword [RosterDbPtrs]
        mov eax, edi
        mov dword [edx+ebx], edi
        call CareerDbRecord
        jmp short .4
.3:
        mov edi, dword [byte eax+02Ch]
        mov edx, dword [RosterDbPtrs]
        mov eax, edi
        mov dword [edx+ebx], edi
        call SeasonDbRecord
.4:
        mov edx, dword [StatColumnPtrs]
        lea edi, [byte eax+022h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+4]
        lea edi, [byte eax+012h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+8]
        lea edi, [byte eax+014h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+0Ch]
        lea edi, [byte eax+016h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+10h]
        lea edi, [byte eax+018h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+14h]
        lea edi, [byte eax+01Ah]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+18h]
        lea edi, [byte eax+01Ch]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+1Ch]
        lea edi, [byte eax+01Eh]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+20h]
        lea edi, [byte eax+020h]
        mov dword [edx+ebx], edi
        mov edx, dword [StatColumnPtrs+24h]
        mov dword [edx+ebx], ecx
        mov edx, dword [StatColumnPtrs+28h]
        mov dword [edx+ebx], 0
        mov edx, dword [StatColumnPtrs+2Ch]
        mov dword [edx+ebx], 0
        cmp word [byte eax+020h], byte 0
        jbe short .5
        movzx edx, word [byte eax+014h]
        imul edx, dword 3E8h
        movzx eax, word [byte eax+020h]
        mov dword [byte ebp-020h], eax
        mov eax, edx
        cdq
        idiv dword [byte ebp-020h]
        mov word [ecx], ax
        jmp short .6
.5:
        mov word [ecx], 0
.6:
        mov eax, dword [byte ebp-010h]
        inc ecx
        inc ecx
        movsx eax, byte [byte eax+03Ah]
        inc esi
        cmp eax, byte 59h
        sete al
        add ebx, byte 4
        mov byte [dword esi+PlayerRowTeam], al
.7:
        add dword [byte ebp-04h], byte 4
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte ebp-01Ch]
        jne near .2
        mov ebx, dword [byte ebp-0Ch]
        mov edx, esi
        lea eax, [byte ebx+0Ch]
        shl edx, 2
        mov dword [byte ebp-018h], eax
.8:
        mov ecx, dword [dword ebx+0C7h]
        mov eax, ecx
        call PlayerDbRecord
        mov dword [byte ebp-014h], eax
        cmp ecx, byte 0FFFFFFFFh
        je near .11
        mov ecx, dword [RosterLastNamePtrs]
        lea edi, [byte eax+03h]
        mov dword [ecx+edx], edi
        mov ecx, dword [RosterProfilePtrs]
        lea edi, [byte eax+013h]
        mov dword [ecx+edx], edi
        mov cl, byte [byte eax+02h]
        mov byte [dword esi+PlayerPosCodes], cl
        mov ecx, dword [RosterFirstNamePtrs]
        lea edi, [byte eax+01h]
        mov dword [ecx+edx], edi
        mov ecx, dword [EditLinesBuffer]
        lea edi, [byte eax+034h]
        mov dword [ecx+edx], edi
        mov ecx, dword [RosterJerseyPtrs]
        lea edi, [byte eax+030h]
        mov dword [ecx+edx], edi
        mov dword [dword edx+PlayerRecPtrs], eax
        mov ecx, dword [RosterPlayerPtrs]
        mov edi, dword [byte eax+024h]
        mov dword [ecx+edx], edi
        mov ecx, dword [PlayerHeightPtrs]
        lea edi, [byte eax+038h]
        mov dword [ecx+edx], edi
        mov ecx, dword [PlayerWeightPtrs]
        lea edi, [byte eax+039h]
        mov dword [ecx+edx], edi
        cmp dword [byte ebp-02Ch], 3E8h
        jge short .9
        mov edi, dword [byte eax+028h]
        mov ecx, dword [RosterDbPtrs]
        mov eax, edi
        mov dword [ecx+edx], edi
        call CareerDbRecord
        jmp short .10
.9:
        mov edi, dword [byte eax+02Ch]
        mov ecx, dword [RosterDbPtrs]
        mov eax, edi
        mov dword [ecx+edx], edi
        call SeasonDbRecord
.10:
        mov ecx, dword [StatColumnPtrs]
        mov dword [ecx+edx], 0
        mov ecx, dword [StatColumnPtrs+4]
        lea edi, [byte eax+016h]
        mov dword [ecx+edx], edi
        mov ecx, dword [StatColumnPtrs+8]
        lea edi, [byte eax+022h]
        mov dword [ecx+edx], edi
        mov ecx, dword [StatColumnPtrs+0Ch]
        lea edi, [byte eax+026h]
        mov dword [ecx+edx], edi
        mov ecx, dword [StatColumnPtrs+10h]
        lea edi, [byte eax+018h]
        mov dword [ecx+edx], edi
        mov ecx, dword [StatColumnPtrs+14h]
        lea edi, [byte eax+01Ah]
        mov dword [ecx+edx], edi
        mov ecx, dword [StatColumnPtrs+18h]
        lea edi, [byte eax+01Ch]
        mov dword [ecx+edx], edi
        mov ecx, dword [StatColumnPtrs+1Ch]
        lea edi, [byte eax+020h]
        mov dword [ecx+edx], edi
        mov ecx, dword [StatColumnPtrs+20h]
        lea edi, [byte eax+01Eh]
        mov dword [ecx+edx], edi
        mov ecx, dword [StatColumnPtrs+24h]
        lea edi, [byte eax+024h]
        mov dword [ecx+edx], edi
        mov ecx, dword [StatColumnPtrs+28h]
        lea edi, [byte eax+028h]
        mov dword [ecx+edx], edi
        mov ecx, dword [StatColumnPtrs+2Ch]
        add eax, byte 2Ah
        mov dword [ecx+edx], eax
        mov eax, dword [byte ebp-014h]
        movsx eax, byte [byte eax+03Ah]
        inc esi
        cmp eax, byte 59h
        sete al
        add edx, byte 4
        mov byte [dword esi+PlayerRowTeam], al
.11:
        add ebx, byte 4
        cmp ebx, dword [byte ebp-018h]
        jne near .8
        add dword [byte ebp-08h], 31Bh
        cmp dword [byte ebp-08h], 50BEh
        jne near .1
        mov eax, dword [byte ebp-024h]
        xor edx, edx
        jmp short .13
.12:
        mov dword [eax], edx
        add eax, byte 4
        inc edx
.13:
        cmp edx, esi
        jl short .12
        jmp near FillSkaterStatRows_37A
;-----------------------------------------------------------------------------
; DrawPlayerStatsTable                         8EE72  96 PC, medium confidence
; Draws the player stats rows ("%d.%d%%", "%d-%d", "%c   %d")
;-----------------------------------------------------------------------------
DrawPlayerStatsTable:
        push esi
        push edi
        enter 84h, 0
        push eax
        push edx
        sub ebp, byte 72h
        mov esi, ebx
        mov dword [byte ebp+03Eh], ecx
        push edx
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF74h
        push byte 0FFFFFFBAh
        push str_BKGD16
        push esi
        mov dword [byte ebp+066h], 0
        mov dword [byte ebp+046h], 0
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+062h], 0
        mov dword [byte ebp+04Eh], 109h
        push eax
        mov dword [byte ebp+04Ah], 140h
        mov edi, 125h
        call PutBlock
        mov eax, dword [dword ebp+08Eh]
        mov ecx, 1E0h
        add esp, byte 0Ch
        xor ebx, ebx
        xor edx, edx
        push byte 12h
        add eax, 100h
        mov esi, dword [dword ebp+086h]
        call FillBox
        mov eax, 0FCh
        xor edx, edx
        shl esi, 2
        call SetTextColors
.1:
        mov eax, dword [byte ebp+062h]
        add eax, dword [dword ebp+086h]
        cmp eax, dword [PlayerStatsMode]
        jne short .2
        push dword 104h
        mov ecx, dword [byte ebp+04Ah]
        mov edx, dword [byte ebp+04Eh]
        mov eax, dword [dword ebp+08Eh]
        xor ebx, ebx
        call FillBox
        mov eax, 0FDh
        xor edx, edx
        call SetTextColors
.2:
        cmp dword [PlayerStatsGoalies], byte 0
        jne short .3
        mov edx, edi
        mov eax, dword [dword esi+SkaterColTextIds]
        jmp short .4
.3:
        mov edx, edi
        mov eax, dword [dword esi+GoalieColTextIds]
.4:
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        mov eax, 0FCh
        add dword [byte ebp+04Eh], byte 37h
        add dword [byte ebp+04Ah], byte 37h
        xor edx, edx
        inc dword [byte ebp+062h]
        call SetTextColors
        add esi, byte 4
        add edi, byte 37h
        cmp dword [byte ebp+062h], byte 4
        jl short .1
        mov eax, 0F3h
        xor ebx, ebx
        xor edx, edx
        call GetLangText
        call DrawColorText
        mov eax, dword [dword ebp+082h]
        mov dword [byte ebp+05Eh], eax
        mov eax, dword [dword ebp+086h]
        add eax, byte 4
        mov dword [byte ebp+03Ah], eax
        mov eax, dword [dword ebp+082h]
        add eax, dword [byte ebp-016h]
        mov dword [byte ebp+042h], eax
        mov eax, dword [dword ebp+082h]
        shl eax, 2
        add eax, dword [byte ebp+03Eh]
        mov dword [byte ebp+032h], eax
        mov eax, dword [byte ebp+066h]
        dec eax
        dec eax
        mov dword [byte ebp+052h], eax
        mov eax, dword [byte ebp+066h]
        add eax, byte 10h
        mov dword [byte ebp+056h], eax
        mov eax, dword [dword ebp+086h]
        shl eax, 2
        mov dword [byte ebp+036h], eax
        jmp near .44
.5:
        cmp dword [byte ebp+046h], byte 0Ch
        jge near .43
        inc dword [byte ebp+046h]
        mov esi, dword [byte ebp+032h]
        add dword [byte ebp+052h], byte 14h
        add dword [byte ebp+056h], byte 14h
        mov esi, dword [esi]
        add dword [byte ebp+066h], byte 14h
        cmp esi, dword [dword ebp+08Ah]
        jne short .6
        mov eax, 0FDh
        mov ecx, 1E0h
        xor edx, edx
        mov ebx, dword [byte ebp+052h]
        call SetTextColors
        push dword [byte ebp+056h]
        mov eax, dword [dword ebp+08Eh]
        xor edx, edx
        call FillBox
        jmp short .7
.6:
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
.7:
        mov ecx, esi
        mov eax, dword [RosterProfilePtrs]
        shl ecx, 2
        mov eax, dword [ecx+eax]
        mov edx, 11h
        call strlen_
        sub edx, eax
        mov eax, dword [RosterLastNamePtrs]
        mov eax, dword [ecx+eax]
        call strlen_
        inc eax
        cmp edx, eax
        jbe short .8
        mov eax, dword [RosterLastNamePtrs]
        mov edx, dword [ecx+eax]
        lea eax, [byte ebp+0Eh]
        call strcpy_
        jmp short .9
.8:
        mov eax, dword [RosterLastNamePtrs]
        mov eax, dword [ecx+eax]
        mov al, byte [eax]
        mov byte [byte ebp+0Fh], 2Eh
        mov byte [byte ebp+010h], 0
        mov byte [byte ebp+0Eh], al
.9:
        mov edx, str_Space
        lea eax, [byte ebp+0Eh]
        call strcat_
        mov ecx, esi
        mov eax, dword [RosterProfilePtrs]
        shl ecx, 2
        mov edx, dword [ecx+eax]
        lea eax, [byte ebp+0Eh]
        mov ebx, dword [byte ebp+066h]
        call strcat_
        mov edx, 8Ch
        lea eax, [byte ebp+0Eh]
        call DrawColorText
        mov eax, dword [byte ebp+05Eh]
        inc eax
        push eax
        push str_D9
        lea eax, [byte ebp-012h]
        push eax
        mov ebx, dword [byte ebp+066h]
        call sprintf_
        add esp, byte 0Ch
        mov edx, 3
        lea eax, [byte ebp-012h]
        call DrawColorText
        mov eax, dword [dword ecx+PlayerRecPtrs]
        movsx eax, byte [eax]
        push dword [nosplit eax*4+LogoNames]
        push str_S3
        lea eax, [byte ebp-012h]
        push eax
        mov ebx, dword [byte ebp+066h]
        call sprintf_
        add esp, byte 0Ch
        mov edx, 28h
        lea eax, [byte ebp-012h]
        call DrawColorText
        test byte [optflags], 0Ch
        jne short .10
        mov eax, dword [RosterFirstNamePtrs]
        mov eax, dword [ecx+eax]
        movzx eax, byte [eax]
        push eax
        movsx eax, byte [dword esi+PlayerPosCodes]
        jmp short .16
.10:
        mov al, byte [dword esi+PlayerPosCodes]
        cmp al, 44h
        jb short .11
        jbe short .12
        cmp al, 47h
        je short .14
        jmp short .15
.11:
        cmp al, 43h
        je short .13
        jmp short .15
.12:
        mov al, 41h
        jmp short .15
.13:
        mov al, 4Dh
        jmp short .15
.14:
        mov al, 54h
.15:
        mov edx, dword [RosterFirstNamePtrs]
        mov ebx, esi
        mov ebx, dword [edx+ebx*4]
        movzx edx, byte [ebx]
        push edx
        movsx eax, al
.16:
        push eax
        push str_CD
        lea eax, [byte ebp-012h]
        push eax
        call sprintf_
        add esp, byte 10h
        mov ebx, dword [byte ebp+066h]
        mov edx, 5Ah
        lea eax, [byte ebp-012h]
        mov dword [byte ebp+05Ah], 125h
        mov edi, dword [dword ebp+086h]
        mov ecx, dword [byte ebp+036h]
        call DrawColorText
        shl esi, 2
        jmp near .42
.17:
        cmp dword [PlayerStatsGoalies], byte 0
        jne near .32
        cmp edi, byte 0Bh
        jne short .18
        mov eax, dword [dword ecx+RosterFirstNamePtrs]
        mov ebx, dword [esi+eax]
        movzx ebx, word [ebx]
        mov eax, ebx
        mov dword [byte ebp+06Ah], 0Ah
        cdq
        idiv dword [byte ebp+06Ah]
        push edx
        mov eax, ebx
        mov ebx, 0Ah
        cdq
        idiv ebx
        push eax
        push str_DD3
        jmp near .22
.18:
        test edi, edi
        jne short .20
        test byte [optflags], 0Ch
        jne short .20
.19:
        mov eax, dword [dword ecx+PlayerHeightPtrs]
        mov ebx, dword [esi+eax]
        movzx ebx, byte [ebx]
        mov eax, ebx
        mov dword [byte ebp+06Ah], 0Ch
        cdq
        idiv dword [byte ebp+06Ah]
        push edx
        mov eax, ebx
        mov ebx, 0Ch
        cdq
        idiv ebx
        push eax
        push str_DD4
        jmp short .22
.20:
        test edi, edi
        jne short .23
        mov eax, dword [PlayerHeightPtrs]
        mov eax, dword [esi+eax]
        movzx ax, byte [eax]
        mov dword [byte ebp+06Eh], eax
        fild word [byte ebp+06Eh]
        fmul qword [F64_2p54]
        call __CHP
        fistp dword [byte ebp+026h]
        mov eax, dword [byte ebp+026h]
        mov ebx, 64h
        cdq
        idiv ebx
        mov eax, dword [byte ebp+026h]
.21:
        push edx
        cdq
        idiv ebx
        push eax
        push str_DD5
.22:
        lea eax, [byte ebp-012h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp near .41
.23:
        cmp edi, byte 1
        jne short .27
        test byte [optflags], 0Ch
        jne short .27
.24:
        mov eax, dword [dword ecx+PlayerHeightPtrs]
        mov eax, dword [esi+eax]
        movzx eax, byte [eax]
.25:
        push eax
.26:
        push str_D10
        jmp near .40
.27:
        cmp edi, byte 1
        jne short .28
        mov eax, dword [PlayerWeightPtrs]
        mov eax, dword [esi+eax]
        movzx ax, byte [eax]
        mov dword [byte ebp+06Eh], eax
        fild word [byte ebp+06Eh]
        fmul qword [F64_0p454545]
        call __CHP
        fistp dword [byte ebp+02Ah]
        push dword [byte ebp+02Ah]
        jmp short .26
.28:
        cmp edi, byte 8
        jne short .29
        mov eax, dword [StatColumnPtrs]
        mov eax, dword [esi+eax]
        movsx eax, word [eax]
        jmp short .25
.29:
        jle short .31
        mov eax, dword [dword ecx+RosterFirstNamePtrs]
.30:
        mov eax, dword [esi+eax]
        movzx eax, word [eax]
        jmp short .25
.31:
        mov eax, dword [dword ecx+RosterJerseyPtrs]
        jmp short .30
.32:
        test edi, edi
        jne short .33
        test byte [optflags], 0Ch
        je near .19
.33:
        test edi, edi
        jne short .34
        mov eax, dword [PlayerHeightPtrs]
        mov eax, dword [esi+eax]
        movzx ax, byte [eax]
        mov dword [byte ebp+06Eh], eax
        fild word [byte ebp+06Eh]
        fmul qword [F64_2p54]
        call __CHP
        fistp dword [byte ebp+02Eh]
        mov eax, dword [byte ebp+02Eh]
        mov ebx, 64h
        cdq
        idiv ebx
        mov eax, dword [byte ebp+02Eh]
        jmp near .21
.34:
        cmp edi, byte 1
        jne short .35
        test byte [optflags], 0Ch
        je near .24
.35:
        cmp edi, byte 1
        jne short .36
        mov eax, dword [PlayerWeightPtrs]
        mov eax, dword [esi+eax]
        movzx ax, byte [eax]
        mov dword [byte ebp+06Eh], eax
        fild word [byte ebp+06Eh]
        fmul qword [F64_0p454545]
        call __CHP
        fistp dword [byte ebp+022h]
        push dword [byte ebp+022h]
        jmp near .26
.36:
        cmp edi, byte 4
        jne short .37
        mov ebx, dword [dword ecx+RosterJerseyPtrs]
        mov ebx, dword [esi+ebx]
        movzx ebx, word [ebx]
        mov eax, ebx
        mov dword [byte ebp+06Ah], 64h
        cdq
        idiv dword [byte ebp+06Ah]
        push edx
        mov eax, ebx
        mov ebx, 64h
        cdq
        idiv ebx
        push eax
        push str_D02d
        jmp near .22
.37:
        cmp edi, byte 0Ch
        jne short .38
        mov eax, dword [dword ecx+RosterJerseyPtrs]
        mov eax, dword [esi+eax]
        movzx eax, word [eax]
        cmp eax, 3E8h
        je short .38
        push eax
        push str_03d2
        jmp short .40
.38:
        cmp edi, byte 0Ch
        jne short .39
        push str_10003
        lea eax, [byte ebp-012h]
        push eax
        call sprintf_
        add esp, byte 8
        jmp short .41
.39:
        mov eax, dword [dword ecx+RosterJerseyPtrs]
        mov eax, dword [esi+eax]
        movzx eax, word [eax]
        push eax
        push str_D10
.40:
        lea eax, [byte ebp-012h]
        push eax
        call sprintf_
        add esp, byte 0Ch
.41:
        mov ebx, dword [byte ebp+066h]
        mov edx, dword [byte ebp+05Ah]
        lea eax, [byte ebp-012h]
        call DrawColorTextCentred
        add ecx, byte 4
        inc edi
        add dword [byte ebp+05Ah], byte 37h
.42:
        cmp edi, dword [byte ebp+03Ah]
        jl near .17
.43:
        add dword [byte ebp+032h], byte 4
        inc dword [byte ebp+05Eh]
.44:
        mov eax, dword [byte ebp+05Eh]
        cmp eax, dword [byte ebp+042h]
        jl near .5
        call SetScreenTarget
        push dword 8Ch
        mov eax, dword [byte ebp-01Ah]
        push byte 46h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        lea esp, [byte ebp+072h]
        pop ebp
        pop edi
        pop esi
        ret 10h
;-----------------------------------------------------------------------------
; CountPlayerStatRows                             8F44A  96 PC, low confidence
; Counts the rows that pass the filter (position PlayerPosCodes, 'D' ...)
;-----------------------------------------------------------------------------
CountPlayerStatRows:
        push esi
        push edi
        enter 0Ch, 0
        push edx
        mov edi, ecx
        mov ecx, dword [PlayerStatRowsUsed]
        xor edx, edx
        mov dword [byte ebp-08h], ecx
        mov dword [byte ebp-0Ch], edx
        mov dword [byte ebp-04h], edx
        jmp near .9
.1:
        test ebx, ebx
        je short .4
        cmp ebx, byte 2
        jne short .2
        mov ecx, dword [eax]
        movsx ecx, byte [dword ecx+PlayerPosCodes]
        cmp ecx, byte 44h
        je short .4
.2:
        cmp ebx, byte 1
        jne short .3
        mov ecx, dword [eax]
        movsx ecx, byte [dword ecx+PlayerPosCodes]
        cmp ecx, byte 4Ch
        je short .4
        cmp ecx, byte 43h
        je short .4
        cmp ecx, byte 52h
        je short .4
.3:
        cmp ebx, byte 3
        jne short .8
        mov esi, dword [eax]
        cmp byte [dword esi+PlayerRowShown], 0
        je short .8
.4:
        cmp edi, byte 63h
        je short .5
        mov ecx, dword [eax]
        mov ecx, dword [nosplit ecx*4+PlayerRecPtrs]
        movsx ecx, byte [ecx]
        cmp edi, ecx
        jne short .8
.5:
        cmp dword [PlayerStatsGoalies], byte 0
        je short .6
        mov ecx, dword [eax]
        movsx ecx, byte [dword ecx+PlayerPosCodes]
        cmp ecx, byte 47h
        je short .7
.6:
        cmp dword [PlayerStatsGoalies], byte 0
        jne short .8
        mov ecx, dword [eax]
        movsx ecx, byte [dword ecx+PlayerPosCodes]
        cmp ecx, byte 47h
        je short .8
.7:
        mov ecx, dword [byte ebp-04h]
        inc edx
        add ecx, dword [byte ebp-010h]
        mov esi, dword [eax]
        add dword [byte ebp-04h], byte 4
        mov dword [ecx], esi
.8:
        inc dword [byte ebp-0Ch]
        add eax, byte 4
.9:
        mov ecx, dword [byte ebp-0Ch]
        cmp ecx, dword [byte ebp-08h]
        jl near .1
        mov eax, edx
        leave
        pop edi
        pop esi
        ret 4
        push ecx
        mov ecx, eax
        mov eax, edx
        xor edx, edx
        jmp short .12
.10:
        cmp ecx, dword [eax]
        jne short .11
        mov eax, edx
        pop ecx
        ret
.11:
        add eax, byte 4
        inc edx
.12:
        cmp edx, ebx
        jl short .10
        mov eax, 3E7h
        pop ecx
        ret
;-----------------------------------------------------------------------------
; FindPlayerStatRow                               8F539  96 PC, low confidence
; Finds a player's row and scrolls to it (SetScrollBarPos)
;-----------------------------------------------------------------------------
FindPlayerStatRow:
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov edi, ebx
        mov eax, ecx
        mov ebx, dword [esi]
        mov dword [byte ebp-04h], edi
        mov dword [byte ebp-08h], ebx
        xor ebx, ebx
        jmp short .3
.1:
        mov ecx, dword [edx]
        cmp ecx, dword [byte ebp-08h]
        jne short .2
        mov edx, ebx
        jmp short .4
.2:
        add edx, byte 4
        inc ebx
.3:
        cmp ebx, dword [byte ebp-04h]
        jl short .1
        mov edx, 3E7h
.4:
        cmp edx, 3E7h
        jne short .5
        xor edx, edx
        call SetScrollBarPos
        mov dword [esi], 3E7h
        leave
        pop edi
        pop esi
        ret
.5:
        cmp edx, byte 0Ch
        jge short .6
        xor edx, edx
        jmp short .8
.6:
        sub edi, byte 0Ch
        cmp edx, edi
        jle short .7
        mov edx, edi
        jmp short .8
.7:
        sub edx, byte 4
.8:
        call SetScrollBarPos
        leave
        pop edi
        pop esi
        ret
ExportPlayerStatsJumpTable:                     ; jump table for the switch cases of ExportPlayerStats
        dd ExportPlayerStats_146
        dd ExportPlayerStats_171
        dd ExportPlayerStats_178
        dd ExportPlayerStats_17F
;-----------------------------------------------------------------------------
; ExportPlayerStats                            8F5B3  96 PC, medium confidence
; Asks a file name and writes the player stats as text (fopen "wt", fprintf)
;-----------------------------------------------------------------------------
ExportPlayerStats:
        push esi
        push edi
        enter 50h, 0
        push eax
        push edx
        push ebx
        mov esi, ecx
        mov ecx, 14h
        lea edi, [byte ebp-050h]
        xor eax, eax
        rep stosb
        lea eax, [byte ebp-050h]
        push eax
        push dword 0F0h
        mov ebx, TitleTextStyle
        push dword 140h
        mov eax, 0D3h
        mov ecx, 8
        call GetLangText
        mov edx, eax
        xor eax, eax
        call EditText
        test eax, eax
        je near ExportPlayerStats_17F.65
        lea eax, [byte ebp-050h]
        call strlen_
        test eax, eax
        je near ExportPlayerStats_17F.65
        lea eax, [byte ebp-050h]
        call CheckExportName
        test eax, eax
        jne near ExportPlayerStats_17F.65
        push dword [byte ebp-058h]
        mov eax, 34h
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, TitleTextStyle
        call GetLangText
        call ShowProgressBox
        mov edx, str_Wt3
        lea eax, [byte ebp-050h]
        call fopen_
        mov ebx, eax
        mov ecx, eax
        cmp dword [byte ebp+014h], byte 64h
        jne short .1
        mov eax, 21Ch
        call GetLangText
        push eax
        push ebx
        call fprintf_
        add esp, byte 8
        push str_Punct_ExportPlayerStats
        jmp short .2
.1:
        cmp dword [byte ebp+014h], 3E8h
        jge short .3
        mov eax, 0D4h
        call GetLangText
        push eax
.2:
        push ebx
        call fprintf_
        add esp, byte 8
.3:
        cmp dword [byte ebp-05Ch], byte 63h
        jne short .4
        mov eax, 0F4h
        jmp short .5
.4:
        imul eax, dword [byte ebp-05Ch], byte 63h
        mov edx, dword [statsfromleague]
        add eax, edx
        add eax, byte 5
        push eax
        push ecx
        call fprintf_
        add esp, byte 8
        mov eax, 0F5h
.5:
        call GetLangText
        push eax
        push ecx
        call fprintf_
        add esp, byte 8
        cmp dword [byte ebp+010h], byte 0
        je short .6
        mov eax, 0F6h
        jmp short .7
.6:
        mov eax, 0F7h
.7:
        call GetLangText
        push eax
        push ecx
        call fprintf_
        add esp, byte 8
        cmp esi, byte 3
        ja near ExportPlayerStats_17F.11
        jmp dword [nosplit cs:esi*4+ExportPlayerStatsJumpTable]
ExportPlayerStats_146:
        mov eax, 0F8h
        call GetLangText
        push eax
        push ecx
        call fprintf_
        add esp, byte 8
        cmp dword [PlayerStatsGoalies], byte 0
        je short .9
.8:
        mov eax, 0F9h
        jmp short ExportPlayerStats_17F.10
.9:
        mov eax, 0FAh
        jmp short ExportPlayerStats_17F.10
ExportPlayerStats_171:
        mov eax, 0FBh
        jmp short ExportPlayerStats_17F.10
ExportPlayerStats_178:
        mov eax, 0FCh
        jmp short ExportPlayerStats_17F.10
ExportPlayerStats_17F:
        mov eax, 0FDh
        call GetLangText
        push eax
        push ecx
        call fprintf_
        add esp, byte 8
        cmp dword [PlayerStatsGoalies], byte 0
        jne short ExportPlayerStats_146.8
        mov eax, 0FAh
.10:
        call GetLangText
        push eax
        push ecx
        call fprintf_
        add esp, byte 8
.11:
        mov eax, dword [PlayerStatsMode]
        shl eax, 2
        cmp dword [PlayerStatsGoalies], byte 0
        je short .12
        mov eax, dword [dword eax+GoalieColTextIds]
        jmp short .13
.12:
        mov eax, dword [dword eax+SkaterColTextIds]
.13:
        call GetLangText
        push eax
        mov eax, 0FEh
        call GetLangText
        push eax
        push ecx
        call fprintf_
        add esp, byte 0Ch
        mov eax, 0FFh
        call GetLangText
        push eax
        push ecx
        call fprintf_
        add esp, byte 8
        cmp dword [PlayerStatsGoalies], byte 0
        je short .17
        xor ebx, ebx
.14:
        mov eax, dword [dword ebx+GoalieColTextIds]
        call GetLangText
        push eax
        push ecx
        mov edx, ebx
        xor esi, esi
        jmp short .16
.15:
        push str_Space
        push ecx
        inc esi
.16:
        call fprintf_
        add esp, byte 8
        mov eax, dword [dword edx+GoalieColTextIds]
        mov edi, 0Ah
        call GetLangText
        call strlen_
        sub edi, eax
        cmp esi, edi
        jbe short .15
        add ebx, byte 4
        cmp ebx, byte 2Ch
        je short .21
        jmp short .14
.17:
        xor ebx, ebx
.18:
        mov eax, dword [dword ebx+SkaterColTextIds]
        call GetLangText
        push eax
        push str_S3
        push ecx
        mov esi, ebx
        xor edx, edx
        call fprintf_
        add esp, byte 0Ch
        jmp short .20
.19:
        push str_Space
        push ecx
        inc edx
        call fprintf_
        add esp, byte 8
.20:
        mov eax, dword [dword esi+SkaterColTextIds]
        mov edi, 0Ah
        call GetLangText
        call strlen_
        sub edi, eax
        cmp edx, edi
        jbe short .19
        add ebx, byte 4
        cmp ebx, byte 30h
        jne short .18
.21:
        push str_Punct_ExportPlayerStats
        push ecx
        mov dword [byte ebp-010h], 0
        mov ebx, dword [byte ebp-054h]
        jmp near .63
.22:
        call UpdateProgressBox
        call SoundIdle
        mov eax, dword [byte ebp-010h]
        inc eax
        push eax
        push str_D10
        lea eax, [byte ebp-03Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-03Ch]
        push eax
        push ecx
        xor edx, edx
        jmp short .24
.23:
        push str_Space
        push ecx
        inc edx
.24:
        call fprintf_
        add esp, byte 8
        lea eax, [byte ebp-03Ch]
        mov esi, 6
        call strlen_
        sub esi, eax
        cmp edx, esi
        jb short .23
        mov eax, dword [ebx]
        mov eax, dword [nosplit eax*4+PlayerRecPtrs]
        movsx eax, byte [eax]
        push dword [nosplit eax*4+LogoNames]
        push ecx
        call fprintf_
        mov eax, dword [ebx]
        mov eax, dword [nosplit eax*4+PlayerRecPtrs]
        movsx eax, byte [eax]
        add esp, byte 8
        mov eax, dword [nosplit eax*4+LogoNames]
        call strlen_
        cmp eax, byte 2
        jne short .25
        push str_FiveSpaces
        jmp short .26
.25:
        push str_FourSpaces
.26:
        push ecx
        call fprintf_
        add esp, byte 8
        test byte [optflags], 0Ch
        jne short .27
        mov edx, dword [RosterFirstNamePtrs]
        mov eax, dword [ebx]
        mov eax, dword [edx+eax*4]
        movzx eax, byte [eax]
        push eax
        mov eax, dword [ebx]
        movsx eax, byte [dword eax+PlayerPosCodes]
        jmp short .33
.27:
        mov eax, dword [ebx]
        mov al, byte [dword eax+PlayerPosCodes]
        cmp al, 44h
        jb short .28
        jbe short .29
        cmp al, 47h
        je short .31
        jmp short .32
.28:
        cmp al, 43h
        je short .30
        jmp short .32
.29:
        mov al, 41h
        jmp short .32
.30:
        mov al, 4Dh
        jmp short .32
.31:
        mov al, 54h
.32:
        mov edx, dword [RosterFirstNamePtrs]
        mov esi, dword [ebx]
        mov esi, dword [edx+esi*4]
        movzx edx, byte [esi]
        push edx
        movsx eax, al
.33:
        push eax
        push str_CD
        lea eax, [byte ebp-03Ch]
        push eax
        call sprintf_
        add esp, byte 10h
        lea eax, [byte ebp-03Ch]
        push eax
        push str_S3
        push ecx
        xor edx, edx
        call fprintf_
        add esp, byte 0Ch
        jmp short .35
.34:
        push str_Space
        push ecx
        inc edx
        call fprintf_
        add esp, byte 8
.35:
        lea eax, [byte ebp-03Ch]
        mov esi, 7
        call strlen_
        sub esi, eax
        cmp edx, esi
        jb short .34
        mov edx, dword [RosterProfilePtrs]
        mov eax, dword [ebx]
        mov eax, dword [edx+eax*4]
        mov esi, 11h
        call strlen_
        mov edx, dword [RosterLastNamePtrs]
        sub esi, eax
        mov eax, dword [ebx]
        mov eax, dword [edx+eax*4]
        call strlen_
        inc eax
        cmp esi, eax
        jbe short .36
        mov edx, dword [RosterLastNamePtrs]
        mov eax, dword [ebx]
        mov edx, dword [edx+eax*4]
        lea eax, [byte ebp-03Ch]
        call strcpy_
        jmp short .37
.36:
        mov eax, dword [RosterLastNamePtrs]
        mov edx, dword [ebx]
        mov eax, dword [eax+edx*4]
        mov al, byte [eax]
        mov byte [byte ebp-03Bh], 2Eh
        mov byte [byte ebp-03Ah], 0
        mov byte [byte ebp-03Ch], al
.37:
        mov edx, str_Space
        lea eax, [byte ebp-03Ch]
        call strcat_
        mov eax, dword [RosterProfilePtrs]
        mov edx, dword [ebx]
        mov edx, dword [eax+edx*4]
        lea eax, [byte ebp-03Ch]
        call strcat_
        lea eax, [byte ebp-03Ch]
        push eax
        push ecx
        xor esi, esi
        jmp short .39
.38:
        push str_Space
        push ecx
        inc esi
.39:
        call fprintf_
        add esp, byte 8
        lea eax, [byte ebp-03Ch]
        mov edx, 18h
        call strlen_
        sub edx, eax
        cmp esi, edx
        jb short .38
        mov dword [byte ebp-014h], 0
        mov esi, dword [byte ebp-010h]
        mov dword [byte ebp-018h], ebx
        shl esi, 2
        xor edi, edi
        add esi, dword [byte ebp-054h]
.40:
        cmp dword [byte ebp-014h], byte 1
        jne short .42
        test byte [optflags], 0Ch
        jne short .42
        mov eax, dword [byte ebp-018h]
        mov eax, dword [eax]
        shl eax, 2
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [dword edi+PlayerHeightPtrs]
        add eax, dword [byte ebp-01Ch]
        mov eax, dword [eax]
        movzx eax, byte [eax]
        push eax
.41:
        push str_D10
        lea eax, [byte ebp-03Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near .46
.42:
        cmp dword [byte ebp-014h], byte 1
        jne short .43
        mov eax, dword [esi]
        mov edx, dword [PlayerWeightPtrs]
        shl eax, 2
        add eax, edx
        mov eax, dword [eax]
        movzx ax, byte [eax]
        mov dword [byte ebp-04h], eax
        fild word [byte ebp-04h]
        fmul qword [F64_0p454545_ExportPlayerStats]
        call __CHP
        fistp dword [byte ebp-024h]
        push dword [byte ebp-024h]
        jmp short .41
.43:
        test byte [optflags], 0Ch
        jne short .44
        mov eax, dword [esi]
        mov edx, dword [dword edi+PlayerHeightPtrs]
        shl eax, 2
        add eax, edx
        mov eax, dword [eax]
        mov dword [byte ebp-08h], 0Ch
        movzx eax, byte [eax]
        mov dword [byte ebp-01Ch], eax
        cdq
        idiv dword [byte ebp-08h]
        mov dword [byte ebp-08h], 0Ch
        mov eax, dword [byte ebp-01Ch]
        push edx
        cdq
        idiv dword [byte ebp-08h]
        push eax
        push str_DD4
        jmp short .45
.44:
        mov eax, dword [esi]
        shl eax, 2
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [PlayerHeightPtrs]
        add eax, dword [byte ebp-01Ch]
        mov eax, dword [eax]
        movzx ax, byte [eax]
        mov dword [byte ebp-04h], eax
        fild word [byte ebp-04h]
        fmul qword [F64_2p54_ExportPlayerStats]
        call __CHP
        fistp dword [byte ebp-020h]
        mov eax, dword [byte ebp-020h]
        mov dword [byte ebp-08h], 64h
        cdq
        idiv dword [byte ebp-08h]
        mov dword [byte ebp-08h], 64h
        mov eax, dword [byte ebp-020h]
        push edx
        cdq
        idiv dword [byte ebp-08h]
        push eax
        push str_DD5
.45:
        lea eax, [byte ebp-03Ch]
        push eax
        call sprintf_
        add esp, byte 10h
.46:
        lea eax, [byte ebp-03Ch]
        push eax
        push str_S3
        push ecx
        xor edx, edx
        call fprintf_
        add esp, byte 0Ch
        jmp short .48
.47:
        push str_Space
        push ecx
        inc edx
        call fprintf_
        add esp, byte 8
.48:
        lea eax, [byte ebp-03Ch]
        call strlen_
        mov dword [byte ebp-01Ch], eax
        mov eax, 0Ah
        sub eax, dword [byte ebp-01Ch]
        cmp edx, eax
        jbe short .47
        inc dword [byte ebp-014h]
        add edi, byte 4
        cmp dword [byte ebp-014h], byte 2
        jl near .40
        mov dword [byte ebp-0Ch], 0
        mov esi, ebx
        xor edi, edi
.49:
        cmp dword [PlayerStatsGoalies], byte 0
        jne near .56
        cmp dword [byte ebp-0Ch], byte 9
        jne short .52
        mov eax, dword [esi]
        mov edx, dword [dword edi+StatColumnPtrs]
.50:
        shl eax, 2
        add eax, edx
        mov eax, dword [eax]
        mov dword [byte ebp-08h], 0Ah
        movzx eax, word [eax]
        mov dword [byte ebp-01Ch], eax
        cdq
        idiv dword [byte ebp-08h]
        mov dword [byte ebp-08h], 0Ah
        mov eax, dword [byte ebp-01Ch]
        push edx
        cdq
        idiv dword [byte ebp-08h]
        push eax
        push str_DD3
.51:
        lea eax, [byte ebp-03Ch]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp near .60
.52:
        cmp dword [byte ebp-0Ch], byte 6
        jne short .53
        mov eax, dword [esi]
        mov edx, dword [StatColumnPtrs]
        shl eax, 2
        add eax, edx
        mov eax, dword [eax]
        movsx eax, word [eax]
        jmp near .59
.53:
        jle short .55
        mov eax, dword [esi]
        mov edx, dword [dword edi+StatColumnPtrs]
.54:
        shl eax, 2
        add eax, edx
        mov eax, dword [eax]
        movzx eax, word [eax]
        jmp near .59
.55:
        mov eax, dword [esi]
        mov edx, dword [dword edi+StatColumnPtrs+4]
        jmp short .54
.56:
        cmp dword [byte ebp-0Ch], byte 2
        jne short .57
        mov eax, dword [esi]
        shl eax, 2
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [dword edi+StatColumnPtrs+4]
        add eax, dword [byte ebp-01Ch]
        mov eax, dword [eax]
        movzx eax, word [eax]
        mov dword [byte ebp-08h], 64h
        mov dword [byte ebp-01Ch], eax
        cdq
        idiv dword [byte ebp-08h]
        mov dword [byte ebp-08h], 64h
        mov eax, dword [byte ebp-01Ch]
        push edx
        cdq
        idiv dword [byte ebp-08h]
        push eax
        push str_DD5
        jmp near .51
.57:
        cmp dword [byte ebp-0Ch], byte 0Ah
        jne short .58
        mov eax, dword [esi]
        mov edx, dword [dword edi+StatColumnPtrs+4]
        jmp near .50
.58:
        jge short .60
        mov eax, dword [esi]
        shl eax, 2
        mov dword [byte ebp-08h], eax
        mov eax, dword [dword edi+StatColumnPtrs+4]
        add eax, dword [byte ebp-08h]
        mov eax, dword [eax]
        movzx eax, word [eax]
.59:
        push eax
        push str_D10
        lea eax, [byte ebp-03Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
.60:
        lea eax, [byte ebp-03Ch]
        push eax
        push ecx
        xor edx, edx
        jmp short .62
.61:
        push str_Space
        push ecx
        inc edx
.62:
        call fprintf_
        add esp, byte 8
        lea eax, [byte ebp-03Ch]
        call strlen_
        mov dword [byte ebp-08h], eax
        mov eax, 0Ah
        sub eax, dword [byte ebp-08h]
        cmp edx, eax
        jbe short .61
        inc dword [byte ebp-0Ch]
        add edi, byte 4
        cmp dword [byte ebp-0Ch], byte 0Ah
        jl near .49
        push str_Punct_ExportPlayerStats
        push ecx
        inc dword [byte ebp-010h]
        add ebx, byte 4
.63:
        call fprintf_
        add esp, byte 8
        mov eax, dword [byte ebp-010h]
        cmp eax, dword [byte ebp-058h]
        jl near .22
        mov eax, ecx
        call fclose_
        xor eax, eax
        call GetLangText
        mov dword [byte ebp-028h], eax
        lea eax, [byte ebp-050h]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        jne short .64
        push byte 2
        push byte 1
        push dword 0F0h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp-028h]
        push eax
        mov eax, 22Eh
        mov edx, 1
        call GetLangText
        call MessageBox
.64:
        call HideProgressBox
.65:
        leave
        pop edi
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; BuildPlayerStatRows                             8FD8F  96 PC, low confidence
; Builds the player stat rows of a team from its roster (PlayerStatColFlags, 136h
; per team)
;-----------------------------------------------------------------------------
BuildPlayerStatRows:
        push ecx
        push esi
        push edi
        enter 68h, 0
        push eax
        push ebx
        mov dword [byte ebp-044h], PlayerStatColFlags
        mov dword [byte ebp-028h], edx
        xor esi, esi
        xor ecx, ecx
        mov dword [byte ebp-034h], esi
        mov dword [byte ebp-020h], esi
        imul ebx, dword 136h
.1:
        mov eax, dword [dword ebx+hmtmroster]
        add eax, dword [byte ebp-034h]
        movzx edx, byte [eax]
        cmp edx, byte 2
        je near .5
        cmp byte [eax], 0
        je near .5
        mov edx, dword [TeamDb]
        mov edi, dword [byte eax+027h]
        add edi, edx
        mov dword [byte ebp-03Ch], edi
        mov dword [dword ecx+PlayerRecPtrs], edi
        mov edi, dword [RosterLastNamePtrs]
        add eax, byte 7
        mov dword [ecx+edi], eax
        mov edx, dword [byte ebp-034h]
        mov eax, dword [dword ebx+hmtmroster]
        add edx, eax
        mov eax, dword [RosterProfilePtrs]
        add edx, byte 17h
        mov dword [ecx+eax], edx
        mov eax, dword [dword ebx+hmtmroster]
        add eax, dword [byte ebp-034h]
        mov edi, dword [RosterFirstNamePtrs]
        mov dl, byte [byte eax+06h]
        add eax, byte 5
        mov byte [dword esi+PlayerPosCodes], dl
        mov dword [ecx+edi], eax
        imul edi, esi, byte 16h
        mov edx, dword [byte ebp-03Ch]
        mov eax, dword [PlayerHeightPtrs]
        add edx, byte 38h
        mov dword [ecx+eax], edx
        mov edx, dword [byte ebp-03Ch]
        mov eax, dword [PlayerWeightPtrs]
        add edx, byte 39h
        mov dword [ecx+eax], edx
        mov edx, dword [byte ebp-020h]
        mov eax, dword [dword ebx+hmtmplstats]
        add edx, eax
        mov eax, dword [StatColumnPtrs]
        add edx, byte 6
        mov dword [ecx+eax], edx
        mov eax, dword [StatColumnPtrs+4]
        mov edx, dword [byte ebp-044h]
        mov dword [ecx+eax], edx
        mov edx, dword [byte ebp-020h]
        mov eax, dword [dword ebx+hmtmplstats]
        add edx, eax
        mov eax, dword [StatColumnPtrs+8]
        mov dword [ecx+eax], edx
        mov edx, dword [byte ebp-020h]
        mov eax, dword [dword ebx+hmtmplstats]
        add edx, eax
        mov eax, dword [StatColumnPtrs+0Ch]
        inc edx
        inc edx
        mov dword [ecx+eax], edx
        mov edx, dword [byte ebp-044h]
        mov eax, dword [StatColumnPtrs+10h]
        inc edx
        inc edx
        mov dword [ecx+eax], edx
        mov edx, dword [byte ebp-020h]
        mov eax, dword [dword ebx+hmtmplstats]
        add edx, eax
        mov eax, dword [StatColumnPtrs+14h]
        add edx, byte 8
        mov dword [ecx+eax], edx
        mov edx, dword [byte ebp-020h]
        mov eax, dword [dword ebx+hmtmplstats]
        add edx, eax
        mov eax, dword [StatColumnPtrs+18h]
        add edx, byte 0Ah
        mov dword [ecx+eax], edx
        mov edx, dword [byte ebp-020h]
        mov eax, dword [dword ebx+hmtmplstats]
        add edx, eax
        mov eax, dword [StatColumnPtrs+1Ch]
        add edx, byte 4
        mov dword [ecx+eax], edx
        mov edx, dword [byte ebp-020h]
        mov eax, dword [dword ebx+hmtmplstats]
        add edx, eax
        mov eax, dword [StatColumnPtrs+20h]
        add edx, byte 0Eh
        mov dword [ecx+eax], edx
        mov eax, dword [StatColumnPtrs+24h]
        mov edx, dword [byte ebp-028h]
        mov dword [ecx+eax], edx
        mov eax, dword [StatColumnPtrs+28h]
        mov dword [ecx+eax], 0
        mov eax, dword [StatColumnPtrs+2Ch]
        mov dword [ecx+eax], 0
        mov eax, dword [dword ebx+hmtmplstats]
        add eax, dword [byte ebp-020h]
        mov word [dword edi+PlayerStatColFlags], 1
        mov dx, word [eax]
        mov dword [byte ebp-018h], edx
        mov dx, word [byte eax+02h]
        add dword [byte ebp-018h], edx
        mov edx, dword [byte ebp-018h]
        mov word [dword edi+PlayerStatColFlags+2], dx
        cmp word [byte eax+0Eh], byte 0
        je short .2
        movsx edi, word [eax]
        imul edi, dword 3E8h
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp-060h], eax
        mov eax, edi
        cdq
        idiv dword [byte ebp-060h]
        mov edx, dword [byte ebp-028h]
        mov word [edx], ax
        jmp short .3
.2:
        mov eax, dword [byte ebp-028h]
        mov word [eax], 0
.3:
        mov eax, dword [byte ebp-028h]
        movzx eax, word [eax]
        cmp eax, 3E8h
        jle short .4
        mov eax, dword [byte ebp-028h]
        mov word [eax], 3E8h
.4:
        mov eax, dword [byte ebp-03Ch]
        add dword [byte ebp-044h], byte 16h
        add dword [byte ebp-028h], byte 2
        movsx eax, byte [byte eax+03Ah]
        inc esi
        cmp eax, byte 59h
        sete al
        add ecx, byte 4
        mov byte [dword esi+PlayerRowTeam], al
.5:
        add dword [byte ebp-020h], byte 10h
        add dword [byte ebp-034h], byte 2Bh
        cmp dword [byte ebp-020h], 190h
        jne near .1
        imul ecx, dword [byte ebp-070h], dword 136h
        mov dword [byte ebp-024h], 0
        mov edi, esi
        cmp dword [byte ebp-070h], byte 0
        sete byte [byte ebp-08h]
        sete byte [byte ebp-010h]
        sete byte [byte ebp-0Ch]
        sete byte [byte ebp-014h]
        imul ebx, esi, byte 16h
        mov dword [byte ebp-030h], 433h
        mov dword [byte ebp-02Ch], 0
        mov eax, ebx
        mov dword [byte ebp-068h], ecx
        add eax, PlayerStatColFlags
        shl edi, 2
        mov dword [byte ebp-064h], eax
.6:
        mov edx, dword [byte ebp-030h]
        mov eax, dword [dword ecx+hmtmroster]
        add edx, eax
        movzx eax, byte [edx]
        mov dword [byte ebp-05Ch], edx
        cmp eax, byte 2
        je near .24
        cmp byte [edx], 0
        je near .24
        mov eax, dword [TeamDb]
        mov dword [byte ebp-060h], eax
        mov eax, edx
        mov edx, dword [byte ebp-060h]
        add edx, dword [byte eax+027h]
        mov dword [byte ebp-040h], edx
        mov dword [dword edi+PlayerRecPtrs], edx
        mov edx, dword [byte ebp-05Ch]
        mov eax, dword [RosterLastNamePtrs]
        add edx, byte 7
        mov dword [edi+eax], edx
        mov edx, dword [byte ebp-030h]
        mov eax, dword [dword ecx+hmtmroster]
        add edx, eax
        mov eax, dword [RosterProfilePtrs]
        add edx, byte 17h
        mov dword [edi+eax], edx
        mov edx, dword [byte ebp-030h]
        mov eax, dword [dword ecx+hmtmroster]
        add edx, eax
        mov al, byte [byte edx+06h]
        mov byte [dword esi+PlayerPosCodes], al
        mov eax, dword [RosterFirstNamePtrs]
        add edx, byte 5
        mov dword [edi+eax], edx
        mov edx, dword [byte ebp-040h]
        mov eax, dword [PlayerHeightPtrs]
        add edx, byte 38h
        mov dword [edi+eax], edx
        mov edx, dword [byte ebp-040h]
        mov eax, dword [PlayerWeightPtrs]
        add edx, byte 39h
        mov dword [edi+eax], edx
        mov eax, dword [StatColumnPtrs]
        mov dword [byte ebp-058h], 0
        mov dword [edi+eax], 0
        mov eax, dword [byte ebp-064h]
        mov dword [byte ebp-054h], edi
        mov dword [byte ebp-048h], eax
.7:
        mov eax, dword [byte ebp-058h]
        mov eax, dword [dword eax+StatColumnPtrs+4]
        mov edx, dword [byte ebp-048h]
        add eax, dword [byte ebp-054h]
        add dword [byte ebp-058h], byte 4
        add dword [byte ebp-048h], byte 2
        mov dword [eax], edx
        cmp dword [byte ebp-058h], byte 2Ch
        jne short .7
        mov eax, dword [dword ecx+hmtmglstats]
        add eax, dword [byte ebp-02Ch]
        cmp word [eax], byte 0
        setg byte [byte ebp-04h]
        movzx dx, byte [byte ebp-04h]
        mov word [dword ebx+PlayerStatColFlags], dx
        mov dword [byte ebp-01Ch], 3Ch
        movsx eax, word [eax]
        mov dword [byte ebp-050h], eax
        cdq
        idiv dword [byte ebp-01Ch]
        mov dword [byte ebp-01Ch], 3Ch
        mov eax, dword [byte ebp-050h]
        mov dword [byte ebp-060h], edx
        cdq
        idiv dword [byte ebp-01Ch]
        cmp dword [byte ebp-060h], byte 0
        je short .8
        inc eax
.8:
        mov word [dword ebx+PlayerStatColFlags+2], ax
        mov edx, dword [byte ebp-02Ch]
        mov eax, dword [dword ecx+hmtmglstats]
        add edx, eax
        mov dword [byte ebp-04Ch], edx
        cmp word [edx], byte 0
        jne short .9
        mov word [dword ebx+PlayerStatColFlags+4], 0
        jmp short .10
.9:
        movsx eax, word [byte edx+04h]
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 15h
        shr eax, 1Eh
        imul eax, dword [nosplit eax*4+SimStatWeights], dword 1770h
        mov edx, dword [byte ebp-01Ch]
        imul edx, eax
        mov eax, dword [byte ebp-04Ch]
        movsx eax, word [eax]
        mov dword [byte ebp-01Ch], eax
        mov eax, edx
        cdq
        idiv dword [byte ebp-01Ch]
        mov word [dword ebx+PlayerStatColFlags+4], ax
.10:
        cmp dword [byte ebp-070h], byte 0
        jne short .11
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        jmp short .12
.11:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
.12:
        shr eax, 1Bh
        imul eax, dword 31Bh
        mov edx, dword [statsplayoffs]
        add edx, eax
        mov dword [byte ebp-038h], edx
        movzx eax, byte [byte ebp-014h]
        imul eax, dword 136h
        mov dx, word [dword ecx+hmscore]
        cmp dx, word [dword eax+hmscore]
        jle short .13
        movsx eax, byte [dword ecx+HmGoalieSwapped]
        add eax, dword [byte ebp-038h]
        movzx eax, byte [dword eax+0107h]
        sub eax, byte 19h
        cmp eax, dword [byte ebp-024h]
        jne short .13
        mov word [dword ebx+PlayerStatColFlags+6], 1
        jmp short .14
.13:
        mov word [dword ebx+PlayerStatColFlags+6], 0
.14:
        movzx eax, byte [byte ebp-0Ch]
        imul eax, dword 136h
        mov dx, word [dword ecx+hmscore]
        cmp dx, word [dword eax+hmscore]
        jge short .15
        movsx eax, byte [dword ecx+HmGoalieSwapped]
        add eax, dword [byte ebp-038h]
        movzx eax, byte [dword eax+0107h]
        sub eax, byte 19h
        cmp eax, dword [byte ebp-024h]
        jne short .15
        mov word [dword ebx+PlayerStatColFlags+8], 1
        jmp short .16
.15:
        mov word [dword ebx+PlayerStatColFlags+8], 0
.16:
        movzx eax, byte [byte ebp-010h]
        imul eax, dword 136h
        mov dx, word [dword ecx+hmscore]
        mov word [dword ebx+PlayerStatColFlags+0Ah], 0
        cmp dx, word [dword eax+hmscore]
        jne short .17
        movsx eax, byte [dword ecx+HmGoalieSwapped]
        add eax, dword [byte ebp-038h]
        movzx eax, byte [dword eax+0107h]
        sub eax, byte 19h
        cmp eax, dword [byte ebp-024h]
        jne short .17
        mov word [dword ebx+PlayerStatColFlags+0Ah], 1
.17:
        mov eax, dword [dword ecx+hmtmglstats]
        add eax, dword [byte ebp-02Ch]
        cmp word [eax], byte 0
        jne short .18
        mov word [dword ebx+PlayerStatColFlags+0Ch], 0
        jmp short .19
.18:
        mov eax, dword [byte ebp-068h]
        movsx ax, byte [dword eax+HmStarterGoalieMarks]
        mov word [dword ebx+PlayerStatColFlags+0Ch], ax
.19:
        movzx eax, byte [byte ebp-08h]
        imul eax, dword 136h
        mov word [dword ebx+PlayerStatColFlags+0Eh], 0
        cmp word [dword eax+hmscore], byte 0
        jne short .20
        movsx eax, byte [dword ecx+HmGoalieSwapped]
        add eax, dword [byte ebp-038h]
        movzx eax, byte [dword eax+0107h]
        sub eax, byte 19h
        cmp eax, dword [byte ebp-024h]
        jne short .20
        mov word [dword ebx+PlayerStatColFlags+0Eh], 1
.20:
        mov eax, dword [dword ecx+hmtmglstats]
        add eax, dword [byte ebp-02Ch]
        mov dx, word [byte eax+04h]
        mov word [dword ebx+PlayerStatColFlags+10h], dx
        mov dx, word [byte eax+02h]
        mov word [dword ebx+PlayerStatColFlags+12h], dx
        mov dx, word [byte eax+04h]
        cmp dx, word [byte eax+02h]
        jg short .21
        cmp word [byte eax+02h], byte 0
        je short .21
        movsx edx, dx
        imul edx, dword 3E8h
        movsx eax, word [byte eax+02h]
        mov dword [byte ebp-01Ch], eax
        mov eax, edx
        cdq
        idiv dword [byte ebp-01Ch]
        mov edx, 3E8h
        sub edx, eax
        mov word [dword ebx+PlayerStatColFlags+14h], dx
        jmp short .22
.21:
        mov word [dword ebx+PlayerStatColFlags+14h], 0
.22:
        movzx eax, word [dword ebx+PlayerStatColFlags+14h]
        cmp eax, 3E8h
        jle short .23
        mov word [dword ebx+PlayerStatColFlags+14h], 3E8h
.23:
        mov eax, dword [byte ebp-040h]
        add dword [byte ebp-064h], byte 16h
        add edi, byte 4
        movsx eax, byte [byte eax+03Ah]
        inc esi
        cmp eax, byte 59h
        sete al
        add ebx, byte 16h
        mov byte [dword esi+PlayerRowTeam], al
.24:
        add dword [byte ebp-030h], byte 2Bh
        inc dword [byte ebp-068h]
        inc dword [byte ebp-024h]
        add dword [byte ebp-02Ch], byte 6
        cmp dword [byte ebp-024h], byte 3
        jl near .6
        mov eax, dword [byte ebp-06Ch]
        xor ebx, ebx
        jmp short .26
.25:
        mov dword [eax], ebx
        add eax, byte 4
        inc ebx
.26:
        cmp ebx, esi
        jl short .25
        mov ecx, ComparePlayerStatRows
        mov ebx, 4
        mov eax, dword [byte ebp-06Ch]
        jmp near FillSkaterStatRows_387
