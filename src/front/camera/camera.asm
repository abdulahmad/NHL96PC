; The game camera: its path polynomials and the camera shots (96 PC).
bits 32
%include "hockey.inc"
extern ReplayFrameState
extern TeamRosterPtrs
section s_5D707 progbits alloc exec nowrite align=1
extern __CHP, BuildShadeLut, RinkFloorOn, IceTextureOn, IceLogosOn, GlassOn, PlayerDetailOn, StandsOn
extern RinkBoardsOn, BenchPlayersOn, ScoreClockOn
extern CamLastSort, CamFirstFrame
extern HexDigits, PenBuf, CamShotMode, CamShotPhase
extern DemoMode, InReplay, ReplayRemoteShape, TimedPanelState, ViewTop, ViewWidth, ViewHeight
extern ViewLeft, str_D_DrawGameFrame, ViewBitmap, ViewPixels, ViewSizeStep, CameraShotOn, str_C_CloseTextOverlay, CamFollowObj
extern CamLeadDist, CamAimDist, CamViewBits, CameraViewTable




extern CameraViewSlots, CamFocusObj, CamFixedObj, CamShotFromObj, CamShotToObj, CamShotNearObj, HotKeyStates

extern ShadowToggle, MarkerToggle, NameToggle, PuckObject
extern ReplayCamFollow, ReplayCamShot, ViewBrightness, ShowShadows, ShowMarkers, CamTargetObj, CamLeadX
extern CamLeadY, CamLeadOn, CamShotTime, CamPathPos, CamAimX, CamAimShift, CamAimY, CamShotTimer
extern CamShakeStart, CamShakeCount, CamShotId, CamShotObj, CamInjuredObj, CamNearNet, CameraShotState
extern CamShotKeys, CamShotSaved, CamPosX, CamPosY, CamPosZ, CamDistance, CamMatrix, CamAngle
extern CamPitch, CamPathState, CamZoom, CamPathActive, CamPathDerivs
extern GsOptions, fox
extern foy, FullViewClip, gameclock, GameLoopActive, GetTicks, gmode, puckvy, PtrRefObject
extern PtrPuckObject, passplayer, penshotlive, penshotmode, penshotstart, puckc, puckvx, puckvz
extern QueueOverlayPanel, F64_0p00277778, F64_65536_CamView236, F64_0p00277778_CamView236, CamViewScale, F64_0p00277778_CamView238, F64_65536_CamView238, F64_0p00277778_CamView239
extern F64_65536_CamView239, rand_, seed, seed_w2, SetClipWindow, SetDrawBitmap, sflags, SortCords
extern str_Priority2, AddIceCrud, SetRinkClipWindow, AllocMemBlock, FreeMemBlock, AngleOfVector, TransformVector, MakeRotYMatrix
extern BuildPerspTable, KeyIsDown, KbdGetKey, ClearClipRect, SetViewScreenOrigin, SetViewFov

extern ReplayCamTarget, CameraPathPoints, CamPathTarget
extern NearNetZeroVec, CamAimZeroVec, ShotFromZeroVec, ShotToZeroVec, ShotNearZeroVec, CamTargetZeroVec, CamShotPositions, unk_5D591_84
extern str_D_SetGameViewSize, ViewSizeWidths, ViewSizeHeights, vecdist, PerTimeTotal, ReplayObjX, ReplayObjY

global CameraPathCoeffs, CameraPathEval, CameraPathEval_70, CameraPathSlope, CameraPathCurve, CameraPathPoint, CameraPathDerivs, SetCameraShot
global AngleXZ, AnglePitch, CameraTrackPuck, CameraLeadOffset, CameraNearNet, CameraNearNet_12E, ResetCameraShake, CameraAim
global CameraAim_AB, CameraAim_229, CamView232, CamView233, CamView234, CamView234_2D0, CamView235, CamView236
global CamView236_1E7, CamView236_20D, CamView236_403, CamView238, CamView239, CamView23A, CamShot23E, CamShot23F
global CamShot23F_44, CamShot240, CamShot240_56, CamShot242, CamShot242_126, CamShot242_209, CamShot242_269, CamShot242_278
global CamShot242_279, CamShot245, CamShot246, CamShot247, CamShot244, CamShot23D, CamShot23B, CamShot23B_B3
global CamShot23C, CloseTextOverlay, EndCameraShot, SetGameViewSize, jpt_609B6, ReadHotKeys, ReadHotKeys_6FB, ReadHotKeys_748
global ReadHotKeys_78C, ReadHotKeys_7CF, jpt_61290, UpdateCamera, UpdateCamera_174, UpdateCamera_2CE, UpdateCamera_35B, UpdateCamera_3BE
global UpdateCamera_41F, UpdateCamera_480, UpdateCamera_4E1, UpdateCamera_544, UpdateCamera_5A7, UpdateCamera_604, UpdateCamera_667, CameraFacing
global randomd0, vtoa
;-----------------------------------------------------------------------------
; CameraPathCoeffs                                5D707  96 PC, low confidence
; The coefficients of one camera path polynomial
;-----------------------------------------------------------------------------
CameraPathCoeffs:
        push esi
        push edi
        enter 0Ch, 0
        mov esi, eax
        mov eax, dword [byte ebp+010h]
        imul edi, esi, byte 0FFFFFFFAh
        mov dword [byte ebp-08h], edi
        imul edi, edx, byte 6
        mov dword [byte ebp-0Ch], edi
        mov edi, dword [byte ebp-08h]
        add edi, dword [byte ebp-0Ch]
        mov dword [byte ebp-08h], edi
        lea edi, [ebx+ebx*2]
        mov dword [byte ebp-0Ch], edi
        mov edi, dword [byte ebp-08h]
        sub edi, dword [byte ebp-0Ch]
        mov dword [byte ebp-08h], edi
        mov edi, ecx
        sar edi, 1
        mov dword [byte ebp-0Ch], edi
        mov edi, dword [byte ebp-08h]
        sub edi, dword [byte ebp-0Ch]
        mov dword [eax], edi
        imul edi, esi, byte 0Fh
        mov dword [byte ebp-04h], edi
        imul edi, edx, byte 0Fh
        imul edx, byte 0Ah
        mov dword [byte ebp-08h], edi
        mov edi, dword [byte ebp-04h]
        sub edi, dword [byte ebp-08h]
        mov dword [byte ebp-08h], edi
        mov edi, ebx
        shl edi, 3
        mov dword [byte ebp-04h], edi
        mov edi, dword [byte ebp-08h]
        lea ecx, [ecx+ecx*2]
        add edi, dword [byte ebp-04h]
        sar ecx, 1
        add edi, ecx
        add eax, byte 4
        mov dword [eax], edi
        imul edi, esi, byte 0FFFFFFF6h
        add edi, edx
        imul edx, ebx, byte 6
        sub edi, edx
        mov edx, edi
        add eax, byte 4
        sub edx, ecx
        mov dword [eax], edx
        add eax, byte 4
        mov edx, dword [byte ebp-0Ch]
        mov dword [eax], edx
        add eax, byte 4
        mov dword [eax], ebx
        add eax, byte 4
        mov dword [eax], esi
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; CameraPathEval                               5D7A2  96 PC, medium confidence
; (coeffs, t): a 5th-degree polynomial in 16.16 by Horner's rule
;-----------------------------------------------------------------------------
CameraPathEval:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        mov eax, dword [eax]
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, ebx
        mov eax, dword [eax]
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, ebx
        mov eax, dword [eax]
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, ebx
        mov eax, dword [eax]
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, ebx
        mov eax, dword [eax]
CameraPathEval_70:
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add eax, dword [ebx]
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CameraPathSlope                              5D82C  96 PC, medium confidence
; (coeffs, t): its first derivative (5, 4, 3, 2)
;-----------------------------------------------------------------------------
CameraPathSlope:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        imul eax, dword [eax], byte 5
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [ebx]
        shl edx, 2
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        imul edx, dword [ebx], byte 3
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [ebx]
        add edx, edx
        jmp short CameraPathEval_70
;-----------------------------------------------------------------------------
; CameraPathCurve                              5D87E  96 PC, medium confidence
; (coeffs, t): its second derivative (20, 12, 6, 2)
;-----------------------------------------------------------------------------
CameraPathCurve:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        imul eax, dword [eax], byte 14h
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        imul edx, dword [ebx], byte 0Ch
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        imul edx, dword [ebx], byte 6
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [ebx]
        add edx, edx
        add eax, edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CameraPathPoint                              5D8D1  96 PC, medium confidence
; Evaluates the 5 camera path polynomials at CamPathPos into the camera
; position and angles (CamAngle-179E1B)
;-----------------------------------------------------------------------------
CameraPathPoint:
        push edx
        mov eax, CameraPathPoints
        mov edx, dword [CamPathPos]
        call CameraPathEval
        mov edx, dword [CamPathPos]
        mov dword [CamPathState], eax
        mov eax, CameraPathPoints+18h
        call CameraPathEval
        mov edx, dword [CamPathPos]
        mov dword [CamZoom], eax
        mov eax, CameraPathPoints+30h
        call CameraPathEval
        mov edx, dword [CamPathPos]
        mov dword [CamPathActive], eax
        mov eax, CameraPathPoints+48h
        call CameraPathEval
        mov edx, dword [CamPathPos]
        mov dword [CamAngle], eax
        mov eax, CameraPathPoints+60h
        call CameraPathEval
        mov dword [CamPitch], eax
        cmp dword [CamAngle], 8000h
        jle short .1
        sub dword [CamAngle], 10000h
        jmp short .2
.1:
        cmp dword [CamAngle], 0FFFF8000h
        jge short .2
        inc word [CamAngle+2]
.2:
        cmp dword [CamPitch], 8000h
        jle short .3
        sub dword [CamPitch], 10000h
        pop edx
        ret
.3:
        cmp dword [CamPitch], 0FFFF8000h
        jge short .4
        inc word [CamPitch+2]
.4:
        pop edx
        ret
;-----------------------------------------------------------------------------
; CameraPathDerivs                                5D993  96 PC, low confidence
; The camera path speeds and accelerations (CameraPathSlope /
; CameraPathCurve) at the path position, or 0 without a path
;-----------------------------------------------------------------------------
CameraPathDerivs:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        mov esi, CamPathTarget
        mov edi, CamShotKeys
        mov dword [byte ebp-04h], CameraPathPoints
        cmp dword [CamPathPos], byte 0FFFFFFFFh
        jne short .1
        mov dword [CamPathDerivs+0Ch], 0
        mov dword [CamPathDerivs+8], 0
        mov dword [CamPathDerivs+4], 0
        mov dword [CamPathDerivs], 0
        mov dword [CamPathDerivs+24h], 0
        mov dword [CamPathDerivs+20h], 0
        mov dword [CamPathDerivs+1Ch], 0
        mov dword [CamPathDerivs+18h], 0
        mov dword [CamPathDerivs+14h], 0
        mov dword [CamPathDerivs+10h], 0
        jmp near .2
.1:
        mov eax, CameraPathPoints
        mov ecx, CameraPathPoints
        mov edx, dword [CamPathPos]
        mov ebx, CameraPathPoints
        call CameraPathSlope
        mov edx, dword [CamPathPos]
        add ecx, byte 18h
        mov dword [CamPathDerivs+10h], eax
        mov eax, ecx
        add ebx, byte 30h
        call CameraPathSlope
        mov edx, dword [CamPathPos]
        mov dword [CamPathDerivs+14h], eax
        mov eax, ebx
        call CameraPathSlope
        mov edx, dword [CamPathPos]
        mov dword [CamPathDerivs+18h], eax
        mov eax, CameraPathPoints
        call CameraPathCurve
        mov edx, dword [CamPathPos]
        mov dword [CamPathDerivs+1Ch], eax
        mov eax, ecx
        call CameraPathCurve
        mov edx, dword [CamPathPos]
        mov dword [CamPathDerivs+20h], eax
        mov eax, ebx
        mov ecx, CameraPathPoints
        call CameraPathCurve
        add ecx, byte 48h
        mov edx, dword [CamPathPos]
        mov dword [CamPathDerivs+24h], eax
        mov eax, ecx
        mov ebx, CameraPathPoints
        call CameraPathSlope
        add ebx, byte 60h
        mov edx, dword [CamPathPos]
        mov dword [CamPathDerivs], eax
        mov eax, ebx
        call CameraPathSlope
        mov edx, dword [CamPathPos]
        mov dword [CamPathDerivs+4], eax
        mov eax, ecx
        call CameraPathCurve
        mov edx, dword [CamPathPos]
        mov dword [CamPathDerivs+8], eax
        mov eax, ebx
        call CameraPathCurve
        mov dword [CamPathDerivs+0Ch], eax
.2:
        mov ebx, dword [byte edi+09h]
        sub ebx, dword [byte esi+09h]
        cmp ebx, 8000h
        jle short .3
        sub dword [byte edi+09h], 10000h
.3:
        mov ebx, dword [byte edi+09h]
        sub ebx, dword [byte esi+09h]
        cmp ebx, 0FFFF8000h
        jge short .4
        inc word [byte edi+0Bh]
.4:
        mov ebx, dword [byte edi+0Dh]
        sub ebx, dword [byte esi+0Dh]
        cmp ebx, 8000h
        jle short .5
        sub dword [byte edi+0Dh], 10000h
.5:
        mov ebx, dword [byte edi+0Dh]
        sub ebx, dword [byte esi+0Dh]
        cmp ebx, 0FFFF8000h
        jge short .6
        inc word [byte edi+0Bh]
.6:
        push dword [byte ebp-04h]
        mov ecx, dword [byte esi+039h]
        mov ebx, dword [byte esi+02Dh]
        mov edx, dword [byte edi+011h]
        mov eax, dword [byte esi+011h]
        call CameraPathCoeffs
        mov eax, dword [byte ebp-04h]
        mov ecx, dword [byte esi+03Dh]
        add eax, byte 18h
        mov ebx, dword [byte esi+031h]
        push eax
        mov edx, dword [byte edi+015h]
        mov eax, dword [byte esi+015h]
        call CameraPathCoeffs
        mov eax, dword [byte ebp-04h]
        mov ecx, dword [byte esi+041h]
        add eax, byte 30h
        mov ebx, dword [byte esi+035h]
        push eax
        mov edx, dword [byte edi+019h]
        mov eax, dword [byte esi+019h]
        call CameraPathCoeffs
        mov eax, dword [byte ebp-04h]
        mov ecx, dword [byte esi+025h]
        add eax, byte 48h
        mov ebx, dword [byte esi+01Dh]
        push eax
        mov edx, dword [byte edi+09h]
        mov eax, dword [byte esi+09h]
        call CameraPathCoeffs
        mov eax, dword [byte ebp-04h]
        mov ecx, dword [byte esi+029h]
        add eax, byte 60h
        mov ebx, dword [byte esi+021h]
        push eax
        mov edx, dword [byte edi+0Dh]
        mov eax, dword [byte esi+0Dh]
        call CameraPathCoeffs
        jmp near CamShot242_278
;-----------------------------------------------------------------------------
; SetCameraShot                                                   5DBC0  96 PC
; (shot record): copies the 45h-byte camera shot record to the current shot
; (CamShotKeys), runs its handler once and starts its path
;-----------------------------------------------------------------------------
SetCameraShot:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov esi, eax
        push dword [ViewHeight]
        push dword [ViewWidth]
        push byte 0
        push dword [ViewTop]
        call SetViewFov
        add esp, byte 10h
        mov edi, CamShotKeys
        call BuildPerspTable
        mov ecx, 45h
        rep movsb
        mov ecx, 45h
        mov edi, CamPathTarget
        mov esi, CamShotKeys
        call dword [CamShotSaved]
        mov dword [CamPathPos], 0FFFFFFFFh
        rep movsb
        call CameraPathDerivs
        mov dword [CamPathPos], 0
        cmp dword [InReplay], byte 0
        je near CamShot242_279
        mov ecx, 45h
        mov edi, ReplayCamShot
        mov esi, CamPathTarget
        rep movsb
        jmp near CamShot242_279
        push edx
        mov edx, dword [CamShotSaved]
        cmp edx, dword [byte eax+05h]
        jne short .1
        mov eax, dword [CamShotTime]
        pop edx
        ret
