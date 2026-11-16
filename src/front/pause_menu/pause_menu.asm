; The in-game menu: RunInGameMenu and the pause menu screens of a game (96 PC; its routines still to be named).
bits 32
%include "hockey.inc"
section s_6A7D3 progbits alloc exec nowrite align=1
extern awtmstruct, byte_11D91C, byte_11FA2F, byte_17CA5D, byte_17CC37, CloseTextOverlay, Crowd_Noise, CrowdNoiseReset
extern CrowdPause, CrowdResume, curperiod, dword_1150D4, dword_1150D8, dword_1150FC, dword_1174EC, dword_1174F0
extern dword_1174F4, dword_11B234, dword_11B320, dword_11B324, dword_11BC24, dword_11D91F, dword_11D923, dword_11F5C0
extern dword_11F5C4, dword_152F4C, dword_152F50, dword_152F54, dword_152F58, dword_152F5C, dword_16596C, dword_177108
extern dword_179918, dword_179920, dword_17CB2F, dword_17CBE7, dword_17CC17, dword_17CED6, dword_17D162, dword_17D267
extern dword_17D4E8, dword_17D4EC, dword_17D4F0, dword_17D4F4, dword_17D4F8, dword_17D4FC, dword_17D500, dword_17D504
extern dword_17D508, dword_17D50C, dword_17D510, dword_17D514, dword_17D518, dword_17D51C, dword_17D520, dword_17D524
extern dword_17D528, dword_17D564, dword_17D56C, dword_17D574, dword_17D57C, dword_17D580, dword_1843AC, dword_1843B0
extern dword_1843B4, EditText, EndGameSound, FadeOutMusic, FileClose, FileCreate, FileWriteAt, FreeSpeechBuffer
extern FreeStatsTables, gameclock, GameLoopActive, gameopts, GameStatsScreen, GetCrowdTarget, GetInputDevices, GetSoundCard
extern GetTicks, gmode, gsp, hmtmstruct, InGameMenuRequest, InitSlotTable, LinkResyncInput, LinkSync
extern LoadExhibitionStats, LoadModemStats, LoadPlayoffStats, LoadSeasonStats, LoadTeamLogo, MakeDirPath, MessageBox, ModemChat
extern MouseRead, mousex, mousey, NameIndexAdd, NameIndexFirstId, NameIndexFree, NameIndexLoad, NameIndexNew
extern optblock_end, optflags, PickUsersScreen, PutBlock, QueueMusic, ResetInputSlots, ResetSlotButtons, RestoreSpeechBuffer
extern SaveGameState, SetClipWindow, SetCrowdTarget, SetDrawBitmap, SetViewRect, SoundIdle, sprintf_, StartGameSound
extern StopAllSfx, StopArenaClip, StopMusic, str_05d4, str_08d3, str_Bot12, str_Bot22, str_Bot32
extern str_Cht02, str_Cht12, str_CsgDb3, str_Ctr02, str_Ctr12, str_D16, str_Edt02, str_Edt12
extern str_EXHIBITNDX3, str_FhiL5, str_FhiR5, str_GhiL3, str_GhiR3, str_GloL3, str_GloR3, str_Jy1D
extern str_Jy2D, str_Jy3D, str_Jy4D, str_KeyD2, str_Log7, str_Logx, str_MdmD, str_MseD2
extern str_Paus, str_PAUSREG, str_PlyD, str_Qui02, str_Qui12, str_Qui22, str_Rep0, str_Rep1
extern str_Ret02, str_Ret12, str_Ret22, str_Sav02, str_Sav12, str_Sid12, str_Sid22, str_Sts02
extern str_Sts12, strcat_, strcpy_, sub_3A6F3, sub_5360D, sub_5439F, sub_564A4, sub_57B11
extern sub_5A572, sub_5B0F9, sub_60777, sub_612BC, sub_621D9, sub_62201, sub_6225D, sub_62285
extern sub_62311, sub_625F7, sub_62ED9, sub_63998, sub_63A5B, sub_63B0C, sub_63DC4, sub_63F79
extern sub_640D3, sub_64103, sub_641D4, sub_6423E, sub_64296, sub_64721, sub_64F59, sub_66373
extern sub_6F056, sub_77355, sub_78E9E, sub_78EFA, sub_9CDDA, sub_A25CD, sub_AA7E0, sub_AA988
extern sub_AAA40, sub_AADA4, sub_AB758, sub_ABF4C, sub_AD35C, sub_ADBEC, sub_B0CA8, sub_B22E0
extern sub_B2C54, sub_B58D8, sub_BB8E0, sub_DD6C4, sub_E04E0, sub_E0584, TextSetFont, unk_11D7A4
extern unk_11D7BC, unk_11D7D4, unk_11D7EC, unk_11D804, unk_11D80A, unk_11D810, unk_11D816, unk_11D81C
extern unk_11D89C, unk_16443C, unk_17CB2E, unk_17CED5, unk_17D3E8, unk_17D52C, word_114CE0, word_114CE4
extern word_114F14, word_117902, word_11D927, word_11D929, word_1656E8, word_16581E, word_17D58C, word_17D58E
global RunInGameMenu, sub_6A891, sub_6AA3B, sub_6AA3B_9C2, sub_6AA3B_9C3, sub_6B404, jpt_6B476, sub_6B486
global sub_6B486_59, sub_6B486_60, sub_6B486_6C, sub_6B486_81, jpt_6B878, sub_6B894, sub_6B894_66B, sub_6B894_6F1
global sub_6B894_6FD, sub_6B894_724, sub_6B894_730, sub_6B894_73C, sub_6B894_748, sub_6C294, sub_6C3B0, sub_6C3B0_28A
global jpt_6C63B, sub_6C64B, sub_6C663, sub_6C66D, jpt_6C680, sub_6C698, sub_6C698_375, sub_6C698_3A3
global sub_6C698_47F, sub_6C698_5F4, sub_6C698_611, sub_6C698_620, sub_6CF0D, sub_6CF0D_6, sub_6CF1B, unk_6D31C
global jpt_6D32C, sub_6D350, sub_6D350_2C, sub_6D350_F2, sub_6D350_199, sub_6D350_240, sub_6D350_2E7, sub_6D350_38E
global sub_6D350_435, sub_6D350_4D0, sub_6D828, unk_6DB28, jpt_6DB38, sub_6DB5C, sub_6DB5C_51, sub_6DB5C_5D
global sub_6DB5C_69, sub_6DB5C_75, sub_6DB5C_81, sub_6DB5C_8D, sub_6DB5C_99, sub_6DB5C_A5, sub_6DB5C_CB, sub_6DC2F
global sub_6DD1E
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
        call sub_6C698
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
        call sub_57B11
        call RestoreSpeechBuffer
        jmp short .5
.4:
        call sub_A25CD
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
; sub_6A891                                                       6A891  96 PC
;-----------------------------------------------------------------------------
sub_6A891:
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
        call sub_E04E0
        movsx edx, word [byte eax+0Eh]
        add esp, byte 8
        sub edx, esi
        push edx
        movsx edx, word [byte eax+0Ch]
        sub edx, edi
        push edx
        push eax
        call sub_AAA40
        add esp, byte 0Ch
        push str_Ret02
        push dword [dword_17D528]
        call sub_E04E0
        movsx edx, word [byte eax+0Eh]
        add esp, byte 8
        sub edx, esi
        push edx
        movsx edx, word [byte eax+0Ch]
        sub edx, edi
        push edx
        push eax
        call sub_AAA40
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
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AAA40
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
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AAA40
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
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AAA40
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
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AAA40
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
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AAA40
        add esp, byte 0Ch
        jmp near sub_6AA3B_9C3
;-----------------------------------------------------------------------------
; sub_6AA3B                                                       6AA3B  96 PC
;-----------------------------------------------------------------------------
sub_6AA3B:
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
        je near sub_6AA3B_9C2
        call GetTicks
        mov edi, eax
        sub edi, dword [dword_17D510]
        cmp edi, 0FAh
        jle short .1
        mov edi, 0FAh
