/*
 * @Author: CrazyIvanPro
 * @Date: 2018-12-30 08:00:07
 * @LastEditors: CrazyIvanPro
 * @LastEditTime: 2019-01-24 19:39:31
 * @Description: main.c
 */
#include <curl/curl.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include "crawler.h"

int main(int argc, char **argv) {
    if (argc < 2) {
        printf("Usage %s: <url>\n", argv[0]);
    }
    printf("Started...\n");

    // define Crawler from struct
    Crawler myCrawler = {argv[1],
                         (char **)malloc(MAX_LINKS * (sizeof(char *)))};

    getContent(myCrawler);

    my_write(myCrawler.parsedUrls);  // write first MAX_LINK_SIZE Urls
}
