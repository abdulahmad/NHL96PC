; Post-game screens: the three stars and the game statistics (96 PC).
bits 32
%include "hockey.inc"
section s_1456D progbits alloc exec nowrite align=1
extern awtmstruct, byte_11FA2F, byte_17BDAE, byte_1820F1, dword_114DE8, dword_114DF0, dword_114DF4, dword_114DFC
extern dword_114EB0, dword_114EB4, dword_114ED0, dword_114ED4, dword_114EE8, dword_114EEC, dword_114EF0, dword_114EF4
extern dword_1174E0, dword_11F5C0, dword_151AE4, dword_151AE8, dword_151AEC, dword_151B08, dword_151B4C, dword_151B50
extern dword_151B64, dword_151B68, dword_151B6C, dword_151B70, dword_151B74, dword_151B78, dword_151B7C, dword_152F58
extern dword_1571B3, dword_17BC74, dword_17BC78, dword_17BCE2, dword_17BD48, gameopts, GetTicks, hmtmstruct
extern LinkSync, ModemChat, mousex, mousey, PutBlock, rand_, SetDrawBitmap, sprintf_
extern str_004, str_04d, str_AR005, str_AR015, str_AR105, str_AR115, str_Ard5, str_BALL7
extern str_BANNER, str_BKGD28, str_BT006, str_BT0110, str_BT028, str_BT108, str_BT118, str_BT124
extern str_Card5, str_D02d2, str_D20, str_DD, str_DD11, str_DDD, str_fmtSS, str_FSH7
extern str_METD, str_Pal25, str_PALS2, str_Plyr5, str_ProfileFsh5, str_SBACK, str_ST10, str_STDD
extern str_STRD, str_STRK, MessageBox, SelectDataLibrary, LoadPackedFile, PlayerDbRecord, OpenScreen, SlideInTitleBar
extern SlideInBottomBar, SetScreenColors, BlackPalette, FadePalette, FadeOut, CopyBitmap, SetTextColors, DrawColorTextRight
extern DrawColorTextCentred, SetScreenPalette, DrawFrameAt, RemapScreenColors, InitMenuItems, RunMenu, SetMenuMouse, PaEvent
extern StopSpeech, StopMusic, FillMusicStream, PlayMusic, FadeOutMusic, MusicDone, SoundSecondsToBytes, SoundIdle
extern GetLangText, PlayerStatsScreen, sub_AA988, sub_AAA40, sub_AADA4, sub_AB758, sub_ABF4C, sub_AD35C
extern sub_ADA50, sub_ADBEC, sub_AFCD0, sub_B0430, sub_B0494, sub_DD6C4, sub_E04E0, sub_E0520
extern sub_E0584, TextSetFont, unk_144BD, unk_144C3, unk_144C9, unk_144D5, unk_144ED, word_114CE0
extern word_114DD2, word_114DD4, word_114DD6, word_114DD8, word_114DDC, word_114DE4, word_114DE6, word_114EA8
extern word_114EAC, word_114EF8, word_114EFA, word_114EFC, word_114EFE, word_114F00, word_1656DA, word_1656DC
extern word_1656DE, word_1656E0, word_1656E2, word_1656E4, word_1656E6, word_1656E8, word_1656EA, word_1656EC
extern word_1656F2, word_1656F4, word_1656F6, word_1656F8, word_1656FA, word_1656FC, word_1656FE, word_165700
extern word_165702, word_165810, word_165812, word_165814, word_165816, word_165818, word_16581A, word_16581C
extern word_16581E, word_165820, word_165822, word_165828, word_16582A, word_16582C, word_16582E, word_165830
extern word_165832, word_165834, word_165836, word_165838, word_176BB8, word_176BBA
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
        call sub_AD35C
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
        cmp word [word_114DE6], byte 0
        jne short .1
        mov eax, 20Ch
        mov ebx, 1
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [word_1656E8]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov ebx, 1
        call sprintf_
        lea eax, [byte ebp-020h]
        add esp, byte 0Ch
        movsx edx, word [word_114DD4]
        call DrawColorTextCentred
        movsx eax, word [word_16581E]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov ebx, 1
        call sprintf_
        lea eax, [byte ebp-020h]
        add esp, byte 0Ch
        movsx edx, word [word_114DD6]
        call DrawColorTextCentred
.1:
        movsx eax, word [word_114DE6]
        cmp eax, byte 2
        jge near .2
        mov edx, 3
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        lea ebx, [byte edx+01h]
        mov eax, 20Dh
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [hmtmstruct]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 3
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD4]
        call DrawColorTextCentred
        movsx eax, word [awtmstruct]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 3
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD6]
        call DrawColorTextCentred
