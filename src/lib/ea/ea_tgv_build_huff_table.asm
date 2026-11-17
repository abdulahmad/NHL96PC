; TGV movie decoder: BuildHuffTable, DecodeHuffRuns, TgvDecodeDeltaFrame, TgvDecodeKeyFrame and 7 more.
bits 32
%include "hockey.inc"
section s_C1883 progbits alloc exec nowrite align=1
extern AllocMemBlock, DebugMode, DebugSetLine, DrawClipBottom, DrawClipLeft, DrawClipRight, DrawClipTop, FatalError
extern FreeMemBlock, GatherPlaneBytes, GetTicks, PrintBoxedText, ReturnZero, ScreenBuffer, ScreenPitch, str_RateDDAvgDD
extern str_TGV, str_TgvdecodeInvalidChunkTyp, TgvCopyBlock, TgvFillBlock, TgvFirstPeriod, TgvFrameRate, TgvFrames, TgvRateTicks
extern TgvTotalFrames, TgvTotalTicks, UnpackTo, WriteSequencerReg
global BuildHuffTable, DecodeHuffRuns, TgvDecodeDeltaFrame, TgvDecodeKeyFrame, TgvAllocDecoder, TgvDecodeFrame, TgvFreeDecoder, TgvShowFrameRate
global TgvShowFrameRateQuiet, TgvResetFrameRate, TgvBlitFrame
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; BuildHuffTable                                  C1890  96 PC, low confidence
; TGV video: builds a Huffman decoding table
;-----------------------------------------------------------------------------
BuildHuffTable:
        push esi
        push edi
        push ebp
        sub esp, byte 14h
        mov esi, eax
        mov dword [esp], edx
        mov edi, ebx
        mov dword [byte esp+010h], ecx
        lea eax, [byte ebx-01h]
        imul eax, ecx
        lea edx, [nosplit ebx*4+00h]
        mov ebx, 1
        dec ecx
        shl ebx, cl
        mov cl, byte [byte esp+010h]
        mov dword [byte esp+08h], ebx
        mov ebx, 0FFFFFFFFh
        shl ebx, cl
        add edx, esi
        mov dword [byte esp+04h], ebx
        xor ebx, ebx
        test edi, edi
        jle short .3
        mov esi, 1
        shl esi, cl
        lea ecx, [byte esi-01h]
        mov dword [byte esp+0Ch], ecx
.1:
        mov esi, eax
        mov ecx, dword [esp]
        sar esi, 3
        add esi, ecx
        mov ecx, eax
        mov esi, dword [esi]
        and ecx, byte 7
        shr esi, cl
        mov ecx, esi
        mov esi, dword [byte esp+0Ch]
        mov ebp, dword [byte esp+010h]
        and ecx, esi
        mov esi, dword [byte esp+08h]
        sub eax, ebp
        test ecx, esi
        je short .2
        or ecx, dword [byte esp+04h]
.2:
        inc ebx
        mov dword [byte edx-04h], ecx
        sub edx, byte 4
        cmp ebx, edi
        jl short .1
.3:
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; DecodeHuffRuns                                  C1920  96 PC, low confidence
; TGV video: decodes Huffman coded runs
;-----------------------------------------------------------------------------
DecodeHuffRuns:
        push esi
        push edi
        push ebp
        mov eax, dword [byte esp+010h]
        mov edx, dword [byte esp+014h]
        mov ebp, dword [byte esp+018h]
        xor esi, esi
        test ebp, ebp
        jle near .2
