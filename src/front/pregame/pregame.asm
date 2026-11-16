; The pre-game screens between the controller screen and the game: matchup, teams, player cards (96 PC).
bits 32
%include "hockey.inc"
extern SimWork
extern BottomBarArt
section s_849D5 progbits alloc exec nowrite align=1
extern BlackPalette, TextCharH, PlayoffTeams, PlayoffRoundNum, CardsSpeechPending, TeamsSpeechPending, AwayCardsSpeechPending
extern MatchupSpeechPending, CopyBitmap, DrawColorTextCentred, DrawColorTextRight, DrawFrameAt, seasondb, CareerDb, statsplayoffs
extern PlayerAttrFile, PlayerAttrFileSize, TeamConferenceIds, FrontEndScreenBmp, MatchupLayer, TeamStatsBitmap, MenuBoxStyle
extern PlayoffTreeData, SeasonType, SeasonDay, SeasonGamePending, PlayoffGameOpts, cddriveptr, PlayoffRound, PlayoffTreeShape
extern PlayoffSlotTeams, PlayoffFlags, RightLogoFrames, LeftLogoFrames, LogoSpinFrame, LogoSpinTime, FadeOut
extern FadePalette, FileClose, FileOpenRead, FillMusicStream, gameopts, GetLangText, GetTeamNameArt, GetTicks
extern InitMenuItems, LinkSync, LoadPackedFile, LoadTeamLogo, MakeSeasonDbPath, ModemChat, MouseRead, mousex
extern mousey, TeamCityNames, TeamNicknames, OpenScreen, optflags, PaEvent, PutBlock, RemapScreenColors
extern RunMenu, SetDrawBitmap, SetMenuMouse, SetScreenColors, SetScreenPalette, SetTextColors, SetTextColorsRgb, SlideInBottomBar
extern SlideInSideBar, SlideInTitleBar, SoundIdle, SoundSecondsToBytes, sprintf_, StopSpeech, str_04d2, str_A07d
extern str_Ard, str_Bkgd13, str_BKGD14, str_Card, str_CS3, str_D2, str_dbgSpace, str_Down
extern str_DSS, str_FSH, str_FSH3, str_H07d, str_Home, str_LG02d, str_MightyDucksOfAnaheim, str_Pal3
extern str_PalFsh, str_PALS, str_Plyr, str_ProfileFsh, str_SCHEDULE2, str_SS3, str_Xlate, strcat_
extern WriteDbRecord6, SelectDataLibrary, PlayerDbRecord, ComputeTeamRanks, DrawShapeAtOwnPos, DrawShape, PutBlockAtOwnPos, AllocMemBlock
extern FreeMemBlock, CreateBitmap, ClearScreenColour, FreeBitmap, SaveTextState, SetDrawTarget, DosFileInfo, LoadResourceDataShared
extern LoadPackedAlloc, PutBlockKeyed, SetScreenTarget, SetColourRemap, GetColourRemap, FindShape, ClearClipRect, TextSetFont
extern str_PreGameBlank, str_WesternConference2, unk_849C1, unk_849C7, unk_849CB, unk_849D1, SlotsTwoPlayer
global PreGameMatchupScreen, PreGameMatchupScreen_4E6, CycleScreenPalettes, PreGameTeamsScreen, PreGameCardsA, PreGameCardsB, PreGameCardsC, jpt_87328
global PreGameScreens, PreGameScreens_24, PreGameScreens_44, PreGameScreens_4B, PreGameScreens_52, PreGameScreens_59
;-----------------------------------------------------------------------------
; PreGameMatchupScreen                            849D5  96 PC, low confidence
; Pre-game screen 1: the matchup with the home and away pictures (H%07d /
; A%07d .FSH, pal.fsh); the announcer's team pair call (PaEvent 8)
;-----------------------------------------------------------------------------
PreGameMatchupScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 174h, 0
        sub ebp, 82h
        mov eax, 0FFFFFFF9h
        call SelectDataLibrary
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        push eax
        push str_H07d
        lea eax, [byte ebp+062h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        mov edx, str_FSH
        lea eax, [byte ebp+062h]
        call strcat_
        push byte 0
        lea eax, [byte ebp+062h]
        push eax
        call LoadPackedAlloc
        add esp, byte 8
        push str_Down
        push eax
        mov esi, eax
        call FindShape
        add esp, byte 8
        push eax
        call DrawShape
        add esp, byte 4
        push esi
        call FreeMemBlock
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        add esp, byte 4
        shr eax, 1Bh
        push eax
        push str_A07d
        lea eax, [byte ebp+062h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        mov edx, str_FSH
        lea eax, [byte ebp+062h]
        call strcat_
        push byte 0
        lea eax, [byte ebp+062h]
        push eax
        call LoadPackedAlloc
        add esp, byte 8
        push str_Home
        push eax
        mov esi, eax
        call FindShape
        add esp, byte 8
        push eax
        call DrawShape
        add esp, byte 4
        push esi
        call FreeMemBlock
        add esp, byte 4
        push byte 0
        push str_PalFsh
        mov dword [byte ebp+07Eh], 0
        call LoadPackedAlloc
        add esp, byte 8
        mov dword [byte ebp+076h], eax
        push str_Pal3
        push eax
        call FindShape
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp+07Ah], eax
        xor eax, eax
        call SelectDataLibrary
        mov eax, dword [byte ebp+07Ah]
        xor edx, edx
        call SetScreenColors
        mov eax, 2Eh
        call LoadPackedFile
        push eax
        mov esi, eax
        call TextSetFont
        add esp, byte 4
        mov eax, dword [byte ebp+07Ah]
        call SetTextColorsRgb
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        push dword [nosplit eax*4+TeamCityNames]
        lea eax, [byte ebp+042h]
        push eax
        call sprintf_
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        and eax, 3E0000h
        add esp, byte 8
        cmp eax, 340000h
        jb short .1
        mov edx, str_dbgSpace
        lea eax, [byte ebp+042h]
        call strcat_
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        mov edx, dword [nosplit eax*4+TeamNicknames]
        lea eax, [byte ebp+042h]
        call strcat_
.1:
        mov ebx, 5Fh
        mov edx, 1B3h
        lea eax, [byte ebp+042h]
        call DrawColorTextCentred
        mov eax, 228h
        mov ebx, 0CAh
        mov edx, 140h
        call GetLangText
        call DrawColorTextCentred
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        push dword [nosplit eax*4+TeamCityNames]
        lea eax, [byte ebp+042h]
        push eax
        call sprintf_
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        and eax, 1F000h
        add esp, byte 8
        cmp eax, 1A000h
        jb short .2
        mov edx, str_dbgSpace
        lea eax, [byte ebp+042h]
        call strcat_
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        mov edx, dword [nosplit eax*4+TeamNicknames]
        lea eax, [byte ebp+042h]
        call strcat_
.2:
        mov ebx, 131h
        mov edx, 0B9h
        lea eax, [byte ebp+042h]
        call DrawColorTextCentred
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        push esi
        call FreeMemBlock
        add esp, byte 4
        lea edx, [dword ebp-0F2h]
        mov eax, 3
        call InitMenuItems
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        lea edi, [dword ebp-0F2h]
        or al, 6
        mov ecx, 66h
        cwde
        mov esi, TeamStatsBitmap
        call OpenScreen
        rep movsb
        mov byte [dword ebp-0B0h], 0
        mov byte [dword ebp-0AEh], 0
        mov ecx, 66h
        lea edi, [dword ebp-08Ch]
        mov esi, BottomBarArt+56h
        mov byte [dword ebp-0ADh], 1
        mov byte [dword ebp-0AFh], 0
        rep movsb
        mov ax, word [SlotsTwoPlayer]
        mov byte [byte ebp-04Ah], 1
        xor ah, ah
        mov byte [byte ebp-048h], 0
        and al, 1
        mov byte [byte ebp-047h], 1
        cwde
        mov byte [byte ebp-049h], 1
        test eax, eax
        je short .3
        mov ecx, 66h
        lea edi, [byte ebp-026h]
        mov esi, MenuBoxStyle
        rep movsb
        mov byte [byte ebp+01Ch], 2
        mov byte [byte ebp+01Eh], 0
        mov byte [byte ebp+01Fh], 2
        mov byte [byte ebp+01Dh], 1
        mov byte [dword ebp-0B0h], 2
        mov byte [byte ebp-04Ah], 2
.3:
        call SetScreenTarget
        push dword [byte ebp-04Eh]
        push dword [byte ebp-052h]
        call MouseRead
        mov ebx, 2
        mov edx, dword [byte ebp+07Ah]
        add esp, byte 8
        xor eax, eax
        mov dword [byte ebp+072h], 1
        call FadePalette
        mov eax, 1
        call LinkSync
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        and edx, 1F000h
        cmp edx, 1A000h
        jae short .4
        mov edx, dword [byte eax+01h]
        and edx, 3E0000h
        cmp edx, 340000h
        jb short .5
.4:
        mov esi, 14h
        jmp short .6
.5:
        mov esi, dword [byte eax+01h]
        shl esi, 0Fh
        shr esi, 1Bh
.6:
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        and edx, 1F000h
        cmp edx, 1A000h
        jb short .7
        mov eax, dword [byte eax+01h]
        and eax, 3E0000h
        cmp eax, 340000h
        jb short .7
        mov edx, 200h
        jmp short .10
.7:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 10h
        jne short .8
        mov edx, 2
        jmp short .10
.8:
        cmp eax, byte 20h
        jne short .9
        mov edx, dword [PlayoffRound]
        jmp short .10
.9:
        mov edx, 1
.10:
        cmp byte [MatchupSpeechPending], 0
        je short .13
        mov eax, dword [gameopts]
        mov ebx, dword [byte eax+01h]
        shl ebx, 0Fh
        mov eax, dword [byte eax+01h]
        shr ebx, 1Bh
        shl eax, 0Ah
        push ebx
        shr eax, 1Bh
        push eax
        mov eax, dword [optflags]
        and eax, byte 70h
        push edx
        cmp eax, byte 20h
        jne short .11
        mov eax, dword [PlayoffTreeShape]
        inc eax
        jmp short .12
.11:
        xor eax, eax
.12:
        push eax
        push esi
        push byte 8
        call PaEvent
        mov byte [MatchupSpeechPending], 0
        add esp, byte 18h
.13:
        call SoundIdle
        cmp dword [byte ebp+072h], byte 0
        jl short .15
        cmp dword [byte ebp+072h], byte 3
        jge short .15
        imul eax, dword [byte ebp+072h], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0B8h]
        jne short .14
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0B4h]
        je short .15
