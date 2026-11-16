; The in-game menu over the game view: its frame, quit / return, the front-end screens during a game and back (96 PC).
bits 32
%include "hockey.inc"
section s_A17D5 progbits alloc exec nowrite align=1
extern AwayClinchesSeries, awtmstruct, byte_1175A4, byte_1175A5, byte_1175A6, byte_1175A7, byte_1175A8, byte_1175A9
extern byte_11D91C, byte_11D91D, byte_11FA2F, byte_17CA5D, byte_1820F1, byte_1843CC, byte_18444E, byte_184451
extern byte_1844B4, byte_1844B6, byte_18451B, byte_184580, byte_184581, byte_184583, byte_1845E6, byte_1845E7
extern byte_1845E8, byte_18464C, byte_18464E, byte_18464F, byte_1846C4, CloseTextOverlay, ControllerScreen, CopyBitmap
extern Crowd_Noise, CrowdFadeOut, CrowdNoiseReset, CrowdReaction, curperiod, DrawArtOpaque, DrawBox, DrawColorTextCentred
extern DrawFrameAt, DrawGameFrame, DrawRinkView, dword_1150D4, gameresult, ReplayRemoteShape, dword_11B330, dword_11BC24
extern dword_11D3A6, dword_11D91F, dword_11ED30, dword_11F5C0, dword_11F5C4, dword_152F4C, MenuRemoteCursorArt, MenuCursorPixels
extern dword_152F58, MenuBitmapPixels, dword_179918, dword_179920, dword_17CA5C, dword_17CB2F, PlayoffTreeData, dword_17CC17
extern dword_17CED6, dword_17CF92, dword_17D162, FrontShapeFile, dword_1843AC, dword_1843B0, dword_1843B4, dword_1843C0
extern dword_1843D0, dword_1843E4, dword_1843F8, dword_1843FC, dword_184400, dword_184404, dword_184408, dword_18441C
extern dword_184420, dword_184426, dword_18442A, dword_18442E, dword_184432, dword_184436, dword_184446, dword_18444A
extern dword_184482, dword_184486, dword_18448C, dword_184490, dword_184494, dword_184498, dword_18449C, dword_1844AC
extern dword_1844B0, dword_1844F2, dword_1844F6, dword_184558, dword_18455C, dword_1845BE, dword_1845C2, dword_184624
extern dword_184628, dword_184670, dword_184674, dword_184678, dword_18467C, dword_184680, dword_184684, EditText
extern EndCameraShot, EndGameSound, fadeinpending, FadeOut, FadeOutMusic, FadePalette, FillBox, FillMusicStream
extern FreeFightSprites, FreeFrontEndArt, FreeSpeechBuffer, FreeSpriteCache, FreeStatsTables, FreeTotalSprites, gameopts, GameStatsScreen
extern GetCrowdTarget, GetLangText, GetTicks, gsp, hmtmstruct, HomeClinchesSeries, InitMenuItems, InitSlotTable
extern lineuptime, LinkSync, LoadFightSprites, LoadFrontEndArt, LoadTeamLogo, LoadTotalSprites, MakeDirPath, MessageBox
extern ModemChat, mousex, mousey, NameIndexAdd, NameIndexFirstId, NameIndexFree, NameIndexLoad, NameIndexNew
extern optflags, PaEvent, PlayerStatsScreen, PlayMusic, PutBlock, QueueMusic, ResetInputSlots, RestoreSpeechBuffer
extern RunEditLines, RunMenu, SetClipWindow, SetCrowdTarget, SetDrawBitmap, SetGameViewSize, SetMenuMouse, SetScreenMode
extern SetScreenPalette, SetTextColors, SetViewRect, sfx, SoundIdle, SoundSecondsToBytes, SpeechBusy, sprintf_
extern StartGameSound, StopAllSfx, StopArenaClip, StopMusic, StopSpeech, str_05d3, str_08d2, str_Bot1
extern str_Bot2, str_Bot3, str_Cht0, str_Cht1, str_CsgDb2, str_Ctr0, str_Ctr1, str_D13
extern str_Edt0, str_Edt1, str_EXHIBITNDX2, str_FhiL3, str_FhiR3, str_Gam0, str_Gam1, str_GhiL2
extern str_GhiR2, str_GloL2, str_GloR2, str_INTERREG, str_Intr, str_Ply02, str_Ply1, str_Qui0
extern str_Qui1, str_Qui2, str_Ret0, str_Ret1, str_Ret2, str_Sav0, str_Sav1, str_Sid1
extern str_Sid2, str_Sts0, str_Sts1, strcat_, strcpy_, AddIceCrud, LoadZamboni, FreeZamboni
extern LoadStandsArt, SetPenaltyBoxDoor, DrawZamboniScene, DrawOverlayPanels, RefreshControlSlots, SetGameBackdrop, SaveGameFile, LoadModeStats
extern DrawArt, AllocMemBlock, FreeMemBlock, CreateBitmap, FreeBitmap, FreeColourLookup, SetAaPalLut, SetScreenTarget
extern FindShape, ClearClipRect, TextSetFont, unk_11D7A4, unk_11D7BC, unk_11D7D4, unk_11D7EC, unk_11D804
extern unk_11D80A, unk_11D810, unk_11D816, unk_11D81C, unk_11D89C, exhstate, unk_17D3E8, unk_18440C
extern unk_184688, unk_184692, UpdateCamera, word_114CE0, word_114F14, word_11ED34, hmscore, awscore
global DrawInGameMenuFrame, RedrawInGameMenu, RedrawInGameMenu_7C, RedrawInGameMenu_7D, OpenFrontEndFromGame, ReturnToGameView, InGameReturnMenu, jpt_A25B5
global InGameMenu, InGameMenu_A9C, InGameMenu_ABD, InGameMenu_D17, InGameMenu_F31, InGameMenu_F42, InGameMenu_FA8
;-----------------------------------------------------------------------------
; DrawInGameMenuFrame                          A17D5  96 PC, medium confidence
; The in-game menu's frame over the game: score with both team logos, period
; and clock, the side and bottom art (intr, sid1/2, bot1-3, gam0)
;-----------------------------------------------------------------------------
DrawInGameMenuFrame:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov edi, eax
        call SoundIdle
        call GetTicks
        mov esi, eax
        sub esi, dword [dword_11ED30]
        cmp esi, byte 5
        jle near .17
        xor edx, edx
.1:
        inc edx
        call SoundIdle
        cmp edx, byte 4
        jl short .1
        call GetTicks
        push dword [ReplayRemoteShape]
        mov dword [dword_11ED30], eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        mov eax, dword [dword_184684]
        push byte 0
        push dword [byte eax+02Ch]
        call DrawArtOpaque
        add esp, byte 0Ch
        mov eax, esi
        call DrawZamboniScene
        cmp dword [gameresult], byte 1
        je near .15
        mov eax, dword [dword_152F4C]
        call SetAaPalLut
        movzx edx, byte [byte_11D91D]
        movzx eax, byte [byte_11D91C]
        mov dword [dword_11BC24], 0FFFFFFFFh
        call SetTextColors
        push byte 0
        push byte 0
        mov esi, dword [dword_184680]
        push byte 1
        movsx eax, word [byte esi+04h]
        push eax
        mov eax, dword [dword_18467C]
        movsx ebx, word [esi]
        movsx ecx, word [byte eax+04h]
        movsx edx, word [eax]
        mov eax, unk_17D3E8
        call DrawBox
        mov eax, 780000h
        mov edx, dword [dword_184678]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, eax
        mov eax, dword [dword_184680]
        sar ecx, 11h
        movsx eax, word [byte eax+02h]
        sub eax, ecx
        mov edx, dword [dword_184678]
        mov ecx, eax
        mov eax, 0E00000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, eax
        mov eax, dword [dword_18467C]
        sar ebx, 11h
        movsx eax, word [byte eax+02h]
        sub eax, ebx
        mov ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        call LoadTeamLogo
        mov esi, dword [dword_184678]
        mov edx, eax
        mov eax, esi
        call DrawFrameAt
        push byte 0
        mov eax, dword [dword_184680]
        mov esi, dword [dword_18467C]
        push byte 0
        movsx edx, word [byte eax+08h]
        movsx ecx, word [byte esi+04h]
        push byte 1
        movsx ebx, word [byte eax+06h]
        mov eax, unk_17D3E8
        push edx
        movsx edx, word [esi]
        call DrawBox
        movsx eax, word [hmscore]
        push eax
        push str_D13
        push unk_184692
        call sprintf_
        add esp, byte 0Ch
        push dword [dword_179920]
        call TextSetFont
        add esp, byte 4
        test byte [byte_17CA5D], 20h
        je short .2
        mov edx, 4
        jmp short .3
