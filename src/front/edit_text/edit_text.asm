; Text entry field (96 PC).
bits 32
%include "hockey.inc"
section s_197ED progbits alloc exec nowrite align=1
extern TextCharH, ViewScreenWidth, FillRect, TextStringWidth, PutBlock, SetDrawBitmap, str_Disp
extern str_space4, str_Temp3, str_W, str_X, strcat_, strcpy_, strlen_, CopyBitmap
extern SetTextColors, DrawColorTextCentred, DrawBox, SoundIdle, DrawShapeCore, AllocMemLocked, FreeMemBlock, CreateBitmap
extern TintRect, DrawRectOutline, FreeBitmap, TextSetColor, TextPrintAt, SetScreenTarget, GetPaletteRange, KeyIsDown
extern KbdGetKey, MsgTextBuf, unk_19382
global EditText
;-----------------------------------------------------------------------------
; EditText                                                        197ED  96 PC
; The front end's text-edit routine every text entry goes through
;-----------------------------------------------------------------------------
EditText:
        push esi
        push edi
        enter 394h, 0
        push eax
        push edx
        sub ebp, byte 76h
        mov esi, ebx
        mov dword [byte ebp-06h], ecx
        mov ax, word [unk_19382]
        mov word [byte ebp+066h], ax
.1:
        call KbdGetKey
        test eax, eax
        jne short .2
        push byte 1Ch
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .3
.2:
        call SoundIdle
        jmp short .1
.3:
        mov eax, dword [byte ebp-06h]
        push byte 20h
        inc eax
        inc eax
        push eax
        push str_Temp3
        mov dword [byte ebp+02Ah], eax
        call AllocMemLocked
        add esp, byte 0Ch
        mov edi, eax
        test eax, eax
        je near .54
        push byte 20h
        push dword [byte ebp+02Ah]
        push str_Disp
        call AllocMemLocked
        add esp, byte 0Ch
        mov dword [byte ebp-02h], eax
        test eax, eax
        jne short .4
        push edi
        call FreeMemBlock
        add esp, byte 4
        xor eax, eax
        jmp near .54
.4:
        push str_W
        call TextStringWidth
        mov edx, dword [byte ebp-06h]
        inc edx
        imul eax, edx
        add esp, byte 4
        push dword [dword ebp-0326h]
        mov dword [byte ebp+05Eh], eax
        call TextStringWidth
        add esp, byte 4
        cmp eax, dword [byte ebp+05Eh]
        jle short .6
        mov eax, dword [ViewScreenWidth]
        mov edx, dword [ViewScreenWidth]
        sar eax, 2
        sub edx, eax
        push dword [dword ebp-0326h]
        mov dword [byte ebp+02h], edx
        call TextStringWidth
        add esp, byte 4
        cmp eax, dword [byte ebp+02h]
        jle short .5
        mov eax, dword [ViewScreenWidth]
        mov edx, dword [ViewScreenWidth]
        sar eax, 2
        sub edx, eax
        mov dword [byte ebp+05Eh], edx
        jmp short .6
.5:
        push dword [dword ebp-0326h]
        call TextStringWidth
        add esp, byte 4
        mov dword [byte ebp+05Eh], eax
.6:
        push str_X
        call TextStringWidth
        shl eax, 2
        add dword [byte ebp+05Eh], eax
        mov eax, dword [byte ebp+05Eh]
        mov edx, dword [dword ebp+086h]
        mov dword [byte ebp+042h], eax
        sar eax, 1
        add esp, byte 4
        sub edx, eax
        push str_W
        mov dword [byte ebp+032h], edx
        call TextStringWidth
        mov edx, dword [byte ebp-06h]
        inc edx
        imul eax, edx
        mov edx, dword [dword ebp+086h]
        sar eax, 1
        mov dword [byte ebp+05Eh], 0Ch
        sub edx, eax
        add esp, byte 4
        mov dword [byte ebp+04Ah], edx
        cmp dword [dword ebp-0326h], byte 0
        je near .14
        mov eax, dword [dword ebp-0326h]
        mov dword [byte ebp+056h], eax
        mov dword [byte ebp+04Eh], eax
.7:
        mov eax, dword [byte ebp+04Eh]
        cmp byte [eax], 0
        je near .13
        mov eax, dword [byte ebp+056h]
        cmp byte [eax], 0
        je near .13
.8:
        mov eax, dword [byte ebp+056h]
        movsx eax, byte [eax]
        cmp eax, byte 20h
        je short .9
        mov eax, dword [byte ebp+056h]
        cmp byte [eax], 0
        je short .9
        inc dword [byte ebp+056h]
        jmp short .8
