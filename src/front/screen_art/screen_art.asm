; Front-end screen art: load and free it, team name images, the screen frame and its sliding bars (96 PC).
bits 32
%include "hockey.inc"
section s_625F7 progbits alloc exec nowrite align=1
extern byte_17BB64, byte_17BCBE, byte_17BCBF, byte_17BCC0, byte_17BCC1, byte_17BD24, byte_17BD25, byte_17BD26
extern byte_17BD27, byte_17BD8A, byte_17BD8B, byte_17BD8C, byte_17BD8D, byte_17BDAE, byte_17BDAF, byte_17BDB0
extern CopyBitmap, DrawFrameAt, dword_11BCE0, dword_11BCE4, dword_17BA7C, dword_17BAB0, dword_17BAB4, dword_17BAE8
extern dword_17BAEC, dword_17BB20, dword_17BC64, dword_17BC68, dword_17BC6C, dword_17BC70, dword_17BC74, dword_17BC78
extern dword_17BC7C, dword_17BC8C, dword_17BC90, dword_17BC96, dword_17BC9A, dword_17BCA2, dword_17BCA6, dword_17BCAE
extern dword_17BCB6, dword_17BCBA, dword_17BCE2, dword_17BCF2, dword_17BCF6, dword_17BCFC, dword_17BD00, dword_17BD08
extern dword_17BD0C, dword_17BD14, dword_17BD1C, dword_17BD20, dword_17BD48, dword_17BD58, dword_17BD5C, dword_17BD62
extern dword_17BD66, dword_17BD6E, dword_17BD72, dword_17BD7A, dword_17BD82, dword_17BD86, GetTicks, InitMenuItems
extern LoadPackedFile, PutBlock, SetDrawBitmap, SetScreenPalette, SoundIdle, sprintf_, str_CHECK, str_M03d
extern str_Mhil, str_MODEM, str_Pal7, str_TN02d, str_X03d, str_XBUT, str_Xhil, str_Y03d
extern str_Yhil, DrawShapeCore, AllocMemBlock, FreeMemBlock, sub_AD35C, sub_AD620, sub_ADBEC, SaveTextState
extern SetDrawTarget, SetScreenTarget, KbdGetKey, sub_E04E0, TextSetFont, unk_11BCE8, unk_11BD28, unk_11BD68
extern unk_17BB24
global LoadFrontEndArt, LoadFrontEndArt_412, GetTeamNameArt, CopyArtRows, OpenScreen, SlideInTitleBar, SlideInTitleBar_62, SlideInTitleBar_6A
global SlideInTitleBar_6D, SlideInSideBar, SlideInBottomBar, FreeFrontEndArt, SetScreenColors
;-----------------------------------------------------------------------------
; LoadFrontEndArt                              625F7  96 PC, medium confidence
; At start-up and after a game: the front-end art files (0Ah, 0Bh, 0B0h,
; 0Ch), !pal, CHECK, XBUT, MODEM, the fonts
;-----------------------------------------------------------------------------
LoadFrontEndArt:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 2Ch, 0
        mov edx, 20h
        mov eax, 0Ah
        call LoadPackedFile
        mov edx, 20h
        mov dword [dword_17BC78], eax
        mov eax, 0Bh
        call LoadPackedFile
        mov edx, 20h
        mov dword [dword_17BC74], eax
        mov eax, 0B0h
        call LoadPackedFile
        mov edx, 20h
        mov dword [dword_11BCE0], eax
        mov eax, 0Ch
        call LoadPackedFile
        push str_Pal7
        push eax
        mov dword [dword_11BCE4], eax
        call sub_E04E0
        add esp, byte 8
        push byte 20h
        mov byte [byte_17BDAF], 0FEh
        push dword 842Eh
        mov byte [byte_17BDAE], 0FCh
        add eax, byte 10h
        push str_CHECK
        mov byte [byte_17BDB0], 0FDh
        mov dword [dword_17BC6C], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push dword 842Eh
        push str_XBUT
        mov dword [dword_17BC70], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push dword 842Eh
        mov dword [byte ebp-0Ch], 0
        mov dword [byte ebp-020h], 0
        push str_MODEM
        mov dword [byte ebp-014h], 0
        mov dword [dword_17BC64], eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [dword_17BC68], eax
