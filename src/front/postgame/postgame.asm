; Post-game screens: the three stars and the game statistics (96 PC).
bits 32
%include "hockey.inc"
extern dword_1571B3
extern hmroster
extern BottomBarArt
section s_1456D progbits alloc exec nowrite align=1
extern awtmstruct, byte_11FA2F, TitleTextStyle, StatsFromGame, StarsSlideFrom, StarsSlideTo, StarsSlideTarget, StarsSpritePath
extern StarsNameX, StarsNameXs, StarsTextX, StarsTextXs, StarsTimerA, StarsTimerFace, StarsTimerName, StarsTimerCard
extern seasondb, dword_11F5C0, StarsBgBmp, StarsSaveBmp, StarsFaceBmps, StarsCardBmps, StarsPanelBmp, StarsNameBmps
extern StarsTitleBmp, StarsAnimStep, StarsCardBmp, StarsShapeFile, StarsSlideX, StarsSlideY, StarsSlideStep, pointerspr
extern FrontEndScreenBmp, MatchupLayer, MenuBoxStyle, gameopts, GetTicks, hmtmstruct
extern LinkSync, ModemChat, mousex, mousey, PutBlock, rand_, SetDrawBitmap, sprintf_
extern str_004, str_04d, str_AR005, str_AR015, str_AR105, str_AR115, str_Ard5, str_BALL7
extern str_BANNER, str_BKGD28, str_BT006, str_BT0110, str_BT028, str_BT108, str_BT118, str_BT124
extern str_Card5, str_D02d2, str_D20, str_DD, str_DD11, str_DDD, str_fmtSS, str_FSH7
extern str_METD, str_Pal25, str_PALS2, str_Plyr5, str_ProfileFsh5, str_SBACK, str_ST10, str_STDD
extern str_STRD, str_STRK, MessageBox, SelectDataLibrary, LoadPackedFile, PlayerDbRecord, OpenScreen, SlideInTitleBar
extern SlideInBottomBar, SetScreenColors, BlackPalette, FadePalette, FadeOut, CopyBitmap, SetTextColors, DrawColorTextRight
extern DrawColorTextCentred, SetScreenPalette, DrawFrameAt, RemapScreenColors, InitMenuItems, RunMenu, SetMenuMouse, PaEvent
extern StopSpeech, StopMusic, FillMusicStream, PlayMusic, FadeOutMusic, MusicDone, SoundSecondsToBytes, SoundIdle
extern GetLangText, PlayerStatsScreen, DrawShapeAtOwnPos, DrawArt, PutBlockAtOwnPos, AllocMemBlock, FreeMemBlock, CreateBitmap
extern ClearScreenColour, FreeBitmap, UnpackTo, DosFileInfo, LoadResourceDataShared, SetScreenTarget, FindShape, bcopy
extern ClearClipRect, TextSetFont, unk_144BD, unk_144C3, unk_144C9, str_N, unk_144ED, SlotsTwoPlayer
extern GameStatsLabelX, GameStatsTop, GameStatsRight, GameStatsColX, GameStatsLabelPos, GameStatsRowStep, GameStatsScroll, StarsCardX
extern StarsCardY, StarsShowFaces, StarsShowNames, StarsShowCards, StarsPhase, StarsCurrent, hmtmPwrGoals, hmtmPwrPlays
extern hmtmPPShots, hmtmPwrPlayTime, hmtmPenalties, hmtmPenMin, hmtmATOP, hmscore, hmtmSHGoals, hmtmFaceoffsWon
extern hmtmOneTimers, hmtmOneTimerGoals, hmtmBreakaways, hmtmBreakawayGoals, hmtmPenShots, hmtmPenShotGoals, hmtmChecks, hmpassatt
extern hmpasscmp, awtmPwrGoals, awtmPwrPlays, awtmPPShots, awtmPwrPlayTime, awtmPenalties, awtmPenMin, awtmATOP
extern awscore, awtmSHGoals, awtmFaceoffsWon, awtmOneTimers, awtmOneTimerGoals, awtmBreakaways, awtmBreakawayGoals, awtmPenShots
extern awtmPenShotGoals, awtmChecks, awpassatt, awpasscmp, StarPoints, starpl
global DrawGameStats, DrawGameStats_DD0, DrawGameStats_DD1, GameStatsScreen, GameStatsScreen_722, jpt_15A72, AnimateStarsScreen, AnimateStarsScreen_D3
global AnimateStarsScreen_E7, AnimateStarsScreen_114, AnimateStarsScreen_121, jpt_15E83, ThreeStarsScreen, ThreeStarsScreen_8CF, ThreeStarsScreen_91F, ThreeStarsScreen_928
global ThreeStarsScreen_936, PostGameScreens
;-----------------------------------------------------------------------------
; DrawGameStats                                1456D  96 PC, medium confidence
; Draws the team statistics page of the game stats screen: both teams' values
; from hmtmstruct / awtmstruct (counts, n/m, n/m (p%), time m:ss), labels
; from the text table (20Ch-215h)
;-----------------------------------------------------------------------------
DrawGameStats:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 20h, 0
        mov esi, eax
        push byte 0
        movsx eax, word [byte eax+06h]
        push eax
        movsx eax, word [byte esi+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov edi, eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push esi
        call PutBlock
        add esp, byte 0Ch
        mov edx, 0FEh
        mov eax, 0FCh
        call SetTextColors
        cmp word [GameStatsScroll], byte 0
        jne short .1
        mov eax, 20Ch
        mov ebx, 1
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmscore]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov ebx, 1
        call sprintf_
        lea eax, [byte ebp-020h]
        add esp, byte 0Ch
        movsx edx, word [GameStatsTop]
        call DrawColorTextCentred
        movsx eax, word [awscore]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov ebx, 1
        call sprintf_
        lea eax, [byte ebp-020h]
        add esp, byte 0Ch
        movsx edx, word [GameStatsRight]
        call DrawColorTextCentred
.1:
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 2
        jge near .2
        mov edx, 3
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        lea ebx, [byte edx+01h]
        mov eax, 20Dh
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmstruct]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 3
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsTop]
        call DrawColorTextCentred
        movsx eax, word [awtmstruct]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 3
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsRight]
        call DrawColorTextCentred
.2:
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 3
        jge near .7
        mov edx, 4
        sub edx, eax
        movsx eax, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelPos]
        sub eax, edx
        lea ebx, [byte eax+01h]
        mov eax, 20Eh
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx esi, word [hmtmstruct]
        movsx ebx, word [hmscore]
        test esi, esi
        jle short .3
        imul eax, ebx, dword 3E8h
        cdq
        idiv esi
        mov ecx, 0Ah
        cdq
        idiv ecx
        imul eax, ebx, byte 64h
        push edx
        cdq
        idiv esi
        push eax
        push str_DD11
        lea eax, [byte ebp-020h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .4
.3:
        mov eax, dword [str_004]
        mov dword [byte ebp-020h], eax
.4:
        mov edx, 4
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsTop]
        call DrawColorTextCentred
        movsx esi, word [awtmstruct]
        movsx ebx, word [awscore]
        test esi, esi
        jle short .5
        imul eax, ebx, dword 3E8h
        cdq
        idiv esi
        mov ecx, 0Ah
        cdq
        idiv ecx
        imul eax, ebx, byte 64h
        push edx
        cdq
        idiv esi
        push eax
        push str_DD11
        lea eax, [byte ebp-020h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .6
.5:
        mov eax, dword [str_004]
        mov dword [byte ebp-020h], eax
.6:
        mov edx, 4
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsRight]
        call DrawColorTextCentred
