; Watcom C runtime: GetRandState, rand_, srand_.
bits 32
%include "hockey.inc"
section s_B03F2 progbits alloc exec nowrite align=1
extern RandSeed
global GetRandState, rand_, srand_
;-----------------------------------------------------------------------------
; GetRandState                                                    B03F2  96 PC
; Returns the C library's rand state address
;-----------------------------------------------------------------------------
GetRandState:
        mov eax, RandSeed
        ret
;-----------------------------------------------------------------------------
; rand_                                                         B03F8  library
; Run-time library rand: the next random number
;-----------------------------------------------------------------------------
rand_:
        push edx
        call GetRandState
        test eax, eax
        je short .1
        imul edx, dword [eax], dword 41C64E6Dh
        add edx, 3039h
        mov dword [eax], edx
        mov eax, edx
        shr eax, 10h
        and eax, 7FFFh
.1:
        pop edx
        ret
;-----------------------------------------------------------------------------
; srand_                                                        B041C  library
; Run-time library srand: seeds the random numbers
;-----------------------------------------------------------------------------
srand_:
        push edx
        mov edx, eax
        call GetRandState
        test eax, eax
        je short .1
        mov dword [eax], edx
.1:
        pop edx
        ret