.1:
        push dword [byte ebp-0Ch]
        push str_Y03d
        lea eax, [byte ebp-02Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-02Ch]
        push eax
        mov esi, dword [byte ebp-014h]
        push dword [dword_11BCE4]
        add dword [byte ebp-014h], byte 4
        call sub_E04E0
        mov ecx, 971h
        mov edi, dword [dword_17BC70]
        add esp, byte 8
        mov dword [dword esi+dword_17BAEC], eax
        mov esi, eax
        add edi, dword [byte ebp-020h]
        inc dword [byte ebp-0Ch]
        rep movsb
        add dword [byte ebp-020h], 971h
        cmp dword [byte ebp-0Ch], byte 0Dh
        jl short .1
        push str_Yhil
        mov dword [byte ebp-04h], 0
        mov dword [byte ebp-024h], 0
        push dword [dword_11BCE4]
        mov dword [byte ebp-010h], 0
        call sub_E04E0
        mov ecx, 971h
        mov edi, dword [dword_17BC70]
        add esp, byte 8
        mov esi, eax
        add edi, 7ABDh
        mov dword [dword_17BB20], eax
        rep movsb
.2:
        push dword [byte ebp-04h]
        push str_X03d
        lea eax, [byte ebp-02Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-02Ch]
        push eax
        mov esi, dword [byte ebp-010h]
        push dword [dword_11BCE4]
        add dword [byte ebp-010h], byte 4
        call sub_E04E0
        mov ecx, 971h
        mov edi, dword [dword_17BC64]
        add esp, byte 8
        mov dword [dword esi+dword_17BA7C], eax
        mov esi, eax
        add edi, dword [byte ebp-024h]
        inc dword [byte ebp-04h]
        rep movsb
        add dword [byte ebp-024h], 971h
        cmp dword [byte ebp-04h], byte 0Dh
        jl short .2
        push str_Xhil
        mov dword [byte ebp-08h], 0
        mov dword [byte ebp-01Ch], 0
        push dword [dword_11BCE4]
        mov dword [byte ebp-018h], 0
        call sub_E04E0
        mov ecx, 971h
        mov edi, dword [dword_17BC64]
        add esp, byte 8
        mov esi, eax
        add edi, 7ABDh
        mov dword [dword_17BAB0], eax
        rep movsb
.3:
        push dword [byte ebp-08h]
        push str_M03d
        lea eax, [byte ebp-02Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-02Ch]
        push eax
        mov esi, dword [byte ebp-018h]
        push dword [dword_11BCE4]
        add dword [byte ebp-018h], byte 4
        call sub_E04E0
        mov ecx, 971h
        mov edi, dword [dword_17BC68]
        add esp, byte 8
        mov dword [dword esi+dword_17BAB4], eax
        mov esi, eax
        add edi, dword [byte ebp-01Ch]
        inc dword [byte ebp-08h]
        rep movsb
        add dword [byte ebp-01Ch], 971h
        cmp dword [byte ebp-08h], byte 0Dh
        jl short .3
        push str_Mhil
        push dword [dword_11BCE4]
        call sub_E04E0
        mov ecx, 971h
        mov edx, dword_17BD48
        mov edi, dword [dword_17BC68]
        add esp, byte 8
        mov esi, eax
        add edi, 7ABDh
        mov dword [dword_17BAE8], eax
        rep movsb
        mov eax, 1
        call InitMenuItems
        mov dword [dword_17BD48], 0FFFFFFFFh
        mov dword [dword_17BD58], 8
        mov dword [dword_17BD5C], unk_11BD28
        mov dword [dword_17BD6E], 23Dh
        mov dword [dword_17BD72], 1A4h
        mov dword [dword_17BD82], 255h
        mov eax, dword [dword_17BC70]
        mov dword [dword_17BD86], 1C0h
        mov dword [dword_17BD62], eax
        add eax, 7ABDh
        mov edx, dword_17BC7C
        mov dword [dword_17BD66], eax
        mov eax, 1
        mov dword [dword_17BD7A], 33h
        call InitMenuItems
        mov dword [dword_17BC7C], 0FFFFFFFFh
        mov dword [dword_17BC8C], 8
        mov dword [dword_17BC90], unk_11BD68
        mov dword [dword_17BCA2], 11h
        mov dword [dword_17BCA6], 1A4h
        mov dword [dword_17BCB6], 2Ch
        mov eax, dword [dword_17BC64]
        mov dword [dword_17BCBA], 1C0h
        mov dword [dword_17BC96], eax
        add eax, 7ABDh
        mov edx, dword_17BCE2
        mov dword [dword_17BC9A], eax
        mov eax, 1
        mov dword [dword_17BCAE], 33h
        call InitMenuItems
        mov dword [dword_17BCE2], 0FFFFFFFFh
        mov dword [dword_17BCF2], 8
        mov dword [dword_17BCF6], unk_11BCE8
        mov dword [dword_17BD08], 244h
        mov dword [dword_17BD0C], 1Bh
        mov dword [dword_17BD1C], 264h
        mov dword [dword_17BD20], 3Ch
        mov eax, dword [dword_17BC68]
        push unk_17BB24
        mov dword [dword_17BCFC], eax
        add eax, 7ABDh
        mov dword [dword_17BD14], 33h
        mov dword [dword_17BD00], eax
        call SaveTextState
        add esp, byte 4
        push dword [dword_17BC78]
        call TextSetFont
        add esp, byte 4
        mov eax, dword [dword_17BC6C]
        call SetScreenPalette
