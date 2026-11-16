; Setting up a game: players at the start, SetupGame, SetupDemoGame, the game variables.
bits 32
%include "hockey.inc"
section s_1D6C1 progbits alloc exec nowrite align=1
extern assinsert, BuildDefaultLines, apl, curevent, Crowdlevel, CrowdNoiseReset, curperiod, GameLoopFrames
extern gameresult, GameFrameCount, InputRepeatState, SumCwdExciteLvl, energywarn, exitgame, fadeinpending
extern forceteams, fox, foy, GameLoopActive, gameopts, gameover, goalevent, gsp
extern InGameMenuRequest, introskipped, lastplayer, lcblink, lcboxon, lcline, LineChangeLine, LineChangeReq
extern optblock, passplayer, PenCntDwn, PenCntDwn2, penshotlive, penshotmode, penshotplayer, penshotstart
extern puckx, pucky, refhitcount, regd0, regd1, regd2, ResetClock, SetSPA
extern SetupTeamLines, shotongoal, shotontarget, SortCords, StartGame, StartPreGame, EmptyRoutine, TextSetColor
extern SetScreenTarget, threat, vtoa, VisTeam, passdir, passspeed, ClockFrameCount, refsignal
extern RefStep, StoppageReason, Penaltytimer, SortPending, energywarn_aw, lcblink_aw, lcblinktime, lcblinktime_aw
extern lcsel, lcsel_aw, lcline_aw, lctimer, lctimer_aw, lcboxon_aw, FaceoffDotX, puckfaceoff2_ptab
extern ovltimer, injurystop, bannertimer, PeriodEventCount, GameEventFlags, hmtmap, awtmap, regd4
extern UnusedSpeechWord, SpeechPatchNext, joysampling, UnusedCrowdWord, MaxCwdExciteLvl, NumCwdExciteLvl, UnusedCrowdWordHi, penevteam
extern UnusedEventWord
global BlankForFadeIn, PlacePlayersAtStart, SetupGame, SetupDemoGame, ResetGameVars
;-----------------------------------------------------------------------------
; BlankForFadeIn                                  1D6C1  96 PC, low confidence
; Waits for the vertical blank, clears the screen and sets fadeinpending
;-----------------------------------------------------------------------------
BlankForFadeIn:
        push ebx
        push ecx
        push edx
        call SetScreenTarget
.1:
        push dword 0FFh
        push byte 4
        call TextSetColor
        add esp, byte 8
        call EmptyRoutine
        mov dword [fadeinpending], 1
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        jmp short .1
;-----------------------------------------------------------------------------
; PlacePlayersAtStart                          1D6F0  95 PC, medium confidence
; When demoflag is 0: forceteams, puck to centre, then for the 12 skaters /
; goalies: assignment 16h (17h goalie).
;
; position from the team formation tables (apl, puckfaceoff2_ptab /
; puckfaceoff2_ptab_y, mirrored by side), facing the puck (vtoa); PlayGame
; setup calls it when gameopts bit 2 is set or no skate-out
;-----------------------------------------------------------------------------
PlacePlayersAtStart:
        push ebx
        push edx
        mov eax, dword [gameopts]
        test byte [byte eax+02h], 8
        jne near .8
        call forceteams
        mov eax, dword [pucky]
        mov word [fox], 0
        mov word [foy], 0
        mov word [eax], 0
        mov dx, word [eax]
        mov eax, dword [puckx]
        mov word [eax], dx
        mov ebx, SortCords
        mov word [regd2], 0Ch
.1:
        mov word [byte ebx+02Eh], 0FF9Ch
        mov ax, word [byte ebx+01Ah]
        mov word [regd1], ax
        cwde
        cmp eax, byte 4
        sete al
        movzx eax, al
        add eax, byte 16h
        movsx edx, ax
        mov eax, ebx
        call assinsert
        cmp word [regd1], byte 0
        jl near .7
        mov al, byte [byte ebx+044h]
        and al, 40h
        movzx eax, al
        test eax, eax
        je short .2
        mov ax, word [awtmap]
        jmp short .3
