; Initialised data of front/calendar (src/front/calendar).
bits 32
%include "hockey.inc"
section s_11E3A0 progbits alloc noexec write align=1
global CalMonthNumbers, CalMonthDays, CalButtonDefs
CalMonthNumbers:                                ; month numbers shown on the calendar; used by CalendarScreen
        db 08h
        db 09h,0Ah,0Bh,00h,01h,02h,03h
CalMonthDays:                                   ; days in each calendar month; used by CalendarScreen,
                                                ; DrawCalendar
        db 04h
        db 05h,00h,03h,03h,06h,01h,04h,00h,00h,04h,06h,02h,04h
CalButtonDefs:                                  ; calendar button definitions; used by CalendarScreen
        db 0EAh,00h,00h,00h,015h,00h,00h,00h,091h,01h,00h,00h,015h,00h,00h,00h
        db 085h,01h,00h,00h,02Eh,00h,00h,00h,0F5h,00h,00h,00h,02Eh,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 09Fh,00h,00h,00h,020h,00h,00h,00h,0A9h,00h,00h,00h,014h,00h,00h,00h
        db 0E8h,00h,00h,00h,015h,00h,00h,00h,0F3h,00h,00h,00h,02Eh,00h,00h,00h
        db 0A9h,00h,00h,00h,02Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 093h,01h,00h,00h,015h,00h,00h,00h,0CAh,01h,00h,00h,014h,00h,00h,00h
        db 0DCh,01h,00h,00h,023h,00h,00h,00h,0D0h,01h,00h,00h,02Eh,00h,00h,00h
        db 087h,01h,00h,00h,02Eh,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 0FAh,00h,00h,00h,0C1h,01h,00h,00h,0FFh,00h,00h,00h,0B3h,01h,00h,00h
        db 07Ch,01h,00h,00h,0B4h,01h,00h,00h,086h,01h,00h,00h,0C3h,01h,00h,00h
        db 07Bh,01h,00h,00h,0CDh,01h,00h,00h,09h,01h,00h,00h,0CDh,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h
