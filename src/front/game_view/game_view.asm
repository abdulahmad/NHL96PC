; The 3D game view: set-up and frame draw, shading LUT, player and puck sprites, controller markers, the game overlays (clock, power play, panels) and the line change boxes (96 PC).
bits 32
%include "hockey.inc"
section s_584A0 progbits alloc exec nowrite align=1
extern asc_111008, awtmstruct, byte_1175A4, byte_1175A5, byte_1175A6, byte_1175A7, byte_1175A8, byte_1175A9
extern byte_1175AA, byte_1175AB, byte_1175AC, byte_157191, byte_1647E0, byte_1647FA, byte_1655A4, byte_1655E0
extern byte_16561C, byte_165658, byte_165694, byte_176F96, byte_1770A2, byte_1770A3, byte_1770A4, byte_1770A5
extern byte_1770D7, byte_1796AC, byte_1796BF, byte_1796C0, byte_1796DC, byte_179700, byte_179701, byte_17970A
extern byte_17970B, byte_17970D, byte_179712, byte_179713, byte_179715, byte_17971B, byte_17971C, byte_179722
extern byte_179723, byte_17972D, byte_179733, byte_179743, byte_17974B, byte_179759, byte_17975A, byte_179763
extern byte_179764, byte_1798A4, byte_179CB8, byte_179CB9, byte_179DC1, byte_179E06, byte_17CA5D, CloseTextOverlay
extern curperiod, dword_1176E5, dword_118E89, dword_119D04, dword_119FEC, dword_11A3F8, dword_11B234, dword_11B238
extern dword_11B23C, dword_11B240, dword_11B244, dword_11B248, dword_11B24C, dword_11B270, dword_11B294, dword_11B298
extern dword_11B2A8, dword_11B2E8, dword_11B2EC, dword_11B2F0, dword_11B2F4, dword_11B2F8, dword_11B2FC, dword_11B300
extern dword_11B304, dword_11B308, dword_11B310, dword_11B318, dword_11B31C, dword_11B320, dword_11B324, dword_11B328
extern dword_11B32C, dword_11B330, dword_11B364, dword_11B374, dword_11B9F4, dword_11BB14, dword_11BB18, dword_11BB1C
extern dword_11BC24, dword_11D91F, dword_11F5C0, dword_11F5C4, dword_1219A4, ClipTopRow, ClipLeftCol, ClipRight
extern ScreenHeight, DrawDestBuffer, dword_152F4C, dword_152FEC, dword_1531D0, dword_15E4BC, dword_15E4C0, dword_15E8D8
extern dword_15E8E0, dword_15E8E4, dword_15E8F8, dword_15E8FC, dword_1647A0, dword_1647A4, dword_164816, dword_164838
extern dword_16505C, dword_165060, dword_165064, dword_165166, dword_16516A, dword_16516E, dword_165172, dword_177108
extern dword_17828C, dword_178290, dword_178294, dword_178298, dword_17829C, dword_1782A0, dword_1782A4, dword_1782A8
extern dword_178EA8, dword_178EAC, dword_1792AC, dword_1797AC, dword_1797B0, dword_1797B4, dword_1797B8, dword_1797BC
extern dword_1797DC, dword_1797F4, dword_1797F8, dword_1797FC, dword_179800, dword_1798A8, dword_1798AC, dword_1798B0
extern dword_1798B4, dword_1798B8, dword_1798BC, dword_1798E4, dword_1798E8, dword_1798EC, dword_1798F0, dword_1798F4
extern dword_1798F8, dword_1798FC, dword_179900, dword_179904, dword_179908, dword_17990C, dword_179910, dword_179914
extern dword_179918, dword_179920, dword_179924, dword_179928, dword_17992C, dword_179930, dword_179934, dword_179978
extern dword_17997C, dword_179A7C, dword_179AC8, dword_179C88, dword_179C8C, dword_179C90, dword_179DCE, dword_179E0B
extern dword_179E0F, dword_179E13, dword_179E17, dword_179E1B, dword_17BA4C, dword_17BA50, dword_17BA54, dword_17CA5C
extern dword_17D528, FillRect, FormatPlayerName, fputchar, gameclock, gameopts, GetLowestPen, GetSpecialTeamsRanks
extern gmode, gmode2, gsp, hmroster, hmtmstruct, lcboxon, lcline, lineuptime
extern LoadPackedFile, LoadTeamLogo, MouseRead, mousex, mousey, PtrPuckFlags, off_11B278, optflags
extern puckc, puckz, rand_, SetClipWindow, SetViewRect, SortCords, SortIndices, sprintf_
extern str_12, str_12s, str_24, str_2d, str_2d01d, str_2d02d2, str_32, str_3s
extern str_42, str_B000, str_B001, str_DDD2, str_DDD3, str_DS, str_Goal0, str_Goal1
extern str_Logo, str_Priority, str_SS2, strcmp_, strcpy_, StepGlassShards, ApplyGlassShake, UpdateGoalLight
extern DrawPuckModel, DrawPuckShadowModel, PlacePuckModels, DrawZamboni, MoveZamboni, DrawGoalNet, PlaceGoalNet, SetIceLogoTexture
extern FreeStandsArt, LoadStandsArt, LoadRinkModel, FreeRinkModel, SetViewCamera, DrawRinkModels, DrawRinkBack, DrawRinkFront
extern DrawWholeRink, sub_297C9, sub_299CF, sub_2E1BE, sub_4B38C, sub_4B4F3, sub_53BD7, sub_53C6F
extern sub_54237, sub_54391, sub_5439F, sub_54427, SetCameraShot, ResetCameraShake, SetGameViewSize, SaveTeamPalette
extern SetPlayerSpriteColors, SetRinkSpriteColors, LoadGameSprites, GetSpriteFrame, SpriteScale, DrawText, DrawTextCentred, SetTextColors
extern DrawColorText, DrawColorTextRight, DrawColorTextCentred, FillBox, DrawPauseFrame, GetLangText, BuildAntiAliasTable, sub_AAA40
extern sub_AAADC, AllocMemBlock, FreeMemBlock, sub_AD35C, sub_AD620, sub_AFFD0, sub_B0CA8, sub_B0F7C
extern sub_B58D8, sub_B6140, sub_B6148, sub_BA3D0, DrawFlatPoly, DrawPolyOutline, sub_BB924, MultiplyMatrix
extern SetScreenScale, sub_BC3A0, sub_BC3F4, sub_BC610, sub_BC674, sub_BC6D8, sub_BC760, sub_BD86C
extern sub_BE926, sub_BE960, sub_BEF44, sub_BEFF0, SetScreenTarget, SetRemapTable, sub_DD908, SetBlitSource
extern sub_DD975, sub_DDBB4, sub_E0486, sub_E04E0, sub_E0584, sub_E162A, SetViewScreenOrigin, TeamLineEnergy
extern TextSetFont, unk_111024, unk_11B2AC, unk_122320, unk_157FDA, unk_157FF8, unk_1582F5, unk_158313
extern unk_16443C, unk_1782AC, unk_1786AC, unk_178AAC, unk_1798C0, unk_179980, unk_179AC0, unk_179BBC
extern unk_17B248, unk_17B518, unk_17B830, unk_17B930, unk_17D3E8, unk_58468, unk_5848C, vtoa
extern HomeControlSlot, word_117902, word_119111, word_119117, word_11911F, word_119127, word_11B274, word_11B276
extern word_1515B5, word_1647A8, word_1647AA, word_1650A6, word_165144, word_165146, word_165148, word_16514A
extern word_16514C, word_1656DA, word_1656DC, word_1656E8, word_165704, word_165710, word_16581E, word_16583A
extern word_165846, word_17709C
global DrawScaledSprite, DrawScaledSprite_1E2, BuildShadeMatch, BuildShadeLut, AllocShadeLut, AllocShadeLut_5A, LoadIceLogo, FullViewClip
global DimGameView, InitGameView, InitGameView_709, InitGameView_70A, FreeGameView, DrawRosterName, DrawRosterNumber, DrawRinkSprite
global DrawPlayerSprite, DrawSpriteShadow, jpt_5960F, DrawControlMarker, DrawControlMarker_26, DrawControlMarker_2F, DrawControlMarker_38, DrawControlMarker_41
global DrawPuckSprite, SpinPuckModel, PlaceGoalNets, PlaceGoalNets_65, PlaceGoalNets_71, PlaceGoalNets_E0, PlaceGoalNets_20B, DrawPlayerShadows
global DrawPlayers, DrawPlayerMarkers, DrawRinkView, DrawGameFrame, DrawPanelLogo, OpenOverlayPanel, DrawOverlayCaption, DrawOverlayCaption_D7
global DrawOverlayCaption_DC, DrawOverlayCaption_E1, ResetGameOverlays, DrawTimedPanel, DrawGameClock, DrawPenaltyClock, DrawPowerPlayPanel, DrawPlayerPctPanel
global DrawClockPanel, DrawTimeLeftPanel, jpt_5BD6D, GetPeriodText, GetPeriodText_1F, GetPeriodText_3C, GetPeriodText_59, GetPeriodText_86
global jpt_5BE45, DrawScorePanel, DrawScorePanel_689, DrawScorePanel_690, DrawScorePanel_697, DrawScorePanel_69E, sub_5C55F, DrawPlayerNamePanel
global sub_5C7E2, sub_5CA5B, QueueOverlayPanel, DrawGameOverlays, DrawLineEnergyBar, DrawLineChangeBox, DrawLineChangeBoxes, unk_5D549
global unk_5D555, unk_5D561, unk_5D56D, unk_5D579, unk_5D585, unk_5D591, unk_5D591_84, unk_5D639
global unk_5D65D, unk_5D681
;-----------------------------------------------------------------------------
; DrawScaledSprite                                584A0  96 PC, low confidence
; Draws one scaled sprite frame clipped to the view (ClipTopRow-1228E4),
; for DrawPlayerSprite
;-----------------------------------------------------------------------------
DrawScaledSprite:
        push esi
        push edi
        enter 81Ch, 0
        mov esi, eax
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-04h], ebx
        mov edi, ecx
        movsx edx, word [byte eax+06h]
        movsx eax, word [byte eax+0Ah]
        sub edx, eax
        mov eax, edx
        mov edx, dword [byte ebp+014h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, eax
        imul eax, dword [byte ebp+018h]
        mov ebx, dword [byte ebp+010h]
        movsx edx, word [byte esi+08h]
        imul ebx, edx
        mov edx, dword [byte ebp-04h]
        shl edx, 10h
        sub edx, ebx
        sub edx, eax
        mov dword [byte ebp-08h], 0
        mov dword [byte ebp-04h], edx
        cmp edi, dword [ClipLeftCol]
        jge short .1
        mov eax, dword [ClipLeftCol]
        mov dword [byte ebp-010h], eax
        jmp short .2
.1:
        mov dword [byte ebp-010h], edi
.2:
        mov eax, dword [byte ebp-04h]
        sar eax, 10h
        sub edi, ecx
        cmp eax, dword [ClipRight]
        jge near DrawScaledSprite_1E2
        cmp edi, dword [ScreenHeight]
        jge near DrawScaledSprite_1E2
        movsx eax, word [byte esi+06h]
        shl eax, 10h
        dec eax
        push dword [byte ebp+014h]
        mov dword [byte ebp-0Ch], eax
        call sub_BE926
        add esp, byte 4
        mov dword [byte ebp-01Ch], eax
        cmp edi, dword [byte ebp-010h]
        jge short .3
        mov edx, dword [byte ebp-010h]
        mov ebx, dword [byte ebp+018h]
        sub edx, edi
        imul ebx, edx
        imul eax, edx
        mov edi, dword [byte ebp-010h]
        add dword [byte ebp-04h], ebx
        sub dword [byte ebp-0Ch], eax
.3:
        push dword [byte ebp+010h]
        call sub_BE926
        add esp, byte 4
        mov ebx, eax
        mov eax, dword [byte ebp-08h]
        xor edx, edx
        shl eax, 2
        jmp short .5
.4:
        inc dword [byte ebp-08h]
        mov ecx, edx
        add eax, byte 4
        sar ecx, 10h
        add edx, ebx
        mov dword [dword eax+ebp-0820h], ecx
.5:
        movsx ecx, word [byte esi+04h]
        shl ecx, 10h
        cmp edx, ecx
        jge short .6
        cmp eax, 800h
        jl short .4
.6:
        lea eax, [dword ebp-081Ch]
        push eax
        lea eax, [byte esi+010h]
        push eax
        call SetBlitSource
        add esp, byte 8
        push dword [byte ebp-018h]
        call sub_DD975
        mov eax, edi
        shl eax, 2
        add esp, byte 4
        mov dword [byte ebp-014h], eax
        jmp near .13
.7:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-08h]
        xor ebx, ebx
        sar eax, 10h
        cmp edi, dword [ScreenHeight]
        jge near DrawScaledSprite_1E2
        cmp eax, dword [ClipRight]
        jl short .8
        cmp dword [byte ebp+018h], byte 0
        jg near DrawScaledSprite_1E2
        jmp near .12
.8:
        lea ecx, [edx+eax]
        cmp ecx, dword [ClipRight]
        jl short .9
        mov edx, ecx
        mov ecx, dword [byte ebp-08h]
        sub edx, dword [ClipRight]
        sub ecx, edx
        mov edx, ecx
.9:
        cmp eax, dword [ClipTopRow]
        jge short .11
        lea ebx, [eax+edx]
        cmp ebx, dword [ClipTopRow]
        jge short .10
        cmp dword [byte ebp+018h], byte 0
        jl short DrawScaledSprite_1E2
        jmp short .12
.10:
        mov ebx, dword [ClipTopRow]
        sub ebx, eax
        mov eax, dword [ClipTopRow]
        sub edx, ebx
.11:
        test edx, edx
        je short .12
        mov ecx, dword [byte ebp-0Ch]
        push edx
        sar ecx, 10h
        movsx edx, word [byte esi+04h]
        imul ecx, edx
        mov edx, ebx
        mov ebx, ecx
        add ebx, dword [dword ebp+edx*4-081Ch]
        mov edx, dword [DrawDestBuffer]
        add edx, dword [byte ebp-014h]
        push ebx
        add eax, dword [edx]
        push eax
        call sub_DDBB4
        add esp, byte 0Ch
.12:
        mov eax, dword [byte ebp-01Ch]
        add dword [byte ebp-014h], byte 4
        sub dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp+018h]
        inc edi
        add dword [byte ebp-04h], eax
.13:
        cmp dword [byte ebp-0Ch], byte 0
        jge near .7
DrawScaledSprite_1E2:
        leave
        pop edi
        pop esi
        ret 0Ch
        mov byte [dword eax+byte_1796AC], 1
        ret
;-----------------------------------------------------------------------------
; BuildShadeMatch                                 58690  96 PC, low confidence
; (level, palette): for each colour finds the nearest palette colour
; (distance from 270Fh down) at a shade level, for the shading LUT
;-----------------------------------------------------------------------------
BuildShadeMatch:
        push ebx
        push ecx
        push esi
        push edi
        enter 28h, 0
        push eax
        push edx
        mov dword [dword_1798F4], 0
        mov eax, edx
        xor ecx, ecx
        xor ebx, ebx
.1:
        mov dword [byte ebp-04h], 270Fh
        movzx edx, byte [eax]
        mov dword [byte ebp-08h], 0
        mov dword [byte ebp-0Ch], edx
        movzx edx, byte [byte eax+01h]
        xor esi, esi
        mov dword [byte ebp-014h], edx
        movzx edx, byte [byte eax+02h]
        shl dword [byte ebp-0Ch], 2
        mov dword [byte ebp-010h], edx
        shl dword [byte ebp-014h], 2
        shl dword [byte ebp-010h], 2
        jmp short .4
.2:
        mov edx, dword [dword esi+dword_178EAC]
        lea edx, [edx+edx*2]
        add edx, dword [byte ebp-030h]
        movzx edi, byte [edx]
        mov dword [byte ebp-028h], edi
        movzx edi, byte [byte edx+01h]
        movzx edx, byte [byte edx+02h]
        mov dword [byte ebp-01Ch], edx
        mov edx, dword [byte ebp-028h]
        sub edx, dword [byte ebp-0Ch]
        mov dword [byte ebp-018h], edi
        lea edi, [edx+edx*2]
        imul edx, edi
        shl dword [byte ebp-018h], 2
        shl dword [byte ebp-01Ch], 2
        cmp edx, dword [byte ebp-04h]
        jg short .3
        mov edi, dword [byte ebp-018h]
        sub edi, dword [byte ebp-014h]
        mov dword [byte ebp-024h], edi
        add edi, edi
        imul edi, dword [byte ebp-024h]
        add edx, edi
        cmp edx, dword [byte ebp-04h]
        jg short .3
        mov edi, dword [byte ebp-01Ch]
        sub edi, dword [byte ebp-010h]
        imul edi, edi
        add edx, edi
        cmp edx, dword [byte ebp-04h]
        jg short .3
        mov edi, dword [byte ebp-08h]
        mov dword [byte ebp-04h], edx
        mov dword [byte ebp-020h], edi
.3:
        inc dword [byte ebp-08h]
        add esi, byte 4
.4:
        mov edx, dword [byte ebp-08h]
        cmp edx, dword [dword_1798F4]
        jl short .2
        mov edx, dword [byte ebp-04h]
        cmp edx, dword [byte ebp-02Ch]
        jle short .5
        mov edx, dword [dword_1798F4]
        mov dword [dword ebx+dword_1792AC], edx
        lea esi, [byte edx+01h]
        mov dword [nosplit edx*4+dword_178EAC], ecx
        mov dword [dword_1798F4], esi
        jmp short .6
.5:
        mov edx, dword [byte ebp-020h]
        mov dword [dword ebx+dword_1792AC], edx
.6:
        add eax, byte 3
        inc ecx
        add ebx, byte 4
        cmp ecx, 0FFh
        jl near .1
        mov edx, dword [dword_1798F4]
        mov dword [nosplit ecx*4+dword_1792AC], edx
        inc edx
        mov dword [nosplit edx*4+dword_178EA8], ecx
        mov dword [dword_1798F4], edx
        jmp near DrawOverlayCaption_E1
;-----------------------------------------------------------------------------
; BuildShadeLut                                   587B7  96 PC, low confidence
; (level, palette): fills the shading LUT (dword_1798F8) for the palette at a
; brightness level
;-----------------------------------------------------------------------------
BuildShadeLut:
        push ebx
        push ecx
        push esi
        push edi
        enter 28h, 0
        mov edi, eax
        mov dword [byte ebp-014h], edx
        mov dword [byte ebp-04h], 0
        mov dword [byte ebp-010h], 0
        mov ebx, dword [dword_1798F8]
        jmp near .5
.1:
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_178EAC]
        mov ecx, dword [byte ebp-014h]
        lea eax, [eax+eax*2]
        add ecx, eax
        movzx eax, byte [ecx]
        mov esi, dword [byte ebp-014h]
        mov dword [byte ebp-028h], eax
        movzx eax, byte [byte ecx+01h]
        shl dword [byte ebp-028h], 2
        mov dword [byte ebp-0Ch], eax
        movzx eax, byte [byte ecx+02h]
        shl dword [byte ebp-0Ch], 2
        mov dword [byte ebp-08h], eax
        xor ecx, ecx
        shl dword [byte ebp-08h], 2
.2:
        cmp byte [dword ecx+byte_1796AC], 0
        je near .3
        movzx eax, byte [esi]
        mov edx, dword [byte ebp-028h]
        mov dword [byte ebp-01Ch], eax
        movzx eax, byte [byte esi+01h]
        shl dword [byte ebp-01Ch], 2
        mov dword [byte ebp-020h], eax
        movzx eax, byte [byte esi+02h]
        sub edx, dword [byte ebp-01Ch]
        mov dword [byte ebp-024h], eax
        mov eax, edi
        shl dword [byte ebp-020h], 2
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-0Ch]
        add dword [byte ebp-01Ch], eax
        sub edx, dword [byte ebp-020h]
        mov eax, edi
        shl dword [byte ebp-024h], 2
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-08h]
        add dword [byte ebp-020h], eax
        sub edx, dword [byte ebp-024h]
        mov eax, edi
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [byte ebp-024h], eax
        mov eax, dword [byte ebp-01Ch]
        sar eax, 3
        shl eax, 0Ah
        mov dword [byte ebp-018h], eax
        mov eax, dword [byte ebp-020h]
        sar eax, 3
        mov edx, dword [byte ebp-018h]
        shl eax, 5
        or edx, eax
        mov eax, dword [byte ebp-024h]
        sar eax, 3
        or eax, edx
        mov edx, dword [dword_1219A4]
        add eax, edx
        mov al, byte [eax]
        mov byte [ebx], al
        jmp short .4
.3:
        mov byte [ebx], cl
.4:
        add esi, byte 3
        inc ecx
        inc ebx
        cmp ecx, 100h
        jl near .2
        add dword [byte ebp-010h], byte 4
        inc dword [byte ebp-04h]
.5:
        mov eax, dword [dword_1798F4]
        dec eax
        cmp eax, dword [byte ebp-04h]
        jg near .1
        xor ecx, ecx
.6:
        mov byte [ebx], cl
        inc ecx
        inc ebx
        cmp ecx, 100h
        jl short .6
        jmp near DrawOverlayCaption_E1
;-----------------------------------------------------------------------------
; AllocShadeLut                                588F7  96 PC, medium confidence
; Allocates the LUT block (dword_1798F4 x 100h bytes)
;-----------------------------------------------------------------------------
AllocShadeLut:
        push ebx
        push ecx
        push edx
        push eax
        mov eax, dword [dword_1798F4]
        shl eax, 8
        push eax
        push asc_111008
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [dword_1798F8], eax
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push esi
        mov ebx, eax
        lea ecx, [dword eax+0400h]
.1:
        movzx ebx, byte [edx]
        mov ebx, dword [nosplit ebx*4+dword_1792AC]
        mov esi, dword [dword_1798F8]
        shl ebx, 8
        add ebx, esi
        mov dword [eax], ebx
        add eax, byte 4
        inc edx
        cmp eax, ecx
        jne short .1
        pop esi
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push dword [dword_1798F8]
AllocShadeLut_5A:
        call FreeMemBlock
        add esp, byte 4
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        test eax, eax
        jl short .2
        mov edx, eax
        imul edx, eax
        imul eax, edx
        push eax
        call sub_BE960
        add esp, byte 4
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        mov edx, eax
        neg edx
        imul edx, eax
        imul eax, edx
        push eax
        call sub_BE960
        add esp, byte 4
        neg eax
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadIceLogo                                  58992  96 PC, medium confidence
; Loads the centre ice logo of the home team (data file 0Eh + team, "logo")
;-----------------------------------------------------------------------------
LoadIceLogo:
        push ebx
        push ecx
        push edx
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        cmp eax, byte 1Ah
        jl short .1
        mov eax, 14h
