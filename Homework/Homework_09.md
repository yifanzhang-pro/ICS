# Homework 09
CrazyIvanPro

[TOC]

## 9. 11

### A

| 13   | 12   | 11   | 10   | 09   | 08   | 07   | 06   | 05   | 04   | 03   | 02   | 01   | 00   |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0    | 0    | 0    | 0    | 1    | 0    | 0    | 1    | 1    | 1    | 1    | 1    | 0    | 0    |

### B

| Parameters  | Values |
| ----------- | ------ |
| VPN         | 0x09   |
| TLBI        | 0x01   |
| TLBT        | 0x02   |
| hit?        | No     |
| page falut? | No     |
| PPN         | 0x17   |

### C

| 11   | 10   | 09   | 08   | 07   | 06   | 05   | 04   | 03   | 02   | 01   | 00   |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0    | 1    | 0    | 1    | 1    | 1    | 1    | 1    | 1    | 1    | 0    | 0    |

### D

| Parameters | Values |
| ---------- | ------ |
| CO         | 0x00   |
| CI         | 0x0F   |
| CT         | 0x17   |
| hit?       | No     |
| value      | -----  |



## 9. 12

### A

| 13   | 12   | 11   | 10   | 09   | 08   | 07   | 06   | 05   | 04   | 03   | 02   | 01   | 00   |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0    | 0    | 0    | 0    | 1    | 1    | 1    | 0    | 1    | 0    | 1    | 0    | 0    | 1    |

### B

| Parameters  | Values |
| ----------- | ------ |
| VPN         | 0x0E   |
| TLBI        | 0x02   |
| TLBT        | 0x03   |
| hit?        | No     |
| page falut? | No     |
| PPN         | 0x11   |


### C

| 11   | 10   | 09   | 08   | 07   | 06   | 05   | 04   | 03   | 02   | 01   | 00   |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0    | 1    | 0    | 0    | 0    | 1    | 1    | 0    | 1    | 0    | 0    | 1    |

### D

| Parameters | Values |
| ---------- | ------ |
| CO         | 0x01   |
| CI         | 0x0A   |
| CT         | 0x11   |
| hit?       | No     |
| value      | -----  |



## 9.13

### A

| 13   | 12   | 11   | 10   | 09   | 08   | 07   | 06   | 05   | 04   | 03   | 02   | 01   | 00   |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1    | 0    | 0    | 0    | 0    | 0    | 0    |

### B

| Parameters  | Values |
| ----------- | ------ |
| VPN         | 0x01   |
| TLBI        | 0x01   |
| TLBT        | 0x00   |
| hit?        | No     |
| page falut? | Yes    |
| PPN         | -----  |

### C

+ None

### D

+ None



## 9.14

```c
#include "csapp.h"

void test(char* filename, char* str);
int write_in(char* filename, char* str);

int main() {
  write_in("hello.txt", "Hello, world!");
  test("hello.txt", "Hello, world!");

  struct stat stat;
  int fd;
  char* bufp;
  size_t size;

  fd = Open("hello.txt", O_RDWR, 0);
  fstat(fd, &stat);
  size = stat.st_size;

  bufp = Mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, 0);
  *bufp = 'J';
  Munmap(bufp, size);

  test("hello.txt", "Jello, world!");
  return 0;
}

void test(char* filename, char* str) {
  int fd;
  char buf[20];
  fd = Open(filename, O_RDONLY, 0);
  Read(fd, buf, strlen(str));
  assert( !strncmp(buf, str, strlen(str)) );
}

int write_in(char* filename, char* str) {
  int fd;
  umask(DEF_UMASK);
  fd = Open(filename, O_WRONLY|O_CREAT|O_TRUNC, DEF_MODE);
  Write(fd, str, strlen(str));
  Close(fd);
}
```

