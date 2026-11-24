; Strings and constants of src/lib/ea/ea_unpackf_blit.asm, in link order.
bits 32
%include "hockey.inc"
section s_1149A4 progbits alloc noexec write align=1
global str_Unpackf, str_Targa
str_Unpackf:                                    ; string "unpackf"; used by DrawArtAnyFormat
        db 075h,06Eh,070h,061h,063h,06Bh,066h,00h
str_Targa:                                      ; string 'Targa'; used by WriteTgaScreen
        db 054h,061h,072h,067h,061h,00h,00h,00h
