; Player sprite art: the sprite banks (fight.ref, total.ref, oldshp.qfs, cup.ref), the UNPACK frame cache, team palettes, jersey colours and numbers (96 PC).
bits 32
%include "hockey.inc"
extern TeamRosterPtrs
section s_61AD1 progbits alloc exec nowrite align=1
extern JerseyDigitWidths, PlayerSpritesLoaded, SpriteFileHandles, FightSpritesLoaded, SpriteMemBlock, SpritesLoaded, SpriteCacheOn, SpriteCacheMem
extern NearClipZ, dword_123AC0, SpriteArtPtrs, SpriteCacheLinks, SpriteCache, SpriteCachePtr, SpriteCacheFree, SpriteCacheUsed
extern SpriteCacheBlock, SpriteCacheSize, PlayerSpriteFile, PlayerSpriteCount, RinkSpriteFile, NetSpriteFile, MarkerSpriteFile, gameopts
extern GameSpriteNames, str_CupRef, str_FightRef, str_NewpalQfs, str_OldshpQfs, str_OLDSHPQFS2, str_Pal6, str_RinkpalQfs
extern str_TeampalQda, str_TotalRef, str_UNPACK, str_Unpacked, SelectDataLibrary, LoadShadowRemap, AllocMemBlock, FreeMemBlock
extern MemLargestFreeLocked, UnpackTo, UnpackedSize, OpenArtArchiveErr, CreateAaPalLut, BuildPaletteShadeTable, LoadPackedAlloc, FlipArtHorizontal
extern ShapeBankCount, ShapeBankEntry, FindShape, bcopy, FillMem, TeamPaletteBuf, SpriteCacheHead
extern JerseyColorMap, RinkColorMap, TeamPaletteSave, HomeJerseyPal, AwayJerseyPal, SpriteColorRanges, unpack
global PutJerseyDigit, MakeJerseyNumber, SetTeamJerseyColors, SetTeamJerseyColors_A3, SaveTeamPalette, SetPlayerSpriteColors, SetRinkSpriteColors, IndexSpriteFrames
global LoadTeamPalette, LoadPlayerSprites, LoadPlayerSprites_131, LoadGameSprites, FreeGameSprites, FreeFightSprites, LoadFightSprites, LoadFightSprites_3F
global LoadFightSprites_4C, FreeTotalSprites, LoadTotalSprites, LoadCupSprites, FreeSpriteCache, GetSpriteFrame, SpriteScale
;-----------------------------------------------------------------------------
; PutJerseyDigit                               61AD1  96 PC, medium confidence
; (dest, digit): copies a 3x5 digit (JerseyDigitWidths) into a jersey number image
;-----------------------------------------------------------------------------
PutJerseyDigit:
        push ebx
        push ecx
        push esi
        push edi
        mov ebx, eax
        mov edi, 3
        xor ecx, ecx
        imul esi, edx, byte 0Fh
.1:
        mov al, byte [dword esi+JerseyDigitWidths]
        mov byte [ebx], al
        mov eax, ecx
        cdq
        idiv edi
        cmp edx, byte 2
        jne short .2
        add ebx, byte 4
.2:
        inc esi
        inc ecx
        inc ebx
        cmp ecx, byte 0Fh
        jl short .1
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; MakeJerseyNumber                             61B03  96 PC, medium confidence
; (dest, number 0-63h): builds the jersey number image (one or two digits)
;-----------------------------------------------------------------------------
MakeJerseyNumber:
        push ebx
        push ecx
        push esi
        push edi
        mov edi, eax
        mov esi, edx
        push byte 1
        push byte 23h
        push eax
        call FillMem
        add esp, byte 0Ch
        test esi, esi
        jl short .7
        cmp esi, byte 63h
        jg short .7
        cmp esi, byte 0Ah
        jge short .1
        lea eax, [byte edi+02h]
        mov edx, esi
        jmp short .6
.1:
        cmp esi, byte 13h
        jg short .2
        mov eax, 0Ah
        jmp short .3
.2:
        mov eax, esi
        mov ebx, 0Ah
        cdq
        idiv ebx
