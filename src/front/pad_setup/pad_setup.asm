; GrIP pad set-up screen and the joystick test screen (96 PC).
bits 32
%include "hockey.inc"
section s_201CD progbits alloc exec nowrite align=1
extern byte_11FA2E, byte_11FA2F, byte_151708, byte_151774, byte_151778, byte_158D2A, byte_158D2B, byte_158D2C
extern byte_158D2D, byte_17BDAE, byte_17CA24, byte_17CA3C, byte_17CA54, dword_114CB0, dword_114CB4, dword_117588
extern dword_11F5C0, dword_151698, dword_1516A8, dword_158CC0, dword_158CCC, dword_158CD0, dword_158CD4, dword_158D54
extern dword_158D64, dword_158D68, dword_158D6C, dword_158D70, dword_17BC78, TeamStatsBitmap, dword_17BD48, FillRect
extern TextStringWidth, GetGripButtonMap, GetInputDevices, GetTicks, InitInputDevices, LoadPackedFile, MessageBox, MouseRead
extern mousex, mousey, ReadJoystickBits, SetGripButtonMap, sprintf_, str_A, str_BKGD, str_BT00
extern str_BT01, str_BT02, str_D3, str_feB, str_GRIPCON, str_LTD0, str_Pal4, str_RGRIPCON
extern strcpy_, strlen_, OpenScreen, SlideInTitleBar, SlideInSideBar, SetScreenColors, BlackPalette, FadePalette
extern FadeOut, CopyBitmap, SetTextColors, DrawColorText, DrawColorTextRight, DrawColorTextCentred, InitMenuItems, RunMenu
extern SetMenuMouse, FillMusicStream, SoundSecondsToBytes, SoundIdle, GetLangText, DrawShapeAtOwnPos, PutBlockAtOwnPos, AllocMemBlock
extern FreeMemBlock, ClearScreenColour, DrawRectOutline, SetScreenTarget, FillRectColor, KbdGetKey, FindShape, TextSetFont
extern unk_121FC8, unk_151648, unk_1516B8, unk_151720, unk_2018D, word_11758C, word_151768, word_158CBA
extern word_158CBC, word_158D34, word_158D3C, word_158D44, word_158D46, word_158D74, word_158D76
global DrawGripPads, DrawGripPads_73B, DrawGripPads_73C, GripSetupScreen, UpdateJoystickTest, JoystickTestScreen
;-----------------------------------------------------------------------------
; DrawGripPads                                 201CD  96 PC, medium confidence
; Draws the GrIP set-up panel: each connected pad with its live direction and
; buttons (byte_151778) and its A / B (shoot / pass) button assignment
;-----------------------------------------------------------------------------
DrawGripPads:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 34h, 0
        mov dword [byte ebp-010h], 0
        mov dword [byte ebp-01Ch], 0
        mov dword [byte ebp-018h], 0
        xor esi, esi
.1:
        mov eax, dword [byte ebp-010h]
        cmp byte [dword eax+byte_151774], 0
        jbe near .35
        mov cl, byte [byte ebp-01Ch]
        mov eax, dword [byte_151778]
        sar eax, cl
        and eax, 0FFh
        mov edx, dword [byte ebp-018h]
        mov dword [byte ebp-04h], eax
        cmp eax, dword [dword edx+dword_158D54]
        je near .14
        test byte [byte ebp-04h], 1
        je near .5
        test byte [byte ebp-04h], 8
        je short .2
        movsx eax, word [word_158D76]
        push eax
        push eax
        push eax
        movsx edx, word [dword esi+word_158D3C]
        push edx
        add eax, eax
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        lea edx, [eax+eax]
        push edx
        movsx ebx, word [dword esi+word_158D3C]
        push ebx
        add eax, edx
        jmp near .4
.2:
        test byte [byte ebp-04h], 4
        je short .3
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        add eax, eax
        push eax
        movsx edx, word [dword esi+word_158D3C]
        push edx
        push eax
        call FillRect
        add esp, byte 14h
        movsx eax, word [word_158D76]
        push eax
        push eax
        push eax
        movsx edx, word [dword esi+word_158D3C]
        add eax, eax
        push edx
        add eax, eax
        jmp short .4
.3:
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        push eax
        movsx edx, word [dword esi+word_158D3C]
        push edx
        add eax, eax
        push eax
        call FillRect
        add esp, byte 14h
        movsx edi, word [word_158D76]
        push edi
        push edi
        push edi
        movsx eax, word [dword esi+word_158D3C]
        push eax
        lea eax, [edi+edi]
        add eax, edi
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        push eax
        movsx edx, word [dword esi+word_158D3C]
        add eax, eax
        push edx
        add eax, eax
.4:
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        lea edx, [eax+eax*2]
        push edx
        movsx edx, word [dword esi+word_158D3C]
        add edx, eax
        push edx
        add eax, eax
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        lea edx, [eax+eax*2]
        push edx
        add eax, eax
        movsx edx, word [dword esi+word_158D3C]
        add edx, eax
        push edx
        jmp near .13
.5:
        test byte [byte ebp-04h], 2
        je near .9
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        lea edx, [eax+eax*2]
        push edx
        movsx edx, word [dword esi+word_158D3C]
        push edx
        add eax, eax
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        lea edx, [eax+eax*2]
        push edx
        movsx edx, word [dword esi+word_158D3C]
        add edx, eax
        push edx
        add eax, eax
        push eax
        call FillRect
        add esp, byte 14h
        test byte [byte ebp-04h], 8
        je short .6
        movsx eax, word [word_158D76]
        push eax
        push eax
        movsx edx, word [dword esi+word_158D3C]
        push eax
        add eax, eax
        add edx, eax
        push edx
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        movsx edi, word [word_158D76]
        push edi
        lea eax, [edi+edi]
        movsx edx, word [dword esi+word_158D3C]
        push eax
        add edx, eax
        push edx
        add eax, edi
        jmp near .13
.6:
        test byte [byte ebp-04h], 4
        je short .8
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        add eax, eax
        movsx edx, word [dword esi+word_158D3C]
        push eax
        add edx, eax
        push edx
        push eax
        call FillRect
        add esp, byte 14h
        movsx eax, word [word_158D76]
        push eax
.7:
        push eax
        movsx edx, word [dword esi+word_158D3C]
        push eax
        add eax, eax
        add edx, eax
        push edx
        add eax, eax
        jmp near .13
.8:
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        movsx edx, word [dword esi+word_158D3C]
        push eax
        add eax, eax
        add edx, eax
        push edx
        push eax
        call FillRect
        add esp, byte 14h
        movsx eax, word [word_158D76]
        push eax
        push eax
        movsx ebx, word [dword esi+word_158D3C]
        push eax
        lea edx, [eax+eax]
        add ebx, edx
        push ebx
        add eax, edx
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        movsx eax, word [word_158D76]
        jmp short .7