.7:
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 4
        jge near .8
        mov edx, 5
        sub edx, eax
        movsx ebx, word [GameStatsLabelPos]
        movsx eax, word [nosplit edx*2+GameStatsColX]
        sub eax, ebx
        lea ebx, [byte eax+01h]
        mov eax, 20Fh
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmOneTimers]
        push eax
        movsx eax, word [hmtmOneTimerGoals]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 5
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelPos]
        sub eax, edx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [GameStatsTop]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx eax, word [awtmOneTimers]
        push eax
        movsx eax, word [awtmOneTimerGoals]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 5
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx ebx, word [GameStatsLabelPos]
        movsx eax, word [nosplit edx*2+GameStatsColX]
        sub eax, ebx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [GameStatsRight]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
.8:
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 5
        jge near .9
        mov edx, 6
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx ebx, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelX]
        sub ebx, eax
        mov eax, 210h
        inc ebx
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmBreakaways]
        push eax
        movsx eax, word [hmtmBreakawayGoals]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 6
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx ebx, word [GameStatsLabelPos]
        movsx eax, word [nosplit edx*2+GameStatsColX]
        sub eax, ebx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [GameStatsTop]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx eax, word [awtmBreakaways]
        push eax
        movsx eax, word [awtmBreakawayGoals]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 6
        call sprintf_
        movsx eax, word [GameStatsScroll]
        add esp, byte 10h
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx ebx, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsRight]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
.9:
        cmp word [GameStatsScroll], byte 0
        jle near .10
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 6
        jge near .10
        mov edx, 7
        sub edx, eax
        movsx eax, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelPos]
        sub eax, edx
        lea ebx, [byte eax+01h]
        mov eax, 211h
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmPwrPlays]
        push eax
        movsx eax, word [hmtmPwrGoals]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 7
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx ebx, word [GameStatsLabelPos]
        movsx eax, word [nosplit edx*2+GameStatsColX]
        sub eax, ebx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [GameStatsTop]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx eax, word [awtmPwrPlays]
        push eax
        movsx eax, word [awtmPwrGoals]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 7
        call sprintf_
        movsx eax, word [GameStatsScroll]
        add esp, byte 10h
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx ebx, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsRight]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
.10:
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 1
        jle near .11
        cmp eax, byte 7
        jge near .11
        mov ebx, 8
        sub ebx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx ebx, word [nosplit ebx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelX]
        sub ebx, eax
        mov eax, 212h
        inc ebx
        call GetLangText
        call DrawColorTextCentred
        movsx esi, word [hmtmPwrPlayTime]
        mov eax, esi
        mov ebx, 3Ch
        cdq
        idiv ebx
        mov eax, esi
        push edx
        cdq
        idiv ebx
        push eax
        push str_D02d2
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 8
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        add esp, byte 10h
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsTop]
        call DrawColorTextCentred
        movsx esi, word [awtmPwrPlayTime]
        mov eax, esi
        mov ebx, 3Ch
        cdq
        idiv ebx
        mov eax, esi
        push edx
        cdq
        idiv ebx
        push eax
        push str_D02d2
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 8
        call sprintf_
        movsx eax, word [GameStatsScroll]
        add esp, byte 10h
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx ebx, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsRight]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
.11:
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 2
        jle near .12
        cmp eax, byte 8
        jge near .12
        mov edx, 9
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        lea ebx, [byte edx+01h]
        mov eax, 213h
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmPPShots]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 9
        call sprintf_
        movsx eax, word [GameStatsScroll]
        add esp, byte 0Ch
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx ebx, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsTop]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
        movsx eax, word [awtmPPShots]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 9
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsRight]
        call DrawColorTextCentred
.12:
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 3
        jle near .13
        cmp eax, byte 9
        jge near .13
        mov edx, 0Ah
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx ebx, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelX]
        sub ebx, eax
        mov eax, 214h
        inc ebx
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmPenMin]
        push eax
        movsx eax, word [hmtmPenalties]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Ah
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx ebx, word [GameStatsLabelPos]
        movsx eax, word [nosplit edx*2+GameStatsColX]
        sub eax, ebx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [GameStatsTop]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx eax, word [awtmPenMin]
        push eax
        movsx eax, word [awtmPenalties]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Ah
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelPos]
        sub eax, edx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [GameStatsRight]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
.13:
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 4
        jle near .14
        cmp eax, byte 0Ah
        jge near .14
        mov edx, 0Bh
        sub edx, eax
        movsx ebx, word [GameStatsLabelPos]
        movsx eax, word [nosplit edx*2+GameStatsColX]
        sub eax, ebx
        lea ebx, [byte eax+01h]
        mov eax, 215h
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmSHGoals]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Bh
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsTop]
        call DrawColorTextCentred
        movsx eax, word [awtmSHGoals]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Bh
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsRight]
        call DrawColorTextCentred
.14:
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 5
        jle near .19
        mov edx, 0Ch
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        lea ebx, [byte edx+01h]
        mov eax, 216h
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmPenShots]
        push eax
        movsx eax, word [hmtmPenShotGoals]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Ch
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        add esp, byte 10h
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsTop]
        call DrawColorTextCentred
        movsx eax, word [awtmPenShots]
        push eax
        movsx eax, word [awtmPenShotGoals]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Ch
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        add esp, byte 10h
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsRight]
        call DrawColorTextCentred
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 6
        jle near .19
        mov edx, 0Dh
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        lea ebx, [byte edx+01h]
        mov eax, 217h
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmFaceoffsWon]
        movsx esi, word [awtmFaceoffsWon]
        add esi, eax
        push esi
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Dh
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        add esp, byte 10h
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsTop]
        call DrawColorTextCentred
        push esi
        movsx eax, word [awtmFaceoffsWon]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Dh
        call sprintf_
        movsx eax, word [GameStatsScroll]
        add esp, byte 10h
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx ebx, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsRight]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 7
        jle near .19
        mov edx, 0Eh
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx ebx, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelX]
        sub ebx, eax
        mov eax, 218h
        inc ebx
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmChecks]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Eh
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsTop]
        call DrawColorTextCentred
        movsx eax, word [awtmChecks]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Eh
        call sprintf_
        movsx eax, word [GameStatsScroll]
        add esp, byte 0Ch
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx ebx, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsRight]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 8
        jle near .19
        mov edx, 0Fh
        sub edx, eax
        movsx eax, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelPos]
        sub eax, edx
        lea ebx, [byte eax+01h]
        mov eax, 219h
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx esi, word [hmtmATOP]
        mov eax, esi
        mov ebx, 3Ch
        cdq
        idiv ebx
        mov eax, esi
        push edx
        cdq
        idiv ebx
        push eax
        push str_D02d2
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Fh
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelPos]
        sub eax, edx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [GameStatsTop]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx esi, word [awtmATOP]
        mov eax, esi
        mov ebx, 3Ch
        cdq
        idiv ebx
        mov eax, esi
        push edx
        cdq
        idiv ebx
        push eax
        push str_D02d2
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Fh
        call sprintf_
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx ebx, word [GameStatsLabelPos]
        movsx eax, word [nosplit edx*2+GameStatsColX]
        sub eax, ebx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [GameStatsRight]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 0Ah
        jne near .19
        mov edx, 10h
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        lea ebx, [byte edx+01h]
        mov eax, 21Ah
        movsx edx, word [GameStatsLabelX]
        call GetLangText
        call DrawColorTextCentred
        movsx esi, word [hmpassatt]
        movsx ebx, word [hmpasscmp]
        test esi, esi
        jle short .15
        imul eax, ebx, byte 64h
        cdq
        idiv esi
        push eax
        jmp short .16