LoadFrontEndArt_412:
        leave
        jmp near SlideInTitleBar_6D
;-----------------------------------------------------------------------------
; GetTeamNameArt                               62A0F  96 PC, medium confidence
; (team): the team name image TN%02d from the art file
;-----------------------------------------------------------------------------
GetTeamNameArt:
        push ebx
        push ecx
        push edx
        enter 8, 0
        cmp dword [dword_11BCE0], byte 0
        je short .1
        push eax
        push str_TN02d
        lea eax, [byte ebp-08h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-08h]
        push eax
        push dword [dword_11BCE0]
        call sub_E04E0
        add esp, byte 8
        leave
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        xor eax, eax
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CopyArtRows                                     62A4F  96 PC, low confidence
; Copies an art block's rows (for OpenScreen)
;-----------------------------------------------------------------------------
CopyArtRows:
        push ebx
        push ecx
        push esi
        push edi
        enter 18h, 0
        mov ebx, dword [byte eax+02Ch]
        movsx ecx, word [byte ebx+04h]
        add ebx, byte 10h
        add ecx, ecx
        add ebx, ecx
        mov dword [byte ebp-0Ch], ebx
        lea ebx, [byte edx+010h]
        mov dword [byte ebp-010h], ebx
        mov ebx, dword [byte eax+04h]
        dec ebx
        dec ebx
        mov dword [byte ebp-04h], 0
        mov dword [byte ebp-014h], ebx
.1:
        mov ebx, dword [byte ebp-04h]
        cmp ebx, dword [byte ebp-014h]
        jge near .5
        movsx ebx, word [byte edx+06h]
        cmp ebx, dword [byte ebp-04h]
        jle short .5
        mov ecx, dword [byte eax+02Ch]
        mov ebx, dword [byte ebp-0Ch]
        mov esi, dword [byte ebp-010h]
        movsx ecx, word [byte ecx+04h]
        mov dword [byte ebp-08h], 0
        dec ecx
        dec ecx
        inc ebx
        inc ebx
        mov dword [byte ebp-018h], ecx
.2:
        mov ecx, dword [byte ebp-08h]
        cmp ecx, dword [byte ebp-018h]
        jge short .4
        movsx ecx, word [byte edx+04h]
        cmp ecx, dword [byte ebp-08h]
        jle short .4
        movzx ecx, byte [esi]
        cmp ecx, 0FFh
        je short .3
        movzx edi, byte [ebx]
        mov cl, byte [dword edi+byte_17BB64]
        mov byte [ebx], cl
.3:
        inc dword [byte ebp-08h]
        inc ebx
        inc esi
        jmp short .2
.4:
        mov ebx, dword [byte eax+02Ch]
        movsx ebx, word [byte ebx+04h]
        add dword [byte ebp-0Ch], ebx
        movsx ebx, word [byte edx+04h]
        inc dword [byte ebp-04h]
        add dword [byte ebp-010h], ebx
        jmp short .1
.5:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; OpenScreen                                      62AF7  96 PC, low confidence
; Draws the screen frame art (title bar, side bars) for the front-end screens
;-----------------------------------------------------------------------------
OpenScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 18h, 0
        push eax
        call SetScreenTarget
        mov edx, 20h
        mov eax, dword [dword_17BAEC]
        call CopyBitmap
        push dword [dword_17BD72]
        push dword [dword_17BD6E]
        push eax
        mov dword [byte ebp-010h], eax
        call DrawShapeCore
        add esp, byte 0Ch
        mov edx, 20h
        mov eax, dword [dword_17BA7C]
        call CopyBitmap
        push dword [dword_17BCA6]
        push dword [dword_17BCA2]
        push eax
        mov dword [byte ebp-018h], eax
        call DrawShapeCore
        add esp, byte 0Ch
        mov edx, 20h
        mov eax, dword [dword_17BAB4]
        call CopyBitmap
        push dword [dword_17BD0C]
        push dword [dword_17BD08]
        push eax
        mov dword [byte ebp-014h], eax
        call DrawShapeCore
        add esp, byte 0Ch
        push byte 0
        push byte 31h
        push byte 31h
        call sub_AD35C
        add esp, byte 0Ch
        mov dword [byte ebp-0Ch], 0
        push eax
        mov dword [byte ebp-04h], 0
        mov dword [byte ebp-08h], eax
        call SetDrawBitmap
        add esp, byte 4
