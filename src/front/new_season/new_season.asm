; The new season: its set-up screen, creating the season files, the season and playoff database paths (96 PC).
bits 32
%include "hockey.inc"
section s_77442 progbits alloc exec nowrite align=1
extern __CHP, __STOSB, __STOSD, byte_11D74F, byte_11D754, byte_17BDAE, SeasonUserTeam, byte_17CC1D
extern byte_17CC35, byte_17CC36, byte_17D13A, byte_17D6C8, DrawArtOpaque, DrawColorTextCentred, DrawFrameAt, dword_11D59C
extern dword_11D744, str_2_DrawSeasonTeams, dword_11E2EC, dword_11E304, dword_11E320, MatchupLayer, TeamStatsBitmap, str_Standings
extern PlayoffTreeData, dword_17CC13, dword_17CC1B, SeasonRandomSeed, cddriveptr, dword_17D1E2, dword_17D267, dword_17D7C8
extern dword_17D7D0, EditText, FadeOut, FadePalette, FileClose, FileCopy, FileOpenRead, FileOpenReadWrite
extern FileReadAt, FileWriteAt, FillMusicStream, FreeStatsTables, gameopts, GetLangText, GetTicks, HideProgressBox
extern InitMenuItems, itoa_, LoadPackedFile, LoadTeamLogo, MakeDatabasePath, MakeDataPath, MakeDirPath, MessageBox
extern NameIndexAdd, NameIndexFirstId, NameIndexNew, NameIndexSave, off_11E370, OpenScreen, optblock_end, PutBlock
extern qsort_, F64_143p964, F64_neg20, rand_, RunMenu, SetDrawBitmap, SetScreenColors, SetTextColors
extern SetTickDeadline, ShowProgressBox, SlideInSideBar, SlideInTitleBar, SoundSecondsToBytes, sprintf_, srand_, str_05d2
extern str_Bkgd9, str_Bt014, str_Bt024, str_Bt02d2, str_Bt103, str_Bt113, str_Bt192, str_Bt202
extern str_Bt282, str_Bt292, str_Nothing, str_Pal14, str_Rul12, str_Rul22, str_Rul32, str_S05dCNZDB2
extern str_S05dCnzDb3, str_S05dCsgDb, str_Sched, str_SDB, str_SEASONNDX, str_Set12, str_Set22, str_Set3
extern str_Teams, strcat_, strcpy_, strlen_, WriteDbRecord6, ReadSeasonHeader, GameOptionsScreen, SeasonMenuScreen_794
extern SeasonMenuScreen_7AC, SeasonMenuScreen_858, SeasonMenuScreen_9D7, SeasonMenuScreen_A07, SeasonMenuScreen_A34, SeasonMenuScreen_A61, SeasonMenuScreen_ADF, SeasonMenuScreen_AEB
extern SeasonMenuScreen_AF7, SeasonMenuScreen_B7E, SeasonMenuScreen_C05, SeasonMenuScreen_C68, DrawShape, AllocMemBlock, FreeMemBlock, CreateBitmap
extern TintRect, FreeBitmap, OpenArtArchiveErr, SaveFileBlock, DrawArtOpaqueAtOwnPos, UnlinkJump, FileSizeByName, DrawArtKeyedAtOrigin
extern PutBlockKeyed, SetScreenTarget, SetColourRemap, FindShape, ClearClipRect, TextSetFont, TickDeadlinePassed, unk_11E33C
extern unk_11E354, str_WesternConference2, SeasonUserRecords, unk_17CC1F, unk_17CED5, UpdateProgressBox
global unk_77442, unk_7745A, CompareGrey, SortGreyColors, jpt_7761E, jpt_77632, NewSeasonScreen, NewSeasonScreen_5FB
global NewSeasonScreen_768, NewSeasonScreen_798, NewSeasonScreen_7C5, NewSeasonScreen_7F2, NewSeasonScreen_8AF, NewSeasonScreen_8BB, NewSeasonScreen_8CB, NewSeasonScreen_8E0
global NewSeasonScreen_9A9, NewSeasonScreen_9AA, SetGreyPalette, DrawSeasonTeams, CreateSeason, EditSeasonName, EditSeasonName_D3, EditSeasonName_E0
global WriteSeasonBlock, WriteSeasonHeader, MakeSeasonDbPath, MakeSeasonDbPath_51, MakePlayoffDbPath, MakePlayoffDbPath_15F, ResetSeasonFiles, str_Punct
global unk_79303, unk_79483, unk_794C3, jpt_794CB, jpt_794EF
unk_77442:
        db 05h,00h,00h,00h,00h,00h,00h,00h,01h,00h,00h,00h,03h,00h,00h,00h
        db 04h,00h,00h,00h,00h,00h,00h,00h
unk_7745A:
        db 0DBh,00h,00h,00h,069h,00h,00h,00h,0E4h,00h,00h,00h,060h,00h,00h,00h
        db 092h,01h,00h,00h,061h,00h,00h,00h,09Dh,01h,00h,00h,068h,00h,00h,00h
        db 09Ch,01h,00h,00h,07Ah,00h,00h,00h,091h,01h,00h,00h,07Fh,00h,00h,00h
        db 0E4h,00h,00h,00h,07Eh,00h,00h,00h,0DEh,00h,00h,00h,078h,00h,00h,00h
        db 086h,00h,00h,00h,0C1h,01h,00h,00h,08Dh,00h,00h,00h,0B5h,01h,00h,00h
        db 05h,01h,00h,00h,0B5h,01h,00h,00h,010h,01h,00h,00h,0C1h,01h,00h,00h
        db 06h,01h,00h,00h,0CDh,01h,00h,00h,08Dh,00h,00h,00h,0CCh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 06Ch,01h,00h,00h,0C0h,01h,00h,00h,075h,01h,00h,00h,0B5h,01h,00h,00h
        db 0EDh,01h,00h,00h,0B5h,01h,00h,00h,0F9h,01h,00h,00h,0C1h,01h,00h,00h
        db 0EDh,01h,00h,00h,0CBh,01h,00h,00h,076h,01h,00h,00h,0CBh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; CompareGrey                                     7751A  96 PC, low confidence
; Qsort compare of two grey palette entries by brightness (byte_17D6C8)
;-----------------------------------------------------------------------------
CompareGrey:
        push ebx
        movzx eax, byte [eax]
        movzx ebx, byte [dword eax+byte_17D6C8]
        movzx eax, byte [edx]
        movzx eax, byte [dword eax+byte_17D6C8]
        sub ebx, eax
        mov eax, ebx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SortGreyColors                                  77535  96 PC, low confidence
; (palette, out): finds the grey colours (r = g = b) of a palette and sorts
; them by brightness
;-----------------------------------------------------------------------------
SortGreyColors:
        push ebx
        push ecx
        push esi
        push edi
        enter 21Ch, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-04h], 0
        xor edx, edx
.1:
        movsx ebx, byte [eax]
        movsx ecx, byte [byte eax+02h]
        mov dword [byte ebp-08h], ebx
        movsx ebx, byte [byte eax+01h]
        mov dword [byte ebp-010h], ecx
        cmp ebx, dword [byte ebp-08h]
        jne short .2
        cmp ebx, ecx
        jne short .2
        add bl, byte [byte ebp-08h]
        mov bh, byte [byte ebp-010h]
        mov ecx, dword [byte ebp-04h]
        add bh, bl
        mov byte [dword ecx+ebp-021Ch], dl
        mov byte [dword ecx+byte_17D6C8], bh
        mov ebx, ecx
        mov cl, byte [byte ebp-04h]
        inc dword [byte ebp-04h]
        mov byte [dword ebx+ebp-011Ch], cl
.2:
        inc edx
        add eax, byte 3
        cmp edx, 100h
        jl short .1
        mov ecx, CompareGrey
        mov ebx, 1
        mov edx, dword [byte ebp-04h]
        lea eax, [dword ebp-011Ch]
        call qsort_
        mov eax, esi
        add esi, 300h
        mov dword [byte ebp-014h], esi
.3:
        movsx ebx, byte [byte eax+01h]
        movsx edx, byte [eax]
        add ebx, edx
        movsx edx, byte [byte eax+02h]
        mov dword [byte ebp-0Ch], 0
        add ebx, edx
        mov esi, edi
        mov dword [byte ebp-018h], ebx
        xor ebx, ebx
        jmp short .6
.4:
        movzx edx, byte [dword ebx+ebp-011Ch]
        movzx ecx, byte [dword edx+byte_17D6C8]
        mov dword [byte ebp-01Ch], ecx
        mov ecx, dword [byte ebp-018h]
        cmp ecx, dword [byte ebp-01Ch]
        jge short .5
        mov dl, byte [dword edx+ebp-021Ch]
        mov dword [byte ebp-0Ch], 1
        mov byte [esi], dl
.5:
        inc ebx
.6:
        cmp ebx, dword [byte ebp-04h]
        jge short .7
        cmp dword [byte ebp-0Ch], byte 0
        je short .4
.7:
        add eax, byte 3
        inc edi
        cmp eax, dword [byte ebp-014h]
        jne short .3
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
jpt_7761E:
        dd NewSeasonScreen_5FB
        dd NewSeasonScreen_8AF
        dd NewSeasonScreen_8BB
        dd NewSeasonScreen_8CB
        dd NewSeasonScreen_8E0
jpt_77632:
        dd NewSeasonScreen_768
        dd NewSeasonScreen_798
        dd NewSeasonScreen_7C5
        dd NewSeasonScreen_7F2
