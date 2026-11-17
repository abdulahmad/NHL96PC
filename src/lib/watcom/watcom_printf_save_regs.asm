; Watcom C runtime: PrintfSaveRegs.
bits 32
%include "hockey.inc"
section s_E2436 progbits alloc exec nowrite align=1
extern printf_, PrintfSavedEbx, PrintfSavedEcx, PrintfSavedEdi, PrintfSavedEdx, PrintfSavedEsi, PrintfSavedReturn
global PrintfSaveRegs
;-----------------------------------------------------------------------------
; PrintfSaveRegs                                  E2436  96 PC, low confidence
; Calls printf keeping the registers it would change
;-----------------------------------------------------------------------------
PrintfSaveRegs:
        mov dword [PrintfSavedEbx], ebx
        mov dword [PrintfSavedEcx], ecx
        mov dword [PrintfSavedEdx], edx
        mov dword [PrintfSavedEsi], esi
        mov dword [PrintfSavedEdi], edi
        pop dword [PrintfSavedReturn]
        call printf_
        push dword [PrintfSavedReturn]
        mov ebx, dword [PrintfSavedEbx]
        mov ecx, dword [PrintfSavedEcx]
        mov edx, dword [PrintfSavedEdx]
        mov esi, dword [PrintfSavedEsi]
        mov edi, dword [PrintfSavedEdi]
        ret
