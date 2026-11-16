; Message boxes: with buttons, without, and with a progress bar.
bits 32
%include "hockey.inc"
section s_1A04E progbits alloc exec nowrite align=1
extern TextCharH, ProgressBoxState, DrawArtOpaque, MessageShown, ProgressBoxBmp
extern ProgressBoxTotal, ProgressBoxStep, ViewScreenWidth, dlgtextfg, FillRect, TextStringWidth, mousex, mousey
extern PutBlock, SetDrawBitmap, sprintf_, str_02, str_BDMEN, str_BDREG, str_BUT, str_D14
extern str_X, CopyBitmap, DrawTextCentred, SetTextColors, DrawColorTextCentred, DrawBox, InitMenuItems, RunMenu
extern SetMenuMouse, SoundIdle, DrawShapeCore, PutBlockAtOwnPos, AllocMemBlock, FreeMemBlock, CreateBitmap, TintRect
extern DrawRectOutline, FreeBitmap, TextSetColor, SetScreenTarget, GetPaletteRange, KeyIsDown, MsgTextBuf
global DrawBoxButton, DrawBoxButton_ret, MessageBox, HideMessage, ShowMessage, ShowProgressBox, UpdateProgressBox, HideProgressBox
;-----------------------------------------------------------------------------
; DrawBoxButton                                1A04E  96 PC, medium confidence
; Draws one button (BUT art) of the open message box, highlighted or not,
; with its text
;-----------------------------------------------------------------------------
DrawBoxButton:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        cmp dword [byte eax+04h], byte 0
        jne short .1
        mov edi, dword [dlgtextfg]
        mov edi, dword [byte edi+01Ch]
        movzx edi, byte [edi]
        jmp short .2
.1:
        mov eax, dword [dlgtextfg]
        mov edi, dword [byte eax+01Ch]
        movzx edi, byte [byte edi+02h]
.2:
        mov eax, dword [dlgtextfg]
        mov edx, dword [esi]
        push edi
        shl edx, 6
        mov eax, dword [byte eax+020h]
        push dword [byte edx+eax+014h]
        push dword [byte edx+eax+010h]
        push dword [byte edx+eax+04h]
        push dword [edx+eax]
        call DrawRectOutline
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+01Ch]
        add esp, byte 14h
        movzx edx, byte [byte eax+01h]
        mov eax, edi
        call SetTextColors
        push str_X
        mov edx, dword [esi]
        mov eax, dword [dlgtextfg]
        shl edx, 2
        mov edi, dword [byte eax+028h]
        mov ebx, dword [byte eax+0Ch]
        add edi, edx
        movzx edx, byte [TextCharH]
        add ebx, dword [byte eax+014h]
        lea edx, [edx+edx*2]
        mov esi, dword [esi]
        sub ebx, edx
        mov edx, dword [byte eax+020h]
        shl esi, 6
        mov eax, dword [byte eax+018h]
        mov esi, dword [edx+esi]
        sar eax, 1
        mov dword [byte ebp-04h], ebx
        add esi, eax
        call TextStringWidth
        mov ebx, dword [byte ebp-04h]
        mov edx, esi
        add esp, byte 4
        sub edx, eax
        mov eax, dword [edi]
        call DrawColorTextCentred
DrawBoxButton_ret:
        leave
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; MessageBox                                                      1A109  96 PC
; (text id, buttons, ...): a message box (BD_REG / BD_MEN board, BUT buttons)
; over the screen, waits for a button by mouse.
;
; pad or keys (with the modem chat on a modem game); returns the button
;-----------------------------------------------------------------------------
MessageBox:
        push esi
        push edi
        enter 33Ch, 0
        push eax
        push edx
        push ebx
        mov esi, ecx
        push byte 20h
        push byte 30h
        push str_BUT
        call AllocMemBlock
        mov edx, dword [dword ebp-0348h]
        mov dword [dlgtextfg], eax
        mov dword [byte eax+028h], edx
        mov eax, dword [dlgtextfg]
        mov edx, dword [dword ebp-0344h]
        mov dword [byte eax+02Ch], edx
        mov eax, dword [dlgtextfg]
        add esp, byte 0Ch
        mov dword [byte eax+01Ch], esi
        lea eax, [dword ebp-033Ch]
        push eax
        push dword 100h
        push byte 0
        mov dword [byte ebp-018h], 0
        mov edi, dword [dword ebp-0348h]
        call GetPaletteRange
        mov eax, dword [dword ebp-0344h]
        add esp, byte 0Ch
        mov dword [byte ebp-014h], eax
.1:
        cmp dword [byte ebp-014h], byte 0
        jle short .3
        push dword [edi]
        call TextStringWidth
        add esp, byte 4
        cmp eax, dword [byte ebp-018h]
        jle short .2
        mov dword [byte ebp-018h], eax
.2:
        dec dword [byte ebp-014h]
        add edi, byte 4
        jmp short .1
