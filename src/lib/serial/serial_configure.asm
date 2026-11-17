; Serial port: SerialConfigure, SerialOpen, SerialClose, SerialCloseAll, SerialSetBaud and 16 more.
bits 32
%include "hockey.inc"
section s_B1039 progbits alloc exec nowrite align=1
extern AddExitHandler, DosGetVector, DosSetVector, GetTicks, SerialBaudDivisors, SerialIrqMask, SerialPortCom1, SerialPortCom2
extern SerialPortCom3, SerialPortCom4, SerialPortTable, TicksSince
global SerialConfigure, SerialOpen, SerialClose, SerialCloseAll, SerialSetBaud, SerialRaiseDtr, SerialDropDtr, SerialCarrier
global SerialCarrier_75, SerialWrite, SerialWrite_5, SerialTxFree, SerialFlushTx, SerialWaitTxEmpty, SerialRead, SerialReadWait
global SerialReadWait_1A, SerialFlushRx, SerialIsrCom1, SerialIsrCom2, SerialIsrCom3, SerialIsrCom4, SerialIsrCom1_85, SerialIsrJumpTable
global SerialIsrExit
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; SerialConfigure                                 B103C  96 PC, low confidence
; Serial port: sets the port's address, interrupt and buffers
;-----------------------------------------------------------------------------
SerialConfigure:
        push ebp
        LD mov, ebp, esp
        mov ebx, dword [byte ebp+08h]
        mov ebx, dword [nosplit ebx*4+SerialPortTable]
        mov eax, dword [byte ebp+0Ch]
        mov byte [ebx], al
        mov eax, dword [byte ebp+010h]
        mov byte [byte ebx+01h], al
        mov eax, dword [byte ebp+014h]
        mov byte [byte ebx+02h], al
        mov eax, dword [byte ebp+018h]
        mov byte [byte ebx+03h], al
        mov dx, word [byte ebx+08h]
        and dx, byte 0FFF8h
        or dx, byte 1
        LD xor, ax, ax
        out dx, al
        and dx, byte 0FFF8h
        or dx, byte 4
        mov al, 9
        out dx, al
        and dx, byte 0FFF8h
        or dx, byte 3
        mov eax, dword [byte ebp+018h]
        mov ecx, dword [byte ebp+014h]
        LD add, cl, cl
        LD add, cl, cl
        LD or, al, cl
        mov ecx, dword [byte ebp+010h]
        LD add, cl, cl
        LD add, cl, cl
        LD add, cl, cl
        LD or, al, cl
        or al, 80h
        out dx, al
        and dx, byte 0FFF8h
        or dx, byte 0
        mov ebx, dword [byte ebp+0Ch]
        LD add, ebx, ebx
        mov ax, word [dword ebx+SerialBaudDivisors]
        out dx, ax
        and dx, byte 0FFF8h
        or dx, byte 3
        in al, dx
        and al, 1Fh
        out dx, al
        and dx, byte 0FFF8h
        or dx, byte 5
        in al, dx
        and dx, byte 0FFF8h
        in al, dx
        or dx, byte 2
        in al, dx
        and dx, byte 0FFF8h
        or dx, byte 6
        in al, dx
        mov al, 3
        and dx, byte 0FFF8h
        or dx, byte 1
        out dx, al
        leave
        ret
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov dx, word [byte ebx+08h]
        or dx, byte 2
        mov al, 87h
        out dx, al
        LD xor, eax, eax
        mov dx, word [byte ebx+08h]
        or dx, byte 2
        in al, dx
        and al, 80h
        leave
        ret
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov eax, dword [byte ebx+044h]
        leave
        ret
