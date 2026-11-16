; The game camera: its path polynomials and the camera shots (96 PC).
bits 32
%include "hockey.inc"
section s_5D707 progbits alloc exec nowrite align=1
extern dword_179D48, dword_179E0B, dword_179E0F, dword_179E13, dword_179E17, dword_179E1B, unk_179CCC, unk_179CE4
extern unk_179CFC, unk_179D14, unk_179D2C, word_179E0D, word_179E11
global CameraPathCoeffs, CameraPathEval, CameraPathEval_70, CameraPathSlope, CameraPathCurve, CameraPathPoint
;-----------------------------------------------------------------------------
; CameraPathCoeffs                                5D707  96 PC, low confidence
; The coefficients of one camera path polynomial
;-----------------------------------------------------------------------------
CameraPathCoeffs:
        push esi
        push edi
        enter 0Ch, 0
        mov esi, eax
        mov eax, dword [byte ebp+010h]
        imul edi, esi, byte 0FFFFFFFAh
        mov dword [byte ebp-08h], edi
        imul edi, edx, byte 6
        mov dword [byte ebp-0Ch], edi
        mov edi, dword [byte ebp-08h]
        add edi, dword [byte ebp-0Ch]
        mov dword [byte ebp-08h], edi
        lea edi, [ebx+ebx*2]
        mov dword [byte ebp-0Ch], edi
        mov edi, dword [byte ebp-08h]
        sub edi, dword [byte ebp-0Ch]
        mov dword [byte ebp-08h], edi
        mov edi, ecx
        sar edi, 1
        mov dword [byte ebp-0Ch], edi
        mov edi, dword [byte ebp-08h]
        sub edi, dword [byte ebp-0Ch]
        mov dword [eax], edi
        imul edi, esi, byte 0Fh
        mov dword [byte ebp-04h], edi
        imul edi, edx, byte 0Fh
        imul edx, byte 0Ah
        mov dword [byte ebp-08h], edi
        mov edi, dword [byte ebp-04h]
        sub edi, dword [byte ebp-08h]
        mov dword [byte ebp-08h], edi
        mov edi, ebx
        shl edi, 3
        mov dword [byte ebp-04h], edi
        mov edi, dword [byte ebp-08h]
        lea ecx, [ecx+ecx*2]
        add edi, dword [byte ebp-04h]
        sar ecx, 1
        add edi, ecx
        add eax, byte 4
        mov dword [eax], edi
        imul edi, esi, byte 0FFFFFFF6h
        add edi, edx
        imul edx, ebx, byte 6
        sub edi, edx
        mov edx, edi
        add eax, byte 4
        sub edx, ecx
        mov dword [eax], edx
        add eax, byte 4
        mov edx, dword [byte ebp-0Ch]
        mov dword [eax], edx
        add eax, byte 4
        mov dword [eax], ebx
        add eax, byte 4
        mov dword [eax], esi
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; CameraPathEval                               5D7A2  96 PC, medium confidence
; (coeffs, t): a 5th-degree polynomial in 16.16 by Horner's rule
;-----------------------------------------------------------------------------
CameraPathEval:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        mov eax, dword [eax]
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, ebx
        mov eax, dword [eax]
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, ebx
        mov eax, dword [eax]
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, ebx
        mov eax, dword [eax]
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, ebx
        mov eax, dword [eax]
CameraPathEval_70:
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add eax, dword [ebx]
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CameraPathSlope                              5D82C  96 PC, medium confidence
; (coeffs, t): its first derivative (5, 4, 3, 2)
;-----------------------------------------------------------------------------
CameraPathSlope:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        imul eax, dword [eax], byte 5
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [ebx]
        shl edx, 2
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        imul edx, dword [ebx], byte 3
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [ebx]
        add edx, edx
        jmp short CameraPathEval_70
;-----------------------------------------------------------------------------
; CameraPathCurve                              5D87E  96 PC, medium confidence
; (coeffs, t): its second derivative (20, 12, 6, 2)
;-----------------------------------------------------------------------------
CameraPathCurve:
        push ebx
        push ecx
        mov ebx, eax
        mov ecx, edx
        imul eax, dword [eax], byte 14h
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        imul edx, dword [ebx], byte 0Ch
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        imul edx, dword [ebx], byte 6
        add eax, edx
        mov edx, ecx
        add ebx, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [ebx]
        add edx, edx
        add eax, edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; CameraPathPoint                              5D8D1  96 PC, medium confidence
; Evaluates the 5 camera path polynomials at dword_179D48 into the camera
; position and angles (dword_179E0B-179E1B)
;-----------------------------------------------------------------------------
CameraPathPoint:
        push edx
        mov eax, unk_179CCC
        mov edx, dword [dword_179D48]
        call CameraPathEval
        mov edx, dword [dword_179D48]
        mov dword [dword_179E13], eax
        mov eax, unk_179CE4
        call CameraPathEval
        mov edx, dword [dword_179D48]
        mov dword [dword_179E17], eax
        mov eax, unk_179CFC
        call CameraPathEval
        mov edx, dword [dword_179D48]
        mov dword [dword_179E1B], eax
        mov eax, unk_179D14
        call CameraPathEval
        mov edx, dword [dword_179D48]
        mov dword [dword_179E0B], eax
        mov eax, unk_179D2C
        call CameraPathEval
        mov dword [dword_179E0F], eax
        cmp dword [dword_179E0B], 8000h
        jle short .1
        sub dword [dword_179E0B], 10000h
        jmp short .2
.1:
        cmp dword [dword_179E0B], 0FFFF8000h
        jge short .2
        inc word [word_179E0D]
.2:
        cmp dword [dword_179E0F], 8000h
        jle short .3
        sub dword [dword_179E0F], 10000h
        pop edx
        ret
.3:
        cmp dword [dword_179E0F], 0FFFF8000h
        jge short .4
        inc word [word_179E11]
.4:
        pop edx
        ret
