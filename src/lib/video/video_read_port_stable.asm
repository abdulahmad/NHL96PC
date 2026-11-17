; Video: ReadPortStable, WaitRetrace, WaitRetraceEdges, WaitDisplayRetrace, SetCrtcStart and 3 more.
bits 32
%include "hockey.inc"
section s_DDE72 progbits alloc exec nowrite align=1
extern RetraceMode, RetraceTimeout
global ReadPortStable, WaitRetrace, WaitRetrace_36, WaitRetraceEdges, WaitDisplayRetrace, SetCrtcStart, WriteSequencerReg, ClearChain4
global SetModeX, ModeXCrtcTable
        db 00h,00h
;-----------------------------------------------------------------------------
; ReadPortStable                                  DDE74  96 PC, low confidence
; Reads a port twice and returns the bits set in both reads
;-----------------------------------------------------------------------------
ReadPortStable:
        in al, dx
        LD mov, ah, al
        in al, dx
        LD and, al, ah
        ret
;-----------------------------------------------------------------------------
; WaitRetrace                                                     DDE7B  96 PC
; Busy-wait for the VGA vertical retrace
;-----------------------------------------------------------------------------
WaitRetrace:
        mov dx, 3DAh
        mov ecx, dword [RetraceTimeout]
        cmp dword [RetraceMode], byte 1
        jg short .3
        je short .2
.1:
        call ReadPortStable
        test al, 8
        loopne .1
        jecxz WaitRetrace_36
.2:
        call ReadPortStable
        test al, 8
        loope .2
        jecxz WaitRetrace_36
.3:
        mov dword [RetraceTimeout], 186A0h
        ret
WaitRetrace_36:
        mov dword [RetraceTimeout], 2710h
        ret
;-----------------------------------------------------------------------------
; WaitRetraceEdges                             DDEBC  96 PC, medium confidence
; As WaitRetrace, always waiting for both edges
;-----------------------------------------------------------------------------
WaitRetraceEdges:
        mov dx, 3DAh
        mov ecx, dword [RetraceTimeout]
.1:
        call ReadPortStable
        test al, 8
        loopne .1
        jecxz WaitRetrace_36
.2:
        call ReadPortStable
        test al, 8
        loope .2
        jecxz WaitRetrace_36
        mov dword [RetraceTimeout], 186A0h
        ret
;-----------------------------------------------------------------------------
; WaitDisplayRetrace                           DDEE7  96 PC, medium confidence
; Waits for display enable, then for the start of vertical retrace (port
; 3DAh, bit 3); entry after the ret of WaitRetraceEdges
;-----------------------------------------------------------------------------
WaitDisplayRetrace:
        mov dx, 3DAh
        mov ecx, dword [RetraceTimeout]
.1:
        call ReadPortStable
        test al, 8
        loope .1
        jecxz WaitRetrace_36
.2:
        call ReadPortStable
        test al, 8
        loopne .2
        jecxz WaitRetrace_36
        mov dword [RetraceTimeout], 186A0h
        ret
        mov dx, 3DAh
        call ReadPortStable
        and eax, byte 8
        shr eax, 3
        ret
        db 00h,00h
;-----------------------------------------------------------------------------
; SetCrtcStart                                 DDF24  96 PC, medium confidence
; Page flip: set the CRTC start address
;-----------------------------------------------------------------------------
SetCrtcStart:
        mov ebx, dword [byte esp+04h]
        mov edx, 3D4h
        mov al, 0Ch
        LD mov, ah, bh
        mov cl, 0Dh
        LD mov, ch, bl
        out dx, ax
        LD mov, eax, ecx
        out dx, ax
        ret
        mov eax, dword [byte esp+04h]
        mov edx, 3C4h
        out dx, al
        mov edx, 3C5h
        LD xor, eax, eax
        in al, dx
        ret
