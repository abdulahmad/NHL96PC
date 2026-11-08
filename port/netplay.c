/* SPDX-License-Identifier: MIT
 * Copyright (c) 2026 abdulahmad and contributors
 *
 * Online play with rollback (docs/SDL2_PORT.md, "Online play"). Two machines run the same game; Overbar's core (overbar/net.h)
 * guesses the other machine's buttons so a step never waits, and when a guess was wrong a state from before it is loaded and the
 * steps since are played again (overbar/rollback.h: the game's memory and the game thread's stack). The session glue (Online page,
 * its settings file, waiting for the other machine) is Overbar's overbar/netgame.h. This file is NHL 96's part:
 *
 *   - Input records. The timer callback sub_16C4D pushes a record every 4 ticks into a ring of 5 (dword_1515D4, 0x12 bytes: the
 *     buttons of the 4 controller slots, then the ticks since the last record), and the game loop sub_17025 takes them out
 *     (dword_114BA4 is the count): each record runs the simulation (sub_16F09) for that many ticks, then the loop draws a frame. In
 *     a session the callback does nothing, and the loop's "is there a record" (170A5) asks this file instead: once per pass of the
 *     loop it is one step of the session, with every machine's buttons (host: slot 0, guest: slot 1) and 4 ticks. That point is the
 *     resumable one: the states are taken there.
 *   - The game's clock (tickcount, dword_11F9A4), which the game reads all over (timers, the announcer, key repeat), counts 4 a
 *     step in a session instead of the timer interrupt's ticks, so it is the same on both machines and goes back with a state.
 *   - What would open a local screen is left out in a session: the menus the loop opens (sub_6A7D3: the pre-game menu, pause,
 *     instant replay), the intermission (sub_4B05E) and the hot keys read straight from the keyboard (sub_609C6). The game goes on.
 *   - Start: a new game (sub_17494 with eax < 0) on both machines, after the Online page's Host / Connect. The host's game set-up
 *     (the structure dword_17C9A0 points at: the teams, the controller slots), its options (dword_17CA20 .. 17CA75, dword_17C9A8)
 *     and both random seeds (EA's dword_117934 and the C library's) go to the guest; slot 0 plays the host's team, slot 1 the other,
 *     each machine reads its own controller into its slot. Each machine's own set-up comes back when that game is over.
 * The hooks run in the game thread; the main thread polls the socket (netplay_main_poll). */
#include "host.h"
#include "overbar_client.h"
#include "overbar/net.h"
#include "overbar/netgame.h"
#include "overbar/rollback.h"
#include <SDL.h>
#include <string.h>

#ifdef _WIN32
#define SYM(s) "_" s
#else
#define SYM(s) s
#endif
#ifndef NHL96_BUILD
#define NHL96_BUILD "unknown"
#endif

/* ---- the game's code and data (original linear addresses, lst/HOCKEY.EXE.lst) ---- */
#define O_PLAYGAME     0x17494u    /* sub_17494(eax): a game; eax < 0 a new one. push ebx, ecx, edx, esi; mov esi, eax (6 bytes) */
#define O_AVAIL        0x170A5u    /* sub_17025: cmp dword_114BA4, 0 (7 bytes), then jz the drawing */
#define O_SAMPLER      0x16C4Du    /* sub_16C4D, the record timer: push ebx, ecx, edx, esi, edi, ebp */
#define O_READPADS     0x10AF1u    /* sub_10AF1: the controllers into the slot table */
#define O_INITPADS     0x108BBu    /* sub_108BB: the slot table from the set-up */
#define C_INITPADS     0x174FFu    /*   its call in sub_17494 */
#define O_MENU         0x6A7D3u    /* sub_6A7D3: the menu dword_11D7A0 asks for */
#define C_MENU1        0x175C4u    /*   before the first faceoff */
#define C_MENU2        0x17255u    /*   in the loop */
#define O_INTER        0x4B05Eu    /* sub_4B05E: between periods */
#define C_INTER        0x1728Bu
#define O_HOTKEYS      0x609C6u    /* sub_609C6: keys read straight from the keyboard */
#define C_HOTKEYS      0x17201u
#define O_OVER         0x62311u    /* sub_62311 */
#define C_OVER         0x17324u    /*   the game is over */
#define O_TICK_ISR     0xAA5D5u    /* sub_AA5C4: mov edx, tickcount / inc edx / mov ebx, 5 / mov tickcount, edx (18 bytes) */
#define O_CSEED_FN     0xB03F2u    /* mov eax, <the C library's rand state> / ret */
#define D_EASEED       0x117934u   /* EA's random number state (sub_61A18) */
#define D_QCOUNT       0x114BA4u
#define D_QHEAD        0x114BA0u
#define D_QRING        0x1515D4u
#define D_PADTAB       0x1515B4u   /* 4 slots of 7 bytes: on, device (word: 1 none, 2 keys, 4.. sticks, 40h mouse), buttons */
#define D_SETUP_PTR    0x17C9A0u   /* the game's set-up: +5+i slot i's team (0/1), +9+2i its device (1: nobody) */
#define D_OPTS         0x17CA20u   /* the options (dword_17CA1C, the sound card, stays each machine's) */
#define D_OPTS_END     0x17CA75u
#define D_OPTS2        0x17C9A8u
#define D_MENUFLAG     0x11D7A0u
#define SETUP_N        0x90u
#define OPTS_N         (D_OPTS_END - D_OPTS)
#define VTIME_START    0x01000000u /* tickcount at a session's first step (above anything the loading left) */
#define G32(o) (*(volatile uint32_t *)GAME_ADDR(o))

