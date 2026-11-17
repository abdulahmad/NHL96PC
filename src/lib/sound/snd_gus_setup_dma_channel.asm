; Sound: GusSetupDmaChannel, GusProgramDma, GusMaskDma, GusSetVect, GusGetVect and 18 more.
bits 32
%include "hockey.inc"
section s_DA5D0 progbits alloc exec nowrite align=1
extern _dos_close_, _dos_getvect_, _dos_open_, _dos_read_, _dos_setvect_, GusBasePort, GusCriticalDepth, GusDataHighPort
extern GusDmaChannels, GusDmaDoneCallback, GusDmaPageTable, GusDosResult, GusDramPort, GusIrqFlags, GusIrqOldHandler, GusIrqOldSelector
extern GusIrqPending, GusIrqStatusPort, GusIrqVectorTable, GusMidiControlPort, GusMidiDataPort, GusMidiIrq, GusMidiIrqCount, GusMidiPending
extern GusMidiRecvCallback, GusMidiXmitCallback, GusRecordDoneCallback, GusRegSelectPort, GusTimer1Callback, GusTimer2Callback, GusTimerCallback, GusVoiceIrqBits
extern GusVolumeCallback, GusVolumeIrqCallback, GusWaveCallback, GusWaveIrq, GusWaveIrqCallback, inp_, lseek_, outp_
extern RestoreDS
global GusSetupDmaChannel, GusProgramDma, GusMaskDma, GusSetVect, GusGetVect, GusHookIrq, GusUnhookIrq, GusSendEoi
global GusWaveIrqHandler, GusMidiIrqHandler, GusDelay, GusSetBasePort, GusClearIrqState, GusEnterCritical, GusLeaveCritical, GusClearCallbacks
global GusClaimCallback, GusClaimVoiceCallback, GusSetDmaCallbacks, GusSetVoiceCallbacks, GusMidiIrqService, GusReadIrqSource, GusServiceIrq
;-----------------------------------------------------------------------------
; GusSetupDmaChannel                              DA5D0  96 PC, low confidence
; Fills the port table of an ISA DMA channel (mask, mode, clear, address,
; count and page registers)
;-----------------------------------------------------------------------------
GusSetupDmaChannel:
        push ebp
        mov ebp, esp
        push ebx
        push ecx
        push esi
        mov ebx, eax
        shl eax, 4
        add eax, ebx
        add eax, GusDmaChannels
        mov word [byte eax+0Fh], dx
        mov ebx, edx
        and bl, 3
        xor bh, dh
        cmp edx, byte 3
        jg short .1
        mov word [byte eax+09h], 0Ah
        mov word [byte eax+0Bh], 0Bh
        mov word [byte eax+0Dh], 0Ch
        mov ecx, ebx
        add ecx, ebx
        mov word [byte eax+05h], cx
        mov cx, word [byte eax+05h]
        or cl, 1
        jmp short .2
.1:
        mov word [byte eax+09h], 0D4h
        mov word [byte eax+0Bh], 0D6h
        mov word [byte eax+0Dh], 0D8h
        mov ecx, ebx
        shl ecx, 2
        mov esi, ecx
        or esi, 0C0h
        mov word [byte eax+05h], si
        or cl, 0C2h
.2:
        mov word [byte eax+07h], cx
        mov byte [byte eax+01h], bl
        or bl, 4
        mov byte [eax], bl
        mov dl, byte [nosplit edx*2+GusDmaPageTable]
        mov byte [byte eax+02h], dl
        lea esp, [byte ebp-0Ch]
        pop esi
        pop ecx
        pop ebx
        pop ebp
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; GusProgramDma                                   DA65C  96 PC, low confidence
; Programs an ISA DMA channel with the buffer address, length and transfer
; mode
;-----------------------------------------------------------------------------
GusProgramDma:
        push ebp
        mov ebp, esp
        push esi
        sub esp, byte 10h
        mov esi, ebx
        mov ebx, eax
        shl ebx, 4
        add ebx, eax
        add ebx, GusDmaChannels
        mov ax, word [byte ebx+0Fh]
        and al, 3
        xor ah, ah
        or esi, eax
        cmp word [byte ebx+0Fh], byte 4
        jb short .1
        sub edx, byte 2
        mov eax, edx
        shr eax, 1
        mov byte [byte ebp-0Ch], al
        xor eax, eax
        shr edx, 9
        mov ax, word [byte ebp+08h]
        mov byte [byte ebp-014h], dl
        mov edx, eax
        sar edx, 1
        sar eax, 9
        mov byte [byte ebp-010h], dl
        mov byte [byte ebp-08h], al
        test cl, 1
        je short .2
        mov ah, al
        or ah, 80h
        mov byte [byte ebp-08h], ah
        jmp short .2
