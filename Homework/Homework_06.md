# Homework 06
CrazyIvanPro

[TOC]
## 7. 6

+ C code:
```c
/*
 * 7_6.c
 */

extern int buf[];

int* bufp0 = &buf[0];
static int* bufp1;

static void incr() {
  static int count=0;
  count++;
}

void swap() {
  int temp;

  incr();
  bufp1 = &buf[1];
  temp = *bufp0;
  *bufp0 = *bufp1;
  *bufp1 = temp;
}
```



+ Use `objdump` and `readelf` to analyze it:
```sh
linux> gcc -c 7_6.c
linux> objdump -t 7_6.o
linux> readelf -s 7_6.o
```



+ OUTPUT:
```assembly
7_6.o:     file format elf64-x86-64

SYMBOL TABLE:
0000000000000000 l    df *ABS*	0000000000000000 7_6.c
0000000000000000 l    d  .text	0000000000000000 .text
0000000000000000 l    d  .data	0000000000000000 .data
0000000000000000 l    d  .bss	0000000000000000 .bss
0000000000000000 l    d  .data.rel	0000000000000000 .data.rel
0000000000000000 l     O .bss	0000000000000008 bufp1
0000000000000000 l     F .text	0000000000000016 incr
0000000000000008 l     O .bss	0000000000000004 count.1797
0000000000000000 l    d  .note.GNU-stack	0000000000000000 .note.GNU-stack
0000000000000000 l    d  .eh_frame	0000000000000000 .eh_frame
0000000000000000 l    d  .comment	0000000000000000 .comment
0000000000000000 g     O .data.rel	0000000000000008 bufp0
0000000000000000         *UND*	0000000000000000 buf
0000000000000016 g     F .text	000000000000004d swap
```



```sh
Symbol table '.symtab' contains 15 entries:
   Num:    Value          Size Type    Bind   Vis      Ndx Name
     0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT  UND 
     1: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS 7_6.c
     2: 0000000000000000     0 SECTION LOCAL  DEFAULT    1 
     3: 0000000000000000     0 SECTION LOCAL  DEFAULT    3 
     4: 0000000000000000     0 SECTION LOCAL  DEFAULT    4 
     5: 0000000000000000     0 SECTION LOCAL  DEFAULT    5 
     6: 0000000000000000     8 OBJECT  LOCAL  DEFAULT    4 bufp1
     7: 0000000000000000    22 FUNC    LOCAL  DEFAULT    1 incr
     8: 0000000000000008     4 OBJECT  LOCAL  DEFAULT    4 count.1797
     9: 0000000000000000     0 SECTION LOCAL  DEFAULT    8 
    10: 0000000000000000     0 SECTION LOCAL  DEFAULT    9 
    11: 0000000000000000     0 SECTION LOCAL  DEFAULT    7 
    12: 0000000000000000     8 OBJECT  GLOBAL DEFAULT    5 bufp0
    13: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT  UND buf
    14: 0000000000000016    77 FUNC    GLOBAL DEFAULT    1 swap
```




+ **Here is the answer**:

  |       | .symtab entry? | Symbol type | Module | Section |
  | ----- | ------- | -------- | ------ | ------- |
  | buf   | Yes            | external | m      | .data   |
  | bufp0 | Yes            | global   | swap   | .data   |
  | bufp1 | Yes            | local    | swap   | .bss    |
  | swap  | Yes            | global   | swap   | .text   |
  | temp  | No             | ------   | -----  | ------  |
  | incr  | Yes            | local    | swap   | .text   |
  | count | Yes            | local    | swap   | .bss    |





## 7. 7
+ foo5.c
```c
/* foo5.c */
#include <stdio.h>
void f(void);

int y = 15212;                 
int x = 15213;                 
  
int main()
{
        f();
        printf("x = 0x%x y = 0x%x \n", x, y);
        return 0;
}
```



+ **Modified** bar5.c:
```c
/* bar5.c */
double x;

void f() {
  /* x = -0.0; */
}
```


+ OUTPUT:

```sh
linux> gcc -Wall -Og -o foobar5 foo5.c bar5.c
linux> ./foobar5
/usr/bin/ld: Warning: alignment 4 of symbol `x' in /tmp/ccSt3cxn.o is smaller than 8 in /tmp/ccOZBE2o.o
linux> ./foobar5 
x = 0x3b6d y = 0x3b6c
```





## 7. 9
+ Modify `char main` to `unsigned long main` in `bar6.c`:
```c
/* bar6.c */
#include <stdio.h>

unsigned long main;	/* char --> unsigned long */

void p2() {
  printf("0x%lx\n", main);	/* "0x%x\n" --> "0x%lx\n" */
}
```



+ foo6.c:
```c
/* foo6.c */
void p2(void);

int main() {
  p2();
  return 0;
}
```




+ Complie and Run:
```sh
linux> gcc -Wall -Og -o foobar6 foo6.c bar6.c
linux> ./foobar6
0xffffd1e808ec8348
```



+ Diassemble foobar6:

```sh
linux> objdump -d foobar6 > foobar6.s
```




+ Find `main` in `foobar6.s`:

```assembly
0000000000000690 <main>:
 690:   48 83 ec 08             sub    $0x8,%rsp
 694:   e8 d1 ff ff ff          callq  66a <p2>
 699:   b8 00 00 00 00          mov    $0x0,%eax
 69e:   48 83 c4 08             add    $0x8,%rsp
 6a2:   c3                      retq
 6a3:   66 2e 0f 1f 84 00 00    nopw   %cs:0x0(%rax,%rax,1)
 6aa:   00 00 00 
 6ad:   0f 1f 00                nopl   (%rax)
```



+ We can find that: `0xffffd1e808ec8348` is exactly the instructions content started at function `main` in **little endian**. Because of that, `char main` is `0x48`.

