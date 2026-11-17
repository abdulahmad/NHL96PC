; EA library: BlitBlockHot, BlitBlock, BlitBlockXor, BlitBlockAnd, AndPixel and 15 more.
bits 32
%include "hockey.inc"
section s_DE4A0 progbits alloc exec nowrite align=1
extern DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, DrawDestBuffer, DrawRowBytes, DrawVideoBase, KeyedDraw
extern RemapTable, ScreenRowTable, TextColourTable, VesaBankShift, VesaSetBank
global BlitBlock, BlitBlock_32, BlitBlockXor, BlitBlockXor_32, BlitBlockAnd, BlitBlockAnd_32, AndPixel, AndPixel_C
global BlitBlockOr, BlitBlockOr_32, OrPixel, OrPixel_C, OrPixel_AA, FillRectCore, FillRectCore_4, FillRectJumpTable
global FillRectExit, XorRectCore, XorRectCore_4, XorRectJumpTable, BlitFontNibbles, BlitArtOpaque, BlitArtOpaque_32, ReverseBytes
global BlitShapeFast, BlitShapeFast_3A, FillRectSpansCore, FillRectSpansJumpTable, FillSpansSet, FillSpansXor, FillSpansAnd, FillSpansOr
global RemapSpans
;-----------------------------------------------------------------------------
; BlitBlockHot                                    DE4A0  96 PC, low confidence
; BlitBlock at a position less the shape's hotspot
;-----------------------------------------------------------------------------
BlitBlockHot:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        sub ax, word [byte esi+08h]
        movsx eax, ax
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte esi+0Ah]
        movsx eax, ax
        mov dword [byte ebp-08h], eax
        jmp short BlitBlock_32
;-----------------------------------------------------------------------------
; BlitBlock                                       DE4C7  96 PC, low confidence
; Copies a block to the draw target at x, y, clipped (opaque)
;-----------------------------------------------------------------------------
BlitBlock:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        jmp short BlitBlock_32
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        movsx eax, word [byte esi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-08h], eax
BlitBlock_32:
        mov ebx, dword [byte ebp-08h]
        movsx ecx, word [byte esi+06h]
        lea edx, [byte esi+010h]
        LD mov, eax, ebx
        cmp eax, dword [DrawClipTop]
        jl short .2
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jg short .3
.1:
        pop edi
        pop esi
        leave
        ret
.2:
        mov ebx, dword [DrawClipTop]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        xchg ecx, eax
        LD sub, eax, ecx
        mov dword [byte ebp-010h], edx
        movsx edx, word [byte esi+04h]
        imul edx
        mov edx, dword [byte ebp-010h]
        LD add, edx, eax
        LD mov, eax, ebx
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jle short .1
.3:
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-014h], ecx
        mov dword [byte ebp-08h], ebx
        movsx ecx, word [byte esi+04h]
        LD xor, edx, edx
        mov ebx, dword [byte ebp-04h]
        LD mov, eax, ebx
        cmp eax, dword [DrawClipLeft]
        jl short .4
        LD add, eax, ecx
        sub eax, dword [DrawClipRight]
        jl short .6
        LD sub, ecx, eax
        jle short .1
        LD mov, edx, eax
        jmp short .6
.4:
        mov ebx, dword [DrawClipLeft]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        LD mov, esi, ecx
        LD sub, esi, eax
        add dword [byte ebp-018h], esi
        mov esi, dword [DrawClipRight]
        LD sub, esi, ebx
        jle short .1
        LD cmp, eax, esi
        jl short .5
        LD mov, eax, esi
.5:
        xchg ecx, edx
        LD sub, edx, eax
        LD add, ecx, eax
.6:
        LD or, ecx, ecx
        jle short .8
        mov dword [byte ebp-0Ch], ecx
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-04h], ebx
        cld
        mov ebx, dword [byte ebp-08h]
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+ebx*4]
        add edi, dword [byte ebp-04h]
        add edi, dword [DrawVideoBase]
        mov esi, dword [byte ebp-018h]
        mov edx, dword [byte ebp-014h]
        mov ebx, dword [DrawRowBytes]
        sub ebx, dword [byte ebp-0Ch]
        mov eax, dword [byte ebp-0Ch]
        shr eax, 1
        jb short .9
.7:
        LD mov, ecx, eax
        shr ecx, 1
        rep movsd
        LD adc, ecx, ecx
        rep movsw
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .7
.8:
        pop edi
        pop esi
        leave
        ret
.9:
        je short .11
.10:
        LD mov, ecx, eax
        shr ecx, 1
        rep movsd
        LD adc, ecx, ecx
        rep movsw
        movsb
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .10
        pop edi
        pop esi
        leave
        ret
.11:
        movsb
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .11
        pop edi
        pop esi
        leave
        ret
        db 00h,00h
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        sub ax, word [byte esi+08h]
        movsx eax, ax
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte esi+0Ah]
        movsx eax, ax
        mov dword [byte ebp-08h], eax
        jmp short BlitBlockXor_32
;-----------------------------------------------------------------------------
; BlitBlockXor                                    DE643  96 PC, low confidence
; XORs a block onto the draw target at x, y, clipped
;-----------------------------------------------------------------------------
BlitBlockXor:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        jmp short BlitBlockXor_32
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        movsx eax, word [byte esi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-08h], eax
BlitBlockXor_32:
        mov ebx, dword [byte ebp-08h]
        movsx ecx, word [byte esi+06h]
        lea edx, [byte esi+010h]
        LD mov, eax, ebx
        cmp eax, dword [DrawClipTop]
        jl short .2
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jg short .3
.1:
        pop edi
        pop esi
        leave
        ret
