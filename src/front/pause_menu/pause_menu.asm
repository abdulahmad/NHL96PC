; The in-game menu: RunInGameMenu and the pause menu screens of a game (96 PC; its routines still to be named).
bits 32
%include "hockey.inc"
section s_6A7D3 progbits alloc exec nowrite align=1
extern awtmstruct, byte_11D91C, byte_11FA2F, byte_17CA5D, byte_17CC37, CloseTextOverlay, ControllerScreen, CopyBitmap
extern Crowd_Noise, CrowdNoiseReset, CrowdPause, CrowdResume, curperiod, DrawBox, DrawColorTextCentred, DrawFrameAt
extern DrawGameClock, DrawGameFrame, dword_1150D4, dword_1150FC, dword_1174EC, dword_1174F0, dword_1174F4, dword_11B234
extern dword_11B320, dword_11B324, dword_11BC24, dword_11D91F, dword_11D923, dword_11F5C0, dword_11F5C4, dword_152F4C
extern dword_152F50, dword_152F54, dword_152F58, dword_152F5C, dword_16596C, dword_177108, dword_179918, dword_179920
extern dword_17CB2F, dword_17CBE7, dword_17CC17, dword_17CED6, dword_17D162, dword_17D267, dword_17D4E8, dword_17D4EC
extern dword_17D4F0, dword_17D4F4, dword_17D4F8, dword_17D4FC, dword_17D500, dword_17D504, dword_17D508, dword_17D50C
extern dword_17D510, dword_17D514, dword_17D518, dword_17D51C, dword_17D520, dword_17D524, dword_17D528, dword_1843AC
extern dword_1843B0, dword_1843B4, EditText, EndCameraShot, EndGameSound, FadeOut, FadeOutMusic, FadePalette
extern FileClose, FileCreate, FileWriteAt, FillBox, FreeFightSprites, FreeFrontEndArt, FreeSpeechBuffer, FreeSpriteCache
extern FreeStatsTables, FreeTotalSprites, gameclock, GameLoopActive, gameopts, GameStatsScreen, GetCrowdTarget, GetLangText
extern GetSoundCard, GetTicks, gmode, gsp, hmtmstruct, InGameMenu, InGameMenuRequest, InitMenuItems
extern InitSlotTable, LinkResyncInput, LinkSync, LoadExhibitionStats, LoadFightSprites, LoadFrontEndArt, LoadModemStats, LoadPlayoffStats
extern LoadSeasonStats, LoadTeamLogo, LoadTotalSprites, MakeDirPath, MakePlayoffDbPath, MakeSeasonDbPath, MessageBox, ModemChat
extern MouseRead, mousex, mousey, NameIndexAdd, NameIndexFirstId, NameIndexFree, NameIndexLoad, NameIndexNew
extern optblock_end, optflags, PutBlock, QueueMusic, ResetInputSlots, ResetSlotButtons, RestoreSpeechBuffer, RunEditLines
extern RunMenu, SaveGameState, SetClipWindow, SetCrowdTarget, SetDrawBitmap, SetMenuMouse, SetScreenMode, SetScreenPalette
extern SetTextColors, SetViewRect, SoundIdle, sprintf_, StartGameSound, StopAllSfx, StopArenaClip, StopMusic
extern str_05d4, str_08d3, str_Bot12, str_Bot22, str_Bot32, str_Cht02, str_Cht12, str_CsgDb3
extern str_Ctr02, str_Ctr12, str_D16, str_Edt02, str_Edt12, str_EXHIBITNDX3, str_FhiL5, str_FhiR5
extern str_GhiL3, str_GhiR3, str_GloL3, str_GloR3, str_Paus, str_PAUSREG, str_Qui02, str_Qui12
extern str_Qui22, str_Rep0, str_Rep1, str_Ret02, str_Ret12, str_Ret22, str_Sav02, str_Sav12
extern str_Sid12, str_Sid22, str_Sts02, str_Sts12, strcat_, strcpy_, RefreshControlSlots, ReplayBufferEnd
extern AddZone, ReplayScreen, RunReplay, DrawShapeAtOwnPos, DrawArt, AllocMemBlock, FreeMemBlock, CreateBitmap
extern FreeBitmap, FreeColourLookup, SaveDataFile, SetAaPalLut, DrawArtScaled, SetScreenTarget, FindShape, ClearClipRect
extern TextSetFont, unk_11D7A4, unk_11D7BC, unk_11D7D4, unk_11D7EC, unk_11D804, unk_11D80A, unk_11D810
extern unk_11D816, unk_11D81C, unk_11D89C, unk_16443C, unk_17CB2E, unk_17CED5, unk_17D3E8, unk_17D52C
extern UpdateCamera, word_114CE0, word_114F14, word_117902, word_11D927, word_11D929, word_1656E8, word_16581E
global RunInGameMenu, DrawPauseButtons, DrawPauseFrame, DrawPauseFrame_9C2, DrawPauseFrame_9C3, RunPausedFrame, jpt_6B476, SaveGameFile
global SaveGameFile_59, SaveGameFile_60, SaveGameFile_6C, SaveGameFile_81, jpt_6B878, PauseMenu, PauseMenu_66B, PauseMenu_6F1
global PauseMenu_6FD, PauseMenu_724, PauseMenu_730, PauseMenu_73C, PauseMenu_748, PauseToFrontEnd, PauseBackToGame, PauseBackToGame_28A
global LoadModeStatsJumpTable, LoadModeStats, LoadCurrentSeasonStats, LoadPlayoffOrSeasonStats, jpt_6C680, PauseGame, PauseGame_375, PauseGame_3A3
global PauseGame_47F, PauseGame_5F4, PauseGame_611, PauseGame_620
;-----------------------------------------------------------------------------
; RunInGameMenu                                6A7D3  96 PC, medium confidence
; Opens the menu InGameMenuRequest asks for (pre-game menu, pause)
;-----------------------------------------------------------------------------
RunInGameMenu:
        push ebx
        push edx
        mov edx, dword [InGameMenuRequest]
        mov ebx, dword [GameLoopActive]
        mov dword [InGameMenuRequest], 0
        mov dword [GameLoopActive], 0
        call LinkResyncInput
        call ResetSlotButtons
        mov al, byte [gmode]
        and al, 80h
        cmp edx, byte 2
        jb short .1
        jbe short .3
        cmp edx, byte 3
        je short .4
        jmp near .5
.1:
        cmp edx, byte 1
        jne short .5
        movsx eax, al
        test eax, eax
        je short .2
        mov dword [dword_1150FC], edx
        jmp short .5
.2:
        call PauseGame
        jmp short .5
.3:
        movsx eax, al
        test eax, eax
        jne short .5
        mov al, byte [gmode]
        and al, 10h
        movsx eax, al
        test eax, eax
        jne short .5
        cmp dword [curperiod], byte 0FFFFFFFFh
        je short .5
        call FreeSpeechBuffer
        call RunReplay
        call RestoreSpeechBuffer
        jmp short .5
.4:
        call InGameMenu
        test eax, eax
        jne short .5
        mov dword [dword_1150FC], 2
.5:
        call ResetSlotButtons
        call LinkResyncInput
        mov dword [InGameMenuRequest], 0
        mov dword [GameLoopActive], ebx
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawPauseButtons                             6A891  96 PC, medium confidence
; Draws the pause menu's buttons (qui0 quit, ret0 return, rep0 replay, ctr0
; controllers, sts0 stats, edt0 edit lines, sav0 save, cht0 chat)
;-----------------------------------------------------------------------------
DrawPauseButtons:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        xor edi, edi
        xor esi, esi
        test eax, eax
        je short .1
        mov edi, dword [dword_17D51C]
        movsx edi, word [byte edi+06h]
.1:
        test eax, eax
        je short .2
        mov esi, dword [dword_17D520]
        movsx esi, word [byte esi+0Eh]
.2:
        push str_Qui02
        push dword [dword_17D528]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        add esp, byte 8
        sub edx, esi
        push edx
        movsx edx, word [byte eax+0Ch]
        sub edx, edi
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        push str_Ret02
        push dword [dword_17D528]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        add esp, byte 8
        sub edx, esi
        push edx
        movsx edx, word [byte eax+0Ch]
        sub edx, edi
        push edx
        push eax
        call DrawArt
        mov eax, dword [dword_17D4F0]
        movsx eax, word [eax]
        add esp, byte 0Ch
        sub eax, esi
        push eax
        mov eax, dword [dword_17D4EC]
        movsx eax, word [byte eax+02h]
        sub eax, edi
        push eax
        push str_Rep0
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        mov eax, dword [dword_17D4F0]
        movsx eax, word [byte eax+02h]
        add esp, byte 0Ch
        sub eax, esi
        push eax
        mov eax, dword [dword_17D4EC]
        movsx eax, word [eax]
        sub eax, edi
        push eax
        push str_Ctr02
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        mov eax, dword [dword_17D4F0]
        movsx eax, word [byte eax+02h]
        add esp, byte 0Ch
        sub eax, esi
        push eax
        mov eax, dword [dword_17D4EC]
        movsx eax, word [byte eax+02h]
        sub eax, edi
        push eax
        push str_Sts02
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        add esp, byte 0Ch
        test eax, eax
        jne short .3
        mov eax, dword [dword_17D4F0]
        movsx eax, word [eax]
        sub eax, esi
        push eax
        mov eax, dword [dword_17D4EC]
        movsx eax, word [eax]
        sub eax, edi
        push eax
        push str_Edt02
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        mov eax, dword [dword_17D4F0]
        movsx eax, word [byte eax+04h]
        add esp, byte 0Ch
        sub eax, esi
        push eax
        mov eax, dword [dword_17D4EC]
        movsx eax, word [byte eax+04h]
        sub eax, edi
        push eax
        push str_Sav02
        jmp short .4
