; The stats tables of the game mode: loading and freeing them (96 PC).
bits 32
%include "hockey.inc"
section s_1EA14 progbits alloc exec nowrite align=1
extern dword_1174E0, dword_1174E4, dword_1174E8, dword_1174EC, dword_1174F0, dword_1174F4, dword_1174F8, dword_1174FC
extern dword_117500, dword_117504, dword_117508, dword_11750C, dword_117510, dword_117514, dword_117518, dword_11751C
extern LoadDataFile, MakeDataPath, strcat_, strcpy_, MakeSeasonDbPath, MakePlayoffDbPath, FreeMemBlock, OpenArtArchiveErr
extern FileSizeByName, unk_117522
global LoadSeasonStats, LoadSeasonStats_11A, LoadPlayoffStats, LoadExhibitionStats, LoadExhibitionStats_17E, LoadModemStats, FreeStatsTables, PlayerDbRecord
global StatsDb5Record, StatsDb1Record, StatsDataBBRecord, StatsData4Record, StatsDb2Record
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
        mov dword [dword_1174E0], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 1
        add esp, byte 4
        mov dword [dword_117500], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [dword_1174E4], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 3
        add esp, byte 4
        mov dword [dword_117504], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [dword_1174E8], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [dword_117508], eax
        mov edx, esi
        xor ebx, ebx
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [dword_1174EC], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 4
        add esp, byte 4
        mov dword [dword_11750C], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [dword_1174F0], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 2
        add esp, byte 4
        mov dword [dword_117510], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakeSeasonDbPath
LoadSeasonStats_11A:
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [dword_1174F4], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117514], eax
        mov eax, 0BBh
        call LoadDataFile
        mov edx, 0BBh
        mov dword [dword_1174FC], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_11751C], eax
        mov eax, 4
        call LoadDataFile
        mov edx, 4
        mov dword [dword_1174F8], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [dword_117518], eax
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
        mov dword [dword_1174E0], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 1
        add esp, byte 4
        mov dword [dword_117500], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakePlayoffDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [dword_1174E4], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 3
        add esp, byte 4
        mov dword [dword_117504], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakePlayoffDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [dword_1174E8], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [dword_117508], eax
        mov edx, esi
        xor ebx, ebx
        lea eax, [byte ebp-020h]
        call MakePlayoffDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [dword_1174EC], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 4
        add esp, byte 4
        mov dword [dword_11750C], eax
        mov edx, esi
        lea eax, [byte ebp-020h]
        call MakePlayoffDbPath
        push byte 20h
        lea eax, [byte ebp-020h]
        push eax
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [dword_1174F0], eax
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov ebx, 2
        add esp, byte 4
        mov dword [dword_117510], eax
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
        mov dword [dword_1174E0], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117500], eax
        mov eax, 0BAh
        call LoadDataFile
        mov edx, 0BAh
        mov dword [dword_1174E4], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117504], eax
        mov eax, 6
        call LoadDataFile
        mov edx, 6
        mov dword [dword_1174E8], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117508], eax
        mov eax, 3
        call LoadDataFile
        mov edx, 3
        mov dword [dword_1174EC], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [dword_11750C], eax
        mov edx, 20h
        mov eax, 7
        call LoadDataFile
        mov edx, 7
        mov dword [dword_1174F0], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117510], eax
        mov eax, 5
        call LoadDataFile
        mov edx, 5
        mov dword [dword_1174F4], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117514], eax
        mov eax, 0BBh
        call LoadDataFile
        mov edx, 0BBh
        mov dword [dword_1174FC], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_11751C], eax
        mov eax, 4
        call LoadDataFile
        mov edx, 4
LoadExhibitionStats_17E:
        mov dword [dword_1174F8], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [dword_117518], eax
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
        mov dword [dword_1174E0], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117500], eax
        mov eax, 113h
        call LoadDataFile
        mov edx, 113h
        mov dword [dword_1174E4], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117504], eax
        mov eax, 110h
        call LoadDataFile
        mov edx, 110h
        mov dword [dword_1174E8], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117508], eax
        mov eax, 109h
        call LoadDataFile
        mov edx, 109h
        mov dword [dword_1174EC], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        add esp, byte 4
        mov dword [dword_11750C], eax
        mov edx, 20h
        mov eax, 10Eh
        call LoadDataFile
        mov edx, 10Eh
        mov dword [dword_1174F0], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117510], eax
        mov eax, 10Fh
        call LoadDataFile
        mov edx, 10Fh
        mov dword [dword_1174F4], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_117514], eax
        mov eax, 114h
        call LoadDataFile
        mov edx, 114h
        mov dword [dword_1174FC], eax
        lea eax, [byte ebp-020h]
        call MakeDataPath
        lea eax, [byte ebp-020h]
        push eax
        call FileSizeByName
        mov edx, 20h
        add esp, byte 4
        mov dword [dword_11751C], eax
        mov eax, 10Ah
        call LoadDataFile
        mov edx, 10Ah
        jmp near LoadExhibitionStats_17E
