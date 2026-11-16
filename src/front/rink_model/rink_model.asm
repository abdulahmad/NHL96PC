; 3D rink: the ice and boards model, its textures and the software 3D renderer of the 96 rink view (96 PC; to be split as it gets named).
bits 32
%include "hockey.inc"
section s_21984 progbits alloc exec nowrite align=1
extern __CHP, byte_1175A4, byte_1175A5, byte_1175A6, byte_1175A7, byte_1175A8, byte_1175A9, byte_1175AA
extern byte_1175AB, byte_1175AC, byte_159C57, byte_159C58, byte_159C59, byte_159C5A, byte_159E5F, byte_159E60
extern byte_159E61, byte_15EA03, byte_176F96, byte_17701E, byte_17703B, byte_1770A7, byte_1770B2, byte_1770B3
extern byte_1770B4, byte_1770B5, byte_1770B6, byte_1770D7, dword_1175AD, dword_1175B1, dword_1175B5, dword_1175B9
extern dword_1176DD, dword_1176E1, dword_1176E5, dword_1177EC, dword_1177F0, dword_11A3F8, dword_11F5C0, dword_11F5C4
extern dword_11F5F0, dword_122390, dword_1228D8, dword_1228DC, dword_1228E0, dword_1228E4, dword_1228F8, dword_152FEC
extern dword_158D78, dword_158D7C, dword_158D84, dword_158D88, dword_158D90, dword_158D94, dword_158D9C, dword_158DA0
extern dword_158F24, dword_158F90, dword_159008, dword_159014, dword_15902C, dword_159038, dword_1591CC, dword_1591D0
extern dword_1591D4, dword_159230, dword_159234, dword_159334, dword_159340, dword_15934C, dword_159370, dword_15937C
extern dword_1594B8, dword_1594BC, dword_159530, dword_159534, dword_1595B8, dword_1595BC, dword_1595C0, dword_1595C4
extern dword_1595C8, dword_1595CC, dword_1595D0, dword_159748, dword_15974C, dword_159750, dword_15BDB8, dword_15BE80
extern dword_15CE50, dword_15D0A8, dword_15D0C4, dword_15D0DC, dword_15D1A8, dword_15D1CC, dword_15D238, dword_15D254
extern dword_15D298, dword_15D2A4, dword_15D2A8, dword_15D2B4, dword_15D2B8, dword_15D2BC, dword_15D2C0, dword_15D31C
extern dword_15D338, dword_15D33C, dword_15D344, dword_15D348, dword_15D3C0, dword_15D3C4, dword_15D3C8, dword_15D3CC
extern dword_15D3D0, dword_15D42C, dword_15D448, dword_15D44C, dword_15D454, dword_15D458, dword_15D4D0, dword_15D4D4
extern dword_15DC48, dword_15DD10, dword_15DEA0, dword_15DEDC, dword_15DEE0, dword_15E120, dword_15E124, dword_15E128
extern dword_15E12C, dword_15E430, dword_15E434, dword_15E438, dword_15E43C, dword_15E440, dword_15E444, dword_15E448
extern dword_15E470, dword_15E474, dword_15E478, dword_15E47C, dword_15E480, dword_15E484, dword_15E488, dword_15E48C
extern dword_15E490, dword_15E494, dword_15E498, dword_15E49C, dword_15E4A0, dword_15E4A4, dword_15E4A8, dword_15E4AC
extern dword_15E4B0, dword_15E4B4, dword_15E4B8, dword_15E4BC, dword_15E4C0, dword_15E4C4, dword_15E60C, dword_15E610
extern dword_15E614, dword_15E684, dword_15E688, dword_15E68C, dword_15E690, dword_15E694, dword_15E698, dword_15E69C
extern dword_15E6A0, dword_15E6A4, dword_15E6A8, dword_15E6AC, dword_15E6B0, dword_15E6B4, dword_15E6B8, dword_15E6BC
extern dword_15E6C0, dword_15E6C4, dword_15E6C8, dword_15E6CC, dword_15E6D0, dword_15E6D4, dword_15E6D8, dword_15E6DC
extern dword_15E6E0, dword_15E6E4, dword_15E6E8, dword_15E6EC, dword_15E6F0, dword_15E6F4, dword_15E6F8, dword_15E6FC
extern dword_15E700, dword_15E704, dword_15E708, dword_15E70C, dword_15E710, dword_15E714, dword_15E718, dword_15E71C
extern dword_15E720, dword_15E724, dword_15E728, dword_15E734, dword_15E738, dword_15E73C, dword_15E748, dword_15E74C
extern dword_15E750, dword_15E754, dword_15E758, dword_15E75C, dword_15E760, dword_15E764, dword_15E768, dword_15E76C
extern dword_15E770, dword_15E774, dword_15E778, dword_15E780, dword_15E784, dword_15E788, dword_15E78C, dword_15E790
extern dword_15E794, dword_15E79C, dword_15E7A0, dword_15E7A4, dword_15E7A8, dword_15E7AC, dword_15E7B0, dword_15E7B4
extern dword_15E7B8, dword_15E7BC, dword_15E7C0, dword_15E7C4, dword_15E7C8, dword_15E7CC, dword_15E7D0, dword_15E7D4
extern dword_15E7D8, dword_15E7DC, dword_15E7E0, dword_15E7E4, dword_15E7E8, dword_15E7EC, dword_15E7F0, dword_15E7F4
extern dword_15E7F8, dword_15E7FC, dword_15E800, dword_15E804, dword_15E808, dword_15E80C, dword_15E810, dword_15E814
extern dword_15E818, dword_15E81C, dword_15E820, dword_15E824, dword_15E828, dword_15E82C, dword_15E830, dword_15E834
extern dword_15E838, dword_15E83C, dword_15E840, dword_15E844, dword_15E848, dword_15E84C, dword_15E854, dword_15E858
extern dword_15E85C, dword_15E860, dword_15E864, dword_15E868, dword_15E86C, dword_15E870, dword_15E874, dword_15E878
extern dword_15E87C, dword_15E880, dword_15E884, dword_15E888, dword_15E8B0, dword_15E8B4, dword_15E8B8, dword_15E8BC
extern dword_15E8C0, dword_15E8C4, dword_15E8C8, dword_15E8CC, dword_15E8D0, dword_15E8D4, dword_15E8D8, dword_15E8DC
extern dword_15E8E0, dword_15E8E4, dword_15E8E8, dword_15E8EC, dword_15E8F0, dword_15E8F4, dword_15E8F8, dword_15E8FC
extern dword_15E900, dword_15EA04, dword_15EA08, dword_1770B7, dword_1770BB, dword_1770BF, dword_1770C3, dword_1770C7
extern dword_1770CB, dword_1770CF, dword_1797FC, dword_179800, dword_1798E4, dword_1798E8, dword_17997C, dword_179AC8
extern dword_17DC18, dword_17DC1C, dword_17DC24, dword_17DC28, dword_190E94, dword_190E98, FatalError, FileClose
extern FileCreate, FileWriteAt, gameopts, GetPressedDevice, GetTicks, LoadPackedFile, mousex, mousey
extern PBnum, PutBlock, qword_110786, qword_11078E, randomd0, SetDrawBitmap, SortCords, sprintf_
extern str_B00, str_B0DD, str_B1DD, str_B2DD, str_B3DD, str_B4DD, str_B5DD, str_B6DD
extern str_B7DD, str_B8DD, str_B9DD, str_Back, str_Benchbk, str_Benchbot, str_Benchdiv, str_Benchx
extern str_Benchz0, str_Benchz1, str_Bkgd26, str_Boardback, str_Botboards, str_C00, str_C01, str_C02
extern str_C03, str_Center, str_Crease, str_CrowdD, str_Crud, str_Door00, str_Door01, str_Door02
extern str_Door10, str_Door11, str_Door12, str_DoorZ0, str_DoorZ1, str_EMPTYFSH, str_Faceoff0, str_Faceoff1
extern str_Faceoff2, str_Faceoff3, str_Faceoff4, str_Faceoff5, str_Faceoff6, str_Faceoff7, str_FatBlueLines, str_FatRedLines
extern str_Flatboards, str_FSH2, str_Glass, str_Glassline, str_Glite0, str_Glite1, str_Goal02, str_Goal12
extern str_Grnlite, str_Gt002d, str_Gt004, str_Gt007, str_Gt102d, str_Gt202d, str_Gt302, str_Gt302d
extern str_Gt305, str_HALFFSH, str_Ice, str_ICE2, str_IceFsh, str_IceLine, str_Icelogo, str_ICELOGO2
extern str_Left1, str_Left2, str_Lites, str_Maxx, str_Maxz, str_Minx, str_Minz, str_Net
extern str_Pbench0D, str_Pbench1D, str_Penback, str_Penbot, str_Penbox0D, str_Penbox1D, str_Penboxt0, str_Penboxt1
extern str_Penboxz0, str_Penboxz1, str_Pipe, str_Puck, str_Puckshad, str_R02d, str_Redlite, str_Right1
extern str_Right2, str_Rink, str_Rlite0, str_Rlite1, str_Rlxh, str_Rlxn, str_Rlyh, str_Rlyn
extern str_Rsd0, str_Rsd1, str_Rubber, str_Rubberside, str_Saveback, str_Score, str_SideD, str_SideNotFoundInRink
extern str_SideNotFoundInStands, str_STAND, str_STAND2ND, str_STANDS, str_Stands2, str_STANDSFSH, str_Strobe, str_TEMP2
extern str_ThinRedLines, str_Top, str_Topboards, str_WALL, str_Wedge, str_WHD0, str_Zamboni, str_Zambpath
extern strcat_, strcpy_, sub_1E643, sub_49300, sub_4B38C, sub_4B4F3, sub_59349, sub_625AA
extern sub_64721, sub_64F59, sub_66373, sub_68AB1, sub_69A94, sub_69A9B, sub_77355, sub_873AE
extern sub_87DD6, sub_8805A, sub_AA988, sub_AAA40, sub_AADA4, sub_AB758, sub_ABF4C, sub_AC868
extern sub_AD35C, sub_AD620, sub_AD824, sub_ADBEC, sub_AFD00, sub_B0494, sub_B049E, sub_B20D0
extern sub_B31C0, sub_B74B0, sub_B7810, sub_B78C0, sub_B78DC, sub_B79C8, sub_B79E0, sub_B7A70
extern sub_B81D0, sub_B82F0, sub_B9870, sub_B98E0, sub_B9928, sub_B9A18, sub_B9B34, sub_B9B70
extern sub_B9BB0, sub_B9BD0, sub_B9C08, sub_B9C3C, sub_B9C70, sub_BA2F0, sub_BA344, sub_BA3D0
extern sub_BA420, sub_BA4F0, sub_BA55C, sub_BA5D0, sub_BB384, sub_BB470, sub_BB570, sub_BB924
extern sub_BB9C4, sub_BBAA0, sub_BBB70, sub_BBBD0, sub_BBBF0, sub_BBC04, sub_BBC14, sub_BBC80
extern sub_BBE50, sub_BC040, sub_BC0C4, sub_BC150, sub_BC3A0, sub_BC3F4, sub_BC5C0, sub_BC674
extern sub_BC760, sub_BC7F0, sub_BC838, sub_BD86C, sub_BD9AC, sub_BE6E0, sub_BE8AC, sub_BE926
extern sub_DD6C4, sub_DD8B0, sub_DD8C8, sub_DD908, sub_DD960, sub_DDB68, sub_E04E0, sub_E0520
extern sub_E0898, sub_E0959, sub_E1575, sub_E162A, unk_1175BD, unk_117605, unk_11764D, unk_1176AD
extern unk_1176CD, unk_1176EC, unk_158DA8, unk_158F28, unk_158F48, unk_158F50, unk_158F68, unk_158F70
extern unk_158F88, unk_158FF4, unk_159000, unk_159018, unk_159024, unk_15903C, unk_159108, unk_159148
extern unk_159190, unk_1591D8, unk_159238, unk_159338, unk_159368, unk_159398, unk_1593F8, unk_159458
extern unk_159500, unk_159508, unk_159510, unk_159518, unk_159520, unk_159528, unk_159F58, unk_15AE88
extern unk_15BF20, unk_15D0E0, unk_15D1D0, unk_15D340, unk_15D450, unk_15DB38, unk_15DF20, unk_15E020
extern unk_15E130, unk_15E230, unk_15E330, unk_15E44C, unk_15E4C8, unk_15E534, unk_15E5A0, unk_15E618
extern unk_15E88C, unk_15E904, unk_165258, unk_165354, unpack, vecdist, word_114CE0, word_158D74
extern word_15E472, word_160ACC, word_176FB8, word_176FDA, word_176FFC, word_17704C, word_17706E
global unk_21984, sub_21990, sub_21B35, sub_21BC9, sub_21BC9_19, sub_21BE3, sub_21C1A, sub_21C1A_E1
global sub_21D14, sub_21E3E, sub_2207E, sub_220FB, sub_22159, sub_22159_4F, sub_221AE, sub_22268
global sub_22299, sub_22299_AC, sub_2234B, sub_223BA, sub_2242A, sub_22494, sub_224AE, sub_224AE_8
global sub_224D1, sub_224DB, sub_22522, sub_22669, sub_22669_E, sub_2268D, sub_2269D, sub_2269D_8
global sub_2269D_17, sub_226C7, sub_226E0, sub_226EA, sub_226EA_17, sub_22717, sub_22734, sub_227E2
global sub_227F5, sub_22A3A, sub_22AF0, sub_22B3C, sub_22B3C_1DF, sub_22D27, sub_22DD7, sub_23106
global sub_23218, sub_233A2, sub_23419, sub_23476, sub_235F2, sub_2363D, sub_23656, sub_23656_1A8
global sub_23812, sub_23820, sub_23820_79, sub_238C4, sub_23965, sub_23965_129, sub_23965_167, sub_23AE5
global sub_23AF8, sub_23AF8_C, sub_23B16, sub_23C91, sub_23E06, sub_23E4E, sub_23F05, sub_23F6A
global sub_240F4, sub_240F4_55, sub_2414A, sub_2414A_A4, sub_241F6, sub_243ED, sub_2458D, sub_2458D_23D
global sub_2458D_24C, sub_248B0, sub_249E8, sub_24AA4, sub_24B87, sub_24C7C, sub_24D32, sub_24D32_2C
global sub_24D8C, sub_24D8C_194, sub_24D8C_19A, sub_24D8C_1A0, sub_24D8C_1A3, sub_24D8C_1A4, sub_24F36, sub_24F75
global sub_2500F, sub_2503F, sub_2503F_41, sub_25087, sub_251E6, sub_25226, sub_25502, sub_25820
global sub_2583F, sub_2583F_602, sub_25E4D, sub_25E7B, sub_25E7B_21, jpt_25EA3, sub_25EB3, sub_25EB3_25
global sub_25EB3_32, sub_25EB3_3F, sub_25EB3_61, sub_25EB3_11B, sub_26000, sub_261A6, sub_2751C, sub_2767F
global sub_276B5, sub_278B9, sub_27BF1, sub_27C5E, sub_27E24, sub_27E24_F1, sub_27E24_F6, sub_27F20
global sub_281DC, sub_28327, sub_28327_87, sub_283C1, sub_28459, sub_2849A, sub_28668, sub_28A87
global sub_28C50, sub_28D97, sub_2929F, sub_2976B, sub_297A8, sub_297C9, sub_297EA, sub_299CF
global jpt_299EC, sub_29A14, sub_29A14_27, sub_29A14_3F, sub_29A14_5A, sub_29A14_75, sub_29A14_90, sub_29A14_AB
global sub_29A14_C3, sub_29A14_DB, sub_29A14_F3, sub_29A14_10B, jpt_29B77, sub_29B9F, sub_29B9F_64F, sub_29B9F_66F
global sub_29B9F_68C, sub_29B9F_6AA, sub_29B9F_6C8, sub_29B9F_6FD, sub_29B9F_71E, sub_29B9F_73F, sub_29B9F_761, sub_29B9F_799
global unk_2A3D6, unk_2A3E2, unk_2A3EE, unk_2A3F6, unk_2A402, unk_2A442, unk_2A482, sub_2A502
global sub_2A52F, sub_2A5B5, sub_2A645
unk_21984:
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; sub_21990                                                       21990  96 PC
;-----------------------------------------------------------------------------
sub_21990:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8E8h, 0
        push eax
        mov eax, dword [dword_15E6C0]
        mov esi, dword [dword_15E6B0]
        xor edi, edi
        mov eax, dword [byte eax+02Ch]
        add esi, byte 10h
        add eax, byte 10h
        mov dword [byte ebp-08h], edi
        mov dword [byte ebp-04h], eax
.1:
        call sub_E0898
        mov ebx, 1F40h
        xor edx, edx
        div ebx
        mov eax, 0FA0h
        sub eax, edx
        mov edx, dword [byte ebp-08h]
        add dword [byte ebp-08h], byte 4
        mov dword [dword edx+ebp-08E8h], eax
        cmp dword [byte ebp-08h], 8D4h
        jne short .1
        mov dword [byte ebp-0Ch], 0
        jmp near .8
.2:
        mov dword [byte ebp-010h], 0
        jmp near .7
.3:
        cmp byte [esi], 0
        je near .5
        cmp dword [dword ebp-08ECh], byte 0
        je near .5
        mov eax, edi
        mov edx, dword [dword ebp-08ECh]
        add edx, dword [dword ebp+eax*4-08E8h]
        movzx eax, byte [esi]
        lea eax, [eax+eax*2]
        movzx eax, byte [dword eax+byte_159C58]
        sub eax, dword [dword_15E6D4]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, dword [dword_15E6D4]
        inc edi
        add ebx, eax
        mov eax, edi
        mov edx, dword [dword ebp-08ECh]
        add edx, dword [dword ebp+eax*4-08E8h]
        movzx eax, byte [esi]
        lea eax, [eax+eax*2]
        movzx eax, byte [dword eax+byte_159C59]
        sub eax, dword [dword_15E6C4]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, dword [dword_15E6C4]
        inc edi
        add ecx, eax
        mov eax, edi
        mov edx, dword [dword ebp-08ECh]
        add edx, dword [dword ebp+eax*4-08E8h]
        movzx eax, byte [esi]
        lea eax, [eax+eax*2]
        movzx eax, byte [dword eax+byte_159C5A]
        sub eax, dword [dword_15E6CC]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [dword_15E6CC]
        add edx, eax
        inc edi
        mov dword [byte ebp-014h], edx
        cmp ebx, 0FFh
        jle short .4
        mov ebx, 0FFh
.4:
        mov eax, ecx
        shl ebx, 10h
        shl eax, 8
        add eax, ebx
        add eax, dword [byte ebp-014h]
        push eax
        call sub_B31C0
        mov edx, dword [byte ebp-04h]
        add esp, byte 4
        mov byte [edx], al
        cmp edi, 232h
        jl short .6
        xor edi, edi
        jmp short .6
.5:
        mov edx, dword [byte ebp-04h]
        mov al, byte [dword_15E810]
        mov byte [edx], al
.6:
        inc dword [byte ebp-010h]
        inc dword [byte ebp-04h]
        inc esi
.7:
        mov eax, dword [dword_15E6C0]
        mov eax, dword [byte eax+02Ch]
        movsx eax, word [byte eax+06h]
        cmp eax, dword [byte ebp-010h]
        jg near .3
        inc dword [byte ebp-0Ch]
.8:
        mov eax, dword [dword_15E6C0]
        mov eax, dword [byte eax+02Ch]
        movsx eax, word [byte eax+04h]
        cmp eax, dword [byte ebp-0Ch]
        jg near .2
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_21B35                                                       21B35  96 PC
;-----------------------------------------------------------------------------
sub_21B35:
        push esi
        push edi
        enter 64h, 0
        mov eax, dword [byte ebp+014h]
        mov esi, dword [eax]
        mov ebx, dword [dword_190E94]
        shl esi, 3
        lea edi, [byte ebp-028h]
        add esi, ebx
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        mov edx, dword [dword_190E98]
        lea edi, [byte ebp-064h]
        add esi, edx
        add eax, byte 4
        movsd
        movsd
        movsd
        mov esi, dword [eax]
        shl esi, 3
        lea edi, [byte ebp-020h]
        add esi, ebx
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        lea edi, [byte ebp-058h]
        add esi, edx
        add eax, byte 4
        movsd
        movsd
        movsd
        mov esi, dword [eax]
        shl esi, 3
        lea edi, [byte ebp-018h]
        add esi, ebx
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        lea edi, [byte ebp-04Ch]
        add esi, edx
        add eax, byte 4
        movsd
        movsd
        movsd
        mov esi, dword [eax]
        shl esi, 3
        lea edi, [byte ebp-010h]
        add esi, ebx
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        push dword [byte ebp+018h]
        lea eax, [byte ebp-064h]
        push eax
        lea eax, [byte ebp-028h]
        push eax
        lea edi, [byte ebp-040h]
        add esi, edx
        push dword [byte ebp+010h]
        movsd
        movsd
        movsd
        call sub_B9870
        add esp, byte 10h
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; sub_21BC9                                                       21BC9  96 PC
;-----------------------------------------------------------------------------
sub_21BC9:
        push ebx
        push ecx
        push byte 1
        push dword [byte edx+04h]
        push dword [dword_15E84C]
        call sub_21B35
        add esp, byte 0Ch
        xor eax, eax
        pop ecx
        pop ebx
sub_21BC9_19:
        ret
;-----------------------------------------------------------------------------
; sub_21BE3                                                       21BE3  96 PC
;-----------------------------------------------------------------------------
sub_21BE3:
        test eax, eax
        jne short .1
        mov dword [dword_15E698], eax
        jmp near sub_21990
.1:
        jle short .2
        cmp dword [dword_15E698], 0A666h
        jge short sub_21BC9_19
        jmp short .3
.2:
        cmp dword [dword_15E698], byte 0
        jle short sub_21BC9_19
.3:
        add dword [dword_15E698], eax
        mov eax, dword [dword_15E698]
        jmp near sub_21990
;-----------------------------------------------------------------------------
; sub_21C1A                                                       21C1A  96 PC
;-----------------------------------------------------------------------------
sub_21C1A:
        push ebx
        push ecx
        push esi
        push edi
        enter 40h, 0
        mov esi, eax
        mov dword [byte ebp-08h], edx
        mov edx, eax
        lea eax, [byte ebp-040h]
        xor edi, edi
        call strcpy_
        lea eax, [byte ebp-040h]
.1:
        cmp byte [eax], 0
        je short .3
        movsx edx, byte [eax]
        cmp edx, byte 2Eh
        jne short .2
        mov edi, 1
.2:
        inc eax
        jmp short .1
.3:
        test edi, edi
        jne short .4
        mov edx, str_FSH2
        lea eax, [byte ebp-040h]
        call strcat_
.4:
        lea eax, [byte ebp-040h]
        push eax
        call sub_B7810
        mov edi, eax
        add esp, byte 4
        cmp eax, 32000h
        jge near sub_21C1A_E1.7
        push byte 0
        call sub_AC868
        add esp, byte 4
        cmp edi, eax
        jge near sub_21C1A_E1.7
        cmp dword [byte ebp-08h], byte 20h
        jne short sub_21C1A_E1.7
        push byte 0
        lea eax, [byte ebp-040h]
        push eax
        call sub_B20D0
        add esp, byte 8
        push eax
        mov esi, eax
        mov dword [byte ebp-0Ch], eax
        call sub_AFD00
        add esp, byte 4
        test eax, eax
        jle short .5
        push byte 20h
        push esi
        call sub_AFD00
        add esp, byte 4
        push eax
        lea eax, [byte ebp-040h]
        push eax
        call sub_AB758
        add esp, byte 0Ch
        push byte 0
        push eax
        push esi
        mov dword [byte ebp-04h], eax
        call unpack
        jmp short .6
.5:
        push byte 20h
        push edi
        lea eax, [byte ebp-040h]
        push eax
        call sub_AB758
        add esp, byte 0Ch
        push edi
        push eax
        push esi
        mov dword [byte ebp-04h], eax
        call sub_E0520
.6:
        add esp, byte 0Ch
        push dword [byte ebp-0Ch]
        call sub_ABF4C
        mov eax, dword [byte ebp-04h]
sub_21C1A_E1:
        add esp, byte 4
        jmp near sub_27E24_F6
.7:
        push dword [byte ebp-08h]
        push esi
        call sub_B0494
        add esp, byte 8
        jmp near sub_27E24_F6
;-----------------------------------------------------------------------------
; sub_21D14                                                       21D14  96 PC
;-----------------------------------------------------------------------------
sub_21D14:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov esi, eax
        push str_Ice
        push dword [dword_15E8E4]
        mov edi, byte_159C58
        call sub_B98E0
        mov edx, 20h
        add esp, byte 8
        mov eax, str_IceFsh
        mov ecx, 210h
        call sub_21C1A
        mov dword [dword_15E810], 0ADh
        mov dword [dword_15E6D0], eax
        rep movsb
        xor eax, eax
.1:
        inc eax
        shl byte [dword eax+byte_159C57], 2
        cmp eax, 210h
        jge short .3
        jmp short .1
.2:
        inc eax
        mov byte [dword eax+byte_159C57], 0
.3:
        cmp eax, 300h
        jl short .2
        movzx eax, byte [byte_159E5F]
        mov dword [dword_15E6D4], eax
        movzx eax, byte [byte_159E60]
        push str_Crud
        mov dword [dword_15E6C4], eax
        movzx eax, byte [byte_159E61]
        push dword [dword_15E6D0]
        mov dword [dword_15E6CC], eax
        call sub_E04E0
        add esp, byte 8
        mov dword [dword_15E6B0], eax
        xor ecx, ecx
        add eax, byte 10h
        jmp short .8
.4:
        xor ebx, ebx
        jmp short .7
.5:
        movzx edx, byte [eax]
        cmp edx, dword [dword_15E810]
        jne short .6
        mov byte [eax], 0
.6:
        inc ebx
        inc eax
.7:
        mov edx, dword [dword_15E6B0]
        movsx edx, word [byte edx+06h]
        cmp ebx, edx
        jl short .5
        inc ecx
.8:
        mov edx, dword [dword_15E6B0]
        movsx ebx, word [byte edx+04h]
        cmp ecx, ebx
        jl short .4
        push byte 20h
        movsx eax, word [byte edx+06h]
        push eax
        push ebx
        call sub_AD35C
        mov dword [dword_15E6C0], eax
        mov eax, dword [byte eax+02Ch]
        add esp, byte 0Ch
        mov dword [dword_15E84C], eax
        xor eax, eax
        call sub_21BE3
        push str_Ice
        push dword [dword_15E8E4]
        call sub_B98E0
        add esp, byte 8
        push sub_21BC9
        push eax
        push dword [dword_15E8E4]
        call sub_B9B70
        add esp, byte 0Ch
        jmp near sub_24D8C_1A4
;-----------------------------------------------------------------------------
; sub_21E3E                                                       21E3E  96 PC
;-----------------------------------------------------------------------------
sub_21E3E:
        push ecx
        push esi
        push edi
        enter 20h, 0
        push eax
        mov edi, edx
        mov esi, ebx
        mov edx, dword [ebx]
        xor eax, eax
        cmp edx, dword [byte ebx+08h]
        jle short .1
        mov ebx, edx
        sub ebx, dword [edi]
        mov dword [byte ebp-04h], ebx
        mov ebx, dword [byte esi+08h]
        sub ebx, dword [byte edi+08h]
        mov edx, ebx
        mov dword [byte ebp-08h], ebx
        sub edx, dword [byte ebp-04h]
        je near .3
        mov eax, dword [edi]
        push edx
        sub eax, dword [byte edi+08h]
        push eax
        call sub_B9BD0
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        mov ebx, eax
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [edi]
        add eax, edx
        mov edx, dword [byte esi+04h]
        mov dword [esi], eax
        mov eax, ebx
        sub edx, dword [byte edi+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+04h]
        add eax, edx
        mov edx, dword [byte ebp-08h]
        jmp short .2
.1:
        neg edx
        cmp edx, dword [byte ebx+08h]
        jle near .3
        mov ebx, dword [ebx]
        sub ebx, dword [edi]
        mov dword [byte ebp-0Ch], ebx
        mov ebx, dword [byte esi+08h]
        sub ebx, dword [byte edi+08h]
        mov dword [byte ebp-010h], ebx
        neg ebx
        sub ebx, dword [byte ebp-0Ch]
        je short .3
        mov eax, dword [edi]
        push ebx
        add eax, dword [byte edi+08h]
        push eax
        call sub_B9BD0
        add esp, byte 8
        mov edx, dword [byte ebp-0Ch]
        mov ebx, eax
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [edi]
        add eax, edx
        mov edx, dword [byte esi+04h]
        mov dword [esi], eax
        mov eax, ebx
        sub edx, dword [byte edi+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+04h]
        add eax, edx
        mov edx, dword [byte ebp-010h]
.2:
        mov dword [byte esi+04h], eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+08h]
        add eax, edx
        mov dword [byte esi+08h], eax
        mov eax, 1
.3:
        mov edx, dword [byte esi+04h]
        cmp edx, dword [byte esi+08h]
        jle near .4
        mov ebx, edx
        sub ebx, dword [byte edi+04h]
        mov dword [byte ebp-020h], ebx
        mov ebx, dword [byte esi+08h]
        sub ebx, dword [byte edi+08h]
        mov edx, ebx
        mov dword [byte ebp-01Ch], ebx
        sub edx, dword [byte ebp-020h]
        je near .6
        mov eax, dword [byte edi+04h]
        push edx
        sub eax, dword [byte edi+08h]
        push eax
        call sub_B9BD0
        mov edx, dword [esi]
        add esp, byte 8
        sub edx, dword [edi]
        mov ebx, eax
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [edi]
        add eax, edx
        mov edx, dword [byte ebp-020h]
        mov dword [esi], eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+04h]
        add eax, edx
        mov edx, dword [byte ebp-01Ch]
        mov dword [byte esi+04h], eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+08h]
        add eax, edx
        jmp near .5
.4:
        neg edx
        cmp edx, dword [byte esi+08h]
        jle near .6
        mov ebx, dword [byte esi+04h]
        sub ebx, dword [byte edi+04h]
        mov dword [byte ebp-014h], ebx
        mov ebx, dword [byte esi+08h]
        sub ebx, dword [byte edi+08h]
        mov edx, ebx
        neg edx
        mov dword [byte ebp-018h], ebx
        sub edx, dword [byte ebp-014h]
        je short .6
        mov eax, dword [byte edi+04h]
        push edx
        add eax, dword [byte edi+08h]
        push eax
        call sub_B9BD0
        mov edx, dword [esi]
        add esp, byte 8
        sub edx, dword [edi]
        mov ebx, eax
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [edi]
        add eax, edx
        mov edx, dword [byte ebp-014h]
        mov dword [esi], eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [byte edi+04h]
        add eax, edx
        mov edx, dword [byte ebp-018h]
        mov dword [byte esi+04h], eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, eax
        mov eax, dword [byte edi+08h]
        add eax, ebx
.5:
        mov dword [byte esi+08h], eax
        mov eax, 1
.6:
        test eax, eax
        je short .7
        push dword [byte ebp-024h]
        push esi
        call sub_BA344
        add esp, byte 8
