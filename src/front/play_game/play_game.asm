; Playing a game: from the menus by game mode, the input record timer, the game loop, the demo game (95 PC front/main, 96 PC).
bits 32
%include "hockey.inc"
section s_168DA progbits alloc exec nowrite align=1
extern _dos_gettime_, addtimer, BuildDefaultLines, byte_1655A4, byte_1655E0, byte_16561C, byte_165658, byte_165694
extern byte_17BDAE, byte_17CA5D, byte_17CECB, byte_17CECC, ClockTick, CrowdNoiseReset, DemoMode, DoGameFrame
extern DrawGameStats_DD0, dword_114B88, dword_114B90, dword_114B94, dword_114B98, dword_114B9C, dword_114F16, dword_1150D4
extern dword_1150FC, dword_11B310, dword_11D3A6, dword_11D91F, dword_11F5C0, dword_11F5C4, dword_1515B7, dword_1515BE
extern dword_1515C5, dword_1515CC, dword_1515D8, dword_1515DC, dword_1515E0, dword_151B84, dword_152F50, dword_152F54
extern dword_152F58, dword_152F5C, dword_157AF4, dword_17CBE7, dword_17D162, dword_17D267, exitgame, fadeinpending
extern GameLoopActive, gameopts, gameover, GetTicks, gmode, InGameMenuRequest, InitSlotTable, InputRecordBusy
extern InputRecordCount, InputRecordHead, InputRecordPhase, InputRecordRing, InputRecordTicks, LineChangeLine, LineChangeReq, LinkExchangeInput
extern LinkResyncInput, LoadGameState, NormalizeDressFlags, optblock, optblock_end, optflags, PauseReplayPending, penshotlive
extern PeriodOver, PickThreeStars, PollControllers, PostGameScreens, PullGoalie, rand_, ReadHotKeys, ResetInputSlots
extern RunInGameMenu, seed, SetupDemoGame, SetupGame, SetupTeamLines, SetViewRect, SlotButtons, str_FhiL2
extern str_FhiR2, str_GhiL, str_GhiR, str_GloL5, str_GloR5, str_PAL, strcpy_, sub_1A109
extern sub_1D6C1, sub_1EA14, sub_1EBBC, sub_1ECDB, sub_1EE7C, sub_1EFFF, sub_1F300, sub_1F771
extern sub_2B4B9, sub_3A6F3, sub_4B59F, sub_5358E, sub_58A58, sub_59188, sub_5A572, sub_5AF42
extern sub_612BC, sub_62311, sub_625F7, sub_62ED9, sub_62F90, sub_63A5B, sub_63B0C, sub_63DC4
extern sub_689D1, sub_68A10, sub_68C33, sub_68E31, sub_68E72, sub_68F82, sub_6904C, sub_692E9
extern sub_69312, sub_6934E, sub_695CB, sub_6986B, sub_69A9B, sub_6A5EB, sub_77355, sub_AA664
extern sub_AB758, sub_ABF4C, sub_ADA50, sub_B0CA8, sub_DD6C4, sub_DD6E0, sub_DD7B8, sub_DFEC6
extern sub_E04E0, unk_16443C, unk_17CB2E, unk_17CED5, unk_17D272, unk_17D32C, word_114CE0, word_114F14
extern word_119111, word_119113, word_1515E4, word_1656D2, word_1656D6
global jpt_168DA, jpt_168EA, PlayMenuGame, PlayMenuGame_75, PlayMenuGame_85, PlayMenuGame_9F, PlayMenuGame_AF, PlayMenuGame_243
global PlayMenuGame_25F, PlayMenuGame_26B, PlayMenuGame_280, InputRecordTimer, HandleSlotButtons, HandleSlotButtons_18D, RunSimFrames, GameLoop
global GameLoop_E, GameLoop_18, GameLoop_38, GameLoop_inputcheck, GameLoop_hotkeyscall, GameLoop_hotkeyscall_5, GameLoop_menucall, GameLoop_menucall_A
global GameLoop_nextperiodcall, GameLoop_nextperiodcall_6C, GameLoop_gameovercall, RunDemoGame, PlayGame, PlayGame_initslotscall, PlayGame_menucall, PlayGame_menucall_42
jpt_168DA:
        dd PlayMenuGame_75
        dd PlayMenuGame_85
        dd PlayMenuGame_9F
        dd PlayMenuGame_AF