.14:
        mov dword [byte ebp+072h], 0FFFFFFFFh
.15:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        mov edx, eax
        or dl, 2
        movsx edx, dx
        push edx
        mov ebx, 0FFFFFFFFh
        xor ecx, ecx
        push byte 0
        lea edx, [byte ebp+072h]
        cwde
        push edx
        inc eax
        inc eax
        lea edx, [dword ebp-0F2h]
        call RunMenu
        cmp dword [byte ebp+072h], byte 1
        jb short .16
        jbe short .17
        cmp dword [byte ebp+072h], byte 2
        je short .18
        jmp short .19
.16:
        cmp dword [byte ebp+072h], byte 0
        jne short .19
        call SlideInSideBar
        mov dword [byte ebp+07Eh], 0FFFFFFF6h
        jmp short .19
.17:
        call SlideInTitleBar
        mov dword [byte ebp+07Eh], 1
        jmp short .19
.18:
        call SlideInBottomBar
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        mov ecx, 0FCh
        mov ebx, 0FAh
        push dword 0FEh
        mov edx, 0F7h
        mov eax, 1
        call ModemChat
.19:
        cmp dword [byte ebp+07Eh], byte 0
        je near .13
        push dword [byte ebp+076h]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 2
        call FadeOut
        call StopSpeech
        mov eax, dword [byte ebp+07Eh]
