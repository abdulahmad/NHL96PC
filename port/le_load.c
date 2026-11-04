/* Load the retail HOCKEY.EXE LE objects at a relocated address and apply the
 * internal fixups, the way DOS/4GW would, so the 32-bit game can run natively. */
#include "host.h"
#include "game.h"
#include <SDL.h>
#include <sys/stat.h>

uint8_t *game_image;
int32_t game_slide;
uint8_t *game_code;
uint32_t game_code_size = OBJ1_SIZE;

static const uint32_t EXE_SIZE = 1613291;
static char exe_path[1100];

const char *game_exe_path(void)
{
    return exe_path[0] ? exe_path : 0;
}

static int is_retail(const uint8_t *d, size_t n)
{
    if (n != EXE_SIZE) return 0;
    if (d[0] != 'M' || d[1] != 'Z') return 0;
    if (d[0x290A4] != 'L' || d[0x290A5] != 'E') return 0;
    return 1;
}

static int try_path(const char *p, uint8_t **out, size_t *n)
{
    FILE *f;
    struct stat st;
    uint8_t *d;
    if (stat(p, &st) || st.st_size != (off_t)EXE_SIZE) return 0;
    f = fopen(p, "rb");
    if (!f) return 0;
    d = malloc(EXE_SIZE);
    if (!d || fread(d, 1, EXE_SIZE, f) != EXE_SIZE) { free(d); fclose(f); return 0; }
    fclose(f);
    if (!is_retail(d, EXE_SIZE)) { free(d); return 0; }
    snprintf(exe_path, sizeof exe_path, "%s", p);
    *out = d; *n = EXE_SIZE;
    return 1;
}

static uint8_t *read_exe(size_t *n)
{
    uint8_t *d = 0;
    const char *e = getenv("NHL96_EXE");
    char *base = SDL_GetBasePath();
    char p[1100];
    if (e && try_path(e, &d, n)) goto done;
    if (try_path("lst/HOCKEY.EXE", &d, n)) goto done;
    if (try_path("HOCKEY.EXE", &d, n)) goto done;
    if (base) {
        snprintf(p, sizeof p, "%slst/HOCKEY.EXE", base);
        if (try_path(p, &d, n)) goto done;
        snprintf(p, sizeof p, "%sHOCKEY.EXE", base);
        if (try_path(p, &d, n)) goto done;
        snprintf(p, sizeof p, "%s../lst/HOCKEY.EXE", base);
        if (try_path(p, &d, n)) goto done;
    }
    fprintf(stderr, "NHL 96 PC: HOCKEY.EXE (1,613,291 bytes) not found.\n"
                    "Put it in lst/HOCKEY.EXE or set NHL96_EXE.\n");
done:
    SDL_free(base);
    return d;
}

static uint32_t ru32(const uint8_t *p) { uint32_t v; memcpy(&v, p, 4); return v; }
static uint16_t ru16(const uint8_t *p) { uint16_t v; memcpy(&v, p, 2); return v; }

static int find_le(const uint8_t *d, size_t n, uint32_t *mz, uint32_t *le)
{
    size_t i;
    for (i = 0; i + 0x40 < n; i++) {
        uint32_t lf;
        if (d[i] != 'M' || d[i + 1] != 'Z') continue;
        lf = ru32(d + i + 0x3C);
        if (i + lf + 2 <= n && d[i + lf] == 'L' && d[i + lf + 1] == 'E') {
            *mz = (uint32_t)i; *le = (uint32_t)(i + lf); return 1;
        }
    }
    return 0;
}

