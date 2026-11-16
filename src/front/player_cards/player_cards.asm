; The player card screen: player profiles with their pictures and season stats, the league logos, text export (96 PC; still being named).
bits 32
%include "hockey.inc"
section s_903B5 progbits alloc exec nowrite align=1
extern __CHP, asc_1129CF, asc_1129E6, byte_11E844, byte_11E852, byte_17BDAE, SeasonUserTeam, byte_17D13A
extern byte_17EBF0, byte_182124, CheckExportName, DrawColorText, DrawColorTextCentred, DrawFrameAt, DrawScrollBar, dword_1129FA
extern dword_11E670, dword_11E684, dword_11E6B4, dword_11E7E0, dword_11E85B, dword_11E87F, dword_11E883, dword_11E887
extern dword_11E88B, TeamStatsBitmap, dword_17EEF0, dword_17FDF0, dword_17FDF4, dword_181EAC, dword_1820A0, dword_1820A4
extern dword_1820A8, dword_1820AC, dword_1820B0, dword_1820E4, dword_1820E8, dword_1820EC, dword_1820F4, dword_1820F8
extern dword_1820FC, dword_182100, dword_182104, dword_182108, dword_18210C, dword_182110, dword_182114, dword_182118
extern dword_18211C, dword_182120, EditText, FadeOut, FadePalette, fclose_, FillMusicStream, FillRect
extern fopen_, fprintf_, FreeScrollBar, GetLangText, GetTeamMovieText, GetTicks, HideProgressBox, InitHScrollBar
extern InitMenuItems, LoadPackedFile, LoadTeamLogo, memcmp_, MessageBox, MusicDone, off_11E6E0, off_11E764
extern OpenScreen, optflags, PlayMusic, PutBlock, qword_1128CD, qword_1128D5, qword_1129AF, qword_1129B7
extern qword_1129FE, RunMenu, ScrollBarDown, ScrollBarToMouse, ScrollBarUp, SetDrawBitmap, SetScreenColors, SetScreenPalette
extern SetScrollBarPos, SetTextColors, SetTickDeadline, ShowProgressBox, SlideInSideBar, SoundSecondsToBytes, sprintf_, str_002
extern str_9394, str_9495, str_AR004, str_AR014, str_AR104, str_AR114, str_Ard2, str_Bkgd17
extern str_Card2, str_CMP0, str_CMP1, str_CMP2, str_CRD0, str_CRD1, str_CRD2, str_DD6
extern str_DD7, str_DD8, str_DNRS, str_DSS2, str_DSS3, str_fmtpd, str_FSH4, str_HBAL3
extern str_HD00, str_HD022, str_LG02d2, str_Pal23, str_PHT0, str_PHT1, str_PHT2, str_PLY0
extern str_PLY4, str_Plyr2, str_PRN02, str_PRN12, str_PRN22, str_PROFILEFSH2, str_RAT, str_RAT0
extern str_S5, str_SD4, str_SEA4, str_SLDH2, str_Wt4, str_XTbl, strcat_, strlen_
extern SelectDataLibrary, StatsDb5Record, StatsDb1Record, StatsDataBBRecord, StatsData4Record, StatsDb2Record, PlayerRatingsScreen_E11, PlayerRatingsScreen_E3B
extern PlayerRatingsScreen_E44, PlayerRatingsScreen_E4D, PlayerRatingsScreen_E56, PlayerRatingsScreen_E5F, PlayerRatingsScreen_E68, PlayerRatingsScreen_E71, RatingBar, DrawArt
extern PutBlockAtOwnPos, BlitShapeAt, AllocMemBlock, FreeMemBlock, CreateBitmap, FreeBitmap, DosFileInfo, LoadResourceDataShared
extern DrawArtOpaqueAtOwnPos, DrawArtOpaqueHotspot, PutBlockKeyed, SetScreenTarget, SetPaletteEntries, SetColourRemap, FindShape, TickDeadlinePassed
extern unk_1129C2, unk_1129E4, unk_1129F7, str_WesternConference2, UpdateProgressBox
global unk_903B5, unk_903F5, unk_90401, unk_90501, ShowPlayerCardTitle, SwitchPlayerCard, DrawLeagueLogo, DrawLeagueLogo_7D
global SlideCardLeft, SlideCardRight, PlayerCardScreen, unk_91F1C, unk_91F48, unk_91F70, unk_91F9C, DrawPlayerCardStats
global DrawPlayerCardStats_1C4, DrawPlayerCardStats_1DE, DrawPlayerCardStats_1E4, DrawPlayerCardStats_217, DrawPlayerCardStats_21D, DrawPlayerCardStats_223, DrawPlayerCardStats_229, DrawPlayerCardStats_22F
global DrawPlayerCardStats_235, DrawPlayerCardStats_23B, DrawPlayerCardStats_241, DrawPlayerCardStats_3D9, DrawPlayerCardStats_3F3, DrawPlayerCardStats_3F9, DrawPlayerCardStats_3FF, DrawPlayerCardStats_405
global DrawPlayerCardStats_40B, DrawPlayerCardStats_411, DrawPlayerCardStats_417, DrawPlayerCardStats_41D, DrawPlayerCardStats_423, DrawPlayerCardStats_5E6, DrawPlayerCardStats_601, DrawPlayerCardStats_607
global DrawPlayerCardStats_63A, DrawPlayerCardStats_640, DrawPlayerCardStats_646, DrawPlayerCardStats_64C, DrawPlayerCardStats_652, DrawPlayerCardStats_658, DrawPlayerCardStats_65E, DrawPlayerCardStats_664
global DrawPlayerCardStats_7FC, DrawPlayerCardStats_817, DrawPlayerCardStats_81D, DrawPlayerCardStats_823, DrawPlayerCardStats_829, DrawPlayerCardStats_82F, DrawPlayerCardStats_835, DrawPlayerCardStats_83B
global DrawPlayerCardStats_841, DrawPlayerCardStats_847, LoadPlayerCardArt, DrawPlayerCardName, unk_93072, unk_9309E, unk_930CA, unk_930F2
global ExportPlayerCard, ExportPlayerCard_2BF, ExportPlayerCard_2D9, ExportPlayerCard_2DF, ExportPlayerCard_312, ExportPlayerCard_318, ExportPlayerCard_31E, ExportPlayerCard_324
global ExportPlayerCard_32A, ExportPlayerCard_330, ExportPlayerCard_336, ExportPlayerCard_33C, ExportPlayerCard_438, ExportPlayerCard_453, ExportPlayerCard_459, ExportPlayerCard_48C
global ExportPlayerCard_492, ExportPlayerCard_498, ExportPlayerCard_49E, ExportPlayerCard_4A4, ExportPlayerCard_4AA, ExportPlayerCard_4B0, ExportPlayerCard_4B6, ExportPlayerCard_703
global ExportPlayerCard_71D, ExportPlayerCard_723, ExportPlayerCard_729, ExportPlayerCard_72F, ExportPlayerCard_735, ExportPlayerCard_73B, ExportPlayerCard_741, ExportPlayerCard_747
global ExportPlayerCard_74D, ExportPlayerCard_860, ExportPlayerCard_87B, ExportPlayerCard_881, ExportPlayerCard_887, ExportPlayerCard_88D, ExportPlayerCard_893, ExportPlayerCard_899
global ExportPlayerCard_89F, ExportPlayerCard_8A5, ExportPlayerCard_8AB, ScaleBlock, unk_93BE6, unk_93CA6, unk_93D26, jpt_93E46
unk_903B5:
        db 018h,01h,00h,00h,064h,00h,00h,00h,068h,01h,00h,00h,064h,00h,00h,00h
        db 068h,01h,00h,00h,0AAh,00h,00h,00h,018h,01h,00h,00h,0AAh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_903F5:
        dd str_RAT
        dd str_SEA4
        dd str_PLY4
unk_90401:
        db 0FFh,00h,00h,00h,0C3h,01h,00h,00h,07h,01h,00h,00h,0B8h,01h,00h,00h
        db 080h,01h,00h,00h,0B8h,01h,00h,00h,08Ah,01h,00h,00h,0C5h,01h,00h,00h
        db 07Fh,01h,00h,00h,0D0h,01h,00h,00h,07h,01h,00h,00h,0CEh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 09Ah,01h,00h,00h,0C4h,01h,00h,00h,0A2h,01h,00h,00h,0B8h,01h,00h,00h
        db 01Bh,02h,00h,00h,0B8h,01h,00h,00h,024h,02h,00h,00h,0C4h,01h,00h,00h
        db 01Ch,02h,00h,00h,0D0h,01h,00h,00h,0A4h,01h,00h,00h,0CFh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 08Eh,01h,00h,00h,059h,00h,00h,00h,094h,01h,00h,00h,053h,00h,00h,00h
        db 02Ah,02h,00h,00h,053h,00h,00h,00h,031h,02h,00h,00h,05Bh,00h,00h,00h
        db 031h,02h,00h,00h,069h,00h,00h,00h,02Ah,02h,00h,00h,06Fh,00h,00h,00h
        db 096h,01h,00h,00h,06Fh,00h,00h,00h,08Eh,01h,00h,00h,068h,00h,00h,00h
        db 073h,00h,00h,00h,0B4h,01h,00h,00h,0E1h,00h,00h,00h,0B4h,01h,00h,00h
        db 0E1h,00h,00h,00h,0CFh,01h,00h,00h,073h,00h,00h,00h,0CFh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_90501:
        db 00h,02h,04h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 06h,01h,08h,02h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,02h,01h,02h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,03h,03h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,03h,04h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 05h,03h,05h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,01h,04h,02h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,01h,04h,02h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 04h,08h,03h,01h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 09h,01h,07h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; ShowPlayerCardTitle                             905A1  96 PC, low confidence
; Shows the player card title strip (bkgd) for a moment
;-----------------------------------------------------------------------------
ShowPlayerCardTitle:
        push ebx
        push ecx
        push edx
        push esi
        cmp byte [byte_182124], 0
        je near .2
        push byte 0
        push byte 46h
        push byte 50h
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 0FFFFFF9Ch
        push dword 0FFFFFEE8h
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        call GetTicks
        mov edx, dword [dword_182118]
        add edx, byte 0Ah
        cmp eax, edx
        jle short .1
        inc dword [dword_1820A0]
        call GetTicks
        mov dword [dword_182118], eax
.1:
        mov eax, dword [dword_1820A0]
        mov ebx, 8
        cdq
        idiv ebx
        push dword [nosplit edx*4+off_11E6E0]
        push dword [dword_18210C]
        mov dword [dword_1820A0], edx
        call FindShape
        add esp, byte 8
        push byte 0
        push byte 0
        push eax
        mov dword [dword_1820A4], eax
        call DrawArt
        add esp, byte 0Ch
        call SetScreenTarget
        push byte 64h
        push dword 118h
        push dword [byte esi+02Ch]
        call DrawArtOpaqueHotspot
        add esp, byte 0Ch
        push esi
        call FreeBitmap
        add esp, byte 4
.2:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SwitchPlayerCard                                9066F  96 PC, low confidence
; The card change animation: title, slide out (SlideCardLeft /
; SlideCardRight), the new card's picture (LoadPlayerCardArt)
;-----------------------------------------------------------------------------
SwitchPlayerCard:
        push ebx
        push ecx
        push edx
        push esi
        call ShowPlayerCardTitle
        call GetTicks
        mov esi, eax
        cmp dword [dword_11E88B], byte 0
        je short .1
        push dword [dword_1820F4]
        jmp short .2
.1:
        push dword [dword_1820FC]
.2:
        call SetColourRemap
        add esp, byte 4
        mov edx, dword [dword_182114]
        mov eax, dword [dword_11E87F]
        add edx, byte 1Eh
        cmp eax, byte 2
        jb short .3
        jbe near .5
        cmp eax, byte 3
        je near .6
        jmp near .9
.3:
        cmp eax, byte 1
        jne near .9
        cmp esi, edx
        jle short .4
        mov ecx, 1
        mov edx, 0Ah
        mov ebx, dword [dword_182120]
        mov eax, dword [dword_182110]
        call SlideCardLeft
        call GetTicks
        mov dword [dword_11E87F], 2
        mov dword [dword_182114], eax
        jmp near .8
.4:
        mov eax, esi
        sub eax, dword [dword_182114]
        mov esi, 3
        cdq
        idiv esi
        mov ecx, 1
        mov ebx, dword [dword_182120]
        mov esi, dword [dword_182110]
        mov edx, eax
        mov eax, esi
        call SlideCardLeft
        jmp near .8
.5:
        mov eax, dword [dword_182114]
        add eax, byte 32h
        cmp esi, eax
        jle near .9
        mov ecx, 1
        mov ebx, dword [dword_182100]
        mov edx, dword [dword_182104]
        mov eax, dword [dword_181EAC]
        call LoadPlayerCardArt
        call GetTicks
        mov dword [dword_11E87F], 3
        mov dword [dword_182114], eax
        jmp short .9
.6:
        cmp esi, edx
        jle short .7
        mov ecx, 1
        mov edx, 0Ah
        mov ebx, dword [dword_182120]
        mov eax, dword [dword_182110]
        call SlideCardRight
        call GetTicks
        mov dword [dword_11E87F], 0
        mov dword [dword_182114], eax
        jmp short .8
.7:
        mov ecx, 1
        mov edx, 0Ah
        mov ebx, dword [dword_182120]
        mov eax, dword [dword_182110]
        call SlideCardRight
.8:
        call SetScreenTarget
        push byte 5Dh
        mov eax, dword [dword_182120]
        push byte 61h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.9:
        cmp dword [dword_11E87F], byte 2
        jne near .10
        push byte 0
        push dword 0B1h
        push dword 0A0h
        call CreateBitmap
        mov esi, eax
        mov eax, dword [dword_181EAC]
        mov eax, dword [nosplit eax*4+dword_17EEF0]
        add esp, byte 0Ch
        mov edx, esi
        movsx eax, byte [eax]
        call DrawLeagueLogo
        push dword [dword_182120]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0FFFFFFA3h
        push byte 0FFFFFF9Fh
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        push byte 33h
        push byte 7
        push dword [byte esi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push esi
        call FreeBitmap
        add esp, byte 4
        call SetScreenTarget
        push byte 5Dh
        mov eax, dword [dword_182120]
        push byte 61h
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.10:
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DrawLeagueLogo                               90879  96 PC, medium confidence
; (league): draws the league logo LG%02d
;-----------------------------------------------------------------------------
DrawLeagueLogo:
        push ebx
        push ecx
        push esi
        push edi
        enter 10h, 0
        mov edi, edx
        push eax
        push str_LG02d2
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-010h]
        push eax
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-04h], 0
        push edi
        mov dword [byte ebp-08h], 0Ah
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
.1:
        cmp dword [byte ebp-04h], 0A0h
        jge short DrawLeagueLogo_7D
        sub dword [byte ebp-08h], byte 0Ah
        mov edi, dword [byte ebp-08h]
.2:
        cmp edi, 0B1h
        jge short .3
        push edi
        push dword [byte ebp-04h]
        push esi
        call DrawArt
        movsx eax, word [byte esi+06h]
        add esp, byte 0Ch
        add edi, eax
        jmp short .2
.3:
        movsx eax, word [byte esi+04h]
        add dword [byte ebp-04h], eax
        jmp short .1
