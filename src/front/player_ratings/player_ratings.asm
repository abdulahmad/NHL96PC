; The player ratings screen: pictures and rating bars (96 PC).
bits 32
%include "hockey.inc"
extern TeamScoringScore
section s_93E6A progbits alloc exec nowrite align=1
extern __CHP, SkaterRatingOrder, GoalieRatingOrder, PlayerPosCodes, RatingsPosCodes, DrawColorText, DrawColorTextCentred, DrawColorTextRight
extern DrawLeagueLogo, DrawScrollBar, RosterDbPtrs, RosterPlayerIds, SkaterCardTextIds, GoalieCardTextIds, SkaterRatingTextIds, GoalieRatingTextIds
extern SkaterCardFlash, GoalieCardFlash, SkaterFlashTime, GoalieFlashTime, SkaterCardPhoto, GoalieCardPhoto, SkaterPhotoLoaded, GoaliePhotoLoaded
extern RatingsGoalieShown, RatingsSkaterShown, TeamStatsBitmap, PlayerRecPtrs, PlayerHeightPtrs, PlayerWeightPtrs, RatingsPlayerId, RosterFirstNamePtrs
extern RosterJerseyPtrs, RosterPlayerPtrs, RosterProfilePtrs, RosterLastNamePtrs, BackgroundShapes, RatingsCardBmp, RatingsGoalieOrder, GoalieCardRemap
extern SkaterCardRemap, RatingsDimRemap, RatingsShownId, FadeOut, FadePalette, FillMusicStream, FillRect
extern FreeScrollBar, GetLangText, GetTicks, InitMenuItems, InitVScrollBar, PlayerRatingsChoiceJumpTable, LoadPackedFile, RatingsTabNames
extern OpenScreen, optflags, PutBlock, F64_2p54_DrawRatingsName, F64_0p454545_DrawRatingsName, RatingBar, RunMenu, ScrollBarDown
extern ScrollBarToMouse, ScrollBarUp, SetDrawBitmap, SetScreenColors, SetScrollBarPos, SetTextColors, SetTickDeadline, SlideCardLeft
extern SlideCardRight, SlideInSideBar, SoundSecondsToBytes, sprintf_, str_003, str_Ard3, str_BALL4, str_Ban2
extern str_Bkgd18, str_Card3, str_D11, str_DD10, str_DD9, str_DSS4, str_FSH5, str_HD012
extern str_HD023, str_NAV, str_Pal24, str_Plyr3, str_PROFILEFSH3, str_RAT02, str_S1, str_S1dg
extern str_S1dw, str_S1ug, str_S1up, str_S22, str_S2dg, str_S2dw, str_S2ug, str_S2up
extern str_S32, str_S3dg, str_S3dw, str_S3ug, str_S3up, str_SD5, str_TR00, str_TR01
extern str_TR02, str_TR0D, str_XTbl2, SelectDataLibrary, StatsDb5Record, StatsDb1Record, StatsDataBBRecord, StatsData4Record
extern StatsDb2Record, DrawArt, AllocMemBlock, FreeMemBlock, CreateBitmap, FreeBitmap, DosFileInfo, LoadResourceDataShared
extern DrawArtOpaqueAtOwnPos, SetScreenTarget, SetPaletteEntries, SetColourRemap, FindShape, TickDeadlinePassed, PlayerRatingsHotspots, PlayerRatingsTabHotspots
extern PlayerRatingsNavLinks
global PlayerRatingsScreen, PlayerRatingsScreen_E11, PlayerRatingsScreen_E3B, PlayerRatingsScreen_E44, PlayerRatingsScreen_E4D, PlayerRatingsScreen_E56, PlayerRatingsScreen_E5F, PlayerRatingsScreen_E68
global PlayerRatingsScreen_E71, GoalieRatingBarJumpTable, SkaterRatingBarJumpTable, DrawRatingBars, DrawRatingBars_2CA, DrawRatingBars_30B, DrawRatingBars_331, DrawRatingBars_38D
global DrawRatingBars_3B9, DrawRatingBars_3E5, DrawRatingBars_411, DrawRatingBars_43D, DrawRatingBars_469, DrawRatingBars_495, DrawRatingBars_4C1, DrawRatingBars_5E5
global DrawRatingBars_620, DrawRatingBars_640, DrawRatingBars_660, DrawRatingBars_680, DrawRatingBars_6A6, DrawRatingBars_6CC, DrawRatingBars_6F2, DrawRatingBars_718
global DrawRatingBars_73E, DrawRatingsTitle, DrawRatingsTitle_109, LoadRatingsPicture, SwitchRatingsCard, DrawRatingsList, DrawRatingsName, RosterHotspots
global RosterTabHotspots, RosterKeyTable, CreatePlayerHotspots, CreateSkaterNavLinks, CreateGoalieNavLinks
;-----------------------------------------------------------------------------
; PlayerRatingsScreen                          93E6A  96 PC, medium confidence
; The player ratings screen (X-tbl, RAT0, HD01 / HD02, ban2, BALL list): a
; player's picture and rating bars, from the stats menu and the roster
; screens
;-----------------------------------------------------------------------------
PlayerRatingsScreen:
        push esi
        push edi
        enter 1C30h, 0
        push eax
        push edx
        push ebx
        push ecx
        sub ebp, 82h
        mov ecx, 30h
        lea edi, [dword ebp-0276h]
        mov esi, PlayerRatingsHotspots
        rep movsd
        mov ecx, 20h
        lea edi, [dword ebp-096h]
        mov esi, PlayerRatingsTabHotspots
        rep movsd
        mov ecx, 48h
        lea edi, [dword ebp-0396h]
        mov esi, PlayerRatingsNavLinks
        rep movsd
        mov dword [RatingsGoalieShown], 0FFFFFFFFh
        mov dword [RatingsSkaterShown], 0FFFFFFFFh
        test ebx, ebx
        je short .1
        mov dword [RatingsPlayerId], 0
.1:
        mov dword [byte ebp+066h], 0
        mov dword [byte ebp+042h], 0
        xor edx, edx
        jmp short .4
.2:
        mov eax, dword [RosterPlayerIds]
        mov eax, dword [edx+eax]
        cmp eax, dword [RatingsPlayerId]
        jne short .3
        mov eax, dword [byte ebp+042h]
        mov dword [byte ebp+03Ah], eax
.3:
        inc dword [byte ebp+042h]
        add edx, byte 4
.4:
        mov eax, dword [byte ebp+042h]
        cmp eax, dword [dword ebp-01BB2h]
        jl short .2
        push byte 0
        push dword 100h
        push str_XTbl2
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 100h
        push str_XTbl2
        mov dword [SkaterCardRemap], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 100h
        push str_XTbl2
        mov dword [byte ebp+042h], 0
        mov dword [GoalieCardRemap], eax
        call AllocMemBlock
        mov dh, byte [byte ebp+042h]
        add dh, 82h
        add esp, byte 0Ch
        mov dl, byte [byte ebp+042h]
        mov dword [RatingsDimRemap], eax
        add dl, 1Eh
.5:
        cmp dword [byte ebp+042h], byte 64h
        jge short .6
        mov eax, dword [SkaterCardRemap]
        add eax, dword [byte ebp+042h]
        mov byte [eax], dl
        mov eax, dword [GoalieCardRemap]
        add eax, dword [byte ebp+042h]
        mov byte [eax], dh
.6:
        mov bl, byte [byte ebp+042h]
        mov eax, dword [RatingsDimRemap]
        inc dh
        add eax, dword [byte ebp+042h]
        inc dl
        inc dword [byte ebp+042h]
        mov byte [eax], bl
        cmp dword [byte ebp+042h], 100h
        jl short .5
        mov eax, dword [SkaterCardRemap]
        mov byte [dword eax+0FFh], 0FFh
        mov eax, dword [GoalieCardRemap]
        mov byte [dword eax+0FFh], 0FFh
        mov eax, dword [RatingsPlayerId]
        movsx eax, byte [dword eax+PlayerPosCodes]
        cmp eax, byte 47h
        sete al
        movzx eax, al
        lea edx, [dword ebp-0FAEh]
        mov dword [byte ebp+06Ah], eax
        mov eax, 12h
        call InitMenuItems
        push byte 0
        push dword 0F0h
        push dword 0DCh
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push byte 78h
        push byte 6Eh
        mov dword [byte ebp+056h], eax
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push byte 78h
        push dword 96h
        mov dword [byte ebp+052h], eax
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push dword 0B1h
        push dword 0A0h
        mov dword [byte ebp+04Eh], eax
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push dword 0B1h
        push dword 0A0h
        mov dword [RatingsCardBmp], eax
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push byte 3Ch
        push dword 0C8h
        mov dword [RatingsGoalieOrder], eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [byte ebp+04Ah], eax
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        cmp dword [dword ebp-01BBAh], byte 0
        je short .7
        mov eax, 13Ch
        jmp short .8
.7:
        mov eax, 138h
.8:
        xor edx, edx
        call LoadPackedFile
        mov dword [BackgroundShapes], eax
        push str_Bkgd18
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+042h], 0
        push str_Pal24
        mov dword [byte ebp+046h], 0
        xor edi, edi
        push dword [BackgroundShapes]
        mov dword [byte ebp+05Eh], eax
        call FindShape
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp+05Ah], eax
        mov dword [byte ebp+062h], eax
.9:
        mov eax, dword [byte ebp+046h]
        mov dword [byte ebp+03Eh], 0
        mov dword [byte ebp+072h], eax
        imul esi, dword [byte ebp+042h], byte 24h
.10:
        push dword [byte ebp+03Eh]
        mov eax, dword [byte ebp+072h]
        push dword [dword eax+RatingsTabNames]
        push str_SD5
        lea eax, [byte ebp+032h]
        push eax
        call sprintf_
        add esp, byte 10h
        push byte 0
        push str_RAT02
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_RAT02
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [dword esi+ebp-0882h], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_RAT02
        push dword [BackgroundShapes]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_RAT02
        push dword [BackgroundShapes]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd18
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0
        lea eax, [byte ebp+032h]
        push eax
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        add esi, byte 4
        inc dword [byte ebp+03Eh]
        call DrawArt
        add esp, byte 0Ch
        cmp dword [byte ebp+03Eh], byte 9
        jl near .10
        imul eax, dword [byte ebp+042h], byte 24h
        mov esi, dword [byte ebp+042h]
        xor edx, edx
        shl esi, 4
        mov ecx, eax
.11:
        mov ebx, edx
        shl ebx, 2
        cmp edx, byte 3
        je short .12
        add ebx, eax
        mov ebx, dword [dword ebx+ebp-086Ah]
        jmp short .13
.12:
        mov ebx, dword [dword eax+ebp-087Eh]
.13:
        mov ebx, dword [byte ebx+02Ch]
        mov dword [dword esi+ebp-0126h], ebx
        mov ebx, dword [dword ecx+ebp-087Ah]
        add esi, byte 4
        add ecx, byte 4
        mov ebx, dword [byte ebx+02Ch]
        inc edx
        mov dword [dword esi+ebp-01BAh], ebx
        cmp edx, byte 4
        jl short .11
        mov edx, dword [dword eax+ebp-0882h]
        add dword [byte ebp+046h], byte 4
        mov edx, dword [byte edx+02Ch]
        mov eax, dword [dword eax+ebp-087Eh]
        mov dword [byte edi+ebp-016h], edx
        add edi, byte 8
        mov eax, dword [byte eax+02Ch]
        inc dword [byte ebp+042h]
        mov dword [byte edi+ebp-01Ah], eax
        cmp dword [byte ebp+042h], byte 9
        jl near .9
        mov dword [byte ebp+042h], 0
        call SetScreenTarget
        mov al, byte [byte ebp+042h]
        mov ah, 7
        mul ah
        mov dl, al
        neg dl
        mov eax, dword [byte ebp+062h]
        add dl, 3Fh
        add eax, byte 42h
.14:
        mov byte [eax], 3Fh
        mov byte [byte eax+02h], 0
        inc dword [byte ebp+042h]
        mov byte [byte eax+01h], dl
        sub dl, 7
        add eax, byte 3
        cmp dword [byte ebp+042h], byte 8
        jl short .14
        mov eax, dword [byte ebp+062h]
        mov edx, dword [byte ebp+062h]
        add eax, byte 5Ah
        add edx, 2B2h