.2:
        mov ebx, dword [DrawClipTop]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        xchg ecx, eax
        LD sub, eax, ecx
        mov dword [byte ebp-010h], edx
        movsx edx, word [byte esi+04h]
        imul edx
        mov edx, dword [byte ebp-010h]
        LD add, edx, eax
        LD mov, eax, ebx
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jle short .1
.3:
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-014h], ecx
        mov dword [byte ebp-08h], ebx
        movsx ecx, word [byte esi+04h]
        LD xor, edx, edx
        mov ebx, dword [byte ebp-04h]
        LD mov, eax, ebx
        cmp eax, dword [DrawClipLeft]
        jl short .4
        LD add, eax, ecx
        sub eax, dword [DrawClipRight]
        jl short .6
        LD sub, ecx, eax
        jle short .1
        LD mov, edx, eax
        jmp short .6
.4:
        mov ebx, dword [DrawClipLeft]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        LD mov, esi, ecx
        LD sub, esi, eax
        add dword [byte ebp-018h], esi
        mov esi, dword [DrawClipRight]
        LD sub, esi, ebx
        jle short .1
        LD cmp, eax, esi
        jl short .5
        LD mov, eax, esi
.5:
        xchg ecx, edx
        LD sub, edx, eax
        LD add, ecx, eax
.6:
        LD or, ecx, ecx
        jle short .9
        mov dword [byte ebp-0Ch], ecx
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-04h], ebx
        cld
        mov ebx, dword [byte ebp-08h]
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+ebx*4]
        add edi, dword [byte ebp-04h]
        add edi, dword [DrawVideoBase]
        mov esi, dword [byte ebp-018h]
        mov edx, dword [byte ebp-014h]
        mov ebx, dword [DrawRowBytes]
        sub ebx, dword [byte ebp-0Ch]
        mov eax, dword [byte ebp-0Ch]
        shr eax, 1
        jb short .10
        mov dword [byte ebp-01Ch], eax
.7:
        mov ecx, dword [byte ebp-01Ch]
.8:
        mov ax, word [esi]
        add esi, byte 2
        xor word [edi], ax
        add edi, byte 2
        dec ecx
        jne short .8
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .7
.9:
        pop edi
        pop esi
        leave
        ret
.10:
        je short .13
        mov dword [byte ebp-01Ch], eax
        inc ebx
.11:
        mov ecx, dword [byte ebp-01Ch]
.12:
        mov ax, word [esi]
        add esi, byte 2
        xor word [edi], ax
        add edi, byte 2
        dec ecx
        jne short .12
        mov al, byte [esi]
        inc esi
        xor byte [edi], al
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .11
        pop edi
        pop esi
        leave
        ret
.13:
        inc ebx
.14:
        mov al, byte [esi]
        inc esi
        xor byte [edi], al
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .14
        pop edi
        pop esi
        leave
        ret
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        sub ax, word [byte esi+08h]
        movsx eax, ax
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte esi+0Ah]
        movsx eax, ax
        mov dword [byte ebp-08h], eax
        jmp short BlitBlockAnd_32
;-----------------------------------------------------------------------------
; BlitBlockAnd                                    DE7DB  96 PC, low confidence
; ANDs a block onto the draw target at x, y, clipped
;-----------------------------------------------------------------------------
BlitBlockAnd:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        jmp short BlitBlockAnd_32
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        movsx eax, word [byte esi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-08h], eax
BlitBlockAnd_32:
        mov ebx, dword [byte ebp-08h]
        movsx ecx, word [byte esi+06h]
        lea edx, [byte esi+010h]
        LD mov, eax, ebx
        cmp eax, dword [DrawClipTop]
        jl short .2
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jg short .3
.1:
        pop edi
        pop esi
        leave
        ret
.2:
        mov ebx, dword [DrawClipTop]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        xchg ecx, eax
        LD sub, eax, ecx
        mov dword [byte ebp-010h], edx
        movsx edx, word [byte esi+04h]
        imul edx
        mov edx, dword [byte ebp-010h]
        LD add, edx, eax
        LD mov, eax, ebx
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jle short .1
.3:
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-014h], ecx
        mov dword [byte ebp-08h], ebx
        movsx ecx, word [byte esi+04h]
        LD xor, edx, edx
        mov ebx, dword [byte ebp-04h]
        LD mov, eax, ebx
        cmp eax, dword [DrawClipLeft]
        jl short .4
        LD add, eax, ecx
        sub eax, dword [DrawClipRight]
        jl short .6
        LD sub, ecx, eax
        jle short .1
        LD mov, edx, eax
        jmp short .6
.4:
        mov ebx, dword [DrawClipLeft]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        LD mov, esi, ecx
        LD sub, esi, eax
        add dword [byte ebp-018h], esi
        mov esi, dword [DrawClipRight]
        LD sub, esi, ebx
        jle short .1
        LD cmp, eax, esi
        jl short .5
        LD mov, eax, esi
.5:
        xchg ecx, edx
        LD sub, edx, eax
        LD add, ecx, eax
.6:
        LD or, ecx, ecx
        jle short .9
        mov dword [byte ebp-0Ch], ecx
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-04h], ebx
        cld
        mov ebx, dword [byte ebp-08h]
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+ebx*4]
        add edi, dword [byte ebp-04h]
        add edi, dword [DrawVideoBase]
        mov esi, dword [byte ebp-018h]
        mov edx, dword [byte ebp-014h]
        mov ebx, dword [DrawRowBytes]
        sub ebx, dword [byte ebp-0Ch]
        mov eax, dword [byte ebp-0Ch]
        shr eax, 1
        jb short .10
        mov dword [byte ebp-01Ch], eax