jpt_168EA:
        dd PlayMenuGame_243
        dd PlayMenuGame_25F
        dd PlayMenuGame_26B
        dd PlayMenuGame_280
;-----------------------------------------------------------------------------
; PlayMenuGame                                 168FA  96 PC, medium confidence
; Plays a game started from the menus: by game mode (optflags bits 4-6:
; exhibition, season, playoffs, modem) picks the game options block, loads
; the goal sprites (GloL/GloR or GhiL/GhiR), PlayGame, then saves the result
; for the mode (season / playoff update, modem end) and runs PostGameScreens;
; 12h on a modem game
;-----------------------------------------------------------------------------
PlayMenuGame:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 18h, 0
        mov esi, eax
        lea eax, [byte ebp-018h]
        mov dword [byte ebp-0Ch], eax
        xor eax, eax
        call sub_77355
        mov edx, eax
        lea eax, [byte ebp-018h]
        call strcpy_
        mov eax, 3
        call sub_63A5B
        xor edx, edx
        mov eax, 8Ch
        call sub_68C33
        call sub_689D1
        call sub_62ED9
        call sub_1EFFF
        call sub_B0CA8
        mov eax, dword [optflags]
        shl eax, 19h
        mov dword [byte ebp-04h], 0
        shr eax, 1Dh
        mov dword [dword_157AF4], 0
        cmp eax, byte 3
        ja short PlayMenuGame_AF.2
        jmp dword [nosplit cs:eax*4+jpt_168DA]
PlayMenuGame_75:
        xor edx, edx
        xor eax, eax
        mov dword [gameopts], optblock_end
        jmp short PlayMenuGame_AF.1
PlayMenuGame_85:
        movzx edx, byte [byte_17CECC]
        movzx eax, byte [byte_17CECB]
        mov dword [gameopts], unk_17CB2E
        jmp short PlayMenuGame_AF.1
PlayMenuGame_9F:
        xor edx, edx
        xor eax, eax
        mov dword [gameopts], unk_17CED5
        jmp short PlayMenuGame_AF.1
PlayMenuGame_AF:
        xor edx, edx
        xor eax, eax
        mov dword [gameopts], unk_17D272
.1:
        call sub_1F771
.2:
        test byte [byte_17CA5D], 20h
        jne short .3
        push dword [dword_152F54]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_152F5C]
        call sub_ABF4C
        add esp, byte 4
.3:
        call sub_695CB
        test byte [byte_17CA5D], 20h
        jne short .4
        push str_GloL5
        push dword [dword_1150D4]
        call sub_E04E0
        add esp, byte 8
        push str_GloR5
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
        jmp short .5
.4:
        push str_GhiL
        push dword [dword_1150D4]
        call sub_E04E0
        add esp, byte 8
        push str_GhiR
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call sub_E04E0
        add esp, byte 8
        mov dword [dword_152F50], eax
.5:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        je short .6
        call sub_6A5EB
.6:
        mov eax, esi
        call PlayGame
        push str_FhiL2
        push dword [dword_1150D4]
        mov dword [byte ebp-08h], eax
        call sub_E04E0
        add esp, byte 8
        push str_FhiR2
        push dword [dword_1150D4]
        mov dword [dword_152F58], eax
        call sub_E04E0
        add esp, byte 8
        mov dword [dword_152F50], eax
        test byte [byte_17CA5D], 20h
        jne short .7
        push dword [dword_152F54]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_152F5C]
        call sub_ABF4C
        add esp, byte 4
.7:
        call sub_6986B
        test byte [byte_17CA5D], 20h
        jne short .8
        mov edx, 20h
        mov eax, dword [dword_152F58]
        call sub_63B0C
        mov edx, 20h
        mov dword [dword_152F54], eax
        mov eax, dword [dword_152F50]
        call sub_63B0C
        mov dword [dword_152F5C], eax
.8:
        call sub_625F7
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 3
        ja short PlayMenuGame_280.10
        jmp dword [nosplit cs:eax*4+jpt_168EA]