.2:
        movsx eax, word [word_114DE6]
        cmp eax, byte 3
        jge near .7
        mov edx, 4
        sub edx, eax
        movsx eax, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DDC]
        sub eax, edx
        lea ebx, [byte eax+01h]
        mov eax, 20Eh
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx esi, word [hmtmstruct]
        movsx ebx, word [word_1656E8]
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
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD4]
        call DrawColorTextCentred
        movsx esi, word [awtmstruct]
        movsx ebx, word [word_16581E]
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
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD6]
        call DrawColorTextCentred
.7:
        movsx eax, word [word_114DE6]
        cmp eax, byte 4
        jge near .8
        mov edx, 5
        sub edx, eax
        movsx ebx, word [word_114DDC]
        movsx eax, word [nosplit edx*2+word_114DD8]
        sub eax, ebx
        lea ebx, [byte eax+01h]
        mov eax, 20Fh
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [word_1656F2]
        push eax
        movsx eax, word [word_1656F4]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 5
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DDC]
        sub eax, edx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [word_114DD4]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx eax, word [word_165828]
        push eax
        movsx eax, word [word_16582A]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 5
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx ebx, word [word_114DDC]
        movsx eax, word [nosplit edx*2+word_114DD8]
        sub eax, ebx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [word_114DD6]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
.8:
        movsx eax, word [word_114DE6]
        cmp eax, byte 5
        jge near .9
        mov edx, 6
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx ebx, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DD2]
        sub ebx, eax
        mov eax, 210h
        inc ebx
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [word_1656F6]
        push eax
        movsx eax, word [word_1656F8]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 6
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx ebx, word [word_114DDC]
        movsx eax, word [nosplit edx*2+word_114DD8]
        sub eax, ebx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [word_114DD4]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx eax, word [word_16582C]
        push eax
        movsx eax, word [word_16582E]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 6
        call sprintf_
        movsx eax, word [word_114DE6]
        add esp, byte 10h
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx ebx, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DD6]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
.9:
        cmp word [word_114DE6], byte 0
        jle near .10
        movsx eax, word [word_114DE6]
        cmp eax, byte 6
        jge near .10
        mov edx, 7
        sub edx, eax
        movsx eax, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DDC]
        sub eax, edx
        lea ebx, [byte eax+01h]
        mov eax, 211h
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [word_1656DC]
        push eax
        movsx eax, word [word_1656DA]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 7
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx ebx, word [word_114DDC]
        movsx eax, word [nosplit edx*2+word_114DD8]
        sub eax, ebx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [word_114DD4]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx eax, word [word_165812]
        push eax
        movsx eax, word [word_165810]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 7
        call sprintf_
        movsx eax, word [word_114DE6]
        add esp, byte 10h
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx ebx, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DD6]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
.10:
        movsx eax, word [word_114DE6]
        cmp eax, byte 1
        jle near .11
        cmp eax, byte 7
        jge near .11
        mov ebx, 8
        sub ebx, eax
        movsx eax, word [word_114DDC]
        movsx ebx, word [nosplit ebx*2+word_114DD8]
        movsx edx, word [word_114DD2]
        sub ebx, eax
        mov eax, 212h
        inc ebx
        call GetLangText
        call DrawColorTextCentred
        movsx esi, word [word_1656E0]
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
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        add esp, byte 10h
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD4]
        call DrawColorTextCentred
        movsx esi, word [word_165816]
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
        movsx eax, word [word_114DE6]
        add esp, byte 10h
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx ebx, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DD6]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
.11:
        movsx eax, word [word_114DE6]
        cmp eax, byte 2
        jle near .12
        cmp eax, byte 8
        jge near .12
        mov edx, 9
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        lea ebx, [byte edx+01h]
        mov eax, 213h
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [word_1656DE]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 9
        call sprintf_
        movsx eax, word [word_114DE6]
        add esp, byte 0Ch
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx ebx, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DD4]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
        movsx eax, word [word_165814]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 9
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD6]
        call DrawColorTextCentred
.12:
        movsx eax, word [word_114DE6]
        cmp eax, byte 3
        jle near .13
        cmp eax, byte 9
        jge near .13
        mov edx, 0Ah
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx ebx, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DD2]
        sub ebx, eax
        mov eax, 214h
        inc ebx
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [word_1656E4]
        push eax
        movsx eax, word [word_1656E2]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Ah
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx ebx, word [word_114DDC]
        movsx eax, word [nosplit edx*2+word_114DD8]
        sub eax, ebx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [word_114DD4]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx eax, word [word_16581A]
        push eax
        movsx eax, word [word_165818]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Ah
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DDC]
        sub eax, edx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [word_114DD6]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
