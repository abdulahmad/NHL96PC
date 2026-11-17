; EA library: AddExitHandler, ExitProgram, FindShape, FindShapeQuiet.
bits 32
%include "hockey.inc"
section s_E04CE progbits alloc exec nowrite align=1
extern atexit_, exit_, FatalError, str_Locateshape44sSHAPENOTFOUND
global AddExitHandler, ExitProgram, FindShape, FindShapeQuiet, FindShapeQuiet_2
        db 00h,00h
;-----------------------------------------------------------------------------
; AddExitHandler                                  E04D0  96 PC, low confidence
; Registers an exit handler
;-----------------------------------------------------------------------------
AddExitHandler:
        mov eax, dword [byte esp+04h]
        jmp near atexit_
;-----------------------------------------------------------------------------
; ExitProgram                                  E04D9  96 PC, medium confidence
; Exits the program with code 0
;-----------------------------------------------------------------------------
ExitProgram:
        LD xor, eax, eax
        call exit_
;-----------------------------------------------------------------------------
; FindShape                                    E04E0  96 PC, medium confidence
; Finds a shape by id in a shape bank (bank, &id) and stops with "shape not
; found" when it is missing
;-----------------------------------------------------------------------------
FindShape:
        mov ebx, str_Locateshape44sSHAPENOTFOUND
        jmp short FindShapeQuiet_2
;-----------------------------------------------------------------------------
; FindShapeQuiet                               E04E7  96 PC, medium confidence
; Finds a shape by id in a shape bank (bank, &id); returns 0 when it is
; missing
;-----------------------------------------------------------------------------
FindShapeQuiet:
        LD xor, ebx, ebx
FindShapeQuiet_2:
        mov edx, dword [byte esp+04h]
        mov eax, dword [byte esp+08h]
        mov eax, dword [eax]
        mov ecx, dword [byte edx+08h]
        add edx, byte 10h
        LD or, ecx, ecx
        jle short .2
.1:
        add edx, byte 8
        cmp eax, dword [byte edx-08h]
        loopne .1
        jne short .2
        mov eax, dword [byte edx-04h]
        add eax, dword [byte esp+04h]
        ret
.2:
        LD or, ebx, ebx
        je short .3
        push dword [byte esp+08h]
        push ebx
        call FatalError
.3:
        LD xor, eax, eax
        ret
