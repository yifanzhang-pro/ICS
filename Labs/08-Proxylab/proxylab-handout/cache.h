/*
 * cache.h - prototypes and definitions for the cache
 *
 * @Author: CrazyIvanPro
 * @Date: 2018-12-28 21:08:03
 * @LastEditTime: 2018-12-29 10:09:34
 */

/* $begin cache.h */
#ifndef __CACHE_H__
#define __CACHE_H__
#include "csapp.h"

/* Macros */
/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400
#define CACHE_OBJECT_COUNT 10
#define true 1
#define false 0

/* struct cache_object */
typedef struct {
    int is_empty; /* if is empty */
    int readcnt;  /*count of readers*/
    int rank;     /* used for LRU, block with minimum rank will be evicted */

    sem_t mutex_w;       /*protects accesses to cache */
    sem_t mutex_readcnt; /*protects accesses to readcnt */

    char content[MAX_OBJECT_SIZE]; /* object */
    char url[MAXLINE];             /* url */
} object_t;

/* struct cache */
typedef struct {
    object_t entry[CACHE_OBJECT_COUNT]; /* entry for objects */
    int total_rank;
} cache_t;

/************************************
 * Wrappers for P and V for reader and writer
 ***********************************/
/* P_reader - Wrapper function for P on reader */ 
void P_reader(int idx, cache_t *cachep);
/* V_reader - Wrapper function for V on reader */ 
void V_reader(int idx, cache_t *cachep);
/* P_reader - Wrapper function for P on reader */ 
void P_writer(int idx, cache_t *cachep);
/* V_reader - Wrapper function for V on reader */ 
void V_writer(int idx, cache_t *cachep);

/************************************
 * Implementation on Cache 
 ***********************************/
/* init_cache - init the cache */
void init_cache(cache_t *cachep);
/* find_obj - find object in cache, return index of object entry */
int find_obj(char *url, cache_t *cachep);
/* cache_obj - cache object into cache */
void cache_obj(char *url, char *content, cache_t *cachep);

#endif /* __CACHE_H__ */
/* $end cache.h */
