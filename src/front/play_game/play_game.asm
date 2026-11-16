; Playing a game: from the menus by game mode, the input record timer, the game loop, the demo game.
bits 32
%include "hockey.inc"
extern TeamRosterPtrs
extern GsOptions
section s_168DA progbits alloc exec nowrite align=1
extern _dos_gettime_, addtimer, BuildDefaultLines, textline1, textline2, textline3, textline4, textline5
extern TitleTextStyle, SeasonGameHome, SeasonGameAway, ClockTick, CrowdNoiseReset, DemoMode, DoGameFrame
extern DrawGameStats_DD0, SimSlotButtons, InputRecordIndex, GameLoopFrames, FrontShapesFile
extern gameresult, LastEventPlayer, SfxMask, InMenuOverlay, ViewScreenWidth, ViewScreenHeight, SlotInput
extern GameFrameCount, MenuRemoteCursorArt, MenuCursorPixels
extern pointerspr, MenuBitmapPixels, AttractResetFlag, PlayoffTreeData, RosterFileHandle, PlayoffsActive, exitgame, fadeinpending
extern GameLoopActive, gameopts, gameover, GetTicks, gmode, InGameMenuRequest, InitSlotTable, InputRecordBusy
extern InputRecordCount, InputRecordHead, InputRecordPhase, InputRecordRing, InputRecordTicks, LineChangeLine, LineChangeReq, LinkExchangeInput
extern LinkResyncInput, LoadGameState, NormalizeDressFlags, optblock, optblock_end, optflags, PauseReplayPending, penshotlive
extern PeriodOver, PickThreeStars, PollControllers, PostGameScreens, PullGoalie, rand_, ReadHotKeys, ResetInputSlots
extern RunInGameMenu, seed, SetupDemoGame, SetupGame, SetupTeamLines, SetViewRect, SlotButtons, str_FhiL2
extern str_FhiR2, str_GhiL, str_GhiR, str_GloL5, str_GloR5, str_PAL, strcpy_, MessageBox
extern BlankForFadeIn, LoadSeasonStats, LoadPlayoffStats, LoadExhibitionStats, LoadModemStats, FreeStatsTables, EndGameCleanup, InitGameTeams
extern UpdateUserRecords, RefreshControlSlots, CrowdReactToPlay, LoadGamePalette, InitGameView, FreeGameView, DrawGameFrame, ResetGameOverlays
extern UpdateCamera, FreeSpriteCache, LoadFrontEndArt, FreeFrontEndArt, SetScreenColors, FadeOut, CopyBitmap, SetScreenMode
extern StopMusic, QueueMusic, FadeOutMusic, PlaySfx, Crowd_Noise, SetCrowdTarget, CrowdFadeOut, ArenaClipReady
extern StartArenaClip, StopArenaClip, StartGameSound, EndGameSound, SoundIdle, WriteGlobalSet, GetLangText, RemoveTimerCallback
extern AllocMemBlock, FreeMemBlock, ClearScreenColour, FreeColourLookup, SetScreenTarget, GetPaletteRange, SetPaletteEntries, TicksSinceLast
extern FindShape, SeasonUserRecords, PlayoffHeader, ModemGameOpts, SavedGameOpts, SlotsTwoPlayer, PauseRequested
extern bannermsg, bannertimer, PeriodEventCount, GameEventFlags
global PlayGameModeJumpTable, PlayGameStatsLoadJumpTable, PlayMenuGame, PlayMenuGame_75, PlayMenuGame_85, PlayMenuGame_9F, PlayMenuGame_AF, PlayMenuGame_243
global PlayMenuGame_25F, PlayMenuGame_26B, PlayMenuGame_280, InputRecordTimer, HandleSlotButtons, HandleSlotButtons_18D, RunSimFrames, Gameloop
global GameLoop_E, GameLoop_18, GameLoop_38, GameLoop_inputcheck, GameLoop_hotkeyscall, GameLoop_hotkeyscall_5, GameLoop_menucall, GameLoop_menucall_A
global GameLoop_nextperiodcall, GameLoop_nextperiodcall_6C, GameLoop_gameovercall, RunDemoGame, PlayGame, PlayGame_initslotscall, PlayGame_menucall, PlayGame_menucall_42
PlayGameModeJumpTable:                          ; jump table for the switch cases of PlayMenuGame
        dd PlayMenuGame_75
        dd PlayMenuGame_85
        dd PlayMenuGame_9F
        dd PlayMenuGame_AF