.1:
        mov edx, 20h
        add eax, byte 0Eh
        call LoadPackedFile
        push str_Logo
        push eax
        mov dword [dword_1798F0], eax
        call sub_E04E0
        add esp, byte 8
        call SetIceLogoTexture
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push dword [dword_1798F0]
        jmp near AllocShadeLut_5A
;-----------------------------------------------------------------------------
; FullViewClip                                                    589E4  96 PC
; SetClipWindow to the whole screen (0, 0, dword_11F5C0, dword_11F5C4)
;-----------------------------------------------------------------------------
FullViewClip:
        push ebx
        push ecx
        push edx
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DimGameView                                     58A03  96 PC, low confidence
; In a replay (gmode 1) lowers the view brightness (dword_1798EC) by 28Fh
; every other frame down to F5Ch and rebuilds the LUT
;-----------------------------------------------------------------------------
DimGameView:
        push edx
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        je short .1
        cmp dword [dword_1798EC], 0F5Ch
        jle short .1
        cmp dword [dword_11B270], byte 1
        jne short .2
        sub dword [dword_1798EC], 28Fh
        mov edx, unk_16443C
        mov eax, dword [dword_1798EC]
        call BuildShadeLut
        mov dword [dword_11B270], 0
        pop edx
        ret
.1:
        mov dword [dword_11B270], 1
.2:
        pop edx
        ret
;-----------------------------------------------------------------------------
; InitGameView                                                    58A58  96 PC
; Before a game (PlayGame_initslotscall, RunDemoGame): sets up the 3D rink
; view: palette, shading LUT, ice logo, priority / b000 / b001 art, the
; overlays (ResetGameOverlays)
;-----------------------------------------------------------------------------
InitGameView:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 100h, 0
        call LoadGameSprites
        call sub_B0CA8
        push unk_16443C
        call sub_B0F7C
        mov edx, unk_16443C
        add esp, byte 4
        mov dword [dword_1219A4], eax
        mov eax, 64h
        call BuildShadeMatch
        mov byte [byte_17972D], 1
        mov byte [byte_179759], 1
        mov byte [byte_17975A], 1
        mov byte [byte_179763], 1
        mov byte [byte_179764], 1
        mov byte [byte_1796DC], 1
        mov byte [byte_179733], 1
        mov byte [byte_179723], 1
        mov byte [byte_17971B], 1
        mov byte [byte_17971C], 1
        mov byte [byte_179712], 1
        mov byte [byte_179715], 1
        mov byte [byte_179722], 1
        mov byte [byte_1796BF], 1
        mov byte [byte_1796C0], 1
        mov byte [byte_179713], 1
        mov byte [byte_179701], 1
        mov byte [byte_17970B], 1
        mov byte [byte_17974B], 1
        mov byte [byte_17970D], 1
        mov byte [byte_17970A], 1
        mov byte [byte_179700], 1
        mov byte [byte_179743], 1
        call sub_BD86C
        test byte [byte_17CA5D], 20h
        setne al
        movzx eax, al
        mov dword [dword_11B248], eax
        mov eax, 20h
        mov edx, unk_16443C
        call AllocShadeLut
        mov eax, 4000h
        mov dword [dword_1798EC], 4000h
        call BuildShadeLut
        xor eax, eax
.1:
        mov byte [dword eax+ebp-0100h], al
        inc eax
        cmp eax, 100h
        jl short .1
        mov eax, unk_1786AC
        lea edx, [dword ebp-0100h]
        lea esi, [dword eax+0400h]
.2:
        movzx ebx, byte [edx]
        mov ebx, dword [nosplit ebx*4+dword_1792AC]
        mov ecx, dword [dword_1798F8]
        shl ebx, 8
        add ebx, ecx
        mov dword [eax], ebx
        add eax, byte 4
        inc edx
        cmp eax, esi
        jne short .2
        mov eax, unk_178AAC
        mov edx, unk_17B830
        lea esi, [dword eax+0400h]
.3:
        movzx ebx, byte [edx]
        mov ebx, dword [nosplit ebx*4+dword_1792AC]
        mov ecx, dword [dword_1798F8]
        shl ebx, 8
        add ebx, ecx
        mov dword [eax], ebx
        add eax, byte 4
        inc edx
        cmp eax, esi
        jne short .3
        mov eax, unk_1782AC
        mov edx, unk_17B930
        lea esi, [dword eax+0400h]
.4:
        movzx ebx, byte [edx]
        mov ebx, dword [nosplit ebx*4+dword_1792AC]
        mov ecx, dword [dword_1798F8]
        shl ebx, 8
        add ebx, ecx
        mov dword [eax], ebx
        add eax, byte 4
        inc edx
        cmp eax, esi
        jne short .4
        mov eax, unk_178AAC
        xor edx, edx
        call SaveTeamPalette
        mov edx, 1
        mov eax, unk_1782AC
        call SaveTeamPalette
        test byte [byte_17CA5D], 20h
        je short .5
        push byte 20h
        push dword 1E0h
        push dword 280h
        jmp short .6
.5:
        push byte 20h
        push dword 0C8h
        push dword 140h
.6:
        call sub_AD35C
        add esp, byte 0Ch
        mov dword [dword_11B234], eax
        call SetScreenTarget
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        push byte 0
        call sub_E0584
        add esp, byte 4
        push byte 50h
        call sub_E162A
        add esp, byte 4
        push byte 50h
        call SetScreenScale
        mov eax, dword [dword_17CA5C]
        shl eax, 0Eh
        add esp, byte 4
        shr eax, 1Ch
        mov dword [dword_11B374], 0
        mov dword [dword_11B330], eax
        call SetGameViewSize
        mov eax, dword [dword_17CA5C]
        shl eax, 13h
        shr eax, 1Ch
        shl eax, 4
        mov edi, dword_179DCE
        mov eax, dword [dword eax+dword_11B9F4]
        mov esi, dword_179E13
        call SetCameraShot
        mov dword [dword_179E13], 0
        mov dword [dword_179E17], 0BB8h
        mov dword [dword_179E1B], 0FFFFF060h
        mov dword [dword_179E0B], 0
        mov dword [dword_179E0F], 0FFFFE38Fh
        mov dword [dword_11BB14], 0
        mov dword [dword_11BB18], 0
        push dword [dword_11B32C]
        mov dword [dword_11BB1C], 0
        push dword [dword_11B328]
        movsd
        movsd
        movsd
        call SetViewScreenOrigin
        add esp, byte 8
        mov edx, unk_122320
        mov eax, dword_179E13
        call SetViewCamera
        mov eax, unk_16443C
        mov ecx, unk_16443C
        call LoadRinkModel
        mov eax, 0FFFFFFFFh
        mov ebx, 28h
        call LoadStandsArt
        push byte 20h
        mov edx, ebx
        mov eax, ebx
        call BuildAntiAliasTable
        push byte 20h
        mov ecx, unk_16443C
        mov ebx, 50h
        mov dword [dword_1798E8], eax
        mov edx, ebx
        mov eax, ebx
        call BuildAntiAliasTable
        mov dword [dword_1798E4], eax
        mov eax, dword [dword_17CA5C]
        shl eax, 1Bh
        shr eax, 1Fh
        mov byte [byte_1175A4], al
        mov eax, dword [dword_17CA5C]
        shl eax, 1Ch
        shr eax, 1Fh
        mov byte [byte_1175A5], al
        mov eax, dword [dword_17CA5C]
        and eax, byte 1
        mov byte [byte_1175A9], al
        mov eax, dword [dword_17CA5C]
        shl eax, 1Dh
        shr eax, 1Fh
        mov byte [byte_1175A8], al
        mov eax, dword [dword_17CA5C]
        shl eax, 1Eh
        shr eax, 1Fh
        mov byte [byte_1175A6], al
        mov eax, dword [dword_17CA5C]
        shl eax, 1Ah
        shr eax, 1Fh
        mov byte [byte_1175A7], al
        mov eax, dword [dword_17CA5C]
        shl eax, 17h
        shr eax, 1Fh
        mov byte [byte_1175AB], al
        mov eax, dword [dword_17CA5C]
        shl eax, 19h
        mov byte [byte_1175AA], 0
        shr eax, 1Fh
        push byte 20h
        mov dword [dword_179978], eax
        mov eax, dword [dword_17CA5C]
        push byte 11h
        shl eax, 18h
        push str_Priority
        shr eax, 1Fh
        mov byte [byte_1175AC], 0
        mov dword [dword_17997C], eax
        call AllocMemBlock
        mov dword [dword_11B364], eax
        mov dword [eax], 0
        mov eax, dword [dword_11B364]
        mov dl, byte [byte_179E06]
        mov byte [byte eax+0Ch], dl
        mov eax, dword [dword_11B364]
        mov dword [byte eax+04h], 10h
        mov eax, dword [dword_11B364]
        mov dword [byte eax+08h], 63h
        mov eax, dword [dword_11B364]
        mov dword [byte eax+0Dh], 0
        add esp, byte 0Ch
        cmp word [word_11B274], byte 0
        jl short .7
        movsx edx, word [word_11B276]
        movsx eax, word [word_11B274]
        call CloseTextOverlay
        mov word [word_11B276], 0FFFFh
        mov word [word_11B274], 0FFFFh
.7:
        call ResetCameraShake
        push dword [dword_11F5C4]
        mov dword [dword_11B310], 0FFFFFFFFh
        push dword [dword_11F5C0]
        mov byte [byte_165694], 0
        push byte 0
        mov byte [byte_165658], 0
        mov byte [byte_1655E0], 0
        push byte 0
        mov byte [byte_1655A4], 0
        mov byte [byte_16561C], 0
        call SetViewRect
        add esp, byte 10h
        push dword [dword_11B324]
        push dword [dword_11B320]
        call MouseRead
        add esp, byte 8
        call ResetGameOverlays
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        and edx, 1F000h
        cmp edx, 1A000h
        jae short .8
        mov edx, dword [byte eax+01h]
        and edx, 3E0000h
        cmp edx, 340000h
        jae short .8
        mov ebx, dword_17828C
        mov edx, dword [optflags]
        mov eax, dword [byte eax+01h]
        shl edx, 19h
        shl eax, 0Fh
        shr edx, 1Dh
        shr eax, 1Bh
        call GetSpecialTeamsRanks
        mov eax, dword [gameopts]
        mov ebx, dword_17829C
        mov edx, dword [optflags]
        mov eax, dword [byte eax+01h]
        shl edx, 19h
        shl eax, 0Ah
        shr edx, 1Dh
        shr eax, 1Bh
        call GetSpecialTeamsRanks
        jmp short .9
.8:
        mov dword [dword_1782A8], 0FFFFFFFFh
        mov dword [dword_1782A4], 0FFFFFFFFh
        mov dword [dword_1782A0], 0FFFFFFFFh
        mov dword [dword_17829C], 0FFFFFFFFh
        mov dword [dword_178290], 0FFFFFFFFh
        mov dword [dword_178294], 0FFFFFFFFh
        mov dword [dword_17828C], 0FFFFFFFFh
        mov dword [dword_178290], 0FFFFFFFFh
.9:
        mov edx, 20h
        mov eax, 107h
        call LoadPackedFile
        mov dword [dword_179904], eax
        test byte [byte_17CA5D], 20h
        je short .10
        mov edx, 20h
        mov eax, 28h
        call LoadPackedFile
        mov edx, 20h
        mov dword [dword_179918], eax
        mov eax, 29h
        mov dword [dword_1798FC], 0Fh
        call LoadPackedFile
        mov edx, 20h
        mov dword [dword_179920], eax
        mov eax, 2Eh
        mov dword [dword_17992C], 1Ah
        call LoadPackedFile
        mov edx, 20h
        mov dword [dword_179924], eax
        mov eax, 2Ah
        mov dword [dword_179930], 2Dh
        call LoadPackedFile
        push str_B001
        mov dword [dword_179900], 1Dh
        jmp short .11
.10:
        mov edx, 20h
        mov eax, 63h
        call LoadPackedFile
        mov edx, 20h
        mov dword [dword_179918], eax
        mov eax, 2Bh
        mov dword [dword_1798FC], 8
        call LoadPackedFile
        mov edx, 20h
        mov dword [dword_179920], eax
        mov eax, 2Fh
        mov dword [dword_17992C], 0Dh
        call LoadPackedFile
        mov edx, 20h
        mov dword [dword_179924], eax
        mov eax, 2Ch
        mov dword [dword_179930], 16h
        call LoadPackedFile
        push str_B000
        mov dword [dword_179900], 0Dh
.11:
        push dword [dword_179904]
        mov dword [dword_179914], eax
        call sub_E04E0
        add esp, byte 8
        mov dword [dword_179908], eax
        call LoadIceLogo
        push unk_17D3E8
        push unk_16443C
        push dword 0A666h
        call sub_AD620
        add esp, byte 0Ch
        test byte [byte_17CA5D], 20h
        je short .12
        mov edx, 20h
        mov eax, 62h
        jmp short .13
.12:
        mov edx, 20h
        mov eax, 61h
.13:
        call LoadPackedFile
        mov dword [dword_17D528], eax
        mov dword [dword_1797B8], 0
        mov dword [dword_1797B4], 0
        mov dword [dword_1797B0], 0FFFFFFFFh
        mov eax, 14h
        mov dword [dword_1797AC], 0FFFFFFFFh
        call sub_53BD7
InitGameView_709:
        leave
InitGameView_70A:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push esi
        mov eax, dword [dword_11B364]
.14:
        push eax
        mov esi, dword [byte eax+0Dh]
        call FreeMemBlock
        add esp, byte 4
        mov eax, esi
        test esi, esi
        jne short .14
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FreeGameView                                                    59188  96 PC
; After a game: frees what InitGameView allocated (fonts, logo, art, LUT,
; models)
;-----------------------------------------------------------------------------
FreeGameView:
        push ebx
        push ecx
        push edx
        push esi
        push dword [dword_1798F0]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_179904]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_179914]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_179924]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_179920]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_179918]
        call FreeMemBlock
        mov eax, dword [dword_11B364]
        add esp, byte 4
.1:
        push eax
        mov esi, dword [byte eax+0Dh]
        call FreeMemBlock
        add esp, byte 4
        mov eax, esi
        test esi, esi
        jne short .1
        call FreeStandsArt
        call FreeRinkModel
        call sub_B0CA8
        push dword [dword_1798E8]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_1798E4]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_11B234]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_1798F8]
        call FreeMemBlock
        add esp, byte 4
        call sub_53C6F
        push dword [dword_17D528]
        call FreeMemBlock
        add esp, byte 4
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawRosterName                               59256  96 PC, medium confidence
; (x, y, team, player): draws a player's name from hmroster (record +17h) in
; the small font
;-----------------------------------------------------------------------------
DrawRosterName:
        push esi
        push edi
        enter 4, 0
        push eax
        mov esi, edx
        mov dword [byte ebp-04h], ebx
        mov edi, ecx
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        push dword 0FFh
        push byte 4
        add esi, byte 0Bh
        call sub_AFFD0
        movsx eax, word [byte ebp-04h]
        movsx ebx, si
        mov esi, 6
        cdq
        idiv esi
        imul eax, dword 4B4h
        mov esi, hmroster
        add esi, eax
        movsx eax, di
        imul eax, byte 2Bh
        movsx ecx, word [byte ebp-08h]
        add esp, byte 8
        add eax, esi
        mov edx, ecx
        add eax, byte 17h
        call DrawTextCentred
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawRosterNumber                                592BA  96 PC, low confidence
; (x, y, team, player, pos): draws "%d %s", the player's number with a
; position text
;-----------------------------------------------------------------------------
DrawRosterNumber:
        push esi
        push edi
        enter 10h, 0
        push eax
        mov esi, edx
        mov edi, ebx
        mov dword [byte ebp-04h], ecx
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        push dword 0FFh
        push byte 4
        add esi, byte 0Ch
        call sub_AFFD0
        add esp, byte 8
        cmp word [byte ebp+010h], byte 0
        jge short .1
        mov eax, unk_111024
        jmp short .2
.1:
        movsx eax, word [byte ebp+010h]
        mov eax, dword [nosplit eax*4+off_11B278]
.2:
        push eax
        movsx eax, di
        mov ebx, 6
        cdq
        idiv ebx
        imul edx, eax, dword 4B4h
        movsx eax, word [byte ebp-04h]
        imul eax, byte 2Bh
        movzx eax, byte [dword edx+eax+byte_157191]
        push eax
        push str_DS
        lea eax, [byte ebp-010h]
        push eax
        movsx ebx, si
        call sprintf_
        add esp, byte 10h
        movsx edx, word [byte ebp-014h]
        lea eax, [byte ebp-010h]
        call DrawTextCentred
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; DrawRinkSprite                                  59349  96 PC, low confidence
; Draws a sprite at a rink position, scaled by its distance (from the rink
; model and the player draw)
;-----------------------------------------------------------------------------
DrawRinkSprite:
        push esi
        push edi
        enter 8, 0
        push eax
        push edx
        push ebx
        mov eax, dword [byte ebp+014h]
        mov ebx, 0FFFFFFFFh
        test ecx, ecx
        je near DrawScaledSprite_1E2
        jge short .1
        neg ecx
.1:
        mov esi, ecx
        cmp eax, byte 11h
        jl short .2
        lea edi, [byte eax-011h]
        jmp short .5
.2:
        cmp eax, byte 0Fh
        jl short .3
        mov edi, 2
        jmp short .5
.3:
        mov dl, byte [gmode]
        and dl, 80h
        movsx edx, dl
        test edx, edx
        je short .4
        imul eax, dword 0A0h
        mov al, byte [dword eax+byte_1647E0]
        and al, 40h
        movzx eax, al
        test eax, eax
        setne al
        movzx edi, al
        jmp short .5
.4:
        cmp eax, byte 5
        setg dl
        imul ebx, eax, dword 0A0h
        movzx edi, dl
        movzx ebx, byte [dword ebx+byte_1647FA]
.5:
        test byte [byte_17CA5D], 20h
        je short .6
        add esi, esi
        jmp short .7
.6:
        imul eax, esi, byte 0Eh
        cdq
        shl edx, 3
        LD sbb, eax, edx
        sar eax, 3
        mov esi, eax
.7:
        mov edx, dword [byte ebp+010h]
        mov eax, dword [byte ebp-0Ch]
        call GetSpriteFrame
        mov dword [byte ebp-04h], eax
        cmp dword [dword_11B248], byte 0
        jne near .14
        cmp esi, 10000h
        jge near .14
        cmp edi, byte 2
        jne short .8
        mov eax, dword [dword_17BA54]
        jmp short .12
.8:
        imul eax, edi, dword 120h
        mov edx, unk_17B248
        add edx, eax
        mov ecx, dword [byte ebp+010h]
        mov dword [byte ebp-08h], edx
        imul edx, ecx, dword 90h
        add edx, dword [byte ebp-08h]
        test edi, edi
        je short .9
        mov eax, dword [dword_17BA4C]
        jmp short .10
.9:
        mov eax, dword [dword_17BA50]
.10:
        call SetPlayerSpriteColors
        test edi, edi
        je short .11
        mov eax, dword [dword_17BA4C]
        jmp short .12
.11:
        mov eax, dword [dword_17BA50]
.12:
        call sub_B58D8
        cmp dword [byte ebp+018h], byte 0
        je short .13
        mov ecx, dword [byte ebp-014h]
        mov ebx, dword [byte ebp-010h]
        mov edx, dword [byte ebp-04h]
        mov eax, esi
        call sub_B6148
        jmp near DrawScaledSprite_1E2
.13:
        mov ecx, dword [byte ebp-014h]
        mov ebx, dword [byte ebp-010h]
        mov edx, dword [byte ebp-04h]
        mov eax, esi
        call sub_B6140
        jmp near DrawScaledSprite_1E2
.14:
        cmp dword [byte ebp+018h], byte 0
        je short .15
        sar dword [byte ebp-010h], 10h
        sar dword [byte ebp-014h], 10h
.15:
        cmp edi, byte 2
        jne short .16
        push dword [byte ebp-014h]
        push dword [byte ebp-010h]
        push dword [byte ebp-04h]
        push esi
        call sub_BB924
        jmp short .21
.16:
        mov ecx, dword [byte ebp+010h]
        mov edx, edi
        test edi, edi
        je short .17
        mov eax, unk_17B930
        jmp short .18
.17:
        mov eax, unk_17B830
.18:
        call SetRinkSpriteColors
        test edi, edi
        je short .19
        mov eax, unk_17B930
        jmp short .20
.19:
        mov eax, unk_17B830
.20:
        push eax
        call sub_DD908
        add esp, byte 4
        push dword [byte ebp-014h]
        push dword [byte ebp-010h]
        push dword [byte ebp-04h]
        push esi
        call sub_BEF44
.21:
        add esp, byte 10h
        jmp near DrawScaledSprite_1E2
;-----------------------------------------------------------------------------
; DrawPlayerSprite                                594F1  96 PC, low confidence
; Draws one player sprite (team art from gmode / player flags) through
; DrawScaledSprite
;-----------------------------------------------------------------------------
DrawPlayerSprite:
        push esi
        push edi
        enter 0Ch, 0
        push eax
        mov edi, edx
        mov dword [byte ebp-08h], ebx
        mov edx, dword [byte ebp+014h]
        mov ebx, 0FFFFFFFFh
        test ecx, ecx
        je near DrawScaledSprite_1E2
        jge short .1
        neg ecx
.1:
        mov esi, ecx
        cmp edx, byte 0Fh
        jl short .2
        mov dword [byte ebp-04h], unk_1786AC
        jmp near .7
.2:
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        test eax, eax
        je short .3
        imul eax, edx, dword 0A0h
        mov al, byte [dword eax+byte_1647E0]
        and al, 40h
        movzx eax, al
        test eax, eax
        setne al
        movzx ecx, al
        jmp short .4
.3:
        cmp edx, byte 5
        setg al
        movzx ecx, al
        imul eax, edx, dword 0A0h
        movzx ebx, byte [dword eax+byte_1647FA]
.4:
        test ecx, ecx
        je short .5
        mov eax, unk_1782AC
        jmp short .6
.5:
        mov eax, unk_178AAC
.6:
        imul ecx, dword 120h
        mov edx, unk_17B518
        add edx, ecx
        mov dword [byte ebp-0Ch], edx
        imul edx, dword [byte ebp+010h], dword 90h
        mov ecx, dword [byte ebp+010h]
        add edx, dword [byte ebp-0Ch]
        mov dword [byte ebp-04h], eax
        call SetPlayerSpriteColors
.7:
        test byte [byte_17CA5D], 20h
        je short .8
        add esi, esi
        jmp short .9
.8:
        imul eax, esi, byte 0Eh
        cdq
        shl edx, 3
        LD sbb, eax, edx
        sar eax, 3
        mov esi, eax
