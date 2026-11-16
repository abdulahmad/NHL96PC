; The controller screen before a game: which controller plays for which team, with the users' names.
bits 32
%include "hockey.inc"
extern BottomBarArt
section s_6CF0D progbits alloc exec nowrite align=1
extern BlackPalette, TextCharH, ClearSlotUser, CopyBitmap, DrawColorText, DrawColorTextRight, DrawFrameAt, SaveFileHandle
extern ControllerSlotX, ControllerSlotY, ControllerSlotStates, ControllerSlotItems, ControllerLayout, ControllerSlotPositions, ControllerOptionRows, ControllerTitlePos
extern ViewScreenWidth, ViewScreenHeight, FrontEndScreenBmp, MatchupLayer, TeamStatsBitmap
extern MenuBoxStyle, PlayoffTreeData, RosterFileHandle, PlayoffsActive, ControllerSlotIcon
extern ControllerColumnArt, ControllerBackBmp, ControllerIconArt, LinesEditAway, LinesEditMode, LinesEditTeam, FadeOut
extern FadePalette, FillMusicStream, TextStringWidth, gameopts, GetInputDevices, GetLangText, GetTeamNameArt, GetTicks
extern InitMenuItems, LinkSync, LinkSyncWithMessage, LoadPackedFile, LoadTeamLogo, ModemChat, mousex, mousey
extern MusicDone, OpenScreen, optflags, PickUsersScreen, PlayMusic, PlaySfx, PreGameScreens, PutBlock
extern RunEditLines, RunMenu, SetDrawBitmap, SetMenuMouse, SetScreenColors, SetTextColors, SlideInBottomBar, SlideInSideBar
extern SlideInTitleBar, SoundIdle, SoundSecondsToBytes, sprintf_, str_Bkgd6, ControllerColumnInfo, str_Jy1D
extern str_Jy2D, str_Jy3D, str_Jy4D, str_Key1, str_KeyD2, str_Log7, str_Logx, str_MCONTROL
extern str_MdmD, str_MseD2, str_P11, str_P12, str_P13, str_P1G, str_P21, str_P22
extern str_P23, str_P2G, str_Pal12, str_PlyD, str_Usrh, str_Usri, str_Utext, DrawShapeCore
extern DrawShapeAtOwnPos, DrawArt, PutBlockAtOwnPos, AllocMemBlock, FreeMemBlock, CreateBitmap, ClearScreenColour, FreeBitmap
extern DrawArtOpaqueAtOwnPos, SetScreenTarget, FindShape, TextSetFont, ControllerButtonOutline, ControllerTextIds, str_WesternConference2, SlotsTwoPlayer
extern ControllerScreenMode, ControllerPreGame, ControllerColumnsDrawn
extern SlotUserNames, ControllerSlotDevice, ControllerSlotTeam, ControllerPadIcons, ControllerDragSlot, ControllerDragIcon
global ControllerSlotDefaults, ControllerColumnDefaults, ControllerUsersPanel, NextControllerDeviceMasks, NextControllerDeviceJumpTable, NextControllerDevice, NextControllerDevice_2C, NextControllerDevice_F2
global NextControllerDevice_199, NextControllerDevice_240, NextControllerDevice_2E7, NextControllerDevice_38E, NextControllerDevice_435, NextControllerDevice_4D0, ScanControllers, DeviceIconCodes
global DeviceIconJumpTable, DeviceIconShape, DeviceIconShape_51, DeviceIconShape_5D, DeviceIconShape_69, DeviceIconShape_75, DeviceIconShape_81, DeviceIconShape_8D
global DeviceIconShape_99, DeviceIconShape_A5, DeviceIconShape_CB, DrawControllerIcons, SetControllerColumn, SetControllerIcon, SetControllerIcon_F9, DrawControllerColumns
global ControllerScreenItemJumpTable, ControllerScreenModeJumpTable, ControllerScreen, ControllerScreen_11AB, ControllerScreen_149D, ControllerScreen_14E4, ControllerScreen_1503, ControllerScreen_1548
global ControllerScreen_15D1, ControllerScreen_168B, ControllerScreen_16B0, ControllerScreen_16D6, RunControllerScreen, ControlPicksSlotPoints, ControlPicksHotspots, ControlSetupRowY
global ControlSetupColumnX, ControlSetupPoints, str_R, str_F
;-----------------------------------------------------------------------------
; ControllerSlotDefaults                          6CF0D  96 PC, low confidence
; Six bytes of start values for the controller slots, kept in the code and
; copied by ControllerScreen
;-----------------------------------------------------------------------------
ControllerSlotDefaults:
        jge short .1
.1:
        sbb eax, dword [ecx]
        db 0B8h
        db 01h
;-----------------------------------------------------------------------------
; ControllerColumnDefaults                        6CF13  96 PC, low confidence
; Eight bytes of start values for the controller columns, kept in the code
; and copied by ControllerScreen
;-----------------------------------------------------------------------------
ControllerColumnDefaults:
        test dword [eax], 1580127h
        mov byte [ecx], al
;-----------------------------------------------------------------------------
; ControllerUsersPanel                            6CF1B  96 PC, low confidence
; The controller screen's users panel (log7 / logx), picking users
; (PickUsersScreen)
;-----------------------------------------------------------------------------
ControllerUsersPanel:
        push esi
        push edi
        enter 50h, 0
        push eax
        push edx
        push ebx
        push ecx
        call GetTicks
        push byte 0
        push dword [ViewScreenHeight]
        push dword [ViewScreenWidth]
        lea edi, [byte eax+03h]
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push byte 0
        mov esi, eax
        push dword [byte eax+02Ch]
        mov dword [byte ebp-030h], eax
        call DrawShapeCore
        add esp, byte 0Ch
        push esi
        call SetDrawBitmap
        add esp, byte 4
        push dword [byte ebp-060h]
        call PutBlockAtOwnPos
        mov eax, dword [byte ebp-060h]
        movsx eax, word [byte eax+0Ch]
        mov dword [byte ebp-08h], eax
        mov eax, dword [byte ebp-060h]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-060h]
        mov esi, dword [byte ebp-08h]
        movsx eax, word [byte eax+04h]
        add esi, eax
        mov eax, dword [byte ebp-060h]
        mov dword [byte ebp-010h], esi
        mov esi, dword [byte ebp-04h]
        movsx eax, word [byte eax+06h]
        mov dword [byte ebp-01Ch], 0
        add esi, eax
        add esp, byte 4
        mov dword [byte ebp-018h], esi
.1:
        call GetTicks
        cmp eax, edi
        jl short .1
        push str_Log7
        push dword [byte ebp-054h]
        call FindShape
        movsx esi, word [byte eax+0Eh]
        mov eax, dword [byte ebp-060h]
        movsx eax, word [byte eax+0Eh]
        sub esi, eax
        mov eax, esi
        mov esi, 7
        cdq
        idiv esi
        lea edi, [byte ebp-050h]
        mov esi, str_Logx
        mov dword [byte ebp-024h], eax
        mov dword [byte ebp-040h], eax
        movsd
        movsb
        neg eax
        mov esi, dword [byte ebp-024h]
        mov dword [byte ebp-0Ch], 1
        add esi, eax
        add esp, byte 8
        mov dword [byte ebp-028h], esi
.2:
        mov al, byte [byte ebp-0Ch]
        add al, 30h
        mov byte [byte ebp-04Dh], al
        lea eax, [byte ebp-050h]
        push eax
        push dword [byte ebp-054h]
        call FindShape
        add esp, byte 8
        mov esi, eax
        cmp dword [byte ebp-0Ch], byte 7
        jne short .3
        movsx edx, word [byte eax+0Ch]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp-044h], edx
        mov dword [byte ebp-020h], eax
        jmp short .5
.3:
        mov edi, dword [byte ebp-060h]
        mov edx, dword [byte ebp-028h]
        movsx edi, word [byte edi+0Eh]
        add edx, edi
        mov dword [byte ebp-020h], edx
        cmp dword [byte ebp-05Ch], byte 0
        je short .4
        mov edx, 280h
        movsx edi, word [byte eax+0Ch]
        sub edx, edi
        movsx eax, word [byte eax+04h]
        mov edi, edx
        sub edi, eax
        mov dword [byte ebp-044h], edi
        jmp short .5
.4:
        movsx eax, word [byte eax+0Ch]
        mov dword [byte ebp-044h], eax
.5:
        cmp dword [byte ebp-01Ch], byte 0
        je short .6
        push dword [byte ebp-01Ch]
        call FreeBitmap
        add esp, byte 4
.6:
        mov eax, dword [byte ebp-044h]
        cmp eax, dword [byte ebp-08h]
        jge short .7
        mov dword [byte ebp-08h], eax
.7:
        movsx eax, word [byte esi+04h]
        add eax, dword [byte ebp-044h]
        cmp eax, dword [byte ebp-010h]
        jle short .8
        mov dword [byte ebp-010h], eax
.8:
        mov eax, dword [byte ebp-020h]
        cmp eax, dword [byte ebp-04h]
        jge short .9
        mov dword [byte ebp-04h], eax
.9:
        movsx eax, word [byte esi+06h]
        add eax, dword [byte ebp-020h]
        cmp eax, dword [byte ebp-018h]
        jle short .10
        mov dword [byte ebp-018h], eax
.10:
        mov eax, dword [byte ebp-018h]
        sub eax, dword [byte ebp-04h]
        push byte 0
        inc eax
        push eax
        mov eax, dword [byte ebp-010h]
        sub eax, dword [byte ebp-08h]
        inc eax
        push eax
        call CreateBitmap
        mov edi, eax
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [byte eax+02Ch]
        mov edx, dword [byte ebp-08h]
        mov word [byte eax+0Ch], dx
        add esp, byte 0Ch
        mov eax, dword [byte edi+02Ch]
        mov edx, dword [byte ebp-04h]
        push edi
        mov word [byte eax+0Eh], dx
        call SetDrawBitmap
        add esp, byte 4
        call GetTicks
        add eax, byte 3
        mov dword [byte ebp-03Ch], eax
        mov eax, dword [byte ebp-04h]
        neg eax
        push eax
        mov eax, dword [byte ebp-08h]
        neg eax
        push eax
        mov eax, dword [byte ebp-030h]
        push dword [byte eax+02Ch]
        call PutBlock
        mov eax, dword [byte ebp-020h]
        add esp, byte 0Ch
        sub eax, dword [byte ebp-04h]
        push eax
        mov eax, dword [byte ebp-044h]
        sub eax, dword [byte ebp-08h]
        push eax
        push esi
        call DrawArt
        add esp, byte 0Ch
        call SetScreenTarget
        push dword [byte edi+02Ch]
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
.11:
        call GetTicks
        cmp eax, dword [byte ebp-03Ch]
        jl short .11
        mov eax, dword [byte ebp-044h]
        mov edx, dword [byte ebp-044h]
        mov dword [byte ebp-08h], eax
        movsx eax, word [byte esi+04h]
        add edx, eax
        mov eax, dword [byte ebp-020h]
        mov dword [byte ebp-010h], edx
        mov edx, dword [byte ebp-020h]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+06h]
        inc dword [byte ebp-0Ch]
        add edx, eax
        mov eax, dword [byte ebp-040h]
        mov dword [byte ebp-018h], edx
        add dword [byte ebp-028h], eax
        cmp dword [byte ebp-0Ch], byte 8
        jl near .2
        mov edx, dword [byte ebp-058h]
        mov eax, dword [byte ebp-054h]
        call PickUsersScreen
        mov eax, dword [byte ebp-024h]
        mov dword [byte ebp-034h], eax
        imul eax, byte 6
        lea edi, [byte ebp-050h]
        mov esi, str_Logx
        mov dword [byte ebp-0Ch], 6
        movsd
        movsb
        neg dword [byte ebp-034h]
        mov dword [byte ebp-02Ch], eax
.12:
        mov al, byte [byte ebp-0Ch]
        add al, 30h
        mov byte [byte ebp-04Dh], al
        cmp dword [byte ebp-0Ch], byte 0
        je short .14
        lea eax, [byte ebp-050h]
        push eax
        push dword [byte ebp-054h]
        mov edi, dword [byte ebp-060h]
        call FindShape
        mov edx, dword [byte ebp-02Ch]
        movsx edi, word [byte edi+0Eh]
        add esp, byte 8
        add edx, edi
        mov esi, eax
        mov dword [byte ebp-048h], edx
        cmp dword [byte ebp-05Ch], byte 0
        je short .13
        mov edx, 280h
        movsx edi, word [byte eax+0Ch]
        sub edx, edi
        movsx eax, word [byte eax+04h]
        mov edi, edx
        sub edi, eax
        mov dword [byte ebp-014h], edi
        jmp short .16
.13:
        movsx eax, word [byte eax+0Ch]
        jmp short .15
.14:
        mov esi, dword [byte ebp-060h]
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-048h], eax
        movsx eax, word [byte esi+0Ch]
.15:
        mov dword [byte ebp-014h], eax
.16:
        cmp dword [byte ebp-01Ch], byte 0
        je short .17
        push dword [byte ebp-01Ch]
        call FreeBitmap
        add esp, byte 4
.17:
        mov eax, dword [byte ebp-014h]
        cmp eax, dword [byte ebp-08h]
        jge short .18
        mov dword [byte ebp-08h], eax
.18:
        movsx eax, word [byte esi+04h]
        add eax, dword [byte ebp-014h]
        cmp eax, dword [byte ebp-010h]
        jle short .19
        mov dword [byte ebp-010h], eax
.19:
        mov eax, dword [byte ebp-048h]
        cmp eax, dword [byte ebp-04h]
        jge short .20
        mov dword [byte ebp-04h], eax
.20:
        movsx eax, word [byte esi+06h]
        add eax, dword [byte ebp-048h]
        cmp eax, dword [byte ebp-018h]
        jle short .21
        mov dword [byte ebp-018h], eax
.21:
        mov eax, dword [byte ebp-018h]
        sub eax, dword [byte ebp-04h]
        push byte 0
        inc eax
        push eax
        mov eax, dword [byte ebp-010h]
        sub eax, dword [byte ebp-08h]
        inc eax
        push eax
        call CreateBitmap
        mov edi, eax
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [byte eax+02Ch]
        mov edx, dword [byte ebp-08h]
        mov word [byte eax+0Ch], dx
        add esp, byte 0Ch
        mov eax, dword [byte edi+02Ch]
        mov edx, dword [byte ebp-04h]
        push edi
        mov word [byte eax+0Eh], dx
        call SetDrawBitmap
        add esp, byte 4
        call GetTicks
        add eax, byte 3
        mov dword [byte ebp-038h], eax
        mov eax, dword [byte ebp-04h]
        neg eax
        push eax
        mov eax, dword [byte ebp-08h]
        neg eax
        push eax
        mov eax, dword [byte ebp-030h]
        push dword [byte eax+02Ch]
        call PutBlock
        mov eax, dword [byte ebp-048h]
        add esp, byte 0Ch
        sub eax, dword [byte ebp-04h]
        push eax
        mov eax, dword [byte ebp-014h]
        sub eax, dword [byte ebp-08h]
        push eax
        push esi
        call DrawArt
        add esp, byte 0Ch
        call SetScreenTarget
        push dword [byte edi+02Ch]
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
.22:
        call GetTicks
        cmp eax, dword [byte ebp-038h]
        jl short .22
        mov eax, dword [byte ebp-014h]
        mov edx, dword [byte ebp-014h]
        mov dword [byte ebp-08h], eax
        movsx eax, word [byte esi+04h]
        add edx, eax
        mov eax, dword [byte ebp-048h]
        mov dword [byte ebp-010h], edx
        mov edx, dword [byte ebp-048h]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+06h]
        dec dword [byte ebp-0Ch]
        add edx, eax
        mov eax, dword [byte ebp-034h]
        mov dword [byte ebp-018h], edx
        add dword [byte ebp-02Ch], eax
        cmp dword [byte ebp-0Ch], byte 0
        jge near .12
        push dword [byte ebp-01Ch]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp-030h]
        call FreeBitmap
        add esp, byte 4
        leave
        pop edi
        pop esi
        ret
NextControllerDeviceMasks:                      ; used by NextControllerDevice
        db 0FFh,03h,03Fh,00h,01Fh,00h,0Fh,00h,07h,00h,03h,00h,01h,00h,00h,00h
NextControllerDeviceJumpTable:                  ; jump table for the switch cases of NextControllerDevice
        dd NextControllerDevice_4D0
        dd NextControllerDevice_2C
        dd NextControllerDevice_F2
        dd NextControllerDevice_199
        dd NextControllerDevice_240
        dd NextControllerDevice_2E7
        dd NextControllerDevice_38E
        dd NextControllerDevice_435
        dd NextControllerDevice_4D0
;-----------------------------------------------------------------------------
; NextControllerDevice                            6D350  96 PC, low confidence
; Returns the next input device after the current one that no other slot uses
;-----------------------------------------------------------------------------
NextControllerDevice:
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        mov dword [byte ebp-04h], ecx
        dec eax
        cmp eax, 3FFh
        ja near NextControllerDevice_4D0
        mov ecx, 9
        mov edi, NextControllerDeviceMasks
        repne scasw
        jmp dword [nosplit cs:ecx*4+NextControllerDeviceJumpTable]