.9:
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        lea edx, [eax+eax*2]
        push edx
        movsx edx, word [dword esi+word_158D3C]
        push edx
        add eax, eax
        push eax
        call FillRect
        add esp, byte 14h
        test byte [byte ebp-04h], 8
        je short .10
        movsx eax, word [word_158D76]
        push eax
        push eax
        movsx edx, word [dword esi+word_158D3C]
        push eax
        add edx, eax
        push edx
        add eax, eax
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        lea edx, [eax+eax]
        movsx ebx, word [dword esi+word_158D3C]
        push edx
        add ebx, eax
        push ebx
        add eax, edx
        jmp near .12
.10:
        test byte [byte ebp-04h], 4
        je short .11
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        lea edx, [eax+eax]
        movsx ebx, word [dword esi+word_158D3C]
        push edx
        add eax, ebx
        push eax
        push edx
        call FillRect
        add esp, byte 14h
        movsx eax, word [word_158D76]
        push eax
        push eax
        movsx edx, word [dword esi+word_158D3C]
        push eax
        add edx, eax
        add eax, eax
        push edx
        add eax, eax
        jmp short .12
.11:
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        movsx edx, word [dword esi+word_158D3C]
        push eax
        add edx, eax
        push edx
        add eax, eax
        push eax
        call FillRect
        add esp, byte 14h
        movsx edi, word [word_158D76]
        push edi
        push edi
        movsx eax, word [dword esi+word_158D3C]
        push edi
        add eax, edi
        push eax
        lea eax, [edi+edi]
        add eax, edi
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        movsx edx, word [dword esi+word_158D3C]
        push eax
        add edx, eax
        add eax, eax
        push edx
        add eax, eax
.12:
        push eax
        call FillRect
        add esp, byte 14h
        push byte 2
        movsx eax, word [word_158D76]
        push eax
        lea edx, [eax+eax*2]
        push edx
        add eax, eax
        movsx edx, word [dword esi+word_158D3C]
        add edx, eax
        push edx
.13:
        push eax
        call FillRect
        add esp, byte 14h
        mov edx, dword [byte ebp-018h]
        mov eax, dword [byte ebp-04h]
        mov dword [dword edx+dword_158D54], eax
.14:
        imul eax, dword [byte ebp-010h], byte 0Ah
        movsx edi, word [dword esi+word_158D3C]
        mov dword [byte ebp-0Ch], eax
        test byte [byte ebp-04h], 10h
        setne al
        movzx edx, al
        movsx eax, byte [dword esi+byte_158D2C]
        xor eax, edx
        je short .17
        lea edx, [byte edi+01h]
        test byte [byte ebp-04h], 10h
        je short .15
        movsx eax, word [word_158D76]
        mov ebx, eax
        sar ebx, 1
        add ebx, eax
        push byte 2
        jmp short .16
.15:
        movsx eax, word [word_158D76]
        mov ebx, eax
        sar ebx, 1
        add ebx, eax
        push byte 1
.16:
        dec ebx
        push ebx
        lea ebx, [byte eax-01h]
        imul eax, byte 6
        push ebx
        push edx
        inc eax
        push eax
        call FillRect
        add esp, byte 14h
        movzx ebx, byte [byte_11FA2F]
        movsx eax, word [word_158D76]
        sar ebx, 1
        lea edx, [edi+eax]
        sub edx, ebx
        lea ebx, [byte edx-03h]
        imul edx, eax, byte 6
        sar eax, 1
        add eax, edx
        lea edx, [byte eax+01h]
        mov eax, str_A
        call DrawColorTextCentred
        test byte [byte ebp-04h], 10h
        setne al
        mov byte [dword esi+byte_158D2C], al
.17:
        cmp word [dword esi+word_158D34], byte 0
        jne short .18
        movsx eax, word [word_158D76]
        mov ebx, eax
        lea edx, [edi+eax]
        sar ebx, 1
        push byte 4
        jmp short .19
.18:
        movsx eax, word [word_158D76]
        mov edx, eax
        lea ebx, [edi+eax]
        sar edx, 1
        push byte 1
.19:
        add edx, ebx
        push edx
        imul edx, eax, byte 7
        imul eax, byte 6
        push edx
        push edi
        push eax
        call DrawRectOutline
        add esp, byte 14h
        imul eax, dword [byte ebp-0Ch], byte 66h
        mov edx, dword [dword_158D70]
        add eax, edx
        lea edx, [byte edi+02h]
        cmp dword [byte eax+04h], byte 0
        je short .20
        movsx eax, word [word_158D76]
        lea ebx, [edi+eax]
        mov dword [byte ebp-02Ch], ebx
        mov ebx, eax
        sar ebx, 1
        add ebx, dword [byte ebp-02Ch]
        push byte 0Eh
        jmp short .21
.20:
        movsx eax, word [word_158D76]
        lea ebx, [edi+eax]
        mov dword [byte ebp-02Ch], ebx
        mov ebx, eax
        sar ebx, 1
        add ebx, dword [byte ebp-02Ch]
        push byte 4
.21:
        dec ebx
        dec ebx
        push ebx
        imul ebx, eax, byte 7
        imul eax, byte 6
        dec ebx
        dec ebx
        push ebx
        push edx
        inc eax
        inc eax
        push eax
        call DrawRectOutline
        add esp, byte 14h
        movsx eax, word [word_158D76]
        inc dword [byte ebp-0Ch]
        lea edx, [byte eax+09h]
        movsx ebx, byte [dword esi+byte_158D2D]
        add edi, edx
        test byte [byte ebp-04h], 20h
        setne dl
        movzx edx, dl
        xor edx, ebx
        je short .24
        lea edx, [byte edi+01h]
        mov dword [byte ebp-024h], edx
        lea edx, [byte eax-01h]
        imul ebx, eax, byte 6
        mov ecx, eax
        sar ecx, 1
        inc ebx
        add eax, ecx
        dec eax
        test byte [byte ebp-04h], 20h
        je short .22
        push byte 2
        jmp short .23
.22:
        push byte 1
.23:
        push eax
        push edx
        push dword [byte ebp-024h]
        push ebx
        call FillRect
        add esp, byte 14h
        movzx edx, byte [byte_11FA2F]
        movsx eax, word [word_158D76]
        sar edx, 1
        lea ebx, [edi+eax]
        sub ebx, edx
        imul edx, eax, byte 6
        sar eax, 1
        sub ebx, byte 3
        add edx, eax
        mov eax, str_feB
        inc edx
        call DrawColorTextCentred
        test byte [byte ebp-04h], 20h
        setne al
        mov byte [dword esi+byte_158D2D], al
