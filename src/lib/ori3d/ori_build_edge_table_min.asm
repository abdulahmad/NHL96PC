; 3D library: BuildEdgeTableMin, BuildEdgeTableMax, BuildFixedTableMin, BuildFixedTableMax and 4 more.
bits 32
%include "hockey.inc"
section s_D1555 progbits alloc exec nowrite align=1
extern DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, DrawDestBuffer, DrawVideoBase, FatalError, RemapTable
extern str_BuildfixedtableminLinear, str_BuildtableminLinearmapfE, str_BuildtableminLinearmapfE2, str_BuildtableminLinearmapfExcee, TexSpanFill
global BuildEdgeTableMin, BuildEdgeTableMax, BuildFixedTableMin, BuildFixedTableMax, MapPolySpans, MapPolySpansRemap, FillFlatPolyCore
        db 0CDh,01h,0C3h,0CDh,02h,0C3h,0CCh,090h,0C3h,0CDh,04h,0C3h,0CDh,05h,0C3h,0CDh
        db 06h,0C3h,0CDh,07h,0C3h,0CDh,08h,0C3h,0CDh,09h,0C3h,0CDh,0Ah,0C3h,0CDh,0Bh
        db 0C3h,0CDh,0Ch,0C3h,0CDh,0Dh,0C3h,0CDh,0Eh,0C3h,0CDh,0Fh,0C3h,0CDh,010h,0C3h
        db 0CDh,011h,0C3h,0CDh,012h,0C3h,0CDh,013h,0C3h,0CDh,014h,0C3h,0CDh,015h,0C3h,0CDh
        db 016h,0C3h,0CDh,017h,0C3h,0CDh,018h,0C3h,0CDh,019h,0C3h,0CDh,01Ah,0C3h,0CDh,01Bh
        db 0C3h,0CDh,01Ch,0C3h,0CDh,01Dh,0C3h,0CDh,01Eh,0C3h,0CDh,01Fh,0C3h,0CDh,020h,0C3h
        db 0CDh,021h,0C3h,0CDh,022h,0C3h,0CDh,023h,0C3h,0CDh,024h,0C3h,0CDh,025h,0C3h,0CDh
        db 026h,0C3h,0CDh,027h,0C3h,0CDh,028h,0C3h,0CDh,029h,0C3h,0CDh,02Ah,0C3h,0CDh,02Bh
        db 0C3h,0CDh,02Ch,0C3h,0CDh,02Dh,0C3h,0CDh,02Eh,0C3h,0CDh,02Fh,0C3h,0CDh,030h,0C3h
        db 0CDh,031h,0C3h,0CDh,032h,0C3h,0CDh,033h,0C3h,0CDh,034h,0C3h,0CDh,035h,0C3h,0CDh
        db 036h,0C3h,0CDh,037h,0C3h,0CDh,038h,0C3h,0CDh,039h,0C3h,0CDh,03Ah,0C3h,0CDh,03Bh
        db 0C3h,0CDh,03Ch,0C3h,0CDh,03Dh,0C3h,0CDh,03Eh,0C3h,0CDh,03Fh,0C3h,0CDh,040h,0C3h
        db 0CDh,041h,0C3h,0CDh,042h,0C3h,0CDh,043h,0C3h,0CDh,044h,0C3h,0CDh,045h,0C3h,0CDh
        db 046h,0C3h,0CDh,047h,0C3h,0CDh,048h,0C3h,0CDh,049h,0C3h,0CDh,04Ah,0C3h,0CDh,04Bh
        db 0C3h,0CDh,04Ch,0C3h,0CDh,04Dh,0C3h,0CDh,04Eh,0C3h,0CDh,04Fh,0C3h,0CDh,050h,0C3h
        db 0CDh,051h,0C3h,0CDh,052h,0C3h,0CDh,053h,0C3h,0CDh,054h,0C3h,0CDh,055h,0C3h,0CDh
        db 056h,0C3h,0CDh,057h,0C3h,0CDh,058h,0C3h,0CDh,059h,0C3h,0CDh,05Ah,0C3h,0CDh,05Bh
        db 0C3h,0CDh,05Ch,0C3h,0CDh,05Dh,0C3h,0CDh,05Eh,0C3h,0CDh,05Fh,0C3h,0CDh,060h,0C3h
        db 0CDh,061h,0C3h,0CDh,062h,0C3h,0CDh,063h,0C3h,0CDh,064h,0C3h,0CDh,065h,0C3h,0CDh
        db 066h,0C3h,0CDh,067h,0C3h,0CDh,068h,0C3h,0CDh,069h,0C3h,0CDh,06Ah,0C3h,0CDh,06Bh
        db 0C3h,0CDh,06Ch,0C3h,0CDh,06Dh,0C3h,0CDh,06Eh,0C3h,0CDh,06Fh,0C3h,0CDh,070h,0C3h
        db 0CDh,071h,0C3h,0CDh,072h,0C3h,0CDh,073h,0C3h,0CDh,074h,0C3h,0CDh,075h,0C3h,0CDh
        db 076h,0C3h,0CDh,077h,0C3h,0CDh,078h,0C3h,0CDh,079h,0C3h,0CDh,07Ah,0C3h,0CDh,07Bh
        db 0C3h,0CDh,07Ch,0C3h,0CDh,07Dh,0C3h,0CDh,07Eh,0C3h,0CDh,07Fh,0C3h,0CDh,080h,0C3h
        db 0CDh,081h,0C3h,0CDh,082h,0C3h,0CDh,083h,0C3h,0CDh,084h,0C3h,0CDh,085h,0C3h,0CDh
        db 086h,0C3h,0CDh,087h,0C3h,0CDh,088h,0C3h,0CDh,089h,0C3h,0CDh,08Ah,0C3h,0CDh,08Bh
        db 0C3h,0CDh,08Ch,0C3h,0CDh,08Dh,0C3h,0CDh,08Eh,0C3h,0CDh,08Fh,0C3h,0CDh,090h,0C3h
        db 0CDh,091h,0C3h,0CDh,092h,0C3h,0CDh,093h,0C3h,0CDh,094h,0C3h,0CDh,095h,0C3h,0CDh
        db 096h,0C3h,0CDh,097h,0C3h,0CDh,098h,0C3h,0CDh,099h,0C3h,0CDh,09Ah,0C3h,0CDh,09Bh
        db 0C3h,0CDh,09Ch,0C3h,0CDh,09Dh,0C3h,0CDh,09Eh,0C3h,0CDh,09Fh,0C3h,0CDh,0A0h,0C3h
        db 0CDh,0A1h,0C3h,0CDh,0A2h,0C3h,0CDh,0A3h,0C3h,0CDh,0A4h,0C3h,0CDh,0A5h,0C3h,0CDh
        db 0A6h,0C3h,0CDh,0A7h,0C3h,0CDh,0A8h,0C3h,0CDh,0A9h,0C3h,0CDh,0AAh,0C3h,0CDh,0ABh
        db 0C3h,0CDh,0ACh,0C3h,0CDh,0ADh,0C3h,0CDh,0AEh,0C3h,0CDh,0AFh,0C3h,0CDh,0B0h,0C3h
        db 0CDh,0B1h,0C3h,0CDh,0B2h,0C3h,0CDh,0B3h,0C3h,0CDh,0B4h,0C3h,0CDh,0B5h,0C3h,0CDh
        db 0B6h,0C3h,0CDh,0B7h,0C3h,0CDh,0B8h,0C3h,0CDh,0B9h,0C3h,0CDh,0BAh,0C3h,0CDh,0BBh
        db 0C3h,0CDh,0BCh,0C3h,0CDh,0BDh,0C3h,0CDh,0BEh,0C3h,0CDh,0BFh,0C3h,0CDh,0C0h,0C3h
        db 0CDh,0C1h,0C3h,0CDh,0C2h,0C3h,0CDh,0C3h,0C3h,0CDh,0C4h,0C3h,0CDh,0C5h,0C3h,0CDh
        db 0C6h,0C3h,0CDh,0C7h,0C3h,0CDh,0C8h,0C3h,0CDh,0C9h,0C3h,0CDh,0CAh,0C3h,0CDh,0CBh
        db 0C3h,0CDh,0CCh,0C3h,0CDh,0CDh,0C3h,0CDh,0CEh,0C3h,0CDh,0CFh,0C3h,0CDh,0D0h,0C3h
        db 0CDh,0D1h,0C3h,0CDh,0D2h,0C3h,0CDh,0D3h,0C3h,0CDh,0D4h,0C3h,0CDh,0D5h,0C3h,0CDh
        db 0D6h,0C3h,0CDh,0D7h,0C3h,0CDh,0D8h,0C3h,0CDh,0D9h,0C3h,0CDh,0DAh,0C3h,0CDh,0DBh
        db 0C3h,0CDh,0DCh,0C3h,0CDh,0DDh,0C3h,0CDh,0DEh,0C3h,0CDh,0DFh,0C3h,0CDh,0E0h,0C3h
        db 0CDh,0E1h,0C3h,0CDh,0E2h,0C3h,0CDh,0E3h,0C3h,0CDh,0E4h,0C3h,0CDh,0E5h,0C3h,0CDh
        db 0E6h,0C3h,0CDh,0E7h,0C3h,0CDh,0E8h,0C3h,0CDh,0E9h,0C3h,0CDh,0EAh,0C3h,0CDh,0EBh
        db 0C3h,0CDh,0ECh,0C3h,0CDh,0EDh,0C3h,0CDh,0EEh,0C3h,0CDh,0EFh,0C3h,0CDh,0F0h,0C3h
        db 0CDh,0F1h,0C3h,0CDh,0F2h,0C3h,0CDh,0F3h,0C3h,0CDh,0F4h,0C3h,0CDh,0F5h,0C3h,0CDh
        db 0F6h,0C3h,0CDh,0F7h,0C3h,0CDh,0F8h,0C3h,0CDh,0F9h,0C3h,0CDh,0FAh,0C3h,0CDh,0FBh
        db 0C3h,0CDh,0FCh,0C3h,0CDh,0FDh,0C3h,0CDh,0FEh,0C3h,0CDh,0FFh,0C3h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; BuildEdgeTableMin                               D1860  96 PC, low confidence