.9:
        mov eax, dword [byte ebp+056h]
        mov al, byte [eax]
        mov byte [byte ebp+06Ah], al
        mov eax, dword [byte ebp+056h]
        push dword [byte ebp+04Eh]
        mov byte [eax], 0
        call TextStringWidth
        add esp, byte 4
        cmp eax, dword [byte ebp+042h]
        jle short .12
        mov edx, dword [byte ebp+056h]
        mov al, byte [byte ebp+06Ah]
        mov byte [edx], al
        lea eax, [byte edx-01h]
        mov dword [byte ebp+04Eh], eax
.10:
        mov eax, dword [byte ebp+04Eh]
        movsx eax, byte [eax]
        cmp eax, byte 20h
        je short .11
        dec dword [byte ebp+04Eh]
        jmp short .10
.11:
        inc dword [byte ebp+04Eh]
        mov eax, dword [byte ebp+04Eh]
        mov dword [byte ebp+056h], eax
        movzx eax, byte [TextCharH]
        add dword [byte ebp+05Eh], eax
        jmp near .7
.12:
        mov edx, dword [byte ebp+056h]
        mov al, byte [byte ebp+06Ah]
        mov byte [edx], al
        test al, al
        je near .7
        inc dword [byte ebp+056h]
        jmp near .7
.13:
        movzx eax, byte [TextCharH]
        add eax, byte 6
        add dword [byte ebp+05Eh], eax
.14:
        mov eax, dword [byte ebp+05Eh]
        mov dword [byte ebp+052h], eax
        movzx eax, byte [TextCharH]
        add eax, byte 6
        add dword [byte ebp+05Eh], eax
        mov eax, dword [byte ebp+05Eh]
        mov edx, dword [dword ebp+08Ah]
        sar eax, 1
        sub edx, eax
        lea eax, [dword ebp-031Eh]
        push eax
        push dword 100h
        push byte 0
        mov dword [byte ebp+03Eh], edx
        add dword [byte ebp+052h], edx
        call GetPaletteRange
        add esp, byte 0Ch
        push byte 0
        push dword [byte ebp+05Eh]
        push dword [byte ebp+042h]
        call CreateBitmap
        add esp, byte 0Ch
        push dword [byte ebp+03Eh]
        push dword [byte ebp+032h]
        mov dword [byte ebp+02h], eax
        push dword [byte eax+02Ch]
        mov dword [byte ebp+022h], eax
        call DrawShapeCore
        mov eax, dword [byte ebp+02h]
        add esp, byte 0Ch
        xor edx, edx
        mov eax, dword [byte eax+02Ch]
        call CopyBitmap
        push dword [byte ebp+02h]
        mov dword [byte ebp+02Eh], eax
        call SetDrawBitmap
        add esp, byte 4
        push MsgTextBuf
        lea eax, [dword ebp-031Eh]
        push eax
        push dword 6666h
        call TintRect
        mov byte [MsgTextBuf+0FFh], 0FFh
        add esp, byte 0Ch
        movzx eax, byte [byte esi+01h]
        push eax
        movzx eax, byte [esi]
        mov ecx, dword [byte ebp+042h]
        push eax
        xor ebx, ebx
        mov eax, dword [byte ebp+05Eh]
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
        cmp dword [dword ebp-0326h], byte 0
        je near .23
        mov eax, dword [dword ebp-0326h]
        inc eax
        mov dword [byte ebp+062h], eax
        mov eax, dword [byte ebp+042h]
        sar eax, 1
        mov dword [byte ebp-0Eh], 6
        mov dword [byte ebp+036h], eax
.15:
        mov eax, dword [dword ebp-0326h]
        cmp byte [eax], 0
        je near .23
.16:
        mov eax, dword [byte ebp+062h]
        movsx eax, byte [eax]
        cmp eax, byte 20h
        je short .17
        mov eax, dword [byte ebp+062h]
        cmp byte [eax], 0
        je short .17
        inc dword [byte ebp+062h]
        jmp short .16
