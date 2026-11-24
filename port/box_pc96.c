/* SPDX-License-Identifier: MIT
 * Copyright (c) 2026 abdulahmad and contributors
 *
 * The box for NHL 96 PC (overbar/box_cd.h): the big box, the manual, the technical reference card, the jewel case and the cards;
 * the first time, the CD into the 486's CD-ROM drive and the game's own installer (SETUP.EXE) on its monitor, screen by screen. The
 * installer's screens are pictures in the player's art folder (box-art/pc96/), like the scans. */
#include <overbar/box_cd.h>

static const bx_cd_step STEPS[] = {
    { CD_TEXT, "d:", 1, 0, 0 },
    { CD_TEXT, "D:\\>", 0, 500, 0 },
    { CD_TEXT, "setup", 1, 0, 0 },
    { CD_SCREEN, "inst96a", 0, 2400, 0 },        /* Select a language: English */
    { CD_SCREEN, "inst96b", 0, 2200, 1 },        /* Welcome to NHL '96: Read me, Install */
    { CD_SCREEN, "inst96c", 0, 2400, 1 },        /* Select sound card */
    { CD_SCREEN, "inst96d", 0, 2400, 1 },        /* Install type: path C:\NHL96, Minimum / Recommended / Optimum */
    { CD_COPY, "inst96copy0", 0, 500, 1 },       /* Copying files ... please wait: the disc spins up, the count goes down */
    { CD_COPY, "inst96copy1", 0, 600, 0 }, { CD_COPY, "inst96copy2", 0, 700, 0 }, { CD_COPY, "inst96copy3", 0, 700, 0 },
    { CD_COPY, "inst96copy4", 0, 700, 0 }, { CD_COPY, "inst96copy5", 0, 700, 0 }, { CD_COPY, "inst96copy6", 0, 700, 0 },
    { CD_COPY, "inst96copy7", 0, 700, 0 }, { CD_COPY, "inst96copy8", 0, 700, 0 }, { CD_COPY, "inst96copy9", 0, 700, 0 },
    { CD_COPY, "inst96copy10", 0, 700, 0 },
    { CD_SCREEN, "inst96done", 0, 2400, 0 },     /* Install was successful. Type HOCKEY at the command prompt to play. Ok */
    { CD_CLS, 0, 0, 150, 1 },
    { CD_TEXT, "C:\\NHL96>", 0, 1200, 0 },
    { CD_TEXT, "hockey", 1, 0, 0 },
};
const bx_cd_game BOX_PC96 = { "pc96", "NHL 96", 44, 12, STEPS, (int)(sizeof STEPS / sizeof STEPS[0]) };