/* ---- the state ---- */
volatile int nh_sim;                    /* a session drives the game (the hooks are on) */
volatile int nh_quiet;                  /* a replay is running: nothing is shown */
static int nh_ok, nh_me, nh_dead, nh_regions_log;
static uint32_t nh_given;               /* this pass of the loop has had its step (in the states) */
static uint32_t nh_steps;               /* steps run (in the states) */
static uint32_t nh_hi;                  /* the most steps made: below it a step is a replay (no waiting) */
static int64_t nh_next_ns;              /* when the next new step is due */
static uint16_t nh_local[2];
static uint16_t nh_all[OB_NET_MAX_PADS];
static uint16_t my_dev;
static uint8_t my_team;
volatile uint32_t *nh_tick_ptr;         /* tickcount */
volatile uint32_t nh_vtime, nh_rt_ticks, nh_avail_ret;
void *nh_pg_cont, *nh_sit_cont, *nh_initpads, *nh_menu, *nh_inter, *nh_hotkeys, *nh_over;
static ob_net *nh_net;
static ob_rollback *nh_rb;
static SDL_mutex *nh_lock;
static char *nh_stack_base;

/* the machine's own set-up, put back when the session's game is over */
static struct { uint8_t setup[SETUP_N], opts[OPTS_N]; uint32_t opts2; } nh_saved;

typedef struct nh_settings {
    uint32_t magic, version;
    uint32_t ea_seed, c_seed, opts2, host_team;
    uint8_t setup[SETUP_N];
    uint8_t opts[OPTS_N];
} nh_settings;
#define NH_MAGIC 0x4F363948u            /* "H96O" */

void snap_set_stack_base(void *base) { nh_stack_base = (char *)base; }
int netplay_running(void) { return nh_sim; }

static uint8_t *setup_ptr(void) { return (uint8_t *)(uintptr_t)G32(D_SETUP_PTR); }

static volatile uint32_t *cseed_ptr(void)
{
    const uint8_t *p = GAME_ADDR(O_CSEED_FN);
    uint32_t a;
    if (p[0] != 0xB8 || p[5] != 0xC3) return NULL;
    memcpy(&a, p + 1, 4);
    return (volatile uint32_t *)(uintptr_t)a;
}

/* a game routine without arguments: Watcom's code keeps every register but eax, more than a C call needs */
static void game_call0(void *fn)
{
    ((void (*)(void))fn)();
}

/* ---- the states: the game's image (its code too: it patches itself) without the input it reads live, the host's step
 * counters, then dos.c's (DOS memory, the DPMI blocks). The keyboard's, the sticks' and the slot table's live input stays as it
 * is when a state is loaded, so a key held now stays held. ---- */
static const struct { uint32_t lo, hi; } live[] = {
    { 0x11F5F0u, 0x11F720u },           /* the keyboard handler: key states, its queue */
    { 0x11F900u, 0x11F930u },           /* the stick reader's results */
    { 0x1515A8u, D_QRING },             /* the slot table and its scratch word */
    { 0x151700u, 0x151788u },           /* the sticks' ranges and buttons */
};

