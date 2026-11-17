; EA library: GrabLargestBlock, InitMemoryPool, InitMemoryPoolDefault, SetupMemoryPool.
bits 32
%include "hockey.inc"
section s_B2CD9 progbits alloc exec nowrite align=1
extern _nexpand_, _nfree_, _nmalloc_, _nmsize_, AddHighMemRegion, AddMemRegion, AddMemRegions, DefaultRowTable
extern FatalError, InitMemDescriptors, int386_, KbdPeekKey, MemFreeBytes, MemFreeStart, MemListEnd, MemLock
extern MemLockHandle, MemPoolBase, MemPoolSize, MemPoolTop, MemUnlock, ResetMemLock, RowTable, RowTableCount
extern RowTableSize, str_InitmemmanDOSMEMORYNOTALLOCA, str_InitmemmanDOSSUBMEMORYNO, str_InitmemmanDOSSUBMEMORYNOTALL, str_InitmemmanINSUFFICIENTROW, str_InitmemmanTOOMUCHDOSALLOCATE, TrimMemList
global GrabLargestBlock, InitMemoryPool, InitMemoryPoolDefault, SetupMemoryPool
        db 00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; GrabLargestBlock                                B2CE0  96 PC, low confidence
; Allocates the largest block the memory manager gives, trying smaller sizes
;-----------------------------------------------------------------------------
GrabLargestBlock:
        mov edx, dword [byte esp+04h]
        test edx, edx
        jne short .1
        mov edx, 4000000h
.1:
        mov eax, edx
        call _nmalloc_
        mov ebx, eax
        test eax, eax
        jne short .2
        sub edx, 10000h
        test edx, edx
        jge short .1
.2:
        test ebx, ebx
        jne short .3
        xor eax, eax
        ret
.3:
        mov edx, 4000000h
        mov eax, ebx
        call _nexpand_
        mov eax, ebx
        call _nmsize_
        mov edx, eax
        mov eax, ebx
        call _nfree_
        mov eax, edx
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; InitMemoryPool                                  B2D2C  96 PC, low confidence
; Sets up the game's memory pool from DOS extender memory
;-----------------------------------------------------------------------------
InitMemoryPool:
        push esi
        push edi
        push ebp
        sub esp, byte 44h
        mov ebp, dword [byte esp+054h]
        mov esi, dword [byte esp+05Ch]
        call ResetMemLock
        push eax
        mov dword [MemLockHandle], eax
        call MemLock
        add esp, byte 4
        mov edx, dword [byte esp+058h]
        test edx, edx
        je short .2
        lea eax, [edx+esi]
        push eax
        call GrabLargestBlock
        add esp, byte 4
        mov edx, eax
        mov ebx, dword [byte esp+058h]
        sub edx, esi
        cmp edx, ebx
        jle short .1
        mov edx, ebx
.1:
        mov eax, edx
        jmp short .3
.2:
        push edx
        call GrabLargestBlock
        sub eax, esi
        add esp, byte 4
        mov edx, eax
.3:
        and al, 0F0h
        call _nmalloc_
        mov dword [MemPoolBase], eax
        mov eax, dword [MemPoolBase]
        add eax, edx
        mov ecx, dword [RowTable]
        mov dword [MemPoolTop], eax
        test ecx, ecx
        jne short .4
        mov dword [RowTable], DefaultRowTable
.4:
        cmp dword [RowTableCount], 0CCh
        jge short .5
        push str_InitmemmanINSUFFICIENTROW
        call FatalError
        add esp, byte 4
