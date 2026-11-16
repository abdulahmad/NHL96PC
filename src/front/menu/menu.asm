; Menus: the menu items, the menu input (mouse, pads, joysticks, keys) and its sounds, the menu loop (96 PC; still to be named).
bits 32
%include "hockey.inc"
section s_64721 progbits alloc exec nowrite align=1
extern abs_, BlackPalette, byte_17BDAE, byte_17CA1E, CopyBitmap, dword_11D1A8, dword_11D1AC, dword_11D1B0
extern dword_11D1BC, dword_11D1C0, dword_11F5C0, dword_11F5C4, dword_152F50, dword_152F54, dword_152F58, dword_152F5C
extern TeamStatsBitmap, dword_17BD48, dword_17C3E4, dword_17C3E8, dword_17C3EC, dword_17C3F0, dword_17C3F4, dword_17C3F8
extern dword_17C3FC, dword_17C400, dword_17C404, dword_17C408, dword_17C40C, dword_17C410, dword_17C414, dword_17C418
extern dword_17C41C, dword_17C420, dword_17C424, dword_17C428, dword_17C42C, dword_17C430, dword_17C434, dword_17C438
extern dword_17C43C, dword_17C440, dword_17C444, dword_17C448, dword_17C44C, dword_17C450, dword_17C454, dword_17C458
extern dword_17C45C, dword_17C460, FadeOut, FadeOutMusic, FadePalette, FillMusicStream, GetInputDevices, GetTicks
extern GripReadSlots, LinkExchangeValues, LoadPackedFile, MakeDirPath, MessageBox, mousemaxx, mousemaxy, mouseminx
extern mouseminy, mousepollfn, MouseRead, mousex, mousey, MusicDone, NameIndexFree, NameIndexLoad
extern OpenScreen, optflags, PlayMusic, PlaySfx, PutBlock, ReadJoystickBits, SetDrawBitmap, SetScreenColors
extern SetViewRect, SlideInSideBar, SlideInTitleBar, SoundIdle, SoundSecondsToBytes, sprintf_, str_Bb01, str_Bb02
extern str_Bb02d, str_Bb10, str_Bb11, str_Bb19, str_Bb20, str_Bkgd5, str_Bt013, str_Bt023
extern str_Bt02d, str_Bt102, str_Bt112, str_Bt19, str_Bt20, str_Bt28, str_Bt29, str_Hig1
extern str_Hig2, str_Hig3, str_HILITESNDX, str_LOCALNDX2, str_Opt1, str_Opt2, str_Opt3, str_Pal11
extern str_Sta1, str_Sta2, str_Sta3, str_Use1, str_Use2, str_Use3, GetLangText, DrawShapeCore
extern DrawArt, PutBlockAtOwnPos, FreeMemBlock, CreateBitmap, sub_ADA50, FreeBitmap, SumRingRange, SetScreenTarget
extern sub_DFE9C, FindShape, sub_E0584, vecdist, WaitRetrace, WaitRetraceEdges, word_114CE0, word_114CE4
extern word_11D1B4, word_11D1B6, word_11D1B8, word_11D1BA, word_11D1C4, word_17C464, word_17C466, word_17C468
extern word_17C46A, word_17C46C, word_17C46E, word_17C470
global InitMenuItems, PollMenuInput, SetMenuMoveSfx, SetMenuSelectSfx, sub_64E74, sub_64F47, RunMenu, SetMenuMouse
global unk_663B9, jpt_66539, jpt_66549, jpt_66569, jpt_66579, MainMenuScreen, MainMenuScreen_B4, MainMenuScreen_C9
global MainMenuScreen_DE, MainMenuScreen_F3, MainMenuScreen_621, MainMenuScreen_671, MainMenuScreen_6FC, MainMenuScreen_724, MainMenuScreen_74C, MainMenuScreen_774
global MainMenuScreen_8A9, MainMenuScreen_8B5, MainMenuScreen_92D, MainMenuScreen_939, MainMenuScreen_996, MainMenuScreen_9EE, MainMenuScreen_A0B, MainMenuScreen_A14
global MainMenuScreen_A1D, MainMenuScreen_A26
;-----------------------------------------------------------------------------
; InitMenuItems                                   64721  96 PC, low confidence
; (count, items): clears the menu item records (66h bytes) and sets their
; defaults
;-----------------------------------------------------------------------------
InitMenuItems:
        push ebx
        push ecx
        push esi
        push edi
        mov esi, eax
        xor ebx, ebx
        jmp short .2
.1:
        mov ecx, 66h
        mov edi, edx
        xor eax, eax
        rep stosb
        mov dword [byte edx+0Ch], 1
        mov dword [byte edx+02Eh], 0FFFFFFFFh
        mov dword [byte edx+032h], 0FFFFFFFFh
        mov dword [edx], ebx
        mov byte [byte edx+042h], bl
        mov byte [byte edx+043h], bl
        mov byte [byte edx+044h], bl
        mov byte [byte edx+045h], bl
        mov eax, dword [dword_11F5C0]
        mov dword [byte edx+052h], eax
        add edx, byte 66h
        mov eax, dword [dword_11F5C4]
        inc ebx
        mov dword [byte edx-010h], eax
.2:
        cmp ebx, esi
        jl short .1
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PollMenuInput                                64776  96 PC, medium confidence
; Reads the mouse, GrIP pads, joysticks and keys for the menus
;-----------------------------------------------------------------------------
PollMenuInput:
        push ecx
        push esi
        push edi
        enter 14h, 0
        push eax
        push edx
        mov esi, ebx
        mov dword [dword_11D1B0], 0
        call GetInputDevices
        test al, 1
        je short .1
        call dword [mousepollfn]
        mov dword [dword_11D1B0], eax
        mov eax, dword [mousex]
        mov dword [dword_11D1A8], eax
        mov eax, dword [mousey]
        mov dword [dword_11D1AC], eax
.1:
        call GripReadSlots
        call ReadJoystickBits
        push byte 1Ch
        mov dword [byte ebp-04h], 0
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je short .2
        mov dword [dword_11D1B0], 1
.2:
        push byte 1
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je short .3
        mov word [word_11D1C4], 1
        jmp short .6
.3:
        cmp word [word_11D1C4], byte 0
        je short .5
        test esi, esi
        jl short .4
        imul eax, esi, byte 66h
        add eax, dword [byte ebp-01Ch]
        mov edx, dword [byte eax+03Ah]
        mov dword [dword_11D1A8], edx
        mov eax, dword [byte eax+03Eh]
        push eax
        push edx
        mov dword [dword_11D1AC], eax
        call MouseRead
        mov dword [dword_11D1B0], 1
        add esp, byte 8
.4:
        mov dword [byte ebp-04h], 0
        mov dword [dword_17C444], 0
        mov dword [dword_17C458], 0
.5:
        mov word [word_11D1C4], 0
.6:
        push byte 1Dh
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je near .24
        cmp word [word_11D1BA], byte 0
        je near .24
        push byte 4Bh
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je short .7
        or byte [byte ebp-04h], 8
.7:
        push byte 4Dh
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je short .8
        or byte [byte ebp-04h], 4
.8:
        push byte 48h
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je short .9
        or byte [byte ebp-04h], 1
.9:
        push byte 50h
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je short .10
        or byte [byte ebp-04h], 2
.10:
        cmp dword [byte ebp-04h], byte 0
        je near .22
        mov eax, dword [dword_17C458]
        inc eax
        cmp dword [dword_17C458], byte 0
        jne short .11
        mov dword [dword_17C458], eax
        cmp dword [dword_17C444], byte 0Eh
        jge short .13
        inc dword [dword_17C444]
        jmp short .13
.11:
        cmp dword [dword_17C458], byte 3
        jge short .12
        mov dword [dword_17C458], eax
        jmp short .13
.12:
        mov dword [dword_17C458], 0
.13:
        test byte [byte ebp-04h], 4
        je short .14
        mov eax, dword [dword_17C444]
        add dword [dword_11D1A8], eax
.14:
        mov eax, dword [dword_11D1A8]
        cmp eax, dword [mousemaxx]
        jl short .15
        mov eax, dword [mousemaxx]
        dec eax
        mov dword [dword_11D1A8], eax
.15:
        test byte [byte ebp-04h], 8
        je short .16
        mov eax, dword [dword_17C444]
        sub dword [dword_11D1A8], eax
.16:
        mov eax, dword [dword_11D1A8]
        cmp eax, dword [mouseminx]
        jge short .17
        mov eax, dword [mouseminx]
        mov dword [dword_11D1A8], eax
.17:
        test byte [byte ebp-04h], 1
        je short .18
        mov eax, dword [dword_17C444]
        sub dword [dword_11D1AC], eax
.18:
        mov eax, dword [dword_11D1AC]
        cmp eax, dword [mousemaxy]
        jl short .19
        mov eax, dword [mousemaxy]
        dec eax
        mov dword [dword_11D1AC], eax
.19:
        test byte [byte ebp-04h], 2
        je short .20
        mov eax, dword [dword_17C444]
        add dword [dword_11D1AC], eax
.20:
        mov eax, dword [dword_11D1AC]
        cmp eax, dword [mouseminy]
        jge short .21
        mov eax, dword [mouseminy]
        mov dword [dword_11D1AC], eax
.21:
        push dword [dword_11D1AC]
        push dword [dword_11D1A8]
        call MouseRead
        add esp, byte 8
        jmp short .23
.22:
        mov dword [dword_17C458], 0
        mov dword [dword_17C444], 0
.23:
        mov dword [byte ebp-04h], 0
        jmp near .37
.24:
        cmp dword [dword_11D1B0], byte 0
        jne near .36
        push byte 4Bh
        mov dword [dword_17C458], 0
        mov dword [dword_17C444], 0
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je short .25
        call GetTicks
        cmp eax, dword [dword_17C3E4]
        jle short .27
        call GetTicks
        add eax, byte 12h
        or byte [byte ebp-04h], 8
        jmp short .26
.25:
        call GetTicks
        dec eax
.26:
        mov dword [dword_17C3E4], eax
.27:
        push byte 4Dh
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je short .28
        call GetTicks
        cmp eax, dword [dword_17C3E8]
        jle short .30
        call GetTicks
        add eax, byte 12h
        or byte [byte ebp-04h], 4
        jmp short .29
.28:
        call GetTicks
        dec eax
.29:
        mov dword [dword_17C3E8], eax
.30:
        push byte 48h
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je short .31
        call GetTicks
        cmp eax, dword [dword_17C3EC]
        jle short .33
        call GetTicks
        add eax, byte 12h
        or byte [byte ebp-04h], 1
        jmp short .32
.31:
        call GetTicks
        dec eax
.32:
        mov dword [dword_17C3EC], eax
.33:
        push byte 50h
        call sub_DFE9C
        add esp, byte 4
        test eax, eax
        je short .35
        call GetTicks
        cmp eax, dword [dword_17C3F0]
        jle short .37
        call GetTicks
        add eax, byte 12h
        or byte [byte ebp-04h], 2
.34:
        mov dword [dword_17C3F0], eax
        jmp short .37
.35:
        call GetTicks
        dec eax
        jmp short .34
.36:
        mov dword [dword_17C444], 0
        mov dword [dword_17C458], 0
.37:
        cmp dword [byte ebp-04h], byte 0
        je near .66
        mov edi, dword [byte ebp-01Ch]
        xor esi, esi