PlayGameStatsLoadJumpTable:                     ; jump table for the switch cases of PlayMenuGame
        dd PlayMenuGame_243
        dd PlayMenuGame_25F
        dd PlayMenuGame_26B
        dd PlayMenuGame_280
;-----------------------------------------------------------------------------
; PlayMenuGame                                 168FA  96 PC, medium confidence
; Plays a game started from the menus: by game mode (optflags bits 4-6:
; exhibition, season, playoffs, modem) picks the game options block.
;
; loads the goal sprites (GloL/GloR or GhiL/GhiR), PlayGame, then saves the
; result for the mode (season / playoff update, modem end) and runs
; PostGameScreens; 12h on a modem game
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
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-018h]
        call strcpy_
        mov eax, 3
        call FadeOut
        xor edx, edx
        mov eax, 8Ch
        call FadeOutMusic
        call StopMusic
        call FreeFrontEndArt
        call FreeStatsTables
        call FreeColourLookup
        mov eax, dword [optflags]
        shl eax, 19h
        mov dword [byte ebp-04h], 0
        shr eax, 1Dh
        mov dword [AttractResetFlag], 0
        cmp eax, byte 3
        ja short PlayMenuGame_AF.2
        jmp dword [nosplit cs:eax*4+PlayGameModeJumpTable]
PlayMenuGame_75:
        xor edx, edx
        xor eax, eax
        mov dword [gameopts], optblock_end
        jmp short PlayMenuGame_AF.1
PlayMenuGame_85:
        movzx edx, byte [SeasonGameAway]
        movzx eax, byte [SeasonGameHome]
        mov dword [gameopts], SeasonUserRecords
        jmp short PlayMenuGame_AF.1
PlayMenuGame_9F:
        xor edx, edx
        xor eax, eax
        mov dword [gameopts], PlayoffHeader
        jmp short PlayMenuGame_AF.1
PlayMenuGame_AF:
        xor edx, edx
        xor eax, eax
        mov dword [gameopts], ModemGameOpts
.1:
        call InitGameTeams
.2:
        test byte [GsOptions+1], 20h
        jne short .3
        push dword [MenuCursorPixels]
        call FreeMemBlock
        add esp, byte 4
        push dword [MenuBitmapPixels]
        call FreeMemBlock
        add esp, byte 4
.3:
        call StartGameSound
        test byte [GsOptions+1], 20h
        jne short .4
        push str_GloL5
        push dword [FrontShapesFile]
        call FindShape
        add esp, byte 8
        push str_GloR5
        push dword [FrontShapesFile]
        mov dword [pointerspr], eax
        call FindShape
        mov edx, 20h
        add esp, byte 8
        mov dword [MenuRemoteCursorArt], eax
        mov eax, dword [pointerspr]
        call CopyBitmap
        mov edx, 20h
        mov dword [MenuCursorPixels], eax
        mov eax, dword [MenuRemoteCursorArt]
        call CopyBitmap
        mov dword [MenuBitmapPixels], eax
        jmp short .5
.4:
        push str_GhiL
        push dword [FrontShapesFile]
        call FindShape
        add esp, byte 8
        push str_GhiR
        push dword [FrontShapesFile]
        mov dword [pointerspr], eax
        call FindShape
        add esp, byte 8
        mov dword [MenuRemoteCursorArt], eax
.5:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        je short .6
        call WriteGlobalSet
.6:
        mov eax, esi
        call PlayGame
        push str_FhiL2
        push dword [FrontShapesFile]
        mov dword [byte ebp-08h], eax
        call FindShape
        add esp, byte 8
        push str_FhiR2
        push dword [FrontShapesFile]
        mov dword [pointerspr], eax
        call FindShape
        add esp, byte 8
        mov dword [MenuRemoteCursorArt], eax
        test byte [GsOptions+1], 20h
        jne short .7
        push dword [MenuCursorPixels]
        call FreeMemBlock
        add esp, byte 4
        push dword [MenuBitmapPixels]
        call FreeMemBlock
        add esp, byte 4
.7:
        call EndGameSound
        test byte [GsOptions+1], 20h
        jne short .8
        mov edx, 20h
        mov eax, dword [pointerspr]
        call CopyBitmap
        mov edx, 20h
        mov dword [MenuCursorPixels], eax
        mov eax, dword [MenuRemoteCursorArt]
        call CopyBitmap
        mov dword [MenuBitmapPixels], eax