.3:
        mov eax, dword [dword_17D4F0]
        movsx eax, word [eax]
        sub eax, esi
        push eax
        mov eax, dword [dword_17D4EC]
        movsx eax, word [eax]
        sub eax, edi
        push eax
        push str_Cht02
.4:
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
        jmp near DrawPauseFrame_9C3
;-----------------------------------------------------------------------------
; DrawPauseFrame                               6AA3B  96 PC, medium confidence
; From DrawGameFrame while paused: the pause frame over the game (paus,
; sid1/2, bot1-3), score with both logos, period and clock
;-----------------------------------------------------------------------------
DrawPauseFrame:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 20h, 0
        movsx esi, word [gameclock]
        mov eax, esi
        mov ebx, 3Ch
        cdq
        idiv ebx
        mov dword [byte ebp-010h], eax
        mov eax, esi
        cdq
        idiv ebx
        movsx eax, word [word_117902]
        imul eax, byte 0Ah
        mov ebx, 18h
        mov dword [byte ebp-014h], edx
        cdq
        idiv ebx
        mov dword [byte ebp-0Ch], eax
        cmp dword [dword_11D91F], byte 0
        je near DrawPauseFrame_9C2
        call GetTicks
        mov edi, eax
        sub edi, dword [dword_17D510]
        cmp edi, 0FAh
        jle short .1
        mov edi, 0FAh
.1:
        mov eax, dword [dword_152F4C]
        call SetAaPalLut
        xor edx, edx
        xor ecx, ecx
        mov eax, 30h
        mov dword [dword_11BC24], 0FFFFFFFFh
        call SetTextColors
        push dword [dword_11F5C4]
        mov ebx, dword [dword_11F5C0]
        inc dword [dword_177108]
        xor edx, edx
        mov eax, dword [dword_177108]
        call AddZone
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        mov eax, dword [dword_17D51C]
        movsx ebx, word [byte eax+04h]
        mov eax, edi
        imul eax, ebx
        mov ecx, 0FAh
        cdq
        idiv ecx
        add esp, byte 10h
        mov esi, eax
        cmp dword [dword_11D923], byte 0
        jne short .2
        mov esi, ebx
        sub esi, eax
.2:
        mov eax, dword [dword_17D51C]
        push byte 0
        movsx edx, word [byte eax+04h]
        movsx eax, word [eax]
        push byte 0
        sub edx, eax
        push byte 1
        inc edx
        mov eax, dword [dword_17D520]
        mov dword [byte ebp-04h], edx
        sub esi, edx
        movsx edx, word [byte eax+04h]
        push edx
        mov edx, dword [byte ebp-04h]
        movsx ebx, word [eax]
        add edx, esi
        mov eax, unk_17D3E8
        mov dword [byte ebp-01Ch], edx
        mov ecx, edx
        mov edx, esi
        call DrawBox
        mov eax, 780000h
        mov edx, dword [dword_17D524]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, eax
        mov eax, dword [dword_17D520]
        sar ecx, 11h
        movsx eax, word [byte eax+02h]
        sub eax, ecx
        mov ecx, eax
        mov eax, dword [dword_17D51C]
        movsx edx, word [byte eax+02h]
        movsx eax, word [eax]
        sub edx, eax
        mov eax, 0E00000h
        lea ebx, [esi+edx]
        mov edx, dword [dword_17D524]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        dec ebx
        sar eax, 11h
        sub ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        call LoadTeamLogo
        mov edx, dword [dword_17D524]
        mov dword [byte ebp-020h], edx
        mov edx, eax
        mov eax, dword [byte ebp-020h]
        call DrawFrameAt
        push byte 0
        mov eax, dword [dword_17D520]
        mov ecx, dword [byte ebp-01Ch]
        push byte 0
        movsx edx, word [byte eax+08h]
        push byte 1
        movsx ebx, word [byte eax+06h]
        push edx
        mov eax, unk_17D3E8
        mov edx, esi
        call DrawBox
        movsx eax, word [word_1656E8]
        push eax
        push str_D16
        push unk_17D52C
        call sprintf_
        add esp, byte 0Ch
        push dword [dword_179920]
        call TextSetFont
        add esp, byte 4
        test byte [byte_17CA5D], 20h
        je short .3
        mov ebx, 4
        jmp short .4
.3:
        mov ebx, 0FFFFFFFFh
.4:
        mov eax, dword [dword_17D520]
        movsx eax, word [byte eax+06h]
        add ebx, eax
        mov eax, dword [dword_17D51C]
        movsx edx, word [byte eax+02h]
        movsx eax, word [eax]
        sub edx, eax
        mov eax, unk_17D52C
        add edx, esi
        mov ecx, dword [byte ebp-04h]
        call DrawColorTextCentred
        push byte 0
        mov eax, dword [dword_17D520]
        add ecx, esi
        push byte 0
        movsx edx, word [byte eax+0Ch]
        push byte 1
        movsx ebx, word [byte eax+0Ah]
        push edx
        mov eax, unk_17D3E8
        mov edx, esi
        call DrawBox
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov eax, 30h
        xor edx, edx
        call SetTextColors
        test byte [byte_17CA5D], 20h
        je short .5
        mov ebx, 5
        jmp short .6
.5:
        mov ebx, 1
.6:
        mov eax, dword [dword_17D520]
        movsx eax, word [byte eax+0Ah]
        add ebx, eax
        mov eax, dword [dword_17D51C]
        movsx edx, word [byte eax+02h]
        movsx eax, word [eax]
        sub edx, eax
        add edx, esi
        mov eax, 20Dh
        inc edx
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmstruct]
        push eax
        push str_D16
        push unk_17D52C
        call sprintf_
        movzx edx, byte [byte_11FA2F]
        mov eax, dword [dword_17D520]
        inc edx
        inc edx
        movsx ebx, word [byte eax+0Ch]
        mov eax, dword [dword_17D51C]
        sub ebx, edx
        movsx ecx, word [byte eax+02h]
        movsx edx, word [eax]
        add esp, byte 0Ch
        sub ecx, edx
        mov eax, unk_17D52C
        lea edx, [ecx+esi]
        call DrawColorTextCentred
        mov eax, dword [dword_17D51C]
        movsx ebx, word [byte eax+0Ah]
        mov eax, dword [dword_11F5C0]
        sub eax, ebx
        imul eax, edi
        mov ecx, 0FAh
        cdq
        idiv ecx
        mov esi, dword [dword_11F5C0]
        sub esi, eax
        cmp dword [dword_11D923], byte 0
        jne short .7
        add ebx, dword [dword_11F5C0]
        sub ebx, esi
        mov esi, ebx
.7:
        mov eax, dword [dword_17D51C]
        movsx edx, word [byte eax+0Eh]
        movsx eax, word [byte eax+0Ah]
        sub edx, eax
        push byte 0
        lea eax, [byte edx+01h]
        push byte 0
        mov dword [byte ebp-08h], eax
        mov eax, dword [dword_17D520]
        push byte 1
        movsx edx, word [byte eax+04h]
        push edx
        mov edx, dword [byte ebp-08h]
        movsx ebx, word [eax]
        add edx, esi
        mov eax, unk_17D3E8
        mov dword [byte ebp-020h], edx
        mov ecx, edx
        mov edx, esi
        call DrawBox
        mov eax, 780000h
        mov edx, dword [dword_17D524]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, eax
        mov eax, dword [dword_17D520]
        sar ecx, 11h
        movsx eax, word [byte eax+02h]
        sub eax, ecx
        mov ecx, eax
        mov eax, dword [dword_17D51C]
        movsx edx, word [byte eax+0Ch]
        movsx eax, word [byte eax+0Ah]
        sub edx, eax
        mov eax, 0E00000h
        lea ebx, [esi+edx]
        mov edx, dword [dword_17D524]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        dec ebx
        sar eax, 11h
        sub ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        call LoadTeamLogo
        mov edx, dword [dword_17D524]
        mov dword [byte ebp-01Ch], edx
        mov edx, eax
        mov eax, dword [byte ebp-01Ch]
        call DrawFrameAt
        push byte 0
        mov eax, dword [dword_17D520]
        mov ecx, dword [byte ebp-020h]
        push byte 0
        movsx edx, word [byte eax+08h]
        push byte 1
        movsx ebx, word [byte eax+06h]
        push edx
        mov eax, unk_17D3E8
        mov edx, esi
        call DrawBox
        movsx eax, word [word_16581E]
        push eax
        push str_D16
        push unk_17D52C
        call sprintf_
        add esp, byte 0Ch
        push dword [dword_179920]
        call TextSetFont
        add esp, byte 4
        test byte [byte_17CA5D], 20h
        je short .8
        mov ebx, 4
        jmp short .9
.8:
        mov ebx, 0FFFFFFFFh
.9:
        mov eax, dword [dword_17D520]
        movsx eax, word [byte eax+06h]
        add ebx, eax
        mov eax, dword [dword_17D51C]
        movsx edx, word [byte eax+0Ch]
        movsx eax, word [byte eax+0Ah]
        sub edx, eax
        mov eax, unk_17D52C
        add edx, esi
        mov ecx, dword [byte ebp-08h]
        call DrawColorTextCentred
        push byte 0
        mov eax, dword [dword_17D520]
        add ecx, esi
        push byte 0
        movsx edx, word [byte eax+0Ch]
        push byte 1
        movsx ebx, word [byte eax+0Ah]
        push edx
        mov eax, unk_17D3E8
        mov edx, esi
        call DrawBox
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov eax, 30h
        xor edx, edx
        call SetTextColors
        test byte [byte_17CA5D], 20h
        je short .10
        mov ebx, 5
        jmp short .11
