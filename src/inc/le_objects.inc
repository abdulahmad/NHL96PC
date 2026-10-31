; The four LE objects of the game image: where each one is loaded (linear address) and its size in memory.
; Code and data labels in src/obj*/ are linear addresses inside these objects.
obj1_base	equ	0x10000			; object 1: code
obj1_size	equ	0xD28A0			; object 1 size in memory
obj2_base	equ	0xF0000			; object 2: data (small)
obj2_size	equ	0x34			; object 2 size in memory
obj3_base	equ	0x100000			; object 3: data (small)
obj3_size	equ	0x18			; object 3 size in memory
obj4_base	equ	0x110000			; object 4: data, BSS and stack
obj4_size	equ	0x99260			; object 4 size in memory
