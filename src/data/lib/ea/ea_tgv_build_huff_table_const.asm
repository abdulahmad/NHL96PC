; Strings and constants of src/lib/ea/ea_tgv_build_huff_table.asm, in link order.
bits 32
%include "hockey.inc"
section s_113E28 progbits alloc noexec write align=1
global str_TGV, str_TgvdecodeInvalidChunkTyp, str_RateDDAvgDD
str_TGV:                                        ; string "TGV"; used by TgvAllocDecoder, TgvDecodeDeltaFrame,
                                                ; TgvDecodeKeyFrame
        db 054h,047h,056h,00h
str_TgvdecodeInvalidChunkTyp:                   ; string 'tgvdecode: Invalid chunk type'; used by
                                                ; TgvDecodeFrame
        db 074h,067h,076h,064h,065h,063h,06Fh,064h,065h,03Ah,020h,049h,06Eh,076h,061h,06Ch
        db 069h,064h,020h,063h,068h,075h,06Eh,06Bh,020h,074h,079h,070h,065h,00h,00h,00h
str_RateDDAvgDD:                                ; string 'rate=%d.%d avg=%d.%d '; used by TgvShowFrameRate
        db 072h,061h,074h,065h,03Dh,025h,064h,02Eh,025h,064h,020h,020h,061h,076h,067h,03Dh
        db 025h,064h,02Eh,025h,064h,0Ah,00h,00h