DrawLeagueLogo_7D:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SlideCardLeft                                   908FC  96 PC, low confidence
; Slides a card panel to the left (ScaleBlock steps)
;-----------------------------------------------------------------------------
SlideCardLeft:
        push esi
        push edi
        enter 0Ch, 0
        mov edi, eax
        mov dword [byte ebp-04h], edx
        mov esi, ebx
        mov dword [byte ebp-08h], ecx
        test ecx, ecx
        je short .1
        push byte 0
        push dword 0B1h
        push dword 0A0h
        call CreateBitmap
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [dword_181EAC]
        mov eax, dword [nosplit eax*4+dword_17EEF0]
        add esp, byte 0Ch
        mov edx, dword [byte ebp-0Ch]
        movsx eax, byte [eax]
        call DrawLeagueLogo
        push esi
        call SetDrawBitmap
        add esp, byte 4
        push byte 0FFFFFFA3h
        push byte 0FFFFFF9Fh
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        push byte 33h
        mov eax, dword [byte ebp-0Ch]
        push byte 7
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [byte ebp-0Ch]
        call FreeBitmap
        add esp, byte 4
        jmp short .2
.1:
        mov eax, dword [dword_181EAC]
        mov eax, dword [nosplit eax*4+dword_17EEF0]
        mov edx, ebx
        movsx eax, byte [eax]
        call DrawLeagueLogo
.2:
        test edi, edi
        je short .7
        cmp dword [dword_11E883], byte 0
        je short .3
        cmp dword [byte ebp-08h], byte 0
        jne short .4
.3:
        fild dword [byte ebp-04h]
        fmul qword [qword_1128CD]
        push byte 1
        mov edx, esi
        push byte 1
        jmp short .6
.4:
        cmp dword [dword_11E88B], byte 0
        je short .5
        fild dword [byte ebp-04h]
        fmul qword [qword_1128CD]
        push byte 33h
        mov edx, esi
        push byte 7
        jmp short .6
.5:
        fild dword [byte ebp-04h]
        fmul qword [qword_1128CD]
        push byte 51h
        mov edx, esi
        push byte 0FFFFFFE9h
.6:
        fld1
        sub esp, byte 4
        fsubrp
        mov eax, edi
        fstp dword [esp]
        call ScaleBlock
.7:
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; SlideCardRight                                  909FE  96 PC, low confidence
; Slides a card panel to the right
;-----------------------------------------------------------------------------
SlideCardRight:
        push esi
        push edi
        enter 0Ch, 0
        mov edi, eax
        mov dword [byte ebp-04h], edx
        mov esi, ebx
        mov dword [byte ebp-08h], ecx
        test ecx, ecx
        je short .1
        push byte 0
        push dword 0B1h
        push dword 0A0h
        call CreateBitmap
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [dword_181EAC]
        mov eax, dword [nosplit eax*4+dword_17EEF0]
        add esp, byte 0Ch
        mov edx, dword [byte ebp-0Ch]
        movsx eax, byte [eax]
        call DrawLeagueLogo
        push esi
        call SetDrawBitmap
        add esp, byte 4
        push byte 0FFFFFFA3h
        push byte 0FFFFFF9Fh
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        push byte 33h
        mov eax, dword [byte ebp-0Ch]
        push byte 7
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push dword [byte ebp-0Ch]
        call FreeBitmap
        add esp, byte 4
        jmp short .2
.1:
        mov eax, dword [dword_181EAC]
        mov eax, dword [nosplit eax*4+dword_17EEF0]
        mov edx, ebx
        movsx eax, byte [eax]
        call DrawLeagueLogo
.2:
        test edi, edi
        je short .7
        cmp dword [dword_11E883], byte 0
        je short .3
        cmp dword [byte ebp-08h], byte 0
        jne short .4
.3:
        fild dword [byte ebp-04h]
        push byte 1
        fmul qword [qword_1128D5]
        push byte 1
        jmp short .6
.4:
        cmp dword [dword_11E88B], byte 0
        je short .5
        fild dword [byte ebp-04h]
        push byte 33h
        fmul qword [qword_1128D5]
        push byte 7
        jmp short .6
.5:
        fild dword [byte ebp-04h]
        push byte 51h
        fmul qword [qword_1128D5]
        push byte 0FFFFFFE9h
.6:
        mov edx, esi
        sub esp, byte 4
        mov eax, edi
        fstp dword [esp]
        call ScaleBlock
.7:
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; PlayerCardScreen                                                90AF8  96 PC
; The player card screen (XTbl, PHT0, HBAL, SLDH, AR00-AR11 arrows): a
; player's picture, profile and stats, picking players by team, export
;-----------------------------------------------------------------------------
PlayerCardScreen:
        push esi
        push edi
        enter 850h, 0
        push eax
        push edx
        push ebx
        push ecx
        mov ecx, 10h
        lea edi, [dword ebp-0110h]
        mov esi, unk_903B5
        rep movsd
        lea edi, [byte ebp-058h]
        mov esi, unk_903F5
        movsd
        movsd
        movsd
        mov ecx, 40h
        lea edi, [dword ebp-031Ch]
        mov esi, unk_90401
        rep movsd
        push byte 0
        mov ecx, 28h
        lea edi, [dword ebp-021Ch]
        mov esi, unk_90501
        push dword 0F1h
        rep movsd
        push dword 0ADh
        mov dword [dword_1820A4], 0
        mov dword [dword_1820F8], 0
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push byte 3Dh
        push dword 0C5h
        mov dword [dword_182120], eax
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push dword 118h
        push dword 104h
        mov dword [byte ebp-030h], eax
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push dword 0C8h
        push dword 0C8h
        mov dword [byte ebp-02Ch], eax
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push byte 5Dh
        push dword 96h
        mov dword [byte ebp-034h], eax
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push dword 100h
        push str_XTbl
        mov dword [dword_18211C], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 100h
        mov dword [byte ebp-024h], 0
        push str_XTbl
        mov dword [byte ebp-020h], 0
        mov dword [dword_1820F4], eax
        call AllocMemBlock
        lea edx, [dword ebp-0850h]
        mov dword [dword_1820FC], eax
        mov eax, dword [dword ebp-0860h]
        add esp, byte 0Ch
        mov dword [dword_182100], eax
        mov eax, 0Ah
        mov ebx, dword [dword ebp-0858h]
        call InitMenuItems
        mov eax, dword [dword ebp-0854h]
        jmp short .3
.1:
        mov edx, dword [eax]
        cmp edx, dword [ebx]
        jne short .2
        mov edx, dword [byte ebp-020h]
        mov dword [byte ebp-01Ch], edx
.2:
        inc dword [byte ebp-020h]
        add eax, byte 4
.3:
        mov edx, dword [byte ebp-020h]
        cmp edx, dword [dword ebp-085Ch]
        jl short .1
        mov eax, 6
        call SoundSecondsToBytes
        call FillMusicStream
        call MusicDone
        test eax, eax
        jne short .4
        call PlayMusic
.4:
        mov eax, 115h
        xor edx, edx
        call LoadPackedFile
        mov dword [dword ebp-04AAh], 4
        mov dword [dword ebp-0494h], 118h
        mov dword [dword ebp-0490h], 64h
        mov dword [dword ebp-0480h], 136h
        mov dword [dword ebp-047Ch], 82h
        push byte 0
        mov edx, eax
        mov dword [dword_18210C], eax
        lea eax, [dword ebp-0110h]
        push str_PHT0
        mov dword [dword ebp-04A6h], eax
        mov eax, dword [dword_1820A4]
        push edx
        mov dword [dword ebp-04A0h], eax
        mov dword [dword ebp-049Ch], eax
        mov dword [dword ebp-0498h], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_PHT0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov dword [byte ebp-038h], eax
        call SetDrawBitmap
        add esp, byte 4
        push str_PHT0
        push dword [dword_18210C]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_PHT0
        push dword [dword_18210C]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        call SetScreenTarget
        push str_HBAL3
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        push str_SLDH2
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        mov ecx, 1
        mov ebx, dword [dword ebp-085Ch]
        push byte 0
        lea edx, [dword ebp-06B8h]
        lea eax, [dword ebp-0454h]
        call InitHScrollBar
        push str_AR004
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push str_AR014
        push dword [dword_18210C]
        mov dword [dword ebp-069Eh], eax
        call FindShape
        add esp, byte 8
        push str_AR004
        push dword [dword_18210C]
        mov dword [dword ebp-069Ah], eax
        call FindShape
        add esp, byte 8
        push str_AR004
        movsx eax, word [byte eax+0Ch]
        push dword [dword_18210C]
        mov dword [dword ebp-0692h], eax
        call FindShape
        add esp, byte 8
        push str_AR104
        movsx eax, word [byte eax+0Eh]
        push dword [dword_18210C]
        mov dword [dword ebp-068Eh], eax
        call FindShape
        add esp, byte 8
        push str_AR114
        push dword [dword_18210C]
        mov dword [dword ebp-056Ch], eax
        call FindShape
        add esp, byte 8
        push str_AR104
        push dword [dword_18210C]
        mov dword [dword ebp-0568h], eax
        call FindShape
        add esp, byte 8
        push str_AR104
        movsx eax, word [byte eax+0Ch]
        push dword [dword_18210C]
        mov dword [dword ebp-0560h], eax
        call FindShape
        mov edx, dword [byte ebp-01Ch]
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [dword ebp-055Ch], eax
        lea eax, [dword ebp-0454h]
        call SetScrollBarPos
        mov eax, 0FFFFFFFBh
        call SelectDataLibrary
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push str_Pal23
        push dword [dword_18210C]
        mov edi, eax
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-020h], 0
        add eax, byte 10h
        push edi
        mov dword [dword_182104], eax
        mov esi, eax
        call DrawArtOpaqueAtOwnPos
        mov al, byte [byte ebp-020h]
        add esp, byte 4
        add al, 42h
.5:
        mov edx, dword [dword_1820F4]
        add edx, dword [byte ebp-020h]
        mov byte [edx], al
        mov edx, dword [dword_1820FC]
        add edx, dword [byte ebp-020h]
        mov ah, byte [byte ebp-020h]
        inc dword [byte ebp-020h]
        mov byte [edx], ah
        inc al
        cmp dword [byte ebp-020h], 100h
        jl short .5
        mov eax, dword [dword_1820F4]
        mov dword [byte ebp-020h], 0
        mov byte [dword eax+0FFh], 0FFh
        mov al, byte [byte ebp-020h]
        mov ah, 7
        mul ah
        mov dl, al
        mov ebx, dword [dword_182104]
        neg dl
        lea eax, [dword ebx+0AEh]
        add dl, 3Fh
.6:
        mov byte [eax], 3Fh
        mov byte [byte eax+02h], 0
        inc dword [byte ebp-020h]
        mov byte [byte eax+01h], dl
        sub dl, 7
        add eax, byte 3
        cmp dword [byte ebp-020h], byte 8
        jl short .6
        lea eax, [dword esi+0C6h]
        mov edi, str_WesternConference2
        lea edx, [dword esi+02B2h]
.7:
        mov byte [eax], 0
        inc eax
        cmp eax, edx
        jne short .7
        mov eax, dword [dword_182104]
        call SetScreenColors
        cmp dword [dword ebp-0860h], 3E7h
        jle short .8
        cmp dword [dword ebp-0860h], 2AF8h
        jge short .8
        push str_HD022
        jmp short .9
.8:
        cmp dword [dword ebp-0860h], 2AF7h
        jle short .10
        push str_HD00
.9:
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
.10:
        mov eax, 4
        call OpenScreen
        mov edx, esi
        mov eax, edi
        add edi, 0C0h
.11:
        inc edx
        mov bl, byte [dword eax+01F2h]
        inc eax
        mov byte [dword edx+01F1h], bl
        cmp eax, edi
        jne short .11
        lea eax, [dword esi+0C6h]
        add esi, 1F2h
.12:
        mov byte [eax], 0
        inc eax
        cmp eax, esi
        jne short .12
        mov eax, dword [dword_182104]
        call SetScreenPalette
        push str_RAT0
        mov dword [dword ebp-0840h], 8
        lea eax, [dword ebp-029Ch]
        push dword [dword_18210C]
        mov dword [dword ebp-083Ch], eax
        call FindShape
        add esp, byte 8
        push str_RAT0
        movsx eax, word [byte eax+0Ch]
        push dword [dword_18210C]
        mov dword [dword ebp-082Ah], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0826h], eax
        mov eax, dword [dword ebp-082Ah]
        add eax, byte 1Eh
        add esp, byte 8
        mov dword [dword ebp-0816h], eax
        mov eax, dword [dword ebp-0826h]
        mov dword [dword ebp-07DAh], 6
        add eax, byte 0Ah
        push str_PRN02
        mov dword [dword ebp-0812h], eax
        lea eax, [dword ebp-031Ch]
        push dword [dword_18210C]
        mov dword [dword ebp-07D6h], eax
        call FindShape
        add esp, byte 8
        push str_PRN12
        push dword [dword_18210C]
        mov dword [dword ebp-07D0h], eax
        call FindShape
        add esp, byte 8
        push str_PRN22
        push dword [dword_18210C]
        mov dword [dword ebp-07CCh], eax
        call FindShape
        add esp, byte 8
        push str_PRN02
        push dword [dword_18210C]
        mov dword [dword ebp-07C8h], eax
        call FindShape
        add esp, byte 8
        push str_PRN02
        movsx eax, word [byte eax+0Ch]
        push dword [dword_18210C]
        mov dword [dword ebp-07C4h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-07C0h], eax
        mov eax, dword [dword ebp-07C4h]
        add eax, byte 1Eh
        mov dword [dword ebp-07B0h], eax
        mov eax, dword [dword ebp-07C0h]
        add eax, byte 0Ah
        add esp, byte 8
        mov dword [dword ebp-07ACh], eax
        cmp dword [dword ebp-0860h], 1068h
        je near .13
        cmp dword [dword ebp-0860h], 0A410h
        je near .13
        cmp dword [dword ebp-0860h], byte 2Ah
        je near .13
        push str_CMP0
        mov dword [dword ebp-0774h], 6
        lea eax, [dword ebp-02DCh]
        push dword [dword_18210C]
        mov dword [dword ebp-0770h], eax
        call FindShape
        add esp, byte 8
        push str_CMP1
        push dword [dword_18210C]
        mov dword [dword ebp-076Ah], eax
        call FindShape
        add esp, byte 8
        push str_CMP2
        push dword [dword_18210C]
        mov dword [dword ebp-0766h], eax
        call FindShape
        add esp, byte 8
        push str_CMP0
        push dword [dword_18210C]
        mov dword [dword ebp-0762h], eax
        call FindShape
        add esp, byte 8
        push str_CMP0
        movsx eax, word [byte eax+0Ch]
        push dword [dword_18210C]
        mov dword [dword ebp-075Eh], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-075Ah], eax
        mov eax, dword [dword ebp-075Eh]
        add eax, byte 1Eh
        mov dword [dword ebp-074Ah], eax
        mov eax, dword [dword ebp-075Ah]
        add eax, byte 0Ah
        add esp, byte 8
        mov dword [dword ebp-0746h], eax