.15:
        push byte 0
.16:
        push esi
        push ebx
        push str_DDD
        lea eax, [byte ebp-020h]
        push eax
        call sprintf_
        add esp, byte 14h
        mov edx, 10h
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [GameStatsLabelPos]
        movsx edx, word [nosplit edx*2+GameStatsColX]
        sub edx, eax
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [GameStatsTop]
        call DrawColorTextCentred
        movsx esi, word [awpassatt]
        movsx ebx, word [awpasscmp]
        test esi, esi
        jle short .17
        imul eax, ebx, byte 64h
        cdq
        idiv esi
        push eax
        jmp short .18
.17:
        push byte 0
.18:
        push esi
        push ebx
        push str_DDD
        lea eax, [byte ebp-020h]
        push eax
        call sprintf_
        add esp, byte 14h
        mov edx, 10h
        movsx eax, word [GameStatsScroll]
        sub edx, eax
        movsx eax, word [nosplit edx*2+GameStatsColX]
        movsx edx, word [GameStatsLabelPos]
        sub eax, edx
        lea ebx, [byte eax+01h]
        movsx edx, word [GameStatsRight]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
.19:
        call SetScreenTarget
        movsx eax, word [GameStatsLabelPos]
        dec eax
        push eax
        push byte 0
        push dword [byte edi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push edi
        call FreeBitmap
        add esp, byte 4
DrawGameStats_DD0:
        leave
DrawGameStats_DD1:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GameStatsScreen                              15344  96 PC, medium confidence
; The game statistics screen (BKGD, BANNER, SBACK, page arrows AR00-AR11,
; puck cursor BALL): pages of DrawGameStats, mouse and pad, the modem chat
; box and sync on a modem game
;-----------------------------------------------------------------------------
GameStatsScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 244h, 0
        sub ebp, 82h
        mov eax, 3
        call SoundSecondsToBytes
        call FillMusicStream
        call SetScreenTarget
        push byte 0
        call ClearScreenColour
        add esp, byte 4
        mov eax, 0FEh
        xor edx, edx
        call LoadPackedFile
        push str_BKGD28
        push eax
        mov esi, eax
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        push esi
        call FreeMemBlock
        add esp, byte 4
        push byte 0
        push dword 0FE50h
        push str_BANNER
        call AllocMemBlock
        mov esi, dword [pointerspr]
        mov edi, eax
        movsd
        movsd
        movsd
        movsd
        movsb
        mov word [byte eax+04h], 0C0h
        mov word [byte eax+06h], 153h
        mov dword [byte ebp+07Eh], eax
        mov eax, dword [gameopts]
        add esp, byte 0Ch
        mov edi, dword [byte eax+01h]
        mov eax, 2
        shl edi, 0Fh
        call SoundSecondsToBytes
        shr edi, 1Bh
        call FillMusicStream
        mov eax, edi
        mov esi, 7
        cdq
        idiv esi
        add eax, 100h
        xor edx, edx
        call LoadPackedFile
        push edi
        push str_04d
        mov esi, eax
        lea eax, [byte ebp+056h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+056h]
        push eax
        push esi
        mov dword [byte ebp+06Eh], 0FFFFFFFFh
        call FindShape
        mov edi, eax
        add esp, byte 8
        push byte 10h
        push dword [byte ebp+07Eh]
        push eax
        call bcopy
        mov eax, dword [byte ebp+07Eh]
        add esp, byte 0Ch
        add eax, byte 10h
        push eax
        add edi, byte 10h
        push edi
        mov dword [byte ebp+066h], eax
        call UnpackTo
        add esp, byte 8
        push byte 46h
        push byte 24h
        mov eax, dword [byte ebp+07Eh]
        push eax
        and dword [eax], 0FFh
        call DrawArt
        add esp, byte 0Ch
        push esi
        call FreeMemBlock
        mov eax, dword [gameopts]
        add esp, byte 4
        mov esi, dword [byte eax+01h]
        mov eax, 2
        shl esi, 0Ah
        call SoundSecondsToBytes
        shr esi, 1Bh
        call FillMusicStream
        mov eax, esi
        mov edi, 7
        cdq
        idiv edi
        add eax, 100h
        xor edx, edx
        call LoadPackedFile
        push esi
        push str_04d
        mov edi, eax
        lea eax, [byte ebp+056h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+056h]
        push eax
        push edi
        call FindShape
        add esp, byte 8
        push byte 10h
        push dword [byte ebp+07Eh]
        push eax
        mov esi, eax
        call bcopy
        add esp, byte 0Ch
        push dword [byte ebp+066h]
        add esi, byte 10h
        push esi
        call UnpackTo
        add esp, byte 8
        push byte 46h
        push dword 19Dh
        mov eax, dword [byte ebp+07Eh]
        push eax
        and dword [eax], 0FFh
        call DrawArt
        add esp, byte 0Ch
        push edi
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+07Eh]
        call FreeMemBlock
        add esp, byte 4
        call BlackPalette
        mov eax, 2
        mov edx, 20h
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 2Fh
        call LoadPackedFile
        push eax
        mov dword [byte ebp+076h], eax
        call TextSetFont
        add esp, byte 4
        mov edx, 0FEh
        mov eax, 0FCh
        call SetTextColors
        mov eax, 0FFh
        xor edx, edx
        call LoadPackedFile
        push str_Pal25
        push eax
        mov dword [byte ebp+066h], eax
        mov dword [byte ebp+07Ah], eax
        call FindShape
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp+062h], eax
        call SetScreenColors
        movsx eax, word [GameStatsRowStep]
        movzx edx, byte [byte_11FA2F]
        add eax, edx
        movsx edx, word [GameStatsLabelPos]
        inc eax
        inc eax
        sub eax, edx
        mov edx, dword [dword_11F5C0]
        sub edx, byte 0Ah
        imul eax, edx
        push byte 0
        add eax, byte 10h
        push eax
        push str_SBACK
        call AllocMemBlock
        mov esi, dword [pointerspr]
        mov edi, eax
        movsd
        movsd
        movsd
        movsd
        movsb
        mov word [byte eax+0Ch], 0
        mov dx, word [GameStatsLabelPos]
        dec edx
        mov word [byte eax+0Eh], dx
        mov dx, word [dword_11F5C0]
        sub edx, byte 0Ah
        mov dword [byte ebp+06Ah], eax
        mov word [byte eax+04h], dx
        mov dword [byte ebp+072h], eax
        movzx ax, byte [byte_11FA2F]
        add ax, word [GameStatsRowStep]
        mov si, word [GameStatsLabelPos]
        inc eax
        inc eax
        mov edx, dword [byte ebp+06Ah]
        sub eax, esi
        add esp, byte 0Ch
        mov word [byte edx+06h], ax
        call SetScreenTarget
        push dword [byte ebp+06Ah]
        call DrawShapeAtOwnPos
        mov word [GameStatsScroll], 0
        add esp, byte 4
        mov eax, dword [byte ebp+06Ah]
        lea edx, [dword ebp-01C2h]
        call DrawGameStats
        mov eax, 3
        call InitMenuItems
        push str_AR005
        push dword [byte ebp+066h]
        call FindShape
        add esp, byte 8
        push str_AR015
        push dword [byte ebp+066h]
        mov dword [dword ebp-01A8h], eax
        call FindShape
        mov dword [dword ebp-01A4h], eax
        mov eax, dword [dword ebp-01A8h]
        mov dword [dword ebp-01B2h], 4
        movsx eax, word [byte eax+0Ch]
        mov dword [byte ebp-02Ah], eax
        mov eax, dword [dword ebp-01A8h]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp-026h], eax
        mov eax, dword [dword ebp-01A8h]
        mov edx, dword [byte ebp-02Ah]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [byte ebp-026h]
        mov dword [byte ebp-022h], edx
        mov dword [byte ebp-01Eh], eax
        mov eax, dword [dword ebp-01A8h]
        mov dword [byte ebp-01Ah], edx
        mov edx, dword [byte ebp-026h]
        movsx eax, word [byte eax+06h]
        add edx, eax
        mov eax, dword [byte ebp-02Ah]
        mov dword [byte ebp-012h], eax
        lea eax, [byte ebp-02Ah]
        mov dword [dword ebp-01AEh], eax
        mov eax, dword [dword ebp-01A8h]
        mov dword [byte ebp-016h], edx
        mov dword [byte ebp-0Eh], edx
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-019Ch], eax
        mov eax, dword [dword ebp-01A8h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0198h], eax
        mov eax, dword [dword ebp-01A8h]
        movsx eax, word [byte eax+04h]
        mov edx, dword [dword ebp-019Ch]
        sar eax, 1
        add esp, byte 8
        add edx, eax
        mov eax, dword [dword ebp-01A8h]
        mov dword [dword ebp-0188h], edx
        push str_AR105
        movsx eax, word [byte eax+06h]
        mov edx, dword [dword ebp-0198h]
        sar eax, 1
        push dword [byte ebp+066h]
        add edx, eax
        mov byte [dword ebp-017Fh], 1
        mov dword [dword ebp-0184h], edx
        call FindShape
        add esp, byte 8
        push str_AR115
        push dword [byte ebp+066h]
        mov dword [dword ebp-0142h], eax
        call FindShape
        mov dword [dword ebp-013Eh], eax
        mov eax, dword [dword ebp-0142h]
        mov dword [dword ebp-014Ch], 4
        movsx eax, word [byte eax+0Ch]
        mov dword [byte ebp+016h], eax
        mov eax, dword [dword ebp-0142h]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp+01Ah], eax
        mov eax, dword [dword ebp-0142h]
        mov edx, dword [byte ebp+016h]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [byte ebp+01Ah]
        mov dword [byte ebp+01Eh], edx
        mov dword [byte ebp+022h], eax
        mov eax, dword [dword ebp-0142h]
        mov dword [byte ebp+026h], edx
        mov edx, dword [byte ebp+01Ah]
        movsx eax, word [byte eax+06h]
        add edx, eax
        mov eax, dword [byte ebp+016h]
        mov dword [byte ebp+02Eh], eax
        lea eax, [byte ebp+016h]
        mov dword [dword ebp-0148h], eax
        mov eax, dword [dword ebp-0142h]
        mov dword [byte ebp+02Ah], edx
        mov dword [byte ebp+032h], edx
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-0136h], eax
        mov eax, dword [dword ebp-0142h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0132h], eax
        mov eax, dword [dword ebp-0142h]
        lea edi, [dword ebp-0F6h]
        movsx eax, word [byte eax+04h]
        mov edx, dword [dword ebp-0136h]
        sar eax, 1
        mov esi, BottomBarArt+56h
        add edx, eax
        mov eax, dword [dword ebp-0142h]
        mov dword [dword ebp-0122h], edx
        mov ecx, 66h
        movsx eax, word [byte eax+06h]
        mov edx, dword [dword ebp-0132h]
        sar eax, 1
        mov byte [dword ebp-011Ah], 0
        add edx, eax
        mov byte [dword ebp-0119h], 2
        mov dword [dword ebp-011Eh], edx
        rep movsb
        add esp, byte 8
        mov ax, word [SlotsTwoPlayer]
        mov byte [dword ebp-0B4h], 1
        xor ah, ah
        mov byte [dword ebp-0B2h], 2
        and al, 1
        mov byte [dword ebp-0B1h], 2
        cwde
        mov byte [dword ebp-0B3h], 2
        test eax, eax
        je short .1
        mov ecx, 66h
        lea edi, [dword ebp-090h]
        mov esi, MenuBoxStyle
        rep movsb
        mov byte [byte ebp-04Eh], 3
        mov byte [byte ebp-04Ch], 3
        mov byte [byte ebp-04Bh], 3
        mov byte [byte ebp-04Dh], 0
        mov byte [dword ebp-0180h], 3