; Builds the left edge table of a mapped polygon (buildtablemin, at most 768
; rows)
;-----------------------------------------------------------------------------
BuildEdgeTableMin:
        push esi
        push edi
        push ebp
        sub esp, byte 4
        mov ebp, dword [byte esp+014h]
        mov ebx, dword [byte esp+018h]
        mov esi, dword [byte esp+01Ch]
        mov edi, dword [byte esp+020h]
        cmp ebx, dword [DrawClipBottom]
        jl short .1
        xor eax, eax
        jmp near .9
.1:
        mov ecx, dword [DrawClipTop]
        lea eax, [ebx+esi]
        cmp eax, ecx
        jge short .2
        xor eax, eax
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        ret
.2:
        mov edx, dword [byte esp+024h]
        sub edx, edi
        shl edx, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv esi
        shl edi, 10h
        mov dword [esp], eax
        test eax, eax
        jge short .3
        add edi, eax
.3:
        mov ecx, dword [DrawClipTop]
        cmp ebx, ecx
        jge short .4
        mov eax, ecx
        mov edx, dword [esp]
        sub eax, ebx
        imul edx, eax
        mov ebx, ecx
        sub esi, eax
        add edi, edx
.4:
        mov edx, dword [DrawClipBottom]
        lea eax, [ebx+esi]
        cmp eax, edx
        jl short .5
        mov esi, edx
        sub esi, ebx
