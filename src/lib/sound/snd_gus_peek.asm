; Sound: GusPeek, GusPoke, GusPokeFill, GusTestDramBank, GusInitPlayDma and 5 more.
bits 32
%include "hockey.inc"
section s_DB1B2 progbits alloc exec nowrite align=1
extern GusConvertAddr16, GusDataHighPort, GusDataLowPort, GusDelay, GusDmaBusy, GusDmaChunkHi, GusDmaChunkLo, GusDmaChunkSize
extern GusDmaControl, GusDmaDone, GusDmaFlags, GusDmaLatchBits, GusDmaLeft, GusDmaReady, GusDramPort, GusEnterCritical
extern GusIrqFlags, GusIrqStatusPort, GusLeaveCritical, GusMaskDma, GusPlayDmaChannel, GusProgramDma, GusRecordDmaChannel, GusRegSelectPort
extern GusServiceIrq, GusSetDmaCallbacks, GusSetupDmaChannel, inp_, outp_, outpw_
global GusPeek, GusPoke, GusPokeFill, GusTestDramBank, GusInitPlayDma, GusInitRecordDma, GusInitDma, GusStartDramDma
global GusDownload, GusDramDmaDone
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; GusPeek                                         DB1C0  96 PC, low confidence
; Reads one byte of card memory
;-----------------------------------------------------------------------------
GusPeek:
        push ebp
        mov ebp, esp
        push ebx
        push edx
        mov ebx, eax
        pushfw
        cli
        call GusEnterCritical
        xor eax, eax
        mov edx, 43h
        mov ax, word [GusRegSelectPort]
        call outp_
        xor eax, eax
        mov edx, ebx
        mov ax, word [GusDataLowPort]
        call outpw_
        shr ebx, 10h
        xor eax, eax
        mov edx, 44h
        mov ax, word [GusRegSelectPort]
        and ebx, 0FFh
        call outp_
        xor eax, eax
        xor edx, edx
        mov ax, word [GusDataHighPort]
        mov dl, bl
        call outp_
        xor eax, eax
        mov ax, word [GusDramPort]
        call inp_
        mov ebx, eax
        call GusLeaveCritical
        popfw
        mov al, bl
        lea esp, [byte ebp-08h]
        pop edx
        pop ebx
        pop ebp
        ret
        db 090h
;-----------------------------------------------------------------------------
; GusPoke                                         DB23C  96 PC, low confidence
; Writes one byte of card memory
;-----------------------------------------------------------------------------
GusPoke:
        push ebp
        mov ebp, esp
        push ebx
        push ecx
        mov ebx, eax
        mov cl, dl
        pushfw
        cli
        call GusEnterCritical
        xor eax, eax
        mov edx, 43h
        mov ax, word [GusRegSelectPort]
        call outp_
        xor eax, eax
        mov edx, ebx
        mov ax, word [GusDataLowPort]
        call outpw_
        shr ebx, 10h
        xor eax, eax
        mov edx, 44h
        mov ax, word [GusRegSelectPort]
        and ebx, 0FFh
        call outp_
        xor eax, eax
        xor edx, edx
        mov ax, word [GusDataHighPort]
        mov dl, bl
        call outp_
        xor eax, eax
        xor edx, edx
        mov ax, word [GusDramPort]
        mov dl, cl
        call outp_
        call GusLeaveCritical
        popfw
        lea esp, [byte ebp-08h]
        pop ecx
        pop ebx
        pop ebp
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; GusPokeFill                                     DB2BC  96 PC, low confidence
; Writes a run of bytes (optionally sign-flipped) into card memory through
; the register ports
;-----------------------------------------------------------------------------
GusPokeFill:
        push ebp
        mov ebp, esp
        push esi
        sub esp, byte 10h
        mov esi, eax
        mov al, cl
        mov ah, cl
        and ah, 40h
        mov ecx, edx
        mov byte [byte ebp-08h], ah
        shr edx, 10h
        xor ah, ah
        mov byte [byte ebp-014h], dl
        mov byte [byte ebp-010h], ah
        test al, 80h
        je short .1
        mov al, 80h
        jmp short .2
.1:
        xor al, al
.2:
        mov byte [byte ebp-0Ch], al
        pushfw
        cli
        call GusEnterCritical