.15:
        mov byte [eax], 0
        inc eax
        cmp eax, edx
        jne short .15
        mov eax, dword [byte ebp+05Ah]
        call SetScreenColors
        push dword [byte ebp+05Eh]
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        cmp dword [dword ebp-01BB6h], 2AF7h
        jle short .16
        push str_HD012
        jmp short .17
.16:
        cmp dword [dword ebp-01BB6h], 3E7h
        jle short .18
        push str_HD023
.17:
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
.18:
        cmp dword [dword ebp-01BBEh], byte 0
        je short .19
        push str_Ban2
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
.19:
        mov eax, 4
        mov ecx, 1
        mov ebx, dword [byte ebp+05Ah]
        call OpenScreen
        xor edx, edx
        mov eax, dword [RatingsPlayerId]
        call LoadRatingsPicture
        cmp dword [dword ebp-01BBAh], byte 0
        je short .20
        mov ecx, 1
        mov eax, dword [RatingsPlayerId]
        mov ebx, dword [byte ebp+05Ah]
        add eax, byte 1Ch
        jmp short .21
.20:
        mov ecx, 1
        mov ebx, dword [byte ebp+05Ah]
        mov eax, dword [RatingsPlayerId]
.21:
        mov edx, ecx
        call LoadRatingsPicture
        push dword [SkaterCardRemap]
        call SetColourRemap
        mov edx, 0Ah
        mov ebx, dword [RatingsCardBmp]
        add esp, byte 4
        mov eax, dword [SkaterCardPhoto]
        xor ecx, ecx
        call SlideCardRight
        push dword [GoalieCardRemap]
        call SetColourRemap
        mov esi, dword [RatingsPlayerId]
        add esp, byte 4
        cmp dword [dword ebp-01BBAh], byte 0
        je short .22
        lea eax, [byte esi+01Ch]
        mov dword [RatingsPlayerId], eax
.22:
        mov edx, 0Ah
        mov ebx, dword [RatingsGoalieOrder]
        mov eax, dword [GoalieCardPhoto]
        xor ecx, ecx
        call SlideCardRight
        mov dword [SkaterCardFlash], 0
        mov dword [GoalieCardFlash], 0
        mov dword [RatingsPlayerId], esi
        call SetScreenTarget
        push byte 68h
        mov eax, dword [RatingsCardBmp]
        push byte 48h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push byte 68h
        mov eax, dword [RatingsGoalieOrder]
        push dword 190h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        cmp dword [dword ebp-01BBAh], byte 0
        je short .25
        mov dword [byte ebp+042h], 0
        jmp short .24
.23:
        inc dword [byte ebp+042h]
.24:
        cmp dword [byte ebp+042h], byte 1Ch
        jge short .26
        mov eax, dword [byte ebp+042h]
        movsx eax, byte [dword eax+PlayerPosCodes]
        cmp eax, byte 58h
        jne short .23
        jmp short .26
.25:
        mov eax, dword [dword ebp-01BB2h]
        mov dword [byte ebp+042h], eax
.26:
        push str_BALL4
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_S1
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd18
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 1
        mov ebx, dword [byte ebp+042h]
        push byte 0
        lea edx, [dword ebp-0E7Ch]
        lea eax, [dword ebp-04CEh]
        call InitVScrollBar
        cmp dword [dword ebp-01BBAh], byte 0
        je short .30
        mov dword [byte ebp+042h], 1Ch
        jmp short .28
.27:
        inc dword [byte ebp+042h]
.28:
        cmp dword [byte ebp+042h], byte 38h
        jge short .29
        mov eax, dword [byte ebp+042h]
        movsx eax, byte [dword eax+PlayerPosCodes]
        cmp eax, byte 58h
        jne short .27
.29:
        sub dword [byte ebp+042h], byte 1Ch
        jmp short .32
.30:
        mov dword [byte ebp+042h], 0
        xor eax, eax
.31:
        add eax, byte 4
        mov edx, dword [byte ebp+042h]
        inc dword [byte ebp+042h]
        mov dword [dword eax+ebp-01BB2h], edx
        cmp dword [byte ebp+042h], 2C4h
        jl short .31
        mov dword [byte ebp+042h], 2C4h
.32:
        push str_BALL4
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_S22
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd18
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 1
        mov ebx, dword [byte ebp+042h]
        push byte 0
        lea edx, [dword ebp-0C7Eh]
        lea eax, [dword ebp-073Eh]
        call InitVScrollBar
        push str_BALL4
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_S32
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd18
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 1
        mov ebx, dword [dword ebp-01BB2h]
        push byte 0
        lea edx, [dword ebp-0A80h]
        lea eax, [dword ebp-0606h]
        call InitVScrollBar
        lea ecx, [dword ebp-0FAEh]
        mov ebx, dword [byte ebp+066h]
        mov edx, dword [byte ebp+06Ah]
        lea eax, [dword ebp-0606h]
        call DrawRatingsList
        mov edx, dword [byte ebp+03Ah]
        lea eax, [dword ebp-04CEh]
        call SetScrollBarPos
        mov edx, dword [byte ebp+03Ah]
        mov eax, dword [RosterPlayerIds]
        mov edx, dword [eax+edx*4]
        lea eax, [dword ebp-073Eh]
        call SetScrollBarPos
        lea eax, [dword ebp-0276h]
        mov dword [dword ebp-0F9Eh], 8
        mov dword [dword ebp-0F9Ah], eax
        mov eax, dword [byte ebp-016h]
        push str_RAT02
        mov dword [dword ebp-0F94h], eax
        mov eax, dword [byte ebp-012h]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0F90h], eax
        call FindShape
        add esp, byte 8
        push str_RAT02
        movsx eax, word [byte eax+0Ch]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0F88h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0F84h], eax
        mov eax, dword [dword ebp-0F88h]
        add eax, byte 0Ah
        mov dword [dword ebp-0F74h], eax
        mov eax, dword [dword ebp-0F84h]
        add eax, byte 0Ah
        add esp, byte 8
        mov dword [dword ebp-0F70h], eax
        mov dword [dword ebp-0F38h], 6
        lea eax, [dword ebp-0236h]
        mov ecx, 66h
        lea edi, [dword ebp-0EE2h]
        mov esi, TeamStatsBitmap
        mov dword [dword ebp-0F34h], eax
        push str_S1up
        rep movsb
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push str_S1ug
        push dword [BackgroundShapes]
        mov dword [dword ebp-0E62h], eax
        call FindShape
        add esp, byte 8
        push str_S1up
        push dword [BackgroundShapes]
        mov dword [dword ebp-0E5Eh], eax
        call FindShape
        add esp, byte 8
        push str_S1up
        movsx eax, word [byte eax+0Ch]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0E56h], eax
        call FindShape
        add esp, byte 8
        push str_S1dw
        movsx eax, word [byte eax+0Eh]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0E52h], eax
        call FindShape
        add esp, byte 8
        push str_S1dg
        push dword [BackgroundShapes]
        mov dword [dword ebp-0D30h], eax
        call FindShape
        add esp, byte 8
        push str_S1dw
        push dword [BackgroundShapes]
        mov dword [dword ebp-0D2Ch], eax
        call FindShape
        add esp, byte 8
        push str_S1dw
        movsx eax, word [byte eax+0Ch]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0D24h], eax
        call FindShape
        add esp, byte 8
        push str_S2up
        movsx eax, word [byte eax+0Eh]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0D20h], eax
        call FindShape
        add esp, byte 8
        push str_S2ug
        push dword [BackgroundShapes]
        mov dword [dword ebp-0C64h], eax
        call FindShape
        add esp, byte 8
        push str_S2up
        push dword [BackgroundShapes]
        mov dword [dword ebp-0C60h], eax
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        mov dword [dword ebp-0C58h], eax
        push str_S2up
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push str_S2dw
        movsx eax, word [byte eax+0Eh]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0C54h], eax
        call FindShape
        add esp, byte 8
        push str_S2dg
        push dword [BackgroundShapes]
        mov dword [dword ebp-0B32h], eax
        call FindShape
        add esp, byte 8
        push str_S2dw
        push dword [BackgroundShapes]
        mov dword [dword ebp-0B2Eh], eax
        call FindShape
        add esp, byte 8
        push str_S2dw
        movsx eax, word [byte eax+0Ch]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0B26h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [dword ebp-0B22h], eax
        cmp dword [dword ebp-01BBAh], byte 0
        je near .33
        push str_TR00
        mov dword [dword ebp-0AD6h], 6
        lea eax, [dword ebp-096h]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0AD2h], eax
        call FindShape
        add esp, byte 8
        push str_TR01
        push dword [BackgroundShapes]
        mov dword [dword ebp-0ACCh], eax
        call FindShape
        add esp, byte 8
        push str_TR02
        push dword [BackgroundShapes]
        mov dword [dword ebp-0AC8h], eax
        call FindShape
        add esp, byte 8
        push str_TR00
        push dword [BackgroundShapes]
        mov dword [dword ebp-0AC4h], eax
        call FindShape
        add esp, byte 8
        push str_TR00
        movsx eax, word [byte eax+0Ch]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0AC0h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0ABCh], eax
        mov eax, dword [dword ebp-0AC0h]
        add eax, byte 1Eh
        mov dword [dword ebp-0AACh], eax
        mov eax, dword [dword ebp-0ABCh]
        add eax, byte 32h
        mov dword [dword ebp-0AA8h], eax
        lea eax, [byte ebp-056h]
        add esp, byte 8
        mov dword [dword ebp-0F9Ah], eax
.33:
        push str_S3up
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push str_S3ug
        push dword [BackgroundShapes]
        mov dword [dword ebp-0A66h], eax
        call FindShape
        add esp, byte 8
        push str_S3up
        push dword [BackgroundShapes]
        mov dword [dword ebp-0A62h], eax
        call FindShape
        add esp, byte 8
        push str_S3ug
        movsx eax, word [byte eax+0Ch]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0A5Ah], eax
        call FindShape
        add esp, byte 8
        push str_S3dw
        movsx eax, word [byte eax+0Eh]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0A56h], eax
        call FindShape
        add esp, byte 8
        push str_S3dg
        push dword [BackgroundShapes]
        mov dword [dword ebp-0934h], eax
        call FindShape
        add esp, byte 8
        push str_S3dw
        push dword [BackgroundShapes]
        mov dword [dword ebp-0930h], eax
        call FindShape
        add esp, byte 8
        push str_S3dw
        movsx eax, word [byte eax+0Ch]
        push dword [BackgroundShapes]
        mov dword [dword ebp-0928h], eax
        call FindShape
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [byte ebp+066h]
        mov ecx, dword [BackgroundShapes]
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push dword [byte ebp+052h]
        mov dword [dword ebp-0924h], eax
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingsTitle
        push dword [byte ebp+04Eh]
        mov eax, dword [dword ebp-04AAh]
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [RosterPlayerIds]
        push dword [BackgroundShapes]
        mov ecx, dword [edx+eax*4]
        push byte 0
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingBars
        push dword [byte ebp+04Eh]
        mov eax, dword [dword ebp-071Ah]
        push dword [BackgroundShapes]
        shl eax, 2
        push byte 1
        cmp dword [dword ebp-01BBAh], byte 0
        je short .34
        mov edx, dword [RosterPlayerIds]
        mov ecx, dword [byte edx+eax+070h]
        jmp short .35
.34:
        mov ecx, dword [dword eax+ebp-01BAEh]
.35:
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingBars
        mov eax, dword [dword ebp-04AAh]
        mov edx, dword [RosterPlayerIds]
        mov ebx, dword [byte ebp+04Ah]
        mov edx, dword [edx+eax*4]
        xor eax, eax
        call DrawRatingsName
        push dword 120h
        mov eax, dword [byte ebp+04Ah]
        push byte 32h
        push dword [byte eax+02Ch]
        call PutBlock
        mov ebx, dword [byte ebp+04Ah]
        mov eax, dword [dword ebp-071Ah]
        add esp, byte 0Ch
        shl eax, 2
        cmp dword [dword ebp-01BBAh], byte 0
        je short .36
        mov edx, dword [RosterPlayerIds]
        mov edx, dword [byte edx+eax+070h]
        jmp short .37
.36:
        mov edx, dword [dword eax+ebp-01BAEh]