.3:
        push str_X
        call TextStringWidth
        mov edx, dword [byte ebp-018h]
        shl eax, 2
        add edx, eax
        mov eax, dword [dlgtextfg]
        mov dword [byte eax+018h], edx
        mov eax, edx
        mov edx, dword [dword ebp-0344h]
        imul edx, eax
        add esp, byte 4
        mov dword [byte ebp-018h], 0
        mov dword [byte ebp-02Ch], edx
        mov eax, dword [dword ebp-0340h]
        add dword [byte ebp-02Ch], byte 6
        mov dword [byte ebp-028h], eax
        jmp short .7
.4:
        movzx eax, byte [edi]
        cmp eax, 0FEh
        jne short .9
        mov al, byte [edi]
        push dword [byte ebp-028h]
        mov byte [byte ebp-04h], al
        mov byte [edi], 0
        call TextStringWidth
        add esp, byte 4
        cmp eax, dword [byte ebp-018h]
        jle short .5
        push dword [byte ebp-028h]
        call TextStringWidth
        add esp, byte 4
        mov dword [byte ebp-018h], eax
.5:
        mov al, byte [byte ebp-04h]
        mov byte [edi], al
        inc edi
.6:
        mov dword [byte ebp-028h], edi
.7:
        mov eax, dword [byte ebp-028h]
        cmp byte [eax], 0
        je short .10
        mov edi, eax
.8:
        cmp byte [edi], 0
        je short .4
        movzx eax, byte [edi]
        cmp eax, 0FEh
        je short .4
        inc edi
        jmp short .8
.9:
        push dword [byte ebp-028h]
        call TextStringWidth
        add esp, byte 4
        cmp eax, dword [byte ebp-018h]
        jle short .6
        push dword [byte ebp-028h]
        call TextStringWidth
        add esp, byte 4
        mov dword [byte ebp-018h], eax
        jmp short .6
.10:
        cmp dword [byte ebp-018h], byte 0
        jne short .11
        push dword [dword ebp-0340h]
        call TextStringWidth
        add esp, byte 4
        mov dword [byte ebp-018h], eax
.11:
        push str_X
        call TextStringWidth
        shl eax, 2
        add dword [byte ebp-018h], eax
        mov eax, dword [byte ebp-018h]
        add esp, byte 4
        cmp eax, dword [byte ebp-02Ch]
        jle short .13
        mov eax, dword [ViewScreenWidth]
        mov edx, dword [ViewScreenWidth]
        sar eax, 2
        sub edx, eax
        mov eax, edx
        cmp edx, dword [byte ebp-018h]
        jge short .12
        mov dword [byte ebp-018h], edx
.12:
        mov eax, dword [byte ebp-018h]
        mov dword [byte ebp-02Ch], eax
.13:
        mov dword [byte ebp-014h], 0
        cmp dword [dword ebp-0340h], byte 0
        je near .25
        mov edi, dword [dword ebp-0340h]
        mov dword [byte ebp-01Ch], edi
.14:
        mov eax, dword [byte ebp-01Ch]
        cmp byte [eax], 0
        je near .24
        cmp byte [edi], 0
        je near .24
.15:
        movzx eax, byte [edi]
        cmp eax, byte 20h
        je short .16
        cmp eax, 0FEh
        je short .16
        cmp byte [edi], 0
        je short .16
        inc edi
        jmp short .15
.16:
        mov al, byte [edi]
        push dword [byte ebp-01Ch]
        mov byte [byte ebp-0Ch], al
        mov byte [edi], 0
        call TextStringWidth
        add esp, byte 4
        cmp eax, dword [byte ebp-02Ch]
        jg short .17
        movzx eax, byte [byte ebp-0Ch]
        cmp eax, 0FEh
        jne short .23
.17:
        mov al, byte [byte ebp-0Ch]
        mov byte [edi], al
        movzx eax, al
        cmp eax, 0FEh
        je short .21
        lea eax, [byte edi-01h]
        mov dword [byte ebp-01Ch], eax
.18:
        mov eax, dword [byte ebp-01Ch]
        movzx eax, byte [eax]
        cmp eax, byte 20h
        je short .19
        mov eax, dword [byte ebp-01Ch]
        cmp eax, dword [dword ebp-0340h]
        je short .19
        dec dword [byte ebp-01Ch]
        jmp short .18
.19:
        mov eax, dword [byte ebp-01Ch]
        cmp eax, dword [dword ebp-0340h]
        jne short .20
        mov dword [byte ebp-01Ch], edi
.20:
        inc dword [byte ebp-01Ch]
        mov edi, dword [byte ebp-01Ch]
        jmp short .22
.21:
        inc edi
.22:
        inc dword [byte ebp-014h]
        jmp near .14
.23:
        mov al, byte [byte ebp-0Ch]
        mov byte [edi], al
        test al, al
        je near .14
        inc edi
        jmp near .14
.24:
        inc dword [byte ebp-014h]
