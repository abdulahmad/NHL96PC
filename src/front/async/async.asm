; EA async file reader: request queue, read rate, timer (EA library, names from its debug messages).
bits 32
%include "hockey.inc"
section s_1B807 progbits alloc exec nowrite align=1
extern addtimer, AsyncTicks, AsyncQueueTail, AsyncRequests, AsyncCurFile, AsyncCurOffset, AsyncFreeList, AsyncCurRequest
extern AsyncCdFile, AsyncOpenFile, AsyncMemFlags, AsyncState, AsyncFileHandle, AsyncBytesLeft, AsyncFileStart, AsyncFileSize
extern AsyncDestBlock, AsyncReqUser, AsyncSkip, AsyncDestPos, AsyncBudget, AsyncStreamFile, AsyncWaitTimer
extern AsyncTicksPerRead, AsyncReadResult, AsyncMeasuredSpeed, AsyncReadTime, AsyncBytesRead, AsyncBaseTicks, FatalError, openhandle
extern SetTickDeadline, str_ASYNC, str_ASYNCFILE, str_AsyncreaderNOFILESPECIFI, str_AsyncreaderNOFILESPECIFI2, str_AsyncreaderNOFILESPECIFI3, str_GetasyncblockDNOASYNCBLO, str_SetasyncspeedSFILEISTOOS
extern str_SetasyncspeedSFILEISTOOS2, strcmp_, strncpy_, RemoveTimerCallback, AllocMemBlockLockedChecked, AllocMemBlock, FreeMemBlock, PushMemDescriptorLocked
extern CdOpenStream, CdHandleEntry, CdCloseFile, CdRead, CdSeek, TicksSinceLast, DosCloseFile, DosReadFile
extern DosSeekFile, AsyncHeader, WaitTickDeadline
global setasyncspeed, setasyncspeed_ret, AsyncInit, AsyncClose, AsyncRequestOpen, AsyncRequestSection, AsyncCancelRequest, jpt_1BE62
global asyncreader, asyncreader_B, asyncreader_34D, asyncreader_3EF, asyncreader_614, AsyncTimerTick, AsyncTimerTick_45, AsyncRequestDone
global getasyncblock
;-----------------------------------------------------------------------------
; setasyncspeed                                                   1B807  96 PC
; EA async reader: measures the read speed of two files (time to read up to
; 4A3E8h bytes) for the async read rate; name from its debug message
;-----------------------------------------------------------------------------
setasyncspeed:
        push esi
        push edi
        enter 20h, 0
        lea eax, [byte ebp-014h]
        push eax
        lea eax, [byte ebp-01Ch]
        push eax
        lea eax, [byte ebp-0Ch]
        push eax
        push dword [byte ebp+010h]
        call openhandle
        add esp, byte 10h
        lea eax, [byte ebp-018h]
        push eax
        lea eax, [byte ebp-020h]
        push eax
        lea eax, [byte ebp-010h]
        push eax
        push dword [byte ebp+014h]
        call openhandle
        add esp, byte 10h
        cmp dword [byte ebp-014h], 4A000h
        jle short .1
        mov dword [byte ebp-014h], 4A3E8h
.1:
        cmp dword [byte ebp-014h], 4A3E8h
        jge short .2
        push dword [byte ebp+010h]
        push str_SetasyncspeedSFILEISTOOS
        call FatalError
        add esp, byte 8
.2:
        mov eax, dword [AsyncFileHandle]
        inc eax
        cmp eax, dword [byte ebp-018h]
        jle short .3
        push dword [byte ebp+014h]
        push str_SetasyncspeedSFILEISTOOS2
        call FatalError
        add esp, byte 8
.3:
        push byte 0
        push dword [byte ebp-014h]
        push str_ASYNC
        call AllocMemBlock
        mov esi, eax
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-018h]
        add esp, byte 0Ch
        dec eax
        push eax
        push dword [byte ebp-010h]
        call DosSeekFile
        add esp, byte 8
        push byte 1
        push esi
        push dword [byte ebp-010h]
        call DosReadFile
        add esp, byte 0Ch
        push byte 32h
        call SetTickDeadline
        add esp, byte 4
        call WaitTickDeadline
        call TicksSinceLast
        push byte 1
        push esi
        push dword [byte ebp-0Ch]
        call DosReadFile
        add esp, byte 0Ch
        call TicksSinceLast
        mov esi, dword [byte ebp-014h]
        mov edi, eax
        dec esi