;-----------------------------------------------------------------------------
; SerialOpen                                   B1121  96 PC, medium confidence
; Opens a serial port: sets its UART, installs its interrupt handler and adds
; the exit handler
;-----------------------------------------------------------------------------
SerialOpen:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFFCh
        push esi
        mov ax, ds
        mov word [SerialIrqMask], ax
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov dword [byte ebp-04h], ebx
        LD xor, eax, eax
        mov al, byte [byte ebx+03h]
        push eax
        mov al, byte [byte ebx+02h]
        push eax
        mov al, byte [byte ebx+01h]
        push eax
        mov al, byte [ebx]
        push eax
        push dword [byte ebp+08h]
        call SerialConfigure
        add esp, byte 14h
        mov ebx, dword [byte ebp-04h]
        mov eax, dword [byte ebx+010h]
        LD or, eax, eax
        jne near .1
        LD xor, eax, eax
        mov ax, word [byte ebx+04h]
        LD mov, ebx, eax
        call DosGetVector
        mov ebx, dword [byte ebp-04h]
        mov dword [byte ebx+0Ah], eax
        mov word [byte ebx+0Eh], dx
        mov dx, cs
        mov eax, dword [byte ebx+014h]
        LD xor, ecx, ecx
        mov cx, word [byte ebx+04h]
        LD mov, ebx, ecx
        call DosSetVector
        mov ebx, dword [byte ebp-04h]
        mov dword [byte ebx+010h], 1
        lea eax, [byte ebx+04Ch]
        mov dword [byte ebx+018h], eax
        mov dword [byte ebx+020h], eax
        mov dword [byte ebx+024h], eax
        add eax, 200h
        mov dword [byte ebx+01Ch], eax
        mov dword [byte ebx+02Ch], eax
        mov dword [byte ebx+034h], eax
        mov dword [byte ebx+038h], eax
        add eax, 200h
        mov dword [byte ebx+030h], eax
        mov dx, word [byte ebx+08h]
        or dx, byte 2
        mov al, 87h
        out dx, al
        mov ax, word [byte ebx+04h]
        shr al, 2
        and al, 7
        or al, 0C0h
        out 20h, al
        pushf
        cli
        in al, 21h
        mov dx, word [byte ebx+06h]
        not dl
        LD and, al, dl
        out 21h, al
        popf
        push SerialCloseAll
        call AddExitHandler
        add esp, byte 4
.1:
        pop esi
        leave
        ret
;-----------------------------------------------------------------------------
; SerialClose                                     B11F8  96 PC, low confidence
; Serial port: disables the port and restores its interrupt
;-----------------------------------------------------------------------------
SerialClose:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov eax, dword [byte ebx+010h]
        LD or, eax, eax
        je short .1
        mov dword [byte ebx+010h], 0
        in al, 21h
        or ax, word [byte ebx+06h]
        out 21h, al
        mov dx, word [byte ebx+0Eh]
        mov eax, dword [byte ebx+0Ah]
        LD xor, ecx, ecx
        mov cx, word [byte ebx+04h]
        LD mov, ebx, ecx
        call DosSetVector
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        push dword [byte ebx+018h]
        add esp, byte 4
.1:
        leave
        ret
;-----------------------------------------------------------------------------
; SerialCloseAll                                  B1241  96 PC, low confidence
; Serial port: closes both ports
;-----------------------------------------------------------------------------
SerialCloseAll:
        pusha
        push byte 0
        call SerialClose
        push byte 1
        call SerialClose
        add esp, byte 8
        popa
        ret
;-----------------------------------------------------------------------------
; SerialSetBaud                                   B1255  96 PC, low confidence
; Serial port: sets the baud rate
;-----------------------------------------------------------------------------
SerialSetBaud:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov eax, dword [byte ebp+0Ch]
        mov word [byte ebx+06h], ax
        mov edx, 7
.1:
        inc edx
        shr eax, 1
        jne short .1
        mov word [byte ebx+04h], dx
        leave
        ret
;-----------------------------------------------------------------------------
; SerialRaiseDtr                                  B1279  96 PC, low confidence
; Serial port: raises DTR
;-----------------------------------------------------------------------------
SerialRaiseDtr:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov dx, word [byte ebx+08h]
        or dx, byte 4
        in al, dx
        or al, 1
        out dx, al
        leave
        ret
;-----------------------------------------------------------------------------
; SerialDropDtr                                   B1294  96 PC, low confidence
; Drops DTR on a serial port to hang up
;-----------------------------------------------------------------------------
SerialDropDtr:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov dx, word [byte ebx+08h]
        or dx, byte 4
        in al, dx
        and al, 0FEh
        out dx, al
        leave
        ret
;-----------------------------------------------------------------------------
; SerialCarrier                                B12AF  96 PC, medium confidence
; Returns the carrier detect bit of a serial port
;-----------------------------------------------------------------------------
SerialCarrier:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov dx, word [byte ebx+08h]
        or dx, byte 6
        LD xor, eax, eax
        pushf
        cli
        in al, dx
        popf
        and al, 80h
        leave
        ret
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        call GetTicks
        LD mov, esi, eax
.1:
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov eax, 200h
        sub eax, dword [byte ebx+028h]
        cmp eax, dword [byte ebp+0Ch]
        jge short SerialWrite_5
        push esi
        call TicksSince
        add esp, byte 4
        cmp eax, dword [byte ebp+014h]
        jl short .1
        LD xor, eax, eax
        pop edi
        pop esi
        leave
        ret
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov eax, 200h
        sub eax, dword [byte ebx+028h]
        cmp eax, dword [byte ebp+0Ch]
        jge short SerialWrite_5
        LD xor, ax, ax