.17:
        mov eax, dword [byte ebp+062h]
        mov al, byte [eax]
        mov byte [byte ebp+06Eh], al
        mov eax, dword [byte ebp+062h]
        push str_X
        mov byte [eax], 0
        call TextStringWidth
        mov edx, dword [byte ebp+042h]
        add eax, eax
        add esp, byte 4
        sub edx, eax
        push dword [dword ebp-0326h]
        mov dword [byte ebp+02h], edx
        call TextStringWidth
        add esp, byte 4
        cmp eax, dword [byte ebp+02h]
        jle short .20
        mov edx, dword [byte ebp+062h]
        mov al, byte [byte ebp+06Eh]
        dec dword [byte ebp+062h]
        mov byte [edx], al
.18:
        mov eax, dword [byte ebp+062h]
        movsx eax, byte [eax]
        cmp eax, byte 20h
        je short .19
        dec dword [byte ebp+062h]
        jmp short .18
.19:
        mov eax, dword [byte ebp+062h]
        mov ebx, dword [byte ebp-0Eh]
        mov edx, dword [byte ebp+036h]
        mov byte [eax], 0
        mov eax, dword [dword ebp-0326h]
        call DrawColorTextCentred
        movzx eax, byte [TextCharH]
        add dword [byte ebp-0Eh], eax
        mov eax, dword [byte ebp+062h]
        inc dword [byte ebp+062h]
        mov byte [eax], 20h
        mov eax, dword [byte ebp+062h]
        mov dword [dword ebp-0326h], eax
        jmp short .21
.20:
        mov edx, dword [byte ebp+062h]
        mov al, byte [byte ebp+06Eh]
        mov byte [edx], al
.21:
        mov eax, dword [byte ebp+062h]
        cmp byte [eax], 0
        jne short .22
        mov ebx, dword [byte ebp-0Eh]
        mov edx, dword [byte ebp+036h]
        mov eax, dword [dword ebp-0326h]
        call DrawColorTextCentred
        mov eax, dword [byte ebp+062h]
        mov dword [dword ebp-0326h], eax
        jmp near .15
.22:
        inc dword [byte ebp+062h]
        jmp near .15
.23:
        push str_W
        mov byte [byte ebp+067h], 0
        call TextStringWidth
        mov edx, dword [dword ebp+08Eh]
        mov dword [byte ebp+02h], eax
        add esp, byte 4
        mov dword [byte ebp+026h], eax
        mov eax, edi
        call strcpy_
        mov eax, edi
        mov edx, str_space4
        call strlen_
        mov dword [byte ebp+05Ah], eax
        mov eax, edi
        call strcat_
        call SetScreenTarget
        push dword [byte ebp+03Eh]
        mov eax, dword [byte ebp+022h]
        push dword [byte ebp+032h]
        push dword [byte eax+02Ch]
        call PutBlock
        add esp, byte 0Ch
        push byte 0
        movzx eax, byte [esi]
        push eax
        call TextSetColor
        add esp, byte 8
        movzx eax, byte [byte esi+01h]
        push eax
        movzx eax, byte [TextCharH]
        inc eax
        inc eax
        push eax
        mov eax, dword [byte ebp-06h]
        mov edx, dword [byte ebp+02h]
        inc eax
        imul edx, eax
        mov eax, dword [byte ebp+052h]
        dec eax
        push edx
        mov dword [byte ebp+06h], eax
        push eax
        mov eax, dword [byte ebp+04Ah]
        dec eax
        dec eax
        push eax
        mov dword [byte ebp+012h], edx
        mov dword [byte ebp+0Ah], eax
        call FillRect
        add esp, byte 14h
        movzx eax, byte [esi]
        push eax
        mov eax, dword [byte ebp+052h]
        movzx edx, byte [TextCharH]
        inc eax
        add eax, edx
        push eax
        mov eax, dword [byte ebp+04Ah]
        mov edx, dword [byte ebp+012h]
        sub eax, byte 3
        add edx, eax
        push edx
        mov edx, dword [byte ebp+052h]
        dec edx
        dec edx
        push edx
        push eax
        call DrawRectOutline
        add esp, byte 14h
        push dword [byte ebp+052h]
        push dword [byte ebp+04Ah]
        push edi
        call TextPrintAt
        mov eax, dword [byte ebp+012h]
        dec eax
        mov dword [byte ebp-0Ah], eax
        mov eax, dword [byte ebp+06h]
        mov dword [byte ebp+016h], eax
        mov eax, dword [byte ebp+0Ah]
        mov dword [byte ebp-01Ah], eax
        mov eax, dword [byte ebp+06h]
        mov dword [byte ebp-016h], eax
        mov eax, dword [byte ebp+0Ah]
        mov dword [byte ebp+01Eh], eax
        mov eax, dword [byte ebp+02h]
        imul eax, dword [byte ebp-06h]
        mov dword [byte ebp+01Ah], eax
        mov eax, dword [byte ebp+06h]
        add esp, byte 0Ch
        mov dword [byte ebp-01Eh], eax