.7:
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; sub_2207E                                                       2207E  96 PC
;-----------------------------------------------------------------------------
sub_2207E:
        push ecx
        push esi
        push edi
        enter 4, 0
        mov esi, eax
        mov edi, edx
        mov dword [byte ebp-04h], ebx
        mov eax, dword [byte edx+08h]
        mov ebx, dword [dword_11F5F0]
        sub eax, dword [byte esi+08h]
        sub ebx, dword [byte esi+08h]
        push eax
        lea eax, [byte ebx+01h]
        push eax
        call sub_B9BD0
        mov ebx, eax
        add esp, byte 8
        mov eax, dword [edi]
        mov edx, ebx
        sub eax, dword [esi]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, eax
        mov eax, dword [esi]
        add eax, edx
        mov edx, dword [byte ebp-04h]
        mov dword [edx], eax
        mov eax, dword [byte edi+04h]
        mov edx, ebx
        sub eax, dword [byte esi+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, eax
        mov eax, dword [byte esi+04h]
        mov edx, dword [byte ebp-04h]
        add eax, ebx
        mov dword [byte edx+04h], eax
        mov ebx, dword [dword_11F5F0]
        inc ebx
        mov dword [byte edx+08h], ebx
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; sub_220FB                                                       220FB  96 PC
;-----------------------------------------------------------------------------
sub_220FB:
        push esi
        push edi
        push ebp
        mov ebp, esp
        push eax
        mov edi, edx
        mov esi, ebx
        mov eax, dword [byte ebx+08h]
        cmp eax, dword [dword_11F5F0]
        jg short .2
        mov eax, dword [byte ecx+08h]
        cmp eax, dword [dword_11F5F0]
        jg short .1
        xor eax, eax
        leave
        pop edi
        pop esi
        ret
.1:
        mov edx, ecx
        mov eax, ebx
        call sub_2207E
        push dword [byte ebp-04h]
        push esi
        jmp short .3
.2:
        mov eax, dword [byte ecx+08h]
        cmp eax, dword [dword_11F5F0]
        jg short .4
        mov ebx, ecx
        mov edx, esi
        mov eax, ecx
        call sub_2207E
        push edi
        push ecx
.3:
        call sub_BA344
        add esp, byte 8
.4:
        mov eax, 1
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; sub_22159                                                       22159  96 PC
;-----------------------------------------------------------------------------
sub_22159:
        push esi
        push edi
        push ebp
        mov ebp, esp
        push ecx
        imul esi, dword [ebx], byte 0Ch
        cmp dword [byte esi+eax+08h], byte 50h
        jle short sub_22159_4F
        mov esi, dword [ebx]
        add ebx, byte 4
        imul edi, dword [ebx], byte 0Ch
        shl esi, 3
        add eax, edi
        add esi, edx
        cmp dword [byte eax+08h], byte 50h
        jle short sub_22159_4F
        mov edi, dword [ebx]
        push dword [byte ebp+010h]
        shl edi, 3
        push eax
        add edi, edx
        call sub_BA2F0
        add esp, byte 8
        push eax
        push eax
        push dword [byte ebp-04h]
        push dword [byte edi+04h]
        push dword [edi]
        push dword [byte esi+04h]
        push dword [esi]
        call sub_87DD6
        add esp, byte 1Ch
sub_22159_4F:
        leave
        pop edi
        pop esi
        ret 4
;-----------------------------------------------------------------------------
; sub_221AE                                                       221AE  96 PC
;-----------------------------------------------------------------------------
sub_221AE:
        push esi
        push edi
        enter 0Ch, 0
        mov edi, eax
        mov dword [byte ebp-0Ch], edx
        mov esi, ebx
        mov dword [byte ebp-08h], ecx
        push dword [byte ebx+08h]
        push ecx
        call sub_B9BD0
        add esp, byte 8
        cmp eax, 10000h
        jle short .1
        mov eax, 10000h
        jmp short .2
.1:
        push dword [byte esi+08h]
        push dword [byte ebp-08h]
        call sub_B9BD0
        add esp, byte 8
.2:
        mov dword [byte ebp-04h], eax
        mov eax, dword [byte ebp-0Ch]
        mov eax, dword [eax]
        mov edx, dword [byte ebp-0Ch]
        sub eax, dword [edi]
        mov edx, dword [byte edx+04h]
        push eax
        sub edx, dword [byte edi+04h]
        push edx
        call sub_BA420
        add esp, byte 8
        push eax
        mov edi, eax
        call sub_BA4F0
        add esp, byte 4
        test eax, eax
        jl short .3
        push edi
        call sub_BA4F0
        add esp, byte 4
        mov edx, eax
        jmp short .4
.3:
        push edi
        call sub_BA4F0
        mov edx, eax
        add esp, byte 4
        neg edx
.4:
        mov eax, 10000h
        sub eax, dword [byte ebp-04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        push dword [byte ebp+010h]
        mov edi, dword [byte ebp-04h]
        push esi
        add edi, eax
        call sub_BA2F0
        add esp, byte 8
        mov edx, edi
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        jmp near sub_22159_4F
;-----------------------------------------------------------------------------
; sub_22268                                                       22268  96 PC
;-----------------------------------------------------------------------------
sub_22268:
        push esi
        push ebp
        mov ebp, esp
        mov esi, dword [byte ebx+08h]
        cmp esi, dword [dword_11F5F0]
        jg short .2
.1:
        xor eax, eax
        pop ebp
        pop esi
        ret 8
.2:
        mov ecx, dword [byte ecx+08h]
        cmp ecx, dword [dword_11F5F0]
        jle short .1
        push dword [byte ebp+010h]
        mov ecx, dword [byte ebp+0Ch]
        call sub_221AE
        pop ebp
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; sub_22299                                                       22299  96 PC
;-----------------------------------------------------------------------------
sub_22299:
        push esi
        push edi
        enter 28h, 0
        push ecx
        imul esi, dword [ebx], byte 0Ch
        lea edi, [byte ebp-01Ch]
        add esi, eax
        movsd
        movsd
        movsd
        mov esi, dword [ebx]
        shl esi, 3
        lea edi, [byte ebp-010h]
        add esi, edx
        add ebx, byte 4
        movsd
        movsd
        imul esi, dword [ebx], byte 0Ch
        lea edi, [byte ebp-028h]
        add esi, eax
        movsd
        movsd
        movsd
        lea ecx, [byte ebp-028h]
        mov esi, dword [ebx]
        lea eax, [byte ebp-010h]
        shl esi, 3
        lea edi, [byte ebp-08h]
        add esi, edx
        lea ebx, [byte ebp-01Ch]
        lea edx, [byte ebp-08h]
        movsd
        movsd
        call sub_220FB
        test eax, eax
        je short sub_22299_AC
        lea ebx, [byte ebp-028h]
        lea edx, [byte ebp-01Ch]
        lea eax, [byte ebp-08h]
        call sub_21E3E
        lea ebx, [byte ebp-01Ch]
        lea edx, [byte ebp-028h]
        lea eax, [byte ebp-010h]
        mov ecx, dword [byte ebp-02Ch]
        call sub_21E3E
        push dword [byte ebp+014h]
        lea ebx, [byte ebp-01Ch]
        lea edx, [byte ebp-08h]
        lea eax, [byte ebp-010h]
        call sub_221AE
        push dword [byte ebp+014h]
        mov ecx, dword [byte ebp-02Ch]
        lea ebx, [byte ebp-028h]
        lea edx, [byte ebp-08h]
        mov esi, eax
        lea eax, [byte ebp-010h]
        call sub_221AE
        push eax
        push esi
        push dword [byte ebp+010h]
        push dword [byte ebp-04h]
        push dword [byte ebp-08h]
        push dword [byte ebp-0Ch]
        push dword [byte ebp-010h]
        call sub_87DD6
        add esp, byte 1Ch
sub_22299_AC:
        leave
        pop edi
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; sub_2234B                                                       2234B  96 PC
;-----------------------------------------------------------------------------
sub_2234B:
        push esi
        push edi
        push ebp
        mov ebp, esp
        push eax
        push edx
        push ebx
        mov esi, ecx
        xor edi, edi
        jmp short .3
.1:
        imul eax, dword [esi], byte 0Ch
        add eax, dword [byte ebp-04h]
        cmp dword [byte eax+08h], byte 50h
        jle short .2
        imul edx, dword [byte esi+04h], byte 0Ch
        mov eax, dword [esi]
        shl eax, 3
        add edx, dword [byte ebp-04h]
        add eax, dword [byte ebp-08h]
        cmp dword [byte edx+08h], byte 50h
        jle short .2
        mov ebx, dword [byte esi+04h]
        shl ebx, 2
        push byte 0
        add ebx, dword [byte ebp+014h]
        push dword [ebx]
        mov ebx, dword [esi]
        shl ebx, 2
        mov edx, dword [byte esi+04h]
        add ebx, dword [byte ebp+014h]
        shl edx, 3
        push dword [ebx]
        add edx, dword [byte ebp-08h]
        push dword [byte ebp+010h]
        push dword [byte edx+04h]
        push dword [edx]
        push dword [byte eax+04h]
        push dword [eax]
        call sub_8805A
        add esp, byte 20h
.2:
        inc edi
        add esi, byte 8
.3:
        cmp edi, dword [byte ebp-0Ch]
        jl short .1
        jmp short sub_22299_AC
;-----------------------------------------------------------------------------
; sub_223BA                                                       223BA  96 PC
;-----------------------------------------------------------------------------
sub_223BA:
        push esi
        push edi
        push ebp
        mov ebp, esp
        push eax
        push edx
        push ebx
        mov esi, ecx
        xor edi, edi
        jmp short .3
.1:
        imul eax, dword [esi], byte 0Ch
        add eax, dword [byte ebp-04h]
        cmp dword [byte eax+08h], byte 50h
        jle short .2
        imul edx, dword [byte esi+04h], byte 0Ch
        mov eax, dword [esi]
        shl eax, 3
        add edx, dword [byte ebp-04h]
        add eax, dword [byte ebp-08h]
        cmp dword [byte edx+08h], byte 50h
        jle short .2
        mov ebx, dword [byte esi+04h]
        shl ebx, 2
        add ebx, dword [byte ebp+014h]
        push dword [ebx]
        mov ebx, dword [esi]
        shl ebx, 2
        mov edx, dword [byte esi+04h]
        add ebx, dword [byte ebp+014h]
        shl edx, 3
        push dword [ebx]
        add edx, dword [byte ebp-08h]
        push dword [byte ebp+010h]
        push dword [byte edx+04h]
        push dword [edx]
        push dword [byte eax+04h]
        push dword [eax]
        call sub_87DD6
        add esp, byte 1Ch
.2:
        inc edi
        add esi, byte 8
.3:
        cmp edi, dword [byte ebp-0Ch]
        jl short .1
        jmp near sub_22299_AC
;-----------------------------------------------------------------------------
; sub_2242A                                                       2242A  96 PC
;-----------------------------------------------------------------------------
sub_2242A:
        push esi
        push edi
        enter 0Ch, 0
        mov edi, eax
        mov dword [byte ebp-0Ch], edx
        mov esi, ebx
        mov ebx, ecx
        mov dword [byte ebp-04h], 0
        mov edx, ecx
        jmp short .4
.1:
        imul eax, dword [edx], byte 0Ch
        add eax, edi
        cmp dword [byte eax+08h], byte 50h
        jle near sub_22159_4F
        cmp dword [eax], byte 0
        jge short .2
        mov eax, dword [eax]
        mov dword [byte ebp-08h], eax
        neg dword [byte ebp-08h]
        jmp short .3
.2:
        mov eax, dword [eax]
        mov dword [byte ebp-08h], eax
.3:
        imul eax, dword [edx], byte 0Ch
        mov ecx, dword [byte ebp-08h]
        cmp ecx, dword [byte edi+eax+08h]
        jg near sub_22159_4F
        inc dword [byte ebp-04h]
        add edx, byte 4
.4:
        cmp esi, dword [byte ebp-04h]
        jg short .1
        mov ecx, dword [byte ebp+010h]
        mov eax, dword [byte ebp-0Ch]
        mov edx, esi
        call sub_BA5D0
        jmp near sub_22159_4F
;-----------------------------------------------------------------------------
; sub_22494                                                       22494  96 PC
;-----------------------------------------------------------------------------
sub_22494:
        push ecx
        push ebx
        push edx
        push dword [dword_190E94]
        push dword [dword_190E98]
        push eax
        call sub_BB384
        add esp, byte 14h
        pop ecx
        ret
;-----------------------------------------------------------------------------
; sub_224AE                                                       224AE  96 PC
;-----------------------------------------------------------------------------
sub_224AE:
        push ebx
        push ecx
        push dword [dword_1798E8]
sub_224AE_8:
        mov ebx, dword [edx]
        mov ecx, dword [byte edx+04h]
        and ebx, byte 7
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        call sub_2242A
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_224D1                                                       224D1  96 PC
;-----------------------------------------------------------------------------
sub_224D1:
        push ebx
        push ecx
        push dword [dword_1798E4]
        jmp short sub_224AE_8
;-----------------------------------------------------------------------------
; sub_224DB                                                       224DB  96 PC
;-----------------------------------------------------------------------------
sub_224DB:
        push ebx
        push ecx
        push edx
        push byte 0FFFFFFFFh
        mov eax, dword [byte eax+04h]
        push eax
        push dword [dword_190E94]
        push dword [dword_190E98]
        mov edx, dword [dword_15E824]
.1:
        push edx
        call sub_BB384
        add esp, byte 14h
        xor eax, eax
        pop edx
        pop ecx
        pop ebx
        ret
        push ebx
        push ecx
        push edx
        push byte 0FFFFFFFFh
        mov eax, dword [byte eax+04h]
        push eax
        push dword [dword_190E94]
        push dword [dword_190E98]
        mov edx, dword [dword_15E86C]
        jmp short .1
;-----------------------------------------------------------------------------
; sub_22522                                                       22522  96 PC
;-----------------------------------------------------------------------------
sub_22522:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1Ch, 0
        mov esi, eax
        mov eax, dword [byte eax+04h]
        add eax, byte 8
        imul edi, dword [eax], byte 0Ch
        add eax, byte 4
        imul eax, dword [eax], byte 0Ch
        mov edx, dword [dword_15E900]
        mov edx, dword [byte edx+078h]
        add edi, edx
        add edx, eax
        lea eax, [byte ebp-010h]
        push eax
        push edx
        push edi
        mov dword [byte ebp-04h], edx
        call sub_B9C3C
        mov edx, dword [byte ebp-04h]
        mov eax, dword [edi]
        add eax, dword [edx]
        sar eax, 1
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [edi]
        add eax, dword [byte edx+04h]
        sar eax, 1
        mov dword [byte ebp-018h], eax
        mov eax, dword [edi]
        add esp, byte 0Ch
        add eax, dword [byte edx+08h]
        push dword [byte ebp-010h]
        sar eax, 1
        push dword [byte ebp-08h]
        mov dword [byte ebp-014h], eax
        call sub_BA420
        add esp, byte 8
        push dword [byte ebp-01Ch]
        push dword [byte ebp-014h]
        mov edi, eax
        call sub_BA420
        sub edi, eax
        lea eax, [dword edi+04000h]
        add esp, byte 8
        cmp eax, 0FFFF8000h
        jge short .1
        add eax, 10000h
        jmp short .2
.1:
        cmp eax, 8000h
        jle short .2
        sub eax, 10000h
.2:
        test eax, eax
        setg dl
        movzx edx, dl
        mov edi, edx
        test edx, edx
        jne short .3
        neg eax
.3:
        sar eax, 0Ch
        cmp eax, byte 8
        jle short .4
        mov edx, 10h
        sub edx, eax
        mov eax, edx
.4:
        mov ebx, dword [nosplit eax*4+dword_15DEE0]
        test eax, eax
        jne short .5
        xor edi, edi
.5:
        test edi, edi
        jne short .6
        mov eax, dword [byte esi+04h]
        mov edx, dword [byte eax+04h]
        xor dword [eax], edx
        mov edx, dword [eax]
        xor dword [byte eax+04h], edx
        mov edx, dword [byte eax+04h]
        xor dword [eax], edx
        mov edx, dword [byte eax+0Ch]
        xor dword [byte eax+08h], edx
        mov edx, dword [byte eax+08h]
        xor dword [byte eax+0Ch], edx
        mov edx, dword [byte eax+0Ch]
        xor dword [byte eax+08h], edx
.6:
        mov edx, dword [byte esi+04h]
        test edi, edi
        je short .7
        mov eax, 0FFFFFFFFh
        jmp short .8
.7:
        mov eax, 1
.8:
        push eax
        push edx
        push dword [dword_190E94]
        push dword [dword_190E98]
        push ebx
        call sub_BB384
        add esp, byte 14h
        test edi, edi
        jne short .9
        mov eax, dword [byte esi+04h]
        mov edx, dword [byte eax+04h]
        xor dword [eax], edx
        mov edx, dword [eax]
        xor dword [byte eax+04h], edx
        mov edx, dword [byte eax+04h]
        xor dword [eax], edx
        mov edx, dword [byte eax+0Ch]
        xor dword [byte eax+08h], edx
        mov edx, dword [byte eax+08h]
        xor dword [byte eax+0Ch], edx
        mov edx, dword [byte eax+0Ch]
        xor dword [byte eax+08h], edx
.9:
        xor eax, eax
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_22669                                                       22669  96 PC
;-----------------------------------------------------------------------------
sub_22669:
        push ebx
        push ecx
        push dword [dword_15E8C0]
        mov ecx, dword [dword_15E814]
sub_22669_E:
        mov ebx, dword [byte edx+04h]
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        call sub_22159
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_2268D                                                       2268D  96 PC
;-----------------------------------------------------------------------------
sub_2268D:
        push ebx
        push ecx
        push dword [dword_15E8B8]
        mov ecx, dword [dword_15E804]
        jmp short sub_22669_E
;-----------------------------------------------------------------------------
; sub_2269D                                                       2269D  96 PC
;-----------------------------------------------------------------------------
sub_2269D:
        push ebx
        push ecx
        push dword [dword_15E8B0]
sub_2269D_8:
        mov ecx, dword [dword_15E880]
        mov ebx, dword [byte edx+04h]
        push dword [dword_15E7E0]
sub_2269D_17:
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        call sub_22299
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_226C7                                                       226C7  96 PC
;-----------------------------------------------------------------------------
sub_226C7:
        push ebx
        push ecx
        push dword [dword_15E8B0]
        mov ecx, dword [dword_15E880]
        mov ebx, dword [byte edx+04h]
        push dword [dword_15E7EC]
        jmp short sub_2269D_17
;-----------------------------------------------------------------------------
; sub_226E0                                                       226E0  96 PC
;-----------------------------------------------------------------------------
sub_226E0:
        push ebx
        push ecx
        push dword [dword_15E888]
        jmp short sub_2269D_8
;-----------------------------------------------------------------------------
; sub_226EA                                                       226EA  96 PC
;-----------------------------------------------------------------------------
sub_226EA:
        push ebx
        push ecx
        cmp byte [byte_1175A7], 0
        je short sub_226EA_17.1
        push dword [dword_15E8BC]
        mov ecx, dword [dword_15E7DC]
sub_226EA_17:
        mov ebx, dword [byte edx+04h]
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        call sub_22159
.1:
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_22717                                                       22717  96 PC
;-----------------------------------------------------------------------------
sub_22717:
        push ebx
        push ecx
        cmp byte [byte_1175A7], 0
        je short .1
        push dword [byte edx+04h]
        push byte 4
        call sub_B7A70
        add esp, byte 8
.1:
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_22734                                                       22734  96 PC
;-----------------------------------------------------------------------------
sub_22734:
        push ebx
        push edx
        mov edx, dword [byte eax+04h]
        imul ebx, dword [edx], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+078h]
        mov eax, dword [eax]
        add edx, ebx
        mov ebx, dword [dword_11F5C0]
        shl eax, 8
        shl ebx, 3
        shr eax, 18h
        cmp ebx, dword [byte edx+08h]
        jge short .1
        inc eax
        inc eax
        pop edx
        pop ebx
        ret
.1:
        mov ebx, dword [dword_11F5C0]
        shl ebx, 2
        cmp ebx, dword [byte edx+08h]
        jge short .2
        inc eax
.2:
        pop edx
        pop ebx
        ret
        push ebx
        push ecx
        push esi
        push edi
        mov edi, eax
        mov esi, edx
        push dword [byte edx+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne short .5
        mov eax, dword [byte esi+04h]
        imul edx, dword [eax], byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+078h]
        add eax, edx
        mov edx, dword [esi]
        mov ebx, dword [dword_11F5C0]
        shl edx, 8
        shl ebx, 3
        shr edx, 18h
        cmp ebx, dword [byte eax+08h]
        jge short .3
        inc edx
        inc edx
        jmp short .4
.3:
        mov ebx, dword [dword_11F5C0]
        shl ebx, 2
        cmp ebx, dword [byte eax+08h]
        jge short .4
        inc edx
.4:
        imul edx, byte 14h
        push dword [byte esi+04h]
        mov eax, dword [byte edi+014h]
        push dword [byte edx+eax+0Ch]
        call sub_B81D0
        add esp, byte 8
.5:
        xor eax, eax
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_227E2                                                       227E2  96 PC
;-----------------------------------------------------------------------------
sub_227E2:
        push ebx
        push ecx
        push dword [dword_15E848]
        mov ecx, dword [dword_15E7E8]
        jmp near sub_226EA_17
;-----------------------------------------------------------------------------
; sub_227F5                                                       227F5  96 PC
;-----------------------------------------------------------------------------
sub_227F5:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 10h, 0
        mov dword [byte ebp-010h], 0
        xor edi, edi
        xor esi, esi
        mov dword [byte ebp-04h], edi
.1:
        push dword [byte ebp-04h]
        call sub_BA4F0
        mov ebx, dword [dword_15E860]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+dword_1595CC], 0
        push dword [byte ebp-04h]
        mov dword [dword esi+dword_1595C8], eax
        call sub_BA55C
        mov ebx, dword [dword_15E860]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add edi, byte 8
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+dword_1595D0], eax
        mov eax, dword [byte ebp-010h]
        add esi, byte 0Ch
        mov dword [dword edi+dword_159230], eax
        inc eax
        add dword [byte ebp-04h], 800h
        mov dword [byte ebp-010h], eax
        mov dword [dword edi+dword_159234], eax
        cmp eax, byte 20h
        jl near .1
        mov dword [dword_159334], 0
        mov dword [byte ebp-08h], 0
        xor edi, edi
        xor esi, esi
        mov dword [byte ebp-0Ch], edi
.2:
        push dword [byte ebp-0Ch]
        call sub_BA4F0
        add esi, byte 0Ch
        mov ebx, dword [dword_15E8B4]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add edi, byte 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+dword_1591D0], 0
        push dword [byte ebp-0Ch]
        mov dword [dword esi+dword_1591CC], eax
        call sub_BA55C
        mov ebx, dword [dword_15E8B4]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add dword [byte ebp-0Ch], 2000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+dword_1591D4], eax
        mov eax, dword [byte ebp-08h]
        inc dword [byte ebp-08h]
        mov dword [dword edi+dword_158F24], eax
        cmp dword [byte ebp-08h], byte 8
        jl short .2
        mov edi, 4000h
        xor esi, esi
.3:
        push edi
        call sub_BA4F0
        mov ebx, dword [dword_15E878]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add esi, byte 0Ch
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+dword_15E610], 0
        push edi
        mov dword [dword esi+dword_15E60C], eax
        call sub_BA55C
        mov ebx, dword [dword_15E878]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add edi, 1000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+dword_15E614], eax
        cmp edi, 0D000h
        jne short .3
        cmp dword [dword_1176DD], byte 0
        jne short .5
        mov esi, unk_11764D
        lea edi, [byte esi+060h]
.4:
        push esi
        push dword 19999h
        push esi
        call sub_B9C70
        mov dword [dword_1176DD], 1
        add esi, byte 0Ch
        add esp, byte 0Ch
        cmp esi, edi
        jne short .4
.5:
        mov edi, 4000h
        xor esi, esi
.6:
        push edi
        call sub_BA4F0
        mov ebx, dword [dword_15E870]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add esi, byte 0Ch
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+dword_15E4C0], 0
        push edi
        mov dword [dword esi+dword_15E4C4], eax
        call sub_BA55C
        mov ebx, dword [dword_15E870]
        add esp, byte 4
        mov edx, eax
        mov eax, ebx
        add edi, 1000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword esi+dword_15E4BC], eax
        cmp edi, 0D000h
        jne short .6
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_22A3A                                                       22A3A  96 PC
;-----------------------------------------------------------------------------
sub_22A3A:
        push ebx
        push ecx
        push edx
        push unk_158DA8
        push unk_15E88C
        push dword_1595C8
        push byte 20h
        call sub_BB470
        add esp, byte 10h
        push unk_159458
        push unk_15E88C
        push unk_11764D
        push byte 8
        call sub_BB470
        add esp, byte 10h
        push unk_15E534
        push unk_15E88C
        push unk_15E618
        push byte 9
        call sub_BB470
        add esp, byte 10h
        push unk_159148
        push unk_15E88C
        push unk_117605
        push byte 6
        call sub_BB470
        add esp, byte 10h
        push unk_159190
        push unk_15E88C
        push unk_1175BD
        push byte 6
        call sub_BB470
        add esp, byte 10h
        push unk_1593F8
        push unk_15E88C
        push unk_1591D8
        push byte 8
        call sub_BB470
        add esp, byte 10h
        push unk_15E5A0
        push unk_15E88C
        push unk_15E4C8
        push byte 9
        call sub_BB470
        add esp, byte 10h
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_22AF0                                                       22AF0  96 PC
;-----------------------------------------------------------------------------
sub_22AF0:
        push ebx
        push ecx
        push esi
        mov esi, edx
        push unk_159398
        push eax
        push unk_1593F8
        push byte 8
        call sub_BB570
        add esp, byte 10h
        push unk_159108
        push unk_159398
        push byte 8
        call sub_BA3D0
        add esp, byte 0Ch
        mov ecx, unk_158F28
        mov ebx, 8
        push esi
        mov edx, unk_159108
        mov eax, unk_159398
        call sub_2242A
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_22B3C                                                       22B3C  96 PC
;-----------------------------------------------------------------------------
sub_22B3C:
        push ebx
        push ecx
        push esi
        push edi
        enter 0B0h, 0
        sub ebp, 82h
        mov edi, eax
        mov dword [byte ebp+072h], edx
        mov eax, dword [byte eax+08h]
        cmp eax, dword [dword_15E840]
        jl near sub_22B3C_1DF
        push unk_158F88
        push edi
        push unk_158DA8
        push byte 20h
        call sub_BB570
        add esp, byte 10h
        push dword_1594B8
        push unk_158F88
        push byte 20h
        mov dword [byte ebp+076h], dword_1594B8
        xor esi, esi
        call sub_BA3D0
        mov eax, unk_158F88
        add esp, byte 0Ch
.1:
        push dword [dword_15E888]
        lea ecx, [byte eax+0Ch]
        push dword [dword_15E880]
        mov dword [byte ebp+07Ah], ecx
        mov ecx, dword [byte ebp+076h]
        mov ebx, eax
        add ecx, byte 8
        mov eax, dword [byte ebp+076h]
        mov dword [byte ebp+07Eh], ecx
        mov ecx, dword [byte ebp+07Ah]
        mov edx, dword [byte ebp+07Eh]
        add esi, byte 4
        call sub_22268
        mov ecx, dword [byte ebp+07Eh]
        mov dword [byte esi+ebp-032h], eax
        mov eax, dword [byte ebp+07Ah]
        mov dword [byte ebp+076h], ecx
        cmp esi, byte 7Ch
        jne short .1
        mov ecx, unk_158F88
        mov edx, dword_1594B8
        push dword [dword_15E888]
        mov ebx, eax
        push dword [dword_15E880]
        mov eax, dword [byte ebp+07Eh]
        call sub_22268
        mov dword [byte esi+ebp-02Eh], eax
        lea eax, [byte ebp-02Eh]
        mov ecx, unk_159238
        push eax
        mov ebx, 20h
        mov edx, dword_1594B8
        push dword [dword_15E7E0]
        mov eax, unk_158F88
        call sub_2234B
        cmp dword [byte ebp+072h], byte 0
        je near sub_22B3C_1DF
        push unk_159338
        push edi
        push unk_159458
        push byte 8
        call sub_BB570
        add esp, byte 10h
        push unk_158F48
        push unk_159338
        push byte 8
        call sub_BA3D0
        mov ecx, dword [dword_15E880]
        mov esi, dword [dword_15E888]
        mov eax, dword [dword_159340]
        add esp, byte 0Ch
        cmp eax, dword [dword_11F5F0]
        jg short .3
.2:
        xor eax, eax
        jmp short .4
.3:
        mov eax, dword [dword_15934C]
        cmp eax, dword [dword_11F5F0]
        jle short .2
        mov ebx, unk_159338
        push esi
        mov edx, unk_158F50
        mov eax, unk_158F48
        call sub_221AE
.4:
        mov ecx, eax
        xor eax, eax
.5:
        add eax, byte 4
        mov dword [byte eax+ebp+04Eh], ecx
        cmp eax, byte 10h
        jne short .5
        mov esi, 4
        mov ecx, dword [dword_15E880]
        mov eax, dword [dword_159370]
        mov edi, dword [dword_15E888]
        cmp eax, dword [dword_11F5F0]
        jg short .7
.6:
        xor eax, eax
        jmp short .8
.7:
        mov eax, dword [dword_15937C]
        cmp eax, dword [dword_11F5F0]
        jle short .6
        mov ebx, unk_159368
        push edi
        mov edx, unk_158F70
        mov eax, unk_158F68
        call sub_221AE
.8:
        mov ecx, eax
        mov eax, esi
        shl eax, 2
        jmp short .10
.9:
        add eax, byte 4
        inc esi
        mov dword [byte eax+ebp+04Eh], ecx
.10:
        cmp eax, byte 20h
        jl short .9
        lea eax, [byte ebp+052h]
        mov ecx, unk_1176AD
        push eax
        mov ebx, 4
        mov edx, unk_158F48
        push dword [dword_15E7E0]
        mov eax, unk_159338
        call sub_223BA
sub_22B3C_1DF:
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_22D27                                                       22D27  96 PC
;-----------------------------------------------------------------------------
sub_22D27:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 28h, 0
        push unk_158F88
        push eax
        push unk_15E5A0
        push byte 9
        call sub_BB570
        add esp, byte 10h
        push dword_1594B8
        push unk_158F88
        push byte 9
        xor esi, esi
        call sub_BA3D0
        mov eax, dword_1594B8
        mov ebx, unk_158F88
        add esp, byte 0Ch
.1:
        push dword [dword_15E888]
        lea edx, [byte ebx+0Ch]
        lea edi, [byte eax+08h]
        push dword [dword_15E880]
        mov dword [byte ebp-04h], edx
        mov ecx, edx
        mov edx, edi
        add esi, byte 4
        call sub_22268
        mov ebx, dword [byte ebp-04h]
        mov dword [byte esi+ebp-02Ch], eax
        mov eax, edi
        cmp esi, byte 20h
        jne short .1
        push dword [dword_15E888]
        lea ecx, [byte ebx-0Ch]
        push dword [dword_15E880]
        lea edx, [byte edi-08h]
        call sub_22268
        mov dword [byte esi+ebp-028h], eax
        lea eax, [byte ebp-028h]
        mov ecx, unk_159238
        push eax
        mov ebx, 8
        mov edx, dword_1594B8
        push dword [dword_15E7E0]
        mov eax, unk_158F88
        call sub_223BA
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_22DD7                                                       22DD7  96 PC
;-----------------------------------------------------------------------------
sub_22DD7:
        push ebx
        push ecx
        push esi
        push edi
        enter 0B8h, 0
        sub ebp, 82h
        mov edi, eax
        test edx, edx
        je near .4
        mov dword [byte ebp+076h], unk_15E534
        mov esi, unk_158F88
        mov dword [byte ebp+066h], 0
.1:
        push esi
        push dword [byte ebp+076h]
        inc dword [byte ebp+066h]
        push edi
        add esi, byte 0Ch
        add dword [byte ebp+076h], byte 0Ch
        call sub_B9C3C
        add esp, byte 0Ch
        cmp dword [byte ebp+066h], byte 9
        jl short .1
        mov dword [byte ebp+06Eh], unk_159148
        mov dword [byte ebp+07Ah], 0
.2:
        push esi
        push dword [byte ebp+06Eh]
        inc dword [byte ebp+07Ah]
        push edi
        add esi, byte 0Ch
        add dword [byte ebp+06Eh], byte 0Ch
        call sub_B9C3C
        add esp, byte 0Ch
        cmp dword [byte ebp+07Ah], byte 6
        jl short .2
        mov dword [byte ebp+06Ah], unk_159190
        mov dword [byte ebp+072h], 0
.3:
        push esi
        push dword [byte ebp+06Ah]
        inc dword [byte ebp+072h]
        push edi
        add esi, byte 0Ch
        add dword [byte ebp+06Ah], byte 0Ch
        call sub_B9C3C
        add esp, byte 0Ch
        cmp dword [byte ebp+072h], byte 6
        jge short .5
        jmp short .3
.4:
        push unk_158F88
        push eax
        push unk_15E534
        push byte 9
        call sub_BB570
        add esp, byte 10h
        push unk_158FF4
        push edi
        push unk_159148
        push byte 6
        call sub_BB570
        add esp, byte 10h
        push unk_15903C
        push edi
        push unk_159190
        push byte 6
        call sub_BB570
        add esp, byte 10h
.5:
        push dword_1594B8
        push unk_158F88
        push byte 9
        call sub_BA3D0
        add esp, byte 0Ch
        push unk_159500
        push unk_158FF4
        push byte 6
        call sub_BA3D0
        add esp, byte 0Ch
        push dword_159530
        push unk_15903C
        push byte 6
        xor esi, esi
        call sub_BA3D0
        mov eax, dword_1594B8
        mov ebx, unk_158F88
        add esp, byte 0Ch
.6:
        push dword [dword_15E888]
        lea edx, [byte ebx+0Ch]
        lea edi, [byte eax+08h]
        push dword [dword_15E880]
        mov dword [byte ebp+07Eh], edx
        mov ecx, edx
        mov edx, edi
        add esi, byte 4
        call sub_22268
        mov ebx, dword [byte ebp+07Eh]
        mov dword [byte esi+ebp+03Eh], eax
        mov eax, edi
        cmp esi, byte 20h
        jne short .6
        mov ecx, dword [byte ebp+07Eh]
        push dword [dword_15E888]
        sub ebx, byte 0Ch
        lea eax, [byte edi-08h]
        push dword [dword_15E880]
        mov edx, edi
        call sub_22268
        xor ebx, ebx
        mov dword [byte esi+ebp+042h], eax
        xor esi, esi
        xor eax, eax
.7:
        cmp dword [dword esi+dword_158F90], byte 50h
        jle short .8
        mov edx, dword [dword eax+dword_1594B8]
        sar edx, 10h
        add esi, byte 0Ch
        mov dword [byte eax+ebp-036h], edx
        mov edx, dword [dword eax+dword_1594BC]
        add eax, byte 8
        sar edx, 10h
        inc ebx
        mov dword [byte eax+ebp-03Ah], edx
        cmp eax, byte 48h
        jl short .7
.8:
        cmp ebx, byte 9
        jne short .9
        lea eax, [byte ebp-036h]
        push eax
        push ebx
        push dword [dword_15E7F8]
        call sub_E0959
        add esp, byte 0Ch
.9:
        lea eax, [byte ebp+042h]
        mov ecx, unk_159238
        push eax
        mov ebx, 8
        mov edx, dword_1594B8
        push dword [dword_15E7E0]
        mov eax, unk_158F88
        call sub_223BA
        mov ecx, dword [dword_15E880]
        mov eax, dword [dword_159008]
        mov edx, dword [dword_15E888]
        cmp eax, dword [dword_11F5F0]
        jg short .11
.10:
        xor eax, eax
        jmp short .12
.11:
        mov eax, dword [dword_159014]
        cmp eax, dword [dword_11F5F0]
        jle short .10
        mov ebx, unk_159000
        push edx
        mov eax, unk_159508
        mov edx, unk_159510
        call sub_221AE
.12:
        mov edx, eax
        xor eax, eax
.13:
        add eax, byte 4
        mov dword [byte eax+ebp+03Eh], edx
        cmp eax, byte 0Ch
        jne short .13
        mov esi, 3
        mov ecx, dword [dword_15E880]
        mov edx, dword [dword_15902C]
        mov eax, dword [dword_15E888]
        cmp edx, dword [dword_11F5F0]
        jg short .15
.14:
        xor eax, eax
        jmp short .16
.15:
        mov edx, dword [dword_159038]
        cmp edx, dword [dword_11F5F0]
        jle short .14
        mov ebx, unk_159024
        push eax
        mov edx, unk_159528
        mov eax, unk_159520
        call sub_221AE
.16:
        mov ebx, eax
        mov eax, esi
        shl eax, 2
        jmp short .18
.17:
        add eax, byte 4
        inc esi
        mov dword [byte eax+ebp+03Eh], ebx
.18:
        cmp eax, byte 18h
        jl short .17
        lea eax, [byte ebp+042h]
        mov ecx, unk_1176CD
        push eax
        mov ebx, 2
        mov edx, unk_159500
        push dword [dword_15E7E0]
        mov eax, unk_158FF4
        call sub_223BA
        lea eax, [byte ebp+042h]
        mov ecx, unk_1176CD
        mov ebx, 2
        push eax
        mov edx, unk_159518
        mov eax, unk_159018
        push dword [dword_15E7E0]
        mov esi, 0B4h
        call sub_223BA
        xor ebx, ebx
        xor eax, eax
.19:
        cmp dword [dword esi+dword_158F90], byte 50h
        jle short .20
        mov edx, dword [dword eax+dword_159530]
        sar edx, 10h
        add esi, byte 0Ch
        mov dword [byte eax+ebp+012h], edx
        mov edx, dword [dword eax+dword_159534]
        add eax, byte 8
        sar edx, 10h
        inc ebx
        mov dword [byte eax+ebp+0Eh], edx
        cmp eax, byte 30h
        jl short .19
.20:
        cmp ebx, byte 6
        jne near sub_22B3C_1DF
        lea eax, [byte ebp+012h]
        push eax
        push ebx
        push dword [dword_15E7F8]
        call sub_E0959
        add esp, byte 0Ch
        jmp near sub_22B3C_1DF
;-----------------------------------------------------------------------------
; sub_23106                                                       23106  96 PC
;-----------------------------------------------------------------------------
sub_23106:
        push ecx
        push esi
        push edi
        enter 38h, 0
        push eax
        push edx
        push ebx
        mov dword [byte ebp-04h], dword_15D2B8
        mov dword [byte ebp-014h], 7FFFFFFFh
        mov dword [edx], 0FFFFFFFFh
        mov dword [byte ebp-08h], 0
        mov dword [ebx], 0FFFFFFFFh
.1:
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+020h]
        mov edx, dword_15DD10
        shl eax, 2
        add edx, eax
        mov dword [byte ebp-0Ch], 0
        mov dword [byte ebp-010h], edx
        jmp near .4
.2:
        mov eax, dword [byte ebp-010h]
        mov eax, dword [eax]
        mov eax, dword [byte eax+04h]
        imul esi, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        lea edi, [byte ebp-020h]
        add esi, edx
        add eax, byte 4
        movsd
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        lea edi, [byte ebp-02Ch]
        add esi, edx
        mov eax, dword [byte ebp-020h]
        movsd
        movsd
        movsd
        add eax, dword [byte ebp-02Ch]
        sar eax, 1
        mov dword [byte ebp-038h], eax
        mov eax, dword [byte ebp-01Ch]
        add eax, dword [byte ebp-028h]
        sar eax, 1
        mov dword [byte ebp-034h], eax
        mov eax, dword [byte ebp-018h]
        add eax, dword [byte ebp-024h]
        sar eax, 1
        mov edx, dword [byte ebp-03Ch]
        mov dword [byte ebp-030h], eax
        sub eax, dword [byte edx+08h]
        push eax
        mov eax, dword [byte ebp-038h]
        sub eax, dword [edx]
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, dword [byte ebp-014h]
        jge short .3
        mov esi, dword [byte ebp-040h]
        mov edx, dword [byte ebp-08h]
        mov dword [esi], edx
        mov esi, dword [byte ebp-044h]
        mov edx, dword [byte ebp-0Ch]
        mov dword [byte ebp-014h], eax
        mov dword [esi], edx
.3:
        inc dword [byte ebp-0Ch]
        add dword [byte ebp-010h], byte 4
