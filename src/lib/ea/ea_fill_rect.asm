; EA library: FillRect, FillRectClipped, XorRect, XorRectClipped, ClearScreenColour and 4 more.
bits 32
%include "hockey.inc"
section s_AD680 progbits alloc exec nowrite align=1
extern ClearClipRect, DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, DrawVideoBase, FillMem, FillRectCore
extern FreeMemBlock, KeyedDraw, PushMemDescriptorLocked, PutBlockScaleSteps, removewindow, RestoreDrawState, SaveDrawState, ScreenRowTable
extern ScreenWidth, SetScreenTarget, TextCharW, TextCursorY, TextFirstChar, TextLastChar, TextSpacing, TextWidthTable
extern VesaSetBank, XorRectCore
global FillRect, FillRectClipped, XorRect, XorRectClipped, ClearScreenColour, DrawRectOutline, TextWidthN, TextStringWidth
global FreeBitmap
;-----------------------------------------------------------------------------
; FillRect                                     AD680  95 PC, medium confidence
; Graphics library: fill a rectangle (x, y, w, h, colour) on the current draw
; target, by pixel depth
;-----------------------------------------------------------------------------
FillRect:
        push esi
        push edi
        push ebp
        sub esp, byte 14h
        mov esi, dword [byte esp+024h]
        mov edi, dword [byte esp+030h]
        mov ebp, dword [byte esp+034h]
        mov edx, dword [byte esp+02Ch]
        test edx, edx
        jle near .11
        test edi, edi
        jle near .11
        cmp dword [KeyedDraw], byte 0
        jne short .1
        push ebp
        push edi
        push edx
        mov ecx, dword [byte esp+034h]
        push ecx
        push esi
        call FillRectCore
        add esp, byte 14h
        jmp near .11
.1:
        mov eax, dword [DrawVideoBase]
        mov dword [byte esp+010h], eax
        mov eax, dword [byte esp+028h]
        mov ecx, dword [nosplit eax*4+ScreenRowTable]
        mov eax, dword [ScreenWidth]
        sub eax, edx
        add esi, ecx
        mov dword [esp], eax
        mov eax, esi
        mov dword [byte esp+04h], edi
        shr eax, 10h
        and esi, 0FFFFh
        mov dword [byte esp+08h], eax
        call VesaSetBank
        test edi, edi
        jle near .11
        mov eax, edx
        mov edx, dword [esp]
        add eax, edx
        mov dword [byte esp+0Ch], eax
.2:
        mov edi, dword [byte esp+08h]
        mov ebx, dword [byte esp+028h]
        mov edi, dword [nosplit edi*4+PutBlockScaleSteps]
        mov ecx, dword [byte esp+04h]
        sub edi, ebx
        cmp edi, ecx
        jle short .3
        mov edi, ecx
.3:
        test edi, edi
        je short .5
        mov eax, dword [byte esp+028h]
        mov edx, dword [byte esp+04h]
        add eax, edi
        sub edx, edi
        mov dword [byte esp+028h], eax
        mov dword [byte esp+04h], edx
.4:
        push ebp
        mov ebx, dword [byte esp+030h]
        mov eax, dword [byte esp+014h]
        push ebx
        add eax, esi
        push eax
        call FillMem
        add esp, byte 0Ch
        add esi, dword [byte esp+0Ch]
        dec edi
        jne short .4
.5:
        cmp dword [byte esp+04h], byte 0
        je near .10
        test esi, 10000h
        je short .6
        mov eax, dword [byte esp+08h]
        inc eax
        and esi, 0FFFFh
        mov dword [byte esp+08h], eax
        call VesaSetBank
.6:
        mov edi, dword [byte esp+02Ch]
        mov eax, dword [byte esp+010h]
        add edi, esi
        add eax, esi
        test edi, 10000h
        je short .7
        mov edx, 10000h
        push ebp
        sub edx, esi
        push edx
        push eax
        call FillMem
        add esp, byte 0Ch
        mov ebx, dword [byte esp+08h]
        inc ebx
        mov eax, ebx
        mov esi, edi
        call VesaSetBank
        push ebp
        and esi, 0FFFFh
        push esi
        mov ecx, dword [byte esp+018h]
        push ecx
        mov dword [byte esp+014h], ebx
        jmp short .8
