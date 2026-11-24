; Saved game state: save and load the game in progress.
bits 32
%include "hockey.inc"
%include "spa.inc"
extern JoyButtonsTable
extern InputRepeatState
extern SeasonUsers
section s_4DED8 progbits alloc exec nowrite align=1
extern awtmstruct, sflags3, awroster, UnusedStateByte, UnusedStateFlag, UnusedStateMode, pad2dev, pad1dev
extern PenBuf, iflags, curevent, collflag, curperiod, GameLoopFrames, SaveFileHandle
extern PreGameSkateOn, onetimerflag, penshotfox, penshotteam, AwayGoalsPeriod, HomeGoalsPeriod, sopathx, sopathy
extern sopathend, sopathpoint, pspathside, pspathdir, CamFollowObj, GameFrameCount, hmtmlines, hmtmplattr
extern hmtmglattr, hmtmplstats, hmtmglstats, hmtmroster, hmtmteamrec, hmtmsort, awtmlines, awtmplattr
extern awtmglattr, awtmplstats, awtmglstats, awtmroster, awtmteamrec, awtmsort, ReplayBufferTop, SeasonGameOpts
extern PlayoffTreeData, SeasonPlayoffs, SeasonDay, RosterFileHandle, PlayoffsActive, energywarn, exitgame, fadeinpending
extern FileReadAt, fodir1, fodir2, fox, foy, gameclock, gameopts, gameover
extern GetPeriodTime, gmode, gmode2, goalevent, gsp, hmroster, hmtmstruct, lastplayer
extern lasttouch, lcblink, lcboxon, lcline, LineChangeLine, LineChangeReq, replaystart, OOlist
extern optflags, passplayer, PBnum, PenCntDwn, PenCntDwn2, penshotctl, penshotlive, penshotmode
extern penshotplayer, penshotstart, penshottimer, PlList, psendcount, refhitcount, seed, sflags
extern shotongoal, shotontarget, SortCords, sprintf_, SprSort, str_05d, str_05dCsg, str_CsgDb
extern str_DB, strcat_, FileMissing, DeleteFiles, FileOpenRead, FileClose, FileWriteAt, MakeDirPath
extern LoadGameRosters, InitBenchSprites, ResetPeriodState, UnlinkJump, threat, gsumheader, gsumtail, hmplstats
extern awplstats, hmglstats, awglstats, hmglattr, awglattr, hmplattr, awplattr, awlinetab
extern hmteamrec, awteamrec, hmlinetab, AwSortCords, SeasonUserRecords, PlayoffHeader, VisTeam, passdir
extern passspeed, xc1, ltx, HomeControlSlot, AwayControlSlot, HomeSecondControlSlot, AwaySecondControlSlot, ClockFrameCount
extern refsignal, RefStep, StoppageReason, Penaltytimer, clockticks, SortPending, energywarn_aw, lcblink_aw
extern lcblinktime, lcblinktime_aw, lcsel, lcsel_aw, lcline_aw, lctimer, lctimer_aw, lcboxon_aw
extern ObjInitFrame, ObjInitAttr, ovltimer, injurystop, bannermsg, bannertimer, lldispodd, ltack
extern SavedGameMode, SavedViewMode, ovlstep, lastsfx, PuckCrossSave, puckcross
extern PeriodEventCount, GameEventFlags, AwBackupGoalieMarks, fofdata2, SavedPlayerWords, GoalSignalState, PerTimeTotal
extern LastTouchTeam, PassDistY, StoppageFlag, LastPlayerTouch, yc1
global SaveGameState, SaveGameState_7DD, LoadGameState, ReadSeasonDbHeader, ReadSeasonDbHeader_C2, ReadSeasonDbHeader_C4, ReadSeasonDbHeader_C8, ReadPlayoffDbHeader
global DeleteSeasonFiles, DeleteSeasonDb, GameEventStub
;-----------------------------------------------------------------------------
; SaveGameState                                4DED8  95 PC, medium confidence
; Writes the in-game state to the open file eax with FileWriteAt (buffer,
; length): ctl1side (4), the 17 SortCords entries (66h bytes each).
;
; Both team structs (D4h each), hmlinetab / awlinetab (30h each), then the
; game globals one by one (clock, scores, flags, PenBuf, ...); "Error Saving
; Game" (str_ErrSaveGame) on a failed write.
;
; called from demo_savegame and the in-game save
;-----------------------------------------------------------------------------
SaveGameState:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 9Ch, 0
        push eax
        sub ebp, 82h
        xor ebx, ebx
        xor esi, esi
