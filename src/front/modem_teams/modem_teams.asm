; The modem / link game set-up from the main menu: team select and the steps to the game (96 PC).
bits 32
%include "hockey.inc"
section s_A3851 progbits alloc exec nowrite align=1
extern BlackPalette, byte_17D275, byte_17D283, ComputeTeamRanks, CopyBitmap, DrawFrameAt, dword_11ED3C, dword_11ED40
extern dword_11ED58, dword_11ED5C, dword_11ED60, dword_11ED64, dword_11ED68, dword_11ED6C, dword_11ED70, dword_11ED74
extern MatchupLayer, TeamStatsBitmap, dword_17BCE2, str_Standings, dword_17D273, dword_1846F0, dword_1846F4, dword_1846F8
extern FadeOut, FadePalette, FillMusicStream, gameopts, GetTeamNameArt, GetTicks, InitMenuItems, LinkSetupScreen
extern LoadModemStats, LoadPackedFile, LoadTeamLogo, ModemChat, mousex, mousey, MusicDone, OpenScreen
extern PlayMusic, PutBlock, RunControllerScreen, RunMenu, RunModemSetup, SetDrawBitmap, SetMenuMouse, SetScreenColors
extern SlideInBottomBar, SlideInSideBar, SlideInTitleBar, SoundIdle, SoundSecondsToBytes, sprintf_, str_1GM, str_3GM
extern str_5GM, str_7GM, str_Aal0, str_Aal1, str_Aal2, str_Aar0, str_Aar1, str_Aar2
extern str_Ahl0, str_Ahl1, str_Ahl2, str_Ahr0, str_Ahr1, str_Ahr2, str_Bkgd21, str_HaBck02
extern str_HaBck12, str_Pal29, str_Rk02d, str_Rk222, str_Rul13, str_Rul23, str_Rul33, str_Swt0
extern str_Swt12, str_SwtD2, GameOptionsScreen, RunPlayoffMenus_102, RunPlayoffMenus_115, RunPlayoffMenus_73, RunPlayoffMenus_89, RunPlayoffMenus_A6
extern RunPlayoffMenus_CD, RunPlayoffMenus_D6, RunPlayoffMenus_E1, DrawShapeAtOwnPos, PutBlockAtOwnPos, AllocMemBlock, FreeMemBlock, CreateBitmap
extern ClearScreenColour, FreeBitmap, SetScreenTarget, FindShape, TextSetFont, str_WesternConference2, unk_17D272, word_114CE0
extern word_11ED38
global str_B, DrawModemHomePanel, DrawModemHomePanel_151, DrawModemHomePanel_15D, DrawModemAwayPanel, jpt_A3CD4, ModemTeamSelectScreen, ModemTeamSelectScreen_7F1
global ModemTeamSelectScreen_8AC, ModemTeamSelectScreen_94E, ModemTeamSelectScreen_9F4, ModemTeamSelectScreen_A8A, ModemTeamSelectScreen_B38, ModemTeamSelectScreen_B5C, ModemTeamSelectScreen_B6A, ModemTeamSelectScreen_B78
global RunModemGameSetup, unk_A49D1, str_Z, unk_A4F69, unk_A4F79, unk_A4F89, unk_A4FA9, jpt_A4FB7
str_B:
        db 062h,00h,00h,00h,0E4h,00h,00h,00h,077h,00h,00h,00h,0CFh,00h,00h,00h
        db 077h,00h,00h,00h,0F9h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 08Eh,00h,00h,00h,0CFh,00h,00h,00h,0A3h,00h,00h,00h,0E3h,00h,00h,00h
        db 08Eh,00h,00h,00h,0F8h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0DEh,01h,00h,00h,0E4h,00h,00h,00h,0F3h,01h,00h,00h,0CFh,00h,00h,00h
        db 0F3h,01h,00h,00h,0F9h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Ah,02h,00h,00h,0CFh,00h,00h,00h,01Fh,02h,00h,00h,0E4h,00h,00h,00h
        db 0Ah,02h,00h,00h,0F9h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Bh,01h,00h,00h,08Ah,00h,00h,00h,01Fh,01h,00h,00h,073h,00h,00h,00h
        db 060h,01h,00h,00h,073h,00h,00h,00h,074h,01h,00h,00h,08Ah,00h,00h,00h
        db 060h,01h,00h,00h,0A1h,00h,00h,00h,020h,01h,00h,00h,0A1h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,01h,00h,00h,0D1h,00h,00h,00h,0Dh,01h,00h,00h,0CBh,00h,00h,00h
        db 076h,01h,00h,00h,0CBh,00h,00h,00h,080h,01h,00h,00h,0D0h,00h,00h,00h
        db 080h,01h,00h,00h,0DAh,00h,00h,00h,073h,01h,00h,00h,0DFh,00h,00h,00h
        db 0Dh,01h,00h,00h,0DFh,00h,00h,00h,04h,01h,00h,00h,0D7h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DrawModemHomePanel                           A3A11  96 PC, medium confidence