.7:
        push ebp
        mov edx, dword [byte esp+030h]
        push edx
        push eax
        mov esi, edi
.8:
        call FillMem
        add esp, byte 0Ch
        add esi, dword [esp]
        test esi, 10000h
        je short .9
        mov eax, dword [byte esp+08h]
        inc eax
        and esi, 0FFFFh
        mov dword [byte esp+08h], eax
        call VesaSetBank
.9:
        mov edx, dword [byte esp+04h]
        mov ebx, dword [byte esp+028h]
        dec edx
        inc ebx
        mov dword [byte esp+04h], edx
        mov dword [byte esp+028h], ebx
.10:
        cmp dword [byte esp+04h], byte 0
        jg near .2
.11:
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; FillRectClipped                                 AD824  96 PC, low confidence
; Clips a rectangle to the clip rectangle and fills it
;-----------------------------------------------------------------------------
FillRectClipped:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+010h]
        mov ecx, dword [byte esp+014h]
        mov eax, dword [byte esp+018h]
        mov edx, dword [byte esp+01Ch]
        mov ebx, dword [DrawClipTop]
        sub ebx, ecx
        test ebx, ebx
        jle short .1
        sub edx, ebx
        add ecx, ebx
.1:
        mov edi, dword [DrawClipBottom]
        lea ebx, [ecx+edx]
        sub ebx, edi
        test ebx, ebx
        jle short .2
        sub edx, ebx
.2:
        mov ebx, dword [DrawClipLeft]
        sub ebx, esi
        test ebx, ebx
        jle short .3
        sub eax, ebx
        add esi, ebx
.3:
        mov ebp, dword [DrawClipRight]
        lea ebx, [esi+eax]
        sub ebx, ebp
        test ebx, ebx
        jle short .4
        sub eax, ebx
.4:
        test eax, eax
        jle short .5
        test edx, edx
        jle short .5
        mov ebx, dword [byte esp+020h]
        push ebx
        push edx
        push eax
        push ecx
        push esi
        call FillRect
        add esp, byte 14h
.5:
        pop ebp
        pop edi
        pop esi
.6:
        ret
        db 08Bh,0C0h
.7:
        dec edx
        cmp edx, byte 0FFFFFFFFh
        je short .6
        mov bh, byte [eax]
        inc eax
        xor bh, bl
        mov byte [byte eax-01h], bh
        jmp short .7
;-----------------------------------------------------------------------------
; XorRect                                         AD8A8  96 PC, low confidence
; XORs a rectangle of the draw target with a colour
;-----------------------------------------------------------------------------
XorRect:
        push esi
        push edi
        push ebp
        sub esp, byte 14h
        mov eax, dword [byte esp+024h]
        mov ecx, dword [byte esp+028h]
        mov edi, dword [byte esp+02Ch]
        mov edx, dword [byte esp+030h]
        test edi, edi
        jle near .12
        test edx, edx
        jle near .12
        cmp dword [KeyedDraw], byte 0
        jne short .1
        mov ebp, dword [byte esp+034h]
        push ebp
        push edx
        push edi
        push ecx
        push eax
        call XorRectCore
        add esp, byte 14h
        jmp near .12
.1:
        mov esi, dword [DrawVideoBase]
        mov dword [byte esp+08h], esi
        mov esi, dword [ScreenWidth]
        imul ecx, esi
        mov dword [byte esp+010h], edx
        add ecx, eax
        mov eax, esi
        mov esi, ecx
        sub eax, edi
        shr esi, 10h
        mov dword [esp], eax
        mov eax, esi
        and ecx, 0FFFFh
        call VesaSetBank
        test edx, edx
        jle near .12
.2:
        mov eax, dword [byte esp+08h]
        lea edx, [ecx+edi]
        add eax, ecx
        test edx, 10000h
        je short .7
        mov edx, 10000h
        mov bl, byte [byte esp+034h]
        sub edx, ecx
