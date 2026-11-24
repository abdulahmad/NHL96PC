; Strings and constants of src/lib/ea/ea_memman.asm, in link order.
bits 32
%include "hockey.inc"
section s_11319C progbits alloc noexec write align=1
global str_ReservememMEMORYMANAGERN, str_ReservememINVALIDSIZE, str_ReservememMEMORYMANAGERB, str_ReservememOUTOFMEMORYRequest, str_ReservememOUTOFMEMORYRequest_AllocMemBlockEx, str_ReservememINVALIDTYPEFLAGS, str_ResizememINVALIDSIZE, str_ResizememblockNOROOMTO
global str_FindmemblockBLOCKNOTFOUND, str_PurgememblockNULLPointer, str_GetmemblockNOMEMORYBLOCKS, str_Jan, str_Feb2, str_Mar, str_Apr, str_May
global str_Jun, str_Jul, str_Aug, str_Sep, str_Oct, str_Nov, str_Dec
str_ReservememMEMORYMANAGERN:                   ; string 'reservemem - MEMORY MANAGER NOT INITIALIZED
                                                ; requested: %ld '; used by AllocMemBlockEx
        db 072h,065h,073h,065h,072h,076h,065h,06Dh,065h,06Dh,020h,02Dh,020h,04Dh,045h,04Dh
        db 04Fh,052h,059h,020h,04Dh,041h,04Eh,041h,047h,045h,052h,020h,04Eh,04Fh,054h,020h
        db 049h,04Eh,049h,054h,049h,041h,04Ch,049h,05Ah,045h,044h,0Ah,072h,065h,071h,075h
        db 065h,073h,074h,065h,064h,03Ah,020h,025h,06Ch,064h,0Ah,00h
str_ReservememINVALIDSIZE:                      ; string "reservemem - INVALID SIZE REQUESTED requested: %ld
                                                ; available: %ld "; used by AllocMemBlockEx
        db 072h,065h,073h,065h,072h,076h,065h,06Dh,065h,06Dh,020h,02Dh,020h,049h,04Eh,056h
        db 041h,04Ch,049h,044h,020h,053h,049h,05Ah,045h,020h,052h,045h,051h,055h,045h,053h
        db 054h,045h,044h,0Ah,072h,065h,071h,075h,065h,073h,074h,065h,064h,03Ah,020h,025h
        db 06Ch,064h,020h,061h,076h,061h,069h,06Ch,061h,062h,06Ch,065h,03Ah,020h,025h,06Ch
        db 064h,0Ah,00h,020h
str_ReservememMEMORYMANAGERB:                   ; string 'reservemem - MEMORY MANAGER BLOCKS CORRUPTED
                                                ; requested: %ld. type %x. should be %x '; used by
                                                ; AllocMemBlockEx
        db 072h,065h,073h,065h,072h,076h,065h,06Dh,065h,06Dh,020h,02Dh,020h,04Dh,045h,04Dh
        db 04Fh,052h,059h,020h,04Dh,041h,04Eh,041h,047h,045h,052h,020h,042h,04Ch,04Fh,043h
        db 04Bh,053h,020h,043h,04Fh,052h,052h,055h,050h,054h,045h,044h,0Ah,072h,065h,071h
        db 075h,065h,073h,074h,065h,064h,03Ah,020h,025h,06Ch,064h,02Eh,020h,074h,079h,070h
        db 065h,020h,025h,078h,02Eh,020h,073h,068h,06Fh,075h,06Ch,064h,020h,062h,065h,020h
        db 025h,078h,0Ah,00h
str_ReservememOUTOFMEMORYRequest:               ; string "reservemem - OUT OF MEMORY\nrequested: %ld
                                                ; available: %ld\n"; used by AllocMemBlockEx
        db 072h,065h,073h,065h,072h,076h,065h,06Dh,065h,06Dh,020h,02Dh,020h,04Fh,055h,054h
        db 020h,04Fh,046h,020h,04Dh,045h,04Dh,04Fh,052h,059h,0Ah,072h,065h,071h,075h,065h
        db 073h,074h,065h,064h,03Ah,020h,025h,06Ch,064h,020h,061h,076h,061h,069h,06Ch,061h
        db 062h,06Ch,065h,03Ah,020h,025h,06Ch,064h,0Ah,00h,05Ah,045h
str_ReservememOUTOFMEMORYRequest_AllocMemBlockEx: ; string "reservemem - OUT OF MEMORY\nrequested: %ld
                                                ; available: %ld\n"; used by AllocMemBlockEx
        db 072h,065h,073h,065h,072h,076h,065h,06Dh,065h,06Dh,020h,02Dh,020h,04Fh,055h,054h
        db 020h,04Fh,046h,020h,04Dh,045h,04Dh,04Fh,052h,059h,0Ah,072h,065h,071h,075h,065h
        db 073h,074h,065h,064h,03Ah,020h,025h,06Ch,064h,020h,061h,076h,061h,069h,06Ch,061h
        db 062h,06Ch,065h,03Ah,020h,025h,06Ch,064h,0Ah,00h,04Dh,04Fh