.37:
        mov eax, 1
        call DrawRatingsName
        push dword 120h
        mov eax, dword [byte ebp+04Ah]
        push dword 18Bh
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        lea eax, [dword ebp-04CEh]
        call DrawScrollBar
        lea eax, [dword ebp-073Eh]
        xor esi, esi
        call DrawScrollBar
.38:
        cmp dword [dword esi+ebp-0F94h], byte 0
        je short .39
        push dword [dword esi+ebp-0F84h]
        push dword [dword esi+ebp-0F88h]
        push dword [dword esi+ebp-0F94h]
        call DrawArt
        add esp, byte 0Ch
.39:
        add esi, byte 66h
        cmp esi, 72Ch
        jne short .38
        mov ebx, 3
        mov edx, dword [byte ebp+05Ah]
        xor eax, eax
        call FadePalette
        lea eax, [dword ebp-0FAEh]
        lea edx, [dword ebp-0396h]
        lea ebx, [byte eax+042h]
        lea eax, [dword edx+0120h]
        mov dword [byte ebp+06Eh], 0FFFFFFFFh
        mov dword [byte ebp+07Ah], eax
.40:
        mov ecx, 4
        mov esi, edx
        mov edi, ebx
        rep movsb
        add edx, byte 10h
        add ebx, byte 66h
        cmp edx, dword [byte ebp+07Ah]
        jne short .40
        imul eax, dword [dword ebp-01BBAh], byte 1Ch
        mov dword [byte ebp+076h], eax
        jmp near PlayerRatingsScreen_E71.72
.41:
        cmp dword [byte ebp+06Eh], byte 3
        jb short .43
        cmp dword [byte ebp+06Eh], byte 6
        jbe near PlayerRatingsScreen_E71.55
        cmp dword [byte ebp+06Eh], byte 0Ch
        jb short .42
        jbe near PlayerRatingsScreen_E71.98
        cmp dword [byte ebp+06Eh], byte 10h
        jbe near PlayerRatingsScreen_E71.94
        jmp near PlayerRatingsScreen_E71.72
.42:
        cmp dword [byte ebp+06Eh], byte 8
        jb near PlayerRatingsScreen_E71.72
        jmp near PlayerRatingsScreen_E71.74
.43:
        cmp dword [byte ebp+06Eh], byte 0
        jbe short .44
        cmp dword [byte ebp+06Eh], byte 2
        je near PlayerRatingsScreen_E71.54
        jmp near PlayerRatingsScreen_E71.72
.44:
        mov edx, dword [dword ebp-04AAh]
        mov eax, dword [RosterDbPtrs]
        cmp dword [eax+edx*4], byte 0FFFFFFFFh
        je near PlayerRatingsScreen_E71.72
        mov eax, dword [dword ebp-071Ah]
        mov edx, dword [RosterDbPtrs]
        cmp dword [byte edx+eax*4+070h], byte 0FFFFFFFFh
        je near PlayerRatingsScreen_E71.72
        mov dword [byte ebp+042h], 0
        mov eax, dword [byte ebp+066h]
        mov esi, dword [byte ebp+042h]
        shl eax, 4
        shl esi, 2
        add esi, eax
        imul eax, byte 1
        lea edi, [byte eax+010h]
.45:
        call SetScreenTarget
        push str_RAT02
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_RAT02
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [dword esi+ebp-01B6h]
        call PutBlock
        add esp, byte 0Ch
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.46:
        call TickDeadlinePassed
        test eax, eax
        je short .46
        add esi, byte 4
        cmp esi, edi
        jne short .45
        cmp dword [byte ebp+066h], byte 8
        ja near PlayerRatingsScreen_E71.48
        mov eax, dword [byte ebp+066h]
        jmp dword [nosplit cs:eax*4+PlayerRatingsChoiceJumpTable]
PlayerRatingsScreen_E11:
        cmp dword [dword ebp-01BB6h], 2AF7h
        jg short PlayerRatingsScreen_E71
        cmp dword [dword ebp-01BB6h], 3E7h
        jle short .47
        mov dword [byte ebp+066h], 7
        jmp short PlayerRatingsScreen_E71.48
.47:
        mov dword [byte ebp+066h], 1
        jmp short PlayerRatingsScreen_E71.48
PlayerRatingsScreen_E3B:
        mov dword [byte ebp+066h], 2
        jmp short PlayerRatingsScreen_E71.48
PlayerRatingsScreen_E44:
        mov dword [byte ebp+066h], 3
        jmp short PlayerRatingsScreen_E71.48
PlayerRatingsScreen_E4D:
        mov dword [byte ebp+066h], 4
        jmp short PlayerRatingsScreen_E71.48
PlayerRatingsScreen_E56:
        mov dword [byte ebp+066h], 5
        jmp short PlayerRatingsScreen_E71.48
PlayerRatingsScreen_E5F:
        mov dword [byte ebp+066h], 6
        jmp short PlayerRatingsScreen_E71.48
PlayerRatingsScreen_E68:
        mov dword [byte ebp+066h], 0
        jmp short PlayerRatingsScreen_E71.48
PlayerRatingsScreen_E71:
        mov dword [byte ebp+066h], 8
.48:
        mov esi, dword [byte ebp+066h]
        mov eax, dword [byte ebp+esi*8-016h]
        mov dword [dword ebp-0F94h], eax
        mov eax, dword [byte ebp+esi*8-012h]
        shl esi, 4
        mov dword [dword ebp-0F90h], eax
        lea edi, [byte esi+010h]
.49:
        call SetScreenTarget
        push str_RAT02
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_RAT02
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [dword esi+ebp-0126h]
        call PutBlock
        add esp, byte 0Ch
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.50:
        call TickDeadlinePassed
        test eax, eax
        je short .50
        add esi, byte 4
        cmp esi, edi
        jne short .49
        lea ecx, [dword ebp-0FAEh]
        mov ebx, dword [byte ebp+066h]
        mov edx, dword [byte ebp+06Ah]
        lea eax, [dword ebp-0606h]
        call DrawRatingsList
.51:
        push dword [byte ebp+052h]
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        mov ecx, dword [BackgroundShapes]
        call DrawRatingsTitle
        push dword [byte ebp+04Eh]
        mov eax, dword [dword ebp-04AAh]
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [RosterPlayerIds]
        push dword [BackgroundShapes]
        mov ecx, dword [edx+eax*4]
        push byte 0
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingBars
        push dword [byte ebp+04Eh]
        mov eax, dword [dword ebp-071Ah]
        push dword [BackgroundShapes]
        shl eax, 2
        push byte 1
        cmp dword [dword ebp-01BBAh], byte 0
        je short .53
        mov edx, dword [RosterPlayerIds]
        mov ecx, dword [byte edx+eax+070h]
.52:
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingBars
        jmp near .72
.53:
        mov ecx, dword [dword eax+ebp-01BAEh]
        jmp short .52
.54:
        call SlideInSideBar
        jmp near .72
.55:
        mov edx, dword [dword ebp-04AAh]
        cmp dword [byte ebp+06Eh], byte 4
        jb short .56
        cmp dword [byte ebp+06Eh], byte 5
        jbe short .57
        cmp dword [byte ebp+06Eh], byte 6
        je short .58
        jmp short .59
.56:
        cmp dword [byte ebp+06Eh], byte 3
        jne short .59
        lea eax, [dword ebp-04CEh]
        call ScrollBarUp
        jmp short .59
.57:
        lea eax, [dword ebp-04CEh]
        call ScrollBarToMouse
        jmp short .59
.58:
        lea eax, [dword ebp-04CEh]
        call ScrollBarDown
.59:
        cmp dword [dword ebp-01BBAh], byte 0
        je short .61
        mov eax, dword [dword ebp-04AAh]
        movsx eax, byte [dword eax+PlayerPosCodes]
        cmp eax, byte 47h
        jne short .60
        mov dword [byte ebp+06Ah], 1
        jmp short .61
.60:
        mov dword [byte ebp+06Ah], 0
.61:
        cmp edx, dword [dword ebp-04AAh]
        je near .72
        mov eax, dword [dword ebp-04AAh]
        mov edx, dword [RosterDbPtrs]
        cmp dword [edx+eax*4], byte 0FFFFFFFFh
        jne short .62
        mov eax, dword [byte ebp-016h]
        mov dword [dword ebp-0F94h], eax
        mov eax, dword [byte ebp-012h]
        mov dword [byte ebp+066h], 0
        mov dword [dword ebp-0F90h], eax
.62:
        cmp dword [SkaterCardFlash], byte 0
        jne short .63
        mov dword [SkaterCardFlash], 1
        call GetTicks
        mov dword [SkaterFlashTime], eax
.63:
        cmp dword [SkaterCardFlash], byte 2
        jne short .64
        call GetTicks
        mov dword [SkaterFlashTime], eax
.64:
        cmp dword [SkaterCardFlash], byte 3
        jne short .67
        mov dword [SkaterCardFlash], 1
        call GetTicks
        mov esi, eax
        sub esi, dword [SkaterFlashTime]
        cmp esi, byte 1Eh
        jle short .65
        call GetTicks
        jmp short .66
.65:
        call GetTicks
        mov edx, 1Eh
        sub edx, esi
        sub eax, edx
.66:
        mov dword [SkaterFlashTime], eax
.67:
        mov eax, dword [dword ebp-04AAh]
        push dword [byte ebp+052h]
        mov edx, dword [RosterPlayerIds]
        mov ebx, dword [dword ebp-05E2h]
        mov ecx, dword [BackgroundShapes]
        mov eax, dword [edx+eax*4]
        mov edx, dword [byte ebp+066h]
        mov dword [RatingsShownId], eax
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingsTitle
        push dword [byte ebp+04Eh]
        mov eax, dword [dword ebp-04AAh]
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [RosterPlayerIds]
        push dword [BackgroundShapes]
        mov ecx, dword [edx+eax*4]
        push byte 0
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingBars
        push dword [byte ebp+04Eh]
        mov eax, dword [dword ebp-071Ah]
        push dword [BackgroundShapes]
        shl eax, 2
        push byte 1
        cmp dword [dword ebp-01BBAh], byte 0
        je short .68
        mov edx, dword [RosterPlayerIds]
        mov ecx, dword [byte edx+eax+070h]
        jmp short .69
.68:
        mov ecx, dword [dword eax+ebp-01BAEh]
.69:
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingBars
        lea ecx, [dword ebp-0FAEh]
        mov ebx, dword [byte ebp+066h]
        mov edx, dword [byte ebp+06Ah]
        lea eax, [dword ebp-0606h]
        call DrawRatingsList
        mov eax, dword [dword ebp-04AAh]
        mov edx, dword [RosterPlayerIds]
        mov ebx, dword [byte ebp+04Ah]
        mov edx, dword [edx+eax*4]
.70:
        xor eax, eax
        call DrawRatingsName
        push dword 120h
        mov eax, dword [byte ebp+04Ah]
        push byte 32h
.71:
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.72:
        cmp dword [byte ebp+06Eh], byte 2
        je near .103
        cmp dword [byte ebp+06Eh], byte 0Ch
        je near .103
        mov dword [byte ebp+06Eh], 0FFFFFFFFh
.73:
        cmp dword [byte ebp+06Eh], byte 0
        jge near PlayerRatingsScreen.41
        push byte 3
        lea eax, [byte ebp+06Eh]
        push byte 2
        mov ecx, SwitchRatingsCard
        mov ebx, 0FFFFFFFFh
        push eax
        lea edx, [dword ebp-0FAEh]
        mov eax, 12h
        call RunMenu
        jmp short .73
.74:
        mov edx, dword [dword ebp-071Ah]
        cmp dword [byte ebp+06Eh], byte 9
        jb short .75
        cmp dword [byte ebp+06Eh], byte 0Ah
        jbe short .76
        cmp dword [byte ebp+06Eh], byte 0Bh
        je short .77
        jmp short .78
.75:
        cmp dword [byte ebp+06Eh], byte 8
        jne short .78
        lea eax, [dword ebp-073Eh]
        call ScrollBarUp
        jmp short .78
.76:
        lea eax, [dword ebp-073Eh]
        call ScrollBarToMouse
        jmp short .78
.77:
        lea eax, [dword ebp-073Eh]
        call ScrollBarDown
.78:
        cmp edx, dword [dword ebp-071Ah]
        je near .72
        mov eax, dword [dword ebp-071Ah]
        mov edx, dword [RosterDbPtrs]
        cmp dword [byte edx+eax*4+070h], byte 0FFFFFFFFh
        jne short .80
        cmp dword [dword ebp-01BBEh], byte 0
        jne short .79
        cmp dword [dword ebp-01BBAh], byte 0
        je short .80
