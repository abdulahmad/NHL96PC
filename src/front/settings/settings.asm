; GLOBAL.SET, the settings file SETUP writes, read at start and written back; the EXHIBIT.NDX start of the front-end menus (96 PC).
bits 32
%include "hockey.inc"
section s_6A341 progbits alloc exec nowrite align=1
extern _dos_close_, _dos_open_, GsModemFlags, GsJoy1Calib, GsJoy2Calib, GsGripButtons
extern GlobalSetName
extern GsPlayerPads, DetectCPU, SaveFileHandle, DirPathTable, CpuHasCpuid, GlobalSetData, GsModemDial, GsOptions
extern GsTeamSelect, FileClose, FileReadAt, gameopts, getcwd_, globalset, LoadExhibitionStats, MakeDataPath
extern MakeDirPath, NameIndexFree, NameIndexLoad, optblock, optblock_end, optflags, str_5552362337, str_ATD2
extern str_ATF, str_backslash, str_EXHIBITNDX, strcat_, strlen_, strncpy_, LoadDataFileFlag0, RunControllerScreen
extern TeamSelectScreen, PickIndexEntryScreen, RunRosterScreens, ComputeTeamRanks, FreeMemBlock, CreateHandle, DosCloseFile, DosWriteFile
extern GsPhoneNumber, GsModemInit, SavedGameOpts, GsComPort, GsBaudIndex, GsDirectLink, GsWaitForCall, GsLinkOption
extern GsDialMode, GsPlayerFlags
global ReadGlobalSet, WriteGlobalSet, RunExhibitionMenus
;-----------------------------------------------------------------------------
; ReadGlobalSet                                6A341  96 PC, medium confidence
; Reads GLOBAL.SET, the settings file SETUP writes, at start
;-----------------------------------------------------------------------------
ReadGlobalSet:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 40h, 0
        call DetectCPU
        mov byte [GlobalSetName], 0
        mov dword [DirPathTable], GlobalSetName
        mov dword [gameopts], optblock_end
        mov edx, 1
        lea eax, [byte ebp-040h]
        lea ebx, [byte ebp-0Ch]
        call MakeDataPath
        mov edx, 2
        lea eax, [byte ebp-040h]
        mov dword [byte ebp-08h], 0
        call _dos_open_
        test eax, eax
        je short .1
        mov dword [byte ebp-04h], 0
        jmp short .2
.1:
        mov eax, dword [byte ebp-0Ch]
        mov edx, 20h
        call _dos_close_
        mov eax, 1
        call LoadDataFileFlag0
        mov dword [byte ebp-04h], eax
.2:
        cmp dword [byte ebp-04h], byte 0
        je near .5
        mov ecx, 0BCh
        mov esi, dword [byte ebp-04h]
        mov edi, GlobalSetData
        rep movsb
        cmp dword [GlobalSetData], 160BDh
        jne short .4
        test byte [globalset], 7
        jne short .3
        or byte [globalset], 8
        and byte [optblock], 7Fh
        and dword [globalset], 0EFEFEFEFh
.3:
        mov esi, dword [byte ebp-04h]
        mov ebx, 14h
        add esi, 0BCh
        mov eax, GlobalSetName
        mov edx, esi
        mov ecx, 0B9h
        call strncpy_
        mov eax, GlobalSetName
        mov byte [GlobalSetName+13h], 0
        call strlen_
        inc eax
        mov edi, optblock_end
        add esi, eax
        mov dword [byte ebp-08h], 1
        rep movsb
.4:
        push dword [byte ebp-04h]
        call FreeMemBlock
        add esp, byte 4
.5:
        cmp dword [byte ebp-08h], byte 0
        jne near .10
        mov dword [GlobalSetData], 160BDh
        mov byte [optflags], 0
        mov word [GsComPort], 1
        mov word [GsBaudIndex], 1
        mov word [GsLinkOption], 1
        mov word [GsDirectLink], 0
        mov word [GsWaitForCall], 0
        mov edi, GsPhoneNumber
        mov esi, str_5552362337
        and byte [GsModemFlags], 0FEh
        or byte [optflags], 80h
        movsd
        movsd
        movsw
        movsb
        mov edi, GsModemInit
        mov esi, str_ATF
        mov word [GsDialMode], 0
        mov ecx, 18h
        movsd
        movsw
        mov eax, dword [str_ATD2]
        mov edi, GsJoy1Calib
        and dword [globalset], 0E0000000h
        or word [optblock], 577Fh
        mov dword [GsModemDial], eax
        or dword [globalset], 0AEAEAE8h
        xor eax, eax
        and dword [optblock], 0FFFE577Fh
        rep stosb
        mov ecx, 18h
        mov edi, GsJoy2Calib
        xor eax, eax
        rep stosb
        mov byte [GsGripButtons], 1
        mov byte [GsGripButtons+1], 2
        mov byte [GsGripButtons+2], 1
        mov byte [GsGripButtons+3], 2
        mov byte [GsGripButtons+4], 1
        mov byte [GsGripButtons+5], 2
        mov byte [GsGripButtons+6], 1
        mov byte [GsGripButtons+7], 2
        or word [GsOptions], 163h
        cmp dword [CpuHasCpuid], byte 0
        je short .6
        or byte [GsOptions], 9Ch
        jmp short .7
.6:
        and byte [GsOptions], 63h