;-----------------------------------------------------------------------------
; NewSeasonScreen                              77642  96 PC, medium confidence
; The new season set-up screen (rul1-3, set1-2 buttons, bt01 / bt02): rules
; and settings, then creates the season
;-----------------------------------------------------------------------------
NewSeasonScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0B88h, 0
        push eax
        sub ebp, 82h
        lea edi, [byte ebp+03Ah]
        mov esi, unk_77442
        movsd
        movsd
        movsd
        movsd
        movsd
        movsd
        mov ecx, 30h
        lea edi, [dword ebp-0F6h]
        mov esi, unk_7745A
        mov dword [byte ebp+07Eh], 1
        rep movsd
        mov dword [byte ebp+072h], 0
        lea esi, [dword ebp-0416h]
        mov edi, 41h
        lea ebx, [dword esi+011Fh]
.1:
        mov eax, edi
        call GetLangText
        mov edx, eax
        inc edi
        mov eax, esi
        add esi, byte 29h
        call strcpy_
        cmp esi, ebx
        jne short .1
        mov dword [byte ebp+076h], 3
        cmp dword [dword ebp-0B0Ah], byte 0
        jne short .3
        mov ecx, 3A7h
        mov edi, SeasonUserRecords
        xor eax, eax
        mov esi, optblock_end
        rep stosb
        mov ecx, 0B9h
        mov edi, SeasonUserRecords
        rep movsb
        mov dword [gameopts], SeasonUserRecords
        xor eax, eax
        xor esi, esi
.2:
        inc eax
        add esi, byte 1Ah
        mov byte [byte eax+ebp+01Dh], 1
        mov byte [dword esi+byte_17CC1D], 0FFh
        cmp eax, byte 1Ah
        jl short .2
.3:
        lea esi, [dword ebp-0416h]
        xor eax, eax
.4:
        mov dword [byte eax+ebp-02h], esi
        add eax, byte 4
        add esi, byte 29h
        cmp eax, byte 1Ch
        jne short .4
        xor eax, eax
        call GetLangText
        xor edx, edx
        mov dword [byte ebp+01Ah], eax
        mov eax, 5Dh
        mov esi, str_WesternConference2
        call LoadPackedFile
        push str_Pal14
        add esi, 1F2h
        push eax
        mov dword [byte ebp+05Eh], eax
        mov dword [byte ebp+062h], eax
        call FindShape
        add esp, byte 8
        lea edx, [byte eax+010h]
        mov ecx, 0C0h
        lea edi, [dword eax+0202h]
        rep movsb
        push str_Bkgd9
        push dword [byte ebp+05Eh]
        mov dword [byte ebp+06Ah], edx
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtOpaqueAtOwnPos
        add esp, byte 4
        mov eax, dword [byte ebp+06Ah]
        call SetScreenColors
        mov eax, 6
        call OpenScreen
        lea eax, [dword ebp-02F6h]
        push eax
        push dword [byte ebp+06Ah]
        push dword 8000h
        call TintRect
        add esp, byte 0Ch
        lea edx, [dword ebp-01F6h]
        mov eax, dword [byte ebp+06Ah]
        call SortGreyColors
        push byte 0
        push dword 0FAh
        push dword 226h
        mov byte [dword ebp-01F7h], 0FFh
        mov byte [dword ebp-0F7h], 0FFh
        call CreateBitmap
        lea edx, [dword ebp-0B06h]
        add esp, byte 0Ch
        mov dword [byte ebp+05Ah], eax
        mov eax, 0Dh
        call InitMenuItems
        push str_Bt014
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push eax
        call DrawArtKeyedAtOrigin
        add esp, byte 4
        push str_Bt014
        push dword [byte ebp+05Eh]
        call FindShape
        add esp, byte 8
        push str_Bt024
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0AECh], eax
        call FindShape
        add esp, byte 8
        push str_Bt024
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0AE8h], eax
        call FindShape
        add esp, byte 8
        push str_Bt014
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0AE4h], eax
        call FindShape
        add esp, byte 8
        push str_Bt014
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0AE0h], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0AF6h], 8
        mov dword [dword ebp-0ADCh], eax
        lea eax, [dword ebp-0F6h]
        mov byte [dword ebp-0AC2h], 3
        mov dword [dword ebp-0AF2h], eax
        mov eax, dword [dword ebp-0AE0h]
        mov byte [dword ebp-0AC1h], 4
        add eax, byte 14h
        push str_Rul12
        mov dword [dword ebp-0ACCh], eax
        mov eax, dword [dword ebp-0ADCh]
        mov byte [dword ebp-0AC3h], 6
        add eax, byte 14h
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0AC8h], eax
        call FindShape
        add esp, byte 8
        push str_Rul22
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0A86h], eax
        call FindShape
        add esp, byte 8
        push str_Rul32
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0A82h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0A90h], 6
        push str_Rul12
        mov dword [dword ebp-0A7Eh], eax
        lea eax, [dword ebp-0B6h]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0A8Ch], eax
        call FindShape
        add esp, byte 8
        push str_Rul12
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0A7Ah], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov byte [dword ebp-0A5Ch], 3
        mov dword [dword ebp-0A76h], eax
        mov eax, dword [dword ebp-0A7Ah]
        mov byte [dword ebp-0A5Bh], 2
        add eax, byte 14h
        push str_Set12
        mov dword [dword ebp-0A66h], eax
        mov eax, dword [dword ebp-0A76h]
        mov byte [dword ebp-0A5Eh], 9
        add eax, byte 14h
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0A62h], eax
        call FindShape
        add esp, byte 8
        push str_Set22
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0A20h], eax
        call FindShape
        add esp, byte 8
        push str_Set3
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0A1Ch], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0A2Ah], 6
        push str_Set12
        mov dword [dword ebp-0A18h], eax
        lea eax, [byte ebp-076h]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0A26h], eax
        call FindShape
        add esp, byte 8
        lea edi, [dword ebp-09D4h]
        push str_Set12
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+05Eh]
        mov dword [dword ebp-0A14h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov esi, TeamStatsBitmap
        mov dword [dword ebp-0A10h], eax
        mov eax, dword [dword ebp-0A14h]
        mov ecx, 66h
        add eax, byte 14h
        mov byte [dword ebp-09F6h], 1
        mov dword [dword ebp-0A00h], eax
        mov eax, dword [dword ebp-0A10h]
        mov byte [dword ebp-09F5h], 4
        add eax, byte 14h
        mov byte [dword ebp-09F8h], 9
        mov dword [dword ebp-09FCh], eax
        rep movsb
        mov byte [dword ebp-098Fh], 1
        mov byte [dword ebp-0990h], 3
        mov byte [dword ebp-0992h], 3
        mov ecx, 66h
        lea edi, [dword ebp-096Eh]
        mov esi, str_Standings
        mov byte [dword ebp-0991h], 3
        add esp, byte 8
        rep movsb
        mov eax, 1FEh
        mov byte [dword ebp-092Ah], 2
        mov byte [dword ebp-0929h], 4
        mov byte [dword ebp-092Ch], 4
        lea esi, [dword ebp-05D6h]
        mov byte [dword ebp-092Bh], 4
        lea edx, [dword esi+0200h]
.5:
        add eax, byte 66h
        mov dword [dword eax+ebp-0B58h], esi
        add esi, byte 40h
        mov dword [dword eax+ebp-0B5Ch], 4
        cmp esi, edx
        jne short .5
        lea eax, [byte ebp+03Ah]
        push eax
        lea eax, [dword ebp-01F6h]
        push eax
        lea eax, [dword ebp-02F6h]
        push eax
        push dword 0A0h
        lea ecx, [dword ebp-0908h]
        push byte 3Ch
        lea eax, [dword ebp-05D6h]
        mov ebx, dword [byte ebp+072h]
        push eax
        mov edx, dword [byte ebp+05Ah]
        mov eax, dword [byte ebp+062h]
        call DrawSeasonTeams
        mov ebx, 3
        mov edx, dword [byte ebp+06Ah]
        xor eax, eax
        call FadePalette
        cmp dword [dword ebp-0B0Ah], byte 0
        jne near NewSeasonScreen_7F2.18
        mov byte [SeasonUserTeam], 0
.6:
        cmp byte [SeasonUserTeam], 0
        jne near NewSeasonScreen_7F2.18
        push SeasonUserTeam
        push dword 0F0h
        mov eax, 48h
        push dword 140h
        mov ecx, 1Eh
        mov ebx, byte_17BDAE
        call GetLangText
        mov edx, eax
        xor eax, eax
        call EditText
        mov edx, eax
        test eax, eax
        je near .7
        cmp byte [SeasonUserTeam], 0
        je near .7
        push SeasonUserTeam
        mov eax, 49h
        call GetLangText
        push eax
        lea eax, [byte ebp-036h]
        push eax
        xor edx, edx
        call sprintf_
        add esp, byte 0Ch
        mov eax, 0FCh
        mov ebx, 4Fh
        call SetTextColors
        mov edx, 13Ch
        lea eax, [byte ebp-036h]
        call DrawColorTextCentred
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov ecx, byte_17BDAE
        mov eax, 4Ah
        push byte 0
        lea ebx, [byte ebp-02h]
        mov edx, 3
        call GetLangText
        call MessageBox
        push byte 2
        push byte 0
        push dword 0F0h
        mov dword [byte ebp+07Eh], 1
        mov ecx, byte_17BDAE
        push dword 140h
        lea ebx, [byte ebp+0Ah]
        mov dword [dword_17CC13], eax
        push byte 0
        mov eax, 4Bh
        mov edx, 4
        call GetLangText
        call MessageBox
        mov dword [dword_17D7C8], eax
        jmp near .6
.7:
        test edx, edx
        jne near .6
        mov dword [byte ebp+06Eh], 2710h
        mov byte [SeasonUserTeam], 20h
        mov dword [byte ebp+07Eh], edx
        jmp near .6
.8:
        cmp dword [byte ebp+066h], byte 4
        ja near NewSeasonScreen_8E0.24
        mov eax, dword [byte ebp+066h]
        jmp dword [nosplit cs:eax*4+jpt_7761E]
NewSeasonScreen_5FB:
        imul esi, dword [byte ebp+072h], byte 9
        push byte 0
        push str_Bt014
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+06h]
        push eax
        push str_Bt014
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+04h]
        push eax
        call CreateBitmap
        add esp, byte 0Ch
        push eax
        mov edi, eax
        call SetDrawBitmap
        add esp, byte 4
        push str_Bt014
        push dword [byte ebp+062h]
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        neg eax
        push eax
        push str_Bt014
        push dword [byte ebp+062h]
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        neg eax
        push eax
        push str_Bkgd9
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        add esp, byte 0Ch
        call SetScreenTarget
        mov eax, dword [byte ebp+072h]
        inc eax
        inc esi
        inc esi
        mov dword [byte ebp+07Ah], eax
        jmp near .14
