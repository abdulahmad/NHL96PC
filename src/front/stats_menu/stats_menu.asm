; The stats menus: season and conference picks, leaders, stat tables, text export (96 PC; still being named).
bits 32
%include "hockey.inc"
section s_884BD progbits alloc exec nowrite align=1
extern abs_, TitleTextStyle, SeasonUserTeam, SaveFileName, DrawColorText, DrawColorTextCentred, DrawScrollBar, statsfromleague
extern statsplayoffs, TeamDivisions, TeamConferenceIds, TeamStatTextIds, TeamStatsPlayoffs, StatsMenuItems, StatsMenuChoice, RosterDbPtrs
extern RosterPlayerIds, TeamStatsBitmap, StatsButtonArt, TeamStatsTabArt, TeamStatsTabLit
extern TeamStatsButtonPos

extern TeamStatsButtonBmps
extern TeamStatsHeaderArt, TeamStatRows
extern TeamStatRowValues
extern TeamStatColumns

extern TeamStatSortColumn, PlayerStatsTabArt, PlayerStatsTabLit, PlayerHeightPtrs, RatingsPlayerId, PlayerStatsRowCount
extern EditLinesBuffer, RosterFirstNamePtrs, RosterJerseyPtrs, StatColumnPtrs, RosterPlayerPtrs, RosterProfilePtrs, RosterLastNamePtrs
extern EditText, FadeOut, FadePalette, fclose_, FillBox, fopen_, fprintf_, FreeScrollBar
extern GetLangText, HideProgressBox, InitHScrollBar, InitMenuItems, InitVScrollBar, LoadModemStats, LoadPackedFile, LoadPlayoffStats
extern LoadSeasonStats, MessageBox, OpenScreen, PlayerStatsScreen, PlayMovieFile, PutBlock, qsort_, F64_0p1
extern RunMenu, ScrollBarDown, ScrollBarToMouse, ScrollBarUp, SetDrawBitmap, SetScreenColors, SetScrollBarPos, SetTextColors
extern SetTickDeadline, ShowProgressBox, SlideInSideBar, sprintf_, str_000, str_03d, str_10002, str_ALL
extern str_AR002, str_AR012, str_AR102, str_AR112, str_AR20, str_AR21, str_AR30, str_AR31
extern str_ATL, str_Bkgd15, str_CEN, str_CON, str_CON0, str_D42, str_D5, str_D7
extern str_D8, str_dbgD, str_DD2, str_DDD4, str_DEF, str_DIV, str_EAS, str_FOR
extern str_GOL, str_HBAL, str_HED1, str_HED2, str_HORZ, str_LEA, str_LGR0, str_LGR1
extern str_LGR2, str_Menupicks, str_NOR, str_PAC, str_Pal20, str_PLR, str_PLY2, str_PLY3
extern str_PRN0, str_PRN1, str_PRN2, str_ROK, str_S2, str_SavetimeOut, str_SD2, str_SEA0
extern str_SEA2, str_SEA3, str_Space2, str_spDDDD, str_TEA0, str_TEA1, str_TEA2, str_TXT
extern str_VBAL, str_VERT, str_WES, str_WES0, str_Wt2, strcat_, strcmp_, strlen_
extern PlayerCardScreen, PlayerRatingsScreen, AllocMemBlock, FreeMemBlock, CreateBitmap, TintRows, TintRect, FreeBitmap
extern DosFileInfo, DrawArtOpaqueAtOwnPos, DrawArtKeyed, SetScreenTarget, FillRectColor, FindShape, TickDeadlinePassed, str_Punct_ExportTeamStats
extern str_DashExport, str_Punct_DumpSaveTimes, UpdateProgressBox, CdSpeedTested, TeamMovieTextIds, TeamHomePoints, TeamPowerPlayPct, TeamPenaltyKillPct
extern TeamPoints, TeamRoadPoints, TeamPointsPct
global StatsMenuItemMap, jpt_884F1, RunStatsMenu, RunStatsMenu_25, RunStatsMenu_104, RunStatsMenu_13E, RunStatsMenu_169, RunStatsMenu_183
global RunStatsMenu_1AD, PlayTeamMovie, GetTeamMovieText, str_U, TeamStatsColumnLabels, TeamStatsNavLinks, CompareTeamStatRows, AnimateTeamStatsButton
global AnimateTeamStatsButtons, jpt_88DE1, jpt_88DF9, TeamStatsScreen, TeamStatsScreen_8FE, TeamStatsScreen_916, TeamStatsScreen_92E, TeamStatsScreen_946
global TeamStatsScreen_957, TeamStatsScreen_96F, TeamStatsScreen_132A, TeamStatsScreen_134F, TeamStatsScreen_136C, TeamStatsScreen_1380, DrawTeamStatsTable, jpt_8A844
global CopyTeamStatName, CopyTeamStatName_82, CopyTeamStatName_89, CopyTeamStatName_90, CopyTeamStatName_97, FindTeamStatRow, jpt_8A9A0, ExportTeamStats
global ExportTeamStats_117, ExportTeamStats_11E, ExportTeamStats_125, ExportTeamStats_12C, BuildTeamStatTables, BuildTeamStatTables_265, BuildTeamStatTables_266, DumpSaveTimes
global CheckExportName, PlayerStatsNavLinks, str_U_PlayerStatsScreen, PlayerStatsColumnLabels
StatsMenuItemMap:
        db 00h,00h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,01h,00h,0FFh,0FFh,02h,00h,0FFh,0FFh
        db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,03h,00h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
        db 04h,00h,05h,00h,06h,00h,07h,00h,08h,00h,0FFh,0FFh,0FFh,0FFh,09h,00h
        db 0FFh,0FFh,0FFh,0FFh
jpt_884F1:
        dd RunStatsMenu_25
        dd RunStatsMenu_13E
        dd RunStatsMenu_104
        dd RunStatsMenu_169
        dd RunStatsMenu_183
        dd RunStatsMenu_1AD
;-----------------------------------------------------------------------------
; RunStatsMenu                                 88509  96 PC, medium confidence
; From the main menu, the season menus and the play-offs: runs the team stats
; and player stats screens, frees their tables after
;-----------------------------------------------------------------------------
RunStatsMenu:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 3Ch, 0
        push eax
        mov ecx, 0Dh
        lea edi, [byte ebp-03Ch]
        mov esi, StatsMenuItemMap
        mov dword [byte ebp-04h], 0A410h
        rep movsd
        jmp near RunStatsMenu_104.6
RunStatsMenu_25:
        cmp dword [RosterDbPtrs], byte 0
        je near .3
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
.1:
        push dword [dword esi+StatColumnPtrs+4]
        call FreeMemBlock
        add esi, byte 4
        add esp, byte 4
        cmp esi, byte 2Ch
        jne short .1
        xor esi, esi
.2:
        push dword [dword esi+PlayerHeightPtrs]
        call FreeMemBlock
        add esi, byte 4
        add esp, byte 4
        cmp esi, byte 8
        jne short .2
        push dword [EditLinesBuffer]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterJerseyPtrs]
        call FreeMemBlock
        add esp, byte 4
        push dword [RosterPlayerIds]
        call FreeMemBlock
        mov dword [RosterPlayerIds], 0
        mov dword [RosterDbPtrs], 0
        add esp, byte 4
.3:
        mov eax, dword [byte ebp-04h]
        mov dword [byte ebp-08h], eax
        mov eax, dword [byte ebp-040h]
        call TeamStatsScreen
        jmp short RunStatsMenu_104.5
RunStatsMenu_104:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-040h]
        mov dword [byte ebp-08h], eax
        mov eax, 63h
.4:
        call PlayerStatsScreen
.5:
        mov dword [byte ebp-04h], eax
.6:
        cmp dword [byte ebp-04h], byte 0
        je near RunStatsMenu_1AD.11
        mov esi, dword [byte ebp-04h]
        sub esi, 0A410h
        cmp esi, byte 5
        ja near RunStatsMenu_1AD.10
        jmp dword [nosplit cs:esi*4+jpt_884F1]
RunStatsMenu_13E:
        mov ecx, dword [byte ebp-040h]
        mov edx, RatingsPlayerId
        mov ebx, dword [PlayerStatsRowCount]
        mov eax, dword [RosterPlayerIds]
        call PlayerCardScreen
        cmp eax, 0A413h
        je short RunStatsMenu_104.5
        cmp eax, 0A415h
        je short RunStatsMenu_104.5
.7:
        mov eax, dword [byte ebp-08h]
        jmp short RunStatsMenu_104.5
RunStatsMenu_169:
        mov edx, dword [byte ebp-040h]
        mov eax, dword [PlayerStatsRowCount]
        xor ecx, ecx
        xor ebx, ebx
        mov dword [byte ebp-04h], 0A411h
        call PlayerRatingsScreen
        jmp short RunStatsMenu_104.6
RunStatsMenu_183:
        mov eax, dword [byte ebp-08h]
        movsx ebx, word [dword ebp+eax*2-014868h]
        cmp word [CdSpeedTested], byte 0
        je short .8
        mov eax, 0CCh
        jmp short .9
.8:
        mov eax, 0C2h
.9:
        add eax, ebx
        call PlayMovieFile
        jmp short RunStatsMenu_13E.7
RunStatsMenu_1AD:
        mov eax, dword [RatingsPlayerId]
        mov dword [byte ebp-04h], 0A411h
        call PlayTeamMovie
        jmp near RunStatsMenu_104.6
.10:
        cmp dword [byte ebp-04h], 0A416h
        jl near RunStatsMenu_104.6
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-040h]
        mov dword [byte ebp-08h], eax
        sub eax, 0A416h
        jmp near RunStatsMenu_104.4
.11:
        mov eax, dword [byte ebp-04h]
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PlayTeamMovie                                886F6  96 PC, medium confidence
; (team): plays the team's movie when it has one (TeamMovieTextIds, 20 teams; data
; D6h or EAh by CD speed)
;-----------------------------------------------------------------------------
PlayTeamMovie:
        push ebx
        push edx
        mov ebx, eax
        xor eax, eax
.1:
        cmp eax, byte 14h
        jge short .5
        movsx edx, word [nosplit eax*2+TeamMovieTextIds]
        cmp edx, ebx
        jne short .4
        cmp word [CdSpeedTested], byte 0
        je short .2
        mov edx, 0EAh
        jmp short .3
.2:
        mov edx, 0D6h
.3:
        add eax, edx
        call PlayMovieFile
        mov eax, 14h
.4:
        inc eax
        jmp short .1
.5:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GetTeamMovieText                                88735  96 PC, low confidence
; (team): the text (248h + index) of a team in the team movie list
; (TeamMovieTextIds)
;-----------------------------------------------------------------------------
GetTeamMovieText:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        xor eax, eax
.1:
        cmp eax, byte 14h
        jge short .3
        movsx edx, word [nosplit eax*2+TeamMovieTextIds]
        cmp edx, ebx
        jne short .2
        add eax, 248h
        call GetLangText
        mov ecx, eax
        mov eax, 14h
.2:
        inc eax
        jmp short .1
.3:
        mov eax, ecx
        pop edx
        pop ecx
        pop ebx
        ret
str_U:
        db 075h,00h,00h,00h,067h,00h,00h,00h,0F7h,00h,00h,00h,067h,00h,00h,00h
        db 0F7h,00h,00h,00h,082h,00h,00h,00h,075h,00h,00h,00h,082h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0FCh,00h,00h,00h,067h,00h,00h,00h,07Eh,01h,00h,00h,067h,00h,00h,00h
        db 07Eh,01h,00h,00h,082h,00h,00h,00h,0FCh,00h,00h,00h,082h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 083h,01h,00h,00h,067h,00h,00h,00h,05h,02h,00h,00h,067h,00h,00h,00h
        db 05h,02h,00h,00h,083h,00h,00h,00h,084h,01h,00h,00h,083h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 064h,00h,00h,00h,0CAh,01h,00h,00h,069h,00h,00h,00h,0BFh,01h,00h,00h
        db 0D6h,00h,00h,00h,0BFh,01h,00h,00h,0E0h,00h,00h,00h,0CAh,01h,00h,00h
        db 0D8h,00h,00h,00h,0D3h,01h,00h,00h,06Eh,00h,00h,00h,0D5h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0F4h,00h,00h,00h,0C8h,01h,00h,00h,0F9h,00h,00h,00h,0C0h,01h,00h,00h
        db 077h,01h,00h,00h,0BFh,01h,00h,00h,081h,01h,00h,00h,0CAh,01h,00h,00h
        db 07Ah,01h,00h,00h,0D3h,01h,00h,00h,0F9h,00h,00h,00h,0D3h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 092h,01h,00h,00h,0C9h,01h,00h,00h,096h,01h,00h,00h,0BFh,01h,00h,00h
        db 014h,02h,00h,00h,0C0h,01h,00h,00h,01Fh,02h,00h,00h,0C8h,01h,00h,00h
        db 017h,02h,00h,00h,0D3h,01h,00h,00h,097h,01h,00h,00h,0D3h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
TeamStatsColumnLabels:
        dd str_000
        dd str_SEA2
        dd str_PLY2
        dd str_LEA
        dd str_DIV
        dd str_CON
        dd str_WES
        dd str_EAS
        dd str_PAC
        dd str_NOR
        dd str_CEN
        dd str_ATL
