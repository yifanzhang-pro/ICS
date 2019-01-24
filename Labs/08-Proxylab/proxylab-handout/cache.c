/*
 * cache.c - Functions for cache
 *
 * @Author: CrazyIvanPro
 * @Date: 2018-12-28 21:51:39
 * @LastEditTime: 2018-12-29 17:19:19
 */
/* $begin cache.c */
#include "cache.h"

/************************************
 * Wrappers for P and V for reader and writer
 ***********************************/
/*
 * P_reader - Wrapper function for P on reader
 */
void P_reader(int idx, cache_t *cachep) {
    P(&(cachep->entry[idx].mutex_readcnt));
    cachep->entry[idx].readcnt++;
    if (cachep->entry[idx].readcnt == 1) /* First in */
        P(&cachep->entry[idx].mutex_w);
    V(&(cachep->entry[idx].mutex_readcnt));
}

/*
 * V_reader - Wrapper function for V on reader
 */
void V_reader(int idx, cache_t *cachep) {
    P(&(cachep->entry[idx].mutex_readcnt));
    cachep->entry[idx].readcnt--;
    if (cachep->entry[idx].readcnt == 0) /* Last out */
        V(&cachep->entry[idx].mutex_w);
    V(&(cachep->entry[idx].mutex_readcnt));
}

/*
 * P_reader - Wrapper function for P on reader
 */
void P_writer(int idx, cache_t *cachep) { P(&(cachep->entry[idx].mutex_w)); }

/*
 * V_reader - Wrapper function for V on reader
 */
void V_writer(int idx, cache_t *cachep) { V(&(cachep->entry[idx].mutex_w)); }

/************************************
 * Implementation on Cache 
 ***********************************/
/*
 * init_cache - init the cache
 */
void init_cache(cache_t *cachep) {
    cachep->total_rank = 0;
    /* Init eache object in cache */
    int i;
    for (i = 0; i < CACHE_OBJECT_COUNT; i++) {
        cachep->entry[i].rank = 0;
        cachep->entry[i].is_empty = true;
        Sem_init(&(cachep->entry[i].mutex_w), 0, 1);
        Sem_init(&(cachep->entry[i].mutex_readcnt), 0, 1);
        cachep->entry[i].readcnt = 0;
    }
    return;
}

/*
 * find_obj - find object in cache,
 *  if found, returns the index for entry of object in cache,
 *  if not found, return -1
 */
int find_obj(char *url, cache_t *cachep) {
    int i;
    for (i = 0; i < CACHE_OBJECT_COUNT; i++) {
        P_reader(i, cachep);
        if (!cachep->entry[i].is_empty && !strcmp(url, cachep->entry[i].url)) {
            V_reader(i, cachep);
            return i; /* Found */
        }
        V_reader(i, cachep);
    }
    return -1; /* Haven't found */
}

/*
 * cache_obj - cache object into cache
 */
void cache_obj(char *url, char *content, cache_t *cachep) {
    /* Invalid request */
    if (strlen(content) >= MAX_OBJECT_SIZE || strlen(url) >= MAXLINE) return;

    /* Find the object in cache to be evicted */
    int idx = __INT_MAX__;
    int i;
    for (i = 0; i < CACHE_OBJECT_COUNT; i++) {
        P_reader(i, cachep);
        if (cachep->entry[i].is_empty) { /* found a empty block */
            idx = i;
            V_reader(i, cachep);
            break;
        }
        /* Search for the earliest object */
        if (cachep->entry[i].rank < idx) {
            idx = cachep->entry[i].rank;
        }
        V_reader(i, cachep);
    }

    /* Write data into cache */
    P_writer(idx, cachep);

    strncpy(cachep->entry[idx].content, content, strlen(content));
    strncpy(cachep->entry[idx].url, url, strlen(url));
    cachep->entry[idx].is_empty = false;
    cachep->total_rank++;
    cachep->entry[idx].rank = cachep->total_rank;

    V_writer(idx, cachep);
    return;
}
/* $end cache.c */