; DOS/4GW: __int7_pl3, __int7_X32VM, __int7.
bits 32
%include "hockey.inc"
section s_D243E progbits alloc exec nowrite align=1
extern EaDisp32, EaEax, EaEaxDisp32, EaEaxDisp8, EaEbpDisp32, EaEbpDisp8, EaEbx, EaEbxDisp32
extern EaEbxDisp8, EaEcx, EaEcxDisp32, EaEcxDisp8, EaEdi, EaEdiDisp32, EaEdiDisp8, EaEdx
extern EaEdxDisp32, EaEdxDisp8, EaEsi, EaEsiDisp32, EaEsiDisp8, EaEsp, EaEspDisp32, EaEspDisp8
extern EaSib, EmuDispatchD9Reg, EmuDispatchDBReg, EmuDispatchDFReg, EmuFaddM32, EmuFaddM64, EmuFaddp, EmuFaddSt
extern EmuFaddToSt, EmuFbld, EmuFbstp, EmuFcomM32, EmuFcomM64, EmuFcompM32, EmuFcompM64, EmuFcompp
extern EmuFcompSt, EmuFcomSt, EmuFdivM32, EmuFdivM64, EmuFdivp, EmuFdivrM32, EmuFdivrM64, EmuFdivrp
extern EmuFdivrSt, EmuFdivrToSt, EmuFdivSt, EmuFdivToSt, EmuFfree, EmuFiaddM16, EmuFiaddM32, EmuFicomM16
extern EmuFicomM32, EmuFicompM16, EmuFicompM32, EmuFidivM16, EmuFidivM32, EmuFidivrM16, EmuFidivrM32, EmuFildM16
extern EmuFildM32, EmuFildM64, EmuFimulM16, EmuFimulM32, EmuFistM16, EmuFistM32, EmuFistpM16, EmuFistpM32
extern EmuFistpM64, EmuFisubM16, EmuFisubM32, EmuFisubrM16, EmuFisubrM32, EmuFldcw, EmuFldenv, EmuFldM32
extern EmuFldM64, EmuFldM80, EmuFldSt, EmuFmulM32, EmuFmulM64, EmuFmulp, EmuFmulSt, EmuFmulToSt
extern EmuFrstor, EmuFsave, EmuFstcw, EmuFstenv, EmuFstM32, EmuFstM64, EmuFstpM32, EmuFstpM64
extern EmuFstpM80, EmuFstpSt, EmuFstSt, EmuFstswM16, EmuFsubM32, EmuFsubM64, EmuFsubp, EmuFsubrM32
extern EmuFsubrM64, EmuFsubrp, EmuFsubrSt, EmuFsubrToSt, EmuFsubSt, EmuFsubToSt, EmuFtstFxam, EmuFucom
extern EmuFucomp, EmuFucompp, EmuFxch, EmuLogOps, EmuRemOps, EmuReservedOp, EmuSignOps, EmuTrapExit
extern EmuUnsupported
global EmuZeroTbyte, EmuRegRing, EmuRegLastSlot, EmuRegSlots, EmuRegTagMasks, EmuCompareCcBits, EmuFpremCcBits, EmuEaModRmTable
global EmuEaSibTable, EmuOpcodeJumpTable, EmuModRmJumpTable, __int7_pl3, __int7_X32VM, __int7
        db 00h,00h
EmuZeroTbyte:                                   ; used by EmuFtstFxamJumpTable
        db 00h,00h,00h,00h
        db 00h,00h,00h,00h
        db 00h,00h
EmuRegRing:                                     ; used by EmuFaddp, EmuFcomppJumpTable, EmuFdivp ...
        db 0Ah,00h
;-----------------------------------------------------------------------------
; EmuRegLastSlot                                  D244C  96 PC, low confidence
; Offset of the last emulator register slot
;-----------------------------------------------------------------------------
EmuRegLastSlot:                                 ; offset of the last emulator register slot; used by
                                                ; EmuFildM16, EmuFildM32, EmuFildM64 ...
        db 046h,00h
EmuRegSlots:                                    ; used by EmuFaddp, EmuFcomppJumpTable, EmuFdivp ...
        db 00h,00h,00h,00h,00h,00h,014h,00h,00h,00h,00h,08h,01h,00h,00h,00h
        db 01Eh,00h,0Ah,00h,00h,010h,02h,00h,00h,00h,028h,00h,014h,00h,00h,018h
        db 03h,00h,00h,00h,032h,00h,01Eh,00h,00h,020h,04h,00h,00h,00h,03Ch,00h
        db 028h,00h,00h,028h,05h,00h,00h,00h,046h,00h,032h,00h,00h,030h,06h,00h
        db 00h,00h,00h,00h,03Ch,00h,00h,038h,07h,00h,00h,00h