.1:
        mov eax, dword [dword_152F4C]
        call sub_B58D8
        xor edx, edx
        xor ecx, ecx
        mov eax, 30h
        mov dword [dword_11BC24], 0FFFFFFFFh
        call sub_63F79
        push dword [dword_11F5C4]
        mov ebx, dword [dword_11F5C0]
        inc dword [dword_177108]
        xor edx, edx
        mov eax, dword [dword_177108]
        call sub_5439F
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
        call sub_641D4
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
        call sub_64296
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
        call sub_641D4
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
        call sub_640D3
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
        call sub_641D4
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov eax, 30h
        xor edx, edx
        call sub_63F79
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
        call sub_77355
        call sub_640D3
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
        call sub_640D3
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
        call sub_641D4
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
        call sub_64296
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
        call sub_641D4
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
        call sub_640D3
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
        call sub_641D4
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov eax, 30h
        xor edx, edx
        call sub_63F79
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
        call sub_77355
        call sub_640D3
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
        call sub_640D3
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
        call sub_641D4
        mov eax, dword [dword_17D520]
        movsx edx, word [byte eax+014h]
        movsx eax, word [byte eax+012h]
        sub edx, eax
        mov eax, dword [dword_17D51C]
        add edx, esi
        movsx eax, word [byte eax+012h]
        call sub_5B0F9
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov eax, 30h
        xor edx, edx
        call sub_63F79
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
        call sub_77355
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
        call sub_640D3
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
        call sub_64103
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
        call sub_BB8E0
        add esp, byte 10h
        jmp near sub_6AA3B_9C2
.28:
        push str_Paus
        push dword [dword_17D528]
        call sub_E04E0
        mov esi, eax
        mov eax, dword [dword_17D520]
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        mov eax, dword [dword_17D51C]
        movsx eax, word [byte eax+06h]
        push eax
        push esi
        call sub_AAA40
        add esp, byte 0Ch
        push str_Sid12
        push dword [dword_17D528]
        call sub_E04E0
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
        call sub_AAA40
        add esp, byte 0Ch
        push str_Sid22
        push dword [dword_17D528]
        call sub_E04E0
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
        call sub_AAA40
        add esp, byte 0Ch
        push str_Bot12
        push dword [dword_17D528]
        call sub_E04E0
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
        call sub_AAA40
        add esp, byte 0Ch
        push str_Bot22
        push dword [dword_17D528]
        call sub_E04E0
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
        call sub_AAA40
        add esp, byte 0Ch
        push str_Bot32
        push dword [dword_17D528]
        call sub_E04E0
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
        call sub_AAA40
        add esp, byte 0Ch
        call sub_62311
        push dword [dword_17D514]
        call sub_ADBEC
        add esp, byte 4
        push byte 0
        push dword [dword_11F5C4]
        push dword [dword_11F5C0]
        call sub_AD35C
        mov dword [dword_17D518], eax
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Ch], 0
        mov eax, dword [dword_17D518]
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Eh], 0
        add esp, byte 0Ch
        mov eax, dword [dword_17D518]
        push dword [byte eax+02Ch]
        call sub_AA988
        add esp, byte 4
        xor eax, eax
        call sub_6A891
        mov word [word_11D929], 0
sub_6AA3B_9C2:
        leave
sub_6AA3B_9C3:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_6B404                                                       6B404  96 PC
;-----------------------------------------------------------------------------
sub_6B404:
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
        call sub_60777
.2:
        call GetTicks
        mov esi, 0FAh
        mov edi, eax
        call GetTicks
        mov dword [dword_17D510], eax
.3:
        test esi, esi
        je short sub_6AA3B_9C3
        call GetTicks
        mov ebx, eax
        sub eax, edi
        mov edx, eax
        call Crowd_Noise
        call SoundIdle
        mov eax, edx
        call sub_612BC
        xor eax, eax
        sub esi, edx
        call sub_5A572
        test esi, esi
        jge short .4
        xor esi, esi
.4:
        mov edi, ebx
        jmp short .3
jpt_6B476:
        dd sub_6B486_59
        dd sub_6B486_60
        dd sub_6B486_6C
        dd sub_6B486_81
;-----------------------------------------------------------------------------
; sub_6B486                                                       6B486  96 PC
;-----------------------------------------------------------------------------
sub_6B486:
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
        jne near sub_6B486_81.16
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 1
        jb short .1
        jbe near sub_6B486_81.11
        cmp eax, byte 2
        je near sub_6B486_81.12
        jmp near sub_6B486_81.14
.1:
        test eax, eax
        jne near sub_6B486_81.14
        cmp eax, byte 3
        ja short sub_6B486_81.2
        jmp dword [nosplit cs:eax*4+jpt_6B476]
sub_6B486_59:
        call LoadExhibitionStats
        jmp short sub_6B486_81.2
sub_6B486_60:
        mov eax, dword [dword_17CBE7]
        call LoadSeasonStats
        jmp short sub_6B486_81.2
sub_6B486_6C:
        cmp dword [dword_17D267], byte 0
        jne short sub_6B486_60
        mov eax, dword [dword_17D162]
        call LoadPlayoffStats
        jmp short sub_6B486_81.2
sub_6B486_81:
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
        call sub_78E9E
        push dword 3A7h
        push unk_17CB2E
        lea eax, [byte ebp-044h]
        push eax
        call sub_B22E0
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
        call sub_78E9E
        push dword 3A7h
        push unk_17CB2E
        lea eax, [byte ebp-044h]
        push eax
        call sub_B22E0
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
        call sub_78EFA
        push dword 39Dh
        push unk_17CED5
        lea eax, [byte ebp-044h]
        push eax
        call sub_B22E0
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
        jmp near sub_6AA3B_9C2
jpt_6B878:
        dd sub_6B894_66B
        dd sub_6B894_6F1
        dd sub_6B894_6FD
        dd sub_6B894_724
        dd sub_6B894_730
        dd sub_6B894_73C
        dd sub_6B894_748
;-----------------------------------------------------------------------------
; sub_6B894                                                       6B894  96 PC
;-----------------------------------------------------------------------------
sub_6B894:
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
        call sub_6A891
        call sub_DD6C4
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
        call sub_AB758
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
        call sub_64721
        push str_Qui02
        push dword [dword_17D528]
        call sub_E04E0
        add esp, byte 8
        push str_Qui12
        push dword [dword_17D528]
        mov dword [dword ebp-0270h], eax
        call sub_E04E0
        add esp, byte 8
        push str_Qui22
        push dword [dword_17D528]
        mov dword [dword ebp-026Ch], eax
        call sub_E04E0
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
        call sub_E04E0
        add esp, byte 8
        push str_Ret12
        push dword [dword_17D528]
        mov dword [dword ebp-020Ah], eax
        call sub_E04E0
        add esp, byte 8
        push str_Ret22
        push dword [dword_17D528]
        mov dword [dword ebp-0206h], eax
        call sub_E04E0
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
        call sub_E04E0
        add esp, byte 8
        push str_Cht12
        jmp short .5
.4:
        push str_Edt02
        push dword [dword_17D528]
        call sub_E04E0
        add esp, byte 8
        push str_Edt12
.5:
        push dword [dword_17D528]
        mov dword [dword ebp-01A4h], eax
        call sub_E04E0
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
        call sub_E04E0
        add esp, byte 8
        push str_Rep1
        push dword [dword_17D528]
        mov dword [dword ebp-013Eh], eax
        call sub_E04E0
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
        call sub_E04E0
        add esp, byte 8
        push str_Ctr12
        push dword [dword_17D528]
        mov dword [dword ebp-0D8h], eax
        call sub_E04E0
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
        call sub_E04E0
        add esp, byte 8
        push str_Sts12
        push dword [dword_17D528]
        mov dword [byte ebp-072h], eax
        call sub_E04E0
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
        call sub_E04E0
        add esp, byte 8
        push str_Sav12
        push dword [dword_17D528]
        mov dword [byte ebp-0Ch], eax
        call sub_E04E0
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
        call sub_DD6C4
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
        call sub_66373
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
        call sub_64F59
        cmp dword [byte ebp+07Ah], byte 6
        ja near sub_6B894_748.25
        mov eax, dword [byte ebp+07Ah]
        jmp dword [nosplit cs:eax*4+jpt_6B878]
sub_6B894_66B:
        mov eax, 2
        call sub_77355
        mov dword [dword_17D4FC], eax
        mov eax, 3
        call sub_77355
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
        call sub_77355
        call MessageBox
        test eax, eax
        jne near sub_6B894_748.25
        mov dword [dword_1150FC], 2
        mov eax, 3
        mov dword [byte ebp+07Eh], 0FFFFFFFEh
        call sub_63A5B
        jmp near sub_6B894_748.25
sub_6B894_6F1:
        mov dword [byte ebp+07Eh], 0FFFFFFFEh
        jmp near sub_6B894_748.25
