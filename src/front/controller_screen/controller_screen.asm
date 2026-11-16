; The controller screen before a game: which controller plays for which team, with the users' names (96 PC).
bits 32
%include "hockey.inc"
section s_6CF0D progbits alloc exec nowrite align=1
extern BlackPalette, byte_11FA2F, ClearSlotUser, CopyBitmap, DrawColorText, DrawColorTextRight, DrawFrameAt, dword_1150D8
extern dword_11D910, dword_11D914, dword_11D930, dword_11D940, dword_11D954, dword_11DED0, dword_11DED4, dword_11DF70
extern dword_11DF74, dword_11DF78, dword_11DF7C, dword_11F5C0, dword_11F5C4, dword_17BC74, dword_17BC78, dword_17BC7C
extern dword_17BCE2, dword_17BD48, dword_17CBE7, dword_17D162, dword_17D267, dword_17D564, dword_17D56C, dword_17D574
extern dword_17D57C, dword_17D580, dword_17D584, dword_17D588, dword_1843AC, dword_1843B0, dword_1843B4, FadeOut
extern FadePalette, FillMusicStream, fputchar, gameopts, GetInputDevices, GetLangText, GetTeamNameArt, GetTicks
extern InitMenuItems, LinkSync, LinkSyncWithMessage, LoadPackedFile, LoadTeamLogo, ModemChat, mousex, mousey
extern MusicDone, OpenScreen, optflags, PickUsersScreen, PlayMusic, PlaySfx, PreGameScreens, PutBlock
extern RunEditLines, RunMenu, SetDrawBitmap, SetMenuMouse, SetScreenColors, SetTextColors, SlideInBottomBar, SlideInSideBar
extern SlideInTitleBar, SoundIdle, SoundSecondsToBytes, sprintf_, str_Bkgd6, str_dbgO, str_feO, str_Jy1D
extern str_Jy2D, str_Jy3D, str_Jy4D, str_Key1, str_KeyD2, str_Log7, str_Logx, str_MCONTROL
extern str_MdmD, str_MseD2, str_P11, str_P12, str_P13, str_P1G, str_P21, str_P22
extern str_P23, str_P2G, str_Pal12, str_PlyD, str_Usrh, str_Usri, str_Utext, sub_AA7E0
extern sub_AA988, sub_AAA40, sub_AADA4, sub_AB758, sub_ABF4C, sub_AD35C, sub_ADA50, sub_ADBEC
extern sub_B2C54, sub_DD6C4, sub_E04E0, TextSetFont, unk_11DE50, unk_11DE90, unk_152C44, word_114CE0
extern word_114CE4, word_11D92C, word_11D92E, word_11D96C, word_11D9A8, word_11D9AC, word_11DA10, word_11DA14
extern word_160ACC, word_17D560, word_17D562, word_17D568, word_17D570, word_17D578, word_17D58C, word_17D58E
global sub_6CF0D, sub_6CF0D_6, ControllerUsersPanel, unk_6D31C, jpt_6D32C, sub_6D350, sub_6D350_2C, sub_6D350_F2
global sub_6D350_199, sub_6D350_240, sub_6D350_2E7, sub_6D350_38E, sub_6D350_435, sub_6D350_4D0, ScanControllers, unk_6DB28
global jpt_6DB38, sub_6DB5C, sub_6DB5C_51, sub_6DB5C_5D, sub_6DB5C_69, sub_6DB5C_75, sub_6DB5C_81, sub_6DB5C_8D
global sub_6DB5C_99, sub_6DB5C_A5, sub_6DB5C_CB, sub_6DC2F, SetControllerColumn, SetControllerIcon, SetControllerIcon_F9, DrawControllerColumns
global jpt_6F02E, jpt_6F042, ControllerScreen, ControllerScreen_11AB, ControllerScreen_149D, ControllerScreen_14E4, ControllerScreen_1503, ControllerScreen_1548
global ControllerScreen_15D1, ControllerScreen_168B, ControllerScreen_16B0, ControllerScreen_16D6, RunControllerScreen, unk_708A9, unk_70901, unk_70BC1
global unk_70BCB, unk_70BD5, unk_70C4D, unk_70CED
;-----------------------------------------------------------------------------
; sub_6CF0D                                                       6CF0D  96 PC
;-----------------------------------------------------------------------------
sub_6CF0D:
        jge short .1
.1:
        sbb eax, dword [ecx]
        db 0B8h
        db 01h
sub_6CF0D_6:
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
        push dword [dword_11F5C4]
        push dword [dword_11F5C0]
        lea edi, [byte eax+03h]
        call sub_AD35C
        add esp, byte 0Ch
        push byte 0
        push byte 0
        mov esi, eax
        push dword [byte eax+02Ch]
        mov dword [byte ebp-030h], eax
        call sub_AA7E0
        add esp, byte 0Ch
        push esi
        call SetDrawBitmap
        add esp, byte 4
        push dword [byte ebp-060h]
        call sub_AADA4
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
        call sub_E04E0
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
        call sub_E04E0
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
        call sub_ADBEC
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
        call sub_AD35C
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
        call sub_AAA40
        add esp, byte 0Ch
        call sub_DD6C4
        push dword [byte edi+02Ch]
        call sub_B2C54
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
        call sub_E04E0
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
        call sub_ADBEC
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
        call sub_AD35C
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
        call sub_AAA40
        add esp, byte 0Ch
        call sub_DD6C4
        push dword [byte edi+02Ch]
        call sub_B2C54
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
        call sub_ADBEC
        add esp, byte 4
        push dword [byte ebp-030h]
        call sub_ADBEC
        add esp, byte 4
        leave
        pop edi
        pop esi
        ret
unk_6D31C:
        db 0FFh,03h,03Fh,00h,01Fh,00h,0Fh,00h,07h,00h,03h,00h,01h,00h,00h,00h
jpt_6D32C:
        dd sub_6D350_4D0
        dd sub_6D350_2C
        dd sub_6D350_F2
        dd sub_6D350_199
        dd sub_6D350_240
        dd sub_6D350_2E7
        dd sub_6D350_38E
        dd sub_6D350_435
        dd sub_6D350_4D0
;-----------------------------------------------------------------------------
; sub_6D350                                                       6D350  96 PC
;-----------------------------------------------------------------------------
sub_6D350:
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        mov dword [byte ebp-04h], ecx
        dec eax
        cmp eax, 3FFh
        ja near sub_6D350_4D0
        mov ecx, 9
        mov edi, unk_6D31C
        repne scasw
        jmp dword [nosplit cs:ecx*4+jpt_6D32C]
sub_6D350_2C:
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
        jmp near sub_6D350_4D0
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
        jmp near sub_6D350_4D0
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
        jmp near sub_6D350_4D0
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
        jmp near sub_6D350_4D0
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
        jmp near sub_6D350_4D0
.10:
        cmp edx, byte 40h
        je near sub_6D350_4D0
        cmp ebx, byte 40h
        je near sub_6D350_4D0
        cmp dword [byte ebp-04h], byte 40h
        je near sub_6D350_4D0
.11:
        mov esi, 40h
        jmp near sub_6D350_4D0
sub_6D350_F2:
        test byte [byte ebp+010h], 2
        je short .12
        cmp edx, byte 4
        je short .12
        cmp ebx, byte 4
        je short .12
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
.12:
        test byte [byte ebp+010h], 4
        je short .13
        cmp edx, byte 8
        je short .13
        cmp ebx, byte 8
        je short .13
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
.13:
        test byte [byte ebp+010h], 8
        je short .14
        cmp edx, byte 10h
        je short .14
        cmp ebx, byte 10h
        je short .14
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
.14:
        test byte [byte ebp+010h], 10h
        je short .15
        cmp edx, byte 20h
        je short .15
        cmp ebx, byte 20h
        je short .15
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
.15:
        cmp edx, byte 40h
        je short .16
        cmp ebx, byte 40h
        je short .16
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.16:
        test byte [byte ebp+010h], 1
        je near sub_6D350_435.42
        cmp edx, byte 2
        je near sub_6D350_435.42
        cmp ebx, byte 2
        je near sub_6D350_435.42
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
        jmp near sub_6D350_435.42
sub_6D350_199:
        test byte [byte ebp+010h], 4
        je short .17
        cmp edx, byte 8
        je short .17
        cmp ebx, byte 8
        je short .17
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
.17:
        test byte [byte ebp+010h], 8
        je short .18
        cmp edx, byte 10h
        je short .18
        cmp ebx, byte 10h
        je short .18
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
.18:
        test byte [byte ebp+010h], 10h
        je short .19
        cmp edx, byte 20h
        je short .19
        cmp ebx, byte 20h
        je short .19
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
.19:
        cmp edx, byte 40h
        je short .20
        cmp ebx, byte 40h
        je short .20
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.20:
        test byte [byte ebp+010h], 1
        je short .21
        cmp edx, byte 2
        je short .21
        cmp ebx, byte 2
        je short .21
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
.21:
        test byte [byte ebp+010h], 2
        je near sub_6D350_435.42
        cmp edx, byte 4
        je near sub_6D350_435.42
        cmp ebx, byte 4
        je near sub_6D350_435.42
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
        jmp near sub_6D350_435.42
sub_6D350_240:
        test byte [byte ebp+010h], 8
        je short .22
        cmp edx, byte 10h
        je short .22
        cmp ebx, byte 10h
        je short .22
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
.22:
        test byte [byte ebp+010h], 10h
        je short .23
        cmp edx, byte 20h
        je short .23
        cmp ebx, byte 20h
        je short .23
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
.23:
        cmp edx, byte 40h
        je short .24
        cmp ebx, byte 40h
        je short .24
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.24:
        test byte [byte ebp+010h], 1
        je short .25
        cmp edx, byte 2
        je short .25
        cmp ebx, byte 2
        je short .25
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
.25:
        test byte [byte ebp+010h], 2
        je short .26
        cmp edx, byte 4
        je short .26
        cmp ebx, byte 4
        je short .26
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
.26:
        test byte [byte ebp+010h], 4
        je near sub_6D350_435.42
        cmp edx, byte 8
        je near sub_6D350_435.42
        cmp ebx, byte 8
        je near sub_6D350_435.42
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
        jmp near sub_6D350_435.42