.3:
        mov edx, eax
        mov eax, edi
        call PutJerseyDigit
        cmp esi, byte 0Bh
        jne short .4
        mov edx, 0Ah
        jmp short .5
.4:
        mov eax, esi
        mov ebx, 0Ah
        cdq
        idiv ebx
.5:
        lea eax, [byte edi+04h]
.6:
        call PutJerseyDigit
.7:
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SetTeamJerseyColors                             61B6F  96 PC, low confidence
; (palette, team): the team's jersey colour ranges (JerseyColorMap, 120h per
; team)
;-----------------------------------------------------------------------------
SetTeamJerseyColors:
        push ebx
        push ecx
        push esi
        push edi
        enter 18h, 0
        imul edi, edx, dword 120h
        add edi, JerseyColorMap
        lea ebx, [dword edi+090h]
        mov dword [byte ebp-018h], eax
        mov dword [byte ebp-014h], ebx
        test edx, edx
        je short .1
        mov eax, AwayJerseyPal
        jmp short .2
.1:
        mov eax, HomeJerseyPal
.2:
        mov dword [byte ebp-0Ch], eax
        imul eax, edx, byte 48h
        mov ebx, 0A0h
        mov ecx, 5
        add eax, RinkColorMap
        mov dword [byte ebp-04h], edi
        lea edx, [byte eax+024h]
        xor esi, esi
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-08h], eax
.3:
        mov eax, ebx
        shl eax, 2
        add eax, dword [byte ebp-018h]
        mov edi, dword [byte ebp-04h]
        mov edx, dword [eax]
        mov dword [edi], edx
        mov edx, ecx
        shl edx, 2
        add edx, dword [byte ebp-014h]
        mov eax, dword [eax]
        mov dword [edx], eax
        mov eax, dword [byte ebp-0Ch]
        mov edi, dword [byte ebp-08h]
        mov dl, byte [ebx+eax]
        mov byte [edi], dl
        mov edi, dword [byte ebp-010h]
        mov eax, esi
        mov byte [ecx+edi], dl
        mov edi, 6
        cdq
        idiv edi
        cmp edx, byte 5
        jne short .4
        add ebx, byte 0Ah
        add ecx, byte 0Ch
.4:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], byte 4
        inc esi
        inc ebx
        dec ecx
        cmp esi, byte 24h
        jl short .3
SetTeamJerseyColors_A3:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; SaveTeamPalette                                 61C18  96 PC, low confidence
; (palette, team): copies the team's sprite colours from the palette
;-----------------------------------------------------------------------------
SaveTeamPalette:
        push ebx
        push ecx
        push esi
        push edi
        enter 0Ch, 0
        imul edx, dword 120h
        mov ecx, TeamPaletteSave
        mov edi, 0A0h
        mov ebx, 5
        add ecx, edx
        mov dword [byte ebp-08h], eax
        lea edx, [dword ecx+090h]
        xor esi, esi
        mov dword [byte ebp-0Ch], edx
.1:
        mov eax, edi
        shl eax, 2
        add eax, dword [byte ebp-08h]
        mov edx, dword [eax]
        mov dword [ecx], edx
        mov edx, ebx
        shl edx, 2
        mov dword [byte ebp-04h], edx
        mov edx, dword [byte ebp-0Ch]
        add edx, dword [byte ebp-04h]
        mov eax, dword [eax]
        mov dword [byte ebp-04h], 6
        mov dword [edx], eax
        mov eax, esi
        cdq
        idiv dword [byte ebp-04h]
        cmp edx, byte 5
        jne short .2
        add edi, byte 0Ah
        add ebx, byte 0Ch
.2:
        add ecx, byte 4
        inc esi
        inc edi
        dec ebx
        cmp esi, byte 24h
        jl short .1
        jmp short SetTeamJerseyColors_A3
;-----------------------------------------------------------------------------
; SetPlayerSpriteColors                        61C88  96 PC, medium confidence
; (palette, player): team colours and the jersey number for one player sprite
;-----------------------------------------------------------------------------
SetPlayerSpriteColors:
        push esi
        push edi
        enter 8, 0
        push ebx
        push ecx
        mov ebx, SpriteColorRanges
        mov edi, 0A0h
        mov dword [byte ebp-08h], eax
        mov ecx, edx
        xor esi, esi
