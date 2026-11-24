; Strings and constants of front/lang_text (src/front/lang_text), in link order.
bits 32
%include "hockey.inc"
section s_1120D1 progbits alloc noexec write align=1
global str_Localize, str_Rb
str_Localize:                                   ; string 'Localize'; used by LoadLangText
        db 04Ch,06Fh,063h,061h,06Ch,069h,07Ah,065h,00h
str_Rb:                                         ; string 'rb'; used by LoadLangBlock
        db 072h,062h,00h,00h,00h,00h