.13:
        movsx eax, word [word_114DE6]
        cmp eax, byte 4
        jle near .14
        cmp eax, byte 0Ah
        jge near .14
        mov edx, 0Bh
        sub edx, eax
        movsx ebx, word [word_114DDC]
        movsx eax, word [nosplit edx*2+word_114DD8]
        sub eax, ebx
        lea ebx, [byte eax+01h]
        mov eax, 215h
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [word_1656EA]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Bh
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD4]
        call DrawColorTextCentred
        movsx eax, word [word_165820]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Bh
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD6]
        call DrawColorTextCentred
.14:
        movsx eax, word [word_114DE6]
        cmp eax, byte 5
        jle near .19
        mov edx, 0Ch
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        lea ebx, [byte edx+01h]
        mov eax, 216h
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [word_1656FA]
        push eax
        movsx eax, word [word_1656FC]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Ch
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        add esp, byte 10h
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD4]
        call DrawColorTextCentred
        movsx eax, word [word_165830]
        push eax
        movsx eax, word [word_165832]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Ch
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        add esp, byte 10h
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD6]
        call DrawColorTextCentred
        movsx eax, word [word_114DE6]
        cmp eax, byte 6
        jle near .19
        mov edx, 0Dh
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        lea ebx, [byte edx+01h]
        mov eax, 217h
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [word_1656EC]
        movsx esi, word [word_165822]
        add esi, eax
        push esi
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Dh
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        add esp, byte 10h
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD4]
        call DrawColorTextCentred
        push esi
        movsx eax, word [word_165822]
        push eax
        push str_DD
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Dh
        call sprintf_
        movsx eax, word [word_114DE6]
        add esp, byte 10h
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx ebx, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DD6]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
        movsx eax, word [word_114DE6]
        cmp eax, byte 7
        jle near .19
        mov edx, 0Eh
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx ebx, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DD2]
        sub ebx, eax
        mov eax, 218h
        inc ebx
        call GetLangText
        call DrawColorTextCentred
        movsx eax, word [word_1656FE]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Eh
        call sprintf_
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        add esp, byte 0Ch
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD4]
        call DrawColorTextCentred
        movsx eax, word [word_165834]
        push eax
        push str_D20
        lea eax, [byte ebp-020h]
        push eax
        mov edx, 0Eh
        call sprintf_
        movsx eax, word [word_114DE6]
        add esp, byte 0Ch
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx ebx, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DD6]
        sub ebx, eax
        lea eax, [byte ebp-020h]
        inc ebx
        call DrawColorTextCentred
        movsx eax, word [word_114DE6]
        cmp eax, byte 8
        jle near .19
        mov edx, 0Fh
        sub edx, eax
        movsx eax, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DDC]
        sub eax, edx
        lea ebx, [byte eax+01h]
        mov eax, 219h
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx esi, word [word_1656E6]
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
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DDC]
        sub eax, edx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [word_114DD4]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx esi, word [word_16581C]
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
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx ebx, word [word_114DDC]
        movsx eax, word [nosplit edx*2+word_114DD8]
        sub eax, ebx
        add esp, byte 10h
        lea ebx, [byte eax+01h]
        movsx edx, word [word_114DD6]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
        movsx eax, word [word_114DE6]
        cmp eax, byte 0Ah
        jne near .19
        mov edx, 10h
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        lea ebx, [byte edx+01h]
        mov eax, 21Ah
        movsx edx, word [word_114DD2]
        call GetLangText
        call DrawColorTextCentred
        movsx esi, word [word_165700]
        movsx ebx, word [word_165702]
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
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [word_114DDC]
        movsx edx, word [nosplit edx*2+word_114DD8]
        sub edx, eax
        lea ebx, [byte edx+01h]
        lea eax, [byte ebp-020h]
        movsx edx, word [word_114DD4]
        call DrawColorTextCentred
        movsx esi, word [word_165836]
        movsx ebx, word [word_165838]
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
        movsx eax, word [word_114DE6]
        sub edx, eax
        movsx eax, word [nosplit edx*2+word_114DD8]
        movsx edx, word [word_114DDC]
        sub eax, edx
        lea ebx, [byte eax+01h]
        movsx edx, word [word_114DD6]
        lea eax, [byte ebp-020h]
        call DrawColorTextCentred