EmuRegTagMasks:                                 ; used by EmuExamine, EmuFaddp, EmuFcomppJumpTable ...
        db 0FCh,0FFh
        db 01h,00h,00h,00h
        db 02h,00h
        db 03h,00h,0F3h,0FFh,04h,00h,00h,00h,08h,00h,0Ch,00h,0CFh,0FFh,010h,00h
        db 00h,00h,020h,00h,030h,00h,03Fh,0FFh,040h,00h,00h,00h,080h,00h,0C0h,00h
        db 0FFh,0FCh,00h,01h,00h,00h,00h,02h,00h,03h,0FFh,0F3h,00h,04h,00h,00h
        db 00h,08h,00h,0Ch,0FFh,0CFh,00h,010h,00h,00h,00h,020h,00h,030h,0FFh,03Fh
        db 00h,040h,00h,00h,00h,080h,00h,0C0h
EmuCompareCcBits:                               ; used by RoundToDouble
        db 01h,040h,00h,045h
EmuFpremCcBits:                                 ; used by EmuFprem1, EmuRemOpsJumpTable
        db 00h,02h,040h,042h,01h,03h,041h,043h,087h,0DBh
EmuEaModRmTable:                                ; used by EmuTrapExit
        dd EaEax
        dd EaEcx
        dd EaEdx
        dd EaEbx
        dd EaSib
        dd EaDisp32
        dd EaEsi
        dd EaEdi
        dd EaEaxDisp8
        dd EaEcxDisp8
        dd EaEdxDisp8
        dd EaEbxDisp8
        dd EaSib
        dd EaEbpDisp8
        dd EaEsiDisp8
        dd EaEdiDisp8
        dd EaEaxDisp32
        dd EaEcxDisp32
        dd EaEdxDisp32
        dd EaEbxDisp32
        dd EaSib
        dd EaEbpDisp32
        dd EaEsiDisp32
        dd EaEdiDisp32
EmuEaSibTable:                                  ; used by EaSib
        dd EaEax
        dd EaEcx
        dd EaEdx
        dd EaEbx
        dd EaEsp
        dd EaDisp32
        dd EaEsi
        dd EaEdi
        dd EaEaxDisp8
        dd EaEcxDisp8
        dd EaEdxDisp8
        dd EaEbxDisp8
        dd EaEspDisp8
        dd EaEbpDisp8
        dd EaEsiDisp8
        dd EaEdiDisp8
        dd EaEaxDisp32
        dd EaEcxDisp32
        dd EaEdxDisp32
        dd EaEbxDisp32
        dd EaEspDisp32
        dd EaEbpDisp32
        dd EaEsiDisp32
        dd EaEdiDisp32
EmuOpcodeJumpTable:                             ; jump table for the switch cases of EmuTrapExit
        dd EmuFaddM32
        dd EmuFldM32
        dd EmuFiaddM32
        dd EmuFildM32
        dd EmuFaddM64
        dd EmuFldM64
        dd EmuFiaddM16
        dd EmuFildM16
        dd EmuFmulM32
        dd EmuUnsupported
        dd EmuFimulM32
        dd EmuUnsupported
        dd EmuFmulM64
        dd EmuUnsupported
        dd EmuFimulM16
        dd EmuUnsupported
        dd EmuFcomM32
        dd EmuFstM32
        dd EmuFicomM32
        dd EmuFistM32
        dd EmuFcomM64
        dd EmuFstM64
        dd EmuFicomM16
        dd EmuFistM16
        dd EmuFcompM32
        dd EmuFstpM32
        dd EmuFicompM32
        dd EmuFistpM32
        dd EmuFcompM64
        dd EmuFstpM64
        dd EmuFicompM16
        dd EmuFistpM16
        dd EmuFsubM32
        dd EmuFldenv
        dd EmuFisubM32
        dd EmuUnsupported
        dd EmuFsubM64
        dd EmuFrstor
        dd EmuFisubM16
        dd EmuFbld
        dd EmuFsubrM32
        dd EmuFldcw
        dd EmuFisubrM32
        dd EmuFldM80
        dd EmuFsubrM64
        dd EmuUnsupported
        dd EmuFisubrM16
        dd EmuFildM64
        dd EmuFdivM32
        dd EmuFstenv
        dd EmuFidivM32
        dd EmuUnsupported
        dd EmuFdivM64
        dd EmuFsave
        dd EmuFidivM16
        dd EmuFbstp
        dd EmuFdivrM32
        dd EmuFstcw
        dd EmuFidivrM32
        dd EmuFstpM80
        dd EmuFdivrM64
        dd EmuFstswM16
        dd EmuFidivrM16
        dd EmuFistpM64
