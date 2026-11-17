; EA library: DosFileInfo, LoadResourceBlockShared, LoadResourceData, LoadResourceDataShared and 11 more.
bits 32
%include "hockey.inc"
section s_B042C progbits alloc exec nowrite align=1
extern AllocMemLocked, ColourLookup, DosCloseFile, DosOpenReadOnly, FreeMemBlock, InvTabB, InvTabBCenter, InvTabBHi
extern InvTabBInc, InvTabBLo, InvTabBMax, InvTabBMin, InvTabBStep, InvTabCell, InvTabColor, InvTabDist
extern InvTabDistBuf, InvTabDistInc, InvTabDistStart, InvTabFillCount, InvTabFillDist, InvTabFillPtr, InvTabFillStep, InvTabG
extern InvTabGCenter, InvTabGHi, InvTabGInc, InvTabGLo, InvTabGMax, InvTabGMin, InvTabGStep, InvTabOut
extern InvTabPass, InvTabR, InvTabRCenter, InvTabRMax, InvTabRMin, InvTabRow, InvTabRStep, LoadFileCached
extern QuantizeTable, ReadPaletteEntries8, str_Inversetbl, str_Inversetmp
global DosFileInfo, LoadResourceBlockShared, LoadResourceData, LoadResourceData_8, LoadResourceDataShared, LoadFileData, LoadFileDataFlags, InverseTableSlice
global InverseTablePass, InverseTableScan, InverseTableFill, FreeColourLookup, BuildInverseTable, ExpandPalette, BuildInverseFromPalette, CreateColourLookup
        db 00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DosFileInfo                                     B0430  96 PC, low confidence
; Opens a file to learn whether it exists and its size, then closes it
;-----------------------------------------------------------------------------
DosFileInfo:
        sub esp, byte 0Ch
        mov eax, esp
        push eax
        lea eax, [byte esp+08h]
        push eax
        lea eax, [byte esp+010h]
        push eax
        mov edx, dword [byte esp+01Ch]
        push edx
        call DosOpenReadOnly
        add esp, byte 10h
        mov ebx, dword [byte esp+08h]
        push ebx
        call DosCloseFile
        add esp, byte 4
        cmp dword [byte esp+08h], byte 0
        je short .1
        mov dword [byte esp+08h], 1
.1:
        mov eax, dword [byte esp+08h]
        add esp, byte 0Ch
        ret
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; LoadResourceBlockShared                         B0474  96 PC, low confidence
; Loads a resource file in shared mode and returns its memory block
;-----------------------------------------------------------------------------
LoadResourceBlockShared:
        push ebp
        LD mov, ebp, esp
        LD xor, eax, eax
        jmp short LoadResourceData_8
;-----------------------------------------------------------------------------
; LoadResourceData                                B047B  96 PC, low confidence
; Loads a resource file and returns its data pointer
;-----------------------------------------------------------------------------
LoadResourceData:
        push ebp
        LD mov, ebp, esp
        mov eax, 1
LoadResourceData_8:
        push eax
        push dword [byte ebp+0Ch]
        push dword [byte ebp+08h]
        call LoadFileCached
        add esp, byte 0Ch
        leave
        ret
;-----------------------------------------------------------------------------
; LoadResourceDataShared                          B0494  96 PC, low confidence
; Loads a resource file in shared mode and returns its data pointer
;-----------------------------------------------------------------------------
LoadResourceDataShared:
        push ebp
        LD mov, ebp, esp
        mov eax, 1
        jmp short LoadFileDataFlags
;-----------------------------------------------------------------------------
; LoadFileData                                    B049E  96 PC, low confidence
; Loads a file through the cache and returns its data pointer
;-----------------------------------------------------------------------------
LoadFileData:
        push ebp
        LD mov, ebp, esp
        LD xor, eax, eax
        jmp short LoadFileDataFlags
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+010h]
;-----------------------------------------------------------------------------
; LoadFileDataFlags                               B04AB  96 PC, low confidence
; Loads a file through the cache with flags and returns its data pointer
;-----------------------------------------------------------------------------
LoadFileDataFlags:
        push eax
        push dword [byte ebp+0Ch]
        push dword [byte ebp+08h]
        call LoadFileCached
        add esp, byte 0Ch
        LD or, eax, eax
        je short .1
        mov eax, dword [eax]