; The home team's panel on the modem team select screen (logo, name, rank
; rk%02d)
;-----------------------------------------------------------------------------
DrawModemHomePanel:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        push eax
        push dword [dword_11ED58]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push dword [dword_11ED60]
        call PutBlock
        mov eax, dword [dword_17D273]
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
        mov eax, dword [dword_17D273]
        shl eax, 0Fh
        shr eax, 1Bh
        xor ebx, ebx
        call GetTeamNameArt
        mov edx, eax
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [dword_11ED68]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        xor esi, esi
        push dword [dword_11ED70]
        xor edi, edi
        call PutBlock
        add esp, byte 0Ch
.1:
        mov eax, dword [dword_17D273]
        shl eax, 0Fh
        shr eax, 1Bh
        movsx eax, byte [dword edi+eax+byte_17D283]
        push eax
        push str_Rk02d
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        mov eax, dword [dword esi+dword_11ED40]
        sub eax, dword [dword_11ED40]
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
        mov eax, dword [dword_1846F4]
        mov ecx, 8Ch
        sar eax, 1
        sub ecx, eax
        mov eax, dword [dword_1846F8]
        push ecx
        mov ecx, 87h
        sar eax, 1
        sub ecx, eax
        mov eax, dword [dword_11ED58]
        push ecx
        push dword [byte eax+02Ch]
        call PutBlock
        mov esi, dword [dword_11ED70]
        add esp, byte 0Ch
        movsx eax, word [byte esi+0Eh]
        push eax
        movsx eax, word [byte esi+0Ch]
        push eax
        mov eax, dword [dword_11ED68]
DrawModemHomePanel_151:
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        leave
DrawModemHomePanel_15D:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawModemAwayPanel                           A3B74  96 PC, medium confidence
; The same for the away team
;-----------------------------------------------------------------------------
DrawModemAwayPanel:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        push eax
        push dword [dword_11ED5C]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push dword [dword_11ED64]
        call PutBlock
        mov eax, dword [dword_17D273]
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
        mov eax, dword [dword_17D273]
        shl eax, 0Ah
        shr eax, 1Bh
        xor ebx, ebx
        call GetTeamNameArt
        mov edx, eax
        mov eax, 0FAE1h
        call DrawFrameAt
        push dword [dword_11ED6C]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        xor esi, esi
        push dword [dword_11ED74]
        xor edi, edi
        call PutBlock
        add esp, byte 0Ch
.1:
        mov eax, dword [dword_17D273]
        shl eax, 0Ah
        shr eax, 1Bh
        movsx eax, byte [dword edi+eax+byte_17D283]
        push eax
        push str_Rk02d
        lea eax, [byte ebp-08h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-08h]
        push eax
        push dword [byte ebp-0Ch]
        add esi, byte 4
        call FindShape
        mov edx, dword [dword_11ED74]
        add esp, byte 8
        mov ecx, dword [dword esi+dword_11ED3C]
        movsx edx, word [byte edx+04h]
        movsx ebx, word [byte eax+04h]
        sub edx, ebx
        sub ecx, dword [dword_11ED40]
        mov ebx, edx
        mov edx, eax
        mov eax, 0FAE1h
        add edi, byte 1Ch
        call DrawFrameAt
        cmp esi, byte 18h
        jne short .1
        call SetScreenTarget
        mov eax, dword [dword_1846F4]
        mov edx, 8Ch
        sar eax, 1
        sub edx, eax
        mov eax, dword [dword_1846F8]
        push edx
        mov edx, 1FDh
        sar eax, 1
        sub edx, eax
        mov eax, dword [dword_11ED5C]
        push edx
        push dword [byte eax+02Ch]
        call PutBlock
        mov esi, dword [dword_11ED74]
        add esp, byte 0Ch
        movsx eax, word [byte esi+0Eh]
        push eax
        movsx eax, word [byte esi+0Ch]
        push eax
        mov eax, dword [dword_11ED6C]
        jmp near DrawModemHomePanel_151
jpt_A3CD4:
        dd ModemTeamSelectScreen_7F1
        dd ModemTeamSelectScreen_8AC
        dd ModemTeamSelectScreen_94E
        dd ModemTeamSelectScreen_9F4
        dd ModemTeamSelectScreen_A8A
        dd ModemTeamSelectScreen_B38
        dd ModemTeamSelectScreen_B5C
        dd ModemTeamSelectScreen_B6A
        dd ModemTeamSelectScreen_B78
