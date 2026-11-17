; EA library: SetDrawBitmap, FillRectColor, SetClipWindow.
bits 32
%include "hockey.inc"
section s_DD705 progbits alloc exec nowrite align=1
extern DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, FillRectSpans, ScreenHeight, ScreenWidth, SetupRectFill
global SetDrawBitmap, FillRectColor, SetClipWindow
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; SetDrawBitmap                                DD708  95 PC, medium confidence
; Copies a 12-word bitmap header into the screen bitmap the draw routines use
;-----------------------------------------------------------------------------
SetDrawBitmap:
        LD mov, edx, edi
        LD mov, eax, esi
        mov esi, dword [byte esp+04h]
        mov edi, ScreenWidth
        mov ecx, 0Ch
        rep movsd
        LD mov, edi, edx
        LD mov, esi, eax
        ret
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; FillRectColor                                   DD724  96 PC, low confidence
; Clips a rectangle to the screen and fills it with a colour; followed by the
; row fillers
;-----------------------------------------------------------------------------
FillRectColor:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFC8h
        lea eax, [byte ebp-038h]
        push eax
        push dword [byte ebp+014h]
        db 0FFh,075h,010h                       ; insn: push dword [ebp+10h]
        db 0FFh,075h,0Ch                        ; insn: push dword [ebp+0Ch]
        push dword [byte ebp+08h]
        call SetupRectFill
        add esp, byte 14h
        LD or, eax, eax
        jne short .1
        lea ebx, [byte ebp-038h]
        cmp dword [byte ebx+018h], byte 0
        jle short .1
        mov eax, dword [byte ebp+018h]
        mov dword [byte ebx+01Ch], eax
        push ebx
        call FillRectSpans
        add esp, byte 4
.1:
        leave
        ret
;-----------------------------------------------------------------------------
; SetClipWindow                                DD760  95 PC, medium confidence
; (x0, y0, x1, y1): sets the drawing clip window, limited to the screen
;-----------------------------------------------------------------------------
SetClipWindow:
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        mov ecx, dword [byte esp+0Ch]
        mov ebx, dword [byte esp+010h]
        cmp eax, byte 0
        jge short .1
        mov eax, 0
.1:
        cmp ecx, byte 0
        jge short .2
        mov ecx, 0
.2:
        cmp edx, dword [ScreenWidth]
        jle short .3
        mov edx, dword [ScreenWidth]
.3:
        cmp ebx, dword [ScreenHeight]
        jle short .4
        mov ebx, dword [ScreenHeight]
.4:
        mov dword [DrawClipLeft], eax
        mov dword [DrawClipTop], ecx
        mov dword [DrawClipRight], edx
        mov dword [DrawClipBottom], ebx
        ret