.2:
        mov ax, word [hmtmap]
.3:
        mov word [regd4], ax
        neg word [regd4]
        mov ax, word [regd4]
        add eax, 6
        shl eax, 3
        mov word [regd4], ax
        movsx edx, ax
        movsx eax, word [regd1]
        movsx ax, byte [dword edx+eax+apl]
        mov word [regd4], ax
        add eax, eax
        mov word [regd4], ax
        cwde
        mov dx, word [nosplit eax*2+FaceoffDotX]
        mov ax, word [nosplit eax*2+puckfaceoff2_ptab]
        mov word [regd0], dx
        mov word [regd1], ax
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        jne short .4
        neg word [regd0]
        neg word [regd1]
.4:
        mov ax, word [regd0]
        mov word [byte ebx+02h], ax
        mov ax, word [regd1]
        mov word [byte ebx+0Eh], 0
        mov word [byte ebx+06h], ax
        mov ax, word [byte ebx+0Eh]
        mov word [byte ebx+0Ch], ax
        mov eax, dword [pucky]
        mov ax, word [eax]
        sub ax, word [regd1]
        movsx edx, ax
        mov eax, dword [puckx]
        mov ax, word [eax]
        sub ax, word [regd0]
        cwde
        call vtoa
        mov dword [dword ebx+09Ch], 0
        mov word [byte ebx+036h], ax
        cmp word [byte ebx+01Ah], byte 0
        jne short .5
        mov word [regd1], 6DFh
        jmp short .6
.5:
        mov word [regd1], 1
.6:
        and byte [byte ebx+045h], 0FBh
        and byte [byte ebx+044h], 0DFh
        mov eax, ebx
        movsx edx, word [regd1]
        call SetSPA
.7:
        add ebx, 0A0h
        dec word [regd2]
        jne near .1
.8:
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetupGame                                    1D8A2  95 PC, medium confidence
; (from PlayGame): lines for both teams (SetupTeamLines), crowd reset,
; ResetGameVars, team intro scoreboard (DrawHudPanel Home / Visitor).
;
; StartPreGame (-1 on cancel), ResetGameVars again, palette fade-in,
; PlacePlayersAtStart
;-----------------------------------------------------------------------------
SetupGame:
        push edx
        call BuildDefaultLines
        xor eax, eax
        call SetupTeamLines
        mov eax, 1
        xor edx, edx
        call SetupTeamLines
        mov word [gsp], 0FFFFh
        mov word [Crowdlevel], 0
        mov dword [introskipped], 0
        call ResetGameVars
        xor eax, eax
        mov word [Crowdlevel], 0
        call StartPreGame
        test eax, eax
        jge short .1
        mov eax, 0FFFFFFFFh
        pop edx
        ret
.1:
        mov edx, dword [introskipped]
        test edx, edx
        je short .2
        mov dword [fadeinpending], 1
.2:
        mov word [gsp], 0
        call ResetGameVars
        mov eax, dword [gameopts]
        mov dword [introskipped], edx
        test byte [byte eax+01h], 30h
        jne short .3
        test edx, edx
        jne short .4
.3:
        call PlacePlayersAtStart
.4:
        mov eax, dword [gameopts]
        test byte [byte eax+02h], 8
        jne short .5
        cmp dword [introskipped], byte 0
        jne short .5
        mov dword [fadeinpending], 0
.5:
        xor eax, eax
        pop edx
        ret
;-----------------------------------------------------------------------------
; SetupDemoGame                                1D955  95 PC, medium confidence
; Corrected from SetupGameQuick: its only caller is RunDemoGame; SetupGame
; without the panel intro, the fade-in and PlacePlayersAtStart
;-----------------------------------------------------------------------------
SetupDemoGame:
        push edx
        call BuildDefaultLines
        xor eax, eax
        call SetupTeamLines
        mov eax, 1
        xor edx, edx
        call SetupTeamLines
        mov eax, dword [optblock]
        mov word [gsp], 0FFFFh
        and eax, byte 7Fh
        mov word [Crowdlevel], 0
        call CrowdNoiseReset
        mov dword [introskipped], 0
        call ResetGameVars
        xor eax, eax
        mov word [Crowdlevel], 0
        call StartPreGame
        test eax, eax
        jge short .1
        mov eax, 0FFFFFFFFh
        pop edx
        ret