.10:
        mov ebx, 1
.11:
        mov eax, dword [dword_17D520]
        movsx eax, word [byte eax+0Ah]
        add ebx, eax
        mov eax, dword [dword_17D51C]
        movsx edx, word [byte eax+0Ch]
        movsx eax, word [byte eax+0Ah]
        sub edx, eax
        add edx, esi
        mov eax, 20Dh
        inc edx
        inc edx
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [awtmstruct]
        push eax
        push str_D16
        push unk_17D52C
        call sprintf_
        movzx edx, byte [byte_11FA2F]
        mov eax, dword [dword_17D520]
        inc edx
        inc edx
        movsx ebx, word [byte eax+0Ch]
        mov eax, dword [dword_17D51C]
        sub ebx, edx
        movsx edx, word [byte eax+0Ch]
        movsx eax, word [byte eax+0Ah]
        add esp, byte 0Ch
        sub edx, eax
        mov eax, unk_17D52C
        add edx, esi
        call DrawColorTextCentred
        mov eax, dword [dword_17D520]
        movsx ebx, word [byte eax+012h]
        mov eax, dword [dword_11F5C4]
        sub eax, ebx
        imul eax, edi
        mov ecx, 0FAh
        cdq
        idiv ecx
        mov esi, dword [dword_11F5C4]
        sub esi, eax
        cmp dword [dword_11D923], byte 0
        jne short .12
        add ebx, dword [dword_11F5C4]
        sub ebx, esi
        mov esi, ebx
.12:
        mov eax, dword [dword_17D520]
        push byte 0
        mov ebx, esi
        movsx edx, word [byte eax+016h]
        movsx eax, word [byte eax+012h]
        push byte 0
        sub edx, eax
        mov eax, dword [dword_17D51C]
        inc edx
        push byte 1
        add edx, esi
        movsx ecx, word [byte eax+016h]
        push edx
        movsx edx, word [byte eax+010h]
        mov eax, unk_17D3E8
        call DrawBox
        mov eax, dword [dword_17D520]
        movsx edx, word [byte eax+014h]
        movsx eax, word [byte eax+012h]
        sub edx, eax
        mov eax, dword [dword_17D51C]
        add edx, esi
        movsx eax, word [byte eax+012h]
        call DrawGameClock
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov eax, 30h
        xor edx, edx
        call SetTextColors
        cmp dword [byte ebp-010h], byte 0
        jne short .13
        cmp dword [byte ebp-014h], byte 0
        jne short .13
        cmp dword [byte ebp-0Ch], byte 0
        jne short .13
        mov eax, 1
        jmp short .14
.13:
        xor eax, eax
.14:
        movsx edx, word [gsp]
        cmp edx, byte 3
        jl short .15
        mov eax, 88h
        jmp near .23
.15:
        mov dx, word [gsp]
        cmp dx, byte 1
        jb short .16
        jbe short .18
        cmp dx, byte 2
        je short .20
        jmp near .24
.16:
        test dx, dx
        jne short .24
        test eax, eax
        je short .17
        mov eax, 5Ah
        jmp short .23
.17:
        mov eax, 5Bh
        jmp short .23
.18:
        test eax, eax
        je short .19
        mov eax, 5Ch
        jmp short .23
.19:
        mov eax, 5Dh
        jmp short .23
.20:
        test eax, eax
        je short .22
        mov ax, word [word_1656E8]
        cmp ax, word [word_16581E]
        je short .21
        mov eax, 89h
        jmp short .23
.21:
        mov eax, 5Eh
        jmp short .23
.22:
        mov eax, 5Fh
.23:
        call GetLangText
        mov edx, eax
        mov eax, unk_17D52C
        call strcpy_
.24:
        mov eax, dword [dword_17D520]
        movsx edx, word [byte eax+014h]
        movsx eax, word [byte eax+012h]
        sub edx, eax
        lea ebx, [esi+edx]
        test byte [byte_17CA5D], 20h
        je short .25
        mov eax, 0Eh
        jmp short .26
.25:
        mov eax, 3
.26:
        add ebx, eax
        mov eax, dword [dword_17D51C]
        movsx edx, word [byte eax+014h]
        mov eax, unk_17D52C
        call DrawColorTextCentred
        mov eax, dword [dword_17D4F8]
        imul eax, edi
        mov ebx, 0FAh
        cdq
        idiv ebx
        mov esi, eax
        mov eax, dword [dword_17D4F4]
        imul eax, edi
        cdq
        idiv ebx
        mov edi, eax
        cmp dword [dword_11D923], byte 0
        jne short .27
        mov eax, dword [dword_17D4F8]
        sub eax, esi
        mov esi, eax
        mov eax, dword [dword_17D4F4]
        sub eax, edi
        mov edi, eax
.27:
        mov eax, dword [dword_17D514]
        mov eax, dword [byte eax+02Ch]
        movsx ebx, word [byte eax+04h]
        mov eax, esi
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edx, dword [dword_17D4F4]
        mov dword [byte ebp-018h], eax
        sub edx, edi
        mov eax, dword [dword_17D50C]
        sar edx, 1
        add eax, dword [dword_17D4F4]
        sub eax, edx
        mov ebx, dword [dword_17D4F8]
        sub eax, byte 3
        sub ebx, esi
        push eax
        mov eax, dword [dword_17D508]
        sar ebx, 1
        add eax, dword [dword_17D4F8]
        sub eax, ebx
        lea ecx, [byte eax-03h]
        mov eax, dword [dword_17D508]
        add eax, ebx
        add edx, dword [dword_17D50C]
        mov ebx, edx
        mov edx, eax
        mov eax, unk_17D3E8
        call FillBox
        cmp word [word_11D929], byte 0
        jne short .28
        mov eax, dword [dword_17D4F4]
        sub eax, edi
        sar eax, 1
        add eax, dword [dword_17D50C]
        push eax
        mov eax, dword [dword_17D4F8]
        sub eax, esi
        sar eax, 1
        add eax, dword [dword_17D508]
        push eax
        mov eax, dword [dword_17D514]
        push dword [byte eax+02Ch]
        push dword [byte ebp-018h]
        call DrawArtScaled
        add esp, byte 10h
        jmp near DrawPauseFrame_9C2