SerialCarrier_75:
        pop edi
        pop esi
        leave
        ret
;-----------------------------------------------------------------------------
; SerialWrite                                     B1328  96 PC, low confidence
; Serial port: puts bytes in the send buffer and starts sending
;-----------------------------------------------------------------------------
SerialWrite:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
SerialWrite_5:
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        pushf
        mov ecx, dword [byte ebp+0Ch]
        LD or, ecx, ecx
        jle short SerialCarrier_75
        mov esi, dword [byte ebp+010h]
        mov edi, dword [byte ebx+024h]
        mov edx, dword [byte ebx+01Ch]
.1:
        mov al, byte [esi]
        mov byte [edi], al
        inc esi
        inc edi
        LD cmp, edi, edx
        jb short .2
        mov edi, dword [byte ebx+018h]
.2:
        loop .1
        mov dword [byte ebx+024h], edi
        cli
        mov eax, dword [byte ebp+0Ch]
        mov edx, dword [byte ebx+028h]
        LD or, edx, edx
        jl short .3
        LD add, eax, edx
.3:
        mov dword [byte ebx+028h], eax
        mov dx, word [byte ebx+08h]
        or dx, byte 4
        in al, dx
        or al, 2
        jmp short .4
.4:
        out dx, al
        and dx, byte 0FFF8h
        or dx, byte 5
        jmp short .5
.5:
        in al, dx
        test al, 20h
        je short .7
        dec dword [byte ebx+028h]
        mov esi, dword [byte ebx+020h]
        mov al, byte [esi]
        inc esi
        cmp esi, dword [byte ebx+01Ch]
        jb short .6
        mov esi, dword [byte ebx+018h]
.6:
        mov word [byte ebx+020h], si
        and dx, byte 0FFF8h
        out dx, al
.7:
        popf
        mov eax, dword [byte ebp+0Ch]
        pop edi
        pop esi
        leave
        ret
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov eax, dword [byte ebx+028h]
        leave
        ret
;-----------------------------------------------------------------------------
; SerialTxFree                                 B13BB  96 PC, medium confidence
; Returns the free room in a serial port's transmit buffer
;-----------------------------------------------------------------------------
SerialTxFree:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov eax, 200h
        sub eax, dword [byte ebx+028h]
        leave
        ret
;-----------------------------------------------------------------------------
; SerialFlushTx                                   B13D2  96 PC, low confidence
; Serial port: empties the send buffer
;-----------------------------------------------------------------------------
SerialFlushTx:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        pushf
        cli
        mov eax, dword [byte ebx+020h]
        mov dword [byte ebx+024h], eax
        mov dword [byte ebx+028h], 0FFFFFFFFh
        popf
        leave
        ret
;-----------------------------------------------------------------------------
; SerialWaitTxEmpty                               B13F1  96 PC, low confidence
; Serial port: waits until the send buffer is empty or the time runs out
;-----------------------------------------------------------------------------
SerialWaitTxEmpty:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFFCh
        push edi
        push esi
        call GetTicks
        LD mov, esi, eax
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov dword [byte ebp-04h], ebx
.1:
        mov ebx, dword [byte ebp-04h]
        mov ecx, dword [byte ebp+0Ch]
        cmp ecx, dword [byte ebx+03Ch]
        jle short .2
        push esi
        call TicksSince
        add esp, byte 4
        cmp eax, dword [byte ebp+014h]
        jl short .1
        mov ebx, dword [byte ebp-04h]
        mov ecx, dword [byte ebx+03Ch]
        mov dword [byte ebp+0Ch], ecx
.2:
        jmp short SerialReadWait_1A
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFFCh
        push edi
        push esi
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov ecx, dword [byte ebp+0Ch]
        cmp ecx, dword [byte ebx+03Ch]
        jle short SerialReadWait_1A
        LD xor, eax, eax
        pop esi
        pop edi
        leave
        ret
;-----------------------------------------------------------------------------
; SerialRead                                   B1451  96 PC, medium confidence
; Reads up to n bytes from a serial port's receive buffer and returns the
; count
;-----------------------------------------------------------------------------
SerialRead:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFFCh
        push edi
        push esi
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov ecx, dword [byte ebx+03Ch]
        LD or, ecx, ecx
        jne short .1
        LD xor, eax, eax
        pop esi
        pop edi
        leave
        ret