.1:
        mov edx, dword [introskipped]
        test edx, edx
        je short .2
        mov dword [fadeinpending], 1
.2:
        mov word [gsp], 0
        call ResetGameVars
        mov eax, 5Ah
        call ResetClock
        mov eax, dword [gameopts]
        mov dword [introskipped], edx
        test byte [byte eax+02h], 8
        jne short .3
        test edx, edx
        jne short .3
        mov dword [fadeinpending], edx
.3:
        xor eax, eax
        pop edx
        ret
;-----------------------------------------------------------------------------
; ResetGameVars                                1DA02  95 PC, medium confidence
; Clears the per-game state (penalty / referee / line-change / penalty-shot
; vars, pass state, crowd excitement, input counters, exitgame / gameover.
;
; frameaccum), calls StartGame, centres the mouse when a pad uses it,
; joyq_flush
;-----------------------------------------------------------------------------
ResetGameVars:
        mov byte [curevent], 0FFh
        mov byte [goalevent], 0FFh
        mov word [ovltimer], 0FFFFh
        mov word [Penaltytimer], 0FFFFh
        mov word [RefStep], 0FFFFh
        mov word [PenCntDwn], 0FFFFh
        mov word [PenCntDwn2], 0FFFFh
        mov word [threat], 0
        mov word [passplayer], 0
        mov word [passspeed], 0
        mov word [passdir], 0
        mov word [lastplayer], 0
        mov word [VisTeam], 0
        mov word [SortPending], 0
        mov word [StoppageReason], 0
        mov word [refsignal], 0
        mov word [ClockFrameCount], 0
        mov word [lcblinktime_aw], 0
        mov word [lcblinktime], 0
        mov word [lcblink_aw], 0
        mov word [lcblink], 0
        mov word [energywarn_aw], 0
        mov word [energywarn], 0
        mov word [GameEventFlags], 0
        mov word [LineChangeLine], 0
        mov word [PeriodEventCount], 0
        mov word [LineChangeReq], 0
        mov word [lcboxon_aw], 0
        mov word [lcboxon], 0
        mov word [lctimer_aw], 0
        mov word [lctimer], 0
        mov word [lcline_aw], 0
        mov word [lcline], 0
        mov word [lcsel_aw], 0
        mov word [lcsel], 0
        mov dword [InputRepeatState+4], 0
        mov dword [InputRepeatState], 0
        mov word [bannertimer], 0
        mov word [injurystop], 0
        mov word [refhitcount], 0
        mov dword [penshotmode], 0
        mov dword [penshotlive], 0
        mov dword [penshotstart], 0
        mov dword [shotontarget], 0
        mov dword [shotongoal], 0
        mov dword [penshotplayer], 0FFFFFFFFh
        mov word [SpeechPatchNext], 0
        mov word [penevteam], 0
        mov word [UnusedEventWord], 0
        mov word [NumCwdExciteLvl], 0
        mov word [MaxCwdExciteLvl], 0
        mov word [UnusedCrowdWord], 0
        mov word [UnusedCrowdWordHi], 0
        mov dword [SumCwdExciteLvl], 0
        mov word [UnusedSpeechWord], 0FFFFh
        mov word [GameEventFlags], 0
        mov word [LineChangeLine], 0
        call StartGame
        mov dword [curperiod], 1
        mov dword [gameresult], 0
        mov dword [InGameMenuRequest], 0
        mov word [exitgame], 0
        mov word [gameover], 0
        mov dword [GameFrameCount], 0
        mov dword [GameLoopFrames], 0
        mov dword [GameLoopActive], 0
        mov word [joysampling], 0
        ret