.28:
        push str_Paus
        push dword [dword_17D528]
        call FindShape
        mov esi, eax
        mov eax, dword [dword_17D520]
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        mov eax, dword [dword_17D51C]
        movsx eax, word [byte eax+06h]
        push eax
        push esi
        call DrawArt
        add esp, byte 0Ch
        push str_Sid12
        push dword [dword_17D528]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        sub ebx, edx
        mov edx, dword [dword_17D520]
        movsx edx, word [byte edx+0Eh]
        add esp, byte 8
        add edx, ebx
        push edx
        movsx ebx, word [byte esi+0Ch]
        movsx edx, word [byte eax+0Ch]
        mov edi, dword [dword_17D51C]
        sub edx, ebx
        movsx ebx, word [byte edi+06h]
        add edx, ebx
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        push str_Sid22
        push dword [dword_17D528]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        mov edi, dword [dword_17D520]
        sub ebx, edx
        movsx edx, word [byte edi+0Eh]
        add esp, byte 8
        add edx, ebx
        push edx
        movsx ebx, word [byte eax+0Ch]
        movsx edx, word [byte esi+0Ch]
        sub ebx, edx
        mov edi, dword [dword_17D51C]
        mov edx, ebx
        movsx ebx, word [byte edi+06h]
        add edx, ebx
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        push str_Bot12
        push dword [dword_17D528]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        sub ebx, edx
        mov edi, dword [dword_17D520]
        mov edx, ebx
        movsx ebx, word [byte edi+0Eh]
        add esp, byte 8
        add edx, ebx
        push edx
        movsx ebx, word [byte esi+0Ch]
        movsx edx, word [byte eax+0Ch]
        sub edx, ebx
        mov edi, dword [dword_17D51C]
        mov ebx, edx
        movsx edx, word [byte edi+06h]
        add edx, ebx
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        push str_Bot22
        push dword [dword_17D528]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        movsx ebx, word [byte esi+0Eh]
        mov edi, dword [dword_17D520]
        sub edx, ebx
        movsx ebx, word [byte edi+0Eh]
        add esp, byte 8
        add edx, ebx
        push edx
        movsx ebx, word [byte esi+0Ch]
        movsx edx, word [byte eax+0Ch]
        sub edx, ebx
        mov edi, dword [dword_17D51C]
        mov ebx, edx
        movsx edx, word [byte edi+06h]
        add edx, ebx
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        push str_Bot32
        push dword [dword_17D528]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        movsx ebx, word [byte esi+0Eh]
        mov edi, dword [dword_17D520]
        sub edx, ebx
        movsx ebx, word [byte edi+0Eh]
        add esp, byte 8
        add edx, ebx
        push edx
        movsx ebx, word [byte esi+0Ch]
        movsx edx, word [byte eax+0Ch]
        sub edx, ebx
        mov esi, dword [dword_17D51C]
        mov ebx, edx
        movsx edx, word [byte esi+06h]
        add edx, ebx
        push edx
        push eax
        call DrawArt
        add esp, byte 0Ch
        call FreeSpriteCache
        push dword [dword_17D514]
        call FreeBitmap
        add esp, byte 4
        push byte 0
        push dword [dword_11F5C4]
        push dword [dword_11F5C0]
        call CreateBitmap
        mov dword [dword_17D518], eax
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Ch], 0
        mov eax, dword [dword_17D518]
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Eh], 0
        add esp, byte 0Ch
        mov eax, dword [dword_17D518]
        push dword [byte eax+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        xor eax, eax
        call DrawPauseButtons
        mov word [word_11D929], 0
DrawPauseFrame_9C2:
        leave
DrawPauseFrame_9C3:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RunPausedFrame                                  6B404  96 PC, low confidence
; One paused frame: overlays and camera shot off, crowd, camera,
; DrawGameFrame
;-----------------------------------------------------------------------------
RunPausedFrame:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov dword [dword_11D923], eax
        test eax, eax
        je short .1
        mov edx, 0FFFFFFFFh
        mov eax, 0Ah
        call CloseTextOverlay
        jmp short .2
.1:
        mov eax, 0Ah
        call EndCameraShot
.2:
        call GetTicks
        mov esi, 0FAh
        mov edi, eax
        call GetTicks
        mov dword [dword_17D510], eax
.3:
        test esi, esi
        je short DrawPauseFrame_9C3
        call GetTicks
        mov ebx, eax
        sub eax, edi
        mov edx, eax
        call Crowd_Noise
        call SoundIdle
        mov eax, edx
        call UpdateCamera
        xor eax, eax
        sub esi, edx
        call DrawGameFrame
        test esi, esi
        jge short .4
        xor esi, esi
.4:
        mov edi, ebx
        jmp short .3
jpt_6B476:
        dd SaveGameFile_59
        dd SaveGameFile_60
        dd SaveGameFile_6C
        dd SaveGameFile_81
;-----------------------------------------------------------------------------
; SaveGameFile                                    6B486  96 PC, low confidence
; Creates the save file (FileCreate) and writes the game by the game kind
; (optflags)
;-----------------------------------------------------------------------------
SaveGameFile:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 44h, 0
        lea edx, [byte ebp-018h]
        mov dword [byte ebp-04h], 1
        call FileCreate
        test eax, eax
        jne near SaveGameFile_81.16
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 1
        jb short .1
        jbe near SaveGameFile_81.11
        cmp eax, byte 2
        je near SaveGameFile_81.12
        jmp near SaveGameFile_81.14
.1:
        test eax, eax
        jne near SaveGameFile_81.14
        cmp eax, byte 3
        ja short SaveGameFile_81.2
        jmp dword [nosplit cs:eax*4+jpt_6B476]
SaveGameFile_59:
        call LoadExhibitionStats
        jmp short SaveGameFile_81.2
SaveGameFile_60:
        mov eax, dword [dword_17CBE7]
        call LoadSeasonStats
        jmp short SaveGameFile_81.2
SaveGameFile_6C:
        cmp dword [dword_17D267], byte 0
        jne short SaveGameFile_60
        mov eax, dword [dword_17D162]
        call LoadPlayoffStats
        jmp short SaveGameFile_81.2
SaveGameFile_81:
        call LoadModemStats
.2:
        mov ecx, 0B9h
        mov ebx, 0FFFFFFFFh
        mov edx, optblock_end
        mov eax, dword [byte ebp-018h]
        call FileWriteAt
        mov dword [byte ebp-04h], eax
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        shl edx, 0Fh
        shr edx, 1Bh
        imul edx, dword 31Bh
        mov ecx, 31Bh
        mov eax, dword [dword_1174F0]
        mov ebx, 0FFFFFFFFh
        add edx, eax
        mov eax, dword [byte ebp-018h]
        call FileWriteAt
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul eax, dword 31Bh
        mov ecx, 31Bh
        mov edx, dword [dword_1174F0]
        mov ebx, 0FFFFFFFFh
        add edx, eax
        mov eax, dword [byte ebp-018h]
        call FileWriteAt
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        imul eax, dword 31Bh
        mov esi, dword [dword_1174F0]
        add esi, eax
        mov edi, esi
        lea eax, [byte esi+064h]
        mov dword [byte ebp-0Ch], eax
.3:
        cmp dword [byte edi+063h], byte 0FFFFFFFFh
        je short .4
        mov edx, dword [dword_1174EC]
        add edx, dword [byte edi+063h]
        mov eax, dword [dword_1174F4]
        mov ebx, dword [byte edx+024h]
        mov ecx, 3Ch
        add ebx, eax
        mov eax, dword [byte ebp-018h]
        mov dword [byte ebp-01Ch], ebx
        mov ebx, 0FFFFFFFFh
        call FileWriteAt
        mov ecx, 15h
        mov ebx, 0FFFFFFFFh
        mov edx, dword [byte ebp-01Ch]
        mov eax, dword [byte ebp-018h]
        call FileWriteAt
.4:
        add edi, byte 4
        cmp edi, dword [byte ebp-0Ch]
        jne short .3
        mov edi, esi
        add esi, byte 0Ch
        mov dword [byte ebp-014h], esi
.5:
        cmp dword [dword edi+0C7h], byte 0FFFFFFFFh
        je short .6
        mov ecx, 3Ch
        mov edx, dword [dword_1174EC]
        mov ebx, 0FFFFFFFFh
        add edx, dword [dword edi+0C7h]
        mov esi, dword [dword_1174F4]
        mov eax, dword [byte ebp-018h]
        add esi, dword [byte edx+024h]
        call FileWriteAt
        mov ecx, 11h
        mov ebx, 0FFFFFFFFh
        mov eax, dword [byte ebp-018h]
        mov edx, esi
        call FileWriteAt
.6:
        add edi, byte 4
        cmp edi, dword [byte ebp-014h]
        jne short .5
        mov eax, dword [gameopts]
        mov edi, dword [byte eax+01h]
        shl edi, 0Ah
        shr edi, 1Bh
        imul edi, dword 31Bh
        mov eax, dword [dword_1174F0]
        add edi, eax
        mov esi, edi
        lea eax, [byte edi+064h]
        mov dword [byte ebp-08h], eax
.7:
        cmp dword [byte esi+063h], byte 0FFFFFFFFh
        je short .8
        mov edx, dword [dword_1174EC]
        add edx, dword [byte esi+063h]
        mov eax, dword [dword_1174F4]
        mov ebx, dword [byte edx+024h]
        mov ecx, 3Ch
        add ebx, eax
        mov eax, dword [byte ebp-018h]
        mov dword [byte ebp-01Ch], ebx
        mov ebx, 0FFFFFFFFh
        call FileWriteAt
        mov ecx, 15h
        mov ebx, 0FFFFFFFFh
        mov edx, dword [byte ebp-01Ch]
        mov eax, dword [byte ebp-018h]
        call FileWriteAt
.8:
        add esi, byte 4
        cmp esi, dword [byte ebp-08h]
        jne short .7
        mov esi, edi
        add edi, byte 0Ch
        mov dword [byte ebp-010h], edi
.9:
        cmp dword [dword esi+0C7h], byte 0FFFFFFFFh
        je short .10
        mov ecx, 3Ch
        mov edx, dword [dword_1174EC]
        mov ebx, 0FFFFFFFFh
        add edx, dword [dword esi+0C7h]
        mov edi, dword [dword_1174F4]
        mov eax, dword [byte ebp-018h]
        add edi, dword [byte edx+024h]
        call FileWriteAt
        mov ecx, 11h
        mov ebx, 0FFFFFFFFh
        mov eax, dword [byte ebp-018h]
        mov edx, edi
        call FileWriteAt
.10:
        add esi, byte 4
        cmp esi, dword [byte ebp-010h]
        jne short .9
        call FreeStatsTables
        jmp near .14
.11:
        mov esi, dword [gameopts]
        mov eax, dword [byte esi+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        mov dl, al
        imul eax, byte 1Ah
        mov byte [dword eax+byte_17CC37], dl
        mov eax, dword [byte esi+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul eax, byte 1Ah
        mov edx, dword [byte esi+01h]
        shl edx, 0Fh
        shr edx, 1Bh
        mov ebx, 7
        mov byte [dword eax+byte_17CC37], dl
        lea eax, [byte ebp-044h]
        mov edx, dword [dword_17CBE7]
        call MakeSeasonDbPath
        push dword 3A7h
        push unk_17CB2E
        lea eax, [byte ebp-044h]
        push eax
        call SaveDataFile
        mov ecx, 3A7h
        mov ebx, 0FFFFFFFFh
        add esp, byte 0Ch
        mov edx, unk_17CB2E
        mov eax, dword [byte ebp-018h]
        call FileWriteAt
        mov dword [byte ebp-04h], eax
        jmp near .14
.12:
        cmp dword [dword_17D267], byte 0
        je short .13
        mov esi, dword [gameopts]
        mov eax, dword [byte esi+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        mov dl, al
        imul eax, byte 1Ah
        mov byte [dword eax+byte_17CC37], dl
        mov eax, dword [byte esi+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        mov dl, al
        mov eax, dword [byte esi+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul eax, byte 1Ah
        mov ebx, 7
        mov byte [dword eax+byte_17CC37], dl
        lea eax, [byte ebp-044h]
        mov edx, dword [dword_17CBE7]
        call MakeSeasonDbPath
        push dword 3A7h
        push unk_17CB2E
        lea eax, [byte ebp-044h]
        push eax
        call SaveDataFile
        mov ecx, 3A7h
        mov ebx, 0FFFFFFFFh
        add esp, byte 0Ch
        mov edx, unk_17CB2E
        mov eax, dword [byte ebp-018h]
        call FileWriteAt
.13:
        mov ecx, 39Dh
        mov ebx, 0FFFFFFFFh
        mov edx, unk_17CED5
        mov eax, dword [byte ebp-018h]
        call FileWriteAt
        mov ebx, 7
        mov edx, dword [dword_17D162]
        mov dword [byte ebp-04h], eax
        lea eax, [byte ebp-044h]
        call MakePlayoffDbPath
        push dword 39Dh
        push unk_17CED5
        lea eax, [byte ebp-044h]
        push eax
        call SaveDataFile
        add esp, byte 0Ch
.14:
        cmp dword [byte ebp-04h], byte 0
        jne short .15
        mov eax, dword [byte ebp-018h]
        call SaveGameState
        mov dword [byte ebp-04h], eax
.15:
        lea eax, [byte ebp-018h]
        call FileClose
.16:
        cmp dword [byte ebp-04h], byte 0
        sete al
        movzx eax, al
        jmp near DrawPauseFrame_9C2
jpt_6B878:
        dd PauseMenu_66B
        dd PauseMenu_6F1
        dd PauseMenu_6FD
        dd PauseMenu_724
        dd PauseMenu_730
        dd PauseMenu_73C
        dd PauseMenu_748
;-----------------------------------------------------------------------------
; PauseMenu                                    6B894  96 PC, medium confidence
; The pause menu (PAUSREG; quit, return, chat ...) with RunMenu, kept in step
; in a link game (LinkSync)
;-----------------------------------------------------------------------------
PauseMenu:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 30Ch, 0
        sub ebp, 82h
        mov dword [byte ebp+07Eh], 0FFFFFFFFh
        cmp word [word_11D927], byte 0
        je short .1
        push dword [dword_11B234]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        mov eax, dword [dword_17D518]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        xor eax, eax
        call DrawPauseButtons
        call SetScreenTarget
        push byte 0
        mov eax, dword [dword_11B234]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        mov word [word_11D927], 0
        add esp, byte 0Ch
.1:
        push byte 20h
        push dword 1C0h
        push str_PAUSREG
        call AllocMemBlock
        mov edi, eax
        add esp, byte 0Ch
        mov dword [dword_17D4E8], eax
        test byte [byte_17CA5D], 20h
        je short .2
        mov ecx, 80h
        mov esi, unk_11D89C
        jmp short .3
.2:
        mov ecx, 80h
        mov esi, unk_11D81C
.3:
        rep movsb
        lea edx, [dword ebp-028Ah]
        mov eax, 7
        call InitMenuItems
        push str_Qui02
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        push str_Qui12
        push dword [dword_17D528]
        mov dword [dword ebp-0270h], eax
        call FindShape
        add esp, byte 8
        push str_Qui22
        push dword [dword_17D528]
        mov dword [dword ebp-026Ch], eax
        call FindShape
        mov dword [dword ebp-0268h], eax
        mov eax, dword [dword_17D4E8]
        mov dword [dword ebp-0276h], eax
        mov eax, dword [dword ebp-0270h]
        mov dword [dword ebp-027Ah], 3
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-0264h], eax
        mov eax, dword [dword ebp-0270h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0260h], eax
        mov eax, dword [dword ebp-0270h]
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        mov edx, dword [dword ebp-0264h]
        sar eax, 2
        push str_Ret02
        add edx, eax
        mov eax, dword [dword ebp-0270h]
        mov dword [dword ebp-0250h], edx
        push dword [dword_17D528]
        movsx eax, word [byte eax+06h]
        mov edx, dword [dword ebp-0260h]
        sar eax, 1
        mov byte [dword ebp-0245h], 1
        add edx, eax
        mov byte [dword ebp-0248h], 4
        mov dword [dword ebp-024Ch], edx
        call FindShape
        add esp, byte 8
        push str_Ret12
        push dword [dword_17D528]
        mov dword [dword ebp-020Ah], eax
        call FindShape
        add esp, byte 8
        push str_Ret22
        push dword [dword_17D528]
        mov dword [dword ebp-0206h], eax
        call FindShape
        mov dword [dword ebp-0202h], eax
        mov eax, dword [dword_17D4E8]
        add eax, byte 40h
        mov dword [dword ebp-0210h], eax
        mov eax, dword [dword ebp-020Ah]
        mov dword [dword ebp-0214h], 3
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-01FEh], eax
        mov eax, dword [dword ebp-020Ah]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-01FAh], eax
        mov eax, dword [dword ebp-020Ah]
        movsx eax, word [byte eax+04h]
        sar eax, 2
        mov edx, dword [dword ebp-01FEh]
        lea eax, [eax+eax*2]
        add edx, eax
        mov eax, dword [dword ebp-020Ah]
        mov dword [dword ebp-01EAh], edx
        movsx eax, word [byte eax+06h]
        mov edx, dword [dword ebp-01FAh]
        sar eax, 1
        add edx, eax
        mov ax, word [word_114CE0]
        add esp, byte 8
        xor ah, ah
        mov byte [dword ebp-01E2h], 5
        and al, 1
        mov byte [dword ebp-01E0h], 0
        cwde
        mov dword [dword ebp-01E6h], edx
        test eax, eax
        je short .4
        push str_Cht02
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        push str_Cht12
        jmp short .5
.4:
        push str_Edt02
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        push str_Edt12
.5:
        push dword [dword_17D528]
        mov dword [dword ebp-01A4h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-01A0h], eax
        mov eax, dword [dword_17D4EC]
        movsx edx, word [eax]
        mov eax, dword [dword_17D4E8]
        mov dword [dword eax+080h], edx
        mov eax, dword [dword_17D4F0]
        movsx edx, word [eax]
        mov eax, dword [dword_17D4E8]
        mov dword [dword eax+084h], edx
        push str_Rep0
        mov byte [dword ebp-0179h], 3
        push dword [dword_17D528]
        mov byte [dword ebp-017Bh], 4
        call FindShape
        add esp, byte 8
        push str_Rep1
        push dword [dword_17D528]
        mov dword [dword ebp-013Eh], eax
        call FindShape
        mov dword [dword ebp-013Ah], eax
        mov eax, dword [dword_17D4EC]
        movsx edx, word [byte eax+02h]
        mov eax, dword [dword_17D4E8]
        mov dword [dword eax+0C0h], edx
        mov eax, dword [dword_17D4F0]
        movsx edx, word [eax]
        mov eax, dword [dword_17D4E8]
        add esp, byte 8
        mov dword [dword eax+0C4h], edx
        push str_Ctr02
        mov byte [dword ebp-0114h], 2
        push dword [dword_17D528]
        mov byte [dword ebp-0115h], 5
        call FindShape
        add esp, byte 8
        push str_Ctr12
        push dword [dword_17D528]
        mov dword [dword ebp-0D8h], eax
        call FindShape
        mov dword [dword ebp-0D4h], eax
        mov eax, dword [dword_17D4EC]
        movsx edx, word [eax]
        mov eax, dword [dword_17D4E8]
        mov dword [dword eax+0100h], edx
        mov eax, dword [dword_17D4F0]
        movsx edx, word [byte eax+02h]
        mov eax, dword [dword_17D4E8]
        add esp, byte 8
        mov dword [dword eax+0104h], edx
        push str_Sts02
        mov byte [dword ebp-0ADh], 5
        mov byte [dword ebp-0B0h], 2
        push dword [dword_17D528]
        mov byte [dword ebp-0AFh], 0
        call FindShape
        add esp, byte 8
        push str_Sts12
        push dword [dword_17D528]
        mov dword [byte ebp-072h], eax
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-06Eh], eax
        mov eax, dword [dword_17D4EC]
        movsx edx, word [byte eax+02h]
        mov eax, dword [dword_17D4E8]
        mov dword [dword eax+0140h], edx
        mov eax, dword [dword_17D4F0]
        movsx edx, word [byte eax+02h]
        mov eax, dword [dword_17D4E8]
        mov dword [dword eax+0144h], edx
        mov ax, word [word_114CE0]
        xor ah, ah
        mov byte [byte ebp-048h], 4
        and al, 1
        mov byte [byte ebp-04Ah], 3
        cwde
        mov byte [byte ebp-049h], 1
        test eax, eax
        jne short .6
        push str_Sav02
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        push str_Sav12
        push dword [dword_17D528]
        mov dword [byte ebp-0Ch], eax
        call FindShape
        mov dword [byte ebp-08h], eax
        mov eax, dword [dword_17D4EC]
        movsx edx, word [byte eax+04h]
        mov eax, dword [dword_17D4E8]
        mov dword [dword eax+0180h], edx
        mov eax, dword [dword_17D4F0]
        movsx edx, word [byte eax+04h]
        mov eax, dword [dword_17D4E8]
        mov dword [dword eax+0184h], edx
        add esp, byte 8
        mov byte [byte ebp+01Ch], 5
        mov byte [byte ebp+01Eh], 0
        mov byte [byte ebp+01Fh], 1
        mov byte [dword ebp-0245h], 6
        mov byte [dword ebp-01E0h], 6
.6:
        mov edi, 2
        mov edx, 80h
        mov eax, 0CCh
        jmp near .8
.7:
        mov esi, dword [dword eax+ebp-0270h]
        movsx ebx, word [byte esi+04h]
        mov esi, dword [dword_17D4E8]
        add ebx, dword [edx+esi]
        mov dword [byte edx+esi+08h], ebx
        mov esi, dword [dword_17D4E8]
        mov ebx, dword [byte edx+esi+04h]
        mov dword [byte edx+esi+0Ch], ebx
        mov esi, dword [dword_17D4E8]
        mov ebx, dword [byte edx+esi+08h]
        mov dword [byte edx+esi+010h], ebx
        mov esi, dword [dword eax+ebp-0270h]
        movsx ebx, word [byte esi+06h]
        mov esi, dword [dword_17D4E8]
        add ebx, dword [byte edx+esi+04h]
        mov dword [byte edx+esi+014h], ebx
        mov esi, dword [dword_17D4E8]
        mov ebx, dword [edx+esi]
        mov dword [byte edx+esi+018h], ebx
        mov esi, dword [dword_17D4E8]
        mov ebx, dword [byte edx+esi+014h]
        mov dword [byte edx+esi+01Ch], ebx
        mov dword [dword eax+ebp-027Ah], 4
        mov ebx, dword [dword_17D4E8]
        add ebx, edx
        mov dword [dword eax+ebp-0276h], ebx
        mov esi, dword [dword_17D4E8]
        mov ebx, dword [edx+esi]
        mov dword [dword eax+ebp-0264h], ebx
        mov ebx, dword [byte edx+esi+04h]
        mov esi, dword [dword eax+ebp-0270h]
        mov dword [dword eax+ebp-0260h], ebx
        movsx ebx, word [byte esi+04h]
        sar ebx, 1
        add ebx, dword [dword eax+ebp-0264h]
        mov esi, dword [dword eax+ebp-0270h]
        mov dword [dword eax+ebp-0250h], ebx
        movsx ebx, word [byte esi+06h]
        add eax, byte 66h
        sar ebx, 1
        inc edi
        add ebx, dword [dword eax+ebp-02C6h]
        add edx, byte 40h
        mov dword [dword eax+ebp-02B2h], ebx
.8:
        mov bx, word [word_114CE0]
        xor bh, bh
        and bl, 1
        movsx ebx, bx
        test ebx, ebx
        sete bl
        movzx ebx, bl
        add ebx, byte 6
        cmp edi, ebx
        jl near .7
        call SetScreenTarget
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        push dword [dword_11F5C4]
        push dword [dword_11F5C0]
        push byte 0
        push byte 0
        call SetViewRect
        mov edx, dword [dword ebp-01E6h]
        add esp, byte 10h
        mov eax, dword [dword ebp-01EAh]
        mov byte [byte ebp+042h], 0
        call SetMenuMouse
        mov eax, 1
        mov dword [byte ebp+07Ah], 1
        call LinkSync
.9:
        call SoundIdle
        cmp dword [byte ebp+07Ah], byte 0
        jl short .11
        cmp dword [byte ebp+07Ah], byte 7
        jge short .11
        imul eax, dword [byte ebp+07Ah], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0250h]
        jne short .10
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-024Ch]
        je short .11
