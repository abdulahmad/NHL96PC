; EA library: SetupRectFillBlend, SetupRectFill, RectFillClipTopCase, RectFillClipBottom and 8 more.
bits 32
%include "hockey.inc"
section s_E19F0 progbits alloc exec nowrite align=1
extern DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, FractionRowCount, FractionRowTable
global SetupRectFillBlend, SetupRectFill, SetupRectFill_C, SetupRectFill_5A, SetupRectFill_164, SetupRectFillJumpTable, RectFillClipTopCase, RectFillClipLeftJumpTable
global RectFillClipBottom, RectFillClipBottomJumpTable, RectFillClipRight, RectFillClipRightJumpTable, RectFillClassify, RectFillStep, RectFillStepJumpTable, RectFillCheckBottom
global RectFillClipFlags, RectFillCheckRight, RectFillPickMode, RectFillHalveCoords
;-----------------------------------------------------------------------------
; SetupRectFillBlend                              E19F0  96 PC, low confidence
; Sets up a rectangle fill with the blend flag set
;-----------------------------------------------------------------------------
SetupRectFillBlend:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFF8h
        push esi
        push edi
        mov byte [byte ebp-05h], 1
        jmp short SetupRectFill_C
;-----------------------------------------------------------------------------
; SetupRectFill                                E19FE  96 PC, medium confidence
; Clips a rectangle and fills in its fill description
;-----------------------------------------------------------------------------
SetupRectFill:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFF8h
        push esi
        push edi
        mov byte [byte ebp-05h], 0
SetupRectFill_C:
        mov esi, dword [byte ebp+018h]
        mov dword [byte esi+034h], 0FFh
        LD xor, eax, eax
        mov dword [esi], eax
        mov dword [byte esi+08h], eax
        mov dword [byte esi+020h], eax
        mov dword [byte esi+024h], eax
        mov dword [byte esi+028h], eax
        mov dword [byte esi+02Ch], eax
        mov eax, dword [byte ebp+0Ch]
        mov ebx, dword [byte ebp+014h]
        mov ecx, dword [byte ebp+08h]
        mov edx, dword [byte ebp+010h]
        LD cmp, eax, ebx
        jg short .1
        mov dword [byte esi+04h], ecx
        mov dword [byte esi+0Ch], eax
        mov dword [byte esi+010h], edx
        mov dword [byte esi+014h], ebx
        jmp short .2
.1:
        mov dword [byte esi+04h], edx
        mov dword [byte esi+0Ch], ebx
        mov dword [byte esi+010h], ecx
        mov dword [byte esi+014h], eax
.2:
        jne short SetupRectFill_5A
        jmp near RectFillPickMode
SetupRectFill_5A:
        LD xor, edx, edx
        cmp byte [byte ebp-05h], 0
        jne short .11
        mov eax, dword [byte esi+0Ch]
        mov ebx, dword [DrawClipTop]
        mov ecx, dword [DrawClipBottom]
        LD cmp, eax, ecx
        jl short .3
        mov dl, 8
        jmp near RectFillClassify
.3:
        LD cmp, eax, ebx
        jge short .4
        or dh, 4
.4:
        mov eax, dword [byte esi+014h]
        LD cmp, eax, ebx
        jge short .5
        mov dl, 4
        jmp near RectFillClassify
.5:
        LD cmp, eax, ecx
        jl short .6
        or dl, 8
.6:
        mov ebx, dword [DrawClipLeft]
        mov ecx, dword [DrawClipRight]
        mov eax, dword [byte esi+04h]
        LD cmp, eax, ebx
        jge short .7
        or dh, 2
.7:
        LD cmp, eax, ecx
        jl short .8
        or dh, 1
.8:
        mov eax, dword [byte esi+010h]
        LD cmp, eax, ebx
        jge short .9
        or dl, 2
.9:
        LD cmp, eax, ecx
        jl short .10
        or dl, 1
.10:
        test dh, dl
        je short .11
        LD and, dl, dh
        jmp near RectFillClassify
.11:
        LD or, dl, dh
        movzx edx, dl
        mov dword [byte ebp-04h], edx
        mov ecx, dword [byte esi+014h]
        sub ecx, dword [byte esi+0Ch]
        jno short .13
.12:
        jmp near RectFillHalveCoords
