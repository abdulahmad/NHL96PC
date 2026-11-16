; The game camera: its path polynomials and the camera shots (96 PC).
bits 32
%include "hockey.inc"
extern TeamRosterPtrs
section s_5D707 progbits alloc exec nowrite align=1
extern __CHP, BuildShadeLut, byte_1175A4, byte_1175A5, byte_1175A6, byte_1175A7, byte_1175A8, byte_1175A9
extern byte_1175AA, byte_1175AB, byte_1175AC, byte_11B380, byte_11B3C5, byte_11B40A, byte_11B44F, byte_11B494
extern byte_11B4D9, byte_11B51E, byte_11B563, byte_11B5A8, byte_11B5ED, byte_11B632, byte_11BB20, byte_11BB24
extern HexDigits, PenBuf, byte_1770A6, byte_1770B1, byte_179D7C, byte_179DC1, byte_179E47
extern DemoMode, InReplay, ReplayRemoteShape, dword_11B244, dword_11B314, dword_11B318, dword_11B31C
extern dword_11B320, str_D_DrawGameFrame, dword_11B328, dword_11B32C, dword_11B330, dword_11B334, str_C_CloseTextOverlay, dword_11B364
extern dword_11B368, dword_11B370, dword_11B374, dword_11B37C, dword_11B381, dword_11B3C1, dword_11B3C6, dword_11B406
extern dword_11B40B, dword_11B44B, dword_11B450, dword_11B490, dword_11B495, dword_11B4D5, dword_11B4DA, dword_11B51A
extern dword_11B51F, dword_11B55F, dword_11B564, dword_11B5A4, dword_11B5A9, dword_11B5E9, dword_11B5EE, dword_11B62E
extern dword_11B633, dword_11B678, dword_11B6BD, dword_11B702, dword_11B747, dword_11B816, dword_11B85B, dword_11B8A0
extern dword_11B8E5, dword_11B8E9, dword_11B8ED, dword_11B8F1, dword_11B8F5, dword_11B8F9, dword_11B92A, dword_11B96F
extern dword_11B9B4, dword_11B9F4, dword_11BAD4, dword_11BAD8, dword_11BADC, dword_11BAE0, dword_11BAE4, dword_11BAE8
extern dword_11BAEC, dword_11BAF0, dword_11BAF4, dword_11BAF8, dword_11BAFC, dword_11BB00, dword_11BB04, dword_11BB08
extern dword_11BB0C, dword_11BB10, dword_11BB14, dword_11BB18, dword_11BB1C, ViewScreenHeight
extern dword_165060, dword_1781F0, dword_178243, dword_1798EC, dword_179978, dword_17997C, dword_179CBC, dword_179CC0
extern dword_179CC4, dword_179CC8, dword_179D44, dword_179D48, dword_179D50, dword_179D54, dword_179D58, dword_179D5C
extern dword_179D60, dword_179D64, dword_179D68, dword_179D6C, dword_179D70, dword_179D74, dword_179D78, dword_179D7D
extern dword_179DBD, dword_179DC2, dword_179DC6, dword_179DCA, dword_179DCE, dword_179DD2, dword_179DD6, dword_179E0B
extern dword_179E0F, dword_179E13, dword_179E17, dword_179E1B, dword_179E1F, dword_179E23, dword_179E27, dword_179E2B
extern dword_179E2F, dword_179E33, dword_179E37, dword_179E3B, dword_179E3F, dword_179E43, GsOptions, fox
extern foy, FullViewClip, gameclock, GameLoopActive, GetTicks, gmode, puckvy, PtrRefObject
extern PtrPuckObject, passplayer, penshotlive, penshotmode, penshotstart, puckc, puckvx, puckvz
extern QueueOverlayPanel, F64_0p00277778, F64_65536_CamView236, F64_0p00277778_CamView236, qword_11109C, F64_0p00277778_CamView238, F64_65536_CamView238, F64_0p00277778_CamView239
extern F64_65536_CamView239, rand_, seed, seed_w2, SetClipWindow, SetDrawBitmap, sflags, SortCords
extern str_Priority2, AddIceCrud, SetRinkClipWindow, AllocMemBlock, FreeMemBlock, AngleOfVector, TransformVector, MakeRotYMatrix
extern BuildPerspTable, KeyIsDown, KbdGetKey, ClearClipRect, SetViewScreenOrigin, SetViewFov, unk_11B673, unk_11B6B8
extern unk_11B6FD, unk_11B811, unk_11B856, unk_11B89B, unk_11B8E0, unk_11B925, unk_11B96A, unk_11B9AF
extern unk_1781E4, unk_179CCC, unk_179CE4, unk_179CFC, unk_179D14, unk_179D2C, unk_179E02
extern unk_5D549, unk_5D555, unk_5D561, unk_5D56D, unk_5D579, unk_5D585, unk_5D591, unk_5D591_84
extern str_D_SetGameViewSize, unk_5D65D, unk_5D681, vecdist, PerTimeTotal, word_176FB8, word_176FDA, word_1770AB
extern word_1770AD, word_1770AF, word_179DC8, word_179DCC, word_179E0D, word_179E11
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
; Evaluates the 5 camera path polynomials at dword_179D48 into the camera
; position and angles (dword_179E0B-179E1B)
;-----------------------------------------------------------------------------
CameraPathPoint:
        push edx
        mov eax, unk_179CCC
        mov edx, dword [dword_179D48]
        call CameraPathEval
        mov edx, dword [dword_179D48]
        mov dword [dword_179E13], eax
        mov eax, unk_179CE4
        call CameraPathEval
        mov edx, dword [dword_179D48]
        mov dword [dword_179E17], eax
        mov eax, unk_179CFC
        call CameraPathEval
        mov edx, dword [dword_179D48]
        mov dword [dword_179E1B], eax
        mov eax, unk_179D14
        call CameraPathEval
        mov edx, dword [dword_179D48]
        mov dword [dword_179E0B], eax
        mov eax, unk_179D2C
        call CameraPathEval
        mov dword [dword_179E0F], eax
        cmp dword [dword_179E0B], 8000h
        jle short .1
        sub dword [dword_179E0B], 10000h
        jmp short .2
.1:
        cmp dword [dword_179E0B], 0FFFF8000h
        jge short .2
        inc word [word_179E0D]
.2:
        cmp dword [dword_179E0F], 8000h
        jle short .3
        sub dword [dword_179E0F], 10000h
        pop edx
        ret
.3:
        cmp dword [dword_179E0F], 0FFFF8000h
        jge short .4
        inc word [word_179E11]
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
        mov esi, unk_179E02
        mov edi, dword_179DBD
        mov dword [byte ebp-04h], unk_179CCC
        cmp dword [dword_179D48], byte 0FFFFFFFFh
        jne short .1
        mov dword [dword_179E2B], 0
        mov dword [dword_179E27], 0
        mov dword [dword_179E23], 0
        mov dword [dword_179E1F], 0
        mov dword [dword_179E43], 0
        mov dword [dword_179E3F], 0
        mov dword [dword_179E3B], 0
        mov dword [dword_179E37], 0
        mov dword [dword_179E33], 0
        mov dword [dword_179E2F], 0
        jmp near .2
.1:
        mov eax, unk_179CCC
        mov ecx, unk_179CCC
        mov edx, dword [dword_179D48]
        mov ebx, unk_179CCC
        call CameraPathSlope
        mov edx, dword [dword_179D48]
        add ecx, byte 18h
        mov dword [dword_179E2F], eax
        mov eax, ecx
        add ebx, byte 30h
        call CameraPathSlope
        mov edx, dword [dword_179D48]
        mov dword [dword_179E33], eax
        mov eax, ebx
        call CameraPathSlope
        mov edx, dword [dword_179D48]
        mov dword [dword_179E37], eax
        mov eax, unk_179CCC
        call CameraPathCurve
        mov edx, dword [dword_179D48]
        mov dword [dword_179E3B], eax
        mov eax, ecx
        call CameraPathCurve
        mov edx, dword [dword_179D48]
        mov dword [dword_179E3F], eax
        mov eax, ebx
        mov ecx, unk_179CCC
        call CameraPathCurve
        add ecx, byte 48h
        mov edx, dword [dword_179D48]
        mov dword [dword_179E43], eax
        mov eax, ecx
        mov ebx, unk_179CCC
        call CameraPathSlope
        add ebx, byte 60h
        mov edx, dword [dword_179D48]
        mov dword [dword_179E1F], eax
        mov eax, ebx
        call CameraPathSlope
        mov edx, dword [dword_179D48]
        mov dword [dword_179E23], eax
        mov eax, ecx
        call CameraPathCurve
        mov edx, dword [dword_179D48]
        mov dword [dword_179E27], eax
        mov eax, ebx
        call CameraPathCurve
        mov dword [dword_179E2B], eax
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
; (dword_179DBD), runs its handler once and starts its path
;-----------------------------------------------------------------------------
SetCameraShot:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov esi, eax
        push dword [dword_11B31C]
        push dword [dword_11B318]
        push byte 0
        push dword [dword_11B314]
        call SetViewFov
        add esp, byte 10h
        mov edi, dword_179DBD
        call BuildPerspTable
        mov ecx, 45h
        rep movsb
        mov ecx, 45h
        mov edi, unk_179E02
        mov esi, dword_179DBD
        call dword [dword_179DC2]
        mov dword [dword_179D48], 0FFFFFFFFh
        rep movsb
        call CameraPathDerivs
        mov dword [dword_179D48], 0
        cmp dword [InReplay], byte 0
        je near CamShot242_279
        mov ecx, 45h
        mov edi, dword_178243
        mov esi, unk_179E02
        rep movsb
        jmp near CamShot242_279
        push edx
        mov edx, dword [dword_179DC2]
        cmp edx, dword [byte eax+05h]
        jne short .1
        mov eax, dword [dword_179D44]
        pop edx
        ret
.1:
        cmp dword [dword_11B334], byte 0
        je short .2
        mov edx, dword [eax]
        mov dword [dword_179D78], edx
        mov dl, byte [byte eax+04h]
        mov byte [byte_179D7C], dl
        mov edx, dword [byte eax+05h]
        mov dword [dword_179D7D], edx
.2:
        mov edx, dword [eax]
        mov dword [dword_179DBD], edx
        mov dl, byte [byte eax+04h]
        mov byte [byte_179DC1], dl
        mov eax, dword [byte eax+05h]
        mov dword [dword_179DC2], eax
        call CameraPathDerivs
        mov dword [dword_179D48], 0
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
; The camera target: the puck carrier (dword_1781F0) or the puck, replay
; positions in a replay
;-----------------------------------------------------------------------------
CameraTrackPuck:
        push edx
        push esi
        push edi
        cmp dword [InReplay], byte 0
        je near .4
        cmp dword [dword_1781F0], byte 0
        jl short .1
        mov eax, dword [dword_1781F0]
        mov dword [dword_179D54], 0
        movsx edx, word [nosplit eax*2+word_176FB8]
        movsx eax, word [nosplit eax*2+word_176FDA]
        shl edx, 2
        shl eax, 2
        mov dword [dword_179D50], edx
        mov dword [dword_179D58], eax
        jmp short .2
