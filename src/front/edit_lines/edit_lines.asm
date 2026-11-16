; The edit lines screen and the automatic lines (96 PC).
bits 32
%include "hockey.inc"
extern BottomBarArt
extern SideBarArt
section s_9CB19 progbits alloc exec nowrite align=1
extern hmrosterflags, HmGoalieSwapped, TitleTextStyle, PlayerPosCodes, LinesSlotTable
extern LinesWorkTable


extern DrawArtOpaque, DrawColorText, DrawFrameAt, DrawScrollBar, TeamDb, statsplayoffs
extern MenuMouseX, MenuMouseY, RosterDbPtrs, RosterPlayerIds, ForwardLineSlots, DefenceLineSlots, LinesPanelEvenX, LinesPanelEvenY
extern LinesPanelEvenNav, LinesPanelPowerX, LinesPanelPowerY, LinesPanelPowerNav, LinesPanelKillX, LinesPanelKillY, LinesPanelKillNav, LinesSlotMap
extern LinesHeaderTextId, LinesTextIds, LinesIntroOn, MenuCursorPixels, pointerspr, hmtmlines, hmtmroster, TeamStatsBitmap
extern PlayerRecPtrs, PlayerHeightPtrs, PlayerWeightPtrs
extern RatingsPlayerId, EditLinesBuffer, RosterFirstNamePtrs, RosterJerseyPtrs, RosterPlayerPtrs, RosterProfilePtrs, RosterLastNamePtrs, LinesSortedPlayers
extern LinesPanelItems

extern LinesPanelPlayers, LinesPlayerOrder, LinesPlayerScore, LinesCursorArt
extern LinesHoverArt, LinesIntroTeam, LinesCardSource, LinesEditAway, LinesEditMode, LinesEditTeam, FadeOut, FadePalette
extern FileClose, FileOpenWrite, FileWriteAt, FillMusicStream, FreeScrollBar, gameopts, GetLangText, hmroster
extern hmrosterpos, InitMenuItems, InitVScrollBar, LoadExhibitionStats, LoadPackedFile, LoadPlayoffStats, LoadSeasonStats, MakeDataPath
extern MakePlayoffDbPath, MakeSeasonDbPath, MessageBox, MusicDone, OpenScreen, optflags, PlayerCardScreen, PlayMusic
extern PutBlock, qsort_, RunMenu, ScrollBarDown, ScrollBarToMouse, ScrollBarUp, SetDrawBitmap, SetScreenColors
extern SetScreenPalette, SetTeamGoalie, SetTextColors, SetTickDeadline, SlideInSideBar, SlideInTitleBar, SoundIdle, SoundSecondsToBytes
extern sprintf_, str_Ball6, str_Bh01, str_Bh09, str_Bh17, str_Bkgd20, str_Bkpk, str_Bkpp
extern str_Bt018, str_Bt02d4, str_Bt092, str_Bt17, str_CD2, str_CS4, str_DBPTRs3, str_DonrussCards
extern str_Drs1, str_Drs2, str_Drs3, str_FName3, str_HeightNWeight3, str_Jers, str_Jrhl, str_LinesSort
extern str_LName3, str_Nhl1, str_Nhl2, str_Nhl3, str_Pal28, str_Player3, str_Profiles3, str_Scr12
extern str_Scr22, str_Scr3, str_Sld12, str_Sldw, str_Slid2, str_Slu12, str_Slup, str_Sta13
extern str_Sta23, str_Sta33, str_StatDBPTRs3, strcmp_, strcpy_, LoadDataFileLib, PlayerDbRecord, StatsDb2Record
extern DrawArt, DrawShape, AllocMemBlock, FreeMemBlock, CreateBitmap, FreeBitmap, DrawArtOpaqueAtOwnPos, SetScreenTarget
extern FindShape, ClearClipRect, TickDeadlinePassed, hmglattr, hmplattr, hmteamrec, EditLinesRecords, MenuViewStored
extern hmscore, awscore
global unk_9CB19, CompareRosterOrder, ComparePlayerPos, PositionOrder, EditLinesHoverPanel, RunEditLines, EditLinesScreen, LinesValid
global CountLineSlots, CountLineSlots_4DD, HasDuplicateInLine, HasDuplicateInLine_45, DrawLinesPanel, DrawLineJersey, DrawLineJersey_104, DrawLinesPlayerList
global SortTeamPlayers, AutoSetLines, FindUnusedLinePlayer
unk_9CB19:
        db 08Fh,00h,00h,00h,055h,00h,00h,00h,035h,01h,00h,00h,055h,00h,00h,00h
        db 035h,01h,00h,00h,073h,00h,00h,00h,090h,00h,00h,00h,073h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 09Fh,00h,00h,00h,0C8h,01h,00h,00h,0AAh,00h,00h,00h,0BBh,01h,00h,00h
        db 01Fh,01h,00h,00h,0BBh,01h,00h,00h,02Dh,01h,00h,00h,0CBh,01h,00h,00h
        db 01Ch,01h,00h,00h,0D4h,01h,00h,00h,0ABh,00h,00h,00h,0D3h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0ADh,01h,00h,00h,0A7h,01h,00h,00h,0B4h,01h,00h,00h,09Ah,01h,00h,00h
        db 02Eh,02h,00h,00h,09Ah,01h,00h,00h,036h,02h,00h,00h,0A7h,01h,00h,00h
        db 02Bh,02h,00h,00h,0B3h,01h,00h,00h,0B8h,01h,00h,00h,0B2h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0ADh,01h,00h,00h,0C9h,01h,00h,00h,0B4h,01h,00h,00h,0BDh,01h,00h,00h
        db 02Ch,02h,00h,00h,0BDh,01h,00h,00h,035h,02h,00h,00h,0C9h,01h,00h,00h
        db 02Ch,02h,00h,00h,0D5h,01h,00h,00h,0B6h,01h,00h,00h,0D4h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; CompareRosterOrder                              9CC19  96 PC, low confidence
; Qsort compare by LinesPlayerScore
;-----------------------------------------------------------------------------
CompareRosterOrder:
        push ebx
        mov edx, dword [edx]
        mov ebx, dword [eax]
        mov eax, dword [nosplit edx*4+LinesPlayerScore]
        sub eax, dword [nosplit ebx*4+LinesPlayerScore]
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ComparePlayerPos                             9CC2E  96 PC, medium confidence
; Qsort compare of two players by position (PositionOrder), then name
;-----------------------------------------------------------------------------
ComparePlayerPos:
        push ebx
        push ecx
        push esi
        mov ebx, eax
        mov ecx, edx
        mov edx, dword [eax]
        mov esi, dword [ecx]
        mov edx, dword [nosplit edx*4+LinesPlayerOrder]
        mov esi, dword [nosplit esi*4+LinesPlayerOrder]
        mov dl, byte [byte edx+02h]
        mov dh, byte [byte esi+02h]
        cmp dl, 47h
        jb short .1
        jbe short .6
        cmp dl, 4Ch
        jb short .7
        jbe short .2
        cmp dl, 52h
        je short .4
        jmp short .7
.1:
        cmp dl, 43h
        jb short .7
        jbe short .3
        cmp dl, 44h
        je short .5
        jmp short .7
.2:
        xor esi, esi
        jmp short .8
.3:
        mov esi, 1
        jmp short .8
.4:
        mov esi, 2
        jmp short .8
.5:
        mov esi, 3
        jmp short .8
.6:
        mov esi, 4
        jmp short .8
.7:
        mov esi, 0FFFFFFFFh
.8:
        movsx eax, dh
        call PositionOrder
        cmp esi, eax
        je near .17
        cmp dl, 47h
        jb short .9
        jbe short .14
        cmp dl, 4Ch
        jb short .15
        jbe short .10
        cmp dl, 52h
        je short .12
        jmp short .15
.9:
        cmp dl, 43h
        jb short .15
        jbe short .11
        cmp dl, 44h
        je short .13
        jmp short .15
.10:
        xor ebx, ebx
        jmp short .16
.11:
        mov ebx, 1
        jmp short .16
.12:
        mov ebx, 2
        jmp short .16
.13:
        mov ebx, 3
        jmp short .16
.14:
        mov ebx, 4
        jmp short .16
.15:
        mov ebx, 0FFFFFFFFh
.16:
        movsx eax, dh
        call PositionOrder
        sub ebx, eax
        jmp short .18
.17:
        mov edx, dword [ecx]
        mov eax, dword [nosplit edx*4+LinesPlayerOrder]
        mov edx, dword [ebx]
        mov ebx, dword [nosplit edx*4+LinesPlayerOrder]
        add eax, byte 13h
        add ebx, byte 13h
        mov edx, eax
        mov eax, ebx
        call strcmp_
        mov ebx, eax
.18:
        mov eax, ebx
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PositionOrder                                9CD22  96 PC, medium confidence
; The sort order of a position letter (C, D, G, L, R)
;-----------------------------------------------------------------------------
PositionOrder:
        cmp al, 47h
        jb short .1
        jbe short .6
        cmp al, 4Ch
        jb short .7
        jbe short .2
        cmp al, 52h
        je short .4
        jmp short .7
.1:
        cmp al, 43h
        jb short .7
        jbe short .3
        cmp al, 44h
        je short .5
        jmp short .7
.2:
        xor eax, eax
        ret
.3:
        mov eax, 1
        ret
.4:
        mov eax, 2
        ret
.5:
        mov eax, 3
        ret
.6:
        mov eax, 4
        ret
.7:
        mov eax, 0FFFFFFFFh
        ret
;-----------------------------------------------------------------------------
; EditLinesHoverPanel                             9CD61  96 PC, low confidence
; Picks the edit lines panel under the mouse pointer
;-----------------------------------------------------------------------------
EditLinesHoverPanel:
        cmp dword [MenuMouseX], 19Ah
        jge short .1
        cmp dword [MenuMouseY], byte 7Ah
        jle short .1
        cmp dword [MenuMouseY], 1BFh
        jge short .1
        cmp dword [LinesIntroOn], byte 0
        je short .1
        mov eax, dword [LinesIntroTeam]
        mov word [MenuViewStored], 1
        mov eax, dword [byte eax+02Ch]
        mov dword [pointerspr], eax
        mov word [byte eax+08h], 19h
        mov eax, dword [pointerspr]
        mov word [byte eax+0Ah], 19h
        mov eax, dword [LinesHoverArt]
        mov eax, dword [byte eax+02Ch]
        jmp short .2
.1:
        mov eax, dword [LinesCursorArt]
        mov dword [pointerspr], eax
        mov eax, dword [EditLinesRecords+690h]
        mov word [MenuViewStored], 0
.2:
        mov dword [MenuCursorPixels], eax
        ret
;-----------------------------------------------------------------------------
; RunEditLines                                 9CDDA  96 PC, medium confidence
; Sets up the stat tables if needed and runs the edit lines screen, with the
; player card screen when it asks (from the controller screen and the in-game
; menu)
;-----------------------------------------------------------------------------
RunEditLines:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        push eax
        mov edi, 1
        xor esi, esi
        mov dword [byte ebp-04h], edi
        cmp dword [RosterDbPtrs], byte 0
        jne near .2
        push esi
        push dword 0E0h
        push str_StatDBPTRs3
        call AllocMemBlock
        add esp, byte 0Ch
        push esi
        push dword 0E0h
        push str_DBPTRs3
        mov dword [RosterDbPtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push esi
        push dword 0E0h
        push str_Player3
        mov dword [RosterPlayerPtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push esi
        push dword 0E0h
        push str_FName3
        mov dword [RosterFirstNamePtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push esi
        push dword 0E0h
        push str_LName3
        mov dword [RosterLastNamePtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push esi
        push dword 0E0h
        push str_Profiles3
        mov dword [RosterProfilePtrs], eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [RosterJerseyPtrs], eax
.1:
        push byte 0
        push dword 0C00h
        push str_HeightNWeight3
        add esi, byte 4
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [dword esi+PlayerHeightPtrs-4], eax
        cmp esi, byte 8
        jne short .1
        mov esi, 1
.2:
        push byte 0
        push dword 0E0h
        push str_DonrussCards
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [EditLinesBuffer], eax
.3:
        cmp edi, byte 2
        je near .8
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-04h]
        call EditLinesScreen
        mov edi, eax
        test eax, eax
        jne short .3
        mov dword [RatingsPlayerId], eax
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 1
        jb short .6
        jbe short .4
        cmp eax, byte 2
        je short .5
        jmp short .6
.4:
        mov ecx, 1068h
        jmp short .7
.5:
        mov ecx, 0A410h
        jmp short .7
.6:
        mov ecx, 2Ah
.7:
        mov edx, RatingsPlayerId
        mov ebx, dword [LinesCardSource]
        mov eax, dword [RosterPlayerIds]
        call PlayerCardScreen
        mov edi, 1
        push dword [RosterPlayerIds]
        mov dword [byte ebp-04h], 0
        call FreeMemBlock
        mov dword [RosterPlayerIds], 0
        add esp, byte 4
        jmp near .3
.8:
        test esi, esi
        je short .10
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
.9:
        push dword [dword esi+PlayerHeightPtrs]
        call FreeMemBlock
        add esi, byte 4
        add esp, byte 4
        cmp esi, byte 8
        jne short .9
        mov dword [RosterDbPtrs], 0
.10:
        push dword [EditLinesBuffer]
        call FreeMemBlock
        add esp, byte 4
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; EditLinesScreen                                                 9CFE3  96 PC
; The edit lines screen (bt09 / bh09, slid / slup / sldw scroll, power play
; bkpp and penalty kill bkpk boxes, jerseys): who plays on each line; returns
; 2 for a player card
;-----------------------------------------------------------------------------
EditLinesScreen:
        push ebx
        push ecx
        push esi
        push edi
        enter 1870h, 0
        push eax
        push edx
        sub ebp, 82h
        mov ecx, 40h
        lea edi, [dword ebp-0246h]
        mov esi, unk_9CB19
        rep movsd
        mov eax, dword [pointerspr]
        mov dword [LinesIntroOn], 0
        mov dword [byte ebp+042h], 0
        movsx ecx, word [byte eax+06h]
        mov edx, 32h
        inc ecx
        push byte 20h
        sar edx, cl
        movsx ecx, word [byte eax+04h]
        mov esi, 32h
        inc ecx
        mov dword [byte ebp+03Eh], edx
        sar esi, cl
        cmp edx, byte 32h
        jle short .1
        mov eax, edx
        jmp short .2
.1:
        mov eax, 32h
.2:
        push eax
        cmp esi, byte 32h
        jle short .3
        mov eax, esi
        jmp short .4
.3:
        mov eax, 32h
.4:
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [LinesIntroTeam], eax
        push byte 20h
        cmp dword [byte ebp+03Eh], byte 32h
        jle short .5
        mov eax, dword [byte ebp+03Eh]
        jmp short .6
.5:
        mov eax, 32h
.6:
        push eax
        cmp esi, byte 32h
        jg short .7
        mov esi, 32h
.7:
        push esi
        call CreateBitmap
        mov dword [LinesHoverArt], eax
        mov eax, dword [pointerspr]
        mov dword [LinesCursorArt], eax
        mov eax, dword [MenuCursorPixels]
        add esp, byte 0Ch
        mov dword [EditLinesRecords+690h], eax
        mov eax, 4
        xor edx, edx
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 132h
        call LoadPackedFile
        mov esi, eax
        mov dword [byte ebp+05Eh], eax
        mov eax, dword [LinesEditTeam]
        xor edx, edx
        add eax, 116h
        call LoadDataFileLib
        lea edx, [dword ebp-017EEh]
        mov dword [byte ebp+062h], eax
        mov eax, 2Dh
        call InitMenuItems
        push str_Bt092
        lea eax, [dword ebp-0246h]
        push esi
        mov dword [dword ebp-017DEh], 4
        mov dword [dword ebp-017DAh], eax
        call FindShape
        add esp, byte 8
        push str_Bh09
        push esi
        mov dword [dword ebp-017D4h], eax
        call FindShape
        add esp, byte 8
        push str_Bt092
        push esi
        mov dword [dword ebp-017D0h], eax
        call FindShape
        add esp, byte 8
        push str_Bt092
        movsx eax, word [byte eax+0Ch]
        push esi
        mov dword [dword ebp-017C8h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-017C4h], eax
        mov eax, dword [dword ebp-017C8h]
        add eax, byte 0Ah
        mov edx, LinesPanelItems+40h
        mov dword [dword ebp-017B4h], eax
        mov eax, dword [dword ebp-017C4h]
        add esp, byte 8
        add eax, byte 0Ah
        mov byte [dword ebp-017ABh], 18h
        mov dword [dword ebp-017B0h], eax
        mov eax, 990h
.8:
        add eax, byte 66h
        mov dword [dword eax+ebp-01840h], edx
        mov dword [dword eax+ebp-01844h], 4
        add edx, byte 40h
        cmp eax, 1188h
        jne short .8
        mov dword [byte ebp+03Eh], 14h
        mov dword [byte ebp+03Eh], 0
        mov dword [byte ebp+06Eh], 0A0h
        mov ch, byte [byte ebp+03Eh]
        lea esi, [dword ebp-05FEh]
        add ch, 0Bh
        mov ebx, 14h
        mov cl, byte [byte ebp+03Eh]
        mov edx, 3FCh
        add cl, 9
.9:
        imul edi, dword [byte ebp+03Eh], byte 14h
        mov eax, dword [byte ebp+03Eh]
        shl eax, 6
        mov dword [dword eax+ebp-05FEh], 1C2h
        mov dword [dword eax+ebp-05F6h], 262h
        mov dword [dword eax+ebp-05EEh], 262h
        mov dword [dword eax+ebp-05E6h], 1C2h
        add edi, 9Bh
        mov dword [dword edx+ebp-017DEh], 4
        mov dword [dword eax+ebp-05FAh], edi
        mov dword [dword edx+ebp-017B4h], 1CCh
        mov dword [dword eax+ebp-05F2h], edi
        lea edi, [dword ebx+09Bh]
        mov byte [dword edx+ebp-017AAh], 25h
        mov dword [dword eax+ebp-05EAh], edi
        mov dword [dword edx+ebp-017DAh], esi
        mov dword [dword eax+ebp-05E2h], edi
        mov eax, dword [byte ebp+06Eh]
        mov dword [dword edx+ebp-017B0h], eax
        cmp dword [byte ebp+03Eh], byte 6
        jge short .10
        mov byte [dword edx+ebp-017A9h], 5
        jmp short .11
.10:
        mov byte [dword edx+ebp-017A9h], 8
.11:
        add dword [byte ebp+06Eh], byte 14h
        inc dword [byte ebp+03Eh]
        add esi, byte 40h
        mov byte [dword edx+ebp-017ACh], cl
        add ebx, byte 14h
        mov byte [dword edx+ebp-017ABh], ch
        inc ch
        add edx, byte 66h
        inc cl
        cmp dword [byte ebp+03Eh], byte 0Ah
        jl near .9
        push byte 0
        push dword 0FAh
        mov byte [dword ebp-013B0h], 0
        push dword 0A0h
        mov byte [dword ebp-01019h], 2
        mov byte [dword ebp-017A9h], 0Ah
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push dword 145h
        push dword 19Ah
        mov dword [byte ebp+04Ah], eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [byte ebp+046h], eax
        cmp dword [LinesEditMode], byte 0
        jne short .12
        call LoadExhibitionStats
        jmp short .14
.12:
        cmp dword [LinesEditMode], 3E7h
        jle short .13
        cmp dword [LinesEditMode], 2AF8h
        jge short .13
        mov eax, dword [LinesEditMode]
        call LoadSeasonStats
        jmp short .14
.13:
        cmp dword [LinesEditMode], 2AF7h
        jle short .14
        mov eax, dword [LinesEditMode]
        sub eax, 2710h
        call LoadPlayoffStats
.14:
        cmp dword [LinesEditMode], byte 3
        jne near .19
        imul eax, dword [LinesEditAway], dword 31Bh
        mov edx, hmteamrec
        add edx, eax
        mov eax, LinesSlotTable
        mov dword [byte ebp+03Eh], 0
        add eax, byte 13h
        mov dword [byte ebp+07Eh], 0
        mov dword [byte ebp+076h], eax
        mov eax, LinesSlotTable
        mov dword [byte ebp+032h], edx
        add eax, byte 3
        mov dword [byte ebp+072h], edx
        mov dword [byte ebp+07Ah], eax
.15:
        cmp dword [dword ebp-017F6h], byte 0
        je short .16
        imul edi, dword [byte ebp+03Eh], byte 3Ch
        add edi, LinesSlotTable
        cmp dword [byte ebp+03Eh], byte 19h
        mov eax, dword [byte ebp+072h]
        mov esi, dword [TeamDb]
        mov ecx, 3Ch
        add esi, dword [byte eax+063h]
        rep movsb
.16:
        imul ebx, dword [byte ebp+03Eh], byte 3Ch
        imul edx, dword [LinesEditAway], dword 4B4h
        mov eax, dword [byte ebp+07Eh]
        mov cl, byte [dword edx+eax+hmrosterflags]
        mov al, byte [dword edx+eax+hmrosterpos]
        add edx, hmroster
        mov byte [dword ebx+LinesSlotTable+2], al
        add edx, dword [byte ebp+07Eh]
        mov eax, dword [byte ebp+07Ah]
        add edx, byte 7
        mov byte [dword ebx+LinesSlotTable+1], cl
        call strcpy_
        imul eax, dword [LinesEditAway], dword 4B4h
        add eax, hmroster
        add eax, dword [byte ebp+07Eh]
        lea edx, [byte eax+017h]
        mov eax, dword [byte ebp+076h]
        call strcpy_
        cmp dword [LinesEditAway], byte 0
        jne short .17
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        jmp short .18
.17:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
.18:
        shr eax, 1Bh
        mov byte [dword ebx+LinesSlotTable], al
        add dword [byte ebp+072h], byte 4
        add dword [byte ebp+076h], byte 3Ch
        add dword [byte ebp+07Ah], byte 3Ch
        inc dword [byte ebp+03Eh]
        add dword [byte ebp+07Eh], byte 2Bh
        cmp dword [byte ebp+03Eh], byte 1Ch
        jge short .20
        jmp near .15
.19:
        imul eax, dword [LinesEditTeam], dword 31Bh
        mov edx, dword [statsplayoffs]
        add edx, eax
        mov dword [byte ebp+032h], edx
.20:
        cmp dword [dword ebp-017F2h], byte 0
        je short .23
        cmp dword [LinesEditMode], byte 3
        jne short .21
        imul eax, dword [LinesEditAway], dword 136h
        mov ecx, 3Eh
        mov edi, LinesWorkTable
        mov esi, dword [dword eax+hmtmlines]
        jmp short .22
.21:
        mov esi, dword [byte ebp+032h]
        mov ecx, 3Eh
        mov edi, LinesWorkTable
        add esi, 0D3h
.22:
        rep movsb
.23:
        push dword [dword ebp-017F2h]
        lea eax, [byte ebp+04Eh]
        lea ecx, [byte ebp+052h]
        mov ebx, LinesSortedPlayers
        push eax
        lea edx, [dword ebp-0146h]
        mov eax, dword [byte ebp+032h]
        call SortTeamPlayers
        push str_Bkgd20
        push dword [byte ebp+062h]
        call FindShape
        mov edx, 0FEh
        add esp, byte 8
        mov esi, eax
        mov eax, 0Fh
        call SetTextColors
        push str_Ball6
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push eax
        push str_Slid2
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd20
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 0Ah
        mov ebx, dword [byte ebp+052h]
        push byte 0
        lea edx, [dword ebp-015F0h]
        lea eax, [dword ebp-037Eh]
        call InitVScrollBar
        push str_Slu12
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push str_Slup
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-015D6h], eax
        call FindShape
        add esp, byte 8
        push str_Slu12
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-015D2h], eax
        call FindShape
        add esp, byte 8
        push str_Slu12
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-015CAh], eax
        call FindShape
        add esp, byte 8
        push str_Sld12
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-015C6h], eax
        call FindShape
        add esp, byte 8
        push str_Sldw
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-014A4h], eax
        call FindShape
        add esp, byte 8
        push str_Sld12
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-014A0h], eax
        call FindShape
        add esp, byte 8
        push str_Sld12
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-01498h], eax
        call FindShape
        add esp, byte 8
        push str_Slid2
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-01494h], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Slid2
        add eax, byte 5
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-01484h], eax
        mov dword [dword ebp-015B6h], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push str_Slid2
        add eax, byte 5
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-015B2h], eax
        call FindShape
        add esp, byte 8
        push str_Slid2
        push dword [byte ebp+05Eh]
        movsx edi, word [byte eax+0Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        mov byte [dword ebp-015AEh], 0
        mov byte [dword ebp-015ADh], 8
        mov byte [dword ebp-015ACh], 0Ah
        mov byte [dword ebp-0147Ch], 5
        mov byte [dword ebp-0147Bh], 2
        add eax, edi
        push esi
        sub eax, byte 5
        mov byte [dword ebp-0147Ah], 13h
        mov dword [dword ebp-01480h], eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        push str_Pal28
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+03Eh], 0
        push str_Pal28
        mov esi, eax
        add eax, byte 10h
        push dword [byte ebp+05Eh]
        mov dword [byte ebp+05Ah], eax
        call FindShape
        add esp, byte 8
        lea ecx, [byte eax+010h]
        lea edx, [dword esi+0280h]
        add eax, 280h