.1:
        leave
        ret
        jmp near LoadFileCached
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; InverseTableSlice                               B04D0  96 PC, low confidence
; Builds one slice of the inverse colour table
;-----------------------------------------------------------------------------
InverseTableSlice:
        push esi
        push edi
        push ebp
        sub esp, byte 10h
        mov dword [byte esp+04h], eax
        mov dword [esp], edx
        mov dword [byte esp+08h], ecx
        mov eax, 8
        sub eax, ebx
        mov cl, bl
        mov dword [byte esp+0Ch], eax
        mov eax, 1
        mov ebx, 1
        shl eax, cl
        mov cl, byte [byte esp+0Ch]
        mov dword [InvTabOut], eax
        shl ebx, cl
        mov ecx, dword [byte esp+0Ch]
        mov eax, 1
        add ecx, ecx
        shl eax, cl
        mov dword [InvTabDistBuf], eax
        mov eax, dword [InvTabOut]
        mov dword [InvTabCell], eax
        imul eax, eax
        mov dword [InvTabRCenter], eax
        mov eax, dword [InvTabOut]
        mov edx, eax
        imul edx, eax
        imul eax, edx
        mov esi, dword [byte esp+08h]
        test eax, eax
        jle short .2
.1:
        dec eax
        mov dword [esi], 0FFFFFFFFh
        add esi, byte 4
        test eax, eax
        jg short .1
.2:
        xor edx, edx
        mov ecx, dword [byte esp+04h]
        mov dword [InvTabGStep], edx
        test ecx, ecx
        jle near .5
.3:
        mov eax, dword [InvTabGStep]
        cmp byte [dword eax+QuantizeTable], 0
        je near .4
        mov edi, dword [esp]
        shl eax, 2
        add edi, eax
        movzx ebp, byte [byte edi+02h]
        mov cl, byte [byte esp+0Ch]
        mov eax, ebp
        sar eax, cl
        movzx esi, byte [byte edi+01h]
        mov dword [InvTabBMin], eax
        mov eax, esi
        sar eax, cl
        movzx edi, byte [edi]
        mov dword [InvTabColor], eax
        mov eax, edi
        mov edx, ebx
        sar eax, cl
        sar edx, 1Fh
        mov dword [InvTabRMax], eax
        mov eax, ebx
        LD sub, eax, edx
        sar eax, 1
        mov ecx, dword [InvTabBMin]
        imul ecx, ebx
        lea edx, [ecx+eax]
        mov ecx, ebp
        imul ebp, ebx
        sub ecx, edx
        mov edx, dword [InvTabColor]
        imul edx, ebx
        mov dword [InvTabBMax], ecx
        mov ecx, esi
        imul esi, ebx
        add edx, eax
        sub ecx, edx
        mov edx, dword [InvTabRMax]
        imul edx, ebx
        add eax, edx
        mov edx, edi
        imul edi, ebx
        sub edx, eax
        mov eax, ecx
        imul eax, ecx
        mov dword [InvTabGMax], edx
        mov edx, dword [InvTabBMax]
        imul edx, edx
        add edx, eax
        mov eax, dword [InvTabGMax]
        imul eax, eax
        add edx, eax
        mov eax, dword [InvTabBMin]
        mov dword [InvTabGMax], edx
        mov edx, dword [InvTabDistBuf]
        inc eax
        imul eax, edx
        sub eax, ebp
        add eax, eax
        mov dword [InvTabR], eax
        mov eax, dword [InvTabColor]
        inc eax
        imul eax, edx
        sub eax, esi
        add eax, eax
        mov dword [InvTabB], eax
        mov eax, dword [InvTabRMax]
        inc eax
        imul eax, edx
        mov esi, dword [InvTabBMin]
        sub eax, edi
        imul esi, dword [InvTabRCenter]
        mov dword [InvTabRow], ecx
        add eax, eax
        mov ecx, dword [InvTabCell]
        mov dword [InvTabG], eax
        mov eax, dword [InvTabColor]
        imul eax, ecx
        mov ebp, dword [byte esp+08h]
        lea edx, [nosplit esi*4+00h]
        add edx, ebp
        lea edi, [nosplit eax*4+00h]
        add edx, edi
        mov edi, dword [InvTabRMax]
        shl edi, 2
        add edx, edi
        mov edi, dword [byte esp+020h]
        mov dword [InvTabRStep], edx
        add esi, edi
        mov edx, dword [InvTabRMax]
        add eax, esi
        add edx, eax
        mov dword [InvTabRMin], ebx
        mov dword [InvTabBStep], edx
        call InverseTablePass
        mov ebx, dword [InvTabRMin]