.4:
        test esi, esi
        jle short .7
        cmp esi, 2000h
        jle short .5
        mov dword [byte ebp-08h], 2000h
        jmp short .6
.5:
        mov dword [byte ebp-08h], esi
.6:
        push dword [byte ebp-08h]
        push dword [byte ebp-04h]
        push dword [byte ebp-0Ch]
        sub esi, dword [byte ebp-08h]
        call DosReadFile
        add esp, byte 0Ch
        jmp short .4
.7:
        call TicksSinceLast
        imul eax, byte 0Ah
        shl eax, 10h
        mov esi, 493E0h
        cdq
        idiv esi
        mov dword [AsyncStreamFile], eax
        mov dword [AsyncMeasuredSpeed], eax
        cmp eax, 0DAh
        jle short .8
        mov dword [AsyncStreamFile], 0DAh
.8:
        cmp dword [AsyncStreamFile], byte 0
        jg short .9
        mov dword [AsyncStreamFile], 1
.9:
        mov edx, dword [AsyncStreamFile]
        mov eax, dword [AsyncFileHandle]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        push byte 32h
        mov dword [AsyncWaitTimer], eax
        call SetTickDeadline
        add esp, byte 4
        call WaitTickDeadline
        call TicksSinceLast
        mov eax, dword [byte ebp-018h]
        dec eax
        push eax
        push dword [byte ebp-010h]
        call DosSeekFile
        add esp, byte 8
        push byte 1
        push dword [byte ebp-04h]
        push dword [byte ebp-010h]
        call DosReadFile
        add esp, byte 0Ch
        call TicksSinceLast
        cmp eax, edi
        jle short .10
        mov edi, eax
.10:
        imul eax, edi, byte 0Ah
        push dword [byte ebp-0Ch]
        mov dword [AsyncTicksPerRead], eax
        mov dword [AsyncBaseTicks], eax
        call DosCloseFile
        add esp, byte 4
        push dword [byte ebp-010h]
        call DosCloseFile
        add esp, byte 4
        push dword [byte ebp-04h]
        call FreeMemBlock
        mov eax, 3E80000h
        cdq
        add esp, byte 4
        idiv dword [AsyncStreamFile]
setasyncspeed_ret:
        leave
        pop edi
        pop esi
        ret
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+08h]
        mov edx, dword [byte ebp+08h]
        mov dword [AsyncStreamFile], eax
        mov eax, dword [AsyncFileHandle]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [AsyncWaitTimer], eax
        mov eax, dword [byte ebp+0Ch]
        mov dword [AsyncTicksPerRead], eax
        pop ebp
        ret
        mov edx, 0DAh
        mov eax, dword [AsyncFileHandle]
        mov dword [AsyncStreamFile], 0DAh
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [AsyncTicksPerRead], 12Ch
        mov dword [AsyncWaitTimer], eax
        ret
;-----------------------------------------------------------------------------
; AsyncInit                                    1BA4D  96 PC, medium confidence
; EA async reader: allocates the ASYNC FILE request blocks (0ABh bytes each,
; free list), sets the read rate, starts AsyncTimerTick
;-----------------------------------------------------------------------------
AsyncInit:
        push esi
        push ebp
        mov ebp, esp
        imul eax, dword [byte ebp+0Ch], dword 0ABh
        push dword [byte ebp+014h]
        push eax
        push str_ASYNCFILE
        call AllocMemBlock
        mov ecx, dword [byte ebp+0Ch]
        mov edx, eax
        add esp, byte 0Ch
        mov dword [AsyncRequests], eax
        mov dword [AsyncFreeList], eax
        lea ebx, [byte ecx-01h]
        xor edx, eax
        jmp short .2
.1:
        lea esi, [dword eax+0ABh]
        inc edx
        mov dword [dword eax+0A7h], esi
        mov eax, esi