.9:
        mov edx, dword [byte ebp+010h]
        mov eax, dword [byte ebp-010h]
        sar dword [byte ebp-08h], 10h
        call GetSpriteFrame
        push dword [byte ebp+018h]
        mov ebx, edi
        push esi
        mov ecx, dword [byte ebp-08h]
        mov edx, dword [byte ebp-04h]
        push esi
        sar ebx, 10h
        call DrawScaledSprite
        jmp near DrawScaledSprite_1E2
;-----------------------------------------------------------------------------
; DrawSpriteShadow                                595DC  96 PC, low confidence
; Draws a sprite's shadow on the ice (sub_299CF)
;-----------------------------------------------------------------------------
DrawSpriteShadow:
        push esi
        push edi
        push ebp
        mov ebp, esp
        mov edi, edx
        test ecx, ecx
        je short .2
        jge short .1
        neg ecx
.1:
        mov edx, dword [byte ebp+010h]
        lea esi, [ecx+ecx]
        call GetSpriteFrame
        mov ecx, ebx
        mov edx, eax
        sar ecx, 10h
        mov ebx, edi
        mov eax, esi
        sar ebx, 10h
        call sub_299CF
.2:
        pop ebp
        pop edi
        pop esi
        ret 4
jpt_5960F:
        dd DrawControlMarker_26
        dd DrawControlMarker_2F
        dd DrawControlMarker_38
        dd DrawControlMarker_41
;-----------------------------------------------------------------------------
; DrawControlMarker                            5961F  96 PC, medium confidence
; (controller): draws the marker under the player a controller
; (byte_1770A2-1770A5) controls, or the puck carrier
;-----------------------------------------------------------------------------
DrawControlMarker:
        push ebx
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        push eax
        mov dword [byte ebp-04h], 0
        cmp dword [dword_11A3F8], byte 0
        je short DrawControlMarker_41.2
        cmp eax, byte 3
        ja short DrawControlMarker_41.1
        jmp dword [nosplit cs:eax*4+jpt_5960F]
DrawControlMarker_26:
        movsx esi, byte [byte_1770A2]
        jmp short DrawControlMarker_41.1
DrawControlMarker_2F:
        movsx esi, byte [byte_1770A3]
        jmp short DrawControlMarker_41.1
DrawControlMarker_38:
        movsx esi, byte [byte_1770A4]
        jmp short DrawControlMarker_41.1
DrawControlMarker_41:
        movsx esi, byte [byte_1770A5]
.1:
        test esi, esi
        jl near DrawOverlayCaption_E1
        cmp byte [dword esi+byte_176F96], 0
        jmp short .3
.2:
        movsx esi, word [nosplit eax*2+HomeControlSlot]
        test esi, esi
        jl near DrawOverlayCaption_E1
        imul eax, esi, dword 0A0h
        cmp dword [dword eax+dword_164838], byte 0
.3:
        jne near DrawOverlayCaption_E1
        imul eax, esi, byte 0Ch
        cmp dword [dword eax+dword_179AC8], byte 50h
        jg short .4
        push byte 2
        call sub_E0486
        mov edx, dword [byte ebp-010h]
        shl edx, 4
        movsx eax, word [dword edx+eax*2+word_119127]
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [dword_11B32C]
        mov dword [byte ebp-04h], 2
        add eax, dword [dword_11B31C]
        mov edi, dword [dword_11B320]
        dec eax
        add esp, byte 4
        mov dword [byte ebp-08h], eax
        jmp near .16
.4:
        test edx, edx
        jl short .5
        cmp esi, edx
        jne short .5
        mov eax, dword [byte ebp-010h]
        movsx eax, word [nosplit eax*2+word_11911F]
        jmp short .6
.5:
        mov eax, dword [byte ebp-010h]
        movsx eax, word [nosplit eax*2+word_119117]
.6:
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [nosplit esi*8+dword_179800]
        mov edi, dword [nosplit esi*8+dword_1797FC]
        sar eax, 10h
        sar edi, 10h
        mov dword [byte ebp-08h], eax
        cmp eax, dword [dword_11B32C]
        jge short .7
        mov eax, dword [dword_11B32C]
        mov dword [byte ebp-04h], 1
        jmp short .8
.7:
        mov eax, dword [dword_11B32C]
        add eax, dword [dword_11B31C]
        cmp eax, dword [byte ebp-08h]
        jg short .9
        dec eax
        mov dword [byte ebp-04h], 2
.8:
        mov dword [byte ebp-08h], eax
.9:
        mov eax, dword [dword_11B328]
        add eax, dword [dword_11B318]
        cmp dword [byte ebp-04h], byte 0
        je short .11
        cmp edi, eax
        jl short .10
        or byte [byte ebp-04h], 4
        lea edi, [byte eax-0Dh]
        jmp short .13
.10:
        cmp edi, dword [dword_11B328]
        jge short .13
        mov edi, dword [dword_11B328]
        or byte [byte ebp-04h], 8
        add edi, byte 0Ch
        jmp short .13
.11:
        cmp edi, eax
        jl short .12
        mov dword [byte ebp-04h], 4
        lea edi, [byte eax-01h]
        jmp short .13
.12:
        cmp edi, dword [dword_11B328]
        jge short .13
        mov dword [byte ebp-04h], 8
        mov edi, dword [dword_11B328]
.13:
        cmp dword [byte ebp-04h], byte 0
        je near .16
        push dword [byte ebp-04h]
        call sub_E0486
        mov edx, dword [byte ebp-010h]
        shl edx, 4
        movsx eax, word [dword edx+eax*2+word_119127]
        add esp, byte 4
        mov dword [byte ebp-0Ch], eax
        test byte [byte ebp-04h], 8
        je short .16
        push dword [nosplit eax*4+dword_152FEC]
        mov esi, eax
        call sub_BEFF0
        add esp, byte 4
        push dword [byte ebp-08h]
        push edi
        push dword [nosplit esi*4+dword_152FEC]
        test byte [byte_17CA5D], 20h
        je short .14
        mov eax, 20000h
        jmp short .15
.14:
        mov eax, 10000h
.15:
        push eax
        call sub_BB924
        mov eax, dword [byte ebp-0Ch]
        add esp, byte 10h
        push dword [nosplit eax*4+dword_152FEC]
        call sub_BEFF0
        add esp, byte 4
        jmp near DrawOverlayCaption_E1
.16:
        cmp dword [byte ebp-04h], byte 0
        je short .19
        push dword [byte ebp-08h]
        mov eax, dword [byte ebp-0Ch]
        push edi
        push dword [nosplit eax*4+dword_152FEC]
        test byte [byte_17CA5D], 20h
        je short .17
        mov eax, 20000h
        jmp short .18
.17:
        mov eax, 10000h
.18:
        push eax
        jmp near .23
.19:
        imul esi, byte 0Ch
        push dword [dword esi+dword_179AC8]
        call SpriteScale
        add esp, byte 4
        mov edx, 33333h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov esi, eax
        test byte [byte_17CA5D], 20h
        je short .20
        cmp eax, 30000h
        jle short .21
        mov esi, 30000h
        jmp short .21
.20:
        cmp eax, 18000h
        jle short .21
        mov esi, 18000h
.21:
        mov eax, dword [byte ebp-0Ch]
        shl eax, 2
        cmp esi, 10000h
        jge short .22
        mov ecx, dword [byte ebp-08h]
        mov ebx, edi
        mov edx, dword [dword eax+dword_152FEC]
        mov eax, esi
        call sub_B6140
        jmp near DrawOverlayCaption_E1
.22:
        push dword [byte ebp-08h]
        push edi
        push dword [dword eax+dword_152FEC]
        push esi
.23:
        call sub_BB924
        add esp, byte 10h
        jmp near DrawOverlayCaption_E1
;-----------------------------------------------------------------------------
; DrawPuckSprite                                  598DA  96 PC, low confidence
; Draws the puck (or its shadow) by its height (puckz)
;-----------------------------------------------------------------------------
DrawPuckSprite:
        push ebx
        push ecx
        push edx
        mov edx, eax
        cmp dword [dword_11A3F8], byte 0
        je short .1
        cmp byte [byte_1770D7], 0
        jmp short .2
.1:
        call sub_4B4F3
        test eax, eax
.2:
        jge short .5
        test edx, edx
        je short .4
        mov eax, dword [puckz]
        cmp word [eax], byte 0
        jg short .3
        cmp dword [dword_11A3F8], byte 0
        je short .5
        cmp word [word_17709C], byte 0
        jle short .5
.3:
        push unk_17D3E8
        call SetRemapTable
        add esp, byte 4
        call DrawPuckShadowModel
        pop edx
        pop ecx
        pop ebx
        ret
.4:
        call DrawPuckModel
.5:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SpinPuckModel                                   5993B  96 PC, low confidence
; Turns the puck model (dword_11B294) while the puck moves
;-----------------------------------------------------------------------------
SpinPuckModel:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 48h, 0
        cmp word [word_1650A6], byte 0
        je near .2
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jge near InitGameView_709
        mov eax, dword [puckz]
        cmp word [eax], byte 0
        jl near InitGameView_709
        mov eax, dword [PtrPuckFlags]
        movsx eax, word [byte eax+03Ch]
        shl eax, 0Ch
        add dword [dword_11B294], eax
        cmp dword [dword_11B294], 8000h
        jl short .1
        sub dword [dword_11B294], 10000h
.1:
        mov eax, dword [dword_11B294]
        neg eax
        add eax, eax
        push eax
        lea eax, [byte ebp-024h]
        push eax
        call sub_BC610
        mov eax, dword [dword_11B294]
        add esp, byte 8
        neg eax
        push eax
        lea eax, [byte ebp-048h]
        push eax
        call sub_BC6D8
        add esp, byte 8
        push unk_1798C0
        lea eax, [byte ebp-024h]
        push eax
        lea eax, [byte ebp-048h]
        push eax
        call MultiplyMatrix
        add esp, byte 0Ch
        push unk_1798C0
        push dword [dword_15E8E0]
        jmp short .3
.2:
        cmp dword [dword_11B294], byte 0
        je near InitGameView_709
        mov dword [dword_11B294], 0
        mov ecx, 9
        push unk_1798C0
        mov edi, unk_1798C0
        mov esi, unk_122320
        push dword [dword_15E8E0]
        rep movsd
.3:
        call sub_BC3A0
        add esp, byte 8
        push unk_1798C0
        push dword [dword_15E8D8]
        call sub_BC3A0
        add esp, byte 8
        jmp near InitGameView_709
;-----------------------------------------------------------------------------
; PlaceGoalNets                                59A36  96 PC, medium confidence
; From puckfaceoff2: sets the goal0 / goal1 objects of the rink model to
; their places
;-----------------------------------------------------------------------------
PlaceGoalNets:
        push ebx
        push ecx
        push edx
        push str_Goal0
        push dword [dword_15E8E4]
        call sub_BC760
        imul edx, eax, byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        add esp, byte 8
        add eax, edx
        push eax
        push dword [dword_15E8F8]
        call sub_BC3F4
        add esp, byte 8
        push str_Goal1
        push dword [dword_15E8E4]
        call sub_BC760
        imul edx, eax, byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        add esp, byte 8
        add eax, edx
        push eax
        push dword [dword_15E8FC]
        call sub_BC3F4
        add esp, byte 8
        pop edx
        pop ecx
        pop ebx
        ret
PlaceGoalNets_65:
        cmp eax, 18000h
        jle short PlaceGoalNets_71
        mov eax, 18000h
PlaceGoalNets_71:
        cmp eax, 10000h
        jge short .1
        mov edx, dword [puckc]
        movsx edx, byte [edx]
        mov ecx, dword [nosplit edx*8+dword_179800]
        mov ebx, dword [nosplit edx*8+dword_1797FC]
        movsx edx, word [word_119127]
        sar ecx, 10h
        sar ebx, 10h
        mov edx, dword [nosplit edx*4+dword_152FEC]
        call sub_B6140
        jmp short PlaceGoalNets_E0
.1:
        mov edx, dword [puckc]
        movsx edx, byte [edx]
        mov ebx, dword [nosplit edx*8+dword_179800]
        sar ebx, 10h
        mov edx, dword [nosplit edx*8+dword_1797FC]
        push ebx
        sar edx, 10h
        push edx
        movsx edx, word [word_119127]
        push dword [nosplit edx*4+dword_152FEC]
        push eax
        call sub_BB924
        add esp, byte 10h
PlaceGoalNets_E0:
        mov dword [byte ebp-01Ch], 0
        mov edi, SortCords
        xor esi, esi
.2:
        movsx edx, word [byte edi+012h]
        mov eax, edi
        cmp edx, byte 0FFFFFFFFh
        je near .9
        mov edx, dword [puckc]
        movsx dx, byte [edx]
        cmp dx, word [dword edi+086h]
        je short .3
        mov dl, byte [byte edi+045h]
        and dl, 1
        movzx edx, dl
        test edx, edx
        jne short .3
        cmp dword [byte edi+07Ah], byte 0
        jl short .6
.3:
        cmp dword [dword_179978], byte 0
        je short .5
        movsx ecx, byte [byte eax+047h]
        mov eax, dword [dword esi+dword_179800]
        sar eax, 10h
        movsx edx, ax
        mov eax, dword [dword esi+dword_1797FC]
        sar eax, 10h
        mov dword [byte ebp-018h], eax
        mov eax, dword [byte ebp-018h]
        movsx ebx, word [byte ebp-01Ch]
.4:
        cwde
        call DrawRosterName
        jmp near .9
.5:
        movsx edx, word [byte eax+01Ah]
        movsx ecx, byte [byte eax+047h]
        mov eax, dword [dword esi+dword_179800]
        sar eax, 10h
        push edx
        movsx edx, ax
        mov eax, dword [dword esi+dword_1797FC]
        sar eax, 10h
        mov dword [byte ebp-018h], eax
        mov eax, dword [byte ebp-018h]
        cwde
        movsx ebx, word [byte ebp-01Ch]
        jmp short .8
.6:
        cmp dword [dword_118E89], byte 0
        je short .9
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        test eax, eax
        jne short .9
        cmp dword [dword_179978], byte 0
        je short .7
        mov eax, dword [dword esi+dword_179800]
        sar eax, 10h
        movsx edx, ax
        mov eax, dword [dword esi+dword_1797FC]
        sar eax, 10h
        mov dword [byte ebp-018h], eax
        movsx ebx, word [byte ebp-01Ch]
        mov eax, dword [byte ebp-018h]
        movsx ecx, byte [byte edi+047h]
        jmp short .4
.7:
        mov eax, dword [dword esi+dword_179800]
        sar eax, 10h
        movsx edx, ax
        mov eax, dword [dword esi+dword_1797FC]
        sar eax, 10h
        push byte 0FFFFFFFFh
        mov dword [byte ebp-018h], eax
        movsx ebx, word [byte ebp-01Ch]
        mov eax, dword [byte ebp-018h]
        movsx ecx, byte [byte edi+047h]
        cwde
.8:
        call DrawRosterNumber
.9:
        inc dword [byte ebp-01Ch]
        add edi, 0A0h
        add esi, byte 8
        cmp dword [byte ebp-01Ch], byte 0Ch
        jl near .2
PlaceGoalNets_20B:
        cmp word [word_165144], byte 0
        je short .12
        mov dword [byte ebp-04h], 1
        mov edi, 11h
        xor esi, esi
.10:
        movsx eax, word [word_165144]
        test dword [byte ebp-04h], eax
        je short .11
        imul eax, edi, byte 0Ch
        cmp dword [dword eax+dword_179AC8], byte 50h
        jle short .11
        mov edx, dword [dword esi+dword_11B298]
        mov edx, dword [nosplit edx*4+dword_152FEC]
        push dword [dword eax+dword_179AC8]
        mov dword [byte ebp-024h], edx
        call SpriteScale
        add esp, byte 4
        push byte 1
        mov ecx, eax
        mov ebx, dword [nosplit edi*8+dword_179800]
        push byte 11h
        mov edx, dword [nosplit edi*8+dword_1797FC]
        mov eax, dword [byte ebp-024h]
        push byte 0
        sar ecx, 1
        call DrawRinkSprite
.11:
        shl dword [byte ebp-04h], 1
        add esi, byte 4
        inc edi
        cmp esi, byte 10h
        jne short .10
.12:
        mov dword [byte ebp-014h], 0
.13:
        mov eax, dword [byte ebp-014h]
        mov eax, dword [dword eax+dword_179A7C]
        mov dword [byte ebp-01Ch], eax
        imul eax, byte 0Ch
        cmp dword [dword eax+dword_179AC8], byte 50h
        jle near .27
        imul esi, dword [byte ebp-01Ch], dword 0A0h
        add esi, SortCords
        movsx eax, word [dword esi+086h]
        cmp eax, byte 0Ch
        je short .14
        cmp eax, byte 0Dh
        jne short .15
.14:
        movsx eax, word [dword esi+086h]
        sub eax, byte 0Ch
        call DrawGoalNet
        jmp near .27
.15:
        movsx edx, word [byte esi+012h]
        cmp edx, byte 0FFFFFFFFh
        je near .27
        cmp eax, byte 0Ch
        jge short .16
        cmp word [byte esi+01Ah], byte 0
        jl near .27
.16:
        movsx eax, word [dword esi+086h]
        cmp eax, byte 0Eh
        je short .17
        cmp eax, byte 0Fh
        jne short .18
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        test eax, eax
        jne short .18
.17:
        mov eax, dword [puckc]
        movsx eax, byte [eax]
        cmp eax, byte 10h
        je near .27
        mov eax, dword [puckz]
        cmp word [eax], byte 0
        jl near .27
        movsx eax, word [dword esi+086h]
        cmp eax, byte 0Fh
        sete al
        movzx eax, al
        call DrawPuckSprite
        jmp near .27
.18:
        cmp dword [dword esi+09Ch], byte 0
        jne near .27
        mov eax, esi
        call sub_4B38C
        mov edx, dword [nosplit eax*4+dword_152FEC]
        mov dword [byte ebp-020h], eax
        mov dword [byte ebp-010h], edx
        cmp eax, 0C1Bh
        jl short .19
        cmp eax, 0C41h
        jl near .27
.19:
        imul eax, dword [byte ebp-01Ch], byte 0Ch
        push dword [dword eax+dword_179AC8]
        call SpriteScale
        add esp, byte 4
        mov edi, eax
        cmp dword [byte ebp-020h], 0B0Dh
        jl short .20
        cmp dword [byte ebp-020h], 0C41h
        jge short .20
        sar edi, 1
.20:
        cmp dword [byte ebp-020h], 0BF5h
        jl near .25
        cmp dword [byte ebp-020h], 0C1Bh
        jge near .25
        movsx eax, word [byte esi+014h]
        imul edx, eax, dword 0A0h
        mov ecx, dword [nosplit eax*8+dword_1797FC]
        mov ebx, dword [byte ebp-01Ch]
        mov dword [byte ebp-018h], ecx
        mov ecx, dword [nosplit ebx*8+dword_1797FC]
        add dword [byte ebp-018h], ecx
        mov ecx, dword [byte ebp-018h]
        mov eax, dword [nosplit eax*8+dword_179800]
        add eax, dword [nosplit ebx*8+dword_179800]
        add edx, SortCords
        sar eax, 1
        sar ecx, 1
        mov dword [byte ebp-0Ch], eax
        mov eax, edx
        mov dword [byte ebp-08h], ecx
        call sub_4B38C
        cmp eax, 0C1Bh
        jl short .21
        cmp eax, 0C41h
        jge short .21
        movsx ebx, word [dword edx+086h]
        mov dx, word [byte edx+054h]
        xor dl, dl
        and dh, 8
        push byte 1
        movsx edx, dx
        push ebx
        test edx, edx
        setne dl
        mov ecx, edi
        movzx edx, dl
        mov eax, dword [nosplit eax*4+dword_152FEC]
        push edx
        mov ebx, dword [byte ebp-0Ch]
        mov edx, dword [byte ebp-08h]
        call DrawRinkSprite
        jmp short .24
.21:
        movsx eax, word [byte esi+036h]
        cmp eax, byte 2
        jne short .22
        mov edx, 0Ah
        jmp short .23
.22:
        mov edx, 0FFFFFFF6h
.23:
        mov eax, dword [byte ebp-01Ch]
        mov ebx, dword [nosplit eax*8+dword_1797FC]
        sub ebx, edx
        mov eax, dword [nosplit eax*8+dword_179800]
        mov dword [byte ebp-08h], ebx
        mov dword [byte ebp-0Ch], eax
