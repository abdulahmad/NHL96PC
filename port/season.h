/* SPDX-License-Identifier: MIT
 * Copyright (c) 2026 abdulahmad and contributors
 *
 * Online season hooks for the SDL2 host. The game stays in the DOS box; Overbar
 * copies the league folder as a team file. Overlay Season / File screens come
 * from Overbar (ob_season_set).
 */
#ifndef PORT_SEASON_H
#define PORT_SEASON_H

struct ob_host;
struct ob_net;

void port_season_setup(struct ob_host *h);
void port_season_free(void);
void port_season_bind_net(struct ob_net *n);
void port_season_unbind_net(void);
void port_season_poll(void);
int port_season_map_dos(const char *dos, char *out, int size);
int port_season_diskfree(int letter, unsigned *total_clusters, unsigned *free_clusters,
                         unsigned *sectors_per_cluster, unsigned *bytes_per_sector);

#endif