.2:
        cmp edx, ebx
        jl short .1
        mov dword [dword eax+0A7h], 0
        mov dword [AsyncState], 1
        mov eax, dword [byte ebp+010h]
        mov dword [AsyncCdFile], 0FFFFFFFFh
        mov dword [AsyncOpenFile], 0FFFFFFFFh
        and eax, 0FFFF800h
        mov dword [AsyncQueueTail], ecx
        mov dword [AsyncFileHandle], eax
        cmp dword [AsyncStreamFile], byte 0
        jne short .3
        mov dword [AsyncStreamFile], 0DAh
        mov dword [AsyncTicksPerRead], 12Ch
.3:
        mov eax, dword [byte ebp+010h]
        mov edx, dword [AsyncStreamFile]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        push AsyncTimerTick
        mov dword [AsyncBudget], 0
        mov dword [AsyncWaitTimer], eax
        call addtimer
        add esp, byte 4
        pop ebp
        pop esi
        ret
;-----------------------------------------------------------------------------
; AsyncClose                                   1BB20  96 PC, medium confidence
; EA async reader: stops AsyncTimerTick, closes its files and frees the
; request blocks
;-----------------------------------------------------------------------------
AsyncClose:
        push edi
        push AsyncTimerTick
        call RemoveTimerCallback
        add esp, byte 4
        cmp dword [AsyncOpenFile], byte 0
        jl short .1
        push dword [AsyncOpenFile]
        call CdCloseFile
        add esp, byte 4
.1:
        cmp dword [AsyncCdFile], byte 0
        jl short .2
        push dword [AsyncCdFile]
        call CdCloseFile
        add esp, byte 4
.2:
        push dword [AsyncRequests]
        mov edi, AsyncRequests
        call FreeMemBlock
        add esp, byte 4
        mov ecx, 54h
        xor eax, eax
        rep stosb
        pop edi
        ret
        push esi
        push ebp
        mov ebp, esp
        call getasyncblock
        mov ebx, 8Fh
        mov edx, dword [byte ebp+0Ch]
        mov ecx, eax
        mov esi, eax
        call strncpy_
        mov dword [dword ecx+08Fh], 0
        mov dword [dword ecx+0A3h], 0
        mov dword [dword ecx+0A7h], 0
        mov eax, dword [byte ebp+010h]
        mov dword [dword ecx+093h], 2
        mov dword [dword ecx+097h], eax
        cmp dword [AsyncCurOffset], byte 0
        je short .3
        mov eax, dword [AsyncCurOffset]
        mov dword [dword eax+0A7h], ecx
        mov dword [AsyncCurOffset], ecx
        mov eax, esi
        pop ebp
        pop esi
        ret
.3:
        mov dword [AsyncCurOffset], ecx
        mov dword [AsyncCurFile], ecx
        mov eax, esi
        pop ebp
        pop esi
        ret
        push esi
        push ebp
        mov ebp, esp
        call getasyncblock
        mov ebx, 8Fh
        mov edx, dword [byte ebp+0Ch]
        mov ecx, eax
        mov esi, eax
        call strncpy_
        mov dword [dword ecx+097h], 0
        mov dword [dword ecx+08Fh], 0
        mov dword [dword ecx+0A3h], 0
        mov dword [dword ecx+0A7h], 0
        mov eax, dword [byte ebp+010h]
        mov dword [dword ecx+093h], 4
        mov dword [dword ecx+09Fh], eax
        cmp dword [AsyncCurOffset], byte 0
        je short .4
        mov eax, dword [AsyncCurOffset]
        mov dword [dword eax+0A7h], ecx
        mov dword [AsyncCurOffset], ecx
        mov eax, esi
        pop ebp
        pop esi
        ret
.4:
        mov dword [AsyncCurOffset], ecx
        mov dword [AsyncCurFile], ecx
        mov eax, esi
        pop ebp
        pop esi
        ret
