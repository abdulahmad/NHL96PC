; Input: GetTicks, TicksSince, TicksSinceLast, SetTickDeadline, WaitTickDeadline and 12 more.
bits 32
%include "hockey.inc"
section s_DFEB4 progbits alloc exec nowrite align=1
extern BiosKeyFunc, JoyAxisMask, JoyAxisX1, JoyAxisX2, JoyAxisY1, JoyAxisY2, JoyButtonBits, JoyButtons
extern JoyButtonsPrev, JoyButtonTable, JoyCalibrateTicks, JoyCalibrating, JoyDirection, joyenablemask, JoyPortMask, JoyRawX1
extern JoyRawX2, JoyRawY1, JoyRawY2, JoyReadTimeout, JoyTimeSecondX, JoyTimeSecondY, JoyTimeX, JoyTimeY
extern JoyX1Center, JoyX1Max, JoyX1Min, JoyX1Settle, JoyX1Threshold, JoyX2Max, JoyX2Min, JoyXScale
extern JoyY1Center, JoyY1Max, JoyY1MaxSeen, JoyY1Min, JoyY1MinSeen, JoyY1Settle, JoyY1Threshold, JoyYScale
extern KbdIdleHook, LastTickCount, Random32, tickcount, tickdeadline, TimerCalibration
global GetTicks, TicksSince, TicksSinceLast, SetTickDeadline, WaitTickDeadline, TickDeadlinePassed, WaitTicks, KbdGetKey
global CallKbdIdleHook, KbdPeekKey, SetKbdIdleHook, WaitKey, FlushKeys, CalibrateJoystick, ReadJoystickPorts, JoyResetCentres
global JoyButtonMap
;-----------------------------------------------------------------------------
; GetTicks                                     DFEB4  95 PC, medium confidence
; Returns the timer tick count
;-----------------------------------------------------------------------------
GetTicks:
        mov eax, dword [tickcount]
        ret
;-----------------------------------------------------------------------------
; TicksSince                                                      DFEBA  95 PC
; (start): ticks since the given tick count
;-----------------------------------------------------------------------------
TicksSince:
        mov ecx, dword [byte esp+04h]
        mov eax, dword [tickcount]
        LD sub, eax, ecx
        ret
;-----------------------------------------------------------------------------
; TicksSinceLast                                  DFEC6  96 PC, low confidence
; Returns the timer ticks since the last call; followed by the tick reset
;-----------------------------------------------------------------------------
TicksSinceLast:
        mov ebx, dword [LastTickCount]
        mov eax, dword [tickcount]
        mov dword [LastTickCount], eax
        LD sub, eax, ebx
        ret
        LD xor, eax, eax
        mov dword [tickcount], eax
        ret
;-----------------------------------------------------------------------------
; SetTickDeadline                                                 DFEE1  95 PC
; (ticks): sets the tick deadline that many ticks from now
;-----------------------------------------------------------------------------
SetTickDeadline:
        mov eax, dword [byte esp+04h]
        add eax, dword [tickcount]
        mov dword [tickdeadline], eax
        ret
;-----------------------------------------------------------------------------
; WaitTickDeadline                                                DFEF1  95 PC
; Waits until the tick deadline has passed
;-----------------------------------------------------------------------------
WaitTickDeadline:
        mov eax, dword [tickcount]
        sub eax, dword [tickdeadline]
        js short WaitTickDeadline
        ret
;-----------------------------------------------------------------------------
; TickDeadlinePassed                           DFEFF  95 PC, medium confidence
; Returns 1 when the tick deadline has passed, else 0
;-----------------------------------------------------------------------------
TickDeadlinePassed:
        mov ebx, dword [tickcount]
        sub ebx, dword [tickdeadline]
        LD sbb, eax, eax
        inc eax
        ret