PreGameMatchupScreen_4E6:
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CycleScreenPalettes                             84EC8  96 PC, low confidence
; Every 8 ticks steps through 12h palettes (LeftLogoFrames, RightLogoFrames)
;-----------------------------------------------------------------------------
CycleScreenPalettes:
        push ebx
        push ecx
        push edx
        call GetTicks
        cmp eax, dword [LogoSpinTime]
        jle short .1
        mov eax, dword [LogoSpinFrame]
        inc eax
        mov ebx, 12h
        cdq
        idiv ebx
        push dword [nosplit edx*4+LeftLogoFrames]
        mov dword [LogoSpinFrame], edx
        call PutBlockAtOwnPos
        mov eax, dword [LogoSpinFrame]
        add esp, byte 4
        push dword [nosplit eax*4+RightLogoFrames]
        call PutBlockAtOwnPos
        add esp, byte 4
        call GetTicks
        add eax, byte 8
        mov dword [LogoSpinTime], eax
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PreGameTeamsScreen                              84F20  96 PC, low confidence
; Pre-game screen 2: both teams' logos and name art (SCHEDULE, %04d)
;-----------------------------------------------------------------------------
PreGameTeamsScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1D4h, 0
        sub ebp, 82h
        mov eax, 4
        call SoundSecondsToBytes
        call FillMusicStream
        xor edx, edx
        mov eax, 0B3h
        call LoadPackedFile
        push byte 0
        mov dword [byte ebp+056h], eax
        mov dword [byte ebp+032h], eax
        call ClearScreenColour
        add esp, byte 4
        call BlackPalette
        push str_Pal3
        mov esi, str_WesternConference2
        push dword [byte ebp+056h]
        add esi, 1F2h
        call FindShape
        add esp, byte 8
        lea edx, [byte eax+010h]
        mov ecx, 0C0h
        lea edi, [dword eax+0202h]
        rep movsb
        mov eax, edx
        mov dword [byte ebp+066h], edx
        call SetScreenColors
        call ComputeTeamRanks
        call SetScreenTarget
        push str_Bkgd13
        push dword [byte ebp+056h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        xor eax, eax
        mov edx, 0E00000h
        call GetTeamNameArt
        movsx edi, word [byte eax+04h]
        mov eax, 0F333h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        mov dword [byte ebp+03Eh], 0
        cmp eax, edi
        jle short .1
        mov edi, eax
.1:
        mov edx, 780000h
        mov eax, 0F333h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        push byte 0
        add eax, byte 14h
        push eax
        push edi
        mov dword [byte ebp+056h], eax
        call CreateBitmap
        mov esi, eax
        sar edi, 1
        mov eax, 91h
        sub eax, edi
        mov dword [byte ebp+02Eh], eax
        mov eax, dword [byte esi+02Ch]
        mov edx, dword [byte ebp+02Eh]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp+056h]
        mov edx, 9Ch
        sar eax, 1
        sub edx, eax
        mov dword [byte ebp+03Ah], edx
        mov eax, dword [byte ebp+03Ah]
        mov dword [byte ebp+07Eh], eax
        mov eax, dword [byte esi+02Ch]
        mov edx, dword [byte ebp+07Eh]
        add esp, byte 0Ch
        mov word [byte eax+0Eh], dx
        push dword [byte esi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push esi
        call SetDrawBitmap
        add esp, byte 4
        mov edx, 0E00000h
        mov eax, 0F333h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, edi
        sar eax, 11h
        sub ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        mov ecx, 14h
        call LoadTeamLogo
        mov edx, eax
        mov eax, 0F333h
        call DrawFrameAt
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        call GetTeamNameArt
        movsx edx, word [byte eax+04h]
        mov ebx, edi
        sar edx, 1
        xor ecx, ecx
        sub ebx, edx
        mov edx, eax
        mov eax, 0FAE1h
        call DrawFrameAt
        call SetScreenTarget
        push dword [byte ebp+03Ah]
        push dword [byte ebp+02Eh]
        push dword [byte esi+02Ch]
        call PutBlock
        mov eax, 1EAh
        sub eax, edi
        mov dword [byte ebp+056h], eax
        mov eax, dword [byte esi+02Ch]
        mov edx, dword [byte ebp+056h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte esi+02Ch]
        mov edx, dword [byte ebp+07Eh]
        add esp, byte 0Ch
        mov word [byte eax+0Eh], dx
        push dword [byte esi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push esi
        call SetDrawBitmap
        add esp, byte 4
        mov edx, 0E00000h
        mov eax, 0F333h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, edi
        sar eax, 11h
        sub ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        mov ecx, 14h
        call LoadTeamLogo
        mov edx, eax
        mov eax, 0F333h
        call DrawFrameAt
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        call GetTeamNameArt
        movsx edx, word [byte eax+04h]
        mov ebx, edi
        sar edx, 1
        xor ecx, ecx
        sub ebx, edx
        mov edx, eax
        mov eax, 0FAE1h
        call DrawFrameAt
        call SetScreenTarget
        push dword [byte ebp+03Ah]
        push dword [byte ebp+056h]
        push dword [byte esi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push esi
        call FreeBitmap
        add esp, byte 4
        push byte 0
        push dword 0BAh
        push dword 9Bh
        mov dword [byte ebp+04Ah], 1
        mov dword [byte ebp+076h], 4
        call CreateBitmap
        add esp, byte 0Ch
        mov edi, eax
.2:
        push dword [byte ebp+04Ah]
        push str_04d2
        lea eax, [byte ebp+022h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+022h]
        push eax
        push dword [byte ebp+032h]
        call FindShape
        mov esi, eax
        mov eax, dword [byte edi+02Ch]
        mov word [byte eax+0Ch], 49h
        mov eax, dword [byte edi+02Ch]
        add esp, byte 8
        mov word [byte eax+0Eh], 0EBh
        call SetScreenTarget
        push dword [byte edi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push edi
        mov dword [byte ebp+07Ah], 0
        mov dword [byte ebp+04Eh], 0
        call SetDrawBitmap
        add esp, byte 4
.3:
        mov edx, dword [byte ebp+04Eh]
        mov eax, dword [gameopts]
        add edx, eax
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        movsx eax, byte [byte edx+eax+011h]
        test byte [optflags], 70h
        je short .4
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .5
.4:
        shl eax, 2
        mov ebx, 1Ch
        jmp short .6
.5:
        shl eax, 2
        mov ebx, 1Ah
.6:
        cdq
        idiv ebx
        mov dword [byte ebp+06Eh], eax
        jmp short .8
.7:
        movsx ecx, word [byte esi+06h]
        imul ecx, dword [byte ebp+07Ah]
        movsx ebx, word [byte esi+04h]
        imul ebx, dword [byte ebp+06Eh]
        mov eax, 0EB85h
        mov edx, esi
        inc ecx
        inc ecx
        inc ebx
        inc ebx
        inc dword [byte ebp+06Eh]
        call DrawFrameAt
.8:
        cmp dword [byte ebp+06Eh], byte 5
        jl short .7
        inc dword [byte ebp+07Ah]
        add dword [byte ebp+04Eh], byte 1Ch
        cmp dword [byte ebp+07Ah], byte 6
        jl short .3
        mov eax, dword [byte edi+02Ch]
        xor edx, edx
        call CopyBitmap
        mov edx, dword [byte ebp+076h]
        mov dword [dword edx+LeftLogoFrames-4], eax
        mov eax, dword [byte edi+02Ch]
        mov word [byte eax+0Ch], 19Dh
        mov eax, dword [byte edi+02Ch]
        mov word [byte eax+0Eh], 0EBh
        call SetScreenTarget
        push dword [byte edi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push edi
        mov dword [byte ebp+072h], 0
        mov dword [byte ebp+06Ah], 0
        call SetDrawBitmap
        add esp, byte 4
.9:
        mov edx, dword [byte ebp+06Ah]
        mov eax, dword [gameopts]
        add edx, eax
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        movsx eax, byte [byte edx+eax+011h]
        test byte [optflags], 70h
        je short .10
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .11
.10:
        shl eax, 2
        mov ebx, 1Ch
        jmp short .12
.11:
        shl eax, 2
        mov ebx, 1Ah
.12:
        cdq
        idiv ebx
        mov edx, 5
        sub edx, eax
        mov dword [byte ebp+052h], 0
        mov dword [byte ebp+02Ah], edx
        jmp short .14
.13:
        movsx eax, word [byte esi+06h]
        imul eax, dword [byte ebp+072h]
        lea ecx, [byte eax+02h]
        movsx eax, word [byte esi+04h]
        imul eax, dword [byte ebp+052h]
        lea ebx, [byte eax+02h]
        mov edx, esi
        mov eax, 0EB85h
        inc dword [byte ebp+052h]
        call DrawFrameAt
.14:
        mov eax, dword [byte ebp+052h]
        cmp eax, dword [byte ebp+02Ah]
        jl short .13
        inc dword [byte ebp+072h]
        add dword [byte ebp+06Ah], byte 1Ch
        cmp dword [byte ebp+072h], byte 6
        jl near .9
        mov eax, dword [byte edi+02Ch]
        xor edx, edx
        call CopyBitmap
        mov edx, dword [byte ebp+076h]
        inc dword [byte ebp+04Ah]
        add dword [byte ebp+076h], byte 4
        mov dword [dword edx+SimWork+250h], eax
        cmp dword [byte ebp+04Ah], byte 13h
        jl near .2
        call SetScreenTarget
        push edi
        call FreeBitmap
        add esp, byte 4
        call GetTicks
        dec eax
        mov dword [LogoSpinFrame], 11h
        mov dword [LogoSpinTime], eax
        call CycleScreenPalettes
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        mov esi, TeamStatsBitmap
        or al, 6
        lea edi, [dword ebp-0152h]
        cwde
        mov ecx, 66h
        call OpenScreen
        rep movsb
        mov byte [dword ebp-0110h], 0
        mov byte [dword ebp-010Eh], 0
        mov ecx, 66h
        lea edi, [dword ebp-0ECh]
        mov esi, BottomBarArt+56h
        mov byte [dword ebp-010Dh], 1
        mov byte [dword ebp-010Fh], 0
        rep movsb
        mov ax, word [SlotsTwoPlayer]
        mov byte [dword ebp-0AAh], 1
        xor ah, ah
        mov byte [dword ebp-0A8h], 0
        and al, 1
        mov byte [dword ebp-0A7h], 1
        cwde
        mov byte [dword ebp-0A9h], 1
        test eax, eax
        je short .15
        mov ecx, 66h
        lea edi, [dword ebp-086h]
        mov esi, MenuBoxStyle
        rep movsb
        mov byte [byte ebp-044h], 2
        mov byte [byte ebp-042h], 0
        mov byte [byte ebp-041h], 2
        mov byte [byte ebp-043h], 1
        mov byte [dword ebp-0110h], 2
        mov byte [dword ebp-0AAh], 2
.15:
        mov edx, dword [dword ebp-0AEh]
        mov eax, dword [dword ebp-0B2h]
        mov ebx, 3
        call SetMenuMouse
        mov edx, dword [byte ebp+066h]
        xor eax, eax
        mov dword [byte ebp+046h], 1
        call FadePalette
        mov eax, 1
        call LinkSync
        cmp byte [TeamsSpeechPending], 0
        je near .56
        mov ecx, 0Bh
        lea edi, [byte ebp+016h]
        xor eax, eax
        rep stosb
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 10h
        jne near .31
        cmp dword [SeasonGamePending], byte 0
        jle near .31
        imul eax, dword [SeasonDay], dword 31Bh
        mov edx, dword [statsplayoffs]
        add edx, eax
        mov eax, dword [SeasonType]
        mov dword [byte ebp+062h], edx
        cmp eax, byte 1
        jb short .16
        jbe short .17
        cmp eax, byte 2
        je short .18
        jmp short .19
.16:
        test eax, eax
        jne short .19
        mov dword [byte ebp+04Ah], 444h
        jmp short .19
.17:
        mov dword [byte ebp+04Ah], 270h
        jmp short .19
.18:
        mov dword [byte ebp+04Ah], 145h
.19:
        mov ebx, 6
        lea eax, [byte ebp-01Eh]
        mov edx, dword [PlayoffTreeData]
        call MakeSeasonDbPath
        lea edx, [byte ebp+042h]
        lea eax, [byte ebp-01Eh]
        call FileOpenRead
        test eax, eax
        jne near .29
        push eax
        imul eax, dword [byte ebp+04Ah], byte 6
        inc eax
        inc eax
        push eax
        push str_SCHEDULE2
        call AllocMemBlock
        mov ebx, dword [byte ebp+04Ah]
        add esp, byte 0Ch
        mov edi, eax
        mov edx, eax
        mov eax, dword [byte ebp+042h]
        call WriteDbRecord6
        test eax, eax
        jne near .27
        mov esi, dword [SeasonGamePending]
        xor edx, edx
        dec esi
.20:
        cmp edx, byte 0Bh
        jge near .28
        test esi, esi
        jl near .28
        mov eax, esi
        shl eax, 2
        add eax, dword [byte ebp+062h]
        mov eax, dword [dword eax+014Fh]
        dec eax
        dec eax
        add eax, edi
        movzx ebx, byte [byte eax+04h]
        cmp ebx, 0FFh
        je short .21
        movzx ebx, byte [byte eax+05h]
        cmp ebx, 0FFh
        jne short .22
.21:
        xor esi, esi
        jmp short .26
.22:
        movzx ebx, byte [byte eax+02h]
        cmp ebx, dword [SeasonDay]
        sete bl
        mov cl, byte [byte eax+04h]
        movzx ebx, bl
        cmp cl, byte [byte eax+05h]
        jbe short .24
        test ebx, ebx
        setne al
.23:
        movzx eax, al
        inc eax
        inc eax
        mov byte [byte edx+ebp+016h], al
        jmp short .26
.24:
        cmp cl, byte [byte eax+05h]
        jae short .25
        test ebx, ebx
        sete al
        jmp short .23
.25:
        mov byte [byte edx+ebp+016h], 1
.26:
        dec esi
        inc edx
        jmp short .20
.27:
        mov dword [byte ebp+04Ah], 0
.28:
        lea eax, [byte ebp+042h]
        call FileClose
        push edi
        call FreeMemBlock
        add esp, byte 4
        jmp short .30
.29:
        mov dword [byte ebp+04Ah], 0
.30:
        cmp dword [byte ebp+04Ah], byte 0
        je near .55
        lea eax, [byte ebp+016h]
        push eax
        push dword [SeasonDay]
        push byte 4
        jmp near .47
.31:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 20h
        jne near .55
        mov eax, dword [PlayoffGameOpts]
        shl eax, 0Ah
        shr eax, 1Bh
        mov dword [byte ebp+036h], 0
        mov dword [byte ebp+05Ah], eax
        mov eax, dword [PlayoffGameOpts]
        mov edx, 0FFFFFFFFh
        shl eax, 0Fh
        xor ecx, ecx
        shr eax, 1Bh
        xor esi, esi
        mov dword [byte ebp+05Eh], eax
        xor eax, eax
.32:
        cmp eax, byte 40h
        jge short .36
        cmp edx, byte 2
        jge short .36
        cmp byte [dword esi+PlayoffTeams], 0
        je short .35
        mov edi, dword [dword eax+PlayoffSlotTeams]
        lea ebx, [byte edx+01h]
        cmp edi, dword [byte ebp+05Eh]
        jne short .33
        mov ecx, 1
        jmp short .34
.33:
        cmp edi, dword [byte ebp+05Ah]
        jne short .35
        mov dword [byte ebp+036h], 1
.34:
        mov edx, ebx
.35:
        add esi, byte 1Ah
        add eax, byte 4
        jmp short .32
.36:
        mov edi, dword [cddriveptr]
        mov edx, dword [PlayoffFlags]
        mov eax, dword [PlayoffFlags]
        and edi, byte 7
        and edx, byte 7
        shl eax, 1Ah
        shr edi, 1
        shr eax, 1Dh
        test ecx, ecx
        je near .49
        mov esi, dword [PlayoffGameOpts]
        shl esi, 0Fh
        shr esi, 1Bh
        cmp edx, eax
        jne short .38
        test byte [PlayoffFlags], 7
.37:
        je near .55
        push eax
        push byte 3
        push esi
        push byte 2
        call PaEvent
        add esp, byte 10h
        jmp near .55
.38:
        jae short .43
        cmp eax, edi
        jne short .41
        movsx eax, byte [PlayoffRoundNum]
        cmp eax, byte 3
        jne short .40
.39:
        push byte 8
        jmp short .46
.40:
        push byte 7
        jmp short .46
.41:
        push eax
        push edx
.42:
        push byte 2
        jmp near .54
.43:
        cmp edx, edi
        jne short .48
        movsx eax, byte [PlayoffRoundNum]
        cmp eax, byte 2
        jne short .45
.44:
        cmp dword [nosplit esi*4+TeamConferenceIds], byte 3
        setne al
        movzx eax, al
        add eax, byte 5
        push eax
        jmp short .46
.45:
        push byte 4
.46:
        push esi
        push byte 2
.47:
        call PaEvent
        add esp, byte 0Ch
        jmp near .55
.48:
        push eax
        push edx
        push byte 1
        jmp short .54
.49:
        cmp dword [byte ebp+036h], byte 0
        je short .55
        mov esi, dword [PlayoffGameOpts]
        shl esi, 0Ah
        shr esi, 1Bh
        cmp edx, eax
        jne short .50
        test byte [PlayoffFlags], 38h
        jmp near .37
.50:
        cmp eax, edx
        jae short .52
        cmp edx, edi
        jne short .51
        movsx eax, byte [PlayoffRoundNum]
        cmp eax, byte 3
        je near .39
        jmp near .40
.51:
        push edx
        push eax
        jmp near .42
.52:
        cmp eax, edi
        jne short .53
        movsx eax, byte [PlayoffRoundNum]
        cmp eax, byte 2
        je near .44
        jmp short .45
.53:
        push edx
        push eax
        push byte 1
.54:
        push esi
        push byte 2
        call PaEvent
        add esp, byte 14h
.55:
        mov byte [TeamsSpeechPending], 0
.56:
        call SoundIdle
        cmp dword [byte ebp+046h], byte 0
        jl short .58
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        inc eax
        inc eax
        cmp eax, dword [byte ebp+046h]
        jle short .58
        imul eax, dword [byte ebp+046h], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0118h]
        jne short .57
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0114h]
        je short .58
.57:
        mov dword [byte ebp+046h], 0FFFFFFFFh
.58:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        mov edx, eax
        or dl, 2
        movsx edx, dx
        push edx
        mov ecx, CycleScreenPalettes
        mov ebx, 0FFFFFFFFh
        push byte 0
        lea edx, [byte ebp+046h]
        cwde
        push edx
        inc eax
        inc eax
        lea edx, [dword ebp-0152h]
        call RunMenu
        cmp dword [byte ebp+046h], byte 1
        jb short .59
        jbe short .60
        cmp dword [byte ebp+046h], byte 2
        je short .61
        jmp short .62
.59:
        cmp dword [byte ebp+046h], byte 0
        jne short .62
        call SlideInSideBar
        mov dword [byte ebp+03Eh], 0FFFFFFF6h
        jmp short .62
.60:
        call SlideInTitleBar
        mov dword [byte ebp+03Eh], 1
        jmp short .62
.61:
        call SlideInBottomBar
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        mov ecx, 0FCh
        mov ebx, 0FAh
        push dword 0FEh
        mov edx, 0F7h
        mov eax, 1
        call ModemChat
.62:
        cmp dword [byte ebp+03Eh], byte 0
        je near .56
        xor esi, esi
.63:
        push dword [dword esi+LeftLogoFrames]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword esi+RightLogoFrames]
        add esi, byte 4
        call FreeMemBlock
        add esp, byte 4
        cmp esi, byte 48h
        jne short .63
        push dword [byte ebp+032h]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 3
        call FadeOut
        call StopSpeech
        mov eax, dword [byte ebp+03Eh]
        jmp near PreGameMatchupScreen_4E6
;-----------------------------------------------------------------------------
; PreGameCardsA                                   85911  96 PC, low confidence
; Pre-game screen 3: player cards (profile.fsh, card, plyr, Xlate)
;-----------------------------------------------------------------------------
PreGameCardsA:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1A8h, 0
        sub ebp, 82h
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        xor edx, edx
        mov eax, 0B6h
        call LoadPackedFile
        push byte 0
        mov esi, eax
        mov dword [byte ebp+056h], eax
        call ClearScreenColour
        add esp, byte 4
        call BlackPalette
        push str_Pal3
        push esi
        call FindShape
        add esp, byte 8
        push str_BKGD14
        add eax, byte 10h
        push esi
        mov dword [byte ebp+06Ah], eax
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        mov eax, 0FFFFFFF8h
        call SelectDataLibrary
        push byte 20h
        push dword 200h
        push str_Xlate
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0AEh
        push dword 0A0h
        mov dword [byte ebp+07Ah], eax
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push dword 0AEh
        push dword 0A0h
        mov dword [byte ebp+06Eh], eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [byte ebp+066h], eax
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        imul eax, dword 31Bh
        mov edx, dword [statsplayoffs]
        add eax, edx
        movzx edx, byte [dword eax+0107h]
        mov eax, dword [byte eax+edx*4+063h]
        mov dword [byte ebp+05Ah], 0
        mov dword [byte ebp+042h], eax
        call PlayerDbRecord
        push str_FSH3
        mov ecx, eax
        mov dword [byte ebp+076h], eax
        lea eax, [byte ebp+0Eh]
        push eax
        lea esi, [byte ecx+030h]
        call sprintf_
        add esp, byte 8
        lea edi, [byte ebp+0Eh]
        mov ecx, 4
        rep movsb
        lea eax, [byte ebp+0Eh]
        push eax
        mov edi, dword [byte ebp+06Ah]
        call DosFileInfo
        add edi, byte 5Ah
        add esp, byte 4
        test eax, eax
        jne short .1
        push eax
        push str_ProfileFsh
        call LoadResourceDataShared
        add esp, byte 8
        push str_Ard
        push eax
        mov dword [byte ebp+03Ah], eax
        mov dword [byte ebp+046h], eax
        call FindShape
        add esp, byte 8
        mov ecx, 12Ch
        lea esi, [byte eax+010h]
        rep movsb
        push str_Card
        jmp short .2
.1:
        push byte 0
        lea eax, [byte ebp+0Eh]
        push eax
        call LoadResourceDataShared
        add esp, byte 8
        push str_Pal3
        push eax
        mov dword [byte ebp+03Ah], eax
        mov dword [byte ebp+046h], eax
        call FindShape
        add esp, byte 8
        mov ecx, 12Ch
        lea esi, [byte eax+010h]
        rep movsb
        push str_Plyr
.2:
        push dword [byte ebp+03Ah]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+04Eh], eax
        mov dword [byte ebp+07Eh], 0
        mov cl, byte [byte ebp+07Eh]
        mov eax, dword [byte ebp+07Ah]
        add cl, 1Eh
.3:
        inc dword [byte ebp+07Eh]
        mov byte [eax], cl
        inc eax
        inc cl
        cmp dword [byte ebp+07Eh], byte 64h
        jl short .3
        mov eax, dword [byte ebp+07Eh]
        add eax, dword [byte ebp+07Ah]
.4:
        cmp dword [byte ebp+07Eh], 100h
        jge short .5
        mov dl, byte [byte ebp+07Eh]
        inc dword [byte ebp+07Eh]
        mov byte [eax], dl
        inc eax
        jmp short .4
.5:
        push dword [byte ebp+06Eh]
        call SetDrawBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        add esp, byte 4
        shr eax, 1Bh
        push eax
        push str_LG02d
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+0Eh]
        push eax
        mov dword [byte ebp+07Eh], 0
        xor edi, edi
        push dword [byte ebp+056h]
        mov dword [byte ebp+062h], edi
        call FindShape
        add esp, byte 8
        mov esi, eax
