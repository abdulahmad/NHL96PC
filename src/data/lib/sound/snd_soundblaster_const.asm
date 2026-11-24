; Strings and constants of src/lib/sound/snd_soundblaster.asm, in link order.
bits 32
%include "hockey.inc"
section s_1140E8 progbits alloc noexec write align=1
global str_BLASTER, str_DMABUFFER, str_WSSDMA, str_DMABUFFER2, str_DMABUFFER3, str_DMABUF, str_DMABUF2
str_BLASTER:                                    ; string "BLASTER"; used by ParseBlasterEnv
        db 042h,04Ch,041h,053h,054h,045h,052h,00h
str_DMABUFFER:                                  ; string 'DMA BUFFER'; used by WssOpen
        db 044h,04Dh,041h,020h,042h,055h,046h,046h,045h,052h,00h
str_WSSDMA:                                     ; string 'WSSDMA'; used by WssSetupCard
        db 057h,053h,053h,044h,04Dh,041h,00h,00h,00h
str_DMABUFFER2:                                 ; string 'DMA BUFFER'; used by GusStart
        db 044h,04Dh,041h,020h,042h,055h,046h,046h,045h,052h,00h,00h
str_DMABUFFER3:                                 ; string 'DMA BUFFER'; used by SbOpen
        db 044h,04Dh,041h,020h,042h,055h,046h,046h,045h,052h,00h,00h
str_DMABUF:                                     ; string 'DMABUF'; used by SbProOpen
        db 044h,04Dh,041h,042h,055h,046h,00h,00h
str_DMABUF2:                                    ; string 'DMABUF'; used by Sb16Open
        db 044h,04Dh,041h,042h,055h,046h,00h,00h