.25:
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte ebp-02Ch]
        mov dword [byte eax+010h], edx
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte eax+010h]
        mov ebx, dword [byte ebp+014h]
        sar edx, 1
        sub ebx, edx
        mov dword [byte eax+08h], ebx
        mov edx, dword [byte ebp-014h]
        movzx eax, byte [TextCharH]
        add edx, byte 6
        imul edx, eax
        mov eax, dword [dlgtextfg]
        mov dword [byte eax+014h], edx
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte eax+014h]
        mov ebx, dword [byte ebp+018h]
        sar edx, 1
        sub ebx, edx
        mov dword [byte eax+0Ch], ebx
        push byte 0
        mov eax, dword [dlgtextfg]
        push dword [byte eax+014h]
        push dword [byte eax+010h]
        call CreateBitmap
        mov edx, eax
        mov eax, dword [dlgtextfg]
        add esp, byte 0Ch
        mov dword [eax], edx
        push byte 0
        mov eax, dword [dlgtextfg]
        push dword [byte eax+014h]
        push dword [byte eax+010h]
        call CreateBitmap
        mov edx, eax
        mov eax, dword [dlgtextfg]
        mov dword [byte eax+04h], edx
        add esp, byte 0Ch
        mov edi, dword [dlgtextfg]
        push dword [byte edi+0Ch]
        mov eax, dword [edi]
        push dword [byte edi+08h]
        push dword [byte eax+02Ch]
        call DrawShapeCore
        mov eax, dword [dlgtextfg]
        add esp, byte 0Ch
        push dword [byte eax+04h]
        call SetDrawBitmap
        add esp, byte 4
        mov eax, dword [dlgtextfg]
        push byte 0
        mov eax, dword [eax]
        push byte 0
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push MsgTextBuf
        lea eax, [dword ebp-033Ch]
        push eax
        push dword 6666h
        call TintRect
        mov byte [MsgTextBuf+0FFh], 0FFh
        add esp, byte 0Ch
        movzx eax, byte [byte esi+01h]
        push eax
        movzx eax, byte [esi]
        push eax
        mov eax, dword [dlgtextfg]
        xor ebx, ebx
        push byte 2
        mov edx, dword [byte eax+014h]
        mov ecx, dword [byte eax+010h]
        dec edx
        mov eax, MsgTextBuf
        push edx
        dec ecx
        xor edx, edx
        call DrawBox
        movzx edx, byte [byte esi+01h]
        movzx eax, byte [esi]
        mov edi, dword [dword ebp-0340h]
        call SetTextColors
        movzx eax, byte [TextCharH]
        inc edi
        mov dword [byte ebp-014h], eax
.26:
        mov eax, dword [dword ebp-0340h]
        cmp byte [eax], 0
        je near .37
.27:
        movzx eax, byte [edi]
        cmp eax, byte 20h
        je short .28
        cmp eax, 0FEh
        je short .28
        cmp byte [edi], 0
        je short .28
        inc edi
        jmp short .27
.28:
        mov al, byte [edi]
        push str_X
        mov byte [byte ebp-08h], al
        mov byte [edi], 0
        call TextStringWidth
        mov edx, dword [byte ebp-02Ch]
        add eax, eax
        add esp, byte 4
        sub edx, eax
        push dword [dword ebp-0340h]
        mov dword [byte ebp-038h], edx
        call TextStringWidth
        add esp, byte 4
        cmp eax, dword [byte ebp-038h]
        jg short .29
        movzx eax, byte [byte ebp-08h]
        cmp eax, 0FEh
        jne near .34
.29:
        movzx eax, byte [byte ebp-08h]
        cmp eax, 0FEh
        je short .32
        mov al, byte [byte ebp-08h]
        mov byte [edi], al
        lea eax, [byte edi-01h]
.30:
        movzx edx, byte [eax]
        cmp edx, byte 20h
        je short .31
        cmp eax, dword [dword ebp-0340h]
        je short .31
        dec eax
        jmp short .30
.31:
        cmp eax, dword [dword ebp-0340h]
        je short .33
        mov edi, eax
        jmp short .33
.32:
        mov al, byte [byte ebp-08h]
        mov byte [edi], al
.33:
        mov cl, byte [edi]
        mov byte [edi], 0
        mov eax, dword [dlgtextfg]
        mov ebx, dword [byte ebp-014h]
        mov edx, dword [byte eax+010h]
        mov eax, dword [dword ebp-0340h]
        sar edx, 1
        call DrawColorTextCentred
        movzx eax, byte [TextCharH]
        mov byte [edi], cl
        inc edi
        add dword [byte ebp-014h], eax
        mov dword [dword ebp-0340h], edi
        jmp short .35
.34:
        mov al, byte [byte ebp-08h]
        mov byte [edi], al
.35:
        cmp byte [edi], 0
        jne short .36
        mov eax, dword [dlgtextfg]
        mov ebx, dword [byte ebp-014h]
        mov edx, dword [byte eax+010h]
        mov eax, dword [dword ebp-0340h]
        sar edx, 1
        call DrawColorTextCentred
        mov dword [dword ebp-0340h], edi
        jmp near .26