sub_6D350_2E7:
        test byte [byte ebp+010h], 10h
        je short .27
        cmp edx, byte 20h
        je short .27
        cmp ebx, byte 20h
        je short .27
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
.27:
        cmp edx, byte 40h
        je short .28
        cmp ebx, byte 40h
        je short .28
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.28:
        test byte [byte ebp+010h], 1
        je short .29
        cmp edx, byte 2
        je short .29
        cmp ebx, byte 2
        je short .29
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
.29:
        test byte [byte ebp+010h], 2
        je short .30
        cmp edx, byte 4
        je short .30
        cmp ebx, byte 4
        je short .30
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
.30:
        test byte [byte ebp+010h], 4
        je short .31
        cmp edx, byte 8
        je short .31
        cmp ebx, byte 8
        je short .31
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
.31:
        test byte [byte ebp+010h], 8
        je near sub_6D350_435.42
        cmp edx, byte 10h
        je near sub_6D350_435.42
        cmp ebx, byte 10h
        je near sub_6D350_435.42
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
        jmp near sub_6D350_435.42
sub_6D350_38E:
        cmp edx, byte 40h
        je short .32
        cmp ebx, byte 40h
        je short .32
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.32:
        test byte [byte ebp+010h], 1
        je short .33
        cmp edx, byte 2
        je short .33
        cmp ebx, byte 2
        je short .33
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
.33:
        test byte [byte ebp+010h], 2
        je short .34
        cmp edx, byte 4
        je short .34
        cmp ebx, byte 4
        je short .34
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
.34:
        test byte [byte ebp+010h], 4
        je short .35
        cmp edx, byte 8
        je short .35
        cmp ebx, byte 8
        je short .35
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
.35:
        test byte [byte ebp+010h], 8
        je short .36
        cmp edx, byte 10h
        je short .36
        cmp ebx, byte 10h
        je short .36
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
.36:
        test byte [byte ebp+010h], 10h
        je near sub_6D350_435.42
        cmp edx, byte 20h
        je near sub_6D350_435.42
        cmp ebx, byte 20h
        je near sub_6D350_435.42
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
        jmp near sub_6D350_435.42
sub_6D350_435:
        test byte [byte ebp+010h], 1
        je short .37
        cmp edx, byte 2
        je short .37
        cmp ebx, byte 2
        je short .37
        cmp dword [byte ebp-04h], byte 2
        jne near sub_6D350_2C.1
.37:
        test byte [byte ebp+010h], 2
        je short .38
        cmp edx, byte 4
        je short .38
        cmp ebx, byte 4
        je short .38
        cmp dword [byte ebp-04h], byte 4
        jne near sub_6D350_2C.3
.38:
        test byte [byte ebp+010h], 4
        je short .39
        cmp edx, byte 8
        je short .39
        cmp ebx, byte 8
        je short .39
        cmp dword [byte ebp-04h], byte 8
        jne near sub_6D350_2C.5
.39:
        test byte [byte ebp+010h], 8
        je short .40
        cmp edx, byte 10h
        je short .40
        cmp ebx, byte 10h
        je short .40
        cmp dword [byte ebp-04h], byte 10h
        jne near sub_6D350_2C.7
.40:
        test byte [byte ebp+010h], 10h
        je short .41
        cmp edx, byte 20h
        je short .41
        cmp ebx, byte 20h
        je short .41
        cmp dword [byte ebp-04h], byte 20h
        jne near sub_6D350_2C.9
.41:
        cmp edx, byte 40h
        je short .42
        cmp ebx, byte 40h
        je short .42
        cmp dword [byte ebp-04h], byte 40h
        jne near sub_6D350_2C.11
.42:
        mov esi, 1
sub_6D350_4D0:
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
        call sub_6D350
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
unk_6DB28:
        db 00h,04h,040h,00h,020h,00h,010h,00h,08h,00h,04h,00h,02h,00h,01h,00h
jpt_6DB38:
        dd sub_6DB5C_CB
        dd sub_6DB5C_51
        dd sub_6DB5C_5D
        dd sub_6DB5C_69
        dd sub_6DB5C_75
        dd sub_6DB5C_81
        dd sub_6DB5C_8D
        dd sub_6DB5C_99
        dd sub_6DB5C_A5
;-----------------------------------------------------------------------------
; sub_6DB5C                                                       6DB5C  96 PC
;-----------------------------------------------------------------------------
sub_6DB5C:
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
        movsx edx, word [word_114CE4]
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
        mov edi, unk_6DB28
        repne scasw
        jmp dword [nosplit cs:ecx*4+jpt_6DB38]
sub_6DB5C_51:
        movsx eax, bx
        inc eax
        push eax
        push str_PlyD
        jmp short sub_6DB5C_A5.4
sub_6DB5C_5D:
        movsx eax, bx
        inc eax
        push eax
        push str_MseD2
        jmp short sub_6DB5C_A5.4
sub_6DB5C_69:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy1D
        jmp short sub_6DB5C_A5.4
sub_6DB5C_75:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy2D
        jmp short sub_6DB5C_A5.4
sub_6DB5C_81:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy3D
        jmp short sub_6DB5C_A5.4
sub_6DB5C_8D:
        movsx eax, bx
        inc eax
        push eax
        push str_Jy4D
        jmp short sub_6DB5C_A5.4
sub_6DB5C_99:
        movsx eax, bx
        inc eax
        push eax
        push str_KeyD2
        jmp short sub_6DB5C_A5.4
sub_6DB5C_A5:
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
        call sub_E04E0
        add esp, byte 8
        mov dword [byte ebp-04h], eax
sub_6DB5C_CB:
        mov eax, dword [byte ebp-04h]
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; sub_6DC2F                                                       6DC2F  96 PC
;-----------------------------------------------------------------------------
sub_6DC2F:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        cmp dword [eax], byte 5
        jge short .1
        push dword [dword_17D564]
        call sub_AADA4
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne near .6
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        jne short .3
        jmp near .6
.1:
        cmp dword [eax], byte 0Ah
        jge short .4
        push dword [dword_17D56C]
        call sub_AADA4
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne near .6
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
.2:
        je near .6
.3:
        mov si, word [esi]
        mov word [word_17D58C], si
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.4:
        cmp dword [eax], byte 0Fh
        jge short .5
        push dword [dword_17D574]
        call sub_AADA4
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne short .6
        cmp word [word_114CE4], byte 0
        jmp short .2
.5:
        cmp dword [eax], byte 14h
        jge short .7
        push dword [dword_17D57C]
        call sub_AADA4
        mov eax, dword [optflags]
        and eax, byte 70h
        add esp, byte 4
        cmp eax, byte 30h
        jne short .6
        cmp word [word_114CE4], byte 0
        jne short .3
        mov ax, word [esi]
        mov word [word_17D58E], ax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.6:
        mov si, word [esi]
        mov word [word_17D58E], si
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
        mov eax, dword [dword_17D580]
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
        mov eax, dword [dword_17D580]
        cmp dword [byte eax+01Ah], byte 0
        sete dl
        mov byte [dword eax+0AAh], dl
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+01B2h], byte 0
        setne dl
        add dl, 3
        mov byte [dword eax+0177h], dl
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .5
        mov eax, dword [dword_17D580]
        mov byte [dword eax+0174h], 18h
.5:
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .6
        mov eax, dword [dword_17D580]
        mov byte [dword eax+01DAh], 18h
.6:
        mov eax, dword [dword_17D580]
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
        mov eax, dword [dword_17D580]
        cmp dword [byte eax+01Ah], byte 0
        sete dl
        mov byte [dword eax+0240h], dl
        mov eax, dword [dword_17D580]
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
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0218h], byte 0
        sete dl
        add dl, 5
        mov byte [dword eax+02A8h], dl
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+03B0h], byte 0
        setne dl
        add dl, 8
        mov byte [dword eax+0375h], dl
        mov eax, dword [dword_17D580]
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
        mov eax, dword [dword_17D580]
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
        mov eax, dword [dword_17D580]
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
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0614h], byte 0
        je short .23
        mov byte [dword eax+043Fh], 0Fh
        jmp short .24
.23:
        mov byte [dword eax+043Fh], 16h
.24:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0416h], byte 0
        je short .25
        mov byte [dword eax+04A6h], 0Ah
        jmp short .26
.25:
        mov byte [dword eax+04A6h], 16h
.26:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+05AEh], byte 0
        je short .27
        mov byte [dword eax+0573h], 0Eh
        jmp short .28
.27:
        mov byte [dword eax+0573h], 17h
.28:
        mov eax, dword [dword_17D580]
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
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+07ACh], byte 0
        je short .33
        mov byte [dword eax+05D7h], 13h
        jmp short .34
.33:
        mov byte [dword eax+05D7h], 17h
.34:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0416h], byte 0
        je short .35
        mov byte [dword eax+063Ch], 0Ah
.35:
        mov eax, dword [dword_17D580]
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
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0614h], byte 0
        je short .39
        mov byte [dword eax+06A4h], 0Fh
        jmp short .40
.39:
        mov byte [dword eax+06A4h], 16h
.40:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+07ACh], byte 0
        je short .41
        mov byte [dword eax+0771h], 13h
        jmp short .42
.41:
        mov byte [dword eax+0771h], 17h
.42:
        mov eax, dword [dword_17D580]
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
        mov eax, dword [dword_17D580]
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
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne short .53
        mov eax, dword [dword_17D580]
        mov byte [dword eax+0909h], 14h
        jmp short .55
.53:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+0614h], byte 0
        je short .54
        mov byte [dword eax+0909h], 0Fh
        jmp short .55
.54:
        mov byte [dword eax+0909h], 10h
.55:
        mov eax, dword [dword_17D580]
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
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne short .62
        mov eax, dword [dword_17D580]
        mov byte [dword eax+096Eh], 15h
        jmp short .64
.62:
        mov eax, dword [dword_17D580]
        cmp dword [dword eax+07ACh], byte 0
        je short .63
        mov byte [dword eax+096Eh], 13h
        jmp short .64
.63:
        mov byte [dword eax+096Eh], 12h
.64:
        mov eax, dword [dword_17D580]
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
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne near SetControllerIcon_F9
        test eax, eax
        jne short .1
        lea edi, [byte ebp-0Ch]
        mov eax, dword [dword_17D580]
        mov esi, str_P11
        add eax, 7F8h
        jmp short .2
.1:
        cmp eax, byte 1
        jne near SetControllerIcon_F9
        lea edi, [byte ebp-0Ch]
        mov eax, dword [dword_17D580]
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
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, dword [byte ebp-04h]
        add esp, byte 8
        mov dword [byte edx+01Ah], eax
        lea eax, [byte ebp-0Ch]
        push eax
        push dword [dword_17D588]
        mov byte [byte ebp-09h], 32h
        call sub_E04E0
        mov edx, dword [byte ebp-04h]
        add esp, byte 8
        mov dword [byte edx+01Eh], eax
        lea eax, [byte ebp-0Ch]
        push eax
        push dword [dword_17D588]
        mov byte [byte ebp-09h], 33h
        call sub_E04E0
        mov edx, dword [byte ebp-04h]
        add esp, byte 8
        mov dword [byte edx+022h], eax
        jmp short SetControllerIcon_F9
