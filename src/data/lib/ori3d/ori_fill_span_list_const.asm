; Strings and constants of src/lib/ori3d/ori_fill_span_list.asm, in link order.
bits 32
%include "hockey.inc"
section s_11407C progbits alloc noexec write align=1
global str_OriinitmorphObjectCannotMorp, str_OriapplymorphObjectCannotMor, str_OriapplymorphObjectCanno
str_OriinitmorphObjectCannotMorp:               ; string "oriinitmorph: object cannot morph"; used by
                                                ; OriApplyMorph
        db 06Fh,072h,069h,069h,06Eh,069h,074h,06Dh,06Fh,072h,070h,068h,03Ah,020h,06Fh,062h
        db 06Ah,065h,063h,074h,020h,063h,061h,06Eh,06Eh,06Fh,074h,020h,06Dh,06Fh,072h,070h
        db 068h,00h,00h,078h
str_OriapplymorphObjectCannotMor:               ; string "oriapplymorph: object cannot morph"; used by
                                                ; OriApplyMorph
        db 06Fh,072h,069h,061h,070h,070h,06Ch,079h,06Dh,06Fh,072h,070h,068h,03Ah,020h,06Fh
        db 062h,06Ah,065h,063h,074h,020h,063h,061h,06Eh,06Eh,06Fh,074h,020h,06Dh,06Fh,072h
        db 070h,068h,00h,064h
str_OriapplymorphObjectCanno:                   ; string 'oriapplymorph: object cannot morph'; used by
                                                ; OriApplyMorph
        db 06Fh,072h,069h,061h,070h,070h,06Ch,079h,06Dh,06Fh,072h,070h,068h,03Ah,020h,06Fh
        db 062h,06Ah,065h,063h,074h,020h,063h,061h,06Eh,06Eh,06Fh,074h,020h,06Dh,06Fh,072h
        db 070h,068h,00h,00h
