; Strings and constants of src/lib/ea/ea_shutdown_system.asm, in link order.
bits 32
%include "hockey.inc"
section s_113F74 progbits alloc noexec write align=1
global str_PATH_InitSystem, str_DOS4GWEXE, str_CS_InitSystem, str_CheckextenderINCORRECTEX
str_PATH_InitSystem:                            ; string "PATH"; used by InitSystem
        db 050h,041h,054h,048h,00h,06Fh,069h,064h
str_DOS4GWEXE:                                  ; string "DOS4GW.EXE"; used by InitSystem
        db 044h,04Fh,053h,034h,047h,057h,02Eh,045h,058h,045h,00h,065h
str_CS_InitSystem:                              ; string "c:\%s"; used by InitSystem
        db 063h,03Ah,05Ch,025h,073h,00h,069h,06Eh
str_CheckextenderINCORRECTEX:                   ; string 'checkextender - INCORRECT EXTENDER VERSION INSTALLED
                                                ; Check '%s'. Currently %ld bytes in size. Should be %ld
                                                ; bytes. '; used by InitSystem
        db 063h,068h,065h,063h,06Bh,065h,078h,074h,065h,06Eh,064h,065h,072h,020h,02Dh,020h
        db 049h,04Eh,043h,04Fh,052h,052h,045h,043h,054h,020h,045h,058h,054h,045h,04Eh,044h
        db 045h,052h,020h,056h,045h,052h,053h,049h,04Fh,04Eh,020h,049h,04Eh,053h,054h,041h
        db 04Ch,04Ch,045h,044h,0Ah,043h,068h,065h,063h,06Bh,020h,027h,025h,073h,027h,02Eh
        db 020h,043h,075h,072h,072h,065h,06Eh,074h,06Ch,079h,020h,025h,06Ch,064h,020h,062h
        db 079h,074h,065h,073h,020h,069h,06Eh,020h,073h,069h,07Ah,065h,02Eh,0Ah,053h,068h
        db 06Fh,075h,06Ch,064h,020h,062h,065h,020h,025h,06Ch,064h,020h,062h,079h,074h,065h
        db 073h,02Eh,0Ah,00h