.3:
        test ebx, ebx
        je near .8
        xor eax, eax
        mov edx, 44h
        mov ax, word [GusRegSelectPort]
        call outp_
        xor edx, edx
        xor eax, eax
        mov dl, byte [byte ebp-014h]
        mov ax, word [GusDataHighPort]
        call outp_
        inc byte [byte ebp-014h]
.4:
        xor eax, eax
        mov edx, 43h
        mov ax, word [GusRegSelectPort]
        call outp_
        xor eax, eax
        xor edx, edx
        mov ax, word [GusDataLowPort]
        mov dx, cx
        inc esi
        call outpw_
        mov ah, byte [byte ebp-0Ch]
        mov dl, byte [byte ebp-08h]
        mov al, byte [byte esi-01h]
        inc ecx
        xor ah, al
        test dl, dl
        je short .6
        cmp byte [byte ebp-010h], 0
        je short .5
        mov al, ah
.5:
        xor byte [byte ebp-010h], 1
        jmp short .7
.6:
        mov al, ah
.7:
        xor edx, edx
        mov dl, al
        xor eax, eax
        mov ax, word [GusDramPort]
        call outp_
        dec ebx
        je near .3
        test cx, cx
        jne short .4
        jmp near .3
.8:
        call GusLeaveCritical
        popfw
        lea esp, [byte ebp-04h]
        pop esi
        pop ebp
        ret
;-----------------------------------------------------------------------------
; GusTestDramBank                                 DB394  96 PC, low confidence
; Writes and reads back test bytes to check whether a bank of card memory
; exists
;-----------------------------------------------------------------------------
GusTestDramBank:
        push ebp
        mov ebp, esp
        push ebx
        push ecx
        push edx
        push esi
        push edi
        sub esp, byte 18h
        mov ebx, eax
        mov ecx, eax
        call GusPeek
        xor cl, 20h
        mov byte [byte ebp-028h], al
        mov byte [byte ebp-01Ch], al
        mov eax, ecx
        mov edx, 55h
        call GusPeek
        mov byte [byte ebp-020h], al
        mov byte [byte ebp-018h], al
        mov eax, ebx
        call GusPoke
        mov eax, ecx
        xor edx, edx
        call GusPoke
        mov eax, ebx
        call GusPeek
        cmp al, 55h
        je short .1
        xor al, al
        jmp near .10
.1:
        mov eax, ebx
        xor edx, edx
        call GusPoke
        mov edx, 55h
        mov eax, ecx
        call GusPoke
        mov eax, ebx
        call GusPeek
        test al, al
        je short .2
        xor al, al
        lea esp, [byte ebp-014h]
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
.2:
        mov edx, 0AAh
        mov eax, ebx
        call GusPoke
        mov eax, ecx
        xor edx, edx
        call GusPoke
        mov eax, ebx
        call GusPeek
        cmp al, 0AAh
        je short .3
        xor al, al
        lea esp, [byte ebp-014h]
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
.3:
        mov edx, 0FFh
        mov eax, ebx
        call GusPoke
        mov eax, ecx
        xor edx, edx
        call GusPoke
        mov eax, ebx
        call GusPeek
        cmp al, 0FFh
        je short .4
        xor al, al
        lea esp, [byte ebp-014h]
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
.4:
        cmp ebx, 3FFFFh
        ja short .5
        xor edx, edx
        mov eax, ebx
        mov dl, byte [byte ebp-028h]
        call GusPoke
        xor edx, edx
        mov eax, ecx
        mov dl, byte [byte ebp-020h]
        call GusPoke
        mov al, 1
        lea esp, [byte ebp-014h]
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
.5:
        mov edx, ebx
        shr edx, 12h
        xor edi, edi
        mov dword [byte ebp-02Ch], edx
        jmp short .8
.6:
        cmp di, word [byte ebp-02Ch]
        je short .9
        xor edx, edx
        mov esi, ebx
        mov dx, di
        and esi, 3FFFFh
        shl edx, 12h
        or esi, edx
        mov eax, esi
        mov edx, 0AAh
        call GusPeek
        mov byte [byte ebp-024h], al
        mov eax, esi
        call GusPoke
        mov eax, ecx
        xor edx, edx
        call GusPoke
        mov eax, ebx
        call GusPeek
        cmp al, 0AAh
        jne short .7
        xor edx, edx
        mov eax, ebx
        mov dl, byte [byte ebp-01Ch]
        call GusPoke
        xor edx, edx
        mov eax, ecx
        mov dl, byte [byte ebp-018h]
        call GusPoke
        xor al, al
        lea esp, [byte ebp-014h]
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
.7:
        xor edx, edx
        mov eax, esi
        mov dl, byte [byte ebp-024h]
        inc edi
        call GusPoke