.1:
        mov eax, edi
        shl eax, 2
        add eax, dword [byte ebp-08h]
        mov edx, dword [ecx]
        mov dword [eax], edx
        mov eax, esi
        mov dword [byte ebp-04h], 6
        cdq
        idiv dword [byte ebp-04h]
        cmp edx, byte 5
        jne short .2
        add edi, byte 0Ah
.2:
        add ecx, byte 4
        inc esi
        inc edi
        cmp esi, byte 24h
        jl short .1
        mov edx, dword [byte ebp-0Ch]
        mov eax, SpriteColorRanges
        mov ecx, 0B6h
        call MakeJerseyNumber
        cmp dword [byte ebp-010h], byte 0
        je short .3
        add ebx, byte 6
.3:
        xor esi, esi
.4:
        movsx eax, byte [ebx]
        mov edi, ecx
        shl eax, 2
        shl edi, 2
        add eax, dword [byte ebp-08h]
        add edi, dword [byte ebp-08h]
        mov eax, dword [eax]
        mov dword [edi], eax
        mov eax, esi
        mov edi, 7
        cdq
        idiv edi
        cmp edx, byte 6
        jne short .5
        add ecx, byte 9
        cmp dword [byte ebp-010h], byte 0
        je short .5
        add ebx, byte 0Eh
.5:
        cmp dword [byte ebp-010h], byte 0
        je short .6
        dec ebx
        jmp short .7
.6:
        inc ebx
.7:
        inc esi
        inc ecx
        cmp esi, byte 23h
        jl short .4
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; SetRinkSpriteColors                             61D2E  96 PC, low confidence
; The sprite colours for DrawRinkSprite
;-----------------------------------------------------------------------------
SetRinkSpriteColors:
        push esi
        push edi
        enter 0Ch, 0
        push eax
        push ebx
        mov esi, ecx
        imul eax, edx, byte 48h
        imul edx, ecx, byte 24h
        mov ebx, SpriteColorRanges
        mov edi, 0A0h
        add eax, RinkColorMap
        mov dword [byte ebp-08h], 0
        add eax, edx
        mov ecx, dword [byte ebp-010h]
        mov dword [byte ebp-0Ch], eax
.1:
        mov eax, dword [byte ebp-0Ch]
        mov edx, dword [byte ebp-010h]
        mov al, byte [eax]
        mov byte [edx+edi], al
        mov eax, dword [byte ebp-08h]
        mov dword [byte ebp-04h], 6
        cdq
        idiv dword [byte ebp-04h]
        cmp edx, byte 5
        jne short .2
        add edi, byte 0Ah
.2:
        inc dword [byte ebp-0Ch]
        inc dword [byte ebp-08h]
        inc edi
        cmp dword [byte ebp-08h], byte 24h
        jl short .1
        mov edx, dword [byte ebp-014h]
        mov eax, SpriteColorRanges
        call MakeJerseyNumber
        add ecx, 0B6h
        test esi, esi
        je short .3
        add ebx, byte 6
.3:
        xor edi, edi
.4:
        movsx eax, byte [ebx]
        add eax, dword [byte ebp-010h]
        mov al, byte [eax]
        mov byte [ecx], al
        mov eax, edi
        mov dword [byte ebp-04h], 7
        cdq
        idiv dword [byte ebp-04h]
        inc ecx
        cmp edx, byte 6
        jne short .5
        add ecx, byte 9
        test esi, esi
        je short .5
        add ebx, byte 0Eh
.5:
        test esi, esi
        je short .6
        dec ebx
        jmp short .7
.6:
        inc ebx
