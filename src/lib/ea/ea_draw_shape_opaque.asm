; EA library: DrawShapeOpaqueHot, DrawShapeOpaque, ResetMemLock.
bits 32
%include "hockey.inc"
section s_C3A21 progbits alloc exec nowrite align=1
extern DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, DrawDestBuffer, DrawRowBytes, DrawVideoBase, MemLockState
global DrawShapeOpaque, DrawShapeOpaque_34, ResetMemLock
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; DrawShapeOpaqueHot                              C3A24  96 PC, low confidence
; DrawShapeOpaque at a position less the shape's hotspot
;-----------------------------------------------------------------------------
DrawShapeOpaqueHot:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push ds
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        db 066h,02Bh,046h,08h                   ; insn: sub ax,[esi+8]
        db 098h                                 ; insn: cwde
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte esi+0Ah]
        cwde
        mov dword [byte ebp-08h], eax
        jmp short DrawShapeOpaque_34
;-----------------------------------------------------------------------------
; DrawShapeOpaque                                 C3A48  96 PC, low confidence
; Draws a shape opaque at x, y, clipped to the clip rectangle; the draw at
; its own position follows it
;-----------------------------------------------------------------------------
DrawShapeOpaque:
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE4h
        push ds
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        mov dword [byte ebp-08h], eax
        jmp short DrawShapeOpaque_34
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFE8h
        push ds
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        movsx eax, word [byte esi+0Ch]
        mov dword [byte ebp-04h], eax
        movsx eax, word [byte esi+0Eh]
        mov dword [byte ebp-08h], eax
DrawShapeOpaque_34:
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
        pop ds
        leave
        ret
.2:
        mov ebx, dword [DrawClipTop]
        LD add, eax, ecx
        LD sub, eax, ebx
        jle short .1
        xchg ecx, eax
        LD sub, eax, ecx
        mov dword [byte ebp-018h], edx
        movsx edx, word [byte esi+04h]
        mul edx
        mov edx, dword [byte ebp-018h]
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
        mov eax, dword [byte ebp-04h]
        LD mov, ebx, eax
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
        jle short .13
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
        mov edx, dword [DrawRowBytes]
        sub edx, dword [byte ebp-0Ch]
        LD xor, eax, eax
        LD xor, ebx, ebx
.7:
        mov ecx, dword [byte ebp-0Ch]
        shr ecx, 1
        jae short .9
        mov bl, byte [esi]
        inc esi
        cmp bl, 0FFh
        je short .8
        mov byte [edi], bl
.8:
        inc edi
.9:
        jecxz .12
.10:
        mov ax, word [esi]
        cmp al, 0FFh
        jne short .15
.11:
        cmp ah, 0FFh
        jne short .16
        add esi, byte 2
        add edi, byte 2
        dec ecx
        jg short .10
        jmp short .12
.12:
        add esi, dword [byte ebp-010h]
        LD add, edi, edx
        dec dword [byte ebp-014h]
        jg short .7
.13:
        pop edi
        pop esi
        pop ds
        leave
        ret
.14:
        mov ax, word [esi]
        cmp al, 0FFh
        je short .11
.15:
        cmp ah, 0FFh
        je short .17
        mov word [edi], ax
        add esi, byte 2
        add edi, byte 2
        dec ecx
        jg short .14
        jmp short .12
.16:
        mov byte [byte edi+01h], ah
        add esi, byte 2
        add edi, byte 2
        dec ecx
        jg short .14
        jmp short .12
.17:
        mov byte [edi], al
        add esi, byte 2
        add edi, byte 2
        dec ecx
        jg short .10
        jmp short .12
        db 00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; ResetMemLock                                    C3BD0  96 PC, low confidence
; Clears the memory lock and returns its address
;-----------------------------------------------------------------------------
ResetMemLock:
        xor edx, edx
        mov eax, MemLockState
        mov dword [MemLockState], edx
        ret
        db 08Bh,0C0h
