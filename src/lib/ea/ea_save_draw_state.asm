; EA library: SaveDrawState, RestoreDrawState.
bits 32
%include "hockey.inc"
section s_E193C progbits alloc exec nowrite align=1
extern ScreenWidth
global SaveDrawState, RestoreDrawState
;-----------------------------------------------------------------------------
; SaveDrawState                                E193C  96 PC, medium confidence
; Copies the drawing state (screen sizes, clip rectangle, target) into a
; buffer
;-----------------------------------------------------------------------------
SaveDrawState:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        lea esi, [ScreenWidth]
        mov edi, dword [byte ebp+08h]
        mov ecx, 18h
        cld
        rep movsd
        pop edi
        pop esi
        leave
        ret
;-----------------------------------------------------------------------------
; RestoreDrawState                             E1956  96 PC, medium confidence
; Copies a saved drawing state back
;-----------------------------------------------------------------------------
RestoreDrawState:
        push ebp
        LD mov, ebp, esp
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        lea edi, [ScreenWidth]
        mov ecx, 18h
        cld
        rep movsd
        pop edi
        pop esi
        leave
        ret