.8:
        cmp di, byte 4
        jne short .6
.9:
        xor edx, edx
        mov eax, ebx
        mov dl, byte [byte ebp-01Ch]
        call GusPoke
        xor edx, edx
        mov eax, ecx
        mov dl, byte [byte ebp-018h]
        call GusPoke
        mov al, 2
.10:
        lea esp, [byte ebp-014h]
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
        db 00h,00h
;-----------------------------------------------------------------------------
; GusInitPlayDma                                  DB540  96 PC, low confidence
; Sets up the playback DMA channel when one is configured
;-----------------------------------------------------------------------------
GusInitPlayDma:
        push ebp
        mov ebp, esp
        push edx
        mov edx, eax
        cmp byte [dword eax+GusDmaLatchBits], 0
        jne short .1
        mov al, 3
        jmp short .2
.1:
        xor eax, eax
        call GusSetupDmaChannel
        xor al, al
.2:
        lea esp, [byte ebp-04h]
        pop edx
        pop ebp
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; GusInitRecordDma                                DB564  96 PC, low confidence
; Sets up the record DMA channel when one is configured
;-----------------------------------------------------------------------------
GusInitRecordDma:
        push ebp
        mov ebp, esp
        push edx
        mov edx, eax
        cmp byte [dword eax+GusDmaLatchBits], 0
        jne short .1
        mov al, 3
        jmp short .2
.1:
        mov eax, 1
        call GusSetupDmaChannel
        xor al, al
.2:
        lea esp, [byte ebp-04h]
        pop edx
        pop ebp
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; GusInitDma                                      DB58C  96 PC, low confidence
; Init table entry: sets up both DMA channels and claims the DMA-done
; callback
;-----------------------------------------------------------------------------
GusInitDma:
        push ebp
        mov ebp, esp
        mov byte [GusDmaReady], 1
        xor eax, eax
        mov al, byte [GusPlayDmaChannel]
        call GusInitPlayDma
        test al, al
        je short .1
        and eax, 0FFh
        mov esp, ebp
        pop ebp
        ret
.1:
        xor eax, eax
        mov al, byte [GusRecordDmaChannel]
        call GusInitRecordDma
        test al, al
        je short .2
        and eax, 0FFh
        mov esp, ebp
        pop ebp
        ret
.2:
        mov eax, GusDramDmaDone
        call GusSetDmaCallbacks
        test eax, eax
        je short .3
        mov eax, 8
        mov esp, ebp
        pop ebp
        ret
.3:
        mov dword [GusDmaBusy], eax
        mov esp, ebp
        pop ebp
        ret
;-----------------------------------------------------------------------------
; GusStartDramDma                                 DB5E8  96 PC, low confidence
; Starts one chunk of a DMA transfer from main memory into card memory
;-----------------------------------------------------------------------------
GusStartDramDma:
        push ebp
        mov ebp, esp
        push esi
        mov esi, eax
        xor si, ax
        shr esi, 10h
        mov word [GusDmaChunkHi], si
        mov word [GusDmaChunkLo], ax
        mov dword [GusDmaLeft], edx
        mov eax, dword [byte ebp+08h]
        mov word [GusDmaFlags], ax
        xor edx, edx
        mov dword [GusDmaChunkSize], edx
        mov dword [GusDmaDone], edx
        mov dl, cl
        mov ah, byte [byte ebp+08h]
        or dl, 4
        test ah, 1
        je short .2
        test cl, 4
        jne short .1
        cmp byte [GusPlayDmaChannel], 4
        jb short .1
        mov eax, ebx
        call GusConvertAddr16
        mov cl, dl
        mov ebx, eax
.1:
        xor eax, eax
        mov edx, 42h
        mov ax, word [GusRegSelectPort]
        shr ebx, 4
        call outp_
        xor eax, eax
        xor edx, edx
        mov ax, word [GusDataLowPort]
        mov dx, bx
        call outpw_
        jmp short .3
