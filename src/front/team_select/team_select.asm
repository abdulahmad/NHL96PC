; The exhibition team select screen: home and away team panels (logo, name, rank) (96 PC).
bits 32
%include "hockey.inc"
extern BottomBarArt
section s_76071 progbits alloc exec nowrite align=1
extern BlackPalette, GsPanelSlots, CopyBitmap, DrawFrameAt, AwayPanelX, HomePanelX, HomePanelBmp
extern AwayPanelBmp, HomePanelLogo, AwayPanelLogo, TeamSelectDrawn, AwayPanelName, PanelTeamNameShift, AwayPanelText, TeamStatsBitmap
extern GsTeamSelect, TeamSelectCursor, HomePanelArt, TeamPanelFont, FadeOut, FadePalette, FillMusicStream
extern gameopts, GetTeamNameArt, GetTicks, InitMenuItems, LoadPackedFile, LoadTeamLogo, mousex, mousey
extern OpenScreen, optblock_end, PutBlock, RunMenu, SetDrawBitmap, SetMenuMouse, SetScreenColors, SlideInSideBar
extern SlideInTitleBar, SoundIdle, SoundSecondsToBytes, sprintf_, str_Aal02, str_Aal12, str_Aal22, str_Aar02
extern str_Aar12, str_Aar22, str_Ahl02, str_Ahl12, str_Ahl22, str_Ahr02, str_Ahr12, str_Ahr22
extern str_Bkgd24, str_HaBck0, str_HaBck1, str_Ldat, str_Pal10, str_Rk02d2, str_Rk22, str_Rul1
extern str_Rul2, str_Rul3, str_Set0, str_Set1, str_Set2, str_Swt02, str_Swt1, str_SwtD
extern GameOptionsScreen, DrawShapeAtOwnPos, PutBlockAtOwnPos, AllocMemBlock, FreeMemBlock, CreateBitmap, ClearScreenColour, FreeBitmap
extern SetScreenTarget, FindShape, str_WesternConference2, TeamSelectY
global str_H, DrawHomeTeamPanel, DrawHomeTeamPanel_151, DrawHomeTeamPanel_15D, DrawAwayTeamPanel, TeamSelectJumpTable, TeamSelectScreen, TeamSelectScreen_863
global TeamSelectScreen_91E, TeamSelectScreen_9C0, TeamSelectScreen_A66, TeamSelectScreen_AFC, TeamSelectScreen_BAA, TeamSelectScreen_BB3, TeamSelectScreen_BD7, TeamSelectScreen_BE5
str_H:                                          ; string "h"; used by TeamSelectScreen
        db 068h,00h,00h,00h,02h,01h,00h,00h,07Ch,00h,00h,00h,0EEh,00h,00h,00h
        db 07Ch,00h,00h,00h,016h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 095h,00h,00h,00h,0EDh,00h,00h,00h,0AAh,00h,00h,00h,02h,01h,00h,00h
        db 095h,00h,00h,00h,017h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0E3h,01h,00h,00h,02h,01h,00h,00h,0F8h,01h,00h,00h,0EDh,00h,00h,00h
        db 0F8h,01h,00h,00h,017h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 010h,02h,00h,00h,0EFh,00h,00h,00h,024h,02h,00h,00h,03h,01h,00h,00h
        db 010h,02h,00h,00h,017h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Dh,01h,00h,00h,09Ah,00h,00h,00h,021h,01h,00h,00h,083h,00h,00h,00h
        db 061h,01h,00h,00h,083h,00h,00h,00h,077h,01h,00h,00h,099h,00h,00h,00h
        db 062h,01h,00h,00h,0B2h,00h,00h,00h,022h,01h,00h,00h,0B2h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,01h,00h,00h,0C8h,01h,00h,00h,0Dh,01h,00h,00h,0C1h,01h,00h,00h
        db 082h,01h,00h,00h,0C1h,01h,00h,00h,08Bh,01h,00h,00h,0C8h,01h,00h,00h
        db 08Bh,01h,00h,00h,0D2h,01h,00h,00h,082h,01h,00h,00h,0D6h,01h,00h,00h
        db 0Ch,01h,00h,00h,0D6h,01h,00h,00h,03h,01h,00h,00h,0D0h,01h,00h,00h
        db 00h,01h,00h,00h,0F9h,00h,00h,00h,0Eh,01h,00h,00h,0F3h,00h,00h,00h
        db 07Bh,01h,00h,00h,0F3h,00h,00h,00h,088h,01h,00h,00h,0FAh,00h,00h,00h
        db 088h,01h,00h,00h,04h,01h,00h,00h,078h,01h,00h,00h,0Ah,01h,00h,00h
        db 0Dh,01h,00h,00h,0Ah,01h,00h,00h,00h,01h,00h,00h,03h,01h,00h,00h
