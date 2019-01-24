/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated bmy counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include <stdio.h>
#include "cachelab.h"
#include "contracts.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. The REQUIRES and ENSURES from 15-122 are included
 *     for your convenience. They can be removed if you like.
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    if (M == 32)
    {
        /* 8 * 8 Blocking */
        for (int block_row = 0; block_row < N; block_row += 8)
        {
            for (int block_col = 0; block_col < M; block_col += 8)
            {
                /* using 8 temp variable to implement transpose in block */
                for (int index_row = block_row; index_row < block_row + 8;
                     index_row++)
                {
                    int temp_0 = A[index_row][block_col + 0];
                    int temp_1 = A[index_row][block_col + 1];
                    int temp_2 = A[index_row][block_col + 2];
                    int temp_3 = A[index_row][block_col + 3];
                    int temp_4 = A[index_row][block_col + 4];
                    int temp_5 = A[index_row][block_col + 5];
                    int temp_6 = A[index_row][block_col + 6];
                    int temp_7 = A[index_row][block_col + 7];

                    B[block_col + 0][index_row] = temp_0;
                    B[block_col + 1][index_row] = temp_1;
                    B[block_col + 2][index_row] = temp_2;
                    B[block_col + 3][index_row] = temp_3;
                    B[block_col + 4][index_row] = temp_4;
                    B[block_col + 5][index_row] = temp_5;
                    B[block_col + 6][index_row] = temp_6;
                    B[block_col + 7][index_row] = temp_7;
                }
            }
        }
    }

    else if (M == 64)
    {
        /* still 8 * 8 Blocking but with some tricky operations */
        for (int block_row = 0; block_row < N; block_row += 8)
        {
            for (int block_col = 0; block_col < M; block_col += 8)
            {
                /*
                 * Divide 8 * 8 Block into 4 4 * 4 mini_block, 
                 * called mini_00, mini_01, mini_10, mini_11 
                 * _________________________        _________________________
                 * |           |           |        |           |           |
                 * | A_mini_00 |*A_mini_01*|        | A_mini_00 |*A_mini_10*|
                 * |           |           |        |           |           |
                 * |___________|___________|  ===>  |___________|___________|
                 * |           |           |        |           |           |
                 * |*A_mini_10*| A_mini_11 |        |*A_mini_01*| A_mini_11 |
                 * |           |           |        |           |           |
                 * |___________|___________|        |___________|___________|
                 */

                /*
                 * STEP 1: move A_mini_00 & A_mini_01 to
                 * B_mini_00 and B_mini_01. 
                 * read through row 
                 */
                for (int index_row = block_row; index_row < block_row + 4;
                     index_row++)
                {
                    /* A_mini_00 */
                    int temp_0 = A[index_row][block_col + 0];
                    int temp_1 = A[index_row][block_col + 1];
                    int temp_2 = A[index_row][block_col + 2];
                    int temp_3 = A[index_row][block_col + 3];
                    /* A_mini_01 */
                    int temp_4 = A[index_row][block_col + 4];
                    int temp_5 = A[index_row][block_col + 5];
                    int temp_6 = A[index_row][block_col + 6];
                    int temp_7 = A[index_row][block_col + 7];
                    
                    /* B_mini_00 */
                    B[block_col][index_row] = temp_0;
                    B[block_col + 1][index_row] = temp_1;
                    B[block_col + 2][index_row] = temp_2;
                    B[block_col + 3][index_row] = temp_3;
                    /*
                     * To obtain higher performance, 
                     * inverse manner is needed. 
                     */   
                    /* B_mini_01 */
                    B[block_col + 0][index_row + 4] = temp_7;
                    B[block_col + 1][index_row + 4] = temp_6;
                    B[block_col + 2][index_row + 4] = temp_5;
                    B[block_col + 3][index_row + 4] = temp_4;
                }

                /* 
                 * STEP 2: move A_mini_10 & A_mini_11 to
                 * B_mini_10 and B_mini_11. 
                 * Read through column. 
                 * To obtain higher performance, inverse manner is needed 
                 */
                for (int index_col = block_col + 3; index_col >= block_col;
                     index_col--)
                {
                    int temp_0, temp_1, temp_2, temp_3;
                    /* A_mini_10 */
                    temp_0 = A[block_row + 4][index_col];
                    temp_1 = A[block_row + 5][index_col];
                    temp_2 = A[block_row + 6][index_col];
                    temp_3 = A[block_row + 7][index_col];

                    int temp_4, temp_5, temp_6, temp_7;
                    /* A_mini_11 */
                    temp_4 = A[block_row + 4][2 * block_col - index_col + 7];
                    temp_5 = A[block_row + 5][2 * block_col - index_col + 7];
                    temp_6 = A[block_row + 6][2 * block_col - index_col + 7];
                    temp_7 = A[block_row + 7][2 * block_col - index_col + 7];

                    /* transpose B_mini_10 and B_mini_01 */
                    B[2 * block_col - index_col + 7][block_row + 0] =
                        B[index_col][block_row + 4];
                    B[2 * block_col - index_col + 7][block_row + 1] =
                        B[index_col][block_row + 5];
                    B[2 * block_col - index_col + 7][block_row + 2] =
                        B[index_col][block_row + 6];
                    B[2 * block_col - index_col + 7][block_row + 3] =
                        B[index_col][block_row + 7];
                    /* B_mini_10 */
                    B[index_col][block_row + 4] = temp_0;
                    B[index_col][block_row + 5] = temp_1;
                    B[index_col][block_row + 6] = temp_2;
                    B[index_col][block_row + 7] = temp_3;
                    /* B_mini_11 */
                    B[2 * block_col - index_col + 7][block_row + 4] = temp_4;
                    B[2 * block_col - index_col + 7][block_row + 5] = temp_5;
                    B[2 * block_col - index_col + 7][block_row + 6] = temp_6;
                    B[2 * block_col - index_col + 7][block_row + 7] = temp_7;
                }
            }
        }
    }

    else // case M == 61
    {
        /* 16 * 16 Blocking */
        int index = 0;
        int temp = 0;
        for (int block_row = 0; block_row < N; block_row += 16)
        {
            for (int block_col = 0; block_col < M; block_col += 16)
            {

                for (int index_row = block_row;
                     (index_row < block_row + 16) && (index_row < N);
                     index_row++)
                {
                    for (int index_col = block_col;
                         (index_col < block_col + 16) && (index_col < M);
                         index_col++)
                    {
                        /* 
                             * diagonal element, stored in temp,
                             * processed after the loop 
                             */
                        if (index_row == index_col)
                        {
                            index = index_row;
                            temp = A[index][index];
                        }
                        /* normal case */
                        else
                        {
                            B[index_col][index_row] =
                                A[index_row][index_col];
                        }
                    }
                    /* only diagonal block will occur situation above */
                    if (block_row == block_col)
                    {
                        B[index][index] = temp;
                    }
                }
            }
        }
    }
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; j++)
        {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc);

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc);
}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; ++j)
        {
            if (A[i][j] != B[j][i])
            {
                return 0;
            }
        }
    }
    return 1;
}