.79:
        mov eax, dword [byte ebp-016h]
        mov dword [dword ebp-0F94h], eax
        mov eax, dword [byte ebp-012h]
        mov dword [byte ebp+066h], 0
        mov dword [dword ebp-0F90h], eax
.80:
        cmp dword [dword ebp-01BBAh], byte 0
        je short .82
        mov eax, dword [dword ebp-071Ah]
        movsx eax, byte [dword eax+RatingsPosCodes]
        cmp eax, byte 47h
        jne short .81
        mov dword [byte ebp+06Ah], 1
        jmp short .82
.81:
        mov dword [byte ebp+06Ah], 0
.82:
        cmp dword [GoalieCardFlash], byte 0
        jne short .83
        mov dword [GoalieCardFlash], 1
        call GetTicks
        mov dword [GoalieFlashTime], eax
.83:
        cmp dword [GoalieCardFlash], byte 2
        jne short .84
        call GetTicks
        mov dword [GoalieFlashTime], eax
.84:
        cmp dword [GoalieCardFlash], byte 3
        jne short .87
        mov dword [GoalieCardFlash], 1
        call GetTicks
        mov esi, eax
        sub esi, dword [GoalieFlashTime]
        cmp esi, byte 1Eh
        jle short .85
        call GetTicks
        jmp short .86
.85:
        call GetTicks
        mov edx, 1Eh
        sub edx, esi
        sub eax, edx
.86:
        mov dword [GoalieFlashTime], eax
.87:
        mov eax, dword [dword ebp-071Ah]
        shl eax, 2
        cmp dword [dword ebp-01BBAh], byte 0
        je short .88
        mov edx, dword [RosterPlayerIds]
        mov eax, dword [byte edx+eax+070h]
        jmp short .89
.88:
        mov eax, dword [dword eax+ebp-01BAEh]
.89:
        push dword [byte ebp+052h]
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [byte ebp+066h]
        mov ecx, dword [BackgroundShapes]
        mov dword [TeamScoringScore-4], eax
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingsTitle
        push dword [byte ebp+04Eh]
        mov eax, dword [dword ebp-04AAh]
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [RosterPlayerIds]
        push dword [BackgroundShapes]
        mov ecx, dword [edx+eax*4]
        push byte 0
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingBars
        push dword [byte ebp+04Eh]
        mov eax, dword [dword ebp-071Ah]
        push dword [BackgroundShapes]
        shl eax, 2
        push byte 1
        cmp dword [dword ebp-01BBAh], byte 0
        je short .90
        mov edx, dword [RosterPlayerIds]
        mov ecx, dword [byte edx+eax+070h]
        jmp short .91
.90:
        mov ecx, dword [dword eax+ebp-01BAEh]
.91:
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingBars
        lea ecx, [dword ebp-0FAEh]
        mov ebx, dword [byte ebp+066h]
        mov edx, dword [byte ebp+06Ah]
        lea eax, [dword ebp-0606h]
        call DrawRatingsList
        mov eax, dword [dword ebp-071Ah]
        mov ebx, dword [byte ebp+04Ah]
        shl eax, 2
        cmp dword [dword ebp-01BBAh], byte 0
        je short .92
        mov edx, dword [RosterPlayerIds]
        mov edx, dword [byte edx+eax+070h]
        jmp short .93
.92:
        mov edx, dword [dword eax+ebp-01BAEh]
.93:
        mov eax, 1
        call DrawRatingsName
        push dword 120h
        mov eax, dword [byte ebp+04Ah]
        push dword 18Bh
        jmp near .71
.94:
        cmp dword [byte ebp+06Eh], byte 0Eh
        jb short .95
        cmp dword [byte ebp+06Eh], byte 0Fh
        jbe short .96
        cmp dword [byte ebp+06Eh], byte 10h
        je short .97
        jmp near .51
.95:
        cmp dword [byte ebp+06Eh], byte 0Dh
        jne near .51
        lea eax, [dword ebp-0606h]
        call ScrollBarUp
        jmp near .51
.96:
        lea eax, [dword ebp-0606h]
        call ScrollBarToMouse
        jmp near .51
.97:
        lea eax, [dword ebp-0606h]
        call ScrollBarDown
        jmp near .51
.98:
        mov dword [byte ebp+042h], 2
.99:
        push dword [byte ebp+042h]
        push str_TR0D
        lea eax, [byte ebp+032h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push str_TR00
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_TR00
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        lea eax, [byte ebp+032h]
        push eax
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.100:
        call TickDeadlinePassed
        test eax, eax
        je short .100
        inc dword [byte ebp+042h]
        cmp dword [byte ebp+042h], byte 9
        jl short .99
        mov eax, dword [dword ebp-04AAh]
        mov dword [SkaterCardFlash], 1
        mov dword [RatingsGoalieShown], eax
        mov eax, dword [dword ebp-071Ah]
        mov dword [GoalieCardFlash], 1
        mov dword [RatingsSkaterShown], eax
        call GetTicks
        mov edx, dword [RosterPlayerIds]
        mov dword [GoalieFlashTime], eax
        mov dword [SkaterFlashTime], eax
        mov eax, dword [dword ebp-04AAh]
        mov eax, dword [edx+eax*4]
        push dword [byte ebp+052h]
        mov dword [RatingsShownId], eax
        mov eax, dword [dword ebp-071Ah]
        mov ebx, dword [dword ebp-05E2h]
        mov ecx, dword [BackgroundShapes]
        mov eax, dword [byte edx+eax*4+070h]
        mov edx, dword [byte ebp+066h]
        mov dword [TeamScoringScore-4], eax
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingsTitle
        push dword [byte ebp+04Eh]
        mov eax, dword [dword ebp-04AAh]
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [RosterPlayerIds]
        push dword [BackgroundShapes]
        mov ecx, dword [edx+eax*4]
        push byte 0
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingBars
        push dword [byte ebp+04Eh]
        mov eax, dword [dword ebp-071Ah]
        push dword [BackgroundShapes]
        shl eax, 2
        push byte 1
        cmp dword [dword ebp-01BBAh], byte 0
        je short .101
        mov edx, dword [RosterPlayerIds]
        mov ecx, dword [byte edx+eax+070h]
        jmp short .102
.101:
        mov ecx, dword [dword eax+ebp-01BAEh]
.102:
        mov ebx, dword [dword ebp-05E2h]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+06Ah]
        call DrawRatingBars
        lea ecx, [dword ebp-0FAEh]
        mov ebx, dword [byte ebp+066h]
        mov edx, dword [byte ebp+06Ah]
        lea eax, [dword ebp-0606h]
        call DrawRatingsList
        mov edx, dword [dword ebp-071Ah]
        add edx, dword [byte ebp+076h]
        mov eax, dword [RosterPlayerIds]
        shl edx, 2
        mov ebx, dword [byte ebp+04Ah]
        mov edx, dword [edx+eax]
        mov eax, 1
        call DrawRatingsName
        push dword 120h
        mov eax, dword [byte ebp+04Ah]
        push dword 18Bh
        push dword [byte eax+02Ch]
        call PutBlock
        mov edx, dword [dword ebp-04AAh]
        mov eax, dword [RosterPlayerIds]
        mov ebx, dword [byte ebp+04Ah]
        add esp, byte 0Ch
        mov edx, dword [eax+edx*4]
        jmp near .70
.103:
        lea eax, [dword ebp-04CEh]
        call FreeScrollBar
        lea eax, [dword ebp-073Eh]
        call FreeScrollBar
        lea eax, [dword ebp-0606h]
        call FreeScrollBar
        cmp dword [SkaterPhotoLoaded], byte 0
        je short .104
        push dword [SkaterPhotoLoaded]
        call FreeMemBlock
        mov dword [SkaterPhotoLoaded], 0
        add esp, byte 4
.104:
        cmp dword [GoaliePhotoLoaded], byte 0
        je short .105
        push dword [GoaliePhotoLoaded]
        call FreeMemBlock
        mov dword [GoaliePhotoLoaded], 0
        add esp, byte 4
.105:
        push dword [SkaterCardRemap]
        call FreeMemBlock
        add esp, byte 4
        push dword [GoalieCardRemap]
        call FreeMemBlock
        add esp, byte 4
        push dword [RatingsDimRemap]
        call FreeMemBlock
        add esp, byte 4
        push dword [BackgroundShapes]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+052h]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp+056h]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp+04Eh]
        call FreeBitmap
        add esp, byte 4
        push dword [RatingsCardBmp]
        call FreeBitmap
        add esp, byte 4
        push dword [RatingsGoalieOrder]
        call FreeBitmap
        add esp, byte 4
        mov dword [byte ebp+042h], 0
        push dword [byte ebp+04Ah]
        mov edi, 24h
        call FreeBitmap
        add esp, byte 4
.106:
        mov dword [byte ebp+07Eh], edi
        imul esi, dword [byte ebp+042h], byte 24h
.107:
        push dword [dword esi+ebp-0882h]
        call FreeBitmap
        add esi, byte 4
        add esp, byte 4
        cmp esi, dword [byte ebp+07Eh]
        jne short .107
        inc dword [byte ebp+042h]
        add edi, byte 24h
        cmp dword [byte ebp+042h], byte 9
        jl short .106
        mov eax, 3
        call FadeOut
        mov eax, dword [dword ebp-04AAh]
        mov edx, dword [RosterPlayerIds]
        mov eax, dword [edx+eax*4]
        mov dword [RatingsPlayerId], eax
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        ret
GoalieRatingBarJumpTable:
        dd DrawRatingBars_2CA
        dd DrawRatingBars_30B
        dd DrawRatingBars_331
        dd DrawRatingBars_38D
        dd DrawRatingBars_3B9
        dd DrawRatingBars_3E5
        dd DrawRatingBars_411
        dd DrawRatingBars_43D
        dd DrawRatingBars_469
        dd DrawRatingBars_495
        dd DrawRatingBars_4C1
SkaterRatingBarJumpTable:
        dd DrawRatingBars_5E5
        dd DrawRatingBars_620
        dd DrawRatingBars_640
        dd DrawRatingBars_660
        dd DrawRatingBars_680
        dd DrawRatingBars_6A6
        dd DrawRatingBars_6CC
        dd DrawRatingBars_6F2
        dd DrawRatingBars_718
        dd DrawRatingBars_73E
;-----------------------------------------------------------------------------
; DrawRatingBars                                  9562B  96 PC, low confidence
; The player's rating bars (RatingBar) from his stats
;-----------------------------------------------------------------------------
DrawRatingBars:
        push esi
        push edi
        enter 38h, 0
        push eax
        mov esi, edx
        mov dword [byte ebp-010h], ebx
        mov dword [byte ebp-014h], ecx
        push dword [byte ebp+018h]
        mov dword [byte ebp-0Ch], 0
        call SetDrawBitmap
        add esp, byte 4
        cmp dword [byte ebp+010h], byte 0
        jne short .1
        push dword 0FFFFFEA4h
        push byte 0FFFFFFB0h
        jmp short .2
.1:
        push dword 0FFFFFEA4h
        push dword 0FFFFFE61h