.4:
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-0Ch]
        cmp eax, dword [byte edx+014h]
        jl near .2
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
        cmp dword [byte ebp-08h], byte 12h
        jl near .1
        leave
        pop edi
        pop esi
        pop ecx
        ret
        push ecx
        mov ecx, dword [eax]
        add ecx, dword [edx]
        sar ecx, 1
        mov dword [ebx], ecx
        mov ecx, dword [byte eax+04h]
        add ecx, dword [byte edx+04h]
        sar ecx, 1
        mov dword [byte ebx+04h], ecx
        mov eax, dword [byte eax+08h]
        add eax, dword [byte edx+08h]
        sar eax, 1
        mov dword [byte ebx+08h], eax
        pop ecx
        ret
;-----------------------------------------------------------------------------
; sub_23218                                                       23218  96 PC
;-----------------------------------------------------------------------------
sub_23218:
        push esi
        push edi
        enter 14h, 0
        mov edi, eax
        mov dword [byte ebp-08h], edx
        mov dword [byte ebp-0Ch], ebx
        mov esi, ecx
        call sub_E0898
        mov ebx, 0Bh
        xor edx, edx
        div ebx
        mov eax, edx
        mov ebx, 0A0000h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov dword [byte ebp-010h], eax
        mov dword [byte ebp-04h], eax
        call sub_E0898
        mov ebx, 0Bh
        xor edx, edx
        div ebx
        mov eax, edx
        mov ebx, 0A0000h
        shl eax, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edx, dword [byte ebp-010h]
        add edx, eax
        mov ebx, eax
        cmp edx, 10000h
        jle short .1
        mov edx, 10000h
        mov ebx, 10000h
        sub edx, dword [byte ebp-010h]
        sub ebx, eax
        mov dword [byte ebp-04h], edx
.1:
        mov ecx, 10000h
        sub ecx, dword [byte ebp-04h]
        sub ecx, ebx
        mov edx, dword [edi]
        mov eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-08h]
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-04h]
        mov edx, dword [edx]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-014h]
        add edx, eax
        mov dword [byte ebp-014h], edx
        mov edx, dword [byte ebp-0Ch]
        mov eax, ebx
        mov edx, dword [edx]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-014h]
        add edx, eax
        mov dword [esi], edx
        mov eax, ecx
        mov edx, dword [byte edi+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-08h]
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte edx+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-014h]
        add edx, eax
        mov dword [byte ebp-014h], edx
        mov edx, dword [byte ebp-0Ch]
        mov eax, ebx
        mov edx, dword [byte edx+04h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-014h]
        add edx, eax
        mov dword [byte esi+04h], edx
        mov eax, ecx
        mov edx, dword [byte edi+08h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-08h]
        mov ecx, eax
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte edx+08h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [byte ebp-0Ch]
        add ecx, eax
        mov eax, ebx
        mov edx, dword [byte edx+08h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ecx, eax
        mov dword [byte esi+08h], ecx
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; sub_233A2                                                       233A2  96 PC
;-----------------------------------------------------------------------------
sub_233A2:
        push esi
        push edi
        mov esi, eax
        cmp dword [dword_15E6C8], byte 6Ch
        jge short .1
        imul eax, dword [dword_15E6C8], byte 24h
        add eax, unk_159F58
        mov edi, eax
        movsd
        movsd
        movsd
        mov esi, edx
        lea edi, [byte eax+0Ch]
        movsd
        movsd
        movsd
        mov esi, ebx
        lea edi, [byte eax+018h]
        mov eax, 3
        movsd
        movsd
        movsd
        call randomd0
        movsx edx, ax
        imul eax, dword [dword_15E6C8], byte 0Ch
        dec edx
        mov dword [dword eax+dword_159748], edx
        mov eax, 3
        call randomd0
        movsx edx, ax
        imul eax, dword [dword_15E6C8], byte 0Ch
        dec edx
        mov dword [dword eax+dword_15974C], 0FFFFFFFFh
        inc dword [dword_15E6C8]
        mov dword [dword eax+dword_159750], edx
.1:
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; sub_23419                                                       23419  96 PC
;-----------------------------------------------------------------------------
sub_23419:
        push esi
        push edi
        enter 14h, 0
        push eax
        mov esi, edx
        mov edi, ebx
        mov dword [byte ebp-04h], ecx
        cmp ecx, byte 1
        jg short .1
        call sub_233A2
        leave
        pop edi
        pop esi
        ret
.1:
        lea ecx, [byte ebp-014h]
        call sub_23218
        mov ebx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-018h]
        dec ebx
        mov edx, esi
        mov dword [byte ebp-08h], ebx
        mov ecx, ebx
        lea ebx, [byte ebp-014h]
        call sub_23419
        mov ecx, dword [byte ebp-08h]
        lea ebx, [byte ebp-014h]
        mov edx, edi
        mov eax, esi
        call sub_23419
        mov ecx, dword [byte ebp-08h]
        lea ebx, [byte ebp-014h]
        mov edx, dword [byte ebp-018h]
        mov eax, edi
        call sub_23419
        leave
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; sub_23476                                                       23476  96 PC
;-----------------------------------------------------------------------------
sub_23476:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 60h, 0
        imul eax, dword [dword_1176E1], dword 88h
        add eax, dword_15D2B8
        mov dword [dword_15E6C8], 0
        mov edx, dword [dword_15E4B4]
        mov dword [byte eax+024h], edx
        mov eax, dword [byte eax+020h]
        shl eax, 2
        add eax, dword_15DD10
        mov edx, dword [eax+edx*4]
        mov edx, dword [byte edx+04h]
        xor eax, eax
.1:
        imul esi, dword [edx], byte 0Ch
        mov ebx, dword [dword_15E8E4]
        mov ebx, dword [byte ebx+070h]
        lea edi, [byte eax+ebp-060h]
        add esi, ebx
        add eax, byte 0Ch
        add edx, byte 4
        movsd
        movsd
        movsd
        cmp eax, byte 30h
        jne short .1
        lea ecx, [byte ebp-0Ch]
        lea ebx, [byte ebp-048h]
        lea edx, [byte ebp-054h]
        lea eax, [byte ebp-060h]
        call sub_23218
        mov eax, dword [byte ebp-03Ch]
        add eax, dword [byte ebp-0Ch]
        sar eax, 1
        mov dword [byte ebp-030h], eax
        mov eax, dword [byte ebp-038h]
        add eax, dword [byte ebp-08h]
        sar eax, 1
        mov dword [byte ebp-02Ch], eax
        mov eax, dword [byte ebp-034h]
        add eax, dword [byte ebp-04h]
        sar eax, 1
        mov dword [byte ebp-028h], eax
        mov eax, dword [byte ebp-048h]
        add eax, dword [byte ebp-0Ch]
        sar eax, 1
        mov dword [byte ebp-024h], eax
        mov eax, dword [byte ebp-044h]
        add eax, dword [byte ebp-08h]
        sar eax, 1
        mov dword [byte ebp-020h], eax
        mov eax, dword [byte ebp-040h]
        add eax, dword [byte ebp-04h]
        sar eax, 1
        mov dword [byte ebp-01Ch], eax
        cmp dword [dword_15E4B8], byte 4
        jne short .3
        mov eax, dword [dword_15E4B0]
        mov dword [byte ebp-02Ch], eax
        mov eax, dword [byte ebp-020h]
        cmp eax, dword [byte ebp-02Ch]
        jge short .2
        mov eax, dword [byte ebp-02Ch]
        mov dword [byte ebp-020h], eax
.2:
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-03Ch]
        lea eax, [byte ebp-060h]
        call sub_233A2
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-054h]
        lea eax, [byte ebp-060h]
        call sub_233A2
        lea ebx, [byte ebp-024h]
        lea edx, [byte ebp-030h]
        lea eax, [byte ebp-054h]
        call sub_233A2
        lea ebx, [byte ebp-024h]
        lea edx, [byte ebp-048h]
        lea eax, [byte ebp-054h]
        mov ecx, 4
        call sub_233A2
        lea ebx, [byte ebp-024h]
        lea edx, [byte ebp-03Ch]
        lea eax, [byte ebp-048h]
        call sub_23419
        mov ecx, 4
        lea ebx, [byte ebp-024h]
        lea edx, [byte ebp-030h]
        lea eax, [byte ebp-03Ch]
        jmp short .4
.3:
        mov ecx, 4
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-03Ch]
        lea eax, [byte ebp-060h]
        call sub_23419
        mov ecx, 4
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-054h]
        lea eax, [byte ebp-060h]
        call sub_23419
        mov ecx, 4
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-048h]
        lea eax, [byte ebp-054h]
        call sub_23419
        mov ecx, 4
        lea ebx, [byte ebp-030h]
        lea edx, [byte ebp-03Ch]
        lea eax, [byte ebp-048h]
.4:
        call sub_23419
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_235F2                                                       235F2  96 PC
;-----------------------------------------------------------------------------
sub_235F2:
        push ebx
        push ecx
        push esi
        mov ecx, eax
        mov esi, edx
        mov ebx, dword_15E4B4
        mov edx, dword_1176E1
        call sub_23106
        cmp dword [dword_1176E1], byte 0FFFFFFFFh
        je short .1
        mov dword [dword_15E4C4], 1
        mov dword [dword_15E4BC], 0
        mov dword [dword_15E4B8], esi
        mov ecx, dword [byte ecx+04h]
        mov dword [dword_15E4B0], ecx
        call sub_23476
.1:
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_2363D                                                       2363D  96 PC
;-----------------------------------------------------------------------------
sub_2363D:
        xor eax, eax
.1:
        add eax, 88h
        mov dword [dword eax+dword_15D254], 0FFFFFFFFh
        cmp eax, 990h
        jne short .1
        ret
;-----------------------------------------------------------------------------
; sub_23656                                                       23656  96 PC
;-----------------------------------------------------------------------------
sub_23656:
        cmp dword [dword_15E4C4], byte 0
        je short .2
        mov dword [dword_15E4C4], 0
        mov dword [dword_1176E1], 0FFFFFFFFh
        xor eax, eax
.1:
        add eax, 88h
        mov dword [dword eax+dword_15D254], 0FFFFFFFFh
        cmp eax, 990h
        jne short .1
.2:
        ret
.3:
        mov ecx, 9
        mov edi, dword [byte ebp-04h]
        mov esi, dword [byte ebp-010h]
        rep movsd
        cmp eax, dword [dword_15E4B8]
        jl near .11
        mov esi, dword [byte ebp-0Ch]
        lea edi, [byte ebp-01Ch]
        lea esi, [dword esi+dword_159748]
        movsd
        movsd
        movsd
        xor esi, esi
        jmp near .10
.4:
        cmp esi, byte 14h
        jge short .5
        mov dword [byte ebp-018h], 1
        jmp short .6
.5:
        mov dword [byte ebp-018h], 0FFFFFFFCh
.6:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte edx+01Ch]
        jg short .7
        mov eax, dword [byte edx+010h]
        cmp eax, dword [byte edx+01Ch]
        jle short .8
.7:
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-01Ch]
        add dword [edx], eax
        mov eax, dword [byte ebp-018h]
        add dword [byte edx+04h], eax
        mov eax, dword [byte ebp-014h]
        add dword [byte edx+08h], eax
        mov eax, dword [byte ebp-01Ch]
        add dword [byte edx+0Ch], eax
        mov eax, dword [byte ebp-018h]
        add dword [byte edx+010h], eax
        mov eax, dword [byte ebp-014h]
        add dword [byte edx+014h], eax
        jmp near .9
.8:
        mov ebx, 0C0000h
        mov eax, dword [byte ebp-08h]
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edx, eax
        mov eax, dword [byte ebp-01Ch]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        mov ebx, 0C0000h
        mov dword [byte ebp-01Ch], eax
        mov eax, dword [byte ebp-08h]
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edx, eax
        mov eax, dword [byte ebp-014h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        sar eax, 10h
        mov edx, dword [byte ebp-04h]
        mov dword [byte ebp-014h], eax
        mov eax, dword [byte ebp-01Ch]
        add dword [edx], eax
        mov eax, dword [byte ebp-018h]
        add dword [byte edx+04h], eax
        mov eax, dword [byte ebp-014h]
        add dword [byte edx+08h], eax
        mov eax, dword [byte ebp-01Ch]
        add dword [byte edx+0Ch], eax
        mov eax, dword [byte ebp-018h]
        add dword [byte edx+010h], eax
        mov eax, dword [byte ebp-014h]
        add dword [byte edx+014h], eax
        mov eax, dword [byte ebp-01Ch]
        add dword [byte edx+018h], eax
        mov eax, dword [byte ebp-018h]
        add dword [byte edx+01Ch], eax
        mov eax, dword [byte ebp-014h]
        add dword [byte edx+020h], eax
.9:
        inc esi
.10:
        cmp esi, dword [byte ebp-020h]
        jl near .4
.11:
        mov eax, dword [byte ebp-04h]
        cmp dword [byte eax+04h], byte 0
        jge short .12
        mov dword [byte eax+04h], 0
.12:
        mov eax, dword [byte ebp-04h]
        cmp dword [byte eax+010h], byte 0
        jge short .13
        mov dword [byte eax+010h], 0
.13:
        mov eax, dword [byte ebp-04h]
        cmp dword [byte eax+01Ch], byte 0
        jge short .14
        mov dword [byte eax+01Ch], 0
.14:
        add dword [byte ebp-0Ch], byte 0Ch
        inc dword [byte ebp-08h]
        add dword [byte ebp-010h], byte 24h
        add dword [byte ebp-04h], byte 24h
sub_23656_1A8:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [dword_15E6C8]
        jl near sub_23656.3
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_23812                                                       23812  96 PC
;-----------------------------------------------------------------------------
sub_23812:
        cmp dword [dword_15E4C4], byte 0
        jne near sub_23820_79
        ret
;-----------------------------------------------------------------------------
; sub_23820                                                       23820  96 PC
;-----------------------------------------------------------------------------
sub_23820:
        cmp dword [dword_1770C7], byte 0
        jge short .2
        xor eax, eax
.1:
        add eax, 88h
        mov dword [dword eax+dword_15D254], 0FFFFFFFFh
        cmp eax, 990h
        jne short .1
        mov dword [dword_1176E1], 0FFFFFFFFh
        ret
.2:
        cmp dword [dword_1770CF], byte 0
        jne short .3
        cmp dword [dword_1176E1], byte 0FFFFFFFFh
        je short .4
.3:
        cmp dword [dword_1176E1], byte 0FFFFFFFFh
        jne short .5
.4:
        mov eax, dword [dword_1770C7]
        mov dword [dword_1176E1], eax
        mov eax, dword [dword_1770CB]
        mov dword [dword_15E4B4], eax
        mov eax, dword [dword_1770BF]
        mov dword [dword_15E4B8], eax
        mov eax, dword [dword_1770C3]
        mov dword [dword_15E4B0], eax
        call sub_23476
.5:
        mov eax, dword [dword_1770CF]
sub_23820_79:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1Ch, 0
        push eax
        mov dword [byte ebp-010h], unk_159F58
        mov dword [byte ebp-04h], unk_15AE88
        mov dword [byte ebp-08h], 0
        mov dword [byte ebp-0Ch], 0
        jmp near sub_23656_1A8
;-----------------------------------------------------------------------------
; sub_238C4                                                       238C4  96 PC
;-----------------------------------------------------------------------------
sub_238C4:
        push ecx
        push esi
        push edi
        enter 18h, 0
        mov edi, eax
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-014h], ebx
        mov esi, dword_15D2B8
        mov dword [byte ebp-010h], 7FFFFFFFh
        mov dword [edx], 0FFFFFFFFh
        mov dword [byte ebp-08h], 0
        mov dword [ebx], 0FFFFFFFFh
.1:
        mov eax, dword [dword esi+080h]
        mov edx, dword_15BE80
        shl eax, 2
        add edx, eax
        mov dword [byte ebp-04h], 0
        mov dword [byte ebp-0Ch], edx
        jmp short .4
.2:
        mov eax, dword [byte ebp-0Ch]
        mov eax, dword [eax]
        mov edx, dword [byte eax+08h]
        sub edx, dword [byte edi+08h]
        mov eax, dword [eax]
        push edx
        sub eax, dword [edi]
        push eax
        call vecdist
        add esp, byte 8
        cmp eax, dword [byte ebp-010h]
        jge short .3
        mov ebx, dword [byte ebp-018h]
        mov edx, dword [byte ebp-08h]
        mov dword [ebx], edx
        mov ebx, dword [byte ebp-014h]
        mov edx, dword [byte ebp-04h]
        mov dword [byte ebp-010h], eax
        mov dword [ebx], edx
.3:
        inc dword [byte ebp-04h]
        add dword [byte ebp-0Ch], byte 4
.4:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [dword esi+084h]
        jl short .2
        inc dword [byte ebp-08h]
        add esi, 88h
        cmp dword [byte ebp-08h], byte 4
        jl short .1
        leave
        pop edi
        pop esi
        pop ecx
        ret
;-----------------------------------------------------------------------------
; sub_23965                                                       23965  96 PC
;-----------------------------------------------------------------------------
sub_23965:
        push ebx
        push ecx
        push esi
        enter 8, 0
        mov ecx, eax
        mov esi, edx
        test edx, edx
        jle near .6
        mov edx, dword [byte eax+08h]
        mov eax, dword [eax]
        call sub_23E06
        cmp eax, dword [dword_15E844]
        jle near .6
        lea ebx, [byte ebp-08h]
        lea edx, [byte ebp-04h]
        mov eax, ecx
        call sub_23106
        cmp dword [byte ebp-04h], byte 0FFFFFFFFh
        je near .6
        cmp dword [byte ebp-04h], byte 4
        jge near .6
        cmp dword [dword_15E4A0], byte 0
        je short .1
        mov dword [dword_15E4A0], 0
        call sub_23AF8
.1:
        mov ebx, dword_15E4A8
        mov edx, dword_15E4AC
        mov eax, ecx
        call sub_238C4
        cmp dword [dword_15E4AC], byte 0FFFFFFFFh
        je near .6
        imul ecx, dword [dword_15E4AC], dword 88h
        add ecx, dword_15D2B8
        cmp dword [dword_15E4AC], byte 0
        jne short .2
        cmp dword [dword_15E4A8], byte 4
        jl short .2
        mov eax, dword [dword_15E4A8]
        dec eax
        dec eax
        cmp eax, byte 4
        jge short .3
        mov eax, 4
        jmp short .3
.2:
        mov eax, dword [dword_15E4A8]
        dec eax
        dec eax
        test eax, eax
        jge short .3
        xor eax, eax
.3:
        mov dword [dword_15E4A4], eax
        cmp dword [dword_15E4AC], byte 0
        jne short .4
        cmp dword [dword_15E4A8], byte 4
        jge short .4
        mov eax, dword [dword_15E4A8]
        inc eax
        inc eax
        cmp eax, byte 4
        jle short .5
        mov eax, 4
        jmp short .5
.4:
        mov eax, dword [dword ecx+084h]
        mov edx, dword [dword_15E4A8]
        dec eax
        inc edx
        inc edx
        cmp eax, edx
        jl short .5
        mov eax, edx
.5:
        mov dword [dword_15E49C], eax
        mov dword [dword_15E494], esi
        call GetTicks
        mov dword [dword_15E4A0], 1
        mov dword [dword_15E498], eax
        mov dword [dword_15E4C0], eax
.6:
        leave
        pop esi
        pop ecx
        pop ebx
sub_23965_129:
        ret
.7:
        test ebx, ebx
        jne short .9
        mov ecx, dword [eax]
        mov edi, dword [dword_15E7B0]
.8:
        mov dword [ecx], edi
        jmp short .13
.9:
        cmp ebx, byte 1
        jne short .10
        mov ecx, dword [eax]
        mov edi, dword [dword_15E7B4]
        jmp short .12
.10:
        cmp ebx, byte 2
        jne short .11
        mov ecx, dword [eax]
        mov edi, dword [dword_15E7A8]
        jmp short .8
.11:
        mov ecx, dword [eax]
        mov edi, dword [dword_15E7A4]
.12:
        mov dword [byte ecx+08h], edi
.13:
        add eax, byte 4
        inc esi
sub_23965_167:
        cmp esi, dword [dword edx+084h]
        jl short sub_23965_129.7
        inc ebx
        add edx, 88h
        cmp ebx, byte 4
        jl short sub_23AF8_C
        jmp near sub_24D8C_1A4
;-----------------------------------------------------------------------------
; sub_23AE5                                                       23AE5  96 PC
;-----------------------------------------------------------------------------
sub_23AE5:
        cmp dword [dword_15E4A0], byte 0
        je short sub_23965_129
        mov dword [dword_15E4A0], 0
sub_23AF8:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov edx, dword_15D2B8
        xor ebx, ebx
sub_23AF8_C:
        mov eax, dword [dword edx+080h]
        shl eax, 2
        xor esi, esi
        add eax, dword_15BE80
        jmp short sub_23965_167
;-----------------------------------------------------------------------------
; sub_23B16                                                       23B16  96 PC
;-----------------------------------------------------------------------------
sub_23B16:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        cmp dword [dword_15E4A0], byte 0
        je near sub_24D8C_1A3
        sub eax, dword [dword_15E498]
        imul edx, eax, dword 258h
        mov ebx, dword [dword_15E494]
        sub ebx, edx
        mov edx, ebx
        test ebx, ebx
        jge short .1
        cmp dword [dword_15E4A0], byte 0
        je near sub_24D8C_1A3
        mov dword [dword_15E4A0], 0
        call sub_23AF8
        jmp near sub_24D8C_1A3
.1:
        shl eax, 4
        mov dword [byte ebp-04h], eax
        imul eax, dword [dword_15E4AC], dword 88h
        add eax, dword_15D2B8
        mov eax, dword [dword eax+080h]
        mov ebx, dword [dword_15E4A4]
        shl eax, 2
        shl ebx, 2
        add eax, dword_15BE80
        add ebx, eax
        mov eax, 0Ah
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov esi, dword [dword_15E4A4]
        mov edi, eax
        jmp near .11
.2:
        mov eax, esi
        sub eax, dword [dword_15E4A8]
        test eax, eax
        jge short .3
        neg eax
.3:
        mov edx, dword [byte ebp-04h]
        shl eax, 7
        sub edx, eax
        mov eax, edx
        shl ah, 7
        sbb edx, edx
        add ah, ah
        sbb ecx, ecx
        xor eax, ecx
        and eax, 0FFh
        sub eax, ecx
        mov eax, dword [nosplit eax*4+dword_122390]
        xor eax, edx
        sub eax, edx
        mov edx, eax
        mov eax, edi
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, eax
        mov eax, esi
        sub eax, dword [dword_15E4A8]
        test eax, eax
        jge short .4
        neg eax
.4:
        imul eax, dword 1388h
        mov edx, 10000h
        sub edx, eax
        mov eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp dword [dword_15E4AC], byte 0
        jne short .6
        mov edx, dword [dword_15E7B0]
        sub edx, eax
.5:
        mov eax, dword [ebx]
        mov dword [eax], edx
        jmp short .10
.6:
        cmp dword [dword_15E4AC], byte 1
        jne short .7
        mov edx, dword [dword_15E7B4]
        sub edx, eax
        jmp short .9
.7:
        cmp dword [dword_15E4AC], byte 2
        jne short .8
        mov edx, dword [dword_15E7A8]
        add edx, eax
        jmp short .5
.8:
        cmp dword [dword_15E4AC], byte 3
        jne short .10
        mov edx, dword [dword_15E7A4]
        add edx, eax
.9:
        mov eax, dword [ebx]
        mov dword [byte eax+08h], edx
.10:
        inc esi
        add ebx, byte 4
.11:
        cmp esi, dword [dword_15E49C]
        jle near .2
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_23C91                                                       23C91  96 PC
;-----------------------------------------------------------------------------
sub_23C91:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4, 0
        cmp byte [byte_1770B2], 0
        jne short .1
        call sub_23AF8
        jmp near sub_24D8C_1A3
.1:
        imul edx, dword [dword_1770BB], dword 258h
        mov eax, dword [dword_1770B7]
        sub eax, edx
        mov edx, eax
        test eax, eax
        jl near sub_24D8C_1A3
        mov eax, dword [dword_1770BB]
        shl eax, 4
        mov dword [byte ebp-04h], eax
        movsx eax, byte [byte_1770B3]
        imul eax, dword 88h
        add eax, dword_15D2B8
        mov eax, dword [dword eax+080h]
        mov ebx, dword_15BE80
        shl eax, 2
        add ebx, eax
        movsx eax, byte [byte_1770B5]
        shl eax, 2
        add ebx, eax
        mov eax, 0Ah
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        movsx esi, byte [byte_1770B5]
        mov edi, eax
        jmp near .11
.2:
        movsx eax, byte [byte_1770B4]
        mov edx, esi
        sub edx, eax
        mov eax, edx
        test edx, edx
        jge short .3
        neg eax
.3:
        mov edx, dword [byte ebp-04h]
        shl eax, 7
        sub edx, eax
        mov eax, edx
        shl ah, 7
        sbb edx, edx
        add ah, ah
        sbb ecx, ecx
        xor eax, ecx
        and eax, 0FFh
        sub eax, ecx
        mov eax, dword [nosplit eax*4+dword_122390]
        xor eax, edx
        sub eax, edx
        mov edx, eax
        mov eax, edi
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ecx, eax
        mov edx, esi
        movsx eax, byte [byte_1770B4]
        sub edx, eax
        mov eax, edx
        test edx, edx
        jge short .4
        neg eax
.4:
        imul eax, dword 1388h
        mov edx, 10000h
        sub edx, eax
        mov eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp byte [byte_1770B3], 0
        jne short .6
        mov edx, dword [dword_15E7B0]
        sub edx, eax
.5:
        mov eax, dword [ebx]
        mov dword [eax], edx
        jmp short .10
.6:
        movsx edx, byte [byte_1770B3]
        cmp edx, byte 1
        jne short .7
        mov edx, dword [dword_15E7B4]
        sub edx, eax
        jmp short .9
.7:
        cmp edx, byte 2
        jne short .8
        mov edx, dword [dword_15E7A8]
        add edx, eax
        jmp short .5
.8:
        cmp edx, byte 3
        jne short .10
        mov edx, dword [dword_15E7A4]
        add edx, eax
.9:
        mov eax, dword [ebx]
        mov dword [byte eax+08h], edx
.10:
        inc esi
        add ebx, byte 4
.11:
        movsx eax, byte [byte_1770B6]
        cmp esi, eax
        jle near .2
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_23E06                                                       23E06  96 PC
;-----------------------------------------------------------------------------
sub_23E06:
        push ebx
        mov ebx, eax
        movsx eax, dx
        cmp eax, dword [dword_15E820]
        jl short .2
.1:
        mov eax, dword [dword_15E874]
        pop ebx
        ret
.2:
        mov edx, dword [dword_15E820]
        neg edx
        cmp eax, edx
        jle short .1
        test bx, bx
        jg short .3
        cmp eax, dword [dword_15E85C]
        jge short .3
        mov edx, dword [dword_15E85C]
        neg edx
        cmp eax, edx
        jle short .3
        mov eax, dword [dword_15E844]
        pop ebx
        ret
.3:
        mov eax, dword [dword_15E83C]
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_23E4E                                                       23E4E  96 PC
;-----------------------------------------------------------------------------
sub_23E4E:
        push ebx
        push ecx
        push esi
        push edi
        enter 20h, 0
        mov esi, eax
        mov ecx, edx
        movsx edx, word [byte eax+08h]
        movsx eax, word [eax]
        call sub_23E06
        cmp eax, dword [dword_15E844]
        jne short .2
.1:
        xor eax, eax
        jmp near sub_27E24_F6
.2:
        mov dword [byte ecx+08h], 0
        mov eax, dword [byte ecx+08h]
        lea ebx, [byte ebp-04h]
        mov dword [byte ecx+04h], eax
        lea edx, [byte ebp-08h]
        mov dword [ecx], eax
        mov eax, esi
        call sub_23106
        cmp dword [byte ebp-08h], byte 0FFFFFFFFh
        je short .1
        imul eax, dword [byte ebp-08h], dword 88h
        add eax, dword_15D2B8
        mov edx, dword [byte eax+020h]
        shl edx, 2
        mov eax, dword [byte ebp-04h]
        add edx, dword_15DD10
        mov eax, dword [edx+eax*4]
        mov eax, dword [byte eax+04h]
        imul ebx, dword [eax], byte 0Ch
        mov esi, dword [dword_15E8E4]
        mov edx, dword [byte esi+070h]
        lea edi, [byte ebp-014h]
        lea esi, [edx+ebx]
        add eax, byte 4
        movsd
        movsd
        movsd
        imul esi, dword [eax], byte 0Ch
        lea edi, [byte ebp-020h]
        add esi, edx
        mov eax, dword [byte ebp-014h]
        movsd
        movsd
        movsd
        add eax, dword [byte ebp-020h]
        sar eax, 1
        mov dword [ecx], eax
        mov eax, dword [byte ebp-010h]
        add eax, dword [byte ebp-01Ch]
        sar eax, 1
        mov dword [byte ecx+04h], eax
        mov eax, dword [byte ebp-0Ch]
        add eax, dword [byte ebp-018h]
        sar eax, 1
        mov dword [byte ecx+08h], eax
        mov eax, 1
        jmp near sub_27E24_F6
;-----------------------------------------------------------------------------
; sub_23F05                                                       23F05  96 PC
;-----------------------------------------------------------------------------
sub_23F05:
        push ebx
        mov ebx, eax
        mov dword [dword_15E484], 0
        mov dword [dword_15E488], 0
        mov dword [dword_15E490], eax
        mov dword [dword_15E48C], edx
        mov dword [dword_15E484], 1
        xor eax, eax
.1:
        test ebx, ebx
        je short .2
        mov edx, dword [dword_15E7B4]
        jmp short .3
.2:
        mov edx, dword [dword_15E7A4]
.3:
        add eax, byte 0Ch
        mov dword [dword eax+word_158D74], edx
        cmp eax, byte 30h
        jne short .1
        pop ebx
        ret
        mov dword [dword_15E484], 0
        mov dword [dword_15E488], 0
        ret
;-----------------------------------------------------------------------------
; sub_23F6A                                                       23F6A  96 PC
;-----------------------------------------------------------------------------
sub_23F6A:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        cmp dword [dword_15E484], byte 0
        je near sub_24D8C_1A3
        sub eax, dword [dword_15E48C]
        cmp eax, 258h
        jle short .1
        mov dword [dword_15E484], 0
        mov dword [dword_15E488], 0
        jmp near sub_24D8C_1A3
.1:
        imul edi, eax, dword 0C4h
        push edi
        call sub_BA4F0
        add esp, byte 4
        mov esi, eax
        test eax, eax
        jge short .2
        neg eax
.2:
        push eax
        push dword 0FFh
        push dword 0C8h
        call sub_B9BB0
        add esp, byte 0Ch
        test esi, esi
        jge short .3
        mov edx, esi
        neg edx
        jmp short .4
.3:
        mov edx, esi
.4:
        mov eax, 0C8h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov dword [dword_15E488], 0
        test esi, esi
        je near sub_24D8C_1A3
        lea eax, [dword edi+01999h]
        push eax
        mov dword [byte ebp-04h], eax
        call sub_BA4F0
        add esp, byte 4
        mov dword [byte ebp-08h], eax
        test eax, eax
        je near sub_24D8C_1A3
        push edi
        call sub_BA55C
        add esp, byte 4
        push dword [byte ebp-04h]
        mov edi, eax
        call sub_BA55C
        add esp, byte 4
        mov dword [byte ebp-0Ch], eax
        test esi, esi
        setg al
        movzx eax, al
        mov edx, eax
        cmp dword [byte ebp-08h], byte 0
        setg al
        movzx eax, al
        cmp edx, eax
        jne near sub_24D8C_1A3
        imul eax, edi, byte 28h
        mov ebx, esi
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov edi, eax
        imul eax, dword [byte ebp-0Ch], byte 28h
        mov ebx, dword [byte ebp-08h]
        sar edi, 10h
        cdq
        idiv ebx
        mov ecx, eax
        xor eax, eax
        shrd eax, edx, 10h
        sar edx, 10h
        idiv ebx
        shl ecx, 10h
        add eax, ecx
        mov esi, eax
        mov dword [dword_15E488], 1
        sar esi, 10h
        cmp edi, dword [dword_15E480]
        jle short .5
        mov edi, dword [dword_15E480]
        jmp short .6
.5:
        mov eax, dword [dword_15E480]
        neg eax
        cmp edi, eax
        jge short .6
        mov edi, eax
.6:
        cmp esi, dword [dword_15E480]
        jle short .7
        mov esi, dword [dword_15E480]
        jmp short .8
.7:
        mov eax, dword [dword_15E480]
        neg eax
        cmp esi, eax
        jge short .8
        mov esi, eax
.8:
        mov dword [dword_158D78], edi
        mov dword [dword_158D84], esi
        mov dword [dword_158D90], esi
        mov dword [dword_158D9C], edi
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_240F4                                                       240F4  96 PC
;-----------------------------------------------------------------------------
sub_240F4:
        push ebx
        push ecx
        push esi
        push edi
        mov edi, eax
        mov esi, dword [edx]
        imul edx, dword [edx], byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov ebx, dword [byte eax+07Ch]
        mov eax, dword [byte eax+078h]
        shl esi, 3
        push dword [byte edx+eax+08h]
        add esi, ebx
        call sub_625AA
        mov ebx, eax
        add esp, byte 4
        movsx eax, word [byte edi+04h]
        mov edx, ebx
        sar eax, 1
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, dword [esi]
        push dword [byte esi+04h]
        sub edx, eax
        push edx
        push edi
        push ebx
        call sub_BB924
        add esp, byte 10h
        pop edi
        pop esi
        pop ecx
        pop ebx
sub_240F4_55:
        ret
;-----------------------------------------------------------------------------
; sub_2414A                                                       2414A  96 PC
;-----------------------------------------------------------------------------
sub_2414A:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 60h, 0
        cmp dword [dword_15E488], byte 0
        je near sub_24D8C_1A3
        cmp dword [dword_11A3F8], byte 0
        jne near sub_24D8C_1A3
        lea eax, [byte ebp-010h]
        push eax
        push unk_15E88C
        push dword_15E87C
        call sub_BB9C4
        add esp, byte 0Ch
        lea eax, [byte ebp-060h]
        push eax
        push unk_15E88C
        push dword_158D78
        push byte 4
        lea esi, [byte ebp-060h]
        xor edi, edi
        call sub_BB470
        add esp, byte 10h
.1:
        imul eax, edi, byte 0Ch
        push esi
        mov dword [byte ebp-04h], eax
        lea eax, [byte ebp-010h]
        push eax
        push esi
        call sub_B9C3C
        mov eax, dword [byte ebp-04h]
        add esp, byte 0Ch
        cmp dword [byte eax+ebp-058h], byte 50h
        jl near sub_24D8C_1A3
        inc edi
        add esi, byte 0Ch
        cmp edi, byte 4
        jl short .1
        push byte 10h
        lea eax, [byte ebp-030h]
        push eax
        lea eax, [byte ebp-060h]
        push eax
        push byte 4
        call sub_BBAA0
        add esp, byte 10h
        lea eax, [byte ebp-030h]
        push eax
        push dword [dword_15E47C]
        call sub_BBB70
sub_2414A_A4:
        add esp, byte 8
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_241F6                                                       241F6  96 PC
;-----------------------------------------------------------------------------
sub_241F6:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0Ch, 0
        push byte 0
        mov eax, dword [dword_15E8E4]
        push dword [byte eax+07Ch]
        push dword [byte eax+078h]
        call sub_B78C0
        mov eax, dword [dword_15E87C]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E7B0]
        setge al
        movzx eax, al
        mov dword [dword_15D2BC], eax
        mov eax, dword [dword_15E884]
        cmp eax, dword [dword_15E7B4]
        setge al
        movzx eax, al
        mov dword [dword_15D344], eax
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        setle al
        movzx eax, al
        mov dword [dword_15D3CC], eax
        mov eax, dword [dword_15E884]
        cmp eax, dword [dword_15E7A4]
        setle al
        mov esi, dword_15D2B8
        movzx eax, al
        xor edi, edi
        mov dword [dword_15D454], eax