.1:
        test ebx, ebx
        jne short .2
        cmp esi, 0AA0h
        jge short .2
        mov ecx, 82h
        mov ebx, 0FFFFFFFFh
        mov edx, esi
        mov eax, dword [byte ebp-01Eh]
        add edx, SortCords
        add esi, 0A0h
        call FileWriteAt
        mov ebx, eax
        jmp short .1
.2:
        test ebx, ebx
        jne short .3
        mov ecx, 10Ch
        mov ebx, 0FFFFFFFFh
        mov edx, hmtmstruct
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.3:
        test ebx, ebx
        jne short .4
        mov ecx, 10Ch
        mov ebx, 0FFFFFFFFh
        mov edx, awtmstruct
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.4:
        test ebx, ebx
        jne short .5
        mov ecx, 3Eh
        mov ebx, 0FFFFFFFFh
        mov edx, hmlinetab
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.5:
        test ebx, ebx
        jne short .6
        mov ecx, 3Eh
        mov ebx, 0FFFFFFFFh
        mov edx, awlinetab
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.6:
        test ebx, ebx
        jne near .9
        lea eax, [byte ebp-01Ah]
.7:
        mov dx, word [dword ebx+fofdata2]
        inc ebx
        inc ebx
        mov word [eax], dx
        inc eax
        inc eax
        cmp ebx, byte 0Ch
        jne short .7
        mov dx, word [VisTeam]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lastplayer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [passdir]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [passspeed]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [passplayer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [threat]
        xor ebx, ebx
        mov word [eax], dx
        inc eax
        inc eax
.8:
        mov dx, word [dword ebx+puckcross]
        inc ebx
        inc ebx
        mov word [eax], dx
        inc eax
        inc eax
        cmp ebx, byte 8
        jne short .8
        mov dx, word [JoyButtonsTable]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [InputRepeatState+0Ah]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lasttouch]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [LastPlayerTouch]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [StoppageFlag]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [xc1]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [yc1]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [ltx]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [foy]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [fox]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [fodir1]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [fodir2]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [sflags]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [gmode2]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [sflags3]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [HomeControlSlot]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [AwayControlSlot]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [HomeSecondControlSlot]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [AwaySecondControlSlot]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [PenCntDwn]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [ClockFrameCount]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [refsignal]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [RefStep]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [StoppageReason]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [Penaltytimer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [gsp]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [gameclock]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [clockticks]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [PreGameSkateOn]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [SortPending]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [exitgame]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [gameover]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [ovltimer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [refhitcount]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [injurystop]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [GoalSignalState]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [bannermsg]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [bannertimer]
        mov word [eax], dx
        inc eax
        inc eax
        mov edx, dword [seed]
        mov dword [eax], edx
        add eax, ebx
        mov dx, word [PBnum]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [iflags]
        mov word [eax], dx
        mov edx, dword [optflags]
        shl edx, 19h
        inc eax
        inc eax
        shr edx, 1Dh
        mov word [eax], dx
        inc eax
        inc eax
        mov dl, byte [pad1dev]
        mov byte [eax], dl
        mov dl, byte [pad2dev]
        mov byte [byte eax+01h], dl
        inc eax
        inc eax
        mov dx, word [LastTouchTeam]
        mov ecx, 80h
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [PassDistY]
        mov ebx, 0FFFFFFFFh
        mov word [eax], dx
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.9:
        test ebx, ebx
        jne near .15
        lea eax, [byte ebp-01Ah]
.10:
        mov dx, word [dword ebx+PlList]
        inc ebx
        inc ebx
        mov word [eax], dx
        inc eax
        inc eax
        cmp ebx, byte 0Ch
        jne short .10
        mov dl, byte [UnusedStateFlag]
        mov byte [eax], dl
        mov dl, byte [UnusedStateMode]
        mov byte [byte eax+01h], dl
        inc eax
        inc eax
        mov dl, byte [UnusedStateByte]
        mov byte [eax], dl
        mov dl, byte [onetimerflag]
        mov byte [byte eax+01h], dl
        inc eax
        inc eax
        mov dl, byte [collflag]
        mov byte [eax], dl
        mov dl, byte [gmode]
        mov byte [byte eax+01h], dl
        inc eax
        inc eax
        mov dx, word [energywarn]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [energywarn_aw]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcblink]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcblink_aw]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcblinktime]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcblinktime_aw]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcsel]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcsel_aw]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcline]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcline_aw]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lctimer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lctimer_aw]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcboxon]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lcboxon_aw]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [LineChangeReq]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [PeriodEventCount]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [LineChangeLine]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [GameEventFlags]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [curperiod]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lldispodd]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [ltack]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [lastsfx]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [PenCntDwn2]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [GameFrameCount]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [GameLoopFrames]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [shotongoal]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotplayer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotfox]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotteam]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotctl]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [SavedGameMode]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [AwayGoalsPeriod]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [HomeGoalsPeriod]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotmode]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotstart]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshottimer]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [shotontarget]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [penshotlive]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [psendcount]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [sopathx]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [sopathy]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [sopathend]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [sopathpoint]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [pspathside]
        mov word [eax], dx
        inc eax
        inc eax
        mov dx, word [pspathdir]
        mov word [eax], dx
        mov ebx, dword [CamFollowObj]
        inc eax
        inc eax