;-----------------------------------------------------------------------------
; AsyncRequestOpen                                1BC7A  96 PC, low confidence
; EA async reader: queues a type 3 request (open a file by name)
;-----------------------------------------------------------------------------
AsyncRequestOpen:
        push ebp
        mov ebp, esp
        call getasyncblock
        mov ebx, 8Fh
        mov edx, dword [byte ebp+08h]
        mov ecx, eax
        call strncpy_
        mov dword [dword ecx+08Fh], 0FFFFFFFFh
        mov dword [dword ecx+093h], 3
        mov dword [dword ecx+0A3h], 0
        mov dword [dword ecx+097h], 0
        mov dword [dword ecx+0A7h], 0
        cmp dword [AsyncCurOffset], byte 0
        je short .1
        mov eax, dword [AsyncCurOffset]
        mov dword [dword eax+0A7h], ecx
        mov dword [AsyncCurOffset], ecx
        pop ebp
        ret
.1:
        mov dword [AsyncCurOffset], ecx
        mov dword [AsyncCurFile], ecx
        pop ebp
        ret
        push esi
        push ebp
        mov ebp, esp
        call getasyncblock
        mov ebx, 8Fh
        mov edx, dword [byte ebp+0Ch]
        mov ecx, eax
        mov esi, eax
        call strncpy_
        mov dword [dword ecx+0A3h], 0
        mov dword [dword ecx+093h], 1
        mov eax, dword [byte ebp+014h]
        mov dword [dword ecx+0A7h], 0
        mov dword [dword ecx+097h], eax
        mov eax, dword [byte ebp+010h]
        mov dword [dword ecx+08Fh], eax
        cmp dword [AsyncCurOffset], byte 0
        je short .2
        mov eax, dword [AsyncCurOffset]
        mov dword [dword eax+0A7h], ecx
        mov dword [AsyncCurOffset], ecx
        mov eax, esi
        pop ebp
        pop esi
        ret
.2:
        mov dword [AsyncCurOffset], ecx
        mov dword [AsyncCurFile], ecx
        mov eax, esi
        pop ebp
        pop esi
        ret
;-----------------------------------------------------------------------------
; AsyncRequestSection                          1BD67  96 PC, medium confidence
; EA async reader: queues a type 5 request (a section read, "NO FILE
; SPECIFIED FOR SECTION READ" when no file is open)
;-----------------------------------------------------------------------------
AsyncRequestSection:
        push ebp
        mov ebp, esp
        call getasyncblock
        mov dword [dword eax+097h], 0
        mov dword [dword eax+0A3h], 0
        mov dword [dword eax+093h], 5
        mov edx, dword [byte ebp+0Ch]
        mov dword [dword eax+0A7h], 0
        mov dword [dword eax+09Fh], edx
        mov edx, dword [byte ebp+08h]
        mov dword [dword eax+08Fh], edx
        mov edx, dword [byte ebp+010h]
        mov dword [dword eax+09Bh], edx
        mov ebx, eax
        cmp dword [AsyncCurOffset], byte 0
        je short .1
        mov edx, dword [AsyncCurOffset]
        mov dword [dword edx+0A7h], eax
        mov dword [AsyncCurOffset], eax
        mov eax, ebx
        pop ebp
        ret
.1:
        mov dword [AsyncCurOffset], eax
        mov dword [AsyncCurFile], eax
        mov eax, ebx
        pop ebp
        ret
        push ebp
        mov ebp, esp
        call getasyncblock
        mov dword [dword eax+097h], 0
        mov dword [dword eax+0A3h], 0
        mov dword [dword eax+093h], 6
        mov edx, dword [byte ebp+08h]
        mov dword [dword eax+0A7h], 0
        mov dword [dword eax+09Fh], edx
        mov edx, dword [byte ebp+0Ch]
        mov dword [dword eax+09Bh], edx
        mov ebx, eax
        cmp dword [AsyncCurOffset], byte 0
        je short .2
        mov edx, dword [AsyncCurOffset]
        mov dword [dword edx+0A7h], eax
        mov dword [AsyncCurOffset], eax
        mov eax, ebx
        pop ebp
        ret
.2:
        mov dword [AsyncCurOffset], eax
        mov dword [AsyncCurFile], eax
        mov eax, ebx
        pop ebp
        ret
;-----------------------------------------------------------------------------
; AsyncCancelRequest                              1BE50  96 PC, low confidence
; Marks a request's destination -1 (dropped when it comes up)
;-----------------------------------------------------------------------------
AsyncCancelRequest:
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+08h]
        mov dword [dword eax+097h], 0FFFFFFFFh
        pop ebp
        ret