;-----------------------------------------------------------------------------
; DrawHomeTeamPanel                            76231  96 PC, medium confidence
; The home team's panel on the team select screen: logo, name art, rank
; (rk%02d)
;-----------------------------------------------------------------------------
DrawHomeTeamPanel:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        push eax
        push dword [HomePanelBmp]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push dword [HomePanelLogo]
        call PutBlock
        mov eax, dword [GsTeamSelect]
        add esp, byte 0Ch
        shl eax, 0Fh
        xor ecx, ecx
        shr eax, 1Bh
        xor ebx, ebx
        call LoadTeamLogo
        mov edx, eax
        mov eax, 0E3D7h
        call DrawFrameAt
        mov edx, 780000h
        mov eax, 0E3D7h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        lea ecx, [byte eax+05h]
        mov eax, dword [GsTeamSelect]
        shl eax, 0Fh
        shr eax, 1Bh
        xor ebx, ebx
        call GetTeamNameArt
        mov edx, eax
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [TeamSelectDrawn]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        xor esi, esi
        push dword [PanelTeamNameShift]
        xor edi, edi
        call PutBlock
        add esp, byte 0Ch
.1:
        mov eax, dword [GsTeamSelect]
        shl eax, 0Fh
        shr eax, 1Bh
        movsx eax, byte [dword edi+eax+GsPanelSlots]
        push eax
        push str_Rk02d2
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        mov eax, dword [dword esi+HomePanelX]
        sub eax, dword [HomePanelX]
        add esp, byte 0Ch
        mov dword [byte ebp-04h], eax
        lea eax, [byte ebp-0Ch]
        push eax
        push dword [byte ebp-010h]
        add esi, byte 4
        call FindShape
        mov ecx, dword [byte ebp-04h]
        add esp, byte 8
        mov edx, eax
        xor ebx, ebx
        mov eax, 0FAE1h
        add edi, byte 1Ch
        call DrawFrameAt
        cmp esi, byte 18h
        jne short .1
        call SetScreenTarget
        mov eax, dword [HomePanelArt]
        mov ecx, 0AAh
        sar eax, 1
        sub ecx, eax
        mov eax, dword [TeamPanelFont]
        push ecx
        mov ecx, 87h
        sar eax, 1
        sub ecx, eax
        mov eax, dword [HomePanelBmp]
        push ecx
        push dword [byte eax+02Ch]
        call PutBlock
        mov esi, dword [PanelTeamNameShift]
        add esp, byte 0Ch
        movsx eax, word [byte esi+0Eh]
        push eax
        movsx eax, word [byte esi+0Ch]
        push eax
        mov eax, dword [TeamSelectDrawn]
DrawHomeTeamPanel_151:
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        leave
DrawHomeTeamPanel_15D:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawAwayTeamPanel                            76394  96 PC, medium confidence
; The same for the away team
;-----------------------------------------------------------------------------
DrawAwayTeamPanel:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        push eax
        push dword [AwayPanelBmp]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push dword [AwayPanelLogo]
        call PutBlock
        mov eax, dword [GsTeamSelect]
        add esp, byte 0Ch
        shl eax, 0Ah
        xor ecx, ecx
        shr eax, 1Bh
        xor ebx, ebx
        call LoadTeamLogo
        mov edx, eax
        mov eax, 0E3D7h
        call DrawFrameAt
        mov edx, 780000h
        mov eax, 0E3D7h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        lea ecx, [byte eax+05h]
        mov eax, dword [GsTeamSelect]
        shl eax, 0Ah
        shr eax, 1Bh
        xor ebx, ebx
        call GetTeamNameArt
        mov edx, eax
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [AwayPanelName]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        xor esi, esi
        push dword [AwayPanelText]
        xor edi, edi
        call PutBlock
        add esp, byte 0Ch
