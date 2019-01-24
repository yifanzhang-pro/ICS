/*
 * @Author: CrazyIvanPro
 * @Date: 2018-12-15 10:01:31
 * @LastEditTime: 2018-12-20 22:45:46
 * @Description: A malloc package implemented with explicit segregated
 * lists method, including some tricks such as MAGIC_NUMBER for place()
 * and list size.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "memlib.h"
#include "mm.h"

/* DEBUG */
// #define DEBUG
#ifdef DEBUG
#define dbg_printf(...) printf(__VA_ARGS__)
#else
#define dbg_printf(...)
#endif

/* do not change the following! */
#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif /* def DRIVER */

/* Basic constants and macros */
#define WSIZE 4                /* Word and header/footer size (bytes) */
#define DSIZE 8                /* Double word size (bytes) */
#define LISTSIZE 14            /* Size of seg lists */
#define INITCHUNKSIZE (1 << 6) /* Initialize heap with this amount (bytes) */
#define CHUNKSIZE (1 << 8)     /* Extend heap by this amount (bytes) */
#define MAX(x, y) ((x) > (y) ? (x) : (y))
#define ALIGN(size, ALGN) ((ALGN) * ((size + (ALGN) + (ALGN - 1)) / (ALGN)))

/* Parameters */
#define MAGIC_PLACE 96      /* Parameter for place decision */
#define MAGIC_LIST_0 8      /* Parameter for List Size */
#define MAGIC_LIST_1 16     /* Parameter for List Size */
#define MAGIC_LIST_2 24     /* Parameter for List Size */
#define MAGIC_LIST_3 48     /* Parameter for List Size */
#define MAGIC_LIST_4 64     /* Parameter for List Size */
#define MAGIC_LIST_5 128    /* Parameter for List Size */
#define MAGIC_LIST_6 256    /* Parameter for List Size */
#define MAGIC_LIST_7 512    /* Parameter for List Size */
#define MAGIC_LIST_8 1024   /* Parameter for List Size */
#define MAGIC_LIST_9 2048   /* Parameter for List Size */
#define MAGIC_LIST_10 4096  /* Parameter for List Size */
#define MAGIC_LIST_11 8192  /* Parameter for List Size */
#define MAGIC_LIST_12 16384 /* Parameter for List Size */

/* Pack a size and allocated bit into a word */
#define PACK(size, alloc) ((size) | (alloc))

/* Read and write a word at address p */
#define GET(p) (*(unsigned int *)(p))
#define PUT(p, val) (*(unsigned int *)(p) = (val))

/* Read the size and allocated fields from address p */
#define GET_SIZE(p) (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp) ((char *)(bp)-WSIZE)
#define FTRP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

/* Given block ptr bp, compute address of next and previous blocks */
#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE(((char *)(bp)-WSIZE)))
#define PREV_BLKP(bp) ((char *)(bp)-GET_SIZE(((char *)(bp)-DSIZE)))

/* Int-Pointer converter */
#define INT2PTR(int_bp) \
    ((char *)((int_bp) ? ((char *)heap_listp + int_bp) : NULL))
#define PTR2INT(bp) \
    ((unsigned int)((bp) ? (unsigned long)((bp) - (long)heap_listp) : 0))

/* Given block ptr bp, compute address of its NEXT and PREV */
#define NEXTL_PTR(bp) ((char *)(bp))
#define PREVL_PTR(bp) ((char *)(bp) + WSIZE)

/* Write and read a pointer bp at address p */
#define PUT_PTR(p, bp) (PUT(p, PTR2INT(bp)))
#define GET_PTR(p) (INT2PTR(GET(p)))

/* Global variables */
static char *heap_listp = NULL; /* Pointer to first block */

/* Function prototypes for internal helper routines */
static inline void *extend_heap(size_t dwords);
static inline void *coalesce(void *bp);
static inline void *find_fit(size_t size);
static inline void *place(void *bp, size_t asize);
static inline void insert_block(char *p);
static inline void delete_block(char *p);
static inline char *get_list_p(size_t size);

/*
 * mm_init - Initialize the memory manager
 */