.9:
        inc eax
        cmp esi, eax
        jne short .10
        lea esi, [byte eax+01h]
.10:
        cmp esi, byte 26h
        jne short .11
        push str_Bt024
        lea eax, [byte ebp+052h]
        push eax
        call sprintf_
        add esp, byte 8
        jmp short .12
.11:
        push esi
        push str_Bt02d2
        lea eax, [byte ebp+052h]
        push eax
        call sprintf_
        add esp, byte 0Ch
.12:
        push str_Bt014
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push eax
        push str_Bt014
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [byte edi+02Ch]
        call DrawArtOpaque
        add esp, byte 0Ch
        lea eax, [byte ebp+052h]
        push eax
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push eax
        call DrawShape
        add esp, byte 4
        push byte 4
        call SetTickDeadline
        add esp, byte 4
.13:
        call TickDeadlinePassed
        test eax, eax
        je short .13
        inc esi
.14:
        imul eax, dword [byte ebp+07Ah], byte 9
        lea edx, [byte eax+02h]
        cmp esi, edx
        jl near .9
        push edi
        inc dword [byte ebp+072h]
        call FreeBitmap
        add esp, byte 4
        cmp dword [byte ebp+072h], byte 4
        jne short .15
        mov dword [byte ebp+072h], 0
.15:
        cmp dword [byte ebp+072h], byte 3
        ja near NewSeasonScreen_7F2.17
        mov eax, dword [byte ebp+072h]
        jmp dword [nosplit cs:eax*4+jpt_77632]
NewSeasonScreen_768:
        push str_Bt014
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push str_Bt024
        push dword [byte ebp+062h]
        mov dword [dword ebp-0AECh], eax
        call FindShape
        add esp, byte 8
        push str_Bt024
        jmp near NewSeasonScreen_7F2.16
NewSeasonScreen_798:
        push str_Bt103
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push str_Bt113
        push dword [byte ebp+062h]
        mov dword [dword ebp-0AECh], eax
        call FindShape
        add esp, byte 8
        push str_Bt113
        jmp short NewSeasonScreen_7F2.16
NewSeasonScreen_7C5:
        push str_Bt192
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push str_Bt202
        push dword [byte ebp+062h]
        mov dword [dword ebp-0AECh], eax
        call FindShape
        add esp, byte 8
        push str_Bt202
        jmp short NewSeasonScreen_7F2.16
NewSeasonScreen_7F2:
        push str_Bt282
        push dword [byte ebp+062h]
        call FindShape
        add esp, byte 8
        push str_Bt292
        push dword [byte ebp+062h]
        mov dword [dword ebp-0AECh], eax
        call FindShape
        add esp, byte 8
        push str_Bt292
.16:
        push dword [byte ebp+062h]
        mov dword [dword ebp-0AE8h], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0AE4h], eax
.17:
        lea eax, [byte ebp+03Ah]
        push eax
        lea eax, [dword ebp-01F6h]
        push eax
        lea eax, [dword ebp-02F6h]
        push eax
        push dword 0A0h
        lea ecx, [dword ebp-0908h]
        push byte 3Ch
        lea eax, [dword ebp-05D6h]
        mov ebx, dword [byte ebp+072h]
        push eax
        mov edx, dword [byte ebp+05Ah]
        mov eax, dword [byte ebp+062h]
        call DrawSeasonTeams
.18:
        cmp dword [byte ebp+07Eh], byte 0
        je near NewSeasonScreen_8E0.25
        mov edi, dword [byte ebp+072h]
        mov dword [byte ebp+066h], 0FFFFFFFFh
        shl edi, 2
.19:
        cmp dword [byte ebp+066h], byte 0
        jge near NewSeasonScreen.8
        push dword [byte ebp+076h]
        lea eax, [byte ebp+066h]
        push byte 3
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-0B06h]
        push eax
        mov eax, dword [dword edi+dword_11D744]
        xor ecx, ecx
        add eax, byte 5
        call RunMenu
        jmp short .19
NewSeasonScreen_8AF:
        mov eax, 1
        call GameOptionsScreen
        jmp short NewSeasonScreen_7F2.18
NewSeasonScreen_8BB:
        mov dword [byte ebp+07Eh], 0
        mov dword [byte ebp+06Eh], 2717h
        jmp short NewSeasonScreen_7F2.18
NewSeasonScreen_8CB:
        call SlideInSideBar
        mov dword [byte ebp+07Eh], 0
.20:
        mov dword [byte ebp+06Eh], 2710h
        jmp short NewSeasonScreen_7F2.18
NewSeasonScreen_8E0:
        mov dword [dword_17CC1B], 0
        call SlideInTitleBar
        xor eax, eax
.21:
        movsx edx, byte [dword eax+byte_17CC36]
        cmp edx, byte 1
        jne short .22
        add dword [dword_17CC1B], edx
.22:
        add eax, byte 1Ah
        cmp eax, 2A4h
        jne short .21
        cmp dword [dword_17CC1B], byte 0
        jle short .23
        mov eax, dword [dword_17D7C8]
        mov dword [byte ebp+07Eh], 0
        call CreateSeason
        test eax, eax
        jne short NewSeasonScreen_8CB.20
        mov dword [byte ebp+06Eh], 2712h
        jmp near NewSeasonScreen_7F2.18
.23:
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov eax, 4Ch
        mov ecx, byte_17BDAE
        push byte 0
        lea ebx, [byte ebp+01Ah]
        mov edx, 1
        call GetLangText
        call MessageBox
        jmp near NewSeasonScreen_7F2.18
.24:
        imul eax, dword [byte ebp+072h], byte 7
        add eax, dword [byte ebp+066h]
        movzx eax, byte [dword eax+byte_11D74F]
        call EditSeasonName
        jmp near NewSeasonScreen_7F2.17
.25:
        mov eax, 3
        call FadeOut
        push dword [byte ebp+062h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+05Ah]
        call FreeBitmap
        mov eax, dword [byte ebp+06Eh]
        add esp, byte 4
        lea esp, [dword ebp+082h]
NewSeasonScreen_9A9:
        pop ebp
NewSeasonScreen_9AA:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetGreyPalette                                  77FF2  96 PC, low confidence
; Sets the palette (8000h) and its sorted greys
;-----------------------------------------------------------------------------
SetGreyPalette:
        push ecx
        push esi
        push edi
        push ebp
        mov ebp, esp
        push eax
        mov edi, edx
        mov esi, ebx
        push edx
        push eax
        push dword 8000h
        call TintRect
        add esp, byte 0Ch
        mov eax, dword [byte ebp-04h]
        mov edx, esi
        call SortGreyColors
        mov byte [dword edi+0FFh], 0FFh
        mov byte [dword esi+0FFh], 0FFh
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; DrawSeasonTeams                                 78029  96 PC, low confidence
; Draws the season screen's team logos and names
;-----------------------------------------------------------------------------
DrawSeasonTeams:
        push esi
        push edi
        enter 144h, 0
        push eax
        push edx
        mov edi, ebx
        mov esi, ecx
        mov dword [byte ebp-0Ch], 0
.1:
        mov eax, dword [byte ebp-0Ch]
        mov dl, byte [byte ebp-0Ch]
        inc dword [byte ebp-0Ch]
        mov byte [dword eax+ebp-0144h], dl
        cmp dword [byte ebp-0Ch], 100h
        jl short .1
        push byte 0
        push dword 96h
        push dword 0FAh
        call CreateBitmap
        add esp, byte 0Ch
        push dword [dword ebp-014Ch]
        mov dword [byte ebp-01Ch], eax
        call SetDrawBitmap
        mov eax, dword [byte ebp+018h]
        add esp, byte 4
        neg eax
        push eax
        mov eax, dword [byte ebp+014h]
        neg eax
        push eax
        push str_Bkgd9
        push dword [dword ebp-0148h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlock
        imul eax, edi, byte 7
        add esp, byte 0Ch
        lea ebx, [byte esi+042h]
        cmp dword [nosplit edi*4+dword_11D744], byte 6
        jne near .15
        mov dword [byte ebp-0Ch], 0
        mov dword [byte ebp-040h], unk_11E33C
        mov dword [byte ebp-030h], eax
        mov dword [byte ebp-020h], eax
        mov dword [byte ebp-034h], ebx
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-04h], esi
        mov dword [byte ebp-018h], eax