.13:
        mov edx, dword [byte esi+010h]
        sub edx, dword [byte esi+04h]
        jo short .12
        jne short .14
        inc ecx
        mov dword [byte esi+018h], ecx
        mov byte [byte esi+034h], 2
        jmp short SetupRectFill_164
.14:
        jl short .21
        LD cmp, edx, ecx
        jb short .19
        je short .20
        mov byte [byte esi+034h], 8
.15:
        xchg ecx, edx
.16:
        cmp ecx, dword [FractionRowCount]
        jge short .17
        LD mov, ebx, ecx
        mov ebx, dword [nosplit ebx*4+FractionRowTable]
        mov ax, word [ebx+edx*2]
        shl eax, 10h
        jmp short .18
.17:
        LD xor, eax, eax
        div ecx
        LD mov, ebx, ecx
        shr ebx, 1
        LD sub, ebx, edx
        adc eax, byte 0
.18:
        mov dword [byte esi+030h], eax
        inc ecx
        jo short .12
        mov dword [byte esi+018h], ecx
        jmp short SetupRectFill_164
.19:
        mov byte [byte esi+034h], 6
        jmp short .16
.20:
        mov byte [byte esi+034h], 4
        jmp short .24
.21:
        neg edx
        jo short .12
        LD cmp, edx, ecx
        jb short .22
        je short .23
        mov byte [byte esi+034h], 7
        jmp short .15
.22:
        mov byte [byte esi+034h], 5
        jmp short .16
.23:
        mov byte [byte esi+034h], 3
.24:
        inc ecx
        mov dword [byte esi+018h], ecx
SetupRectFill_164:
        mov ebx, dword [byte ebp-04h]
        je short RectFillClipTopCase
        jmp dword [nosplit cs:ebx*4+SetupRectFillJumpTable]
SetupRectFillJumpTable:                         ; jump table for the switch cases of SetupRectFill
        dd RectFillClipTopCase
        dd RectFillStep
        dd RectFillClipRight
        dd RectFillClipRight
        dd RectFillClipTopCase.1
        dd RectFillClipTopCase.1
        dd RectFillClipTopCase.1
        dd RectFillClipTopCase.1
        dd RectFillClipBottom
        dd RectFillClipBottom
        dd RectFillClipBottom
        dd RectFillClipBottom
        dd RectFillClipTopCase.1
        dd RectFillClipTopCase.1
        dd RectFillClipTopCase.1
        dd RectFillClipTopCase.1
;-----------------------------------------------------------------------------
; RectFillClipTopCase                             E1BAF  96 PC, low confidence
; Rectangle fill: returns zero, or clips the top
;-----------------------------------------------------------------------------
RectFillClipTopCase:
        LD xor, eax, eax
        pop edi
        pop esi
        leave
        ret
.1:
        mov eax, dword [byte esi+0Ch]
        mov ecx, dword [DrawClipTop]
        mov dword [byte esi+0Ch], ecx
        LD sub, ecx, eax
        mov bl, byte [byte esi+034h]
        jmp dword [nosplit cs:ebx*4+RectFillClipLeftJumpTable]
RectFillClipLeftJumpTable:                      ; jump table for the switch cases of RectFillClipTopCase
        db 00h,00h,00h,00h,00h,00h,00h,00h
        dd .1
        dd .2
        dd .3
        dd .4
        dd .5
        dd .6
        dd .8
.1:
        sub dword [byte esi+018h], ecx
        jmp near RectFillCheckBottom
.2:
        sub dword [byte esi+04h], ecx
        sub dword [byte esi+018h], ecx
        jmp near RectFillCheckBottom
.3:
        add dword [byte esi+04h], ecx
        sub dword [byte esi+018h], ecx
        jmp near RectFillCheckBottom
.4:
        mov eax, dword [byte esi+030h]
        mul ecx
        sub dword [esi], eax
        sbb dword [byte esi+04h], edx
        sub dword [byte esi+018h], ecx
        jmp near RectFillCheckBottom
.5:
        mov eax, dword [byte esi+030h]
        mul ecx
        add dword [esi], eax
        adc dword [byte esi+04h], edx
        sub dword [byte esi+018h], ecx
        jmp near RectFillCheckBottom