.24:
        inc dword [byte ebp+03Eh]
        mov bl, byte [eax]
        inc eax
        mov byte [edx], bl
        inc edx
        cmp dword [byte ebp+03Eh], byte 0Ch
        jl short .24
        mov eax, dword [byte ebp+05Ah]
        mov dword [byte ebp+03Eh], 0
        lea edx, [dword ecx+0282h]
        add eax, 282h
.25:
        inc dword [byte ebp+03Eh]
        mov bl, byte [edx]
        inc edx
        mov byte [eax], bl
        inc eax
        cmp dword [byte ebp+03Eh], byte 33h
        jl short .25
        mov eax, dword [byte ebp+05Ah]
        mov dword [byte ebp+03Eh], 0
.26:
        inc dword [byte ebp+03Eh]
        mov byte [eax], 0
        inc eax
        cmp dword [byte ebp+03Eh], byte 3
        jl short .26
        mov eax, dword [byte ebp+05Ah]
        call SetScreenColors
        mov eax, dword [byte ebp+05Ah]
        call SetScreenPalette
        mov eax, 6
        xor esi, esi
        call OpenScreen
.27:
        push byte 0
        push str_Nhl1
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_Nhl1
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte esi+ebp-032h], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_Nhl1
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_Nhl1
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd20
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push eax
        add esi, byte 4
        call PutBlock
        add esp, byte 0Ch
        cmp esi, byte 0Ch
        jne near .27
        push dword [byte ebp-032h]
        call SetDrawBitmap
        add esp, byte 4
        push str_Nhl1
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [byte ebp-02Eh]
        call SetDrawBitmap
        add esp, byte 4
        push str_Nhl2
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [byte ebp-02Ah]
        call SetDrawBitmap
        add esp, byte 4
        push str_Nhl3
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
.28:
        push byte 0
        push str_Scr12
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_Scr12
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte esi+ebp-032h], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_Scr12
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_Scr12
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd20
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push eax
        add esi, byte 4
        call PutBlock
        add esp, byte 0Ch
        cmp esi, byte 18h
        jne near .28
        push dword [byte ebp-026h]
        call SetDrawBitmap
        add esp, byte 4
        push str_Scr12
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [byte ebp-022h]
        call SetDrawBitmap
        add esp, byte 4
        push str_Scr22
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [byte ebp-01Eh]
        call SetDrawBitmap
        add esp, byte 4
        push str_Scr3
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
.29:
        push byte 0
        push str_Drs1
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_Drs1
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte esi+ebp-032h], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_Drs1
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_Drs1
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd20
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push eax
        add esi, byte 4
        call PutBlock
        add esp, byte 0Ch
        cmp esi, byte 24h
        jne near .29
        push dword [byte ebp-01Ah]
        call SetDrawBitmap
        add esp, byte 4
        push str_Drs1
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [byte ebp-016h]
        call SetDrawBitmap
        add esp, byte 4
        push str_Drs2
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [byte ebp-012h]
        call SetDrawBitmap
        add esp, byte 4
        push str_Drs3
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
.30:
        push byte 0
        push str_Sta13
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_Sta13
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte esi+ebp-032h], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_Sta13
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_Sta13
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd20
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push eax
        add esi, byte 4
        call PutBlock
        add esp, byte 0Ch
        cmp esi, byte 30h
        jne near .30
        push dword [byte ebp-0Eh]
        call SetDrawBitmap
        add esp, byte 4
        push str_Sta13
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [byte ebp-0Ah]
        call SetDrawBitmap
        add esp, byte 4
        push str_Sta23
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [byte ebp-06h]
        call SetDrawBitmap
        add esp, byte 4
        push str_Sta33
        push dword [byte ebp+05Eh]
        lea edi, [dword ebp-0F90h]
        call FindShape
        add esp, byte 8
        mov edx, eax
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 0FAE1h
        mov esi, TeamStatsBitmap
        call DrawFrameAt
        mov ecx, 66h
        rep movsb
        mov byte [dword ebp-0F4Eh], 2Ah
        mov byte [dword ebp-0F4Dh], 15h
        mov ecx, 66h
        lea edi, [dword ebp-0F2Ah]
        mov esi, BottomBarArt+56h
        mov byte [dword ebp-0F4Ch], 15h
        mov byte [dword ebp-0F4Bh], 1
        rep movsb
        mov byte [dword ebp-0EE6h], 3
        mov byte [dword ebp-0EE8h], 8
        mov byte [dword ebp-0EE5h], 16h
        mov byte [dword ebp-0EE7h], 16h
        cmp dword [LinesEditMode], byte 3
        jne short .31
        mov byte [dword ebp-0147Bh], 16h
        mov byte [dword ebp-0EE6h], 15h
        mov byte [dword ebp-0F4Bh], 16h
.31:
        je near .32
        lea eax, [dword ebp-0206h]
        mov dword [dword ebp-01774h], eax
        mov eax, dword [byte ebp-032h]
        mov dword [dword ebp-01778h], 6
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-0176Eh], eax
        mov eax, dword [byte ebp-02Eh]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-0176Ah], eax
        mov eax, dword [byte ebp-02Ah]
        push str_Nhl1
        mov eax, dword [byte eax+02Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-01766h], eax
        call FindShape
        add esp, byte 8
        push str_Nhl1
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-01762h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0175Eh], eax
        mov eax, dword [dword ebp-01762h]
        add eax, byte 0Ah
        mov dword [dword ebp-0174Eh], eax
        mov eax, dword [dword ebp-0175Eh]
        add eax, byte 0Ah
        mov byte [dword ebp-01746h], 2Bh
        mov dword [dword ebp-0174Ah], eax
        lea eax, [dword ebp-01C6h]
        mov byte [dword ebp-01744h], 15h
        mov dword [dword ebp-0170Eh], eax
        mov eax, dword [byte ebp-026h]
        mov byte [dword ebp-01743h], 3
        mov dword [dword ebp-01712h], 6
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01708h], eax
        mov eax, dword [byte ebp-022h]
        mov eax, dword [byte eax+02Ch]
        add esp, byte 8
        mov dword [dword ebp-01704h], eax
        mov eax, dword [byte ebp-01Eh]
        push str_Scr12
        mov eax, dword [byte eax+02Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-01700h], eax
        call FindShape
        add esp, byte 8
        push str_Scr12
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-016FCh], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [dword ebp-016F8h], eax
        mov eax, dword [dword ebp-016FCh]
        mov byte [dword ebp-016E0h], 13h
        add eax, byte 0Fh
        mov byte [dword ebp-016DEh], 1
        mov dword [dword ebp-016E8h], eax
        mov eax, dword [dword ebp-016F8h]
        mov byte [dword ebp-016DDh], 16h
        add eax, byte 0Ah
        mov byte [dword ebp-016DFh], 3
        mov dword [dword ebp-016E4h], eax
.32:
        cmp dword [dword ebp-017F6h], byte 0
        je near .33
        lea eax, [dword ebp-0186h]
        mov dword [dword ebp-016A8h], eax
        mov eax, dword [byte ebp-0Eh]
        mov dword [dword ebp-016ACh], 6
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-016A2h], eax
        mov eax, dword [byte ebp-0Ah]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-0169Eh], eax
        mov eax, dword [byte ebp-06h]
        push str_Sta13
        mov eax, dword [byte eax+02Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0169Ah], eax
        call FindShape
        add esp, byte 8
        push str_Sta13
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-01696h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-01692h], eax
        mov eax, dword [dword ebp-01696h]
        add esp, byte 8
        add eax, byte 0Ah
        mov byte [dword ebp-0167Ah], 2
        mov dword [dword ebp-01682h], eax
        mov eax, dword [dword ebp-01692h]
        mov byte [dword ebp-01678h], 1
        add eax, byte 0Ah
        mov byte [dword ebp-01677h], 16h
        mov dword [dword ebp-0167Eh], eax
.33:
        lea eax, [dword ebp-037Eh]
        push eax
        mov ecx, dword [dword ebp-035Ah]
        mov ebx, LinesSortedPlayers
        push dword [byte ebp+062h]
        lea edx, [dword ebp-0146h]
        push dword [byte ebp+04Ah]
        xor eax, eax
        call DrawLinesPlayerList
        lea eax, [dword ebp-017EEh]
        push eax
        mov ecx, dword [byte ebp+05Eh]
        push byte 0
        mov ebx, dword [byte ebp+062h]
        mov edx, dword [byte ebp+046h]
        push dword [byte ebp+04Eh]
        mov eax, dword [byte ebp+042h]
        push dword [byte ebp+052h]
        mov dword [byte ebp+03Ah], 0
        call DrawLinesPanel
        call MusicDone
        test eax, eax
        jne short .34
        call PlayMusic
.34:
        xor esi, esi
.35:
        cmp dword [dword esi+ebp-017D4h], byte 0
        je short .36
        push dword [dword esi+ebp-017C4h]
        push dword [dword esi+ebp-017C8h]
        push dword [dword esi+ebp-017D4h]
        call DrawArt
        add esp, byte 0Ch
.36:
        add esi, byte 66h
        cmp esi, 11EEh
        jne short .35
        mov ebx, 3
        mov edx, dword [byte ebp+05Ah]
        xor eax, eax
        call FadePalette
        push dword [LinesIntroTeam]
        mov dword [byte ebp+056h], 0FFFFFFFFh
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call ClearClipRect
        add esp, byte 4
        mov eax, dword [byte ebp+03Ah]
        mov ecx, dword [byte ebp+062h]
        push byte 0
        xor edx, edx
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        push dword [byte ebp+05Eh]
        movzx ebx, byte [byte eax+01h]
        xor eax, eax
        call DrawLineJersey
        push byte 19h
        push byte 19h
        push dword [pointerspr]
        call DrawArt
        add esp, byte 0Ch
        call SetScreenTarget
        mov dword [LinesIntroOn], 1
        cmp dword [LinesEditMode], byte 3
        jne short .38
        cmp dword [dword ebp-017F6h], byte 0
        je short .37
        mov byte [dword ebp-01019h], 3
        jmp short .38
.37:
        mov byte [dword ebp-01019h], 16h
.38:
        mov eax, dword [byte ebp+032h]
        add eax, 111h
        mov dword [byte ebp+066h], eax
        mov eax, dword [byte ebp+032h]
        add eax, 0D3h
        mov dword [byte ebp+06Ah], eax
        jmp near .120
.39:
        cmp dword [byte ebp+056h], byte 5
        jl short .41
        jle near .73
        cmp dword [byte ebp+056h], byte 0Ah
        jl short .40
        cmp dword [byte ebp+056h], byte 13h
        jle near .77
        cmp dword [byte ebp+056h], byte 15h
        jl near .106
        jle near .85
        cmp dword [byte ebp+056h], byte 16h
        je near .86
        jmp near .106
.40:
        cmp dword [byte ebp+056h], byte 7
        jle near .75
        cmp dword [byte ebp+056h], byte 8
        je near .76
        jmp near .106
.41:
        cmp dword [byte ebp+056h], byte 1
        jl short .42
        jle near .62
        cmp dword [byte ebp+056h], byte 2
        jle near .63
        cmp dword [byte ebp+056h], byte 3
        je near .100
        jmp near .106
.42:
        cmp dword [byte ebp+056h], byte 0FFFFFFFDh
        jl near .106
        jle near .85
        cmp dword [byte ebp+056h], byte 0
        jne near .106
        cmp dword [byte ebp+042h], byte 1
        jb short .43
        jbe near .50
        cmp dword [byte ebp+042h], byte 2
        je near .56
        jmp near .120
.43:
        cmp dword [byte ebp+042h], byte 0
        jne near .120
        push byte 0
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
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
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        mov eax, str_Bkgd20
        push eax
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        mov dword [byte ebp+042h], 1
        mov dword [byte ebp+03Eh], 0Ah
        call SetScreenTarget
.44:
        cmp dword [byte ebp+03Eh], byte 11h
        jne short .45
        push str_Bh17
        lea eax, [byte ebp+026h]
        push eax
        call sprintf_
        add esp, byte 8
        jmp short .46
.45:
        push dword [byte ebp+03Eh]
        push str_Bt02d4
        lea eax, [byte ebp+026h]
        push eax
        call sprintf_
        add esp, byte 0Ch
.46:
        push str_Bh09
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_Bh09
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [byte edi+02Ch]
        call DrawArtOpaque
        add esp, byte 0Ch
        lea eax, [byte ebp+026h]
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push eax
        call DrawShape
        add esp, byte 4
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.47:
        call TickDeadlinePassed
        test eax, eax
        jne short .48
        call SoundIdle
        jmp short .47