NextControllerDevice_2C:
        test byte [byte ebp+010h], 1
        je short .2
        cmp edx, byte 2
        je short .2
        cmp ebx, byte 2
        je short .2
        cmp dword [byte ebp-04h], byte 2
        je short .2
.1:
        mov esi, 2
        jmp near NextControllerDevice_4D0
.2:
        test byte [byte ebp+010h], 2
        je short .4
        cmp edx, byte 4
        je short .4
        cmp ebx, byte 4
        je short .4
        cmp dword [byte ebp-04h], byte 4
        je short .4
.3:
        mov esi, 4
        jmp near NextControllerDevice_4D0
.4:
        test byte [byte ebp+010h], 4
        je short .6
        cmp edx, byte 8
        je short .6
        cmp ebx, byte 8
        je short .6
        cmp dword [byte ebp-04h], byte 8
        je short .6
.5:
        mov esi, 8
        jmp near NextControllerDevice_4D0
.6:
        test byte [byte ebp+010h], 8
        je short .8
        cmp edx, byte 10h
        je short .8
        cmp ebx, byte 10h
        je short .8
        cmp dword [byte ebp-04h], byte 10h
        je short .8
.7:
        mov esi, 10h
        jmp near NextControllerDevice_4D0
.8:
        test byte [byte ebp+010h], 10h
        je short .10
        cmp edx, byte 20h
        je short .10
        cmp ebx, byte 20h
        je short .10
        cmp dword [byte ebp-04h], byte 20h
        je short .10
.9:
        mov esi, 20h
        jmp near NextControllerDevice_4D0
.10:
        cmp edx, byte 40h
        je near NextControllerDevice_4D0
        cmp ebx, byte 40h
        je near NextControllerDevice_4D0
        cmp dword [byte ebp-04h], byte 40h
        je near NextControllerDevice_4D0
.11:
        mov esi, 40h
        jmp near NextControllerDevice_4D0
NextControllerDevice_F2:
        test byte [byte ebp+010h], 2
        je short .12
        cmp edx, byte 4
        je short .12
        cmp ebx, byte 4
        je short .12
        cmp dword [byte ebp-04h], byte 4
        jne near NextControllerDevice_2C.3
.12:
        test byte [byte ebp+010h], 4
        je short .13
        cmp edx, byte 8
        je short .13
        cmp ebx, byte 8
        je short .13
        cmp dword [byte ebp-04h], byte 8
        jne near NextControllerDevice_2C.5
.13:
        test byte [byte ebp+010h], 8
        je short .14
        cmp edx, byte 10h
        je short .14
        cmp ebx, byte 10h
        je short .14
        cmp dword [byte ebp-04h], byte 10h
        jne near NextControllerDevice_2C.7
.14:
        test byte [byte ebp+010h], 10h
        je short .15
        cmp edx, byte 20h
        je short .15
        cmp ebx, byte 20h
        je short .15
        cmp dword [byte ebp-04h], byte 20h
        jne near NextControllerDevice_2C.9
.15:
        cmp edx, byte 40h
        je short .16
        cmp ebx, byte 40h
        je short .16
        cmp dword [byte ebp-04h], byte 40h
        jne near NextControllerDevice_2C.11
.16:
        test byte [byte ebp+010h], 1
        je near NextControllerDevice_435.42
        cmp edx, byte 2
        je near NextControllerDevice_435.42
        cmp ebx, byte 2
        je near NextControllerDevice_435.42
        cmp dword [byte ebp-04h], byte 2
        jne near NextControllerDevice_2C.1
        jmp near NextControllerDevice_435.42
NextControllerDevice_199:
        test byte [byte ebp+010h], 4
        je short .17
        cmp edx, byte 8
        je short .17
        cmp ebx, byte 8
        je short .17
        cmp dword [byte ebp-04h], byte 8
        jne near NextControllerDevice_2C.5
.17:
        test byte [byte ebp+010h], 8
        je short .18
        cmp edx, byte 10h
        je short .18
        cmp ebx, byte 10h
        je short .18
        cmp dword [byte ebp-04h], byte 10h
        jne near NextControllerDevice_2C.7
.18:
        test byte [byte ebp+010h], 10h
        je short .19
        cmp edx, byte 20h
        je short .19
        cmp ebx, byte 20h
        je short .19
        cmp dword [byte ebp-04h], byte 20h
        jne near NextControllerDevice_2C.9
.19:
        cmp edx, byte 40h
        je short .20
        cmp ebx, byte 40h
        je short .20
        cmp dword [byte ebp-04h], byte 40h
        jne near NextControllerDevice_2C.11
.20:
        test byte [byte ebp+010h], 1
        je short .21
        cmp edx, byte 2
        je short .21
        cmp ebx, byte 2
        je short .21
        cmp dword [byte ebp-04h], byte 2
        jne near NextControllerDevice_2C.1
.21:
        test byte [byte ebp+010h], 2
        je near NextControllerDevice_435.42
        cmp edx, byte 4
        je near NextControllerDevice_435.42
        cmp ebx, byte 4
        je near NextControllerDevice_435.42
        cmp dword [byte ebp-04h], byte 4
        jne near NextControllerDevice_2C.3
        jmp near NextControllerDevice_435.42
NextControllerDevice_240:
        test byte [byte ebp+010h], 8
        je short .22
        cmp edx, byte 10h
        je short .22
        cmp ebx, byte 10h
        je short .22
        cmp dword [byte ebp-04h], byte 10h
        jne near NextControllerDevice_2C.7
.22:
        test byte [byte ebp+010h], 10h
        je short .23
        cmp edx, byte 20h
        je short .23
        cmp ebx, byte 20h
        je short .23
        cmp dword [byte ebp-04h], byte 20h
        jne near NextControllerDevice_2C.9
.23:
        cmp edx, byte 40h
        je short .24
        cmp ebx, byte 40h
        je short .24
        cmp dword [byte ebp-04h], byte 40h
        jne near NextControllerDevice_2C.11
.24:
        test byte [byte ebp+010h], 1
        je short .25
        cmp edx, byte 2
        je short .25
        cmp ebx, byte 2
        je short .25
        cmp dword [byte ebp-04h], byte 2
        jne near NextControllerDevice_2C.1
.25:
        test byte [byte ebp+010h], 2
        je short .26
        cmp edx, byte 4
        je short .26
        cmp ebx, byte 4
        je short .26
        cmp dword [byte ebp-04h], byte 4
        jne near NextControllerDevice_2C.3
.26:
        test byte [byte ebp+010h], 4
        je near NextControllerDevice_435.42
        cmp edx, byte 8
        je near NextControllerDevice_435.42
        cmp ebx, byte 8
        je near NextControllerDevice_435.42
        cmp dword [byte ebp-04h], byte 8
        jne near NextControllerDevice_2C.5
        jmp near NextControllerDevice_435.42
NextControllerDevice_2E7:
        test byte [byte ebp+010h], 10h
        je short .27
        cmp edx, byte 20h
        je short .27
        cmp ebx, byte 20h
        je short .27
        cmp dword [byte ebp-04h], byte 20h
        jne near NextControllerDevice_2C.9
.27:
        cmp edx, byte 40h
        je short .28
        cmp ebx, byte 40h
        je short .28
        cmp dword [byte ebp-04h], byte 40h
        jne near NextControllerDevice_2C.11
.28:
        test byte [byte ebp+010h], 1
        je short .29
        cmp edx, byte 2
        je short .29
        cmp ebx, byte 2
        je short .29
        cmp dword [byte ebp-04h], byte 2
        jne near NextControllerDevice_2C.1
.29:
        test byte [byte ebp+010h], 2
        je short .30
        cmp edx, byte 4
        je short .30
        cmp ebx, byte 4
        je short .30
        cmp dword [byte ebp-04h], byte 4
        jne near NextControllerDevice_2C.3
.30:
        test byte [byte ebp+010h], 4
        je short .31
        cmp edx, byte 8
        je short .31
        cmp ebx, byte 8
        je short .31
        cmp dword [byte ebp-04h], byte 8
        jne near NextControllerDevice_2C.5
.31:
        test byte [byte ebp+010h], 8
        je near NextControllerDevice_435.42
        cmp edx, byte 10h
        je near NextControllerDevice_435.42
        cmp ebx, byte 10h
        je near NextControllerDevice_435.42
        cmp dword [byte ebp-04h], byte 10h
        jne near NextControllerDevice_2C.7
        jmp near NextControllerDevice_435.42
NextControllerDevice_38E:
        cmp edx, byte 40h
        je short .32
        cmp ebx, byte 40h
        je short .32
        cmp dword [byte ebp-04h], byte 40h
        jne near NextControllerDevice_2C.11
.32:
        test byte [byte ebp+010h], 1
        je short .33
        cmp edx, byte 2
        je short .33
        cmp ebx, byte 2
        je short .33
        cmp dword [byte ebp-04h], byte 2
        jne near NextControllerDevice_2C.1
.33:
        test byte [byte ebp+010h], 2
        je short .34
        cmp edx, byte 4
        je short .34
        cmp ebx, byte 4
        je short .34
        cmp dword [byte ebp-04h], byte 4
        jne near NextControllerDevice_2C.3
.34:
        test byte [byte ebp+010h], 4
        je short .35
        cmp edx, byte 8
        je short .35
        cmp ebx, byte 8
        je short .35
        cmp dword [byte ebp-04h], byte 8
        jne near NextControllerDevice_2C.5
.35:
        test byte [byte ebp+010h], 8
        je short .36
        cmp edx, byte 10h
        je short .36
        cmp ebx, byte 10h
        je short .36
        cmp dword [byte ebp-04h], byte 10h
        jne near NextControllerDevice_2C.7
.36:
        test byte [byte ebp+010h], 10h
        je near NextControllerDevice_435.42
        cmp edx, byte 20h
        je near NextControllerDevice_435.42
        cmp ebx, byte 20h
        je near NextControllerDevice_435.42
        cmp dword [byte ebp-04h], byte 20h
        jne near NextControllerDevice_2C.9
        jmp near NextControllerDevice_435.42
NextControllerDevice_435:
        test byte [byte ebp+010h], 1
        je short .37
        cmp edx, byte 2
        je short .37
        cmp ebx, byte 2
        je short .37
        cmp dword [byte ebp-04h], byte 2
        jne near NextControllerDevice_2C.1
.37:
        test byte [byte ebp+010h], 2
        je short .38
        cmp edx, byte 4
        je short .38
        cmp ebx, byte 4
        je short .38
        cmp dword [byte ebp-04h], byte 4
        jne near NextControllerDevice_2C.3
.38:
        test byte [byte ebp+010h], 4
        je short .39
        cmp edx, byte 8
        je short .39
        cmp ebx, byte 8
        je short .39
        cmp dword [byte ebp-04h], byte 8
        jne near NextControllerDevice_2C.5
.39:
        test byte [byte ebp+010h], 8
        je short .40
        cmp edx, byte 10h
        je short .40
        cmp ebx, byte 10h
        je short .40
        cmp dword [byte ebp-04h], byte 10h
        jne near NextControllerDevice_2C.7
.40:
        test byte [byte ebp+010h], 10h
        je short .41
        cmp edx, byte 20h
        je short .41
        cmp ebx, byte 20h
        je short .41
        cmp dword [byte ebp-04h], byte 20h
        jne near NextControllerDevice_2C.9
.41:
        cmp edx, byte 40h
        je short .42
        cmp ebx, byte 40h
        je short .42
        cmp dword [byte ebp-04h], byte 40h
        jne near NextControllerDevice_2C.11
.42:
        mov esi, 1
NextControllerDevice_4D0:
        mov eax, esi
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; ScanControllers                                 6D828  96 PC, low confidence
; Reads the devices (GetInputDevices) into the controller screen's slots
;-----------------------------------------------------------------------------
ScanControllers:
        push ebx
        push ecx
        push edx
        push esi
        enter 18h, 0
        call GetInputDevices
        mov dword [byte ebp-010h], eax
        mov eax, dword [optflags]
        and eax, byte 70h
        mov dword [byte ebp-0Ch], 0
        cmp eax, byte 30h
        setne byte [byte ebp-04h]
        xor eax, eax
.1:
        movzx edx, byte [byte ebp-04h]
        test edx, edx
        je short .2
        mov edx, dword [gameopts]
        movsx edx, word [byte edx+eax+09h]
        cmp edx, 400h
        je near .15
.2:
        mov ecx, dword [byte ebp-0Ch]
        inc ecx
        movsx edx, cx
        mov word [byte eax+ebp-018h], 0
        cmp edx, byte 4
        jne short .3
        xor ecx, ecx
.3:
        mov ebx, ecx
        inc ebx
        movsx edx, bx
        cmp edx, byte 4
        jne short .4
        xor ebx, ebx
.4:
        mov edx, ebx
        inc edx
        mov dword [byte ebp-08h], edx
        movsx edx, dx
        cmp edx, byte 4
        jne short .5
        mov dword [byte ebp-08h], 0
.5:
        mov edx, dword [gameopts]
        mov si, word [byte edx+eax+09h]
        cmp si, byte 8
        jb short .7
        jbe near .12
        cmp si, byte 20h
        jb short .6
        jbe near .14
        cmp si, byte 40h
        je short .8
        jmp near .16
.6:
        cmp si, byte 10h
        je near .13
        jmp near .16
.7:
        cmp si, byte 2
        jb near .16
        jbe short .10
        cmp si, byte 4
        je short .11
        jmp near .16
.8:
        movsx ecx, cx
        movsx ecx, word [byte edx+ecx*2+09h]
        cmp ecx, byte 40h
        je near .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 40h
        je near .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 40h
.9:
        jne near .16
        jmp near .15
.10:
        test byte [byte ebp-010h], 1
        je near .15
        movsx esi, cx
        movsx ecx, word [byte edx+esi*2+09h]
        cmp ecx, byte 2
        je near .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 2
        je near .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 2
        jmp short .9
.11:
        test byte [byte ebp-010h], 2
        je near .15
        movsx ecx, cx
        movsx ecx, word [byte edx+ecx*2+09h]
        cmp ecx, byte 4
        je near .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 4
        je near .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 4
        jmp short .9
.12:
        test byte [byte ebp-010h], 4
        je near .15
        movsx ecx, cx
        movsx ecx, word [byte edx+ecx*2+09h]
        cmp ecx, byte 8
        je near .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 8
        je near .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 8
        jmp near .9
.13:
        test byte [byte ebp-010h], 8
        je short .15
        movsx ecx, cx
        movsx ecx, word [byte edx+ecx*2+09h]
        cmp ecx, byte 10h
        je short .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 10h
        je short .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 10h
        jmp near .9
.14:
        test byte [byte ebp-010h], 10h
        je short .15
        movsx ecx, cx
        movsx ecx, word [byte edx+ecx*2+09h]
        cmp ecx, byte 20h
        je short .15
        movsx ebx, bx
        movsx ebx, word [byte edx+ebx*2+09h]
        cmp ebx, byte 20h
        je short .15
        movsx ebx, word [byte ebp-08h]
        movsx edx, word [byte edx+ebx*2+09h]
        cmp edx, byte 20h
        jne short .16
.15:
        mov word [byte eax+ebp-018h], 1
.16:
        inc dword [byte ebp-0Ch]
        inc eax
        inc eax
        cmp dword [byte ebp-0Ch], byte 4
        jl near .1
        mov dword [byte ebp-0Ch], 0
        xor esi, esi
.17:
        mov eax, dword [byte ebp-0Ch]
        inc eax
        movsx edx, ax
        cmp edx, byte 4
        jne short .18
        xor eax, eax
.18:
        mov edx, eax
        inc edx
        movsx ebx, dx
        cmp ebx, byte 4
        jne short .19
        xor edx, edx
.19:
        mov ebx, edx
        inc ebx
        movsx ecx, bx
        cmp ecx, byte 4
        jne short .20
        xor ebx, ebx
.20:
        cmp word [byte esi+ebp-018h], byte 0
        je near .27
        movsx ebx, bx
        add ebx, ebx
        push dword [byte ebp-010h]
        cmp word [byte ebx+ebp-018h], byte 0
        je short .21
        mov ecx, 1
        jmp short .22
.21:
        mov ecx, dword [gameopts]
        movsx ecx, word [byte ecx+ebx+09h]
.22:
        movsx edx, dx
        add edx, edx
        cmp word [byte edx+ebp-018h], byte 0
        je short .23
        mov edx, 1
        jmp short .24
.23:
        mov ebx, dword [gameopts]
        movsx edx, word [byte edx+ebx+09h]
.24:
        cwde
        add eax, eax
        mov ebx, edx
        cmp word [byte eax+ebp-018h], byte 0
        je short .25
        mov edx, 1
        jmp short .26
.25:
        mov edx, dword [gameopts]
        movsx edx, word [byte edx+eax+09h]