static int nh_regions(void *user, ob_snap_region *r, int max)
{
    uint32_t at = OBJ1_BASE;
    int n = 0, i;
    (void)user;
    for (i = 0; i < (int)(sizeof live / sizeof *live); i++) {
        if (n >= max) return -1;
        r[n].p = GAME_ADDR(at); r[n].n = live[i].lo - at; n++;
        at = live[i].hi;
    }
    if (n + 3 > max) return -1;
    r[n].p = GAME_ADDR(at); r[n].n = OBJ1_BASE + GAME_SPAN - at; n++;
    r[n].p = &nh_given; r[n].n = sizeof nh_given; n++;
    r[n].p = &nh_steps; r[n].n = sizeof nh_steps; n++;
    return dos_snap_regions(r, n, max);
}

static uint32_t nh_hold(void *user) { uint32_t v = (uint32_t)vif; (void)user; vif = 0; return v; }   /* no interrupt meanwhile */
static void nh_release(void *user, uint32_t tag, int loaded) { (void)user; (void)loaded; vif = (int)tag; }

static void lock(void) { SDL_LockMutex(nh_lock); }
static void unlock(void) { SDL_UnlockMutex(nh_lock); }
static int trylock(void) { return SDL_TryLockMutex(nh_lock); }

static int nh_frame(void *user)
{
    int r;
    (void)user;
    lock();
    ob_netgame_where = "ob_net_frame";
    r = nh_net ? ob_net_frame(nh_net, 1, nh_local, nh_all) : -1;
    ob_netgame_where = "";
    unlock();
    return r;
}

/* what the desync check compares: both random states, the clock, the steps, the record ring */
static uint64_t sim_hash(void)
{
    uint64_t h = 1469598103934665603ULL;
    volatile uint32_t *cs = cseed_ptr();
    uint32_t v[4];
    const uint8_t *q;
    size_t k;
    v[0] = G32(D_EASEED); v[1] = cs ? *cs : 0; v[2] = *nh_tick_ptr; v[3] = nh_steps;
    for (q = (const uint8_t *)v, k = 0; k < sizeof v; k++) { h ^= q[k]; h *= 1099511628211ULL; }
    for (q = GAME_ADDR(D_QRING), k = 0; k < 5 * 0x12; k++) { h ^= q[k]; h *= 1099511628211ULL; }
    return h;
}

/* this machine's buttons for a new step: the game's own reader, as its timer callback would (NHL96_AUTOPAD: made up, for tests) */
static void read_local(uint32_t step)
{
    uint32_t b;
    if (getenv("NHL96_AUTOPAD")) b = ((1u + step / 6u % 8u) << 2) | (step % 13u == 0 ? 0x40u : 0) | (step % 29u == 0 ? 0x80u : 0);
    else {
        game_call0(GAME_ADDR(O_READPADS));
        b = *(volatile uint32_t *)(GAME_ADDR(D_PADTAB + 3) + 7 * nh_me);
    }
    nh_local[0] = (uint16_t)b;
    nh_local[1] = (uint16_t)(b >> 16);
}

static void push_record(void)
{
    uint32_t head = G32(D_QHEAD), slot[4] = { 0, 0, 0, 0 };
    uint8_t *rec = GAME_ADDR(D_QRING) + head * 0x12;
    uint16_t ticks = 4;
    slot[0] = (uint32_t)nh_all[0] | (uint32_t)nh_all[1] << 16;
    slot[1] = (uint32_t)nh_all[2] | (uint32_t)nh_all[3] << 16;
    memcpy(rec, slot, 16);
    memcpy(rec + 16, &ticks, 2);
    G32(D_QHEAD) = (head + 1) % 5;
    G32(D_QCOUNT) = G32(D_QCOUNT) + 1;
}

static void log_step(uint32_t cnt)
{
    char line[200] = "";
    lock();
    if (nh_net) ob_net_status(nh_net, line, sizeof line);
    unlock();
    fprintf(stderr, "rollback: at %.1f s, step %u; %s; %s\n", plat_now_ns() / 1e9, (unsigned)cnt, ob_rollback_stats(nh_rb), line);
    if (nh_regions_log) {
        uint64_t h[64];
        int n = ob_rollback_region_hashes(nh_rb, h, 64), i;
        fprintf(stderr, "regions at step %u:", (unsigned)cnt);
        for (i = 0; i < n; i++) fprintf(stderr, " %d:%08x", i, (unsigned)(h[i] ^ (h[i] >> 32)));
        fprintf(stderr, "\n");
    }
}

