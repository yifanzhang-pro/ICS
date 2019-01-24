/*
 * @Author: CrazyIvanPro
 * @Date: 2018-12-30 23:28:53
 * @LastEditors: CrazyIvanPro
 * @LastEditTime: 2019-01-24 19:40:32
 * @Description: io.c
 */
#include "io.h"

static int flag = 0;
/* 
 * openFileAndWrite - opens a file based on a path string passed in
 * and writes the url which has a match to the search term to the
 * file.
 */
int open_and_write(char *path, char *url) {
    FILE *fp;
    // Open file based on path in append mode
    if (flag) {
        fp = Fopen(path, "a");
    } else {
        flag = 1;
        fp = Fopen(path, "w");
    }

    // Write url to file
    fprintf(fp, "%s\n", url);
    // Close the file
    fclose(fp);
    return 0;
}