.13:
        mov ecx, 66h
        lea edi, [dword ebp-071Eh]
        mov esi, TeamStatsBitmap
        push str_PHT0
        rep movsb
        lea eax, [dword ebp-025Ch]
        mov dword [dword ebp-0510h], 4
        push dword [dword_18210C]
        mov dword [dword ebp-050Ch], eax
        call FindShape
        add esp, byte 8
        push str_PHT0
        movsx eax, word [byte eax+0Ch]
        push dword [dword_18210C]
        mov dword [dword ebp-04FAh], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-04F6h], eax
        mov eax, dword [dword ebp-04FAh]
        add eax, byte 1Eh
        mov dword [dword ebp-04E6h], eax
        mov eax, dword [dword ebp-04F6h]
        add eax, byte 0Ah
        mov dword [dword ebp-04E2h], eax
        mov eax, dword [dword ebp-0430h]
        shl eax, 2
        add eax, dword [dword ebp-0854h]
        mov edx, dword [dword_1820A8]
        mov eax, dword [eax]
        mov eax, dword [edx+eax*4]
        movsx eax, byte [eax]
        add esp, byte 8
        cmp eax, byte 4Eh
        jne short .14
        mov eax, dword [byte ebp-038h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-0506h], eax
        mov eax, dword [byte ebp-038h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-0502h], eax
        mov eax, dword [byte ebp-038h]
        mov eax, dword [byte eax+02Ch]
        jmp near .16
.14:
        cmp dword [dword_11E887], byte 1
        jne short .15
        push str_PHT0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push str_PHT1
        push dword [dword_18210C]
        mov dword [dword ebp-0506h], eax
        call FindShape
        add esp, byte 8
        push str_PHT2
        push dword [dword_18210C]
        mov dword [dword ebp-0502h], eax
        call FindShape
        add esp, byte 8
        jmp short .16
.15:
        push str_CRD0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push str_CRD1
        push dword [dword_18210C]
        mov dword [dword ebp-0506h], eax
        call FindShape
        add esp, byte 8
        push str_CRD2
        push dword [dword_18210C]
        mov dword [dword ebp-0502h], eax
        call FindShape
        add esp, byte 8
.16:
        mov dword [dword ebp-04FEh], eax
        mov dword [byte ebp-020h], 0
        mov dword [byte ebp-018h], 0
.17:
        mov esi, dword [byte ebp-018h]
        xor edi, edi
.18:
        push byte 0
        push str_PLY0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_PLY0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push dword [byte ebp-020h]
        push dword [byte edi+ebp-058h]
        push str_SD4
        mov dword [dword esi+ebp-017Ch], eax
        lea eax, [byte ebp-04Ch]
        push eax
        call sprintf_
        add esp, byte 10h
        push dword [dword esi+ebp-017Ch]
        call SetDrawBitmap
        add esp, byte 4
        push str_PLY0
        push dword [dword_18210C]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_PLY0
        push dword [dword_18210C]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        push byte 0
        push byte 0
        lea eax, [byte ebp-04Ch]
        push eax
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        add edi, byte 4
        add esi, byte 24h
        call DrawArt
        add esp, byte 0Ch
        cmp edi, byte 0Ch
        jne near .18
        inc dword [byte ebp-020h]
        add dword [byte ebp-018h], byte 4
        cmp dword [byte ebp-020h], byte 9
        jl near .17
        mov dword [byte ebp-020h], 0
        mov dword [byte ebp-014h], 0
.19:
        mov eax, dword [byte ebp-014h]
        xor edx, edx
        xor esi, esi
        mov ebx, eax
.20:
        mov edi, dword [dword ebx+ebp-0174h]
        mov edi, dword [byte edi+02Ch]
        mov dword [dword eax+ebp-0A0h], edi
        cmp dword [byte ebp-020h], byte 3
        je short .21
        mov edi, dword [dword ebx+ebp-0164h]
        jmp short .22
.21:
        mov edi, dword [dword esi+ebp-017Ch]
.22:
        mov edi, dword [byte edi+02Ch]
        mov dword [dword eax+ebp-0D0h], edi
        mov edi, dword [dword esi+ebp-017Ch]
        mov edi, dword [byte edi+02Ch]
        add eax, byte 10h
        mov dword [byte edx+ebp-070h], edi
        mov edi, dword [dword esi+ebp-0178h]
        add ebx, byte 24h
        add edx, byte 8
        mov edi, dword [byte edi+02Ch]
        add esi, byte 24h
        mov dword [byte edx+ebp-074h], edi
        cmp edx, byte 18h
        jne short .20
        inc dword [byte ebp-020h]
        add dword [byte ebp-014h], byte 4
        cmp dword [byte ebp-020h], byte 4
        jl short .19
        mov eax, dword [byte ebp-070h]
        mov dword [dword ebp-0836h], eax
        mov eax, dword [byte ebp-06Ch]
        push dword [dword_1820F4]
        mov dword [dword ebp-0832h], eax
        call SetColourRemap
        mov eax, dword [dword ebp-0858h]
        mov ebx, dword [dword ebp-0860h]
        mov edx, dword [dword_182104]
        add esp, byte 4
        xor ecx, ecx
        mov eax, dword [eax]
        call LoadPlayerCardArt
        mov ecx, 1
        mov edx, 0Ah
        mov ebx, dword [dword_182120]
        mov eax, dword [dword_182110]
        call SlideCardRight
        push dword [dword_1820FC]
        call SetColourRemap
        add esp, byte 4
        call SetScreenTarget
        push byte 5Dh
        mov eax, dword [dword_182120]
        push byte 61h
        push dword [byte eax+02Ch]
        call PutBlock
        mov eax, dword [dword ebp-0430h]
        shl eax, 2
        mov ecx, dword [dword ebp-0860h]
        add eax, dword [dword ebp-0854h]
        mov ebx, dword [byte ebp-030h]
        add esp, byte 0Ch
        mov edx, dword [eax]
        mov eax, dword [dword_18210C]
        call DrawPlayerCardName
        lea eax, [dword ebp-0454h]
        call DrawScrollBar
        mov eax, dword [dword ebp-0430h]
        shl eax, 2
        mov ecx, dword [byte ebp-02Ch]
        add eax, dword [dword ebp-0854h]
        push dword [dword ebp-0860h]
        mov ebx, dword [dword_18210C]
        mov edx, dword [eax]
        mov eax, dword [byte ebp-024h]
        xor esi, esi
        call DrawPlayerCardStats
.23:
        cmp dword [dword esi+ebp-0836h], byte 0
        je short .24
        push dword [dword esi+ebp-0826h]
        push dword [dword esi+ebp-082Ah]
        push dword [dword esi+ebp-0836h]
        call DrawArt
        add esp, byte 0Ch
.24:
        add esi, byte 66h
        cmp esi, 3FCh
        jne short .23
        mov ebx, 3
        mov edx, dword [dword_182104]
        xor eax, eax
        call FadePalette
        lea eax, [dword ebp-021Ch]
        add eax, 90h
        mov dword [byte ebp-0Ch], eax
        lea eax, [dword ebp-021Ch]
        add eax, 0A0h
        mov dword [byte ebp-010h], eax
        lea eax, [dword ebp-0850h]
        add eax, byte 42h
        mov dword [byte ebp-028h], 0FFFFFFFFh
        mov dword [byte ebp-04h], eax
        jmp near .64
.25:
        mov ebx, dword [byte ebp-04h]
        lea edx, [dword ebp-021Ch]
.26:
        mov ecx, 4
        mov esi, edx
        mov edi, ebx
        rep movsb
        add edx, byte 10h
        add ebx, byte 66h
        cmp edx, dword [byte ebp-010h]
        jne short .26
        mov esi, 0Ah
        mov byte [dword ebp-0544h], 9
        mov byte [dword ebp-07A8h], 9
        mov byte [dword ebp-080Ch], 9
.27:
        cmp dword [dword ebp-0860h], 1068h
        je short .28
        cmp dword [dword ebp-0860h], 0A410h
        je short .28
        cmp dword [dword ebp-0860h], byte 2Ah
        jne short .29
.28:
        mov byte [dword ebp-080Dh], 7
        mov byte [dword ebp-07A5h], 1
        mov byte [dword ebp-0541h], 0
.29:
        mov dword [byte ebp-028h], 0FFFFFFFFh
.30:
        cmp dword [byte ebp-028h], byte 0
        jge short .31
        push byte 3
        lea eax, [byte ebp-028h]
        push byte 3
        mov ecx, SwitchPlayerCard
        mov ebx, 0FFFFFFFFh
        push eax
        lea edx, [dword ebp-0850h]
        mov eax, esi
        call RunMenu
        jmp short .30
.31:
        mov eax, dword [dword ebp-0430h]
        shl eax, 2
        add eax, dword [dword ebp-0854h]
        cmp dword [byte ebp-028h], byte 4
        jb short .32
        cmp dword [byte ebp-028h], byte 7
        jbe near .44
        cmp dword [byte ebp-028h], byte 8
        jbe near .58
        cmp dword [byte ebp-028h], byte 9
        je near .67
        jmp near .64
.32:
        cmp dword [byte ebp-028h], byte 0
        jbe short .33
        cmp dword [byte ebp-028h], byte 1
        je near .43
        jmp near .64
.33:
        cmp dword [dword ebp-0860h], byte 2Ah
        jne short .34
        mov edx, dword [eax]
        mov eax, dword [dword_11E670]
        cmp dword [eax+edx*4], byte 0FFFFFFFFh
        je near .64
.34:
        mov eax, dword [byte ebp-024h]
        shl eax, 4
        mov esi, eax
        lea edi, [byte eax+010h]
.35:
        push str_PLY0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_PLY0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [dword esi+ebp-0A0h]
        call BlitShapeAt
        add esp, byte 0Ch
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.36:
        call TickDeadlinePassed
        test eax, eax
        je short .36
        add esi, byte 4
        cmp esi, edi
        jne short .35
        cmp dword [byte ebp-024h], byte 1
        jb short .37
        jbe short .38
        cmp dword [byte ebp-024h], byte 2
        je short .39
        jmp short .40
.37:
        cmp dword [byte ebp-024h], byte 0
        jne short .40
        cmp dword [dword ebp-0860h], 2AF8h
        jge short .38
        mov dword [byte ebp-024h], 1
        jmp short .40
.38:
        mov dword [byte ebp-024h], 2
        jmp short .40
.39:
        mov dword [byte ebp-024h], 0
.40:
        mov eax, dword [byte ebp-024h]
        shl eax, 4
        mov esi, eax
        lea edi, [byte eax+010h]
.41:
        push str_PLY0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_PLY0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [dword esi+ebp-0D0h]
        call BlitShapeAt
        add esp, byte 0Ch
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.42:
        call TickDeadlinePassed
        test eax, eax
        je short .42
        add esi, byte 4
        cmp esi, edi
        jne short .41
        mov eax, dword [dword ebp-0430h]
        shl eax, 2
        push dword [dword ebp-0860h]
        add eax, dword [dword ebp-0854h]
        mov ecx, dword [byte ebp-02Ch]
        mov ebx, dword [dword_18210C]
        mov edx, dword [eax]
        mov eax, dword [byte ebp-024h]
        call DrawPlayerCardStats
        mov edx, dword [byte ebp-024h]
        mov eax, dword [byte ebp+edx*8-070h]
        mov dword [dword ebp-0836h], eax
        mov eax, dword [byte ebp+edx*8-06Ch]
        mov dword [dword ebp-0832h], eax
        jmp near .64
.43:
        mov edx, dword [dword ebp-0860h]
        mov eax, dword [eax]
        call ExportPlayerCard
        jmp near .64
.44:
        mov edx, dword [dword ebp-0430h]
        cmp dword [byte ebp-028h], byte 5
        jb short .45
        cmp dword [byte ebp-028h], byte 6
        jbe short .46
        cmp dword [byte ebp-028h], byte 7
        je short .47
        jmp short .48
.45:
        cmp dword [byte ebp-028h], byte 4
        jne short .48
        lea eax, [dword ebp-0454h]
        call ScrollBarUp
        jmp short .48
.46:
        lea eax, [dword ebp-0454h]
        call ScrollBarToMouse
        jmp short .48
.47:
        lea eax, [dword ebp-0454h]
        call ScrollBarDown
.48:
        cmp edx, dword [dword ebp-0430h]
        je near .64
        cmp dword [dword ebp-0860h], byte 2Ah
        jne short .49
        mov eax, dword [dword ebp-0430h]
        shl eax, 2
        add eax, dword [dword ebp-0854h]
        mov edx, dword [eax]
        mov eax, dword [dword_11E670]
        cmp dword [eax+edx*4], byte 0FFFFFFFFh
        jne short .49
        mov edx, dword [byte ebp-024h]
        mov eax, dword [byte ebp+edx*8-070h]
        mov dword [dword ebp-0836h], eax
        mov eax, dword [byte ebp+edx*8-06Ch]
        mov dword [byte ebp-024h], 0
        mov dword [dword ebp-0832h], eax
.49:
        mov eax, dword [dword ebp-0430h]
        shl eax, 2
        add eax, dword [dword ebp-0854h]
        mov ecx, dword [dword ebp-0860h]
        mov ebx, dword [byte ebp-030h]
        mov edx, dword [eax]
        mov eax, dword [dword_18210C]
        call DrawPlayerCardName
        lea eax, [dword ebp-0454h]
        mov edx, dword [byte ebp-024h]
        call DrawScrollBar
        mov eax, dword [byte ebp+edx*8-070h]
        mov dword [dword ebp-0836h], eax
        mov eax, dword [byte ebp+edx*8-06Ch]
        mov dword [dword ebp-0832h], eax
        mov eax, dword [dword ebp-0430h]
        shl eax, 2
        mov ecx, dword [byte ebp-02Ch]
        add eax, dword [dword ebp-0854h]
        push dword [dword ebp-0860h]
        mov ebx, dword [dword_18210C]
        mov edx, dword [eax]
        mov eax, dword [byte ebp-024h]
        call DrawPlayerCardStats
        cmp dword [dword_11E87F], byte 0
        jne short .50
        mov dword [dword_11E87F], 1
        call GetTicks
        mov dword [dword_182114], eax
.50:
        cmp dword [dword_11E87F], byte 2
        jne short .51
        call GetTicks
        mov dword [dword_182114], eax
.51:
        cmp dword [dword_11E87F], byte 3
        jne short .54
        mov dword [dword_11E87F], 1
        call GetTicks
        mov edx, dword [dword_182114]
        add edx, byte 1Eh
        cmp eax, edx
        jle short .52
        call GetTicks
        jmp short .53
.52:
        sub eax, byte 1Eh
.53:
        mov dword [dword_182114], eax
.54:
        mov eax, dword [dword ebp-0430h]
        shl eax, 2
        add eax, dword [dword ebp-0854h]
        mov edx, dword [dword_1820A8]
        mov eax, dword [eax]
        mov eax, dword [edx+eax*4]
        movsx eax, byte [eax]
        cmp eax, byte 4Eh
        jne short .55
        mov eax, dword [byte ebp-038h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-0506h], eax
        mov eax, dword [byte ebp-038h]
        mov eax, dword [byte eax+02Ch]
        mov dword [dword ebp-0502h], eax
        mov eax, dword [byte ebp-038h]
        mov eax, dword [byte eax+02Ch]
        jmp near .57
.55:
        cmp dword [dword_11E887], byte 1
        jne short .56
        push str_PHT0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push str_PHT1
        push dword [dword_18210C]
        mov dword [dword ebp-0506h], eax
        call FindShape
        add esp, byte 8
        push str_PHT2
        push dword [dword_18210C]
        mov dword [dword ebp-0502h], eax
        call FindShape
        add esp, byte 8
        jmp short .57