.1:
        mov eax, dword [byte esi+018h]
        mov edx, dword_15DC48
        shl eax, 2
        mov dword [byte ebp-04h], 0
        add edx, eax
        mov dword [esi], 0
        mov dword [byte ebp-08h], edx
        jmp short .3
.2:
        mov eax, dword [byte ebp-08h]
        mov eax, dword [eax]
        push dword [byte eax+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        sete al
        movzx eax, al
        mov dword [esi], eax
        test eax, eax
        jne short .4
        inc dword [byte ebp-04h]
        add dword [byte ebp-08h], byte 4
.3:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte esi+0Ch]
        jl short .2
.4:
        cmp dword [byte esi+04h], byte 0
        sete al
        add esi, 88h
        movzx eax, al
        inc edi
        mov dword [byte esi-080h], eax
        cmp edi, byte 4
        jge short .7
        jmp short .1
.5:
        mov eax, dword [byte esi+018h]
        mov eax, dword [nosplit eax*4+dword_15DC48]
        push dword [byte eax+04h]
        push byte 4
        mov dword [byte ebp-0Ch], eax
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        sete al
        movzx eax, al
        mov dword [esi], eax
        test eax, eax
        je short .6
        mov eax, dword [byte ebp-0Ch]
        push dword [byte eax+04h]
        call sub_B79C8
        add esp, byte 4
        test eax, eax
        setl al
        movzx eax, al
        mov dword [byte esi+04h], eax
.6:
        add esi, 88h
        inc edi
        mov dword [byte esi-080h], 0
.7:
        cmp edi, byte 12h
        jl short .5
        cmp dword [dword_15D2C0], byte 0
        jne short .8
        cmp dword [dword_15D348], byte 0
        je short .10
.8:
        mov eax, 220h
.9:
        add eax, 88h
        mov dword [dword eax+dword_15D238], 1
        cmp eax, 3B8h
        jne short .9
.10:
        cmp dword [dword_15D348], byte 0
        jne short .11
        cmp dword [dword_15D3D0], byte 0
        je short .13
.11:
        mov eax, 3B8h
.12:
        add eax, 88h
        mov dword [dword eax+dword_15D238], 1
        cmp eax, 550h
        jne short .12
.13:
        cmp dword [dword_15D3D0], byte 0
        jne short .14
        cmp dword [dword_15D458], byte 0
        je short .16
.14:
        mov eax, 550h
.15:
        add eax, 88h
        mov dword [dword eax+dword_15D238], 1
        cmp eax, 6E8h
        jne short .15
.16:
        cmp dword [dword_15D458], byte 0
        jne short .17
        cmp dword [dword_15D2C0], byte 0
        je near sub_24D8C_1A3
.17:
        mov eax, 6E8h
.18:
        add eax, 88h
        mov dword [dword eax+dword_15D238], 1
        cmp eax, 880h
        jne short .18
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_243ED                                                       243ED  96 PC
;-----------------------------------------------------------------------------
sub_243ED:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 44h, 0
        push eax
        mov eax, dword [dword_15E8E4]
        mov dword [byte ebp-04h], dword_15D2B8
        mov dword [byte ebp-08h], 0
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-0Ch], eax
.1:
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-048h]
        jne near .5
        mov eax, dword [byte ebp-04h]
        mov dword [byte ebp-018h], 0
        mov dword [byte ebp-014h], eax
        jmp near .4
.2:
        mov eax, dword [byte ebp-014h]
        mov eax, dword [byte eax+030h]
        imul esi, eax, byte 0Ch
        mov ebx, dword [byte ebp-014h]
        lea edi, [byte ebp-038h]
        add esi, dword [byte ebp-0Ch]
        mov ebx, dword [byte ebx+034h]
        movsd
        movsd
        movsd
        imul esi, ebx, byte 0Ch
        lea edi, [byte ebp-044h]
        add esi, dword [byte ebp-0Ch]
        movsd
        movsd
        movsd
        shl eax, 3
        mov esi, dword [byte ebp-010h]
        lea edi, [byte ebp-02Ch]
        add esi, eax
        lea ecx, [byte ebp-044h]
        lea edx, [byte ebp-024h]
        movsd
        movsd
        shl ebx, 3
        mov esi, dword [byte ebp-010h]
        lea edi, [byte ebp-024h]
        add esi, ebx
        lea eax, [byte ebp-02Ch]
        lea ebx, [byte ebp-038h]
        movsd
        movsd
        call sub_220FB
        test eax, eax
        je short .3
        push dword [dword_15E8C0]
        lea eax, [byte ebp-038h]
        push eax
        call sub_BA2F0
        add esp, byte 8
        mov esi, eax
        push dword [dword_15E8C0]
        lea eax, [byte ebp-044h]
        push eax
        call sub_BA2F0
        add esp, byte 8
        push eax
        push esi
        push dword [dword_15E814]
        push dword [byte ebp-020h]
        push dword [byte ebp-024h]
        push dword [byte ebp-028h]
        push dword [byte ebp-02Ch]
        call sub_87DD6
        add esp, byte 1Ch
.3:
        add dword [byte ebp-014h], byte 8
        inc dword [byte ebp-018h]
.4:
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-018h]
        cmp eax, dword [byte edx+028h]
        jl near .2
.5:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
        cmp dword [byte ebp-08h], byte 4
        jge near .8
        jmp near .1
.6:
        mov eax, dword [byte ebp-04h]
        cmp dword [eax], byte 0
        je short .7
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-048h]
        jne short .7
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+030h]
        mov dword [byte ebp-01Ch], eax
        imul eax, byte 0Ch
        push dword [dword_15E8C0]
        add eax, dword [byte ebp-0Ch]
        mov edi, dword [byte ebp-04h]
        push eax
        mov edi, dword [byte edi+034h]
        call sub_BA2F0
        mov esi, eax
        imul eax, edi, byte 0Ch
        add esp, byte 8
        push dword [dword_15E8C0]
        add eax, dword [byte ebp-0Ch]
        push eax
        call sub_BA2F0
        add esp, byte 8
        push eax
        mov eax, edi
        push esi
        shl eax, 3
        push dword [dword_15E814]
        add eax, dword [byte ebp-010h]
        push dword [byte eax+04h]
        push dword [eax]
        mov eax, dword [byte ebp-01Ch]
        shl eax, 3
        add eax, dword [byte ebp-010h]
        push dword [byte eax+04h]
        push dword [eax]
        call sub_87DD6
        add esp, byte 1Ch
.7:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
.8:
        cmp dword [byte ebp-08h], byte 10h
        jl near .6
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_2458D                                                       2458D  96 PC
;-----------------------------------------------------------------------------
sub_2458D:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 44h, 0
        push eax
        mov eax, dword [dword_15E8E4]
        mov dword [byte ebp-04h], dword_15D2B8
        mov dword [byte ebp-08h], 0
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        mov dword [byte ebp-010h], edx
        mov dword [byte ebp-0Ch], eax
.1:
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-048h]
        jne near .5
        mov eax, dword [byte ebp-04h]
        mov dword [byte ebp-018h], 0
        mov dword [byte ebp-014h], eax
        jmp near .4
.2:
        mov eax, dword [byte ebp-014h]
        mov eax, dword [byte eax+048h]
        imul esi, eax, byte 0Ch
        mov ebx, dword [byte ebp-014h]
        lea edi, [byte ebp-038h]
        add esi, dword [byte ebp-0Ch]
        mov ebx, dword [byte ebx+04Ch]
        movsd
        movsd
        movsd
        imul esi, ebx, byte 0Ch
        lea edi, [byte ebp-044h]
        add esi, dword [byte ebp-0Ch]
        movsd
        movsd
        movsd
        shl eax, 3
        mov esi, dword [byte ebp-010h]
        lea edi, [byte ebp-02Ch]
        add esi, eax
        lea ecx, [byte ebp-044h]
        lea edx, [byte ebp-024h]
        movsd
        movsd
        shl ebx, 3
        mov esi, dword [byte ebp-010h]
        lea edi, [byte ebp-024h]
        add esi, ebx
        lea eax, [byte ebp-02Ch]
        lea ebx, [byte ebp-038h]
        movsd
        movsd
        call sub_220FB
        test eax, eax
        je short .3
        push dword [dword_15E8B8]
        lea eax, [byte ebp-038h]
        push eax
        call sub_BA2F0
        add esp, byte 8
        mov esi, eax
        push dword [dword_15E8B8]
        lea eax, [byte ebp-044h]
        push eax
        call sub_BA2F0
        add esp, byte 8
        push eax
        push esi
        push dword [dword_15E804]
        push dword [byte ebp-020h]
        push dword [byte ebp-024h]
        push dword [byte ebp-028h]
        push dword [byte ebp-02Ch]
        call sub_87DD6
        add esp, byte 1Ch
.3:
        add dword [byte ebp-014h], byte 8
        inc dword [byte ebp-018h]
.4:
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-018h]
        cmp eax, dword [byte edx+02Ch]
        jl near .2
.5:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
        cmp dword [byte ebp-08h], byte 4
        jge near .8
        jmp near .1
.6:
        mov eax, dword [byte ebp-04h]
        cmp dword [eax], byte 0
        je short .7
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-048h]
        jne short .7
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+048h]
        mov dword [byte ebp-01Ch], eax
        imul eax, byte 0Ch
        push dword [dword_15E8B8]
        add eax, dword [byte ebp-0Ch]
        mov edi, dword [byte ebp-04h]
        push eax
        mov edi, dword [byte edi+04Ch]
        call sub_BA2F0
        mov esi, eax
        imul eax, edi, byte 0Ch
        add esp, byte 8
        push dword [dword_15E8B8]
        add eax, dword [byte ebp-0Ch]
        push eax
        call sub_BA2F0
        add esp, byte 8
        push eax
        mov eax, edi
        push esi
        shl eax, 3
        push dword [dword_15E804]
        add eax, dword [byte ebp-010h]
        push dword [byte eax+04h]
        push dword [eax]
        mov eax, dword [byte ebp-01Ch]
        shl eax, 3
        add eax, dword [byte ebp-010h]
        push dword [byte eax+04h]
        push dword [eax]
        call sub_87DD6
        add esp, byte 1Ch
.7:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
.8:
        cmp dword [byte ebp-08h], byte 10h
        jl near .6
        jmp near sub_24D8C_1A3
.9:
        mov eax, dword [byte ebp-018h]
        mov eax, dword [eax]
        mov eax, dword [byte eax+04h]
        mov edx, dword [eax]
        imul esi, edx, byte 0Ch
        lea edi, [byte ebp-04Ch]
        add esi, dword [byte ebp-010h]
        mov eax, dword [byte eax+04h]
        movsd
        movsd
        movsd
        imul esi, eax, byte 0Ch
        lea edi, [byte ebp-040h]
        add esi, dword [byte ebp-010h]
        movsd
        movsd
        movsd
        shl edx, 3
        mov esi, dword [byte ebp-0Ch]
        lea edi, [byte ebp-02Ch]
        add esi, edx
        lea ecx, [byte ebp-040h]
        lea ebx, [byte ebp-04Ch]
        movsd
        movsd
        shl eax, 3
        mov esi, dword [byte ebp-0Ch]
        lea edi, [byte ebp-034h]
        add esi, eax
        lea edx, [byte ebp-034h]
        lea eax, [byte ebp-02Ch]
        movsd
        movsd
        call sub_220FB
        test eax, eax
        je short .10
        push dword [dword_15E8BC]
        lea eax, [byte ebp-04Ch]
        push eax
        call sub_BA2F0
        add esp, byte 8
        mov esi, eax
        push dword [dword_15E8BC]
        lea eax, [byte ebp-040h]
        push eax
        call sub_BA2F0
        add esp, byte 8
        push eax
        push esi
        push dword [dword_15E7DC]
        push dword [byte ebp-030h]
        push dword [byte ebp-034h]
        push dword [byte ebp-028h]
        push dword [byte ebp-02Ch]
        call sub_87DD6
        add esp, byte 1Ch
.10:
        inc dword [byte ebp-014h]
        add dword [byte ebp-018h], byte 4
sub_2458D_23D:
        mov edx, dword [byte ebp-04h]
        mov eax, dword [byte ebp-014h]
        cmp eax, dword [byte edx+010h]
        jl near sub_2458D.9
sub_2458D_24C:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
        cmp dword [byte ebp-08h], byte 4
        jge near .15
        jmp near sub_24D32_2C
.11:
        mov eax, dword [byte ebp-04h]
        cmp dword [eax], byte 0
        je near .14
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-050h]
        jne near .14
        mov esi, dword [byte ebp-04h]
        mov esi, dword [byte esi+01Ch]
        shl esi, 2
        xor edi, edi
        add esi, dword_15CE50
        jmp short .13
.12:
        mov eax, dword [esi]
        mov eax, dword [byte eax+04h]
        mov edx, dword [eax]
        mov eax, dword [byte eax+04h]
        mov dword [byte ebp-020h], edx
        mov dword [byte ebp-024h], eax
        imul eax, edx, byte 0Ch
        push dword [dword_15E8BC]
        add eax, dword [byte ebp-010h]
        push eax
        call sub_BA2F0
        mov dword [byte ebp-01Ch], eax
        imul eax, dword [byte ebp-024h], byte 0Ch
        add esp, byte 8
        push dword [dword_15E8BC]
        add eax, dword [byte ebp-010h]
        push eax
        call sub_BA2F0
        mov edx, dword [byte ebp-024h]
        add esp, byte 8
        mov ebx, eax
        mov eax, dword [byte ebp-020h]
        push ebx
        shl edx, 3
        push dword [byte ebp-01Ch]
        add edx, dword [byte ebp-0Ch]
        push dword [dword_15E7DC]
        shl eax, 3
        push dword [byte edx+04h]
        add eax, dword [byte ebp-0Ch]
        push dword [edx]
        push dword [byte eax+04h]
        inc edi
        push dword [eax]
        add esi, byte 4
        call sub_87DD6
        add esp, byte 1Ch
.13:
        mov eax, dword [byte ebp-04h]
        cmp edi, dword [byte eax+010h]
        jl short .12
.14:
        inc dword [byte ebp-08h]
        add dword [byte ebp-04h], 88h
.15:
        cmp dword [byte ebp-08h], byte 10h
        jl near .11
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_248B0                                                       248B0  96 PC
;-----------------------------------------------------------------------------
sub_248B0:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov edi, eax
        push byte 0
        mov edx, dword [dword_15E900]
        push dword [byte edx+07Ch]
        push dword [byte edx+078h]
        xor esi, esi
        call sub_B78C0
        mov ecx, dword_15D2B8
        add esp, byte 0Ch
.1:
        cmp dword [ecx], byte 0
        je near .10
        cmp edi, dword [byte ecx+08h]
        jne short .2
        cmp esi, byte 4
        jl short .3
.2:
        cmp esi, byte 4
        jl near .10
        test edi, edi
        je near .10
.3:
        mov eax, dword [byte ecx+070h]
        mov edx, unk_15D1D0
        shl eax, 2
        add edx, eax
        mov dword [byte ebp-04h], 0
        mov dword [byte ebp-08h], edx
        jmp short .5
.4:
        mov edx, dword [byte ebp-08h]
        mov ebx, 0FFFFFFFFh
        mov edx, dword [edx]
        inc dword [byte ebp-04h]
        mov eax, dword [dword_15E86C]
        mov edx, dword [byte edx+04h]
        add dword [byte ebp-08h], byte 4
        call sub_22494
.5:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte ecx+074h]
        jl short .4
        mov edx, dword [byte ecx+068h]
        shl edx, 2
        xor ebx, ebx
        add edx, unk_15D0E0
        jmp short .9
.6:
        cmp esi, byte 4
        jge short .7
        mov eax, dword [edx]
        call sub_22522
        jmp short .8
.7:
        mov eax, dword [edx]
        call sub_224DB
.8:
        inc ebx
        add edx, byte 4
.9:
        cmp ebx, dword [byte ecx+06Ch]
        jl short .6
.10:
        inc esi
        add ecx, 88h
        cmp esi, byte 10h
        jl near .1
        cmp byte [byte_1175AA], 0
        je short .17
        mov edx, dword_15D2B8
        xor esi, esi
.11:
        cmp dword [edx], byte 0
        je short .16
        cmp edi, dword [byte edx+08h]
        jne short .12
        cmp esi, byte 4
        jl short .13
.12:
        cmp esi, byte 4
        jl short .16
        test edi, edi
        je short .16
.13:
        mov ecx, dword [byte edx+078h]
        shl ecx, 2
        xor ebx, ebx
        add ecx, dword_15BDB8
        jmp short .15
.14:
        mov eax, dword [ecx]
        call sub_22522
        inc ebx
        add ecx, byte 4
.15:
        cmp ebx, dword [byte edx+07Ch]
        jl short .14
.16:
        inc esi
        add edx, 88h
        cmp esi, byte 10h
        jl short .11
.17:
        push byte 0
        mov edx, dword [dword_15E8E4]
        push dword [byte edx+07Ch]
        push dword [byte edx+078h]
        call sub_B78C0
        add esp, byte 0Ch
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_249E8                                                       249E8  96 PC
;-----------------------------------------------------------------------------
sub_249E8:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov esi, dword_15D2B8
        mov dword [byte ebp-04h], 0
.1:
        cmp dword [byte esi+060h], byte 0
        jle near .7
        cmp dword [byte esi+04h], byte 0
        je near .7
        mov edi, dword [byte esi+064h]
        shl edi, 2
        mov dword [byte ebp-08h], 0
        add edi, dword_15D1A8
        jmp short .6
.2:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne short .5
        mov eax, dword [edi]
        mov edx, dword [eax]
        shl edx, 8
        shr edx, 18h
        cmp edx, dword [dword_15E69C]
        jne short .3
        mov ecx, dword [byte eax+04h]
        mov ebx, dword [eax]
        mov eax, dword [dword_15E8E4]
        push dword [dword_15E7E0]
        jmp short .4
.3:
        mov ecx, dword [byte eax+04h]
        mov ebx, dword [eax]
        mov eax, dword [dword_15E8E4]
        push dword [dword_15E7EC]
.4:
        and ebx, byte 7
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        call sub_2242A
.5:
        inc dword [byte ebp-08h]
        add edi, byte 4
.6:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte esi+060h]
        jl short .2
.7:
        inc dword [byte ebp-04h]
        add esi, 88h
        cmp dword [byte ebp-04h], byte 10h
        jl near .1
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_24AA4                                                       24AA4  96 PC
;-----------------------------------------------------------------------------
sub_24AA4:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 10h, 0
        mov esi, dword_15D2B8
        mov dword [byte ebp-0Ch], 0
.1:
        cmp dword [esi], byte 0
        je near .6
        cmp dword [byte esi+04h], byte 0
        je near .6
        mov edi, dword [byte esi+018h]
        shl edi, 2
        mov dword [byte ebp-08h], 0
        add edi, dword_15DC48
        jmp near .5
.2:
        cmp byte [byte_1175A4], 0
        je short .3
        mov eax, dword [edi]
        mov dword [byte ebp-04h], eax
        test byte [eax], 80h
        je short .3
        mov eax, dword [dword_15E8E4]
        mov dword [byte ebp-010h], eax
        mov eax, dword [byte ebp-04h]
        push dword [byte eax+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne short .4
        mov eax, dword [byte ebp-04h]
        push dword [byte eax+04h]
        call sub_22734
        imul eax, byte 14h
        mov edx, dword [byte ebp-010h]
        mov edx, dword [byte edx+014h]
        push dword [byte edx+eax+0Ch]
        call sub_B81D0
        add esp, byte 8
        jmp short .4
.3:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne short .4
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        push dword [dword_15E838]
        call sub_B79E0
        add esp, byte 0Ch
.4:
        inc dword [byte ebp-08h]
        add edi, byte 4
.5:
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte esi+0Ch]
        jl near .2
.6:
        inc dword [byte ebp-0Ch]
        add esi, 88h
        cmp dword [byte ebp-0Ch], byte 10h
        jl near .1
        jmp near sub_24D8C_1A3
;-----------------------------------------------------------------------------
; sub_24B87                                                       24B87  96 PC
;-----------------------------------------------------------------------------
sub_24B87:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 124h, 0
        lea eax, [dword ebp-0124h]
        push eax
        call sub_DD8C8
        add esp, byte 4
        lea eax, [byte ebp-0Ch]
        push eax
        push unk_15E88C
        push dword_15E87C
        call sub_BB9C4
        imul eax, dword [dword_15E6C8], byte 3
        add esp, byte 0Ch
        push unk_15BF20
        push unk_15E88C
        push unk_15AE88
        push eax
        mov esi, unk_15BF20
        xor edi, edi
        call sub_BB470
        add esp, byte 10h
        jmp short .2
.1:
        push esi
        lea eax, [byte ebp-0Ch]
        push eax
        push esi
        inc edi
        call sub_B9C3C
        add esp, byte 0Ch
        add esi, byte 0Ch
.2:
        imul eax, dword [dword_15E6C8], byte 3
        cmp edi, eax
        jl short .1
        mov edi, unk_15BF20
        xor esi, esi
        jmp short .8
.3:
        push byte 10h
        lea eax, [byte ebp-024h]
        push eax
        push edi
        push byte 3
        call sub_BBAA0
        add esp, byte 10h
        cmp esi, byte 4
        jl short .6
        mov eax, esi
        mov ebx, 6
        cdq
        idiv ebx
        test edx, edx
        je short .4
        push unk_15DF20
        jmp short .5
.4:
        push unk_15E020
.5:
        call sub_DD8B0
        add esp, byte 4
.6:
        lea eax, [byte ebp-024h]
        push eax
        push byte 3
        call sub_E1575
        add esp, byte 8
        cmp dword [dword_15E4B8], byte 4
        jne short .7
        cmp esi, byte 4
        jge short .7
        lea eax, [byte ebp-024h]
        push eax
        push byte 3
        call sub_E1575
        add esp, byte 8
.7:
        add edi, byte 24h
        inc esi
.8:
        cmp esi, dword [dword_15E6C8]
        jl short .3
        lea eax, [dword ebp-0124h]
        jmp near sub_24D8C_19A
;-----------------------------------------------------------------------------
; sub_24C7C                                                       24C7C  96 PC
;-----------------------------------------------------------------------------
sub_24C7C:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        push eax
        mov esi, dword_15D2B8
        mov dword [byte ebp-08h], 0
.1:
        cmp dword [esi], byte 0
        je short .6
        mov eax, dword [byte esi+04h]
        cmp eax, dword [byte ebp-0Ch]
        jne short .6
        mov edi, dword [byte esi+020h]
        shl edi, 2
        mov dword [byte ebp-04h], 0
        add edi, dword_15DD10
        jmp short .5
.2:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne short .4
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte esi+024h]
        jne short .3
        call sub_24B87
        jmp short .4
.3:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B7A70
        add esp, byte 8
.4:
        inc dword [byte ebp-04h]
        add edi, byte 4
.5:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte esi+014h]
        jl short .2
.6:
        inc dword [byte ebp-08h]
        add esi, 88h
        cmp dword [byte ebp-08h], byte 10h
        jl short .1
        jmp near sub_24D8C_1A3
        mov eax, 1
        call sub_2458D
        call sub_249E8
        mov eax, 1
        call sub_243ED
        cmp byte [byte_1175A7], 0
        je near sub_240F4_55
        mov eax, 1
sub_24D32:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4Ch, 0
        push eax
        mov eax, dword [dword_15E8E4]
        mov dword [byte ebp-04h], dword_15D2B8
        mov dword [byte ebp-08h], 0
        mov edx, dword [dword eax+080h]
        mov eax, dword [byte eax+078h]
        mov dword [byte ebp-0Ch], edx
        mov dword [byte ebp-010h], eax
sub_24D32_2C:
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+04h]
        cmp eax, dword [byte ebp-050h]
        jne near sub_2458D_24C
        mov eax, dword [byte ebp-04h]
        mov eax, dword [byte eax+01Ch]
        mov edx, dword_15CE50
        shl eax, 2
        add edx, eax
        mov dword [byte ebp-014h], 0
        mov dword [byte ebp-018h], edx
        jmp near sub_2458D_23D
;-----------------------------------------------------------------------------
; sub_24D8C                                                       24D8C  96 PC
;-----------------------------------------------------------------------------
sub_24D8C:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 114h, 0
        push byte 0
        mov esi, dword [dword_15E8E4]
        push dword [byte esi+07Ch]
        push dword [byte esi+078h]
        call sub_B78C0
        add esp, byte 0Ch
        lea eax, [dword ebp-0114h]
        push eax
        call sub_DD8C8
        add esp, byte 4
        push unk_15E130
        mov dword [byte ebp-010h], 0
        mov esi, dword_15D2B8
        call sub_DD8B0
        add esp, byte 4
.1:
        cmp dword [esi], byte 0
        je short .5
        cmp dword [byte esi+04h], byte 0
        jne short .5
        mov edi, dword [byte esi+018h]
        shl edi, 2
        mov dword [byte ebp-04h], 0
        add edi, dword_15DC48
        jmp short .4
.2:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne short .3
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B7A70
        add esp, byte 8
.3:
        inc dword [byte ebp-04h]
        add edi, byte 4
.4:
        mov eax, dword [byte ebp-04h]
        cmp eax, dword [byte esi+0Ch]
        jl short .2
.5:
        inc dword [byte ebp-010h]
        add esi, 88h
        cmp dword [byte ebp-010h], byte 10h
        jl short .1
        mov dword [byte ebp-014h], dword_15D2B8
        cmp dword [dword_15D2B8], byte 0
        je short .9
        cmp dword [dword_15D2BC], byte 0
        jne short .9
        mov esi, dword [dword_15D31C]
        shl esi, 2
        mov dword [byte ebp-08h], 0
        add esi, dword_15D1A8
        jmp short .8
.6:
        mov edi, dword [esi]
        push dword [byte edi+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne short .7
        mov edi, dword [esi]
        push dword [byte edi+04h]
        push byte 4
        call sub_B7A70
        add esp, byte 8
.7:
        inc dword [byte ebp-08h]
        add esi, byte 4
.8:
        mov edi, dword [byte ebp-014h]
        mov eax, dword [byte ebp-08h]
        cmp eax, dword [byte edi+060h]
        jl short .6
.9:
        mov edi, dword_15D3C8
        cmp dword [dword_15D3C8], byte 0
        je short .13
        cmp dword [dword_15D3CC], byte 0
        jne short .13
        mov esi, dword [dword_15D42C]
        shl esi, 2
        mov dword [byte ebp-0Ch], 0
        add esi, dword_15D1A8
        jmp short .12
.10:
        mov eax, dword [esi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne short .11
        mov eax, dword [esi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B7A70
        add esp, byte 8
.11:
        inc dword [byte ebp-0Ch]
        add esi, byte 4
.12:
        mov eax, dword [byte ebp-0Ch]
        cmp eax, dword [byte edi+060h]
        jl short .10
.13:
        xor eax, eax
        call sub_243ED
        cmp byte [byte_1175A7], 0
        je short sub_24D8C_194
        push unk_15E020
        call sub_DD8B0
        add esp, byte 4
        xor eax, eax
        call sub_24C7C
        xor eax, eax
        call sub_24D32
sub_24D8C_194:
        lea eax, [dword ebp-0114h]
sub_24D8C_19A:
        push eax
        call sub_DD8B0
sub_24D8C_1A0:
        add esp, byte 4
sub_24D8C_1A3:
        leave
sub_24D8C_1A4:
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_24F36                                                       24F36  96 PC
;-----------------------------------------------------------------------------
sub_24F36:
        push ebx
        push ecx
        push edx
        push dword [dword_15E8E0]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BBC14
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BBE50
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BC0C4
        add esp, byte 4
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_24F75                                                       24F75  96 PC
;-----------------------------------------------------------------------------
sub_24F75:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 80h, 0
        push dword [dword_15E8D8]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E8D8]
        call sub_BBC14
        add esp, byte 4
        xor edx, edx
        xor eax, eax
        jmp short .2
.1:
        mov esi, dword [byte esi+07Ch]
        lea edi, [byte eax+ebp-080h]
        add esi, eax
        movsd
        movsd
        cmp dword [byte eax+ebp-080h], byte 0
        jl near sub_24D8C_1A3
        mov esi, dword [byte eax+ebp-080h]
        cmp esi, dword [dword_11F5C0]
        jg near sub_24D8C_1A3
        cmp dword [byte eax+ebp-07Ch], byte 0
        jl near sub_24D8C_1A3
        mov esi, dword [byte eax+ebp-07Ch]
        cmp esi, dword [dword_11F5C4]
        jg near sub_24D8C_1A3
        add eax, byte 8
        inc edx
.2:
        mov esi, dword [dword_15E8D8]
        cmp edx, dword [byte esi+04h]
        jl short .1
        mov esi, dword [byte esi+07Ch]
        lea edi, [byte eax+ebp-080h]
        lea eax, [byte ebp-080h]
        movsd
        movsd
        push eax
        mov eax, dword [dword_15E8D8]
        push dword [byte eax+04h]
        call sub_E1575
        jmp near sub_2414A_A4
;-----------------------------------------------------------------------------
; sub_2500F                                                       2500F  96 PC
;-----------------------------------------------------------------------------
sub_2500F:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        push eax
        push dword [dword_15E8E0]
        call sub_BC3F4
        add esp, byte 8
        push esi
        mov dword [byte esi+04h], 0
        push dword [dword_15E8D8]
        call sub_BC3F4
        add esp, byte 8
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_2503F                                                       2503F  96 PC
;-----------------------------------------------------------------------------
sub_2503F:
        push ebx
        push ecx
        push edx
        cmp dword [dword_1176E5], byte 0
        je short sub_2503F_41.1
        push dword [dword_15E81C]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E81C]
        call sub_BBC14
        add esp, byte 4
        push dword [dword_15E81C]
        call sub_BBE50
        add esp, byte 4
        push dword [dword_15E81C]
        call sub_BC0C4
sub_2503F_41:
        add esp, byte 4
.1:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_25087                                                       25087  96 PC
;-----------------------------------------------------------------------------
sub_25087:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        mov eax, 0FFFFFFFDh
        mov edx, 20h
        call sub_1E643
        mov eax, str_Zamboni
        call sub_BC5C0
        push byte 0
        mov dword [dword_15E7E4], eax
        add eax, byte 2Ch
        push eax
        call sub_B049E
        mov ebx, 4
        mov edx, 20h
        add esp, byte 8
        mov dword [dword_15E7D8], eax
        mov eax, dword [dword_15E7E4]
        call sub_BC150
        push eax
        mov dword [dword_15E81C], eax
        call sub_B9A18
        add esp, byte 4
        push dword [dword_15E7D8]
        push dword [dword_15E81C]
        call sub_B9928
        mov eax, dword [dword_15E81C]
        or byte [byte eax+010h], 2
        mov eax, dword [dword_15E7F0]
        mov dword [dword_15E474], 0
        imul edx, dword [eax], byte 0Ch
        mov eax, dword [dword_15E8DC]
        add edx, dword [byte eax+028h]
        mov eax, dword [byte edx+04h]
        imul esi, dword [eax], byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov ebx, dword [byte eax+070h]
        mov edi, dword_15E430
        add esi, ebx
        movsd
        movsd
        movsd
        mov edx, dword [byte edx+04h]
        imul esi, dword [byte edx+04h], byte 0Ch
        add esp, byte 8
        mov eax, dword [byte eax+070h]
        mov edi, dword_15E43C
        add esi, eax
        push dword_15E430
        movsd
        movsd
        movsd
        push dword [dword_15E81C]
        mov dword [dword_15E440], 0
        mov dword [dword_15E434], 0
        call sub_BC3F4
        mov eax, dword [dword_15E444]
        add esp, byte 8
        sub eax, dword [dword_15E438]
        push eax
        mov eax, dword [dword_15E430]
        sub eax, dword [dword_15E43C]
        push eax
        call sub_BA420
        mov dword [dword_15E448], eax
        neg dword [dword_15E448]
        add esp, byte 8
        mov eax, dword [dword_15E448]
        push eax
        push unk_15E44C
        mov dword [dword_15E470], eax
        call sub_BC674
        add esp, byte 8
        push unk_15E44C
        push dword [dword_15E81C]
        call sub_BC3A0
        mov dword [dword_15E478], 0
        mov dword [dword_1176E5], 1
        shl dword [dword_15E430], 10h
        shl dword [dword_15E438], 10h
        add esp, byte 8
        jmp near sub_24D8C_1A4
;-----------------------------------------------------------------------------
; sub_251E6                                                       251E6  96 PC
;-----------------------------------------------------------------------------
sub_251E6:
        push ebx
        push ecx
        push edx
        xor eax, eax
        call sub_1E643
        push dword [dword_15E7E4]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E81C]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E7D8]
        call sub_ABF4C
        mov dword [dword_1176E5], 0
        jmp near sub_2503F_41
;-----------------------------------------------------------------------------
; sub_25226                                                       25226  96 PC
;-----------------------------------------------------------------------------
sub_25226:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 1Ch, 0
        push eax
        lea edi, [byte ebp-010h]
        mov esi, unk_21984
        movsd
        movsd
        movsd
        cmp dword [dword_1176E5], byte 0
        je near sub_24D8C_1A3
        mov eax, dword [dword_15E430]
        sar eax, 10h
        cmp eax, dword [dword_15E43C]
        jne near .3
        mov eax, dword [dword_15E438]
        sar eax, 10h
        cmp eax, dword [dword_15E444]
        jne near .3
        mov eax, dword [dword_15E800]
        inc dword [dword_15E474]
        dec eax
        cmp eax, dword [dword_15E474]
        jg short .1
        mov dword [dword_15E474], 2
.1:
        mov eax, dword [dword_15E474]
        mov edx, dword [dword_15E7F0]
        imul edx, dword [edx+eax*4], byte 0Ch
        mov eax, dword [dword_15E8DC]
        mov eax, dword [byte eax+028h]
        add eax, edx
        mov edx, dword [dword_15E43C]
        mov dword [dword_15E430], edx
        mov edx, dword [dword_15E444]
        mov dword [dword_15E438], edx
        mov eax, dword [byte eax+04h]
        imul esi, dword [byte eax+04h], byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        mov edi, dword_15E43C
        add esi, eax
        movsd
        movsd
        movsd
        mov eax, dword [dword_15E444]
        sub eax, dword [dword_15E438]
        push eax
        mov eax, dword [dword_15E430]
        sub eax, dword [dword_15E43C]
        push eax
        mov dword [dword_15E440], 0
        mov dword [dword_15E434], 0
        call sub_BA420
        mov dword [dword_15E470], eax
        neg dword [dword_15E470]
        add esp, byte 8
        cmp dword [dword_15E470], 0FFFF8000h
        jne short .2
        inc word [word_15E472]
.2:
        shl dword [dword_15E430], 10h
        shl dword [dword_15E438], 10h
.3:
        mov eax, dword [dword_15E448]
        cmp eax, dword [dword_15E470]
        je near .6
        mov eax, dword [byte ebp-020h]
        sub eax, dword [dword_15E478]
        mov dword [byte ebp-04h], eax
        fild dword [byte ebp-04h]
        fmul qword [qword_110786]
        fmul qword [qword_11078E]
        call __CHP
        fistp dword [byte ebp-04h]
        mov eax, dword [byte ebp-04h]
        add dword [dword_15E448], eax
        cmp dword [dword_15E448], 8000h
        jl short .4
        sub dword [dword_15E448], 10000h
        sub dword [dword_15E470], 10000h
.4:
        mov eax, dword [dword_15E448]
        cmp eax, dword [dword_15E470]
        jle short .5
        mov eax, dword [dword_15E470]
        mov dword [dword_15E448], eax