.4:
        mov esi, dword [InvTabGStep]
        inc esi
        mov edi, dword [byte esp+04h]
        mov dword [InvTabGStep], esi
        cmp esi, edi
        jl near .3
.5:
        mov dword [InvTabRMin], ebx
        add esp, byte 10h
        pop ebp
        pop edi
        pop esi
        ret 4
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; InverseTablePass                                B06E8  96 PC, low confidence
; Runs one pass of the inverse colour table
;-----------------------------------------------------------------------------
InverseTablePass:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov ecx, dword [InvTabDistBuf]
        mov ebx, dword [InvTabBMin]
        mov eax, dword [InvTabGMax]
        mov esi, dword [InvTabR]
        mov edi, dword [InvTabOut]
        mov dword [InvTabBMax], eax
        mov eax, dword [InvTabRStep]
        xor edx, edx
        mov dword [InvTabDist], eax
        mov eax, dword [InvTabBStep]
        add ecx, ecx
        mov dword [InvTabGCenter], eax
        mov eax, 1
        cmp ebx, edi
        jge near .4
        mov dword [InvTabPass], esi
.1:
        call InverseTableScan
        test eax, eax
        je short .2
        mov edx, 1
        mov esi, dword [InvTabPass]
        jmp short .3
.2:
        mov esi, dword [InvTabPass]
        test edx, edx
        jne short .4
.3:
        mov eax, dword [InvTabRCenter]
        mov ebp, dword [InvTabDist]
        mov edi, dword [InvTabGCenter]
        shl eax, 2
        inc ebx
        add ebp, eax
        mov eax, dword [InvTabRCenter]
        mov dword [InvTabDist], ebp
        add edi, eax
        mov ebp, dword [InvTabBMax]
        mov dword [InvTabGCenter], edi
        add ebp, esi
        xor eax, eax
        mov edi, dword [InvTabOut]
        add esi, ecx
        mov dword [InvTabBMax], ebp
        mov dword [InvTabPass], esi
        cmp ebx, edi
        jl short .1
.4:
        mov esi, dword [InvTabR]
        mov eax, dword [InvTabGMax]
        sub esi, ecx
        mov edi, dword [InvTabRCenter]
        sub eax, esi
        shl edi, 2
        mov dword [InvTabBMax], eax
        mov eax, dword [InvTabRStep]
        mov ebx, dword [InvTabBMin]
        sub eax, edi
        mov ebp, dword [InvTabRCenter]
        mov dword [InvTabDist], eax
        mov eax, dword [InvTabBStep]
        dec ebx
        sub eax, ebp
        mov dword [InvTabPass], esi
        mov dword [InvTabGCenter], eax
        mov eax, 1
        test ebx, ebx
        jl short .8
.5:
        call InverseTableScan
        test eax, eax
        je short .6
        mov edx, 1
        jmp short .7
.6:
        test edx, edx
        jne short .8
