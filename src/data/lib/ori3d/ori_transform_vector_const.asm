; Strings and constants of src/lib/ori3d/ori_transform_vector.asm, in link order.
bits 32
%include "hockey.inc"
section s_113954 progbits alloc noexec write align=1
global str_ORIINST, str_INVMATRX, str_Ori, str_OriloadCouldNotLoadORIGA
str_ORIINST:                                    ; string 'ORI_INST'; used by OriCreateInstance
        db 04Fh,052h,049h,05Fh,049h,04Eh,053h,054h,00h,00h,00h,00h
str_INVMATRX:                                   ; string "INVMATRX"; used by OriFixupModel
        db 049h,04Eh,056h,04Dh,041h,054h,052h,058h,00h,00h,00h,090h
str_Ori:                                        ; string ".ori"; used by OriReadModel
        db 02Eh,06Fh,072h,069h,00h,0FFh,0FFh,03h
str_OriloadCouldNotLoadORIGA:                   ; string 'oriload: Could not load ORIGAMI header file '%s'';
                                                ; used by OriLoadModel
        db 06Fh,072h,069h,06Ch,06Fh,061h,064h,03Ah,020h,043h,06Fh,075h,06Ch,064h,020h,06Eh
        db 06Fh,074h,020h,06Ch,06Fh,061h,064h,020h,04Fh,052h,049h,047h,041h,04Dh,049h,020h
        db 068h,065h,061h,064h,065h,072h,020h,066h,069h,06Ch,065h,020h,027h,025h,073h,027h
        db 00h,00h,00h,00h