.56:
        push str_CRD0
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push str_CRD1
        push dword [dword_18210C]
        mov dword [dword ebp-0506h], eax
        call FindShape
        add esp, byte 8
        push str_CRD2
        push dword [dword_18210C]
        mov dword [dword ebp-0502h], eax
        call FindShape
        add esp, byte 8
.57:
        mov dword [dword ebp-04FEh], eax
        mov eax, dword [dword ebp-0430h]
        shl eax, 2
        add eax, dword [dword ebp-0854h]
        mov edx, dword [dword ebp-0858h]
        mov eax, dword [eax]
        mov dword [edx], eax
        jmp near .64
.58:
        mov edx, dword [dword_1820A8]
        mov eax, dword [eax]
        mov eax, dword [edx+eax*4]
        movsx eax, byte [eax]
        cmp eax, byte 4Eh
        je near .64
        cmp dword [dword_11E87F], byte 3
        jne short .60
        mov dword [dword_11E87F], 1
        call GetTicks
        mov edx, dword [dword_182114]
        add edx, byte 1Eh
        cmp eax, edx
        jle short .59
        call GetTicks
        jmp short .61
.59:
        sub eax, byte 1Eh
        jmp short .61
.60:
        cmp dword [dword_11E87F], byte 0
        jne short .62
        mov dword [dword_11E87F], 1
        call GetTicks
.61:
        mov dword [dword_182114], eax
.62:
        cmp dword [dword_11E887], byte 1
        jne near .66
        push str_CRD0
        push dword [dword_18210C]
        mov dword [dword_11E887], 0
        call FindShape
        add esp, byte 8
        push str_CRD1
        push dword [dword_18210C]
        mov dword [dword ebp-0506h], eax
        call FindShape
        add esp, byte 8
        push str_CRD2
.63:
        push dword [dword_18210C]
        mov dword [dword ebp-0502h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-04FEh], eax
.64:
        cmp dword [byte ebp-028h], byte 3
        je near .69
        cmp dword [byte ebp-028h], byte 2
        je near .69
        cmp dword [byte ebp-028h], byte 9
        je near .69
        cmp byte [byte_182124], 0
        jne near .25
        mov ebx, dword [byte ebp-04h]
        lea edx, [dword ebp-021Ch]
.65:
        mov ecx, 4
        mov esi, edx
        mov edi, ebx
        rep movsb
        add edx, byte 10h
        add ebx, byte 66h
        cmp edx, dword [byte ebp-0Ch]
        jne short .65
        mov esi, 9
        jmp near .27
.66:
        push str_PHT0
        push dword [dword_18210C]
        mov dword [dword_11E887], 1
        call FindShape
        add esp, byte 8
        push str_PHT1
        push dword [dword_18210C]
        mov dword [dword ebp-0506h], eax
        call FindShape
        add esp, byte 8
        push str_PHT2
        jmp near .63
.67:
        cmp byte [byte_182124], 0
        jne short .68
        mov dword [byte ebp-028h], 0FFFFFFFFh
        jmp near .64
.68:
        push dword [byte ebp-02Ch]
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF74h
        push dword 0FFFFFE93h
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        call SetScreenTarget
        push dword 8Ch
        mov eax, dword [byte ebp-02Ch]
        push dword 16Dh
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        mov eax, 1
        call GetLangText
        mov dword [byte ebp-040h], eax
        mov eax, 22Dh
        call GetLangText
        push byte 2
        push byte 0
        push dword 0F0h
        mov ecx, byte_17BDAE
        mov dword [byte ebp-03Ch], eax
        push dword 1E0h
        mov eax, dword [dword ebp-0858h]
        lea ebx, [byte ebp-040h]
        push byte 0
        mov eax, dword [eax]
        mov edx, 2
        call GetTeamMovieText
        call MessageBox
        test eax, eax
        jne near .64
        mov eax, dword [dword ebp-0430h]
        mov dword [byte ebp-028h], 0FFFFFFFFh
        shl eax, 2
        push dword [dword ebp-0860h]
        add eax, dword [dword ebp-0854h]
        mov ecx, dword [byte ebp-02Ch]
        mov ebx, dword [dword_18210C]
        mov edx, dword [eax]
        mov eax, dword [byte ebp-024h]
        call DrawPlayerCardStats
        jmp near .64
.69:
        cmp dword [byte ebp-028h], byte 3
        jne short .70
        call SlideInSideBar
.70:
        mov eax, 3
        call FadeOut
        cmp dword [dword_1820F8], byte 0
        je short .71
        push dword [dword_1820F8]
        call FreeMemBlock
        add esp, byte 4
.71:
        mov dword [byte ebp-020h], 0
        push dword [dword_18210C]
        mov edi, 24h
        call FreeMemBlock
        add esp, byte 4
.72:
        mov dword [byte ebp-08h], edi
        imul esi, dword [byte ebp-020h], byte 24h
.73:
        push dword [dword esi+ebp-017Ch]
        call FreeBitmap
        add esi, byte 4
        add esp, byte 4
        cmp esi, dword [byte ebp-08h]
        jne short .73
        inc dword [byte ebp-020h]
        add edi, byte 24h
        cmp dword [byte ebp-020h], byte 3
        jl short .72
        push dword [dword_18211C]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp-038h]
        call FreeBitmap
        add esp, byte 4
        push dword [dword_182120]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp-034h]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp-02Ch]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp-030h]
        call FreeBitmap
        add esp, byte 4
        push dword [dword_1820F4]
        call FreeMemBlock
        add esp, byte 4
        push dword [dword_1820FC]
        call FreeMemBlock
        add esp, byte 4
        lea eax, [dword ebp-0454h]
        call FreeScrollBar
        cmp dword [byte ebp-028h], byte 3
        jne short .74
        mov eax, 0A412h
        leave
        pop edi
        pop esi
        ret
.74:
        cmp dword [byte ebp-028h], byte 9
        jne short .75
        mov eax, 0A415h
        leave
        pop edi
        pop esi
        ret
.75:
        mov eax, 0A413h
        leave
        pop edi
        pop esi
        ret
        push esi
        push edi
        enter 10h, 0
        push eax
        push edx
        mov esi, ebx
        mov dword [byte ebp-08h], ecx
        push byte 1Dh
        push ecx
        lea eax, [byte ebx-01h]
        push eax
        mov eax, dword [byte ebp-014h]
        push edx
        add eax, byte 0Fh
        push eax
        call FillRect
        mov eax, dword [byte ebp+010h]
        add eax, byte 5
        lea eax, [eax+eax*4]
        imul eax, esi
        mov ebx, 64h
        cdq
        idiv ebx
        mov esi, eax
        mov eax, dword [byte ebp-08h]
        dec eax
        mov dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp-014h]
        xor edi, edi
        add eax, byte 0Dh
        add esp, byte 14h
        mov dword [byte ebp-04h], eax
        jmp short .77
.76:
        mov eax, edi
        mov ebx, 0Fh
        cdq
        idiv ebx
        add eax, byte 3Ah
        push eax
        push dword [byte ebp-0Ch]
        push byte 0Dh
        push dword [byte ebp-018h]
        push dword [byte ebp-04h]
        add edi, byte 0Dh
        call FillRect
        add dword [byte ebp-04h], byte 0Dh
        add esp, byte 14h
.77:
        cmp edi, esi
        jl short .76
        mov eax, dword [byte ebp+010h]
        add eax, byte 5
        lea eax, [eax+eax*4]
        push eax
        push str_fmtpd
        lea eax, [byte ebp-010h]
        push eax
        mov ebx, dword [byte ebp-018h]
        xor edx, edx
        call sprintf_
        add esp, byte 0Ch
        mov eax, 0FCh
        inc ebx
        call SetTextColors
        mov edx, dword [byte ebp-014h]
        lea eax, [byte ebp-010h]
        inc edx
        call DrawColorText
        leave
        pop edi
        pop esi
        ret 4
unk_91F1C:
        dd DrawPlayerCardStats_1C4
        dd DrawPlayerCardStats_1DE
        dd DrawPlayerCardStats_1E4
        dd DrawPlayerCardStats_217
        dd DrawPlayerCardStats_21D
        dd DrawPlayerCardStats_223
        dd DrawPlayerCardStats_229
        dd DrawPlayerCardStats_22F
        dd DrawPlayerCardStats_235
        dd DrawPlayerCardStats_23B
        dd DrawPlayerCardStats_241
unk_91F48:
        dd DrawPlayerCardStats_3D9
        dd DrawPlayerCardStats_3F3
        dd DrawPlayerCardStats_3F9
        dd DrawPlayerCardStats_3FF
        dd DrawPlayerCardStats_405
        dd DrawPlayerCardStats_40B
        dd DrawPlayerCardStats_411
        dd DrawPlayerCardStats_417
        dd DrawPlayerCardStats_41D
        dd DrawPlayerCardStats_423
unk_91F70:
        dd DrawPlayerCardStats_5E6
        dd DrawPlayerCardStats_601
        dd DrawPlayerCardStats_607
        dd DrawPlayerCardStats_63A
        dd DrawPlayerCardStats_640
        dd DrawPlayerCardStats_646
        dd DrawPlayerCardStats_64C
        dd DrawPlayerCardStats_652
        dd DrawPlayerCardStats_658
        dd DrawPlayerCardStats_65E
        dd DrawPlayerCardStats_664
unk_91F9C:
        dd DrawPlayerCardStats_7FC
        dd DrawPlayerCardStats_817
        dd DrawPlayerCardStats_81D
        dd DrawPlayerCardStats_823
        dd DrawPlayerCardStats_829
        dd DrawPlayerCardStats_82F
        dd DrawPlayerCardStats_835
        dd DrawPlayerCardStats_83B
        dd DrawPlayerCardStats_841
        dd DrawPlayerCardStats_847
;-----------------------------------------------------------------------------
; DrawPlayerCardStats                          91FC4  96 PC, medium confidence
; The card's stats by season ('93-'94, '94-'95, this season), skater or
; goalie ('G')
;-----------------------------------------------------------------------------
DrawPlayerCardStats:
        push esi
        push edi
        enter 7Ch, 0
        push eax
        push edx
        push ebx
        push ecx
        sub ebp, byte 7Eh
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
        mov edx, dword [byte ebp-06h]
        mov dword [byte ebp+016h], 0
        mov eax, dword [byte ebp-06h]
        movsx edx, byte [dword edx+byte_17EBF0]
        shl eax, 2
        cmp edx, byte 47h
        jne short .1
        mov edx, dword [dword_11E670]
        mov eax, dword [edx+eax]
        call StatsDb1Record
        mov esi, eax
        jmp short .2
.1:
        mov edx, dword [dword_11E670]
        mov eax, dword [edx+eax]
        call StatsDb1Record
        mov edi, eax
.2:
        push dword [byte ebp-0Eh]
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFF74h
        push dword 0FFFFFE93h
        push str_Bkgd17
        push dword [byte ebp-0Ah]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        cmp dword [byte ebp-02h], byte 1
        jb short .3
        jbe short .4
        cmp dword [byte ebp-02h], byte 2
        je near DrawPlayerCardStats_423.41
        jmp near DrawPlayerCardStats_847.96
.3:
        cmp dword [byte ebp-02h], byte 0
        je near DrawPlayerCardStats_847.78
        jmp near DrawPlayerCardStats_847.96
.4:
        mov eax, dword [byte ebp-06h]
        movsx eax, byte [dword eax+byte_17EBF0]
        cmp eax, byte 47h
        jne near DrawPlayerCardStats_241.23
        cmp dword [dword ebp+08Eh], 3E8h
        jge short .5
        mov edx, 50h
        mov eax, str_9495
        xor ebx, ebx
        call DrawColorTextCentred
        mov edx, 96h
        mov eax, str_9394
        xor ebx, ebx
        call DrawColorTextCentred
        mov eax, 0C5h
        mov edx, 0DCh
        jmp short .6
.5:
        mov eax, 13Ah
        mov edx, 96h
.6:
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        mov eax, dword [byte ebp-06h]
        mov dword [byte ebp+05Ah], 0
        shl eax, 2
        mov dword [byte ebp+052h], 50h
        mov dword [byte ebp+01Ah], eax
.7:
        mov ecx, 14h
        cmp dword [byte ebp+05Ah], byte 1
        jb short .8
        jbe short .9
        cmp dword [byte ebp+05Ah], byte 2
        je short .10
        jmp short .12
.8:
        cmp dword [byte ebp+05Ah], byte 0
        jne short .12
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+01Ah]
        mov eax, dword [eax]
        call StatsDb1Record
        jmp short .11
.9:
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+01Ah]
        mov eax, dword [eax]
        call StatsDataBBRecord
        jmp short .11
.10:
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+01Ah]
        mov eax, dword [eax]
        call StatsData4Record
.11:
        mov esi, eax
.12:
        cmp dword [dword ebp+08Eh], 3E7h
        jle short .13
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+01Ah]
        mov eax, dword [eax]
        call StatsDb5Record
        mov esi, eax
.13:
        mov dword [byte ebp+06Ah], 0
        mov eax, dword [byte ebp+052h]
        xor edi, edi
        mov dword [byte ebp+01Eh], eax
.14:
        mov ebx, ecx
        mov eax, dword [dword edi+dword_11E6B4]
        xor edx, edx
        call GetLangText
        call DrawColorText
        cmp dword [byte ebp+06Ah], byte 0Ah
        ja near DrawPlayerCardStats_241.18
        jmp dword [dword cs:edi+unk_91F1C]
DrawPlayerCardStats_1C4:
        movzx eax, word [esi]
.15:
        push eax
        push str_fmtpd
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near DrawPlayerCardStats_241.20
DrawPlayerCardStats_1DE:
        movzx eax, word [byte esi+0Ch]
        jmp short DrawPlayerCardStats_1C4.15
DrawPlayerCardStats_1E4:
        movzx ebx, word [byte esi+010h]
        mov eax, ebx
        mov dword [byte ebp+07Ah], 64h
        cdq
        idiv dword [byte ebp+07Ah]
        push edx
        mov eax, ebx
        mov ebx, 64h
        cdq
        idiv ebx
        push eax
        push str_DD6
.16:
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp near DrawPlayerCardStats_241.20
DrawPlayerCardStats_217:
        movzx eax, word [byte esi+02h]
        jmp short DrawPlayerCardStats_1C4.15
DrawPlayerCardStats_21D:
        movzx eax, word [byte esi+04h]
        jmp short DrawPlayerCardStats_1C4.15
DrawPlayerCardStats_223:
        movzx eax, word [byte esi+06h]
        jmp short DrawPlayerCardStats_1C4.15
DrawPlayerCardStats_229:
        movzx eax, word [byte esi+0Ah]
        jmp short DrawPlayerCardStats_1C4.15
DrawPlayerCardStats_22F:
        movzx eax, word [byte esi+08h]
        jmp short DrawPlayerCardStats_1C4.15
DrawPlayerCardStats_235:
        movzx eax, word [byte esi+0Eh]
        jmp short DrawPlayerCardStats_1C4.15
DrawPlayerCardStats_23B:
        movzx eax, word [byte esi+012h]
        jmp short DrawPlayerCardStats_1C4.15
DrawPlayerCardStats_241:
        cmp word [byte esi+012h], byte 0
        jne short .17
        push str_002
        jmp short .19