jpt_1BE62:
        dd asyncreader_B
        dd asyncreader_34D
        dd asyncreader_3EF
        dd asyncreader_614
;-----------------------------------------------------------------------------
; asyncreader                                                     1BE72  96 PC
; EA async reader: works through the request queue a piece at a time (open,
; chunk, section and handle reads); name from its debug messages
;-----------------------------------------------------------------------------
asyncreader:
        push esi
        push edi
        enter 4, 0
        jmp near asyncreader_3EF.29
asyncreader_B:
        mov dword [AsyncBudget], 0
        cmp dword [AsyncCurFile], byte 0
        je near setasyncspeed_ret
        mov esi, dword [AsyncCurFile]
        mov eax, dword [dword esi+0A7h]
        mov dword [AsyncCurFile], eax
        mov dword [AsyncCurRequest], esi
        test eax, eax
        jne short .1
        mov dword [AsyncCurOffset], eax
.1:
        cmp dword [dword esi+097h], byte 0FFFFFFFFh
        jne short .3
        inc dword [AsyncQueueTail]
.2:
        mov eax, dword [AsyncFreeList]
        mov dword [dword esi+0A7h], eax
        mov dword [AsyncFreeList], esi
        jmp near asyncreader_3EF.29
.3:
        cmp dword [dword esi+093h], byte 3
        jne near .6
        mov eax, dword [AsyncOpenFile]
        mov dword [AsyncCdFile], eax
        test eax, eax
        jl short .4
        push eax
        call CdHandleEntry
        add esp, byte 4
        mov edx, eax
        mov eax, esi
        call strcmp_
        test eax, eax
        je short .4
        push dword [AsyncOpenFile]
        call CdCloseFile
        mov dword [AsyncOpenFile], 0FFFFFFFFh
        add esp, byte 4
.4:
        cmp dword [AsyncOpenFile], byte 0
        jge short .5
        lea eax, [byte ebp-04h]
        push eax
        push AsyncFileSize
        push AsyncFileStart
        push AsyncCdFile
        push esi
        call CdOpenStream
        add esp, byte 14h
.5:
        mov eax, dword [AsyncCdFile]
        inc dword [AsyncQueueTail]
        mov dword [AsyncOpenFile], eax
        jmp near .2
.6:
        cmp dword [dword esi+093h], byte 2
        jne near .9
        lea eax, [byte ebp-04h]
        push eax
        push AsyncFileSize
        push AsyncFileStart
        push AsyncCdFile
        push esi
        call CdOpenStream
        add esp, byte 14h
        cmp dword [AsyncFileStart], byte 0
        je short .7
        push dword [AsyncFileStart]
        push dword [AsyncCdFile]
        call CdSeek
        add esp, byte 8
        mov dword [AsyncSkip], eax
        jmp short .8
.7:
        mov dword [AsyncSkip], 0
.8:
        push dword [dword esi+097h]
        push dword [AsyncFileSize]
        push esi
        call AllocMemBlockLockedChecked
        mov dword [AsyncDestBlock], eax
        mov eax, dword [AsyncFileSize]
        mov dword [AsyncState], 3
        mov dword [AsyncBytesLeft], eax
        mov eax, dword [AsyncTicksPerRead]
        add esp, byte 0Ch
        mov dword [AsyncBudget], eax
        jmp near .20
.9:
        cmp dword [dword esi+093h], byte 1
        jne short .12
        cmp dword [AsyncOpenFile], byte 0
        jge short .10
        push str_AsyncreaderNOFILESPECIFI
        call FatalError
        add esp, byte 4
.10:
        mov eax, dword [dword esi+08Fh]
        add eax, dword [AsyncFileStart]
        push eax
        push dword [AsyncOpenFile]
        call CdSeek
        mov dword [AsyncSkip], eax
        mov eax, dword [AsyncOpenFile]
        mov dword [AsyncCdFile], eax
        mov eax, dword [AsyncTicksPerRead]
        mov dword [AsyncBudget], eax
        add esp, byte 8
        mov eax, dword [dword esi+097h]
        mov dword [AsyncState], 2
.11:
        mov dword [AsyncMemFlags], eax
        jmp near .20