TeamStatsNavLinks:
        db 03h,06h,00h,0Eh,01h,00h,01h,05h,02h,00h,02h,05h,03h,024h,00h,04h
        db 04h,01Fh,03h,05h,05h,021h,04h,0Ah,0Dh,06h,00h,07h,067h,07h,06h,08h
        db 010h,08h,07h,0Fh,09h,0Bh,023h,09h,0Ah,0Bh,023h,0Ah,09h,0Bh,065h,0Bh
        db 09h,010h,065h,0Ch,01Eh,06h,00h,010h,01Eh,06h,00h,067h,06Ah,0Fh,01Eh,0Bh
        db 06Ah,08h,0Eh,0Bh,024h,012h,00h,025h,011h,013h,00h,02Ah,012h,014h,00h,02Fh
        db 013h,015h,00h,034h,014h,016h,00h,039h,015h,017h,00h,03Eh,016h,018h,00h,043h
        db 017h,019h,00h,048h,018h,01Ah,00h,04Dh,019h,01Bh,00h,052h,01Ah,01Ch,00h,057h
        db 01Bh,01Dh,00h,05Ch,01Ch,01Eh,00h,061h,01Dh,0Eh,0Dh,066h,04h,025h,024h,020h
        db 04h,026h,01Fh,021h,05h,027h,020h,022h,05h,028h,021h,023h,05h,029h,022h,09h
        db 03h,011h,00h,01Fh,01Fh,02Ah,011h,026h,020h,02Bh,025h,027h,021h,02Ch,026h,028h
        db 022h,02Dh,027h,029h,023h,02Eh,028h,09h,025h,02Fh,012h,02Bh,026h,030h,02Ah,02Ch
        db 027h,031h,02Bh,02Dh,028h,032h,02Ch,02Eh,029h,033h,02Dh,09h,02Ah,034h,013h,030h
        db 02Bh,035h,02Fh,031h,02Ch,036h,030h,032h,02Dh,037h,031h,033h,02Eh,038h,032h,09h
        db 02Fh,039h,014h,035h,030h,03Ah,034h,036h,031h,03Bh,035h,037h,032h,03Ch,036h,038h
        db 033h,03Dh,037h,09h,034h,03Eh,015h,03Ah,035h,03Fh,039h,03Bh,036h,040h,03Ah,03Ch
        db 037h,041h,03Bh,03Dh,038h,042h,03Ch,09h,039h,043h,016h,03Fh,03Ah,044h,03Eh,040h
        db 03Bh,045h,03Fh,041h,03Ch,046h,040h,042h,03Dh,047h,041h,09h,03Eh,048h,017h,044h
        db 03Fh,049h,043h,045h,040h,04Ah,044h,046h,041h,04Bh,045h,047h,042h,04Ch,046h,09h
        db 043h,04Dh,018h,049h,044h,04Eh,048h,04Ah,045h,04Fh,049h,04Bh,046h,050h,04Ah,04Ch
        db 047h,051h,04Bh,0Bh,048h,052h,019h,04Eh,049h,053h,04Dh,04Fh,04Ah,054h,04Eh,050h
        db 04Bh,055h,04Fh,051h,04Ch,056h,050h,0Bh,04Dh,057h,01Ah,053h,04Eh,058h,052h,054h
        db 04Fh,059h,053h,055h,050h,05Ah,054h,056h,051h,05Bh,055h,0Bh,052h,05Ch,01Bh,058h
        db 053h,05Dh,057h,059h,054h,05Eh,058h,05Ah,055h,05Fh,059h,05Bh,056h,060h,05Ah,0Bh
        db 057h,061h,01Ch,05Dh,058h,062h,05Ch,05Eh,059h,063h,05Dh,05Fh,05Ah,064h,05Eh,060h
        db 05Bh,065h,05Fh,0Bh,05Ch,066h,01Dh,062h,05Dh,067h,061h,063h,05Eh,068h,062h,064h
        db 05Fh,069h,063h,065h,060h,06Ah,064h,0Bh,061h,07h,01Eh,067h,062h,07h,066h,068h
        db 063h,08h,067h,069h,064h,010h,068h,06Ah,065h,010h,069h,0Bh,053h,0Fh,0BEh,00h
        db 06Bh,0D8h,063h,0Fh,0BEh,012h,06Bh,0D2h,063h
        mov eax, dword [statsfromleague]
        add edx, eax
        add ebx, eax
        add edx, byte 5
        lea eax, [byte ebx+05h]
        call strcmp_
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompareTeamStatRows                             88AE6  96 PC, low confidence
; Qsort compare of two team stat rows by the sort column (TeamStatSortColumn)
;-----------------------------------------------------------------------------
CompareTeamStatRows:
        push ebx
        push ecx
        push esi
        cmp dword [TeamStatSortColumn], byte 4
        jge short .1
        movsx ebx, byte [edx]
        imul edx, ebx, byte 28h
        mov ecx, dword [TeamStatSortColumn]
        mov edx, dword [dword edx+ecx*4+TeamStatRowValues]
        movzx esi, byte [edx]
        movsx edx, byte [eax]
        imul eax, edx, byte 28h
        mov eax, dword [dword eax+ecx*4+TeamStatRowValues]
        movzx eax, byte [eax]
        sub esi, eax
        mov eax, esi
        jne short .2
        mov eax, edx
        sub eax, ebx
        pop esi
        pop ecx
        pop ebx
        ret
.1:
        movsx ecx, byte [edx]
        imul edx, ecx, byte 30h
        mov ebx, dword [TeamStatSortColumn]
        mov edx, dword [dword edx+ebx*4+TeamStatColumns]
        movzx esi, word [edx]
        movsx edx, byte [eax]
        imul eax, edx, byte 30h
        mov eax, dword [dword eax+ebx*4+TeamStatColumns]
        movzx eax, word [eax]
        sub esi, eax
        mov eax, esi
        jne short .2
        mov eax, edx
        sub eax, ecx
.2:
        pop esi
        pop ecx
        pop ebx
        ret
        push ebx
        mov ebx, dword [nosplit eax*8+TeamStatsTabArt]
        mov dword [byte edx+01Ah], ebx
        mov eax, dword [nosplit eax*8+TeamStatsTabLit]
        mov dword [byte edx+01Eh], eax
        pop ebx
        ret
;-----------------------------------------------------------------------------
; AnimateTeamStatsButton                          88B71  96 PC, low confidence
; Plays a button's frames (4 ticks each) on the team stats screen
;-----------------------------------------------------------------------------
AnimateTeamStatsButton:
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
        push dword [dword eax+TeamStatsHeaderArt]
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
        push dword [dword eax+StatsButtonArt]
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
        mov edx, dword [nosplit eax*8+TeamStatsTabArt]
        mov dword [byte esi+01Ah], edx
        mov eax, dword [nosplit eax*8+TeamStatsTabLit]
        mov dword [byte esi+01Eh], eax
        mov eax, dword [byte ebp-010h]
        mov dword [edi], eax
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; AnimateTeamStatsButtons                         88C21  96 PC, low confidence
; The same for a row of buttons
;-----------------------------------------------------------------------------
AnimateTeamStatsButtons:
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
        push dword [dword eax+TeamStatsHeaderArt]
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
        push dword [dword eax+TeamStatsHeaderArt]
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
        push dword [dword eax+TeamStatsHeaderArt]
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
        push dword [dword eax+StatsButtonArt]
        call PutBlock
        add esp, byte 0Ch
.7:
        cmp dword [byte ebp-08h], byte 0FFFFFFFFh
        je short .8
        push dword [byte edi+02Ah]
        mov eax, dword [byte ebp-014h]
        push dword [byte edi+026h]
        push dword [dword eax+StatsButtonArt]
        call PutBlock
        add esp, byte 0Ch
.8:
        cmp dword [byte ebp+018h], byte 0FFFFFFFFh
        je short .9
        mov eax, dword [byte ebp+020h]
        push dword [byte eax+02Ah]
        push dword [byte eax+026h]
        mov eax, dword [byte ebp-010h]
        push dword [dword eax+StatsButtonArt]
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
        mov edx, dword [nosplit eax*8+TeamStatsTabArt]
        mov dword [byte esi+01Ah], edx
        mov eax, dword [nosplit eax*8+TeamStatsTabLit]
        mov dword [byte esi+01Eh], eax
.11:
        cmp dword [byte ebp-08h], byte 0FFFFFFFFh
        je short .12
        mov eax, dword [byte ebp-08h]
        mov edx, dword [nosplit eax*8+TeamStatsTabArt]
        mov dword [byte edi+01Ah], edx
        mov eax, dword [nosplit eax*8+TeamStatsTabLit]
        mov edx, dword [byte ebp+010h]
        mov dword [byte edi+01Eh], eax
        mov eax, dword [byte ebp-08h]
        mov dword [edx], eax
.12:
        cmp dword [byte ebp+018h], byte 0FFFFFFFFh
        je short .13
        mov esi, dword [byte ebp+018h]
        mov edx, dword [byte ebp+020h]
        mov eax, dword [nosplit esi*8+TeamStatsTabArt]
        mov dword [byte edx+01Ah], eax
        mov eax, dword [nosplit esi*8+TeamStatsTabLit]
        mov dword [byte edx+01Eh], eax
        mov edx, dword [byte ebp+01Ch]
        mov dword [edx], esi
.13:
        leave
        pop edi
        pop esi
        ret 14h
jpt_88DE1:
        dd TeamStatsScreen_92E
        dd TeamStatsScreen_946
        dd TeamStatsScreen_96F
        dd TeamStatsScreen_957
        dd TeamStatsScreen_8FE
        dd TeamStatsScreen_916
jpt_88DF9:
        dd TeamStatsScreen_132A
        dd TeamStatsScreen_134F
        dd TeamStatsScreen_1380
        dd TeamStatsScreen_136C
;-----------------------------------------------------------------------------
; TeamStatsScreen                              88E09  96 PC, medium confidence
; The team stats screen (Menupicks, SEA0 / CON0: season, conference):
; sortable columns, scroll bar, export
;-----------------------------------------------------------------------------
TeamStatsScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1F5Ch, 0
        push eax
        sub ebp, 82h
        mov dword [byte ebp+01Eh], 63h
        mov dword [byte ebp+01Ah], 1Ah
        mov ecx, 60h
        lea edi, [dword ebp-062Eh]
        mov esi, str_U
        mov dword [byte ebp+016h], 1
        mov dword [byte ebp+012h], 3
        rep movsd
        mov dword [byte ebp+0Eh], 0
        mov ecx, 0Ch
        lea edi, [dword ebp-082h]
        mov esi, TeamStatsColumnLabels
        mov dword [byte ebp+0Ah], 0FFFFFFFFh
        push byte 0
        rep movsd
        push dword 2AA2h
        mov ecx, 6Bh
        lea edi, [dword ebp-07DAh]
        mov esi, TeamStatsNavLinks
        mov dword [byte ebp-02h], 0
        push str_Menupicks
        rep movsd
        call AllocMemBlock
        mov edi, 0AEh
        mov ebx, eax
        add esp, byte 0Ch
        mov dword [byte ebp-012h], eax
        mov edx, eax
        mov eax, 6Bh
        mov ecx, 9Ch
        call InitMenuItems
        lea eax, [dword ebp-0D5Ah]
        lea esi, [dword ebx+06C6h]
        mov dword [byte ebp+046h], eax
.1:
        mov ebx, dword [byte ebp-02h]
        shl ebx, 6
        mov dword [dword ebx+ebp-0D5Ah], 46h
        mov dword [dword ebx+ebp-0D52h], 10Eh
        mov dword [dword ebx+ebp-0D4Ah], 10Eh
        mov dword [dword ebx+ebp-0D42h], 46h
        mov dword [dword ebx+ebp-0D56h], ecx
        mov dword [dword ebx+ebp-0D4Eh], ecx
        mov dword [dword ebx+ebp-0D46h], edi
        mov dword [dword ebx+ebp-0D3Eh], edi
        mov eax, dword [byte ebp+046h]
        mov dword [byte esi+010h], 4
        mov dword [byte esi+014h], eax
        mov eax, dword [dword ebx+ebp-0D5Ah]
        add eax, dword [dword ebx+ebp-0D52h]
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov dword [byte esi+03Ah], eax
        mov eax, dword [dword ebx+ebp-0D56h]
        add eax, dword [dword ebx+ebp-0D46h]
        cdq
        LD sub, eax, edx
        sar eax, 1
        add esi, byte 66h
        add dword [byte ebp+046h], byte 40h
        inc dword [byte ebp-02h]
        add edi, byte 12h
        add ecx, byte 12h
        mov dword [byte esi-028h], eax
        cmp dword [byte ebp-02h], byte 0Eh
        jl near .1
        mov dword [byte ebp-02h], 0
        lea eax, [dword ebp-04AEh]
        mov esi, dword [byte ebp-012h]
        mov edi, 140h
        mov ecx, 107h
        mov dword [byte ebp+04Ah], eax
        add esi, 0C5Ah
.2:
        mov ebx, dword [byte ebp-02h]
        shl ebx, 6
        mov dword [dword ebx+ebp-04AAh], 88h
        mov dword [dword ebx+ebp-04A2h], 88h
        mov dword [dword ebx+ebp-049Ah], 9Ch
        mov dword [dword ebx+ebp-0492h], 9Ch
        mov dword [dword ebx+ebp-04AEh], ecx
        mov dword [dword ebx+ebp-04A6h], edi
        mov dword [dword ebx+ebp-049Eh], edi
        mov dword [dword ebx+ebp-0496h], ecx
        mov eax, dword [byte ebp+04Ah]
        mov dword [byte esi+010h], 4
        mov dword [byte esi+014h], eax
        mov eax, dword [dword ebx+ebp-04AEh]
        add eax, dword [dword ebx+ebp-04A6h]
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov dword [byte esi+03Ah], eax
        mov eax, dword [dword ebx+ebp-04AAh]
        add eax, dword [dword ebx+ebp-049Ah]
        cdq
        LD sub, eax, edx
        sar eax, 1
        add esi, byte 66h
        add dword [byte ebp+04Ah], byte 40h
        inc dword [byte ebp-02h]
        add edi, byte 39h
        add ecx, byte 39h
        mov dword [byte esi-028h], eax
        cmp dword [byte ebp-02h], byte 5
        jl near .2
        mov dword [dword ebp-036Eh], 46h
        mov dword [dword ebp-036Ah], 88h
        mov dword [dword ebp-0366h], 107h
        mov dword [dword ebp-0362h], 88h
        mov dword [dword ebp-035Eh], 107h
        mov dword [dword ebp-035Ah], 9Ch
        mov dword [dword ebp-0356h], 46h
        mov eax, dword [byte ebp-012h]
        mov dword [dword ebp-0352h], 9Ch
        mov edx, dword [byte ebp-012h]
        mov dword [dword eax+0E68h], 4
        lea eax, [dword ebp-036Eh]
        mov dword [dword edx+0E6Ch], eax
        mov eax, dword [dword ebp-036Eh]
        add eax, dword [dword ebp-0366h]
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov edx, dword [byte ebp-012h]
        mov dword [dword edx+0E92h], eax
        mov eax, dword [dword ebp-036Ah]
        add eax, dword [dword ebp-035Ah]
        cdq
        LD sub, eax, edx
        sar eax, 1
        mov dword [byte ebp+056h], 0AEh
        mov edx, dword [byte ebp-012h]
        mov ecx, 9Ch
        xor esi, esi
        mov dword [dword edx+0E96h], eax
.3:
        mov eax, dword [byte ebp+056h]
        mov dword [byte ebp+042h], eax
        mov eax, esi
        imul ebx, esi, byte 66h
        lea edx, [dword ebp-01EDAh]
        mov dword [byte ebp+052h], 107h
        mov dword [byte ebp+03Eh], ecx
        shl eax, 6
        xor edi, edi
        add eax, edx
        add ebx, 0EBEh
        mov dword [byte ebp+04Eh], eax
        add ebx, dword [byte ebp-012h]
.4:
        mov eax, esi
        shl eax, 6
        mov edx, dword [byte ebp+052h]
        mov dword [dword eax+ebp-01EDAh], edx
        lea edx, [dword edi+0140h]
        mov dword [dword eax+ebp-01ED2h], edx
        mov dword [dword eax+ebp-01ECAh], edx
        mov edx, dword [byte ebp+052h]
        mov dword [dword eax+ebp-01EC2h], edx
        mov edx, dword [byte ebp+03Eh]
        mov dword [dword eax+ebp-01ED6h], edx
        mov dword [dword eax+ebp-01ECEh], edx
        mov edx, dword [byte ebp+042h]
        mov dword [dword eax+ebp-01EC6h], edx
        mov dword [dword eax+ebp-01EBEh], edx
        mov edx, dword [byte ebp+04Eh]
        mov dword [byte ebx+010h], 4
        mov dword [byte ebx+014h], edx
        mov edx, dword [dword eax+ebp-01EDAh]
        add edx, byte 28h
        mov dword [byte ebx+03Ah], edx
        mov edx, dword [dword eax+ebp-01ED6h]
        mov dword [byte ebp+07Eh], edx
        mov eax, dword [dword eax+ebp-01EC6h]
        add dword [byte ebp+07Eh], eax
        mov eax, dword [byte ebp+07Eh]
        cdq
        LD sub, eax, edx
        sar eax, 1
        add ebx, byte 66h
        inc esi
        add edi, byte 39h
        add dword [byte ebp+052h], byte 39h
        add dword [byte ebp+04Eh], byte 40h
        mov dword [byte ebx-028h], eax
        cmp edi, 11Dh
        jne near .4
        add ecx, byte 12h
        add dword [byte ebp+056h], byte 12h
        cmp ecx, 198h
        jne near .3
        mov eax, 104h
        xor edx, edx
        call LoadPackedFile
        push str_Bkgd15
        push eax
        mov esi, eax
        mov dword [byte ebp-06h], eax
        call FindShape
        add esp, byte 8
        push str_Pal20
        push esi
        mov dword [byte ebp-0Ah], eax
        call FindShape
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp-0Eh], eax
        call SetScreenColors
        lea eax, [dword ebp-09DAh]
        push eax
        push dword [byte ebp-0Eh]
        push dword 8000h
        call TintRect
        add esp, byte 0Ch
        lea eax, [dword ebp-08DAh]
        push eax
        push dword [byte ebp-0Eh]
        mov dword [byte ebp-02h], 0Eh
        push dword 0C000h
        mov dword [byte ebp+05Eh], 0
        mov dword [byte ebp+062h], 0
        push dword 8000h
        mov dword [byte ebp+066h], 0
        xor esi, esi
        push dword 8000h
        mov dword [byte ebp-02h], 0
        mov dword [byte ebp+06Ah], esi
        call TintRows
        add esp, byte 14h