.36:
        inc edi
        jmp near .26
.37:
        mov edi, dword [dword ebp-0344h]
        push byte 0
        shl edi, 6
        push edi
        push str_BDREG
        call AllocMemBlock
        mov dword [byte ebp-038h], eax
        add esp, byte 0Ch
        mov ecx, edi
        mov edi, dword [byte ebp-038h]
        xor eax, eax
        rep stosb
        imul eax, dword [dword ebp-0344h], byte 66h
        push byte 0
        push eax
        push str_BDMEN
        call AllocMemBlock
        mov edi, eax
        add esp, byte 0Ch
        mov edx, eax
        mov eax, dword [dword ebp-0344h]
        call InitMenuItems
        mov eax, dword [dlgtextfg]
        mov dword [byte eax+024h], edi
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte ebp-038h]
        mov dword [byte eax+020h], edx
        mov eax, dword [dlgtextfg]
        mov edx, dword [dword ebp-0344h]
        imul edx, dword [byte eax+018h]
        mov eax, dword [byte eax+010h]
        sar edx, 1
        sar eax, 1
        sub eax, edx
        mov dword [byte ebp-020h], eax
        mov eax, dword [dword ebp-0348h]
        mov dword [byte ebp-030h], eax
        mov eax, dword [dword ebp-0344h]
        dec eax
        mov dword [byte ebp-014h], 0
        mov dword [byte ebp-034h], eax
        mov al, byte [byte ebp-014h]
        xor edi, edi
        dec al
        mov dword [byte ebp-024h], edi
        mov byte [byte ebp-010h], al
.38:
        mov eax, dword [byte ebp-014h]
        cmp eax, dword [dword ebp-0344h]
        jge near .41
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+08h]
        add eax, dword [byte ebp-020h]
        push str_X
        mov dword [byte ebp-038h], eax
        call TextStringWidth
        mov edx, dword [byte ebp-038h]
        add edx, eax
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+020h]
        mov dword [edi+eax], edx
        mov eax, dword [dlgtextfg]
        movzx ebx, byte [TextCharH]
        mov edx, dword [byte eax+0Ch]
        shl ebx, 2
        add edx, dword [byte eax+014h]
        mov eax, dword [byte eax+020h]
        sub edx, ebx
        mov dword [byte edi+eax+04h], edx
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte eax+08h]
        add edx, dword [byte ebp-020h]
        mov eax, dword [byte eax+018h]
        add esp, byte 4
        add eax, edx
        push str_X
        mov dword [byte ebp-038h], eax
        call TextStringWidth
        mov edx, dword [byte ebp-038h]
        sub edx, eax
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+020h]
        mov dword [byte edi+eax+08h], edx
        mov eax, dword [dlgtextfg]
        movzx edx, byte [TextCharH]
        mov ebx, dword [byte eax+0Ch]
        shl edx, 2
        add ebx, dword [byte eax+014h]
        mov eax, dword [byte eax+020h]
        sub ebx, edx
        mov dword [byte edi+eax+0Ch], ebx
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+020h]
        mov edx, dword [byte edi+eax+08h]
        mov dword [byte edi+eax+010h], edx
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte eax+0Ch]
        movzx ebx, byte [TextCharH]
        add edx, dword [byte eax+014h]
        mov eax, dword [byte eax+020h]
        sub edx, ebx
        mov dword [byte edi+eax+014h], edx
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+020h]
        mov edx, dword [edi+eax]
        add esp, byte 4
        mov dword [byte edi+eax+018h], edx
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte eax+0Ch]
        movzx ebx, byte [TextCharH]
        add edx, dword [byte eax+014h]
        mov eax, dword [byte eax+020h]
        sub edx, ebx
        mov dword [byte edi+eax+01Ch], edx
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+024h]
        add eax, dword [byte ebp-024h]
        mov dword [byte eax+010h], 4
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte eax+020h]
        mov eax, dword [byte eax+024h]
        add eax, dword [byte ebp-024h]
        add edx, edi
        mov dword [byte eax+014h], edx
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte eax+020h]
        mov eax, dword [byte eax+024h]
        mov edx, dword [byte edx+edi+010h]
        add eax, dword [byte ebp-024h]
        sub edx, byte 0Ah
        mov dword [byte eax+03Ah], edx
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte eax+020h]
        mov eax, dword [byte eax+024h]
        mov edx, dword [byte edx+edi+014h]
        add eax, dword [byte ebp-024h]
        sub edx, byte 0Ah
        mov dword [byte eax+03Eh], edx
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+024h]
        add eax, dword [byte ebp-024h]
        mov dword [byte eax+036h], DrawBoxButton
        cmp dword [byte ebp-014h], byte 0
        jle short .39
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+024h]
        add eax, dword [byte ebp-024h]
        mov dl, byte [byte ebp-010h]
        mov byte [byte eax+044h], dl