.11:
        cmp dword [byte ebx+0Dh], byte 0
        je short .12
        mov edx, dword [byte ebx+0Dh]
        cmp dword [byte edx+08h], byte 0Bh
        jle short .12
        mov ebx, edx
        jmp short .11
.12:
        lea edx, [byte eax+02h]
        cmp dword [byte ebx+08h], byte 63h
        jne short .13
        mov word [eax], 0FFFFh
        mov word [edx], 0FFFFh
        jmp short .14
.13:
        mov cx, word [ebx]
        mov word [eax], cx
        mov ax, word [byte ebx+04h]
        mov word [edx], ax
.14:
        mov ecx, 70h
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.15:
        test ebx, ebx
        jne short .16
        mov ecx, 42h
        mov ebx, 0FFFFFFFFh
        mov edx, PenBuf
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.16:
        test ebx, ebx
        jne short .17
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, curevent
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.17:
        test ebx, ebx
        jne short .18
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, goalevent
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.18:
        test ebx, ebx
        jne short .19
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, gsumheader
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.19:
        test ebx, ebx
        jne short .20
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, gsumtail
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
.20:
        test ebx, ebx
        jne near .23
        lea eax, [byte ebp-01Ah]
        mov dword [byte ebp+076h], ebx
        mov dword [byte ebp+07Eh], ebx
        mov dword [byte ebp+072h], eax
.21:
        test ebx, ebx
        jne short .23
        cmp dword [byte ebp+076h], byte 32h
        jge short .23
        mov eax, dword [byte ebp+07Eh]
        add eax, byte 10h
        cmp eax, 80h
        jbe short .22
        mov ecx, dword [byte ebp+07Eh]
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
        lea eax, [byte ebp-01Ah]
        mov dword [byte ebp+07Eh], 0
        mov dword [byte ebp+072h], eax
.22:
        mov eax, dword [byte ebp+076h]
        mov ecx, 19h
        cdq
        idiv ecx
        imul esi, eax, dword 190h
        mov eax, dword [byte ebp+076h]
        cdq
        idiv ecx
        mov edi, dword [byte ebp+072h]
        shl edx, 4
        add dword [byte ebp+07Eh], byte 10h
        lea esi, [dword edx+esi+hmplstats]
        add dword [byte ebp+072h], byte 10h
        inc dword [byte ebp+076h]
        movsd
        movsd
        movsd
        movsd
        jmp short .21
.23:
        test ebx, ebx
        jne near .26
        mov ecx, dword [byte ebp+072h]
        mov dword [byte ebp+07Ah], ebx
.24:
        test ebx, ebx
        jne short .26
        cmp dword [byte ebp+07Ah], byte 6
        jge short .26
        mov eax, dword [byte ebp+07Eh]
        add eax, byte 6
        cmp eax, 80h
        jbe short .25
        mov ecx, dword [byte ebp+07Eh]
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        lea ecx, [byte ebp-01Ah]
        mov dword [byte ebp+07Eh], 0
        mov ebx, eax