.48:
        inc dword [byte ebp+03Eh]
        cmp dword [byte ebp+03Eh], byte 12h
        jl near .44
        push edi
        call FreeBitmap
        add esp, byte 4
        push str_Bt17
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push str_Bh17
.49:
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-017D4h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-017D0h], eax
        lea eax, [dword ebp-017EEh]
        push eax
        mov ecx, dword [byte ebp+05Eh]
        push dword [byte ebp+03Ah]
        mov ebx, dword [byte ebp+062h]
        push dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+046h]
        push dword [byte ebp+052h]
        mov eax, dword [byte ebp+042h]
        call DrawLinesPanel
        mov byte [dword ebp-0F4Eh], 2Ah
        jmp near .120
.50:
        push byte 0
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
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
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        mov eax, str_Bkgd20
        push eax
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        mov dword [byte ebp+042h], 2
        mov dword [byte ebp+03Eh], 12h
        call SetScreenTarget
.51:
        cmp dword [byte ebp+03Eh], byte 19h
        jne short .52
        push str_Bh01
        lea eax, [byte ebp+026h]
        push eax
        call sprintf_
        add esp, byte 8
        jmp short .53
.52:
        push dword [byte ebp+03Eh]
        push str_Bt02d4
        lea eax, [byte ebp+026h]
        push eax
        call sprintf_
        add esp, byte 0Ch
.53:
        push str_Bh09
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_Bh09
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [byte edi+02Ch]
        call DrawArtOpaque
        add esp, byte 0Ch
        lea eax, [byte ebp+026h]
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push eax
        call DrawShape
        add esp, byte 4
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.54:
        call TickDeadlinePassed
        test eax, eax
        jne short .55
        call SoundIdle
        jmp short .54
.55:
        inc dword [byte ebp+03Eh]
        cmp dword [byte ebp+03Eh], byte 1Ah
        jl near .51
        push edi
        call FreeBitmap
        add esp, byte 4
        push str_Bt018
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push str_Bh01
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-017D4h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-017D0h], eax
        lea eax, [dword ebp-017EEh]
        push eax
        mov ecx, dword [byte ebp+05Eh]
        push dword [byte ebp+03Ah]
        mov ebx, dword [byte ebp+062h]
        push dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+046h]
        push dword [byte ebp+052h]
        mov eax, dword [byte ebp+042h]
        call DrawLinesPanel
        mov byte [dword ebp-0F4Eh], 23h
        jmp near .120
.56:
        push byte 0
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
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
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        mov eax, str_Bh09
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        mov eax, str_Bkgd20
        push eax
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        mov dword [byte ebp+042h], 0
        mov dword [byte ebp+03Eh], 1
        call SetScreenTarget
.57:
        cmp dword [byte ebp+03Eh], byte 9
        jne short .58
        push str_Bh09
        lea eax, [byte ebp+026h]
        push eax
        call sprintf_
        add esp, byte 8
        jmp short .59
.58:
        push dword [byte ebp+03Eh]
        push str_Bt02d4
        lea eax, [byte ebp+026h]
        push eax
        call sprintf_
        add esp, byte 0Ch
.59:
        push str_Bh09
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_Bh09
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [byte edi+02Ch]
        call DrawArtOpaque
        add esp, byte 0Ch
        lea eax, [byte ebp+026h]
        push eax
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push eax
        call DrawShape
        add esp, byte 4
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.60:
        call TickDeadlinePassed
        test eax, eax
        jne short .61
        call SoundIdle
        jmp short .60
.61:
        inc dword [byte ebp+03Eh]
        cmp dword [byte ebp+03Eh], byte 0Ah
        jl near .57
        push edi
        call FreeBitmap
        add esp, byte 4
        push str_Bt092
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push str_Bh09
        jmp near .49
.62:
        mov ecx, 3Eh
        mov esi, dword [byte ebp+066h]
        mov edi, LinesWorkTable
        mov ebx, LinesSortedPlayers
        rep movsb
        push byte 1
        lea eax, [byte ebp+04Eh]
        lea edx, [dword ebp-0146h]
        push eax
        lea ecx, [byte ebp+052h]
        mov eax, dword [byte ebp+032h]
        call SortTeamPlayers
        lea eax, [dword ebp-037Eh]
        push eax
        mov ecx, dword [dword ebp-035Ah]
        mov ebx, LinesSortedPlayers
        push dword [byte ebp+062h]
        lea edx, [dword ebp-0146h]
        push dword [byte ebp+04Ah]
        mov eax, dword [byte ebp+03Ah]
        call DrawLinesPlayerList
        lea eax, [dword ebp-017EEh]
        push eax
        mov ecx, dword [byte ebp+05Eh]
        push dword [byte ebp+03Ah]
        mov ebx, dword [byte ebp+062h]
        push dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+046h]
        push dword [byte ebp+052h]
        mov eax, dword [byte ebp+042h]
        call DrawLinesPanel
        jmp near .120
.63:
        cmp dword [byte ebp+03Ah], byte 64h
        je near .70
        mov eax, dword [byte ebp+03Ah]
        mov ecx, 3Eh
        cmp dword [nosplit eax*4+LinesSortedPlayers], byte 1
        setne dl
        mov esi, LinesWorkTable
        movzx edx, dl
        lea edi, [byte ebp-07Ah]
        mov dword [nosplit eax*4+LinesSortedPlayers], edx
        rep movsb
        mov eax, dword [byte ebp+052h]
        mov ecx, dword [byte ebp+03Ah]
        sub eax, dword [byte ebp+04Eh]
        add ecx, byte 19h
        mov dword [byte ebp+03Eh], 0
        sub ecx, eax
.64:
        mov edx, dword [byte ebp+03Eh]
        movzx edx, byte [byte edx+ebp-07Ah]
        cmp edx, dword [byte ebp+03Ah]
        jne short .65
        cmp eax, edx
        jg short .66
.65:
        mov edx, dword [byte ebp+03Eh]
        movzx edx, byte [byte edx+ebp-07Ah]
        cmp edx, ecx
        jne short .67
        cmp eax, dword [byte ebp+03Ah]
        jg short .67
.66:
        mov edx, dword [byte ebp+03Eh]
        mov byte [byte edx+ebp-07Ah], 64h
.67:
        inc dword [byte ebp+03Eh]
        cmp dword [byte ebp+03Eh], byte 3Eh
        jb short .64
        mov ecx, 3Eh
        lea esi, [byte ebp-07Ah]
        mov edi, LinesWorkTable
        rep movsb
        lea eax, [dword ebp-017EEh]
        push eax
        mov ebx, dword [byte ebp+062h]
        push dword [byte ebp+03Ah]
        mov edx, dword [byte ebp+046h]
        push dword [byte ebp+04Eh]
        mov ecx, dword [byte ebp+05Eh]
        push dword [byte ebp+052h]
        mov eax, dword [byte ebp+042h]
        call DrawLinesPanel
        lea eax, [dword ebp-037Eh]
        push eax
        mov ecx, dword [dword ebp-035Ah]
        mov ebx, LinesSortedPlayers
        push dword [byte ebp+062h]
        lea edx, [dword ebp-0146h]
        push dword [byte ebp+04Ah]
        mov eax, dword [byte ebp+03Ah]
        call DrawLinesPlayerList
        mov eax, dword [byte ebp+03Ah]
        cmp dword [nosplit eax*4+LinesSortedPlayers], byte 0
        jne short .68
        cmp dword [LinesEditMode], byte 3
        je short .68
        mov eax, dword [byte ebp-026h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01708h], eax
        mov eax, dword [byte ebp-022h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01704h], eax
        mov eax, dword [byte ebp-01Eh]
        jmp short .69
.68:
        cmp dword [LinesEditMode], byte 3
        je short .70
        mov eax, dword [byte ebp-01Ah]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01708h], eax
        mov eax, dword [byte ebp-016h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01704h], eax
        mov eax, dword [byte ebp-012h]
.69:
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01700h], eax
.70:
        cmp dword [byte ebp+03Ah], byte 64h
        je short .72
        mov esi, dword [byte ebp+03Ah]
        shl esi, 2
        cmp dword [dword esi+LinesSortedPlayers], byte 0
        jne short .72
.71:
        push dword [LinesIntroTeam]
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call ClearClipRect
        mov ecx, dword [byte ebp+062h]
        add esp, byte 4
        mov eax, dword [dword esi+LinesPlayerOrder]
        xor edx, edx
        push byte 0
        movzx ebx, byte [byte eax+01h]
        push dword [byte ebp+05Eh]
        xor eax, eax
        call DrawLineJersey
        push byte 19h
        push byte 19h
        push dword [pointerspr]
        call DrawArt
        add esp, byte 0Ch
        call SetScreenTarget
        mov dword [LinesIntroOn], 1
        jmp near .120
.72:
        mov word [MenuViewStored], 0
        mov dword [LinesIntroOn], 0
        jmp near .120
.73:
        lea eax, [dword ebp-037Eh]
        call ScrollBarUp
.74:
        lea eax, [dword ebp-037Eh]
        push eax
        mov ebx, LinesSortedPlayers
        lea edx, [dword ebp-0146h]
        push dword [byte ebp+062h]
        mov ecx, dword [dword ebp-035Ah]
        push dword [byte ebp+04Ah]
        mov eax, dword [byte ebp+03Ah]
        call DrawLinesPlayerList
        jmp near .120
.75:
        lea eax, [dword ebp-037Eh]
        call ScrollBarToMouse
        jmp short .74
.76:
        lea eax, [dword ebp-037Eh]
        call ScrollBarDown
        jmp short .74
.77:
        mov eax, dword [byte ebp+056h]
        mov dword [byte ebp+03Ah], 0FFFFFFFFh
        add eax, dword [dword ebp-035Ah]
        mov dword [byte ebp+03Eh], 0
        shl eax, 2
        jmp short .80
.78:
        mov edx, dword [dword eax+ebp-016Eh]
        cmp edx, dword [byte ebp+03Eh]
        jne short .79
        mov dword [byte ebp+03Ah], edx
.79:
        inc dword [byte ebp+03Eh]
.80:
        mov edx, dword [byte ebp+03Eh]
        cmp edx, dword [byte ebp+052h]
        jge short .81
        cmp dword [byte ebp+03Ah], byte 0
        jl short .78
.81:
        lea eax, [dword ebp-037Eh]
        push eax
        mov ecx, dword [dword ebp-035Ah]
        mov ebx, LinesSortedPlayers
        push dword [byte ebp+062h]
        lea edx, [dword ebp-0146h]
        push dword [byte ebp+04Ah]
        mov eax, dword [byte ebp+03Ah]
        call DrawLinesPlayerList
        lea eax, [dword ebp-017EEh]
        push eax
        mov ecx, dword [byte ebp+05Eh]
        push dword [byte ebp+03Ah]
        mov ebx, dword [byte ebp+062h]
        push dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+046h]
        push dword [byte ebp+052h]
        mov eax, dword [byte ebp+042h]
        call DrawLinesPanel
        mov eax, dword [byte ebp+03Ah]
        cmp dword [nosplit eax*4+LinesSortedPlayers], byte 0
        jne short .82
        cmp dword [LinesEditMode], byte 3
        je short .84
        mov eax, dword [byte ebp-026h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01708h], eax
        mov eax, dword [byte ebp-022h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01704h], eax
        mov eax, dword [byte ebp-01Eh]
        jmp short .83
.82:
        cmp dword [LinesEditMode], byte 3
        je short .84
        mov eax, dword [byte ebp-01Ah]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01708h], eax
        mov eax, dword [byte ebp-016h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01704h], eax
        mov eax, dword [byte ebp-012h]
.83:
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01700h], eax
.84:
        cmp dword [byte ebp+03Ah], byte 64h
        je near .72
        mov esi, dword [byte ebp+03Ah]
        shl esi, 2
        cmp dword [dword esi+LinesSortedPlayers], byte 0
        je near .71
        jmp near .72
.85:
        call SlideInSideBar
        jmp near .120
.86:
        mov ecx, 3Eh
        mov esi, LinesWorkTable
        lea edi, [byte ebp-07Ah]
        call SlideInTitleBar
        rep movsb
        mov ebx, dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+052h]
        mov eax, LinesSortedPlayers
        call CountLineSlots
        mov edx, eax
        mov esi, eax
        cmp eax, byte 64h
        jge near .89
        test eax, eax
        je near .89
        mov eax, dword [LinesHeaderTextId]
        call GetLangText
        mov dword [byte ebp+01Eh], eax
        mov eax, dword [LinesTextIds]
        call GetLangText
        push byte 3
        push byte 0
        push dword 0C8h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp+01Eh]
        push dword 140h
        mov dword [LinesIntroOn], 0
        mov dword [byte ebp+022h], eax
        push byte 0
        mov eax, dword [nosplit edx*4+LinesTextIds]
        mov edx, 2
        call GetLangText
.87:
        call MessageBox
        cmp eax, byte 1
        jne short .88
        mov ebx, dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+052h]
        mov eax, LinesSortedPlayers
        call AutoSetLines
        lea eax, [dword ebp-037Eh]
        push eax
        mov ecx, dword [dword ebp-035Ah]
        mov ebx, LinesSortedPlayers
        push dword [byte ebp+062h]
        lea edx, [dword ebp-0146h]
        push dword [byte ebp+04Ah]
        mov eax, dword [byte ebp+03Ah]
        call DrawLinesPlayerList
        lea eax, [dword ebp-017EEh]
        push eax
        mov ecx, dword [byte ebp+05Eh]
        push dword [byte ebp+03Ah]
        mov ebx, dword [byte ebp+062h]
        push dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+046h]
        push dword [byte ebp+052h]
        mov eax, dword [byte ebp+042h]
        call DrawLinesPanel
.88:
        mov eax, dword [byte ebp+03Ah]
        cmp dword [nosplit eax*4+LinesSortedPlayers], byte 0
        jne near .93
        jmp near .92
.89:
        cmp esi, 96h
        jge short .90
        test esi, esi
        je short .90
        mov eax, dword [LinesHeaderTextId]
        call GetLangText
        mov dword [byte ebp+01Eh], eax
        mov eax, dword [LinesTextIds]
        call GetLangText
        mov dword [byte ebp+022h], eax
        lea eax, [byte esi-064h]
        push eax
        mov eax, 1E9h
        mov dword [LinesIntroOn], 0
        call GetLangText
        push eax
        lea eax, [dword ebp-0D6h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push byte 3
        push byte 0
        push dword 0C8h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp+01Eh]
        push byte 0
        mov edx, 2
        lea eax, [dword ebp-0D6h]
        jmp near .87
.90:
        test esi, esi
        je near .93
        mov eax, dword [LinesHeaderTextId]
        call GetLangText
        mov dword [byte ebp+01Eh], eax
        mov eax, dword [LinesTextIds]
        call GetLangText
        mov dword [byte ebp+022h], eax
        lea eax, [dword esi-096h]
        push eax
        mov eax, 1EAh
        mov dword [LinesIntroOn], 0
        call GetLangText
        push eax
        lea eax, [dword ebp-0D6h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push byte 3
        push byte 0
        push dword 0C8h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp+01Eh]
        push byte 0
        mov edx, 2
        lea eax, [dword ebp-0D6h]
        call MessageBox
        cmp eax, byte 1
        jne short .91
        mov ebx, dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+052h]
        mov eax, LinesSortedPlayers
        call AutoSetLines
        lea eax, [dword ebp-037Eh]
        push eax
        mov ecx, dword [dword ebp-035Ah]
        mov ebx, LinesSortedPlayers
        push dword [byte ebp+062h]
        lea edx, [dword ebp-0146h]
        push dword [byte ebp+04Ah]
        mov eax, dword [byte ebp+03Ah]
        call DrawLinesPlayerList
        lea eax, [dword ebp-017EEh]
        push eax
        mov ecx, dword [byte ebp+05Eh]
        push dword [byte ebp+03Ah]
        mov ebx, dword [byte ebp+062h]
        push dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+046h]
        push dword [byte ebp+052h]
        mov eax, dword [byte ebp+042h]
        call DrawLinesPanel
.91:
        mov eax, dword [byte ebp+03Ah]
        cmp dword [nosplit eax*4+LinesSortedPlayers], byte 0
        jne short .93
.92:
        mov dword [LinesIntroOn], 1
.93:
        test esi, esi
        jne near .120
        mov ecx, 3Eh
        mov esi, LinesWorkTable
        mov edi, dword [byte ebp+06Ah]
        rep movsb
        cmp dword [LinesEditMode], byte 3
        jne short .95
        mov eax, dword [LinesEditAway]
        xor edx, edx
        call SetTeamGoalie
        imul eax, dword [LinesEditAway], dword 136h
        mov edx, dword [dword eax+hmtmlines]
        mov dl, byte [byte edx+034h]
        cmp dl, byte [LinesWorkTable+34h]
        je short .94
        mov dx, word [hmscore]
        cmp dx, word [awscore]
        jne short .94
        cmp byte [dword eax+HmGoalieSwapped], 0
        sete dl
        mov byte [dword eax+HmGoalieSwapped], dl
.94:
        imul eax, dword [LinesEditAway], dword 136h
        mov ecx, 3Eh
        mov esi, LinesWorkTable
        mov edi, dword [dword eax+hmtmlines]
        rep movsb
        jmp near .99
.95:
        cmp dword [LinesEditMode], 3E7h
        jle short .96
        cmp dword [LinesEditMode], 2AF8h
        jge short .96
        mov ebx, 4
        lea eax, [byte ebp-02h]
        mov edx, dword [LinesEditMode]
        call MakeSeasonDbPath
        jmp short .98
.96:
        cmp dword [LinesEditMode], byte 0
        jne short .97
        mov edx, 7
        lea eax, [byte ebp-02h]
        call MakeDataPath
        jmp short .98
.97:
        cmp dword [LinesEditMode], 2AF7h
        jle short .99
        mov ebx, 4
        mov edx, dword [LinesEditMode]
        lea eax, [byte ebp-02h]
        sub edx, 2710h
        call MakePlayoffDbPath
.98:
        lea edx, [byte ebp+036h]
        lea eax, [byte ebp-02h]
        call FileOpenWrite
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        imul ebx, dword [LinesEditTeam], dword 31Bh
        mov ecx, 31Bh
        mov edx, dword [byte ebp+032h]
        mov eax, dword [byte ebp+036h]
        call FileWriteAt
        lea eax, [byte ebp+036h]
        call FileClose
.99:
        mov dword [byte ebp+056h], 15h
        jmp near .120
.100:
        push byte 0
        push byte 70h
        push str_LinesSort
        mov dword [byte ebp+03Eh], 0
        call AllocMemBlock
        mov ebx, EditLinesRecords
        add esp, byte 0Ch
        mov dword [RosterPlayerIds], eax
        mov eax, dword [byte ebp+052h]
        xor edx, edx
        mov dword [LinesCardSource], eax
        jmp short .105
.101:
        mov eax, dword [TeamDb]
        add eax, 0A5F0h
        cmp eax, dword [dword edx+LinesPlayerOrder]
        jae short .102
        mov eax, dword [RosterDbPtrs]
        mov dword [edx+eax], 0FFFFFFFFh
        jmp short .104
.102:
        imul esi, dword [byte ebp+03Eh], byte 3Ch
        mov eax, dword [RosterDbPtrs]
        mov ecx, dword [dword esi+EditLinesRecords+28h]
