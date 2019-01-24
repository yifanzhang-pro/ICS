/* 
 * @Author: CrazyIvanPro
 * @Date: 2018-11-15 17:00:54
 * @LastEditors: CrazyIvanPro
 */

#include "cachelab.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <string.h>

#define true 1
#define false 0
#define TMAX 0x7FFFFFFF

typedef struct
{
    int valid;         // valid bit of line
    unsigned long tag; // tag of line
    int count;         // used for LRU, line with minimum count will be evicted
} Line;

typedef struct
{
    Line *plines; // entry of all lines
} Set;

typedef struct
{
    int set_num;  // number of sets
    Set *psets;   // entry of all sets
    int line_num; // number of lines per set
    int cache_count;
} Cache;

/* get_input - get is_verbose, s, E, b, tracefile */
void get_input(int argc, char *argv[], int *is_verbose,
               int *s, int *E, int *b, char *tracefile);

/* get_set_id - returns set id */
unsigned long get_set_id(unsigned long address, int s, int b);

/* get_tag_id - returns tag id */
unsigned long get_tag_id(unsigned long address, int s, int b);

/* init_Cache - initialization of cache with param: s, E, b */
void init_Cache(int s, int E, int b, Cache *cache);

/* load - load data from cache */
void load(Cache *cache, unsigned long address, int size,
          int is_verbose, unsigned long set_id, unsigned long tag_id);

/* store - store data into cache */
void store(Cache *cache, unsigned long address, int size,
           int is_verbose, unsigned long set_id, unsigned long tag_id);

/* modify - modify data in cache */
void modify(Cache *cache, unsigned long address, int size,
            int is_verbose, unsigned long set_id, unsigned long tag_id);

/* Global variables */
int miss_count, hit_count, eviction_count;

/* main function */
int main(int argc, char *argv[])
{
    /* $begin get_input() & initialization of cache */
    miss_count = hit_count = eviction_count = 0;
    char tracefile[1000];
    int s, E, b, is_verbose = 0;
    Cache cache;

    get_input(argc, argv, &is_verbose, &s, &E, &b, tracefile);
    init_Cache(s, E, b, &cache);
    /* $end get_input() & initialization */

    /* $begin fscanf() & manipulation of data in cache */
    char operation_type;
    unsigned long address;
    int size;

    FILE *pFile = fopen(tracefile, "r");
    while (fscanf(pFile, " %c %lx,%d", &operation_type, &address, &size) > 0)
    {
        unsigned long set_id = get_set_id(address, s, b);
        unsigned long tag_id = get_tag_id(address, s, b);
        if (is_verbose == 1)
            printf("%c %lx,%d ", operation_type, address, size);
        if (operation_type == 'L')
            load(&cache, address, size, is_verbose, set_id, tag_id);
        if (operation_type == 'S')
            store(&cache, address, size, is_verbose, set_id, tag_id);
        if (operation_type == 'M')
            modify(&cache, address, size, is_verbose, set_id, tag_id);
        if (is_verbose == 1)
            printf("\n");
    }
    /* $end fscanf() & manipulation of data in cache */

    printSummary(hit_count, miss_count, eviction_count);
    return 0;
}

/*
 * get_input - get is_verbose, s, E, b, tracefile 
 */
void get_input(int argc, char *argv[], int *is_verbose,
               int *s, int *E, int *b, char *tracefile)
{
    char c;
    const char *optstring = "hvs:E:b:t:";
    while ((c = getopt(argc, argv, optstring)) != -1)
    {
        switch (c)
        {
        case 'v':
            *is_verbose = 1;
            break;
        case 's':
            *s = atoi(optarg);
            break;
        case 'E':
            *E = atoi(optarg);
            break;
        case 'b':
            *b = atoi(optarg);
            break;
        case 't':
            strcpy(tracefile, optarg);
            break;
        case 'h':
        default:
            printf("Usage: [-hv] -s <s> -E <E> -b <b> -t <tracefile>\n");
            exit(0);
            break;
        }
    }
    return;
}