.6:
        cmp dword [byte ebp+062h], 0AEh
        jge short .7
        push dword [byte ebp+062h]
        push edi
        push esi
        call PutBlock
        movsx ecx, word [byte esi+04h]
        add edi, ecx
        add esp, byte 0Ch
        cmp edi, 0A0h
        jl short .6
        movsx eax, word [byte esi+06h]
        add dword [byte ebp+062h], eax
        mov eax, ecx
        mov edi, 3
        cdq
        idiv edi
        inc dword [byte ebp+07Eh]
        mov edi, dword [byte ebp+07Eh]
        neg eax
        imul edi, eax
        neg ecx
        cmp edi, ecx
        jge short .6
        xor edi, edi
        jmp short .6
.7:
        mov esi, dword [byte ebp+07Ah]
        add esi, 100h
        push esi
        call GetColourRemap
        add esp, byte 4
        push dword [byte ebp+07Ah]
        call SetColourRemap
        add esp, byte 4
        push dword [byte ebp+066h]
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call ClearClipRect
        add esp, byte 4
        push byte 0
        push byte 0
        push dword [byte ebp+04Eh]
        call PutBlockKeyed
        add esp, byte 0Ch
        push esi
        call SetColourRemap
        add esp, byte 4
        push dword [byte ebp+06Eh]
        call SetDrawBitmap
        add esp, byte 4
        mov eax, dword [byte ebp+06Ah]
        mov edx, dword [byte ebp+066h]
        call SetScreenPalette
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 10000h
        mov edx, dword [byte edx+02Ch]
        call DrawFrameAt
        call SetScreenTarget
        push dword 89h
        mov eax, dword [byte ebp+06Eh]
        push byte 36h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [byte ebp+046h]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul eax, dword 31Bh
        mov edx, dword [statsplayoffs]
        add eax, edx
        movzx edx, byte [dword eax+0107h]
        mov eax, dword [byte eax+edx*4+063h]
        mov dword [byte ebp+03Eh], eax
        call PlayerDbRecord
        push str_FSH3
        mov ecx, eax
        mov dword [byte ebp+072h], eax
        lea eax, [byte ebp+0Eh]
        push eax
        lea esi, [byte ecx+030h]
        call sprintf_
        add esp, byte 8
        lea edi, [byte ebp+0Eh]
        mov ecx, 4
        rep movsb
        lea eax, [byte ebp+0Eh]
        push eax
        mov edi, dword [byte ebp+06Ah]
        call DosFileInfo
        add edi, 186h
        add esp, byte 4
        test eax, eax
        jne short .8
        push eax
        push str_ProfileFsh
        call LoadResourceDataShared
        add esp, byte 8
        push str_Ard
        push eax
        mov dword [byte ebp+03Ah], eax
        mov dword [byte ebp+04Ah], eax
        call FindShape
        add esp, byte 8
        mov ecx, 12Ch
        lea esi, [byte eax+010h]
        rep movsb
        push str_Card
        jmp short .9
.8:
        push byte 0
        lea eax, [byte ebp+0Eh]
        push eax
        call LoadResourceDataShared
        add esp, byte 8
        push str_Pal3
        push eax
        mov dword [byte ebp+03Ah], eax
        mov dword [byte ebp+04Ah], eax
        call FindShape
        add esp, byte 8
        mov ecx, 12Ch
        lea esi, [byte eax+010h]
        rep movsb
        push str_Plyr
.9:
        push dword [byte ebp+03Ah]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+052h], eax
        mov dword [byte ebp+07Eh], 0
        mov al, byte [byte ebp+07Eh]
        mov edi, dword [byte ebp+07Ah]
        add al, 82h
.10:
        inc dword [byte ebp+07Eh]
        mov byte [edi], al
        inc edi
        inc al
        cmp dword [byte ebp+07Eh], byte 64h
        jl short .10
        mov eax, dword [byte ebp+07Eh]
        add eax, dword [byte ebp+07Ah]
.11:
        cmp dword [byte ebp+07Eh], 100h
        jge short .12
        mov dl, byte [byte ebp+07Eh]
        inc dword [byte ebp+07Eh]
        mov byte [eax], dl
        inc eax
        jmp short .11
.12:
        push dword [byte ebp+06Eh]
        call SetDrawBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        add esp, byte 4
        shr eax, 1Bh
        push eax
        push str_LG02d
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+0Eh]
        push eax
        mov dword [byte ebp+07Eh], 0
        xor edi, edi
        push dword [byte ebp+056h]
        mov dword [byte ebp+05Eh], edi
        call FindShape
        add esp, byte 8
        mov esi, eax
.13:
        cmp dword [byte ebp+05Eh], 0AEh
        jge short .14
        push dword [byte ebp+05Eh]
        push edi
        push esi
        call PutBlock
        movsx ecx, word [byte esi+04h]
        add edi, ecx
        add esp, byte 0Ch
        cmp edi, 0A0h
        jl short .13
        movsx eax, word [byte esi+06h]
        add dword [byte ebp+05Eh], eax
        mov eax, ecx
        mov edi, 3
        cdq
        idiv edi
        inc dword [byte ebp+07Eh]
        mov edi, dword [byte ebp+07Eh]
        neg eax
        imul edi, eax
        neg ecx
        cmp edi, ecx
        jge short .13
        xor edi, edi
        jmp short .13