.7:
        mov eax, dword [InvTabRCenter]
        mov esi, dword [InvTabDist]
        mov edi, dword [InvTabGCenter]
        mov ebp, dword [InvTabBMax]
        shl eax, 2
        dec ebx
        sub esi, eax
        mov eax, dword [InvTabRCenter]
        mov dword [InvTabDist], esi
        mov esi, dword [InvTabPass]
        sub edi, eax
        sub esi, ecx
        mov dword [InvTabGCenter], edi
        mov dword [InvTabPass], esi
        sub ebp, esi
        mov eax, esi
        mov dword [InvTabBMax], ebp
        xor eax, esi
        test ebx, ebx
        jge short .5
.8:
        mov esi, dword [InvTabPass]
        mov eax, edx
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; InverseTableScan                                B086C  96 PC, low confidence
; Scans the colours for the inverse table
;-----------------------------------------------------------------------------
InverseTableScan:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        mov esi, dword [InvTabDistBuf]
        add esi, esi
        test eax, eax
        je short .1
        mov eax, dword [InvTabColor]
        mov dword [InvTabDistStart], eax
        mov eax, dword [InvTabOut]
        dec eax
        xor ebx, ebx
        mov dword [InvTabBInc], eax
        mov eax, dword [InvTabB]
        mov dword [InvTabDistInc], ebx
        mov dword [InvTabGInc], eax
.1:
        mov ebx, dword [InvTabDistStart]
        mov eax, dword [InvTabBMax]
        mov ecx, dword [InvTabGInc]
        mov dword [InvTabRow], eax
        mov dword [InvTabBLo], eax
        mov eax, dword [InvTabDist]
        mov edi, dword [InvTabBInc]
        mov dword [InvTabGMin], eax
        mov dword [InvTabGHi], eax
        mov eax, dword [InvTabGCenter]
        xor edx, edx
        mov dword [InvTabBCenter], eax
        mov dword [InvTabGLo], eax
        mov eax, 1
        cmp ebx, edi
        jg near .6
        mov dword [InvTabBHi], ecx
.2:
        call InverseTableFill
        test eax, eax
        je short .4
        mov ecx, dword [InvTabBHi]
        test edx, edx
        jne short .5
        cmp ebx, dword [InvTabDistStart]
        jle short .3
        mov eax, dword [InvTabGHi]
        mov dword [InvTabDist], eax
        mov eax, dword [InvTabGLo]
        mov dword [InvTabDistStart], ebx
        mov dword [InvTabGCenter], eax
        mov eax, dword [InvTabBLo]
        mov dword [InvTabGInc], ecx
        mov dword [InvTabBMax], eax
.3:
        mov edx, 1
        jmp short .5
.4:
        mov ecx, dword [InvTabBHi]
        test edx, edx
        jne short .6
.5:
        mov eax, dword [InvTabCell]
        mov ebp, dword [InvTabGMin]
        mov edi, dword [InvTabGHi]
        shl eax, 2
        inc ebx
        add ebp, eax
        add edi, eax
        mov eax, dword [InvTabCell]
        mov dword [InvTabGMin], ebp
        mov dword [InvTabGHi], edi
        mov ebp, dword [InvTabBCenter]
        mov edi, dword [InvTabGLo]
        add ebp, eax
        add edi, eax
        mov dword [InvTabBCenter], ebp
        mov dword [InvTabGLo], edi
        xor eax, eax
        mov ebp, dword [InvTabRow]
        mov edi, dword [InvTabBLo]
        add ebp, ecx
        add edi, ecx
        mov dword [InvTabRow], ebp
        mov dword [InvTabBLo], edi
        add ecx, esi
        mov ebp, dword [InvTabBInc]
        mov dword [InvTabBHi], ecx
        cmp ebx, ebp
        jle near .2
