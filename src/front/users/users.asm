; User records: LOCAL.NDX of user names, the user record files, picking users for the controllers, the user records screen (96 PC).
bits 32
%include "hockey.inc"
extern SideBarArt
section s_2A3D6 progbits alloc exec nowrite align=1
extern str_Punct_ExportUserRecords, str_ExportDashes, str_ExportSpacesWide, str_ExportSpaces, UserNameBuf

extern TitleTextStyle, DeleteFiles
extern UserRecordsTop, UserRecordsFirst, UserRecordsRow, str_J, str_V, ViewScreenWidth, ViewScreenHeight, UserMenuBoxes
extern UserRecordList
extern UserStreakField, UserOpponentColumn, UserPowerPlayField, UserShutoutField, UserGoalsAgainstField, UserLongStreakField, UserGoalsForField, UserRatingColumn
extern UserShutoutColumn, UserNameIndex, UserStreakColumn, UserNameField, UserLongStreakColumn, UserPowerPlayColumn, UserTeamField, UserPopupRecords





extern FrontEndScreenBmp, TeamStatsBitmap
extern EditText, fclose_, FileClose, FileCreate, FileOpenRead, FileOpenReadWrite, FileReadAt
extern FileWriteAt, fopen_, fprintf_, TextStringWidth, gameopts, GetPressedDevice, HideMessage, LoadPackedFile
extern MakeDirPath, MessageBox, MouseRead, NameIndexAdd, NameIndexFirstId, NameIndexFree, NameIndexId, NameIndexLoad
extern NameIndexNew, NameIndexPath, NameIndexRemove, NameIndexSave, LogoNames, optflags, PutBlock, qsort_
extern SetDrawBitmap, ShowMessage, sprintf_, str_00, str_08d, str_1000, str_20s, str_3d3d
extern str_3d3d3d, str_Ball, str_BKGD2, str_BT002, str_BT012, str_BT022, str_BT10, str_BT11
extern str_BT12, str_D4, str_dbgS, str_FL00, str_FL01, str_fmtTenths, str_LOCALNDX, str_Logbook
extern str_Logname, str_Pal5, str_Shadtbl, str_Sld1, str_Sld2, str_Slid, str_Slu1, str_Slu2
extern str_sp00, str_sp002, str_sp1000, str_sp10002, str_sp3d1d, str_sp3d1d2, str_sp3d3d2d2d2d, str_sp3d3d3d3d3d3d3d3d
extern str_sp3s, str_sp3s2, str_spD, str_TB00, str_TB01, str_TB10, str_TB11, str_TXTD
extern str_Uga, str_Ugf, str_Ulstreak, str_Ulxh, str_Ulxn, str_Ulyh, str_Ulyn, str_Uname
extern str_Uopp, str_Upk, str_Upp, str_Upts, str_Urate, str_Uso, str_Usort, str_Ustreak
extern str_Uteam, str_wt, strcat_, strcmp_, strcpy_, strlen_, OpenScreen, SlideInSideBar
extern SetScreenColors, FadePalette, FadeOut, DrawText, DrawTextCentred, SetTextColors, DrawColorText, FillBox
extern InitMenuItems, RunMenu, PlaySfx, SoundIdle, GetLangText, InitVScrollBar, ScrollBarUp, ScrollBarDown
extern FreeScrollBar, SetScrollBarPos, DrawScrollBar, CheckExportName, DrawShapeCore, PutBlockAtOwnPos, AllocMemBlock, FreeMemBlock
extern CreateBitmap, TintRect, FreeBitmap, TextSetColor, SaveTextState, SetDrawTarget, SetScreenTarget, SetRemapTable
extern FindShape, RemapPolygonArgs, TextSetFont, WaitTicks, SlotUserNames, hmtmPwrGoals, hmtmPwrPlays
extern hmscore, awtmPwrGoals, awtmPwrPlays, awscore
global UserRatingScaleTwoToFour, UserRatingScaleOneToOneHalf, UserRatingScalePair, UserRatingScaleQuarterSteps, UserRecordsLeftButton, UserRecordsRightButton, str_3_UserRecordsScreen, ClearSlotUser
global ClearSlotUsers, UserRecordRating, CreateUserRecord, DeleteUser, NewUser, NewUser_159, DrawUserList, GetUserName
global LoadUserIndex, ScrollUserList, PickUsersScreen, UpdateUserRecords, UpdateUserRecords_47F, UpdateUserRecords_ret, CompareUsersByName, CompareUsersByRating
global CompareUsersByRecord, CompareUsersByRecord_127, CompareUsersByRecord_12C, CompareUsersByRecord_ret, CompareUsersByGoalsFor, CompareUsersByGoalsAgainst, CompareUsersByPowerPlay, CompareUsersByPenaltyKill
global CompareUsersByTeam, CompareUsersByTeam_8, CompareUsersByOpponent, CompareUsersByShutouts, CompareUsersByStreak, jpt_2BDA2, DrawUserRecords, DrawUserRecords_23B
global DrawUserRecords_267, DrawUserRecords_27F, DrawUserRecords_29B, DrawUserRecords_2BD, DrawUserRecords_2C4, DrawUserRecords_2CB, DrawUserRecords_2D2, DrawUserRecords_2D9
global DrawUserRecords_2FC, DrawUserRecords_395, DrawUserRecords_3F0, LoadUserRecords, ExportUserRecords, jpt_2CB19, jpt_2CB2D, jpt_2CB65
global UserRecordsScreen, UserRecordsScreen_A1A, UserRecordsScreen_A2B, UserRecordsScreen_A7B, UserRecordsScreen_A84, UserRecordsScreen_A8D, UserRecordsScreen_A96, UserRecordsScreen_A9F
global UserRecordsScreen_AA8, UserRecordsScreen_AB1, UserRecordsScreen_ABA, UserRecordsScreen_AC3, UserRecordsScreen_ACC, UserRecordsScreen_AD5, UserRecordsScreen_B4F, UserRecordsScreen_B73
global UserRecordsScreen_B93, UserRecordsScreen_C6C, UserRecordsScreen_C75, UserRecordsScreen_C7E, UserRecordsScreen_C87, UserRecordsScreen_C90, UserRecordsScreen_C99, UserRecordsScreen_CA2
global UserRecordsScreen_CAB, UserRecordsScreen_CB4, UserRecordsScreen_CBD, UserRecordsScreen_CC6
UserRatingScaleTwoToFour:
        db 00h,00h,02h,00h,00h,00h,03h,00h,00h,00h,04h,00h
UserRatingScaleOneToOneHalf:
        db 00h,00h,01h,00h,00h,080h,01h,00h,00h,00h,00h,00h
UserRatingScalePair:
        db 00h,00h,01h,00h,00h,080h,01h,00h
UserRatingScaleQuarterSteps:
        db 00h,00h,01h,00h,00h,040h,01h,00h,00h,080h,01h,00h
UserRecordsLeftButton:
        db 095h,00h,00h,00h,0BDh,01h,00h,00h,01Ah,01h,00h,00h,0BDh,01h,00h,00h
        db 01Ah,01h,00h,00h,0D2h,01h,00h,00h,095h,00h,00h,00h,0D2h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
UserRecordsRightButton:
        db 064h,01h,00h,00h,0BDh,01h,00h,00h,0E9h,01h,00h,00h,0BDh,01h,00h,00h
        db 0E9h,01h,00h,00h,0D2h,01h,00h,00h,064h,01h,00h,00h,0D2h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
str_3_UserRecordsScreen:
        db 033h,00h,00h,00h,037h,00h,00h,00h,045h,00h,00h,00h,037h,00h,00h,00h
        db 045h,00h,00h,00h,049h,00h,00h,00h,033h,00h,00h,00h,049h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 034h,02h,00h,00h,037h,00h,00h,00h,045h,02h,00h,00h,037h,00h,00h,00h
        db 045h,02h,00h,00h,049h,00h,00h,00h,034h,02h,00h,00h,049h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; ClearSlotUser                                                   2A502  96 PC
; (slot): no user on that controller slot (SlotUserNames entry 21h bytes: user
; id, name "no user" text)
;-----------------------------------------------------------------------------
ClearSlotUser:
        push ebx
        push edx
        imul edx, eax, byte 21h
        mov word [dword edx+SlotUserNames], 0
        add edx, SlotUserNames
        mov eax, 62h
        lea ebx, [byte edx+02h]
        call GetLangText
        mov edx, eax
        mov eax, ebx
        call strcpy_
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ClearSlotUsers                                                  2A52F  96 PC
; No user on any of the 4 controller slots
;-----------------------------------------------------------------------------
ClearSlotUsers:
        push ebx
        push ecx
        push edx
        mov ecx, SlotUserNames
        xor ebx, ebx
        inc ecx
        inc ecx
.1:
        imul eax, ebx, byte 21h
        mov word [dword eax+SlotUserNames], 0
        mov eax, 62h
        call GetLangText
        mov edx, eax
        mov eax, ecx
        inc ebx
        call strcpy_
        add ecx, byte 21h
        cmp ebx, byte 4
        jl short .1
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        call GetPressedDevice
        test eax, eax
        jne short .3
        call SoundIdle
        jmp short .2
.3:
        call SoundIdle
        call GetPressedDevice
        test eax, eax
        jne short .3
        ret
        push ebx
        push ecx
        mov ebx, eax
        xor eax, eax
        imul edx, byte 21h
.4:
        movsx ecx, word [dword eax+SlotUserNames]
        cmp ecx, ebx
        jne short .5
        cmp eax, edx
        je short .5
        mov eax, 1
        pop ecx
        pop ebx
        ret
.5:
        add eax, byte 21h
        cmp eax, 84h
        jl short .4
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; UserRecordRating                                2A5B5  96 PC, low confidence
; Adds up a user record's counts (x3, 16.16) for its rating
;-----------------------------------------------------------------------------
UserRecordRating:
        push ebx
        push ecx
        push edx
        push esi
        mov ebx, eax
        mov edx, ebx
        mov eax, dword [eax]
        lea esi, [byte ebx+06h]
        add eax, dword [byte ebx+04h]
.1:
        movsx ecx, word [byte edx+08h]
        add eax, ecx
        movsx ecx, word [byte edx+0Eh]
        add eax, ecx
        movsx ecx, word [byte edx+01Ah]
        add eax, ecx
        movsx ecx, word [byte edx+020h]
        add eax, ecx
        movsx ecx, word [byte edx+026h]
        add eax, ecx
        movsx ecx, word [byte edx+014h]
        inc edx
        inc edx
        add eax, ecx
        cmp edx, esi
        jne short .1
        movsx edx, word [byte ebx+02Ch]
        add eax, edx
        movsx edx, word [byte ebx+02Eh]
        add eax, edx
        mov edx, ebx
        lea ecx, [byte ebx+070h]
.2:
        add edx, byte 4
        add eax, dword [byte edx+02Ch]
        add eax, dword [dword edx+09Ch]
        cmp edx, ecx
        jne short .2
        mov edx, ebx
        lea ecx, [byte ebx+04h]
.3:
        movsx ebx, word [dword edx+0110h]
        add eax, ebx
        movsx ebx, word [dword edx+0114h]
        inc edx
        inc edx
        add eax, ebx
        cmp edx, ecx
        jne short .3
        mov edx, 3
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CreateUserRecord                                                2A645  96 PC
; (path): creates an empty user record file (11Ch bytes of zeros)
;-----------------------------------------------------------------------------
CreateUserRecord:
        push ebx
        push ecx
        push edx
        push edi
        enter 120h, 0
        lea edx, [byte ebp-04h]
        mov ecx, 1
        call FileCreate
        test eax, eax
        jne short .1
        mov ecx, 11Ch
        lea edi, [dword ebp-0120h]
        lea edx, [dword ebp-0120h]
        rep stosb
        xor ebx, ebx
        mov ecx, 11Ch
        mov eax, dword [byte ebp-04h]
        call FileWriteAt
        mov ecx, eax
        lea eax, [byte ebp-04h]
        call FileClose
.1:
        mov eax, ecx
        leave
        pop edi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; DeleteUser                                                      2A692  96 PC
; (&index, n): asks to confirm, deletes the user's files and takes the user
; out of LOCAL.NDX and off any controller slot
;-----------------------------------------------------------------------------
DeleteUser:
        push ebx
        push ecx
        push esi
        push edi
        enter 5Ch, 0
        mov esi, eax
        mov edi, edx
        mov eax, dword [eax]
        add eax, byte 6Eh
        mov dword [byte ebp-04h], eax
        imul eax, edx, byte 36h
        add dword [byte ebp-04h], eax
        mov eax, 2
        call GetLangText
        mov dword [byte ebp-0Ch], eax
        mov eax, 3
        call GetLangText
        mov dword [byte ebp-08h], eax
        mov eax, dword [byte ebp-04h]
        add eax, byte 0Dh
        push eax
        mov eax, 68h
        call GetLangText
        push eax
        lea eax, [byte ebp-05Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        push byte 2
        push byte 1
        push dword 0C8h
        push dword 140h
        mov ecx, TitleTextStyle
        lea ebx, [byte ebp-0Ch]
        push byte 0
        mov edx, 2
        lea eax, [byte ebp-05Ch]
        call MessageBox
        test eax, eax
        jne near .8
        mov ebx, UserNameBuf
        mov eax, dword [esi]
        mov edx, dword [byte ebp-04h]
        add eax, byte 15h
        call DeleteFiles
        test eax, eax
        je near .5
        mov edx, edi
        mov eax, dword [esi]
        call NameIndexId
        mov ebx, dword [esi]
        mov edx, eax
        mov eax, ebx
        call NameIndexRemove
        mov dword [esi], eax
        mov ebx, eax
        cmp dword [byte eax+066h], byte 2
        jne short .1
        mov dword [byte eax+06Ah], 3EAh
.1:
        xor ebx, ebx
.2:
        movsx eax, word [dword ebx+SlotUserNames]
        cmp eax, edi
        jne short .3
        mov eax, 62h
        mov ecx, SlotUserNames
        mov word [dword ebx+SlotUserNames], 0
        add ecx, ebx
        call GetLangText
        inc ecx
        inc ecx
        mov edx, eax
        mov eax, ecx
        call strcpy_
        jmp short .4
.3:
        jle short .4
        dec word [dword ebx+SlotUserNames]
.4:
        add ebx, byte 21h
        cmp ebx, 84h
        jne short .2
        mov eax, dword [esi]
        call NameIndexSave
        mov eax, 1
        jmp near CompareUsersByRecord_ret
.5:
        mov eax, 69h
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-05Ch]
        call strcpy_
        mov edx, TitleTextStyle
        lea eax, [byte ebp-05Ch]
        mov ecx, dword [ViewScreenHeight]
        mov ebx, dword [ViewScreenWidth]
        sar ecx, 1
        sar ebx, 1
        call ShowMessage
.6:
        call GetPressedDevice
        test eax, eax
        jne short .7
        call SoundIdle
        jmp short .6
.7:
        call SoundIdle
        call GetPressedDevice
        test eax, eax
        jne short .7
        call HideMessage
.8:
        xor eax, eax
        jmp near CompareUsersByRecord_ret