.24:
        cmp word [dword esi+word_158D34], byte 0
        je short .25
        movsx eax, word [word_158D76]
        mov ebx, eax
        lea edx, [edi+eax]
        sar ebx, 1
        push byte 4
        jmp short .26
.25:
        movsx eax, word [word_158D76]
        mov edx, eax
        lea ebx, [edi+eax]
        sar edx, 1
        push byte 1
.26:
        add edx, ebx
        push edx
        imul edx, eax, byte 7
        imul eax, byte 6
        push edx
        push edi
        push eax
        call DrawRectOutline
        add esp, byte 14h
        imul eax, dword [byte ebp-0Ch], byte 66h
        mov edx, dword [dword_158D70]
        add eax, edx
        lea edx, [byte edi+02h]
        cmp dword [byte eax+04h], byte 0
        je short .27
        movsx eax, word [word_158D76]
        lea ebx, [edi+eax]
        mov dword [byte ebp-02Ch], ebx
        mov ebx, eax
        sar ebx, 1
        add ebx, dword [byte ebp-02Ch]
        push byte 0Eh
        jmp short .28
.27:
        movsx eax, word [word_158D76]
        mov ecx, eax
        lea ebx, [edi+eax]
        sar ecx, 1
        add ebx, ecx
        push byte 4
.28:
        dec ebx
        dec ebx
        push ebx
        imul ebx, eax, byte 7
        imul eax, byte 6
        dec ebx
        dec ebx
        push ebx
        push edx
        inc eax
        inc eax
        push eax
        call DrawRectOutline
        add esp, byte 14h
        movsx eax, word [word_158D76]
        imul eax, byte 0Ah
        mov dword [byte ebp-08h], eax
        lea eax, [byte edi+02h]
        mov dword [byte ebp-020h], eax
        mov eax, dword [byte ebp-018h]
        inc dword [byte ebp-0Ch]
        mov dword [byte ebp-034h], eax
        imul eax, dword [byte ebp-0Ch], byte 66h
        mov dword [byte ebp-014h], 0
        mov dword [byte ebp-028h], esi
        mov dword [byte ebp-030h], eax
.29:
        mov eax, dword [byte ebp-010h]
        movzx eax, byte [dword eax+byte_151774]
        cmp eax, dword [byte ebp-014h]
        jle near .34
        mov eax, dword [byte ebp-028h]
        movsx eax, word [dword eax+word_158D34]
        add eax, eax
        add eax, dword [byte ebp-034h]
        movsx eax, word [dword eax+word_158D44]
        cmp eax, dword [byte ebp-014h]
        jne short .30
        movsx eax, word [word_158D76]
        mov ebx, eax
        lea edx, [edi+eax]
        sar ebx, 1
        push byte 4
        jmp short .31
.30:
        movsx eax, word [word_158D76]
        mov ebx, eax
        lea edx, [edi+eax]
        sar ebx, 1
        push byte 1
.31:
        add edx, ebx
        push edx
        add eax, dword [byte ebp-08h]
        push eax
        push edi
        push dword [byte ebp-08h]
        call DrawRectOutline
        add esp, byte 14h
        mov eax, dword [dword_158D70]
        mov edx, dword [byte ebp-08h]
        add eax, dword [byte ebp-030h]
        inc edx
        inc edx
        cmp dword [byte eax+04h], byte 0
        je short .32
        movsx eax, word [word_158D76]
        mov ecx, eax
        lea ebx, [edi+eax]
        sar ecx, 1
        add ebx, ecx
        push byte 0Eh
        jmp short .33
.32:
        movsx eax, word [word_158D76]
        mov ecx, eax
        lea ebx, [edi+eax]
        sar ecx, 1
        add ebx, ecx
        push byte 4
.33:
        dec ebx
        dec ebx
        add eax, dword [byte ebp-08h]
        push ebx
        dec eax
        dec eax
        push eax
        push dword [byte ebp-020h]
        push edx
        call DrawRectOutline
        add esp, byte 14h
        add dword [byte ebp-030h], byte 66h
        inc dword [byte ebp-0Ch]
.34:
        movsx eax, word [word_158D76]
        inc eax
        inc eax
        inc dword [byte ebp-014h]
        add dword [byte ebp-08h], eax
        cmp dword [byte ebp-014h], byte 8
        jl near .29
.35:
        add dword [byte ebp-01Ch], byte 8
        add dword [byte ebp-018h], byte 4
        inc dword [byte ebp-010h]
        inc esi
        inc esi
        cmp dword [byte ebp-010h], byte 4
        jl near .1
DrawGripPads_73B:
        leave
DrawGripPads_73C:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GripSetupScreen                                                 2090F  96 PC
; Start-up screen when GrIP pads are connected (GRIPCON / RGRIPCON art): pick
; the buttons that shoot and pass on each pad (SetGripButtonMap /
; GetGripButtonMap, kept in byte_17CA54), Enter to go on
;-----------------------------------------------------------------------------
GripSetupScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 360h, 0
        mov eax, byte_17CA54
        call SetGripButtonMap
        call GetInputDevices
        test al, 2
        jne short .1
        test al, 4
        jne short .1
        test al, 8
        jne short .1
        test al, 10h
        je near .29
.1:
        push byte 0
        push dword 1056h
        push str_GRIPCON
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 0A00h
        mov esi, unk_121FC8
        push str_RGRIPCON
        lea edi, [dword ebp-0360h]
        mov dword [dword_158D70], eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov ecx, 300h
        mov dword [dword_158D6C], eax
        rep movsb
        lea eax, [dword ebp-0360h]
        call SetScreenColors
        call BlackPalette
        push byte 1
        call ClearScreenColour
        add esp, byte 4
        push dword [dword_17BC78]
        call TextSetFont
        add esp, byte 4
        movzx eax, byte [byte_11FA2F]
        push byte 4
        add eax, byte 3
        push eax
        push dword [dword_11F5C0]
        push byte 0
        push byte 0
        call FillRect
        mov eax, 1B0h
        add esp, byte 14h
        mov ebx, 1
        mov edx, 4
        call GetLangText
        call DrawColorText
        mov eax, 1B1h
        mov ebx, 1
        mov edx, 27Dh
        call GetLangText
        call DrawColorTextRight
        mov eax, 2
        call OpenScreen
        mov eax, 29h
        mov edx, dword [dword_158D70]
        call InitMenuItems
        call SetScreenTarget
        movzx ax, byte [byte_11FA2F]
        mov word [word_158D74], ax
        movzx ax, byte [byte_11FA2E]
        cmp ax, word [word_158D74]
        jg short .2
        mov ax, word [word_158D74]
