; Sound: SbIsrAutoInit, SbProIsr, Sb16Isr.
bits 32
%include "hockey.inc"
section s_D79CC progbits alloc exec nowrite align=1
extern SbIsrAckPort, SbIsrPicPort
global SbIsrAutoInit, SbProIsrPicPort, SbProIsrAckPort, SbProIsr, Sb16IsrPicPort, Sb16IsrAckPort, Sb16Isr
;-----------------------------------------------------------------------------
; SbIsrAutoInit                                D79CC  96 PC, medium confidence
; Sound Blaster interrupt handler for auto-init DMA
;-----------------------------------------------------------------------------
SbIsrAutoInit:
        push eax
        push edx
        db 066h,02Eh,0A1h                       ; insn: mov ax,[cs:SbIsrPicPort]
        dd SbIsrPicPort
        out 20h, al
        db 066h,02Eh,08Bh,015h                  ; insn: mov dx,[cs:SbIsrAckPort]
        dd SbIsrAckPort
        in al, dx
        pop edx
        pop eax
        iret
SbProIsrPicPort:                                ; used by SbProIsr, SbProOpen
        db 00h,00h
SbProIsrAckPort:                                ; used by SbProIsr, SbProOpen
        db 00h,00h
;-----------------------------------------------------------------------------
; SbProIsr                                     D79E7  96 PC, medium confidence
; Sound Blaster Pro interrupt handler
;-----------------------------------------------------------------------------
SbProIsr:
        push eax
        push edx
        mov al, 20h
        db 066h,02Eh,08Bh,015h                  ; insn: mov dx,[cs:SbProIsrPicPort]
        dd SbProIsrPicPort
        out dx, al
        db 066h,02Eh,08Bh,015h                  ; insn: mov dx,[cs:SbProIsrAckPort]
        dd SbProIsrAckPort
        in al, dx
        pop edx
        pop eax
        iret
Sb16IsrPicPort:                                 ; used by Sb16Isr, Sb16Open
        db 00h,00h
Sb16IsrAckPort:                                 ; used by Sb16Isr, Sb16Open
        db 00h,00h
;-----------------------------------------------------------------------------
; Sb16Isr                                      D7A04  96 PC, medium confidence
; Sound Blaster 16 interrupt handler
;-----------------------------------------------------------------------------
Sb16Isr:
        push eax
        push edx
        db 066h,02Eh,08Bh,015h                  ; insn: mov dx,[cs:Sb16IsrAckPort]
        dd Sb16IsrAckPort
        in al, dx
        mov al, 20h
        db 066h,02Eh,08Bh,015h                  ; insn: mov dx,[cs:Sb16IsrPicPort]
        dd Sb16IsrPicPort
        out dx, al
        pop edx
        pop eax
        iret
        db 00h,00h,00h
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFECh
        push ds
        push esi
        push edi
        mov esi, dword [byte ebp+08h]
        mov eax, dword [byte ebp+0Ch]
        sub ax, word [byte esi+08h]
        cwde
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp+010h]
        sub ax, word [byte esi+0Ah]
        cwde
        db 089h,045h,0F8h                       ; insn: mov [ebp-8],eax