.3:
        cmp dword [byte eax+01Eh], byte 0
        je short SetControllerIcon_F9
        lea eax, [byte ebp-0Ch]
        push eax
        push dword [dword_17D588]
        mov byte [byte ebp-09h], 67h
        call sub_E04E0
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
        cmp word [word_11D92E], byte 0
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
        movsx eax, word [nosplit eax*8+word_17D560]
        cmp eax, byte 2
        je near .9
        cmp esi, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        jne short .7
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .6
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .7
.6:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .8
        cmp word [word_114CE4], byte 0
        jne short .8
.7:
        movsx eax, word [byte ebp-0Ch]
        movsx ecx, word [nosplit eax*8+word_17D562]
        movsx eax, di
        movsx esi, word [byte ebp-04h]
        movsx ebx, word [nosplit eax*8+word_17D562]
        movsx eax, word [byte ebp-08h]
        push dword [dword_17D584]
        movsx edx, word [nosplit eax*8+word_17D562]
        movsx eax, word [nosplit esi*8+word_17D562]
        call sub_6D350
        mov word [nosplit esi*8+word_17D562], ax
        jmp short .9
.8:
        movsx eax, word [byte ebp-04h]
        mov word [nosplit eax*8+word_17D562], 400h
.9:
        movsx esi, word [byte ebp-04h]
        shl esi, 3
        movsx eax, word [dword esi+word_17D562]
        cmp eax, byte 1
        je near .49
        mov eax, dword [byte ebp-024h]
        mov dword [byte eax+01Ah], 0
        mov dword [byte eax+05Ah], 0
        mov dword [byte eax+062h], 0
        and byte [byte eax+046h], 0FDh
        push dword [dword esi+dword_17D564]
        call sub_AADA4
        movsx eax, word [dword esi+word_17D560]
        add esp, byte 4
        cmp eax, byte 2
        jne near .13
        mov eax, dword [byte ebp-028h]
        add eax, byte 3
        imul eax, byte 66h
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+01Ah], 0
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+01Eh], 0
        mov edx, dword [dword_17D580]
        mov word [byte edx+eax+018h], 3
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .11
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .10
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .12
.10:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .13
        cmp word [word_114CE4], byte 0
        jne short .13
        jmp short .12
.11:
        movsx eax, word [byte ebp-08h]
        movsx eax, word [nosplit eax*8+word_17D560]
        cmp eax, byte 2
        je short .13
        movsx eax, di
        movsx eax, word [nosplit eax*8+word_17D560]
        cmp eax, byte 2
        je short .13
        movsx eax, word [byte ebp-0Ch]
        movsx eax, word [nosplit eax*8+word_17D560]
        cmp eax, byte 2
        je short .13
.12:
        mov eax, 1
        xor edx, edx
        call SetControllerIcon
.13:
        imul edi, dword [byte ebp-028h], byte 66h
        movsx ebx, word [byte ebp-04h]
        mov eax, dword [dword_17D588]
        movsx edx, word [nosplit ebx*8+word_17D562]
        mov esi, ebx
        call sub_6DB5C
        mov edx, eax
        mov eax, dword [dword_17D580]
        mov dword [byte edi+eax+01Ah], edx
        mov eax, dword [dword_17D580]
        mov dword [byte edi+eax+05Ah], sub_6DC2F
        mov eax, dword [dword_17D580]
        mov dword [byte edi+eax+062h], DrawControllerColumns
        mov eax, dword [dword_17D580]
        or byte [byte edi+eax+046h], 2
        mov ebx, dword [dword_17D580]
        mov eax, dword [nosplit esi*8+dword_17D564]
        mov dx, word [byte edi+ebx+026h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [dword_17D580]
        add edi, eax
        mov eax, dword [nosplit esi*8+dword_17D564]
        mov dx, word [byte edi+02Ah]
        mov word [byte eax+0Eh], dx
        push dword [nosplit esi*8+dword_17D564]
        call sub_AA988
        mov eax, dword [byte ebp-028h]
        dec eax
        imul edx, eax, byte 66h
        mov eax, dword [dword_17D580]
        mov word [nosplit esi*8+word_17D560], 0
        mov word [byte edx+eax+018h], 0
        movsx eax, word [word_17D58E]
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
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .15
.14:
        cmp dword [byte ebp-028h], byte 0Ah
        jle near .49
        cmp word [word_114CE4], byte 0
        jne near .49
.15:
        mov esi, dword [byte ebp-028h]
        dec esi
        imul esi, byte 66h
        push dword [dword_17BC74]
        call TextSetFont
        add esp, byte 4
        push str_Usri
        push dword [dword_17D588]
        call sub_E04E0
        add esp, byte 8
        mov edx, eax
        mov eax, dword [dword_17D580]
        push str_Usrh
        mov dword [byte esi+eax+01Ah], edx
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, eax
        mov eax, dword [dword_17D580]
        mov dword [byte esi+eax+01Eh], edx
        movsx eax, word [byte ebp-04h]
        mov edx, eax
        shl edx, 2
        add esp, byte 8
        mov dword [byte ebp-014h], edx
        cmp dword [dword edx+dword_11D940], byte 0
        je short .16
        push dword [dword edx+dword_11D940]
        call sub_AADA4
        add esp, byte 4
        jmp near .17
.16:
        imul eax, byte 21h
        add eax, word_160ACC
        push byte 20h
        inc eax
        inc eax
        push eax
        movzx edi, byte [byte_11FA2F]
        mov dword [byte ebp-01Ch], eax
        call fputchar
        lea edx, [byte edi+01h]
        imul eax, edx
        add esp, byte 4
        add eax, byte 10h
        push eax
        push str_Utext
        call sub_AB758
        mov edx, dword [byte ebp-014h]
        mov dword [dword edx+dword_11D940], eax
        mov eax, dword [dword_17D580]
        add esp, byte 0Ch
        mov edi, dword [dword edx+dword_11D940]
        mov esi, dword [byte esi+eax+01Ah]
        push dword [byte ebp-01Ch]
        movsd
        movsd
        movsd
        movsd
        movsb
        call fputchar
        mov edx, eax
        mov eax, dword [byte ebp-014h]
        mov eax, dword [dword eax+dword_11D940]
        mov word [byte eax+04h], dx
        mov eax, dword [byte ebp-014h]
        movzx dx, byte [byte_11FA2F]
        mov eax, dword [dword eax+dword_11D940]
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
        mov dx, word [dword edi+str_feO]
        mov eax, dword [dword esi+dword_11D940]
        add edx, byte 6
        mov word [byte eax+0Ch], dx
        mov dx, word [dword edi+word_11D96C]
        mov eax, dword [dword esi+dword_11D940]
        sub edx, byte 5
        mov word [byte eax+0Eh], dx
        push dword [dword esi+dword_11D940]
        call sub_AA988
        imul eax, dword [byte ebp-020h], byte 21h
        add esp, byte 4
        mov ebx, dword [dword edi+word_11D96C]
        mov edx, dword [dword edi+str_feO]
        sub ebx, byte 5
        add eax, word_160ACC
        add edx, byte 6
        inc eax
        inc eax
        call DrawColorText
        push dword [dword_17BC78]
        call TextSetFont
        add esp, byte 4
        cmp dword [dword esi+dword_11D930], byte 0
        jne short .18
        mov eax, dword [byte ebp-028h]
        dec eax
        imul eax, byte 66h
        mov edx, dword [dword_17D580]
        mov eax, dword [byte edx+eax+01Ah]
        mov edx, 20h
        call CopyBitmap
        mov dword [dword esi+dword_11D930], eax
        jmp short .19
.18:
        push dword [dword esi+dword_11D930]
        call sub_AADA4
        add esp, byte 4
.19:
        mov esi, dword [byte ebp-028h]
        dec esi
        imul esi, byte 66h
        movsx eax, word [byte ebp-04h]
        mov edi, dword [dword_17D580]
        mov ebx, dword [nosplit eax*4+dword_11D930]
        mov dx, word [byte edi+esi+026h]
        mov word [byte ebx+0Ch], dx
        mov ebx, dword [dword_17D580]
        mov edi, dword [nosplit eax*4+dword_11D930]
        mov dx, word [byte esi+ebx+02Ah]
        mov word [byte edi+0Eh], dx
        push dword [nosplit eax*4+dword_11D930]
        call sub_AA988
        mov eax, dword [dword_17D580]
        add esp, byte 4
        push dword [byte esi+eax+02Ah]
        push dword [byte esi+eax+026h]
        push dword [byte esi+eax+01Ah]
        call sub_AAA40
        add esp, byte 0Ch
        push dword [dword_17BC78]
        call TextSetFont
        add esp, byte 4
        mov edx, 1
        xor eax, eax
        jmp near .48
.20:
        movsx esi, word [byte ebp-04h]
        shl esi, 3
        movsx eax, word [dword esi+word_17D560]
        cmp eax, byte 1
        je near .49
        mov eax, dword [byte ebp-024h]
        mov dword [byte eax+01Ah], 0
        mov dword [byte eax+05Ah], 0
        mov dword [byte eax+062h], 0
        and byte [byte eax+046h], 0FDh
        push dword [dword esi+dword_17D564]
        call sub_AADA4
        movsx eax, word [dword esi+word_17D560]
        add esp, byte 4
        cmp eax, byte 2
        jne near .24
        mov eax, dword [byte ebp-028h]
        inc eax
        inc eax
        imul eax, byte 66h
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+01Ah], 0
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+01Eh], 0
        mov edx, dword [dword_17D580]
        mov word [byte edx+eax+018h], 3
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .23
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .21
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .22
.21:
        cmp dword [byte ebp-028h], byte 0Ah
        jle near .29
        cmp word [word_114CE4], byte 0
        jne near .29
.22:
        mov eax, 1
        xor edx, edx
        jmp near .28
.23:
        movsx eax, word [byte ebp-08h]
        movsx eax, word [nosplit eax*8+word_17D560]
        cmp eax, byte 2
        je near .29
        movsx eax, di
        movsx eax, word [nosplit eax*8+word_17D560]
        cmp eax, byte 2
        je near .29
        movsx eax, word [byte ebp-0Ch]
        movsx eax, word [nosplit eax*8+word_17D560]
        cmp eax, byte 2
        je near .29
        jmp short .22
.24:
        mov eax, dword [byte ebp-028h]
        dec eax
        dec eax
        imul eax, byte 66h
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+01Ah], 0
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+01Eh], 0
        mov edx, dword [dword_17D580]
        mov word [byte edx+eax+018h], 3
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .27
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .25
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .26
.25:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .29
        cmp word [word_114CE4], byte 0
        jne short .29
