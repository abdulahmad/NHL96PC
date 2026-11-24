; BSS of front/line_draw (src/front/line_draw).
bits 32
%include "hockey.inc"
section s_17DC18 nobits alloc noexec write align=1
global LineClipRight, LineClipBottom, LineSteep, LineClipTop, LineClipLeft, LineErrX, LineErrStepY, LineErrStepX
global LineDeltaX, LineDeltaY, LineX, LineSpanRight, LineSpanBottom, LineSpanTop, LineSpanLeft, LineStepY
global LineErrY, LineColor, LineEndX, LineEndY, LineUserClipBottom, LineUserClipTop, LinePattern
LineClipRight:                                  ; line clip right edge (16.16); used by ClipLineX, ClipLineY,
                                                ; DrawLineY ...
        resb 4
LineClipBottom:                                 ; line clip bottom edge (16.16); used by ClipLineX, ClipLineY,
                                                ; DrawFixedLineClip ...
        resb 4
LineSteep:                                      ; set when the line is steeper than 45 degrees; used by
                                                ; ClipLineX, ClipLineY, DrawFixedLine ...
        resb 4
LineClipTop:                                    ; line clip top edge (16.16); used by ClipLineX, ClipLineY,
                                                ; DrawFixedLineClip ...
        resb 4
LineClipLeft:                                   ; line clip left edge (16.16); used by ClipLineX, ClipLineY,
                                                ; DrawLineY ...
        resb 4
LineErrX:                                       ; error term of a shallow line; used by ClipLineX,
                                                ; DrawFixedLine, DrawFixedLineClip ...
        resb 4
LineErrStepY:                                   ; error step of a steep line; used by ClipLineY,
                                                ; DrawFixedLine, DrawFixedLineClip ...
        resb 4
LineErrStepX:                                   ; error step of a shallow line; used by ClipLineX,
                                                ; DrawFixedLine, DrawFixedLineClip ...
        resb 4
LineDeltaX:                                     ; line x distance (16.16); used by DrawFixedLine,
                                                ; DrawFixedLineClip, DrawLineX ...
        resb 4
LineDeltaY:                                     ; line y distance (16.16); used by DrawFixedLine,
                                                ; DrawFixedLineClip, DrawLineY ...
        resb 4
LineX:                                          ; current x of the line being drawn; used by ClipLineX,
                                                ; DrawFixedLine, DrawFixedLineClip ...
        resb 4
LineSpanRight:                                  ; right edge of a steep line's span (16.16); used by
                                                ; ClipLineY, DrawFixedLine, DrawFixedLineClip ...
        resb 4
LineSpanBottom:                                 ; bottom edge of a flat line's span (16.16); used by
                                                ; ClipLineX, DrawFixedLine, DrawFixedLineClip ...
        resb 4
LineSpanTop:                                    ; top edge of a flat line's span (16.16); used by ClipLineX,
                                                ; DrawFixedLine, DrawFixedLineClip ...
        resb 4
LineSpanLeft:                                   ; left edge of a steep line's span (16.16); used by ClipLineY,
                                                ; DrawFixedLine, DrawFixedLineClip ...
        resb 4
LineStepY:                                      ; y step of the line being drawn; used by ClipLineY,
                                                ; DrawFixedLine, DrawFixedLineClip ...
        resb 4
LineErrY:                                       ; error term of a steep line; used by ClipLineY,
                                                ; DrawFixedLine, DrawFixedLineClip ...
        resb 4
LineColor:                                      ; colour of the line being drawn; used by DrawFixedLine,
                                                ; DrawFixedLineClip, DrawLineX ...
        resb 4
LineEndX:                                       ; line end x (16.16); used by ClipLineX, DrawFixedLine,
                                                ; DrawFixedLineClip ...
        resb 4
LineEndY:                                       ; line end y (16.16); used by ClipLineY, DrawFixedLine,
                                                ; DrawFixedLineClip ...
        resb 4
LineUserClipBottom:                             ; caller line clip bottom (0 for the view); used by
                                                ; DrawFixedLineClip
        resb 4
LineUserClipTop:                                ; caller line clip top (0 for the view); used by
                                                ; DrawFixedLineClip
        resb 4
LinePattern:                                    ; dot pattern of the line being drawn; used by DrawFixedLine,
                                                ; DrawFixedLineClip, DrawLineX ...
        resb 4
