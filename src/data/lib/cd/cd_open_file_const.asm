; Strings and constants of src/lib/cd/cd_open_file.asm, in link order.
bits 32
%include "hockey.inc"
section s_113740 progbits alloc noexec write align=1
global str_OpenblockhandleSNOHANDLESLEF, str_OpenblockhandleSPATHNAME
str_OpenblockhandleSNOHANDLESLEF:               ; string "openblockhandle - %s NO HANDLES LEFT\n"; used by
                                                ; CdOpenFile
        db 06Fh,070h,065h,06Eh,062h,06Ch,06Fh,063h,06Bh,068h,061h,06Eh,064h,06Ch,065h,020h
        db 02Dh,020h,025h,073h,020h,04Eh,04Fh,020h,048h,041h,04Eh,044h,04Ch,045h,053h,020h
        db 04Ch,045h,046h,054h,0Ah,00h,069h,06Eh
str_OpenblockhandleSPATHNAME:                   ; string 'openblockhandle - %s PATH NAME NOT FOUND '; used by
                                                ; CdOpenFile
        db 06Fh,070h,065h,06Eh,062h,06Ch,06Fh,063h,06Bh,068h,061h,06Eh,064h,06Ch,065h,020h
        db 02Dh,020h,025h,073h,020h,050h,041h,054h,048h,020h,04Eh,041h,04Dh,045h,020h,04Eh
        db 04Fh,054h,020h,046h,04Fh,055h,04Eh,044h,0Ah,00h,00h,00h