.2:
        push str_Bkgd18
        push dword [byte ebp+014h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        cmp dword [byte ebp-03Ch], byte 0
        je short .3
        mov eax, dword [byte ebp-014h]
        movsx eax, byte [dword eax+PlayerPosCodes]
        cmp eax, byte 47h
        je short .4
.3:
        cmp dword [byte ebp-03Ch], byte 0
        jne near DrawRatingBars_73E.105
        mov eax, dword [byte ebp-014h]
        movsx eax, byte [dword eax+PlayerPosCodes]
        cmp eax, byte 47h
        je near DrawRatingBars_73E.105
.4:
        mov eax, dword [byte ebp-014h]
        shl eax, 2
        test esi, esi
        jne near .24
        mov edx, dword [byte ebp-014h]
        movsx edx, byte [dword edx+PlayerPosCodes]
        cmp edx, byte 47h
        je short .5
        mov edx, dword [RosterPlayerPtrs]
        mov eax, dword [edx+eax]
        call StatsDb2Record
        jmp short .6
.5:
        mov edx, dword [RosterPlayerPtrs]
        mov eax, dword [edx+eax]
        call StatsDb2Record
.6:
        mov edi, eax
        mov esi, dword [byte ebp-010h]
        lea eax, [byte esi+06h]
        mov dword [byte ebp-028h], eax
        jmp near .22
.7:
        push byte 16h
        mov edx, 64h
        movsx eax, byte [dword esi+GoalieRatingOrder]
.8:
        xor ecx, ecx
        xor ebx, ebx
        push byte 9
        movzx eax, byte [edi+eax]
        push dword 96h
.9:
        shl eax, 2
        push dword [byte ebp-0Ch]
        add eax, byte 28h
        jmp near .20
.10:
        cmp dword [byte ebp+010h], byte 0
        jne short .12
        cmp esi, byte 0Bh
        jne short .12
        push byte 16h
        push byte 9
        mov ebx, 1
        mov edx, 0Fh
        push dword 95h
        movsx eax, byte [dword esi+SkaterRatingOrder]
        xor ecx, ecx
.11:
        push dword [byte ebp-0Ch]
        movzx eax, byte [edi+eax]
        jmp near .20
.12:
        cmp dword [byte ebp+010h], byte 1
        jne short .13
        cmp esi, byte 0Bh
        jne short .13
        push byte 16h
        mov edx, 0Fh
        push byte 9
        movsx eax, byte [dword esi+SkaterRatingOrder]
        push dword 96h
        xor ecx, ecx
        xor ebx, ebx
        jmp short .11
.13:
        cmp dword [byte ebp+010h], byte 0
        jne short .14
        cmp esi, byte 0Dh
        je short .14
        push byte 16h
        mov ebx, 1
        mov edx, 64h
        movsx eax, byte [dword esi+SkaterRatingOrder]
        jmp near .23
.14:
        cmp esi, byte 0Dh
        je short .15
        push byte 16h
        mov edx, 64h
        movsx eax, byte [dword esi+SkaterRatingOrder]
        jmp near .8
.15:
        movsx eax, byte [dword esi+SkaterRatingOrder]
        movzx eax, byte [edi+eax]
        cmp eax, byte 6
        jle short .16
        sub eax, byte 7
.16:
        lea eax, [eax+eax*2]
        test eax, eax
        je short .17
        dec eax
.17:
        cmp eax, byte 0Fh
        jle short .18
        mov eax, 0Fh
.18:
        test eax, eax
        je short .21
        cmp dword [byte ebp+010h], byte 0
        jne short .19
        push byte 16h
        push byte 9
        push dword 95h
        mov ebx, 1
        mov edx, 0Fh
        push dword [byte ebp-0Ch]
        xor ecx, ecx
        jmp short .20
.19:
        push byte 16h
        push byte 9
        push dword 96h
        mov edx, 0Fh
        xor ecx, ecx
        push dword [byte ebp-0Ch]
        xor ebx, ebx
.20:
        call RatingBar
.21:
        add dword [byte ebp-0Ch], byte 14h
        inc esi
.22:
        cmp esi, dword [byte ebp-028h]
        jge near DrawRatingBars_73E.105
        mov eax, dword [byte ebp-014h]
        movsx eax, byte [dword eax+PlayerPosCodes]
        cmp eax, byte 47h
        jne near .10
        cmp dword [byte ebp+010h], byte 0
        jne near .7
        push byte 16h
        mov ebx, 1
        mov edx, 64h
        movsx eax, byte [dword esi+GoalieRatingOrder]
.23:
        xor ecx, ecx
        push byte 9
        movzx eax, byte [edi+eax]
        push dword 95h
        jmp near .9
.24:
        mov edx, dword [byte ebp-014h]
        movsx edx, byte [dword edx+PlayerPosCodes]
        cmp edx, byte 47h
        jne near DrawRatingBars_4C1.64
        cmp esi, byte 3
        jb short .25
        cmp esi, byte 4
        jbe short .26
        cmp esi, byte 6
        jbe short .28
        cmp esi, byte 8
        jbe short .29
        jmp short .31
.25:
        cmp esi, byte 1
        jb short .31
        jmp short .27
.26:
        mov edx, dword [RosterDbPtrs]
        mov eax, dword [edx+eax]
        call StatsDataBBRecord
        jmp short .30
.27:
        mov edx, dword [RosterDbPtrs]
        mov eax, dword [edx+eax]
        call StatsDb1Record
        jmp short .30
.28:
        mov edx, dword [RosterDbPtrs]
        mov eax, dword [edx+eax]
        call StatsData4Record
        jmp short .30
.29:
        mov edx, dword [RosterDbPtrs]
        mov eax, dword [edx+eax]
        call StatsDb5Record
.30:
        mov dword [byte ebp-08h], eax
.31:
        mov eax, dword [byte ebp-010h]
        mov edi, dword [byte ebp-010h]
        mov dword [byte ebp-018h], eax
        add eax, byte 6
        shl edi, 2
        mov dword [byte ebp-024h], eax
        jmp near DrawRatingBars_4C1.63
DrawRatingBars_2CA:
        cmp esi, byte 3
        je short .32
        cmp esi, byte 1
        je short .32
        cmp esi, byte 5
        je short .32
        cmp esi, byte 7
        jne short .35
.32:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [eax]
.33:
        push eax
        push str_D11
.34:
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near DrawRatingBars_4C1.60
.35:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+016h]
.36:
        push eax
        mov eax, str_D11
        push eax
        jmp short .34
DrawRatingBars_30B:
        cmp esi, byte 3
        je short .37
        cmp esi, byte 1
        je short .37
        cmp esi, byte 5
        je short .37
        cmp esi, byte 7
        jne short .38
.37:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+0Ch]
        jmp short DrawRatingBars_2CA.33
.38:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+022h]
        jmp short DrawRatingBars_2CA.36
DrawRatingBars_331:
        cmp esi, byte 3
        je short .39
        cmp esi, byte 1
        je short .39
        cmp esi, byte 5
        je short .39
        cmp esi, byte 7
        jne short .40
.39:
        mov ecx, dword [byte ebp-08h]
        movzx ecx, word [byte ecx+010h]
        mov eax, ecx
        mov ebx, 64h
        cdq
        idiv ebx
        mov eax, ecx
        push edx
        cdq
        idiv ebx
        push eax
        push str_DD9
        jmp near DrawRatingBars_4C1.57
.40:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+026h]
        mov ebx, 64h
        cdq
        idiv ebx
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+026h]
        push edx
        cdq
        idiv ebx
        push eax
        mov eax, str_DD9
        push eax
        jmp near DrawRatingBars_4C1.57
DrawRatingBars_38D:
        cmp esi, byte 3
        je short .41
        cmp esi, byte 1
        je short .41
        cmp esi, byte 5
        je short .41
        cmp esi, byte 7
        jne short .42
.41:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+02h]
        jmp near DrawRatingBars_2CA.33
.42:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+018h]
        jmp near DrawRatingBars_2CA.36
DrawRatingBars_3B9:
        cmp esi, byte 3
        je short .43
        cmp esi, byte 1
        je short .43
        cmp esi, byte 5
        je short .43
        cmp esi, byte 7
        jne short .44
.43:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+04h]
        jmp near DrawRatingBars_2CA.33
.44:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+01Ah]
        jmp near DrawRatingBars_2CA.36
DrawRatingBars_3E5:
        cmp esi, byte 3
        je short .45
        cmp esi, byte 1
        je short .45
        cmp esi, byte 5
        je short .45
        cmp esi, byte 7
        jne short .46
.45:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+06h]
        jmp near DrawRatingBars_2CA.33
.46:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+01Ch]
        jmp near DrawRatingBars_2CA.36
DrawRatingBars_411:
        cmp esi, byte 3
        je short .47
        cmp esi, byte 1
        je short .47
        cmp esi, byte 5
        je short .47
        cmp esi, byte 7
        jne short .48
.47:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+0Ah]
        jmp near DrawRatingBars_2CA.33
.48:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+020h]
        jmp near DrawRatingBars_2CA.33
DrawRatingBars_43D:
        cmp esi, byte 3
        je short .49
        cmp esi, byte 1
        je short .49
        cmp esi, byte 5
        je short .49
        cmp esi, byte 7
        jne short .50
.49:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+08h]
        jmp near DrawRatingBars_2CA.33
.50:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+01Eh]
        jmp near DrawRatingBars_2CA.33
DrawRatingBars_469:
        cmp esi, byte 3
        je short .51
        cmp esi, byte 1
        je short .51
        cmp esi, byte 5
        je short .51
        cmp esi, byte 7
        jne short .52
.51:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+0Eh]
        jmp near DrawRatingBars_2CA.33
.52:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+024h]
        jmp near DrawRatingBars_2CA.33
DrawRatingBars_495:
        cmp esi, byte 3
        je short .53
        cmp esi, byte 1
        je short .53
        cmp esi, byte 5
        je short .53
        cmp esi, byte 7
        jne short .54
.53:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+012h]
        jmp near DrawRatingBars_2CA.33
.54:
        mov eax, dword [byte ebp-08h]
        movzx eax, word [byte eax+028h]
        jmp near DrawRatingBars_2CA.33
DrawRatingBars_4C1:
        cmp esi, byte 3
        je short .55
        cmp esi, byte 1
        je short .55
        cmp esi, byte 5
        je short .55
        cmp esi, byte 7
        jne short .58
.55:
        mov ecx, dword [byte ebp-08h]
        movzx ecx, word [byte ecx+014h]
.56:
        mov eax, ecx
        mov ebx, 0Ah
        cdq
        idiv ebx
        mov eax, ecx
        push edx
        cdq
        idiv ebx
        push eax
        push str_DD10
.57:
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .60
.58:
        mov ecx, dword [byte ebp-08h]
        movzx ecx, word [byte ecx+02Ah]
        jmp short .56
.59:
        push str_NAV
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        add esp, byte 8
.60:
        cmp dword [byte ebp+010h], byte 0
        jne short .61
        mov ebx, dword [byte ebp-0Ch]
        mov edx, 96h
        lea eax, [byte ebp-038h]
        call DrawColorTextRight
        jmp short .62
.61:
        mov ebx, dword [byte ebp-0Ch]
        lea eax, [byte ebp-038h]
        xor edx, edx
        call DrawColorText
.62:
        add dword [byte ebp-0Ch], byte 14h
        inc dword [byte ebp-018h]
        add edi, byte 4
.63:
        mov eax, dword [byte ebp-018h]
        cmp eax, dword [byte ebp-024h]
        jge near DrawRatingBars_73E.105
        cmp eax, byte 0Ah
        ja short .59
        jmp dword [dword cs:edi+GoalieRatingBarJumpTable]
.64:
        cmp esi, byte 3
        jb short .65
        cmp esi, byte 4
        jbe short .66
        cmp esi, byte 6
        jbe short .68
        cmp esi, byte 8
        jbe short .69
        jmp short .71
.65:
        cmp esi, byte 1
        jb short .71
        jmp short .67
.66:
        mov edx, dword [RosterDbPtrs]
        mov eax, dword [edx+eax]
        call StatsDataBBRecord
        jmp short .70
.67:
        mov edx, dword [RosterDbPtrs]
        mov eax, dword [edx+eax]
        call StatsDb1Record
        jmp short .70
.68:
        mov edx, dword [RosterDbPtrs]
        mov eax, dword [edx+eax]
        call StatsData4Record
        jmp short .70
.69:
        mov edx, dword [RosterDbPtrs]
        mov eax, dword [edx+eax]
        call StatsDb5Record
.70:
        mov edi, eax
.71:
        mov eax, dword [byte ebp-010h]
        mov ecx, dword [byte ebp-010h]
        mov dword [byte ebp-01Ch], eax
        add eax, byte 6
        shl ecx, 2
        mov dword [byte ebp-020h], eax
        jmp near DrawRatingBars_73E.104
.72:
        cmp eax, byte 9
        ja near DrawRatingBars_73E.99
        jmp dword [dword cs:ecx+SkaterRatingBarJumpTable]
DrawRatingBars_5E5:
        cmp esi, byte 3
        je short .73
        cmp esi, byte 1
        je short .73
        cmp esi, byte 5
        je short .73
        cmp esi, byte 7
        jne short .76
.73:
        movzx eax, word [edi]
.74:
        push eax
        push str_D11
.75:
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near DrawRatingBars_73E.101
.76:
        movzx eax, word [byte edi+012h]