.2:
        mov word [word_158D76], ax
        mov dword [byte ebp-024h], 0FFFFFFFFh
        mov dword [byte ebp-014h], 0
        mov dword [byte ebp-020h], unk_151648
        mov dword [byte ebp-01Ch], unk_1516B8
        movzx esi, byte [byte_11FA2F]
        xor edi, edi
        add esi, byte 14h
        mov dword [byte ebp-010h], edi
.3:
        push byte 4
        push esi
        push dword [dword_11F5C0]
        push esi
        push byte 0
        call FillRectColor
        movzx edx, byte [byte_11FA2F]
        movsx eax, word [word_158D76]
        sub eax, edx
        sar eax, 1
        add esp, byte 14h
        inc eax
        inc eax
        push byte 4
        add esi, eax
        push esi
        push dword [dword_11F5C0]
        push esi
        push byte 0
        call FillRectColor
        movzx eax, byte [byte_11FA2F]
        movsx edx, word [word_158D76]
        sub edx, eax
        mov eax, edx
        sar eax, 1
        add esp, byte 14h
        add eax, byte 6
        xor edx, edx
        add esi, eax
        mov eax, 0Fh
        call SetTextColors
        mov eax, dword [byte ebp-014h]
        inc eax
        push eax
        mov eax, 1B2h
        call GetLangText
        push eax
        lea eax, [byte ebp-060h]
        push eax
        mov ebx, esi
        call sprintf_
        movsx edx, word [word_158D76]
        add esp, byte 0Ch
        lea eax, [byte ebp-060h]
        add edx, edx
        call DrawColorText
        mov eax, 0Eh
        xor edx, edx
        call SetTextColors
        imul eax, dword [byte ebp-014h], byte 0Ah
        mov dword [byte ebp-038h], eax
        mov eax, dword [byte ebp-014h]
        cmp byte [dword eax+byte_151774], 0
        je near .17
        mov eax, dword [byte ebp-01Ch]
        call strlen_
        test eax, eax
        je short .4
        movsx edx, word [word_158D76]
        imul edx, byte 6
        mov eax, dword [byte ebp-01Ch]
        mov ebx, esi
        call DrawColorText
.4:
        mov eax, 0Fh
        xor edx, edx
        call SetTextColors
        mov eax, dword [byte ebp-020h]
        call strlen_
        test eax, eax
        je short .5
        mov ax, word [dword edi+word_151768]
        xor ah, ah
        movzx eax, ax
        push eax
        movzx eax, word [dword edi+word_151768]
        sar eax, 8
        and eax, 0FFh
        push eax
        push dword [byte ebp-020h]
        mov eax, 1B3h
        call GetLangText
        push eax
        lea eax, [byte ebp-060h]
        push eax
        call sprintf_
        add esp, byte 14h
        jmp short .6
.5:
        mov eax, 1B4h
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-060h]
        call strcpy_
.6:
        mov eax, dword [byte ebp-01Ch]
        mov dword [byte ebp-02Ch], esi
        call strlen_
        test eax, eax
        je short .7
        push dword [byte ebp-01Ch]
        call TextStringWidth
        add esp, byte 4
        add eax, byte 5
.7:
        movsx edx, word [word_158D76]
        imul edx, byte 6
        mov ebx, dword [byte ebp-02Ch]
        add edx, eax
        lea eax, [byte ebp-060h]
        call DrawColorText
        movzx eax, byte [byte_11FA2F]
        add eax, byte 5
        mov edx, dword [byte ebp-010h]
        add esi, eax
        mov eax, dword [byte ebp-010h]
        mov word [dword edi+word_158D34], 0
        mov edx, dword [dword edx+dword_151698]
        mov word [dword eax+word_158D44], 0
.8:
        test dl, 1
        jne short .9
        sar edx, 1
        inc word [dword eax+word_158D44]
        jmp short .8
.9:
        mov edx, dword [dword eax+dword_1516A8]
        mov word [dword eax+word_158D46], 0
        mov eax, dword [byte ebp-010h]
.10:
        test dl, 1
        jne short .11
        sar edx, 1
        inc word [dword eax+word_158D46]
        jmp short .10