.5:
        mov dword [byte ebp+07Ah], 0
        mov eax, dword [byte ebp+062h]
        mov edi, dword [byte ebp+05Eh]
        mov dword [byte ebp+022h], eax
        mov dword [byte ebp+05Ah], edi
.6:
        push dword [byte ebp+07Ah]
        mov eax, dword [byte ebp+022h]
        push dword [dword eax+ebp-082h]
        push str_SD2
        lea eax, [byte ebp-01Ah]
        push eax
        call sprintf_
        add esp, byte 10h
        push byte 0
        push str_SEA0
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_SEA0
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        mov edx, dword [byte ebp+05Ah]
        push eax
        mov dword [dword edx+TeamStatsButtonBmps], eax
        call SetDrawBitmap
        add esp, byte 4
        lea eax, [byte ebp-01Ah]
        push eax
        push dword [byte ebp-06h]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        lea eax, [byte ebp-01Ah]
        push eax
        push dword [byte ebp-06h]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd15
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0
        lea eax, [byte ebp-01Ah]
        push eax
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push eax
        inc dword [byte ebp+07Ah]
        add dword [byte ebp+05Ah], byte 4
        call DrawArtKeyed
        add esp, byte 0Ch
        cmp dword [byte ebp+07Ah], byte 8
        jl near .6
        mov eax, dword [dword edi+TeamStatsButtonBmps+8]
        mov edx, dword [byte ebp+06Ah]
        mov dword [byte ebp+026h], eax
        mov eax, dword [byte eax+02Ch]
        mov dword [dword edx+TeamStatsHeaderArt], eax
        mov edx, dword [dword edi+TeamStatsButtonBmps+0Ch]
        mov ebx, dword [byte ebp+06Ah]
        mov eax, dword [byte edx+02Ch]
        mov dword [dword ebx+TeamStatsHeaderArt+4], eax
        mov eax, dword [dword edi+TeamStatsButtonBmps+10h]
        mov dword [byte ebp+02Ah], eax
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebx+TeamStatsHeaderArt+8], eax
        mov eax, dword [dword edi+TeamStatsButtonBmps+14h]
        mov dword [byte ebp+02Eh], eax
        mov eax, dword [byte eax+02Ch]
        mov dword [dword esi+StatsButtonArt], eax
        mov eax, dword [dword edi+TeamStatsButtonBmps+18h]
        mov dword [byte ebp+032h], eax
        mov eax, dword [byte eax+02Ch]
        mov dword [dword esi+StatsButtonArt+4], eax
        mov eax, dword [dword edi+TeamStatsButtonBmps+1Ch]
        mov eax, dword [byte eax+02Ch]
        mov ebx, dword [dword edi+TeamStatsButtonBmps+4]
        mov dword [dword esi+StatsButtonArt+8], eax
        mov eax, dword [byte ebx+02Ch]
        mov dword [dword esi+StatsButtonArt+0Ch], eax
        mov eax, dword [dword edi+TeamStatsButtonBmps]
        mov edi, dword [byte ebp+066h]
        mov ecx, dword [byte eax+02Ch]
        mov dword [dword edi+TeamStatsTabArt], ecx
        mov ecx, dword [byte ebx+02Ch]
        mov dword [dword edi+TeamStatsTabLit], ecx
        cmp dword [byte ebp-02h], byte 0
        jne short .7
        mov ebx, ecx
        mov ecx, dword [byte ebp+06Ah]
        mov dword [dword ecx+TeamStatsHeaderArt], ebx
        mov ebx, dword [byte ebp+026h]
        mov ebx, dword [byte ebx+02Ch]
        mov dword [dword ecx+TeamStatsHeaderArt+4], ebx
        mov edx, dword [byte edx+02Ch]
        mov dword [dword ecx+TeamStatsHeaderArt+8], edx
        mov edx, dword [byte ebp+02Ah]
        mov edx, dword [byte edx+02Ch]
        mov dword [dword esi+StatsButtonArt], edx
        mov edx, dword [byte ebp+02Eh]
        mov edx, dword [byte edx+02Ch]
        mov dword [dword esi+StatsButtonArt+4], edx
        mov edx, dword [byte ebp+032h]
        mov edx, dword [byte edx+02Ch]
        mov dword [dword esi+StatsButtonArt+8], edx
        mov edx, dword [byte eax+02Ch]
        mov dword [dword edi+TeamStatsTabArt], edx
        mov dword [dword esi+StatsButtonArt+0Ch], edx
        mov dword [dword edi+TeamStatsTabLit], edx
.7:
        add dword [byte ebp+05Eh], byte 20h
        add dword [byte ebp+062h], byte 4
        add dword [byte ebp+066h], byte 8
        add dword [byte ebp+06Ah], byte 0Ch
        inc dword [byte ebp-02h]
        add esi, byte 10h
        cmp dword [byte ebp-02h], byte 0Ch
        jl near .5
        call SetScreenTarget
        cmp dword [dword ebp-01EDEh], 3E8h
        jge short .8
        call LoadModemStats
        jmp short .10
.8:
        cmp dword [statsplayoffs], byte 0
        jne short .9
        cmp dword [dword ebp-01EDEh], 2AF8h
        jge short .9
        mov eax, dword [dword ebp-01EDEh]
        call LoadSeasonStats
        jmp short .10
.9:
        cmp dword [statsplayoffs], byte 0
        jne short .10
        mov eax, dword [dword ebp-01EDEh]
        sub eax, 2710h
        call LoadPlayoffStats
.10:
        cmp dword [dword ebp-01EDEh], 2AF8h
        jge short .11
        cmp dword [TeamStatsPlayoffs], byte 1
        je short .11
        mov eax, dword [dword ebp-01EDEh]
        call BuildTeamStatTables
        jmp short .12
.11:
        mov eax, dword [dword ebp-01EDEh]
        call DumpSaveTimes
.12:
        mov dword [byte ebp-02h], 0
.13:
        mov eax, dword [byte ebp-02h]
        mov dl, byte [byte ebp-02h]
        inc dword [byte ebp-02h]
        mov byte [byte eax+ebp-052h], dl
        cmp dword [byte ebp-02h], byte 1Ah
        jl short .13
        mov ecx, CompareTeamStatRows
        mov ebx, 1
        mov edx, 1Ah
        lea eax, [byte ebp-052h]
        mov dword [TeamStatSortColumn], 1
        call qsort_
        lea edx, [byte ebp-036h]
        lea eax, [byte ebp-052h]
        mov ecx, dword [StatsMenuItems]
        mov ebx, dword [StatsMenuChoice]
        call CopyTeamStatName
        mov eax, dword [byte ebp-012h]
        mov edx, dword [byte ebp-012h]
        mov dword [dword eax+0142h], 4
        lea eax, [dword ebp-062Eh]
        mov dword [dword edx+0146h], eax
        lea eax, [dword edx+0132h]
        cmp dword [dword ebp-01EDEh], 2AF7h
        jle short .14
        mov dword [TeamStatsPlayoffs], 1
        mov edx, dword [TeamStatsButtonPos+8]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+0Ch]
        mov dword [byte eax+01Eh], edx
        mov edx, dword [byte ebp-012h]
        mov eax, dword [TeamStatsButtonPos+8]
        mov dword [dword edx+0150h], eax
        jmp short .15
.14:
        mov edx, dword [TeamStatsButtonPos]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+4]
        mov dword [byte eax+01Eh], edx
.15:
        mov eax, dword [byte ebp-012h]
        add eax, 132h
        cmp dword [TeamStatsPlayoffs], byte 1
        jne short .16
        mov edx, dword [TeamStatsButtonPos+8]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+0Ch]
        jmp short .17
.16:
        mov edx, dword [TeamStatsButtonPos]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+4]
.17:
        mov dword [byte eax+01Eh], edx
        push str_SEA0
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_SEA0
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp-06h]
        mov dword [dword edx+0158h], eax
        call FindShape
        mov edx, dword [byte ebp-012h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword edx+015Ch], eax
        mov eax, dword [dword edx+0158h]
        add eax, byte 1Eh
        mov dword [dword edx+016Ch], eax
        mov eax, dword [dword edx+015Ch]
        mov dword [dword edx+01A8h], 4
        add eax, byte 0Ah
        mov dword [dword edx+0170h], eax
        lea eax, [dword ebp-05EEh]
        add esp, byte 8
        mov dword [dword edx+01ACh], eax
        lea eax, [dword edx+0198h]
        cmp dword [StatsMenuChoice], byte 0
        jne short .18
        mov edx, dword [TeamStatsButtonPos+10h]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+14h]
        jmp short .20
.18:
        cmp dword [StatsMenuChoice], byte 1
        jne short .19
        mov edx, dword [TeamStatsButtonPos+20h]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+24h]
        jmp short .20
.19:
        mov edx, dword [TeamStatsButtonPos+18h]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+1Ch]
.20:
        mov dword [byte eax+01Eh], edx
        push str_CON0
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_CON0
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp-06h]
        mov dword [dword edx+01BEh], eax
        call FindShape
        mov edx, dword [byte ebp-012h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword edx+01C2h], eax
        mov eax, dword [dword edx+01BEh]
        add eax, byte 1Eh
        mov dword [dword edx+01D2h], eax
        mov eax, dword [dword edx+01C2h]
        mov dword [dword edx+020Eh], 4
        add eax, byte 0Ah
        mov dword [dword edx+01D6h], eax
        lea eax, [dword ebp-05AEh]
        mov dword [dword edx+0212h], eax
        mov edx, dword [StatsMenuItems]
        add esp, byte 8
        cmp edx, byte 5
        ja near TeamStatsScreen_96F.23
        mov eax, dword [byte ebp-012h]
        add eax, 1FEh
        jmp dword [nosplit cs:edx*4+jpt_88DE1]
TeamStatsScreen_8FE:
        mov edx, dword [TeamStatsButtonPos+28h]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+2Ch]
        mov dword [byte ebp+01Ah], 0Ch
        jmp short TeamStatsScreen_96F.22
TeamStatsScreen_916:
        mov edx, dword [TeamStatsButtonPos+30h]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+34h]
        mov dword [byte ebp+01Ah], 0Eh
        jmp short TeamStatsScreen_96F.22
TeamStatsScreen_92E:
        mov edx, dword [TeamStatsButtonPos+38h]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+3Ch]
.21:
        mov dword [byte ebp+01Ah], 6
        jmp short TeamStatsScreen_96F.22
TeamStatsScreen_946:
        mov edx, dword [TeamStatsButtonPos+28h]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+2Ch]
        jmp short TeamStatsScreen_92E.21
TeamStatsScreen_957:
        mov edx, dword [TeamStatsButtonPos+40h]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+44h]
        mov dword [byte ebp+01Ah], 7
        jmp short TeamStatsScreen_96F.22
TeamStatsScreen_96F:
        mov edx, dword [TeamStatsButtonPos+50h]
        mov dword [byte eax+01Ah], edx
        mov edx, dword [TeamStatsButtonPos+54h]
        mov dword [byte ebp+01Ah], 7
.22:
        mov dword [byte eax+01Eh], edx
.23:
        cmp dword [StatsMenuChoice], byte 0
        jne short .24
        mov eax, dword [byte ebp-012h]
        mov edx, dword [TeamStatsTabArt]
        mov dword [dword eax+0218h], edx
        add eax, 1FEh
        mov edx, dword [TeamStatsTabLit]
        mov dword [byte ebp+01Ah], 1Ah
        mov dword [byte eax+01Eh], edx
.24:
        push str_WES0
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_WES0
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp-06h]
        mov dword [dword edx+0224h], eax
        call FindShape
        mov edx, dword [byte ebp-012h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword edx+0228h], eax
        mov eax, dword [dword edx+0224h]
        add eax, byte 1Eh
        mov dword [dword edx+0238h], eax
        add esp, byte 8
        mov eax, dword [dword edx+0228h]
        mov dword [dword edx+0274h], 6
        add eax, byte 0Ah
        push str_PRN0
        mov dword [dword edx+023Ch], eax
        lea eax, [dword ebp-056Eh]
        push dword [byte ebp-06h]
        mov dword [dword edx+0278h], eax
        call FindShape
        add esp, byte 8
        push str_PRN1
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+027Eh], eax
        call FindShape
        add esp, byte 8
        push str_PRN2
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+0282h], eax
        call FindShape
        add esp, byte 8
        push str_PRN0
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+0286h], eax
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_PRN0
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp-06h]
        mov dword [dword edx+028Ah], eax
        call FindShape
        mov edx, dword [byte ebp-012h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword edx+028Eh], eax
        mov eax, dword [dword edx+028Ah]
        add eax, byte 1Eh
        mov dword [dword edx+029Eh], eax
        add esp, byte 8
        mov eax, dword [dword edx+028Eh]
        mov dword [dword edx+02DAh], 6
        add eax, byte 0Ah
        push str_LGR0
        mov dword [dword edx+02A2h], eax
        lea eax, [dword ebp-052Eh]
        push dword [byte ebp-06h]
        mov dword [dword edx+02DEh], eax
        call FindShape
        add esp, byte 8
        push str_LGR1
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+02E4h], eax
        call FindShape
        mov edx, dword [byte ebp-012h]
        add esp, byte 8
        mov dword [dword edx+02E8h], eax
        push str_LGR2
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push str_LGR0
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+02ECh], eax
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_LGR0
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp-06h]
        mov dword [dword edx+02F0h], eax
        call FindShape
        mov edx, dword [byte ebp-012h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword edx+02F4h], eax
        mov eax, dword [dword edx+02F0h]
        add eax, byte 1Eh
        mov dword [dword edx+0304h], eax
        add esp, byte 8
        mov eax, dword [dword edx+02F4h]
        mov dword [dword edx+0340h], 6
        add eax, byte 0Ah
        push str_TEA0
        mov dword [dword edx+0308h], eax
        lea eax, [dword ebp-04EEh]
        push dword [byte ebp-06h]
        mov dword [dword edx+0344h], eax
        call FindShape
        add esp, byte 8
        push str_TEA1
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+034Ah], eax
        call FindShape
        add esp, byte 8
        push str_TEA2
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+034Eh], eax
        call FindShape
        add esp, byte 8
        push str_TEA0
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+0352h], eax
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_TEA0
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp-06h]
        mov dword [dword edx+0356h], eax
        call FindShape
        mov edx, dword [byte ebp-012h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword edx+035Ah], eax
        mov eax, dword [dword edx+0356h]
        add eax, byte 1Eh
        mov dword [dword edx+036Ah], eax
        add esp, byte 8
        mov eax, dword [dword edx+035Ah]
        push str_AR30
        add eax, byte 0Ah
        push dword [byte ebp-06h]
        mov dword [dword edx+036Eh], eax
        call FindShape
        add esp, byte 8
        push str_AR31
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+03B0h], eax
        call FindShape
        mov edx, dword [byte ebp-012h]
        add esp, byte 8
        mov dword [dword edx+03B4h], eax
        push str_AR30
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_AR30
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp-06h]
        mov dword [dword edx+03BCh], eax
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_AR20
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp-06h]
        mov dword [dword edx+03C0h], eax
        call FindShape
        add esp, byte 8
        push str_AR21
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+04E2h], eax
        call FindShape
        add esp, byte 8
        push str_AR20
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+04E6h], eax
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_AR20
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp-06h]
        mov dword [dword edx+04EEh], eax
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_AR002
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp-06h]
        mov dword [dword edx+04F2h], eax
        call FindShape
        add esp, byte 8
        push str_AR012
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+0548h], eax
        call FindShape
        add esp, byte 8
        push str_AR002
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+054Ch], eax
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_AR002
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp-06h]
        mov dword [dword edx+0554h], eax
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_AR102
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp-06h]
        mov dword [dword edx+0558h], eax
        call FindShape
        mov edx, dword [byte ebp-012h]
        add esp, byte 8
        mov dword [dword edx+067Ah], eax
        push str_AR112
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push str_AR102
        mov edx, dword [byte ebp-012h]
        push dword [byte ebp-06h]
        mov dword [dword edx+067Eh], eax
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push str_AR102
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp-06h]
        mov dword [dword edx+0686h], eax
        call FindShape
        mov edx, dword [byte ebp-012h]
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [dword edx+068Ah], eax
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
        push dword [byte ebp-0Ah]
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        cmp dword [dword ebp-01EDEh], 3E8h
        jl short .25
        cmp dword [dword ebp-01EDEh], 2AF8h
        jge short .25
        push str_HED2
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        push SeasonUserTeam
        mov eax, 1D7h
        jmp short .26
