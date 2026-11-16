; Front-end screen art: load and free it, team name images, the screen frame and its sliding bars.
bits 32
%include "hockey.inc"
section s_625F7 progbits alloc exec nowrite align=1
extern ScreenColorMap
extern TitleTextStyle
extern CopyBitmap, DrawFrameAt, TeamNameArt, WaitBoxArt, FrontEndBarShapes
extern SideBarBmp, BottomBarBmp, ScreenPaletteBuf, TitleBarBmp, FrontEndScreenBmp, MatchupLayer
extern TeamStatsBitmap, SideBarArt
extern MenuBoxStyle, BottomBarArt
extern TitleBarArt
extern GetTicks, InitMenuItems
extern LoadPackedFile, PutBlock, SetDrawBitmap, SetScreenPalette, SoundIdle, sprintf_, str_CHECK, str_M03d
extern str_Mhil, str_MODEM, str_Pal7, str_TN02d, str_X03d, str_XBUT, str_Xhil, str_Y03d
extern str_Yhil, DrawShapeCore, AllocMemBlock, FreeMemBlock, CreateBitmap, TintRect, FreeBitmap, SaveTextState
extern SetDrawTarget, SetScreenTarget, KbdGetKey, FindShape, TextSetFont, BottomBarDef, TitleBarDef, SideBarDef
extern FrontEndArtFiles
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
        mov dword [MatchupLayer], eax
        mov eax, 0Bh
        call LoadPackedFile
        mov edx, 20h
        mov dword [FrontEndScreenBmp], eax
        mov eax, 0B0h
        call LoadPackedFile
        mov edx, 20h
        mov dword [TeamNameArt], eax
        mov eax, 0Ch
        call LoadPackedFile
        push str_Pal7
        push eax
        mov dword [WaitBoxArt], eax
        call FindShape
        add esp, byte 8
        push byte 20h
        mov byte [TitleTextStyle+1], 0FEh
        push dword 842Eh
        mov byte [TitleTextStyle], 0FCh
        add eax, byte 10h
        push str_CHECK
        mov byte [TitleTextStyle+2], 0FDh
        mov dword [ScreenPaletteBuf], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push dword 842Eh
        push str_XBUT
        mov dword [TitleBarBmp], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push dword 842Eh
        mov dword [byte ebp-0Ch], 0
        mov dword [byte ebp-020h], 0
        push str_MODEM
        mov dword [byte ebp-014h], 0
        mov dword [SideBarBmp], eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [BottomBarBmp], eax
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
        push dword [WaitBoxArt]
        add dword [byte ebp-014h], byte 4
        call FindShape
        mov ecx, 971h
        mov edi, dword [TitleBarBmp]
        add esp, byte 8
        mov dword [dword esi+FrontEndBarShapes+70h], eax
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
        push dword [WaitBoxArt]
        mov dword [byte ebp-010h], 0
        call FindShape
        mov ecx, 971h
        mov edi, dword [TitleBarBmp]
        add esp, byte 8
        mov esi, eax
        add edi, 7ABDh
        mov dword [FrontEndBarShapes+0A4h], eax
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
        push dword [WaitBoxArt]
        add dword [byte ebp-010h], byte 4
        call FindShape
        mov ecx, 971h
        mov edi, dword [SideBarBmp]
        add esp, byte 8
        mov dword [dword esi+FrontEndBarShapes], eax
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
        push dword [WaitBoxArt]
        mov dword [byte ebp-018h], 0
        call FindShape
        mov ecx, 971h
        mov edi, dword [SideBarBmp]
        add esp, byte 8
        mov esi, eax
        add edi, 7ABDh
        mov dword [FrontEndBarShapes+34h], eax
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
        push dword [WaitBoxArt]
        add dword [byte ebp-018h], byte 4
        call FindShape
        mov ecx, 971h
        mov edi, dword [BottomBarBmp]
        add esp, byte 8
        mov dword [dword esi+FrontEndBarShapes+38h], eax
        mov esi, eax
        add edi, dword [byte ebp-01Ch]
        inc dword [byte ebp-08h]
        rep movsb
        add dword [byte ebp-01Ch], 971h
        cmp dword [byte ebp-08h], byte 0Dh
        jl short .3
        push str_Mhil
        push dword [WaitBoxArt]
        call FindShape
        mov ecx, 971h
        mov edx, BottomBarArt+56h
        mov edi, dword [BottomBarBmp]
        add esp, byte 8
        mov esi, eax
        add edi, 7ABDh
        mov dword [FrontEndBarShapes+6Ch], eax
        rep movsb
        mov eax, 1
        call InitMenuItems
        mov dword [BottomBarArt+56h], 0FFFFFFFFh
        mov dword [TitleBarArt], 8
        mov dword [TitleBarArt+4], TitleBarDef
        mov dword [TitleBarArt+16h], 23Dh
        mov dword [TitleBarArt+1Ah], 1A4h
        mov dword [TitleBarArt+2Ah], 255h
        mov eax, dword [TitleBarBmp]
        mov dword [TitleBarArt+2Eh], 1C0h
        mov dword [TitleBarArt+0Ah], eax
        add eax, 7ABDh
        mov edx, TeamStatsBitmap
        mov dword [TitleBarArt+0Eh], eax
        mov eax, 1
        mov dword [TitleBarArt+22h], 33h
        call InitMenuItems
        mov dword [TeamStatsBitmap], 0FFFFFFFFh
        mov dword [SideBarArt], 8
        mov dword [SideBarArt+4], SideBarDef
        mov dword [SideBarArt+16h], 11h
        mov dword [SideBarArt+1Ah], 1A4h
        mov dword [SideBarArt+2Ah], 2Ch
        mov eax, dword [SideBarBmp]
        mov dword [SideBarArt+2Eh], 1C0h
        mov dword [SideBarArt+0Ah], eax
        add eax, 7ABDh
        mov edx, MenuBoxStyle
        mov dword [SideBarArt+0Eh], eax
        mov eax, 1
        mov dword [SideBarArt+22h], 33h
        call InitMenuItems
        mov dword [MenuBoxStyle], 0FFFFFFFFh
        mov dword [BottomBarArt], 8
        mov dword [BottomBarArt+4], BottomBarDef
        mov dword [BottomBarArt+16h], 244h
        mov dword [BottomBarArt+1Ah], 1Bh
        mov dword [BottomBarArt+2Ah], 264h
        mov dword [BottomBarArt+2Eh], 3Ch
        mov eax, dword [BottomBarBmp]
        push FrontEndArtFiles
        mov dword [BottomBarArt+0Ah], eax
        add eax, 7ABDh
        mov dword [BottomBarArt+22h], 33h
        mov dword [BottomBarArt+0Eh], eax
        call SaveTextState
        add esp, byte 4
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        mov eax, dword [ScreenPaletteBuf]
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
        cmp dword [TeamNameArt], byte 0
        je short .1
        push eax
        push str_TN02d
        lea eax, [byte ebp-08h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-08h]
        push eax
        push dword [TeamNameArt]
        call FindShape
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
        mov cl, byte [dword edi+ScreenColorMap]
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
        mov eax, dword [FrontEndBarShapes+70h]
        call CopyBitmap
        push dword [TitleBarArt+1Ah]
        push dword [TitleBarArt+16h]
        push eax
        mov dword [byte ebp-010h], eax
        call DrawShapeCore
        add esp, byte 0Ch
        mov edx, 20h
        mov eax, dword [FrontEndBarShapes]
        call CopyBitmap
        push dword [SideBarArt+1Ah]
        push dword [SideBarArt+16h]
        push eax
        mov dword [byte ebp-018h], eax
        call DrawShapeCore
        add esp, byte 0Ch
        mov edx, 20h
        mov eax, dword [FrontEndBarShapes+38h]
        call CopyBitmap
        push dword [BottomBarArt+1Ah]
        push dword [BottomBarArt+16h]
        push eax
        mov dword [byte ebp-014h], eax
        call DrawShapeCore
        add esp, byte 0Ch
        push byte 0
        push byte 31h
        push byte 31h
        call CreateBitmap
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
        mov edx, dword [dword edx+FrontEndBarShapes+70h]
        xor ecx, ecx
        call CopyArtRows
        mov edx, dword [byte ebp-04h]
        xor ebx, ebx
        mov eax, 0FAE1h
        mov edx, dword [dword edx+FrontEndBarShapes+70h]
        mov esi, dword [byte ebp-08h]
        call DrawFrameAt
        mov ecx, 961h
        mov edi, dword [TitleBarBmp]
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
        mov edx, dword [dword edx+FrontEndBarShapes]
        xor ecx, ecx
        call CopyArtRows
        mov edx, dword [byte ebp-04h]
        xor ebx, ebx
        mov eax, 0FAE1h
        mov edx, dword [dword edx+FrontEndBarShapes]
        mov esi, dword [byte ebp-08h]
        call DrawFrameAt
        mov ecx, 961h
        mov edi, dword [SideBarBmp]
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
        mov edx, dword [dword edx+FrontEndBarShapes+38h]
        xor ecx, ecx
        call CopyArtRows
        mov edx, dword [byte ebp-04h]
        xor ebx, ebx
        mov eax, 0FAE1h
        mov edx, dword [dword edx+FrontEndBarShapes+38h]
        add dword [byte ebp-04h], byte 4
        call DrawFrameAt
        mov ecx, 961h
        mov edi, dword [BottomBarBmp]
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
        push dword [TitleBarArt+1Ah]
        push dword [TitleBarArt+16h]
        push dword [TitleBarArt+0Ah]
        call PutBlock
        add esp, byte 0Ch
