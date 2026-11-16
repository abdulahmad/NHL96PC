; Front-end main: main_, start-up and shut-down, the front-end screen loop, team logos (96 PC).
bits 32
%include "hockey.inc"
section s_1B046 progbits alloc exec nowrite align=1
extern _dos_gettime_, asc_1103D8, chdir_, DetectCPU, dword_114CD3, dword_1150D4, dword_1150D8, dword_1150DC
extern dword_11D19C, dword_11F5E4, dword_11F61C, dword_11F994, dword_11F9C8, dword_152F44, dword_152F48, dword_152F4C
extern dword_152F50, dword_152F54, dword_152F58, dword_152F5C, globalset, InitInputDevices, InstallTimer, LoadDataFile
extern LoadGripLibrary, LoadPackedFile, MakeDataPath, ModemGameClose, off_11D3DC, optflags, PlayMenuGame, printf_
extern ReadGlobalSet, srand_, StartSoundCard, str_CLEARER, str_dbgL, str_Dot, str_FhiL4, str_FhiR4
extern str_HardwareBeforeRunningHOC, str_IhreHardwareZuKonfigurie, str_LDON, str_LEAS, str_Lgo, str_LNEW, str_LNHL, str_LNPA
extern str_LOGOPACK, str_LSTA, str_spPressESCToReturnToDOS, str_YouMustFirstUseTheSETUPP, strcat_, strcmp_, strlen_, GripSetupScreen
extern ClearSlotUsers, UserRecordsScreen, sub_57F0A, sub_583B8, LoadFrontEndArt, FreeFrontEndArt, RunIntro, RunCredits
extern CopyBitmap, InitGraphicsFix, SetScreenMode, SetMenuMoveSfx, SetMenuSelectSfx, MainMenuScreen, StopMusic, FadeOutMusic
extern TestCdSpeed, ShutdownSound, WriteGlobalSet, RunExhibitionMenus, sub_73BA5, LoadLangText, FreeLangText, GetLangText
extern RunSeasonMenus, RunStatsMenu, RunModemGameSetup, sub_A4FD7, sub_AB758, sub_ABF4C, sub_AC868, sub_ADA50
extern sub_AFCD0, sub_AFFD0, sub_B3100, sub_B3145, sub_B3160, sub_B31C0, sub_B3420, sub_DD6C4
extern sub_DD800, sub_DD830, sub_DD87C, sub_DFA98, sub_DFB88, sub_DFF28, sub_E04D0, sub_E04E0
extern sub_E0520, sub_E05DA, TextSetFont, unk_110351, unk_110355, unk_11041A, unk_11048D, unk_115120
extern unk_1210DC, unk_1213DC, unk_152C44, unk_18584C
global jpt_1B046, LoadTeamLogo, LoadTeamLogo_3B, LoadTeamLogo_45, LoadTeamLogo_4F, LoadTeamLogo_59, LoadTeamLogo_63, LoadTeamLogo_6D
global LoadTeamLogo_ret, RunFrontEnd, ReturnTrue, CheckFreeMemory, CheckGameDirs, InitHardware, StartUp, ShutDown
global ShutDown_51, StartUp_ret, main_
jpt_1B046:
        dd LoadTeamLogo_6D
        dd LoadTeamLogo_3B
        dd LoadTeamLogo_45
        dd LoadTeamLogo_4F
        dd LoadTeamLogo_59
        dd LoadTeamLogo_63
;-----------------------------------------------------------------------------
; LoadTeamLogo                                 1B05E  96 PC, medium confidence
; (team): loads the logo "L" + the team's three letters (off_11D3DC), or for
; 1Ch-21h the league logos LNPA, LNHL, LDON, LNEW, LSTA, LEAS, from the logo
; bank, with its palette
;-----------------------------------------------------------------------------
LoadTeamLogo:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov ax, word [str_dbgL]
        mov word [byte ebp-08h], ax
        cmp esi, byte 1Ch
        jge short .2
        lea eax, [byte ebp-08h]
        mov edx, dword [nosplit esi*4+off_11D3DC]
.1:
        call strcat_
        jmp short LoadTeamLogo_6D.4
.2:
        lea eax, [byte esi-01Ch]
        cmp eax, byte 5
        ja short LoadTeamLogo_6D
        jmp dword [nosplit cs:eax*4+jpt_1B046]
LoadTeamLogo_3B:
        lea edi, [byte ebp-08h]
        mov esi, str_LNPA
        jmp short LoadTeamLogo_6D.3
LoadTeamLogo_45:
        lea edi, [byte ebp-08h]
        mov esi, str_LNHL
        jmp short LoadTeamLogo_6D.3