.1:
        cmp ecx, dword [byte ebp+0Ch]
        jle short SerialReadWait_1A
        mov ecx, dword [byte ebp+0Ch]
        jmp short SerialReadWait_1A
;-----------------------------------------------------------------------------
; SerialReadWait                                  B147A  96 PC, low confidence
; Waits until n bytes are in a serial port's receive buffer, then reads them
;-----------------------------------------------------------------------------
SerialReadWait:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFFCh
        push edi
        push esi
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov ecx, dword [byte ebp+0Ch]
.1:
        cmp ecx, dword [byte ebx+03Ch]
        jg short .1
SerialReadWait_1A:
        cld
        mov dword [byte ebp+0Ch], ecx
        LD or, ecx, ecx
        jle short .4
        mov edi, dword [byte ebp+010h]
        mov edx, dword [byte ebx+030h]
        mov esi, dword [byte ebx+038h]
.2:
        mov al, byte [esi]
        mov byte [edi], al
        inc esi
        inc edi
        LD cmp, esi, edx
        jb short .3
        mov esi, dword [byte ebx+02Ch]
.3:
        loop .2
        mov dword [byte ebx+038h], esi
.4:
        mov eax, dword [byte ebp+0Ch]
        LD or, eax, eax
        je short .5
        sub dword [byte ebx+03Ch], eax
        pushf
        cli
        mov ecx, dword [byte ebx+040h]
        mov dword [byte ebx+040h], 0
        popf
        LD or, ecx, ecx
        je short .5
        neg eax
.5:
        pop esi
        pop edi
        leave
        ret
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFFCh
        push edi
        push esi
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        mov eax, dword [byte ebx+03Ch]
        LD or, eax, eax
        je short .9
        mov ecx, dword [byte ebp+0Ch]
        LD cmp, ecx, eax
        jle short .6
        LD mov, ecx, eax
.6:
        LD mov, eax, ecx
        LD or, ecx, ecx
        jle short .9
        push eax
        mov edi, dword [byte ebp+010h]
        mov edx, dword [byte ebx+030h]
        mov esi, dword [byte ebx+038h]
.7:
        mov al, byte [esi]
        mov byte [edi], al
        inc esi
        inc edi
        LD cmp, esi, edx
        jb short .8
        mov esi, dword [byte ebx+02Ch]
.8:
        loop .7
        pop eax
.9:
        pop esi
        pop edi
        leave
        ret
;-----------------------------------------------------------------------------
; SerialFlushRx                                B151E  96 PC, medium confidence
; Empties a serial port's receive buffer
;-----------------------------------------------------------------------------
SerialFlushRx:
        push ebp
        LD mov, ebp, esp
        mov eax, dword [byte ebp+08h]
        mov ebx, dword [nosplit eax*4+SerialPortTable]
        pushf
        cli
        mov eax, dword [byte ebx+034h]
        mov dword [byte ebx+038h], eax
        mov dword [byte ebx+03Ch], 0
        popf
        leave
        ret
;-----------------------------------------------------------------------------
; SerialIsrCom1                                   B153D  96 PC, low confidence
; Serial interrupt handler for the first port
;-----------------------------------------------------------------------------
SerialIsrCom1:
        push ebx
        lea ebx, [SerialPortCom1]
        jmp short SerialIsrCom4.1
;-----------------------------------------------------------------------------
; SerialIsrCom2                                   B1546  96 PC, low confidence
; Serial interrupt handler for the second port
;-----------------------------------------------------------------------------
SerialIsrCom2:
        push ebx
        lea ebx, [SerialPortCom2]
        jmp short SerialIsrCom4.1
;-----------------------------------------------------------------------------
; SerialIsrCom3                                   B154F  96 PC, low confidence
; Serial interrupt handler for the third port
;-----------------------------------------------------------------------------
SerialIsrCom3:
        push ebx
        lea ebx, [SerialPortCom3]
        jmp short SerialIsrCom4.1
;-----------------------------------------------------------------------------
; SerialIsrCom4                                   B1558  96 PC, low confidence
; Serial interrupt handler for the fourth port, and the body all four share
;-----------------------------------------------------------------------------
SerialIsrCom4:
        push ebx
        lea ebx, [SerialPortCom4]