;-----------------------------------------------------------------------------
; NewUser                                                         2A804  96 PC
; (&index): asks for a name (EditText), creates the user's record file (id as
; %08d) and adds the user to LOCAL.NDX; a message when it cannot
;-----------------------------------------------------------------------------
NewUser:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 68h, 0
        mov esi, eax
        mov al, byte [UserNameBuf]
        mov byte [byte ebp-034h], al
        lea eax, [byte ebp-034h]
        push eax
        push dword 0F0h
        mov ecx, 1Eh
        push dword 140h
        mov eax, 6Ah
        mov ebx, TitleTextStyle
        call GetLangText
        mov edx, eax
        xor eax, eax
        mov edi, 1
        call EditText
        test eax, eax
        je near .8
        lea eax, [byte ebp-034h]
        call strlen_
        test eax, eax
        jbe near .4
        mov edx, 3
        lea eax, [byte ebp-068h]
        xor ebx, ebx
        call MakeDirPath
        mov eax, dword [esi]
        call NameIndexFirstId
        push eax
        push str_08d
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea edx, [byte ebp-0Ch]
        lea eax, [byte ebp-068h]
        call strcat_
        lea eax, [byte ebp-068h]
        call CreateUserRecord
        mov edi, eax
        test eax, eax
        je short .3
        mov eax, 6Bh
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-068h]
        call strcpy_
        mov edx, TitleTextStyle
        lea eax, [byte ebp-068h]
        mov ecx, dword [ViewScreenHeight]
        mov ebx, dword [ViewScreenWidth]
        sar ecx, 1
        sar ebx, 1
        call ShowMessage
.1:
        call GetPressedDevice
        test eax, eax
        jne short .2
        call SoundIdle
        jmp short .1
.2:
        call SoundIdle
        call GetPressedDevice
        test eax, eax
        jne short .2
        jmp short .7
.3:
        lea ebx, [byte ebp-034h]
        lea edx, [byte ebp-0Ch]
        mov eax, dword [esi]
        call NameIndexAdd
        mov dword [esi], eax
        call NameIndexSave
        jmp short .8
.4:
        mov eax, 6Dh
        call GetLangText
        mov edx, eax
        lea eax, [byte ebp-068h]
        call strcpy_
        mov edx, TitleTextStyle
        lea eax, [byte ebp-068h]
        mov ecx, dword [ViewScreenHeight]
        mov ebx, dword [ViewScreenWidth]
        sar ecx, 1
        sar ebx, 1
        call ShowMessage
.5:
        call GetPressedDevice
        test eax, eax
        jne short .6
        call SoundIdle
        jmp short .5
.6:
        call SoundIdle
        call GetPressedDevice
        test eax, eax
        jne short .6
.7:
        call HideMessage
.8:
        mov eax, edi
NewUser_159:
        leave
        jmp near UpdateUserRecords_ret
;-----------------------------------------------------------------------------
; DrawUserList                                                    2A963  96 PC
; Draws a page of user names (10 a page) with the selected one highlighted,
; shortening names that do not fit
;-----------------------------------------------------------------------------
DrawUserList:
        push esi
        push edi
        enter 38h, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-014h], ebx
        mov dword [byte ebp-08h], ecx
        push edx
        call SetDrawBitmap
        add esp, byte 4
        push dword 0FFFFFEF0h
        push dword 0FFFFFEA2h
        push dword [byte ebp-014h]
        mov dword [byte ebp-018h], 0
        call PutBlock
        add esp, byte 0Ch
        lea eax, [byte esi+06Eh]
        cmp dword [byte esi+066h], byte 0Ah
        jge short .1
        mov esi, dword [byte esi+066h]
        jmp short .2
.1:
        mov esi, dword [byte ebp-08h]
        add esi, byte 0Ah
.2:
        mov dword [byte ebp-010h], esi
        mov esi, dword [byte ebp-08h]
        mov dword [byte ebp-04h], esi
        imul esi, byte 36h
        add esi, byte 0Dh
        add esi, eax
        imul eax, dword [byte ebp-018h], byte 0Dh
        mov dword [byte ebp-0Ch], eax
        jmp near .8
.3:
        cmp eax, dword [byte ebp+010h]
        jne short .4
        mov edx, 0FCh
        mov eax, 0Bh
        jmp short .5
.4:
        mov edx, 0FCh
        xor eax, eax
.5:
        call SetTextColors
        lea eax, [byte ebp-038h]
        mov edx, esi
        call strcpy_
        lea eax, [byte ebp-038h]
        push eax
        call TextStringWidth
        add esp, byte 4
        cmp eax, byte 5Fh
        jl short .7
        lea eax, [byte ebp-038h]
        call strlen_
        mov byte [byte eax+ebp-039h], 80h
.6:
        lea eax, [byte ebp-038h]
        push eax
        call TextStringWidth
        add esp, byte 4
        cmp eax, byte 5Fh
        jl short .7
        lea eax, [byte ebp-038h]
        call strlen_
        mov byte [byte eax+ebp-03Ah], 80h
        lea eax, [byte ebp-038h]
        call strlen_
        mov byte [byte eax+ebp-039h], 0
        jmp short .6
.7:
        mov ebx, dword [byte ebp-0Ch]
        lea eax, [byte ebp-038h]
        inc dword [byte ebp-018h]
        xor edx, edx
        inc dword [byte ebp-04h]
        call DrawColorText
        add esi, byte 36h
        add dword [byte ebp-0Ch], byte 0Dh
.8:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte ebp-010h]
        jl near .3
        call SetScreenTarget
        push dword 110h
        push dword 15Eh
        push dword [byte edi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; GetUserName                                                     2AA81  96 PC
; (index, id, out): copies the user's name; 0 when the id is not in the index
;-----------------------------------------------------------------------------
GetUserName:
        push ecx
        test eax, eax
        je short .3
        cmp dword [byte eax+066h], byte 0
        jne short .2
.1:
        xor eax, eax
        pop ecx
        ret
.2:
        sub edx, 3E8h
        test edx, edx
        jl short .1
        mov ecx, dword [byte eax+066h]
        dec ecx
        cmp edx, ecx
        jg short .1
        imul edx, byte 36h
        add eax, byte 6Eh
        add eax, edx
        lea edx, [byte eax+0Dh]
        mov eax, ebx
        call strcpy_
        mov eax, 1
.3:
        pop ecx
        ret
;-----------------------------------------------------------------------------
; LoadUserIndex                                                   2AABB  96 PC
; (&index): loads LOCAL.NDX, or makes a new one with the two default users
;-----------------------------------------------------------------------------
LoadUserIndex:
        push ebx
        push ecx
        push edx
        push esi
        enter 40h, 0
        mov ecx, eax
        mov edx, 3
        lea eax, [byte ebp-040h]
        xor ebx, ebx
        call MakeDirPath
        mov edx, str_LOCALNDX
        lea eax, [byte ebp-040h]
        call NameIndexLoad
        mov dword [ecx], eax
        test eax, eax
        jne short .1
        mov edx, str_LOCALNDX
        lea eax, [byte ebp-040h]
        call NameIndexNew
        mov dword [ecx], eax
        call NameIndexFirstId
        push eax
        push str_08d
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        mov eax, 6Eh
        lea edx, [byte ebp-0Ch]
        call GetLangText
        mov esi, dword [ecx]
        mov ebx, eax
        mov eax, esi
        call NameIndexAdd
        mov dword [ecx], eax
        call NameIndexFirstId
        push eax
        push str_08d
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        mov eax, 6Fh
        lea edx, [byte ebp-0Ch]
        call GetLangText
        mov esi, dword [ecx]
        mov ebx, eax
        mov eax, esi
        call NameIndexAdd
        mov dword [ecx], eax
        call NameIndexSave
.1:
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ScrollUserList                                  2AB63  96 PC, low confidence
; Keeps the selected line of the user list on its page (scroll up or down)
;-----------------------------------------------------------------------------
ScrollUserList:
        push ebx
        mov ebx, dword [byte eax+028h]
        cmp ebx, dword [byte eax+02Ch]
        jl short .3
        cmp edx, dword [byte eax+024h]
        jge short .2
.1:
        call SetScrollBarPos
        pop ebx
        ret
.2:
        mov ebx, dword [byte eax+024h]
        add ebx, dword [byte eax+02Ch]
        cmp edx, ebx
        jl short .3
        sub edx, dword [byte eax+02Ch]
        inc edx
        jmp short .1
.3:
        call DrawScrollBar
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PickUsersScreen                              2AB8F  96 PC, medium confidence
; The screen that puts users on the controller slots: user list with slider
; (ulxn/ulxh/ulyn/ulyh, slid, slu/sld arrows, ball cursor), new user, delete
; user
;-----------------------------------------------------------------------------
PickUsersScreen:
        push ebx
        push ecx
        push esi
        push edi
        enter 0CB8h, 0
        mov esi, eax
        mov dword [byte ebp-01Ch], edx
        lea eax, [byte ebp-028h]
        call LoadUserIndex
        push byte 0
        push dword 1E0h
        push dword 280h
        call CreateBitmap
        add esp, byte 0Ch
        push byte 0
        push byte 0
        push dword [byte eax+02Ch]
        mov edi, eax
        call DrawShapeCore
        add esp, byte 0Ch
        push byte 0
        push dword 8Ah
        push byte 5Fh
        call CreateBitmap
        add esp, byte 0Ch
        mov dword [byte ebp-030h], eax
        lea eax, [byte ebp-078h]
        push eax
        call SaveTextState
        add esp, byte 4
        push dword [FrontEndScreenBmp]
        call TextSetFont
        add esp, byte 4
        lea edx, [dword ebp-0CB8h]
        mov eax, 11h
        call InitMenuItems
        push str_Ulxn
        push esi
        call FindShape
        add esp, byte 8
        push str_Ulxh
        push esi
        mov dword [dword ebp-0C9Eh], eax
        call FindShape
        mov dword [dword ebp-0C9Ah], eax
        mov eax, dword [dword ebp-0C9Eh]
        mov dword [dword ebp-0CA8h], 4
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-05F0h], eax
        mov eax, dword [dword ebp-0C9Eh]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-05ECh], eax
        mov eax, dword [dword ebp-0C9Eh]
        mov edx, dword [dword ebp-05F0h]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [dword ebp-05ECh]
        mov dword [dword ebp-05E8h], edx
        mov dword [dword ebp-05E4h], eax
        mov eax, dword [dword ebp-0C9Eh]
        mov dword [dword ebp-05E0h], edx
        mov edx, dword [dword ebp-05ECh]
        movsx eax, word [byte eax+06h]
        add edx, eax
        mov eax, dword [dword ebp-05F0h]
        mov dword [dword ebp-05D8h], eax
        lea eax, [dword ebp-05F0h]
        mov dword [dword ebp-0CA4h], eax
        mov eax, dword [dword ebp-0C9Eh]
        mov dword [dword ebp-05DCh], edx
        mov dword [dword ebp-05D4h], edx
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        mov dword [dword ebp-0C92h], eax
        mov eax, dword [dword ebp-0C9Eh]
        push str_Ulyn
        movsx eax, word [byte eax+0Eh]
        push esi
        mov dword [dword ebp-0C8Eh], eax
        mov eax, dword [dword ebp-05E8h]
        mov byte [dword ebp-0C73h], 1
        sub eax, byte 8
        mov byte [dword ebp-0C74h], 6
        mov dword [dword ebp-0C7Eh], eax
        lea eax, [byte edx-08h]
        mov dword [dword ebp-0C86h], 35h
        mov dword [dword ebp-0C7Ah], eax
        call FindShape
        add esp, byte 8
        mov dword [dword ebp-0C38h], eax
        push str_Ulyh
        push esi
        call FindShape
        mov dword [dword ebp-0C34h], eax
        mov eax, dword [dword ebp-0C38h]
        mov dword [dword ebp-0C42h], 4
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-05B0h], eax
        mov eax, dword [dword ebp-0C38h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-05ACh], eax
        mov eax, dword [dword ebp-0C38h]
        mov edx, dword [dword ebp-05B0h]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [dword ebp-05ACh]
        mov dword [dword ebp-05A8h], edx
        mov dword [dword ebp-05A4h], eax
        mov eax, dword [dword ebp-0C38h]
        mov dword [dword ebp-05A0h], edx
        mov edx, dword [dword ebp-05ACh]
        movsx eax, word [byte eax+06h]
        add edx, eax
        mov eax, dword [dword ebp-05B0h]
        mov dword [dword ebp-0598h], eax
        lea eax, [dword ebp-05B0h]
        mov dword [dword ebp-0C3Eh], eax
        mov eax, dword [dword ebp-0C38h]
        mov dword [dword ebp-059Ch], edx
        mov dword [dword ebp-0594h], edx
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-0C2Ch], eax
        mov eax, dword [dword ebp-0C38h]
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push str_Ball
        mov dword [dword ebp-0C28h], eax
        mov eax, dword [dword ebp-05A8h]
        push esi
        sub eax, byte 8
        mov byte [dword ebp-0C0Eh], 0
        mov dword [dword ebp-0C18h], eax
        lea eax, [byte edx-08h]
        mov dword [dword ebp-0C20h], 35h
        mov dword [dword ebp-0C14h], eax
        call FindShape
        add esp, byte 8
        push eax
        push str_Slid
        push esi
        call FindShape
        add esp, byte 8
        push eax
        mov eax, edi
        mov ecx, 0Ah
        push dword [byte eax+02Ch]
        mov eax, dword [byte ebp-028h]
        lea edx, [dword ebp-0B86h]
        push byte 0
        mov ebx, dword [byte eax+066h]
        lea eax, [dword ebp-01B0h]
        call InitVScrollBar
        push str_Slu1
        push esi
        call FindShape
        add esp, byte 8
        push str_Slu2
        push esi
        mov dword [dword ebp-0B6Ch], eax
        call FindShape
        add esp, byte 8
        push str_Slu1
        push esi
        mov dword [dword ebp-0B68h], eax
        call FindShape
        add esp, byte 8
        push str_Slu1
        movsx eax, word [byte eax+0Ch]
        push esi
        mov dword [dword ebp-0B60h], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [dword ebp-0B5Ch], eax
        push str_Sld1
        push esi
        mov byte [dword ebp-0B43h], 6
        call FindShape
        add esp, byte 8
        push str_Sld2
        push esi
        mov dword [dword ebp-0A3Ah], eax
        call FindShape
        add esp, byte 8
        push str_Sld1
        push esi
        mov dword [dword ebp-0A36h], eax
        call FindShape
        add esp, byte 8
        push str_Sld1
        movsx eax, word [byte eax+0Ch]
        push esi
        mov dword [dword ebp-0A2Eh], eax
        call FindShape
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-0A2Ah], eax
        lea eax, [dword ebp-05F0h]
        mov dword [byte ebp-034h], 11Dh
        add eax, 1C0h
        xor ebx, ebx
        mov dword [byte ebp-024h], eax
        mov al, bl
        mov esi, 110h
        add al, 8
        add esp, byte 8
        mov byte [byte ebp-08h], al
        mov al, bl
        mov byte [dword ebp-0A12h], 3
        add al, 6
        mov byte [dword ebp-0A11h], 0
        mov byte [byte ebp-04h], al
        mov eax, 2CAh
.1:
        mov edx, ebx
        imul ecx, ebx, byte 0Dh
        shl edx, 6
        mov dword [dword edx+ebp-0430h], 15Eh
        mov dword [dword edx+ebp-0428h], 1BDh
        mov dword [dword edx+ebp-0420h], 1BDh
        mov dword [dword edx+ebp-0418h], 15Eh
        mov dword [dword edx+ebp-042Ch], esi
        mov dword [dword edx+ebp-0424h], esi
        mov dword [byte ebp-020h], ecx
        mov ecx, dword [byte ebp-034h]
        mov dword [dword edx+ebp-041Ch], ecx
        mov dword [dword eax+ebp-0CA8h], 4
        mov dword [dword edx+ebp-0414h], ecx
        mov edx, dword [byte ebp-024h]
        mov dword [dword eax+ebp-0CA4h], edx
        mov edx, dword [byte ebp-020h]
        mov dword [dword eax+ebp-0C7Eh], 18Dh
        add edx, 11Ah
        mov dword [dword eax+ebp-0C7Ah], edx
        cmp ebx, byte 5
        jge short .2
        mov byte [dword eax+ebp-0C74h], 3
        jmp short .3
