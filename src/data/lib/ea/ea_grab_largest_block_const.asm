; Strings and constants of src/lib/ea/ea_grab_largest_block.asm, in link order.
bits 32
%include "hockey.inc"
section s_11362C progbits alloc noexec write align=1
global str_InitmemmanINSUFFICIENTROW, str_InitmemmanTOOMUCHDOSALLOCATE, str_InitmemmanDOSMEMORYNOTALLOCA, str_InitmemmanDOSSUBMEMORYNOTALL, str_InitmemmanDOSSUBMEMORYNO
str_InitmemmanINSUFFICIENTROW:                  ; string "initmemman - INSUFFICIENT ROW TABLE SPACE "; used by
                                                ; InitMemoryPool
        db 069h,06Eh,069h,074h,06Dh,065h,06Dh,06Dh,061h,06Eh,020h,02Dh,020h,049h,04Eh,053h
        db 055h,046h,046h,049h,043h,049h,045h,04Eh,054h,020h,052h,04Fh,057h,020h,054h,041h
        db 042h,04Ch,045h,020h,053h,050h,041h,043h,045h,0Ah,00h,069h
str_InitmemmanTOOMUCHDOSALLOCATE:               ; string "initmemman - TOO MUCH DOS ALLOCATED\n"; used by
                                                ; InitMemoryPool
        db 069h,06Eh,069h,074h,06Dh,065h,06Dh,06Dh,061h,06Eh,020h,02Dh,020h,054h,04Fh,04Fh
        db 020h,04Dh,055h,043h,048h,020h,044h,04Fh,053h,020h,041h,04Ch,04Ch,04Fh,043h,041h
        db 054h,045h,044h,0Ah,00h,020h,069h,06Eh
str_InitmemmanDOSMEMORYNOTALLOCA:               ; string "initmemman - DOS MEMORY NOT ALLOCATED %x REQUESTED
                                                ; %x AVAILABLE\n"; used by InitMemoryPool
        db 069h,06Eh,069h,074h,06Dh,065h,06Dh,06Dh,061h,06Eh,020h,02Dh,020h,044h,04Fh,053h
        db 020h,04Dh,045h,04Dh,04Fh,052h,059h,020h,04Eh,04Fh,054h,020h,041h,04Ch,04Ch,04Fh
        db 043h,041h,054h,045h,044h,020h,025h,078h,020h,052h,045h,051h,055h,045h,053h,054h
        db 045h,044h,020h,025h,078h,020h,041h,056h,041h,049h,04Ch,041h,042h,04Ch,045h,0Ah
        db 00h,065h,078h,074h
str_InitmemmanDOSSUBMEMORYNOTALL:               ; string "initmemman - DOS SUB MEMORY NOT ALLOCATED %x
                                                ; REQUESTED %x AVAILABLE\n"; used by InitMemoryPool
        db 069h,06Eh,069h,074h,06Dh,065h,06Dh,06Dh,061h,06Eh,020h,02Dh,020h,044h,04Fh,053h
        db 020h,053h,055h,042h,020h,04Dh,045h,04Dh,04Fh,052h,059h,020h,04Eh,04Fh,054h,020h
        db 041h,04Ch,04Ch,04Fh,043h,041h,054h,045h,044h,020h,025h,078h,020h,052h,045h,051h
        db 055h,045h,053h,054h,045h,044h,020h,025h,078h,020h,041h,056h,041h,049h,04Ch,041h
        db 042h,04Ch,045h,0Ah,00h,045h,0Ah,00h
str_InitmemmanDOSSUBMEMORYNO:                   ; string 'initmemman - DOS SUB MEMORY NOT RELEASED '; used by
                                                ; InitMemoryPool
        db 069h,06Eh,069h,074h,06Dh,065h,06Dh,06Dh,061h,06Eh,020h,02Dh,020h,044h,04Fh,053h
        db 020h,053h,055h,042h,020h,04Dh,045h,04Dh,04Fh,052h,059h,020h,04Eh,04Fh,054h,020h
        db 052h,045h,04Ch,045h,041h,053h,045h,044h,0Ah,00h,00h,00h
