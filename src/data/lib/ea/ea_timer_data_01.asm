; Strings and constants of the EA library files from ea_timer on (src/lib/ea), in link order.
bits 32
%include "hockey.inc"
section s_1130F8 progbits alloc noexec write align=1
global str_AddtimerLISTFULL, str_InitmemmanadrINSUFFICIENTMEM, str_LOWMEM, str_HIGHMEM, str_GAP, str_UnlinkmemclassareaReleaseMem
str_AddtimerLISTFULL:                           ; string "addtimer - LIST FULL "; used by addtimer
        db 061h,064h,064h,074h,069h,06Dh,065h,072h,020h,02Dh,020h,04Ch,049h,053h,054h,020h
        db 046h,055h,04Ch,04Ch,0Ah,00h,00h,00h
str_InitmemmanadrINSUFFICIENTMEM:               ; string "initmemmanadr - INSUFFICIENT MEMORY TO INITIALIZE
                                                ; MEMORY MANAGER\n"; used by DrawArtOr
        db 069h,06Eh,069h,074h,06Dh,065h,06Dh,06Dh,061h,06Eh,061h,064h,072h,020h,02Dh,020h
        db 049h,04Eh,053h,055h,046h,046h,049h,043h,049h,045h,04Eh,054h,020h,04Dh,045h,04Dh
        db 04Fh,052h,059h,020h,054h,04Fh,020h,049h,04Eh,049h,054h,049h,041h,04Ch,049h,05Ah
        db 045h,020h,04Dh,045h,04Dh,04Fh,052h,059h,020h,04Dh,041h,04Eh,041h,047h,045h,052h
        db 0Ah,00h,063h,06Fh
str_LOWMEM:                                     ; string "LOW MEM"; used by AddMemRegion
        db 04Ch,04Fh,057h,020h,04Dh,045h,04Dh,00h
str_HIGHMEM:                                    ; string "HIGH MEM"; used by AddHighMemRegion, AddMemRegion
        db 048h,049h,047h,048h,020h,04Dh,045h,04Dh,00h,079h,031h,02Ch
str_GAP:                                        ; string 'GAP'; used by AddHighMemRegion
        db 047h,041h,050h,00h
str_UnlinkmemclassareaReleaseMem:               ; string "unlinkmemclassarea - Release Memory Not Found\n";
                                                ; used by AddHighMemRegion
        db 075h,06Eh,06Ch,069h,06Eh,06Bh,06Dh,065h,06Dh,063h,06Ch,061h,073h,073h,061h,072h
        db 065h,061h,020h,02Dh,020h,052h,065h,06Ch,065h,061h,073h,065h,020h,04Dh,065h,06Dh
        db 06Fh,072h,079h,020h,04Eh,06Fh,074h,020h,046h,06Fh,075h,06Eh,064h,0Ah,00h,064h