.1:
        cmp dword [CameraShotOn], byte 0
        je short .2
        mov edx, dword [eax]
        mov dword [CameraShotState], edx
        mov dl, byte [byte eax+04h]
        mov byte [CameraShotState+4], dl
        mov edx, dword [byte eax+05h]
        mov dword [CameraShotState+5], edx
.2:
        mov edx, dword [eax]
        mov dword [CamShotKeys], edx
        mov dl, byte [byte eax+04h]
        mov byte [CamShotMode], dl
        mov eax, dword [byte eax+05h]
        mov dword [CamShotSaved], eax
        call CameraPathDerivs
        mov dword [CamPathPos], 0
        xor eax, eax
        pop edx
        ret
        push ebx
        push ecx
        push edx
        mov ebx, 10000h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edx, 168h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; AngleXZ                                      5DCDD  96 PC, medium confidence
; (a, b): the heading from point b to point a on the ice plane (x, z)
;-----------------------------------------------------------------------------
AngleXZ:
        push ebx
        push ecx
        mov ebx, dword [byte eax+08h]
        sub ebx, dword [byte edx+08h]
        mov eax, dword [eax]
        push ebx
        sub eax, dword [edx]
        push eax
        call AngleOfVector
        add esp, byte 8
        neg eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; AnglePitch                                   5DCF8  96 PC, medium confidence
; (a, b): the pitch from b to a (height over ice distance)
;-----------------------------------------------------------------------------
AnglePitch:
        push ebx
        push ecx
        push esi
        mov esi, edx
        mov edx, dword [byte eax+08h]
        sub edx, dword [byte esi+08h]
        mov eax, dword [eax]
        push edx
        sub eax, dword [esi]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [byte esi+04h]
        call AngleOfVector
        add esp, byte 8
        neg eax
        pop esi
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push esi
        push edi
        mov esi, eax
        mov edi, edx
        mov eax, dword [byte eax+08h]
        sub eax, dword [byte edx+08h]
        push eax
        mov eax, dword [esi]
        sub eax, dword [edx]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        mov eax, dword [byte edi+04h]
        sub eax, dword [byte esi+04h]
        push eax
        call AngleOfVector
        add esp, byte 8
        neg eax
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        push ecx
        push esi
        push edi
        enter 24h, 0
        mov edi, edx
        mov esi, ebx
        mov eax, dword [eax]
        neg eax
        push eax
        lea eax, [byte ebp-024h]
        push eax
        call MakeRotYMatrix
        add esp, byte 8
        push esi
        lea eax, [byte ebp-024h]
        push eax
        push edi
        call TransformVector
        add esp, byte 0Ch
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; CameraTrackPuck                              5DD85  96 PC, medium confidence
; The camera target: the puck carrier (ReplayCamFollow) or the puck, replay
; positions in a replay
;-----------------------------------------------------------------------------
CameraTrackPuck:
        push edx
        push esi
        push edi
        cmp dword [InReplay], byte 0
        je near .4
        cmp dword [ReplayCamFollow], byte 0
        jl short .1
        mov eax, dword [ReplayCamFollow]
        mov dword [CamAimShift], 0
        movsx edx, word [nosplit eax*2+ReplayObjX]
        movsx eax, word [nosplit eax*2+ReplayObjY]
        shl edx, 2
        shl eax, 2
        mov dword [CamAimX], edx
        mov dword [CamAimY], eax
        jmp short .2
.1:
        mov edi, CamAimX
        mov esi, ReplayCamTarget
        movsd
        movsd
        movsd
.2:
        mov eax, dword [ReplayCamFollow]
        cmp eax, byte 0Eh
        jne near .9
        movsx eax, word [ReplayFrameState+117h]
        mov dword [CamLeadX], eax
        movsx eax, word [ReplayFrameState+119h]
        mov dword [CamLeadOn], eax
        movsx eax, word [ReplayFrameState+11Bh]
.3:
        mov dword [CamLeadY], eax
        pop edi
        pop esi
        pop edx
        ret
.4:
        cmp dword [CamTargetObj], byte 10h
        je short .5
        cmp dword [CamTargetObj], byte 0FFFFFFFFh
        jne short .6
.5:
        movsx eax, word [foy]
        shl eax, 2
        mov dword [CamAimX], eax
        movsx eax, word [fox]
        shl eax, 2
        mov dword [CamAimShift], 0
        mov dword [CamAimY], eax
        jmp near .8
.6:
        cmp word [passplayer], byte 0
        jl short .7
        mov ax, word [sflags]
        xor ah, ah
        and al, 4
        cwde
        test eax, eax
        je short .7
        movsx eax, word [passplayer]
        imul eax, dword 0A0h
        mov edx, dword [dword eax+SortCords]
        sar edx, 0Eh
        mov dword [CamAimX], edx
        mov edx, dword [dword eax+SortCords+4]
        mov eax, dword [dword eax+SortCords+8]
        sar edx, 0Eh
        sar eax, 0Eh
        mov dword [CamAimY], edx
        mov dword [CamAimShift], eax
        jmp short .8
.7:
        imul eax, dword [CamTargetObj], dword 0A0h
        mov edx, dword [dword eax+SortCords]
        sar edx, 0Eh
        mov dword [CamAimX], edx
        mov edx, dword [dword eax+SortCords+4]
        mov eax, dword [dword eax+SortCords+8]
        sar eax, 0Eh
        sar edx, 0Eh
        mov dword [CamAimShift], eax
        mov dword [CamAimY], edx
        neg dword [CamAimShift]
.8:
        mov eax, dword [CamTargetObj]
        cmp eax, byte 0Eh
        jne short .9
        mov eax, dword [puckvx]
        movsx eax, word [eax]
        sar eax, 5
        mov dword [CamLeadX], eax
        mov eax, dword [puckvy]
        movsx eax, word [eax]
        sar eax, 5
        mov dword [CamLeadOn], eax
        mov eax, dword [puckvz]
        movsx eax, word [eax]
        sar eax, 5
        jmp near .3
.9:
        mov dword [CamLeadX], 0
        mov dword [CamLeadY], 0
        mov dword [CamLeadOn], 0
        pop edi
        pop esi
        pop edx
        ret
;-----------------------------------------------------------------------------
; CameraLeadOffset                                5DF3E  96 PC, low confidence
; How far the camera leads the play (CamAimDist) by the carrier's direction
; near the ends
;-----------------------------------------------------------------------------
CameraLeadOffset:
        push ecx
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .13
        cmp dword [InReplay], byte 0
        je near .4
        mov dword [CamAimDist], eax
        cmp dword [ReplayCamFollow], byte 0
        jl near .14
        movsx eax, byte [ReplayFrameState+112h]
        cmp eax, dword [ReplayCamFollow]
        jne near .14
        cmp byte [ReplayFrameState+11Dh], 0
        je short .2
        cmp dword [CamLeadOn], byte 0
        jl short .1
        mov dword [CamAimDist], 258h
.1:
        cmp dword [CamAimY], 1D0h
        jl near .14
        mov dword [CamAimDist], 424h
        pop ecx
        ret
.2:
        cmp dword [CamLeadOn], byte 0
        jg short .3
        mov dword [CamAimDist], 0FFFFFDA8h
.3:
        cmp dword [CamAimY], 0FFFFFE30h
        jg near .14
        mov dword [CamAimDist], 0FFFFFBDCh
        pop ecx
        ret
.4:
        cmp word [passplayer], byte 0
        jl short .5
        movsx eax, word [passplayer]
        jmp short .6
.5:
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl short .7
        movsx eax, byte [eax]
.6:
        mov dword [CamFocusObj], eax
.7:
        imul eax, dword [CamFocusObj], dword 0A0h
        add eax, SortCords
        mov dword [CamAimDist], 0
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx ecx, al
        mov eax, dword [CamLeadOn]
        add eax, eax
        test ecx, ecx
        je short .9
        cmp dword [CamAimY], 1D0h
        jl short .8
        mov dword [CamAimDist], 424h
        jmp short .12
.8:
        cmp dword [CamLeadOn], byte 0
        jl short .11
        mov dword [CamAimDist], 258h
        jmp short .12
.9:
        cmp dword [CamAimY], 0FFFFFE30h
        jg short .10
        mov dword [CamAimDist], 0FFFFFBDCh
        jmp short .12
.10:
        cmp dword [CamLeadOn], byte 0
        jg short .11
        mov dword [CamAimDist], 0FFFFFDA8h
        jmp short .12
.11:
        mov dword [CamAimDist], eax
.12:
        mov eax, dword [puckc]
        cmp byte [eax], 0
        setge al
        movzx ecx, al
        mov eax, dword [CamLeadX]
        sar eax, cl
        mov dword [CamLeadDist], eax
        pop ecx
        ret
.13:
        mov dword [CamAimDist], 0
        mov dword [CamLeadDist], 0
.14:
        pop ecx
        ret
;-----------------------------------------------------------------------------
; CameraNearNet                                   5E0CC  96 PC, low confidence
; 1 when the tracked player (CamFocusObj) is near a net, for the close
; camera shots
;-----------------------------------------------------------------------------
CameraNearNet:
        push ebx
        push ecx
        push esi
        push edi
        enter 4Ch, 0
        push eax
        push edx
        mov dword [byte ebp-04h], 0
        cmp dword [InReplay], byte 0
        je short .1
        xor eax, eax
        jmp near CameraNearNet_12E
.1:
        imul eax, dword [CamFocusObj], dword 0A0h
        add eax, SortCords
        movsx edx, word [dword eax+086h]
        cmp edx, byte 10h
        je near .6
        cmp word [byte eax+01Ah], byte 0
        je short .6
        mov edx, dword [PuckObject]
        sar edx, 0Eh
        test edx, edx
        jge short .2
        mov ebx, edx
        neg ebx
        jmp short .3
.2:
        mov ebx, edx
.3:
        mov edx, dword [PuckObject+4]
        sar edx, 0Eh
        cmp ebx, 100h
        jg short .6
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx eax, al
        test eax, eax
        je short .4
        cmp edx, 320h
        jl short .6
        cmp edx, 590h
        jg short .6
        jmp short .5
.4:
        cmp edx, 0FFFFFCE0h
        jg short .6
        cmp edx, 0FFFFFA70h
        jl short .6
.5:
        mov dword [byte ebp-04h], 1
.6:
        cmp dword [byte ebp-04h], byte 0
        je near .7
        lea edi, [byte ebp-010h]
        mov esi, NearNetZeroVec
        movsd
        movsd
        movsd
        lea edi, [byte ebp-01Ch]
        mov esi, CamAimX
        movsd
        movsd
        movsd
        mov eax, dword [CamAimDist]
        sub dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-014h]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [byte ebp-01Ch]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        neg eax
        push eax
        lea eax, [byte ebp-04Ch]
        mov edx, dword [byte ebp-050h]
        push eax
        mov dword [byte ebp-08h], edx
        call MakeRotYMatrix
        add esp, byte 8
        lea eax, [byte ebp-028h]
        push eax
        lea eax, [byte ebp-04Ch]
        push eax
        lea eax, [byte ebp-010h]
        push eax
        call TransformVector
        mov eax, dword [byte ebp-028h]
        add dword [CamPosZ], eax
        mov eax, dword [byte ebp-020h]
        add dword [CamMatrix], eax
        mov eax, dword [byte ebp-054h]
        add esp, byte 0Ch
        mov dword [CamDistance], eax
.7:
        mov eax, dword [byte ebp-04h]
CameraNearNet_12E:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        mov byte [ScoreClockOn], 1
        mov al, byte [StandsOn]
        mov dword [CamNearNet], 1
        mov byte [RinkBoardsOn], al
        ret
;-----------------------------------------------------------------------------
; ResetCameraShake                                5E21C  96 PC, low confidence
; In a game, clears ScoreClockOn / 1175AA and CamNearNet
;-----------------------------------------------------------------------------
ResetCameraShake:
        cmp dword [GameLoopActive], byte 1
        jne short .1
        mov byte [ScoreClockOn], 0
        mov byte [RinkBoardsOn], 0
        mov dword [CamNearNet], 0
.1:
        ret
;-----------------------------------------------------------------------------
; CameraAim                                       5E23E  96 PC, low confidence
; Turns and moves the camera toward its target (shared by the camera shots)
;-----------------------------------------------------------------------------
CameraAim:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 3Ch, 0
        lea edi, [byte ebp-0Ch]
        mov esi, CamAimZeroVec
        movsd
        movsd
        movsd
        cmp dword [CamShotTimer], byte 1Eh
        jne near .1
        cmp dword [InReplay], byte 0
        jne short .1
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        neg eax
        push eax
        lea eax, [byte ebp-03Ch]
        push eax
        mov dword [byte ebp-04h], 294h
        call MakeRotYMatrix
        add esp, byte 8
        lea eax, [byte ebp-018h]
        push eax
        lea eax, [byte ebp-03Ch]
        push eax
        lea eax, [byte ebp-0Ch]
        push eax
        call TransformVector
        mov eax, dword [CamAimX]
        sub eax, dword [byte ebp-018h]
        mov dword [CamPosZ], eax
        mov eax, dword [CamAimY]
        mov dword [CamDistance], 140h
        sub eax, dword [byte ebp-010h]
        add esp, byte 0Ch
        mov dword [CamMatrix], eax
        mov eax, 1
        jmp near CamShot242_278
.1:
        xor eax, eax
        jmp near CamShot242_278
CameraAim_AB:
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [CamAimDist]
        add dword [CamAimY], eax
        mov eax, dword [CamAimX]
        mov dword [CamPosZ], eax
        mov eax, dword [InReplay]
        and eax, 200h
        or eax, dword [CamViewBits]
        cmp dword [CamAimY], byte 0
        jge short .7
        test eax, eax
        je short .4
        cmp dword [CamPosZ], 0FFFFFED4h
        jge short .3
.2:
        mov dword [CamPosZ], 0FFFFFED4h
        jmp near .10
.3:
        cmp dword [CamPosZ], 12Ch
        jle near .10
        jmp short .9
.4:
        cmp dword [CamPosZ], 0FFFFFF08h
        jge short .6
.5:
        mov dword [CamPosZ], 0FFFFFF08h
        jmp short .10
.6:
        cmp dword [CamPosZ], 0F8h
        jle short .10
        mov dword [CamPosZ], 0F8h
        jmp short .10
.7:
        test eax, eax
        je short .8
        cmp dword [CamPosZ], 0FFFFFF08h
        jl short .5
        jmp short .6
.8:
        cmp dword [CamPosZ], 0FFFFFED4h
        jl short .2
        cmp dword [CamPosZ], 12Ch
        jle short .10
.9:
        mov dword [CamPosZ], 12Ch
.10:
        mov eax, dword [CamLeadDist]
        add dword [CamPosZ], eax
        mov eax, dword [InReplay]
        and eax, 200h
        mov dword [CamDistance], 244h
        or eax, dword [CamViewBits]
        je short .13
        mov eax, dword [CamAimY]
        add eax, 49Ch
        mov dword [CamMatrix], eax
        cmp eax, 80h
        jge short .11
        mov dword [CamMatrix], 80h
        jmp short .12
