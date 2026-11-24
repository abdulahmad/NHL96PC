; BSS of front/draw (src/front/draw).
bits 32
%include "hockey.inc"
section s_17BDE0 nobits alloc noexec write align=1
global IntroPalette, fadepalbuf
IntroPalette:                                   ; intro palette; used by FadeOut
        resb 768
fadepalbuf:                                     ; same data as the like-named label used by the same routines
                                                ; in the earlier PC version
        resb 772