/* the session has ended in the game: it plays on here alone (the other slot gets no more buttons) */
static void go_local(void)
{
    nh_sim = 0;
    nh_quiet = 0;
    nh_vtime = 0;
    nh_dead = 1;
}

/* One step: wait for its time when it is a new one, then ask the core (which may load a state and come back here). */
static int make_step(void)
{
    uint32_t cnt;
    int r;
    for (;;) {
        lock();
        cnt = nh_net ? ob_net_step_count(nh_net) : 0;
        unlock();
        if (cnt >= nh_hi) {                         /* a new step: at the record rate, 4 ticks of the game's timer */
            int64_t now = plat_now_ns();
            if (!nh_next_ns || now - nh_next_ns > 200000000LL) nh_next_ns = now;
            if (now < nh_next_ns) { plat_sleep_ms(1); continue; }
            read_local(cnt);
            if (!nh_vtime) {                        /* the first step: from here the clock counts steps, from the same value on both */
                nh_rt_ticks = *nh_tick_ptr;
                *nh_tick_ptr = VTIME_START;
                nh_vtime = 1;
            }
        }
        r = ob_rollback_frame(nh_rb, nh_frame, NULL);
        if (r == OB_NET_RUN) break;
        if (r < 0) return -1;
        plat_sleep_ms(1);                           /* OB_NET_WAIT: the others are behind */
    }
    lock();
    nh_quiet = ob_net_replaying(nh_net);
    cnt = ob_net_step_count(nh_net);
    unlock();
    if (cnt > nh_hi) { nh_hi = cnt; nh_next_ns += 4000000000LL / (int64_t)(irq_pit_hz() ? irq_pit_hz() : 91); }
    if ((cnt - 1) % 60 == 0) {
        uint64_t h = sim_hash();
        lock();
        if (nh_net) ob_net_check(nh_net, cnt - 1, h);
        unlock();
    }
    nh_steps = cnt;
    *nh_tick_ptr += 4;
    push_record();
    if (!nh_quiet && cnt % 200 == 0 && ob_netgame_test()) log_step(cnt);
    return 0;
}

/* the loop's "is there a record?" (170A5): in a session, one step a pass */
uint32_t nh_avail(void)
{
    uint32_t c = G32(D_QCOUNT);
    if (!nh_sim || c) return c;
    if (nh_given) { nh_given = 0; return 0; }       /* this pass had its step: now it draws */
    if (make_step()) { go_local(); return G32(D_QCOUNT); }
    nh_given = 1;
    return G32(D_QCOUNT);
}

/* ---- the start and end of the session's game ---- */
static void make_settings(nh_settings *s)
{
    volatile uint32_t *cs = cseed_ptr();
    memset(s, 0, sizeof *s);
    s->magic = NH_MAGIC; s->version = 1;
    s->ea_seed = G32(D_EASEED);
    s->c_seed = cs ? *cs : 0;
    s->opts2 = G32(D_OPTS2);
    s->host_team = my_team;
    memcpy(s->setup, setup_ptr(), SETUP_N);
    memcpy(s->opts, GAME_ADDR(D_OPTS), OPTS_N);
}

static void apply_settings(const nh_settings *s)
{
    volatile uint32_t *cs = cseed_ptr();
    uint8_t *su = setup_ptr();
    int i;
    memcpy(su, s->setup, SETUP_N);
    memcpy(GAME_ADDR(D_OPTS), s->opts, OPTS_N);
    G32(D_OPTS2) = s->opts2;
    for (i = 0; i < 4; i++) {                       /* slot 0 the host's team, slot 1 the other; nobody in 2 and 3 */
        uint16_t dev = i < 2 ? 2 : 1;
        su[5 + i] = (uint8_t)(i == 0 ? s->host_team : i == 1 ? !s->host_team : 0);
        memcpy(su + 9 + 2 * i, &dev, 2);
    }
    G32(D_EASEED) = s->ea_seed;
    if (cs) *cs = s->c_seed;
}

/* this machine's controller and team: the first slot of its set-up that someone plays */
static int find_mine(void)
{
    const uint8_t *su = setup_ptr();
    int i;
    for (i = 0; i < 4; i++) {
        uint16_t dev;
        memcpy(&dev, su + 9 + 2 * i, 2);
        if (dev != 1 && dev != 0) { my_dev = dev; my_team = su[5 + i] ? 1 : 0; return 0; }
    }
    return -1;
}