.11:
        cmp eax, 898h
        jle short .12
        mov dword [CamMatrix], 898h
.12:
        mov dword [CamPosX], 8000h
        jmp short .16
.13:
        mov eax, dword [CamAimY]
        sub eax, 49Ch
        mov dword [CamMatrix], eax
        cmp eax, 0FFFFF768h
        jge short .14
        mov dword [CamMatrix], 0FFFFF768h
        jmp short .15
.14:
        cmp eax, byte 0FFFFFF80h
        jle short .15
        mov dword [CamMatrix], 0FFFFFF80h
.15:
        mov dword [CamPosX], 0
.16:
        call CameraAim
        mov dword [CamPosY], 0FFFFEAABh
        ret
CameraAim_229:
        push ebx
        push ecx
        push edx
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [CamAimDist]
        add dword [CamAimY], eax
        mov eax, dword [CamAimX]
        mov dword [CamPosZ], eax
        mov eax, dword [InReplay]
        and eax, 200h
        or eax, dword [CamViewBits]
        cmp dword [CamAimY], byte 0
        jge short .22
        test eax, eax
        je short .19
        cmp dword [CamPosZ], 0FFFFFED4h
        jge short .18
.17:
        mov dword [CamPosZ], 0FFFFFED4h
        jmp near .25
.18:
        cmp dword [CamPosZ], 12Ch
        jle near .25
        jmp short .24
.19:
        cmp dword [CamPosZ], 0FFFFFDF8h
        jge short .21
.20:
        mov dword [CamPosZ], 0FFFFFDF8h
        jmp short .25
.21:
        cmp dword [CamPosZ], 208h
        jle short .25
        mov dword [CamPosZ], 208h
        jmp short .25
.22:
        test eax, eax
        je short .23
        cmp dword [CamPosZ], 0FFFFFDF8h
        jl short .20
        jmp short .21
.23:
        cmp dword [CamPosZ], 0FFFFFED4h
        jl short .17
        cmp dword [CamPosZ], 12Ch
        jle short .25
.24:
        mov dword [CamPosZ], 12Ch
.25:
        mov eax, dword [InReplay]
        and eax, 200h
        mov dword [CamDistance], 244h
        or eax, dword [CamViewBits]
        je near .37
        mov eax, dword [CamAimY]
        add eax, 49Ch
        mov dword [CamMatrix], eax
        cmp eax, 80h
        jge short .26
        mov dword [CamMatrix], 80h
        jmp short .27
.26:
        cmp eax, 898h
        jle short .27
        mov dword [CamMatrix], 898h
.27:
        call CameraAim
        mov eax, dword [CamMatrix]
        sub eax, dword [CamAimY]
        push eax
        mov eax, dword [CamPosZ]
        sub eax, dword [CamAimX]
        push eax
        call AngleOfVector
        neg eax
        sar eax, 1
        mov dword [CamPosX], eax
        neg dword [CamPosX]
        add esp, byte 8
        cmp dword [CamPosX], 0FFFFF1C8h
        jge short .28
        mov dword [CamPosX], 0FFFFF1C8h
        jmp short .29
.28:
        cmp dword [CamPosX], 0E38h
        jle short .29
        mov dword [CamPosX], 0E38h
.29:
        cmp dword [CamAimX], 104h
        jle short .33
        cmp dword [CamPosX], 0FFFFF1C8h
        jge short .31
.30:
        mov dword [CamPosX], 0FFFFF1C8h
        jmp short .36
.31:
        cmp dword [CamPosX], byte 0
        jle short .36
.32:
        mov dword [CamPosX], 0
        jmp short .36
.33:
        cmp dword [CamAimX], 0FFFFFEFCh
        jge short .34
        cmp dword [CamPosX], byte 0
        jl short .32
        cmp dword [CamPosX], 0E38h
        jle short .36
        jmp short .35
.34:
        cmp dword [CamPosX], 0FFFFF1C8h
        jl short .30
        cmp dword [CamPosX], 0E38h
        jle short .36
.35:
        mov dword [CamPosX], 0E38h
.36:
        add dword [CamPosX], 8000h
        cmp dword [CamPosX], 8000h
        jle near .46
        sub dword [CamPosX], 10000h
        jmp near .46
.37:
        mov eax, dword [CamAimY]
        sub eax, 49Ch
        mov dword [CamMatrix], eax
        cmp eax, 0FFFFF768h
        jge short .38
        mov dword [CamMatrix], 0FFFFF768h
        jmp short .39
.38:
        cmp eax, byte 0FFFFFF80h
        jle short .39
        mov dword [CamMatrix], 0FFFFFF80h
.39:
        call CameraAim
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        neg eax
        sar eax, 1
        mov dword [CamPosX], eax
        add esp, byte 8
        neg dword [CamPosX]
        cmp dword [CamAimX], 0FFFFFEFCh
        jge short .43
        cmp dword [CamPosX], 0FFFFF1C8h
        jge short .41
.40:
        mov dword [CamPosX], 0FFFFF1C8h
        jmp short .46
.41:
        cmp dword [CamPosX], byte 0
        jle short .46
.42:
        mov dword [CamPosX], 0
        jmp short .46
.43:
        cmp dword [CamAimX], 104h
        jle short .44
        cmp dword [CamPosX], byte 0
        jl short .42
        cmp dword [CamPosX], 0E38h
        jle short .46
        jmp short .45
.44:
        cmp dword [CamPosX], 0FFFFF1C8h
        jl short .40
        cmp dword [CamPosX], 0E38h
        jle short .46
.45:
        mov dword [CamPosX], 0E38h
.46:
        mov eax, dword [CamLeadDist]
        mov dword [CamPosY], 0FFFFEAABh
        add dword [CamPosZ], eax
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamView232                                   5E78F  96 PC, medium confidence
; Camera shot handler, record text 232h (view kind 2)
;-----------------------------------------------------------------------------
CamView232:
        push ebx
        push ecx
        push edx
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [CamAimDist]
        add dword [CamAimY], eax
        mov eax, dword [CamAimX]
        mov dword [CamPosZ], eax
        cmp eax, 0FFFFFF60h
        jge short .1
        mov dword [CamPosZ], 0FFFFFF60h
        jmp short .2
.1:
        cmp eax, 0A0h
        jle short .2
        mov dword [CamPosZ], 0A0h
.2:
        mov eax, dword [InReplay]
        and eax, 200h
        mov dword [CamDistance], 2D0h
        or eax, dword [CamViewBits]
        je short .5
        mov eax, dword [CamAimY]
        add eax, 640h
        mov dword [CamMatrix], eax
        cmp eax, 1F4h
        jge short .3
        mov dword [CamMatrix], 1F4h
        jmp short .4
.3:
        cmp eax, 910h
        jle short .4
        mov dword [CamMatrix], 910h
.4:
        mov dword [CamPosX], 8000h
        jmp short .8
.5:
        mov eax, dword [CamAimY]
        sub eax, 640h
        mov dword [CamMatrix], eax
        cmp eax, 0FFFFF6F0h
        jge short .6
        mov dword [CamMatrix], 0FFFFF6F0h
        jmp short .7
.6:
        cmp eax, 0FFFFFE0Ch
        jle short .7
        mov dword [CamMatrix], 0FFFFFE0Ch
.7:
        mov dword [CamPosX], 0
.8:
        call CameraAim
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosY], eax
        cmp eax, 0FFFFEAABh
        jge short .9
        mov dword [CamPosY], 0FFFFEAABh
        pop edx
        pop ecx
        pop ebx
        ret
.9:
        cmp eax, 0FFFFF05Ch
        jle short .10
        mov dword [CamPosY], 0FFFFF05Ch
.10:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamView233                                   5E8D2  96 PC, medium confidence
; Camera shot handler, record text 233h (view kind 2)
;-----------------------------------------------------------------------------
CamView233:
        push ebx
        push ecx
        push edx
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [CamAimDist]
        add dword [CamAimY], eax
        mov eax, dword [CamAimX]
        mov dword [CamPosZ], eax
        cmp eax, 0FFFFFF60h
        jge short .1
        mov dword [CamPosZ], 0FFFFFF60h
        jmp short .2
.1:
        cmp eax, 0A0h
        jle short .2
        mov dword [CamPosZ], 0A0h
.2:
        mov eax, dword [InReplay]
        and eax, 200h
        mov dword [CamDistance], 2D0h
        or eax, dword [CamViewBits]
        je short .5
        mov eax, dword [CamAimY]
        add eax, 640h
        mov dword [CamMatrix], eax
        cmp eax, 1F4h
        jge short .3
        mov dword [CamMatrix], 1F4h
        jmp short .4
.3:
        cmp eax, 910h
        jle short .4
        mov dword [CamMatrix], 910h
.4:
        mov dword [CamPosX], 8000h
        jmp short .8
.5:
        mov eax, dword [CamAimY]
        sub eax, 640h
        mov dword [CamMatrix], eax
        cmp eax, 0FFFFF6F0h
        jge short .6
        mov dword [CamMatrix], 0FFFFF6F0h
        jmp short .7
.6:
        cmp eax, 0FFFFFE0Ch
        jle short .7
        mov dword [CamMatrix], 0FFFFFE0Ch
.7:
        mov dword [CamPosX], 0
.8:
        call CameraAim
        mov edx, 21Ch
        mov eax, 0E8h
        call CameraNearNet
        mov edx, dword [CamAimX]
        mov ebx, eax
        mov eax, dword [CamAimY]
        sub edx, dword [CamPosZ]
        sub eax, dword [CamMatrix]
        test ebx, ebx
        je short .10
        push eax
        push edx
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosY], eax
        cmp eax, 0FFFFE71Dh
        jge short .9
        mov dword [CamPosY], 0FFFFE71Dh
        pop edx
        pop ecx
        pop ebx
        ret
.9:
        cmp eax, 0FFFFECCDh
        jle short .12
        mov dword [CamPosY], 0FFFFECCDh
        pop edx
        pop ecx
        pop ebx
        ret
.10:
        push eax
        push edx
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosY], eax
        cmp eax, 0FFFFEAABh
        jge short .11
        mov dword [CamPosY], 0FFFFEAABh
        pop edx
        pop ecx
        pop ebx
        ret
.11:
        cmp eax, 0FFFFF05Ch
        jle short .12
        mov dword [CamPosY], 0FFFFF05Ch
.12:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamView234                                   5EA75  96 PC, medium confidence
; Camera shot handler, record text 234h (view kind 3)
;-----------------------------------------------------------------------------
CamView234:
        push ebx
        push ecx
        push edx
        push esi
        enter 0Ch, 0
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [CamAimX]
        mov esi, dword [InReplay]
        add eax, dword [CamLeadDist]
        and esi, 200h
        mov dword [CamPosZ], eax
        or esi, dword [CamViewBits]
        cmp eax, 0FFFFFD08h
        jge short .1
        mov dword [CamPosZ], 0FFFFFD08h
        jmp short .2
.1:
        cmp eax, 2F8h
        jle short .2
        mov dword [CamPosZ], 2F8h
.2:
        imul eax, dword [CamFocusObj], dword 0A0h
        mov edx, dword [CamAimY]
        mov dword [CamDistance], 1CCh
        add edx, dword [CamAimDist]
        add eax, SortCords
        test esi, esi
        je near .6
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx ebx, al
        lea eax, [dword edx+0488h]
        test ebx, ebx
        je short .3
        cmp dword [CamAimY], 1D0h
        jle short .4
        mov dword [CamMatrix], 848h
        jmp short .5
.3:
        cmp dword [CamAimY], 0FFFFFE30h
        jge short .4
        mov dword [CamMatrix], 0A0h
        jmp short .5
.4:
        mov dword [CamMatrix], eax
.5:
        cmp dword [CamMatrix], byte 0
        jl near .11
        cmp dword [CamMatrix], 848h
        jle near .12
        mov dword [CamMatrix], 848h
        jmp near .12
.6:
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx eax, al
        sub edx, 488h
        test eax, eax
        je short .7
        cmp dword [CamAimY], 1D0h
        jle short .8
        mov dword [CamMatrix], 0FFFFFF60h
        jmp short .9
.7:
        cmp dword [CamAimY], 0FFFFFE30h
        jge short .8
        mov dword [CamMatrix], 0FFFFF7B8h
        jmp short .9
.8:
        mov dword [CamMatrix], edx
.9:
        cmp dword [CamMatrix], 0FFFFF7B8h
        jge short .10
        mov dword [CamMatrix], 0FFFFF7B8h
        jmp short .12
.10:
        cmp dword [CamMatrix], byte 0
        jle short .12
.11:
        mov dword [CamMatrix], 0
.12:
        call CameraAim
        test eax, eax
        je short .15
        test esi, esi
        je short .13
        mov eax, 8000h
        jmp short .14
.13:
        xor eax, eax
.14:
        mov dword [CamPosX], eax
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosY], eax
        jmp near CamView234_2D0
.15:
        mov dword [byte ebp-0Ch], eax
        mov dword [byte ebp-08h], eax
        test esi, esi
        je short .16
        mov dword [byte ebp-04h], 0FFFFFA70h
        jmp short .17
.16:
        mov dword [byte ebp-04h], 590h
.17:
        mov eax, dword [byte ebp-04h]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [byte ebp-0Ch]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosX], eax
        test esi, esi
        je short .21
        test eax, eax
        jle short .19
        cmp eax, 5555h
        jge short .18
        mov dword [CamPosX], 5555h
        jmp short .23
.18:
        cmp eax, 8000h
        jle short .23
        mov dword [CamPosX], 8000h
        jmp short .23
.19:
        cmp eax, 0FFFF8000h
        jge short .20
        mov dword [CamPosX], 0FFFF8000h
        jmp short .23
.20:
        cmp eax, 0FFFFAAABh
        jle short .23
        mov dword [CamPosX], 0FFFFAAABh
        jmp short .23
.21:
        cmp eax, 0FFFFD556h
        jge short .22
        mov dword [CamPosX], 0FFFFD556h
        jmp short .23
.22:
        cmp eax, 2AAAh
        jle short .23
        mov dword [CamPosX], 2AAAh
.23:
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosY], eax
        cmp eax, 0FFFFEE39h
        jge short .24
        mov dword [CamPosY], 0FFFFEE39h
        jmp short CamView234_2D0
.24:
        cmp eax, 0FFFFF1C8h
        jle short CamView234_2D0
        mov dword [CamPosY], 0FFFFF1C8h
CamView234_2D0:
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamView235                                   5ED4B  96 PC, medium confidence
; Camera shot handler, record text 235h (view kind 4)
;-----------------------------------------------------------------------------
CamView235:
        push ebx
        push ecx
        push edx
        push esi
        enter 0Ch, 0
        call CameraTrackPuck
        call CameraLeadOffset
        mov esi, dword [InReplay]
        mov eax, dword [CamAimDist]
        and esi, 200h
        add dword [CamAimY], eax
        mov eax, dword [CamAimX]
        or esi, dword [CamViewBits]
        mov dword [CamPosZ], eax
        cmp eax, 0FFFFFD30h
        jge short .1
        mov dword [CamPosZ], 0FFFFFD30h
        jmp short .2
.1:
        cmp eax, 2D0h
        jle short .2
        mov dword [CamPosZ], 2D0h
.2:
        test esi, esi
        je short .4
        mov eax, dword [CamAimY]
        add eax, 3C0h
        mov dword [CamMatrix], eax
        test eax, eax
        jge short .3
        mov dword [CamMatrix], 0
        jmp short .6
.3:
        cmp eax, 780h
        jle short .6
        mov dword [CamMatrix], 780h
        jmp short .6