.11:
        movsx eax, word [word_158D76]
        imul ebx, eax, byte 6
        mov eax, dword [byte ebp-038h]
        mov edx, dword [dword_158D6C]
        shl eax, 6
        mov word [dword edi+word_158D3C], si
        mov dword [edx+eax], ebx
        mov edx, dword [dword_158D6C]
        mov dword [byte edx+eax+04h], esi
        movsx edx, word [word_158D76]
        imul ebx, edx, byte 7
        mov edx, dword [dword_158D6C]
        mov dword [byte edx+eax+08h], ebx
        mov edx, dword [dword_158D6C]
        mov ebx, dword [byte edx+eax+04h]
        mov dword [byte edx+eax+0Ch], ebx
        mov edx, dword [dword_158D6C]
        mov ebx, dword [byte edx+eax+08h]
        mov dword [byte edx+eax+010h], ebx
        movsx edx, word [word_158D76]
        lea ebx, [esi+edx]
        sar edx, 1
        add ebx, edx
        mov edx, dword [dword_158D6C]
        mov dword [byte edx+eax+014h], ebx
        mov edx, dword [dword_158D6C]
        mov ebx, dword [edx+eax]
        mov dword [byte edx+eax+018h], ebx
        mov edx, dword [dword_158D6C]
        mov ebx, dword [byte edx+eax+014h]
        mov dword [byte edx+eax+01Ch], ebx
        imul edx, dword [byte ebp-038h], byte 66h
        mov ebx, dword [dword_158D70]
        mov dword [byte edx+ebx+010h], 4
        mov ebx, dword [dword_158D6C]
        add ebx, eax
        mov dword [byte ebp-03Ch], ebx
        mov ebx, dword [dword_158D70]
        mov ecx, dword [byte ebp-03Ch]
        mov dword [byte edx+ebx+014h], ecx
        mov ebx, dword [dword_158D6C]
        mov ebx, dword [byte ebx+eax+010h]
        sub ebx, byte 5
        mov dword [byte ebp-03Ch], ebx
        mov ebx, dword [dword_158D70]
        mov ecx, dword [byte ebp-03Ch]
        mov dword [byte edx+ebx+03Ah], ecx
        mov ebx, dword [dword_158D6C]
        mov eax, dword [byte ebx+eax+014h]
        mov ebx, dword [dword_158D70]
        sub eax, byte 5
        mov dword [byte edx+ebx+03Eh], eax
        movsx eax, word [word_158D76]
        mov ebx, eax
        lea edx, [esi+eax]
        sar ebx, 1
        push byte 4
        add edx, ebx
        push edx
        imul edx, eax, byte 7
        imul eax, byte 6
        push edx
        push esi
        push eax
        call DrawRectOutline
        movsx eax, word [word_158D76]
        mov edx, eax
        lea ebx, [esi+eax]
        sar edx, 1
        add esp, byte 14h
        add edx, ebx
        push byte 4
        dec edx
        dec edx
        push edx
        imul edx, eax, byte 7
        imul eax, byte 6
        dec edx
        dec edx
        push edx
        lea edx, [byte esi+02h]
        push edx
        inc eax
        inc eax
        push eax
        call DrawRectOutline
        movzx edx, byte [byte_11FA2F]
        movsx eax, word [word_158D76]
        sar edx, 1
        lea ebx, [esi+eax]
        sub ebx, edx
        imul edx, eax, byte 6
        add esp, byte 14h
        sar eax, 1
        sub ebx, byte 3
        add edx, eax
        mov eax, str_A
        inc edx
        call DrawColorTextCentred
        movzx edx, byte [byte_11FA2F]
        movsx eax, word [word_158D76]
        sar edx, 1
        lea ebx, [esi+eax]
        sub ebx, edx
        imul edx, eax, byte 0Ah
        mov eax, 1B5h
        sub ebx, byte 3
        call GetLangText
        call DrawColorText
        movsx eax, word [word_158D76]
        lea edx, [byte eax+09h]
        imul ebx, eax, byte 6
        inc dword [byte ebp-038h]
        add esi, edx
        mov eax, dword [byte ebp-038h]
        mov edx, dword [dword_158D6C]
        shl eax, 6
        mov dword [edx+eax], ebx
        mov edx, dword [dword_158D6C]
        mov dword [byte edx+eax+04h], esi
        movsx ebx, word [word_158D76]
        imul ebx, byte 7
        mov edx, dword [dword_158D6C]
        mov dword [byte edx+eax+08h], ebx
        mov edx, dword [dword_158D6C]
        mov ebx, dword [byte edx+eax+04h]
        mov dword [byte edx+eax+0Ch], ebx
        mov edx, dword [dword_158D6C]
        mov ebx, dword [byte edx+eax+08h]
        mov dword [byte edx+eax+010h], ebx
        movsx edx, word [word_158D76]
        lea ebx, [esi+edx]
        sar edx, 1
        add ebx, edx
        mov edx, dword [dword_158D6C]
        mov dword [byte edx+eax+014h], ebx
        mov edx, dword [dword_158D6C]
        mov ebx, dword [edx+eax]
        mov dword [byte edx+eax+018h], ebx
        mov edx, dword [dword_158D6C]
        mov ebx, dword [byte edx+eax+014h]
        mov dword [byte edx+eax+01Ch], ebx
        imul edx, dword [byte ebp-038h], byte 66h
        mov ebx, dword [dword_158D70]
        mov dword [byte edx+ebx+010h], 4
        mov ebx, dword [dword_158D6C]
        add ebx, eax
        mov dword [byte ebp-03Ch], ebx
        mov ebx, dword [dword_158D70]
        mov ecx, dword [byte ebp-03Ch]
        mov dword [byte edx+ebx+014h], ecx
        mov ebx, dword [dword_158D6C]
        mov ebx, dword [byte ebx+eax+010h]
        sub ebx, byte 5
        mov dword [byte ebp-03Ch], ebx
        mov ebx, dword [dword_158D70]
        mov ecx, dword [byte ebp-03Ch]
        mov dword [byte edx+ebx+03Ah], ecx
        mov ebx, dword [dword_158D6C]
        mov ebx, dword [byte ebx+eax+014h]
        mov eax, dword [dword_158D70]
        sub ebx, byte 5
        mov dword [byte edx+eax+03Eh], ebx
        movsx eax, word [word_158D76]
        mov ebx, eax
        lea edx, [esi+eax]
        sar ebx, 1
        add edx, ebx
        push byte 4
        dec edx
        dec edx
        push edx
        imul edx, eax, byte 7
        imul eax, byte 6
        dec edx
        dec edx
        push edx
        lea edx, [byte esi+02h]
        push edx
        inc eax
        inc eax
        push eax
        mov dword [byte ebp-03Ch], edx
        call DrawRectOutline
        movzx edx, byte [byte_11FA2F]
        movsx eax, word [word_158D76]
        sar edx, 1
        lea ebx, [esi+eax]
        sub ebx, edx
        imul edx, eax, byte 6
        add esp, byte 14h
        sar eax, 1
        sub ebx, byte 3
        add edx, eax
        mov eax, str_feB
        inc edx
        call DrawColorTextCentred
        movsx eax, word [word_158D76]
        imul eax, byte 0Ah
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp-03Ch]
        mov dword [byte ebp-028h], eax
        mov eax, dword [byte ebp-010h]
        inc dword [byte ebp-038h]
        mov dword [byte ebp-030h], eax
        imul eax, dword [byte ebp-038h], byte 66h
        mov dword [byte ebp-018h], eax
        mov eax, dword [byte ebp-038h]
        mov dword [byte ebp-04h], 0
        shl eax, 6
        mov dword [byte ebp-034h], edi
        mov dword [byte ebp-08h], eax