.6:
        mov ebx, dword [InvTabDistStart]
        mov ecx, dword [InvTabGInc]
        mov eax, dword [InvTabBMax]
        sub ecx, esi
        mov edi, dword [InvTabCell]
        sub eax, ecx
        shl edi, 2
        mov dword [InvTabRow], eax
        mov dword [InvTabBLo], eax
        mov eax, dword [InvTabDist]
        mov ebp, dword [InvTabDistInc]
        sub eax, edi
        mov edi, dword [InvTabCell]
        mov dword [InvTabGMin], eax
        mov dword [InvTabGHi], eax
        mov eax, dword [InvTabGCenter]
        dec ebx
        sub eax, edi
        mov dword [InvTabBHi], ecx
        mov dword [InvTabBCenter], eax
        mov dword [InvTabGLo], eax
        mov eax, 1
        cmp ebx, ebp
        jl near .10
.7:
        call InverseTableFill
        test eax, eax
        je short .8
        test edx, edx
        jne short .9
        mov edx, 1
        mov eax, dword [InvTabGHi]
        mov ecx, dword [InvTabBHi]
        mov dword [InvTabDist], eax
        mov eax, dword [InvTabGLo]
        mov dword [InvTabDistStart], ebx
        mov dword [InvTabGCenter], eax
        mov eax, dword [InvTabBLo]
        mov dword [InvTabGInc], ecx
        mov dword [InvTabBMax], eax
        jmp short .9
.8:
        test edx, edx
        jne near .10
.9:
        mov eax, dword [InvTabCell]
        mov ecx, dword [InvTabGMin]
        mov edi, dword [InvTabGHi]
        mov ebp, dword [InvTabBCenter]
        shl eax, 2
        dec ebx
        sub ecx, eax
        sub edi, eax
        mov eax, dword [InvTabCell]
        mov dword [InvTabGMin], ecx
        mov dword [InvTabGHi], edi
        mov ecx, dword [InvTabGLo]
        mov edi, dword [InvTabRow]
        sub ecx, eax
        sub ebp, eax
        mov dword [InvTabGLo], ecx
        mov ecx, dword [InvTabBHi]
        mov dword [InvTabBCenter], ebp
        sub ecx, esi
        mov ebp, dword [InvTabBLo]
        mov dword [InvTabBHi], ecx
        mov eax, ecx
        sub edi, ecx
        sub ebp, ecx
        mov dword [InvTabRow], edi
        mov dword [InvTabBLo], ebp
        mov edi, dword [InvTabDistInc]
        xor eax, ecx
        cmp ebx, edi
        jge near .7
.10:
        mov ecx, dword [InvTabBHi]
        mov eax, edx
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; InverseTableFill                                B0B10  96 PC, low confidence
; Fills the inverse colour table
;-----------------------------------------------------------------------------
InverseTableFill:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        sub esp, byte 10h
        mov edx, dword [InvTabGStep]
        mov ebp, dword [InvTabDistBuf]
        mov dword [byte esp+04h], edx
        add ebp, ebp
        test eax, eax
        je short .1
        mov eax, dword [InvTabRMax]
        mov dword [InvTabFillDist], eax
        mov eax, dword [InvTabOut]
        dec eax
        xor ebx, ebx
        mov dword [InvTabFillCount], eax
        mov eax, dword [InvTabG]
        mov dword [InvTabFillStep], ebx
        mov dword [InvTabFillPtr], eax
.1:
        mov ebx, dword [InvTabFillDist]
        mov eax, dword [InvTabRow]
        mov esi, dword [InvTabFillPtr]
        xor ecx, ecx
        mov edx, dword [InvTabGMin]
        mov dword [esp], ecx
        mov ecx, dword [InvTabFillCount]
        mov edi, dword [InvTabBCenter]
        mov dword [byte esp+0Ch], ecx
        cmp ebx, ecx
        jg short .6
.2:
        cmp eax, dword [edx]
        jae short .4
        cmp ebx, dword [InvTabFillDist]
        jle short .3
        mov dword [InvTabFillDist], ebx
        mov dword [InvTabGMin], edx
        mov dword [InvTabBCenter], edi
        mov dword [InvTabRow], eax
        mov dword [InvTabFillPtr], esi