.1:
        mov ebx, dword [byte eax+04h]
        mov edi, ebx
        shr edi, 1Eh
        and edi, byte 3
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 1Ch
        and edi, byte 3
        mov byte [edx], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 1Ah
        and edi, byte 3
        mov byte [byte edx+01h], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 18h
        and edi, byte 3
        mov byte [byte edx+02h], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 16h
        and edi, byte 3
        mov byte [byte edx+03h], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 14h
        and edi, byte 3
        mov byte [byte edx+04h], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 12h
        and edi, byte 3
        mov byte [byte edx+05h], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 10h
        and edi, byte 3
        mov byte [byte edx+06h], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 0Eh
        and edi, byte 3
        mov byte [byte edx+07h], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 0Ch
        and edi, byte 3
        mov byte [byte edx+08h], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 0Ah
        and edi, byte 3
        mov byte [byte edx+09h], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 8
        and edi, byte 3
        mov byte [byte edx+0Ah], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 6
        and edi, byte 3
        mov byte [byte edx+0Bh], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 4
        and edi, byte 3
        mov byte [byte edx+0Ch], cl
        mov cl, byte [edi+eax]
        mov edi, ebx
        shr edi, 2
        add eax, byte 8
        and edi, byte 3
        mov byte [byte edx+0Dh], cl
        mov cl, byte [byte edi+eax-08h]
        and ebx, byte 3
        mov byte [byte edx+0Eh], cl
        add edx, byte 10h
        mov bl, byte [byte ebx+eax-08h]
        inc esi
        mov byte [byte edx-01h], bl
        cmp esi, ebp
        jl near .1
.2:
        pop ebp
        pop edi
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; TgvDecodeDeltaFrame                          C1A2C  96 PC, medium confidence
; Decodes a TGV video delta frame with its Huffman coded blocks
;-----------------------------------------------------------------------------
TgvDecodeDeltaFrame:
        push esi
        push edi
        push ebp
        sub esp, byte 28h
        mov ebp, dword [byte esp+038h]
        mov esi, dword [byte esp+03Ch]
        mov edx, 1
        mov eax, dword [byte ebp+00h]
        mov ecx, 2
        mov dword [esp], eax
        mov eax, dword [byte ebp+04h]
        mov dword [byte esp+014h], edx
        mov dword [byte esp+08h], eax
        mov eax, dword [byte ebp+028h]
        mov edx, dword [byte ebp+02Ch]
        mov dword [byte ebp+02Ch], eax
        lea eax, [byte esi+08h]
        mov dword [byte ebp+028h], edx
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov ecx, 2
        mov edx, eax
        mov dword [byte esp+018h], eax
        mov dword [byte ebp+010h], eax
        lea eax, [byte esi+0Ah]
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov ecx, 2
        mov dword [byte esp+010h], eax
        mov dword [byte ebp+014h], eax
        lea eax, [byte esi+0Ch]
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov ecx, 2
        mov dword [byte esp+0Ch], eax
        mov dword [byte ebp+018h], eax
        lea eax, [byte esi+0Eh]
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov dword [byte esp+04h], eax
        mov dword [byte ebp+01Ch], eax
        test edx, edx
        je near .6
        cmp edx, dword [byte ebp+020h]
        jle short .2
        mov ecx, dword [byte ebp+03Ch]
        test ecx, ecx
        je short .1
        push ecx
        call FreeMemBlock
        mov dword [byte ebp+03Ch], 0
        add esp, byte 4
        mov dword [byte ebp+020h], 0
.1:
        mov eax, dword [byte ebp+040h]
        test eax, eax
        je short .2
        push eax
        call FreeMemBlock
        add esp, byte 4
        mov dword [byte ebp+040h], 0
.2:
        mov ebx, dword [byte ebp+03Ch]
        test ebx, ebx
        jne short .3
        mov eax, dword [byte esp+018h]
        push ebx
        shl eax, 3
        push eax
        push str_TGV
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [byte ebp+03Ch], eax
        mov eax, dword [byte esp+018h]
        mov dword [byte ebp+020h], eax
.3:
        mov ecx, dword [byte ebp+040h]
        test ecx, ecx
        jne short .4
        mov eax, dword [byte esp+018h]
        push ecx
        shl eax, 2
        push eax
        push str_TGV
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [byte ebp+040h], eax
        mov eax, dword [byte esp+018h]
        mov dword [byte ebp+020h], eax