.2:
        test byte [byte ebp-01Ch], 4
        je short .3
        push dword [SideBarArt+1Ah]
        push dword [SideBarArt+16h]
        push dword [SideBarArt+0Ah]
        call PutBlock
        add esp, byte 0Ch
.3:
        test byte [byte ebp-01Ch], 1
        je short .4
        push dword [BottomBarArt+1Ah]
        push dword [BottomBarArt+16h]
        push dword [BottomBarArt+0Ah]
        call PutBlock
        add esp, byte 0Ch
.4:
        push dword [byte ebp-08h]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp-018h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp-010h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp-014h]
        call FreeMemBlock
        mov byte [TitleBarArt+32h], 0
        mov byte [TitleBarArt+33h], 0
        mov byte [TitleBarArt+34h], 0
        mov byte [TitleBarArt+35h], 0
        mov byte [SideBarArt+32h], 0
        mov byte [SideBarArt+33h], 0
        mov byte [SideBarArt+34h], 0
        mov byte [SideBarArt+35h], 0
        mov byte [BottomBarArt+32h], 0
        mov byte [BottomBarArt+33h], 0
        mov byte [BottomBarArt+34h], 0
        mov byte [BottomBarArt+35h], 0
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
        push dword [TitleBarArt+1Ah]
        mov eax, dword [TitleBarBmp]
        push dword [TitleBarArt+16h]
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
        push dword [TitleBarArt+1Ah]
        mov eax, dword [TitleBarBmp]
        push dword [TitleBarArt+16h]
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
; The same for the second bar (SideBarBmp)
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
        push dword [SideBarArt+1Ah]
        mov eax, dword [SideBarBmp]
        push dword [SideBarArt+16h]
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
        push dword [SideBarArt+1Ah]
        mov eax, dword [SideBarBmp]
        push dword [SideBarArt+16h]
        jmp short SlideInTitleBar_62