sub_6B894_6FD:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .12
        mov dword [byte ebp+07Eh], 4
        jmp near sub_6B894_748.25
.12:
        mov dword [byte ebp+07Eh], 2
        jmp near sub_6B894_748.25
sub_6B894_724:
        mov dword [byte ebp+07Eh], 1
        jmp near sub_6B894_748.25
sub_6B894_730:
        mov dword [byte ebp+07Eh], 0
        jmp near sub_6B894_748.25
sub_6B894_73C:
        mov dword [byte ebp+07Eh], 5
        jmp near sub_6B894_748.25
sub_6B894_748:
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
        call sub_77355
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
        call sub_77355
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
        call sub_6B486
        test eax, eax
        jne short .21
        call sub_77355
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
        call sub_77355
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
        call sub_77355
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
        call sub_77355
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
        je near sub_6B894.9
        push dword [dword_17D4E8]
        call sub_ABF4C
        mov eax, dword [byte ebp+07Eh]
        add esp, byte 4
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near sub_6AA3B_9C3
;-----------------------------------------------------------------------------
; sub_6C294                                                       6C294  96 PC
;-----------------------------------------------------------------------------
sub_6C294:
        push ebx
        push ecx
        push edx
        push esi
        mov eax, 2
        call sub_63A5B
        call sub_B0CA8
        call sub_6225D
        push byte 20h
        mov eax, dword [dword_17D518]
        push dword [byte eax+04h]
        push dword [eax]
        call sub_AD35C
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
        call sub_ADBEC
        add esp, byte 4
        mov dword [dword_17D518], esi
        call RestoreSpeechBuffer
        call sub_621D9
        call StopAllSfx
        call EndGameSound
        call ResetInputSlots
        push str_FhiL5
        push dword [dword_1150D4]
        call sub_E04E0
        add esp, byte 8
        push str_FhiR5
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call sub_E04E0
        add esp, byte 8
        mov dword [dword_152F50], eax
        test byte [byte_17CA5D], 20h
        jne short .1
        push dword [dword_152F54]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_152F5C]
        call sub_ABF4C
        add esp, byte 4
        mov edx, 20h
        mov eax, dword [dword_152F58]
        call sub_63B0C
        mov edx, 20h
        mov dword [dword_152F54], eax
        mov eax, dword [dword_152F50]
        call sub_63B0C
        mov dword [dword_152F5C], eax
.1:
        call sub_625F7
        test byte [byte_17CA5D], 20h
        jne short .2
        mov eax, 1
        call sub_63DC4
.2:
        mov eax, 44h
        call QueueMusic
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_6C3B0                                                       6C3B0  96 PC
;-----------------------------------------------------------------------------
sub_6C3B0:
        push ebx
        push ecx
        push edx
        push esi
        mov eax, 3
        call sub_63A5B
        xor edx, edx
        mov eax, 64h
        call FadeOutMusic
        call StopMusic
        call sub_62ED9
        test byte [byte_17CA5D], 20h
        jne short .1
        push dword [dword_152F54]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_152F5C]
        call sub_ABF4C
        add esp, byte 4
        push str_GloL3
        push dword [dword_1150D4]
        call sub_E04E0
        add esp, byte 8
        push str_GloR3
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call sub_E04E0
        mov edx, 20h
        add esp, byte 8
        mov dword [dword_152F50], eax
        mov eax, dword [dword_152F58]
        call sub_63B0C
        mov edx, 20h
        mov dword [dword_152F54], eax
        mov eax, dword [dword_152F50]
        call sub_63B0C
        mov dword [dword_152F5C], eax
        jmp short .2
.1:
        push str_GhiL3
        push dword [dword_1150D4]
        call sub_E04E0
        add esp, byte 8
        push str_GhiR3
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call sub_E04E0
        add esp, byte 8
        mov dword [dword_152F50], eax
.2:
        call InitSlotTable
        call sub_3A6F3
        test byte [byte_17CA5D], 20h
        jne short .3
        xor eax, eax
        call sub_63DC4
.3:
        call StopAllSfx
        call sub_B0CA8
        push byte 20h
        mov eax, dword [dword_17D518]
        push dword [byte eax+04h]
        push dword [eax]
        call sub_AD35C
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
        call sub_ADBEC
        add esp, byte 4
        mov dword [dword_17D518], esi
        call StartGameSound
        call FreeSpeechBuffer
        push byte 0
        mov eax, dword [dword_17D518]
        push dword [byte eax+04h]
        push dword [eax]
        call sub_AD35C
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
        call sub_ADBEC
        add esp, byte 4
        mov dword [dword_17D518], esi
        call sub_62201
        push byte 20h
        mov eax, dword [dword_17D518]
        push dword [byte eax+04h]
        push dword [eax]
        call sub_AD35C
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
        call sub_ADBEC
        add esp, byte 4
        mov dword [dword_17D518], esi
        call RestoreSpeechBuffer
        mov eax, unk_16443C
        call sub_6423E
        call FreeSpeechBuffer
        push byte 0
        mov eax, dword [dword_17D518]
        push dword [byte eax+04h]
        push dword [eax]
        call sub_AD35C
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
        call sub_ADBEC
        add esp, byte 4
        mov dword [dword_17D518], esi
        call sub_62285
        xor eax, eax
        call CrowdNoiseReset
        call sub_DD6C4
        push byte 0
        mov eax, dword [dword_17D518]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        mov ebx, 2
        add esp, byte 0Ch
        xor eax, eax
        mov edx, unk_16443C
        call sub_6A891
        xor eax, eax
        mov word [word_11D927], 0
        call sub_63998
        mov eax, 1
        call LinkSync
        pop esi
        pop edx
        pop ecx
        pop ebx
sub_6C3B0_28A:
        ret
jpt_6C63B:
        dd LoadExhibitionStats
        dd sub_6C663
        dd sub_6C66D
        dd LoadModemStats
;-----------------------------------------------------------------------------
; sub_6C64B                                                       6C64B  96 PC
;-----------------------------------------------------------------------------
sub_6C64B:
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 3
        ja short sub_6C3B0_28A
        jmp dword [nosplit cs:eax*4+jpt_6C63B]
;-----------------------------------------------------------------------------
; sub_6C663                                                       6C663  96 PC
;-----------------------------------------------------------------------------
sub_6C663:
        mov eax, dword [dword_17CBE7]
        jmp near LoadSeasonStats
;-----------------------------------------------------------------------------
; sub_6C66D                                                       6C66D  96 PC
;-----------------------------------------------------------------------------
sub_6C66D:
        cmp dword [dword_17D267], byte 0
        jne short sub_6C663
        mov eax, dword [dword_17D162]
        jmp near LoadPlayoffStats
jpt_6C680:
        dd sub_6C698_375
        dd sub_6C698_3A3
        dd sub_6C698_47F
        dd sub_6C698_620
        dd sub_6C698_5F4
        dd sub_6C698_611
;-----------------------------------------------------------------------------
; sub_6C698                                                       6C698  96 PC
;-----------------------------------------------------------------------------
sub_6C698:
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
        call sub_62311
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
        call sub_E04E0
        add esp, byte 8
        mov esi, eax
        push str_Sid12
        movsx eax, word [byte eax+04h]
        movsx edi, word [byte esi+06h]
        push dword [dword_17D528]
        mov dword [byte ebp-0Ch], eax
        call sub_E04E0
        add esp, byte 8
        push str_Bot12
        movsx eax, word [byte eax+06h]
        push dword [dword_17D528]
        add edi, eax
        call sub_E04E0
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push byte 0
        add edi, eax
        push edi
        push dword [byte ebp-0Ch]
        call sub_AD35C
        add esp, byte 0Ch
        push eax
        mov dword [dword_17D514], eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call sub_E0584
        add esp, byte 4
        push byte 0
        push byte 0
        push esi
        call PutBlock
        add esp, byte 0Ch
        push str_Sid12
        push dword [dword_17D528]
        call sub_E04E0
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
        call sub_E04E0
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
        call sub_E04E0
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
        call sub_E04E0
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
        call sub_E04E0
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
        call sub_6A891
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
        call sub_612BC
        sub esi, byte 14h
        jmp short .4
.5:
        mov eax, esi
        call sub_612BC
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
        call sub_6B404
.9:
        xor eax, eax
        mov word [word_11D929], 1
        call sub_5A572
        cmp word [word_114F14], byte 0
        je short .10
        mov ebx, 2
        mov edx, unk_16443C
        xor eax, eax
        call sub_63998
        mov word [word_114F14], 0