.2:
        mov edx, 0FFFFFFFFh
.3:
        mov eax, dword [dword_184680]
        movsx ebx, word [byte eax+06h]
        mov eax, dword [dword_18467C]
        add ebx, edx
        movsx edx, word [byte eax+02h]
        mov eax, unk_184692
        call DrawColorTextCentred
        push byte 0
        mov eax, dword [dword_184680]
        mov esi, dword [dword_18467C]
        push byte 0
        movsx edx, word [byte eax+0Ch]
        movsx ecx, word [byte esi+04h]
        push byte 1
        movsx ebx, word [byte eax+0Ah]
        mov eax, unk_17D3E8
        push edx
        movsx edx, word [esi]
        call DrawBox
        push dword [dword_179918]
        call TextSetFont
        movzx edx, byte [byte_11D91D]
        add esp, byte 4
        movzx eax, byte [byte_11D91C]
        call SetTextColors
        test byte [byte_17CA5D], 20h
        je short .4
        mov eax, 5
        jmp short .5
.4:
        mov eax, 1
.5:
        mov edx, dword [dword_184680]
        movsx ebx, word [byte edx+0Ah]
        add ebx, eax
        mov eax, dword [dword_18467C]
        movsx edx, word [byte eax+02h]
        mov eax, 0A1h
        inc edx
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmstruct]
        push eax
        push str_D13
        push unk_184692
        call sprintf_
        movzx edx, byte [byte_11FA2F]
        mov eax, dword [dword_184680]
        inc edx
        inc edx
        movsx ebx, word [byte eax+0Ch]
        mov eax, dword [dword_18467C]
        add esp, byte 0Ch
        sub ebx, edx
        movsx edx, word [byte eax+02h]
        mov eax, unk_184692
        call DrawColorTextCentred
        push byte 0
        mov eax, dword [dword_184680]
        mov esi, dword [dword_18467C]
        push byte 0
        movsx edx, word [byte eax+04h]
        movsx ecx, word [byte esi+0Eh]
        push byte 1
        movsx ebx, word [eax]
        mov eax, unk_17D3E8
        push edx
        movsx edx, word [byte esi+0Ah]
        call DrawBox
        mov eax, 780000h
        mov edx, dword [dword_184678]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, eax
        mov eax, dword [dword_184680]
        sar ecx, 11h
        movsx eax, word [byte eax+02h]
        sub eax, ecx
        mov edx, dword [dword_184678]
        mov ecx, eax
        mov eax, 0E00000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [dword_18467C]
        movsx ebx, word [byte eax+0Ch]
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        sar edx, 11h
        shr eax, 1Bh
        sub ebx, edx
        call LoadTeamLogo
        mov esi, dword [dword_184678]
        mov edx, eax
        mov eax, esi
        call DrawFrameAt
        push byte 0
        mov eax, dword [dword_184680]
        mov esi, dword [dword_18467C]
        push byte 0
        movsx edx, word [byte eax+08h]
        movsx ecx, word [byte esi+0Eh]
        push byte 1
        movsx ebx, word [byte eax+06h]
        mov eax, unk_17D3E8
        push edx
        movsx edx, word [byte esi+0Ah]
        call DrawBox
        movsx eax, word [awscore]
        push eax
        push str_D13
        push unk_184692
        call sprintf_
        add esp, byte 0Ch
        push dword [dword_179920]
        call TextSetFont
        add esp, byte 4
        test byte [byte_17CA5D], 20h
        je short .6
        mov edx, 4
        jmp short .7
.6:
        mov edx, 0FFFFFFFFh
.7:
        mov eax, dword [dword_184680]
        movsx ebx, word [byte eax+06h]
        mov eax, dword [dword_18467C]
        add ebx, edx
        movsx edx, word [byte eax+0Ch]
        mov eax, unk_184692
        call DrawColorTextCentred
        push byte 0
        mov eax, dword [dword_184680]
        mov esi, dword [dword_18467C]
        push byte 0
        movsx edx, word [byte eax+0Ch]
        movsx ecx, word [byte esi+0Eh]
        push byte 1
        movsx ebx, word [byte eax+0Ah]
        mov eax, unk_17D3E8
        push edx
        movsx edx, word [byte esi+0Ah]
        call DrawBox
        push dword [dword_179918]
        call TextSetFont
        movzx edx, byte [byte_11D91D]
        add esp, byte 4
        movzx eax, byte [byte_11D91C]
        call SetTextColors
        test byte [byte_17CA5D], 20h
        je short .8
        mov edx, 5
        jmp short .9
.8:
        mov edx, 1
.9:
        mov eax, dword [dword_184680]
        movsx ebx, word [byte eax+0Ah]
        mov eax, dword [dword_18467C]
        add ebx, edx
        movsx edx, word [byte eax+0Ch]
        mov eax, 0A1h
        inc edx
        inc edx
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [awtmstruct]
        push eax
        push str_D13
        push unk_184692
        call sprintf_
        movzx edx, byte [byte_11FA2F]
        mov eax, dword [dword_184680]
        inc edx
        inc edx
        movsx ebx, word [byte eax+0Ch]
        mov eax, dword [dword_18467C]
        add esp, byte 0Ch
        sub ebx, edx
        movsx edx, word [byte eax+0Ch]
        mov eax, unk_184692
        call DrawColorTextCentred
        mov eax, dword [dword_184680]
        push byte 0
        movsx ebx, word [byte eax+012h]
        movzx eax, byte [byte_11FA2F]
        push byte 0
        add eax, ebx
        push byte 1
        add eax, byte 8
        push eax
        mov eax, dword [dword_18467C]
        movsx ecx, word [byte eax+016h]
        movsx edx, word [byte eax+010h]
        mov eax, unk_17D3E8
        call DrawBox
        push dword [dword_179918]
        call TextSetFont
        movzx edx, byte [byte_11D91D]
        add esp, byte 4
        movzx eax, byte [byte_11D91C]
        call SetTextColors
        movsx eax, word [gsp]
        cmp eax, byte 3
        jl short .10
        mov eax, 88h
        jmp short .13
.10:
        mov ax, word [gsp]
        cmp ax, 1
        jb short .14
        jbe short .11
        cmp ax, 2
        je short .12
        jmp short .14
.11:
        mov eax, 5Ah
        jmp short .13
.12:
        mov eax, 5Ch
.13:
        call GetLangText
        mov edx, eax
        mov eax, unk_184692
        call strcpy_