.39:
        mov eax, dword [byte ebp-014h]
        cmp eax, dword [byte ebp-034h]
        jge short .40
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+024h]
        mov dl, byte [byte ebp-014h]
        add eax, dword [byte ebp-024h]
        inc dl
        mov byte [byte eax+045h], dl
.40:
        movzx eax, byte [byte esi+01h]
        mov edx, dword [dlgtextfg]
        push eax
        mov ebx, dword [byte edx+014h]
        movzx eax, byte [TextCharH]
        sub ebx, eax
        lea eax, [byte ebx+01h]
        push eax
        mov eax, dword [byte ebp-020h]
        add eax, dword [byte edx+018h]
        push str_X
        mov dword [byte ebp-038h], eax
        call TextStringWidth
        mov edx, dword [byte ebp-038h]
        sub edx, eax
        lea eax, [byte edx+01h]
        add esp, byte 4
        movzx edx, byte [TextCharH]
        push eax
        mov eax, dword [dlgtextfg]
        shl edx, 2
        mov eax, dword [byte eax+014h]
        sub eax, edx
        inc eax
        push eax
        push str_X
        call TextStringWidth
        add eax, dword [byte ebp-020h]
        add esp, byte 4
        inc eax
        push eax
        call DrawRectOutline
        add esp, byte 14h
        movzx eax, byte [esi]
        push eax
        mov eax, dword [dlgtextfg]
        movzx edx, byte [TextCharH]
        mov ebx, dword [byte eax+014h]
        sub ebx, edx
        mov edx, dword [byte ebp-020h]
        push ebx
        add edx, dword [byte eax+018h]
        push str_X
        mov dword [byte ebp-038h], edx
        call TextStringWidth
        mov edx, dword [byte ebp-038h]
        add esp, byte 4
        sub edx, eax
        mov eax, dword [dlgtextfg]
        push edx
        movzx edx, byte [TextCharH]
        mov eax, dword [byte eax+014h]
        shl edx, 2
        sub eax, edx
        push eax
        push str_X
        call TextStringWidth
        add esp, byte 4
        add eax, dword [byte ebp-020h]
        push eax
        call DrawRectOutline
        movzx eax, byte [TextCharH]
        lea ebx, [eax+eax*2]
        mov eax, dword [dlgtextfg]
        mov edx, dword [byte eax+014h]
        sub edx, ebx
        inc byte [byte ebp-010h]
        mov ebx, edx
        mov edx, dword [byte eax+018h]
        mov eax, dword [byte ebp-030h]
        sar edx, 1
        add esp, byte 14h
        add edx, dword [byte ebp-020h]
        mov eax, dword [eax]
        add dword [byte ebp-024h], byte 66h
        call DrawColorTextCentred
        mov eax, dword [dlgtextfg]
        inc dword [byte ebp-014h]
        add edi, byte 40h
        mov eax, dword [byte eax+018h]
        add dword [byte ebp-030h], byte 4
        add dword [byte ebp-020h], eax
        jmp near .38
.41:
        mov edi, dword [dword ebp-0344h]
        movzx edx, byte [byte esi+01h]
        movzx eax, byte [esi]
        dec edi
        call SetTextColors
        imul edx, edi, byte 66h
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+024h]
        add eax, edx
        mov edx, dword [byte eax+03Eh]
        mov eax, dword [byte eax+03Ah]
        call SetMenuMouse
        mov dword [byte ebp-03Ch], edi
        call SetScreenTarget
        mov eax, dword [dlgtextfg]
        push dword [byte eax+0Ch]
        push dword [byte eax+08h]
        mov eax, dword [byte eax+04h]
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
.42:
        push byte 1
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .43
        call SoundIdle
        jmp short .42
.43:
        call SoundIdle
        cmp dword [byte ebp-03Ch], byte 0
        jl short .45
        mov eax, dword [byte ebp-03Ch]
        cmp eax, dword [dword ebp-0344h]
        jge short .45
        imul edx, dword [byte ebp-03Ch], byte 66h
        mov eax, dword [dlgtextfg]
        mov eax, dword [byte eax+024h]
        add eax, edx
        mov edx, dword [mousex]
        cmp edx, dword [byte eax+03Ah]
        jne short .44
        mov edx, dword [mousey]
        cmp edx, dword [byte eax+03Eh]
        je short .45
.44:
        mov dword [byte ebp-03Ch], 0FFFFFFFFh