.4:
        mov edi, dword [byte ebp+03Ch]
        test edi, edi
        jne short .5
        mov dword [byte esp+014h], edi
.5:
        mov edx, dword [byte ebp+040h]
        test edx, edx
        jne short .6
        mov dword [byte esp+014h], edx
.6:
        mov edi, dword [byte esp+010h]
        add edi, dword [byte esp+0Ch]
        je short .9
        cmp edi, dword [byte ebp+024h]
        jle short .7
        mov edx, dword [byte ebp+038h]
        test edx, edx
        je short .7
        push edx
        call FreeMemBlock
        add esp, byte 4
        mov dword [byte ebp+038h], 0
.7:
        mov ecx, dword [byte ebp+038h]
        test ecx, ecx
        jne short .8
        mov eax, edi
        push ecx
        shl eax, 4
        push eax
        push str_TGV
        call AllocMemBlock
        mov dword [byte ebp+038h], eax
        add esp, byte 0Ch
        mov dword [byte ebp+024h], edi
.8:
        mov edi, dword [byte ebp+038h]
        test edi, edi
        jne short .9
        mov dword [byte esp+014h], edi
.9:
        cmp dword [byte esp+014h], byte 0
        je near .15
        mov edx, dword [byte esp+018h]
        lea eax, [nosplit edx*4+00h]
        add eax, edx
        shl eax, 2
        mov ecx, 0Ah
        add eax, byte 1Fh
        add esi, byte 14h
        and al, 0E0h
        lea ebx, [edx+edx]
        sar eax, 3
        mov edx, esi
        mov dword [byte esp+01Ch], eax
        mov eax, dword [byte ebp+03Ch]
        call BuildHuffTable
        mov eax, dword [byte esp+08h]
        mov edx, dword [byte ebp+034h]
        shl eax, 2
        mov dword [byte esp+020h], esi
        add edx, eax
        mov ebx, dword [byte esp+018h]
        mov dword [byte esp+024h], edx
        test ebx, ebx
        jle short .11
        lea ecx, [nosplit ebx*4+00h]
        xor eax, eax
        xor edi, edi
.10:
        mov ebx, dword [byte ebp+03Ch]
        mov edx, dword [byte edi+ebx+04h]
        mov esi, dword [byte esp+024h]
        shl edx, 2
        add edx, esi
        add eax, byte 4
        mov edx, dword [edx]
        mov esi, dword [edi+ebx]
        mov ebx, dword [byte ebp+040h]
        add edx, esi
        add edi, byte 8
        mov dword [byte ebx+eax-04h], edx
        cmp eax, ecx
        jl short .10
.11:
        mov eax, dword [byte esp+01Ch]
        mov edi, dword [byte esp+020h]
        add edi, eax
        mov eax, dword [byte esp+010h]
        shl eax, 4
        mov dword [byte esp+020h], edi
        mov dword [byte esp+01Ch], eax
        test eax, eax
        je short .12
        mov esi, dword [byte esp+020h]
        mov ecx, eax
        mov edi, dword [byte ebp+038h]
        rep movsb
.12:
        mov eax, dword [byte esp+01Ch]
        mov edx, dword [byte esp+020h]
        add edx, eax
        mov eax, dword [byte esp+0Ch]
        shl eax, 3
        mov dword [byte esp+020h], edx
        mov dword [byte esp+01Ch], eax
        test eax, eax
        je short .13
        mov ecx, dword [byte esp+0Ch]
        mov eax, dword [byte esp+010h]
        mov edx, dword [byte ebp+038h]
        shl eax, 4
        push ecx
        add eax, edx
        push eax
        mov esi, dword [byte esp+028h]
        push esi
        call DecodeHuffRuns
        add esp, byte 0Ch