.10:
        mov dword [byte ebp+07Ah], 0FFFFFFFFh
.11:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        mov edx, eax
        or dl, 2
        movsx edx, dx
        push edx
        mov ebx, 0FFFFFFFFh
        push byte 0
        lea edx, [byte ebp+07Ah]
        cwde
        push edx
        test eax, eax
        sete al
        xor ecx, ecx
        movzx eax, al
        lea edx, [dword ebp-028Ah]
        add eax, byte 6
        call RunMenu
        cmp dword [byte ebp+07Ah], byte 6
        ja near PauseMenu_748.25
        mov eax, dword [byte ebp+07Ah]
        jmp dword [nosplit cs:eax*4+jpt_6B878]
PauseMenu_66B:
        mov eax, 2
        call GetLangText
        mov dword [dword_17D4FC], eax
        mov eax, 3
        call GetLangText
        mov dword [dword_17D500], eax
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
        mov ebx, dword_17D4FC
        push byte 0
        mov eax, 1D2h
        mov edx, 2
        call GetLangText
        call MessageBox
        test eax, eax
        jne near PauseMenu_748.25
        mov dword [dword_1150FC], 2
        mov eax, 3
        mov dword [byte ebp+07Eh], 0FFFFFFFEh
        call FadeOut
        jmp near PauseMenu_748.25