.5:
        shl ebx, 2
        add ebp, ebx
        cmp esi, 300h
        jle short .6
        push esi
        push str_BuildtableminLinearmapfExcee
        call FatalError
        add esp, byte 8
.6:
        test esi, esi
        je short .8
        mov ebx, dword [esp]
.7:
        mov eax, edi
        add ebp, byte 4
        sar eax, 10h
        add edi, ebx
        mov dword [byte ebp-04h], eax
        dec esi
        jne short .7
.8:
        mov eax, dword [esp]
.9:
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; BuildEdgeTableMax                               D1920  96 PC, low confidence
; Builds the right edge table of a mapped polygon
;-----------------------------------------------------------------------------
BuildEdgeTableMax:
        push esi
        push edi
        push ebp
        mov ecx, dword [byte esp+010h]
        mov edi, dword [byte esp+014h]
        mov ebx, dword [byte esp+018h]
        cmp edi, dword [DrawClipBottom]
        jl short .1
        xor eax, eax
        pop ebp
        pop edi
        pop esi
        ret
.1:
        mov esi, dword [DrawClipTop]
        lea eax, [edi+ebx]
        cmp eax, esi
        jge short .2
        xor eax, eax
        pop ebp
        pop edi
        pop esi
        ret
.2:
        mov edx, dword [byte esp+020h]
        mov ebp, dword [byte esp+01Ch]
        sub edx, ebp
        shl edx, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov esi, eax
        mov eax, ebp
        shl eax, 10h
        test esi, esi
        jle short .3
        add eax, esi
.3:
        mov edx, dword [DrawClipTop]
        cmp edi, edx
        jge short .4
        sub edx, edi
        mov edi, esi
        imul edi, edx
        sub ebx, edx
        add eax, edi
        mov edi, dword [DrawClipTop]
.4:
        mov ebp, dword [DrawClipBottom]
        lea edx, [edi+ebx]
        cmp edx, ebp
        jl short .5
        mov ebx, ebp
        sub ebx, edi