.1:
        mov edi, dword_179D50
        mov esi, unk_1781E4
        movsd
        movsd
        movsd
.2:
        mov eax, dword [dword_1781F0]
        cmp eax, byte 0Eh
        jne near .9
        movsx eax, word [word_1770AB]
        mov dword [dword_179CC0], eax
        movsx eax, word [word_1770AD]
        mov dword [dword_179CC8], eax
        movsx eax, word [word_1770AF]
.3:
        mov dword [dword_179CC4], eax
        pop edi
        pop esi
        pop edx
        ret
.4:
        cmp dword [dword_179CBC], byte 10h
        je short .5
        cmp dword [dword_179CBC], byte 0FFFFFFFFh
        jne short .6
.5:
        movsx eax, word [foy]
        shl eax, 2
        mov dword [dword_179D50], eax
        movsx eax, word [fox]
        shl eax, 2
        mov dword [dword_179D54], 0
        mov dword [dword_179D58], eax
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
        mov dword [dword_179D50], edx
        mov edx, dword [dword eax+SortCords+4]
        mov eax, dword [dword eax+SortCords+8]
        sar edx, 0Eh
        sar eax, 0Eh
        mov dword [dword_179D58], edx
        mov dword [dword_179D54], eax
        jmp short .8
.7:
        imul eax, dword [dword_179CBC], dword 0A0h
        mov edx, dword [dword eax+SortCords]
        sar edx, 0Eh
        mov dword [dword_179D50], edx
        mov edx, dword [dword eax+SortCords+4]
        mov eax, dword [dword eax+SortCords+8]
        sar eax, 0Eh
        sar edx, 0Eh
        mov dword [dword_179D54], eax
        mov dword [dword_179D58], edx
        neg dword [dword_179D54]
.8:
        mov eax, dword [dword_179CBC]
        cmp eax, byte 0Eh
        jne short .9
        mov eax, dword [puckvx]
        movsx eax, word [eax]
        sar eax, 5
        mov dword [dword_179CC0], eax
        mov eax, dword [puckvy]
        movsx eax, word [eax]
        sar eax, 5
        mov dword [dword_179CC8], eax
        mov eax, dword [puckvz]
        movsx eax, word [eax]
        sar eax, 5
        jmp near .3
.9:
        mov dword [dword_179CC0], 0
        mov dword [dword_179CC4], 0
        mov dword [dword_179CC8], 0
        pop edi
        pop esi
        pop edx
        ret
;-----------------------------------------------------------------------------
; CameraLeadOffset                                5DF3E  96 PC, low confidence
; How far the camera leads the play (dword_11B370) by the carrier's direction
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
        mov dword [dword_11B370], eax
        cmp dword [dword_1781F0], byte 0
        jl near .14
        movsx eax, byte [byte_1770A6]
        cmp eax, dword [dword_1781F0]
        jne near .14
        cmp byte [byte_1770B1], 0
        je short .2
        cmp dword [dword_179CC8], byte 0
        jl short .1
        mov dword [dword_11B370], 258h
.1:
        cmp dword [dword_179D58], 1D0h
        jl near .14
        mov dword [dword_11B370], 424h
        pop ecx
        ret
.2:
        cmp dword [dword_179CC8], byte 0
        jg short .3
        mov dword [dword_11B370], 0FFFFFDA8h
.3:
        cmp dword [dword_179D58], 0FFFFFE30h
        jg near .14
        mov dword [dword_11B370], 0FFFFFBDCh
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
        mov dword [dword_11BAD4], eax
.7:
        imul eax, dword [dword_11BAD4], dword 0A0h
        add eax, SortCords
        mov dword [dword_11B370], 0
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx ecx, al
        mov eax, dword [dword_179CC8]
        add eax, eax
        test ecx, ecx
        je short .9
        cmp dword [dword_179D58], 1D0h
        jl short .8
        mov dword [dword_11B370], 424h
        jmp short .12
.8:
        cmp dword [dword_179CC8], byte 0
        jl short .11
        mov dword [dword_11B370], 258h
        jmp short .12
.9:
        cmp dword [dword_179D58], 0FFFFFE30h
        jg short .10
        mov dword [dword_11B370], 0FFFFFBDCh
        jmp short .12
.10:
        cmp dword [dword_179CC8], byte 0
        jg short .11
        mov dword [dword_11B370], 0FFFFFDA8h
        jmp short .12
.11:
        mov dword [dword_11B370], eax
.12:
        mov eax, dword [puckc]
        cmp byte [eax], 0
        setge al
        movzx ecx, al
        mov eax, dword [dword_179CC0]
        sar eax, cl
        mov dword [dword_11B368], eax
        pop ecx
        ret
.13:
        mov dword [dword_11B370], 0
        mov dword [dword_11B368], 0
.14:
        pop ecx
        ret
;-----------------------------------------------------------------------------
; CameraNearNet                                   5E0CC  96 PC, low confidence
; 1 when the tracked player (dword_11BAD4) is near a net, for the close
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
        imul eax, dword [dword_11BAD4], dword 0A0h
        add eax, SortCords
        movsx edx, word [dword eax+086h]
        cmp edx, byte 10h
        je near .6
        cmp word [byte eax+01Ah], byte 0
        je short .6
        mov edx, dword [ViewScreenHeight]
        sar edx, 0Eh
        test edx, edx
        jge short .2
        mov ebx, edx
        neg ebx
        jmp short .3
.2:
        mov ebx, edx
.3:
        mov edx, dword [dword_165060]
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
        mov esi, unk_5D549
        movsd
        movsd
        movsd
        lea edi, [byte ebp-01Ch]
        mov esi, dword_179D50
        movsd
        movsd
        movsd
        mov eax, dword [dword_11B370]
        sub dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-014h]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [byte ebp-01Ch]
        sub eax, dword [dword_179DCE]
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
        add dword [dword_179DCE], eax
        mov eax, dword [byte ebp-020h]
        add dword [dword_179DD6], eax
        mov eax, dword [byte ebp-054h]
        add esp, byte 0Ch
        mov dword [dword_179DD2], eax
.7:
        mov eax, dword [byte ebp-04h]
CameraNearNet_12E:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        mov byte [byte_1175AC], 1
        mov al, byte [byte_1175A9]
        mov dword [dword_179D74], 1
        mov byte [byte_1175AA], al
        ret
;-----------------------------------------------------------------------------
; ResetCameraShake                                5E21C  96 PC, low confidence
; In a game, clears byte_1175AC / 1175AA and dword_179D74
;-----------------------------------------------------------------------------
ResetCameraShake:
        cmp dword [GameLoopActive], byte 1
        jne short .1
        mov byte [byte_1175AC], 0
        mov byte [byte_1175AA], 0
        mov dword [dword_179D74], 0
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
        mov esi, unk_5D555
        movsd
        movsd
        movsd
        cmp dword [dword_179D5C], byte 1Eh
        jne near .1
        cmp dword [InReplay], byte 0
        jne short .1
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
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
        mov eax, dword [dword_179D50]
        sub eax, dword [byte ebp-018h]
        mov dword [dword_179DCE], eax
        mov eax, dword [dword_179D58]
        mov dword [dword_179DD2], 140h
        sub eax, dword [byte ebp-010h]
        add esp, byte 0Ch
        mov dword [dword_179DD6], eax
        mov eax, 1
        jmp near CamShot242_278
.1:
        xor eax, eax
        jmp near CamShot242_278
CameraAim_AB:
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [dword_11B370]
        add dword [dword_179D58], eax
        mov eax, dword [dword_179D50]
        mov dword [dword_179DCE], eax
        mov eax, dword [InReplay]
        and eax, 200h
        or eax, dword [dword_11B374]
        cmp dword [dword_179D58], byte 0
        jge short .7
        test eax, eax
        je short .4
        cmp dword [dword_179DCE], 0FFFFFED4h
        jge short .3
.2:
        mov dword [dword_179DCE], 0FFFFFED4h
        jmp near .10
.3:
        cmp dword [dword_179DCE], 12Ch
        jle near .10
        jmp short .9
.4:
        cmp dword [dword_179DCE], 0FFFFFF08h
        jge short .6
.5:
        mov dword [dword_179DCE], 0FFFFFF08h
        jmp short .10
.6:
        cmp dword [dword_179DCE], 0F8h
        jle short .10
        mov dword [dword_179DCE], 0F8h
        jmp short .10
.7:
        test eax, eax
        je short .8
        cmp dword [dword_179DCE], 0FFFFFF08h
        jl short .5
        jmp short .6
.8:
        cmp dword [dword_179DCE], 0FFFFFED4h
        jl short .2
        cmp dword [dword_179DCE], 12Ch
        jle short .10
.9:
        mov dword [dword_179DCE], 12Ch
.10:
        mov eax, dword [dword_11B368]
        add dword [dword_179DCE], eax
        mov eax, dword [InReplay]
        and eax, 200h
        mov dword [dword_179DD2], 244h
        or eax, dword [dword_11B374]
        je short .13
        mov eax, dword [dword_179D58]
        add eax, 49Ch
        mov dword [dword_179DD6], eax
        cmp eax, 80h
        jge short .11
        mov dword [dword_179DD6], 80h
        jmp short .12
.11:
        cmp eax, 898h
        jle short .12
        mov dword [dword_179DD6], 898h
.12:
        mov dword [dword_179DC6], 8000h
        jmp short .16
.13:
        mov eax, dword [dword_179D58]
        sub eax, 49Ch
        mov dword [dword_179DD6], eax
        cmp eax, 0FFFFF768h
        jge short .14
        mov dword [dword_179DD6], 0FFFFF768h
        jmp short .15
.14:
        cmp eax, byte 0FFFFFF80h
        jle short .15
        mov dword [dword_179DD6], 0FFFFFF80h
.15:
        mov dword [dword_179DC6], 0
.16:
        call CameraAim
        mov dword [dword_179DCA], 0FFFFEAABh
        ret
CameraAim_229:
        push ebx
        push ecx
        push edx
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [dword_11B370]
        add dword [dword_179D58], eax
        mov eax, dword [dword_179D50]
        mov dword [dword_179DCE], eax
        mov eax, dword [InReplay]
        and eax, 200h
        or eax, dword [dword_11B374]
        cmp dword [dword_179D58], byte 0
        jge short .22
        test eax, eax
        je short .19
        cmp dword [dword_179DCE], 0FFFFFED4h
        jge short .18
.17:
        mov dword [dword_179DCE], 0FFFFFED4h
        jmp near .25
.18:
        cmp dword [dword_179DCE], 12Ch
        jle near .25
        jmp short .24
.19:
        cmp dword [dword_179DCE], 0FFFFFDF8h
        jge short .21
.20:
        mov dword [dword_179DCE], 0FFFFFDF8h
        jmp short .25