.6:
        mov dword [byte esi+0Ch], eax
        LD mov, edx, ecx
        LD xor, eax, eax
        mov ecx, dword [byte esi+030h]
        div ecx
        shr ecx, 1
        LD sub, ecx, edx
        adc eax, byte 0
        sub dword [byte esi+04h], eax
        sub dword [byte esi+018h], eax
        jle short .7
        mul dword [byte esi+030h]
        add dword [byte esi+08h], eax
        adc dword [byte esi+0Ch], edx
        jmp near RectFillCheckBottom
.7:
        mov dword [byte esi+018h], 1
        mov eax, dword [DrawClipTop]
        mov dword [byte esi+0Ch], eax
        mov eax, dword [byte esi+010h]
        mov dword [byte esi+04h], eax
        jmp near RectFillCheckBottom
.8:
        mov dword [byte esi+0Ch], eax
        LD mov, edx, ecx
        LD xor, eax, eax
        mov ecx, dword [byte esi+030h]
        div ecx
        shr ecx, 1
        LD sub, ecx, edx
        adc eax, byte 0
        add dword [byte esi+04h], eax
        sub dword [byte esi+018h], eax
        jle short .7
        mul dword [byte esi+030h]
        add dword [byte esi+08h], eax
        adc dword [byte esi+0Ch], edx
        jmp near RectFillCheckBottom
;-----------------------------------------------------------------------------
; RectFillClipBottom                              E1CA0  96 PC, low confidence
; Rectangle fill: clips the bottom
;-----------------------------------------------------------------------------
RectFillClipBottom:
        mov ecx, dword [byte esi+014h]
        mov edx, dword [DrawClipBottom]
        dec edx
        mov dword [byte esi+014h], edx
        LD sub, ecx, edx
        mov bl, byte [byte esi+034h]
        jmp dword [nosplit cs:ebx*4+RectFillClipBottomJumpTable]
RectFillClipBottomJumpTable:                    ; jump table for the switch cases of RectFillClipBottom
        db 00h,00h,00h,00h,00h,00h,00h,00h
        dd .1
        dd .2
        dd .3
        dd .4
        dd .5
        dd .6
        dd .9
.1:
        sub dword [byte esi+018h], ecx
        jmp near RectFillClipFlags
.2:
        add dword [byte esi+010h], ecx
        sub dword [byte esi+018h], ecx
        jmp near RectFillClipFlags
.3:
        sub dword [byte esi+010h], ecx
        sub dword [byte esi+018h], ecx
        jmp near RectFillClipFlags
.4:
        mov edx, dword [byte esi+018h]
        LD sub, edx, ecx
        mov dword [byte esi+018h], edx
        dec edx
        mov eax, dword [byte esi+030h]
        mul edx
        mov ebx, dword [esi]
        mov ecx, dword [byte esi+04h]
        LD sub, ebx, eax
        LD sbb, ecx, edx
        add ebx, 80000000h
        adc ecx, byte 0
        mov dword [byte esi+010h], ecx
        jmp near RectFillClipFlags
.5:
        mov edx, dword [byte esi+018h]
        LD sub, edx, ecx
        mov dword [byte esi+018h], edx
        dec edx
        mov eax, dword [byte esi+030h]
        mul edx
        add eax, dword [esi]
        adc edx, dword [byte esi+04h]
        add eax, 80000000h
        adc edx, byte 0
        mov dword [byte esi+010h], edx
        jmp near RectFillClipFlags
.6:
        LD xor, eax, eax
        sub eax, dword [byte esi+08h]
        sbb edx, dword [byte esi+0Ch]
        jl short .8
        mov ecx, dword [byte esi+030h]
        div ecx
        shr ecx, 1
        LD sub, ecx, edx
        adc eax, byte 0
.7:
        mov edx, dword [byte esi+04h]
        LD sub, edx, eax
        mov dword [byte esi+010h], edx
        inc eax
        mov dword [byte esi+018h], eax
        jmp near RectFillClipFlags
.8:
        LD xor, eax, eax
        jmp short .7
.9:
        LD xor, eax, eax
        sub eax, dword [byte esi+08h]
        sbb edx, dword [byte esi+0Ch]
        jl short .8
        mov ecx, dword [byte esi+030h]
        div ecx
        shr ecx, 1
        LD sub, ecx, edx
        adc eax, byte 0
        mov edx, dword [byte esi+04h]
        LD add, edx, eax
        mov dword [byte esi+010h], edx
        inc eax
        mov dword [byte esi+018h], eax
        jmp near RectFillClipFlags