.25:
        mov eax, dword [byte ebp+07Ah]
        mov esi, 3
        cdq
        idiv esi
        imul esi, eax, byte 12h
        mov eax, dword [byte ebp+07Ah]
        mov edi, 3
        cdq
        idiv edi
        imul edx, byte 6
        add dword [byte ebp+07Eh], byte 6
        mov edi, ecx
        lea esi, [dword edx+esi+hmglstats]
        inc dword [byte ebp+07Ah]
        add ecx, byte 6
        movsd
        movsw
        jmp short .24
.26:
        test ebx, ebx
        jne short SaveGameState_7DD
        cmp dword [byte ebp+07Eh], byte 0
        je short SaveGameState_7DD
        mov ecx, dword [byte ebp+07Eh]
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileWriteAt
        mov ebx, eax
SaveGameState_7DD:
        mov eax, ebx
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near ReadSeasonDbHeader_C8
;-----------------------------------------------------------------------------
; LoadGameState                                4E6C3  95 PC, medium confidence
; Reads back what SaveGameState wrote, in the same order, with FileReadAt from
; file eax; "Error Loading Game" (str_ErrLoadGame) on a failed read.
;
; called from gamesave_io
;-----------------------------------------------------------------------------
LoadGameState:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 9Ch, 0
        push eax
        sub ebp, 82h
        mov dword [byte ebp+07Eh], 0
        xor ebx, ebx
        xor esi, esi
.1:
        test ebx, ebx
        jne short .2
        cmp esi, 0AA0h
        jge short .2
        inc dword [byte ebp+07Eh]
        mov ecx, 82h
        mov ebx, 0FFFFFFFFh
        mov edx, esi
        mov eax, dword [byte ebp-01Eh]
        add edx, SortCords
        add esi, 0A0h
        call FileReadAt
        mov ebx, eax
        jmp short .1
.2:
        test ebx, ebx
        jne short .3
        mov ecx, 10Ch
        mov ebx, 0FFFFFFFFh
        mov edx, hmtmstruct
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.3:
        test ebx, ebx
        jne short .4
        mov ecx, 10Ch
        mov ebx, 0FFFFFFFFh
        mov edx, awtmstruct
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.4:
        test ebx, ebx
        jne short .5
        mov ecx, 3Eh
        mov ebx, 0FFFFFFFFh
        mov edx, hmlinetab
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.5:
        test ebx, ebx
        jne short .6
        mov ecx, 3Eh
        mov ebx, 0FFFFFFFFh
        mov edx, awlinetab
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.6:
        test ebx, ebx
        jne near .9
        mov ecx, 80h
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
        test eax, eax
        jne near .9
        lea eax, [byte ebp-01Ah]
        xor edx, edx
.7:
        inc edx
        inc edx
        mov cx, word [eax]
        inc eax
        inc eax
        mov word [dword edx+fofdata2-2], cx
        cmp edx, byte 0Ch
        jne short .7
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [VisTeam], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lastplayer], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [passdir], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [passspeed], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [passplayer], dx
        mov dx, word [eax]
        mov word [threat], dx
        inc eax
        inc eax
        xor edx, edx
.8:
        inc edx
        inc edx
        mov cx, word [eax]
        inc eax
        inc eax
        mov word [dword edx+PuckCrossSave], cx
        cmp edx, byte 8
        jne short .8
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [JoyButtonsTable], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [InputRepeatState+0Ah], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lasttouch], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [LastPlayerTouch], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [StoppageFlag], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [xc1], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [yc1], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [ltx], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [foy], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [fox], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [fodir1], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [fodir2], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [sflags], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [gmode2], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [sflags3], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [HomeControlSlot], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [AwayControlSlot], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [HomeSecondControlSlot], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [AwaySecondControlSlot], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [PenCntDwn], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [ClockFrameCount], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [refsignal], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [RefStep], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [StoppageReason], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [Penaltytimer], dx
        mov dx, word [eax]
        mov word [gsp], dx
        inc eax
        inc eax
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [gameclock], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [clockticks], dx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [PreGameSkateOn], edx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [SortPending], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [exitgame], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [gameover], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [ovltimer], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [refhitcount], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [injurystop], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [GoalSignalState], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [bannermsg], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [bannertimer], dx
        mov edx, dword [eax]
        add eax, byte 8
        mov dword [seed], edx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [PBnum], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [iflags], dx
        movsx edx, word [eax]
        and edx, byte 7
        and byte [optflags], 8Fh
        shl edx, 4
        inc eax
        inc eax
        or dword [optflags], edx
        mov dl, byte [eax]
        mov byte [pad1dev], dl
        mov dl, byte [byte eax+01h]
        inc eax
        inc eax
        mov byte [pad2dev], dl
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [LastTouchTeam], dx
        mov ax, word [eax]
        mov word [PassDistY], ax