EmuModRmJumpTable:                              ; jump table for the switch cases of EmuTrapExit
        dd EmuFaddSt
        dd EmuFldSt
        dd EmuReservedOp
        dd EmuReservedOp
        dd EmuFaddToSt
        dd EmuFfree
        dd EmuFaddp
        dd EmuFfree
        dd EmuFmulSt
        dd EmuFxch
        dd EmuReservedOp
        dd EmuReservedOp
        dd EmuFmulToSt
        dd EmuFxch
        dd EmuFmulp
        dd EmuFxch
        dd EmuFcomSt
        dd EmuDispatchD9Reg
        dd EmuReservedOp
        dd EmuReservedOp
        dd EmuFcomSt
        dd EmuFstSt
        dd EmuReservedOp
        dd EmuFstSt
        dd EmuFcompSt
        dd EmuFstpSt
        dd EmuReservedOp
        dd EmuReservedOp
        dd EmuFcompSt
        dd EmuFstpSt
        dd EmuFcompp
        dd EmuFstpSt
        dd EmuFsubSt
        dd EmuFtstFxam
        dd EmuReservedOp
        dd EmuDispatchDBReg
        dd EmuFsubrToSt
        dd EmuFucom
        dd EmuFsubrp
        dd EmuDispatchDFReg
        dd EmuFsubrSt
        dd EmuSignOps
        dd EmuFucompp
        dd EmuReservedOp
        dd EmuFsubToSt
        dd EmuFucomp
        dd EmuFsubp
        dd EmuReservedOp
        dd EmuFdivSt
        dd EmuLogOps
        dd EmuReservedOp
        dd EmuReservedOp
        dd EmuFdivrToSt
        dd EmuReservedOp
        dd EmuFdivrp
        dd EmuReservedOp
        dd EmuFdivrSt
        dd EmuRemOps
        dd EmuReservedOp
        dd EmuReservedOp
        dd EmuFdivToSt
        dd EmuReservedOp
        dd EmuFdivp
        dd EmuReservedOp
;-----------------------------------------------------------------------------
; __int7_pl3                                                    D27B8  library
; Coprocessor not available trap (ring 3 extender): passes the frame to the
; 387 emulator
;-----------------------------------------------------------------------------
__int7_pl3:
        sti
        pusha
        LD mov, ebp, esp
        push dword [byte ebp+040h]
        push dword [byte ebp+044h]
        mov cx, word [byte ebp+03Ch]
        mov word [byte ebp-06h], cx
        mov ecx, dword [byte ebp+038h]
        mov dword [byte ebp+0Ch], ecx
        call EmuTrapExit
        pop ds
        pop es
        popa
        iret
        db 087h,0DBh,090h
;-----------------------------------------------------------------------------
; __int7_X32VM                                                  D27DC  library
; Coprocessor not available trap (X32VM extender): builds a frame and runs the
; 387 emulator
;-----------------------------------------------------------------------------
__int7_X32VM:
        sti
        mov eax, dword [byte esp+0Ch]
        push dword [byte ss:eax+014h]
        push dword [byte ss:eax+010h]
        push eax
        push eax
        push eax
        push dword [ss:eax]
        push ecx
        push edx
        push ebx
        push dword [byte ss:eax+01Ch]
        LD mov, eax, ebp
        push eax
        push esi
        push edi
        push es
        push ds
        mov word [byte esp+02h], ss
        call EmuTrapExit
        pop ds
        pop es
        pop edi
        pop esi
        pop eax
        LD mov, ebp, eax
        pop eax
        pop ebx
        pop edx
        pop ecx
        pop eax
        xchg eax, dword [esp]
        pop dword [ss:eax]
        add esp, byte 8
        pop dword [byte ss:eax+010h]
        add esp, byte 4
        mov eax, dword [ss:eax]
        iret
        db 087h,0DBh
;-----------------------------------------------------------------------------
; __int7                                                        D2828  library
; Coprocessor not available trap: builds a frame and runs the 387 emulator
;-----------------------------------------------------------------------------
__int7:
        sti
        sub esp, byte 0Ch
        push eax
        LD mov, eax, esp
        add eax, byte 1Ch
        push ecx
        push edx
        push ebx
        push eax
        push ebp
        push esi
        push edi
        push es
        push ds
        mov word [byte esp+02h], ss
        call EmuTrapExit
        pop ds
        pop es
        popa
        add esp, byte 0Ch
        iret
        db 090h