.1:
        mov al, dl
        dec al
        mov byte [byte ebp-0Ch], al
        lea eax, [byte edx-01h]
        shr eax, 8
        mov byte [byte ebp-014h], al
        mov al, byte [byte ebp+08h]
        mov byte [byte ebp-010h], al
        xor eax, eax
        mov ax, word [byte ebp+08h]
        sar eax, 8
        mov byte [byte ebp-08h], al
.2:
        xor edx, edx
        pushfw
        cli
        mov dl, byte [ebx]
        xor eax, eax
        mov ax, word [byte ebx+09h]
        call outp_
        xor edx, edx
        xor eax, eax
        mov dx, si
        mov ax, word [byte ebx+0Bh]
        call outp_
        xor eax, eax
        mov ax, word [byte ebx+0Dh]
        xor edx, edx
        call outp_
        xor edx, edx
        xor eax, eax
        mov dl, byte [byte ebp-010h]
        mov ax, word [byte ebx+05h]
        call outp_
        xor edx, edx
        xor eax, eax
        mov dl, byte [byte ebp-08h]
        mov ax, word [byte ebx+05h]
        call outp_
        xor edx, edx
        xor eax, eax
        mov dx, cx
        mov al, byte [byte ebx+02h]
        call outp_
        xor eax, eax
        mov ax, word [byte ebx+0Dh]
        xor edx, edx
        call outp_
        xor edx, edx
        xor eax, eax
        mov dl, byte [byte ebp-0Ch]
        mov ax, word [byte ebx+07h]
        call outp_
        xor edx, edx
        xor eax, eax
        mov dl, byte [byte ebp-014h]
        mov ax, word [byte ebx+07h]
        call outp_
        xor edx, edx
        mov dl, byte [byte ebx+01h]
        xor eax, eax
        mov ax, word [byte ebx+09h]
        call outp_
        popfw
        lea esp, [byte ebp-04h]
        pop esi
        pop ebp
        ret 4
;-----------------------------------------------------------------------------
; GusMaskDma                                      DA77C  96 PC, low confidence
; Masks an ISA DMA channel; followed by the DMA count read and DOS file
; helpers of the toolkit
;-----------------------------------------------------------------------------
GusMaskDma:
        push ebp
        mov ebp, esp
        push edx
        mov edx, eax
        shl eax, 4
        add eax, edx
        add eax, GusDmaChannels
        xor edx, edx
        mov dl, byte [eax]
        mov ax, word [byte eax+09h]
        and eax, 0FFFFh
        call outp_
        lea esp, [byte ebp-04h]
        pop edx
        pop ebp
        ret
        push ebp
        mov ebp, esp
        push ebx
        push ecx
        push edx
        mov ebx, eax
        shl eax, 4
        add eax, ebx
        mov ebx, GusDmaChannels
        add ebx, eax
        pushfw
        cli
        xor eax, eax
        mov ax, word [byte ebx+0Dh]
        xor edx, edx
        call outp_
        xor eax, eax
        mov ax, word [byte ebx+07h]
        call inp_
        mov edx, eax
        xor eax, eax
        mov ax, word [byte ebx+07h]
        call inp_
        mov ecx, eax
        popfw
        mov al, cl
        xor ah, ah
        and eax, 0FFFFh
        xor dh, dh
        shl eax, 8
        and edx, 0FFFFh
        add eax, edx
        inc eax
        and eax, 0FFFFh
        cmp word [byte ebx+0Fh], byte 4
        jb short .1
        add eax, eax