.5:
        shl edi, 2
        add ecx, edi
        test ebx, ebx
        je short .7
.6:
        mov edx, eax
        add ecx, byte 4
        sar edx, 10h
        add eax, esi
        mov dword [byte ecx-04h], edx
        dec ebx
        jne short .6
.7:
        mov eax, esi
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; BuildFixedTableMin                              D19BC  96 PC, low confidence
; Builds the left edge table of a mapped polygon with fixed point steps
;-----------------------------------------------------------------------------
BuildFixedTableMin:
        push esi
        push edi
        push ebp
        sub esp, byte 4
        mov ebp, dword [byte esp+014h]
        mov ebx, dword [byte esp+018h]
        mov esi, dword [byte esp+01Ch]
        mov ecx, dword [byte esp+020h]
        cmp ebx, dword [DrawClipBottom]
        jge near .7
        mov edi, dword [DrawClipTop]
        lea edx, [ebx+esi]
        cmp edx, edi
        jl near .7
        mov edx, dword [byte esp+024h]
        sub edx, ecx
        mov eax, edx
        sar edx, 1Fh
        idiv esi
        mov dword [esp], eax
        mov eax, dword [byte esp+028h]
        mov edi, ecx
        test eax, eax
        jge short .1
        mov edi, dword [esp]
        add edi, ecx
.1:
        mov edx, dword [DrawClipTop]
        cmp ebx, edx
        jge short .2
        sub edx, ebx
        mov ebx, dword [esp]
        imul ebx, edx
        sub esi, edx
        add edi, ebx
        mov ebx, dword [DrawClipTop]
.2:
        mov ecx, dword [DrawClipBottom]
        lea edx, [ebx+esi]
        cmp edx, ecx
        jl short .3
        mov esi, ecx
        sub esi, ebx
.3:
        shl ebx, 2
        add ebp, ebx
        cmp esi, 300h
        jle short .4
        push esi
        push str_BuildfixedtableminLinear
        call FatalError
        add esp, byte 8
.4:
        cmp esi, 300h
        jle short .5
        push esi
        push str_BuildtableminLinearmapfE
        call FatalError
        add esp, byte 8
.5:
        test esi, esi
        je short .7
        mov eax, dword [esp]
.6:
        mov dword [byte ebp+00h], edi
        add ebp, byte 4
        add edi, eax
        dec esi
        jne short .6
.7:
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; BuildFixedTableMax                              D1A88  96 PC, low confidence
; Builds the right edge table of a mapped polygon with fixed point steps
;-----------------------------------------------------------------------------
BuildFixedTableMax:
        push esi
        push edi
        push ebp
        sub esp, byte 4
        mov ebp, dword [byte esp+014h]
        mov ebx, dword [byte esp+018h]
        mov esi, dword [byte esp+01Ch]
        mov ecx, dword [byte esp+020h]
        cmp ebx, dword [DrawClipBottom]
        jge near .6
        mov edi, dword [DrawClipTop]
        lea edx, [ebx+esi]
        cmp edx, edi
        jl near .6
        mov edx, dword [byte esp+024h]
        sub edx, ecx
        mov eax, edx
        sar edx, 1Fh
        idiv esi
        mov dword [esp], eax
        mov eax, dword [byte esp+028h]
        mov edi, ecx
        test eax, eax
        jle short .1
        mov edi, dword [esp]
        add edi, ecx
.1:
        mov edx, dword [DrawClipTop]
        cmp ebx, edx
        jge short .2
        sub edx, ebx
        mov ebx, dword [esp]
        imul ebx, edx
        sub esi, edx
        add edi, ebx
        mov ebx, dword [DrawClipTop]
.2:
        mov ecx, dword [DrawClipBottom]
        lea edx, [ebx+esi]
        cmp edx, ecx
        jl short .3
        mov esi, ecx
        sub esi, ebx
.3:
        shl ebx, 2
        add ebp, ebx
        cmp esi, 300h
        jle short .4
        push esi
        push str_BuildtableminLinearmapfE2
        call FatalError
        add esp, byte 8
.4:
        test esi, esi
        je short .6
        mov eax, dword [esp]
.5:
        mov dword [byte ebp+00h], edi
        add ebp, byte 4
        add edi, eax
        dec esi
        jne short .5
.6:
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        ret
        db 00h