.2:
        mov byte [dword eax+ebp-0C74h], 6
.3:
        mov dl, byte [byte ebp-04h]
        add dword [byte ebp-024h], byte 40h
        add dword [byte ebp-034h], byte 0Dh
        add eax, byte 66h
        add esi, byte 0Dh
        inc ebx
        mov byte [dword eax+ebp-0CD9h], 1
        inc byte [byte ebp-04h]
        mov byte [dword eax+ebp-0CDCh], dl
        mov dl, byte [byte ebp-08h]
        inc byte [byte ebp-08h]
        mov byte [dword eax+ebp-0CDBh], dl
        cmp ebx, byte 0Ah
        jl near .1
        imul eax, dword [byte ebp-01Ch], byte 21h
        movsx eax, word [dword eax+SlotUserNames]
        mov dword [byte ebp-0Ch], eax
        test eax, eax
        jge short .4
        mov dword [byte ebp-0Ch], 0
.4:
        imul esi, dword [byte ebp-01Ch], byte 21h
        mov edx, dword [byte ebp-0Ch]
        lea eax, [dword ebp-01B0h]
        call ScrollUserList
        mov al, byte [byte ebp-0Ch]
        mov byte [dword ebp-09ACh], 7
        mov byte [dword ebp-0615h], 10h
        push dword [byte ebp-0Ch]
        add al, 7
        mov ecx, dword [dword ebp-018Ch]
        sub al, byte [dword ebp-018Ch]
        mov edx, dword [byte ebp-030h]
        mov byte [dword ebp-0A0Fh], al
        mov byte [dword ebp-0B41h], al
        mov byte [dword ebp-0C10h], al
        mov byte [dword ebp-0C76h], al
        mov eax, dword [byte ebp-028h]
        mov ebx, dword [byte edi+02Ch]
        call DrawUserList
        push dword [dword ebp-0C14h]
        push dword [dword ebp-0C18h]
        call MouseRead
        mov eax, SlotUserNames
        mov dword [byte ebp-018h], 0
        add eax, esi
        mov dword [byte ebp-02Ch], 1
        inc eax
        inc eax
        add esp, byte 8
        mov dword [byte ebp-014h], eax
.5:
        call SoundIdle
        mov dword [byte ebp-02Ch], 0FFFFFFFFh
.6:
        cmp dword [byte ebp-02Ch], byte 0
        jge short .9
        mov eax, dword [byte ebp-028h]
        cmp dword [byte eax+066h], byte 0Ah
        jle short .8
        push byte 2
        lea eax, [byte ebp-02Ch]
        push byte 0
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-0CB8h]
        push eax
        xor ecx, ecx
        mov eax, 11h
.7:
        call RunMenu
        jmp short .6
.8:
        push byte 2
        push byte 0
        lea eax, [byte ebp-02Ch]
        push eax
        mov eax, dword [byte ebp-028h]
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-0CB8h]
        mov eax, dword [byte eax+066h]
        xor ecx, ecx
        add eax, byte 7
        jmp short .7
.9:
        cmp dword [byte ebp-02Ch], byte 1
        jb short .10
        jbe short .11
        cmp dword [byte ebp-02Ch], byte 3
        jb near .22
        mov eax, dword [byte ebp-0Ch]
        add eax, byte 7
        mov dword [byte ebp-038h], eax
        cmp dword [byte ebp-02Ch], byte 4
        jbe near .18
        cmp dword [byte ebp-02Ch], byte 6
        jbe near .21
        jmp near .22
.10:
        cmp dword [byte ebp-02Ch], byte 0
        jne near .22
        mov dword [byte ebp-018h], 1
        jmp near .31
.11:
        cmp dword [byte ebp-0Ch], byte 0
        je near .23
        cmp dword [byte ebp-0Ch], byte 1
        je near .25
        cmp dword [byte ebp-0Ch], byte 2
        jl near .31
        mov ecx, dword [byte ebp-0Ch]
        xor eax, eax
        imul edx, dword [byte ebp-01Ch], byte 21h
.12:
        movsx ebx, word [dword eax+SlotUserNames]
        cmp ebx, ecx
        jne short .13
        cmp eax, edx
        je short .13
        mov eax, 1
        jmp short .14
.13:
        add eax, byte 21h
        cmp eax, 84h
        jl short .12
        xor eax, eax
.14:
        test eax, eax
        je short .17
        lea eax, [byte ebp-078h]
        push eax
        call SetDrawTarget
        mov eax, 71h
        mov edx, TitleTextStyle
        mov ecx, dword [ViewScreenHeight]
        mov ebx, dword [ViewScreenWidth]
        add esp, byte 4
        sar ecx, 1
        sar ebx, 1
        call GetLangText
        call ShowMessage
        push dword [FrontEndScreenBmp]
        call TextSetFont
        add esp, byte 4
.15:
        call GetPressedDevice
        test eax, eax
        jne short .16
        call SoundIdle
        jmp short .15
.16:
        call SoundIdle
        call GetPressedDevice
        test eax, eax
        jne short .16
        call HideMessage
        jmp near .31
.17:
        mov eax, dword [byte ebp-0Ch]
        mov edx, dword [byte ebp-0Ch]
        mov word [dword esi+SlotUserNames], ax
        mov eax, dword [byte ebp-028h]
        mov ebx, dword [byte ebp-014h]
        call NameIndexId
        mov edx, eax
        mov eax, dword [byte ebp-028h]
        mov dword [byte ebp-018h], 1
        call GetUserName
        jmp near .31
.18:
        lea eax, [dword ebp-01B0h]
        mov edx, dword [byte ebp-030h]
        call ScrollBarUp
        push dword [byte ebp-0Ch]
        mov ecx, dword [dword ebp-018Ch]
        mov eax, dword [byte ebp-028h]
        mov ebx, dword [byte edi+02Ch]
        call DrawUserList
        lea eax, [dword ebp-01B0h]
        call DrawScrollBar
        mov eax, dword [byte ebp-038h]
        sub eax, dword [dword ebp-018Ch]
        mov dword [byte ebp-010h], eax
        cmp eax, byte 10h
        jle short .20
.19:
        mov byte [dword ebp-0B41h], 7
        mov byte [dword ebp-0A0Fh], 10h
        mov byte [dword ebp-0C10h], 10h
        mov byte [dword ebp-0C76h], 10h
        jmp near .31
.20:
        mov al, byte [byte ebp-010h]
        mov byte [dword ebp-0A0Fh], al
        mov byte [dword ebp-0C10h], al
        mov byte [dword ebp-0C76h], al
        mov byte [dword ebp-0B41h], al
        jmp near .31
.21:
        lea eax, [dword ebp-01B0h]
        mov edx, dword [byte ebp-030h]
        call ScrollBarDown
        push dword [byte ebp-0Ch]
        mov ecx, dword [dword ebp-018Ch]
        mov eax, dword [byte ebp-028h]
        mov ebx, dword [byte edi+02Ch]
        call DrawUserList
        lea eax, [dword ebp-01B0h]
        call DrawScrollBar
        mov eax, dword [byte ebp-038h]
        sub eax, dword [dword ebp-018Ch]
        mov dword [byte ebp-010h], eax
        cmp eax, byte 7
        jl short .19
        jmp short .20
.22:
        mov eax, dword [dword ebp-018Ch]
        add eax, dword [byte ebp-02Ch]
        sub eax, byte 7
        mov dword [byte ebp-0Ch], eax
        jne short .24
.23:
        mov eax, 62h
        mov word [dword esi+SlotUserNames], 0
        call GetLangText
        mov edx, eax
        mov eax, dword [byte ebp-014h]
        mov dword [byte ebp-018h], 1
        call strcpy_
        jmp near .29
.24:
        cmp eax, byte 1
        jne near .29
.25:
        mov eax, dword [byte ebp-028h]
        cmp dword [byte eax+066h], byte 1Bh
        jge short .26
        lea eax, [byte ebp-078h]
        push eax
        call SetDrawTarget
        add esp, byte 4
        lea eax, [byte ebp-028h]
        call NewUser
        test eax, eax
        sete al
        movzx eax, al
        push dword [FrontEndScreenBmp]
        mov dword [byte ebp-020h], eax
        mov dword [byte ebp-018h], eax
        call TextSetFont
        add esp, byte 4
        cmp dword [byte ebp-020h], byte 0
        je near .29
        mov eax, dword [byte ebp-028h]
        mov ax, word [byte eax+066h]
        dec eax
        movsx edx, ax
        mov word [dword esi+SlotUserNames], ax
        mov eax, dword [byte ebp-028h]
        mov ebx, dword [byte ebp-014h]
        call NameIndexId
        mov edx, eax
        mov eax, dword [byte ebp-028h]
        call GetUserName
        jmp short .29
.26:
        lea eax, [byte ebp-078h]
        push eax
        call SetDrawTarget
        mov eax, 70h
        mov edx, TitleTextStyle
        mov ecx, dword [ViewScreenHeight]
        mov ebx, dword [ViewScreenWidth]
        add esp, byte 4
        sar ecx, 1
        sar ebx, 1
        call GetLangText
        call ShowMessage
        push dword [FrontEndScreenBmp]
        call TextSetFont
        add esp, byte 4
.27:
        call GetPressedDevice
        test eax, eax
        jne short .28
        call SoundIdle
        jmp short .27
.28:
        call SoundIdle
        call GetPressedDevice
        test eax, eax
        jne short .28
        call HideMessage
.29:
        cmp dword [byte ebp-018h], byte 0
        jne short .30
        push dword [byte ebp-0Ch]
        mov ecx, dword [dword ebp-018Ch]
        mov edx, dword [byte ebp-030h]
        mov eax, dword [byte ebp-028h]
        mov ebx, dword [byte edi+02Ch]
        call DrawUserList
        mov al, byte [byte ebp-0Ch]
        add al, 7
        sub al, byte [dword ebp-018Ch]
        mov byte [dword ebp-0A0Fh], al
        mov byte [dword ebp-0B41h], al
        mov byte [dword ebp-0C10h], al
        mov byte [dword ebp-0C76h], al
        jmp short .31
.30:
        mov eax, 35h
        call PlaySfx