.7:
        mov ecx, dword [byte ebp-01Ch]
.8:
        mov ax, word [esi]
        add esi, byte 2
        and word [edi], ax
        add edi, byte 2
        dec ecx
        jne short .8
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .7
.9:
        pop edi
        pop esi
        leave
        ret
.10:
        je short .13
        mov dword [byte ebp-01Ch], eax
        inc ebx
.11:
        mov ecx, dword [byte ebp-01Ch]
.12:
        mov ax, word [esi]
        add esi, byte 2
        and word [edi], ax
        add edi, byte 2
        dec ecx
        jne short .12
        mov al, byte [esi]
        inc esi
        and byte [edi], al
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .11
        pop edi
        pop esi
        leave
        ret
.13:
        inc ebx
.14:
        mov al, byte [esi]
        inc esi
        and byte [edi], al
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .14
        pop edi
        pop esi
        leave
        ret
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        mov ebx, dword [byte esp+0Ch]
        cmp eax, dword [DrawClipLeft]
        jl short .15
        cmp eax, dword [DrawClipRight]
        jge short .15
        cmp edx, dword [DrawClipTop]
        jl short .15
        cmp edx, dword [DrawClipBottom]
        jl short AndPixel_C
.15:
        ret
        db 02Eh,08Bh,0C0h
;-----------------------------------------------------------------------------
; AndPixel                                        DE97C  96 PC, low confidence
; ANDs a pixel of the draw target with a mask, on a linear or banked screen
;-----------------------------------------------------------------------------
AndPixel:
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        mov ebx, dword [byte esp+0Ch]
AndPixel_C:
        cmp dword [KeyedDraw], byte 0
        jne short .2
        mov ecx, dword [DrawDestBuffer]
        add eax, dword [ecx+edx*4]
        add eax, dword [DrawVideoBase]
        and byte [eax], bl
        ret
        db 090h
.1:
        call VesaSetBank
        and byte [edx], bl
        ret
.2:
        add eax, dword [nosplit edx*4+ScreenRowTable]
        movzx edx, ax
        add edx, dword [DrawVideoBase]
        shr eax, 10h
        cmp al, byte [VesaBankShift]
        jne short .1
        and byte [edx], bl
        ret
        db 00h,00h
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        sub ax, word [byte esi+08h]
        movsx eax, ax
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte esi+0Ah]
        movsx eax, ax
        mov dword [byte ebp-08h], eax
        jmp short BlitBlockOr_32
;-----------------------------------------------------------------------------
; BlitBlockOr                                     DE9F3  96 PC, low confidence
; ORs a block onto the draw target at x, y, clipped
;-----------------------------------------------------------------------------
BlitBlockOr:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        jmp short BlitBlockOr_32
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        movsx eax, word [byte esi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-08h], eax
BlitBlockOr_32:
        mov ebx, dword [byte ebp-08h]
        movsx ecx, word [byte esi+06h]
        lea edx, [byte esi+010h]
        LD mov, eax, ebx
        cmp eax, dword [DrawClipTop]
        jl short .2
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jg short .3
.1:
        pop edi
        pop esi
        leave
        ret
.2:
        mov ebx, dword [DrawClipTop]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        xchg ecx, eax
        LD sub, eax, ecx
        mov dword [byte ebp-010h], edx
        movsx edx, word [byte esi+04h]
        imul edx
        mov edx, dword [byte ebp-010h]
        LD add, edx, eax
        LD mov, eax, ebx
        LD add, eax, ecx
        sub eax, dword [DrawClipBottom]
        jle short .3
        LD sub, ecx, eax
        jle short .1
.3:
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-014h], ecx
        mov dword [byte ebp-08h], ebx
        movsx ecx, word [byte esi+04h]
        LD xor, edx, edx
        mov ebx, dword [byte ebp-04h]
        LD mov, eax, ebx
        cmp eax, dword [DrawClipLeft]
        jl short .4
        LD add, eax, ecx
        sub eax, dword [DrawClipRight]
        jl short .6
        LD sub, ecx, eax
        jle short .1
        LD mov, edx, eax
        jmp short .6
.4:
        mov ebx, dword [DrawClipLeft]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        LD mov, esi, ecx
        LD sub, esi, eax
        add dword [byte ebp-018h], esi
        mov esi, dword [DrawClipRight]
        LD sub, esi, ebx
        jle short .1
        LD cmp, eax, esi
        jl short .5
        LD mov, eax, esi
.5:
        xchg ecx, edx
        LD sub, edx, eax
        LD add, ecx, eax
.6:
        LD or, ecx, ecx
        jle short .9
        mov dword [byte ebp-0Ch], ecx
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-04h], ebx
        cld
        mov ebx, dword [byte ebp-08h]
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+ebx*4]
        add edi, dword [byte ebp-04h]
        add edi, dword [DrawVideoBase]
        mov esi, dword [byte ebp-018h]
        mov edx, dword [byte ebp-014h]
        mov ebx, dword [DrawRowBytes]
        sub ebx, dword [byte ebp-0Ch]
        mov eax, dword [byte ebp-0Ch]
        shr eax, 1
        jb short .10
        mov dword [byte ebp-01Ch], eax
.7:
        mov ecx, dword [byte ebp-01Ch]
.8:
        mov ax, word [esi]
        add esi, byte 2
        or word [edi], ax
        add edi, byte 2
        dec ecx
        jne short .8
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .7
.9:
        pop edi
        pop esi
        leave
        ret