.25:
        cmp dword [dword ebp-01EDEh], 2AF8h
        jl short .27
        push str_HED1
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        push SaveFileName
        mov eax, 1D9h
.26:
        call GetLangText
        push eax
        lea eax, [dword ebp-0BEh]
        push eax
        mov ebx, 4Bh
        call sprintf_
        add esp, byte 0Ch
        mov edx, 140h
        lea eax, [dword ebp-0BEh]
        call DrawColorTextCentred
.27:
        mov eax, 4
        call OpenScreen
        push byte 0
        mov ecx, 66h
        push dword 10Eh
        mov edi, dword [byte ebp-012h]
        mov esi, TeamStatsBitmap
        push dword 1EAh
        rep movsb
        call CreateBitmap
        add esp, byte 0Ch
        push str_VBAL
        mov esi, eax
        push dword [byte ebp-06h]
        mov dword [byte ebp+06h], eax
        call FindShape
        add esp, byte 8
        push eax
        push str_VERT
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd15
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push eax
        mov ecx, 0Eh
        mov ebx, dword [byte ebp+01Ah]
        push byte 0
        add edx, 396h
        lea eax, [dword ebp-032Eh]
        call InitVScrollBar
        lea eax, [dword ebp-032Eh]
        call DrawScrollBar
        push str_HBAL
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push eax
        push str_HORZ
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd15
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        mov edx, dword [byte ebp-012h]
        push eax
        mov ecx, 5
        mov ebx, 10h
        push byte 0
        add edx, 52Eh
        lea eax, [dword ebp-01F6h]
        call InitHScrollBar
        lea eax, [dword ebp-01F6h]
        call DrawScrollBar
        lea eax, [dword ebp-09DAh]
        push eax
        mov edx, dword [byte ebp+01Ah]
        mov ebx, esi
        push dword [byte ebp+01Eh]
        xor ecx, ecx
        push dword [byte ebp-06h]
        mov esi, dword [byte ebp-012h]
        push byte 0
        lea eax, [byte ebp-036h]
        lea edi, [dword esi+02AA2h]
        call DrawTeamStatsTable
.28:
        cmp dword [byte esi+01Ah], byte 0
        je short .29
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        push dword [byte esi+01Ah]
        call DrawArtKeyed
        add esp, byte 0Ch
.29:
        add esi, byte 66h
        cmp esi, edi
        jne short .28
        mov ebx, 3
        mov edx, dword [byte ebp-0Eh]
        xor eax, eax
        call FadePalette
        lea edx, [dword ebp-07DAh]
        mov ebx, dword [byte ebp-012h]
        lea eax, [dword edx+01ACh]
        add ebx, byte 42h
        mov dword [byte ebp+06Eh], eax
.30:
        mov ecx, 4
        mov esi, edx
        mov edi, ebx
        rep movsb
        add edx, byte 4
        add ebx, byte 66h
        cmp edx, dword [byte ebp+06Eh]
        jne short .30
        mov dword [byte ebp+02h], 0FFFFFFFFh
        mov eax, dword [byte ebp-012h]
        mov esi, dword [byte ebp-012h]
        add eax, 132h
        mov edi, dword [byte ebp-012h]
        mov dword [byte ebp+036h], eax
        mov eax, dword [byte ebp-012h]
        add esi, 1FEh
        add eax, 396h
        add edi, 198h
        mov dword [byte ebp+03Ah], eax
        jmp near TeamStatsScreen_1380.74
.31:
        cmp dword [byte ebp+02h], byte 8
        jb short .33
        jbe near TeamStatsScreen_1380.54
        cmp dword [byte ebp+02h], byte 0Ch
        jb short .32
        jbe near TeamStatsScreen_1380.59
        cmp dword [byte ebp+02h], byte 0Eh
        jb near TeamStatsScreen_1380.62
        cmp dword [byte ebp+02h], byte 0Fh
        jbe near TeamStatsScreen_1380.63
        cmp dword [byte ebp+02h], byte 10h
        je near TeamStatsScreen_1380.64
        jmp near TeamStatsScreen_1380.65
.32:
        cmp dword [byte ebp+02h], byte 9
        jbe near TeamStatsScreen_1380.55
        jmp near TeamStatsScreen_1380.57
.33:
        cmp dword [byte ebp+02h], byte 4
        jb short .34
        jbe near .40
        cmp dword [byte ebp+02h], byte 6
        jb near .46
        jbe near TeamStatsScreen_1380.52
        jmp near TeamStatsScreen_1380.53
.34:
        cmp dword [byte ebp+02h], byte 0
        jbe short .35
        cmp dword [byte ebp+02h], byte 3
        je short .36
        jmp near TeamStatsScreen_1380.65
.35:
        call SlideInSideBar
        mov dword [byte ebp+0Ah], 0
        jmp near TeamStatsScreen_1380.74
.36:
        cmp dword [TeamStatsPlayoffs], byte 0
        jne short .37
        push esi
        lea eax, [byte ebp+0Eh]
        push eax
        mov ecx, dword [byte ebp+012h]
        push dword [byte ebp+0Eh]
        mov ebx, dword [byte ebp+036h]
        push edi
        lea eax, [byte ebp+012h]
        lea edx, [byte ebp+016h]
        push eax
        mov eax, 2
        mov dword [TeamStatsPlayoffs], 1
        call AnimateTeamStatsButtons
        mov eax, dword [dword ebp-01EDEh]
        call DumpSaveTimes
        jmp short .38
.37:
        cmp dword [dword ebp-01EDEh], 2AF8h
        jge short .38
        push esi
        lea eax, [byte ebp+0Eh]
        push eax
        mov ecx, dword [byte ebp+012h]
        push dword [byte ebp+0Eh]
        mov ebx, dword [byte ebp+036h]
        push edi
        lea eax, [byte ebp+012h]
        lea edx, [byte ebp+016h]
        push eax
        mov eax, 1
        mov dword [TeamStatsPlayoffs], 0
        call AnimateTeamStatsButtons
        mov eax, dword [dword ebp-01EDEh]
        call BuildTeamStatTables
.38:
        lea edx, [byte ebp-036h]
        lea eax, [byte ebp-052h]
        mov ecx, dword [StatsMenuItems]
        mov ebx, dword [StatsMenuChoice]
        call CopyTeamStatName
.39:
        lea eax, [dword ebp-09DAh]
        push eax
        mov ebx, dword [byte ebp+06h]
        push dword [byte ebp+01Eh]
        mov edx, dword [byte ebp+01Ah]
        push dword [byte ebp-06h]
        xor ecx, ecx
        jmp near TeamStatsScreen_1380.73
.40:
        mov eax, dword [StatsMenuChoice]
        cmp eax, byte 1
        jb short .41
        jbe short .42
        cmp eax, byte 2
        je short .43
        jmp near .45
.41:
        test eax, eax
        je short .44
        jmp near .45
.42:
        push byte 0
        push byte 0
        mov dword [StatsMenuChoice], 2
        push byte 0FFFFFFFFh
        lea eax, [byte ebp+0Eh]
        mov ecx, 8
        push esi
        lea edx, [byte ebp+012h]
        mov ebx, edi
        push eax
        mov eax, 4
        mov dword [byte ebp+01Ah], 6
        call AnimateTeamStatsButtons
        mov dword [StatsMenuItems], 0
        jmp short .45
.43:
        push byte 0
        push byte 0
        mov dword [StatsMenuChoice], 0
        push byte 0FFFFFFFFh
        lea eax, [byte ebp+0Eh]
        lea edx, [byte ebp+012h]
        push esi
        mov ebx, edi
        xor ecx, ecx
        push eax
        mov eax, 3
        mov dword [byte ebp+01Ah], 1Ah
        call AnimateTeamStatsButtons
        jmp short .45
.44:
        push eax
        push eax
        mov dword [StatsMenuChoice], 1
        push byte 0FFFFFFFFh
        mov ecx, 6
        lea edx, [byte ebp+012h]
        push esi
        lea eax, [byte ebp+0Eh]
        mov ebx, edi
        push eax
        mov eax, 5
        mov dword [byte ebp+01Ah], 0Ch
        call AnimateTeamStatsButtons
        mov dword [StatsMenuItems], 4
