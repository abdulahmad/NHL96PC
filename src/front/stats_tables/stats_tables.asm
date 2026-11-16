; The stats tables of the game mode: loading and freeing them.
bits 32
%include "hockey.inc"
section s_1EA14 progbits alloc exec nowrite align=1
extern seasondb, CareerDb, statsfromleague, TeamDb, statsplayoffs, AttributeDb, PlayerAttrFile, LeagueRecordsFile
extern SeasonDbSize, CareerDbSize, LeagueStatsSize, TeamDbSize, PlayoffStatsSize, AttributeDbSize, PlayerAttrFileSize, LeagueRecordsSize
extern LoadDataFile, MakeDataPath, strcat_, strcpy_, MakeSeasonDbPath, MakePlayoffDbPath, FreeMemBlock, OpenArtArchiveErr
extern FileSizeByName, str_Punct_PlayerDbRecord
global LoadSeasonStats, LoadSeasonStats_11A, LoadPlayoffStats, LoadExhibitionStats, LoadExhibitionStats_17E, LoadModemStats, FreeStatsTables, PlayerDbRecord
global SeasonDbRecord, CareerDbRecord, LeagueRecordsRecord, PlayerAttrRecord, AttributeDbRecord
;-----------------------------------------------------------------------------
; LoadSeasonStats                              1EA14  96 PC, medium confidence
; (season): frees the stats tables and loads the season's stats files (team,
; players, schedule, ...)
;-----------------------------------------------------------------------------
LoadSeasonStats:
        push ebx
        push ecx
        push edx
        push esi
        enter 20h, 0
        mov esi, eax
        call FreeStatsTables
        mov ebx, 5
        lea eax, [byte ebp-020h]
        mov edx, esi
        call MakeSeasonDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [seasondb], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 1
        add esp, byte 4
        mov dword [SeasonDbSize], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [CareerDb], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 3
        add esp, byte 4
        mov dword [CareerDbSize], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [statsfromleague], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [LeagueStatsSize], eax
        mov edx, esi
        xor ebx, ebx
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [TeamDb], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 4
        add esp, byte 4
        mov dword [TeamDbSize], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [statsplayoffs], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 2
        add esp, byte 4
        mov dword [PlayoffStatsSize], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
LoadSeasonStats_11A:
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [AttributeDb], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [AttributeDbSize], eax
        mov eax, 0BBh
        call LoadDataFile
        mov edx, 0BBh
        mov dword [LeagueRecordsFile], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [LeagueRecordsSize], eax
        mov eax, 4
        call LoadDataFile
        mov edx, 4
        mov dword [PlayerAttrFile], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [PlayerAttrFileSize], eax
        leave
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadPlayoffStats                             1EBBC  96 PC, medium confidence
; (playoff): frees the stats tables and loads the playoff's stats files
;-----------------------------------------------------------------------------
LoadPlayoffStats:
        push ebx
        push ecx
        push edx
        push esi
        enter 20h, 0
        mov esi, eax
        call FreeStatsTables
        mov ebx, 5
        lea eax, [byte ebp-020h]
        mov edx, esi
        call MakePlayoffDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [seasondb], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 1
        add esp, byte 4
        mov dword [SeasonDbSize], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakePlayoffDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [CareerDb], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 3
        add esp, byte 4
        mov dword [CareerDbSize], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakePlayoffDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [statsfromleague], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [LeagueStatsSize], eax
        mov edx, esi
        xor ebx, ebx
        lea eax, [byte ebp-020h]
        call MakePlayoffDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [TeamDb], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 4
        add esp, byte 4
        mov dword [TeamDbSize], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakePlayoffDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [statsplayoffs], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 2
        add esp, byte 4
        mov dword [PlayoffStatsSize], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakePlayoffDbPath
        jmp near LoadSeasonStats_11A
;-----------------------------------------------------------------------------
; LoadExhibitionStats                          1ECDB  96 PC, medium confidence
; Frees the stats tables and loads the exhibition stats files
;-----------------------------------------------------------------------------
LoadExhibitionStats:
        push ebx
        push ecx
        push edx
        enter 20h, 0
        call FreeStatsTables
        mov edx, 20h
        mov eax, 8
        call LoadDataFile
        mov edx, 8
        mov dword [seasondb], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [SeasonDbSize], eax
        mov eax, 0BAh
        call LoadDataFile
        mov edx, 0BAh
        mov dword [CareerDb], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [CareerDbSize], eax
        mov eax, 6
        call LoadDataFile
        mov edx, 6
        mov dword [statsfromleague], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [LeagueStatsSize], eax
        mov eax, 3
        call LoadDataFile
        mov edx, 3
        mov dword [TeamDb], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [TeamDbSize], eax
        mov edx, 20h
        mov eax, 7
        call LoadDataFile
        mov edx, 7
        mov dword [statsplayoffs], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [PlayoffStatsSize], eax
        mov eax, 5
        call LoadDataFile
        mov edx, 5
        mov dword [AttributeDb], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [AttributeDbSize], eax
        mov eax, 0BBh
        call LoadDataFile
        mov edx, 0BBh
        mov dword [LeagueRecordsFile], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [LeagueRecordsSize], eax
        mov eax, 4
        call LoadDataFile
        mov edx, 4