.17:
        movzx ebx, word [byte esi+014h]
        mov eax, ebx
        mov dword [byte ebp+07Ah], 0Ah
        cdq
        idiv dword [byte ebp+07Ah]
        push edx
        mov eax, ebx
        mov ebx, 0Ah
        cdq
        idiv ebx
        push eax
        push str_DD7
        jmp short DrawPlayerCardStats_1E4.16
.18:
        mov eax, 0C6h
        call GetLangText
        push eax
.19:
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 8
.20:
        cmp dword [dword ebp+08Eh], 3E8h
        jge short .21
        mov edx, dword [byte ebp+01Eh]
        jmp short .22
.21:
        mov edx, 96h
.22:
        lea eax, [byte ebp+02h]
        mov ebx, ecx
        call DrawColorText
        inc dword [byte ebp+06Ah]
        add ecx, byte 14h
        add edi, byte 4
        cmp dword [byte ebp+06Ah], byte 0Bh
        jl near DrawPlayerCardStats.14
        inc dword [byte ebp+05Ah]
        add dword [byte ebp+052h], byte 46h
        cmp dword [byte ebp+05Ah], byte 3
        jge near DrawPlayerCardStats_847.96
        jmp near DrawPlayerCardStats.7
.23:
        cmp dword [dword ebp+08Eh], 3E8h
        jge short .24
        mov edx, 50h
        mov eax, str_9495
        xor ebx, ebx
        call DrawColorTextCentred
        mov edx, 96h
        mov eax, str_9394
        xor ebx, ebx
        call DrawColorTextCentred
        mov eax, 0C5h
        mov edx, 0DCh
        jmp short .25
.24:
        mov eax, 13Ah
        mov edx, 96h
.25:
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        mov eax, dword [byte ebp-06h]
        mov dword [byte ebp+05Eh], 0
        shl eax, 2
        mov dword [byte ebp+04Eh], 50h
        mov dword [byte ebp+022h], eax
.26:
        mov ecx, 14h
        cmp dword [byte ebp+05Eh], byte 1
        jb short .27
        jbe short .28
        cmp dword [byte ebp+05Eh], byte 2
        je short .29
        jmp short .31
.27:
        cmp dword [byte ebp+05Eh], byte 0
        jne short .31
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+022h]
        mov eax, dword [eax]
        call StatsDb1Record
        jmp short .30
.28:
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+022h]
        mov eax, dword [eax]
        call StatsDataBBRecord
        jmp short .30
.29:
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+022h]
        mov eax, dword [eax]
        call StatsData4Record
.30:
        mov edi, eax
.31:
        cmp dword [dword ebp+08Eh], 3E7h
        jle short .32
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+022h]
        mov eax, dword [eax]
        call StatsDb5Record
        mov edi, eax
.32:
        mov dword [byte ebp+06Eh], 0
        mov eax, dword [byte ebp+04Eh]
        xor esi, esi
        mov dword [byte ebp+026h], eax
.33:
        mov ebx, ecx
        mov eax, dword [dword esi+dword_11E684]
        xor edx, edx
        call GetLangText
        call DrawColorText
        cmp dword [byte ebp+06Eh], byte 9
        ja near DrawPlayerCardStats_423.36
        jmp dword [dword cs:esi+unk_91F48]
DrawPlayerCardStats_3D9:
        movzx eax, word [edi]
.34:
        push eax
        push str_fmtpd
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near DrawPlayerCardStats_423.38
DrawPlayerCardStats_3F3:
        movzx eax, word [byte edi+02h]
        jmp short DrawPlayerCardStats_3D9.34
DrawPlayerCardStats_3F9:
        movzx eax, word [byte edi+04h]
        jmp short DrawPlayerCardStats_3D9.34
DrawPlayerCardStats_3FF:
        movzx eax, word [byte edi+06h]
        jmp short DrawPlayerCardStats_3D9.34
DrawPlayerCardStats_405:
        movzx eax, word [byte edi+08h]
        jmp short DrawPlayerCardStats_3D9.34
DrawPlayerCardStats_40B:
        movzx eax, word [byte edi+0Ah]
        jmp short DrawPlayerCardStats_3D9.34
DrawPlayerCardStats_411:
        movsx eax, word [byte edi+010h]
        jmp short DrawPlayerCardStats_3D9.34
DrawPlayerCardStats_417:
        movzx eax, word [byte edi+0Ch]
        jmp short DrawPlayerCardStats_3D9.34
DrawPlayerCardStats_41D:
        movzx eax, word [byte edi+0Eh]
        jmp short DrawPlayerCardStats_3D9.34
DrawPlayerCardStats_423:
        cmp word [byte edi+0Eh], byte 0
        jne short .35
        push str_002
        jmp short .37
.35:
        movzx ebx, word [byte edi+02h]
        imul eax, ebx, dword 3E8h
        movzx edx, word [byte edi+0Eh]
        mov dword [byte ebp+036h], edx
        cdq
        idiv dword [byte ebp+036h]
        mov dword [byte ebp+07Ah], 0Ah
        cdq
        idiv dword [byte ebp+07Ah]
        imul eax, ebx, byte 64h
        push edx
        cdq
        idiv dword [byte ebp+036h]
        push eax
        push str_DD7
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .38
.36:
        mov eax, 0C6h
        call GetLangText
        push eax
.37:
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 8
.38:
        cmp dword [dword ebp+08Eh], 3E8h
        jge short .39
        mov edx, dword [byte ebp+026h]
        jmp short .40
.39:
        mov edx, 96h
.40:
        lea eax, [byte ebp+02h]
        mov ebx, ecx
        call DrawColorText
        inc dword [byte ebp+06Eh]
        add ecx, byte 14h
        add esi, byte 4
        cmp dword [byte ebp+06Eh], byte 0Ah
        jl near DrawPlayerCardStats_241.33
        inc dword [byte ebp+05Eh]
        add dword [byte ebp+04Eh], byte 46h
        cmp dword [byte ebp+05Eh], byte 3
        jge near DrawPlayerCardStats_847.96
        jmp near DrawPlayerCardStats_241.26
.41:
        mov eax, dword [byte ebp-06h]
        movsx eax, byte [dword eax+byte_17EBF0]
        cmp eax, byte 47h
        jne near DrawPlayerCardStats_664.60
        cmp dword [dword ebp+08Eh], 3E8h
        jge short .42
        mov edx, 50h
        mov eax, str_9495
        xor ebx, ebx
        call DrawColorTextCentred
        mov edx, 96h
        mov eax, str_9394
        xor ebx, ebx
        call DrawColorTextCentred
        mov eax, 0C5h
        mov edx, 0DCh
        jmp short .43
.42:
        mov eax, 13Bh
        mov edx, 96h
.43:
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        mov eax, dword [byte ebp-06h]
        mov dword [byte ebp+062h], 0
        shl eax, 2
        mov dword [byte ebp+04Ah], 50h
        mov dword [byte ebp+02Ah], eax
.44:
        mov ecx, 14h
        cmp dword [byte ebp+062h], byte 1
        jb short .45
        jbe short .46
        cmp dword [byte ebp+062h], byte 2
        je short .47
        jmp short .49
.45:
        cmp dword [byte ebp+062h], byte 0
        jne short .49
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+02Ah]
        mov eax, dword [eax]
        call StatsDb1Record
        jmp short .48
.46:
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+02Ah]
        mov eax, dword [eax]
        call StatsDataBBRecord
        jmp short .48
.47:
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+02Ah]
        mov eax, dword [eax]
        call StatsData4Record
.48:
        mov esi, eax
.49:
        cmp dword [dword ebp+08Eh], 3E7h
        jle short .50
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+02Ah]
        mov eax, dword [eax]
        call StatsDb5Record
        mov esi, eax
.50:
        mov dword [byte ebp+072h], 0
        mov eax, dword [byte ebp+04Ah]
        xor edi, edi
        mov dword [byte ebp+02Eh], eax
.51:
        mov ebx, ecx
        mov eax, dword [dword edi+dword_11E6B4]
        xor edx, edx
        call GetLangText
        call DrawColorText
        cmp dword [byte ebp+072h], byte 0Ah
        ja near DrawPlayerCardStats_664.55
        jmp dword [dword cs:edi+unk_91F70]
DrawPlayerCardStats_5E6:
        movzx eax, word [byte esi+016h]
.52:
        push eax
        push str_fmtpd
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near DrawPlayerCardStats_664.57
DrawPlayerCardStats_601:
        movzx eax, word [byte esi+022h]
        jmp short DrawPlayerCardStats_5E6.52
DrawPlayerCardStats_607:
        movzx ebx, word [byte esi+026h]
        mov eax, ebx
        mov dword [byte ebp+07Ah], 64h
        cdq
        idiv dword [byte ebp+07Ah]
        push edx
        mov eax, ebx
        mov ebx, 64h
        cdq
        idiv ebx
        push eax
        push str_DD6
.53:
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp near DrawPlayerCardStats_664.57
DrawPlayerCardStats_63A:
        movzx eax, word [byte esi+018h]
        jmp short DrawPlayerCardStats_5E6.52
DrawPlayerCardStats_640:
        movzx eax, word [byte esi+01Ah]
        jmp short DrawPlayerCardStats_5E6.52
DrawPlayerCardStats_646:
        movzx eax, word [byte esi+01Ch]
        jmp short DrawPlayerCardStats_5E6.52
DrawPlayerCardStats_64C:
        movzx eax, word [byte esi+020h]
        jmp short DrawPlayerCardStats_5E6.52
DrawPlayerCardStats_652:
        movzx eax, word [byte esi+01Eh]
        jmp short DrawPlayerCardStats_5E6.52
DrawPlayerCardStats_658:
        movzx eax, word [byte esi+024h]
        jmp short DrawPlayerCardStats_5E6.52
DrawPlayerCardStats_65E:
        movzx eax, word [byte esi+028h]
        jmp short DrawPlayerCardStats_5E6.52
DrawPlayerCardStats_664:
        cmp word [byte esi+028h], byte 0
        jne short .54
        push str_002
        jmp short .56
.54:
        movzx ebx, word [byte esi+02Ah]
        mov eax, ebx
        mov dword [byte ebp+07Ah], 0Ah
        cdq
        idiv dword [byte ebp+07Ah]
        push edx
        mov eax, ebx
        mov ebx, 0Ah
        cdq
        idiv ebx
        push eax
        push str_DD7
        jmp short DrawPlayerCardStats_607.53
.55:
        mov eax, 0C6h
        call GetLangText
        push eax
.56:
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 8
.57:
        cmp dword [dword ebp+08Eh], 3E8h
        jge short .58
        mov edx, dword [byte ebp+02Eh]
        jmp short .59
.58:
        mov edx, 96h
.59:
        lea eax, [byte ebp+02h]
        mov ebx, ecx
        call DrawColorText
        inc dword [byte ebp+072h]
        add ecx, byte 14h
        add edi, byte 4
        cmp dword [byte ebp+072h], byte 0Bh
        jl near DrawPlayerCardStats_423.51
        inc dword [byte ebp+062h]
        add dword [byte ebp+04Ah], byte 46h
        cmp dword [byte ebp+062h], byte 3
        jge near DrawPlayerCardStats_847.96
        jmp near DrawPlayerCardStats_423.44
.60:
        cmp dword [dword ebp+08Eh], 3E8h
        jge short .61
        mov edx, 50h
        mov eax, str_9495
        xor ebx, ebx
        call DrawColorTextCentred
        mov edx, 96h
        mov eax, str_9394
        xor ebx, ebx
        call DrawColorTextCentred
        mov eax, 0C5h
        mov edx, 0DCh
        jmp short .62
.61:
        mov eax, 13Bh
        mov edx, 96h
.62:
        xor ebx, ebx
        call GetLangText
        call DrawColorTextCentred
        mov eax, dword [byte ebp-06h]
        mov dword [byte ebp+066h], 0
        shl eax, 2
        mov dword [byte ebp+046h], 50h
        mov dword [byte ebp+032h], eax
.63:
        mov esi, 14h
        cmp dword [byte ebp+066h], byte 1
        jb short .64
        jbe short .65
        cmp dword [byte ebp+066h], byte 2
        je short .66
        jmp short .68
.64:
        cmp dword [byte ebp+066h], byte 0
        jne short .68
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+032h]
        mov eax, dword [eax]
        call StatsDb1Record
        jmp short .67
.65:
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+032h]
        mov eax, dword [eax]
        call StatsDataBBRecord
        jmp short .67
.66:
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+032h]
        mov eax, dword [eax]
        call StatsData4Record
.67:
        mov edi, eax
.68:
        cmp dword [dword ebp+08Eh], 3E7h
        jle short .69
        mov eax, dword [dword_11E670]
        add eax, dword [byte ebp+032h]
        mov eax, dword [eax]
        call StatsDb5Record
        mov edi, eax
.69:
        mov dword [byte ebp+076h], 0
        mov eax, dword [byte ebp+046h]
        xor ecx, ecx
        mov dword [byte ebp+03Ah], eax
.70:
        mov ebx, esi
        mov eax, dword [dword ecx+dword_11E684]
        xor edx, edx
        call GetLangText
        call DrawColorText
        cmp dword [byte ebp+076h], byte 9
        ja near DrawPlayerCardStats_847.73
        jmp dword [dword cs:ecx+unk_91F9C]
DrawPlayerCardStats_7FC:
        movzx eax, word [byte edi+012h]
.71:
        push eax
        push str_fmtpd
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near DrawPlayerCardStats_847.75
DrawPlayerCardStats_817:
        movzx eax, word [byte edi+014h]
        jmp short DrawPlayerCardStats_7FC.71
DrawPlayerCardStats_81D:
        movzx eax, word [byte edi+016h]
        jmp short DrawPlayerCardStats_7FC.71
DrawPlayerCardStats_823:
        movzx eax, word [byte edi+018h]
        jmp short DrawPlayerCardStats_7FC.71
DrawPlayerCardStats_829:
        movzx eax, word [byte edi+01Ah]
        jmp short DrawPlayerCardStats_7FC.71
DrawPlayerCardStats_82F:
        movzx eax, word [byte edi+01Ch]
        jmp short DrawPlayerCardStats_7FC.71
DrawPlayerCardStats_835:
        movsx eax, word [byte edi+022h]
        jmp short DrawPlayerCardStats_7FC.71
DrawPlayerCardStats_83B:
        movzx eax, word [byte edi+01Eh]
        jmp short DrawPlayerCardStats_7FC.71
DrawPlayerCardStats_841:
        movzx eax, word [byte edi+020h]
        jmp short DrawPlayerCardStats_7FC.71
DrawPlayerCardStats_847:
        cmp word [byte edi+020h], byte 0
        jne short .72
        push str_002
        jmp short .74
.72:
        movzx ebx, word [byte edi+014h]
        imul eax, ebx, dword 3E8h
        movzx edx, word [byte edi+020h]
        mov dword [byte ebp+036h], edx
        cdq
        idiv dword [byte ebp+036h]
        mov dword [byte ebp+07Ah], 0Ah
        cdq
        idiv dword [byte ebp+07Ah]
        imul eax, ebx, byte 64h
        push edx
        cdq
        idiv dword [byte ebp+036h]
        push eax
        push str_DD7
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .75
.73:
        mov eax, 0C6h
        call GetLangText
        push eax
.74:
        lea eax, [byte ebp+02h]
        push eax
        call sprintf_
        add esp, byte 8