.1:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        or al, 2
        cwde
        call OpenScreen
        mov edx, dword [dword ebp-0B8h]
        mov eax, dword [dword ebp-0BCh]
        call SetMenuMouse
        mov dword [byte ebp+05Eh], 2
        call MusicDone
        test eax, eax
        jne short .2
        call PlayMusic
.2:
        mov ebx, 3
        mov edx, dword [byte ebp+062h]
        xor eax, eax
        call FadePalette
        mov eax, 1
        call LinkSync
        push dword 0A0h
        push dword 264h
        push str_BALL7
        push dword [byte ebp+07Ah]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
.3:
        call SoundIdle
        cmp dword [byte ebp+05Eh], byte 0
        jl short .5
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        add eax, byte 3
        cmp eax, dword [byte ebp+05Eh]
        jle short .5
        imul eax, dword [byte ebp+05Eh], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0188h]
        jne short .4
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0184h]
        je short .5
.4:
        mov dword [byte ebp+05Eh], 0FFFFFFFFh
.5:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        mov edx, eax
        or dl, 2
        movsx edx, dx
        push edx
        mov ebx, 0FFFFFFFFh
        xor ecx, ecx
        push byte 2
        lea edx, [byte ebp+05Eh]
        cwde
        push edx
        add eax, byte 3
        lea edx, [dword ebp-01C2h]
        call RunMenu
        cmp dword [byte ebp+05Eh], byte 2
        jb short .6
        jbe near .9
        cmp dword [byte ebp+05Eh], byte 3
        je near .10
        jmp near .11
.6:
        cmp dword [byte ebp+05Eh], byte 0
        jne short .7
        cmp word [GameStatsScroll], byte 0
        jle short .7
        dec word [GameStatsScroll]
        jmp short .8
.7:
        cmp dword [byte ebp+05Eh], byte 1
        jne short .8
        movsx eax, word [GameStatsScroll]
        cmp eax, byte 0Ah
        jge short .8
        inc word [GameStatsScroll]