.38:
        cmp esi, dword [byte ebp-018h]
        jge short .41
        cmp dword [byte edi+014h], byte 0
        je short .39
        mov ax, word [byte edi+018h]
        xor ah, ah
        and al, 2
        cwde
        test eax, eax
        jne short .39
        cmp dword [byte edi+010h], byte 0
        jle short .39
        push dword [byte edi+014h]
        push dword [byte edi+010h]
        push dword [dword_11D1AC]
        push dword [dword_11D1A8]
        call SumRingRange
        add esp, byte 10h
        test eax, eax
        je short .39
        mov esi, dword [byte ebp-018h]
        jmp short .40
.39:
        add edi, byte 66h
.40:
        inc esi
        cmp esi, dword [byte ebp-018h]
        jne short .38
        xor edi, edi
        jmp short .38
.41:
        test edi, edi
        je near .50
        mov eax, dword [byte ebp-01Ch]
        mov eax, dword [eax]
        test eax, eax
        jge short .42
        xor eax, eax
.42:
        lea esi, [byte edi+042h]
        test byte [byte ebp-04h], 1
        je short .43
        movzx edx, byte [esi]
        sub edx, eax
        imul edx, byte 66h
        add edx, dword [byte ebp-01Ch]
        mov edx, dword [byte edx+03Ah]
        mov dword [dword_11D1A8], edx
        movzx edx, byte [esi]
        sub edx, eax
        imul eax, edx, byte 66h
        add eax, dword [byte ebp-01Ch]
        mov eax, dword [byte eax+03Eh]
        mov dword [dword_11D1AC], eax
        movzx eax, byte [esi]
        jmp near .46
.43:
        test byte [byte ebp-04h], 2
        je short .44
        movzx edx, byte [byte esi+01h]
        sub edx, eax
        imul edx, byte 66h
        add edx, dword [byte ebp-01Ch]
        mov edx, dword [byte edx+03Ah]
        mov dword [dword_11D1A8], edx
        movzx edx, byte [byte esi+01h]
        sub edx, eax
        imul eax, edx, byte 66h
        add eax, dword [byte ebp-01Ch]
        mov eax, dword [byte eax+03Eh]
        mov dword [dword_11D1AC], eax
        movzx eax, byte [byte esi+01h]
        jmp short .46
.44:
        test byte [byte ebp-04h], 8
        je short .45
        movzx edx, byte [byte esi+02h]
        sub edx, eax
        imul edx, byte 66h
        add edx, dword [byte ebp-01Ch]
        mov edx, dword [byte edx+03Ah]
        mov dword [dword_11D1A8], edx
        movzx edx, byte [byte esi+02h]
        sub edx, eax
        imul eax, edx, byte 66h
        add eax, dword [byte ebp-01Ch]
        mov eax, dword [byte eax+03Eh]
        mov dword [dword_11D1AC], eax
        movzx eax, byte [byte esi+02h]
        jmp short .46
.45:
        test byte [byte ebp-04h], 4
        je short .47
        movzx edx, byte [byte esi+03h]
        sub edx, eax
        imul edx, byte 66h
        add edx, dword [byte ebp-01Ch]
        mov edx, dword [byte edx+03Ah]
        mov dword [dword_11D1A8], edx
        movzx edx, byte [byte esi+03h]
        sub edx, eax
        imul eax, edx, byte 66h
        add eax, dword [byte ebp-01Ch]
        mov eax, dword [byte eax+03Eh]
        mov dword [dword_11D1AC], eax
        movzx eax, byte [byte esi+03h]
.46:
        mov dword [byte ebp-08h], eax
.47:
        push dword [dword_11D1AC]
        push dword [dword_11D1A8]
        call MouseRead
        add esp, byte 8
        test byte [byte_17CA1E], 10h
        je near .66
        mov eax, dword [edi]
        cmp eax, dword [byte ebp-08h]
        je near .66
        cmp dword [byte edi+02Eh], byte 0
        jl short .48
        mov eax, dword [byte edi+02Eh]
        jmp short .49
.48:
        cmp dword [dword_11D1BC], byte 0
        jl near .66
        mov eax, dword [dword_11D1BC]
.49:
        call PlaySfx
        leave
        pop edi
        pop esi
        pop ecx
        ret
.50:
        mov dword [byte ebp-014h], 4B000h
        mov esi, dword [byte ebp-01Ch]
        mov dword [byte ebp-0Ch], edi
        mov dword [byte ebp-010h], edi
        jmp near .64
.51:
        mov ax, word [byte esi+018h]
        xor ah, ah
        and al, 2
        cwde
        xor edx, edx
        test eax, eax
        jne near .62
        test edi, edi
        je short .52
        mov eax, dword [byte ebp-010h]
        cmp eax, dword [edi]
        je near .62
.52:
        test byte [byte ebp-04h], 1
        je short .56
        mov eax, dword [byte esi+03Eh]
        cmp eax, dword [dword_11D1AC]
        jge short .54
.53:
        mov eax, dword [byte esi+03Ah]
        sub eax, dword [dword_11D1A8]
        call abs_
        mov ebx, eax
        mov eax, dword [byte esi+03Eh]
        sub eax, dword [dword_11D1AC]
        call abs_
        cmp ebx, eax
        jge short .54
        mov edx, 1
.54:
        mov eax, dword [dword_11D1A8]
        sub eax, dword [byte esi+03Ah]
.55:
        call abs_
        mov dword [byte ebp-08h], eax
        test eax, eax
        jne near .62
        jmp near .61
.56:
        test byte [byte ebp-04h], 2
        je short .57
        mov eax, dword [byte esi+03Eh]
        cmp eax, dword [dword_11D1AC]
        jle short .54
        jmp short .53
.57:
        test byte [byte ebp-04h], 4
        je short .59
        mov eax, dword [byte esi+03Ah]
        cmp eax, dword [dword_11D1A8]
        jle short .58
        mov eax, dword [byte esi+03Eh]
        sub eax, dword [dword_11D1AC]
        call abs_
        mov ebx, eax
        mov eax, dword [byte esi+03Ah]
        sub eax, dword [dword_11D1A8]
        call abs_
        cmp ebx, eax
        jge short .58
        mov edx, 1
.58:
        mov eax, dword [dword_11D1AC]
        sub eax, dword [byte esi+03Eh]
        jmp short .55
.59:
        test byte [byte ebp-04h], 8
        je short .62
        mov eax, dword [byte esi+03Ah]
        cmp eax, dword [dword_11D1A8]
        jge short .60
        mov eax, dword [byte esi+03Eh]
        sub eax, dword [dword_11D1AC]
        call abs_
        mov ebx, eax
        mov eax, dword [byte esi+03Ah]
        sub eax, dword [dword_11D1A8]
        call abs_
        cmp ebx, eax
        jge short .60
        mov edx, 1
.60:
        mov eax, dword [dword_11D1AC]
        sub eax, dword [byte esi+03Eh]
        call abs_
        mov dword [byte ebp-08h], eax
        test eax, eax
        jne short .62
.61:
        inc eax
        mov dword [byte ebp-08h], eax
.62:
        test edx, edx
        je short .63
        mov eax, dword [dword_11D1AC]
        sub eax, dword [byte esi+03Eh]
        push eax
        mov eax, dword [dword_11D1A8]
        sub eax, dword [byte esi+03Ah]
        push eax
        call vecdist
        mov edx, dword [byte ebp-08h]
        imul edx, eax
        add esp, byte 8
        mov dword [byte ebp-08h], edx
        cmp edx, dword [byte ebp-014h]
        jge short .63
        mov dword [byte ebp-0Ch], esi
        mov dword [byte ebp-014h], edx
.63:
        inc dword [byte ebp-010h]
        add esi, byte 66h
.64:
        mov eax, dword [byte ebp-010h]
        cmp eax, dword [byte ebp-018h]
        jl near .51
        cmp dword [byte ebp-0Ch], byte 0
        je short .65
        mov eax, dword [byte ebp-0Ch]
        mov eax, dword [byte eax+03Ah]
        mov dword [dword_11D1A8], eax
        mov eax, dword [byte ebp-0Ch]
        mov eax, dword [byte eax+03Eh]
        push eax
        push dword [dword_11D1A8]
        mov dword [dword_11D1AC], eax
        call MouseRead
        add esp, byte 8
        test byte [byte_17CA1E], 10h
        je short .66
        mov eax, dword [byte ebp-0Ch]
        cmp dword [byte eax+02Eh], byte 0
        jl near .48
        mov eax, dword [byte eax+02Eh]
        jmp near .49
.65:
        mov eax, dword [mousex]
        mov dword [dword_11D1A8], eax
        mov eax, dword [mousey]
        mov dword [dword_11D1AC], eax
.66:
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; SetMenuMoveSfx                               64E54  96 PC, medium confidence
; (id below 49h): the menu cursor sound
;-----------------------------------------------------------------------------
SetMenuMoveSfx:
        cmp eax, byte 0FFFFFFFFh
        jl short .1
        cmp eax, byte 49h
        jge short .1
        mov dword [dword_11D1BC], eax
.1:
        ret
;-----------------------------------------------------------------------------
; SetMenuSelectSfx                             64E64  96 PC, medium confidence
; (id below 49h): the menu select sound
;-----------------------------------------------------------------------------
SetMenuSelectSfx:
        cmp eax, byte 0FFFFFFFFh
        jl short .1
        cmp eax, byte 49h
        jge short .1
        mov dword [dword_11D1C0], eax
.1:
        ret
;-----------------------------------------------------------------------------
; sub_64E74                                                       64E74  96 PC
;-----------------------------------------------------------------------------
sub_64E74:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ebp, esp
        push eax
        mov eax, dword [byte ebp+02Ch]
        cmp dword [byte ebp-04h], byte 0
        jne short .3
        cmp dword [dword_17C460], byte 0
        je short .1
        push dword [dword_17C44C]
        call FreeMemBlock
        add esp, byte 4
.1:
        cmp dword [dword_17C45C], byte 0
        je short .2
        push dword [dword_17C448]
        call FreeMemBlock
        add esp, byte 4
.2:
        mov word [word_11D1B8], 0
        mov word [word_11D1BA], 0
        jmp short .8
.3:
        lea esi, [byte ebp+01Ch]
        mov edi, dword_17C3FC
        movsd
        movsd
        lea esi, [byte ebp+024h]
        mov edi, dword_17C3F4
        movsd
        movsd
        test eax, eax
        je short .4
        mov edx, 20h
        mov dword [dword_17C45C], eax
        call CopyBitmap
        mov word [word_11D1BA], 1
        mov dword [dword_17C448], eax
        jmp short .5
.4:
        mov dword [dword_17C45C], eax
.5:
        cmp dword [byte ebp+030h], byte 0
        je short .6
        mov eax, dword [byte ebp+030h]
        mov edx, 20h
        mov dword [dword_17C460], eax
        call CopyBitmap
        mov dword [dword_17C44C], eax
        jmp short .7
.6:
        mov dword [dword_17C460], 0
.7:
        mov word [word_11D1B8], 1
.8:
        mov eax, dword [byte ebp-04h]
        mov dword [dword_17C434], eax
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret 18h
;-----------------------------------------------------------------------------
; sub_64F47                                                       64F47  96 PC
;-----------------------------------------------------------------------------
sub_64F47:
        push ebx
        mov ebx, dword [dword_17C450]
        mov dword [eax], ebx
        mov eax, dword [dword_17C454]
        mov dword [edx], eax
        pop ebx
        ret