.1:
        mov eax, dword [GsTeamSelect]
        shl eax, 0Ah
        shr eax, 1Bh
        movsx eax, byte [dword edi+eax+GsPanelSlots]
        push eax
        push str_Rk02d2
        lea eax, [byte ebp-08h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-08h]
        push eax
        push dword [byte ebp-0Ch]
        add esi, byte 4
        call FindShape
        mov edx, dword [AwayPanelText]
        add esp, byte 8
        mov ecx, dword [dword esi+AwayPanelX]
        movsx edx, word [byte edx+04h]
        movsx ebx, word [byte eax+04h]
        sub edx, ebx
        sub ecx, dword [HomePanelX]
        mov ebx, edx
        mov edx, eax
        mov eax, 0FAE1h
        add edi, byte 1Ch
        call DrawFrameAt
        cmp esi, byte 18h
        jne short .1
        call SetScreenTarget
        mov eax, dword [HomePanelArt]
        mov edx, 0AAh
        sar eax, 1
        sub edx, eax
        mov eax, dword [TeamPanelFont]
        push edx
        mov edx, 1FDh
        sar eax, 1
        sub edx, eax
        mov eax, dword [AwayPanelBmp]
        push edx
        push dword [byte eax+02Ch]
        call PutBlock
        mov esi, dword [AwayPanelText]
        add esp, byte 0Ch
        movsx eax, word [byte esi+0Eh]
        push eax
        movsx eax, word [byte esi+0Ch]
        push eax
        mov eax, dword [AwayPanelName]
        jmp near DrawHomeTeamPanel_151
TeamSelectJumpTable:                            ; jump table for the switch cases of TeamSelectScreen
        dd TeamSelectScreen_863
        dd TeamSelectScreen_91E
        dd TeamSelectScreen_9C0
        dd TeamSelectScreen_A66
        dd TeamSelectScreen_AFC
        dd TeamSelectScreen_BAA
        dd TeamSelectScreen_BB3
        dd TeamSelectScreen_BD7
        dd TeamSelectScreen_BE5
