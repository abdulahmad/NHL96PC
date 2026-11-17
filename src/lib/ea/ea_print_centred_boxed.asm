; EA library: PrintCentredBoxed, ResetClipRect, ResetClipWindow.
bits 32
%include "hockey.inc"
section s_CFE12 progbits alloc exec nowrite align=1
extern DrawClipLeft, DrawClipRight, ScreenHeight, ScreenWidth, SetClipRect, SetClipWindow, TextPrintAt, TextStringWidth
global PrintCentredBoxed, ResetClipRect, ResetClipWindow
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; PrintCentredBoxed                               CFE20  96 PC, low confidence
; Draws a boxed string centred across the clip rectangle (the debug viewers'
; copy)
;-----------------------------------------------------------------------------
PrintCentredBoxed:
        push esi
        push edi
        mov ebx, dword [byte esp+0Ch]
        mov esi, dword [DrawClipRight]
        mov edx, dword [DrawClipLeft]
        push ebx
        sub esi, edx
        call TextStringWidth
        sub esi, eax
        mov ecx, dword [DrawClipLeft]
        mov eax, esi
        add esp, byte 4
        sar eax, 1
        mov esi, dword [byte esp+010h]
        add eax, ecx
        push esi
        inc eax
        push eax
        mov edi, dword [byte esp+014h]
        push edi
        call TextPrintAt
        add esp, byte 0Ch
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; ResetClipRect                                   CFE70  96 PC, low confidence
; Sets a bitmap's clip rectangle to the whole bitmap
;-----------------------------------------------------------------------------
ResetClipRect:
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte eax+04h]
        push edx
        push byte 0
        mov ebx, dword [eax]
        push ebx
        push byte 0
        push eax
        call SetClipRect
        add esp, byte 14h
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; ResetClipWindow                                 CFE8C  96 PC, low confidence
; Sets the clip window to the whole screen
;-----------------------------------------------------------------------------
ResetClipWindow:
        mov edx, dword [ScreenHeight]
        push edx
        push byte 0
        mov ebx, dword [ScreenWidth]
        push ebx
        push byte 0
        call SetClipWindow
        add esp, byte 10h
        ret