.7:
        inc edi
        cmp edi, byte 23h
        jl short .4
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; IndexSpriteFrames                               61DDF  96 PC, low confidence
; (bank): reads the frame table of a sprite bank (SpriteFileHandles) into
; SpriteArtPtrs and the largest frame
;-----------------------------------------------------------------------------
IndexSpriteFrames:
        push ebx
        push ecx
        push esi
        push edi
        enter 8, 0
        push edx
        mov esi, eax
        shl esi, 2
        push dword [dword esi+SpriteFileHandles]
        xor edi, edi
        call ShapeBankCount
        mov dword [byte ebp-08h], esi
        mov esi, dword [byte ebp-0Ch]
        add esp, byte 4
        mov dword [byte ebp-04h], eax
        shl esi, 2
        jmp short .3
.1:
        mov eax, dword [byte ebp-08h]
        push edi
        push dword [dword eax+SpriteFileHandles]
        call ShapeBankEntry
        add esp, byte 8
        mov dword [dword esi+SpriteArtPtrs], eax
        add eax, byte 10h
        push eax
        inc dword [byte ebp-0Ch]
        add esi, byte 4
        call UnpackedSize
        add eax, byte 10h
        add esp, byte 4
        cmp eax, dword [PlayerSpriteCount]
        jle short .2
        mov dword [PlayerSpriteCount], eax
.2:
        inc edi
.3:
        cmp edi, dword [byte ebp-04h]
        jl short .1
        mov eax, dword [byte ebp-04h]
        jmp near SetTeamJerseyColors_A3
;-----------------------------------------------------------------------------
; LoadTeamPalette                              61E53  96 PC, medium confidence
; (team, ...): reads the team's colours from teampal.qda
;-----------------------------------------------------------------------------
LoadTeamPalette:
        push ebx
        push ecx
        push esi
        push edi
        enter 310h, 0
        mov esi, eax
        mov dword [byte ebp-08h], edx
        push byte 0
        push str_TeampalQda
        call LoadPackedAlloc
        mov dword [byte ebp-010h], eax
        mov dword [byte ebp-0Ch], eax
        mov eax, esi
        shl eax, 2
        add eax, dword [byte ebp-010h]
        mov edx, dword [byte ebp-010h]
        add edx, dword [eax]
        lea edi, [dword ebp-0310h]
        movsx ebx, byte [edx]
        add esp, byte 8
        lea ebx, [ebx+ebx*2]
        inc edx
        mov ecx, ebx
        mov esi, edx
        rep movsb
        mov ecx, 100h
        mov edi, HomeJerseyPal
        lea esi, [edx+ebx]
        rep movsb
        mov eax, dword [byte ebp-08h]
        shl eax, 2
        add eax, dword [byte ebp-010h]
        mov edx, dword [byte ebp-010h]
        add edx, dword [eax]
        mov dword [byte ebp-04h], ebx
        lea edi, [dword ebp-0310h]
        movsx ebx, byte [edx]
        add edi, dword [byte ebp-04h]
        lea ebx, [ebx+ebx*2]
        inc edx
        mov ecx, ebx
        mov esi, edx
        rep movsb
        mov ecx, 100h
        mov edi, AwayJerseyPal
        lea esi, [edx+ebx]
        rep movsb
        mov eax, dword [byte ebp-04h]
        mov ecx, 3
        cdq
        idiv ecx
        mov ecx, eax
        mov eax, AwayJerseyPal
        lea esi, [dword eax+0FFh]
.1:
        movzx edx, byte [eax]
        cmp edx, 0C4h
        jl short .2
        add edx, ecx
        mov dword [byte ebp-010h], edx
        mov dl, byte [byte ebp-010h]
        mov byte [eax], dl
.2:
        inc eax
        cmp eax, esi
        jne short .1
        mov ecx, dword [byte ebp-04h]
        lea esi, [dword ebp-0310h]
        mov edi, TeamPaletteBuf
        add ecx, ebx
        rep movsb
        push dword [byte ebp-0Ch]
        call FreeMemBlock
        add esp, byte 4
        jmp near SetTeamJerseyColors_A3
