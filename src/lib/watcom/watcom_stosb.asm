; Watcom C runtime: __STOSB, __STOSD.
bits 32
%include "hockey.inc"
section s_BF070 progbits alloc exec nowrite align=1
global __STOSB, __STOSD
;-----------------------------------------------------------------------------
; __STOSB                                                       BF070  library
; Run-time library: fills bytes (memset helper)
;-----------------------------------------------------------------------------
__STOSB:
        or ecx, ecx
        je short .3
        cmp byte [eax], dl
.1:
        test al, 3
        je short .2
        mov byte [eax], dl
        inc eax
        ror edx, 8
        dec ecx
        jne short .1
.2:
        push ecx
        shr ecx, 2
        call __STOSD
        pop ecx
        and ecx, byte 3
        je short .3
        mov byte [eax], dl
        dec ecx
        je short .3
        mov byte [byte eax+01h], dh
        dec ecx
        je short .3
        mov byte [byte eax+02h], dl
.3:
        ret
        db 090h,090h,090h,090h,090h,090h
;-----------------------------------------------------------------------------
; __STOSD                                                       BF0A7  library
; Run-time library: fills dwords (memset helper)
;-----------------------------------------------------------------------------
__STOSD:
        or ecx, ecx
        je short .7
.1:
        test al, 1Fh
        je short .2
        mov dword [eax], edx
        lea eax, [byte eax+04h]
        dec ecx
        jne short .1
.2:
        push ecx
        shr ecx, 2
        je short .6
        dec ecx
        je short .5
.3:
        mov dword [eax], edx
        mov dword [byte eax+04h], edx
        dec ecx
        mov dword [byte eax+08h], edx
        mov dword [byte eax+0Ch], edx
        je short .4
        cmp byte [byte eax+020h], dl
        mov dword [byte eax+010h], edx
        mov dword [byte eax+014h], edx
        dec ecx
        mov dword [byte eax+018h], edx
        mov dword [byte eax+01Ch], edx
        lea eax, [byte eax+020h]
        jne short .3
        lea eax, [byte eax-010h]
.4:
        lea eax, [byte eax+010h]
.5:
        mov dword [eax], edx
        mov dword [byte eax+04h], edx
        mov dword [byte eax+08h], edx
        mov dword [byte eax+0Ch], edx
        lea eax, [byte eax+010h]
.6:
        pop ecx
        and ecx, byte 3
        je short .7
        mov dword [eax], edx
        lea eax, [byte eax+04h]
        dec ecx
        je short .7
        mov dword [eax], edx
        lea eax, [byte eax+04h]
        dec ecx
        je short .7
        mov dword [eax], edx
        lea eax, [byte eax+04h]
.7:
        ret