.10:
        mov word [word_11D927], 0
        call CrowdPause
.11:
        call sub_6B894
        mov dword [byte ebp-010h], eax
        cmp eax, byte 5
        ja near sub_6C698_620
        jmp dword [nosplit cs:eax*4+jpt_6C680]
sub_6C698_375:
        call sub_6C294
.12:
        xor eax, eax
        call sub_6F056
        mov edx, eax
        cmp eax, byte 0Fh
        jne short .13
        xor eax, eax
        mov dword [dword_1843B0], 3
        call sub_9CDDA
.13:
        cmp edx, byte 0Fh
        je short .12
        jmp near sub_6C698_611.29
sub_6C698_3A3:
        cmp dword [curperiod], byte 0FFFFFFFFh
        je near .15
        call sub_5360D
        cmp eax, dword [dword_16596C]
        je short .15
        call CrowdResume
        mov eax, dword [byte ebp-018h]
        call SetCrowdTarget
        mov eax, 7Fh
        call Crowd_Noise
        call sub_564A4
        call sub_62311
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
        call sub_66373
        xor eax, eax
        call SetCrowdTarget
        mov eax, 7Fh
        call Crowd_Noise
        call CrowdPause
.14:
        mov word [word_11D927], 1
        jmp near sub_6C698_620
.15:
        xor eax, eax
        call sub_77355
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
        call sub_77355
        call MessageBox
        jmp near sub_6C698_620
sub_6C698_47F:
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
        call sub_6C294
        xor eax, eax
        call sub_9CDDA
        jmp near sub_6C698_611.29
.25:
        mov eax, 1
        call sub_77355
        mov dword [dword_17D4FC], eax
        mov eax, 14Ch
        call sub_77355
        mov dword [dword_17D500], eax
        mov eax, 14Dh
        call sub_77355
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
        call sub_77355
        call MessageBox
        mov dword [dword_1843AC], eax
        test eax, eax
        je near sub_6C698_620
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
        call sub_77355
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
        jmp near sub_6C698_3A3.16
sub_6C698_5F4:
        push byte 0
        mov ecx, 30h
        mov ebx, 7Eh
        mov edx, 1Bh
        xor eax, eax
        call ModemChat
        jmp near sub_6C698_3A3.14
sub_6C698_611:
        call sub_6C294
        call GameStatsScreen
.29:
        call sub_6C3B0
sub_6C698_620:
        cmp dword [byte ebp-010h], byte 0
        jge near sub_6C698.11
        mov eax, 1
        call LinkSync
        push dword [dword_17D518]
        call sub_ADBEC
        add esp, byte 4
        push str_Paus
        push dword [dword_17D528]
        call sub_E04E0
        add esp, byte 8
        mov esi, eax
        push str_Sid12
        movsx eax, word [byte eax+04h]
        movsx edi, word [byte esi+06h]
        push dword [dword_17D528]
        mov dword [byte ebp-014h], eax
        call sub_E04E0
        add esp, byte 8
        push str_Bot12
        movsx eax, word [byte eax+06h]
        push dword [dword_17D528]
        add edi, eax
        call sub_E04E0
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push byte 0
        add edi, eax
        push edi
        push dword [byte ebp-014h]
        call sub_AD35C
        add esp, byte 0Ch
        push eax
        mov dword [dword_17D514], eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call sub_E0584
        add esp, byte 4
        push byte 0
        push byte 0
        push esi
        call PutBlock
        add esp, byte 0Ch
        push str_Sid12
        push dword [dword_17D528]
        call sub_E04E0
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
        call sub_E04E0
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
        call sub_E04E0
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
        call sub_E04E0
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
        call sub_E04E0
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
        call sub_6A891
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
        call sub_6B404
        jmp short .32
.30:
        mov eax, 0FAh
        call Crowd_Noise
        jmp short .32
.31:
        call sub_DD6C4
        cmp dword [byte ebp-04h], byte 0
        je short .32
        mov eax, 0Ah
        call sub_60777
.32:
        push dword [dword_17D514]
        call sub_ADBEC
        add esp, byte 4
        call sub_62311
        call RestoreSpeechBuffer
        mov dword [dword_11D91F], 0
        jmp near sub_6AA3B_9C2
;-----------------------------------------------------------------------------
; sub_6CF0D                                                       6CF0D  96 PC
;-----------------------------------------------------------------------------
sub_6CF0D:
        jge short .1
.1:
        sbb eax, dword [ecx]
        db 0B8h
        db 01h
sub_6CF0D_6:
        test dword [eax], 1580127h
        mov byte [ecx], al
sub_6CF1B:
        push esi
        push edi
        enter 50h, 0
        push eax
        push edx
        push ebx
        push ecx
        call GetTicks
        push byte 0
        push dword [dword_11F5C4]
        push dword [dword_11F5C0]
        lea edi, [byte eax+03h]
        call sub_AD35C
        add esp, byte 0Ch
        push byte 0
        push byte 0
        mov esi, eax
        push dword [byte eax+02Ch]
        mov dword [byte ebp-030h], eax
        call sub_AA7E0
        add esp, byte 0Ch
        push esi
        call SetDrawBitmap
        add esp, byte 4
        push dword [byte ebp-060h]
        call sub_AADA4
        mov eax, dword [byte ebp-060h]
        movsx eax, word [byte eax+0Ch]
        mov dword [byte ebp-08h], eax
        mov eax, dword [byte ebp-060h]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-060h]
        mov esi, dword [byte ebp-08h]
        movsx eax, word [byte eax+04h]
        add esi, eax
        mov eax, dword [byte ebp-060h]
        mov dword [byte ebp-010h], esi
        mov esi, dword [byte ebp-04h]
        movsx eax, word [byte eax+06h]
        mov dword [byte ebp-01Ch], 0
        add esi, eax
        add esp, byte 4
        mov dword [byte ebp-018h], esi
.1:
        call GetTicks
        cmp eax, edi
        jl short .1
        push str_Log7
        push dword [byte ebp-054h]
        call sub_E04E0
        movsx esi, word [byte eax+0Eh]
        mov eax, dword [byte ebp-060h]
        movsx eax, word [byte eax+0Eh]
        sub esi, eax
        mov eax, esi
        mov esi, 7
        cdq
        idiv esi
        lea edi, [byte ebp-050h]
        mov esi, str_Logx
        mov dword [byte ebp-024h], eax
        mov dword [byte ebp-040h], eax
        movsd
        movsb
        neg eax
        mov esi, dword [byte ebp-024h]
        mov dword [byte ebp-0Ch], 1
        add esi, eax
        add esp, byte 8
        mov dword [byte ebp-028h], esi
.2:
        mov al, byte [byte ebp-0Ch]
        add al, 30h
        mov byte [byte ebp-04Dh], al
        lea eax, [byte ebp-050h]
        push eax
        push dword [byte ebp-054h]
        call sub_E04E0
        add esp, byte 8
        mov esi, eax
        cmp dword [byte ebp-0Ch], byte 7
        jne short .3
        movsx edx, word [byte eax+0Ch]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp-044h], edx
        mov dword [byte ebp-020h], eax
        jmp short .5
.3:
        mov edi, dword [byte ebp-060h]
        mov edx, dword [byte ebp-028h]
        movsx edi, word [byte edi+0Eh]
        add edx, edi
        mov dword [byte ebp-020h], edx
        cmp dword [byte ebp-05Ch], byte 0
        je short .4
        mov edx, 280h
        movsx edi, word [byte eax+0Ch]
        sub edx, edi
        movsx eax, word [byte eax+04h]
        mov edi, edx
        sub edi, eax
        mov dword [byte ebp-044h], edi
        jmp short .5
.4:
        movsx eax, word [byte eax+0Ch]
        mov dword [byte ebp-044h], eax
.5:
        cmp dword [byte ebp-01Ch], byte 0
        je short .6
        push dword [byte ebp-01Ch]
        call sub_ADBEC
        add esp, byte 4
.6:
        mov eax, dword [byte ebp-044h]
        cmp eax, dword [byte ebp-08h]
        jge short .7
        mov dword [byte ebp-08h], eax
.7:
        movsx eax, word [byte esi+04h]
        add eax, dword [byte ebp-044h]
        cmp eax, dword [byte ebp-010h]
        jle short .8
        mov dword [byte ebp-010h], eax