;-----------------------------------------------------------------------------
; LoadPlayerSprites                            61F2E  96 PC, medium confidence
; Loads the player sprite banks fight.ref, total.ref and oldshp.qfs once
;-----------------------------------------------------------------------------
LoadPlayerSprites:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov edi, eax
        cmp dword [PlayerSpritesLoaded], byte 0
        jne near LoadPlayerSprites_131
        mov eax, 0FFFFFFFFh
        call SelectDataLibrary
        push byte 0
        push str_FightRef
        call OpenArtArchiveErr
        add esp, byte 8
        push byte 0
        push str_TotalRef
        mov dword [FightSpritesLoaded], eax
        call OpenArtArchiveErr
        add esp, byte 8
        push byte 0
        push str_OldshpQfs
        mov dword [SpriteFileHandles], eax
        call OpenArtArchiveErr
        add esp, byte 8
        push byte 20h
        push eax
        mov esi, eax
        call UnpackedSize
        add esp, byte 4
        push eax
        push str_OLDSHPQFS2
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push eax
        push esi
        mov dword [SpriteMemBlock], eax
        call unpack
        add esp, byte 0Ch
        push esi
        call FreeMemBlock
        add esp, byte 4
        xor edx, edx
        xor eax, eax
        mov dword [PlayerSpriteCount], 0
        call IndexSpriteFrames
        mov esi, eax
        mov edx, eax
        mov eax, 1
        call IndexSpriteFrames
        lea edx, [esi+eax]
        mov eax, 2
        add edx, 298h
        call IndexSpriteFrames
        push byte 20h
        push dword [PlayerSpriteCount]
        push str_Unpacked
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        push str_RinkpalQfs
        mov dword [PlayerSpriteFile], eax
        call LoadPackedAlloc
        mov esi, eax
        add esp, byte 8
        push str_Pal6
        push eax
        call FindShape
        mov ebx, 20h
        add esp, byte 8
        mov edx, MarkerSpriteFile
        add eax, byte 10h
        call CreateAaPalLut
        push esi
        call FreeMemBlock
        add esp, byte 4
        xor eax, eax
        call SelectDataLibrary
        test edi, edi
        je short .1
        mov dword [SpritesLoaded], 1
.1:
        mov dword [PlayerSpritesLoaded], 1
LoadPlayerSprites_131:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadGameSprites                              62065  96 PC, medium confidence
; For InitGameView: the player sprites, newpal.qfs and both teams' palettes
; and jersey colours
;-----------------------------------------------------------------------------
LoadGameSprites:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        xor eax, eax
        call LoadPlayerSprites
        mov eax, dword [gameopts]
        mov edi, dword [byte eax+01h]
        shl edi, 0Fh
        mov eax, dword [byte eax+01h]
        shr edi, 1Bh
        shl eax, 0Ah
        lea esi, [edi+edi]
        shr eax, 1Bh
        cmp edi, byte 1Bh
        jne short .1
        dec esi
.1:
        mov dword [byte ebp-04h], esi
        lea esi, [eax+eax]
        cmp eax, byte 1Ah
        je short .3
        cmp eax, byte 1Bh
        jne short .2
        dec esi
        jmp short .3
.2:
        inc esi
.3:
        mov eax, 0FFFFFFFFh
        call SelectDataLibrary
        push byte 0
        push str_NewpalQfs
        call LoadPackedAlloc
        add esp, byte 8
        mov edi, eax
        mov eax, dword [byte ebp-04h]
        push dword [nosplit eax*4+GameSpriteNames]
        push edi
        call FindShape
        mov ebx, 20h
        add esp, byte 8
        mov edx, NetSpriteFile
        add eax, byte 10h
        call CreateAaPalLut
        push dword [nosplit esi*4+GameSpriteNames]
        push edi
        call FindShape
        mov ebx, 20h
        add esp, byte 8
        mov edx, RinkSpriteFile
        add eax, byte 10h
        call CreateAaPalLut
        push edi
        call FreeMemBlock
        add esp, byte 4
        mov eax, dword [byte ebp-04h]
        mov edx, esi
        call LoadTeamPalette
        mov eax, dword [NetSpriteFile]
        xor edx, edx
        call SetTeamJerseyColors
        mov edx, 1
        mov eax, dword [RinkSpriteFile]
        call SetTeamJerseyColors
        xor eax, eax
        call SelectDataLibrary
        mov eax, TeamRosterPtrs+320h
        call BuildPaletteShadeTable
        mov eax, TeamRosterPtrs+320h
        call LoadShadowRemap
        leave
        jmp near LoadPlayerSprites_131
