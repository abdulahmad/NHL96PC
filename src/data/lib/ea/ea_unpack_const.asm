; Strings and constants of src/lib/ea/ea_unpack.asm, in link order.
bits 32
%include "hockey.inc"
section s_1135A8 progbits alloc noexec write align=1
global str_Lzh, str_Copyright, str_UnpackINVALIDPACKCODE, str_TextTable
str_Lzh:                                        ; string "lzh"; used by UnpackLzh
        db 06Ch,07Ah,068h,00h
str_Copyright:                                  ; string "Copyright"; used by SkipCopyrightHeader
        db 043h,06Fh,070h,079h,072h,069h,067h,068h,074h,00h,020h,073h
str_UnpackINVALIDPACKCODE:                      ; string "unpack - INVALID PACK CODE (%x) "; used by unpack
        db 075h,06Eh,070h,061h,063h,06Bh,020h,02Dh,020h,049h,04Eh,056h,041h,04Ch,049h,044h
        db 020h,050h,041h,043h,04Bh,020h,043h,04Fh,044h,045h,020h,028h,025h,078h,029h,0Ah
        db 00h,00h,00h,00h
str_TextTable:                                  ; string 'Text Table'; used by BuildTextColourTable
        db 054h,065h,078h,074h,020h,054h,061h,062h,06Ch,065h,00h,00h
