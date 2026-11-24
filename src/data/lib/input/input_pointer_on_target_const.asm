; Strings and constants of src/lib/input/input_pointer_on_target.asm, in link order.
bits 32
%include "hockey.inc"
section s_114194 progbits alloc noexec write align=1
global str_CUtilMouse, str_Ptr0ptr1ptr2
str_CUtilMouse:                                 ; string "c:\util\mouse"; used by InitPointer
        db 063h,03Ah,05Ch,075h,074h,069h,06Ch,05Ch,06Dh,06Fh,075h,073h,065h,00h,075h,061h
str_Ptr0ptr1ptr2:                               ; string 'ptr0ptr1ptr2'; used by InitPointer
        db 070h,074h,072h,030h,070h,074h,072h,031h,070h,074h,072h,032h,00h,00h,00h,00h