.19:
        call sub_DD6C4
        movsx eax, word [word_114DDC]
        dec eax
        push eax
        push byte 0
        push dword [byte edi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push edi
        call sub_ADBEC
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
        call sub_DD6C4
        push byte 0
        call sub_ADA50
        add esp, byte 4
        mov eax, 0FEh
        xor edx, edx
        call LoadPackedFile
        push str_BKGD28
        push eax
        mov esi, eax
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AADA4
        add esp, byte 4
        push esi
        call sub_ABF4C
        add esp, byte 4
        push byte 0
        push dword 0FE50h
        push str_BANNER
        call sub_AB758
        mov esi, dword [dword_152F58]
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
        call sub_E04E0
        mov edi, eax
        add esp, byte 8
        push byte 10h
        push dword [byte ebp+07Eh]
        push eax
        call sub_E0520
        mov eax, dword [byte ebp+07Eh]
        add esp, byte 0Ch
        add eax, byte 10h
        push eax
        add edi, byte 10h
        push edi
        mov dword [byte ebp+066h], eax
        call sub_AFCD0
        add esp, byte 8
        push byte 46h
        push byte 24h
        mov eax, dword [byte ebp+07Eh]
        push eax
        and dword [eax], 0FFh
        call sub_AAA40
        add esp, byte 0Ch
        push esi
        call sub_ABF4C
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
        call sub_E04E0
        add esp, byte 8
        push byte 10h
        push dword [byte ebp+07Eh]
        push eax
        mov esi, eax
        call sub_E0520
        add esp, byte 0Ch
        push dword [byte ebp+066h]
        add esi, byte 10h
        push esi
        call sub_AFCD0
        add esp, byte 8
        push byte 46h
        push dword 19Dh
        mov eax, dword [byte ebp+07Eh]
        push eax
        and dword [eax], 0FFh
        call sub_AAA40
        add esp, byte 0Ch
        push edi
        call sub_ABF4C
        add esp, byte 4
        push dword [byte ebp+07Eh]
        call sub_ABF4C
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
        call sub_E04E0
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp+062h], eax
        call SetScreenColors
        movsx eax, word [word_114DE4]
        movzx edx, byte [byte_11FA2F]
        add eax, edx
        movsx edx, word [word_114DDC]
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
        call sub_AB758
        mov esi, dword [dword_152F58]
        mov edi, eax
        movsd
        movsd
        movsd
        movsd
        movsb
        mov word [byte eax+0Ch], 0
        mov dx, word [word_114DDC]
        dec edx
        mov word [byte eax+0Eh], dx
        mov dx, word [dword_11F5C0]
        sub edx, byte 0Ah
        mov dword [byte ebp+06Ah], eax
        mov word [byte eax+04h], dx
        mov dword [byte ebp+072h], eax
        movzx ax, byte [byte_11FA2F]
        add ax, word [word_114DE4]
        mov si, word [word_114DDC]
        inc eax
        inc eax
        mov edx, dword [byte ebp+06Ah]
        sub eax, esi
        add esp, byte 0Ch
        mov word [byte edx+06h], ax
        call sub_DD6C4
        push dword [byte ebp+06Ah]
        call sub_AA988
        mov word [word_114DE6], 0
        add esp, byte 4
        mov eax, dword [byte ebp+06Ah]
        lea edx, [dword ebp-01C2h]
        call DrawGameStats
        mov eax, 3
        call InitMenuItems
        push str_AR005
        push dword [byte ebp+066h]
        call sub_E04E0
        add esp, byte 8
        push str_AR015
        push dword [byte ebp+066h]
        mov dword [dword ebp-01A8h], eax
        call sub_E04E0
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
        call sub_E04E0
        add esp, byte 8
        push str_AR115
        push dword [byte ebp+066h]
        mov dword [dword ebp-0142h], eax
        call sub_E04E0
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
        mov esi, dword_17BD48
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
        mov ax, word [word_114CE0]
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
        mov esi, dword_17BCE2
        rep movsb
        mov byte [byte ebp-04Eh], 3
        mov byte [byte ebp-04Ch], 3
        mov byte [byte ebp-04Bh], 3
        mov byte [byte ebp-04Dh], 0
        mov byte [dword ebp-0180h], 3
.1:
        mov ax, word [word_114CE0]
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
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AAA40
        add esp, byte 0Ch
.3:
        call SoundIdle
        cmp dword [byte ebp+05Eh], byte 0
        jl short .5
        mov ax, word [word_114CE0]
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
        mov ax, word [word_114CE0]
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
        cmp word [word_114DE6], byte 0
        jle short .7
        dec word [word_114DE6]
        jmp short .8