.8:
        call LoadFrontEndArt
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 3
        ja short PlayMenuGame_280.10
        jmp dword [nosplit cs:eax*4+PlayGameStatsLoadJumpTable]
PlayMenuGame_243:
        test esi, esi
        jl short .9
        mov ecx, 0B9h
        mov esi, SavedGameOpts
        mov edi, optblock_end
        rep movsb
.9:
        call LoadExhibitionStats
        jmp short PlayMenuGame_280.10
PlayMenuGame_25F:
        mov eax, dword [PlayoffTreeData]
        call LoadSeasonStats
        jmp short PlayMenuGame_280.10
PlayMenuGame_26B:
        cmp dword [PlayoffsActive], byte 0
        jne short PlayMenuGame_25F
        mov eax, dword [RosterFileHandle]
        call LoadPlayoffStats
        jmp short PlayMenuGame_280.10
PlayMenuGame_280:
        call LoadModemStats
        mov dword [byte ebp-04h], 12h
.10:
        cmp dword [byte ebp-08h], byte 0
        jne near .11
        push byte 20h
        push dword 300h
        push str_PAL
        call AllocMemBlock
        add esp, byte 0Ch
        push eax
        push dword 100h
        push byte 0
        mov esi, eax
        call GetPaletteRange
        add esp, byte 0Ch
        mov eax, esi
        call SetScreenColors
        push byte 0
        call ClearScreenColour
        add esp, byte 4
        push esi
        push dword 100h
        push byte 0
        call SetPaletteEntries
        add esp, byte 0Ch
        push esi
        call FreeMemBlock
        add esp, byte 4
        push byte 3
        mov eax, dword [ViewScreenHeight]
        push byte 0
        sar eax, 1
        push eax
        mov eax, dword [ViewScreenWidth]
        sar eax, 1
        push eax
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp-0Ch]
        push byte 0
        mov eax, 3Fh
        mov edx, 1
        call GetLangText
        call MessageBox
        jmp short .12
.11:
        cmp dword [gameresult], byte 1
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
        call QueueMusic
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
        mov ax, word [SlotsTwoPlayer]
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
        mov ebx, dword [SlotInput]
        mov edx, dword [byte ebp-04h]
        mov dword [edx], ebx
        mov ebx, dword [SlotInput+7]
        mov edx, dword [byte ebp-04h]
        mov dword [byte edx+04h], ebx
        mov ebx, dword [SlotInput+0Eh]
        mov edx, dword [byte ebp-04h]
        mov dword [byte edx+08h], ebx
        mov ebx, dword [SlotInput+15h]
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
        mov dword [gameresult], 2
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
        call PlaySfx
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
        call PlaySfx
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
        mov word [PeriodEventCount], 1
        mov word [GameEventFlags], bx
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
        cmp dword [InMenuOverlay], byte 0
        jne short .1
        call HandleSlotButtons
.1:
        mov dword [SfxMask], 0
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
        add dword [GameFrameCount], byte 64h
.3:
        call ClockTick
.4:
        call DoGameFrame
        xor eax, eax
.5:
        add eax, byte 4
        and dword [dword eax+SimSlotButtons], 0FFEFFFFCh
        cmp eax, byte 10h
        jne short .5
        movsx eax, word [bannermsg]
        cmp eax, byte 0FFFFFFFFh
        je short .6
        cmp word [bannertimer], byte 0
        jle short .6
        dec word [bannertimer]
        cmp word [bannertimer], byte 0
        jg short .6
        mov word [bannertimer], 0
        mov word [bannermsg], 0FFFFh
.6:
        cmp dword [LastEventPlayer], byte 0FFFFFFFFh
        je short .7
        dec dword [LastEventPlayer]
        cmp dword [LastEventPlayer], byte 0
        jge short .7
        mov dword [LastEventPlayer], 0FFFFFFFFh
        mov byte [textline5], 0
        mov byte [textline4], 0
        mov byte [textline2], 0
        mov byte [textline1], 0
        mov byte [textline3], 0
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
        call UpdateCamera
        mov eax, edx
        call DrawGameFrame
        call ReadHotKeys
        pop edx
        ret
;-----------------------------------------------------------------------------
; Gameloop                                     17025  96 PC, medium confidence
; The game loop PlayGame runs: takes input records out of the ring, then
; draws
;-----------------------------------------------------------------------------
Gameloop:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        call TicksSinceLast
GameLoop_E:
        mov dword [GameLoopActive], 1