;-----------------------------------------------------------------------------
; RunMenu                                                         64F59  96 PC
; The menu loop of every front-end screen (message boxes, the stats, three
; stars, pad set-up, user screens): items, highlight, mouse / pads / keys
; (PollMenuInput), the link exchange in a link game; returns the chosen item
; (-1 none)
;-----------------------------------------------------------------------------
RunMenu:
        push esi
        push edi
        enter 8Ch, 0
        push eax
        push edx
        push ebx
        push ecx
        sub ebp, byte 76h
        mov dword [byte ebp+016h], 0
        mov dword [byte ebp+032h], 0
        mov dword [byte ebp+05Ah], 0
        mov dword [byte ebp+056h], 0
        cmp word [word_11D1B4], byte 0
        je short .1
        mov eax, dword [dword_152F58]
        movsx ebx, word [byte eax+06h]
        movsx edx, word [byte eax+0Ah]
        sub ebx, edx
        mov edx, dword [dword_11F5C4]
        sub edx, ebx
        push edx
        movsx edx, word [byte eax+04h]
        movsx eax, word [byte eax+08h]
        sub edx, eax
        mov eax, edx
        mov edx, dword [dword_11F5C0]
        jmp short .2
.1:
        mov eax, dword [dword_152F58]
        mov ebx, dword [dword_11F5C4]
        movsx edx, word [byte eax+06h]
        movsx eax, word [byte eax+04h]
        sub ebx, edx
        mov edx, dword [dword_11F5C0]
        push ebx
.2:
        sub edx, eax
        push edx
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
        movsx eax, word [word_11D1B4]
        mov dword [byte ebp-06h], eax
        cmp dword [byte ebp-01Eh], byte 0
        je short .3
        cmp dword [byte ebp-01Ah], byte 1
        jge short .4
.3:
        mov eax, dword [dword ebp+086h]
        mov dword [eax], 0FFFFFFFFh
        mov eax, 0FFFFFFFFh
        jmp near .184
.4:
        test byte [dword ebp+08Eh], 2
        jne short .5
        mov dword [dword_11D1A8], 0
        mov dword [dword_11D1AC], 0
        jmp short .6
.5:
        mov eax, dword [mousex]
        mov dword [dword_11D1A8], eax
        mov eax, dword [mousey]
        mov dword [dword_11D1AC], eax
.6:
        mov dword [byte ebp-0Eh], 0
        mov dword [byte ebp-012h], 0
        mov dword [byte ebp-016h], 0
        call GetTicks
        xor edi, edi
        mov word [word_17C46C], 1
        mov dword [byte ebp-0Ah], eax
        mov dword [byte ebp+072h], edi
        mov dword [dword_17C41C], edi
        cmp dword [dword_17C434], byte 0
        je short .7
        mov eax, dword_17C41C
        call dword [dword_17C434]
.7:
        cmp dword [dword_17C41C], byte 0
        je short .8
        push dword [dword_17C41C]
        call SetDrawBitmap
        add esp, byte 4
        jmp short .9
.8:
        call SetScreenTarget
.9:
        mov esi, dword [byte ebp-01Eh]
        mov dword [byte ebp+036h], 0
.10:
        mov eax, dword [byte ebp+036h]
        cmp eax, dword [byte ebp-01Ah]
        jge near .22
        mov edx, dword [dword ebp+086h]
        cmp eax, dword [edx]
        jne short .11
        push dword [byte esi+03Eh]
        push dword [byte esi+03Ah]
        call MouseRead
        add esp, byte 8
.11:
        mov dword [byte esi+0Ch], 0
        mov eax, dword [byte esi+036h]
        mov dword [dword_17C438], eax
        test eax, eax
        je short .12
        mov eax, esi
        call dword [dword_17C438]
.12:
        mov eax, dword [byte esi+04h]
        cmp eax, byte 1
        jb short .13
        jbe short .15
        cmp eax, byte 2
        je short .17
        jmp short .19
.13:
        test eax, eax
        jne short .19
.14:
        cmp dword [byte esi+01Ah], byte 0
        je short .21
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        push dword [byte esi+01Ah]
        jmp short .20
.15:
        cmp dword [byte esi+01Eh], byte 0
        je short .14
.16:
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        push dword [byte esi+01Eh]
        jmp short .20
.17:
        cmp dword [byte esi+022h], byte 0
        je short .18
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        push dword [byte esi+022h]
        jmp short .20
.18:
        cmp dword [byte esi+01Eh], byte 0
        jne short .16
        jmp short .14
.19:
        cmp dword [byte esi+01Ah], byte 0
        je short .21
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        push dword [byte esi+01Ah]
.20:
        call DrawArt
        add esp, byte 0Ch
.21:
        inc dword [byte ebp+036h]
        add esi, byte 66h
        jmp near .10
.22:
        call GetTicks
        mov dword [byte ebp+01Ah], 0FFFFFFFFh
        mov dword [byte ebp+01Eh], 0FFFFFFFFh
        mov dword [byte ebp+012h], 0FFFFFFFFh
        mov dword [byte ebp+0Eh], 0FFFFFFFFh
        mov dword [byte ebp+066h], 0FFFFFFFFh
        mov dword [byte ebp-02h], eax
        mov eax, dword [byte ebp-01Ah]
        mov dword [byte ebp+06Eh], 0FFFFFFFFh
        inc eax
        mov dword [byte ebp+06Ah], 0FFFFFFFFh
        mov dword [byte ebp+02Ah], eax
.23:
        cmp dword [byte ebp+066h], byte 0FFFFFFFFh
        jne near .173
        cmp dword [dword_17C41C], byte 0
        je short .24
        call SetScreenTarget
        push byte 0
        mov eax, dword [dword_17C41C]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.24:
        cmp word [word_17C46C], byte 0
        jne short .25
        mov dword [dword_17C41C], 0
        cmp dword [dword_17C434], byte 0
        je short .26
        mov eax, dword_17C41C
        call dword [dword_17C434]
        jmp short .26
.25:
        mov word [word_17C46C], 0
.26:
        mov eax, dword [byte ebp+042h]
        mov dword [byte ebp+02h], eax
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        mov esi, dword [byte ebp-016h]
        test eax, eax
        je short .27
        test byte [dword ebp+08Eh], 2
        je short .28
.27:
        mov ebx, dword [dword ebp+08Ah]
        mov edx, dword [byte ebp-01Eh]
        mov eax, dword [byte ebp-01Ah]
        call PollMenuInput
        jmp short .29
.28:
        mov dword [dword_11D1B0], 0
.29:
        mov eax, dword [dword_11D1B0]
        mov dword [byte ebp+042h], eax
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .32
        test byte [dword ebp+08Eh], 1
        je short .32
.30:
        call GetTicks
        cmp eax, dword [byte ebp-02h]
        jge short .31
        call SoundIdle
        jmp short .30
.31:
        lea eax, [byte ebp-016h]
        lea ecx, [byte ebp-0Eh]
        push eax
        lea eax, [byte ebp-012h]
        mov ebx, dword [dword_11D1B0]
        push eax
        mov edx, dword [dword_11D1AC]
        mov eax, dword [dword_11D1A8]
        call LinkExchangeValues
        call GetTicks
        add eax, byte 3
        mov dword [byte ebp-02h], eax
.32:
        mov ax, word [dword_11D1A8]
        mov word [word_17C468], ax
        mov ax, word [dword_11D1AC]
        mov word [word_17C46A], ax
        cmp dword [byte ebp+042h], byte 0
        je short .33
        mov dword [byte ebp+016h], 1
.33:
        cmp dword [byte ebp-016h], byte 0
        je short .34
        mov dword [byte ebp+032h], 1
.34:
        mov eax, dword [dword_11D1A8]
        cmp eax, dword [byte ebp+01Ah]
        jne short .35
        mov eax, dword [dword_11D1AC]
        cmp eax, dword [byte ebp+01Eh]
        jne short .35
        mov eax, dword [byte ebp+02h]
        cmp eax, dword [byte ebp+042h]
        jne short .35
        mov eax, dword [byte ebp-0Eh]
        cmp eax, dword [byte ebp+012h]
        jne short .35
        mov eax, dword [byte ebp-012h]
        cmp eax, dword [byte ebp+0Eh]
        jne short .35
        cmp esi, dword [byte ebp-016h]
        je short .36
.35:
        call GetTicks
        mov dword [byte ebp-0Ah], eax
.36:
        call GetTicks
        sub eax, dword [byte ebp-0Ah]
        mov dword [byte ebp+03Ah], eax
        call SoundIdle
        mov eax, dword [byte ebp-0Eh]
        cmp eax, dword [byte ebp+012h]
        jne short .38
        mov eax, dword [byte ebp-012h]
        cmp eax, dword [byte ebp+0Eh]
        jne short .38
        cmp esi, dword [byte ebp-016h]
        jne short .38
        mov eax, dword [dword_11D1A8]
        cmp eax, dword [byte ebp+01Ah]
        jne short .38
        mov eax, dword [dword_11D1AC]
        cmp eax, dword [byte ebp+01Eh]
        jne short .38
        cmp dword [dword_17C41C], byte 0
        jne short .38
        mov eax, dword [byte ebp+02h]
        cmp eax, dword [byte ebp+042h]
        jne short .38
        cmp dword [byte ebp-022h], byte 0FFFFFFFFh
        je short .37
        mov eax, dword [byte ebp+03Ah]
        cmp eax, dword [byte ebp-022h]
        jg short .38
.37:
        cmp dword [byte ebp-026h], byte 0
        je near .48
.38:
        cmp dword [byte ebp+05Ah], byte 0
        jne short .39
        cmp dword [byte ebp+056h], byte 0
        je near .48
.39:
        cmp dword [dword_17C41C], byte 0
        jne near .46
        call WaitRetraceEdges
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .42
        cmp dword [byte ebp+056h], byte 0
        je short .42
        test byte [dword ebp+08Eh], 1
        je short .42
        cmp word [word_17C466], byte 0
        je short .40
        push dword [byte ebp+052h]
        push dword [byte ebp+04Eh]
        push dword [dword_17C44C]
        jmp short .41
.40:
        push dword [byte ebp+052h]
        push dword [byte ebp+04Eh]
        push dword [dword_152F5C]
.41:
        call PutBlock
        add esp, byte 0Ch
        mov dword [byte ebp+056h], 0
.42:
        cmp dword [byte ebp+05Ah], byte 0
        je short .48
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .43
        test byte [dword ebp+08Eh], 2
        je short .48
.43:
        cmp word [word_17C464], byte 0
        je short .44
        push dword [byte ebp+062h]
        push dword [byte ebp+05Eh]
        push dword [dword_17C448]
        jmp short .45
.44:
        push dword [byte ebp+062h]
        push dword [byte ebp+05Eh]
        push dword [dword_152F54]
.45:
        call PutBlock
        add esp, byte 0Ch
        jmp short .47
.46:
        mov dword [byte ebp+056h], 0
.47:
        mov dword [byte ebp+05Ah], 0