.7:
        cmp dword [byte ebp+05Eh], byte 1
        jne short .8
        movsx eax, word [word_114DE6]
        cmp eax, byte 0Ah
        jge short .8
        inc word [word_114DE6]
.8:
        mov eax, dword [byte ebp+072h]
        call DrawGameStats
        movsx eax, word [word_114DE6]
        imul eax, byte 0Fh
        add eax, 0A0h
        push eax
        push dword 264h
        push str_BALL7
        push dword [byte ebp+07Ah]
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AAA40
        add esp, byte 0Ch
        jmp short .11
.9:
        call SlideInTitleBar
        mov dword [byte ebp+06Eh], 1
        jmp short .11
.10:
        call SlideInBottomBar
        push dword [dword_17BC78]
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
        call sub_ABF4C
        add esp, byte 4
        push dword [byte ebp+07Ah]
        call sub_ABF4C
        add esp, byte 4
        push dword [byte ebp+076h]
        call sub_ABF4C
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
        cmp eax, dword [dword_114EF4]
        jle near AnimateStarsScreen_121.14
        cmp word [word_114EFE], byte 0
        jne short .1
        movsx eax, word [word_114F00]
        inc eax
        mov ebx, 18h
        cdq
        idiv ebx
        movsx ebx, dx
        mov eax, ebx
        mov word [word_114F00], dx
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
        push dword [dword ecx+eax*4+dword_151AEC]
        call sub_AADA4
        movsx eax, word [word_114F00]
        cdq
        idiv esi
        mov word [word_114EFE], 2
        add esp, byte 4
        cmp edx, byte 7
        jne short .2
        mov word [word_114EFE], 20h
        jmp short .2
.1:
        dec word [word_114EFE]
.2:
        cmp word [word_114EF8], byte 0
        je near AnimateStarsScreen_121.4
        push dword [dword_151B4C]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push dword [dword_151B64]
        call PutBlock
        mov ax, word [word_114EF8]
        add esp, byte 0Ch
        cmp ax, 6
        ja short AnimateStarsScreen_E7
        movzx eax, ax
        jmp dword [nosplit cs:eax*4+jpt_15A72]
AnimateStarsScreen_D3:
        mov eax, 0FD70h
        mov edx, dword [dword_151B7C]
.3:
        xor ecx, ecx
        xor ebx, ebx
        call DrawFrameAt
AnimateStarsScreen_E7:
        call sub_DD6C4
        push dword [dword_151AE8]
        mov eax, dword [dword_151B4C]
        push dword [dword_151AE4]
        push dword [byte eax+02Ch]
        call PutBlock
        dec word [word_114EF8]
        add esp, byte 0Ch
        jmp near AnimateStarsScreen_121.13
AnimateStarsScreen_114:
        mov eax, 0FD70h
        mov edx, dword [dword_151B78]
        jmp short AnimateStarsScreen_D3.3
AnimateStarsScreen_121:
        mov eax, 0FD70h
        mov edx, dword [dword_151B74]
        jmp short AnimateStarsScreen_D3.3
.4:
        call GetTicks
        cmp eax, dword [dword_114EE8]
        jle near .5
        cmp word [word_114EFC], byte 0
        jne near .5
        cmp word [word_114EFA], byte 0
        jne near .5
        call rand_
        mov ebx, 3
        cdq
        idiv ebx
        mov ebx, edx
        shl ebx, 6
        mov esi, dword [dword ebx+dword_114DF0]
        sub esi, dword [dword ebx+dword_114DE8]
        call rand_
        inc esi
        cdq
        idiv esi
        mov eax, dword [dword ebx+dword_114DE8]
        add eax, edx
        mov edx, dword [dword ebx+dword_114DFC]
        sub edx, dword [dword ebx+dword_114DF4]
        mov dword [dword_151AE4], eax
        lea esi, [byte edx+01h]
        call rand_
        cdq
        idiv esi
        mov eax, dword [dword ebx+dword_114DF4]
        add eax, edx
        mov dword [dword_151AE8], eax
        mov eax, dword [dword_151B4C]
        mov eax, dword [byte eax+02Ch]
        mov dx, word [dword_151AE4]
        mov word [byte eax+0Ch], dx
        mov eax, dword [dword_151B4C]
        mov eax, dword [byte eax+02Ch]
        mov dx, word [dword_151AE8]
        mov word [byte eax+0Eh], dx
        mov eax, dword [dword_151B4C]
        push dword [byte eax+02Ch]
        call sub_AA988
        add esp, byte 4
        push dword [dword_151B64]
        call sub_ABF4C
        mov eax, dword [dword_151B4C]
        add esp, byte 4
        mov edx, 20h
        mov eax, dword [byte eax+02Ch]
        call CopyBitmap
        mov word [word_114EF8], 6
        mov dword [dword_151B64], eax
        call GetTicks
        mov ecx, 46h
        mov ebx, eax
        call rand_
        cdq
        idiv ecx
        add ebx, byte 1Eh
        add ebx, edx
        mov dword [dword_114EE8], ebx
        jmp near .13