GameLoop_18:
        cmp word [gameover], byte 0
        jne near GameLoop_gameovercall
        cmp dword [gameresult], byte 0
        jne near GameLoop_gameovercall
        call ResetGameOverlays
GameLoop_38:
        cmp word [exitgame], byte 0
        jne near GameLoop_menucall_A
        cmp dword [gameresult], byte 0
        jne near GameLoop_menucall_A
        mov ebx, dword [GameLoopActive]
        mov dword [GameLoopActive], 0
        call SoundIdle
        mov dword [GameLoopActive], ebx
        call ArenaClipReady
        test eax, eax
        je short .1
        call StartArenaClip
.1:
        xor ebx, ebx
        xor esi, esi
GameLoop_inputcheck:
        cmp dword [InputRecordCount], byte 0
        je near .1
        cmp dword [InGameMenuRequest], byte 0
        jne near .1
        imul eax, dword [InputRecordIndex], byte 12h
        mov ecx, dword [dword eax+InputRecordRing]
        mov dword [SlotButtons], ecx
        mov ecx, dword [dword eax+InputRecordRing+4]
        mov dword [SlotButtons+4], ecx
        mov ecx, dword [dword eax+InputRecordRing+8]
        mov dword [SlotButtons+8], ecx
        mov ecx, dword [dword eax+InputRecordRing+0Ch]
        mov dword [SlotButtons+0Ch], ecx
        movsx ecx, word [dword eax+InputRecordRing+10h]
        mov eax, dword [InputRecordIndex]
        inc eax
        mov dword [byte ebp-04h], 5
        cdq
        idiv dword [byte ebp-04h]
        add ebx, ecx
        imul ecx, byte 0Ah
        mov edi, dword [GameLoopActive]
        dec dword [InputRecordCount]
        mov dword [GameLoopActive], 0
        add dword [GameLoopFrames], ecx
        mov dword [GameLoopActive], edi
        mov eax, dword [GameLoopFrames]
        mov dword [InputRecordIndex], edx
        sar eax, 4
        and dword [GameLoopFrames], byte 0Fh
        call RunSimFrames
        mov eax, ebx
        sub eax, esi
        cmp eax, byte 3
        jle near GameLoop_inputcheck
        mov ecx, dword [GameLoopActive]
        mov esi, ebx
        mov dword [GameLoopActive], 0
        call SoundIdle
        mov dword [GameLoopActive], ecx
        jmp near GameLoop_inputcheck
.1:
        call CrowdReactToPlay
        mov eax, ebx
        call Crowd_Noise
        mov ecx, dword [GameLoopActive]
        mov dword [GameLoopActive], 0
        call SoundIdle
        mov dword [GameLoopActive], ecx
        cmp dword [penshotlive], byte 0
        jne short .2
        mov eax, dword [GameFrameCount]
        mov ecx, 18h
        cdq
        idiv ecx
        mov dword [GameFrameCount], edx
.2:
        cmp dword [fadeinpending], byte 2
        jne short .3
        mov eax, 3
        mov ecx, dword [GameLoopActive]
        mov dword [GameLoopActive], 0
        call FadeOut
        mov dword [GameLoopActive], ecx
.3:
        cmp dword [InGameMenuRequest], byte 0
        jne short GameLoop_hotkeyscall_5
        mov eax, ebx
        call UpdateCamera
        mov eax, ebx
        call DrawGameFrame
GameLoop_hotkeyscall:
        call ReadHotKeys
GameLoop_hotkeyscall_5:
        cmp dword [fadeinpending], byte 0
        je short .1
        push TeamRosterPtrs+320h
        push dword 100h
        push byte 0
        call SetPaletteEntries
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
;-----------------------------------------------------------------------------
; GameLoop_menucall_A                                             1725F  96 PC
;-----------------------------------------------------------------------------
GameLoop_menucall_A:
        mov dword [GameLoopActive], 0
        cmp dword [gameresult], byte 0
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
        mov dword [gameresult], 1
.2:
        mov word [PeriodEventCount], 0
        mov word [LineChangeReq], 0
        mov dword [fadeinpending], 1
        mov word [exitgame], 0
        mov dword [GameLoopFrames], 0
        mov dword [GameFrameCount], 0
        jmp near GameLoop_E
