; BSS of front/intro (src/front/intro).
bits 32
%include "hockey.inc"
section s_17BDD4 nobits alloc noexec write align=1
global SlideImageBmp, SlideImageIndex, SlideEventPtr
SlideImageBmp:                                  ; Slide show image bitmap; used by LoadSlideImage,
                                                ; RunSlideShow
        resb 4
SlideImageIndex:                                ; Slide show image shown; used by LoadSlideImage, RunSlideShow
        resb 4
SlideEventPtr:                                  ; Slide show event pointer; used by RunSlideEvents,
                                                ; RunSlideShow
        resb 4
