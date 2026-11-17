; Watcom C runtime: start, WriteConsoleMessage, RestoreDS.
bits 32
%include "hockey.inc"
section s_B6305 progbits alloc exec nowrite align=1
extern ___begtext, __CMain, __FiniRtns, __InitRtns, __no87, __saved_DS, _curbrk, _dynend
extern _Envptr, _Envptr_w4, _Extender, _ExtenderSubtype, _LpCmdLine, _osmajor, _osminor, _psp
extern _STACKLOW, _STACKTOP, EmuHookFlags, FpuFlags, kaufmfont, StackLow, StartupStack
global start, start_74, start_28F, WriteConsoleMessage, WriteConsoleMessage_23, RestoreDS
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; start                                                         B6308  library
; Program entry point: the C run-time start-up
;-----------------------------------------------------------------------------
start:
        jmp short start_74.1
        push edi
        inc ecx
        push esp
        inc ebx
        dec edi
        dec ebp
        and byte [byte ebx+02Fh], al
        inc ebx
        sub ebp, dword [ebx]
        xor esi, dword [edx]
        and byte [byte edx+075h], dl
        outsb
        sub eax, 656D6954h
        and byte [byte ebx+079h], dh
        db 073h,074h                            ; insn: raw (target B639A unlabelled)
        db 065h,06Dh                            ; insn: insd
        and byte [cs:eax], ch
        arpl word [ecx], bp
        and byte [byte ebx+06Fh], al
        db 070h,079h                            ; insn: raw (target B63AB unlabelled)
        jb short start_74.2
        db 067h,068h,074h,020h,062h,079h        ; insn: push 79622074h
        and byte [byte edi+041h], dl
        push esp
        inc ebx
        dec edi
        dec ebp
        and byte [byte ecx+06Eh], cl
        db 074h,065h                            ; insn: raw (target B63AB unlabelled)
        jb short start_74.4
        popa
        je short start_74.3
        outsd
        outsb
        popa
        insb
        and byte [byte ebx+06Fh], al
        jb short start_74.5
        and byte [cs:ecx], dh
        cmp dword [eax], edi
        cmp byte [034393931h], ch
        and byte [byte cs:ecx+06Ch], al
        insb
        and byte [byte edx+069h], dh
        db 067h,068h,074h,073h,020h,072h        ; insn: push 72207374h
        db 065h,073h, start_74.6-($+3)
        jb short start_74.7
        db 065h,064h,02Eh,08Dh,040h,00h         ; insn: lea eax,[eax]
        dd ___begtext
start_74:
        arpl word [byte edi+06Eh], bp
        db 00h
.1:
        sti
        and esp, byte 0FFFFFFFCh
        mov ebx, esp
        mov dword [_STACKTOP], ebx
        mov dword [_curbrk], ebx
        mov ax, 24h
        mov word [_psp], ax
        db 0BBh
.2:
        push edx
        inc ecx
        dec eax
        push eax
        sub eax, eax
        mov ah, 30h
        int 21h
        mov byte [_osmajor], al
        mov byte [_osminor], ah
        mov ecx, eax
.3:
        sub esi, esi
.4:
        mov edi, 81h
        shr eax, 10h
        cmp ax, 4458h
        jne short .8
.5:
        sub bl, 30h
        mov al, bl
        mov ah, 0
        push eax
        o16 mov es, word [_psp]
        db 026h
        db 08Bh
.6:
        sbb eax, 5Ch
        add ebx, 0FFFh
        and ebx, 0FFFFF000h
        db 089h
        db 01Dh
.7:
        dd _curbrk
        shr ebx, 0Ch
        mov ax, ds
        mov es, eax
        mov ah, 4Ah
        int 21h
        pop eax
        mov bx, ds
        mov cx, 2Ch
        jmp short .9
.8:
        cmp ax, 4243h
        jne short .10
        mov dword [FpuFlags], edx
        mov esi, edx
        mov edx, dword [byte esi+01Ch]
        mov ebx, esp
        sub ebx, edx
        mov ah, 4Ah
        int 21h
        mov bx, ds
        o16 mov word [_psp], ds
        mov eax, dword [byte esi+010h]
        add edi, eax
        sub esi, esi
        mov si, word [byte eax+02Ch]
        shl esi, 4
        mov cx, ds
        mov al, 9
        mov ah, 0
.9:
        jmp short .14
.10:
        mov dx, 78h
        mov ax, 0FF00h
        int 21h
        cmp al, 0
        je short .13
        mov ax, gs
        cmp ax, byte 0
        je short .11
        mov word [EmuHookFlags], ax
