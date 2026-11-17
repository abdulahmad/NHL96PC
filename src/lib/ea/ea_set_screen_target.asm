; EA library: SetScreenTarget.
bits 32
%include "hockey.inc"
section s_DD6C4 progbits alloc exec nowrite align=1
extern BackBufferWidth, ScreenWidth
global SetScreenTarget
;-----------------------------------------------------------------------------
; SetScreenTarget                                 DD6C4  96 PC, low confidence
; Same code as in the next game
;-----------------------------------------------------------------------------
SetScreenTarget:
        LD mov, edx, edi
        LD mov, eax, esi
        mov esi, BackBufferWidth
        mov edi, ScreenWidth
        mov ecx, 0Ch
        rep movsd
        LD mov, edi, edx
        LD mov, esi, eax
        ret