.4:
        mov eax, dword [CamAimY]
        sub eax, 3C0h
        mov dword [CamMatrix], eax
        cmp eax, 0FFFFF880h
        jge short .5
        mov dword [CamMatrix], 0FFFFF880h
        jmp short .6
.5:
        test eax, eax
        jle short .6
        mov dword [CamMatrix], esi
.6:
        cmp dword [CamMatrix], byte 0
        jge short .7
        mov eax, dword [CamMatrix]
        neg eax
        jmp short .8
.7:
        mov eax, dword [CamMatrix]
.8:
        cmp eax, 640h
        jle short .9
        mov dword [CamDistance], 0C8h
        jmp short .10
.9:
        mov dword [CamDistance], 8Ch
.10:
        call CameraAim
        test eax, eax
        je short .13
        test esi, esi
        je short .11
        mov eax, 8000h
        jmp short .12
.11:
        xor eax, eax
.12:
        mov dword [CamPosX], eax
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosY], eax
        jmp near CamView234_2D0
.13:
        mov dword [byte ebp-0Ch], eax
        mov dword [byte ebp-08h], eax
        test esi, esi
        je short .14
        mov dword [byte ebp-04h], 0FFFFFA70h
        jmp short .15
.14:
        mov dword [byte ebp-04h], 590h
.15:
        cmp dword [CamAimX], byte 0
        jge short .16
        mov dword [byte ebp-0Ch], 0FFFFFFB0h
        jmp short .17
.16:
        mov dword [byte ebp-0Ch], 50h
.17:
        mov eax, dword [byte ebp-04h]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [byte ebp-0Ch]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosX], eax
        test esi, esi
        je short .21
        test eax, eax
        jle short .19
        cmp eax, 5555h
        jge short .18
        mov dword [CamPosX], 5555h
        jmp short .23
.18:
        cmp eax, 8000h
        jle short .23
        mov dword [CamPosX], 8000h
        jmp short .23
.19:
        cmp eax, 0FFFF8000h
        jge short .20
        mov dword [CamPosX], 0FFFF8000h
        jmp short .23
.20:
        cmp eax, 0FFFFAAABh
        jle short .23
        mov dword [CamPosX], 0FFFFAAABh
        jmp short .23
.21:
        cmp eax, 0FFFFD556h
        jge short .22
        mov dword [CamPosX], 0FFFFD556h
        jmp short .23
.22:
        cmp eax, 2AAAh
        jle short .23
        mov dword [CamPosX], 2AAAh
.23:
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosY], eax
        cmp eax, 0FFFFF27Eh
        jge short .24
        mov dword [CamPosY], 0FFFFF27Eh
        jmp near CamView234_2D0
.24:
        cmp eax, 0FFFFFC72h
        jle near CamView234_2D0
        mov dword [CamPosY], 0FFFFFC72h
        jmp near CamView234_2D0
;-----------------------------------------------------------------------------
; CamView236                                   5EFC8  96 PC, medium confidence
; Camera shot handler, record text 236h (view kind 5); its tail
; CamView236_20D is text 237h's
;-----------------------------------------------------------------------------
CamView236:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 24h, 0
        lea edi, [byte ebp-024h]
        mov esi, CamAimX
        call CameraTrackPuck
        call CameraLeadOffset
        movsd
        movsd
        movsd
        mov edx, dword [InReplay]
        mov eax, dword [CamAimDist]
        and edx, 200h
        add dword [CamAimY], eax
        or edx, dword [CamViewBits]
        je short .1
        mov dword [CamPosZ], 550h
        jmp short .2
.1:
        mov dword [CamPosZ], 0FFFFFAB0h
.2:
        mov eax, dword [CamAimY]
        mov dword [CamDistance], 320h
        mov dword [CamMatrix], eax
        cmp eax, 0FFFFFE30h
        jge short .3
        mov dword [CamMatrix], 0FFFFFE30h
        jmp short .4
.3:
        cmp eax, 1D0h
        jle short .4
        mov dword [CamMatrix], 1D0h
.4:
        call CameraAim
        imul eax, dword [CamFocusObj], dword 0A0h
        add eax, SortCords
        mov al, byte [byte eax+044h]
        and al, 80h
        mov ebx, dword [CamAimX]
        movzx ecx, al
        mov eax, dword [CamAimY]
        sub ebx, dword [CamPosZ]
        sub eax, dword [CamMatrix]
        test ecx, ecx
        je near .14
        cmp dword [byte ebp-01Ch], 1D0h
        jle short .11
        cmp dword [byte ebp-01Ch], 3B0h
        jle short .8
        test edx, edx
        je short .5
        mov dword [byte ebp-04h], 3Eh
        jmp short .6
.5:
        mov dword [byte ebp-04h], 0FFFFFFC2h
.6:
        fild dword [byte ebp-04h]
.7:
        fmul qword [F64_0p00277778]
        fmul qword [F64_65536_CamView236]
        call __CHP
        fistp dword [CamPosX]
        jmp near .24
.8:
        test edx, edx
        je short .9
        mov dword [byte ebp-014h], 41h
        jmp short .10
.9:
        mov dword [byte ebp-014h], 0FFFFFFBFh
.10:
        fild dword [byte ebp-014h]
        jmp short .7
.11:
        cmp dword [byte ebp-01Ch], 0FFFFFC50h
        jge near .23
        test edx, edx
        je short .12
        mov dword [byte ebp-08h], 76h
        jmp short .13
.12:
        mov dword [byte ebp-08h], 0FFFFFF8Ah
.13:
        fild dword [byte ebp-08h]
        jmp short .7
.14:
        cmp dword [byte ebp-01Ch], 0FFFFFE30h
        jge short .20
        cmp dword [byte ebp-01Ch], 0FFFFFC50h
        jge short .17
        test edx, edx
        je short .15
        mov dword [byte ebp-010h], 76h
        jmp short .16
.15:
        mov dword [byte ebp-010h], 0FFFFFF8Ah
.16:
        fild dword [byte ebp-010h]
        jmp near .7
.17:
        test edx, edx
        je short .18
        mov dword [byte ebp-018h], 73h
        jmp short .19
.18:
        mov dword [byte ebp-018h], 0FFFFFF8Dh
.19:
        fild dword [byte ebp-018h]
        jmp near .7
.20:
        cmp dword [byte ebp-01Ch], 3B0h
        jle short .23
        test edx, edx
        je short .21
        mov dword [byte ebp-0Ch], 3Eh
        jmp short .22
.21:
        mov dword [byte ebp-0Ch], 0FFFFFFC2h
.22:
        fild dword [byte ebp-0Ch]
        jmp near .7
.23:
        push eax
        push ebx
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosX], eax
.24:
        mov eax, dword [CamAimDist]
        sub dword [CamAimY], eax
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        mov edx, dword [CamAimX]
        push eax
CamView236_1E7:
        sub edx, dword [CamPosZ]
        push edx
        jmp near CamView236_403.50
.25:
        cmp eax, 0FFFFEAABh
        jle near CamShot242_278
        mov dword [CamPosY], 0FFFFEAABh
        jmp near CamShot242_278
CamView236_20D:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 24h, 0
        lea edi, [byte ebp-024h]
        mov esi, CamAimX
        call CameraTrackPuck
        call CameraLeadOffset
        movsd
        movsd
        movsd
        mov ebx, dword [InReplay]
        mov eax, dword [CamAimDist]
        and ebx, 200h
        add dword [CamAimY], eax
        or ebx, dword [CamViewBits]
        je short .26
        mov dword [CamPosZ], 550h
        jmp short .27
.26:
        mov dword [CamPosZ], 0FFFFFAB0h
.27:
        mov eax, dword [CamAimY]
        mov dword [CamDistance], 320h
        mov dword [CamMatrix], eax
        cmp eax, 0FFFFFE30h
        jge short .28
        mov dword [CamMatrix], 0FFFFFE30h
        jmp short .29
.28:
        cmp eax, 1D0h
        jle short .29
        mov dword [CamMatrix], 1D0h
.29:
        call CameraAim
        mov edx, 258h
        mov eax, 320h
        call CameraNearNet
        imul eax, dword [CamFocusObj], dword 0A0h
        add eax, SortCords
        mov al, byte [byte eax+044h]
        and al, 80h
        mov edx, dword [CamAimX]
        movzx ecx, al
        mov eax, dword [CamAimY]
        sub edx, dword [CamPosZ]
        sub eax, dword [CamMatrix]
        test ecx, ecx
        je near .39
        cmp dword [byte ebp-01Ch], 1D0h
        jle short .36
        cmp dword [byte ebp-01Ch], 3B0h
        jle short .33
        test ebx, ebx
        je short .30
        mov dword [byte ebp-04h], 3Eh
        jmp short .31
.30:
        mov dword [byte ebp-04h], 0FFFFFFC2h
.31:
        fild dword [byte ebp-04h]
.32:
        fmul qword [F64_0p00277778_CamView236]
        fmul qword [CamViewScale]
        call __CHP
        fistp dword [CamPosX]
        jmp near .49
.33:
        test ebx, ebx
        je short .34
        mov dword [byte ebp-014h], 41h
        jmp short .35
.34:
        mov dword [byte ebp-014h], 0FFFFFFBFh
.35:
        fild dword [byte ebp-014h]
        jmp short .32
.36:
        cmp dword [byte ebp-01Ch], 0FFFFFC50h
        jge near .48
        test ebx, ebx
        je short .37
        mov dword [byte ebp-08h], 76h
        jmp short .38
.37:
        mov dword [byte ebp-08h], 0FFFFFF8Ah
.38:
        fild dword [byte ebp-08h]
        jmp short .32
.39:
        cmp dword [byte ebp-01Ch], 0FFFFFE30h
        jge short .45
        cmp dword [byte ebp-01Ch], 0FFFFFC50h
        jge short .42
        test ebx, ebx
        je short .40
        mov dword [byte ebp-010h], 76h
        jmp short .41
.40:
        mov dword [byte ebp-010h], 0FFFFFF8Ah
.41:
        fild dword [byte ebp-010h]
        jmp near .32
.42:
        test ebx, ebx
        je short .43
        mov dword [byte ebp-018h], 73h
        jmp short .44
.43:
        mov dword [byte ebp-018h], 0FFFFFF8Dh
.44:
        fild dword [byte ebp-018h]
        jmp near .32
.45:
        cmp dword [byte ebp-01Ch], 3B0h
        jle short .48
        test ebx, ebx
        je short .46
        mov dword [byte ebp-0Ch], 3Eh
        jmp short .47
.46:
        mov dword [byte ebp-0Ch], 0FFFFFFC2h
.47:
        fild dword [byte ebp-0Ch]
        jmp near .32
.48:
        push eax
        push edx
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosX], eax
.49:
        mov eax, dword [CamAimDist]
        sub dword [CamAimY], eax
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        mov ebx, dword [CamAimX]
        push eax
CamView236_403:
        sub ebx, dword [CamPosZ]
        push ebx
.50:
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosY], eax
        cmp eax, 0FFFFE7D3h
        jge near CamView236_1E7.25
        mov dword [CamPosY], 0FFFFE7D3h
        jmp near CamShot242_278
;-----------------------------------------------------------------------------
; CamView238                                   5F40A  96 PC, medium confidence
; Camera shot handler, record text 238h (view kind 5)
;-----------------------------------------------------------------------------
CamView238:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 24h, 0
        lea edi, [byte ebp-024h]
        mov esi, CamAimX
        call CameraTrackPuck
        call CameraLeadOffset
        movsd
        movsd
        movsd
        mov edx, dword [InReplay]
        mov eax, dword [CamAimDist]
        and edx, 200h
        add dword [CamAimY], eax
        or edx, dword [CamViewBits]
        je short .1
        mov dword [CamPosZ], 550h
        jmp short .2
.1:
        mov dword [CamPosZ], 0FFFFFAB0h
.2:
        mov dword [CamDistance], 320h
        mov dword [CamMatrix], 0
        call CameraAim
        imul eax, dword [CamFocusObj], dword 0A0h
        add eax, SortCords
        mov al, byte [byte eax+044h]
        and al, 80h
        mov ebx, dword [CamAimX]
        movzx ecx, al
        mov eax, dword [CamAimY]
        sub ebx, dword [CamPosZ]
        sub eax, dword [CamMatrix]
        test ecx, ecx
        je near .12
        cmp dword [byte ebp-01Ch], 1D0h
        jle short .9
        cmp dword [byte ebp-01Ch], 3B0h
        jle short .6
        test edx, edx
        je short .3
        mov dword [byte ebp-04h], 34h
        jmp short .4
.3:
        mov dword [byte ebp-04h], 0FFFFFFCCh
.4:
        fild dword [byte ebp-04h]
.5:
        fmul qword [F64_0p00277778_CamView238]
        fmul qword [F64_65536_CamView238]
        call __CHP
        fistp dword [CamPosX]
        jmp near .22
.6:
        test edx, edx
        je short .7
        mov dword [byte ebp-014h], 37h
        jmp short .8
.7:
        mov dword [byte ebp-014h], 0FFFFFFC9h
.8:
        fild dword [byte ebp-014h]
        jmp short .5
.9:
        cmp dword [byte ebp-01Ch], 0FFFFFC50h
        jge near .21
        test edx, edx
        je short .10
        mov dword [byte ebp-08h], 80h
        jmp short .11
.10:
        mov dword [byte ebp-08h], 0FFFFFF80h
.11:
        fild dword [byte ebp-08h]
        jmp short .5
.12:
        cmp dword [byte ebp-01Ch], 0FFFFFE30h
        jge short .18
        cmp dword [byte ebp-01Ch], 0FFFFFC50h
        jge short .15
        test edx, edx
        je short .13
        mov dword [byte ebp-010h], 80h
        jmp short .14
.13:
        mov dword [byte ebp-010h], 0FFFFFF80h
.14:
        fild dword [byte ebp-010h]
        jmp near .5
.15:
        test edx, edx
        je short .16
        mov dword [byte ebp-018h], 7Dh
        jmp short .17
.16:
        mov dword [byte ebp-018h], 0FFFFFF83h
.17:
        fild dword [byte ebp-018h]
        jmp near .5
.18:
        cmp dword [byte ebp-01Ch], 3B0h
        jle short .21
        test edx, edx
        je short .19
        mov dword [byte ebp-0Ch], 34h
        jmp short .20
.19:
        mov dword [byte ebp-0Ch], 0FFFFFFCCh
.20:
        fild dword [byte ebp-0Ch]
        jmp near .5
.21:
        push eax
        push ebx
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosX], eax
.22:
        mov eax, dword [CamAimDist]
        sub dword [CamAimY], eax
        mov edx, dword [CamAimY]
        sub edx, dword [CamMatrix]
        push edx
        mov edx, dword [CamAimX]
        jmp near CamView236_1E7
;-----------------------------------------------------------------------------
; CamView239                                   5F5D3  96 PC, medium confidence
; Camera shot handler, record text 239h (view kind 5)
;-----------------------------------------------------------------------------
CamView239:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 24h, 0
        lea edi, [byte ebp-024h]
        mov esi, CamAimX
        call CameraTrackPuck
        call CameraLeadOffset
        movsd
        movsd
        movsd
        mov ebx, dword [InReplay]
        mov eax, dword [CamAimDist]
        and ebx, 200h
        add dword [CamAimY], eax
        or ebx, dword [CamViewBits]
        je short .1
        mov dword [CamPosZ], 550h
        jmp short .2
.1:
        mov dword [CamPosZ], 0FFFFFAB0h