PlayMenuGame_243:
        test esi, esi
        jl short .9
        mov ecx, 0B9h
        mov esi, unk_17D32C
        mov edi, optblock_end
        rep movsb
.9:
        call sub_1ECDB
        jmp short PlayMenuGame_280.10
PlayMenuGame_25F:
        mov eax, dword [dword_17CBE7]
        call sub_1EA14
        jmp short PlayMenuGame_280.10
PlayMenuGame_26B:
        cmp dword [dword_17D267], byte 0
        jne short PlayMenuGame_25F
        mov eax, dword [dword_17D162]
        call sub_1EBBC
        jmp short PlayMenuGame_280.10
PlayMenuGame_280:
        call sub_1EE7C
        mov dword [byte ebp-04h], 12h
.10:
        cmp dword [byte ebp-08h], byte 0
        jne near .11
        push byte 20h
        push dword 300h
        push str_PAL
        call sub_AB758
        add esp, byte 0Ch
        push eax
        push dword 100h
        push byte 0
        mov esi, eax
        call sub_DD6E0
        add esp, byte 0Ch
        mov eax, esi
        call sub_62F90
        push byte 0
        call sub_ADA50
        add esp, byte 4
        push esi
        push dword 100h
        push byte 0
        call sub_DD7B8
        add esp, byte 0Ch
        push esi
        call sub_ABF4C
        add esp, byte 4
        push byte 3
        mov eax, dword [dword_11F5C4]
        push byte 0
        sar eax, 1
        push eax
        mov eax, dword [dword_11F5C0]
        sar eax, 1
        push eax
        mov ecx, byte_17BDAE
        lea ebx, [byte ebp-0Ch]
        push byte 0
        mov eax, 3Fh
        mov edx, 1
        call sub_77355
        call sub_1A109
        jmp short .12
.11:
        cmp dword [dword_1150FC], byte 1
        jne short .12
        call PostGameScreens
.12:
        call rand_
        mov ebx, 32h
        cdq
        idiv ebx
        cmp edx, byte 19h
        jle short .13
        mov eax, 41h
        jmp short .14
.13:
        mov eax, 42h
.14:
        call sub_68A10
        mov eax, dword [byte ebp-04h]
        jmp near DrawGameStats_DD0
;-----------------------------------------------------------------------------
; InputRecordTimer                                                16C4D  96 PC
; Timer callback; every 4th tick pushes 0x12-byte record (4 slot dwords +
; ticks) into ring of 5
;-----------------------------------------------------------------------------
InputRecordTimer:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        sub esp, 4
        cmp word [InputRecordBusy], byte 0
        jne near .9
        mov word [InputRecordBusy], 1
        cmp dword [InputRecordPhase], byte 0
        jne short .1
        call PollControllers
.1:
        mov ax, word [word_114CE0]
        and eax, 1
        cwde
        test eax, eax
        je short .2
        mov eax, dword [InputRecordPhase]
        call LinkExchangeInput
        jmp near .6
.2:
        cmp dword [GameLoopActive], byte 1
        jne near .6
        cmp dword [InputRecordTicks], 3E8h
        jge short .3
        inc dword [InputRecordTicks]
.3:
        cmp dword [InputRecordPhase], byte 0
        jne short .4
        cmp dword [InputRecordCount], byte 5
        jl short .5
.4:
        jmp short .6
.5:
        imul edx, dword [InputRecordHead], byte 12h
        mov ebx, InputRecordRing
        add ebx, edx
        mov dword [byte ebp-04h], ebx
        mov edx, dword [InputRecordHead]
        inc edx
        mov ebx, 5
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [InputRecordHead], edx
        inc dword [InputRecordCount]
        mov ebx, dword [dword_1515B7]
        mov edx, dword [byte ebp-04h]
        mov dword [edx], ebx
        mov ebx, dword [dword_1515BE]
        mov edx, dword [byte ebp-04h]
        mov dword [byte edx+04h], ebx
        mov ebx, dword [dword_1515C5]
        mov edx, dword [byte ebp-04h]
        mov dword [byte edx+08h], ebx
        mov ebx, dword [dword_1515CC]
        mov edx, dword [byte ebp-04h]
        mov dword [byte edx+0Ch], ebx
        mov bx, word [InputRecordTicks]
        mov edx, dword [byte ebp-04h]
        mov word [byte edx+010h], bx
        mov dword [InputRecordTicks], 0