.13:
        mov eax, dword [byte esp+01Ch]
        mov edi, dword [byte esp+020h]
        mov edx, dword [byte esp+08h]
        add edi, eax
        mov eax, dword [esp]
        imul eax, edx
        mov edx, dword [byte esp+04h]
        sar eax, 4
        imul edx, eax
        add edx, byte 1Fh
        and dl, 0E0h
        sar edx, 3
        mov dword [byte esp+020h], edi
        mov dword [byte esp+01Ch], edx
        test edx, edx
        je short .14
        mov ecx, dword [byte esp+04h]
        push ecx
        push eax
        push edi
        mov edi, dword [byte ebp+030h]
        push edi
        call TgvCopyBlock
        add esp, byte 10h
.14:
        mov eax, dword [byte ebp+04h]
        sar eax, 2
        push eax
        mov eax, dword [byte ebp+00h]
        sar eax, 2
        push eax
        mov eax, dword [byte ebp+00h]
        push eax
        mov edx, dword [byte ebp+038h]
        push edx
        mov ebx, dword [byte ebp+040h]
        push ebx
        mov ecx, dword [byte ebp+010h]
        mov eax, dword [byte ebp+028h]
        push ecx
        add eax, byte 10h
        push eax
        mov eax, dword [byte ebp+02Ch]
        add eax, byte 10h
        push eax
        mov esi, dword [byte ebp+030h]
        push esi
        call TgvFillBlock
        add esp, byte 24h
.15:
        mov eax, dword [byte esp+014h]
        add esp, byte 28h
        pop ebp
        pop edi
        pop esi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; TgvDecodeKeyFrame                            C1D48  96 PC, medium confidence
; Decodes a TGV video key frame
;-----------------------------------------------------------------------------
TgvDecodeKeyFrame:
        push esi
        push edi
        push ebp
        sub esp, byte 14h
        mov esi, dword [byte esp+024h]
        mov eax, dword [byte esp+028h]
        mov ecx, 2
        add eax, byte 8
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov dword [byte esp+010h], eax
        mov dword [esi], eax
        mov eax, dword [byte esp+028h]
        mov ecx, 2
        add eax, byte 0Ah
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov dword [byte esp+0Ch], eax
        mov dword [byte esi+04h], eax
        mov eax, dword [byte esp+028h]
        mov ecx, 2
        add eax, byte 0Ch
        xor edx, edx
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov dword [byte esi+08h], eax
        mov eax, dword [byte esp+028h]
        mov ecx, 2
        add eax, byte 0Eh
        mov dword [byte esp+04h], edx
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        mov ebp, eax
        mov dword [byte esi+0Ch], eax
        test eax, eax
        jle short .2
        mov eax, dword [byte esp+028h]
        mov edi, esi
.1:
        mov bl, byte [byte eax+014h]
        mov byte [byte edi+044h], bl
        mov bl, byte [byte eax+015h]
        add eax, byte 3
        mov byte [byte edi+045h], bl
        add edi, byte 3
        mov bl, byte [byte eax+013h]
        inc edx
        mov byte [byte edi+043h], bl
        cmp edx, ebp
        jl short .1
.2:
        mov eax, dword [byte esp+010h]
        imul eax, dword [byte esp+0Ch]
        add eax, byte 3
        and al, 0FCh
        mov ecx, dword [byte esi+028h]
        mov edi, eax
        test ecx, ecx
        je short .3
        push ecx
        call FreeMemBlock
        add esp, byte 4
        mov dword [byte esi+028h], 0
.3:
        mov edx, dword [byte esi+02Ch]
        test edx, edx
        je short .4
        push edx
        call FreeMemBlock
        add esp, byte 4
        mov dword [byte esi+02Ch], 0
.4:
        mov ecx, dword [byte esi+034h]
        test ecx, ecx
        je short .5
        push ecx
        call FreeMemBlock
        add esp, byte 4
        mov dword [byte esi+034h], 0
.5:
        mov edx, dword [byte esi+030h]
        test edx, edx
        je short .6
        push edx
        call FreeMemBlock
        add esp, byte 4
        mov dword [byte esi+030h], 0