.12:
        mov eax, dword [byte ebp-014h]
        movzx eax, byte [dword eax+byte_151774]
        cmp eax, dword [byte ebp-04h]
        jle near .15
        mov edx, dword [dword_158D6C]
        add edx, dword [byte ebp-08h]
        mov eax, dword [byte ebp-0Ch]
        mov dword [edx], eax
        mov eax, dword [dword_158D6C]
        add eax, dword [byte ebp-08h]
        mov dword [byte eax+04h], esi
        mov eax, dword [dword_158D6C]
        movsx edx, word [word_158D76]
        add eax, dword [byte ebp-08h]
        add edx, dword [byte ebp-0Ch]
        mov dword [byte eax+08h], edx
        mov eax, dword [dword_158D6C]
        add eax, dword [byte ebp-08h]
        mov edx, dword [byte eax+04h]
        mov dword [byte eax+0Ch], edx
        mov eax, dword [dword_158D6C]
        add eax, dword [byte ebp-08h]
        mov edx, dword [byte eax+08h]
        mov dword [byte eax+010h], edx
        movsx eax, word [word_158D76]
        lea edx, [esi+eax]
        sar eax, 1
        add edx, eax
        mov eax, dword [dword_158D6C]
        add eax, dword [byte ebp-08h]
        mov dword [byte eax+014h], edx
        mov eax, dword [dword_158D6C]
        add eax, dword [byte ebp-08h]
        mov edx, dword [eax]
        mov dword [byte eax+018h], edx
        mov eax, dword [dword_158D6C]
        add eax, dword [byte ebp-08h]
        mov edx, dword [byte eax+014h]
        mov dword [byte eax+01Ch], edx
        mov eax, dword [dword_158D70]
        add eax, dword [byte ebp-018h]
        mov dword [byte eax+010h], 4
        mov edx, dword [byte ebp-08h]
        mov eax, dword [dword_158D6C]
        add edx, eax
        mov eax, dword [dword_158D70]
        add eax, dword [byte ebp-018h]
        mov dword [byte eax+014h], edx
        mov eax, dword [dword_158D6C]
        add eax, dword [byte ebp-08h]
        mov edx, dword [byte eax+010h]
        mov eax, dword [dword_158D70]
        add eax, dword [byte ebp-018h]
        sub edx, byte 5
        mov dword [byte eax+03Ah], edx
        mov eax, dword [dword_158D6C]
        add eax, dword [byte ebp-08h]
        mov edx, dword [byte eax+014h]
        mov eax, dword [dword_158D70]
        add eax, dword [byte ebp-018h]
        sub edx, byte 5
        mov dword [byte eax+03Eh], edx
        mov eax, dword [byte ebp-034h]
        movsx eax, word [dword eax+word_158D34]
        add eax, eax
        add eax, dword [byte ebp-030h]
        movsx eax, word [dword eax+word_158D44]
        cmp eax, dword [byte ebp-04h]
        jne short .13
        movsx eax, word [word_158D76]
        mov edx, eax
        lea ebx, [esi+eax]
        sar edx, 1
        push byte 4
        jmp short .14
.13:
        movsx eax, word [word_158D76]
        mov ebx, eax
        lea edx, [esi+eax]
        sar ebx, 1
        push byte 1
.14:
        add edx, ebx
        push edx
        add eax, dword [byte ebp-0Ch]
        push eax
        push esi
        push dword [byte ebp-0Ch]
        call DrawRectOutline
        add esp, byte 14h
        movsx eax, word [word_158D76]
        mov edx, eax
        lea ebx, [esi+eax]
        sar edx, 1
        add edx, ebx
        push byte 4
        dec edx
        dec edx
        add eax, dword [byte ebp-0Ch]
        push edx
        dec eax
        dec eax
        push eax
        mov eax, dword [byte ebp-0Ch]
        push dword [byte ebp-028h]
        inc eax
        inc eax
        push eax
        call DrawRectOutline
        mov eax, dword [byte ebp-04h]
        add esp, byte 14h
        inc eax
        push eax
        push str_D3
        lea eax, [byte ebp-060h]
        push eax
        add dword [byte ebp-018h], byte 66h
        call sprintf_
        movzx edx, byte [byte_11FA2F]
        movsx eax, word [word_158D76]
        add esp, byte 0Ch
        lea ebx, [esi+eax]
        sar eax, 1
        sar edx, 1
        add eax, dword [byte ebp-0Ch]
        sub ebx, edx
        lea edx, [byte eax+01h]
        sub ebx, byte 3
        lea eax, [byte ebp-060h]
        add dword [byte ebp-08h], byte 40h
        call DrawColorTextCentred
        mov eax, dword [byte ebp-038h]
        inc dword [byte ebp-038h]
        mov dword [byte ebp-024h], eax
        jmp short .16
.15:
        mov eax, dword [dword_158D70]
        add eax, dword [byte ebp-018h]
        mov word [byte eax+018h], 2
.16:
        movsx eax, word [word_158D76]
        lea edx, [byte eax+02h]
        inc dword [byte ebp-04h]
        add dword [byte ebp-0Ch], edx
        cmp dword [byte ebp-04h], byte 8
        jl near .12
        add eax, eax
        jmp short .19
.17:
        movsx edx, word [word_158D76]
        imul edx, byte 6
        mov eax, 1B6h
        mov ebx, esi
        call GetLangText
        call DrawColorText
        mov eax, 0Fh
        xor edx, edx
        mov dword [byte ebp-04h], 0
        call SetTextColors
        imul eax, dword [byte ebp-038h], byte 66h
.18:
        inc dword [byte ebp-038h]
        mov ebx, dword [dword_158D70]
        mov edx, eax
        inc dword [byte ebp-04h]
        add eax, byte 66h
        mov word [byte edx+ebx+018h], 2
        cmp dword [byte ebp-04h], byte 8
        jl short .18
        movzx eax, byte [byte_11FA2F]
        add eax, byte 5
.19:
        add esi, eax
        push byte 4
        push esi
        push dword [dword_11F5C0]
        push esi
        push byte 0
        call FillRectColor
        add esp, byte 14h
        push byte 4
        lea eax, [byte esi+02h]
        push eax
        push dword [dword_11F5C0]
        push eax
        add dword [byte ebp-020h], byte 14h
        add dword [byte ebp-01Ch], byte 14h
        push byte 0
        inc dword [byte ebp-014h]
        inc edi
        inc edi
        call FillRectColor
        movsx eax, word [word_158D76]
        add esp, byte 14h
        sub eax, byte 4
        mov byte [dword edi+byte_158D2A], 2
        add esi, eax
        mov eax, dword [byte ebp-010h]
        mov byte [dword edi+byte_158D2B], 2
        add dword [byte ebp-010h], byte 4
        mov dword [dword eax+dword_158D54], 0FFFFFFFFh
        cmp dword [byte ebp-014h], byte 4
        jl near .3
        call DrawGripPads
        mov esi, dword [dword_158D70]
        mov ecx, 66h
        lea edi, [dword esi+0FF0h]
        mov esi, dword_17BD48
        rep movsb
        cmp dword [byte ebp-024h], byte 0
        jge short .20
        mov eax, 28h
        jmp short .21
.20:
        mov eax, dword [byte ebp-024h]
.21:
        mov dl, al
        mov eax, dword [dword_158D70]
        mov byte [dword eax+01032h], dl
        mov eax, dword [dword_158D70]
        mov byte [dword eax+01034h], 28h
        mov eax, dword [dword_158D70]
        mov byte [dword eax+01035h], 28h
        mov eax, dword [dword_158D70]
        mov byte [dword eax+01033h], 28h
        mov eax, dword [dword_158D70]
        mov edx, dword [dword eax+0102Eh]
        mov eax, dword [dword eax+0102Ah]
        mov ebx, 3
        call SetMenuMouse
        lea edx, [dword ebp-0360h]
        xor eax, eax
        mov dword [byte ebp-040h], 28h
        call FadePalette
.22:
        cmp dword [byte ebp-040h], byte 0
        jl short .24
        cmp dword [byte ebp-040h], byte 29h
        jge short .24
        mov eax, dword [dword_158D70]
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+0102Ah]
        jne short .23
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+0102Eh]
        je short .24