.5:
        cmp word [word_114EFA], byte 0
        je near .8
        movsx eax, word [word_114EFA]
        cmp eax, byte 5
        jge short .6
        push dword [dword_151B68]
        call sub_AADA4
        add esp, byte 4
        push dword [dword_151B68]
        call sub_ABF4C
        mov dword [dword_151B68], 0
        add esp, byte 4
.6:
        mov esi, 5
        movsx eax, word [word_114EFA]
        sub esi, eax
        cmp eax, byte 1
        je short .7
        mov edx, 20h
        mov eax, dword [nosplit esi*4+dword_151B50]
        call CopyBitmap
        mov dword [dword_151B68], eax
        call sub_DD6C4
        push dword [dword_151B68]
        call sub_AA988
        add esp, byte 4
        push dword [nosplit esi*4+dword_151B50]
        call sub_AADA4
        add esp, byte 4
.7:
        dec word [word_114EFA]
        jmp near .13
.8:
        cmp word [word_114EFC], byte 0
        jne short .9
        call GetTicks
        cmp eax, dword [dword_114EF0]
        jle short .9
        mov word [word_114EFA], 5
        mov esi, 190h
        call GetTicks
        mov ebx, eax
        call rand_
        cdq
        idiv esi
        add ebx, 1F4h
        add ebx, edx
        mov dword [dword_114EF0], ebx
        jmp near .13
.9:
        cmp word [word_114EFC], byte 0
        je near .12
        movsx eax, word [word_114EFC]
        cmp eax, byte 2
        jne short .10
        call rand_
        mov ebx, 2
        cdq
        idiv ebx
        mov esi, edx
        shl esi, 3
        mov eax, dword [dword_151B70]
        mov dx, word [dword esi+word_114EA8]
        mov word [byte eax+0Ch], dx
        mov eax, dword [dword_151B70]
        mov dx, word [dword esi+word_114EAC]
        mov word [byte eax+0Eh], dx
        call sub_DD6C4
        push dword [dword_151B70]
        call sub_AA988
        add esp, byte 4
        push dword [dword esi+word_114EAC]
        push dword [dword esi+word_114EA8]
        push dword [dword_151B6C]
        call sub_AAA40
        add esp, byte 0Ch
        jmp short .11
.10:
        push dword [dword_151B70]
        call sub_AADA4
        add esp, byte 4
.11:
        dec word [word_114EFC]
        jmp short .13
.12:
        call GetTicks
        cmp eax, dword [dword_114EEC]
        jle short .13
        mov word [word_114EFC], 2
        call GetTicks
        mov ecx, 1F4h
        mov ebx, eax
        call rand_
        cdq
        idiv ecx
        add ebx, 0C8h
        add ebx, edx
        mov dword [dword_114EEC], ebx
.13:
        call GetTicks
        add eax, byte 4
        mov dword [dword_114EF4], eax
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
        mov esi, unk_144D5
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
        movsx edx, word [dword esi+word_176BB8]
        imul edx, dword 4B4h
        movsx eax, word [dword esi+word_176BBA]
        imul eax, byte 2Bh
        mov eax, dword [dword edx+eax+dword_1571B3]
        call PlayerDbRecord
        mov dword [byte esi+ebp+0Eh], eax
        mov edx, dword [dword_1174E0]
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
        call sub_AB758
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
        call sub_B0430
        add esp, byte 4
        test eax, eax
        jne short .3
        push eax
        push str_ProfileFsh5
        call sub_B0494
        add esp, byte 8
        push str_Ard5
        mov edi, dword [byte ebp+07Ah]
        push eax
        mov dword [byte ebp+04Eh], eax
        mov dword [byte ebp+052h], eax
        call sub_E04E0
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
        call sub_B0494
        add esp, byte 8
        push str_Pal25
        mov edi, dword [byte ebp+07Ah]
        push eax
        mov dword [byte ebp+04Eh], eax
        mov dword [byte ebp+052h], eax
        call sub_E04E0
        mov ecx, 300h
        add esp, byte 8
        lea esi, [byte eax+010h]
        mov edi, dword [byte edi+ebp-01Eh]
        rep movsb
        push str_Plyr5