/*
 *  init_Cache - initialization of cache with param: s, E, b
 */
void init_Cache(int s, int E, int b, Cache *cache)
{
    cache->cache_count = 0;         // total count of manipulation
    cache->set_num = 2 << s;        // number of sets is 2^s
    cache->line_num = E;            // number of lines is E
    /* allocate memory for cache */
    cache->psets = (Set *)malloc(cache->set_num * sizeof(Set)); 
    for (int i = 0; i < cache->set_num; i++)
    {
        cache->psets[i].plines = (Line *)malloc(E * sizeof(Line));
        for (int j = 0; j < E; j++)
        {
            cache->psets[i].plines[j].valid = false;
            cache->psets[i].plines[j].count = 0;
        }
    }
    // printf("INIT CACHE SUCCEED\n");
    return;
}

/* 
 * get_set_id - returns set id 
 */
unsigned long get_set_id(unsigned long address, int s, int b)
{
    unsigned long mask = (1UL << s) - 1;
    unsigned long set_id = (address >> b) & mask;
    return set_id;
}

/* 
 * get_tag_id - returns tag id 
 */
unsigned long get_tag_id(unsigned long address, int s, int b)
{
    unsigned long tag_id = address >> (b + s);
    return tag_id;
}

/*
 *  manipulate - manipulate data in cache, used for load, store and modify 
 */
void manipulate(Cache *cache, unsigned long address, int size,
                int is_verbose, unsigned long set_id, unsigned long tag_id)
{

    int hit_flag = false;       // flag of hit
    int count_oldest = TMAX;    // MIN{ line[k].count } in this set
    int lines_oldest = TMAX;    // index of the oldest line in this set

    for (int i = 0; i < cache->line_num; i++)
    {
        /* cond is true means hit */
        int cond = cache->psets[set_id].plines[i].valid == true;
        cond = cond && cache->psets[set_id].plines[i].tag == tag_id;
        /* $begin hit */
        if (cond)
        {
            hit_flag = true;
            hit_count++;
            cache->cache_count++;
            cache->psets[set_id].plines[i].count = cache->cache_count;
            if (is_verbose)
                printf("hit");
            break;
        }
        /* $end hit */
    }

    /* $begin miss */
    if (hit_flag == false) // miss, miss_count++
    {
        miss_count++;
        if (is_verbose)
            printf("miss");
        for (int i = 0; i < cache->line_num; i++)
        {
            if (cache->psets[set_id].plines[i].count < count_oldest)
            {
                count_oldest = cache->psets[set_id].plines[i].count;
                lines_oldest = i;
            }

        }
        cache->cache_count++;
        cache->psets[set_id].plines[lines_oldest].count = cache->cache_count;
        cache->psets[set_id].plines[lines_oldest].tag = tag_id;

        /* $begin eviction */
        if (cache->psets[set_id].plines[lines_oldest].valid == true) 
        /* valid block, eviction++ */
        {
            if (is_verbose)
                printf(" eviction");
            eviction_count++;
        }
        else
        {
            cache->psets[set_id].plines[lines_oldest].valid = true;
        }
        /* $end eviction */
    }
    /* $end miss */
    return;
}

/*
 *  load - load data from cache
 */
void load(Cache *cache, unsigned long address, int size,
          int is_verbose, unsigned long set_id, unsigned long tag_id)
{
    manipulate(cache, address, size, is_verbose, set_id, tag_id);
}

/*
 *  store - store data into cache
 */
void store(Cache *cache, unsigned long address, int size,
           int is_verbose, unsigned long set_id, unsigned long tag_id)
{
    manipulate(cache, address, size, is_verbose, set_id, tag_id);
}

/*
 *  modify - modify data in cache
 */
void modify(Cache *cache, unsigned long address, int size,
            int is_verbose, unsigned long set_id, unsigned long tag_id)
{
    manipulate(cache, address, size, is_verbose, set_id, tag_id);
    manipulate(cache, address, size, is_verbose, set_id, tag_id);
}