;-----------------------------------------------------------------------------
; RectFillClipRight                               E1D99  96 PC, low confidence
; Rectangle fill: clips the right
;-----------------------------------------------------------------------------
RectFillClipRight:
        mov bl, byte [byte esi+034h]
        jmp dword [nosplit cs:ebx*4+RectFillClipRightJumpTable]
RectFillClipRightJumpTable:                     ; jump table for the switch cases of RectFillClipRight
        db 00h,00h,00h,00h,00h,00h,00h,00h
        dd .10
        dd .1
        dd .2
        dd .3
        dd .6
        dd .8
        dd .9
.1:
        mov ecx, dword [DrawClipLeft]
        mov eax, dword [byte esi+010h]
        mov dword [byte esi+010h], ecx
        LD sub, ecx, eax
        add dword [byte esi+024h], ecx
        sub dword [byte esi+018h], ecx
        sub dword [byte esi+014h], ecx
        jmp near RectFillCheckRight
.2:
        mov eax, dword [byte esi+04h]
        mov ecx, dword [DrawClipLeft]
        mov dword [byte esi+04h], ecx
        LD sub, ecx, eax
        add dword [byte esi+020h], ecx
        add dword [byte esi+0Ch], ecx
        sub dword [byte esi+018h], ecx
        jmp near RectFillCheckRight
.3:
        mov eax, dword [esi]
        mov edx, dword [byte esi+04h]
        mov ecx, dword [DrawClipLeft]
        mov dword [byte esi+010h], ecx
        LD sub, edx, ecx
        jl short .5
        mov ecx, dword [byte esi+030h]
        div ecx
        shr ecx, 1
        LD sub, ecx, edx
        adc eax, byte 0
        inc eax
.4:
        mov ecx, dword [byte esi+018h]
        mov dword [byte esi+018h], eax
        LD sub, ecx, eax
        add dword [byte esi+024h], ecx
        dec eax
        add eax, dword [byte esi+0Ch]
        mov dword [byte esi+014h], eax
        jmp near RectFillCheckRight
.5:
        mov eax, 1
        jmp short .4
.6:
        mov edx, dword [DrawClipLeft]
        LD xor, eax, eax
        sub eax, dword [esi]
        sbb edx, dword [byte esi+04h]
        jl short .7
        mov ecx, dword [byte esi+030h]
        div ecx
        shr ecx, 1
        LD sub, ecx, edx
        adc eax, byte 0
        add dword [byte esi+0Ch], eax
        add dword [byte esi+020h], eax
        sub dword [byte esi+018h], eax
        jle near .10
        mul dword [byte esi+030h]
        add dword [esi], eax
        adc dword [byte esi+04h], edx
        jmp near RectFillCheckRight
.7:
        jmp short .10
.8:
        mov eax, dword [byte esi+04h]
        mov edx, dword [DrawClipLeft]
        mov dword [byte esi+010h], edx
        LD sub, eax, edx
        LD mov, ecx, eax
        inc ecx
        mov dword [byte esi+018h], ecx
        mul dword [byte esi+030h]
        add eax, dword [byte esi+08h]
        adc edx, dword [byte esi+0Ch]
        add eax, 80000000h
        adc edx, byte 0
        mov eax, dword [byte esi+014h]
        LD sub, eax, edx
        mov dword [byte esi+014h], edx
        add dword [byte esi+024h], eax
        jmp near RectFillCheckRight
.9:
        mov ecx, dword [byte esi+04h]
        mov eax, dword [DrawClipLeft]
        mov dword [byte esi+04h], eax
        LD sub, eax, ecx
        sub dword [byte esi+018h], eax
        mul dword [byte esi+030h]
        mov ebx, dword [byte esi+08h]
        mov ecx, dword [byte esi+0Ch]
        LD add, eax, ebx
        LD adc, edx, ecx
        mov dword [byte esi+08h], eax
        mov dword [byte esi+0Ch], edx
        add ebx, 80000000h
        adc ecx, byte 0
        add eax, 80000000h
        adc edx, byte 0
        LD sub, edx, ecx
        add dword [byte esi+020h], edx
        jmp near RectFillCheckRight