.1:
        lea esp, [byte ebp-0Ch]
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
        db 08Dh,040h,00h
        push ebp
        mov ebp, esp
        push ecx
        push esi
        sub esp, byte 4
        lea esi, [byte ebp-0Ch]
        push esi
        xor esi, esi
        mov ecx, ds
        mov si, bx
        mov ebx, edx
        mov edx, esi
        call _dos_read_
        mov word [GusDosResult], ax
        mov eax, dword [byte ebp-0Ch]
        lea esp, [byte ebp-08h]
        pop esi
        pop ecx
        pop ebp
        ret
        push ebp
        mov ebp, esp
        call _dos_close_
        mov word [GusDosResult], ax
        test ax, ax
        je short .2
        mov eax, 10h
.2:
        mov esp, ebp
        pop ebp
        ret
        push ebp
        mov ebp, esp
        call lseek_
        test eax, eax
        jge short .3
        mov eax, 10h
        mov esp, ebp
        pop ebp
        ret
.3:
        xor eax, eax
        mov esp, ebp
        pop ebp
        ret
        db 090h
        push ebp
        mov ebp, esp
        push ebx
        push edx
        sub esp, byte 4
        lea ebx, [byte ebp-0Ch]
        xor edx, edx
        call _dos_open_
        mov word [GusDosResult], ax
        test ax, ax
        jne short .4
        mov eax, dword [byte ebp-0Ch]
        jmp short .5
.4:
        cwde
        neg eax
.5:
        lea esp, [byte ebp-08h]
        pop edx
        pop ebx
        pop ebp
        ret
;-----------------------------------------------------------------------------
; GusSetVect                                      DA8A4  96 PC, low confidence
; Sets a protected-mode interrupt vector
;-----------------------------------------------------------------------------
GusSetVect:
        push ebp
        mov ebp, esp
        call _dos_setvect_
        mov esp, ebp
        pop ebp
        ret
;-----------------------------------------------------------------------------
; GusGetVect                                      DA8B0  96 PC, low confidence
; Reads a protected-mode interrupt vector
;-----------------------------------------------------------------------------
GusGetVect:
        push ebp
        mov ebp, esp
        call _dos_getvect_
        mov esp, ebp
        pop ebp
        ret
;-----------------------------------------------------------------------------
; GusHookIrq                                      DA8BC  96 PC, low confidence
; Saves the old vector of an IRQ line, installs the new handler and unmasks
; the line
;-----------------------------------------------------------------------------
GusHookIrq:
        push ebp
        mov ebp, esp
        push edx
        push esi
        push edi
        sub esp, byte 4
        mov dword [byte ebp-010h], eax
        mov edi, ecx
        mov esi, ebx
        mov ecx, dword [byte ebp-010h]
        xor ebx, ebx
        pushfw
        cli
        mov bx, word [nosplit ecx*8+GusIrqVectorTable]
        mov eax, ebx
        call GusGetVect
        mov word [nosplit ecx*8+GusIrqOldSelector], dx
        mov dword [nosplit ecx*8+GusIrqOldHandler], eax
        mov eax, ebx
        mov ecx, edi
        mov ebx, esi
        call GusSetVect
        mov cl, byte [byte ebp-010h]
        mov dl, 1
        and cl, 7
        shl dl, cl
        mov ebx, dword [byte ebp-010h]
        not dl
        cmp ebx, byte 7
        jg short .1
        mov eax, 21h
        call inp_
        and eax, 0FFh
        and edx, 0FFh
        and edx, eax
        mov eax, 21h
        jmp short .2
.1:
        mov eax, 0A1h
        call inp_
        and eax, 0FFh
        and edx, 0FFh
        and edx, eax
        mov eax, 0A1h