int mm_init(void) {
    /* Create the initial empty heap */
    if ((heap_listp = mem_sbrk((LISTSIZE + 4) * WSIZE)) == (void *)-1)
        return -1;

    PUT_PTR(heap_listp, 0);                /* LIST_0 */
    PUT_PTR(heap_listp + (1 * WSIZE), 0);  /* LIST_1 */
    PUT_PTR(heap_listp + (2 * WSIZE), 0);  /* LIST_2 */
    PUT_PTR(heap_listp + (3 * WSIZE), 0);  /* LIST_3 */
    PUT_PTR(heap_listp + (4 * WSIZE), 0);  /* LIST_4 */
    PUT_PTR(heap_listp + (5 * WSIZE), 0);  /* LIST_5 */
    PUT_PTR(heap_listp + (6 * WSIZE), 0);  /* LIST_6 */
    PUT_PTR(heap_listp + (7 * WSIZE), 0);  /* LIST_7 */
    PUT_PTR(heap_listp + (8 * WSIZE), 0);  /* LIST_8 */
    PUT_PTR(heap_listp + (9 * WSIZE), 0);  /* LIST_9 */
    PUT_PTR(heap_listp + (10 * WSIZE), 0); /* LIST_10 */
    PUT_PTR(heap_listp + (11 * WSIZE), 0); /* LIST_11 */
    PUT_PTR(heap_listp + (12 * WSIZE), 0); /* LIST_12 */
    PUT_PTR(heap_listp + (13 * WSIZE), 0); /* LIST_13 */
    PUT(heap_listp + (14 * WSIZE), 0);
    PUT(heap_listp + (15 * WSIZE), PACK(DSIZE, 1));
    PUT(heap_listp + (16 * WSIZE), PACK(DSIZE, 1));
    PUT(heap_listp + (17 * WSIZE), PACK(0, 1));

    heap_listp += ((LISTSIZE + 2) * WSIZE);

    /* Extend the empty heap with a free block of CHUNKSIZE bytes */
    if ((extend_heap(INITCHUNKSIZE / WSIZE)) == NULL) return -1;

#ifdef DEBUG
    mm_checkheap(__LINE__);
#endif
    return 0;
}

/*
 * malloc - Allocate a block with at least size bytes of payload
 */
void *malloc(size_t size) {
    size_t asize;      /* Adjusted block size */
    size_t extendsize; /* Amount to extend heap if no fit */
    char *bp;

    if (heap_listp == 0) {
        mm_init();
    }

    /* Ignore spurious requests */
    if (size == 0) return NULL;

    /* Alignment */
    if (size <= DSIZE) {
        asize = 2 * (DSIZE);
    } else {
        asize = ALIGN(size, DSIZE);
    }

    /* Search the free list for a fit */
    if ((bp = find_fit(asize)) != NULL) {
        bp = place(bp, asize);
#ifdef DEBUG
        mm_checkheap(__LINE__);
#endif
        return bp;
    }

    /* No fit found. Get more memory and place the block */
    extendsize = MAX(asize, CHUNKSIZE);
    if ((bp = extend_heap(extendsize / DSIZE)) == NULL) return NULL;
    bp = place(bp, asize);
#ifdef DEBUG
    mm_checkheap(__LINE__);
#endif
    return bp;
}

/*
 * free - Free a block
 */
void free(void *bp) {
    if (bp == 0) return;

    size_t size = GET_SIZE(HDRP(bp));
    if (heap_listp == 0) {
        mm_init();
    }

    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
    PUT_PTR(NEXTL_PTR(bp), NULL);
    PUT_PTR(PREVL_PTR(bp), NULL);
    insert_block(bp);
    coalesce(bp);
#ifdef DEBUG
    mm_checkheap(__LINE__);
#endif
}

/*
 * realloc - Naive implementation of realloc
 */
void *realloc(void *ptr, size_t size) {
    size_t oldsize;
    void *newptr;

    /* If size == 0 then this is just free, and we return NULL. */
    if (size == 0) {
        mm_free(ptr);
        return 0;
    }

    /* If oldptr is NULL, then this is just malloc. */
    if (ptr == NULL) {
        return mm_malloc(size);
    }

    newptr = mm_malloc(size);

    /* If realloc() fails the original block is left untouched  */
    if (!newptr) {
        return 0;
    }

    /* Copy the old data. */
    oldsize = GET_SIZE(HDRP(ptr));
    if (size < oldsize) oldsize = size;
    memcpy(newptr, ptr, oldsize);

    /* Free the old block. */
    mm_free(ptr);

#ifdef DEBUG
    mm_checkheap(__LINE__);
#endif
    return newptr;
}

/*
 * calloc - Naive implementation of realloc
 */
void *calloc(size_t nmemb, size_t size) {
    size_t total_size = nmemb * size;
    void *ptr;
    
    /* Simply call mm_malloc */
    if ((ptr = mm_malloc(total_size)) == NULL) {
        return NULL;
    }

    /* Set to zero */
    memset(ptr, 0, total_size);
    return ptr;
}

/*
 * The remaining routines are internal helper routines
 */

/*
 * extend_heap - Extend heap with free block and return its block pointer
 */