.11:
        mov ax, 6
        mov bx, ds
        int 31h
        mov al, 1
        mov ah, 0
        or dx, cx
        je short .12
        mov ah, 1
.12:
        o16 mov word [_psp], es
        db 066h,026h,08Bh,0Dh,02Ch,00h,00h,00h  ; insn: mov cx,[es:2Ch]
        jmp short .14
.13:
        mov dx, ds
        mov cx, 24h
        mov ds, ecx
        mov cx, 2Ch
        mov ds, edx
        mov bx, 17h
        mov al, 0
        mov ah, 0
.14:
        mov byte [_Extender], al
        mov byte [_ExtenderSubtype], ah
        mov es, ebx
        db 066h,026h,08Ch,01Dh                  ; insn: o16 mov [es:__saved_DS],ds
        dd __saved_DS
        mov dword [_Envptr], esi
        mov word [_Envptr_w4], cx
        push esi
        o16 mov es, word [_psp]
        db 03Eh,0BAh                            ; insn: mov edx,StartupStack
        dd StartupStack
        add edx, byte 0Fh
        and dl, 0F0h
        sub ecx, ecx
        mov cl, byte [byte es:edi-01h]
        cld
        mov al, 20h
        repe scasb
        lea esi, [byte edi-01h]
        mov edi, edx
        mov bx, es
        mov dx, ds
        mov ds, ebx
        mov es, edx
        je short .15
        inc ecx
        rep movsb
.15:
        sub al, al
        stosb
        stosb
        pop esi
        dec edi
        push edi
        push edx
        o16 mov ds, word [es:_Envptr_w4]
        sub ebp, ebp
.16:
        mov eax, dword [esi]
        or eax, 20202020h
        cmp eax, 37386F6Eh
        jne short .17
        cmp byte [byte esi+04h], 3Dh
        jne short .17
        inc ebp
.17:
        cmp byte [esi], 0
        lodsb
        jne short .17
        cmp byte [esi], 0
        jne short .16
        lodsb
        inc esi
        inc esi
.18:
        cmp byte [esi], 0
        movsb
        jne short .18
        pop ds
        pop esi
        mov ebx, esp
        mov word [__no87], bp
        mov dword [_STACKLOW], edi
        mov dword [_dynend], ebx
        db 03Eh,0B9h                            ; insn: mov ecx,StartupStack
        dd StartupStack
        db 03Eh,0BFh                            ; insn: mov edi,kaufmfont
        dd kaufmfont
        sub ecx, edi
        cmp byte [_Extender], 1
        jne short .19
        cmp ecx, 1000h
        jbe short .19
        mov ecx, 1000h
.19:
        mov dl, cl
        shr ecx, 2
        sub eax, eax
        rep stosd
        mov cl, dl
        and cl, 3
        rep stosb
        db 03Eh,0B8h                            ; insn: mov eax,StartupStack
        dd StartupStack
        add eax, byte 0Fh
        and al, 0F0h
        mov dword [_LpCmdLine], eax
        mov dword [StackLow], esi
        mov eax, 0FFh
        call __InitRtns
        sub ebp, ebp
        call __CMain
start_28F:
        jmp short WriteConsoleMessage_23
;-----------------------------------------------------------------------------
; WriteConsoleMessage                             B6599  96 PC, low confidence
; Writes a message to the console through DOS before exit
;-----------------------------------------------------------------------------
WriteConsoleMessage:
        push edx
        push eax
        db 0BAh                                 ; insn: mov edx,start_74
        dd start_74
        mov ax, 3D01h
        int 21h
        mov bx, ax
        pop edx
        mov esi, edx
        cld
.1:
        lodsb
        cmp al, 0
        jne short .1
        mov ecx, esi
        sub ecx, edx
        dec ecx
        mov ah, 40h
        int 21h
        pop eax
WriteConsoleMessage_23:
        push eax
        mov eax, 0
        mov edx, 0FFh
        call __FiniRtns
        pop eax
        mov ah, 4Ch
        int 21h
        lea eax, [byte eax+00h]
;-----------------------------------------------------------------------------
; RestoreDS                                       B65D4  96 PC, low confidence
; Loads the saved data segment (for interrupt handlers)
;-----------------------------------------------------------------------------
RestoreDS:                                      ; loads the saved data segment (for interrupt handlers); used
                                                ; by AudioStreamCallback, ClearClipRect, EmuTrapExit ...
        db 066h,02Eh,08Eh,01Dh                  ; insn: o16 mov ds,[cs:__saved_DS]
        dd __saved_DS
        ret