.1:
        push eax
        push ecx
        push edx
        push esi
        push edi
        push ds
        db 066h,02Eh,0A1h                       ; insn: mov ax,[cs:SerialIrqMask]
        dd SerialIrqMask
        mov ds, ax
        inc dword [byte ebx+044h]
        cld
        mov dx, word [byte ebx+08h]
        or dx, byte 2
        LD xor, eax, eax
        in al, dx
        test al, 1
        je short SerialIsrCom1_85.2
        jmp short SerialIsrExit
        db 01Fh,05Fh,05Eh,05Ah,059h,058h,03Bh,01Dh
        dd SerialPortTable
        db 075h,08h,05Bh,0EAh
        dd SerialPortCom1+0Ah wrt ..gotoff
        db 00h,00h,03Bh,01Dh
        dd SerialPortTable+4
        db 075h,08h,05Bh,0EAh
        dd SerialPortCom2+0Ah wrt ..gotoff
        db 00h,00h,03Bh,01Dh
        dd SerialPortTable+8
        db 075h,08h,05Bh,0EAh
        dd SerialPortCom3+0Ah wrt ..gotoff
        db 00h,00h,05Bh,0EAh
        dd SerialPortCom4+0Ah wrt ..gotoff
        db 00h,00h
;-----------------------------------------------------------------------------
; SerialIsrCom1_85                                                     B15C2  
; Serial port interrupt body: reads the interrupt id and jumps to the receive,
; send or status case
;-----------------------------------------------------------------------------
SerialIsrCom1_85:
        mov dx, word [byte ebx+08h]
        or dx, byte 2
        LD xor, eax, eax
        in al, dx
        test al, 1
        jne short SerialIsrExit
.2:
        LD mov, esi, eax
        and esi, byte 6
        jmp dword [nosplit cs:esi*2+SerialIsrJumpTable]
SerialIsrJumpTable:                             ; jump table for the switch cases of SerialIsrCom4
        dd SerialIsrExit.1
        dd SerialIsrExit.6
        dd SerialIsrExit.12
        dd SerialIsrExit.12
;-----------------------------------------------------------------------------
; SerialIsrExit                                   B15EE  96 PC, low confidence
; Serial interrupt exit: acknowledges the interrupt and returns
;-----------------------------------------------------------------------------
SerialIsrExit:
        mov al, 20h
        out 20h, al
        pop ds
        pop edi
        pop esi
        pop edx
        pop ecx
        pop eax
        pop ebx
        iret
.1:
        and dx, byte 0FFF8h
        or dx, byte 6
        in al, dx
        test al, 8
        je short .4
.2:
        test al, 80h
        je short .3
        jmp short .12
.3:
        jmp short SerialIsrCom1_85
.4:
        test al, 1
        je short .5
        test al, 10h
        je short .2
        jmp short .6
.5:
        test al, 2
        je short .2
        test al, 20h
        je short .2
        jmp short .12
.6:
        mov ecx, dword [byte ebx+028h]
        dec ecx
        jl short .8
        mov esi, dword [byte ebx+020h]
        mov al, byte [esi]
        and dx, byte 0FFF8h
        out dx, al
        mov dword [byte ebx+028h], ecx
        inc esi
        cmp esi, dword [byte ebx+01Ch]
        jb short .7
        mov esi, dword [byte ebx+018h]
.7:
        mov dword [byte ebx+020h], esi
        jmp near SerialIsrCom1_85
.8:
        cmp ecx, byte 0FFFFFFFFh
        jne short .9
        mov dword [byte ebx+028h], ecx
        jmp near SerialIsrCom1_85
.9:
        and dx, byte 0FFF8h
        or dx, byte 4
        in al, dx
        and al, 19h
        jmp short .10
.10:
        out dx, al
.11:
        jmp near SerialIsrCom1_85
.12:
        and dx, byte 0FFF8h
        or dx, byte 5
        in al, dx
        LD mov, ah, al
        test ah, 10h
        jne short .11
        test ah, 1
        je short .11
        and dx, byte 0FFF8h
        in al, dx
        test ah, 2
        je short .14
        inc dword [byte ebx+03Ch]
        inc dword [byte ebx+040h]
        mov esi, dword [byte ebx+034h]
        mov byte [esi], 0
        inc esi
        cmp esi, dword [byte ebx+030h]
        jb short .13
        mov esi, dword [byte ebx+02Ch]
.13:
        mov dword [byte ebx+034h], esi
.14:
        inc dword [byte ebx+03Ch]
        mov esi, dword [byte ebx+034h]
        mov byte [esi], al
        inc esi
        cmp esi, dword [byte ebx+030h]
        jb short .15
        mov esi, dword [byte ebx+02Ch]
.15:
        mov dword [byte ebx+034h], esi
        mov ecx, dword [byte ebx+03Ch]
        cmp ecx, 200h
        jle short .16
        add dword [byte ebx+040h], 10000h
.16:
        jmp near SerialIsrCom1_85