.103:
        mov dword [edx+eax], ecx
.104:
        mov eax, dword [PlayerHeightPtrs]
        lea ecx, [byte ebx+038h]
        mov dword [edx+eax], ecx
        mov eax, dword [PlayerWeightPtrs]
        lea ecx, [byte ebx+039h]
        inc dword [byte ebp+03Eh]
        add ebx, byte 3Ch
        mov dword [edx+eax], ecx
        add edx, byte 4
.105:
        mov eax, dword [byte ebp+03Eh]
        cmp eax, dword [byte ebp+052h]
        jge near .120
        mov eax, dword [RosterPlayerIds]
        mov ecx, dword [byte ebp+03Eh]
        mov dword [edx+eax], ecx
        imul eax, ecx, byte 3Ch
        mov edi, ebx
        mov esi, dword [dword edx+LinesPlayerOrder]
        mov ecx, 3Ch
        mov dword [byte ebp+02Eh], eax
        rep movsb
        mov ecx, dword [byte ebp+02Eh]
        mov eax, dword [RosterPlayerPtrs]
        mov ecx, dword [dword ecx+EditLinesRecords+24h]
        mov dword [edx+eax], ecx
        mov eax, dword [RosterJerseyPtrs]
        lea ecx, [byte ebx+030h]
        mov dword [edx+eax], ecx
        mov eax, dword [EditLinesBuffer]
        lea ecx, [byte ebx+034h]
        mov dword [edx+eax], ecx
        mov eax, dword [RosterFirstNamePtrs]
        mov dword [dword edx+PlayerRecPtrs], ebx
        lea ecx, [byte ebx+01h]
        mov dword [edx+eax], ecx
        mov eax, dword [RosterLastNamePtrs]
        lea ecx, [byte ebx+03h]
        mov dword [edx+eax], ecx
        mov eax, dword [RosterProfilePtrs]
        lea ecx, [byte ebx+013h]
        mov dword [edx+eax], ecx
        mov eax, dword [byte ebp+02Eh]
        mov ecx, dword [byte ebp+03Eh]
        mov al, byte [dword eax+EditLinesRecords+2]
        mov byte [dword ecx+PlayerPosCodes], al
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 1
        jb near .101
        cmp eax, byte 2
        ja near .101
        mov ecx, dword [byte ebp+02Eh]
        mov eax, dword [RosterDbPtrs]
        mov ecx, dword [dword ecx+EditLinesRecords+2Ch]
        jmp near .103
.106:
        cmp dword [byte ebp+03Ah], byte 64h
        je near .113
        cmp dword [byte ebp+056h], byte 17h
        jle near .113
        mov eax, dword [byte ebp+03Ah]
        cmp dword [nosplit eax*4+LinesSortedPlayers], byte 0
        jne near .113
        mov ecx, 3Eh
        mov esi, LinesWorkTable
        lea edi, [byte ebp-07Ah]
        mov ebx, dword [byte ebp+056h]
        rep movsb
        imul eax, dword [byte ebp+042h], byte 50h
        sub ebx, byte 18h
        mov edx, dword [byte ebp+052h]
        shl ebx, 2
        sub edx, dword [byte ebp+04Eh]
        add eax, ebx
        cmp edx, dword [byte ebp+03Ah]
        jle short .109
        mov eax, dword [dword eax+LinesSlotMap]
        movzx edx, byte [byte eax+ebp-07Ah]
        cmp edx, dword [byte ebp+03Ah]
        jne short .108
.107:
        mov byte [byte eax+ebp-07Ah], 64h
        jmp short .111
.108:
        mov dl, byte [byte ebp+03Ah]
        jmp short .110
.109:
        mov ecx, 19h
        sub ecx, edx
        mov eax, dword [dword eax+LinesSlotMap]
        mov edx, ecx
        movzx ebx, byte [byte eax+ebp-07Ah]
        add edx, dword [byte ebp+03Ah]
        cmp ebx, edx
        je short .107
        mov dl, byte [byte ebp+052h]
        sub dl, byte [byte ebp+04Eh]
        mov dh, 19h
        sub dh, dl
        mov dl, dh
        add dl, byte [byte ebp+03Ah]
.110:
        mov byte [byte eax+ebp-07Ah], dl
.111:
        lea eax, [byte ebp-07Ah]
        call LinesValid
        test eax, eax
        je short .112
        mov ecx, 3Eh
        lea esi, [byte ebp-07Ah]
        mov edi, LinesWorkTable
        rep movsb
.112:
        lea eax, [dword ebp-017EEh]
        push eax
        mov ecx, dword [byte ebp+05Eh]
        push dword [byte ebp+03Ah]
        mov ebx, dword [byte ebp+062h]
        push dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+046h]
        push dword [byte ebp+052h]
        mov eax, dword [byte ebp+042h]
        call DrawLinesPanel
        jmp near .118
.113:
        cmp dword [byte ebp+056h], byte 17h
        jle near .118
        mov ecx, 3Eh
        mov esi, LinesWorkTable
        lea edi, [byte ebp-07Ah]
        rep movsb
        mov eax, dword [byte ebp+056h]
        sub eax, byte 18h
        cmp dword [byte ebp+042h], byte 0
        jne short .114
        cmp eax, byte 11h
        jle short .114
        imul edx, dword [byte ebp+042h], byte 50h
        mov eax, dword [dword edx+eax*4+LinesSlotMap]
        movzx eax, byte [byte eax+ebp-07Ah]
        cmp eax, byte 64h
        je short .116
        mov edx, dword [byte ebp+052h]
        mov ebx, 19h
        sub edx, dword [byte ebp+04Eh]
        sub ebx, edx
        sub eax, ebx
        jmp short .115
.114:
        imul edx, dword [byte ebp+042h], byte 50h
        mov eax, dword [dword edx+eax*4+LinesSlotMap]
        movzx eax, byte [byte eax+ebp-07Ah]
        cmp eax, byte 64h
        je short .116
.115:
        mov dword [byte ebp+03Ah], eax
.116:
        lea eax, [dword ebp-017EEh]
        push eax
        mov ecx, dword [byte ebp+05Eh]
        push dword [byte ebp+03Ah]
        mov ebx, dword [byte ebp+062h]
        push dword [byte ebp+04Eh]
        mov edx, dword [byte ebp+046h]
        push dword [byte ebp+052h]
        mov eax, dword [byte ebp+042h]
        call DrawLinesPanel
        lea eax, [dword ebp-037Eh]
        push eax
        mov ecx, dword [dword ebp-035Ah]
        mov ebx, LinesSortedPlayers
        push dword [byte ebp+062h]
        lea edx, [dword ebp-0146h]
        push dword [byte ebp+04Ah]
        mov eax, dword [byte ebp+03Ah]
        call DrawLinesPlayerList
        cmp dword [byte ebp+03Ah], byte 64h
        je near .117
        mov esi, dword [byte ebp+03Ah]
        shl esi, 2
        cmp dword [dword esi+LinesSortedPlayers], byte 0
        jne short .117
        mov eax, dword [LinesCursorArt]
        mov dword [pointerspr], eax
        mov eax, dword [EditLinesRecords+690h]
        push dword [LinesIntroTeam]
        mov dword [MenuCursorPixels], eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call ClearClipRect
        mov ecx, dword [byte ebp+062h]
        add esp, byte 4
        mov eax, dword [dword esi+LinesPlayerOrder]
        xor edx, edx
        push byte 0
        movzx ebx, byte [byte eax+01h]
        push dword [byte ebp+05Eh]
        xor eax, eax
        call DrawLineJersey
        push byte 19h
        push byte 19h
        push dword [pointerspr]
        call DrawArt
        add esp, byte 0Ch
        call SetScreenTarget
        mov dword [LinesIntroOn], 1
        jmp short .118
.117:
        mov word [MenuViewStored], 0
        mov dword [LinesIntroOn], 0
.118:
        cmp dword [LinesEditMode], byte 3
        je short .120
        mov eax, dword [byte ebp+03Ah]
        cmp dword [nosplit eax*4+LinesSortedPlayers], byte 0
        jne near .124
        mov eax, dword [byte ebp-026h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01708h], eax
        mov eax, dword [byte ebp-022h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01704h], eax
        mov eax, dword [byte ebp-01Eh]
.119:
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01700h], eax
.120:
        cmp dword [byte ebp+056h], byte 15h
        je near .125
        cmp dword [byte ebp+056h], byte 3
        je near .125
        mov dword [byte ebp+056h], 0FFFFFFFFh
.121:
        cmp dword [byte ebp+056h], byte 0
        jge near .39
        cmp dword [MenuMouseX], 19Ah
        jge short .122
        cmp dword [MenuMouseY], byte 7Ah
        jle short .122
        cmp dword [MenuMouseY], 1BFh
        jge short .122
        cmp dword [LinesIntroOn], byte 0
        jne short .123
.122:
        mov eax, dword [LinesCursorArt]
        mov dword [pointerspr], eax
        mov eax, dword [EditLinesRecords+690h]
        mov word [MenuViewStored], 0
        mov dword [MenuCursorPixels], eax
.123:
        push byte 3
        lea eax, [byte ebp+056h]
        push byte 15h
        mov ecx, EditLinesHoverPanel
        mov ebx, 0FFFFFFFFh
        push eax
        lea edx, [dword ebp-017EEh]
        mov eax, 2Dh
        call RunMenu
        cmp word [MenuViewStored], byte 0
        jne short .121
        mov eax, dword [LinesCursorArt]
        mov dword [pointerspr], eax
        mov eax, dword [EditLinesRecords+690h]
        mov dword [MenuCursorPixels], eax
        jmp near .121
.124:
        mov eax, dword [byte ebp-01Ah]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01708h], eax
        mov eax, dword [byte ebp-016h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-01704h], eax
        mov eax, dword [byte ebp-012h]
        jmp near .119
.125:
        push dword [byte ebp+062h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+05Eh]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+04Ah]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp+046h]
        xor esi, esi
        call FreeBitmap
        add esp, byte 4
.126:
        push dword [byte esi+ebp-032h]
        call FreeBitmap
        add esi, byte 4
        add esp, byte 4
        cmp esi, byte 30h
        jne short .126
        lea eax, [dword ebp-037Eh]
        call FreeScrollBar
        push dword [LinesIntroTeam]
        call FreeBitmap
        add esp, byte 4
        push dword [LinesHoverArt]
        call FreeBitmap
        add esp, byte 4
        mov eax, 3
        mov word [MenuViewStored], 0
        call FadeOut
        mov eax, dword [LinesCursorArt]
        mov dword [pointerspr], eax
        mov eax, dword [EditLinesRecords+690h]
        mov dword [MenuCursorPixels], eax
        cmp dword [byte ebp+056h], byte 3
        je short .127
        mov eax, 2
        jmp short .128
.127:
        xor eax, eax
.128:
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LinesValid                                      9F0D8  96 PC, low confidence
; 0 when a player is twice in the forward lines (4 x 3) or the defence pairs
;-----------------------------------------------------------------------------
LinesValid:
        push ebx
        push ecx
        push edx
        push esi
        mov ebx, eax
        mov ecx, eax
        xor esi, esi
.1:
        mov edx, 3
        mov eax, ecx
        call HasDuplicateInLine
        test eax, eax
        je short .3
.2:
        xor eax, eax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.3:
        inc esi
        add ecx, byte 3
        cmp esi, byte 4
        jl short .1
        lea ecx, [byte ebx+0Ch]
        xor esi, esi
.4:
        mov edx, 2
        mov eax, ecx
        call HasDuplicateInLine
        test eax, eax
        jne short .2
        inc esi
        inc ecx
        inc ecx
        cmp esi, byte 3
        jl short .4
        mov edx, 2
        lea eax, [byte ebx+024h]
        call HasDuplicateInLine
        test eax, eax
        jne short .2
        mov edx, 2
        lea eax, [byte ebx+034h]
        call HasDuplicateInLine
        test eax, eax
        jne short .2
        lea ecx, [byte ebx+012h]
        xor esi, esi
.5:
        mov edx, 5
        mov eax, ecx
        call HasDuplicateInLine
        test eax, eax
        jne short .2
        inc esi
        add ecx, byte 5
        cmp esi, byte 2
        jl short .5
        lea ecx, [byte ebx+01Ch]
        xor esi, esi
.6:
        mov edx, 4
        mov eax, ecx
        call HasDuplicateInLine
        test eax, eax
        jne near .2
        inc esi
        add ecx, byte 4
        cmp esi, byte 2
        jl short .6
        lea ecx, [byte ebx+026h]
        xor esi, esi
.7:
        mov edx, 4
        mov eax, ecx
        call HasDuplicateInLine
        test eax, eax
        jne near .2
        inc esi
        add ecx, byte 4
        cmp esi, byte 2
        jl short .7
        lea ecx, [byte ebx+02Eh]
        xor esi, esi
.8:
        mov edx, 3
        mov eax, ecx
        call HasDuplicateInLine
        test eax, eax
        jne near .2
        inc esi
        add ecx, byte 3
        cmp esi, byte 2
        jl short .8
        mov eax, ebx
        xor ecx, ecx
.9:
        movzx esi, byte [eax]
        cmp esi, byte 19h
        jl short .10
        cmp esi, byte 64h
        jne near .2
.10:
        inc ecx
        inc eax
        cmp ecx, byte 34h
        jl short .9
        movzx eax, byte [byte ebx+034h]
        cmp eax, byte 19h
        jl near .2
        movzx eax, byte [byte ebx+035h]
        cmp eax, byte 19h
        jl near .2
        mov eax, 1
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CountLineSlots                                  9F205  96 PC, low confidence
; Counts the filled and empty line slots for AutoSetLines
;-----------------------------------------------------------------------------
CountLineSlots:
        push ecx
        push esi
        push edi
        enter 94h, 0
        push eax
        sub ebp, 82h
        mov ecx, edx
        mov dword [byte ebp-012h], ebx
        mov dword [byte ebp-0Eh], 0
        mov edx, dword [byte ebp-016h]
        xor ebx, ebx
        xor eax, eax
        jmp short .4
.1:
        cmp dword [edx], byte 0
        je short .2
        cmp dword [edx], byte 2
        jne short .3
.2:
        inc dword [byte ebp-0Eh]
.3:
        add edx, byte 4
        inc eax
.4:
        cmp eax, ecx
        jl short .1
        mov dword [byte ebp+03Ah], 0
        mov esi, ecx
        xor eax, eax
        shl esi, 2
        xor edx, edx
        mov dword [byte ebp+01Ah], esi
        jmp short .7
.5:
        mov esi, dword [dword edx+LinesPlayerOrder]
        movsx esi, byte [byte esi+02h]
        cmp esi, byte 47h
        jne short .6
        mov esi, dword [byte ebp-016h]
        cmp dword [edx+esi], byte 0
        jne short .6
        inc dword [byte ebp+03Ah]
.6:
        add edx, byte 4
        inc eax
.7:
        cmp edx, dword [byte ebp+01Ah]
        jl short .5
        cmp dword [byte ebp-0Eh], byte 14h
        jle short .8
        mov eax, dword [byte ebp-0Eh]
        add eax, byte 50h
        jmp near CountLineSlots_4DD
.8:
        jge short .9
        mov eax, 0AAh
        sub eax, dword [byte ebp-0Eh]
        jmp near CountLineSlots_4DD
.9:
        cmp dword [byte ebp+03Ah], byte 2
        jle short .10
        mov eax, 0Fh
        jmp near CountLineSlots_4DD
.10:
        movzx eax, byte [LinesWorkTable+24h]
        cmp eax, byte 64h
        je near .35
        movzx eax, byte [LinesWorkTable+25h]
        cmp eax, byte 64h
        je near .35
        xor eax, eax
        mov dword [byte ebp+01Eh], eax
.11:
        mov edx, dword [byte ebp+01Eh]
        mov dword [byte ebp-06h], 0
        mov dword [byte ebp+02h], edx
        mov edi, edx
.12:
        mov dword [byte ebp-0Ah], 0
        mov esi, dword [byte ebp+02h]
.13:
        mov dl, byte [LinesWorkTable+24h]
        cmp dl, byte [dword edi+LinesWorkTable]
        jne short .14
        mov dl, byte [LinesWorkTable+25h]
        cmp dl, byte [dword esi+LinesWorkTable]
        jne short .14
        mov eax, 1
        jmp near CountLineSlots_4DD
.14:
        inc dword [byte ebp-0Ah]
        inc esi
        cmp dword [byte ebp-0Ah], byte 3
        jl short .13
        inc dword [byte ebp-06h]
        inc edi
        cmp dword [byte ebp-06h], byte 3
        jl short .12
        add dword [byte ebp+01Eh], byte 3
        inc eax
        cmp dword [byte ebp+01Eh], byte 0Ch
        jl short .11
        xor eax, eax
        mov dword [byte ebp+022h], eax
.15:
        mov edx, dword [byte ebp+022h]
        mov dword [byte ebp+07Ah], 0
        mov dword [byte ebp+06h], edx
        mov esi, edx
.16:
        mov dword [byte ebp+04Eh], 0
        mov edi, dword [byte ebp+06h]
.17:
        mov dl, byte [LinesWorkTable+24h]
        cmp dl, byte [dword esi+LinesWorkTable+0Ch]
        jne short .18
        mov dl, byte [LinesWorkTable+25h]
        cmp dl, byte [dword edi+LinesWorkTable+0Ch]
        jne short .18
        mov eax, 2
        jmp near CountLineSlots_4DD
.18:
        inc dword [byte ebp+04Eh]
        inc edi
        cmp dword [byte ebp+04Eh], byte 2
        jl short .17
        inc dword [byte ebp+07Ah]
        inc esi
        cmp dword [byte ebp+07Ah], byte 2
        jl short .16
        add dword [byte ebp+022h], byte 2
        inc eax
        cmp dword [byte ebp+022h], byte 6
        jl short .15
        xor eax, eax
        mov dword [byte ebp+026h], eax
.19:
        mov edx, dword [byte ebp+026h]
        mov dword [byte ebp+076h], 0
        mov dword [byte ebp+0Ah], edx
        mov esi, edx
.20:
        mov dword [byte ebp+04Ah], 0
        mov edi, dword [byte ebp+0Ah]
.21:
        mov dl, byte [LinesWorkTable+24h]
        cmp dl, byte [dword esi+LinesWorkTable+12h]
        jne short .22
        mov dl, byte [LinesWorkTable+25h]
        cmp dl, byte [dword edi+LinesWorkTable+12h]
        jne short .22
        mov eax, 3
        jmp near CountLineSlots_4DD
.22:
        inc dword [byte ebp+04Ah]
        inc edi
        cmp dword [byte ebp+04Ah], byte 5
        jl short .21
        inc dword [byte ebp+076h]
        inc esi
        cmp dword [byte ebp+076h], byte 5
        jl short .20
        add dword [byte ebp+026h], byte 5
        inc eax
        cmp dword [byte ebp+026h], byte 0Ah
        jl short .19
        xor eax, eax
        mov dword [byte ebp+02Ah], eax