;-----------------------------------------------------------------------------
; SlideInBottomBar                                62E72  96 PC, low confidence
; The same for the third bar (BottomBarBmp)
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
        push dword [BottomBarArt+1Ah]
        mov eax, dword [BottomBarBmp]
        push dword [BottomBarArt+16h]
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
        push dword [BottomBarArt+1Ah]
        mov eax, dword [BottomBarBmp]
        push dword [BottomBarArt+16h]
        jmp near SlideInTitleBar_62
;-----------------------------------------------------------------------------
; FreeFrontEndArt                              62ED9  96 PC, medium confidence
; Frees what LoadFrontEndArt loaded
;-----------------------------------------------------------------------------
FreeFrontEndArt:
        push ebx
        push ecx
        push edx
        mov edx, BottomBarArt+56h
        mov eax, 1
        call InitMenuItems
        mov edx, TeamStatsBitmap
        mov eax, 1
        call InitMenuItems
        mov edx, MenuBoxStyle
        mov eax, 1
        call InitMenuItems
        push dword [TeamNameArt]
        call FreeMemBlock
        add esp, byte 4
        push dword [WaitBoxArt]
        mov dword [TeamNameArt], 0
        call FreeMemBlock
        add esp, byte 4
        push dword [TitleBarBmp]
        mov dword [WaitBoxArt], 0
        call FreeMemBlock
        add esp, byte 4
        push dword [SideBarBmp]
        call FreeMemBlock
        add esp, byte 4
        push dword [BottomBarBmp]
        call FreeMemBlock
        add esp, byte 4
        push dword [MatchupLayer]
        call FreeMemBlock
        add esp, byte 4
        push dword [FrontEndScreenBmp]
        call FreeMemBlock
        add esp, byte 4
        push FrontEndArtFiles
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
        mov esi, dword [ScreenPaletteBuf]
        lea edi, [dword eax+02B2h]
        add esi, 2B2h
        rep movsb
        mov eax, edx
        call SetScreenPalette
        push ScreenColorMap
        push edx
        push dword 0AE14h
        call TintRect
        jmp near SlideInTitleBar_6A
        push ebx
        push ecx
        push edx
        call KbdGetKey
        pop edx
        pop ecx
        pop ebx
        ret