;-----------------------------------------------------------------------------
; TeamSelectScreen                                                76518  96 PC
; The exhibition team select screen (arrows ahl / ahr / aal / aar, logos,
; names, ranks); returns the next screen
;-----------------------------------------------------------------------------
TeamSelectScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 574h, 0
        sub ebp, 82h
        mov ecx, 70h
        lea edi, [dword ebp-015Ah]
        mov esi, str_H
        mov eax, 4
        rep movsd
        xor edx, edx
        mov dword [gameopts], optblock_end
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 57h
        call LoadPackedFile
        push byte 0
        mov dword [byte ebp+076h], eax
        mov dword [byte ebp+07Eh], eax
        call ClearScreenColour
        add esp, byte 4
        call BlackPalette
        xor eax, eax
        call GetTeamNameArt
        movsx eax, word [byte eax+04h]
        mov edx, 780000h
        mov dword [TeamPanelFont], eax
        mov eax, 0E3D7h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        add eax, byte 14h
        mov dword [HomePanelArt], eax
        mov eax, dword [TeamPanelFont]
        imul eax, dword [HomePanelArt]
        mov esi, str_WesternConference2
        push str_Pal10
        add esi, 1F2h
        push dword [byte ebp+076h]
        mov dword [TeamSelectCursor], eax
        call FindShape
        add esp, byte 8
        lea edx, [byte eax+010h]
        mov ecx, 0C0h
        lea edi, [dword eax+0202h]
        rep movsb
        mov eax, edx
        mov dword [byte ebp+072h], edx
        call SetScreenColors
        call SetScreenTarget
        push str_Bkgd24
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        lea edx, [dword ebp-04F2h]
        mov eax, 9
        call InitMenuItems
        push str_Ahl02
        push dword [byte ebp+076h]
        mov dword [byte ebp+07Ah], 0FFFFFFFFh
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-04D8h], eax
        push str_Ahl12
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Ahl22
        push dword [byte ebp+076h]
        mov dword [dword ebp-04D4h], eax
        call FindShape
        mov dword [dword ebp-04D0h], eax
        lea eax, [dword ebp-015Ah]
        mov dword [dword ebp-04DEh], eax
        mov eax, dword [dword ebp-04D8h]
        mov dword [dword ebp-04E2h], 3
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Ahr02
        mov dword [dword ebp-04CCh], eax
        mov eax, dword [dword ebp-04D8h]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-04B8h], 77h
        mov dword [dword ebp-04B4h], 105h
        mov byte [dword ebp-04AFh], 7
        mov byte [dword ebp-04ADh], 1
        mov dword [dword ebp-04C8h], eax
        call FindShape
        add esp, byte 8
        push str_Ahr12
        push dword [byte ebp+076h]
        mov dword [dword ebp-0472h], eax
        call FindShape
        add esp, byte 8
        push str_Ahr22
        push dword [byte ebp+076h]
        mov dword [dword ebp-046Eh], eax
        call FindShape
        mov dword [dword ebp-046Ah], eax
        lea eax, [dword ebp-011Ah]
        mov dword [dword ebp-0478h], eax
        mov eax, dword [dword ebp-0472h]
        mov dword [dword ebp-047Ch], 3
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Aal02
        mov dword [dword ebp-0466h], eax
        mov eax, dword [dword ebp-0472h]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0452h], 9Bh
        mov dword [dword ebp-044Eh], 105h
        mov byte [dword ebp-044Ah], 4
        mov byte [dword ebp-0449h], 5
        mov byte [dword ebp-0448h], 0
        mov byte [dword ebp-0447h], 6
        mov dword [dword ebp-0462h], eax
        call FindShape
        add esp, byte 8
        push str_Aal12
        push dword [byte ebp+076h]
        mov dword [dword ebp-040Ch], eax
        call FindShape
        add esp, byte 8
        push str_Aal22
        push dword [byte ebp+076h]
        mov dword [dword ebp-0408h], eax
        call FindShape
        mov dword [dword ebp-0416h], 3
        mov dword [dword ebp-0404h], eax
        lea eax, [dword ebp-0DAh]
        add esp, byte 8
        mov dword [dword ebp-0412h], eax
        mov eax, dword [dword ebp-040Ch]
        movsx eax, word [byte eax+0Ch]
        push str_Aar02
        mov dword [dword ebp-0400h], eax
        mov eax, dword [dword ebp-040Ch]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-03ECh], 1F2h
        mov dword [dword ebp-03E8h], 105h
        mov byte [dword ebp-03E4h], 4
        mov byte [dword ebp-03E3h], 5
        mov byte [dword ebp-03E2h], 6
        mov byte [dword ebp-03E1h], 3
        mov dword [dword ebp-03FCh], eax
        call FindShape
        add esp, byte 8
        push str_Aar12
        push dword [byte ebp+076h]
        mov dword [dword ebp-03A6h], eax
        call FindShape
        add esp, byte 8
        push str_Aar22
        push dword [byte ebp+076h]
        mov dword [dword ebp-03A2h], eax
        call FindShape
        mov dword [dword ebp-039Eh], eax
        lea eax, [dword ebp-09Ah]
        mov dword [dword ebp-03ACh], eax
        mov eax, dword [dword ebp-03A6h]
        mov dword [dword ebp-03B0h], 3
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Swt02
        mov dword [dword ebp-039Ah], eax
        mov eax, dword [dword ebp-03A6h]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0386h], 217h
        mov dword [dword ebp-0382h], 105h
        mov byte [dword ebp-037Dh], 8
        mov byte [dword ebp-037Ch], 2
        mov dword [dword ebp-0396h], eax
        call FindShape
        add esp, byte 8
        push str_Swt1
        push dword [byte ebp+076h]
        mov dword [dword ebp-0340h], eax
        call FindShape
        mov dword [dword ebp-033Ch], eax
        lea eax, [byte ebp-05Ah]
        mov dword [dword ebp-0346h], eax
        mov eax, dword [dword ebp-0340h]
        mov dword [dword ebp-034Ah], 6
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Set0
        mov dword [dword ebp-0334h], eax
        mov eax, dword [dword ebp-0340h]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0320h], 144h
        mov dword [dword ebp-031Ch], 99h
        mov byte [dword ebp-0317h], 6
        mov byte [dword ebp-0316h], 1
        mov byte [dword ebp-0315h], 2
        mov dword [dword ebp-0328h], 35h
        mov dword [dword ebp-0330h], eax
        call FindShape
        add esp, byte 8
        push str_Set1
        push dword [byte ebp+076h]
        mov dword [dword ebp-02DAh], eax
        call FindShape
        add esp, byte 8
        push str_Set2
        push dword [byte ebp+076h]
        mov dword [dword ebp-02D6h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-02D2h], eax
        lea eax, [byte ebp-01Ah]
        mov dword [dword ebp-02E0h], eax
        mov eax, dword [dword ebp-02DAh]
        mov dword [dword ebp-02E4h], 8
        movsx eax, word [byte eax+0Ch]
        push str_Rul1
        mov dword [dword ebp-02CEh], eax
        mov eax, dword [dword ebp-02DAh]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-02BAh], 144h
        mov dword [dword ebp-02B6h], 1D0h
        mov byte [dword ebp-02B2h], 6
        mov byte [dword ebp-02B0h], 7
        mov byte [dword ebp-02AFh], 8
        mov dword [dword ebp-02CAh], eax
        call FindShape
        add esp, byte 8
        push str_Rul2
        push dword [byte ebp+076h]
        mov dword [dword ebp-0274h], eax
        call FindShape
        add esp, byte 8
        push str_Rul3
        push dword [byte ebp+076h]
        mov dword [dword ebp-0270h], eax
        call FindShape
        mov dword [dword ebp-026Ch], eax
        lea eax, [byte ebp+026h]
        mov dword [dword ebp-027Ah], eax
        mov eax, dword [dword ebp-0274h]
        mov dword [dword ebp-027Eh], 8
        lea edi, [dword ebp-0228h]
        movsx eax, word [byte eax+0Ch]
        mov esi, TeamStatsBitmap
        mov dword [dword ebp-0268h], eax
        mov eax, dword [dword ebp-0274h]
        mov ecx, 66h
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0254h], 144h
        mov dword [dword ebp-0250h], 103h
        mov byte [dword ebp-024Ch], 4
        mov byte [dword ebp-024Bh], 5
        mov byte [dword ebp-024Ah], 1
        mov dword [dword ebp-0264h], eax
        mov eax, 6
        mov byte [dword ebp-0249h], 2
        call OpenScreen
        rep movsb
        mov byte [dword ebp-01E6h], 0
        mov byte [dword ebp-01E4h], 7
        mov ecx, 66h
        lea edi, [dword ebp-01C2h]
        mov esi, BottomBarArt+56h
        mov byte [dword ebp-01E3h], 5
        mov byte [dword ebp-01E5h], 7
        rep movsb
        mov byte [dword ebp-0180h], 3
        mov byte [dword ebp-017Eh], 5
        mov byte [dword ebp-017Dh], 8
        mov byte [dword ebp-017Fh], 8
        call SetScreenTarget
        push byte 0
        push dword [HomePanelArt]
        push dword [TeamPanelFont]
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [HomePanelBmp], eax
        mov eax, dword [TeamSelectCursor]
        push byte 0
        add eax, byte 10h
        push eax
        push str_HaBck0
        call AllocMemBlock
        mov esi, dword [HomePanelBmp]
        mov dword [HomePanelLogo], eax
        mov edi, eax
        mov esi, dword [byte esi+02Ch]
        movsd
        movsd
        movsd
        movsd
        movsb
        mov eax, dword [TeamPanelFont]
        mov edx, 87h
        sar eax, 1
        sub edx, eax
        mov eax, dword [HomePanelLogo]
        add esp, byte 0Ch
        mov word [byte eax+0Ch], dx
        mov eax, dword [HomePanelArt]
        mov edx, 0AAh
        sar eax, 1
        sub edx, eax
        mov eax, dword [HomePanelLogo]
        mov word [byte eax+0Eh], dx
        push dword [HomePanelLogo]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push byte 0
        push dword [HomePanelArt]
        push dword [TeamPanelFont]
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [AwayPanelBmp], eax
        mov eax, dword [TeamSelectCursor]
        push byte 0
        add eax, byte 10h
        push eax
        push str_HaBck1
        call AllocMemBlock
        mov esi, dword [AwayPanelBmp]
        mov dword [AwayPanelLogo], eax
        mov edi, eax
        mov esi, dword [byte esi+02Ch]
        movsd
        movsd
        movsd
        movsd
        movsb
        mov eax, dword [TeamPanelFont]
        mov edx, 1FDh
        sar eax, 1
        sub edx, eax
        mov eax, dword [AwayPanelLogo]
        mov word [byte eax+0Ch], dx
        mov eax, dword [HomePanelArt]
        mov edx, 0AAh
        sar eax, 1
        sub edx, eax
        mov eax, dword [AwayPanelLogo]
        add esp, byte 0Ch
        mov word [byte eax+0Eh], dx
        push dword [AwayPanelLogo]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push byte 0
        push dword 80h
        push str_Rk22
        push dword [byte ebp+076h]
        call FindShape
        movsx eax, word [byte eax+04h]
        add esp, byte 8
        inc eax
        inc eax
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [TeamSelectDrawn], eax
        xor edx, edx
        mov eax, dword [byte eax+02Ch]
        call CopyBitmap
        mov dx, word [TeamSelectY]
        mov dword [PanelTeamNameShift], eax
        mov word [byte eax+0Ch], dx
        mov eax, dword [PanelTeamNameShift]
        mov dx, word [HomePanelX]
        mov word [byte eax+0Eh], dx
        push dword [PanelTeamNameShift]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push byte 0
        push dword 80h
        push str_Rk22
        push dword [byte ebp+076h]
        call FindShape
        movsx eax, word [byte eax+04h]
        add esp, byte 8
        inc eax
        inc eax
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [AwayPanelName], eax
        xor edx, edx
        mov eax, dword [byte eax+02Ch]
        call CopyBitmap
        mov edx, dword [AwayPanelName]
        mov dword [AwayPanelText], eax
        mov edx, dword [byte edx+02Ch]
        mov si, word [AwayPanelX]
        sub si, word [byte edx+04h]
        mov word [byte eax+0Ch], si
        mov eax, dword [AwayPanelText]
        mov dx, word [HomePanelX]
        mov word [byte eax+0Eh], dx
        push dword [AwayPanelText]
        call DrawShapeAtOwnPos
        add esp, byte 4
        mov eax, dword [byte ebp+076h]
        call DrawHomeTeamPanel
        mov eax, dword [byte ebp+076h]
        call DrawAwayTeamPanel
        mov edx, dword [dword ebp-0184h]
        mov eax, dword [dword ebp-0188h]
        mov ebx, 3
        call SetMenuMouse
        mov edx, dword [byte ebp+072h]
        xor eax, eax
        mov dword [byte ebp+06Eh], 8
        call FadePalette