.3:
        mov dword [esp], 1
        jmp short .6
.4:
        mov ecx, dword [byte esp+0Ch]
        inc ebx
        add edx, byte 4
        inc edi
        add eax, esi
        add esi, ebp
        cmp ebx, ecx
        jle short .2
        jmp short .6
.5:
        cmp eax, dword [edx]
        jae short .7
        mov cl, byte [byte esp+04h]
        inc ebx
        inc edi
        mov dword [edx], eax
        add edx, byte 4
        add eax, esi
        mov byte [byte edi-01h], cl
        add esi, ebp
.6:
        cmp ebx, dword [byte esp+0Ch]
        jle short .5
.7:
        mov ecx, dword [esp]
        mov eax, dword [InvTabFillStep]
        mov esi, dword [InvTabFillDist]
        mov ebx, dword [InvTabFillPtr]
        mov edx, dword [InvTabRow]
        mov edi, dword [InvTabBCenter]
        mov dword [byte esp+08h], eax
        dec esi
        dec edi
        sub ebx, ebp
        mov eax, dword [InvTabGMin]
        sub edx, ebx
        sub eax, byte 4
        test ecx, ecx
        je short .10
        jmp short .12
.8:
        cmp edx, dword [eax]
        jae short .9
        mov ecx, 1
        mov dword [InvTabFillDist], esi
        mov dword [InvTabGMin], eax
        mov dword [InvTabBCenter], edi
        mov dword [InvTabRow], edx
        mov dword [InvTabFillPtr], ebx
        mov dword [esp], ecx
        jmp short .12
.9:
        dec esi
        sub eax, byte 4
        sub ebx, ebp
        dec edi
        sub edx, ebx
.10:
        cmp esi, dword [byte esp+08h]
        jge short .8
        jmp short .12
.11:
        cmp edx, dword [eax]
        jae short .13
        mov cl, byte [byte esp+04h]
        dec esi
        dec edi
        sub ebx, ebp
        mov dword [eax], edx
        sub eax, byte 4
        sub edx, ebx
        mov byte [byte edi+01h], cl
.12:
        cmp esi, dword [byte esp+08h]
        jge short .11
.13:
        mov eax, dword [esp]
        add esp, byte 10h
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        mov ebx, eax
        mov eax, edx
        imul eax, edx
        imul eax, edx
        mov edx, ebx
        test eax, eax
        jle short .15
.14:
        dec eax
        mov dword [edx], 0FFFFFFFFh
        add edx, byte 4
        test eax, eax
        jg short .14
.15:
        pop ebx
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; FreeColourLookup                                B0CA8  96 PC, low confidence
; Frees the 15-bit colour lookup table
;-----------------------------------------------------------------------------
FreeColourLookup:
        push ebx
        push ecx
        push edx
        mov edx, dword [ColourLookup]
        test edx, edx
        je short .1
        push edx
        call FreeMemBlock
        xor ecx, ecx
        add esp, byte 4
        mov dword [ColourLookup], ecx
.1:
        pop edx
        pop ecx
        pop ebx
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; BuildInverseTable                               B0CCC  96 PC, low confidence
; Builds the 15-bit inverse colour table in slices ("inversetbl")
;-----------------------------------------------------------------------------
BuildInverseTable:
        push esi
        push edi
        push ebp
        push byte 0
        push dword 8000h
        push str_Inversetbl
        call AllocMemLocked
        mov edi, eax
        add esp, byte 0Ch
        mov ebp, eax
        test eax, eax
        je short .2
        push byte 0
        push dword 20000h
        push str_Inversetmp
        call AllocMemLocked
        mov esi, eax
        add esp, byte 0Ch
        test eax, eax
        je short .1
        mov ebx, 5
        mov edx, dword [byte esp+010h]
        push edi
        mov ecx, eax
        mov eax, 100h
        call InverseTableSlice
        push esi
        call FreeMemBlock
        add esp, byte 4
        jmp short .2