.2:
        push dword [byte ebp-01Ch]
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call ClearClipRect
        mov eax, dword [byte ebp-030h]
        movzx eax, byte [dword eax+byte_11D754]
        imul eax, byte 1Ah
        movsx edx, byte [dword eax+byte_17CC36]
        add esp, byte 4
        cmp edx, byte 1
        jne short .4
        cmp byte [dword eax+byte_17CC35], 0
        jne short .3
        lea eax, [dword ebp-0144h]
        push eax
        jmp short .5
.3:
        push dword [byte ebp+020h]
        jmp short .5
.4:
        push dword [byte ebp+01Ch]
.5:
        call SetColourRemap
        add esp, byte 4
        push byte 0
        mov eax, dword [byte ebp-020h]
        push byte 0
        movzx eax, byte [dword eax+byte_11D754]
        call LoadTeamLogo
        push eax
        call PutBlockKeyed
        add esp, byte 0Ch
        mov esi, dword [byte ebp-0Ch]
        push dword [dword ebp-014Ch]
        shl esi, 2
        call SetDrawBitmap
        mov edx, dword [byte ebp-01Ch]
        mov eax, 0C000h
        add esp, byte 4
        mov ecx, dword [dword esi+dword_11E2EC]
        mov ebx, dword [dword esi+str_2_DrawSeasonTeams]
        mov edx, dword [byte edx+02Ch]
        call DrawFrameAt
        mov eax, 0FCh
        xor edx, edx
        call SetTextColors
        mov eax, dword [byte ebp-020h]
        movzx eax, byte [dword eax+byte_11D754]
        imul eax, byte 1Ah
        movsx edx, byte [dword eax+byte_17CC36]
        cmp edx, byte 1
        jne short .6
        add eax, unk_17CC1F
        mov ebx, dword [dword esi+dword_11E2EC]
        mov edx, dword [dword esi+str_2_DrawSeasonTeams]
        add ebx, byte 5Dh
        add edx, byte 5Ah
        call DrawColorTextCentred
.6:
        mov edx, dword [byte ebp-0Ch]
        mov eax, dword [nosplit edx*4+str_2_DrawSeasonTeams]
        add eax, dword [byte ebp+014h]
        mov ebx, dword [byte ebp-018h]
        add eax, byte 12h
        mov dword [ebx], eax
        mov eax, dword [nosplit edx*4+dword_11E2EC]
        add eax, dword [byte ebp+018h]
        mov dword [byte ebx+04h], eax
        mov eax, dword [nosplit edx*4+str_2_DrawSeasonTeams]
        add eax, dword [byte ebp+014h]
        mov dword [byte ebp-044h], eax
        fild dword [byte ebp-044h]
        fadd qword [F64_143p964]
        call __CHP
        fistp dword [byte ebp-044h]
        mov eax, dword [byte ebp-044h]
        mov dword [byte ebx+08h], eax
        mov eax, dword [nosplit edx*4+dword_11E2EC]
        add eax, dword [byte ebp+018h]
        mov dword [byte ebx+0Ch], eax
        mov eax, dword [nosplit edx*4+str_2_DrawSeasonTeams]
        add eax, dword [byte ebp+014h]
        mov dword [byte ebp-044h], eax
        fild dword [byte ebp-044h]
        fadd qword [F64_143p964]
        call __CHP
        fistp dword [byte ebp-044h]
        mov eax, dword [byte ebp-044h]
        mov dword [byte ebx+010h], eax
        mov eax, dword [nosplit edx*4+dword_11E2EC]
        add eax, dword [byte ebp+018h]
        add eax, byte 5Bh
        mov dword [byte ebx+014h], eax
        mov eax, dword [nosplit edx*4+str_2_DrawSeasonTeams]
        add eax, dword [byte ebp+014h]
        add eax, byte 12h
        mov dword [byte ebx+018h], eax
        mov eax, dword [nosplit edx*4+dword_11E2EC]
        add eax, dword [byte ebp+018h]
        add eax, byte 5Bh
        mov dword [byte ebx+01Ch], eax
        mov eax, dword [ebx]
        mov edx, dword [byte ebp-04h]
        add eax, byte 36h
        mov dword [byte edx+03Ah], eax
        mov ecx, 4
        mov eax, dword [byte ebx+04h]
        mov esi, dword [byte ebp-040h]
        add eax, byte 2Ch
        mov edi, dword [byte ebp-034h]
        mov dword [byte edx+03Eh], eax
        rep movsb
        movzx eax, byte [byte edx+042h]
        cmp eax, byte 63h
        jne short .7
        mov eax, dword [byte ebp+024h]
        mov al, byte [byte eax+04h]
        mov byte [byte edx+042h], al
        jmp short .8
.7:
        mov eax, dword [byte ebp+024h]
        mov al, byte [eax]
        add byte [byte edx+042h], al
.8:
        mov eax, dword [byte ebp-04h]
        movzx eax, byte [byte eax+043h]
        cmp eax, byte 63h
        jne short .9
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-04h]
        mov al, byte [byte eax+08h]
        mov byte [byte edx+043h], al
        jmp short .10
.9:
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-04h]
        mov al, byte [eax]
        add byte [byte edx+043h], al
.10:
        mov eax, dword [byte ebp-04h]
        movzx eax, byte [byte eax+044h]
        cmp eax, byte 63h
        jne short .11
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-04h]
        mov al, byte [byte eax+0Ch]
        mov byte [byte edx+044h], al
        jmp short .12
.11:
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-04h]
        mov al, byte [eax]
        add byte [byte edx+044h], al
.12:
        mov eax, dword [byte ebp-04h]
        movzx eax, byte [byte eax+045h]
        cmp eax, byte 63h
        jne short .13
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-04h]
        mov al, byte [byte eax+010h]
        mov byte [byte edx+045h], al
        jmp short .14
.13:
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-04h]
        mov al, byte [eax]
        add byte [byte edx+045h], al
.14:
        inc dword [byte ebp-030h]
        inc dword [byte ebp-020h]
        add dword [byte ebp-034h], byte 66h
        add dword [byte ebp-040h], byte 4
        add dword [byte ebp-018h], byte 40h
        inc dword [byte ebp-0Ch]
        add dword [byte ebp-04h], byte 66h
        cmp dword [byte ebp-0Ch], byte 6
        jge near .33
        jmp near .2
.15:
        mov dword [byte ebp-0Ch], 0
        mov dword [byte ebp-024h], unk_11E354
        mov edx, dword [byte ebp+010h]
        mov dword [byte ebp-010h], 0
        mov dword [byte ebp-038h], eax
        mov dword [byte ebp-03Ch], eax
        mov dword [byte ebp-028h], ebx
        mov dword [byte ebp-08h], esi
        mov dword [byte ebp-02Ch], eax
        mov dword [byte ebp-014h], edx
.16:
        push dword [byte ebp-01Ch]
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFh
        call ClearClipRect
        mov eax, dword [byte ebp-038h]
        movzx eax, byte [dword eax+byte_11D754]
        imul eax, byte 1Ah
        movsx edx, byte [dword eax+byte_17CC36]
        add esp, byte 4
        cmp edx, byte 1
        jne short .18
        cmp byte [dword eax+byte_17CC35], 0
        jne short .17
        lea eax, [dword ebp-0144h]
        push eax
        jmp short .19
.17:
        push dword [byte ebp+020h]
        jmp short .19
.18:
        push dword [byte ebp+01Ch]
.19:
        call SetColourRemap
        add esp, byte 4
        push byte 0
        mov eax, dword [byte ebp-03Ch]
        push byte 0
        movzx eax, byte [dword eax+byte_11D754]
        call LoadTeamLogo
        push eax
        call PutBlockKeyed
        add esp, byte 0Ch
        push dword [dword ebp-014Ch]
        call SetDrawBitmap
        mov ecx, dword [byte ebp-010h]
        mov ebx, dword [byte ebp-010h]
        mov edx, dword [byte ebp-01Ch]
        mov eax, 0B333h
        add esp, byte 4
        mov ecx, dword [dword ecx+dword_11E320]
        mov ebx, dword [dword ebx+dword_11E304]
        mov edx, dword [byte edx+02Ch]
        call DrawFrameAt
        cmp dword [byte ebp-0Ch], byte 2
        jge short .20
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_11E304]
        add eax, dword [byte ebp+014h]
        mov edx, dword [byte ebp-014h]
        add eax, byte 21h
        jmp short .21
.20:
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_11E304]
        add eax, dword [byte ebp+014h]
        mov edx, dword [byte ebp-014h]
        add eax, byte 12h
.21:
        mov dword [edx], eax
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_11E320]
        mov edx, dword [byte ebp-014h]
        add eax, dword [byte ebp+018h]
        mov dword [byte edx+04h], eax
        cmp dword [byte ebp-0Ch], byte 2
        jne short .22
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_11E304]
        add eax, dword [byte ebp+014h]
        mov dword [byte ebp-044h], eax
        fild dword [byte ebp-044h]
        fadd qword [F64_143p964]
        fadd qword [F64_neg20]
        jmp short .23
.22:
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_11E304]
        add eax, dword [byte ebp+014h]
        mov dword [byte ebp-044h], eax
        fild dword [byte ebp-044h]
        fadd qword [F64_143p964]