.23:
        mov edx, dword [byte ebp+02Ah]
        mov dword [byte ebp+072h], 0
        mov dword [byte ebp+0Eh], edx
        mov edi, edx
.24:
        mov dword [byte ebp+046h], 0
        mov esi, dword [byte ebp+0Eh]
.25:
        mov dl, byte [LinesWorkTable+24h]
        cmp dl, byte [dword edi+LinesWorkTable+1Ch]
        jne short .26
        mov dl, byte [LinesWorkTable+25h]
        cmp dl, byte [dword esi+LinesWorkTable+1Ch]
        jne short .26
        mov eax, 4
        jmp near CountLineSlots_4DD
.26:
        inc dword [byte ebp+046h]
        inc esi
        cmp dword [byte ebp+046h], byte 4
        jl short .25
        inc dword [byte ebp+072h]
        inc edi
        cmp dword [byte ebp+072h], byte 4
        jl short .24
        add dword [byte ebp+02Ah], byte 4
        inc eax
        cmp dword [byte ebp+02Ah], byte 8
        jl short .23
        xor eax, eax
        xor esi, esi
.27:
        mov dword [byte ebp+06Eh], 0
        mov dword [byte ebp+012h], esi
        mov dword [byte ebp+032h], esi
.28:
        mov edx, dword [byte ebp+012h]
        mov dword [byte ebp+042h], 0
        mov dword [byte ebp+02Eh], edx
.29:
        mov edi, dword [byte ebp+032h]
        mov dl, byte [LinesWorkTable+24h]
        cmp dl, byte [dword edi+LinesWorkTable+26h]
        jne short .30
        mov edi, dword [byte ebp+02Eh]
        mov dl, byte [LinesWorkTable+25h]
        cmp dl, byte [dword edi+LinesWorkTable+26h]
        jne short .30
        mov eax, 5
        jmp near CountLineSlots_4DD
.30:
        inc dword [byte ebp+042h]
        inc dword [byte ebp+02Eh]
        cmp dword [byte ebp+042h], byte 4
        jl short .29
        inc dword [byte ebp+06Eh]
        inc dword [byte ebp+032h]
        cmp dword [byte ebp+06Eh], byte 4
        jl short .28
        add esi, byte 4
        inc eax
        cmp esi, byte 8
        jl short .27
        xor eax, eax
        mov dword [byte ebp+036h], eax
.31:
        mov edx, dword [byte ebp+036h]
        mov dword [byte ebp+06Ah], 0
        mov dword [byte ebp+016h], edx
        mov esi, edx
.32:
        mov dword [byte ebp+03Eh], 0
        mov edi, dword [byte ebp+016h]
.33:
        mov dl, byte [LinesWorkTable+24h]
        cmp dl, byte [dword esi+LinesWorkTable+2Eh]
        jne short .34
        mov dl, byte [LinesWorkTable+25h]
        cmp dl, byte [dword edi+LinesWorkTable+2Eh]
        jne short .34
        mov eax, 6
        jmp near CountLineSlots_4DD
.34:
        inc dword [byte ebp+03Eh]
        inc edi
        cmp dword [byte ebp+03Eh], byte 3
        jl short .33
        inc dword [byte ebp+06Ah]
        inc esi
        cmp dword [byte ebp+06Ah], byte 3
        jl short .32
        add dword [byte ebp+036h], byte 3
        inc eax
        cmp dword [byte ebp+036h], byte 6
        jl short .31
.35:
        xor eax, eax
        xor esi, esi
.36:
        mov dword [byte ebp+066h], 0
        mov edx, esi
.37:
        movzx edi, byte [dword edx+LinesWorkTable]
        cmp edi, byte 64h
        jne short .38
        mov eax, 7
        jmp near CountLineSlots_4DD
.38:
        inc dword [byte ebp+066h]
        inc edx
        cmp dword [byte ebp+066h], byte 3
        jl short .37
        add esi, byte 3
        inc eax
        cmp esi, byte 0Ch
        jl short .36
        xor eax, eax
        xor esi, esi
.39:
        mov dword [byte ebp+062h], 0
        mov edx, esi
.40:
        movzx edi, byte [dword edx+LinesWorkTable+0Ch]
        cmp edi, byte 64h
        jne short .41
        mov eax, 8
        jmp near CountLineSlots_4DD
.41:
        inc dword [byte ebp+062h]
        inc edx
        cmp dword [byte ebp+062h], byte 2
        jl short .40
        inc esi
        inc esi
        inc eax
        cmp esi, byte 6
        jl short .39
        xor eax, eax
        xor esi, esi
.42:
        mov dword [byte ebp+05Eh], 0
        mov edx, esi
.43:
        movzx edi, byte [dword edx+LinesWorkTable+12h]
        cmp edi, byte 64h
        jne short .44
        mov eax, 9
        jmp near CountLineSlots_4DD
.44:
        inc dword [byte ebp+05Eh]
        inc edx
        cmp dword [byte ebp+05Eh], byte 5
        jl short .43
        add esi, byte 5
        inc eax
        cmp esi, byte 0Ah
        jl short .42
        xor eax, eax
        xor esi, esi
.45:
        mov dword [byte ebp+05Ah], 0
        mov edx, esi
.46:
        movzx edi, byte [dword edx+LinesWorkTable+1Ch]
        cmp edi, byte 64h
        jne short .47
        mov eax, 0Ah
        jmp near CountLineSlots_4DD
.47:
        inc dword [byte ebp+05Ah]
        inc edx
        cmp dword [byte ebp+05Ah], byte 4
        jl short .46
        add esi, byte 4
        inc eax
        cmp esi, byte 8
        jl short .45
        xor eax, eax
        xor esi, esi
.48:
        mov dword [byte ebp+056h], 0
        mov edx, esi
.49:
        movzx edi, byte [dword edx+LinesWorkTable+26h]
        cmp edi, byte 64h
        jne short .50
        mov eax, 0Bh
        jmp near CountLineSlots_4DD
.50:
        inc dword [byte ebp+056h]
        inc edx
        cmp dword [byte ebp+056h], byte 4
        jl short .49
        add esi, byte 4
        inc eax
        cmp esi, byte 8
        jl short .48
        xor eax, eax
        xor esi, esi
.51:
        mov dword [byte ebp+052h], 0
        mov edx, esi
.52:
        movzx edi, byte [dword edx+LinesWorkTable+2Eh]
        cmp edi, byte 64h
        jne short .53
        mov eax, 0Ch
        jmp near CountLineSlots_4DD
.53:
        inc dword [byte ebp+052h]
        inc edx
        cmp dword [byte ebp+052h], byte 3
        jl short .52
        add esi, byte 3
        inc eax
        cmp esi, byte 6
        jl short .51
        xor eax, eax
.54:
        movzx edx, byte [dword eax+LinesWorkTable+34h]
        cmp edx, byte 64h
        jne short .55
        mov eax, 0Dh
        jmp near CountLineSlots_4DD
.55:
        inc eax
        cmp eax, byte 2
        jl short .54
        xor eax, eax
.56:
        movzx edx, byte [dword eax+LinesWorkTable+24h]
        cmp edx, byte 64h
        jne short .57
        mov eax, 0Eh
        jmp short CountLineSlots_4DD
.57:
        inc eax
        cmp eax, byte 2
        jl short .56
        mov dl, cl
        sub dl, byte [byte ebp-012h]
        mov byte [byte ebp+07Eh], dl
        mov edx, ecx
        sub edx, dword [byte ebp-012h]
        xor eax, eax
        mov dword [byte ebp-02h], edx
        mov dl, al
        mov esi, dword [byte ebp-016h]
        add dl, 19h
        jmp short .62
.58:
        cmp dword [esi], byte 1
        jne short .61
        cmp eax, dword [byte ebp-02h]
        jge short .59
        mov byte [dword ebx+LinesWorkTable+36h], al
        jmp short .60
.59:
        mov dh, dl
        sub dh, byte [byte ebp+07Eh]
        mov byte [dword ebx+LinesWorkTable+36h], dh
.60:
        inc ebx
.61:
        add esi, byte 4
        inc dl
        inc eax
.62:
        cmp eax, ecx
        jl short .58
        xor eax, eax
CountLineSlots_4DD:
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; HasDuplicateInLine                              9F6ED  96 PC, low confidence
; (line, size): 1 when a player is in the line twice
;-----------------------------------------------------------------------------
HasDuplicateInLine:
        push ebx
        push ecx
        push esi
        push edi
        enter 4, 0
        push eax
        mov edi, edx
        mov dword [byte ebp-04h], eax
        xor esi, esi
        jmp short .5
.1:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-08h]
        xor ebx, ebx
        jmp short .4
.2:
        mov cl, byte [eax]
        cmp cl, byte [edx]
        jne short .3
        cmp esi, ebx
        je short .3
        movzx ecx, cl
        cmp ecx, byte 64h
        je short .3
        mov eax, 1
        jmp short HasDuplicateInLine_45
.3:
        inc edx
        inc ebx
.4:
        cmp ebx, edi
        jl short .2
        inc dword [byte ebp-04h]
        inc esi
.5:
        cmp esi, edi
        jl short .1
        xor eax, eax
HasDuplicateInLine_45:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawLinesPanel                                  9F738  96 PC, low confidence
; Draws the lines panel (power play bkpp, penalty kill bkpk) with the jerseys
;-----------------------------------------------------------------------------
DrawLinesPanel:
        push esi
        push edi
        enter 84h, 0
        push eax
        push edx
        sub ebp, byte 72h
        mov esi, ebx
        mov dword [byte ebp-012h], ecx
        push edx
        call SetDrawBitmap
        mov eax, dword [dword ebp+08Eh]
        xor edi, edi
        add eax, 990h
        add esp, byte 4
        mov dword [byte ebp+04Eh], eax
        cmp dword [byte ebp-016h], byte 1
        jb short .1
        jbe near .15
        cmp dword [byte ebp-016h], byte 2
        je near .28
        jmp near .39
.1:
        cmp dword [byte ebp-016h], byte 0
        jne near .39
        push byte 0FFFFFF86h
        push edi
        push str_Bkgd20
        mov eax, dword [dword ebp+08Eh]
        push esi
        mov byte [dword eax+0A8h], 2Bh
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        mov eax, dword [byte ebp+04Eh]
        add esp, byte 0Ch
        xor edx, edx
        mov dword [byte ebp-06h], eax
        xor eax, eax
.2:
        mov ebx, dword [dword edx+LinesPanelEvenX]
        mov dword [dword eax+LinesPanelItems+40h], ebx
        mov ebx, dword [dword edx+LinesPanelEvenY]
        mov ecx, dword [dword edx+LinesPanelEvenY]
        mov dword [dword eax+LinesPanelItems+44h], ebx
        mov ebx, dword [dword edx+LinesPanelEvenX]
        mov dword [dword eax+LinesPanelItems+4Ch], ecx
        add ebx, byte 32h
        mov dword [dword eax+LinesPanelItems+48h], ebx
        mov dword [dword eax+LinesPanelItems+50h], ebx
        lea ebx, [byte ecx+032h]
        mov ecx, dword [dword edx+LinesPanelEvenX]
        mov dword [dword eax+LinesPanelItems+54h], ebx
        mov dword [dword eax+LinesPanelItems+58h], ecx
        mov ecx, dword [byte ebp-06h]
        mov dword [dword eax+LinesPanelItems+5Ch], ebx
        mov ebx, dword [dword edx+LinesPanelEvenNav]
        mov dword [byte ecx+042h], ebx
        movzx ebx, byte [byte ecx+043h]
        cmp ebx, byte 1
        jne short .3
        cmp dword [LinesEditMode], byte 3
        jne short .3
        mov byte [byte ecx+043h], 15h
.3:
        add dword [byte ebp-06h], byte 66h
        add edx, byte 4
        add eax, byte 40h
        cmp edx, byte 50h
        jne near .2
        mov dword [byte ebp+066h], 0
.4:
        imul eax, dword [byte ebp+066h], byte 3
        mov edx, edi
        shl edx, 2
        mov dword [byte ebp+036h], eax
        add eax, byte 3
        mov dword [byte ebp+032h], edx
        mov dword [byte ebp+03Ah], eax
.5:
        mov eax, dword [byte ebp+036h]
        movzx eax, byte [dword eax+LinesWorkTable]
        cmp eax, byte 64h
        jne short .6
        push byte 0
        mov eax, dword [byte ebp+032h]
        mov ebx, 64h
        jmp short .7
.6:
        cmp eax, dword [dword ebp+08Ah]
        sete dl
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        movzx edx, dl
        movzx ebx, byte [byte eax+01h]
        mov eax, dword [byte ebp+032h]
        push edx
.7:
        mov ecx, esi
        mov edx, dword [dword eax+LinesPanelEvenY]
        push dword [byte ebp-012h]
        sub edx, byte 7Ah
        mov eax, dword [dword eax+LinesPanelEvenX]
        call DrawLineJersey
        inc dword [byte ebp+036h]
        add dword [byte ebp+032h], byte 4
        mov eax, dword [byte ebp+036h]
        inc edi
        cmp eax, dword [byte ebp+03Ah]
        jne short .5
        inc dword [byte ebp+066h]
        cmp dword [byte ebp+066h], byte 4
        jl short .4
        mov dword [byte ebp+056h], 0
.8:
        mov eax, dword [byte ebp+056h]
        mov edx, edi
        add eax, eax
        shl edx, 2
        mov dword [byte ebp+042h], eax
        inc eax
        inc eax
        mov dword [byte ebp+03Eh], edx
        mov dword [byte ebp+046h], eax
.9:
        mov eax, dword [byte ebp+042h]
        movzx eax, byte [dword eax+LinesWorkTable+0Ch]
        cmp eax, byte 64h
        jne short .10
        push byte 0
        mov eax, dword [byte ebp+03Eh]
        mov ebx, 64h
        jmp short .11
.10:
        cmp eax, dword [dword ebp+08Ah]
        sete dl
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        movzx edx, dl
        movzx ebx, byte [byte eax+01h]
        mov eax, dword [byte ebp+03Eh]
        push edx
.11:
        mov ecx, esi
        mov edx, dword [dword eax+LinesPanelEvenY]
        push dword [byte ebp-012h]
        sub edx, byte 7Ah
        mov eax, dword [dword eax+LinesPanelEvenX]
        call DrawLineJersey
        inc dword [byte ebp+042h]
        add dword [byte ebp+03Eh], byte 4
        mov eax, dword [byte ebp+042h]
        inc edi
        cmp eax, dword [byte ebp+046h]
        jne short .9
        inc dword [byte ebp+056h]
        cmp dword [byte ebp+056h], byte 3
        jl short .8
        mov eax, edi
        shl eax, 2
        mov dword [byte ebp+052h], 0
        mov dword [byte ebp+04Ah], eax
.12:
        mov eax, dword [byte ebp+052h]
        movzx eax, byte [dword eax+LinesWorkTable+34h]
        cmp eax, byte 64h
        jne short .13
        push byte 0
        mov eax, dword [byte ebp+04Ah]
        mov ebx, 64h
        jmp short .14
.13:
        add eax, dword [dword ebp+082h]
        sub eax, dword [dword ebp+086h]
        lea edx, [byte eax-019h]
        cmp edx, dword [dword ebp+08Ah]
        sete dl
        mov eax, dword [nosplit eax*4+LinesPanelPlayers]
        movzx edx, dl
        movzx ebx, byte [byte eax+01h]
        mov eax, dword [byte ebp+04Ah]
        push edx
.14:
        mov ecx, esi
        mov edx, dword [dword eax+LinesPanelEvenY]
        push dword [byte ebp-012h]
        sub edx, byte 7Ah
        mov eax, dword [dword eax+LinesPanelEvenX]
        call DrawLineJersey
        add dword [byte ebp+04Ah], byte 4
        inc dword [byte ebp+052h]
        inc edi
        cmp dword [byte ebp+052h], byte 2
        jge near .39
        jmp short .12
.15:
        push edi
        push edi
        push str_Bkpp
        push esi
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        mov eax, dword [byte ebp+04Eh]
        add esp, byte 0Ch
        xor edx, edx
        mov dword [byte ebp-0Ah], eax
        xor eax, eax
.16:
        add eax, byte 40h
        mov ebx, dword [dword edx+LinesPanelPowerX]
        mov dword [dword eax+LinesPanelItems], ebx
        mov ebx, dword [dword edx+LinesPanelPowerY]
        mov ecx, dword [dword edx+LinesPanelPowerY]
        mov dword [dword eax+LinesPanelItems+4], ebx
        mov ebx, dword [dword edx+LinesPanelPowerX]
        mov dword [dword eax+LinesPanelItems+0Ch], ecx
        add ebx, byte 32h
        mov dword [dword eax+LinesPanelItems+8], ebx
        mov dword [dword eax+LinesPanelItems+10h], ebx
        lea ebx, [byte ecx+032h]
        mov dword [dword eax+LinesPanelItems+14h], ebx
        mov ecx, dword [dword edx+LinesPanelPowerX]
        mov dword [dword eax+LinesPanelItems+1Ch], ebx
        add edx, byte 4
        mov dword [dword eax+LinesPanelItems+18h], ecx
        mov ecx, dword [byte ebp-0Ah]
        mov ebx, dword [dword edx+LinesPanelPowerNav]
        add dword [byte ebp-0Ah], byte 66h
        mov dword [byte ecx+042h], ebx
        cmp edx, byte 50h
        jne short .16
        mov dword [byte ebp+06Ah], 0
.17:
        imul eax, dword [byte ebp+06Ah], byte 5
        mov edx, edi
        shl edx, 2
        mov dword [byte ebp+01Ah], eax
        add eax, byte 5
        mov dword [byte ebp+016h], edx
        mov dword [byte ebp+01Eh], eax
.18:
        mov eax, dword [byte ebp+01Ah]
        movzx eax, byte [dword eax+LinesWorkTable+12h]
        cmp eax, byte 64h
        jne short .19
        push byte 0
        mov eax, dword [byte ebp+016h]
        mov ebx, 64h
        jmp short .20
.19:
        cmp eax, dword [dword ebp+08Ah]
        sete dl
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        movzx edx, dl
        movzx ebx, byte [byte eax+01h]
        mov eax, dword [byte ebp+016h]
        push edx
.20:
        mov ecx, esi
        mov edx, dword [dword eax+LinesPanelPowerY]
        push dword [byte ebp-012h]
        sub edx, byte 7Ah
        mov eax, dword [dword eax+LinesPanelPowerX]
        call DrawLineJersey
        inc dword [byte ebp+01Ah]
        add dword [byte ebp+016h], byte 4
        mov eax, dword [byte ebp+01Ah]
        inc edi
        cmp eax, dword [byte ebp+01Eh]
        jne short .18
        inc dword [byte ebp+06Ah]
        cmp dword [byte ebp+06Ah], byte 2
        jl short .17
        mov dword [byte ebp+05Eh], 0
.21:
        mov eax, dword [byte ebp+05Eh]
        mov edx, edi
        shl eax, 2
        shl edx, 2
        mov dword [byte ebp+026h], eax
        add eax, byte 4
        mov dword [byte ebp+022h], edx
        mov dword [byte ebp+02Ah], eax