.2:
        cmp byte [GusRecordDmaChannel], 4
        jb short .3
        mov eax, ebx
        call GusConvertAddr16
        mov cl, dl
.3:
        or cl, 21h
        mov byte [GusDmaControl], cl
        xor eax, eax
        mov ax, word [byte ebp+08h]
        call GusDramDmaDone
        lea esp, [byte ebp-04h]
        pop esi
        pop ebp
        ret 4
        db 090h
;-----------------------------------------------------------------------------
; GusDownload                                     DB69C  96 PC, low confidence
; Copies a buffer into card memory by DMA (with a filler run), refusing while
; another transfer runs
;-----------------------------------------------------------------------------
GusDownload:
        push ebp
        mov ebp, esp
        push esi
        push edi
        sub esp, byte 14h
        mov dword [byte ebp-01Ch], eax
        mov esi, edx
        mov dword [byte ebp-010h], ebx
        mov byte [byte ebp-0Ch], cl
        pushfw
        cli
        call GusEnterCritical
        cmp dword [GusDmaBusy], byte 0
        je short .1
        call GusLeaveCritical
        popfw
        mov eax, 7
        jmp near .9
.1:
        mov dword [GusDmaBusy], 1
        mov eax, dword [byte ebp-01Ch]
        mov eax, dword [byte eax+04h]
        mov edi, dword [byte ebp-01Ch]
        mov dword [byte ebp-014h], eax
        mov ah, byte [byte ebp+08h]
        mov edi, dword [edi]
        test ah, 1
        je near .7
        cmp byte [GusPlayDmaChannel], 4
        jb short .4
        test byte [byte ebp-014h], 1
        je short .4
        test byte [byte ebp-010h], 1
        jne short .4
.2:
        test esi, esi
        je short .3
        mov edx, dword [byte ebp-010h]
        mov eax, edi
        xor ecx, ecx
        mov ebx, esi
        mov cl, byte [byte ebp-0Ch]
        call GusPokeFill
.3:
        mov dx, word [GusIrqFlags]
        or dl, 4
        mov word [GusIrqFlags], dx
        jmp short .8
.4:
        mov eax, dword [byte ebp-010h]
        and al, 1Fh
        xor ah, ah
        test ax, ax
        je short .6
        mov ecx, 20h
        sub ecx, eax
        mov eax, ecx
        xor ecx, ecx
        mov cx, ax
        cmp ecx, esi
        jbe short .5
        mov eax, esi
.5:
        xor ecx, ecx
        mov cl, byte [byte ebp-0Ch]
        and eax, 0FFFFh
        mov dword [byte ebp-018h], eax
        mov edx, dword [byte ebp-010h]
        mov ebx, dword [byte ebp-018h]
        mov eax, edi
        call GusPokeFill
        mov ecx, dword [byte ebp-018h]
        mov edx, dword [byte ebp-014h]
        sub esi, ecx
        add edx, ecx
        add edi, ecx
        mov dword [byte ebp-014h], edx
.6:
        cmp esi, byte 20h
        jb short .2
.7:
        mov ebx, dword [byte ebp-010h]
        xor eax, eax
        mov edx, esi
        mov ax, word [byte ebp+08h]
        xor ecx, ecx
        push eax
        mov cl, byte [byte ebp-0Ch]
        mov eax, dword [byte ebp-014h]
        call GusStartDramDma
.8:
        call GusLeaveCritical
        popfw
        xor eax, eax
.9:
        lea esp, [byte ebp-08h]
        pop edi
        pop esi
        pop ebp
        ret 4
        db 090h
;-----------------------------------------------------------------------------
; GusDramDmaDone                                  DB7AC  96 PC, low confidence
; DMA-done callback: starts the next chunk of a download or ends the transfer
;-----------------------------------------------------------------------------
GusDramDmaDone:
        push ebp
        mov ebp, esp
        push ebx
        push ecx
        push edx
        push esi
        mov edx, eax
        cmp dword [GusDmaBusy], byte 0
        jne short .1
        xor eax, eax
        jmp near .8