.23:
        mov dword [byte ebp-040h], 0FFFFFFFFh
.24:
        push byte 2
        lea eax, [byte ebp-040h]
        push byte 28h
        mov ecx, DrawGripPads
        mov ebx, 0FFFFFFFFh
        push eax
        mov edx, dword [dword_158D70]
        mov eax, 29h
        call RunMenu
        cmp dword [byte ebp-040h], byte 28h
        je short .27
        mov eax, dword [byte ebp-040h]
        mov ebx, 0Ah
        cdq
        idiv ebx
        mov eax, dword [byte ebp-040h]
        mov dword [byte ebp-04h], edx
        cdq
        idiv ebx
        mov esi, eax
        add eax, eax
        cmp dword [byte ebp-04h], byte 2
        jge short .25
        mov edx, dword [byte ebp-04h]
        mov word [dword eax+word_158D34], dx
        jmp short .28
.25:
        mov ebx, dword [byte ebp-04h]
        mov ecx, dword [byte ebp-04h]
        shl esi, 2
        movsx edx, word [dword eax+word_158D34]
        dec ebx
        dec ebx
        dec ecx
        dec ecx
        mov word [dword esi+edx*2+word_158D44], bx
        mov edx, 1
        shl edx, cl
        cmp word [dword eax+word_158D34], byte 0
        je short .26
        mov dword [dword esi+dword_1516A8], edx
        jmp short .28
.26:
        mov dword [dword esi+dword_151698], edx
        jmp short .28
.27:
        call SlideInTitleBar
.28:
        cmp dword [byte ebp-040h], byte 28h
        jne near .22
        mov eax, 3
        call FadeOut
        push dword [dword_158D70]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_158D6C]
        call FreeMemBlock
        add esp, byte 4
.29:
        mov eax, byte_17CA54
        call GetGripButtonMap
        jmp near DrawGripPads_73B
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push dword [dword_17BC78]
        call TextSetFont
        add esp, byte 4
        call GetInputDevices
        mov edx, eax
        test al, 2
        je short .30
        test byte [byte_17CA24], 1
        je short .31
.30:
        test dl, 4
        je near .35
        test byte [byte_17CA3C], 1
        jne near .35
.31:
        mov eax, 0Fh
        xor edx, edx
        mov ebx, 0DCh
        call SetTextColors
        mov eax, 1B7h
        mov edx, 140h
        call GetLangText
        call DrawColorTextCentred
        mov eax, 1B8h
        mov ebx, 0F2h
        mov edx, 140h
        call GetLangText
        call DrawColorTextCentred
.32:
        call KbdGetKey
        cmp eax, byte 1Bh
        je short .32
.33:
        call KbdGetKey
        cmp eax, byte 1Bh
        jne short .33
.34:
        call KbdGetKey
        cmp eax, byte 1Bh
        je short .34
        mov dword [dword_114CB0], 1
        mov dword [dword_114CB4], 1
        call InitInputDevices
        push byte 0
        call ClearScreenColour
        add esp, byte 4
.35:
        test byte [byte_17CA24], 1
        je short .36
        mov ecx, 18h
        mov esi, byte_17CA24
        mov edi, byte_151708
        rep movsb
.36:
        test byte [byte_17CA3C], 1
        je near DrawGripPads_73C
        mov ecx, 18h
        mov esi, byte_17CA3C
        mov edi, unk_151720
        rep movsb
        jmp near DrawGripPads_73C
;-----------------------------------------------------------------------------
; UpdateJoystickTest                           21478  96 PC, medium confidence
; Joystick test screen, each frame: lights the arrow of the direction the
; tested pad points (byte_151778) and blinks it
;-----------------------------------------------------------------------------
UpdateJoystickTest:
        push ebx
        push ecx
        push edx
        push esi
        mov ecx, dword [dword_158D68]
        mov esi, dword [byte_151778]
        shl ecx, 3
        sar esi, cl
        and esi, byte 0Fh
        movsx eax, word [nosplit esi*2+word_11758C]
        cmp eax, dword [dword_158D64]
        je near .2
        cmp dword [dword_158D64], byte 0
        je short .1
        mov eax, dword [dword_158D64]
        mov word [nosplit eax*2+word_158CBA], 0
        call SetScreenTarget
        mov eax, dword [dword_158D64]
        dec eax
        imul eax, byte 0Ch
        push dword [dword eax+dword_158CCC]
        call PutBlockAtOwnPos
        add esp, byte 4
.1:
        lea eax, [esi+esi]
        mov dword [dword_158D64], 0
        cmp word [dword eax+word_11758C], byte 0
        je near .3
        movsx eax, word [dword eax+word_11758C]
        mov dword [dword_158D64], eax
        mov word [nosplit eax*2+word_158CBA], 1
        call SetScreenTarget
        mov eax, dword [dword_158D64]
        dec eax
        imul eax, byte 0Ch
        push dword [dword eax+dword_158CD0]
        call PutBlockAtOwnPos
        add esp, byte 4
        call GetTicks
        add eax, byte 5
        mov dword [dword_117588], eax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        test eax, eax
        je short .3
        call GetTicks
        cmp eax, dword [dword_117588]
        jle short .3
        mov eax, dword [dword_158D64]
        movsx edx, word [nosplit eax*2+word_158CBA]
        cmp edx, byte 1
        sete dl
        movzx dx, dl
        inc edx
        mov word [nosplit eax*2+word_158CBA], dx
        call SetScreenTarget
        mov edx, dword [dword_158D64]
        dec edx
        imul eax, edx, byte 0Ch
        movsx ecx, word [nosplit edx*2+word_158CBC]
        shl ecx, 2
        push dword [dword ecx+eax+dword_158CCC]
        call PutBlockAtOwnPos
        add esp, byte 4
.3:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; JoystickTestScreen                           21596  96 PC, medium confidence
; Joystick test screen (BKGD, arrows LT00-LT71, buttons BT00-BT02): shows the
; pad's direction lit up while it is moved, mouse or pad on the buttons
;-----------------------------------------------------------------------------
JoystickTestScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1CCh, 0
        push eax
        sub ebp, 82h
        mov ecx, 10h
        lea edi, [byte ebp-016h]
        mov esi, unk_2018D
        mov eax, 2
        xor edx, edx
        rep movsd
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 53h
        call LoadPackedFile
        push byte 0
        mov esi, eax
        mov dword [byte ebp+06Ah], eax
        call ClearScreenColour
        add esp, byte 4
        call BlackPalette
        push str_Pal4
        push esi
        call FindShape
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp+06Eh], eax
        call SetScreenColors
        call SetScreenTarget
        push str_BKGD
        push esi
        call FindShape
        add esp, byte 8
        mov dword [byte ebp+07Ah], 0FFFFFFFFh
        mov dword [byte ebp+066h], 0
        push eax
        xor edi, edi
        xor esi, esi
        call PutBlockAtOwnPos
        add esp, byte 4
