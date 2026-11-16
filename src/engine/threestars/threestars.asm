; Pre-game intro skate and the three stars (95 PC engine/intro, 94G hockey94).
bits 32
%include "hockey.inc"
extern hmglstats
extern TeamRosterPtrs
extern GsOptions
section s_2D9D9 progbits alloc exec nowrite align=1
extern assinsert, assreplace, awfirstslot, awslotcount, awtmstruct, starskatermin, stargoaliemin
extern textline1, textline2, textline3, textline4, textline5, CloseTextOverlay
extern crowdlevel, CrowdNoiseReset, curperiod, DoGameFrame, InputRecordIndex
extern GameLoopFrames, gameresult, PreGameSkateOn, ZonesDirty, LastEventPlayer, ViewScreenWidth, ViewScreenHeight
extern PanelShadeArt, gwgteam, gwgplayer, DrawFrameCount
extern NameFont, NamePanelBmp, OverlayBmp, CamShotKeys, energywarn, exitgame, fadeinpending, forcepldata
extern fox, foy, GameLoopActive, gameopts, GetTicks, hmfirstslot, hmroster, hmslotcount
extern hmtmstruct, InGameMenuRequest, InputRecordCount, InputRecordRing, IsCupClinched, lasttouch, lcblink, lineuptime
extern PtrPuckFlags, PtrPuckObject, TeamCityNames, TeamFullNames, TeamNicknames, optblock, puckc, qsort_
extern randomd0, reenergizeteam, regd0, regd1, regd2, resetplstuff, RunSimFrames, SetClipWindow
extern setpersonel, SetSPA, sflags, sfx, skateto, SkateToSpot, SlotButtons, SortCords
extern sprintf_, SprSort, str_fmt2d, str_MightyDucks, str_OfAnaheim, LinkResyncInput, LoadTeamLogo, EndGameCleanup
extern AnimateBenchSprite, CrowdReactToPlay, AddZone, DrawGameFrame, GetPeriodText, SetCameraShot, EndCameraShot, UpdateCamera
extern FreeSpriteCache, FadePalette, FadeOut, SetTextColors, DrawColorText, DrawColorTextRight, DrawColorTextCentred, DrawBox
extern Crowd_Noise, CrowdFadeOut, CrowdReaction, PlayArenaClip, ArenaClipReady, StartArenaClip, StopArenaClip, SoundIdle
extern GetLangText, DrawRectOutline, TextSetColor, SetAaPalLut, DrawArtAaScaledInt, FillRectColor, SetPaletteEntries, SetRemapTable
extern TicksSinceLast, bcopy, FillPolygonArgs, RemapPolygonArgs, TextSetFont, str_C_DrawOverlayPanels, str_Punct_DrawOverlayPanels, StarPanelOffsets
extern str_V_DrawOverlayPanels, hmplstats, hmplattr, AwSortCords, PreGameSkatePaths, BenchSpriteCount, OverlayRemap
extern updateanim, vtoa, camx, camy, xc1, HomeControlSlot, RefStep, energywarn_aw
extern lcblink_aw, CupShown, IntroStandSpots, TeamJerseyStyle
extern hmscore, hmtmtouch1, hmtmpdst, awscore, StarPoints
extern starpl, yc1
global RunPreGameSkate, RunPreGameSkate_450, RunPreGameSkate_451, RunLineupLoop, LineupLoopFrame, FillPanelEdge, FillPanelEdge_5C, DrawPanelBorder
global DrawPanelShade, DrawOverlayPanels, StartPreGame, assintrostand, assintroline, AddStar, StarEligible, StarCompare
global assextra1, PickThreeStars
;-----------------------------------------------------------------------------
; RunPreGameSkate                                 2D9D9  96 PC, low confidence
; Pre-game: sets up both teams and runs frames while the players skate out
;-----------------------------------------------------------------------------
RunPreGameSkate:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 10h, 0
        mov eax, dword [gameopts]
        mov dword [byte ebp-04h], 23Ah
        mov eax, dword [byte eax+01h]
        mov dword [LastEventPlayer], 0FFFFFFFFh
        mov byte [textline5], 0
        mov byte [textline4], 0
        mov byte [textline2], 0
        mov byte [textline1], 0
        mov byte [textline3], 0
        mov dword [curperiod], 0FFFFFFFFh
        mov word [fox], 0
        mov word [foy], 0
        shl eax, 0Fh
        mov dword [PreGameSkateOn], 0
        shr eax, 1Bh
        mov dword [lineuptime], 334h
        mov ax, word [nosplit eax*4+TeamJerseyStyle]
        mov word [exitgame], 0
        mov dword [byte ebp-08h], eax
        xor eax, eax
        jmp short .2
.1:
        inc eax
        mov word [nosplit ebx*2+HomeControlSlot], 0FFFFh
.2:
        movsx ebx, ax
        cmp ebx, byte 4
        jl short .1
        mov eax, hmtmstruct
        call reenergizeteam
        mov eax, hmtmstruct
        call setpersonel
        mov eax, hmtmstruct
        call forcepldata
        mov eax, awtmstruct
        call reenergizeteam
        mov eax, awtmstruct
        mov ebx, PreGameSkatePaths
        call setpersonel
        mov eax, awtmstruct
        xor ecx, ecx
        call forcepldata
        call resetplstuff
        jmp near .18
.3:
        xor edi, edi
        jmp short .5
.4:
        inc edi
        mov byte [byte eax+ebp-010h], 0
.5:
        movsx eax, di
        cmp eax, byte 5
        jl short .4
        xor edi, edi
        jmp near .17
.6:
        mov dword [dword ebx+09Ch], 0
        cmp word [byte ebx+01Ah], byte 0
        jne near .11
        mov word [byte ebx+02h], 0
        mov ax, word [byte ebx+02h]
        mov word [byte ebx+02Ah], ax
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .7
        mov eax, 0FFFFFEA8h
        jmp short .8
.7:
        mov eax, 158h
.8:
        mov word [byte ebx+02Eh], 0FF9Ch
        mov dword [byte ebx+07Ah], 0FFFFFFFFh
        mov word [byte ebx+0Eh], 0
        mov word [byte ebx+06h], ax
        mov word [byte ebx+02Ch], ax
        mov al, byte [byte ebx+044h]
        mov dx, word [byte ebx+0Eh]
        and al, 80h
        mov word [byte ebx+0Ch], dx
        movzx eax, al
        and byte [byte ebx+044h], 0F7h
        test eax, eax
        je short .9
        xor eax, eax
        jmp short .10
.9:
        mov eax, 4
.10:
        mov edx, 5E3h
        mov word [byte ebx+036h], ax
        mov eax, ebx
        call SetSPA
        mov edx, 25h
        jmp near .16
.11:
        mov eax, 5
        call randomd0
        mov esi, eax
.12:
        movsx eax, si
        cmp byte [byte eax+ebp-010h], 0
        je short .13
        inc eax
        mov esi, 5
        cdq
        idiv esi
        mov esi, edx
        jmp short .12