.1:
        mov eax, dword [GusDmaChunkSize]
        add dword [GusDmaDone], eax
        mov esi, dword [GusDmaLeft]
        test esi, esi
        jne short .2
        mov dword [GusDmaBusy], esi
        xor eax, eax
        lea esp, [byte ebp-010h]
        pop esi
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
.2:
        xor esi, esi
        mov si, word [GusDmaChunkLo]
        mov eax, 10000h
        sub eax, esi
        mov esi, eax
        cmp esi, dword [GusDmaLeft]
        jbe short .3
        mov esi, dword [GusDmaLeft]
.3:
        mov dword [GusDmaChunkSize], esi
        pushfw
        cli
        test dl, 1
        je short .6
        xor eax, eax
        mov ax, word [GusDmaChunkLo]
        xor ecx, ecx
        mov cx, word [GusDmaChunkHi]
        push eax
        test byte [GusDmaControl], 2
        je short .4
        mov eax, 44h
        jmp short .5
.4:
        mov eax, 48h
.5:
        xor ebx, ebx
        mov bx, ax
        mov edx, dword [GusDmaChunkSize]
        xor eax, eax
        call GusProgramDma
        xor eax, eax
        mov edx, 41h
        jmp short .7
.6:
        xor eax, eax
        mov ax, word [GusDmaChunkLo]
        xor ecx, ecx
        mov cx, word [GusDmaChunkHi]
        push eax
        mov edx, dword [GusDmaChunkSize]
        mov eax, 1
        mov ebx, 44h
        call GusProgramDma
        xor eax, eax
        mov edx, 49h
.7:
        mov ax, word [GusRegSelectPort]
        call outp_
        xor edx, edx
        mov dl, byte [GusDmaControl]
        xor eax, eax
        mov ax, word [GusDataHighPort]
        call outp_
        call GusDelay
        popfw
        sub dword [GusDmaLeft], esi
        add word [GusDmaChunkLo], si
        mov ax, word [GusDmaChunkHi]
        inc word [GusDmaChunkHi]
        mov eax, 1
.8:
        lea esp, [byte ebp-010h]
        pop esi
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
        push ebp
        mov ebp, esp
        push ebx
        push ecx
        push edx
        pushfw
        cli
        mov edx, 1D4C0h
.9:
        cmp dword [GusDmaBusy], byte 0
        je short .13
        dec edx
        je short .13
        xor eax, eax
        cli
        mov ax, word [GusIrqStatusPort]
        call inp_
        test al, 80h
        jne short .10
        mov bx, word [GusIrqFlags]
        test bl, 4
        je short .11
.10:
        call GusServiceIrq
        cli
.11:
        mov cx, word [GusIrqFlags]
        test cl, 2
        je short .12
        and word [GusIrqFlags], byte 0FFFDh
        jmp short .10
.12:
        call GusDelay
        jmp short .9
.13:
        popfw
        cmp dword [GusDmaBusy], byte 0
        je short .14
        test edx, edx
        jne short .14
        mov eax, 9
        jmp short .15
.14:
        xor eax, eax
.15:
        lea esp, [byte ebp-0Ch]
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
        db 090h
        push ebp
        mov ebp, esp
        cmp dword [GusDmaBusy], byte 0
        sete al
        and eax, 0FFh
        mov esp, ebp
        pop ebp
        ret
        db 08Bh,0C0h
        push ebp
        mov ebp, esp
        push ebx
        push edx
        pushfw
        cli
        cmp dword [GusDmaBusy], byte 0
        je short .16
        xor ebx, ebx
        mov dword [GusDmaBusy], ebx
        xor eax, eax
        call GusMaskDma
        mov eax, 1
        call GusMaskDma
        and byte [GusDmaControl], 0DEh
        xor eax, eax
        mov edx, 41h
        mov ax, word [GusRegSelectPort]
        call outp_
        xor edx, edx
        mov dl, byte [GusDmaControl]
        xor eax, eax
        mov ax, word [GusDataHighPort]
        call outp_
        xor eax, eax
        mov edx, 49h
        mov ax, word [GusRegSelectPort]
        call outp_
        xor edx, edx
        mov dl, byte [GusDmaControl]
        xor eax, eax
        mov ax, word [GusDataHighPort]
        call outp_
.16:
        popfw
        lea esp, [byte ebp-08h]
        pop edx
        pop ebx
        pop ebp
        ret
