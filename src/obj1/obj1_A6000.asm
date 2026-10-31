; Object 1 page A6000: not yet disassembled.
	incbin	"Extracted/segments/obj1_A6000.bin", 0, 0x308
start:						; Watcom start-up code: the program's entry point
	incbin	"Extracted/segments/obj1_A6000.bin", 0x308