.10:
        je short .13
        mov dword [byte ebp-01Ch], eax
        inc ebx
.11:
        mov ecx, dword [byte ebp-01Ch]
.12:
        mov ax, word [esi]
        add esi, byte 2
        or word [edi], ax
        add edi, byte 2
        dec ecx
        jne short .12
        mov al, byte [esi]
        inc esi
        or byte [edi], al
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .11
        pop edi
        pop esi
        leave
        ret
.13:
        inc ebx
.14:
        mov al, byte [esi]
        inc esi
        or byte [edi], al
        add esi, dword [byte ebp-010h]
        LD add, edi, ebx
        dec edx
        jg short .14
        pop edi
        pop esi
        leave
        ret
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        mov ebx, dword [byte esp+0Ch]
        cmp eax, dword [DrawClipLeft]
        jl short .15
        cmp eax, dword [DrawClipRight]
        jge short .15
        cmp edx, dword [DrawClipTop]
        jl short .15
        cmp edx, dword [DrawClipBottom]
        jl short OrPixel_C
.15:
        ret
        db 02Eh,08Bh,0C0h
;-----------------------------------------------------------------------------
; OrPixel                                         DEB94  96 PC, low confidence
; ORs a pixel of the draw target with a mask, on a linear or banked screen
;-----------------------------------------------------------------------------
OrPixel:
        mov eax, dword [byte esp+04h]
        mov edx, dword [byte esp+08h]
        mov ebx, dword [byte esp+0Ch]
OrPixel_C:
        cmp dword [KeyedDraw], byte 0
        jne short .2
        mov ecx, dword [DrawDestBuffer]
        add eax, dword [ecx+edx*4]
        add eax, dword [DrawVideoBase]
        or byte [eax], bl
        ret
        db 090h
.1:
        call VesaSetBank
        or byte [edx], bl
        ret
.2:
        add eax, dword [nosplit edx*4+ScreenRowTable]
        movzx edx, ax
        add edx, dword [DrawVideoBase]
        shr eax, 10h
        cmp al, byte [VesaBankShift]
        jne short .1
        or byte [edx], bl
        ret
        db 00h,00h
        push ebp
        LD mov, ebp, esp
        push edi
        mov edx, dword [DrawClipLeft]
        LD mov, eax, edx
        sub eax, dword [byte ebp+08h]
        jle short .3
        mov dword [byte ebp+08h], edx
        sub dword [byte ebp+010h], eax
        jle short OrPixel_AA
.3:
        mov eax, dword [byte ebp+08h]
        add eax, dword [byte ebp+010h]
        sub eax, dword [DrawClipRight]
        jle short .4
        sub dword [byte ebp+010h], eax
        jle short OrPixel_AA
.4:
        mov eax, dword [DrawClipTop]
        sub eax, dword [byte ebp+0Ch]
        jle short .5
        sub dword [byte ebp+014h], eax
        jle short OrPixel_AA
        mov eax, dword [DrawClipTop]
        mov dword [byte ebp+0Ch], eax
.5:
        mov eax, dword [byte ebp+0Ch]
        add eax, dword [byte ebp+014h]
        mov ebx, dword [DrawClipBottom]
        LD sub, eax, ebx
        jle short FillRectCore_4
        sub dword [byte ebp+014h], eax
        jle short OrPixel_AA
        jmp short FillRectCore_4
OrPixel_AA:
        pop edi
        leave
        ret
;-----------------------------------------------------------------------------
; FillRectCore                                    DEC41  96 PC, low confidence
; Clips a rectangle and fills it with a colour on the draw target
;-----------------------------------------------------------------------------
FillRectCore:
        push ebp
        LD mov, ebp, esp
        push edi
FillRectCore_4:
        cld
        mov ebx, dword [byte ebp+014h]
        mov ecx, dword [byte ebp+010h]
        cmp ecx, byte 0
        jle short OrPixel_AA
        cmp ebx, byte 0
        jle short OrPixel_AA
        mov dl, byte [byte ebp+018h]
        LD mov, dh, dl
        LD mov, eax, edx
        bswap eax
        LD mov, ax, dx
        mov edx, dword [byte ebp+0Ch]
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+edx*4]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp+08h]
        mov edx, dword [DrawRowBytes]
        LD sub, edx, ecx
        shr dword [byte ebp+010h], 2
        and ecx, byte 3
        jmp dword [nosplit ecx*4+FillRectJumpTable]
        db 02Eh,08Bh,0C0h
FillRectJumpTable:                              ; jump table for the switch cases of FillRectCore
        dd .1
        dd .3
        dd .5
        dd .6
        db 090h
.1:
        mov ecx, dword [byte ebp+010h]
.2:
        rep stosd
        dec ebx
        mov ecx, dword [byte ebp+010h]
        lea edi, [edx+edi]
        jg short .2
        pop edi
        leave
        ret
        db 08Bh,0C0h,090h,090h,090h
.3:
        cmp dword [byte ebp+010h], byte 0
        je short .7
.4:
        mov ecx, dword [byte ebp+010h]
        rep stosd
        stosb
        dec ebx
        lea edi, [edx+edi]
        jg short .4
        pop edi
        leave
        ret
        db 090h
.5:
        mov ecx, dword [byte ebp+010h]
        rep stosd
        stosw
        dec ebx
        lea edi, [edx+edi]
        jg short .5
        pop edi
        leave
        ret
        db 02Eh,08Bh,0C0h,090h