.26:
        xor edx, edx
        xor eax, eax
        jmp short .28
.27:
        movsx eax, word [byte ebp-08h]
        cmp word [nosplit eax*8+word_17D560], byte 0
        je short .29
        movsx eax, di
        cmp word [nosplit eax*8+word_17D560], byte 0
        je short .29
        movsx eax, word [byte ebp-0Ch]
        cmp word [nosplit eax*8+word_17D560], byte 0
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
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .31
.30:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .32
        cmp word [word_114CE4], byte 0
        jne short .32
.31:
        movsx esi, word [byte ebp-04h]
        push dword [nosplit esi*4+dword_11D930]
        call sub_AADA4
        add esp, byte 4
        push dword [nosplit esi*4+dword_11D930]
        call sub_ABF4C
        add esp, byte 4
        push dword [nosplit esi*4+dword_11D940]
        mov dword [nosplit esi*4+dword_11D930], 0
        call sub_AADA4
        add esp, byte 4
        push dword [nosplit esi*4+dword_11D940]
        call sub_ABF4C
        add esp, byte 4
        mov dword [nosplit esi*4+dword_11D940], 0
.32:
        movsx ebx, word [byte ebp-04h]
        mov eax, ebx
        call ClearSlotUser
        mov word [nosplit ebx*8+word_17D562], 1
        mov eax, dword [dword_17D588]
        movsx edx, word [nosplit ebx*8+word_17D562]
        mov esi, ebx
        call sub_6DB5C
        mov edx, eax
        imul eax, dword [byte ebp-028h], byte 66h
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+01Ah], edx
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+05Ah], sub_6DC2F
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+062h], DrawControllerColumns
        mov edi, dword [dword_17D580]
        or byte [byte edi+eax+046h], 2
        mov ebx, dword [dword_17D580]
        mov edi, dword [nosplit esi*8+dword_17D564]
        mov dx, word [byte ebx+eax+026h]
        mov word [byte edi+0Ch], dx
        mov ebx, dword [dword_17D580]
        add ebx, eax
        mov eax, dword [nosplit esi*8+dword_17D564]
        mov dx, word [byte ebx+02Ah]
        mov word [byte eax+0Eh], dx
        push dword [nosplit esi*8+dword_17D564]
        call sub_AA988
        add esp, byte 4
        mov word [nosplit esi*8+word_17D560], 1
        jmp near .49
.33:
        movsx eax, word [byte ebp-04h]
        cmp word [nosplit eax*8+word_17D560], byte 0
        je near .37
        cmp esi, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        jne short .35
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .34
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .35
.34:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .36
        cmp word [word_114CE4], byte 0
        jne short .36
.35:
        movsx eax, word [byte ebp-0Ch]
        movsx ecx, word [nosplit eax*8+word_17D562]
        movsx eax, di
        movsx esi, word [byte ebp-04h]
        movsx ebx, word [nosplit eax*8+word_17D562]
        movsx eax, word [byte ebp-08h]
        push dword [dword_17D584]
        movsx edx, word [nosplit eax*8+word_17D562]
        movsx eax, word [nosplit esi*8+word_17D562]
        call sub_6D350
        mov word [nosplit esi*8+word_17D562], ax
        jmp short .37
.36:
        movsx eax, word [byte ebp-04h]
        mov word [nosplit eax*8+word_17D562], 400h
.37:
        movsx esi, word [byte ebp-04h]
        shl esi, 3
        movsx eax, word [dword esi+word_17D562]
        cmp eax, byte 1
        je near .49
        mov eax, dword [byte ebp-024h]
        mov dword [byte eax+01Ah], 0
        mov dword [byte eax+05Ah], 0
        mov dword [byte eax+062h], 0
        and byte [byte eax+046h], 0FDh
        push dword [dword esi+dword_17D564]
        call sub_AADA4
        add esp, byte 4
        cmp word [dword esi+word_17D560], byte 0
        jne near .41
        mov ebx, dword [byte ebp-028h]
        sub ebx, byte 3
        imul ebx, byte 66h
        mov eax, dword [dword_17D580]
        mov dword [byte ebx+eax+01Ah], 0
        mov eax, dword [dword_17D580]
        mov dword [byte ebx+eax+01Eh], 0
        mov eax, dword [dword_17D580]
        mov word [byte ebx+eax+018h], 3
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .39
        cmp dword [byte ebp-028h], byte 0Ah
        jge short .38
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .40
.38:
        cmp dword [byte ebp-028h], byte 0Ah
        jle short .41
        cmp word [word_114CE4], byte 0
        jne short .41
        jmp short .40
.39:
        movsx eax, word [byte ebp-08h]
        cmp word [nosplit eax*8+word_17D560], byte 0
        je short .41
        movsx eax, di
        cmp word [nosplit eax*8+word_17D560], byte 0
        je short .41
        movsx eax, word [byte ebp-0Ch]
        cmp word [nosplit eax*8+word_17D560], byte 0
        je short .41
.40:
        xor edx, edx
        xor eax, eax
        call SetControllerIcon
.41:
        movsx ebx, word [byte ebp-04h]
        mov eax, dword [dword_17D588]
        movsx edx, word [nosplit ebx*8+word_17D562]
        mov esi, ebx
        call sub_6DB5C
        mov edx, eax
        imul eax, dword [byte ebp-028h], byte 66h
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+01Ah], edx
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+05Ah], sub_6DC2F
        mov ebx, dword [dword_17D580]
        mov dword [byte ebx+eax+062h], DrawControllerColumns
        mov edi, dword [dword_17D580]
        or byte [byte edi+eax+046h], 2
        mov ebx, dword [dword_17D580]
        mov edi, dword [nosplit esi*8+dword_17D564]
        mov dx, word [byte ebx+eax+026h]
        mov word [byte edi+0Ch], dx
        mov edx, dword [dword_17D580]
        mov ebx, dword [nosplit esi*8+dword_17D564]
        mov ax, word [byte edx+eax+02Ah]
        mov word [byte ebx+0Eh], ax
        push dword [nosplit esi*8+dword_17D564]
        call sub_AA988
        mov eax, dword [byte ebp-028h]
        inc eax
        imul eax, byte 66h
        mov edx, dword [dword_17D580]
        mov word [nosplit esi*8+word_17D560], 2
        mov word [byte edx+eax+018h], 0
        movsx eax, word [word_17D58E]
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
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .43
.42:
        cmp dword [byte ebp-028h], byte 0Ah
        jle near .49
        cmp word [word_114CE4], byte 0
        jne near .49
.43:
        mov esi, dword [byte ebp-028h]
        inc esi
        imul esi, byte 66h
        push dword [dword_17BC74]
        call TextSetFont
        add esp, byte 4
        push str_Usri
        push dword [dword_17D588]
        call sub_E04E0
        add esp, byte 8
        mov edx, eax
        mov eax, dword [dword_17D580]
        push str_Usrh
        mov dword [byte esi+eax+01Ah], edx
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, eax
        mov eax, dword [dword_17D580]
        mov dword [byte esi+eax+01Eh], edx
        movsx eax, word [byte ebp-04h]
        mov edx, eax
        shl edx, 2
        add esp, byte 8
        mov dword [byte ebp-010h], edx
        cmp dword [dword edx+dword_11D940], byte 0
        je short .44
        push dword [dword edx+dword_11D940]
        call sub_AADA4
        add esp, byte 4
        jmp near .45
.44:
        imul eax, byte 21h
        add eax, word_160ACC
        push byte 20h
        inc eax
        inc eax
        movzx edi, byte [byte_11FA2F]
        push eax
        inc edi
        mov dword [byte ebp-01Ch], eax
        call fputchar
        imul eax, edi
        add esp, byte 4
        add eax, byte 10h
        push eax
        push str_Utext
        call sub_AB758
        mov edx, dword [byte ebp-010h]
        mov dword [dword edx+dword_11D940], eax
        mov eax, dword [dword_17D580]
        add esp, byte 0Ch
        mov edi, dword [dword edx+dword_11D940]
        mov esi, dword [byte esi+eax+01Ah]
        push dword [byte ebp-01Ch]
        movsd
        movsd
        movsd
        movsd
        movsb
        call fputchar
        mov edx, eax
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_11D940]
        mov word [byte eax+04h], dx
        mov eax, dword [byte ebp-010h]
        movzx dx, byte [byte_11FA2F]
        mov eax, dword [dword eax+dword_11D940]
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
        mov dx, word [dword edi+str_dbgO]
        mov eax, dword [dword esi+dword_11D940]
        sub edx, byte 4
        sub dx, word [byte eax+04h]
        mov word [byte eax+0Ch], dx
        mov dx, word [dword edi+dword_11D954]
        mov eax, dword [dword esi+dword_11D940]
        sub edx, byte 5
        mov word [byte eax+0Eh], dx
        push dword [dword esi+dword_11D940]
        call sub_AA988
        imul eax, dword [byte ebp-018h], byte 21h
        add esp, byte 4
        mov ebx, dword [dword edi+dword_11D954]
        mov edx, dword [dword edi+str_dbgO]
        sub ebx, byte 5
        add eax, word_160ACC
        sub edx, byte 4
        inc eax
        inc eax
        call DrawColorTextRight
        push dword [dword_17BC78]
        call TextSetFont
        add esp, byte 4
        cmp dword [dword esi+dword_11D930], byte 0
        jne short .46
        mov eax, dword [byte ebp-028h]
        inc eax
        imul edx, eax, byte 66h
        mov eax, dword [dword_17D580]
        mov eax, dword [byte edx+eax+01Ah]
        mov edx, 20h
        call CopyBitmap
        mov dword [dword esi+dword_11D930], eax
        jmp short .47
.46:
        push dword [dword esi+dword_11D930]
        call sub_AADA4
        add esp, byte 4
.47:
        mov edi, dword [byte ebp-028h]
        inc edi
        imul edi, byte 66h
        movsx eax, word [byte ebp-04h]
        mov ebx, dword [dword_17D580]
        mov esi, dword [nosplit eax*4+dword_11D930]
        mov dx, word [byte edi+ebx+026h]
        mov word [byte esi+0Ch], dx
        mov esi, dword [dword_17D580]
        mov ebx, dword [nosplit eax*4+dword_11D930]
        mov dx, word [byte edi+esi+02Ah]
        mov word [byte ebx+0Eh], dx
        push dword [nosplit eax*4+dword_11D930]
        call sub_AA988
        mov eax, dword [dword_17D580]
        add esp, byte 4
        push dword [byte edi+eax+02Ah]
        push dword [byte edi+eax+026h]
        push dword [byte edi+eax+01Ah]
        call sub_AAA40
        add esp, byte 0Ch
        push dword [dword_17BC78]
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
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        jne short .51
        mov eax, dword [byte ebp-024h]
        cmp dword [eax], byte 0Ah
        jl short .52