.48:
        cmp dword [byte ebp-026h], byte 0
        je near .51
        call dword [byte ebp-026h]
        movsx eax, word [word_11D1B4]
        cmp eax, dword [byte ebp-06h]
        je short .51
        mov dword [byte ebp-06h], eax
        cmp word [word_11D1B4], byte 0
        je short .49
        mov eax, dword [dword_152F58]
        movsx ebx, word [byte eax+06h]
        movsx edx, word [byte eax+0Ah]
        sub ebx, edx
        mov edx, dword [dword_11F5C4]
        sub edx, ebx
        push edx
        movsx edx, word [byte eax+04h]
        movsx eax, word [byte eax+08h]
        sub edx, eax
        mov eax, dword [dword_11F5C0]
        sub eax, edx
        push eax
        jmp short .50
.49:
        mov eax, dword [dword_152F58]
        mov ebx, dword [dword_11F5C4]
        movsx edx, word [byte eax+06h]
        movsx eax, word [byte eax+04h]
        sub ebx, edx
        mov edx, dword [dword_11F5C0]
        push ebx
        sub edx, eax
        push edx
.50:
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
.51:
        mov eax, dword [dword_11D1A8]
        cmp eax, dword [byte ebp+01Ah]
        jne short .53
        mov eax, dword [dword_11D1AC]
        cmp eax, dword [byte ebp+01Eh]
        jne short .53
        mov eax, dword [byte ebp+02h]
        cmp eax, dword [byte ebp+042h]
        jne short .53
        mov eax, dword [byte ebp-0Eh]
        cmp eax, dword [byte ebp+012h]
        jne short .53
        mov eax, dword [byte ebp-012h]
        cmp eax, dword [byte ebp+0Eh]
        jne short .53
        cmp dword [dword_17C41C], byte 0
        jne short .53
        cmp esi, dword [byte ebp-016h]
        jne short .53
        cmp dword [byte ebp-022h], byte 0FFFFFFFFh
        je short .52
        mov eax, dword [byte ebp+03Ah]
        cmp eax, dword [byte ebp-022h]
        jg short .53
.52:
        cmp dword [byte ebp-026h], byte 0
        je near .24
.53:
        cmp dword [dword_11D1A8], byte 0
        jl short .54
        mov eax, dword [dword_11D1A8]
        mov dword [byte ebp+01Ah], eax
.54:
        cmp dword [dword_11D1AC], byte 0
        jl short .55
        mov eax, dword [dword_11D1AC]
        mov dword [byte ebp+01Eh], eax
.55:
        cmp dword [byte ebp-0Eh], byte 0
        jl short .56
        mov eax, dword [byte ebp-0Eh]
        mov dword [byte ebp+012h], eax
.56:
        cmp dword [byte ebp-012h], byte 0
        jl short .57
        mov eax, dword [byte ebp-012h]
        mov dword [byte ebp+0Eh], eax
.57:
        cmp dword [dword_17C41C], byte 0
        je short .58
        push dword [dword_17C41C]
        call SetDrawBitmap
        add esp, byte 4
.58:
        cmp dword [byte ebp+05Ah], byte 0
        jne short .59
        cmp dword [byte ebp+056h], byte 0
        je near .66
.59:
        cmp dword [dword_17C41C], byte 0
        jne near .66
        call WaitRetraceEdges
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .62
        cmp dword [byte ebp+056h], byte 0
        je short .62
        test byte [dword ebp+08Eh], 1
        je short .62
        cmp word [word_17C466], byte 0
        je short .60
        push dword [byte ebp+052h]
        push dword [byte ebp+04Eh]
        push dword [dword_17C44C]
        jmp short .61
.60:
        push dword [byte ebp+052h]
        push dword [byte ebp+04Eh]
        push dword [dword_152F5C]
.61:
        call PutBlock
        add esp, byte 0Ch
        mov dword [byte ebp+056h], 0
.62:
        cmp dword [byte ebp+05Ah], byte 0
        je short .66
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .63
        test byte [dword ebp+08Eh], 2
        je short .66
.63:
        cmp word [word_17C464], byte 0
        je short .64
        push dword [byte ebp+062h]
        push dword [byte ebp+05Eh]
        push dword [dword_17C448]
        jmp short .65
.64:
        push dword [byte ebp+062h]
        push dword [byte ebp+05Eh]
        push dword [dword_152F54]
.65:
        call PutBlock
        add esp, byte 0Ch
        mov dword [byte ebp+05Ah], 0
.66:
        mov eax, dword [byte ebp-01Eh]
        xor esi, esi
.67:
        cmp esi, dword [byte ebp-01Ah]
        jge short .72
        mov edx, dword [byte eax+04h]
        mov dword [byte eax+08h], edx
        cmp dword [byte eax+01Ah], byte 0
        jne short .69
        cmp dword [byte eax+01Eh], byte 0
        je short .68
        mov dword [byte eax+04h], 1
        jmp short .70
.68:
        cmp dword [byte eax+022h], byte 0
        je short .69
        mov dword [byte eax+04h], 2
        jmp short .70
.69:
        mov dword [byte eax+04h], 0
.70:
        cmp dword [dword_17C41C], byte 0
        je short .71
        mov dword [byte eax+0Ch], 1
.71:
        add eax, byte 66h
        inc esi
        jmp short .67
.72:
        test byte [dword ebp+08Eh], 2
        je near .105
        test edi, edi
        jne near .95
        mov esi, dword [byte ebp-01Eh]
        mov dword [byte ebp+04Ah], edi
.73:
        mov eax, dword [byte ebp+04Ah]
        cmp eax, dword [byte ebp-01Ah]
        jge near .94
        cmp dword [byte esi+010h], byte 0
        jle near .93
        cmp dword [byte esi+014h], byte 0
        je near .93
        push dword [byte esi+014h]
        push dword [byte esi+010h]
        push dword [dword_11D1AC]
        push dword [dword_11D1A8]
        call SumRingRange
        add esp, byte 10h
        test eax, eax
        je near .93
        mov ax, word [byte esi+018h]
        xor ah, ah
        and al, 2
        cwde
        test eax, eax
        jne near .93
        cmp dword [byte ebp+042h], byte 0
        je near .87
        test byte [byte esi+046h], 1
        je short .78
        mov eax, dword [byte ebp+04Ah]
        mov dword [byte ebp+02Eh], eax
        mov eax, dword [byte ebp-01Eh]
        mov eax, dword [eax]
        test eax, eax
        jge short .74
        xor eax, eax
.74:
        cmp dword [esi], byte 0
        jl short .75
        add eax, dword [byte ebp-01Ah]
        cmp eax, dword [esi]
        jg short .76
.75:
        mov eax, dword [byte ebp+04Ah]
        jmp short .77
.76:
        mov eax, dword [esi]
.77:
        mov dword [byte ebp+06Eh], eax
        call GetTicks
        mov dword [dword_17C3F0], eax
        mov dword [dword_17C3EC], eax
        mov dword [dword_17C3E8], eax
        mov dword [dword_17C3E4], eax
        jmp near .93
.78:
        test byte [byte esi+046h], 2
        je near .86
        mov eax, dword [byte esi+05Ah]
        mov edi, esi
        mov dword [dword_17C440], eax
        test eax, eax
        je short .79
        mov eax, esi
        call dword [dword_17C440]
.79:
        cmp dword [byte edi+022h], byte 0
        jne short .81
        cmp dword [byte edi+01Eh], byte 0
        je short .80
        mov eax, dword [byte edi+01Eh]
        jmp short .82
.80:
        cmp dword [byte edi+01Ah], byte 0
        je short .83
        mov eax, dword [byte edi+01Ah]
        jmp short .82
.81:
        mov eax, dword [byte edi+022h]
.82:
        mov dword [dword_17C424], eax
.83:
        mov eax, dword [dword_152F58]
        mov edx, dword [dword_11D1A8]
        movsx eax, word [byte eax+04h]
        sub edx, dword [byte edi+026h]
        add edx, eax
        mov eax, dword [dword_17C424]
        mov dword [dword_17C410], edx
        movsx eax, word [byte eax+04h]
        cmp eax, edx
        jle short .84
        mov dword [dword_17C410], eax
.84:
        mov eax, dword [dword_152F58]
        mov edx, dword [dword_11D1AC]
        movsx eax, word [byte eax+06h]
        sub edx, dword [byte edi+02Ah]
        add edx, eax
        mov eax, dword [dword_17C424]
        mov dword [dword_17C40C], edx
        movsx eax, word [byte eax+06h]
        cmp eax, edx
        jle short .85
        mov dword [dword_17C40C], eax
.85:
        mov eax, dword [dword_17C424]
        mov ebx, dword [byte edi+056h]
        movsx edx, word [byte eax+06h]
        sub ebx, edx
        lea edx, [byte ebx+01h]
        movsx eax, word [byte eax+04h]
        push edx
        mov edx, dword [byte edi+052h]
        sub edx, eax
        lea eax, [byte edx+01h]
        push eax
        push dword [byte edi+04Eh]
        push dword [byte edi+04Ah]
        call SetViewRect
        add esp, byte 10h
        push byte 0
        push dword [dword_17C40C]
        push dword [dword_17C410]
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [dword_17C418], eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call sub_E0584
        add esp, byte 4
        push byte 0
        push byte 0
        push dword [dword_17C424]
        call DrawArt
        mov eax, dword [dword_11D1AC]
        add esp, byte 0Ch
        sub eax, dword [byte edi+02Ah]
        push eax
        mov eax, dword [dword_11D1A8]
        sub eax, dword [byte edi+026h]
        push eax
        push dword [dword_152F58]
        call DrawArt
        add esp, byte 0Ch
        call SetScreenTarget
        mov eax, dword [dword_152F58]
        mov dword [dword_17C424], eax
        mov eax, dword [dword_17C418]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword_152F58], eax
        mov eax, dword [dword_152F54]
        mov edx, 20h
        mov dword [dword_17C430], eax
        mov eax, dword [dword_152F58]
        call CopyBitmap
        mov dword [dword_152F54], eax
        mov eax, dword [dword_11D1A8]
        sub eax, dword [byte edi+026h]
        mov dword [dword_17C410], eax
        mov eax, dword [dword_11D1AC]
        sub eax, dword [byte edi+02Ah]
        mov dword [dword_17C40C], eax
        mov eax, dword [byte edi+02Ah]
        mov dword [dword_11D1AC], eax
        push eax
        mov eax, dword [byte edi+026h]
        push eax
        mov dword [dword_11D1A8], eax
        call MouseRead
        mov eax, dword [byte ebp+02Ah]
        add esp, byte 8
        mov dword [byte ebp+04Ah], eax
        jmp short .93
.86:
        mov dword [byte esi+04h], 2
        jmp short .93
.87:
        cmp dword [byte esi+04h], byte 0
        jne short .88
        mov dword [byte esi+04h], 1
.88:
        cmp dword [byte ebp+016h], byte 0
        je short .93
        mov eax, dword [byte ebp+04Ah]
        mov dword [byte ebp+02Eh], eax
        mov eax, dword [byte ebp-01Eh]
        mov eax, dword [eax]
        test eax, eax
        jge short .89
        xor eax, eax
.89:
        cmp dword [esi], byte 0
        jl short .90
        add eax, dword [byte ebp-01Ah]
        cmp eax, dword [esi]
        jg short .91
.90:
        mov eax, dword [byte ebp+04Ah]
        jmp short .92
.91:
        mov eax, dword [esi]
.92:
        mov dword [byte ebp+06Eh], eax
.93:
        inc dword [byte ebp+04Ah]
        add esi, byte 66h
        jmp near .73