.6:
        mov ecx, dword [byte ebp+010h]
        rep stosd
        stosw
        stosb
        dec ebx
        lea edi, [edx+edi]
        jg short .6
        pop edi
        leave
        ret
.7:
        inc edx
        LD mov, ecx, ebx
        shr ecx, 1
        jae short .8
        mov byte [edi], al
        LD add, edi, edx
.8:
        jecxz .10
.9:
        mov byte [edi], al
        mov byte [edx+edi], al
        lea edi, [edi+edx*2]
        dec ecx
        jne short .9
.10:
        pop edi
        leave
        ret
        db 00h,00h,00h
        push ebp
        LD mov, ebp, esp
        push edi
        mov edx, dword [DrawClipLeft]
        LD mov, eax, edx
        sub eax, dword [byte ebp+08h]
        jle short .11
        mov dword [byte ebp+08h], edx
        sub dword [byte ebp+010h], eax
        jle short FillRectExit
.11:
        mov eax, dword [byte ebp+08h]
        add eax, dword [byte ebp+010h]
        sub eax, dword [DrawClipRight]
        jle short .12
        sub dword [byte ebp+010h], eax
        jle short FillRectExit
.12:
        mov eax, dword [DrawClipTop]
        sub eax, dword [byte ebp+0Ch]
        jle short .13
        sub dword [byte ebp+014h], eax
        jle short FillRectExit
        mov eax, dword [DrawClipTop]
        mov dword [byte ebp+0Ch], eax
.13:
        mov eax, dword [byte ebp+0Ch]
        add eax, dword [byte ebp+014h]
        mov ebx, dword [DrawClipBottom]
        LD sub, eax, ebx
        jle short XorRectCore_4
        sub dword [byte ebp+014h], eax
        jle short FillRectExit
        jmp short XorRectCore_4
;-----------------------------------------------------------------------------
; FillRectExit                                    DED6A  96 PC, low confidence
; Rectangle fill exit
;-----------------------------------------------------------------------------
FillRectExit:
        pop edi
        leave
        ret
;-----------------------------------------------------------------------------
; XorRectCore                                     DED6D  96 PC, low confidence
; XORs a rectangle of the draw target with a colour
;-----------------------------------------------------------------------------
XorRectCore:
        push ebp
        LD mov, ebp, esp
        push edi
XorRectCore_4:
        cld
        mov ebx, dword [byte ebp+014h]
        mov ecx, dword [byte ebp+010h]
        cmp ecx, byte 0
        jle short FillRectExit
        cmp ebx, byte 0
        jle short FillRectExit
        mov dl, byte [byte ebp+018h]
        LD mov, dh, dl
        LD mov, eax, edx
        bswap eax
        LD mov, ax, dx
        mov edx, dword [byte ebp+0Ch]
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+edx*4]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp+08h]
        mov edx, dword [DrawRowBytes]
        LD sub, edx, ecx
        shr dword [byte ebp+010h], 2
        and ecx, byte 3
        jmp dword [nosplit ecx*4+XorRectJumpTable]
        db 02Eh,08Bh,0C0h
XorRectJumpTable:                               ; jump table for the switch cases of XorRectCore
        dd .1
        dd .5
        dd .9
        dd .13
        db 090h
.1:
        mov ecx, dword [byte ebp+010h]
.2:
        jecxz .4
.3:
        xor dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .3
.4:
        dec ebx
        mov ecx, dword [byte ebp+010h]
        lea edi, [edx+edi]
        jg short .2
        pop edi
        leave
        ret
        db 08Bh,0C0h,090h,090h,090h
.5:
        cmp dword [byte ebp+010h], byte 0
        je short .17
        inc edx
.6:
        mov ecx, dword [byte ebp+010h]
        jecxz .8
.7:
        xor dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .7
.8:
        xor byte [edi], al
        dec ebx
        lea edi, [edx+edi]
        jg short .6
        pop edi
        leave
        ret
        db 08Bh,0C0h,090h
.9:
        add edx, byte 2
.10:
        mov ecx, dword [byte ebp+010h]
        jecxz .12
.11:
        xor dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .11
.12:
        xor word [edi], ax
        dec ebx
        lea edi, [edx+edi]
        jg short .10
        pop edi
        leave
        ret
        db 02Eh,08Bh,0C0h,090h
.13:
        add edx, byte 3
.14:
        mov ecx, dword [byte ebp+010h]
        jecxz .16
.15:
        xor dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .15
.16:
        xor word [edi], ax
        xor byte [byte edi+02h], al
        dec ebx
        lea edi, [edx+edi]
        jg short .14
        pop edi
        leave
        ret
.17:
        inc edx
        LD mov, ecx, ebx
        shr ecx, 1
        jae short .18
        xor byte [edi], al
        LD add, edi, edx
.18:
        jecxz .20
.19:
        xor byte [edi], al
        xor byte [edx+edi], al
        lea edi, [edi+edx*2]
        dec ecx
        jne short .19
.20:
        pop edi
        leave
        ret
        db 00h
;-----------------------------------------------------------------------------
; BlitFontNibbles                                 DEE68  96 PC, low confidence
; Draws 4-bit font pixels through the text colour table, two pixels a byte
;-----------------------------------------------------------------------------
BlitFontNibbles:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        LD xor, ebx, ebx
        mov ecx, dword [byte ebp+014h]
        mov edx, dword [TextColourTable]
        mov esi, dword [byte ebp+08h]
        mov edi, dword [byte ebp+0Ch]
        cmp dword [byte ebp+010h], byte 0
        jle short .3
.1:
        mov dword [byte ebp+014h], ecx
        mov ecx, dword [byte ebp+010h]