.8:
        mov eax, dword [byte ebp+072h]
        call DrawGameStats
        movsx eax, word [GameStatsScroll]
        imul eax, byte 0Fh
        add eax, 0A0h
        push eax
        push dword 264h
        push str_BALL7
        push dword [byte ebp+07Ah]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        jmp short .11
.9:
        call SlideInTitleBar
        mov dword [byte ebp+06Eh], 1
        jmp short .11
.10:
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
        push dword [byte ebp+076h]
        call TextSetFont
        add esp, byte 4
.11:
        cmp dword [byte ebp+06Eh], byte 0
        jl near .3
        push dword [byte ebp+072h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+07Ah]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+076h]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 3
        call FadeOut
GameStatsScreen_722:
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near DrawGameStats_DD1
jpt_15A72:
        dd AnimateStarsScreen_E7
        dd AnimateStarsScreen_E7
        dd AnimateStarsScreen_D3
        dd AnimateStarsScreen_114
        dd AnimateStarsScreen_121
        dd AnimateStarsScreen_114
        dd AnimateStarsScreen_D3
;-----------------------------------------------------------------------------
; AnimateStarsScreen                           15A8E  96 PC, medium confidence
; Timed effects of the three stars screen: the scrolling sprite strip, camera
; flashes at random spots of the crowd (three areas), random sparkles; called
; each frame
;-----------------------------------------------------------------------------
AnimateStarsScreen:
        push ebx
        push ecx
        push edx
        push esi
        call GetTicks
        cmp eax, dword [StarsTimerCard]
        jle near AnimateStarsScreen_121.14
        cmp word [StarsPhase], byte 0
        jne short .1
        movsx eax, word [StarsCurrent]
        inc eax
        mov ebx, 18h
        cdq
        idiv ebx
        movsx ebx, dx
        mov eax, ebx
        mov word [StarsCurrent], dx
        cdq
        shl edx, 3
        LD sbb, eax, edx
        sar eax, 3
        mov ecx, eax
        mov eax, ebx
        mov esi, 8
        cdq
        idiv esi
        shl ecx, 5
        mov eax, edx
        push dword [dword ecx+eax*4+StarsFaceBmps]
        call PutBlockAtOwnPos
        movsx eax, word [StarsCurrent]
        cdq
        idiv esi
        mov word [StarsPhase], 2
        add esp, byte 4
        cmp edx, byte 7
        jne short .2
        mov word [StarsPhase], 20h
        jmp short .2
.1:
        dec word [StarsPhase]
.2:
        cmp word [StarsShowFaces], byte 0
        je near AnimateStarsScreen_121.4
        push dword [StarsPanelBmp]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push dword [StarsTitleBmp]
        call PutBlock
        mov ax, word [StarsShowFaces]
        add esp, byte 0Ch
        cmp ax, 6
        ja short AnimateStarsScreen_E7
        movzx eax, ax
        jmp dword [nosplit cs:eax*4+jpt_15A72]
AnimateStarsScreen_D3:
        mov eax, 0FD70h
        mov edx, dword [StarsSlideStep]
.3:
        xor ecx, ecx
        xor ebx, ebx
        call DrawFrameAt
AnimateStarsScreen_E7:
        call SetScreenTarget
        push dword [StarsSaveBmp]
        mov eax, dword [StarsPanelBmp]
        push dword [StarsBgBmp]
        push dword [byte eax+02Ch]
        call PutBlock
        dec word [StarsShowFaces]
        add esp, byte 0Ch
        jmp near AnimateStarsScreen_121.13
AnimateStarsScreen_114:
        mov eax, 0FD70h
        mov edx, dword [StarsSlideY]
        jmp short AnimateStarsScreen_D3.3
AnimateStarsScreen_121:
        mov eax, 0FD70h
        mov edx, dword [StarsSlideX]
        jmp short AnimateStarsScreen_D3.3