.45:
        lea edx, [byte ebp-036h]
        lea eax, [byte ebp-052h]
        mov ecx, dword [StatsMenuItems]
        mov ebx, dword [StatsMenuChoice]
        call CopyTeamStatName
        lea eax, [dword ebp-032Eh]
        call FreeScrollBar
        push str_VBAL
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push eax
        push str_VERT
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd15
        push dword [byte ebp-06h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Eh
        mov ebx, dword [byte ebp+01Ah]
        push byte 0
        mov edx, dword [byte ebp+03Ah]
        lea eax, [dword ebp-032Eh]
        call InitVScrollBar
        lea eax, [dword ebp-032Eh]
        call DrawScrollBar
        jmp near .39
.46:
        cmp dword [StatsMenuChoice], byte 1
        jne short .48
        mov dword [byte ebp+01Eh], 63h
        cmp dword [StatsMenuItems], byte 4
        sete al
        movzx eax, al
        add eax, byte 4
        mov ebx, esi
        mov dword [StatsMenuItems], eax
        cmp eax, byte 4
        jne short .47
        lea edx, [byte ebp+0Eh]
        mov eax, 6
        mov dword [byte ebp+01Ah], 0Ch
        jmp short TeamStatsScreen_132A.50
.47:
        lea edx, [byte ebp+0Eh]
        mov eax, 7
        mov dword [byte ebp+01Ah], 0Eh
        jmp short TeamStatsScreen_132A.50
.48:
        cmp dword [StatsMenuChoice], byte 2
        jne near .45
        mov eax, dword [StatsMenuItems]
        mov dword [byte ebp+01Eh], 63h
        cmp eax, byte 3
        ja near .45
        jmp dword [nosplit cs:eax*4+jpt_88DF9]
TeamStatsScreen_132A:
        mov dword [StatsMenuItems], 1
        lea edx, [byte ebp+0Eh]
        mov eax, 0Ah
.49:
        mov ebx, esi
        mov dword [byte ebp+01Ah], 6
.50:
        call AnimateTeamStatsButton
        jmp near TeamStatsScreen_96F.45
TeamStatsScreen_134F:
        mov dword [StatsMenuItems], 3
        lea edx, [byte ebp+0Eh]
        mov eax, 9
.51:
        mov ebx, esi
        mov dword [byte ebp+01Ah], 7
        jmp short TeamStatsScreen_132A.50
TeamStatsScreen_136C:
        mov dword [StatsMenuItems], 2
        lea edx, [byte ebp+0Eh]
        mov eax, 0Bh
        jmp short TeamStatsScreen_134F.51
TeamStatsScreen_1380:
        mov dword [StatsMenuItems], 0
        lea edx, [byte ebp+0Eh]
        mov eax, 8
        jmp short TeamStatsScreen_132A.49
.52:
        mov edx, dword [byte ebp+01Ah]
        lea eax, [byte ebp-036h]
        push dword [TeamStatsPlayoffs]
        mov ecx, dword [StatsMenuItems]
        mov ebx, dword [StatsMenuChoice]
        call ExportTeamStats
        jmp near .74
.53:
        mov dword [byte ebp+0Ah], 0A412h
        jmp near .74
.54:
        cmp dword [byte ebp+01Eh], byte 63h
        je near .74
        mov eax, dword [byte ebp+01Eh]
        add eax, 0A416h
        mov dword [byte ebp+0Ah], eax
        jmp near .74
.55:
        lea eax, [dword ebp-032Eh]
.56:
        call ScrollBarUp
        jmp short .61
.57:
        lea eax, [dword ebp-032Eh]
.58:
        call ScrollBarToMouse
        jmp short .61
.59:
        lea eax, [dword ebp-032Eh]
.60:
        call ScrollBarDown
.61:
        lea eax, [dword ebp-09DAh]
        push eax
        mov ebx, dword [byte ebp+06h]
        push dword [byte ebp+01Eh]
        mov edx, dword [byte ebp+01Ah]
        push dword [byte ebp-06h]
        mov ecx, dword [dword ebp-030Ah]
        jmp near .73
.62:
        lea eax, [dword ebp-01F6h]
        jmp short .56
.63:
        lea eax, [dword ebp-01F6h]
        jmp short .58
.64:
        lea eax, [dword ebp-01F6h]
        jmp short .60
.65:
        cmp dword [byte ebp+02h], byte 10h
        jle short .66
        cmp dword [byte ebp+02h], byte 1Fh
        jl short .67
.66:
        cmp dword [byte ebp+02h], byte 23h
        jl short .70
.67:
        cmp dword [byte ebp+02h], byte 1Fh
        jge short .68
        mov edx, dword [byte ebp+02h]
        jmp short .69
.68:
        mov eax, dword [byte ebp+02h]
        sub eax, byte 25h
        mov ebx, 5
        cdq
        idiv ebx
        lea edx, [byte eax+011h]
.69:
        mov eax, dword [dword ebp-030Ah]
        add eax, edx
        movsx eax, byte [byte eax+ebp-047h]
        mov dword [byte ebp+01Eh], eax
        cmp edx, dword [byte ebp+02h]
        jne short .70
        lea eax, [dword ebp-09DAh]
        push eax
        mov ecx, dword [dword ebp-030Ah]
        push dword [byte ebp+01Eh]
        mov ebx, dword [byte ebp+06h]
        push dword [byte ebp-06h]
        mov edx, dword [byte ebp+01Ah]
        push dword [dword ebp-01D2h]
        lea eax, [byte ebp-036h]
        call DrawTeamStatsTable
.70:
        cmp dword [byte ebp+02h], byte 24h
        jne near .76
        mov dword [TeamStatSortColumn], 0FFFFFFFEh
        mov dword [byte ebp-02h], 0
.71:
        mov eax, dword [byte ebp-02h]
        mov dl, byte [byte ebp-02h]
        inc dword [byte ebp-02h]
        mov byte [byte eax+ebp-052h], dl
        cmp dword [byte ebp-02h], byte 1Ah
        jl short .71
        lea edx, [byte ebp-036h]
        lea eax, [byte ebp-052h]
        mov ecx, dword [StatsMenuItems]
        mov ebx, dword [StatsMenuChoice]
        mov dword [byte ebp+01Eh], 63h
        call CopyTeamStatName
        lea ecx, [dword ebp-032Eh]
        mov ebx, dword [byte ebp+01Ah]
        lea edx, [byte ebp-036h]
        lea eax, [byte ebp+01Eh]
        call FindTeamStatRow
.72:
        lea eax, [dword ebp-09DAh]
        push eax
        mov ecx, dword [dword ebp-030Ah]
        push dword [byte ebp+01Eh]
        mov ebx, dword [byte ebp+06h]
        push dword [byte ebp-06h]
        mov edx, dword [byte ebp+01Ah]
.73:
        push dword [dword ebp-01D2h]
        lea eax, [byte ebp-036h]
        call DrawTeamStatsTable
.74:
        cmp dword [byte ebp+0Ah], byte 0FFFFFFFFh
        jne near .79
        mov dword [byte ebp+02h], 0FFFFFFFFh
.75:
        cmp dword [byte ebp+02h], byte 0
        jge near TeamStatsScreen_96F.31
        push byte 3
        lea eax, [byte ebp+02h]
        push byte 0
        mov ebx, 0FFFFFFFFh
        mov edx, dword [byte ebp-012h]
        push eax
        xor ecx, ecx
        mov eax, 6Bh
        call RunMenu
        jmp short .75
.76:
        cmp dword [byte ebp+02h], byte 1Fh
        jl short .74
        cmp dword [byte ebp+02h], byte 23h
        jle short .77
        mov eax, dword [byte ebp+02h]
        sub eax, byte 25h
        mov ebx, 5
        cdq
        idiv ebx
        add edx, byte 1Fh
        mov dword [byte ebp+076h], edx
        jmp short .78
.77:
        mov eax, dword [byte ebp+02h]
        mov dword [byte ebp+076h], eax
.78:
        mov eax, dword [byte ebp+076h]
        mov edx, dword [dword ebp-01D2h]
        mov ecx, CompareTeamStatRows
        sub eax, byte 1Fh
        mov ebx, 1
        add edx, eax
        lea eax, [byte ebp-052h]
        mov dword [TeamStatSortColumn], edx
        mov edx, 1Ah
        call qsort_
        lea edx, [byte ebp-036h]
        lea eax, [byte ebp-052h]
        mov ecx, dword [StatsMenuItems]
        mov ebx, dword [StatsMenuChoice]
        call CopyTeamStatName
        lea ecx, [dword ebp-032Eh]
        mov ebx, dword [byte ebp+01Ah]
        lea edx, [byte ebp-036h]
        lea eax, [byte ebp+01Eh]
        call FindTeamStatRow
        mov eax, dword [byte ebp+076h]
        cmp eax, dword [byte ebp+02h]
        jne near .72
        lea eax, [dword ebp-032Eh]
        xor edx, edx
        mov dword [byte ebp+01Eh], 63h
        call SetScrollBarPos
        jmp near .72
.79:
        mov dword [byte ebp-02h], 0
        mov edi, 20h
.80:
        mov esi, dword [byte ebp-02h]
        mov dword [byte ebp+072h], edi
        shl esi, 5
.81:
        push dword [dword esi+TeamStatsButtonBmps]
        call FreeBitmap
        add esi, byte 4
        add esp, byte 4
        cmp esi, dword [byte ebp+072h]
        jne short .81
        inc dword [byte ebp-02h]
        add edi, byte 20h
        cmp dword [byte ebp-02h], byte 0Ch
        jl short .80
        push dword [byte ebp-06h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp-012h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+06h]
        call FreeBitmap
        add esp, byte 4
        lea eax, [dword ebp-032Eh]
        call FreeScrollBar
        lea eax, [dword ebp-01F6h]
        call FreeScrollBar
        mov eax, 3
        call FadeOut
        mov eax, dword [byte ebp+0Ah]
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near BuildTeamStatTables_266
;-----------------------------------------------------------------------------
; DrawTeamStatsTable                           8A494  96 PC, medium confidence
; Draws the team stats rows ("%d-%d-%d" records, "1.000" / ".%03d",
; "%d.%d%%")
;-----------------------------------------------------------------------------
DrawTeamStatsTable:
        push esi
        push edi
        enter 50h, 0
        push eax
        push edx
        push ebx
        push ecx
        push ebx
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF78h
        push byte 0FFFFFFBAh
        push str_Bkgd15
        push dword [byte ebp+014h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        mov eax, 0FCh
        add esp, byte 0Ch
        xor edx, edx
        mov ecx, 1D9h
        call SetTextColors
        xor ebx, ebx
        push byte 10h
        mov eax, dword [byte ebp+01Ch]
        xor edx, edx
        add eax, 100h
        call FillBox
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-010h], eax
        add eax, byte 5
        mov dword [byte ebp-048h], eax
        imul eax, dword [byte ebp+010h], byte 39h
        lea ebx, [dword eax+0C1h]
        mov ecx, eax
        mov esi, 2
        neg ecx
        mov dword [byte ebp-038h], 0
        add ebx, ecx
        mov edi, dword [byte ebp+010h]
        mov dword [byte ebp-034h], ebx
        lea ebx, [dword eax+0F6h]
        shl edi, 2
        add eax, 0DEh
        add ebx, ecx
        add eax, ecx
        mov dword [byte ebp-028h], ebx
        mov dword [byte ebp-020h], eax
        jmp short .4
.1:
        cmp eax, dword [TeamStatSortColumn]
        jne short .2
        mov eax, 0FDh
        xor edx, edx
        mov ecx, dword [byte ebp-028h]
        call SetTextColors
        xor ebx, ebx
        push dword 10Ch
        mov edx, dword [byte ebp-034h]
        mov eax, dword [byte ebp+01Ch]
        call FillBox
        jmp short .3
.2:
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
.3:
        mov edx, dword [byte ebp-020h]
        add dword [byte ebp-034h], byte 39h
        add dword [byte ebp-028h], byte 39h
        inc dword [byte ebp-010h]
        mov eax, dword [dword edi+TeamStatTextIds]
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        add edi, byte 4
        add dword [byte ebp-020h], byte 39h
.4:
        mov eax, dword [byte ebp-010h]
        cmp eax, dword [byte ebp-048h]
        jl short .1
        cmp dword [TeamStatSortColumn], byte 0
        jge short .5
        mov eax, 0FDh
        jmp short .6
.5:
        mov eax, 0FCh
.6:
        xor edx, edx
        call SetTextColors
        mov eax, 111h
        xor ebx, ebx
        xor edx, edx
        call GetLangText
        call DrawColorText
        mov eax, dword [byte ebp-060h]
        mov dword [byte ebp-08h], eax
        mov eax, dword [byte ebp+010h]
        add eax, byte 5
        mov dword [byte ebp-044h], eax
        mov eax, dword [byte ebp-060h]
        add eax, dword [byte ebp-054h]
        mov dword [byte ebp-02Ch], eax
        lea eax, [byte esi-03h]
        mov dword [byte ebp-01Ch], eax
        lea eax, [byte esi+010h]
        mov dword [byte ebp-03Ch], eax
        lea eax, [byte esi-04h]
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp+010h]
        shl eax, 2
        mov dword [byte ebp-040h], eax
        jmp near .24
.7:
        cmp dword [byte ebp-038h], byte 0Eh
        jge near .23
        mov eax, dword [byte ebp-02Ch]
        movsx eax, byte [eax]
        mov dword [byte ebp-018h], eax
        imul eax, byte 63h
        inc dword [byte ebp-038h]
        mov edx, dword [statsfromleague]
        add dword [byte ebp-01Ch], byte 12h
        add eax, edx
        add dword [byte ebp-03Ch], byte 12h
        lea edi, [byte eax+05h]
        add dword [byte ebp-0Ch], byte 12h
        mov eax, dword [byte ebp-018h]
        add esi, byte 12h
        cmp eax, dword [byte ebp+018h]
        jne short .8
        push dword [byte ebp-03Ch]
        mov ecx, 1DAh
        mov ebx, dword [byte ebp-01Ch]
        mov eax, dword [byte ebp+01Ch]
        xor edx, edx
        call FillBox
        mov eax, 0FDh
        jmp short .9
.8:
        mov eax, 0FCh
.9:
        xor edx, edx
        call SetTextColors
        mov edx, 1Eh
        mov ebx, esi
        mov eax, edi
        call DrawColorText
        mov eax, dword [byte ebp-08h]
        inc eax
        push eax
        push str_D5
        lea eax, [byte ebp-050h]
        push eax
        mov edx, 4
        call sprintf_
        add esp, byte 0Ch
        mov ebx, esi
        lea eax, [byte ebp-050h]
        call DrawColorText
        cmp dword [TeamStatSortColumn], byte 0FFFFFFFFh
        jne short .10
        cmp dword [byte ebp-08h], byte 8
        jne short .10
        push byte 64h
        push dword [byte ebp-0Ch]
        push dword 1DEh
        push dword [byte ebp-0Ch]
        push byte 0
        call FillRectColor
        add esp, byte 14h
.10:
        imul eax, dword [byte ebp-018h], byte 30h
        imul ecx, dword [byte ebp-018h], byte 28h
        mov dword [byte ebp-030h], 0DEh
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-040h]
        mov edi, dword [byte ebp+010h]
        add eax, dword [byte ebp-014h]
        add ecx, dword [byte ebp-040h]
        mov dword [byte ebp-024h], eax
        jmp near .22
.11:
        mov eax, edi
        shl eax, 2
        cmp edi, byte 4
        jge short .12
        mov eax, dword [dword ecx+TeamStatRowValues]
        movzx eax, byte [eax]
        push eax
        push str_D7
        jmp near .20
.12:
        add eax, dword [byte ebp-014h]
        cmp edi, byte 5
        jne short .14
        mov eax, dword [dword eax+TeamStatColumns]
        movzx eax, word [eax]
        cmp eax, 3E8h
        jne short .13
        push str_10002
        lea eax, [byte ebp-050h]
        push eax
        call sprintf_
        add esp, byte 8
        jmp near .21
.13:
        push eax
        push str_03d
        jmp near .20
.14:
        cmp edi, byte 8
        jne short .16
        mov eax, dword [dword ecx+TeamStatRows+8]
        movzx eax, byte [eax]
        push eax
        mov eax, dword [dword ecx+TeamStatRows+4]
        movzx eax, byte [eax]
        push eax
        mov eax, dword [dword ecx+TeamStatRows]
.15:
        movzx eax, byte [eax]
        push eax
        push str_DDD4
        lea eax, [byte ebp-050h]
        push eax
        call sprintf_
        add esp, byte 14h
        jmp near .21
.16:
        cmp edi, byte 9
        jne short .17
        mov eax, dword [dword ecx+TeamStatRowValues]
        movzx eax, byte [eax]
        push eax
        mov eax, dword [dword ecx+TeamStatRows+0Ch]
        movzx eax, byte [eax]
        push eax
        mov eax, dword [dword ecx+TeamStatRows+8]
        jmp short .15
.17:
        cmp edi, byte 0Ch
        je short .18
        cmp edi, byte 0Fh
        jne short .19
.18:
        mov ebx, dword [byte ebp-024h]
        mov ebx, dword [dword ebx+TeamStatColumns]
        movzx ebx, word [ebx]
        mov eax, ebx
        mov dword [byte ebp-04h], 0Ah
        cdq
        idiv dword [byte ebp-04h]
        push edx
        mov eax, ebx
        mov ebx, 0Ah
        cdq
        idiv ebx
        push eax
        push str_DD2
        lea eax, [byte ebp-050h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .21
.19:
        mov eax, dword [dword eax+TeamStatColumns]
        movzx eax, word [eax]
        push eax
        push str_D7
.20:
        lea eax, [byte ebp-050h]
        push eax
        call sprintf_
        add esp, byte 0Ch
.21:
        mov edx, dword [byte ebp-030h]
        lea eax, [byte ebp-050h]
        mov ebx, esi
        add dword [byte ebp-024h], byte 4
        call DrawColorTextCentred
        add ecx, byte 4
        inc edi
        add dword [byte ebp-030h], byte 39h
.22:
        cmp edi, dword [byte ebp-044h]
        jl near .11
.23:
        inc dword [byte ebp-02Ch]
        inc dword [byte ebp-08h]
.24:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte ebp-058h]
        jl near .7
        call SetScreenTarget
        push dword 88h
        mov eax, dword [byte ebp-05Ch]
        push byte 46h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        leave
        pop edi
        pop esi
        ret 10h
jpt_8A844:
        dd CopyTeamStatName_82
        dd CopyTeamStatName_90
        dd CopyTeamStatName_89
        dd CopyTeamStatName_97
;-----------------------------------------------------------------------------
; CopyTeamStatName                                8A854  96 PC, low confidence
; Copies a team row's name (1Ah) by the name kind
;-----------------------------------------------------------------------------
CopyTeamStatName:
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        add eax, byte 1Ah
        mov dword [byte ebp-04h], eax
        test ebx, ebx
        jne short .2
        mov ebx, dword [byte ebp-04h]
        mov eax, esi
.1:
        mov cl, byte [eax]
        inc eax
        mov byte [edx], cl
        inc edx
        cmp eax, ebx
        je near CopyTeamStatName_97.12
        jmp short .1
.2:
        cmp ebx, byte 1
        jne short .8
        cmp ecx, byte 4
        jne short .5
        mov ebx, dword [byte ebp-04h]
        mov eax, esi
        mov esi, edx
.3:
        movsx edx, byte [eax]
        cmp dword [nosplit edx*4+TeamConferenceIds], byte 3
        jne short .4
        mov dl, byte [eax]
        mov byte [esi], dl
        inc esi
.4:
        inc eax
        cmp eax, ebx
        je near CopyTeamStatName_97.12
        jmp short .3
.5:
        mov ecx, dword [byte ebp-04h]
        mov eax, esi
.6:
        movsx ebx, byte [eax]
        cmp dword [nosplit ebx*4+TeamConferenceIds], byte 0Ch
        jne short .7
        mov bl, byte [eax]
        mov byte [edx], bl
        inc edx
.7:
        inc eax
        cmp eax, ecx
        je short CopyTeamStatName_97.12
        jmp short .6