.6:
        cmp dword [InputRecordPhase], byte 0
        jne short .7
        mov dword [InputRecordPhase], 3
        jmp short .8
.7:
        dec dword [InputRecordPhase]
.8:
        mov word [InputRecordBusy], 0
.9:
        mov esp, ebp
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; HandleSlotButtons                                               16D76  96 PC
; Reads the 4 slot dwords; bit0 pause, bit1 replay, bits10-13/14-17 line
; change per team, bits18/19 goalie pull
;-----------------------------------------------------------------------------
HandleSlotButtons:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        xor esi, esi
        xor edi, edi
        xor ecx, ecx
.1:
        mov edx, dword [dword ecx+SlotButtons]
        cmp dword [DemoMode], byte 0
        je short .2
        test edx, edx
        je short .2
        mov dword [InGameMenuRequest], 1
        mov dword [dword_1150FC], 2
        jmp near HandleSlotButtons_18D
.2:
        test dl, 1
        je short .3
        or byte [PauseReplayPending], 1
        jmp near .18
.3:
        test dl, 2
        je short .4
        or byte [PauseReplayPending], 2
        jmp near .18
.4:
        mov ax, word [PauseReplayPending]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .5
        mov eax, 34h
        and byte [PauseReplayPending], 0FEh
        call sub_68E31
        mov dword [InGameMenuRequest], 1
        jmp near .18
.5:
        mov ax, word [PauseReplayPending]
        xor ah, ah
        and al, 2
        cwde
        test eax, eax
        je short .6
        mov eax, 34h
        and byte [PauseReplayPending], 0FDh
        call sub_68E31
        mov dword [InGameMenuRequest], 2
        jmp near .18
.6:
        test edx, 0FFF03h
        je near .18
        test dh, 3Ch
        je short .11
        test dh, 4
        je short .7
        xor ebx, ebx
        jmp short .10
.7:
        test dh, 8
        je short .8
        mov ebx, 1
        jmp short .10
.8:
        test dh, 10h
        je short .9
        mov ebx, 2
        jmp short .10
.9:
        test dh, 20h
        je short .10
        mov ebx, 3
.10:
        mov word [LineChangeReq], 1
        mov word [LineChangeLine], bx
.11:
        test edx, 3C000h
        je short .16
        test dh, 40h
        je short .12
        xor ebx, ebx
        jmp short .15
.12:
        test dh, 80h
        je short .13
        mov ebx, 1
        jmp short .15
.13:
        test edx, 10000h
        je short .14
        mov ebx, 2
        jmp short .15
.14:
        test edx, 20000h
        je short .15
        mov ebx, 3
.15:
        mov word [word_1656D2], 1
        mov word [word_1656D6], bx
.16:
        test edx, 40000h
        je short .17
        test di, di
        jne short .17
        xor eax, eax
        mov edi, 1
        call PullGoalie
.17:
        test edx, 80000h
        je short .18
        test si, si
        jne short .18
        mov eax, 1
        mov esi, 1
        call PullGoalie
.18:
        add ecx, byte 4
        cmp ecx, byte 10h
        jl near .1
HandleSlotButtons_18D:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RunSimFrames                                 16F09  96 PC, medium confidence
; Runs n sim frames after HandleSlotButtons; stops on menu request
;-----------------------------------------------------------------------------
RunSimFrames:
        push ebx
        push edx
        mov ebx, eax
        cmp dword [dword_11D91F], byte 0
        jne short .1
        call HandleSlotButtons
.1:
        mov dword [dword_11D3A6], 0
        xor edx, edx
        jmp near .8
.2:
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne short .4
        cmp dword [penshotlive], byte 0
        jne short .3
        add dword [dword_151B84], byte 64h
.3:
        call ClockTick
.4:
        call DoGameFrame
        xor eax, eax