;-----------------------------------------------------------------------------
; FreeStatsTables                                                 1EFFF  96 PC
; Frees the loaded stats tables (dword_1174E0-1174FC) and clears their sizes
;-----------------------------------------------------------------------------
FreeStatsTables:
        push ebx
        push ecx
        push edx
        cmp dword [dword_1174F4], byte 0
        je short .1
        push dword [dword_1174F4]
        call FreeMemBlock
        mov dword [dword_1174F4], 0
        mov dword [dword_117514], 0
        add esp, byte 4
.1:
        cmp dword [dword_1174F0], byte 0
        je short .2
        push dword [dword_1174F0]
        call FreeMemBlock
        mov dword [dword_1174F0], 0
        mov dword [dword_117510], 0
        add esp, byte 4
.2:
        cmp dword [dword_1174EC], byte 0
        je short .3
        push dword [dword_1174EC]
        call FreeMemBlock
        mov dword [dword_1174EC], 0
        mov dword [dword_11750C], 0
        add esp, byte 4
.3:
        cmp dword [dword_1174E8], byte 0
        je short .4
        push dword [dword_1174E8]
        call FreeMemBlock
        mov dword [dword_1174E8], 0
        mov dword [dword_117508], 0
        add esp, byte 4
.4:
        cmp dword [dword_1174E4], byte 0
        je short .5
        push dword [dword_1174E4]
        call FreeMemBlock
        mov dword [dword_1174E4], 0
        mov dword [dword_117504], 0
        add esp, byte 4
.5:
        cmp dword [dword_1174E0], byte 0
        je short .6
        push dword [dword_1174E0]
        call FreeMemBlock
        mov dword [dword_1174E0], 0
        mov dword [dword_117500], 0
        add esp, byte 4
.6:
        cmp dword [dword_1174FC], byte 0
        je short .7
        push dword [dword_1174FC]
        call FreeMemBlock
        mov dword [dword_1174FC], 0
        mov dword [dword_11751C], 0
        add esp, byte 4
.7:
        cmp dword [dword_1174F8], byte 0
        je short .8
        push dword [dword_1174F8]
        call FreeMemBlock
        mov dword [dword_1174F8], 0
        mov dword [dword_117518], 0
        add esp, byte 4
.8:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; PlayerDbRecord                               1F15E  96 PC, medium confidence
; (offset): pointer into the player table (stats db file 0, dword_1174EC):
; +1, +2 number and position, +3 first name, +13h last name
;-----------------------------------------------------------------------------
PlayerDbRecord:
        push edx
        mov edx, dword [dword_1174EC]
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
        mov eax, dword [dword_1174F0]
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
        mov esi, dword [dword_1174EC]
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
        mov edx, unk_117522
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
        mov esi, dword [dword_1174EC]
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
        mov edx, unk_117522
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
        mov edx, dword [dword_1174F0]
        add eax, edx
        pop edx
        ret
        push edx
        imul eax, byte 63h
        mov edx, dword [dword_1174E8]
        add eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; StatsDb5Record                                  1F2C9  96 PC, low confidence
; (offset): pointer into stats db file 5 (dword_1174E0)
;-----------------------------------------------------------------------------
StatsDb5Record:
        push edx
        mov edx, dword [dword_1174E0]
        add eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; StatsDb1Record                                  1F2D4  96 PC, low confidence
; (offset): pointer into stats db file 1 (dword_1174E4)
;-----------------------------------------------------------------------------
StatsDb1Record:
        push edx
        mov edx, dword [dword_1174E4]
        add eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; StatsDataBBRecord                               1F2DF  96 PC, low confidence
; (offset): pointer into data file 0BBh (dword_1174FC)
;-----------------------------------------------------------------------------
StatsDataBBRecord:
        push edx
        mov edx, dword [dword_1174FC]
        add eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; StatsData4Record                                1F2EA  96 PC, low confidence
; (offset): pointer into data file 4 (dword_1174F8)
;-----------------------------------------------------------------------------
StatsData4Record:
        push edx
        mov edx, dword [dword_1174F8]
        add eax, edx
        pop edx
        ret
;-----------------------------------------------------------------------------
; StatsDb2Record                                  1F2F5  96 PC, low confidence
; (offset): pointer into stats db file 2 (dword_1174F4)
;-----------------------------------------------------------------------------
StatsDb2Record:
        push edx
        mov edx, dword [dword_1174F4]
        add eax, edx
        pop edx
        ret