;-----------------------------------------------------------------------------
; WaitTicks                                                       DFF0F  95 PC
; (ticks): waits that many ticks, running the idle handlers
;-----------------------------------------------------------------------------
WaitTicks:
        mov eax, dword [byte esp+04h]
        mov ebx, dword [tickcount]
        LD add, eax, ebx
.1:
        mov ebx, dword [tickcount]
        LD sub, ebx, eax
        js short .1
        ret
        db 00h,00h
;-----------------------------------------------------------------------------
; KbdGetKey                                       DFF28  96 PC, low confidence
; Reads a key from the keyboard, or 0 when none is waiting
;-----------------------------------------------------------------------------
KbdGetKey:
        mov ah, 1
        call dword [BiosKeyFunc]
        db 075h, .1-($+2)
        LD xor, ax, ax
        ret
.1:
        LD xor, ah, ah
        call dword [BiosKeyFunc]
        LD or, al, al
        je short .2
        LD xor, ah, ah
.2:
        ret
;-----------------------------------------------------------------------------
; CallKbdIdleHook                                 DFF45  96 PC, low confidence
; Calls the keyboard idle hook
;-----------------------------------------------------------------------------
CallKbdIdleHook:
        jmp dword [KbdIdleHook]
;-----------------------------------------------------------------------------
; KbdPeekKey                                      DFF4B  96 PC, low confidence
; Returns the next key without removing it, or 0
;-----------------------------------------------------------------------------
KbdPeekKey:
        mov ah, 1
        call dword [BiosKeyFunc]
        jne short .1
        LD xor, ax, ax
        ret
.1:
        LD or, al, al
        je short .2
        LD xor, ah, ah
.2:
        ret
;-----------------------------------------------------------------------------
; SetKbdIdleHook                                  DFF60  96 PC, low confidence
; Sets the keyboard idle hook; followed by the getter
;-----------------------------------------------------------------------------
SetKbdIdleHook:
        mov eax, dword [byte esp+04h]
        mov dword [KbdIdleHook], eax
        ret
        mov eax, dword [KbdIdleHook]
        ret
;-----------------------------------------------------------------------------
; WaitKey                                                         DFF70  95 PC
; Waits for a key, calling the keyboard idle hook until one arrives
;-----------------------------------------------------------------------------
WaitKey:
        call dword [KbdIdleHook]
        LD or, ax, ax
        je short WaitKey
        ret
;-----------------------------------------------------------------------------
; FlushKeys                                    DFF7C  96 PC, medium confidence
; Reads keys until the keyboard buffer is empty
;-----------------------------------------------------------------------------
FlushKeys:
        call KbdGetKey
        LD or, ax, ax
        jne short FlushKeys
        ret
.1:
        call dword [KbdIdleHook]
        LD or, ax, ax
        jne short .2
        call TickDeadlinePassed
        LD or, ax, ax
        je short .1
        LD xor, ax, ax
.2:
        ret
        push ebp
        LD mov, ebp, esp
        add esp, byte 0FFFFFFFCh
        call GetTicks
        add eax, dword [byte ebp+08h]
        mov dword [byte ebp-04h], eax
.3:
        LD xor, eax, eax
        call CallKbdIdleHook
        LD or, eax, eax
        jne short .4
        call GetTicks
        sub eax, dword [byte ebp-04h]
        js short .3
        LD xor, eax, eax
.4:
        leave
        ret
        push ebx
        push ecx
        push edx
        push esi
        push edi
        push ebp
        push ds
        push es
        mov ah, 2
        int 16h
        pop es
        pop ds
        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret
        db 00h
        push ebp
        push esi
        push edi
        LD xor, eax, eax
        mov ah, byte [JoyPortMask]
        mov ecx, 2710h
        mov edx, 201h
        LD xor, ebx, ebx
        LD mov, ebp, ebx
        LD mov, esi, ebx
        LD mov, edi, ebx
        cli
        out dx, al
        jmp short .6
.5:
        shr al, 1
        adc ebp, byte 0
        shr al, 1
        adc esi, byte 0
        shr al, 1
        adc edi, byte 0
        shr al, 1
        adc ebx, byte 0