.5:
        add eax, byte 4
        and dword [dword eax+dword_114B88], 0FFEFFFFCh
        cmp eax, byte 10h
        jne short .5
        movsx eax, word [word_119111]
        cmp eax, byte 0FFFFFFFFh
        je short .6
        cmp word [word_119113], byte 0
        jle short .6
        dec word [word_119113]
        cmp word [word_119113], byte 0
        jg short .6
        mov word [word_119113], 0
        mov word [word_119111], 0FFFFh
.6:
        cmp dword [dword_11B310], byte 0FFFFFFFFh
        je short .7
        dec dword [dword_11B310]
        cmp dword [dword_11B310], byte 0
        jge short .7
        mov dword [dword_11B310], 0FFFFFFFFh
        mov byte [byte_165694], 0
        mov byte [byte_165658], 0
        mov byte [byte_1655E0], 0
        mov byte [byte_1655A4], 0
        mov byte [byte_16561C], 0
.7:
        cmp dword [InGameMenuRequest], byte 0
        jne short .9
        cmp word [exitgame], byte 0
        jne short .9
        cmp word [gameover], byte 0
        jne short .9
        inc edx
.8:
        cmp edx, ebx
        jl near .2
.9:
        pop edx
        pop ebx
        ret
        push edx
        mov edx, eax
        call sub_612BC
        mov eax, edx
        call sub_5A572
        call ReadHotKeys
        pop edx
        ret
;-----------------------------------------------------------------------------
; GameLoop                                     17025  96 PC, medium confidence
; The game loop PlayGame runs: takes input records out of the ring, then
; draws
;-----------------------------------------------------------------------------
GameLoop:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        call sub_DFEC6
GameLoop_E:
        mov dword [GameLoopActive], 1
GameLoop_18:
        cmp word [gameover], byte 0
        jne near GameLoop_gameovercall
        cmp dword [dword_1150FC], byte 0
        jne near GameLoop_gameovercall
        call sub_5AF42
GameLoop_38:
        cmp word [exitgame], byte 0
        jne near GameLoop_menucall_A
        cmp dword [dword_1150FC], byte 0
        jne near GameLoop_menucall_A
        mov ebx, dword [GameLoopActive]
        mov dword [GameLoopActive], 0
        call sub_69A9B
        mov dword [GameLoopActive], ebx
        call sub_692E9
        test eax, eax
        je short .1
        call sub_69312
.1:
        xor ebx, ebx
        xor esi, esi
GameLoop_inputcheck:
        cmp dword [InputRecordCount], byte 0
        je near .1
        cmp dword [InGameMenuRequest], byte 0
        jne near .1
        imul eax, dword [dword_114B9C], byte 12h
        mov ecx, dword [dword eax+InputRecordRing]
        mov dword [SlotButtons], ecx
        mov ecx, dword [dword eax+dword_1515D8]
        mov dword [dword_114B90], ecx
        mov ecx, dword [dword eax+dword_1515DC]
        mov dword [dword_114B94], ecx
        mov ecx, dword [dword eax+dword_1515E0]
        mov dword [dword_114B98], ecx
        movsx ecx, word [dword eax+word_1515E4]
        mov eax, dword [dword_114B9C]
        inc eax
        mov dword [byte ebp-04h], 5
        cdq
        idiv dword [byte ebp-04h]
        add ebx, ecx
        imul ecx, byte 0Ah
        mov edi, dword [GameLoopActive]
        dec dword [InputRecordCount]
        mov dword [GameLoopActive], 0
        add dword [dword_114F16], ecx
        mov dword [GameLoopActive], edi
        mov eax, dword [dword_114F16]
        mov dword [dword_114B9C], edx
        sar eax, 4
        and dword [dword_114F16], byte 0Fh
        call RunSimFrames
        mov eax, ebx
        sub eax, esi
        cmp eax, byte 3
        jle near GameLoop_inputcheck
        mov ecx, dword [GameLoopActive]
        mov esi, ebx
        mov dword [GameLoopActive], 0
        call sub_69A9B
        mov dword [GameLoopActive], ecx
        jmp near GameLoop_inputcheck
.1:
        call sub_4B59F
        mov eax, ebx
        call sub_68E72
        mov ecx, dword [GameLoopActive]
        mov dword [GameLoopActive], 0
        call sub_69A9B
        mov dword [GameLoopActive], ecx
        cmp dword [penshotlive], byte 0
        jne short .2
        mov eax, dword [dword_151B84]
        mov ecx, 18h
        cdq
        idiv ecx
        mov dword [dword_151B84], edx