.5:
        push dword [dword_15E448]
        push unk_15E44C
        call sub_BC674
        add esp, byte 8
        push unk_15E44C
        push dword [dword_15E81C]
        call sub_BC3A0
        add esp, byte 8
.6:
        mov eax, dword [byte ebp-020h]
        sub eax, dword [dword_15E478]
        cmp eax, byte 2
        jge short .7
        mov dword [byte ebp-08h], 20000h
        jmp short .8
.7:
        shl eax, 10h
        mov dword [byte ebp-08h], eax
.8:
        lea eax, [byte ebp-01Ch]
        push eax
        push unk_15E44C
        lea eax, [byte ebp-010h]
        push eax
        call sub_BB9C4
        add esp, byte 0Ch
        push dword_15E430
        lea eax, [byte ebp-01Ch]
        push eax
        push dword_15E430
        call sub_B9C08
        mov eax, dword [dword_15E430]
        mov edx, dword [dword_15E43C]
        add esp, byte 0Ch
        sar eax, 10h
        shl edx, 10h
        cmp dword [dword_15E448], 4000h
        jl short .11
        cmp eax, dword [dword_15E43C]
        jle short .10
.9:
        mov dword [dword_15E430], edx
.10:
        mov eax, dword [dword_15E438]
        sar eax, 10h
        cmp eax, dword [dword_15E444]
        jge near .17
        jmp near .16
.11:
        cmp dword [dword_15E448], byte 0
        jl short .13
        cmp eax, dword [dword_15E43C]
        jle short .12
        mov dword [dword_15E430], edx
.12:
        mov eax, dword [dword_15E438]
        sar eax, 10h
        cmp eax, dword [dword_15E444]
        jle short .17
        jmp short .16
.13:
        cmp dword [dword_15E448], 0FFFFC000h
        jg short .14
        cmp eax, dword [dword_15E43C]
        jge short .10
        jmp short .9
.14:
        cmp dword [dword_15E448], byte 0
        jg short .17
        cmp eax, dword [dword_15E43C]
        jge short .15
        mov dword [dword_15E430], edx
.15:
        mov eax, dword [dword_15E438]
        sar eax, 10h
        cmp eax, dword [dword_15E444]
        jle short .17
.16:
        mov eax, dword [dword_15E444]
        shl eax, 10h
        mov dword [dword_15E438], eax
.17:
        mov eax, dword [dword_15E430]
        sar eax, 10h
        mov dword [byte ebp-010h], eax
        mov eax, dword [dword_15E438]
        sar eax, 10h
        mov dword [byte ebp-08h], eax
        lea eax, [byte ebp-010h]
        push eax
        push dword [dword_15E81C]
        mov dword [byte ebp-0Ch], 0
        call sub_BC3F4
        jmp near sub_2414A_A4
;-----------------------------------------------------------------------------
; sub_25502                                                       25502  96 PC
;-----------------------------------------------------------------------------
sub_25502:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 8, 0
        mov edi, eax
        test eax, eax
        je short .1
        mov eax, dword [dword_15E8FC]
        jmp short .2
.1:
        mov eax, dword [dword_15E8F8]
.2:
        mov dword [byte ebp-04h], eax
        mov esi, dword [byte ebp-04h]
        push esi
        call sub_BBC80
        add esp, byte 4
        push esi
        mov dword [byte ebp-08h], 0
        call sub_BBC14
        add esp, byte 4
        cmp dword [dword_11A3F8], byte 0
        je short .3
        movsx eax, byte [byte_1770D7]
        cmp eax, edi
        jne short .5
        jmp short .4
.3:
        call sub_4B4F3
        cmp eax, edi
        jne short .5
.4:
        mov dword [byte ebp-08h], 1
.5:
        cmp dword [byte ebp-08h], byte 0
        je near .16
        mov eax, dword [dword_15E87C]
        cmp eax, dword [byte esi+01Ch]
        jg near .14
        mov eax, dword [dword_15E884]
        cmp eax, dword [byte esi+024h]
        jg near .11
        cmp edi, byte 1
        jne near .9
.6:
        push dword [dword_15E6E8]
        push dword [dword_15E70C]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E6D8]
        push dword [dword_15E704]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E8E0]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BBC14
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BBE50
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BC0C4
        add esp, byte 4
        push dword [dword_15E6FC]
        push dword [dword_15E700]
        push esi
        call sub_BC040
        add esp, byte 0Ch
.7:
        push dword [dword_15E6DC]
        push dword [dword_15E6E4]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E6EC]
        push dword [dword_15E6F0]
.8:
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E6F8]
        push dword [dword_15E6F4]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        jmp near sub_24D8C_1A3
.9:
        push dword [dword_15E6EC]
        push dword [dword_15E6F0]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E6DC]
        push dword [dword_15E6E4]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E6FC]
        push dword [dword_15E700]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E8E0]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BBC14
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BBE50
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BC0C4
        add esp, byte 4
.10:
        push dword [dword_15E6D8]
        push dword [dword_15E704]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E6E8]
        push dword [dword_15E70C]
        jmp near .8
.11:
        cmp edi, byte 1
        jne short .13
.12:
        push dword [dword_15E6E8]
        push dword [dword_15E70C]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E6D8]
        push dword [dword_15E704]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E6FC]
        push dword [dword_15E700]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E8E0]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BBC14
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BBE50
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BC0C4
        add esp, byte 4
        jmp near .7
.13:
        push dword [dword_15E6EC]
        push dword [dword_15E6F0]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E6DC]
        push dword [dword_15E6E4]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E8E0]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BBC14
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BBE50
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_BC0C4
        add esp, byte 4
        push dword [dword_15E6FC]
        push dword [dword_15E700]
        push esi
        call sub_BC040
        add esp, byte 0Ch
        jmp near .10
.14:
        mov eax, dword [dword_15E884]
        cmp eax, dword [byte esi+024h]
        jg short .15
        cmp edi, byte 1
        je near .13
        jmp near .12
.15:
        cmp edi, byte 1
        je near .9
        jmp near .6
.16:
        push esi
        call sub_BBE50
        add esp, byte 4
        push esi
        call sub_BC0C4
        jmp near sub_24D8C_1A0
;-----------------------------------------------------------------------------
; sub_25820                                                       25820  96 PC
;-----------------------------------------------------------------------------
sub_25820:
        push ebx
        push ecx
        push edx
        test eax, eax
        je short .1
        mov eax, dword [dword_15E8FC]
        jmp short .2
.1:
        mov eax, dword [dword_15E8F8]
.2:
        push eax
        call sub_BC3F4
        add esp, byte 8
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_2583F                                                       2583F  96 PC
;-----------------------------------------------------------------------------
sub_2583F:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 12Ch, 0
        sub ebp, 82h
        push str_Glassline
        push dword [dword_15E8E4]
        call sub_B98E0
        add esp, byte 8
        push str_Glass
        push dword [dword_15E8E4]
        mov dword [byte ebp+06h], eax
        call sub_B98E0
        add esp, byte 8
        push str_Topboards
        push dword [dword_15E8E4]
        mov dword [byte ebp-06h], eax
        call sub_B98E0
        add esp, byte 8
        push str_Botboards
        push dword [dword_15E8E4]
        mov dword [byte ebp+02h], eax
        call sub_B98E0
        add esp, byte 8
        push str_FatRedLines
        mov dword [byte ebp+04Eh], 0
        push dword [dword_15E8E4]
        mov dword [byte ebp-02h], eax
        call sub_B98E0
        add esp, byte 8
        mov dword [byte ebp+076h], 0
        mov dword [byte ebp+072h], 0
        push str_FatBlueLines
        mov dword [byte ebp+04Ah], 0
        mov dword [byte ebp+066h], 0
        push dword [dword_15E8E4]
        mov dword [dword_15E69C], eax
        call sub_B98E0
        mov dword [dword_15E6AC], eax
        mov eax, dword [dword_15E8DC]
        mov dword [byte ebp+06Eh], 0
        mov esi, dword_15D2B8
        mov eax, dword [byte eax+028h]
        xor edi, edi
        mov dword [byte ebp-0Ah], eax
        mov eax, dword [dword_15E8E8]
        mov dword [byte ebp+07Eh], edi
        mov dword [byte ebp+07Ah], edi
        mov eax, dword [byte eax+028h]
        add esp, byte 8
        mov dword [byte ebp-0Eh], eax
.1:
        push dword [byte ebp+07Ah]
        push str_SideD
        lea eax, [byte ebp-02Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-02Ah]
        push eax
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        mov dword [byte ebp+0Ah], eax
        cmp eax, byte 0FFFFFFFFh
        jne short .2
        push str_SideNotFoundInRink
        call FatalError
        add esp, byte 4
.2:
        lea eax, [byte ebp-016h]
        push eax
        lea eax, [byte ebp-012h]
        push eax
        push dword [byte ebp+0Ah]
        push dword [dword_15E8E4]
        call sub_BC838
        mov dword [byte esi+010h], 0
        mov eax, dword [byte ebp+04Eh]
        mov dword [byte esi+014h], 0
        mov dword [byte esi+018h], eax
        mov eax, dword [byte ebp+076h]
        mov dword [byte esi+01Ch], eax
        mov eax, dword [byte ebp+072h]
        mov dword [byte esi+020h], eax
        mov eax, dword [byte ebp+07Eh]
        add esp, byte 10h
        mov dword [byte esi+064h], eax
        mov eax, dword [byte ebp+04Eh]
        mov dword [byte esi+060h], 0
        shl eax, 2
        mov dword [byte esi+028h], 0
        mov dword [byte ebp+02Eh], eax
        mov eax, dword [byte ebp+072h]
        mov dword [byte esi+02Ch], 0
        shl eax, 2
        mov dword [byte esi+0Ch], 0
        mov dword [byte ebp+01Eh], eax
        mov eax, dword [byte ebp+076h]
        mov dword [esi], 1
        shl eax, 2
        mov dword [byte esi+024h], 0FFFFFFFFh
        mov dword [byte ebp+026h], eax
        jmp near .8
.3:
        cmp edx, dword [byte ebp-06h]
        jne short .4
        mov edx, dword [byte ebp+01Eh]
        inc dword [byte ebp+072h]
        inc dword [byte esi+014h]
        add dword [byte ebp+01Eh], byte 4
        mov dword [dword edx+dword_15DD10], eax
        jmp short .8
.4:
        cmp edx, dword [byte ebp+02h]
        jne short .5
        mov ebx, dword [byte eax+04h]
        mov edx, dword [byte esi+028h]
        mov ebx, dword [ebx]
        mov dword [byte esi+edx*8+030h], ebx
        mov eax, dword [byte eax+04h]
        mov edx, dword [byte esi+028h]
        mov eax, dword [byte eax+04h]
        mov dword [byte esi+edx*8+034h], eax
        inc dword [byte esi+028h]
        jmp short .8
.5:
        cmp edx, dword [byte ebp-02h]
        jne short .6
        mov edx, dword [byte eax+04h]
        mov ebx, dword [byte esi+02Ch]
        mov edx, dword [edx]
        mov dword [byte esi+ebx*8+048h], edx
        mov eax, dword [byte eax+04h]
        mov edx, dword [byte esi+02Ch]
        mov eax, dword [byte eax+04h]
        mov dword [byte esi+edx*8+04Ch], eax
        inc dword [byte esi+02Ch]
        jmp short .8
.6:
        mov ecx, dword [byte ebp+07Eh]
        mov ebx, dword [byte ebp+07Eh]
        inc ecx
        shl ebx, 2
        cmp edx, dword [dword_15E69C]
        jne short .9
.7:
        inc dword [byte esi+060h]
        mov dword [byte ebp+07Eh], ecx
        mov dword [dword ebx+dword_15D1A8], eax
.8:
        dec dword [byte ebp-012h]
        cmp dword [byte ebp-012h], byte 0FFFFFFFFh
        je short .10
        mov eax, dword [byte ebp-016h]
        add dword [byte ebp-016h], byte 4
        imul eax, dword [eax], byte 0Ch
        add eax, dword [byte ebp-0Ah]
        mov edx, dword [eax]
        shl edx, 8
        shr edx, 18h
        cmp edx, dword [byte ebp+06h]
        jne near .3
        mov edx, dword [byte ebp+026h]
        inc dword [byte ebp+076h]
        inc dword [byte esi+010h]
        add dword [byte ebp+026h], byte 4
        mov dword [dword edx+dword_15CE50], eax
        jmp short .8
.9:
        cmp edx, dword [dword_15E6AC]
        je short .7
        mov edx, dword [byte ebp+02Eh]
        inc dword [byte ebp+04Eh]
        inc dword [byte esi+0Ch]
        add dword [byte ebp+02Eh], byte 4
        mov dword [dword edx+dword_15DC48], eax
        jmp short .8
.10:
        cmp dword [byte ebp+07Ah], byte 10h
        jge near .22
        lea eax, [byte ebp-02Ah]
        push eax
        push dword [dword_15E900]
        call sub_BC7F0
        add esp, byte 8
        mov dword [byte ebp+0Eh], eax
        cmp eax, byte 0FFFFFFFFh
        jne short .11
        push str_SideNotFoundInStands
        call FatalError
        add esp, byte 4
.11:
        lea eax, [byte ebp-016h]
        push eax
        lea eax, [byte ebp-012h]
        push eax
        push dword [byte ebp+0Eh]
        push dword [dword_15E900]
        call sub_BC838
        mov eax, dword [byte ebp+04Ah]
        mov dword [byte esi+074h], 0
        mov dword [byte esi+068h], eax
        mov eax, dword [byte ebp+06Eh]
        mov dword [byte esi+070h], eax
        mov eax, dword [byte ebp+066h]
        mov dword [byte esi+078h], eax
        mov edx, dword [byte ebp+04Ah]
        mov eax, dword [byte esi+074h]
        mov ebx, dword [byte ebp+06Eh]
        mov dword [byte esi+07Ch], eax
        add esp, byte 10h
        mov dword [byte esi+06Ch], eax
        mov eax, dword [byte ebp+066h]
        shl edx, 2
        shl eax, 2
        shl ebx, 2
        mov dword [byte ebp+036h], eax
.12:
        dec dword [byte ebp-012h]
        cmp dword [byte ebp-012h], byte 0FFFFFFFFh
        je near .22
        mov eax, dword [byte ebp-016h]
        add dword [byte ebp-016h], byte 4
        mov eax, dword [eax]
        mov dword [byte ebp+062h], eax
        imul eax, byte 0Ch
        mov ecx, dword [byte ebp-0Eh]
        mov dword [byte ebp+052h], 0
        add ecx, eax
        mov eax, dword [dword_15E80C]
        mov dword [byte ebp+03Ah], ecx
        shl eax, 2
        mov ecx, dword [byte ebp+062h]
        mov dword [byte ebp+02Ah], eax
        jmp short .15
.13:
        mov eax, dword [dword_15E7D4]
        add eax, dword [byte ebp+052h]
        cmp ecx, dword [eax]
        jne short .14
        mov eax, dword [byte ebp+03Ah]
        add edx, byte 4
        inc dword [byte esi+06Ch]
        inc dword [byte ebp+04Ah]
        mov dword [dword edx+dword_15D0DC], eax
        jmp short .12
.14:
        add dword [byte ebp+052h], byte 4
.15:
        mov eax, dword [byte ebp+052h]
        cmp eax, dword [byte ebp+02Ah]
        jl short .13
        mov eax, dword [dword_15E7FC]
        mov dword [byte ebp+042h], 0
        shl eax, 2
        mov ecx, dword [byte ebp+062h]
        mov dword [byte ebp+022h], eax
        jmp short .18
.16:
        mov eax, dword [dword_15E7AC]
        add eax, dword [byte ebp+042h]
        cmp ecx, dword [eax]
        jne short .17
        mov eax, dword [byte ebp+03Ah]
        mov ecx, dword [byte ebp+036h]
        inc dword [byte ebp+066h]
        inc dword [byte esi+07Ch]
        add dword [byte ebp+036h], byte 4
        mov dword [dword ecx+dword_15BDB8], eax
        jmp near .12
.17:
        add dword [byte ebp+042h], byte 4
.18:
        mov eax, dword [byte ebp+042h]
        cmp eax, dword [byte ebp+022h]
        jl short .16
        mov eax, dword [dword_15E7F4]
        mov dword [byte ebp+046h], 0
        shl eax, 2
        mov ecx, dword [byte ebp+062h]
        mov dword [byte ebp+012h], eax
        jmp short .21
.19:
        mov eax, dword [dword_15E790]
        add eax, dword [byte ebp+046h]
        cmp ecx, dword [eax]
        jne short .20
        mov eax, dword [byte ebp+03Ah]
        add ebx, byte 4
        inc dword [byte esi+074h]
        inc dword [byte ebp+06Eh]
        mov dword [dword ebx+dword_15D1CC], eax
        jmp near .12
.20:
        add dword [byte ebp+046h], byte 4
.21:
        mov eax, dword [byte ebp+046h]
        cmp eax, dword [byte ebp+012h]
        jl short .19
        jmp near .12
.22:
        inc dword [byte ebp+07Ah]
        add esi, 88h
        cmp dword [byte ebp+07Ah], byte 12h
        jl near .1
        mov esi, dword_15D2B8
        mov dword [dword_15D33C], 0
        mov eax, edi
        mov dword [byte ebp+05Eh], 0
        shl eax, 2
        mov dword [dword_15D338], edi
        mov dword [byte ebp+03Eh], eax
.23:
        push dword [byte ebp+05Eh]
        push str_Gt002d
        lea eax, [dword ebp-0AAh]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [dword ebp-0AAh]
        push eax
        push dword [dword_15E8E4]
        call sub_BC760
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .24
        imul edx, byte 0Ch
        inc dword [dword esi+084h]
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        inc dword [byte ebp+05Eh]
        add eax, edx
        mov edx, dword [byte ebp+03Eh]
        inc edi
        add dword [byte ebp+03Eh], byte 4
        mov dword [dword edx+dword_15BE80], eax
        cmp dword [byte ebp+05Eh], byte 14h
        jl short .23
.24:
        mov esi, unk_15D340
        mov dword [dword_15D3C4], 0
        mov eax, edi
        mov dword [byte ebp+05Ah], 0
        shl eax, 2
        mov dword [dword_15D3C0], edi
        mov dword [byte ebp+032h], eax
.25:
        push dword [byte ebp+05Ah]
        push str_Gt102d
        lea eax, [dword ebp-08Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [dword ebp-08Ah]
        push eax
        push dword [dword_15E8E4]
        call sub_BC760
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .26
        imul edx, byte 0Ch
        inc dword [dword esi+084h]
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        inc dword [byte ebp+05Ah]
        add eax, edx
        mov edx, dword [byte ebp+032h]
        inc edi
        add dword [byte ebp+032h], byte 4
        mov dword [dword edx+dword_15BE80], eax
        cmp dword [byte ebp+05Ah], byte 14h
        jl short .25
.26:
        mov esi, dword_15D3C8
        mov dword [dword_15D44C], 0
        mov eax, edi
        mov dword [byte ebp+056h], 0
        shl eax, 2
        mov dword [dword_15D448], edi
        mov dword [byte ebp+01Ah], eax
.27:
        push dword [byte ebp+056h]
        push str_Gt202d
        lea eax, [byte ebp-04Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-04Ah]
        push eax
        push dword [dword_15E8E4]
        call sub_BC760
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .28
        imul edx, byte 0Ch
        inc dword [dword esi+084h]
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        inc dword [byte ebp+056h]
        add eax, edx
        mov edx, dword [byte ebp+01Ah]
        inc edi
        add dword [byte ebp+01Ah], byte 4
        mov dword [dword edx+dword_15BE80], eax
        cmp dword [byte ebp+056h], byte 14h
        jl short .27
.28:
        mov esi, unk_15D450
        mov dword [dword_15D4D4], 0
        mov eax, edi
        mov dword [byte ebp+06Ah], 0
        shl eax, 2
        mov dword [dword_15D4D0], edi
        mov dword [byte ebp+016h], eax
.29:
        push dword [byte ebp+06Ah]
        push str_Gt302d
        lea eax, [byte ebp-06Ah]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-06Ah]
        push eax
        push dword [dword_15E8E4]
        call sub_BC760
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short sub_2583F_602
        imul edx, byte 0Ch
        inc dword [dword esi+084h]
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        inc dword [byte ebp+06Ah]
        add eax, edx
        mov edx, dword [byte ebp+016h]
        inc edi
        add dword [byte ebp+016h], byte 4
        mov dword [dword edx+dword_15BE80], eax
        cmp dword [byte ebp+06Ah], byte 14h
        jl short .29
sub_2583F_602:
        lea esp, [dword ebp+082h]
        pop ebp
        jmp near sub_24D8C_1A4
;-----------------------------------------------------------------------------
; sub_25E4D                                                       25E4D  96 PC
;-----------------------------------------------------------------------------
sub_25E4D:
        push ebx
        push ecx
        push edx
        push esi
        mov esi, eax
        push str_Icelogo
        push dword [dword_15E8E4]
        call sub_B98E0
        add esp, byte 8
        push esi
        push eax
        push dword [dword_15E8E4]
        call sub_B9B34
        add esp, byte 0Ch
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_25E7B                                                       25E7B  96 PC
;-----------------------------------------------------------------------------
sub_25E7B:
        push ebx
        push ecx
        push edx
        cmp dword [dword_1175B1], byte 0
        je short sub_25E7B_21.1
        push dword [dword_1175B1]
        call sub_ABF4C
        mov dword [dword_1175B1], 0
sub_25E7B_21:
        add esp, byte 4
.1:
        pop edx
        pop ecx
        pop ebx
        ret
jpt_25EA3:
        dd sub_25EB3_3F
        dd sub_25EB3_25
        dd sub_25EB3_32
        dd sub_25EB3_61
;-----------------------------------------------------------------------------
; sub_25EB3                                                       25EB3  96 PC
;-----------------------------------------------------------------------------
sub_25EB3:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 10h, 0
        mov edx, eax
        mov eax, 0FFFFFFFDh
        call sub_1E643
        lea eax, [byte edx+01h]
        cmp eax, byte 3
        ja short sub_25EB3_61.2
        jmp dword [nosplit cs:eax*4+jpt_25EA3]
sub_25EB3_25:
        push dword [dword_1175B1]
        push str_EMPTYFSH
        jmp short sub_25EB3_61.1
sub_25EB3_32:
        push dword [dword_1175B1]
        push str_HALFFSH
        jmp short sub_25EB3_61.1
sub_25EB3_3F:
        push byte 20h
        push str_STANDSFSH
        call sub_B7810
        add esp, byte 4
        push eax
        push str_STANDS
        call sub_AB758
        add esp, byte 0Ch
        mov dword [dword_1175B1], eax
sub_25EB3_61:
        push dword [dword_1175B1]
        push str_STANDSFSH
.1:
        call sub_B74B0
        add esp, byte 8
.2:
        push dword [dword_1175B1]
        xor edi, edi
        push dword [dword_15E900]
        xor esi, esi
        call sub_B9928
        add esp, byte 8
.3:
        push edi
        push str_CrowdD
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-010h]
        push eax
        push dword [dword_15E900]
        call sub_B98E0
        mov edx, eax
        imul edx, byte 14h
        mov eax, dword [dword_15E900]
        mov ebx, dword [byte eax+014h]
        add esi, byte 4
        inc edi
        mov edx, dword [byte edx+ebx+0Ch]
        add esp, byte 8
        mov dword [dword esi+dword_15DEDC], edx
        cmp edi, byte 9
        jl short .3
        push str_Wedge
        push eax
        call sub_B98E0
        mov edx, eax
        imul ebx, edx, byte 14h
        mov eax, dword [dword_15E900]
        add esp, byte 8
        mov edx, dword [byte eax+014h]
        push str_WALL
        mov edx, dword [byte edx+ebx+0Ch]
        push eax
        mov dword [dword_15E824], edx
        call sub_B98E0
        mov edx, eax
        imul edx, byte 14h
        mov eax, dword [dword_15E900]
        mov eax, dword [byte eax+014h]
        mov eax, dword [byte edx+eax+0Ch]
        add esp, byte 8
        mov dword [dword_15E86C], eax
        xor eax, eax
sub_25EB3_11B:
        call sub_1E643
        jmp near sub_24D8C_1A3
        push ebx
        push ecx
        push esi
        mov esi, edx
        push eax
        push dword [dword_15E8E4]
        call sub_B98E0
        add esp, byte 8
        push esi
        push eax
        push dword [dword_15E8E4]
        call sub_B9B34
        add esp, byte 0Ch
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_26000                                                       26000  96 PC
;-----------------------------------------------------------------------------
sub_26000:
        push esi
        push edi
        enter 14h, 0
        push edx
        mov esi, ebx
        mov dword [byte ebp-08h], ecx
        mov edi, eax
        add eax, 2FDh
        mov dword [byte ebp-0Ch], eax
.1:
        movsx ecx, byte [edi]
        movsx ebx, byte [byte edi+01h]
        movsx eax, byte [byte edi+02h]
        shl ecx, 2
        shl eax, 2
        shl ebx, 2
        mov dword [byte ebp-010h], eax
        lea eax, [ecx+ebx]
        add eax, dword [byte ebp-010h]
        mov dword [byte ebp-04h], 3
        cdq
        idiv dword [byte ebp-04h]
        mov edx, dword [byte ebp+010h]
        mov dword [byte ebp-014h], eax
        sub eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ecx, eax
        mov eax, dword [byte ebp-014h]
        mov edx, dword [byte ebp+010h]
        sub eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ebx, eax
        mov eax, dword [byte ebp-014h]
        mov edx, dword [byte ebp+010h]
        sub eax, dword [byte ebp-010h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [byte ebp-010h], eax
        mov eax, 80h
        mov edx, dword [byte ebp-08h]
        sub eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ecx, eax
        mov eax, 80h
        mov edx, dword [byte ebp-08h]
        sub eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add ebx, eax
        mov eax, 80h
        mov edx, dword [byte ebp-08h]
        sub eax, dword [byte ebp-010h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [byte ebp-010h], eax
        mov edx, esi
        mov eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp eax, 0FFh
        jle short .2
        mov eax, 0FFh
        jmp short .3
.2:
        mov edx, esi
        mov eax, ecx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
.3:
        mov ecx, eax
        mov edx, esi
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp eax, 0FFh
        jle short .4
        mov eax, 0FFh
        jmp short .5
.4:
        mov edx, esi
        mov eax, ebx
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
.5:
        mov ebx, eax
        mov edx, esi
        mov eax, dword [byte ebp-010h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        cmp eax, 0FFh
        jle short .6
        mov eax, 0FFh
        jmp short .7
.6:
        mov eax, dword [byte ebp-010h]
        mov edx, esi
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
.7:
        shl ecx, 10h
        shl ebx, 8
        or ebx, ecx
        or eax, ebx
        push eax
        add edi, byte 3
        call sub_B31C0
        mov ebx, dword [byte ebp-018h]
        add esp, byte 4
        inc dword [byte ebp-018h]
        mov byte [ebx], al
        cmp edi, dword [byte ebp-0Ch]
        jne near .1
        mov eax, dword [byte ebp-018h]
        mov byte [eax], 0FFh
        jmp near sub_22159_4F
;-----------------------------------------------------------------------------
; sub_261A6                                                       261A6  96 PC
;-----------------------------------------------------------------------------
sub_261A6:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 4Ch, 0
        mov esi, eax
        push byte 50h
        call sub_E162A
        add esp, byte 4
        push byte 50h
        call sub_BBC04
        add esp, byte 4
        mov edx, 19999h
        call sub_BD86C
        mov eax, 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [dword_15E888], eax
        mov eax, 0Ah
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [dword_15E8B0], eax
        mov eax, 4
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [dword_15E8C0], eax
        mov eax, 6
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [dword_15E8B8], eax
        mov eax, 1
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [dword_15E8BC], eax
        mov eax, 0Ah
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [dword_15E8B4], eax
        mov eax, 96h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [dword_15E860], eax
        mov eax, 3Ch
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [dword_15E878], eax
        mov eax, 64h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [dword_15E870], eax
        mov eax, 0FFFFFF7Eh
        mov ecx, 8000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov edx, 19999h
        mov dword [dword_15E840], eax
        mov eax, 3
        mov ebx, 18000h
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        push dword 9999h
        mov edx, unk_15DF20
        mov dword [dword_15E848], eax
        mov eax, esi
        call sub_26000
        push dword 9999h
        mov ecx, 1999h
        mov ebx, 11999h
        mov edx, unk_15E230
        mov eax, esi
        call sub_26000
        push unk_15E330
        push esi
        push dword 11999h
        call sub_AD620
        add esp, byte 0Ch
        push unk_15E130
        push esi
        push dword 9999h
        call sub_AD620
        add esp, byte 0Ch
        push unk_15E020
        push esi
        push dword 0E666h
        call sub_AD620
        add esp, byte 0Ch
        mov eax, 0FFFFFFFDh
        mov edx, 20h
        call sub_1E643
        mov eax, str_Rink
        call sub_BC5C0
        mov edx, 20h
        mov dword [dword_15E8DC], eax
        add eax, byte 2Ch
        mov ebx, 4
        call sub_21C1A
        mov edx, 20h
        mov dword [dword_15E8EC], eax
        mov eax, dword [dword_15E8DC]
        call sub_BC150
        push eax
        mov dword [dword_15E8E4], eax
        call sub_B9A18
        add esp, byte 4
        push dword [dword_15E8EC]
        push dword [dword_15E8E4]
        call sub_B9928
        mov eax, dword [dword_15E8E4]
        mov edx, 20h
        add esp, byte 8
        or byte [byte eax+010h], 2
        mov eax, str_Stands2
        mov ebx, 4
        call sub_BC5C0
        mov edx, 20h
        mov dword [dword_15E8E8], eax
        call sub_BC150
        mov dword [dword_15E900], eax
        mov edx, 20h
        or byte [byte eax+010h], 2
        mov eax, str_Score
        call sub_BC5C0
        mov edx, 20h
        mov dword [dword_15E8CC], eax
        add eax, byte 2Ch
        mov ebx, 4
        call sub_21C1A
        mov edx, 20h
        mov dword [dword_15E8C8], eax
        mov eax, dword [dword_15E8CC]
        call sub_BC150
        push eax
        mov dword [dword_15E8C4], eax
        call sub_B9A18
        add esp, byte 4
        push dword [dword_15E8C8]
        push dword [dword_15E8C4]
        call sub_B9928
        mov eax, dword [dword_15E8C4]
        mov edx, 20h
        add esp, byte 8
        or byte [byte eax+010h], 2
        mov eax, str_Puck
        call sub_BC5C0
        mov edx, 20h
        mov dword [dword_15E8F0], eax
        add eax, byte 2Ch
        mov ebx, 4
        call sub_21C1A
        mov edx, 20h
        mov dword [dword_15E818], eax
        mov eax, dword [dword_15E8F0]
        call sub_BC150
        push eax
        mov dword [dword_15E8E0], eax
        call sub_B9A18
        add esp, byte 4
        push dword [dword_15E818]
        push dword [dword_15E8E0]
        call sub_B9928
        mov eax, dword [dword_15E8E0]
        mov edx, 20h
        add esp, byte 8
        or byte [byte eax+010h], 2
        mov eax, str_Puckshad
        mov ebx, 4
        call sub_BC5C0
        mov edx, 20h
        mov dword [dword_15E8D4], eax
        call sub_BC150
        mov dword [dword_15E8D8], eax
        mov edx, 20h
        or byte [byte eax+010h], 2
        mov eax, str_Net
        call sub_BC5C0
        mov edx, 20h
        mov dword [dword_15E8F4], eax
        add eax, byte 2Ch
        mov ebx, 4
        call sub_21C1A
        mov edx, 20h
        mov dword [dword_15E8D0], eax
        mov eax, dword [dword_15E8F4]
        call sub_BC150
        push eax
        mov dword [dword_15E8F8], eax
        call sub_B9A18
        add esp, byte 4
        push dword [dword_15E8D0]
        push dword [dword_15E8F8]
        call sub_B9928
        add esp, byte 8
        push str_Goal02
        push dword [dword_15E8E4]
        call sub_BC760
        imul edx, eax, byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        add esp, byte 8
        add eax, edx
        push eax
        push dword [dword_15E8F8]
        call sub_BC3F4
        mov eax, dword [dword_15E8F8]
        mov ebx, 4
        add esp, byte 8
        or byte [byte eax+010h], 2
        mov edx, 20h
        mov eax, dword [dword_15E8F4]
        call sub_BC150
        push eax
        mov dword [dword_15E8FC], eax
        call sub_B9A18
        add esp, byte 4
        push dword [dword_15E8D0]
        push dword [dword_15E8FC]
        call sub_B9928
        add esp, byte 8
        push str_Goal12
        push dword [dword_15E8E4]
        call sub_BC760
        imul edx, eax, byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        add esp, byte 8
        add eax, edx
        push eax
        push dword [dword_15E8FC]
        call sub_BC3F4
        add esp, byte 8
        push dword 8000h
        lea eax, [byte ebp-04Ch]
        push eax
        call sub_BC674
        add esp, byte 8
        lea eax, [byte ebp-04Ch]
        push eax
        push dword [dword_15E8FC]
        call sub_BC3A0
        add esp, byte 8
        mov eax, dword [dword_15E8FC]
        push str_Pipe
        or byte [byte eax+010h], 2
        push dword [dword_15E8F8]
        call sub_B98E0
        mov edi, eax
        imul edx, edi, byte 14h
        mov eax, dword [dword_15E8F8]
        mov eax, dword [byte eax+014h]
        add esp, byte 8
        add eax, edx
        mov ecx, esi
        push byte 20h
        movzx ebx, byte [eax]
        movzx edx, byte [byte eax+01h]
        movzx eax, byte [byte eax+02h]
        call sub_873AE
        push sub_227E2
        push edi
        push dword [dword_15E8F8]
        mov dword [dword_15E7E8], eax
        call sub_B9B70
        add esp, byte 0Ch
        push sub_227E2
        push edi
        push dword [dword_15E8FC]
        call sub_B9B70
        add esp, byte 0Ch
        push str_Left1
        push dword [dword_15E8F8]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E6EC
        push dword_15E6F0
        push eax
        push dword [dword_15E8F8]
        call sub_BC838
        add esp, byte 10h
        push str_Left2
        push dword [dword_15E8F8]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E6DC
        push dword_15E6E4
        push eax
        push dword [dword_15E8F8]
        call sub_BC838
        add esp, byte 10h
        push str_Back
        push dword [dword_15E8F8]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E6FC
        push dword_15E700
        push eax
        push dword [dword_15E8F8]
        call sub_BC838
        add esp, byte 10h
        push str_Right2
        push dword [dword_15E8F8]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E6D8
        push dword_15E704
        push eax
        push dword [dword_15E8F8]
        call sub_BC838
        add esp, byte 10h
        push str_Right1
        push dword [dword_15E8F8]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E6E8
        push dword_15E70C
        push eax
        push dword [dword_15E8F8]
        call sub_BC838
        add esp, byte 10h
        push str_Top
        push dword [dword_15E8F8]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E6F8
        push dword_15E6F4
        push eax
        push dword [dword_15E8F8]
        call sub_BC838
        add esp, byte 10h
        mov edx, dword [dword_15E8E4]
        push str_Minx
        mov eax, dword [byte edx+078h]
        push edx
        mov edi, dword [byte edx+070h]
        mov dword [byte ebp-04h], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Maxx
        mov eax, dword [edi+eax]
        push dword [dword_15E8E4]
        mov dword [dword_15E7B0], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Minz
        mov eax, dword [edi+eax]
        push dword [dword_15E8E4]
        mov dword [dword_15E7A8], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Maxz
        mov eax, dword [byte edi+eax+08h]
        push dword [dword_15E8E4]
        mov dword [dword_15E7B4], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Rlite1
        mov eax, dword [byte edi+eax+08h]
        push dword [dword_15E8E4]
        mov dword [dword_15E7A4], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Gt305
        mov eax, dword [byte edi+eax+04h]
        push dword [dword_15E8E4]
        mov dword [byte ebp-08h], eax
        call sub_BC760
        imul eax, byte 0Ch
        mov eax, dword [edi+eax]
        add esp, byte 8
        mov dword [dword_15E480], eax
        mov eax, dword [byte ebp-08h]
        push str_Strobe
        mov dword [dword_158D88], eax
        mov dword [dword_158D7C], eax
        sub eax, byte 14h
        push dword [dword_15E8E4]
        mov dword [dword_158DA0], eax
        mov dword [dword_158D94], eax
        call sub_B98E0
        mov edx, eax
        imul ebx, edx, byte 14h
        mov eax, dword [dword_15E8E4]
        add esp, byte 8
        mov edx, dword [byte eax+014h]
        push str_Glass
        mov edx, dword [byte edx+ebx+0Ch]
        push eax
        mov dword [dword_15E47C], edx
        call sub_B98E0
        add esp, byte 8
        push sub_22717
        push eax
        push dword [dword_15E8E4]
        call sub_B9B70
        add esp, byte 0Ch
        push str_Boardback
        push dword [dword_15E8E4]
        call sub_B98E0
        mov edx, eax
        imul ebx, edx, byte 14h
        mov dword [dword_15E82C], eax
        mov eax, dword [dword_15E8E4]
        add esp, byte 8
        mov edx, dword [byte eax+014h]
        push str_Flatboards
        mov edx, dword [byte edx+ebx+04h]
        push eax
        mov dword [dword_15E868], edx
        call sub_B98E0
        mov edx, eax
        imul edx, byte 14h
        mov eax, dword [dword_15E8E4]
        add esp, byte 8
        mov eax, dword [byte eax+014h]
        push str_STAND
        mov eax, dword [byte edx+eax+04h]
        push dword [dword_15E900]
        mov dword [dword_15E838], eax
        call sub_BC7F0
        add esp, byte 8
        push dword_15E7D4
        push dword_15E80C
        push eax
        push dword [dword_15E900]
        call sub_BC838
        add esp, byte 10h
        push str_STAND2ND
        push dword [dword_15E900]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E7AC
        push dword_15E7FC
        push eax
        push dword [dword_15E900]
        call sub_BC838
        add esp, byte 10h
        push str_WALL
        push dword [dword_15E900]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E790
        push dword_15E7F4
        push eax
        push dword [dword_15E900]
        call sub_BC838
        add esp, byte 10h
        push str_Rubber
        push dword [dword_15E8E0]
        call sub_B98E0
        add esp, byte 8
        push sub_224D1
        push eax
        push dword [dword_15E8E0]
        call sub_B9B70
        add esp, byte 0Ch
        push str_Rubberside
        push dword [dword_15E8E0]
        call sub_B98E0
        add esp, byte 8
        push sub_224AE
        push eax
        push dword [dword_15E8E0]
        call sub_B9B70
        add esp, byte 0Ch
        push str_ICE2
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E7CC
        push dword_15E808
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_ICELOGO2
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E780
        push dword_15E774
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Rlite0
        push dword [dword_15E8E4]
        call sub_BC760
        add esp, byte 8
        push str_Rlite1
        push dword [dword_15E8E4]
        mov dword [dword_15E834], eax
        call sub_BC760
        add esp, byte 8
        push str_Redlite
        push dword [dword_15E8E4]
        mov dword [dword_15E830], eax
        call sub_B98E0
        imul ebx, eax, byte 14h
        mov eax, dword [dword_15E8E4]
        add esp, byte 8
        mov edx, dword [byte eax+014h]
        push str_Glite0
        mov edx, dword [byte edx+ebx+0Ch]
        push eax
        mov dword [dword_15E828], edx
        call sub_BC760
        add esp, byte 8
        push str_Glite1
        push dword [dword_15E8E4]
        mov dword [dword_15E858], eax
        call sub_BC760
        add esp, byte 8
        push str_Grnlite
        push dword [dword_15E8E4]
        mov dword [dword_15E854], eax
        call sub_B98E0
        imul edx, eax, byte 14h
        mov eax, dword [dword_15E8E4]
        add esp, byte 8
        mov ebx, dword [byte eax+014h]
        push str_Lites
        mov edx, dword [byte edx+ebx+0Ch]
        push eax
        mov dword [dword_15E864], edx
        call sub_BC7F0
        add esp, byte 8
        push dword_15E78C
        push dword_15E7B8
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Penboxz0
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E714
        push dword_15E75C
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Penboxz1
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E710
        push dword_15E760
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Penboxt0
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E724
        push dword_15E768
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Penboxt1
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E720
        push dword_15E76C
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Penbot
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E728
        push dword_15E74C
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Penback
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E758
        push dword_15E718
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Penboxt0
        push dword [dword_15E8E4]
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Penboxz0
        mov eax, dword [edi+eax]
        push dword [dword_15E8E4]
        mov dword [dword_15E770], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Penboxz1
        mov eax, dword [byte edi+eax+08h]
        push dword [dword_15E8E4]
        mov dword [dword_15E738], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Penboxt0
        mov eax, dword [byte edi+eax+08h]
        push dword [dword_15E8E4]
        mov dword [dword_15E734], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Penboxt1
        mov eax, dword [byte edi+eax+08h]
        push dword [dword_15E8E4]
        mov dword [dword_15E754], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+08h]
        mov dword [dword_15E708], 0
        mov dword [dword_15E750], eax
.1:
        push dword [dword_15E708]
        push str_Penbox0D
        lea eax, [byte ebp-01Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-01Ch]
        push eax
        push dword [dword_15E8E4]
        call sub_BC760
        add esp, byte 8
        test eax, eax
        jl short .2
        mov edx, dword [dword_15E708]
        push edx
        push str_Penbox1D
        mov dword [nosplit edx*4+dword_15D298], eax
        lea eax, [byte ebp-01Ch]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-01Ch]
        push eax
        push dword [dword_15E8E4]
        call sub_BC760
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .2
        mov eax, dword [dword_15E708]
        inc dword [dword_15E708]
        mov dword [nosplit eax*4+dword_15D2A8], edx
        cmp dword [dword_15E708], byte 3
        jl short .1
.2:
        push str_DoorZ0
        push dword [dword_15E8E4]
        call sub_BC760
        add esp, byte 8
        push str_DoorZ1
        push dword [dword_15E8E4]
        mov dword [dword_15D2A4], eax
        call sub_BC760
        add esp, byte 8
        push str_Door00
        push dword [dword_15E8E4]
        mov dword [dword_15D2B4], eax
        call sub_BC760
        add esp, byte 8
        push str_Door01
        push dword [dword_15E8E4]
        mov dword [dword_15E6A0], eax
        call sub_BC760
        add esp, byte 8
        push str_Door02
        push dword [dword_15E8E4]
        mov dword [dword_15E6A4], eax
        call sub_BC760
        add esp, byte 8
        push str_Door10
        push dword [dword_15E8E4]
        mov dword [dword_15E6A8], eax
        call sub_BC760
        add esp, byte 8
        push str_Door11
        push dword [dword_15E8E4]
        mov dword [dword_15E6B4], eax
        call sub_BC760
        add esp, byte 8
        push str_Door12
        push dword [dword_15E8E4]
        mov dword [dword_15E6B8], eax
        call sub_BC760
        add esp, byte 8
        push str_Zambpath
        push dword [dword_15E8E4]
        mov dword [dword_15E6BC], eax
        call sub_BC7F0
        add esp, byte 8
        push dword_15E7F0
        push dword_15E800
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Benchz0
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E7C8
        push dword_15E7C0
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Benchz1
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E764
        push dword_15E7C4
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Benchbot
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E748
        push dword_15E7D0
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Benchdiv
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E71C
        push dword_15E7BC
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Benchbk
        push dword [dword_15E8E4]
        call sub_BC7F0
        add esp, byte 8
        push dword_15E73C
        push dword_15E788
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_Benchx
        push dword [dword_15E8E4]
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Benchz0
        mov eax, dword [edi+eax]
        push dword [dword_15E8E4]
        mov dword [dword_15E794], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        push str_Benchz1
        mov eax, dword [byte edi+eax+08h]
        push dword [dword_15E8E4]
        mov dword [dword_15E7A0], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+08h]
        mov dword [dword_15E6E0], 0
        mov dword [dword_15E79C], eax