.1:
        xor ebp, edi
.2:
        mov eax, ebp
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
        push esi
        push edi
        push ebp
        mov edi, dword [byte esp+010h]
        xor esi, esi
        test edi, edi
        jle short .4
        mov ecx, dword [byte esp+018h]
        mov ebx, dword [byte esp+014h]
        mov ebp, 3Fh
.3:
        xor edx, edx
        mov dl, byte [ebx]
        imul edx, dword 0FFh
        mov eax, edx
        sar edx, 1Fh
        idiv ebp
        xor edx, edx
        mov byte [ecx], al
        mov dl, byte [byte ebx+01h]
        imul edx, dword 0FFh
        mov eax, edx
        sar edx, 1Fh
        idiv ebp
        xor edx, edx
        mov byte [byte ecx+01h], al
        mov dl, byte [byte ebx+02h]
        imul edx, dword 0FFh
        mov eax, edx
        sar edx, 1Fh
        idiv ebp
        add ecx, byte 3
        add ebx, byte 3
        inc esi
        mov byte [byte ecx-01h], al
        cmp esi, edi
        jl short .3
.4:
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; ExpandPalette                                   B0D98  96 PC, low confidence
; Converts a 6-bit palette to 8-bit RGBA entries
;-----------------------------------------------------------------------------
ExpandPalette:
        push esi
        push edi
        push ebp
        mov edi, dword [byte esp+010h]
        xor esi, esi
        test edi, edi
        jle short .4
        mov ecx, dword [byte esp+014h]
        mov ebx, dword [byte esp+018h]
        mov ebp, 3Fh
.1:
        cmp esi, 0FFh
        jne short .2
        xor eax, eax
        jmp short .3
.2:
        mov eax, 0FFh
.3:
        xor edx, edx
        mov byte [byte ebx+03h], al
        mov dl, byte [ecx]
        imul edx, dword 0FFh
        mov eax, edx
        sar edx, 1Fh
        idiv ebp
        xor edx, edx
        mov byte [byte ebx+02h], al
        mov dl, byte [byte ecx+01h]
        imul edx, dword 0FFh
        mov eax, edx
        sar edx, 1Fh
        idiv ebp
        xor edx, edx
        mov byte [byte ebx+01h], al
        mov dl, byte [byte ecx+02h]
        imul edx, dword 0FFh
        mov eax, edx
        sar edx, 1Fh
        idiv ebp
        add ebx, byte 4
        add ecx, byte 3
        inc esi
        mov byte [byte ebx-04h], al
        cmp esi, edi
        jl short .1
.4:
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
        push esi
        sub esp, byte 4
        mov esi, dword [byte esp+0Ch]
        xor ebx, ebx
        test esi, esi
        jle short .6
        mov eax, dword [byte esp+014h]
        mov edx, dword [byte esp+010h]
.5:
        xor ecx, ecx
        mov cl, byte [edx]
        sar ecx, 2
        mov dword [esp], ecx
        mov cl, byte [esp]
        mov byte [eax], cl
        xor ecx, ecx
        mov cl, byte [byte edx+01h]
        sar ecx, 2
        mov dword [esp], ecx
        mov cl, byte [esp]
        mov byte [byte eax+01h], cl
        xor ecx, ecx
        add eax, byte 3
        mov cl, byte [byte edx+02h]
        add edx, byte 3
        sar ecx, 2
        inc ebx
        mov byte [byte eax-01h], cl
        cmp ebx, esi
        jl short .5
.6:
        add esp, byte 4
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; BuildInverseFromPalette                         B0E68  96 PC, low confidence
; Converts a palette to 8-bit entries and builds the inverse colour table
; from it
;-----------------------------------------------------------------------------
BuildInverseFromPalette:
        push esi
        push edi
        sub esp, byte 4
        mov esi, dword [byte esp+010h]
        xor ebx, ebx
        test esi, esi
        jle short .4
        mov edx, dword [byte esp+014h]
        mov eax, dword [byte esp+018h]