.2:
        cmp dword [fadeinpending], byte 2
        jne short .3
        mov eax, 3
        mov ecx, dword [GameLoopActive]
        mov dword [GameLoopActive], 0
        call sub_63A5B
        mov dword [GameLoopActive], ecx
.3:
        cmp dword [InGameMenuRequest], byte 0
        jne short GameLoop_hotkeyscall_5
        mov eax, ebx
        call sub_612BC
        mov eax, ebx
        call sub_5A572
GameLoop_hotkeyscall:
        call ReadHotKeys
GameLoop_hotkeyscall_5:
        cmp dword [fadeinpending], byte 0
        je short .1
        push unk_16443C
        push dword 100h
        push byte 0
        call sub_DD7B8
        mov dword [fadeinpending], 0
        add esp, byte 0Ch
.1:
        cmp dword [InGameMenuRequest], byte 0
        je near GameLoop_38
        cmp word [exitgame], byte 0
        jne near GameLoop_38
        cmp dword [DemoMode], byte 0
        jne near GameLoop_38
GameLoop_menucall:
        call RunInGameMenu
        jmp near GameLoop_38
GameLoop_menucall_A:
        mov dword [GameLoopActive], 0
        cmp dword [dword_1150FC], byte 0
        jne near GameLoop_nextperiodcall_6C
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 40h
        setne al
        movzx eax, al
        test eax, eax
        je short GameLoop_nextperiodcall_6C
GameLoop_nextperiodcall:
        call PeriodOver
        cmp word [gameover], byte 0
        jne short .1
        cmp dword [InGameMenuRequest], byte 0
        je short .1
        mov dword [InGameMenuRequest], 3
        jmp short .2
.1:
        mov dword [dword_1150FC], 1
.2:
        mov word [word_1656D2], 0
        mov word [LineChangeReq], 0
        mov dword [fadeinpending], 1
        mov word [exitgame], 0
        mov dword [dword_114F16], 0
        mov dword [dword_151B84], 0
        jmp near GameLoop_E
GameLoop_nextperiodcall_6C:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 40h
        jne near GameLoop_18
        cmp dword [dword_1150FC], byte 2
        je near GameLoop_18
        mov dword [dword_1150FC], 1
        jmp near GameLoop_18
GameLoop_gameovercall:
        call sub_62311
        mov eax, 50h
        mov dword [GameLoopActive], 0
        call sub_6934E
        cmp dword [dword_1150FC], byte 1
        jne short .1
        cmp dword [DemoMode], byte 0
        jne short .1
        mov dword [InGameMenuRequest], 3
        call RunInGameMenu
        call PickThreeStars
        call sub_2B4B9
.1:
        mov eax, 3
        call sub_63A5B
        mov eax, 50h
        call sub_6904C
        call GetTicks
        lea esi, [byte eax+050h]
.2:
        call GetTicks
        cmp eax, esi
        jge short .3
        call sub_69A9B
        jmp short .2
.3:
        call sub_1F300
        leave
        jmp near HandleSlotButtons_18D
;-----------------------------------------------------------------------------
; RunDemoGame                                                     1739F  96 PC
; Attract-mode demo game: seeds rand from the time, InitSlotTable, loads the
; game, starts InputRecordTimer, SetupDemoGame, GameLoop, then stops the
; timer and restores the screen; same job as 95 PC RunDemoGame
;-----------------------------------------------------------------------------
RunDemoGame:
        push ebx
        push ecx
        push edx
        enter 4, 0
        lea eax, [byte ebp-04h]
        call _dos_gettime_
        movzx eax, byte [byte ebp-03h]
        movzx edx, byte [byte ebp-04h]
        imul eax, edx
        movzx edx, byte [byte ebp-02h]
        imul edx, eax
        movzx eax, byte [byte ebp-01h]
        imul edx, eax
        mov dword [seed], edx
        call InitSlotTable
        call sub_1D6C1
        mov eax, unk_16443C
        call sub_5358E
        xor eax, eax
        call sub_63DC4
        call sub_DD6C4
        call sub_58A58
        push InputRecordTimer
        mov dword [GameLoopActive], 0
        mov dword [InputRecordTicks], 0
        call addtimer
        add esp, byte 4
        mov dword [GameLoopActive], 1
        call SetupDemoGame
        test eax, eax
        jl short .1
        mov dword [InGameMenuRequest], 0
        mov dword [dword_1150FC], 0
        call GameLoop
        jmp short .2