.2:
        call outp_
        popfw
        lea esp, [byte ebp-0Ch]
        pop edi
        pop esi
        pop edx
        pop ebp
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; GusUnhookIrq                                    DA95C  96 PC, low confidence
; Masks an IRQ line and restores its saved vector
;-----------------------------------------------------------------------------
GusUnhookIrq:
        push ebp
        mov ebp, esp
        push ebx
        push ecx
        push edx
        mov ebx, eax
        pushfw
        cli
        cmp ebx, byte 2
        je short .3
        mov cl, bl
        mov dl, 1
        and cl, 7
        shl dl, cl
        cmp ebx, byte 7
        jg short .1
        mov eax, 21h
        call inp_
        and eax, 0FFh
        and edx, 0FFh
        or edx, eax
        mov eax, 21h
        jmp short .2
.1:
        mov eax, 0A1h
        call inp_
        and eax, 0FFh
        and edx, 0FFh
        or edx, eax
        mov eax, 0A1h
.2:
        call outp_
.3:
        xor eax, eax
        mov cx, word [nosplit ebx*8+GusIrqOldSelector]
        mov ax, word [nosplit ebx*8+GusIrqVectorTable]
        mov ebx, dword [nosplit ebx*8+GusIrqOldHandler]
        call GusSetVect
        popfw
        lea esp, [byte ebp-0Ch]
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; GusSendEoi                                      DA9E4  96 PC, low confidence
; Sends end-of-interrupt to the interrupt controller(s) for an IRQ line
;-----------------------------------------------------------------------------
GusSendEoi:
        push ebp
        mov ebp, esp
        push edx
        cmp ax, 7
        jbe short .1
        mov eax, 0A0h
        mov edx, 20h
        call outp_
.1:
        mov eax, 20h
        mov edx, eax
        call outp_
        lea esp, [byte ebp-04h]
        pop edx
        pop ebp
        ret
        db 00h
;-----------------------------------------------------------------------------
; GusWaveIrqHandler                               DAA10  96 PC, low confidence
; Hardware handler for the card's wave IRQ: services it now or defers it
; while the card is busy
;-----------------------------------------------------------------------------
GusWaveIrqHandler:
        pusha
        push ds
        push es
        push fs
        push gs
        mov ebp, esp
        cld
        call RestoreDS
        xor ah, ah
        mov al, byte [GusWaveIrq]
        and eax, 0FFFFh
        call GusSendEoi
        cmp word [GusCriticalDepth], byte 0
        je short .1
        mov bx, word [GusIrqFlags]
        or bl, 2
        mov word [GusIrqFlags], bx
        jmp short .3
.1:
        mov ax, word [GusCriticalDepth]
        inc word [GusCriticalDepth]
        push ds
        pop es
.2:
        and word [GusIrqFlags], byte 0FFFDh
        call GusServiceIrq
        test word [GusIrqFlags], 2
        jne short .2
        mov ax, word [GusCriticalDepth]
        dec word [GusCriticalDepth]
.3:
        pop gs
        pop fs
        pop es
        pop ds
        popa
        iret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; GusMidiIrqHandler                               DAA8C  96 PC, low confidence
; Hardware handler for the card's MIDI IRQ line
;-----------------------------------------------------------------------------
GusMidiIrqHandler:
        pusha
        push ds
        push es
        push fs
        push gs
        mov ebp, esp
        cld
        call RestoreDS
        xor ah, ah
        mov al, byte [GusMidiIrq]
        and eax, 0FFFFh
        call GusSendEoi
        cmp dword [GusMidiPending], byte 0
        je short .1
        mov dx, word [GusIrqFlags]
        or dl, 8
        mov word [GusIrqFlags], dx
        jmp short .3
.1:
        mov eax, dword [GusMidiPending]
        inc dword [GusMidiPending]
        push ds
        pop es
.2:
        mov bx, word [GusIrqFlags]
        and bl, 0F7h
        mov word [GusIrqFlags], bx
        call GusMidiIrqService
        mov cx, word [GusIrqFlags]
        test cl, 8
        jne short .2
        mov eax, dword [GusMidiPending]
        dec dword [GusMidiPending]
.3:
        pop gs
        pop fs
        pop es
        pop ds
        popa
        iret
        db 00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; GusDelay                                        DAB11  96 PC, low confidence