.31:
        cmp dword [byte ebp-018h], byte 0
        je near .5
        mov edx, dword [byte ebp-028h]
        mov eax, 1
        call NameIndexFree
        call SetScreenTarget
        push dword [byte edi+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        push edi
        call FreeBitmap
        add esp, byte 4
        lea eax, [byte ebp-078h]
        push eax
        call SetDrawTarget
        add esp, byte 4
        push dword [byte ebp-030h]
        call FreeBitmap
        add esp, byte 4
        lea eax, [dword ebp-01B0h]
        mov edx, 0FEh
        call FreeScrollBar
        mov eax, 0FDh
        call SetTextColors
        jmp near CompareUsersByRecord_ret
;-----------------------------------------------------------------------------
; UpdateUserRecords                            2B4B9  96 PC, medium confidence
; After a game: for every controller slot with a user, reads the user's
; record, adds the game (result, goals, power play, ...) and writes it back
;-----------------------------------------------------------------------------
UpdateUserRecords:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1B0h, 0
        sub ebp, 82h
        lea edi, [byte ebp+02Eh]
        mov esi, UserRatingScaleTwoToFour
        movsd
        movsd
        movsd
        lea edi, [byte ebp+022h]
        mov esi, UserRatingScaleOneToOneHalf
        movsd
        movsd
        movsd
        lea edi, [byte ebp+046h]
        mov esi, UserRatingScalePair
        mov ecx, 1
        movsd
        movsd
        lea eax, [byte ebp+052h]
        lea edi, [byte ebp+03Ah]
        mov esi, UserRatingScaleQuarterSteps
        mov dword [byte ebp+07Ah], 0
        mov dword [byte ebp+076h], 0
        movsd
        movsd
        movsd
        call LoadUserIndex
.1:
        mov eax, dword [byte ebp+076h]
        cmp word [dword eax+SlotUserNames], byte 0
        je near .26
        movsx edx, word [dword eax+SlotUserNames]
        mov eax, dword [byte ebp+052h]
        lea ebx, [byte ebp-012h]
        call NameIndexId
        mov edx, eax
        mov eax, dword [byte ebp+052h]
        call NameIndexPath
        test eax, eax
        je near .26
        lea edx, [byte ebp+04Eh]
        lea eax, [byte ebp-012h]
        call FileOpenReadWrite
        mov ecx, eax
        test eax, eax
        jne near .26
        mov ecx, 11Ch
        mov ebx, 0FFFFFFFFh
        lea edx, [dword ebp-012Eh]
        mov eax, dword [byte ebp+04Eh]
        call FileReadAt
        mov ecx, eax
        test eax, eax
        jne near .25
        mov esi, dword [optflags]
        shl esi, 19h
        mov dword [byte ebp+072h], eax
        shr esi, 1Dh
        xor ebx, ebx
        cmp esi, byte 3
        jne short .2
        xor esi, esi
.2:
        mov eax, dword [gameopts]
        add eax, dword [byte ebp+07Ah]
        cmp byte [byte eax+05h], 0
        je near .6
        movsx eax, word [hmscore]
        mov dword [byte ebp+07Eh], eax
        movsx eax, word [hmtmPwrPlays]
        mov dword [byte ebp+05Eh], eax
        movsx eax, word [hmtmPwrGoals]
        mov dword [byte ebp+06Eh], eax
        movsx eax, word [awtmPwrPlays]
        mov dword [byte ebp+06Ah], eax
        movsx eax, word [awtmPwrGoals]
        movsx ecx, word [awscore]
        mov dword [byte ebp+056h], eax
        xor eax, eax
        mov edx, dword [gameopts]
        mov dword [byte ebp+05Ah], eax
.3:
        cmp eax, dword [byte ebp+07Ah]
        je short .5
        mov edi, edx
        cmp byte [byte edi+eax+05h], 0
        jne short .5
        add edi, dword [byte ebp+05Ah]
        movsx edi, word [byte edi+09h]
        cmp edi, byte 1
        je short .5
.4:
        mov dword [byte ebp+072h], 1
        jmp near .9
.5:
        inc eax
        add dword [byte ebp+05Ah], byte 2
        cmp eax, byte 4
        jl short .3
        jmp short .9
.6:
        movsx eax, word [awscore]
        mov dword [byte ebp+07Eh], eax
        movsx eax, word [awtmPwrPlays]
        mov dword [byte ebp+05Eh], eax
        movsx eax, word [awtmPwrGoals]
        mov dword [byte ebp+06Eh], eax
        movsx eax, word [hmtmPwrPlays]
        mov dword [byte ebp+06Ah], eax
        movsx eax, word [hmtmPwrGoals]
        movsx ecx, word [hmscore]
        mov dword [byte ebp+056h], eax
        xor eax, eax
        mov edx, dword [gameopts]
        mov dword [byte ebp+062h], eax
.7:
        cmp eax, dword [byte ebp+07Ah]
        je short .8
        mov edi, edx
        cmp byte [byte edi+eax+05h], 0
        je short .8
        add edi, dword [byte ebp+062h]
        movsx edi, word [byte edi+09h]
        cmp edi, byte 1
        jne short .4
.8:
        inc eax
        add dword [byte ebp+062h], byte 2
        cmp eax, byte 4
        jl short .7
.9:
        lea eax, [esi+esi]
        cmp ecx, dword [byte ebp+07Eh]
        jge short .11
        inc word [dword eax+ebp-0126h]
        inc word [dword ebp-0102h]
        mov eax, dword [dword ebp-0102h]
        cmp ax, word [dword ebp-0100h]
        jle short .10
        mov word [dword ebp-0100h], ax
.10:
        add ebx, dword [byte ebp+esi*4+02Eh]
        jmp short .14
.11:
        jle short .12
        inc word [dword eax+ebp-0120h]
        jmp short .13
.12:
        inc word [dword eax+ebp-011Ah]
        add ebx, dword [byte ebp+esi*4+022h]
.13:
        mov word [dword ebp-0102h], 0
.14:
        lea eax, [esi+esi]
        mov edx, dword [byte ebp+07Eh]
        add word [dword eax+ebp-0114h], dx
        add word [dword eax+ebp-010Eh], cx
        mov edx, dword [byte ebp+05Eh]
        add word [byte ebp-01Eh], dx
        mov edx, dword [byte ebp+06Eh]
        add word [byte ebp-01Ch], dx
        mov edx, dword [byte ebp+06Ah]
        add word [byte ebp-01Ah], dx
        mov edx, dword [byte ebp+056h]
        add word [byte ebp-018h], dx
        test ecx, ecx
        jne short .15
        inc word [dword eax+ebp-0108h]
.15:
        mov eax, dword [byte ebp+07Eh]
        sub eax, ecx
        mov edx, 1000h
        shl eax, 10h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ebx, eax
        mov eax, dword [optflags]
        shl eax, 17h
        shr eax, 1Eh
        mov edx, dword [byte ebp+eax*4+03Ah]
        mov eax, ebx
        mov ebx, dword [byte ebp+072h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp+ebx*4+046h]
        mov edi, dword [byte ebp+07Ah]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, esi
        mov ebx, eax
        shl edx, 2
        mov eax, dword [gameopts]
        mov dword [byte ebp+066h], edx
        cmp byte [byte edi+eax+05h], 0
        je near .19
        cmp ecx, dword [byte ebp+07Eh]
        jge short .17
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        mov edx, ebx
        add dword [dword ebp+eax*4-0FEh], edx
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        add dword [dword ebp+eax*4-08Eh], edx
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
.16:
        shr eax, 1Bh
        shl eax, 2
        cmp dword [dword eax+ebp-08Eh], byte 0
        jle near .23
        mov dword [dword eax+ebp-08Eh], 0
        jmp near .23
.17:
        jle near .23
        mov eax, dword [byte eax+01h]
        mov ecx, dword [byte ebp+066h]
        shl eax, 0Fh
        mov edx, ebx
        shr eax, 1Bh
        add edx, dword [byte ecx+ebp+02Eh]
        sub dword [dword ebp+eax*4-0FEh], edx
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        shl eax, 2
        cmp dword [dword eax+ebp-0FEh], byte 0
        jge short .18
        mov dword [dword eax+ebp-0FEh], 0
.18:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        jmp near .22
.19:
        cmp ecx, dword [byte ebp+07Eh]
        jge short .20
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        mov edx, ebx
        add dword [dword ebp+eax*4-0FEh], edx
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        shr eax, 1Bh
        add dword [dword ebp+eax*4-08Eh], edx
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
        jmp near .16
.20:
        jle short .23
        mov eax, dword [byte eax+01h]
        mov ecx, dword [byte ebp+066h]
        shl eax, 0Ah
        mov edx, ebx
        shr eax, 1Bh
        add edx, dword [byte ecx+ebp+02Eh]
        sub dword [dword ebp+eax*4-0FEh], edx
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Ah
        shr eax, 1Bh
        shl eax, 2
        cmp dword [dword eax+ebp-0FEh], byte 0
        jge short .21
        mov dword [dword eax+ebp-0FEh], 0
.21:
        mov eax, dword [gameopts]
        mov eax, dword [byte eax+01h]
        shl eax, 0Fh
.22:
        mov edx, dword [byte ebp+esi*4+02Eh]
        shr eax, 1Bh
        add edx, ebx
        sub dword [dword ebp+eax*4-08Eh], edx
.23:
        add dword [dword ebp-012Eh], ebx
        cmp dword [dword ebp-012Eh], byte 0
        jge short .24
        mov dword [dword ebp-012Eh], 0
.24:
        add word [dword ebp-0128h], byte 2
        lea eax, [dword ebp-012Eh]
        mov ecx, 11Ch
        lea edx, [dword ebp-012Eh]
        call UserRecordRating
        xor ebx, ebx
        mov dword [byte ebp-016h], eax
        mov eax, dword [byte ebp+04Eh]
        call FileWriteAt
        mov ecx, eax
.25:
        lea eax, [byte ebp+04Eh]
        call FileClose
.26:
        inc dword [byte ebp+07Ah]
        add dword [byte ebp+076h], byte 21h
        cmp dword [byte ebp+07Ah], byte 4
        jl near .1
        mov edx, dword [byte ebp+052h]
        mov eax, 1
        call NameIndexFree
        mov eax, ecx
UpdateUserRecords_47F:
        lea esp, [dword ebp+082h]
        pop ebp
UpdateUserRecords_ret:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompareUsersByName                                              2B945  96 PC
; Qsort comparator of the user records screen: by name
;-----------------------------------------------------------------------------
CompareUsersByName:
        push ebx
        mov ebx, dword [UserRatingColumn]
        mov edx, dword [edx]
        mov eax, dword [eax]
        mov edx, dword [ebx+edx*4]
        mov eax, dword [ebx+eax*4]
        call strcmp_
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompareUsersByRating                         2B95D  96 PC, medium confidence
; Qsort comparator: by rating (urate), then name
;-----------------------------------------------------------------------------
CompareUsersByRating:
        push ebx
        push ecx
        push esi
        mov ebx, dword [UserShutoutColumn]
        mov ecx, dword [edx]
        mov esi, dword [eax]
        shl ecx, 2
        shl esi, 2
        lea edx, [ebx+ecx]
        lea eax, [ebx+esi]
        mov ebx, dword [edx]
        cmp ebx, dword [eax]
        je short .1
        mov edx, ebx
        sub edx, dword [eax]
        mov eax, edx
        pop esi
        pop ecx
        pop ebx
        ret
.1:
        mov ebx, dword [UserRatingColumn]
        mov edx, dword [ecx+ebx]
        mov eax, dword [esi+ebx]
        call strcmp_
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompareUsersByRecord                         2B99B  96 PC, medium confidence
; Qsort comparator: by points from the won / lost / tied record (upts) of the
; shown game type, then name
;-----------------------------------------------------------------------------
CompareUsersByRecord:
        push ebx
        push ecx
        push esi
        push edi
        enter 14h, 0
        mov esi, eax
        mov edi, edx
        imul edx, dword [UserRecordsTop], byte 3
        cmp dword [UserRecordsTop], byte 2
        jne short .1
        mov eax, dword [eax]
        shl eax, 3
        mov ecx, dword [UserLongStreakColumn]
        add eax, edx
        movsx ebx, word [ecx+eax*2]
        movsx eax, word [byte ecx+eax*2+02h]
        add ebx, ebx
        add eax, eax
        mov dword [byte ebp-08h], ebx
        add ebx, eax
        mov eax, dword [edi]
        shl eax, 3
        add edx, eax
        add edx, edx
        lea eax, [ecx+edx]
        movsx edx, word [eax]
        movsx eax, word [byte eax+02h]
        add edx, edx
        add eax, eax
        mov dword [byte ebp-04h], edx
        jmp short .2
.1:
        mov eax, dword [eax]
        shl eax, 3
        add eax, edx
        mov ebx, dword [UserLongStreakColumn]
        add eax, eax
        add eax, ebx
        mov dword [byte ebp-014h], ebx
        movsx ebx, word [eax]
        add ebx, ebx
        mov dword [byte ebp-08h], ebx
        movsx ebx, word [byte eax+04h]
        add dword [byte ebp-08h], ebx
        movsx eax, word [byte eax+02h]
        add ebx, dword [byte ebp-08h]
        add eax, eax
        add ebx, eax
        mov eax, dword [edi]
        shl eax, 3
        add eax, edx
        add eax, eax
        add eax, dword [byte ebp-014h]
        movsx edx, word [eax]
        add edx, edx
        mov dword [byte ebp-04h], edx
        movsx edx, word [byte eax+04h]
        add dword [byte ebp-04h], edx
        movsx eax, word [byte eax+02h]
        add edx, dword [byte ebp-04h]
        add eax, eax
.2:
        add edx, eax
        mov dword [byte ebp-010h], edx
        test ebx, ebx
        je short .3
        mov eax, dword [byte ebp-08h]
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov dword [byte ebp-0Ch], eax
        jmp short .4
.3:
        mov dword [byte ebp-0Ch], ebx
.4:
        cmp dword [byte ebp-010h], byte 0
        je short .5
        mov ebx, dword [byte ebp-010h]
        mov eax, dword [byte ebp-04h]
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        jmp short .6
.5:
        xor eax, eax
.6:
        cmp eax, dword [byte ebp-0Ch]
        je short .7
        sub eax, dword [byte ebp-0Ch]
        jmp short CompareUsersByRecord_ret
.7:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte ebp-08h]
        je short .8
        sub eax, dword [byte ebp-08h]
        jmp short CompareUsersByRecord_ret
.8:
        mov edx, dword [UserRatingColumn]
        mov eax, dword [edi]
        mov ebx, dword [edx+eax*4]
        mov eax, dword [esi]
CompareUsersByRecord_127:
        mov eax, dword [edx+eax*4]
        mov edx, ebx
CompareUsersByRecord_12C:
        call strcmp_
CompareUsersByRecord_ret:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompareUsersByGoalsFor                       2BAD2  96 PC, medium confidence
; Qsort comparator: by goals for (ugf), then name
;-----------------------------------------------------------------------------
CompareUsersByGoalsFor:
        push ebx
        push ecx
        push esi
        mov ecx, dword [UserGoalsForField]
        mov ebx, dword [edx]
        mov esi, dword [eax]
        add ebx, ebx
        add esi, esi
        add ebx, ecx
        add ecx, esi
        mov si, word [ebx]
        cmp si, word [ecx]
        je short .1
        movsx eax, si
        movsx edx, word [ecx]
        sub eax, edx
        pop esi
        pop ecx
        pop ebx
        ret
.1:
        mov ebx, dword [UserRatingColumn]
        mov edx, dword [edx]
        mov eax, dword [eax]
        mov edx, dword [ebx+edx*4]
        mov eax, dword [ebx+eax*4]
        call strcmp_
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompareUsersByGoalsAgainst                   2BB14  96 PC, medium confidence
; Qsort comparator: by goals against (uga, fewest first), then name
;-----------------------------------------------------------------------------
CompareUsersByGoalsAgainst:
        push ebx
        push ecx
        push esi
        mov ecx, dword [UserGoalsAgainstField]
        mov ebx, dword [edx]
        mov esi, dword [eax]
        add ebx, ebx
        add esi, esi
        add ebx, ecx
        add ecx, esi
        mov si, word [ebx]
        cmp si, word [ecx]
        je short .1
        movsx edx, si
        movsx eax, word [ecx]
        sub eax, edx
        pop esi
        pop ecx
        pop ebx
        ret
.1:
        mov ebx, dword [UserRatingColumn]
        mov edx, dword [edx]
        mov eax, dword [eax]
        mov edx, dword [ebx+edx*4]
        mov eax, dword [ebx+eax*4]
        call strcmp_
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompareUsersByPowerPlay                      2BB56  96 PC, medium confidence
; Qsort comparator: by power play % (upp: goals / chances), then name
;-----------------------------------------------------------------------------
CompareUsersByPowerPlay:
        push ebx
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov esi, eax
        mov edi, edx
        mov edx, dword [eax]
        mov eax, dword [UserPowerPlayField]
        movsx ebx, word [eax+edx*4]
        movsx eax, word [byte eax+edx*4+02h]
        mov dword [byte ebp-0Ch], eax
        test ebx, ebx
        je short .1
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov dword [byte ebp-08h], eax
        jmp short .2
.1:
        mov dword [byte ebp-08h], ebx
.2:
        mov edx, dword [UserPowerPlayField]
        mov eax, dword [edi]
        movsx ebx, word [edx+eax*4]
        movsx eax, word [byte edx+eax*4+02h]
        mov dword [byte ebp-04h], eax
        test ebx, ebx
        je short .3
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        jmp short .4
.3:
        xor eax, eax
.4:
        cmp eax, dword [byte ebp-08h]
        je short .5
        sub eax, dword [byte ebp-08h]
        jmp near CompareUsersByRecord_ret
.5:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte ebp-0Ch]
        je short .6
        sub eax, dword [byte ebp-0Ch]
        jmp near CompareUsersByRecord_ret
.6:
        mov ebx, dword [UserRatingColumn]
        mov eax, dword [edi]
        mov edx, dword [ebx+eax*4]
        mov eax, dword [esi]
        mov eax, dword [ebx+eax*4]
        jmp near CompareUsersByRecord_12C
;-----------------------------------------------------------------------------
; CompareUsersByPenaltyKill                    2BC05  96 PC, medium confidence
; Qsort comparator: by penalty kill % (upk), then name
;-----------------------------------------------------------------------------
CompareUsersByPenaltyKill:
        push ebx
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov edi, eax
        mov esi, edx
        mov edx, dword [eax]
        mov eax, dword [UserOpponentColumn]
        shl edx, 2
        add eax, edx
        movsx edx, word [eax]
        movsx eax, word [byte eax+02h]
        mov dword [byte ebp-04h], eax
        test edx, edx
        je short .1
        mov eax, edx
        mov ebx, edx
        sub eax, dword [byte ebp-04h]
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov dword [byte ebp-0Ch], eax
        jmp short .2
.1:
        mov dword [byte ebp-0Ch], edx
.2:
        mov eax, dword [esi]
        mov edx, dword [UserOpponentColumn]
        shl eax, 2
        add eax, edx
        movsx edx, word [eax]
        movsx eax, word [byte eax+02h]
        mov dword [byte ebp-08h], eax
        test edx, edx
        je short .3
        mov eax, edx
        mov ebx, edx
        sub eax, dword [byte ebp-08h]
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        jmp short .4
.3:
        xor eax, eax
.4:
        cmp eax, dword [byte ebp-0Ch]
        je short .5
        sub eax, dword [byte ebp-0Ch]
        jmp near CompareUsersByRecord_ret
.5:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte ebp-04h]
        je short .6
        mov eax, dword [byte ebp-04h]
        sub eax, dword [byte ebp-08h]
        jmp near CompareUsersByRecord_ret
.6:
        mov edx, dword [UserRatingColumn]
        mov eax, dword [esi]
        mov ebx, dword [edx+eax*4]
        mov eax, dword [edi]
        jmp near CompareUsersByRecord_127
;-----------------------------------------------------------------------------
; CompareUsersByTeam                           2BCC8  96 PC, medium confidence
; Qsort comparator: by favourite team (uteam)
;-----------------------------------------------------------------------------
CompareUsersByTeam:
        push ebx
        push ecx
        mov ebx, dword [UserTeamField]