PauseMenu_6F1:
        mov dword [byte ebp+07Eh], 0FFFFFFFEh
        jmp near PauseMenu_748.25
PauseMenu_6FD:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .12
        mov dword [byte ebp+07Eh], 4
        jmp near PauseMenu_748.25
.12:
        mov dword [byte ebp+07Eh], 2
        jmp near PauseMenu_748.25
PauseMenu_724:
        mov dword [byte ebp+07Eh], 1
        jmp near PauseMenu_748.25
PauseMenu_730:
        mov dword [byte ebp+07Eh], 0
        jmp near PauseMenu_748.25
PauseMenu_73C:
        mov dword [byte ebp+07Eh], 5
        jmp near PauseMenu_748.25
PauseMenu_748:
        xor esi, esi
        test byte [optflags], 70h
        jne short .14
        mov edx, 5
        mov eax, unk_17D52C
        xor ebx, ebx
        call MakeDirPath
        mov edx, str_EXHIBITNDX3
        mov eax, unk_17D52C
        call NameIndexLoad
        mov esi, eax
        test eax, eax
        jne short .13
        mov edx, str_EXHIBITNDX3
        mov eax, unk_17D52C
        call NameIndexNew
        mov esi, eax
.13:
        mov eax, esi
        call NameIndexFirstId
        push eax
        push str_08d3
        jmp near .18
.14:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 10h
        jne short .15
        mov edx, 4
        mov eax, unk_17D52C
        xor ebx, ebx
        call MakeDirPath
        push dword [dword_17CBE7]
        push str_05d4
        lea eax, [byte ebp+06Eh]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp+06Eh]
        mov eax, unk_17D52C
        call strcat_
        mov eax, dword [dword_17CB2F]
        shl eax, 0Fh
        shr eax, 1Bh
        add eax, byte 41h
        push eax
        push str_CsgDb3
        jmp short .18
.15:
        cmp eax, byte 20h
        jne near .25
        cmp dword [dword_17CC17], byte 0
        je short .16
        mov edx, 4
        mov eax, unk_17D52C
        xor ebx, ebx
        call MakeDirPath
        push dword [dword_17CBE7]
        jmp short .17
.16:
        mov edx, 6
        mov eax, unk_17D52C
        xor ebx, ebx
        call MakeDirPath
        push dword [dword_17D162]
.17:
        push str_05d4
        lea eax, [byte ebp+06Eh]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp+06Eh]
        mov eax, unk_17D52C
        call strcat_
        mov eax, dword [dword_17CED6]
        shl eax, 0Fh
        shr eax, 1Bh
        add eax, byte 41h
        push eax
        push str_CsgDb3
.18:
        lea eax, [byte ebp+06Eh]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp+06Eh]
        mov eax, unk_17D52C
        call strcat_
        test esi, esi
        jne short .19
        mov eax, 1D3h
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp+042h]
        call strcpy_
        xor eax, eax
        jmp short .20
.19:
        lea eax, [byte ebp+042h]
        push eax
        mov eax, dword [dword_11F5C4]
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        mov byte [byte ebp+042h], 0
        sar eax, 1
        mov ecx, 1Eh
        push eax
        mov eax, 139h
        mov ebx, byte_11D91C
        call GetLangText
        mov edx, eax
        xor eax, eax
        call EditText
        test eax, eax
        sete al
        movzx eax, al
.20:
        test eax, eax
        jne near .24
        mov eax, dword [gameopts]
        and byte [eax], 0FEh
        mov eax, unk_17D52C
        call SaveGameFile
        test eax, eax
        jne short .21
        call GetLangText
        mov dword [dword_17D4FC], eax
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
        mov ebx, dword_17D4FC
        push byte 0
        mov eax, 60h
        mov edx, 1
        call GetLangText
        call MessageBox
        jmp near .24
.21:
        test esi, esi
        je short .22
        lea ebx, [byte ebp+042h]
        lea edx, [byte ebp+06Eh]
        mov eax, esi
        call NameIndexAdd
        mov esi, eax
.22:
        xor eax, eax
        call GetLangText
        mov dword [dword_17D4FC], eax
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
        mov ebx, dword_17D4FC
        push byte 0
        mov eax, 61h
        mov edx, 1
        call GetLangText
        call MessageBox
        test byte [optflags], 70h
        je short .23
        mov dword [dword_1150FC], 2
        mov dword [byte ebp+07Eh], 0FFFFFFFEh
.23:
        mov word [word_11D927], 1
.24:
        test esi, esi
        je short .25
        mov eax, 1
        mov edx, esi
        call NameIndexFree
.25:
        cmp dword [byte ebp+07Eh], byte 0FFFFFFFFh
        je near PauseMenu.9
        push dword [dword_17D4E8]
        call FreeMemBlock
        mov eax, dword [byte ebp+07Eh]
        add esp, byte 4
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near DrawPauseFrame_9C3
;-----------------------------------------------------------------------------
; PauseToFrontEnd                              6C294  96 PC, medium confidence
; From the pause: leaves the game view for a front-end screen (fade, free
; sprites and sounds, front-end sound banks, FhiL / FhiR)
;-----------------------------------------------------------------------------
PauseToFrontEnd:
        push ebx
        push ecx
        push edx
        push esi
        mov eax, 2
        call FadeOut
        call FreeColourLookup
        call FreeTotalSprites
        push byte 20h
        mov eax, dword [dword_17D518]
        push dword [byte eax+04h]
        push dword [eax]
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        mov eax, dword [dword_17D518]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [dword_17D518]
        call FreeBitmap
        add esp, byte 4
        mov dword [dword_17D518], esi
        call RestoreSpeechBuffer
        call FreeFightSprites
        call StopAllSfx
        call EndGameSound
        call ResetInputSlots
        push str_FhiL5
        push dword [dword_1150D4]
        call FindShape
        add esp, byte 8
        push str_FhiR5
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call FindShape
        add esp, byte 8
        mov dword [dword_152F50], eax
        test byte [byte_17CA5D], 20h
        jne short .1
        push dword [dword_152F54]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_152F5C]
        call FreeMemBlock
        add esp, byte 4
        mov edx, 20h
        mov eax, dword [dword_152F58]
        call CopyBitmap
        mov edx, 20h
        mov dword [dword_152F54], eax
        mov eax, dword [dword_152F50]
        call CopyBitmap
        mov dword [dword_152F5C], eax