.14:
        mov eax, dword [dword_184680]
        movsx ebx, word [byte eax+012h]
        mov eax, dword [dword_18467C]
        movsx edx, word [byte eax+010h]
        movsx eax, word [byte eax+016h]
        add ebx, byte 4
        add edx, eax
        mov eax, unk_184692
        sar edx, 1
        call DrawColorTextCentred
        mov ebx, dword [dword_184680]
        mov edx, dword [dword_18467C]
        movsx eax, word [byte ebx+010h]
        movsx ecx, word [byte edx+08h]
        push eax
        movsx ebx, word [byte ebx+0Eh]
        movsx edx, word [byte edx+06h]
        mov eax, unk_17D3E8
        call FillBox
        push str_Intr
        push dword [FrontShapeFile]
        call FindShape
        mov esi, eax
        mov eax, dword [dword_184680]
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        mov eax, dword [dword_18467C]
        movsx eax, word [byte eax+06h]
        push eax
        push esi
        call DrawArt
        add esp, byte 0Ch
        push str_Sid1
        push dword [FrontShapeFile]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        movsx ebx, word [byte esi+0Eh]
        sub edx, ebx
        mov ebx, edx
        mov edx, dword [dword_184680]
        movsx edx, word [byte edx+0Eh]
        add esp, byte 8
        add edx, ebx
        push edx
        movsx ebx, word [byte eax+0Ch]
        movsx edx, word [byte esi+0Ch]
        sub ebx, edx
        mov edx, dword [dword_18467C]
        movsx edx, word [byte edx+06h]
        add edx, ebx
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        push str_Sid2
        push dword [FrontShapeFile]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        sub ebx, edx
        mov edx, dword [dword_184680]
        movsx edx, word [byte edx+0Eh]
        add esp, byte 8
        add edx, ebx
        push edx
        movsx ebx, word [byte esi+0Ch]
        movsx edx, word [byte eax+0Ch]
        sub edx, ebx
        mov ebx, edx
        mov edx, dword [dword_18467C]
        movsx edx, word [byte edx+06h]
        add ebx, edx
        push ebx
        push eax
        call DrawArt
        add esp, byte 0Ch
        push str_Bot1
        push dword [FrontShapeFile]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        movsx ebx, word [byte esi+0Eh]
        sub edx, ebx
        mov ebx, edx
        mov edx, dword [dword_184680]
        movsx edx, word [byte edx+0Eh]
        add esp, byte 8
        add edx, ebx
        push edx
        movsx ebx, word [byte eax+0Ch]
        movsx edx, word [byte esi+0Ch]
        sub ebx, edx
        mov edx, dword [dword_18467C]
        movsx edx, word [byte edx+06h]
        add edx, ebx
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        push str_Bot2
        push dword [FrontShapeFile]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        movsx ebx, word [byte esi+0Eh]
        sub edx, ebx
        mov ebx, edx
        mov edx, dword [dword_184680]
        movsx edx, word [byte edx+0Eh]
        add esp, byte 8
        add edx, ebx
        push edx
        movsx ebx, word [byte esi+0Ch]
        movsx edx, word [byte eax+0Ch]
        sub edx, ebx
        mov ebx, edx
        mov edx, dword [dword_18467C]
        movsx edx, word [byte edx+06h]
        add edx, ebx
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        push str_Bot3
        push dword [FrontShapeFile]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        sub ebx, edx
        mov edx, dword [dword_184680]
        movsx edx, word [byte edx+0Eh]
        add esp, byte 8
        add ebx, edx
        push ebx
        movsx edx, word [byte eax+0Ch]
        movsx ebx, word [byte esi+0Ch]
        sub edx, ebx
        mov ebx, edx
        mov edx, dword [dword_18467C]
        movsx edx, word [byte edx+06h]
        add edx, ebx
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        cmp word [word_11ED34], byte 0
        je short .16
        push str_Gam0
        push dword [FrontShapeFile]
        call FindShape
        mov ebx, 11h
        mov ecx, dword [dword_17CA5C]
        mov edx, dword [dword_184674]
        shl ecx, 12h
        add esp, byte 8
        shr ecx, 1Fh
        movsx edx, word [edx]
        shl ebx, cl
        movsx ecx, word [byte eax+04h]
        sub edx, ebx
        mov eax, dword [dword_184670]
        mov ebx, edx
        sar ecx, 1
        movsx edx, word [byte eax+04h]
        mov eax, 227h
        add edx, ecx
        call GetLangText
        call DrawColorTextCentred
        jmp short .16
.15:
        mov eax, 2
        mov dword [lineuptime], 1D6h
        call DrawOverlayPanels
.16:
        mov eax, dword [ReplayRemoteShape]
        mov dword [edi], eax
        jmp near RedrawInGameMenu_7D
.17:
        mov dword [edi], 0
        jmp near RedrawInGameMenu_7D
;-----------------------------------------------------------------------------
; RedrawInGameMenu                                A1F6C  96 PC, low confidence
; Draws the in-game menu frame and its items again
;-----------------------------------------------------------------------------
RedrawInGameMenu:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        call GetTicks
        sub eax, byte 6
        mov dword [dword_11ED30], eax
        lea eax, [byte ebp-04h]
        call DrawInGameMenuFrame
        cmp dword [gameresult], byte 1
        je short .3
        xor edi, edi
        xor esi, esi
        jmp short .2
.1:
        push dword [dword esi+dword_184436]
        add esi, byte 66h
        push dword [dword esi+byte_1843CC]
        push dword [dword esi+dword_1843C0]
        inc edi
        call DrawArt
        add esp, byte 0Ch
.2:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        sete al
        movzx eax, al
        add eax, byte 5
        cmp edi, eax
        jl short .1
.3:
        call SetScreenTarget
        push byte 0
        mov esi, dword [byte ebp-04h]
        push byte 0
        push dword [byte esi+02Ch]
        call PutBlock
        add esp, byte 0Ch
RedrawInGameMenu_7C:
        leave
RedrawInGameMenu_7D:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; OpenFrontEndFromGame                         A1FEF  96 PC, medium confidence
; Leaves the game view for a front-end screen: fade, free the speech buffer,
; load the front-end art (FhiL / FhiR), screen mode
;-----------------------------------------------------------------------------
OpenFrontEndFromGame:
        push ebx
        push ecx
        push edx
        mov eax, 2
        call FadeOut
        push byte 0
        push byte 0
        push dword [dword_1843FC]
        push dword [dword_1843F8]
        push dword [dword_184404]
        push dword [dword_184400]
        xor eax, eax
        call SetGameBackdrop
        call ResetInputSlots
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call FreeSpeechBuffer
        push str_FhiL3
        push dword [dword_1150D4]
        call FindShape
        add esp, byte 8
        push str_FhiR3
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call FindShape
        add esp, byte 8
        mov dword [MenuRemoteCursorArt], eax
        test byte [byte_17CA5D], 20h
        jne short .1
        push dword [MenuCursorPixels]
        call FreeMemBlock
        add esp, byte 4
        push dword [MenuBitmapPixels]
        call FreeMemBlock
        add esp, byte 4
        mov edx, 20h
        mov eax, dword [dword_152F58]
        call CopyBitmap
        mov edx, 20h
        mov dword [MenuCursorPixels], eax
        mov eax, dword [MenuRemoteCursorArt]
        call CopyBitmap
        mov dword [MenuBitmapPixels], eax
.1:
        call LoadFrontEndArt
        test byte [byte_17CA5D], 20h
        jne short .2
        mov eax, 1
        call SetScreenMode
.2:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ReturnToGameView                             A20D1  96 PC, medium confidence
; Back from a front-end screen into the game view: fade, free the front-end
; art, restore the speech buffer and the controllers, screen mode (GloL /
; GloR, GhiL / GhiR)
;-----------------------------------------------------------------------------
ReturnToGameView:
        push ebx
        push ecx
        push edx
        mov eax, 3
        call FadeOut
        call FreeFrontEndArt
        call RestoreSpeechBuffer
        test byte [byte_17CA5D], 20h
        jne short .1
        push dword [MenuCursorPixels]
        call FreeMemBlock
        add esp, byte 4
        push dword [MenuBitmapPixels]
        call FreeMemBlock
        add esp, byte 4
        push str_GloL2
        push dword [dword_1150D4]
        call FindShape
        add esp, byte 8
        push str_GloR2
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call FindShape
        mov edx, 20h
        add esp, byte 8
        mov dword [MenuRemoteCursorArt], eax
        mov eax, dword [dword_152F58]
        call CopyBitmap
        mov edx, 20h
        mov dword [MenuCursorPixels], eax
        mov eax, dword [MenuRemoteCursorArt]
        call CopyBitmap
        mov dword [MenuBitmapPixels], eax
        jmp short .2
.1:
        push str_GhiL2
        push dword [dword_1150D4]
        call FindShape
        add esp, byte 8
        push str_GhiR2
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call FindShape
        add esp, byte 8
        mov dword [MenuRemoteCursorArt], eax