;-----------------------------------------------------------------------------
; MapPolySpans                                    D1B3C  96 PC, low confidence
; Draws the texture mapped spans of a clipped polygon
;-----------------------------------------------------------------------------
MapPolySpans:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+010h]
        mov edi, dword [byte esp+014h]
        mov ebx, dword [byte esp+018h]
        shl ebx, 10h
        mov ebp, dword [byte esp+01Ch]
        shl ebp, 10h
        mov bx, word [byte esp+020h]
        mov dx, word [byte esp+024h]
        LD xor, eax, eax
        sub dword [byte esp+030h], byte 4
        js short .6
.1:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        cmp al, 0FFh
        je short .2
        mov byte [edi], al
.2:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        cmp al, 0FFh
        je short .3
        mov byte [byte edi+01h], al
.3:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        cmp al, 0FFh
        je short .4
        mov byte [byte edi+02h], al
.4:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        cmp al, 0FFh
        je short .5
        mov byte [byte edi+03h], al
.5:
        sub dword [byte esp+030h], byte 4
        lea edi, [byte edi+04h]
        jns short .1
.6:
        add dword [byte esp+030h], byte 3
        js short .9
.7:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        cmp al, 0FFh
        je short .8
        mov byte [edi], al
.8:
        sub dword [byte esp+030h], byte 1
        lea edi, [byte edi+01h]
        jns short .7
.9:
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; MapPolySpansRemap                               D1BEC  96 PC, low confidence
; Draws the texture mapped spans of a clipped polygon through the remap table
;-----------------------------------------------------------------------------
MapPolySpansRemap:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+010h]
        mov edi, dword [byte esp+014h]
        mov ebx, dword [byte esp+018h]
        shl ebx, 10h
        mov ebp, dword [byte esp+01Ch]
        shl ebp, 10h
        mov bx, word [byte esp+020h]
        mov dx, word [byte esp+024h]
        LD xor, eax, eax
        sub dword [byte esp+030h], byte 4
        js near .10
.1:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        cmp al, 0FEh
        jb short .2
        jne short .3
        mov al, byte [edi]
        mov al, byte [dword eax+RemapTable]
.2:
        mov byte [edi], al
.3:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        cmp al, 0FEh
        jb short .4
        jne short .5
        mov al, byte [byte edi+01h]
        mov al, byte [dword eax+RemapTable]
.4:
        mov byte [byte edi+01h], al
.5:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        cmp al, 0FEh
        jb short .6
        jne short .7
        mov al, byte [byte edi+02h]
        mov al, byte [dword eax+RemapTable]
.6:
        mov byte [byte edi+02h], al
.7:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        cmp al, 0FEh
        jb short .8
        jne short .9
        mov al, byte [byte edi+03h]
        mov al, byte [dword eax+RemapTable]
.8:
        mov byte [byte edi+03h], al
.9:
        sub dword [byte esp+030h], byte 4
        lea edi, [byte edi+04h]
        jns near .1
.10:
        add dword [byte esp+030h], byte 3
        js short .14
.11:
        LD add, bx, dx
        mov al, byte [esi]
        LD sbb, ecx, ecx
        LD add, ebx, ebp
        adc esi, dword [byte esp+ecx*4+02Ch]
        cmp al, 0FEh
        jb short .12
        jne short .13
        mov al, byte [edi]
        mov al, byte [dword eax+RemapTable]
.12:
        mov byte [edi], al
.13:
        sub dword [byte esp+030h], byte 1
        lea edi, [byte edi+01h]
        jns short .11
.14:
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; FillFlatPolyCore                                D1CE0  96 PC, low confidence
; Builds the edge tables of a polygon and fills its spans
;-----------------------------------------------------------------------------
FillFlatPolyCore:
        push esi
        push edi
        push ebp
        sub esp, 4868h
        mov eax, dword [dword esp+04878h]
        mov eax, dword [byte eax+02h]
        sar eax, 10h
        mov dword [dword esp+04854h], eax
        mov eax, dword [dword esp+04880h]
        mov ecx, 2
        mov eax, dword [byte eax+04h]
        xor edx, edx
        mov dword [dword esp+04814h], eax
        mov eax, dword [dword esp+04880h]
        mov dword [dword esp+04828h], edx
        mov dword [dword esp+04834h], edx
        mov eax, dword [byte eax+014h]
        mov dword [dword esp+04840h], ecx
        mov dword [dword esp+04810h], eax
        mov eax, dword [dword esp+04880h]
.1:
        mov esi, dword [dword esp+04814h]
        mov ebx, dword [byte eax+04h]
        cmp ebx, esi
        jge short .2
        mov dword [dword esp+04814h], ebx
        mov dword [dword esp+04834h], edx
        jmp short .3
.2:
        cmp ebx, dword [dword esp+04810h]
        jle short .3
        mov dword [dword esp+04810h], ebx
        mov dword [dword esp+04840h], edx