static inline void *extend_heap(size_t words) {
    char *bp;
    /* Allocate an even number of words to maintain alignment */
    size_t size = (words % 2) ? (words + 1) * DSIZE : words * DSIZE;

    if ((long)(bp = mem_sbrk(size)) == -1) return NULL;

    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
    PUT_PTR(NEXTL_PTR(bp), NULL);
    PUT_PTR(PREVL_PTR(bp), NULL);
    PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1));
    insert_block(bp);

    return coalesce(bp);
}

/*
 * coalesce - Boundary tag coalescing. Return ptr to coalesced block
 */
static inline void *coalesce(void *bp) {
    size_t prev_alloc = GET_ALLOC(FTRP(PREV_BLKP(bp)));
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
    size_t size = GET_SIZE(HDRP(bp));

    /*coalesce the block and change the point*/
    if (prev_alloc && next_alloc) { /* 1 & 1 */
        return bp;
    }

    else if (prev_alloc && !next_alloc) { /* 1 & 0 */
        size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
        delete_block(bp);
        delete_block(NEXT_BLKP(bp));
        PUT(HDRP(bp), PACK(size, 0));
        PUT(FTRP(bp), PACK(size, 0));

    } else if (!prev_alloc && next_alloc) { /* 0 & 1 */
        size += GET_SIZE(HDRP(PREV_BLKP(bp)));
        delete_block(bp);
        delete_block(PREV_BLKP(bp));
        PUT(FTRP(bp), PACK(size, 0));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);

    } else { /* 0 * 0 */
        size += GET_SIZE(FTRP(NEXT_BLKP(bp))) + GET_SIZE(HDRP(PREV_BLKP(bp)));
        delete_block(bp);
        delete_block(PREV_BLKP(bp));
        delete_block(NEXT_BLKP(bp));
        PUT(FTRP(NEXT_BLKP(bp)), PACK(size, 0));
        PUT(HDRP(PREV_BLKP(bp)), PACK(size, 0));
        bp = PREV_BLKP(bp);
    }

    insert_block(bp);
    return bp;
}

/*
 * insert_block - Add a free block into segragated lists
 */
static inline void insert_block(char *p) {
    char *root = get_list_p(GET_SIZE(HDRP(p)));
    char *prevl_ptr = root;
    char *nextl_ptr = GET_PTR(root);
    size_t size = GET_SIZE(HDRP(p));
    while (nextl_ptr && (GET_SIZE(HDRP(nextl_ptr)) < size)) {
        prevl_ptr = nextl_ptr;
        nextl_ptr = GET_PTR(NEXTL_PTR(nextl_ptr));
    }
    if (prevl_ptr == root) {
        if (nextl_ptr) { /* CASE 1: root->p->next */
            PUT_PTR(root, p);
            PUT_PTR(NEXTL_PTR(p), nextl_ptr);
            PUT_PTR(PREVL_PTR(p), NULL);
            PUT_PTR(PREVL_PTR(nextl_ptr), p);
        } else { /* CASE 2: root->p */
            PUT_PTR(root, p);
            PUT_PTR(NEXTL_PTR(p), nextl_ptr);
            PUT_PTR(PREVL_PTR(p), NULL);
        }
    } else {
        if (nextl_ptr) { /* CASE 3: ->prev->p->next */
            PUT_PTR(NEXTL_PTR(prevl_ptr), p);
            PUT_PTR(PREVL_PTR(p), prevl_ptr);
            PUT_PTR(NEXTL_PTR(p), nextl_ptr);
            PUT_PTR(PREVL_PTR(nextl_ptr), p);
        } else { /* CASE 4: ->prev->p */
            PUT_PTR(NEXTL_PTR(prevl_ptr), p);
            PUT_PTR(PREVL_PTR(p), prevl_ptr);
            PUT_PTR(NEXTL_PTR(p), nextl_ptr);
        }
    }
}
/*
 * delete_block - Delete block from segragated lists
 */
static inline void delete_block(char *p) {
    char *root = get_list_p(GET_SIZE(HDRP(p)));
    char *prevp = GET_PTR(PREVL_PTR(p));
    char *nextp = GET_PTR(NEXTL_PTR(p));

    if (prevp == NULL) {
        if (nextp != NULL) PUT_PTR(PREVL_PTR(nextp), 0);
        PUT_PTR(root, nextp);
    } else {
        if (nextp != NULL) PUT_PTR(PREVL_PTR(nextp), prevp);
        PUT_PTR(NEXTL_PTR(prevp), nextp);
    }
}

/*
 * find_fit - Find a fit for a block with asize bytes
 */
static inline void *find_fit(size_t size) {
    char *root = get_list_p(size);
    char *list_entry_end = heap_listp - (2 * WSIZE);
    while (root != list_entry_end) {
        char *bp = GET_PTR(root);
        while (bp) {
            if (GET_SIZE(HDRP(bp)) >= size) return bp;
            bp = GET_PTR(NEXTL_PTR(bp));
        }
        root += WSIZE;
    }

    return NULL;
}

