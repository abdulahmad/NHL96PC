; Initialised data of pc/modem_setup (src/pc/modem_setup).
bits 32
%include "hockey.inc"
section s_11DF80 progbits alloc noexec write align=1
global ControlPickRows, ControlPickColumns, str_GenericHayesCompatible, BaudChoices, DialAborted, LinkSetupSlots
ControlPickRows:                                ; control pick rows; used by ControlPicksScreen,
                                                ; PollOptionKeys
        db 0D3h,01h,00h,00h
ControlPickColumns:                             ; control pick slot positions; used by ControlPicksScreen,
                                                ; PollOptionKeys
        db 05Bh,00h,00h,00h,0CAh,01h,00h,00h,07Ah,00h,00h,00h,0C1h,01h,00h,00h
        db 09Ah,00h,00h,00h,0B8h,01h,00h,00h,0BAh,00h,00h,00h,0AFh,01h,00h,00h
        db 0DAh,00h,00h,00h,0A6h,01h,00h,00h,0FBh,00h,00h,00h,09Dh,01h,00h,00h
        db 01Ah,01h,00h,00h,094h,01h,00h,00h,03Bh,01h,00h,00h,08Bh,01h,00h,00h
        db 05Bh,01h,00h,00h
str_GenericHayesCompatible:                     ; string "Generic Hayes-Compatible"; used by
                                                ; ModemSettingsScreen
        db 047h,065h,06Eh,065h,072h,069h,063h,020h,048h,061h,079h,065h,073h,02Dh,043h,06Fh
        db 06Dh,070h,061h,074h,069h,062h,06Ch,065h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,041h,054h,020h,026h,046h,026h,04Bh,04Eh,030h,053h
        db 033h,037h,03Dh,039h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,049h,04Eh,054h,045h,04Ch,020h,053h,061h,074h,069h,073h,046h
        db 041h,058h,074h,069h,06Fh,06Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,041h,054h,020h,026h,046h,05Ch
        db 047h,05Ch,051h,02Ch,025h,043h,030h,02Ch,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,05Ah,04Fh,04Fh,04Dh,020h,056h,02Eh,033h
        db 032h,062h,069h,073h,020h,031h,034h,02Eh,034h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,041h,054h
        db 020h,026h,046h,046h,038h,026h,04Bh,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,05Ah,04Fh,04Fh,04Dh
        db 020h,056h,02Eh,046h,043h,020h,032h,038h,02Eh,038h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,041h,054h,020h,026h,046h,046h,038h,026h,04Bh,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 050h,072h,061h,063h,074h,069h,063h,061h,06Ch,020h,050h,065h,072h,069h,070h,068h
        db 065h,072h,061h,06Ch,073h,020h,050h,06Fh,063h,06Bh,065h,074h,020h,034h,034h,030h
        db 030h,046h,058h,00h,00h,00h,041h,054h,020h,026h,046h,026h,04Bh,04Eh,030h,020h
        db 053h,033h,037h,03Dh,039h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,055h,053h,020h,052h,06Fh,062h,06Fh,074h,069h,063h,073h,020h
        db 053h,070h,06Fh,072h,074h,073h,074h,065h,072h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,041h,054h,020h,026h,046h,026h
        db 04Eh,036h,026h,04Dh,026h,04Bh,026h,049h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,055h,053h,020h,052h,06Fh,062h,06Fh,074h
        db 069h,063h,073h,020h,056h,02Eh,033h,032h,020h,054h,065h,072h,062h,06Fh,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,041h,054h
        db 020h,026h,046h,026h,04Eh,036h,026h,04Dh,026h,04Bh,026h,049h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,047h,056h,043h,020h
        db 056h,033h,032h,062h,069h,073h,020h,031h,034h,02Eh,034h,020h,04Bh,062h,070h,073h
        db 020h,053h,065h,072h,069h,065h,073h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,041h,054h,020h,026h,046h,025h,043h,026h,04Bh,030h,05Ch,047h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 048h,061h,079h,065h,073h,020h,041h,043h,043h,055h,052h,041h,020h,053h,065h,072h
        db 069h,065h,073h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,041h,054h,020h,026h,046h,026h,04Bh,04Eh,030h,053h
        db 033h,037h,03Dh,039h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,053h,075h,070h,072h,061h,020h,056h,02Eh,033h,034h,020h,032h
        db 038h,038h,030h,030h,062h,070h,073h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,041h,054h,020h,026h,046h,025h
        db 043h,030h,026h,04Bh,030h,04Eh,030h,053h,033h,037h,03Dh,039h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h
BaudChoices:                                    ; baud rate choices; used by ModemDialScreen,
                                                ; ModemSettingsScreen
        db 02h,00h,01h,00h,02h,00h,01h,00h
DialAborted:                                    ; used by LinkSetupScreen, ModemDialScreen
        db 00h,00h,00h,00h
LinkSetupSlots:                                 ; link setup slot records; used by LinkSetupScreen,
                                                ; ModemDialScreen
        db 00h,00h,00h,00h