void nh_playgame_enter(int32_t which)
{
    char identity[200];
    nh_settings mine;
    const nh_settings *theirs;
    size_t size = 0;
    ob_net_game g;
    ob_rollback_game rg;
    if (!nh_ok || !ob_netgame_armed()) return;
    if (which >= 0) { ob_netgame_set_why("online play starts with a new game"); return; }       /* (still armed) */
    if (find_mine()) { ob_netgame_set_why("pick a controller for one of the teams first"); return; }
    if (!nh_rb) {
        memset(&rg, 0, sizeof rg);
        rg.regions = nh_regions;
        rg.watch = plat_write_watch;
        rg.hold = nh_hold;
        rg.release = nh_release;
        rg.slots = 32;
        nh_rb = ob_rollback_new(&rg, nh_stack_base);
        if (!nh_rb) { ob_netgame_set_why("no memory for the rollback states"); return; }
    }
    snprintf(identity, sizeof identity, "nhl96pc %s rollback1 sound %s", NHL96_BUILD, getenv("NHL96_SOUND") ? getenv("NHL96_SOUND") : "game");
    make_settings(&mine);
    memset(&g, 0, sizeof g);
    g.identity = identity;
    g.pads = 4;                                     /* two 16-bit pads a machine: a slot's 32 bits of buttons */
    g.settings = &mine;
    g.settings_size = sizeof mine;
    g.states = ob_rollback_states(nh_rb);
    nh_net = ob_netgame_begin(&g);
    if (!nh_net) return;
    lock();
    theirs = (const nh_settings *)ob_net_settings(nh_net, &size);
    nh_me = (ob_net_my_pads(nh_net) & 1) ? 0 : 1;
    unlock();
    if (!theirs || size != sizeof *theirs || theirs->magic != NH_MAGIC || theirs->version != 1) {
        lock(); ob_net_quit(nh_net); unlock();
        ob_netgame_end("the host's settings are not this version's");
        nh_net = NULL;
        return;
    }
    memcpy(nh_saved.setup, setup_ptr(), SETUP_N);
    memcpy(nh_saved.opts, GAME_ADDR(D_OPTS), OPTS_N);
    nh_saved.opts2 = G32(D_OPTS2);
    apply_settings(theirs);
    nh_given = 0; nh_steps = 0; nh_hi = 0; nh_next_ns = 0; nh_dead = 0; nh_quiet = 0;
    nh_vtime = 0;                                   /* (the loading still runs on the timer's ticks: it waits on them) */
    nh_sim = 1;
    if (ob_netgame_test()) fprintf(stderr, "online: session on, this machine plays slot %d (team %d, device %u)\n", nh_me, nh_me ? !theirs->host_team : (int)theirs->host_team, (unsigned)my_dev);
}

/* sub_108BB has made the slot table from the set-up: here only this machine's slot reads a controller, its own */
void nh_initpads_after(void)
{
    int i;
    if (!nh_sim) return;
    for (i = 0; i < 4; i++) {
        uint16_t dev = i == nh_me ? my_dev : 1;
        memcpy(GAME_ADDR(D_PADTAB + 1) + 7 * i, &dev, 2);
    }
}

/* the game is over: the clock is the timer's again (the end screens wait on it) */
void nh_game_over(void)
{
    if (!nh_sim) return;
    nh_vtime = 0;
    nh_quiet = 0;
}

void nh_playgame_exit(void)
{
    if (!nh_net) return;
    nh_sim = 0; nh_vtime = 0; nh_quiet = 0;
    ob_rollback_reset(nh_rb);
    ob_netgame_end(nh_dead ? NULL : "the game is over");
    nh_net = NULL;
    memcpy(setup_ptr(), nh_saved.setup, SETUP_N);
    memcpy(GAME_ADDR(D_OPTS), nh_saved.opts, OPTS_N);
    G32(D_OPTS2) = nh_saved.opts2;
}

void nh_menu_skip(void) { G32(D_MENUFLAG) = 0; }

/* ---- the stubs ---- */
__attribute__((naked)) static void pg_entry(void)        /* sub_17494(eax): around the whole game */
{
    __asm__ volatile(
        "pushal\n\tpushl %eax\n\tcall " SYM("nh_playgame_enter") "\n\taddl $4, %esp\n\tpopal\n\t"
        "pushl $2f\n\t"
        "pushl %ebx\n\tpushl %ecx\n\tpushl %edx\n\tpushl %esi\n\tmovl %eax, %esi\n\tjmp *" SYM("nh_pg_cont") "\n"
        "2:\n\tpushal\n\tcall " SYM("nh_playgame_exit") "\n\tpopal\n\tret");
}