.9:
        test ebx, ebx
        jne near .11
        mov ecx, 70h
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
        test eax, eax
        jne near .11
        lea eax, [byte ebp-01Ah]
        xor edx, edx
.10:
        inc edx
        inc edx
        mov cx, word [eax]
        inc eax
        inc eax
        mov word [dword edx+AwBackupGoalieMarks], cx
        cmp edx, byte 0Ch
        jne short .10
        mov dl, byte [eax]
        mov byte [UnusedStateFlag], dl
        mov dl, byte [byte eax+01h]
        inc eax
        inc eax
        mov byte [UnusedStateMode], dl
        mov dl, byte [eax]
        mov byte [UnusedStateByte], dl
        movsx edx, byte [byte eax+01h]
        inc eax
        inc eax
        mov dword [onetimerflag], edx
        mov dl, byte [eax]
        mov byte [collflag], dl
        mov dl, byte [byte eax+01h]
        inc eax
        inc eax
        mov byte [gmode], dl
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [energywarn], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [energywarn_aw], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcblink], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcblink_aw], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcblinktime], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcblinktime_aw], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcsel], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcsel_aw], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcline], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcline_aw], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lctimer], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lctimer_aw], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcboxon], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lcboxon_aw], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [LineChangeReq], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [PeriodEventCount], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [LineChangeLine], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [GameEventFlags], dx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [curperiod], edx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [lldispodd], dx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [ltack], dx
        mov dx, word [eax]
        mov word [lastsfx], dx
        inc eax
        inc eax
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [PenCntDwn2], dx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [GameFrameCount], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [GameLoopFrames], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [shotongoal], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotplayer], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotfox], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotteam], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotctl], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [SavedGameMode], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [AwayGoalsPeriod], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [HomeGoalsPeriod], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotmode], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotstart], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshottimer], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [shotontarget], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [penshotlive], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [psendcount], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [sopathx], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [sopathy], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [sopathend], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [sopathpoint], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [pspathside], edx
        movsx edx, word [eax]
        inc eax
        inc eax
        mov dword [pspathdir], edx
        mov dx, word [eax]
        inc eax
        inc eax
        mov word [SavedViewMode], dx
        mov ax, word [eax]
        mov word [ovlstep], ax
.11:
        test ebx, ebx
        jne short .12
        mov ecx, 42h
        mov ebx, 0FFFFFFFFh
        mov edx, PenBuf
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.12:
        test ebx, ebx
        jne short .13
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, curevent
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.13:
        test ebx, ebx
        jne short .14
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, goalevent
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.14:
        test ebx, ebx
        jne short .15
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, gsumheader
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.15:
        test ebx, ebx
        jne short .16
        mov ecx, 0Bh
        mov ebx, 0FFFFFFFFh
        mov edx, gsumtail
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
.16:
        test ebx, ebx
        jne near .22
        mov dword [byte ebp+07Eh], ebx
        mov dword [byte ebp+07Ah], ebx
.17:
        test ebx, ebx
        jne near .20
        cmp dword [byte ebp+07Eh], byte 32h
        jge short .20
        cmp dword [byte ebp+07Ah], byte 0
        jne short .19
        mov dword [byte ebp+07Ah], 80h
        cmp dword [byte ebp+07Eh], byte 30h
        jl short .18
        mov dword [byte ebp+07Ah], 44h
.18:
        mov ecx, dword [byte ebp+07Ah]
        mov ebx, 0FFFFFFFFh
        lea edx, [byte ebp-01Ah]
        mov eax, dword [byte ebp-01Eh]
        call FileReadAt
        mov ebx, eax
        lea eax, [byte ebp-01Ah]
        mov dword [byte ebp+076h], eax