.3:
        dec edx
        cmp edx, byte 0FFFFFFFFh
        je short .4
        mov bh, byte [eax]
        inc eax
        xor bh, bl
        mov byte [byte eax-01h], bh
        jmp short .3
.4:
        mov bl, byte [byte esp+034h]
        inc esi
        add ecx, edi
        mov eax, esi
        and ecx, 0FFFFh
        call VesaSetBank
        mov dword [byte esp+0Ch], ecx
        mov eax, dword [byte esp+08h]
        mov edx, dword [byte esp+0Ch]
        xor ecx, ecx
.5:
        dec edx
        cmp edx, byte 0FFFFFFFFh
        je short .6
        mov bh, byte [eax]
        inc eax
        xor bh, bl
        mov byte [byte eax-01h], bh
        jmp short .5
.6:
        add ecx, dword [byte esp+0Ch]
        jmp short .10
.7:
        mov bl, byte [byte esp+034h]
        mov dword [byte esp+04h], edi
        mov edx, edi
.8:
        dec edx
        cmp edx, byte 0FFFFFFFFh
        je short .9
        mov bh, byte [eax]
        inc eax
        xor bh, bl
        mov byte [byte eax-01h], bh
        jmp short .8
.9:
        add ecx, dword [byte esp+04h]
.10:
        add ecx, dword [esp]
        test ecx, 10000h
        je short .11
        inc esi
        mov eax, esi
        and ecx, 0FFFFh
        call VesaSetBank
.11:
        mov eax, dword [byte esp+010h]
        dec eax
        mov dword [byte esp+010h], eax
        test eax, eax
        jg near .2
.12:
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; XorRectClipped                                  AD9DC  96 PC, low confidence
; Clips a rectangle to the clip rectangle and XORs it
;-----------------------------------------------------------------------------
XorRectClipped:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+010h]
        mov ecx, dword [byte esp+014h]
        mov eax, dword [byte esp+018h]
        mov edx, dword [byte esp+01Ch]
        mov ebx, dword [DrawClipTop]
        sub ebx, ecx
        test ebx, ebx
        jle short .1
        sub edx, ebx
        add ecx, ebx
.1:
        mov edi, dword [DrawClipBottom]
        lea ebx, [ecx+edx]
        sub ebx, edi
        test ebx, ebx
        jle short .2
        sub edx, ebx
.2:
        mov ebx, dword [DrawClipLeft]
        sub ebx, esi
        test ebx, ebx
        jle short .3
        sub eax, ebx
        add esi, ebx
.3:
        mov ebp, dword [DrawClipRight]
        lea ebx, [esi+eax]
        sub ebx, ebp
        test ebx, ebx
        jle short .4
        sub eax, ebx
.4:
        test eax, eax
        jle short .5
        test edx, edx
        jle short .5
        mov ebx, dword [byte esp+020h]
        push ebx
        push edx
        push eax
        push ecx
        push esi
        call XorRect
        add esp, byte 14h
.5:
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; ClearScreenColour                               ADA50  96 PC, low confidence
; Fills the whole screen with a colour
;-----------------------------------------------------------------------------
ClearScreenColour:
        sub esp, byte 60h
        mov eax, esp
        push eax
        call SaveDrawState
        add esp, byte 4
        call SetScreenTarget
        mov edx, dword [byte esp+064h]
        push edx
        call ClearClipRect
        add esp, byte 4
        mov eax, esp
        push eax
        call RestoreDrawState
        add esp, byte 4
        add esp, byte 60h
        ret
        db 00h
;-----------------------------------------------------------------------------
; DrawRectOutline                                 ADA80  96 PC, low confidence
; Draws the outline of a rectangle as four filled edges
;-----------------------------------------------------------------------------
DrawRectOutline:
        push esi
        push edi
        push ebp
        sub esp, byte 8
        mov esi, dword [byte esp+018h]
        mov edi, dword [byte esp+01Ch]
        mov ebp, dword [byte esp+020h]
        cmp ebp, esi
        jge short .1
        mov eax, esi
        mov esi, ebp
        mov ebp, eax