;-----------------------------------------------------------------------------
; ModemTeamSelectScreen                        A3CF8  96 PC, medium confidence
; The team select screen of a modem or link game (ahl / ahr / aal arrows)
;-----------------------------------------------------------------------------
ModemTeamSelectScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 5D8h, 0
        sub ebp, 82h
        mov ecx, 70h
        lea edi, [dword ebp-015Ah]
        mov esi, str_B
        mov eax, 2
        xor edx, edx
        rep movsd
        call SoundSecondsToBytes
        call FillMusicStream
        mov eax, 58h
        call LoadPackedFile
        push byte 0
        mov dword [byte ebp+076h], eax
        mov dword [byte ebp+072h], eax
        call ClearScreenColour
        add esp, byte 4
        call BlackPalette
        xor eax, eax
        call GetTeamNameArt
        movsx eax, word [byte eax+04h]
        mov edx, 780000h
        mov dword [dword_1846F8], eax
        mov eax, 0E3D7h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        add eax, byte 14h
        mov dword [dword_1846F4], eax
        mov eax, dword [dword_1846F8]
        imul eax, dword [dword_1846F4]
        mov esi, str_WesternConference2
        push str_Pal29
        add esi, 1F2h
        push dword [byte ebp+076h]
        mov dword [dword_1846F0], eax
        call FindShape
        add esp, byte 8
        lea edx, [byte eax+010h]
        mov ecx, 0C0h
        lea edi, [dword eax+0202h]
        rep movsb
        mov eax, edx
        mov dword [byte ebp+07Ah], edx
        call SetScreenColors
        call SetScreenTarget
        push str_Bkgd21
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        lea edx, [dword ebp-0556h]
        mov eax, 9
        call InitMenuItems
        push str_Ahl0
        push dword [byte ebp+076h]
        mov dword [byte ebp+07Eh], 0FFFFFFFFh
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-053Ch], eax
        push str_Ahl1
        push dword [byte ebp+076h]
        call FindShape
        add esp, byte 8
        push str_Ahl2
        push dword [byte ebp+076h]
        mov dword [dword ebp-0538h], eax
        call FindShape
        mov dword [dword ebp-0534h], eax
        lea eax, [dword ebp-015Ah]
        mov dword [dword ebp-0542h], eax
        mov eax, dword [dword ebp-053Ch]
        mov dword [dword ebp-0546h], 3
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Ahr0
        mov dword [dword ebp-0530h], eax
        mov eax, dword [dword ebp-053Ch]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-051Ch], 72h
        mov dword [dword ebp-0518h], 0E6h
        mov byte [dword ebp-0513h], 6
        mov byte [dword ebp-0511h], 1
        mov dword [dword ebp-052Ch], eax
        call FindShape
        add esp, byte 8
        push str_Ahr1
        push dword [byte ebp+076h]
        mov dword [dword ebp-04D6h], eax
        call FindShape
        add esp, byte 8
        push str_Ahr2
        push dword [byte ebp+076h]
        mov dword [dword ebp-04D2h], eax
        call FindShape
        mov dword [dword ebp-04CEh], eax
        lea eax, [dword ebp-011Ah]
        mov dword [dword ebp-04DCh], eax
        mov eax, dword [dword ebp-04D6h]
        mov dword [dword ebp-04E0h], 3
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Aal0
        mov dword [dword ebp-04CAh], eax
        mov eax, dword [dword ebp-04D6h]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-04B6h], 96h
        mov dword [dword ebp-04B2h], 0E6h
        mov byte [dword ebp-04AEh], 4
        mov byte [dword ebp-04ACh], 0
        mov byte [dword ebp-04ABh], 5
        mov dword [dword ebp-04C6h], eax
        call FindShape
        add esp, byte 8
        push str_Aal1
        push dword [byte ebp+076h]
        mov dword [dword ebp-0470h], eax
        call FindShape
        add esp, byte 8
        push str_Aal2
        push dword [byte ebp+076h]
        mov dword [dword ebp-046Ch], eax
        call FindShape
        mov dword [dword ebp-0468h], eax
        lea eax, [dword ebp-0DAh]
        mov dword [dword ebp-0476h], eax
        mov eax, dword [dword ebp-0470h]
        mov dword [dword ebp-047Ah], 3
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        mov dword [dword ebp-0464h], eax
        push str_Aar0
        mov eax, dword [dword ebp-0470h]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0450h], 1EBh
        mov dword [dword ebp-044Ch], 0E6h
        mov byte [dword ebp-0448h], 4
        mov byte [dword ebp-0446h], 5
        mov byte [dword ebp-0445h], 3
        mov dword [dword ebp-0460h], eax
        call FindShape
        add esp, byte 8
        push str_Aar1
        push dword [byte ebp+076h]
        mov dword [dword ebp-040Ah], eax
        call FindShape
        add esp, byte 8
        push str_Aar2
        push dword [byte ebp+076h]
        mov dword [dword ebp-0406h], eax
        call FindShape
        mov dword [dword ebp-0402h], eax
        lea eax, [dword ebp-09Ah]
        mov dword [dword ebp-0410h], eax
        mov eax, dword [dword ebp-040Ah]
        mov dword [dword ebp-0414h], 3
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Swt0
        mov dword [dword ebp-03FEh], eax
        mov eax, dword [dword ebp-040Ah]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-03EAh], 210h
        mov dword [dword ebp-03E6h], 0E6h
        mov byte [dword ebp-03E2h], 8
        mov byte [dword ebp-03E1h], 7
        mov byte [dword ebp-03E0h], 2
        mov dword [dword ebp-03FAh], eax
        call FindShape
        add esp, byte 8
        push str_Swt12
        push dword [byte ebp+076h]
        mov dword [dword ebp-03A4h], eax
        call FindShape
        mov dword [dword ebp-03A0h], eax
        lea eax, [byte ebp-05Ah]
        mov dword [dword ebp-03AAh], eax
        mov eax, dword [dword ebp-03A4h]
        mov dword [dword ebp-03AEh], 6
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push str_Rul13
        mov dword [dword ebp-0398h], eax
        mov eax, dword [dword ebp-03A4h]
        push dword [byte ebp+076h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0384h], 147h
        mov dword [dword ebp-0380h], 8Bh
        mov byte [dword ebp-037Bh], 5
        mov byte [dword ebp-037Ah], 1
        mov byte [dword ebp-0379h], 2
        mov dword [dword ebp-038Ch], 35h
        mov dword [dword ebp-0394h], eax
        call FindShape
        add esp, byte 8
        push str_Rul23
        push dword [byte ebp+076h]
        mov dword [dword ebp-033Eh], eax
        call FindShape
        add esp, byte 8
        push str_Rul33
        push dword [byte ebp+076h]
        mov dword [dword ebp-033Ah], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0336h], eax
        lea eax, [byte ebp-01Ah]
        mov dword [dword ebp-0344h], eax
        mov eax, dword [dword ebp-033Eh]
        mov dword [dword ebp-0348h], 8
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-0332h], eax
        mov eax, dword [dword ebp-033Eh]
        mov ecx, 66h
        lea edi, [dword ebp-02F2h]
        movsx eax, word [byte eax+0Eh]
        mov esi, TeamStatsBitmap
        mov dword [dword ebp-032Eh], eax
        mov ax, word [word_114CE0]
        mov dword [dword ebp-031Eh], 146h
        xor ah, ah
        mov dword [dword ebp-031Ah], 0D4h
        and al, 1
        mov byte [dword ebp-0316h], 4
        or al, 6
        mov byte [dword ebp-0314h], 1
        cwde
        mov byte [dword ebp-0313h], 2
        call OpenScreen
        rep movsb
        mov byte [dword ebp-02B0h], 0
        mov byte [dword ebp-02AEh], 6
        mov ecx, 66h
        lea edi, [dword ebp-028Ch]
        mov esi, str_Standings
        mov byte [dword ebp-02ADh], 7
        mov byte [dword ebp-02AFh], 6
        rep movsb
        mov byte [dword ebp-024Ah], 3
        mov byte [dword ebp-0248h], 6
        mov ecx, 66h
        lea edi, [dword ebp-0226h]
        mov esi, dword_17BCE2
        mov byte [dword ebp-0247h], 7
        mov byte [dword ebp-0249h], 7
        rep movsb
        mov byte [dword ebp-01E4h], 8
        mov byte [dword ebp-01E2h], 3
        mov byte [dword ebp-01E1h], 8
        mov byte [dword ebp-01E3h], 7
        call SetScreenTarget
        push byte 0
        push dword [dword_1846F4]
        push dword [dword_1846F8]
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [dword_11ED58], eax
        mov eax, dword [dword_1846F0]
        push byte 0
        add eax, byte 10h
        push eax
        push str_HaBck02
        call AllocMemBlock
        mov edx, dword [dword_11ED58]
        mov dword [dword_11ED60], eax
        mov edi, eax
        mov esi, dword [byte edx+02Ch]
        movsd
        movsd
        movsd
        movsd
        movsb
        mov eax, dword [dword_1846F8]
        mov edx, 87h
        sar eax, 1
        sub edx, eax
        mov eax, dword [dword_11ED60]
        mov word [byte eax+0Ch], dx
        mov eax, dword [dword_1846F4]
        mov edx, 8Ch
        sar eax, 1
        sub edx, eax
        mov eax, dword [dword_11ED60]
        add esp, byte 0Ch
        mov word [byte eax+0Eh], dx
        push dword [dword_11ED60]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push byte 0
        push dword [dword_1846F4]
        push dword [dword_1846F8]
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [dword_11ED5C], eax
        mov eax, dword [dword_1846F0]
        push byte 0
        add eax, byte 10h
        push eax
        push str_HaBck12
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [dword_11ED64], eax
        mov edx, dword [dword_11ED5C]
        mov edi, eax
        mov esi, dword [byte edx+02Ch]
        movsd
        movsd
        movsd
        movsd
        movsb
        mov eax, dword [dword_1846F8]
        mov edx, 1FDh
        sar eax, 1
        sub edx, eax
        mov eax, dword [dword_11ED64]
        mov word [byte eax+0Ch], dx
        mov eax, dword [dword_1846F4]
        mov edx, 8Ch
        sar eax, 1
        sub edx, eax
        mov eax, dword [dword_11ED64]
        mov word [byte eax+0Eh], dx
        push dword [dword_11ED64]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push byte 0
        push dword 0A0h
        push str_Rk222
        push dword [byte ebp+076h]
        call FindShape
        movsx eax, word [byte eax+04h]
        add esp, byte 8
        inc eax
        inc eax
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [dword_11ED68], eax
        xor edx, edx
        mov eax, dword [byte eax+02Ch]
        call CopyBitmap
        mov dx, word [word_11ED38]
        mov dword [dword_11ED70], eax
        mov word [byte eax+0Ch], dx
        mov eax, dword [dword_11ED70]
        mov dx, word [dword_11ED40]
        mov word [byte eax+0Eh], dx
        push dword [dword_11ED70]
        call DrawShapeAtOwnPos
        add esp, byte 4
        push byte 0
        push dword 0A0h
        push str_Rk222
        push dword [byte ebp+076h]
        call FindShape
        movsx eax, word [byte eax+04h]
        add esp, byte 8
        inc eax
        inc eax
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [dword_11ED6C], eax
        xor edx, edx
        mov eax, dword [byte eax+02Ch]
        call CopyBitmap
        mov edx, dword [dword_11ED6C]
        mov dword [dword_11ED74], eax
        mov edx, dword [byte edx+02Ch]
        mov si, word [dword_11ED3C]
        sub si, word [byte edx+04h]
        mov word [byte eax+0Ch], si
        mov eax, dword [dword_11ED74]
        mov dx, word [dword_11ED40]
        mov word [byte eax+0Eh], dx
        push dword [dword_11ED74]
        call DrawShapeAtOwnPos
        add esp, byte 4
        mov eax, dword [byte ebp+076h]
        call DrawModemHomePanel
        mov eax, dword [byte ebp+076h]
        call DrawModemAwayPanel
        call MusicDone
        test eax, eax
        jne short .1
        call PlayMusic