.3:
        inc edx
        add eax, byte 8
        cmp edx, byte 4
        jl short .1
        mov eax, dword [dword esp+04814h]
        cmp eax, dword [DrawClipBottom]
        jge near .25
        mov eax, dword [dword esp+04810h]
        cmp eax, dword [DrawClipTop]
        jl near .25
        mov edx, dword [dword esp+04834h]
        inc edx
        and edx, byte 3
        mov ebx, dword [dword esp+04880h]
        shl edx, 3
        add edx, ebx
        mov ebx, dword [dword esp+04834h]
        mov ecx, dword [dword esp+04880h]
        shl ebx, 3
        add ebx, ecx
        mov eax, dword [byte edx+04h]
        mov edx, dword [edx]
        mov esi, dword [byte ebx+04h]
        mov ebp, dword [ebx]
        sub eax, esi
        sub edx, ebp
        lea ecx, [byte eax+01h]
        shl edx, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv ecx
        mov edi, dword [dword esp+04834h]
        dec edi
        and edi, byte 3
        mov esi, eax
        lea edx, [nosplit edi*8+00h]
        add edx, dword [dword esp+04880h]
        mov ecx, dword [byte ebx+04h]
        mov eax, dword [byte edx+04h]
        mov edx, dword [edx]
        sub eax, ecx
        sub edx, ebp
        lea ecx, [byte eax+01h]
        shl edx, 10h
        mov eax, edx
        sar edx, 1Fh
        idiv ecx
        cmp esi, eax
        jl short .4
        mov dword [dword esp+0483Ch], 1
        jmp short .5
.4:
        mov dword [dword esp+0483Ch], 0FFFFFFFFh
.5:
        mov esi, dword [dword esp+04834h]
        cmp esi, dword [dword esp+04840h]
        je near .8