.4:
        push dword [byte ebp+04Eh]
        call sub_E04E0
        add esp, byte 8
        xor edx, edx
        call CopyBitmap
        mov edx, dword [byte ebp+07Ah]
        mov dword [byte edx+ebp-022h], eax
        push dword [byte ebp+052h]
        add dword [byte ebp+06Ah], byte 4
        add dword [byte ebp+07Ah], byte 8
        add dword [byte ebp+056h], 300h
        call sub_ABF4C
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
        call sub_ADA50
        add esp, byte 4
        call BlackPalette
        push str_Pal25
        push esi
        call sub_E04E0
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
        call sub_ABF4C
        add esp, byte 4
        mov eax, dword [byte ebp+062h]
        call SetScreenPalette
        call sub_DD6C4
        push str_BKGD28
        push esi
        call sub_E04E0
        add esp, byte 8
        push eax
        mov dword [byte ebp+066h], 0
        call sub_AADA4
        mov edx, 0FEh
        add esp, byte 4
        mov eax, 0FCh
        xor edi, edi
        call SetTextColors
        push dword [dword_17BC74]
        xor esi, esi
        call TextSetFont
        add esp, byte 4
.5:
        push byte 0
        movsx eax, word [byte edi+ebp+02Eh]
        push eax
        movsx eax, word [byte edi+ebp+026h]
        push eax
        call sub_AD35C
        add esp, byte 0Ch
        push eax
        mov dword [byte ebp+04Eh], eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 74h
        call sub_E0584
        mov eax, dword [byte ebp+066h]
        add esp, byte 4
        mov edx, dword [byte esi+ebp-022h]
        xor ecx, ecx
        xor ebx, ebx
        mov eax, dword [byte eax+ebp+01Ah]
        call DrawFrameAt
        push dword [byte esi+ebp-022h]
        call sub_ABF4C
        add esp, byte 4
        call sub_DD6C4
        push dword [byte esi+ebp-06h]
        mov eax, dword [byte ebp+04Eh]
        push dword [byte esi+ebp-0Ah]
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [byte ebp+04Eh]
        call sub_ADBEC
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
        mov ebx, dword [dword esi+dword_114EB4]
        mov edx, dword [dword esi+dword_114EB0]
        add dword [byte ebp+066h], byte 4
        call DrawColorTextRight
        cmp edi, byte 6
        jne near .5
        push str_ST10
        push dword [byte ebp+07Eh]
        call sub_E04E0
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
        call sub_AD35C
        add esp, byte 0Ch
        mov dword [byte ebp+042h], eax