;-----------------------------------------------------------------------------
; GameLoop_nextperiodcall_6C                                      172F7  96 PC
;-----------------------------------------------------------------------------
GameLoop_nextperiodcall_6C:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 40h
        jne near GameLoop_18
        cmp dword [gameresult], byte 2
        je near GameLoop_18
        mov dword [gameresult], 1
        jmp near GameLoop_18
;-----------------------------------------------------------------------------
; GameLoop_gameovercall                                           17324  96 PC
;-----------------------------------------------------------------------------
GameLoop_gameovercall:
        call FreeSpriteCache
        mov eax, 50h
        mov dword [GameLoopActive], 0
        call StopArenaClip
        cmp dword [gameresult], byte 1
        jne short .1
        cmp dword [DemoMode], byte 0
        jne short .1
        mov dword [InGameMenuRequest], 3
        call RunInGameMenu
        call PickThreeStars
        call UpdateUserRecords
.1:
        mov eax, 3
        call FadeOut
        mov eax, 50h
        call CrowdFadeOut
        call GetTicks
        lea esi, [byte eax+050h]
.2:
        call GetTicks
        cmp eax, esi
        jge short .3
        call SoundIdle
        jmp short .2
.3:
        call EndGameCleanup
        leave
        jmp near HandleSlotButtons_18D
;-----------------------------------------------------------------------------
; RunDemoGame                                                     1739F  96 PC
; Attract-mode demo game: seeds rand from the time, InitSlotTable, loads the
; game, starts InputRecordTimer, SetupDemoGame, Gameloop.
;
; Then stops the timer and restores the screen
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
        call BlankForFadeIn
        mov eax, TeamRosterPtrs+320h
        call LoadGamePalette
        xor eax, eax
        call SetScreenMode
        call SetScreenTarget
        call InitGameView
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
        mov dword [gameresult], 0
        call Gameloop
        jmp short .2
.1:
        mov dword [gameresult], 2
.2:
        push InputRecordTimer
        call RemoveTimerCallback
        add esp, byte 4
        call FreeGameView
        call ResetInputSlots
        mov eax, 1
        call SetScreenMode
        push dword 1E0h
        push dword 280h
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
        cmp dword [gameresult], byte 2
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
; (LoadRockMusic, LoadGameGfx, SetupGame.
;
; gameresult 2 on cancel), otherwise LoadGameState from the file, rebuilds
; lines (SetupTeamLines) and resumes; then Gameloop; in league / Play-Off mode
; a completed game (gameresult 1) deletes <league>\game.sav.
;
; called from temp_files, import_export and PlayoffModeLoop
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
        mov ax, word [SlotsTwoPlayer]
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
        mov word [PauseRequested], 0
        add dword [seed], edx
PlayGame_initslotscall:
        call InitSlotTable
        call BlankForFadeIn
        mov eax, TeamRosterPtrs+320h
        call LoadGamePalette
        test byte [GsOptions+1], 20h
        setne al
        movzx eax, al
        call SetScreenMode
        call InitGameView
        push InputRecordTimer
        mov dword [GameLoopActive], 0
        mov dword [InputRecordTicks], 0
        call addtimer
        add esp, byte 4
        call LinkResyncInput
        test esi, esi
        jl near PlayGame_menucall_42
        call RefreshControlSlots
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
        mov dword [gameresult], 0
        mov word [PauseRequested], 1
        call ResetGameOverlays
PlayGame_menucall:
        call RunInGameMenu
        cmp dword [gameresult], byte 0
        jne short .2
        mov eax, dword [optblock]
        and eax, byte 7Fh
        call SetCrowdTarget
        mov eax, 7Fh
        call Crowd_Noise
.1:
        call Gameloop
        jmp short PlayGame_menucall_42.4
.2:
        call FreeSpriteCache
        mov eax, 50h
        call CrowdFadeOut
        call EndGameCleanup
        jmp short PlayGame_menucall_42.4
PlayGame_menucall_42:
        call SetupGame
        test eax, eax
        jl short .3
        mov dword [InGameMenuRequest], 0
        mov dword [gameresult], 0
        jmp short PlayGame_menucall.1
.3:
        mov dword [gameresult], 2
.4:
        call FreeGameView
        push InputRecordTimer
        call RemoveTimerCallback
        add esp, byte 4
        call LinkResyncInput
        call ResetInputSlots
        mov eax, 1
        call SetScreenMode
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