.75:
        cmp dword [dword ebp+08Eh], 3E8h
        jge short .76
        mov edx, dword [byte ebp+03Ah]
        jmp short .77
.76:
        mov edx, 96h
.77:
        lea eax, [byte ebp+02h]
        mov ebx, esi
        call DrawColorText
        inc dword [byte ebp+076h]
        add esi, byte 14h
        add ecx, byte 4
        cmp dword [byte ebp+076h], byte 0Ah
        jl near DrawPlayerCardStats_664.70
        inc dword [byte ebp+066h]
        add dword [byte ebp+046h], byte 46h
        cmp dword [byte ebp+066h], byte 3
        jge near .96
        jmp near DrawPlayerCardStats_664.63
.78:
        mov edx, dword [byte ebp-06h]
        mov dword [byte ebp+056h], 0
        mov eax, dword [byte ebp-06h]
        movsx edx, byte [dword edx+byte_17EBF0]
        shl eax, 2
        cmp edx, byte 47h
        jne short .79
        mov edx, dword [dword_1820E4]
        mov eax, dword [edx+eax]
        mov dword [byte ebp+012h], 9
        call StatsDb2Record
        jmp short .80
.79:
        mov edx, dword [dword_1820E4]
        mov eax, dword [edx+eax]
        mov dword [byte ebp+012h], 0Eh
        call StatsDb2Record
.80:
        mov dword [byte ebp+0Eh], eax
        mov edi, dword [byte ebp+056h]
        mov eax, dword [byte ebp+016h]
        xor esi, esi
        add edi, byte 6Eh
        inc eax
        mov dword [byte ebp+03Eh], esi
        mov dword [byte ebp+042h], eax
        jmp near .95
.81:
        mov eax, dword [byte ebp-06h]
        movsx eax, byte [dword eax+byte_17EBF0]
        cmp eax, byte 47h
        jne short .82
        mov eax, dword [byte ebp+03Eh]
        mov ebx, dword [byte ebp+016h]
        mov eax, dword [dword eax+dword_11E85B]
        jmp short .84
.82:
        cmp esi, byte 0Dh
        jne short .83
        movsx eax, byte [dword esi+byte_11E844]
        add eax, dword [byte ebp+0Eh]
        movzx eax, byte [eax]
        cmp eax, byte 7
        je short .85
.83:
        mov eax, dword [byte ebp+03Eh]
        mov ebx, dword [byte ebp+016h]
        mov eax, dword [dword eax+dword_11E7E0]
.84:
        mov edx, dword [byte ebp+056h]
        call GetLangText
        call DrawColorText
.85:
        mov eax, dword [byte ebp-06h]
        movsx eax, byte [dword eax+byte_17EBF0]
        cmp eax, byte 47h
        jne short .87
        push byte 3Ah
        mov edx, 19h
        mov ecx, edi
        movsx eax, byte [dword esi+byte_11E852]
.86:
        push byte 0Ah
        add eax, dword [byte ebp+0Eh]
        xor ebx, ebx
        push dword 82h
        movzx eax, byte [eax]
        push dword [byte ebp+042h]
        add eax, byte 0Ah
        jmp near .93
.87:
        cmp esi, byte 0Bh
        jne short .88
        push byte 3Ah
        mov edx, 0Fh
        mov ecx, edi
        push byte 0Ah
        movsx eax, byte [dword esi+byte_11E844]
        push dword 82h
        xor ebx, ebx
        add eax, dword [byte ebp+0Eh]
        push dword [byte ebp+042h]
        movzx eax, byte [eax]
        jmp short .93
.88:
        cmp esi, byte 0Dh
        je short .89
        push byte 3Ah
        mov edx, 19h
        mov ecx, edi
        movsx eax, byte [dword esi+byte_11E844]
        jmp short .86
.89:
        movsx eax, byte [dword esi+byte_11E844]
        add eax, dword [byte ebp+0Eh]
        movzx eax, byte [eax]
        cmp eax, byte 6
        jle short .90
        sub eax, byte 7
.90:
        lea eax, [eax+eax*2]
        test eax, eax
        je short .91
        dec eax
.91:
        cmp eax, byte 0Fh
        jle short .92
        mov eax, 0Fh
.92:
        test eax, eax
        je short .94
        push byte 3Ah
        push byte 0Ah
        push dword 82h
        mov edx, 0Fh
        mov ecx, edi
        push dword [byte ebp+042h]
        xor ebx, ebx
.93:
        call RatingBar
.94:
        mov eax, 0FCh
        add dword [byte ebp+042h], byte 14h
        add dword [byte ebp+016h], byte 14h
        xor edx, edx
        add dword [byte ebp+03Eh], byte 4
        call SetTextColors
        inc esi
.95:
        cmp esi, dword [byte ebp+012h]
        jl near .81
.96:
        call SetScreenTarget
        push dword 8Ch
        mov eax, dword [byte ebp-0Eh]
        push dword 16Dh
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        lea esp, [byte ebp+07Eh]
        pop ebp
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; LoadPlayerCardArt                            92A6A  96 PC, medium confidence
; The player's picture (PROFILE.FSH, card, plyr, .FSH by team) and the team
; logo
;-----------------------------------------------------------------------------
LoadPlayerCardArt:
        push esi
        push edi
        enter 28h, 0
        push eax
        push edx
        push ebx
        push ecx
        cmp dword [dword_1820F8], byte 0
        je short .1
        push dword [dword_1820F8]
        call FreeMemBlock
        add esp, byte 4
.1:
        cmp dword [dword_11E887], byte 1
        jne near .4
        mov edi, dword [byte ebp-02Ch]
        mov eax, dword [dword_1820A8]
        shl edi, 2
        mov eax, dword [edi+eax]
        movsx eax, byte [eax]
        cmp eax, byte 4Eh
        je near .4
        mov eax, 0FFFFFFFBh
        call SelectDataLibrary
        mov eax, dword [dword_1820A8]
        mov ecx, 4
        mov esi, dword [edi+eax]
        lea edi, [byte ebp-028h]
        mov edx, str_FSH4
        rep movsb
        lea eax, [byte ebp-028h]
        mov byte [byte ebp-024h], 0
        call strcat_
        push byte 0
        lea eax, [byte ebp-028h]
        push eax
        call LoadResourceDataShared
        mov dword [dword_11E883], 0
        add esp, byte 8
        mov dword [dword_1820F8], eax
        test eax, eax
        je short .2
        push str_Card2
        push eax
        call FindShape
        add esp, byte 8
.2:
        mov dword [dword_182110], eax
        cmp dword [dword_182110], byte 0
        je short .3
        push str_Ard2
        push dword [dword_1820F8]
        call FindShape
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp-04h], eax
.3:
        mov dword [dword_11E88B], 1
        jmp near .7
.4:
        mov eax, 0FFFFFFF8h
        call SelectDataLibrary
        mov eax, dword [byte ebp-02Ch]
        mov edx, dword [dword_1820B0]
        mov ecx, 4
        lea edi, [byte ebp-028h]
        mov esi, dword [edx+eax*4]
        rep movsb
        mov edx, str_FSH4
        lea eax, [byte ebp-028h]
        mov byte [byte ebp-024h], 0
        call strcat_
        lea eax, [byte ebp-028h]
        push eax
        mov dword [dword_11E883], 1
        call DosFileInfo
        add esp, byte 4
        test eax, eax
        je short .5
        push byte 0
        lea eax, [byte ebp-028h]
        push eax
        call LoadResourceDataShared
        add esp, byte 8
        push str_Plyr2
        push eax
        mov dword [dword_1820F8], eax
        call FindShape
        add esp, byte 8
        push str_Pal23
        jmp short .6
.5:
        push eax
        push str_PROFILEFSH2
        call LoadResourceDataShared
        add esp, byte 8
        push str_Card2
        push eax
        mov dword [dword_1820F8], eax
        call FindShape
        add esp, byte 8
        push str_Ard2
.6:
        push dword [dword_1820F8]
        mov dword [dword_182110], eax
        call FindShape
        mov dword [dword_11E88B], 1
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp-04h], eax
.7:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-030h]
        lea esi, [dword eax+01C2h]
.8:
        inc edx
        mov bl, byte [eax]
        inc eax
        mov byte [dword edx+0C5h], bl
        cmp eax, esi
        jne short .8
        cmp dword [dword_11E883], byte 1
        jne near .13
        mov eax, str_WesternConference2
        mov edx, dword [byte ebp-030h]
        lea esi, [dword eax+0C0h]
.9:
        inc edx
        mov bl, byte [dword eax+01F2h]
        inc eax
        mov byte [dword edx+01F1h], bl
        cmp eax, esi
        jne short .9
        push dword [dword_18211C]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        cmp dword [byte ebp-034h], 3E7h
        jle short .10
        cmp dword [byte ebp-034h], 2AF8h
        jge short .10
        push str_HD022
        jmp short .11
.10:
        cmp dword [byte ebp-034h], 2AF7h
        jle short .12
        push str_HD00
.11:
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
.12:
        mov eax, dword [byte ebp-02Ch]
        mov eax, dword [nosplit eax*4+dword_17EEF0]
        mov ecx, 0Ah
        movsx eax, byte [eax]
        xor ebx, ebx
        call LoadTeamLogo
        mov edx, eax
        mov eax, 9999h
        call DrawFrameAt
        jmp short .14
.13:
        push dword [dword_18211C]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push str_Bkgd17
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        push byte 14h
        push byte 0Ah
        push str_DNRS
        push dword [dword_18210C]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArt
        add esp, byte 0Ch
.14:
        call SetScreenTarget
        push byte 0
        mov eax, dword [dword_18211C]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        mov eax, dword [byte ebp-02Ch]
        mov eax, dword [nosplit eax*4+dword_17EEF0]
        movsx eax, byte [eax]
        mov dword [dword_182108], eax
        cmp dword [byte ebp-038h], byte 0
        je short .15
        push dword [byte ebp-030h]
        push dword 100h
        push byte 0
        call SetPaletteEntries
        add esp, byte 0Ch
.15:
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawPlayerCardName                           92D6F  96 PC, medium confidence
; The card's name line ("#%d %s %s") and profile texts
;-----------------------------------------------------------------------------
DrawPlayerCardName:
        push esi
        push edi
        enter 38h, 0
        push eax
        mov esi, edx
        mov edi, ebx
        mov dword [byte ebp-08h], ecx
        push ebx
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFE8Dh
        push byte 0FFFFFF9Bh
        push str_Bkgd17
        push dword [byte ebp-03Ch]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        mov eax, dword [dword_1820E8]
        add esp, byte 0Ch
        mov ebx, esi
        push dword [eax+ebx*4]
        mov eax, dword [dword_1820EC]
        push dword [eax+ebx*4]
        mov eax, dword [dword_1820AC]
        mov eax, dword [eax+ebx*4]
        movzx eax, byte [eax]
        push eax
        push str_DSS2
        lea eax, [byte ebp-038h]
        push eax
        xor edx, edx
        call sprintf_
        add esp, byte 14h
        mov eax, 0FCh
        xor ebx, ebx
        call SetTextColors
        mov edx, 62h
        lea eax, [byte ebp-038h]
        call DrawColorTextCentred
        mov al, byte [dword esi+byte_17EBF0]
        cmp al, 47h
        jb short .1
        jbe short .2
        cmp al, 4Ch
        jb short .7
        jbe short .3
        cmp al, 52h
        je short .5
        jmp short .7
.1:
        cmp al, 43h
        jb short .7
        jbe short .4
        cmp al, 44h
        je short .6
        jmp short .7
.2:
        mov eax, 0C7h
        jmp short .8
.3:
        mov eax, 0C8h
        jmp short .8
.4:
        mov eax, 0C9h
        jmp short .8
.5:
        mov eax, 0CAh
        jmp short .8
.6:
        mov eax, 0CBh
        jmp short .8
.7:
        mov eax, 0CCh
.8:
        call GetLangText
        push eax
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        add esp, byte 8
        mov ebx, 13h
        lea eax, [byte ebp-038h]
        xor edx, edx
        call DrawColorText
        mov eax, esi
        movsx edx, byte [dword esi+byte_17EBF0]
        shl eax, 2
        cmp edx, byte 47h
        jne short .10
        mov edx, dword [dword_1820E4]
        mov eax, dword [edx+eax]
        call StatsDb2Record
        movzx eax, byte [eax]
        test eax, eax
        jne short .9
        mov eax, 0CDh
        jmp short .12
.9:
        mov eax, 0CEh
        jmp short .12
.10:
        mov edx, dword [dword_1820E4]
        mov eax, dword [edx+eax]
        call StatsDb2Record
        movzx eax, byte [eax]
        test eax, eax
        je short .11
        mov eax, 0CFh
        jmp short .12
.11:
        mov eax, 0D0h
.12:
        mov ebx, 14h
        mov edx, 62h
        call GetLangText
        call DrawColorText
        mov eax, esi
        shl eax, 2
        test byte [optflags], 0Ch
        jne short .13
        mov ebx, dword [dword_17FDF0]
        mov ebx, dword [ebx+eax]
        movzx ebx, byte [ebx]
        mov eax, ebx
        mov ecx, 0Ch
        cdq
        idiv ecx
        mov eax, ebx
        push edx
        cdq
        idiv ecx
        jmp short .14
.13:
        mov edx, dword [dword_17FDF0]
        mov eax, dword [edx+eax]
        movzx ax, byte [eax]
        mov dword [byte ebp-04h], eax
        fild word [byte ebp-04h]
        fmul qword [qword_1129AF]
        call __CHP
        fistp dword [byte ebp-0Ch]
        mov eax, dword [byte ebp-0Ch]
        mov ebx, 64h
        cdq
        idiv ebx
        mov eax, dword [byte ebp-0Ch]
        push edx
        cdq
        idiv ebx
.14:
        push eax
        mov eax, 0D1h
        call GetLangText
        push eax
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        add esp, byte 10h
        mov ebx, 28h
        lea eax, [byte ebp-038h]
        xor edx, edx
        call DrawColorText
        mov eax, esi
        shl eax, 2
        test byte [optflags], 0Ch
        jne short .15
        mov edx, dword [dword_17FDF4]
        mov eax, dword [edx+eax]
        movzx eax, byte [eax]
        push eax
        jmp short .16
.15:
        mov edx, dword [dword_17FDF4]
        mov eax, dword [edx+eax]
        movzx ax, byte [eax]
        mov dword [byte ebp-04h], eax
        fild word [byte ebp-04h]
        fmul qword [qword_1129B7]
        call __CHP
        fistp dword [byte ebp-010h]
        push dword [byte ebp-010h]