__attribute__((naked)) static void sit_entry(void)       /* sub_16C4D, the record timer: nothing in a session */
{
    __asm__ volatile(
        "cmpl $0, " SYM("nh_sim") "\n\tjne 1f\n\t"
        "pushl %ebx\n\tpushl %ecx\n\tpushl %edx\n\tpushl %esi\n\tpushl %edi\n\tjmp *" SYM("nh_sit_cont") "\n"
        "1:\n\tret");
}

__attribute__((naked)) static void avail_stub(void)      /* replaces cmp dword_114BA4, 0: the flags as that would leave them */
{
    __asm__ volatile(
        "pushal\n\tcall " SYM("nh_avail") "\n\tmovl %eax, " SYM("nh_avail_ret") "\n\tpopal\n\t"
        "cmpl $0, " SYM("nh_avail_ret") "\n\tret");
}

__attribute__((naked)) static void initpads_stub(void)
{
    __asm__ volatile("call *" SYM("nh_initpads") "\n\tpushal\n\tcall " SYM("nh_initpads_after") "\n\tpopal\n\tret");
}

__attribute__((naked)) static void menu_stub(void)
{
    __asm__ volatile(
        "cmpl $0, " SYM("nh_sim") "\n\tje 1f\n\tpushal\n\tcall " SYM("nh_menu_skip") "\n\tpopal\n\tret\n"
        "1:\n\tjmp *" SYM("nh_menu"));
}

__attribute__((naked)) static void inter_stub(void)
{
    __asm__ volatile("cmpl $0, " SYM("nh_sim") "\n\tje 1f\n\tret\n1:\n\tjmp *" SYM("nh_inter"));
}

__attribute__((naked)) static void hotkeys_stub(void)
{
    __asm__ volatile("cmpl $0, " SYM("nh_sim") "\n\tje 1f\n\tret\n1:\n\tjmp *" SYM("nh_hotkeys"));
}

__attribute__((naked)) static void over_stub(void)
{
    __asm__ volatile("pushal\n\tcall " SYM("nh_game_over") "\n\tpopal\n\tjmp *" SYM("nh_over"));
}

/* the timer interrupt's tick: tickcount, or in a session a count of the host's (the steps move tickcount); edx the count, ebx 5 */
__attribute__((naked)) static void tick_stub(void)
{
    __asm__ volatile(
        "cmpl $0, " SYM("nh_vtime") "\n\tjne 1f\n\t"
        "movl " SYM("nh_tick_ptr") ", %edx\n\tincl (%edx)\n\tmovl (%edx), %edx\n\tmovl $5, %ebx\n\tret\n"
        "1:\n\tincl " SYM("nh_rt_ticks") "\n\tmovl " SYM("nh_rt_ticks") ", %edx\n\tmovl $5, %ebx\n\tret");
}

static int call_to(uint32_t site, uint32_t target)        /* call rel32 at site goes to target */
{
    const uint8_t *p = GAME_ADDR(site);
    int32_t rel;
    memcpy(&rel, p + 1, 4);
    return p[0] == 0xE8 && p + 5 + rel == GAME_ADDR(target);
}

static void set_call(uint32_t site, void *to)
{
    uint8_t *p = GAME_ADDR(site);
    int32_t rel = (int32_t)((uintptr_t)to - ((uintptr_t)p + 5));
    patch_bytes(p + 1, &rel, 4);
}

static int has_addr(uint32_t at, uint32_t orig)          /* the 4 bytes at at are the address of orig */
{
    uint32_t v;
    memcpy(&v, GAME_ADDR(at), 4);
    return v == (uint32_t)(uintptr_t)GAME_ADDR(orig);
}