CompareUsersByTeam_8:
        mov eax, dword [eax]
        movsx ecx, word [ebx+eax*2]
        mov eax, dword [edx]
        movsx eax, word [ebx+eax*2]
        sub ecx, eax
        mov eax, ecx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompareUsersByOpponent                       2BCE3  96 PC, medium confidence
; Qsort comparator: by favourite opponent (uopp)
;-----------------------------------------------------------------------------
CompareUsersByOpponent:
        push ebx
        push ecx
        mov ebx, dword [UserPowerPlayColumn]
        jmp short CompareUsersByTeam_8
;-----------------------------------------------------------------------------
; CompareUsersByShutouts                       2BCED  96 PC, medium confidence
; Qsort comparator: by shutouts (uso), then name
;-----------------------------------------------------------------------------
CompareUsersByShutouts:
        push ebx
        push ecx
        push esi
        mov ecx, dword [UserShutoutField]
        mov ebx, dword [edx]
        mov esi, dword [eax]
        add ebx, ebx
        add esi, esi
        add ebx, ecx
        add ecx, esi
        mov si, word [ebx]
        cmp si, word [ecx]
        je short .1
        movsx eax, si
        movsx edx, word [ecx]
        sub eax, edx
        pop esi
        pop ecx
        pop ebx
        ret
.1:
        mov ebx, dword [UserRatingColumn]
        mov edx, dword [edx]
        mov eax, dword [eax]
        mov edx, dword [ebx+edx*4]
        mov eax, dword [ebx+eax*4]
        call strcmp_
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CompareUsersByStreak                         2BD2F  96 PC, medium confidence
; Qsort comparator: by current streak (ustreak) or, on that column, longest
; streak (ulstreak), then name
;-----------------------------------------------------------------------------
CompareUsersByStreak:
        push ebx
        push ecx
        push esi
        cmp dword [UserRecordsTop], byte 6
        jne short .1
        mov ebx, dword [UserLongStreakField]
        mov ecx, dword [edx]
        mov esi, dword [eax]
        add ecx, ecx
        add esi, esi
        add ecx, ebx
        add ebx, esi
        mov si, word [ecx]
        cmp si, word [ebx]
        je short .2
        movsx eax, si
        movsx edx, word [ebx]
        sub eax, edx
        pop esi
        pop ecx
        pop ebx
        ret
.1:
        mov ecx, dword [UserStreakField]
        mov ebx, dword [edx]
        mov esi, dword [eax]
        add ebx, ebx
        add esi, esi
        add ebx, ecx
        add ecx, esi
        mov si, word [ebx]
        cmp si, word [ecx]
        je short .2
        movsx edx, si
        movsx eax, word [ecx]
        sub edx, eax
        mov eax, edx
        pop esi
        pop ecx
        pop ebx
        ret
.2:
        mov ebx, dword [UserRatingColumn]
        mov edx, dword [edx]
        mov eax, dword [eax]
        mov edx, dword [ebx+edx*4]
        mov eax, dword [ebx+eax*4]
        call strcmp_
        pop esi
        pop ecx
        pop ebx
        ret
jpt_2BDA2:
        dd DrawUserRecords_23B
        dd DrawUserRecords_267
        dd DrawUserRecords_27F
        dd DrawUserRecords_29B
        dd DrawUserRecords_2BD
        dd DrawUserRecords_2C4
        dd DrawUserRecords_2CB
        dd DrawUserRecords_2D2
        dd DrawUserRecords_2D9
        dd DrawUserRecords_2FC
        dd DrawUserRecords_395
        dd DrawUserRecords_3F0
;-----------------------------------------------------------------------------
; DrawUserRecords                              2BDD2  96 PC, medium confidence
; Draws the user records table (BKGD, column titles TXT%d) a page at a time:
; per column type a number, a record (w-l-t), a percentage (%3d.%1d), a team
; name
;-----------------------------------------------------------------------------
DrawUserRecords:
        push esi
        push edi
        enter 64h, 0
        push eax
        push edx
        push ebx
        push ecx
        mov edi, 0FFFFFFFEh
        test ebx, ebx
        jge short .1
        mov edi, 1
        jmp short .2
.1:
        jle short .2
        inc dword [UserRecordsRow]
        xor edi, edi
.2:
        push byte 0
        push dword 0D9h
        call TextSetColor
        add esp, byte 8
.3:
        push dword [byte ebp-068h]
        call SetDrawBitmap
        add esp, byte 4
        push str_BKGD2
        push dword [byte ebp-06Ch]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-028h], 14Dh
        push eax
        mov dword [byte ebp-024h], 19Eh
        xor esi, esi
        call PutBlockAtOwnPos
        add esp, byte 4
.4:
        mov ebx, dword [UserNameIndex]
        cmp dword [byte ebx+066h], byte 2
        jl short .5
        mov eax, dword [UserRecordsTop]
        mov ecx, 3
        cdq
        idiv ecx
        cmp edx, esi
        jne short .5
        mov eax, dword [UserRecordsTop]
        cdq
        idiv ecx
        cmp eax, dword [UserRecordsRow]
        jne short .5
        mov ecx, dword [byte ebp-024h]
        mov eax, dword [byte ebx+066h]
        mov edx, dword [byte ebp-028h]
        mov ebx, dword [str_J]
        push dword [nosplit eax*4+UserRecordsFirst]
        mov eax, dword [byte ebp-074h]
        call FillBox
.5:
        add dword [byte ebp-028h], byte 51h
        inc esi
        add dword [byte ebp-024h], byte 51h
        cmp esi, byte 3
        jl short .4
        push dword [UserRecordsRow]
        push str_TXTD
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-064h]
        push eax
        push dword [byte ebp-06Ch]
        call FindShape
        add esp, byte 8
        mov dword [byte ebp-010h], 0
        mov dword [byte ebp-02Ch], 0
        push eax
        mov dword [byte ebp-030h], 0
        mov dword [byte ebp-014h], 0
        call PutBlockAtOwnPos
        add esp, byte 4
        jmp near DrawUserRecords_3F0.26
.6:
        cmp dword [byte ebp-010h], byte 19h
        jge near DrawUserRecords_3F0.25
        mov eax, dword [UserNameField]
        add dword [byte ebp-030h], byte 4
        add eax, dword [byte ebp-014h]
        mov esi, dword [byte ebp-030h]
        mov eax, dword [eax]
        mov esi, dword [dword esi+UserRecordsRow]
        mov dword [byte ebp-08h], eax
        mov eax, dword [byte ebp-030h]
        inc dword [byte ebp-010h]
        inc esi
        mov eax, dword [dword eax+str_J]
        mov dword [byte ebp-018h], 175h
        sub eax, esi
        mov edx, dword [byte ebp-08h]
        inc eax
        cmp edx, dword [UserRecordsFirst]
        jne short .7
        add eax, esi
        mov ecx, 240h
        dec eax
        mov edx, 3Ch
        push eax
        mov ebx, esi
        mov eax, dword [byte ebp-074h]
        call FillBox
.7:
        mov eax, dword [byte ebp-02Ch]
        inc eax
        push eax
        push str_D4
        lea eax, [byte ebp-064h]
        push eax
        mov edx, 3Ch
        add esi, byte 4
        call sprintf_
        add esp, byte 0Ch
        mov ebx, esi
        lea eax, [byte ebp-064h]
        call DrawText
        mov eax, dword [byte ebp-08h]
        mov edx, dword [UserRatingColumn]
        push dword [edx+eax*4]
        push str_dbgS
        lea eax, [byte ebp-064h]
        push eax
        mov ebx, esi
        call sprintf_
        add esp, byte 0Ch
        mov edx, 50h
        lea eax, [byte ebp-064h]
        call DrawText
        mov eax, dword [byte ebp-08h]
        mov edx, dword [UserTeamField]
        add eax, eax
        add eax, edx
        cmp word [eax], byte 0
        jl short .8
        movsx eax, word [eax]
        push dword [nosplit eax*4+LogoNames]
        push str_dbgS
        lea eax, [byte ebp-064h]
        push eax
        mov edx, 10Eh
        call sprintf_
        add esp, byte 0Ch
        mov ebx, esi
        lea eax, [byte ebp-064h]
        call DrawTextCentred
.8:
        mov eax, dword [byte ebp-08h]
        shl eax, 4
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [byte ebp-08h]
        add eax, eax
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-08h]
        shl eax, 2
        mov dword [byte ebp-0Ch], 0
        mov dword [byte ebp-020h], eax
.9:
        imul eax, dword [UserRecordsRow], byte 3
        add eax, dword [byte ebp-0Ch]
        cmp eax, byte 0Bh
        ja near DrawUserRecords_3F0.23
        jmp dword [nosplit cs:eax*4+jpt_2BDA2]
DrawUserRecords_23B:
        mov eax, dword [UserLongStreakColumn]
        add eax, dword [byte ebp-01Ch]
        movsx edx, word [byte eax+04h]
        push edx
        movsx edx, word [byte eax+02h]
        push edx
        movsx eax, word [eax]
.10:
        push eax
        push str_3d3d3d
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 14h
        jmp near DrawUserRecords_3F0.24
DrawUserRecords_267:
        mov eax, dword [UserLongStreakColumn]
        add eax, dword [byte ebp-01Ch]
        movsx edx, word [byte eax+0Ah]
        push edx
        movsx edx, word [byte eax+08h]
        push edx
        movsx eax, word [byte eax+06h]
        jmp short DrawUserRecords_23B.10
DrawUserRecords_27F:
        mov eax, dword [UserLongStreakColumn]
        add eax, dword [byte ebp-01Ch]
        movsx edx, word [byte eax+0Eh]
        push edx
        movsx eax, word [byte eax+0Ch]
        push eax
        push str_3d3d
        jmp near DrawUserRecords_2FC.19
DrawUserRecords_29B:
        mov eax, dword [UserGoalsForField]
.11:
        add eax, dword [byte ebp-04h]
        movsx eax, word [eax]
.12:
        push eax
        push str_D4
.13:
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp near DrawUserRecords_3F0.24
DrawUserRecords_2BD:
        mov eax, dword [UserGoalsAgainstField]
        jmp short DrawUserRecords_29B.11
DrawUserRecords_2C4:
        mov eax, dword [UserShutoutField]
        jmp short DrawUserRecords_29B.11
DrawUserRecords_2CB:
        mov eax, dword [UserLongStreakField]
        jmp short DrawUserRecords_29B.11
DrawUserRecords_2D2:
        mov eax, dword [UserStreakField]
        jmp short DrawUserRecords_29B.11
DrawUserRecords_2D9:
        mov eax, dword [UserPowerPlayColumn]
        add eax, dword [byte ebp-04h]
        cmp word [eax], byte 0
        jl near DrawUserRecords_3F0.23
        movsx eax, word [eax]
        push dword [nosplit eax*4+LogoNames]
        push str_dbgS
        jmp short DrawUserRecords_29B.13
DrawUserRecords_2FC:
        mov eax, dword [UserPowerPlayField]
        add eax, dword [byte ebp-020h]
        cmp word [eax], byte 0
        jne short .14
        xor ebx, ebx
        jmp short .15
.14:
        movsx ebx, word [eax]
        movsx eax, word [byte eax+02h]
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov ebx, eax
.15:
        cmp ebx, 10000h
        jl short .18
.16:
        push str_1000
.17:
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
        jmp near DrawUserRecords_3F0.24
.18:
        mov edx, 3E80000h
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        lea ebx, [dword eax+01999h]
        sar ebx, 10h
        mov eax, ebx
        mov ecx, 0Ah
        cdq
        idiv ecx
        mov eax, ebx
        push edx
        cdq
        idiv ecx
        push eax
        push str_fmtTenths
.19:
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 10h
        jmp near DrawUserRecords_3F0.24
DrawUserRecords_395:
        mov eax, dword [UserOpponentColumn]
        add eax, dword [byte ebp-020h]
        cmp word [eax], byte 0
        jne short .20
        xor ebx, ebx
        jmp short .21
.20:
        movsx edx, word [eax]
        movsx eax, word [byte eax+02h]
        mov ebx, edx
        sub edx, eax
        mov eax, edx
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov ebx, eax
.21:
        test ebx, ebx
        jg short .22
        push str_00
        jmp near DrawUserRecords_2FC.17
.22:
        cmp ebx, 10000h
        je near DrawUserRecords_2FC.16
        jmp near DrawUserRecords_2FC.18
DrawUserRecords_3F0:
        mov eax, dword [UserShutoutColumn]
        add eax, dword [byte ebp-020h]
        mov eax, dword [eax]
        sar eax, 10h
        jmp near DrawUserRecords_29B.12
.23:
        mov al, byte [UserNameBuf]
        mov byte [byte ebp-064h], al
.24:
        mov edx, dword [byte ebp-018h]
        lea eax, [byte ebp-064h]
        mov ebx, esi
        inc dword [byte ebp-0Ch]
        call DrawTextCentred
        add dword [byte ebp-018h], byte 51h
        cmp dword [byte ebp-0Ch], byte 3
        jl near DrawUserRecords.9
.25:
        add dword [byte ebp-014h], byte 4
        inc dword [byte ebp-02Ch]
.26:
        mov eax, dword [UserNameIndex]
        mov eax, dword [byte eax+066h]
        dec eax
        dec eax
        cmp eax, dword [byte ebp-02Ch]
        jg near DrawUserRecords.6
        push dword [SideBarArt+1Ah]
        push dword [SideBarArt+16h]
        push dword [SideBarArt+0Ah]
        call PutBlock
        add esp, byte 0Ch
        test edi, edi
        jne short .27
        push str_FL00
        push dword [byte ebp-06Ch]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [byte ebp-074h]
        call SetRemapTable
        add esp, byte 4
        push dword 1AFh
        push dword 0EEh
        push dword 1AFh
        push dword 13Bh
        push byte 3Ah
        push dword 13Bh
        push dword 90h
        push dword 0EEh
        jmp short .28
.27:
        cmp edi, byte 1
        jne short .29
        push str_FL01
        push dword [byte ebp-06Ch]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [byte ebp-074h]
        call SetRemapTable
        add esp, byte 4
        push dword 1AFh
        push dword 0A7h
        push dword 1AFh
        push dword 0F5h
        push byte 4Bh
        push dword 0F5h
        push byte 62h
        push dword 0A7h
.28:
        push byte 4
        call RemapPolygonArgs
        add esp, byte 24h
.29:
        call SetScreenTarget
        mov eax, dword [byte ebp-068h]
        push dword [byte eax+02Ch]
        call PutBlockAtOwnPos
        add esp, byte 4
        cmp dword [byte ebp-070h], byte 0
        jge short .31
        dec edi
        cmp edi, byte 0FFFFFFFFh
        jne short .30
        dec dword [UserRecordsRow]
.30:
        push byte 7
        jmp short .32
.31:
        jle short .33
        push byte 7
        inc edi
.32:
        call WaitTicks
        add esp, byte 4
.33:
        cmp edi, byte 0FFFFFFFEh
        jle short .34
        cmp edi, byte 3
        jl near DrawUserRecords.3
.34:
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; LoadUserRecords                              2C31A  96 PC, medium confidence
; Reads every user's record file into the tables of the user records screen
;-----------------------------------------------------------------------------
LoadUserRecords:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 70h, 0
        mov dword [byte ebp-018h], 0
        mov dword [byte ebp-08h], 2
        mov dword [byte ebp-030h], 20h
        mov dword [byte ebp-04h], 8
        mov edi, 4
        xor esi, esi
        jmp near .11