.3:
        push dword [dword_15E6E0]
        push str_Pbench0D
        lea eax, [byte ebp-028h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-028h]
        push eax
        push dword [dword_15E8E4]
        call sub_BC760
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .4
        mov eax, dword [dword_15E6E0]
        push eax
        push str_Pbench1D
        mov dword [nosplit eax*4+dword_15D0A8], edx
        lea eax, [byte ebp-028h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-028h]
        push eax
        push dword [dword_15E8E4]
        call sub_BC760
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .4
        mov eax, dword [dword_15E6E0]
        inc dword [dword_15E6E0]
        mov dword [nosplit eax*4+dword_15D0C4], edx
        cmp dword [dword_15E6E0], byte 7
        jl short .3
.4:
        push str_B00
        push dword [dword_15E8E4]
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+04h]
        push str_Gt007
        sar eax, 2
        push dword [dword_15E8E4]
        mov dword [dword_15E844], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+08h]
        push str_Gt004
        sar eax, 2
        push dword [dword_15E8E4]
        mov dword [dword_15E820], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+08h]
        push str_Gt302
        sar eax, 2
        push dword [dword_15E8E4]
        mov dword [dword_15E85C], eax
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov eax, dword [byte edi+eax+04h]
        push str_Gt004
        sar eax, 2
        push dword [dword_15E8E4]
        mov dword [dword_15E874], eax
        call sub_BC760
        imul eax, byte 0Ch
        mov eax, dword [byte edi+eax+04h]
        sar eax, 2
        add esp, byte 8
        mov dword [dword_15E83C], eax
        mov eax, esi
        call sub_21D14
        push str_Crease
        push dword [dword_15E8E4]
        call sub_B98E0
        mov edx, eax
        imul edx, byte 14h
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+014h]
        add esp, byte 8
        mov eax, dword [byte edx+eax+04h]
        mov dword [dword_1175AD], 0
        mov dword [dword_15E7F8], eax
.5:
        push dword [dword_1175AD]
        push str_R02d
        lea eax, [byte ebp-010h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp-010h]
        push eax
        push dword [dword_15E8E4]
        call sub_BC760
        mov edx, eax
        add esp, byte 8
        test eax, eax
        jl short .6
        mov eax, dword [dword_1175AD]
        inc dword [dword_1175AD]
        mov dword [nosplit eax*4+dword_15DEA0], edx
        cmp dword [dword_1175AD], byte 10h
        jl short .5
.6:
        push str_C03
        push dword [dword_15E8E4]
        call sub_BC760
        add esp, byte 8
        push str_C02
        push dword [dword_15E8E4]
        mov dword [dword_15E120], eax
        call sub_BC760
        add esp, byte 8
        push str_C01
        push dword [dword_15E8E4]
        mov dword [dword_15E124], eax
        call sub_BC760
        add esp, byte 8
        push str_C00
        push dword [dword_15E8E4]
        mov dword [dword_15E128], eax
        call sub_BC760
        add esp, byte 8
        mov dword [dword_15E12C], eax
        call sub_227F5
        push str_Center
        push dword [dword_15E8E4]
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff0
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_15E684], edx
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff1
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_15E688], edx
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff2
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_15E68C], edx
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff3
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_15E690], edx
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff4
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_15E694], edx
        call sub_BC760
        imul eax, byte 0Ch
        mov edx, dword [byte ebp-04h]
        add edx, eax
        add esp, byte 8
        mov dword [dword_1595B8], edx
        push str_Faceoff5
        push dword [dword_15E8E4]
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff6
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_1595BC], edx
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Faceoff7
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_1595C0], edx
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Goal02
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_1595C4], edx
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Goal12
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_15E60C], edx
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_Maxx
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_15E610], edx
        call sub_BC760
        imul eax, byte 0Ch
        add esp, byte 8
        mov edx, dword [byte ebp-04h]
        push str_IceLine
        add edx, eax
        push dword [dword_15E8E4]
        mov dword [dword_15E614], edx
        call sub_BC7F0
        add esp, byte 8
        push dword_15E778
        push dword_15E784
        push eax
        push dword [dword_15E8E4]
        call sub_BC838
        add esp, byte 10h
        push str_FatRedLines
        push dword [dword_15E8E4]
        call sub_B98E0
        add esp, byte 8
        push sub_2269D
        push eax
        push dword [dword_15E8E4]
        mov edi, eax
        call sub_B9B70
        add esp, byte 0Ch
        imul edi, byte 14h
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+014h]
        push byte 20h
        mov ecx, esi
        movzx ebx, byte [edi+eax]
        movzx edx, byte [byte edi+eax+01h]
        movzx eax, byte [byte edi+eax+02h]
        call sub_873AE
        push str_FatBlueLines
        push dword [dword_15E8E4]
        mov dword [dword_15E7E0], eax
        call sub_B98E0
        mov edi, eax
        imul edi, byte 14h
        add esp, byte 8
        push sub_226C7
        push eax
        push dword [dword_15E8E4]
        call sub_B9B70
        mov eax, dword [dword_15E8E4]
        add esp, byte 0Ch
        mov eax, dword [byte eax+014h]
        mov ecx, esi
        push byte 20h
        movzx ebx, byte [edi+eax]
        movzx edx, byte [byte edi+eax+01h]
        movzx eax, byte [byte edi+eax+02h]
        call sub_873AE
        push str_Glassline
        push dword [dword_15E8E4]
        mov dword [dword_15E7EC], eax
        call sub_B98E0
        mov edi, eax
        imul edi, byte 14h
        add esp, byte 8
        push sub_226EA
        push eax
        push dword [dword_15E8E4]
        call sub_B9B70
        mov eax, dword [dword_15E8E4]
        add esp, byte 0Ch
        mov eax, dword [byte eax+014h]
        mov ecx, esi
        push byte 20h
        movzx ebx, byte [edi+eax]
        movzx edx, byte [byte edi+eax+01h]
        movzx eax, byte [byte edi+eax+02h]
        call sub_873AE
        push str_Topboards
        push dword [dword_15E8E4]
        mov dword [dword_15E7DC], eax
        call sub_B98E0
        mov edi, eax
        add esp, byte 8
        imul edi, byte 14h
        push sub_22669
        push eax
        push dword [dword_15E8E4]
        call sub_B9B70
        mov eax, dword [dword_15E8E4]
        add esp, byte 0Ch
        mov eax, dword [byte eax+014h]
        mov ecx, esi
        push byte 20h
        movzx ebx, byte [edi+eax]
        movzx edx, byte [byte edi+eax+01h]
        movzx eax, byte [byte edi+eax+02h]
        call sub_873AE
        push str_Botboards
        push dword [dword_15E8E4]
        mov dword [dword_15E814], eax
        call sub_B98E0
        mov edi, eax
        imul edi, byte 14h
        add esp, byte 8
        push sub_2268D
        push eax
        push dword [dword_15E8E4]
        call sub_B9B70
        mov eax, dword [dword_15E8E4]
        add esp, byte 0Ch
        mov eax, dword [byte eax+014h]
        mov ecx, esi
        push byte 20h
        movzx ebx, byte [edi+eax]
        movzx edx, byte [byte edi+eax+01h]
        movzx eax, byte [byte edi+eax+02h]
        call sub_873AE
        push str_ThinRedLines
        push dword [dword_15E8E4]
        mov dword [dword_15E804], eax
        call sub_B98E0
        add esp, byte 8
        push sub_226E0
        push eax
        push dword [dword_15E8E4]
        call sub_B9B70
        add esp, byte 0Ch
        call sub_2583F
        mov dword [dword_15E484], 0
        mov dword [dword_15E488], 0
        mov dword [dword_15E4A0], 0
        xor eax, eax
        mov dword [dword_15E4C4], 0
        jmp near sub_25EB3_11B
;-----------------------------------------------------------------------------
; sub_2751C                                                       2751C  96 PC
;-----------------------------------------------------------------------------
sub_2751C:
        push ebx
        push ecx
        push edx
        push dword [dword_15E8DC]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8E4]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8EC]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8E8]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E900]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8CC]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8C4]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8C8]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8F0]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8E0]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E818]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8D4]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8D8]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8F4]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8F8]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8FC]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E8D0]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E7DC]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E7E0]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E7EC]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E814]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E804]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E7E8]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15E6C0]
        call sub_ADBEC
        add esp, byte 4
        push dword [dword_15E6D0]
        call sub_ABF4C
        jmp near sub_25E7B_21
;-----------------------------------------------------------------------------
; sub_2767F                                                       2767F  96 PC
;-----------------------------------------------------------------------------
sub_2767F:
        push ebx
        push ecx
        push esi
        push edi
        push ebp
        mov ebp, esp
        push edx
        mov edi, dword_15E87C
        mov esi, eax
        movsd
        movsd
        movsd
        mov ecx, 9
        mov edi, unk_15E88C
        mov esi, edx
        push eax
        rep movsd
        call sub_BBBF0
        add esp, byte 4
        push dword [byte ebp-04h]
        call sub_BBBD0
        jmp near sub_21C1A_E1
;-----------------------------------------------------------------------------
; sub_276B5                                                       276B5  96 PC
;-----------------------------------------------------------------------------
sub_276B5:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 24Ch, 0
        sub ebp, 82h
        mov dword [byte ebp+07Eh], 270Fh
        mov dword [byte ebp+07Ah], 0FFFFD8F1h
        mov ecx, dword [dword_1175AD]
        xor eax, eax
        xor ebx, ebx
        xor edx, edx
        shl ecx, 2
        jmp short .2
.1:
        imul esi, dword [dword edx+dword_15DEA0], byte 0Ch
        mov dword [byte ebp+066h], esi
        mov esi, dword [dword_15E8E4]
        mov esi, dword [byte esi+078h]
        lea edi, [dword ebx+ebp-01CAh]
        add esi, dword [byte ebp+066h]
        movsd
        movsd
        movsd
        mov esi, dword [dword edx+dword_15DEA0]
        shl esi, 3
        mov dword [byte ebp+066h], esi
        mov esi, dword [dword_15E8E4]
        mov esi, dword [byte esi+07Ch]
        lea edi, [byte eax+ebp-03Ah]
        add esi, dword [byte ebp+066h]
        add eax, byte 8
        add ebx, byte 0Ch
        movsd
        movsd
        add edx, byte 4
        sub dword [byte eax+ebp-03Eh], byte 2
.2:
        cmp edx, ecx
        jl short .1
        push dword [dword_11F5F0]
        lea eax, [byte ebp-03Ah]
        push eax
        lea eax, [dword ebp-01CAh]
        push eax
        push dword [dword_1175AD]
        xor esi, esi
        call sub_BD9AC
        add esp, byte 10h
        mov dword [byte ebp+076h], eax
        xor eax, eax
        jmp short .6
.3:
        mov edx, dword [byte eax+ebp-036h]
        cmp edx, dword [byte ebp+07Eh]
        jge short .4
        mov dword [byte ebp+07Eh], edx
        mov dword [byte ebp+06Eh], esi
.4:
        mov edx, dword [byte eax+ebp-036h]
        cmp edx, dword [byte ebp+07Ah]
        jle short .5
        mov dword [byte ebp+07Ah], edx
        mov dword [byte ebp+072h], esi
.5:
        add eax, byte 8
        inc esi
.6:
        cmp esi, dword [byte ebp+076h]
        jl short .3
        cmp dword [byte ebp+07Eh], byte 0
        jle short .7
        push byte 0
        push dword [byte ebp+07Eh]
        push dword [dword_11F5C0]
        push byte 0
        push byte 0
        call sub_AD824
        add esp, byte 14h
.7:
        mov eax, dword [dword_11F5C4]
        dec eax
        cmp eax, dword [byte ebp+07Ah]
        jle short .8
        mov eax, dword [dword_11F5C4]
        sub eax, dword [byte ebp+07Eh]
        push byte 0
        dec eax
        push eax
        mov eax, dword [byte ebp+07Ah]
        push dword [dword_11F5C0]
        inc eax
        push eax
        push byte 0
        call sub_AD824
        add esp, byte 14h
.8:
        mov ebx, dword [byte ebp+06Eh]
        mov ecx, dword [byte ebp+076h]
        xor eax, eax
        xor edx, edx
        shl ecx, 3
        jmp short .11
.9:
        cmp ebx, dword [byte ebp+076h]
        jl short .10
        xor ebx, ebx
.10:
        mov esi, ebx
        lea edi, [dword edx+ebp-0DAh]
        lea esi, [byte ebp+esi*8-03Ah]
        add edx, byte 8
        inc eax
        movsd
        movsd
        cmp ebx, dword [byte ebp+072h]
        je short .12
        inc ebx
.11:
        cmp edx, ecx
        jl short .9
.12:
        inc eax
        inc eax
        mov ebx, dword [byte ebp+07Ah]
        lea edx, [dword ebp-0DAh]
        mov dword [dword ebp+eax*8-0EAh], 0FFFFFC19h
        push edx
        mov dword [dword ebp+eax*8-0E6h], ebx
        push eax
        mov ebx, dword [byte ebp+07Eh]
        mov dword [dword ebp+eax*8-0E2h], 0FFFFFC19h
        push byte 0
        mov dword [dword ebp+eax*8-0DEh], ebx
        call sub_E0959
        mov edx, dword [byte ebp+06Eh]
        mov ebx, dword [byte ebp+076h]
        mov ecx, dword [byte ebp+076h]
        add esp, byte 0Ch
        xor eax, eax
        dec ebx
        shl ecx, 3
        mov dword [byte ebp+06Ah], ebx
        xor ebx, ebx
        jmp short .15
.13:
        test edx, edx
        jge short .14
        mov edx, dword [byte ebp+06Ah]
.14:
        mov esi, edx
        lea edi, [dword ebx+ebp-0DAh]
        lea esi, [byte ebp+esi*8-03Ah]
        add ebx, byte 8
        inc eax
        movsd
        movsd
        cmp edx, dword [byte ebp+072h]
        je short .16
        dec edx
.15:
        cmp ebx, ecx
        jl short .13
.16:
        inc eax
        inc eax
        mov ebx, dword [byte ebp+07Ah]
        lea edx, [dword ebp-0DAh]
        mov dword [dword ebp+eax*8-0EAh], 3E7h
        push edx
        mov dword [dword ebp+eax*8-0E6h], ebx
        push eax
        mov ebx, dword [byte ebp+07Eh]
        mov dword [dword ebp+eax*8-0E2h], 3E7h
        push byte 0
        mov dword [dword ebp+eax*8-0DEh], ebx
        call sub_E0959
        add esp, byte 0Ch
        jmp near sub_2583F_602
;-----------------------------------------------------------------------------
; sub_278B9                                                       278B9  96 PC
;-----------------------------------------------------------------------------
sub_278B9:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 0B0h, 0
        sub ebp, 82h
        mov eax, dword [dword_15E8E4]
        and byte [byte eax+010h], 0FDh
        cmp byte [byte_1175A5], 0
        je short .2
        xor edx, edx
        xor ebx, ebx
        xor eax, eax
.1:
        imul esi, dword [dword eax+dword_15E120], byte 0Ch
        mov ecx, dword [dword_15E8E4]
        mov ecx, dword [byte ecx+078h]
        lea edi, [byte ebx+ebp-02Eh]
        add esi, ecx
        movsd
        movsd
        movsd
        mov edi, dword [dword eax+dword_15E120]
        mov ecx, dword [dword_15E8E4]
        shl edi, 3
        mov esi, dword [byte ecx+07Ch]
        add edx, byte 8
        add esi, edi
        lea edi, [byte edx+ebp+04Ah]
        add ebx, byte 0Ch
        add eax, byte 4
        movsd
        movsd
        cmp eax, byte 10h
        jne short .1
        lea eax, [byte ebp+052h]
        push eax
        lea eax, [byte ebp-02Eh]
        push eax
        push byte 4
        call sub_B82F0
        add esp, byte 0Ch
        push dword [dword_15E7CC]
        push dword [dword_15E808]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        jmp short .3
.2:
        mov eax, dword [dword_15E8E4]
        mov ebx, 0FFFFFFFFh
        mov edx, dword [byte eax+07Ch]
        mov eax, dword [byte eax+078h]
        call sub_BE8AC
        mov edx, dword_15DEA0
        mov ebx, dword [dword_15E810]
        mov eax, dword [dword_1175AD]
        call sub_BE6E0
.3:
        call sub_22A3A
        mov eax, dword [dword_15E60C]
        cmp dword [byte eax+08h], byte 50h
        jle short .6
        cmp dword [byte eax+04h], byte 0
        jge short .4
        mov edx, dword [byte eax+04h]
        neg edx
        jmp short .5
.4:
        mov edx, dword [byte eax+04h]
.5:
        mov eax, dword [dword_15E60C]
        cmp edx, dword [byte eax+08h]
        jge short .6
        xor edx, edx
        call sub_22DD7
.6:
        mov eax, dword [dword_15E610]
        cmp dword [byte eax+08h], byte 50h
        jle short .9
        cmp dword [byte eax+04h], byte 0
        jge short .7
        mov edx, dword [byte eax+04h]
        neg edx
        jmp short .8
.7:
        mov edx, dword [byte eax+04h]
.8:
        mov eax, dword [dword_15E610]
        cmp edx, dword [byte eax+08h]
        jge short .9
        mov edx, 1
        call sub_22DD7
.9:
        mov eax, dword [dword_15E614]
        call sub_22D27
        push dword [dword_15E778]
        push dword [dword_15E784]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E8E4]
        or byte [byte eax+010h], 2
        add esp, byte 0Ch
        cmp byte [byte_1175A6], 0
        je short .10
        push dword [dword_15E780]
        push dword [dword_15E774]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.10:
        mov eax, dword [dword_15E684]
        xor edx, edx
        mov ebx, 4
        call sub_22B3C
.11:
        mov edx, 1
        mov eax, dword [dword ebx+dword_15E684]
        add ebx, byte 4
        call sub_22B3C
        cmp ebx, byte 14h
        jne short .11
        mov edx, dword [dword_15E7EC]
        mov eax, dword [dword_15E684]
        mov ebx, 4
        call sub_22AF0
.12:
        mov edx, dword [dword_15E7E0]
        mov eax, dword [dword ebx+dword_15E684]
        add ebx, byte 4
        call sub_22AF0
        cmp ebx, byte 14h
        jne short .12
        xor ebx, ebx
.13:
        mov edx, dword [dword_15E7E0]
        mov eax, dword [dword ebx+dword_1595B8]
        add ebx, byte 4
        call sub_22AF0
        cmp ebx, byte 10h
        jne short .13
        cmp byte [byte_1175A8], 0
        je near sub_2583F_602
        push unk_15E230
        call sub_DD8B0
        add esp, byte 4
        push dword [dword_15E78C]
        push dword [dword_15E7B8]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        push unk_15E330
        mov dword [byte ebp+07Ah], dword_15D2B8
        mov dword [byte ebp+076h], 0
        call sub_DD8B0
        add esp, byte 4
.14:
        mov eax, dword [byte ebp+07Ah]
        cmp dword [eax], byte 0
        je near .18
        cmp dword [byte eax+04h], byte 0
        je near .18
        mov eax, dword [byte eax+018h]
        mov edx, dword_15DC48
        shl eax, 2
        add edx, eax
        mov dword [byte ebp+072h], 0
        mov dword [byte ebp+07Eh], edx
        jmp near .17
.15:
        mov eax, dword [byte ebp+07Eh]
        mov eax, dword [eax]
        push dword [byte eax+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne near .16
        mov eax, dword [byte ebp+07Eh]
        mov eax, dword [eax]
        mov eax, dword [byte eax+04h]
        imul esi, dword [eax], byte 0Ch
        mov eax, dword [dword_190E98]
        lea edi, [byte ebp+02h]
        add esi, eax
        mov edx, dword [byte ebp+07Eh]
        movsd
        movsd
        movsd
        mov edx, dword [edx]
        mov edx, dword [byte edx+04h]
        imul esi, dword [byte edx+04h], byte 0Ch
        lea edi, [byte ebp+0Eh]
        add esi, eax
        mov edx, dword [byte ebp+07Eh]
        movsd
        movsd
        movsd
        mov edx, dword [edx]
        mov edx, dword [byte edx+04h]
        imul esi, dword [byte edx+08h], byte 0Ch
        lea edi, [byte ebp+01Ah]
        add esi, eax
        mov edx, dword [byte ebp+07Eh]
        movsd
        movsd
        movsd
        mov edx, dword [edx]
        mov edx, dword [byte edx+04h]
        imul esi, dword [byte edx+0Ch], byte 0Ch
        lea edi, [byte ebp+026h]
        add esi, eax
        movsd
        movsd
        movsd
        mov eax, dword [byte ebp+02Ah]
        sub eax, dword [byte ebp+06h]
        add eax, eax
        add dword [byte ebp+06h], eax
        mov eax, dword [byte ebp+01Eh]
        sub eax, dword [byte ebp+012h]
        add eax, eax
        push byte 10h
        add dword [byte ebp+012h], eax
        lea eax, [byte ebp+032h]
        push eax
        lea eax, [byte ebp+02h]
        push eax
        push byte 4
        call sub_BBAA0
        add esp, byte 10h
        lea eax, [byte ebp+032h]
        push eax
        push byte 4
        call sub_E1575
        add esp, byte 8
.16:
        inc dword [byte ebp+072h]
        add dword [byte ebp+07Eh], byte 4
.17:
        mov edx, dword [byte ebp+07Ah]
        mov eax, dword [byte ebp+072h]
        cmp eax, dword [byte edx+0Ch]
        jl near .15
.18:
        inc dword [byte ebp+076h]
        add dword [byte ebp+07Ah], 88h
        cmp dword [byte ebp+076h], byte 12h
        jl near .14
        jmp near sub_2583F_602
;-----------------------------------------------------------------------------
; sub_27BF1                                                       27BF1  96 PC
;-----------------------------------------------------------------------------
sub_27BF1:
        push ebx
        push ecx
        push edx
        push dword [dword_15E8E4]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E8E4]
        call sub_BBC14
        add esp, byte 4
        cmp byte [byte_1175A9], 0
        je short .1
        push dword [dword_15E900]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E900]
        call sub_BBC14
        add esp, byte 4
.1:
        cmp byte [byte_1175AC], 0
        je short .2
        push dword [dword_15E8C4]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E8C4]
        call sub_BBC14
        add esp, byte 4
.2:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_27C5E                                                       27C5E  96 PC
;-----------------------------------------------------------------------------
sub_27C5E:
        push esi
        push edi
        enter 0B4h, 0
        push eax
        push edx
        push ebx
        push ecx
        sub ebp, 82h
        mov dword [byte ebp+07Eh], 0
        xor edi, edi
        mov esi, SortCords
        mov dword [byte ebp+072h], edi
        mov dword [byte ebp+06Eh], edi
.1:
        cmp dword [dword_11A3F8], byte 0
        je near .4
        mov eax, dword [byte ebp+07Eh]
        cmp byte [dword eax+byte_176F96], 0
        je near .6
        movsx eax, word [dword edi+word_176FFC]
        cmp eax, byte 0FFFFFFFFh
        je near .6
        movsx eax, word [dword edi+word_176FB8]
        cmp eax, dword [byte ebp-036h]
        jl near .6
        cmp eax, dword [byte ebp-03Ah]
        jg near .6
        movsx eax, word [dword edi+word_176FDA]
        cmp eax, dword [byte ebp-03Eh]
        jl near .6
        cmp eax, dword [byte ebp-042h]
        jg near .6
        mov ax, word [dword edi+word_176FFC]
        mov word [byte ebp-020h], ax
        mov ax, word [dword edi+word_17704C]
        mov word [byte ebp+06h], ax
        mov ax, word [dword edi+word_17706E]
        mov word [byte ebp+08h], ax
        mov eax, dword [byte ebp+07Eh]
        movsx ax, byte [dword eax+byte_17703B]
        mov word [byte ebp+04h], ax
        mov eax, dword [byte ebp+07Eh]
        cmp byte [dword eax+byte_17701E], 0
        je short .2
        or byte [byte ebp+023h], 8
        jmp short .3
.2:
        and byte [byte ebp+023h], 0F7h
.3:
        lea eax, [byte ebp-032h]
        call sub_4B38C
        mov eax, dword [nosplit eax*4+dword_152FEC]
        mov dword [byte ebp+076h], eax
        mov eax, dword [byte ebp+06Eh]
        push dword [dword eax+dword_179AC8]
        call sub_625AA
        add esp, byte 4
        mov edx, dword [byte ebp+07Eh]
        mov ebx, dword [byte ebp+072h]
        push byte 1
        movsx edx, byte [dword edx+byte_17701E]
        push dword [byte ebp+07Eh]
        mov ecx, eax
        push edx
        mov edx, dword [byte ebp+072h]
        mov eax, dword [byte ebp+076h]
        jmp near .5
.4:
        cmp dword [dword esi+09Ch], byte 0
        je near .6
        movsx eax, word [byte esi+012h]
        cmp eax, byte 0FFFFFFFFh
        je near .6
        movsx eax, word [byte esi+02h]
        cmp eax, dword [byte ebp-036h]
        jl short .6
        cmp eax, dword [byte ebp-03Ah]
        jg short .6
        movsx eax, word [byte esi+06h]
        cmp eax, dword [byte ebp-03Eh]
        jl short .6
        cmp eax, dword [byte ebp-042h]
        jg short .6
        mov eax, esi
        call sub_4B38C
        mov eax, dword [nosplit eax*4+dword_152FEC]
        mov dword [byte ebp+07Ah], eax
        mov eax, dword [byte ebp+06Eh]
        push dword [dword eax+dword_179AC8]
        call sub_625AA
        add esp, byte 4
        push byte 1
        movsx edx, word [dword esi+086h]
        push edx
        mov dx, word [byte esi+054h]
        xor dl, dl
        and dh, 8
        movsx edx, dx
        test edx, edx
        setne dl
        mov ebx, dword [byte ebp+072h]
        movzx edx, dl
        mov ecx, eax
        push edx
        mov edx, dword [byte ebp+072h]
        mov eax, dword [byte ebp+07Ah]
.5:
        mov ebx, dword [dword ebx+dword_179800]
        mov edx, dword [dword edx+dword_1797FC]
        call sub_59349
.6:
        add dword [byte ebp+072h], byte 8
        add dword [byte ebp+06Eh], byte 0Ch
        inc dword [byte ebp+07Eh]
        add esi, 0A0h
        inc edi
        inc edi
        cmp dword [byte ebp+07Eh], byte 11h
        jl near .1
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        ret
;-----------------------------------------------------------------------------
; sub_27E24                                                       27E24  96 PC
;-----------------------------------------------------------------------------
sub_27E24:
        push ebx
        push ecx
        push esi
        push edi
        enter 44h, 0
        push edx
        cmp byte [byte_1175AB], 0
        je near sub_27E24_F6
        imul esi, eax, byte 1Ch
        mov edx, dword [dword_17997C]
        mov dword [dword_17997C], 0
        mov dword [byte ebp-018h], edx
        add esi, dword_15D0A8
        cmp dword [byte ebp-048h], byte 0
        jg short .1
        add esi, byte 18h
.1:
        lea edx, [byte eax+011h]
        imul eax, dword 126h
        add eax, unk_165354
        mov dword [byte ebp-010h], eax
        add eax, 126h
        mov dword [byte ebp-0Ch], edx
        mov dword [byte ebp-08h], eax
.2:
        mov edi, dword [esi]
        mov eax, dword [dword_15E8E4]
        shl edi, 3
        mov edx, dword [byte eax+07Ch]
        add edi, edx
        imul edx, dword [esi], byte 0Ch
        mov eax, dword [byte eax+078h]
        add edx, eax
        cmp dword [dword_11A3F8], byte 0
        je short .3
        mov word [byte ebp-032h], 8F8h
        mov word [byte ebp-02Ch], 71Bh
        mov word [byte ebp-02Ah], 0
        lea eax, [byte ebp-044h]
        mov word [byte ebp-02Eh], 2
        jmp short .4