.45:
        push dword [byte ebp+020h]
        push dword [byte ebp+01Ch]
        lea eax, [byte ebp-03Ch]
        push eax
        mov eax, dword [dlgtextfg]
        mov ecx, dword [byte ebp+010h]
        mov ebx, 0FFFFFFFFh
        mov edx, dword [byte eax+024h]
        mov eax, dword [dword ebp-0344h]
        call RunMenu
        cmp dword [byte ebp-03Ch], byte 0FFFFFFFEh
        je short .43
        mov eax, dword [dlgtextfg]
        push dword [byte eax+0Ch]
        push dword [byte eax+08h]
        mov eax, dword [eax]
        push dword [byte eax+02Ch]
        call DrawArtOpaque
        mov eax, dword [dlgtextfg]
        add esp, byte 0Ch
        push dword [byte eax+04h]
        call FreeBitmap
        mov eax, dword [dlgtextfg]
        add esp, byte 4
        push dword [eax]
        call FreeBitmap
        mov eax, dword [dlgtextfg]
        add esp, byte 4
        push dword [byte eax+024h]
        call FreeMemBlock
        mov eax, dword [dlgtextfg]
        add esp, byte 4
        push dword [byte eax+020h]
        call FreeMemBlock
        add esp, byte 4
        push dword [dlgtextfg]
        call FreeMemBlock
        add esp, byte 4
        movzx edx, byte [byte esi+01h]
        movzx eax, byte [esi]
        call SetTextColors
        mov eax, dword [byte ebp-03Ch]
        leave
        pop edi
        pop esi
        ret 14h
;-----------------------------------------------------------------------------
; HideMessage                                                     1AA27  96 PC
; Takes down the message put up by ShowMessage
;-----------------------------------------------------------------------------
HideMessage:
        push ebx
        push ecx
        push edx
        cmp dword [MessageShown], byte 0
        je short .1
        call SetScreenTarget
        push dword [MessageShown]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [MessageShown]
        call FreeMemBlock
        mov dword [MessageShown], 0
        add esp, byte 4
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; ShowMessage                                                     1AA62  96 PC
; (text id, w, h, screen): puts up a message box with no buttons and returns
; (HideMessage takes it down)
;-----------------------------------------------------------------------------
ShowMessage:
        push esi
        push edi
        enter 314h, 0
        push eax
        mov esi, edx
        mov dword [byte ebp-010h], ebx
        mov dword [byte ebp-04h], ecx
        cmp dword [MessageShown], byte 0
        je short .1
        je short .1
        call SetScreenTarget
        push dword [MessageShown]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [MessageShown]
        call FreeMemBlock
        mov dword [MessageShown], 0
        add esp, byte 4