.1:
        cmp ebx, 0FFh
        jne short .2
        xor edi, edi
        mov dword [esp], edi
        jmp short .3
.2:
        mov dword [esp], 0FFh
.3:
        mov cl, byte [esp]
        mov byte [byte eax+03h], cl
        mov cl, byte [edx]
        mov byte [byte eax+02h], cl
        mov cl, byte [byte edx+01h]
        add edx, byte 3
        mov byte [byte eax+01h], cl
        add eax, byte 4
        mov cl, byte [byte edx-01h]
        inc ebx
        mov byte [byte eax-04h], cl
        cmp ebx, esi
        jl short .1
.4:
        add esp, byte 4
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
        push esi
        sub esp, byte 4
        mov esi, dword [byte esp+0Ch]
        xor ebx, ebx
        test esi, esi
        jle short .6
        mov eax, dword [byte esp+014h]
        mov edx, dword [byte esp+010h]
.5:
        xor ecx, ecx
        mov cl, byte [byte edx+02h]
        sar ecx, 2
        mov dword [esp], ecx
        mov cl, byte [esp]
        mov byte [eax], cl
        xor ecx, ecx
        mov cl, byte [byte edx+01h]
        sar ecx, 2
        mov dword [esp], ecx
        mov cl, byte [esp]
        mov byte [byte eax+01h], cl
        xor ecx, ecx
        mov cl, byte [edx]
        sar ecx, 2
        add eax, byte 3
        mov dword [esp], ecx
        add edx, byte 4
        mov cl, byte [esp]
        inc ebx
        mov byte [byte eax-01h], cl
        cmp ebx, esi
        jl short .5
.6:
        add esp, byte 4
        pop esi
        ret
        db 090h
        push esi
        mov esi, dword [byte esp+08h]
        xor ebx, ebx
        test esi, esi
        jle short .8
        mov eax, dword [byte esp+010h]
        mov edx, dword [byte esp+0Ch]
.7:
        mov cl, byte [byte edx+02h]
        mov byte [eax], cl
        mov cl, byte [byte edx+01h]
        add edx, byte 4
        mov byte [byte eax+01h], cl
        add eax, byte 3
        mov cl, byte [byte edx-04h]
        inc ebx
        mov byte [byte eax-01h], cl
        cmp ebx, esi
        jl short .7
.8:
        pop esi
        ret
        db 08Dh,040h,00h
        sub esp, 400h
        mov eax, esp
        push eax
        mov edx, dword [dword esp+0408h]
        push edx
        push dword 100h
        call BuildInverseFromPalette
        add esp, byte 0Ch
        mov eax, esp
        push eax
        call BuildInverseTable
        add esp, byte 4
        add esp, 400h
        ret
;-----------------------------------------------------------------------------
; CreateColourLookup                              B0F7C  96 PC, low confidence
; Builds the 15-bit colour lookup table for the current palette
;-----------------------------------------------------------------------------
CreateColourLookup:
        sub esp, 400h
        mov eax, esp
        push eax
        mov edx, dword [dword esp+0408h]
        push edx
        push dword 100h
        call ExpandPalette
        add esp, byte 0Ch
        mov eax, esp
        push eax
        call BuildInverseTable
        add esp, byte 4
        add esp, 400h
        ret
        push esi
        sub esp, 400h
        mov edx, dword [ColourLookup]
        xor esi, esi
        test edx, edx
        je short .1
        push edx
        call FreeMemBlock
        add esp, byte 4
        mov dword [ColourLookup], esi
.1:
        mov eax, esp
        push eax
        push dword 100h
        push byte 0
        call ReadPaletteEntries8
        add esp, byte 0Ch
        mov eax, esp
        push eax
        call BuildInverseTable
        add esp, byte 4
        mov dword [ColourLookup], eax
        test eax, eax
        je short .2
        mov esi, 1
.2:
        mov eax, esi
        add esp, 400h
        pop esi
        ret