.13:
        imul esi, byte 28h
        mov byte [byte eax+ebp-010h], 1
        mov eax, 8
        call randomd0
        sub eax, byte 4
        sub esi, byte 50h
        add esi, eax
        mov word [byte ebx+02h], si
        mov eax, 2
        mov word [byte ebx+02Ah], si
        call randomd0
        add word [byte ebx+02h], ax
        mov al, byte [byte ebx+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .14
        mov edx, 0FFFFFFA0h
        jmp short .15
.14:
        mov edx, 56h
.15:
        mov eax, 4
        call randomd0
        cwde
        mov word [byte ebx+036h], 4
        dec eax
        dec eax
        mov word [byte ebx+0Eh], 0
        add eax, edx
        mov word [byte ebx+06h], ax
        mov word [byte ebx+02Ch], ax
        mov ax, word [byte ebx+0Eh]
        mov word [byte ebx+0Ch], ax
        mov eax, 28h
        mov edx, dword [byte ebp-04h]
        call randomd0
        sub eax, byte 14h
        mov dword [byte ebx+07Ah], 0FFFFFFFFh
        add edx, eax
        mov eax, ebx
        mov word [byte ebx+02Eh], dx
        mov edx, 5
        and byte [byte ebx+044h], 0F7h
        call SetSPA
        mov eax, ebx
        mov edx, 25h
        call updateanim
.16:
        mov eax, ebx
        call assreplace
        inc edi
        sub ebx, 0A0h
.17:
        movsx eax, di
        cmp eax, byte 6
        jl near .6
        inc ecx
.18:
        movsx eax, cx
        cmp eax, byte 2
        jl near .3
        mov eax, dword [PtrPuckFlags]
        mov word [byte eax+028h], 78h
        mov eax, dword [PtrPuckFlags]
        mov word [byte eax+02h], 0C8h
        mov eax, dword [PtrPuckFlags]
        mov word [byte eax+06h], 0FED4h
        mov eax, dword [PtrPuckFlags]
        mov word [byte eax+0Ch], 0
        mov eax, dword [PtrPuckFlags]
        mov word [byte eax+0Eh], 0
        mov edx, 1Ah
        mov eax, dword [PtrPuckFlags]
        call assreplace
        mov eax, dword [PtrPuckObject]
        mov edx, dword [byte ebp-08h]
        mov word [byte eax+026h], dx
        mov eax, dword [PtrPuckObject]
        mov word [byte eax+02h], 98h
        mov dx, word [byte eax+02h]
        mov eax, dword [PtrPuckObject]
        mov word [byte eax+02Ah], dx
        mov eax, 2
        mov ebx, dword [PtrPuckObject]
        call randomd0
        add word [byte ebx+02h], ax
        mov eax, dword [PtrPuckObject]
        mov word [byte eax+06h], 0
        mov dx, word [byte eax+06h]
        mov eax, dword [PtrPuckObject]
        mov word [byte eax+02Ch], dx
        mov eax, dword [PtrPuckObject]
        mov word [byte eax+036h], 4
        mov eax, dword [PtrPuckObject]
        mov word [byte eax+0Eh], 0
        mov dx, word [byte eax+0Eh]
        mov eax, dword [PtrPuckObject]
        mov word [byte eax+0Ch], dx
        mov eax, dword [PtrPuckObject]
        mov edx, dword [byte ebp-04h]
        mov word [byte eax+02Eh], dx
        mov edx, 763h
        mov eax, dword [PtrPuckObject]
        xor edi, edi
        call SetSPA
        mov edx, 26h
        mov eax, dword [PtrPuckObject]
        mov ebx, BenchSpriteCount
        call assreplace
        mov word [RefStep], 0
        jmp short .22
.19:
        xor ecx, ecx
        jmp short .21
.20:
        mov word [byte ebx+018h], 5
        mov word [byte ebx+016h], 2
        mov word [byte ebx+01Ah], 0
        mov eax, ebx
        mov word [byte ebx+01Ch], 0FFFFh
        call AnimateBenchSprite
        mov eax, 50h
        mov edx, dword [byte ebp-04h]
        call randomd0
        sub eax, byte 28h
        add ebx, byte 2Ah
        add edx, eax
        inc ecx
        mov word [byte ebx-0Eh], dx
.21:
        movsx eax, cx
        cmp eax, byte 7
        jl short .20
        inc edi
.22:
        movsx eax, di
        cmp eax, byte 2
        jl short .19
        or byte [sflags], 40h
        call DoGameFrame
        call DoGameFrame
        call SprSort
        mov eax, dword [puckc]
        mov dword [GameLoopFrames], 0
        mov byte [eax], 0FFh
        mov dword [GameLoopActive], 0
        mov word [camx], 0
        mov word [xc1], 0
        mov word [camy], 0
        mov word [yc1], 0
        mov word [lcblink_aw], 0
        mov word [lcblink], 0
        mov word [energywarn_aw], 0
        mov word [energywarn], 0
RunPreGameSkate_450:
        leave
RunPreGameSkate_451:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RunLineupLoop                                  2DE30  96 PC, low confidence
; The line-up loop: runs game frames for the line-up time before play, with the arena clip
;-----------------------------------------------------------------------------
RunLineupLoop:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        call TicksSinceLast
        mov dword [InGameMenuRequest], 0
        mov dword [GameLoopActive], 1
.1:
        cmp dword [lineuptime], byte 0
        je near LineupLoopFrame.8
        cmp dword [gameresult], byte 0
        jne near LineupLoopFrame.8
        mov ebx, dword [GameLoopActive]
        mov dword [GameLoopActive], 0
        call SoundIdle
        mov dword [GameLoopActive], ebx
        call ArenaClipReady
        test eax, eax
        je short .2
        call StartArenaClip
.2:
        xor ebx, ebx
        xor esi, esi
;-----------------------------------------------------------------------------
; LineupLoopFrame                                2DE99  96 PC, low confidence
; One pass of the line-up loop: simulation frames, crowd, camera and drawing
;-----------------------------------------------------------------------------
LineupLoopFrame:
        cmp dword [InputRecordCount], byte 0
        je near .4
        cmp dword [lineuptime], byte 0
        je near .4
        cmp dword [gameresult], byte 0
        jne near .4
        cmp dword [InGameMenuRequest], byte 0
        jne near .4
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
        add dword [GameLoopFrames], ecx
        mov dword [GameLoopActive], 0
        mov ecx, dword [GameLoopFrames]
        mov dword [GameLoopActive], edi
        sar ecx, 4
        and dword [GameLoopFrames], byte 0Fh
        mov eax, ecx
        mov dword [InputRecordIndex], edx
        call RunSimFrames
        mov eax, ebx
        sub eax, esi
        cmp eax, byte 3
        jle short .3
        mov esi, dword [GameLoopActive]
        mov dword [GameLoopActive], 0
        call SoundIdle
        mov dword [GameLoopActive], esi
        mov esi, ebx
.3:
        sub dword [lineuptime], ecx
        cmp dword [lineuptime], byte 0
        jge near LineupLoopFrame
        mov dword [lineuptime], 0
        jmp near LineupLoopFrame
.4:
        call CrowdReactToPlay
        mov eax, ebx
        call Crowd_Noise
        mov ecx, dword [GameLoopActive]
        mov dword [GameLoopActive], 0
        call SoundIdle
        mov dword [GameLoopActive], ecx
        cmp dword [ZonesDirty], byte 0
        je short .5
        cmp dword [lineuptime], 2A8h
        jge short .6
.5:
        mov eax, ebx
        call UpdateCamera
.6:
        mov eax, ebx
        call DrawGameFrame
        cmp dword [fadeinpending], byte 0
        je short .7
        mov ebx, 1
        mov edx, TeamRosterPtrs+320h
        mov ecx, dword [GameLoopActive]
        xor eax, eax
        mov dword [GameLoopActive], 0
        call FadePalette
        call LinkResyncInput
        mov dword [fadeinpending], 0
        mov dword [GameLoopActive], ecx
.7:
        cmp dword [InGameMenuRequest], byte 0
        je near RunLineupLoop.1
        mov dword [lineuptime], 0
        jmp near RunLineupLoop.1
.8:
        mov dword [GameLoopActive], 0
        cmp dword [InGameMenuRequest], byte 0
        je short .11
        call FreeSpriteCache
        mov eax, 50h
        mov dword [GameLoopActive], 0
        call StopArenaClip
        mov eax, 3
        call FadeOut
        mov eax, 50h
        mov dword [InGameMenuRequest], 0
        call CrowdFadeOut
        call GetTicks
        lea esi, [byte eax+050h]
.9:
        call GetTicks
        cmp eax, esi
        jge short .10
        call SoundIdle
        jmp short .9
.10:
        call EndGameCleanup
        mov eax, 0FFFFFFFFh
        jmp near RunPreGameSkate_450
.11:
        xor eax, eax
        jmp near RunPreGameSkate_450
;-----------------------------------------------------------------------------
; FillPanelEdge                                   2E0C5  96 PC, low confidence
; Fills the edge of an overlay panel
;-----------------------------------------------------------------------------
FillPanelEdge:
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-04h], ebx
        mov dword [byte ebp-08h], ecx
        push eax
        push dword [byte ebp+010h]
        push ecx
        push ebx
        push edx
        call FillRectColor
        add esp, byte 14h
        push esi
        push dword [byte ebp+018h]
        push dword [byte ebp+014h]
        push dword [byte ebp+010h]
        push dword [byte ebp-08h]
        call FillRectColor
        add esp, byte 14h
        push esi
        push dword [byte ebp+020h]
        push dword [byte ebp+01Ch]
        push dword [byte ebp+018h]
        push dword [byte ebp+014h]
        call FillRectColor
        add esp, byte 14h
        push esi
        push dword [byte ebp-04h]
        push edi
        push dword [byte ebp+020h]
        push dword [byte ebp+01Ch]
        call FillRectColor
        add esp, byte 14h