.1:
        mov edx, dword [dword ebp-024Eh]
        mov eax, dword [dword ebp-0252h]
        mov ebx, 3
        call SetMenuMouse
        mov edx, dword [byte ebp+07Ah]
        xor eax, eax
        mov dword [byte ebp+06Eh], 7
        call FadePalette
.2:
        call SoundIdle
        cmp dword [byte ebp+06Eh], byte 0
        jl short .4
        cmp dword [byte ebp+06Eh], byte 9
        jge short .4
        imul eax, dword [byte ebp+06Eh], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-051Ch]
        jne short .3
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0518h]
        je short .4
.3:
        mov dword [byte ebp+06Eh], 0FFFFFFFFh
.4:
        push byte 3
        lea eax, [byte ebp+06Eh]
        push byte 6
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-0556h]
        push eax
        xor ecx, ecx
        mov eax, 9
        call RunMenu
        cmp dword [byte ebp+06Eh], byte 8
        ja near ModemTeamSelectScreen_B78.15
        mov esi, dword [byte ebp+06Eh]
        mov edx, dword [dword_17D273]
        mov eax, dword [dword_17D273]
        and edx, 0FFFE0FFFh
        and eax, 0FFC1FFFFh
        jmp dword [nosplit cs:esi*4+jpt_A3CD4]