.5:
        mov edx, dword [RowTableCount]
        mov eax, dword [RowTable]
        shl edx, 2
        lea ebx, [eax+edx]
        mov edx, dword [RowTableCount]
        lea edi, [nosplit ebp*4+00h]
        sub edx, byte 2
        push ebp
        mov dword [eax], edx
        mov edx, dword [MemPoolBase]
        push edx
        mov dword [byte eax+04h], 0
        mov dword [RowTableSize], ebx
        call InitMemDescriptors
        add esp, byte 8
        push byte 0
        add edi, ebp
        push byte 10h
        shl edi, 3
        push byte 10h
        mov ebx, dword [MemPoolTop]
        mov eax, dword [MemPoolBase]
        push ebx
        add eax, edi
        push eax
        push byte 0
        call AddMemRegion
        mov ebp, dword [MemPoolTop]
        mov ecx, dword [MemPoolBase]
        add esp, byte 18h
        sub ebp, ecx
        mov edi, dword [byte esp+064h]
        mov dword [byte esp+040h], ebp
        test edi, edi
        jne short .6
        mov dword [byte esp+064h], 8000h
.6:
        mov edx, 100h
        mov ebx, 0C000h
        mov eax, 31h
        mov word [esp], dx
        mov word [byte esp+04h], bx
        lea ebx, [byte esp+01Ch]
        mov edx, esp
        call int386_
        cmp dword [byte esp+034h], byte 0
        jne short .7
        push str_InitmemmanTOOMUCHDOSALLOCATE
        call FatalError
        add esp, byte 4
.7:
        xor eax, eax
        mov ecx, 100h
        mov ax, word [byte esp+020h]
        mov ebx, dword [byte esp+064h]
        shl eax, 4
        mov word [esp], cx
        sub eax, ebx
        mov ecx, dword [byte esp+060h]
        mov dword [MemPoolSize], eax
        test ecx, ecx
        je short .8
        cmp eax, ecx
        jle short .8
        mov dword [MemPoolSize], ecx
.8:
        mov eax, dword [MemPoolSize]
        test eax, eax
        jg short .9
        xor eax, eax
        mov ax, word [byte esp+020h]
        shl eax, 4
        mov dword [byte esp+064h], eax
        jmp short .11
.9:
        lea ebx, [byte esp+01Ch]
        sar eax, 4
        mov edx, esp
        mov word [byte esp+04h], ax
        mov eax, 31h
        call int386_
        cmp dword [byte esp+034h], byte 0
        je short .10
        xor eax, eax
        mov ax, word [byte esp+020h]
        shl eax, 4
        push eax
        mov ebx, dword [MemPoolSize]
        push ebx
        push str_InitmemmanDOSMEMORYNOTALLOCA
        call FatalError
        add esp, byte 0Ch
.10:
        xor eax, eax
        mov ax, word [byte esp+01Ch]
        shl eax, 4
        mov dword [byte esp+038h], eax
        xor eax, eax
        mov ax, word [byte esp+020h]
        shl eax, 4
        mov dword [MemPoolSize], eax
.11:
        cmp dword [byte esp+064h], byte 0
        je near .13
        mov edi, 100h
        mov eax, 0C000h
        lea ebx, [byte esp+01Ch]
        mov edx, esp
        mov word [byte esp+04h], ax
        mov eax, 31h
        mov word [esp], di
        call int386_
        mov eax, dword [byte esp+020h]
        dec eax
        mov word [byte esp+04h], ax
        xor eax, eax
        lea ebx, [byte esp+01Ch]
        mov ax, word [byte esp+04h]
        mov edx, esp
        mov dword [byte esp+064h], eax
        mov eax, 31h
        mov word [esp], di
        call int386_
        cmp dword [byte esp+034h], byte 0
        je short .12
        xor eax, eax
        mov ax, word [byte esp+020h]
        shl eax, 4
        push eax
        mov eax, dword [byte esp+068h]
        shl eax, 4
        push eax
        push str_InitmemmanDOSSUBMEMORYNOTALL
        call FatalError
        add esp, byte 0Ch
.12:
        xor eax, eax
        mov ax, word [byte esp+028h]
        mov dword [byte esp+03Ch], eax
.13:
        xor edi, edi