.6:
        mov eax, dword [byte ebp+072h]
        movsx eax, word [byte eax+04h]
        mov edx, dword [byte ebp+05Ah]
        lea eax, [eax+eax*2]
        mov edx, dword [dword edx+dword_114ED0]
        sar eax, 3
        sub edx, eax
        mov eax, dword [byte ebp+042h]
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp+072h]
        movsx eax, word [byte eax+06h]
        mov edx, dword [byte ebp+05Ah]
        lea eax, [eax+eax*2]
        mov edx, dword [dword edx+dword_114ED4]
        sar eax, 3
        sub edx, eax
        mov eax, dword [byte ebp+042h]
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Eh], dx
        call sub_DD6C4
        mov eax, dword [byte ebp+042h]
        push dword [byte eax+02Ch]
        call sub_AA988
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
        call sub_E04E0
        add esp, byte 8
        push byte 0
        push byte 0
        mov edx, dword [byte ebp+06Eh]
        push dword [byte ebp+072h]
        mov dword [dword edx+dword_151AEC], eax
        call PutBlock
        mov edx, dword [byte ebp+06Eh]
        mov eax, 0C000h
        add esp, byte 0Ch
        xor ecx, ecx
        xor ebx, ebx
        mov edx, dword [dword edx+dword_151AEC]
        mov esi, dword [byte ebp+042h]
        call DrawFrameAt
        mov esi, dword [byte esi+02Ch]
        movsx edx, word [byte esi+04h]
        movsx eax, word [byte esi+06h]
        imul eax, edx
        mov edi, dword [byte ebp+06Eh]
        mov edi, dword [dword edi+dword_151AEC]
        lea ecx, [byte eax+010h]
        rep movsb
        mov eax, dword [byte ebp+04Eh]
        add dword [byte ebp+06Eh], byte 4
        cmp eax, byte 8
        jl near .7
        push dword [byte ebp+072h]
        call sub_ABF4C
        add esp, byte 4
        call sub_DD6C4
        mov eax, dword [byte ebp+03Ah]
        add dword [byte ebp+05Eh], byte 20h
        add dword [byte ebp+05Ah], byte 8
        push dword [dword eax+dword_151B08]
        inc dword [byte ebp+04Ah]
        call sub_AADA4
        add esp, byte 4
        cmp dword [byte ebp+04Ah], byte 3
        jl near .6
        mov word [word_114EFE], 8
        push dword [byte ebp+042h]
        mov word [word_114F00], 0
        call sub_ADBEC
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
        call sub_E04E0
        add esp, byte 8
        mov dword [dword esi+dword_151B70], eax
        cmp edi, byte 3
        jl short .8
        mov eax, dword [dword_151B74]
        push byte 20h
        movsx edx, word [byte eax+06h]
        push edx
        movsx eax, word [byte eax+04h]
        push eax
        xor edi, edi
        call sub_AD35C
        mov edx, 20h
        mov dword [dword_151B4C], eax
        add esp, byte 0Ch
        mov eax, dword [byte eax+02Ch]
        xor esi, esi
        call CopyBitmap
        mov dword [dword_151B64], eax
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
        call sub_E04E0
        add esp, byte 8
        mov dword [dword esi+dword_151B4C], eax
        cmp edi, byte 4
        jl short .9
        push str_STRK
        push dword [byte ebp+07Eh]
        mov dword [dword_151B68], 0
        call sub_E04E0
        add esp, byte 8
        mov edx, 20h
        mov dword [dword_151B6C], eax
        call CopyBitmap
        mov dword [dword_151B70], eax
        call GetTicks
        mov dword [dword_114EF4], eax
        mov dword [dword_114EEC], eax
        mov dword [dword_114EE8], eax
        call GetTicks
        mov ebx, 190h
        mov esi, eax
        call rand_
        cdq
        idiv ebx
        mov word [word_114EFC], 0
        mov word [word_114EFA], 0
        mov word [word_114EF8], 0
        add esi, 1F4h
        mov eax, 4
        add esi, edx
        lea edx, [dword ebp-0262h]
        mov dword [dword_114EF0], esi
        call InitMenuItems
        push str_BT006
        push dword [byte ebp+07Eh]
        call sub_E04E0
        add esp, byte 8
        push str_BT0110
        push dword [byte ebp+07Eh]
        mov dword [dword ebp-0248h], eax
        call sub_E04E0
        add esp, byte 8
        push str_BT028
        push dword [byte ebp+07Eh]
        mov dword [dword ebp-0244h], eax
        call sub_E04E0
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
        call sub_E04E0
        add esp, byte 8
        push str_BT118
        push dword [byte ebp+07Eh]
        mov dword [dword ebp-01E2h], eax
        call sub_E04E0
        add esp, byte 8
        mov dword [dword ebp-01DEh], eax
        push str_BT124
        push dword [byte ebp+07Eh]
        call sub_E04E0
        mov dword [dword ebp-01DAh], eax
        lea eax, [dword ebp-08Ah]
        mov dword [dword ebp-01E8h], eax
        mov eax, dword [dword ebp-01E2h]
        mov dword [dword ebp-01ECh], 8
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-01D6h], eax
        mov eax, dword [dword ebp-01E2h]
        lea edi, [dword ebp-0196h]
        mov esi, dword_17BD48
        movsx eax, word [byte eax+0Eh]
        mov ecx, 66h
        mov dword [dword ebp-01D2h], eax
        mov ax, word [word_114CE0]
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
        mov ax, word [word_114CE0]
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
        mov esi, dword_17BCE2
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
        mov ax, word [word_114CE0]
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
        mov ax, word [word_114CE0]
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
        mov ax, word [word_114CE0]
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
        mov ecx, byte_17BDAE
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
        push dword [dword_17BC78]
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
        cmp dword [dword_151B68], byte 0
        je short .16
        push dword [dword_151B68]
        call sub_ABF4C
        add esp, byte 4
.16:
        push dword [dword_151B70]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_151B64]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_151B4C]
        call sub_ADBEC
        add esp, byte 4
        push dword [byte ebp+07Eh]
        call sub_ABF4C
        add esp, byte 4
        mov eax, 3
        call FadeOut
        call StopSpeech
        push dword [dword_17BC78]
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
        mov byte [byte_1820F1], 0
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