;-----------------------------------------------------------------------------
; WriteSequencerReg                            DDF4F  96 PC, medium confidence
; Writes a VGA sequencer register (index, value)
;-----------------------------------------------------------------------------
WriteSequencerReg:
        mov al, byte [byte esp+04h]
        mov ah, byte [byte esp+08h]
        mov edx, 3C4h
        out dx, ax
        ret
        mov eax, dword [byte esp+04h]
        mov edx, 3D4h
        out dx, al
        mov edx, 3D5h
        LD xor, eax, eax
        in al, dx
        ret
        mov al, byte [byte esp+04h]
        mov ah, byte [byte esp+08h]
        mov edx, 3D4h
        out dx, ax
        ret
        mov al, byte [byte esp+04h]
        mov edx, 3C0h
        out dx, al
        mov al, byte [byte esp+08h]
        out dx, al
        ret
        db 00h,00h
;-----------------------------------------------------------------------------
; ClearChain4                                  DDF94  96 PC, medium confidence
; Clear Chain-4 (sequencer register 4 bit 3) after mode 13h for the unchained
; pages
;-----------------------------------------------------------------------------
ClearChain4:
        mov dx, 3C4h
        mov al, 4
        out dx, al
        inc dx
        in al, dx
        and al, 0F7h
        or al, 4
        out dx, al
        mov dx, 3CEh
        mov al, 5
        out dx, al
        inc dx
        in al, dx
        and al, 0EFh
        out dx, al
        dec dx
        mov al, 6
        out dx, al
        inc dx
        in al, dx
        and al, 0FDh
        out dx, al
        mov dx, 3D4h
        mov al, 11h
        out dx, al
        inc dx
        in al, dx
        and al, 7Fh
        out dx, al
        mov dx, 3D4h
        mov al, 14h
        out dx, al
        inc dx
        in al, dx
        and al, 0BFh
        out dx, al
        dec dx
        mov al, 17h
        out dx, al
        inc dx
        in al, dx
        or al, 40h
        out dx, al
        mov dx, 3D4h
        mov al, 11h
        out dx, al
        inc dx
        in al, dx
        or al, 80h
        out dx, al
        ret
        mov dx, 3D4h
        mov al, 11h
        out dx, al
        inc dx
        in al, dx
        and al, 7Fh
        out dx, al
        mov dx, 3D4h
        mov al, 9
        out dx, al
        inc dx
        in al, dx
        and al, 0E0h
        or al, byte [byte esp+04h]
        out dx, al
        mov dx, 3D4h
        mov al, 11h
        out dx, al
        inc dx
        in al, dx
        or al, 80h
        out dx, al
        ret
;-----------------------------------------------------------------------------
; SetModeX                                        DE01A  96 PC, low confidence
; Sets the unchained 256 colour VGA mode from mode 13h, loading its CRTC
; registers
;-----------------------------------------------------------------------------
SetModeX:
        push esi
        push edi
        mov dx, 3C4h
        mov ax, 604h
        out dx, ax
        mov ax, 100h
        out dx, ax
        mov dx, 3C2h
        mov al, 0E3h
        out dx, al
        mov dx, 3C4h
        mov ax, 300h
        out dx, ax
        mov dx, 3D4h
        mov al, 11h
        out dx, al
        inc dx
        in al, dx
        and al, 7Fh
        out dx, al
        dec dx
        cld
        mov esi, ModeXCrtcTable
        mov ecx, 0Ah
.1:
        lodsw
        out dx, ax
        loop .1
        mov dx, 3D4h
        mov al, 11h
        out dx, al
        inc dx
        in al, dx
        or al, 80h
        out dx, al
        pop edi
        pop esi
        ret
ModeXCrtcTable:                                 ; used by SetModeX
        db 06h,0Dh,07h,03Eh,09h,041h,010h,0EAh,011h,0ACh,012h,0DFh,014h,00h,015h,0E7h
        db 016h,06h,017h,0E3h,00h,00h,00h