.4:
        call GetTicks
        cmp eax, dword [StarsTimerA]
        jle near .5
        cmp word [StarsShowCards], byte 0
        jne near .5
        cmp word [StarsShowNames], byte 0
        jne near .5
        call rand_
        mov ebx, 3
        cdq
        idiv ebx
        mov ebx, edx
        shl ebx, 6
        mov esi, dword [dword ebx+StarsSlideTo]
        sub esi, dword [dword ebx+StarsSlideFrom]
        call rand_
        inc esi
        cdq
        idiv esi
        mov eax, dword [dword ebx+StarsSlideFrom]
        add eax, edx
        mov edx, dword [dword ebx+StarsSpritePath]
        sub edx, dword [dword ebx+StarsSlideTarget]
        mov dword [StarsBgBmp], eax
        lea esi, [byte edx+01h]
        call rand_
        cdq
        idiv esi
        mov eax, dword [dword ebx+StarsSlideTarget]
        add eax, edx
        mov dword [StarsSaveBmp], eax
        mov eax, dword [StarsPanelBmp]
        mov eax, dword [byte eax+02Ch]
        mov dx, word [StarsBgBmp]
        mov word [byte eax+0Ch], dx
        mov eax, dword [StarsPanelBmp]
        mov eax, dword [byte eax+02Ch]
        mov dx, word [StarsSaveBmp]
        mov word [byte eax+0Eh], dx
        mov eax, dword [StarsPanelBmp]
        push dword [byte eax+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push dword [StarsTitleBmp]
        call FreeMemBlock
        mov eax, dword [StarsPanelBmp]
        add esp, byte 4
        mov edx, 20h
        mov eax, dword [byte eax+02Ch]
        call CopyBitmap
        mov word [StarsShowFaces], 6
        mov dword [StarsTitleBmp], eax
        call GetTicks
        mov ecx, 46h
        mov ebx, eax
        call rand_
        cdq
        idiv ecx
        add ebx, byte 1Eh
        add ebx, edx
        mov dword [StarsTimerA], ebx
        jmp near .13
.5:
        cmp word [StarsShowNames], byte 0
        je near .8
        movsx eax, word [StarsShowNames]
        cmp eax, byte 5
        jge short .6
        push dword [StarsAnimStep]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [StarsAnimStep]
        call FreeMemBlock
        mov dword [StarsAnimStep], 0
        add esp, byte 4
.6:
        mov esi, 5
        movsx eax, word [StarsShowNames]
        sub esi, eax
        cmp eax, byte 1
        je short .7
        mov edx, 20h
        mov eax, dword [nosplit esi*4+StarsNameBmps]
        call CopyBitmap
        mov dword [StarsAnimStep], eax
        call SetScreenTarget
        push dword [StarsAnimStep]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push dword [nosplit esi*4+StarsNameBmps]
        call PutBlockAtOwnPos
        add esp, byte 4
.7:
        dec word [StarsShowNames]
        jmp near .13
.8:
        cmp word [StarsShowCards], byte 0
        jne short .9
        call GetTicks
        cmp eax, dword [StarsTimerName]
        jle short .9
        mov word [StarsShowNames], 5
        mov esi, 190h
        call GetTicks
        mov ebx, eax
        call rand_
        cdq
        idiv esi
        add ebx, 1F4h
        add ebx, edx
        mov dword [StarsTimerName], ebx
        jmp near .13
.9:
        cmp word [StarsShowCards], byte 0
        je near .12
        movsx eax, word [StarsShowCards]
        cmp eax, byte 2
        jne short .10
        call rand_
        mov ebx, 2
        cdq
        idiv ebx
        mov esi, edx
        shl esi, 3
        mov eax, dword [StarsShapeFile]
        mov dx, word [dword esi+StarsCardX]
        mov word [byte eax+0Ch], dx
        mov eax, dword [StarsShapeFile]
        mov dx, word [dword esi+StarsCardY]
        mov word [byte eax+0Eh], dx
        call SetScreenTarget
        push dword [StarsShapeFile]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push dword [dword esi+StarsCardY]
        push dword [dword esi+StarsCardX]
        push dword [StarsCardBmp]
        call DrawArt
        add esp, byte 0Ch
        jmp short .11
.10:
        push dword [StarsShapeFile]
        call PutBlockAtOwnPos
        add esp, byte 4
.11:
        dec word [StarsShowCards]
        jmp short .13
.12:
        call GetTicks
        cmp eax, dword [StarsTimerFace]
        jle short .13
        mov word [StarsShowCards], 2
        call GetTicks
        mov ecx, 1F4h
        mov ebx, eax
        call rand_
        cdq
        idiv ecx
        add ebx, 0C8h
        add ebx, edx
        mov dword [StarsTimerFace], ebx
.13:
        call GetTicks
        add eax, byte 4
        mov dword [StarsTimerCard], eax
.14:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
jpt_15E83:
        dd ThreeStarsScreen_8CF
        dd ThreeStarsScreen_91F
        dd ThreeStarsScreen_928
        dd ThreeStarsScreen_936
;-----------------------------------------------------------------------------
; ThreeStarsScreen                             15E93  96 PC, medium confidence
; Post-game three stars screen: loads the star players' profile photos
; (profile.fsh, card / plyr) and cards (ST/STR/MET/STRK), buttons BT00-BT12,
; animates with AnimateStarsScreen; returns the button: 1 game stats, 2 the
; next item, 0 done
;-----------------------------------------------------------------------------
ThreeStarsScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 2E4h, 0
        push eax
        sub ebp, 82h
        lea edi, [byte ebp+026h]
        mov esi, unk_144BD
        movsd
        movsw
        lea edi, [byte ebp+02Eh]
        mov esi, unk_144C3
        movsd
        movsw
        lea edi, [byte ebp+01Ah]
        mov esi, unk_144C9
        movsd
        movsd
        movsd
        lea edi, [byte ebp-0Ah]
        mov esi, str_N
        movsd
        movsd
        movsd
        movsd
        movsd
        movsd
        mov ecx, 20h
        lea edi, [dword ebp-0CAh]
        mov esi, unk_144ED
        mov dword [byte ebp+076h], 0FFFFFFFFh
        mov eax, 2
        rep movsd
        call SoundSecondsToBytes
        call FillMusicStream
        xor edi, edi
        xor esi, esi
.1:
        movsx edx, word [dword esi+StarPoints]
        imul edx, dword 4B4h
        movsx eax, word [dword esi+starpl]
        imul eax, byte 2Bh
        mov eax, dword [dword edx+eax+dword_1571B3]
        call PlayerDbRecord
        mov dword [byte esi+ebp+0Eh], eax
        mov edx, dword [seasondb]
        mov eax, dword [byte eax+02Ch]
        inc edi
        inc edi
        add eax, edx
        add esi, byte 4
        inc word [byte edi+eax+026h]
        cmp edi, byte 6
        jne short .1
        mov eax, 0FFFFFFF8h
        call SelectDataLibrary
        push byte 20h
        push dword 900h
        mov dword [byte ebp+06Ah], 0
        push str_PALS2
        mov dword [byte ebp+07Ah], 0
        mov dword [byte ebp+056h], 0
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [byte ebp-01Eh], eax
.2:
        mov eax, dword [byte ebp-01Eh]
        mov edx, dword [byte ebp+07Ah]
        add eax, dword [byte ebp+056h]
        push str_FSH7
        mov dword [byte edx+ebp-01Eh], eax
        lea eax, [byte ebp-04Ah]
        push eax
        mov esi, dword [byte ebp+06Ah]
        mov ecx, 4
        call sprintf_
        add esp, byte 8
        mov esi, dword [byte esi+ebp+0Eh]
        lea edi, [byte ebp-04Ah]
        add esi, byte 30h
        rep movsb
        lea eax, [byte ebp-04Ah]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        jne short .3
        push eax
        push str_ProfileFsh5
        call LoadResourceDataShared
        add esp, byte 8
        push str_Ard5
        mov edi, dword [byte ebp+07Ah]
        push eax
        mov dword [byte ebp+04Eh], eax
        mov dword [byte ebp+052h], eax
        call FindShape
        mov ecx, 300h
        add esp, byte 8
        lea esi, [byte eax+010h]
        mov edi, dword [byte edi+ebp-01Eh]
        rep movsb
        push str_Card5
        jmp short .4
.3:
        push byte 0
        lea eax, [byte ebp-04Ah]
        push eax
        call LoadResourceDataShared
        add esp, byte 8
        push str_Pal25
        mov edi, dword [byte ebp+07Ah]
        push eax
        mov dword [byte ebp+04Eh], eax
        mov dword [byte ebp+052h], eax
        call FindShape
        mov ecx, 300h
        add esp, byte 8
        lea esi, [byte eax+010h]
        mov edi, dword [byte edi+ebp-01Eh]
        rep movsb
        push str_Plyr5
.4:
        push dword [byte ebp+04Eh]
        call FindShape
        add esp, byte 8
        xor edx, edx
        call CopyBitmap
        mov edx, dword [byte ebp+07Ah]
        mov dword [byte edx+ebp-022h], eax
        push dword [byte ebp+052h]
        add dword [byte ebp+06Ah], byte 4
        add dword [byte ebp+07Ah], byte 8
        add dword [byte ebp+056h], 300h
        call FreeMemBlock
        add esp, byte 4
        cmp dword [byte ebp+06Ah], byte 0Ch
        jne near .2
        xor eax, eax
        call SelectDataLibrary
        mov eax, 4
        xor edx, edx
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 0B7h
        call LoadPackedFile
        push byte 0
        mov esi, eax
        mov dword [byte ebp+07Eh], eax
        call ClearScreenColour
        add esp, byte 4
        call BlackPalette
        push str_Pal25
        push esi
        call FindShape
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp+062h], eax
        call SetScreenColors
        mov eax, 4
        call SoundSecondsToBytes
        call FillMusicStream
        push dword [byte ebp-0Eh]
        push dword [byte ebp-012h]
        push dword [byte ebp-016h]
        push dword [byte ebp-01Ah]
        push dword [byte ebp-01Eh]
        push dword [byte ebp-022h]
        push byte 3
        push byte 14h
        push dword 0E5h
        push byte 7Eh
        push dword [byte ebp+062h]
        call RemapScreenColors
        add esp, byte 2Ch
        push dword [byte ebp-01Eh]
        call FreeMemBlock
        add esp, byte 4
        mov eax, dword [byte ebp+062h]
        call SetScreenPalette
        call SetScreenTarget
        push str_BKGD28
        push esi
        call FindShape
        add esp, byte 8
        push eax
        mov dword [byte ebp+066h], 0
        call PutBlockAtOwnPos
        mov edx, 0FEh
        add esp, byte 4
        mov eax, 0FCh
        xor edi, edi
        call SetTextColors
        push dword [FrontEndScreenBmp]
        xor esi, esi
        call TextSetFont
        add esp, byte 4