ModemTeamSelectScreen_7F1:
        test dword [dword_17D273], 1F000h
        jne short .5
        mov dword [dword_17D273], edx
        or edx, 1C000h
        mov dword [dword_17D273], edx
.5:
        mov eax, dword [dword_17D273]
        shl eax, 0Fh
        shr eax, 1Bh
        dec eax
        and eax, byte 1Fh
        and dword [dword_17D273], 0FFFE0FFFh
        shl eax, 0Ch
        or dword [dword_17D273], eax
        mov edx, dword [dword_17D273]
        mov eax, dword [dword_17D273]
        shl edx, 0Ah
        shl eax, 0Fh
        shr edx, 1Bh
        shr eax, 1Bh
        cmp edx, eax
        jne short .7
        mov eax, dword [dword_17D273]
        and eax, 3E0000h
        cmp eax, 340000h
        jb short .7
        test dword [dword_17D273], 1F000h
        jne short .6
        and dword [dword_17D273], 0FFFE0FFFh
        or dword [dword_17D273], 1C000h
.6:
        mov eax, dword [dword_17D273]
        shl eax, 0Fh
        shr eax, 1Bh
        dec eax
        and eax, byte 1Fh
        and dword [dword_17D273], 0FFFE0FFFh
        shl eax, 0Ch
        or dword [dword_17D273], eax
.7:
        mov eax, dword [byte ebp+072h]
        call DrawModemHomePanel
        jmp near ModemTeamSelectScreen_B78.15
ModemTeamSelectScreen_8AC:
        mov eax, dword [dword_17D273]
        shl eax, 0Fh
        shr eax, 1Bh
        inc eax
        and eax, byte 1Fh
        shl eax, 0Ch
        mov dword [dword_17D273], edx
        or edx, eax
        mov eax, edx
        and eax, 1F000h
        mov dword [dword_17D273], edx
        cmp eax, 1C000h
        jne short .8
        and dword [dword_17D273], 0FFFE0FFFh
.8:
        mov edx, dword [dword_17D273]
        mov eax, dword [dword_17D273]
        shl edx, 0Ah
        shl eax, 0Fh
        shr edx, 1Bh
        shr eax, 1Bh
        cmp edx, eax
        jne short ModemTeamSelectScreen_7F1.7
        mov edx, dword [dword_17D273]
        and edx, 3E0000h
        cmp edx, 340000h
        jb short ModemTeamSelectScreen_7F1.7
        inc eax
        and eax, byte 1Fh
        and dword [dword_17D273], 0FFFE0FFFh
        shl eax, 0Ch
        or dword [dword_17D273], eax
        mov eax, dword [dword_17D273]
        and eax, 1F000h
        cmp eax, 1C000h
        jne near ModemTeamSelectScreen_7F1.7
        and dword [dword_17D273], 0FFFE0FFFh
        jmp near ModemTeamSelectScreen_7F1.7
ModemTeamSelectScreen_94E:
        test byte [byte_17D275], 3Eh
        jne short .9
        mov dword [dword_17D273], eax
        or eax, 380000h
        mov dword [dword_17D273], eax