.6:
        in al, dx
        test ah, al
        loopne .5
        sti
        jcxz .8
.7:
        shr al, 4
        mov byte [JoyButtonBits], al
        mov dword [JoyRawX1], ebp
        mov dword [JoyRawY1], esi
        mov dword [JoyRawX2], edi
        mov dword [JoyRawY2], ebx
        pop edi
        pop esi
        pop ebp
        ret
.8:
        LD mov, ah, al
        not ah
        and ah, 0Fh
        mov byte [JoyPortMask], ah
        jmp short .7
;-----------------------------------------------------------------------------
; CalibrateJoystick                               E0051  96 PC, low confidence
; Times the joystick port with the timer chip to calibrate its range
;-----------------------------------------------------------------------------
CalibrateJoystick:
        call Random32
        LD mov, bh, al
        LD xor, eax, eax
        mov ecx, 2710h
        mov edx, 201h
        pushf
        cli
        out dx, al
        LD xor, eax, eax
        out 43h, al
        in al, 40h
        LD mov, ah, al
        in al, 40h
        xchg al, ah
        mov dword [JoyTimeX], eax
        mov dword [JoyTimeY], eax
        mov dword [JoyTimeSecondX], eax
        mov dword [JoyTimeSecondY], eax
        mov dword [JoyCalibrateTicks], eax
        mov byte [JoyCalibrating], 0
        mov bl, byte [JoyPortMask]
.1:
        in al, dx
        LD mov, ah, al
        LD and, al, bl
        not al
        LD and, al, bl
        je short .6
        LD mov, edx, eax
        LD xor, eax, eax
        out 43h, al
        in al, 40h
        LD mov, ah, al
        in al, 40h
        xchg al, ah
        shr dl, 1
        jae short .2
        mov dword [JoyTimeY], eax
.2:
        shr dl, 1
        jae short .3
        mov dword [JoyTimeSecondX], eax
.3:
        shr dl, 1
        jae short .4
        mov dword [JoyTimeSecondY], eax
.4:
        shr dl, 1
        jae short .5
        mov dword [JoyCalibrateTicks], eax
.5:
        LD mov, eax, edx
        mov edx, 201h
.6:
        sub ecx, byte 1
        je short .12
        inc bh
        and bh, 3Fh
        je short .13
.7:
        LD and, bl, ah
        jne short .1
.8:
        popf
        shr ah, 4
        mov byte [JoyButtonBits], ah
        cmp byte [JoyCalibrating], 0
        jne near CalibrateJoystick
        mov ebx, 0Ch
.9:
        mov eax, dword [JoyTimeX]
        sub eax, dword [dword ebx+JoyTimeY]
        jge short .10
        add eax, dword [TimerCalibration]
        jl short .11
.10:
        mov dword [dword ebx+JoyRawX1], eax
.11:
        sub ebx, byte 4
        jge short .9
        LD xor, eax, eax
        mov al, byte [JoyButtonBits]
        mov ah, byte [JoyPortMask]
        ret
.12:
        LD mov, bl, ah
        not bl
        and bl, 0Fh
        mov byte [JoyPortMask], bl
        jmp short .8
.13:
        popf
        nop
        pushf
        cli
        in al, dx
        LD xor, al, ah
        LD and, al, bl
        or byte [JoyCalibrating], al
        jmp short .7
        db 00h
;-----------------------------------------------------------------------------
; ReadJoystickPorts                               E0158  96 PC, low confidence
; Reads the joystick buttons and axes by timing the port
;-----------------------------------------------------------------------------
ReadJoystickPorts:
        mov byte [JoyDirection], 0
        test byte [joyenablemask], 1
        je near .30
        mov dx, 201h
        in al, dx
        and al, 30h
        mov byte [JoyButtonsPrev], al
        mov bl, 3
        cli
        out dx, al
        mov al, 0
        out 43h, al
        LD xor, eax, eax
        in al, 40h
        LD mov, ah, al
        in al, 40h
        xchg al, ah
        mov dword [JoyAxisX1], eax
        add eax, byte 50h
        mov dword [JoyAxisY1], eax
        mov dword [JoyAxisX2], eax
        mov ecx, 14h
