; Watcom C runtime: modf_, __CmpBigInt, __Rnd2Int, __Bin2String, BigIntCallHook and 2 more.
bits 32
%include "hockey.inc"
section s_DD32B progbits alloc exec nowrite align=1
extern __CHP
global modf_, __CmpBigInt, __Rnd2Int, __Bin2String, BigIntCallHook, BigIntNullHook, frexp_
        db 00h
;-----------------------------------------------------------------------------
; modf_                                                         DD32C  library
; Run-time library modf: splits a double into integer and fraction
;-----------------------------------------------------------------------------
modf_:
        push eax
        fld qword [byte esp+08h]
        fld st0
        call __CHP
        fsub to st1
        mov eax, dword [byte esp+010h]
        fstp qword [eax]
        pop eax
        wait
        ret 0Ch
        db 00h
;-----------------------------------------------------------------------------
; __CmpBigInt                                                   DD346  library
; Run-time library: compares two big integers (float conversion)
;-----------------------------------------------------------------------------
__CmpBigInt:
        push edi
        push ecx
        call BigIntCallHook
        inc eax
        lea edi, [edi+eax*8]
        mov ecx, dword [edx]
        mov edx, dword [byte edx+04h]
        sub eax, eax
.1:
        cmp edx, dword [cs:edi]
        jne short .2
        cmp ecx, dword [byte cs:edi+04h]
.2:
        jb short .3
        add edi, byte 8
        inc eax
        jmp short .1
.3:
        sub edi, byte 8
.4:
        cmp edx, dword [cs:edi]
        jne short .5
        cmp ecx, dword [byte cs:edi+04h]
.5:
        jae short .6
        sub edi, byte 8
        dec eax
        jmp short .4
.6:
        pop ecx
        pop edi
        ret
;-----------------------------------------------------------------------------
; __Rnd2Int                                                     DD380  library
; Run-time library: rounds a double to an integer
;-----------------------------------------------------------------------------
__Rnd2Int:
        push ebx
        push ecx
        push edx
        push ebp
        push esi
        push edx
        mov ebp, eax
        mov ecx, dword [byte ebp+00h]
        mov ebx, dword [byte ebp+04h]
        mov ebp, ebx
        and ebp, 0FFF00000h
        xor ebx, ebp
        xor ebx, 100000h
        shr ebp, 14h
        sub ebp, 433h
        je short .5
        jbe short .2
.1:
        shl ecx, 1
        rcl ebx, 1
        dec ebp
        jne short .1
        jmp short .5
.2:
        sub eax, eax
        sub esi, esi
.3:
        shr ebx, 1
        rcr ecx, 1
        rcr eax, 1
        adc esi, esi
        inc ebp
        jne short .3
        cmp eax, 80000000h
        jb short .5
        jne short .4
        or esi, esi
        jne short .4
        test ecx, 1
        je short .5
.4:
        add ecx, byte 1
        adc ebx, byte 0
.5:
        pop ebp
        mov dword [byte ebp+00h], ecx
        mov dword [byte ebp+04h], ebx
        pop esi
        pop ebp
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; __Bin2String                                                  DD3EB  library
; Run-time library: a binary value to decimal digits
;-----------------------------------------------------------------------------
__Bin2String:
        push ebp
        push edi
        push ecx
        push ebx
        mov ebp, eax
        mov ecx, dword [byte ebp+00h]
        mov eax, dword [byte ebp+04h]
        mov ebp, edx
        add ebp, ebx
        mov byte [byte ebp+00h], 0
        push eax
.1:
        pop eax
        mov edi, 2710h
        sub edx, edx
        or eax, eax
        jne short .2
        or ecx, ecx
        jne short .3
        push eax
        jmp short .4
.2:
        div edi
.3:
        xchg ecx, eax
        div edi
        xchg ecx, eax
        push eax
        mov eax, edx
        mov dl, 64h
        div dl
        mov dl, ah
        mov ah, 0
        aam
        xchg edx, eax
        mov ah, 0
        aam
.4:
        add ax, 3030h
        add dx, 3030h
        sub ebp, byte 4
        mov byte [byte ebp+03h], al
        dec ebx
        je short .5
        mov byte [byte ebp+02h], ah
        dec ebx
        je short .5
        mov byte [byte ebp+01h], dl
        dec ebx
        je short .5
        mov byte [byte ebp+00h], dh
        dec ebx
        jne short .1
.5:
        pop eax
        pop ebx
        pop ecx
        pop edi
        pop ebp
        ret
;-----------------------------------------------------------------------------
; BigIntCallHook                                  DD455  96 PC, low confidence
; Calls the empty big-integer compare hook
;-----------------------------------------------------------------------------
BigIntCallHook:
        call BigIntNullHook
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,01h,00h,00h,00h
        db 00h,00h,00h,00h,0Ah,00h,00h,00h,00h,00h,00h,00h,064h,00h,00h,00h
        db 00h,00h,00h,00h,0E8h,03h,00h,00h,00h,00h,00h,00h,010h,027h,00h,00h
        db 00h,00h,00h,00h,0A0h,086h,01h,00h,00h,00h,00h,00h,040h,042h,0Fh,00h
        db 00h,00h,00h,00h,080h,096h,098h,00h,00h,00h,00h,00h,00h,0E1h,0F5h,05h
        db 00h,00h,00h,00h,00h,0CAh,09Ah,03Bh,02h,00h,00h,00h,00h,0E4h,0Bh,054h
        db 017h,00h,00h,00h,00h,0E8h,076h,048h,0E8h,00h,00h,00h,00h,010h,0A5h,0D4h
        db 018h,09h,00h,00h,00h,0A0h,072h,04Eh,0F3h,05Ah,00h,00h,00h,040h,07Ah,010h
        db 07Eh,08Dh,03h,00h,00h,080h,0C6h,0A4h,0F2h,086h,023h,00h,00h,00h,0C1h,06Fh
        db 078h,045h,063h,01h,00h,00h,08Ah,05Dh,0B3h,0B6h,0E0h,0Dh,00h,00h,064h,0A7h
        db 04h,023h,0C7h,08Ah,00h,00h,0E8h,089h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
;-----------------------------------------------------------------------------
; BigIntNullHook                                  DD50A  96 PC, low confidence
; Empty big-integer compare hook
;-----------------------------------------------------------------------------
BigIntNullHook:
        pop edi
        ret
;-----------------------------------------------------------------------------
; frexp_                                                        DD50C  library
; Run-time library frexp: splits a double into mantissa and exponent
;-----------------------------------------------------------------------------
frexp_:
        push eax
        push ebx
        push ecx
        push edx
        sub esp, byte 8
        mov eax, dword [byte esp+01Ch]
        mov ecx, dword [byte esp+01Ch]
        mov dword [esp], eax
        mov eax, dword [byte esp+020h]
        xor edx, edx
        mov dword [byte esp+04h], eax
        test eax, 7FFFFFFFh
        jne short .1
        test ecx, ecx
        je short .2
.1:
        mov edx, dword [byte esp+06h]
        and edx, 7FF0h
        mov ebx, dword [byte esp+06h]
        and edx, 0FFFFh
        and ebx, 800Fh
        sar edx, 4
        mov ecx, ebx
        mov word [byte esp+06h], bx
        or ecx, 3FE0h
        sub edx, 3FEh
        mov word [byte esp+06h], cx
.2:
        mov eax, dword [byte esp+024h]
        fld qword [esp]
        mov dword [eax], edx
        add esp, byte 8
        pop edx
        pop ecx
        pop ebx
        pop eax
        ret 0Ch