.19:
        mov eax, dword [byte ebp+07Eh]
        mov esi, 19h
        cdq
        idiv esi
        imul esi, eax, dword 190h
        mov eax, dword [byte ebp+07Eh]
        mov edi, 19h
        cdq
        idiv edi
        mov ecx, dword [byte ebp+076h]
        shl edx, 4
        sub dword [byte ebp+07Ah], byte 10h
        lea edi, [dword edx+esi+hmplstats]
        mov esi, ecx
        add dword [byte ebp+076h], byte 10h
        inc dword [byte ebp+07Eh]
        movsd
        movsd
        movsd
        movsd
        jmp short .17
.20:
        mov ecx, dword [byte ebp+076h]
        mov dword [byte ebp+07Eh], 0
.21:
        mov eax, dword [byte ebp+07Eh]
        mov esi, 3
        cdq
        idiv esi
        imul esi, eax, byte 12h
        mov eax, dword [byte ebp+07Eh]
        mov edi, 3
        cdq
        idiv edi
        imul edx, byte 6
        mov dword [byte ebp+072h], ecx
        lea edi, [dword edx+esi+hmglstats]
        mov esi, dword [byte ebp+072h]
        add ecx, byte 6
        inc dword [byte ebp+07Eh]
        movsd
        movsw
        cmp dword [byte ebp+07Eh], byte 6
        jl short .21
.22:
        test ebx, ebx
        jne near .37
        call GetPeriodTime
        mov word [PerTimeTotal], ax
        test byte [optflags], 70h
        je short .23
        mov eax, 1
        call LoadGameRosters
.23:
        mov dword [byte ebp+07Eh], 0
        mov eax, dword [replaystart]
        xor edx, edx
        xor esi, esi
        mov dword [ReplayBufferTop], eax
        call ResetPeriodState
        mov dword [fadeinpending], 1
        mov dword [hmtmsort], SortCords
        mov dword [hmtmplattr], hmplattr
        mov dword [hmtmglattr], hmglattr
        mov dword [hmtmlines], hmlinetab
        mov dword [hmtmplstats], hmplstats
        mov dword [hmtmglstats], hmglstats
        mov dword [hmtmroster], hmroster
        mov dword [hmtmteamrec], hmteamrec
        mov dword [awtmsort], AwSortCords
        mov dword [awtmplattr], awplattr
        mov dword [awtmglattr], awglattr
        mov dword [awtmlines], awlinetab
        mov dword [awtmplstats], awplstats
        mov dword [awtmglstats], awglstats
        mov dword [awtmroster], awroster
        mov dword [awtmteamrec], awteamrec
        mov eax, SortCords
        and byte [sflags], 0EFh
.24:
        mov ecx, dword [byte ebp+07Eh]
        mov word [dword eax+SCnum], cx
        mov cx, word [dword edx+ObjInitFrame]
        mov word [dword eax+radiusx], cx
        mov cx, word [dword edx+ObjInitAttr]
        mov word [dword eax+radiusy], cx
        mov cl, byte [byte eax+pflags]
        and cl, 40h
        movzx ecx, cl
        test ecx, ecx
        je short .25
        mov ecx, awtmstruct
        jmp short .26
.25:
        mov ecx, hmtmstruct
.26:
        mov dword [dword eax+tmptr], ecx
        mov cl, byte [byte eax+pflags]
        and cl, 40h
        movzx ecx, cl
        test ecx, ecx
        jne short .27
        mov ecx, awtmstruct
        jmp short .28
.27:
        mov ecx, hmtmstruct
.28:
        mov dword [dword eax+optmptr], ecx
        mov ecx, dword [eax]
        mov dword [dword eax+OldXpos], ecx
        mov ecx, dword [byte eax+Ypos]
        mov dword [dword eax+OldYpos], ecx
        mov ecx, dword [byte eax+Zpos]
        mov dword [dword eax+OldZpos], ecx
        movsx ecx, word [byte eax+SPA]
        mov dword [dword eax+09Ch], 0
        cmp ecx, SPAboxsit
        je short .29
        cmp ecx, SPAboxsitep
        jne short .30
.29:
        movsx ecx, word [byte eax+Xpos+2]
        cmp ecx, 0AAh
        jge short .35
.30:
        movsx ecx, word [byte eax+SPA]
        cmp ecx, SPAwallright
        je short .31
        cmp ecx, SPAgwallright
        jne short .32
.31:
        movsx ecx, word [byte eax+SPAnum]
        cmp ecx, byte 8
        jl short .35