.8:
        mov eax, dword [byte ebp-020h]
        cmp eax, dword [byte ebp-04h]
        jge short .9
        mov dword [byte ebp-04h], eax
.9:
        movsx eax, word [byte esi+06h]
        add eax, dword [byte ebp-020h]
        cmp eax, dword [byte ebp-018h]
        jle short .10
        mov dword [byte ebp-018h], eax
.10:
        mov eax, dword [byte ebp-018h]
        sub eax, dword [byte ebp-04h]
        push byte 0
        inc eax
        push eax
        mov eax, dword [byte ebp-010h]
        sub eax, dword [byte ebp-08h]
        inc eax
        push eax
        call sub_AD35C
        mov edi, eax
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [byte eax+02Ch]
        mov edx, dword [byte ebp-08h]
        mov word [byte eax+0Ch], dx
        add esp, byte 0Ch
        mov eax, dword [byte edi+02Ch]
        mov edx, dword [byte ebp-04h]
        push edi
        mov word [byte eax+0Eh], dx
        call SetDrawBitmap
        add esp, byte 4
        call GetTicks
        add eax, byte 3
        mov dword [byte ebp-03Ch], eax
        mov eax, dword [byte ebp-04h]
        neg eax
        push eax
        mov eax, dword [byte ebp-08h]
        neg eax
        push eax
        mov eax, dword [byte ebp-030h]
        push dword [byte eax+02Ch]
        call PutBlock
        mov eax, dword [byte ebp-020h]
        add esp, byte 0Ch
        sub eax, dword [byte ebp-04h]
        push eax
        mov eax, dword [byte ebp-044h]
        sub eax, dword [byte ebp-08h]
        push eax
        push esi
        call sub_AAA40
        add esp, byte 0Ch
        call sub_DD6C4
        push dword [byte edi+02Ch]
        call sub_B2C54
        add esp, byte 4
.11:
        call GetTicks
        cmp eax, dword [byte ebp-03Ch]
        jl short .11
        mov eax, dword [byte ebp-044h]
        mov edx, dword [byte ebp-044h]
        mov dword [byte ebp-08h], eax
        movsx eax, word [byte esi+04h]
        add edx, eax
        mov eax, dword [byte ebp-020h]
        mov dword [byte ebp-010h], edx
        mov edx, dword [byte ebp-020h]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+06h]
        inc dword [byte ebp-0Ch]
        add edx, eax
        mov eax, dword [byte ebp-040h]
        mov dword [byte ebp-018h], edx
        add dword [byte ebp-028h], eax
        cmp dword [byte ebp-0Ch], byte 8
        jl near .2
        mov edx, dword [byte ebp-058h]
        mov eax, dword [byte ebp-054h]
        call PickUsersScreen
        mov eax, dword [byte ebp-024h]
        mov dword [byte ebp-034h], eax
        imul eax, byte 6
        lea edi, [byte ebp-050h]
        mov esi, str_Logx
        mov dword [byte ebp-0Ch], 6
        movsd
        movsb
        neg dword [byte ebp-034h]
        mov dword [byte ebp-02Ch], eax
.12:
        mov al, byte [byte ebp-0Ch]
        add al, 30h
        mov byte [byte ebp-04Dh], al
        cmp dword [byte ebp-0Ch], byte 0
        je short .14
        lea eax, [byte ebp-050h]
        push eax
        push dword [byte ebp-054h]
        mov edi, dword [byte ebp-060h]
        call sub_E04E0
        mov edx, dword [byte ebp-02Ch]
        movsx edi, word [byte edi+0Eh]
        add esp, byte 8
        add edx, edi
        mov esi, eax
        mov dword [byte ebp-048h], edx
        cmp dword [byte ebp-05Ch], byte 0
        je short .13
        mov edx, 280h
        movsx edi, word [byte eax+0Ch]
        sub edx, edi
        movsx eax, word [byte eax+04h]
        mov edi, edx
        sub edi, eax
        mov dword [byte ebp-014h], edi
        jmp short .16
.13:
        movsx eax, word [byte eax+0Ch]
        jmp short .15
.14:
        mov esi, dword [byte ebp-060h]
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-048h], eax
        movsx eax, word [byte esi+0Ch]
.15:
        mov dword [byte ebp-014h], eax
.16:
        cmp dword [byte ebp-01Ch], byte 0
        je short .17
        push dword [byte ebp-01Ch]
        call sub_ADBEC
        add esp, byte 4
.17:
        mov eax, dword [byte ebp-014h]
        cmp eax, dword [byte ebp-08h]
        jge short .18
        mov dword [byte ebp-08h], eax
.18:
        movsx eax, word [byte esi+04h]
        add eax, dword [byte ebp-014h]
        cmp eax, dword [byte ebp-010h]
        jle short .19
        mov dword [byte ebp-010h], eax
.19:
        mov eax, dword [byte ebp-048h]
        cmp eax, dword [byte ebp-04h]
        jge short .20
        mov dword [byte ebp-04h], eax
.20:
        movsx eax, word [byte esi+06h]
        add eax, dword [byte ebp-048h]
        cmp eax, dword [byte ebp-018h]
        jle short .21
        mov dword [byte ebp-018h], eax
.21:
        mov eax, dword [byte ebp-018h]
        sub eax, dword [byte ebp-04h]
        push byte 0
        inc eax
        push eax
        mov eax, dword [byte ebp-010h]
        sub eax, dword [byte ebp-08h]
        inc eax
        push eax
        call sub_AD35C
        mov edi, eax
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [byte eax+02Ch]
        mov edx, dword [byte ebp-08h]
        mov word [byte eax+0Ch], dx
        add esp, byte 0Ch
        mov eax, dword [byte edi+02Ch]
        mov edx, dword [byte ebp-04h]
        push edi
        mov word [byte eax+0Eh], dx
        call SetDrawBitmap
        add esp, byte 4
        call GetTicks
        add eax, byte 3
        mov dword [byte ebp-038h], eax
        mov eax, dword [byte ebp-04h]
        neg eax
        push eax
        mov eax, dword [byte ebp-08h]
        neg eax
        push eax
        mov eax, dword [byte ebp-030h]
        push dword [byte eax+02Ch]
        call PutBlock
        mov eax, dword [byte ebp-048h]
        add esp, byte 0Ch
        sub eax, dword [byte ebp-04h]
        push eax
        mov eax, dword [byte ebp-014h]
        sub eax, dword [byte ebp-08h]
        push eax
        push esi
        call sub_AAA40
        add esp, byte 0Ch
        call sub_DD6C4
        push dword [byte edi+02Ch]
        call sub_B2C54
        add esp, byte 4
.22:
        call GetTicks
        cmp eax, dword [byte ebp-038h]
        jl short .22
        mov eax, dword [byte ebp-014h]
        mov edx, dword [byte ebp-014h]
        mov dword [byte ebp-08h], eax
        movsx eax, word [byte esi+04h]
        add edx, eax
        mov eax, dword [byte ebp-048h]
        mov dword [byte ebp-010h], edx
        mov edx, dword [byte ebp-048h]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+06h]
        dec dword [byte ebp-0Ch]
        add edx, eax
        mov eax, dword [byte ebp-034h]
        mov dword [byte ebp-018h], edx
        add dword [byte ebp-02Ch], eax
        cmp dword [byte ebp-0Ch], byte 0
        jge near .12
        push dword [byte ebp-01Ch]
        call sub_ADBEC
        add esp, byte 4
        push dword [byte ebp-030h]
        call sub_ADBEC
        add esp, byte 4
        leave
        pop edi
        pop esi
        ret
unk_6D31C:
        db 0FFh,03h,03Fh,00h,01Fh,00h,0Fh,00h,07h,00h,03h,00h,01h,00h,00h,00h
jpt_6D32C:
        dd sub_6D350_4D0
        dd sub_6D350_2C
        dd sub_6D350_F2
        dd sub_6D350_199
        dd sub_6D350_240
        dd sub_6D350_2E7
        dd sub_6D350_38E
        dd sub_6D350_435
        dd sub_6D350_4D0
;-----------------------------------------------------------------------------
; sub_6D350                                                       6D350  96 PC
;-----------------------------------------------------------------------------
sub_6D350:
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        mov dword [byte ebp-04h], ecx
        dec eax
        cmp eax, 3FFh
        ja near sub_6D350_4D0
        mov ecx, 9
        mov edi, unk_6D31C
        repne scasw
        jmp dword [nosplit cs:ecx*4+jpt_6D32C]