.6:
        push byte 0
        lea eax, [byte edi+010h]
        push eax
        push str_TGV
        mov dword [byte esp+0Ch], eax
        call AllocMemBlock
        add esp, byte 0Ch
        push byte 0
        mov dword [byte esi+028h], eax
        mov eax, dword [byte esp+04h]
        push eax
        push str_TGV
        call AllocMemBlock
        add esp, byte 0Ch
        mov dword [byte esi+02Ch], eax
        mov eax, dword [byte esp+0Ch]
        push byte 0
        shl eax, 3
        push eax
        push str_TGV
        mov dword [byte esp+014h], eax
        call AllocMemBlock
        mov edx, edi
        mov dword [byte esi+034h], eax
        mov eax, edi
        sar edx, 1Fh
        shl edx, 4
        LD sbb, eax, edx
        sar eax, 4
        add esp, byte 0Ch
        push byte 0
        shl eax, 2
        push eax
        push str_TGV
        call AllocMemBlock
        add esp, byte 0Ch
        mov ebx, dword [byte esi+028h]
        mov dword [byte esi+030h], eax
        test ebx, ebx
        je near .9
        cmp dword [byte esi+02Ch], byte 0
        je near .9
        cmp dword [byte esi+034h], byte 0
        je near .9
        test eax, eax
        je near .9
        mov ecx, 10h
        mov edi, ebx
        xor eax, eax
        rep stosb
        mov eax, dword [byte esi+028h]
        mov byte [eax], 0
        mov eax, dword [byte esi+028h]
        or byte [eax], 7Bh
        mov eax, dword [byte esi+028h]
        mov edx, dword [byte esp+010h]
        mov word [byte eax+04h], dx
        mov eax, dword [byte esi+028h]
        mov edx, dword [byte esp+0Ch]
        mov word [byte eax+06h], dx
        mov ecx, 10h
        mov edi, dword [byte esi+02Ch]
        xor eax, eax
        rep stosb
        mov eax, dword [byte esi+02Ch]
        mov byte [eax], 0
        mov eax, dword [byte esi+02Ch]
        or byte [eax], 7Bh
        mov eax, dword [byte esi+02Ch]
        mov edx, dword [byte esp+010h]
        mov word [byte eax+04h], dx
        mov edi, dword [byte esp+0Ch]
        mov eax, dword [byte esi+02Ch]
        mov edx, dword [byte esp+0Ch]
        neg edi
        mov word [byte eax+06h], dx
        imul edi, dword [byte esp+010h]
        mov ebx, dword [byte esp+08h]
        xor eax, eax
        test ebx, ebx
        jle short .8
.7:
        mov edx, dword [byte esi+034h]
        mov dword [edx+eax], edi
        mov edx, dword [byte esp+010h]
        add eax, byte 4
        add edi, edx
        cmp eax, ebx
        jl short .7
.8:
        mov eax, dword [byte esi+028h]
        add eax, byte 10h
        lea edx, [nosplit ebp*4+00h]
        push eax
        mov eax, dword [byte esp+02Ch]
        sub edx, ebp
        add eax, byte 14h
        add eax, edx
        push eax
        call UnpackTo
        mov ebx, 1
        add esp, byte 8
        mov dword [byte esp+04h], ebx
.9:
        mov eax, dword [byte esp+04h]
        add esp, byte 14h
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; TgvAllocDecoder                              C1FC0  96 PC, medium confidence
; Allocates and clears a TGV video decoder
;-----------------------------------------------------------------------------
TgvAllocDecoder:
        push edi
        push byte 0
        push dword 344h
        push str_TGV
        call AllocMemBlock
        mov edi, eax
        add esp, byte 0Ch
        mov edx, eax
        test eax, eax
        je short .1
        mov ecx, 344h
        xor eax, eax
        rep stosb
.1:
        mov eax, edx
        pop edi
        ret
        db 08Bh,0C0h
