; The LE (linear executable) header of the game image and the loader and fixup tables after it, up to the object pages.
; DOS/4GW reads it to load the objects and apply the fixups. Table offsets and sizes are worked out from the labels of the
; tables they describe. The tables themselves (page map, names, fixups) are still incbin.
le_header:
	db	'LE'				; signature
	db	0, 0				; byte order, word order: little-endian
	dd	0				; format level
	dw	2, 1				; CPU 80386, OS DOS
	dd	0				; module version
	dd	0x200				; module flags
	dd	(le_page_map_end - le_page_map) / 4	; pages in the file (one page map entry each)
	dd	1				; object of the entry point
	dd	start - obj1_base			; entry point offset in that object: the Watcom start-up code
	dd	4				; object of the stack
	dd	obj4_size			; initial ESP: the top of that object
	dd	0x1000				; page size
	dd	0x597				; bytes in the last page
	dd	le_loader_end - le_fixup_page_table	; fixup section size
	dd	0				; fixup section checksum
	dd	le_loader_end - le_object_table	; loader section size
	dd	0				; loader section checksum
	dd	le_object_table - le_header		; object table
	dd	(le_page_map - le_object_table) / 24	; number of objects
	dd	le_page_map - le_header		; object page map
	dd	0				; iterated pages: none
	dd	le_resident_names - le_header		; resource table (empty: same place as the resident names)
	dd	0				; resources
	dd	le_resident_names - le_header		; resident names
	dd	le_entry_table - le_header		; entry table
	dd	0, 0				; module directives: none
	dd	le_fixup_page_table - le_header		; fixup page table
	dd	le_fixup_records - le_header		; fixup record table
	dd	le_imports - le_header		; import module table (empty)
	dd	0				; import modules
	dd	le_imports - le_header		; import procedure table
	dd	0				; per-page checksums: none
	dd	le_end - wstub			; object pages, from the start of the bound program
	dd	0				; preload pages
	dd	0, 0, 0				; non-resident names: none
	dd	4				; automatic data object
	times	0x2C db 0		; the rest of the header (debug info, instance pages, heap) is zero
le_object_table:
	dd	obj1_size, obj1_base, 0x2005, 1, 211, 0	; object 1: size, base, flags, first page, pages, reserved
	dd	obj2_size, obj2_base, 0x0005, 212, 1, 0	; object 2: size, base, flags, first page, pages, reserved
	dd	obj3_size, obj3_base, 0x2003, 213, 1, 0	; object 3: size, base, flags, first page, pages, reserved
	dd	obj4_size, obj4_base, 0x2003, 214, 66, 0	; object 4: size, base, flags, first page, pages, reserved
le_page_map:					; page number and type of every page, in file order
	incbin	"Extracted/segments/le_header.bin", 0x124, 0x45C
le_page_map_end:
le_resident_names:					; module name and ordinals
	incbin	"Extracted/segments/le_header.bin", 0x580, 0xA
le_entry_table:						; empty entry table
	incbin	"Extracted/segments/le_header.bin", 0x58A, 0x1
le_fixup_page_table:					; start of each page's fixups in the record table
	incbin	"Extracted/segments/le_header.bin", 0x58B, 0x460
le_fixup_records:					; the fixup records, in linker order
	incbin	"Extracted/segments/le_header.bin", 0x9EB, 0x49D8D
le_imports:						; import procedure table (one empty entry)
	incbin	"Extracted/segments/le_header.bin", 0x4A778, 0x1
le_loader_end:
	incbin	"Extracted/segments/le_header.bin", 0x4A779
le_end:						; end of the header area: the object pages start here
