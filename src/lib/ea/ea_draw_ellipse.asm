; EA library: DrawEllipse, DrawEllipseClipped.
bits 32
%include "hockey.inc"
section s_C4F9B progbits alloc exec nowrite align=1
extern DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, min_, NearestColour, PixelToRgb, PlotPixel
extern PlotPixelClipped
global DrawEllipse, DrawEllipseClipped
        db 00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DrawEllipse                                     C4FA0  96 PC, low confidence
; Draws an ellipse
;-----------------------------------------------------------------------------
DrawEllipse:
        push esi
        push edi
        push ebp
        sub esp, byte 8
        mov eax, dword [byte esp+020h]
        mov edx, eax
        shr edx, 18h
        and edx, 0FFh
        je near .3
        cmp edx, 0FFh
        jne short .1
        push eax
        call NearestColour
        add esp, byte 4
        push eax
        mov edi, dword [byte esp+020h]
        push edi
        mov ebp, dword [byte esp+020h]
        push ebp
        jmp near .2
.1:
        mov ebx, eax
        mov ebp, eax
        shl edx, 10h
        shr ebx, 10h
        and eax, 0FFh
        and ebx, 0FFh
        mov dword [esp], eax
        mov dword [byte esp+04h], ebx
        mov eax, edx
        mov ebx, 0FFh
        sar edx, 1Fh
        idiv ebx
        mov edx, dword [byte esp+01Ch]
        push edx
        mov ebx, dword [byte esp+01Ch]
        mov esi, 10000h
        push ebx
        sub esi, eax
        call PlotPixel
        add esp, byte 8
        push eax
        call PixelToRgb
        add esp, byte 4
        mov ebx, eax
        mov ecx, eax
        sar ebx, 10h
        mov edi, eax
        and ebx, 0FFh
        mov edx, esi
        mov eax, ebx
        shr ebp, 8
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte esp+04h]
        sar ecx, 8
        add edx, eax
        mov eax, 0FFh
        and ecx, 0FFh
        call min_
        mov ebx, eax
        mov edx, esi
        mov eax, ecx
        and ebp, 0FFh
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        lea edx, [eax+ebp]
        mov eax, 0FFh
        and edi, 0FFh
        call min_
        mov ecx, eax
        mov edx, esi
        mov eax, edi
        shl ebx, 10h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [esp]
        shl ecx, 8
        add edx, eax
        mov eax, 0FFh
        or ebx, ecx
        call min_
        or eax, ebx
        push eax
        call NearestColour
        add esp, byte 4
        push eax
        mov ecx, dword [byte esp+020h]
        push ecx
        mov esi, dword [byte esp+020h]
        push esi
.2:
        call PlotPixelClipped
        add esp, byte 0Ch
.3:
        add esp, byte 8
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawEllipseClipped                              C50E0  96 PC, low confidence
; Draws an ellipse inside the clip window
;-----------------------------------------------------------------------------
DrawEllipseClipped:
        push ebp
        mov eax, dword [byte esp+08h]
        mov edx, dword [byte esp+0Ch]
        cmp eax, dword [DrawClipLeft]
        jl short .1
        cmp eax, dword [DrawClipRight]
        jge short .1
        cmp edx, dword [DrawClipTop]
        jl short .1
        cmp edx, dword [DrawClipBottom]
        jge short .1
        mov ebp, dword [byte esp+010h]
        push ebp
        push edx
        push eax
        call DrawEllipse
        add esp, byte 0Ch
.1:
        pop ebp
        ret