.21:
        cmp dword [dword_179DCE], 208h
        jle short .25
        mov dword [dword_179DCE], 208h
        jmp short .25
.22:
        test eax, eax
        je short .23
        cmp dword [dword_179DCE], 0FFFFFDF8h
        jl short .20
        jmp short .21
.23:
        cmp dword [dword_179DCE], 0FFFFFED4h
        jl short .17
        cmp dword [dword_179DCE], 12Ch
        jle short .25
.24:
        mov dword [dword_179DCE], 12Ch
.25:
        mov eax, dword [InReplay]
        and eax, 200h
        mov dword [dword_179DD2], 244h
        or eax, dword [dword_11B374]
        je near .37
        mov eax, dword [dword_179D58]
        add eax, 49Ch
        mov dword [dword_179DD6], eax
        cmp eax, 80h
        jge short .26
        mov dword [dword_179DD6], 80h
        jmp short .27
.26:
        cmp eax, 898h
        jle short .27
        mov dword [dword_179DD6], 898h
.27:
        call CameraAim
        mov eax, dword [dword_179DD6]
        sub eax, dword [dword_179D58]
        push eax
        mov eax, dword [dword_179DCE]
        sub eax, dword [dword_179D50]
        push eax
        call AngleOfVector
        neg eax
        sar eax, 1
        mov dword [dword_179DC6], eax
        neg dword [dword_179DC6]
        add esp, byte 8
        cmp dword [dword_179DC6], 0FFFFF1C8h
        jge short .28
        mov dword [dword_179DC6], 0FFFFF1C8h
        jmp short .29
.28:
        cmp dword [dword_179DC6], 0E38h
        jle short .29
        mov dword [dword_179DC6], 0E38h
.29:
        cmp dword [dword_179D50], 104h
        jle short .33
        cmp dword [dword_179DC6], 0FFFFF1C8h
        jge short .31
.30:
        mov dword [dword_179DC6], 0FFFFF1C8h
        jmp short .36
.31:
        cmp dword [dword_179DC6], byte 0
        jle short .36
.32:
        mov dword [dword_179DC6], 0
        jmp short .36
.33:
        cmp dword [dword_179D50], 0FFFFFEFCh
        jge short .34
        cmp dword [dword_179DC6], byte 0
        jl short .32
        cmp dword [dword_179DC6], 0E38h
        jle short .36
        jmp short .35
.34:
        cmp dword [dword_179DC6], 0FFFFF1C8h
        jl short .30
        cmp dword [dword_179DC6], 0E38h
        jle short .36
.35:
        mov dword [dword_179DC6], 0E38h
.36:
        add dword [dword_179DC6], 8000h
        cmp dword [dword_179DC6], 8000h
        jle near .46
        sub dword [dword_179DC6], 10000h
        jmp near .46
.37:
        mov eax, dword [dword_179D58]
        sub eax, 49Ch
        mov dword [dword_179DD6], eax
        cmp eax, 0FFFFF768h
        jge short .38
        mov dword [dword_179DD6], 0FFFFF768h
        jmp short .39
.38:
        cmp eax, byte 0FFFFFF80h
        jle short .39
        mov dword [dword_179DD6], 0FFFFFF80h
.39:
        call CameraAim
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call AngleOfVector
        neg eax
        sar eax, 1
        mov dword [dword_179DC6], eax
        add esp, byte 8
        neg dword [dword_179DC6]
        cmp dword [dword_179D50], 0FFFFFEFCh
        jge short .43
        cmp dword [dword_179DC6], 0FFFFF1C8h
        jge short .41
.40:
        mov dword [dword_179DC6], 0FFFFF1C8h
        jmp short .46
.41:
        cmp dword [dword_179DC6], byte 0
        jle short .46
.42:
        mov dword [dword_179DC6], 0
        jmp short .46
.43:
        cmp dword [dword_179D50], 104h
        jle short .44
        cmp dword [dword_179DC6], byte 0
        jl short .42
        cmp dword [dword_179DC6], 0E38h
        jle short .46
        jmp short .45
.44:
        cmp dword [dword_179DC6], 0FFFFF1C8h
        jl short .40
        cmp dword [dword_179DC6], 0E38h
        jle short .46
.45:
        mov dword [dword_179DC6], 0E38h
.46:
        mov eax, dword [dword_11B368]
        mov dword [dword_179DCA], 0FFFFEAABh
        add dword [dword_179DCE], eax
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
        mov eax, dword [dword_11B370]
        add dword [dword_179D58], eax
        mov eax, dword [dword_179D50]
        mov dword [dword_179DCE], eax
        cmp eax, 0FFFFFF60h
        jge short .1
        mov dword [dword_179DCE], 0FFFFFF60h
        jmp short .2
.1:
        cmp eax, 0A0h
        jle short .2
        mov dword [dword_179DCE], 0A0h
.2:
        mov eax, dword [InReplay]
        and eax, 200h
        mov dword [dword_179DD2], 2D0h
        or eax, dword [dword_11B374]
        je short .5
        mov eax, dword [dword_179D58]
        add eax, 640h
        mov dword [dword_179DD6], eax
        cmp eax, 1F4h
        jge short .3
        mov dword [dword_179DD6], 1F4h
        jmp short .4
.3:
        cmp eax, 910h
        jle short .4
        mov dword [dword_179DD6], 910h
.4:
        mov dword [dword_179DC6], 8000h
        jmp short .8
.5:
        mov eax, dword [dword_179D58]
        sub eax, 640h
        mov dword [dword_179DD6], eax
        cmp eax, 0FFFFF6F0h
        jge short .6
        mov dword [dword_179DD6], 0FFFFF6F0h
        jmp short .7
.6:
        cmp eax, 0FFFFFE0Ch
        jle short .7
        mov dword [dword_179DD6], 0FFFFFE0Ch
.7:
        mov dword [dword_179DC6], 0
.8:
        call CameraAim
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DCA], eax
        cmp eax, 0FFFFEAABh
        jge short .9
        mov dword [dword_179DCA], 0FFFFEAABh
        pop edx
        pop ecx
        pop ebx
        ret
.9:
        cmp eax, 0FFFFF05Ch
        jle short .10
        mov dword [dword_179DCA], 0FFFFF05Ch
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
        mov eax, dword [dword_11B370]
        add dword [dword_179D58], eax
        mov eax, dword [dword_179D50]
        mov dword [dword_179DCE], eax
        cmp eax, 0FFFFFF60h
        jge short .1
        mov dword [dword_179DCE], 0FFFFFF60h
        jmp short .2
.1:
        cmp eax, 0A0h
        jle short .2
        mov dword [dword_179DCE], 0A0h
.2:
        mov eax, dword [InReplay]
        and eax, 200h
        mov dword [dword_179DD2], 2D0h
        or eax, dword [dword_11B374]
        je short .5
        mov eax, dword [dword_179D58]
        add eax, 640h
        mov dword [dword_179DD6], eax
        cmp eax, 1F4h
        jge short .3
        mov dword [dword_179DD6], 1F4h
        jmp short .4
.3:
        cmp eax, 910h
        jle short .4
        mov dword [dword_179DD6], 910h
.4:
        mov dword [dword_179DC6], 8000h
        jmp short .8
.5:
        mov eax, dword [dword_179D58]
        sub eax, 640h
        mov dword [dword_179DD6], eax
        cmp eax, 0FFFFF6F0h
        jge short .6
        mov dword [dword_179DD6], 0FFFFF6F0h
        jmp short .7
.6:
        cmp eax, 0FFFFFE0Ch
        jle short .7
        mov dword [dword_179DD6], 0FFFFFE0Ch
.7:
        mov dword [dword_179DC6], 0
.8:
        call CameraAim
        mov edx, 21Ch
        mov eax, 0E8h
        call CameraNearNet
        mov edx, dword [dword_179D50]
        mov ebx, eax
        mov eax, dword [dword_179D58]
        sub edx, dword [dword_179DCE]
        sub eax, dword [dword_179DD6]
        test ebx, ebx
        je short .10
        push eax
        push edx
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DCA], eax
        cmp eax, 0FFFFE71Dh
        jge short .9
        mov dword [dword_179DCA], 0FFFFE71Dh
        pop edx
        pop ecx
        pop ebx
        ret
.9:
        cmp eax, 0FFFFECCDh
        jle short .12
        mov dword [dword_179DCA], 0FFFFECCDh
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
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DCA], eax
        cmp eax, 0FFFFEAABh
        jge short .11
        mov dword [dword_179DCA], 0FFFFEAABh
        pop edx
        pop ecx
        pop ebx
        ret
.11:
        cmp eax, 0FFFFF05Ch
        jle short .12
        mov dword [dword_179DCA], 0FFFFF05Ch
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
        mov eax, dword [dword_179D50]
        mov esi, dword [InReplay]
        add eax, dword [dword_11B368]
        and esi, 200h
        mov dword [dword_179DCE], eax
        or esi, dword [dword_11B374]
        cmp eax, 0FFFFFD08h
        jge short .1
        mov dword [dword_179DCE], 0FFFFFD08h
        jmp short .2
.1:
        cmp eax, 2F8h
        jle short .2
        mov dword [dword_179DCE], 2F8h
.2:
        imul eax, dword [dword_11BAD4], dword 0A0h
        mov edx, dword [dword_179D58]
        mov dword [dword_179DD2], 1CCh
        add edx, dword [dword_11B370]
        add eax, SortCords
        test esi, esi
        je near .6
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx ebx, al
        lea eax, [dword edx+0488h]
        test ebx, ebx
        je short .3
        cmp dword [dword_179D58], 1D0h
        jle short .4
        mov dword [dword_179DD6], 848h
        jmp short .5
.3:
        cmp dword [dword_179D58], 0FFFFFE30h
        jge short .4
        mov dword [dword_179DD6], 0A0h
        jmp short .5
.4:
        mov dword [dword_179DD6], eax
.5:
        cmp dword [dword_179DD6], byte 0
        jl near .11
        cmp dword [dword_179DD6], 848h
        jle near .12
        mov dword [dword_179DD6], 848h
        jmp near .12
.6:
        mov al, byte [byte eax+044h]
        and al, 80h
        movzx eax, al
        sub edx, 488h
        test eax, eax
        je short .7
        cmp dword [dword_179D58], 1D0h
        jle short .8
        mov dword [dword_179DD6], 0FFFFFF60h
        jmp short .9
.7:
        cmp dword [dword_179D58], 0FFFFFE30h
        jge short .8
        mov dword [dword_179DD6], 0FFFFF7B8h
        jmp short .9
.8:
        mov dword [dword_179DD6], edx
.9:
        cmp dword [dword_179DD6], 0FFFFF7B8h
        jge short .10
        mov dword [dword_179DD6], 0FFFFF7B8h
        jmp short .12
.10:
        cmp dword [dword_179DD6], byte 0
        jle short .12