.2:
        mov dword [CamDistance], 320h
        mov dword [CamMatrix], 0
        mov edx, 258h
        call CameraAim
        mov eax, 320h
        call CameraNearNet
        imul eax, dword [CamFocusObj], dword 0A0h
        add eax, SortCords
        mov al, byte [byte eax+044h]
        and al, 80h
        mov edx, dword [CamAimX]
        movzx ecx, al
        mov eax, dword [CamAimY]
        sub edx, dword [CamPosZ]
        sub eax, dword [CamMatrix]
        test ecx, ecx
        je near .12
        cmp dword [byte ebp-01Ch], 1D0h
        jle short .9
        cmp dword [byte ebp-01Ch], 3B0h
        jle short .6
        test ebx, ebx
        je short .3
        mov dword [byte ebp-04h], 34h
        jmp short .4
.3:
        mov dword [byte ebp-04h], 0FFFFFFCCh
.4:
        fild dword [byte ebp-04h]
.5:
        fmul qword [F64_0p00277778_CamView239]
        fmul qword [F64_65536_CamView239]
        call __CHP
        fistp dword [CamPosX]
        jmp near .22
.6:
        test ebx, ebx
        je short .7
        mov dword [byte ebp-014h], 37h
        jmp short .8
.7:
        mov dword [byte ebp-014h], 0FFFFFFC9h
.8:
        fild dword [byte ebp-014h]
        jmp short .5
.9:
        cmp dword [byte ebp-01Ch], 0FFFFFC50h
        jge near .21
        test ebx, ebx
        je short .10
        mov dword [byte ebp-08h], 80h
        jmp short .11
.10:
        mov dword [byte ebp-08h], 0FFFFFF80h
.11:
        fild dword [byte ebp-08h]
        jmp short .5
.12:
        cmp dword [byte ebp-01Ch], 0FFFFFE30h
        jge short .18
        cmp dword [byte ebp-01Ch], 0FFFFFC50h
        jge short .15
        test ebx, ebx
        je short .13
        mov dword [byte ebp-010h], 80h
        jmp short .14
.13:
        mov dword [byte ebp-010h], 0FFFFFF80h
.14:
        fild dword [byte ebp-010h]
        jmp near .5
.15:
        test ebx, ebx
        je short .16
        mov dword [byte ebp-018h], 7Dh
        jmp short .17
.16:
        mov dword [byte ebp-018h], 0FFFFFF83h
.17:
        fild dword [byte ebp-018h]
        jmp near .5
.18:
        cmp dword [byte ebp-01Ch], 3B0h
        jle short .21
        test ebx, ebx
        je short .19
        mov dword [byte ebp-0Ch], 34h
        jmp short .20
.19:
        mov dword [byte ebp-0Ch], 0FFFFFFCCh
.20:
        fild dword [byte ebp-0Ch]
        jmp near .5
.21:
        push eax
        push edx
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosX], eax
.22:
        mov eax, dword [CamAimDist]
        sub dword [CamAimY], eax
        mov ebx, dword [CamAimY]
        sub ebx, dword [CamMatrix]
        push ebx
        mov ebx, dword [CamAimX]
        jmp near CamView236_403
;-----------------------------------------------------------------------------
; CamView23A                                   5F7AB  96 PC, medium confidence
; Camera shot handler, record text 23Ah (view kind 6)
;-----------------------------------------------------------------------------
CamView23A:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        call CameraTrackPuck
        call CameraLeadOffset
        imul edx, dword [CamFocusObj], dword 0A0h
        mov eax, dword [CamAimDist]
        xor esi, esi
        xor edi, edi
        add dword [CamAimY], eax
        mov eax, dword [InReplay]
        mov ebx, dword [CamAimY]
        and eax, 200h
        sub ebx, dword [CamAimDist]
        or eax, dword [CamViewBits]
        add edx, SortCords
        cmp ebx, 0FFFFFE30h
        jle near .7
        cmp ebx, 1D0h
        jge short .7
        cmp dword [CamFixedObj], byte 0
        jne short .2
        cmp dword [CamAimX], byte 0
        jge short .1
        mov dword [CamFixedObj], 0FFFFFFFFh
        jmp short .2
.1:
        mov dword [CamFixedObj], 1
.2:
        cmp dword [CamFixedObj], byte 0
        jge short .3
        test eax, eax
        je short .4
        mov eax, 0FFFFFAB0h
        jmp short .6
.3:
        test eax, eax
        je short .5
.4:
        mov eax, 550h
        jmp short .6
.5:
        mov eax, 0FFFFFAB0h
.6:
        mov dword [CamPosZ], eax
        mov dword [CamDistance], 320h
        jmp near .32
.7:
        mov ebx, dword [CamAimY]
        sub ebx, dword [CamAimDist]
        cmp ebx, 1D0h
        jl near .19
        mov dl, byte [byte edx+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        je near .12
        mov eax, dword [CamAimX]
        mov dword [CamDistance], 1F4h
        mov dword [CamPosZ], eax
        cmp eax, 0FFFFFEE8h
        jge short .8
        mov dword [CamPosZ], 0FFFFFEE8h
        jmp short .9
.8:
        cmp eax, 118h
        jle short .9
        mov dword [CamPosZ], 118h
.9:
        mov eax, dword [CamAimY]
        sub eax, 49Ch
        mov dword [CamMatrix], eax
        cmp eax, 0FFFFF768h
        jge short .10
        mov dword [CamMatrix], 0FFFFF768h
        jmp short .11
.10:
        cmp eax, 0FFFFFF00h
        jle short .11
        mov dword [CamMatrix], 0FFFFFF00h
.11:
        mov edi, 0FFFFED83h
        mov dword [CamFixedObj], 0
        mov esi, edi
        jmp near .33
.12:
        mov dword [CamDistance], 4B0h
        cmp dword [CamFixedObj], byte 0
        jne short .14
        cmp dword [CamAimX], byte 0
        jge short .13
        mov dword [CamFixedObj], 0FFFFFFFFh
        jmp short .14
.13:
        mov dword [CamFixedObj], 1
.14:
        cmp dword [CamFixedObj], byte 0
        jge short .15
        test eax, eax
        je short .16
        mov eax, 0FFFFFAB0h
        jmp short .18
.15:
        test eax, eax
        je short .17
.16:
        mov eax, 550h
        jmp short .18
.17:
        mov eax, 0FFFFFAB0h
.18:
        mov dword [CamPosZ], eax
        jmp near .32
.19:
        mov dl, byte [byte edx+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne near .23
        mov eax, dword [CamAimX]
        mov dword [CamDistance], 1F4h
        mov dword [CamPosZ], eax
        cmp eax, 0FFFFFEE8h
        jge short .20
        mov dword [CamPosZ], 0FFFFFEE8h
        jmp short .21
.20:
        cmp eax, 118h
        jle short .21
        mov dword [CamPosZ], 118h
.21:
        mov eax, dword [CamAimY]
        add eax, 49Ch
        mov dword [CamMatrix], eax
        cmp eax, 100h
        jge short .22
        mov dword [CamMatrix], 100h
        jmp near .11
.22:
        cmp eax, 898h
        jle near .11
        mov dword [CamMatrix], 898h
        jmp near .11
.23:
        test eax, eax
        je short .24
        mov edx, 550h
        jmp short .25
.24:
        mov edx, 0FFFFFAB0h
.25:
        mov dword [CamDistance], 4B0h
        mov dword [CamPosZ], edx
        cmp dword [CamFixedObj], byte 0
        jne short .27
        cmp dword [CamAimX], byte 0
        jge short .26
        mov dword [CamFixedObj], 0FFFFFFFFh
        jmp short .27
.26:
        mov dword [CamFixedObj], 1
.27:
        cmp dword [CamFixedObj], byte 0
        jge short .28
        test eax, eax
        je short .29
        mov eax, 0FFFFFAB0h
        jmp short .31
.28:
        test eax, eax
        je short .30
.29:
        mov eax, 550h
        jmp short .31
.30:
        mov eax, 0FFFFFAB0h
.31:
        mov dword [CamPosZ], eax
.32:
        mov dword [CamMatrix], 0
.33:
        call CameraAim
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        neg eax
        mov dword [CamPosX], eax
        mov eax, dword [CamAimY]
        add esp, byte 8
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosY], eax
        test esi, esi
        je near CamShot242_279
        cmp eax, esi
        jge short .34
        mov dword [CamPosY], esi
        jmp near CamShot242_279
.34:
        cmp eax, edi
        jle near CamShot242_279
        mov dword [CamPosY], edi
        jmp near CamShot242_279
;-----------------------------------------------------------------------------
; CamShot23E                                   5FB02  96 PC, medium confidence
; Cut-scene shot handler, record text 23Eh (view kind 0Ah)
;-----------------------------------------------------------------------------
CamShot23E:
        push ebx
        push ecx
        push edx
        call CameraTrackPuck
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        mov dword [CamPosY], eax
        mov eax, dword [CamAimY]
        add esp, byte 8
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosX], eax
        cmp dword [CamPosY], 0FFFFE38Fh
        jge short .1
        mov dword [CamPosY], 0FFFFE38Fh
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        cmp dword [CamPosY], byte 0
        jle short .2
        mov dword [CamPosY], 0
.2:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamShot23F                                      5FB98  96 PC, low confidence
; Cut-scene shot handler of record CameraViewTable+40Bh
;-----------------------------------------------------------------------------
CamShot23F:
        push ebx
        push ecx
        push edx
        call CameraTrackPuck
        mov eax, dword [InReplay]
        mov dword [CamPosZ], 0
        and eax, 200h
        mov dword [CamDistance], 8Ch
        or eax, dword [CamViewBits]
        je short .1
        mov dword [CamMatrix], 708h
        jmp short CamShot23F_44
.1:
        mov dword [CamMatrix], 0FFFFF8F8h
CamShot23F_44:
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        mov dword [CamPosY], eax
        mov eax, dword [CamAimY]
        add esp, byte 8
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosX], eax
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamShot240                                      5FC3D  96 PC, low confidence
; Cut-scene shot handler of record CameraViewTable+450h; its tail CamShot240_56 is text
; 241h's (view kind 0Ch)
;-----------------------------------------------------------------------------
CamShot240:
        push ebx
        push ecx
        push edx
        call CameraTrackPuck
        mov eax, dword [InReplay]
        and eax, 200h
        mov dword [CamDistance], 50h
        or eax, dword [CamViewBits]
        je short .1
        mov dword [CamPosZ], 0FFFFFFE4h
        mov dword [CamMatrix], 590h
        jmp near CamShot23F_44
.1:
        mov dword [CamPosZ], 1Ch
        mov dword [CamMatrix], 0FFFFFA70h
        jmp near CamShot23F_44
CamShot240_56:
        push edx
        cmp dword [penshotlive], byte 0
        jne short .2
        cmp dword [penshotstart], byte 0
        je short .2
        mov eax, 1
        call EndCameraShot
.2:
        imul edx, dword [CamTargetObj], dword 0A0h
        add edx, SortCords
        cmp dword [penshotmode], byte 0
        je short .3
        cmp dword [penshotlive], byte 0
        jne short .3
        mov dword [CamAimY], 0
        mov dword [CamAimX], 0
        jmp short .4
.3:
        call CameraTrackPuck
.4:
        mov dl, byte [byte edx+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        je short .5
        mov edx, dword [CamAimY]
        sub edx, 294h
        mov dword [CamPosX], 0
        jmp short .6
.5:
        mov edx, dword [CamAimY]
        add edx, 294h
        mov dword [CamPosX], 8000h
.6:
        mov dword [CamMatrix], edx
        mov edx, dword [CamAimX]
        mov dword [CamDistance], 1F4h
        mov dword [CamPosZ], edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; CamShot242                                   5FD46  96 PC, medium confidence
; Cut-scene shot handler, record text 242h (view kind 0Dh); its tail
; CamShot242_126 is text 243h's
;-----------------------------------------------------------------------------
CamShot242:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 3Ch, 0
        lea edi, [byte ebp-0Ch]
        mov esi, ShotFromZeroVec
        movsd
        movsd
        movsd
        cmp dword [CamShotFromObj], byte 0FFFFFFFFh
        jne short .1
        call GetTicks
        mov dword [CamShotFromObj], eax
        imul eax, dword [CamShotObj], dword 0A0h
        mov al, byte [dword eax+SortCords+47h]
        mov byte [CamShotPhase], al
.1:
        call GetTicks
        sub eax, dword [CamShotFromObj]
        cmp eax, 320h
        jge short .2
        cmp dword [CamShotTimer], byte 1Eh
        je short .2
        imul eax, dword [CamTargetObj], dword 0A0h
        mov al, byte [dword eax+SortCords+47h]
        cmp al, byte [CamShotPhase]
        je short .3
.2:
        mov eax, 4
        call EndCameraShot
        mov dword [CamShotFromObj], 0FFFFFFFFh
.3:
        call CameraTrackPuck
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        neg eax
        sub eax, 71Ch
        add esp, byte 8
        cmp eax, 0FFFF8000h
        jge short .4
        add eax, 10000h
.4:
        neg eax
        push eax
        lea eax, [byte ebp-03Ch]
        push eax
        mov dword [byte ebp-04h], 2A8h
        call MakeRotYMatrix
        add esp, byte 8
        lea eax, [byte ebp-018h]
        push eax
        lea eax, [byte ebp-03Ch]
        push eax
        lea eax, [byte ebp-0Ch]
        push eax
        call TransformVector
        mov eax, dword [CamAimX]
        sub eax, dword [byte ebp-018h]
        mov dword [CamPosZ], eax
        mov eax, dword [CamAimY]
        sub eax, dword [byte ebp-010h]
        mov dword [CamMatrix], eax
        mov eax, dword [CamAimY]
        add esp, byte 0Ch
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        mov dword [CamDistance], 190h
        jmp near CamShot242_209.8
CamShot242_126:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 3Ch, 0
        lea edi, [byte ebp-018h]
        mov esi, ShotToZeroVec
        movsd
        movsd
        movsd
        cmp dword [CamShotToObj], byte 0FFFFFFFFh
        jne short .5
        call GetTicks
        mov dword [CamShotToObj], eax
.5:
        call GetTicks
        sub eax, dword [CamShotToObj]
        cmp eax, 320h
        jl short .6
        mov dword [CamShotToObj], 0FFFFFFFFh
        cmp dword [CameraShotOn], byte 0
        je short .6
        mov eax, 3
        call EndCameraShot
.6:
        mov dword [CamAimY], 0
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        mov dword [CamAimX], 0
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        mov dword [CamAimShift], 0
        call AngleOfVector
        neg eax
        sub eax, 71Ch
        add esp, byte 8
        cmp eax, 0FFFF8000h
        jge short .7
        add eax, 10000h
.7:
        neg eax
        push eax
        lea eax, [byte ebp-03Ch]
        push eax
        mov dword [byte ebp-010h], 438h
        call MakeRotYMatrix
        add esp, byte 8
        lea eax, [byte ebp-0Ch]
        push eax
        lea eax, [byte ebp-03Ch]
        push eax
        lea eax, [byte ebp-018h]
        push eax
        call TransformVector
        mov eax, dword [CamAimX]
        sub eax, dword [byte ebp-0Ch]
        mov dword [CamPosZ], eax
        mov eax, dword [CamAimY]
        sub eax, dword [byte ebp-04h]
CamShot242_209:
        mov dword [CamMatrix], eax
        mov eax, dword [CamAimY]
        add esp, byte 0Ch
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        mov dword [CamDistance], 0C8h
.8:
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        mov dword [CamPosY], eax
        mov eax, dword [CamAimY]
        add esp, byte 8
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
CamShot242_269:
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosX], eax
CamShot242_278:
        leave