.94:
        cmp dword [byte ebp-022h], byte 0FFFFFFFFh
        je near .105
        mov eax, dword [byte ebp+03Ah]
        cmp eax, dword [byte ebp-022h]
        jle near .105
        mov dword [byte ebp+06Eh], 0FFFFFFFCh
        jmp near .105
.95:
        cmp dword [byte ebp+042h], byte 0
        jne near .104
        push dword [dword_17C418]
        call FreeBitmap
        add esp, byte 4
        mov eax, dword [dword_17C424]
        push dword [dword_152F54]
        mov dword [dword_152F58], eax
        call FreeMemBlock
        mov eax, dword [dword_17C430]
        mov dword [dword_152F54], eax
        mov eax, dword [dword_17C40C]
        add esp, byte 4
        add dword [dword_11D1AC], eax
        mov eax, dword [dword_17C410]
        push dword [dword_11D1AC]
        add dword [dword_11D1A8], eax
        push dword [dword_11D1A8]
        call MouseRead
        add esp, byte 8
        cmp word [word_11D1B4], byte 0
        je short .96
        mov eax, dword [dword_152F58]
        movsx ebx, word [byte eax+06h]
        movsx edx, word [byte eax+0Ah]
        sub ebx, edx
        mov edx, dword [dword_11F5C4]
        sub edx, ebx
        push edx
        movsx edx, word [byte eax+04h]
        movsx eax, word [byte eax+08h]
        sub edx, eax
        mov eax, dword [dword_11F5C0]
        sub eax, edx
        push eax
        jmp short .97
.96:
        mov eax, dword [dword_152F58]
        mov ebx, dword [dword_11F5C4]
        movsx edx, word [byte eax+06h]
        movsx eax, word [byte eax+04h]
        sub ebx, edx
        mov edx, dword [dword_11F5C0]
        push ebx
        sub edx, eax
        push edx
.97:
        push byte 0
        push byte 0
        call SetViewRect
        add esp, byte 10h
        mov esi, dword [byte ebp-01Eh]
        mov dword [byte ebp+026h], 0
        mov dword [byte ebp+0Ah], 0FFFFFFFFh
.98:
        mov eax, dword [byte ebp+026h]
        cmp eax, dword [byte ebp-01Ah]
        jge short .100
        mov dword [byte esi+0Ch], 1
        cmp dword [byte esi+010h], byte 0
        jle short .99
        cmp dword [byte esi+014h], byte 0
        je short .99
        push dword [byte esi+014h]
        push dword [byte esi+010h]
        push dword [dword_11D1AC]
        push dword [dword_11D1A8]
        call SumRingRange
        add esp, byte 10h
        test eax, eax
        je short .99
        mov eax, dword [byte ebp+026h]
        mov dword [byte ebp+0Ah], eax
.99:
        inc dword [byte ebp+026h]
        add esi, byte 66h
        jmp short .98
.100:
        mov eax, dword [byte edi+062h]
        mov dword [dword_17C414], eax
        test eax, eax
        je short .103
        cmp dword [byte ebp+0Ah], byte 0
        jl short .101
        imul eax, dword [byte ebp+0Ah], byte 66h
        add eax, dword [byte ebp-01Eh]
        mov edx, dword [eax]
        jmp short .102
.101:
        mov edx, 0FFFFFFFFh
.102:
        mov eax, edi
        call dword [dword_17C414]
.103:
        xor edi, edi
        jmp short .105
.104:
        mov eax, dword [byte edi+05Eh]
        mov dword [dword_17C43C], eax
        test eax, eax
        je short .105
        mov eax, edi
        call dword [dword_17C43C]
.105:
        test byte [dword ebp+08Eh], 1
        je near .133
        cmp dword [byte ebp+072h], byte 0
        jne near .125
        mov esi, dword [byte ebp-01Eh]
        mov dword [byte ebp+046h], 0
.106:
        mov eax, dword [byte ebp+046h]
        cmp eax, dword [byte ebp-01Ah]
        jge near .124
        cmp dword [byte esi+010h], byte 0
        jle near .123
        cmp dword [byte esi+014h], byte 0
        je near .123
        push dword [byte esi+014h]
        push dword [byte esi+010h]
        push dword [byte ebp-012h]
        push dword [byte ebp-0Eh]
        call SumRingRange
        add esp, byte 10h
        test eax, eax
        je near .123
        mov ax, word [byte esi+018h]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        jne near .123
        cmp dword [byte ebp-016h], byte 0
        je near .119
        test byte [byte esi+046h], 1
        je short .110
        mov eax, dword [byte ebp+046h]
        mov dword [byte ebp+02Eh], eax
        mov eax, dword [byte ebp-01Eh]
        mov eax, dword [eax]
        test eax, eax
        jge short .107
        xor eax, eax
.107:
        cmp dword [esi], byte 0
        jl short .108
        add eax, dword [byte ebp-01Ah]
        cmp eax, dword [esi]
        jg short .109
.108:
        mov eax, dword [byte ebp+046h]
        jmp near .122
.109:
        mov eax, dword [esi]
        jmp near .122
.110:
        test byte [byte esi+046h], 2
        je near .118
        mov eax, dword [byte esi+05Ah]
        mov dword [byte ebp+072h], esi
        mov dword [dword_17C440], eax
        test eax, eax
        je short .111
        mov eax, esi
        call dword [dword_17C440]
.111:
        mov eax, dword [byte ebp+072h]
        cmp dword [byte eax+022h], byte 0
        jne short .113
        cmp dword [byte eax+01Eh], byte 0
        je short .112
        mov eax, dword [byte eax+01Eh]
        jmp short .114
.112:
        cmp dword [byte eax+01Ah], byte 0
        je short .115
        mov eax, dword [byte eax+01Ah]
        jmp short .114
.113:
        mov eax, dword [byte eax+022h]
.114:
        mov dword [dword_17C404], eax
.115:
        mov eax, dword [byte ebp+072h]
        mov edx, dword [byte ebp-0Eh]
        sub edx, dword [byte eax+026h]
        mov eax, dword [dword_152F50]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [dword_17C404]
        mov dword [dword_17C42C], edx
        movsx eax, word [byte eax+04h]
        cmp eax, edx
        jle short .116
        mov dword [dword_17C42C], eax
.116:
        mov eax, dword [byte ebp+072h]
        mov edx, dword [byte ebp-012h]
        sub edx, dword [byte eax+02Ah]
        mov eax, dword [dword_152F50]
        movsx eax, word [byte eax+06h]
        add edx, eax
        mov eax, dword [dword_17C404]
        mov dword [dword_17C428], edx
        movsx eax, word [byte eax+06h]
        cmp eax, edx
        jle short .117
        mov dword [dword_17C428], eax
.117:
        push byte 0
        push dword [dword_17C428]
        push dword [dword_17C42C]
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [dword_17C408], eax
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call sub_E0584
        add esp, byte 4
        push byte 0
        push byte 0
        push dword [dword_17C404]
        call DrawArt
        mov edx, dword [byte ebp+072h]
        mov eax, dword [byte ebp-012h]
        add esp, byte 0Ch
        sub eax, dword [byte edx+02Ah]
        push eax
        mov eax, dword [byte ebp-0Eh]
        sub eax, dword [byte edx+026h]
        push eax
        push dword [dword_152F50]
        call DrawArt
        add esp, byte 0Ch
        call SetScreenTarget
        mov eax, dword [dword_152F50]
        mov dword [dword_17C404], eax
        mov eax, dword [dword_17C408]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword_152F50], eax
        mov eax, dword [dword_152F5C]
        mov edx, 20h
        mov dword [dword_17C420], eax
        mov eax, dword [dword_152F50]
        call CopyBitmap
        mov dword [dword_152F5C], eax
        mov eax, dword [byte ebp+072h]
        mov edx, dword [byte ebp-0Eh]
        mov eax, dword [byte eax+026h]
        sub edx, eax
        mov eax, dword [byte ebp+072h]
        mov dword [dword_17C42C], edx
        mov edx, dword [byte ebp-012h]
        mov eax, dword [byte eax+02Ah]
        sub edx, eax
        mov eax, dword [byte ebp+072h]
        mov dword [dword_17C428], edx
        mov eax, dword [byte eax+026h]
        mov dword [byte ebp-0Eh], eax
        mov eax, dword [byte ebp+072h]
        mov eax, dword [byte eax+02Ah]
        mov dword [byte ebp-012h], eax
        mov eax, dword [byte ebp+02Ah]
        mov dword [byte ebp+046h], eax
        jmp short .123
.118:
        mov dword [byte esi+04h], 2
        jmp short .123
.119:
        cmp dword [byte esi+04h], byte 0
        jne short .120
        mov dword [byte esi+04h], 1
.120:
        cmp dword [byte ebp+032h], byte 0
        je short .123
        mov eax, dword [byte ebp+046h]
        mov dword [byte ebp+02Eh], eax
        mov eax, dword [byte ebp-01Eh]
        mov eax, dword [eax]
        test eax, eax
        jge short .121
        xor eax, eax
.121:
        cmp dword [esi], byte 0
        jl near .108
        add eax, dword [byte ebp-01Ah]
        cmp eax, dword [esi]
        jle near .108
        mov eax, dword [esi]
.122:
        mov dword [byte ebp+06Ah], eax
.123:
        inc dword [byte ebp+046h]
        add esi, byte 66h
        jmp near .106
.124:
        cmp dword [byte ebp-022h], byte 0FFFFFFFFh
        je near .133
        mov eax, dword [byte ebp+03Ah]
        cmp eax, dword [byte ebp-022h]
        jle near .133
        mov dword [byte ebp+06Ah], 0FFFFFFFCh
        jmp near .133
.125:
        cmp dword [byte ebp-016h], byte 0
        jne near .132
        push dword [dword_17C408]
        call FreeBitmap
        add esp, byte 4
        mov esi, dword [byte ebp-01Eh]
        mov eax, dword [dword_17C404]
        push dword [dword_152F5C]
        mov dword [dword_152F50], eax
        call FreeMemBlock
        mov eax, dword [dword_17C420]
        mov dword [byte ebp+022h], 0
        mov dword [dword_152F5C], eax
        mov eax, dword [dword_17C42C]
        mov dword [byte ebp+06h], 0FFFFFFFFh
        add dword [byte ebp-0Eh], eax
        mov eax, dword [dword_17C428]
        add esp, byte 4
        add dword [byte ebp-012h], eax
.126:
        mov eax, dword [byte ebp+022h]
        cmp eax, dword [byte ebp-01Ah]
        jge short .128
        mov dword [byte esi+0Ch], 1
        cmp dword [byte esi+010h], byte 0
        jle short .127
        cmp dword [byte esi+014h], byte 0
        je short .127
        push dword [byte esi+014h]
        push dword [byte esi+010h]
        push dword [byte ebp-012h]
        push dword [byte ebp-0Eh]
        call SumRingRange
        add esp, byte 10h
        test eax, eax
        je short .127
        mov eax, dword [byte ebp+022h]
        mov dword [byte ebp+06h], eax
.127:
        inc dword [byte ebp+022h]
        add esi, byte 66h
        jmp short .126
.128:
        mov eax, dword [byte ebp+072h]
        mov eax, dword [byte eax+062h]
        mov dword [dword_17C414], eax
        test eax, eax
        je short .131
        cmp dword [byte ebp+06h], byte 0
        jl short .129
        mov edx, dword [byte ebp+06h]
        jmp short .130
.129:
        mov edx, 0FFFFFFFFh
.130:
        mov eax, dword [byte ebp+072h]
        call dword [dword_17C414]
