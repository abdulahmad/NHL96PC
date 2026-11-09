# Modem and cable play, and how the online room takes it over

NHL 96 PC plays two machines over a Hayes modem or a null-modem cable. There is no IPX. This page is a static
trace of that code, from `lst/HOCKEY.EXE.lst`; it has not been run yet. It also covers how the port carries it
over Overbar's online room (design: online play phase 6).

## Layers, bottom up

| Layer | Where | What it does |
|---|---|---|
| UART driver | sub_B103C .. sub_B1830 | A 16550 driver. Port table `off_11FD58[n]`: +0..3 is the line set-up, +4 the interrupt vector, +6 the PIC mask bit, +8 the base port, +10h whether it is open, +18h..38h the two 200h-byte rings (receive, send). sub_B103C sets the divisor and LCR. sub_B1121 opens the port: it hooks the vector (sub_C2C7C / sub_C2C94), probes the FIFO (FCR 87h, then IIR bit 7), unmasks the IRQ and registers sub_B1241 for exit. sub_B11F8 closes it. sub_B1279 / sub_B1294 raise / drop DTR. sub_B12AF reads DCD (MSR bit 7). sub_B1328 sends: it copies into the send ring, sets RTS and writes one byte when THR is empty. The rest goes out from the transmitter-empty interrupt. sub_B13BB returns the free room in the send ring. sub_B1830 is a CRC-16. |
| Modem | sub_1768A .. sub_17C02 | Init sub_1768A: `ATE1`, `ATQ0`, `ATX4`, `ATF1`, `ATM0`. Hang up sub_1779C: `ATH0`. Dial sub_1780A: `ATX3`, then `ATD` plus the number (T or P). Answer sub_17887: `ATS0=1`, then `ATA`. Responses are read by sub_178C0 (`CONNECT 1200` .. `CONNECT 14400/ARQ/HST`, `NO CARRIER`; the `_` in the strings is CR/LF). `dword_11500C` is the port number, `dword_115018` answer (1) or dial (0), `dword_11501C` cable (no modem commands). |
| Connect | sub_18540 (called at 12B79) | Cable: connected at once. Modem: answer or dial, then wait for sub_178C0's result while the game's "cancel" hook (`dword_15291C`) can break it off. Returns whether it connected. sub_186DC hangs up and closes. |
| Packets | sub_17CC8 .. sub_189CD | Frames start with BDh, then a type, a sequence number, a check byte (sub_17EE1) and a CRC-16 (sub_187A8 → sub_B1830). Data is 12 bytes carrying 6 bytes of payload; an ack ('C') is 6 bytes. There is a 64-frame window with resends (`dword_152148[]`, 18h each). sub_1891A(payload, n) queues one data frame and sends it; it returns 0 when the window is full. Received payloads go into a ring of 7-byte slots at `unk_151B88`. sub_18090 hands each one to the handler in `dword_115040` (set at 12B74 to sub_1277B). The record timer's callback sub_18234 polls receive (sub_18A81 → sub_18186) and dispatches. |
| Game messages | sub_122A6 .. sub_1377E (handler sub_1277B) | The first payload byte is the type. 1, 2 and 6 each go into a queue of 10 (`unk_151A04`, `unk_151A94`, `unk_1519C0`). 3, 4 and 5 are handled at once (sub_1253E, sub_12577, sub_1272E). The menus send set-ups through sub_125FF and friends (the calls of sub_1891A at 12634 .. 1406C). sub_13146 and sub_1377E wait for the other side at many menu points. sub_13338 resets the queues and the record ring at game start (called at 1754B and 17641 in sub_17494). |
| In play | sub_13407, called by the record timer sub_16C4D at 16C95 while `word_114CE0` bit 0 (modem game) is set | Each timer pass packs this machine's two slots into a type-2 message (4 bytes) and sends it. The slots are 0 and 1 (`1515B7`, `1515BE`) when `word_114CE4` = 1, else 2 and 3 (`1515C5`, `1515CC`); `word_114CE4` is set at 12BFC from `dword_114D1A`, the side picked. It keeps up to 4 of its own in flight (`unk_151A44`, `dword_114D9A`: the input delay). Once the other side's next type-2 message has come, it builds a record in the ring `dword_1515D4` (D_QRING) from both and counts it in `dword_114BA4`. The game loop then plays that record like any other: lockstep, waiting on the slower side. |

## How the room takes it over

1. **The line.** Overbar's `overbar/serial.h` emulates the UART and the modem. `port/modem.c` sends the game's
   `in` / `out` on COM1..COM4 to it once the room attaches it (`modem_attach`). Its interrupt line raises IRQ 4
   (COM1/COM3) or IRQ 3 (COM2/COM4) through `irq_raise`, and the game's own handler services it. Dialing reaches
   the other machine of the room whatever number is typed. Auto-answer and `ATA` answer. `CONNECT 9600` comes at
   once. Bytes travel the room's message lane, which loses nothing, so the game's resends never fire. Dropping DTR,
   `ATH`, `+++` and the other machine leaving all behave as on a real modem. Cable mode is the same without the
   modem.
2. **Menus and set-up.** These run on the game's own packets over that line, byte for byte, so every screen of
   modem play works as the original.
3. **In play, rollback instead of lockstep.** When sub_17494 starts a game with `word_114CE0` bit 0 set, the port
   begins a room match instead of letting sub_13407 run:
   - pads 0..3 (slots 0 and 1, two 16-bit pads each) go to the machine with `word_114CE4` = 1;
   - pads 4..7 (slots 2 and 3) go to the other machine;
   - the record timer is already off in a session, so sub_13407 is not called;
   - the loop's record check (170A5) takes each step from ob_net with all four slots;
   - both machines start from the same set-up because the menus agreed it. Only the seeds go with the match, as
     in the room's own matches.

   At game end (sub_62311 / sub_17494's return) the match ends and the game goes back to its modem menus on the
   same line. `sub_13338`'s reset of the queues at game start stays harmless. The pause menu sub_6A7D3 and the
   hot keys follow the room's rules (menu lane, ownership).

## What needs the laptop

- The room has to be wired into this port first (online play phase 1, laptop steps).
- Then run two instances with `NHL96_ONLINE`, both picking Modem play: one Answer, one Dial. Check that they
  connect, then that the menus, the season data and a game go through with rollback, without desync.
- Confirm by running it: `word_114CE4` means "plays slots 0 and 1", and `dword_114D1A` is the answer side.
