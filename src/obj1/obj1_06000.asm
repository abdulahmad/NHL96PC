; Object 1 page 06000: partly disassembled. The input-record timer and the per-slot button handler are source; the rest of the
; page is still bytes.
	incbin	"Extracted/segments/obj1_06000.bin", 0, 0xC4D

; Timer callback, runs every tick. When a game is running and the ring holds fewer than 5 records, every fourth tick it
; pushes one record (the four slots' button dwords and the ticks since the last record) onto the ring that the game loop
; reads. A recorded game plays back through PlaybackInputRecord instead. The phase counts 3..0; controllers are polled at
; phase 0.
InputRecordTimer:
	push	ebx
	push	ecx
	push	edx
	push	esi
	push	edi
	push	ebp
	mov	ebp, esp
	sub	esp, strict dword 4
	cmp	word [InputRecordBusy - obj4_base], 0
	jnz	near .9
	mov	word [InputRecordBusy - obj4_base], 1
	cmp	dword [InputRecordPhase - obj4_base], 0
	jnz	.1
	call	PollControllers
.1:
	mov	ax, [InputPlaybackFlags - obj4_base]
	and	eax, strict dword 1
	cwde
	test	eax, eax
	jz	.2
	mov	eax, [InputRecordPhase - obj4_base]
	call	PlaybackInputRecord
	jmp	near .6
.2:
	cmp	dword [GameLoopActive - obj4_base], 1
	jnz	near .6
	cmp	dword [InputRecordTicks - obj4_base], 0x3E8
	jge	.3
	inc	dword [InputRecordTicks - obj4_base]
.3:
	cmp	dword [InputRecordPhase - obj4_base], 0
	jnz	.4
	cmp	dword [InputRecordCount - obj4_base], 5
	jl	.5
.4:
	jmp	.6
.5:
	imul	edx, [InputRecordHead - obj4_base], 0x12
	mov	ebx, InputRecordRing - obj4_base
	add	ebx, edx
	mov	[ebp-4], ebx
	mov	edx, [InputRecordHead - obj4_base]
	inc	edx
	mov	ebx, 5
	mov	eax, edx
	sar	edx, 0x1F
	idiv	ebx
	mov	[InputRecordHead - obj4_base], edx
	inc	dword [InputRecordCount - obj4_base]
	mov	ebx, [SlotButtons0 - obj4_base]
	mov	edx, [ebp-4]
	mov	[edx], ebx
	mov	ebx, [SlotButtons1 - obj4_base]
	mov	edx, [ebp-4]
	mov	[edx+4], ebx
	mov	ebx, [SlotButtons2 - obj4_base]
	mov	edx, [ebp-4]
	mov	[edx+8], ebx
	mov	ebx, [SlotButtons3 - obj4_base]
	mov	edx, [ebp-4]
	mov	[edx+0xC], ebx
	mov	bx, word [InputRecordTicks - obj4_base]
	mov	edx, [ebp-4]
	mov	[edx+0x10], bx
	mov	dword [InputRecordTicks - obj4_base], 0
.6:
	cmp	dword [InputRecordPhase - obj4_base], 0
	jnz	.7
	mov	dword [InputRecordPhase - obj4_base], 3
	jmp	.8
.7:
	dec	dword [InputRecordPhase - obj4_base]
.8:
	mov	word [InputRecordBusy - obj4_base], 0
.9:
	mov	esp, ebp
	pop	ebp
	pop	edi
	pop	esi
	pop	edx
	pop	ecx
	pop	ebx
	ret

; Looks at each of the four slots' buttons for this frame and turns them into game requests: pause (bit 0) and replay (bit 1)
; open the in-game menus, line change buttons (bits 10-13 for the home team, 14-17 for the away team) set a line change
; request for that team and line, and the goalie pull buttons (bits 18 and 19) call PullGoalie once per team. In demo mode any
; button ends the demo.
HandleSlotButtons:
	push	ebx
	push	ecx
	push	edx
	push	esi
	push	edi
	xor	esi, esi
	xor	edi, edi
	xor	ecx, ecx
.1:
	mov	edx, [SlotButtons - obj4_base+ecx]
	cmp	dword [DemoMode - obj4_base], 0
	jz	.2
	test	edx, edx
	jz	.2
	mov	dword [InGameMenuRequest - obj4_base], 1
	mov	dword [dword_1150FC - obj4_base], 2
	jmp	near .19
.2:
	test	dl, 1
	jz	.3
	or	byte [PauseReplayPending - obj4_base], 1
	jmp	near .18
.3:
	test	dl, 2
	jz	.4
	or	byte [PauseReplayPending - obj4_base], 2
	jmp	near .18
.4:
	mov	ax, [PauseReplayPending - obj4_base]
	xor	ah, ah
	and	al, 1
	cwde
	test	eax, eax
	jz	.5
	mov	eax, 0x34
	and	byte [PauseReplayPending - obj4_base], 0xFE
	call	sub_68E31
	mov	dword [InGameMenuRequest - obj4_base], 1
	jmp	near .18
.5:
	mov	ax, [PauseReplayPending - obj4_base]
	xor	ah, ah
	and	al, 2
	cwde
	test	eax, eax
	jz	.6
	mov	eax, 0x34
	and	byte [PauseReplayPending - obj4_base], 0xFD
	call	sub_68E31
	mov	dword [InGameMenuRequest - obj4_base], 2
	jmp	near .18
.6:
	test	edx, 0xFFF03
	jz	near .18
	test	dh, 0x3C
	jz	.11
	test	dh, 4
	jz	.7
	xor	ebx, ebx
	jmp	.10
.7:
	test	dh, 8
	jz	.8
	mov	ebx, 1
	jmp	.10
.8:
	test	dh, 0x10
	jz	.9
	mov	ebx, 2
	jmp	.10
.9:
	test	dh, 0x20
	jz	.10
	mov	ebx, 3
.10:
	mov	word [LineChangeReq - obj4_base], 1
	mov	[LineChangeLine - obj4_base], bx
.11:
	test	edx, 0x3C000
	jz	.16
	test	dh, 0x40
	jz	.12
	xor	ebx, ebx
	jmp	.15
.12:
	test	dh, 0x80
	jz	.13
	mov	ebx, 1
	jmp	.15
.13:
	test	edx, 0x10000
	jz	.14
	mov	ebx, 2
	jmp	.15
.14:
	test	edx, 0x20000
	jz	.15
	mov	ebx, 3
.15:
	mov	word [LineChangeReq1 - obj4_base], 1
	mov	[LineChangeLine1 - obj4_base], bx
.16:
	test	edx, 0x40000
	jz	.17
	test	di, di
	jnz	.17
	xor	eax, eax
	mov	edi, 1
	call	PullGoalie
.17:
	test	edx, 0x80000
	jz	.18
	test	si, si
	jnz	.18
	mov	eax, 1
	mov	esi, 1
	call	PullGoalie
.18:
	add	ecx, 4
	cmp	ecx, 0x10
	jl	near .1
.19:
	pop	edi
	pop	esi
	pop	edx
	pop	ecx
	pop	ebx
	ret
RunSimFrames:
	incbin	"Extracted/segments/obj1_06000.bin", 0xF09