.2:
        mov bh, byte [esi]
        mov bl, byte [edi]
        shr bh, 4
        mov al, byte [edx+ebx]
        mov bh, byte [esi]
        mov bl, byte [byte edi+01h]
        and bh, 0Fh
        mov ah, byte [edx+ebx]
        mov word [edi], ax
        add edi, byte 2
        add esi, byte 1
        dec ecx
        jne short .2
        add esi, dword [byte ebp+018h]
        add edi, dword [byte ebp+01Ch]
        mov ecx, dword [byte ebp+014h]
        dec ecx
        jne short .1
.3:
        pop edi
        pop esi
        leave
        ret
        db 00h
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        sub ax, word [byte esi+08h]
        movsx eax, ax
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte esi+0Ah]
        movsx eax, ax
        mov dword [byte ebp-08h], eax
        jmp short BlitArtOpaque_32
;-----------------------------------------------------------------------------
; BlitArtOpaque                                   DEEE3  96 PC, low confidence
; Copies art opaque to the draw target, clipped
;-----------------------------------------------------------------------------
BlitArtOpaque:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        jmp short BlitArtOpaque_32
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        movsx eax, word [byte esi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-08h], eax
BlitArtOpaque_32:
        mov ebx, dword [byte ebp-08h]
        shl ebx, 2
        add ebx, dword [DrawDestBuffer]
        mov edi, dword [ebx]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp-04h]
        cld
        movsx edx, word [byte esi+06h]
        LD or, edx, edx
        je short .2
        mov ebx, dword [DrawRowBytes]
        movsx eax, word [byte esi+04h]
        LD sub, ebx, eax
        add esi, byte 10h
        shr eax, 1
        jb short .3
.1:
        LD mov, ecx, eax
        rep movsw
        LD add, edi, ebx
        dec edx
        jg short .1
.2:
        pop edi
        pop esi
        leave
        ret
.3:
        je short .5
.4:
        LD mov, ecx, eax
        rep movsw
        movsb
        LD add, edi, ebx
        dec edx
        jg short .4
        pop edi
        pop esi
        leave
        ret
.5:
        movsb
        LD add, edi, ebx
        dec edx
        jg short .5
        pop edi
        pop esi
        leave
        ret
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; ReverseBytes                                 DEF74  96 PC, medium confidence
; Reverses the order of the bytes in a buffer
;-----------------------------------------------------------------------------
ReverseBytes:
        push ebx
        push ecx
        lea ebx, [byte edx+eax-04h]
        LD cmp, ebx, eax
        jl short .2
.1:
        mov ecx, dword [eax]
        mov edx, dword [ebx]
        bswap ecx
        bswap edx
        mov dword [ebx], ecx
        mov dword [eax], edx
        add eax, byte 4
        sub ebx, byte 4
        LD cmp, ebx, eax
        jge short .1
.2:
        add ebx, byte 3
        LD cmp, ebx, eax
        jle short .4
.3:
        mov cl, byte [eax]
        mov dl, byte [ebx]
        mov byte [ebx], cl
        mov byte [eax], dl
        add eax, byte 1
        sub ebx, byte 1
        LD cmp, ebx, eax
        jg short .3
.4:
        pop ecx
        pop ebx
        ret
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFF4h
        push esi
        push edi
        mov edi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        sub ax, word [byte edi+08h]
        movsx eax, ax
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte edi+0Ah]
        movsx eax, ax
        mov dword [byte ebp-08h], eax
        jmp short BlitShapeFast_3A
;-----------------------------------------------------------------------------
; BlitShapeFast                                   DEFD7  96 PC, low confidence
; Stores a shape's position and copies it to the draw target a dword at a
; time
;-----------------------------------------------------------------------------
BlitShapeFast:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFF4h
        push esi
        push edi
        mov edi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov word [byte edi+0Ch], ax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        mov word [byte edi+0Eh], ax
        jmp short BlitShapeFast_3A
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFF4h
        push esi
        push edi
        mov edi, dword [byte ebp+08h]
        movsx eax, word [byte edi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte edi+0Eh]
        mov dword [byte ebp-08h], eax
BlitShapeFast_3A:
        movsx eax, word [byte edi+04h]
        mov dword [byte ebp-0Ch], eax
        movsx edx, word [byte edi+06h]
        mov ebx, dword [byte ebp-08h]
        shl ebx, 2
        add ebx, dword [DrawDestBuffer]
        add edi, byte 10h
        cld
.1:
        mov esi, dword [ebx]
        add esi, dword [DrawVideoBase]
        add esi, dword [byte ebp-04h]
        mov ecx, dword [byte ebp-0Ch]
.2:
        test ecx, 3
        je short .3
        movsb
        dec ecx
        jmp short .2
.3:
        shr ecx, 2
        rep movsd
        add ebx, byte 4
        dec edx
        jg short .1
        pop edi
        pop esi
        leave
        ret
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; FillRectSpansCore                               DF058  96 PC, low confidence
; Fills the spans of a rectangle with a colour
;-----------------------------------------------------------------------------
FillRectSpansCore:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFF0h
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [esi]
        mov edx, dword [byte esi+04h]
        add eax, 80000000h
        adc edx, byte 0
        mov dword [byte ebp-04h], eax
        mov dword [byte ebp-08h], edx
        mov eax, dword [byte esi+08h]
        mov edx, dword [byte esi+0Ch]
        add eax, 80000000h
        adc edx, byte 0
        mov dword [byte ebp-0Ch], eax
        mov dword [byte ebp-010h], edx
        mov ecx, dword [byte esi+018h]
        mov al, byte [byte esi+01Ch]
        mov ebx, dword [byte esi+034h]
        jmp dword [nosplit cs:ebx*4+FillRectSpansJumpTable]