str_ReservememINVALIDTYPEFLAGS:                 ; string "reservemem - INVALID TYPE FLAGS (%04x) "; used by
                                                ; AllocMemBlockEx
        db 072h,065h,073h,065h,072h,076h,065h,06Dh,065h,06Dh,020h,02Dh,020h,049h,04Eh,056h
        db 041h,04Ch,049h,044h,020h,054h,059h,050h,045h,020h,046h,04Ch,041h,047h,053h,020h
        db 028h,025h,030h,034h,078h,029h,0Ah,00h
str_ResizememINVALIDSIZE:                       ; string "resizemem - INVALID SIZE REQUESTED requested: %ld
                                                ; available: %ld "; used by ResizeMemBlock
        db 072h,065h,073h,069h,07Ah,065h,06Dh,065h,06Dh,020h,02Dh,020h,049h,04Eh,056h,041h
        db 04Ch,049h,044h,020h,053h,049h,05Ah,045h,020h,052h,045h,051h,055h,045h,053h,054h
        db 045h,044h,0Ah,072h,065h,071h,075h,065h,073h,074h,065h,064h,03Ah,020h,025h,06Ch
        db 064h,020h,061h,076h,061h,069h,06Ch,061h,062h,06Ch,065h,03Ah,020h,025h,06Ch,064h
        db 0Ah,00h,06Ch,064h
str_ResizememblockNOROOMTO:                     ; string "resizememblock - NO ROOM TO RESIZE requested: %ld
                                                ; available: %ld "; used by ResizeMemBlock
        db 072h,065h,073h,069h,07Ah,065h,06Dh,065h,06Dh,062h,06Ch,06Fh,063h,06Bh,020h,02Dh
        db 020h,04Eh,04Fh,020h,052h,04Fh,04Fh,04Dh,020h,054h,04Fh,020h,052h,045h,053h,049h
        db 05Ah,045h,0Ah,072h,065h,071h,075h,065h,073h,074h,065h,064h,03Ah,020h,025h,06Ch
        db 064h,020h,061h,076h,061h,069h,06Ch,061h,062h,06Ch,065h,03Ah,020h,025h,06Ch,064h
        db 0Ah,00h,061h,062h
str_FindmemblockBLOCKNOTFOUND:                  ; string "findmemblock - BLOCK NOT FOUND (%p) "; used by
                                                ; findmemblock
        db 066h,069h,06Eh,064h,06Dh,065h,06Dh,062h,06Ch,06Fh,063h,06Bh,020h,02Dh,020h,042h
        db 04Ch,04Fh,043h,04Bh,020h,04Eh,04Fh,054h,020h,046h,04Fh,055h,04Eh,044h,020h,028h
        db 025h,070h,029h,0Ah,00h,046h,04Ch,041h
str_PurgememblockNULLPointer:                   ; string "purgememblock - NULL pointer\n"; used by
                                                ; PushMemDescriptor
        db 070h,075h,072h,067h,065h,06Dh,065h,06Dh,062h,06Ch,06Fh,063h,06Bh,020h,02Dh,020h
        db 04Eh,055h,04Ch,04Ch,020h,070h,06Fh,069h,06Eh,074h,065h,072h,0Ah,00h,020h,053h
str_GetmemblockNOMEMORYBLOCKS:                  ; string "getmemblock - NO MEMORY BLOCKS LEFT "; used by
                                                ; getmemblock
        db 067h,065h,074h,06Dh,065h,06Dh,062h,06Ch,06Fh,063h,06Bh,020h,02Dh,020h,04Eh,04Fh
        db 020h,04Dh,045h,04Dh,04Fh,052h,059h,020h,042h,04Ch,04Fh,043h,04Bh,053h,020h,04Ch
        db 045h,046h,054h,0Ah,00h,00h,00h,00h
str_Jan:                                        ; string 'Jan'
        db 04Ah,061h,06Eh,00h
str_Feb2:                                       ; string 'Feb'
        db 046h,065h,062h,00h
str_Mar:                                        ; string 'Mar'
        db 04Dh,061h,072h,00h
str_Apr:                                        ; string 'Apr'
        db 041h,070h,072h,00h
str_May:                                        ; string 'May'
        db 04Dh,061h,079h,00h
str_Jun:                                        ; string 'Jun'
        db 04Ah,075h,06Eh,00h
str_Jul:                                        ; string 'Jul'
        db 04Ah,075h,06Ch,00h
str_Aug:                                        ; string 'Aug'
        db 041h,075h,067h,00h
str_Sep:                                        ; string 'Sep'
        db 053h,065h,070h,00h
str_Oct:                                        ; string 'Oct'
        db 04Fh,063h,074h,00h
str_Nov:                                        ; string 'Nov'
        db 04Eh,06Fh,076h,00h
str_Dec:                                        ; string 'Dec'
        db 044h,065h,063h,00h