.131:
        mov dword [byte ebp+072h], 0
        jmp short .133
.132:
        mov eax, dword [byte ebp+072h]
        mov eax, dword [byte eax+05Eh]
        mov dword [dword_17C43C], eax
        test eax, eax
        je short .133
        mov eax, dword [byte ebp+072h]
        call dword [dword_17C43C]
.133:
        cmp dword [byte ebp+06Ah], byte 0
        jl short .135
        imul eax, dword [byte ebp+06Ah], byte 66h
        add eax, dword [byte ebp-01Eh]
        cmp dword [byte eax+04h], byte 2
        je short .134
        test edi, edi
        je short .135
.134:
        mov dword [byte ebp+06Ah], 0FFFFFFFFh
.135:
        cmp dword [byte ebp+06Eh], byte 0
        jl short .137
        imul eax, dword [byte ebp+06Eh], byte 66h
        add eax, dword [byte ebp-01Eh]
        cmp dword [byte eax+04h], byte 2
        je short .136
        cmp dword [byte ebp+072h], byte 0
        je short .137
.136:
        mov dword [byte ebp+06Eh], 0FFFFFFFFh
.137:
        mov esi, dword [byte ebp-01Eh]
        mov dword [byte ebp+03Eh], 0
.138:
        mov eax, dword [byte ebp+03Eh]
        cmp eax, dword [byte ebp-01Ah]
        jge near .152
        mov eax, dword [byte esi+04h]
        cmp eax, dword [byte esi+08h]
        jne short .139
        cmp dword [byte esi+0Ch], byte 0
        je near .151
.139:
        cmp esi, edi
        je near .151
        cmp esi, dword [byte ebp+072h]
        je near .151
        mov dword [byte esi+0Ch], 0
        mov eax, dword [byte esi+036h]
        mov dword [dword_17C438], eax
        test eax, eax
        je short .140
        mov eax, esi
        call dword [dword_17C438]
.140:
        mov eax, dword [byte ebp+03Eh]
        cmp eax, dword [byte ebp+06Eh]
        je short .141
        cmp eax, dword [byte ebp+06Ah]
        jne short .142
.141:
        test byte [byte esi+046h], 1
        je short .142
        mov dword [byte esi+04h], 2
.142:
        mov eax, dword [byte esi+04h]
        cmp eax, byte 1
        jb short .143
        jbe short .145
        cmp eax, byte 2
        je short .147
        jmp short .149
.143:
        test eax, eax
        jne short .149
.144:
        cmp dword [byte esi+01Ah], byte 0
        je short .151
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        push dword [byte esi+01Ah]
        jmp short .150
.145:
        cmp dword [byte esi+01Eh], byte 0
        je short .144
.146:
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        push dword [byte esi+01Eh]
        jmp short .150
.147:
        cmp dword [byte esi+022h], byte 0
        je short .148
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        push dword [byte esi+022h]
        jmp short .150
.148:
        cmp dword [byte esi+01Eh], byte 0
        jne short .146
        jmp short .144
.149:
        cmp dword [byte esi+01Ah], byte 0
        je short .151
        push dword [byte esi+02Ah]
        push dword [byte esi+026h]
        push dword [byte esi+01Ah]
.150:
        call DrawArt
        add esp, byte 0Ch
.151:
        inc dword [byte ebp+03Eh]
        add esi, byte 66h
        jmp near .138
.152:
        cmp dword [byte ebp+06Eh], byte 0
        jge short .153
        cmp dword [byte ebp+06Ah], byte 0
        jl near .160
.153:
        cmp dword [byte ebp+06Eh], byte 0
        jl short .156
        cmp dword [byte ebp+06Ah], byte 0
        jl short .156
        movsx eax, word [word_114CE4]
        cmp eax, byte 1
        jne short .155
.154:
        mov eax, dword [byte ebp+06Eh]
        jmp short .157
.155:
        mov eax, dword [byte ebp+06Ah]
        jmp short .157
.156:
        cmp dword [byte ebp+06Eh], byte 0
        jge short .154
        mov eax, dword [byte ebp+06Ah]
.157:
        mov dword [byte ebp+066h], eax
        cmp dword [byte ebp+066h], byte 0
        jl short .160
        mov eax, dword [byte ebp+066h]
        cmp eax, dword [byte ebp+06Eh]
        jne short .160
        imul eax, dword [byte ebp+02Eh], byte 66h
        add eax, dword [byte ebp-01Eh]
        test byte [byte eax+046h], 1
        jne short .160
        cmp dword [byte eax+032h], byte 0
        jl short .158
        mov eax, dword [byte eax+032h]
        jmp short .159
.158:
        cmp dword [dword_11D1C0], byte 0
        jl short .160
        mov eax, dword [dword_11D1C0]
.159:
        call PlaySfx
.160:
        cmp dword [byte ebp+066h], byte 0FFFFFFFFh
        jne near .172
        cmp word [word_11D1B6], byte 0
        je short .161
        movsx eax, word [word_17C470]
        mov dword [dword_11D1A8], eax
        movsx eax, word [word_17C46E]
        push eax
        push dword [dword_11D1A8]
        mov dword [dword_11D1AC], eax
        call MouseRead
        mov word [word_11D1B6], 0
        add esp, byte 8
.161:
        cmp dword [byte ebp+042h], byte 0
        jne short .162
        cmp dword [byte ebp+016h], byte 0
        je short .162
        mov dword [byte ebp+016h], 0
        cmp word [word_11D1B8], byte 0
        je short .162
        mov dword [byte ebp+06Eh], 0FFFFFFFEh
        mov dword [byte ebp+066h], 0FFFFFFFEh
.162:
        cmp dword [byte ebp-016h], byte 0
        jne short .163
        cmp dword [byte ebp+032h], byte 0
        je short .163
        mov dword [byte ebp+032h], 0
        cmp word [word_11D1B8], byte 0
        je short .163
        mov dword [byte ebp+06Ah], 0FFFFFFFEh
        mov dword [byte ebp+066h], 0FFFFFFFEh
.163:
        cmp dword [byte ebp+066h], byte 0FFFFFFFFh
        jne near .172
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .164
        test byte [dword ebp+08Eh], 2
        je near .169
.164:
        cmp word [word_11D1B8], byte 0
        je near .165
        mov eax, dword [dword_11D1A8]
        cmp eax, dword [dword_17C3FC]
        jl near .165
        cmp eax, dword [dword_17C3F4]
        jg short .165
        mov eax, dword [dword_11D1AC]
        cmp eax, dword [dword_17C400]
        jl short .165
        cmp eax, dword [dword_17C3F8]
        jg short .165
        mov eax, dword [dword_17C45C]
        mov ebx, dword [dword_11D1A8]
        movsx edx, word [byte eax+08h]
        movsx eax, word [byte eax+0Ah]
        sub ebx, edx
        mov edx, dword [dword_11D1AC]
        sub edx, eax
        push edx
        push ebx
        mov dword [byte ebp+05Eh], ebx
        push dword [dword_17C448]
        mov dword [byte ebp+062h], edx
        call DrawShapeCore
        add esp, byte 0Ch
        push dword [byte ebp+062h]
        push dword [byte ebp+05Eh]
        push dword [dword_17C45C]
        mov dword [byte ebp+05Ah], 1
        call DrawArt
        mov word [word_17C464], 1
        jmp short .168
.165:
        cmp word [word_11D1B4], byte 0
        je short .166
        mov eax, dword [dword_152F58]
        mov ebx, dword [dword_11D1A8]
        movsx edx, word [byte eax+08h]
        movsx eax, word [byte eax+0Ah]
        sub ebx, edx
        mov edx, dword [dword_11D1AC]
        sub edx, eax
        mov dword [byte ebp+05Eh], ebx
        mov dword [byte ebp+062h], edx
        jmp short .167
.166:
        mov eax, dword [dword_11D1A8]
        mov dword [byte ebp+05Eh], eax
        mov eax, dword [dword_11D1AC]
        mov dword [byte ebp+062h], eax
.167:
        push dword [byte ebp+062h]
        push dword [byte ebp+05Eh]
        push dword [dword_152F54]
        call DrawShapeCore
        add esp, byte 0Ch
        push dword [byte ebp+062h]
        push dword [byte ebp+05Eh]
        push dword [dword_152F58]
        mov dword [byte ebp+05Ah], 1
        call DrawArt
        mov word [word_17C464], 0
.168:
        add esp, byte 0Ch
.169:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je near .172
        test byte [dword ebp+08Eh], 1
        je near .172
        cmp word [word_11D1B8], byte 0
        je near .170
        mov eax, dword [byte ebp-0Eh]
        cmp eax, dword [dword_17C3FC]
        jl short .170
        cmp eax, dword [dword_17C3F4]
        jg short .170
        mov eax, dword [byte ebp-012h]
        cmp eax, dword [dword_17C400]
        jl short .170
        cmp eax, dword [dword_17C3F8]
        jg short .170
        mov eax, dword [dword_17C460]
        mov ebx, dword [byte ebp-0Eh]
        movsx edx, word [byte eax+08h]
        movsx eax, word [byte eax+0Ah]
        sub ebx, edx
        mov edx, dword [byte ebp-012h]
        sub edx, eax
        push edx
        push ebx
        mov dword [byte ebp+04Eh], ebx
        push dword [dword_17C44C]
        mov dword [byte ebp+052h], edx
        call DrawShapeCore
        add esp, byte 0Ch
        push dword [byte ebp+052h]
        push dword [byte ebp+04Eh]
        push dword [dword_17C460]
        mov dword [byte ebp+056h], 1
        call DrawArt
        mov word [word_17C466], 1
        jmp short .171
.170:
        mov eax, dword [byte ebp-0Eh]
        mov dword [byte ebp+04Eh], eax
        mov eax, dword [byte ebp-012h]
        push eax
        push dword [byte ebp-0Eh]
        push dword [dword_152F5C]
        mov dword [byte ebp+052h], eax
        call DrawShapeCore
        add esp, byte 0Ch
        push dword [byte ebp-012h]
        push dword [byte ebp-0Eh]
        push dword [dword_152F50]
        mov dword [byte ebp+056h], 1
        call DrawArt
        mov word [word_17C466], 0
.171:
        add esp, byte 0Ch
.172:
        call SoundIdle
        cmp dword [byte ebp-026h], byte 0
        je near .23
        call WaitRetrace
        jmp near .23
.173:
        cmp dword [byte ebp+05Ah], byte 0
        jne short .174
        cmp dword [byte ebp+056h], byte 0
        je near .181
.174:
        call WaitRetraceEdges
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .177
        cmp dword [byte ebp+056h], byte 0
        je short .177
        test byte [dword ebp+08Eh], 1
        je short .177
        cmp word [word_17C466], byte 0
        je short .175
        push dword [byte ebp+052h]
        push dword [byte ebp+04Eh]
        push dword [dword_17C44C]
        jmp short .176
.175:
        push dword [byte ebp+052h]
        push dword [byte ebp+04Eh]
        push dword [dword_152F5C]
.176:
        call PutBlock
        add esp, byte 0Ch
.177:
        cmp dword [byte ebp+05Ah], byte 0
        je short .181
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        je short .178
        test byte [dword ebp+08Eh], 2
        je short .181
.178:
        cmp word [word_17C464], byte 0
        je short .179
        push dword [byte ebp+062h]
        push dword [byte ebp+05Eh]
        push dword [dword_17C448]
        jmp short .180