.1:
        call NameIndexId
        lea ebx, [byte ebp-070h]
        mov ecx, dword [UserNameIndex]
        mov edx, eax
        mov eax, ecx
        call NameIndexPath
        test eax, eax
        je near .10
        lea edx, [byte ebp-03Ch]
        lea eax, [byte ebp-070h]
        call FileOpenRead
        mov dword [byte ebp-018h], eax
        test eax, eax
        jne near .10
        mov eax, dword [byte ebp-08h]
        mov ecx, 11Ch
        mov ebx, 0FFFFFFFFh
        mov edx, dword [UserRecordList]
        dec eax
        dec eax
        add edx, esi
        mov dword [byte ebp-034h], eax
        mov eax, dword [byte ebp-03Ch]
        call FileReadAt
        mov dword [byte ebp-018h], eax
        test eax, eax
        jne near .9
        imul ecx, dword [byte ebp-034h], byte 28h
        mov edx, dword [byte ebp-08h]
        mov eax, dword [UserNameIndex]
        mov ebx, dword [UserStreakColumn]
        call NameIndexId
        mov edx, dword [UserNameIndex]
        mov dword [byte ebp-038h], edx
        mov edx, eax
        mov eax, dword [byte ebp-038h]
        add ebx, ecx
        call GetUserName
        mov eax, dword [UserStreakColumn]
        add ecx, eax
        mov eax, dword [UserRatingColumn]
        add eax, dword [byte ebp-04h]
        mov dword [byte eax-08h], ecx
        mov eax, dword [UserShutoutColumn]
        add eax, dword [byte ebp-04h]
        mov dword [byte eax-08h], 0
        mov eax, dword [UserRecordList]
        add eax, esi
        cmp dword [byte eax+04h], byte 0
        je short .2
        mov ebx, dword [byte eax+04h]
        mov eax, dword [eax]
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edx, 640000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [UserShutoutColumn]
        add eax, dword [byte ebp-04h]
        mov dword [byte eax-08h], edx
.2:
        mov dword [byte ebp-0Ch], 0
        mov edx, dword [byte ebp-030h]
        mov dword [byte ebp-01Ch], esi
        xor eax, eax
.3:
        mov ebx, dword [UserRecordList]
        mov ecx, dword [UserLongStreakColumn]
        add ebx, dword [byte ebp-01Ch]
        add ecx, edx
        mov bx, word [byte ebx+eax+08h]
        mov word [byte ecx-020h], bx
        mov ebx, dword [UserRecordList]
        mov ecx, dword [UserLongStreakColumn]
        add ebx, dword [byte ebp-01Ch]
        add ecx, edx
        mov bx, word [byte ebx+eax+0Eh]
        mov word [byte ecx-01Eh], bx
        cmp dword [byte ebp-0Ch], byte 2
        jge short .4
        mov ebx, dword [UserRecordList]
        mov ecx, dword [UserLongStreakColumn]
        add ebx, dword [byte ebp-01Ch]
        add ecx, edx
        mov bx, word [byte ebx+eax+014h]
        mov word [byte ecx-01Ch], bx
.4:
        inc dword [byte ebp-0Ch]
        add edx, byte 6
        inc eax
        inc eax
        cmp dword [byte ebp-0Ch], byte 3
        jl short .3
        mov eax, dword [UserRecordList]
        mov dx, word [byte esi+eax+01Ah]
        add dx, word [byte esi+eax+01Ch]
        add dx, word [byte esi+eax+01Eh]
        mov eax, dword [UserGoalsForField]
        mov word [byte edi+eax-04h], dx
        mov eax, dword [UserRecordList]
        mov dx, word [byte esi+eax+020h]
        add dx, word [byte esi+eax+022h]
        add dx, word [byte esi+eax+024h]
        mov eax, dword [UserGoalsAgainstField]
        mov word [byte edi+eax-04h], dx
        mov eax, dword [UserPowerPlayField]
        mov edx, dword [UserRecordList]
        add eax, dword [byte ebp-04h]
        mov dx, word [dword edx+esi+0110h]
        mov word [byte eax-08h], dx
        mov eax, dword [UserPowerPlayField]
        mov edx, dword [UserRecordList]
        add eax, dword [byte ebp-04h]
        mov dx, word [dword edx+esi+0112h]
        mov word [byte eax-06h], dx
        mov edx, dword [UserOpponentColumn]
        mov eax, dword [UserRecordList]
        add edx, dword [byte ebp-04h]
        mov ax, word [dword esi+eax+0114h]
        mov word [byte edx-08h], ax
        mov eax, dword [UserOpponentColumn]
        mov edx, dword [UserRecordList]
        add eax, dword [byte ebp-04h]
        mov dx, word [dword edx+esi+0116h]
        mov word [byte eax-06h], dx
        mov eax, dword [UserRecordList]
        mov dx, word [byte esi+eax+026h]
        add dx, word [byte esi+eax+028h]
        add dx, word [byte esi+eax+02Ah]
        mov eax, dword [UserShutoutField]
        mov word [byte edi+eax-04h], dx
        mov edx, dword [UserRecordList]
        mov eax, dword [UserLongStreakField]
        mov dx, word [byte edx+esi+02Ch]
        mov dword [byte ebp-024h], 0
        mov word [byte edi+eax-04h], dx
        mov dword [byte ebp-028h], esi
        mov eax, dword [UserRecordList]
        xor ebx, ebx
        mov edx, dword [UserStreakField]
        mov ax, word [byte esi+eax+02Eh]
        mov dword [byte ebp-010h], ebx
        mov word [byte edx+edi-04h], ax
        mov edx, 0FFFFFFFFh
.5:
        mov eax, dword [UserRecordList]
        add eax, dword [byte ebp-028h]
        add eax, dword [byte ebp-010h]
        mov ecx, dword [byte eax+030h]
        cmp ecx, dword [byte ebp-024h]
        jle short .6
        mov dword [byte ebp-024h], ecx
        mov edx, ebx
.6:
        inc ebx
        add dword [byte ebp-010h], byte 4
        cmp ebx, byte 1Ch
        jl short .5
        mov dword [byte ebp-020h], 0
        mov eax, dword [UserTeamField]
        xor ebx, ebx
        mov dword [byte ebp-02Ch], esi
        mov dword [byte ebp-014h], ebx
        mov word [byte edi+eax-04h], dx
        mov edx, 0FFFFFFFFh
.7:
        mov eax, dword [UserRecordList]
        add eax, dword [byte ebp-02Ch]
        add eax, dword [byte ebp-014h]
        mov ecx, dword [dword eax+0A0h]
        cmp ecx, dword [byte ebp-020h]
        jge short .8
        mov dword [byte ebp-020h], ecx
        mov edx, ebx
.8:
        inc ebx
        add dword [byte ebp-014h], byte 4
        cmp ebx, byte 1Ch
        jl short .7
        mov eax, dword [UserPowerPlayColumn]
        mov word [byte edi+eax-04h], dx
.9:
        lea eax, [byte ebp-03Ch]
        call FileClose
.10:
        add dword [byte ebp-030h], byte 10h
        add dword [byte ebp-04h], byte 4
        inc dword [byte ebp-08h]
        add esi, 11Ch
        inc edi
        inc edi
.11:
        mov eax, dword [UserNameIndex]
        mov edx, dword [byte ebp-08h]
        cmp edx, dword [byte eax+066h]
        jge near NewUser_159
        cmp dword [byte ebp-018h], byte 0
        je near .1
        jmp near NewUser_159
;-----------------------------------------------------------------------------
; ExportUserRecords                            2C65C  96 PC, medium confidence
; Asks for a file name (EditText) and writes the user records table to it as
; text (fprintf)
;-----------------------------------------------------------------------------
ExportUserRecords:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 64h, 0
        mov al, byte [UserNameBuf]
        mov byte [byte ebp-014h], al
        lea eax, [byte ebp-014h]
        push eax
        push dword 0F0h
        mov ecx, 9
        push dword 140h
        mov eax, 0D3h
        mov ebx, TitleTextStyle
        call GetLangText
        mov edx, eax
        xor eax, eax
        call EditText
        test eax, eax
        je near NewUser_159
        lea eax, [byte ebp-014h]
        call strlen_
        test eax, eax
        je near NewUser_159
        lea eax, [byte ebp-014h]
        call CheckExportName
        test eax, eax
        jne near NewUser_159
        mov edx, str_wt
        lea eax, [byte ebp-014h]
        call fopen_
        mov edx, eax
        mov esi, eax
        test eax, eax
        jne short .3
        mov eax, 6Ch
        mov edx, TitleTextStyle
        mov ecx, dword [ViewScreenHeight]
        mov ebx, dword [ViewScreenWidth]
        sar ecx, 1
        sar ebx, 1
        call GetLangText
        call ShowMessage
.1:
        call GetPressedDevice
        test eax, eax
        jne short .2
        call SoundIdle
        jmp short .1
.2:
        call SoundIdle
        call GetPressedDevice
        test eax, eax
        jne short .2
        call HideMessage
        jmp near NewUser_159
.3:
        mov eax, 63h
        call GetLangText
        push eax
        push edx
        call fprintf_
        add esp, byte 8
        mov eax, 64h
        call GetLangText
        push eax
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
        lea eax, [byte ebp-064h]
        push eax
        push edx
        call fprintf_
        add esp, byte 8
        mov eax, 65h
        call GetLangText
        push eax
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
        lea eax, [byte ebp-064h]
        push eax
        push edx
        call fprintf_
        add esp, byte 8
        mov eax, 66h
        call GetLangText
        push eax
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
        lea eax, [byte ebp-064h]
        push eax
        push edx
        call fprintf_
        add esp, byte 8
        mov eax, 67h
        call GetLangText
        push eax
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
        lea eax, [byte ebp-064h]
        push eax
        push edx
        call fprintf_
        add esp, byte 8
        push str_Punct_ExportUserRecords
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
        lea eax, [byte ebp-064h]
        push eax
        push edx
        call fprintf_
        add esp, byte 8
        push str_ExportDashes
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
        lea eax, [byte ebp-064h]
        push eax
        push edx
        mov dword [byte ebp-08h], 0
        mov dword [byte ebp-04h], 0
        jmp near .18
.4:
        mov edi, dword [UserNameField]
        add edi, dword [byte ebp-04h]
        mov edi, dword [edi]
        mov edx, dword [UserRatingColumn]
        mov eax, edi
        push dword [edx+eax*4]
        push str_20s
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-064h]
        push eax
        push esi
        lea edx, [edi+edi]
        call fprintf_
        mov eax, dword [UserTeamField]
        add eax, edx
        add esp, byte 8
        cmp word [eax], byte 0
        jl short .5
        movsx eax, word [eax]
        push dword [nosplit eax*4+LogoNames]
        push str_sp3s
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp short .6
.5:
        push str_ExportSpacesWide
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
.6:
        lea eax, [byte ebp-064h]
        push eax
        push esi
        call fprintf_
        mov eax, edi
        mov edx, dword [UserLongStreakColumn]
        shl eax, 4
        add eax, edx
        add esp, byte 8
        movsx edx, word [byte eax+0Eh]
        push edx
        movsx edx, word [byte eax+0Ch]
        push edx
        movsx edx, word [byte eax+0Ah]
        push edx
        movsx edx, word [byte eax+08h]
        push edx
        movsx edx, word [byte eax+06h]
        push edx
        movsx edx, word [byte eax+04h]
        push edx
        movsx edx, word [byte eax+02h]
        push edx
        movsx eax, word [eax]
        push eax
        push str_sp3d3d3d3d3d3d3d3d
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 28h
        lea eax, [byte ebp-064h]
        push eax
        push esi
        lea edx, [edi+edi]
        call fprintf_
        mov eax, dword [UserStreakField]
        add esp, byte 8
        movsx eax, word [edx+eax]
        push eax
        mov eax, dword [UserLongStreakField]
        movsx eax, word [edx+eax]
        push eax
        mov eax, dword [UserShutoutField]
        movsx eax, word [edx+eax]
        push eax
        mov eax, dword [UserGoalsAgainstField]
        movsx eax, word [edx+eax]
        push eax
        mov eax, dword [UserGoalsForField]
        movsx eax, word [edx+eax]
        push eax
        push str_sp3d3d2d2d2d
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 1Ch
        lea eax, [byte ebp-064h]
        push eax
        push esi
        call fprintf_
        mov eax, dword [UserPowerPlayColumn]
        add eax, edx
        add esp, byte 8
        cmp word [eax], byte 0
        jl short .7
        movsx eax, word [eax]
        push dword [nosplit eax*4+LogoNames]
        push str_sp3s2
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        jmp short .8
.7:
        push str_ExportSpaces
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
.8:
        lea eax, [byte ebp-064h]
        push eax
        push esi
        call fprintf_
        mov eax, edi
        mov edx, dword [UserPowerPlayField]
        shl eax, 2
        add eax, edx
        add esp, byte 8
        cmp word [eax], byte 0
        jne short .10
        push str_sp00
.9:
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
        jmp short .12
.10:
        movsx ebx, word [eax]
        movsx eax, word [byte eax+02h]
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        cmp eax, 10000h
        jl short .11
        push str_sp1000
        jmp short .9
.11:
        mov edx, 3E80000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        lea ebx, [dword eax+01999h]
        sar ebx, 10h
        mov eax, ebx
        mov ecx, 0Ah
        cdq
        idiv ecx
        mov eax, ebx
        push edx
        cdq
        idiv ecx
        push eax
        push str_sp3d1d
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 10h
.12:
        lea eax, [byte ebp-064h]
        push eax
        mov edx, edi
        push esi
        shl edx, 2
        call fprintf_
        mov eax, dword [UserOpponentColumn]
        add eax, edx
        add esp, byte 8
        cmp word [eax], byte 0
        jne short .15
.13:
        push str_sp002
.14:
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 8
        jmp near .17
.15:
        movsx edx, word [eax]
        movsx eax, word [byte eax+02h]
        mov ebx, edx
        sub edx, eax
        mov eax, edx
        shl ebx, 10h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        test eax, eax
        jle short .13
        cmp eax, 10000h
        jne short .16
        push str_sp10002
        jmp short .14
.16:
        mov edx, 3E80000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        lea ebx, [dword eax+01999h]
        sar ebx, 10h
        mov eax, ebx
        mov ecx, 0Ah
        cdq
        idiv ecx
        mov eax, ebx
        push edx
        cdq
        idiv ecx
        push eax
        push str_sp3d1d2
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 10h
.17:
        lea eax, [byte ebp-064h]
        push eax
        push esi
        call fprintf_
        mov edx, dword [UserShutoutColumn]
        mov eax, edi
        mov eax, dword [edx+eax*4]
        add esp, byte 8
        sar eax, 10h
        push eax
        push str_spD
        lea eax, [byte ebp-064h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-064h]
        push eax
        push esi
        add dword [byte ebp-04h], byte 4
        inc dword [byte ebp-08h]
.18:
        call fprintf_
        add esp, byte 8
        mov eax, dword [UserNameIndex]
        mov eax, dword [byte eax+066h]
        dec eax
        dec eax
        cmp eax, dword [byte ebp-08h]
        jg near .4
        mov eax, esi
        call fclose_
        jmp near NewUser_159
jpt_2CB19:
        dd UserRecordsScreen_A1A
        dd UserRecordsScreen_A2B
        dd UserRecordsScreen_B4F
        dd UserRecordsScreen_B73
        dd UserRecordsScreen_B93