.24:
        xor eax, eax
        cmp byte [edi], 0
        je short .25
        mov eax, edi
        call strlen_
        dec eax
        lea edx, [edi+eax]
        mov dword [byte ebp+0Eh], edx
        mov al, byte [edx]
        push edi
        mov byte [byte ebp+072h], al
        mov byte [edx], 0
        call TextStringWidth
        mov ebx, dword [byte ebp+0Eh]
        mov dl, byte [byte ebp+072h]
        add esp, byte 4
        mov byte [ebx], dl
.25:
        mov edx, dword [byte ebp+04Ah]
        add edx, eax
        movzx eax, byte [byte esi+02h]
        push eax
        movzx eax, byte [TextCharH]
        push eax
        push dword [byte ebp+026h]
        push dword [byte ebp+052h]
        push edx
        mov dword [byte ebp-012h], edx
        call FillRect
        mov eax, dword [byte ebp+05Ah]
        add esp, byte 14h
        add eax, edi
        cmp dword [dword ebp-0322h], byte 0
        jne short .26
        mov al, byte [eax]
        mov byte [byte ebp+066h], al
        jmp short .28
.26:
        movsx eax, byte [eax]
        cmp eax, byte 20h
        je short .27
        mov byte [byte ebp+066h], 2Ah
        jmp short .28
.27:
        mov byte [byte ebp+066h], 20h
.28:
        push byte 0
        movzx eax, byte [byte esi+01h]
        push eax
        call TextSetColor
        add esp, byte 8
        push dword [byte ebp+052h]
        push dword [byte ebp-012h]
        lea eax, [byte ebp+066h]
        push eax
        call TextPrintAt
        add esp, byte 0Ch
        push byte 0
        movzx eax, byte [esi]
        push eax
        call TextSetColor
        add esp, byte 8
.29:
        call KbdGetKey
        mov dword [byte ebp+046h], eax
        mov dword [byte ebp+03Ah], eax
        test eax, eax
        jne short .30
        call SoundIdle
        jmp short .29
.30:
        movzx eax, byte [byte esi+01h]
        push eax
        movzx eax, byte [TextCharH]
        inc eax
        inc eax
        push eax
        push dword [byte ebp+026h]
        push dword [byte ebp-01Eh]
        push dword [byte ebp-012h]
        call FillRect
        add esp, byte 14h
        push byte 0
        movzx eax, byte [esi]
        push eax
        call TextSetColor
        add esp, byte 8
        push dword [byte ebp+052h]
        push dword [byte ebp-012h]
        lea eax, [byte ebp+066h]
        push eax
        call TextPrintAt
        mov al, byte [byte ebp+03Ah]
        add esp, byte 0Ch
        mov byte [byte ebp+066h], al
        cmp dword [byte ebp+046h], byte 1Bh
        jne short .31
        mov dword [byte ebp+05Ah], 0FFFFFFFEh
        jmp near .48
.31:
        cmp dword [byte ebp+046h], byte 0Dh
        jne short .32
        mov dword [byte ebp+05Ah], 0FFFFFFFFh
        jmp near .48
.32:
        cmp dword [byte ebp+046h], byte 8
        jne near .41
        cmp dword [byte ebp+05Ah], byte 0
        jle near .41
        dec dword [byte ebp+05Ah]
        mov ebx, dword [byte ebp+05Ah]
        lea edx, [ebx+edi]
        jmp short .34
.33:
        mov al, byte [byte edx+01h]
        inc ebx
        mov byte [edx], al
        inc edx
.34:
        mov eax, edi
        call strlen_
        dec eax
        cmp ebx, eax
        jb short .33
        mov eax, edi
        call strlen_
        cmp eax, byte 1
        jbe short .35
        mov eax, edi
        call strlen_
        mov byte [byte edi+eax-01h], 0
.35:
        movzx eax, byte [byte esi+01h]
        push eax
        movzx eax, byte [TextCharH]
        inc eax
        inc eax
        push eax
        push dword [byte ebp-0Ah]
        push dword [byte ebp+016h]
        push dword [byte ebp-01Ah]
        call FillRect
        add esp, byte 14h
        push byte 0
        movzx eax, byte [esi]
        push eax
        call TextSetColor
        add esp, byte 8
        cmp dword [dword ebp-0322h], byte 0
        jne short .37