; Waits a few port reads so the card can settle between register writes
;-----------------------------------------------------------------------------
GusDelay:
        push ecx
        push edx
        mov ecx, 0Ah
        mov dx, word [GusDramPort]
.1:
        in al, dx
        loopne .1
        pop edx
        pop ecx
        ret
;-----------------------------------------------------------------------------
; GusSetBasePort                                  DAB25  96 PC, low confidence
; Checks a base port (210h..260h) and moves the card's port table to it
;-----------------------------------------------------------------------------
GusSetBasePort:
        push ebx
        push ecx
        push esi
        cmp eax, 210h
        jb short .3
        nop
        nop
        nop
        nop
        cmp eax, 260h
        ja short .3
        nop
        nop
        nop
        nop
        movzx ebx, word [GusBasePort]
        LD sub, eax, ebx
        je short .2
        nop
        nop
        nop
        nop
        mov esi, GusBasePort
        mov ecx, 0Dh
.1:
        add word [esi], ax
        add esi, byte 2
        loop .1
.2:
        LD xor, eax, eax
        jmp short .4
        db 090h,090h,090h
.3:
        mov eax, 1
.4:
        pop esi
        pop ecx
        pop ebx
        ret
        db 00h
;-----------------------------------------------------------------------------
; GusClearIrqState                                DAB70  96 PC, low confidence
; Clears the pending IRQ flags and the critical-section depth
;-----------------------------------------------------------------------------
GusClearIrqState:
        mov word [GusIrqPending], 0
        mov word [GusCriticalDepth], 0
        ret
;-----------------------------------------------------------------------------
; GusEnterCritical                                DAB83  96 PC, low confidence
; Raises the critical-section depth so card interrupts are deferred
;-----------------------------------------------------------------------------
GusEnterCritical:
        inc word [GusCriticalDepth]
        ret
        pushfw
        cli
        cmp word [GusCriticalDepth], byte 0
        jne short .1
        call GusEnterCritical
        mov eax, 1
        jmp short .2
.1:
        LD xor, eax, eax
.2:
        popfw
        ret
        ret
;-----------------------------------------------------------------------------
; GusLeaveCritical                                DABAA  96 PC, low confidence
; Lowers the critical-section depth and, at zero, services interrupts that
; came in meanwhile
;-----------------------------------------------------------------------------
GusLeaveCritical:
        pushfw
        cli
        dec word [GusCriticalDepth]
        cmp word [GusCriticalDepth], byte 0
        jne short .2
        nop
        nop
        nop
        nop
.1:
        test byte [GusIrqFlags], 6
        je short .2
        nop
        nop
        nop
        nop
        and byte [GusIrqFlags], 0FDh
        call GusServiceIrq
        jmp short .1
.2:
        popfw
        ret
;-----------------------------------------------------------------------------
; GusClearCallbacks                               DABE0  96 PC, low confidence
; Clears every interrupt callback slot
;-----------------------------------------------------------------------------
GusClearCallbacks:
        push ebp
        mov ebp, esp
        push edx
        xor edx, edx
        mov dword [GusTimerCallback], edx
        mov dword [GusDmaDoneCallback], edx
        mov dword [GusRecordDoneCallback], edx
        mov dword [GusWaveCallback], edx
        mov dword [GusVolumeCallback], edx
        mov dword [GusTimer1Callback], edx
        mov dword [GusTimer2Callback], edx
        mov dword [GusWaveIrqCallback], edx
        mov dword [GusVolumeIrqCallback], edx
        mov dword [GusMidiXmitCallback], edx
        mov dword [GusMidiRecvCallback], edx
        mov dword [GusVoiceIrqBits], edx
        mov dword [GusMidiIrqCount], edx
        lea esp, [byte ebp-04h]
        pop edx
        pop ebp
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; GusClaimCallback                                DAC3C  96 PC, low confidence
; Stores a callback in a slot when the slot is free or the callback is being
; cleared
;-----------------------------------------------------------------------------
GusClaimCallback:
        push ebp
        mov ebp, esp
        push ebx
        mov ebx, eax
        cmp dword [eax], byte 0
        je short .1
        test edx, edx
        jne short .2