.16:
        mov eax, 0D2h
        call GetLangText
        push eax
        lea eax, [byte ebp-038h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        mov ebx, 28h
        mov edx, 62h
        lea eax, [byte ebp-038h]
        call DrawColorText
        call SetScreenTarget
        push dword 173h
        push byte 65h
        push dword [byte edi+02Ch]
        call PutBlock
        mov byte [byte_182124], 0
        mov ecx, esi
        add esp, byte 0Ch
        shl ecx, 2
        xor esi, esi
.17:
        mov eax, dword [dword_1820B0]
        mov ebx, 4
        mov edx, dword [dword esi+off_11E764]
        mov eax, dword [ecx+eax]
        call memcmp_
        test eax, eax
        jne short .18
        cmp dword [byte ebp-08h], byte 0
        jne short .18
        mov byte [byte_182124], 1
.18:
        add esi, byte 4
        cmp esi, byte 54h
        jne short .17
        cmp byte [byte_182124], 0
        jne short .19
        push byte 0
        push byte 46h
        push byte 50h
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov esi, eax
        call SetDrawBitmap
        add esp, byte 4
        push byte 0FFFFFF9Ch
        push dword 0FFFFFEE8h
        push str_Bkgd17
        push dword [byte ebp-03Ch]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        call SetScreenTarget
        push byte 64h
        push dword 118h
        push dword [byte esi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push esi
        call FreeBitmap
        add esp, byte 4
.19:
        leave
        pop edi
        pop esi
        ret
unk_93072:
        dd ExportPlayerCard_2BF
        dd ExportPlayerCard_2D9
        dd ExportPlayerCard_2DF
        dd ExportPlayerCard_312
        dd ExportPlayerCard_318
        dd ExportPlayerCard_31E
        dd ExportPlayerCard_324
        dd ExportPlayerCard_32A
        dd ExportPlayerCard_330
        dd ExportPlayerCard_336
        dd ExportPlayerCard_33C
unk_9309E:
        dd ExportPlayerCard_438
        dd ExportPlayerCard_453
        dd ExportPlayerCard_459
        dd ExportPlayerCard_48C
        dd ExportPlayerCard_492
        dd ExportPlayerCard_498
        dd ExportPlayerCard_49E
        dd ExportPlayerCard_4A4
        dd ExportPlayerCard_4AA
        dd ExportPlayerCard_4B0
        dd ExportPlayerCard_4B6
unk_930CA:
        dd ExportPlayerCard_703
        dd ExportPlayerCard_71D
        dd ExportPlayerCard_723
        dd ExportPlayerCard_729
        dd ExportPlayerCard_72F
        dd ExportPlayerCard_735
        dd ExportPlayerCard_73B
        dd ExportPlayerCard_741
        dd ExportPlayerCard_747
        dd ExportPlayerCard_74D
unk_930F2:
        dd ExportPlayerCard_860
        dd ExportPlayerCard_87B
        dd ExportPlayerCard_881
        dd ExportPlayerCard_887
        dd ExportPlayerCard_88D
        dd ExportPlayerCard_893
        dd ExportPlayerCard_899
        dd ExportPlayerCard_89F
        dd ExportPlayerCard_8A5
        dd ExportPlayerCard_8AB
;-----------------------------------------------------------------------------
; ExportPlayerCard                             9311A  96 PC, medium confidence
; Asks a file name and writes the player's card as text (fopen "wt", "#%d %s
; %s.")
;-----------------------------------------------------------------------------
ExportPlayerCard:
        push ebx
        push ecx
        push esi
        push edi
        enter 44h, 0
        push eax
        push edx
        mov ecx, 14h
        lea edi, [byte ebp-030h]
        xor eax, eax
        rep stosb
        lea eax, [byte ebp-030h]
        push eax
        push dword 0F0h
        mov ebx, byte_17BDAE
        push dword 140h
        mov eax, 0D3h
        mov ecx, 8
        call GetLangText
        mov edx, eax
        xor eax, eax
        call EditText
        test eax, eax
        je near DrawLeagueLogo_7D
        lea eax, [byte ebp-030h]
        call strlen_
        test eax, eax
        je near DrawLeagueLogo_7D
        lea eax, [byte ebp-030h]
        call CheckExportName
        test eax, eax
        jne near DrawLeagueLogo_7D
        mov edx, str_Wt4
        lea eax, [byte ebp-030h]
        mov ecx, 0F0h
        mov ebx, 140h
        call fopen_
        push byte 2
        mov edi, eax
        mov esi, eax
        mov eax, 34h
        mov edx, byte_17BDAE
        call GetLangText
        call ShowProgressBox
        cmp dword [byte ebp-04Ch], 3E7h
        jge short .1
        mov eax, 0D4h
        call GetLangText
        push eax
        jmp short .3
.1:
        cmp dword [byte ebp-04Ch], 2AF8h
        jge short .2
        push SeasonUserTeam
        mov eax, 49h
        call GetLangText
        push eax
        push edi
        call fprintf_
        add esp, byte 0Ch
        push unk_1129C2
        jmp short .3
.2:
        push byte_17D13A
        mov eax, 133h
        call GetLangText
        push eax
        push edi
        call fprintf_
        add esp, byte 0Ch
        push unk_1129C2
.3:
        push edi
        call fprintf_
        add esp, byte 8
        mov eax, 0D5h
        call GetLangText
        push eax
        push esi
        call fprintf_
        mov eax, dword [byte ebp-048h]
        mov edx, dword [dword_1820E8]
        add esp, byte 8
        push dword [edx+eax*4]
        mov edx, dword [dword_1820EC]
        push dword [edx+eax*4]
        mov edx, dword [dword_1820AC]
        mov eax, dword [edx+eax*4]
        movzx eax, byte [eax]
        push eax
        push str_DSS3
        push esi
        call fprintf_
        mov eax, dword [byte ebp-048h]
        mov al, byte [dword eax+byte_17EBF0]
        add esp, byte 14h
        cmp al, 47h
        jb short .4
        jbe short .5
        cmp al, 4Ch
        jb short .10
        jbe short .6
        cmp al, 52h
        je short .8
        jmp short .10
.4:
        cmp al, 43h
        jb short .10
        jbe short .7
        cmp al, 44h
        je short .9
        jmp short .10
.5:
        mov eax, 0C7h
        jmp short .11
.6:
        mov eax, 0C8h
        jmp short .11
.7:
        mov eax, 0C9h
        jmp short .11
.8:
        mov eax, 0CAh
        jmp short .11
.9:
        mov eax, 0CBh
        jmp short .11
.10:
        mov eax, 0CCh
.11:
        call GetLangText
        push eax
        push esi
        call fprintf_
        add esp, byte 8
        mov edx, dword [byte ebp-048h]
        mov eax, dword [byte ebp-048h]
        movsx edx, byte [dword edx+byte_17EBF0]
        shl eax, 2
        cmp edx, byte 47h
        jne near ExportPlayerCard_4B6.46
        cmp dword [byte ebp-04Ch], 3E7h
        jle short .12
        mov edx, dword [dword_11E670]
        mov eax, dword [edx+eax]
        call StatsDb5Record
        jmp short .13
.12:
        mov edx, dword [dword_11E670]
        mov eax, dword [edx+eax]
        call StatsDb1Record
.13:
        mov ebx, eax
        mov eax, dword [byte ebp-048h]
        mov edx, dword [dword_1820E4]
        mov eax, dword [edx+eax*4]
        call StatsDb2Record
        push asc_1129CF
        push esi
        mov dword [byte ebp-010h], eax
        xor edx, edx
        call fprintf_
        add esp, byte 8
.14:
        mov eax, dword [dword edx+dword_11E6B4]
        call GetLangText
        push eax
        push esi
        mov ecx, edx
        xor edi, edi
        jmp short .16
.15:
        push unk_1129E4
        push esi
        inc edi
.16:
        call fprintf_
        add esp, byte 8
        mov eax, dword [dword ecx+dword_11E6B4]
        call GetLangText
        call strlen_
        mov dword [byte ebp-018h], eax
        mov eax, 0Ah
        sub eax, dword [byte ebp-018h]
        cmp edi, eax
        jb short .15
        add edx, byte 4
        cmp edx, byte 2Ch
        jne short .14
        mov eax, 13Ah
        call GetLangText
        push eax
        push asc_1129E6
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-044h]
        push eax
        push str_S5
        push esi
        xor edi, edi
        call fprintf_
        add esp, byte 0Ch
        jmp short .18
.17:
        push unk_1129E4
        push esi
        inc edi
        call fprintf_
        add esp, byte 8
.18:
        lea eax, [byte ebp-044h]
        mov edx, 15h
        call strlen_
        sub edx, eax
        cmp edi, edx
        jb short .17
        mov dword [byte ebp-08h], 0
        xor edi, edi
.19:
        cmp dword [byte ebp-08h], byte 0Ah
        ja near ExportPlayerCard_33C.23
        jmp dword [dword cs:edi+unk_93072]
ExportPlayerCard_2BF:
        movzx eax, word [ebx]
.20:
        push eax
        push str_fmtpd
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near ExportPlayerCard_33C.25
ExportPlayerCard_2D9:
        movzx eax, word [byte ebx+0Ch]
        jmp short ExportPlayerCard_2BF.20
ExportPlayerCard_2DF:
        movzx ecx, word [byte ebx+010h]
        mov eax, ecx
        mov dword [byte ebp-04h], 64h
        cdq
        idiv dword [byte ebp-04h]
        push edx
        mov eax, ecx
        mov ecx, 64h
        cdq
        idiv ecx
        push eax
        push str_DD6
.21:
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp near ExportPlayerCard_33C.25
ExportPlayerCard_312:
        movzx eax, word [byte ebx+02h]
        jmp short ExportPlayerCard_2BF.20
ExportPlayerCard_318:
        movzx eax, word [byte ebx+04h]
        jmp short ExportPlayerCard_2BF.20
ExportPlayerCard_31E:
        movzx eax, word [byte ebx+06h]
        jmp short ExportPlayerCard_2BF.20
ExportPlayerCard_324:
        movzx eax, word [byte ebx+0Ah]
        jmp short ExportPlayerCard_2BF.20
ExportPlayerCard_32A:
        movzx eax, word [byte ebx+08h]
        jmp short ExportPlayerCard_2BF.20
ExportPlayerCard_330:
        movzx eax, word [byte ebx+0Eh]
        jmp short ExportPlayerCard_2BF.20
ExportPlayerCard_336:
        movzx eax, word [byte ebx+012h]
        jmp short ExportPlayerCard_2BF.20
ExportPlayerCard_33C:
        cmp word [byte ebx+012h], byte 0
        jne short .22
        push str_002
        jmp short .24
.22:
        movzx ecx, word [byte ebx+014h]
        mov eax, ecx
        mov dword [byte ebp-04h], 0Ah
        cdq
        idiv dword [byte ebp-04h]
        push edx
        mov eax, ecx
        mov ecx, 0Ah
        cdq
        idiv ecx
        push eax
        push str_DD8
        jmp short ExportPlayerCard_2DF.21
.23:
        mov eax, 0C6h
        call GetLangText
        push eax
.24:
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 8
.25:
        lea eax, [byte ebp-044h]
        push eax
        push esi
        xor edx, edx
        jmp short .27
.26:
        push unk_1129E4
        push esi
        inc edx
.27:
        call fprintf_
        add esp, byte 8
        lea eax, [byte ebp-044h]
        mov ecx, 0Ah
        call strlen_
        sub ecx, eax
        cmp edx, ecx
        jb short .26
        inc dword [byte ebp-08h]
        add edi, byte 4
        cmp dword [byte ebp-08h], byte 0Bh
        jl near ExportPlayerCard.19
        mov eax, 1
        call UpdateProgressBox
        mov eax, 13Bh
        call GetLangText
        push eax
        push asc_1129E6
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-044h]
        push eax
        push str_S5
        push esi
        xor edi, edi
        call fprintf_
        add esp, byte 0Ch
        jmp short .29
.28:
        push unk_1129E4
        push esi
        inc edi
        call fprintf_
        add esp, byte 8
.29:
        lea eax, [byte ebp-044h]
        mov edx, 15h
        call strlen_
        sub edx, eax
        cmp edi, edx
        jb short .28
        mov dword [byte ebp-0Ch], 0
        xor edi, edi
.30:
        cmp dword [byte ebp-0Ch], byte 0Ah
        ja near ExportPlayerCard_4B6.34
        jmp dword [dword cs:edi+unk_9309E]
ExportPlayerCard_438:
        movzx eax, word [byte ebx+016h]
.31:
        push eax
        push str_fmtpd
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near ExportPlayerCard_4B6.36
ExportPlayerCard_453:
        movzx eax, word [byte ebx+022h]
        jmp short ExportPlayerCard_438.31
ExportPlayerCard_459:
        movzx ecx, word [byte ebx+026h]
        mov eax, ecx
        mov dword [byte ebp-04h], 64h
        cdq
        idiv dword [byte ebp-04h]
        push edx
        mov eax, ecx
        mov ecx, 64h
        cdq
        idiv ecx
        push eax
        push str_DD6
.32:
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp near ExportPlayerCard_4B6.36
ExportPlayerCard_48C:
        movzx eax, word [byte ebx+018h]
        jmp short ExportPlayerCard_438.31
ExportPlayerCard_492:
        movzx eax, word [byte ebx+01Ah]
        jmp short ExportPlayerCard_438.31
ExportPlayerCard_498:
        movzx eax, word [byte ebx+01Ch]
        jmp short ExportPlayerCard_438.31
ExportPlayerCard_49E:
        movzx eax, word [byte ebx+020h]
        jmp short ExportPlayerCard_438.31
ExportPlayerCard_4A4:
        movzx eax, word [byte ebx+01Eh]
        jmp short ExportPlayerCard_438.31
ExportPlayerCard_4AA:
        movzx eax, word [byte ebx+024h]
        jmp short ExportPlayerCard_438.31
ExportPlayerCard_4B0:
        movzx eax, word [byte ebx+028h]
        jmp short ExportPlayerCard_438.31
ExportPlayerCard_4B6:
        cmp word [byte ebx+028h], byte 0
        jne short .33
        push str_002
        jmp short .35
.33:
        movzx ecx, word [byte ebx+02Ah]
        mov eax, ecx
        mov dword [byte ebp-04h], 0Ah
        cdq
        idiv dword [byte ebp-04h]
        push edx
        mov eax, ecx
        mov ecx, 0Ah
        cdq
        idiv ecx
        push eax
        push str_DD8
        jmp short ExportPlayerCard_459.32
.34:
        mov eax, 0C6h
        call GetLangText
        push eax
.35:
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 8
.36:
        lea eax, [byte ebp-044h]
        push eax
        push esi
        xor edx, edx
        jmp short .38
.37:
        push unk_1129E4
        push esi
        inc edx
.38:
        call fprintf_
        add esp, byte 8
        lea eax, [byte ebp-044h]
        mov ecx, 0Ah
        call strlen_
        sub ecx, eax
        cmp edx, ecx
        jb short .37
        inc dword [byte ebp-0Ch]
        add edi, byte 4
        cmp dword [byte ebp-0Ch], byte 0Bh
        jl near ExportPlayerCard_33C.30
        push unk_1129C2
        push esi
        xor ebx, ebx
        xor edx, edx
        call fprintf_
        add esp, byte 8
.39:
        mov eax, dword [dword edx+dword_11E85B]
        call GetLangText
        push eax
        push asc_1129E6
        push esi
        mov ecx, edx
        xor edi, edi
        call fprintf_
        add esp, byte 0Ch
        jmp short .41
.40:
        push unk_1129E4
        push esi
        inc edi
        call fprintf_
        add esp, byte 8
.41:
        mov eax, dword [dword ecx+dword_11E85B]
        call GetLangText
        call strlen_
        mov dword [byte ebp-018h], eax
        mov eax, 14h
        sub eax, dword [byte ebp-018h]
        cmp edi, eax
        jb short .40
        test ebx, ebx
        je short .42
        movsx eax, byte [dword ebx+byte_11E852]
        add eax, dword [byte ebp-010h]
        movzx eax, byte [eax]
        add eax, byte 5
        lea eax, [eax+eax*4]
        push eax
        push str_fmtpd
        push esi
        call fprintf_
        add esp, byte 0Ch
        jmp short .45