.50:
        mov word [word_17D58C], 0FFFFh
        jmp short .53
.51:
        cmp word [word_114CE4], byte 0
        jne short .53
        mov eax, dword [byte ebp-024h]
        cmp dword [eax], byte 0Ah
        jl short .50
.52:
        mov word [word_17D58E], 0FFFFh
.53:
        call SetControllerColumn
        jmp near SetControllerIcon_F9
jpt_6F02E:
        dd ControllerScreen_11AB
        dd ControllerScreen_149D
        dd ControllerScreen_14E4
        dd ControllerScreen_1503
        dd ControllerScreen_11AB
jpt_6F042:
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
        mov esi, sub_6CF0D
        push byte 20h
        movsd
        movsw
        push dword 9F6h
        lea edi, [byte ebp-068h]
        mov esi, sub_6CF0D_6
        push str_MCONTROL
        movsd
        movsd
        call sub_AB758
        add esp, byte 0Ch
        mov dword [dword_17D580], eax
        mov eax, 6
        xor edx, edx
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 4Dh
        call LoadPackedFile
        push byte 0
        mov dword [dword_17D588], eax
        call sub_ADA50
        add esp, byte 4
        call BlackPalette
        push str_Pal12
        mov esi, unk_152C44
        push dword [dword_17D588]
        add esi, 1F2h
        call sub_E04E0
        add esp, byte 8
        lea edx, [byte eax+010h]
        mov ecx, 0C0h
        lea edi, [dword eax+0202h]
        rep movsb
        mov eax, edx
        mov dword [byte ebp-050h], edx
        call SetScreenColors
        call sub_DD6C4
        push str_Bkgd6
        push dword [dword_17D588]
        call sub_E04E0
        add esp, byte 8
        push eax
        call sub_AADA4
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
        call sub_AD35C
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
        call sub_AA988
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
        call sub_DD6C4
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
        call sub_AA988
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
        call sub_DD6C4
        push edi
        push dword [byte ebp-08h]
        push dword [byte esi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push esi
        call sub_ADBEC
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
        call sub_AD35C
        mov esi, eax
        mov eax, dword [byte eax+02Ch]
        mov word [byte eax+0Ch], 31h
        mov eax, dword [byte esi+02Ch]
        add esp, byte 0Ch
        mov word [byte eax+0Eh], 0D6h
        push dword [byte esi+02Ch]
        call sub_AA988
        add esp, byte 4
        push esi
        call SetDrawBitmap
        mov ecx, 1
        mov eax, 0FAE1h
        add esp, byte 4
        mov edx, edi
        mov ebx, ecx
        call DrawFrameAt
        call sub_DD6C4
        push dword [byte esi+02Ch]
        call sub_AADA4
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
        call sub_AA988
        add esp, byte 4
        push esi
        call SetDrawBitmap
        mov ecx, 1
        mov eax, 0FAE1h
        add esp, byte 4
        mov edx, edi
        mov ebx, ecx
        call DrawFrameAt
        call sub_DD6C4
        push dword [byte esi+02Ch]
        call sub_AADA4
        add esp, byte 4
        push esi
        call sub_ADBEC
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
        cmp word [word_11D92C], byte 0
        je short .3
        mov word [dword esi+word_17D562], 1
        mov eax, edx
        mov word [dword esi+word_17D560], 1
        call ClearSlotUser
        jmp short .6
.3:
        mov ebx, dword [gameopts]
        mov ax, word [byte edi+ebx+09h]
        mov word [dword esi+word_17D562], ax
        cmp byte [byte edx+ebx+05h], 0
        je short .4
        mov word [dword esi+word_17D560], 0
        jmp short .6
.4:
        cwde
        cmp eax, byte 1
        je short .5
        mov word [dword esi+word_17D560], 2
        jmp short .6
.5:
        mov word [dword esi+word_17D560], 1
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
        push dword [dword_17D588]
        mov dword [byte ebp-08h], edx
        call sub_E04E0
        add esp, byte 8
        mov edx, 20h
        call CopyBitmap
        movsx edx, word [dword esi+word_17D560]
        mov dword [dword esi+dword_17D564], eax
        mov dx, word [byte ebp+edx*2-060h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [dword esi+dword_17D564]
        mov dx, word [byte edi+ebp-068h]
        mov word [byte eax+0Eh], dx
        inc edi
        inc edi
        push dword [dword esi+dword_17D564]
        add esi, byte 8
        call sub_AA988
        mov edx, dword [byte ebp-08h]
        add esp, byte 4
        cmp edx, byte 4
        jl near .2
        mov eax, 19h
        mov edx, dword [dword_17D580]
        mov word [word_11D92C], 0
        call InitMenuItems
        push str_Key1
        mov dword [byte ebp-048h], 0
        mov dword [byte ebp-020h], 0
        push dword [dword_17D588]
        mov dword [byte ebp-01Ch], 0
        call sub_E04E0
        mov dword [byte ebp-010h], eax
        mov eax, word_160ACC
        mov dword [byte ebp-018h], 0
        inc eax
        inc eax
        add esp, byte 8
        mov dword [byte ebp-014h], eax
.7:
        imul eax, dword [byte ebp-048h], byte 5
        mov dword [byte ebp-04Ch], eax
        imul esi, dword [byte ebp-04Ch], byte 66h
        mov eax, dword [dword_17D580]
        add eax, dword [byte ebp-020h]
        mov dword [byte eax+010h], 4
        mov eax, dword [byte ebp-04Ch]
        mov ebx, str_dbgO
        shl eax, 6
        mov edx, dword [dword_17D580]
        add ebx, eax
        mov dword [byte edx+esi+014h], ebx
        mov edx, dword [dword_17D580]
        mov ebx, dword [dword eax+str_dbgO]
        mov dword [byte edx+esi+026h], ebx
        mov edx, dword [dword_17D580]
        mov eax, dword [dword eax+dword_11D954]
        mov dword [byte edx+esi+02Ah], eax
        mov eax, dword [byte ebp-04Ch]
        mov edx, dword [dword_17D580]
        mov ebx, dword [nosplit eax*8+dword_11DED0]
        mov dword [byte edx+esi+03Ah], ebx
        mov edx, dword [dword_17D580]
        mov eax, dword [nosplit eax*8+dword_11DED4]
        mov dword [byte edx+esi+03Eh], eax
        mov eax, dword [dword_17D580]
        mov dword [byte esi+eax+032h], 0
        mov eax, dword [byte ebp-01Ch]
        cmp word [dword eax+word_17D560], byte 0
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
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .9
.8:
        cmp dword [byte ebp-048h], byte 1
        jle near .10
        cmp word [word_114CE4], byte 0
        jne near .10
.9:
        push dword [dword_17BC74]
        call TextSetFont
        add esp, byte 4
        push str_Usri
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, eax
        imul eax, dword [byte ebp-04Ch], byte 66h
        mov dword [byte ebp-08h], eax
        mov eax, dword [dword_17D580]
        add esp, byte 8
        add eax, dword [byte ebp-08h]
        push str_Usrh
        mov dword [byte eax+01Ah], edx
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, eax
        mov eax, dword [dword_17D580]
        add eax, dword [byte ebp-08h]
        add esp, byte 8
        mov dword [byte eax+01Eh], edx
        push byte 20h
        movzx esi, byte [byte_11FA2F]
        push dword [byte ebp-014h]
        inc esi
        call fputchar
        imul eax, esi
        add esp, byte 4
        add eax, byte 10h
        push eax
        push str_Utext
        call sub_AB758
        mov edx, dword [byte ebp-018h]
        mov dword [dword edx+dword_11D940], eax
        mov eax, dword [dword_17D580]
        add eax, dword [byte ebp-08h]
        add esp, byte 0Ch
        mov edi, dword [dword edx+dword_11D940]
        mov esi, dword [byte eax+01Ah]
        push dword [byte ebp-014h]
        movsd
        movsd
        movsd
        movsd
        movsb
        call fputchar
        mov edx, eax
        mov eax, dword [byte ebp-018h]
        mov eax, dword [dword eax+dword_11D940]
        mov word [byte eax+04h], dx
        mov eax, dword [byte ebp-018h]
        movzx dx, byte [byte_11FA2F]
        mov esi, dword [byte ebp-04Ch]
        inc edx
        mov eax, dword [dword eax+dword_11D940]
        shl esi, 6
        mov word [byte eax+06h], dx
        mov eax, dword [byte ebp-018h]
        mov dx, word [dword esi+word_11D9A8]
        mov eax, dword [dword eax+dword_11D940]
        add edx, byte 6
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp-018h]
        mov dx, word [dword esi+word_11D9AC]
        mov eax, dword [dword eax+dword_11D940]
        sub edx, byte 5
        add esp, byte 4
        mov word [byte eax+0Eh], dx
        mov eax, dword [byte ebp-018h]
        push dword [dword eax+dword_11D940]
        call sub_AA988
        mov eax, dword [byte ebp-014h]
        add esp, byte 4
        mov ebx, dword [dword esi+word_11D9AC]
        mov edx, dword [dword esi+word_11D9A8]
        sub ebx, byte 5
        add edx, byte 6
        call DrawColorText
        mov eax, dword [dword_17D580]
        add eax, dword [byte ebp-08h]
        mov edx, 20h
        mov eax, dword [byte eax+01Ah]
        call CopyBitmap
        mov edx, dword [byte ebp-018h]
        mov dword [dword edx+dword_11D930], eax
        mov edx, dword [dword_17D580]
        mov eax, dword [byte ebp-018h]
        add edx, dword [byte ebp-08h]
        mov eax, dword [dword eax+dword_11D930]
        mov dx, word [byte edx+026h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [dword_17D580]
        mov edx, dword [byte ebp-018h]
        add eax, dword [byte ebp-08h]
        mov edx, dword [dword edx+dword_11D930]
        mov ax, word [byte eax+02Ah]
        mov word [byte edx+0Eh], ax
        mov eax, dword [byte ebp-018h]
        push dword [dword eax+dword_11D930]
        call sub_AA988
        mov eax, dword [dword_17D580]
        add esp, byte 4
        add eax, dword [byte ebp-08h]
        push dword [byte eax+02Ah]
        push dword [byte eax+026h]
        push dword [byte eax+01Ah]
        call sub_AAA40
        add esp, byte 0Ch
        push dword [dword_17BC78]
        call TextSetFont
        add esp, byte 4
.10:
        imul edx, dword [byte ebp-04Ch], byte 66h
        mov eax, dword [dword_17D580]
        mov word [byte edx+eax+018h], 0
        jmp short .12
.11:
        mov eax, dword [dword_17D580]
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
        add eax, str_dbgO
        add edi, edi
        mov dword [byte ebp-024h], eax
.13:
        mov eax, dword [byte ebp-030h]
        add dword [byte ebp-02Ch], byte 8
        add dword [byte ebp-024h], byte 40h
        inc dword [byte ebp-04Ch]
        movsx eax, word [dword eax+word_17D560]
        add esi, byte 66h
        cmp eax, dword [byte ebp-0Ch]
        jne short .14
        mov edx, dword [byte ebp-030h]
        movsx ebx, word [byte ebp-048h]
        mov eax, dword [dword_17D588]
        movsx edx, word [dword edx+word_17D562]
        call sub_6DB5C
        mov edx, eax
        mov eax, dword [dword_17D580]
        mov dword [byte esi+eax+01Ah], edx
        mov eax, dword [dword_17D580]
        or byte [byte esi+eax+046h], 2
        mov eax, dword [dword_17D580]
        mov dword [byte esi+eax+05Ah], sub_6DC2F
        mov eax, dword [dword_17D580]
        mov dword [byte esi+eax+062h], DrawControllerColumns
        jmp short .15
.14:
        mov eax, dword [dword_17D580]
        mov dword [byte esi+eax+01Ah], 0
.15:
        mov eax, dword [dword_17D580]
        mov dword [byte esi+eax+010h], 6
        mov eax, dword [dword_17D580]
        mov edx, dword [byte ebp-024h]
        mov dword [byte esi+eax+014h], edx
        mov edx, dword [byte ebp-028h]
        mov eax, dword [dword_17D580]
        movsx edx, word [byte edx+ebp-060h]
        mov dword [byte esi+eax+026h], edx
        mov eax, dword [dword_17D580]
        movsx edx, word [byte edi+ebp-068h]
        mov dword [byte esi+eax+02Ah], edx
        mov edx, dword [byte ebp-02Ch]
        mov eax, dword [dword_17D580]
        mov edx, dword [dword edx+dword_11DED0]
        mov dword [byte esi+eax+03Ah], edx
        mov edx, dword [byte ebp-02Ch]
        mov eax, dword [dword_17D580]
        mov edx, dword [dword edx+dword_11DED4]
        mov dword [byte esi+eax+03Eh], edx
        mov eax, dword [dword_17D580]
        add eax, esi
        cmp dword [byte eax+01Ah], byte 0
        je short .16
        push dword [byte eax+02Ah]
        push dword [byte eax+026h]
        push dword [byte eax+01Ah]
        call sub_AAA40
        add esp, byte 0Ch
.16:
        mov eax, dword [dword_17D580]
        movsx edx, word [byte ebp-060h]
        mov dword [byte esi+eax+04Ah], edx
        mov eax, dword [dword_17D580]
        movsx edx, word [byte edi+ebp-068h]
        mov dword [byte esi+eax+04Eh], edx
        mov eax, dword [byte ebp-010h]
        movsx edx, word [byte ebp-05Ch]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [dword_17D580]
        mov dword [byte esi+eax+052h], edx
        mov edx, dword [byte ebp-010h]
        movsx eax, word [byte edi+ebp-068h]
        movsx edx, word [byte edx+06h]
        add edx, eax
        mov eax, dword [dword_17D580]
        mov dword [byte esi+eax+056h], edx
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .20
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        jne short .18
        cmp dword [byte ebp-048h], byte 2
        jl short .19
.17:
        mov eax, dword [dword_17D580]
        mov word [byte esi+eax+018h], 2
        jmp short .20
.18:
        cmp dword [byte ebp-048h], byte 2
        jl short .17
.19:
        mov eax, dword [dword_17D580]
        mov word [byte esi+eax+018h], 1
.20:
        inc dword [byte ebp-0Ch]
        add dword [byte ebp-028h], byte 2
        cmp dword [byte ebp-0Ch], byte 3
        jl near .13
        inc dword [byte ebp-04Ch]
        imul eax, dword [byte ebp-04Ch], byte 66h
        mov edx, dword [dword_17D580]
        mov ebx, str_dbgO
        mov esi, dword [byte ebp-04Ch]
        mov dword [byte edx+eax+010h], 4
        shl esi, 6
        mov edx, dword [dword_17D580]
        add ebx, esi
        mov dword [byte edx+eax+014h], ebx
        mov edx, dword [dword_17D580]
        mov ebx, dword [dword esi+str_dbgO]
        mov dword [byte edx+eax+026h], ebx
        mov edx, dword [dword_17D580]
        mov ebx, dword [dword esi+dword_11D954]
        mov dword [byte edx+eax+02Ah], ebx
        mov ebx, dword [byte ebp-04Ch]
        mov edx, dword [dword_17D580]
        mov ecx, dword [nosplit ebx*8+dword_11DED0]
        mov dword [byte edx+eax+03Ah], ecx
        mov edx, dword [dword_17D580]
        mov ebx, dword [nosplit ebx*8+dword_11DED4]
        mov dword [byte edx+eax+03Eh], ebx
        mov edx, dword [dword_17D580]
        mov dword [byte edx+eax+032h], 0
        mov edx, dword [byte ebp-01Ch]
        movsx edx, word [dword edx+word_17D560]
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
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je short .22
.21:
        cmp dword [byte ebp-048h], byte 1
        jle near .23
        cmp word [word_114CE4], byte 0
        jne near .23
.22:
        push dword [dword_17BC74]
        call TextSetFont
        add esp, byte 4
        push str_Usri
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, eax
        imul eax, dword [byte ebp-04Ch], byte 66h
        mov dword [byte ebp-08h], eax
        mov eax, dword [dword_17D580]
        add esp, byte 8
        add eax, dword [byte ebp-08h]
        push str_Usrh
        mov dword [byte eax+01Ah], edx
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, eax
        mov eax, dword [dword_17D580]
        add eax, dword [byte ebp-08h]
        add esp, byte 8
        mov dword [byte eax+01Eh], edx
        push byte 20h
        movzx esi, byte [byte_11FA2F]
        push dword [byte ebp-014h]
        inc esi
        call fputchar
        imul eax, esi
        add esp, byte 4
        add eax, byte 10h
        push eax
        push str_Utext
        call sub_AB758
        mov edx, dword [byte ebp-018h]
        mov dword [dword edx+dword_11D940], eax
        mov eax, dword [dword_17D580]
        add eax, dword [byte ebp-08h]
        add esp, byte 0Ch
        mov edi, dword [dword edx+dword_11D940]
        mov esi, dword [byte eax+01Ah]
        push dword [byte ebp-014h]
        movsd
        movsd
        movsd
        movsd
        movsb
        call fputchar
        mov edx, eax
        mov eax, dword [byte ebp-018h]
        mov eax, dword [dword eax+dword_11D940]
        mov word [byte eax+04h], dx
        mov eax, dword [byte ebp-018h]
        movzx dx, byte [byte_11FA2F]
        mov esi, dword [byte ebp-04Ch]
        inc edx
        mov eax, dword [dword eax+dword_11D940]
        shl esi, 6
        mov word [byte eax+06h], dx
        mov eax, dword [byte ebp-018h]
        mov dx, word [dword esi+dword_11D910]
        mov eax, dword [dword eax+dword_11D940]
        sub edx, byte 4
        sub dx, word [byte eax+04h]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp-018h]
        mov dx, word [dword esi+dword_11D914]
        mov eax, dword [dword eax+dword_11D940]
        sub edx, byte 5
        add esp, byte 4
        mov word [byte eax+0Eh], dx
        mov eax, dword [byte ebp-018h]
        push dword [dword eax+dword_11D940]
        call sub_AA988
        mov eax, dword [byte ebp-014h]
        add esp, byte 4
        mov ebx, dword [dword esi+dword_11D914]
        mov edx, dword [dword esi+dword_11D910]
        sub ebx, byte 5
        sub edx, byte 4
        call DrawColorTextRight
        mov eax, dword [dword_17D580]
        add eax, dword [byte ebp-08h]
        mov edx, 20h
        mov eax, dword [byte eax+01Ah]
        call CopyBitmap
        mov edx, dword [byte ebp-018h]
        mov dword [dword edx+dword_11D930], eax
        mov eax, dword [dword_17D580]
        add eax, dword [byte ebp-08h]
        mov edx, dword [dword edx+dword_11D930]
        mov ax, word [byte eax+026h]
        mov word [byte edx+0Ch], ax
        mov edx, dword [dword_17D580]
        mov eax, dword [byte ebp-018h]
        add edx, dword [byte ebp-08h]
        mov eax, dword [dword eax+dword_11D930]
        mov dx, word [byte edx+02Ah]
        mov word [byte eax+0Eh], dx
        mov eax, dword [byte ebp-018h]
        push dword [dword eax+dword_11D930]
        call sub_AA988
        mov eax, dword [dword_17D580]
        add esp, byte 4
        add eax, dword [byte ebp-08h]
        push dword [byte eax+02Ah]
        push dword [byte eax+026h]
        push dword [byte eax+01Ah]
        call sub_AAA40
        add esp, byte 0Ch
        push dword [dword_17BC78]
        call TextSetFont
        add esp, byte 4
.23:
        imul edx, dword [byte ebp-04Ch], byte 66h
        mov eax, dword [dword_17D580]
        mov word [byte edx+eax+018h], 0
        jmp short .25
.24:
        mov edx, dword [dword_17D580]
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
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne near .32
        cmp word [word_17D560], byte 0
        je short .26
        cmp word [word_17D568], byte 0
        je short .26
        cmp word [word_17D570], byte 0
        je short .26
        cmp word [word_17D578], byte 0
        jne short .27
.26:
        push str_P11
        push dword [dword_17D588]
        call sub_E04E0
        add esp, byte 8
        mov edx, eax
        mov eax, dword [dword_17D580]
        push str_P12
        mov dword [dword eax+0812h], edx
        push dword [dword_17D588]
        call sub_E04E0
        add esp, byte 8
        mov edx, eax
        mov eax, dword [dword_17D580]
        push str_P13
        mov dword [dword eax+0816h], edx
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, eax
        mov eax, dword [dword_17D580]
        add esp, byte 8
        mov dword [dword eax+081Ah], edx
        jmp short .28
.27:
        push str_P1G
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, eax
        mov eax, dword [dword_17D580]
        add esp, byte 8
        mov dword [dword eax+0812h], edx
.28:
        mov eax, dword [dword_17D580]
        mov dword [dword eax+0808h], 8
        mov eax, dword [dword_17D580]
        mov dword [dword eax+080Ch], unk_11DE50
        mov eax, dword [dword_17D580]
        mov edx, dword [dword eax+0812h]
        movsx edx, word [byte edx+0Ch]
        mov dword [dword eax+081Eh], edx
        mov eax, dword [dword_17D580]
        mov edx, dword [dword eax+0812h]
        movsx edx, word [byte edx+0Eh]
        mov dword [dword eax+0822h], edx
        mov eax, dword [dword_17D580]
        mov edx, dword [dword_11DF70]
        mov dword [dword eax+0832h], edx
        mov eax, dword [dword_17D580]
        mov edx, dword [dword_11DF74]
        mov dword [dword eax+0836h], edx
        mov eax, dword [dword_17D580]
        push dword [dword eax+0822h]
        push dword [dword eax+081Eh]
        push dword [dword eax+0812h]
        call sub_AAA40
        movsx eax, word [word_17D560]
        add esp, byte 0Ch
        cmp eax, byte 2
        je short .29
        movsx eax, word [word_17D568]
        cmp eax, byte 2
        je short .29
        movsx eax, word [word_17D570]
        cmp eax, byte 2
        je short .29
        movsx eax, word [word_17D578]
        cmp eax, byte 2
        jne short .30
.29:
        push str_P21
        push dword [dword_17D588]
        call sub_E04E0
        add esp, byte 8
        mov edx, eax
        mov eax, dword [dword_17D580]
        push str_P22
        mov dword [dword eax+0878h], edx
        push dword [dword_17D588]
        call sub_E04E0
        add esp, byte 8
        mov edx, eax
        mov eax, dword [dword_17D580]
        push str_P23
        mov dword [dword eax+087Ch], edx
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, eax
        mov eax, dword [dword_17D580]
        add esp, byte 8
        mov dword [dword eax+0880h], edx
        jmp short .31
.30:
        push str_P2G
        push dword [dword_17D588]
        call sub_E04E0
        mov edx, eax
        mov eax, dword [dword_17D580]
        add esp, byte 8
        mov dword [dword eax+0878h], edx
.31:
        mov eax, dword [dword_17D580]
        mov dword [dword eax+086Eh], 8
        mov eax, dword [dword_17D580]
        mov dword [dword eax+0872h], unk_11DE90
        mov eax, dword [dword_17D580]
        mov edx, dword [dword eax+0878h]
        movsx edx, word [byte edx+0Ch]
        mov dword [dword eax+0884h], edx
        mov eax, dword [dword_17D580]
        mov edx, dword [dword eax+0878h]
        movsx edx, word [byte edx+0Eh]
        mov dword [dword eax+0888h], edx
        mov eax, dword [dword_17D580]
        mov edx, dword [dword_11DF78]
        mov dword [dword eax+0898h], edx
        mov eax, dword [dword_17D580]
        mov edx, dword [dword_11DF7C]
        mov dword [dword eax+089Ch], edx
        mov eax, dword [dword_17D580]
        push dword [dword eax+0888h]
        push dword [dword eax+0884h]
        push dword [dword eax+0878h]
        call sub_AAA40
        add esp, byte 0Ch
        jmp short .33
.32:
        mov eax, dword [dword_17D580]
        mov word [dword eax+0810h], 3
        mov eax, dword [dword_17D580]
        mov word [dword eax+0876h], 3
.33:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        or al, 6
        cwde
        call OpenScreen
        mov esi, dword [dword_17D580]
        mov ecx, 66h
        lea edi, [dword esi+08C4h]
        mov esi, dword_17BC7C
        rep movsb
        mov esi, dword [dword_17D580]
        mov ecx, 66h
        lea edi, [dword esi+092Ah]
        mov esi, dword_17BD48
        rep movsb
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        jne short .34
        mov esi, dword [dword_17D580]
        mov ecx, 66h
        lea edi, [dword esi+0990h]
        mov esi, dword_17BCE2
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
        mov eax, dword [dword_17D580]
        mov dl, byte [byte ebp-04h]
        mov byte [byte esi+eax+042h], dl
.37:
        mov eax, dword [byte ebp-048h]
        mov dword [byte ebp-08h], 5
        cdq
        idiv dword [byte ebp-08h]
        cmp edx, byte 1
        je short .38
        mov eax, dword [dword_17D580]
        mov byte [byte esi+eax+044h], ch
.38:
        mov eax, dword [byte ebp-048h]
        mov dword [byte ebp-08h], 5
        cdq
        idiv dword [byte ebp-08h]
        cmp edx, byte 3
        je short .39
        mov dl, byte [byte ebp-048h]
        mov eax, dword [dword_17D580]
        inc dl
        mov byte [byte esi+eax+045h], dl
.39:
        cmp ebx, byte 4
        jge short .40
        mov eax, dword [dword_17D580]
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
        mov eax, dword [dword_17D580]
        mov byte [byte eax+045h], 1
        mov eax, dword [dword_17D580]
        mov byte [dword eax+01DCh], 3
        mov eax, dword [dword_17D580]
        mov byte [dword eax+0243h], 6
        mov eax, dword [dword_17D580]
        mov byte [dword eax+03DAh], 8
        mov eax, dword [dword_17D580]
        mov byte [dword eax+0441h], 0Bh
        mov eax, dword [dword_17D580]
        mov byte [dword eax+05D8h], 0Dh
        mov eax, dword [dword_17D580]
        mov byte [dword eax+05D9h], 17h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+063Fh], 10h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+063Dh], 16h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+07D6h], 0Dh
        mov eax, dword [dword_17D580]
        mov byte [dword eax+07D7h], 17h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+07D5h], 17h
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 30h
        setne al
        movzx eax, al
        test eax, eax
        je short .42
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne short .42
        mov eax, dword [dword_17D580]
        mov byte [dword eax+06A3h], 14h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+083Ch], 16h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+083Dh], 15h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+083Ah], 10h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+076Fh], 15h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+08A2h], 14h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+08A3h], 17h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+08A0h], 12h