int game_load(void)
{
    uint8_t *d;
    size_t n = 0;
    uint32_t mz, le, hdr, npages, pagesz, lastsz, data_off, obj_off, nobj, fpt_off, frt_off;
    uint32_t i, p;
    struct { uint32_t vsize, base, flags, pmi, np; } obj[8];
    uint32_t bases[8];
    const uint8_t *frt;
    uint8_t *map;
    d = read_exe(&n);
    if (!d) return -1;
    if (!find_le(d, n, &mz, &le)) { fprintf(stderr, "not an LE executable\n"); free(d); return -1; }
    hdr = le;
    npages = ru32(d + hdr + 0x14);
    pagesz = ru32(d + hdr + 0x28);
    lastsz = ru32(d + hdr + 0x2C);
    obj_off = ru32(d + hdr + 0x40);
    nobj = ru32(d + hdr + 0x44);
    fpt_off = ru32(d + hdr + 0x68);
    frt_off = ru32(d + hdr + 0x6C);
    data_off = mz + ru32(d + hdr + 0x80);
    if (nobj > 8 || pagesz != 0x1000) { fprintf(stderr, "unexpected LE layout\n"); free(d); return -1; }
    for (i = 0; i < nobj; i++) {
        const uint8_t *o = d + hdr + obj_off + 24 * i;
        obj[i].vsize = ru32(o); obj[i].base = ru32(o + 4); obj[i].flags = ru32(o + 8);
        obj[i].pmi = ru32(o + 12); obj[i].np = ru32(o + 16);
    }
    map = plat_map_fixed(0x20000000u, (GAME_SPAN + 0xFFF) & ~0xFFFu);
    if (!map) map = plat_map_any((GAME_SPAN + 0xFFF) & ~0xFFFu);
    if (!map) { fprintf(stderr, "cannot map %u bytes for the game image\n", (unsigned)GAME_SPAN); free(d); return -1; }
    memset(map, 0, GAME_SPAN);
    game_image = map;
    game_slide = (int32_t)((uintptr_t)map - OBJ1_BASE);
    game_code = map;
    game_code_size = OBJ1_SIZE;
    for (i = 0; i < nobj; i++) bases[i] = obj[i].base + (uint32_t)game_slide;

    for (i = 0; i < nobj; i++) {
        uint32_t k;
        for (k = 0; k < obj[i].np; k++) {
            uint32_t page = obj[i].pmi - 1 + k;
            uint32_t foff = data_off + page * pagesz;
            uint32_t sz = page + 1 == npages ? lastsz : pagesz;
            uint32_t at = obj[i].base + k * pagesz - OBJ1_BASE;
            if (foff + sz > n) sz = n > foff ? (uint32_t)(n - foff) : 0;
            if (at + sz > GAME_SPAN) sz = GAME_SPAN > at ? GAME_SPAN - at : 0;
            memcpy(map + at, d + foff, sz);
        }
    }

    frt = d + hdr + frt_off;
    for (p = 0; p < npages; p++) {
        uint32_t pos = ru32(d + hdr + fpt_off + 4 * p);
        uint32_t end = ru32(d + hdr + fpt_off + 4 * (p + 1));
        uint32_t oi, k, page_lin = 0;
        const uint8_t *rec = frt + pos, *rend = frt + end;
        for (oi = 0; oi < nobj; oi++) {
            if (obj[oi].pmi - 1 <= p && p < obj[oi].pmi - 1 + obj[oi].np) {
                k = p - (obj[oi].pmi - 1);
                page_lin = obj[oi].base + k * pagesz;
                break;
            }
        }
        while (rec + 5 <= rend) {
            uint8_t src = rec[0], flg = rec[1];
            int16_t so;
            uint32_t tobj, toff, stype, slin, tlin;
            uint8_t *dst;
            rec += 2;
            if (src & 0x20) { fprintf(stderr, "LE: list fixup not supported\n"); break; }
            memcpy(&so, rec, 2); rec += 2;
            if ((flg & 3) != 0) { fprintf(stderr, "LE: import fixup\n"); break; }
            if (flg & 0x40) { tobj = ru16(rec); rec += 2; }
            else tobj = *rec++;
            stype = src & 0xF;
            if (stype == 2) toff = 0;
            else if (flg & 0x10) { toff = ru32(rec); rec += 4; }
            else { toff = ru16(rec); rec += 2; }
            if (tobj == 0 || tobj > nobj) continue;
            slin = page_lin + (int32_t)so;
            tlin = bases[tobj - 1] + toff;
            if (slin < OBJ1_BASE || slin + 6 > OBJ1_BASE + GAME_SPAN) continue;
            dst = map + (slin - OBJ1_BASE);
            if (stype == 7 || stype == 6) {
                memcpy(dst, &tlin, 4);
                if (stype == 6) memset(dst + 4, 0, 2);
            } else if (stype == 8) {
                uint32_t v = tlin - (slin + (uint32_t)game_slide + 4);
                memcpy(dst, &v, 4);
            }
        }
    }
    free(d);
    if (GAME_ADDR(ORIG_START)[0] != 0xEB) {
        fprintf(stderr, "LE load: entry %02x, expected EB (Watcom start)\n", GAME_ADDR(ORIG_START)[0]);
        return -1;
    }
    TRACE("loaded HOCKEY.EXE at %p slide %+d\n", (void *)map, (int)game_slide);
    return 0;
}
