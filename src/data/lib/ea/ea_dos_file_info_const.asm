; Strings and constants of src/lib/ea/ea_dos_file_info.asm, in link order.
bits 32
%include "hockey.inc"
section s_1135E8 progbits alloc noexec write align=1
global str_Inversetbl, str_Inversetmp
str_Inversetbl:                                 ; string "inversetbl"; used by BuildInverseTable
        db 069h,06Eh,076h,065h,072h,073h,065h,074h,062h,06Ch,00h,0Dh
str_Inversetmp:                                 ; string 'inversetmp'; used by BuildInverseTable
        db 069h,06Eh,076h,065h,072h,073h,065h,074h,06Dh,070h,00h,00h
