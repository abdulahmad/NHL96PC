; 3D library: IntSqrt.
bits 32
%include "hockey.inc"
section s_BE95D progbits alloc exec nowrite align=1
global IntSqrt
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; IntSqrt                                         BE960  96 PC, low confidence
; Returns the integer square root of a number
;-----------------------------------------------------------------------------
IntSqrt:
        mov eax, dword [byte esp+04h]
        cmp eax, 10000h
        jae short .6
        cmp eax, 930h
        ja short .4
        LD mov, edx, eax
        shr edx, 1
        je short .3
        mov eax, 0FFFFFFFAh
.1:
        add eax, byte 10h
        LD sub, edx, eax
        js short .2
        add eax, byte 10h
        LD sub, edx, eax
        js short .2
        add eax, byte 10h
        LD sub, edx, eax
        js short .2
        add eax, byte 10h
        LD sub, edx, eax
        jns short .1
.2:
        LD add, edx, eax
        sub eax, byte 6
        shr eax, 2
        LD sub, edx, eax
        js short .3
        inc eax
        LD sub, edx, eax
        js short .3
        inc eax
        LD sub, edx, eax
        js short .3
        inc eax
.3:
        ret
.4:
        LD mov, ecx, eax
        LD mov, bl, ah
        add bl, 30h
        jb short .5
        div bl
        LD add, bl, al
        LD mov, ax, cx
        rcr bl, 1
        div bl
        LD add, al, bl
        rcr al, 1
        LD xor, ah, ah
        ret
.5:
        LD mov, ebx, eax
        shr ebx, 9
        add bx, 80h
        LD xor, edx, edx
        div bx
        LD add, ax, bx
        rcr ax, 1
        ret
.6:
        push edi
        LD mov, edi, eax
        shr edi, 10h
        LD mov, ecx, eax
        LD mov, edx, edi
        LD mov, ebx, edx
        add bh, 8
        div bx
        LD add, ebx, eax
        shr bx, 1
        LD mov, edx, edi
        LD mov, eax, ecx
        div bx
        LD add, ebx, eax
        shr bx, 1
        LD mov, edx, edi
        LD mov, eax, ecx
        div bx
        LD add, ebx, eax
        shr bx, 1
        LD mov, edx, edi
        LD mov, eax, ecx
        div bx
        LD add, eax, ebx
        shr ax, 1
        movzx eax, ax
        pop edi
        ret
