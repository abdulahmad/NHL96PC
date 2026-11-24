; BSS of front/controller_screen (src/front/controller_screen).
bits 32
%include "hockey.inc"
section s_17D560 nobits alloc noexec write align=1
global ControllerSlotDevice, ControllerSlotTeam, ControllerSlotIcon, ControllerPadIcons, ControllerColumnArt, ControllerBackBmp, ControllerIconArt, ControllerDragSlot
global ControllerDragIcon
ControllerSlotDevice:                           ; controller slot table: device (8 bytes per slot); used by
                                                ; ControllerScreen, DrawControllerColumns
        resb 2
ControllerSlotTeam:                             ; controller slot table: team; used by ControllerScreen,
                                                ; DrawControllerColumns
        resb 2
ControllerSlotIcon:                             ; controller slot table: icon art; used by ControllerScreen,
                                                ; DrawControllerColumns, DrawControllerIcons
        resb 4
ControllerPadIcons:                             ; controller pad flags and icon art; used by ControllerScreen,
                                                ; DrawControllerIcons
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
        resb 4
ControllerColumnArt:                            ; controller column art; used by ControllerScreen,
                                                ; DrawControllerColumns, SetControllerColumn ...
        resb 4
ControllerBackBmp:                              ; controller screen background bitmap; used by
                                                ; ControllerScreen, DrawControllerColumns
        resb 4
ControllerIconArt:                              ; controller icon art; used by ControllerScreen,
                                                ; DrawControllerColumns, SetControllerIcon
        resb 4
ControllerDragSlot:                             ; controller slot being dragged (-1 for none); used by
                                                ; ControllerScreen, DrawControllerColumns, DrawControllerIcons
        resb 2
ControllerDragIcon:                             ; controller icon being dragged (-1 for none); used by
                                                ; ControllerScreen, DrawControllerColumns, DrawControllerIcons
        resb 2