.42:
        mov eax, dword [dword_17D580]
        mov byte [dword eax+0908h], 16h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+0907h], 16h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+096Dh], 17h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+096Fh], 17h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+09D2h], 18h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+09D5h], 18h
        mov eax, dword [dword_17D580]
        mov byte [dword eax+09D4h], 18h
        call SetControllerColumn
        call sub_DD6C4
        call GetInputDevices
        mov dword [dword_17D584], eax
        mov eax, dword [dword_17D580]
        mov edx, dword [dword eax+0968h]
        mov eax, dword [dword eax+0964h]
        call SetMenuMouse
        mov dword [byte ebp-044h], 17h
        mov word [word_17D58E], 0FFFFh
        mov word [word_17D58C], 0FFFFh
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
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        add eax, byte 18h
        cmp eax, dword [byte ebp-044h]
        jle short .46
        imul eax, dword [byte ebp-044h], byte 66h
        mov edx, dword [dword_17D580]
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
        mov ax, word [word_114CE0]
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
        mov edx, dword [dword_17D580]
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
        jmp dword [nosplit cs:edx*4+jpt_6F02E]
ControllerScreen_11AB:
        cmp esi, byte 1
        jne near .60
        imul edx, dword [byte ebp-044h], byte 66h
        mov eax, dword [dword_17D580]
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
        movsx eax, word [word_114CE4]
        cmp eax, esi
        je short .48