.1:
        call SoundIdle
        cmp dword [byte ebp+06Eh], byte 0
        jl short .3
        cmp dword [byte ebp+06Eh], byte 0Ah
        jge short .3
        imul eax, dword [byte ebp+06Eh], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-04B8h]
        jne short .2
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-04B4h]
        je short .3
.2:
        mov dword [byte ebp+06Eh], 0FFFFFFFFh
.3:
        push byte 2
        lea eax, [byte ebp+06Eh]
        push byte 7
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-04F2h]
        push eax
        xor ecx, ecx
        mov eax, 9
        call RunMenu
        cmp dword [byte ebp+06Eh], byte 8
        ja near TeamSelectScreen_BE5.14
        mov edx, dword [byte ebp+06Eh]
        mov esi, dword [GsTeamSelect]
        mov eax, dword [GsTeamSelect]
        and esi, 0FFFE0FFFh
        and eax, 0FFC1FFFFh
        jmp dword [nosplit cs:edx*4+TeamSelectJumpTable]
TeamSelectScreen_863:
        test dword [GsTeamSelect], 1F000h
        jne short .4
        mov dword [GsTeamSelect], esi
        or esi, 1C000h
        mov dword [GsTeamSelect], esi
.4:
        mov eax, dword [GsTeamSelect]
        shl eax, 0Fh
        shr eax, 1Bh
        dec eax
        and eax, byte 1Fh
        and dword [GsTeamSelect], 0FFFE0FFFh
        shl eax, 0Ch
        or dword [GsTeamSelect], eax
        mov eax, dword [GsTeamSelect]
        mov edx, dword [GsTeamSelect]
        shl eax, 0Ah
        shl edx, 0Fh
        shr eax, 1Bh
        shr edx, 1Bh
        cmp eax, edx
        jne short .6
        mov eax, dword [GsTeamSelect]
        and eax, 3E0000h
        cmp eax, 340000h
        jb short .6
        test dword [GsTeamSelect], 1F000h
        jne short .5
        and dword [GsTeamSelect], 0FFFE0FFFh
        or dword [GsTeamSelect], 1C000h
