; BSS of front/movie (src/front/movie).
bits 32
%include "hockey.inc"
section s_17C644 nobits alloc noexec write align=1
global TgvFrameBuf, TgvBufSize, TgvFrameCallback, MovieSkipped, TgvFrame, TgvHeaderRead, TgvState, TgvStatus
global TgvChunkLen, TgvAudioOn, TgvVideoOn, tgvpalpending, TgvDataPtr, TgvDataEnd, TgvChunkType, TgvLastFrame
global TgvFramesDecoded, TgvAborted, TgvFileHandle, TgvAudioBuf, TgvAudioPos, TgvVideoBmp, TgvFrameTime, TgvMemBlock
TgvFrameBuf:                                    ; movie frame decode buffer; used by TgvNextFrame,
                                                ; TgvPlayFrames
        resb 768
TgvBufSize:                                     ; size of the movie buffer; used by PlayTGV, TgvOpen
        resb 4
TgvFrameCallback:                               ; routine called for each decoded movie frame; used by
                                                ; PlayMovie, PlayTGV, TgvNextFrame ...
        resb 4
MovieSkipped:                                   ; set when the player skips a movie; used by PlayMovie
        resb 4
TgvFrame:                                       ; current movie frame number; used by TgvNextFrame, TgvOpen
        resb 4
TgvHeaderRead:                                  ; set once the movie header has been read; used by
                                                ; TgvNextFrame, TgvOpen
        resb 4
TgvState:                                       ; movie player state; used by TgvNextFrame, TgvOpen
        resb 4
TgvStatus:                                      ; movie player status code; used by PlayTGV, TgvNextFrame,
                                                ; TgvOpen
        resb 4
TgvChunkLen:                                    ; length of the current movie chunk; used by TgvNextFrame,
                                                ; TgvOpen
        resb 4
TgvAudioOn:                                     ; movie audio track enabled; used by PlayTGV, TgvClock,
                                                ; TgvNextFrame ...
        resb 4
TgvVideoOn:                                     ; movie video track enabled; used by TgvClock, TgvNextFrame,
                                                ; TgvOpen
        resb 4
tgvpalpending:                                  ; the TGV player has a palette chunk for this frame; used by
                                                ; TgvNextFrame, TgvOpen, TgvPlayFrames
        resb 4
TgvDataPtr:                                     ; read pointer into movie data; used by TgvNextFrame, TgvOpen
        resb 4
TgvDataEnd:                                     ; end of the movie data in the buffer; used by PlayTGV,
                                                ; TgvNextFrame
        resb 4
TgvChunkType:                                   ; type of the current movie chunk; used by TgvNextFrame
        resb 4
TgvLastFrame:                                   ; last movie frame number; used by TgvNextFrame
        resb 4
TgvFramesDecoded:                               ; count of decoded movie frames; used by TgvNextFrame, TgvOpen
        resb 4
TgvAborted:                                     ; set when movie playback is aborted; used by PlayMovie,
                                                ; PlayTGV, TgvClock ...
        resb 4
TgvFileHandle:                                  ; open movie file handle; used by PlayTGV, TgvNextFrame,
                                                ; TgvOpen
        resb 4
TgvAudioBuf:                                    ; movie audio buffer; used by TgvNextFrame
        resb 4
TgvAudioPos:                                    ; movie audio buffer position; used by TgvNextFrame
        resb 4
TgvVideoBmp:                                    ; movie video bitmap; used by PlayMovie, TgvNextFrame, TgvOpen
        resb 4
TgvFrameTime:                                   ; time stamp of the current movie frame; used by TgvNextFrame
        resb 4
TgvMemBlock:                                    ; memory block that holds the movie; used by TgvNextFrame,
                                                ; TgvOpen
        resb 4
