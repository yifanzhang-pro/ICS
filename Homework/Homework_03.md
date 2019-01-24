# Homework 03
CrazyIvanPro

[TOC]
## 3. 68

+ Struct 1:

| Struct 1 |              |      | |
| -------- | ------------ | ---- | -------- |
| **Data** | `int x[A][B]` | -- (align) | `long y` |
| **Size** | $4 \times A \times B$ | $0\leq L_0 \leq 7$ | $8$ |



+ Struct 2: 

| Struct 1 |                 |                     |         |              |                    |          |
| -------- | --------------- | ------------------- | ------- | ------------ | ------------------ | -------- |
| **Data** | `char array[B]` | -- (align)          | `int t` | `short s[A]` | -- (align)         | `long u` |
| **Size** | $B$             | $0 \leq L_1 \leq 3$ | $4$     | $2 \times A$ | $0\leq L_2 \leq 7$ | $8$      |



+ Assembly: 

```assembly
# void setVal(str1* p, str2* q)
# p in %rdi, q in %rsi

setVal:

  movslq 8(%rsi), %rax	# q->t in 8(%rsi), so 8 = B + L_1; 

  addq 32(%rsi), %rax	# q->u in 32(%rsi), so 32 = B + L_1 + 4 + 2 * A + L_2;

  movq %rax, 184(%rdi)	# p->y in 184(%rdi), so 184 = 4 * A * B + L_0;
  
  ret
```
+ We have:
$$
0 \leq L_0 \leq 7,\,\,\,\,\,0 \leq L_1 \leq 3,\,\,\,\,\,0 \leq L_2 \leq 7
$$

$$
B + L_1 = 8
$$

$$
B + L_1 + 4 + 2 \times A + L_2 = 32
$$

$$
4 \times A \times B + L_0 = 184
$$

+ Which means:

$$
5 \leq B \leq 8
$$

$$
6 \leq A \leq 10
$$

$$
45 \leq A \times B \leq 46
$$

+ The only solution is below:
$$
A = 9
$$
$$
B = 5
$$


## 3. 69
+ C:
```c
typedef struct {
  int first;
  a_struct a[CNT];
  int last;
} b_struct;

void test(long i, b_struct *bp) {
  int n = bp->first + bp->last;
  a_struct *ap = &bp->a[i];
  ap->x[ap->idx] = n;
}
```



+ b_struct:

| b_struct |              |      | | | |
| -------- | ------------ | ---- | -------- | -------- | -------- |
| **Data** | `int first` | -- (align) | `a_struct a[CNT]` | -- (align) | `int last` |
| **Size** | $4$ | $L_0 = 4$ | $40\times CNT$ | $L_1 = 0$ | $4$ |



+ a_struct:

| b_struct |              |      |
| -------- | ------------ | ---- |
| **Data** | `long idx` | `long x[4]` |
| **Size** | $8$ | $32$ |



+ Assembly:
```assembly
# void test(long i, b_struct *bp)
# i in %rdi, bp in %rsi
test:
  mov 0x120(%rsi), %ecx			# %ecx = bp->last, which in M[bp + 0x120];
  							  # which means 40 * CNT + 8 = 0x120; CNT = 7;
  add (%rsi), %ecx			    # %ecx = bp->first + bp->last;
  
  lea (%rdi,%rdi,4), %rax		# %rax = 5 * i;
  lea (%rsi,%rax,8), %rax		# %rax = bp + 40 * i;

  mov 0x8(%rax), %rdx		    # %rdx = M[bp + 40 * i + 8];
  							  # ap = bp + 40 * i + 0x8;
							  # %rdx = *ap;
							  # so size of a_struct = 40, aligned by 8;
							  # alignment L_0 = 4;
							  # movq uses all 8 byte data, so type of idx is long; 

  movslq %ecx, %rcx             # long n = bp->first + bp->last, n in %rcx;

  mov %rcx, 0x10(%rax,%rdx,8)	# M[%rax + 8 * rdx + 16] = M[ap + 8 * rdx + 0x8] = %rcx; 
  							  # ap + 0x8 = &(ap->x);
  							  # 8 * rdx means long x[], ap->idx = rdx;
  							  # while sizeof a_struct = 40, so long x[4];
  retq
```
### A
$$
40 \times CNT + 4 + 4  = 288
$$

+ So: 
$$
CNT = 7
$$

### B
```c
typdef struct {
    long idx;
    long x[4];
} a_struct;
```