.3:
        mov eax, dword [byte ebp-010h]
.4:
        call sub_49300
        mov dword [byte ebp-04h], eax
        mov eax, dword [nosplit eax*4+dword_152FEC]
        mov dword [byte ebp-014h], eax
        push dword [byte edx+08h]
        call sub_625AA
        add esp, byte 4
        cmp dword [byte ebp-04h], byte 0FFFFFFFFh
        je short .5
        push byte 0
        mov ecx, eax
        push dword [byte ebp-0Ch]
        mov ebx, dword [byte edi+04h]
        push byte 0
        mov edx, dword [edi]
        mov eax, dword [byte ebp-014h]
        call sub_59349
.5:
        cmp dword [byte ebp-048h], byte 0
        jle short .6
        add esi, byte 4
        jmp short .7
.6:
        sub esi, byte 4
.7:
        add dword [byte ebp-010h], byte 2Ah
        mov eax, dword [byte ebp-010h]
        cmp eax, dword [byte ebp-08h]
        jne near .2
        mov eax, dword [byte ebp-018h]
sub_27E24_F1:
        mov dword [dword_17997C], eax
sub_27E24_F6:
        leave
        pop edi
        pop esi
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_27F20                                                       27F20  96 PC
;-----------------------------------------------------------------------------
sub_27F20:
        push ebx
        push ecx
        push edx
        enter 100h, 0
        lea ebx, [dword ebp-0100h]
        push ebx
        call sub_DD8C8
        add esp, byte 4
        push unk_15DF20
        call sub_DD8B0
        add esp, byte 4
        push dword [dword_15E748]
        push dword [dword_15E7D0]
        push dword [dword_15E8E4]
        call sub_BC040
        mov ebx, dword [dword_15E87C]
        add esp, byte 0Ch
        cmp ebx, dword [dword_15E794]
        jle short .1
        push dword [dword_15E73C]
        push dword [dword_15E788]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.1:
        cmp dword [dword_15E884], byte 0
        jg near .3
        mov ecx, 190h
        mov eax, 0FFFFFEACh
        mov ebx, dword [dword_15E79C]
        xor edx, edx
        sar ebx, 2
        call sub_27C5E
        push dword [dword_15E764]
        push dword [dword_15E7C4]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        mov edx, 0FFFFFFFFh
        mov eax, 1
        call sub_27E24
        xor ebx, ebx
        mov eax, 0FFFFFEACh
        mov ecx, dword [dword_15E79C]
        xor edx, edx
        sar ecx, 2
        call sub_27C5E
        push dword [dword_15E71C]
        push dword [dword_15E7BC]
        push dword [dword_15E8E4]
        call sub_BC040
        mov ebx, dword [dword_15E884]
        add esp, byte 0Ch
        cmp ebx, dword [dword_15E7A0]
        jge short .2
        mov edx, 1
        xor eax, eax
        call sub_27E24
        xor ecx, ecx
        mov eax, 0FFFFFEACh
        mov ebx, dword [dword_15E7A0]
        xor edx, edx
        sar ebx, 2
        call sub_27C5E
        push unk_15E020
        call sub_DD8B0
        add esp, byte 4
.2:
        push dword [dword_15E7C8]
        push dword [dword_15E7C0]
        push dword [dword_15E8E4]
        call sub_BC040
        mov ebx, dword [dword_15E884]
        add esp, byte 0Ch
        cmp ebx, dword [dword_15E7A0]
        jl near .6
        mov edx, 1
        xor eax, eax
        call sub_27E24
        xor ecx, ecx
        mov eax, 0FFFFFEACh
        mov ebx, dword [dword_15E7A0]
        xor edx, edx
        sar ebx, 2
        jmp near .5
.3:
        jle near .6
        mov ebx, 0FFFFFE70h
        mov eax, 0FFFFFEACh
        mov ecx, dword [dword_15E7A0]
        xor edx, edx
        sar ecx, 2
        call sub_27C5E
        push dword [dword_15E7C8]
        push dword [dword_15E7C0]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        mov edx, 0FFFFFFFFh
        xor eax, eax
        call sub_27E24
        xor ecx, ecx
        mov eax, 0FFFFFEACh
        mov ebx, dword [dword_15E7A0]
        xor edx, edx
        sar ebx, 2
        call sub_27C5E
        push dword [dword_15E71C]
        push dword [dword_15E7BC]
        push dword [dword_15E8E4]
        call sub_BC040
        mov ebx, dword [dword_15E884]
        add esp, byte 0Ch
        cmp ebx, dword [dword_15E79C]
        jle short .4
        mov edx, 1
        mov eax, edx
        xor ebx, ebx
        call sub_27E24
        mov eax, 0FFFFFEACh
        mov ecx, dword [dword_15E79C]
        xor edx, edx
        sar ecx, 2
        call sub_27C5E
        push unk_15E020
        call sub_DD8B0
        add esp, byte 4
.4:
        push dword [dword_15E764]
        push dword [dword_15E7C4]
        push dword [dword_15E8E4]
        call sub_BC040
        mov ebx, dword [dword_15E884]
        add esp, byte 0Ch
        cmp ebx, dword [dword_15E79C]
        jg short .6
        mov edx, 1
        mov eax, edx
        xor ebx, ebx
        call sub_27E24
        mov eax, 0FFFFFEACh
        mov ecx, dword [dword_15E79C]
        xor edx, edx
        sar ecx, 2
.5:
        call sub_27C5E
.6:
        mov ebx, dword [dword_15E87C]
        cmp ebx, dword [dword_15E794]
        jg short .7
        push unk_15E020
        call sub_DD8B0
        add esp, byte 4
        push dword [dword_15E73C]
        push dword [dword_15E788]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.7:
        lea ebx, [dword ebp-0100h]
        push ebx
        call sub_DD8B0
        add esp, byte 4
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_281DC                                                       281DC  96 PC
;-----------------------------------------------------------------------------
sub_281DC:
        push ebx
        push ecx
        push esi
        push edi
        enter 44h, 0
        push edx
        mov edx, dword [dword_17997C]
        mov dword [dword_17997C], 0
        mov dword [byte ebp-08h], edx
        cmp dword [dword_11A3F8], byte 0
        je short .1
        movsx edi, byte [dword eax+byte_1770A7]
        jmp short .2
.1:
        movsx edi, byte [dword eax+PBnum]
.2:
        cmp edi, byte 3
        jle short .3
        mov edi, 3
.3:
        test edi, edi
        jle near .11
        mov esi, eax
        shl esi, 4
        add esi, dword_15D298
        cmp dword [byte ebp-048h], byte 0
        jg short .4
        mov edx, edi
        shl edx, 2
        sub edx, byte 4
        add esi, edx
.4:
        lea edx, [byte eax+011h]
        imul eax, byte 7Eh
        mov dword [byte ebp-0Ch], 0
        add eax, unk_165258
        mov dword [byte ebp-018h], edx
        mov dword [byte ebp-04h], eax
        jmp near .10
.5:
        mov edx, dword [esi]
        mov eax, dword [dword_15E8E4]
        shl edx, 3
        mov ebx, dword [byte eax+07Ch]
        add ebx, edx
        imul edx, dword [esi], byte 0Ch
        mov eax, dword [byte eax+078h]
        mov dword [byte ebp-010h], ebx
        add edx, eax
        cmp dword [dword_11A3F8], byte 0
        je short .6
        mov word [byte ebp-032h], 8F8h
        mov word [byte ebp-02Ch], 71Bh
        mov word [byte ebp-02Ah], 0
        lea eax, [byte ebp-044h]
        mov word [byte ebp-02Eh], 6
        jmp short .7
.6:
        mov eax, dword [byte ebp-04h]
.7:
        call sub_49300
        mov eax, dword [nosplit eax*4+dword_152FEC]
        mov dword [byte ebp-014h], eax
        push dword [byte edx+08h]
        call sub_625AA
        add esp, byte 4
        mov ebx, dword [byte ebp-010h]
        push byte 0
        mov edx, dword [byte ebp-010h]
        mov ecx, eax
        push dword [byte ebp-018h]
        mov eax, dword [byte ebp-014h]
        push byte 0
        mov ebx, dword [byte ebx+04h]
        mov edx, dword [edx]
        call sub_59349
        cmp dword [byte ebp-048h], byte 0
        jle short .8
        add esi, byte 4
        jmp short .9
.8:
        sub esi, byte 4
.9:
        add dword [byte ebp-04h], byte 2Ah
        inc dword [byte ebp-0Ch]
.10:
        cmp edi, dword [byte ebp-0Ch]
        jg near .5
.11:
        mov eax, dword [byte ebp-08h]
        jmp near sub_27E24_F1
        push edx
        shl eax, 4
        imul edx, dword [dword eax+dword_15D2A4], byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        add eax, edx
        pop edx
        ret
        shl eax, 4
        imul edx, dword [dword eax+edx*4+dword_15D298], byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        add eax, edx
        ret
;-----------------------------------------------------------------------------
; sub_28327                                                       28327  96 PC
;-----------------------------------------------------------------------------
sub_28327:
        push ebx
        push ecx
        push edx
        mov edx, eax
        test eax, eax
        je short .1
        mov eax, dword_15E6B4
        jmp short .2
.1:
        mov eax, dword_15E6A0
.2:
        test edx, edx
        je short .3
        mov ebx, 1
        jmp short .4
.3:
        mov ebx, 0FFFFFFFFh
.4:
        imul ebx, byte 78h
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        mov dword [ecx+edx], 2CBh
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        add eax, byte 4
        mov dword [byte ecx+edx+08h], ebx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        mov dword [ecx+edx], 2CBh
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        add eax, byte 4
        mov dword [byte ecx+edx+08h], ebx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        mov dword [ecx+edx], 2CBh
sub_28327_87:
        imul edx, dword [eax], byte 0Ch
        mov eax, dword [dword_15E8E4]
        mov eax, dword [byte eax+070h]
        mov dword [byte edx+eax+08h], ebx
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_283C1                                                       283C1  96 PC
;-----------------------------------------------------------------------------
sub_283C1:
        push ebx
        push ecx
        push edx
        mov edx, eax
        test eax, eax
        je short .1
        mov eax, dword_15E6B4
        jmp short .2
.1:
        mov eax, dword_15E6A0
.2:
        test edx, edx
        je short .3
        mov ebx, 1
        jmp short .4
.3:
        mov ebx, 0FFFFFFFFh
.4:
        imul ebx, dword 0A0h
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        add edx, ecx
        mov ecx, dword [dword_15E7A8]
        mov dword [edx], ecx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        add eax, byte 4
        mov dword [byte ecx+edx+08h], ebx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        add edx, ecx
        mov ecx, dword [dword_15E7A8]
        mov dword [edx], ecx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        add eax, byte 4
        mov dword [byte ecx+edx+08h], ebx
        imul ecx, dword [eax], byte 0Ch
        mov edx, dword [dword_15E8E4]
        mov edx, dword [byte edx+070h]
        add edx, ecx
        mov ecx, dword [dword_15E7A8]
        mov dword [edx], ecx
        jmp near sub_28327_87
;-----------------------------------------------------------------------------
; sub_28459                                                       28459  96 PC
;-----------------------------------------------------------------------------
sub_28459:
        push ebx
        mov ebx, eax
        test edx, edx
        je short .2
        call sub_28327
        test ebx, ebx
        je short .1
        mov dword [dword_1175B9], 1
        pop ebx
        ret
.1:
        mov dword [dword_1175B5], 1
        pop ebx
        ret
.2:
        call sub_283C1
        test ebx, ebx
        je short .3
        mov dword [dword_1175B9], edx
        pop ebx
        ret
.3:
        mov dword [dword_1175B5], edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_2849A                                                       2849A  96 PC
;-----------------------------------------------------------------------------
sub_2849A:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 114h, 0
        imul eax, dword 88h
        mov esi, unk_15DB38
        mov edi, dword [dword_15E8E4]
        add esi, eax
        mov eax, dword [dword edi+080h]
        mov dword [byte ebp-08h], eax
        mov eax, dword [byte edi+078h]
        mov dword [byte ebp-04h], eax
        lea eax, [dword ebp-0114h]
        push eax
        call sub_DD8C8
        add esp, byte 4
        cmp dword [esi], byte 0
        je near sub_24D8C_194
        cmp byte [byte_1175A7], 0
        je short .4
        mov edi, dword [byte esi+020h]
        shl edi, 2
        add edi, dword_15DD10
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne short .4
        cmp dword [byte esi+04h], byte 0
        je short .1
        push unk_15DF20
        jmp short .2
.1:
        push unk_15E020
.2:
        call sub_DD8B0
        add esp, byte 4
        cmp dword [byte esi+024h], byte 0
        jne short .3
        call sub_24B87
        jmp short .4
.3:
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B7A70
        add esp, byte 8
.4:
        mov edi, dword [byte esi+018h]
        shl edi, 2
        add edi, dword_15DC48
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B78DC
        add esp, byte 8
        test eax, eax
        jne short .6
        cmp dword [byte esi+04h], byte 0
        je short .5
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        push dword [dword_15E838]
        call sub_B79E0
        add esp, byte 0Ch
        jmp short .6
.5:
        push unk_15E130
        call sub_DD8B0
        add esp, byte 4
        mov eax, dword [edi]
        push dword [byte eax+04h]
        push byte 4
        call sub_B7A70
        add esp, byte 8
.6:
        mov eax, dword [byte esi+030h]
        mov dword [byte ebp-010h], eax
        mov eax, dword [byte esi+034h]
        mov dword [byte ebp-014h], eax
        imul eax, dword [byte ebp-010h], byte 0Ch
        push dword [dword_15E8C0]
        add eax, dword [byte ebp-04h]
        push eax
        call sub_BA2F0
        mov edi, eax
        imul eax, dword [byte ebp-014h], byte 0Ch
        add esp, byte 8
        push dword [dword_15E8C0]
        add eax, dword [byte ebp-04h]
        push eax
        call sub_BA2F0
        add esp, byte 8
        push eax
        push edi
        mov edi, dword [byte ebp-014h]
        shl edi, 3
        push dword [dword_15E814]
        add edi, dword [byte ebp-08h]
        push dword [byte edi+04h]
        push dword [edi]
        mov edi, dword [byte ebp-010h]
        shl edi, 3
        add edi, dword [byte ebp-08h]
        push dword [byte edi+04h]
        push dword [edi]
        call sub_87DD6
        add esp, byte 1Ch
        cmp dword [byte esi+04h], byte 0
        je near sub_24D8C_194
        mov eax, dword [byte esi+048h]
        mov dword [byte ebp-0Ch], eax
        imul eax, byte 0Ch
        push dword [dword_15E8B8]
        add eax, dword [byte ebp-04h]
        push eax
        mov edi, dword [byte esi+04Ch]
        call sub_BA2F0
        mov esi, eax
        imul eax, edi, byte 0Ch
        add esp, byte 8
        push dword [dword_15E8B8]
        add eax, dword [byte ebp-04h]
        push eax
        call sub_BA2F0
        add esp, byte 8
        push eax
        push esi
        mov esi, edi
        shl esi, 3
        push dword [dword_15E804]
        add esi, dword [byte ebp-08h]
        push dword [byte esi+04h]
        push dword [esi]
        mov esi, dword [byte ebp-0Ch]
        shl esi, 3
        add esi, dword [byte ebp-08h]
        push dword [byte esi+04h]
        push dword [esi]
        call sub_87DD6
        add esp, byte 1Ch
        jmp near sub_24D8C_194
;-----------------------------------------------------------------------------
; sub_28668                                                       28668  96 PC
;-----------------------------------------------------------------------------
sub_28668:
        push ebx
        push ecx
        push edx
        push dword [dword_15E728]
        push dword [dword_15E74C]
        push dword [dword_15E8E4]
        call sub_BC040
        mov ebx, dword [dword_15E87C]
        add esp, byte 0Ch
        cmp ebx, dword [dword_15E770]
        jge short .1
        push dword [dword_15E758]
        push dword [dword_15E718]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.1:
        cmp dword [dword_15E884], byte 0
        jg near .9
        mov ecx, 190h
        mov edx, 154h
        mov ebx, dword [dword_15E734]
        xor eax, eax
        sar ebx, 2
        call sub_27C5E
        push dword [dword_15E710]
        push dword [dword_15E760]
        push dword [dword_15E8E4]
        call sub_BC040
        mov ebx, dword [dword_15E87C]
        add esp, byte 0Ch
        cmp ebx, dword [dword_15E7A8]
        jl short .2
        mov eax, 1
        call sub_2849A
.2:
        mov edx, 0FFFFFFFFh
        mov eax, 1
        call sub_281DC
        mov edx, 154h
        mov ecx, dword [dword_15E734]
        mov ebx, dword [dword_15E750]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call sub_27C5E
        mov ebx, dword [dword_15E87C]
        cmp ebx, dword [dword_15E7A8]
        jge short .3
        mov eax, 1
        call sub_2849A
.3:
        push dword [dword_15E720]
        push dword [dword_15E76C]
        push dword [dword_15E8E4]
        call sub_BC040
        mov edx, 154h
        mov ecx, dword [dword_15E750]
        mov ebx, dword [dword_15E754]
        add esp, byte 0Ch
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call sub_27C5E
        mov ebx, dword [dword_15E884]
        cmp ebx, dword [dword_15E754]
        jge short .4
        push dword [dword_15E724]
        push dword [dword_15E768]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.4:
        mov ebx, dword [dword_15E87C]
        cmp ebx, dword [dword_15E7A8]
        jl short .5
        xor eax, eax
        call sub_2849A
.5:
        mov ebx, dword [dword_15E884]
        cmp ebx, dword [dword_15E738]
        jge short .6
        mov edx, 1
        xor eax, eax
        call sub_281DC
        mov edx, 154h
        mov ecx, dword [dword_15E754]
        mov ebx, dword [dword_15E738]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call sub_27C5E
.6:
        push dword [dword_15E714]
        push dword [dword_15E75C]
        push dword [dword_15E8E4]
        call sub_BC040
        mov ebx, dword [dword_15E884]
        add esp, byte 0Ch
        cmp ebx, dword [dword_15E738]
        jl short .7
        mov edx, 1
        xor eax, eax
        call sub_281DC
        mov edx, 154h
        mov ecx, dword [dword_15E754]
        mov ebx, dword [dword_15E738]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call sub_27C5E
.7:
        mov ebx, dword [dword_15E884]
        cmp ebx, dword [dword_15E754]
        jl short .8
        push dword [dword_15E724]
        push dword [dword_15E768]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.8:
        mov ebx, dword [dword_15E87C]
        cmp ebx, dword [dword_15E7A8]
        jge near .18
        xor eax, eax
        jmp near .17
.9:
        jle near .18
        mov ebx, 0FFFFFE70h
        mov edx, 154h
        mov ecx, dword [dword_15E738]
        xor eax, eax
        sar ecx, 2
        call sub_27C5E
        push dword [dword_15E714]
        push dword [dword_15E75C]
        push dword [dword_15E8E4]
        call sub_BC040
        mov ebx, dword [dword_15E87C]
        add esp, byte 0Ch
        cmp ebx, dword [dword_15E7A8]
        jl short .10
        xor eax, eax
        call sub_2849A
.10:
        mov edx, 0FFFFFFFFh
        xor eax, eax
        call sub_281DC
        mov edx, 154h
        mov ecx, dword [dword_15E754]
        mov ebx, dword [dword_15E738]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call sub_27C5E
        mov ebx, dword [dword_15E87C]
        cmp ebx, dword [dword_15E7A8]
        jge short .11
        xor eax, eax
        call sub_2849A
.11:
        push dword [dword_15E724]
        push dword [dword_15E768]
        push dword [dword_15E8E4]
        call sub_BC040
        mov edx, 154h
        mov ecx, dword [dword_15E750]
        mov ebx, dword [dword_15E754]
        add esp, byte 0Ch
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call sub_27C5E
        mov ebx, dword [dword_15E884]
        cmp ebx, dword [dword_15E750]
        jle short .12
        push dword [dword_15E720]
        push dword [dword_15E76C]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.12:
        mov ebx, dword [dword_15E87C]
        cmp ebx, dword [dword_15E7A8]
        jl short .13
        mov eax, 1
        call sub_2849A
.13:
        mov ebx, dword [dword_15E884]
        cmp ebx, dword [dword_15E734]
        jle short .14
        mov edx, 1
        mov eax, edx
        call sub_281DC
        mov edx, 154h
        mov ecx, dword [dword_15E734]
        mov ebx, dword [dword_15E750]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call sub_27C5E
.14:
        push dword [dword_15E710]
        push dword [dword_15E760]
        push dword [dword_15E8E4]
        call sub_BC040
        mov ebx, dword [dword_15E884]
        add esp, byte 0Ch
        cmp ebx, dword [dword_15E734]
        jg short .15
        mov edx, 1
        mov eax, edx
        call sub_281DC
        mov edx, 154h
        mov ecx, dword [dword_15E734]
        mov ebx, dword [dword_15E750]
        xor eax, eax
        sar ecx, 2
        sar ebx, 2
        call sub_27C5E
.15:
        mov ebx, dword [dword_15E884]
        cmp ebx, dword [dword_15E750]
        jg short .16
        push dword [dword_15E720]
        push dword [dword_15E76C]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.16:
        mov ebx, dword [dword_15E87C]
        cmp ebx, dword [dword_15E7A8]
        jge short .18
        mov eax, 1
.17:
        call sub_2849A
.18:
        mov ebx, dword [dword_15E87C]
        cmp ebx, dword [dword_15E770]
        jl short .19
        push dword [dword_15E758]
        push dword [dword_15E718]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.19:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_28A87                                                       28A87  96 PC
;-----------------------------------------------------------------------------
sub_28A87:
        push ebx
        push ecx
        push edx
        call sub_241F6
        mov eax, dword [dword_15E900]
        and byte [byte eax+010h], 0FDh
        call sub_278B9
        cmp byte [byte_1175A9], 0
        je short .1
        cmp dword [dword_11A3F8], byte 0
        je short .2
.1:
        call sub_276B5
.2:
        cmp byte [byte_1175A9], 0
        je short .3
        xor eax, eax
        call sub_248B0
        mov eax, 1
        call sub_248B0
.3:
        mov eax, dword [dword_15E900]
        or byte [byte eax+010h], 2
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jg short .4
        call sub_28668
.4:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7B0]
        jl short .5
        call sub_27F20
.5:
        mov eax, dword [dword_15E884]
        cmp eax, dword [dword_15E7A4]
        jg near .9
        cmp dword [dword_15E87C], byte 0
        jg short .6
        mov edx, dword_15E830
        mov eax, dword [dword_15E828]
        call sub_240F4
.6:
        mov edx, dword_15E854
        mov eax, dword [dword_15E864]
        call sub_240F4
        cmp dword [dword_15E87C], byte 0
        jle short .7
        mov edx, dword_15E830
        mov eax, dword [dword_15E828]
        call sub_240F4
.7:
        cmp dword [dword_15E488], byte 0
        je short .8
        cmp dword [dword_15E490], byte 0
        jne short .8
        call sub_2414A
.8:
        mov ecx, 1B8h
        mov ebx, 168h
        mov edx, 0AAh
        mov eax, 0FFFFFF56h
        call sub_27C5E
.9:
        mov eax, dword [dword_15E884]
        cmp eax, dword [dword_15E7B4]
        jl near .13
        cmp dword [dword_15E87C], byte 0
        jg short .10
        mov edx, dword_15E858
        mov eax, dword [dword_15E864]
        call sub_240F4
.10:
        mov edx, dword_15E834
        mov eax, dword [dword_15E828]
        call sub_240F4
        cmp dword [dword_15E87C], byte 0
        jle short .11
        mov edx, dword_15E858
        mov eax, dword [dword_15E864]
        call sub_240F4
.11:
        cmp dword [dword_15E488], byte 0
        je short .12
        cmp dword [dword_15E490], byte 0
        je short .12
        call sub_2414A
.12:
        mov ecx, 0FFFFFE98h
        mov ebx, 0FFFFFE48h
        mov edx, 0AAh
        mov eax, 0FFFFFF56h
        call sub_27C5E
.13:
        cmp byte [byte_1175A7], 0
        je short .14
        push unk_15DF20
        call sub_DD8B0
        add esp, byte 4
        mov eax, 1
        call sub_24C7C
.14:
        call sub_24AA4
        mov eax, 1
        call sub_2458D
        call sub_249E8
        mov eax, 1
        call sub_243ED
        cmp byte [byte_1175A7], 0
        je short .15
        mov eax, 1
        call sub_24D32
.15:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_28C50                                                       28C50  96 PC
;-----------------------------------------------------------------------------
sub_28C50:
        push ebx
        push ecx
        push edx
        call sub_24D8C
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jle short .1
        call sub_28668
.1:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7B0]
        jge short .2
        call sub_27F20
.2:
        mov eax, dword [dword_15E884]
        cmp eax, dword [dword_15E7A4]
        jle near .6
        cmp dword [dword_15E488], byte 0
        je short .3
        cmp dword [dword_15E490], byte 0
        jne short .3
        call sub_2414A
.3:
        cmp dword [dword_15E87C], byte 0
        jg short .4
        mov edx, dword_15E830
        mov eax, dword [dword_15E828]
        call sub_240F4
.4:
        mov edx, dword_15E854
        mov eax, dword [dword_15E864]
        call sub_240F4
        cmp dword [dword_15E87C], byte 0
        jle short .5
        mov edx, dword_15E830
        mov eax, dword [dword_15E828]
        call sub_240F4
.5:
        mov ecx, 1B8h
        mov ebx, 168h
        mov edx, 0AAh
        mov eax, 0FFFFFF56h
        call sub_27C5E
.6:
        mov eax, dword [dword_15E884]
        cmp eax, dword [dword_15E7B4]
        jge near .10
        cmp dword [dword_15E488], byte 0
        je short .7
        cmp dword [dword_15E490], byte 0
        je short .7
        call sub_2414A
.7:
        cmp dword [dword_15E87C], byte 0
        jg short .8
        mov edx, dword_15E858
        mov eax, dword [dword_15E864]
        call sub_240F4
.8:
        mov edx, dword_15E834
        mov eax, dword [dword_15E828]
        call sub_240F4
        cmp dword [dword_15E87C], byte 0
        jle short .9
        mov edx, dword_15E858
        mov eax, dword [dword_15E864]
        call sub_240F4
.9:
        mov ecx, 0FFFFFE98h
        mov ebx, 0FFFFFE48h
        mov edx, 0AAh
        mov eax, 0FFFFFF56h
        call sub_27C5E
.10:
        cmp byte [byte_1175AC], 0
        je short .11
        push dword [dword_15E8C4]
        call sub_BC0C4
        add esp, byte 4
.11:
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_28D97                                                       28D97  96 PC
;-----------------------------------------------------------------------------
sub_28D97:
        push ebx
        push ecx
        push edx
        enter 108h, 0
        movsx eax, byte [byte_1175A9]
        mov byte [byte_1175A9], 1
        mov dword [byte ebp-08h], eax
        movsx eax, byte [byte_1175AA]
        mov byte [byte_1175AA], 1
        mov dword [byte ebp-04h], eax
        call sub_241F6
        mov eax, dword [dword_15E900]
        and byte [byte eax+010h], 0FDh
        xor eax, eax
        call sub_248B0
        call sub_278B9
        mov eax, 1
        call sub_248B0
        mov eax, dword [dword_15E900]
        or byte [byte eax+010h], 2
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jg near .11
        push dword [dword_15E728]
        push dword [dword_15E74C]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E87C]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E770]
        jge short .1
        push dword [dword_15E758]
        push dword [dword_15E718]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.1:
        cmp dword [dword_15E884], byte 0
        jg near .5
        push dword [dword_15E710]
        push dword [dword_15E760]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        mov eax, 1
        call sub_2849A
        push dword [dword_15E720]
        push dword [dword_15E76C]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E754]
        jge short .2
        push dword [dword_15E724]
        push dword [dword_15E768]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.2:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jl short .3
        xor eax, eax
        call sub_2849A
.3:
        push dword [dword_15E714]
        push dword [dword_15E75C]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E754]
        jl short .4
        push dword [dword_15E724]
        push dword [dword_15E768]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.4:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jge near .10
        xor eax, eax
        jmp near .9
.5:
        jle near .10
        push dword [dword_15E714]
        push dword [dword_15E75C]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        xor eax, eax
        call sub_2849A
        push dword [dword_15E724]
        push dword [dword_15E768]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E750]
        jle short .6
        push dword [dword_15E720]
        push dword [dword_15E76C]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.6:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jl short .7
        mov eax, 1
        call sub_2849A
.7:
        push dword [dword_15E710]
        push dword [dword_15E760]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E750]
        jg short .8
        push dword [dword_15E720]
        push dword [dword_15E76C]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.8:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jge short .10
        mov eax, 1
.9:
        call sub_2849A
.10:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E770]
        jl short .11
        push dword [dword_15E758]
        push dword [dword_15E718]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.11:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7B0]
        jl near .19
        lea eax, [dword ebp-0108h]
        push eax
        call sub_DD8C8
        add esp, byte 4
        push unk_15DF20
        call sub_DD8B0
        add esp, byte 4
        push dword [dword_15E748]
        push dword [dword_15E7D0]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E87C]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E794]
        jle short .12
        push dword [dword_15E73C]
        push dword [dword_15E788]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.12:
        cmp dword [dword_15E884], byte 0
        jg short .14
        push dword [dword_15E764]
        push dword [dword_15E7C4]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E71C]
        push dword [dword_15E7BC]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E7A0]
        jge short .13
        push unk_15E020
        call sub_DD8B0
        add esp, byte 4
.13:
        push dword [dword_15E7C8]
        push dword [dword_15E7C0]
        jmp short .16
.14:
        jle short .17
        push dword [dword_15E7C8]
        push dword [dword_15E7C0]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E71C]
        push dword [dword_15E7BC]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E79C]
        jle short .15
        push unk_15E020
        call sub_DD8B0
        add esp, byte 4
.15:
        push dword [dword_15E764]
        push dword [dword_15E7C4]
.16:
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.17:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E794]
        jg short .18
        push unk_15E020
        call sub_DD8B0
        add esp, byte 4
        push dword [dword_15E73C]
        push dword [dword_15E788]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.18:
        lea eax, [dword ebp-0108h]
        push eax
        call sub_DD8B0
        add esp, byte 4
.19:
        mov eax, dword [dword_15E884]
        cmp eax, dword [dword_15E7A4]
        jg short .21
        cmp dword [dword_15E87C], byte 0
        jg short .20
        mov edx, dword_15E830
        mov eax, dword [dword_15E828]
        call sub_240F4
.20:
        mov edx, dword_15E854
        mov eax, dword [dword_15E864]
        call sub_240F4
        cmp dword [dword_15E87C], byte 0
        jle short .21
        mov edx, dword_15E830
        mov eax, dword [dword_15E828]
        call sub_240F4
.21:
        mov eax, dword [dword_15E884]
        cmp eax, dword [dword_15E7B4]
        jl short .23
        cmp dword [dword_15E87C], byte 0
        jg short .22
        mov edx, dword_15E858
        mov eax, dword [dword_15E864]
        call sub_240F4
.22:
        mov edx, dword_15E834
        mov eax, dword [dword_15E828]
        call sub_240F4
        cmp dword [dword_15E87C], byte 0
        jle short .23
        mov edx, dword_15E858
        mov eax, dword [dword_15E864]
        call sub_240F4
.23:
        push unk_15DF20
        call sub_DD8B0
        add esp, byte 4
        mov eax, 1
        call sub_24C7C
        call sub_24AA4
        mov eax, 1
        call sub_2458D
        call sub_249E8
        mov eax, 1
        call sub_243ED
        cmp byte [byte_1175A7], 0
        je short .24
        mov eax, 1
        call sub_24D32
.24:
        push dword [dword_15E8C4]
        call sub_BC0C4
        mov al, byte [byte ebp-08h]
        mov byte [byte_1175A9], al
        mov al, byte [byte ebp-04h]
        add esp, byte 4
        mov byte [byte_1175AA], al
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_2929F                                                       2929F  96 PC
;-----------------------------------------------------------------------------
sub_2929F:
        push ebx
        push ecx
        push edx
        enter 100h, 0
        call sub_25226
        cmp dword [dword_1176E5], byte 0
        je short .1
        push dword [dword_15E81C]
        call sub_BBC80
        add esp, byte 4
        push dword [dword_15E81C]
        call sub_BBC14
        add esp, byte 4
        push dword [dword_15E81C]
        call sub_BBE50
        add esp, byte 4
        push dword [dword_15E81C]
        call sub_BC0C4
        add esp, byte 4
.1:
        call sub_24D8C
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jle near .12
        push dword [dword_15E728]
        push dword [dword_15E74C]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E87C]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E770]
        jge short .2
        push dword [dword_15E758]
        push dword [dword_15E718]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.2:
        cmp dword [dword_15E884], byte 0
        jg near .6
        push dword [dword_15E710]
        push dword [dword_15E760]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        mov eax, 1
        call sub_2849A
        push dword [dword_15E720]
        push dword [dword_15E76C]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E754]
        jge short .3
        push dword [dword_15E724]
        push dword [dword_15E768]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.3:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jl short .4
        xor eax, eax
        call sub_2849A
.4:
        push dword [dword_15E714]
        push dword [dword_15E75C]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E754]
        jl short .5
        push dword [dword_15E724]
        push dword [dword_15E768]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.5:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jge near .11
        xor eax, eax
        jmp near .10
.6:
        jle near .11
        push dword [dword_15E714]
        push dword [dword_15E75C]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        xor eax, eax
        call sub_2849A
        push dword [dword_15E724]
        push dword [dword_15E768]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E750]
        jle short .7
        push dword [dword_15E720]
        push dword [dword_15E76C]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.7:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jl short .8
        mov eax, 1
        call sub_2849A
.8:
        push dword [dword_15E710]
        push dword [dword_15E760]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E750]
        jg short .9
        push dword [dword_15E720]
        push dword [dword_15E76C]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.9:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7A8]
        jge short .11
        mov eax, 1
.10:
        call sub_2849A
.11:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E770]
        jl short .12
        push dword [dword_15E758]
        push dword [dword_15E718]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.12:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E7B0]
        jge near .20
        lea eax, [dword ebp-0100h]
        push eax
        call sub_DD8C8
        add esp, byte 4
        push unk_15DF20
        call sub_DD8B0
        add esp, byte 4
        push dword [dword_15E748]
        push dword [dword_15E7D0]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E87C]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E794]
        jle short .13
        push dword [dword_15E73C]
        push dword [dword_15E788]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.13:
        cmp dword [dword_15E884], byte 0
        jg short .15
        push dword [dword_15E764]
        push dword [dword_15E7C4]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E71C]
        push dword [dword_15E7BC]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E7A0]
        jge short .14
        push unk_15E020
        call sub_DD8B0
        add esp, byte 4
.14:
        push dword [dword_15E7C8]
        push dword [dword_15E7C0]
        jmp short .17
.15:
        jle short .18
        push dword [dword_15E7C8]
        push dword [dword_15E7C0]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
        push dword [dword_15E71C]
        push dword [dword_15E7BC]
        push dword [dword_15E8E4]
        call sub_BC040
        mov eax, dword [dword_15E884]
        add esp, byte 0Ch
        cmp eax, dword [dword_15E79C]
        jle short .16
        push unk_15E020
        call sub_DD8B0
        add esp, byte 4
.16:
        push dword [dword_15E764]
        push dword [dword_15E7C4]
.17:
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.18:
        mov eax, dword [dword_15E87C]
        cmp eax, dword [dword_15E794]
        jg short .19
        push unk_15E020
        call sub_DD8B0
        add esp, byte 4
        push dword [dword_15E73C]
        push dword [dword_15E788]
        push dword [dword_15E8E4]
        call sub_BC040
        add esp, byte 0Ch
.19:
        lea eax, [dword ebp-0100h]
        push eax
        call sub_DD8B0
        add esp, byte 4