;-----------------------------------------------------------------------------
; TgvDecodeFrame                               C1FEC  96 PC, medium confidence
; Decodes one TGV video frame chunk, key or delta
;-----------------------------------------------------------------------------
TgvDecodeFrame:
        push esi
        mov esi, dword [byte esp+08h]
        mov edx, dword [byte esp+0Ch]
        mov ecx, 4
        mov eax, edx
        mov eax, dword [byte ecx+eax-04h]
        neg ecx
        lea ecx, [nosplit ecx*8+020h]
        shr eax, cl
        cmp eax, 54475666h
        jb short .2
        jbe short .1
        cmp eax, 5447566Bh
        jne short .2
        push edx
        push esi
        call TgvDecodeKeyFrame
        add esp, byte 8
        mov eax, dword [byte esi+028h]
        pop esi
        ret
.1:
        push edx
        push esi
        call TgvDecodeDeltaFrame
        add esp, byte 8
        mov eax, dword [byte esi+028h]
        pop esi
        ret
.2:
        push str_TgvdecodeInvalidChunkTyp
        call FatalError
        add esp, byte 4
        mov eax, dword [byte esi+028h]
        pop esi
        ret
        db 090h
;-----------------------------------------------------------------------------
; TgvFreeDecoder                               C204C  96 PC, medium confidence
; Frees a TGV video decoder and its buffers
;-----------------------------------------------------------------------------
TgvFreeDecoder:
        push esi
        push ebp
        mov esi, dword [byte esp+0Ch]
        test esi, esi
        je near .8
        mov edx, dword [byte esi+038h]
        test edx, edx
        je short .1
        push edx
        call FreeMemBlock
        add esp, byte 4
.1:
        mov ecx, dword [byte esi+03Ch]
        test ecx, ecx
        je short .2
        push ecx
        call FreeMemBlock
        add esp, byte 4
.2:
        mov ebp, dword [byte esi+040h]
        test ebp, ebp
        je short .3
        push ebp
        call FreeMemBlock
        add esp, byte 4
.3:
        mov edx, dword [byte esi+028h]
        test edx, edx
        je short .4
        push edx
        call FreeMemBlock
        add esp, byte 4
.4:
        mov ecx, dword [byte esi+02Ch]
        test ecx, ecx
        je short .5
        push ecx
        call FreeMemBlock
        add esp, byte 4
.5:
        mov ebp, dword [byte esi+034h]
        test ebp, ebp
        je short .6
        push ebp
        call FreeMemBlock
        add esp, byte 4
.6:
        mov edx, dword [byte esi+030h]
        test edx, edx
        je short .7
        push edx
        call FreeMemBlock
        add esp, byte 4
.7:
        push esi
        call FreeMemBlock
        add esp, byte 4
.8:
        pop ebp
        pop esi
        ret
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; TgvShowFrameRate                             C20E0  96 PC, medium confidence
; Counts frames and prints the playback rate and average
;-----------------------------------------------------------------------------
TgvShowFrameRate:
        push esi
        push edi
        push ebp
        inc dword [TgvFrames]
        call GetTicks
        mov ebx, dword [TgvRateTicks]
        mov ecx, eax
        mov esi, dword [byte esp+014h]
        sub ecx, ebx
        mov edi, eax
        cmp ecx, esi
        jl near .3
        mov edx, dword [TgvFrames]
        mov eax, edx
        shl eax, 5
        sub eax, edx
        shl eax, 2
        add edx, eax
        shl edx, 3
        mov eax, edx
        sar edx, 1Fh
        idiv ecx
        mov edx, eax
        mov esi, 0Ah
        shl edx, 10h
        mov ebx, eax
        mov eax, edx
        sar edx, 1Fh
        idiv esi
        mov ebp, dword [TgvTotalFrames]
        mov dword [TgvFrameRate], eax
        add ebp, dword [TgvFrames]
        mov eax, dword [TgvTotalTicks]
        add eax, ecx
        mov dword [TgvTotalFrames], ebp
        mov dword [TgvTotalTicks], eax
        cmp ebp, 186A0h
        jle short .1
        mov ecx, ebp
        mov esi, eax
        sar ecx, 1
        sar esi, 1
        mov dword [TgvTotalFrames], ecx
        mov dword [TgvTotalTicks], esi