LoadTeamLogo_4F:
        lea edi, [byte ebp-08h]
        mov esi, str_LDON
        jmp short LoadTeamLogo_6D.3
LoadTeamLogo_59:
        lea edi, [byte ebp-08h]
        mov esi, str_LNEW
        jmp short LoadTeamLogo_6D.3
LoadTeamLogo_63:
        lea edi, [byte ebp-08h]
        mov esi, str_LSTA
        jmp short LoadTeamLogo_6D.3
LoadTeamLogo_6D:
        lea edi, [byte ebp-08h]
        mov esi, str_LEAS
.3:
        movsd
        movsb
.4:
        lea eax, [byte ebp-08h]
        call strlen_
        cmp eax, byte 4
        jae short .5
        mov edx, unk_110351
        lea eax, [byte ebp-08h]
        jmp short LoadTeamLogo.1
.5:
        lea eax, [byte ebp-08h]
        push eax
        push dword [dword_152F48]
        call sub_E04E0
        add esp, byte 8
        push byte 10h
        push dword [dword_152F44]
        push eax
        mov esi, eax
        call sub_E0520
        mov eax, dword [dword_152F44]
        add esp, byte 0Ch
        add eax, byte 10h
        push eax
        add esi, byte 10h
        push esi
        call sub_AFCD0
        mov eax, dword [dword_152F44]
        and dword [eax], 0FFh
        add esp, byte 8
        mov eax, dword [dword_152F44]
LoadTeamLogo_ret:
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RunFrontEnd                                                     1B13D  96 PC
; The front end: runs the screen with the current number (each screen returns
; the next: main menu, exhibition, season, playoffs, options, modem, ...)
; until quit; main_ calls it
;-----------------------------------------------------------------------------
RunFrontEnd:
        push edx
        xor eax, eax
.1:
        cmp eax, byte 0Dh
        jb short .3
        jbe near .12
        cmp eax, byte 13h
        jb short .2
        jbe near .8
        cmp eax, byte 15h
        jb near .16
        jbe near .14
        cmp eax, byte 16h
        je near .15
        jmp near .16
.2:
        cmp eax, byte 10h
        jb near .16
        jbe near .10
        cmp eax, byte 12h
        je near .13
        jmp near .16
.3:
        cmp eax, byte 4
        jb short .4
        jbe short .9
        cmp eax, byte 7
        jb near .16
        jbe short .7
        cmp eax, byte 0Bh
        je short .11
        jmp near .16
.4:
        test eax, eax
        jbe short .5
        cmp eax, byte 1
        je short .6
        jmp short .16
.5:
        call MainMenuScreen
        jmp short .17
.6:
        call RunExhibitionMenus
        jmp short .17
.7:
        call RunSeasonMenus
        jmp short .17
.8:
        call sub_A4FD7
        jmp short .17
.9:
        call sub_73BA5
        jmp short .17
.10:
        call UserRecordsScreen
        jmp short .17
.11:
        call sub_583B8
        jmp short .17
.12:
        xor eax, eax
        call RunStatsMenu
        jmp short .17
.13:
        call RunModemGameSetup
        jmp short .17
.14:
        mov eax, dword [dword_1150D8]
        call PlayMenuGame
        jmp short .17
.15:
        call sub_57F0A
        jmp short .17
.16:
        xor eax, eax
.17:
        cmp eax, byte 17h
        jne near .1
        mov eax, 64h
        xor edx, edx
        call FadeOutMusic
        call StopMusic
        pop edx
        ret
;-----------------------------------------------------------------------------
; ReturnTrue                                                      1B229  96 PC
; Returns 1 (a callback that always says yes)
;-----------------------------------------------------------------------------
ReturnTrue:
        mov eax, 1
        ret
;-----------------------------------------------------------------------------
; CheckFreeMemory                                                 1B22F  96 PC
; Start-up: free DOS / extended memory against 5 MB (4CE1A4h) and 4.6 MB; not
; enough prints the text and waits for Esc
;-----------------------------------------------------------------------------
CheckFreeMemory:
        push ebx
        push ecx
        push edx
        push esi
        push dword 220h
        call sub_AC868
        add esp, byte 4
        push byte 0
        mov esi, eax
        call sub_AC868
        add esp, byte 4
        add esi, eax
        cmp eax, 4CE1A4h
        jge near .5
        cmp eax, 46A5F0h
        jge short .2
        cmp esi, 4CE1A4h
        jge near .5
        call sub_DD800
        mov eax, 262h
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
        mov eax, 263h
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
        mov eax, 1D6h
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
.1:
        call sub_DFF28
        cmp eax, byte 1Bh
        jne short .1
        jmp short .4