.26:
        mov eax, 1
        call NextControllerDevice
        mov edx, eax
        mov eax, dword [gameopts]
        mov word [byte esi+eax+09h], dx
        mov word [byte esi+ebp-018h], 0
.27:
        inc dword [byte ebp-0Ch]
        inc esi
        inc esi
        cmp dword [byte ebp-0Ch], byte 4
        jl near .17
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
DeviceIconCodes:                                ; used by DeviceIconShape
        db 00h,04h,040h,00h,020h,00h,010h,00h,08h,00h,04h,00h,02h,00h,01h,00h
DeviceIconJumpTable:                            ; jump table for the switch cases of DeviceIconShape
        dd DeviceIconShape_CB
        dd DeviceIconShape_51
        dd DeviceIconShape_5D
        dd DeviceIconShape_69
        dd DeviceIconShape_75
        dd DeviceIconShape_81
        dd DeviceIconShape_8D
        dd DeviceIconShape_99
        dd DeviceIconShape_A5
;-----------------------------------------------------------------------------
; DeviceIconShape                                 6DB5C  96 PC, low confidence
; Returns the icon shape of an input device ("ply", "mse", "jy1" to "jy4",
; "key", "mdm")
;-----------------------------------------------------------------------------
DeviceIconShape:
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov esi, eax
        mov eax, edx
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .3
        movsx edx, word [ControllerScreenMode]
        cmp edx, byte 1
        jne short .1
        movsx edx, bx
        cmp edx, byte 1
        jle short .3
        jmp short .2
.1:
        movsx edx, bx
        cmp edx, byte 2
        jge short .3
.2:
        mov eax, 400h
.3:
        mov ecx, 9
        mov edi, DeviceIconCodes
        repne scasw
        jmp dword [nosplit cs:ecx*4+DeviceIconJumpTable]
DeviceIconShape_51:
        movsx eax, bx
        inc eax
        push eax
        push str_PlyD
        jmp short DeviceIconShape_A5.4
DeviceIconShape_5D:
        movsx eax, bx
        inc eax
        push eax
        push str_MseD2
        jmp short DeviceIconShape_A5.4
DeviceIconShape_69:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy1D
        jmp short DeviceIconShape_A5.4
DeviceIconShape_75:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy2D
        jmp short DeviceIconShape_A5.4
DeviceIconShape_81:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy3D
        jmp short DeviceIconShape_A5.4
DeviceIconShape_8D:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy4D
        jmp short DeviceIconShape_A5.4
DeviceIconShape_99:
        movsx eax, bx
        inc eax
        push eax
        push str_KeyD2
        jmp short DeviceIconShape_A5.4
DeviceIconShape_A5:
        movsx eax, bx
        inc eax
        push eax
        push str_MdmD
.4:
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-0Ch]
        push eax
        push esi
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-04h], eax
DeviceIconShape_CB:
        mov eax, dword [byte ebp-04h]
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; DrawControllerIcons                             6DC2F  96 PC, low confidence
; Draws the device icon of each controller slot
;-----------------------------------------------------------------------------
DrawControllerIcons:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        cmp dword [eax], byte 5
        jge short .1
        push dword [ControllerSlotIcon]
        call PutBlockAtOwnPos
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne near .6
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        jne short .3
        jmp near .6
.1:
        cmp dword [eax], byte 0Ah
        jge short .4
        push dword [ControllerPadIcons+4]
        call PutBlockAtOwnPos
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne near .6
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
.2:
        je near .6
.3:
        mov si, word [esi]
        mov word [ControllerDragSlot], si
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.4:
        cmp dword [eax], byte 0Fh
        jge short .5
        push dword [ControllerPadIcons+0Ch]
        call PutBlockAtOwnPos
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne short .6
        cmp word [ControllerScreenMode], byte 0
        jmp short .2
.5:
        cmp dword [eax], byte 14h
        jge short .7
        push dword [ControllerPadIcons+14h]
        call PutBlockAtOwnPos
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne short .6
        cmp word [ControllerScreenMode], byte 0
        jne short .3
        mov ax, word [esi]
        mov word [ControllerDragIcon], ax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.6:
        mov si, word [esi]
        mov word [ControllerDragIcon], si
.7:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetControllerColumn                             6DD1E  96 PC, low confidence
; The column (5, 0Ah, 0Fh, 16h) of the current controller by the side it is
; on
;-----------------------------------------------------------------------------
SetControllerColumn:
        push edx
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0218h], byte 0
        je short .1
        mov byte [byte eax+043h], 5
        jmp short .4
.1:
        cmp dword [dword eax+0416h], byte 0
        je short .2
        mov byte [byte eax+043h], 0Ah
        jmp short .4
.2:
        cmp dword [dword eax+0614h], byte 0
        je short .3
        mov byte [byte eax+043h], 0Fh
        jmp short .4
.3:
        mov byte [byte eax+043h], 16h
.4:
        mov eax, dword [ControllerColumnArt]
        cmp dword [byte eax+01Ah], byte 0
        sete dl
        mov byte [dword eax+0AAh], dl
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+01B2h], byte 0
        setne dl
        add dl, 3
        mov byte [dword eax+0177h], dl
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .5
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+0174h], 18h
.5:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .6
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+01DAh], 18h
.6:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+03B0h], byte 0
        je short .7
        mov byte [dword eax+01DBh], 9
        jmp short .10
.7:
        cmp dword [dword eax+05AEh], byte 0
        je short .8
        mov byte [dword eax+01DBh], 0Eh
        jmp short .10
.8:
        cmp dword [dword eax+07ACh], byte 0
        je short .9
        mov byte [dword eax+01DBh], 13h
        jmp short .10
.9:
        mov byte [dword eax+01DBh], 17h
.10:
        mov eax, dword [ControllerColumnArt]
        cmp dword [byte eax+01Ah], byte 0
        sete dl
        mov byte [dword eax+0240h], dl
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0416h], byte 0
        je short .11
        mov byte [dword eax+0241h], 0Ah
        jmp short .13
.11:
        cmp dword [dword eax+0614h], byte 0
        je short .12
        mov byte [dword eax+0241h], 0Fh
        jmp short .13
.12:
        mov byte [dword eax+0241h], 16h
.13:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0218h], byte 0
        sete dl
        add dl, 5
        mov byte [dword eax+02A8h], dl
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+03B0h], byte 0
        setne dl
        add dl, 8
        mov byte [dword eax+0375h], dl
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+01B2h], byte 0
        je short .14
        mov byte [dword eax+03D8h], 4
        jmp short .16
.14:
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .15
        mov byte [dword eax+03D8h], 18h
        jmp short .16
.15:
        mov byte [dword eax+03D8h], 3
.16:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+05AEh], byte 0
        je short .17
        mov byte [dword eax+03D9h], 0Eh
        jmp short .19
.17:
        cmp dword [dword eax+07ACh], byte 0
        je short .18
        mov byte [dword eax+03D9h], 13h
        jmp short .19
.18:
        mov byte [dword eax+03D9h], 17h
.19:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0218h], byte 0
        je short .20
        mov byte [dword eax+043Eh], 5
        jmp short .22
.20:
        cmp dword [byte eax+01Ah], byte 0
        je short .21
        mov byte [dword eax+043Eh], 0
        jmp short .22
.21:
        mov byte [dword eax+043Eh], 6
.22:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0614h], byte 0
        je short .23
        mov byte [dword eax+043Fh], 0Fh
        jmp short .24
.23:
        mov byte [dword eax+043Fh], 16h
.24:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0416h], byte 0
        je short .25
        mov byte [dword eax+04A6h], 0Ah
        jmp short .26
.25:
        mov byte [dword eax+04A6h], 16h
.26:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+05AEh], byte 0
        je short .27
        mov byte [dword eax+0573h], 0Eh
        jmp short .28
.27:
        mov byte [dword eax+0573h], 17h
.28:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+03B0h], byte 0
        je short .29
        mov byte [dword eax+05D6h], 9
        jmp short .32
.29:
        cmp dword [dword eax+01B2h], byte 0
        je short .30
        mov byte [dword eax+05D6h], 4
        jmp short .32
.30:
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .31
        mov byte [dword eax+05D6h], 18h
        jmp short .32
.31:
        mov byte [dword eax+05D6h], 8
.32:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+07ACh], byte 0
        je short .33
        mov byte [dword eax+05D7h], 13h
        jmp short .34
.33:
        mov byte [dword eax+05D7h], 17h
.34:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0416h], byte 0
        je short .35
        mov byte [dword eax+063Ch], 0Ah
.35:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0218h], byte 0
        je short .36
        mov byte [dword eax+063Ch], 5
        jmp short .38
.36:
        cmp dword [byte eax+01Ah], byte 0
        je short .37
        mov byte [dword eax+063Ch], 0
        jmp short .38
.37:
        mov byte [dword eax+063Ch], 6
.38:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0614h], byte 0
        je short .39
        mov byte [dword eax+06A4h], 0Fh
        jmp short .40
.39:
        mov byte [dword eax+06A4h], 16h
.40:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+07ACh], byte 0
        je short .41
        mov byte [dword eax+0771h], 13h
        jmp short .42
.41:
        mov byte [dword eax+0771h], 17h
.42:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+05AEh], byte 0
        je short .43
        mov byte [dword eax+07D4h], 0Eh
        jmp short .47
.43:
        cmp dword [dword eax+03B0h], byte 0
        je short .44
        mov byte [dword eax+07D4h], 9
        jmp short .47
.44:
        cmp dword [dword eax+01B2h], byte 0
        je short .45
        mov byte [dword eax+07D4h], 4
        jmp short .47
.45:
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .46
        mov byte [dword eax+07D4h], 18h
        jmp short .47
.46:
        mov byte [dword eax+07D4h], 0Dh
.47:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0614h], byte 0
        je short .48
        mov byte [dword eax+0906h], 0Fh
        jmp short .52
.48:
        cmp dword [dword eax+0416h], byte 0
        je short .49
        mov byte [dword eax+0906h], 0Ah
        jmp short .52
.49:
        cmp dword [dword eax+0218h], byte 0
        je short .50
        mov byte [dword eax+0906h], 5
        jmp short .52
.50:
        cmp dword [byte eax+01Ah], byte 0
        je short .51
        mov byte [dword eax+0906h], 0
        jmp short .52
.51:
        mov byte [dword eax+0906h], 10h
.52:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        je short .53
        cmp dword [SaveFileHandle], byte 0FFFFFFFFh
        jne short .53
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+0909h], 14h
        jmp short .55
.53:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+0614h], byte 0
        je short .54
        mov byte [dword eax+0909h], 0Fh
        jmp short .55
.54:
        mov byte [dword eax+0909h], 10h
.55:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+07ACh], byte 0
        je short .56
        mov byte [dword eax+096Ch], 13h
        jmp short .61
.56:
        cmp dword [dword eax+05AEh], byte 0
        je short .57
        mov byte [dword eax+096Ch], 0Eh
        jmp short .61
.57:
        cmp dword [dword eax+03B0h], byte 0
        je short .58
        mov byte [dword eax+096Ch], 9
        jmp short .61
.58:
        cmp dword [dword eax+01B2h], byte 0
        je short .59
        mov byte [dword eax+096Ch], 4
        jmp short .61
.59:
        mov edx, dword [optflags]
        and edx, byte 70h
        cmp edx, byte 30h
        jne short .60
        mov byte [dword eax+096Ch], 18h
        jmp short .61
.60:
        mov byte [dword eax+096Ch], 12h
.61:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        je short .62
        cmp dword [SaveFileHandle], byte 0FFFFFFFFh
        jne short .62
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+096Eh], 15h
        jmp short .64
.62:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+07ACh], byte 0
        je short .63
        mov byte [dword eax+096Eh], 13h
        jmp short .64
.63:
        mov byte [dword eax+096Eh], 12h
.64:
        mov eax, dword [ControllerColumnArt]
        cmp dword [dword eax+01B2h], byte 0
        je short .65
        mov byte [dword eax+09D3h], 4
        pop edx
        ret
.65:
        cmp dword [dword eax+03B0h], byte 0
        je short .66
        mov byte [dword eax+09D3h], 9
        pop edx
        ret
.66:
        cmp dword [dword eax+05AEh], byte 0
        je short .67
        mov byte [dword eax+09D3h], 0Eh
        pop edx
        ret
.67:
        cmp dword [dword eax+07ACh], byte 0
        je short .68
        mov byte [dword eax+09D3h], 13h
        pop edx
        ret
.68:
        mov byte [dword eax+09D3h], 17h
        pop edx
        ret
;-----------------------------------------------------------------------------
; SetControllerIcon                               6E233  96 PC, low confidence
; (side, ...): puts the p1_1 / p2_1 pad image in a side's slot of the screen
; (not in a modem / link game)
;-----------------------------------------------------------------------------
SetControllerIcon:
        push ebx
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov ebx, dword [optflags]
        and ebx, byte 70h
        cmp ebx, byte 30h
        je near SetControllerIcon_F9
        cmp dword [SaveFileHandle], byte 0FFFFFFFFh
        jne near SetControllerIcon_F9
        test eax, eax
        jne short .1
        lea edi, [byte ebp-0Ch]
        mov eax, dword [ControllerColumnArt]
        mov esi, str_P11
        add eax, 7F8h
        jmp short .2
.1:
        cmp eax, byte 1
        jne near SetControllerIcon_F9
        lea edi, [byte ebp-0Ch]
        mov eax, dword [ControllerColumnArt]
        mov esi, str_P21
        add eax, 85Eh
.2:
        movsd
        movsb
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-04h]
        mov dword [byte eax+0Ch], 1
        test edx, edx
        je short .3
        cmp dword [byte eax+01Eh], byte 0
        jne near SetControllerIcon_F9
        lea eax, [byte ebp-0Ch]
        push eax
        push dword [ControllerIconArt]
        call FindShape
        mov edx, dword [byte ebp-04h]
        add esp, byte 8
        mov dword [byte edx+01Ah], eax
        lea eax, [byte ebp-0Ch]
        push eax
        push dword [ControllerIconArt]
        mov byte [byte ebp-09h], 32h
        call FindShape
        mov edx, dword [byte ebp-04h]
        add esp, byte 8
        mov dword [byte edx+01Eh], eax
        lea eax, [byte ebp-0Ch]
        push eax
        push dword [ControllerIconArt]
        mov byte [byte ebp-09h], 33h
        call FindShape
        mov edx, dword [byte ebp-04h]
        add esp, byte 8
        mov dword [byte edx+022h], eax
        jmp short SetControllerIcon_F9
.3:
        cmp dword [byte eax+01Eh], byte 0
        je short SetControllerIcon_F9
        lea eax, [byte ebp-0Ch]
        push eax
        push dword [ControllerIconArt]
        mov byte [byte ebp-09h], 67h
        call FindShape
        mov edx, dword [byte ebp-04h]
        mov dword [byte edx+01Eh], 0
        mov dword [byte edx+022h], 0
        add esp, byte 8
        mov dword [byte edx+01Ah], eax
SetControllerIcon_F9:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawControllerColumns                        6E332  96 PC, medium confidence
; The controller screen's columns: the pads by team with the users' icons and
; names (usri, usrh, utext), with the move sound
;-----------------------------------------------------------------------------
DrawControllerColumns:
        push ebx
        push ecx
        push esi
        push edi
        enter 20h, 0
        push eax
        push edx
        mov eax, edx
        mov ebx, 5
        cdq
        idiv ebx
        mov ecx, 5
        mov eax, dword [byte ebp-028h]
        mov ebx, edx
        cdq
        idiv ecx
        mov dword [byte ebp-04h], eax
        cmp word [ControllerColumnsDrawn], byte 0
        je short .1
        mov eax, 34h
        call PlaySfx
.1:
        mov eax, dword [byte ebp-04h]
        inc eax
        mov dword [byte ebp-08h], eax
        cwde
        cmp eax, byte 4
        jne short .2
        mov dword [byte ebp-08h], 0
.2:
        mov edi, dword [byte ebp-08h]
        inc edi
        movsx eax, di
        cmp eax, byte 4
        jne short .3
        xor edi, edi
.3:
        mov eax, edi
        inc eax
        mov dword [byte ebp-0Ch], eax
        cwde
        cmp eax, byte 4
        jne short .4
        mov dword [byte ebp-0Ch], 0
.4:
        mov esi, dword [optflags]
        and esi, byte 70h
        cmp bx, byte 2
        jb short .5
        jbe near .20
        cmp bx, byte 3
        je near .33
        jmp near .49
.5:
        cmp bx, byte 1
        jne near .49
        movsx eax, word [byte ebp-04h]
        movsx eax, word [nosplit eax*8+ControllerSlotDevice]
        cmp eax, byte 2
        je near .9
        cmp esi, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        jne short .7
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .6
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .7
.6:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .8
        cmp word [ControllerScreenMode], byte 0
        jne short .8