.32:
        movsx ecx, word [byte eax+SPA]
        cmp ecx, SPAwallleft
        je short .33
        cmp ecx, SPAgwallleft
        jne short .34
.33:
        movsx ecx, word [byte eax+SPAnum]
        cmp ecx, byte 8
        jge short .35
.34:
        movsx ecx, word [byte eax+SPA]
        cmp ecx, SPAboardbackglass
        jl short .36
        cmp ecx, SPAboardfrontglass
        jg short .36
        movsx ecx, word [byte eax+SPAnum]
        cmp ecx, byte 4
        jl short .36
.35:
        mov dword [dword eax+09Ch], 1
.36:
        mov edi, dword [byte ebp+07Eh]
        mov cl, byte [byte ebp+07Eh]
        add edx, byte 12h
        inc esi
        inc esi
        add eax, 0A0h
        mov byte [dword edi+OOlist], cl
        mov ecx, dword [byte ebp+07Eh]
        inc dword [byte ebp+07Eh]
        mov word [dword esi+SavedPlayerWords], cx
        cmp dword [byte ebp+07Eh], byte 11h
        jl near .24
        call InitBenchSprites
        call SprSort
.37:
        lea eax, [byte ebp-01Eh]
        call FileClose
        mov dword [SaveFileHandle], 0FFFFFFFFh
        jmp near SaveGameState_7DD
;-----------------------------------------------------------------------------
; ReadSeasonDbHeader                              4F08B  96 PC, low confidence
; Reads the season database header
;-----------------------------------------------------------------------------
ReadSeasonDbHeader:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 3ECh, 0
        mov dword [byte ebp-04h], 0FFFFFFFFh
        mov edx, 4
        lea eax, [byte ebp-044h]
        xor ebx, ebx
        mov dword [gameopts], SeasonUserRecords
        call MakeDirPath
        push dword [PlayoffTreeData]
        push str_05d
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-010h]
        lea eax, [byte ebp-044h]
        call strcat_
        mov eax, dword [SeasonGameOpts]
        shl eax, 0Fh
        shr eax, 1Bh
        add eax, byte 41h
        push eax
        push str_CsgDb
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-010h]
        lea eax, [byte ebp-044h]
        call strcat_
        lea edx, [byte ebp-04h]
        lea eax, [byte ebp-044h]
        call FileOpenRead
        test eax, eax
        jne short ReadSeasonDbHeader_C4
        mov ecx, 3A7h
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-03ECh]
        mov eax, dword [byte ebp-04h]
        call FileReadAt
        test eax, eax
        je short .1
        lea eax, [byte ebp-04h]
        call FileClose
        mov dword [byte ebp-04h], 0FFFFFFFFh
        jmp short ReadSeasonDbHeader_C4
.1:
        mov ecx, 0B9h
        lea esi, [dword ebp-03ECh]
        mov edi, SeasonUserRecords
ReadSeasonDbHeader_C2:
        rep movsb
ReadSeasonDbHeader_C4:
        mov eax, dword [byte ebp-04h]
        leave
ReadSeasonDbHeader_C8:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ReadPlayoffDbHeader                             4F159  96 PC, low confidence
; Reads the season database header for the playoffs
;-----------------------------------------------------------------------------
ReadPlayoffDbHeader:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 78Ch, 0
        mov esi, eax
        mov dword [byte ebp-04h], 0FFFFFFFFh
        mov dword [gameopts], PlayoffHeader
        cmp dword [SeasonPlayoffs], byte 0
        je short .1
        mov edx, 4
        lea eax, [byte ebp-044h]
        xor ebx, ebx
        call MakeDirPath
        push dword [PlayoffTreeData]
        jmp short .2
.1:
        mov edx, 6
        lea eax, [byte ebp-044h]
        xor ebx, ebx
        call MakeDirPath
        push dword [RosterFileHandle]
.2:
        push str_05d
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-010h]
        lea eax, [byte ebp-044h]
        call strcat_
        add esi, byte 41h
        push esi
        push str_CsgDb
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-010h]
        lea eax, [byte ebp-044h]
        call strcat_
        cmp dword [SeasonPlayoffs], byte 0
        je short .4
        lea edx, [byte ebp-04h]
        lea eax, [byte ebp-044h]
        call FileOpenRead
        test eax, eax
        jne short .4
        mov ecx, 3A7h
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-078Ch]
        mov eax, dword [byte ebp-04h]
        call FileReadAt
        test eax, eax
        je short .3
        lea eax, [byte ebp-04h]
        call FileClose
        mov dword [byte ebp-04h], 0FFFFFFFFh
        jmp short .4