.22:
        mov eax, dword [byte ebp+026h]
        movzx eax, byte [dword eax+LinesWorkTable+1Ch]
        cmp eax, byte 64h
        jne short .23
        push byte 0
        mov eax, dword [byte ebp+022h]
        mov ebx, 64h
        jmp short .24
.23:
        cmp eax, dword [dword ebp+08Ah]
        sete dl
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        movzx edx, dl
        movzx ebx, byte [byte eax+01h]
        mov eax, dword [byte ebp+022h]
        push edx
.24:
        mov ecx, esi
        mov edx, dword [dword eax+LinesPanelPowerY]
        push dword [byte ebp-012h]
        sub edx, byte 7Ah
        mov eax, dword [dword eax+LinesPanelPowerX]
        call DrawLineJersey
        inc dword [byte ebp+026h]
        add dword [byte ebp+022h], byte 4
        mov eax, dword [byte ebp+026h]
        inc edi
        cmp eax, dword [byte ebp+02Ah]
        jne short .22
        inc dword [byte ebp+05Eh]
        cmp dword [byte ebp+05Eh], byte 2
        jl short .21
        mov eax, edi
        shl eax, 2
        mov dword [byte ebp+05Ah], 0
        mov dword [byte ebp+02Eh], eax
.25:
        mov eax, dword [byte ebp+05Ah]
        movzx eax, byte [dword eax+LinesWorkTable+24h]
        cmp eax, byte 64h
        jne short .26
        push byte 0
        mov eax, dword [byte ebp+02Eh]
        mov ebx, 64h
        jmp short .27
.26:
        cmp eax, dword [dword ebp+08Ah]
        sete dl
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        movzx edx, dl
        movzx ebx, byte [byte eax+01h]
        mov eax, dword [byte ebp+02Eh]
        push edx
.27:
        mov ecx, esi
        mov edx, dword [dword eax+LinesPanelPowerY]
        push dword [byte ebp-012h]
        sub edx, byte 7Ah
        mov eax, dword [dword eax+LinesPanelPowerX]
        call DrawLineJersey
        add dword [byte ebp+02Eh], byte 4
        inc dword [byte ebp+05Ah]
        inc edi
        cmp dword [byte ebp+05Ah], byte 2
        jge near .39
        jmp short .25
.28:
        push edi
        push edi
        push str_Bkpk
        mov eax, dword [dword ebp+08Eh]
        push esi
        mov byte [dword eax+0A8h], 25h
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        mov ebx, dword [byte ebp+04Eh]
        add esp, byte 0Ch
        xor eax, eax
        xor edx, edx
.29:
        mov ecx, dword [dword edx+LinesPanelKillX]
        mov dword [dword eax+LinesPanelItems+40h], ecx
        mov ecx, dword [dword edx+LinesPanelKillY]
        mov dword [dword eax+LinesPanelItems+44h], ecx
        mov ecx, dword [dword edx+LinesPanelKillX]
        add ecx, byte 32h
        mov dword [byte ebp-0Eh], ecx
        mov dword [dword eax+LinesPanelItems+48h], ecx
        mov ecx, dword [dword edx+LinesPanelKillY]
        mov dword [dword eax+LinesPanelItems+4Ch], ecx
        mov ecx, dword [byte ebp-0Eh]
        mov dword [dword eax+LinesPanelItems+50h], ecx
        mov ecx, dword [dword edx+LinesPanelKillY]
        add ecx, byte 32h
        add eax, byte 40h
        mov dword [byte ebp-0Eh], ecx
        mov dword [dword eax+LinesPanelItems+14h], ecx
        mov ecx, dword [dword edx+LinesPanelKillX]
        mov dword [dword eax+LinesPanelItems+18h], ecx
        mov ecx, dword [byte ebp-0Eh]
        add ebx, byte 66h
        mov dword [dword eax+LinesPanelItems+1Ch], ecx
        mov ecx, dword [dword edx+LinesPanelKillNav]
        add edx, byte 4
        mov dword [byte ebx-024h], ecx
        cmp edx, byte 38h
        jne short .29
        mov eax, 380h
.30:
        add eax, byte 40h
        mov dword [dword eax+LinesPanelItems], 0
        mov dword [dword eax+LinesPanelItems+4], 0
        mov dword [dword eax+LinesPanelItems+8], 1
        mov dword [dword eax+LinesPanelItems+0Ch], 0
        mov dword [dword eax+LinesPanelItems+10h], 1
        mov dword [dword eax+LinesPanelItems+14h], 1
        mov dword [dword eax+LinesPanelItems+18h], 0
        mov dword [dword eax+LinesPanelItems+1Ch], 1
        cmp eax, 500h
        jne short .30
        mov dword [byte ebp+06Eh], 0
.31:
        mov eax, dword [byte ebp+06Eh]
        mov edx, edi
        shl eax, 2
        shl edx, 2
        mov dword [byte ebp+02h], eax
        add eax, byte 4
        mov dword [byte ebp-02h], edx
        mov dword [byte ebp+06h], eax
.32:
        mov eax, dword [byte ebp+02h]
        movzx eax, byte [dword eax+LinesWorkTable+26h]
        cmp eax, byte 64h
        jne short .33
        push byte 0
        mov eax, dword [byte ebp-02h]
        mov ebx, 64h
        jmp short .34
.33:
        cmp eax, dword [dword ebp+08Ah]
        sete dl
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        movzx edx, dl
        movzx ebx, byte [byte eax+01h]
        mov eax, dword [byte ebp-02h]
        push edx
.34:
        mov ecx, esi
        mov edx, dword [dword eax+LinesPanelKillY]
        push dword [byte ebp-012h]
        sub edx, byte 7Ah
        mov eax, dword [dword eax+LinesPanelKillX]
        call DrawLineJersey
        inc dword [byte ebp+02h]
        add dword [byte ebp-02h], byte 4
        mov eax, dword [byte ebp+02h]
        inc edi
        cmp eax, dword [byte ebp+06h]
        jne short .32
        inc dword [byte ebp+06Eh]
        cmp dword [byte ebp+06Eh], byte 2
        jl short .31
        mov dword [byte ebp+062h], 0
.35:
        imul eax, dword [byte ebp+062h], byte 3
        mov edx, edi
        shl edx, 2
        mov dword [byte ebp+0Eh], eax
        add eax, byte 3
        mov dword [byte ebp+0Ah], edx
        mov dword [byte ebp+012h], eax
.36:
        mov eax, dword [byte ebp+0Eh]
        movzx eax, byte [dword eax+LinesWorkTable+2Eh]
        cmp eax, byte 64h
        jne short .37
        push byte 0
        mov eax, dword [byte ebp+0Ah]
        mov ebx, 64h
        jmp short .38
.37:
        cmp eax, dword [dword ebp+08Ah]
        sete dl
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        movzx edx, dl
        movzx ebx, byte [byte eax+01h]
        mov eax, dword [byte ebp+0Ah]
        push edx
.38:
        mov ecx, esi
        mov edx, dword [dword eax+LinesPanelKillY]
        push dword [byte ebp-012h]
        sub edx, byte 7Ah
        mov eax, dword [dword eax+LinesPanelKillX]
        call DrawLineJersey
        inc dword [byte ebp+0Eh]
        add dword [byte ebp+0Ah], byte 4
        mov eax, dword [byte ebp+0Eh]
        inc edi
        cmp eax, dword [byte ebp+012h]
        jne short .36
        inc dword [byte ebp+062h]
        cmp dword [byte ebp+062h], byte 2
        jl short .35
.39:
        mov edx, dword [dword ebp+08Eh]
        xor eax, eax
        add edx, 990h
.40:
        mov ebx, dword [dword eax+LinesPanelItems+40h]
        add ebx, byte 0Ah
        mov dword [byte edx+03Ah], ebx
        mov ebx, dword [dword eax+LinesPanelItems+44h]
        add edx, byte 66h
        add ebx, byte 0Ah
        add eax, byte 40h
        mov dword [byte edx-028h], ebx
        cmp eax, 500h
        jne short .40
        mov eax, dword [SideBarArt+1Ah]
        sub eax, byte 7Ah
        push eax
        push dword [SideBarArt+16h]
        push dword [SideBarArt+0Ah]
        call DrawArt
        add esp, byte 0Ch
        call SetScreenTarget
        push byte 7Ah
        mov eax, dword [byte ebp-01Ah]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        lea esp, [byte ebp+072h]
        pop ebp
        pop edi
        pop esi
        ret 10h
;-----------------------------------------------------------------------------
; DrawLineJersey                               9FE5A  96 PC, medium confidence
; Draws a jersey with its number (jers, jrhl)
;-----------------------------------------------------------------------------
DrawLineJersey:
        push esi
        push edi
        enter 14h, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-04h], ebx
        mov byte [byte ebp-011h], 20h
        push str_Jers
        mov byte [byte ebp-012h], 20h
        mov byte [byte ebp-013h], 20h
        push ecx
        mov byte [byte ebp-014h], 20h
        mov byte [byte ebp-010h], 0
        call FindShape
        add esp, byte 8
        mov ecx, edi
        mov ebx, esi
        mov edx, eax
        mov eax, 0FAE1h
        call DrawFrameAt
        cmp dword [byte ebp+014h], byte 0
        je short .1
        push str_Jrhl
        push dword [byte ebp+010h]
        call FindShape
        add esp, byte 8
        mov ecx, edi
        mov ebx, esi
        mov edx, eax
        mov eax, 0FAE1h
        call DrawFrameAt
.1:
        cmp dword [byte ebp-04h], byte 9
        jle short .2
        cmp dword [byte ebp-04h], byte 64h
        je short .2
        mov eax, dword [byte ebp-04h]
        mov ecx, 0Ah
        cdq
        idiv ecx
        mov dword [byte ebp-0Ch], eax
        mov al, byte [byte ebp-0Ch]
        add al, 30h
        mov byte [byte ebp-014h], al
        lea eax, [byte esi+0Fh]
        mov dword [byte ebp-08h], eax
        lea eax, [byte ebp-014h]
        push eax
        push dword [byte ebp+010h]
        add edi, ecx
        call FindShape
        mov ebx, dword [byte ebp-08h]
        add esp, byte 8
        mov ecx, edi
        mov edx, eax
        mov eax, 0FAE1h
        call DrawFrameAt
        mov eax, dword [byte ebp-04h]
        mov ecx, 0Ah
        cdq
        idiv ecx
        mov dword [byte ebp-0Ch], edx
        mov al, byte [byte ebp-0Ch]
        add al, 30h
        mov byte [byte ebp-014h], al
        lea eax, [byte ebp-014h]
        push eax
        push dword [byte ebp+010h]
        add esi, byte 19h
        jmp short .3
.2:
        cmp dword [byte ebp-04h], byte 0Ah
        jge short DrawLineJersey_104
        mov al, byte [byte ebp-04h]
        add al, 30h
        mov byte [byte ebp-014h], al
        lea eax, [byte ebp-014h]
        push eax
        add edi, byte 0Ah
        push dword [byte ebp+010h]
        add esi, byte 14h
.3:
        call FindShape
        add esp, byte 8
        mov ecx, edi
        mov ebx, esi
        mov edx, eax
        mov eax, 0FAE1h
        call DrawFrameAt
DrawLineJersey_104:
        leave
        pop edi
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; DrawLinesPlayerList                             9FF64  96 PC, low confidence
; The player list of the edit lines screen ("%c %d", "%c. %s") with its
; scroll bar
;-----------------------------------------------------------------------------
DrawLinesPlayerList:
        push esi
        push edi
        enter 20h, 0
        push eax
        mov edi, edx
        mov dword [byte ebp-08h], ebx
        mov esi, ecx
        push dword [byte ebp+010h]
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF65h
        push dword 0FFFFFE3Eh
        push str_Bkgd20
        push dword [byte ebp+014h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        mov eax, esi
        shl eax, 2
        lea ecx, [edi+eax]
        add edi, byte 28h
        add esp, byte 0Ch
        add eax, edi
        xor esi, esi
        mov dword [byte ebp-0Ch], eax
.1:
        mov eax, dword [ecx]
        shl eax, 2
        add eax, dword [byte ebp-08h]
        cmp dword [eax], byte 0
        je short .2
        mov edx, 0FEh
        mov eax, 0F7h
        jmp short .3
.2:
        mov edx, 0FEh
        mov eax, 0FCh
.3:
        call SetTextColors
        mov eax, dword [ecx]
        cmp eax, dword [byte ebp-024h]
        jne short .4
        mov edx, 0FEh
        mov eax, 0FDh
        call SetTextColors
.4:
        test byte [optflags], 0Ch
        jne short .5
        mov eax, dword [ecx]
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        movzx edi, byte [byte eax+01h]
        push edi
        movsx eax, byte [byte eax+02h]
        jmp near .13
.5:
        mov eax, dword [ecx]
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        mov al, byte [byte eax+02h]
        cmp al, 47h
        jb short .6
        jbe short .7
        cmp al, 4Ch
        jb short .12
        jbe short .9
        cmp al, 52h
        je short .10
        jmp short .12
.6:
        cmp al, 43h
        jb short .12
        jbe short .11
        cmp al, 44h
        je short .8
        jmp short .12
.7:
        mov byte [byte ebp-04h], 54h
        jmp short .12
.8:
        mov byte [byte ebp-04h], 41h
        jmp short .12
.9:
        mov byte [byte ebp-04h], 4Ch
        jmp short .12
.10:
        mov byte [byte ebp-04h], al
        jmp short .12
.11:
        mov byte [byte ebp-04h], 4Dh
.12:
        mov eax, dword [ecx]
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        movzx eax, byte [byte eax+01h]
        push eax
        movsx eax, byte [byte ebp-04h]
.13:
        push eax
        push str_CD2
        lea eax, [byte ebp-020h]
        push eax
        call sprintf_
        add esp, byte 10h
        lea eax, [byte ebp-020h]
        mov ebx, esi
        xor edx, edx
        call DrawColorText
        mov eax, dword [ecx]
        mov eax, dword [nosplit eax*4+LinesPlayerOrder]
        lea edi, [byte eax+013h]
        push edi
        movsx eax, byte [byte eax+03h]
        push eax
        push str_CS4
        lea eax, [byte ebp-020h]
        mov edx, 28h
        push eax
        mov ebx, esi
        add ecx, byte 4
        call sprintf_
        add esp, byte 10h
        lea eax, [byte ebp-020h]
        add esi, byte 14h
        call DrawColorText
        cmp ecx, dword [byte ebp-0Ch]
        jne near .1
        call SetScreenTarget
        push dword 9Bh
        mov eax, dword [byte ebp+010h]
        push dword 1C2h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        mov eax, dword [byte ebp+018h]
        call DrawScrollBar
        leave
        pop edi
        pop esi
        ret 0Ch
        push ebx
        push ecx
        push esi
        push edi
        enter 4Ch, 0
        lea ebx, [byte eax+03h]
        mov dword [byte ebp-018h], edx
        xor edi, edi
        mov dword [byte ebp-02Ch], ebx
.14:
        mov esi, dword [byte ebp-018h]
        mov ecx, dword [byte ebp-02Ch]
        lea ebx, [edi+edi*2]
        mov dword [byte ebp-048h], ecx
        add ebx, eax
.15:
        mov cl, byte [ebx]
        inc ebx
        mov byte [esi], cl
        inc esi
        cmp ebx, dword [byte ebp-048h]
        jne short .15
        add dword [byte ebp-02Ch], byte 3
        inc edi
        add dword [byte ebp-018h], byte 3
        cmp edi, byte 4
        jl short .14
        mov dword [byte ebp-04h], 0
        mov dword [byte ebp-028h], 8
        mov dword [byte ebp-01Ch], edx
        mov dword [byte ebp-024h], eax
        mov dword [byte ebp-044h], eax
.16:
        mov ecx, dword [byte ebp-01Ch]
        mov esi, dword [byte ebp-04h]
        mov dword [byte ebp-0Ch], ecx
        mov ecx, dword [byte ebp-024h]
        mov ebx, dword [byte ebp-04h]
        mov dword [byte ebp-030h], ecx
        mov ecx, dword [byte ebp-044h]
        add esi, edx
        add ecx, dword [byte ebp-028h]
        add ebx, eax
        mov dword [byte ebp-03Ch], ecx
.17:
        mov ecx, dword [byte ebp-030h]
        mov edi, dword [byte ebp-0Ch]
        add esi, byte 3
        mov cl, byte [byte ecx+0Ch]
        add ebx, byte 4
        mov byte [byte edi+0Ch], cl
        inc dword [byte ebp-0Ch]
        mov cl, byte [byte ebx+018h]
        inc dword [byte ebp-030h]
        mov byte [byte esi+02Bh], cl
        cmp ebx, dword [byte ebp-03Ch]
        jne short .17
        inc dword [byte ebp-028h]
        add dword [byte ebp-01Ch], byte 2
        inc dword [byte ebp-04h]
        add dword [byte ebp-024h], byte 2
        cmp dword [byte ebp-04h], byte 3
        jl short .16
        lea ebx, [byte eax+05h]
        mov dword [byte ebp-010h], edx
        xor edi, edi
        mov dword [byte ebp-034h], ebx
.18:
        mov esi, dword [byte ebp-010h]
        mov ecx, dword [byte ebp-034h]
        lea ebx, [edi+edi*4]
        mov dword [byte ebp-04Ch], ecx
        add ebx, eax
.19:
        inc esi
        mov cl, byte [byte ebx+012h]
        inc ebx
        mov byte [byte esi+011h], cl
        cmp ebx, dword [byte ebp-04Ch]
        jne short .19
        add dword [byte ebp-034h], byte 5
        inc edi
        add dword [byte ebp-010h], byte 5
        cmp edi, byte 2
        jl short .18
        mov dword [byte ebp-08h], 0
        lea ebx, [byte eax+04h]
        mov dword [byte ebp-020h], edx
        mov dword [byte ebp-014h], ebx
        mov dword [byte ebp-038h], eax
.20:
        mov ebx, dword [byte ebp-08h]
        mov edi, dword [byte ebp-038h]
        mov ecx, dword [byte ebp-014h]
        shl ebx, 2
        mov dword [byte ebp-040h], ecx
        lea esi, [eax+ebx]
        mov ebx, dword [byte ebp-020h]
.21:
        mov cl, byte [byte esi+01Ch]
        inc edi
        mov byte [byte ebx+026h], cl
        inc ebx
        mov cl, byte [byte edi+011h]
        inc esi
        mov byte [byte ebx+01Bh], cl
        cmp esi, dword [byte ebp-040h]
        jne short .21
        add dword [byte ebp-014h], byte 4
        add dword [byte ebp-038h], byte 5
        inc dword [byte ebp-08h]
        add dword [byte ebp-020h], byte 4
        cmp dword [byte ebp-08h], byte 2
        jl short .20
        mov bl, byte [byte eax+024h]
        mov byte [byte edx+034h], bl
        mov bl, byte [byte eax+025h]
        mov byte [byte edx+035h], bl
        mov bl, byte [byte eax+026h]
        mov byte [byte edx+024h], bl
        mov bl, byte [byte eax+027h]
        mov byte [byte edx+025h], bl
        mov ebx, edx
        mov edx, eax
        lea esi, [byte eax+08h]
.22:
        inc ebx
        mov al, byte [byte edx+028h]
        inc edx
        mov byte [byte ebx+035h], al
        cmp edx, esi
        jne short .22
        jmp near HasDuplicateInLine_45
        push ebx
        push ecx
        push esi
        push edi
        enter 30h, 0
        lea ebx, [byte eax+03h]
        mov dword [byte ebp-08h], edx
        xor edi, edi
        mov dword [byte ebp-020h], ebx
.23:
        mov esi, dword [byte ebp-08h]
        mov ecx, dword [byte ebp-020h]
        lea ebx, [edi+edi*2]
        mov dword [byte ebp-02Ch], ecx
        add ebx, eax
.24:
        mov cl, byte [ebx]
        inc ebx
        mov byte [esi], cl
        inc esi
        cmp ebx, dword [byte ebp-02Ch]
        jne short .24
        add dword [byte ebp-020h], byte 3
        inc edi
        add dword [byte ebp-08h], byte 3
        cmp edi, byte 4
        jl short .23
        lea ebx, [byte eax+02h]
        mov dword [byte ebp-010h], edx
        xor edi, edi
        mov dword [byte ebp-018h], ebx
.25:
        mov esi, dword [byte ebp-010h]
        mov ecx, dword [byte ebp-018h]
        lea ebx, [edi+edi]
        mov dword [byte ebp-030h], ecx
        add ebx, eax
.26:
        inc esi
        mov cl, byte [byte ebx+0Ch]
        inc ebx
        mov byte [byte esi+0Bh], cl
        cmp ebx, dword [byte ebp-030h]
        jne short .26
        add dword [byte ebp-018h], byte 2
        inc edi
        add dword [byte ebp-010h], byte 2
        cmp edi, byte 3
        jl short .25
        lea ebx, [byte eax+05h]
        mov dword [byte ebp-014h], edx
        xor edi, edi
        mov dword [byte ebp-0Ch], ebx
.27:
        mov esi, dword [byte ebp-014h]
        mov ecx, dword [byte ebp-0Ch]
        lea ebx, [edi+edi*4]
        mov dword [byte ebp-024h], ecx
        add ebx, eax
.28:
        inc esi
        mov cl, byte [byte ebx+012h]
        inc ebx
        mov byte [byte esi+011h], cl
        cmp ebx, dword [byte ebp-024h]
        jne short .28
        add dword [byte ebp-0Ch], byte 5
        inc edi
        add dword [byte ebp-014h], byte 5
        cmp edi, byte 2
        jl short .27
        lea ebx, [byte eax+04h]
        mov dword [byte ebp-01Ch], edx
        xor edi, edi
        mov dword [byte ebp-04h], ebx
.29:
        mov esi, dword [byte ebp-01Ch]
        mov ebx, edi
        mov ecx, dword [byte ebp-04h]
        shl ebx, 2
        mov dword [byte ebp-028h], ecx
        add ebx, eax
.30:
        inc esi
        mov cl, byte [byte ebx+026h]
        inc ebx
        mov byte [byte esi+01Bh], cl
        cmp ebx, dword [byte ebp-028h]
        jne short .30
        add dword [byte ebp-04h], byte 4
        inc edi
        add dword [byte ebp-01Ch], byte 4
        cmp edi, byte 2
        jl short .29
        mov bl, byte [byte eax+034h]
        mov byte [byte edx+024h], bl
        mov bl, byte [byte eax+035h]
        mov byte [byte edx+025h], bl
        mov bl, byte [byte eax+024h]
        mov byte [byte edx+026h], bl
        mov bl, byte [byte eax+025h]
        mov byte [byte edx+027h], bl
        mov ebx, edx
        mov edx, eax
        lea esi, [byte eax+08h]
.31:
        inc ebx
        mov al, byte [byte edx+036h]
        inc edx
        mov byte [byte ebx+027h], al
        cmp edx, esi
        jne short .31
        jmp near HasDuplicateInLine_45
;-----------------------------------------------------------------------------
; SortTeamPlayers                                 A0355  96 PC, low confidence
; The team's players into a sorted list (qsort) for the lines
;-----------------------------------------------------------------------------
SortTeamPlayers:
        push esi
        push edi
        enter 20h, 0
        push edx
        push ebx
        mov ebx, dword [byte ebp+010h]
        mov dword [ebx], 0
        mov dword [byte ebp-01Ch], LinesSlotTable
        mov edx, dword [ebx]
        xor esi, esi
        mov dword [ecx], edx
        mov edx, eax
        mov eax, dword [byte ebp-024h]
        mov dword [byte ebp-04h], esi
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp-028h]
        mov dword [byte ebp-018h], esi
        mov dword [byte ebp-014h], eax