.179:
        push dword [byte ebp+062h]
        push dword [byte ebp+05Eh]
        push dword [dword_152F54]
.180:
        call PutBlock
        add esp, byte 0Ch
.181:
        mov edx, dword [dword ebp+086h]
        mov eax, dword [byte ebp+066h]
        mov dword [edx], eax
        cmp eax, dword [byte ebp+06Eh]
        jne short .182
        movsx eax, word [word_17C468]
        mov dword [dword_17C450], eax
        movsx eax, word [word_17C46A]
        mov dword [dword_17C454], eax
        mov eax, 1
        jmp short .184
.182:
        cmp eax, dword [byte ebp+06Ah]
        jne short .183
        mov eax, dword [byte ebp-0Eh]
        mov dword [dword_17C450], eax
        mov eax, dword [byte ebp-012h]
        mov dword [dword_17C454], eax
        mov eax, 2
        jmp short .184
.183:
        xor eax, eax
.184:
        lea esp, [byte ebp+076h]
        pop ebp
        pop edi
        pop esi
        ret 0Ch
;-----------------------------------------------------------------------------
; SetMenuMouse                                 66373  96 PC, medium confidence
; (x, y): puts the menu mouse at x, y (in a link game keeps it for the other
; side)
;-----------------------------------------------------------------------------
SetMenuMouse:
        push ebx
        push ecx
        mov bx, word [word_114CE0]
        xor bh, bh
        and bl, 1
        movsx ebx, bx
        test ebx, ebx
        je short .1
        mov word [word_11D1B6], 1
        mov word [word_17C470], ax
        mov word [word_17C46E], dx
        pop ecx
        pop ebx
        ret
.1:
        push edx
        push eax
        mov dword [dword_11D1A8], eax
        mov dword [dword_11D1AC], edx
        call MouseRead
        add esp, byte 8
        pop ecx
        pop ebx
        ret
unk_663B9:
        db 085h,00h,00h,00h,084h,00h,00h,00h,019h,01h,00h,00h,084h,00h,00h,00h
        db 019h,01h,00h,00h,09Dh,00h,00h,00h,085h,00h,00h,00h,09Dh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 063h,01h,00h,00h,084h,00h,00h,00h,0F8h,01h,00h,00h,084h,00h,00h,00h
        db 0F8h,01h,00h,00h,09Eh,00h,00h,00h,064h,01h,00h,00h,09Eh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 094h,00h,00h,00h,0CAh,00h,00h,00h,0A2h,00h,00h,00h,0C4h,00h,00h,00h
        db 010h,01h,00h,00h,0C4h,00h,00h,00h,01Ch,01h,00h,00h,0CAh,00h,00h,00h
        db 01Ch,01h,00h,00h,0D4h,00h,00h,00h,010h,01h,00h,00h,0DAh,00h,00h,00h
        db 0A2h,00h,00h,00h,0DAh,00h,00h,00h,094h,00h,00h,00h,0D2h,00h,00h,00h
        db 063h,01h,00h,00h,0CBh,00h,00h,00h,06Eh,01h,00h,00h,0C4h,00h,00h,00h
        db 0DEh,01h,00h,00h,0C4h,00h,00h,00h,0E9h,01h,00h,00h,0C9h,00h,00h,00h
        db 0E9h,01h,00h,00h,0D4h,00h,00h,00h,0E0h,01h,00h,00h,0DAh,00h,00h,00h
        db 06Fh,01h,00h,00h,0DAh,00h,00h,00h,063h,01h,00h,00h,0D3h,00h,00h,00h
        db 05Bh,00h,00h,00h,07h,01h,00h,00h,067h,00h,00h,00h,0FFh,00h,00h,00h
        db 0D6h,00h,00h,00h,0FFh,00h,00h,00h,0E2h,00h,00h,00h,06h,01h,00h,00h
        db 0E2h,00h,00h,00h,011h,01h,00h,00h,0D3h,00h,00h,00h,016h,01h,00h,00h
        db 067h,00h,00h,00h,016h,01h,00h,00h,05Bh,00h,00h,00h,0Fh,01h,00h,00h
        db 09Dh,01h,00h,00h,06h,01h,00h,00h,0A8h,01h,00h,00h,00h,01h,00h,00h
        db 018h,02h,00h,00h,00h,01h,00h,00h,023h,02h,00h,00h,05h,01h,00h,00h
        db 023h,02h,00h,00h,010h,01h,00h,00h,018h,02h,00h,00h,016h,01h,00h,00h
        db 0A8h,01h,00h,00h,016h,01h,00h,00h,09Dh,01h,00h,00h,0Fh,01h,00h,00h
jpt_66539:
        dd MainMenuScreen_B4
        dd MainMenuScreen_C9
        dd MainMenuScreen_DE
        dd MainMenuScreen_F3
jpt_66549:
        dd MainMenuScreen_621
        dd MainMenuScreen_774
        dd MainMenuScreen_8A9
        dd MainMenuScreen_8B5
        dd MainMenuScreen_92D
        dd MainMenuScreen_939
        dd MainMenuScreen_996
        dd MainMenuScreen_9EE
jpt_66569:
        dd MainMenuScreen_671
        dd MainMenuScreen_6FC
        dd MainMenuScreen_724
        dd MainMenuScreen_74C
jpt_66579:
        dd MainMenuScreen_A0B
        dd MainMenuScreen_A14
        dd MainMenuScreen_A1D
        dd MainMenuScreen_A26
;-----------------------------------------------------------------------------
; MainMenuScreen                               66589  96 PC, medium confidence
; From RunFrontEnd: the main menu (bkgd, !pal, 8 items, buttons by optflags)
;-----------------------------------------------------------------------------
MainMenuScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 50Ch, 0
        sub ebp, 82h
        mov ecx, 60h
        lea edi, [dword ebp-015Ah]
        mov esi, unk_663B9
        mov eax, 4
        xor edx, edx
        rep movsd
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 4Ch
        call LoadPackedFile
        push str_Pal11
        push eax
        mov esi, eax
        mov dword [byte ebp+076h], eax
        call FindShape
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp+06Eh], eax
        call SetScreenColors
        call SetScreenTarget
        push byte 0
        call sub_ADA50
        add esp, byte 4
        call BlackPalette
        push str_Bkgd5
        push esi
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        lea edx, [dword ebp-048Ah]
        mov eax, 8
        call InitMenuItems
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        mov dword [byte ebp+072h], 0FFFFFFFFh
        cmp eax, byte 3
        ja short MainMenuScreen_F3.2
        jmp dword [nosplit cs:eax*4+jpt_66539]
MainMenuScreen_B4:
        push str_Bt013
        push esi
        call FindShape
        add esp, byte 8
        push str_Bt023
        jmp short MainMenuScreen_F3.1
MainMenuScreen_C9:
        push str_Bt102
        push esi
        call FindShape
        add esp, byte 8
        push str_Bt112
        jmp short MainMenuScreen_F3.1
MainMenuScreen_DE:
        push str_Bt19
        push esi
        call FindShape
        add esp, byte 8
        push str_Bt20
        jmp short MainMenuScreen_F3.1
MainMenuScreen_F3:
        push str_Bt28
        push esi
        call FindShape
        add esp, byte 8
        push str_Bt29
.1:
        push esi
        mov dword [dword ebp-0470h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-046Ch], eax
.2:
        lea eax, [dword ebp-015Ah]
        mov dword [dword ebp-0476h], eax
        mov eax, dword [dword ebp-0470h]
        mov dword [dword ebp-047Ah], 4
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-0464h], eax
        mov eax, dword [dword ebp-0470h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0450h], 0CEh
        mov dword [dword ebp-044Ch], 99h
        mov dword [dword ebp-0460h], eax
        mov eax, dword [optflags]
        mov byte [dword ebp-0447h], 2
        shl eax, 17h
        mov byte [dword ebp-0445h], 1
        shr eax, 1Eh
        mov dword [dword ebp-0458h], 33h
        cmp eax, byte 1
        jb short .3
        jbe short .4
        cmp eax, byte 2
        je short .5
        jmp short .7
.3:
        test eax, eax
        jne short .7
        push str_Bb01
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Bb02
        jmp short .6
.4:
        push str_Bb10
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Bb11
        jmp short .6
.5:
        push str_Bb19
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Bb20
.6:
        push dword [byte ebp+076h]
        mov dword [dword ebp-040Ah], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0406h], eax
.7:
        lea eax, [dword ebp-011Ah]
        mov dword [dword ebp-0410h], eax
        mov eax, dword [dword ebp-040Ah]
        mov dword [dword ebp-0414h], 4
        movsx eax, word [byte eax+0Ch]
        push str_Sta1
        mov dword [dword ebp-03FEh], eax
        mov eax, dword [dword ebp-040Ah]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-03EAh], 1BCh
        mov dword [dword ebp-03E6h], 99h
        mov byte [dword ebp-03E1h], 3
        mov byte [dword ebp-03E0h], 0
        mov dword [dword ebp-03F2h], 33h
        mov dword [dword ebp-03FAh], eax
        call FindShape
        add esp, byte 8
        push str_Sta2
        push dword [byte ebp+076h]
        mov dword [dword ebp-03A4h], eax
        call FindShape
        add esp, byte 8
        push str_Sta3
        push dword [byte ebp+076h]
        mov dword [dword ebp-03A0h], eax
        call FindShape
        mov dword [dword ebp-039Ch], eax
        lea eax, [dword ebp-0DAh]
        mov dword [dword ebp-03AAh], eax
        mov eax, dword [dword ebp-03A4h]
        mov dword [dword ebp-03AEh], 8
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Use1
        mov dword [dword ebp-0398h], eax
        mov eax, dword [dword ebp-03A4h]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0384h], 0CEh
        mov dword [dword ebp-0380h], 0D1h
        mov byte [dword ebp-037Ch], 0
        mov byte [dword ebp-037Bh], 4
        mov byte [dword ebp-0379h], 3
        mov dword [dword ebp-0394h], eax
        call FindShape
        add esp, byte 8
        push str_Use2
        push dword [byte ebp+076h]
        mov dword [dword ebp-033Eh], eax
        call FindShape
        add esp, byte 8
        push str_Use3
        push dword [byte ebp+076h]
        mov dword [dword ebp-033Ah], eax
        call FindShape
        mov dword [dword ebp-0336h], eax
        lea eax, [dword ebp-09Ah]
        mov dword [dword ebp-0344h], eax
        mov eax, dword [dword ebp-033Eh]
        mov dword [dword ebp-0348h], 8
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Opt1
        mov dword [dword ebp-0332h], eax
        mov eax, dword [dword ebp-033Eh]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-031Eh], 1BCh
        mov dword [dword ebp-031Ah], 0D1h
        mov byte [dword ebp-0316h], 1
        mov byte [dword ebp-0315h], 5
        mov byte [dword ebp-0314h], 2
        mov dword [dword ebp-032Eh], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-02D8h], eax
        push str_Opt2
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Opt3
        push dword [byte ebp+076h]
        mov dword [dword ebp-02D4h], eax
        call FindShape
        mov dword [dword ebp-02D0h], eax
        lea eax, [byte ebp-05Ah]
        mov dword [dword ebp-02DEh], eax
        mov eax, dword [dword ebp-02D8h]
        mov dword [dword ebp-02E2h], 8
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Hig1
        mov dword [dword ebp-02CCh], eax
        mov eax, dword [dword ebp-02D8h]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-02B8h], 0A3h
        mov dword [dword ebp-02B4h], 10Ch
        mov byte [dword ebp-02B0h], 2
        mov byte [dword ebp-02AFh], 6
        mov byte [dword ebp-02ADh], 5
        mov dword [dword ebp-02C8h], eax
        call FindShape
        add esp, byte 8
        push str_Hig2
        push dword [byte ebp+076h]
        mov dword [dword ebp-0272h], eax
        call FindShape
        add esp, byte 8
        push str_Hig3
        push dword [byte ebp+076h]
        mov dword [dword ebp-026Eh], eax
        call FindShape
        mov dword [dword ebp-026Ah], eax
        lea eax, [byte ebp-01Ah]
        mov dword [dword ebp-0278h], eax
        mov eax, dword [dword ebp-0272h]
        mov dword [dword ebp-027Ch], 8
        movsx eax, word [byte eax+0Ch]
        lea edi, [dword ebp-0226h]
        mov dword [dword ebp-0266h], eax
        mov eax, dword [dword ebp-0272h]
        mov esi, TeamStatsBitmap
        mov ecx, 66h
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [dword ebp-0262h], eax
        mov ax, word [word_114CE0]
        mov dword [dword ebp-0252h], 1E4h
        xor ah, ah
        mov dword [dword ebp-024Eh], 10Ch
        and al, 1
        mov byte [dword ebp-024Ah], 3
        or al, 6
        mov byte [dword ebp-0249h], 7
        cwde
        mov byte [dword ebp-0248h], 4
        call OpenScreen
        rep movsb
        mov byte [dword ebp-01E4h], 4
        mov byte [dword ebp-01E2h], 6
        mov ecx, 66h
        lea edi, [dword ebp-01C0h]
        mov esi, dword_17BD48
        mov byte [dword ebp-01E1h], 7
        mov byte [dword ebp-01E3h], 6
        rep movsb
        mov byte [dword ebp-017Eh], 5
        push dword [dword ebp-0460h]
        mov byte [dword ebp-017Ch], 6
        push dword [dword ebp-0464h]
        mov byte [dword ebp-017Bh], 7
        push dword [dword ebp-0470h]
        mov byte [dword ebp-017Dh], 7
        call DrawArt
        add esp, byte 0Ch
        push dword [dword ebp-03FAh]
        push dword [dword ebp-03FEh]
        push dword [dword ebp-040Ah]
        call DrawArt
        add esp, byte 0Ch
        call GetInputDevices
        call MusicDone
        test eax, eax
        jne short .8
        call PlayMusic