CamShot242_279:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamShot245                                   5FFC5  96 PC, medium confidence
; Cut-scene shot handler, record text 245h (view kind 10h)
;-----------------------------------------------------------------------------
CamShot245:
        push edx
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        test eax, eax
        jne short .1
        mov eax, 2
        call EndCameraShot
        pop edx
        ret
.1:
        mov eax, dword [PtrRefObject]
        movsx edx, word [byte eax+026h]
        cmp edx, 12Ch
        jne short .2
        movsx eax, word [byte eax+02Eh]
        jmp short .3
.2:
        movsx eax, word [dword eax+086h]
.3:
        mov dword [CamTargetObj], eax
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [CamAimDist]
        add dword [CamAimY], eax
        mov eax, dword [CamAimX]
        mov dword [CamPosZ], eax
        cmp eax, 0FFFFFE98h
        jge short .4
        mov dword [CamPosZ], 0FFFFFE98h
        jmp short .5
.4:
        cmp eax, 168h
        jle short .5
        mov dword [CamPosZ], 168h
.5:
        mov eax, dword [CamAimY]
        sub eax, 424h
        mov dword [CamDistance], 1F4h
        mov dword [CamMatrix], eax
        cmp eax, 0FFFFF7E0h
        jge short .6
        mov dword [CamMatrix], 0FFFFF7E0h
        jmp short .7
.6:
        test eax, eax
        jle short .7
        mov dword [CamMatrix], 0
.7:
        mov dword [CamPosX], 0
        mov dword [CamPosY], 0FFFFEAABh
        pop edx
        ret
;-----------------------------------------------------------------------------
; CamShot246                                   60096  96 PC, medium confidence
; Cut-scene shot handler, record text 246h (view kind 11h)
;-----------------------------------------------------------------------------
CamShot246:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 3Ch, 0
        lea edi, [byte ebp-0Ch]
        mov esi, ShotNearZeroVec
        movsd
        movsd
        movsd
        cmp dword [CamShotNearObj], byte 0FFFFFFFFh
        jne short .1
        call GetTicks
        mov dword [CamShotNearObj], eax
.1:
        call GetTicks
        sub eax, dword [CamShotNearObj]
        cmp eax, 1F4h
        jge short .2
        cmp dword [CamShotTimer], byte 1Eh
        jne short .3
.2:
        mov eax, 6
        mov dword [CamShotNearObj], 0FFFFFFFFh
        call EndCameraShot
.3:
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [CamAimY]
        sub eax, dword [CamPathActive]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPathState]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        neg eax
        push eax
        lea eax, [byte ebp-03Ch]
        push eax
        mov dword [byte ebp-04h], 2A8h
        call MakeRotYMatrix
        add esp, byte 8
        lea eax, [byte ebp-018h]
        push eax
        lea eax, [byte ebp-03Ch]
        push eax
        lea eax, [byte ebp-0Ch]
        push eax
        call TransformVector
        mov eax, dword [CamAimX]
        sub eax, dword [byte ebp-018h]
        mov dword [CamPosZ], eax
        mov eax, dword [CamAimY]
        sub eax, dword [byte ebp-010h]
        jmp near CamShot242_209
;-----------------------------------------------------------------------------
; CamShot247                                   60159  96 PC, medium confidence
; Cut-scene shot handler, record text 247h (view kind 12h)
;-----------------------------------------------------------------------------
CamShot247:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 60h, 0
        lea edi, [byte ebp-030h]
        mov esi, CamTargetZeroVec
        movsd
        movsd
        movsd
        imul eax, dword [CamTargetObj], dword 0A0h
        mov edx, SortCords
        mov ebx, dword [dword eax+SortCords]
        add edx, eax
        mov eax, dword [dword eax+SortCords+4]
        sar eax, 0Eh
        mov dword [byte ebp-01Ch], eax
        movsx eax, word [byte edx+014h]
        imul eax, dword 0A0h
        mov edx, dword [dword eax+SortCords]
        mov eax, dword [dword eax+SortCords+4]
        sar eax, 0Eh
        sar ebx, 0Eh
        mov dword [byte ebp-010h], eax
        sub eax, dword [byte ebp-01Ch]
        sar edx, 0Eh
        push eax
        mov eax, edx
        sub eax, ebx
        push eax
        mov dword [byte ebp-024h], ebx
        mov dword [byte ebp-018h], edx
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov edx, eax
        cmp dword [CamPosX], 0FFFFC000h
        jl short .2
        cmp dword [CamPosX], 4000h
        jg short .2
        test eax, eax
        jl short .1
        cmp eax, 8000h
        jle short .3
.1:
        add eax, 4000h
        jmp short .4
.2:
        test eax, eax
        jl short .3
        cmp eax, 8000h
        jle short .1
.3:
        sub eax, 4000h
.4:
        mov edx, dword [byte ebp-024h]
        add edx, dword [byte ebp-018h]
        neg eax
        sar edx, 1
        push eax
        mov dword [byte ebp-0Ch], edx
        mov edx, dword [byte ebp-01Ch]
        lea eax, [byte ebp-060h]
        add edx, dword [byte ebp-010h]
        push eax
        sar edx, 1
        mov dword [byte ebp-028h], 2A8h
        mov dword [byte ebp-04h], edx
        call MakeRotYMatrix
        add esp, byte 8
        lea eax, [byte ebp-03Ch]
        push eax
        lea eax, [byte ebp-060h]
        push eax
        lea eax, [byte ebp-030h]
        push eax
        call TransformVector
        mov eax, dword [byte ebp-0Ch]
        sub eax, dword [byte ebp-03Ch]
        mov dword [CamPosZ], eax
        mov eax, dword [byte ebp-04h]
        sub eax, dword [byte ebp-034h]
        mov dword [CamMatrix], eax
        mov eax, dword [byte ebp-04h]
        add esp, byte 0Ch
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [byte ebp-0Ch]
        sub eax, dword [CamPosZ]
        push eax
        mov dword [CamDistance], 190h
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        mov dword [CamPosY], eax
        mov eax, dword [byte ebp-04h]
        add esp, byte 8
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [byte ebp-0Ch]
        sub eax, dword [CamPosZ]
        push eax
        mov dword [byte ebp-08h], 0
        jmp near CamShot242_269
;-----------------------------------------------------------------------------
; CamShot244                                   602B9  96 PC, medium confidence
; Cut-scene shot handler, record text 244h (view kind 0Fh)
;-----------------------------------------------------------------------------
CamShot244:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 84h, 0
        mov ecx, 21h
        lea edi, [dword ebp-084h]
        mov esi, CamShotPositions
        rep movsd
        mov byte [ScoreClockOn], 1
        mov al, byte [StandsOn]
        mov dword [CamNearNet], 1
        mov byte [RinkBoardsOn], al
        cmp dword [CamShotId], byte 0Ah
        jge short .2
        inc dword [CamShotId]
        imul esi, dword [CamShotId], byte 0Ch
        mov edi, CamPosZ
        lea esi, [dword esi+ebp-084h]
        movsd
        movsd
        movsd
        mov dword [CamAimY], 0
        mov dword [CamAimX], 0
        cmp dword [CamShotId], byte 7
        jl short .1
        mov dword [CamAimShift], 0
        jmp short .3
.1:
        mov eax, dword [CamDistance]
        sub eax, 578h
        mov dword [CamAimShift], eax
        jmp short .4
.2:
        mov dword [CamAimShift], 0
        mov dword [CamAimX], 0
.3:
        mov dword [CamAimY], 1D0h
.4:
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        mov eax, dword [CamDistance]
        sub eax, dword [CamAimShift]
        push eax
        call AngleOfVector
        neg eax
        mov dword [CamPosY], eax
        mov eax, dword [CamAimY]
        add esp, byte 8
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [CamPosX], eax
        cmp dword [DemoMode], byte 0
        je near CamShot242_278
        mov dword [CamShakeStart], 0FFFFFFFFh
        mov esi, 5
        call rand_
        cdq
        idiv esi
        inc edx
        mov dword [CamShakeCount], edx
        jmp near CamShot242_278
;-----------------------------------------------------------------------------
; CamShot23D                                   603FF  96 PC, medium confidence
; Cut-scene shot handler, record text 23Dh (view kind 9): queues an overlay
; panel
;-----------------------------------------------------------------------------
CamShot23D:
        push ebx
        push ecx
        push edx
        cmp byte [PenBuf], 0
        jne short .1
        mov eax, 5
        mov ecx, 0FFFFFFFFh
        call EndCameraShot
        mov eax, 2
        mov ebx, ecx
        mov edx, ecx
        call QueueOverlayPanel
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamShot23B                                   6042C  96 PC, medium confidence
; Cut-scene shot handler, record text 23Bh (view kind 0Bh)
;-----------------------------------------------------------------------------
CamShot23B:
        push ebx
        push ecx
        push edx
        cmp dword [CamDistance], 0B40h
        je near CamShot23B_B3.6
        mov dword [CamPosZ], 0AA0h
        mov dword [CamDistance], 0B40h
        mov dword [CamMatrix], 0C80h
        cmp dword [CamPathState], byte 0
        jge short .2
        cmp dword [CamPathActive], byte 0
        jge short .1
        mov dword [CamMatrix], 0FFFFF380h
.1:
        neg dword [CamPosZ]
        jmp short .3
.2:
        cmp dword [CamPathActive], byte 0
        jge short .3
        mov dword [CamMatrix], 0FFFFF380h
.3:
        cmp dword [CamPosZ], byte 0
        jge short .4
        mov dword [CamAimX], 2A8h
        jmp short .5
.4:
        mov dword [CamAimX], 0FFFFFD58h
.5:
        mov dword [CamAimY], 0
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        mov dword [CamAimShift], 4B0h
CamShot23B_B3:
        call vecdist
        add esp, byte 8
        push eax
        push dword [CamDistance]
        call AngleOfVector
        neg eax
        mov dword [CamPosY], eax
        mov eax, dword [CamAimY]
        add esp, byte 8
        sub eax, dword [CamMatrix]
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        call AngleOfVector
        mov byte [ScoreClockOn], 1
        neg eax
        mov dword [CamNearNet], 1
        mov dword [CamPosX], eax
        mov al, byte [StandsOn]
        add esp, byte 8
        mov byte [RinkBoardsOn], al
.6:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamShot23C                                   60543  96 PC, medium confidence
; Cut-scene shot handler, record text 23Ch (view kind 13h): dims the view
; (BuildShadeLut)
;-----------------------------------------------------------------------------
CamShot23C:
        push ebx
        push ecx
        push edx
        cmp dword [ViewBrightness], 4000h
        je short .1
        mov edx, TeamRosterPtrs+320h
        mov eax, 4000h
        mov dword [ViewBrightness], 4000h
        call BuildShadeLut
.1:
        mov dword [CamPosZ], 2A8h
        mov dword [CamDistance], 1B8h
        mov dword [CamMatrix], 0FFFFF8F8h
        cmp dword [CamPathState], byte 0
        jge short .2
        mov dword [CamPosZ], 0FFFFFD58h
.2:
        cmp dword [CamPathActive], byte 0
        jle short .3
        neg dword [CamMatrix]
.3:
        mov dword [CamAimY], 0
        mov eax, dword [CamAimY]
        sub eax, dword [CamMatrix]
        mov dword [CamAimX], 0
        push eax
        mov eax, dword [CamAimX]
        sub eax, dword [CamPosZ]
        push eax
        mov dword [CamAimShift], 0
        jmp near CamShot23B_B3
        push ebx
        push ecx
        push esi
        push edi
        mov ebx, dword [CamShotSaved]
        cmp ebx, dword [byte eax+05h]
        jne short .4
        mov eax, dword [CamShotTime]
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
.4:
        cmp dword [CameraShotOn], byte 0
        jne short .5
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.5:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        test edx, edx
        je short .6
        mov edi, CamPosZ
        mov esi, CamPathState
        movsd
        movsd
        movsd
        mov edi, CamPosX
        mov esi, CamAngle
        movsd
        movsd
.6:
        call CameraPathDerivs
        mov dword [CamPathPos], 2A00h
        xor eax, eax
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        push esi
        push edi
        cmp dword [CameraShotOn], byte 0
        je short .7
        mov eax, dword [CameraShotState]
        mov dword [CamShotKeys], eax
        mov al, byte [CameraShotState+4]
        mov edi, CamPosZ
        mov byte [CamShotMode], al
        mov eax, dword [CameraShotState+5]
        mov esi, CamPathState
        mov dword [CamShotSaved], eax
        movsd
        movsd
        movsd
        mov edi, CamPosX
        mov esi, CamAngle
        movsd
        movsd
        mov dword [CameraShotOn], 0
        call dword [CamShotSaved]
.7:
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; CloseTextOverlay                             606B9  95 PC, medium confidence
; Ovltimer: 100h (fully shown) -> 10h (start sliding out), else 0
;-----------------------------------------------------------------------------
CloseTextOverlay:
        push ebx
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov edi, eax
        mov dword [byte ebp-08h], edx
        mov eax, dword [nosplit eax*4+str_C_CloseTextOverlay]
        mov dword [byte ebp-04h], eax
        mov esi, dword [CamFollowObj]
        mov edx, dword [byte ebp-04h]
.1:
        cmp dword [byte esi+0Dh], byte 0
        je short .2
        mov eax, dword [byte esi+0Dh]
        cmp edx, dword [byte eax+08h]
        jg short .2
        mov esi, eax
        jmp short .1
.2:
        push byte 20h
        push byte 11h
        mov eax, dword [byte esi+0Dh]
        push str_Priority2
        mov dword [byte ebp-0Ch], eax
        call AllocMemBlock
        mov dword [byte esi+0Dh], eax
        mov esi, eax
        mov dword [eax], edi
        mov eax, dword [byte ebp-08h]
        mov dword [byte esi+04h], eax
        mov eax, dword [byte ebp-04h]
        mov dword [byte esi+08h], eax
        mov eax, dword [byte ebp-0Ch]
        add esp, byte 0Ch
        mov dword [byte esi+0Dh], eax
        cmp edi, byte 8
        jne near CameraNearNet_12E
        mov dword [CamShotId], 0FFFFFFFFh
        mov dword [CameraViewTable+575h], 0
        mov dword [CameraViewTable+579h], 0BB8h
        mov dword [CameraViewTable+57Dh], 0FFFFF060h
        mov eax, dword [GsOptions]
        mov dword [CameraViewTable+56Dh], 0
        and eax, byte 1
        mov dword [CameraViewTable+571h], 0FFFFE38Fh
        mov byte [RinkBoardsOn], al
        mov byte [StandsOn], al
        jmp near CameraNearNet_12E
;-----------------------------------------------------------------------------
; EndCameraShot                                60777  96 PC, medium confidence
; (shot): takes a cut-scene shot off the shot list (CamFollowObj) and returns
; to the saved camera
;-----------------------------------------------------------------------------
EndCameraShot:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        push eax
        mov eax, dword [CamFollowObj]
.1:
        cmp dword [byte eax+0Dh], byte 0
        je near CamShot242_278
        mov edx, dword [byte eax+0Dh]
        mov ebx, dword [edx]
        cmp ebx, dword [byte ebp-04h]
        jne near .3
        mov ebx, dword [byte edx+0Dh]
        push edx
        mov dword [byte eax+0Dh], ebx
        call FreeMemBlock
        add esp, byte 4
        cmp dword [CameraShotOn], byte 0
        je short .2
        mov eax, dword [CameraShotState]
        mov dword [CamShotKeys], eax
        mov al, byte [CameraShotState+4]
        mov edi, CamPosZ
        mov byte [CamShotMode], al
        mov eax, dword [CameraShotState+5]
        mov esi, CamPathState
        mov dword [CamShotSaved], eax
        movsd
        movsd
        movsd
        mov edi, CamPosX
        mov esi, CamAngle
        movsd
        movsd
        mov dword [CameraShotOn], 0
        call dword [CamShotSaved]