.1:
        push byte 0
        push byte 0
        push dword [byte ebp-010h]
        call PutBlock
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-08h]
        add esp, byte 0Ch
        mov edx, dword [dword edx+dword_17BAEC]
        xor ecx, ecx
        call CopyArtRows
        mov edx, dword [byte ebp-04h]
        xor ebx, ebx
        mov eax, 0FAE1h
        mov edx, dword [dword edx+dword_17BAEC]
        mov esi, dword [byte ebp-08h]
        call DrawFrameAt
        mov ecx, 961h
        mov edi, dword [dword_17BC70]
        mov esi, dword [byte esi+02Ch]
        add edi, dword [byte ebp-0Ch]
        add esi, byte 10h
        add edi, byte 10h
        rep movsb
        push byte 0
        push byte 0
        push dword [byte ebp-018h]
        call PutBlock
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-08h]
        add esp, byte 0Ch
        mov edx, dword [dword edx+dword_17BA7C]
        xor ecx, ecx
        call CopyArtRows
        mov edx, dword [byte ebp-04h]
        xor ebx, ebx
        mov eax, 0FAE1h
        mov edx, dword [dword edx+dword_17BA7C]
        mov esi, dword [byte ebp-08h]
        call DrawFrameAt
        mov ecx, 961h
        mov edi, dword [dword_17BC64]
        mov esi, dword [byte esi+02Ch]
        add edi, dword [byte ebp-0Ch]
        add esi, byte 10h
        add edi, byte 10h
        rep movsb
        push byte 0
        push byte 0
        push dword [byte ebp-014h]
        mov esi, dword [byte ebp-08h]
        call PutBlock
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-08h]
        add esp, byte 0Ch
        mov edx, dword [dword edx+dword_17BAB4]
        xor ecx, ecx
        call CopyArtRows
        mov edx, dword [byte ebp-04h]
        xor ebx, ebx
        mov eax, 0FAE1h
        mov edx, dword [dword edx+dword_17BAB4]
        add dword [byte ebp-04h], byte 4
        call DrawFrameAt
        mov ecx, 961h
        mov edi, dword [dword_17BC68]
        mov esi, dword [byte esi+02Ch]
        add edi, dword [byte ebp-0Ch]
        add esi, byte 10h
        add edi, byte 10h
        add dword [byte ebp-0Ch], 971h
        rep movsb
        cmp dword [byte ebp-04h], byte 38h
        jne near .1
        call SetScreenTarget
        test byte [byte ebp-01Ch], 2
        je short .2
        push dword [dword_17BD72]
        push dword [dword_17BD6E]
        push dword [dword_17BD62]
        call PutBlock
        add esp, byte 0Ch
.2:
        test byte [byte ebp-01Ch], 4
        je short .3
        push dword [dword_17BCA6]
        push dword [dword_17BCA2]
        push dword [dword_17BC96]
        call PutBlock
        add esp, byte 0Ch
.3:
        test byte [byte ebp-01Ch], 1
        je short .4
        push dword [dword_17BD0C]
        push dword [dword_17BD08]
        push dword [dword_17BCFC]
        call PutBlock
        add esp, byte 0Ch
.4:
        push dword [byte ebp-08h]
        call sub_ADBEC
        add esp, byte 4
        push dword [byte ebp-018h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp-010h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp-014h]
        call FreeMemBlock
        mov byte [byte_17BD8A], 0
        mov byte [byte_17BD8B], 0
        mov byte [byte_17BD8C], 0
        mov byte [byte_17BD8D], 0
        mov byte [byte_17BCBE], 0
        mov byte [byte_17BCBF], 0
        mov byte [byte_17BCC0], 0
        mov byte [byte_17BCC1], 0
        mov byte [byte_17BD24], 0
        mov byte [byte_17BD25], 0
        mov byte [byte_17BD26], 0
        mov byte [byte_17BD27], 0
        add esp, byte 4
        jmp near LoadFrontEndArt_412
