/*
 * @Author: CrazyIvanPro
 * @Date: 2018-12-30 07:57:52
 * @LastEditors: CrazyIvanPro
 * @LastEditTime: 2019-01-24 19:41:10
 * @Description: io.h
 */
#ifndef __IO_H__
#define __IO_H__
#include "csapp.h"

#define OUTPUT_PATH "output/links.txt"
/* 
 * openFileAndWrite - opens a file based on a path string passed in
 * and writes the url which has a match to the search term to the
 * file.
 */
int open_and_write(char *path, char *url);

#endif /* __IO_H__ */
/* $end io.h */