.2:
        mov eax, exhstate
        call SetScreenPalette
        call InitSlotTable
        call RefreshControlSlots
        test byte [byte_17CA5D], 20h
        jne short .3
        xor eax, eax
        call SetScreenMode
.3:
        push byte 0
        push byte 0
        push dword [dword_1843FC]
        push dword [dword_1843F8]
        mov eax, DrawInGameMenuFrame
        push dword [dword_184404]
        mov ebx, 2
        push dword [dword_184400]
        mov edx, exhstate
        call SetGameBackdrop
        call RedrawInGameMenu
        xor eax, eax
        call FadePalette
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; InGameReturnMenu                                A21FB  96 PC, low confidence
; The small return menu (ret0-2, gam0-1, ply0-1) in a link game, kept in step
; with the other side (LinkSync)
;-----------------------------------------------------------------------------
InGameReturnMenu:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1C4h, 0
        sub ebp, 82h
        mov word [word_11ED34], 1
        call GetTicks
        sub eax, byte 6
        mov dword [dword_11ED30], eax
        lea eax, [byte ebp+072h]
        lea edx, [dword ebp-0142h]
        call DrawInGameMenuFrame
        mov eax, 3
        call InitMenuItems
        push str_Ret0
        push dword [FrontShapeFile]
        call FindShape
        add esp, byte 8
        push str_Ret1
        push dword [FrontShapeFile]
        mov dword [dword ebp-0128h], eax
        call FindShape
        add esp, byte 8
        push str_Ret2
        push dword [FrontShapeFile]
        mov dword [dword ebp-0124h], eax
        call FindShape
        mov dword [dword ebp-0120h], eax
        mov eax, dword [dword_184408]
        add eax, byte 40h
        mov dword [dword ebp-012Eh], eax
        mov eax, dword [dword ebp-0128h]
        mov dword [dword ebp-0132h], 3
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-011Ch], eax
        mov eax, dword [dword ebp-0128h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0118h], eax
        mov eax, dword [dword ebp-0128h]
        movsx eax, word [byte eax+04h]
        add esp, byte 8
        sar eax, 2
        mov edx, dword [dword ebp-011Ch]
        lea eax, [eax+eax*2]
        push dword [dword ebp-0118h]
        add edx, eax
        mov eax, dword [dword ebp-0128h]
        mov dword [dword ebp-0108h], edx
        push dword [dword ebp-011Ch]
        movsx eax, word [byte eax+06h]
        mov edx, dword [dword ebp-0118h]
        sar eax, 1
        push dword [dword ebp-0128h]
        add edx, eax
        mov byte [dword ebp-0100h], 2
        mov dword [dword ebp-0104h], edx
        call DrawArt
        add esp, byte 0Ch
        push str_Gam0
        push dword [FrontShapeFile]
        call FindShape
        add esp, byte 8
        push str_Gam1
        push dword [FrontShapeFile]
        mov dword [dword ebp-0C2h], eax
        call FindShape
        mov dword [dword ebp-0BEh], eax
        mov eax, dword [dword_184670]
        mov edi, 0FFFFFFFFh
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push str_Ply02
        mov dword [byte ebp-0Eh], eax
        mov eax, dword [dword_184674]
        push dword [FrontShapeFile]
        movsx eax, word [eax]
        mov byte [dword ebp-099h], 2
        mov byte [dword ebp-097h], 0
        mov dword [byte ebp-0Ah], eax
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-05Ch], eax
        push str_Ply1
        push dword [FrontShapeFile]
        call FindShape
        mov dword [byte ebp-058h], eax
        mov eax, dword [dword_184670]
        movsx eax, word [byte eax+04h]
        mov dword [byte ebp+07Eh], 1
        mov dword [byte ebp+032h], eax
        mov eax, dword [dword_184674]
        mov esi, 66h
        add esp, byte 8
        movsx eax, word [byte eax+02h]
        mov byte [byte ebp-034h], 1
        mov byte [byte ebp-033h], 0
        mov dword [byte ebp+036h], eax
        lea eax, [byte ebp-0Eh]
        mov byte [byte ebp-031h], 0
        mov dword [byte ebp+07Ah], eax
.1:
        mov eax, dword [byte ebp+07Eh]
        mov edx, dword [dword esi+ebp-0128h]
        shl eax, 6
        movsx ebx, word [byte edx+04h]
        add ebx, dword [byte eax+ebp-04Eh]
        mov dword [byte eax+ebp-046h], ebx
        mov ebx, dword [byte eax+ebp-04Ah]
        mov dword [byte eax+ebp-042h], ebx
        mov ebx, dword [byte eax+ebp-046h]
        mov dword [byte eax+ebp-03Eh], ebx
        movsx edx, word [byte edx+06h]
        add edx, dword [byte eax+ebp-04Ah]
        mov dword [byte eax+ebp-03Ah], edx
        mov edx, dword [byte eax+ebp-04Eh]
        mov dword [byte eax+ebp-036h], edx
        mov edx, dword [byte eax+ebp-03Ah]
        mov dword [dword esi+ebp-0132h], 4
        mov dword [byte eax+ebp-032h], edx
        mov edx, dword [byte ebp+07Ah]
        mov dword [dword esi+ebp-012Eh], edx
        mov edx, dword [byte eax+ebp-04Eh]
        mov eax, dword [byte eax+ebp-04Ah]
        mov dword [dword esi+ebp-0118h], eax
        mov eax, dword [dword esi+ebp-0128h]
        mov dword [dword esi+ebp-011Ch], edx
        movsx eax, word [byte eax+04h]
        add esi, byte 66h
        sar eax, 1
        add eax, dword [dword esi+ebp-0182h]
        mov dword [dword esi+ebp-016Eh], eax
        mov eax, dword [dword esi+ebp-018Eh]
        inc dword [byte ebp+07Eh]
        add dword [byte ebp+07Ah], byte 40h
        movsx eax, word [byte eax+06h]
        push dword [dword esi+ebp-017Eh]
        sar eax, 1
        push dword [dword esi+ebp-0182h]
        add eax, dword [dword esi+ebp-017Eh]
        push dword [dword esi+ebp-018Eh]
        mov dword [dword esi+ebp-016Ah], eax
        call DrawArt
        add esp, byte 0Ch
        cmp dword [byte ebp+07Eh], byte 3
        jl near .1
        call SetScreenTarget
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        push byte 0
        mov eax, dword [byte ebp+072h]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [dword_11F5C4]
        push dword [dword_11F5C0]
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
        mov edx, dword [dword ebp-0104h]
        mov eax, dword [dword ebp-0108h]
        call SetMenuMouse
        xor eax, eax
        mov dword [byte ebp+076h], 0
        call LinkSync
.2:
        call SoundIdle
        cmp dword [byte ebp+076h], byte 0
        jl short .4
        cmp dword [byte ebp+076h], byte 3
        jge short .4
        imul eax, dword [byte ebp+076h], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0108h]
        jne short .3
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0104h]
        je short .4
.3:
        mov dword [byte ebp+076h], 0FFFFFFFFh
.4:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        or al, 2
        cwde
        push eax
        mov ebx, 0FFFFFFFFh
        push byte 0
        lea eax, [byte ebp+076h]
        lea edx, [dword ebp-0142h]
        push eax
        xor ecx, ecx
        mov eax, 3
        call RunMenu
        cmp dword [byte ebp+076h], byte 1
        jb short .5
        jbe short .6
        cmp dword [byte ebp+076h], byte 2
        je short .7
        jmp short .8
.5:
        cmp dword [byte ebp+076h], byte 0
        jne short .8
        call RedrawInGameMenu
        xor edi, edi
        jmp short .8
.6:
        mov edi, 1
        jmp short .8
.7:
        mov edi, 2
.8:
        cmp edi, byte 0FFFFFFFFh
        je near .2
        mov word [word_11ED34], 0
        mov eax, edi
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near RedrawInGameMenu_7D
jpt_A25B5:
        dd InGameMenu_ABD
        dd InGameMenu_A9C
        dd InGameMenu_D17
        dd InGameMenu_F31
        dd InGameMenu_F42
        dd InGameMenu_FA8