.1:
        cmp dword [TgvFirstPeriod], byte 0
        jne short .2
        mov dword [TgvFirstPeriod], eax
.2:
        mov edx, dword [TgvTotalFrames]
        mov eax, edx
        shl eax, 5
        sub eax, edx
        shl eax, 2
        add edx, eax
        shl edx, 3
        mov ecx, dword [TgvTotalTicks]
        mov eax, edx
        sar edx, 1Fh
        idiv ecx
        mov edx, dword [TgvFirstPeriod]
        mov ecx, eax
        lea eax, [nosplit edx*4+00h]
        sub eax, edx
        add ecx, eax
        sar ecx, 2
        mov esi, 0Ah
        mov edx, ecx
        mov eax, ecx
        sar edx, 1Fh
        idiv esi
        push edx
        mov edx, ecx
        mov eax, ecx
        sar edx, 1Fh
        idiv esi
        push eax
        mov edx, ebx
        mov eax, ebx
        sar edx, 1Fh
        idiv esi
        push edx
        mov edx, ebx
        mov eax, ebx
        sar edx, 1Fh
        idiv esi
        push eax
        push str_RateDDAvgDD
        mov esi, dword [ScreenBuffer]
        push esi
        mov ebp, dword [ScreenPitch]
        push ebp
        mov dword [TgvFirstPeriod], ecx
        call dword [byte esp+02Ch]
        add esp, byte 1Ch
        xor eax, eax
        mov dword [TgvRateTicks], edi
        mov dword [TgvFrames], eax
.3:
        mov eax, dword [TgvFrameRate]
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
        cmp dword [DebugMode], byte 3
        jge short .4
        push dword 3E8h
        push ReturnZero
        jmp short .5
.4:
        push dword 190h
        push DebugSetLine
.5:
        call TgvShowFrameRate
        add esp, byte 8
        ret
;-----------------------------------------------------------------------------
; TgvShowFrameRateQuiet                           C2248  96 PC, low confidence
; Counts a movie frame for the frame rate without printing it (unused)
;-----------------------------------------------------------------------------
TgvShowFrameRateQuiet:
        push byte 0
        push ReturnZero
        call TgvShowFrameRate
        add esp, byte 8
        ret
        push byte 1
        push PrintBoxedText
        call TgvShowFrameRate
        add esp, byte 8
        ret
;-----------------------------------------------------------------------------
; TgvResetFrameRate                            C2268  96 PC, medium confidence
; Resets the frame rate counters
;-----------------------------------------------------------------------------
TgvResetFrameRate:
        xor edx, edx
        mov dword [TgvFrames], edx
        mov dword [TgvTotalFrames], edx
        mov dword [TgvTotalTicks], edx
        mov dword [TgvFrameRate], edx
        call GetTicks
        mov dword [TgvRateTicks], eax
        ret
        db 00h,00h,00h
;-----------------------------------------------------------------------------
; TgvBlitFrame                                 C2290  96 PC, medium confidence
; Copies a decoded TGV frame to the screen, clipped
;-----------------------------------------------------------------------------
TgvBlitFrame:
        push esi
        push edi
        push ebp
        sub esp, byte 1Ch
        mov ebp, dword [byte esp+034h]
        mov ecx, dword [byte esp+02Ch]
        mov eax, dword [byte esp+02Ch]
        mov edx, dword [byte esp+02Ch]
        mov esi, dword [byte esp+030h]
        mov edi, dword [DrawClipTop]
        add ecx, byte 10h
        mov eax, dword [byte eax+02h]
        mov edx, dword [byte edx+04h]
        sub edi, ebp
        sar eax, 10h
        sar edx, 10h
        test edi, edi
        jle short .1
        mov ebx, edi
        imul ebx, eax
        sub edx, edi
        add ebp, edi
        add ecx, ebx