/* after install_overrides, before the game thread starts */
void netplay_install(void)
{
    static const uint8_t pg_head[6] = { 0x53, 0x51, 0x52, 0x56, 0x89, 0xC6 }, sit_head[5] = { 0x53, 0x51, 0x52, 0x56, 0x57 };
    const uint8_t *t = GAME_ADDR(O_TICK_ISR), *a = GAME_ADDR(O_AVAIL);
    int ok = 1;
    if (!nh_lock) nh_lock = SDL_CreateMutex();
    nh_regions_log = getenv("NHL96_REGIONS") != NULL;
    if (memcmp(GAME_ADDR(O_PLAYGAME), pg_head, 6) || memcmp(GAME_ADDR(O_SAMPLER), sit_head, 5)) ok = 0;
    if (t[0] != 0x8B || t[1] != 0x15 || !has_addr(O_TICK_ISR + 2, ORIG_TICKCOUNT) || t[6] != 0x42 || t[7] != 0xBB || t[8] != 5 ||
        t[12] != 0x89 || t[13] != 0x15 || !has_addr(O_TICK_ISR + 14, ORIG_TICKCOUNT)) ok = 0;
    if (a[0] != 0x83 || a[1] != 0x3D || !has_addr(O_AVAIL + 2, D_QCOUNT) || a[6] != 0 || a[7] != 0x0F || a[8] != 0x84) ok = 0;
    if (!call_to(C_INITPADS, O_INITPADS) || !call_to(C_MENU1, O_MENU) || !call_to(C_MENU2, O_MENU) || !call_to(C_INTER, O_INTER) ||
        !call_to(C_HOTKEYS, O_HOTKEYS) || !call_to(C_OVER, O_OVER) || !cseed_ptr() || !nh_lock) ok = 0;
    if (!ok) { fprintf(stderr, "online play: the game's code is not as expected, not available\n"); return; }
    nh_tick_ptr = (volatile uint32_t *)GAME_ADDR(ORIG_TICKCOUNT);
    nh_pg_cont = GAME_ADDR(O_PLAYGAME + 6);
    nh_sit_cont = GAME_ADDR(O_SAMPLER + 5);
    nh_initpads = GAME_ADDR(O_INITPADS);
    nh_menu = GAME_ADDR(O_MENU);
    nh_inter = GAME_ADDR(O_INTER);
    nh_hotkeys = GAME_ADDR(O_HOTKEYS);
    nh_over = GAME_ADDR(O_OVER);
    patch_jmp(GAME_ADDR(O_PLAYGAME), (void *)pg_entry);
    patch_jmp(GAME_ADDR(O_SAMPLER), (void *)sit_entry);
    {
        uint8_t code[18];
        int32_t rel = (int32_t)((uintptr_t)tick_stub - ((uintptr_t)GAME_ADDR(O_TICK_ISR) + 5));
        memset(code, 0x90, sizeof code);
        code[0] = 0xE8; memcpy(code + 1, &rel, 4);
        patch_bytes(GAME_ADDR(O_TICK_ISR), code, sizeof code);
        rel = (int32_t)((uintptr_t)avail_stub - ((uintptr_t)GAME_ADDR(O_AVAIL) + 5));
        memset(code, 0x90, 7);
        code[0] = 0xE8; memcpy(code + 1, &rel, 4);
        patch_bytes(GAME_ADDR(O_AVAIL), code, 7);
    }
    set_call(C_INITPADS, (void *)initpads_stub);
    set_call(C_MENU1, (void *)menu_stub);
    set_call(C_MENU2, (void *)menu_stub);
    set_call(C_INTER, (void *)inter_stub);
    set_call(C_HOTKEYS, (void *)hotkeys_stub);
    set_call(C_OVER, (void *)over_stub);
    nh_ok = 1;
}

/* ---- the main thread ---- */
void netplay_main_poll(void) { if (nh_lock) ob_netgame_main_poll(); }

static int page_is_open(void) { return overbar_client_open(); }

void netplay_online_setup(ob_host *h)
{
    static char ini[1024];
    ob_netgame_cfg c;
    char *base = SDL_GetBasePath();
    if (!nh_lock) nh_lock = SDL_CreateMutex();
    snprintf(ini, sizeof ini, "%shockey-online.ini", base ? base : "");
    SDL_free(base);
    memset(&c, 0, sizeof c);
    c.title = "NHL Hockey 96 (SDL2 port)";
    c.ini_path = ini;
    c.env = "NHL96";
    c.how = "both players: start a new game";
    c.pads_per_player = 2;
    c.test_port = 41960;
    c.lock = lock;
    c.unlock = unlock;
    c.trylock = trylock;
    c.sleep_ms = plat_sleep_ms;
    c.page_is_open = page_is_open;
    c.open_page = overbar_client_online_open;
    c.close_page = overbar_client_close;
    ob_netgame_setup(h, &c);
}