.14:
        mov esi, dword [byte ebp+07Ah]
        add esi, 100h
        push esi
        call GetColourRemap
        add esp, byte 4
        push dword [byte ebp+07Ah]
        call SetColourRemap
        add esp, byte 4
        push dword [byte ebp+066h]
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call ClearClipRect
        add esp, byte 4
        push byte 0
        push byte 0
        push dword [byte ebp+052h]
        call PutBlockKeyed
        add esp, byte 0Ch
        push esi
        call SetColourRemap
        add esp, byte 4
        push dword [byte ebp+06Eh]
        call SetDrawBitmap
        add esp, byte 4
        mov eax, dword [byte ebp+06Ah]
        mov edx, dword [byte ebp+066h]
        call SetScreenPalette
        xor ecx, ecx
        xor ebx, ebx
        mov eax, 10000h
        mov edx, dword [byte edx+02Ch]
        call DrawFrameAt
        call SetScreenTarget
        push dword 89h
        mov eax, dword [byte ebp+06Eh]
        push dword 1B0h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [byte ebp+04Ah]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+066h]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp+06Eh]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp+07Ah]
        call FreeMemBlock
        add esp, byte 4
        xor eax, eax
        call SelectDataLibrary
        mov eax, dword [byte ebp+06Ah]
        mov edx, 0FEh
        call SetScreenColors
        mov eax, 0FCh
        call SetTextColors
        mov eax, dword [gameopts]
        mov ecx, 142h
        test dword [byte eax+01h], 1F000h
        je short .15
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        push dword [nosplit eax*4+TeamNicknames]
        push dword [nosplit eax*4+TeamCityNames]
        push str_SS3
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .16
.15:
        push str_MightyDucksOfAnaheim
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        add esp, byte 8
.16:
        mov edx, 86h
        lea eax, [byte ebp+0Eh]
        mov ebx, ecx
        call DrawColorTextCentred
        mov eax, dword [gameopts]
        test byte [byte eax+03h], 3Eh
        je short .17
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        push dword [nosplit eax*4+TeamNicknames]
        push dword [nosplit eax*4+TeamCityNames]
        push str_SS3
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .18
.17:
        push str_MightyDucksOfAnaheim
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        add esp, byte 8
.18:
        mov edx, 200h
        lea eax, [byte ebp+0Eh]
        mov ebx, ecx
        call DrawColorTextCentred
        movzx eax, byte [TextCharH]
        add eax, byte 3
        add ecx, eax
        mov eax, dword [byte ebp+076h]
        add eax, byte 13h
        push eax
        mov eax, dword [byte ebp+076h]
        add eax, byte 3
        push eax
        mov eax, dword [byte ebp+076h]
        movzx eax, byte [byte eax+01h]
        push eax
        push str_DSS
        lea eax, [byte ebp+0Eh]
        push eax
        mov edx, 86h
        call sprintf_
        add esp, byte 14h
        mov ebx, ecx
        lea eax, [byte ebp+0Eh]
        call DrawColorTextCentred
        mov eax, dword [byte ebp+072h]
        add eax, byte 13h
        push eax
        mov eax, dword [byte ebp+072h]
        add eax, byte 3
        push eax
        mov eax, dword [byte ebp+072h]
        movzx eax, byte [byte eax+01h]
        push eax
        push str_DSS
        lea eax, [byte ebp+0Eh]
        push eax
        mov edx, 200h
        call sprintf_
        add esp, byte 14h
        mov ebx, ecx
        lea eax, [byte ebp+0Eh]
        call DrawColorTextCentred
        movzx eax, byte [TextCharH]
        add eax, byte 3
        add ecx, eax
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 10h
        je short .19
        cmp eax, byte 20h
        jne near .23
.19:
        mov edx, dword [byte ebp+076h]
        mov eax, dword [seasondb]
        add eax, dword [byte edx+02Ch]
        cmp word [byte eax+016h], byte 0
        je short .21
        mov edi, 64h
        movzx esi, word [byte eax+026h]
        movzx edx, word [byte eax+016h]
        mov eax, esi
        push edx
        cdq
        idiv edi
        mov eax, esi
        push edx
        cdq
        idiv edi
        push eax
        mov eax, 1EBh
.20:
        call GetLangText
        push eax
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        add esp, byte 14h
        jmp near .25
.21:
        cmp word [eax], byte 0
        je short .22
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 20h
        je short .22
        mov edi, 64h
        movzx esi, word [byte eax+010h]
        movzx edx, word [eax]
        mov eax, esi
        push edx
        cdq
        idiv edi
        mov eax, esi
        push edx
        cdq
        idiv edi
        push eax
        mov eax, 1ECh
        jmp short .20
.22:
        mov eax, dword [byte ebp+076h]
        mov eax, dword [byte eax+028h]
        cmp eax, dword [PlayerAttrFileSize]
        jae short .24
        mov edx, dword [byte ebp+076h]
        mov eax, dword [PlayerAttrFile]
        add eax, dword [byte edx+028h]
        mov edi, 64h
        movzx esi, word [byte eax+010h]
        movzx edx, word [eax]
        mov eax, esi
        push edx
        cdq
        idiv edi
        mov eax, esi
        push edx
        cdq
        idiv edi
        push eax
        mov eax, 1EDh
        jmp near .20
.23:
        mov eax, dword [byte ebp+076h]
        mov eax, dword [byte eax+028h]
        cmp eax, dword [PlayerAttrFileSize]
        jae short .24
        mov edx, dword [byte ebp+076h]
        mov eax, dword [CareerDb]
        add eax, dword [byte edx+028h]
        mov edi, 64h
        movzx esi, word [byte eax+010h]
        movzx edx, word [eax]
        mov eax, esi
        push edx
        cdq
        idiv edi
        mov eax, esi
        push edx
        cdq
        idiv edi
        push eax
        mov eax, 1EEh
        jmp near .20
.24:
        push str_PreGameBlank
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        add esp, byte 8
.25:
        mov edx, 86h
        lea eax, [byte ebp+0Eh]
        mov ebx, ecx
        call DrawColorTextCentred
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 10h
        je short .26
        cmp eax, byte 20h
        jne near .30
.26:
        mov edx, dword [byte ebp+072h]
        mov eax, dword [seasondb]
        add eax, dword [byte edx+02Ch]
        cmp word [byte eax+016h], byte 0
        je short .28
        mov edi, 64h
        movzx esi, word [byte eax+026h]
        movzx edx, word [byte eax+016h]
        mov eax, esi
        push edx
        cdq
        idiv edi
        mov eax, esi
        push edx
        cdq
        idiv edi
        push eax
        mov eax, 1EBh
.27:
        call GetLangText
        push eax
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        add esp, byte 14h
        jmp near .32
.28:
        cmp word [eax], byte 0
        je short .29
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 20h
        je short .29
        mov edi, 64h
        movzx esi, word [byte eax+010h]
        movzx edx, word [eax]
        mov eax, esi
        push edx
        cdq
        idiv edi
        mov eax, esi
        push edx
        cdq
        idiv edi
        push eax
        mov eax, 1ECh
        jmp short .27
.29:
        mov eax, dword [byte ebp+072h]
        mov eax, dword [byte eax+028h]
        cmp eax, dword [PlayerAttrFileSize]
        jae short .31
        mov edx, dword [byte ebp+072h]
        mov eax, dword [PlayerAttrFile]
        add eax, dword [byte edx+028h]
        mov edi, 64h
        movzx esi, word [byte eax+010h]
        movzx edx, word [eax]
        mov eax, esi
        push edx
        cdq
        idiv edi
        mov eax, esi
        push edx
        cdq
        idiv edi
        push eax
        mov eax, 1EDh
        jmp near .27
.30:
        mov eax, dword [byte ebp+072h]
        mov eax, dword [byte eax+028h]
        cmp eax, dword [PlayerAttrFileSize]
        jae short .31
        mov edx, dword [byte ebp+072h]
        mov eax, dword [CareerDb]
        add eax, dword [byte edx+028h]
        mov edi, 64h
        movzx esi, word [byte eax+010h]
        movzx edx, word [eax]
        mov eax, esi
        push edx
        cdq
        idiv edi
        mov eax, esi
        push edx
        cdq
        idiv edi
        push eax
        mov eax, 1EEh
        jmp near .27
.31:
        push str_PreGameBlank
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        add esp, byte 8
.32:
        mov edx, 200h
        lea eax, [byte ebp+0Eh]
        mov ebx, ecx
        call DrawColorTextCentred
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        lea edi, [dword ebp-0126h]
        or al, 6
        mov esi, TeamStatsBitmap
        cwde
        mov ecx, 66h
        call OpenScreen
        rep movsb
        mov byte [dword ebp-0E4h], 0
        mov byte [dword ebp-0E2h], 0
        mov ecx, 66h
        lea edi, [dword ebp-0C0h]
        mov esi, BottomBarArt+56h
        mov byte [dword ebp-0E1h], 1
        mov byte [dword ebp-0E3h], 0
        rep movsb
        mov ax, word [SlotsTwoPlayer]
        mov byte [byte ebp-07Eh], 1
        xor ah, ah
        mov byte [byte ebp-07Ch], 0
        and al, 1
        mov byte [byte ebp-07Bh], 1
        cwde
        mov byte [byte ebp-07Dh], 1
        test eax, eax
        je short .33
        mov ecx, 66h
        lea edi, [byte ebp-05Ah]
        mov esi, MenuBoxStyle
        rep movsb
        mov byte [byte ebp-018h], 2
        mov byte [byte ebp-016h], 0
        mov byte [byte ebp-015h], 2
        mov byte [byte ebp-017h], 1
        mov byte [dword ebp-0E4h], 2
        mov byte [byte ebp-07Eh], 2
.33:
        mov edx, dword [dword ebp-082h]
        mov eax, dword [dword ebp-086h]
        mov ebx, 3
        call SetMenuMouse
        mov edx, dword [byte ebp+06Ah]
        xor eax, eax
        mov dword [byte ebp+036h], 1
        call FadePalette
        mov eax, 1
        call LinkSync
        cmp byte [CardsSpeechPending], 0
        je short .34
        push dword [byte ebp+03Eh]
        push dword [byte ebp+042h]
        push dword 200h
        call PaEvent
        mov byte [CardsSpeechPending], 0
        add esp, byte 0Ch
.34:
        call SoundIdle
        cmp dword [byte ebp+036h], byte 0
        jl short .36
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        inc eax
        inc eax
        cmp eax, dword [byte ebp+036h]
        jle short .36
        imul eax, dword [byte ebp+036h], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0ECh]
        jne short .35
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0E8h]
        je short .36
.35:
        mov dword [byte ebp+036h], 0FFFFFFFFh
.36:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        mov edx, eax
        or dl, 2
        movsx edx, dx
        push edx
        mov ebx, 0FFFFFFFFh
        xor ecx, ecx
        push byte 0
        lea edx, [byte ebp+036h]
        cwde
        push edx
        inc eax
        inc eax
        lea edx, [dword ebp-0126h]
        call RunMenu
        cmp dword [byte ebp+036h], byte 1
        jb short .37
        jbe short .38
        cmp dword [byte ebp+036h], byte 2
        je short .39
        jmp short .40