.24:
        push byte 1
        movsx eax, word [dword esi+086h]
        push eax
        mov ax, word [byte esi+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        setne al
        mov ebx, dword [byte ebp-0Ch]
        movzx eax, al
        mov edx, dword [byte ebp-08h]
        push eax
        mov ecx, edi
        jmp short .26
.25:
        push byte 1
        movsx eax, word [dword esi+086h]
        push eax
        mov ax, word [byte esi+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        setne al
        movzx eax, al
        push eax
        mov eax, dword [byte ebp-01Ch]
        mov ecx, edi
        mov ebx, dword [nosplit eax*8+dword_179800]
        mov edx, dword [nosplit eax*8+dword_1797FC]
.26:
        mov eax, dword [byte ebp-010h]
        call DrawRinkSprite
        cmp dword [byte ebp-020h], 0DE7h
        jl short .27
        cmp dword [byte ebp-020h], 0E60h
        jge short .27
        mov eax, dword [byte ebp-020h]
        mov eax, dword [nosplit eax*4+dword_1531D0]
        mov dword [byte ebp-018h], eax
        mov ax, word [byte esi+054h]
        xor al, al
        and ah, 8
        push byte 1
        cwde
        push byte 10h
        test eax, eax
        setne al
        movzx eax, al
        push eax
        mov eax, dword [byte ebp-01Ch]
        mov ecx, edi
        mov ebx, dword [nosplit eax*8+dword_179800]
        mov edx, dword [nosplit eax*8+dword_1797FC]
        mov eax, dword [byte ebp-018h]
        call DrawRinkSprite
.27:
        add dword [byte ebp-014h], byte 4
        cmp dword [byte ebp-014h], byte 44h
        jne near .13
        jmp near InitGameView_709
;-----------------------------------------------------------------------------
; DrawPlayerShadows                               59F78  96 PC, low confidence
; The shadows of the sorted, visible players
;-----------------------------------------------------------------------------
DrawPlayerShadows:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1Ch, 0
        call sub_297C9
        mov dword [byte ebp-0Ch], 0
.1:
        mov eax, dword [byte ebp-0Ch]
        mov eax, dword [dword eax+dword_179A7C]
        mov dword [byte ebp-08h], eax
        imul eax, byte 0Ch
        cmp dword [dword eax+dword_179AC8], byte 50h
        jle near .12
        imul esi, dword [byte ebp-08h], dword 0A0h
        add esi, SortCords
        movsx eax, word [byte esi+012h]
        cmp eax, byte 0FFFFFFFFh
        je near .12
        movsx eax, word [dword esi+086h]
        cmp eax, byte 0Ch
        jge short .2
        cmp word [byte esi+01Ah], byte 0
        jl near .12
.2:
        movsx eax, word [dword esi+086h]
        cmp eax, byte 0Ch
        jl short .3
        cmp eax, byte 0Fh
        jle near .12
.3:
        mov eax, esi
        call sub_4B38C
        mov edx, dword [nosplit eax*4+dword_152FEC]
        mov dword [byte ebp-014h], eax
        mov dword [byte ebp-010h], edx
        cmp eax, 0C1Bh
        jl short .4
        cmp eax, 0C41h
        jl near .12
.4:
        imul eax, dword [byte ebp-08h], byte 0Ch
        push dword [dword eax+dword_179AC8]
        call SpriteScale
        add esp, byte 4
        mov edi, eax
        cmp dword [byte ebp-014h], 0B0Dh
        jl short .5
        cmp dword [byte ebp-014h], 0C41h
        jge short .5
        sar edi, 1
.5:
        cmp dword [byte ebp-014h], 0BF5h
        jl near .10
        cmp dword [byte ebp-014h], 0C1Bh
        jge near .10
        movsx eax, word [byte esi+014h]
        imul ebx, eax, dword 0A0h
        mov ecx, dword [nosplit eax*8+dword_1797FC]
        mov edx, dword [byte ebp-08h]
        mov dword [byte ebp-04h], ecx
        mov ecx, dword [nosplit edx*8+dword_1797FC]
        add dword [byte ebp-04h], ecx
        mov ecx, dword [byte ebp-04h]
        mov eax, dword [nosplit eax*8+dword_179800]
        add eax, dword [nosplit edx*8+dword_179800]
        add ebx, SortCords
        sar eax, 1
        sar ecx, 1
        mov dword [byte ebp-01Ch], eax
        mov eax, ebx
        mov dword [byte ebp-018h], ecx
        call sub_4B38C
        cmp eax, 0C1Bh
        jl short .6
        cmp eax, 0C41h
        jge short .6
        mov dx, word [byte ebx+054h]
        xor dl, dl
        and dh, 8
        movsx edx, dx
        test edx, edx
        setne dl
        mov ecx, edi
        movzx edx, dl
        mov eax, dword [nosplit eax*4+dword_152FEC]
        push edx
        mov ebx, dword [byte ebp-01Ch]
        mov edx, dword [byte ebp-018h]
        call DrawSpriteShadow
        jmp short .9
.6:
        movsx eax, word [byte esi+036h]
        cmp eax, byte 2
        jne short .7
        mov edx, 0Ah
        jmp short .8
.7:
        mov edx, 0FFFFFFF6h
.8:
        mov eax, dword [byte ebp-08h]
        mov ebx, dword [nosplit eax*8+dword_1797FC]
        sub ebx, edx
        mov eax, dword [nosplit eax*8+dword_179800]
        mov dword [byte ebp-018h], ebx
        mov dword [byte ebp-01Ch], eax
.9:
        mov ax, word [byte esi+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        setne al
        mov ebx, dword [byte ebp-01Ch]
        movzx eax, al
        mov edx, dword [byte ebp-018h]
        push eax
        mov ecx, edi
        jmp short .11
.10:
        mov ax, word [byte esi+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        setne al
        movzx eax, al
        push eax
        mov eax, dword [byte ebp-08h]
        mov ecx, edi
        mov ebx, dword [nosplit eax*8+dword_179800]
        mov edx, dword [nosplit eax*8+dword_1797FC]
.11:
        mov eax, dword [byte ebp-010h]
        call DrawSpriteShadow
        cmp dword [byte ebp-014h], 0DE7h
        jl short .12
        cmp dword [byte ebp-014h], 0E60h
        jge short .12
        mov eax, dword [byte ebp-014h]
        mov eax, dword [nosplit eax*4+dword_1531D0]
        mov dword [byte ebp-04h], eax
        mov ax, word [byte esi+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        setne al
        movzx eax, al
        push eax
        mov eax, dword [byte ebp-08h]
        mov ecx, edi
        mov ebx, dword [nosplit eax*8+dword_179800]
        mov edx, dword [nosplit eax*8+dword_1797FC]
        mov eax, dword [byte ebp-04h]
        call DrawSpriteShadow
.12:
        add dword [byte ebp-0Ch], byte 4
        cmp dword [byte ebp-0Ch], byte 44h
        jne near .1
        jmp near InitGameView_709
;-----------------------------------------------------------------------------
; DrawPlayers                                     5A1B2  96 PC, low confidence
; The sorted, visible players back to front (DrawPlayerSprite), with their
; shadows
;-----------------------------------------------------------------------------
DrawPlayers:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 20h, 0
        mov dword [byte ebp-08h], 40h
.1:
        mov eax, dword [byte ebp-08h]
        mov eax, dword [dword eax+dword_179A7C]
        mov dword [byte ebp-018h], eax
        imul eax, byte 0Ch
        cmp dword [dword eax+dword_179AC8], byte 50h
        jle near .12
        imul esi, dword [byte ebp-018h], dword 0A0h
        add esi, SortCords
        cmp dword [dword esi+09Ch], byte 0
        jne near .12
        movsx eax, word [byte esi+012h]
        cmp eax, byte 0FFFFFFFFh
        je near .12
        movsx eax, word [dword esi+086h]
        cmp eax, byte 0Ch
        jge short .2
        cmp word [byte esi+01Ah], byte 0
        jl near .12
.2:
        movsx eax, word [dword esi+086h]
        cmp eax, byte 0Ch
        jl short .3
        cmp eax, byte 0Fh
        jle near .12
.3:
        mov eax, esi
        call sub_4B38C
        mov edx, dword [nosplit eax*4+dword_152FEC]
        mov dword [byte ebp-010h], eax
        mov dword [byte ebp-014h], edx
        cmp eax, 0C1Bh
        jl short .4
        cmp eax, 0C41h
        jl near .12
.4:
        imul eax, dword [byte ebp-018h], byte 0Ch
        push dword [dword eax+dword_179AC8]
        call SpriteScale
        add esp, byte 4
        mov edi, eax
        cmp dword [byte ebp-010h], 0B0Dh
        jl short .5
        cmp dword [byte ebp-010h], 0C41h
        jge short .5
        sar edi, 1
.5:
        mov dword [byte ebp-0Ch], 0
        cmp dword [byte ebp-010h], 0BF5h
        jl near .10
        cmp dword [byte ebp-010h], 0C1Bh
        jge near .10
        movsx eax, word [byte esi+014h]
        imul edx, eax, dword 0A0h
        mov ecx, dword [nosplit eax*8+dword_1797FC]
        mov ebx, dword [byte ebp-018h]
        mov dword [byte ebp-04h], ecx
        mov ecx, dword [nosplit ebx*8+dword_1797FC]
        add dword [byte ebp-04h], ecx
        mov ecx, dword [byte ebp-04h]
        mov eax, dword [nosplit eax*8+dword_179800]
        add eax, dword [nosplit ebx*8+dword_179800]
        add edx, SortCords
        sar eax, 1
        sar ecx, 1
        mov dword [byte ebp-020h], eax
        mov eax, edx
        mov dword [byte ebp-01Ch], ecx
        call sub_4B38C
        cmp eax, 0C1Bh
        jl short .6
        cmp eax, 0C41h
        jge short .6
        movsx ebx, word [dword edx+086h]
        mov dx, word [byte edx+054h]
        xor dl, dl
        and dh, 8
        push byte 0
        movsx edx, dx
        push ebx
        test edx, edx
        setne dl
        mov ecx, edi
        movzx edx, dl
        mov eax, dword [nosplit eax*4+dword_152FEC]
        push edx
        mov ebx, dword [byte ebp-020h]
        mov edx, dword [byte ebp-01Ch]
        call DrawPlayerSprite
        jmp short .9
.6:
        movsx eax, word [byte esi+036h]
        cmp eax, byte 2
        jne short .7
        mov eax, 0Ah
        jmp short .8
.7:
        mov eax, 0FFFFFFF6h
.8:
        mov edx, dword [byte ebp-018h]
        mov ebx, dword [nosplit edx*8+dword_1797FC]
        sub ebx, eax
        mov eax, dword [nosplit edx*8+dword_179800]
        mov dword [byte ebp-01Ch], ebx
        mov dword [byte ebp-020h], eax
.9:
        push dword [byte ebp-0Ch]
        movsx eax, word [dword esi+086h]
        push eax
        mov ax, word [byte esi+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        setne al
        mov ebx, dword [byte ebp-020h]
        movzx eax, al
        mov edx, dword [byte ebp-01Ch]
        push eax
        mov ecx, edi
        jmp short .11
.10:
        push dword [byte ebp-0Ch]
        movsx eax, word [dword esi+086h]
        push eax
        mov ax, word [byte esi+054h]
        xor al, al
        and ah, 8
        cwde
        test eax, eax
        setne al
        movzx eax, al
        push eax
        mov eax, dword [byte ebp-018h]
        mov ecx, edi
        mov ebx, dword [nosplit eax*8+dword_179800]
        mov edx, dword [nosplit eax*8+dword_1797FC]
.11:
        mov eax, dword [byte ebp-014h]
        call DrawPlayerSprite
        cmp dword [byte ebp-010h], 0DE7h
        jl short .12
        cmp dword [byte ebp-010h], 0E60h
        jge short .12
        mov eax, dword [byte ebp-010h]
        mov eax, dword [nosplit eax*4+dword_1531D0]
        mov dword [byte ebp-04h], eax
        mov ax, word [byte esi+054h]
        xor al, al
        and ah, 8
        push dword [byte ebp-0Ch]
        cwde
        push byte 10h
        test eax, eax
        setne al
        movzx eax, al
        push eax
        mov eax, dword [byte ebp-018h]
        mov ecx, edi
        mov ebx, dword [nosplit eax*8+dword_179800]
        mov edx, dword [nosplit eax*8+dword_1797FC]
        mov eax, dword [byte ebp-04h]
        call DrawPlayerSprite
.12:
        sub dword [byte ebp-08h], byte 4
        cmp dword [byte ebp-08h], byte 0FFFFFFFCh
        jne near .1
        jmp near InitGameView_709
        cmp byte [byte_1175A8], 0
        je short .13
        call DrawPlayers
.13:
        cmp dword [dword_17997C], byte 0
        je short DrawPlayerMarkers
        call DrawPlayerShadows
;-----------------------------------------------------------------------------
; DrawPlayerMarkers                            5A43C  96 PC, medium confidence
; The 4 controller markers (DrawControlMarker) and the puck carrier's
;-----------------------------------------------------------------------------
DrawPlayerMarkers:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 24h, 0
        cmp dword [dword_11D91F], byte 0
        jne near PlaceGoalNets_20B
        mov eax, dword [dword_17BA54]
        mov dword [byte ebp-01Ch], 0
        call sub_B58D8
        mov dword [dword_11BC24], 0FFFFFFFFh
.1:
        mov eax, dword [puckc]
        movsx edx, byte [eax]
        mov eax, dword [byte ebp-01Ch]
        inc dword [byte ebp-01Ch]
        call DrawControlMarker
        cmp dword [byte ebp-01Ch], byte 4
        jl short .1
        mov eax, dword [puckc]
        cmp byte [eax], 0
        jl near PlaceGoalNets_E0
        movsx edx, byte [eax]
        imul eax, edx, byte 0Ch
        cmp dword [dword eax+dword_179AC8], byte 50h
        jle near PlaceGoalNets_E0
        imul edx, dword 0A0h
        cmp dword [dword edx+dword_164816], byte 0FFFFFFFFh
        jne near PlaceGoalNets_E0
        push dword [dword eax+dword_179AC8]
        call SpriteScale
        add esp, byte 4
        mov edx, 33333h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        test byte [byte_17CA5D], 20h
        je near PlaceGoalNets_65
        cmp eax, 30000h
        jle near PlaceGoalNets_71
        mov eax, 30000h
        jmp near PlaceGoalNets_71
;-----------------------------------------------------------------------------
; DrawRinkView                                 5A4FF  96 PC, medium confidence
; From the in-game menu: draws the rink model from the camera with no players
;-----------------------------------------------------------------------------
DrawRinkView:
        push ebx
        push ecx
        push edx
        enter 6Ch, 0
        push dword [dword_179E0F]
        lea edx, [byte ebp-024h]
        push edx
        call sub_BC610
        add esp, byte 8
        push dword [dword_179E0B]
        lea edx, [byte ebp-048h]
        push edx
        call sub_BC674
        add esp, byte 8
        lea edx, [byte ebp-06Ch]
        push edx
        lea edx, [byte ebp-024h]
        push edx
        lea edx, [byte ebp-048h]
        push edx
        call MultiplyMatrix
        add esp, byte 0Ch
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        lea edx, [byte ebp-06Ch]
        mov eax, dword_179E13
        call SetViewCamera
        call DrawRinkModels
        call DrawWholeRink
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawGameFrame                                                   5A572  96 PC
; (ticks): one frame of the game view from the camera (GameLoop_inputcheck,
; RunSimFrames, the menus): rink, players, puck, markers, overlays
; (DrawGameOverlays), line change boxes
;-----------------------------------------------------------------------------
DrawGameFrame:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 90h, 0
        sub ebp, 82h
        mov edi, eax
        push dword [dword_179E0F]
        lea eax, [byte ebp+016h]
        push eax
        call sub_BC610
        add esp, byte 8
        push dword [dword_179E0B]
        lea eax, [byte ebp-0Eh]
        push eax
        call sub_BC674
        add esp, byte 8
        lea eax, [byte ebp+03Ah]
        push eax
        lea eax, [byte ebp+016h]
        push eax
        lea eax, [byte ebp-0Eh]
        push eax
        mov dword [byte ebp+07Ah], 0FFFFFFF4h
        xor esi, esi
        call MultiplyMatrix
        mov ecx, unk_179BBC
        add esp, byte 0Ch
        xor ebx, ebx
.1:
        mov eax, dword [dword ebx+SortCords]
        sar eax, 0Eh
        mov dword [ecx], eax
        mov eax, dword [dword ebx+dword_1647A0]
        sar eax, 0Eh
        mov dword [byte ecx+08h], eax
        mov eax, dword [dword ebx+dword_1647A4]
        sar eax, 0Eh
        mov dword [byte ecx+04h], eax
        cmp esi, byte 0Ch
        je short .2
        cmp esi, byte 0Dh
        jne short .4
.2:
        cmp word [dword ebx+word_1647A8], byte 0
        jne short .3
        cmp word [dword ebx+word_1647AA], byte 0
        je short .4
.3:
        mov eax, dword [byte ebp+07Ah]
        mov edx, ecx
        call PlaceGoalNet
        mov dword [dword_11B2A8], 1
.4:
        inc dword [byte ebp+07Ah]
        add ebx, 0A0h
        inc esi
        add ecx, byte 0Ch
        cmp esi, byte 11h
        jl short .1
        call SpinPuckModel
        mov eax, dword [dword_16505C]
        sar eax, 0Eh
        mov dword [byte ebp+06Ah], eax
        mov eax, dword [dword_165064]
        sar eax, 0Eh
        mov dword [byte ebp+06Eh], eax
        mov eax, dword [dword_165060]
        sar eax, 0Eh
        mov dword [byte ebp+072h], eax
        lea eax, [byte ebp+06Ah]
        call PlacePuckModels
        mov eax, dword [dword_179E13]
        mov dword [byte ebp+05Eh], eax
        mov eax, dword [dword_179E17]
        mov esi, 11h
        mov dword [byte ebp+062h], eax
        mov eax, dword [dword_179E1B]
        neg dword [byte ebp+05Eh]
        mov dword [byte ebp+066h], eax
        neg dword [byte ebp+062h]
        neg dword [byte ebp+066h]
        cmp word [word_165144], byte 0
        je near .8
        mov dx, word [word_165144]
        xor dh, dh
        and dl, 1
        mov eax, dword_179C88
        movsx edx, dx
        mov esi, 15h
        test edx, edx
        je short .5
        movsx edx, word [word_16514A]
        shl edx, 2
        mov dword [dword_179C88], edx
        movsx edx, word [word_16514C]
        shl edx, 2
        mov dword [dword_179C8C], 0
        mov dword [dword_179C90], edx
.5:
        mov dx, word [word_165144]
        xor dh, dh
        and dl, 2
        movsx edx, dx
        add eax, byte 0Ch
        test edx, edx
        je short .6
        mov ebx, dword [dword_16516E]
        shl ebx, 2
        mov dword [eax], ebx
        mov ebx, dword [dword_165172]
        shl ebx, 2
        mov dword [byte eax+04h], 0
        mov dword [byte eax+08h], ebx
.6:
        mov dx, word [word_165144]
        xor dh, dh
        and dl, 4
        movsx edx, dx
        add eax, byte 0Ch
        test edx, edx
        je short .7
        movsx edx, word [word_165146]
        shl edx, 2
        mov dword [eax], edx
        movsx edx, word [word_165148]
        shl edx, 2
        mov dword [byte eax+04h], 0
        mov dword [byte eax+08h], edx
.7:
        mov dx, word [word_165144]
        xor dh, dh
        and dl, 4
        movsx edx, dx
        add eax, byte 0Ch
        test edx, edx
        je short .8
        mov ebx, dword [dword_165166]
        shl ebx, 2
        mov dword [eax], ebx
        mov ebx, dword [dword_16516A]
        shl ebx, 2
        mov dword [byte eax+04h], 0
        mov dword [byte eax+08h], ebx
.8:
        push unk_179980
        lea eax, [byte ebp+05Eh]
        push eax
        push unk_179BBC
        push esi
        call DrawPolyOutline
        add esp, byte 10h
        push unk_179AC0
        lea eax, [byte ebp+03Ah]
        push eax
        push unk_179980
        push esi
        call DrawFlatPoly
        add esp, byte 10h
        push dword_1797FC
        push unk_179AC0
        push esi
        call sub_BA3D0
        mov eax, 60h
        add esp, byte 0Ch
.9:
        add eax, byte 8
        sar dword [dword eax+dword_1797F4], 10h
        sar dword [dword eax+dword_1797F8], 10h
        cmp eax, byte 70h
        jne short .9
        xor eax, eax
        xor ebx, ebx
.10:
        mov edx, dword [dword ebx+dword_179AC8]
        cmp edx, byte 50h
        jg short .11
        mov dword [dword eax+dword_179934], 0FFFFFC18h
        jmp short .12
.11:
        mov dword [dword eax+dword_179934], edx
.12:
        add eax, byte 4
        add ebx, byte 0Ch
        cmp eax, byte 44h
        jne short .10
        xor ebx, ebx
        xor eax, eax
.13:
        mov dword [dword eax+dword_179A7C], ebx
        inc ebx
        add eax, byte 4
        cmp ebx, byte 11h
        jl short .13
        push dword_179A7C
        push dword_179934
        push byte 11h
        call SortIndices
        movsx ebx, word [gameclock]
        mov eax, ebx
        mov ecx, 3Ch
        cdq
        idiv ecx
        mov dword [dword_1798B8], eax
        mov eax, ebx
        cdq
        idiv ecx
        movsx eax, word [word_117902]
        imul eax, byte 0Ah
        mov ebx, 18h
        mov dword [dword_1798B0], edx
        cdq
        idiv ebx
        add esp, byte 0Ch
        mov dword [dword_1798B4], eax
        cmp dword [dword_1798B8], byte 0
        jne short .14
        cmp dword [dword_1798B0], byte 0
        jne short .14
        test eax, eax
        jne short .14
        mov eax, 1
        jmp short .15
.14:
        xor eax, eax
.15:
        test eax, eax
        setne al
        movzx eax, al
        mov dword [dword_1798BC], eax
        call sub_54427
        call DimGameView
        mov eax, dword [dword_11B32C]
        mov ecx, dword [dword_11B32C]
        mov ebx, dword [dword_11B328]
        mov edx, dword [dword_11B328]
        add eax, dword [dword_11B31C]
        inc dword [dword_177108]
        push eax
        add ebx, dword [dword_11B318]
        mov eax, dword [dword_177108]
        call sub_5439F
        mov eax, dword [dword_11B32C]
        add eax, dword [dword_11B31C]
        push eax
        mov eax, dword [dword_11B328]
        push dword [dword_11B32C]
        add eax, dword [dword_11B318]
        push eax
        push dword [dword_11B328]
        call SetClipWindow
        add esp, byte 10h
        lea edx, [byte ebp+03Ah]
        mov eax, dword_179E13
        call SetViewCamera
        call DrawRinkModels
        add dword [dword_179910], edi
        mov eax, dword [dword_179910]
        call UpdateGoalLight
        add dword [dword_15E4BC], edi
        mov eax, dword [dword_15E4BC]
        call StepGlassShards
        add dword [dword_15E4C0], edi
        mov eax, dword [dword_15E4C0]
        call ApplyGlassShake
        mov eax, edi
        call MoveZamboni
        call DrawRinkBack
        cmp dword [dword_1176E5], byte 0
        je short .16
        call DrawZamboni
        jmp short .19
.16:
        cmp byte [byte_1175A8], 0
        je short .17
        call DrawPlayers
.17:
        cmp dword [dword_17997C], byte 0
        je short .18
        call DrawPlayerShadows
.18:
        call DrawPlayerMarkers
.19:
        call DrawRinkFront
        cmp dword [dword_11D91F], byte 0
        jne near .31
        xor ebx, ebx
        xor eax, eax
.20:
        movsx edx, word [dword eax+word_1515B5]
        cmp edx, byte 2
        je short .21
        add eax, byte 7
        inc ebx
        cmp eax, byte 1Ch
        jl short .20
.21:
        cmp ebx, byte 4
        jl short .22
        mov ebx, 0FFFFFFFFh
        jmp short .23
.22:
        movsx ebx, word [nosplit ebx*2+HomeControlSlot]
.23:
        test ebx, ebx
        jl near .31
        cmp dword [dword_119FEC], byte 0
        jne near .31
        cmp dword [curperiod], byte 0FFFFFFFFh
        je near .31
        mov edx, dword [mousex]
        sub edx, dword [dword_11B320]
        imul edx, edx
        mov eax, dword [mousey]
        sub eax, dword [dword_11B324]
        imul eax, eax
        add edx, eax
        test byte [byte_17CA5D], 20h
        je short .24
        mov eax, 2710h
        jmp short .25
.24:
        mov eax, 9C4h
.25:
        cmp edx, eax
        jge short .26
        mov dword [byte ebp+076h], 0
        mov dword [byte ebp+07Eh], 0
        mov eax, 8
        jmp short .27
.26:
        mov eax, dword [mousex]
        sub eax, dword [dword_11B320]
        sar eax, 2
        mov dword [byte ebp+07Eh], eax
        mov eax, dword [mousey]
        sub eax, dword [dword_11B324]
        sar eax, 2
        mov dword [byte ebp+076h], eax
        mov ax, word [dword_11B324]
        sub ax, word [mousey]
        movsx edx, ax
        mov ax, word [mousex]
        sub ax, word [dword_11B320]
        cwde
        call vtoa
        cwde
.27:
        imul ecx, ebx, byte 0Ch
        cmp dword [dword ecx+dword_179AC8], byte 50h
        jge short .28
        mov edx, dword [dword_11B318]
        sar edx, 1
        add dword [byte ebp+07Eh], edx
        mov edx, dword [dword_11B31C]
        jmp short .29
.28:
        mov edx, dword [nosplit ebx*8+dword_1797FC]
        sar edx, 10h
        add dword [byte ebp+07Eh], edx
        mov edx, dword [nosplit ebx*8+dword_179800]
        sar edx, 10h
.29:
        add dword [byte ebp+076h], edx
        mov esi, dword [nosplit eax*4+dword_11B24C]
        cmp eax, byte 4
        jle short .30
        cmp eax, byte 8
        jge short .30
        push dword [nosplit esi*4+dword_152FEC]
        call sub_BEFF0
        add esp, byte 4
        push dword [byte ebp+076h]
        push dword [byte ebp+07Eh]
        push dword [nosplit esi*4+dword_152FEC]
        call sub_AAADC
        add esp, byte 0Ch
        push dword [nosplit esi*4+dword_152FEC]
        call sub_BEFF0
        add esp, byte 4
        jmp short .31
.30:
        push dword [byte ebp+076h]
        push dword [byte ebp+07Eh]
        push dword [nosplit esi*4+dword_152FEC]
        call sub_AAADC
        add esp, byte 0Ch
.31:
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        cmp dword [dword_11D91F], byte 0
        je short .32
        call DrawPauseFrame
        jmp short .36
.32:
        cmp dword [dword_119D04], byte 0
        je short .34
        xor eax, eax
.33:
        call sub_2E1BE
        jmp short .36
.34:
        cmp dword [dword_1798BC], byte 0
        je short .35
        mov al, byte [gmode]
        and al, 80h
        movsx eax, al
        test eax, eax
        jne short .36
        mov eax, 1
        mov dword [lineuptime], 1D6h
        jmp short .33
.35:
        call DrawLineChangeBoxes
        mov edx, eax
        mov eax, edi
        call DrawGameOverlays
.36:
        call sub_54237
        push byte 3
        push byte 0
        call sub_AFFD0
        add esp, byte 8
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near InitGameView_70A
;-----------------------------------------------------------------------------
; DrawPanelLogo                                   5AB8A  96 PC, low confidence
; Draws a team logo model into an overlay panel (scale by hi-res
; dword_1798A8)
;-----------------------------------------------------------------------------
DrawPanelLogo:
        push esi
        push edi
        enter 8, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-08h], ebx
        test ecx, ecx
        je short .2
        cmp dword [dword_1798A8], byte 0
        je short .1
        mov eax, 9999h
        jmp short .4
.1:
        mov eax, 3851h
        jmp short .4
.2:
        cmp dword [dword_1798A8], byte 0
        je short .3
        mov eax, 0CCCCh
        jmp short .4
.3:
        mov eax, 6666h
.4:
        mov dword [byte ebp-04h], eax
        mov eax, dword [dword_152F4C]
        mov ecx, dword [byte ebp-08h]
        call sub_B58D8
        mov ebx, edi
        mov edx, esi
        mov eax, dword [byte ebp-04h]
        mov dword [dword_11BC24], 0FFFFFFFFh
        call sub_B6140
        movsx eax, word [byte esi+08h]
        imul eax, dword [byte ebp-04h]
        sar eax, 10h
        sub edi, eax
        movsx eax, word [byte esi+0Ah]
        imul eax, dword [byte ebp-04h]
        sar eax, 10h
        sub dword [byte ebp-08h], eax
        movsx eax, word [byte esi+06h]
        imul eax, dword [byte ebp-04h]
        sar eax, 10h
        add eax, dword [byte ebp-08h]
        push eax
        movsx eax, word [byte esi+04h]
        imul eax, dword [byte ebp-04h]
        mov ecx, dword [byte ebp-08h]
        sar eax, 10h
        inc dword [dword_177108]
        lea ebx, [edi+eax]
        mov eax, dword [dword_177108]
        mov edx, edi
        call sub_5439F
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; OpenOverlayPanel                                5AC3E  96 PC, low confidence
; The box of an overlay panel (logo, fill), drawn again only when the panel
; changes (byte_179CB8 / 179CB9)
;-----------------------------------------------------------------------------
OpenOverlayPanel:
        push ecx
        push esi
        push edi
        enter 10h, 0
        push eax
        cmp byte [byte_179CB8], 0
        je short .1
        movsx eax, byte [byte_179CB9]
        cmp eax, ebx
        je short .1
        dec byte [byte_179CB8]
        cmp byte [byte_179CB8], 0
        jle short .1
        xor eax, eax
        leave
        pop edi
        pop esi
        pop ecx
        ret
.1:
        mov eax, 1F4h
        mov cl, byte [byte_1798A4]
        mov byte [byte_179CB8], 0Ah
        sar eax, cl
        mov edi, 46h
        mov dword [byte ebp-04h], eax
        mov eax, 24h
        mov byte [byte_179CB9], bl
        sar eax, cl
        sar edi, cl
        mov dword [byte ebp-08h], eax
        cmp dword [dword_1798A8], byte 0
        je short .2
        mov eax, 1E0h
        jmp short .3
.2:
        mov eax, 0C8h
.3:
        mov ebx, edx
        imul edx, dword [dword_1798FC]
        shl ebx, 2
        mov cl, byte [byte_1798A4]
        add ebx, byte 4
        sar ebx, cl
        add ebx, edx
        mov edx, 24h
        mov esi, eax
        sar edx, cl
        sub esi, edx
        mov edx, eax
        sub esi, ebx
        mov eax, dword [dword_1798FC]
        sub esi, dword [dword_1798FC]
        sar eax, 1
        sub edx, esi
        sub edx, eax
        mov dword [byte ebp-0Ch], edx
        lea eax, [byte edx+esi-01h]
        push eax
        mov eax, dword [byte ebp-04h]
        add eax, edi
        mov ebx, esi
        mov dword [byte ebp-010h], eax
        lea ecx, [byte eax-01h]
        mov edx, edi
        mov eax, unk_17D3E8
        call FillBox
        mov eax, 2
        mov cl, byte [dword_1798A8]
        mov edx, dword [byte ebp-08h]
        shl eax, cl
        push dword 0ADh
        sub edx, eax
        push edx
        mov edx, dword [byte ebp-04h]
        sub edx, eax
        push edx
        push esi
        push edi
        call FillRect
        mov eax, 2
        mov edx, 4
        add esp, byte 14h
        mov ebx, dword [byte ebp-04h]
        mov cl, byte [dword_1798A8]
        push byte 4
        shl edx, cl
        shl eax, cl
        sub ebx, edx
        mov edx, dword [byte ebp-08h]
        push eax
        add edx, esi
        push ebx
        sub edx, eax
        push edx
        add eax, edi
        push eax
        call FillRect
        mov eax, 2
        mov edx, dword [byte ebp-08h]
        mov cl, byte [dword_1798A8]
        add esp, byte 14h
        shl eax, cl
        push byte 4
        sub edx, eax
        push edx
        push eax
        lea edx, [esi+eax]
        push edx
        mov edx, dword [byte ebp-010h]
        sub edx, eax
        push edx
        call FillRect
        add esp, byte 14h
        cmp dword [byte ebp-014h], byte 0
        jl short .6
        mov dword [dword_11B2EC], 0FFFFFFFFh
        je short .4
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        jmp short .5
.4:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
.5:
        shr eax, 1Bh
        jmp short .8
.6:
        cmp dword [dword_11B2EC], byte 0
        jge short .7
        call rand_
        mov ebx, 6
        cdq
        idiv ebx
        mov dword [dword_11B2EC], edx
.7:
        mov eax, dword [dword_11B2EC]
        add eax, byte 1Ch
.8:
        call LoadTeamLogo
        mov edx, 1Eh
        mov cl, byte [byte_1798A4]
        sar edx, cl
        mov ecx, dword [byte_1798A4]
        movsx ebx, word [byte eax+0Ah]
        inc ecx
        sar ebx, cl
        add edx, edi
        add ebx, esi
        xor ecx, ecx
        call DrawPanelLogo
        mov dword [dword_11B238], 1770h
        mov eax, dword [byte ebp-0Ch]
        mov ebx, dword [byte ebp-04h]
        inc dword [dword_177108]
        mov ecx, esi
        mov edx, edi
        add eax, esi
        add ebx, edi
        push eax
        mov eax, dword [dword_177108]
        mov dword [dword_11B2E8], 0
        call sub_5439F
        mov eax, 1
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; DrawOverlayCaption                              5AE47  96 PC, low confidence
; With word_119111 set, draws its caption text (table unk_58468, text 0ADh)
;-----------------------------------------------------------------------------
DrawOverlayCaption:
        push ebx
        push ecx
        push esi
        push edi
        enter 2Ch, 0
        push eax
        push edx
        mov ecx, 9
        lea edi, [byte ebp-02Ch]
        mov esi, unk_58468
        rep movsd
        push dword [dword_179920]
        call TextSetFont
        mov edx, 6
        add esp, byte 4
        mov eax, 0ADh
        mov edi, dword [byte ebp-034h]
        call SetTextColors
        mov eax, dword [byte ebp-030h]
        mov esi, 14h
        and edi, 0FFFFh
        mov eax, dword [byte ebp+eax*4-02Ch]
        mov cl, byte [byte_1798A4]
        call GetLangText
        push eax
        sar esi, cl
        call fputchar
        add edi, esi
        mov cl, byte [byte_1798A4]
        add eax, byte 6
        mov edx, dword [dword_17992C]
        mov dword [byte ebp-04h], eax
        mov eax, 6
        add esp, byte 4
        sar eax, cl
        mov ebx, edi
        add edx, eax
        mov ecx, dword [byte ebp-04h]
        mov dword [byte ebp-08h], edx
        lea eax, [edx+edi]
        add ecx, esi
        dec eax
        dec ecx
        push eax
        mov edx, esi
        mov eax, unk_17D3E8
        call FillBox
        cmp dword [dword_1798A8], byte 0
        je short .1
        mov ebx, 5
        jmp short .2
.1:
        xor ebx, ebx
.2:
        mov eax, dword [byte ebp-030h]
        lea edx, [byte esi+03h]
        mov ecx, edi
        mov eax, dword [byte ebp+eax*4-02Ch]
        add ebx, edi
        call GetLangText
        call DrawColorText
        mov eax, dword [byte ebp-08h]
        mov ebx, dword [byte ebp-04h]
        inc dword [dword_177108]
        add eax, edi
        mov edx, esi
        push eax
        add ebx, esi
DrawOverlayCaption_D7:
        mov eax, dword [dword_177108]
DrawOverlayCaption_DC:
        call sub_5439F
DrawOverlayCaption_E1:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
        mov eax, 1
        mov dword [lineuptime], 1D6h
        jmp near sub_2E1BE
;-----------------------------------------------------------------------------
; ResetGameOverlays                            5AF42  96 PC, medium confidence
; Resets the overlay timers (clock 1770h, 1F40h), the panel queue (3 x 14h at
; unk_11B2AC) and the hi-res flag
;-----------------------------------------------------------------------------
ResetGameOverlays:
        push edx
        mov dword [dword_11B238], 1770h
        mov eax, dword [dword_17CA5C]
        mov dword [dword_11B2E8], 0
        shl eax, 12h
        mov dword [dword_11B23C], 1F40h
        shr eax, 1Fh
        mov dword [dword_11B240], 0FFFFFFFFh
        mov dword [dword_1798A8], eax
        test eax, eax
        sete al
        movzx eax, al
        xor edx, edx
        mov dword [byte_1798A4], eax
        mov eax, unk_11B2AC
.1:
        inc edx
        mov dword [eax], 0FFFFFFFFh
        add eax, byte 14h
        cmp edx, byte 3
        jl short .1
        mov byte [byte_179CB8], 0
        mov byte [byte_179CB9], 0
        pop edx
        ret
;-----------------------------------------------------------------------------
; DrawTimedPanel                                  5AFAE  96 PC, low confidence
; (ticks): shows the panel dword_11B244 for 12Ch ticks
;-----------------------------------------------------------------------------
DrawTimedPanel:
        push ebx
        push ecx
        push esi
        push edi
        enter 10h, 0
        push edx
        cmp dword [dword_11B244], byte 0
        jl short .1
        cmp dword [dword_11B2F0], byte 0FFFFFFFFh
        jne short .1
        mov dword [dword_11B2F0], 12Ch
.1:
        cmp dword [dword_11B2F0], byte 0
        jl near DrawOverlayCaption_E1
        sub dword [dword_11B2F0], eax
        cmp dword [dword_11B2F0], byte 0
        jge short .2
        mov dword [dword_11B2F0], 0FFFFFFFFh
        mov dword [dword_11B244], 0FFFFFFFFh
        jmp near DrawOverlayCaption_E1
.2:
        mov esi, dword [dword_11B364]
        movzx eax, byte [byte esi+0Ch]
        mov esi, dword [dword_11B244]
        shl eax, 4
        mov esi, dword [dword eax+esi*4+dword_11B9F4]
        mov eax, dword [esi]
        mov edi, 266h
        call GetLangText
        push dword [dword_179920]
        mov dword [byte ebp-010h], eax
        mov dword [byte ebp-0Ch], eax
        call TextSetFont
        mov edx, 6
        add esp, byte 4
        mov eax, 0ADh
        mov esi, 14h
        call SetTextColors
        mov cl, byte [byte_1798A4]
        push dword [byte ebp-010h]
        sar edi, cl
        call fputchar
        mov cl, byte [byte_1798A4]
        sub edi, eax
        mov eax, dword [byte ebp-014h]
        add esp, byte 4
        xor ax, ax
        sar esi, cl
        shr eax, 10h
        push dword [byte ebp-010h]
        add esi, eax
        call fputchar
        mov cl, byte [byte_1798A4]
        add eax, byte 6
        mov edx, dword [dword_17992C]
        mov dword [byte ebp-08h], eax
        mov eax, 6
        add esp, byte 4
        sar eax, cl
        mov ebx, esi
        add edx, eax
        mov ecx, dword [byte ebp-08h]
        mov dword [byte ebp-04h], edx
        lea eax, [edx+esi]
        add ecx, edi
        dec eax
        dec ecx
        push eax
        mov edx, edi
        mov eax, unk_17D3E8
        call FillBox
        cmp dword [dword_1798A8], byte 0
        je short .3
        mov ebx, 5
        jmp short .4
.3:
        xor ebx, ebx
.4:
        mov eax, dword [byte ebp-0Ch]
        lea edx, [byte edi+03h]
        add ebx, esi
        call DrawColorText
        mov ecx, esi
        mov eax, dword [byte ebp-04h]
        mov ebx, dword [byte ebp-08h]
        inc dword [dword_177108]
        add eax, esi
        mov edx, edi
        push eax
        add ebx, edi
        jmp near DrawOverlayCaption_D7
;-----------------------------------------------------------------------------
; DrawGameClock                                                   5B0F9  96 PC
; Draws the game clock "%2d:%02d" (or "%2d.%01d" under a minute)
;-----------------------------------------------------------------------------
DrawGameClock:
        push ebx
        push ecx
        push esi
        push edi
        enter 14h, 0
        mov edi, eax
        mov esi, edx
        push dword [dword_179914]
        call TextSetFont
        add esp, byte 4
        push dword 0FFh
        push byte 41h
        call sub_AFFD0
        add esp, byte 8
        push esi
        push edi
        push dword [dword_179908]
        call sub_AAA40
        add esp, byte 0Ch
        cmp dword [dword_1798B8], byte 0
        je short .1
        push dword [dword_1798B0]
        push dword [dword_1798B8]
        push str_2d02d2
        jmp short .2
.1:
        push dword [dword_1798B4]
        push dword [dword_1798B0]
        push str_2d01d
.2:
        lea eax, [byte ebp-014h]
        push eax
        call sprintf_
        add esp, byte 10h
        mov eax, 4
        mov cl, byte [byte_1798A4]
        mov edx, 9
        sar eax, cl
        sar edx, cl
        inc eax
        add edx, edi
        lea ebx, [esi+eax]
        lea eax, [byte ebp-014h]
        call DrawText
        mov eax, dword [dword_179908]
        mov ecx, esi
        movsx edx, word [byte eax+06h]
        movsx ebx, word [byte eax+04h]
        inc dword [dword_177108]
        add edx, esi
        add ebx, edi
        push edx
        mov eax, dword [dword_177108]
        mov edx, edi
        jmp near DrawOverlayCaption_DC
;-----------------------------------------------------------------------------
; DrawPenaltyClock                             5B1B3  96 PC, medium confidence
; (pp, seconds): the power play box with the team logo and the penalty time
;-----------------------------------------------------------------------------
DrawPenaltyClock:
        push ebx
        push ecx
        push esi
        push edi
        enter 28h, 0
        push eax
        mov ebx, edx
        mov eax, edx
        mov ecx, 3Ch
        cdq
        idiv ecx
        mov dword [byte ebp-010h], eax
        mov eax, ebx
        cdq
        idiv ecx
        mov dword [byte ebp-014h], edx
        cmp dword [dword_1798A8], byte 0
        je short .1
        mov esi, 1B8h
        jmp short .2
.1:
        mov esi, 0DCh
.2:
        je short .3
        mov ebx, 18Eh
        jmp short .4
.3:
        mov ebx, 0A0h
.4:
        imul eax, dword [dword_1798FC], byte 3
        mov edi, 64h
        mov cl, byte [dword_1798A8]
        mov edx, dword [dword_179900]
        shl edi, cl
        add edx, eax
        lea ecx, [esi+edi]
        mov dword [byte ebp-0Ch], edx
        lea eax, [edx+ebx]
        dec ecx
        dec eax
        mov edx, esi
        push eax
        mov eax, unk_17D3E8
        mov dword [byte ebp-04h], ebx
        call FillBox
        cmp dword [dword_1798A8], byte 0
        je short .5
        mov dword [byte ebp-08h], 1Bh
        jmp short .6
.5:
        mov dword [byte ebp-08h], 0Ch
.6:
        mov eax, 2
        mov cl, byte [dword_1798A8]
        mov edx, dword [byte ebp-08h]
        shl eax, cl
        push dword 0ADh
        sub edx, eax
        push edx
        mov edx, edi
        sub edx, eax
        push edx
        push dword [byte ebp-04h]
        push esi
        call FillRect
        mov eax, 2
        mov edx, 4
        add esp, byte 14h
        mov cl, byte [dword_1798A8]
        mov ebx, edi
        push byte 4
        shl edx, cl
        shl eax, cl
        sub ebx, edx
        mov edx, dword [byte ebp-04h]
        push eax
        add edx, dword [byte ebp-08h]
        push ebx
        sub edx, eax
        push edx
        add eax, esi
        push eax
        call FillRect
        mov eax, 2
        mov edx, dword [byte ebp-08h]
        mov cl, byte [dword_1798A8]
        add esp, byte 14h
        shl eax, cl
        push byte 4
        sub edx, eax
        push edx
        mov edx, dword [byte ebp-04h]
        push eax
        add edx, eax
        add edi, esi
        push edx
        mov edx, edi
        sub edx, eax
        push edx
        call FillRect
        add esp, byte 14h
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        mov eax, dword [byte ebp-04h]
        mov ecx, dword [byte ebp-04h]
        inc dword [dword_177108]
        add esp, byte 10h
        add eax, dword [byte ebp-0Ch]
        mov ebx, edi
        push eax
        mov edx, esi
        mov eax, dword [dword_177108]
        call sub_5439F
        mov eax, dword [dword_177108]
        call sub_54391
        mov edi, eax
        cmp dword [byte ebp-02Ch], byte 0
        je short .7
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        jmp short .8
.7:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
.8:
        shr eax, 1Bh
        call LoadTeamLogo
        mov ecx, dword [byte_1798A4]
        movsx edx, word [byte eax+08h]
        inc ecx
        inc ecx
        mov ebx, 280h
        sar edx, cl
        mov cl, byte [byte_1798A4]
        sar ebx, cl
        mov ecx, ebx
        sub ecx, edx
        mov edx, ecx
        mov ecx, dword [byte_1798A4]
        movsx ebx, word [byte eax+0Ah]
        inc ecx
        sar ebx, cl
        mov ecx, ebx
        mov ebx, dword [byte ebp-04h]
        add ebx, ecx
        mov ecx, 1
        call DrawPanelLogo
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        cmp dword [dword_1798A8], byte 0
        je short .9
        mov eax, 4
        jmp short .10
.9:
        mov eax, 2
.10:
        mov edx, 6
        mov ebx, dword [byte edi+08h]
        mov cl, byte [byte_1798A4]
        add ebx, eax
        sar edx, cl
        mov eax, 7Dh
        add edx, dword [edi]
        call GetLangText
        call DrawColorText
        push dword [dword_179914]
        call TextSetFont
        add esp, byte 4
        push dword 0FFh
        push byte 41h
        call sub_AFFD0
        mov eax, 0Ah
        mov cl, byte [byte_1798A4]
        sar eax, cl
        add esi, eax
        mov eax, dword [dword_179908]
        mov ebx, dword [byte edi+0Ch]
        movsx edx, word [byte eax+06h]
        mov edi, 4
        sub ebx, edx
        sar edi, cl
        mov edx, ebx
        add esp, byte 8
        sub edx, edi
        push edx
        push esi
        push eax
        mov edi, edx
        call sub_AAA40
        add esp, byte 0Ch
        push dword [byte ebp-014h]
        push dword [byte ebp-010h]
        push str_2d02d2
        lea eax, [byte ebp-028h]
        push eax
        mov edx, 9
        call sprintf_
        mov eax, 4
        mov cl, byte [byte_1798A4]
        add esp, byte 10h
        sar eax, cl
        sar edx, cl
        inc eax
        add edx, esi
        lea ebx, [edi+eax]
        lea eax, [byte ebp-028h]
        call DrawText
        jmp near DrawOverlayCaption_E1
;-----------------------------------------------------------------------------
; DrawPowerPlayPanel                           5B456  96 PC, medium confidence
; With penalties on (gmode2 20h) and a penalty running (GetLowestPen), draws
; the penalty clock; 1 if drawn
;-----------------------------------------------------------------------------
DrawPowerPlayPanel:
        push edx
        mov ax, word [gmode2]
        xor ah, ah
        and al, 20h
        cwde
        test eax, eax
        je short .2
        call GetLowestPen
        cwde
        test eax, eax
        jle short .2
        movsx edx, word [gameclock]
        cmp edx, byte 14h
        jle short .2
        mov dl, byte [gmode]
        and dl, 1
        movsx edx, dl
        test edx, edx
        jne short .1
        cmp eax, byte 14h
        jg short .2
.1:
        mov edx, eax
        mov ax, word [gmode2]
        xor ah, ah
        and al, 40h
        cwde
        test eax, eax
        setne al
        movzx eax, al
        call DrawPenaltyClock
        mov eax, 1
        pop edx
        ret
.2:
        xor eax, eax
        pop edx
        ret
;-----------------------------------------------------------------------------
; DrawPlayerPctPanel                              5B4B6  96 PC, low confidence
; (queued kind 2): a player stat panel with "%d.%d%% (%d)" percentages
;-----------------------------------------------------------------------------
DrawPlayerPctPanel:
        push ebx
        push ecx
        push esi
        push edi
        enter 54h, 0
        mov esi, eax
        movsx ebx, word [word_165710]
        movsx eax, word [word_165846]
        sub ebx, eax
        mov eax, ebx
        test ebx, ebx
        jle short .1
        xor edi, edi
        jmp short .4
.1:
        jl short .3
.2:
        mov dword [esi], 0FFFFFFFFh
        mov dword [dword_11B2F4], 0FFFFFFFFh
        jmp near DrawOverlayCaption_E1
.3:
        mov edi, 1
.4:
        cmp dword [byte esi+08h], byte 0FFFFFFFFh
        jne short .5
        imul eax, edi, dword 136h
        movsx eax, word [dword eax+word_1656DC]
        mov dword [byte esi+08h], eax
.5:
        cmp dword [dword_11B2F4], byte 0
        jl short .6
        sub dword [dword_11B2F4], edx
        cmp dword [dword_11B2F4], byte 0
        jl short .2
.6:
        cmp dword [byte esi+08h], byte 0
        jle near .10
        cmp dword [dword_11B2F4], byte 0FFFFFFFFh
        jne short .7
        mov dword [dword_11B2F4], 1F4h
.7:
        mov ebx, 1
        mov eax, edi
        mov edx, ebx
        call OpenOverlayPanel
        test eax, eax
        je near DrawOverlayCaption_E1
        mov eax, dword [dword_177108]
        call sub_54391
        push dword [dword_179920]
        mov dword [byte ebp-04h], eax
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        cmp dword [dword_1798A8], byte 0
        je short .8
        mov ebx, 5
        jmp short .9
.8:
        xor ebx, ebx
.9:
        imul edi, dword 136h
        mov edx, 28h
        mov cl, byte [byte_1798A4]
        mov eax, dword [byte ebp-04h]
        sar edx, cl
        add ebx, dword [byte eax+08h]
        mov eax, dword [byte eax+04h]
        sub eax, edx
        mov edx, eax
        mov eax, 7Eh
        call GetLangText
        call DrawColorTextRight
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov edx, 6
        mov eax, 0ADh
        call SetTextColors
        push dword [byte esi+08h]
        movsx eax, word [dword edi+word_1656DA]
        push eax
        mov eax, 7Fh
        call GetLangText
        push eax
        lea eax, [byte ebp-054h]
        push eax
        call sprintf_
        mov eax, dword [byte ebp-04h]
        mov ebx, 8
        mov cl, byte [byte_1798A4]
        mov eax, dword [byte eax+0Ch]
        sar ebx, cl
        sub eax, dword [dword_1798FC]
        mov edx, dword [dword_11B320]
        sub eax, ebx
        add esp, byte 10h
        jmp near .20
.10:
        mov eax, dword [gameopts]
        mov edx, dword [byte eax+01h]
        and edx, 1F000h
        cmp edx, 1A000h
        jae near DrawOverlayCaption_E1
        mov eax, dword [byte eax+01h]
        and eax, 3E0000h
        cmp eax, 340000h
        jae near DrawOverlayCaption_E1
        cmp dword [dword_11B2F4], byte 0FFFFFFFFh
        jne short .11
        mov dword [dword_11B2F4], 44Ch
.11:
        push dword [dword_179920]
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        cmp dword [dword_11B2F4], 1F4h
        jg short .12
        mov eax, edi
        mov ebx, 2
        xor al, 1
        mov edx, ebx
        jmp short .13
.12:
        cmp dword [dword_11B2F4], 258h
        jle near DrawOverlayCaption_E1
        mov ebx, 3
        mov edx, 2
        mov eax, edi
.13:
        call OpenOverlayPanel
        test eax, eax
        je near DrawOverlayCaption_E1
        mov eax, dword [dword_177108]
        call sub_54391
        mov esi, eax
        cmp dword [dword_1798A8], byte 0
        je short .14
        mov ebx, 5
        jmp short .15
.14:
        xor ebx, ebx
.15:
        mov edx, 28h
        mov cl, byte [byte_1798A4]
        mov eax, dword [byte esi+04h]
        sar edx, cl
        sub eax, edx
        mov edx, eax
        mov eax, 80h
        add ebx, dword [byte esi+08h]
        call GetLangText
        call DrawColorTextRight
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov edx, 6
        mov eax, 0ADh
        call SetTextColors
        cmp dword [dword_11B2F4], 1F4h
        jge short .16
        mov eax, edi
        xor al, 1
        imul eax, dword 31Bh
        add eax, unk_157FDA
        add eax, byte 1Eh
        push eax
        mov eax, 81h
        jmp short .17
.16:
        imul eax, edi, dword 31Bh
        add eax, unk_157FDA
        add eax, byte 1Eh
        push eax
        mov eax, 82h
.17:
        call GetLangText
        push eax
        lea eax, [byte ebp-054h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        mov ebx, dword [dword_1798FC]
        mov eax, dword [byte esi+0Ch]
        add ebx, ebx
        sub eax, ebx
        mov cl, byte [byte_1798A4]
        mov ebx, eax
        mov eax, 8
        sar eax, cl
        mov edx, dword [dword_11B320]
        sub ebx, eax
        lea eax, [byte ebp-054h]
        call DrawColorTextCentred
        cmp dword [dword_11B2F4], 1F4h
        jge short .18
        xor di, byte 1
        shl edi, 4
        mov eax, dword [dword edi+dword_178298]
        mov ebx, 0Ah
        cdq
        idiv ebx
        push dword [dword edi+dword_178294]
        mov eax, dword [dword edi+dword_178298]
        push edx
        cdq
        idiv ebx
        push eax
        push str_DDD2
        jmp short .19
.18:
        shl edi, 4
        mov eax, dword [dword edi+dword_178290]
        mov ebx, 0Ah
        cdq
        idiv ebx
        push dword [dword edi+dword_17828C]
        mov eax, dword [dword edi+dword_178290]
        push edx
        cdq
        idiv ebx
        push eax
        push str_DDD3
.19:
        lea eax, [byte ebp-054h]
        push eax
        call sprintf_
        add esp, byte 14h
        mov ebx, 8
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        sub eax, ebx
        mov edx, dword [dword_11B320]
.20:
        mov ebx, eax
        lea eax, [byte ebp-054h]
        call DrawColorTextCentred
        jmp near DrawOverlayCaption_E1
;-----------------------------------------------------------------------------
; DrawClockPanel                               5B838  96 PC, medium confidence
; The power play panel or the game clock, with its show / hide timers
;-----------------------------------------------------------------------------
DrawClockPanel:
        push edx
        mov edx, eax
        call DrawPowerPlayPanel
        test eax, eax
        je short .1
        mov eax, 1
        pop edx
        ret
.1:
        cmp dword [dword_1798B8], byte 0
        jne short .2
        mov dword [dword_11B238], eax
.2:
        cmp dword [dword_11B238], byte 0
        jl short .3
        cmp dword [dword_11B23C], byte 0
        jg short .4
.3:
        mov dword [dword_11B238], 1770h
        xor eax, eax
        pop edx
        ret
.4:
        cmp dword [dword_11B238], byte 0
        jle short .6
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne near .15
        cmp dword [dword_11B2E8], byte 0
        je short .5
        cmp dword [dword_11B238], 1F4h
        jge near .15
        mov dword [dword_11B238], 1F4h
        xor eax, eax
        pop edx
        ret
.5:
        sub dword [dword_11B238], edx
        cmp dword [dword_11B238], byte 0
        jge near .16
        mov dword [dword_11B238], eax
.6:
        cmp dword [dword_11B2F8], byte 0
        jge short .7
        mov dword [dword_11B2F8], 1F4h
.7:
        cmp dword [dword_11B2F8], byte 0
        jge short .8
        cmp dword [dword_1798B8], byte 0
        jne near .15
.8:
        cmp dword [dword_1798B8], byte 0
        je short .10
        sub dword [dword_11B2F8], edx
        cmp dword [dword_11B2F8], byte 0
        jge short .10
        mov dword [dword_11B2F8], 0FFFFFFFFh
.9:
        mov dword [dword_11B238], 1770h
        mov dword [dword_11B2E8], 0
        xor eax, eax
        pop edx
        ret
.10:
        mov al, byte [gmode]
        and al, 1
        movsx eax, al
        test eax, eax
        jne short .9
        cmp dword [dword_1798A8], byte 0
        je short .11
        mov eax, 20Ch
        jmp short .12
.11:
        mov eax, 0FEh
.12:
        je short .13
        mov edx, 1ADh
        jmp short .14
.13:
        mov edx, 0AFh
.14:
        call DrawGameClock
        mov dword [dword_11B2E8], 1
.15:
        xor eax, eax
.16:
        pop edx
        ret
;-----------------------------------------------------------------------------
; DrawTimeLeftPanel                               5B97A  96 PC, low confidence
; The time-left panel at set minutes by period length (gameopts 600h bits; 7
; / 0Eh, 5, 2)
;-----------------------------------------------------------------------------
DrawTimeLeftPanel:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 60h, 0
        cmp dword [dword_11B238], byte 0
        je short .2
        cmp dword [dword_11B240], byte 0
        jge near .7
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        and eax, 600h
        cmp eax, 400h
        jne short .3
        cmp dword [dword_1798B8], byte 7
        je short .1
        cmp dword [dword_1798B8], byte 0Eh
        jne short .2
.1:
        cmp dword [dword_11B240], byte 0FFFFFFFFh
        jne near .6
        jmp short .5
.2:
        mov dword [dword_11B240], 0FFFFFFFFh
        jmp near .6
.3:
        cmp eax, 200h
        jne short .4
        cmp dword [dword_1798B8], byte 5
        jne near .6
        jmp short .1
.4:
        cmp dword [dword_1798B8], byte 2
        jne near .6
        cmp dword [dword_11B240], byte 0FFFFFFFFh
        jne near .6
.5:
        mov dword [dword_11B240], 0BB8h
.6:
        xor eax, eax
        jmp near InitGameView_709
.7:
        jle short .8
        sub dword [dword_11B240], eax
        cmp dword [dword_11B240], byte 0
        jge short .6
        mov dword [dword_11B240], 0
.8:
        cmp dword [dword_11B2FC], byte 0
        jge short .9
        mov dword [dword_11B2FC], 1F4h
.9:
        cmp dword [dword_11B2FC], byte 0
        jl short .6
        sub dword [dword_11B2FC], eax
        cmp dword [dword_11B2FC], byte 0
        jge short .10
        mov dword [dword_11B2FC], 0FFFFFFFFh
        mov dword [dword_11B240], 0FFFFFF9Dh
        jmp short .6
.10:
        push dword [dword_179920]
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        mov eax, 83h
        mov esi, 10h
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-060h]
        mov edi, 266h
        call strcpy_
        lea eax, [byte ebp-060h]
        mov cl, byte [byte_1798A4]
        push eax
        sar esi, cl
        call fputchar
        mov cl, byte [byte_1798A4]
        add esp, byte 4
        add eax, esi
        sar edi, cl
        mov dword [byte ebp-04h], eax
        sub edi, eax
        cmp dword [dword_1798A8], byte 0
        je short .11
        mov eax, 1E0h
        jmp short .12
.11:
        mov eax, 0C8h
.12:
        mov edx, 24h
        mov cl, byte [byte_1798A4]
        mov ebx, eax
        sar edx, cl
        sub ebx, edx
        mov esi, dword [dword_1798FC]
        mov edx, ebx
        mov ebx, 0Ch
        add esi, esi
        sar ebx, cl
        sub edx, dword [dword_1798FC]
        add esi, ebx
        sub edx, esi
        sub eax, edx
        sub eax, dword [dword_1798FC]
        mov esi, edx
        add edx, eax
        mov dword [byte ebp-0Ch], edx
        lea eax, [byte edx-01h]
        push eax
        mov eax, dword [byte ebp-04h]
        add eax, edi
        mov ebx, esi
        mov dword [byte ebp-08h], eax
        lea ecx, [byte eax-01h]
        mov edx, edi
        mov eax, unk_17D3E8
        call FillBox
        mov eax, 24h
        mov cl, byte [byte_1798A4]
        sar eax, cl
        mov cl, byte [dword_1798A8]
        mov dword [byte ebp-010h], eax
        mov eax, 2
        mov edx, dword [byte ebp-010h]
        shl eax, cl
        push dword 0ADh
        sub edx, eax
        push edx
        mov edx, dword [byte ebp-04h]
        sub edx, eax
        push edx
        push esi
        push edi
        call FillRect
        mov eax, 2
        mov edx, 4
        add esp, byte 14h
        mov ebx, dword [byte ebp-04h]
        mov cl, byte [dword_1798A8]
        push byte 4
        shl edx, cl
        shl eax, cl
        sub ebx, edx
        mov edx, dword [byte ebp-010h]
        push eax
        add edx, esi
        push ebx
        sub edx, eax
        push edx
        add eax, edi
        push eax
        call FillRect
        mov eax, 2
        mov edx, dword [byte ebp-010h]
        mov cl, byte [dword_1798A8]
        add esp, byte 14h
        shl eax, cl
        push byte 4
        sub edx, eax
        push edx
        push eax
        lea edx, [esi+eax]
        push edx
        mov edx, dword [byte ebp-08h]
        sub edx, eax
        push edx
        call FillRect
        mov ebx, dword [byte ebp-08h]
        inc dword [dword_177108]
        add esp, byte 14h
        mov ecx, esi
        mov edx, edi
        push dword [byte ebp-0Ch]
        mov eax, dword [dword_177108]
        call sub_5439F
        mov eax, dword [dword_177108]
        call sub_54391
        mov esi, eax
        cmp dword [dword_1798A8], byte 0
        je short .13
        mov eax, 5
        jmp short .14
.13:
        xor eax, eax
.14:
        mov edx, 6
        mov ebx, dword [byte esi+08h]
        mov cl, byte [byte_1798A4]
        add ebx, eax
        sar edx, cl
        lea eax, [byte ebp-060h]
        add edx, dword [esi]
        call DrawColorText
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov edx, 6
        mov eax, 0ADh
        call SetTextColors
        push unk_1582F5
        push str_3s
        lea eax, [byte ebp-060h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push unk_157FDA
        push str_3s
        lea eax, [byte ebp-038h]
        push eax
        mov edx, 6
        call sprintf_
        mov ebx, dword [dword_1798FC]
        mov eax, dword [byte esi+0Ch]
        add ebx, ebx
        mov cl, byte [byte_1798A4]
        sub eax, ebx
        add esp, byte 0Ch
        mov ebx, eax
        mov eax, 0Bh
        sar edx, cl
        sar eax, cl
        add edx, dword [esi]
        sub ebx, eax
        lea eax, [byte ebp-060h]
        call DrawColorText
        mov ebx, 7
        mov edx, 6
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        sar edx, cl
        sub eax, ebx
        add edx, dword [esi]
        mov ebx, eax
        lea eax, [byte ebp-038h]
        call DrawColorText
        movsx eax, word [awtmstruct]
        push eax
        push str_2d
        lea eax, [byte ebp-060h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        movsx eax, word [hmtmstruct]
        push eax
        push str_2d
        lea eax, [byte ebp-038h]
        push eax
        mov ebx, 0Bh
        call sprintf_
        mov eax, dword [dword_1798FC]
        mov edx, dword [byte esi+0Ch]
        add eax, eax
        mov cl, byte [byte_1798A4]
        sub edx, eax
        sar ebx, cl
        mov eax, edx
        sub eax, ebx
        mov edx, 6
        mov ebx, eax
        sar edx, cl
        mov eax, dword [byte esi+04h]
        sub eax, edx
        add esp, byte 0Ch
        mov edx, eax
        lea eax, [byte ebp-060h]
        call DrawColorTextRight
        mov ebx, 7
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        mov edx, 6
        sub eax, ebx
        sar edx, cl
        mov ebx, eax
        mov eax, dword [byte esi+04h]
        sub eax, edx
        mov edx, eax
        lea eax, [byte ebp-038h]
        call DrawColorTextRight
        mov eax, 1
        jmp near InitGameView_709
jpt_5BD6D:
        dd GetPeriodText_1F
        dd GetPeriodText_3C
        dd GetPeriodText_59
        dd GetPeriodText_86
;-----------------------------------------------------------------------------
; GetPeriodText                                   5BD7D  96 PC, low confidence
; (buf): copies the text 84h-8Bh for the game phase (gsp) and the score
;-----------------------------------------------------------------------------
GetPeriodText:
        push ebx
        push edx
        mov ebx, eax
        mov ax, word [gsp]
        cmp ax, 3
        ja near GetPeriodText_86.7
        movzx eax, ax
        jmp dword [nosplit cs:eax*4+jpt_5BD6D]
GetPeriodText_1F:
        cmp dword [dword_1798BC], byte 0
        je short .1
        mov eax, 84h
        jmp near GetPeriodText_86.8
.1:
        mov eax, 85h
        jmp near GetPeriodText_86.8
GetPeriodText_3C:
        cmp dword [dword_1798BC], byte 0
        je short .2
        mov eax, 86h
        jmp near GetPeriodText_86.8
.2:
        mov eax, 87h
        jmp near GetPeriodText_86.8
GetPeriodText_59:
        cmp dword [dword_1798BC], byte 0
        je short .5
        mov ax, word [word_1656E8]
        cmp ax, word [word_16581E]
        jne short .4
.3:
        mov eax, 88h
        jmp short GetPeriodText_86.8
.4:
        mov eax, 89h
        jmp short GetPeriodText_86.8
.5:
        mov eax, 8Ah
        jmp short GetPeriodText_86.8
GetPeriodText_86:
        mov ax, word [word_1656E8]
        cmp ax, word [word_16581E]
        jne short .6
        cmp dword [dword_1798BC], byte 0
        je short GetPeriodText_59.3
        mov eax, dword [optflags]
        and eax, byte 70h
        cmp eax, byte 20h
        je short GetPeriodText_59.3
.6:
        mov eax, 8Bh
        jmp short .8
.7:
        mov eax, 89h
.8:
        call GetLangText
        mov edx, eax
        mov eax, ebx
        call strcpy_
        pop edx
        pop ebx
        ret
jpt_5BE45:
        dd DrawScorePanel_689
        dd DrawScorePanel_690
        dd DrawScorePanel_697
        dd DrawScorePanel_69E
;-----------------------------------------------------------------------------
; DrawScorePanel                                  5BE55  96 PC, low confidence
; The teams' panel "%-12s %2d %-3s" (name, score, shots)
;-----------------------------------------------------------------------------
DrawScorePanel:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 60h, 0
        mov dl, byte [gmode]
        and dl, 80h
        movsx edx, dl
        test edx, edx
        jne near InitGameView_709
        mov dl, byte [gmode]
        and dl, 1
        movsx edx, dl
        test edx, edx
        jne short .1
        cmp dword [dword_11B23C], byte 0FFFFFFFFh
        jne near .11
        cmp dword [dword_11B300], byte 0
        jl near .11
.1:
        cmp dword [dword_11B23C], byte 0
        je short .2
        cmp dword [dword_11B300], byte 0FFFFFFFEh
        jne short .3
.2:
        mov dword [dword_11B2E8], 0
        mov dword [dword_11B23C], 1F40h
        jmp near InitGameView_709
.3:
        cmp dword [dword_11B23C], byte 0
        jle short .4
        cmp dword [dword_11B23C], 3E8h
        jle short .5
.4:
        cmp dword [dword_1798B8], byte 0
        jne short .6
        cmp dword [dword_11B23C], byte 0FFFFFFFEh
        je short .6
.5:
        mov dword [dword_11B23C], 0FFFFFFFFh
.6:
        cmp dword [dword_11B23C], byte 0FFFFFFFFh
        jne near InitGameView_709
        cmp dword [dword_11B300], byte 0FFFFFFFFh
        jne short .7
        mov dword [dword_11B300], 1F4h
.7:
        cmp dword [dword_11B300], byte 0
        jl short .8
        sub dword [dword_11B300], eax
        cmp dword [dword_11B300], byte 0
        jge short .8
        mov dword [dword_11B300], 0FFFFFFFEh
        jmp near InitGameView_709
.8:
        mov ebx, 4
        mov edx, 2
        mov eax, 0FFFFFFFFh
        call OpenOverlayPanel
        test eax, eax
        je near InitGameView_709
        mov eax, dword [dword_177108]
        call sub_54391
        push dword [dword_179918]
        mov esi, eax
        mov edi, eax
        call TextSetFont
        add esp, byte 4
        mov edx, 6
        mov eax, 0ADh
        call SetTextColors
        push unk_158313
        push str_12s
        lea eax, [byte ebp-060h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push unk_157FF8
        push str_12s
        lea eax, [byte ebp-038h]
        push eax
        mov ebx, 0Ch
        call sprintf_
        mov eax, dword [dword_1798FC]
        mov edx, dword [byte esi+0Ch]
        add eax, eax
        mov cl, byte [byte_1798A4]
        sub edx, eax
        sar ebx, cl
        mov eax, edx
        add esp, byte 0Ch
        sub eax, ebx
        mov edx, 72h
        mov ebx, eax
        sar edx, cl
        lea eax, [byte ebp-060h]
        add edx, dword [esi]
        call DrawColorText
        mov ebx, 8
        mov edx, 72h
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        sar edx, cl
        sub eax, ebx
        add edx, dword [esi]
        mov ebx, eax
        lea eax, [byte ebp-038h]
        call DrawColorText
        movsx eax, word [word_16581E]
        push eax
        push str_2d
        lea eax, [byte ebp-060h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        movsx eax, word [word_1656E8]
        push eax
        push str_2d
        lea eax, [byte ebp-038h]
        push eax
        mov edx, 13Ch
        call sprintf_
        mov ebx, dword [dword_1798FC]
        mov eax, dword [byte esi+0Ch]
        add ebx, ebx
        mov cl, byte [byte_1798A4]
        sub eax, ebx
        add esp, byte 0Ch
        mov ebx, eax
        mov eax, 0Ch
        sar edx, cl
        sar eax, cl
        add edx, dword [esi]
        sub ebx, eax
        lea eax, [byte ebp-060h]
        call DrawColorTextRight
        mov ebx, 8
        mov edx, 13Ch
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        sar edx, cl
        sub eax, ebx
        add edx, dword [esi]
        mov ebx, eax
        lea eax, [byte ebp-038h]
        call DrawColorTextRight
        lea eax, [byte ebp-060h]
        call GetPeriodText
        push dword [dword_179920]
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        cmp dword [dword_1798A8], byte 0
        je short .9
        mov ebx, 5
        jmp short .10
.9:
        xor ebx, ebx
.10:
        mov edx, 28h
        mov cl, byte [byte_1798A4]
        mov eax, dword [byte edi+04h]
        sar edx, cl
        sub eax, edx
        add ebx, dword [byte edi+08h]
        mov edx, eax
        lea eax, [byte ebp-060h]
        call DrawColorTextRight
        movsx eax, word [gsp]
        cmp eax, byte 4
        je near InitGameView_709
        mov eax, dword [dword_179908]
        mov ebx, dword [byte edi+0Ch]
        movsx edx, word [byte eax+06h]
        sub ebx, edx
        lea edx, [byte ebx-02h]
        movsx ebx, word [byte eax+04h]
        mov eax, dword [byte edi+04h]
        sub eax, ebx
        mov cl, byte [byte_1798A4]
        mov ebx, eax
        mov eax, 4
        sar eax, cl
        sub ebx, eax
        mov eax, ebx
        call DrawGameClock
        jmp near InitGameView_709
.11:
        cmp dword [dword_11B23C], byte 0
        jl short .12
        cmp dword [dword_11B300], byte 0FFFFFFFEh
        jne short .13
.12:
        mov dword [dword_11B23C], 1F40h
        mov dword [dword_11B300], 0FFFFFFFFh
        jmp near InitGameView_709
.13:
        cmp dword [dword_11B23C], byte 0
        jle short .15
        cmp dword [dword_11B2E8], byte 0
        je short .14
        cmp dword [dword_11B23C], 1F4h
        jge near InitGameView_709
        mov dword [dword_11B23C], 1F4h
        jmp near InitGameView_709
.14:
        sub dword [dword_11B23C], eax
        cmp dword [dword_11B23C], byte 0
        jge near InitGameView_709
        mov dword [dword_11B23C], 0
.15:
        cmp dword [dword_11B300], byte 0
        jge short .16
        mov dword [dword_11B300], 1F4h
.16:
        cmp dword [dword_11B300], byte 0
        jl near InitGameView_709
        sub dword [dword_11B300], eax
        cmp dword [dword_11B300], byte 0
        jge short .17
        mov dword [dword_11B300], 0FFFFFFFFh
        mov dword [dword_11B23C], 0FFFFFFFFh
        mov dword [dword_11B2E8], 0
        jmp near InitGameView_709
.17:
        mov eax, dword [dword_179908]
        mov cl, byte [byte_1798A4]
        movsx edx, word [byte eax+04h]
        mov eax, 6Ah
        sar eax, cl
        add edx, eax
        mov dword [byte ebp-04h], edx
        cmp dword [dword_1798A8], byte 0
        je short .18
        mov edi, 280h
        sub edi, edx
        sub edi, byte 14h
        jmp short .19
.18:
        mov edi, 140h
        sub edi, edx
        sub edi, byte 0Ah
.19:
        mov eax, dword [dword_179908]
        movsx edx, word [byte eax+06h]
        mov eax, dword [dword_1798FC]
        add eax, eax
        add edx, eax
        mov eax, dword [dword_17992C]
        sar eax, 1
        add eax, edx
        cmp dword [dword_1798A8], byte 0
        je short .20
        mov esi, 1E0h
        sub esi, eax
        sub esi, byte 0Ah
        jmp short .21
.20:
        mov esi, 0C8h
        sub esi, eax
        sub esi, byte 5
.21:
        lea edx, [esi+eax]
        mov dword [byte ebp-0Ch], edx
        lea eax, [byte edx-01h]
        push eax
        mov eax, dword [byte ebp-04h]
        add eax, edi
        mov ebx, esi
        mov dword [byte ebp-08h], eax
        lea ecx, [byte eax-01h]
        mov edx, edi
        mov eax, unk_17D3E8
        call FillBox
        mov eax, 24h
        mov cl, byte [byte_1798A4]
        sar eax, cl
        mov cl, byte [dword_1798A8]
        mov dword [byte ebp-010h], eax
        mov eax, 2
        mov edx, dword [byte ebp-010h]
        shl eax, cl
        push dword 0ADh
        sub edx, eax
        push edx
        mov edx, dword [byte ebp-04h]
        sub edx, eax
        push edx
        push esi
        push edi
        call FillRect
        mov eax, 2
        mov edx, 4
        add esp, byte 14h
        mov ebx, dword [byte ebp-04h]
        mov cl, byte [dword_1798A8]
        push byte 4
        shl edx, cl
        shl eax, cl
        sub ebx, edx
        mov edx, dword [byte ebp-010h]
        push eax
        add edx, esi
        push ebx
        sub edx, eax
        push edx
        add eax, edi
        push eax
        call FillRect
        mov eax, 2
        mov edx, dword [byte ebp-010h]
        mov cl, byte [dword_1798A8]
        add esp, byte 14h
        shl eax, cl
        push byte 4
        sub edx, eax
        push edx
        push eax
        lea edx, [esi+eax]
        push edx
        mov edx, dword [byte ebp-08h]
        sub edx, eax
        push edx
        call FillRect
        mov ebx, dword [byte ebp-08h]
        inc dword [dword_177108]
        add esp, byte 14h
        mov ecx, esi
        mov edx, edi
        push dword [byte ebp-0Ch]
        mov eax, dword [dword_177108]
        call sub_5439F
        mov eax, dword [dword_177108]
        call sub_54391
        mov esi, eax
        mov edi, eax
        mov eax, dword [dword_179908]
        mov edx, dword [byte esi+0Ch]
        movsx eax, word [byte eax+06h]
        mov cl, byte [byte_1798A4]
        sub edx, eax
        mov eax, 4
        sar eax, cl
        dec edx
        dec edx
        add eax, dword [esi]
        call DrawGameClock
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov edx, 6
        mov eax, 0ADh
        call SetTextColors
        push unk_1582F5
        push str_3s
        lea eax, [byte ebp-060h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push unk_157FDA
        push str_3s
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        mov eax, dword [dword_179908]
        mov edx, dword [byte esi+0Ch]
        movsx ebx, word [byte eax+06h]
        sub edx, ebx
        mov cl, byte [byte_1798A4]
        lea ebx, [byte edx-01h]
        movsx eax, word [byte eax+04h]
        mov edx, 8
        add eax, dword [esi]
        sar edx, cl
        add esp, byte 0Ch
        add edx, eax
        lea eax, [byte ebp-060h]
        call DrawColorText
        mov eax, dword [dword_179908]
        mov ebx, dword [byte esi+0Ch]
        movsx edx, word [byte eax+06h]
        sub ebx, edx
        mov cl, byte [byte_1798A4]
        mov edx, ebx
        mov ebx, dword [dword_1798FC]
        add edx, dword [dword_1798FC]
        sar ebx, 1
        movsx eax, word [byte eax+04h]
        add ebx, edx
        mov edx, 8
        add eax, dword [esi]
        sar edx, cl
        dec ebx
        add edx, eax
        lea eax, [byte ebp-038h]
        call DrawColorText
        movsx eax, word [word_16581E]
        push eax
        push str_2d
        lea eax, [byte ebp-060h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        movsx eax, word [word_1656E8]
        push eax
        push str_2d
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        mov eax, dword [dword_179908]
        mov cl, byte [byte_1798A4]
        add esp, byte 0Ch
        mov ebx, dword [byte esi+0Ch]
        movsx edx, word [byte eax+06h]
        movsx eax, word [byte eax+04h]
        sub ebx, edx
        mov edx, 34h
        add eax, dword [esi]
        sar edx, cl
        dec ebx
        add edx, eax
        lea eax, [byte ebp-060h]
        call DrawColorText
        mov eax, dword [dword_179908]
        mov ebx, dword [byte esi+0Ch]
        movsx edx, word [byte eax+06h]
        sub ebx, edx
        mov edx, ebx
        mov ebx, dword [dword_1798FC]
        add edx, dword [dword_1798FC]
        sar ebx, 1
        add edx, ebx
        mov cl, byte [byte_1798A4]
        lea ebx, [byte edx-01h]
        movsx eax, word [byte eax+04h]
        mov edx, 34h
        add eax, dword [esi]
        sar edx, cl
        add edx, eax
        lea eax, [byte ebp-038h]
        call DrawColorText
        mov ax, word [gsp]
        cmp ax, 3
        ja short DrawScorePanel_69E.23
        movzx eax, ax
        jmp dword [nosplit cs:eax*4+jpt_5BE45]
DrawScorePanel_689:
        mov eax, 85h
        jmp short DrawScorePanel_69E.22
DrawScorePanel_690:
        mov eax, 87h
        jmp short DrawScorePanel_69E.22
DrawScorePanel_697:
        mov eax, 8Ah
        jmp short DrawScorePanel_69E.22
DrawScorePanel_69E:
        mov eax, 88h
.22:
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-060h]
        call strcpy_
.23:
        push dword [dword_179920]
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        cmp dword [dword_1798A8], byte 0
        je short .24
        mov ebx, 5
        jmp short .25
.24:
        xor ebx, ebx
.25:
        mov edx, 4
        mov cl, byte [byte_1798A4]
        lea eax, [byte ebp-060h]
        sar edx, cl
        add ebx, dword [byte edi+08h]
        add edx, dword [edi]
        call DrawColorText
        mov dword [dword_11B2E8], 1
        jmp near InitGameView_709
;-----------------------------------------------------------------------------
; sub_5C55F                                                       5C55F  96 PC
;-----------------------------------------------------------------------------
sub_5C55F:
        push ebx
        push ecx
        push edx
        push esi
        cmp byte [byte_16561C], 0
        je near .5
        mov ebx, 5
        mov edx, 1
        mov eax, dword [dword_1798AC]
        call OpenOverlayPanel
        test eax, eax
        je near .5
        mov eax, dword [dword_177108]
        call sub_54391
        push dword [dword_179920]
        mov esi, eax
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        cmp dword [dword_1798A8], byte 0
        je short .1
        mov ebx, 5
        jmp short .2
.1:
        xor ebx, ebx
.2:
        mov eax, byte_16561C
        mov edx, dword [dword_11B320]
        add ebx, dword [byte esi+08h]
        call DrawColorTextCentred
        cmp dword [dword_1798A8], byte 0
        je short .3
        mov ebx, 5
        jmp short .4
.3:
        xor ebx, ebx
.4:
        mov edx, 28h
        mov cl, byte [byte_1798A4]
        mov eax, dword [byte esi+04h]
        sar edx, cl
        sub eax, edx
        add ebx, dword [byte esi+08h]
        mov edx, eax
        mov eax, byte_1655E0
        call DrawColorTextRight
        push dword [dword_179918]
        call TextSetFont
        mov edx, 6
        add esp, byte 4
        mov eax, 0ADh
        mov ebx, 8
        call SetTextColors
        mov esi, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub esi, dword [dword_1798FC]
        sar ebx, cl
        mov eax, byte_1655A4
        sub esi, ebx
        mov edx, dword [dword_11B320]
        mov ebx, esi
        call DrawColorTextCentred
        mov dword [dword_11B238], 1770h
        mov dword [dword_11B2E8], 0
        mov dword [dword_11B23C], 1F40h
.5:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawPlayerNamePanel                             5C677  96 PC, low confidence
; (queued kind 3): a player's name panel (FormatPlayerName)
;-----------------------------------------------------------------------------
DrawPlayerNamePanel:
        push ebx
        push ecx
        push esi
        push edi
        enter 28h, 0
        mov esi, eax
        cmp dword [dword_11B304], byte 0FFFFFFFFh
        jne short .1
        mov dword [dword_11B304], 1F4h
.1:
        cmp dword [dword_11B304], byte 0
        jl short .2
        sub dword [dword_11B304], edx
        cmp dword [dword_11B304], byte 0
        jge short .2
        mov dword [esi], 0FFFFFFFFh
        mov dword [dword_11B304], 0FFFFFFFFh
        jmp near DrawOverlayCaption_E1
.2:
        mov ebx, 6
        mov edx, 1
        mov eax, dword [byte esi+0Ch]
        call OpenOverlayPanel
        test eax, eax
        je near DrawOverlayCaption_E1
        mov eax, dword [dword_177108]
        call sub_54391
        imul ebx, dword [byte esi+0Ch], dword 4B4h
        imul edx, dword [byte esi+08h], byte 2Bh
        mov edi, eax
        mov eax, hmroster
        add eax, ebx
        add eax, edx
        push unk_111024
        lea ecx, [byte eax+017h]
        movzx ebx, byte [dword edx+ebx+byte_157191]
        push ecx
        lea ecx, [byte eax+07h]
        mov edx, unk_111024
        lea eax, [byte ebp-028h]
        call FormatPlayerName
        push dword [dword_179920]
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        cmp dword [dword_1798A8], byte 0
        je short .3
        mov ebx, 5
        jmp short .4
.3:
        xor ebx, ebx
.4:
        mov edx, 28h
        mov cl, byte [byte_1798A4]
        mov eax, dword [byte edi+04h]
        sar edx, cl
        sub eax, edx
        add ebx, dword [byte edi+08h]
        mov edx, eax
        lea eax, [byte ebp-028h]
        call DrawColorTextRight
        cmp dword [byte esi+010h], byte 0
        jle short .5
        mov eax, 90h
        jmp short .6
.5:
        mov eax, 91h
.6:
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-028h]
        call strcpy_
        push dword [dword_179918]
        call TextSetFont
        mov edx, 6
        add esp, byte 4
        mov eax, 0ADh
        mov ebx, 8
        call SetTextColors
        mov edx, 0A4h
        lea eax, [byte ebp-028h]
        mov esi, dword [byte edi+0Ch]
        mov cl, byte [byte_1798A4]
        sub esi, dword [dword_1798FC]
        sar ebx, cl
        sar edx, cl
        sub esi, ebx
        add edx, dword [edi]
        mov ebx, esi
        call DrawColorText
        mov dword [dword_11B23C], 1F40h
        jmp near DrawOverlayCaption_E1
;-----------------------------------------------------------------------------
; sub_5C7E2                                                       5C7E2  96 PC
;-----------------------------------------------------------------------------
sub_5C7E2:
        push ebx
        push ecx
        push edx
        push esi
        cmp byte [byte_1655A4], 0
        je near .9
        mov eax, 20h
        call GetLangText
        mov edx, eax
        mov eax, byte_1655E0
        call strcmp_
        test eax, eax
        jne near .5
        mov ebx, 7
        mov edx, 1
        mov eax, dword [dword_1798AC]
        call OpenOverlayPanel
        test eax, eax
        je near .9
        mov eax, dword [dword_177108]
        call sub_54391
        push dword [dword_179920]
        mov esi, eax
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        cmp dword [dword_1798A8], byte 0
        je short .1
        mov eax, 5
        jmp short .2
.1:
        xor eax, eax
.2:
        mov ebx, dword [byte esi+08h]
        mov edx, dword [dword_11B320]
        add ebx, eax
        mov eax, byte_1655E0
        call DrawColorTextCentred
        cmp dword [dword_1798A8], byte 0
        je short .3
        mov ebx, 5
        jmp short .4
.3:
        xor ebx, ebx
.4:
        mov edx, 28h
        mov cl, byte [byte_1798A4]
        mov eax, dword [byte esi+04h]
        sar edx, cl
        sub eax, edx
        add ebx, dword [byte esi+08h]
        mov edx, eax
        mov eax, byte_165694
        call DrawColorTextRight
        push dword [dword_179918]
        call TextSetFont
        mov edx, 6
        add esp, byte 4
        mov eax, 0ADh
        mov ebx, 8
        call SetTextColors
        mov edx, 72h
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        sar edx, cl
        sub eax, ebx
        add edx, dword [esi]
        mov ebx, eax
        mov eax, byte_1655A4
        call DrawColorText
        jmp near .8
.5:
        cmp dword [dword_11B310], byte 0FFFFFFFFh
        je near .8
        mov edx, 2
        mov ebx, dword [dword_1798AC]
        mov eax, dword [dword_1798AC]
        add ebx, byte 8
        call OpenOverlayPanel
        test eax, eax
        je near .9
        mov eax, dword [dword_177108]
        call sub_54391
        push dword [dword_179920]
        mov esi, eax
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        cmp dword [dword_1798A8], byte 0
        je short .6
        mov eax, 5
        jmp short .7
.6:
        xor eax, eax
.7:
        mov edx, 28h
        mov ebx, dword [byte esi+08h]
        mov cl, byte [byte_1798A4]
        add ebx, eax
        sar edx, cl
        mov eax, dword [byte esi+04h]
        sub eax, edx
        mov edx, eax
        mov eax, byte_1655A4
        call DrawColorTextRight
        push dword [dword_179918]
        call TextSetFont
        mov edx, 6
        add esp, byte 4
        mov eax, 0ADh
        mov ebx, 0Ch
        call SetTextColors
        mov eax, dword [dword_1798FC]
        mov edx, dword [byte esi+0Ch]
        add eax, eax
        mov cl, byte [byte_1798A4]
        sub edx, eax
        sar ebx, cl
        mov eax, edx
        sub eax, ebx
        mov edx, 72h
        mov ebx, eax
        sar edx, cl
        mov eax, byte_1655E0
        add edx, dword [esi]
        call DrawColorText
        mov ebx, 8
        mov edx, 72h
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        sar edx, cl
        sub eax, ebx
        add edx, dword [esi]
        mov ebx, eax
        mov eax, byte_165658
        call DrawColorText
        mov ebx, 8
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        mov edx, 28h
        sub eax, ebx
        sar edx, cl
        mov ebx, eax
        mov eax, dword [byte esi+04h]
        sub eax, edx
        mov edx, eax
        mov eax, byte_165694
        call DrawColorTextRight
.8:
        mov dword [dword_11B238], 1770h
        mov dword [dword_11B2E8], 0
        mov dword [dword_11B23C], 1F40h
.9:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_5CA5B                                                       5CA5B  96 PC
;-----------------------------------------------------------------------------
sub_5CA5B:
        push ebx
        push ecx
        push edx
        push esi
        enter 50h, 0
        cmp byte [byte_16561C], 0
        je near .7
        cmp byte [byte_165694], 0
        jne short .1
        mov ebx, 9
        mov edx, 1
        jmp short .2
.1:
        mov ebx, 9
        mov edx, 2
.2:
        mov eax, dword [dword_1798AC]
        call OpenOverlayPanel
        test eax, eax
        je near .7
        mov eax, dword [dword_177108]
        call sub_54391
        push dword [dword_179920]
        mov esi, eax
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        push byte_1655A4
        push byte_16561C
        push str_SS2
        lea eax, [byte ebp-050h]
        push eax
        call sprintf_
        add esp, byte 10h
        cmp dword [dword_1798A8], byte 0
        je short .3
        mov ebx, 5
        jmp short .4
.3:
        xor ebx, ebx
.4:
        mov edx, 28h
        mov cl, byte [byte_1798A4]
        mov eax, dword [byte esi+04h]
        sar edx, cl
        sub eax, edx
        add ebx, dword [byte esi+08h]
        mov edx, eax
        lea eax, [byte ebp-050h]
        call DrawColorTextRight
        push dword [dword_179918]
        call TextSetFont
        add esp, byte 4
        mov edx, 6
        mov eax, 0ADh
        call SetTextColors
        cmp byte [byte_165694], 0
        jne short .5
        mov ebx, 8
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        sub eax, ebx
        mov edx, dword [dword_11B320]
        mov ebx, eax
        mov eax, byte_1655E0
        jmp short .6
.5:
        mov ebx, 0Ch
        mov eax, dword [dword_1798FC]
        mov edx, dword [byte esi+0Ch]
        add eax, eax
        mov cl, byte [byte_1798A4]
        sub edx, eax
        sar ebx, cl
        mov eax, edx
        sub eax, ebx
        mov edx, dword [dword_11B320]
        mov ebx, eax
        mov eax, byte_1655E0
        call DrawColorTextCentred
        mov ebx, 8
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        sub eax, ebx
        mov edx, dword [dword_11B320]
        mov ebx, eax
        mov eax, byte_165694
.6:
        call DrawColorTextCentred
        mov ebx, 8
        mov eax, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub eax, dword [dword_1798FC]
        sar ebx, cl
        mov edx, 28h
        sub eax, ebx
        sar edx, cl
        mov ebx, eax
        mov eax, dword [byte esi+04h]
        sub eax, edx
        mov edx, eax
        mov eax, byte_165658
        call DrawColorTextRight
        mov dword [dword_11B238], 1770h
        mov dword [dword_11B2E8], 0
        mov dword [dword_11B23C], 0FFFFFFFFh
.7:
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; QueueOverlayPanel                            5CC12  96 PC, medium confidence
; (kind, a, b, c): puts a panel in a free slot of the 3-panel queue (kind 3
; waits 2EE0h), from BuildEventLines
;-----------------------------------------------------------------------------
QueueOverlayPanel:
        push esi
        enter 4, 0
        mov esi, eax
        mov dword [byte ebp-04h], edx
        mov eax, unk_11B2AC
        xor edx, edx
        jmp short .5
.1:
        cmp dword [eax], byte 0
        jge short .4
        cmp esi, byte 2
        jb short .3
        jbe short .2
        cmp esi, byte 3
        jne short .3
        mov dword [eax], 2EE0h
        jmp short .3
.2:
        mov dword [eax], 1
.3:
        mov dword [byte eax+04h], esi
        mov dword [byte eax+0Ch], ebx
        mov edx, dword [byte ebp-04h]
        mov dword [byte eax+010h], ecx
        mov dword [byte eax+08h], edx
        leave
        pop esi
        ret
.4:
        inc edx
        add eax, byte 14h
.5:
        cmp edx, byte 3
        jl short .1
        leave
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawGameOverlays                             5CC62  96 PC, medium confidence
; (ticks): per frame draws the overlay for the view state (byte_179DC1 9,
; 0Dh, 11h), the queued panels, the clock, time-left and score panels
;-----------------------------------------------------------------------------
DrawGameOverlays:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        movzx eax, byte [byte_179DC1]
        cmp eax, byte 12h
        je near .12
        movsx eax, word [word_119111]
        cmp eax, byte 0FFFFFFFFh
        je short .1
        call DrawOverlayCaption
.1:
        mov edx, ecx
        mov eax, ebx
        call DrawTimedPanel
        mov al, byte [byte_179DC1]
        cmp al, 0Dh
        jb short .2
        jbe short .3
        cmp al, 0Fh
        jb short .6
        jbe near .12
        cmp al, 11h
        je short .5
        jmp short .6
.2:
        cmp al, 9
        je short .4
        jmp short .6
.3:
        call sub_5CA5B
        pop ecx
        pop ebx
        ret
.4:
        call sub_5C7E2
        pop ecx
        pop ebx
        ret
.5:
        call sub_5C55F
        pop ecx
        pop ebx
        ret
.6:
        mov eax, unk_11B2AC
        xor ecx, ecx
        jmp short .11
.7:
        cmp dword [eax], byte 0
        jle short .8
        sub dword [eax], ebx
        cmp dword [eax], byte 0
        jge short .8
        mov dword [eax], 0
.8:
        cmp dword [eax], byte 0
        jne short .10
        mov ecx, dword [byte eax+04h]
        cmp ecx, byte 2
        jb short .12
        jbe short .9
        cmp ecx, byte 3
        jne short .12
        mov edx, ebx
        call DrawPlayerNamePanel
        pop ecx
        pop ebx
        ret
.9:
        mov edx, ebx
        call DrawPlayerPctPanel
        pop ecx
        pop ebx
        ret
.10:
        inc ecx
        add eax, byte 14h
.11:
        cmp ecx, byte 3
        jl short .7
        mov eax, ebx
        call DrawClockPanel
        test eax, eax
        jne short .12
        mov eax, ebx
        call DrawTimeLeftPanel
        test eax, eax
        jne short .12
        mov eax, ebx
        call DrawScorePanel
.12:
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push esi
        mov esi, eax
        mov ebx, edx
        xor ecx, ecx
.13:
        movsx edx, cx
        movsx eax, si
        call TeamLineEnergy
        cwde
        sub eax, byte 60h
        inc ecx
        mov dword [ebx], eax
        add ebx, byte 4
        cmp ecx, byte 8
        jl short .13
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawLineEnergyBar                            5CD5E  96 PC, medium confidence
; (team, line): one line's energy bar in a line change box
;-----------------------------------------------------------------------------
DrawLineEnergyBar:
        push esi
        push edi
        enter 14h, 0
        push eax
        push edx
        lea edi, [byte ebp-014h]
        mov eax, ebx
        mov esi, unk_5848C
        shl eax, 2
        movsd
        movsd
        movsd
        movsd
        movsd
        test edx, edx
        je short .1
        mov eax, dword [dword eax+dword_1797DC]
        jmp short .2
.1:
        mov eax, dword [dword eax+dword_1797BC]
.2:
        mov ebx, 32h
        cdq
        idiv ebx
        mov ebx, 14h
        mov esi, eax
        cdq
        idiv ebx
        mov edx, 6
        mov edi, dword [byte ebp+eax*4-014h]
        test ecx, ecx
        je short .3
        mov eax, 41h
        jmp short .4
.3:
        mov eax, 3
.4:
        call SetTextColors
        cmp dword [byte ebp-01Ch], byte 0
        je short .5
        mov eax, 8
        jmp short .6
.5:
        mov eax, 50h
.6:
        mov cl, byte [byte_1798A4]
        sar eax, cl
        add dword [byte ebp+010h], eax
        mov ebx, dword [byte ebp+014h]
        mov edx, dword [byte ebp+010h]
        mov eax, dword [byte ebp-018h]
        call DrawColorText
        mov eax, dword [byte ebp+014h]
        mov edx, 1Ah
        mov cl, byte [byte_1798A4]
        add eax, dword [dword_1798FC]
        sar edx, cl
        push eax
        mov eax, 50h
        add edx, dword [byte ebp+010h]
        sar eax, cl
        lea ecx, [eax+edx]
        mov ebx, dword [byte ebp+014h]
        mov eax, unk_17D3E8
        call FillBox
        push edi
        mov cl, byte [byte_1798A4]
        push dword [dword_1798FC]
        sar esi, cl
        mov eax, 1Ah
        push esi
        sar eax, cl
        push dword [byte ebp+014h]
        add eax, dword [byte ebp+010h]
        push eax
        call FillRect
        add esp, byte 14h
        leave
        pop edi
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; DrawLineChangeBox                            5CE42  96 PC, medium confidence
; (team): the line change box (lcboxon, lcline, "1"-"4") with the team logo
; and line energies
;-----------------------------------------------------------------------------
DrawLineChangeBox:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 50h, 0
        mov edi, eax
        test eax, eax
        je short .1
        mov eax, dword [dword_179928]
        jmp short .2
.1:
        mov eax, dword [dword_17990C]
.2:
        mov dword [byte ebp-04h], eax
        test byte [byte_17CA5D], 20h
        setne al
        movzx eax, al
        mov dword [byte ebp-010h], eax
        test eax, eax
        sete al
        movzx eax, al
        mov dword [byte_1798A4], eax
        mov eax, dword [byte ebp-04h]
        shl eax, 2
        test edi, edi
        je short .3
        mov eax, dword [dword eax+dword_1797DC]
        jmp short .4
.3:
        mov eax, dword [dword eax+dword_1797BC]
.4:
        mov ebx, 32h
        cdq
        idiv ebx
        mov edx, eax
        cmp word [nosplit edi*2+lcboxon], byte 0
        jne short .5
        mov eax, edi
        shl eax, 2
        cmp dword [dword eax+dword_1797B4], byte 0
        jne short .5
        cmp edx, ebx
        jge near .41
.5:
        lea eax, [edi+edi]
        cmp word [dword eax+lcboxon], byte 0
        je short .6
        movsx eax, word [dword eax+lcline]
        mov dword [byte ebp-04h], eax
.6:
        mov eax, edi
        shl eax, 2
        cmp dword [dword eax+dword_1797B4], byte 0
        je near .11
        cmp dword [dword eax+dword_1797AC], byte 0
        jge short .7
        mov dword [dword eax+dword_1797AC], 32h
        jmp short .8
.7:
        dec dword [dword eax+dword_1797AC]
        cmp dword [dword eax+dword_1797AC], byte 0
        jge short .8
        mov dword [dword eax+dword_11B308], 0
        mov dword [dword eax+dword_1797B4], 0
        jmp near .42
.8:
        mov eax, dword [nosplit edi*4+dword_1797AC]
        mov ebx, 6
        cdq
        idiv ebx
        cmp dword [nosplit edi*4+dword_1797AC], byte 26h
        jle short .9
        cmp edx, byte 3
        jge short .10
.9:
        cmp dword [nosplit edi*4+dword_1797AC], byte 32h
        jne short .11
.10:
        mov eax, dword [nosplit edi*4+dword_11B308]
        jmp near InitGameView_709
.11:
        cmp dword [byte ebp-04h], byte 4
        jb near .18
        mov eax, edi
        shl eax, 2
        cmp dword [byte ebp-04h], byte 5
        jbe short .12
        cmp dword [byte ebp-04h], byte 7
        jbe short .16
        jmp near .18
.12:
        cmp dword [dword eax+dword_1797B4], byte 0
        je short .13
        mov eax, dword [byte ebp-04h]
        sub eax, byte 3
        push eax
        mov eax, 93h
        call GetLangText
        push eax
        lea eax, [byte ebp-050h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp short .15
.13:
        mov eax, 94h
.14:
        call GetLangText
        push eax
        lea eax, [byte ebp-050h]
        push eax
        call sprintf_
        add esp, byte 8
.15:
        cmp dword [nosplit edi*4+dword_1797B4], byte 0
        jne near .21
        mov eax, 6
        mov cl, byte [byte_1798A4]
        mov edx, dword [dword_1798FC]
        sar eax, cl
        add edx, edx
        add eax, edx
        jmp near .23
.16:
        cmp dword [dword eax+dword_1797B4], byte 0
        je short .17
        mov eax, dword [byte ebp-04h]
        sub eax, byte 5
        push eax
        mov eax, 95h
        call GetLangText
        push eax
        lea eax, [byte ebp-050h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp short .15
.17:
        mov eax, 96h
        jmp short .14
.18:
        cmp dword [nosplit edi*4+dword_1797B4], byte 0
        je short .19
        mov eax, dword [byte ebp-04h]
        inc eax
        push eax
        mov eax, 97h
        call GetLangText
        push eax
        lea eax, [byte ebp-050h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp short .20
.19:
        mov eax, 98h
        call GetLangText
        push eax
        lea eax, [byte ebp-050h]
        push eax
        call sprintf_
        add esp, byte 8
.20:
        cmp dword [nosplit edi*4+dword_1797B4], byte 0
        je short .22
.21:
        xor eax, eax
        jmp short .23
.22:
        mov eax, 0Ah
        mov edx, dword [dword_1798FC]
        mov cl, byte [byte_1798A4]
        shl edx, 2
        sar eax, cl
        add eax, edx
.23:
        mov dword [byte ebp-0Ch], eax
        test edi, edi
        je short .24
        mov eax, 0DCh
        jmp short .25
.24:
        xor eax, eax
.25:
        mov cl, byte [byte ebp-010h]
        shl eax, cl
        mov esi, 4
        mov dword [byte ebp-08h], eax
        mov eax, 64h
        shl esi, cl
        shl eax, cl
        mov cl, byte [byte_1798A4]
        mov dword [byte ebp-014h], eax
        mov eax, 19h
        sar eax, cl
        add dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp-0Ch]
        add eax, esi
        mov dword [byte ebp-024h], eax
        dec eax
        push eax
        mov eax, dword [byte ebp-08h]
        add eax, dword [byte ebp-014h]
        mov ebx, esi
        mov dword [byte ebp-028h], eax
        lea ecx, [byte eax-01h]
        mov edx, dword [byte ebp-08h]
        mov eax, unk_17D3E8
        call FillBox
        push dword [byte ebp-024h]
        mov eax, 2
        mov cl, byte [byte_1798A4]
        push esi
        sar eax, cl
        push dword [byte ebp-028h]
        add eax, dword [byte ebp-08h]
        push eax
        call SetClipWindow
        add esp, byte 10h
        cmp dword [byte ebp-010h], byte 0
        je short .26
        mov dword [byte ebp-018h], 1Bh
        jmp short .27
.26:
        mov dword [byte ebp-018h], 0Ch
.27:
        mov cl, byte [byte ebp-010h]
        mov eax, 2
        shl eax, cl
        mov dword [byte ebp-028h], eax
        mov eax, dword [byte ebp-018h]
        sub eax, dword [byte ebp-028h]
        push dword 0ADh
        mov dword [byte ebp-024h], eax
        push eax
        mov eax, dword [byte ebp-014h]
        sub eax, dword [byte ebp-028h]
        push eax
        push esi
        push dword [byte ebp-08h]
        call FillRect
        mov cl, byte [byte ebp-010h]
        mov eax, 4
        mov edx, dword [byte ebp-014h]
        add esp, byte 14h
        shl eax, cl
        push byte 4
        sub edx, eax
        mov eax, dword [byte ebp-018h]
        push dword [byte ebp-028h]
        add eax, esi
        push edx
        sub eax, dword [byte ebp-028h]
        push eax
        mov eax, dword [byte ebp-08h]
        add eax, dword [byte ebp-028h]
        push eax
        call FillRect
        add esp, byte 14h
        push byte 4
        push dword [byte ebp-024h]
        mov eax, dword [byte ebp-028h]
        push dword [byte ebp-028h]
        add eax, esi
        push eax
        mov eax, dword [byte ebp-08h]
        add eax, dword [byte ebp-014h]
        mov dword [byte ebp-024h], eax
        sub eax, dword [byte ebp-028h]
        push eax
        call FillRect
        add esp, byte 14h
        push dword [dword_11F5C4]
        push byte 0
        push dword [dword_11F5C0]
        push byte 0
        call SetClipWindow
        mov eax, dword [byte ebp-0Ch]
        mov ebx, dword [byte ebp-024h]
        mov edx, dword [byte ebp-08h]
        add esp, byte 10h
        add eax, esi
        inc dword [dword_177108]
        push eax
        mov ecx, esi
        mov eax, dword [dword_177108]
        call sub_5439F
        mov eax, dword [dword_177108]
        call sub_54391
        mov esi, eax
        test edi, edi
        je short .28
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        jmp short .29
.28:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
.29:
        shr eax, 1Bh
        call LoadTeamLogo
        mov ecx, dword [byte_1798A4]
        mov dword [byte ebp-01Ch], eax
        inc ecx
        inc ecx
        test edi, edi
        je short .30
        movsx eax, word [byte eax+08h]
        mov edx, 280h
        sar eax, cl
        mov cl, byte [byte_1798A4]
        sar edx, cl
        sub edx, eax
        jmp short .31
.30:
        movsx edx, word [byte eax+08h]
        sar edx, cl
.31:
        mov ecx, dword [byte_1798A4]
        mov ebx, dword [byte ebp-01Ch]
        inc ecx
        movsx ebx, word [byte ebx+0Ah]
        mov eax, dword [byte ebp-01Ch]
        sar ebx, cl
        mov ecx, 1
        call DrawPanelLogo
        mov eax, dword [dword_177108]
        call sub_54391
        push dword [dword_179918]
        mov dword [byte ebp-020h], eax
        call TextSetFont
        add esp, byte 4
        mov edx, 70h
        mov eax, 7Ah
        call SetTextColors
        mov edx, 6
        mov cl, byte [byte_1798A4]
        mov eax, 4
        sar edx, cl
        sar eax, cl
        test edi, edi
        je short .32
        mov ebx, dword [byte esi+08h]
        add edx, dword [esi]
        add ebx, eax
        lea eax, [byte ebp-050h]
        call DrawColorText
        jmp short .33
.32:
        mov ebx, dword [byte esi+08h]
        add ebx, eax
        mov eax, dword [byte esi+04h]
        sub eax, edx
        mov edx, eax
        lea eax, [byte ebp-050h]
        call DrawColorTextRight
.33:
        cmp dword [nosplit edi*4+dword_1797B4], byte 0
        jne near .39
        cmp dword [byte ebp-04h], byte 4
        jb near .37
        mov eax, 4
        mov cl, byte [byte_1798A4]
        sar eax, cl
        mov ecx, eax
        mov eax, dword [dword_1798FC]
        add eax, eax
        cmp dword [byte ebp-04h], byte 5
        jbe short .34
        cmp dword [byte ebp-04h], byte 7
        jbe short .36
        jmp near .37
.34:
        mov edx, dword [byte esi+0Ch]
        sub edx, eax
        mov eax, edx
        sub eax, ecx
        push eax
        mov ebx, 4
        push dword [byte ebp-08h]
        cmp dword [byte ebp-04h], byte 4
        sete al
        mov edx, edi
        movzx ecx, al
        mov eax, str_12
        call DrawLineEnergyBar
        mov eax, 2
        mov edx, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub edx, dword [dword_1798FC]
        sar eax, cl
        sub edx, eax
        push edx
        mov ebx, 5
        push dword [byte ebp-08h]
        cmp dword [byte ebp-04h], byte 5
.35:
        sete al
        mov edx, edi
        movzx ecx, al
        mov eax, str_24
        jmp near .38
.36:
        mov edx, dword [byte esi+0Ch]
        sub edx, eax
        mov eax, edx
        sub eax, ecx
        push eax
        mov ebx, 6
        push dword [byte ebp-08h]
        cmp dword [byte ebp-04h], byte 6
        sete al
        mov edx, edi
        movzx ecx, al
        mov eax, str_12
        call DrawLineEnergyBar
        mov eax, 2
        mov edx, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub edx, dword [dword_1798FC]
        sar eax, cl
        sub edx, eax
        push edx
        mov ebx, 7
        push dword [byte ebp-08h]
        cmp dword [byte ebp-04h], byte 7
        jmp short .35
.37:
        mov eax, dword [dword_1798FC]
        mov edx, dword [byte esi+0Ch]
        shl eax, 2
        mov cl, byte [byte_1798A4]
        sub edx, eax
        mov eax, 8
        sar eax, cl
        sub edx, eax
        push edx
        xor ebx, ebx
        push dword [byte ebp-08h]
        cmp dword [byte ebp-04h], byte 0
        sete al
        mov edx, edi
        movzx ecx, al
        mov eax, str_12
        call DrawLineEnergyBar
        imul eax, dword [dword_1798FC], byte 3
        mov edx, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub edx, eax
        mov eax, 6
        sar eax, cl
        sub edx, eax
        push edx
        mov ebx, 1
        push dword [byte ebp-08h]
        cmp dword [byte ebp-04h], byte 1
        sete al
        mov edx, edi
        movzx ecx, al
        mov eax, str_24
        call DrawLineEnergyBar
        mov eax, dword [dword_1798FC]
        mov edx, dword [byte esi+0Ch]
        add eax, eax
        sub edx, eax
        mov cl, byte [byte_1798A4]
        mov eax, edx
        mov edx, 4
        sar edx, cl
        sub eax, edx
        push eax
        mov ebx, 2
        push dword [byte ebp-08h]
        cmp dword [byte ebp-04h], byte 2
        sete al
        mov edx, edi
        movzx ecx, al
        mov eax, str_32
        call DrawLineEnergyBar
        mov eax, 2
        mov edx, dword [byte esi+0Ch]
        mov cl, byte [byte_1798A4]
        sub edx, dword [dword_1798FC]
        sar eax, cl
        sub edx, eax
        push edx
        mov ebx, 3
        push dword [byte ebp-08h]
        cmp dword [byte ebp-04h], byte 3
        sete al
        mov edx, edi
        movzx ecx, al
        mov eax, str_42
.38:
        call DrawLineEnergyBar
.39:
        mov eax, edi
        shl eax, 2
        cmp dword [dword eax+dword_11B308], byte 0
        jne near .10
        mov ebx, dword [byte ebp-020h]
        mov edx, dword [byte esi+0Ch]
        cmp edx, dword [byte ebx+0Ch]
        jg short .40
        mov edx, dword [byte ebx+0Ch]
.40:
        mov dword [dword eax+dword_11B308], edx
        jmp near .10
.41:
        mov dword [dword eax+dword_11B308], 0
.42:
        mov eax, dword [dword eax+dword_11B308]
        jmp near InitGameView_709
;-----------------------------------------------------------------------------
; DrawLineChangeBoxes                          5D4B4  96 PC, medium confidence
; Reads both teams' line energies (TeamLineEnergy) and draws their line
; change boxes
;-----------------------------------------------------------------------------
DrawLineChangeBoxes:
        push ebx
        push ecx
        push edx
        push esi
        movzx eax, byte [byte_179DC1]
        cmp eax, byte 0Fh
        jne short .1
        xor eax, eax
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
.1:
        mov ebx, dword_1797BC
        movsx eax, word [word_165704]
        xor esi, esi
        mov dword [dword_17990C], eax
        movsx eax, word [word_16583A]
        xor ecx, ecx
        mov dword [dword_179928], eax
.2:
        movsx edx, cx
        movsx eax, si
        call TeamLineEnergy
        cwde
        sub eax, byte 60h
        inc ecx
        mov dword [ebx], eax
        add ebx, byte 4
        cmp ecx, byte 8
        jl short .2
        mov esi, 1
        mov ebx, dword_1797DC
        xor ecx, ecx
.3:
        movsx edx, cx
        movsx eax, si
        call TeamLineEnergy
        cwde
        sub eax, byte 60h
        inc ecx
        mov dword [ebx], eax
        add ebx, byte 4
        cmp ecx, byte 8
        jl short .3
        xor eax, eax
        call DrawLineChangeBox
        mov edx, eax
        mov eax, 1
        call DrawLineChangeBox
        shl eax, 10h
        or eax, edx
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
unk_5D549:
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_5D555:
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_5D561:
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_5D56D:
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_5D579:
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_5D585:
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_5D591:
        db 0B0h,0FAh,0FFh,0FFh,0F0h,0Ah,00h,00h,030h,0F8h,0FFh,0FFh,0C0h,0F9h,0FFh,0FFh
        db 028h,0Ah,00h,00h,00h,00h,00h,00h,0B0h,0FAh,0FFh,0FFh,060h,09h,00h,00h
        db 0D0h,07h,00h,00h,00h,00h,00h,00h,098h,08h,00h,00h,0A0h,0Fh,00h,00h
        db 050h,05h,00h,00h,0D0h,07h,00h,00h,0D0h,07h,00h,00h,040h,06h,00h,00h
        db 08h,07h,00h,00h,00h,00h,00h,00h,050h,05h,00h,00h,040h,06h,00h,00h
        db 030h,0F8h,0FFh,0FFh,00h,00h,00h,00h,078h,05h,00h,00h,048h,0F4h,0FFh,0FFh
        db 00h,00h,00h,00h,0B0h,04h,00h,00h,030h,0F8h,0FFh,0FFh,00h,00h,00h,00h
        db 0E8h,03h,00h,00h,018h,0FCh,0FFh,0FFh,00h,00h,00h,00h,040h,01h,00h,00h
        db 06Ch,0FDh,0FFh
        db 0FFh
;-----------------------------------------------------------------------------
; unk_5D591_84                                                    5D615  96 PC
;-----------------------------------------------------------------------------
unk_5D591_84:
        mov al, byte [0B4000000h]
        db 00h,00h,00h,0C8h,00h,00h,00h,0DCh,00h,00h,00h,0F0h,00h,00h,00h,04h
        db 01h,00h,00h,018h,01h,00h,00h,02Ch,01h,00h,00h,040h,01h,00h,00h
unk_5D639:
        db 064h,00h,00h,00h,071h,00h,00h,00h,07Dh,00h,00h,00h,08Ah,00h,00h,00h
        db 096h,00h,00h,00h,0A3h,00h,00h,00h,0AFh,00h,00h,00h,0BCh,00h,00h,00h
        db 0C8h,00h,00h,00h
unk_5D65D:
        db 040h,01h,00h,00h,068h,01h,00h,00h,090h,01h,00h,00h,0B8h,01h,00h,00h
        db 0E0h,01h,00h,00h,08h,02h,00h,00h,030h,02h,00h,00h,058h,02h,00h,00h
        db 080h,02h,00h,00h
unk_5D681:
        db 0F0h,00h,00h,00h,0Eh,01h,00h,00h,02Ch,01h,00h,00h,04Ah,01h,00h,00h
        db 068h,01h,00h,00h,086h,01h,00h,00h,0A4h,01h,00h,00h,0C2h,01h,00h,00h
        db 0E0h,01h,00h,00h,053h,051h,056h,0C8h,048h,00h,00h
        mov esi, eax
        mov eax, dword [dword_179E13]
        mov dword [edx], eax
        neg dword [edx]
        mov eax, dword [dword_179E17]
        mov dword [byte edx+04h], eax
        neg dword [byte edx+04h]
        mov eax, dword [dword_179E1B]
        mov dword [byte edx+08h], eax
        neg dword [byte edx+08h]
        push dword [dword_179E0F]
        lea eax, [byte ebp-024h]
        push eax
        call sub_BC610
        add esp, byte 8
        push dword [dword_179E0B]
        lea eax, [byte ebp-048h]
        push eax
        call sub_BC674
        add esp, byte 8
        push esi
        lea eax, [byte ebp-024h]
        push eax
        lea eax, [byte ebp-048h]
        push eax
        call MultiplyMatrix
        add esp, byte 0Ch
        leave
        pop esi
        pop ecx
        pop ebx
        ret