jpt_2CB2D:
        dd UserRecordsScreen_A7B
        dd UserRecordsScreen_A84
        dd UserRecordsScreen_A8D
        dd UserRecordsScreen_A8D
        dd UserRecordsScreen_A8D
        dd UserRecordsScreen_A96
        dd UserRecordsScreen_A9F
        dd UserRecordsScreen_AA8
        dd UserRecordsScreen_AB1
        dd UserRecordsScreen_AB1
        dd UserRecordsScreen_ABA
        dd UserRecordsScreen_AC3
        dd UserRecordsScreen_ACC
        dd UserRecordsScreen_AD5
jpt_2CB65:
        dd UserRecordsScreen_C6C
        dd UserRecordsScreen_C75
        dd UserRecordsScreen_C7E
        dd UserRecordsScreen_C7E
        dd UserRecordsScreen_C7E
        dd UserRecordsScreen_C87
        dd UserRecordsScreen_C90
        dd UserRecordsScreen_C99
        dd UserRecordsScreen_CA2
        dd UserRecordsScreen_CA2
        dd UserRecordsScreen_CAB
        dd UserRecordsScreen_CB4
        dd UserRecordsScreen_CBD
        dd UserRecordsScreen_CC6
;-----------------------------------------------------------------------------
; UserRecordsScreen                            2CB9D  96 PC, medium confidence
; The user records screen: allocates the column tables (uname, urate, upts,
; ugf, uga, upp, upk, uso, ustreak, ulstreak, uteam, uopp, usort),
; LoadUserRecords, sorts by the picked column (qsort), DrawUserRecords,
; export
;-----------------------------------------------------------------------------
UserRecordsScreen:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 198h, 0
        sub ebp, 82h
        mov ecx, 10h
        lea edi, [byte ebp-056h]
        mov esi, UserRecordsLeftButton
        rep movsd
        mov ecx, 10h
        lea edi, [dword ebp-096h]
        mov esi, UserRecordsRightButton
        rep movsd
        mov ecx, 20h
        lea edi, [dword ebp-0116h]
        mov esi, str_3_UserRecordsScreen
        mov eax, UserNameIndex
        rep movsd
        call LoadUserIndex
        mov eax, dword [UserNameIndex]
        mov edx, dword [byte eax+066h]
        dec edx
        dec edx
        mov dword [byte ebp+02Eh], 0FFFFFFFFh
        test edx, edx
        jg short .1
        mov edx, eax
        mov eax, 1
        call NameIndexFree
        xor edx, edx
        jmp near UserRecordsScreen_CC6.43
.1:
        push byte 20h
        push byte 64h
        push str_Uname
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 64h
        push str_Urate
        mov dword [UserRatingColumn], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push dword 190h
        push str_Upts
        mov dword [UserShutoutColumn], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 32h
        push str_Ugf
        mov dword [UserLongStreakColumn], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 32h
        push str_Uga
        mov dword [UserGoalsForField], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 64h
        push str_Upp
        mov dword [UserGoalsAgainstField], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 64h
        push str_Upk
        mov dword [UserPowerPlayField], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 32h
        push str_Uso
        mov dword [UserOpponentColumn], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 32h
        push str_Ustreak
        mov dword [UserShutoutField], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 32h
        push str_Ulstreak
        mov dword [UserLongStreakField], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 32h
        push str_Uteam
        mov dword [UserStreakField], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 32h
        push str_Uopp
        mov dword [UserTeamField], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push byte 64h
        push str_Usort
        mov dword [UserPowerPlayColumn], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push dword 3E8h
        push str_Logname
        mov dword [UserNameField], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 20h
        push dword 1BBCh
        push str_Logbook
        mov dword [UserStreakColumn], eax
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [UserRecordList], eax
        call LoadUserRecords
        xor edx, edx
        xor eax, eax
.2:
        mov ebx, dword [UserNameField]
        mov dword [edx+ebx], eax
        inc eax
        add edx, byte 4
        cmp eax, byte 19h
        jl short .2
        mov eax, dword [UserNameIndex]
        mov ecx, CompareUsersByRecord
        mov ebx, 4
        mov edx, dword [byte eax+066h]
        mov eax, dword [UserNameField]
        dec edx
        dec edx
        call qsort_
        mov eax, dword [UserNameField]
        mov dword [UserRecordsTop], 0
        mov dword [UserRecordsRow], 0
        mov eax, dword [eax]
        mov dword [UserRecordsFirst], eax
        lea eax, [byte ebp-016h]
        push eax
        call SaveTextState
        add esp, byte 4
        push dword [FrontEndScreenBmp]
        call TextSetFont
        add esp, byte 4
        mov eax, 133h
        xor edx, edx
        call LoadPackedFile
        push str_Pal5
        push eax
        mov dword [byte ebp+042h], eax
        mov dword [byte ebp+03Ah], eax
        call FindShape
        add eax, byte 10h
        add esp, byte 8
        mov dword [byte ebp+036h], eax
        call SetScreenColors
        push byte 20h
        push dword 100h
        push str_Shadtbl
        call AllocMemBlock
        add esp, byte 0Ch
        push eax
        push dword [byte ebp+036h]
        push dword 0E666h
        mov dword [byte ebp+03Eh], eax
        call TintRect
        add esp, byte 0Ch
        call SetScreenTarget
        push str_BKGD2
        push dword [byte ebp+042h]
        call FindShape
        add esp, byte 8
        push eax
        call PutBlockAtOwnPos
        add esp, byte 4
        push byte 0
        push dword 1E0h
        push dword 280h
        call CreateBitmap
        mov edx, UserPopupRecords+56h
        add esp, byte 0Ch
        mov dword [byte ebp+032h], eax
        mov eax, 87h
        call InitMenuItems
        mov eax, 4
        call OpenScreen
        mov ecx, 66h
        mov edi, UserPopupRecords+56h
        mov esi, TeamStatsBitmap
        rep movsb
        push str_BT002
        mov eax, dword [UserPopupRecords+7Ch]
        push dword [byte ebp+042h]
        add eax, byte 21h
        mov byte [UserPopupRecords+9Ah], 3
        mov dword [UserPopupRecords+90h], eax
        mov eax, dword [UserPopupRecords+80h]
        mov byte [UserPopupRecords+9Bh], 1
        add eax, byte 15h
        mov byte [UserPopupRecords+98h], 3
        mov dword [UserPopupRecords+94h], eax
        lea eax, [byte ebp-056h]
        mov dword [UserPopupRecords+0CCh], 4
        mov dword [UserPopupRecords+0D0h], eax
        call FindShape
        add esp, byte 8
        push str_BT012
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+0D6h], eax
        call FindShape
        add esp, byte 8
        push str_BT022
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+0DAh], eax
        call FindShape
        add esp, byte 8
        push str_BT002
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+0DEh], eax
        call FindShape
        add esp, byte 8
        push str_BT002
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+0E2h], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov byte [UserPopupRecords+100h], 0
        mov dword [UserPopupRecords+0E6h], eax
        mov eax, dword [UserPopupRecords+0E2h]
        mov byte [UserPopupRecords+101h], 2
        add eax, byte 78h
        mov byte [UserPopupRecords+0FEh], 3
        mov dword [UserPopupRecords+0F6h], eax
        mov eax, dword [UserPopupRecords+0E6h]
        mov dword [UserPopupRecords+132h], 4
        add eax, byte 0Dh
        push str_BT10
        mov dword [UserPopupRecords+0FAh], eax
        lea eax, [dword ebp-096h]
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+136h], eax
        call FindShape
        add esp, byte 8
        push str_BT11
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+13Ch], eax
        call FindShape
        add esp, byte 8
        push str_BT12
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+140h], eax
        call FindShape
        add esp, byte 8
        push str_BT10
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+144h], eax
        call FindShape
        movsx eax, word [byte eax+0Ch]
        add esp, byte 8
        mov dword [UserPopupRecords+148h], eax
        push str_BT10
        push dword [byte ebp+042h]
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov byte [UserPopupRecords+166h], 1
        mov dword [UserPopupRecords+14Ch], eax
        mov eax, dword [UserPopupRecords+148h]
        mov byte [UserPopupRecords+167h], 4
        add eax, byte 78h
        mov byte [UserPopupRecords+164h], 4
        mov dword [UserPopupRecords+15Ch], eax
        mov eax, dword [UserPopupRecords+14Ch]
        mov dword [UserPopupRecords+198h], 4
        add eax, byte 0Dh
        push str_TB01
        mov dword [UserPopupRecords+160h], eax
        lea eax, [dword ebp-0116h]
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+19Ch], eax
        call FindShape
        add esp, byte 8
        push str_TB00
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+1A2h], eax
        call FindShape
        add esp, byte 8
        push str_TB00
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+1A6h], eax
        call FindShape
        add esp, byte 8
        push str_TB01
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+1AAh], eax
        call FindShape
        add esp, byte 8
        push str_TB01
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+1AEh], eax
        call FindShape
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        mov byte [UserPopupRecords+1CCh], 0
        mov dword [UserPopupRecords+1B2h], eax
        mov eax, dword [UserPopupRecords+1AEh]
        mov byte [UserPopupRecords+1CDh], 4
        add eax, byte 0Bh
        mov byte [UserPopupRecords+1CBh], 5
        mov dword [UserPopupRecords+1C2h], eax
        mov eax, dword [UserPopupRecords+1B2h]
        mov dword [UserPopupRecords+1FEh], 4
        add eax, byte 0Ch
        push str_TB11
        mov dword [UserPopupRecords+1C6h], eax
        lea eax, [dword ebp-0D6h]
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+202h], eax
        call FindShape
        add esp, byte 8
        push str_TB10
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+208h], eax
        call FindShape
        add esp, byte 8
        push str_TB10
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+20Ch], eax
        call FindShape
        add esp, byte 8
        mov dword [UserPopupRecords+210h], eax
        push str_TB11
        push dword [byte ebp+042h]
        mov dword [byte ebp+05Ah], 0FCh
        call FindShape
        add esp, byte 8
        mov esi, 0ABh
        mov dword [byte ebp+05Eh], UserMenuBoxes
        push str_TB11
        movsx eax, word [byte eax+0Ch]
        push dword [byte ebp+042h]
        mov dword [UserPopupRecords+214h], eax
        call FindShape
        mov edx, 1FEh
        movsx eax, word [byte eax+0Eh]
        add esp, byte 8
        mov dword [UserPopupRecords+218h], eax
        mov eax, dword [UserPopupRecords+214h]
        xor ecx, ecx
        add eax, byte 9
        mov byte [UserPopupRecords+232h], 3
        mov dword [UserPopupRecords+228h], eax
        mov eax, dword [UserPopupRecords+218h]
        mov byte [UserPopupRecords+233h], 2
        add eax, byte 0Ch
        mov byte [UserPopupRecords+231h], 9
        mov dword [UserPopupRecords+22Ch], eax
        mov eax, dword [str_J]
        mov bl, cl
        sub eax, byte 4
        add bl, 6
        mov dword [byte ebp+046h], eax
        mov al, cl
        mov bh, cl
        add al, 0Ah
        add bh, 4
        mov byte [byte ebp+07Ah], al
.3:
        mov eax, ecx
        shl eax, 6
        test ecx, ecx
        jne short .5
        mov dword [dword eax+UserMenuBoxes], 3Ch
        mov dword [dword eax+UserMenuBoxes+4], 50h
        mov dword [dword eax+UserMenuBoxes+8], 0F0h
        mov dword [dword eax+UserMenuBoxes+0Ch], 50h
        mov edi, dword [str_J]
        mov dword [dword eax+UserMenuBoxes+10h], 0F0h
        mov byte [dword edx+UserPopupRecords+9Ah], 3
        mov dword [dword eax+UserMenuBoxes+18h], 3Ch
        mov byte [dword edx+UserPopupRecords+98h], 3
.4:
        mov dword [dword eax+UserMenuBoxes+14h], edi
        mov byte [dword edx+UserPopupRecords+9Bh], bl
        mov dword [dword eax+UserMenuBoxes+1Ch], edi
        jmp near .9
.5:
        cmp ecx, byte 1
        jne short .6
        mov dword [dword eax+UserMenuBoxes], 0F1h
        mov dword [dword eax+UserMenuBoxes+4], 50h
        mov dword [dword eax+UserMenuBoxes+8], 12Ch
        mov dword [dword eax+UserMenuBoxes+0Ch], 50h
        mov edi, dword [str_J]
        mov dword [dword eax+UserMenuBoxes+10h], 12Ch
        mov byte [dword edx+UserPopupRecords+98h], 3
        mov dword [dword eax+UserMenuBoxes+18h], 0F1h
        mov byte [dword edx+UserPopupRecords+9Ah], bh
        jmp short .4
.6:
        mov dword [dword eax+UserMenuBoxes+4], 50h
        mov dword [dword eax+UserMenuBoxes+0Ch], 50h
        mov dword [dword eax+UserMenuBoxes], esi
        mov edi, dword [byte ebp+05Ah]
        mov dword [dword eax+UserMenuBoxes+18h], esi
        mov dword [dword eax+UserMenuBoxes+8], edi
        mov dword [dword eax+UserMenuBoxes+10h], edi
        mov edi, dword [str_J]
        mov dword [dword eax+UserMenuBoxes+14h], edi
        mov byte [dword edx+UserPopupRecords+9Ah], bh
        mov dword [dword eax+UserMenuBoxes+1Ch], edi
        cmp ecx, byte 4
        jne short .7
        mov byte [dword edx+UserPopupRecords+9Bh], 4
        jmp short .8
.7:
        mov byte [dword edx+UserPopupRecords+9Bh], bl
.8:
        mov byte [dword edx+UserPopupRecords+98h], 4
.9:
        mov edi, dword [byte ebp+05Eh]
        add dword [byte ebp+05Ah], byte 51h
        mov eax, ecx
        inc bl
        shl eax, 6
        mov dword [dword edx+UserPopupRecords+6Ah], edi
        mov edi, dword [dword eax+UserMenuBoxes]
        add edx, byte 66h
        mov dword [byte ebp+076h], edi
        mov eax, dword [dword eax+UserMenuBoxes+8]
        add esi, byte 51h
        add dword [byte ebp+076h], eax
        mov dword [dword edx+UserPopupRecords], 4
        mov eax, dword [byte ebp+076h]
        add dword [byte ebp+05Eh], byte 40h
        sar eax, 1
        inc bh
        mov dword [dword edx+UserPopupRecords+2Ah], eax
        mov eax, dword [byte ebp+046h]
        inc ecx
        mov dword [dword edx+UserPopupRecords+2Eh], eax
        mov al, byte [byte ebp+07Ah]
        inc byte [byte ebp+07Ah]
        mov byte [dword edx+UserPopupRecords+33h], al
        cmp ecx, byte 5
        jl near .3
        mov dword [byte ebp+072h], 0
        mov dword [byte ebp+06Eh], 0
.10:
        mov eax, ecx
        imul edx, ecx, byte 66h
        mov ebx, dword [byte ebp+06Eh]
        shl eax, 6
        mov dword [byte ebp+062h], 0FCh
        add eax, UserMenuBoxes
        mov dword [byte ebp+066h], 0ABh
        mov dword [byte ebp+06Ah], eax
        mov al, cl
        xor esi, esi
        add al, 0Ah
        add edx, 1FEh
        mov byte [byte ebp+07Eh], al