.2:
        cmp dword [byte ebp-04h], byte 8
        jne near CamShot242_278
        mov dword [CamShotId], 0FFFFFFFFh
        mov byte [RinkBoardsOn], 0
        jmp near CamShot242_278
.3:
        mov eax, edx
        jmp near .1
;-----------------------------------------------------------------------------
; SetGameViewSize                              60823  96 PC, medium confidence
; Sets the game view rectangle (ViewTop-11B31C) for the view size option
; (ViewSizeStep) and resolution, clears the screen
;-----------------------------------------------------------------------------
SetGameViewSize:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 90h, 0
        mov ecx, 9
        lea edi, [byte ebp-024h]
        mov esi, unk_5D591_84
        rep movsd
        mov ecx, 9
        lea edi, [byte ebp-048h]
        mov esi, str_D_SetGameViewSize
        rep movsd
        mov ecx, 9
        lea edi, [byte ebp-06Ch]
        mov esi, ViewSizeWidths
        rep movsd
        mov ecx, 9
        lea edi, [dword ebp-090h]
        mov esi, ViewSizeHeights
        rep movsd
        mov eax, dword [ViewSizeStep]
        shl eax, 2
        test byte [GsOptions+1], 20h
        je short .1
        mov edx, dword [byte eax+ebp-06Ch]
        mov dword [ViewWidth], edx
        mov eax, dword [dword eax+ebp-090h]
        mov dword [ViewHeight], eax
        mov eax, edx
        mov edx, 140h
        sar eax, 1
        sub edx, eax
        mov eax, dword [ViewHeight]
        mov dword [ViewBitmap], edx
        mov edx, 0F0h
        sar eax, 1
        mov dword [ViewLeft], 140h
        sub edx, eax
        mov dword [str_D_DrawGameFrame], 0F0h
        jmp short .2
.1:
        mov edx, dword [byte eax+ebp-024h]
        mov dword [ViewWidth], edx
        mov eax, dword [byte eax+ebp-048h]
        mov dword [ViewHeight], eax
        mov eax, edx
        mov edx, 0A0h
        sar eax, 1
        sub edx, eax
        mov eax, dword [ViewHeight]
        mov dword [ViewBitmap], edx
        mov edx, 64h
        sar eax, 1
        mov dword [ViewLeft], 0A0h
        sub edx, eax
        mov dword [str_D_DrawGameFrame], 64h
.2:
        mov dword [ViewPixels], edx
        push dword [ViewHeight]
        push dword [ViewWidth]
        push byte 0
        push dword [ViewTop]
        call SetViewFov
        add esp, byte 10h
        call BuildPerspTable
        push dword [ViewPixels]
        push dword [ViewBitmap]
        call SetViewScreenOrigin
        add esp, byte 8
        push dword [ReplayRemoteShape]
        call SetDrawBitmap
        add esp, byte 4
        call FullViewClip
        push byte 0
        call ClearClipRect
        mov eax, dword [ViewPixels]
        add esp, byte 4
        add eax, dword [ViewHeight]
        push eax
        mov eax, dword [ViewBitmap]
        push dword [ViewPixels]
        add eax, dword [ViewWidth]
        push eax
        push dword [ViewBitmap]
        call SetClipWindow
        add esp, byte 10h
        call SetRinkClipWindow
        mov eax, dword [ViewSizeStep]
        and eax, byte 0Fh
        and dword [GsOptions], 0FFFC3FFFh
        shl eax, 0Eh
        or dword [GsOptions], eax
        jmp near CamShot242_278
jpt_609B6:
        dd ReadHotKeys_6FB
        dd ReadHotKeys_748
        dd ReadHotKeys_78C
        dd ReadHotKeys_7CF
;-----------------------------------------------------------------------------
; ReadHotKeys                                  609C6  95 PC, medium confidence
; Game hot keys: Esc (1), Ctrl+S (1Fh), Ctrl+M (32h), F1-F10 (3Bh-44h), Tab
; (0Fh), R (13h); edge-triggered against the last key (lasthotkey), a new key
; is returned with bit 80h set
;-----------------------------------------------------------------------------
ReadHotKeys:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push byte 1Dh
        call KeyIsDown
        add esp, byte 4
        test ax, ax
        je near .9
        call GetTicks
        cmp eax, dword [HotKeyStates]
        jle near .9
        push byte 2
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .1
        call GetTicks
        cmp eax, dword [HotKeyStates+4]
        jle short .1
        mov eax, dword [GsOptions]
        and eax, byte 1
        xor al, 1
        and eax, byte 1
        and byte [GsOptions], 0FEh
        mov byte [StandsOn], al
        or dword [GsOptions], eax
        call GetTicks
        add eax, byte 19h
        mov dword [HotKeyStates+4], eax
.1:
        push byte 3
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .2
        call GetTicks
        cmp eax, dword [HotKeyStates+8]
        jle short .2
        mov eax, dword [GsOptions]
        shl eax, 1Eh
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        lea edx, [eax+eax]
        and byte [GsOptions], 0FDh
        mov byte [IceLogosOn], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [HotKeyStates+8], eax
.2:
        push byte 4
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .3
        call GetTicks
        cmp eax, dword [HotKeyStates+0Ch]
        jle short .3
        mov eax, dword [GsOptions]
        shl eax, 1Dh
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 0FBh
        shl edx, 2
        mov byte [PlayerDetailOn], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [HotKeyStates+0Ch], eax
.3:
        push byte 5
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .4
        call GetTicks
        cmp eax, dword [HotKeyStates+10h]
        jle short .4
        mov eax, dword [GsOptions]
        shl eax, 1Ch
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 0F7h
        shl edx, 3
        mov byte [IceTextureOn], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [HotKeyStates+10h], eax
.4:
        push byte 6
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .5
        call GetTicks
        cmp eax, dword [HotKeyStates+14h]
        jle short .5
        mov eax, dword [GsOptions]
        shl eax, 1Bh
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 0EFh
        shl edx, 4
        mov byte [RinkFloorOn], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [HotKeyStates+14h], eax
.5:
        push byte 7
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .6
        call GetTicks
        cmp eax, dword [HotKeyStates+18h]
        jle short .6
        mov eax, dword [GsOptions]
        shl eax, 1Ah
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 0DFh
        shl edx, 5
        mov byte [GlassOn], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [HotKeyStates+18h], eax
.6:
        push byte 8
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .7
        call GetTicks
        cmp eax, dword [HotKeyStates+1Ch]
        jle short .7
        mov eax, dword [GsOptions]
        shl eax, 19h
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 0BFh
        shl edx, 6
        mov dword [ShowShadows], eax
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [HotKeyStates+1Ch], eax
.7:
        push byte 9
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .8
        call GetTicks
        cmp eax, dword [HotKeyStates+20h]
        jle short .8
        mov eax, dword [GsOptions]
        shl eax, 18h
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 7Fh
        shl edx, 7
        mov dword [ShowMarkers], eax
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [HotKeyStates+20h], eax
.8:
        push byte 0Ah
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .9
        call GetTicks
        cmp eax, dword [HotKeyStates+24h]
        jle short .9
        mov eax, dword [GsOptions]
        shl eax, 17h
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions+1], 0FEh
        shl edx, 8
        mov byte [BenchPlayersOn], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [HotKeyStates+24h], eax
.9:
        call KbdGetKey
        mov dl, byte [gmode]
        and dl, 80h
        movsx edx, dl
        test edx, edx
        jne near CamShot242_279
        cmp ax, 33h
        jb short .10
        jbe near .28
        cmp ax, 35h
        jb near .31
        jbe near .34
        cmp ax, 36h
        jbe near ReadHotKeys_7CF.39
        cmp ax, 3Dh
        je near .16
        jmp near CamShot242_279
.10:
        cmp ax, 30h
        jb short .11
        jbe short .12
        cmp ax, 31h
        jbe near .17
        jmp near .23
.11:
        cmp ax, 2Dh
        je near .14
        jmp near CamShot242_279
.12:
        call GetTicks
        cmp eax, dword [HotKeyStates+28h]
        jle near CamShot242_279
        push dword [ViewHeight]
        push dword [ViewWidth]
        push byte 0
        push dword [ViewTop]
        xor byte [CamViewBits], 1
        call SetViewFov
        add esp, byte 10h
        mov edi, CamPathTarget
        mov esi, CamShotKeys
        call BuildPerspTable
        mov ecx, 45h
        call dword [CamShotSaved]
        mov dword [CamPathPos], 0FFFFFFFFh
        rep movsb
        call CameraPathDerivs
        mov dword [CamPathPos], 0
        cmp dword [InReplay], byte 0
        je short .13
        mov ecx, 45h
        mov edi, ReplayCamShot
        mov esi, CamPathTarget
        rep movsb
.13:
        call GetTicks
        add eax, byte 19h
        mov dword [HotKeyStates+28h], eax
        jmp near CamShot242_279
.14:
        cmp dword [ViewSizeStep], byte 0
        jle near CamShot242_279
        dec dword [ViewSizeStep]
.15:
        call SetGameViewSize
        jmp near CamShot242_279
.16:
        cmp dword [ViewSizeStep], byte 8
        jge near CamShot242_279
        inc dword [ViewSizeStep]
        jmp short .15
.17:
        inc dword [ShadowToggle]
        cmp dword [ShadowToggle], byte 1
        jle short .18
        mov dword [ShadowToggle], edx
.18:
        cmp dword [ShadowToggle], byte 0
        jne short .19
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable
        cmp edx, dword [CameraViewTable+5]
        je near .21
        cmp dword [CameraShotOn], byte 0
        je short .20
        mov edx, dword [CameraViewTable]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+4]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+5]
        mov dword [CameraShotState+5], edx
        jmp short .20
.19:
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable+45h
        cmp edx, dword [CameraViewTable+4Ah]
        je short .21
        cmp dword [CameraShotOn], byte 0
        je short .20
        mov edx, dword [CameraViewTable+45h]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+49h]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+4Ah]
        mov dword [CameraShotState+5], edx
.20:
        mov edx, dword [eax]
        mov dword [CamShotKeys], edx
        mov dl, byte [byte eax+04h]
        mov byte [CamShotMode], dl
        mov eax, dword [byte eax+05h]
        mov dword [CamShotSaved], eax
        call CameraPathDerivs
        mov dword [CamPathPos], 0
.21:
        mov eax, dword [CamFollowObj]
        mov byte [byte eax+0Ch], 1
        mov eax, dword [ShadowToggle]
.22:
        mov dword [TimedPanelState], eax
        jmp near CamShot242_279
.23:
        inc dword [NameToggle]
        cmp dword [NameToggle], byte 1
        jle short .24
        mov dword [NameToggle], edx
.24:
        cmp dword [NameToggle], byte 0
        jne short .25
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable+8Ah
        cmp edx, dword [CameraViewTable+8Fh]
        je near .27
        cmp dword [CameraShotOn], byte 0
        je short .26
        mov edx, dword [CameraViewTable+8Ah]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+8Eh]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+8Fh]
        mov dword [CameraShotState+5], edx
        jmp short .26
.25:
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable+0CFh
        cmp edx, dword [CameraViewTable+0D4h]
        je short .27
        cmp dword [CameraShotOn], byte 0
        je short .26
        mov edx, dword [CameraViewTable+0CFh]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+0D3h]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+0D4h]
        mov dword [CameraShotState+5], edx
.26:
        mov edx, dword [eax]
        mov dword [CamShotKeys], edx
        mov dl, byte [byte eax+04h]
        mov byte [CamShotMode], dl
        mov eax, dword [byte eax+05h]
        mov dword [CamShotSaved], eax
        call CameraPathDerivs
        mov dword [CamPathPos], 0
.27:
        mov eax, dword [CamFollowObj]
        mov byte [byte eax+0Ch], 2
        mov eax, dword [NameToggle]
        jmp near .22
.28:
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable+114h
        cmp edx, dword [CameraViewTable+119h]
        je short .30
        cmp dword [CameraShotOn], byte 0
        je short .29
        mov edx, dword [CameraViewTable+114h]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+118h]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+119h]
        mov dword [CameraShotState+5], edx
.29:
        mov edx, dword [eax]
        mov dword [CamShotKeys], edx
        mov dl, byte [byte eax+04h]
        mov byte [CamShotMode], dl
        mov eax, dword [byte eax+05h]
        mov dword [CamShotSaved], eax
        call CameraPathDerivs
        mov dword [CamPathPos], 0
.30:
        mov eax, dword [CamFollowObj]
        mov byte [byte eax+0Ch], 3
        jmp near ReadHotKeys_7CF.42
.31:
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable+159h
        cmp edx, dword [CameraViewTable+15Eh]
        je short .33
        cmp dword [CameraShotOn], byte 0
        je short .32
        mov edx, dword [CameraViewTable+159h]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+15Dh]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+15Eh]
        mov dword [CameraShotState+5], edx
.32:
        mov edx, dword [eax]
        mov dword [CamShotKeys], edx
        mov dl, byte [byte eax+04h]
        mov byte [CamShotMode], dl
        mov eax, dword [byte eax+05h]
        mov dword [CamShotSaved], eax
        call CameraPathDerivs
        mov dword [CamPathPos], 0
.33:
        mov eax, dword [CamFollowObj]
        mov byte [byte eax+0Ch], 4
        jmp near ReadHotKeys_7CF.42
.34:
        inc dword [MarkerToggle]
        cmp dword [MarkerToggle], byte 3
        jle short .35
        mov dword [MarkerToggle], edx
.35:
        mov eax, dword [MarkerToggle]
        cmp eax, byte 3
        ja near ReadHotKeys_7CF.38
        jmp dword [nosplit cs:eax*4+jpt_609B6]
ReadHotKeys_6FB:
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable+19Eh
        cmp edx, dword [CameraViewTable+1A3h]
        je near ReadHotKeys_7CF.38
        cmp dword [CameraShotOn], byte 0
        je near ReadHotKeys_7CF.37
        mov edx, dword [CameraViewTable+19Eh]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+1A2h]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+1A3h]
.36:
        mov dword [CameraShotState+5], edx
        jmp near ReadHotKeys_7CF.37
ReadHotKeys_748:
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable+1E3h
        cmp edx, dword [CameraViewTable+1E8h]
        je near ReadHotKeys_7CF.38
        cmp dword [CameraShotOn], byte 0
        je near ReadHotKeys_7CF.37
        mov edx, dword [CameraViewTable+1E3h]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+1E7h]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+1E8h]
        jmp short ReadHotKeys_6FB.36
ReadHotKeys_78C:
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable+228h
        cmp edx, dword [CameraViewTable+22Dh]
        je near ReadHotKeys_7CF.38
        cmp dword [CameraShotOn], byte 0
        je short ReadHotKeys_7CF.37
        mov edx, dword [CameraViewTable+228h]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+22Ch]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+22Dh]
        jmp near ReadHotKeys_6FB.36
ReadHotKeys_7CF:
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable+26Dh
        cmp edx, dword [CameraViewTable+272h]
        je short .38
        cmp dword [CameraShotOn], byte 0
        je short .37
        mov edx, dword [CameraViewTable+26Dh]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+271h]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+272h]
        mov dword [CameraShotState+5], edx
.37:
        mov edx, dword [eax]
        mov dword [CamShotKeys], edx
        mov dl, byte [byte eax+04h]
        mov byte [CamShotMode], dl
        mov eax, dword [byte eax+05h]
        mov dword [CamShotSaved], eax
        call CameraPathDerivs
        mov dword [CamPathPos], 0