.23:
        call __CHP
        fistp dword [byte ebp-044h]
        mov eax, dword [byte ebp-044h]
        mov dword [byte edx+08h], eax
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_11E320]
        mov edx, dword [byte ebp-014h]
        add eax, dword [byte ebp+018h]
        mov dword [byte edx+0Ch], eax
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_11E304]
        add eax, dword [byte ebp+014h]
        mov dword [byte ebp-044h], eax
        fild dword [byte ebp-044h]
        fadd qword [F64_143p964]
        call __CHP
        fistp dword [byte ebp-044h]
        mov eax, dword [byte ebp-044h]
        mov dword [byte edx+010h], eax
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_11E320]
        add eax, dword [byte ebp+018h]
        add eax, byte 5Dh
        mov dword [byte edx+014h], eax
        mov eax, dword [edx]
        mov dword [byte edx+018h], eax
        mov eax, dword [byte ebp-010h]
        mov eax, dword [dword eax+dword_11E320]
        add eax, dword [byte ebp+018h]
        add eax, byte 5Dh
        mov dword [byte edx+01Ch], eax
        mov eax, dword [edx]
        mov edx, dword [byte ebp-08h]
        add eax, byte 36h
        mov dword [byte edx+03Ah], eax
        mov eax, dword [byte ebp-014h]
        mov ecx, 4
        mov eax, dword [byte eax+04h]
        mov esi, dword [byte ebp-024h]
        add eax, byte 2Ch
        mov edi, dword [byte ebp-028h]
        mov dword [byte edx+03Eh], eax
        rep movsb
        movzx eax, byte [byte edx+042h]
        cmp eax, byte 63h
        jne short .24
        mov eax, dword [byte ebp+024h]
        mov al, byte [byte eax+04h]
        mov byte [byte edx+042h], al
        jmp short .25
.24:
        mov eax, dword [byte ebp+024h]
        mov al, byte [eax]
        add byte [byte edx+042h], al
.25:
        mov eax, dword [byte ebp-08h]
        movzx eax, byte [byte eax+043h]
        cmp eax, byte 63h
        jne short .26
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-08h]
        mov al, byte [byte eax+08h]
        mov byte [byte edx+043h], al
        jmp short .27
.26:
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-08h]
        mov al, byte [eax]
        add byte [byte edx+043h], al
.27:
        mov eax, dword [byte ebp-08h]
        movzx eax, byte [byte eax+044h]
        cmp eax, byte 63h
        jne short .28
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-08h]
        mov al, byte [byte eax+0Ch]
        mov byte [byte edx+044h], al
        jmp short .29
.28:
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-08h]
        mov al, byte [eax]
        add byte [byte edx+044h], al
.29:
        mov eax, dword [byte ebp-08h]
        movzx eax, byte [byte eax+045h]
        cmp eax, byte 63h
        jne short .30
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-08h]
        mov al, byte [byte eax+010h]
        mov byte [byte edx+045h], al
        jmp short .31
.30:
        mov eax, dword [byte ebp+024h]
        mov edx, dword [byte ebp-08h]
        mov al, byte [eax]
        add byte [byte edx+045h], al
.31:
        mov eax, dword [byte ebp-02Ch]
        movzx eax, byte [dword eax+byte_11D754]
        imul eax, byte 1Ah
        movsx edx, byte [dword eax+byte_17CC36]
        cmp edx, byte 1
        jne short .32
        mov edx, dword [byte ebp-010h]
        add eax, unk_17CC1F
        mov ebx, dword [dword edx+dword_11E320]
        mov edx, dword [dword edx+dword_11E304]
        add ebx, byte 5Dh
        add edx, byte 5Ah
        call DrawColorTextCentred
.32:
        inc dword [byte ebp-038h]
        inc dword [byte ebp-03Ch]
        add dword [byte ebp-028h], byte 66h
        add dword [byte ebp-024h], byte 4
        add dword [byte ebp-014h], byte 40h
        add dword [byte ebp-08h], byte 66h
        inc dword [byte ebp-02Ch]
        inc dword [byte ebp-0Ch]
        add dword [byte ebp-010h], byte 4
        cmp dword [byte ebp-0Ch], byte 7
        jl near .16
.33:
        lea eax, [dword ebp-0144h]
        push eax
        call SetColourRemap
        add esp, byte 4
        push dword [byte ebp-01Ch]
        call FreeBitmap
        add esp, byte 4
        call SetScreenTarget
        push dword [byte ebp+018h]
        mov eax, dword [dword ebp-014Ch]
        push dword [byte ebp+014h]
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        leave
        pop edi
        pop esi
        ret 18h
;-----------------------------------------------------------------------------
; CreateSeason                                 78634  96 PC, medium confidence
; Creates a new season: SEASON.NDX entry, the team and schedule files (Teams,
; Sched., %s%05d%cNZ.DB), with a progress box
;-----------------------------------------------------------------------------
CreateSeason:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 104h, 0
        push eax
        sub ebp, 86h
        xor eax, eax
        call GetLangText
        mov dword [byte ebp+052h], eax
        call GetTicks
        mov edx, eax
        call srand_
        mov dword [SeasonRandomSeed], edx
        cmp dword [dword_17D7D0], byte 0
        jne short .1
        mov edx, 4
        lea eax, [byte ebp-02Eh]
        xor ebx, ebx
        call MakeDirPath
        mov edx, str_SEASONNDX
        lea eax, [byte ebp-02Eh]
        call NameIndexNew
        mov dword [dword_17D7D0], eax
.1:
        mov ebx, 0Ah
        lea edx, [byte ebp-02Eh]
        mov eax, dword [dword_17D7D0]
        mov ecx, 0F0h
        call NameIndexFirstId
        mov esi, eax
        mov dword [byte ebp+06Eh], eax
        call itoa_
        push byte 0Ah
        mov eax, 4Dh
        mov ebx, 140h
        mov edx, byte_17BDAE
        mov dword [PlayoffTreeData], esi
        call GetLangText
        call ShowProgressBox
        lea eax, [byte ebp-07Eh]
        mov edx, esi
        xor ebx, ebx
        call MakeSeasonDbPath
        mov edx, 3
        lea eax, [byte ebp-056h]
        call MakeDataPath
        lea edx, [byte ebp-07Eh]
        lea eax, [byte ebp-056h]
        mov ebx, 1
        call FileCopy
        mov ecx, eax
        mov dword [byte ebp+07Eh], eax
        mov eax, 1
        mov edx, esi
        call UpdateProgressBox
        lea eax, [byte ebp-07Eh]
        call MakeSeasonDbPath
        mov edx, 0BAh
        lea eax, [byte ebp-056h]
        call MakeDataPath
        test ecx, ecx
        jne short .2
        lea edx, [byte ebp-07Eh]
        lea eax, [byte ebp-056h]
        call FileCopy
        mov dword [byte ebp+07Eh], eax
.2:
        mov eax, 2
        mov ebx, 2
        mov edx, dword [byte ebp+06Eh]
        call UpdateProgressBox
        lea eax, [byte ebp-07Eh]
        call MakeSeasonDbPath
        mov edx, 5
        lea eax, [byte ebp-056h]
        call MakeDataPath
        cmp dword [byte ebp+07Eh], byte 0
        jne short .3
        lea edx, [byte ebp-07Eh]
        lea eax, [byte ebp-056h]
        call FileCopy
        mov dword [byte ebp+07Eh], eax
.3:
        mov eax, 3
        mov ebx, 3
        mov edx, dword [byte ebp+06Eh]
        call UpdateProgressBox
        lea eax, [byte ebp-07Eh]
        call MakeSeasonDbPath
        mov edx, 6
        lea eax, [byte ebp-056h]
        call MakeDataPath
        cmp dword [byte ebp+07Eh], byte 0
        jne short .4
        lea edx, [byte ebp-07Eh]
        lea eax, [byte ebp-056h]
        call FileCopy
        mov dword [byte ebp+07Eh], eax
.4:
        mov eax, 4
        mov ebx, 4
        mov edx, dword [byte ebp+06Eh]
        call UpdateProgressBox
        lea eax, [byte ebp-07Eh]
        call MakeSeasonDbPath
        mov edx, 7
        lea eax, [byte ebp-056h]
        call MakeDataPath
        cmp dword [byte ebp+07Eh], byte 0
        jne short .5
        lea edx, [byte ebp-07Eh]
        lea eax, [byte ebp-056h]
        call FileCopy
        mov dword [byte ebp+07Eh], eax
.5:
        mov eax, 5
        mov ebx, 5
        mov edx, dword [byte ebp+06Eh]
        call UpdateProgressBox
        lea eax, [byte ebp-07Eh]
        call MakeSeasonDbPath
        mov edx, 8
        lea eax, [byte ebp-056h]
        call MakeDataPath
        cmp dword [byte ebp+07Eh], byte 0
        jne short .6
        lea edx, [byte ebp-07Eh]
        lea eax, [byte ebp-056h]
        call FileCopy
        mov dword [byte ebp+07Eh], eax
.6:
        mov eax, 6
        call UpdateProgressBox
        push byte 0
        push dword 50BEh
        push str_Teams
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push dword 1998h
        push str_Sched
        mov dword [byte ebp+07Ah], eax
        call AllocMemBlock
        mov ebx, 6
        mov edx, dword [byte ebp+06Eh]
        add esp, byte 0Ch
        mov dword [byte ebp+066h], eax
        lea eax, [byte ebp-07Eh]
        mov esi, 444h
        call MakeSeasonDbPath
        mov eax, dword [dword_17CC13]
        mov dword [byte ebp+076h], 54h
        cmp eax, byte 1
        jb short .7
        jbe short .9
        cmp eax, byte 2
        je near .11
        jmp near .22
.7:
        test eax, eax
        jne near .22
        mov edx, 9
        lea eax, [byte ebp-056h]
        call MakeDataPath
        cmp dword [byte ebp+07Eh], byte 0
        jne short .8
        lea edx, [byte ebp-07Eh]
        lea eax, [byte ebp-056h]
        call FileCopy
        mov dword [byte ebp+07Eh], eax
.8:
        mov eax, 8
        mov esi, 444h
        mov dword [byte ebp+076h], 54h
        jmp near .21