.7:
        movsx eax, word [byte ebp-0Ch]
        movsx ecx, word [nosplit eax*8+ControllerSlotTeam]
        movsx eax, di
        movsx esi, word [byte ebp-04h]
        movsx ebx, word [nosplit eax*8+ControllerSlotTeam]
        movsx eax, word [byte ebp-08h]
        push dword [ControllerBackBmp]
        movsx edx, word [nosplit eax*8+ControllerSlotTeam]
        movsx eax, word [nosplit esi*8+ControllerSlotTeam]
        call NextControllerDevice
        mov word [nosplit esi*8+ControllerSlotTeam], ax
        jmp short .9
.8:
        movsx eax, word [byte ebp-04h]
        mov word [nosplit eax*8+ControllerSlotTeam], 400h
.9:
        movsx esi, word [byte ebp-04h]
        shl esi, 3
        movsx eax, word [dword esi+ControllerSlotTeam]
        cmp eax, byte 1
        je near .49
        mov eax, dword [byte ebp-024h]
        mov dword [byte eax+01Ah], 0
        mov dword [byte eax+05Ah], 0
        mov dword [byte eax+062h], 0
        and byte [byte eax+046h], 0FDh
        push dword [dword esi+ControllerSlotIcon]
        call PutBlockAtOwnPos
        movsx eax, word [dword esi+ControllerSlotDevice]
        add esp, byte 4
        cmp eax, byte 2
        jne near .13
        mov eax, dword [byte ebp-028h]
        add eax, byte 3
        imul eax, byte 66h
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+01Ah], 0
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+01Eh], 0
        mov edx, dword [ControllerColumnArt]
        mov word [byte edx+eax+018h], 3
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .11
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .10
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .12
.10:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .13
        cmp word [ControllerScreenMode], byte 0
        jne short .13
        jmp short .12
.11:
        movsx eax, word [byte ebp-08h]
        movsx eax, word [nosplit eax*8+ControllerSlotDevice]
        cmp eax, byte 2
        je short .13
        movsx eax, di
        movsx eax, word [nosplit eax*8+ControllerSlotDevice]
        cmp eax, byte 2
        je short .13
        movsx eax, word [byte ebp-0Ch]
        movsx eax, word [nosplit eax*8+ControllerSlotDevice]
        cmp eax, byte 2
        je short .13
.12:
        mov eax, 1
        xor edx, edx
        call SetControllerIcon
.13:
        imul edi, dword [byte ebp-028h], byte 66h
        movsx ebx, word [byte ebp-04h]
        mov eax, dword [ControllerIconArt]
        movsx edx, word [nosplit ebx*8+ControllerSlotTeam]
        mov esi, ebx
        call DeviceIconShape
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        mov dword [byte edi+eax+01Ah], edx
        mov eax, dword [ControllerColumnArt]
        mov dword [byte edi+eax+05Ah], DrawControllerIcons
        mov eax, dword [ControllerColumnArt]
        mov dword [byte edi+eax+062h], DrawControllerColumns
        mov eax, dword [ControllerColumnArt]
        or byte [byte edi+eax+046h], 2
        mov ebx, dword [ControllerColumnArt]
        mov eax, dword [nosplit esi*8+ControllerSlotIcon]
        mov dx, word [byte edi+ebx+026h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [ControllerColumnArt]
        add edi, eax
        mov eax, dword [nosplit esi*8+ControllerSlotIcon]
        mov dx, word [byte edi+02Ah]
        mov word [byte eax+0Eh], dx
        push dword [nosplit esi*8+ControllerSlotIcon]
        call DrawShapeAtOwnPos
        mov eax, dword [byte ebp-028h]
        dec eax
        imul edx, eax, byte 66h
        mov eax, dword [ControllerColumnArt]
        mov word [nosplit esi*8+ControllerSlotDevice], 0
        mov word [byte edx+eax+018h], 0
        movsx eax, word [ControllerDragIcon]
        add esp, byte 4
        cmp eax, dword [byte ebp-028h]
        je near .49
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        jne short .15
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .14
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .15
.14:
        cmp dword [byte ebp-028h], byte 0Ah
        jle near .49
        cmp word [ControllerScreenMode], byte 0
        jne near .49
.15:
        mov esi, dword [byte ebp-028h]
        dec esi
        imul esi, byte 66h
        push dword [FrontEndScreenBmp]
        call TextSetFont
        add esp, byte 4
        push str_Usri
        push dword [ControllerIconArt]
        call FindShape
        add esp, byte 8
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        push str_Usrh
        mov dword [byte esi+eax+01Ah], edx
        push dword [ControllerIconArt]
        call FindShape
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        mov dword [byte esi+eax+01Eh], edx
        movsx eax, word [byte ebp-04h]
        mov edx, eax
        shl edx, 2
        add esp, byte 8
        mov dword [byte ebp-014h], edx
        cmp dword [dword edx+ControllerSlotItems], byte 0
        je short .16
        push dword [dword edx+ControllerSlotItems]
        call PutBlockAtOwnPos
        add esp, byte 4
        jmp near .17
.16:
        imul eax, byte 21h
        add eax, SlotUserNames
        push byte 20h
        inc eax
        inc eax
        push eax
        movzx edi, byte [TextCharH]
        mov dword [byte ebp-01Ch], eax
        call TextStringWidth
        lea edx, [byte edi+01h]
        imul eax, edx
        add esp, byte 4
        add eax, byte 10h
        push eax
        push str_Utext
        call AllocMemBlock
        mov edx, dword [byte ebp-014h]
        mov dword [dword edx+ControllerSlotItems], eax
        mov eax, dword [ControllerColumnArt]
        add esp, byte 0Ch
        mov edi, dword [dword edx+ControllerSlotItems]
        mov esi, dword [byte esi+eax+01Ah]
        push dword [byte ebp-01Ch]
        movsd
        movsd
        movsd
        movsd
        movsb
        call TextStringWidth
        mov edx, eax
        mov eax, dword [byte ebp-014h]
        mov eax, dword [dword eax+ControllerSlotItems]
        mov word [byte eax+04h], dx
        mov eax, dword [byte ebp-014h]
        movzx dx, byte [TextCharH]
        mov eax, dword [dword eax+ControllerSlotItems]
        inc edx
        add esp, byte 4
        mov word [byte eax+06h], dx
.17:
        mov edi, dword [byte ebp-028h]
        movsx eax, word [byte ebp-04h]
        shl edi, 6
        mov esi, eax
        mov dword [byte ebp-020h], eax
        shl esi, 2
        mov dx, word [dword edi+ControllerLayout+14h]
        mov eax, dword [dword esi+ControllerSlotItems]
        add edx, byte 6
        mov word [byte eax+0Ch], dx
        mov dx, word [dword edi+ControllerLayout+18h]
        mov eax, dword [dword esi+ControllerSlotItems]
        sub edx, byte 5
        mov word [byte eax+0Eh], dx
        push dword [dword esi+ControllerSlotItems]
        call DrawShapeAtOwnPos
        imul eax, dword [byte ebp-020h], byte 21h
        add esp, byte 4
        mov ebx, dword [dword edi+ControllerLayout+18h]
        mov edx, dword [dword edi+ControllerLayout+14h]
        sub ebx, byte 5
        add eax, SlotUserNames
        add edx, byte 6
        inc eax
        inc eax
        call DrawColorText
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        cmp dword [dword esi+ControllerSlotStates], byte 0
        jne short .18
        mov eax, dword [byte ebp-028h]
        dec eax
        imul eax, byte 66h
        mov edx, dword [ControllerColumnArt]
        mov eax, dword [byte edx+eax+01Ah]
        mov edx, 20h
        call CopyBitmap
        mov dword [dword esi+ControllerSlotStates], eax
        jmp short .19
.18:
        push dword [dword esi+ControllerSlotStates]
        call PutBlockAtOwnPos
        add esp, byte 4
.19:
        mov esi, dword [byte ebp-028h]
        dec esi
        imul esi, byte 66h
        movsx eax, word [byte ebp-04h]
        mov edi, dword [ControllerColumnArt]
        mov ebx, dword [nosplit eax*4+ControllerSlotStates]
        mov dx, word [byte edi+esi+026h]
        mov word [byte ebx+0Ch], dx
        mov ebx, dword [ControllerColumnArt]
        mov edi, dword [nosplit eax*4+ControllerSlotStates]
        mov dx, word [byte esi+ebx+02Ah]
        mov word [byte edi+0Eh], dx
        push dword [nosplit eax*4+ControllerSlotStates]
        call DrawShapeAtOwnPos
        mov eax, dword [ControllerColumnArt]
        add esp, byte 4
        push dword [byte esi+eax+02Ah]
        push dword [byte esi+eax+026h]
        push dword [byte esi+eax+01Ah]
        call DrawArt
        add esp, byte 0Ch
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        mov edx, 1
        xor eax, eax
        jmp near .48
.20:
        movsx esi, word [byte ebp-04h]
        shl esi, 3
        movsx eax, word [dword esi+ControllerSlotDevice]
        cmp eax, byte 1
        je near .49
        mov eax, dword [byte ebp-024h]
        mov dword [byte eax+01Ah], 0
        mov dword [byte eax+05Ah], 0
        mov dword [byte eax+062h], 0
        and byte [byte eax+046h], 0FDh
        push dword [dword esi+ControllerSlotIcon]
        call PutBlockAtOwnPos
        movsx eax, word [dword esi+ControllerSlotDevice]
        add esp, byte 4
        cmp eax, byte 2
        jne near .24
        mov eax, dword [byte ebp-028h]
        inc eax
        inc eax
        imul eax, byte 66h
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+01Ah], 0
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+01Eh], 0
        mov edx, dword [ControllerColumnArt]
        mov word [byte edx+eax+018h], 3
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .23
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .21
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .22
.21:
        cmp dword [byte ebp-028h], byte 0Ah
        jle near .29
        cmp word [ControllerScreenMode], byte 0
        jne near .29
.22:
        mov eax, 1
        xor edx, edx
        jmp near .28
.23:
        movsx eax, word [byte ebp-08h]
        movsx eax, word [nosplit eax*8+ControllerSlotDevice]
        cmp eax, byte 2
        je near .29
        movsx eax, di
        movsx eax, word [nosplit eax*8+ControllerSlotDevice]
        cmp eax, byte 2
        je near .29
        movsx eax, word [byte ebp-0Ch]
        movsx eax, word [nosplit eax*8+ControllerSlotDevice]
        cmp eax, byte 2
        je near .29
        jmp short .22
.24:
        mov eax, dword [byte ebp-028h]
        dec eax
        dec eax
        imul eax, byte 66h
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+01Ah], 0
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+01Eh], 0
        mov edx, dword [ControllerColumnArt]
        mov word [byte edx+eax+018h], 3
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .27
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .25
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .26
.25:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .29
        cmp word [ControllerScreenMode], byte 0
        jne short .29
.26:
        xor edx, edx
        xor eax, eax
        jmp short .28
.27:
        movsx eax, word [byte ebp-08h]
        cmp word [nosplit eax*8+ControllerSlotDevice], byte 0
        je short .29
        movsx eax, di
        cmp word [nosplit eax*8+ControllerSlotDevice], byte 0
        je short .29
        movsx eax, word [byte ebp-0Ch]
        cmp word [nosplit eax*8+ControllerSlotDevice], byte 0
        je short .29
        xor edx, edx
        xor eax, eax
.28:
        call SetControllerIcon
.29:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        jne short .31
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .30
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .31
.30:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .32
        cmp word [ControllerScreenMode], byte 0
        jne short .32
.31:
        movsx esi, word [byte ebp-04h]
        push dword [nosplit esi*4+ControllerSlotStates]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [nosplit esi*4+ControllerSlotStates]
        call FreeMemBlock
        add esp, byte 4
        push dword [nosplit esi*4+ControllerSlotItems]
        mov dword [nosplit esi*4+ControllerSlotStates], 0
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [nosplit esi*4+ControllerSlotItems]
        call FreeMemBlock
        add esp, byte 4
        mov dword [nosplit esi*4+ControllerSlotItems], 0
.32:
        movsx ebx, word [byte ebp-04h]
        mov eax, ebx
        call ClearSlotUser
        mov word [nosplit ebx*8+ControllerSlotTeam], 1
        mov eax, dword [ControllerIconArt]
        movsx edx, word [nosplit ebx*8+ControllerSlotTeam]
        mov esi, ebx
        call DeviceIconShape
        mov edx, eax
        imul eax, dword [byte ebp-028h], byte 66h
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+01Ah], edx
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+05Ah], DrawControllerIcons
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+062h], DrawControllerColumns
        mov edi, dword [ControllerColumnArt]
        or byte [byte edi+eax+046h], 2
        mov ebx, dword [ControllerColumnArt]
        mov edi, dword [nosplit esi*8+ControllerSlotIcon]
        mov dx, word [byte ebx+eax+026h]
        mov word [byte edi+0Ch], dx
        mov ebx, dword [ControllerColumnArt]
        add ebx, eax
        mov eax, dword [nosplit esi*8+ControllerSlotIcon]
        mov dx, word [byte ebx+02Ah]
        mov word [byte eax+0Eh], dx
        push dword [nosplit esi*8+ControllerSlotIcon]
        call DrawShapeAtOwnPos
        add esp, byte 4
        mov word [nosplit esi*8+ControllerSlotDevice], 1
        jmp near .49
.33:
        movsx eax, word [byte ebp-04h]
        cmp word [nosplit eax*8+ControllerSlotDevice], byte 0
        je near .37
        cmp esi, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        jne short .35
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .34
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .35
.34:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .36
        cmp word [ControllerScreenMode], byte 0
        jne short .36
.35:
        movsx eax, word [byte ebp-0Ch]
        movsx ecx, word [nosplit eax*8+ControllerSlotTeam]
        movsx eax, di
        movsx esi, word [byte ebp-04h]
        movsx ebx, word [nosplit eax*8+ControllerSlotTeam]
        movsx eax, word [byte ebp-08h]
        push dword [ControllerBackBmp]
        movsx edx, word [nosplit eax*8+ControllerSlotTeam]
        movsx eax, word [nosplit esi*8+ControllerSlotTeam]
        call NextControllerDevice
        mov word [nosplit esi*8+ControllerSlotTeam], ax
        jmp short .37
.36:
        movsx eax, word [byte ebp-04h]
        mov word [nosplit eax*8+ControllerSlotTeam], 400h
.37:
        movsx esi, word [byte ebp-04h]
        shl esi, 3
        movsx eax, word [dword esi+ControllerSlotTeam]
        cmp eax, byte 1
        je near .49
        mov eax, dword [byte ebp-024h]
        mov dword [byte eax+01Ah], 0
        mov dword [byte eax+05Ah], 0
        mov dword [byte eax+062h], 0
        and byte [byte eax+046h], 0FDh
        push dword [dword esi+ControllerSlotIcon]
        call PutBlockAtOwnPos
        add esp, byte 4
        cmp word [dword esi+ControllerSlotDevice], byte 0
        jne near .41
        mov ebx, dword [byte ebp-028h]
        sub ebx, byte 3
        imul ebx, byte 66h
        mov eax, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+01Ah], 0
        mov eax, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+01Eh], 0
        mov eax, dword [ControllerColumnArt]
        mov word [byte ebx+eax+018h], 3
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .39
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .38
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .40
.38:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .41
        cmp word [ControllerScreenMode], byte 0
        jne short .41
        jmp short .40
.39:
        movsx eax, word [byte ebp-08h]
        cmp word [nosplit eax*8+ControllerSlotDevice], byte 0
        je short .41
        movsx eax, di
        cmp word [nosplit eax*8+ControllerSlotDevice], byte 0
        je short .41
        movsx eax, word [byte ebp-0Ch]
        cmp word [nosplit eax*8+ControllerSlotDevice], byte 0
        je short .41
.40:
        xor edx, edx
        xor eax, eax
        call SetControllerIcon
.41:
        movsx ebx, word [byte ebp-04h]
        mov eax, dword [ControllerIconArt]
        movsx edx, word [nosplit ebx*8+ControllerSlotTeam]
        mov esi, ebx
        call DeviceIconShape
        mov edx, eax
        imul eax, dword [byte ebp-028h], byte 66h
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+01Ah], edx
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+05Ah], DrawControllerIcons
        mov ebx, dword [ControllerColumnArt]
        mov dword [byte ebx+eax+062h], DrawControllerColumns
        mov edi, dword [ControllerColumnArt]
        or byte [byte edi+eax+046h], 2
        mov ebx, dword [ControllerColumnArt]
        mov edi, dword [nosplit esi*8+ControllerSlotIcon]
        mov dx, word [byte ebx+eax+026h]
        mov word [byte edi+0Ch], dx
        mov edx, dword [ControllerColumnArt]
        mov ebx, dword [nosplit esi*8+ControllerSlotIcon]
        mov ax, word [byte edx+eax+02Ah]
        mov word [byte ebx+0Eh], ax
        push dword [nosplit esi*8+ControllerSlotIcon]
        call DrawShapeAtOwnPos
        mov eax, dword [byte ebp-028h]
        inc eax
        imul eax, byte 66h
        mov edx, dword [ControllerColumnArt]
        mov word [nosplit esi*8+ControllerSlotDevice], 2
        mov word [byte edx+eax+018h], 0
        movsx eax, word [ControllerDragIcon]
        add esp, byte 4
        cmp eax, dword [byte ebp-028h]
        je near .49
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        jne short .43
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .42
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .43
.42:
        cmp dword [byte ebp-028h], byte 0Ah
        jle near .49
        cmp word [ControllerScreenMode], byte 0
        jne near .49