.1:
        pushfw
        cli
        mov dword [ebx], edx
        popfw
        xor eax, eax
        jmp short .3
.2:
        mov eax, 1
.3:
        lea esp, [byte ebp-04h]
        pop ebx
        pop ebp
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; GusClaimVoiceCallback                           DAC64  96 PC, low confidence
; Stores a voice callback in a slot when the slot is free or the callback is
; being cleared
;-----------------------------------------------------------------------------
GusClaimVoiceCallback:
        push ebp
        mov ebp, esp
        push ebx
        mov ebx, eax
        cmp dword [eax], byte 0
        je short .1
        test edx, edx
        jne short .2
.1:
        pushfw
        cli
        mov dword [ebx], edx
        popfw
        xor eax, eax
        jmp short .3
.2:
        mov eax, 1
.3:
        lea esp, [byte ebp-04h]
        pop ebx
        pop ebp
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; GusSetDmaCallbacks                              DAC8C  96 PC, low confidence
; Sets the DMA-done callbacks; returns 8 when they are already taken
;-----------------------------------------------------------------------------
GusSetDmaCallbacks:
        push ebp
        mov ebp, esp
        push ebx
        push edx
        mov ebx, eax
        mov eax, GusDmaDoneCallback
        mov edx, ebx
        call GusClaimCallback
        test eax, eax
        je short .1
        mov eax, GusRecordDoneCallback
        mov edx, ebx
        call GusClaimCallback
        test eax, eax
        je short .1
        mov eax, 8
        jmp short .2
.1:
        xor eax, eax
.2:
        lea esp, [byte ebp-08h]
        pop edx
        pop ebx
        pop ebp
        ret
        db 090h
;-----------------------------------------------------------------------------
; GusSetVoiceCallbacks                            DACC4  96 PC, low confidence
; Sets the wave, volume and timer callbacks; returns 8 when they are already
; taken
;-----------------------------------------------------------------------------
GusSetVoiceCallbacks:
        push ebp
        mov ebp, esp
        push ebx
        push edx
        mov ebx, eax
        mov eax, GusWaveCallback
        mov edx, ebx
        call GusClaimCallback
        test eax, eax
        je short .1
        mov eax, GusVolumeCallback
        mov edx, ebx
        call GusClaimCallback
        test eax, eax
        je short .1
        mov eax, 8
        jmp short .2
.1:
        xor eax, eax
.2:
        lea esp, [byte ebp-08h]
        pop edx
        pop ebx
        pop ebp
        ret
        db 090h
        push ebp
        mov ebp, esp
        push ebx
        push edx
        mov ebx, eax
        mov eax, GusTimer1Callback
        mov edx, ebx
        call GusClaimCallback
        test eax, eax
        je short .3
        mov eax, GusTimer2Callback
        mov edx, ebx
        call GusClaimCallback
        test eax, eax
        je short .3
        mov eax, 8
        jmp short .4
.3:
        xor eax, eax
.4:
        lea esp, [byte ebp-08h]
        pop edx
        pop ebx
        pop ebp
        ret
        db 090h
        push ebp
        mov ebp, esp
        cmp eax, byte 1
        jne short .5
        mov eax, GusWaveIrqCallback
        call GusClaimVoiceCallback
        test eax, eax
        je short .7
        mov eax, 8
        mov esp, ebp
        pop ebp
        ret
.5:
        cmp eax, byte 2
        jne short .6
        mov eax, GusVolumeIrqCallback
        call GusClaimVoiceCallback
        test eax, eax
        je short .7
        mov eax, 8
        mov esp, ebp
        pop ebp
        ret
.6:
        mov eax, 0Dh
.7:
        mov esp, ebp
        pop ebp
        ret
        push ebp
        mov ebp, esp
        push edx
        mov edx, eax
        mov eax, GusMidiRecvCallback
        call GusClaimVoiceCallback
        test eax, eax
        je short .8
        mov eax, 8
.8:
        lea esp, [byte ebp-04h]
        pop edx
        pop ebp
        ret
        db 090h
        push ebp
        mov ebp, esp
        push edx
        mov edx, eax
        mov eax, GusMidiXmitCallback
        call GusClaimVoiceCallback
        test eax, eax
        je short .9
        mov eax, 8