.1:
        mov eax, ebp
        sub eax, esi
        inc eax
        mov edx, dword [byte esp+024h]
        mov dword [byte esp+04h], eax
        cmp edi, edx
        jle short .2
        mov dword [esp], edi
        mov eax, dword [esp]
        mov edi, edx
        mov dword [byte esp+024h], eax
.2:
        mov ebx, dword [byte esp+028h]
        push ebx
        push byte 1
        mov ecx, dword [byte esp+0Ch]
        mov eax, dword [byte esp+02Ch]
        push ecx
        sub eax, edi
        push edi
        dec eax
        push esi
        mov dword [byte esp+014h], eax
        call FillRectClipped
        add esp, byte 14h
        mov eax, dword [byte esp+028h]
        push eax
        mov edx, dword [byte esp+04h]
        push edx
        push byte 1
        inc edi
        push edi
        push ebp
        call FillRectClipped
        add esp, byte 14h
        mov ebx, dword [byte esp+028h]
        push ebx
        mov ecx, dword [byte esp+04h]
        push ecx
        push byte 1
        push edi
        push esi
        call FillRectClipped
        add esp, byte 14h
        mov edi, dword [byte esp+028h]
        push edi
        push byte 1
        mov ebp, dword [byte esp+0Ch]
        push ebp
        mov eax, dword [byte esp+030h]
        push eax
        push esi
        call FillRectClipped
        add esp, byte 14h
        add esp, byte 8
        pop ebp
        pop edi
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; TextWidthN                                      ADB30  96 PC, low confidence
; Returns the width in pixels of at most n characters of a string in the
; current font
;-----------------------------------------------------------------------------
TextWidthN:
        push esi
        push edi
        push ebp
        mov edx, dword [byte esp+010h]
        mov ecx, dword [byte esp+014h]
        xor ebx, ebx
        movzx esi, byte [TextLastChar]
        mov bl, byte [TextFirstChar]
        xor eax, eax
        sub esi, ebx
        mov bl, byte [edx]
        lea edi, [byte esi+01h]
        test bl, bl
        je short .7
        mov ebp, dword [TextWidthTable]
.1:
        test ecx, ecx
        je short .7
        mov bl, byte [edx]
        sub bl, byte [TextFirstChar]
        and ebx, 0FFh
        cmp ebx, edi
        jge short .6
        mov esi, dword [TextCursorY]
        test esi, esi
        je short .2
        movsx ebx, byte [esi+ebx]
        jmp short .5
.2:
        test ebp, ebp
        je short .3
        mov esi, ebp
        movzx esi, byte [esi+ebx]
        xor ebx, ebx
        jmp short .4
.3:
        xor ebx, ebx
        movzx esi, byte [TextCharW]
.4:
        mov bl, byte [TextSpacing]
        add ebx, esi
.5:
        add eax, ebx
.6:
        mov bh, byte [byte edx+01h]
        inc edx
        dec ecx
        test bh, bh
        jne short .1
.7:
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; TextStringWidth                              ADBB4  96 PC, medium confidence
; Returns the width in pixels of a string in the current font
;-----------------------------------------------------------------------------
TextStringWidth:
        push dword 200h
        mov edx, dword [byte esp+08h]
        push edx
        call TextWidthN
        add esp, byte 8
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h
        mov edx, dword [byte esp+04h]
        mov eax, dword [edx]
        mov eax, dword [byte eax+028h]
        sub eax, byte 8
        call removewindow
        push edx
        call PushMemDescriptorLocked
        add esp, byte 4
        ret
        db 090h
;-----------------------------------------------------------------------------
; FreeBitmap                                   ADBEC  96 PC, medium confidence
; Removes a bitmap's window and frees its memory
;-----------------------------------------------------------------------------
FreeBitmap:
        mov edx, dword [byte esp+04h]
        mov eax, dword [byte edx+028h]
        sub eax, byte 8
        call removewindow
        push edx
        call FreeMemBlock
        add esp, byte 4
        ret