.77:
        push eax
        mov eax, str_D11
        push eax
        jmp short .75
DrawRatingBars_620:
        cmp esi, byte 3
        je short .78
        cmp esi, byte 1
        je short .78
        cmp esi, byte 5
        je short .78
        cmp esi, byte 7
        jne short .79
.78:
        movzx eax, word [byte edi+02h]
        jmp short DrawRatingBars_5E5.74
.79:
        movzx eax, word [byte edi+014h]
        jmp short DrawRatingBars_5E5.77
DrawRatingBars_640:
        cmp esi, byte 3
        je short .80
        cmp esi, byte 1
        je short .80
        cmp esi, byte 5
        je short .80
        cmp esi, byte 7
        jne short .81
.80:
        movzx eax, word [byte edi+04h]
        jmp short DrawRatingBars_5E5.74
.81:
        movzx eax, word [byte edi+016h]
        jmp short DrawRatingBars_5E5.77
DrawRatingBars_660:
        cmp esi, byte 3
        je short .82
        cmp esi, byte 1
        je short .82
        cmp esi, byte 5
        je short .82
        cmp esi, byte 7
        jne short .83
.82:
        movzx eax, word [byte edi+06h]
        jmp short DrawRatingBars_5E5.74
.83:
        movzx eax, word [byte edi+018h]
        jmp short DrawRatingBars_5E5.77
DrawRatingBars_680:
        cmp esi, byte 3
        je short .84
        cmp esi, byte 1
        je short .84
        cmp esi, byte 5
        je short .84
        cmp esi, byte 7
        jne short .85
.84:
        movzx eax, word [byte edi+08h]
        jmp near DrawRatingBars_5E5.74
.85:
        movzx eax, word [byte edi+01Ah]
        jmp near DrawRatingBars_5E5.77
DrawRatingBars_6A6:
        cmp esi, byte 3
        je short .86
        cmp esi, byte 1
        je short .86
        cmp esi, byte 5
        je short .86
        cmp esi, byte 7
        jne short .87
.86:
        movzx eax, word [byte edi+0Ah]
        jmp near DrawRatingBars_5E5.74
.87:
        movzx eax, word [byte edi+01Ch]
        jmp near DrawRatingBars_5E5.74
DrawRatingBars_6CC:
        cmp esi, byte 3
        je short .88
        cmp esi, byte 1
        je short .88
        cmp esi, byte 5
        je short .88
        cmp esi, byte 7
        jne short .89
.88:
        movsx eax, word [byte edi+010h]
        jmp near DrawRatingBars_5E5.74
.89:
        movsx eax, word [byte edi+022h]
        jmp near DrawRatingBars_5E5.74
DrawRatingBars_6F2:
        cmp esi, byte 3
        je short .90
        cmp esi, byte 1
        je short .90
        cmp esi, byte 5
        je short .90
        cmp esi, byte 7
        jne short .91
.90:
        movzx eax, word [byte edi+0Ch]
        jmp near DrawRatingBars_5E5.74
.91:
        movzx eax, word [byte edi+01Eh]
        jmp near DrawRatingBars_5E5.74
DrawRatingBars_718:
        cmp esi, byte 3
        je short .92
        cmp esi, byte 1
        je short .92
        cmp esi, byte 5
        je short .92
        cmp esi, byte 7
        jne short .93
.92:
        movzx eax, word [byte edi+0Eh]
        jmp near DrawRatingBars_5E5.74
.93:
        movzx eax, word [byte edi+020h]
        jmp near DrawRatingBars_5E5.74
DrawRatingBars_73E:
        cmp esi, byte 3
        je short .94
        cmp esi, byte 1
        je short .94
        cmp esi, byte 5
        je short .94
        cmp esi, byte 7
        jne short .98
.94:
        cmp word [byte edi+02h], byte 0
        jne short .96
.95:
        push str_003
        jmp short .100
.96:
        movzx ebx, word [byte edi+02h]
        imul eax, ebx, dword 3E8h
        movzx edx, word [byte edi+0Eh]
        mov dword [byte ebp-02Ch], edx
        cdq
        idiv dword [byte ebp-02Ch]
        mov dword [byte ebp-04h], 0Ah
        cdq
        idiv dword [byte ebp-04h]
        imul eax, ebx, byte 64h
        push edx
        cdq
        idiv dword [byte ebp-02Ch]
.97:
        push eax
        push str_DD10
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .101
.98:
        cmp word [byte edi+014h], byte 0
        je short .95
        movzx eax, word [byte edi+014h]
        mov dword [byte ebp-02Ch], eax
        imul eax, dword 3E8h
        movzx ebx, word [byte edi+020h]
        cdq
        idiv ebx
        mov dword [byte ebp-04h], 0Ah
        cdq
        idiv dword [byte ebp-04h]
        imul eax, dword [byte ebp-02Ch], byte 64h
        push edx
        cdq
        idiv ebx
        jmp short .97
.99:
        push str_NAV
.100:
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        add esp, byte 8
.101:
        cmp dword [byte ebp+010h], byte 0
        jne short .102
        mov ebx, dword [byte ebp-0Ch]
        mov edx, 96h
        lea eax, [byte ebp-038h]
        call DrawColorTextRight
        jmp short .103
.102:
        mov ebx, dword [byte ebp-0Ch]
        lea eax, [byte ebp-038h]
        xor edx, edx
        call DrawColorText
.103:
        add dword [byte ebp-0Ch], byte 14h
        inc dword [byte ebp-01Ch]
        add ecx, byte 4
.104:
        mov eax, dword [byte ebp-01Ch]
        cmp eax, dword [byte ebp-020h]
        jl near DrawRatingBars_4C1.72
.105:
        call SetScreenTarget
        cmp dword [byte ebp+010h], byte 0
        jne short .106
        push dword 15Ch
        mov eax, dword [byte ebp+018h]
        push byte 50h
        jmp short .107
.106:
        push dword 15Ch
        mov eax, dword [byte ebp+018h]
        push dword 19Fh
.107:
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
        leave
        pop edi
        pop esi
        ret 0Ch
;-----------------------------------------------------------------------------
; DrawRatingsTitle                                95E84  96 PC, low confidence
; The ratings screen's title text
;-----------------------------------------------------------------------------
DrawRatingsTitle:
        push esi
        push edi
        enter 4, 0
        push eax
        push edx
        mov edi, ebx
        mov dword [byte ebp-04h], ecx
        push dword [byte ebp+010h]
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFEA4h
        push dword 0FFFFFEE2h
        push str_Bkgd18
        push dword [byte ebp-04h]
        call FindShape
        add esp, byte 8
        push eax
        xor esi, esi
        call PutBlock
        lea eax, [byte edi+06h]
        add esp, byte 0Ch
        mov ecx, edi
        shl eax, 2
        shl ecx, 2
        cmp dword [byte ebp-0Ch], byte 0
        jne short .6
        cmp dword [byte ebp-08h], byte 0
        je short .3
        mov edi, eax
        jmp short .2
.1:
        mov ebx, esi
        mov eax, dword [dword ecx+GoalieRatingTextIds]
        xor edx, edx
        call GetLangText
        call DrawColorText
        add ecx, byte 4
        add esi, byte 14h
.2:
        cmp ecx, edi
        jge near .12
        jmp short .1
.3:
        mov edi, eax
        jmp short .5
.4:
        mov ebx, esi
        mov eax, dword [dword ecx+SkaterRatingTextIds]
        xor edx, edx
        call GetLangText
        call DrawColorText
        add ecx, byte 4
        add esi, byte 14h
.5:
        cmp ecx, edi
        jge short .12
        jmp short .4
.6:
        cmp dword [byte ebp-08h], byte 0
        je short .9
        mov edi, eax
        jmp short .8
.7:
        mov ebx, esi
        mov eax, dword [dword ecx+GoalieCardTextIds]
        xor edx, edx
        call GetLangText
        call DrawColorText
        add ecx, byte 4
        add esi, byte 14h
.8:
        cmp ecx, edi
        jge short .12
        jmp short .7
.9:
        mov edi, eax
        jmp short .11
.10:
        mov ebx, esi
        mov eax, dword [dword ecx+SkaterCardTextIds]
        xor edx, edx
        call GetLangText
        call DrawColorText
        add ecx, byte 4
        add esi, byte 14h
.11:
        cmp ecx, edi
        jl short .10
.12:
        call SetScreenTarget
        push dword 15Ch
        mov eax, dword [byte ebp+010h]
        push dword 11Eh
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
DrawRatingsTitle_109:
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; LoadRatingsPicture                              95F93  96 PC, low confidence
; The player's picture (PROFILE.FSH, card, plyr) and his number
;-----------------------------------------------------------------------------
LoadRatingsPicture:
        push esi
        push edi
        enter 18h, 0
        mov esi, eax
        mov dword [byte ebp-08h], edx
        mov dword [byte ebp-0Ch], ebx
        mov dword [byte ebp-04h], ecx
        test edx, edx
        jne short .1
        cmp dword [SkaterPhotoLoaded], byte 0
        je short .3
        push dword [SkaterPhotoLoaded]
        jmp short .2
.1:
        cmp dword [GoaliePhotoLoaded], byte 0
        je short .3
        push dword [GoaliePhotoLoaded]
.2:
        call FreeMemBlock
        add esp, byte 4
.3:
        mov eax, 0FFFFFFF8h
        call SelectDataLibrary
        push str_FSH5
        lea eax, [byte ebp-018h]
        push eax
        mov ecx, 4
        call sprintf_
        mov eax, dword [RosterJerseyPtrs]
        add esp, byte 8
        lea edi, [byte ebp-018h]
        mov esi, dword [eax+esi*4]
        rep movsb
        imul esi, dword [byte ebp-08h], byte 64h
        add esi, byte 1Eh
        lea edi, [esi+esi*2]
        add edi, dword [byte ebp-0Ch]
        cmp dword [byte ebp-08h], byte 0
        jne near .9
        lea eax, [byte ebp-018h]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        je short .7
        push byte 0
        lea eax, [byte ebp-018h]
        push eax
        call LoadResourceDataShared
        add esp, byte 8
        push str_Plyr3
        push eax
        mov dword [SkaterPhotoLoaded], eax
        call FindShape
        add esp, byte 8
        mov dword [SkaterCardPhoto], eax
        cmp dword [byte ebp-04h], byte 0
        jne short .5
        push str_Pal24
.4:
        push dword [SkaterPhotoLoaded]
        jmp near .11
.5:
        push str_Pal24
.6:
        push dword [SkaterPhotoLoaded]
        jmp near .15
.7:
        push eax
        push str_PROFILEFSH3
        call LoadResourceDataShared
        add esp, byte 8
        push str_Card3
        push eax
        mov dword [SkaterPhotoLoaded], eax
        call FindShape
        add esp, byte 8
        mov dword [SkaterCardPhoto], eax
        cmp dword [byte ebp-04h], byte 0
        jne short .8
        push str_Ard3
        jmp short .4
.8:
        push str_Ard3
        jmp short .6
.9:
        lea eax, [byte ebp-018h]
        push eax
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        je short .13
        push byte 0
        lea eax, [byte ebp-018h]
        push eax
        call LoadResourceDataShared
        add esp, byte 8
        push str_Plyr3
        push eax
        mov dword [GoaliePhotoLoaded], eax
        call FindShape
        add esp, byte 8
        mov dword [GoalieCardPhoto], eax
        cmp dword [byte ebp-04h], byte 0
        jne short .12
        push str_Pal24
.10:
        push dword [GoaliePhotoLoaded]
.11:
        call FindShape
        add esp, byte 8
        add eax, byte 10h
        push eax
        push byte 64h
        push esi
        call SetPaletteEntries
        add esp, byte 0Ch
        leave
        pop edi
        pop esi
        ret
.12:
        push str_Pal24
        push dword [GoaliePhotoLoaded]
        jmp short .15
.13:
        push eax
        push str_PROFILEFSH3
        call LoadResourceDataShared
        add esp, byte 8
        push str_Card3
        push eax
        mov dword [GoaliePhotoLoaded], eax
        call FindShape
        add esp, byte 8
        mov dword [GoalieCardPhoto], eax
        cmp dword [byte ebp-04h], byte 0
        jne short .14
        push str_Ard3
        jmp short .10
.14:
        push str_Ard3
        push dword [GoaliePhotoLoaded]