.9:
        mov eax, dword [dword_17D273]
        shl eax, 0Ah
        shr eax, 1Bh
        dec eax
        and eax, byte 1Fh
        and byte [byte_17D275], 0C1h
        shl eax, 11h
        or dword [dword_17D273], eax
        mov edx, dword [dword_17D273]
        mov eax, dword [dword_17D273]
        shl edx, 0Fh
        shl eax, 0Ah
        shr edx, 1Bh
        shr eax, 1Bh
        cmp edx, eax
        jne short .11
        mov eax, dword [dword_17D273]
        and eax, 1F000h
        cmp eax, 1A000h
        jb short .11
        test byte [byte_17D275], 3Eh
        jne short .10
        and byte [byte_17D275], 0C1h
        or byte [byte_17D275], 38h
.10:
        mov eax, dword [dword_17D273]
        shl eax, 0Ah
        shr eax, 1Bh
        dec eax
        and eax, byte 1Fh
        and byte [byte_17D275], 0C1h
        shl eax, 11h
        or dword [dword_17D273], eax
.11:
        mov eax, dword [byte ebp+072h]
        call DrawModemAwayPanel
        jmp near ModemTeamSelectScreen_B78.15
ModemTeamSelectScreen_9F4:
        mov edx, dword [dword_17D273]
        shl edx, 0Ah
        shr edx, 1Bh
        inc edx
        and edx, byte 1Fh
        shl edx, 11h
        mov dword [dword_17D273], eax
        or eax, edx
        mov dword [dword_17D273], eax
        and eax, 3E0000h
        cmp eax, 380000h
        jne short .12
        and byte [byte_17D275], 0C1h
.12:
        mov edx, dword [dword_17D273]
        mov eax, dword [dword_17D273]
        shl edx, 0Fh
        shl eax, 0Ah
        shr edx, 1Bh
        shr eax, 1Bh
        cmp edx, eax
        jne short ModemTeamSelectScreen_94E.11
        mov edx, dword [dword_17D273]
        and edx, 1F000h
        cmp edx, 1A000h
        jb short ModemTeamSelectScreen_94E.11
        inc eax
        and eax, byte 1Fh
        and byte [byte_17D275], 0C1h
        shl eax, 11h
        or dword [dword_17D273], eax
        mov eax, dword [dword_17D273]
        and eax, 3E0000h
        cmp eax, 380000h
        jne near ModemTeamSelectScreen_94E.11
        and byte [byte_17D275], 0C1h
        jmp near ModemTeamSelectScreen_94E.11
ModemTeamSelectScreen_A8A:
        mov esi, 2
.13:
        push esi
        push str_SwtD2
        lea eax, [byte ebp+066h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+066h]
        push eax
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        call GetTicks
        lea edi, [byte eax+03h]