.1:
        push dword [byte ebp+066h]
        push str_LTD0
        lea eax, [byte ebp+052h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+052h]
        push eax
        push dword [byte ebp+06Ah]
        call FindShape
        add esp, byte 8
        mov dword [dword esi+dword_158CD0], eax
        lea eax, [byte ebp+052h]
        push eax
        inc edi
        inc edi
        push dword [byte ebp+06Ah]
        mov byte [byte ebp+055h], 31h
        call FindShape
        add esp, byte 8
        mov dword [dword esi+dword_158CD4], eax
        xor edx, edx
        mov eax, dword [dword esi+dword_158CD0]
        add esi, byte 0Ch
        call CopyBitmap
        push eax
        inc dword [byte ebp+066h]
        mov dword [dword esi+dword_158CC0], eax
        call DrawShapeAtOwnPos
        add esp, byte 4
        mov word [dword edi+word_158CBA], 0
        cmp dword [byte ebp+066h], byte 8
        jl short .1
        mov eax, dword [dword ebp-014Eh]
        lea edx, [dword ebp-014Ah]
        mov dword [dword_158D68], eax
        mov eax, 3
        mov dword [dword_158D64], 0
        call InitMenuItems
        push str_BT00
        push dword [byte ebp+06Ah]
        call FindShape
        add esp, byte 8
        push str_BT01
        push dword [byte ebp+06Ah]
        mov dword [dword ebp-0130h], eax
        call FindShape
        add esp, byte 8
        push str_BT02
        push dword [byte ebp+06Ah]
        mov dword [dword ebp-012Ch], eax
        call FindShape
        mov dword [dword ebp-0128h], eax
        lea eax, [byte ebp-016h]
        mov dword [dword ebp-0136h], eax
        mov eax, dword [dword ebp-0130h]
        mov dword [dword ebp-013Ah], 8
        lea edi, [dword ebp-0E4h]
        movsx eax, word [byte eax+0Ch]
        mov esi, TeamStatsBitmap
        mov dword [dword ebp-0124h], eax
        mov eax, dword [dword ebp-0130h]
        mov ecx, 66h
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0110h], 16Ah
        mov dword [dword ebp-010Ch], 1CAh
        mov byte [dword ebp-0106h], 1
        mov dword [dword ebp-0120h], eax
        mov eax, 6
        mov byte [dword ebp-0105h], 2
        call OpenScreen
        rep movsb
        mov byte [dword ebp-0A2h], 1
        mov byte [dword ebp-0A0h], 1
        mov ecx, 66h
        lea edi, [byte ebp-07Eh]
        mov esi, dword_17BD48
        mov byte [dword ebp-09Fh], 0
        mov byte [dword ebp-0A1h], 1
        rep movsb
        mov byte [byte ebp-03Ch], 2
        mov byte [byte ebp-03Ah], 0
        mov byte [byte ebp-039h], 2
        mov byte [byte ebp-03Bh], 2
        call SetScreenTarget
        push dword [byte ebp-040h]
        push dword [byte ebp-044h]
        call MouseRead
        mov ebx, 2
        mov edx, dword [byte ebp+06Eh]
        add esp, byte 8
        xor eax, eax
        mov dword [byte ebp+062h], 2
        call FadePalette
        mov eax, dword [dword ebp-014Eh]
        shl eax, 2
        mov dword [byte ebp+072h], eax
        mov eax, dword [dword ebp-014Eh]
        inc eax
        mov dword [byte ebp+076h], eax
        imul eax, dword [dword ebp-014Eh], byte 18h
        mov dword [byte ebp+07Eh], eax
        mov eax, byte_151708
        add eax, dword [byte ebp+07Eh]
        mov dword [byte ebp+05Eh], eax
.2:
        call SoundIdle
        cmp dword [byte ebp+062h], byte 0
        jl short .4
        cmp dword [byte ebp+062h], byte 3
        jge short .4
        imul eax, dword [byte ebp+062h], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0110h]
        jne short .3
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-010Ch]
        je short .4
.3:
        mov dword [byte ebp+062h], 0FFFFFFFFh
.4:
        push byte 2
        lea eax, [byte ebp+062h]
        push byte 1
        mov ecx, UpdateJoystickTest
        mov ebx, 0FFFFFFFFh
        push eax
        lea edx, [dword ebp-014Ah]
        mov eax, 3
        call RunMenu
        cmp dword [byte ebp+062h], byte 1
        jb short .5
        jbe near .8
        cmp dword [byte ebp+062h], byte 2
        je near .9
        jmp near .12
.5:
        cmp dword [byte ebp+062h], byte 0
        jne near .12
        xor eax, eax
        call GetLangText
        push dword [byte ebp+076h]
        mov dword [byte ebp+05Ah], eax
        mov eax, 21Bh
        call GetLangText
        push eax
        lea eax, [byte ebp+02Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov ecx, byte_17BDAE
        lea ebx, [byte ebp+05Ah]
        push byte 0
        mov edx, 1
        lea eax, [byte ebp+02Ah]
        call MessageBox
        cmp dword [dword ebp-014Eh], byte 0
        je short .6
        and byte [byte_17CA3C], 0FEh
        jmp short .7
.6:
        and byte [byte_17CA24], 0FEh
.7:
        mov eax, dword [byte ebp+072h]
        mov dword [dword eax+dword_114CB0], 1
        call ReadJoystickBits
        jmp short .12
.8:
        call SlideInSideBar
        mov dword [byte ebp+07Ah], 1
        jmp short .12
.9:
        call SlideInTitleBar
        cmp dword [dword ebp-014Eh], byte 0
        je short .10
        mov edi, byte_17CA3C
        jmp short .11
.10:
        mov edi, byte_17CA24
.11:
        mov eax, dword [byte ebp+07Eh]
        mov ecx, 18h
        mov esi, dword [byte ebp+05Eh]
        mov dword [byte ebp+07Ah], 1
        or byte [dword eax+byte_151708], 1
        rep movsb
.12:
        cmp dword [byte ebp+07Ah], byte 0
        jl near .2
        xor esi, esi
.13:
        push dword [dword esi+dword_158CCC]
        call FreeMemBlock
        add esi, byte 0Ch
        add esp, byte 4
        cmp esi, byte 60h
        jne short .13
        push dword [byte ebp+06Ah]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 2
        call FadeOut
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near DrawGripPads_73C