.1:
        cmp dword [byte ebp-04h], byte 19h
        mov eax, dword [byte edx+063h]
        mov dword [byte ebp-010h], eax
        cmp dword [byte ebp-010h], byte 0FFFFFFFFh
        je near .10
        mov edi, esi
        shl edi, 2
        cmp dword [LinesEditMode], byte 3
        jne short .2
        mov eax, dword [byte ebp-01Ch]
        jmp short .3
.2:
        mov eax, dword [byte ebp-010h]
        call PlayerDbRecord
.3:
        mov dword [dword edi+LinesPlayerOrder], eax
        mov edi, dword [nosplit esi*4+LinesPlayerOrder]
        movsx edi, byte [byte edi+02h]
        cmp edi, byte 47h
        jne short .4
        inc dword [ebx]
.4:
        mov edi, esi
        mov eax, dword [byte ebp-0Ch]
        shl edi, 2
        mov dword [eax], esi
        cmp dword [byte ebp+014h], byte 0
        je short .7
        add edi, dword [byte ebp-028h]
        mov dword [byte ebp-08h], 0
        mov dword [byte ebp-020h], edi
        mov dword [edi], 0
.5:
        mov eax, dword [byte ebp-08h]
        movzx eax, byte [dword eax+LinesWorkTable+36h]
        cmp eax, dword [byte ebp-04h]
        jne short .6
        mov eax, dword [byte ebp-020h]
        mov dword [eax], 1
.6:
        inc dword [byte ebp-08h]
        cmp dword [byte ebp-08h], byte 8
        jl short .5
.7:
        imul edi, dword [LinesEditAway], dword 136h
        mov edi, dword [dword edi+hmtmroster]
        add edi, dword [byte ebp-018h]
        movzx edi, byte [edi]
        cmp edi, byte 1
        je short .8
        cmp edi, byte 6
        jne short .9
.8:
        cmp dword [LinesEditMode], byte 3
        jne short .9
        mov eax, dword [byte ebp-014h]
        mov dword [eax], 2
.9:
        add dword [byte ebp-0Ch], byte 4
        add dword [byte ebp-018h], byte 2Bh
        inc esi
        add dword [byte ebp-014h], byte 4
        mov dword [ecx], esi
.10:
        add dword [byte ebp-01Ch], byte 3Ch
        inc dword [byte ebp-04h]
        add edx, byte 4
        cmp dword [byte ebp-04h], byte 1Ch
        jl near .1
        mov ebx, 4
        mov eax, dword [byte ebp-024h]
        mov edx, dword [ecx]
        mov ecx, ComparePlayerPos
        call qsort_
        jmp near DrawLineJersey_104
;-----------------------------------------------------------------------------
; AutoSetLines                                 A0480  96 PC, medium confidence
; Fills the team's lines with its best players by position and ratings
; (qsort), from the edit lines screen and after trades
;-----------------------------------------------------------------------------
AutoSetLines:
        push ecx
        push esi
        push edi
        enter 0BCh, 0
        sub ebp, 82h
        mov esi, eax
        mov dword [byte ebp+036h], edx
        mov dword [byte ebp+03Ah], ebx
        mov dword [byte ebp+046h], 0
        mov dword [byte ebp+056h], 0FFFFFE57h
        mov dword [byte ebp+05Ah], 0
        xor edx, edx
        jmp near .10
.1:
        mov dword [byte edx+ebp-03Ah], eax
        mov eax, dword [dword edx+LinesPlayerOrder]
        mov dword [dword edx+LinesPlayerScore], 0
        movsx ebx, byte [byte eax+02h]
        cmp ebx, byte 47h
        je short .5
        cmp dword [LinesEditMode], byte 3
        jne short .2
        imul eax, dword [LinesEditAway], dword 20Dh
        mov ebx, dword [byte ebp+05Ah]
        add eax, hmplattr
        add ebx, eax
        mov dword [byte ebp+052h], ebx
        jmp short .3
.2:
        mov eax, dword [byte eax+024h]
        call StatsDb2Record
        mov dword [byte ebp+052h], eax
.3:
        mov edi, edx
        xor eax, eax
.4:
        mov ebx, dword [byte ebp+052h]
        add ebx, dword [dword eax+ForwardLineSlots]
        movsx ebx, byte [ebx]
        add eax, byte 4
        add dword [dword edi+LinesPlayerScore], ebx
        cmp eax, byte 2Ch
        je short .9
        jmp short .4
.5:
        cmp dword [LinesEditMode], byte 3
        jne short .6
        imul eax, dword [LinesEditAway], byte 33h
        mov ebx, dword [byte ebp+056h]
        add eax, hmglattr
        add ebx, eax
        mov dword [byte ebp+03Eh], ebx
        jmp short .7
.6:
        mov eax, dword [byte eax+024h]
        call StatsDb2Record
        mov dword [byte ebp+03Eh], eax
.7:
        mov edi, edx
        xor eax, eax
.8:
        mov ebx, dword [byte ebp+03Eh]
        add ebx, dword [dword eax+DefenceLineSlots]
        movsx ebx, byte [ebx]
        add eax, byte 4
        add dword [dword edi+LinesPlayerScore], ebx
        cmp eax, byte 28h
        jne short .8
.9:
        add dword [byte ebp+056h], byte 11h
        add dword [byte ebp+05Ah], byte 15h
        inc dword [byte ebp+046h]
        add edx, byte 4
.10:
        mov eax, dword [byte ebp+046h]
        cmp eax, dword [byte ebp+036h]
        jl near .1
        mov ecx, CompareRosterOrder
        mov ebx, 4
        mov edx, dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        call qsort_
        mov edx, dword [byte ebp+036h]
        mov eax, 19h
        sub edx, dword [byte ebp+03Ah]
        mov ebx, eax
        sub ebx, edx
        mov edx, ebx
        lea edi, [byte esi+064h]
        shl edx, 2
        mov ebx, dword [byte ebp+03Ah]
        neg edx
        add ebx, eax
        add edi, edx
        jmp short .13
.11:
        movzx edx, byte [LinesWorkTable+34h]
        cmp edx, eax
        je short .12
        movzx edx, byte [LinesWorkTable+35h]
        cmp edx, eax
        je short .12
        mov dword [edi], 1
.12:
        add edi, byte 4
        inc eax
.13:
        cmp eax, ebx
        jl short .11
        mov eax, dword [byte ebp+036h]
        mov ebx, 19h
        sub eax, dword [byte ebp+03Ah]
        mov edx, ebx
        sub edx, eax
        mov ecx, dword [byte ebp+03Ah]
        mov eax, edx
        xor edi, edi
        shl eax, 2
        lea edx, [byte esi+064h]
        neg eax
        add ecx, ebx
        add edx, eax
        jmp short .16
.14:
        cmp dword [edx], byte 0
        jne short .15
        inc edi
.15:
        add edx, byte 4
        inc ebx
.16:
        cmp ebx, ecx
        jl short .14
        xor edx, edx
.17:
        cmp edi, byte 2
        jge short .19
        mov eax, dword [byte edx+ebp-03Ah]
        shl eax, 2
        mov ebx, dword [dword eax+LinesPlayerOrder]
        movsx ebx, byte [byte ebx+02h]
        cmp ebx, byte 47h
        jne short .18
        add eax, esi
        cmp dword [eax], byte 1
        jne short .18
        inc edi
        mov dword [eax], 0
.18:
        add edx, byte 4
        jmp short .17
.19:
        mov al, byte [byte ebp+036h]
        sub al, byte [byte ebp+03Ah]
        mov ah, 19h
        sub ah, al
        mov byte [byte ebp+076h], ah
        mov eax, dword [byte ebp+036h]
        mov ebx, 19h
        sub eax, dword [byte ebp+03Ah]
        sub ebx, eax
        xor edx, edx
        mov dword [byte ebp+04Eh], ebx
.20:
        movzx eax, byte [dword edx+LinesWorkTable+34h]
        cmp eax, byte 64h
        jne short .24
        xor edi, edi
        test edx, edx
        sete byte [byte ebp+07Ah]
        jmp short .23
.21:
        mov eax, edi
        shl eax, 2
        mov ebx, dword [byte eax+ebp-03Ah]
        shl ebx, 2
        mov dword [byte ebp+04Ah], ebx
        cmp dword [esi+ebx], byte 0
        jne short .22
        mov ecx, dword [byte eax+ebp-03Ah]
        movzx ebx, byte [byte ebp+07Ah]
        add ecx, dword [byte ebp+04Eh]
        movzx ebx, byte [dword ebx+LinesWorkTable+34h]
        cmp ebx, ecx
        je short .22
        mov ebx, dword [byte ebp+04Ah]
        mov ebx, dword [dword ebx+LinesPlayerOrder]
        movsx ebx, byte [byte ebx+02h]
        cmp ebx, byte 47h
        jne short .22
        mov al, byte [byte eax+ebp-03Ah]
        add al, byte [byte ebp+076h]
        mov edi, dword [byte ebp+036h]
        mov byte [dword edx+LinesWorkTable+34h], al
.22:
        inc edi
.23:
        cmp edi, dword [byte ebp+036h]
        jl short .21
.24:
        inc edx
        cmp edx, byte 2
        jl short .20
        mov eax, esi
        xor edx, edx
        xor ebx, ebx
        jmp short .27
.25:
        cmp dword [eax], byte 0
        jne short .26
        inc edx
.26:
        add eax, byte 4
        inc ebx
.27:
        cmp ebx, dword [byte ebp+036h]
        jl short .25
        cmp edx, byte 14h
        jle near .52
        mov eax, esi
        xor edx, edx
        jmp short .29
.28:
        inc edx
        mov dword [eax], 1
        add eax, byte 4
.29:
        cmp edx, dword [byte ebp+036h]
        jl short .28
        mov ebx, 3
        xor edx, edx
.30:
        lea eax, [edx+edx*2]
        mov dword [byte ebp+05Eh], ebx
.31:
        movzx edi, byte [dword eax+LinesWorkTable]
        cmp edi, byte 64h
        je short .32
        mov dword [esi+edi*4], 0
.32:
        inc eax
        cmp eax, dword [byte ebp+05Eh]
        jne short .31
        inc edx
        add ebx, byte 3
        cmp edx, byte 4
        jl short .30
        mov ebx, 2
        xor edx, edx
.33:
        mov dword [byte ebp+062h], ebx
        lea eax, [edx+edx]
.34:
        movzx edi, byte [dword eax+LinesWorkTable+0Ch]
        cmp edi, byte 64h
        je short .35
        mov dword [esi+edi*4], 0
.35:
        inc eax
        cmp eax, dword [byte ebp+062h]
        jne short .34
        inc edx
        inc ebx
        inc ebx
        cmp edx, byte 3
        jl short .33
        mov edx, dword [byte ebp+036h]
        mov ebx, 19h
        sub edx, dword [byte ebp+03Ah]
        xor eax, eax
        sub ebx, edx
.36:
        movzx edx, byte [dword eax+LinesWorkTable+34h]
        cmp edx, byte 64h
        je short .37
        sub edx, ebx
        mov dword [esi+edx*4], 0
.37:
        inc eax
        cmp eax, byte 2
        jl short .36
        mov ebx, 5
        xor edx, edx
.38:
        lea eax, [edx+edx*4]
        mov dword [byte ebp+066h], ebx
.39:
        movzx edi, byte [dword eax+LinesWorkTable+12h]
        cmp edi, byte 64h
        je short .40
        cmp dword [esi+edi*4], byte 1
        jne short .40
        mov byte [dword eax+LinesWorkTable+12h], 64h
.40:
        inc eax
        cmp eax, dword [byte ebp+066h]
        jne short .39
        inc edx
        add ebx, byte 5
        cmp edx, byte 2
        jl short .38
        mov ebx, 4
        xor edx, edx
.41:
        mov eax, edx
        mov dword [byte ebp+06Ah], ebx
        shl eax, 2
.42:
        movzx edi, byte [dword eax+LinesWorkTable+1Ch]
        cmp edi, byte 64h
        je short .43
        cmp dword [esi+edi*4], byte 1
        jne short .43
        mov byte [dword eax+LinesWorkTable+1Ch], 64h
.43:
        inc eax
        cmp eax, dword [byte ebp+06Ah]
        jne short .42
        inc edx
        add ebx, byte 4
        cmp edx, byte 2
        jl short .41
        mov ebx, 4
        xor edx, edx
.44:
        mov eax, edx
        mov dword [byte ebp+06Eh], ebx
        shl eax, 2
.45:
        movzx edi, byte [dword eax+LinesWorkTable+26h]
        cmp edi, byte 64h
        je short .46
        cmp dword [esi+edi*4], byte 1
        jne short .46
        mov byte [dword eax+LinesWorkTable+26h], 64h
.46:
        inc eax
        cmp eax, dword [byte ebp+06Eh]
        jne short .45
        inc edx
        add ebx, byte 4
        cmp edx, byte 2
        jl short .44
        mov edi, 3
        xor edx, edx
.47:
        lea eax, [edx+edx*2]
        mov dword [byte ebp+072h], edi
.48:
        movzx ebx, byte [dword eax+LinesWorkTable+2Eh]
        cmp ebx, byte 64h
        je short .49
        cmp dword [esi+ebx*4], byte 1
        jne short .49
        mov byte [dword eax+LinesWorkTable+2Eh], 64h
.49:
        inc eax
        cmp eax, dword [byte ebp+072h]
        jne short .48
        inc edx
        add edi, byte 3
        cmp edx, byte 2
        jl short .47
        xor edx, edx
.50:
        movzx eax, byte [dword edx+LinesWorkTable+24h]
        cmp eax, byte 64h
        je short .51
        cmp dword [esi+eax*4], byte 1
        jne short .51
        mov byte [dword edx+LinesWorkTable+24h], 64h
.51:
        inc edx
        cmp edx, byte 2
        jl short .50
.52:
        mov edi, esi
        xor edx, edx
        xor eax, eax
        mov dword [byte ebp+042h], edx
        jmp short .55
.53:
        mov ebx, eax
        shl ebx, 2
        cmp dword [edi], byte 0
        jne short .54
        mov ebx, dword [dword ebx+LinesPlayerOrder]
        movsx ebx, byte [byte ebx+02h]
        inc edx
        cmp ebx, byte 47h
        je short .54
        cmp ebx, byte 44h
        je short .54
        inc dword [byte ebp+042h]
.54:
        add edi, byte 4
        inc eax