.14:
        mov eax, dword [byte esp+058h]
        push eax
        call GrabLargestBlock
        and al, 0F0h
        add esp, byte 4
        mov edx, eax
        cmp eax, 2710h
        jl short .15
        call _nmalloc_
        mov ebx, dword [byte esp+040h]
        add ebp, edx
        add ebx, edx
        add edx, eax
        push edx
        push eax
        push byte 0
        inc edi
        mov dword [byte esp+04Ch], ebx
        call AddHighMemRegion
        add esp, byte 0Ch
        cmp edi, byte 10h
        jl short .14
.15:
        mov ecx, dword [byte esp+058h]
        test ecx, ecx
        je short .16
        mov eax, dword [byte esp+040h]
        cmp eax, ecx
        jle short .16
        sub eax, ecx
        cmp eax, esi
        jle short .16
        mov esi, eax
.16:
        sub ebp, esi
        test esi, esi
        jle short .18
        xor edi, edi
.17:
        push edi
        call MemListEnd
        add esp, byte 4
        test eax, eax
        je short .18
        call _nfree_
        push edi
        call TrimMemList
        sub esi, eax
        add esp, byte 4
        test esi, esi
        jg short .17
.18:
        neg esi
        cmp esi, 2710h
        jle short .19
        mov eax, esi
        call _nmalloc_
        add esi, eax
        push esi
        push eax
        push byte 0
        call AddHighMemRegion
        add esp, byte 0Ch
.19:
        mov ebx, dword [MemPoolSize]
        test ebx, ebx
        jle short .20
        push byte 0
        push byte 10h
        mov eax, dword [byte esp+040h]
        push byte 10h
        add eax, ebx
        push eax
        mov edi, dword [byte esp+048h]
        push edi
        push dword 200h
        push byte 0
        add ebp, ebx
        call AddMemRegions
        add esp, byte 1Ch
.20:
        cmp dword [byte esp+064h], byte 0
        je short .21
        mov ebx, 101h
        mov eax, dword [byte esp+03Ch]
        mov edx, esp
        mov word [esp], bx
        mov word [byte esp+0Ch], ax
        lea ebx, [byte esp+01Ch]
        mov eax, 31h
        call int386_
        cmp dword [byte esp+034h], byte 0
        je short .21
        push str_InitmemmanDOSSUBMEMORYNO
        call FatalError
        add esp, byte 4
.21:
        mov ecx, dword [MemLockHandle]
        mov ebx, 0A0000h
        push ecx
        mov dword [MemFreeBytes], ebp
        mov dword [MemFreeStart], ebx
        call MemUnlock
        add esp, byte 4
        mov eax, ebp
        add esp, byte 44h
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; InitMemoryPoolDefault                           B30E4  96 PC, low confidence
; Sets up the memory pool with the default size
;-----------------------------------------------------------------------------
InitMemoryPoolDefault:
        push byte 0
        push byte 0
        push byte 0
        push dword 0F42400h
        mov edx, dword [byte esp+014h]
        push edx
        call InitMemoryPool
        add esp, byte 14h
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; SetupMemoryPool                                 B3100  96 PC, low confidence
; Sets up the memory pool through InitMemoryPool
;-----------------------------------------------------------------------------
SetupMemoryPool:
        push byte 0
        mov edx, dword [byte esp+010h]
        push edx
        push byte 0
        mov ebx, dword [byte esp+014h]
        push ebx
        mov ecx, dword [byte esp+014h]
        push ecx
        call InitMemoryPool
        add esp, byte 14h
        ret
        mov edx, dword [byte esp+0Ch]
        push edx
        push byte 0
        mov ebx, dword [byte esp+010h]
        push ebx
        push byte 0
        mov ecx, dword [byte esp+014h]
        push ecx
        call InitMemoryPool
        add esp, byte 14h
        ret
        or byte [0417h], 20h
        call KbdPeekKey
        ret