.1:
        dec ecx
        jne short .1
        sti
        LD xor, ecx, ecx
.2:
        in al, dx
        LD and, al, bl
        LD xor, al, bl
        jne short .3
        inc ecx
        cmp ecx, 0FA0h
        jl short .2
        jmp short .6
.3:
        LD mov, bh, al
        test bh, 1
        jne short .5
.4:
        test bh, 2
        je short .2
        mov al, 0
        out 43h, al
        LD xor, eax, eax
        in al, 40h
        LD mov, ah, al
        in al, 40h
        xchg al, ah
        mov dword [JoyAxisX2], eax
        and bl, 1
        jne short .2
        jmp short .6
.5:
        mov al, 0
        out 43h, al
        LD xor, eax, eax
        in al, 40h
        LD mov, ah, al
        in al, 40h
        xchg al, ah
        mov dword [JoyAxisY1], eax
        and bl, 2
        jne short .4
.6:
        mov eax, dword [JoyAxisX1]
        cmp eax, dword [JoyAxisY1]
        jl short .7
        sub eax, dword [JoyAxisY1]
        mov dword [JoyAxisY2], eax
        jmp short .8
.7:
        mov dword [JoyAxisY2], eax
        mov eax, dword [JoyReadTimeout]
        sub eax, dword [JoyAxisY1]
        add dword [JoyAxisY2], eax
.8:
        mov eax, dword [JoyAxisX1]
        cmp eax, dword [JoyAxisX2]
        jl short .9
        sub eax, dword [JoyAxisX2]
        mov dword [JoyAxisMask], eax
        jmp short .10
.9:
        mov dword [JoyAxisMask], eax
        mov eax, dword [JoyReadTimeout]
        sub eax, dword [JoyAxisX2]
        add dword [JoyAxisMask], eax
.10:
        mov eax, dword [JoyAxisY2]
        cmp eax, dword [JoyX1Threshold]
        jge short .14
        dec dword [JoyX1Settle]
        jle short .11
        cmp eax, dword [JoyX1Min]
        jl near .17
        mov dword [JoyX1Min], eax
        jmp near .17
.11:
        mov ebx, dword [JoyX1Min]
        mov dword [JoyX1Threshold], ebx
        mov ebx, dword [JoyX1Center]
.12:
        sub ebx, dword [JoyX1Threshold]
        jle short .13
        LD xor, edx, edx
        mov eax, 4000h
        div ebx
        mov dword [JoyXScale], eax
.13:
        LD mov, eax, ebx
        mov dx, 201h
        shr eax, 1
        LD mov, ebx, eax
        shr ebx, 1
        add eax, dword [JoyX1Threshold]
        LD add, eax, ebx
        mov dword [JoyY1Max], eax
        LD sub, eax, ebx
        LD sub, eax, ebx
        mov dword [JoyY1Min], eax
        mov eax, dword [JoyAxisY2]
        jmp short .16
.14:
        cmp eax, dword [JoyX1Center]
        jle short .16
        dec dword [JoyX1Settle]
        jle short .15
        cmp eax, dword [JoyX1Max]
        jge short .17
        mov dword [JoyX1Max], eax
        jmp short .17
.15:
        mov ebx, dword [JoyX1Max]
        mov dword [JoyX1Center], ebx
        jmp short .12
.16:
        mov dword [JoyX1Settle], 14h
        mov dword [JoyX1Max], 4E20h
        mov dword [JoyX1Min], 0
.17:
        cmp eax, dword [JoyY1Min]
        jl near .22
        cmp eax, dword [JoyY1Max]
        jl short .18
        or byte [JoyDirection], 4