.10:
        mov edx, 2
;-----------------------------------------------------------------------------
; RectFillClassify                                E1EEE  96 PC, low confidence
; Rectangle fill: sets the clip flags
;-----------------------------------------------------------------------------
RectFillClassify:
        mov byte [byte esi+035h], dl
        mov dword [byte esi+018h], 0
        mov al, byte [byte esi+035h]
        test al, 4
        je short .11
        mov ebx, dword [DrawClipTop]
        mov dword [byte esi+0Ch], ebx
        mov dword [byte esi+08h], 0
        dec ebx
        mov dword [byte esi+014h], ebx
        jmp short .16
.11:
        test al, 8
        je short .12
        mov ebx, dword [DrawClipBottom]
        mov dword [byte esi+0Ch], ebx
        mov dword [byte esi+08h], 0
        jmp short .16
.12:
        mov ecx, dword [byte esi+014h]
        cmp ecx, dword [DrawClipBottom]
        jl short .13
        mov ecx, dword [DrawClipBottom]
        dec ecx
.13:
        mov edx, dword [byte esi+0Ch]
        mov ebx, dword [byte esi+08h]
        add ebx, 80000000h
        adc edx, byte 0
        cmp edx, dword [DrawClipTop]
        jge short .14
        mov edx, dword [DrawClipTop]
.14:
        mov dword [byte esi+0Ch], edx
        mov dword [byte esi+08h], 0
        LD sub, ecx, edx
        dec edx
        inc ecx
        mov dword [byte esi+014h], edx
        test al, 2
        je short .15
        add dword [byte esi+024h], ecx
        jmp short .16
.15:
        add dword [byte esi+02Ch], ecx
.16:
        movzx eax, al
        pop edi
        pop esi
        leave
        ret
;-----------------------------------------------------------------------------
; RectFillStep                                    E1F7E  96 PC, low confidence
; Rectangle fill: runs the step for the fill mode
;-----------------------------------------------------------------------------
RectFillStep:
        movzx ebx, byte [byte esi+034h]
        jmp dword [nosplit cs:ebx*4+RectFillStepJumpTable]
RectFillStepJumpTable:                          ; jump table for the switch cases of RectFillStep
        db 00h,00h,00h,00h,00h,00h,00h,00h
        dd .1
        dd .2
        dd .3
        dd .4
        dd .5
        dd .6
        dd .7
.1:
        mov edx, 1
        jmp near RectFillClassify
.2:
        mov ecx, dword [byte esi+04h]
        mov eax, dword [DrawClipRight]
        dec eax
        mov dword [byte esi+04h], eax
        LD sub, ecx, eax
        add dword [byte esi+0Ch], ecx
        sub dword [byte esi+018h], ecx
        add dword [byte esi+028h], ecx
        jmp near RectFillClipTopCase
.3:
        mov ecx, dword [DrawClipRight]
        dec ecx
        mov eax, dword [byte esi+010h]
        mov dword [byte esi+010h], ecx
        LD sub, eax, ecx
        add dword [byte esi+02Ch], eax
        sub dword [byte esi+018h], eax
        sub dword [byte esi+014h], eax
        jmp near RectFillClipTopCase
.4:
        mov eax, dword [esi]
        mov edx, dword [byte esi+04h]
        sub edx, dword [DrawClipRight]
        inc edx
        mov ecx, dword [byte esi+030h]
        div ecx
        shr ecx, 1
        LD sub, ecx, edx
        adc eax, byte 0
        sub dword [byte esi+018h], eax
        jle short .1
        add dword [byte esi+0Ch], eax
        add dword [byte esi+028h], eax
        mul dword [byte esi+030h]
        sub dword [esi], eax
        sbb dword [byte esi+04h], edx
        jmp near RectFillClipTopCase
.5:
        mov edx, dword [DrawClipRight]
        dec edx
        mov dword [byte esi+010h], edx
        LD xor, eax, eax
        sub eax, dword [esi]
        sbb edx, dword [byte esi+04h]
        jl near .1
        mov ecx, dword [byte esi+030h]
        div ecx
        shr ecx, 1
        LD sub, ecx, edx
        adc eax, byte 0
        inc eax
        mov ecx, dword [byte esi+018h]
        mov dword [byte esi+018h], eax
        LD sub, ecx, eax
        add dword [byte esi+02Ch], ecx
        dec eax
        add eax, dword [byte esi+0Ch]
        mov dword [byte esi+014h], eax
        jmp near RectFillClipTopCase