sub_6D350_2C:
        test byte [byte ebp+010h], 1
        je short .2
        cmp edx, byte 2
        je short .2
        cmp ebx, byte 2
        je short .2
        cmp dword [byte ebp-04h], byte 2
        je short .2
.1:
        mov esi, 2
        jmp near sub_6D350_4D0
.2:
        test byte [byte ebp+010h], 2
        je short .4
        cmp edx, byte 4
        je short .4
        cmp ebx, byte 4
        je short .4
        cmp dword [byte ebp-04h], byte 4
        je short .4
.3:
        mov esi, 4
        jmp near sub_6D350_4D0
.4:
        test byte [byte ebp+010h], 4
        je short .6
        cmp edx, byte 8
        je short .6
        cmp ebx, byte 8
        je short .6
        cmp dword [byte ebp-04h], byte 8
        je short .6
.5:
        mov esi, 8
        jmp near sub_6D350_4D0
.6:
        test byte [byte ebp+010h], 8
        je short .8
        cmp edx, byte 10h
        je short .8
        cmp ebx, byte 10h
        je short .8
        cmp dword [byte ebp-04h], byte 10h
        je short .8
.7:
        mov esi, 10h
        jmp near sub_6D350_4D0
.8:
        test byte [byte ebp+010h], 10h
        je short .10
        cmp edx, byte 20h
        je short .10
        cmp ebx, byte 20h
        je short .10
        cmp dword [byte ebp-04h], byte 20h
        je short .10
.9:
        mov esi, 20h
        jmp near sub_6D350_4D0
.10:
        cmp edx, byte 40h
        je near sub_6D350_4D0
        cmp ebx, byte 40h
        je near sub_6D350_4D0
        cmp dword [byte ebp-04h], byte 40h
        je near sub_6D350_4D0
.11:
        mov esi, 40h
        jmp near sub_6D350_4D0
sub_6D350_F2:
        test byte [byte ebp+010h], 2
        je short .12
        cmp edx, byte 4
        je short .12
        cmp ebx, byte 4
        je short .12
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
.12:
        test byte [byte ebp+010h], 4
        je short .13
        cmp edx, byte 8
        je short .13
        cmp ebx, byte 8
        je short .13
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
.13:
        test byte [byte ebp+010h], 8
        je short .14
        cmp edx, byte 10h
        je short .14
        cmp ebx, byte 10h
        je short .14
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
.14:
        test byte [byte ebp+010h], 10h
        je short .15
        cmp edx, byte 20h
        je short .15
        cmp ebx, byte 20h
        je short .15
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
.15:
        cmp edx, byte 40h
        je short .16
        cmp ebx, byte 40h
        je short .16
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.16:
        test byte [byte ebp+010h], 1
        je near sub_6D350_435.42
        cmp edx, byte 2
        je near sub_6D350_435.42
        cmp ebx, byte 2
        je near sub_6D350_435.42
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
        jmp near sub_6D350_435.42
sub_6D350_199:
        test byte [byte ebp+010h], 4
        je short .17
        cmp edx, byte 8
        je short .17
        cmp ebx, byte 8
        je short .17
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
.17:
        test byte [byte ebp+010h], 8
        je short .18
        cmp edx, byte 10h
        je short .18
        cmp ebx, byte 10h
        je short .18
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
.18:
        test byte [byte ebp+010h], 10h
        je short .19
        cmp edx, byte 20h
        je short .19
        cmp ebx, byte 20h
        je short .19
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
.19:
        cmp edx, byte 40h
        je short .20
        cmp ebx, byte 40h
        je short .20
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.20:
        test byte [byte ebp+010h], 1
        je short .21
        cmp edx, byte 2
        je short .21
        cmp ebx, byte 2
        je short .21
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
.21:
        test byte [byte ebp+010h], 2
        je near sub_6D350_435.42
        cmp edx, byte 4
        je near sub_6D350_435.42
        cmp ebx, byte 4
        je near sub_6D350_435.42
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
        jmp near sub_6D350_435.42
sub_6D350_240:
        test byte [byte ebp+010h], 8
        je short .22
        cmp edx, byte 10h
        je short .22
        cmp ebx, byte 10h
        je short .22
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
.22:
        test byte [byte ebp+010h], 10h
        je short .23
        cmp edx, byte 20h
        je short .23
        cmp ebx, byte 20h
        je short .23
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
.23:
        cmp edx, byte 40h
        je short .24
        cmp ebx, byte 40h
        je short .24
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.24:
        test byte [byte ebp+010h], 1
        je short .25
        cmp edx, byte 2
        je short .25
        cmp ebx, byte 2
        je short .25
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
.25:
        test byte [byte ebp+010h], 2
        je short .26
        cmp edx, byte 4
        je short .26
        cmp ebx, byte 4
        je short .26
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
.26:
        test byte [byte ebp+010h], 4
        je near sub_6D350_435.42
        cmp edx, byte 8
        je near sub_6D350_435.42
        cmp ebx, byte 8
        je near sub_6D350_435.42
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
        jmp near sub_6D350_435.42
sub_6D350_2E7:
        test byte [byte ebp+010h], 10h
        je short .27
        cmp edx, byte 20h
        je short .27
        cmp ebx, byte 20h
        je short .27
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
.27:
        cmp edx, byte 40h
        je short .28
        cmp ebx, byte 40h
        je short .28
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.28:
        test byte [byte ebp+010h], 1
        je short .29
        cmp edx, byte 2
        je short .29
        cmp ebx, byte 2
        je short .29
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
.29:
        test byte [byte ebp+010h], 2
        je short .30
        cmp edx, byte 4
        je short .30
        cmp ebx, byte 4
        je short .30
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
.30:
        test byte [byte ebp+010h], 4
        je short .31
        cmp edx, byte 8
        je short .31
        cmp ebx, byte 8
        je short .31
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
.31:
        test byte [byte ebp+010h], 8
        je near sub_6D350_435.42
        cmp edx, byte 10h
        je near sub_6D350_435.42
        cmp ebx, byte 10h
        je near sub_6D350_435.42
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
        jmp near sub_6D350_435.42
sub_6D350_38E:
        cmp edx, byte 40h
        je short .32
        cmp ebx, byte 40h
        je short .32
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.32:
        test byte [byte ebp+010h], 1
        je short .33
        cmp edx, byte 2
        je short .33
        cmp ebx, byte 2
        je short .33
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
.33:
        test byte [byte ebp+010h], 2
        je short .34
        cmp edx, byte 4
        je short .34
        cmp ebx, byte 4
        je short .34
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
.34:
        test byte [byte ebp+010h], 4
        je short .35
        cmp edx, byte 8
        je short .35
        cmp ebx, byte 8
        je short .35
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
.35:
        test byte [byte ebp+010h], 8
        je short .36
        cmp edx, byte 10h
        je short .36
        cmp ebx, byte 10h
        je short .36
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
.36:
        test byte [byte ebp+010h], 10h
        je near sub_6D350_435.42
        cmp edx, byte 20h
        je near sub_6D350_435.42
        cmp ebx, byte 20h
        je near sub_6D350_435.42
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
        jmp near sub_6D350_435.42
sub_6D350_435:
        test byte [byte ebp+010h], 1
        je short .37
        cmp edx, byte 2
        je short .37
        cmp ebx, byte 2
        je short .37
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
.37:
        test byte [byte ebp+010h], 2
        je short .38
        cmp edx, byte 4
        je short .38
        cmp ebx, byte 4
        je short .38
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
.38:
        test byte [byte ebp+010h], 4
        je short .39
        cmp edx, byte 8
        je short .39
        cmp ebx, byte 8
        je short .39
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
.39:
        test byte [byte ebp+010h], 8
        je short .40
        cmp edx, byte 10h
        je short .40
        cmp ebx, byte 10h
        je short .40
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
.40:
        test byte [byte ebp+010h], 10h
        je short .41
        cmp edx, byte 20h
        je short .41
        cmp ebx, byte 20h
        je short .41
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
.41:
        cmp edx, byte 40h
        je short .42
        cmp ebx, byte 40h
        je short .42
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.42:
        mov esi, 1
sub_6D350_4D0:
        mov eax, esi
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; sub_6D828                                                       6D828  96 PC
;-----------------------------------------------------------------------------
sub_6D828:
        push ebx
        push ecx
        push edx
        push esi
        enter 18h, 0
        call GetInputDevices
        mov dword [byte ebp-010h], eax
        mov eax, dword [optflags]
        and eax, byte 70h
        mov dword [byte ebp-0Ch], 0
        cmp eax, byte 30h
        setne byte [byte ebp-04h]
        xor eax, eax
