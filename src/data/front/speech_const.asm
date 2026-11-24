; Strings and constants of front/speech (src/front/speech), in link order.
bits 32
%include "hockey.inc"
section s_11192C progbits alloc noexec write align=1
global str_SPEECHBUF
str_SPEECHBUF:                                  ; string 'SPEECHBUF'; used by InitSpeech, RestoreSpeechBuffer
        db 053h,050h,045h,045h,043h,048h,042h,055h,046h,00h,00h,00h