.7:
        mov edx, 14h
        and dword [GsOptions], 0FFFC01FFh
        mov eax, GlobalSetName
        or dword [GsOptions], 20200h
        call getcwd_
        mov eax, GlobalSetName
        call strlen_
        movsx eax, byte [dword eax+GlobalSetName-1]
        cmp eax, byte 5Ch
        je short .8
        mov edx, str_backslash
        mov eax, GlobalSetName
        call strcat_
.8:
        and dword [GsTeamSelect], 0FFC00000h
        xor eax, eax
        xor esi, esi
        or dword [GsTeamSelect], 18655Fh
.9:
        inc esi
        inc esi
        mov byte [dword eax+GsPlayerPads], 0
        inc eax
        mov word [dword esi+GsPlayerFlags], 1
        cmp eax, byte 4
        jl short .9
.10:
        mov eax, dword [byte ebp-08h]
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; WriteGlobalSet                                                  6A5EB  96 PC
; Writes GLOBAL.SET back (BCh header, the name, B9h options), the file
; ReadGlobalSet reads
;-----------------------------------------------------------------------------
WriteGlobalSet:
        push ebx
        push ecx
        push edx
        enter 40h, 0
        mov edx, 1
        lea eax, [byte ebp-040h]
        call MakeDataPath
        lea eax, [byte ebp-08h]
        push eax
        lea eax, [byte ebp-0Ch]
        push eax
        lea eax, [byte ebp-04h]
        push eax
        lea eax, [byte ebp-040h]
        push eax
        call CreateHandle
        add esp, byte 10h
        push dword 0BCh
        push GlobalSetData
        push dword [byte ebp-04h]
        call DosWriteFile
        add esp, byte 0Ch
        test eax, eax
        je short .1
        mov eax, GlobalSetName
        call strlen_
        inc eax
        push eax
        push GlobalSetName
        push dword [byte ebp-04h]
        call DosWriteFile
        add esp, byte 0Ch
        test eax, eax
        je short .1
        push dword 0B9h
        push optblock_end
        push dword [byte ebp-04h]
        call DosWriteFile
        add esp, byte 0Ch
.1:
        push dword [byte ebp-04h]
        call DosCloseFile
        add esp, byte 4
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RunExhibitionMenus                           6A675  96 PC, medium confidence
; From RunFrontEnd: loads the exhibition set-up (EXHIBIT.NDX, stats), then
; team select, the controller screen and the next screens until a game or the
; main menu
;-----------------------------------------------------------------------------
RunExhibitionMenus:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 38h, 0
        mov dword [byte ebp-04h], 0
        mov edx, 5
        call LoadExhibitionStats
        xor ebx, ebx
        mov dword [gameopts], optblock_end
        call ComputeTeamRanks
        lea eax, [byte ebp-038h]
        call MakeDirPath
        mov edx, str_EXHIBITNDX
        lea eax, [byte ebp-038h]
        call NameIndexLoad
        mov dword [byte ebp-04h], eax
.1:
        cmp dword [byte ebp-04h], byte 0
        je short .2
        mov eax, dword [byte ebp-04h]
        cmp dword [byte eax+066h], byte 0
        jle short .2
        push byte 0
        mov ecx, 2
        mov ebx, 1
        lea edx, [byte ebp-04h]
        xor eax, eax
        call PickIndexEntryScreen
        mov ebx, eax
        jmp short .3
.2:
        mov ebx, 2
.3:
        cmp ebx, byte 2
        jne short .9
.4:
        call TeamSelectScreen
        mov ebx, eax
        cmp eax, byte 3
        jne short .5
        mov eax, 2
        call RunControllerScreen
        mov ebx, eax
        jmp short .8
.5:
        cmp eax, byte 0Eh
        jne short .6
        xor eax, eax
        mov ebx, 2
        call RunRosterScreens
        jmp short .8
.6:
        cmp eax, byte 1
        jne short .8
        cmp dword [byte ebp-04h], byte 0
        je short .7
        mov eax, dword [byte ebp-04h]
        cmp dword [byte eax+066h], byte 0
        jne short .8
.7:
        xor ebx, ebx
.8:
        cmp ebx, byte 2
        je short .4
        jmp near .12
.9:
        test ebx, ebx
        je short .12
        mov ecx, 0B9h
        mov esi, optblock_end
        mov edi, SavedGameOpts
        mov ebx, 0FFFFFFFFh
        mov edx, optblock_end
        rep movsb
        mov ecx, 0B9h
        mov eax, dword [SaveFileHandle]
        call FileReadAt
        test eax, eax
        je short .10
        mov ebx, 1
        jmp short .11
.10:
        mov eax, 1
        call RunControllerScreen
        mov ebx, eax
.11:
        cmp ebx, byte 15h
        je short .12
        mov ecx, 0B9h
        mov esi, SavedGameOpts
        mov edi, optblock_end
        rep movsb
        mov eax, SaveFileHandle
        call FileClose
        mov dword [SaveFileHandle], 0FFFFFFFFh
.12:
        cmp ebx, byte 1
        je near .1
        cmp dword [byte ebp-04h], byte 0
        je short .13
        mov edx, dword [byte ebp-04h]
        mov eax, 1
        call NameIndexFree
        mov dword [byte ebp-04h], 0
.13:
        mov eax, ebx
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