.1:
        movzx edx, byte [byte ebp-04h]
        test edx, edx
        je short .2
        mov edx, dword [gameopts]
        movsx edx, word [byte edx+eax+09h]
        cmp edx, 400h
        je near .15
.2:
        mov ecx, dword [byte ebp-0Ch]
        inc ecx
        movsx edx, cx
        mov word [byte eax+ebp-018h], 0
        cmp edx, byte 4
        jne short .3
        xor ecx, ecx
.3:
        mov ebx, ecx
        inc ebx
        movsx edx, bx
        cmp edx, byte 4
        jne short .4
        xor ebx, ebx
.4:
        mov edx, ebx
        inc edx
        mov dword [byte ebp-08h], edx
        movsx edx, dx
        cmp edx, byte 4
        jne short .5
        mov dword [byte ebp-08h], 0
.5:
        mov edx, dword [gameopts]
        mov si, word [byte edx+eax+09h]
        cmp si, byte 8
        jb short .7
        jbe near .12
        cmp si, byte 20h
        jb short .6
        jbe near .14
        cmp si, byte 40h
        je short .8
        jmp near .16
.6:
        cmp si, byte 10h
        je near .13
        jmp near .16
.7:
        cmp si, byte 2
        jb near .16
        jbe short .10
        cmp si, byte 4
        je short .11
        jmp near .16
.8:
        movsx ecx, cx
        movsx ecx, word [byte edx+ecx*2+09h]
        cmp ecx, byte 40h
        je near .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 40h
        je near .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 40h
.9:
        jne near .16
        jmp near .15
.10:
        test byte [byte ebp-010h], 1
        je near .15
        movsx esi, cx
        movsx ecx, word [byte edx+esi*2+09h]
        cmp ecx, byte 2
        je near .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 2
        je near .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 2
        jmp short .9
.11:
        test byte [byte ebp-010h], 2
        je near .15
        movsx ecx, cx
        movsx ecx, word [byte edx+ecx*2+09h]
        cmp ecx, byte 4
        je near .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 4
        je near .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 4
        jmp short .9
.12:
        test byte [byte ebp-010h], 4
        je near .15
        movsx ecx, cx
        movsx ecx, word [byte edx+ecx*2+09h]
        cmp ecx, byte 8
        je near .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 8
        je near .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 8
        jmp near .9
.13:
        test byte [byte ebp-010h], 8
        je short .15
        movsx ecx, cx
        movsx ecx, word [byte edx+ecx*2+09h]
        cmp ecx, byte 10h
        je short .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 10h
        je short .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 10h
        jmp near .9
.14:
        test byte [byte ebp-010h], 10h
        je short .15
        movsx ecx, cx
        movsx ecx, word [byte edx+ecx*2+09h]
        cmp ecx, byte 20h
        je short .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 20h
        je short .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 20h
        jne short .16
.15:
        mov word [byte eax+ebp-018h], 1
.16:
        inc dword [byte ebp-0Ch]
        inc eax
        inc eax
        cmp dword [byte ebp-0Ch], byte 4
        jl near .1
        mov dword [byte ebp-0Ch], 0
        xor esi, esi
.17:
        mov eax, dword [byte ebp-0Ch]
        inc eax
        movsx edx, ax
        cmp edx, byte 4
        jne short .18
        xor eax, eax
.18:
        mov edx, eax
        inc edx
        movsx ebx, dx
        cmp ebx, byte 4
        jne short .19
        xor edx, edx
.19:
        mov ebx, edx
        inc ebx
        movsx ecx, bx
        cmp ecx, byte 4
        jne short .20
        xor ebx, ebx
.20:
        cmp word [byte esi+ebp-018h], byte 0
        je near .27
        movsx ebx, bx
        add ebx, ebx
        push dword [byte ebp-010h]
        cmp word [byte ebx+ebp-018h], byte 0
        je short .21
        mov ecx, 1
        jmp short .22
.21:
        mov ecx, dword [gameopts]
        movsx ecx, word [byte ecx+ebx+09h]
.22:
        movsx edx, dx
        add edx, edx
        cmp word [byte edx+ebp-018h], byte 0
        je short .23
        mov edx, 1
        jmp short .24
.23:
        mov ebx, dword [gameopts]
        movsx edx, word [byte edx+ebx+09h]
.24:
        cwde
        add eax, eax
        mov ebx, edx
        cmp word [byte eax+ebp-018h], byte 0
        je short .25
        mov edx, 1
        jmp short .26
.25:
        mov edx, dword [gameopts]
        movsx edx, word [byte edx+eax+09h]
.26:
        mov eax, 1
        call sub_6D350
        mov edx, eax
        mov eax, dword [gameopts]
        mov word [byte esi+eax+09h], dx
        mov word [byte esi+ebp-018h], 0
.27:
        inc dword [byte ebp-0Ch]
        inc esi
        inc esi
        cmp dword [byte ebp-0Ch], byte 4
        jl near .17
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
unk_6DB28:
        db 00h,04h,040h,00h,020h,00h,010h,00h,08h,00h,04h,00h,02h,00h,01h,00h
jpt_6DB38:
        dd sub_6DB5C_CB
        dd sub_6DB5C_51
        dd sub_6DB5C_5D
        dd sub_6DB5C_69
        dd sub_6DB5C_75
        dd sub_6DB5C_81
        dd sub_6DB5C_8D
        dd sub_6DB5C_99
        dd sub_6DB5C_A5
;-----------------------------------------------------------------------------
; sub_6DB5C                                                       6DB5C  96 PC
;-----------------------------------------------------------------------------
sub_6DB5C:
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov esi, eax
        mov eax, edx
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .3
        movsx edx, word [word_114CE4]
        cmp edx, byte 1
        jne short .1
        movsx edx, bx
        cmp edx, byte 1
        jle short .3
        jmp short .2
.1:
        movsx edx, bx
        cmp edx, byte 2
        jge short .3
.2:
        mov eax, 400h
.3:
        mov ecx, 9
        mov edi, unk_6DB28
        repne scasw
        jmp dword [nosplit cs:ecx*4+jpt_6DB38]
sub_6DB5C_51:
        movsx eax, bx
        inc eax
        push eax
        push str_PlyD
        jmp short sub_6DB5C_A5.4
sub_6DB5C_5D:
        movsx eax, bx
        inc eax
        push eax
        push str_MseD2
        jmp short sub_6DB5C_A5.4
sub_6DB5C_69:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy1D
        jmp short sub_6DB5C_A5.4
sub_6DB5C_75:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy2D
        jmp short sub_6DB5C_A5.4
sub_6DB5C_81:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy3D
        jmp short sub_6DB5C_A5.4
sub_6DB5C_8D:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy4D
        jmp short sub_6DB5C_A5.4
sub_6DB5C_99:
        movsx eax, bx
        inc eax
        push eax
        push str_KeyD2
        jmp short sub_6DB5C_A5.4
sub_6DB5C_A5:
        movsx eax, bx
        inc eax
        push eax
        push str_MdmD
.4:
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-0Ch]
        push eax
        push esi
        call sub_E04E0
        add esp, byte 8
        mov dword [byte ebp-04h], eax
sub_6DB5C_CB:
        mov eax, dword [byte ebp-04h]
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; sub_6DC2F                                                       6DC2F  96 PC
;-----------------------------------------------------------------------------
sub_6DC2F:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        cmp dword [eax], byte 5
        jge short .1
        push dword [dword_17D564]
        call sub_AADA4
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne near .6
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        jne short .3
        jmp near .6
.1:
        cmp dword [eax], byte 0Ah
        jge short .4
        push dword [dword_17D56C]
        call sub_AADA4
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne near .6
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
.2:
        je near .6
.3:
        mov si, word [esi]
        mov word [word_17D58C], si
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.4:
        cmp dword [eax], byte 0Fh
        jge short .5
        push dword [dword_17D574]
        call sub_AADA4
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne short .6
        cmp word [word_114CE4], byte 0
        jmp short .2
.5:
        cmp dword [eax], byte 14h
        jge short .7
        push dword [dword_17D57C]
        call sub_AADA4
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne short .6
        cmp word [word_114CE4], byte 0
        jne short .3
        mov ax, word [esi]
        mov word [word_17D58E], ax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.6:
        mov si, word [esi]
        mov word [word_17D58E], si