/*
 * place - Place block of asize bytes at start of free block bp
 *         and split if remainder would be at least minimum block size
 */
static inline void *place(void *bp, size_t asize) {
    size_t cur_size = GET_SIZE(HDRP(bp));

    delete_block(bp);

    if (cur_size - asize >= (2 * DSIZE)) {
        if (cur_size >= MAGIC_PLACE) {
            PUT(HDRP(bp), PACK(cur_size - asize, 0));
            PUT(FTRP(bp), PACK(cur_size - asize, 0));
            PUT(HDRP(NEXT_BLKP(bp)), PACK(asize, 1));
            PUT(FTRP(NEXT_BLKP(bp)), PACK(asize, 1));
            insert_block(bp);
            return NEXT_BLKP(bp);
        } else {
            PUT(HDRP(bp), PACK(asize, 1));
            PUT(FTRP(bp), PACK(asize, 1));

            PUT(HDRP(NEXT_BLKP(bp)), PACK(cur_size - asize, 0));
            PUT(FTRP(NEXT_BLKP(bp)), PACK(cur_size - asize, 0));
            insert_block(NEXT_BLKP(bp));
        }
    } else {
        PUT(HDRP(bp), PACK(cur_size, 1));
        PUT(FTRP(bp), PACK(cur_size, 1));
    }

    return bp;
}

/*
 * get_list_p - Return the pointer to list within size
 */
static inline char *get_list_p(size_t size) {
    /* 4 8 12 16 24 48 64 128 256 512...4096*/
    /* WANG XH */
    int i;
    if (size <= MAGIC_LIST_0)
        i = 0;
    else if (size <= MAGIC_LIST_1)
        i = 1;
    else if (size <= MAGIC_LIST_2)
        i = 2;
    else if (size <= MAGIC_LIST_3)
        i = 3;
    else if (size <= MAGIC_LIST_4)
        i = 4;
    else if (size <= MAGIC_LIST_5)
        i = 5;
    else if (size <= MAGIC_LIST_6)
        i = 6;
    else if (size <= MAGIC_LIST_7)
        i = 7;
    else if (size <= MAGIC_LIST_8)
        i = 8;
    else if (size <= MAGIC_LIST_9)
        i = 9;
    else if (size <= MAGIC_LIST_10)
        i = 10;
    else if (size <= MAGIC_LIST_11)
        i = 11;
    else if (size <= MAGIC_LIST_12)
        i = 12;
    else
        i = 13;
    return heap_listp + ((i - LISTSIZE - 2) * WSIZE);
}

/*
 * printblock - Print out information of given block.
 *  output:
 *      address
 *      size
 *      if allocated
 *      next free block pointer
 */
static inline void printblock(char *bp) {
    printf("Address:\t%p\n", bp);
    int size = GET_SIZE(HDRP(bp));
    int get_alloc = GET_ALLOC(bp);
    if (get_alloc) {
        printf("ALLOCATED\t");
        printf("size:\t%d\n", size);
    } else {
        printf("FREE\t");
        char *nextp = GET_PTR(NEXTL_PTR(bp));
        printf("size:\t%d\n", size);
        printf("nextp:\t%p\n", nextp);
    }
    printf("\n");
}

/*
 * mm_checkheap - Offer massive information about heap.
 *  Implement based on printblock.
 *  Output include:
 *      1' Whole block list
 *      2' Segragated link lists
 */
inline void mm_checkheap(int lineno) {
    printf("############CHECKHEAP############\n");
    printf("lineno:\t%d\n", lineno);
    printf("heap_listp:\t%p\n", heap_listp);

    printf("############Entire Heap Blocks:\n\n");
    char *bp = heap_listp;
    int num_block = 0;
    while (GET_SIZE(HDRP(bp))) {
        printf("block no:\t%d\n", num_block++);
        printblock(bp);
        bp = NEXT_BLKP(bp);
    }

    printf("############Segragated Lists:\n\n");
    for (int i = 0; i < LISTSIZE; i++) {
        printf("CLASS:\t%d\n", i);
        int count_empty_block = 0;
        char *root = GET_PTR(heap_listp + (i - LISTSIZE - 1) * WSIZE);
        if (!root) {
            printf("NO empty block\n");
            continue;
        } else {
            printf("empty_block num: %d\n", count_empty_block++);
            printblock(root);
        }
        char *bp = GET_PTR(NEXTL_PTR(root));
        while (bp) {
            printf("empty_block num: %d\n", count_empty_block++);
            printblock(bp);
            bp = GET_PTR(NEXTL_PTR(bp));
        }
    }
}