LoadExhibitionStats_17E:
        mov dword [PlayerAttrFile], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [PlayerAttrFileSize], eax
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadModemStats                               1EE7C  96 PC, medium confidence
; Frees the stats tables and loads the modem game stats files
;-----------------------------------------------------------------------------
LoadModemStats:
        push ebx
        push ecx
        push edx
        enter 20h, 0
        call FreeStatsTables
        mov edx, 20h
        mov eax, 10Ch
        call LoadDataFile
        mov edx, 10Ch
        mov dword [seasondb], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [SeasonDbSize], eax
        mov eax, 113h
        call LoadDataFile
        mov edx, 113h
        mov dword [CareerDb], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [CareerDbSize], eax
        mov eax, 110h
        call LoadDataFile
        mov edx, 110h
        mov dword [statsfromleague], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [LeagueStatsSize], eax
        mov eax, 109h
        call LoadDataFile
        mov edx, 109h
        mov dword [TeamDb], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [TeamDbSize], eax
        mov edx, 20h
        mov eax, 10Eh
        call LoadDataFile
        mov edx, 10Eh
        mov dword [statsplayoffs], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [PlayoffStatsSize], eax
        mov eax, 10Fh
        call LoadDataFile
        mov edx, 10Fh
        mov dword [AttributeDb], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [AttributeDbSize], eax
        mov eax, 114h
        call LoadDataFile
        mov edx, 114h
        mov dword [LeagueRecordsFile], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [LeagueRecordsSize], eax
        mov eax, 10Ah
        call LoadDataFile
        mov edx, 10Ah
        jmp near LoadExhibitionStats_17E
;-----------------------------------------------------------------------------
; FreeStatsTables                                                 1EFFF  96 PC
; Frees the loaded stats tables (seasondb-1174FC) and clears their sizes
;-----------------------------------------------------------------------------
FreeStatsTables:
        push ebx
        push ecx
        push edx
        cmp dword [AttributeDb], byte 0
        je short .1
        push dword [AttributeDb]
        call FreeMemBlock
        mov dword [AttributeDb], 0
        mov dword [AttributeDbSize], 0
        add esp, byte 4
.1:
        cmp dword [statsplayoffs], byte 0
        je short .2
        push dword [statsplayoffs]
        call FreeMemBlock
        mov dword [statsplayoffs], 0
        mov dword [PlayoffStatsSize], 0
        add esp, byte 4
.2:
        cmp dword [TeamDb], byte 0
        je short .3
        push dword [TeamDb]
        call FreeMemBlock
        mov dword [TeamDb], 0
        mov dword [TeamDbSize], 0
        add esp, byte 4
.3:
        cmp dword [statsfromleague], byte 0
        je short .4
        push dword [statsfromleague]
        call FreeMemBlock
        mov dword [statsfromleague], 0
        mov dword [LeagueStatsSize], 0
        add esp, byte 4
.4:
        cmp dword [CareerDb], byte 0
        je short .5
        push dword [CareerDb]
        call FreeMemBlock
        mov dword [CareerDb], 0
        mov dword [CareerDbSize], 0
        add esp, byte 4
.5:
        cmp dword [seasondb], byte 0
        je short .6
        push dword [seasondb]
        call FreeMemBlock
        mov dword [seasondb], 0
        mov dword [SeasonDbSize], 0
        add esp, byte 4
.6:
        cmp dword [LeagueRecordsFile], byte 0
        je short .7
        push dword [LeagueRecordsFile]
        call FreeMemBlock
        mov dword [LeagueRecordsFile], 0
        mov dword [LeagueRecordsSize], 0
        add esp, byte 4
.7:
        cmp dword [PlayerAttrFile], byte 0
        je short .8
        push dword [PlayerAttrFile]
        call FreeMemBlock
        mov dword [PlayerAttrFile], 0
        mov dword [PlayerAttrFileSize], 0
        add esp, byte 4
.8:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PlayerDbRecord                               1F15E  96 PC, medium confidence
; (offset): pointer into the player table (stats db file 0, TeamDb):
; +1, +2 number and position, +3 first name, +13h last name
;-----------------------------------------------------------------------------
PlayerDbRecord:
        push edx
        mov edx, dword [TeamDb]
        add eax, edx
        pop edx
        ret
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        mov esi, eax
        mov dword [byte ebp-0Ch], edx
        mov ecx, ebx
        mov ebx, edx
        xor eax, eax