.15:
        call FindShape
        add esp, byte 8
        mov ecx, 12Ch
        lea esi, [byte eax+010h]
        rep movsb
        leave
        pop edi
        pop esi
        ret
        push esi
        push edi
        enter 0Ch, 0
        push eax
        mov esi, edx
        mov edi, ebx
        mov dword [byte ebp-04h], ecx
        push byte 0
        push ecx
        push ebx
        push edx
        push eax
        call FillRect
        mov eax, dword [byte ebp+010h]
        add eax, byte 5
        lea eax, [eax+eax*4]
        mov dword [byte ebp-08h], eax
        imul eax, edi
        mov ebx, 64h
        cdq
        idiv ebx
        add esp, byte 14h
        push dword 0FDh
        push dword [byte ebp-04h]
        add edi, dword [byte ebp-010h]
        push eax
        mov edx, edi
        push esi
        sub edx, eax
        push edx
        call FillRect
        add esp, byte 14h
        push dword [byte ebp-08h]
        push str_D11
        lea eax, [byte ebp-0Ch]
        push eax
        mov edx, 0FDh
        call sprintf_
        add esp, byte 0Ch
        xor eax, eax
        lea ebx, [byte esi+01h]
        call SetTextColors
        lea eax, [byte ebp-0Ch]
        lea edx, [byte edi-015h]
        call DrawColorText
        jmp near DrawRatingsTitle_109
;-----------------------------------------------------------------------------
; SwitchRatingsCard                               961ED  96 PC, low confidence
; The card change animation of the ratings screen (SlideCardLeft /
; SlideCardRight)
;-----------------------------------------------------------------------------
SwitchRatingsCard:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        call GetTicks
        push dword [SkaterCardRemap]
        mov edi, eax
        mov esi, eax
        call SetColourRemap
        mov eax, dword [RatingsShownId]
        mov ebx, dword [SkaterFlashTime]
        add esp, byte 4
        mov dword [RatingsPlayerId], eax
        mov eax, dword [SkaterCardFlash]
        add ebx, byte 1Eh
        cmp eax, byte 2
        jb short .1
        jbe near .4
        cmp eax, byte 3
        je near .5
        jmp near .8
.1:
        cmp eax, byte 1
        jne near .8
        cmp edi, ebx
        jle short .2
        mov edx, 0Ah
        mov ebx, dword [RatingsCardBmp]
        mov eax, dword [SkaterCardPhoto]
        xor ecx, ecx
        call SlideCardLeft
        mov dword [SkaterCardFlash], 2
        mov dword [SkaterFlashTime], edi
        jmp short .3
.2:
        mov eax, edi
        sub eax, dword [SkaterFlashTime]
        mov edi, 3
        cdq
        idiv edi
        mov ebx, dword [RatingsCardBmp]
        xor ecx, ecx
        mov edi, dword [SkaterCardPhoto]
        mov edx, eax
        mov eax, edi
        call SlideCardLeft
.3:
        call SetScreenTarget
        push byte 68h
        mov eax, dword [RatingsCardBmp]
        push byte 48h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.4:
        mov eax, dword [SkaterFlashTime]
        add eax, byte 32h
        cmp esi, eax
        jle near .8
        mov eax, dword [RatingsPlayerId]
        xor ecx, ecx
        xor ebx, ebx
        xor edx, edx
        call LoadRatingsPicture
        mov dword [SkaterCardFlash], 3
        mov dword [SkaterFlashTime], esi
        jmp short .8
.5:
        cmp edi, ebx
        jle short .6
        mov edx, 0Ah
        mov ebx, dword [RatingsCardBmp]
        mov eax, dword [SkaterCardPhoto]
        xor ecx, ecx
        call SlideCardRight
        mov dword [SkaterCardFlash], 0
        mov dword [SkaterFlashTime], edi
        jmp short .7
.6:
        mov edx, 0Ah
        mov ebx, dword [RatingsCardBmp]
        mov eax, dword [SkaterCardPhoto]
        xor ecx, ecx
        call SlideCardRight
.7:
        call SetScreenTarget
        push byte 68h
        mov eax, dword [RatingsCardBmp]
        push byte 48h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.8:
        push dword [GoalieCardRemap]
        call SetColourRemap
        mov eax, dword [TeamScoringScore-4]
        mov ebx, dword [GoalieFlashTime]
        add esp, byte 4
        mov dword [RatingsPlayerId], eax
        mov eax, dword [GoalieCardFlash]
        add ebx, byte 1Eh
        cmp eax, byte 2
        jb short .9
        jbe near .12
        cmp eax, byte 3
        je near .13
        jmp near .16
.9:
        cmp eax, byte 1
        jne near .16
        cmp esi, ebx
        jle short .10
        mov edx, 0Ah
        mov ebx, dword [RatingsGoalieOrder]
        mov eax, dword [GoalieCardPhoto]
        xor ecx, ecx
        call SlideCardLeft
        mov dword [GoalieCardFlash], 2
        mov dword [GoalieFlashTime], esi
        jmp short .11
.10:
        mov eax, esi
        sub eax, dword [GoalieFlashTime]
        mov edi, 3
        cdq
        idiv edi
        mov ebx, dword [RatingsGoalieOrder]
        xor ecx, ecx
        mov edi, dword [GoalieCardPhoto]
        mov edx, eax
        mov eax, edi
        call SlideCardLeft
.11:
        call SetScreenTarget
        push byte 68h
        mov eax, dword [RatingsGoalieOrder]
        push dword 190h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.12:
        mov eax, dword [GoalieFlashTime]
        add eax, byte 32h
        cmp esi, eax
        jle near .16
        mov edx, 1
        mov eax, dword [RatingsPlayerId]
        xor ecx, ecx
        xor ebx, ebx
        call LoadRatingsPicture
        mov dword [GoalieCardFlash], 3
        mov dword [GoalieFlashTime], esi
        jmp short .16
.13:
        cmp esi, ebx
        jle short .14
        mov edx, 0Ah
        mov ebx, dword [RatingsGoalieOrder]
        mov eax, dword [GoalieCardPhoto]
        xor ecx, ecx
        call SlideCardRight
        mov dword [GoalieCardFlash], 0
        mov dword [GoalieFlashTime], esi
        jmp short .15
.14:
        mov edx, 0Ah
        mov ebx, dword [RatingsGoalieOrder]
        mov eax, dword [GoalieCardPhoto]
        xor ecx, ecx
        call SlideCardRight
.15:
        call SetScreenTarget
        push byte 68h
        mov eax, dword [RatingsGoalieOrder]
        push dword 190h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.16:
        push dword [RatingsDimRemap]
        call SetColourRemap
        mov eax, dword [RatingsShownId]
        add esp, byte 4
        mov dword [RatingsPlayerId], eax
        cmp dword [SkaterCardFlash], byte 2
        jne short .17
        mov eax, dword [nosplit eax*4+PlayerRecPtrs]
        mov edx, dword [RatingsCardBmp]
        movsx eax, byte [eax]
        call DrawLeagueLogo
        call SetScreenTarget
        push byte 68h
        mov eax, dword [RatingsCardBmp]
        push byte 48h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.17:
        mov eax, dword [TeamScoringScore-4]
        mov dword [RatingsPlayerId], eax
        cmp dword [GoalieCardFlash], byte 2
        jne short .18
        mov eax, dword [nosplit eax*4+PlayerRecPtrs]
        mov edx, dword [RatingsGoalieOrder]
        movsx eax, byte [eax]
        call DrawLeagueLogo
        call SetScreenTarget
        push byte 68h
        mov eax, dword [RatingsGoalieOrder]
        push dword 190h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.18:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawRatingsList                                 96525  96 PC, low confidence
; The ratings screen's player list and its scroll bar (BALL)
;-----------------------------------------------------------------------------
DrawRatingsList:
        push esi
        push edi
        mov esi, eax
        cmp edx, byte 1
        jne short .1
        cmp dword [byte eax+028h], byte 9
        je short .1
        test ebx, ebx
        je short .4
.1:
        test edx, edx
        jne short .2
        cmp dword [byte esi+028h], byte 0Eh
        je short .2
        test ebx, ebx
        je short .4
.2:
        cmp edx, byte 1
        jne short .3
        cmp dword [byte esi+028h], byte 0Bh
        je short .3
        test ebx, ebx
        jne short .4
.3:
        test edx, edx
        jne near .9
        cmp dword [byte esi+028h], byte 0Ah
        je near .9
        test ebx, ebx
        je near .9
.4:
        mov eax, esi
        call FreeScrollBar
        lea edi, [dword ecx+052Eh]
        test ebx, ebx
        jne near .6
        test edx, edx
        jne short .5
        push str_BALL4
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_S32
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd18
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 6
        mov ebx, 0Eh
        jmp near .8
.5:
        push str_BALL4
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_S32
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd18
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 6
        mov ebx, 9
        jmp near .8
.6:
        test edx, edx
        jne short .7
        push str_BALL4
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_S32
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd18
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 6
        mov ebx, 0Ah
        jmp short .8
.7:
        push str_BALL4
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_S32
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd18
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 6
        mov ebx, 0Bh
.8:
        push byte 0
        mov edx, edi
        mov eax, esi
        call InitVScrollBar
.9:
        call SetScreenTarget
        mov eax, esi
        call DrawScrollBar
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawRatingsName                                 966CA  96 PC, low confidence
; The name line "#%d %s %s"
;-----------------------------------------------------------------------------
DrawRatingsName:
        push ecx
        push esi
        push edi
        enter 34h, 0
        push eax
        mov esi, edx
        mov edi, ebx
        push ebx
        call SetDrawBitmap
        add esp, byte 4
        cmp dword [byte ebp-038h], byte 0
        jne short .1
        push dword 0FFFFFEE0h
        push byte 0FFFFFFCEh
        jmp short .2
.1:
        push dword 0FFFFFEE0h
        push dword 0FFFFFE75h
.2:
        push str_Bkgd18
        push dword [BackgroundShapes]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        mov ebx, dword [RosterProfilePtrs]
        mov eax, esi
        push dword [ebx+eax*4]
        mov ebx, dword [RosterLastNamePtrs]
        mov edx, dword [RosterFirstNamePtrs]
        push dword [ebx+eax*4]
        mov eax, dword [edx+eax*4]
        movzx eax, byte [eax]
        push eax
        push str_DSS4
        lea eax, [byte ebp-034h]
        push eax
        xor ebx, ebx
        call sprintf_
        add esp, byte 14h
        mov edx, 64h
        lea eax, [byte ebp-034h]
        call DrawColorTextCentred
        mov al, byte [dword esi+PlayerPosCodes]
        cmp al, 47h
        jb short .3
        jbe short .4
        cmp al, 4Ch
        jb short .9
        jbe short .5
        cmp al, 52h
        je short .7
        jmp short .9
.3:
        cmp al, 43h
        jb short .9
        jbe short .6
        cmp al, 44h
        je short .8
        jmp short .9
.4:
        mov eax, 0C7h
        jmp short .10
.5:
        mov eax, 0C8h
        jmp short .10
.6:
        mov eax, 0C9h
        jmp short .10
.7:
        mov eax, 0CAh
        jmp short .10
.8:
        mov eax, 0CBh
        jmp short .10
.9:
        mov eax, 0CCh
.10:
        call GetLangText
        push eax
        lea eax, [byte ebp-034h]
        push eax
        call sprintf_
        add esp, byte 8
        mov ebx, 13h
        lea eax, [byte ebp-034h]
        xor edx, edx
        call DrawColorText
        mov eax, esi
        movsx edx, byte [dword esi+PlayerPosCodes]
        shl eax, 2
        cmp edx, byte 47h
        jne short .12
        mov edx, dword [RosterPlayerPtrs]
        mov eax, dword [edx+eax]
        call StatsDb2Record
        movzx eax, byte [eax]
        test eax, eax
        jne short .11
        mov eax, 0CDh
        jmp short .14
.11:
        mov eax, 0CEh
        jmp short .14
.12:
        mov edx, dword [RosterPlayerPtrs]
        mov eax, dword [edx+eax]
        call StatsDb2Record
        movzx eax, byte [eax]
        test eax, eax
        je short .13
        mov eax, 0CFh
        jmp short .14
.13:
        mov eax, 0D0h
