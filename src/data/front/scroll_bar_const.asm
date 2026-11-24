; Strings and constants of front/scroll_bar (src/front/scroll_bar), in link order.
bits 32
%include "hockey.inc"
section s_1122F8 progbits alloc noexec write align=1
global F32_0p5, F32_0p5_InitHScrollBar, F32_14_InitScrollTable, F32_0p5_ScrollBarToMouse
F32_0p5:                                        ; float constant 0.5; used by InitVScrollBar
        db 00h,00h,00h,03Fh
F32_0p5_InitHScrollBar:                         ; float constant 0.5; used by InitHScrollBar
        db 00h,00h,00h,03Fh
F32_14_InitScrollTable:                         ; float constant 14; used by DrawScrollBar, InitHScrollBar
        db 00h,00h,0F0h,041h
F32_0p5_ScrollBarToMouse:                       ; float constant 0.5; used by ScrollBarToMouse
        db 00h,00h,00h,03Fh