.47:
        cmp dword [byte ebp-048h], byte 1
        jle near ControllerScreen_16D6.76
        cmp word [word_114CE4], byte 0
        jne near ControllerScreen_16D6.76
.48:
        mov eax, 35h
        mov esi, dword [byte ebp-048h]
        call PlaySfx
        mov eax, dword [byte ebp-048h]
        shl esi, 2
        movsx eax, word [nosplit eax*8+word_17D560]
        mov ecx, dword [dword esi+dword_11D930]
        cmp eax, byte 2
        sete al
        mov edx, dword [byte ebp-048h]
        movzx ebx, al
        mov eax, dword [dword_17D588]
        call ControllerUsersPanel
        mov edx, 0FEh
        mov eax, 0FDh
        call SetTextColors
        push dword [dword_17BC74]
        call TextSetFont
        add esp, byte 4
        cmp dword [dword esi+dword_11D940], byte 0
        je short .49
        push dword [dword esi+dword_11D940]
        call sub_AADA4
        add esp, byte 4
        push dword [dword esi+dword_11D940]
        call sub_ABF4C
        add esp, byte 4
.49:
        imul eax, dword [byte ebp-048h], byte 21h
        add eax, word_160ACC
        push byte 20h
        inc eax
        inc eax
        movzx esi, byte [byte_11FA2F]
        push eax
        inc esi
        mov dword [byte ebp-08h], eax
        call fputchar
        imul eax, esi
        add esp, byte 4
        add eax, byte 10h
        push eax
        push str_Utext
        call sub_AB758
        mov edx, dword [byte ebp-048h]
        shl edx, 2
        mov dword [dword edx+dword_11D940], eax
        mov eax, dword [byte ebp-044h]
        inc eax
        imul eax, byte 66h
        mov dword [byte ebp-034h], edx
        mov edi, dword [byte ebp-034h]
        mov edx, dword [dword_17D580]
        add esp, byte 0Ch
        mov edi, dword [dword edi+dword_11D940]
        mov esi, dword [byte edx+eax+01Ah]
        push dword [byte ebp-08h]
        movsd
        movsd
        movsd
        movsd
        movsb
        call fputchar
        mov edx, eax
        mov eax, dword [byte ebp-034h]
        mov eax, dword [dword eax+dword_11D940]
        mov word [byte eax+04h], dx
        mov eax, dword [byte ebp-034h]
        movzx dx, byte [byte_11FA2F]
        mov eax, dword [dword eax+dword_11D940]
        inc edx
        mov word [byte eax+06h], dx
        mov edx, dword [byte ebp-048h]
        lea eax, [edx+edx*4]
        add esp, byte 4
        shl eax, 6
        cmp word [nosplit edx*8+word_17D560], byte 0
        jne short .50
        mov edx, dword [byte ebp-034h]
        mov bx, word [dword eax+word_11D9A8]
        mov edx, dword [dword edx+dword_11D940]
        add ebx, byte 6
        mov word [byte edx+0Ch], bx
        mov dx, word [dword eax+word_11D9AC]
        jmp short .51