.8:
        xor ebx, ebx
        cmp ecx, byte 3
        ja short CopyTeamStatName_97.9
        jmp dword [nosplit cs:ecx*4+jpt_8A844]
CopyTeamStatName_82:
        mov edi, 1
        jmp short CopyTeamStatName_97.9
CopyTeamStatName_89:
        mov edi, 8
        jmp short CopyTeamStatName_97.9
CopyTeamStatName_90:
        mov edi, 2
        jmp short CopyTeamStatName_97.9
CopyTeamStatName_97:
        mov edi, 4
.9:
        mov eax, esi
        add esi, byte 1Ah
        add edx, ebx
        mov dword [byte ebp-08h], esi
.10:
        movsx ecx, byte [eax]
        cmp edi, dword [nosplit ecx*4+TeamDivisions]
        jne short .11
        mov cl, byte [eax]
        inc ebx
        mov byte [edx], cl
        inc edx
.11:
        inc eax
        cmp eax, dword [byte ebp-08h]
        jne short .10
.12:
        leave
        pop edi
        pop esi
        ret
        push ecx
        push esi
        mov ecx, eax
        mov eax, edx
        xor edx, edx
        jmp short .15
.13:
        movsx esi, byte [eax]
        cmp esi, ecx
        jne short .14
        mov eax, edx
        pop esi
        pop ecx
        ret
.14:
        inc eax
        inc edx
.15:
        cmp edx, ebx
        jl short .13
        mov eax, 63h
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; FindTeamStatRow                                 8A93A  96 PC, low confidence
; Finds a team's row and scrolls to it (SetScrollBarPos)
;-----------------------------------------------------------------------------
FindTeamStatRow:
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov edi, ebx
        mov eax, ecx
        mov ebx, dword [esi]
        mov dword [byte ebp-08h], edi
        mov dword [byte ebp-04h], ebx
        xor ebx, ebx
        jmp short .3
.1:
        movsx ecx, byte [edx]
        cmp ecx, dword [byte ebp-04h]
        jne short .2
        mov edx, ebx
        jmp short .4
.2:
        inc edx
        inc ebx
.3:
        cmp ebx, dword [byte ebp-08h]
        jl short .1
        mov edx, 63h
.4:
        cmp edx, byte 63h
        jne short .5
        xor edx, edx
        call SetScrollBarPos
        mov dword [esi], 63h
        leave
        pop edi
        pop esi
        ret
.5:
        cmp edx, byte 0Eh
        jge short .6
        xor edx, edx
        jmp short .8
.6:
        lea ebx, [byte edi-0Eh]
        cmp edx, ebx
        jle short .7
        mov edx, ebx
        jmp short .8
.7:
        sub edx, byte 4
.8:
        call SetScrollBarPos
        leave
        pop edi
        pop esi
        ret
jpt_8A9A0:
        dd ExportTeamStats_117
        dd ExportTeamStats_11E
        dd ExportTeamStats_12C
        dd ExportTeamStats_125
;-----------------------------------------------------------------------------
; ExportTeamStats                              8A9B0  96 PC, medium confidence
; Asks a file name (text 0D3h) and writes the team stats as text (fopen "wt",
; fprintf)
;-----------------------------------------------------------------------------
ExportTeamStats:
        push esi
        push edi
        enter 38h, 0
        push eax
        push edx
        push ebx
        push ecx
        mov ecx, 14h
        lea edi, [byte ebp-038h]
        xor eax, eax
        rep stosb
        lea eax, [byte ebp-038h]
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
        je near ExportTeamStats_12C.34
        lea eax, [byte ebp-038h]
        call strlen_
        test eax, eax
        je near ExportTeamStats_12C.34
        lea eax, [byte ebp-038h]
        call CheckExportName
        test eax, eax
        jne near ExportTeamStats_12C.34
        mov edx, str_Wt2
        lea eax, [byte ebp-038h]
        mov ecx, 0F0h
        mov ebx, 140h
        call fopen_
        push dword [byte ebp-040h]
        mov edi, eax
        mov esi, eax
        mov eax, 34h
        mov edx, TitleTextStyle
        call GetLangText
        call ShowProgressBox
        mov eax, 0D4h
        call GetLangText
        push eax
        push edi
        call fprintf_
        add esp, byte 8
        cmp dword [byte ebp+010h], byte 0
        jne short .1
        mov eax, 112h
        jmp short .2
.1:
        mov eax, 113h
.2:
        call GetLangText
        push eax
        push edi
        call fprintf_
        add esp, byte 8
        cmp dword [byte ebp-044h], byte 0
        jne short .4
        mov eax, 114h
.3:
        call GetLangText
        push eax
        push esi
        call fprintf_
        add esp, byte 8
        jmp short ExportTeamStats_12C.7
.4:
        cmp dword [byte ebp-044h], byte 1
        jne short .6
        cmp dword [byte ebp-048h], byte 4
        jne short .5
        mov eax, 115h
        jmp short .3
.5:
        mov eax, 116h
        jmp short .3
.6:
        cmp dword [byte ebp-048h], byte 3
        ja short ExportTeamStats_12C.7
        mov eax, dword [byte ebp-048h]
        jmp dword [nosplit cs:eax*4+jpt_8A9A0]
ExportTeamStats_117:
        mov eax, 119h
        jmp short ExportTeamStats.3
ExportTeamStats_11E:
        mov eax, 11Ah
        jmp short ExportTeamStats.3
ExportTeamStats_125:
        mov eax, 11Bh
        jmp short ExportTeamStats.3
ExportTeamStats_12C:
        mov eax, 11Ch
        jmp short ExportTeamStats.3
.7:
        cmp dword [TeamStatSortColumn], byte 0FFFFFFFFh
        jle short .8
        mov eax, dword [TeamStatSortColumn]
        mov eax, dword [nosplit eax*4+TeamStatTextIds]
        call GetLangText
        push eax
        mov eax, 117h
        call GetLangText
        push eax
        push esi
        call fprintf_
        add esp, byte 0Ch
        jmp short .9
.8:
        cmp dword [byte ebp-044h], byte 1
        jne short .9
        mov eax, 118h
        call GetLangText
        push eax
        push esi
        call fprintf_
        add esp, byte 8
.9:
        mov eax, 100h
        call GetLangText
        push eax
        push esi
        xor ecx, ecx
        call fprintf_
        add esp, byte 8
.10:
        mov eax, dword [dword ecx+TeamStatTextIds]
        call GetLangText
        push eax
        push str_S2
        push esi
        mov ebx, ecx
        xor edi, edi
        call fprintf_
        add esp, byte 0Ch
        jmp short .12
.11:
        push str_Space2
        push esi
        inc edi
        call fprintf_
        add esp, byte 8
.12:
        mov eax, dword [dword ebx+TeamStatTextIds]
        mov edx, 0Ah
        call GetLangText
        call strlen_
        sub edx, eax
        cmp edi, edx
        jb short .11
        add ecx, byte 4
        cmp ecx, byte 40h
        jne short .10
        push str_Punct_ExportTeamStats
        push esi
        xor ecx, ecx
        call fprintf_
        add esp, byte 8
        jmp near .33
.13:
        mov eax, ecx
        call UpdateProgressBox
        mov eax, dword [byte ebp-03Ch]
        movsx eax, byte [ecx+eax]
        imul edx, eax, byte 63h
        mov eax, dword [statsfromleague]
        add eax, edx
        lea ebx, [byte eax+05h]
        lea eax, [byte ecx+01h]
        push eax
        push str_D5
        push esi
        call fprintf_
        add esp, byte 0Ch
        cmp ecx, byte 9
        jge short .14
        push str_Space2
        push esi
        call fprintf_
        add esp, byte 8
.14:
        push ebx
        push str_S2
        push esi
        xor edx, edx
        call fprintf_
        add esp, byte 0Ch
        jmp short .16
.15:
        push str_Space2
        push esi
        inc edx
        call fprintf_
        add esp, byte 8
.16:
        mov eax, ebx
        mov edi, 18h
        call strlen_
        sub edi, eax
        cmp edx, edi
        jb short .15
        mov edi, dword [byte ebp-03Ch]
        xor ebx, ebx
        add edi, ecx
.17:
        movsx eax, byte [edi]
        imul eax, byte 28h
        mov eax, dword [dword ebx+eax+TeamStatRowValues]
        movzx eax, byte [eax]
        push eax
        push str_dbgD
        lea eax, [byte ebp-024h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-024h]
        push eax
        push str_S2
        push esi
        xor edx, edx
        call fprintf_
        add esp, byte 0Ch
        jmp short .19
.18:
        push str_Space2
        push esi
        inc edx
        call fprintf_
        add esp, byte 8
.19:
        lea eax, [byte ebp-024h]
        call strlen_
        mov dword [byte ebp-04h], eax
        mov eax, 0Ah
        sub eax, dword [byte ebp-04h]
        cmp edx, eax
        jb short .18
        add ebx, byte 4
        cmp ebx, byte 10h
        jne short .17
        mov dword [byte ebp-08h], 0
        mov ebx, dword [byte ebp-03Ch]
        mov dword [byte ebp-0Ch], 0
        add ebx, ecx
.20:
        cmp dword [byte ebp-08h], byte 1
        jne short .21
        movsx eax, byte [ebx]
        imul eax, byte 30h
        add eax, dword [byte ebp-0Ch]
        mov eax, dword [dword eax+TeamStatColumns+10h]
        movzx eax, word [eax]
        push eax
        push str_D8
        jmp near .27
.21:
        cmp dword [byte ebp-08h], byte 8
        je short .22
        cmp dword [byte ebp-08h], byte 0Bh
        jne short .23
.22:
        movsx edi, byte [ebx]
        imul edi, byte 30h
        add edi, dword [byte ebp-0Ch]
        mov edi, dword [dword edi+TeamStatColumns+10h]
        movzx edi, word [edi]
        mov eax, edi
        mov dword [byte ebp-04h], 0Ah
        cdq
        idiv dword [byte ebp-04h]
        push edx
        mov eax, edi
        mov edi, 0Ah
        cdq
        idiv edi
        push eax
        push str_DD2
        lea eax, [byte ebp-024h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp near .28
.23:
        cmp dword [byte ebp-08h], byte 4
        jne short .25
        movsx eax, byte [ebx]
        imul eax, byte 28h
        add eax, dword [byte ebp-0Ch]
        mov edx, dword [dword eax+TeamStatRows+18h]
        movzx edx, byte [edx]
        mov edi, dword [dword eax+TeamStatRows+14h]
        push edx
        movzx edi, byte [edi]
        mov eax, dword [dword eax+TeamStatRowValues]
.24:
        push edi
        movzx eax, byte [eax]
        push eax
        push str_DDD4
        lea eax, [byte ebp-024h]
        push eax
        call sprintf_
        add esp, byte 14h
        jmp short .28
.25:
        cmp dword [byte ebp-08h], byte 5
        jne short .26
        movsx eax, byte [ebx]
        imul eax, byte 28h
        add eax, dword [byte ebp-0Ch]
        mov edi, dword [dword eax+TeamStatRows+20h]
        movzx edi, byte [edi]
        push edi
        mov edi, dword [dword eax+TeamStatRows+1Ch]
        movzx edi, byte [edi]
        mov eax, dword [dword eax+TeamStatRows+18h]
        jmp short .24
.26:
        movsx eax, byte [ebx]
        imul eax, byte 30h
        add eax, dword [byte ebp-0Ch]
        mov eax, dword [dword eax+TeamStatColumns+10h]
        movzx eax, word [eax]
        push eax
        push str_dbgD
.27:
        lea eax, [byte ebp-024h]
        push eax
        call sprintf_
        add esp, byte 0Ch
.28:
        lea eax, [byte ebp-024h]
        push eax
        push str_S2
        push esi
        xor edi, edi
        call fprintf_
        add esp, byte 0Ch
        jmp short .30
.29:
        push str_Space2
        push esi
        inc edi
        call fprintf_
        add esp, byte 8
.30:
        lea eax, [byte ebp-024h]
        mov edx, 0Ah
        call strlen_
        sub edx, eax
        cmp edi, edx
        jb short .29
        inc dword [byte ebp-08h]
        add dword [byte ebp-0Ch], byte 4
        cmp dword [byte ebp-08h], byte 0Ch
        jl near .20
        push str_Punct_ExportTeamStats
        push esi
        call fprintf_
        add esp, byte 8
        cmp ecx, byte 7
        jne short .32
        cmp dword [TeamStatSortColumn], byte 0
        jge short .32
        cmp dword [byte ebp-044h], byte 1
        jne short .32
        xor ebx, ebx
.31:
        push str_DashExport
        push esi
        inc ebx
        call fprintf_
        add esp, byte 8
        cmp ebx, 0B8h
        jle short .31
        push str_Punct_ExportTeamStats
        push esi
        call fprintf_
        add esp, byte 8
.32:
        inc ecx
.33:
        cmp ecx, dword [byte ebp-040h]
        jl near .13
        call HideProgressBox
        mov eax, esi
        call fclose_
        xor eax, eax
        call GetLangText
        mov dword [byte ebp-010h], eax
        lea eax, [byte ebp-038h]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        jne short .34
        push byte 2
        push byte 1
        push dword 0F0h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp-010h]
        push eax
        mov eax, 22Eh
        mov edx, 1
        call GetLangText
        call MessageBox
.34:
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; BuildTeamStatTables                             8AE90  96 PC, low confidence
; Adds up the season's team stat tables (TeamHomePoints-17E99C) from the games
;-----------------------------------------------------------------------------
BuildTeamStatTables:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 28h, 0
        push eax
        mov dword [byte ebp-08h], 0
        mov dword [byte ebp-028h], 0
        mov dword [byte ebp-024h], TeamPenaltyKillPct
        mov dword [byte ebp-0Ch], TeamPowerPlayPct
        mov dword [byte ebp-010h], TeamRoadPoints
        mov dword [byte ebp-018h], TeamHomePoints
        mov dword [byte ebp-014h], TeamPointsPct
        mov dword [byte ebp-01Ch], TeamPoints
        xor esi, esi
        xor edi, edi
        xor ecx, ecx
.1:
        cmp dword [byte ebp-02Ch], 3E8h
        jge short .2
        mov ebx, dword [statsfromleague]
        add ebx, dword [byte ebp-028h]
        jmp short .3
.2:
        mov ebx, dword [statsplayoffs]
        add ebx, dword [byte ebp-08h]