.42:
        mov eax, dword [byte ebp-010h]
        cmp byte [eax], 0
        jne short .43
        mov eax, 0D8h
        jmp short .44
.43:
        mov eax, 0D9h
.44:
        call GetLangText
        push eax
        push esi
        call fprintf_
        add esp, byte 8
.45:
        inc ebx
        add edx, byte 4
        cmp ebx, byte 9
        jge near ExportPlayerCard_8AB.77
        jmp near .39
.46:
        cmp dword [byte ebp-04Ch], 3E7h
        jle short .47
        mov edx, dword [dword_11E670]
        mov eax, dword [edx+eax]
        call StatsDb5Record
        jmp short .48
.47:
        mov edx, dword [dword_11E670]
        mov eax, dword [edx+eax]
        call StatsDb1Record
.48:
        mov ebx, eax
        mov eax, dword [byte ebp-048h]
        mov edx, dword [dword_1820E4]
        mov eax, dword [edx+eax*4]
        call StatsDb2Record
        push asc_1129CF
        push esi
        mov dword [byte ebp-01Ch], eax
        xor edx, edx
        call fprintf_
        add esp, byte 8
.49:
        mov eax, dword [dword edx+dword_11E684]
        call GetLangText
        push eax
        push esi
        mov edi, edx
        xor ecx, ecx
        jmp short .51
.50:
        push unk_1129E4
        push esi
        inc ecx
.51:
        call fprintf_
        add esp, byte 8
        mov eax, dword [dword edi+dword_11E684]
        call GetLangText
        call strlen_
        mov dword [byte ebp-018h], eax
        mov eax, 0Ah
        sub eax, dword [byte ebp-018h]
        cmp ecx, eax
        jb short .50
        add edx, byte 4
        cmp edx, byte 24h
        jne short .49
        push unk_1129F7
        push esi
        call fprintf_
        add esp, byte 8
        mov eax, 13Ah
        call GetLangText
        push eax
        push asc_1129E6
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-044h]
        push eax
        push str_S5
        push esi
        xor ecx, ecx
        call fprintf_
        add esp, byte 0Ch
        jmp short .53
.52:
        push unk_1129E4
        push esi
        inc ecx
        call fprintf_
        add esp, byte 8
.53:
        lea eax, [byte ebp-044h]
        mov edx, 15h
        call strlen_
        sub edx, eax
        cmp ecx, edx
        jb short .52
        xor ecx, ecx
        xor edi, edi
.54:
        cmp ecx, byte 9
        ja near ExportPlayerCard_74D.57
        jmp dword [dword cs:edi+unk_930CA]
ExportPlayerCard_703:
        movzx eax, word [ebx]
.55:
        push eax
        push str_fmtpd
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near ExportPlayerCard_74D.59
ExportPlayerCard_71D:
        movzx eax, word [byte ebx+02h]
        jmp short ExportPlayerCard_703.55
ExportPlayerCard_723:
        movzx eax, word [byte ebx+04h]
        jmp short ExportPlayerCard_703.55
ExportPlayerCard_729:
        movzx eax, word [byte ebx+06h]
        jmp short ExportPlayerCard_703.55
ExportPlayerCard_72F:
        movzx eax, word [byte ebx+08h]
        jmp short ExportPlayerCard_703.55
ExportPlayerCard_735:
        movzx eax, word [byte ebx+0Ah]
        jmp short ExportPlayerCard_703.55
ExportPlayerCard_73B:
        movsx eax, word [byte ebx+010h]
        jmp short ExportPlayerCard_703.55
ExportPlayerCard_741:
        movzx eax, word [byte ebx+0Ch]
        jmp short ExportPlayerCard_703.55
ExportPlayerCard_747:
        movzx eax, word [byte ebx+0Eh]
        jmp short ExportPlayerCard_703.55
ExportPlayerCard_74D:
        cmp word [byte ebx+0Eh], byte 0
        jne short .56
        push str_002
        jmp short .58
.56:
        movzx eax, word [byte ebx+02h]
        mov dword [byte ebp-014h], eax
        imul eax, dword 3E8h
        movzx edx, word [byte ebx+0Eh]
        mov dword [byte ebp-018h], edx
        cdq
        idiv dword [byte ebp-018h]
        mov dword [byte ebp-04h], 0Ah
        cdq
        idiv dword [byte ebp-04h]
        imul eax, dword [byte ebp-014h], byte 64h
        push edx
        cdq
        idiv dword [byte ebp-018h]
        push eax
        push str_DD7
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .59
.57:
        mov eax, 0C6h
        call GetLangText
        push eax
.58:
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 8
.59:
        lea eax, [byte ebp-044h]
        push eax
        push esi
        xor edx, edx
        jmp short .61
.60:
        push unk_1129E4
        push esi
        inc edx
.61:
        call fprintf_
        add esp, byte 8
        lea eax, [byte ebp-044h]
        call strlen_
        mov dword [byte ebp-018h], eax
        mov eax, 0Ah
        sub eax, dword [byte ebp-018h]
        cmp edx, eax
        jb short .60
        inc ecx
        add edi, byte 4
        cmp ecx, byte 0Ah
        jl near ExportPlayerCard_4B6.54
        mov eax, 1
        call UpdateProgressBox
        mov eax, 13Bh
        call GetLangText
        push eax
        push asc_1129E6
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-044h]
        push eax
        push str_S5
        push esi
        xor ecx, ecx
        call fprintf_
        add esp, byte 0Ch
        jmp short .63
.62:
        push unk_1129E4
        push esi
        inc ecx
        call fprintf_
        add esp, byte 8
.63:
        lea eax, [byte ebp-044h]
        mov edx, 15h
        call strlen_
        sub edx, eax
        cmp ecx, edx
        jb short .62
        xor ecx, ecx
        xor edi, edi
.64:
        cmp ecx, byte 9
        ja near ExportPlayerCard_8AB.67
        jmp dword [dword cs:edi+unk_930F2]
ExportPlayerCard_860:
        movzx eax, word [byte ebx+012h]
.65:
        push eax
        push str_fmtpd
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near ExportPlayerCard_8AB.69
ExportPlayerCard_87B:
        movzx eax, word [byte ebx+014h]
        jmp short ExportPlayerCard_860.65
ExportPlayerCard_881:
        movzx eax, word [byte ebx+016h]
        jmp short ExportPlayerCard_860.65
ExportPlayerCard_887:
        movzx eax, word [byte ebx+018h]
        jmp short ExportPlayerCard_860.65
ExportPlayerCard_88D:
        movzx eax, word [byte ebx+01Ah]
        jmp short ExportPlayerCard_860.65
ExportPlayerCard_893:
        movzx eax, word [byte ebx+01Ch]
        jmp short ExportPlayerCard_860.65
ExportPlayerCard_899:
        movsx eax, word [byte ebx+022h]
        jmp short ExportPlayerCard_860.65
ExportPlayerCard_89F:
        movzx eax, word [byte ebx+01Eh]
        jmp short ExportPlayerCard_860.65
ExportPlayerCard_8A5:
        movzx eax, word [byte ebx+020h]
        jmp short ExportPlayerCard_860.65
ExportPlayerCard_8AB:
        cmp word [byte ebx+020h], byte 0
        jne short .66
        push str_002
        jmp short .68
.66:
        movzx eax, word [byte ebx+014h]
        mov dword [byte ebp-018h], eax
        imul eax, dword 3E8h
        movzx edx, word [byte ebx+020h]
        mov dword [byte ebp-014h], edx
        cdq
        idiv dword [byte ebp-014h]
        mov dword [byte ebp-04h], 0Ah
        cdq
        idiv dword [byte ebp-04h]
        imul eax, dword [byte ebp-018h], byte 64h
        push edx
        cdq
        idiv dword [byte ebp-014h]
        push eax
        push str_DD7
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp short .69
.67:
        mov eax, 0C6h
        call GetLangText
        push eax
.68:
        lea eax, [byte ebp-044h]
        push eax
        call sprintf_
        add esp, byte 8
.69:
        lea eax, [byte ebp-044h]
        push eax
        push esi
        xor edx, edx
        jmp short .71
.70:
        push unk_1129E4
        push esi
        inc edx
.71:
        call fprintf_
        add esp, byte 8
        lea eax, [byte ebp-044h]
        call strlen_
        mov dword [byte ebp-04h], eax
        mov eax, 0Ah
        sub eax, dword [byte ebp-04h]
        cmp edx, eax
        jb short .70
        inc ecx
        add edi, byte 4
        cmp ecx, byte 0Ah
        jl near ExportPlayerCard_74D.64
        push unk_1129C2
        push esi
        xor ebx, ebx
        xor edi, edi
        call fprintf_
        add esp, byte 8
.72:
        mov eax, dword [dword edi+dword_11E7E0]
        call GetLangText
        push eax
        push asc_1129E6
        push esi
        mov ecx, edi
        xor edx, edx
        call fprintf_
        add esp, byte 0Ch
        jmp short .74
.73:
        push unk_1129E4
        push esi
        inc edx
        call fprintf_
        add esp, byte 8
.74:
        mov eax, dword [dword ecx+dword_11E7E0]
        call GetLangText
        call strlen_
        mov dword [byte ebp-04h], eax
        mov eax, 14h
        sub eax, dword [byte ebp-04h]
        cmp edx, eax
        jb short .73
        cmp ebx, byte 0Bh
        je short .75
        movsx eax, byte [dword ebx+byte_11E844]
        add eax, dword [byte ebp-01Ch]
        movzx eax, byte [eax]
        shl eax, 2
        add eax, byte 28h
        jmp short .76
.75:
        movsx eax, byte [dword ebx+byte_11E844]
        add eax, dword [byte ebp-01Ch]
        movzx eax, byte [eax]
        imul eax, byte 64h
        mov ecx, 0Fh
        cdq
        idiv ecx
.76:
        push eax
        push str_fmtpd
        push esi
        call fprintf_
        add esp, byte 0Ch
        inc ebx
        add edi, byte 4
        cmp ebx, byte 0Dh
        jl near .72
.77:
        call HideProgressBox
        mov eax, esi
        call fclose_
        jmp near DrawLeagueLogo_7D
;-----------------------------------------------------------------------------
; ScaleBlock                                      93B25  96 PC, low confidence
; Draws a block scaled by a factor (floating point), for the card slides
;-----------------------------------------------------------------------------
ScaleBlock:
        push ebx
        push ecx
        push esi
        push edi
        enter 10h, 0
        mov esi, eax
        mov dword [byte ebp-0Ch], edx
        push byte 0
        movsx edi, word [byte eax+06h]
        push edi
        push byte 1
        call CreateBitmap
        fild word [byte esi+04h]
        fld st0
        fld dword [byte ebp+018h]
        fxch
        fmul st1
        fsubp st2
        fxch
        fmul dword [dword_1129FA]
        mov dword [byte ebp-04h], 0
        mov edi, eax
        fild dword [byte ebp+01Ch]
        faddp
        add esp, byte 0Ch
        call __CHP
        fistp dword [byte ebp-08h]
        fcomp qword [qword_1129FE]
        fnstsw ax
        sahf
        jb short .2
.1:
        fild word [byte esi+04h]
        fcomp dword [byte ebp-04h]
        fnstsw ax
        sahf
        jbe short .2
        push edi
        call SetDrawBitmap
        fld dword [byte ebp-04h]
        add esp, byte 4
        fchs
        call __CHP
        push byte 0
        fistp dword [byte ebp-010h]
        push dword [byte ebp-010h]
        push esi
        call PutBlock
        add esp, byte 0Ch
        push dword [byte ebp-0Ch]
        call SetDrawBitmap
        add esp, byte 4
        push dword [byte ebp+020h]
        push dword [byte ebp-08h]
        push dword [byte edi+02Ch]
        call PutBlockKeyed
        fld1
        fdiv dword [byte ebp+018h]
        inc dword [byte ebp-08h]
        fadd dword [byte ebp-04h]
        add esp, byte 0Ch
        fstp dword [byte ebp-04h]
        jmp short .1
.2:
        push edi
        call FreeBitmap
        add esp, byte 4
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret 0Ch
unk_93BE6:
        db 0F4h,00h,00h,00h,0C3h,00h,00h,00h,0F7h,00h,00h,00h,0BCh,00h,00h,00h
        db 07Eh,01h,00h,00h,0BCh,00h,00h,00h,084h,01h,00h,00h,0C3h,00h,00h,00h
        db 084h,01h,00h,00h,0CFh,00h,00h,00h,07Dh,01h,00h,00h,0D4h,00h,00h,00h
        db 0FAh,00h,00h,00h,0D5h,00h,00h,00h,0F4h,00h,00h,00h,0CFh,00h,00h,00h
        db 09Ah,00h,00h,00h,0C9h,01h,00h,00h,0E2h,00h,00h,00h,0BCh,01h,00h,00h
        db 037h,01h,00h,00h,0C8h,01h,00h,00h,03Bh,01h,00h,00h,0D6h,01h,00h,00h
        db 0F8h,00h,00h,00h,0DFh,01h,00h,00h,0A1h,00h,00h,00h,0D8h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,0AEh,01h,00h,00h,02Dh,00h,00h,00h,0AEh,01h,00h,00h
        db 02Dh,00h,00h,00h,0DFh,01h,00h,00h,00h,00h,00h,00h,0DFh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_93CA6:
        db 0F9h,00h,00h,00h,0AFh,00h,00h,00h,01Dh,01h,00h,00h,08Ah,00h,00h,00h
        db 05Eh,01h,00h,00h,08Ah,00h,00h,00h,081h,01h,00h,00h,0AEh,00h,00h,00h
        db 05Eh,01h,00h,00h,0D6h,00h,00h,00h,01Ch,01h,00h,00h,0D5h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0F4h,00h,00h,00h,0E9h,00h,00h,00h,0FBh,00h,00h,00h,0E3h,00h,00h,00h
        db 082h,01h,00h,00h,0E3h,00h,00h,00h,087h,01h,00h,00h,0EBh,00h,00h,00h
        db 086h,01h,00h,00h,0F8h,00h,00h,00h,081h,01h,00h,00h,0FDh,00h,00h,00h
        db 0FCh,00h,00h,00h,0FDh,00h,00h,00h,0F5h,00h,00h,00h,0F7h,00h,00h,00h
unk_93D26:
        db 0Ch,0Dh,05h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01h,02h,01h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 05h,02h,02h,0Fh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,05h,03h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 01h,05h,04h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,02h,05h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 03h,02h,06h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 07h,02h,07h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 08h,0Ah,03h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 09h,0Ah,03h,09h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 08h,0Ah,00h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 08h,0Bh,00h,0Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Ch,00h,03h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,0Fh,05h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,0Fh,05h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Dh,0Fh,02h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0Dh,010h,02h,0Ah,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 011h,02h,011h,08h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
jpt_93E46:
        dd PlayerRatingsScreen_E11
        dd PlayerRatingsScreen_E3B
        dd PlayerRatingsScreen_E44
        dd PlayerRatingsScreen_E4D
        dd PlayerRatingsScreen_E56
        dd PlayerRatingsScreen_E5F
        dd PlayerRatingsScreen_E68
        dd PlayerRatingsScreen_E71
        dd PlayerRatingsScreen_E68