.1:
        call LoadFrontEndArt
        test byte [byte_17CA5D], 20h
        jne short .2
        mov eax, 1
        call SetScreenMode
.2:
        mov eax, 44h
        call QueueMusic
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PauseBackToGame                              6C3B0  96 PC, medium confidence
; Back from a front-end screen into the paused game (music off, free the
; front-end art, controllers, GloL / GhiL art, screen mode)
;-----------------------------------------------------------------------------
PauseBackToGame:
        push ebx
        push ecx
        push edx
        push esi
        mov eax, 3
        call FadeOut
        xor edx, edx
        mov eax, 64h
        call FadeOutMusic
        call StopMusic
        call FreeFrontEndArt
        test byte [byte_17CA5D], 20h
        jne short .1
        push dword [dword_152F54]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_152F5C]
        call FreeMemBlock
        add esp, byte 4
        push str_GloL3
        push dword [dword_1150D4]
        call FindShape
        add esp, byte 8
        push str_GloR3
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call FindShape
        mov edx, 20h
        add esp, byte 8
        mov dword [dword_152F50], eax
        mov eax, dword [dword_152F58]
        call CopyBitmap
        mov edx, 20h
        mov dword [dword_152F54], eax
        mov eax, dword [dword_152F50]
        call CopyBitmap
        mov dword [dword_152F5C], eax
        jmp short .2
.1:
        push str_GhiL3
        push dword [dword_1150D4]
        call FindShape
        add esp, byte 8
        push str_GhiR3
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call FindShape
        add esp, byte 8
        mov dword [dword_152F50], eax
.2:
        call InitSlotTable
        call RefreshControlSlots
        test byte [byte_17CA5D], 20h
        jne short .3
        xor eax, eax
        call SetScreenMode
.3:
        call StopAllSfx
        call FreeColourLookup
        push byte 20h
        mov eax, dword [dword_17D518]
        push dword [byte eax+04h]
        push dword [eax]
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        mov eax, dword [dword_17D518]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [dword_17D518]
        call FreeBitmap
        add esp, byte 4
        mov dword [dword_17D518], esi
        call StartGameSound
        call FreeSpeechBuffer
        push byte 0
        mov eax, dword [dword_17D518]
        push dword [byte eax+04h]
        push dword [eax]
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        mov eax, dword [dword_17D518]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [dword_17D518]
        call FreeBitmap
        add esp, byte 4
        mov dword [dword_17D518], esi
        call LoadFightSprites
        push byte 20h
        mov eax, dword [dword_17D518]
        push dword [byte eax+04h]
        push dword [eax]
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        mov eax, dword [dword_17D518]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [dword_17D518]
        call FreeBitmap
        add esp, byte 4
        mov dword [dword_17D518], esi
        call RestoreSpeechBuffer
        mov eax, unk_16443C
        call SetScreenPalette
        call FreeSpeechBuffer
        push byte 0
        mov eax, dword [dword_17D518]
        push dword [byte eax+04h]
        push dword [eax]
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        mov eax, dword [dword_17D518]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [dword_17D518]
        call FreeBitmap
        add esp, byte 4
        mov dword [dword_17D518], esi
        call LoadTotalSprites
        xor eax, eax
        call CrowdNoiseReset
        call SetScreenTarget
        push byte 0
        mov eax, dword [dword_17D518]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        mov ebx, 2
        add esp, byte 0Ch
        xor eax, eax
        mov edx, unk_16443C
        call DrawPauseButtons
        xor eax, eax
        mov word [word_11D927], 0
        call FadePalette
        mov eax, 1
        call LinkSync
        pop esi
        pop edx
        pop ecx
        pop ebx
PauseBackToGame_28A:
        ret
LoadModeStatsJumpTable:
        dd LoadExhibitionStats
        dd LoadCurrentSeasonStats
        dd LoadPlayoffOrSeasonStats
        dd LoadModemStats
;-----------------------------------------------------------------------------
; LoadModeStats                                   6C64B  96 PC, low confidence
; Loads the stats of the current game mode
;-----------------------------------------------------------------------------
LoadModeStats:
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 3
        ja short PauseBackToGame_28A
        jmp dword [nosplit cs:eax*4+LoadModeStatsJumpTable]
;-----------------------------------------------------------------------------
; LoadCurrentSeasonStats                          6C663  96 PC, low confidence
; Loads the current season's stats
;-----------------------------------------------------------------------------
LoadCurrentSeasonStats:
        mov eax, dword [dword_17CBE7]
        jmp near LoadSeasonStats
;-----------------------------------------------------------------------------
; LoadPlayoffOrSeasonStats                        6C66D  96 PC, low confidence
; Loads the playoff stats, or the season's when no playoffs are running
;-----------------------------------------------------------------------------
LoadPlayoffOrSeasonStats:
        cmp dword [dword_17D267], byte 0
        jne short LoadCurrentSeasonStats
        mov eax, dword [dword_17D162]
        jmp near LoadPlayoffStats
jpt_6C680:
        dd PauseGame_375
        dd PauseGame_3A3
        dd PauseGame_47F
        dd PauseGame_620
        dd PauseGame_5F4
        dd PauseGame_611
;-----------------------------------------------------------------------------
; PauseGame                                    6C698  96 PC, medium confidence
; RunInGameMenu's pause (request 1): frees the speech buffer and sprite
; cache, quiets the crowd, runs the pause menu and its screens, restores the
; game
;-----------------------------------------------------------------------------
PauseGame:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 18h, 0
        call FreeSpeechBuffer
        call GetSoundCard
        test eax, eax
        jge short .1
        call FreeSpriteCache
.1:
        mov dword [dword_11D91F], 1
        call GetCrowdTarget
        mov dword [byte ebp-018h], eax
        xor eax, eax
        call SetCrowdTarget
        test byte [byte_17CA5D], 20h
        je short .2
        mov dword [dword_17D51C], unk_11D7D4
        mov dword [dword_17D520], unk_11D7EC
        mov dword [dword_17D4EC], unk_11D810
        mov dword [dword_17D4F0], unk_11D816
        mov dword [dword_17D524], 87AEh
        jmp short .3
.2:
        mov dword [dword_17D51C], unk_11D7A4
        mov dword [dword_17D520], unk_11D7BC
        mov dword [dword_17D4EC], unk_11D804
        mov dword [dword_17D4F0], unk_11D80A
        mov dword [dword_17D524], 3D70h
.3:
        mov esi, dword [dword_17D51C]
        movsx eax, word [byte esi+06h]
        mov dword [dword_17D508], eax
        mov eax, dword [dword_17D520]
        movsx edx, word [byte eax+0Eh]
        mov dword [dword_17D50C], edx
        movsx ebx, word [byte esi+08h]
        movsx edx, word [byte esi+06h]
        sub ebx, edx
        inc ebx
        mov dword [dword_17D4F8], ebx
        movsx edx, word [byte eax+010h]
        movsx eax, word [byte eax+0Eh]
        sub edx, eax
        push str_Paus
        inc edx
        push dword [dword_17D528]
        mov dword [dword_17D4F4], edx
        call FindShape
        add esp, byte 8
        mov esi, eax
        push str_Sid12
        movsx eax, word [byte eax+04h]
        movsx edi, word [byte esi+06h]
        push dword [dword_17D528]
        mov dword [byte ebp-0Ch], eax
        call FindShape
        add esp, byte 8
        push str_Bot12
        movsx eax, word [byte eax+06h]
        push dword [dword_17D528]
        add edi, eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push byte 0
        add edi, eax
        push edi
        push dword [byte ebp-0Ch]
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [dword_17D514], eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call ClearClipRect
        add esp, byte 4
        push byte 0
        push byte 0
        push esi
        call PutBlock
        add esp, byte 0Ch
        push str_Sid12
        push dword [dword_17D528]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        movsx ebx, word [byte esi+0Eh]
        add esp, byte 8
        sub edx, ebx
        push edx
        movsx ebx, word [byte eax+0Ch]
        movsx edx, word [byte esi+0Ch]
        sub ebx, edx
        push ebx
        push eax
        call PutBlock
        add esp, byte 0Ch
        push str_Sid22
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        sub ebx, edx
        push ebx
        movsx edx, word [byte eax+0Ch]
        movsx ebx, word [byte esi+0Ch]
        sub edx, ebx
        push edx
        push eax
        call PutBlock
        add esp, byte 0Ch
        push str_Bot12
        push dword [dword_17D528]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        add esp, byte 8
        sub ebx, edx
        push ebx
        movsx edx, word [byte eax+0Ch]
        movsx ebx, word [byte esi+0Ch]
        sub edx, ebx
        push edx
        push eax
        call PutBlock
        add esp, byte 0Ch
        push str_Bot22
        push dword [dword_17D528]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        add esp, byte 8
        sub ebx, edx
        push ebx
        movsx edx, word [byte eax+0Ch]
        movsx ebx, word [byte esi+0Ch]
        sub edx, ebx
        push edx
        push eax
        call PutBlock
        add esp, byte 0Ch
        push str_Bot32
        push dword [dword_17D528]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        add esp, byte 8
        sub ebx, edx
        push ebx
        movsx edx, word [byte esi+0Ch]
        movsx ebx, word [byte eax+0Ch]
        sub ebx, edx
        push ebx
        push eax
        call PutBlock
        add esp, byte 0Ch
        mov eax, 1
        call DrawPauseButtons
        push dword [dword_11B234]
        call SetDrawBitmap
        add esp, byte 4
        cmp word [word_114F14], byte 0
        je short .7
        mov edx, 0FFFFFFFFh
        mov eax, 0Ah
        mov esi, 0FAh
        call CloseTextOverlay