.11:
        mov eax, ecx
        shl eax, 6
        test esi, esi
        jne short .13
        mov dword [dword eax+UserMenuBoxes], 3Ch
        mov dword [dword eax+UserMenuBoxes+8], 0F0h
        mov dword [dword eax+UserMenuBoxes+10h], 0F0h
        mov edi, dword [dword ebx+str_J]
        mov dword [dword eax+UserMenuBoxes+18h], 3Ch
        inc edi
.12:
        mov dword [dword eax+UserMenuBoxes+4], edi
        mov dword [dword eax+UserMenuBoxes+0Ch], edi
        mov edi, dword [dword ebx+str_V]
        mov dword [dword eax+UserMenuBoxes+14h], edi
        jmp near .15
.13:
        cmp esi, byte 1
        jne short .14
        mov dword [dword eax+UserMenuBoxes], 0F1h
        mov dword [dword eax+UserMenuBoxes+8], 12Ch
        mov dword [dword eax+UserMenuBoxes+10h], 12Ch
        mov edi, dword [dword ebx+str_J]
        mov dword [dword eax+UserMenuBoxes+18h], 0F1h
        add edi, esi
        jmp short .12
.14:
        mov edi, dword [byte ebp+066h]
        mov dword [dword eax+UserMenuBoxes], edi
        mov edi, dword [dword ebx+str_J]
        inc edi
        mov dword [byte ebp+076h], edi
        mov dword [dword eax+UserMenuBoxes+4], edi
        mov edi, dword [byte ebp+062h]
        mov dword [dword eax+UserMenuBoxes+8], edi
        mov edi, dword [byte ebp+076h]
        mov dword [dword eax+UserMenuBoxes+0Ch], edi
        mov edi, dword [byte ebp+062h]
        mov dword [dword eax+UserMenuBoxes+10h], edi
        mov edi, dword [dword ebx+str_V]
        mov dword [dword eax+UserMenuBoxes+14h], edi
        mov edi, dword [byte ebp+066h]
        mov dword [dword eax+UserMenuBoxes+18h], edi
        mov edi, dword [dword ebx+str_V]
.15:
        mov dword [dword eax+UserMenuBoxes+1Ch], edi
        mov eax, ecx
        mov edi, dword [byte ebp+06Ah]
        shl eax, 6
        mov dword [dword edx+UserPopupRecords+6Ah], edi
        mov edi, dword [dword eax+UserMenuBoxes]
        mov dword [byte ebp+076h], edi
        mov edi, dword [dword eax+UserMenuBoxes+8]
        add dword [byte ebp+076h], edi
        mov edi, dword [byte ebp+076h]
        sar edi, 1
        mov dword [dword edx+UserPopupRecords+90h], edi
        mov edi, dword [dword eax+UserMenuBoxes+4]
        mov dword [byte ebp+076h], edi
        mov eax, dword [dword eax+UserMenuBoxes+14h]
        add dword [byte ebp+076h], eax
        mov eax, dword [byte ebp+076h]
        mov dword [dword edx+UserPopupRecords+66h], 4
        sar eax, 1
        mov dword [dword edx+UserPopupRecords+94h], eax
        test esi, esi
        jne short .16
        mov dword [byte ebp+04Ah], 3
        jmp short .17
.16:
        lea eax, [byte ecx+04h]
        mov dword [byte ebp+04Ah], eax
.17:
        mov al, byte [byte ebp+04Ah]
        mov byte [dword edx+UserPopupRecords+9Ah], al
        cmp esi, byte 4
        jne short .18
        mov dword [byte ebp+04Eh], esi
        jmp short .19
.18:
        lea eax, [byte ecx+06h]
        mov dword [byte ebp+04Eh], eax
.19:
        mov al, byte [byte ebp+04Eh]
        mov byte [dword edx+UserPopupRecords+98h], cl
        mov byte [dword edx+UserPopupRecords+9Bh], al
        cmp dword [byte ebp+072h], byte 18h
        jne short .20
        cmp esi, byte 2
        setge al
        movzx eax, al
        inc eax
        jmp short .21
.20:
        mov al, byte [byte ebp+07Eh]
.21:
        mov byte [dword edx+UserPopupRecords+99h], al
        add dword [byte ebp+06Ah], byte 40h
        inc byte [byte ebp+07Eh]
        add dword [byte ebp+062h], byte 51h
        add dword [byte ebp+066h], byte 51h
        add edx, byte 66h
        inc esi
        inc ecx
        cmp esi, byte 5
        jl near .11
        inc dword [byte ebp+072h]
        add dword [byte ebp+06Eh], byte 4
        cmp dword [byte ebp+072h], byte 19h
        jl near .10
        push dword [UserPopupRecords+22Ch]
        push dword [UserPopupRecords+228h]
        call MouseRead
        mov ecx, dword [byte ebp+03Eh]
        mov edx, dword [byte ebp+03Ah]
        add esp, byte 8
        mov eax, dword [byte ebp+032h]
        xor ebx, ebx
        call DrawUserRecords
        mov ebx, 3
        mov edx, dword [byte ebp+036h]
        xor eax, eax
        call FadePalette
.22:
        mov dword [byte ebp+02Ah], 0FFFFFFFFh
.23:
        cmp dword [byte ebp+02Ah], byte 0
        jge short .24
        push byte 2
        lea eax, [byte ebp+02Ah]
        push byte 0
        mov ebx, 0FFFFFFFFh
        mov edx, UserPopupRecords+56h
        push eax
        xor ecx, ecx
        mov eax, 87h
        call RunMenu
        jmp short .23
.24:
        cmp dword [byte ebp+02Ah], byte 4
        ja near UserRecordsScreen_B93.31
        mov eax, dword [byte ebp+02Ah]
        jmp dword [nosplit cs:eax*4+jpt_2CB19]
UserRecordsScreen_A1A:
        call SlideInSideBar
        mov dword [byte ebp+02Eh], 0
        jmp near UserRecordsScreen_CC6.42
UserRecordsScreen_A2B:
        cmp dword [UserRecordsFirst], byte 0
        jl near UserRecordsScreen_CC6.42
        lea eax, [byte ebp-016h]
        push eax
        call SetDrawTarget
        mov edx, dword [UserRecordsFirst]
        add esp, byte 4
        mov eax, UserNameIndex
        inc edx
        inc edx
        call DeleteUser
        test eax, eax
        je near UserRecordsScreen_B4F.29
        call LoadUserRecords
        mov eax, dword [UserRecordsTop]
        inc eax
        inc eax
        cmp eax, byte 0Dh
        ja near UserRecordsScreen_AD5.25
        jmp dword [nosplit cs:eax*4+jpt_2CB2D]
UserRecordsScreen_A7B:
        mov dword [byte ebp+052h], CompareUsersByName
        jmp short UserRecordsScreen_AD5.25
UserRecordsScreen_A84:
        mov dword [byte ebp+052h], CompareUsersByTeam
        jmp short UserRecordsScreen_AD5.25
UserRecordsScreen_A8D:
        mov dword [byte ebp+052h], CompareUsersByRecord
        jmp short UserRecordsScreen_AD5.25
UserRecordsScreen_A96:
        mov dword [byte ebp+052h], CompareUsersByGoalsFor
        jmp short UserRecordsScreen_AD5.25
UserRecordsScreen_A9F:
        mov dword [byte ebp+052h], CompareUsersByGoalsAgainst
        jmp short UserRecordsScreen_AD5.25
UserRecordsScreen_AA8:
        mov dword [byte ebp+052h], CompareUsersByShutouts
        jmp short UserRecordsScreen_AD5.25
UserRecordsScreen_AB1:
        mov dword [byte ebp+052h], CompareUsersByStreak
        jmp short UserRecordsScreen_AD5.25
UserRecordsScreen_ABA:
        mov dword [byte ebp+052h], CompareUsersByOpponent
        jmp short UserRecordsScreen_AD5.25
UserRecordsScreen_AC3:
        mov dword [byte ebp+052h], CompareUsersByPowerPlay
        jmp short UserRecordsScreen_AD5.25
UserRecordsScreen_ACC:
        mov dword [byte ebp+052h], CompareUsersByPenaltyKill
        jmp short UserRecordsScreen_AD5.25
UserRecordsScreen_AD5:
        mov dword [byte ebp+052h], CompareUsersByRating
.25:
        xor eax, eax
        xor ebx, ebx
.26:
        mov edx, dword [UserNameField]
        mov dword [edx+ebx], eax
        inc eax
        add ebx, byte 4
        cmp eax, byte 19h
        jl short .26
        mov eax, dword [UserNameIndex]
        mov ecx, dword [byte ebp+052h]
        mov ebx, 4
        mov edx, dword [byte eax+066h]
        mov eax, dword [UserNameField]
        dec edx
        dec edx
        call qsort_
        mov eax, dword [UserNameIndex]
        mov eax, dword [byte eax+066h]
        dec eax
        dec eax
        test eax, eax
        jle short .27
        mov eax, dword [UserNameField]
        mov eax, dword [eax]
        mov dword [UserRecordsFirst], eax
        jmp short .28
.27:
        mov dword [byte ebp+02Eh], 0
.28:
        push dword [FrontEndScreenBmp]
        call TextSetFont
        mov ecx, dword [byte ebp+03Eh]
        mov edx, dword [byte ebp+03Ah]
        add esp, byte 4
        mov eax, dword [byte ebp+032h]
        xor ebx, ebx
        jmp near UserRecordsScreen_CC6.41
UserRecordsScreen_B4F:
        lea eax, [byte ebp-016h]
        push eax
        call SetDrawTarget
        add esp, byte 4
        call ExportUserRecords
.29:
        push dword [FrontEndScreenBmp]
        call TextSetFont
        add esp, byte 4
        jmp near UserRecordsScreen_CC6.42
UserRecordsScreen_B73:
        cmp dword [UserRecordsRow], byte 0
        jle near UserRecordsScreen_CC6.42
        mov ecx, dword [byte ebp+03Eh]
        mov ebx, 0FFFFFFFFh
.30:
        mov edx, dword [byte ebp+03Ah]
        mov eax, dword [byte ebp+032h]
        jmp near UserRecordsScreen_CC6.41
UserRecordsScreen_B93:
        cmp dword [UserRecordsRow], byte 3
        jge near UserRecordsScreen_CC6.42
        mov ecx, dword [byte ebp+03Eh]
        mov ebx, 1
        jmp short UserRecordsScreen_B73.30
.31:
        cmp dword [byte ebp+02Ah], byte 5
        jl near UserRecordsScreen_CC6.42
        mov eax, dword [byte ebp+02Ah]
        sub eax, byte 5
        mov ebx, 5
        cdq
        idiv ebx
        test edx, edx
        jne short .33
        cmp ebx, dword [byte ebp+02Ah]
        jne short .32
        mov dword [UserRecordsTop], 0FFFFFFFEh
        jmp short .37
.32:
        mov eax, dword [byte ebp+02Ah]
        sub eax, byte 0Ah
        cdq
        idiv ebx
        mov edx, dword [UserNameField]
        mov eax, dword [edx+eax*4]
        jmp short .36
.33:
        lea eax, [byte edx-01h]
        cmp eax, byte 3
        jg short .37
        test eax, eax
        jne short .34
        mov dword [UserRecordsTop], 0FFFFFFFFh
        jmp short .35
.34:
        imul edx, dword [UserRecordsRow], byte 3
        add eax, edx
        dec eax
        mov dword [UserRecordsTop], eax
.35:
        cmp dword [byte ebp+02Ah], byte 0Ah
        jl short .37
        mov eax, dword [byte ebp+02Ah]
        sub eax, byte 0Ah
        mov ebx, 5
        cdq
        idiv ebx
        mov edx, eax
        mov eax, dword [UserNameField]
        shl edx, 2
        mov eax, dword [edx+eax]
.36:
        mov dword [UserRecordsFirst], eax
.37:
        mov eax, dword [UserNameIndex]
        mov eax, dword [byte eax+066h]
        dec eax
        dec eax
        cmp eax, dword [UserRecordsFirst]
        jg short .38
        mov dword [UserRecordsFirst], 0FFFFFFFFh
.38:
        mov eax, dword [UserRecordsTop]
        inc eax
        inc eax
        cmp eax, byte 0Dh
        ja near UserRecordsScreen_CC6.39
        jmp dword [nosplit cs:eax*4+jpt_2CB65]
UserRecordsScreen_C6C:
        mov dword [byte ebp+056h], CompareUsersByName
        jmp short UserRecordsScreen_CC6.39
UserRecordsScreen_C75:
        mov dword [byte ebp+056h], CompareUsersByTeam
        jmp short UserRecordsScreen_CC6.39
UserRecordsScreen_C7E:
        mov dword [byte ebp+056h], CompareUsersByRecord
        jmp short UserRecordsScreen_CC6.39
UserRecordsScreen_C87:
        mov dword [byte ebp+056h], CompareUsersByGoalsFor
        jmp short UserRecordsScreen_CC6.39
UserRecordsScreen_C90:
        mov dword [byte ebp+056h], CompareUsersByGoalsAgainst
        jmp short UserRecordsScreen_CC6.39
UserRecordsScreen_C99:
        mov dword [byte ebp+056h], CompareUsersByShutouts
        jmp short UserRecordsScreen_CC6.39
UserRecordsScreen_CA2:
        mov dword [byte ebp+056h], CompareUsersByStreak
        jmp short UserRecordsScreen_CC6.39
UserRecordsScreen_CAB:
        mov dword [byte ebp+056h], CompareUsersByOpponent
        jmp short UserRecordsScreen_CC6.39
UserRecordsScreen_CB4:
        mov dword [byte ebp+056h], CompareUsersByPowerPlay
        jmp short UserRecordsScreen_CC6.39
UserRecordsScreen_CBD:
        mov dword [byte ebp+056h], CompareUsersByPenaltyKill
        jmp short UserRecordsScreen_CC6.39
UserRecordsScreen_CC6:
        mov dword [byte ebp+056h], CompareUsersByRating
.39:
        xor eax, eax
        xor edx, edx
.40:
        mov ebx, dword [UserNameField]
        mov dword [edx+ebx], eax
        inc eax
        add edx, byte 4
        cmp eax, byte 19h
        jl short .40
        mov eax, dword [UserNameIndex]
        mov ecx, dword [byte ebp+056h]
        mov ebx, 4
        mov edx, dword [byte eax+066h]
        mov eax, dword [UserNameField]
        dec edx
        dec edx
        call qsort_
        mov ecx, dword [byte ebp+03Eh]
        mov edx, dword [byte ebp+03Ah]
        mov eax, dword [byte ebp+032h]
        xor ebx, ebx
.41:
        call DrawUserRecords
.42:
        cmp dword [byte ebp+02Eh], byte 0FFFFFFFFh
        je near UserRecordsScreen.22
        push dword [UserRecordList]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserStreakColumn]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserNameField]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserPowerPlayColumn]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserTeamField]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserStreakField]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserLongStreakField]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserShutoutField]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserPowerPlayField]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserOpponentColumn]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserGoalsAgainstField]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserGoalsForField]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserLongStreakColumn]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserShutoutColumn]
        call FreeMemBlock
        add esp, byte 4
        push dword [UserRatingColumn]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+032h]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp+03Eh]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp+03Ah]
        call FreeMemBlock
        add esp, byte 4
        lea eax, [byte ebp-016h]
        push eax
        call SetDrawTarget
        add esp, byte 4
        mov eax, 1
        mov edx, dword [UserNameIndex]
        call NameIndexFree
        mov eax, 3
        mov edx, dword [byte ebp+02Eh]
        call FadeOut
.43:
        mov eax, edx
        jmp near UpdateUserRecords_47F