.12:
        cmp dword [dword esi+093h], byte 4
        jne near .15
        lea eax, [byte ebp-04h]
        push eax
        push AsyncFileSize
        push AsyncFileStart
        push AsyncCdFile
        push esi
        call CdOpenStream
        add esp, byte 14h
        cmp dword [AsyncFileStart], byte 0
        je short .13
        push dword [AsyncFileStart]
        push dword [AsyncCdFile]
        call CdSeek
        add esp, byte 8
        mov dword [AsyncSkip], eax
        jmp short .14
.13:
        mov dword [AsyncSkip], 0
.14:
        mov eax, dword [dword esi+09Fh]
        mov dword [AsyncReqUser], eax
        mov eax, dword [AsyncFileSize]
        mov dword [AsyncBytesLeft], eax
        mov eax, dword [AsyncTicksPerRead]
        mov dword [AsyncState], 4
        mov dword [AsyncBudget], eax
        mov eax, dword [dword esi+097h]
        jmp near .11
.15:
        cmp dword [dword esi+093h], byte 5
        jne short .17
        cmp dword [AsyncOpenFile], byte 0
        jge short .16
        push str_AsyncreaderNOFILESPECIFI2
        call FatalError
        add esp, byte 4
.16:
        mov eax, dword [dword esi+08Fh]
        add eax, dword [AsyncFileStart]
        push eax
        push dword [AsyncOpenFile]
        call CdSeek
        mov dword [AsyncSkip], eax
        mov eax, dword [dword esi+09Fh]
        mov dword [AsyncReqUser], eax
        mov eax, dword [AsyncOpenFile]
        mov dword [AsyncCdFile], eax
        mov eax, dword [AsyncTicksPerRead]
        mov dword [AsyncBudget], eax
        mov eax, dword [dword esi+097h]
        mov dword [AsyncMemFlags], eax
        add esp, byte 8
        jmp short .19
.17:
        cmp dword [dword esi+093h], byte 6
        jne short .20
        cmp dword [AsyncOpenFile], byte 0
        jge short .18
        push str_AsyncreaderNOFILESPECIFI3
        call FatalError
        add esp, byte 4
.18:
        mov eax, dword [dword esi+09Fh]
        mov dword [AsyncReqUser], eax
        mov eax, dword [AsyncOpenFile]
        mov dword [AsyncCdFile], eax
        mov eax, dword [AsyncTicksPerRead]
        mov dword [AsyncBudget], eax
        mov eax, dword [dword esi+097h]
        mov dword [AsyncMemFlags], eax
.19:
        mov eax, dword [dword esi+09Bh]
        mov dword [AsyncState], 4
        mov dword [AsyncBytesLeft], eax
.20:
        mov dword [AsyncDestPos], 0
        leave
        pop edi
        pop esi
        ret
asyncreader_34D:
        mov eax, dword [AsyncCurRequest]
        cmp dword [dword eax+097h], byte 0FFFFFFFFh
        jne short .21
        mov dword [AsyncCdFile], 0FFFFFFFFh
        inc dword [AsyncQueueTail]
        mov esi, dword [AsyncFreeList]
        mov dword [dword eax+0A7h], esi
        mov dword [AsyncState], 1
        mov dword [AsyncFreeList], eax
        jmp near asyncreader_3EF.29
.21:
        push byte 8
        push AsyncHeader
        push dword [AsyncOpenFile]
        mov dword [AsyncTicks], 0
        call CdRead
        mov eax, dword [AsyncTicks]
        add esp, byte 0Ch
        mov dword [AsyncReadResult], eax
        mov eax, dword [AsyncHeader+4]
        push dword [AsyncMemFlags]
        sub eax, byte 8
        push eax
        push dword [AsyncCurRequest]
        mov dword [AsyncBytesLeft], eax
        call AllocMemBlockLockedChecked
        mov dword [AsyncDestPos], 0
        mov dword [AsyncState], 3
        add esp, byte 0Ch
        mov dword [AsyncDestBlock], eax
asyncreader_3EF:
        cmp dword [AsyncBytesLeft], byte 0
        jle near .26
        mov eax, dword [AsyncCurRequest]
        cmp dword [dword eax+097h], byte 0FFFFFFFFh
        jne short .23
        cmp dword [dword eax+093h], byte 2
        jne short .22
        push dword [AsyncCdFile]
        call CdCloseFile
        add esp, byte 4