.7:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_6DD1E                                                       6DD1E  96 PC
;-----------------------------------------------------------------------------
sub_6DD1E:
        push edx
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0218h], byte 0
        je short .1
        mov byte [byte eax+043h], 5
        jmp short .4
.1:
        cmp dword [dword eax+0416h], byte 0
        je short .2
        mov byte [byte eax+043h], 0Ah
        jmp short .4
.2:
        cmp dword [dword eax+0614h], byte 0
        je short .3
        mov byte [byte eax+043h], 0Fh
        jmp short .4
.3:
        mov byte [byte eax+043h], 16h
.4:
        mov eax, dword [dword_17D580]
        cmp dword [byte eax+01Ah], byte 0
        sete dl
        mov byte [dword eax+0AAh], dl
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+01B2h], byte 0
        setne dl
        add dl, 3
        mov byte [dword eax+0177h], dl
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .5
        mov eax, dword [dword_17D580]
        mov byte [dword eax+0174h], 18h
.5:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .6
        mov eax, dword [dword_17D580]
        mov byte [dword eax+01DAh], 18h
.6:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+03B0h], byte 0
        je short .7
        mov byte [dword eax+01DBh], 9
        jmp short .10
.7:
        cmp dword [dword eax+05AEh], byte 0
        je short .8
        mov byte [dword eax+01DBh], 0Eh
        jmp short .10
.8:
        cmp dword [dword eax+07ACh], byte 0
        je short .9
        mov byte [dword eax+01DBh], 13h
        jmp short .10
.9:
        mov byte [dword eax+01DBh], 17h
.10:
        mov eax, dword [dword_17D580]
        cmp dword [byte eax+01Ah], byte 0
        sete dl
        mov byte [dword eax+0240h], dl
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0416h], byte 0
        je short .11
        mov byte [dword eax+0241h], 0Ah
        jmp short .13
.11:
        cmp dword [dword eax+0614h], byte 0
        je short .12
        mov byte [dword eax+0241h], 0Fh
        jmp short .13
.12:
        mov byte [dword eax+0241h], 16h
.13:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0218h], byte 0
        sete dl
        add dl, 5
        mov byte [dword eax+02A8h], dl
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+03B0h], byte 0
        setne dl
        add dl, 8
        mov byte [dword eax+0375h], dl
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+01B2h], byte 0
        je short .14
        mov byte [dword eax+03D8h], 4
        jmp short .16
.14:
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .15
        mov byte [dword eax+03D8h], 18h
        jmp short .16
.15:
        mov byte [dword eax+03D8h], 3
.16:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+05AEh], byte 0
        je short .17
        mov byte [dword eax+03D9h], 0Eh
        jmp short .19
.17:
        cmp dword [dword eax+07ACh], byte 0
        je short .18
        mov byte [dword eax+03D9h], 13h
        jmp short .19
.18:
        mov byte [dword eax+03D9h], 17h
.19:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0218h], byte 0
        je short .20
        mov byte [dword eax+043Eh], 5
        jmp short .22
.20:
        cmp dword [byte eax+01Ah], byte 0
        je short .21
        mov byte [dword eax+043Eh], 0
        jmp short .22
.21:
        mov byte [dword eax+043Eh], 6
.22:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0614h], byte 0
        je short .23
        mov byte [dword eax+043Fh], 0Fh
        jmp short .24
.23:
        mov byte [dword eax+043Fh], 16h
.24:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0416h], byte 0
        je short .25
        mov byte [dword eax+04A6h], 0Ah
        jmp short .26
.25:
        mov byte [dword eax+04A6h], 16h
.26:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+05AEh], byte 0
        je short .27
        mov byte [dword eax+0573h], 0Eh
        jmp short .28
.27:
        mov byte [dword eax+0573h], 17h
.28:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+03B0h], byte 0
        je short .29
        mov byte [dword eax+05D6h], 9
        jmp short .32
.29:
        cmp dword [dword eax+01B2h], byte 0
        je short .30
        mov byte [dword eax+05D6h], 4
        jmp short .32
.30:
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .31
        mov byte [dword eax+05D6h], 18h
        jmp short .32
.31:
        mov byte [dword eax+05D6h], 8
.32:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+07ACh], byte 0
        je short .33
        mov byte [dword eax+05D7h], 13h
        jmp short .34
.33:
        mov byte [dword eax+05D7h], 17h
.34:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0416h], byte 0
        je short .35
        mov byte [dword eax+063Ch], 0Ah
.35:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0218h], byte 0
        je short .36
        mov byte [dword eax+063Ch], 5
        jmp short .38
.36:
        cmp dword [byte eax+01Ah], byte 0
        je short .37
        mov byte [dword eax+063Ch], 0
        jmp short .38
.37:
        mov byte [dword eax+063Ch], 6
.38:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0614h], byte 0
        je short .39
        mov byte [dword eax+06A4h], 0Fh
        jmp short .40
.39:
        mov byte [dword eax+06A4h], 16h
.40:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+07ACh], byte 0
        je short .41
        mov byte [dword eax+0771h], 13h
        jmp short .42
.41:
        mov byte [dword eax+0771h], 17h
.42:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+05AEh], byte 0
        je short .43
        mov byte [dword eax+07D4h], 0Eh
        jmp short .47
.43:
        cmp dword [dword eax+03B0h], byte 0
        je short .44
        mov byte [dword eax+07D4h], 9
        jmp short .47
.44:
        cmp dword [dword eax+01B2h], byte 0
        je short .45
        mov byte [dword eax+07D4h], 4
        jmp short .47
.45:
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .46
        mov byte [dword eax+07D4h], 18h
        jmp short .47
.46:
        mov byte [dword eax+07D4h], 0Dh
.47:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0614h], byte 0
        je short .48
        mov byte [dword eax+0906h], 0Fh
        jmp short .52
.48:
        cmp dword [dword eax+0416h], byte 0
        je short .49
        mov byte [dword eax+0906h], 0Ah
        jmp short .52
.49:
        cmp dword [dword eax+0218h], byte 0
        je short .50
        mov byte [dword eax+0906h], 5
        jmp short .52
.50:
        cmp dword [byte eax+01Ah], byte 0
        je short .51
        mov byte [dword eax+0906h], 0
        jmp short .52
.51:
        mov byte [dword eax+0906h], 10h
.52:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        je short .53
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne short .53
        mov eax, dword [dword_17D580]
        mov byte [dword eax+0909h], 14h
        jmp short .55
.53:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0614h], byte 0
        je short .54
        mov byte [dword eax+0909h], 0Fh
        jmp short .55
.54:
        mov byte [dword eax+0909h], 10h
.55:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+07ACh], byte 0
        je short .56
        mov byte [dword eax+096Ch], 13h
        jmp short .61
.56:
        cmp dword [dword eax+05AEh], byte 0
        je short .57
        mov byte [dword eax+096Ch], 0Eh
        jmp short .61
.57:
        cmp dword [dword eax+03B0h], byte 0
        je short .58
        mov byte [dword eax+096Ch], 9
        jmp short .61
.58:
        cmp dword [dword eax+01B2h], byte 0
        je short .59
        mov byte [dword eax+096Ch], 4
        jmp short .61
.59:
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .60
        mov byte [dword eax+096Ch], 18h
        jmp short .61
.60:
        mov byte [dword eax+096Ch], 12h
.61:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        je short .62
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne short .62
        mov eax, dword [dword_17D580]
        mov byte [dword eax+096Eh], 15h
        jmp short .64
.62:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+07ACh], byte 0
        je short .63
        mov byte [dword eax+096Eh], 13h
        jmp short .64
.63:
        mov byte [dword eax+096Eh], 12h
.64:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+01B2h], byte 0
        je short .65
        mov byte [dword eax+09D3h], 4
        pop edx
        ret
.65:
        cmp dword [dword eax+03B0h], byte 0
        je short .66
        mov byte [dword eax+09D3h], 9
        pop edx
        ret
.66:
        cmp dword [dword eax+05AEh], byte 0
        je short .67
        mov byte [dword eax+09D3h], 0Eh
        pop edx
        ret
.67:
        cmp dword [dword eax+07ACh], byte 0
        je short .68
        mov byte [dword eax+09D3h], 13h
        pop edx
        ret
.68:
        mov byte [dword eax+09D3h], 17h
        pop edx
        ret