.1:
        mov ebx, dword [DrawClipBottom]
        lea edi, [edx+ebp]
        sub edi, ebx
        test edi, edi
        jle short .2
        sub edx, edi
.2:
        mov edi, dword [DrawClipLeft]
        sub edi, esi
        test edi, edi
        jle short .3
        add ecx, edi
        sub eax, edi
        add esi, edi
.3:
        mov ebx, dword [DrawClipRight]
        lea edi, [esi+eax]
        sub edi, ebx
        test edi, edi
        jle short .4
        sub eax, edi
.4:
        test eax, eax
        jle near .8
        test edx, edx
        jle near .8
        add edx, ebp
        mov dword [byte esp+0Ch], eax
        lea eax, [nosplit edx*4+00h]
        add eax, edx
        shl eax, 6
        mov dword [esp], ecx
        mov dword [byte esp+08h], eax
        lea eax, [nosplit ebp*4+00h]
        mov dword [byte esp+014h], esi
        add eax, ebp
        xor ecx, ecx
        shl eax, 6
        mov dword [byte esp+010h], ecx
        mov dword [byte esp+04h], eax
.5:
        mov ecx, dword [byte esp+014h]
        mov eax, 1
        and ecx, byte 3
        shl eax, cl
        push eax
        push byte 2
        mov esi, dword [byte esp+08h]
        mov edi, dword [byte esp+018h]
        call WriteSequencerReg
        add esp, byte 8
        mov edx, dword [byte esp+014h]
        and dl, 0FCh
        mov eax, edx
        sar edx, 1Fh
        shl edx, 2
        LD sbb, eax, edx
        sar eax, 2
        add esi, edi
        mov edi, dword [byte esp+0Ch]
        mov ebp, eax
        mov eax, dword [byte esp+08h]
        mov ecx, dword [byte esp+04h]
        mov dword [byte esp+018h], eax
        cmp ecx, eax
        jge short .7
.6:
        mov edx, ecx
        mov eax, ecx
        sar edx, 1Fh
        shl edx, 2
        LD sbb, eax, edx
        sar eax, 2
        add eax, 0A0000h
        lea edx, [eax+ebp]
        mov ebx, edi
        mov eax, esi
        call GatherPlaneBytes
        mov eax, dword [byte esp+02Ch]
        mov eax, dword [byte eax+02h]
        add ecx, 140h
        sar eax, 10h
        mov ebx, dword [byte esp+018h]
        add esi, eax
        cmp ecx, ebx
        jl short .6
.7:
        mov ecx, dword [byte esp+0Ch]
        mov esi, dword [byte esp+014h]
        mov edi, dword [byte esp+010h]
        dec ecx
        inc esi
        inc edi
        mov dword [byte esp+0Ch], ecx
        mov dword [byte esp+014h], esi
        mov dword [byte esp+010h], edi
        cmp edi, byte 4
        jl near .5
.8:
        add esp, byte 1Ch
        pop ebp
        pop edi
        pop esi
        ret
        db 08Dh,040h,00h
        mov edx, dword [byte esp+04h]
        mov eax, dword [byte edx+0Ch]
        sar eax, 10h
        push eax
        mov eax, dword [byte edx+0Ah]
        sar eax, 10h
        push eax
        push edx
        call TgvBlitFrame
        add esp, byte 0Ch
        ret
        mov edx, dword [byte esp+04h]
        mov eax, dword [byte edx+08h]
        mov ebx, dword [byte esp+0Ch]
        sar eax, 10h
        sub ebx, eax
        push ebx
        mov eax, dword [byte edx+06h]
        mov ebx, dword [byte esp+0Ch]
        sar eax, 10h
        sub ebx, eax
        push ebx
        push edx
        call TgvBlitFrame
        add esp, byte 0Ch
        ret
