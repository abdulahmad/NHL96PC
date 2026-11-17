; Input: ReadKeyPadBits.
bits 32
%include "hockey.inc"
section s_E2729 progbits alloc exec nowrite align=1
extern joyenablemask, KeyPadDownKey, KeyPadDownLeftKey, KeyPadDownRightKey, KeyPadFireKey, KeyPadLeftKey, KeyPadRightKey, KeyPadSelectKey
extern KeyPadUpKey, KeyPadUpLeftKey, KeyPadUpRightKey, KeyStateTable, ReadJoystickPorts
global ReadKeyPadBits
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; ReadKeyPadBits                                  E272C  96 PC, low confidence
; Builds pad button bits from the keyboard keys set for the pad
;-----------------------------------------------------------------------------
ReadKeyPadBits:
        LD xor, eax, eax
        LD xor, ebx, ebx
        mov bl, byte [KeyPadFireKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .1
        or al, 10h
.1:
        mov bl, byte [KeyPadSelectKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .2
        or al, 20h
.2:
        mov bl, byte [KeyPadUpLeftKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .3
        or al, 9
.3:
        mov bl, byte [KeyPadUpKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .4
        or al, 1
.4:
        mov bl, byte [KeyPadUpRightKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .5
        or al, 5
.5:
        mov bl, byte [KeyPadRightKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .6
        or al, 4
.6:
        mov bl, byte [KeyPadDownRightKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .7
        or al, 6
.7:
        mov bl, byte [KeyPadDownKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .8
        or al, 2
.8:
        mov bl, byte [KeyPadDownLeftKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .9
        or al, 0Ah
.9:
        mov bl, byte [KeyPadLeftKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .10
        or al, 8
.10:
        LD or, eax, eax
        jne short .11
        call ReadJoystickPorts
.11:
        ret
        LD xor, ecx, ecx
        LD xor, ebx, ebx
        mov bl, byte [KeyPadFireKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .12
        or cl, 10h
.12:
        mov bl, byte [KeyPadSelectKey]
        cmp byte [dword ebx+KeyStateTable], 0
        je short .13
        or cl, 20h
.13:
        LD xor, eax, eax
        mov dx, 201h
        test byte [joyenablemask], 1
        je short .14
        in al, dx
        not al
        and al, 30h
.14:
        LD or, eax, ecx
        ret
