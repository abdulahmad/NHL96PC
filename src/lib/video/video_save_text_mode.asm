; Video: SaveTextMode, RestoreTextMode.
bits 32
%include "hockey.inc"
section s_E2484 progbits alloc exec nowrite align=1
extern AddExitHandler, ClearScreenColour, SavedTextColumns, SavedTextMode, SavedTextPage, SavedTextRows
global SaveTextMode, RestoreTextMode
;-----------------------------------------------------------------------------
; SaveTextMode                                                    E2484  95 PC
; Saves the BIOS text mode, page, columns and rows before the game changes the screen
;-----------------------------------------------------------------------------
SaveTextMode:
        cmp byte [SavedTextMode], 0
        jne short .1
        mov ah, 0Fh
        int 10h
        mov byte [SavedTextMode], al
        mov al, byte [0410h]
        mov byte [SavedTextPage], al
        mov ax, word [044Ah]
        mov word [SavedTextColumns], ax
        mov al, byte [0484h]
        mov byte [SavedTextRows], al
        push RestoreTextMode
        call AddExitHandler
        add esp, byte 4
.1:
        ret
;-----------------------------------------------------------------------------
; RestoreTextMode                                                 E24C4  95 PC
; Restores the text mode saved by SaveTextMode
;-----------------------------------------------------------------------------
RestoreTextMode:
        pusha
        cmp byte [SavedTextMode], 0
        je near .5
        mov al, byte [SavedTextPage]
        mov byte [0410h], al
        cmp byte [SavedTextMode], 3
        jne near .2
        cmp word [SavedTextColumns], byte 50h
        jne near .2
        cmp byte [SavedTextRows], 2Ah
        jb near .2
        cmp byte [SavedTextRows], 31h
        ja near .2
        je short .1
        mov ax, 1201h
        mov bl, 30h
        int 10h
        LD xor, eax, eax
        mov al, byte [SavedTextMode]
        int 10h
        mov ax, 1112h
        LD xor, ebx, ebx
        int 10h
        mov word [044Ah], 50h
        mov byte [0484h], 2Ah
        mov byte [0485h], 8
        mov word [0460h], 507h
        mov word [044Ch], 1AE0h
        mov cx, 507h
        mov ah, 1
        int 10h
        jmp short .3
.1:
        mov ax, 1202h
        mov bl, 30h
        int 10h
        LD xor, eax, eax
        mov al, byte [SavedTextMode]
        int 10h
        mov ax, 1112h
        LD xor, ebx, ebx
        int 10h
        mov word [044Ah], 50h
        mov byte [0484h], 31h
        mov byte [0485h], 8
        mov word [0460h], 507h
        mov word [044Ch], 1F40h
        mov cx, 507h
        mov ah, 1
        int 10h
        jmp short .3
.2:
        LD xor, eax, eax
        mov al, byte [SavedTextMode]
        int 10h
.3:
        mov al, byte [SavedTextPage]
        mov byte [0410h], al
        and al, 30h
        cmp al, 30h
        jne short .4
        push byte 0
        call ClearScreenColour
        add esp, byte 4
.4:
        mov ah, 0Bh
        LD xor, bx, bx
        int 10h
        mov byte [SavedTextMode], 0
.5:
        popa
        ret