.6:
        mov edi, dword [dword esp+0483Ch]
        mov eax, esi
        sub eax, edi
        and eax, byte 3
        mov ebx, dword [dword esp+04880h]
        mov dword [dword esp+04830h], eax
        shl eax, 3
        shl esi, 3
        mov dword [dword esp+04818h], eax
        add ebx, eax
        mov eax, dword [dword esp+04880h]
        add eax, esi
        mov edx, dword [byte ebx+04h]
        mov ecx, dword [byte eax+04h]
        sub edx, ecx
        mov dword [dword esp+0481Ch], esi
        lea esi, [byte edx+01h]
        test esi, esi
        jle near .7
        mov ebp, dword [ebx]
        push ebp
        mov edx, dword [eax]
        push edx
        push esi
        push ecx
        lea eax, [byte esp+010h]
        push eax
        mov edi, ecx
        call BuildEdgeTableMin
        add esp, byte 14h
        mov ebp, eax
        mov ebx, dword [dword esp+04818h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, ebx
        mov edx, dword [dword esp+04820h]
        mov dword [dword esp+0480Ch], eax
        mov ecx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, edx
        push ecx
        mov ebx, dword [eax]
        push ebx
        push esi
        push edi
        mov dword [dword esp+04818h], eax
        lea eax, [dword esp+0C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
        mov eax, dword [dword esp+04808h]
        push ebp
        mov ecx, dword [byte eax+04h]
        mov eax, dword [dword esp+04808h]
        push ecx
        mov ebp, dword [byte eax+04h]
        push ebp
        push esi
        push edi
        lea eax, [dword esp+03C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
.7:
        mov esi, dword [dword esp+04830h]
        cmp esi, dword [dword esp+04840h]
        jne near .6
.8:
        mov esi, dword [dword esp+04834h]
        cmp esi, dword [dword esp+04840h]
        je near .11
.9:
        mov eax, dword [dword esp+0483Ch]
        mov ebx, dword [dword esp+04880h]
        add eax, esi
        mov edx, dword [dword esp+04880h]
        and eax, byte 3
        shl esi, 3
        mov dword [dword esp+0482Ch], eax
        shl eax, 3
        add edx, esi
        add ebx, eax
        mov ecx, dword [byte edx+04h]
        mov dword [dword esp+04820h], eax
        mov eax, dword [byte ebx+04h]
        sub eax, ecx
        mov dword [dword esp+04824h], esi
        lea esi, [byte eax+01h]
        test esi, esi
        jle near .10
        mov ebp, dword [ebx]
        push ebp
        mov eax, dword [edx]
        push eax
        push esi
        push ecx
        lea eax, [dword esp+01810h]
        push eax
        mov edi, ecx
        call BuildEdgeTableMax
        add esp, byte 14h
        mov ebp, eax
        mov edx, dword [dword esp+04820h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, edx
        mov ecx, dword [dword esp+04828h]
        mov dword [dword esp+0480Ch], eax
        mov ebx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, ecx
        push ebx
        mov edx, dword [eax]
        push edx
        push esi
        push edi
        mov dword [dword esp+04818h], eax
        lea eax, [dword esp+03014h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
        mov eax, dword [dword esp+04808h]
        push ebp
        mov ebx, dword [byte eax+04h]
        mov eax, dword [dword esp+04808h]
        push ebx
        mov ecx, dword [byte eax+04h]
        push ecx
        push esi
        push edi
        lea eax, [dword esp+02414h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
.10:
        mov esi, dword [dword esp+0482Ch]
        cmp esi, dword [dword esp+04840h]
        jne near .9
.11:
        mov eax, dword [dword esp+04814h]
        mov ebx, dword [DrawClipTop]
        cmp eax, ebx
        jge short .12
        mov dword [dword esp+04814h], ebx
.12:
        mov eax, dword [dword esp+04810h]
        mov ecx, dword [DrawClipBottom]
        cmp eax, ecx
        jl short .13
        lea eax, [byte ecx-01h]
        mov dword [dword esp+04810h], eax
.13:
        mov eax, dword [dword esp+04810h]
        mov esi, dword [dword esp+04814h]
        sub eax, esi
        inc eax
        mov dword [dword esp+04858h], eax
        mov eax, dword [dword esp+04878h]
        add eax, byte 10h
        shl esi, 2
        mov dword [dword esp+04838h], eax
.14:
        mov edi, dword [dword esp+04858h]
        dec edi
        mov dword [dword esp+04858h], edi
        cmp edi, byte 0FFFFFFFFh
        je near .25
        mov eax, dword [dword esp+esi+01800h]
        mov edx, dword [esp+esi]
        sub eax, edx
        lea ebx, [byte eax+01h]
        test ebx, ebx
        jle near .18
        mov eax, edx
        cmp eax, dword [DrawClipRight]
        jge near .17
        mov ecx, dword [DrawClipLeft]
        cmp ecx, dword [dword esp+esi+01800h]
        jg near .17
        mov edx, dword [dword esp+esi+03000h]
        mov edi, dword [dword esp+esi+0C00h]
        sub edx, edi
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov ebp, dword [dword esp+esi+03C00h]
        mov edx, dword [dword esp+esi+02400h]
        sub edx, ebp
        mov ecx, eax
        mov eax, edx
        sar edx, 1Fh
        idiv ebx
        mov dword [dword esp+04864h], ebp
        mov ebp, dword [DrawClipLeft]
        mov edi, eax
        mov edx, dword [esp+esi]
        mov eax, dword [dword esp+esi+0C00h]
        cmp edx, ebp
        jge short .15
        mov edx, ebp
        sub edx, dword [esp+esi]
        mov ebp, ecx
        imul ebp, edx
        add eax, ebp
        mov ebp, edi
        imul ebp, edx
        sub ebx, edx
        mov edx, dword [DrawClipLeft]
        add dword [dword esp+04864h], ebp
        mov dword [esp+esi], edx
.15:
        mov ebp, dword [DrawClipRight]
        mov edx, dword [dword esp+esi+01800h]
        cmp edx, ebp
        jl short .16
        sub edx, ebp
        inc edx
        sub ebx, edx
.16:
        mov ebp, dword [DrawVideoBase]
        mov edx, dword [DrawDestBuffer]
        add ebp, dword [edx+esi]
        mov edx, ebp
        mov ebp, dword [esp+esi]
        add edx, ebp
        mov dword [dword esp+04800h], edx
        mov edx, edi
        mov ebp, dword [dword esp+04854h]
        sar edx, 10h
        imul ebp, edx
        mov edx, ecx
        sar edx, 10h
        push ebx
        add edx, ebp
        mov ebx, dword [dword esp+04858h]
        push edx
        add edx, ebx
        push edx
        push edi
        mov edi, dword [dword esp+04874h]
        mov edx, edi
        sar edx, 10h
        imul edx, ebx
        push edi
        push ecx
        mov ebp, dword [dword esp+04818h]
        mov ecx, dword [dword esp+04850h]
        push eax
        sar eax, 10h
        add edx, ecx
        push ebp
        add eax, edx
        push eax
        call TexSpanFill
        add esp, byte 24h
.17:
        add esi, byte 4
        jmp near .14
.18:
        mov ebx, dword [dword esp+04828h]
        test ebx, ebx
        jne near .25
        mov ecx, dword [dword esp+0483Ch]
        mov eax, dword [dword esp+04834h]
        mov ebp, dword [dword esp+04840h]
        lea edi, [byte ebx+01h]
        neg ecx
        mov dword [dword esp+04828h], edi
        mov dword [dword esp+0483Ch], ecx
        cmp eax, ebp
        je near .21
.19:
        mov ebx, dword [dword esp+0483Ch]
        mov edx, eax
        sub edx, ebx
        and edx, byte 3
        shl eax, 3
        mov dword [dword esp+04860h], edx
        shl edx, 3
        mov ebx, dword [dword esp+04880h]
        mov dword [dword esp+04848h], edx
        add ebx, edx
        mov edx, dword [dword esp+04880h]
        add edx, eax
        mov dword [dword esp+0484Ch], eax
        mov eax, dword [byte ebx+04h]
        mov ebp, dword [byte edx+04h]
        sub eax, ebp
        lea edi, [byte eax+01h]
        test edi, edi
        jle near .20
        mov eax, dword [ebx]
        push eax
        mov ebx, dword [edx]
        push ebx
        push edi
        push ebp
        lea eax, [byte esp+010h]
        push eax
        call BuildEdgeTableMin
        mov dword [dword esp+04820h], eax
        add esp, byte 14h
        mov edx, dword [dword esp+04848h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, edx
        mov ecx, dword [dword esp+04850h]
        mov dword [dword esp+0480Ch], eax
        mov ebx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, ecx
        push ebx
        mov edx, dword [eax]
        push edx
        push edi
        push ebp
        mov dword [dword esp+04818h], eax
        lea eax, [dword esp+0C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
        mov ebx, dword [dword esp+0480Ch]
        mov eax, dword [dword esp+04808h]
        push ebx
        mov ecx, dword [byte eax+04h]
        mov eax, dword [dword esp+04808h]
        push ecx
        mov edx, dword [byte eax+04h]
        push edx
        push edi
        push ebp
        lea eax, [dword esp+03C14h]
        push eax
        call BuildFixedTableMin
        add esp, byte 18h
.20:
        mov eax, dword [dword esp+04860h]
        cmp eax, dword [dword esp+04840h]
        jne near .19
.21:
        mov eax, dword [dword esp+04834h]
        cmp eax, dword [dword esp+04840h]
        je near .24
.22:
        mov edx, dword [dword esp+0483Ch]
        add edx, eax
        and edx, byte 3
        mov ebx, dword [dword esp+04880h]
        mov dword [dword esp+0485Ch], edx
        shl edx, 3
        shl eax, 3
        mov dword [dword esp+04850h], edx
        add ebx, edx
        mov edx, dword [dword esp+04880h]
        add edx, eax
        mov dword [dword esp+04844h], eax
        mov eax, dword [byte ebx+04h]
        mov ecx, dword [byte edx+04h]
        sub eax, ecx
        lea edi, [byte eax+01h]
        test edi, edi
        jle near .23
        mov eax, dword [ebx]
        push eax
        mov ebx, dword [edx]
        push ebx
        push edi
        push ecx
        lea eax, [dword esp+01810h]
        push eax
        mov ebp, ecx
        call BuildEdgeTableMax
        mov dword [dword esp+04818h], eax
        add esp, byte 14h
        mov edx, dword [dword esp+04850h]
        push eax
        mov eax, dword [dword esp+04880h]
        add eax, edx
        mov ecx, dword [dword esp+04848h]
        mov dword [dword esp+0480Ch], eax
        mov ebx, dword [eax]
        mov eax, dword [dword esp+04880h]
        add eax, ecx
        push ebx
        mov edx, dword [eax]
        push edx
        push edi
        push ebp
        mov dword [dword esp+04820h], eax
        lea eax, [dword esp+03014h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
        mov ebx, dword [dword esp+04804h]
        mov eax, dword [dword esp+04808h]
        push ebx
        mov ecx, dword [byte eax+04h]
        mov eax, dword [dword esp+04810h]
        push ecx
        mov edx, dword [byte eax+04h]
        push edx
        push edi
        push ebp
        lea eax, [dword esp+02414h]
        push eax
        call BuildFixedTableMax
        add esp, byte 18h
.23:
        mov eax, dword [dword esp+0485Ch]
        cmp eax, dword [dword esp+04840h]
        jne near .22
.24:
        inc dword [dword esp+04858h]
        jmp near .14
.25:
        add esp, 4868h
        pop ebp
        pop edi
        pop esi
        ret