FillPanelEdge_5C:
        leave
        pop edi
        pop esi
        ret 14h
;-----------------------------------------------------------------------------
; DrawPanelBorder                                 2E127  96 PC, low confidence
; Draws an overlay panel's border
;-----------------------------------------------------------------------------
DrawPanelBorder:
        push esi
        push edi
        enter 4, 0
        push eax
        mov edi, edx
        mov esi, ebx
        mov dword [byte ebp-04h], ecx
        push dword [byte ebp+020h]
        push dword [byte ebp+01Ch]
        push dword [byte ebp+018h]
        push dword [byte ebp+014h]
        push dword [byte ebp+010h]
        push ecx
        push ebx
        push edx
        push byte 4
        call RemapPolygonArgs
        add esp, byte 24h
        push dword [byte ebp+020h]
        push dword [byte ebp+01Ch]
        mov ecx, dword [byte ebp-04h]
        push dword [byte ebp+018h]
        mov eax, dword [byte ebp-08h]
        push dword [byte ebp+014h]
        mov ebx, esi
        push dword [byte ebp+010h]
        mov edx, edi
        call FillPanelEdge
        jmp short FillPanelEdge_5C
;-----------------------------------------------------------------------------
; DrawPanelShade                                  2E171  96 PC, low confidence
; Draws an overlay panel's shaded box
;-----------------------------------------------------------------------------
DrawPanelShade:
        push esi
        push edi
        push ebp
        mov ebp, esp
        push edx
        mov edi, ebx
        mov esi, ecx
        push dword [byte ebp+024h]
        push dword [byte ebp+020h]
        push dword [byte ebp+01Ch]
        push dword [byte ebp+018h]
        push dword [byte ebp+014h]
        push dword [byte ebp+010h]
        push ecx
        push ebx
        push byte 4
        push eax
        call FillPolygonArgs
        add esp, byte 28h
        push dword [byte ebp+024h]
        push dword [byte ebp+020h]
        mov ecx, dword [byte ebp+010h]
        push dword [byte ebp+01Ch]
        mov eax, dword [byte ebp-04h]
        push dword [byte ebp+018h]
        mov ebx, esi
        push dword [byte ebp+014h]
        mov edx, edi
        call FillPanelEdge
        leave
        pop edi
        pop esi
        ret 18h
;-----------------------------------------------------------------------------
; DrawOverlayPanels                               2E1BE  96 PC, low confidence
; Draws the game overlays: score, clock, line change and team panels
;-----------------------------------------------------------------------------
DrawOverlayPanels:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 58h, 0
        push eax
        cmp dword [lineuptime], 140h
        jle near .71
        mov edi, dword [lineuptime]
        sub edi, 140h
        test byte [GsOptions+1], 20h
        je short .1
        mov esi, StarPanelOffsets
        mov dword [byte ebp-04h], str_V_DrawOverlayPanels
        jmp short .2
.1:
        mov esi, str_C_DrawOverlayPanels
        mov dword [byte ebp-04h], str_Punct_DrawOverlayPanels
.2:
        push byte 0
        push byte 30h
        call TextSetColor
        add esp, byte 8
        push byte 18h
        lea eax, [byte ebp-030h]
        push eax
        push esi
        call bcopy
        add esp, byte 0Ch
        push byte 14h
        lea eax, [byte ebp-018h]
        push eax
        push dword [byte ebp-04h]
        call bcopy
        add esp, byte 0Ch
        cmp edi, 8Ch
        jge near .6
        mov eax, 8Ch
        sub eax, edi
        mov edi, eax
        movsx eax, word [byte esi+06h]
        imul eax, edi
        mov ebx, 8Ch
        cdq
        idiv ebx
        mov ebx, eax
        xor eax, eax
.3:
        inc eax
        inc eax
        sub word [byte eax+ebp-032h], bx
        cmp eax, byte 0Ah
        jne short .3
        sub word [byte ebp-01Ch], bx
        mov edx, dword [ViewScreenWidth]
        movsx eax, word [byte esi+0Ah]
        sub edx, eax
        mov eax, edx
        imul eax, edi
        mov ebx, 8Ch
        cdq
        idiv ebx
        mov ebx, eax
        mov eax, 0Ah
.4:
        inc eax
        inc eax
        add word [byte eax+ebp-032h], bx
        cmp eax, byte 14h
        jne short .4
.5:
        mov eax, dword [byte ebp-04h]
        add word [byte ebp-01Ah], bx
        mov edx, dword [ViewScreenHeight]
        movsx eax, word [byte eax+010h]
        sub edx, eax
        mov eax, edx
        imul eax, edi
        mov ebx, 8Ch
        cdq
        idiv ebx
        add word [byte ebp-08h], ax
        add word [byte ebp-06h], ax
        jmp near .12
.6:
        cmp edi, 168h
        jle short .9
        sub edi, 168h
        movsx eax, word [byte esi+06h]
        imul eax, edi
        mov ebx, 8Ch
        cdq
        idiv ebx
        mov ebx, eax
        xor eax, eax
.7:
        inc eax
        inc eax
        sub word [byte eax+ebp-032h], bx
        cmp eax, byte 0Ah
        jne short .7
        sub word [byte ebp-01Ch], bx
        mov edx, dword [ViewScreenWidth]
        movsx eax, word [byte esi+0Ah]
        sub edx, eax
        mov eax, edx
        imul eax, edi
        mov ebx, 8Ch
        cdq
        idiv ebx
        mov ebx, eax
        mov eax, 0Ah
.8:
        inc eax
        inc eax
        add word [byte eax+ebp-032h], bx
        cmp eax, byte 14h
        jne short .8
        jmp near .5
.9:
        cmp word [CupShown], byte 0
        jne short .12
        cmp dword [byte ebp-05Ch], byte 0
        jne short .12
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        cmp dword [nosplit eax*4+TeamJerseyStyle], byte 0
        jne short .10
        mov eax, 3Eh
        jmp short .11
