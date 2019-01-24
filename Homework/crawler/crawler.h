/*
 * @Author: CrazyIvanPro
 * @Date: 2018-12-30 08:18:08
 * @LastEditors: CrazyIvanPro
 * @LastEditTime: 2019-01-24 19:38:33
 * @Description: crawler.h
 */
#include <tidy/tidy.h>
#include <tidybuffio.h>

#ifndef __CRAWLER_H__
#define __CRAWLER_H__
#include "csapp.h"
#include "io.h"

#define BUFFER_SIZE 2048;
#define MAX_LINKS 1024
#define MAX_URL_LEN 2048

// define the Crawler struct that holds data about the web traversal
#define CrawlerTag
typedef struct CrawlerTag {
    char *url;
    char **parsedUrls;

} Crawler;

// 1 = success
// 0 = failure
int my_write(char **content);

// get the website content with libcurl
int getContent(Crawler crawler);

// return an array of links
// take page content in HTML
void parse(TidyNode node, char **output);

size_t bufferCallback(char *buffer, size_t size, size_t nmemb,
                      TidyBuffer *tidyBuffer);


#endif /* __CRAWL_H__ */
       /* $end crawler.h */