.9:
        mov edx, 0B9h
        lea eax, [byte ebp-056h]
        call MakeDataPath
        cmp dword [byte ebp+07Eh], byte 0
        jne short .10
        lea edx, [byte ebp-07Eh]
        lea eax, [byte ebp-056h]
        call FileCopy
        mov dword [byte ebp+07Eh], eax
.10:
        mov eax, 8
        mov esi, 270h
        mov dword [byte ebp+076h], 30h
        jmp near .21
.11:
        mov edx, 5Ch
        lea eax, [byte ebp-056h]
        call MakeDataPath
        cmp dword [byte ebp+07Eh], byte 0
        jne short .12
        lea edx, [byte ebp-07Eh]
        lea eax, [byte ebp-056h]
        call FileCopy
        mov dword [byte ebp+07Eh], eax
.12:
        mov eax, 7
        mov esi, 145h
        mov dword [byte ebp+076h], 19h
        call UpdateProgressBox
        xor ecx, ecx
.13:
        mov byte [byte ecx+ebp+01Ah], cl
        inc ecx
        cmp ecx, byte 1Ah
        jl short .13
        xor ecx, ecx
.14:
        call rand_
        mov ebx, 1Ah
        cdq
        idiv ebx
        mov edi, 1Ah
        call rand_
        mov bl, dl
        cdq
        idiv edi
        movsx edx, dl
        movsx eax, bl
        movsx edi, byte [byte edx+ebp+01Ah]
        movsx ebx, byte [byte eax+ebp+01Ah]
        mov ebx, dword [nosplit ebx*4+dword_11D59C]
        shl edi, 2
        cmp ebx, dword [dword edi+dword_11D59C]
        jne short .15
        mov bh, byte [byte eax+ebp+01Ah]
        mov bl, byte [byte edx+ebp+01Ah]
        mov byte [byte eax+ebp+01Ah], bl
        inc ecx
        mov byte [byte edx+ebp+01Ah], bh
.15:
        cmp ecx, byte 18h
        jl short .14
        mov ebx, 6
        mov edx, dword [byte ebp+06Eh]
        lea eax, [byte ebp-07Eh]
        call MakeSeasonDbPath
        cmp dword [byte ebp+07Eh], byte 0
        jne short .16
        lea edx, [byte ebp+05Ah]
        lea eax, [byte ebp-07Eh]
        call FileOpenReadWrite
        mov dword [byte ebp+07Eh], eax
.16:
        cmp dword [byte ebp+07Eh], byte 0
        jne short .17
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+05Ah]
        mov ebx, esi
        call WriteDbRecord6
        mov dword [byte ebp+07Eh], eax
.17:
        mov eax, dword [byte ebp+066h]
        xor ecx, ecx
        jmp short .20
.18:
        cmp dword [byte ebp+07Eh], byte 0
        jne short .19
        mov dl, byte [byte eax+03h]
        movsx edx, dl
        mov dl, byte [byte edx+ebp+01Ah]
        mov bl, byte [byte eax+02h]
        mov byte [byte eax+02h], dl
        movsx edx, bl
        mov dl, byte [byte edx+ebp+01Ah]
        mov byte [byte eax+03h], dl
.19:
        add eax, byte 6
        inc ecx
.20:
        cmp ecx, esi
        jl short .18
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+05Ah]
        mov ebx, esi
        call WriteSeasonBlock
        lea eax, [byte ebp+05Ah]
        call FileClose
        mov eax, 8
.21:
        call UpdateProgressBox
.22:
        mov ecx, 1Ah
        lea eax, [byte ebp+036h]
        xor edx, edx
        call __STOSB
        cmp dword [byte ebp+07Eh], byte 0
        jne near .25
        mov ebx, 6
        mov edx, dword [byte ebp+06Eh]
        lea eax, [byte ebp-07Eh]
        call MakeSeasonDbPath
        lea edx, [byte ebp+05Ah]
        lea eax, [byte ebp-07Eh]
        call FileOpenRead
        mov ebx, esi
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte ebp+05Ah]
        call WriteDbRecord6
        mov ebx, 4
        mov edx, dword [byte ebp+06Eh]
        lea eax, [byte ebp-07Eh]
        call MakeSeasonDbPath
        lea edx, [byte ebp+056h]
        lea eax, [byte ebp-07Eh]
        call FileOpenReadWrite
        mov edx, dword [byte ebp+07Ah]
        mov eax, dword [byte ebp+056h]
        xor ecx, ecx
        call ReadSeasonHeader
        mov edx, dword [byte ebp+066h]
        jmp short .24
.23:
        imul ebx, ecx, byte 6
        mov al, byte [byte edx+02h]
        mov ah, byte [byte edx+03h]
        mov byte [dword ebp+082h], ah
        movsx eax, al
        imul edi, eax, dword 31Bh
        mov dword [byte ebp+05Eh], edi
        mov edi, dword [byte ebp+07Ah]
        add edi, dword [byte ebp+05Eh]
        mov dword [byte ebp+062h], edi
        movsx edi, byte [byte eax+ebp+036h]
        shl edi, 2
        mov dword [byte ebp+05Eh], edi
        mov edi, dword [byte ebp+062h]
        add edi, dword [byte ebp+05Eh]
        inc ebx
        inc ebx
        mov dword [dword edi+014Fh], ebx
        inc byte [byte eax+ebp+036h]
        movsx eax, byte [dword ebp+082h]
        imul edi, eax, dword 31Bh
        mov dword [byte ebp+05Eh], edi
        mov edi, dword [byte ebp+07Ah]
        add edi, dword [byte ebp+05Eh]
        mov dword [byte ebp+05Eh], edi
        movsx edi, byte [byte eax+ebp+036h]
        shl edi, 2
        mov dword [byte ebp+062h], edi
        mov edi, dword [byte ebp+05Eh]
        add edi, dword [byte ebp+062h]
        add edx, byte 6
        inc ecx
        mov dword [dword edi+014Fh], ebx
        inc byte [byte eax+ebp+036h]
.24:
        cmp ecx, esi
        jl short .23
        lea eax, [byte ebp+05Ah]
        mov edx, dword [byte ebp+07Ah]
        call FileClose
        mov eax, dword [byte ebp+056h]
        call WriteSeasonHeader
        lea eax, [byte ebp+056h]
        call FileClose
.25:
        imul esi, dword [byte ebp+076h], dword 3E8h
        push byte 0
        push esi
        push str_Nothing
        call AllocMemBlock
        mov edi, eax
        add esp, byte 0Ch
        mov dword [byte ebp+072h], eax
        mov ecx, esi
        xor eax, eax
        mov dword [byte ebp+06Ah], esi
        rep stosb
        xor esi, esi
        mov edi, 41h
.26:
        movsx eax, byte [dword esi+byte_17CC36]
        cmp eax, byte 1
        jne short .27
        mov edx, 4
        lea eax, [byte ebp-06h]
        xor ebx, ebx
        call MakeDirPath
        push edi
        push dword [byte ebp+06Eh]
        lea eax, [byte ebp-06h]
        push eax
        push str_S05dCNZDB2
        lea eax, [byte ebp-07Eh]
        push eax
        call sprintf_
        add esp, byte 14h
        cmp dword [byte ebp+07Eh], byte 0
        jne short .27
        push dword [byte ebp+06Ah]
        push dword [byte ebp+072h]
        lea eax, [byte ebp-07Eh]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        lea eax, [byte ebp-07Eh]
        push eax
        call FileSizeByName
        add esp, byte 4
        test eax, eax
        sete al
        movzx eax, al
        mov dword [byte ebp+07Eh], eax
.27:
        add esi, byte 1Ah
        inc edi
        cmp esi, 2A4h
        jne short .26
        push dword [byte ebp+072h]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+07Ah]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+066h]
        call FreeMemBlock
        mov eax, 9
        add esp, byte 4
        mov ebx, 7
        mov edx, dword [byte ebp+06Eh]
        call UpdateProgressBox
        lea eax, [byte ebp-07Eh]
        call MakeSeasonDbPath
        cmp dword [byte ebp+07Eh], byte 0
        jne short .28
        push dword 3A7h
        push SeasonUserRecords
        lea eax, [byte ebp-07Eh]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        lea eax, [byte ebp-07Eh]
        push eax
        call FileSizeByName
        add esp, byte 4
        test eax, eax
        sete al
        movzx eax, al
        mov dword [byte ebp+07Eh], eax
.28:
        mov ecx, 39Dh
        mov edi, unk_17CED5
        xor eax, eax
        mov esi, SeasonUserRecords
        rep stosb
        mov ecx, 0B9h
        mov edi, unk_17CED5
        mov edx, 63h
        rep movsb
        mov ecx, 1Fh
        mov eax, dword_17D1E2
        call __STOSD
        mov eax, dword [dword ebp-082h]
        mov ebx, 0Ah
        add eax, eax
        mov esi, SeasonUserTeam
        inc eax
        and byte [cddriveptr], 0F8h
        and eax, byte 7
        mov edi, byte_17D13A
        or dword [cddriveptr], eax
        mov eax, SeasonUserTeam
        mov dword [dword_17D267], 1
        call strlen_
        mov ecx, eax
        mov edx, dword [byte ebp+06Eh]
        rep movsb
        lea eax, [byte ebp-07Eh]
        call MakeSeasonDbPath
        cmp dword [byte ebp+07Eh], byte 0
        jne short .29
        push dword 39Dh
        push unk_17CED5
        lea eax, [byte ebp-07Eh]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        lea eax, [byte ebp-07Eh]
        push eax
        call FileSizeByName
        add esp, byte 4
        test eax, eax
        sete al
        movzx eax, al
        mov dword [byte ebp+07Eh], eax