.11:
        mov dword [dword_179DD6], 0
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
        mov dword [dword_179DC6], eax
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DCA], eax
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
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [byte ebp-0Ch]
        sub eax, dword [dword_179DCE]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DC6], eax
        test esi, esi
        je short .21
        test eax, eax
        jle short .19
        cmp eax, 5555h
        jge short .18
        mov dword [dword_179DC6], 5555h
        jmp short .23
.18:
        cmp eax, 8000h
        jle short .23
        mov dword [dword_179DC6], 8000h
        jmp short .23
.19:
        cmp eax, 0FFFF8000h
        jge short .20
        mov dword [dword_179DC6], 0FFFF8000h
        jmp short .23
.20:
        cmp eax, 0FFFFAAABh
        jle short .23
        mov dword [dword_179DC6], 0FFFFAAABh
        jmp short .23
.21:
        cmp eax, 0FFFFD556h
        jge short .22
        mov dword [dword_179DC6], 0FFFFD556h
        jmp short .23
.22:
        cmp eax, 2AAAh
        jle short .23
        mov dword [dword_179DC6], 2AAAh
.23:
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DCA], eax
        cmp eax, 0FFFFEE39h
        jge short .24
        mov dword [dword_179DCA], 0FFFFEE39h
        jmp short CamView234_2D0
.24:
        cmp eax, 0FFFFF1C8h
        jle short CamView234_2D0
        mov dword [dword_179DCA], 0FFFFF1C8h
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
        mov eax, dword [dword_11B370]
        and esi, 200h
        add dword [dword_179D58], eax
        mov eax, dword [dword_179D50]
        or esi, dword [dword_11B374]
        mov dword [dword_179DCE], eax
        cmp eax, 0FFFFFD30h
        jge short .1
        mov dword [dword_179DCE], 0FFFFFD30h
        jmp short .2
.1:
        cmp eax, 2D0h
        jle short .2
        mov dword [dword_179DCE], 2D0h
.2:
        test esi, esi
        je short .4
        mov eax, dword [dword_179D58]
        add eax, 3C0h
        mov dword [dword_179DD6], eax
        test eax, eax
        jge short .3
        mov dword [dword_179DD6], 0
        jmp short .6
.3:
        cmp eax, 780h
        jle short .6
        mov dword [dword_179DD6], 780h
        jmp short .6
.4:
        mov eax, dword [dword_179D58]
        sub eax, 3C0h
        mov dword [dword_179DD6], eax
        cmp eax, 0FFFFF880h
        jge short .5
        mov dword [dword_179DD6], 0FFFFF880h
        jmp short .6
.5:
        test eax, eax
        jle short .6
        mov dword [dword_179DD6], esi
.6:
        cmp dword [dword_179DD6], byte 0
        jge short .7
        mov eax, dword [dword_179DD6]
        neg eax
        jmp short .8
.7:
        mov eax, dword [dword_179DD6]
.8:
        cmp eax, 640h
        jle short .9
        mov dword [dword_179DD2], 0C8h
        jmp short .10
.9:
        mov dword [dword_179DD2], 8Ch
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
        mov dword [dword_179DC6], eax
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DCA], eax
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
        cmp dword [dword_179D50], byte 0
        jge short .16
        mov dword [byte ebp-0Ch], 0FFFFFFB0h
        jmp short .17
.16:
        mov dword [byte ebp-0Ch], 50h
.17:
        mov eax, dword [byte ebp-04h]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [byte ebp-0Ch]
        sub eax, dword [dword_179DCE]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DC6], eax
        test esi, esi
        je short .21
        test eax, eax
        jle short .19
        cmp eax, 5555h
        jge short .18
        mov dword [dword_179DC6], 5555h
        jmp short .23
.18:
        cmp eax, 8000h
        jle short .23
        mov dword [dword_179DC6], 8000h
        jmp short .23
.19:
        cmp eax, 0FFFF8000h
        jge short .20
        mov dword [dword_179DC6], 0FFFF8000h
        jmp short .23
.20:
        cmp eax, 0FFFFAAABh
        jle short .23
        mov dword [dword_179DC6], 0FFFFAAABh
        jmp short .23
.21:
        cmp eax, 0FFFFD556h
        jge short .22
        mov dword [dword_179DC6], 0FFFFD556h
        jmp short .23
.22:
        cmp eax, 2AAAh
        jle short .23
        mov dword [dword_179DC6], 2AAAh
.23:
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DCA], eax
        cmp eax, 0FFFFF27Eh
        jge short .24
        mov dword [dword_179DCA], 0FFFFF27Eh
        jmp near CamView234_2D0
.24:
        cmp eax, 0FFFFFC72h
        jle near CamView234_2D0
        mov dword [dword_179DCA], 0FFFFFC72h
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
        mov esi, dword_179D50
        call CameraTrackPuck
        call CameraLeadOffset
        movsd
        movsd
        movsd
        mov edx, dword [InReplay]
        mov eax, dword [dword_11B370]
        and edx, 200h
        add dword [dword_179D58], eax
        or edx, dword [dword_11B374]
        je short .1
        mov dword [dword_179DCE], 550h
        jmp short .2
.1:
        mov dword [dword_179DCE], 0FFFFFAB0h
.2:
        mov eax, dword [dword_179D58]
        mov dword [dword_179DD2], 320h
        mov dword [dword_179DD6], eax
        cmp eax, 0FFFFFE30h
        jge short .3
        mov dword [dword_179DD6], 0FFFFFE30h
        jmp short .4
.3:
        cmp eax, 1D0h
        jle short .4
        mov dword [dword_179DD6], 1D0h
.4:
        call CameraAim
        imul eax, dword [dword_11BAD4], dword 0A0h
        add eax, SortCords
        mov al, byte [byte eax+044h]
        and al, 80h
        mov ebx, dword [dword_179D50]
        movzx ecx, al
        mov eax, dword [dword_179D58]
        sub ebx, dword [dword_179DCE]
        sub eax, dword [dword_179DD6]
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
        fistp dword [dword_179DC6]
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
        mov dword [dword_179DC6], eax
.24:
        mov eax, dword [dword_11B370]
        sub dword [dword_179D58], eax
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        mov edx, dword [dword_179D50]
        push eax
CamView236_1E7:
        sub edx, dword [dword_179DCE]
        push edx
        jmp near CamView236_403.50
.25:
        cmp eax, 0FFFFEAABh
        jle near CamShot242_278
        mov dword [dword_179DCA], 0FFFFEAABh
        jmp near CamShot242_278
CamView236_20D:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 24h, 0
        lea edi, [byte ebp-024h]
        mov esi, dword_179D50
        call CameraTrackPuck
        call CameraLeadOffset
        movsd
        movsd
        movsd
        mov ebx, dword [InReplay]
        mov eax, dword [dword_11B370]
        and ebx, 200h
        add dword [dword_179D58], eax
        or ebx, dword [dword_11B374]
        je short .26
        mov dword [dword_179DCE], 550h
        jmp short .27
.26:
        mov dword [dword_179DCE], 0FFFFFAB0h
.27:
        mov eax, dword [dword_179D58]
        mov dword [dword_179DD2], 320h
        mov dword [dword_179DD6], eax
        cmp eax, 0FFFFFE30h
        jge short .28
        mov dword [dword_179DD6], 0FFFFFE30h
        jmp short .29
.28:
        cmp eax, 1D0h
        jle short .29
        mov dword [dword_179DD6], 1D0h
.29:
        call CameraAim
        mov edx, 258h
        mov eax, 320h
        call CameraNearNet
        imul eax, dword [dword_11BAD4], dword 0A0h
        add eax, SortCords
        mov al, byte [byte eax+044h]
        and al, 80h
        mov edx, dword [dword_179D50]
        movzx ecx, al
        mov eax, dword [dword_179D58]
        sub edx, dword [dword_179DCE]
        sub eax, dword [dword_179DD6]
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
        fmul qword [qword_11109C]
        call __CHP
        fistp dword [dword_179DC6]
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
        mov dword [dword_179DC6], eax
.49:
        mov eax, dword [dword_11B370]
        sub dword [dword_179D58], eax
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        mov ebx, dword [dword_179D50]
        push eax
CamView236_403:
        sub ebx, dword [dword_179DCE]
        push ebx
.50:
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DCA], eax
        cmp eax, 0FFFFE7D3h
        jge near CamView236_1E7.25
        mov dword [dword_179DCA], 0FFFFE7D3h
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
        mov esi, dword_179D50
        call CameraTrackPuck
        call CameraLeadOffset
        movsd
        movsd
        movsd
        mov edx, dword [InReplay]
        mov eax, dword [dword_11B370]
        and edx, 200h
        add dword [dword_179D58], eax
        or edx, dword [dword_11B374]
        je short .1
        mov dword [dword_179DCE], 550h
        jmp short .2
.1:
        mov dword [dword_179DCE], 0FFFFFAB0h
.2:
        mov dword [dword_179DD2], 320h
        mov dword [dword_179DD6], 0
        call CameraAim
        imul eax, dword [dword_11BAD4], dword 0A0h
        add eax, SortCords
        mov al, byte [byte eax+044h]
        and al, 80h
        mov ebx, dword [dword_179D50]
        movzx ecx, al
        mov eax, dword [dword_179D58]
        sub ebx, dword [dword_179DCE]
        sub eax, dword [dword_179DD6]
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
        fistp dword [dword_179DC6]
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
        mov dword [dword_179DC6], eax
.22:
        mov eax, dword [dword_11B370]
        sub dword [dword_179D58], eax
        mov edx, dword [dword_179D58]
        sub edx, dword [dword_179DD6]
        push edx
        mov edx, dword [dword_179D50]
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
        mov esi, dword_179D50
        call CameraTrackPuck
        call CameraLeadOffset
        movsd
        movsd
        movsd
        mov ebx, dword [InReplay]
        mov eax, dword [dword_11B370]
        and ebx, 200h
        add dword [dword_179D58], eax
        or ebx, dword [dword_11B374]
        je short .1
        mov dword [dword_179DCE], 550h
        jmp short .2
.1:
        mov dword [dword_179DCE], 0FFFFFAB0h
.2:
        mov dword [dword_179DD2], 320h
        mov dword [dword_179DD6], 0
        mov edx, 258h
        call CameraAim
        mov eax, 320h
        call CameraNearNet
        imul eax, dword [dword_11BAD4], dword 0A0h
        add eax, SortCords
        mov al, byte [byte eax+044h]
        and al, 80h
        mov edx, dword [dword_179D50]
        movzx ecx, al
        mov eax, dword [dword_179D58]
        sub edx, dword [dword_179DCE]
        sub eax, dword [dword_179DD6]
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
        fistp dword [dword_179DC6]
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
        mov dword [dword_179DC6], eax