.5:
        mov eax, dword [GsTeamSelect]
        shl eax, 0Fh
        shr eax, 1Bh
        dec eax
        and eax, byte 1Fh
        and dword [GsTeamSelect], 0FFFE0FFFh
        shl eax, 0Ch
        or dword [GsTeamSelect], eax
.6:
        mov eax, dword [byte ebp+07Eh]
        call DrawHomeTeamPanel
        jmp near TeamSelectScreen_BE5.14
TeamSelectScreen_91E:
        mov eax, dword [GsTeamSelect]
        shl eax, 0Fh
        shr eax, 1Bh
        inc eax
        and eax, byte 1Fh
        shl eax, 0Ch
        mov dword [GsTeamSelect], esi
        or esi, eax
        mov eax, esi
        and eax, 1F000h
        mov dword [GsTeamSelect], esi
        cmp eax, 1C000h
        jne short .7
        and dword [GsTeamSelect], 0FFFE0FFFh
.7:
        mov edx, dword [GsTeamSelect]
        mov eax, dword [GsTeamSelect]
        shl edx, 0Ah
        shl eax, 0Fh
        shr edx, 1Bh
        shr eax, 1Bh
        cmp edx, eax
        jne short TeamSelectScreen_863.6
        mov edx, dword [GsTeamSelect]
        and edx, 3E0000h
        cmp edx, 340000h
        jb short TeamSelectScreen_863.6
        inc eax
        and eax, byte 1Fh
        and dword [GsTeamSelect], 0FFFE0FFFh
        shl eax, 0Ch
        or dword [GsTeamSelect], eax
        mov eax, dword [GsTeamSelect]
        and eax, 1F000h
        cmp eax, 1C000h
        jne near TeamSelectScreen_863.6
        and dword [GsTeamSelect], 0FFFE0FFFh
        jmp near TeamSelectScreen_863.6