.18:
        mov eax, dword [JoyAxisMask]
        cmp eax, dword [JoyY1Threshold]
        jae short .23
        dec dword [JoyY1Settle]
        jle short .19
        cmp eax, dword [JoyY1MinSeen]
        jl near .26
        mov dword [JoyY1MinSeen], eax
        jmp near .26
.19:
        mov ebx, dword [JoyY1MinSeen]
        mov dword [JoyY1Threshold], ebx
        mov ebx, dword [JoyY1Center]
.20:
        sub ebx, dword [JoyY1Threshold]
        jle short .21
        LD xor, edx, edx
        mov eax, 4000h
        div ebx
        mov dword [JoyYScale], eax
.21:
        LD mov, eax, ebx
        mov dx, 201h
        shr eax, 1
        LD mov, ebx, eax
        shr ebx, 1
        add eax, dword [JoyY1Threshold]
        LD add, eax, ebx
        mov dword [JoyX2Max], eax
        LD sub, eax, ebx
        LD sub, eax, ebx
        mov dword [JoyX2Min], eax
        mov eax, dword [JoyAxisMask]
        jmp short .25
.22:
        or byte [JoyDirection], 8
        jmp near .18
.23:
        cmp eax, dword [JoyY1Center]
        jle short .25
        dec dword [JoyY1Settle]
        je short .24
        cmp eax, dword [JoyY1MaxSeen]
        jge short .26
        mov dword [JoyY1MaxSeen], eax
        jmp short .26
.24:
        mov ebx, dword [JoyY1MaxSeen]
        mov dword [JoyY1Center], ebx
        jmp short .20
.25:
        mov dword [JoyY1Settle], 14h
        mov dword [JoyY1MaxSeen], 4E20h
        mov dword [JoyY1MinSeen], 0
.26:
        cmp eax, dword [JoyX2Min]
        jb short .31
        cmp eax, dword [JoyX2Max]
        jb short .27
        or byte [JoyDirection], 2
.27:
        in al, dx
        and al, 30h
        cmp al, byte [JoyButtonsPrev]
        je short .28
        mov al, byte [JoyButtons]
        jmp short .29
.28:
        xor al, 30h
        mov byte [JoyButtons], al
.29:
        or byte [JoyDirection], al
.30:
        mov al, byte [JoyDirection]
        LD xor, ah, ah
        movzx eax, ax
        ret
.31:
        or byte [JoyDirection], 1
        jmp short .27
;-----------------------------------------------------------------------------
; JoyResetCentres                                 E0456  96 PC, low confidence
; Resets the joystick centres and enables the first joystick
;-----------------------------------------------------------------------------
JoyResetCentres:
        mov byte [joyenablemask], 1
        mov dword [JoyX1Threshold], 50h
        mov dword [JoyX1Center], 0
        mov dword [JoyY1Threshold], 50h
        mov dword [JoyY1Center], 0
        ret
;-----------------------------------------------------------------------------
; JoyButtonMap                                    E0486  96 PC, low confidence
; Maps joystick button bits to pad buttons through a table
;-----------------------------------------------------------------------------
JoyButtonMap:
        push ebp
        LD mov, ebp, esp
        mov ebx, dword [byte ebp+08h]
        and ebx, byte 0Fh
        mov al, byte [dword ebx+JoyButtonTable]
        LD xor, ah, ah
        movzx eax, ax
        leave
        ret
        mov eax, dword [JoyAxisY2]
        sub eax, dword [JoyX1Threshold]
        jge short .1
        LD xor, eax, eax
.1:
        mul dword [JoyXScale]
        sub eax, byte 1Fh
        ret
        mov eax, dword [JoyAxisMask]
        sub eax, dword [JoyY1Threshold]
        jge short .2
        LD xor, eax, eax
.2:
        mul dword [JoyYScale]
        sub eax, byte 1Fh
        ret