.22:
        mov eax, dword [dword_11B370]
        sub dword [dword_179D58], eax
        mov ebx, dword [dword_179D58]
        sub ebx, dword [dword_179DD6]
        push ebx
        mov ebx, dword [dword_179D50]
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
        imul edx, dword [dword_11BAD4], dword 0A0h
        mov eax, dword [dword_11B370]
        xor esi, esi
        xor edi, edi
        add dword [dword_179D58], eax
        mov eax, dword [InReplay]
        mov ebx, dword [dword_179D58]
        and eax, 200h
        sub ebx, dword [dword_11B370]
        or eax, dword [dword_11B374]
        add edx, SortCords
        cmp ebx, 0FFFFFE30h
        jle near .7
        cmp ebx, 1D0h
        jge short .7
        cmp dword [dword_11BAD8], byte 0
        jne short .2
        cmp dword [dword_179D50], byte 0
        jge short .1
        mov dword [dword_11BAD8], 0FFFFFFFFh
        jmp short .2
.1:
        mov dword [dword_11BAD8], 1
.2:
        cmp dword [dword_11BAD8], byte 0
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
        mov dword [dword_179DCE], eax
        mov dword [dword_179DD2], 320h
        jmp near .32
.7:
        mov ebx, dword [dword_179D58]
        sub ebx, dword [dword_11B370]
        cmp ebx, 1D0h
        jl near .19
        mov dl, byte [byte edx+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        je near .12
        mov eax, dword [dword_179D50]
        mov dword [dword_179DD2], 1F4h
        mov dword [dword_179DCE], eax
        cmp eax, 0FFFFFEE8h
        jge short .8
        mov dword [dword_179DCE], 0FFFFFEE8h
        jmp short .9
.8:
        cmp eax, 118h
        jle short .9
        mov dword [dword_179DCE], 118h
.9:
        mov eax, dword [dword_179D58]
        sub eax, 49Ch
        mov dword [dword_179DD6], eax
        cmp eax, 0FFFFF768h
        jge short .10
        mov dword [dword_179DD6], 0FFFFF768h
        jmp short .11
.10:
        cmp eax, 0FFFFFF00h
        jle short .11
        mov dword [dword_179DD6], 0FFFFFF00h
.11:
        mov edi, 0FFFFED83h
        mov dword [dword_11BAD8], 0
        mov esi, edi
        jmp near .33
.12:
        mov dword [dword_179DD2], 4B0h
        cmp dword [dword_11BAD8], byte 0
        jne short .14
        cmp dword [dword_179D50], byte 0
        jge short .13
        mov dword [dword_11BAD8], 0FFFFFFFFh
        jmp short .14
.13:
        mov dword [dword_11BAD8], 1
.14:
        cmp dword [dword_11BAD8], byte 0
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
        mov dword [dword_179DCE], eax
        jmp near .32
.19:
        mov dl, byte [byte edx+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        jne near .23
        mov eax, dword [dword_179D50]
        mov dword [dword_179DD2], 1F4h
        mov dword [dword_179DCE], eax
        cmp eax, 0FFFFFEE8h
        jge short .20
        mov dword [dword_179DCE], 0FFFFFEE8h
        jmp short .21
.20:
        cmp eax, 118h
        jle short .21
        mov dword [dword_179DCE], 118h
.21:
        mov eax, dword [dword_179D58]
        add eax, 49Ch
        mov dword [dword_179DD6], eax
        cmp eax, 100h
        jge short .22
        mov dword [dword_179DD6], 100h
        jmp near .11
.22:
        cmp eax, 898h
        jle near .11
        mov dword [dword_179DD6], 898h
        jmp near .11
.23:
        test eax, eax
        je short .24
        mov edx, 550h
        jmp short .25
.24:
        mov edx, 0FFFFFAB0h
.25:
        mov dword [dword_179DD2], 4B0h
        mov dword [dword_179DCE], edx
        cmp dword [dword_11BAD8], byte 0
        jne short .27
        cmp dword [dword_179D50], byte 0
        jge short .26
        mov dword [dword_11BAD8], 0FFFFFFFFh
        jmp short .27
.26:
        mov dword [dword_11BAD8], 1
.27:
        cmp dword [dword_11BAD8], byte 0
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
        mov dword [dword_179DCE], eax
.32:
        mov dword [dword_179DD6], 0
.33:
        call CameraAim
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call AngleOfVector
        neg eax
        mov dword [dword_179DC6], eax
        mov eax, dword [dword_179D58]
        add esp, byte 8
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DCA], eax
        test esi, esi
        je near CamShot242_279
        cmp eax, esi
        jge short .34
        mov dword [dword_179DCA], esi
        jmp near CamShot242_279
.34:
        cmp eax, edi
        jle near CamShot242_279
        mov dword [dword_179DCA], edi
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
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        mov dword [dword_179DCA], eax
        mov eax, dword [dword_179D58]
        add esp, byte 8
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DC6], eax
        cmp dword [dword_179DCA], 0FFFFE38Fh
        jge short .1
        mov dword [dword_179DCA], 0FFFFE38Fh
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        cmp dword [dword_179DCA], byte 0
        jle short .2
        mov dword [dword_179DCA], 0
.2:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamShot23F                                      5FB98  96 PC, low confidence
; Cut-scene shot handler of record unk_11B787
;-----------------------------------------------------------------------------
CamShot23F:
        push ebx
        push ecx
        push edx
        call CameraTrackPuck
        mov eax, dword [InReplay]
        mov dword [dword_179DCE], 0
        and eax, 200h
        mov dword [dword_179DD2], 8Ch
        or eax, dword [dword_11B374]
        je short .1
        mov dword [dword_179DD6], 708h
        jmp short CamShot23F_44
.1:
        mov dword [dword_179DD6], 0FFFFF8F8h
CamShot23F_44:
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        mov dword [dword_179DCA], eax
        mov eax, dword [dword_179D58]
        add esp, byte 8
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DC6], eax
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CamShot240                                      5FC3D  96 PC, low confidence
; Cut-scene shot handler of record unk_11B7CC; its tail CamShot240_56 is text
; 241h's (view kind 0Ch)
;-----------------------------------------------------------------------------
CamShot240:
        push ebx
        push ecx
        push edx
        call CameraTrackPuck
        mov eax, dword [InReplay]
        and eax, 200h
        mov dword [dword_179DD2], 50h
        or eax, dword [dword_11B374]
        je short .1
        mov dword [dword_179DCE], 0FFFFFFE4h
        mov dword [dword_179DD6], 590h
        jmp near CamShot23F_44
.1:
        mov dword [dword_179DCE], 1Ch
        mov dword [dword_179DD6], 0FFFFFA70h
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
        imul edx, dword [dword_179CBC], dword 0A0h
        add edx, SortCords
        cmp dword [penshotmode], byte 0
        je short .3
        cmp dword [penshotlive], byte 0
        jne short .3
        mov dword [dword_179D58], 0
        mov dword [dword_179D50], 0
        jmp short .4
.3:
        call CameraTrackPuck
.4:
        mov dl, byte [byte edx+044h]
        and dl, 80h
        movzx edx, dl
        test edx, edx
        je short .5
        mov edx, dword [dword_179D58]
        sub edx, 294h
        mov dword [dword_179DC6], 0
        jmp short .6
.5:
        mov edx, dword [dword_179D58]
        add edx, 294h
        mov dword [dword_179DC6], 8000h
.6:
        mov dword [dword_179DD6], edx
        mov edx, dword [dword_179D50]
        mov dword [dword_179DD2], 1F4h
        mov dword [dword_179DCE], edx
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
        mov esi, unk_5D561
        movsd
        movsd
        movsd
        cmp dword [dword_11BADC], byte 0FFFFFFFFh
        jne short .1
        call GetTicks
        mov dword [dword_11BADC], eax
        imul eax, dword [dword_179D6C], dword 0A0h
        mov al, byte [dword eax+SortCords+47h]
        mov byte [byte_179E47], al
.1:
        call GetTicks
        sub eax, dword [dword_11BADC]
        cmp eax, 320h
        jge short .2
        cmp dword [dword_179D5C], byte 1Eh
        je short .2
        imul eax, dword [dword_179CBC], dword 0A0h
        mov al, byte [dword eax+SortCords+47h]
        cmp al, byte [byte_179E47]
        je short .3
.2:
        mov eax, 4
        call EndCameraShot
        mov dword [dword_11BADC], 0FFFFFFFFh
.3:
        call CameraTrackPuck
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
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
        mov eax, dword [dword_179D50]
        sub eax, dword [byte ebp-018h]
        mov dword [dword_179DCE], eax
        mov eax, dword [dword_179D58]
        sub eax, dword [byte ebp-010h]
        mov dword [dword_179DD6], eax
        mov eax, dword [dword_179D58]
        add esp, byte 0Ch
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        mov dword [dword_179DD2], 190h
        jmp near CamShot242_209.8
CamShot242_126:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 3Ch, 0
        lea edi, [byte ebp-018h]
        mov esi, unk_5D56D
        movsd
        movsd
        movsd
        cmp dword [dword_11BAE0], byte 0FFFFFFFFh
        jne short .5
        call GetTicks
        mov dword [dword_11BAE0], eax
.5:
        call GetTicks
        sub eax, dword [dword_11BAE0]
        cmp eax, 320h
        jl short .6
        mov dword [dword_11BAE0], 0FFFFFFFFh
        cmp dword [dword_11B334], byte 0
        je short .6
        mov eax, 3
        call EndCameraShot
.6:
        mov dword [dword_179D58], 0
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        mov dword [dword_179D50], 0
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        mov dword [dword_179D54], 0
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
        mov eax, dword [dword_179D50]
        sub eax, dword [byte ebp-0Ch]
        mov dword [dword_179DCE], eax
        mov eax, dword [dword_179D58]
        sub eax, dword [byte ebp-04h]
CamShot242_209:
        mov dword [dword_179DD6], eax
        mov eax, dword [dword_179D58]
        add esp, byte 0Ch
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        mov dword [dword_179DD2], 0C8h
.8:
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        mov dword [dword_179DCA], eax
        mov eax, dword [dword_179D58]
        add esp, byte 8
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
CamShot242_269:
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DC6], eax
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
        mov dword [dword_179CBC], eax
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [dword_11B370]
        add dword [dword_179D58], eax
        mov eax, dword [dword_179D50]
        mov dword [dword_179DCE], eax
        cmp eax, 0FFFFFE98h
        jge short .4
        mov dword [dword_179DCE], 0FFFFFE98h
        jmp short .5
.4:
        cmp eax, 168h
        jle short .5
        mov dword [dword_179DCE], 168h
.5:
        mov eax, dword [dword_179D58]
        sub eax, 424h
        mov dword [dword_179DD2], 1F4h
        mov dword [dword_179DD6], eax
        cmp eax, 0FFFFF7E0h
        jge short .6
        mov dword [dword_179DD6], 0FFFFF7E0h
        jmp short .7
.6:
        test eax, eax
        jle short .7
        mov dword [dword_179DD6], 0
.7:
        mov dword [dword_179DC6], 0
        mov dword [dword_179DCA], 0FFFFEAABh
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
        mov esi, unk_5D579
        movsd
        movsd
        movsd
        cmp dword [dword_11BAE4], byte 0FFFFFFFFh
        jne short .1
        call GetTicks
        mov dword [dword_11BAE4], eax