TeamSelectScreen_9C0:
        test byte [GsTeamSelect+2], 3Eh
        jne short .8
        mov dword [GsTeamSelect], eax
        or eax, 380000h
        mov dword [GsTeamSelect], eax
.8:
        mov eax, dword [GsTeamSelect]
        shl eax, 0Ah
        shr eax, 1Bh
        dec eax
        and eax, byte 1Fh
        and byte [GsTeamSelect+2], 0C1h
        shl eax, 11h
        or dword [GsTeamSelect], eax
        mov eax, dword [GsTeamSelect]
        mov edx, dword [GsTeamSelect]
        shl eax, 0Fh
        shl edx, 0Ah
        shr eax, 1Bh
        shr edx, 1Bh
        cmp eax, edx
        jne short .10
        mov eax, dword [GsTeamSelect]
        and eax, 1F000h
        cmp eax, 1A000h
        jb short .10
        test byte [GsTeamSelect+2], 3Eh
        jne short .9
        and byte [GsTeamSelect+2], 0C1h
        or byte [GsTeamSelect+2], 38h
.9:
        mov eax, dword [GsTeamSelect]
        shl eax, 0Ah
        shr eax, 1Bh
        dec eax
        and eax, byte 1Fh
        and byte [GsTeamSelect+2], 0C1h
        shl eax, 11h
        or dword [GsTeamSelect], eax
.10:
        mov eax, dword [byte ebp+07Eh]
        call DrawAwayTeamPanel
        jmp near TeamSelectScreen_BE5.14
TeamSelectScreen_A66:
        mov edx, dword [GsTeamSelect]
        shl edx, 0Ah
        shr edx, 1Bh
        inc edx
        and edx, byte 1Fh
        shl edx, 11h
        mov dword [GsTeamSelect], eax
        or eax, edx
        mov dword [GsTeamSelect], eax
        and eax, 3E0000h
        cmp eax, 380000h
        jne short .11
        and byte [GsTeamSelect+2], 0C1h