.6:
        mov eax, dword [byte esi+04h]
        mov ecx, dword [DrawClipRight]
        dec ecx
        LD sub, eax, ecx
        mov dword [byte esi+04h], ecx
        sub dword [byte esi+018h], eax
        mul dword [byte esi+030h]
        mov ebx, dword [byte esi+08h]
        mov ecx, dword [byte esi+0Ch]
        LD add, eax, ebx
        LD adc, edx, ecx
        mov dword [byte esi+08h], eax
        mov dword [byte esi+0Ch], edx
        add ebx, 80000000h
        adc ecx, byte 0
        add eax, 80000000h
        adc edx, byte 0
        LD sub, edx, ecx
        add dword [byte esi+028h], edx
        jmp near RectFillClipTopCase
.7:
        mov eax, dword [DrawClipRight]
        LD mov, ecx, eax
        dec ecx
        mov dword [byte esi+010h], ecx
        sub eax, dword [byte esi+04h]
        mov dword [byte esi+018h], eax
        dec eax
        mul dword [byte esi+030h]
        add eax, dword [byte esi+08h]
        adc edx, dword [byte esi+0Ch]
        add eax, 80000000h
        adc edx, byte 0
        mov eax, dword [byte esi+014h]
        LD sub, eax, edx
        mov dword [byte esi+014h], edx
        add dword [byte esi+02Ch], eax
        jmp near RectFillClipTopCase
;-----------------------------------------------------------------------------
; RectFillCheckBottom                             E20CF  96 PC, low confidence
; Rectangle fill: checks the bottom clip flag
;-----------------------------------------------------------------------------
RectFillCheckBottom:
        test dword [byte ebp-04h], 8
        je short RectFillClipFlags
        jmp near RectFillClipBottom
;-----------------------------------------------------------------------------
; RectFillClipFlags                               E20DD  96 PC, low confidence
; Rectangle fill: works out the clip flags
;-----------------------------------------------------------------------------
RectFillClipFlags:
        LD xor, edx, edx
        mov eax, dword [byte esi+04h]
        cmp eax, dword [DrawClipLeft]
        jge short .8
        or dh, 2
.8:
        mov ebx, dword [esi]
        add ebx, 80000000h
        adc eax, byte 0
        cmp eax, dword [DrawClipRight]
        jl short .9
        or dh, 1
.9:
        mov eax, dword [byte esi+010h]
        cmp eax, dword [DrawClipLeft]
        jge short .10
        or dl, 2
.10:
        cmp eax, dword [DrawClipRight]
        jl short .11
        or dl, 1
.11:
        test dh, dl
        je short .12
        LD and, dl, dh
        jmp near RectFillClassify
.12:
        LD or, dl, dh
        je short RectFillCheckRight.13
        movzx edx, dl
        mov dword [byte ebp-04h], edx
        jmp near SetupRectFill_164
;-----------------------------------------------------------------------------
; RectFillCheckRight                              E2136  96 PC, low confidence
; Rectangle fill: checks the right clip flag
;-----------------------------------------------------------------------------
RectFillCheckRight:
        test dword [byte ebp-04h], 1
        je short .13
        jmp near RectFillStep
.13:
        jmp near RectFillClipTopCase
;-----------------------------------------------------------------------------
; RectFillPickMode                                E2149  96 PC, low confidence
; Rectangle fill: picks the fill mode
;-----------------------------------------------------------------------------
RectFillPickMode:
        mov byte [byte esi+034h], 1
        LD cmp, ecx, edx
        jne short .14
        mov byte [byte esi+034h], 9
.14:
        jle short .15
        mov byte [byte esi+034h], 0
        mov dword [byte esi+04h], edx
        mov dword [byte esi+010h], ecx
        xchg ecx, edx
.15:
        cmp byte [byte ebp-05h], 0
        jne short .17
        mov ebx, dword [DrawClipTop]
        LD cmp, eax, ebx
        jge short .18
        mov al, 4
        mov dword [byte esi+0Ch], ebx
        mov dword [byte esi+014h], ebx
