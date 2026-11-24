; Strings and constants of engine/threestars (src/engine/threestars), in link order.
bits 32
%include "hockey.inc"
section s_110D88 progbits alloc noexec write align=1
global str_MightyDucks, str_fmt2d, str_OfAnaheim
str_MightyDucks:                                ; team name string 72; used by DrawOverlayPanels
        incbin "build/teamstrings.bin", 812, 13
str_fmt2d:                                      ; string '%2d'; used by DrawOverlayPanels
        db 025h,032h,064h,00h
str_OfAnaheim:                                  ; team name string 73; used by DrawOverlayPanels
        incbin "build/teamstrings.bin", 825, 11