.10:
        mov eax, 3Fh
.11:
        call PlayArenaClip
        xor eax, eax
        call sfx
        mov word [CupShown], 1
.12:
        cmp dword [byte ebp-05Ch], byte 2
        jge short .13
        push dword [ViewScreenHeight]
        mov ebx, dword [ViewScreenWidth]
        inc dword [DrawFrameCount]
        xor ecx, ecx
        xor edx, edx
        mov eax, dword [DrawFrameCount]
        call AddZone
        push dword [ViewScreenHeight]
        push byte 0
        push dword [ViewScreenWidth]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
.13:
        push OverlayRemap
        call SetRemapTable
        add esp, byte 4
        movsx eax, word [byte ebp-012h]
        push eax
        movsx edx, word [byte ebp-030h]
        push edx
        push eax
        movsx eax, word [byte ebp-02Ah]
        push eax
        movsx ebx, word [byte ebp-014h]
        push ebx
        movsx ecx, word [byte ebp-028h]
        mov eax, 5
        call DrawPanelBorder
        cmp dword [byte ebp-05Ch], byte 0
        je short .14
        movsx eax, word [byte ebp-0Ah]
        push eax
        movsx edx, word [byte ebp-030h]
        push edx
        push eax
        movsx eax, word [byte ebp-02Ah]
        push eax
        movsx ebx, word [byte ebp-0Ch]
        push ebx
        movsx ecx, word [byte ebp-028h]
        jmp short .15
.14:
        movsx eax, word [byte ebp-0Ah]
        push eax
        movsx edx, word [byte ebp-026h]
        push edx
        push eax
        movsx ecx, word [byte ebp-01Eh]
        push ecx
        movsx ebx, word [byte ebp-0Ch]
        push ebx
        movsx edx, word [byte ebp-022h]
.15:
        mov eax, 5
        call DrawPanelBorder
        push byte 0
        movsx eax, word [byte ebp-06h]
        push byte 0
        movsx ebx, word [byte ebp-08h]
        push byte 1
        movsx ecx, word [byte esi+06h]
        push eax
        movsx edx, word [byte esi+0Ah]
        mov eax, OverlayRemap
        call DrawBox
        push byte 5
        movsx eax, word [byte ebp-06h]
        push eax
        movsx eax, word [byte esi+06h]
        push eax
        movsx eax, word [byte ebp-08h]
        push eax
        movsx eax, word [byte esi+0Ah]
        push eax
        call DrawRectOutline
        add esp, byte 14h
        movsx eax, word [byte ebp-014h]
        push eax
        movsx ebx, word [byte ebp-030h]
        push ebx
        push eax
        movsx eax, word [byte ebp-02Ah]
        push eax
        movsx ecx, word [byte ebp-018h]
        push ecx
        movsx eax, word [byte ebp-02Ch]
        push eax
        mov edx, 7Ah
        mov eax, 7Dh
        call DrawPanelShade
        cmp dword [byte ebp-05Ch], byte 0
        je short .16
        movsx eax, word [byte ebp-0Ch]
        push eax
        movsx ebx, word [byte ebp-030h]
        push ebx
        push eax
        movsx eax, word [byte ebp-02Ah]
        push eax
        movsx ecx, word [byte ebp-010h]
        push ecx
        movsx eax, word [byte ebp-02Ch]
        jmp short .17
.16:
        movsx eax, word [byte ebp-0Ch]
        push eax
        movsx edx, word [byte ebp-026h]
        push edx
        push eax
        movsx eax, word [byte ebp-01Eh]
        push eax
        movsx ecx, word [byte ebp-010h]
        push ecx
        movsx ebx, word [byte ebp-024h]
.17:
        push eax
        mov edx, 7Ah
        mov eax, 7Dh
        call DrawPanelShade
        mov eax, dword [PanelShadeArt]
        call SetAaPalLut
        xor edx, edx
        mov eax, 30h
        call SetTextColors
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        movsx ecx, word [byte ebp-016h]
        shr eax, 1Bh
        movsx ebx, word [byte ebp-02Eh]
        call LoadTeamLogo
        mov edx, eax
        test byte [GsOptions+1], 20h
        je short .18
        mov eax, 0FAE1h
        jmp short .19
.18:
        mov eax, 8000h
.19:
        call DrawArtAaScaledInt
        cmp dword [byte ebp-05Ch], byte 0
        je short .21
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        movsx ecx, word [byte ebp-0Eh]
        shr eax, 1Bh
        movsx ebx, word [byte ebp-02Eh]
        call LoadTeamLogo
        mov edx, eax
        test byte [GsOptions+1], 20h
        je short .20
        mov eax, 0FAE1h
        jmp short .23
.20:
        mov eax, 8000h
        jmp short .23
.21:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        movsx ecx, word [byte ebp-0Eh]
        shr eax, 1Bh
        movsx ebx, word [byte ebp-020h]
        call LoadTeamLogo
        mov edx, eax
        test byte [GsOptions+1], 20h
        je short .22
        mov eax, 0FAE1h
        jmp short .23
.22:
        mov eax, 8000h
.23:
        call DrawArtAaScaledInt
        push dword [OverlayBmp]
        call TextSetFont
        mov eax, dword [gameopts]
        add esp, byte 4
        test byte [byte eax+03h], 3Eh
        jne short .26
        test byte [GsOptions+1], 20h
        je short .24
        mov ebx, 10h
        jmp short .25
.24:
        mov ebx, 4
.25:
        movsx eax, word [byte ebp-018h]
        movsx edx, word [byte ebp-01Ch]
        add ebx, eax
        mov eax, str_MightyDucks
        jmp short .29
.26:
        test byte [GsOptions+1], 20h
        je short .27
        mov ebx, 10h
        jmp short .28
.27:
        mov ebx, 4
.28:
        movsx eax, word [byte ebp-018h]
        add ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        movsx edx, word [byte ebp-01Ch]
        mov eax, dword [nosplit eax*4+TeamCityNames]
.29:
        call DrawColorText
        cmp dword [byte ebp-05Ch], byte 0
        je near .40
        mov eax, dword [gameopts]
        test dword [byte eax+01h], 1F000h
        jne short .32
        test byte [GsOptions+1], 20h
        je short .30
        mov eax, 10h
        jmp short .31
.30:
        mov eax, 4
.31:
        movsx ebx, word [byte ebp-010h]
        movsx edx, word [byte ebp-01Ch]
        add ebx, eax
        mov eax, str_MightyDucks
        jmp short .35
.32:
        test byte [GsOptions+1], 20h
        je short .33
        mov eax, 10h
        jmp short .34
.33:
        mov eax, 4
.34:
        movsx ebx, word [byte ebp-010h]
        add ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        movsx edx, word [byte ebp-01Ch]
        mov eax, dword [nosplit eax*4+TeamCityNames]