;-----------------------------------------------------------------------------
; InGameMenu                                                      A25CD  96 PC
; The in-game menu RunInGameMenu opens: quit (qui0-2), return (ret0-2) and
; the other items (INTERREG), stops the crowd and speech, runs the front-end
; screens in a game (stats, edit lines, player cards)
;-----------------------------------------------------------------------------
InGameMenu:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 30h, 0
        mov eax, 3
        call FadeOut
        call GetCrowdTarget
        mov dword [byte ebp-014h], eax
        xor eax, eax
        call SetCrowdTarget
        call StopAllSfx
        mov eax, 50h
        call CrowdFadeOut
        mov eax, 50h
        mov dword [byte ebp-08h], 0FFFFFFFFh
        call StopArenaClip
        call SpeechBusy
        test eax, eax
        je short .1
        call StopSpeech
.1:
        call GetTicks
        lea esi, [byte eax+050h]
.2:
        call GetTicks
        cmp esi, eax
        jle short .3
        call SoundIdle
        jmp short .2
.3:
        call FreeSpriteCache
        call FreeTotalSprites
        call FreeFightSprites
        call FreeColourLookup
        call EndGameSound
        cmp dword [gameresult], byte 1
        setne al
        movzx eax, al
        xor edx, edx
        call LoadStandsArt
        xor eax, eax
        call SetPenaltyBoxDoor
        mov eax, 1
        xor edx, edx
        call SetPenaltyBoxDoor
        mov eax, exhstate
        mov edx, 0FFFFFFFFh
        call SetScreenPalette
        mov eax, 9
        call CloseTextOverlay
        mov eax, 15Eh
        call Crowd_Noise
        xor edx, edx
.4:
        mov eax, 5
        add edx, byte 5
        call UpdateCamera
        cmp edx, 15Eh
        jl short .4
        mov dword [dword_11D91F], 1
        movsx ax, byte [byte_1175A4]
        mov byte [byte_1175A4], 1
        mov word [byte ebp-030h], ax
        movsx ax, byte [byte_1175A5]
        mov byte [byte_1175A5], 1
        mov word [byte ebp-02Eh], ax
        movsx ax, byte [byte_1175A9]
        mov byte [byte_1175A9], 1
        mov word [byte ebp-02Ch], ax
        movsx ax, byte [byte_1175A8]
        mov byte [byte_1175A8], 1
        mov word [byte ebp-02Ah], ax
        movsx ax, byte [byte_1175A6]
        mov byte [byte_1175A6], 1
        mov word [byte ebp-028h], ax
        movsx ax, byte [byte_1175A7]
        mov byte [byte_1175A7], 1
        mov word [byte ebp-026h], ax
        mov ax, word [dword_11B330]
        mov dword [dword_11B330], 8
        mov word [byte ebp-024h], ax
        call SetGameViewSize
        push byte 20h
        push dword 180h
        push str_INTERREG
        call AllocMemBlock
        mov dword [dword_184408], eax
        mov eax, dword [ReplayRemoteShape]
        add esp, byte 0Ch
        mov eax, dword [byte eax+02Ch]
        push byte 0
        movsx edx, word [byte eax+06h]
        push edx
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [dword_184684], eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 81h
        call ClearClipRect
        add esp, byte 4
        call DrawRinkView
        test byte [byte_17CA5D], 20h
        je short .5
        mov dword [dword_18467C], unk_11D7D4
        mov dword [dword_184680], unk_11D7EC
        mov dword [dword_184670], unk_11D810
        mov ecx, 80h
        mov esi, unk_11D89C
        mov edi, dword [dword_184408]
        mov dword [dword_184674], unk_11D816
        rep movsb
        mov dword [dword_184678], 87AEh
        jmp short .6
.5:
        mov dword [dword_18467C], unk_11D7A4
        mov dword [dword_184680], unk_11D7BC
        mov dword [dword_184670], unk_11D804
        mov ecx, 80h
        mov esi, unk_11D81C
        mov edi, dword [dword_184408]
        mov dword [dword_184674], unk_11D80A
        rep movsb
        mov dword [dword_184678], 3D70h
.6:
        call LoadZamboni
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        cmp dword [gameresult], byte 1
        jne near .13
        mov ax, word [hmscore]
        cmp ax, word [awscore]
        jle short .7
        mov ecx, 1
        jmp short .9
.7:
        jge short .8
        xor ecx, ecx
        jmp short .9
.8:
        mov ecx, 0FFFFFFFFh
.9:
        mov dword [byte ebp-0Ch], 0
        mov esi, dword [gameopts]
        xor eax, eax
        xor ebx, ebx
.10:
        movsx edx, word [byte esi+ebx+09h]
        cmp edx, byte 1
        je short .11
        movsx edx, byte [byte esi+eax+05h]
        cmp edx, ecx
        jne short .11
        mov dword [byte ebp-0Ch], 1
.11:
        inc eax
        inc ebx
        inc ebx
        cmp eax, byte 4
        jl short .10
        cmp dword [byte ebp-0Ch], byte 0
        je short .12
        mov eax, 48h
        jmp short .14
.12:
        mov eax, 43h
        jmp short .14
.13:
        mov eax, 44h
.14:
        call QueueMusic
        mov eax, 4
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, dword [dword_11F5C0]
        add eax, byte 0Ah
        mov dword [dword_184400], eax
        mov eax, dword [dword_11F5C4]
        add eax, byte 0Ah
        mov dword [dword_184404], eax
        mov eax, dword [dword_11F5C0]
        add eax, byte 14h
        mov dword [dword_1843F8], eax
        mov eax, dword [dword_11F5C4]
        add eax, byte 14h
        mov edx, unk_18440C
        mov dword [dword_1843FC], eax
        mov eax, 6
        call InitMenuItems
        cmp dword [gameresult], byte 1
        jne near .15
        mov eax, dword [dword_184408]
        mov dword [dword_18441C], 4
        mov dword [dword_184420], eax
        mov dword [byte eax+018h], 0
        mov edx, dword [byte eax+018h]
        mov eax, dword [dword_184408]
        mov dword [eax], edx
        mov eax, dword [dword_184408]
        mov dword [byte eax+0Ch], 0
        mov edx, dword [byte eax+0Ch]
        mov eax, dword [dword_184408]
        mov dword [byte eax+04h], edx
        mov edx, dword [dword_11F5C0]
        mov eax, dword [dword_184408]
        dec edx
        mov dword [byte eax+010h], edx
        mov eax, dword [dword_184408]
        mov dword [byte eax+08h], edx
        mov edx, dword [dword_11F5C4]
        mov eax, dword [dword_184408]
        dec edx
        mov dword [byte eax+01Ch], edx
        mov eax, dword [dword_184408]
        mov dword [byte eax+014h], edx
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        mov dword [dword_184446], eax
        mov eax, dword [dword_11F5C4]
        sar eax, 1
        mov edx, dword [dword_11F5C4]
        mov dword [dword_18444A], eax
        mov eax, dword [dword_11F5C0]
        sub edx, byte 0Ah
        sub eax, byte 0Ah
        call SetMenuMouse
        jmp near .21
