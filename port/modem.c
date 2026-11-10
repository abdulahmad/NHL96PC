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

/* (test aid NHL96_MODEM_LOG) the game's side of the line: what it writes to the UART and reads from it, a line a CR */
static void tlog_char(int dir, uint8_t c);

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
    if (port - base == 0 && !(ser->lcr & 0x80)) tlog_char(1, (uint8_t)*v);
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
    if (port - base == 0 && !(ser->lcr & 0x80)) tlog_char(0, (uint8_t)v);
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

/* ---- test aid: a two-machine room for Modem play, and a log of the line (the modem season trace) ----
 * NHL96_MODEM=host|join[:ADDR] opens a room on NHL96_MODEM_PORT (default 41996; join: 127.0.0.1 unless ADDR) with this port's
 * serial line in it (a Hayes modem: the game's Modem play screens, Answer on one, Dial on the other). NHL96_MODEM_LOG=FILE
 * writes every chunk this machine sends down the line, its time in ms and the bytes in hex. Until the Online page opens rooms
 * (online play phase 1) this is the only way in. */
#include "overbar/net.h"
#include "overbar/room.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static ob_net *tnet;
static ob_room troom;
static ob_serial tser;
static FILE *tlog;

static void tlog_char(int dir, uint8_t c)
{
    static char line[2][256];
    static int n[2];
    if (!tlog) return;
    if (n[dir] < 250) {
        if (c >= 32 && c < 127) line[dir][n[dir]++] = (char)c;
        else n[dir] += sprintf(line[dir] + n[dir], "<%02X>", c);
    }
    if (c == '\r' || c == '\n' || n[dir] >= 250) {
        line[dir][n[dir]] = 0;
        fprintf(tlog, "%u game %s %s\n", (unsigned)SDL_GetTicks(), dir ? "reads" : "writes", line[dir]);
        fflush(tlog);
        n[dir] = 0;
    }
}

static void tsend(void *ud, const void *data, size_t size)
{
    if (tlog) {
        const uint8_t *b = (const uint8_t *)data;
        size_t i;
        fprintf(tlog, "%u out %u:", (unsigned)SDL_GetTicks(), (unsigned)size);
        for (i = 0; i < size; i++) fprintf(tlog, " %02X", b[i]);
        fputc('\n', tlog);
        fflush(tlog);
    }
    ob_room_serial_send(ud, data, size);
}

void modem_test_open(void)
{
    const char *v = getenv("NHL96_MODEM"), *lp = getenv("NHL96_MODEM_LOG"), *pp = getenv("NHL96_MODEM_PORT");
    ob_online on;
    ob_net_game g;
    char err[200];
    if (!v || tnet) return;
    memset(&on, 0, sizeof on);
    memset(&g, 0, sizeof g);
    on.role = strncmp(v, "host", 4) ? 1 : 0;
    snprintf(on.name, sizeof on.name, "%s", on.role ? "Dial" : "Answer");
    snprintf(on.addr, sizeof on.addr, "%s", strchr(v, ':') ? strchr(v, ':') + 1 : "127.0.0.1");
    on.port = pp && atoi(pp) > 0 ? atoi(pp) : 41996;
    on.here = 1;
    on.all = 2;
    g.identity = "NHL96PC modem line";
    g.pads = 2;                         /* (the core takes 2 to 16; no match is played on this room) */
    g.room = 1;
    tnet = ob_net_new(&on, &g, err, sizeof err);
    if (!tnet) { fprintf(stderr, "NHL96_MODEM: %s\n", err); return; }
    if (lp) tlog = fopen(lp, "w");
    ob_room_init(&troom, tnet, NULL, NULL);
    ob_serial_init(&tser, OB_SERIAL_MODEM, tsend, tnet);
    ob_room_serial(&troom, &tser);
    modem_attach(&tser);
    fprintf(stderr, "NHL96_MODEM: room open (%s, port %d); pick Modem play in the game\n", on.role ? "dial side" : "answer side", on.port);
}

void modem_test_poll(void)
{
    static uint32_t said;
    if (!tnet) return;
    modem_lock();
    if (ob_net_poll(tnet) == OB_NET_ENDED) {
        fprintf(stderr, "NHL96_MODEM: %s\n", ob_net_why(tnet));
        ob_serial_peer(&tser, 0);
        modem_unlock();
        ob_net_free(tnet);
        tnet = NULL;
        return;
    }
    ob_room_poll(&troom, NULL, NULL);
    modem_unlock();
    modem_poll();
    if (SDL_GetTicks() - said > 5000) {
        char st[96];
        said = SDL_GetTicks();
        ob_serial_status(&tser, st, sizeof st);
        fprintf(stderr, "NHL96_MODEM: %s, %u in the room\n", st, (unsigned)__builtin_popcount(ob_net_members(tnet)));
    }
}