.2:
        cmp esi, 4CE1A4h
        jge short .5
        call sub_DD800
        mov eax, 264h
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
        mov eax, 265h
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
        mov eax, 1D6h
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
.3:
        call sub_DFF28
        cmp eax, byte 1Bh
        jne short .3
.4:
        call dword [dword_11F994]
.5:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CheckGameDirs                                1B311  96 PC, medium confidence
; Start-up: changes into each of the game's 8 data directories and back; a
; missing one prints the text and waits for Esc
;-----------------------------------------------------------------------------
CheckGameDirs:
        push ebx
        push ecx
        push edx
        xor ebx, ebx
.1:
        cmp ebx, byte 8
        jge short .4
        imul ecx, ebx, byte 0Fh
        add ecx, unk_115120
        mov eax, ecx
        call chdir_
        test eax, eax
        je short .2
        mov ebx, 3E8h
        jmp short .3
.2:
        mov edx, str_Dot
        mov eax, ecx
        call strcmp_
        test eax, eax
        je short .3
        mov eax, unk_110355
        call chdir_
.3:
        inc ebx
        jmp short .1
.4:
        cmp ebx, 3E8h
        jle near StartUp_ret
        call sub_DD800
        mov eax, 25Dh
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
        mov eax, 25Eh
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
        mov eax, 1D6h
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
.5:
        call sub_DFF28
        cmp eax, byte 1Bh
        jne short .5
        jmp near ShutDown_51
;-----------------------------------------------------------------------------
; InitHardware                                 1B3AC  96 PC, medium confidence
; Start-up: mouse, GrIP library, memory pools (CLEARER), timer, video mode,
; palette and fonts
;-----------------------------------------------------------------------------
InitHardware:
        push ebx
        push ecx
        push edx
        push edi
        call sub_DFA98
        call LoadGripLibrary
        push dword 0A0000h
        push dword 1000000h
        push dword 0C8h
        call sub_B3100
        add esp, byte 0Ch
        push byte 0
        call sub_AC868
        add esp, byte 4
        push byte 0
        lea edi, [byte eax-0Ah]
        push edi
        push str_CLEARER
        call sub_AB758
        mov edx, eax
        add esp, byte 0Ch
        mov ecx, edi
        mov eax, 0FFh
        mov edi, edx
        rep stosb
        push edx
        call sub_ABF4C
        add esp, byte 4
        push dword 220h
        call sub_AC868
        add esp, byte 4
        push dword 220h
        lea edi, [byte eax-0Ah]
        push edi
        push str_CLEARER
        call sub_AB758
        mov edx, eax
        add esp, byte 0Ch
        mov ecx, edi
        mov eax, 0FFh
        mov edi, edx
        rep stosb
        push edx
        call sub_ABF4C
        add esp, byte 4
        push byte 64h
        call InstallTimer
        add esp, byte 4
        call sub_B3145
        call sub_DFB88
        push ReturnTrue
        call sub_E05DA
        add esp, byte 4
        call sub_B3160
        call InitGraphicsFix
        mov eax, 1
        call SetScreenMode
        push unk_1210DC
        push dword 100h
        push byte 0
        call sub_DD830
        add esp, byte 0Ch
        push unk_1213DC
        call TextSetFont
        add esp, byte 4
        push dword 0FF000000h
        call sub_B31C0
        add esp, byte 4
        push eax
        push byte 0FFFFFFFFh
        call sub_B31C0
        add esp, byte 4
        push eax
        call sub_AFFD0
        add esp, byte 8
        call sub_DD6C4
        push unk_18584C
        push dword 100h
        push byte 0
        call sub_DD87C
        add esp, byte 0Ch
        pop edi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; StartUp                                                         1B4D2  96 PC
; Main_ first part: seeds rand, InitHardware, InitInputDevices, reads the
; SETUP settings (else "You must first use the SETUP program..."), checks
; memory and directories, loads the front end
;-----------------------------------------------------------------------------
StartUp:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 7Ch, 0
        lea eax, [byte ebp-04h]
        call _dos_gettime_
        movzx eax, byte [byte ebp-03h]
        movzx edx, byte [byte ebp-04h]
        imul edx, eax
        movzx eax, byte [byte ebp-02h]
        imul eax, edx
        call srand_
        mov dword [dword_11F5E4], 1
        inc dword [dword_1150DC]
        call InitHardware
        push byte 0
        mov dword [dword_11F9C8], 0
        mov dword [dword_11F61C], 0
        call sub_ADA50
        add esp, byte 4
        call InitInputDevices
        call ReadGlobalSet
        test eax, eax
        jne short .2
        call sub_DD800
        push str_YouMustFirstUseTheSETUPP
        call printf_
        add esp, byte 4
        push str_HardwareBeforeRunningHOC
        call printf_
        add esp, byte 4
        push str_spPressESCToReturnToDOS
        call printf_
        add esp, byte 4
        push asc_1103D8
        call printf_
        add esp, byte 4
        push unk_11041A
        call printf_
        add esp, byte 4
        push str_IhreHardwareZuKonfigurie
        call printf_
        add esp, byte 4
        push unk_11048D
        call printf_
        add esp, byte 4