.9:
        lea esp, [byte ebp-04h]
        pop edx
        pop ebp
        ret
        db 090h
        push ebp
        mov ebp, esp
        push edx
        mov edx, eax
        mov eax, GusTimerCallback
        call GusClaimVoiceCallback
        test eax, eax
        je short .10
        mov eax, 8
.10:
        lea esp, [byte ebp-04h]
        pop edx
        pop ebp
        ret
        db 090h
;-----------------------------------------------------------------------------
; GusMidiIrqService                               DADD8  96 PC, low confidence
; Reads the MIDI status and calls the MIDI transmit or receive callbacks
;-----------------------------------------------------------------------------
GusMidiIrqService:
        push ebp
        mov ebp, esp
        push ebx
        push ecx
        push edx
        push edi
        sub esp, byte 4
        pushfw
        cli
        inc dword [GusMidiIrqCount]
        xor eax, eax
        mov ax, word [GusIrqStatusPort]
        call inp_
        mov edx, eax
        mov dword [byte ebp-014h], eax
        test al, 3
        je short .2
        xor eax, eax
        mov ax, word [GusMidiControlPort]
        call inp_
        mov ebx, eax
        mov ecx, eax
        test dl, 1
        je short .1
        cmp dword [GusMidiXmitCallback], byte 0
        je short .1
        call dword [GusMidiXmitCallback]
.1:
        test byte [byte ebp-014h], 2
        je short .2
        xor eax, eax
        mov ax, word [GusMidiDataPort]
        call inp_
        mov edi, dword [GusMidiRecvCallback]
        mov edx, eax
        test edi, edi
        je short .2
        mov eax, ecx
        call dword [GusMidiRecvCallback]
.2:
        dec dword [GusMidiIrqCount]
        popfw
        lea esp, [byte ebp-010h]
        pop edi
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; GusReadIrqSource                                DAE60  96 PC, low confidence
; Reads the card's IRQ status register and services MIDI interrupts on a
; shared line
;-----------------------------------------------------------------------------
GusReadIrqSource:
        push ebp
        mov ebp, esp
        push ebx
        push edx
        xor eax, eax
        cli
        mov ax, word [GusIrqStatusPort]
        call inp_
        mov ebx, eax
        mov edx, eax
        mov al, byte [GusMidiIrq]
        cmp al, byte [GusWaveIrq]
        je short .1
        and bl, 0FCh
        mov edx, ebx
.1:
        test dl, 3
        je short .2
        call GusMidiIrqService
.2:
        mov eax, edx
        lea esp, [byte ebp-08h]
        pop edx
        pop ebx
        pop ebp
        ret
;-----------------------------------------------------------------------------
; GusServiceIrq                                   DAE9C  96 PC, low confidence
; Services every pending card interrupt: DMA done, timers, voice wave and
; volume ends
;-----------------------------------------------------------------------------
GusServiceIrq:
        push ebp
        mov ebp, esp
        push ebx
        push ecx
        push edx
        push esi
        push edi
        pushfw
        cli
        mov ax, word [GusCriticalDepth]
        inc word [GusCriticalDepth]
        xor edi, edi
        xor esi, esi
.1:
        call GusReadIrqSource
        mov ebx, eax
        test eax, eax
        jne short .2
        mov cx, word [GusIrqFlags]
        test cl, 4
        je near .18
.2:
        test bl, 80h
        jne short .3
        mov ax, word [GusIrqFlags]
        test al, 4
        je near .6
.3:
        xor eax, eax
        mov edx, 41h
        mov ax, word [GusRegSelectPort]
        call outp_
        xor eax, eax
        mov ax, word [GusDataHighPort]
        call inp_
        test al, 40h
        jne short .4
        mov dx, word [GusIrqFlags]
        test dl, 4
        je short .5