.1:
        mov dword [dword_1150FC], 2
.2:
        push InputRecordTimer
        call sub_AA664
        add esp, byte 4
        call sub_59188
        call ResetInputSlots
        mov eax, 1
        call sub_63DC4
        push dword 1E0h
        push dword 280h
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
        cmp dword [dword_1150FC], byte 2
        sete al
        movzx eax, al
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PlayGame                                     17494  95 PC, medium confidence
; (&savefile): without an open saved game runs the pre-game screens
; (LoadRockMusic, LoadGameGfx, SetupGame; gameresult 2 on cancel), otherwise
; LoadGameState from the file, rebuilds lines (SetupTeamLines) and resumes;
; then GameLoop; in league / Play-Off mode a completed game (gameresult 1)
; deletes <league>\game.sav; called from temp_files, import_export and
; PlayoffModeLoop
;-----------------------------------------------------------------------------
PlayGame:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        test eax, eax
        jl short .1
        call LoadGameState
        test eax, eax
        je short PlayGame_initslotscall
        xor eax, eax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .2
        mov dword [seed], 0ABCD4321h
        jmp short .3
.2:
        call rand_
        add dword [seed], eax
.3:
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        shl edx, 0Fh
        mov eax, dword [byte eax+01h]
        shr edx, 1Bh
        shl eax, 0Ah
        shl edx, 10h
        shr eax, 1Bh
        add edx, eax
        mov word [word_114F14], 0
        add dword [seed], edx
PlayGame_initslotscall:
        call InitSlotTable
        call sub_1D6C1
        mov eax, unk_16443C
        call sub_5358E
        test byte [byte_17CA5D], 20h
        setne al
        movzx eax, al
        call sub_63DC4
        call sub_58A58
        push InputRecordTimer
        mov dword [GameLoopActive], 0
        mov dword [InputRecordTicks], 0
        call addtimer
        add esp, byte 4
        call LinkResyncInput
        test esi, esi
        jl near PlayGame_menucall_42
        call sub_3A6F3
        call BuildDefaultLines
        call NormalizeDressFlags
        xor eax, eax
        call SetupTeamLines
        mov eax, 1
        call SetupTeamLines
        mov eax, dword [optblock]
        and eax, byte 7Fh
        call CrowdNoiseReset
        mov eax, dword [gameopts]
        mov al, byte [eax]
        shl al, 7
        sar al, 7
        test al, al
        je short .1
        mov dword [InGameMenuRequest], 3
        jmp short .2
.1:
        mov dword [InGameMenuRequest], 1
.2:
        mov dword [dword_1150FC], 0
        mov word [word_114F14], 1
        call sub_5AF42
PlayGame_menucall:
        call RunInGameMenu
        cmp dword [dword_1150FC], byte 0
        jne short .2
        mov eax, dword [optblock]
        and eax, byte 7Fh
        call sub_68F82
        mov eax, 7Fh
        call sub_68E72
.1:
        call GameLoop
        jmp short PlayGame_menucall_42.4
.2:
        call sub_62311
        mov eax, 50h
        call sub_6904C
        call sub_1F300
        jmp short PlayGame_menucall_42.4
PlayGame_menucall_42:
        call SetupGame
        test eax, eax
        jl short .3
        mov dword [InGameMenuRequest], 0
        mov dword [dword_1150FC], 0
        jmp short PlayGame_menucall.1
.3:
        mov dword [dword_1150FC], 2
.4:
        call sub_59188
        push InputRecordTimer
        call sub_AA664
        add esp, byte 4
        call LinkResyncInput
        call ResetInputSlots
        mov eax, 1
        call sub_63DC4
        push dword 1E0h
        push dword 280h
        push byte 0
        push byte 0
        call SetViewRect
        mov eax, 1
        add esp, byte 10h
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