.16:
        mov byte [byte esi+035h], al
        mov dword [byte esi+018h], 0
        movzx eax, al
        pop edi
        pop esi
        leave
        ret
.17:
        LD sub, edx, ecx
        inc edx
        mov dword [byte esi+018h], edx
        jmp near RectFillClipTopCase
.18:
        mov ebx, dword [DrawClipBottom]
        LD cmp, eax, ebx
        jl short .19
        mov al, 8
        mov dword [byte esi+0Ch], ebx
        mov dword [byte esi+014h], ebx
        jmp short .16
.19:
        LD mov, eax, edx
        LD sub, eax, ecx
        inc eax
        mov dword [byte esi+018h], eax
        cmp edx, dword [DrawClipLeft]
        jge short .20
        dec dword [byte esi+014h]
        mov dword [byte esi+024h], 1
        mov al, 2
        jmp short .16
.20:
        cmp ecx, dword [DrawClipRight]
        jl short .21
        dec dword [byte esi+014h]
        mov dword [byte esi+02Ch], 1
        mov al, 1
        jmp short .16
.21:
        mov eax, dword [DrawClipLeft]
        LD mov, ebx, eax
        LD sub, eax, ecx
        jle short .22
        mov dword [byte esi+04h], ebx
        sub dword [byte esi+018h], eax
.22:
        LD mov, eax, edx
        mov ebx, dword [DrawClipRight]
        dec ebx
        LD sub, eax, ebx
        jle short .23
        sub dword [byte esi+018h], eax
        mov dword [byte esi+010h], ebx
.23:
        jmp near RectFillClipTopCase
;-----------------------------------------------------------------------------
; RectFillHalveCoords                             E2208  96 PC, low confidence
; Rectangle fill: halves the coordinates
;-----------------------------------------------------------------------------
RectFillHalveCoords:
        mov ecx, dword [byte esi+014h]
        sar ecx, 1
        mov eax, dword [byte esi+0Ch]
        sar eax, 1
        LD sub, ecx, eax
        sar ecx, 1
        mov edx, dword [byte esi+010h]
        sar edx, 1
        mov eax, dword [byte esi+04h]
        sar eax, 1
        LD sub, edx, eax
        sar edx, 1
.24:
        cmp dword [byte esi+0Ch], 0FFFFC180h
        jg short .30
.25:
        mov eax, dword [byte esi+0Ch]
        LD add, eax, ecx
        mov dword [byte esi+0Ch], eax
        LD mov, ebx, eax
        sub eax, dword [DrawClipTop]
        jle short .29
        LD cmp, eax, ecx
        jle short .26
        LD mov, eax, ecx
.26:
        sub ebx, dword [DrawClipBottom]
        jle short .27
        LD sub, eax, ebx
        jle short .29
.27:
        mov ebx, dword [byte esi+04h]
        cmp ebx, dword [DrawClipLeft]
        jge short .28
        add dword [byte esi+020h], eax
        jmp short .29
.28:
        add dword [byte esi+028h], eax
.29:
        add dword [byte esi+04h], edx
        jmp short .24
.30:
        cmp dword [byte esi+014h], 3E80h
        jge short .31
        cmp dword [byte esi+04h], 0FFFFC180h
        jle short .25
        cmp dword [byte esi+04h], 3E80h
        jge short .25
        cmp dword [byte esi+010h], 0FFFFC180h
        jle short .31
        cmp dword [byte esi+010h], 3E80h
        jge short .31
        jmp near SetupRectFill_5A
.31:
        mov eax, dword [byte esi+014h]
        LD sub, eax, ecx
        mov dword [byte esi+014h], eax
        LD mov, ebx, eax
        sub eax, dword [DrawClipBottom]
        inc eax
        jge short .35
        neg eax
        LD cmp, eax, ecx
        jle short .32
        LD mov, eax, ecx
.32:
        sub ebx, dword [DrawClipTop]
        inc ebx
        jge short .33
        LD add, eax, ebx
        jle short .35
.33:
        mov ebx, dword [byte esi+010h]
        cmp ebx, dword [DrawClipLeft]
        jge short .34
        add dword [byte esi+024h], eax
        jmp short .35
.34:
        add dword [byte esi+02Ch], eax
.35:
        sub dword [byte esi+010h], edx
        jmp short .30