.50:
        mov ebx, dword [byte ebp-034h]
        mov dx, word [dword eax+word_11DA10]
        mov ebx, dword [dword ebx+dword_11D940]
        sub edx, byte 4
        sub dx, word [byte ebx+04h]
        mov word [byte ebx+0Ch], dx
        mov dx, word [dword eax+word_11DA14]
.51:
        mov eax, dword [byte ebp-034h]
        mov eax, dword [dword eax+dword_11D940]
        sub edx, byte 5
        mov word [byte eax+0Eh], dx
        mov eax, dword [byte ebp-048h]
        push dword [nosplit eax*4+dword_11D940]
        call sub_AA988
        mov edx, dword [byte ebp-048h]
        imul esi, edx, byte 21h
        add esp, byte 4
        lea eax, [edx+edx*4]
        add esi, word_160ACC
        shl eax, 6
        inc esi
        inc esi
        cmp word [nosplit edx*8+word_17D560], byte 0
        jne short .52
        mov ebx, dword [dword eax+word_11D9AC]
        mov edx, dword [dword eax+word_11D9A8]
        sub ebx, byte 5
        add edx, byte 6
        mov eax, esi
        call DrawColorText
        jmp short .53
.52:
        mov ebx, dword [dword eax+word_11DA14]
        mov edx, dword [dword eax+word_11DA10]
        sub ebx, byte 5
        sub edx, byte 4
        mov eax, esi
        call DrawColorTextRight
.53:
        push dword [dword_17BC78]
        call TextSetFont
        mov eax, dword [byte ebp-048h]
        add esp, byte 4
        lea edx, [eax+eax*4]
        cmp word [nosplit eax*8+word_17D560], byte 0
        jne short .54
        mov eax, edx
        jmp short .55
.54:
        lea eax, [byte edx+04h]
.55:
        imul edx, eax, byte 66h
        mov eax, dword [dword_17D580]
        mov edx, dword [byte edx+eax+03Eh]
        mov eax, dword [byte ebp-048h]
        lea ebx, [eax+eax*4]
        cmp word [nosplit eax*8+word_17D560], byte 0
        jne short .56
        mov eax, ebx
        jmp short .57
.56:
        lea eax, [byte ebx+04h]
.57:
        imul ebx, eax, byte 66h
        mov eax, dword [dword_17D580]
        mov eax, dword [byte ebx+eax+03Ah]
        call SetMenuMouse
        mov eax, dword [byte ebp-048h]
        lea edx, [eax+eax*4]
        cmp word [nosplit eax*8+word_17D560], byte 0
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
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        je near ControllerScreen_16D6.76
.61:
        cmp dword [byte ebp-048h], byte 1
        jle short .62
        cmp word [word_114CE4], byte 0
        je near ControllerScreen_16D6.76
.62:
        mov eax, 28h
        call GetLangText
        call LinkSyncWithMessage
        jmp near ControllerScreen_16D6.76
ControllerScreen_149D:
        movsx eax, word [dword eax+word_17D560]
        mov word [word_11D92E], 0
        cmp eax, byte 1
        jne short .64
.63:
        mov eax, dword [dword_17D580]
        mov edx, dword [byte ebp-044h]
        add eax, ebx
        jmp short .66
.64:
        mov eax, dword [byte ebp-044h]
        inc eax
        inc eax
.65:
        imul eax, byte 66h
        mov edx, dword [dword_17D580]
        add eax, edx
        mov edx, dword [byte ebp-044h]
.66:
        call DrawControllerColumns
        mov word [word_11D92E], 1
        jmp near ControllerScreen_16D6.76
ControllerScreen_14E4:
        mov word [word_11D92E], 0
        cmp word [dword eax+word_17D560], byte 0
        jne short ControllerScreen_149D.63
.67:
        mov eax, dword [dword_17D580]
        mov edx, dword [byte ebp-044h]
        add eax, ecx
        jmp short ControllerScreen_149D.66
ControllerScreen_1503:
        mov word [word_11D92E], 0
        cmp word [dword eax+word_17D560], byte 0
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
        mov ebx, dword [dword_17D162]
        mov eax, dword [optflags]
        add ebx, 2710h
        and eax, byte 70h
        jmp dword [nosplit cs:edx*4+jpt_6F042]
ControllerScreen_1548:
        cmp eax, byte 30h
        je near ControllerScreen_16D6.76
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne near ControllerScreen_16D6.76
        mov edx, dword [dword_17D580]
        cmp dword [dword edx+0816h], byte 0
        je near ControllerScreen_16D6.76
        mov edx, dword [gameopts]
        mov dword [dword_1843AC], 0
        mov edx, dword [byte edx+01h]
        shl edx, 0Fh
        shr edx, 1Bh
        mov dword [dword_1843B4], edx
        test byte [optflags], 70h
        jne short .69
        mov dword [dword_1843B0], 0
        jmp short .71
.69:
        cmp eax, byte 20h
        jne short .70
        cmp dword [dword_17D267], byte 0
        jne short .70
        mov dword [dword_1843B0], ebx
        jmp short .71
.70:
        mov eax, dword [dword_17CBE7]
        mov dword [dword_1843B0], eax
.71:
        mov dword [byte ebp-040h], 0Fh
        jmp near ControllerScreen_16D6.76
ControllerScreen_15D1:
        cmp eax, byte 30h
        je near ControllerScreen_16D6.76
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
        jne near ControllerScreen_16D6.76
        mov edx, dword [dword_17D580]
        cmp dword [dword edx+087Ch], byte 0
        je near ControllerScreen_16D6.76
        mov edx, dword [gameopts]
        mov dword [dword_1843AC], 1
        mov edx, dword [byte edx+01h]
        shl edx, 0Ah
        shr edx, 1Bh
        mov dword [dword_1843B4], edx
        test byte [optflags], 70h
        jne short .72
        mov dword [dword_1843B0], 0
        jmp short .74
.72:
        cmp eax, byte 20h
        jne short .73
        cmp dword [dword_17D267], byte 0
        jne short .73
        mov dword [dword_1843B0], ebx
        jmp short .74
.73:
        mov eax, dword [dword_17CBE7]
        mov dword [dword_1843B0], eax
.74:
        xor edx, edx
        xor ebx, ebx
        xor eax, eax
.75:
        mov esi, dword [gameopts]
        inc ebx
        inc ebx
        mov cx, word [dword eax+word_17D562]
        mov word [byte esi+ebx+07h], cx
        inc edx
        mov esi, dword [gameopts]
        cmp word [dword eax+word_17D560], byte 0
        sete cl
        add eax, byte 8
        mov byte [byte edx+esi+04h], cl
        cmp edx, byte 4
        jl short .75
        jmp near ControllerScreen_1548.71
ControllerScreen_168B:
        movsx eax, word [word_17D58E]
        cmp eax, byte 0FFFFFFFFh
        jne short ControllerScreen_16D6.76
        movsx eax, word [word_17D58C]
        cmp eax, byte 0FFFFFFFFh
        jne short ControllerScreen_16D6.76
        call SlideInSideBar
        mov eax, dword [byte ebp-06Ch]
        mov dword [byte ebp-040h], eax
        jmp short ControllerScreen_16D6.76
ControllerScreen_16B0:
        movsx eax, word [word_17D58E]
        cmp eax, byte 0FFFFFFFFh
        jne short ControllerScreen_16D6.76
        movsx eax, word [word_17D58C]
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
        cmp dword [dword esi+dword_11D930], byte 0
        je short .78
        push dword [dword esi+dword_11D930]
        call sub_ABF4C
        add esp, byte 4
        mov dword [dword esi+dword_11D930], 0
.78:
        cmp dword [dword esi+dword_11D940], byte 0
        je short .79
        push dword [dword esi+dword_11D940]
        call sub_ABF4C
        add esp, byte 4
        mov dword [dword esi+dword_11D940], 0
.79:
        cmp dword [dword edi+dword_17D564], byte 0
        je short .80
        push dword [dword edi+dword_17D564]
        call sub_ABF4C
        add esp, byte 4
        mov dword [dword edi+dword_17D564], 0
.80:
        add esi, byte 4
        add edi, byte 8
        cmp esi, byte 10h
        jne short .77
        push dword [dword_17D588]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_17D580]
        call sub_ABF4C
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
        mov cx, word [dword eax+word_17D562]
        mov word [byte esi+ebx+07h], cx
        inc edx
        mov ebx, dword [gameopts]
        cmp word [dword eax+word_17D560], byte 0
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
        mov word [word_11D92C], 1
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
        cmp dword [dword_1150D8], byte 0FFFFFFFFh
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
        mov word [word_11D92C], 0
        pop edx
        pop ecx
        pop ebx
        ret
unk_708A9:
        db 0FAh,01h,00h,00h,069h,00h,00h,00h,0F3h,01h,00h,00h,088h,00h,00h,00h
        db 0EAh,01h,00h,00h,0A9h,00h,00h,00h,0E2h,01h,00h,00h,0C7h,00h,00h,00h
        db 0D9h,01h,00h,00h,0E7h,00h,00h,00h,0CEh,01h,00h,00h,09h,01h,00h,00h
        db 0C5h,01h,00h,00h,027h,01h,00h,00h,0BCh,01h,00h,00h,049h,01h,00h,00h
        db 0AEh,01h,00h,00h,066h,01h,00h,00h,0C9h,01h,00h,00h,086h,01h,00h,00h
        db 0C9h,01h,00h,00h,0A6h,01h,00h,00h
unk_70901:
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
unk_70BC1:
        db 081h,00h,06Dh,00h,05Bh,00h,04Ah,00h,038h,00h
unk_70BCB:
        db 089h,00h,0C9h,00h,09h,01h,04Ah,01h,08Ch,01h
unk_70BD5:
        db 06Eh,00h,00h,00h,086h,00h,00h,00h,0Ah,01h,00h,00h,085h,00h,00h,00h
        db 034h,01h,00h,00h,06Bh,00h,00h,00h,059h,00h,00h,00h,0C6h,00h,00h,00h
        db 0F5h,00h,00h,00h,0C5h,00h,00h,00h,022h,01h,00h,00h,0ABh,00h,00h,00h
        db 048h,00h,00h,00h,06h,01h,00h,00h,0E4h,00h,00h,00h,05h,01h,00h,00h
        db 010h,01h,00h,00h,0EBh,00h,00h,00h,037h,00h,00h,00h,047h,01h,00h,00h
        db 0D3h,00h,00h,00h,046h,01h,00h,00h,0FEh,00h,00h,00h,02Ah,01h,00h,00h
        db 025h,00h,00h,00h,089h,01h,00h,00h,0C1h,00h,00h,00h,088h,01h,00h,00h
        db 0ECh,00h,00h,00h,06Bh,01h,00h,00h
unk_70C4D:
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
unk_70CED:
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