.22:
        push dword [AsyncDestBlock]
        mov dword [AsyncCdFile], 0FFFFFFFFh
        call PushMemDescriptorLocked
        mov eax, dword [AsyncCurRequest]
        inc dword [AsyncQueueTail]
        mov esi, dword [AsyncFreeList]
        mov dword [dword eax+0A7h], esi
        add esp, byte 4
        mov dword [AsyncState], 1
        mov dword [AsyncFreeList], eax
        jmp near .26
.23:
        mov eax, dword [AsyncDestBlock]
        mov edx, dword [AsyncDestPos]
        mov eax, dword [eax]
        add edx, eax
        mov eax, dword [AsyncBytesLeft]
        add eax, dword [AsyncSkip]
        mov edi, dword [AsyncBudget]
        cmp eax, dword [AsyncFileHandle]
        jle short .24
        mov esi, dword [AsyncFileHandle]
        sub esi, dword [AsyncSkip]
        jmp short .25
.24:
        mov esi, dword [AsyncBytesLeft]
.25:
        push esi
        push edx
        mov dword [AsyncSkip], 0
        push dword [AsyncCdFile]
        mov dword [AsyncTicks], 0
        call CdRead
        mov eax, dword [AsyncTicks]
        add esp, byte 0Ch
        mov dword [AsyncBudget], edi
        add dword [AsyncBytesRead], esi
        add dword [AsyncReadTime], eax
        mov eax, dword [AsyncWaitTimer]
        add dword [AsyncDestPos], esi
        add edi, eax
        sub dword [AsyncBytesLeft], esi
        mov dword [AsyncBudget], edi
        test edi, edi
        jle near asyncreader_3EF
        cmp dword [AsyncBytesLeft], byte 0
        jg near setasyncspeed_ret
        jmp near asyncreader_3EF
.26:
        mov eax, dword [AsyncCurRequest]
        cmp dword [dword eax+093h], byte 2
        jne short .27
        push dword [AsyncCdFile]
        call CdCloseFile
        add esp, byte 4
.27:
        mov eax, dword [AsyncCurRequest]
        mov dword [AsyncCdFile], 0FFFFFFFFh
        mov esi, dword [AsyncDestBlock]
.28:
        mov dword [dword eax+0A3h], esi
        mov dword [AsyncState], 1
.29:
        cmp dword [AsyncBudget], byte 0
        jg near setasyncspeed_ret
        mov eax, dword [AsyncState]
        dec eax
        cmp eax, byte 3
        ja short .29
        jmp dword [nosplit cs:eax*4+jpt_1BE62]
.30:
        mov eax, dword [AsyncReqUser]
        mov edx, dword [AsyncDestPos]
        add edx, eax
        mov eax, dword [AsyncBytesLeft]
        add eax, dword [AsyncSkip]
        mov edi, dword [AsyncBudget]
        cmp eax, dword [AsyncFileHandle]
        jl short .31
        mov esi, dword [AsyncFileHandle]
        sub esi, dword [AsyncSkip]
        mov dword [AsyncSkip], 0
        jmp short .32
.31:
        mov esi, dword [AsyncBytesLeft]
        add dword [AsyncSkip], esi
.32:
        push esi
        push edx
        push dword [AsyncCdFile]
        mov dword [AsyncTicks], 0
        call CdRead
        mov eax, dword [AsyncTicks]
        add esp, byte 0Ch
        mov dword [AsyncBudget], edi
        add dword [AsyncBytesRead], esi
        add dword [AsyncReadTime], eax
        mov eax, dword [AsyncWaitTimer]
        add dword [AsyncDestPos], esi
        add edi, eax
        sub dword [AsyncBytesLeft], esi
        mov dword [AsyncBudget], edi
        test edi, edi
        jle short asyncreader_614
        cmp dword [AsyncBytesLeft], byte 0
        jg near setasyncspeed_ret