;-----------------------------------------------------------------------------
; FreeGameSprites                              6215A  96 PC, medium confidence
; From EndGameCleanup: frees the sprite banks
;-----------------------------------------------------------------------------
FreeGameSprites:
        push ebx
        push ecx
        push edx
        push esi
        cmp dword [SpritesLoaded], byte 0
        jne short .3
        xor esi, esi
.1:
        cmp dword [dword esi+SpriteFileHandles], byte 0
        je short .2
        push dword [dword esi+SpriteFileHandles]
        call FreeMemBlock
        add esp, byte 4
        mov dword [dword esi+SpriteFileHandles], 0
.2:
        add esi, byte 4
        cmp esi, byte 0Ch
        jne short .1
        push dword [PlayerSpriteFile]
        call FreeMemBlock
        add esp, byte 4
        push dword [MarkerSpriteFile]
        call FreeMemBlock
        mov dword [PlayerSpritesLoaded], 0
        add esp, byte 4
.3:
        push dword [NetSpriteFile]
        call FreeMemBlock
        add esp, byte 4
        push dword [RinkSpriteFile]
        call FreeMemBlock
        add esp, byte 4
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FreeFightSprites                             621D9  96 PC, medium confidence
; Frees the fight sprite bank (FightSpritesLoaded)
;-----------------------------------------------------------------------------
FreeFightSprites:
        push ebx
        push ecx
        push edx
        cmp dword [FightSpritesLoaded], byte 0
        je short .1
        push dword [FightSpritesLoaded]
        call FreeMemBlock
        add esp, byte 4
.1:
        mov dword [FightSpritesLoaded], 0
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadFightSprites                             62201  96 PC, medium confidence
; Loads fight.ref into FightSpritesLoaded
;-----------------------------------------------------------------------------
LoadFightSprites:
        push ebx
        push ecx
        push edx
        cmp dword [FightSpritesLoaded], byte 0
        je short .1
        push dword [FightSpritesLoaded]
        call FreeMemBlock
        add esp, byte 4
.1:
        mov eax, 0FFFFFFFFh
        mov dword [FightSpritesLoaded], 0
        call SelectDataLibrary
        push byte 0
        push str_FightRef
        call OpenArtArchiveErr
        mov edx, 0B0Dh
LoadFightSprites_3F:
        add esp, byte 8
        mov dword [FightSpritesLoaded], eax
        mov eax, 1
LoadFightSprites_4C:
        call IndexSpriteFrames
        xor eax, eax
        call SelectDataLibrary
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; FreeTotalSprites                             6225D  96 PC, medium confidence
; Frees total.ref (SpriteFileHandles)
;-----------------------------------------------------------------------------
FreeTotalSprites:
        push ebx
        push ecx
        push edx
        cmp dword [SpriteFileHandles], byte 0
        je short .1
        push dword [SpriteFileHandles]
        call FreeMemBlock
        add esp, byte 4
.1:
        mov dword [SpriteFileHandles], 0
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; LoadTotalSprites                             62285  96 PC, medium confidence
; Loads total.ref into SpriteFileHandles
;-----------------------------------------------------------------------------
LoadTotalSprites:
        push ebx
        push ecx
        push edx
        cmp dword [SpriteFileHandles], byte 0
        je short .1
        push dword [SpriteFileHandles]
        call FreeMemBlock
        add esp, byte 4
.1:
        mov eax, 0FFFFFFFFh
        mov dword [SpriteFileHandles], 0
        call SelectDataLibrary
        push byte 0
        push str_TotalRef
        call OpenArtArchiveErr
        add esp, byte 8
        mov dword [SpriteFileHandles], eax
        xor edx, edx
        xor eax, eax
        jmp short LoadFightSprites_4C
