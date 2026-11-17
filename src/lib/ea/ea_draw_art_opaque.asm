; EA library: DrawArtOpaque, DrawArtOpaqueAtOwnPos, DrawArtOpaqueHotspot.
bits 32
%include "hockey.inc"
section s_B2B30 progbits alloc exec nowrite align=1
extern BlitArtOpaque, DrawVideoBase, KeyedDraw, RowCopyFunc, ScreenRowTable, ScreenWidth, VesaSetBank
global DrawArtOpaque, DrawArtOpaqueAtOwnPos, DrawArtOpaqueHotspot
;-----------------------------------------------------------------------------
; DrawArtOpaque                                B2B30  95 PC, medium confidence
; Draws art without transparency, through the keyed drawer when keyed drawing
; is on
;-----------------------------------------------------------------------------
DrawArtOpaque:
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
        call BlitArtOpaque
        add esp, byte 0Ch
        jmp near .6
.1:
        lea esi, [byte eax+010h]
        mov ebp, dword [byte eax+04h]
        mov ecx, dword [nosplit edi*4+ScreenRowTable]
        mov eax, dword [byte eax+02h]
        sar ebp, 10h
        sar eax, 10h
        add edx, ecx
        mov dword [byte esp+0Ch], eax
        mov eax, dword [DrawVideoBase]
        mov edi, dword [byte esp+0Ch]
        mov dword [byte esp+04h], eax
        mov eax, dword [ScreenWidth]
        mov dword [byte esp+08h], ebp
        sub eax, edi
        mov edi, edx
        mov ebp, dword [byte esp+0Ch]
        shr edi, 10h
        mov dword [esp], eax
        mov eax, edi
        and edx, 0FFFFh
        call VesaSetBank
        test ebp, ebp
        jle near .6
.2:
        cmp dword [byte esp+08h], byte 0
        jle near .6
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
        push eax
        push esi
        inc edi
        call dword [RowCopyFunc]
        add esp, byte 0Ch
        add esi, ebp
        mov ebp, dword [byte esp+010h]
        mov eax, edi
        and ebp, 0FFFFh
        call VesaSetBank
        push ebp
        mov ecx, dword [byte esp+08h]
        push ecx
        push esi
        call dword [RowCopyFunc]
        add esp, byte 0Ch
        mov edx, ebp
        add esi, ebp
        jmp short .4
.3:
        mov edx, dword [byte esp+0Ch]
        push edx
        push eax
        push esi
        call dword [RowCopyFunc]
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
        dec dword [byte esp+08h]
        jmp near .2
.6:
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; DrawArtOpaqueAtOwnPos                           B2C54  96 PC, low confidence
; Draws art opaque at the position stored in its header
;-----------------------------------------------------------------------------
DrawArtOpaqueAtOwnPos:
        mov edx, dword [byte esp+04h]
        mov eax, dword [byte edx+0Ch]
        sar eax, 10h
        push eax
        mov eax, dword [byte edx+0Ah]
        sar eax, 10h
        push eax
        push edx
        call DrawArtOpaque
        add esp, byte 0Ch
        ret
;-----------------------------------------------------------------------------
; DrawArtOpaqueHotspot                            B2C70  96 PC, low confidence
; Draws art opaque with its hotspot at x, y
;-----------------------------------------------------------------------------
DrawArtOpaqueHotspot:
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
        call DrawArtOpaque
        add esp, byte 0Ch
        ret