.43:
        mov esi, dword [byte ebp-028h]
        inc esi
        imul esi, byte 66h
        push dword [FrontEndScreenBmp]
        call TextSetFont
        add esp, byte 4
        push str_Usri
        push dword [ControllerIconArt]
        call FindShape
        add esp, byte 8
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        push str_Usrh
        mov dword [byte esi+eax+01Ah], edx
        push dword [ControllerIconArt]
        call FindShape
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        mov dword [byte esi+eax+01Eh], edx
        movsx eax, word [byte ebp-04h]
        mov edx, eax
        shl edx, 2
        add esp, byte 8
        mov dword [byte ebp-010h], edx
        cmp dword [dword edx+ControllerSlotItems], byte 0
        je short .44
        push dword [dword edx+ControllerSlotItems]
        call PutBlockAtOwnPos
        add esp, byte 4
        jmp near .45
.44:
        imul eax, byte 21h
        add eax, SlotUserNames
        push byte 20h
        inc eax
        inc eax
        movzx edi, byte [TextCharH]
        push eax
        inc edi
        mov dword [byte ebp-01Ch], eax
        call TextStringWidth
        imul eax, edi
        add esp, byte 4
        add eax, byte 10h
        push eax
        push str_Utext
        call AllocMemBlock
        mov edx, dword [byte ebp-010h]
        mov dword [dword edx+ControllerSlotItems], eax
        mov eax, dword [ControllerColumnArt]
        add esp, byte 0Ch
        mov edi, dword [dword edx+ControllerSlotItems]
        mov esi, dword [byte esi+eax+01Ah]
        push dword [byte ebp-01Ch]
        movsd
        movsd
        movsd
        movsd
        movsb
        call TextStringWidth
        mov edx, eax
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+ControllerSlotItems]
        mov word [byte eax+04h], dx
        mov eax, dword [byte ebp-010h]
        movzx dx, byte [TextCharH]
        mov eax, dword [dword eax+ControllerSlotItems]
        inc edx
        add esp, byte 4
        mov word [byte eax+06h], dx
.45:
        movsx eax, word [byte ebp-04h]
        mov edi, dword [byte ebp-028h]
        mov dword [byte ebp-018h], eax
        mov esi, eax
        shl edi, 6
        shl esi, 2
        mov dx, word [dword edi+ControllerColumnInfo]
        mov eax, dword [dword esi+ControllerSlotItems]
        sub edx, byte 4
        sub dx, word [byte eax+04h]
        mov word [byte eax+0Ch], dx
        mov dx, word [dword edi+ControllerLayout]
        mov eax, dword [dword esi+ControllerSlotItems]
        sub edx, byte 5
        mov word [byte eax+0Eh], dx
        push dword [dword esi+ControllerSlotItems]
        call DrawShapeAtOwnPos
        imul eax, dword [byte ebp-018h], byte 21h
        add esp, byte 4
        mov ebx, dword [dword edi+ControllerLayout]
        mov edx, dword [dword edi+ControllerColumnInfo]
        sub ebx, byte 5
        add eax, SlotUserNames
        sub edx, byte 4
        inc eax
        inc eax
        call DrawColorTextRight
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        cmp dword [dword esi+ControllerSlotStates], byte 0
        jne short .46
        mov eax, dword [byte ebp-028h]
        inc eax
        imul edx, eax, byte 66h
        mov eax, dword [ControllerColumnArt]
        mov eax, dword [byte edx+eax+01Ah]
        mov edx, 20h
        call CopyBitmap
        mov dword [dword esi+ControllerSlotStates], eax
        jmp short .47
.46:
        push dword [dword esi+ControllerSlotStates]
        call PutBlockAtOwnPos
        add esp, byte 4
.47:
        mov edi, dword [byte ebp-028h]
        inc edi
        imul edi, byte 66h
        movsx eax, word [byte ebp-04h]
        mov ebx, dword [ControllerColumnArt]
        mov esi, dword [nosplit eax*4+ControllerSlotStates]
        mov dx, word [byte edi+ebx+026h]
        mov word [byte esi+0Ch], dx
        mov esi, dword [ControllerColumnArt]
        mov ebx, dword [nosplit eax*4+ControllerSlotStates]
        mov dx, word [byte edi+esi+02Ah]
        mov word [byte ebx+0Eh], dx
        push dword [nosplit eax*4+ControllerSlotStates]
        call DrawShapeAtOwnPos
        mov eax, dword [ControllerColumnArt]
        add esp, byte 4
        push dword [byte edi+eax+02Ah]
        push dword [byte edi+eax+026h]
        push dword [byte edi+eax+01Ah]
        call DrawArt
        add esp, byte 0Ch
        push dword [MatchupLayer]
        call TextSetFont
        mov edx, 1
        add esp, byte 4
        mov eax, edx
.48:
        call SetControllerIcon
.49:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .52
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        jne short .51
        mov eax, dword [byte ebp-024h]
        cmp dword [eax], byte 0Ah
        jl short .52
.50:
        mov word [ControllerDragSlot], 0FFFFh
        jmp short .53
.51:
        cmp word [ControllerScreenMode], byte 0
        jne short .53
        mov eax, dword [byte ebp-024h]
        cmp dword [eax], byte 0Ah
        jl short .50
.52:
        mov word [ControllerDragIcon], 0FFFFh
.53:
        call SetControllerColumn
        jmp near SetControllerIcon_F9
ControllerScreenItemJumpTable:                  ; jump table for the switch cases of ControllerScreen
        dd ControllerScreen_11AB
        dd ControllerScreen_149D
        dd ControllerScreen_14E4
        dd ControllerScreen_1503
        dd ControllerScreen_11AB
ControllerScreenModeJumpTable:                  ; jump table for the switch cases of ControllerScreen
        dd ControllerScreen_1548
        dd ControllerScreen_15D1
        dd ControllerScreen_168B
        dd ControllerScreen_16B0
        dd ControllerScreen_16D6