asyncreader_614:
        cmp dword [AsyncBytesLeft], byte 0
        jle short .34
        mov eax, dword [AsyncCurRequest]
        cmp dword [dword eax+097h], byte 0FFFFFFFFh
        jne near asyncreader_3EF.30
        cmp dword [dword eax+093h], byte 4
        jne short .33
        push dword [AsyncCdFile]
        call CdCloseFile
        add esp, byte 4
.33:
        mov dword [AsyncCdFile], 0FFFFFFFFh
        mov eax, dword [AsyncCurRequest]
        inc dword [AsyncQueueTail]
        mov esi, dword [AsyncFreeList]
        mov dword [dword eax+0A7h], esi
        mov dword [AsyncState], 1
        mov dword [AsyncFreeList], eax
.34:
        mov eax, dword [AsyncCurRequest]
        cmp dword [dword eax+093h], byte 4
        jne short .35
        push dword [AsyncCdFile]
        call CdCloseFile
        add esp, byte 4
.35:
        mov eax, dword [AsyncCurRequest]
        mov dword [AsyncCdFile], 0FFFFFFFFh
        mov esi, dword [AsyncReqUser]
        jmp near asyncreader_3EF.28
;-----------------------------------------------------------------------------
; AsyncTimerTick                               1C51E  96 PC, medium confidence
; EA async reader timer callback: counts ticks and lets the read budget
; recover
;-----------------------------------------------------------------------------
AsyncTimerTick:
        cmp dword [AsyncBudget], byte 0Ah
        jle short .1
        sub dword [AsyncBudget], byte 0Ah
        jmp short .2
.1:
        mov dword [AsyncBudget], 0
.2:
        inc dword [AsyncTicks]
        ret
        push ebp
        mov ebp, esp
        mov edx, dword [byte ebp+08h]
        mov eax, dword [dword edx+0A3h]
        test eax, eax
        je short AsyncTimerTick_45.3
        inc dword [AsyncQueueTail]
        mov ebx, dword [AsyncFreeList]
        mov dword [dword edx+0A7h], ebx
AsyncTimerTick_45:
        mov dword [AsyncFreeList], edx
.3:
        pop ebp
        ret
;-----------------------------------------------------------------------------
; AsyncRequestDone                             1C56B  96 PC, medium confidence
; (request): 1 when the request has finished (its block goes back to the free
; list)
;-----------------------------------------------------------------------------
AsyncRequestDone:
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+08h]
        mov edx, dword [dword eax+0A3h]
        test edx, edx
        je short .1
        inc dword [AsyncQueueTail]
        mov edx, dword [AsyncFreeList]
        mov dword [dword eax+0A7h], edx
        mov dword [AsyncFreeList], eax
        mov eax, 1
        pop ebp
        ret
.1:
        xor eax, eax
        pop ebp
        ret
        push ebp
        mov ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [byte ebp+0Ch]
        mov dword [AsyncFreeList], eax
        xor edx, edx
        dec ebx
        jmp short .3
.2:
        lea ecx, [dword eax+0ABh]
        inc edx
        mov dword [dword eax+0A7h], ecx
        mov eax, ecx
.3:
        cmp edx, ebx
        jl short .2
        mov dword [dword eax+0A7h], 0
        mov eax, dword [byte ebp+0Ch]
        mov dword [AsyncQueueTail], eax
        pop ebp
        ret
        push ebp
        mov ebp, esp
        mov edx, dword [byte ebp+08h]
        inc dword [AsyncQueueTail]
        mov eax, dword [AsyncFreeList]
        mov dword [dword edx+0A7h], eax
        jmp near AsyncTimerTick_45
;-----------------------------------------------------------------------------
; getasyncblock                                                   1C5F3  96 PC
; EA async reader: takes a request block off the free list ("NO ASYNC BLOCKS
; LEFT" when none); name from its debug message
;-----------------------------------------------------------------------------
getasyncblock:
        cmp dword [AsyncFreeList], byte 0
        jne short .1
        push dword [AsyncQueueTail]
        push str_GetasyncblockDNOASYNCBLO
        call FatalError
        add esp, byte 8
.1:
        mov eax, dword [AsyncFreeList]
        mov edx, dword [dword eax+0A7h]
        dec dword [AsyncQueueTail]
        mov dword [AsyncFreeList], edx
        ret