.1:
        lea eax, [dword ebp-0314h]
        push eax
        push dword 100h
        push byte 0
        call GetPaletteRange
        add esp, byte 0Ch
        push str_X
        call TextStringWidth
        add esp, byte 4
        mov edi, eax
        push dword [dword ebp-0318h]
        shl edi, 2
        call TextStringWidth
        add eax, edi
        add esp, byte 4
        mov dword [byte ebp-0Ch], eax
        movzx eax, byte [TextCharH]
        push byte 0
        lea eax, [eax+eax*2]
        push eax
        push dword [byte ebp-0Ch]
        call CreateBitmap
        add esp, byte 0Ch
        mov edi, eax
        call SetScreenTarget
        movzx eax, byte [TextCharH]
        lea eax, [eax+eax*2]
        mov edx, dword [byte ebp-04h]
        sar eax, 1
        sub edx, eax
        mov eax, dword [byte ebp-0Ch]
        sar eax, 1
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-010h]
        push edx
        sub eax, dword [byte ebp-014h]
        push eax
        push dword [byte edi+02Ch]
        mov dword [byte ebp-08h], eax
        call DrawShapeCore
        add esp, byte 0Ch
        mov eax, dword [byte edi+02Ch]
        xor edx, edx
        call CopyBitmap
        mov edx, dword [byte ebp-08h]
        mov dword [MessageShown], eax
        mov word [byte eax+0Ch], dx
        movzx eax, byte [TextCharH]
        lea eax, [eax+eax*2]
        mov edx, dword [byte ebp-04h]
        sar eax, 1
        sub edx, eax
        mov eax, dword [MessageShown]
        push edi
        mov word [byte eax+0Eh], dx
        call SetDrawBitmap
        add esp, byte 4
        push MsgTextBuf
        lea eax, [dword ebp-0314h]
        push eax
        push dword 6666h
        call TintRect
        mov byte [MsgTextBuf+0FFh], 0FFh
        add esp, byte 0Ch
        movzx eax, byte [byte esi+01h]
        push eax
        movzx eax, byte [esi]
        mov ecx, dword [byte ebp-0Ch]
        push eax
        movzx eax, byte [TextCharH]
        xor ebx, ebx
        lea eax, [eax+eax*2]
        push byte 2
        dec eax
        xor edx, edx
        push eax
        dec ecx
        mov eax, MsgTextBuf
        call DrawBox
        movzx edx, byte [byte esi+01h]
        movzx eax, byte [esi]
        call SetTextColors
        movzx eax, byte [TextCharH]
        lea ebx, [eax+eax*2]
        sar ebx, 1
        sar eax, 1
        mov edx, dword [byte ebp-014h]
        sub ebx, eax
        mov eax, dword [dword ebp-0318h]
        call DrawColorTextCentred
        call SetScreenTarget
        movzx eax, byte [TextCharH]
        lea eax, [eax+eax*2]
        mov edx, dword [byte ebp-04h]
        sar eax, 1
        sub edx, eax
        push edx
        push dword [byte ebp-08h]
        push dword [byte edi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push edi
        call FreeBitmap
        add esp, byte 4
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; ShowProgressBox                                                 1AC0E  96 PC
; (text, total): a message box with a progress bar ("0%")
;-----------------------------------------------------------------------------
ShowProgressBox:
        push esi
        push edi
        enter 308h, 0
        push eax
        push edx
        push ebx
        push ecx
        sub ebp, 386h
        mov ecx, 3
        mov edi, ProgressBoxState
        mov esi, edx
        rep movsb
        cmp dword [ProgressBoxBmp], byte 0
        je short .1
        je short .1
        call SetScreenTarget
        push dword [ProgressBoxBmp]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [ProgressBoxBmp]
        call FreeMemBlock
        mov dword [ProgressBoxBmp], 0
        add esp, byte 4
.1:
        mov eax, dword [dword ebp+0396h]
        mov dword [ProgressBoxStep], eax
        test eax, eax
        jne short .2
        mov dword [ProgressBoxStep], 1
.2:
        lea eax, [byte ebp+07Eh]
        push eax
        push dword 100h
        push byte 0
        call GetPaletteRange
        add esp, byte 0Ch
        push str_X
        call TextStringWidth
        add esp, byte 4
        mov edi, eax
        push dword [byte ebp+07Ah]
        shl edi, 2
        call TextStringWidth
        add esp, byte 4
        add edi, eax
        movzx eax, byte [TextCharH]
        push byte 0
        lea eax, [eax+eax*4]
        push eax
        push edi
        mov dword [ProgressBoxTotal], edi
        call CreateBitmap
        add esp, byte 0Ch
        mov esi, eax
        call SetScreenTarget
        movzx eax, byte [TextCharH]
        lea eax, [eax+eax*4]
        mov edx, dword [byte ebp+06Eh]
        sar eax, 1
        sub edx, eax
        mov eax, edi
        sar eax, 1
        mov dword [dword ebp+0382h], eax
        mov eax, dword [byte ebp+072h]
        push edx
        sub eax, dword [dword ebp+0382h]
        push eax
        push dword [byte esi+02Ch]
        mov dword [dword ebp+037Eh], eax
        call DrawShapeCore
        add esp, byte 0Ch
        mov eax, dword [byte esi+02Ch]
        xor edx, edx
        call CopyBitmap
        mov edx, dword [dword ebp+037Eh]
        mov dword [ProgressBoxBmp], eax
        mov word [byte eax+0Ch], dx
        movzx eax, byte [TextCharH]
        lea eax, [eax+eax*4]
        mov edx, dword [byte ebp+06Eh]
        sar eax, 1
        sub edx, eax
        mov eax, dword [ProgressBoxBmp]
        push esi
        mov word [byte eax+0Eh], dx
        call SetDrawBitmap
        add esp, byte 4
        push MsgTextBuf
        lea eax, [byte ebp+07Eh]
        push eax
        push dword 6666h
        call TintRect
        mov eax, dword [byte ebp+076h]
        mov byte [MsgTextBuf+0FFh], 0FFh
        add esp, byte 0Ch
        movzx eax, byte [byte eax+01h]
        push eax
        mov eax, dword [byte ebp+076h]
        movzx eax, byte [eax]
        push eax
        movzx eax, byte [TextCharH]
        lea ecx, [byte edi-01h]
        lea eax, [eax+eax*4]
        push byte 2
        dec eax
        xor ebx, ebx
        push eax
        xor edx, edx
        mov eax, MsgTextBuf
        call DrawBox
        mov edx, dword [byte ebp+076h]
        mov eax, dword [byte ebp+076h]
        movzx edx, byte [byte edx+01h]
        movzx eax, byte [eax]
        call SetTextColors
        mov edx, dword [dword ebp+0382h]
        mov eax, dword [byte ebp+07Ah]
        movzx ebx, byte [TextCharH]
        call DrawColorTextCentred
        call SetScreenTarget
        mov eax, dword [ProgressBoxBmp]
        movsx edx, word [byte eax+0Eh]
        push edx
        movsx eax, word [byte eax+0Ch]
        push eax
        push dword [byte esi+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push esi
        call FreeBitmap
        mov eax, dword [byte ebp+076h]
        add esp, byte 4
        movzx eax, byte [eax]
        push eax
        movzx eax, byte [TextCharH]
        add eax, byte 4
        push eax
        push str_X
        call TextStringWidth
        mov edx, dword [ProgressBoxTotal]
        add eax, eax
        sub edx, eax
        add esp, byte 4
        lea eax, [byte edx+02h]
        mov esi, dword [ProgressBoxBmp]
        push eax
        movzx eax, byte [TextCharH]
        movsx edx, word [byte esi+0Eh]
        lea eax, [eax+eax*2]
        add eax, edx
        dec eax
        dec eax
        push eax
        push str_X
        movsx esi, word [byte esi+0Ch]
        call TextStringWidth
        add eax, esi
        add esp, byte 4
        dec eax
        push eax
        call FillRect
        add esp, byte 14h
        mov eax, dword [byte ebp+076h]
        push byte 0
        movzx eax, byte [byte eax+01h]
        push eax
        call TextSetColor
        movzx eax, byte [TextCharH]
        mov esi, dword [ProgressBoxBmp]
        mov edx, dword [ProgressBoxTotal]
        lea eax, [eax+eax*2]
        movsx ebx, word [byte esi+0Eh]
        sar edx, 1
        add ebx, eax
        movsx eax, word [byte esi+0Ch]
        add esp, byte 8
        add edx, eax
        mov eax, str_02
        call DrawTextCentred
        lea esp, [dword ebp+0386h]
        pop ebp
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; UpdateProgressBox                                               1AE8C  96 PC
; (done): fills the progress bar to done / total and prints the percentage
;-----------------------------------------------------------------------------
UpdateProgressBox:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        mov edi, eax
        cmp dword [ProgressBoxBmp], byte 0
        je near DrawBoxButton_ret
        push str_X
        call TextStringWidth
        mov edx, dword [ProgressBoxTotal]
        add eax, eax
        sub edx, eax
        mov eax, edx
        imul eax, edi
        cdq
        idiv dword [ProgressBoxStep]
        add esp, byte 4
        mov esi, eax
        test eax, eax
        jge short .1
        xor esi, eax
.1:
        push str_X
        call TextStringWidth
        mov edx, dword [ProgressBoxTotal]
        add eax, eax
        sub edx, eax
        add esp, byte 4
        cmp esi, edx
        jle short .2
        push str_X
        call TextStringWidth
        mov esi, dword [ProgressBoxTotal]
        add eax, eax
        add esp, byte 4
        sub esi, eax
.2:
        movzx eax, byte [ProgressBoxState+2]
        push eax
        movzx eax, byte [TextCharH]
        lea edx, [byte eax+02h]
        push edx
        lea edx, [eax+eax*2]
        mov eax, dword [ProgressBoxBmp]
        movsx ebx, word [byte eax+0Eh]
        add edx, ebx
        push esi
        dec edx
        push edx
        movsx eax, word [byte eax+0Ch]
        push str_X
        mov dword [byte ebp-04h], eax
        call TextStringWidth
        add esp, byte 4
        add eax, dword [byte ebp-04h]
        push eax
        call FillRect
        add esp, byte 14h
        movzx eax, byte [ProgressBoxState]
        push eax
        movzx eax, byte [TextCharH]
        inc eax
        inc eax
        push eax
        push str_X
        call TextStringWidth
        mov edx, dword [ProgressBoxTotal]
        add eax, eax
        sub edx, eax
        lea eax, [byte esi+01h]
        add esp, byte 4
        sub edx, eax
        movzx eax, byte [TextCharH]
        push edx
        lea edx, [eax+eax*2]
        mov eax, dword [ProgressBoxBmp]
        movsx ebx, word [byte eax+0Eh]
        add edx, ebx
        dec edx
        push edx
        movsx eax, word [byte eax+0Ch]
        push str_X
        mov dword [byte ebp-04h], eax
        call TextStringWidth
        add eax, dword [byte ebp-04h]
        add eax, esi
        add esp, byte 4
        inc eax
        push eax
        call FillRect
        add esp, byte 14h
        push byte 0
        movzx eax, byte [ProgressBoxState+1]
        push eax
        call TextSetColor
        imul eax, edi, byte 64h
        cdq
        idiv dword [ProgressBoxStep]
        add esp, byte 8
        push eax
        push str_D14
        lea eax, [byte ebp-0Ch]
        push eax
        call sprintf_
        movzx ebx, byte [TextCharH]
        mov eax, dword [ProgressBoxBmp]
        lea ebx, [ebx+ebx*2]
        movsx edx, word [byte eax+0Eh]
        add ebx, edx
        movsx edx, word [byte eax+0Ch]
        mov eax, dword [ProgressBoxTotal]
        sar eax, 1
        add esp, byte 0Ch
        add edx, eax
        lea eax, [byte ebp-0Ch]
        call DrawTextCentred
        jmp near DrawBoxButton_ret
;-----------------------------------------------------------------------------
; HideProgressBox                                                 1B00B  96 PC
; Takes the progress box down
;-----------------------------------------------------------------------------
HideProgressBox:
        push ebx
        push ecx
        push edx
        cmp dword [ProgressBoxBmp], byte 0
        je short .1
        call SetScreenTarget
        push dword [ProgressBoxBmp]
        call PutBlockAtOwnPos
        add esp, byte 4
        push dword [ProgressBoxBmp]
        call FreeMemBlock
        mov dword [ProgressBoxBmp], 0
        add esp, byte 4
.1:
        pop edx
        pop ecx
        pop ebx
        ret