.14:
        call GetTicks
        cmp eax, edi
        jl short .14
        inc esi
        cmp esi, byte 5
        jl short .13
        push str_Swt12
        push dword [byte ebp+072h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        mov eax, dword [dword_17D273]
        shl eax, 0Fh
        mov edx, dword [dword_17D273]
        shr eax, 1Bh
        and byte [byte_17D275], 0C1h
        and eax, byte 1Fh
        shl edx, 0Ah
        shl eax, 11h
        shr edx, 1Bh
        or dword [dword_17D273], eax
        mov eax, edx
        and eax, byte 1Fh
        and dword [dword_17D273], 0FFFE0FFFh
        shl eax, 0Ch
        add esp, byte 4
        or dword [dword_17D273], eax
        mov eax, dword [byte ebp+072h]
        call DrawModemHomePanel
        jmp near ModemTeamSelectScreen_94E.11
ModemTeamSelectScreen_B38:
        mov eax, 1
        call GameOptionsScreen
        mov edx, dword [dword ebp-031Ah]
        mov eax, dword [dword ebp-031Eh]
        call SetMenuMouse
        mov dword [byte ebp+06Eh], 5
        jmp short ModemTeamSelectScreen_B78.15
ModemTeamSelectScreen_B5C:
        call SlideInSideBar
        mov dword [byte ebp+07Eh], 6
        jmp short ModemTeamSelectScreen_B78.15
ModemTeamSelectScreen_B6A:
        call SlideInTitleBar
        mov dword [byte ebp+07Eh], 3
        jmp short ModemTeamSelectScreen_B78.15
ModemTeamSelectScreen_B78:
        call SlideInBottomBar
        push dword [MatchupLayer]
        call TextSetFont
        add esp, byte 4
        mov ecx, 0FCh
        mov ebx, 0FAh
        push dword 0FEh
        mov edx, 0F7h
        mov eax, 1
        call ModemChat
.15:
        cmp dword [byte ebp+07Eh], byte 0
        jl near ModemTeamSelectScreen.2
        xor esi, esi
.16:
        cmp dword [dword esi+dword_11ED60], byte 0
        je short .17
        push dword [dword esi+dword_11ED60]
        call FreeMemBlock
        add esp, byte 4
        mov dword [dword esi+dword_11ED60], 0
.17:
        cmp dword [dword esi+dword_11ED58], byte 0
        je short .18
        push dword [dword esi+dword_11ED58]
        call FreeBitmap
        add esp, byte 4
        mov dword [dword esi+dword_11ED58], 0
.18:
        cmp dword [dword esi+dword_11ED70], byte 0
        je short .19
        push dword [dword esi+dword_11ED70]
        call FreeMemBlock
        add esp, byte 4
        mov dword [dword esi+dword_11ED70], 0
.19:
        cmp dword [dword esi+dword_11ED68], byte 0
        je short .20
        push dword [dword esi+dword_11ED68]
        call FreeBitmap
        add esp, byte 4
        mov dword [dword esi+dword_11ED68], 0
.20:
        add esi, byte 4
        cmp esi, byte 8
        jne near .16
        push dword [byte ebp+072h]
        call FreeMemBlock
        add esp, byte 4
        mov eax, 2
        call FadeOut
        mov eax, dword [byte ebp+07Eh]
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near DrawModemHomePanel_15D
;-----------------------------------------------------------------------------
; RunModemGameSetup                            A4961  96 PC, medium confidence
; From the main menu: the modem set-up (or a serial link), the modem game
; stats and team ranks, team select, the controller screen, until a game
; starts
;-----------------------------------------------------------------------------
RunModemGameSetup:
        push edx
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        cwde
        test eax, eax
        jne short .1
        call RunModemSetup
        mov edx, eax
        jmp short .2
.1:
        mov edx, 12h
.2:
        cmp edx, byte 12h
        jne short .3
        call LoadModemStats
        mov dword [gameopts], unk_17D272
        call ComputeTeamRanks
.3:
        cmp edx, byte 12h
        jne short .6
        mov dword [gameopts], unk_17D272
        call ModemTeamSelectScreen
        mov edx, eax
        cmp eax, byte 3
        jne short .5
        mov eax, 12h
        call RunControllerScreen
.4:
        mov edx, eax
        jmp short .3
.5:
        cmp eax, byte 6
        jne short .3
        call LinkSetupScreen
        jmp short .4
.6:
        mov eax, edx
        pop edx
        ret
unk_A49D1:
        db 01Ch,00h,00h,013h,024h,01h,014h,01h,02h,03h,015h,012h,02h,04h,016h,012h
        db 03h,05h,017h,012h,04h,06h,018h,012h,05h,07h,019h,012h,06h,08h,01Ah,012h
        db 07h,09h,01Bh,012h,08h,013h,01Ch,012h,0Ah,0Bh,012h,01Dh,0Ah,0Ch,012h,01Eh
        db 0Bh,0Dh,012h,01Fh,0Ch,0Eh,012h,020h,0Dh,0Fh,012h,021h,0Eh,010h,012h,022h
        db 0Fh,011h,012h,023h,010h,014h,012h,024h,025h,09h,03h,0Bh,01Ch,013h,00h,014h
        db 011h,014h,013h,01h,015h,016h,015h,02h,015h,017h,016h,03h,016h,018h,017h,04h
        db 017h,019h,018h,05h,018h,01Ah,019h,06h,019h,01Bh,01Ah,07h,01Ah,01Ch,01Bh,08h
        db 01Bh,00h,00h,09h,01Dh,01Eh,0Ah,01Dh,01Dh,01Fh,0Bh,01Eh,01Eh,020h,0Ch,01Fh
        db 01Fh,021h,0Dh,020h,020h,022h,0Eh,021h,021h,023h,0Fh,022h,022h,024h,010h,023h
        db 023h,01h,011h,024h,025h,012h,02h,0Ah
str_Z:
        db 05Ah,00h,00h,00h,08Ah,00h,00h,00h,0C6h,00h,00h,00h,08Ah,00h,00h,00h
        db 0CAh,00h,00h,00h,0A2h,00h,00h,00h,05Ch,00h,00h,00h,0A2h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 05Dh,00h,00h,00h,0AAh,00h,00h,00h,0CAh,00h,00h,00h,0AAh,00h,00h,00h
        db 0CEh,00h,00h,00h,0C2h,00h,00h,00h,060h,00h,00h,00h,0C2h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 063h,00h,00h,00h,0D7h,00h,00h,00h,0CFh,00h,00h,00h,0D7h,00h,00h,00h
        db 0D2h,00h,00h,00h,0EFh,00h,00h,00h,065h,00h,00h,00h,0EFh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 066h,00h,00h,00h,0F7h,00h,00h,00h,0D0h,00h,00h,00h,0F7h,00h,00h,00h
        db 0D4h,00h,00h,00h,010h,01h,00h,00h,069h,00h,00h,00h,010h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 06Bh,00h,00h,00h,023h,01h,00h,00h,0D6h,00h,00h,00h,023h,01h,00h,00h
        db 0D9h,00h,00h,00h,03Ch,01h,00h,00h,06Dh,00h,00h,00h,03Ch,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 06Eh,00h,00h,00h,043h,01h,00h,00h,0D8h,00h,00h,00h,043h,01h,00h,00h
        db 0DCh,00h,00h,00h,05Bh,01h,00h,00h,071h,00h,00h,00h,05Bh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 072h,00h,00h,00h,070h,01h,00h,00h,0DDh,00h,00h,00h,070h,01h,00h,00h
        db 0E1h,00h,00h,00h,08Ah,01h,00h,00h,076h,00h,00h,00h,08Ah,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 076h,00h,00h,00h,090h,01h,00h,00h,0E1h,00h,00h,00h,090h,01h,00h,00h
        db 0E5h,00h,00h,00h,0ABh,01h,00h,00h,079h,00h,00h,00h,0ABh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0B9h,01h,00h,00h,08Ch,00h,00h,00h,024h,02h,00h,00h,08Ch,00h,00h,00h
        db 022h,02h,00h,00h,0A0h,00h,00h,00h,0B6h,01h,00h,00h,0A0h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0B6h,01h,00h,00h,0ABh,00h,00h,00h,022h,02h,00h,00h,0ABh,00h,00h,00h
        db 01Fh,02h,00h,00h,0C1h,00h,00h,00h,0B4h,01h,00h,00h,0C1h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0B1h,01h,00h,00h,0D7h,00h,00h,00h,01Dh,02h,00h,00h,0D7h,00h,00h,00h
        db 01Ah,02h,00h,00h,0EEh,00h,00h,00h,0AEh,01h,00h,00h,0EEh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0AEh,01h,00h,00h,0F9h,00h,00h,00h,019h,02h,00h,00h,0F9h,00h,00h,00h
        db 016h,02h,00h,00h,0Eh,01h,00h,00h,0ABh,01h,00h,00h,0Eh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0AAh,01h,00h,00h,024h,01h,00h,00h,015h,02h,00h,00h,024h,01h,00h,00h
        db 012h,02h,00h,00h,03Ah,01h,00h,00h,0A6h,01h,00h,00h,03Ah,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0A6h,01h,00h,00h,045h,01h,00h,00h,010h,02h,00h,00h,045h,01h,00h,00h
        db 0Fh,02h,00h,00h,059h,01h,00h,00h,0A4h,01h,00h,00h,059h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0A2h,01h,00h,00h,074h,01h,00h,00h,0Ch,02h,00h,00h,073h,01h,00h,00h
        db 0Ah,02h,00h,00h,088h,01h,00h,00h,0A0h,01h,00h,00h,089h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 09Eh,01h,00h,00h,093h,01h,00h,00h,08h,02h,00h,00h,093h,01h,00h,00h
        db 06h,02h,00h,00h,0A8h,01h,00h,00h,09Ch,01h,00h,00h,0A9h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0FBh,00h,00h,00h,0C4h,00h,00h,00h,02h,01h,00h,00h,0B9h,00h,00h,00h
        db 07Ch,01h,00h,00h,0B9h,00h,00h,00h,083h,01h,00h,00h,0C6h,00h,00h,00h
        db 07Bh,01h,00h,00h,0D0h,00h,00h,00h,03h,01h,00h,00h,0D0h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 055h,00h,00h,00h,0C6h,01h,00h,00h,05Dh,00h,00h,00h,0BBh,01h,00h,00h
        db 0D5h,00h,00h,00h,0BBh,01h,00h,00h,0DFh,00h,00h,00h,0C7h,01h,00h,00h
        db 0D5h,00h,00h,00h,0D1h,01h,00h,00h,060h,00h,00h,00h,0D1h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0A0h,01h,00h,00h,0C6h,01h,00h,00h,0AAh,01h,00h,00h,0BBh,01h,00h,00h
        db 022h,02h,00h,00h,0BBh,01h,00h,00h,02Bh,02h,00h,00h,0C7h,01h,00h,00h
        db 023h,02h,00h,00h,0D2h,01h,00h,00h,0AAh,01h,00h,00h,0D2h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0EFh,00h,00h,00h,074h,00h,00h,00h,0F7h,00h,00h,00h,06Ch,00h,00h,00h
        db 08Bh,01h,00h,00h,06Ch,00h,00h,00h,093h,01h,00h,00h,073h,00h,00h,00h
        db 093h,01h,00h,00h,084h,00h,00h,00h,08Bh,01h,00h,00h,08Bh,00h,00h,00h
        db 0F8h,00h,00h,00h,08Ah,00h,00h,00h,0F0h,00h,00h,00h,082h,00h,00h,00h
unk_A4F69:
        dd str_7GM
        dd str_5GM
        dd str_3GM
        dd str_1GM
unk_A4F79:
        db 06h,05h,03h,014h,013h,017h,04h,016h,012h,0Eh,010h,02h,011h,018h,0Ch,01h
unk_A4F89:
        db 01h,00h,00h,00h,08h,00h,00h,00h,02h,00h,00h,00h,07h,00h,00h,00h
        db 03h,00h,00h,00h,06h,00h,00h,00h,04h,00h,00h,00h,05h,00h,00h,00h
unk_A4FA9:
        db 0A4h,0A5h,0A3h,0A5h,0A2h,0A5h,0A1h,0A5h,0A0h,0A5h,09Fh,0A5h,00h,00h
jpt_A4FB7:
        dd RunPlayoffMenus_A6
        dd RunPlayoffMenus_115
        dd RunPlayoffMenus_CD
        dd RunPlayoffMenus_D6
        dd RunPlayoffMenus_E1
        dd RunPlayoffMenus_89
        dd RunPlayoffMenus_73
        dd RunPlayoffMenus_102