.14:
        mov ebx, 13h
        mov edx, 64h
        call GetLangText
        call DrawColorText
        mov eax, esi
        shl eax, 2
        test byte [optflags], 0Ch
        jne short .15
        mov ebx, dword [PlayerHeightPtrs]
        mov ebx, dword [ebx+eax]
        movzx ebx, byte [ebx]
        mov eax, ebx
        mov ecx, 0Ch
        cdq
        idiv ecx
        mov eax, ebx
        push edx
        cdq
        idiv ecx
        jmp short .16
.15:
        mov edx, dword [PlayerHeightPtrs]
        mov eax, dword [edx+eax]
        movzx ax, byte [eax]
        mov dword [byte ebp-04h], eax
        fild word [byte ebp-04h]
        fmul qword [F64_2p54_DrawRatingsName]
        call __CHP
        fistp dword [byte ebp-0Ch]
        mov eax, dword [byte ebp-0Ch]
        mov ebx, 64h
        cdq
        idiv ebx
        mov eax, dword [byte ebp-0Ch]
        push edx
        cdq
        idiv ebx
.16:
        push eax
        mov eax, 0D1h
        call GetLangText
        push eax
        lea eax, [byte ebp-034h]
        push eax
        call sprintf_
        add esp, byte 10h
        mov ebx, 26h
        lea eax, [byte ebp-034h]
        xor edx, edx
        call DrawColorText
        mov eax, esi
        shl eax, 2
        test byte [optflags], 0Ch
        jne short .17
        mov edx, dword [PlayerWeightPtrs]
        mov eax, dword [edx+eax]
        movzx eax, byte [eax]
        push eax
        jmp short .18
.17:
        mov edx, dword [PlayerWeightPtrs]
        mov eax, dword [edx+eax]
        movzx ax, byte [eax]
        mov dword [byte ebp-04h], eax
        fild word [byte ebp-04h]
        fmul qword [F64_0p454545_DrawRatingsName]
        call __CHP
        fistp dword [byte ebp-08h]
        push dword [byte ebp-08h]
.18:
        mov eax, 0D2h
        call GetLangText
        push eax
        lea eax, [byte ebp-034h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        mov ebx, 26h
        mov edx, 64h
        lea eax, [byte ebp-034h]
        call DrawColorText
        call SetScreenTarget
        cmp dword [byte ebp-038h], byte 0
        jne short .19
        push dword 120h
        push byte 32h
        jmp short .20
.19:
        push dword 120h
        push dword 18Bh
.20:
        push dword [byte edi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        leave
        pop edi
        pop esi
        pop ecx
        ret
RosterHotspots:
        db 0F9h,00h,00h,00h,0E4h,00h,00h,00h,02h,01h,00h,00h,0DAh,00h,00h,00h
        db 07Fh,01h,00h,00h,0DAh,00h,00h,00h,088h,01h,00h,00h,0E6h,00h,00h,00h
        db 07Dh,01h,00h,00h,0F0h,00h,00h,00h,01h,01h,00h,00h,0EFh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0F9h,00h,00h,00h,0Ah,01h,00h,00h,02h,01h,00h,00h,0FFh,00h,00h,00h
        db 07Fh,01h,00h,00h,0FFh,00h,00h,00h,089h,01h,00h,00h,0Ch,01h,00h,00h
        db 07Dh,01h,00h,00h,016h,01h,00h,00h,0FFh,00h,00h,00h,013h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 019h,01h,00h,00h,054h,01h,00h,00h,01Dh,01h,00h,00h,04Ch,01h,00h,00h
        db 060h,01h,00h,00h,04Ch,01h,00h,00h,066h,01h,00h,00h,054h,01h,00h,00h
        db 05Eh,01h,00h,00h,05Bh,01h,00h,00h,020h,01h,00h,00h,05Ch,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 066h,01h,00h,00h,078h,01h,00h,00h,066h,01h,00h,00h,02Eh,01h,00h,00h
        db 085h,01h,00h,00h,053h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0FBh,00h,00h,00h,054h,01h,00h,00h,018h,01h,00h,00h,02Fh,01h,00h,00h
        db 018h,01h,00h,00h,07Dh,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0FAh,00h,00h,00h,09Dh,01h,00h,00h,01h,01h,00h,00h,092h,01h,00h,00h
        db 080h,01h,00h,00h,093h,01h,00h,00h,088h,01h,00h,00h,0A1h,01h,00h,00h
        db 07Bh,01h,00h,00h,0A9h,01h,00h,00h,0FFh,00h,00h,00h,0A6h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0F4h,00h,00h,00h,0C4h,01h,00h,00h,0FBh,00h,00h,00h,0BAh,01h,00h,00h
        db 088h,01h,00h,00h,0BBh,01h,00h,00h,095h,01h,00h,00h,0C5h,01h,00h,00h
        db 089h,01h,00h,00h,0D0h,01h,00h,00h,0FCh,00h,00h,00h,0D0h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 062h,00h,00h,00h,0C5h,01h,00h,00h,069h,00h,00h,00h,0BBh,01h,00h,00h
        db 0D6h,00h,00h,00h,0BBh,01h,00h,00h,0DFh,00h,00h,00h,0C6h,01h,00h,00h
        db 0D6h,00h,00h,00h,0D1h,01h,00h,00h,06Ah,00h,00h,00h,0D0h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0AAh,01h,00h,00h,0C6h,01h,00h,00h,0B0h,01h,00h,00h,0BAh,01h,00h,00h
        db 020h,02h,00h,00h,0BBh,01h,00h,00h,029h,02h,00h,00h,0C7h,01h,00h,00h
        db 01Fh,02h,00h,00h,0D0h,01h,00h,00h,0B0h,01h,00h,00h,0CFh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; RosterTabHotspots                               96B89  96 PC, low confidence
; Roster screen tab click areas
;-----------------------------------------------------------------------------
RosterTabHotspots:
        db 058h,00h,00h,00h,0C4h,01h,00h,00h,05Fh,00h,00h,00h,0BBh,01h,00h,00h
        db 0CEh,00h,00h,00h,0BBh,01h,00h,00h,0D5h,00h,00h,00h,0C5h,01h,00h,00h
        db 0D0h,00h,00h,00h,0D0h,01h,00h,00h,061h,00h,00h,00h,0D0h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02h,01h,00h,00h,0C5h,01h,00h,00h,08h,01h,00h,00h,0BAh,01h,00h,00h
        db 079h,01h,00h,00h,0BAh,01h,00h,00h,080h,01h,00h,00h,0C5h,01h,00h,00h
        db 07Ah,01h,00h,00h,0CFh,01h,00h,00h,0Bh,01h,00h,00h,0D1h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0AAh,01h,00h,00h,0C5h,01h,00h,00h,0AFh,01h,00h,00h,0BAh,01h,00h,00h
        db 01Fh,02h,00h,00h,0BAh,01h,00h,00h,029h,02h,00h,00h,0C5h,01h,00h,00h
        db 01Fh,02h,00h,00h,0CEh,01h,00h,00h,0B4h,01h,00h,00h,0CEh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
RosterKeyTable:
        db 016h,00h,00h,0Ah,01Bh,01h,0Bh,01h,02h,014h,02h,010h,03h,04h,01Ch,026h
        db 03h,07h,01Dh,027h,04h,08h,020h,07h,04h,08h,07h,02Ah,04h,08h,05h,06h
        db 07h,09h,025h,02Fh,08h,09h,0Ah,0Bh,025h,0Ah,00h,09h,02Fh,0Bh,09h,01h
        db 0Ch,0Eh,0Ch,010h,0Dh,0Eh,0Dh,010h,0Ch,00h,0Eh,012h,0Ch,015h,0Fh,012h
        db 010h,012h,0Ch,010h,011h,012h,0Ch,011h,010h,01h,0Eh,012h,010h,019h,0Eh,013h
        db 0Fh,016h,014h,01Ch,0Ch,016h,015h,01Ch,014h,00h,016h,023h,014h,00h,017h,023h
        db 013h,01Ah,026h,018h,013h,01Ah,026h,019h,018h,01h,02Dh,01Ah,018h,01h,02Dh,01Bh
        db 0Fh,01Dh,014h,03h,01Ch,01Eh,014h,04h,01Dh,01Fh,014h,04h,01Eh,020h,014h,05h
        db 01Fh,021h,016h,05h,020h,022h,016h,05h,021h,023h,016h,05h,022h,024h,016h,05h
        db 023h,025h,016h,05h,024h,0Ah,00h,08h,013h,027h,03h,018h,026h,028h,04h,018h
        db 027h,029h,04h,018h,028h,02Ah,06h,018h,029h,02Bh,06h,01Ah,02Ah,02Ch,06h,01Ah
        db 02Bh,02Dh,06h,01Ah,02Ch,02Eh,06h,01Ah,02Dh,02Fh,08h,01Ah,02Eh,0Bh,08h,01h
;-----------------------------------------------------------------------------
; CreatePlayerHotspots                            96D09  96 PC, low confidence
; Create player screen click areas
;-----------------------------------------------------------------------------
CreatePlayerHotspots:
        db 02Dh,00h,00h,00h,0ABh,00h,00h,00h,034h,00h,00h,00h,0A1h,00h,00h,00h
        db 0ACh,00h,00h,00h,0A1h,00h,00h,00h,0B6h,00h,00h,00h,0AEh,00h,00h,00h
        db 0ABh,00h,00h,00h,0B9h,00h,00h,00h,036h,00h,00h,00h,0B9h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0D4h,01h,00h,00h,0AEh,00h,00h,00h,0D7h,01h,00h,00h,0A3h,00h,00h,00h
        db 053h,02h,00h,00h,0A3h,00h,00h,00h,05Bh,02h,00h,00h,0AFh,00h,00h,00h
        db 052h,02h,00h,00h,0B9h,00h,00h,00h,0DCh,01h,00h,00h,0B9h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0F0h,00h,00h,00h,0A6h,00h,00h,00h,0F9h,00h,00h,00h,09Fh,00h,00h,00h
        db 08Eh,01h,00h,00h,0A0h,00h,00h,00h,095h,01h,00h,00h,0A8h,00h,00h,00h
        db 093h,01h,00h,00h,0B4h,00h,00h,00h,08Fh,01h,00h,00h,0BAh,00h,00h,00h
        db 0F9h,00h,00h,00h,0BBh,00h,00h,00h,0F1h,00h,00h,00h,0B5h,00h,00h,00h
CreateSkaterNavLinks:
        db 02h,00h,00h,01Dh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,01h,01Fh,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02h,00h,02h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,01h,04h,03h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,06h,02h,03h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,09h,05h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,0Ah,05h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,0Bh,08h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,0Ch,06h,07h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 05h,0Dh,00h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 06h,0Eh,09h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 07h,0Fh,0Ch,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 08h,010h,0Ah,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 09h,011h,00h,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Ah,012h,0Dh,010h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,013h,010h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Ch,014h,0Eh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Dh,015h,00h,012h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Eh,016h,011h,014h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Fh,017h,014h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 010h,018h,012h,013h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 011h,019h,00h,016h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 012h,01Ah,015h,018h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 013h,01Bh,018h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 014h,01Ch,016h,017h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 015h,01Dh,00h,01Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 016h,01Eh,019h,01Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 017h,01Fh,01Ch,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 018h,020h,01Ah,01Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 019h,01Dh,00h,01Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Ah,01Eh,01Dh,020h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Bh,01Fh,020h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Ch,020h,01Eh,01Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
CreateGoalieNavLinks:
        db 02h,00h,00h,015h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,01h,013h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02h,00h,02h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,01h,04h,03h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,06h,02h,03h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,09h,05h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,0Ah,05h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,0Bh,08h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,0Ch,06h,07h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 05h,0Dh,00h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 06h,0Eh,09h,0Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 07h,0Fh,0Ch,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 08h,010h,0Ah,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 09h,011h,00h,0Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Ah,012h,0Dh,010h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,013h,010h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Ch,014h,0Eh,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Dh,015h,00h,012h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Eh,016h,011h,014h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Fh,013h,014h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 010h,014h,012h,013h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 011h,015h,00h,016h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 012h,016h,015h,014h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 013h,01Bh,018h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 014h,01Ch,016h,017h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 015h,01Dh,00h,01Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 016h,01Eh,019h,01Ch,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 017h,01Fh,01Ch,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 018h,020h,01Ah,01Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 019h,01Dh,00h,01Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Ah,01Eh,01Dh,020h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Bh,01Fh,020h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Ch,020h,01Eh,01Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