.37:
        cmp dword [byte ebp+036h], byte 0
        jne short .40
        call SlideInSideBar
        mov dword [byte ebp+05Ah], 0FFFFFFF6h
        jmp short .40
.38:
        call SlideInTitleBar
        mov dword [byte ebp+05Ah], 1
        jmp short .40
.39:
        call SlideInBottomBar
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        mov ecx, 0FCh
        mov ebx, 0FAh
        push dword 0FEh
        mov edx, 0F7h
        mov eax, 1
        call ModemChat
.40:
        cmp dword [byte ebp+05Ah], byte 0
        je near .34
        push dword [byte ebp+056h]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 3
        call FadeOut
        call StopSpeech
        mov eax, dword [byte ebp+05Ah]
        jmp near PreGameMatchupScreen_4E6
;-----------------------------------------------------------------------------
; PreGameCardsB                                   86428  96 PC, low confidence
; Pre-game screen 4: player cards (PALS, profile.fsh, card)
;-----------------------------------------------------------------------------
PreGameCardsB:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 218h, 0
        sub ebp, 82h
        lea edi, [byte ebp+04Eh]
        mov eax, dword [unk_849C7]
        mov esi, unk_849C1
        mov dword [byte ebp+056h], eax
        mov eax, 4
        movsd
        movsw
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        imul eax, dword 31Bh
        mov esi, dword [statsplayoffs]
        add esi, eax
        movzx eax, byte [dword esi+0D3h]
        mov eax, dword [byte esi+eax*4+063h]
        call PlayerDbRecord
        mov dword [byte ebp+036h], eax
        movzx eax, byte [dword esi+0D4h]
        mov eax, dword [byte esi+eax*4+063h]
        call PlayerDbRecord
        mov dword [byte ebp+03Ah], eax
        movzx eax, byte [dword esi+0D5h]
        mov eax, dword [byte esi+eax*4+063h]
        call PlayerDbRecord
        mov dword [byte ebp+03Eh], eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul eax, dword 31Bh
        mov esi, dword [statsplayoffs]
        add esi, eax
        movzx eax, byte [dword esi+0D3h]
        mov eax, dword [byte esi+eax*4+063h]
        call PlayerDbRecord
        mov dword [byte ebp+042h], eax
        movzx eax, byte [dword esi+0D4h]
        mov eax, dword [byte esi+eax*4+063h]
        call PlayerDbRecord
        mov dword [byte ebp+046h], eax
        movzx eax, byte [dword esi+0D5h]
        mov eax, dword [byte esi+eax*4+063h]
        call PlayerDbRecord
        mov dword [byte ebp+04Ah], eax
        mov eax, 0FFFFFFF8h
        call SelectDataLibrary
        push byte 20h
        push dword 1200h
        push str_PALS
        mov dword [byte ebp+076h], 0
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [byte ebp-01Eh], eax
        mov dword [byte ebp+072h], 0
        mov dword [byte ebp+07Ah], 0
        mov dword [byte ebp+066h], 0
.1:
        mov eax, dword [byte ebp-01Eh]
        mov edx, dword [byte ebp+07Ah]
        add eax, dword [byte ebp+066h]
        push str_FSH3
        mov dword [byte edx+ebp-01Eh], eax
        lea eax, [byte ebp+0Eh]
        push eax
        mov esi, dword [byte ebp+072h]
        mov ecx, 4
        call sprintf_
        add esp, byte 8
        mov esi, dword [byte esi+ebp+036h]
        lea edi, [byte ebp+0Eh]
        add esi, byte 30h
        rep movsb
        lea eax, [byte ebp+0Eh]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        jne short .2
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        push byte 0
        push str_ProfileFsh
        call LoadResourceDataShared
        add esp, byte 8
        push str_Ard
        mov edi, dword [byte ebp+07Ah]
        push eax
        mov dword [byte ebp+07Eh], eax
        mov dword [byte ebp+062h], eax
        call FindShape
        mov ecx, 300h
        add esp, byte 8
        lea esi, [byte eax+010h]
        mov edi, dword [byte edi+ebp-01Eh]
        rep movsb
        push str_Card
        jmp short .3
.2:
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        push byte 0
        lea eax, [byte ebp+0Eh]
        push eax
        call LoadResourceDataShared
        add esp, byte 8
        push str_Pal3
        mov edi, dword [byte ebp+07Ah]
        push eax
        mov dword [byte ebp+07Eh], eax
        mov dword [byte ebp+062h], eax
        call FindShape
        mov ecx, 300h
        add esp, byte 8
        lea esi, [byte eax+010h]
        mov edi, dword [byte edi+ebp-01Eh]
        rep movsb
        push str_Plyr