.15:
        push str_Qui0
        push dword [FrontShapeFile]
        call FindShape
        add esp, byte 8
        push str_Qui1
        push dword [FrontShapeFile]
        mov dword [dword_184426], eax
        call FindShape
        add esp, byte 8
        push str_Qui2
        push dword [FrontShapeFile]
        mov dword [dword_18442A], eax
        call FindShape
        mov dword [dword_18442E], eax
        mov eax, dword [dword_184408]
        mov dword [dword_184420], eax
        mov eax, dword [dword_184426]
        mov dword [dword_18441C], 3
        movsx edx, word [byte eax+0Ch]
        mov dword [dword_184432], edx
        movsx edx, word [byte eax+0Eh]
        mov dword [dword_184436], edx
        movsx edx, word [byte eax+04h]
        mov ebx, dword [dword_184432]
        sar edx, 2
        add esp, byte 8
        add edx, ebx
        push str_Ret0
        mov dword [dword_184446], edx
        push dword [FrontShapeFile]
        movsx eax, word [byte eax+06h]
        mov edx, dword [dword_184436]
        sar eax, 1
        mov byte [byte_184451], 1
        add eax, edx
        mov byte [byte_18444E], 3
        mov dword [dword_18444A], eax
        call FindShape
        add esp, byte 8
        push str_Ret1
        push dword [FrontShapeFile]
        mov dword [dword_18448C], eax
        call FindShape
        add esp, byte 8
        push str_Ret2
        push dword [FrontShapeFile]
        mov dword [dword_184490], eax
        call FindShape
        mov dword [dword_184494], eax
        mov eax, dword [dword_184408]
        add eax, byte 40h
        mov dword [dword_184486], eax
        mov eax, dword [dword_18448C]
        mov dword [dword_184482], 3
        movsx edx, word [byte eax+0Ch]
        mov dword [dword_184498], edx
        movsx edx, word [byte eax+0Eh]
        mov dword [dword_18449C], edx
        movsx edx, word [byte eax+04h]
        sar edx, 2
        lea ebx, [edx+edx*2]
        mov edx, dword [dword_184498]
        add edx, ebx
        mov dword [dword_1844AC], edx
        movsx edx, word [byte eax+06h]
        mov eax, dword [dword_18449C]
        sar edx, 1
        add eax, edx
        mov dword [dword_1844B0], eax
        mov ax, word [word_114CE0]
        xor ah, ah
        add esp, byte 8
        and al, 1
        mov byte [byte_1844B4], 4
        cwde
        mov byte [byte_1844B6], 0
        test eax, eax
        je short .16
        push str_Cht0
        push dword [FrontShapeFile]
        call FindShape
        add esp, byte 8
        push str_Cht1
        jmp short .17
.16:
        push str_Edt0
        push dword [FrontShapeFile]
        call FindShape
        add esp, byte 8
        push str_Edt1
.17:
        push dword [FrontShapeFile]
        mov dword [dword_1844F2], eax
        call FindShape
        add esp, byte 8
        mov dword [dword_1844F6], eax
        mov eax, dword [dword_184670]
        movsx edx, word [byte eax+04h]
        mov eax, dword [dword_184408]
        mov dword [dword eax+080h], edx
        mov eax, dword [dword_184674]
        movsx edx, word [eax]
        mov eax, dword [dword_184408]
        push str_Ctr0
        mov dword [dword eax+084h], edx
        push dword [FrontShapeFile]
        mov byte [byte_18451B], 4
        call FindShape
        add esp, byte 8
        push str_Ctr1
        push dword [FrontShapeFile]
        mov dword [dword_184558], eax
        call FindShape
        mov dword [dword_18455C], eax
        mov eax, dword [dword_184670]
        movsx edx, word [eax]
        mov eax, dword [dword_184408]
        mov dword [dword eax+0C0h], edx
        mov eax, dword [dword_184674]
        movsx edx, word [byte eax+02h]
        mov eax, dword [dword_184408]
        add esp, byte 8
        mov dword [dword eax+0C4h], edx
        push str_Sts0
        mov byte [byte_184583], 4
        mov byte [byte_184580], 2
        push dword [FrontShapeFile]
        mov byte [byte_184581], 0
        call FindShape
        add esp, byte 8
        push str_Sts1
        push dword [FrontShapeFile]
        mov dword [dword_1845BE], eax
        call FindShape
        mov dword [dword_1845C2], eax
        mov eax, dword [dword_184670]
        movsx edx, word [byte eax+02h]
        mov eax, dword [dword_184408]
        mov dword [dword eax+0100h], edx
        mov eax, dword [dword_184674]
        movsx edx, word [byte eax+02h]
        mov eax, dword [dword_184408]
        mov dword [dword eax+0104h], edx
        mov ax, word [word_114CE0]
        add esp, byte 8
        xor ah, ah
        mov byte [byte_1845E8], 3
        and al, 1
        mov byte [byte_1845E6], 2
        cwde
        mov byte [byte_1845E7], 1
        test eax, eax
        jne short .18
        push str_Sav0
        push dword [FrontShapeFile]
        call FindShape
        add esp, byte 8
        push str_Sav1
        push dword [FrontShapeFile]
        mov dword [dword_184624], eax
        call FindShape
        mov dword [dword_184628], eax
        mov eax, dword [dword_184670]
        movsx edx, word [byte eax+04h]
        mov eax, dword [dword_184408]
        mov dword [dword eax+0140h], edx
        mov eax, dword [dword_184674]
        movsx edx, word [byte eax+04h]
        mov eax, dword [dword_184408]
        mov dword [dword eax+0144h], edx
        add esp, byte 8
        mov byte [byte_18464C], 4
        mov byte [byte_18464E], 0
        mov byte [byte_18464F], 1
        mov byte [byte_184451], 5
        mov byte [byte_1844B6], 5
.18:
        mov ecx, 2
        mov edx, 80h
        mov eax, 0CCh
        jmp near .20
.19:
        mov ebx, dword [dword eax+dword_184426]
        mov esi, dword [dword_184408]
        movsx ebx, word [byte ebx+04h]
        add ebx, dword [edx+esi]
        mov dword [byte edx+esi+08h], ebx
        mov esi, dword [dword_184408]
        mov ebx, dword [byte edx+esi+04h]
        mov dword [byte edx+esi+0Ch], ebx
        mov esi, dword [dword_184408]
        mov ebx, dword [byte edx+esi+08h]
        mov dword [byte edx+esi+010h], ebx
        mov ebx, dword [dword eax+dword_184426]
        mov esi, dword [dword_184408]
        movsx ebx, word [byte ebx+06h]
        add ebx, dword [byte edx+esi+04h]
        mov dword [byte edx+esi+014h], ebx
        mov esi, dword [dword_184408]
        mov ebx, dword [edx+esi]
        mov dword [byte edx+esi+018h], ebx
        mov esi, dword [dword_184408]
        mov ebx, dword [byte edx+esi+014h]
        mov dword [byte edx+esi+01Ch], ebx
        mov esi, dword [dword_184408]
        mov dword [dword eax+dword_18441C], 4
        add esi, edx
        mov dword [dword eax+dword_184420], esi
        mov ebx, dword [esi]
        mov dword [dword eax+dword_184432], ebx
        mov ebx, dword [byte esi+04h]
        mov dword [dword eax+dword_184436], ebx
        mov ebx, dword [dword eax+dword_184426]
        movsx ebx, word [byte ebx+04h]
        sar ebx, 1
        add ebx, dword [dword eax+dword_184432]
        mov dword [dword eax+dword_184446], ebx
        mov ebx, dword [dword eax+dword_184426]
        movsx ebx, word [byte ebx+06h]
        add eax, byte 66h
        sar ebx, 1
        inc ecx
        add ebx, dword [dword eax+dword_1843D0]
        add edx, byte 40h
        mov dword [dword eax+dword_1843E4], ebx
.20:
        mov bx, word [word_114CE0]
        xor bh, bh
        and bl, 1
        movsx ebx, bx
        test ebx, ebx
        sete bl
        movzx ebx, bl
        add ebx, byte 5
        cmp ecx, ebx
        jl near .19
        push dword [dword_11F5C4]
        push dword [dword_11F5C0]
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
        mov edx, dword [dword_1844B0]
        mov eax, dword [dword_1844AC]
        call SetMenuMouse
        mov dword [byte ebp-018h], 1
.21:
        push byte 0
        push byte 0
        push dword [dword_1843FC]
        push dword [dword_1843F8]
        mov eax, DrawInGameMenuFrame
        push dword [dword_184404]
        mov ebx, 2
        push dword [dword_184400]
        mov edx, exhstate
        call SetGameBackdrop
        call PlayMusic
        call RedrawInGameMenu
        xor eax, eax
        call FadePalette
        call GetTicks
        dec eax
        mov dword [dword_11ED30], eax
        mov eax, 1
        call LinkSync
        cmp word [word_114F14], byte 0
        jne short .24
        movsx eax, word [awscore]
        push eax
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        shl edx, 0Ah
        shr edx, 1Bh
        mov eax, dword [byte eax+01h]
        push edx
        movsx edx, word [hmscore]
        shl eax, 0Fh
        push edx
        shr eax, 1Bh
        push eax
        cmp dword [gameresult], byte 1
        jne short .22
        mov eax, 0FFFFFFFFh
        jmp short .23