.1:
        mov byte [byte ebx+02h], al
        inc eax
        add ebx, byte 1Bh
        cmp eax, byte 1Ch
        jl short .1
        imul esi, dword 31Bh
        mov eax, dword [statsplayoffs]
        mov ebx, dword [byte ebp-0Ch]
        add esi, eax
        mov dword [byte ebp-04h], 0
        mov dword [ecx], esi
.2:
        mov eax, dword [ecx]
        add eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+063h]
        cmp eax, byte 0FFFFFFFFh
        jne short .3
        mov byte [ebx], 0
        mov byte [byte ebx+01h], 64h
        mov byte [byte ebx+02h], 0
        mov byte [byte ebx+03h], 0
        jmp short .4
.3:
        mov esi, dword [TeamDb]
        add esi, eax
        mov dl, byte [byte esi+02h]
        mov byte [ebx], dl
        mov dl, byte [byte esi+01h]
        mov byte [byte ebx+01h], dl
        lea edi, [byte ebx+08h]
        mov dword [byte ebx+04h], eax
        lea edx, [byte esi+03h]
        mov eax, edi
        mov byte [byte ebx+03h], 3
        call strcpy_
        mov edx, str_Punct_PlayerDbRecord
        mov eax, edi
        call strcat_
        lea edx, [byte esi+013h]
        mov eax, edi
        call strcat_
.4:
        add dword [byte ebp-04h], byte 4
        add ebx, byte 1Bh
        cmp dword [byte ebp-04h], byte 64h
        jne short .2
        mov ebx, dword [byte ebp-0Ch]
        mov dword [byte ebp-08h], 0
        add ebx, 2A3h
.5:
        mov eax, dword [ecx]
        add eax, dword [byte ebp-08h]
        mov eax, dword [dword eax+0C7h]
        cmp eax, byte 0FFFFFFFFh
        jne short .6
        mov byte [ebx], 0
        mov byte [byte ebx+01h], 64h
        mov byte [byte ebx+02h], 0
        mov byte [byte ebx+03h], 0
        jmp short .7
.6:
        mov esi, dword [TeamDb]
        add esi, eax
        mov dl, byte [byte esi+02h]
        mov byte [ebx], dl
        mov dl, byte [byte esi+01h]
        mov byte [byte ebx+01h], dl
        lea edi, [byte ebx+08h]
        mov dword [byte ebx+04h], eax
        lea edx, [byte esi+03h]
        mov eax, edi
        mov byte [byte ebx+03h], 3
        call strcpy_
        mov edx, str_Punct_PlayerDbRecord
        mov eax, edi
        call strcat_
        lea edx, [byte esi+013h]
        mov eax, edi
        call strcat_
.7:
        add dword [byte ebp-08h], byte 4
        add ebx, byte 1Bh
        cmp dword [byte ebp-08h], byte 0Ch
        jne short .5
        xor eax, eax
.8:
        mov ebx, dword [ecx]
        movzx edx, byte [dword ebx+eax+0109h]
        cmp edx, byte 64h
        je short .9
        imul edx, byte 1Bh
        mov ebx, dword [byte ebp-0Ch]
        mov byte [byte edx+ebx+03h], 2
.9:
        inc eax
        cmp eax, byte 8
        jl short .8
        leave
        pop edi
        pop esi
        pop ecx
        ret
        push edx
        imul eax, dword 31Bh
        mov edx, dword [statsplayoffs]
        add eax, edx
        pop edx
        ret
        push edx
        imul eax, byte 63h
        mov edx, dword [statsfromleague]
        add eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; SeasonDbRecord                                  1F2C9  96 PC, low confidence
; (offset): pointer into stats db file 5 (seasondb)
;-----------------------------------------------------------------------------
SeasonDbRecord:
        push edx
        mov edx, dword [seasondb]
        add eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; CareerDbRecord                                  1F2D4  96 PC, low confidence
; (offset): pointer into stats db file 1 (CareerDb)
;-----------------------------------------------------------------------------
CareerDbRecord:
        push edx
        mov edx, dword [CareerDb]
        add eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; LeagueRecordsRecord                               1F2DF  96 PC, low confidence
; (offset): pointer into data file 0BBh (LeagueRecordsFile)
;-----------------------------------------------------------------------------
LeagueRecordsRecord:
        push edx
        mov edx, dword [LeagueRecordsFile]
        add eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; PlayerAttrRecord                                1F2EA  96 PC, low confidence
; (offset): pointer into data file 4 (PlayerAttrFile)
;-----------------------------------------------------------------------------
PlayerAttrRecord:
        push edx
        mov edx, dword [PlayerAttrFile]
        add eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; AttributeDbRecord                                  1F2F5  96 PC, low confidence
; (offset): pointer into stats db file 2 (AttributeDb)
;-----------------------------------------------------------------------------
AttributeDbRecord:
        push edx
        mov edx, dword [AttributeDb]
        add eax, edx
        pop edx
        ret
