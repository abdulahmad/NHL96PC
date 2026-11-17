; EA library: DrawArtFast, FindShapeListQuiet, FindShapeList.
bits 32
%include "hockey.inc"
section s_BF113 progbits alloc exec nowrite align=1
extern bcopy, BlitShapeFast, DrawVideoBase, FindShape, FindShapeQuiet, KeyedDraw, ScreenRowTable, ScreenWidth
extern VesaSetBank
global DrawArtFast, FindShapeListQuiet, FindShapeList
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; DrawArtFast                                     BF120  96 PC, low confidence
; Stores art's position and copies it to the draw target without row copy
; routines
;-----------------------------------------------------------------------------
DrawArtFast:
        push esi
        push edi
        push ebp
        sub esp, byte 14h
        mov eax, dword [byte esp+024h]
        mov edx, dword [byte esp+028h]
        mov edi, dword [byte esp+02Ch]
        cmp dword [KeyedDraw], byte 0
        jne short .1
        push edi
        push edx
        push eax
        call BlitShapeFast
        add esp, byte 0Ch
        jmp near .6
.1:
        mov word [byte eax+0Ch], dx
        mov word [byte eax+0Eh], di
        lea esi, [byte eax+010h]
        mov ebp, dword [byte eax+04h]
        mov eax, dword [byte eax+02h]
        sar ebp, 10h
        sar eax, 10h
        mov ecx, dword [nosplit edi*4+ScreenRowTable]
        mov dword [byte esp+0Ch], eax
        mov eax, dword [DrawVideoBase]
        mov edi, dword [byte esp+0Ch]
        mov dword [byte esp+04h], eax
        mov eax, dword [ScreenWidth]
        add edx, ecx
        sub eax, edi
        mov edi, edx
        mov dword [byte esp+08h], ebp
        shr edi, 10h
        mov dword [esp], eax
        mov eax, edi
        and edx, 0FFFFh
        call VesaSetBank
        test ebp, ebp
        jle near .6
.2:
        mov eax, dword [byte esp+0Ch]
        add eax, edx
        mov dword [byte esp+010h], eax
        mov eax, dword [byte esp+04h]
        mov bl, byte [byte esp+012h]
        add eax, edx
        test bl, 1
        je short .3
        mov ebp, 10000h
        sub ebp, edx
        push ebp
        push esi
        push eax
        inc edi
        call bcopy
        add esp, byte 0Ch
        add esi, ebp
        mov ebp, dword [byte esp+010h]
        mov eax, edi
        and ebp, 0FFFFh
        call VesaSetBank
        push ebp
        push esi
        mov ecx, dword [byte esp+0Ch]
        push ecx
        call bcopy
        add esi, ebp
        add esp, byte 0Ch
        mov edx, ebp
        jmp short .4
.3:
        mov edx, dword [byte esp+0Ch]
        push edx
        push esi
        push eax
        call bcopy
        add esp, byte 0Ch
        mov ebx, dword [byte esp+0Ch]
        mov edx, dword [byte esp+010h]
        add esi, ebx
.4:
        add edx, dword [esp]
        test edx, 10000h
        je short .5
        inc edi
        mov eax, edi
        and edx, 0FFFFh
        call VesaSetBank
.5:
        mov ebp, dword [byte esp+08h]
        dec ebp
        mov dword [byte esp+08h], ebp
        test ebp, ebp
        jg near .2
.6:
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
        mov edx, dword [byte esp+04h]
        mov eax, dword [byte edx+0Ch]
        sar eax, 10h
        push eax
        mov eax, dword [byte edx+0Ah]
        sar eax, 10h
        push eax
        push edx
        call DrawArtFast
        add esp, byte 0Ch
        ret
        mov edx, dword [byte esp+04h]
        mov eax, dword [byte edx+08h]
        mov ebx, dword [byte esp+0Ch]
        sar eax, 10h
        sub ebx, eax
        push ebx
        mov eax, dword [byte edx+06h]
        mov ebx, dword [byte esp+0Ch]
        sar eax, 10h
        sub ebx, eax
        push ebx
        push edx
        call DrawArtFast
        add esp, byte 0Ch
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; FindShapeListQuiet                              BF290  96 PC, low confidence
; Finds a list of shapes by id, storing 0 for missing ones
;-----------------------------------------------------------------------------
FindShapeListQuiet:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+014h]
        mov ebp, dword [byte esp+010h]
        mov ah, byte [esi]
        mov edi, dword [byte esp+018h]
        test ah, ah
        je short .2
.1:
        push esi
        push ebp
        call FindShapeQuiet
        add esi, byte 4
        mov dword [edi], eax
        add edi, byte 4
        mov dl, byte [esi]
        add esp, byte 8
        test dl, dl
        jne short .1
.2:
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
;-----------------------------------------------------------------------------
; FindShapeList                                   BF2C4  96 PC, low confidence
; Finds a list of shapes by id, stopping on a missing one
;-----------------------------------------------------------------------------
FindShapeList:
        push esi
        push edi
        push ebp
        mov esi, dword [byte esp+014h]
        mov ebp, dword [byte esp+010h]
        mov ah, byte [esi]
        mov edi, dword [byte esp+018h]
        test ah, ah
        je short .2
.1:
        push esi
        push ebp
        call FindShape
        add esi, byte 4
        mov dword [edi], eax
        add edi, byte 4
        mov dl, byte [esi]
        add esp, byte 8
        test dl, dl
        jne short .1
.2:
        pop ebp
        pop edi
        pop esi
        ret
