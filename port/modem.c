/* SPDX-License-Identifier: MIT
 * Copyright (c) 2026 abdulahmad and contributors
 *
 * The game's modem and cable play, carried by the online room (docs/MODEM.md). NHL 96 talks to a 16550 UART on COM1 .. COM4 itself
 * (its serial driver, sub_B103C .. sub_B1830) and to a Hayes modem through it (sub_1768A .. sub_189CD: ATE1, ATQ0, ATX4, ATS0=1 to
 * answer, ATD to dial). Overbar's overbar/serial.h is that UART and modem: the room is the telephone line, so the game's own Modem
 * play screens connect, and its bytes go across the room's message lane. Here: the game's in / out on the COM ports go to it, and
 * its interrupt line raises the port's IRQ (4 for COM1 and COM3, 3 for COM2 and COM4).
 *
 * The room attaches the port with modem_attach (an ob_serial made with ob_serial_init, ob_room_serial); until then the COM ports
 * read as no device, as before. The game thread does the in / out, the main thread the room's messages: one lock for both. */
#include "host.h"
#include "overbar/serial.h"
#include <SDL.h>

static ob_serial *ser;
static SDL_mutex *mlock;
static unsigned com_base;               /* the COM port the game opened (0: any of the four, until it touches one) */
static int com_irq = 4;

static int com_of(unsigned port, unsigned *base)
{
    static const unsigned bases[4] = { 0x3F8, 0x2F8, 0x3E8, 0x2E8 };
    int i;
    for (i = 0; i < 4; i++)
        if (port >= bases[i] && port < bases[i] + 8) { *base = bases[i]; return 1; }
    return 0;
}

void modem_lock(void) { if (mlock) SDL_LockMutex(mlock); }
void modem_unlock(void) { if (mlock) SDL_UnlockMutex(mlock); }

void modem_attach(ob_serial *s)
{
    if (!mlock) mlock = SDL_CreateMutex();
    modem_lock();
    ser = s;
    com_base = 0;
    modem_unlock();
}

static void raise_if(void)
{
    if (ser && ob_serial_irq_edge(ser)) irq_raise(com_irq);
}

int modem_port_in(unsigned port, uint32_t *v)
{
    unsigned base;
    if (!ser || !com_of(port, &base) || (com_base && base != com_base)) return 0;
    modem_lock();
    if (!com_base) { com_base = base; com_irq = (base == 0x3F8 || base == 0x3E8) ? 4 : 3; }
    *v = ob_serial_in(ser, (int)(port - base));
    raise_if();
    modem_unlock();
    return 1;
}

int modem_port_out(unsigned port, uint32_t v)
{
    unsigned base;
    if (!ser || !com_of(port, &base) || (com_base && base != com_base)) return 0;
    modem_lock();
    if (!com_base) { com_base = base; com_irq = (base == 0x3F8 || base == 0x3E8) ? 4 : 3; }
    ob_serial_out(ser, (int)(port - base), (uint8_t)v);
    raise_if();
    modem_unlock();
    return 1;
}

/* the main thread, once a frame, after the room's poll (which gives the serial port its messages under modem_lock) */
void modem_poll(void)
{
    if (!ser) return;
    modem_lock();
    ob_serial_poll(ser, SDL_GetTicks());
    raise_if();
    modem_unlock();
}