FillRectSpansJumpTable:                         ; jump table for the switch cases of FillRectSpansCore
        dd .2
        dd .2
        dd .4
        dd .10
        dd .9
        dd .13
        dd .11
        dd .19
        dd .15
        dd .1
.1:
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+edx*4]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp-08h]
        mov byte [edi], al
        pop edi
        pop esi
        leave
        ret
.2:
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+edx*4]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp-08h]
        test ecx, 3
        jne short .3
        shr ecx, 2
        LD mov, ah, al
        LD mov, edx, eax
        shl eax, 10h
        LD mov, ax, dx
        rep stosd
        pop edi
        pop esi
        leave
        ret
.3:
        LD mov, ah, al
        shr ecx, 1
        rep stosw
        LD adc, ecx, ecx
        rep stosb
        pop edi
        pop esi
        leave
        ret
.4:
        mov ebx, dword [DrawRowBytes]
.5:
        mov edx, dword [byte esi+0Ch]
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+edx*4]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp-08h]
        shr ecx, 1
        jae short .6
        mov byte [edi], al
        LD add, edi, ebx
.6:
        LD or, ecx, ecx
        je short .8
        lea edx, [nosplit ebx*2+00h]
.7:
        mov byte [edi], al
        mov byte [edi+ebx], al
        LD add, edi, edx
        dec ecx
        jne short .7
.8:
        pop edi
        pop esi
        leave
        ret
.9:
        mov ebx, dword [DrawRowBytes]
        inc ebx
        jmp short .5
.10:
        mov ebx, dword [DrawRowBytes]
        dec ebx
        jmp short .5
.11:
        mov edx, dword [byte esi+0Ch]
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+edx*4]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp-08h]
        mov edx, dword [byte esi+030h]
        mov esi, dword [DrawRowBytes]
        mov ebx, dword [byte ebp-04h]
.12:
        mov byte [edi], al
        LD add, ebx, edx
        LD adc, edi, esi
        dec ecx
        jne short .12
        pop edi
        pop esi
        leave
        ret
.13:
        mov edx, dword [byte esi+0Ch]
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+edx*4]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp-08h]
        mov edx, dword [byte esi+030h]
        mov esi, dword [DrawRowBytes]
        neg esi
        mov ebx, dword [byte ebp-04h]
.14:
        mov byte [edi], al
        LD add, ebx, edx
        LD sbb, edi, esi
        dec ecx
        jne short .14
        pop edi
        pop esi
        leave
        ret
.15:
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+edx*4]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp-08h]
        mov edx, dword [byte esi+030h]
        mov esi, dword [DrawRowBytes]
        mov ebx, dword [byte ebp-0Ch]
.16:
        mov byte [edi], al
        inc edi
        LD add, ebx, edx
        jb short .18
        dec ecx
        jne short .16
.17:
        pop edi
        pop esi
        leave
        ret
.18:
        LD add, edi, esi
        dec ecx
        jne short .16
        jmp short .17
.19:
        mov edi, dword [DrawDestBuffer]
        mov edi, dword [edi+edx*4]
        add edi, dword [DrawVideoBase]
        add edi, dword [byte ebp-08h]
        mov edx, dword [byte esi+030h]
        mov esi, dword [DrawRowBytes]
        mov ebx, dword [byte ebp-0Ch]
.20:
        mov byte [edi], al
        dec edi
        LD add, ebx, edx
        jb short .22
        dec ecx
        jne short .20
.21:
        pop edi
        pop esi
        leave
        ret
.22:
        LD add, edi, esi
        dec ecx
        jne short .20
        jmp short .21
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; FillSpansSet                                    DF22C  96 PC, low confidence
; Fills a list of horizontal spans with a colour
;-----------------------------------------------------------------------------
FillSpansSet:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        cld
        mov esi, dword [byte ebp+010h]
        lea esi, [nosplit esi*4+00h]
        add esi, dword [DrawDestBuffer]
        mov edx, dword [byte ebp+018h]
        LD mov, dh, dl
        shrd eax, edx, 10h
        LD mov, ax, dx
        mov edx, dword [byte ebp+08h]
        mov ebx, dword [byte ebp+0Ch]
        cmp dword [byte ebp+014h], byte 0
        jg short .3
        jmp short .4
.1:
        rep stosd
.2:
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jle short .4
.3:
        mov ecx, dword [ebx]
        mov edi, dword [edx]
        LD sub, ecx, edi
        jl short .2
        add edi, dword [esi]
        add edi, dword [DrawVideoBase]
        inc ecx
        shr ecx, 1
        jb short .5
        shr ecx, 1
        jae short .1
        rep stosd
        stosw
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
.4:
        pop edi
        pop esi
        leave
        ret
        db 090h
.5:
        shr ecx, 1
        jb short .6
        rep stosd
        stosb
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
        jmp short .4
        db 090h
.6:
        rep stosd
        stosw
        stosb
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
        jmp short .4
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; FillSpansXor                                    DF2CC  96 PC, low confidence
; XORs a list of horizontal spans with a colour
;-----------------------------------------------------------------------------
FillSpansXor:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        cld
        mov esi, dword [byte ebp+010h]
        lea esi, [nosplit esi*4+00h]
        add esi, dword [DrawDestBuffer]
        mov edx, dword [byte ebp+018h]
        LD mov, dh, dl
        shrd eax, edx, 10h
        LD mov, ax, dx
        mov edx, dword [byte ebp+08h]
        mov ebx, dword [byte ebp+0Ch]
        cmp dword [byte ebp+014h], byte 0
        jg short .3
        jmp short .6