.4:
        mov cx, word [GusIrqFlags]
        and cl, 0FBh
        mov word [GusIrqFlags], cx
        cmp dword [GusDmaDoneCallback], byte 0
        je short .5
        mov eax, 1
        call dword [GusDmaDoneCallback]
        test eax, eax
        jne short .5
        cmp dword [GusRecordDoneCallback], byte 0
        je short .5
        mov eax, 1
        call dword [GusRecordDoneCallback]
.5:
        xor eax, eax
        mov edx, 49h
        mov ax, word [GusRegSelectPort]
        call outp_
        xor eax, eax
        mov ax, word [GusDataHighPort]
        call inp_
        test al, 40h
        je short .6
        cmp dword [GusDmaDoneCallback], byte 0
        je short .6
        xor eax, eax
        call dword [GusDmaDoneCallback]
        test eax, eax
        jne short .6
        cmp dword [GusRecordDoneCallback], byte 0
        je short .6
        call dword [GusRecordDoneCallback]
.6:
        test bl, 4
        je short .7
        xor eax, eax
        mov edx, 45h
        mov ax, word [GusRegSelectPort]
        call outp_
        xor eax, eax
        mov edx, dword [GusVoiceIrqBits]
        mov ax, word [GusDataHighPort]
        and dl, 0FBh
        call outp_
        xor eax, eax
        mov edx, dword [GusVoiceIrqBits]
        mov ax, word [GusDataHighPort]
        call outp_
        cmp dword [GusWaveIrqCallback], byte 0
        je short .7
        call dword [GusWaveIrqCallback]
        test eax, eax
        je short .7
        xor eax, eax
        mov dword [GusWaveIrqCallback], eax
.7:
        test bl, 8
        je short .8
        xor eax, eax
        mov edx, 45h
        mov ax, word [GusRegSelectPort]
        call outp_
        xor eax, eax
        mov edx, dword [GusVoiceIrqBits]
        mov ax, word [GusDataHighPort]
        and dl, 0F7h
        call outp_
        xor eax, eax
        mov edx, dword [GusVoiceIrqBits]
        mov ax, word [GusDataHighPort]
        call outp_
        cmp dword [GusVolumeIrqCallback], byte 0
        je short .8
        call dword [GusVolumeIrqCallback]
        test eax, eax
        je short .8
        xor ecx, ecx
        mov dword [GusVolumeIrqCallback], ecx
.8:
        test bl, 60h
        je near .1
.9:
        cli
        xor eax, eax
        mov edx, 8Fh
        mov ax, word [GusRegSelectPort]
        call outp_
        xor eax, eax
        mov ax, word [GusDataHighPort]
        call inp_
        mov ch, al
        mov al, ch
        and al, 0C0h
        cmp al, 0C0h
        je near .1
        mov al, ch
        mov ebx, 1
        and al, 1Fh
        xor edx, edx
        mov cl, al
        mov dl, al
        shl ebx, cl
        test ch, 80h
        jne short .13
        test edi, ebx
        je short .10
        mov eax, ebx
        not eax
        and edi, eax
        jmp short .13
.10:
        cmp dword [GusWaveCallback], byte 0
        je short .11
        mov eax, edx
        call dword [GusWaveCallback]
        test eax, eax
        jne short .12
.11:
        cmp dword [GusVolumeCallback], byte 0
        je short .13
        mov eax, edx
        call dword [GusVolumeCallback]
        test eax, eax
        je short .13
.12:
        or edi, ebx
.13:
        test ch, 40h
        jne short .17
        test esi, ebx
        je short .14
        not ebx
        and esi, ebx
        jmp short .17
.14:
        cmp dword [GusTimer1Callback], byte 0
        je short .15
        mov eax, edx
        call dword [GusTimer1Callback]
        test eax, eax
        jne short .16
.15:
        cmp dword [GusTimer2Callback], byte 0
        je short .17
        mov eax, edx
        call dword [GusTimer2Callback]
        test eax, eax
        je short .17
.16:
        or esi, ebx
.17:
        call GusReadIrqSource
        jmp near .9
.18:
        mov ax, word [GusCriticalDepth]
        dec word [GusCriticalDepth]
        popfw
        lea esp, [byte ebp-014h]
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        pop ebp
        ret