.22:
        mov eax, dword [curperiod]
        dec eax
.23:
        push eax
        push dword 400h
        call PaEvent
        add esp, byte 18h
        jmp short .25
.24:
        mov word [word_114F14], 0
.25:
        cmp dword [gameresult], byte 1
        jne near .39
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 20h
        jne near .39
        call HomeClinchesSeries
        test eax, eax
        jne short .26
        call AwayClinchesSeries
        test eax, eax
        je near .39
.26:
        mov eax, dword [dword_17CF92]
        cmp eax, byte 20h
        jb short .28
        jbe short .32
        cmp eax, 80h
        jb short .27
        jbe near .34
        cmp eax, 100h
        je near .35
        jmp near .36
.27:
        cmp eax, byte 40h
        je short .33
        jmp short .36
.28:
        cmp eax, byte 8
        jb short .29
        jbe short .30
        cmp eax, byte 10h
        je short .31
        jmp short .36
.29:
        cmp eax, byte 4
        jne short .36
        mov dword [byte ebp-04h], 0
        jmp short .36
.30:
        mov dword [byte ebp-04h], 1
        jmp short .36
.31:
        mov dword [byte ebp-04h], 2
        jmp short .36
.32:
        mov dword [byte ebp-04h], 3
        jmp short .36
.33:
        mov dword [byte ebp-04h], 4
        jmp short .36
.34:
        mov dword [byte ebp-04h], 5
        jmp short .36
.35:
        mov dword [byte ebp-04h], 6
.36:
        call HomeClinchesSeries
        test eax, eax
        je short .37
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        jmp short .38
.37:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
.38:
        push dword [byte ebp-04h]
        shr eax, 1Bh
        push eax
        push dword 800h
        call PaEvent
        add esp, byte 0Ch
.39:
        call SoundIdle
        cmp dword [byte ebp-018h], byte 0
        jl short .41
        cmp dword [byte ebp-018h], byte 6
        jge short .41
        imul eax, dword [byte ebp-018h], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+dword_184446]
        jne short .40
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+dword_18444A]
        je short .41
.40:
        mov dword [byte ebp-018h], 0FFFFFFFFh
.41:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        or al, 2
        cwde
        push eax
        push byte 0
        lea eax, [byte ebp-018h]
        xor ecx, ecx
        push eax
        cmp dword [gameresult], byte 1
        jne short .42
        mov eax, 5DCh
        jmp short .43
.42:
        mov eax, 0FFFFFFFFh
.43:
        mov edx, unk_18440C
        mov ebx, eax
        jne short .44
        mov eax, 1
        jmp short .45
.44:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        sete al
        movzx eax, al
        add eax, byte 5
.45:
        call RunMenu
        cmp dword [byte ebp-018h], byte 0FFFFFFFCh
        jne short InGameMenu_A9C.46
InGameMenu_A9C:
        mov dword [byte ebp-08h], 1
        jmp near InGameMenu_ABD.50
.46:
        cmp dword [byte ebp-018h], byte 5
        ja near InGameMenu_ABD.50
        mov eax, dword [byte ebp-018h]
        jmp dword [nosplit cs:eax*4+jpt_A25B5]
InGameMenu_ABD:
        cmp dword [gameresult], byte 1
        je short InGameMenu_A9C
        call RedrawInGameMenu
        push byte 0
        push byte 0
        push dword [dword_1843FC]
        push dword [dword_1843F8]
        push dword [dword_184404]
        push dword [dword_184400]
        xor eax, eax
        call SetGameBackdrop
        mov eax, 2
        call GetLangText
        mov dword [byte ebp-020h], eax
        mov eax, 3
        call GetLangText
        mov dword [byte ebp-01Ch], eax
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        or al, 2
        cwde
        push eax
        mov eax, dword [dword_11F5C4]
        push byte 1
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        push eax
        mov ecx, byte_11D91C
        lea ebx, [byte ebp-020h]
        push byte 0
        mov eax, 54h
        mov edx, 2
        call GetLangText
        call MessageBox
        test eax, eax
        jne short .47
        mov dword [byte ebp-08h], eax
.47:
        push byte 0
        push byte 0
.48:
        push dword [dword_1843FC]
        push dword [dword_1843F8]
        push dword [dword_184404]
        push dword [dword_184400]
        mov eax, DrawInGameMenuFrame
        call SetGameBackdrop
.49:
        call RedrawInGameMenu
.50:
        cmp dword [byte ebp-08h], byte 0
        jl near InGameMenu.39
        push byte 0
        push byte 0
        push dword [dword_1843FC]
        push dword [dword_1843F8]
        push dword [dword_184404]
        push dword [dword_184400]
        xor eax, eax
        call SetGameBackdrop
        push dword [ReplayRemoteShape]
        call SetDrawBitmap
        add esp, byte 4
        push dword [dword_184684]
        call FreeBitmap
        add esp, byte 4
        push dword [dword_184408]
        call FreeMemBlock
        add esp, byte 4
        call FreeZamboni
        mov eax, 1
        call LinkSync
        mov eax, 3
        call FadeOut
        call FreeColourLookup
        call SetScreenTarget
        push byte 0
        call ClearClipRect
        add esp, byte 4
        cmp dword [gameresult], byte 1
        je short .51
        mov eax, 64h
        xor edx, edx
        call FadeOutMusic
        call StopMusic
.51:
        call StopSpeech
        mov al, byte [byte ebp-030h]
        mov byte [byte_1175A4], al
        mov al, byte [byte ebp-02Eh]
        mov byte [byte_1175A5], al
        mov al, byte [byte ebp-02Ch]
        mov byte [byte_1175A9], al
        mov al, byte [byte ebp-02Ah]
        mov byte [byte_1175A8], al
        mov al, byte [byte ebp-028h]
        mov byte [byte_1175A6], al
        mov al, byte [byte ebp-026h]
        mov byte [byte_1175A7], al
        movsx eax, word [byte ebp-024h]
        mov dword [dword_11D91F], 0
        mov dword [dword_11B330], eax
        call SetGameViewSize
        cmp dword [byte ebp-08h], byte 0
        je near .53
        cmp dword [gameresult], byte 1
        je near .53
        call FreeSpriteCache
        call StartGameSound
        call LoadFightSprites
        call LoadTotalSprites
        mov eax, 2
        call LoadStandsArt
        xor eax, eax
        call AddIceCrud
        mov eax, exhstate
        call SetScreenPalette
        mov eax, 1
        call LinkSync
        mov eax, dword [byte ebp-014h]
        xor edx, edx
        call CrowdNoiseReset
.52:
        mov dword [dword_11D3A6], 0
        mov eax, 2
        inc edx
        call sfx
        cmp edx, byte 0Ah
        jl short .52
        mov eax, 9
        call EndCameraShot
        mov eax, 1
        call DrawGameFrame
        mov eax, 7Fh
        call Crowd_Noise
        mov eax, 7Fh
        call CrowdReaction
        mov dword [fadeinpending], 1
        inc dword [curperiod]
.53:
        mov eax, dword [byte ebp-08h]
        jmp near RedrawInGameMenu_7C
InGameMenu_D17:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .54
        call RedrawInGameMenu
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov ecx, 30h
        mov ebx, 7Eh
        push byte 0
        mov edx, 1Bh
        xor eax, eax
        call ModemChat
        jmp near InGameMenu_ABD.49
.54:
        xor edx, edx
        xor ebx, ebx
        xor edi, edi
.55:
        mov ecx, dword [gameopts]
        mov dword [byte ebp-010h], ecx
        movsx ecx, word [byte ecx+edi+09h]
        cmp ecx, byte 1
        je short .57
        mov esi, dword [byte ebp-010h]
        cmp byte [byte esi+ebx+05h], 0
        je short .56
        inc eax
        jmp short .57
.56:
        inc edx