;-----------------------------------------------------------------------------
; LoadCupSprites                               622CD  96 PC, medium confidence
; Loads cup.ref (the cup presentation) into the FightSpritesLoaded slot
;-----------------------------------------------------------------------------
LoadCupSprites:
        push ebx
        push ecx
        push edx
        cmp dword [FightSpritesLoaded], byte 0
        je short .1
        push dword [FightSpritesLoaded]
        call FreeMemBlock
        add esp, byte 4
.1:
        mov eax, 0FFFFFFFFh
        mov dword [FightSpritesLoaded], 0
        call SelectDataLibrary
        push byte 0
        push str_CupRef
        call OpenArtArchiveErr
        mov edx, 0C41h
        jmp near LoadFightSprites_3F
;-----------------------------------------------------------------------------
; FreeSpriteCache                              62311  96 PC, medium confidence
; Frees the UNPACK sprite cache
;-----------------------------------------------------------------------------
FreeSpriteCache:
        push ebx
        push ecx
        push edx
        cmp dword [SpriteCacheMem], byte 0
        je short .1
        push dword [SpriteCacheMem]
        call FreeMemBlock
        mov dword [SpriteCacheMem], 0
        add esp, byte 4
.1:
        mov dword [SpriteCacheBlock], 0
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; GetSpriteFrame                               62343  96 PC, medium confidence
; (bank, frame): a sprite frame from the UNPACK cache (sized by free memory,
; 2010h a frame), unpacking it on a miss
;-----------------------------------------------------------------------------
GetSpriteFrame:
        push ebx
        push ecx
        push esi
        push edi
        enter 4, 0
        mov edi, eax
        mov dword [byte ebp-04h], edx
        cmp dword [SpriteCacheBlock], byte 0
        jne near .4
        call MemLargestFreeLocked
        sub eax, 6000h
        mov ebx, 2010h
        cdq
        idiv ebx
        cmp eax, 100h
        jle short .1
        mov eax, 100h
.1:
        mov dword [SpriteCacheSize], eax
        imul eax, dword 2010h
        push byte 0
        push eax
        push str_UNPACK
        xor esi, esi
        call AllocMemBlock
        mov ebx, SpriteCacheHead
        add esp, byte 0Ch
        mov dword [SpriteCacheMem], eax
        xor edx, edx
        jmp short .3
.2:
        imul eax, esi, byte 14h
        mov ecx, dword [SpriteCacheMem]
        add ecx, edx
        add ebx, byte 14h
        add edx, 2010h
        mov dword [dword eax+SpriteCache], ebx
        inc esi
        mov dword [dword eax+SpriteCacheLinks], ecx
.3:
        cmp esi, dword [SpriteCacheSize]
        jl short .2
        mov eax, dword [SpriteCacheSize]
        dec eax
        imul eax, byte 14h
        mov dword [SpriteCacheUsed], 0
        mov dword [SpriteCacheFree], 0
        mov dword [SpriteCachePtr], SpriteCacheHead
        mov dword [SpriteCacheBlock], 1
        mov dword [dword eax+SpriteCache], 0
.4:
        cmp dword [SpriteCacheOn], byte 0
        je short .5
        movsx eax, word [byte edi+04h]
        movsx edx, word [byte edi+06h]
        imul eax, edx
        cmp eax, 2000h
        jle short .7
.5:
        push byte 10h
        push dword [PlayerSpriteFile]
        push edi
        call bcopy
        mov eax, dword [PlayerSpriteFile]
        add esp, byte 0Ch
        add eax, byte 10h
        push eax
        add edi, byte 10h
        push edi
        call UnpackTo
        mov eax, dword [PlayerSpriteFile]
        add esp, byte 8
        and dword [eax], 0FFh
        cmp dword [byte ebp-04h], byte 0
        je short .6
        push dword [PlayerSpriteFile]
        call FlipArtHorizontal
        add esp, byte 4
.6:
        mov eax, dword [PlayerSpriteFile]
        jmp near SetTeamJerseyColors_A3
.7:
        mov eax, dword [SpriteCacheFree]