.1:
        call GetTicks
        sub eax, dword [dword_11BAE4]
        cmp eax, 1F4h
        jge short .2
        cmp dword [dword_179D5C], byte 1Eh
        jne short .3
.2:
        mov eax, 6
        mov dword [dword_11BAE4], 0FFFFFFFFh
        call EndCameraShot
.3:
        call CameraTrackPuck
        call CameraLeadOffset
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179E1B]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179E13]
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
        mov eax, dword [dword_179D50]
        sub eax, dword [byte ebp-018h]
        mov dword [dword_179DCE], eax
        mov eax, dword [dword_179D58]
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
        mov esi, unk_5D585
        movsd
        movsd
        movsd
        imul eax, dword [dword_179CBC], dword 0A0h
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
        cmp dword [dword_179DC6], 0FFFFC000h
        jl short .2
        cmp dword [dword_179DC6], 4000h
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
        mov dword [dword_179DCE], eax
        mov eax, dword [byte ebp-04h]
        sub eax, dword [byte ebp-034h]
        mov dword [dword_179DD6], eax
        mov eax, dword [byte ebp-04h]
        add esp, byte 0Ch
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [byte ebp-0Ch]
        sub eax, dword [dword_179DCE]
        push eax
        mov dword [dword_179DD2], 190h
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        mov dword [dword_179DCA], eax
        mov eax, dword [byte ebp-04h]
        add esp, byte 8
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [byte ebp-0Ch]
        sub eax, dword [dword_179DCE]
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
        mov esi, unk_5D591
        rep movsd
        mov byte [byte_1175AC], 1
        mov al, byte [byte_1175A9]
        mov dword [dword_179D74], 1
        mov byte [byte_1175AA], al
        cmp dword [dword_179D68], byte 0Ah
        jge short .2
        inc dword [dword_179D68]
        imul esi, dword [dword_179D68], byte 0Ch
        mov edi, dword_179DCE
        lea esi, [dword esi+ebp-084h]
        movsd
        movsd
        movsd
        mov dword [dword_179D58], 0
        mov dword [dword_179D50], 0
        cmp dword [dword_179D68], byte 7
        jl short .1
        mov dword [dword_179D54], 0
        jmp short .3
.1:
        mov eax, dword [dword_179DD2]
        sub eax, 578h
        mov dword [dword_179D54], eax
        jmp short .4
.2:
        mov dword [dword_179D54], 0
        mov dword [dword_179D50], 0
.3:
        mov dword [dword_179D58], 1D0h
.4:
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call vecdist
        add esp, byte 8
        push eax
        mov eax, dword [dword_179DD2]
        sub eax, dword [dword_179D54]
        push eax
        call AngleOfVector
        neg eax
        mov dword [dword_179DCA], eax
        mov eax, dword [dword_179D58]
        add esp, byte 8
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call AngleOfVector
        neg eax
        add esp, byte 8
        mov dword [dword_179DC6], eax
        cmp dword [DemoMode], byte 0
        je near CamShot242_278
        mov dword [dword_179D60], 0FFFFFFFFh
        mov esi, 5
        call rand_
        cdq
        idiv esi
        inc edx
        mov dword [dword_179D64], edx
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
        cmp dword [dword_179DD2], 0B40h
        je near CamShot23B_B3.6
        mov dword [dword_179DCE], 0AA0h
        mov dword [dword_179DD2], 0B40h
        mov dword [dword_179DD6], 0C80h
        cmp dword [dword_179E13], byte 0
        jge short .2
        cmp dword [dword_179E1B], byte 0
        jge short .1
        mov dword [dword_179DD6], 0FFFFF380h
.1:
        neg dword [dword_179DCE]
        jmp short .3
.2:
        cmp dword [dword_179E1B], byte 0
        jge short .3
        mov dword [dword_179DD6], 0FFFFF380h
.3:
        cmp dword [dword_179DCE], byte 0
        jge short .4
        mov dword [dword_179D50], 2A8h
        jmp short .5
.4:
        mov dword [dword_179D50], 0FFFFFD58h
.5:
        mov dword [dword_179D58], 0
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        mov dword [dword_179D54], 4B0h
CamShot23B_B3:
        call vecdist
        add esp, byte 8
        push eax
        push dword [dword_179DD2]
        call AngleOfVector
        neg eax
        mov dword [dword_179DCA], eax
        mov eax, dword [dword_179D58]
        add esp, byte 8
        sub eax, dword [dword_179DD6]
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        call AngleOfVector
        mov byte [byte_1175AC], 1
        neg eax
        mov dword [dword_179D74], 1
        mov dword [dword_179DC6], eax
        mov al, byte [byte_1175A9]
        add esp, byte 8
        mov byte [byte_1175AA], al
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
        cmp dword [dword_1798EC], 4000h
        je short .1
        mov edx, TeamRosterPtrs+320h
        mov eax, 4000h
        mov dword [dword_1798EC], 4000h
        call BuildShadeLut
.1:
        mov dword [dword_179DCE], 2A8h
        mov dword [dword_179DD2], 1B8h
        mov dword [dword_179DD6], 0FFFFF8F8h
        cmp dword [dword_179E13], byte 0
        jge short .2
        mov dword [dword_179DCE], 0FFFFFD58h
.2:
        cmp dword [dword_179E1B], byte 0
        jle short .3
        neg dword [dword_179DD6]
.3:
        mov dword [dword_179D58], 0
        mov eax, dword [dword_179D58]
        sub eax, dword [dword_179DD6]
        mov dword [dword_179D50], 0
        push eax
        mov eax, dword [dword_179D50]
        sub eax, dword [dword_179DCE]
        push eax
        mov dword [dword_179D54], 0
        jmp near CamShot23B_B3
        push ebx
        push ecx
        push esi
        push edi
        mov ebx, dword [dword_179DC2]
        cmp ebx, dword [byte eax+05h]
        jne short .4
        mov eax, dword [dword_179D44]
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
.4:
        cmp dword [dword_11B334], byte 0
        jne short .5
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.5:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        test edx, edx
        je short .6
        mov edi, dword_179DCE
        mov esi, dword_179E13
        movsd
        movsd
        movsd
        mov edi, dword_179DC6
        mov esi, dword_179E0B
        movsd
        movsd
.6:
        call CameraPathDerivs
        mov dword [dword_179D48], 2A00h
        xor eax, eax
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        push esi
        push edi
        cmp dword [dword_11B334], byte 0
        je short .7
        mov eax, dword [dword_179D78]
        mov dword [dword_179DBD], eax
        mov al, byte [byte_179D7C]
        mov edi, dword_179DCE
        mov byte [byte_179DC1], al
        mov eax, dword [dword_179D7D]
        mov esi, dword_179E13
        mov dword [dword_179DC2], eax
        movsd
        movsd
        movsd
        mov edi, dword_179DC6
        mov esi, dword_179E0B
        movsd
        movsd
        mov dword [dword_11B334], 0
        call dword [dword_179DC2]
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
        mov esi, dword [dword_11B364]
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
        mov dword [dword_179D68], 0FFFFFFFFh
        mov dword [dword_11B8F1], 0
        mov dword [dword_11B8F5], 0BB8h
        mov dword [dword_11B8F9], 0FFFFF060h
        mov eax, dword [GsOptions]
        mov dword [dword_11B8E9], 0
        and eax, byte 1
        mov dword [dword_11B8ED], 0FFFFE38Fh
        mov byte [byte_1175AA], al
        mov byte [byte_1175A9], al
        jmp near CameraNearNet_12E
;-----------------------------------------------------------------------------
; EndCameraShot                                60777  96 PC, medium confidence
; (shot): takes a cut-scene shot off the shot list (dword_11B364) and returns
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
        mov eax, dword [dword_11B364]
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
        cmp dword [dword_11B334], byte 0
        je short .2
        mov eax, dword [dword_179D78]
        mov dword [dword_179DBD], eax
        mov al, byte [byte_179D7C]
        mov edi, dword_179DCE
        mov byte [byte_179DC1], al
        mov eax, dword [dword_179D7D]
        mov esi, dword_179E13
        mov dword [dword_179DC2], eax
        movsd
        movsd
        movsd
        mov edi, dword_179DC6
        mov esi, dword_179E0B
        movsd
        movsd
        mov dword [dword_11B334], 0
        call dword [dword_179DC2]
.2:
        cmp dword [byte ebp-04h], byte 8
        jne near CamShot242_278
        mov dword [dword_179D68], 0FFFFFFFFh
        mov byte [byte_1175AA], 0
        jmp near CamShot242_278
.3:
        mov eax, edx
        jmp near .1
;-----------------------------------------------------------------------------
; SetGameViewSize                              60823  96 PC, medium confidence
; Sets the game view rectangle (dword_11B314-11B31C) for the view size option
; (dword_11B330) and resolution, clears the screen
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
        mov esi, unk_5D65D
        rep movsd
        mov ecx, 9
        lea edi, [dword ebp-090h]
        mov esi, unk_5D681
        rep movsd
        mov eax, dword [dword_11B330]
        shl eax, 2
        test byte [GsOptions+1], 20h
        je short .1
        mov edx, dword [byte eax+ebp-06Ch]
        mov dword [dword_11B318], edx
        mov eax, dword [dword eax+ebp-090h]
        mov dword [dword_11B31C], eax
        mov eax, edx
        mov edx, 140h
        sar eax, 1
        sub edx, eax
        mov eax, dword [dword_11B31C]
        mov dword [dword_11B328], edx
        mov edx, 0F0h
        sar eax, 1
        mov dword [dword_11B320], 140h
        sub edx, eax
        mov dword [str_D_DrawGameFrame], 0F0h
        jmp short .2
.1:
        mov edx, dword [byte eax+ebp-024h]
        mov dword [dword_11B318], edx
        mov eax, dword [byte eax+ebp-048h]
        mov dword [dword_11B31C], eax
        mov eax, edx
        mov edx, 0A0h
        sar eax, 1
        sub edx, eax
        mov eax, dword [dword_11B31C]
        mov dword [dword_11B328], edx
        mov edx, 64h
        sar eax, 1
        mov dword [dword_11B320], 0A0h
        sub edx, eax
        mov dword [str_D_DrawGameFrame], 64h