.3:
        lea eax, [byte ebx+02Fh]
        mov dword [dword edi+TeamStatRowValues], eax
        lea eax, [byte ebx+030h]
        mov dword [dword edi+TeamStatRows+14h], eax
        lea eax, [byte ebx+031h]
        mov dword [dword edi+TeamStatRows+18h], eax
        lea eax, [byte ebx+032h]
        mov dword [dword edi+TeamStatRows+1Ch], eax
        lea eax, [byte ebx+058h]
        mov dword [dword edi+TeamStatRows+20h], eax
        lea eax, [byte ebx+059h]
        mov dword [dword edi+TeamStatRows+24h], eax
        lea eax, [byte ebx+05Ah]
        mov dword [dword edi+TeamStatRows+28h], eax
        lea eax, [byte ebx+054h]
        mov dword [dword edi+TeamStatRows+2Ch], eax
        lea eax, [byte ebx+055h]
        mov dword [dword edi+TeamStatRows+30h], eax
        lea eax, [byte ebx+056h]
        mov dword [dword edi+TeamStatRows+34h], eax
        mov eax, dword [byte ebp-01Ch]
        mov dword [dword esi+TeamStatColumns+10h], eax
        mov eax, dword [byte ebp-014h]
        mov dword [dword esi+TeamStatColumns+14h], eax
        lea eax, [byte ebx+033h]
        mov dword [dword esi+TeamStatColumns+18h], eax
        lea eax, [byte ebx+035h]
        mov dword [dword esi+TeamStatColumns+1Ch], eax
        mov eax, dword [byte ebp-018h]
        mov dword [dword esi+TeamStatColumns+20h], eax
        mov eax, dword [byte ebp-010h]
        mov dword [dword esi+TeamStatColumns+24h], eax
        lea eax, [byte ebx+039h]
        mov dword [dword esi+TeamStatColumns+28h], eax
        lea eax, [byte ebx+037h]
        mov dword [dword esi+TeamStatColumns+2Ch], eax
        mov eax, dword [byte ebp-0Ch]
        mov dword [dword esi+TeamStatColumns+30h], eax
        lea eax, [byte ebx+03Dh]
        mov dword [dword esi+TeamStatColumns+34h], eax
        lea eax, [byte ebx+03Bh]
        mov dword [dword esi+TeamStatColumns+38h], eax
        mov eax, dword [byte ebp-024h]
        mov dword [dword esi+TeamStatColumns+3Ch], eax
        movzx ax, byte [byte ebx+030h]
        movzx dx, byte [byte ebx+032h]
        add eax, eax
        add eax, edx
        mov word [dword ecx+TeamPoints], ax
        movzx ax, byte [byte ebx+058h]
        add eax, eax
        mov dword [byte ebp-04h], eax
        movzx ax, byte [byte ebx+05Ah]
        add eax, dword [byte ebp-04h]
        mov word [dword ecx+TeamHomePoints], ax
        movzx ax, byte [byte ebx+054h]
        add eax, eax
        mov dword [byte ebp-04h], eax
        movzx ax, byte [byte ebx+056h]
        add eax, dword [byte ebp-04h]
        mov word [dword ecx+TeamRoadPoints], ax
        cmp byte [byte ebx+02Fh], 0
        je short .4
        movzx eax, word [dword ecx+TeamPoints]
        imul eax, dword 3E8h
        movzx edx, byte [byte ebx+02Fh]
        add edx, edx
        mov dword [byte ebp-020h], edx
        cdq
        idiv dword [byte ebp-020h]
        mov word [dword ecx+TeamPointsPct], ax
        jmp short .5
.4:
        mov word [dword ecx+TeamPointsPct], 0
.5:
        cmp word [byte ebx+039h], byte 0
        je short .6
        movzx eax, word [byte ebx+037h]
        imul eax, dword 3E8h
        movzx edx, word [byte ebx+039h]
        mov dword [byte ebp-020h], edx
        cdq
        idiv dword [byte ebp-020h]
        mov word [dword ecx+TeamPowerPlayPct], ax
        jmp short .7
.6:
        mov word [dword ecx+TeamPowerPlayPct], 0
.7:
        movzx eax, word [dword ecx+TeamPowerPlayPct]
        cmp eax, 3E8h
        jle short .8
        mov word [dword ecx+TeamPowerPlayPct], 3E8h
.8:
        cmp word [byte ebx+03Dh], byte 0
        je short .9
        movzx eax, word [byte ebx+03Bh]
        imul eax, dword 3E8h
        movzx edx, word [byte ebx+03Dh]
        mov dword [byte ebp-020h], edx
        cdq
        idiv dword [byte ebp-020h]
        mov edx, 3E8h
        sub edx, eax
        mov word [dword ecx+TeamPenaltyKillPct], dx
        jmp short .10
.9:
        mov word [dword ecx+TeamPenaltyKillPct], 0
.10:
        mov ax, word [byte ebx+03Bh]
        cmp ax, word [byte ebx+03Dh]
        jbe short .11
        mov word [dword ecx+TeamPenaltyKillPct], 0
.11:
        add dword [byte ebp-08h], 31Bh
        add dword [byte ebp-028h], byte 63h
        add dword [byte ebp-024h], byte 2
        add dword [byte ebp-0Ch], byte 2
        add dword [byte ebp-010h], byte 2
        add dword [byte ebp-018h], byte 2
        add dword [byte ebp-014h], byte 2
        add dword [byte ebp-01Ch], byte 2
        add esi, byte 30h
        inc ecx
        inc ecx
        add edi, byte 28h
        cmp ecx, byte 34h
        jne near .1
BuildTeamStatTables_265:
        leave
BuildTeamStatTables_266:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DumpSaveTimes                                   8B0FC  96 PC, low confidence
; Debug: writes savetime.out ("[%d][4] = {" tables)
;-----------------------------------------------------------------------------
DumpSaveTimes:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 28h, 0
        push eax
        mov dword [byte ebp-024h], 0
        mov dword [byte ebp-08h], 0
        mov dword [byte ebp-028h], TeamPenaltyKillPct
        mov dword [byte ebp-0Ch], TeamPowerPlayPct
        mov dword [byte ebp-010h], TeamRoadPoints
        mov dword [byte ebp-018h], TeamHomePoints
        mov dword [byte ebp-014h], TeamPointsPct
        mov dword [byte ebp-01Ch], TeamPoints
        xor ecx, ecx
        xor edi, edi
        xor esi, esi
.1:
        cmp dword [byte ebp-02Ch], 3E8h
        jge short .2
        mov ebx, dword [statsfromleague]
        add ebx, dword [byte ebp-08h]
        jmp short .3
.2:
        mov ebx, dword [statsplayoffs]
        add ebx, dword [byte ebp-024h]
.3:
        lea eax, [byte ebx+041h]
        mov dword [dword edi+TeamStatRowValues], eax
        lea eax, [byte ebx+042h]
        mov dword [dword edi+TeamStatRows+14h], eax
        lea eax, [byte ebx+043h]
        mov dword [dword edi+TeamStatRows+18h], eax
        lea eax, [byte ebx+044h]
        mov dword [dword edi+TeamStatRows+1Ch], eax
        lea eax, [byte ebx+060h]
        mov dword [dword edi+TeamStatRows+20h], eax
        lea eax, [byte ebx+061h]
        mov dword [dword edi+TeamStatRows+24h], eax
        lea eax, [byte ebx+062h]
        mov dword [dword edi+TeamStatRows+28h], eax
        lea eax, [byte ebx+05Ch]
        mov dword [dword edi+TeamStatRows+2Ch], eax
        lea eax, [byte ebx+05Dh]
        mov dword [dword edi+TeamStatRows+30h], eax
        lea eax, [byte ebx+05Eh]
        mov dword [dword edi+TeamStatRows+34h], eax
        mov eax, dword [byte ebp-01Ch]
        mov dword [dword ecx+TeamStatColumns+10h], eax
        mov eax, dword [byte ebp-014h]
        mov dword [dword ecx+TeamStatColumns+14h], eax
        lea eax, [byte ebx+045h]
        mov dword [dword ecx+TeamStatColumns+18h], eax
        lea eax, [byte ebx+047h]
        mov dword [dword ecx+TeamStatColumns+1Ch], eax
        mov eax, dword [byte ebp-018h]
        mov dword [dword ecx+TeamStatColumns+20h], eax
        mov eax, dword [byte ebp-010h]
        mov dword [dword ecx+TeamStatColumns+24h], eax
        lea eax, [byte ebx+04Bh]
        mov dword [dword ecx+TeamStatColumns+28h], eax
        lea eax, [byte ebx+049h]
        mov dword [dword ecx+TeamStatColumns+2Ch], eax
        mov eax, dword [byte ebp-0Ch]
        mov dword [dword ecx+TeamStatColumns+30h], eax
        lea eax, [byte ebx+04Fh]
        mov dword [dword ecx+TeamStatColumns+34h], eax
        lea eax, [byte ebx+04Dh]
        mov dword [dword ecx+TeamStatColumns+38h], eax
        mov eax, dword [byte ebp-028h]
        mov dword [dword ecx+TeamStatColumns+3Ch], eax
        movzx ax, byte [byte ebx+042h]
        movzx dx, byte [byte ebx+044h]
        add eax, eax
        add eax, edx
        mov word [dword esi+TeamPoints], ax
        movzx ax, byte [byte ebx+060h]
        add eax, eax
        mov dword [byte ebp-04h], eax
        movzx ax, byte [byte ebx+062h]
        add eax, dword [byte ebp-04h]
        mov word [dword esi+TeamHomePoints], ax
        movzx ax, byte [byte ebx+05Ch]
        movzx dx, byte [byte ebx+05Eh]
        add eax, eax
        add eax, edx
        mov word [dword esi+TeamRoadPoints], ax
        cmp byte [byte ebx+041h], 0
        je short .4
        movzx eax, word [dword esi+TeamPoints]
        imul eax, dword 3E8h
        movzx edx, byte [byte ebx+041h]
        add edx, edx
        mov dword [byte ebp-020h], edx
        cdq
        idiv dword [byte ebp-020h]
        mov word [dword esi+TeamPointsPct], ax
        jmp short .5
.4:
        mov word [dword esi+TeamPointsPct], 0
.5:
        cmp word [byte ebx+04Bh], byte 0
        je short .6
        movzx eax, word [byte ebx+049h]
        imul eax, dword 3E8h
        movzx edx, word [byte ebx+04Bh]
        mov dword [byte ebp-020h], edx
        cdq
        idiv dword [byte ebp-020h]
        mov word [dword esi+TeamPowerPlayPct], ax
        jmp short .7
.6:
        mov word [dword esi+TeamPowerPlayPct], 0
.7:
        cmp word [byte ebx+04Fh], byte 0
        je short .8
        movzx eax, word [byte ebx+04Dh]
        imul eax, dword 3E8h
        movzx ebx, word [byte ebx+04Fh]
        cdq
        idiv ebx
        mov edx, 3E8h
        sub edx, eax
        mov word [dword esi+TeamPenaltyKillPct], dx
        jmp short .9
.8:
        mov word [dword esi+TeamPenaltyKillPct], 0
.9:
        add dword [byte ebp-024h], 31Bh
        add dword [byte ebp-08h], byte 63h
        add dword [byte ebp-028h], byte 2
        add dword [byte ebp-0Ch], byte 2
        add dword [byte ebp-010h], byte 2
        add dword [byte ebp-018h], byte 2
        add dword [byte ebp-014h], byte 2
        add dword [byte ebp-01Ch], byte 2
        add ecx, byte 30h
        inc esi
        inc esi
        add edi, byte 28h
        cmp esi, byte 34h
        jne near .1
        jmp near BuildTeamStatTables_265
        push ebx
        push ecx
        push esi
        push edi
        enter 80h, 0
        push eax
        push edx
        sub ebp, 82h
        mov esi, eax
        xor edi, edi
        jmp near .47
.10:
        mov dword [byte ebp+046h], 0F423Fh
        mov dword [byte ebp+076h], 0
        mov dword [byte ebp+07Ah], edi
        mov edx, esi
        jmp near .18
.11:
        mov ecx, dword [byte edx+03Eh]
        jmp near .16
.12:
        mov dword [byte ebp+072h], 0
        mov ebx, dword [byte ebp-02h]
        jmp short .15
.13:
        cmp ecx, dword [byte ebx+03Eh]
        jne short .14
        mov eax, ecx
        sub eax, dword [byte edx+03Eh]
        mov dword [byte ebp+016h], eax
        fild dword [byte edx+03Ah]
        neg dword [byte ebp+016h]
        fstp dword [byte ebp+02Eh]
        fild dword [byte ebp+016h]
        fmul dword [byte ebp+076h]
        fstp dword [byte ebp+03Ah]
        fld dword [byte ebp+02Eh]
        fsub dword [byte ebp+03Ah]
        fild dword [byte ebx+03Ah]
        fstp dword [byte ebp+01Ah]
        fcomp dword [byte ebp+01Ah]
        fnstsw ax
        sahf
        jae short .14
        fld dword [byte ebp+02Eh]
        fadd dword [byte ebp+03Ah]
        fcomp dword [byte ebp+01Ah]
        fnstsw ax
        sahf
        jbe short .14
        mov eax, dword [byte edx+03Ah]
        mov dword [byte ebp+07Eh], eax
        mov eax, dword [byte ebx+03Ah]
        sub dword [byte ebp+07Eh], eax
        mov eax, dword [byte ebp+07Eh]
        call abs_
        cmp eax, dword [byte ebp+046h]
        jge short .14
        mov dword [byte ebp+046h], eax
        mov eax, dword [byte ebp+072h]
        mov dword [byte ebp+07Ah], eax
.14:
        inc dword [byte ebp+072h]
        add ebx, byte 66h
.15:
        mov eax, dword [byte ebp+072h]
        cmp eax, dword [byte ebp-06h]
        jl short .13
.16:
        dec ecx
        cmp ecx, 0FFFFFC18h
        jle short .17
        cmp edi, dword [byte ebp+07Ah]
        je near .12
.17:
        fld dword [byte ebp+076h]
        fld st0
        fadd qword [F64_0p1]
        fstp st1
        fstp dword [byte ebp+076h]
.18:
        fld1
        fcomp dword [byte ebp+076h]
        fnstsw ax
        sahf
        jbe short .19
        cmp edi, dword [byte ebp+07Ah]
        je near .11
.19:
        imul edx, dword [byte ebp+07Ah], byte 66h
        push dword 0FFh
        add edx, dword [byte ebp-02h]
        push dword [byte edx+03Eh]
        push dword [byte edx+03Ah]
        mov dword [byte ebp+056h], 0F423Fh
        push dword [byte esi+03Eh]
        mov dword [byte ebp+066h], 0
        push dword [byte esi+03Ah]
        mov dword [byte ebp+012h], esi
        call FillRectColor
        mov al, byte [byte ebp+07Ah]
        add esp, byte 14h
        mov ebx, esi
        mov dword [byte ebp+07Ah], edi
        mov byte [byte esi+042h], al
        jmp near .27
.20:
        mov ecx, dword [byte ebp+012h]
        mov ecx, dword [byte ecx+03Eh]
        jmp near .25
.21:
        mov dword [byte ebp+05Eh], 0
        mov edx, dword [byte ebp-02h]
        jmp short .24
.22:
        cmp ecx, dword [byte edx+03Eh]
        jne short .23
        mov eax, ecx
        sub eax, dword [byte ebx+03Eh]
        fild dword [byte ebx+03Ah]
        mov dword [byte ebp+07Eh], eax
        fstp dword [byte ebp+03Eh]
        fild dword [byte ebp+07Eh]
        fmul dword [byte ebp+066h]
        fstp dword [byte ebp+01Eh]
        fld dword [byte ebp+03Eh]
        fsub dword [byte ebp+01Eh]
        fild dword [byte edx+03Ah]
        fstp dword [byte ebp+036h]
        fcomp dword [byte ebp+036h]
        fnstsw ax
        sahf
        jae short .23
        fld dword [byte ebp+03Eh]
        fadd dword [byte ebp+01Eh]
        fcomp dword [byte ebp+036h]
        fnstsw ax
        sahf
        jbe short .23
        mov eax, dword [byte ebx+03Ah]
        mov dword [byte ebp+07Eh], eax
        mov eax, dword [byte edx+03Ah]
        sub dword [byte ebp+07Eh], eax
        mov eax, dword [byte ebp+07Eh]
        call abs_
        cmp eax, dword [byte ebp+056h]
        jge short .23
        mov dword [byte ebp+056h], eax
        mov eax, dword [byte ebp+05Eh]
        mov dword [byte ebp+07Ah], eax