;-----------------------------------------------------------------------------
; ControllerScreen                                                6F056  96 PC
; The controller screen (M_CONTROL, ply%d, key1): moves each controller to
; home, away or neither; returns the screen to go to
;-----------------------------------------------------------------------------
ControllerScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 68h, 0
        push eax
        lea edi, [byte ebp-060h]
        mov esi, ControllerSlotDefaults
        push byte 20h
        movsd
        movsw
        push dword 9F6h
        lea edi, [byte ebp-068h]
        mov esi, ControllerColumnDefaults
        push str_MCONTROL
        movsd
        movsd
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [ControllerColumnArt], eax
        mov eax, 6
        xor edx, edx
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 4Dh
        call LoadPackedFile
        push byte 0
        mov dword [ControllerIconArt], eax
        call ClearScreenColour
        add esp, byte 4
        call BlackPalette
        push str_Pal12
        mov esi, str_WesternConference2
        push dword [ControllerIconArt]
        add esi, 1F2h
        call FindShape
        add esp, byte 8
        lea edx, [byte eax+010h]
        mov ecx, 0C0h
        lea edi, [dword eax+0202h]
        rep movsb
        mov eax, edx
        mov dword [byte ebp-050h], edx
        call SetScreenColors
        call SetScreenTarget
        push str_Bkgd6
        push dword [ControllerIconArt]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        mov edx, 0E00000h
        mov eax, 0EB85h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        mov edx, 780000h
        mov dword [byte ebp-048h], eax
        mov eax, 0EB85h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edi, eax
        push byte 0
        sar edi, 10h
        push edi
        push dword [byte ebp-048h]
        mov dword [byte ebp-040h], 0FFFFFFFFh
        call CreateBitmap
        mov esi, eax
        add esp, byte 0Ch
        mov eax, dword [byte ebp-048h]
        sar eax, 1
        mov dword [byte ebp-03Ch], eax
        mov eax, 87h
        sub eax, dword [byte ebp-03Ch]
        mov dword [byte ebp-08h], eax
        mov edx, dword [byte ebp-08h]
        mov eax, dword [byte esi+02Ch]
        sar edi, 1
        mov word [byte eax+0Ch], dx
        mov eax, 96h
        sub eax, edi
        mov edi, eax
        mov eax, dword [byte esi+02Ch]
        mov edx, edi
        mov word [byte eax+0Eh], dx
        push dword [byte esi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push esi
        call SetDrawBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        add esp, byte 4
        shl eax, 0Fh
        xor ecx, ecx
        shr eax, 1Bh
        xor ebx, ebx
        call LoadTeamLogo
        mov edx, eax
        mov eax, 0EB85h
        call DrawFrameAt
        call SetScreenTarget
        push edi
        push dword [byte ebp-08h]
        push dword [byte esi+02Ch]
        call PutBlock
        mov eax, 1FBh
        sub eax, dword [byte ebp-03Ch]
        mov dword [byte ebp-08h], eax
        mov eax, dword [byte esi+02Ch]
        mov edx, dword [byte ebp-08h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte esi+02Ch]
        mov edx, edi
        add esp, byte 0Ch
        mov word [byte eax+0Eh], dx
        push dword [byte esi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push esi
        call SetDrawBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        add esp, byte 4
        shl eax, 0Ah
        xor ecx, ecx
        shr eax, 1Bh
        xor ebx, ebx
        call LoadTeamLogo
        mov edx, eax
        mov eax, 0EB85h
        call DrawFrameAt
        call SetScreenTarget
        push edi
        push dword [byte ebp-08h]
        push dword [byte esi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push esi
        call FreeBitmap
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        add esp, byte 4
        shr eax, 1Bh
        call GetTeamNameArt
        mov edi, eax
        movsx eax, word [byte eax+06h]
        push byte 20h
        inc eax
        inc eax
        push eax
        movsx eax, word [byte edi+04h]
        inc eax
        inc eax
        push eax
        call CreateBitmap
        mov esi, eax
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Ch], 31h
        mov eax, dword [byte esi+02Ch]
        add esp, byte 0Ch
        mov word [byte eax+0Eh], 0D6h
        push dword [byte esi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push esi
        call SetDrawBitmap
        mov ecx, 1
        mov eax, 0FAE1h
        add esp, byte 4
        mov edx, edi
        mov ebx, ecx
        call DrawFrameAt
        call SetScreenTarget
        push dword [byte esi+02Ch]
        call PutBlockAtOwnPos
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        add esp, byte 4
        shr eax, 1Bh
        call GetTeamNameArt
        mov edi, eax
        mov eax, dword [byte esi+02Ch]
        mov word [byte eax+0Ch], 186h
        mov eax, dword [byte esi+02Ch]
        mov word [byte eax+0Eh], 0D6h
        push dword [byte esi+02Ch]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push esi
        call SetDrawBitmap
        mov ecx, 1
        mov eax, 0FAE1h
        add esp, byte 4
        mov edx, edi
        mov ebx, ecx
        call DrawFrameAt
        call SetScreenTarget
        push dword [byte esi+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push esi
        call FreeBitmap
        add esp, byte 4
        mov edx, 0FEh
        mov eax, 0FDh
        call SetTextColors
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        je short .1
        call ScanControllers
.1:
        xor edx, edx
        xor edi, edi
        xor esi, esi
.2:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .3
        cmp word [ControllerPreGame], byte 0
        je short .3
        mov word [dword esi+ControllerSlotTeam], 1
        mov eax, edx
        mov word [dword esi+ControllerSlotDevice], 1
        call ClearSlotUser
        jmp short .6
.3:
        mov ebx, dword [gameopts]
        mov ax, word [byte edi+ebx+09h]
        mov word [dword esi+ControllerSlotTeam], ax
        cmp byte [byte edx+ebx+05h], 0
        je short .4
        mov word [dword esi+ControllerSlotDevice], 0
        jmp short .6
.4:
        cwde
        cmp eax, byte 1
        je short .5
        mov word [dword esi+ControllerSlotDevice], 2
        jmp short .6
.5:
        mov word [dword esi+ControllerSlotDevice], 1
.6:
        inc edx
        push edx
        push str_PlyD
        lea eax, [byte ebp-058h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-058h]
        push eax
        push dword [ControllerIconArt]
        mov dword [byte ebp-08h], edx
        call FindShape
        add esp, byte 8
        mov edx, 20h
        call CopyBitmap
        movsx edx, word [dword esi+ControllerSlotDevice]
        mov dword [dword esi+ControllerSlotIcon], eax
        mov dx, word [byte ebp+edx*2-060h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [dword esi+ControllerSlotIcon]
        mov dx, word [byte edi+ebp-068h]
        mov word [byte eax+0Eh], dx
        inc edi
        inc edi
        push dword [dword esi+ControllerSlotIcon]
        add esi, byte 8
        call DrawShapeAtOwnPos
        mov edx, dword [byte ebp-08h]
        add esp, byte 4
        cmp edx, byte 4
        jl near .2
        mov eax, 19h
        mov edx, dword [ControllerColumnArt]
        mov word [ControllerPreGame], 0
        call InitMenuItems
        push str_Key1
        mov dword [byte ebp-048h], 0
        mov dword [byte ebp-020h], 0
        push dword [ControllerIconArt]
        mov dword [byte ebp-01Ch], 0
        call FindShape
        mov dword [byte ebp-010h], eax
        mov eax, SlotUserNames
        mov dword [byte ebp-018h], 0
        inc eax
        inc eax
        add esp, byte 8
        mov dword [byte ebp-014h], eax
.7:
        imul eax, dword [byte ebp-048h], byte 5
        mov dword [byte ebp-04Ch], eax
        imul esi, dword [byte ebp-04Ch], byte 66h
        mov eax, dword [ControllerColumnArt]
        add eax, dword [byte ebp-020h]
        mov dword [byte eax+010h], 4
        mov eax, dword [byte ebp-04Ch]
        mov ebx, ControllerColumnInfo
        shl eax, 6
        mov edx, dword [ControllerColumnArt]
        add ebx, eax
        mov dword [byte edx+esi+014h], ebx
        mov edx, dword [ControllerColumnArt]
        mov ebx, dword [dword eax+ControllerColumnInfo]
        mov dword [byte edx+esi+026h], ebx
        mov edx, dword [ControllerColumnArt]
        mov eax, dword [dword eax+ControllerLayout]
        mov dword [byte edx+esi+02Ah], eax
        mov eax, dword [byte ebp-04Ch]
        mov edx, dword [ControllerColumnArt]
        mov ebx, dword [nosplit eax*8+ControllerSlotPositions]
        mov dword [byte edx+esi+03Ah], ebx
        mov edx, dword [ControllerColumnArt]
        mov eax, dword [nosplit eax*8+ControllerOptionRows]
        mov dword [byte edx+esi+03Eh], eax
        mov eax, dword [ControllerColumnArt]
        mov dword [byte esi+eax+032h], 0
        mov eax, dword [byte ebp-01Ch]
        cmp word [dword eax+ControllerSlotDevice], byte 0
        jne near .11
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        jne short .9
        cmp dword [byte ebp-048h], byte 2
        jge short .8
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .9
.8:
        cmp dword [byte ebp-048h], byte 1
        jle near .10
        cmp word [ControllerScreenMode], byte 0
        jne near .10
.9:
        push dword [FrontEndScreenBmp]
        call TextSetFont
        add esp, byte 4
        push str_Usri
        push dword [ControllerIconArt]
        call FindShape
        mov edx, eax
        imul eax, dword [byte ebp-04Ch], byte 66h
        mov dword [byte ebp-08h], eax
        mov eax, dword [ControllerColumnArt]
        add esp, byte 8
        add eax, dword [byte ebp-08h]
        push str_Usrh
        mov dword [byte eax+01Ah], edx
        push dword [ControllerIconArt]
        call FindShape
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        add eax, dword [byte ebp-08h]
        add esp, byte 8
        mov dword [byte eax+01Eh], edx
        push byte 20h
        movzx esi, byte [TextCharH]
        push dword [byte ebp-014h]
        inc esi
        call TextStringWidth
        imul eax, esi
        add esp, byte 4
        add eax, byte 10h
        push eax
        push str_Utext
        call AllocMemBlock
        mov edx, dword [byte ebp-018h]
        mov dword [dword edx+ControllerSlotItems], eax
        mov eax, dword [ControllerColumnArt]
        add eax, dword [byte ebp-08h]
        add esp, byte 0Ch
        mov edi, dword [dword edx+ControllerSlotItems]
        mov esi, dword [byte eax+01Ah]
        push dword [byte ebp-014h]
        movsd
        movsd
        movsd
        movsd
        movsb
        call TextStringWidth
        mov edx, eax
        mov eax, dword [byte ebp-018h]
        mov eax, dword [dword eax+ControllerSlotItems]
        mov word [byte eax+04h], dx
        mov eax, dword [byte ebp-018h]
        movzx dx, byte [TextCharH]
        mov esi, dword [byte ebp-04Ch]
        inc edx
        mov eax, dword [dword eax+ControllerSlotItems]
        shl esi, 6
        mov word [byte eax+06h], dx
        mov eax, dword [byte ebp-018h]
        mov dx, word [dword esi+ControllerLayout+54h]
        mov eax, dword [dword eax+ControllerSlotItems]
        add edx, byte 6
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp-018h]
        mov dx, word [dword esi+ControllerLayout+58h]
        mov eax, dword [dword eax+ControllerSlotItems]
        sub edx, byte 5
        add esp, byte 4
        mov word [byte eax+0Eh], dx
        mov eax, dword [byte ebp-018h]
        push dword [dword eax+ControllerSlotItems]
        call DrawShapeAtOwnPos
        mov eax, dword [byte ebp-014h]
        add esp, byte 4
        mov ebx, dword [dword esi+ControllerLayout+58h]
        mov edx, dword [dword esi+ControllerLayout+54h]
        sub ebx, byte 5
        add edx, byte 6
        call DrawColorText
        mov eax, dword [ControllerColumnArt]
        add eax, dword [byte ebp-08h]
        mov edx, 20h
        mov eax, dword [byte eax+01Ah]
        call CopyBitmap
        mov edx, dword [byte ebp-018h]
        mov dword [dword edx+ControllerSlotStates], eax
        mov edx, dword [ControllerColumnArt]
        mov eax, dword [byte ebp-018h]
        add edx, dword [byte ebp-08h]
        mov eax, dword [dword eax+ControllerSlotStates]
        mov dx, word [byte edx+026h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [byte ebp-018h]
        add eax, dword [byte ebp-08h]
        mov edx, dword [dword edx+ControllerSlotStates]
        mov ax, word [byte eax+02Ah]
        mov word [byte edx+0Eh], ax
        mov eax, dword [byte ebp-018h]
        push dword [dword eax+ControllerSlotStates]
        call DrawShapeAtOwnPos
        mov eax, dword [ControllerColumnArt]
        add esp, byte 4
        add eax, dword [byte ebp-08h]
        push dword [byte eax+02Ah]
        push dword [byte eax+026h]
        push dword [byte eax+01Ah]
        call DrawArt
        add esp, byte 0Ch
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
.10:
        imul edx, dword [byte ebp-04Ch], byte 66h
        mov eax, dword [ControllerColumnArt]
        mov word [byte edx+eax+018h], 0
        jmp short .12
.11:
        mov eax, dword [ControllerColumnArt]
        mov word [byte esi+eax+018h], 3
.12:
        imul esi, dword [byte ebp-04Ch], byte 66h
        mov eax, dword [byte ebp-01Ch]
        mov dword [byte ebp-030h], eax
        mov eax, dword [byte ebp-04Ch]
        shl eax, 3
        mov dword [byte ebp-0Ch], 0
        mov dword [byte ebp-02Ch], eax
        mov eax, dword [byte ebp-04Ch]
        mov edi, dword [byte ebp-048h]
        shl eax, 6
        mov dword [byte ebp-028h], 0
        add eax, ControllerColumnInfo
        add edi, edi
        mov dword [byte ebp-024h], eax
.13:
        mov eax, dword [byte ebp-030h]
        add dword [byte ebp-02Ch], byte 8
        add dword [byte ebp-024h], byte 40h
        inc dword [byte ebp-04Ch]
        movsx eax, word [dword eax+ControllerSlotDevice]
        add esi, byte 66h
        cmp eax, dword [byte ebp-0Ch]
        jne short .14
        mov edx, dword [byte ebp-030h]
        movsx ebx, word [byte ebp-048h]
        mov eax, dword [ControllerIconArt]
        movsx edx, word [dword edx+ControllerSlotTeam]
        call DeviceIconShape
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        mov dword [byte esi+eax+01Ah], edx
        mov eax, dword [ControllerColumnArt]
        or byte [byte esi+eax+046h], 2
        mov eax, dword [ControllerColumnArt]
        mov dword [byte esi+eax+05Ah], DrawControllerIcons
        mov eax, dword [ControllerColumnArt]
        mov dword [byte esi+eax+062h], DrawControllerColumns
        jmp short .15
.14:
        mov eax, dword [ControllerColumnArt]
        mov dword [byte esi+eax+01Ah], 0
.15:
        mov eax, dword [ControllerColumnArt]
        mov dword [byte esi+eax+010h], 6
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [byte ebp-024h]
        mov dword [byte esi+eax+014h], edx
        mov edx, dword [byte ebp-028h]
        mov eax, dword [ControllerColumnArt]
        movsx edx, word [byte edx+ebp-060h]
        mov dword [byte esi+eax+026h], edx
        mov eax, dword [ControllerColumnArt]
        movsx edx, word [byte edi+ebp-068h]
        mov dword [byte esi+eax+02Ah], edx
        mov edx, dword [byte ebp-02Ch]
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [dword edx+ControllerSlotPositions]
        mov dword [byte esi+eax+03Ah], edx
        mov edx, dword [byte ebp-02Ch]
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [dword edx+ControllerOptionRows]
        mov dword [byte esi+eax+03Eh], edx
        mov eax, dword [ControllerColumnArt]
        add eax, esi
        cmp dword [byte eax+01Ah], byte 0
        je short .16
        push dword [byte eax+02Ah]
        push dword [byte eax+026h]
        push dword [byte eax+01Ah]
        call DrawArt
        add esp, byte 0Ch
.16:
        mov eax, dword [ControllerColumnArt]
        movsx edx, word [byte ebp-060h]
        mov dword [byte esi+eax+04Ah], edx
        mov eax, dword [ControllerColumnArt]
        movsx edx, word [byte edi+ebp-068h]
        mov dword [byte esi+eax+04Eh], edx
        mov eax, dword [byte ebp-010h]
        movsx edx, word [byte ebp-05Ch]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [ControllerColumnArt]
        mov dword [byte esi+eax+052h], edx
        mov edx, dword [byte ebp-010h]
        movsx eax, word [byte edi+ebp-068h]
        movsx edx, word [byte edx+06h]
        add edx, eax
        mov eax, dword [ControllerColumnArt]
        mov dword [byte esi+eax+056h], edx
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .20
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        jne short .18
        cmp dword [byte ebp-048h], byte 2
        jl short .19
.17:
        mov eax, dword [ControllerColumnArt]
        mov word [byte esi+eax+018h], 2
        jmp short .20
.18:
        cmp dword [byte ebp-048h], byte 2
        jl short .17
.19:
        mov eax, dword [ControllerColumnArt]
        mov word [byte esi+eax+018h], 1
.20:
        inc dword [byte ebp-0Ch]
        add dword [byte ebp-028h], byte 2
        cmp dword [byte ebp-0Ch], byte 3
        jl near .13
        inc dword [byte ebp-04Ch]
        imul eax, dword [byte ebp-04Ch], byte 66h
        mov edx, dword [ControllerColumnArt]
        mov ebx, ControllerColumnInfo
        mov esi, dword [byte ebp-04Ch]
        mov dword [byte edx+eax+010h], 4
        shl esi, 6
        mov edx, dword [ControllerColumnArt]
        add ebx, esi
        mov dword [byte edx+eax+014h], ebx
        mov edx, dword [ControllerColumnArt]
        mov ebx, dword [dword esi+ControllerColumnInfo]
        mov dword [byte edx+eax+026h], ebx
        mov edx, dword [ControllerColumnArt]
        mov ebx, dword [dword esi+ControllerLayout]
        mov dword [byte edx+eax+02Ah], ebx
        mov ebx, dword [byte ebp-04Ch]
        mov edx, dword [ControllerColumnArt]
        mov ecx, dword [nosplit ebx*8+ControllerSlotPositions]
        mov dword [byte edx+eax+03Ah], ecx
        mov edx, dword [ControllerColumnArt]
        mov ebx, dword [nosplit ebx*8+ControllerOptionRows]
        mov dword [byte edx+eax+03Eh], ebx
        mov edx, dword [ControllerColumnArt]
        mov dword [byte edx+eax+032h], 0
        mov edx, dword [byte ebp-01Ch]
        movsx edx, word [dword edx+ControllerSlotDevice]
        cmp edx, byte 2
        jne near .24
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        jne short .22
        cmp edx, dword [byte ebp-048h]
        jle short .21
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je short .22
.21:
        cmp dword [byte ebp-048h], byte 1
        jle near .23
        cmp word [ControllerScreenMode], byte 0
        jne near .23
.22:
        push dword [FrontEndScreenBmp]
        call TextSetFont
        add esp, byte 4
        push str_Usri
        push dword [ControllerIconArt]
        call FindShape
        mov edx, eax
        imul eax, dword [byte ebp-04Ch], byte 66h
        mov dword [byte ebp-08h], eax
        mov eax, dword [ControllerColumnArt]
        add esp, byte 8
        add eax, dword [byte ebp-08h]
        push str_Usrh
        mov dword [byte eax+01Ah], edx
        push dword [ControllerIconArt]
        call FindShape
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        add eax, dword [byte ebp-08h]
        add esp, byte 8
        mov dword [byte eax+01Eh], edx
        push byte 20h
        movzx esi, byte [TextCharH]
        push dword [byte ebp-014h]
        inc esi
        call TextStringWidth
        imul eax, esi
        add esp, byte 4
        add eax, byte 10h
        push eax
        push str_Utext
        call AllocMemBlock
        mov edx, dword [byte ebp-018h]
        mov dword [dword edx+ControllerSlotItems], eax
        mov eax, dword [ControllerColumnArt]
        add eax, dword [byte ebp-08h]
        add esp, byte 0Ch
        mov edi, dword [dword edx+ControllerSlotItems]
        mov esi, dword [byte eax+01Ah]
        push dword [byte ebp-014h]
        movsd
        movsd
        movsd
        movsd
        movsb
        call TextStringWidth
        mov edx, eax
        mov eax, dword [byte ebp-018h]
        mov eax, dword [dword eax+ControllerSlotItems]
        mov word [byte eax+04h], dx
        mov eax, dword [byte ebp-018h]
        movzx dx, byte [TextCharH]
        mov esi, dword [byte ebp-04Ch]
        inc edx
        mov eax, dword [dword eax+ControllerSlotItems]
        shl esi, 6
        mov word [byte eax+06h], dx
        mov eax, dword [byte ebp-018h]
        mov dx, word [dword esi+ControllerSlotX]
        mov eax, dword [dword eax+ControllerSlotItems]
        sub edx, byte 4
        sub dx, word [byte eax+04h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp-018h]
        mov dx, word [dword esi+ControllerSlotY]
        mov eax, dword [dword eax+ControllerSlotItems]
        sub edx, byte 5
        add esp, byte 4
        mov word [byte eax+0Eh], dx
        mov eax, dword [byte ebp-018h]
        push dword [dword eax+ControllerSlotItems]
        call DrawShapeAtOwnPos
        mov eax, dword [byte ebp-014h]
        add esp, byte 4
        mov ebx, dword [dword esi+ControllerSlotY]
        mov edx, dword [dword esi+ControllerSlotX]
        sub ebx, byte 5
        sub edx, byte 4
        call DrawColorTextRight
        mov eax, dword [ControllerColumnArt]
        add eax, dword [byte ebp-08h]
        mov edx, 20h
        mov eax, dword [byte eax+01Ah]
        call CopyBitmap
        mov edx, dword [byte ebp-018h]
        mov dword [dword edx+ControllerSlotStates], eax
        mov eax, dword [ControllerColumnArt]
        add eax, dword [byte ebp-08h]
        mov edx, dword [dword edx+ControllerSlotStates]
        mov ax, word [byte eax+026h]
        mov word [byte edx+0Ch], ax
        mov edx, dword [ControllerColumnArt]
        mov eax, dword [byte ebp-018h]
        add edx, dword [byte ebp-08h]
        mov eax, dword [dword eax+ControllerSlotStates]
        mov dx, word [byte edx+02Ah]
        mov word [byte eax+0Eh], dx
        mov eax, dword [byte ebp-018h]
        push dword [dword eax+ControllerSlotStates]
        call DrawShapeAtOwnPos
        mov eax, dword [ControllerColumnArt]
        add esp, byte 4
        add eax, dword [byte ebp-08h]
        push dword [byte eax+02Ah]
        push dword [byte eax+026h]
        push dword [byte eax+01Ah]
        call DrawArt
        add esp, byte 0Ch
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
.23:
        imul edx, dword [byte ebp-04Ch], byte 66h
        mov eax, dword [ControllerColumnArt]
        mov word [byte edx+eax+018h], 0
        jmp short .25
.24:
        mov edx, dword [ControllerColumnArt]
        mov word [byte edx+eax+018h], 3
.25:
        add dword [byte ebp-020h], 1FEh
        add dword [byte ebp-01Ch], byte 8
        add dword [byte ebp-018h], byte 4
        inc dword [byte ebp-048h]
        add dword [byte ebp-014h], byte 21h
        cmp dword [byte ebp-048h], byte 4
        jl near .7
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        je near .32
        cmp dword [SaveFileHandle], byte 0FFFFFFFFh
        jne near .32
        cmp word [ControllerSlotDevice], byte 0
        je short .26
        cmp word [ControllerPadIcons], byte 0
        je short .26
        cmp word [ControllerPadIcons+8], byte 0
        je short .26
        cmp word [ControllerPadIcons+10h], byte 0
        jne short .27
.26:
        push str_P11
        push dword [ControllerIconArt]
        call FindShape
        add esp, byte 8
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        push str_P12
        mov dword [dword eax+0812h], edx
        push dword [ControllerIconArt]
        call FindShape
        add esp, byte 8
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        push str_P13
        mov dword [dword eax+0816h], edx
        push dword [ControllerIconArt]
        call FindShape
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        add esp, byte 8
        mov dword [dword eax+081Ah], edx
        jmp short .28
.27:
        push str_P1G
        push dword [ControllerIconArt]
        call FindShape
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        add esp, byte 8
        mov dword [dword eax+0812h], edx
.28:
        mov eax, dword [ControllerColumnArt]
        mov dword [dword eax+0808h], 8
        mov eax, dword [ControllerColumnArt]
        mov dword [dword eax+080Ch], ControllerButtonOutline
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [dword eax+0812h]
        movsx edx, word [byte edx+0Ch]
        mov dword [dword eax+081Eh], edx
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [dword eax+0812h]
        movsx edx, word [byte edx+0Eh]
        mov dword [dword eax+0822h], edx
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [ControllerTitlePos]
        mov dword [dword eax+0832h], edx
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [ControllerTitlePos+4]
        mov dword [dword eax+0836h], edx
        mov eax, dword [ControllerColumnArt]
        push dword [dword eax+0822h]
        push dword [dword eax+081Eh]
        push dword [dword eax+0812h]
        call DrawArt
        movsx eax, word [ControllerSlotDevice]
        add esp, byte 0Ch
        cmp eax, byte 2
        je short .29
        movsx eax, word [ControllerPadIcons]
        cmp eax, byte 2
        je short .29
        movsx eax, word [ControllerPadIcons+8]
        cmp eax, byte 2
        je short .29
        movsx eax, word [ControllerPadIcons+10h]
        cmp eax, byte 2
        jne short .30
.29:
        push str_P21
        push dword [ControllerIconArt]
        call FindShape
        add esp, byte 8
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        push str_P22
        mov dword [dword eax+0878h], edx
        push dword [ControllerIconArt]
        call FindShape
        add esp, byte 8
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        push str_P23
        mov dword [dword eax+087Ch], edx
        push dword [ControllerIconArt]
        call FindShape
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        add esp, byte 8
        mov dword [dword eax+0880h], edx
        jmp short .31
.30:
        push str_P2G
        push dword [ControllerIconArt]
        call FindShape
        mov edx, eax
        mov eax, dword [ControllerColumnArt]
        add esp, byte 8
        mov dword [dword eax+0878h], edx
.31:
        mov eax, dword [ControllerColumnArt]
        mov dword [dword eax+086Eh], 8
        mov eax, dword [ControllerColumnArt]
        mov dword [dword eax+0872h], ControllerTextIds
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [dword eax+0878h]
        movsx edx, word [byte edx+0Ch]
        mov dword [dword eax+0884h], edx
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [dword eax+0878h]
        movsx edx, word [byte edx+0Eh]
        mov dword [dword eax+0888h], edx
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [ControllerTitlePos+8]
        mov dword [dword eax+0898h], edx
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [ControllerTitlePos+0Ch]
        mov dword [dword eax+089Ch], edx
        mov eax, dword [ControllerColumnArt]
        push dword [dword eax+0888h]
        push dword [dword eax+0884h]
        push dword [dword eax+0878h]
        call DrawArt
        add esp, byte 0Ch
        jmp short .33
.32:
        mov eax, dword [ControllerColumnArt]
        mov word [dword eax+0810h], 3
        mov eax, dword [ControllerColumnArt]
        mov word [dword eax+0876h], 3
.33:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        or al, 6
        cwde
        call OpenScreen
        mov esi, dword [ControllerColumnArt]
        mov ecx, 66h
        lea edi, [dword esi+08C4h]
        mov esi, TeamStatsBitmap
        rep movsb
        mov esi, dword [ControllerColumnArt]
        mov ecx, 66h
        lea edi, [dword esi+092Ah]
        mov esi, BottomBarArt+56h
        rep movsb
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .34
        mov esi, dword [ControllerColumnArt]
        mov ecx, 66h
        lea edi, [dword esi+0990h]
        mov esi, MenuBoxStyle
        rep movsb
.34:
        mov edi, 4
        xor ebx, ebx
.35:
        lea eax, [ebx+ebx*4]
        inc eax
        mov dword [byte ebp-048h], eax
        mov dword [byte ebp-038h], edi
        mov ch, byte [byte ebp-048h]
        mov al, byte [byte ebp-048h]
        dec ch
        sub al, 5
        mov cl, byte [byte ebp-048h]
        mov byte [byte ebp-04h], al
        add cl, 5
        imul esi, dword [byte ebp-048h], byte 66h
        jmp short .41
.36:
        test ebx, ebx
        jle short .37
        mov eax, dword [ControllerColumnArt]
        mov dl, byte [byte ebp-04h]
        mov byte [byte esi+eax+042h], dl
.37:
        mov eax, dword [byte ebp-048h]
        mov dword [byte ebp-08h], 5
        cdq
        idiv dword [byte ebp-08h]
        cmp edx, byte 1
        je short .38
        mov eax, dword [ControllerColumnArt]
        mov byte [byte esi+eax+044h], ch
.38:
        mov eax, dword [byte ebp-048h]
        mov dword [byte ebp-08h], 5
        cdq
        idiv dword [byte ebp-08h]
        cmp edx, byte 3
        je short .39
        mov dl, byte [byte ebp-048h]
        mov eax, dword [ControllerColumnArt]
        inc dl
        mov byte [byte esi+eax+045h], dl
.39:
        cmp ebx, byte 4
        jge short .40
        mov eax, dword [ControllerColumnArt]
        mov byte [byte esi+eax+043h], cl
.40:
        inc byte [byte ebp-04h]
        inc dword [byte ebp-048h]
        inc ch
        add esi, byte 66h
        inc cl
.41:
        mov eax, dword [byte ebp-048h]
        cmp eax, dword [byte ebp-038h]
        jl short .36
        inc ebx
        add edi, byte 5
        cmp ebx, byte 4
        jl near .35
        mov eax, dword [ControllerColumnArt]
        mov byte [byte eax+045h], 1
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+01DCh], 3
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+0243h], 6
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+03DAh], 8
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+0441h], 0Bh
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+05D8h], 0Dh
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+05D9h], 17h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+063Fh], 10h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+063Dh], 16h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+07D6h], 0Dh
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+07D7h], 17h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+07D5h], 17h
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        je short .42
        cmp dword [SaveFileHandle], byte 0FFFFFFFFh
        jne short .42
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+06A3h], 14h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+083Ch], 16h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+083Dh], 15h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+083Ah], 10h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+076Fh], 15h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+08A2h], 14h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+08A3h], 17h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+08A0h], 12h
.42:
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+0908h], 16h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+0907h], 16h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+096Dh], 17h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+096Fh], 17h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+09D2h], 18h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+09D5h], 18h
        mov eax, dword [ControllerColumnArt]
        mov byte [dword eax+09D4h], 18h
        call SetControllerColumn
        call SetScreenTarget
        call GetInputDevices
        mov dword [ControllerBackBmp], eax
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [dword eax+0968h]
        mov eax, dword [dword eax+0964h]
        call SetMenuMouse
        mov dword [byte ebp-044h], 17h
        mov word [ControllerDragIcon], 0FFFFh
        mov word [ControllerDragSlot], 0FFFFh
        call MusicDone
        test eax, eax
        jne short .43
        call PlayMusic