.38:
        mov eax, dword [CamFollowObj]
        mov byte [byte eax+0Ch], 5
        mov eax, dword [MarkerToggle]
        jmp near ReadHotKeys.22
.39:
        mov edx, dword [CamShotSaved]
        mov eax, CameraViewTable+2B2h
        cmp edx, dword [CameraViewTable+2B7h]
        je short .41
        cmp dword [CameraShotOn], byte 0
        je short .40
        mov edx, dword [CameraViewTable+2B2h]
        mov dword [CameraShotState], edx
        mov dl, byte [CameraViewTable+2B6h]
        mov byte [CameraShotState+4], dl
        mov edx, dword [CameraViewTable+2B7h]
        mov dword [CameraShotState+5], edx
.40:
        mov edx, dword [eax]
        mov dword [CamShotKeys], edx
        mov dl, byte [byte eax+04h]
        mov byte [CamShotMode], dl
        mov eax, dword [byte eax+05h]
        mov dword [CamShotSaved], eax
        call CameraPathDerivs
        mov dword [CamPathPos], 0
.41:
        mov eax, dword [CamFollowObj]
        mov byte [byte eax+0Ch], 6
.42:
        mov dword [TimedPanelState], 0
        jmp near CamShot242_279
jpt_61290:
        dd UpdateCamera_174
        dd UpdateCamera_480
        dd UpdateCamera_41F
        dd UpdateCamera_3BE
        dd UpdateCamera_35B
        dd UpdateCamera_4E1
        dd UpdateCamera_544
        dd UpdateCamera_5A7
        dd UpdateCamera_2CE
        dd UpdateCamera_604
        dd UpdateCamera_667
;-----------------------------------------------------------------------------
; UpdateCamera                                                    612BC  96 PC
; (ticks): per frame: in demo mode changes camera every while, runs the
; current shot handler and the camera path
;-----------------------------------------------------------------------------
UpdateCamera:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 24h, 0
        mov esi, eax
        cmp dword [DemoMode], byte 0
        je near .4
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .4
        sub dword [CamShakeStart], esi
        cmp dword [CamShakeStart], byte 0
        jg near .4
        inc dword [CamShakeCount]
        cmp dword [CamShakeCount], byte 5
        jle short .1
        mov dword [CamShakeCount], 1
.1:
        mov eax, dword [CamFollowObj]
        mov bl, byte [CamShakeCount]
        mov byte [byte eax+0Ch], bl
        mov eax, dword [CamShakeCount]
        shl eax, 4
        mov dword [TimedPanelState], 0
        mov eax, dword [dword eax+CameraViewSlots]
        mov ecx, dword [CamShotSaved]
        mov ebx, eax
        cmp ecx, dword [byte eax+05h]
        je short .3
        cmp dword [CameraShotOn], byte 0
        je short .2
        mov ecx, dword [eax]
        mov dword [CameraShotState], ecx
        mov cl, byte [byte eax+04h]
        mov byte [CameraShotState+4], cl
        mov eax, dword [byte eax+05h]
        mov dword [CameraShotState+5], eax
.2:
        mov eax, dword [ebx]
        mov dword [CamShotKeys], eax
        mov al, byte [byte ebx+04h]
        mov byte [CamShotMode], al
        mov eax, dword [byte ebx+05h]
        mov dword [CamShotSaved], eax
        call CameraPathDerivs
        mov dword [CamPathPos], 0
.3:
        mov dword [CamShakeStart], 3E8h
.4:
        mov eax, dword [CamShotSaved]
        mov dword [CamLastSort], esi
        cmp eax, dword [CameraViewTable+2FCh]
        jne short .5
        add esi, esi
.5:
        shl esi, 8
        add dword [CamPathPos], esi
        cmp dword [InReplay], byte 0
        jne near UpdateCamera_174.13
        mov edx, dword [CamFollowObj]
.6:
        cmp dword [byte edx+0Dh], byte 0
        je short .7
        mov edx, dword [byte edx+0Dh]
        jmp short .6
.7:
        mov eax, dword [PtrPuckObject]
        movsx ebx, word [byte eax+01Ch]
        movsx eax, byte [byte ebx+eax+01Eh]
        mov dword [CamShotTimer], eax
        cmp eax, byte 1Eh
        jne short .8
        mov ax, word [gameclock]
        cmp ax, word [PerTimeTotal]
        je short .8
        cmp byte [CamFirstFrame], 0
        jne short .9
        mov eax, 1000h
        call AddIceCrud
        mov byte [CamFirstFrame], 1
        jmp short .9
.8:
        mov byte [CamFirstFrame], 0
.9:
        mov eax, dword [edx]
        cmp eax, byte 0Ah
        ja near UpdateCamera_174.13
        jmp dword [nosplit cs:eax*4+jpt_61290]
UpdateCamera_174:
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .10
        mov dword [byte edx+04h], 10h
        jmp short .11
.10:
        mov dword [byte edx+04h], 0Eh
.11:
        mov eax, dword [byte edx+04h]
        mov dword [CamTargetObj], eax
        cmp dword [GameLoopActive], byte 1
        jne short .12
        mov byte [ScoreClockOn], 0
        mov byte [RinkBoardsOn], 0
        mov dword [CamNearNet], 0
.12:
        cmp dword [CameraShotOn], byte 0
        je near .13
        mov eax, dword [CameraShotState]
        mov dword [CamShotKeys], eax
        mov al, byte [CameraShotState+4]
        mov edi, CamPosZ
        mov byte [CamShotMode], al
        mov eax, dword [CameraShotState+5]
        mov esi, CamPathState
        mov dword [CamShotSaved], eax
        movsd
        movsd
        movsd
        mov edi, CamPosX
        mov esi, CamAngle
        movsd
        movsd
        mov dword [CameraShotOn], 0
        call dword [CamShotSaved]
.13:
        mov eax, dword [CamShotSaved]
        cmp eax, dword [CameraViewTable+569h]
        jne short .14
        cmp dword [CamShotId], byte 0FFFFFFFFh
        jle short .14
        cmp dword [CamShotId], byte 0Ah
        jge short .14
        cmp dword [CamPathPos], 6000h
        jb near UpdateCamera_667.34
.14:
        cmp dword [CamPathPos], 2A00h
        jae short .15
        mov eax, dword [CamShotSaved]
        cmp eax, dword [CameraViewTable+3CBh]
        jne near UpdateCamera_667.34
.15:
        call CameraPathPoint
        cmp dword [InReplay], byte 0
        jne short .16
        cmp dword [edx], byte 0
        jne short .16
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .16
        cmp dword [CamShotTimer], byte 1Eh
        je short .16
        cmp dword [CamShotTimer], byte 21h
        je short .16
        cmp dword [CamShotTimer], byte 22h
        je short .16
        cmp dword [CamShotTimer], byte 2Ch
        je short .16
        cmp dword [CamShotTimer], byte 24h
        jne short .17
.16:
        call dword [CamShotSaved]
.17:
        cmp dword [CamPosX], 8000h
        jle near UpdateCamera_667.30
        sub dword [CamPosX], 10000h
        jmp near UpdateCamera_667.31
UpdateCamera_2CE:
        mov dword [CamTargetObj], 0FFFFFFFFh
        mov eax, CameraViewTable+564h
        mov ebx, dword [CamShotSaved]
        mov dword [byte ebp-014h], 0
        cmp ebx, dword [CameraViewTable+569h]
        je near UpdateCamera_174.13
        cmp dword [CameraShotOn], byte 0
        jne short .18
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.18:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        cmp dword [byte ebp-014h], byte 0
.19:
        je short .20
        mov edi, CamPosZ
        mov esi, CamPathState
        movsd
        movsd
        movsd
        mov edi, CamPosX
        mov esi, CamAngle
        movsd
        movsd
.20:
        call CameraPathDerivs
        mov dword [CamPathPos], 2A00h
        jmp near UpdateCamera_174.13
UpdateCamera_35B:
        mov dword [byte ebp-020h], 1
        mov eax, dword [CamShotObj]
        mov ebx, dword [CamShotSaved]
        mov dword [CamTargetObj], eax
        mov eax, CameraViewTable+4DAh
        cmp ebx, dword [CameraViewTable+4DFh]
        je near UpdateCamera_174.13
        cmp dword [CameraShotOn], byte 0
        jne short .21
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.21:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        cmp dword [byte ebp-020h], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_3BE:
        mov dword [byte ebp-024h], 1
        mov eax, dword [byte edx+04h]
        mov ebx, dword [CamShotSaved]
        mov dword [CamTargetObj], eax
        mov eax, CameraViewTable+51Fh
        cmp ebx, dword [CameraViewTable+524h]
        je near UpdateCamera_174.13
        cmp dword [CameraShotOn], byte 0
        jne short .22
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.22:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        cmp dword [byte ebp-024h], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_41F:
        mov dword [byte ebp-01Ch], 0
        mov eax, dword [byte edx+04h]
        mov ebx, dword [CamShotSaved]
        mov dword [CamTargetObj], eax
        mov eax, CameraViewTable+5A9h
        cmp ebx, dword [CameraViewTable+5AEh]
        je near UpdateCamera_174.13
        cmp dword [CameraShotOn], byte 0
        jne short .23
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.23:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        cmp dword [byte ebp-01Ch], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_480:
        mov dword [byte ebp-018h], 1
        mov eax, dword [byte edx+04h]
        mov ebx, dword [CamShotSaved]
        mov dword [CamTargetObj], eax
        mov eax, CameraViewTable+495h
        cmp ebx, dword [CameraViewTable+49Ah]
        je near UpdateCamera_174.13
        cmp dword [CameraShotOn], byte 0
        jne short .24
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.24:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        cmp dword [byte ebp-018h], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_4E1:
        mov dword [CamTargetObj], 10h
        mov eax, CameraViewTable+381h
        mov ebx, dword [CamShotSaved]
        mov dword [byte ebp-010h], 0
        cmp ebx, dword [CameraViewTable+386h]
        je near UpdateCamera_174.13
        cmp dword [CameraShotOn], byte 0
        jne short .25
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.25:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        cmp dword [byte ebp-010h], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_544:
        mov dword [byte ebp-0Ch], 1
        mov eax, dword [CamInjuredObj]
        mov ebx, dword [CamShotSaved]
        mov dword [CamTargetObj], eax
        mov eax, CameraViewTable+5EEh
        cmp ebx, dword [CameraViewTable+5F3h]
        je near UpdateCamera_174.13
        cmp dword [CameraShotOn], byte 0
        jne short .26
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.26:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        cmp dword [byte ebp-0Ch], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_5A7:
        mov ebx, 1
        mov eax, dword [byte edx+04h]
        mov ecx, dword [CamShotSaved]
        mov dword [CamTargetObj], eax
        mov eax, CameraViewTable+633h
        cmp ecx, dword [CameraViewTable+638h]
        je near UpdateCamera_174.13
        cmp dword [CameraShotOn], byte 0
        jne short .27
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.27:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        test ebx, ebx
        jmp near UpdateCamera_2CE.19
UpdateCamera_604:
        mov dword [CamTargetObj], 10h
        mov eax, CameraViewTable+33Ch
        mov ebx, dword [CamShotSaved]
        mov dword [byte ebp-04h], 0
        cmp ebx, dword [CameraViewTable+341h]
        je near UpdateCamera_174.13
        cmp dword [CameraShotOn], byte 0
        jne short .28
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.28:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        cmp dword [byte ebp-04h], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_667:
        mov dword [CamTargetObj], 10h
        mov eax, CameraViewTable+2F7h
        mov ebx, dword [CamShotSaved]
        mov dword [byte ebp-08h], 0
        cmp ebx, dword [CameraViewTable+2FCh]
        je near UpdateCamera_174.13
        cmp dword [CameraShotOn], byte 0
        jne short .29
        mov ecx, 45h
        mov edi, CameraShotState
        mov esi, CamShotKeys
        rep movsb
.29:
        mov ecx, 45h
        mov edi, CamShotKeys
        mov esi, eax
        mov dword [CameraShotOn], 1
        rep movsb
        cmp dword [byte ebp-08h], byte 0
        jmp near UpdateCamera_2CE.19
.30:
        cmp dword [CamPosX], 0FFFF8000h
        jge short .31
        inc word [CamPosX+2]
.31:
        cmp dword [CamPosY], 8000h
        jle short .32
        sub dword [CamPosY], 10000h
        jmp short .33
.32:
        cmp dword [CamPosY], 0FFFF8000h
        jge short .33
        inc word [CamPosY+2]
.33:
        call CameraPathDerivs
        mov dword [CamPathPos], 0
        jmp near CamShot242_278
.34:
        call CameraPathPoint
        jmp near CamShot242_278
;-----------------------------------------------------------------------------
; CameraFacing                                 619E2  96 PC, medium confidence
; The camera heading as one of 8 directions, so the pads steer relative to
; the view
;-----------------------------------------------------------------------------
CameraFacing:
        push edx
        mov eax, dword [CamAngle]
        neg eax
        test eax, eax
        jle short .1
        mov eax, 1000h
        jmp short .2
.1:
        mov eax, 0FFFFF000h
.2:
        sub eax, dword [CamAngle]
        cdq
        shl edx, 0Dh
        LD sbb, eax, edx
        sar eax, 0Dh
        mov edx, 8
        sub edx, eax
        mov eax, edx
        and eax, byte 7
        pop edx
        ret
        db 00h
;-----------------------------------------------------------------------------
; randomd0                          61A18  94G middle94.asm, medium confidence
; 32-bit LCG. seed = seed*BB40E62Dh + 1.
; returns ((seed>>8)&FFFFh * ax) >> 16, a value in 0..ax-1. The high word is seed+2.
;-----------------------------------------------------------------------------
randomd0:
        push ebp
        LD mov, ebp, esp
        push ebx
        push ecx
        push edx
        push ax
        mov ax, word [seed_w2]
        mov dx, 0E62Dh
        mul dx
        LD mov, bx, ax
        mov ax, word [seed]
        LD mov, cx, ax
        mov dx, 0BB40h
        mul dx
        LD add, bx, ax
        LD mov, ax, cx
        mov dx, 0E62Dh
        mul dx
        LD add, dx, bx
        add ax, byte 1
        adc dx, byte 0
        mov word [seed], ax
        mov word [seed_w2], dx
        LD mov, al, ah
        LD mov, ah, dl
        pop dx
        mul dx
        LD mov, ax, dx
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
        db 00h,00h
;-----------------------------------------------------------------------------
; vtoa                               61A78  94G logic94.asm, medium confidence
; : (x,y) vector -> direction 0-7 via vtoa_dt.
; .dir/.0-.3 follow the x sign -> bit0, y sign -> bit1,
; |x| vs |y| (and 2x) comparisons -> bits 2/3, then the table lookup.
;-----------------------------------------------------------------------------
vtoa:
        push ebp
        LD mov, ebp, esp
        push ebx
        push ecx
        push edx
        LD mov, cx, ax
        LD or, ax, dx
        jne short .1
        mov ax, 8
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
.1:
        mov ebx, 0
        cmp cx, byte 0
        jge short .2
        neg cx
        or ebx, byte 1
.2:
        LD or, dx, dx
        jge short .3
        neg dx
        or ebx, byte 2
.3:
        LD mov, ax, dx
        shl dx, 1
        LD cmp, dx, cx
        jb short .4
        or ebx, byte 4
.4:
        shl cx, 1
        LD cmp, cx, ax
        jb short .5
        or ebx, byte 8
.5:
        mov al, byte [dword ebx+HexDigits]
        cbw
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