.1:
        call sub_DFF28
        cmp eax, byte 1Bh
        jne short .1
        call dword [dword_11F994]
.2:
        call CheckGameDirs
        mov eax, dword [optflags]
        shl eax, 1Ch
        shr eax, 1Eh
        call LoadLangText
        call DetectCPU
        cmp dword [dword_11F5E4], byte 0
        jne short .4
        call sub_DD800
        mov eax, 1D5h
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
        mov eax, 1D6h
        call GetLangText
        push eax
        call printf_
        add esp, byte 4
.3:
        call sub_DFF28
        cmp eax, byte 1Bh
        jne short .3
        call dword [dword_11F994]
.4:
        call CheckFreeMemory
        mov edx, 5Bh
        lea eax, [byte ebp-040h]
        call MakeDataPath
        mov edx, 5Bh
        lea eax, [byte ebp-07Ch]
        call MakeDataPath
        lea edx, [byte ebp-07Ch]
        lea eax, [byte ebp-040h]
        call TestCdSpeed
        mov edx, 20h
        mov eax, 0AFh
        call LoadPackedFile
        push str_FhiL4
        push eax
        mov dword [dword_1150D4], eax
        call sub_E04E0
        add esp, byte 8
        push str_FhiR4
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call sub_E04E0
        mov edx, 20h
        add esp, byte 8
        mov dword [dword_152F50], eax
        mov eax, 0Dh
        call LoadDataFile
        push byte 20h
        push dword 6910h
        push str_LOGOPACK
        mov dword [dword_152F48], eax
        call sub_AB758
        mov esi, dword [dword_152F58]
        mov edi, eax
        mov dword [dword_152F44], eax
        movsd
        movsd
        movsd
        movsd
        movsb
        mov eax, dword [dword_152F44]
        mov word [byte eax+04h], 0E0h
        add esp, byte 0Ch
        mov eax, dword [dword_152F44]
        push str_Lgo
        mov word [byte eax+06h], 78h
        push dword [dword_1150D4]
        mov edi, unk_152C44
        call sub_E04E0
        add esp, byte 8
        mov ecx, 300h
        lea esi, [byte eax+010h]
        rep movsb
        mov ebx, 20h
        mov edx, dword_152F4C
        mov eax, unk_152C44
        call sub_B3420
        mov ebx, 20h
        mov edx, dword_11D19C
        mov eax, unk_152C44
        call sub_B3420
        mov edx, dword [globalset]
        mov eax, dword [globalset]
        shl edx, 1Ch
        and eax, byte 7
        shr edx, 1Fh
        call StartSoundCard
        mov eax, 32h
        call SetMenuMoveSfx
        mov eax, 34h
        call SetMenuSelectSfx
        mov eax, 1
        mov edx, 20h
        call SetScreenMode
        call LoadFrontEndArt
        mov eax, dword [dword_152F58]
        call CopyBitmap
        mov edx, 20h
        mov dword [dword_152F54], eax
        mov eax, dword [dword_152F50]
        call CopyBitmap
        mov dword [dword_152F5C], eax
        cmp dword [dword_114CD3], byte 0
        jle short .5
        call GripSetupScreen
.5:
        call RunIntro
        call ClearSlotUsers
        push ModemGameClose
        call sub_E04D0
        add esp, byte 4
        jmp near LoadTeamLogo_ret
        push ebx
        push ecx
        push edx
;-----------------------------------------------------------------------------
; ShutDown                                                        1B79D  96 PC
; Main_ last part: frees the front end, sound and art, then the exit hook
;-----------------------------------------------------------------------------
ShutDown:
        call WriteGlobalSet
        call RunCredits
        call FreeFrontEndArt
        call ShutdownSound
        call FreeLangText
        push dword [dword_152F44]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_152F54]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_152F5C]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_1150D4]
        call sub_ABF4C
        add esp, byte 4
ShutDown_51:
        call dword [dword_11F994]
StartUp_ret:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; main_                                                         1B7F8  library
;-----------------------------------------------------------------------------
main_:
        push ebx
        push ecx
        push edx
        call StartUp
        call RunFrontEnd
        jmp short ShutDown