.3:
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        xor edx, edx
        call CopyBitmap
        mov edx, dword [byte ebp+07Ah]
        mov dword [byte edx+ebp-022h], eax
        push dword [byte ebp+062h]
        add dword [byte ebp+072h], byte 4
        add dword [byte ebp+07Ah], byte 8
        add dword [byte ebp+066h], 300h
        call FreeMemBlock
        add esp, byte 4
        cmp dword [byte ebp+072h], byte 18h
        jne near .1
        xor eax, eax
        call SelectDataLibrary
        mov eax, 3
        xor edx, edx
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 0B4h
        call LoadPackedFile
        push byte 0
        mov dword [byte ebp+07Eh], eax
        mov dword [byte ebp+05Eh], eax
        call ClearScreenColour
        add esp, byte 4
        call BlackPalette
        push str_Pal3
        mov esi, str_WesternConference2
        push dword [byte ebp+07Eh]
        add esi, 1F2h
        call FindShape
        add esp, byte 8
        lea edx, [byte eax+010h]
        mov ecx, 0C0h
        lea edi, [dword eax+0202h]
        rep movsb
        mov eax, edx
        call SetScreenColors
        mov eax, 4
        call SoundSecondsToBytes
        call FillMusicStream
        push dword [byte ebp+0Ah]
        push dword [byte ebp+06h]
        push dword [byte ebp+02h]
        push dword [byte ebp-02h]
        push dword [byte ebp-06h]
        push dword [byte ebp-0Ah]
        push dword [byte ebp-0Eh]
        push dword [byte ebp-012h]
        push dword [byte ebp-016h]
        push dword [byte ebp-01Ah]
        push dword [byte ebp-01Eh]
        push dword [byte ebp-022h]
        push byte 6
        push byte 18h
        push dword 0A5h
        push byte 19h
        push edx
        call RemapScreenColors
        add esp, byte 44h
        push dword [byte ebp-01Eh]
        mov dword [byte ebp+06Eh], edx
        call FreeMemBlock
        add esp, byte 4
        mov eax, dword [byte ebp+06Eh]
        call SetScreenPalette
        push str_BKGD14
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        push byte 0
        push byte 58h
        push byte 50h
        xor edi, edi
        xor esi, esi
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [byte ebp+06Ah], eax
.4:
        push dword [byte ebp+06Ah]
        call SetDrawBitmap
        add esp, byte 4
        push byte 9
        call ClearClipRect
        mov eax, 828Fh
        add esp, byte 4
        mov edx, dword [byte esi+ebp-022h]
        xor ecx, ecx
        xor ebx, ebx
        call DrawFrameAt
        push dword [byte esi+ebp-022h]
        call FreeMemBlock
        add esp, byte 4
        call SetScreenTarget
        mov eax, edi
        mov ebx, 3
        cdq
        idiv ebx
        movsx eax, word [byte ebp+eax*2+056h]
        push eax
        mov eax, edi
        cdq
        idiv ebx
        movsx eax, word [byte ebp+edx*2+04Eh]
        push eax
        mov eax, dword [byte ebp+06Ah]
        add esi, byte 8
        push dword [byte eax+02Ch]
        inc edi
        call PutBlock
        add esp, byte 0Ch
        cmp edi, byte 6
        jl short .4
        push dword [byte ebp+06Ah]
        call FreeBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        add esp, byte 4
        shr eax, 1Bh
        call GetTeamNameArt
        mov edi, eax
        movsx eax, word [byte eax+06h]
        push byte 0
        add eax, byte 7Dh
        push eax
        push dword 0E0h
        call CreateBitmap
        mov esi, eax
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Ch], 8
        movsx eax, word [byte edi+06h]
        add eax, byte 78h
        mov edx, 0B1h
        sar eax, 1
        sub edx, eax
        mov eax, dword [byte esi+02Ch]
        add esp, byte 0Ch
        mov word [byte eax+0Eh], dx
        push dword [byte esi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push esi
        call SetDrawBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        add esp, byte 4
        shl eax, 0Fh
        xor ecx, ecx
        shr eax, 1Bh
        xor ebx, ebx
        call LoadTeamLogo
        mov edx, eax
        mov eax, 0FD70h
        call DrawFrameAt
        movsx ebx, word [byte edi+04h]
        mov eax, 70h
        sar ebx, 1
        mov ecx, 7Dh
        sub eax, ebx
        mov edx, edi
        mov ebx, eax
        mov eax, 0FD70h
        call DrawFrameAt
        call SetScreenTarget
        push dword [byte esi+02Ch]
        call PutBlockAtOwnPos
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        add esp, byte 4
        shr eax, 1Bh
        call GetTeamNameArt
        mov edi, eax
        mov eax, dword [byte esi+02Ch]
        mov word [byte eax+0Ch], 8
        movsx eax, word [byte edi+06h]
        add eax, byte 78h
        mov edx, 14Eh
        sar eax, 1
        sub edx, eax
        mov eax, dword [byte esi+02Ch]
        mov word [byte eax+0Eh], dx
        push dword [byte esi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push esi
        call SetDrawBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        add esp, byte 4
        shl eax, 0Ah
        xor ecx, ecx
        shr eax, 1Bh
        xor ebx, ebx
        call LoadTeamLogo
        mov edx, eax
        mov eax, 0FD70h
        call DrawFrameAt
        mov ebx, 70h
        movsx eax, word [byte edi+04h]
        mov ecx, 7Dh
        sar eax, 1
        mov edx, edi
        sub ebx, eax
        mov eax, 0FD70h
        call DrawFrameAt
        call SetScreenTarget
        push dword [byte esi+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push esi
        call FreeBitmap
        add esp, byte 4
        lea eax, [byte ebp-062h]
        push eax
        call SaveTextState
        add esp, byte 4
        xor edi, edi
        push dword [FrontEndScreenBmp]
        xor esi, esi
        call TextSetFont
        add esp, byte 4
.5:
        mov eax, dword [byte esi+ebp+036h]
        movzx eax, byte [byte eax+01h]
        push eax
        push str_D2
        lea eax, [byte ebp+0Eh]
        push eax
        call sprintf_
        mov eax, edi
        mov ebx, 3
        cdq
        idiv ebx
        lea ecx, [eax+eax]
        movzx eax, byte [TextCharH]
        movsx ebx, word [byte ecx+ebp+056h]
        inc eax
        inc eax
        add ebx, byte 57h
        sub ebx, eax
        mov eax, edi
        mov dword [byte ebp+07Eh], 3
        cdq
        idiv dword [byte ebp+07Eh]
        add edx, edx
        movsx eax, word [byte edx+ebp+04Eh]
        mov dword [byte ebp+07Eh], edx
        lea edx, [byte eax+04Fh]
        add esp, byte 0Ch
        lea eax, [byte ebp+0Eh]
        call DrawColorTextRight
        mov eax, dword [byte esi+ebp+036h]
        lea edx, [byte eax+013h]
        push edx
        movsx eax, byte [byte eax+03h]
        push eax
        push str_CS3
        lea eax, [byte ebp+0Eh]
        push eax
        add esi, byte 4
        mov edx, dword [byte ebp+07Eh]
        call sprintf_
        lea eax, [byte ebp+0Eh]
        add esp, byte 10h
        movsx ebx, word [byte ecx+ebp+056h]
        movsx edx, word [byte edx+ebp+04Eh]
        add ebx, byte 5Dh
        add edx, byte 28h
        inc edi
        call DrawColorTextCentred
        cmp edi, byte 6
        jl near .5
        lea eax, [byte ebp-062h]
        push eax
        call SetDrawTarget
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        lea edi, [dword ebp-0196h]
        and al, 1
        mov esi, TeamStatsBitmap
        or al, 6
        add esp, byte 4
        cwde
        mov ecx, 66h
        call OpenScreen
        rep movsb
        mov byte [dword ebp-0154h], 0
        mov byte [dword ebp-0152h], 0
        mov ecx, 66h
        lea edi, [dword ebp-0130h]
        mov esi, BottomBarArt+56h
        mov byte [dword ebp-0151h], 1
        mov byte [dword ebp-0153h], 0
        rep movsb
        mov ax, word [SlotsTwoPlayer]
        mov byte [dword ebp-0EEh], 1
        xor ah, ah
        mov byte [dword ebp-0ECh], 0
        and al, 1
        mov byte [dword ebp-0EBh], 1
        cwde
        mov byte [dword ebp-0EDh], 1
        test eax, eax
        je short .6
        mov ecx, 66h
        lea edi, [dword ebp-0CAh]
        mov esi, MenuBoxStyle
        rep movsb
        mov byte [dword ebp-088h], 2
        mov byte [dword ebp-086h], 0
        mov byte [dword ebp-085h], 2
        mov byte [dword ebp-087h], 1
        mov byte [dword ebp-0154h], 2
        mov byte [dword ebp-0EEh], 2
.6:
        mov edx, dword [dword ebp-0F2h]
        mov eax, dword [dword ebp-0F6h]
        mov ebx, 3
        call SetMenuMouse
        mov edx, dword [byte ebp+06Eh]
        xor eax, eax
        mov dword [byte ebp+05Ah], 1
        call FadePalette
        mov eax, 1
        call LinkSync
        cmp byte [AwayCardsSpeechPending], 0
        je short .7
        push byte 1
        call PaEvent
        mov byte [AwayCardsSpeechPending], 0
        add esp, byte 4
.7:
        call SoundIdle
        cmp dword [byte ebp+05Ah], byte 0
        jl short .9
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        inc eax
        inc eax
        cmp eax, dword [byte ebp+05Ah]
        jle short .9
        imul eax, dword [byte ebp+05Ah], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-015Ch]
        jne short .8
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0158h]
        je short .9
.8:
        mov dword [byte ebp+05Ah], 0FFFFFFFFh
.9:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        mov edx, eax
        or dl, 2
        movsx edx, dx
        push edx
        mov ebx, 0FFFFFFFFh
        xor ecx, ecx
        push byte 0
        lea edx, [byte ebp+05Ah]
        cwde
        push edx
        inc eax
        inc eax
        lea edx, [dword ebp-0196h]
        call RunMenu
        cmp dword [byte ebp+05Ah], byte 1
        jb short .10
        jbe short .11
        cmp dword [byte ebp+05Ah], byte 2
        je short .12
        jmp short .13
.10:
        cmp dword [byte ebp+05Ah], byte 0
        jne short .13
        call SlideInSideBar
        mov dword [byte ebp+076h], 0FFFFFFF6h
        jmp short .13
.11:
        call SlideInTitleBar
        mov dword [byte ebp+076h], 1
        jmp short .13
.12:
        call SlideInBottomBar
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        mov ecx, 0FCh
        mov ebx, 0FAh
        push dword 0FEh
        mov edx, 0F7h
        mov eax, 1
        call ModemChat
.13:
        cmp dword [byte ebp+076h], byte 0
        je near .7
        push dword [byte ebp+05Eh]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 3
        call FadeOut
        call StopSpeech
        mov eax, dword [byte ebp+076h]
        jmp near PreGameMatchupScreen_4E6
;-----------------------------------------------------------------------------
; PreGameCardsC                                   86BE4  96 PC, low confidence
; Pre-game screen 5: player cards (PALS, profile.fsh, card)
;-----------------------------------------------------------------------------
PreGameCardsC:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 200h, 0
        sub ebp, 82h
        lea edi, [byte ebp+04Eh]
        mov eax, dword [unk_849D1]
        mov esi, unk_849CB
        mov dword [byte ebp+056h], eax
        mov eax, 2
        movsd
        movsw
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        imul eax, dword 31Bh
        mov esi, dword [statsplayoffs]
        add esi, eax
        movzx eax, byte [dword esi+0DFh]
        mov eax, dword [byte esi+eax*4+063h]
        call PlayerDbRecord
        mov dword [byte ebp+03Eh], eax
        movzx eax, byte [dword esi+0E0h]
        mov eax, dword [byte esi+eax*4+063h]
        call PlayerDbRecord
        mov dword [byte ebp+042h], eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul eax, dword 31Bh
        mov esi, dword [statsplayoffs]
        add esi, eax
        movzx eax, byte [dword esi+0DFh]
        mov eax, dword [byte esi+eax*4+063h]
        call PlayerDbRecord
        mov dword [byte ebp+046h], eax
        movzx eax, byte [dword esi+0E0h]
        mov eax, dword [byte esi+eax*4+063h]
        call PlayerDbRecord
        mov dword [byte ebp+04Ah], eax
        mov eax, 0FFFFFFF8h
        call SelectDataLibrary
        push byte 20h
        push dword 0C00h
        mov dword [byte ebp+06Eh], 0
        mov dword [byte ebp+072h], 0
        push str_PALS
        mov dword [byte ebp+07Ah], 0
        mov dword [byte ebp+066h], 0
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [byte ebp+022h], eax
.1:
        mov eax, dword [byte ebp+022h]
        mov edx, dword [byte ebp+07Ah]
        add eax, dword [byte ebp+066h]
        push str_FSH3
        mov dword [byte edx+ebp+022h], eax
        lea eax, [byte ebp-0Ah]
        push eax
        mov esi, dword [byte ebp+072h]
        mov ecx, 4
        call sprintf_
        add esp, byte 8
        mov esi, dword [byte esi+ebp+03Eh]
        lea edi, [byte ebp-0Ah]
        add esi, byte 30h
        rep movsb
        lea eax, [byte ebp-0Ah]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        jne short .2
        push eax
        push str_ProfileFsh
        call LoadResourceDataShared
        add esp, byte 8
        push str_Ard
        mov edi, dword [byte ebp+07Ah]
        push eax
        mov dword [byte ebp+07Eh], eax
        mov dword [byte ebp+062h], eax
        call FindShape
        mov ecx, 300h
        add esp, byte 8
        lea esi, [byte eax+010h]
        mov edi, dword [byte edi+ebp+022h]
        rep movsb
        push str_Card
        jmp short .3
.2:
        push byte 0
        lea eax, [byte ebp-0Ah]
        push eax
        call LoadResourceDataShared
        add esp, byte 8
        push str_Pal3
        mov edi, dword [byte ebp+07Ah]
        push eax
        mov dword [byte ebp+07Eh], eax
        mov dword [byte ebp+062h], eax
        call FindShape
        mov ecx, 300h
        add esp, byte 8
        lea esi, [byte eax+010h]
        mov edi, dword [byte edi+ebp+022h]
        rep movsb
        push str_Plyr
.3:
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        xor edx, edx
        call CopyBitmap
        mov edx, dword [byte ebp+07Ah]
        mov dword [byte edx+ebp+01Eh], eax
        push dword [byte ebp+062h]
        add dword [byte ebp+072h], byte 4
        add dword [byte ebp+07Ah], byte 8
        add dword [byte ebp+066h], 300h
        call FreeMemBlock
        add esp, byte 4
        cmp dword [byte ebp+072h], byte 10h
        jne near .1
        xor eax, eax
        call SelectDataLibrary
        mov eax, 2
        xor edx, edx
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 0B5h
        call LoadPackedFile
        push byte 0
        mov dword [byte ebp+07Eh], eax
        mov dword [byte ebp+05Eh], eax
        call ClearScreenColour
        add esp, byte 4
        call BlackPalette
        push str_Pal3
        mov esi, str_WesternConference2
        push dword [byte ebp+07Eh]
        add esi, 1F2h
        call FindShape
        add esp, byte 8
        lea edx, [byte eax+010h]
        mov ecx, 0C0h
        lea edi, [dword eax+0202h]
        rep movsb
        mov eax, edx
        call SetScreenColors
        mov eax, 4
        call SoundSecondsToBytes
        call FillMusicStream
        push dword [byte ebp+03Ah]
        push dword [byte ebp+036h]
        push dword [byte ebp+032h]
        push dword [byte ebp+02Eh]
        push dword [byte ebp+02Ah]
        push dword [byte ebp+026h]
        push dword [byte ebp+022h]
        push dword [byte ebp+01Eh]
        push byte 4
        push byte 14h
        push dword 0A5h
        push byte 19h
        push edx
        call RemapScreenColors
        add esp, byte 34h
        push dword [byte ebp+022h]
        mov dword [byte ebp+076h], edx
        call FreeMemBlock
        add esp, byte 4
        mov eax, dword [byte ebp+076h]
        call SetScreenPalette
        push str_BKGD14
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        push byte 0
        push byte 58h
        push byte 50h
        xor edi, edi
        xor esi, esi
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [byte ebp+06Ah], eax
.4:
        push dword [byte ebp+06Ah]
        call SetDrawBitmap
        add esp, byte 4
        push byte 16h
        call ClearClipRect
        mov eax, 828Fh
        add esp, byte 4
        mov edx, dword [byte esi+ebp+01Eh]
        xor ecx, ecx
        xor ebx, ebx
        call DrawFrameAt
        push dword [byte esi+ebp+01Eh]
        call FreeMemBlock
        add esp, byte 4
        call SetScreenTarget
        mov eax, edi
        cdq
        LD sub, eax, edx
        sar eax, 1
        movsx eax, word [byte ebp+eax*2+056h]
        push eax
        mov eax, edi
        mov ebx, 2
        cdq
        idiv ebx
        movsx eax, word [byte ebp+edx*2+04Eh]
        push eax
        mov eax, dword [byte ebp+06Ah]
        add esi, byte 8
        push dword [byte eax+02Ch]
        inc edi
        call PutBlock
        add esp, byte 0Ch
        cmp edi, byte 4
        jl short .4
        push dword [byte ebp+06Ah]
        call FreeBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        add esp, byte 4
        shr eax, 1Bh
        call GetTeamNameArt
        mov edi, eax
        movsx eax, word [byte eax+06h]
        push byte 0
        add eax, byte 7Dh
        push eax
        push dword 0E0h
        call CreateBitmap
        mov esi, eax
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Ch], 30h
        movsx eax, word [byte edi+06h]
        add eax, byte 78h
        mov edx, 0B6h
        sar eax, 1
        sub edx, eax
        mov eax, dword [byte esi+02Ch]
        add esp, byte 0Ch
        mov word [byte eax+0Eh], dx
        push dword [byte esi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push esi
        call SetDrawBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        add esp, byte 4
        shl eax, 0Fh
        xor ecx, ecx
        shr eax, 1Bh
        xor ebx, ebx
        call LoadTeamLogo
        mov edx, eax
        mov eax, 0FD70h
        call DrawFrameAt
        mov ebx, 70h
        movsx eax, word [byte edi+04h]
        mov ecx, 7Dh
        sar eax, 1
        mov edx, edi
        sub ebx, eax
        mov eax, 0FD70h
        call DrawFrameAt
        call SetScreenTarget
        push dword [byte esi+02Ch]
        call PutBlockAtOwnPos
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        add esp, byte 4
        shr eax, 1Bh
        call GetTeamNameArt
        mov edi, eax
        mov eax, dword [byte esi+02Ch]
        mov word [byte eax+0Ch], 30h
        movsx eax, word [byte edi+06h]
        add eax, byte 78h
        mov edx, 158h
        sar eax, 1
        sub edx, eax
        mov eax, dword [byte esi+02Ch]
        mov word [byte eax+0Eh], dx
        push dword [byte esi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push esi
        call SetDrawBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        add esp, byte 4
        shl eax, 0Ah
        xor ecx, ecx
        shr eax, 1Bh
        xor ebx, ebx
        call LoadTeamLogo
        mov edx, eax
        mov eax, 0FD70h
        call DrawFrameAt
        mov ebx, 70h
        movsx eax, word [byte edi+04h]
        mov ecx, 7Dh
        sar eax, 1
        mov edx, edi
        sub ebx, eax
        mov eax, 0FD70h
        call DrawFrameAt
        call SetScreenTarget
        push dword [byte esi+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push esi
        call FreeBitmap
        add esp, byte 4
        lea eax, [byte ebp-04Ah]
        push eax
        call SaveTextState
        add esp, byte 4
        xor edi, edi
        push dword [FrontEndScreenBmp]
        xor esi, esi
        call TextSetFont
        add esp, byte 4
.5:
        mov eax, dword [byte esi+ebp+03Eh]
        movzx eax, byte [byte eax+01h]
        push eax
        push str_D2
        lea eax, [byte ebp-0Ah]
        push eax
        call sprintf_
        mov eax, edi
        cdq
        LD sub, eax, edx
        sar eax, 1
        lea ecx, [eax+eax]
        movzx ebx, byte [TextCharH]
        movsx eax, word [byte ecx+ebp+056h]
        inc ebx
        inc ebx
        add eax, byte 57h
        sub eax, ebx
        mov ebx, eax
        mov eax, edi
        mov dword [byte ebp+07Eh], 2
        cdq
        idiv dword [byte ebp+07Eh]
        add edx, edx
        movsx eax, word [byte edx+ebp+04Eh]
        mov dword [byte ebp+07Eh], edx
        lea edx, [byte eax+04Fh]
        add esp, byte 0Ch
        lea eax, [byte ebp-0Ah]
        call DrawColorTextRight
        mov eax, dword [byte esi+ebp+03Eh]
        lea edx, [byte eax+013h]
        push edx
        movsx eax, byte [byte eax+03h]
        push eax
        push str_CS3
        lea eax, [byte ebp-0Ah]
        push eax
        add esi, byte 4
        mov edx, dword [byte ebp+07Eh]
        call sprintf_
        lea eax, [byte ebp-0Ah]
        add esp, byte 10h
        movsx ebx, word [byte ecx+ebp+056h]
        movsx edx, word [byte edx+ebp+04Eh]
        add ebx, byte 5Dh
        add edx, byte 28h
        inc edi
        call DrawColorTextCentred
        cmp edi, byte 4
        jl near .5
        lea eax, [byte ebp-04Ah]
        push eax
        call SetDrawTarget
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        lea edi, [dword ebp-017Eh]
        and al, 1
        mov esi, TeamStatsBitmap
        or al, 6
        add esp, byte 4
        cwde
        mov ecx, 66h
        call OpenScreen
        rep movsb
        mov byte [dword ebp-013Ch], 0
        mov byte [dword ebp-013Ah], 0
        mov ecx, 66h
        lea edi, [dword ebp-0118h]
        mov esi, BottomBarArt+56h
        mov byte [dword ebp-0139h], 1
        mov byte [dword ebp-013Bh], 0
        rep movsb
        mov ax, word [SlotsTwoPlayer]
        mov byte [dword ebp-0D6h], 1
        xor ah, ah
        mov byte [dword ebp-0D4h], 0
        and al, 1
        mov byte [dword ebp-0D3h], 1
        cwde
        mov byte [dword ebp-0D5h], 1
        test eax, eax
        je short .6
        mov ecx, 66h
        lea edi, [dword ebp-0B2h]
        mov esi, MenuBoxStyle
        rep movsb
        mov byte [byte ebp-070h], 2
        mov byte [byte ebp-06Eh], 0
        mov byte [byte ebp-06Dh], 2
        mov byte [byte ebp-06Fh], 1
        mov byte [dword ebp-013Ch], 2
        mov byte [dword ebp-0D6h], 2
.6:
        mov edx, dword [dword ebp-0DAh]
        mov eax, dword [dword ebp-0DEh]
        mov ebx, 3
        call SetMenuMouse
        mov edx, dword [byte ebp+076h]
        xor eax, eax
        mov dword [byte ebp+05Ah], 1
        call FadePalette
        mov eax, 1
        call LinkSync
.7:
        call SoundIdle
        cmp dword [byte ebp+05Ah], byte 0
        jl short .9
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        inc eax
        inc eax
        cmp eax, dword [byte ebp+05Ah]
        jle short .9
        imul eax, dword [byte ebp+05Ah], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0144h]
        jne short .8
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0140h]
        je short .9
.8:
        mov dword [byte ebp+05Ah], 0FFFFFFFFh
.9:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        mov edx, eax
        or dl, 2
        movsx edx, dx
        push edx
        mov ebx, 0FFFFFFFFh
        xor ecx, ecx
        push byte 0
        lea edx, [byte ebp+05Ah]
        cwde
        push edx
        inc eax
        inc eax
        lea edx, [dword ebp-017Eh]
        call RunMenu
        cmp dword [byte ebp+05Ah], byte 1
        jb short .10
        jbe short .11
        cmp dword [byte ebp+05Ah], byte 2
        je short .12
        jmp short .13
.10:
        cmp dword [byte ebp+05Ah], byte 0
        jne short .13
        call SlideInSideBar
        mov dword [byte ebp+06Eh], 0FFFFFFF6h
        jmp short .13
.11:
        call SlideInTitleBar
        mov dword [byte ebp+06Eh], 1
        jmp short .13
.12:
        call SlideInBottomBar
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        mov ecx, 0FCh
        mov ebx, 0FAh
        push dword 0FEh
        mov edx, 0F7h
        mov eax, 1
        call ModemChat
.13:
        cmp dword [byte ebp+06Eh], byte 0
        je near .7
        push dword [byte ebp+05Eh]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 3
        call FadeOut
        call StopSpeech
        mov eax, dword [byte ebp+06Eh]
        jmp near PreGameMatchupScreen_4E6
jpt_87328:
        dd PreGameScreens_24
        dd PreGameScreens_44
        dd PreGameScreens_4B
        dd PreGameScreens_52
        dd PreGameScreens_59
;-----------------------------------------------------------------------------
; PreGameScreens                               8733C  96 PC, medium confidence
; After the controller screen: the 5 pre-game screens in turn (each returns
; -1 back / +1 on); 15h to play, 3 back
;-----------------------------------------------------------------------------
PreGameScreens:
        push edx
        mov edx, 1
        mov byte [AwayCardsSpeechPending], 1
        mov byte [CardsSpeechPending], 1
        mov byte [TeamsSpeechPending], 1
        mov byte [MatchupSpeechPending], 1
        jmp short PreGameScreens_24.2
PreGameScreens_24:
        call PreGameMatchupScreen
.1:
        add edx, eax
.2:
        test edx, edx
        jle short PreGameScreens_59.3
        cmp edx, byte 6
        jge short PreGameScreens_59.3
        lea eax, [byte edx-01h]
        cmp eax, byte 4
        ja short .2
        jmp dword [nosplit cs:eax*4+jpt_87328]
PreGameScreens_44:
        call PreGameTeamsScreen
        jmp short PreGameScreens_24.1
PreGameScreens_4B:
        call PreGameCardsA
        jmp short PreGameScreens_24.1
PreGameScreens_52:
        call PreGameCardsB
        jmp short PreGameScreens_24.1
PreGameScreens_59:
        call PreGameCardsC
        jmp short PreGameScreens_24.1
.3:
        test edx, edx
        jle short .4
        mov eax, 15h
        pop edx
        ret
.4:
        mov eax, 3
        pop edx
        ret
