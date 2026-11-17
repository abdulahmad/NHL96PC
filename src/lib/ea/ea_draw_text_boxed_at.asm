; EA library: DrawTextBoxedAt.
bits 32
%include "hockey.inc"
section s_D1366 progbits alloc exec nowrite align=1
extern FillRectClipped, SetTextOrigin, TextBgColour, TextCharH, TextOriginX, TextOriginY, TextPrint, TextStringWidth
global DrawTextBoxedAt
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; DrawTextBoxedAt                              D1368  96 PC, medium confidence
; Font library: (x, y, string) moves the text position and draws the string
; on its box
;-----------------------------------------------------------------------------
DrawTextBoxedAt:
        push esi
        push edi
        push ebp
        mov edx, dword [byte esp+018h]
        push edx
        mov ebx, dword [byte esp+018h]
        push ebx
        call SetTextOrigin
        add esp, byte 8
        mov ecx, dword [byte esp+010h]
        push ecx
        mov edi, dword [TextOriginX]
        mov esi, dword [TextOriginY]
        call TextStringWidth
        add esp, byte 4
        mov ebp, dword [TextBgColour]
        xor edx, edx
        push ebp
        mov dl, byte [TextCharH]
        push edx
        push eax
        push esi
        push edi
        call FillRectClipped
        add esp, byte 14h
        mov eax, dword [byte esp+010h]
        push eax
        call TextPrint
        add esp, byte 4
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
        push esi
        push edi
        sub esp, byte 4
        mov edx, dword [byte esp+018h]
        push edx
        mov ebx, dword [byte esp+018h]
        push ebx
        call SetTextOrigin
        add esp, byte 8
        mov al, byte [byte esp+010h]
        mov byte [esp], al
        xor ah, ah
        mov byte [byte esp+01h], ah
        mov eax, esp
        push eax
        mov edi, dword [TextOriginX]
        mov esi, dword [TextOriginY]
        call TextStringWidth
        add esp, byte 4
        mov ecx, dword [TextBgColour]
        xor edx, edx
        push ecx
        mov dl, byte [TextCharH]
        push edx
        push eax
        push esi
        push edi
        call FillRectClipped
        add esp, byte 14h
        mov eax, esp
        push eax
        call TextPrint
        add esp, byte 4
        add esp, byte 4
        pop edi
        pop esi
        ret