.4:
        test esi, esi
        je short .6
        cmp esi, byte 14h
        jle short .5
        mov eax, 14h
        call UpdateCamera
        sub esi, byte 14h
        jmp short .4
.5:
        mov eax, esi
        call UpdateCamera
        xor esi, esi
        jmp short .4
.6:
        mov dword [byte ebp-04h], 1
        jmp short .9
.7:
        mov eax, 64h
        call StopArenaClip
        mov eax, dword [gameopts]
        test byte [byte eax+02h], 8
        je short .8
        mov dword [dword_11D923], 1
        call GetTicks
        sub eax, 0FBh
        mov dword [dword_17D510], eax
        mov eax, 0FBh
        mov dword [byte ebp-04h], 0
        call Crowd_Noise
        jmp short .9
.8:
        mov eax, 1
        mov dword [byte ebp-04h], 1
        call RunPausedFrame
.9:
        xor eax, eax
        mov word [word_11D929], 1
        call DrawGameFrame
        cmp word [word_114F14], byte 0
        je short .10
        mov ebx, 2
        mov edx, unk_16443C
        xor eax, eax
        call FadePalette
        mov word [word_114F14], 0
.10:
        mov word [word_11D927], 0
        call CrowdPause
.11:
        call PauseMenu
        mov dword [byte ebp-010h], eax
        cmp eax, byte 5
        ja near PauseGame_620
        jmp dword [nosplit cs:eax*4+jpt_6C680]
PauseGame_375:
        call PauseToFrontEnd
.12:
        xor eax, eax
        call ControllerScreen
        mov edx, eax
        cmp eax, byte 0Fh
        jne short .13
        xor eax, eax
        mov dword [dword_1843B0], 3
        call RunEditLines
.13:
        cmp edx, byte 0Fh
        je short .12
        jmp near PauseGame_611.29
PauseGame_3A3:
        cmp dword [curperiod], byte 0FFFFFFFFh
        je near .15
        call ReplayBufferEnd
        cmp eax, dword [dword_16596C]
        je short .15
        call CrowdResume
        mov eax, dword [byte ebp-018h]
        call SetCrowdTarget
        mov eax, 7Fh
        call Crowd_Noise
        call ReplayScreen
        call FreeSpriteCache
        push dword [dword_11F5C4]
        push dword [dword_11F5C0]
        push byte 0
        push byte 0
        call SetViewRect
        mov edx, dword [dword_11F5C4]
        mov eax, dword [dword_11F5C0]
        add esp, byte 10h
        sar edx, 1
        sar eax, 1
        call SetMenuMouse
        xor eax, eax
        call SetCrowdTarget
        mov eax, 7Fh
        call Crowd_Noise
        call CrowdPause
.14:
        mov word [word_11D927], 1
        jmp near PauseGame_620
.15:
        xor eax, eax
        call GetLangText
        mov dword [dword_17D4FC], eax
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
        mov ebx, dword_17D4FC
        push byte 0
        mov eax, 1D4h
.16:
        mov edx, 1
        call GetLangText
        call MessageBox
        jmp near PauseGame_620
PauseGame_47F:
        xor edx, edx
        xor eax, eax
        xor ebx, ebx
        xor edi, edi
.17:
        mov esi, dword [gameopts]
        mov dword [byte ebp-08h], esi
        movsx esi, word [byte edi+esi+09h]
        cmp esi, byte 1
        je short .19
        mov esi, dword [byte ebp-08h]
        cmp byte [byte esi+ebx+05h], 0
        je short .18
        inc eax
        jmp short .19
.18:
        inc edx
.19:
        inc ebx
        inc edi
        inc edi
        cmp ebx, byte 4
        jl short .17
        test eax, eax
        jne short .20
        test edx, edx
        je near .28
.20:
        test eax, eax
        je short .21
        test edx, edx
        jne short .25
.21:
        mov dword [dword_1843B0], 3
        test eax, eax
        je short .22
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        mov dword [dword_1843AC], 0
        jmp short .23
.22:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        mov dword [dword_1843AC], 1
.23:
        mov dword [dword_1843B4], eax
.24:
        call PauseToFrontEnd
        xor eax, eax
        call RunEditLines
        jmp near PauseGame_611.29
.25:
        mov eax, 1
        call GetLangText
        mov dword [dword_17D4FC], eax
        mov eax, 14Ch
        call GetLangText
        mov dword [dword_17D500], eax
        mov eax, 14Dh
        call GetLangText
        push byte 2
        mov dword [dword_17D504], eax
        mov eax, dword [dword_11F5C4]
        push byte 0
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        push eax
        mov ecx, byte_11D91C
        mov ebx, dword_17D4FC
        push byte 0
        mov eax, 14Bh
        mov edx, 3
        call GetLangText
        call MessageBox
        mov dword [dword_1843AC], eax
        test eax, eax
        je near PauseGame_620
        mov dword [dword_1843B0], 3
        cmp eax, byte 2
        jne short .26
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        jmp short .27
.26:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
.27:
        shr eax, 1Bh
        mov dword [dword_1843B4], eax
        dec dword [dword_1843AC]
        jmp near .24
.28:
        call GetLangText
        push byte 2
        mov dword [dword_17D4FC], eax
        mov eax, dword [dword_11F5C4]
        push edx
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        push eax
        mov ecx, byte_11D91C
        mov ebx, dword_17D4FC
        push edx
        mov eax, 208h
        jmp near PauseGame_3A3.16
PauseGame_5F4:
        push byte 0
        mov ecx, 30h
        mov ebx, 7Eh
        mov edx, 1Bh
        xor eax, eax
        call ModemChat
        jmp near PauseGame_3A3.14
PauseGame_611:
        call PauseToFrontEnd
        call GameStatsScreen
.29:
        call PauseBackToGame
PauseGame_620:
        cmp dword [byte ebp-010h], byte 0
        jge near PauseGame.11
        mov eax, 1
        call LinkSync
        push dword [dword_17D518]
        call FreeBitmap
        add esp, byte 4
        push str_Paus
        push dword [dword_17D528]
        call FindShape
        add esp, byte 8
        mov esi, eax
        push str_Sid12
        movsx eax, word [byte eax+04h]
        movsx edi, word [byte esi+06h]
        push dword [dword_17D528]
        mov dword [byte ebp-014h], eax
        call FindShape
        add esp, byte 8
        push str_Bot12
        movsx eax, word [byte eax+06h]
        push dword [dword_17D528]
        add edi, eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push byte 0
        add edi, eax
        push edi
        push dword [byte ebp-014h]
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [dword_17D514], eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call ClearClipRect
        add esp, byte 4
        push byte 0
        push byte 0
        push esi
        call PutBlock
        add esp, byte 0Ch
        push str_Sid12
        push dword [dword_17D528]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        add esp, byte 8
        sub ebx, edx
        push ebx
        movsx edx, word [byte eax+0Ch]
        movsx ebx, word [byte esi+0Ch]
        sub edx, ebx
        push edx
        push eax
        call PutBlock
        add esp, byte 0Ch
        push str_Sid22
        push dword [dword_17D528]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        add esp, byte 8
        sub ebx, edx
        push ebx
        movsx edx, word [byte eax+0Ch]
        movsx ebx, word [byte esi+0Ch]
        sub edx, ebx
        push edx
        push eax
        call PutBlock
        add esp, byte 0Ch
        push str_Bot12
        push dword [dword_17D528]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        movsx ebx, word [byte esi+0Eh]
        add esp, byte 8
        sub edx, ebx
        push edx
        movsx ebx, word [byte esi+0Ch]
        movsx edx, word [byte eax+0Ch]
        sub edx, ebx
        push edx
        push eax
        call PutBlock
        add esp, byte 0Ch
        push str_Bot22
        push dword [dword_17D528]
        call FindShape
        movsx edx, word [byte eax+0Eh]
        movsx ebx, word [byte esi+0Eh]
        add esp, byte 8
        sub edx, ebx
        push edx
        movsx ebx, word [byte eax+0Ch]
        movsx edx, word [byte esi+0Ch]
        sub ebx, edx
        push ebx
        push eax
        call PutBlock
        add esp, byte 0Ch
        push str_Bot32
        push dword [dword_17D528]
        call FindShape
        movsx ebx, word [byte eax+0Eh]
        movsx edx, word [byte esi+0Eh]
        add esp, byte 8
        sub ebx, edx
        push ebx
        movsx edx, word [byte eax+0Ch]
        movsx ebx, word [byte esi+0Ch]
        sub edx, ebx
        push edx
        push eax
        call PutBlock
        add esp, byte 0Ch
        mov eax, 1
        call DrawPauseButtons
        push dword [dword_11B234]
        call SetDrawBitmap
        add esp, byte 4
        cmp dword [dword_1150FC], byte 0
        jne short .31
        push dword [dword_11F5C4]
        push dword [dword_11F5C0]
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
        push dword [dword_11B324]
        push dword [dword_11B320]
        call MouseRead
        add esp, byte 8
        call CrowdResume
        mov eax, dword [byte ebp-018h]
        call SetCrowdTarget
        cmp dword [byte ebp-04h], byte 0
        je short .30
        xor eax, eax
        call RunPausedFrame
        jmp short .32
.30:
        mov eax, 0FAh
        call Crowd_Noise
        jmp short .32
.31:
        call SetScreenTarget
        cmp dword [byte ebp-04h], byte 0
        je short .32
        mov eax, 0Ah
        call EndCameraShot
.32:
        push dword [dword_17D514]
        call FreeBitmap
        add esp, byte 4
        call FreeSpriteCache
        call RestoreSpeechBuffer
        mov dword [dword_11D91F], 0
        jmp near DrawPauseFrame_9C2