;-----------------------------------------------------------------------------
; SlideInTitleBar                                 62D9B  96 PC, low confidence
; Animates the title bar in (PutBlock 971h steps, 2 ticks each)
;-----------------------------------------------------------------------------
SlideInTitleBar:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        call SetScreenTarget
        mov esi, 971h
.1:
        push dword [dword_17BD72]
        mov eax, dword [dword_17BC70]
        push dword [dword_17BD6E]
        add eax, esi
        push eax
        call PutBlock
        add esp, byte 0Ch
        call GetTicks
        lea edi, [byte eax+02h]
.2:
        call GetTicks
        cmp eax, edi
        jge short .3
        call SoundIdle
        jmp short .2
.3:
        add esi, 971h
        cmp esi, 7ABDh
        jne short .1
        push dword [dword_17BD72]
        mov eax, dword [dword_17BC70]
        push dword [dword_17BD6E]
SlideInTitleBar_62:
        add eax, esi
        push eax
        call PutBlock
SlideInTitleBar_6A:
        add esp, byte 0Ch
SlideInTitleBar_6D:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SlideInSideBar                                  62E0E  96 PC, low confidence
; The same for the second bar (dword_17BC64)
;-----------------------------------------------------------------------------
SlideInSideBar:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        call SetScreenTarget
        mov esi, 971h
.1:
        push dword [dword_17BCA6]
        mov eax, dword [dword_17BC64]
        push dword [dword_17BCA2]
        add eax, esi
        push eax
        call PutBlock
        add esp, byte 0Ch
        call GetTicks
        lea edi, [byte eax+02h]
.2:
        call GetTicks
        cmp eax, edi
        jge short .3
        call SoundIdle
        jmp short .2
.3:
        add esi, 971h
        cmp esi, 7ABDh
        jne short .1
        push dword [dword_17BCA6]
        mov eax, dword [dword_17BC64]
        push dword [dword_17BCA2]
        jmp short SlideInTitleBar_62
;-----------------------------------------------------------------------------
; SlideInBottomBar                                62E72  96 PC, low confidence
; The same for the third bar (dword_17BC68)
;-----------------------------------------------------------------------------
SlideInBottomBar:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        call SetScreenTarget
        mov esi, 971h
.1:
        push dword [dword_17BD0C]
        mov eax, dword [dword_17BC68]
        push dword [dword_17BD08]
        add eax, esi
        push eax
        call PutBlock
        add esp, byte 0Ch
        call GetTicks
        lea edi, [byte eax+02h]
.2:
        call GetTicks
        cmp eax, edi
        jge short .3
        call SoundIdle
        jmp short .2
.3:
        add esi, 971h
        cmp esi, 7ABDh
        jne short .1
        push dword [dword_17BD0C]
        mov eax, dword [dword_17BC68]
        push dword [dword_17BD08]
        jmp near SlideInTitleBar_62
;-----------------------------------------------------------------------------
; FreeFrontEndArt                              62ED9  96 PC, medium confidence
; Frees what LoadFrontEndArt loaded
;-----------------------------------------------------------------------------
FreeFrontEndArt:
        push ebx
        push ecx
        push edx
        mov edx, dword_17BD48
        mov eax, 1
        call InitMenuItems
        mov edx, dword_17BC7C
        mov eax, 1
        call InitMenuItems
        mov edx, dword_17BCE2
        mov eax, 1
        call InitMenuItems
        push dword [dword_11BCE0]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_11BCE4]
        mov dword [dword_11BCE0], 0
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_17BC70]
        mov dword [dword_11BCE4], 0
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_17BC64]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_17BC68]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_17BC78]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_17BC74]
        call FreeMemBlock
        add esp, byte 4
        push unk_17BB24
        call SetDrawTarget
        add esp, byte 4
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetScreenColors                                 62F90  96 PC, low confidence
; (palette): copies the front-end text colours into the palette and sets it
;-----------------------------------------------------------------------------
SetScreenColors:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov edx, eax
        mov ecx, 4Bh
        mov esi, dword [dword_17BC6C]
        lea edi, [dword eax+02B2h]
        add esi, 2B2h
        rep movsb
        mov eax, edx
        call SetScreenPalette
        push byte_17BB64
        push edx
        push dword 0AE14h
        call sub_AD620
        jmp near SlideInTitleBar_6A
        push ebx
        push ecx
        push edx
        call KbdGetKey
        pop edx
        pop ecx
        pop ebx
        ret