.8:
        push dword [dword ebp-0182h]
        push dword [dword ebp-0186h]
        call MouseRead
        mov ebx, 3
        mov edx, dword [byte ebp+06Eh]
        add esp, byte 8
        xor eax, eax
        mov dword [byte ebp+06Ah], 7
        call FadePalette
.9:
        call SoundIdle
        cmp dword [byte ebp+06Ah], byte 0
        jl short .11
        cmp dword [byte ebp+06Ah], byte 8
        jge short .11
        imul eax, dword [byte ebp+06Ah], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0450h]
        jne short .10
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-044Ch]
        je short .11
.10:
        mov dword [byte ebp+06Ah], 0FFFFFFFFh
.11:
        push byte 2
        lea eax, [byte ebp+06Ah]
        push byte 6
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-048Ah]
        push eax
        xor ecx, ecx
        mov eax, 8
        call RunMenu
        cmp dword [byte ebp+06Ah], byte 7
        ja near MainMenuScreen_A26.28
        mov eax, dword [byte ebp+06Ah]
        jmp dword [nosplit cs:eax*4+jpt_66549]
MainMenuScreen_621:
        mov edx, dword [optflags]
        mov eax, dword [optflags]
        and edx, byte 70h
        and al, 8Fh
        cmp edx, byte 30h
        je short .12
        mov edx, dword [optflags]
        shl edx, 19h
        shr edx, 1Dh
        inc edx
        and edx, byte 7
        shl edx, 4
        mov dword [optflags], eax
        or eax, edx
.12:
        mov dword [optflags], eax
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 3
        ja near MainMenuScreen_671.14
        jmp dword [nosplit cs:eax*4+jpt_66569]
MainMenuScreen_671:
        push str_Bt013
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Bt023
        mov dword [byte ebp+07Eh], 1Eh
        mov dword [byte ebp+07Ah], 24h
.13:
        push dword [byte ebp+076h]
        mov dword [dword ebp-0470h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-046Ch], eax
.14:
        mov eax, dword [byte ebp+07Eh]
        cmp eax, dword [byte ebp+07Ah]
        jg near MainMenuScreen_A26.28
        push eax
        push str_Bt02d
        lea eax, [byte ebp+062h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+062h]
        push eax
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        inc dword [byte ebp+07Eh]
        call GetTicks
        lea esi, [byte eax+03h]
.15:
        call GetTicks
        cmp eax, esi
        jge short .14
        call SoundIdle
        jmp short .15
MainMenuScreen_6FC:
        push str_Bt102
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Bt112
        mov dword [byte ebp+07Eh], 3
        mov dword [byte ebp+07Ah], 9
        jmp near MainMenuScreen_671.13
MainMenuScreen_724:
        push str_Bt19
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Bt20
        mov dword [byte ebp+07Eh], 0Ch
        mov dword [byte ebp+07Ah], 12h
        jmp near MainMenuScreen_671.13
MainMenuScreen_74C:
        push str_Bt28
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Bt29
        mov dword [byte ebp+07Eh], 15h
        mov dword [byte ebp+07Ah], 1Bh
        jmp near MainMenuScreen_671.13
MainMenuScreen_774:
        mov edx, dword [optflags]
        mov eax, dword [optflags]
        and edx, 180h
        and ax, 0FE7Fh
        cmp edx, 100h
        je short .16
        mov edx, dword [optflags]
        shl edx, 17h
        shr edx, 1Eh
        inc edx
        and edx, byte 3
        shl edx, 7
        mov dword [optflags], eax
        or eax, edx
.16:
        mov dword [optflags], eax
        mov eax, dword [optflags]
        shl eax, 17h
        shr eax, 1Eh
        cmp eax, byte 1
        jb short .17
        jbe short .18
        cmp eax, byte 2
        je short .19
        jmp near .21
.17:
        test eax, eax
        jne near .21
        push str_Bb01
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Bb02
        mov dword [byte ebp+07Eh], 15h
        mov dword [byte ebp+07Ah], 1Bh
        jmp short .20
.18:
        push str_Bb10
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Bb11
        mov dword [byte ebp+07Eh], 3
        mov dword [byte ebp+07Ah], 9
        jmp short .20
.19:
        push str_Bb19
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Bb20
        mov dword [byte ebp+07Eh], 0Ch
        mov dword [byte ebp+07Ah], 12h
.20:
        push dword [byte ebp+076h]
        mov dword [dword ebp-040Ah], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0406h], eax
.21:
        mov eax, dword [byte ebp+07Eh]
        cmp eax, dword [byte ebp+07Ah]
        jg near MainMenuScreen_A26.28
        push eax
        push str_Bb02d
        lea eax, [byte ebp+062h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+062h]
        push eax
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        inc dword [byte ebp+07Eh]
        call GetTicks
        lea esi, [byte eax+03h]
.22:
        call GetTicks
        cmp eax, esi
        jge short .21
        call SoundIdle
        jmp short .22
MainMenuScreen_8A9:
        mov dword [byte ebp+072h], 0Dh
        jmp near MainMenuScreen_A26.28
MainMenuScreen_8B5:
        mov edx, 3
        lea eax, [byte ebp+026h]
        xor ebx, ebx
        call MakeDirPath
        mov edx, str_LOCALNDX2
        lea eax, [byte ebp+026h]
        call NameIndexLoad
        mov esi, eax
        test eax, eax
        je short .23
        mov eax, dword [byte eax+066h]
        dec eax
        dec eax
        test eax, eax
        jle short .23
        mov dword [byte ebp+072h], 10h
        jmp short .25
.23:
        xor eax, eax
        call GetLangText
        push byte 2
        push byte 0
        push dword 122h
        mov ecx, byte_17BDAE
        push dword 140h
        lea ebx, [byte ebp+05Ah]
        mov dword [byte ebp+05Ah], eax
        push byte 0
        mov eax, 25Fh
.24:
        mov edx, 1
        call GetLangText
        call MessageBox
.25:
        mov edx, esi
        xor eax, eax
        call NameIndexFree
        jmp near MainMenuScreen_A26.28
MainMenuScreen_92D:
        mov dword [byte ebp+072h], 4
        jmp near MainMenuScreen_A26.28
MainMenuScreen_939:
        mov edx, 7
        lea eax, [byte ebp+026h]
        xor ebx, ebx
        call MakeDirPath
        mov edx, str_HILITESNDX
        lea eax, [byte ebp+026h]
        call NameIndexLoad
        mov esi, eax
        test eax, eax
        je short .26
        cmp dword [byte eax+066h], byte 0
        jle short .26
        mov dword [byte ebp+072h], 0Bh
        jmp short MainMenuScreen_8B5.25
.26:
        xor eax, eax
        call GetLangText
        push byte 2
        push byte 0
        push dword 122h
        mov ecx, byte_17BDAE
        push dword 140h
        lea ebx, [byte ebp+05Ah]
        mov dword [byte ebp+05Ah], eax
        push byte 0
        mov eax, 51h
        jmp near MainMenuScreen_8B5.24
MainMenuScreen_996:
        call SlideInSideBar
        mov eax, 2
        call GetLangText
        mov dword [byte ebp+05Ah], eax
        mov eax, 3
        call GetLangText
        push byte 2
        push byte 1
        push dword 12Ch
        mov ecx, byte_17BDAE
        push dword 140h
        lea ebx, [byte ebp+05Ah]
        mov dword [byte ebp+05Eh], eax
        push byte 0
        mov eax, 54h
        mov edx, 2
        call GetLangText
        call MessageBox
        test eax, eax
        jne short MainMenuScreen_A26.28
        mov dword [byte ebp+072h], 17h
        jmp short MainMenuScreen_A26.28
MainMenuScreen_9EE:
        call SlideInTitleBar
        mov eax, dword [optflags]
        shl eax, 19h
        shr eax, 1Dh
        cmp eax, byte 3
        ja short MainMenuScreen_A26.27
        jmp dword [nosplit cs:eax*4+jpt_66579]
MainMenuScreen_A0B:
        mov dword [byte ebp+072h], 1
        jmp short MainMenuScreen_A26.28
MainMenuScreen_A14:
        mov dword [byte ebp+072h], 7
        jmp short MainMenuScreen_A26.28
MainMenuScreen_A1D:
        mov dword [byte ebp+072h], 13h
        jmp short MainMenuScreen_A26.28
MainMenuScreen_A26:
        mov dword [byte ebp+072h], 12h
        jmp short .28
.27:
        mov dword [byte ebp+072h], 0FFFFFFFFh
.28:
        cmp dword [byte ebp+072h], byte 0
        jl near MainMenuScreen_F3.9
        push dword [byte ebp+076h]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 3
        call FadeOut
        cmp dword [byte ebp+072h], byte 17h
        jne short .29
        mov eax, 32h
        xor edx, edx
        call FadeOutMusic
.29:
        mov eax, dword [byte ebp+072h]
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