.5:
        push byte 0
        movsx eax, word [byte edi+ebp+02Eh]
        push eax
        movsx eax, word [byte edi+ebp+026h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte ebp+04Eh], eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 74h
        call ClearClipRect
        mov eax, dword [byte ebp+066h]
        add esp, byte 4
        mov edx, dword [byte esi+ebp-022h]
        xor ecx, ecx
        xor ebx, ebx
        mov eax, dword [byte eax+ebp+01Ah]
        call DrawFrameAt
        push dword [byte esi+ebp-022h]
        call FreeMemBlock
        add esp, byte 4
        call SetScreenTarget
        push dword [byte esi+ebp-06h]
        mov eax, dword [byte ebp+04Eh]
        push dword [byte esi+ebp-0Ah]
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [byte ebp+04Eh]
        call FreeBitmap
        mov eax, dword [byte ebp+066h]
        mov eax, dword [byte eax+ebp+0Eh]
        add esp, byte 4
        lea edx, [byte eax+013h]
        push edx
        add eax, byte 3
        push eax
        push str_fmtSS
        lea eax, [byte ebp-04Ah]
        push eax
        add esi, byte 8
        inc edi
        inc edi
        call sprintf_
        lea eax, [byte ebp-04Ah]
        add esp, byte 10h
        mov ebx, dword [dword esi+StarsNameXs]
        mov edx, dword [dword esi+StarsNameX]
        add dword [byte ebp+066h], byte 4
        call DrawColorTextRight
        cmp edi, byte 6
        jne near .5
        push str_ST10
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+072h], eax
        movsx edx, word [byte eax+06h]
        push byte 20h
        lea edx, [edx+edx*2]
        movsx eax, word [byte eax+04h]
        sar edx, 2
        lea eax, [eax+eax*2]
        push edx
        sar eax, 2
        mov dword [byte ebp+04Ah], 0
        push eax
        mov dword [byte ebp+05Eh], 0
        mov dword [byte ebp+05Ah], 0
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [byte ebp+042h], eax
.6:
        mov eax, dword [byte ebp+072h]
        movsx eax, word [byte eax+04h]
        mov edx, dword [byte ebp+05Ah]
        lea eax, [eax+eax*2]
        mov edx, dword [dword edx+StarsTextX]
        sar eax, 3
        sub edx, eax
        mov eax, dword [byte ebp+042h]
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp+072h]
        movsx eax, word [byte eax+06h]
        mov edx, dword [byte ebp+05Ah]
        lea eax, [eax+eax*2]
        mov edx, dword [dword edx+StarsTextXs]
        sar eax, 3
        sub edx, eax
        mov eax, dword [byte ebp+042h]
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Eh], dx
        call SetScreenTarget
        mov eax, dword [byte ebp+042h]
        push dword [byte eax+02Ch]
        call DrawShapeAtOwnPos
        mov eax, dword [byte ebp+042h]
        add esp, byte 4
        mov edx, 20h
        mov eax, dword [byte eax+02Ch]
        call CopyBitmap
        push dword [byte ebp+042h]
        mov dword [byte ebp+072h], eax
        call SetDrawBitmap
        mov edx, dword [byte ebp+04Ah]
        inc edx
        add esp, byte 4
        mov dword [byte ebp+03Eh], edx
        mov edx, dword [byte ebp+05Eh]
        xor eax, eax
        mov dword [byte ebp+03Ah], edx
        mov dword [byte ebp+06Eh], edx
.7:
        inc eax
        mov ebx, 8
        mov dword [byte ebp+04Eh], eax
        cdq
        idiv ebx
        push edx
        push dword [byte ebp+03Eh]
        push str_STDD
        lea eax, [byte ebp-04Ah]
        push eax
        call sprintf_
        add esp, byte 10h
        lea eax, [byte ebp-04Ah]
        push eax
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push byte 0
        push byte 0
        mov edx, dword [byte ebp+06Eh]
        push dword [byte ebp+072h]
        mov dword [dword edx+StarsFaceBmps], eax
        call PutBlock
        mov edx, dword [byte ebp+06Eh]
        mov eax, 0C000h
        add esp, byte 0Ch
        xor ecx, ecx
        xor ebx, ebx
        mov edx, dword [dword edx+StarsFaceBmps]
        mov esi, dword [byte ebp+042h]
        call DrawFrameAt
        mov esi, dword [byte esi+02Ch]
        movsx edx, word [byte esi+04h]
        movsx eax, word [byte esi+06h]
        imul eax, edx
        mov edi, dword [byte ebp+06Eh]
        mov edi, dword [dword edi+StarsFaceBmps]
        lea ecx, [byte eax+010h]
        rep movsb
        mov eax, dword [byte ebp+04Eh]
        add dword [byte ebp+06Eh], byte 4
        cmp eax, byte 8
        jl near .7
        push dword [byte ebp+072h]
        call FreeMemBlock
        add esp, byte 4
        call SetScreenTarget
        mov eax, dword [byte ebp+03Ah]
        add dword [byte ebp+05Eh], byte 20h
        add dword [byte ebp+05Ah], byte 8
        push dword [dword eax+StarsCardBmps]
        inc dword [byte ebp+04Ah]
        call PutBlockAtOwnPos
        add esp, byte 4
        cmp dword [byte ebp+04Ah], byte 3
        jl near .6
        mov word [StarsPhase], 8
        push dword [byte ebp+042h]
        mov word [StarsCurrent], 0
        call FreeBitmap
        xor edi, edi
        xor esi, esi
        add esp, byte 4
.8:
        push edi
        push str_STRD
        lea eax, [byte ebp-04Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-04Ah]
        push eax
        add esi, byte 4
        push dword [byte ebp+07Eh]
        inc edi
        call FindShape
        add esp, byte 8
        mov dword [dword esi+StarsShapeFile], eax
        cmp edi, byte 3
        jl short .8
        mov eax, dword [StarsSlideX]
        push byte 20h
        movsx edx, word [byte eax+06h]
        push edx
        movsx eax, word [byte eax+04h]
        push eax
        xor edi, edi
        call CreateBitmap
        mov edx, 20h
        mov dword [StarsPanelBmp], eax
        add esp, byte 0Ch
        mov eax, dword [byte eax+02Ch]
        xor esi, esi
        call CopyBitmap
        mov dword [StarsTitleBmp], eax