.11:
        mov edx, dword [GsTeamSelect]
        mov eax, dword [GsTeamSelect]
        shl edx, 0Fh
        shl eax, 0Ah
        shr edx, 1Bh
        shr eax, 1Bh
        cmp edx, eax
        jne short TeamSelectScreen_9C0.10
        mov edx, dword [GsTeamSelect]
        and edx, 1F000h
        cmp edx, 1A000h
        jb short TeamSelectScreen_9C0.10
        inc eax
        and eax, byte 1Fh
        and byte [GsTeamSelect+2], 0C1h
        shl eax, 11h
        or dword [GsTeamSelect], eax
        mov eax, dword [GsTeamSelect]
        and eax, 3E0000h
        cmp eax, 380000h
        jne near TeamSelectScreen_9C0.10
        and byte [GsTeamSelect+2], 0C1h
        jmp near TeamSelectScreen_9C0.10
TeamSelectScreen_AFC:
        mov esi, 2
.12:
        push esi
        push str_SwtD
        lea eax, [byte ebp+066h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+066h]
        push eax
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        call GetTicks
        lea edi, [byte eax+03h]
.13:
        call GetTicks
        cmp eax, edi
        jl short .13
        inc esi
        cmp esi, byte 5
        jl short .12
        push str_Swt1
        push dword [byte ebp+07Eh]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        mov eax, dword [GsTeamSelect]
        shl eax, 0Fh
        mov edx, dword [GsTeamSelect]
        shr eax, 1Bh
        and byte [GsTeamSelect+2], 0C1h
        and eax, byte 1Fh
        shl edx, 0Ah
        shl eax, 11h
        shr edx, 1Bh
        or dword [GsTeamSelect], eax
        mov eax, edx
        and eax, byte 1Fh
        and dword [GsTeamSelect], 0FFFE0FFFh
        shl eax, 0Ch
        add esp, byte 4
        or dword [GsTeamSelect], eax
        mov eax, dword [byte ebp+07Eh]
        call DrawHomeTeamPanel
        jmp near TeamSelectScreen_9C0.10
TeamSelectScreen_BAA:
        mov dword [byte ebp+07Ah], 0Eh
        jmp short TeamSelectScreen_BE5.14
TeamSelectScreen_BB3:
        mov eax, 1
        call GameOptionsScreen
        mov edx, dword [dword ebp-0250h]
        mov eax, dword [dword ebp-0254h]
        call SetMenuMouse
        mov dword [byte ebp+06Eh], 6
        jmp short TeamSelectScreen_BE5.14
TeamSelectScreen_BD7:
        call SlideInSideBar
        mov dword [byte ebp+07Ah], 1
        jmp short TeamSelectScreen_BE5.14
TeamSelectScreen_BE5:
        call SlideInTitleBar
        mov dword [byte ebp+07Ah], 3
.14:
        cmp dword [byte ebp+07Ah], byte 0
        jl near TeamSelectScreen.1
        xor esi, esi
.15:
        cmp dword [dword esi+HomePanelLogo], byte 0
        je short .16
        push dword [dword esi+HomePanelLogo]
        call FreeMemBlock
        add esp, byte 4
        mov dword [dword esi+HomePanelLogo], 0
.16:
        cmp dword [dword esi+HomePanelBmp], byte 0
        je short .17
        push dword [dword esi+HomePanelBmp]
        call FreeBitmap
        add esp, byte 4
        mov dword [dword esi+HomePanelBmp], 0
.17:
        cmp dword [dword esi+PanelTeamNameShift], byte 0
        je short .18
        push dword [dword esi+PanelTeamNameShift]
        call FreeMemBlock
        add esp, byte 4
        mov dword [dword esi+PanelTeamNameShift], 0
.18:
        cmp dword [dword esi+TeamSelectDrawn], byte 0
        je short .19
        push dword [dword esi+TeamSelectDrawn]
        call FreeBitmap
        add esp, byte 4
        mov dword [dword esi+TeamSelectDrawn], 0
.19:
        add esi, byte 4
        cmp esi, byte 8
        jne near .15
        push dword [byte ebp+07Eh]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 2
        call FadeOut
        mov eax, dword [byte ebp+07Ah]
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near DrawHomeTeamPanel_15D
        push ebx
        push ecx
        push edx
        push byte 20h
        push eax
        push str_Ldat
        call AllocMemBlock
        add esp, byte 0Ch
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push eax
        call FreeMemBlock
        add esp, byte 4
        pop edx
        pop ecx
        pop ebx
        ret