.43:
        mov ebx, 3
        mov edx, dword [byte ebp-050h]
        xor eax, eax
        call FadePalette
        mov eax, 1
        call LinkSync
.44:
        call SoundIdle
        cmp dword [byte ebp-044h], byte 0
        jl short .46
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        cwde
        add eax, byte 18h
        cmp eax, dword [byte ebp-044h]
        jle short .46
        imul eax, dword [byte ebp-044h], byte 66h
        mov edx, dword [ControllerColumnArt]
        add eax, edx
        mov edx, dword [mousex]
        cmp edx, dword [byte eax+03Ah]
        jne short .45
        mov edx, dword [mousey]
        cmp edx, dword [byte eax+03Eh]
        je short .46
.45:
        mov dword [byte ebp-044h], 0FFFFFFFFh
.46:
        mov ax, word [SlotsTwoPlayer]
        xor ah, ah
        and al, 1
        mov edx, eax
        or dl, 2
        movsx edx, dx
        push edx
        mov ebx, 0FFFFFFFFh
        xor ecx, ecx
        push byte 16h
        lea edx, [byte ebp-044h]
        cwde
        push edx
        add eax, byte 18h
        mov edx, dword [ControllerColumnArt]
        call RunMenu
        mov esi, eax
        cmp dword [byte ebp-044h], byte 0
        jl near ControllerScreen_1503.68
        cmp dword [byte ebp-044h], byte 14h
        jge near ControllerScreen_1503.68
        mov eax, dword [byte ebp-044h]
        mov ebx, 5
        cdq
        idiv ebx
        mov dword [byte ebp-048h], eax
        mov eax, dword [byte ebp-044h]
        cdq
        idiv ebx
        cmp edx, byte 4
        ja near ControllerScreen_16D6.76
        mov ebx, dword [byte ebp-044h]
        inc ebx
        imul ebx, byte 66h
        mov ecx, dword [byte ebp-044h]
        mov eax, dword [byte ebp-048h]
        dec ecx
        shl eax, 3
        imul ecx, byte 66h
        jmp dword [nosplit cs:edx*4+ControllerScreenItemJumpTable]
ControllerScreen_11AB:
        cmp esi, byte 1
        jne near .60
        imul edx, dword [byte ebp-044h], byte 66h
        mov eax, dword [ControllerColumnArt]
        cmp dword [byte edx+eax+01Ah], byte 0
        je near ControllerScreen_16D6.76
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        jne short .48
        cmp dword [byte ebp-048h], byte 2
        jge short .47
        movsx eax, word [ControllerScreenMode]
        cmp eax, esi
        je short .48
.47:
        cmp dword [byte ebp-048h], byte 1
        jle near ControllerScreen_16D6.76
        cmp word [ControllerScreenMode], byte 0
        jne near ControllerScreen_16D6.76
.48:
        mov eax, 35h
        mov esi, dword [byte ebp-048h]
        call PlaySfx
        mov eax, dword [byte ebp-048h]
        shl esi, 2
        movsx eax, word [nosplit eax*8+ControllerSlotDevice]
        mov ecx, dword [dword esi+ControllerSlotStates]
        cmp eax, byte 2
        sete al
        mov edx, dword [byte ebp-048h]
        movzx ebx, al
        mov eax, dword [ControllerIconArt]
        call ControllerUsersPanel
        mov edx, 0FEh
        mov eax, 0FDh
        call SetTextColors
        push dword [FrontEndScreenBmp]
        call TextSetFont
        add esp, byte 4
        cmp dword [dword esi+ControllerSlotItems], byte 0
        je short .49
        push dword [dword esi+ControllerSlotItems]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [dword esi+ControllerSlotItems]
        call FreeMemBlock
        add esp, byte 4
.49:
        imul eax, dword [byte ebp-048h], byte 21h
        add eax, SlotUserNames
        push byte 20h
        inc eax
        inc eax
        movzx esi, byte [TextCharH]
        push eax
        inc esi
        mov dword [byte ebp-08h], eax
        call TextStringWidth
        imul eax, esi
        add esp, byte 4
        add eax, byte 10h
        push eax
        push str_Utext
        call AllocMemBlock
        mov edx, dword [byte ebp-048h]
        shl edx, 2
        mov dword [dword edx+ControllerSlotItems], eax
        mov eax, dword [byte ebp-044h]
        inc eax
        imul eax, byte 66h
        mov dword [byte ebp-034h], edx
        mov edi, dword [byte ebp-034h]
        mov edx, dword [ControllerColumnArt]
        add esp, byte 0Ch
        mov edi, dword [dword edi+ControllerSlotItems]
        mov esi, dword [byte edx+eax+01Ah]
        push dword [byte ebp-08h]
        movsd
        movsd
        movsd
        movsd
        movsb
        call TextStringWidth
        mov edx, eax
        mov eax, dword [byte ebp-034h]
        mov eax, dword [dword eax+ControllerSlotItems]
        mov word [byte eax+04h], dx
        mov eax, dword [byte ebp-034h]
        movzx dx, byte [TextCharH]
        mov eax, dword [dword eax+ControllerSlotItems]
        inc edx
        mov word [byte eax+06h], dx
        mov edx, dword [byte ebp-048h]
        lea eax, [edx+edx*4]
        add esp, byte 4
        shl eax, 6
        cmp word [nosplit edx*8+ControllerSlotDevice], byte 0
        jne short .50
        mov edx, dword [byte ebp-034h]
        mov bx, word [dword eax+ControllerLayout+54h]
        mov edx, dword [dword edx+ControllerSlotItems]
        add ebx, byte 6
        mov word [byte edx+0Ch], bx
        mov dx, word [dword eax+ControllerLayout+58h]
        jmp short .51
.50:
        mov ebx, dword [byte ebp-034h]
        mov dx, word [dword eax+ControllerLayout+0BCh]
        mov ebx, dword [dword ebx+ControllerSlotItems]
        sub edx, byte 4
        sub dx, word [byte ebx+04h]
        mov word [byte ebx+0Ch], dx
        mov dx, word [dword eax+ControllerLayout+0C0h]
.51:
        mov eax, dword [byte ebp-034h]
        mov eax, dword [dword eax+ControllerSlotItems]
        sub edx, byte 5
        mov word [byte eax+0Eh], dx
        mov eax, dword [byte ebp-048h]
        push dword [nosplit eax*4+ControllerSlotItems]
        call DrawShapeAtOwnPos
        mov edx, dword [byte ebp-048h]
        imul esi, edx, byte 21h
        add esp, byte 4
        lea eax, [edx+edx*4]
        add esi, SlotUserNames
        shl eax, 6
        inc esi
        inc esi
        cmp word [nosplit edx*8+ControllerSlotDevice], byte 0
        jne short .52
        mov ebx, dword [dword eax+ControllerLayout+58h]
        mov edx, dword [dword eax+ControllerLayout+54h]
        sub ebx, byte 5
        add edx, byte 6
        mov eax, esi
        call DrawColorText
        jmp short .53
.52:
        mov ebx, dword [dword eax+ControllerLayout+0C0h]
        mov edx, dword [dword eax+ControllerLayout+0BCh]
        sub ebx, byte 5
        sub edx, byte 4
        mov eax, esi
        call DrawColorTextRight
.53:
        push dword [MatchupLayer]
        call TextSetFont
        mov eax, dword [byte ebp-048h]
        add esp, byte 4
        lea edx, [eax+eax*4]
        cmp word [nosplit eax*8+ControllerSlotDevice], byte 0
        jne short .54
        mov eax, edx
        jmp short .55
.54:
        lea eax, [byte edx+04h]
.55:
        imul edx, eax, byte 66h
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [byte edx+eax+03Eh]
        mov eax, dword [byte ebp-048h]
        lea ebx, [eax+eax*4]
        cmp word [nosplit eax*8+ControllerSlotDevice], byte 0
        jne short .56
        mov eax, ebx
        jmp short .57
.56:
        lea eax, [byte ebx+04h]
.57:
        imul ebx, eax, byte 66h
        mov eax, dword [ControllerColumnArt]
        mov eax, dword [byte ebx+eax+03Ah]
        call SetMenuMouse
        mov eax, dword [byte ebp-048h]
        lea edx, [eax+eax*4]
        cmp word [nosplit eax*8+ControllerSlotDevice], byte 0
        jne short .58
        mov eax, edx
        jmp short .59
.58:
        lea eax, [byte edx+04h]
.59:
        mov dword [byte ebp-044h], eax
        xor eax, eax
        call LinkSync
        jmp near ControllerScreen_16D6.76
.60:
        cmp dword [byte ebp-048h], byte 2
        jge short .61
        movsx eax, word [ControllerScreenMode]
        cmp eax, byte 1
        je near ControllerScreen_16D6.76
.61:
        cmp dword [byte ebp-048h], byte 1
        jle short .62
        cmp word [ControllerScreenMode], byte 0
        je near ControllerScreen_16D6.76
.62:
        mov eax, 28h
        call GetLangText
        call LinkSyncWithMessage
        jmp near ControllerScreen_16D6.76
ControllerScreen_149D:
        movsx eax, word [dword eax+ControllerSlotDevice]
        mov word [ControllerColumnsDrawn], 0
        cmp eax, byte 1
        jne short .64
.63:
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [byte ebp-044h]
        add eax, ebx
        jmp short .66
.64:
        mov eax, dword [byte ebp-044h]
        inc eax
        inc eax
.65:
        imul eax, byte 66h
        mov edx, dword [ControllerColumnArt]
        add eax, edx
        mov edx, dword [byte ebp-044h]
.66:
        call DrawControllerColumns
        mov word [ControllerColumnsDrawn], 1
        jmp near ControllerScreen_16D6.76
ControllerScreen_14E4:
        mov word [ControllerColumnsDrawn], 0
        cmp word [dword eax+ControllerSlotDevice], byte 0
        jne short ControllerScreen_149D.63
.67:
        mov eax, dword [ControllerColumnArt]
        mov edx, dword [byte ebp-044h]
        add eax, ecx
        jmp short ControllerScreen_149D.66
ControllerScreen_1503:
        mov word [ControllerColumnsDrawn], 0
        cmp word [dword eax+ControllerSlotDevice], byte 0
        jne short ControllerScreen_14E4.67
        mov eax, dword [byte ebp-044h]
        dec eax
        dec eax
        jmp short ControllerScreen_149D.65
.68:
        mov edx, dword [byte ebp-044h]
        sub edx, byte 14h
        cmp edx, byte 4
        ja near ControllerScreen_16D6.76
        mov ebx, dword [RosterFileHandle]
        mov eax, dword [optflags]
        add ebx, 2710h
        and eax, byte 70h
        jmp dword [nosplit cs:edx*4+ControllerScreenModeJumpTable]
ControllerScreen_1548:
        cmp eax, byte 30h
        je near ControllerScreen_16D6.76
        cmp dword [SaveFileHandle], byte 0FFFFFFFFh
        jne near ControllerScreen_16D6.76
        mov edx, dword [ControllerColumnArt]
        cmp dword [dword edx+0816h], byte 0
        je near ControllerScreen_16D6.76
        mov edx, dword [gameopts]
        mov dword [LinesEditAway], 0
        mov edx, dword [byte edx+01h]
        shl edx, 0Fh
        shr edx, 1Bh
        mov dword [LinesEditTeam], edx
        test byte [optflags], 70h
        jne short .69
        mov dword [LinesEditMode], 0
        jmp short .71
.69:
        cmp eax, byte 20h
        jne short .70
        cmp dword [PlayoffsActive], byte 0
        jne short .70
        mov dword [LinesEditMode], ebx
        jmp short .71
.70:
        mov eax, dword [PlayoffTreeData]
        mov dword [LinesEditMode], eax
.71:
        mov dword [byte ebp-040h], 0Fh
        jmp near ControllerScreen_16D6.76
ControllerScreen_15D1:
        cmp eax, byte 30h
        je near ControllerScreen_16D6.76
        cmp dword [SaveFileHandle], byte 0FFFFFFFFh
        jne near ControllerScreen_16D6.76
        mov edx, dword [ControllerColumnArt]
        cmp dword [dword edx+087Ch], byte 0
        je near ControllerScreen_16D6.76
        mov edx, dword [gameopts]
        mov dword [LinesEditAway], 1
        mov edx, dword [byte edx+01h]
        shl edx, 0Ah
        shr edx, 1Bh
        mov dword [LinesEditTeam], edx
        test byte [optflags], 70h
        jne short .72
        mov dword [LinesEditMode], 0
        jmp short .74
.72:
        cmp eax, byte 20h
        jne short .73
        cmp dword [PlayoffsActive], byte 0
        jne short .73
        mov dword [LinesEditMode], ebx
        jmp short .74
.73:
        mov eax, dword [PlayoffTreeData]
        mov dword [LinesEditMode], eax
.74:
        xor edx, edx
        xor ebx, ebx
        xor eax, eax
.75:
        mov esi, dword [gameopts]
        inc ebx
        inc ebx
        mov cx, word [dword eax+ControllerSlotTeam]
        mov word [byte esi+ebx+07h], cx
        inc edx
        mov esi, dword [gameopts]
        cmp word [dword eax+ControllerSlotDevice], byte 0
        sete cl
        add eax, byte 8
        mov byte [byte edx+esi+04h], cl
        cmp edx, byte 4
        jl short .75
        jmp near ControllerScreen_1548.71