.29:
        call HideProgressBox
        call FreeStatsTables
        cmp dword [byte ebp+07Eh], byte 0
        je short .30
        push byte 2
        push byte 0
        push dword 0F0h
        push dword 140h
        mov eax, 267h
        mov ecx, byte_17BDAE
        push byte 0
        lea ebx, [byte ebp+052h]
        mov edx, 1
        call GetLangText
        call MessageBox
        jmp short .31
.30:
        mov ebx, SeasonUserTeam
        lea edx, [byte ebp-02Eh]
        mov eax, dword [dword_17D7D0]
        call NameIndexAdd
        mov dword [dword_17D7D0], eax
        call NameIndexSave
.31:
        mov eax, dword [byte ebp+07Eh]
        lea esp, [dword ebp+086h]
        jmp near NewSeasonScreen_9A9
;-----------------------------------------------------------------------------
; EditSeasonName                               78D46  96 PC, medium confidence
; Edits the season's name (text 4Eh, EditText)
;-----------------------------------------------------------------------------
EditSeasonName:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        push eax
        imul esi, dword [byte ebp-010h], byte 1Ah
        push dword [MatchupLayer]
        mov edi, unk_17CC1F
        call TextSetFont
        add esp, byte 4
        add edi, esi
        lea eax, [byte ebp-0Ch]
        mov edx, edi
        call strcpy_
        lea eax, [byte ebp-0Ch]
        push eax
        push dword 0F0h
        mov ecx, 0Bh
        push dword 140h
        mov eax, 4Eh
        mov ebx, byte_17BDAE
        call GetLangText
        mov edx, eax
        xor eax, eax
        call EditText
        test eax, eax
        je short .1
        lea eax, [byte ebp-0Ch]
        call strlen_
        test eax, eax
        jne short .2
.1:
        imul eax, dword [byte ebp-010h], byte 1Ah
        mov edi, unk_17CC1F
        mov ecx, 0Bh
        mov byte [dword eax+byte_17CC36], 0
        add edi, eax
        xor eax, eax
        rep stosb
        jmp short .3
.2:
        lea edx, [byte ebp-0Ch]
        mov eax, edi
        call strcpy_
        mov byte [dword esi+byte_17CC36], 1
.3:
        mov eax, 1
        leave
        jmp near NewSeasonScreen_9AA
        push ebx
        push edx
        mov ebx, 6
        dec eax
        dec eax
        xor edx, edx
        div ebx
        pop edx
        pop ebx
        ret
        push ebx
        mov ebx, edx
        imul ebx, byte 6
        xor edx, edx
        inc ebx
        inc ebx
.4:
        cmp ebx, dword [dword eax+014Fh]
        jbe short .5
        add eax, byte 4
        inc edx
        jmp short .4
.5:
        mov eax, edx
        pop ebx
        ret
        push ecx
        mov ecx, 2Fh
EditSeasonName_D3:
        call FileWriteAt
        pop ecx
        ret
        push ecx
        mov ecx, 36h
EditSeasonName_E0:
        call FileReadAt
        pop ecx
        ret
        push ecx
        mov ecx, 36h
        jmp short EditSeasonName_D3
        push ecx
        mov ecx, 6
        jmp short EditSeasonName_D3
;-----------------------------------------------------------------------------
; WriteSeasonBlock                                78E3D  96 PC, low confidence
; Writes a season file block (FileWriteAt helper)
;-----------------------------------------------------------------------------
WriteSeasonBlock:
        push ecx
        imul ecx, ebx, byte 6
        mov ebx, 2
        jmp short EditSeasonName_D3
        push ecx
        imul ebx, dword 31Bh
        mov ecx, 31Bh
        jmp short EditSeasonName_D3
;-----------------------------------------------------------------------------
; WriteSeasonHeader                               78E56  96 PC, low confidence
; Writes the season header (50BEh bytes)
;-----------------------------------------------------------------------------
WriteSeasonHeader:
        push ebx
        push ecx
        mov ecx, 50BEh
        xor ebx, ebx
        call FileWriteAt
        pop ecx
        pop ebx
        ret
        push ecx
        imul ebx, byte 63h
        mov ecx, 63h
        jmp short EditSeasonName_E0
        push ecx
        imul ebx, byte 1Ah
        mov ecx, 1Ah
        add ebx, byte 38h
        jmp short EditSeasonName_E0
        push ecx
        imul ebx, byte 1Ah
        mov ecx, 1Ah
        add ebx, byte 38h
        jmp short EditSeasonName_D3
        push ecx
        mov ecx, 28h
        jmp short EditSeasonName_E0
        push ecx
        mov ecx, 2Ch
        jmp short EditSeasonName_E0
;-----------------------------------------------------------------------------
; MakeSeasonDbPath                             78E9E  96 PC, medium confidence
; (path, season, file): the path of a season database file (directory 4,
; %05d, %s.DB from off_11E370)
;-----------------------------------------------------------------------------
MakeSeasonDbPath:
        push ecx
        push esi
        enter 14h, 0
        mov ecx, eax
        mov esi, ebx
        push edx
        push str_05d2
        lea eax, [byte ebp-014h]
        push eax
        xor ebx, ebx
        call sprintf_
        add esp, byte 0Ch
        mov edx, 4
        mov eax, ecx
        call MakeDirPath
        lea edx, [byte ebp-014h]
        mov eax, ecx
        call strcat_
        mov eax, esi
        push dword [nosplit eax*4+off_11E370]
        push str_SDB
        lea eax, [byte ebp-014h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-014h]
MakeSeasonDbPath_51:
        mov eax, ecx
        call strcat_
        leave
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; MakePlayoffDbPath                            78EFA  96 PC, medium confidence
; (path, season, file): the same in the playoff directory (6)
;-----------------------------------------------------------------------------
MakePlayoffDbPath:
        push ecx
        push esi
        enter 0Ch, 0
        mov ecx, eax
        mov esi, ebx
        push edx
        push str_05d2
        lea eax, [byte ebp-0Ch]
        push eax
        xor ebx, ebx
        call sprintf_
        add esp, byte 0Ch
        mov edx, 6
        mov eax, ecx
        call MakeDirPath
        lea edx, [byte ebp-0Ch]
        mov eax, ecx
        call strcat_
        mov eax, esi
        push dword [nosplit eax*4+off_11E370]
        push str_SDB
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-0Ch]
        jmp short MakeSeasonDbPath_51
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 50h, 0
        mov edi, eax
        push byte 1Ch
        mov eax, 3Ah
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, byte_17BDAE
        call GetLangText
        call ShowProgressBox
        push byte 0FFFFFFFFh
        mov ecx, 7
        lea edx, [byte ebp-050h]
        mov ebx, edi
        xor eax, eax
        call MakeDatabasePath
        push byte 0
        lea eax, [byte ebp-050h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [byte ebp-0Ch], eax
        lea esi, [dword eax+02A4h]
.1:
        movsx edx, byte [dword eax+0108h]
        cmp edx, byte 1
        jne short .2
        mov byte [dword eax+0107h], 0
.2:
        add eax, byte 1Ah
        cmp eax, esi
        jne short .1
        push dword 3A7h
        push dword [byte ebp-0Ch]
        lea eax, [byte ebp-050h]
        push eax
        call SaveFileBlock
        add esp, byte 0Ch
        mov eax, 1
        mov dword [byte ebp-010h], 0
        call UpdateProgressBox
        mov eax, dword [byte ebp-0Ch]
        mov dword [byte ebp-08h], 2
        mov dword [byte ebp-04h], eax
.3:
        mov eax, dword [byte ebp-08h]
        call UpdateProgressBox
        mov eax, dword [byte ebp-04h]
        movsx eax, byte [dword eax+0108h]
        cmp eax, byte 1
        jne short .5
        xor esi, esi
.4:
        push byte 0FFFFFFFFh
        lea edx, [byte ebp-050h]
        mov ecx, esi
        mov ebx, edi
        xor eax, eax
        call MakeDatabasePath
        push dword [byte ebp-010h]
        lea edx, [byte ebp-030h]
        mov ecx, esi
        mov ebx, edi
        xor eax, eax
        call MakeDatabasePath
        lea edx, [byte ebp-030h]
        lea eax, [byte ebp-050h]
        inc esi
        call FileCopy
        cmp esi, byte 0Bh
        jl short .4
.5:
        add dword [byte ebp-04h], byte 1Ah
        inc dword [byte ebp-010h]
        inc dword [byte ebp-08h]
        cmp dword [byte ebp-010h], byte 1Ah
        jl short .3
        call HideProgressBox
        push dword [byte ebp-0Ch]
        call FreeMemBlock
        add esp, byte 4
MakePlayoffDbPath_15F:
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ResetSeasonFiles                                79060  96 PC, low confidence
; Deletes and recreates a season's database files (%s%05d%cnz.db,
; %s%05d%csg.db) with a progress box
;-----------------------------------------------------------------------------
ResetSeasonFiles:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 40h, 0
        mov esi, eax
        push byte 25h
        mov eax, 3Bh
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, byte_17BDAE
        call GetLangText
        call ShowProgressBox
        xor ecx, ecx
.1:
        lea eax, [byte ebp-020h]
        mov ebx, ecx
        mov edx, esi
        call MakeSeasonDbPath
        lea eax, [byte ebp-020h]
        call UnlinkJump
        mov eax, ecx
        inc ecx
        call UpdateProgressBox
        cmp ecx, byte 0Bh
        jl short .1
        mov ecx, 0Bh
        mov edi, 41h