.36:
        push dword [byte ebp+052h]
        push dword [byte ebp+04Ah]
        push edi
        jmp near .47
.37:
        mov eax, dword [byte ebp-02h]
        mov edx, edi
        call strcpy_
        mov eax, dword [byte ebp-02h]
.38:
        cmp byte [eax], 0
        je short .40
        movsx edx, byte [eax]
        cmp edx, byte 20h
        je short .39
        mov byte [eax], 2Ah
.39:
        inc eax
        jmp short .38
.40:
        push dword [byte ebp+052h]
        push dword [byte ebp+04Ah]
        push dword [byte ebp-02h]
        jmp near .47
.41:
        mov eax, edi
        call strlen_
        cmp eax, dword [byte ebp-06h]
        jae near .48
        cmp dword [byte ebp+03Ah], byte 1Fh
        jle near .48
        cmp dword [byte ebp+03Ah], 80h
        jge near .48
        lea eax, [byte ebp+066h]
        push eax
        call TextStringWidth
        mov edx, dword [byte ebp+01Ah]
        add esp, byte 4
        sub edx, eax
        push edi
        mov dword [byte ebp+012h], edx
        call TextStringWidth
        add esp, byte 4
        cmp eax, dword [byte ebp+012h]
        jge near .48
        mov eax, edi
        call strlen_
        lea edx, [byte eax+01h]
        lea eax, [edx+edi]
        jmp short .43
.42:
        mov bl, byte [byte eax-01h]
        dec edx
        mov byte [eax], bl
        dec eax
.43:
        cmp edx, dword [byte ebp+05Ah]
        jg short .42
        mov eax, dword [byte ebp+05Ah]
        mov dl, byte [byte ebp+03Ah]
        mov byte [edi+eax], dl
        movzx eax, byte [byte esi+01h]
        push eax
        movzx eax, byte [TextCharH]
        inc eax
        inc eax
        push eax
        push dword [byte ebp-0Ah]
        push dword [byte ebp-016h]
        push dword [byte ebp+01Eh]
        call FillRect
        add esp, byte 14h
        push byte 0
        movzx eax, byte [esi]
        push eax
        inc dword [byte ebp+05Ah]
        call TextSetColor
        add esp, byte 8
        cmp dword [dword ebp-0322h], byte 0
        je near .36
        mov eax, dword [byte ebp-02h]
        mov edx, edi
        call strcpy_
        mov eax, dword [byte ebp-02h]
.44:
        cmp byte [eax], 0
        je short .46
        movsx edx, byte [eax]
        cmp edx, byte 20h
        je short .45
        mov byte [eax], 2Ah
.45:
        inc eax
        jmp short .44
.46:
        push dword [byte ebp+052h]
        push dword [byte ebp+04Ah]
        push dword [byte ebp-02h]
.47:
        call TextPrintAt
        add esp, byte 0Ch
.48:
        cmp dword [byte ebp+05Ah], byte 0
        jge near .24
        cmp dword [byte ebp+05Ah], byte 0FFFFFFFFh
        jne short .51
.49:
        mov eax, edi
        call strlen_
        movsx eax, byte [byte edi+eax-01h]
        cmp eax, byte 20h
        jne short .50
        mov eax, edi
        call strlen_
        mov byte [byte edi+eax-01h], 0
        jmp short .49
.50:
        mov eax, dword [dword ebp+08Eh]
        mov edx, edi
        call strcpy_
.51:
        call KbdGetKey
        test eax, eax
        jne short .52
        push byte 1Ch
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        jne short .52
        push byte 1
        call KeyIsDown
        add esp, byte 4
        test eax, eax
        je short .53
.52:
        call SoundIdle
        jmp short .51
.53:
        call SetScreenTarget
        push dword [byte ebp+03Eh]
        push dword [byte ebp+032h]
        push dword [byte ebp+02Eh]
        call PutBlock
        add esp, byte 0Ch
        push dword [byte ebp+022h]
        call FreeBitmap
        add esp, byte 4
        push dword [byte ebp+02Eh]
        call FreeMemBlock
        add esp, byte 4
        push dword [byte ebp-02h]
        call FreeMemBlock
        add esp, byte 4
        push edi
        call FreeMemBlock
        add esp, byte 4
        cmp dword [byte ebp+05Ah], byte 0FFFFFFFFh
        sete al
        movzx eax, al
.54:
        lea esp, [byte ebp+076h]
        pop ebp
        pop edi
        pop esi
        ret 0Ch