.20:
        mov eax, dword [dword_15E884]
        cmp eax, dword [dword_15E7A4]
        jle short .23
        cmp dword [dword_15E488], byte 0
        je short .21
        cmp dword [dword_15E490], byte 0
        jne short .21
        call sub_2414A
.21:
        cmp dword [dword_15E87C], byte 0
        jg short .22
        mov edx, dword_15E830
        mov eax, dword [dword_15E828]
        call sub_240F4
.22:
        mov edx, dword_15E854
        mov eax, dword [dword_15E864]
        call sub_240F4
        cmp dword [dword_15E87C], byte 0
        jle short .23
        mov edx, dword_15E830
        mov eax, dword [dword_15E828]
        call sub_240F4
.23:
        mov eax, dword [dword_15E884]
        cmp eax, dword [dword_15E7B4]
        jge short .26
        cmp dword [dword_15E488], byte 0
        je short .24
        cmp dword [dword_15E490], byte 0
        je short .24
        call sub_2414A
.24:
        cmp dword [dword_15E87C], byte 0
        jg short .25
        mov edx, dword_15E858
        mov eax, dword [dword_15E864]
        call sub_240F4
.25:
        mov edx, dword_15E834
        mov eax, dword [dword_15E828]
        call sub_240F4
        cmp dword [dword_15E87C], byte 0
        jle short .26
        mov edx, dword_15E858
        mov eax, dword [dword_15E864]
        call sub_240F4
.26:
        leave
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_2976B                                                       2976B  96 PC
;-----------------------------------------------------------------------------
sub_2976B:
        movsx eax, word [dword_1228D8]
        shl eax, 10h
        mov dword [dword_17DC28], eax
        movsx eax, word [dword_1228E0]
        shl eax, 10h
        mov dword [dword_17DC18], eax
        movsx eax, word [dword_1228DC]
        shl eax, 10h
        mov dword [dword_17DC24], eax
        movsx eax, word [dword_1228E4]
        shl eax, 10h
        mov dword [dword_17DC1C], eax
        ret
;-----------------------------------------------------------------------------
; sub_297A8                                                       297A8  96 PC
;-----------------------------------------------------------------------------
sub_297A8:
        push ebx
        push ecx
        push edx
        push unk_15E904
        push eax
        push dword 0E666h
        call sub_AD620
        mov byte [byte_15EA03], 0FFh
        add esp, byte 0Ch
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_297C9                                                       297C9  96 PC
;-----------------------------------------------------------------------------
sub_297C9:
        push ebx
        push ecx
        push edx
        push unk_1176EC
        call sub_DD908
        add esp, byte 4
        push unk_15E904
        call sub_DD8B0
        add esp, byte 4
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_297EA                                                       297EA  96 PC
;-----------------------------------------------------------------------------
sub_297EA:
        push esi
        push edi
        enter 81Ch, 0
        mov esi, eax
        mov dword [byte ebp-04h], edx
        mov edi, ebx
        mov dword [byte ebp-018h], ecx
        movsx edx, word [byte eax+06h]
        movsx eax, word [byte eax+0Ah]
        sub edx, eax
        mov eax, edx
        mov edx, dword [byte ebp+010h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        mov ebx, eax
        imul eax, dword [byte ebp+014h]
        movsx edx, word [byte esi+08h]
        imul ecx, edx
        mov edx, dword [byte ebp-04h]
        shl edx, 10h
        sub edx, ecx
        mov dword [byte ebp-08h], 0
        sub edx, eax
        mov dword [byte ebp-04h], edx
        cmp edi, dword [dword_1228DC]
        jge short .1
        mov eax, dword [dword_1228DC]
        mov dword [byte ebp-010h], eax
        jmp short .2
.1:
        mov dword [byte ebp-010h], edi
.2:
        mov eax, dword [byte ebp-04h]
        sar eax, 10h
        sub edi, ebx
        cmp eax, dword [dword_1228E0]
        jge near .14
        cmp edi, dword [dword_1228E4]
        jge near .14
        movsx eax, word [byte esi+06h]
        shl eax, 10h
        dec eax
        push dword [byte ebp+010h]
        mov dword [byte ebp-0Ch], eax
        call sub_BE926
        mov ecx, eax
        add esp, byte 4
        mov dword [byte ebp-01Ch], eax
        cmp edi, dword [byte ebp-010h]
        jge short .3
        mov ebx, dword [byte ebp-010h]
        sub ebx, edi
        mov edx, ebx
        imul ebx, ecx
        mov eax, dword [byte ebp+014h]
        mov edi, dword [byte ebp-010h]
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        add dword [byte ebp-04h], eax
        sub dword [byte ebp-0Ch], ebx
.3:
        push dword [byte ebp-018h]
        call sub_BE926
        add esp, byte 4
        mov ecx, eax
        mov eax, dword [byte ebp-08h]
        xor edx, edx
        shl eax, 2
        jmp short .5
.4:
        inc dword [byte ebp-08h]
        mov ebx, edx
        add eax, byte 4
        sar ebx, 10h
        add edx, ecx
        mov dword [dword eax+ebp-0820h], ebx
.5:
        movsx ebx, word [byte esi+04h]
        shl ebx, 10h
        cmp edx, ebx
        jge short .6
        cmp eax, 800h
        jl short .4
.6:
        lea eax, [dword ebp-081Ch]
        push eax
        lea eax, [byte esi+010h]
        push eax
        call sub_DD960
        mov eax, edi
        shl eax, 2
        add esp, byte 8
        mov dword [byte ebp-014h], eax
        jmp near .13
.7:
        mov eax, dword [byte ebp-04h]
        mov edx, dword [byte ebp-08h]
        xor ebx, ebx
        sar eax, 10h
        cmp edi, dword [dword_1228E4]
        jge near .14
        cmp eax, dword [dword_1228E0]
        jl short .8
        cmp dword [byte ebp+014h], byte 0
        jg near .14
        jmp near .12
.8:
        lea ecx, [edx+eax]
        cmp ecx, dword [dword_1228E0]
        jl short .9
        mov edx, ecx
        mov ecx, dword [byte ebp-08h]
        sub edx, dword [dword_1228E0]
        sub ecx, edx
        mov edx, ecx
.9:
        cmp eax, dword [dword_1228D8]
        jge short .11
        lea ebx, [eax+edx]
        cmp ebx, dword [dword_1228D8]
        jge short .10
        cmp dword [byte ebp+014h], byte 0
        jl short .14
        jmp short .12
.10:
        mov ebx, dword [dword_1228D8]
        sub ebx, eax
        mov eax, dword [dword_1228D8]
        sub edx, ebx
.11:
        test edx, edx
        jle short .12
        mov ecx, dword [byte ebp-0Ch]
        push edx
        sar ecx, 10h
        movsx edx, word [byte esi+04h]
        imul ecx, edx
        mov edx, dword [dword_1228F8]
        add ecx, dword [dword ebp+ebx*4-081Ch]
        add edx, dword [byte ebp-014h]
        push ecx
        add eax, dword [edx]
        push eax
        call sub_DDB68
        add esp, byte 0Ch
.12:
        mov eax, dword [byte ebp-01Ch]
        add dword [byte ebp-014h], byte 4
        sub dword [byte ebp-0Ch], eax
        mov eax, dword [byte ebp+014h]
        inc edi
        add dword [byte ebp-04h], eax
.13:
        cmp dword [byte ebp-0Ch], byte 0
        jge near .7
.14:
        leave
        pop edi
        pop esi
        ret 8
;-----------------------------------------------------------------------------
; sub_299CF                                                       299CF  96 PC
;-----------------------------------------------------------------------------
sub_299CF:
        push esi
        mov esi, edx
        mov edx, ebx
        mov ebx, ecx
        mov ecx, eax
        push dword 7333h
        sar ecx, 2
        push ecx
        mov ecx, eax
        mov eax, esi
        call sub_297EA
        pop esi
        ret
jpt_299EC:
        dd sub_29A14_27
        dd sub_29A14_3F
        dd sub_29A14_5A
        dd sub_29A14_75
        dd sub_29A14_90
        dd sub_29A14_AB
        dd sub_29A14_C3
        dd sub_29A14_DB
        dd sub_29A14_F3
        dd sub_29A14_10B
;-----------------------------------------------------------------------------
; sub_29A14                                                       29A14  96 PC
;-----------------------------------------------------------------------------
sub_29A14:
        push ebx
        push ecx
        push edx
        enter 8, 0
        mov edx, eax
        cmp dword [byte eax+04h], byte 0
        setne al
        mov edx, dword [edx]
        movzx ax, al
        cmp edx, byte 9
        ja near sub_29A14_10B.2
        jmp dword [nosplit cs:edx*4+jpt_299EC]
sub_29A14_27:
        cwde
        push eax
        mov eax, dword [dword_15EA08]
        mov eax, dword [byte eax+01h]
        and eax, byte 1
        push eax
        push str_B0DD
        jmp near sub_29A14_10B.1
sub_29A14_3F:
        cwde
        push eax
        mov eax, dword [dword_15EA08]
        mov eax, dword [byte eax+01h]
        shl eax, 1Eh
        shr eax, 1Fh
        push eax
        push str_B1DD
        jmp near sub_29A14_10B.1
sub_29A14_5A:
        cwde
        push eax
        mov eax, dword [dword_15EA08]
        mov eax, dword [byte eax+01h]
        shl eax, 1Dh
        shr eax, 1Fh
        push eax
        push str_B2DD
        jmp near sub_29A14_10B.1
sub_29A14_75:
        cwde
        push eax
        mov eax, dword [dword_15EA08]
        mov eax, dword [byte eax+01h]
        shl eax, 1Ch
        shr eax, 1Fh
        push eax
        push str_B3DD
        jmp near sub_29A14_10B.1
sub_29A14_90:
        cwde
        push eax
        mov eax, dword [dword_15EA08]
        mov eax, dword [byte eax+01h]
        shl eax, 1Ah
        shr eax, 1Eh
        push eax
        push str_B4DD
        jmp near sub_29A14_10B.1
sub_29A14_AB:
        cwde
        push eax
        mov eax, dword [dword_15EA08]
        mov eax, dword [byte eax+01h]
        shl eax, 19h
        shr eax, 1Fh
        push eax
        push str_B5DD
        jmp short sub_29A14_10B.1
sub_29A14_C3:
        cwde
        push eax
        mov eax, dword [dword_15EA08]
        mov eax, dword [byte eax+01h]
        shl eax, 18h
        shr eax, 1Fh
        push eax
        push str_B6DD
        jmp short sub_29A14_10B.1
sub_29A14_DB:
        cwde
        push eax
        mov eax, dword [dword_15EA08]
        mov eax, dword [byte eax+01h]
        shl eax, 17h
        shr eax, 1Fh
        push eax
        push str_B7DD
        jmp short sub_29A14_10B.1
sub_29A14_F3:
        cwde
        push eax
        mov eax, dword [dword_15EA08]
        mov eax, dword [byte eax+01h]
        shl eax, 15h
        shr eax, 1Eh
        push eax
        push str_B8DD
        jmp short sub_29A14_10B.1
sub_29A14_10B:
        cwde
        push eax
        mov eax, dword [dword_15EA08]
        mov eax, dword [byte eax+01h]
        shl eax, 14h
        shr eax, 1Fh
        push eax
        push str_B9DD
.1:
        lea eax, [byte ebp-08h]
        push eax
        call sprintf_
        add esp, byte 10h
.2:
        lea eax, [byte ebp-08h]
        push eax
        push dword [dword_15EA04]
        call sub_E04E0
        movsx edx, word [byte eax+0Eh]
        add esp, byte 8
        sub edx, dword [dword_1177F0]
        push edx
        movsx edx, word [byte eax+0Ch]
        sub edx, dword [dword_1177EC]
        push edx
        push eax
        call sub_AAA40
        add esp, byte 0Ch
        leave
        pop edx
        pop ecx
        pop ebx
        ret
jpt_29B77:
        dd sub_29B9F_64F
        dd sub_29B9F_66F
        dd sub_29B9F_68C
        dd sub_29B9F_6AA
        dd sub_29B9F_6C8
        dd sub_29B9F_6FD
        dd sub_29B9F_71E
        dd sub_29B9F_73F
        dd sub_29B9F_761
        dd sub_29B9F_799
;-----------------------------------------------------------------------------
; sub_29B9F                                                       29B9F  96 PC
;-----------------------------------------------------------------------------
sub_29B9F:
        push ebx
        push ecx
        push edx
        push esi
        push edi
        enter 7F4h, 0
        push eax
        sub ebp, 82h
        push byte 0
        push dword 0B9h
        push str_TEMP2
        call sub_AB758
        mov ecx, 0B9h
        mov esi, dword [gameopts]
        add esp, byte 0Ch
        mov edi, eax
        mov dword [dword_15EA08], eax
        rep movsb
        mov eax, 2
        xor edx, edx
        call sub_69A94
        call sub_68AB1
        mov eax, 51h
        call LoadPackedFile
        push str_Bkgd26
        push eax
        mov dword [byte ebp+076h], 0FFFFFFFFh
        mov dword [dword_15EA04], eax
        call sub_E04E0
        add esp, byte 8
        mov dword [byte ebp+066h], eax
        cmp dword [dword ebp-0776h], byte 0
        je short .1
        push str_Rsd1
        jmp short .2
.1:
        push str_Rsd0
.2:
        push dword [dword_15EA04]
        call sub_E04E0
        add esp, byte 8
        mov dword [byte ebp+062h], eax
        mov eax, dword [byte ebp+066h]
        push byte 0
        movsx eax, word [byte eax+06h]
        mov edx, dword [byte ebp+066h]
        push eax
        mov eax, dword [byte ebp+062h]
        movsx edx, word [byte edx+04h]
        movsx eax, word [byte eax+04h]
        add eax, edx
        push eax
        call sub_AD35C
        mov edx, dword [byte ebp+066h]
        mov dword [byte ebp+06Ah], eax
        mov dword [byte ebp+06Eh], eax
        mov eax, dword [byte eax+02Ch]
        mov dx, word [byte edx+0Ch]
        mov word [byte eax+0Ch], dx
        mov eax, dword [byte ebp+06Ah]
        mov edx, dword [byte ebp+066h]
        mov eax, dword [byte eax+02Ch]
        mov dx, word [byte edx+0Eh]
        mov word [byte eax+0Eh], dx
        mov eax, dword [byte ebp+06Ah]
        mov eax, dword [byte eax+02Ch]
        movsx edx, word [byte eax+04h]
        movsx eax, word [byte eax+06h]
        imul eax, edx
        add esp, byte 0Ch
        push byte 0
        add eax, byte 10h
        push eax
        push str_Saveback
        mov esi, dword [byte ebp+06Ah]
        call sub_AB758
        add esp, byte 0Ch
        mov edi, eax
        mov esi, dword [byte esi+02Ch]
        mov dword [byte ebp+066h], eax
        push eax
        movsd
        movsd
        movsd
        movsd
        movsb
        call sub_AA988
        add esp, byte 4
        lea edx, [dword ebp-0772h]
        mov eax, 0Ch
        call sub_64721
        push dword [byte ebp+06Ah]
        call SetDrawBitmap
        add esp, byte 4
        push byte 0
        push byte 0
        push str_Bkgd26
        push dword [dword_15EA04]
        call sub_E04E0
        add esp, byte 8
        push eax
        call PutBlock
        mov eax, dword [byte ebp+06Ah]
        mov edx, dword [byte ebp+062h]
        add esp, byte 0Ch
        mov eax, dword [byte eax+02Ch]
        movsx edx, word [byte edx+0Ch]
        movsx eax, word [byte eax+0Ch]
        push byte 0
        sub edx, eax
        push edx
        push dword [byte ebp+062h]
        call PutBlock
        mov eax, dword [byte ebp+06Ah]
        mov eax, dword [byte eax+02Ch]
        movsx eax, word [byte eax+0Ch]
        mov dword [dword_1177EC], eax
        mov eax, dword [byte ebp+06Ah]
        mov eax, dword [byte eax+02Ch]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp+07Ah], 0
        mov dword [dword_1177F0], eax
        mov al, byte [byte ebp+07Ah]
        dec al
        lea edi, [dword ebp-0772h]
        mov byte [byte ebp+07Eh], al
        lea eax, [dword ebp-02AAh]
        add esp, byte 0Ch
        mov dword [byte ebp+072h], eax
.3:
        cmp dword [dword ebp-0776h], byte 0
        jne short .4
        cmp dword [byte ebp+07Ah], byte 9
        jne near .5
.4:
        imul esi, dword [byte ebp+07Ah], byte 66h
        push dword [byte ebp+07Ah]
        push str_WHD0
        lea eax, [byte ebp+056h]
        push eax
        call sprintf_
        add esp, byte 0Ch
        lea eax, [byte ebp+056h]
        push eax
        push dword [dword_15EA04]
        call sub_E04E0
        add esp, byte 8
        mov dword [dword esi+ebp-0758h], eax
        lea eax, [byte ebp+056h]
        push eax
        push dword [dword_15EA04]
        mov byte [byte ebp+059h], 31h
        call sub_E04E0
        add esp, byte 8
        mov dword [dword esi+ebp-0754h], eax
        lea eax, [byte ebp+056h]
        push eax
        push dword [dword_15EA04]
        mov byte [byte ebp+059h], 32h
        call sub_E04E0
        mov dword [dword esi+ebp-0762h], 4
        mov dword [dword esi+ebp-0750h], eax
        mov eax, dword [byte ebp+07Ah]
        mov edx, dword [dword esi+ebp-0758h]
        shl eax, 6
        movsx ebx, word [byte edx+0Ch]
        mov dword [dword eax+ebp-02AAh], ebx
        movsx ebx, word [byte edx+0Eh]
        mov dword [dword eax+ebp-02A6h], ebx
        movsx ebx, word [byte edx+0Ch]
        mov dword [byte ebp+06Ah], ebx
        movsx ebx, word [byte edx+04h]
        add ebx, dword [byte ebp+06Ah]
        mov dword [dword eax+ebp-02A2h], ebx
        mov ebx, dword [dword eax+ebp-02A6h]
        mov dword [dword eax+ebp-029Eh], ebx
        mov ebx, dword [dword eax+ebp-02A2h]
        mov dword [dword eax+ebp-029Ah], ebx
        movsx edx, word [byte edx+06h]
        add edx, dword [dword eax+ebp-02A6h]
        sub edx, byte 3
        mov dword [dword eax+ebp-0296h], edx
        mov edx, dword [dword eax+ebp-02AAh]
        mov dword [dword eax+ebp-0292h], edx
        mov edx, dword [dword eax+ebp-0296h]
        mov byte [dword esi+ebp-072Eh], 0Ah
        mov dword [dword eax+ebp-028Eh], edx
        mov edx, dword [byte ebp+072h]
        mov dword [dword esi+ebp-075Eh], edx
        mov edx, dword [dword eax+ebp-02AAh]
        mov dword [dword esi+ebp-074Ch], edx
        mov edx, dword [dword eax+ebp-02A6h]
        mov dword [dword esi+ebp-0748h], edx
        mov edx, dword [dword eax+ebp-0292h]
        mov eax, dword [dword eax+ebp-028Eh]
        mov dword [dword esi+ebp-073Ch], sub_29A14
        sub eax, byte 0Ah
        mov dword [dword esi+ebp-0734h], eax
        mov al, byte [byte ebp+07Eh]
        add edx, byte 0Ah
        mov byte [dword esi+ebp-0730h], al
        mov al, byte [byte ebp+07Ah]
        mov dword [dword esi+ebp-0738h], edx
        inc al
        mov byte [dword esi+ebp-072Fh], al
        mov al, byte [byte ebp+07Ah]
        mov byte [dword esi+ebp-072Dh], al
        mov eax, dword [dword esi+ebp-0748h]
        add esp, byte 8
        sub eax, dword [dword_1177F0]
        push eax
        mov eax, dword [dword esi+ebp-074Ch]
        sub eax, dword [dword_1177EC]
        push eax
        push dword [dword esi+ebp-0758h]
        call sub_AAA40
        add esp, byte 0Ch
.5:
        inc byte [byte ebp+07Eh]
        add dword [byte ebp+072h], byte 40h
        mov eax, edi
        inc dword [byte ebp+07Ah]
        call sub_29A14
        add edi, byte 66h
        cmp dword [byte ebp+07Ah], byte 0Ah
        jl near .3
        mov byte [dword ebp-0730h], 0
        cmp dword [dword ebp-0776h], byte 0
        jne short .6
        mov byte [dword ebp-039Ah], 9
.6:
        push str_Rlxn
        mov byte [dword ebp-0397h], 0Bh
        push dword [dword_15EA04]
        mov byte [dword ebp-0399h], 0Bh
        call sub_E04E0
        add esp, byte 8
        push str_Rlxh
        push dword [dword_15EA04]
        mov dword [dword ebp-035Ch], eax
        call sub_E04E0
        mov dword [dword ebp-0358h], eax
        mov eax, dword [dword ebp-035Ch]
        mov dword [dword ebp-0366h], 4
        movsx eax, word [byte eax+0Ch]
        mov dword [byte ebp-02Ah], eax
        mov eax, dword [dword ebp-035Ch]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp-026h], eax
        mov eax, dword [dword ebp-035Ch]
        mov edx, dword [byte ebp-02Ah]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [byte ebp-026h]
        mov dword [byte ebp-022h], edx
        mov dword [byte ebp-01Eh], eax
        mov eax, dword [dword ebp-035Ch]
        mov dword [byte ebp-01Ah], edx
        mov edx, dword [byte ebp-026h]
        movsx eax, word [byte eax+06h]
        add edx, eax
        mov eax, dword [byte ebp-02Ah]
        mov dword [byte ebp-012h], eax
        lea eax, [byte ebp-02Ah]
        mov dword [dword ebp-0362h], eax
        mov eax, dword [dword ebp-035Ch]
        mov dword [byte ebp-016h], edx
        mov dword [byte ebp-0Eh], edx
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-0350h], eax
        mov eax, dword [dword ebp-035Ch]
        add esp, byte 8
        movsx eax, word [byte eax+0Eh]
        push str_Rlyn
        mov dword [dword ebp-034Ch], eax
        mov eax, dword [byte ebp-022h]
        push dword [dword_15EA04]
        sub eax, byte 8
        mov byte [dword ebp-0334h], 9
        mov dword [dword ebp-033Ch], eax
        lea eax, [byte edx-08h]
        mov byte [dword ebp-0331h], 0Bh
        mov dword [dword ebp-0338h], eax
        call sub_E04E0
        add esp, byte 8
        push str_Rlyh
        push dword [dword_15EA04]
        mov dword [dword ebp-02F6h], eax
        call sub_E04E0
        mov dword [dword ebp-02F2h], eax
        mov eax, dword [dword ebp-02F6h]
        mov dword [dword ebp-0300h], 4
        movsx eax, word [byte eax+0Ch]
        mov dword [byte ebp+016h], eax
        mov eax, dword [dword ebp-02F6h]
        movsx eax, word [byte eax+0Eh]
        mov dword [byte ebp+01Ah], eax
        mov eax, dword [dword ebp-02F6h]
        mov edx, dword [byte ebp+016h]
        movsx eax, word [byte eax+04h]
        add edx, eax
        mov eax, dword [byte ebp+01Ah]
        mov dword [byte ebp+01Eh], edx
        mov dword [byte ebp+022h], eax
        mov eax, dword [dword ebp-02F6h]
        mov dword [byte ebp+026h], edx
        mov edx, dword [byte ebp+01Ah]
        movsx eax, word [byte eax+06h]
        add edx, eax
        mov eax, dword [byte ebp+016h]
        mov dword [byte ebp+02Eh], eax
        lea eax, [byte ebp+016h]
        mov dword [dword ebp-02FCh], eax
        mov eax, dword [dword ebp-02F6h]
        mov dword [byte ebp+02Ah], edx
        mov dword [byte ebp+032h], edx
        movsx eax, word [byte eax+0Ch]
        mov dword [dword ebp-02EAh], eax
        mov eax, dword [dword ebp-02F6h]
        movsx eax, word [byte eax+0Eh]
        mov dword [dword ebp-02E6h], eax
        mov eax, dword [byte ebp+01Eh]
        sub eax, byte 8
        add esp, byte 8
        mov dword [dword ebp-02D6h], eax
        lea eax, [byte edx-08h]
        mov byte [dword ebp-02CCh], 0Ah
        mov dword [dword ebp-02D2h], eax
        mov edx, eax
        mov eax, dword [dword ebp-02D6h]
        mov byte [dword ebp-02CEh], 9
        call sub_66373
        mov dword [byte ebp+05Eh], 0Bh
        call sub_DD6C4
        mov eax, dword [byte ebp+06Eh]
        push dword [byte eax+02Ch]
        call sub_AADA4
        add esp, byte 4
        push dword [byte ebp+06Eh]
        call sub_ADBEC
        mov dword [dword_1177EC], 0
        mov dword [dword_1177F0], 0
        add esp, byte 4
.7:
        call sub_69A9B
        cmp dword [byte ebp+05Eh], byte 0
        jl short .9
        cmp dword [byte ebp+05Eh], byte 0Ch
        jge short .9
        imul eax, dword [byte ebp+05Eh], byte 66h
        mov edx, dword [mousex]
        cmp edx, dword [dword eax+ebp-0738h]
        jne short .8
        mov edx, dword [mousey]
        cmp edx, dword [dword eax+ebp-0734h]
        je short .9
.8:
        mov dword [byte ebp+05Eh], 0FFFFFFFFh
.9:
        mov ax, word [word_114CE0]
        xor ah, ah
        and al, 1
        or al, 2
        cmp dword [dword ebp-0776h], byte 0
        je short .10
        cwde
        push eax
        mov ebx, 0FFFFFFFFh
        push byte 0Ah
        lea eax, [byte ebp+05Eh]
        lea edx, [dword ebp-0772h]
        push eax
        xor ecx, ecx
        mov eax, 0Ch
        jmp short .11
.10:
        cwde
        push eax
        mov ebx, 0FFFFFFFFh
        push byte 0Ah
        lea eax, [byte ebp+05Eh]
        lea edx, [dword ebp-03DCh]
        push eax
        xor ecx, ecx
        mov eax, 3
.11:
        call sub_64F59
        cmp dword [byte ebp+05Eh], byte 0
        jl near sub_29B9F_799.16
        cmp dword [byte ebp+05Eh], byte 9
        jg near sub_29B9F_799.16
        ja near sub_29B9F_799.19
        mov eax, dword [byte ebp+05Eh]
        jmp dword [nosplit cs:eax*4+jpt_29B77]
sub_29B9F_64F:
        mov edx, dword [dword_15EA08]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 1
        sete dl
        movzx edx, dl
        and byte [eax], 0FEh
        and edx, byte 1
.12:
        or dword [eax], edx
        jmp near sub_29B9F_799.19
sub_29B9F_66F:
        mov edx, dword [dword_15EA08]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 2
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [eax], 0FDh
        add edx, edx
        jmp short sub_29B9F_64F.12
sub_29B9F_68C:
        mov edx, dword [dword_15EA08]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 4
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [eax], 0FBh
        shl edx, 2
        jmp short sub_29B9F_64F.12
sub_29B9F_6AA:
        mov edx, dword [dword_15EA08]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 8
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [eax], 0F7h
        shl edx, 3
        jmp short sub_29B9F_64F.12
sub_29B9F_6C8:
        mov eax, dword [dword_15EA08]
        mov edx, dword [byte eax+01h]
        and edx, byte 30h
        cmp edx, byte 20h
        jne short .13
        and byte [byte eax+01h], 0CFh
        jmp near sub_29B9F_799.19
.13:
        mov edx, dword [byte eax+01h]
        shl edx, 1Ah
        shr edx, 1Eh
        inc edx
        and edx, byte 3
        and byte [byte eax+01h], 0CFh
        shl edx, 4
.14:
        or dword [byte eax+01h], edx
        jmp near sub_29B9F_799.19
sub_29B9F_6FD:
        mov edx, dword [dword_15EA08]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 40h
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [eax], 0BFh
        shl edx, 6
        jmp near sub_29B9F_64F.12
sub_29B9F_71E:
        mov edx, dword [dword_15EA08]
        lea eax, [byte edx+01h]
        test byte [byte edx+01h], 80h
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [eax], 7Fh
        shl edx, 7
        jmp near sub_29B9F_64F.12
sub_29B9F_73F:
        mov edx, dword [dword_15EA08]
        lea eax, [byte edx+01h]
        test byte [byte edx+02h], 1
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [byte eax+01h], 0FEh
        shl edx, 8
        jmp near sub_29B9F_64F.12
sub_29B9F_761:
        mov eax, dword [dword_15EA08]
        mov edx, dword [byte eax+01h]
        and edx, 600h
        cmp edx, 400h
        jne short .15
        and byte [byte eax+02h], 0F9h
        jmp near sub_29B9F_799.19
.15:
        mov edx, dword [byte eax+01h]
        shl edx, 15h
        shr edx, 1Eh
        inc edx
        and edx, byte 3
        and byte [byte eax+02h], 0F9h
        shl edx, 9
        jmp near sub_29B9F_6C8.14
sub_29B9F_799:
        mov edx, dword [dword_15EA08]
        lea eax, [byte edx+01h]
        test byte [byte edx+02h], 8
        sete dl
        movzx edx, dl
        and edx, byte 1
        and byte [byte eax+01h], 0F7h
        shl edx, 0Bh
        jmp near sub_29B9F_64F.12
.16:
        cmp dword [byte ebp+05Eh], byte 0Ah
        jb short .19
        jbe short .17
        cmp dword [byte ebp+05Eh], byte 0Bh
        je short .18
        jmp short .19
.17:
        mov dword [byte ebp+076h], 1
        jmp short .19
.18:
        mov ecx, 0B9h
        mov esi, dword [dword_15EA08]
        mov edi, dword [gameopts]
        mov dword [byte ebp+076h], 1
        rep movsb
.19:
        cmp dword [byte ebp+076h], byte 0
        jl near sub_29B9F.7
        push dword [byte ebp+066h]
        call sub_AADA4
        add esp, byte 4
        push dword [dword_15EA08]
        call sub_ABF4C
        add esp, byte 4
        push dword [byte ebp+066h]
        call sub_ABF4C
        add esp, byte 4
        push dword [dword_15EA04]
        call sub_ABF4C
        add esp, byte 4
        lea esp, [dword ebp+082h]
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
unk_2A3D6:
        db 00h,00h,02h,00h,00h,00h,03h,00h,00h,00h,04h,00h
unk_2A3E2:
        db 00h,00h,01h,00h,00h,080h,01h,00h,00h,00h,00h,00h
unk_2A3EE:
        db 00h,00h,01h,00h,00h,080h,01h,00h
unk_2A3F6:
        db 00h,00h,01h,00h,00h,040h,01h,00h,00h,080h,01h,00h
unk_2A402:
        db 095h,00h,00h,00h,0BDh,01h,00h,00h,01Ah,01h,00h,00h,0BDh,01h,00h,00h
        db 01Ah,01h,00h,00h,0D2h,01h,00h,00h,095h,00h,00h,00h,0D2h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_2A442:
        db 064h,01h,00h,00h,0BDh,01h,00h,00h,0E9h,01h,00h,00h,0BDh,01h,00h,00h
        db 0E9h,01h,00h,00h,0D2h,01h,00h,00h,064h,01h,00h,00h,0D2h,01h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
unk_2A482:
        db 033h,00h,00h,00h,037h,00h,00h,00h,045h,00h,00h,00h,037h,00h,00h,00h
        db 045h,00h,00h,00h,049h,00h,00h,00h,033h,00h,00h,00h,049h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 034h,02h,00h,00h,037h,00h,00h,00h,045h,02h,00h,00h,037h,00h,00h,00h
        db 045h,02h,00h,00h,049h,00h,00h,00h,034h,02h,00h,00h,049h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        db 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
;-----------------------------------------------------------------------------
; sub_2A502                                                       2A502  96 PC
;-----------------------------------------------------------------------------
sub_2A502:
        push ebx
        push edx
        imul edx, eax, byte 21h
        mov word [dword edx+word_160ACC], 0
        add edx, word_160ACC
        mov eax, 62h
        lea ebx, [byte edx+02h]
        call sub_77355
        mov edx, eax
        mov eax, ebx
        call strcpy_
        pop edx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_2A52F                                                       2A52F  96 PC
;-----------------------------------------------------------------------------
sub_2A52F:
        push ebx
        push ecx
        push edx
        mov ecx, word_160ACC
        xor ebx, ebx
        inc ecx
        inc ecx
.1:
        imul eax, ebx, byte 21h
        mov word [dword eax+word_160ACC], 0
        mov eax, 62h
        call sub_77355
        mov edx, eax
        mov eax, ecx
        inc ebx
        call strcpy_
        add ecx, byte 21h
        cmp ebx, byte 4
        jl short .1
        pop edx
        pop ecx
        pop ebx
        ret
.2:
        call GetPressedDevice
        test eax, eax
        jne short .3
        call sub_69A9B
        jmp short .2
.3:
        call sub_69A9B
        call GetPressedDevice
        test eax, eax
        jne short .3
        ret
        push ebx
        push ecx
        mov ebx, eax
        xor eax, eax
        imul edx, byte 21h
.4:
        movsx ecx, word [dword eax+word_160ACC]
        cmp ecx, ebx
        jne short .5
        cmp eax, edx
        je short .5
        mov eax, 1
        pop ecx
        pop ebx
        ret
.5:
        add eax, byte 21h
        cmp eax, 84h
        jl short .4
        xor eax, eax
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_2A5B5                                                       2A5B5  96 PC
;-----------------------------------------------------------------------------
sub_2A5B5:
        push ebx
        push ecx
        push edx
        push esi
        mov ebx, eax
        mov edx, ebx
        mov eax, dword [eax]
        lea esi, [byte ebx+06h]
        add eax, dword [byte ebx+04h]
.1:
        movsx ecx, word [byte edx+08h]
        add eax, ecx
        movsx ecx, word [byte edx+0Eh]
        add eax, ecx
        movsx ecx, word [byte edx+01Ah]
        add eax, ecx
        movsx ecx, word [byte edx+020h]
        add eax, ecx
        movsx ecx, word [byte edx+026h]
        add eax, ecx
        movsx ecx, word [byte edx+014h]
        inc edx
        inc edx
        add eax, ecx
        cmp edx, esi
        jne short .1
        movsx edx, word [byte ebx+02Ch]
        add eax, edx
        movsx edx, word [byte ebx+02Eh]
        add eax, edx
        mov edx, ebx
        lea ecx, [byte ebx+070h]
.2:
        add edx, byte 4
        add eax, dword [byte edx+02Ch]
        add eax, dword [dword edx+09Ch]
        cmp edx, ecx
        jne short .2
        mov edx, ebx
        lea ecx, [byte ebx+04h]
.3:
        movsx ebx, word [dword edx+0110h]
        add eax, ebx
        movsx ebx, word [dword edx+0114h]
        inc edx
        inc edx
        add eax, ebx
        cmp edx, ecx
        jne short .3
        mov edx, 3
        imul edx
        add eax, 8000h
        adc edx, byte 0
        shrd eax, edx, 10h
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
;-----------------------------------------------------------------------------
; sub_2A645                                                       2A645  96 PC
;-----------------------------------------------------------------------------
sub_2A645:
        push ebx
        push ecx
        push edx
        push edi
        enter 120h, 0
        lea edx, [byte ebp-04h]
        mov ecx, 1
        call FileCreate
        test eax, eax
        jne short .1
        mov ecx, 11Ch
        lea edi, [dword ebp-0120h]
        lea edx, [dword ebp-0120h]
        rep stosb
        xor ebx, ebx
        mov ecx, 11Ch
        mov eax, dword [byte ebp-04h]
        call FileWriteAt
        mov ecx, eax
        lea eax, [byte ebp-04h]
        call FileClose
.1:
        mov eax, ecx
        leave
        pop edi
        pop edx
        pop ecx
        pop ebx
        ret