.2:
        mov dword [dword_11B32C], edx
        push dword [dword_11B31C]
        push dword [dword_11B318]
        push byte 0
        push dword [dword_11B314]
        call SetViewFov
        add esp, byte 10h
        call BuildPerspTable
        push dword [dword_11B32C]
        push dword [dword_11B328]
        call SetViewScreenOrigin
        add esp, byte 8
        push dword [ReplayRemoteShape]
        call SetDrawBitmap
        add esp, byte 4
        call FullViewClip
        push byte 0
        call ClearClipRect
        mov eax, dword [dword_11B32C]
        add esp, byte 4
        add eax, dword [dword_11B31C]
        push eax
        mov eax, dword [dword_11B328]
        push dword [dword_11B32C]
        add eax, dword [dword_11B318]
        push eax
        push dword [dword_11B328]
        call SetClipWindow
        add esp, byte 10h
        call SetRinkClipWindow
        mov eax, dword [dword_11B330]
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
        cmp eax, dword [dword_11BAE8]
        jle near .9
        push byte 2
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .1
        call GetTicks
        cmp eax, dword [dword_11BAEC]
        jle short .1
        mov eax, dword [GsOptions]
        and eax, byte 1
        xor al, 1
        and eax, byte 1
        and byte [GsOptions], 0FEh
        mov byte [byte_1175A9], al
        or dword [GsOptions], eax
        call GetTicks
        add eax, byte 19h
        mov dword [dword_11BAEC], eax
.1:
        push byte 3
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .2
        call GetTicks
        cmp eax, dword [dword_11BAF0]
        jle short .2
        mov eax, dword [GsOptions]
        shl eax, 1Eh
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        lea edx, [eax+eax]
        and byte [GsOptions], 0FDh
        mov byte [byte_1175A6], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [dword_11BAF0], eax
.2:
        push byte 4
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .3
        call GetTicks
        cmp eax, dword [dword_11BAF4]
        jle short .3
        mov eax, dword [GsOptions]
        shl eax, 1Dh
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 0FBh
        shl edx, 2
        mov byte [byte_1175A8], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [dword_11BAF4], eax
.3:
        push byte 5
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .4
        call GetTicks
        cmp eax, dword [dword_11BAF8]
        jle short .4
        mov eax, dword [GsOptions]
        shl eax, 1Ch
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 0F7h
        shl edx, 3
        mov byte [byte_1175A5], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [dword_11BAF8], eax
.4:
        push byte 6
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .5
        call GetTicks
        cmp eax, dword [dword_11BAFC]
        jle short .5
        mov eax, dword [GsOptions]
        shl eax, 1Bh
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 0EFh
        shl edx, 4
        mov byte [byte_1175A4], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [dword_11BAFC], eax
.5:
        push byte 7
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .6
        call GetTicks
        cmp eax, dword [dword_11BB00]
        jle short .6
        mov eax, dword [GsOptions]
        shl eax, 1Ah
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 0DFh
        shl edx, 5
        mov byte [byte_1175A7], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [dword_11BB00], eax
.6:
        push byte 8
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .7
        call GetTicks
        cmp eax, dword [dword_11BB04]
        jle short .7
        mov eax, dword [GsOptions]
        shl eax, 19h
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 0BFh
        shl edx, 6
        mov dword [dword_179978], eax
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [dword_11BB04], eax
.7:
        push byte 9
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .8
        call GetTicks
        cmp eax, dword [dword_11BB08]
        jle short .8
        mov eax, dword [GsOptions]
        shl eax, 18h
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions], 7Fh
        shl edx, 7
        mov dword [dword_17997C], eax
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [dword_11BB08], eax
.8:
        push byte 0Ah
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .9
        call GetTicks
        cmp eax, dword [dword_11BB0C]
        jle short .9
        mov eax, dword [GsOptions]
        shl eax, 17h
        shr eax, 1Fh
        xor al, 1
        and eax, byte 1
        mov edx, eax
        and byte [GsOptions+1], 0FEh
        shl edx, 8
        mov byte [byte_1175AB], al
        or dword [GsOptions], edx
        call GetTicks
        add eax, byte 19h
        mov dword [dword_11BB0C], eax
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
        cmp eax, dword [dword_11BB10]
        jle near CamShot242_279
        push dword [dword_11B31C]
        push dword [dword_11B318]
        push byte 0
        push dword [dword_11B314]
        xor byte [dword_11B374], 1
        call SetViewFov
        add esp, byte 10h
        mov edi, unk_179E02
        mov esi, dword_179DBD
        call BuildPerspTable
        mov ecx, 45h
        call dword [dword_179DC2]
        mov dword [dword_179D48], 0FFFFFFFFh
        rep movsb
        call CameraPathDerivs
        mov dword [dword_179D48], 0
        cmp dword [InReplay], byte 0
        je short .13
        mov ecx, 45h
        mov edi, dword_178243
        mov esi, unk_179E02
        rep movsb
.13:
        call GetTicks
        add eax, byte 19h
        mov dword [dword_11BB10], eax
        jmp near CamShot242_279
.14:
        cmp dword [dword_11B330], byte 0
        jle near CamShot242_279
        dec dword [dword_11B330]
.15:
        call SetGameViewSize
        jmp near CamShot242_279
.16:
        cmp dword [dword_11B330], byte 8
        jge near CamShot242_279
        inc dword [dword_11B330]
        jmp short .15
.17:
        inc dword [dword_11BB14]
        cmp dword [dword_11BB14], byte 1
        jle short .18
        mov dword [dword_11BB14], edx
.18:
        cmp dword [dword_11BB14], byte 0
        jne short .19
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B37C
        cmp edx, dword [dword_11B381]
        je near .21
        cmp dword [dword_11B334], byte 0
        je short .20
        mov edx, dword [dword_11B37C]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B380]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B381]
        mov dword [dword_179D7D], edx
        jmp short .20
.19:
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B3C1
        cmp edx, dword [dword_11B3C6]
        je short .21
        cmp dword [dword_11B334], byte 0
        je short .20
        mov edx, dword [dword_11B3C1]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B3C5]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B3C6]
        mov dword [dword_179D7D], edx
.20:
        mov edx, dword [eax]
        mov dword [dword_179DBD], edx
        mov dl, byte [byte eax+04h]
        mov byte [byte_179DC1], dl
        mov eax, dword [byte eax+05h]
        mov dword [dword_179DC2], eax
        call CameraPathDerivs
        mov dword [dword_179D48], 0
.21:
        mov eax, dword [dword_11B364]
        mov byte [byte eax+0Ch], 1
        mov eax, dword [dword_11BB14]
.22:
        mov dword [dword_11B244], eax
        jmp near CamShot242_279
.23:
        inc dword [dword_11BB1C]
        cmp dword [dword_11BB1C], byte 1
        jle short .24
        mov dword [dword_11BB1C], edx
.24:
        cmp dword [dword_11BB1C], byte 0
        jne short .25
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B406
        cmp edx, dword [dword_11B40B]
        je near .27
        cmp dword [dword_11B334], byte 0
        je short .26
        mov edx, dword [dword_11B406]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B40A]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B40B]
        mov dword [dword_179D7D], edx
        jmp short .26
.25:
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B44B
        cmp edx, dword [dword_11B450]
        je short .27
        cmp dword [dword_11B334], byte 0
        je short .26
        mov edx, dword [dword_11B44B]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B44F]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B450]
        mov dword [dword_179D7D], edx
.26:
        mov edx, dword [eax]
        mov dword [dword_179DBD], edx
        mov dl, byte [byte eax+04h]
        mov byte [byte_179DC1], dl
        mov eax, dword [byte eax+05h]
        mov dword [dword_179DC2], eax
        call CameraPathDerivs
        mov dword [dword_179D48], 0
.27:
        mov eax, dword [dword_11B364]
        mov byte [byte eax+0Ch], 2
        mov eax, dword [dword_11BB1C]
        jmp near .22
.28:
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B490
        cmp edx, dword [dword_11B495]
        je short .30
        cmp dword [dword_11B334], byte 0
        je short .29
        mov edx, dword [dword_11B490]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B494]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B495]
        mov dword [dword_179D7D], edx
.29:
        mov edx, dword [eax]
        mov dword [dword_179DBD], edx
        mov dl, byte [byte eax+04h]
        mov byte [byte_179DC1], dl
        mov eax, dword [byte eax+05h]
        mov dword [dword_179DC2], eax
        call CameraPathDerivs
        mov dword [dword_179D48], 0
.30:
        mov eax, dword [dword_11B364]
        mov byte [byte eax+0Ch], 3
        jmp near ReadHotKeys_7CF.42
.31:
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B4D5
        cmp edx, dword [dword_11B4DA]
        je short .33
        cmp dword [dword_11B334], byte 0
        je short .32
        mov edx, dword [dword_11B4D5]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B4D9]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B4DA]
        mov dword [dword_179D7D], edx
.32:
        mov edx, dword [eax]
        mov dword [dword_179DBD], edx
        mov dl, byte [byte eax+04h]
        mov byte [byte_179DC1], dl
        mov eax, dword [byte eax+05h]
        mov dword [dword_179DC2], eax
        call CameraPathDerivs
        mov dword [dword_179D48], 0
.33:
        mov eax, dword [dword_11B364]
        mov byte [byte eax+0Ch], 4
        jmp near ReadHotKeys_7CF.42
.34:
        inc dword [dword_11BB18]
        cmp dword [dword_11BB18], byte 3
        jle short .35
        mov dword [dword_11BB18], edx
.35:
        mov eax, dword [dword_11BB18]
        cmp eax, byte 3
        ja near ReadHotKeys_7CF.38
        jmp dword [nosplit cs:eax*4+jpt_609B6]
ReadHotKeys_6FB:
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B51A
        cmp edx, dword [dword_11B51F]
        je near ReadHotKeys_7CF.38
        cmp dword [dword_11B334], byte 0
        je near ReadHotKeys_7CF.37
        mov edx, dword [dword_11B51A]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B51E]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B51F]
.36:
        mov dword [dword_179D7D], edx
        jmp near ReadHotKeys_7CF.37
ReadHotKeys_748:
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B55F
        cmp edx, dword [dword_11B564]
        je near ReadHotKeys_7CF.38
        cmp dword [dword_11B334], byte 0
        je near ReadHotKeys_7CF.37
        mov edx, dword [dword_11B55F]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B563]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B564]
        jmp short ReadHotKeys_6FB.36
ReadHotKeys_78C:
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B5A4
        cmp edx, dword [dword_11B5A9]
        je near ReadHotKeys_7CF.38
        cmp dword [dword_11B334], byte 0
        je short ReadHotKeys_7CF.37
        mov edx, dword [dword_11B5A4]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B5A8]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B5A9]
        jmp near ReadHotKeys_6FB.36
ReadHotKeys_7CF:
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B5E9
        cmp edx, dword [dword_11B5EE]
        je short .38
        cmp dword [dword_11B334], byte 0
        je short .37
        mov edx, dword [dword_11B5E9]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B5ED]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B5EE]
        mov dword [dword_179D7D], edx
.37:
        mov edx, dword [eax]
        mov dword [dword_179DBD], edx
        mov dl, byte [byte eax+04h]
        mov byte [byte_179DC1], dl
        mov eax, dword [byte eax+05h]
        mov dword [dword_179DC2], eax
        call CameraPathDerivs
        mov dword [dword_179D48], 0
.38:
        mov eax, dword [dword_11B364]
        mov byte [byte eax+0Ch], 5
        mov eax, dword [dword_11BB18]
        jmp near ReadHotKeys.22
