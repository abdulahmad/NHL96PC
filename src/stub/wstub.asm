; The Watcom wstub MZ program: its header points (e_lfanew) at the LE header that follows.
wstub:						; start of the bound program: LE offsets such as the data pages are counted from here
	incbin	"Extracted/segments/wstub.bin"