.8:
        test eax, eax
        je near .15
        cmp edi, dword [eax]
        jne short .14
        mov edx, dword [byte eax+010h]
        cmp edx, dword [byte ebp-04h]
        jne short .14
        cmp eax, dword [SpriteCacheFree]
        je short .13
        cmp eax, dword [SpriteCacheUsed]
        jne short .9
        mov edx, dword [byte eax+0Ch]
        mov dword [SpriteCacheUsed], edx
        mov dword [byte edx+08h], 0
        jmp short .10
.9:
        mov edx, dword [byte eax+08h]
        mov ebx, dword [byte eax+0Ch]
        mov dword [byte edx+0Ch], ebx
        mov edx, ebx
        mov ebx, dword [byte eax+08h]
        mov dword [byte edx+08h], ebx
.10:
        mov edx, dword [SpriteCacheFree]
        mov dword [byte eax+08h], edx
        test edx, edx
        je short .11
        mov dword [byte edx+0Ch], eax
        jmp short .12
.11:
        mov dword [SpriteCacheUsed], eax
.12:
        mov dword [byte eax+0Ch], 0
        mov dword [SpriteCacheFree], eax
.13:
        mov eax, dword [byte eax+04h]
        jmp near SetTeamJerseyColors_A3
.14:
        mov eax, dword [byte eax+08h]
        jmp short .8
.15:
        cmp dword [SpriteCachePtr], byte 0
        je short .16
        mov esi, dword [SpriteCachePtr]
        mov eax, dword [byte esi+08h]
        mov dword [SpriteCachePtr], eax
        jmp short .18
.16:
        mov esi, dword [SpriteCacheUsed]
        cmp esi, esi
        jne short .17
        mov eax, dword [byte esi+0Ch]
        mov dword [SpriteCacheUsed], eax
        mov dword [byte eax+08h], 0
        jmp short .18
.17:
        mov eax, dword [byte esi+08h]
        mov edx, dword [byte esi+0Ch]
        mov dword [byte eax+0Ch], edx
        mov eax, dword [SpriteCacheUsed]
        mov edx, dword [byte eax+0Ch]
        mov eax, dword [byte eax+08h]
        mov dword [byte edx+08h], eax
.18:
        mov eax, dword [SpriteCacheFree]
        mov dword [byte esi+08h], eax
        test eax, eax
        je short .19
        mov dword [byte eax+0Ch], esi
        jmp short .20
.19:
        mov dword [SpriteCacheUsed], esi
.20:
        mov dword [byte esi+0Ch], 0
        push byte 10h
        mov dword [SpriteCacheFree], esi
        mov eax, dword [byte ebp-04h]
        push dword [byte esi+04h]
        mov dword [esi], edi
        push edi
        mov dword [byte esi+010h], eax
        call bcopy
        mov eax, dword [byte esi+04h]
        add esp, byte 0Ch
        add eax, byte 10h
        push eax
        add edi, byte 10h
        push edi
        call UnpackTo
        mov eax, dword [byte esi+04h]
        add esp, byte 8
        and dword [eax], 0FFh
        cmp dword [byte ebp-04h], byte 0
        je short .21
        push dword [byte esi+04h]
        call FlipArtHorizontal
        add esp, byte 4
.21:
        mov eax, dword [byte esi+04h]
        jmp near SetTeamJerseyColors_A3
;-----------------------------------------------------------------------------
; SpriteScale                                     625AA  96 PC, low confidence
; (distance): the sprite scale shift for a distance (0 past NearClipZ)
;-----------------------------------------------------------------------------
SpriteScale:
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+08h]
        cmp eax, dword [NearClipZ]
        jg short .1
        xor eax, eax
        pop ebp
        ret
.1:
        xor ecx, ecx
        cmp eax, 10000h
        jl short .2
        mov ecx, 8
        sar eax, 8
.2:
        cmp eax, 1000h
        jl short .3
        sar eax, 4
        add ecx, byte 4
.3:
        cmp eax, 400h
        jl short .4
        sar eax, 2
        inc ecx
        inc ecx
.4:
        mov edx, eax
        mov eax, dword [dword_123AC0]
        shl edx, 2
        mov eax, dword [edx+eax]
        sar eax, cl
        pop ebp
        ret