.23:
        inc dword [byte ebp+05Eh]
        add edx, byte 66h
.24:
        mov eax, dword [byte ebp+05Eh]
        cmp eax, dword [byte ebp-06h]
        jl short .22
.25:
        inc ecx
        cmp ecx, 5C8h
        jge short .26
        cmp edi, dword [byte ebp+07Ah]
        je near .21
.26:
        fld dword [byte ebp+066h]
        fld st0
        fadd qword [F64_0p1]
        fstp st1
        fstp dword [byte ebp+066h]
.27:
        fld1
        fcomp dword [byte ebp+066h]
        fnstsw ax
        sahf
        jbe short .28
        cmp edi, dword [byte ebp+07Ah]
        je near .20
.28:
        imul edx, dword [byte ebp+07Ah], byte 66h
        push dword 0FEh
        add edx, dword [byte ebp-02h]
        push dword [byte edx+03Eh]
        push dword [byte edx+03Ah]
        mov dword [byte ebp+052h], 0F423Fh
        push dword [byte esi+03Eh]
        mov dword [byte ebp+062h], 0
        push dword [byte esi+03Ah]
        mov dword [byte ebp+0Ah], esi
        call FillRectColor
        mov al, byte [byte ebp+07Ah]
        add esp, byte 14h
        mov ebx, esi
        mov dword [byte ebp+07Ah], edi
        mov byte [byte esi+043h], al
        jmp near .36
.29:
        mov ecx, dword [byte ebp+0Ah]
        mov ecx, dword [byte ecx+03Ah]
        jmp near .34
.30:
        mov dword [byte ebp+06Eh], 0
        mov edx, dword [byte ebp-02h]
        jmp short .33
.31:
        cmp ecx, dword [byte edx+03Ah]
        jne short .32
        mov eax, ecx
        sub eax, dword [byte ebx+03Ah]
        fild dword [byte ebx+03Eh]
        mov dword [byte ebp+07Eh], eax
        fstp dword [byte ebp+026h]
        fild dword [byte ebp+07Eh]
        fmul dword [byte ebp+062h]
        fstp dword [byte ebp+042h]
        fld dword [byte ebp+026h]
        fsub dword [byte ebp+042h]
        fild dword [byte edx+03Eh]
        fstp dword [byte ebp+022h]
        fcomp dword [byte ebp+022h]
        fnstsw ax
        sahf
        jae short .32
        fld dword [byte ebp+026h]
        fadd dword [byte ebp+042h]
        fcomp dword [byte ebp+022h]
        fnstsw ax
        sahf
        jbe short .32
        mov eax, dword [byte ebx+03Eh]
        mov dword [byte ebp+07Eh], eax
        mov eax, dword [byte edx+03Eh]
        sub dword [byte ebp+07Eh], eax
        mov eax, dword [byte ebp+07Eh]
        call abs_
        cmp eax, dword [byte ebp+052h]
        jge short .32
        mov dword [byte ebp+052h], eax
        mov eax, dword [byte ebp+06Eh]
        mov dword [byte ebp+07Ah], eax
.32:
        inc dword [byte ebp+06Eh]
        add edx, byte 66h
.33:
        mov eax, dword [byte ebp+06Eh]
        cmp eax, dword [byte ebp-06h]
        jl short .31
.34:
        inc ecx
        cmp ecx, 668h
        jge short .35
        cmp edi, dword [byte ebp+07Ah]
        je near .30
.35:
        fld dword [byte ebp+062h]
        fld st0
        fadd qword [F64_0p1]
        fstp st1
        fstp dword [byte ebp+062h]
.36:
        fld1
        fcomp dword [byte ebp+062h]
        fnstsw ax
        sahf
        jbe short .37
        cmp edi, dword [byte ebp+07Ah]
        je near .29
.37:
        imul edx, dword [byte ebp+07Ah], byte 66h
        push dword 0FDh
        add edx, dword [byte ebp-02h]
        push dword [byte edx+03Eh]
        push dword [byte edx+03Ah]
        mov dword [byte ebp+04Eh], 0F423Fh
        push dword [byte esi+03Eh]
        mov dword [byte ebp+05Ah], 0
        push dword [byte esi+03Ah]
        mov dword [byte ebp+0Eh], esi
        call FillRectColor
        mov al, byte [byte ebp+07Ah]
        add esp, byte 14h
        mov ebx, esi
        mov dword [byte ebp+07Ah], edi
        mov byte [byte esi+045h], al
        jmp near .45
.38:
        mov eax, dword [byte ebp+0Eh]
        mov ecx, dword [byte eax+03Ah]
        jmp near .43
.39:
        mov dword [byte ebp+06Ah], 0
        mov edx, dword [byte ebp-02h]
        jmp short .42
.40:
        cmp ecx, dword [byte edx+03Ah]
        jne short .41
        mov eax, ecx
        sub eax, dword [byte ebx+03Ah]
        mov dword [byte ebp+07Eh], eax
        fild dword [byte ebx+03Eh]
        neg dword [byte ebp+07Eh]
        fstp dword [byte ebp+02Ah]
        fild dword [byte ebp+07Eh]
        fmul dword [byte ebp+05Ah]
        fstp dword [byte ebp+032h]
        fld dword [byte ebp+02Ah]
        fsub dword [byte ebp+032h]
        fild dword [byte edx+03Eh]
        fstp dword [byte ebp+04Ah]
        fcomp dword [byte ebp+04Ah]
        fnstsw ax
        sahf
        jae short .41
        fld dword [byte ebp+02Ah]
        fadd dword [byte ebp+032h]
        fcomp dword [byte ebp+04Ah]
        fnstsw ax
        sahf
        jbe short .41
        mov eax, dword [byte ebx+03Eh]
        mov dword [byte ebp+07Eh], eax
        mov eax, dword [byte edx+03Eh]
        sub dword [byte ebp+07Eh], eax
        mov eax, dword [byte ebp+07Eh]
        call abs_
        cmp eax, dword [byte ebp+04Eh]
        jge short .41
        mov dword [byte ebp+04Eh], eax
        mov eax, dword [byte ebp+06Ah]
        mov dword [byte ebp+07Ah], eax
.41:
        inc dword [byte ebp+06Ah]
        add edx, byte 66h
.42:
        mov eax, dword [byte ebp+06Ah]
        cmp eax, dword [byte ebp-06h]
        jl short .40
.43:
        dec ecx
        cmp ecx, 0FFFFFC18h
        jle short .44
        cmp edi, dword [byte ebp+07Ah]
        je near .39
.44:
        fld dword [byte ebp+05Ah]
        fld st0
        fadd qword [F64_0p1]
        fstp st1
        fstp dword [byte ebp+05Ah]
.45:
        fld1
        fcomp dword [byte ebp+05Ah]
        fnstsw ax
        sahf
        jbe short .46
        cmp edi, dword [byte ebp+07Ah]
        je near .38
.46:
        imul edx, dword [byte ebp+07Ah], byte 66h
        push dword 0FCh
        add edx, dword [byte ebp-02h]
        push dword [byte edx+03Eh]
        add esi, byte 66h
        push dword [byte edx+03Ah]
        push dword [byte esi-028h]
        push dword [byte esi-02Ch]
        inc edi
        call FillRectColor
        mov al, byte [byte ebp+07Ah]
        add esp, byte 14h
        mov byte [byte esi-022h], al
.47:
        cmp edi, dword [byte ebp-06h]
        jl near .10
        mov edx, str_Wt2
        mov eax, str_SavetimeOut
        call fopen_
        push dword [byte ebp-06h]
        push str_D42
        mov esi, dword [byte ebp-02h]
        push eax
        xor ebx, ebx
        mov edx, eax
        call fprintf_
        add esp, byte 0Ch
        jmp short .49
.48:
        movzx eax, byte [byte esi+045h]
        push eax
        movzx eax, byte [byte esi+044h]
        push eax
        movzx eax, byte [byte esi+043h]
        push eax
        movzx eax, byte [byte esi+042h]
        push eax
        push str_spDDDD
        push edx
        add esi, byte 66h
        inc ebx
        call fprintf_
        add esp, byte 18h
.49:
        cmp ebx, dword [byte ebp-06h]
        jl short .48
        push str_Punct_DumpSaveTimes
        push edx
        call fprintf_
        add esp, byte 8
        mov eax, edx
        call fclose_
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CheckExportName                              8B7BB  96 PC, medium confidence
; Checks an export file name (path, ".TXT", spaces); a message box if it is
; not good
;-----------------------------------------------------------------------------
CheckExportName:
        push ebx
        push ecx
        push edx
        push esi
        enter 6Ch, 0
        mov esi, eax
        xor eax, eax
        call GetLangText
        mov dword [byte ebp-08h], eax
        mov eax, 1
        call GetLangText
        mov dword [byte ebp-04h], eax
        mov eax, esi
        call strlen_
        mov ebx, eax
        lea edx, [eax+esi]
        jmp short .2
.1:
        dec edx
        dec ebx
.2:
        test ebx, ebx
        jle short .3
        movsx eax, byte [edx]
        cmp eax, byte 5Ch
        jne short .1
.3:
        add esi, ebx
        mov edx, esi
        xor ebx, ebx
        jmp short .7
.4:
        movsx eax, byte [edx]
        cmp eax, byte 20h
        jne short .5
        mov byte [edx], 5Fh
.5:
        movsx eax, byte [edx]
        cmp eax, byte 2Eh
        jne short .6
        mov byte [edx], 0
.6:
        inc edx
        inc ebx
.7:
        mov eax, esi
        call strlen_
        cmp ebx, eax
        jb short .4
        mov edx, str_TXT
        mov eax, esi
        call strcat_
        push esi
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        je short .8
        push esi
        mov eax, 224h
        call GetLangText
        push eax
        lea eax, [byte ebp-06Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push byte 2
        push byte 1
        push dword 0F0h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp-08h]
        push byte 0
        mov edx, 2
        lea eax, [byte ebp-06Ch]
        call MessageBox
.8:
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
PlayerStatsNavLinks:
        db 02h,00h,00h,05h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01h,0Ch,01h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02h,011h,02h,03h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,012h,02h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,013h,03h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 08h,05h,00h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04Fh,06h,05h,07h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,07h,06h,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04Dh,05h,00h,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04Dh,05h,00h,050h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 051h,0Ah,08h,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 051h,0Bh,08h,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Ch,0Eh,015h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Dh,0Eh,015h,0Dh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Eh,0Eh,04Bh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Ch,0Fh,04Bh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 010h,00h,010h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02h,016h,02h,012h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,017h,011h,013h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,018h,012h,014h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,019h,013h,015h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,01Ah,014h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 011h,01Bh,00h,017h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 012h,01Ch,016h,018h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 013h,01Dh,017h,019h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 014h,01Eh,018h,01Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 015h,01Fh,019h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 016h,020h,00h,01Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 017h,021h,01Bh,01Dh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 018h,022h,01Ch,01Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 019h,023h,01Dh,01Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Ah,024h,01Eh,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Bh,025h,00h,021h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Ch,026h,020h,022h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Dh,027h,021h,023h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Eh,028h,022h,024h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Fh,029h,023h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 020h,02Ah,00h,026h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 021h,02Bh,025h,027h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 022h,02Ch,026h,028h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 023h,02Dh,027h,029h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 024h,02Eh,028h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 025h,02Fh,00h,02Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 026h,030h,02Ah,02Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 027h,031h,02Bh,02Dh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 028h,032h,02Ch,02Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 029h,033h,02Dh,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02Ah,034h,00h,030h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02Bh,035h,02Fh,031h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02Ch,036h,030h,032h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02Dh,037h,031h,033h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02Eh,038h,032h,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02Fh,039h,00h,035h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 030h,03Ah,034h,036h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 031h,03Bh,035h,037h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 032h,03Ch,036h,038h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 033h,03Dh,037h,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 034h,03Eh,00h,03Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 035h,03Fh,039h,03Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 036h,040h,03Ah,03Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 037h,041h,03Bh,03Dh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 038h,042h,03Ch,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 039h,043h,00h,03Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Ah,044h,03Eh,040h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Bh,045h,03Fh,041h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Ch,046h,040h,042h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Dh,047h,041h,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Eh,048h,00h,044h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03Fh,049h,043h,045h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 040h,04Ah,044h,046h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 041h,04Bh,045h,047h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 042h,04Ch,046h,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 043h,04Dh,00h,049h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 044h,04Eh,048h,04Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 045h,04Fh,049h,04Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 046h,050h,04Ah,04Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 047h,051h,04Bh,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 048h,09h,08h,04Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 049h,06h,04Dh,04Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04Ah,07h,04Eh,050h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04Bh,0Bh,04Fh,051h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04Ch,0Bh,050h,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
str_U_PlayerStatsScreen:
        db 075h,00h,00h,00h,067h,00h,00h,00h,0F7h,00h,00h,00h,067h,00h,00h,00h
        db 0F7h,00h,00h,00h,082h,00h,00h,00h,075h,00h,00h,00h,082h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0FCh,00h,00h,00h,067h,00h,00h,00h,07Eh,01h,00h,00h,067h,00h,00h,00h
        db 07Eh,01h,00h,00h,082h,00h,00h,00h,0FCh,00h,00h,00h,082h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 083h,01h,00h,00h,067h,00h,00h,00h,05h,02h,00h,00h,067h,00h,00h,00h
        db 05h,02h,00h,00h,083h,00h,00h,00h,084h,01h,00h,00h,083h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 063h,00h,00h,00h,0C8h,01h,00h,00h,06Bh,00h,00h,00h,0BFh,01h,00h,00h
        db 0D9h,00h,00h,00h,0BFh,01h,00h,00h,0E2h,00h,00h,00h,0CAh,01h,00h,00h
        db 0D9h,00h,00h,00h,0D5h,01h,00h,00h,06Ch,00h,00h,00h,0D3h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0F3h,00h,00h,00h,0C9h,01h,00h,00h,0F9h,00h,00h,00h,0BFh,01h,00h,00h
        db 076h,01h,00h,00h,0BFh,01h,00h,00h,081h,01h,00h,00h,0C9h,01h,00h,00h
        db 079h,01h,00h,00h,0D3h,01h,00h,00h,0FAh,00h,00h,00h,0D4h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 091h,01h,00h,00h,0C9h,01h,00h,00h,096h,01h,00h,00h,0C0h,01h,00h,00h
        db 016h,02h,00h,00h,0BFh,01h,00h,00h,020h,02h,00h,00h,0C9h,01h,00h,00h
        db 016h,02h,00h,00h,0D4h,01h,00h,00h,09Ah,01h,00h,00h,0D5h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
PlayerStatsColumnLabels:
        dd str_DEF
        dd str_ALL
        dd str_FOR
        dd str_GOL
        dd str_PLR
        dd str_PLY3
        dd str_ROK
        dd str_SEA3
        push ebx
        mov ebx, dword [nosplit eax*8+PlayerStatsTabArt]
        mov dword [byte edx+01Ah], ebx
        mov eax, dword [nosplit eax*8+PlayerStatsTabLit]
        mov dword [byte edx+01Eh], eax
        pop ebx
        ret