.1:
        xor dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .1
.2:
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jle short .6
.3:
        mov ecx, dword [ebx]
        mov edi, dword [edx]
        LD sub, ecx, edi
        jl short .2
        add edi, dword [esi]
        add edi, dword [DrawVideoBase]
        inc ecx
        shr ecx, 1
        jb short .7
        shr ecx, 1
        jae short .1
        jecxz .5
.4:
        xor dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .4
.5:
        xor word [edi], ax
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
.6:
        pop edi
        pop esi
        leave
        ret
        db 08Bh,0C0h
.7:
        shr ecx, 1
        jb short .10
        jecxz .9
.8:
        xor dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .8
.9:
        xor byte [edi], al
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
        jmp short .6
.10:
        jecxz .12
.11:
        xor dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .11
.12:
        xor word [edi], ax
        xor byte [byte edi+02h], al
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
        jmp short .6
;-----------------------------------------------------------------------------
; FillSpansAnd                                    DF38C  96 PC, low confidence
; ANDs a list of horizontal spans with a colour
;-----------------------------------------------------------------------------
FillSpansAnd:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        cld
        mov esi, dword [byte ebp+010h]
        lea esi, [nosplit esi*4+00h]
        add esi, dword [DrawDestBuffer]
        mov edx, dword [byte ebp+018h]
        LD mov, dh, dl
        shrd eax, edx, 10h
        LD mov, ax, dx
        mov edx, dword [byte ebp+08h]
        mov ebx, dword [byte ebp+0Ch]
        cmp dword [byte ebp+014h], byte 0
        jg short .3
        jmp short .6
.1:
        and dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .1
.2:
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jle short .6
.3:
        mov ecx, dword [ebx]
        mov edi, dword [edx]
        LD sub, ecx, edi
        jl short .2
        add edi, dword [esi]
        add edi, dword [DrawVideoBase]
        inc ecx
        shr ecx, 1
        jb short .7
        shr ecx, 1
        jae short .1
        jecxz .5
.4:
        and dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .4
.5:
        and word [edi], ax
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
.6:
        pop edi
        pop esi
        leave
        ret
        db 08Bh,0C0h
.7:
        shr ecx, 1
        jb short .10
        jecxz .9
.8:
        and dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .8
.9:
        and byte [edi], al
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
        jmp short .6
.10:
        jecxz .12
.11:
        and dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .11
.12:
        and word [edi], ax
        and byte [byte edi+02h], al
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
        jmp short .6
;-----------------------------------------------------------------------------
; FillSpansOr                                     DF44C  96 PC, low confidence
; ORs a list of horizontal spans with a colour
;-----------------------------------------------------------------------------
FillSpansOr:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        cld
        mov esi, dword [byte ebp+010h]
        lea esi, [nosplit esi*4+00h]
        add esi, dword [DrawDestBuffer]
        mov edx, dword [byte ebp+018h]
        LD mov, dh, dl
        shrd eax, edx, 10h
        LD mov, ax, dx
        mov edx, dword [byte ebp+08h]
        mov ebx, dword [byte ebp+0Ch]
        cmp dword [byte ebp+014h], byte 0
        jg short .3
        jmp short .6
.1:
        or dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .1
.2:
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jle short .6
.3:
        mov ecx, dword [ebx]
        mov edi, dword [edx]
        LD sub, ecx, edi
        jl short .2
        add edi, dword [esi]
        add edi, dword [DrawVideoBase]
        inc ecx
        shr ecx, 1
        jb short .7
        shr ecx, 1
        jae short .1
        jecxz .5
.4:
        or dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .4
.5:
        or word [edi], ax
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
.6:
        pop edi
        pop esi
        leave
        ret
        db 08Bh,0C0h
.7:
        shr ecx, 1
        jb short .10
        jecxz .9
.8:
        or dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .8
.9:
        or byte [edi], al
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
        jmp short .6
.10:
        jecxz .12
.11:
        or dword [edi], eax
        add edi, byte 4
        dec ecx
        jne short .11
.12:
        or word [edi], ax
        or byte [byte edi+02h], al
        lea ebx, [byte ebx+04h]
        lea edx, [byte edx+04h]
        lea esi, [byte esi+04h]
        dec dword [byte ebp+014h]
        jg short .3
        jmp short .6
;-----------------------------------------------------------------------------
; RemapSpans                                      DF50C  96 PC, low confidence
; Passes a list of horizontal spans through the remap table (shadows)
;-----------------------------------------------------------------------------
RemapSpans:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        cld
        mov ebx, dword [byte ebp+010h]
        shl ebx, 2
        add ebx, dword [DrawDestBuffer]
        LD xor, eax, eax
.1:
        mov esi, dword [byte ebp+0Ch]
        mov ecx, dword [esi]
        mov esi, dword [byte ebp+08h]
        mov esi, dword [esi]
        LD sub, ecx, esi
        inc ecx
        jle short .3
        mov edi, dword [ebx]
        LD add, edi, esi
        add edi, dword [DrawVideoBase]
.2:
        mov al, byte [edi]
        mov al, byte [dword eax+RemapTable]
        mov byte [edi], al
        inc edi
        dec ecx
        jne short .2
.3:
        add dword [byte ebp+0Ch], byte 4
        add dword [byte ebp+08h], byte 4
        add ebx, byte 4
        dec dword [byte ebp+014h]
        jg short .1
        pop edi
        pop esi
        leave
        ret