.57:
        inc ebx
        inc edi
        inc edi
        cmp ebx, byte 4
        jl short .55
        test eax, eax
        jne short .58
        test edx, edx
        je near .69
.58:
        test eax, eax
        je short .59
        test edx, edx
        jne short .65
.59:
        mov dword [dword_1843B0], 3
        test eax, eax
        je short .60
        mov eax, dword [gameopts]
        mov dword [dword_1843AC], 0
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        jmp short .61
.60:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        mov dword [dword_1843AC], 1
.61:
        mov dword [dword_1843B4], eax
.62:
        call OpenFrontEndFromGame
        call LoadModeStats
        mov eax, 1
        call RunEditLines
.63:
        call FreeStatsTables
.64:
        call ReturnToGameView
        jmp near InGameMenu_ABD.50
.65:
        call RedrawInGameMenu
        push byte 0
        push byte 0
        push dword [dword_1843FC]
        push dword [dword_1843F8]
        push dword [dword_184404]
        push dword [dword_184400]
        xor eax, eax
        call SetGameBackdrop
        mov eax, 1
        call GetLangText
        mov dword [byte ebp-020h], eax
        mov eax, 14Ch
        call GetLangText
        mov dword [byte ebp-01Ch], eax
        mov eax, 14Dh
        call GetLangText
        push byte 2
        mov dword [byte ebp-018h], eax
        mov eax, dword [dword_11F5C4]
        push byte 0
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        push eax
        mov ecx, byte_11D91C
        lea ebx, [byte ebp-020h]
        push byte 0
        mov eax, 14Bh
        mov edx, 3
        call GetLangText
        call MessageBox
        mov dword [dword_1843AC], eax
        test eax, eax
        je short .68
        mov dword [dword_1843B0], 3
        cmp eax, byte 2
        jne short .66
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        jmp short .67
.66:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
.67:
        shr eax, 1Bh
        mov dword [dword_1843B4], eax
        dec dword [dword_1843AC]
        jmp near .62
.68:
        push eax
        push eax
        jmp near InGameMenu_ABD.48
.69:
        call RedrawInGameMenu
        push edx
        push edx
        push dword [dword_1843FC]
        push dword [dword_1843F8]
        push dword [dword_184404]
        push dword [dword_184400]
        xor eax, eax
        call SetGameBackdrop
        xor eax, eax
        call GetLangText
        push byte 2
        mov dword [byte ebp-020h], eax
        mov eax, dword [dword_11F5C4]
        push edx
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        push eax
        mov ecx, byte_11D91C
        lea ebx, [byte ebp-020h]
        push edx
        mov eax, 208h
        mov edx, 1
        call GetLangText
        call MessageBox
        jmp near InGameMenu_ABD.47
InGameMenu_F31:
        call OpenFrontEndFromGame
        xor eax, eax
        call ControllerScreen
        jmp near InGameMenu_D17.64
InGameMenu_F42:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .71
        call OpenFrontEndFromGame
.70:
        call GameStatsScreen
        jmp near InGameMenu_D17.64
.71:
        call InGameReturnMenu
        mov edx, eax
        test eax, eax
        je near InGameMenu_ABD.50
        mov byte [byte_1820F1], 0
        call OpenFrontEndFromGame
        cmp edx, byte 2
        jne short .70
        call LoadModeStats
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
.72:
        cmp eax, 0A410h
        je near InGameMenu_D17.63
        mov edx, 64h
        call PlayerStatsScreen
        jmp short .72
InGameMenu_FA8:
        call RedrawInGameMenu
        push byte 0
        push byte 0
        push dword [dword_1843FC]
        push dword [dword_1843F8]
        push dword [dword_184404]
        xor eax, eax
        push dword [dword_184400]
        xor esi, esi
        call SetGameBackdrop
        test byte [optflags], 70h
        jne short .74
        mov edx, 5
        mov eax, unk_184692
        xor ebx, ebx
        call MakeDirPath
        mov edx, str_EXHIBITNDX2
        mov eax, unk_184692
        call NameIndexLoad
        mov esi, eax
        test eax, eax
        jne short .73
        mov edx, str_EXHIBITNDX2
        mov eax, unk_184692
        call NameIndexNew
        mov esi, eax
.73:
        mov eax, esi
        call NameIndexFirstId
        push eax
        push str_08d2
        jmp near .80
.74:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 10h
        jne short .75
        mov edx, 4
        mov eax, unk_184692
        xor ebx, ebx
        call MakeDirPath
        push dword [PlayoffTreeData]
        push str_05d3
        push unk_184688
        call sprintf_
        add esp, byte 0Ch
        mov edx, unk_184688
        mov eax, unk_184692
        call strcat_
        mov eax, dword [dword_17CB2F]
        shl eax, 0Fh
        shr eax, 1Bh
        add eax, byte 41h
        push eax
        push str_CsgDb2
        jmp near .80
.75:
        cmp eax, byte 20h
        jne short .78
        cmp dword [dword_17CC17], byte 0
        je short .77
        mov edx, 4
        mov eax, unk_184692
        xor ebx, ebx
        call MakeDirPath
        push dword [PlayoffTreeData]
.76:
        push str_05d3
        push unk_184688
        call sprintf_
        add esp, byte 0Ch
        mov edx, unk_184688
        mov eax, unk_184692
        call strcat_
        jmp short .79
.77:
        mov edx, 6
        mov eax, unk_184692
        xor ebx, ebx
        call MakeDirPath
        push dword [dword_17D162]
        jmp short .76
.78:
        push esi
        push esi
        jmp near InGameMenu_ABD.48
.79:
        mov eax, dword [dword_17CED6]
        shl eax, 0Fh
        shr eax, 1Bh
        add eax, byte 41h
        push eax
        push str_CsgDb2
.80:
        push unk_184688
        call sprintf_
        add esp, byte 0Ch
        mov edx, unk_184688
        mov eax, unk_184692
        call strcat_
        test esi, esi
        jne short .81
        mov eax, 1D3h
        call GetLangText
        mov edx, eax
        mov eax, byte_1846C4
        call strcpy_
        xor eax, eax
        jmp short .84
.81:
        mov eax, dword [dword_11F5C4]
        push byte_1846C4
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        mov byte [byte_1846C4], 0
        push eax
        test byte [byte_17CA5D], 20h
        je short .82
        mov ecx, 28h
        jmp short .83
.82:
        mov ecx, 1Eh
.83:
        mov eax, 139h
        mov ebx, byte_11D91C
        call GetLangText
        mov edx, eax
        xor eax, eax
        call EditText
        test eax, eax
        sete al
        movzx eax, al
.84:
        test eax, eax
        jne near .87
        mov eax, dword [gameopts]
        or byte [eax], 1
        mov eax, unk_184692
        call SaveGameFile
        test eax, eax
        jne short .85
        call GetLangText
        mov dword [byte ebp-020h], eax
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        or al, 2
        cwde
        push eax
        mov eax, dword [dword_11F5C4]
        push byte 0
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        push eax
        mov ecx, byte_11D91C
        lea ebx, [byte ebp-020h]
        push byte 0
        mov eax, 60h
        mov edx, 1
        call GetLangText
        call MessageBox
        jmp near .87
.85:
        test esi, esi
        je short .86
        mov ebx, byte_1846C4
        mov edx, unk_184688
        mov eax, esi
        call NameIndexAdd
        mov esi, eax
.86:
        xor eax, eax
        call GetLangText
        mov dword [byte ebp-020h], eax
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        or al, 2
        cwde
        push eax
        mov eax, dword [dword_11F5C4]
        push byte 0
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        push eax
        mov ecx, byte_11D91C
        lea ebx, [byte ebp-020h]
        push byte 0
        mov eax, 61h
        mov edx, 1
        call GetLangText
        call MessageBox
        test byte [optflags], 70h
        je short .87
        mov dword [gameresult], 2
        mov dword [byte ebp-08h], 0
.87:
        test esi, esi
        je near InGameMenu_ABD.47
        mov eax, 1
        mov edx, esi
        call NameIndexFree
        jmp near InGameMenu_ABD.47