.39:
        mov edx, dword [dword_179DC2]
        mov eax, dword_11B62E
        cmp edx, dword [dword_11B633]
        je short .41
        cmp dword [dword_11B334], byte 0
        je short .40
        mov edx, dword [dword_11B62E]
        mov dword [dword_179D78], edx
        mov dl, byte [byte_11B632]
        mov byte [byte_179D7C], dl
        mov edx, dword [dword_11B633]
        mov dword [dword_179D7D], edx
.40:
        mov edx, dword [eax]
        mov dword [dword_179DBD], edx
        mov dl, byte [byte eax+04h]
        mov byte [byte_179DC1], dl
        mov eax, dword [byte eax+05h]
        mov dword [dword_179DC2], eax
        call CameraPathDerivs
        mov dword [dword_179D48], 0
.41:
        mov eax, dword [dword_11B364]
        mov byte [byte eax+0Ch], 6
.42:
        mov dword [dword_11B244], 0
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
        sub dword [dword_179D60], esi
        cmp dword [dword_179D60], byte 0
        jg near .4
        inc dword [dword_179D64]
        cmp dword [dword_179D64], byte 5
        jle short .1
        mov dword [dword_179D64], 1
.1:
        mov eax, dword [dword_11B364]
        mov bl, byte [dword_179D64]
        mov byte [byte eax+0Ch], bl
        mov eax, dword [dword_179D64]
        shl eax, 4
        mov dword [dword_11B244], 0
        mov eax, dword [dword eax+dword_11B9F4]
        mov ecx, dword [dword_179DC2]
        mov ebx, eax
        cmp ecx, dword [byte eax+05h]
        je short .3
        cmp dword [dword_11B334], byte 0
        je short .2
        mov ecx, dword [eax]
        mov dword [dword_179D78], ecx
        mov cl, byte [byte eax+04h]
        mov byte [byte_179D7C], cl
        mov eax, dword [byte eax+05h]
        mov dword [dword_179D7D], eax
.2:
        mov eax, dword [ebx]
        mov dword [dword_179DBD], eax
        mov al, byte [byte ebx+04h]
        mov byte [byte_179DC1], al
        mov eax, dword [byte ebx+05h]
        mov dword [dword_179DC2], eax
        call CameraPathDerivs
        mov dword [dword_179D48], 0
.3:
        mov dword [dword_179D60], 3E8h
.4:
        mov eax, dword [dword_179DC2]
        mov dword [byte_11BB20], esi
        cmp eax, dword [dword_11B678]
        jne short .5
        add esi, esi
.5:
        shl esi, 8
        add dword [dword_179D48], esi
        cmp dword [InReplay], byte 0
        jne near UpdateCamera_174.13
        mov edx, dword [dword_11B364]
.6:
        cmp dword [byte edx+0Dh], byte 0
        je short .7
        mov edx, dword [byte edx+0Dh]
        jmp short .6
.7:
        mov eax, dword [PtrPuckObject]
        movsx ebx, word [byte eax+01Ch]
        movsx eax, byte [byte ebx+eax+01Eh]
        mov dword [dword_179D5C], eax
        cmp eax, byte 1Eh
        jne short .8
        mov ax, word [gameclock]
        cmp ax, word [PerTimeTotal]
        je short .8
        cmp byte [byte_11BB24], 0
        jne short .9
        mov eax, 1000h
        call AddIceCrud
        mov byte [byte_11BB24], 1
        jmp short .9
.8:
        mov byte [byte_11BB24], 0
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
        mov dword [dword_179CBC], eax
        cmp dword [GameLoopActive], byte 1
        jne short .12
        mov byte [byte_1175AC], 0
        mov byte [byte_1175AA], 0
        mov dword [dword_179D74], 0
.12:
        cmp dword [dword_11B334], byte 0
        je near .13
        mov eax, dword [dword_179D78]
        mov dword [dword_179DBD], eax
        mov al, byte [byte_179D7C]
        mov edi, dword_179DCE
        mov byte [byte_179DC1], al
        mov eax, dword [dword_179D7D]
        mov esi, dword_179E13
        mov dword [dword_179DC2], eax
        movsd
        movsd
        movsd
        mov edi, dword_179DC6
        mov esi, dword_179E0B
        movsd
        movsd
        mov dword [dword_11B334], 0
        call dword [dword_179DC2]
.13:
        mov eax, dword [dword_179DC2]
        cmp eax, dword [dword_11B8E5]
        jne short .14
        cmp dword [dword_179D68], byte 0FFFFFFFFh
        jle short .14
        cmp dword [dword_179D68], byte 0Ah
        jge short .14
        cmp dword [dword_179D48], 6000h
        jb near UpdateCamera_667.34
.14:
        cmp dword [dword_179D48], 2A00h
        jae short .15
        mov eax, dword [dword_179DC2]
        cmp eax, dword [dword_11B747]
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
        cmp dword [dword_179D5C], byte 1Eh
        je short .16
        cmp dword [dword_179D5C], byte 21h
        je short .16
        cmp dword [dword_179D5C], byte 22h
        je short .16
        cmp dword [dword_179D5C], byte 2Ch
        je short .16
        cmp dword [dword_179D5C], byte 24h
        jne short .17
.16:
        call dword [dword_179DC2]
.17:
        cmp dword [dword_179DC6], 8000h
        jle near UpdateCamera_667.30
        sub dword [dword_179DC6], 10000h
        jmp near UpdateCamera_667.31
UpdateCamera_2CE:
        mov dword [dword_179CBC], 0FFFFFFFFh
        mov eax, unk_11B8E0
        mov ebx, dword [dword_179DC2]
        mov dword [byte ebp-014h], 0
        cmp ebx, dword [dword_11B8E5]
        je near UpdateCamera_174.13
        cmp dword [dword_11B334], byte 0
        jne short .18
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.18:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        cmp dword [byte ebp-014h], byte 0
.19:
        je short .20
        mov edi, dword_179DCE
        mov esi, dword_179E13
        movsd
        movsd
        movsd
        mov edi, dword_179DC6
        mov esi, dword_179E0B
        movsd
        movsd
.20:
        call CameraPathDerivs
        mov dword [dword_179D48], 2A00h
        jmp near UpdateCamera_174.13
UpdateCamera_35B:
        mov dword [byte ebp-020h], 1
        mov eax, dword [dword_179D6C]
        mov ebx, dword [dword_179DC2]
        mov dword [dword_179CBC], eax
        mov eax, unk_11B856
        cmp ebx, dword [dword_11B85B]
        je near UpdateCamera_174.13
        cmp dword [dword_11B334], byte 0
        jne short .21
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.21:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        cmp dword [byte ebp-020h], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_3BE:
        mov dword [byte ebp-024h], 1
        mov eax, dword [byte edx+04h]
        mov ebx, dword [dword_179DC2]
        mov dword [dword_179CBC], eax
        mov eax, unk_11B89B
        cmp ebx, dword [dword_11B8A0]
        je near UpdateCamera_174.13
        cmp dword [dword_11B334], byte 0
        jne short .22
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.22:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        cmp dword [byte ebp-024h], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_41F:
        mov dword [byte ebp-01Ch], 0
        mov eax, dword [byte edx+04h]
        mov ebx, dword [dword_179DC2]
        mov dword [dword_179CBC], eax
        mov eax, unk_11B925
        cmp ebx, dword [dword_11B92A]
        je near UpdateCamera_174.13
        cmp dword [dword_11B334], byte 0
        jne short .23
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.23:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        cmp dword [byte ebp-01Ch], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_480:
        mov dword [byte ebp-018h], 1
        mov eax, dword [byte edx+04h]
        mov ebx, dword [dword_179DC2]
        mov dword [dword_179CBC], eax
        mov eax, unk_11B811
        cmp ebx, dword [dword_11B816]
        je near UpdateCamera_174.13
        cmp dword [dword_11B334], byte 0
        jne short .24
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.24:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        cmp dword [byte ebp-018h], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_4E1:
        mov dword [dword_179CBC], 10h
        mov eax, unk_11B6FD
        mov ebx, dword [dword_179DC2]
        mov dword [byte ebp-010h], 0
        cmp ebx, dword [dword_11B702]
        je near UpdateCamera_174.13
        cmp dword [dword_11B334], byte 0
        jne short .25
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.25:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        cmp dword [byte ebp-010h], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_544:
        mov dword [byte ebp-0Ch], 1
        mov eax, dword [dword_179D70]
        mov ebx, dword [dword_179DC2]
        mov dword [dword_179CBC], eax
        mov eax, unk_11B96A
        cmp ebx, dword [dword_11B96F]
        je near UpdateCamera_174.13
        cmp dword [dword_11B334], byte 0
        jne short .26
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.26:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        cmp dword [byte ebp-0Ch], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_5A7:
        mov ebx, 1
        mov eax, dword [byte edx+04h]
        mov ecx, dword [dword_179DC2]
        mov dword [dword_179CBC], eax
        mov eax, unk_11B9AF
        cmp ecx, dword [dword_11B9B4]
        je near UpdateCamera_174.13
        cmp dword [dword_11B334], byte 0
        jne short .27
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.27:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        test ebx, ebx
        jmp near UpdateCamera_2CE.19
UpdateCamera_604:
        mov dword [dword_179CBC], 10h
        mov eax, unk_11B6B8
        mov ebx, dword [dword_179DC2]
        mov dword [byte ebp-04h], 0
        cmp ebx, dword [dword_11B6BD]
        je near UpdateCamera_174.13
        cmp dword [dword_11B334], byte 0
        jne short .28
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.28:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        cmp dword [byte ebp-04h], byte 0
        jmp near UpdateCamera_2CE.19
UpdateCamera_667:
        mov dword [dword_179CBC], 10h
        mov eax, unk_11B673
        mov ebx, dword [dword_179DC2]
        mov dword [byte ebp-08h], 0
        cmp ebx, dword [dword_11B678]
        je near UpdateCamera_174.13
        cmp dword [dword_11B334], byte 0
        jne short .29
        mov ecx, 45h
        mov edi, dword_179D78
        mov esi, dword_179DBD
        rep movsb
.29:
        mov ecx, 45h
        mov edi, dword_179DBD
        mov esi, eax
        mov dword [dword_11B334], 1
        rep movsb
        cmp dword [byte ebp-08h], byte 0
        jmp near UpdateCamera_2CE.19
.30:
        cmp dword [dword_179DC6], 0FFFF8000h
        jge short .31
        inc word [word_179DC8]
.31:
        cmp dword [dword_179DCA], 8000h
        jle short .32
        sub dword [dword_179DCA], 10000h
        jmp short .33
.32:
        cmp dword [dword_179DCA], 0FFFF8000h
        jge short .33
        inc word [word_179DCC]
.33:
        call CameraPathDerivs
        mov dword [dword_179D48], 0
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
        mov eax, dword [dword_179E0B]
        neg eax
        test eax, eax
        jle short .1
        mov eax, 1000h
        jmp short .2
.1:
        mov eax, 0FFFFF000h
.2:
        sub eax, dword [dword_179E0B]
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