.3:
        mov ecx, 0B9h
        lea esi, [dword ebp-078Ch]
        mov edi, SeasonUserRecords
        rep movsb
.4:
        cmp dword [byte ebp-04h], byte 0FFFFFFFFh
        jne short .5
        lea edx, [byte ebp-04h]
        lea eax, [byte ebp-044h]
        call FileOpenRead
        test eax, eax
        jne near ReadSeasonDbHeader_C4
.5:
        mov ecx, 39Dh
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-03E4h]
        mov eax, dword [byte ebp-04h]
        call FileReadAt
        test eax, eax
        je short .6
        lea eax, [byte ebp-04h]
        call FileClose
        mov dword [byte ebp-04h], 0FFFFFFFFh
        jmp near ReadSeasonDbHeader_C4
.6:
        cmp dword [SeasonPlayoffs], byte 0
        jne near ReadSeasonDbHeader_C4
        mov ecx, 0B9h
        lea esi, [dword ebp-03E4h]
        mov edi, PlayoffHeader
        jmp near ReadSeasonDbHeader_C2
;-----------------------------------------------------------------------------
; DeleteSeasonFiles                               4F2A8  96 PC, low confidence
; Deletes the season's files
;-----------------------------------------------------------------------------
DeleteSeasonFiles:
        push ebx
        push edx
        enter 40h, 0
        mov edx, 4
        lea eax, [byte ebp-040h]
        xor ebx, ebx
        call MakeDirPath
        push dword [PlayoffTreeData]
        push str_05d
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-040h]
        call strcat_
        mov eax, dword [SeasonGameOpts]
        shl eax, 0Fh
        shr eax, 1Bh
        add eax, byte 41h
        push eax
        push str_CsgDb
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-040h]
        call strcat_
        lea eax, [byte ebp-040h]
        call FileMissing
        cmp eax, byte 1
        jne short .1
        mov edx, 4
        lea eax, [byte ebp-040h]
        xor ebx, ebx
        call MakeDirPath
        mov eax, dword [SeasonDay]
        add eax, byte 41h
        push eax
        push dword [PlayoffTreeData]
        push str_05dCsg
        lea eax, [byte ebp-0Ch]
        push eax
        mov ebx, str_DB
        call sprintf_
        add esp, byte 10h
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-040h]
        call DeleteFiles
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        shl edx, 0Fh
        shr edx, 1Bh
        imul edx, byte 1Ah
        mov byte [dword edx+SeasonUsers+1Ah], 0FFh
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul eax, byte 1Ah
        mov byte [dword eax+SeasonUsers+1Ah], 0FFh
.1:
        leave
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DeleteSeasonDb                                  4F385  96 PC, low confidence
; Deletes the season database file
;-----------------------------------------------------------------------------
DeleteSeasonDb:
        push ebx
        push edx
        enter 40h, 0
        cmp dword [PlayoffsActive], byte 0
        je short .1
        mov edx, 4
        lea eax, [byte ebp-040h]
        xor ebx, ebx
        call MakeDirPath
        push dword [PlayoffTreeData]
        push str_05d
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        shl edx, 0Fh
        shr edx, 1Bh
        imul edx, byte 1Ah
        mov byte [dword edx+SeasonUsers+1Ah], 0FFh
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        imul eax, byte 1Ah
        add esp, byte 0Ch
        mov byte [dword eax+SeasonUsers+1Ah], 0FFh
        jmp short .2
.1:
        mov edx, 6
        lea eax, [byte ebp-040h]
        xor ebx, ebx
        call MakeDirPath
        push dword [RosterFileHandle]
        push str_05d
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
.2:
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-040h]
        call strcat_
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        add eax, byte 41h
        push eax
        push str_CsgDb
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-040h]
        call strcat_
        lea eax, [byte ebp-040h]
        call UnlinkJump
        leave
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GameEventStub                                   4F452  96 PC, low confidence
; Game event hook that does nothing
;-----------------------------------------------------------------------------
GameEventStub:
        ret