ControllerScreen_168B:
        movsx eax, word [ControllerDragIcon]
        cmp eax, byte 0FFFFFFFFh
        jne short ControllerScreen_16D6.76
        movsx eax, word [ControllerDragSlot]
        cmp eax, byte 0FFFFFFFFh
        jne short ControllerScreen_16D6.76
        call SlideInSideBar
        mov eax, dword [byte ebp-06Ch]
        mov dword [byte ebp-040h], eax
        jmp short ControllerScreen_16D6.76
ControllerScreen_16B0:
        movsx eax, word [ControllerDragIcon]
        cmp eax, byte 0FFFFFFFFh
        jne short ControllerScreen_16D6.76
        movsx eax, word [ControllerDragSlot]
        cmp eax, byte 0FFFFFFFFh
        jne short ControllerScreen_16D6.76
        call SlideInTitleBar
        mov dword [byte ebp-040h], 8
        jmp short ControllerScreen_16D6.76
ControllerScreen_16D6:
        cmp eax, byte 30h
        jne short .76
        call SlideInBottomBar
        push dword 0FEh
        mov ecx, 0FCh
        mov ebx, 0FAh
        mov edx, 0F7h
        mov eax, 1
        call ModemChat
.76:
        cmp dword [byte ebp-040h], byte 0
        jl near ControllerScreen.44
        xor esi, esi
        xor edi, edi
.77:
        cmp dword [dword esi+ControllerSlotStates], byte 0
        je short .78
        push dword [dword esi+ControllerSlotStates]
        call FreeMemBlock
        add esp, byte 4
        mov dword [dword esi+ControllerSlotStates], 0
.78:
        cmp dword [dword esi+ControllerSlotItems], byte 0
        je short .79
        push dword [dword esi+ControllerSlotItems]
        call FreeMemBlock
        add esp, byte 4
        mov dword [dword esi+ControllerSlotItems], 0
.79:
        cmp dword [dword edi+ControllerSlotIcon], byte 0
        je short .80
        push dword [dword edi+ControllerSlotIcon]
        call FreeMemBlock
        add esp, byte 4
        mov dword [dword edi+ControllerSlotIcon], 0
.80:
        add esi, byte 4
        add edi, byte 8
        cmp esi, byte 10h
        jne short .77
        push dword [ControllerIconArt]
        call FreeMemBlock
        add esp, byte 4
        push dword [ControllerColumnArt]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 3
        call FadeOut
        mov eax, dword [byte ebp-040h]
        cmp eax, dword [byte ebp-06Ch]
        je short .82
        xor edx, edx
        xor esi, esi
        xor eax, eax
.81:
        mov ebx, dword [gameopts]
        inc esi
        inc esi
        mov cx, word [dword eax+ControllerSlotTeam]
        mov word [byte esi+ebx+07h], cx
        inc edx
        mov ebx, dword [gameopts]
        cmp word [dword eax+ControllerSlotDevice], byte 0
        sete cl
        add eax, byte 8
        mov byte [byte edx+ebx+04h], cl
        cmp edx, byte 4
        jl short .81
.82:
        mov eax, dword [byte ebp-040h]
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RunControllerScreen                          70840  96 PC, medium confidence
; (from): runs ControllerScreen until it leaves (3 again), then the next step
; (0Fh, 15h, PreGameScreens)
;-----------------------------------------------------------------------------
RunControllerScreen:
        push ebx
        push ecx
        push edx
        mov ebx, eax
        mov word [ControllerPreGame], 1
.1:
        mov eax, ebx
        call ControllerScreen
        mov edx, eax
        cmp eax, ebx
        je short .5
        cmp eax, byte 0Fh
        jne short .2
        mov eax, 1
        call RunEditLines
        mov eax, 3
        jmp short .5
.2:
        mov ecx, dword [gameopts]
        test byte [byte ecx+02h], 8
        jne short .3
        cmp dword [SaveFileHandle], byte 0FFFFFFFFh
        je short .4
.3:
        mov eax, 15h
        jmp short .5
.4:
        cmp eax, byte 15h
        je short .5
        call PreGameScreens
.5:
        cmp eax, byte 3
        je short .1
        mov word [ControllerPreGame], 0
        pop edx
        pop ecx
        pop ebx
        ret
ControlPicksSlotPoints:                         ; used by ControlPicksScreen
        db 0FAh,01h,00h,00h,069h,00h,00h,00h,0F3h,01h,00h,00h,088h,00h,00h,00h
        db 0EAh,01h,00h,00h,0A9h,00h,00h,00h,0E2h,01h,00h,00h,0C7h,00h,00h,00h
        db 0D9h,01h,00h,00h,0E7h,00h,00h,00h,0CEh,01h,00h,00h,09h,01h,00h,00h
        db 0C5h,01h,00h,00h,027h,01h,00h,00h,0BCh,01h,00h,00h,049h,01h,00h,00h
        db 0AEh,01h,00h,00h,066h,01h,00h,00h,0C9h,01h,00h,00h,086h,01h,00h,00h
        db 0C9h,01h,00h,00h,0A6h,01h,00h,00h
ControlPicksHotspots:                           ; used by ControlPicksScreen
        db 0D9h,01h,00h,00h,05Ch,00h,00h,00h,09h,02h,00h,00h,05Ch,00h,00h,00h
        db 04h,02h,00h,00h,06Fh,00h,00h,00h,0D4h,01h,00h,00h,06Fh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0D1h,01h,00h,00h,07Bh,00h,00h,00h,00h,02h,00h,00h,07Bh,00h,00h,00h
        db 0FBh,01h,00h,00h,08Dh,00h,00h,00h,0CBh,01h,00h,00h,08Dh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0C7h,01h,00h,00h,09Bh,00h,00h,00h,0F6h,01h,00h,00h,09Bh,00h,00h,00h
        db 0F2h,01h,00h,00h,0ADh,00h,00h,00h,0C2h,01h,00h,00h,0ADh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0BFh,01h,00h,00h,0BBh,00h,00h,00h,0EEh,01h,00h,00h,0BBh,00h,00h,00h
        db 0E8h,01h,00h,00h,0CDh,00h,00h,00h,0B9h,01h,00h,00h,0CDh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0B6h,01h,00h,00h,0DBh,00h,00h,00h,0E5h,01h,00h,00h,0DBh,00h,00h,00h
        db 0E0h,01h,00h,00h,0EDh,00h,00h,00h,0B0h,01h,00h,00h,0EDh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0ADh,01h,00h,00h,0FCh,00h,00h,00h,0DBh,01h,00h,00h,0FCh,00h,00h,00h
        db 0D7h,01h,00h,00h,0Eh,01h,00h,00h,0A7h,01h,00h,00h,0Eh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0A4h,01h,00h,00h,01Bh,01h,00h,00h,0D2h,01h,00h,00h,01Bh,01h,00h,00h
        db 0CEh,01h,00h,00h,02Dh,01h,00h,00h,09Eh,01h,00h,00h,02Dh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 09Bh,01h,00h,00h,03Ch,01h,00h,00h,0C9h,01h,00h,00h,03Ch,01h,00h,00h
        db 0C5h,01h,00h,00h,04Eh,01h,00h,00h,096h,01h,00h,00h,04Eh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 092h,01h,00h,00h,05Ch,01h,00h,00h,0C0h,01h,00h,00h,05Ch,01h,00h,00h
        db 0BCh,01h,00h,00h,06Eh,01h,00h,00h,08Dh,01h,00h,00h,06Eh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 088h,01h,00h,00h,07Ch,01h,00h,00h,03Ah,02h,00h,00h,07Ch,01h,00h,00h
        db 035h,02h,00h,00h,08Eh,01h,00h,00h,083h,01h,00h,00h,08Eh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 07Fh,01h,00h,00h,09Dh,01h,00h,00h,0FFh,01h,00h,00h,09Dh,01h,00h,00h
        db 0FBh,01h,00h,00h,0AFh,01h,00h,00h,079h,01h,00h,00h,0AFh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
ControlSetupRowY:                               ; used by ControlSetupScreen
        db 081h,00h,06Dh,00h,05Bh,00h,04Ah,00h,038h,00h
ControlSetupColumnX:                            ; used by ControlSetupScreen
        db 089h,00h,0C9h,00h,09h,01h,04Ah,01h,08Ch,01h
;-----------------------------------------------------------------------------
; ControlSetupPoints                              70BD5  96 PC, low confidence
; Control setup screen points
;-----------------------------------------------------------------------------
ControlSetupPoints:                             ; control setup screen points; used by ControlSetupScreen
        db 06Eh,00h,00h,00h,086h,00h,00h,00h,0Ah,01h,00h,00h,085h,00h,00h,00h
        db 034h,01h,00h,00h,06Bh,00h,00h,00h,059h,00h,00h,00h,0C6h,00h,00h,00h
        db 0F5h,00h,00h,00h,0C5h,00h,00h,00h,022h,01h,00h,00h,0ABh,00h,00h,00h
        db 048h,00h,00h,00h,06h,01h,00h,00h,0E4h,00h,00h,00h,05h,01h,00h,00h
        db 010h,01h,00h,00h,0EBh,00h,00h,00h,037h,00h,00h,00h,047h,01h,00h,00h
        db 0D3h,00h,00h,00h,046h,01h,00h,00h,0FEh,00h,00h,00h,02Ah,01h,00h,00h
        db 025h,00h,00h,00h,089h,01h,00h,00h,0C1h,00h,00h,00h,088h,01h,00h,00h
        db 0ECh,00h,00h,00h,06Bh,01h,00h,00h
str_R:                                          ; string "r"; used by ControlSetupScreen
        db 072h,00h,00h,00h,088h,00h,00h,00h,0Eh,01h,00h,00h,088h,00h,00h,00h
        db 059h,01h,00h,00h,082h,00h,00h,00h,05Eh,00h,00h,00h,0C8h,00h,00h,00h
        db 0FAh,00h,00h,00h,0C8h,00h,00h,00h,047h,01h,00h,00h,0C2h,00h,00h,00h
        db 04Bh,00h,00h,00h,08h,01h,00h,00h,0E8h,00h,00h,00h,08h,01h,00h,00h
        db 032h,01h,00h,00h,02h,01h,00h,00h,03Ah,00h,00h,00h,049h,01h,00h,00h
        db 0D7h,00h,00h,00h,049h,01h,00h,00h,020h,01h,00h,00h,03Fh,01h,00h,00h
        db 028h,00h,00h,00h,08Bh,01h,00h,00h,0C5h,00h,00h,00h,08Bh,01h,00h,00h
        db 0Ah,01h,00h,00h,083h,01h,00h,00h,06Bh,02h,00h,00h,08Dh,00h,00h,00h
        db 06Bh,02h,00h,00h,0DEh,00h,00h,00h,06Bh,02h,00h,00h,030h,01h,00h,00h
        db 06Bh,02h,00h,00h,082h,01h,00h,00h,0A3h,01h,00h,00h,0B3h,01h,00h,00h
str_F:                                          ; string "f"; used by ControlSetupScreen
        db 066h,00h,00h,00h,086h,00h,00h,00h,06Ch,00h,00h,00h,083h,00h,00h,00h
        db 07Ah,00h,00h,00h,083h,00h,00h,00h,07Ah,00h,00h,00h,08Dh,00h,00h,00h
        db 06Ah,00h,00h,00h,08Dh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,01h,00h,00h,082h,00h,00h,00h,012h,01h,00h,00h,082h,00h,00h,00h
        db 019h,01h,00h,00h,088h,00h,00h,00h,012h,01h,00h,00h,08Dh,00h,00h,00h
        db 03h,01h,00h,00h,08Dh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 040h,01h,00h,00h,06Bh,00h,00h,00h,06Bh,01h,00h,00h,06Bh,00h,00h,00h
        db 060h,01h,00h,00h,08Ah,00h,00h,00h,034h,01h,00h,00h,08Ah,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 051h,00h,00h,00h,0C8h,00h,00h,00h,057h,00h,00h,00h,0C2h,00h,00h,00h
        db 065h,00h,00h,00h,0C2h,00h,00h,00h,065h,00h,00h,00h,0CEh,00h,00h,00h
        db 057h,00h,00h,00h,0CEh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0EEh,00h,00h,00h,0C2h,00h,00h,00h,0FDh,00h,00h,00h,0C2h,00h,00h,00h
        db 05h,01h,00h,00h,0C7h,00h,00h,00h,0FDh,00h,00h,00h,0CEh,00h,00h,00h
        db 0EEh,00h,00h,00h,0CEh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02Eh,01h,00h,00h,0ABh,00h,00h,00h,059h,01h,00h,00h,0ABh,00h,00h,00h
        db 04Fh,01h,00h,00h,0CBh,00h,00h,00h,022h,01h,00h,00h,0CBh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 040h,00h,00h,00h,07h,01h,00h,00h,046h,00h,00h,00h,02h,01h,00h,00h
        db 054h,00h,00h,00h,02h,01h,00h,00h,054h,00h,00h,00h,0Dh,01h,00h,00h
        db 045h,00h,00h,00h,0Dh,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0DDh,00h,00h,00h,02h,01h,00h,00h,0ECh,00h,00h,00h,02h,01h,00h,00h
        db 0F3h,00h,00h,00h,07h,01h,00h,00h,0ECh,00h,00h,00h,0Dh,01h,00h,00h
        db 0DDh,00h,00h,00h,0Dh,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Ch,01h,00h,00h,0EBh,00h,00h,00h,047h,01h,00h,00h,0EBh,00h,00h,00h
        db 03Ch,01h,00h,00h,0Ah,01h,00h,00h,010h,01h,00h,00h,0Ah,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 02Fh,00h,00h,00h,048h,01h,00h,00h,035h,00h,00h,00h,043h,01h,00h,00h
        db 044h,00h,00h,00h,043h,01h,00h,00h,044h,00h,00h,00h,04Fh,01h,00h,00h
        db 035h,00h,00h,00h,04Eh,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0CCh,00h,00h,00h,043h,01h,00h,00h,0DBh,00h,00h,00h,043h,01h,00h,00h
        db 0E2h,00h,00h,00h,048h,01h,00h,00h,0DCh,00h,00h,00h,04Fh,01h,00h,00h
        db 0CCh,00h,00h,00h,04Fh,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Ah,01h,00h,00h,02Ah,01h,00h,00h,035h,01h,00h,00h,02Ah,01h,00h,00h
        db 02Bh,01h,00h,00h,049h,01h,00h,00h,0FEh,00h,00h,00h,049h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01Dh,00h,00h,00h,08Bh,01h,00h,00h,024h,00h,00h,00h,086h,01h,00h,00h
        db 032h,00h,00h,00h,086h,01h,00h,00h,032h,00h,00h,00h,090h,01h,00h,00h
        db 023h,00h,00h,00h,090h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0BAh,00h,00h,00h,085h,01h,00h,00h,0CAh,00h,00h,00h,085h,01h,00h,00h
        db 0D1h,00h,00h,00h,08Bh,01h,00h,00h,0CBh,00h,00h,00h,090h,01h,00h,00h
        db 0BAh,00h,00h,00h,090h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0F8h,00h,00h,00h,06Bh,01h,00h,00h,023h,01h,00h,00h,06Bh,01h,00h,00h
        db 019h,01h,00h,00h,08Ah,01h,00h,00h,0ECh,00h,00h,00h,08Ah,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 027h,02h,00h,00h,09Dh,00h,00h,00h,03Dh,02h,00h,00h,060h,00h,00h,00h
        db 07Fh,02h,00h,00h,060h,00h,00h,00h,07Fh,02h,00h,00h,09Dh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 027h,02h,00h,00h,0ECh,00h,00h,00h,03Dh,02h,00h,00h,0B0h,00h,00h,00h
        db 07Fh,02h,00h,00h,0B0h,00h,00h,00h,07Fh,02h,00h,00h,0ECh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 027h,02h,00h,00h,040h,01h,00h,00h,03Eh,02h,00h,00h,03h,01h,00h,00h
        db 07Fh,02h,00h,00h,03h,01h,00h,00h,07Fh,02h,00h,00h,040h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 027h,02h,00h,00h,091h,01h,00h,00h,03Dh,02h,00h,00h,054h,01h,00h,00h
        db 07Fh,02h,00h,00h,054h,01h,00h,00h,07Fh,02h,00h,00h,091h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 054h,01h,00h,00h,0ACh,01h,00h,00h,05Fh,01h,00h,00h,0A6h,01h,00h,00h
        db 0CFh,01h,00h,00h,0A6h,01h,00h,00h,0DBh,01h,00h,00h,0ADh,01h,00h,00h
        db 0DBh,01h,00h,00h,0B7h,01h,00h,00h,0CEh,01h,00h,00h,0BCh,01h,00h,00h
        db 05Fh,01h,00h,00h,0BCh,01h,00h,00h,054h,01h,00h,00h,0B6h,01h,00h,00h