.2:
        mov edx, 4
        lea eax, [byte ebp-040h]
        xor ebx, ebx
        call MakeDirPath
        push edi
        push esi
        lea eax, [byte ebp-040h]
        push eax
        push str_S05dCnzDb3
        lea eax, [byte ebp-020h]
        push eax
        call sprintf_
        add esp, byte 14h
        lea eax, [byte ebp-020h]
        call UnlinkJump
        push edi
        push esi
        lea eax, [byte ebp-040h]
        push eax
        push str_S05dCsgDb
        lea eax, [byte ebp-020h]
        push eax
        call sprintf_
        add esp, byte 14h
        lea eax, [byte ebp-020h]
        inc edi
        call UnlinkJump
        mov eax, ecx
        inc ecx
        call UpdateProgressBox
        cmp ecx, byte 25h
        jne short .2
        call HideProgressBox
        jmp near MakePlayoffDbPath_15F
        push ecx
        push esi
        push edi
        enter 3Ch, 0
        push eax
        mov edi, edx
        mov edx, ebx
        mov eax, 2
        call GetLangText
        mov dword [byte ebp-01Ch], eax
        mov eax, 3
        xor ebx, ebx
        call GetLangText
        mov dword [byte ebp-018h], eax
        test edx, edx
        je short .3
        push byte 2
        push ebx
        push dword 0C8h
        push dword 140h
        mov eax, 3Ch
        mov ecx, byte_17BDAE
        push ebx
        mov edx, 2
        lea ebx, [byte ebp-01Ch]
        call GetLangText
        call MessageBox
        mov ebx, eax
.3:
        test ebx, ebx
        jne near .8
        push byte 25h
        mov eax, 3Dh
        mov ecx, 0F0h
        mov ebx, 140h
        mov edx, byte_17BDAE
        call GetLangText
        call ShowProgressBox
        push byte 0FFFFFFFFh
        mov ecx, 7
        mov ebx, dword [byte ebp-040h]
        lea edx, [byte ebp-03Ch]
        mov eax, edi
        call MakeDatabasePath
        push byte 0
        lea eax, [byte ebp-03Ch]
        push eax
        xor esi, esi
        call OpenArtArchiveErr
        mov edx, eax
        add esp, byte 8
        mov dword [byte ebp-014h], eax
        mov eax, 2
        mov dword [byte ebp-08h], esi
        call SoundSecondsToBytes
        call FillMusicStream
        mov dword [byte ebp-010h], edx
.4:
        mov eax, dword [byte ebp-010h]
        movsx eax, byte [dword eax+0108h]
        cmp eax, byte 1
        jne short .6
        mov dword [byte ebp-0Ch], 0
.5:
        push dword [byte ebp-08h]
        mov ecx, dword [byte ebp-0Ch]
        mov ebx, dword [byte ebp-040h]
        lea edx, [byte ebp-03Ch]
        mov eax, edi
        call MakeDatabasePath
        lea eax, [byte ebp-03Ch]
        inc dword [byte ebp-0Ch]
        call UnlinkJump
        cmp dword [byte ebp-0Ch], byte 0Bh
        jl short .5
.6:
        inc esi
        mov eax, esi
        add dword [byte ebp-010h], byte 1Ah
        call UpdateProgressBox
        mov eax, 2
        inc dword [byte ebp-08h]
        call SoundSecondsToBytes
        call FillMusicStream
        cmp dword [byte ebp-08h], byte 1Ah
        jl short .4
        mov dword [byte ebp-04h], 0
.7:
        push byte 0FFFFFFFFh
        mov ecx, dword [byte ebp-04h]
        mov ebx, dword [byte ebp-040h]
        lea edx, [byte ebp-03Ch]
        mov eax, edi
        call MakeDatabasePath
        lea eax, [byte ebp-03Ch]
        inc esi
        call UnlinkJump
        mov eax, esi
        call UpdateProgressBox
        mov eax, 2
        inc dword [byte ebp-04h]
        call SoundSecondsToBytes
        call FillMusicStream
        cmp dword [byte ebp-04h], byte 0Bh
        jl short .7
        mov eax, 2
        call SoundSecondsToBytes
        call FillMusicStream
        call HideProgressBox
        push dword [byte ebp-014h]
        call FreeMemBlock
        mov eax, 1
        add esp, byte 4
        leave
        pop edi
        pop esi
        pop ecx
        ret
.8:
        xor eax, eax
        leave
        pop edi
        pop esi
        pop ecx
        ret
        push ebx
        push ecx
        push esi
        push edi
        enter 20h, 0
        mov edi, edx
        mov ebx, 7
        mov edx, eax
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
        push byte 0
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        mov ecx, 3A7h
        add esp, byte 8
        mov esi, eax
        mov edx, eax
        rep movsb
        push edx
        call FreeMemBlock
        add esp, byte 4
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
str_Punct:
        db 09h,00h,00h,00h,03h,00h,00h,00h,05h,00h,00h,00h,00h,00h,00h,00h
        db 01h,00h,00h,00h,00h,00h,00h,00h
unk_79303:
        db 0DBh,00h,00h,00h,069h,00h,00h,00h,0E4h,00h,00h,00h,060h,00h,00h,00h
        db 092h,01h,00h,00h,061h,00h,00h,00h,09Dh,01h,00h,00h,068h,00h,00h,00h
        db 09Ch,01h,00h,00h,07Ah,00h,00h,00h,091h,01h,00h,00h,07Fh,00h,00h,00h
        db 0E4h,00h,00h,00h,07Eh,00h,00h,00h,0DEh,00h,00h,00h,078h,00h,00h,00h
        db 066h,00h,00h,00h,0A7h,01h,00h,00h,070h,00h,00h,00h,0A0h,01h,00h,00h
        db 0E2h,00h,00h,00h,09Fh,01h,00h,00h,0F0h,00h,00h,00h,0A8h,01h,00h,00h
        db 0EEh,00h,00h,00h,0B1h,01h,00h,00h,0E4h,00h,00h,00h,0B7h,01h,00h,00h
        db 06Dh,00h,00h,00h,0B5h,01h,00h,00h,067h,00h,00h,00h,0AEh,01h,00h,00h
        db 02h,01h,00h,00h,0AEh,01h,00h,00h,02h,01h,00h,00h,0A6h,01h,00h,00h
        db 08h,01h,00h,00h,0A0h,01h,00h,00h,079h,01h,00h,00h,0A0h,01h,00h,00h
        db 088h,01h,00h,00h,0A6h,01h,00h,00h,088h,01h,00h,00h,0B0h,01h,00h,00h
        db 07Dh,01h,00h,00h,0B6h,01h,00h,00h,0Ah,01h,00h,00h,0B5h,01h,00h,00h
        db 09Bh,01h,00h,00h,0AEh,01h,00h,00h,09Bh,01h,00h,00h,0A6h,01h,00h,00h
        db 0A6h,01h,00h,00h,09Fh,01h,00h,00h,018h,02h,00h,00h,0A0h,01h,00h,00h
        db 021h,02h,00h,00h,0A8h,01h,00h,00h,022h,02h,00h,00h,0AFh,01h,00h,00h
        db 017h,02h,00h,00h,0B7h,01h,00h,00h,0A4h,01h,00h,00h,0B6h,01h,00h,00h
        db 099h,00h,00h,00h,0C7h,01h,00h,00h,0A1h,00h,00h,00h,0C1h,01h,00h,00h
        db 015h,01h,00h,00h,0C1h,01h,00h,00h,020h,01h,00h,00h,0C8h,01h,00h,00h
        db 01Fh,01h,00h,00h,0D1h,01h,00h,00h,017h,01h,00h,00h,0D8h,01h,00h,00h
        db 0A2h,00h,00h,00h,0D7h,01h,00h,00h,098h,00h,00h,00h,0D0h,01h,00h,00h
        db 070h,01h,00h,00h,0D0h,01h,00h,00h,070h,01h,00h,00h,0C8h,01h,00h,00h
        db 07Bh,01h,00h,00h,0C1h,01h,00h,00h,0EFh,01h,00h,00h,0C1h,01h,00h,00h
        db 0F8h,01h,00h,00h,0C8h,01h,00h,00h,0F7h,01h,00h,00h,0D1h,01h,00h,00h
        db 0EFh,01h,00h,00h,0D6h,01h,00h,00h,079h,01h,00h,00h,0D7h,01h,00h,00h
unk_79483:
        db 0DAh,00h,00h,00h,066h,00h,00h,00h,0E3h,00h,00h,00h,05Fh,00h,00h,00h
        db 091h,01h,00h,00h,05Eh,00h,00h,00h,09Dh,01h,00h,00h,065h,00h,00h,00h
        db 09Dh,01h,00h,00h,076h,00h,00h,00h,092h,01h,00h,00h,07Fh,00h,00h,00h
        db 0E6h,00h,00h,00h,07Fh,00h,00h,00h,0DAh,00h,00h,00h,078h,00h,00h,00h
unk_794C3:
        db 00h,02h,04h,06h,07h,05h,03h,01h
jpt_794CB:
        dd SeasonMenuScreen_794
        dd SeasonMenuScreen_7AC
        dd SeasonMenuScreen_C68
        dd SeasonMenuScreen_858
        dd SeasonMenuScreen_ADF
        dd SeasonMenuScreen_AEB
        dd SeasonMenuScreen_AF7
        dd SeasonMenuScreen_B7E
        dd SeasonMenuScreen_C05
jpt_794EF:
        dd SeasonMenuScreen_9D7
        dd SeasonMenuScreen_A07
        dd SeasonMenuScreen_A34
        dd SeasonMenuScreen_A61