.9:
        push edi
        push str_METD
        lea eax, [byte ebp-04Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-04Ah]
        push eax
        add esi, byte 4
        push dword [byte ebp+07Eh]
        inc edi
        call FindShape
        add esp, byte 8
        mov dword [dword esi+StarsPanelBmp], eax
        cmp edi, byte 4
        jl short .9
        push str_STRK
        push dword [byte ebp+07Eh]
        mov dword [StarsAnimStep], 0
        call FindShape
        add esp, byte 8
        mov edx, 20h
        mov dword [StarsCardBmp], eax
        call CopyBitmap
        mov dword [StarsShapeFile], eax
        call GetTicks
        mov dword [StarsTimerCard], eax
        mov dword [StarsTimerFace], eax
        mov dword [StarsTimerA], eax
        call GetTicks
        mov ebx, 190h
        mov esi, eax
        call rand_
        cdq
        idiv ebx
        mov word [StarsShowCards], 0
        mov word [StarsShowNames], 0
        mov word [StarsShowFaces], 0
        add esi, 1F4h
        mov eax, 4
        add esi, edx
        lea edx, [dword ebp-0262h]
        mov dword [StarsTimerName], esi
        call InitMenuItems
        push str_BT006
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push str_BT0110
        push dword [byte ebp+07Eh]
        mov dword [dword ebp-0248h], eax
        call FindShape
        add esp, byte 8
        push str_BT028
        push dword [byte ebp+07Eh]
        mov dword [dword ebp-0244h], eax
        call FindShape
        mov dword [dword ebp-0240h], eax
        lea eax, [dword ebp-0CAh]
        mov dword [dword ebp-024Eh], eax
        mov eax, dword [dword ebp-0248h]
        mov dword [dword ebp-0252h], 8
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_BT108
        mov dword [dword ebp-023Ch], eax
        mov eax, dword [dword ebp-0248h]
        push dword [byte ebp+07Eh]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0228h], 159h
        mov dword [dword ebp-0224h], 168h
        mov byte [dword ebp-021Dh], 2
        mov byte [dword ebp-021Fh], 1
        mov dword [dword ebp-0238h], eax
        call FindShape
        add esp, byte 8
        push str_BT118
        push dword [byte ebp+07Eh]
        mov dword [dword ebp-01E2h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-01DEh], eax
        push str_BT124
        push dword [byte ebp+07Eh]
        call FindShape
        mov dword [dword ebp-01DAh], eax
        lea eax, [dword ebp-08Ah]
        mov dword [dword ebp-01E8h], eax
        mov eax, dword [dword ebp-01E2h]
        mov dword [dword ebp-01ECh], 8
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-01D6h], eax
        mov eax, dword [dword ebp-01E2h]
        lea edi, [dword ebp-0196h]
        mov esi, BottomBarArt+56h
        movsx eax, word [byte eax+0Eh]
        mov ecx, 66h
        mov dword [dword ebp-01D2h], eax
        mov ax, word [SlotsTwoPlayer]
        add esp, byte 8
        xor ah, ah
        mov dword [dword ebp-01C2h], 159h
        and al, 1
        mov dword [dword ebp-01BEh], 197h
        or al, 2
        mov byte [dword ebp-01BAh], 0
        cwde
        mov byte [dword ebp-01B7h], 2
        call OpenScreen
        rep movsb
        mov ax, word [SlotsTwoPlayer]
        mov byte [dword ebp-0154h], 2
        xor ah, ah
        mov byte [dword ebp-0152h], 1
        and al, 1
        mov byte [dword ebp-0151h], 2
        cwde
        mov byte [dword ebp-0153h], 2
        test eax, eax
        je short .10
        mov ecx, 66h
        lea edi, [dword ebp-0130h]
        mov esi, MenuBoxStyle
        rep movsb
        mov byte [dword ebp-0EEh], 3
        mov byte [dword ebp-0ECh], 3
        mov byte [dword ebp-0EBh], 3
        mov byte [dword ebp-0EDh], 2
        mov byte [dword ebp-0154h], 3
.10:
        mov edx, dword [dword ebp-0158h]
        mov eax, dword [dword ebp-015Ch]
        mov ebx, 3
        call SetMenuMouse
        mov edx, dword [byte ebp+062h]
        xor eax, eax
        mov dword [byte ebp+046h], 2
        call FadePalette
        mov eax, 1
        call LinkSync
        cmp dword [dword ebp-0266h], byte 0
        je short .11
        push dword 80h
        call PaEvent
        add esp, byte 4
.11:
        call SoundIdle
        cmp dword [byte ebp+046h], byte 0
        jl short .13
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        add eax, byte 3
        cmp eax, dword [byte ebp+046h]
        jle short .13
        imul eax, dword [byte ebp+046h], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0228h]
        jne short .12
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0224h]
        je short .13
.12:
        mov dword [byte ebp+046h], 0FFFFFFFFh
.13:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        mov edx, eax
        or dl, 2
        movsx edx, dx
        push edx
        mov ecx, AnimateStarsScreen
        mov ebx, 0FFFFFFFFh
        push byte 2
        lea edx, [byte ebp+046h]
        cwde
        push edx
        add eax, byte 3
        lea edx, [dword ebp-0262h]
        call RunMenu
        cmp dword [byte ebp+046h], byte 3
        ja near ThreeStarsScreen_936.15
        mov eax, dword [byte ebp+046h]
        jmp dword [nosplit cs:eax*4+jpt_15E83]
ThreeStarsScreen_8CF:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .14
        xor eax, eax
        call GetLangText
        push byte 3
        push byte 0
        push dword 0F0h
        mov ecx, TitleTextStyle
        push dword 140h
        lea ebx, [byte ebp+036h]
        mov dword [byte ebp+036h], eax
        push byte 0
        mov eax, 266h
        mov edx, 1
        call GetLangText
        call MessageBox
        jmp short ThreeStarsScreen_936.15
.14:
        mov dword [byte ebp+076h], 2
        jmp short ThreeStarsScreen_936.15
ThreeStarsScreen_91F:
        mov dword [byte ebp+076h], 1
        jmp short ThreeStarsScreen_936.15
ThreeStarsScreen_928:
        call SlideInTitleBar
        mov dword [byte ebp+076h], 0
        jmp short ThreeStarsScreen_936.15
ThreeStarsScreen_936:
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
.15:
        cmp dword [byte ebp+076h], byte 0
        jl near ThreeStarsScreen.11
        cmp dword [StarsAnimStep], byte 0
        je short .16
        push dword [StarsAnimStep]
        call FreeMemBlock
        add esp, byte 4
.16:
        push dword [StarsShapeFile]
        call FreeMemBlock
        add esp, byte 4
        push dword [StarsTitleBmp]
        call FreeMemBlock
        add esp, byte 4
        push dword [StarsPanelBmp]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp+07Eh]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 3
        call FadeOut
        call StopSpeech
        push dword [MatchupLayer]
        call TextSetFont
        mov eax, dword [byte ebp+076h]
        add esp, byte 4
        jmp near GameStatsScreen_722
;-----------------------------------------------------------------------------
; PostGameScreens                              16875  96 PC, medium confidence
; After a game: ThreeStarsScreen, then GameStatsScreen or the other screen
; (PlayerStatsScreen) as picked, until done; then the front-end music
;-----------------------------------------------------------------------------
PostGameScreens:
        push ebx
        push ecx
        push edx
        mov ebx, 1
.1:
        mov eax, ebx
        call ThreeStarsScreen
        mov ecx, eax
        xor ebx, ebx
        cmp eax, byte 1
        jne short .2
        call GameStatsScreen
        jmp short .4
.2:
        cmp eax, byte 2
        jne short .4
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        mov byte [StatsFromGame], 0
        shr eax, 1Bh
.3:
        cmp eax, 0A410h
        je short .4
        mov edx, 64h
        call PlayerStatsScreen
        jmp short .3
.4:
        test ecx, ecx
        jne short .1
        mov eax, 50h
        xor edx, edx
        call FadeOutMusic
        call StopMusic
        pop edx
        pop ecx
        pop ebx
        ret