.55:
        cmp eax, dword [byte ebp+036h]
        jl short .53
        xor edi, edi
.56:
        cmp edx, byte 14h
        jge short .58
        cmp dword [byte ebp+042h], byte 0Ch
        jge short .58
        mov ebx, dword [byte edi+ebp-03Ah]
        shl ebx, 2
        lea eax, [esi+ebx]
        cmp dword [eax], byte 1
        jne short .57
        mov ebx, dword [dword ebx+LinesPlayerOrder]
        movsx ebx, byte [byte ebx+02h]
        cmp ebx, byte 47h
        je short .57
        cmp ebx, byte 44h
        je short .57
        inc dword [byte ebp+042h]
        inc edx
        mov dword [eax], 0
.57:
        add edi, byte 4
        jmp short .56
.58:
        xor edi, edi
.59:
        cmp edx, byte 14h
        jge short .61
        mov ebx, dword [byte edi+ebp-03Ah]
        shl ebx, 2
        lea eax, [esi+ebx]
        cmp dword [eax], byte 1
        jne short .60
        mov ebx, dword [dword ebx+LinesPlayerOrder]
        movsx ebx, byte [byte ebx+02h]
        cmp ebx, byte 44h
        jne short .60
        inc edx
        mov dword [eax], 0
.60:
        add edi, byte 4
        jmp short .59
.61:
        xor edx, edx
.62:
        movzx eax, byte [dword edx+LinesWorkTable+24h]
        cmp eax, byte 64h
        jne short .66
        xor edi, edi
        test edx, edx
        sete byte [byte ebp+07Eh]
        jmp short .65
.63:
        movzx eax, byte [byte ebp+07Eh]
        movzx ebx, byte [dword eax+LinesWorkTable+24h]
        mov eax, edi
        shl eax, 2
        cmp ebx, dword [byte eax+ebp-03Ah]
        je short .64
        mov ebx, dword [byte eax+ebp-03Ah]
        mov ebx, dword [nosplit ebx*4+LinesPlayerOrder]
        movsx ebx, byte [byte ebx+02h]
        cmp ebx, byte 47h
        je short .64
        mov al, byte [byte eax+ebp-03Ah]
        mov edi, dword [byte ebp+036h]
        mov byte [dword edx+LinesWorkTable+24h], al
.64:
        inc edi
.65:
        cmp edi, dword [byte ebp+036h]
        jl short .63
.66:
        inc edx
        cmp edx, byte 2
        jl short .62
        xor edi, edi
.67:
        movzx eax, byte [dword edi+LinesWorkTable]
        cmp eax, byte 64h
        jne short .68
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable], al
.68:
        movzx eax, byte [dword edi+LinesWorkTable]
        cmp eax, byte 64h
        jne short .69
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable], al
.69:
        movzx eax, byte [dword edi+LinesWorkTable]
        cmp eax, byte 64h
        jne short .70
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable], al
.70:
        movzx eax, byte [dword edi+LinesWorkTable]
        cmp eax, byte 64h
        jne short .71
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable], al
.71:
        movzx eax, byte [dword edi+LinesWorkTable+1]
        cmp eax, byte 64h
        jne short .72
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1], al
.72:
        movzx eax, byte [dword edi+LinesWorkTable+1]
        cmp eax, byte 64h
        jne short .73
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1], al
.73:
        movzx eax, byte [dword edi+LinesWorkTable+1]
        cmp eax, byte 64h
        jne short .74
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1], al
.74:
        movzx eax, byte [dword edi+LinesWorkTable+1]
        cmp eax, byte 64h
        jne short .75
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1], al
.75:
        movzx eax, byte [dword edi+LinesWorkTable+2]
        cmp eax, byte 64h
        jne short .76
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+2], al
.76:
        movzx eax, byte [dword edi+LinesWorkTable+2]
        cmp eax, byte 64h
        jne short .77
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+2], al
.77:
        movzx eax, byte [dword edi+LinesWorkTable+2]
        cmp eax, byte 64h
        jne short .78
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+2], al
.78:
        movzx eax, byte [dword edi+LinesWorkTable+2]
        cmp eax, byte 64h
        jne short .79
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ch
        mov ecx, esi
        push eax
        xor edx, edx
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+2], al
.79:
        add edi, byte 3
        cmp edi, byte 0Ch
        jne near .67
        xor edi, edi
.80:
        movzx eax, byte [dword edi+LinesWorkTable+0Ch]
        cmp eax, byte 64h
        jne short .81
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 0Ch
        push eax
        mov ecx, esi
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+0Ch], al
.81:
        movzx eax, byte [dword edi+LinesWorkTable+0Ch]
        cmp eax, byte 64h
        jne short .82
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 0Ch
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+0Ch], al
.82:
        movzx eax, byte [dword edi+LinesWorkTable+0Ch]
        cmp eax, byte 64h
        jne short .83
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 0Ch
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+0Ch], al
.83:
        inc edi
        inc edi
        cmp edi, byte 6
        jne near .80
        xor edi, edi
.84:
        movzx eax, byte [dword edi+LinesWorkTable+0Dh]
        cmp eax, byte 64h
        jne short .85
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 0Ch
        push eax
        mov ecx, esi
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+0Dh], al
.85:
        movzx eax, byte [dword edi+LinesWorkTable+0Dh]
        cmp eax, byte 64h
        jne short .86
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 0Ch
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+0Dh], al
.86:
        movzx eax, byte [dword edi+LinesWorkTable+0Dh]
        cmp eax, byte 64h
        jne short .87
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 0Ch
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+0Dh], al
.87:
        inc edi
        inc edi
        cmp edi, byte 6
        jne near .84
        xor edi, edi
.88:
        movzx eax, byte [dword edi+LinesWorkTable+12h]
        cmp eax, byte 64h
        jne short .89
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+12h], al
.89:
        movzx eax, byte [dword edi+LinesWorkTable+12h]
        cmp eax, byte 64h
        jne short .90
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+12h], al
.90:
        movzx eax, byte [dword edi+LinesWorkTable+12h]
        cmp eax, byte 64h
        jne short .91
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+12h], al
.91:
        add edi, byte 5
        cmp edi, byte 0Ah
        jne near .88
        xor edi, edi
.92:
        movzx eax, byte [dword edi+LinesWorkTable+13h]
        cmp eax, byte 64h
        jne short .93
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+13h], al
.93:
        movzx eax, byte [dword edi+LinesWorkTable+13h]
        cmp eax, byte 64h
        jne short .94
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+13h], al
.94:
        movzx eax, byte [dword edi+LinesWorkTable+13h]
        cmp eax, byte 64h
        jne short .95
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+13h], al
.95:
        add edi, byte 5
        cmp edi, byte 0Ah
        jne near .92
        xor edi, edi
.96:
        movzx eax, byte [dword edi+LinesWorkTable+14h]
        cmp eax, byte 64h
        jne short .97
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+14h], al
.97:
        movzx eax, byte [dword edi+LinesWorkTable+14h]
        cmp eax, byte 64h
        jne short .98
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+14h], al
.98:
        movzx eax, byte [dword edi+LinesWorkTable+14h]
        cmp eax, byte 64h
        jne short .99
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+14h], al
.99:
        add edi, byte 5
        cmp edi, byte 0Ah
        jne near .96
        xor edi, edi
.100:
        movzx eax, byte [dword edi+LinesWorkTable+15h]
        cmp eax, byte 64h
        jne short .101
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+15h], al
.101:
        movzx eax, byte [dword edi+LinesWorkTable+15h]
        cmp eax, byte 64h
        jne short .102
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+15h], al
.102:
        movzx eax, byte [dword edi+LinesWorkTable+15h]
        cmp eax, byte 64h
        jne short .103
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+15h], al
.103:
        add edi, byte 5
        cmp edi, byte 0Ah
        jne near .100
        xor edi, edi
.104:
        movzx eax, byte [dword edi+LinesWorkTable+16h]
        cmp eax, byte 64h
        jne short .105
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+16h], al
.105:
        movzx eax, byte [dword edi+LinesWorkTable+16h]
        cmp eax, byte 64h
        jne short .106
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+16h], al
.106:
        movzx eax, byte [dword edi+LinesWorkTable+16h]
        cmp eax, byte 64h
        jne short .107
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 0Ah
        mov edx, 12h
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+16h], al
.107:
        add edi, byte 5
        cmp edi, byte 0Ah
        jne near .104
        xor edi, edi
.108:
        movzx eax, byte [dword edi+LinesWorkTable+1Ch]
        cmp eax, byte 64h
        jne short .109
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Ch], al
.109:
        movzx eax, byte [dword edi+LinesWorkTable+1Ch]
        cmp eax, byte 64h
        jne short .110
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Ch], al
.110:
        movzx eax, byte [dword edi+LinesWorkTable+1Ch]
        cmp eax, byte 64h
        jne short .111
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Ch], al
.111:
        add edi, byte 4
        cmp edi, byte 8
        jne near .108
        xor edi, edi
.112:
        movzx eax, byte [dword edi+LinesWorkTable+1Dh]
        cmp eax, byte 64h
        jne short .113
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Dh], al
.113:
        movzx eax, byte [dword edi+LinesWorkTable+1Dh]
        cmp eax, byte 64h
        jne short .114
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Dh], al
.114:
        movzx eax, byte [dword edi+LinesWorkTable+1Dh]
        cmp eax, byte 64h
        jne short .115
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Dh], al
.115:
        add edi, byte 4
        cmp edi, byte 8
        jne near .112
        xor edi, edi
.116:
        movzx eax, byte [dword edi+LinesWorkTable+1Eh]
        cmp eax, byte 64h
        jne short .117
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Eh], al
.117:
        movzx eax, byte [dword edi+LinesWorkTable+1Eh]
        cmp eax, byte 64h
        jne short .118
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Eh], al
.118:
        movzx eax, byte [dword edi+LinesWorkTable+1Eh]
        cmp eax, byte 64h
        jne short .119
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Eh], al
.119:
        add edi, byte 4
        cmp edi, byte 8
        jne near .116
        xor edi, edi
.120:
        movzx eax, byte [dword edi+LinesWorkTable+1Fh]
        cmp eax, byte 64h
        jne short .121
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Fh], al
.121:
        movzx eax, byte [dword edi+LinesWorkTable+1Fh]
        cmp eax, byte 64h
        jne short .122
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Fh], al
.122:
        movzx eax, byte [dword edi+LinesWorkTable+1Fh]
        cmp eax, byte 64h
        jne short .123
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 1Ch
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+1Fh], al
.123:
        add edi, byte 4
        cmp edi, byte 8
        jne near .120
        xor edi, edi
.124:
        movzx eax, byte [dword edi+LinesWorkTable+26h]
        cmp eax, byte 64h
        jne short .125
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+26h], al
.125:
        movzx eax, byte [dword edi+LinesWorkTable+26h]
        cmp eax, byte 64h
        jne short .126
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+26h], al
.126:
        movzx eax, byte [dword edi+LinesWorkTable+26h]
        cmp eax, byte 64h
        jne short .127
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+26h], al
.127:
        add edi, byte 4
        cmp edi, byte 8
        jne near .124
        xor edi, edi
.128:
        movzx eax, byte [dword edi+LinesWorkTable+27h]
        cmp eax, byte 64h
        jne short .129
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+27h], al
.129:
        movzx eax, byte [dword edi+LinesWorkTable+27h]
        cmp eax, byte 64h
        jne short .130
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+27h], al
.130:
        movzx eax, byte [dword edi+LinesWorkTable+27h]
        cmp eax, byte 64h
        jne short .131
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+27h], al
.131:
        add edi, byte 4
        cmp edi, byte 8
        jne near .128
        xor edi, edi
.132:
        movzx eax, byte [dword edi+LinesWorkTable+28h]
        cmp eax, byte 64h
        jne short .133
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+28h], al
.133:
        movzx eax, byte [dword edi+LinesWorkTable+28h]
        cmp eax, byte 64h
        jne short .134
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+28h], al
.134:
        movzx eax, byte [dword edi+LinesWorkTable+28h]
        cmp eax, byte 64h
        jne short .135
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+28h], al
.135:
        add edi, byte 4
        cmp edi, byte 8
        jne near .132
        xor edi, edi
.136:
        movzx eax, byte [dword edi+LinesWorkTable+29h]
        cmp eax, byte 64h
        jne short .137
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+29h], al
.137:
        movzx eax, byte [dword edi+LinesWorkTable+29h]
        cmp eax, byte 64h
        jne short .138
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+29h], al
.138:
        movzx eax, byte [dword edi+LinesWorkTable+29h]
        cmp eax, byte 64h
        jne short .139
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 8
        mov edx, 26h
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+29h], al
.139:
        add edi, byte 4
        cmp edi, byte 8
        jne near .136
        xor edi, edi
.140:
        movzx eax, byte [dword edi+LinesWorkTable+2Eh]
        cmp eax, byte 64h
        jne short .141
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 2Eh
        push eax
        mov ecx, esi
        mov eax, 43h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+2Eh], al
.141:
        movzx eax, byte [dword edi+LinesWorkTable+2Eh]
        cmp eax, byte 64h
        jne short .142
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 2Eh
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+2Eh], al
.142:
        movzx eax, byte [dword edi+LinesWorkTable+2Eh]
        cmp eax, byte 64h
        jne short .143
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 2Eh
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+2Eh], al
.143:
        add edi, byte 3
        cmp edi, byte 6
        jne near .140
        xor edi, edi
.144:
        movzx eax, byte [dword edi+LinesWorkTable+2Fh]
        cmp eax, byte 64h
        jne short .145
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 2Eh
        push eax
        mov ecx, esi
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+2Fh], al
.145:
        movzx eax, byte [dword edi+LinesWorkTable+2Fh]
        cmp eax, byte 64h
        jne short .146
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 2Eh
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+2Fh], al
.146:
        movzx eax, byte [dword edi+LinesWorkTable+2Fh]
        cmp eax, byte 64h
        jne short .147
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 2Eh
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+2Fh], al
.147:
        add edi, byte 3
        cmp edi, byte 6
        jne near .144
        xor edi, edi
.148:
        movzx eax, byte [dword edi+LinesWorkTable+30h]
        cmp eax, byte 64h
        jne short .149
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 2Eh
        push eax
        mov ecx, esi
        mov eax, 44h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+30h], al
.149:
        movzx eax, byte [dword edi+LinesWorkTable+30h]
        cmp eax, byte 64h
        jne short .150
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 2Eh
        push eax
        mov ecx, esi
        mov eax, 4Ch
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+30h], al
.150:
        movzx eax, byte [dword edi+LinesWorkTable+30h]
        cmp eax, byte 64h
        jne short .151
        push dword [byte ebp+036h]
        lea eax, [byte ebp-03Ah]
        mov ebx, 6
        mov edx, 2Eh
        push eax
        mov ecx, esi
        mov eax, 52h
        call FindUnusedLinePlayer
        mov byte [dword edi+LinesWorkTable+30h], al
.151:
        add edi, byte 3
        cmp edi, byte 6
        jne near .148
        mov ebx, dword [byte ebp+03Ah]
        mov edx, dword [byte ebp+036h]
        mov eax, esi
        call CountLineSlots
        test eax, eax
        jle near CountLineSlots_4DD
        cmp eax, byte 7
        jge near CountLineSlots_4DD
        xor edx, edx
        jmp short .154
.152:
        mov eax, edx
        shl eax, 2
        mov ebx, dword [byte eax+ebp-03Ah]
        shl ebx, 2
        cmp dword [esi+ebx], byte 0
        jne short .153
        mov ebx, dword [dword ebx+LinesPlayerOrder]
        movsx ebx, byte [byte ebx+02h]
        cmp ebx, byte 47h
        je short .153
        mov al, byte [byte eax+ebp-03Ah]
        mov edx, dword [byte ebp+036h]
        mov byte [LinesWorkTable+24h], al
.153:
        inc edx
.154:
        cmp edx, dword [byte ebp+036h]
        jl short .152
        xor edi, edi
        jmp short .158
.155:
        mov edx, edi
        shl edx, 2
        mov eax, dword [byte edx+ebp-03Ah]
        shl eax, 2
        cmp dword [esi+eax], byte 0
        jne short .157
        mov eax, dword [dword eax+LinesPlayerOrder]
        movsx eax, byte [byte eax+02h]
        cmp eax, byte 47h
        je short .157
        movzx eax, byte [LinesWorkTable+24h]
        cmp eax, dword [byte edx+ebp-03Ah]
        je short .157
        mov ebx, dword [byte ebp+03Ah]
        mov al, byte [byte edx+ebp-03Ah]
        mov edx, dword [byte ebp+036h]
        mov byte [LinesWorkTable+25h], al
        mov eax, esi
        call CountLineSlots
        test eax, eax
        je short .156
        cmp eax, byte 6
        jle short .157
.156:
        mov edi, dword [byte ebp+036h]
.157:
        inc edi
.158:
        cmp edi, dword [byte ebp+036h]
        jl short .155
        jmp near CountLineSlots_4DD
;-----------------------------------------------------------------------------
; FindUnusedLinePlayer                            A1734  96 PC, low confidence
; Finds a player of a position not yet on any line
;-----------------------------------------------------------------------------
FindUnusedLinePlayer:
        push esi
        push edi
        enter 20h, 0
        mov byte [byte ebp-04h], al
        mov esi, edx
        mov dword [byte ebp-018h], ecx
        lea eax, [edx+ebx]
        mov dword [byte ebp-020h], eax
        mov eax, edx
        xor ecx, ecx
        add eax, LinesWorkTable
        mov ebx, dword [byte ebp+010h]
        mov dword [byte ebp-01Ch], eax
        jmp near .6
.1:
        mov eax, ecx
        shl eax, 2
        mov dword [byte ebp-014h], eax
        mov eax, dword [ebx]
        mov edx, dword [byte ebp-018h]
        shl eax, 2
        cmp dword [edx+eax], byte 0
        jne short .5
        mov eax, dword [dword eax+LinesPlayerOrder]
        mov al, byte [byte eax+02h]
        cmp al, byte [byte ebp-04h]
        jne short .5
        mov dword [byte ebp-0Ch], 0
        mov eax, dword [byte ebp-014h]
        mov edx, dword [byte ebp-01Ch]
        mov dword [byte ebp-08h], esi
        mov dword [byte ebp-010h], eax
        jmp short .4
.2:
        movsx edi, byte [edx]
        cmp edi, dword [eax]
        jne short .3
        mov dword [byte ebp-0Ch], 1
.3:
        inc dword [byte ebp-08h]
        inc edx
.4:
        mov eax, dword [byte ebp+010h]
        mov edi, dword [byte ebp-08h]
        add eax, dword [byte ebp-010h]
        cmp edi, dword [byte ebp-020h]
        jl short .2
        cmp dword [byte ebp-0Ch], byte 0
        jne short .5
        mov eax, dword [eax]
        jmp near DrawLineJersey_104
.5:
        add ebx, byte 4
        inc ecx
.6:
        cmp ecx, dword [byte ebp+014h]
        jl short .1
        mov eax, 64h
        jmp near DrawLineJersey_104