.35:
        call DrawColorText
        movsx eax, word [hmscore]
        push eax
        push str_fmt2d
        lea eax, [byte ebp-058h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        test byte [GsOptions+1], 20h
        je short .36
        mov ebx, 10h
        jmp short .37
.36:
        mov ebx, 4
.37:
        movsx eax, word [byte ebp-010h]
        movsx edx, word [byte ebp-02Ch]
        add ebx, eax
        lea eax, [byte ebp-058h]
        call DrawColorTextRight
        movsx eax, word [awscore]
        push eax
        push str_fmt2d
        lea eax, [byte ebp-058h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        test byte [GsOptions+1], 20h
        je short .38
        mov ebx, 10h
        jmp short .39
.38:
        mov ebx, 4
.39:
        movsx eax, word [byte ebp-018h]
        movsx edx, word [byte ebp-02Ch]
        add ebx, eax
        lea eax, [byte ebp-058h]
        jmp short .46
.40:
        mov eax, dword [gameopts]
        test dword [byte eax+01h], 1F000h
        jne short .43
        test byte [GsOptions+1], 20h
        je short .41
        mov eax, 10h
        jmp short .42
.41:
        mov eax, 4
.42:
        movsx ebx, word [byte ebp-010h]
        movsx edx, word [byte ebp-01Ah]
        add ebx, eax
        mov eax, str_MightyDucks
        jmp short .46
.43:
        test byte [GsOptions+1], 20h
        je short .44
        mov ebx, 10h
        jmp short .45
.44:
        mov ebx, 4
.45:
        movsx eax, word [byte ebp-010h]
        add ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        movsx edx, word [byte ebp-01Ah]
        mov eax, dword [nosplit eax*4+TeamCityNames]
.46:
        call DrawColorTextRight
        push dword [NamePanelBmp]
        call TextSetFont
        mov eax, dword [gameopts]
        add esp, byte 4
        test byte [byte eax+03h], 3Eh
        jne short .49
        test byte [GsOptions+1], 20h
        je short .47
        mov ebx, 8
        jmp short .48
.47:
        mov ebx, 2
.48:
        movsx eax, word [byte ebp-014h]
        movsx edx, word [byte ebp-01Ch]
        add ebx, eax
        mov eax, str_OfAnaheim
        jmp short .52
.49:
        test byte [GsOptions+1], 20h
        je short .50
        mov ebx, 8
        jmp short .51
.50:
        mov ebx, 2
.51:
        movsx eax, word [byte ebp-014h]
        add ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        movsx edx, word [byte ebp-01Ch]
        mov eax, dword [nosplit eax*4+TeamNicknames]
.52:
        call DrawColorText
        mov eax, dword [gameopts]
        test dword [byte eax+01h], 1F000h
        jne short .59
        cmp dword [byte ebp-05Ch], byte 0
        je short .56
        test byte [GsOptions+1], 20h
        je short .53
        mov ebx, 8
        jmp short .54
.53:
        mov ebx, 2
.54:
        movsx eax, word [byte ebp-0Ch]
        movsx edx, word [byte ebp-01Ch]
        add ebx, eax
        mov eax, str_OfAnaheim
.55:
        call DrawColorText
        jmp near .66
.56:
        test byte [GsOptions+1], 20h
        je short .57
        mov ebx, 8
        jmp short .58
.57:
        mov ebx, 2
.58:
        movsx eax, word [byte ebp-0Ch]
        movsx edx, word [byte ebp-01Ah]
        add ebx, eax
        mov eax, str_OfAnaheim
        jmp near .65
.59:
        cmp dword [byte ebp-05Ch], byte 0
        je short .62
        test byte [GsOptions+1], 20h
        je short .60
        mov ebx, 8
        jmp short .61
.60:
        mov ebx, 2
.61:
        movsx eax, word [byte ebp-0Ch]
        add ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        movsx edx, word [byte ebp-01Ch]
        mov eax, dword [nosplit eax*4+TeamNicknames]
        jmp short .55
.62:
        test byte [GsOptions+1], 20h
        je short .63
        mov eax, 8
        jmp short .64
.63:
        mov eax, 2
.64:
        movsx ebx, word [byte ebp-0Ch]
        add ebx, eax
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        movsx edx, word [byte ebp-01Ah]
        mov eax, dword [nosplit eax*4+TeamNicknames]
.65:
        call DrawColorTextRight
.66:
        push dword [NameFont]
        call TextSetFont
        add esp, byte 4
        cmp dword [byte ebp-05Ch], byte 0
        jne short .67
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        push dword [nosplit eax*4+TeamFullNames]
        mov eax, 92h
        call GetLangText
        push eax
        lea eax, [byte ebp-058h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp short .68
.67:
        lea eax, [byte ebp-058h]
        call GetPeriodText
.68:
        test byte [GsOptions+1], 20h
        je short .69
        mov ebx, 9
        jmp short .70
.69:
        mov ebx, 3
.70:
        movsx eax, word [byte ebp-08h]
        movsx edx, word [byte ebp-030h]
        add ebx, eax
        movsx eax, word [byte ebp-01Eh]
        add edx, eax
        lea eax, [byte ebp-058h]
        sar edx, 1
        call DrawColorTextCentred
        jmp near RunPreGameSkate_450
.71:
        cmp dword [ZonesDirty], byte 0
        je near RunPreGameSkate_450
        mov dword [ZonesDirty], 0
        jmp near RunPreGameSkate_450
;-----------------------------------------------------------------------------
; StartPreGame                                 2E95C  95 PC, medium confidence
; Returns 0 when demoflag is set; else runs PreGameIntro unless eax is
; non-zero, then CrowdNoiseReset; called twice from asset_loading game start
; code demoflag is a skip flag; introskipped/fadeinpending follow.
;-----------------------------------------------------------------------------
StartPreGame:
        push ebx
        push ecx
        mov ebx, eax
        mov eax, dword [optblock]
        and eax, byte 7Fh
        call CrowdNoiseReset
        mov eax, 7Fh
        call CrowdReaction
        mov eax, dword [gameopts]
        test byte [byte eax+02h], 8
        je short .1
        push TeamRosterPtrs+320h
        push dword 100h
        push byte 0
        call SetPaletteEntries
        add esp, byte 0Ch
        mov eax, CamShotKeys
        call SetCameraShot
        xor eax, eax
        pop ecx
        pop ebx
        ret
.1:
        test bx, bx
        jne short .2
        call RunPreGameSkate
.2:
        mov dword [ZonesDirty], 1
        mov edx, 0FFFFFFFFh
        mov eax, 8
        mov word [CupShown], 0
        call CloseTextOverlay
        mov eax, 4
        call UpdateCamera
        call RunLineupLoop
        mov edx, eax
        mov eax, 8
        call EndCameraShot
        cmp dword [hmslotcount], byte 0
        je short .3
        mov eax, dword [hmfirstslot]
        and byte [SortCords+184h], 0F7h
        mov dword [SortCords+1BAh], eax
        mov word [nosplit eax*2+HomeControlSlot], 2
.3:
        cmp dword [awslotcount], byte 0
        je short .4
        mov eax, dword [awfirstslot]
        and byte [AwSortCords+184h], 0F7h
        mov dword [AwSortCords+1BAh], eax
        mov word [nosplit eax*2+HomeControlSlot], 8
.4:
        mov eax, edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assintrostand                                2EA39  95 PC, medium confidence
; Asstab 25h (PreGameIntro): stands with a countdown in temp5, small random x
; jitter and random fidget animation (introstandanims_m2); when done
; assinsert 27h
;-----------------------------------------------------------------------------
assintrostand:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .3
        movsx eax, word [byte ebx+02Eh]
        cmp eax, byte 0FFFFFF9Ch
        je near .3
        cmp word [byte ebx+02Eh], byte 0
        jle near .2
        dec word [byte ebx+02Eh]
        cmp word [byte ebx+02Eh], byte 0
        jl short .2
        mov eax, 64h
        call randomd0
        test ax, ax
        jne short .1
        mov eax, 2
        call randomd0
        mov edx, eax
        mov ax, word [byte ebx+02Ah]
        add eax, edx
        mov word [byte ebx+02h], ax
.1:
        mov al, byte [byte ebx+045h]
        and al, 2
        movzx eax, al
        test eax, eax
        jne short .3
        mov eax, 50h
        call randomd0
        test ax, ax
        jne short .3
        mov eax, 9
        call randomd0
        cwde
        mov ecx, 5
        cdq
        idiv ecx
        mov eax, ebx
        movsx edx, word [nosplit edx*4+IntroStandSpots]
        call SetSPA
        or byte [byte ebx+045h], 2
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        mov edx, 27h
        mov eax, ebx
        call assinsert
.3:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; assintroline                                                    2EAEB  95 PC
; Asstab 26h (PreGameIntro): skates to the line-up spot (temp3 -0Fh,temp4),
; turns to face centre, marks temp5 -64h; when all 12 skaters are done sets
; seqtimer 0Ah; crowdlevel 320h
;-----------------------------------------------------------------------------
assintroline:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov al, byte [byte eax+044h]
        and al, 20h
        movzx eax, al
        test eax, eax
        jne near .16
        movsx eax, word [byte ebx+02Eh]
        cmp eax, byte 0FFFFFF9Ch
        jne short .3
        cmp dword [lineuptime], byte 0Ah
        jle near .16
        xor eax, eax
        jmp short .2
.1:
        movsx edx, word [dword eax+SortCords+2Eh]
        cmp edx, byte 0FFFFFF9Ch
        jne near .16
        add eax, 0A0h
.2:
        cmp eax, 780h
        jl short .1
        mov dword [lineuptime], 0Ah
        pop edx
        pop ecx
        pop ebx
        ret
.3:
        cmp word [byte ebx+02Eh], byte 0
        jle near .5
        dec word [byte ebx+02Eh]
        cmp word [byte ebx+02Eh], byte 0
        jl short .5
        mov eax, 64h
        call randomd0
        test ax, ax
        jne short .4
        mov eax, 2
        call randomd0
        mov edx, eax
        mov ax, word [byte ebx+02Ah]
        add eax, edx
        mov word [byte ebx+02h], ax
.4:
        mov al, byte [byte ebx+045h]
        and al, 2
        movzx eax, al
        test eax, eax
        jne near .16
        mov eax, 50h
        call randomd0
        test ax, ax
        jne near .16
        mov eax, 2
        call randomd0
        test ax, ax
        mov eax, 763h
        movsx edx, ax
        mov eax, ebx
        call SetSPA
        or byte [byte ebx+045h], 2
        pop edx
        pop ecx
        pop ebx
        ret
.5:
        mov al, byte [byte ebx+044h]
        and al, 2
        movzx eax, al
        test eax, eax
        je short .6
        mov word [byte ebx+028h], 8
        mov word [byte ebx+026h], 0
        mov word [byte ebx+02Ah], 0FFF1h
        mov word [byte ebx+02Ch], 0
        mov word [byte ebx+030h], 0
        mov word [byte ebx+032h], 0
        mov edx, 763h
        and byte [byte ebx+044h], 0FDh
        mov eax, ebx
        or byte [byte ebx+045h], 20h
        call SetSPA
        mov word [yc1], 0
        mov word [RefStep], 1
        mov word [crowdlevel], 320h
.6:
        movsx edx, word [byte ebx+02h]
        movsx eax, word [byte ebx+02Ah]
        sub edx, eax
        mov eax, edx
        imul eax, eax
        movsx ecx, word [byte ebx+06h]
        movsx edx, word [byte ebx+02Ch]
        sub ecx, edx
        mov edx, ecx
        imul edx, ecx
        add edx, eax
        cmp edx, byte 40h
        jge near .14
        cmp word [byte ebx+0Ch], byte 0
        jge short .7
        movsx eax, word [byte ebx+0Ch]
        neg eax
        jmp short .8
.7:
        movsx eax, word [byte ebx+0Ch]
.8:
        cmp eax, byte 10h
        jge near .14
        cmp word [byte ebx+0Eh], byte 0
        jge short .9
        movsx eax, word [byte ebx+0Eh]
        neg eax
        jmp short .10
.9:
        movsx eax, word [byte ebx+0Eh]
.10:
        cmp eax, byte 10h
        jge near .14
        mov ax, word [byte ebx+02Ah]
        dec word [byte ebx+026h]
        mov word [byte ebx+02h], ax
        mov ax, word [byte ebx+02Ch]
        mov word [byte ebx+06h], ax
        cmp word [byte ebx+026h], byte 0
        jge near .16
        mov edx, 763h
        mov eax, ebx
        add word [byte ebx+026h], byte 8
        call SetSPA
        mov ax, word [byte ebx+06h]
        neg eax
        movsx edx, ax
        mov ax, word [byte ebx+02h]
        neg eax
        cwde
        call vtoa
        cwde
        mov dword [regd2], eax
        mov ax, word [regd2]
        cmp ax, word [byte ebx+036h]
        je short .13
        sub ax, word [byte ebx+036h]
        xor ah, ah
        and al, 7
        mov word [regd2], ax
        cwde
        cmp eax, byte 5
        jge short .11
        mov eax, 1
        jmp short .12
.11:
        mov eax, 0FFFFFFFFh
.12:
        movsx edx, word [byte ebx+036h]
        add eax, edx
        and eax, byte 7
        mov word [byte ebx+036h], ax
        pop edx
        pop ecx
        pop ebx
        ret
.13:
        mov word [byte ebx+0Eh], 0
        mov ax, word [byte ebx+0Eh]
        mov edx, 7A7h
        mov word [byte ebx+0Ch], ax
        mov eax, ebx
        mov word [byte ebx+02Eh], 0FF9Ch
        call SetSPA
        pop edx
        pop ecx
        pop ebx
        ret
.14:
        mov ax, word [byte ebx+02Ah]
        mov word [regd0], ax
        mov ax, word [byte ebx+02Ch]
        mov word [regd1], ax
        cmp edx, 90h
        jle short .15
        mov eax, ebx
        xor edx, edx
        call skateto
        pop edx
        pop ecx
        pop ebx
        ret
.15:
        mov eax, ebx
        xor edx, edx
        call SkateToSpot
.16:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; AddStar                                      2ED68  95 PC, medium confidence
; PC three stars. eax = list index (0-2), edx = team, ebx = player. Stores (team, player) in startm/starpl
; unless the pair is already in the first eax entries. Returns 1 if added, 0 if a duplicate.
;-----------------------------------------------------------------------------
AddStar:
        push ecx
        push esi
        push edi
        mov esi, eax
        mov ecx, edx
        movsx edi, si
        xor edx, edx
        xor eax, eax
        jmp short .3
.1:
        cmp cx, word [dword eax+StarPoints]
        jne short .2
        cmp bx, word [dword eax+starpl]
        jne short .2
        xor eax, eax
        pop edi
        pop esi
        pop ecx
        ret
.2:
        add eax, byte 4
        inc edx
.3:
        cmp edx, edi
        jl short .1
        mov word [nosplit edi*4+StarPoints], cx
        mov eax, 1
        mov word [nosplit edi*4+starpl], bx
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; StarEligible                                 2EDB1  95 PC, medium confidence
; (team, roster idx): 0 when the roster slot (hmtmpdst) is below -1 or the
; player's on-ice sprite has +1Ah == 6; else 1. Used by StarCompare when
; picking three stars
;-----------------------------------------------------------------------------
StarEligible:
        push ebx
        push ecx
        mov ebx, eax
        imul ecx, eax, dword 136h
        mov eax, edx
        movsx eax, word [dword ecx+eax*2+hmtmpdst]
        cmp eax, byte 0FFFFFFFFh
        jge short .2
.1:
        xor eax, eax
        pop ecx
        pop ebx
        ret
.2:
        test ebx, ebx
        je short .3
        mov eax, AwSortCords
        jmp short .4
.3:
        mov eax, SortCords
.4:
        xor ebx, ebx
.5:
        movsx ecx, byte [byte eax+047h]
        cmp ecx, edx
        jne short .6
        movsx eax, word [byte eax+01Ah]
        cmp eax, byte 6
        jne short .7
        jmp short .1
.6:
        inc ebx
        add eax, 0A0h
        cmp ebx, byte 6
        jl short .5
.7:
        mov eax, 1
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; StarCompare                                  2EE07  95 PC, medium confidence
; qsort comparator for PickThreeStars; player stat points from hmplstats, +2 for gwgteam/gwgplayer.
;-----------------------------------------------------------------------------
StarCompare:
        push ebx
        push ecx
        push esi
        push edi
        enter 18h, 0
        mov esi, eax
        mov edi, edx
        mov eax, dword [eax]
        mov ebx, 19h
        cdq
        idiv ebx
        mov ecx, eax
        mov eax, dword [edi]
        cdq
        idiv ebx
        mov ebx, eax
        mov eax, dword [esi]
        mov dword [byte ebp-08h], 19h
        cdq
        idiv dword [byte ebp-08h]
        mov esi, 19h
        mov eax, dword [edi]
        mov dword [byte ebp-014h], edx
        cdq
        idiv esi
        imul eax, ecx, dword 190h
        mov dword [byte ebp-018h], edx
        mov edx, dword [byte ebp-014h]
        shl edx, 4
        add eax, hmplstats
        add edx, eax
        imul eax, ebx, dword 190h
        mov esi, hmplstats
        add esi, eax
        mov eax, dword [byte ebp-018h]
        shl eax, 4
        movsx edi, word [edx]
        add eax, esi
        movsx esi, word [byte edx+02h]
        add edi, esi
        mov dword [byte ebp-0Ch], edi
        cmp ecx, dword [gwgteam]
        jne short .1
        mov esi, dword [byte ebp-014h]
        cmp esi, dword [gwgplayer]
        jne short .1
        add dword [byte ebp-0Ch], byte 2
.1:
        movsx esi, word [byte eax+02h]
        mov dword [byte ebp-08h], esi
        mov edi, dword [byte ebp-08h]
        movsx esi, word [eax]
        add edi, esi
        mov dword [byte ebp-010h], edi
        cmp ebx, dword [gwgteam]
        jne short .2
        mov esi, dword [byte ebp-018h]
        cmp esi, dword [gwgplayer]
        jne short .2
        add dword [byte ebp-010h], byte 2
.2:
        mov esi, dword [byte ebp-010h]
        cmp esi, dword [byte ebp-0Ch]
        je short .3
        mov eax, esi
        sub eax, dword [byte ebp-0Ch]
        jmp near .12
.3:
        mov si, word [eax]
        cmp si, word [edx]
        je short .5
        movsx ebx, si
        movsx eax, word [edx]
.4:
        sub ebx, eax
        mov eax, ebx
        jmp near .12
.5:
        cmp dword [byte ebp-0Ch], byte 0
        jle short .6
        cmp ecx, ebx
        je short .6
        imul esi, ebx, dword 136h
        movsx esi, word [dword esi+hmscore]
        mov dword [byte ebp-08h], esi
        imul esi, ecx, dword 136h
        mov edi, dword [byte ebp-08h]
        movsx esi, word [dword esi+hmscore]
        sub edi, esi
        mov esi, edi
        je short .6
        test edi, edi
        setg byte [byte ebp-04h]
        movzx edi, byte [byte ebp-04h]
        xor edi, ebx
        je short .6
        mov eax, esi
        jmp near .12
.6:
        mov si, word [byte eax+0Eh]
        cmp si, word [byte edx+0Eh]
        je short .7
        movsx eax, si
        movsx edx, word [byte edx+0Eh]
        sub eax, edx
        jmp near .12
.7:
        cmp word [byte eax+06h], byte 0
        jg short .8
        cmp word [byte edx+06h], byte 0
        jle short .9
.8:
        movsx ebx, word [byte eax+06h]
        movsx eax, word [byte edx+06h]
        jmp short .4
.9:
        mov edx, dword [byte ebp-014h]
        mov eax, ecx
        call StarEligible
        mov edx, dword [byte ebp-018h]
        mov esi, eax
        mov eax, ebx
        call StarEligible
        xor esi, eax
        je short .11
        test eax, eax
        je short .10
        mov eax, 1
        jmp near .12
.10:
        mov eax, 0FFFFFFFFh
        jmp near .12
.11:
        imul edx, dword [byte ebp-014h], byte 15h
        imul ecx, dword 20Dh
        mov eax, hmplattr
        add eax, ecx
        add eax, edx
        imul edx, ebx, dword 20Dh
        imul ebx, dword [byte ebp-018h], byte 15h
        add edx, hmplattr
        add edx, ebx
        movzx ecx, byte [byte edx+01h]
        movzx ebx, byte [byte edx+02h]
        add ebx, ecx
        movzx ecx, byte [byte edx+04h]
        add ecx, ebx
        movzx ebx, byte [byte edx+06h]
        add ecx, ebx
        movzx ebx, byte [byte edx+09h]
        add ecx, ebx
        movzx ebx, byte [byte edx+0Ah]
        add ecx, ebx
        movzx ebx, byte [byte edx+03h]
        add ebx, ecx
        movzx ecx, byte [byte edx+0Dh]
        add ebx, ecx
        movzx ecx, byte [byte edx+0Bh]
        movzx edx, byte [byte edx+05h]
        add ecx, ebx
        movzx ebx, byte [byte eax+01h]
        add ecx, edx
        movzx edx, byte [byte eax+02h]
        add ebx, edx
        movzx edx, byte [byte eax+04h]
        add ebx, edx
        movzx edx, byte [byte eax+06h]
        add ebx, edx
        movzx edx, byte [byte eax+09h]
        add edx, ebx
        movzx ebx, byte [byte eax+0Ah]
        add ebx, edx
        movzx edx, byte [byte eax+03h]
        add ebx, edx
        movzx edx, byte [byte eax+0Dh]
        add ebx, edx
        movzx edx, byte [byte eax+0Bh]
        movzx eax, byte [byte eax+05h]
        add edx, ebx
        add eax, edx
        sub ecx, eax
        mov eax, ecx
.12:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
;-----------------------------------------------------------------------------
; assextra1                                       2F029  96 PC, low confidence
; Placeholder (Abdul 2026-11-15): empty routine in asstab slots 14h and 15h
;-----------------------------------------------------------------------------
assextra1:
        ret
;-----------------------------------------------------------------------------
; PickThreeStars                               2F02A  95 PC, medium confidence
; PC three stars. Empties startm/starpl, records the winner (gwgteam, gwgplayer = its team field 2Eh)
; when the scores differ, then fills the 3 stars from the qsorted players (StarCompare) with AddStar.
;-----------------------------------------------------------------------------
PickThreeStars:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0E8h, 0
        sub ebp, 82h
        xor esi, esi
        xor edx, edx
        jmp short .2
.1:
        mov word [nosplit eax*4+starpl], 0FFFFh
        mov bx, word [nosplit eax*4+starpl]
        inc edx
        mov word [nosplit eax*4+StarPoints], bx
.2:
        movsx eax, dx
        cmp eax, byte 3
        jl short .1
        mov dword [gwgplayer], 0FFFFFFFFh
        mov dword [gwgteam], 0FFFFFFFFh
        cmp dword [curperiod], byte 3
        jle near .3
        mov ax, word [awscore]
        sub ax, word [hmscore]
        je short .3
        test ax, ax
        setg al
        movzx dx, al
        movsx eax, word [lasttouch]
        cmp eax, byte 6
        setl al
        movsx ecx, dx
        movzx eax, al
        xor eax, ecx
        je short .3
        mov dword [gwgteam], ecx
        imul eax, ecx, dword 136h
        movsx eax, word [dword eax+hmtmtouch1]
        movsx edx, word [awscore]
        mov dword [gwgplayer], eax
        movsx eax, word [hmscore]
        call IsCupClinched
        test eax, eax
        je short .3
        movsx ebx, word [gwgplayer]
        movsx eax, si
        mov edx, ecx
        call AddStar
        add esi, eax
.3:
        xor edi, edi
        jmp near .8
.4:
        test di, di
        sete al
        movzx eax, al
        imul eax, dword 136h
        cmp word [dword eax+hmscore], byte 0
        jne near .7
        imul eax, edx, byte 12h
        mov dx, word [dword eax+hmglstats+8]
        xor ebx, ebx
        cmp dx, word [dword eax+hmglstats+2]
        jle short .5
        mov ebx, 1
.5:
        movsx eax, di
        imul eax, byte 12h
        mov dx, word [dword eax+hmglstats+0Eh]
        cmp dx, word [dword eax+hmglstats+2]
        jle short .6
        cmp dx, word [dword eax+hmglstats+8]
        jle short .6
        mov ebx, 2
.6:
        movsx eax, di
        mov dword [byte ebp+076h], eax
        imul edx, eax, byte 12h
        movsx eax, bx
        imul eax, byte 6
        add eax, edx
        mov edx, dword [gameopts]
        mov edx, dword [byte edx+01h]
        shl edx, 15h
        shr edx, 1Eh
        movsx dx, byte [dword edx+starskatermin]
        cmp dx, word [dword eax+hmglstats+2]
        jge short .7
        mov edx, dword [byte ebp+076h]
        add ebx, byte 19h
        movsx eax, si
        movsx ebx, bx
        call AddStar
        add esi, eax
.7:
        inc edi
.8:
        movsx edx, di
        cmp edx, byte 2
        jl near .4
        xor edi, edi
        xor ebx, ebx
        jmp near .12
.9:
        mov eax, ecx
        mov dword [byte ebp+07Ah], 19h
        cdq
        idiv dword [byte ebp+07Ah]
        mov dword [byte ebp+072h], eax
        imul eax, dword 4B4h
        mov dword [byte ebp+07Ah], eax
        mov eax, ecx
        mov ecx, 19h
        cdq
        idiv ecx
        imul eax, edx, byte 2Bh
        add eax, dword [byte ebp+07Ah]
        movzx ax, byte [dword eax+hmroster]
        test ax, ax
        je short .11
        movsx ecx, ax
        cmp ecx, byte 2
        je short .11
        imul eax, dword [byte ebp+072h], dword 190h
        mov dword [byte ebp+07Ah], eax
        mov eax, hmplstats
        add eax, dword [byte ebp+07Ah]
        shl edx, 4
        add eax, edx
        cmp ecx, byte 1
        jne short .10
        cmp word [eax], byte 0
        jne short .10
        cmp word [byte eax+02h], byte 0
        jne short .10
        cmp word [byte eax+04h], byte 0
        jne short .10
        cmp word [byte eax+06h], byte 0
        jne short .10
        cmp word [byte eax+0Eh], byte 0
        je short .11
.10:
        movsx edx, bx
        movsx eax, di
        inc edi
        mov dword [byte ebp+eax*4-066h], edx
.11:
        inc ebx
.12:
        movsx ecx, bx
        cmp ecx, byte 32h
        jl near .9
        mov ecx, StarCompare
        mov ebx, 4
        lea eax, [byte ebp-066h]
        movsx edx, di
        call qsort_
        xor ecx, ecx
        jmp near .19
.13:
        movsx eax, cx
        mov ax, word [byte ebp+eax*4-066h]
        movsx ebx, ax
        mov eax, ebx
        mov dword [byte ebp+07Ah], 19h
        cdq
        idiv dword [byte ebp+07Ah]
        mov dword [byte ebp+06Ah], eax
        imul eax, dword 190h
        mov dword [byte ebp+07Ah], eax
        mov eax, ebx
        mov ebx, 19h
        cdq
        idiv ebx
        mov eax, edx
        shl eax, 4
        add eax, dword [byte ebp+07Ah]
        movsx ebx, word [dword eax+hmplstats+2]
        movsx eax, word [dword eax+hmplstats]
        add eax, ebx
        cmp eax, byte 1
        jle short .14
        mov eax, dword [byte ebp+06Ah]
        movsx ebx, dx
        movsx edx, ax
        movsx eax, si
        call AddStar
        add esi, eax
        movsx eax, si
        cmp eax, byte 3
        jge near .22
        jmp near .18
.14:
        mov dword [byte ebp+07Eh], 0
        jmp near .17
.15:
        mov eax, ebx
        mov dword [byte ebp+07Ah], 3
        cdq
        idiv dword [byte ebp+07Ah]
        mov dword [byte ebp+066h], eax
        imul eax, byte 12h
        mov dword [byte ebp+062h], eax
        mov eax, ebx
        mov ebx, 3
        cdq
        idiv ebx
        mov dword [byte ebp+06Eh], edx
        imul eax, edx, byte 6
        mov edx, dword [gameopts]
        mov edx, dword [byte edx+01h]
        shl edx, 15h
        shr edx, 1Eh
        add eax, dword [byte ebp+062h]
        movsx dx, byte [dword edx+stargoaliemin]
        cmp dx, word [dword eax+hmglstats+2]
        jg short .16
        movsx edx, word [dword eax+hmglstats+4]
        imul edx, dword 3E8h
        movsx ebx, word [dword eax+hmglstats+2]
        mov eax, ebx
        mov dword [byte ebp+07Ah], edx
        cdq
        LD sub, eax, edx
        sar eax, 1
        add eax, dword [byte ebp+07Ah]
        cdq
        idiv ebx
        cmp eax, byte 4Bh
        jg short .16
        mov eax, dword [byte ebp+06Eh]
        add eax, byte 19h
        movsx ebx, ax
        mov eax, dword [byte ebp+066h]
        movsx edx, ax
        movsx eax, si
        call AddStar
        add esi, eax
        movsx eax, si
        cmp eax, byte 3
        jge short .22
.16:
        inc dword [byte ebp+07Eh]
.17:
        movsx ebx, word [byte ebp+07Eh]
        cmp ebx, byte 6
        jl near .15
        jmp short .21
.18:
        inc ecx
.19:
        cmp cx, di
        jl near .13
        jmp short .21
.20:
        movsx eax, cx
        mov ax, word [byte ebp+eax*4-066h]
        movsx ebx, ax
        mov eax, ebx
        mov dword [byte ebp+07Ah], 19h
        cdq
        idiv dword [byte ebp+07Ah]
        movsx eax, dx
        mov dword [byte ebp+07Ah], eax
        mov eax, ebx
        mov ebx, 19h
        cdq
        idiv ebx
        mov ebx, dword [byte ebp+07Ah]
        movsx edx, ax
        movsx eax, si
        call AddStar
        add esi, eax
        movsx eax, si
        cmp eax, byte 3
        jge short .22
        inc ecx
.21:
        cmp cx, di
        jl short .20
.22:
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near RunPreGameSkate_451
