# Homework 02
CrazyIvanPro

[TOC]
## 3. 58
```c
long decode2(long x, long y, long z) {
    long t1 = y - z;				// t1 in %rsi
    long t2 = t1 * x;				// t2 in %rdi
    long t3 = (t1 << 63) >> 63;		// t3 in %rax
    long tval = t2 ^ t3;				// tval in %rax
    return tval;
}
```

+ Simplized Version:
```c
long decode2(long x, long y, long z) {
    long t = y - z;						// t in %rsi   
    return (t * x) ^ ((t << 63) >> 63);
}
```



## 3. 59

$$
ux = 2^{64} \cdot x_{63} + x
$$
$$
uy = 2^{64} \cdot y_{63} + y
$$

+ $ux$ and $uy$ are unsigned long integer. Respectively they have the same bit-level representation with x and y;

+ $x_{63}$ is the $63^{th}$ bit of x, $y_{63}$ is the $63^{th}$ bit of y;

$$
\begin{align}
ux \cdot uy &= (2^{64} \cdot x_{63} + x) \cdot (2^{64} \cdot y_{63} + y) \\
		  \\
		  & = 2^{128} \cdot x_{63} \cdot y_{63} + 2^{64} \cdot (y_{63} \cdot x + x_{63} \cdot y) + x \cdot y \\
		  \\
		  & = 2^{64} \cdot (y_{63} \cdot x + x_{63} \cdot y) + x \cdot y \,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,(mod \,\,2^{128}) \\\\
x \cdot y & = ux \cdot uy - 2^{64} \cdot (y_{63} \cdot x + x_{63} \cdot y),\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,(mod \,\,2^{128}) \\\\
		  & = ux \cdot uy \,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,\,(mod \,\,2^{64})

\end{align}
$$

```assembly
# void store_prod(int128_t* dest, int64_t x, int64_t y)
# dest in %rdi, x in %rsi, y in %rdx
store_prod:
	movq %rdx, %rax     # %rax = y
	cqto             	# y = (int128_t) y, %rdx = - y_{63}
	movq %rsi, %rcx     # %rcx = x

	sarq $63, %rcx		# %rcx = x >> 63 
						# if x >= 0, %rcx == 0; else if x < 0, %rcx == -1;
						# %rcx = - x_{63}

	# mulq is an single operand operator
	imulq %rax, %rcx    # %rcx = y * %rcx = -y * x_{63}
	imulq %rsi, %rdx    # %rdx = -x * y_{63}
	addq %rdx, %rcx     # %rcx = x * y + y * -x_{63}
	mulq %rsi           # %rdx:%rax <-- ux * uy

	# lower 64 bits are same for x * y and ux * uy
	addq %rcx, %rdx		# %rdx = ux * uy(high 64 bits) - 2^{64}(x_{63}*y + y_{63}*x)
	
	movq %rax, (%rdi)   # set lower 64bits
	movq %rdx, 8(%rdi)  # set higher 64bits
	ret
```



## 3. 60

```assembly
# long long (long x, int n)
# x in %rdi, n in %esi
  loop:
	movl	%esi, %ecx		# %ecx = %esi;	// = n;
	movl	$1, %edx		# %edx = 1;
	movl	$0, %eax		# %eax = 0;
	jmp		.L2				# goto .L2;
  .L3:
	movq	%rdi, %r8		# %r8 = %rdi;	// = x;
	andq	%rdx, %r8		# %r8 &= %rdx;	// = mask;
	orq		%r8, %rax		# %rax |= %r8;	// = x & mask;
	salq	%cl, %rdx		# %rdx <<= %cl;	// = n;
  .L2:
	testq	%rdx, %rdx		
	jne		.L3				# if (rdx != 0) goto .L3
	rep; ret
```
### A

| value  | register |
| ------ | -------- |
| x      | %rdi     |
| n      | %esi     |
| result | %rax     |
| mask   | %rdx     |

### B

```c
int result = 0;
int mask = 1;
```

### C

```c
mask != 0;
```

### D

```c
mask <<= n;
```

### E

```c
result |= (x & mask);
```

### F
```c
long loop(long x, int n) {
  long result = 0;
  long mask;
  for (mask = 1; mask != 0; mask <<= n) {
    result |= (x & mask);
  }
  return result;
}
```



## 3. 62
+ Assembly
```assembly
# p1 in %rdi, p2 in %rsi, action in %edx
  .L8:	MODE_E
	movl	$27, %eax		# %rax = 27;
	ret
  .L3:	MODE_A
	movq	(%rsi), %rax	# %rax = M[%rsi];
	movq	(%rdi), %rdx	# %rdx = M[%rdi];
	movq	%rdx, (%rsi)	# M[%rsi] = %rdx;
	ret
  .L5:	MODE_B
	movq	(%rdi), %rax	# %rax = M[%rdi];
	addq	(%rsi), %rax	# %rax += M[%rsi];
	movq	%rax, (%rdi)	# M[%rdi] = %rax;
	ret
  .L6:	MODE_C
	movq	$59, (%rdi)		# M[%rdi] = 59;
	movq	(%rsi), %rax	# %rax = M[%rsi];
	ret
  .L7:	MODE_D
	movq	(%rsi), %rax	# %rax = M[%rsi];
	movq	%rax, (%rdi)	# M[%rdi] = %rax;
	movl	$27, %eax		# %rax = 27;
	ret
  .L9:	default
	movl	$12, %eax		# %rax = 12;
	ret
```

+ C
```c
/* Enumerated type creates set of constants numbered 0 and upward */
typedef enum {MODE_A, MODE_B, MODE_C, MODE_D, MODE_E} mode_t;

long switch3(long *p1, long *p2, mode_t action)
{
	long result = 0;
	switch(action) {
	case MODE_A: 
            result = *p2;
            *p2 = *p1;
            break;
	case MODE_B:
            *p1 += *p2;
            result = *p1;
            break;
	case MODE_C:
            *p1 = 59;
            result = *p2;
            break;
	case MODE_D:
            *p1 = *p2;
            result = 27;
            break;
	case MODE_E:
            result = 27;
            break;
	default:
            result = 12;
            break;

	}
	return result;
}
```



## 3. 64
### A
```c
Type_t D[R][S][T];

L = sizeof(Type_t);

Type_t * Xd = &D[0][0][0];

&D[i][j][k] == Xd + L * (S * T * i + T * j + k);
```


### B
```assembly
# long store_ele(long i, long j, long k, long \*dest)
# i in %rdi, j in %rsi, k in %rdx, dest in %rcx
  store_ele:
	leaq	(%rsi,%rsi,2), %rax		# %rax = 3 * %rsi;
	leaq	(%rsi,%rax,4), %rax		# %rax = %rsi + 4 * %rax; // rax = 13 * j;
	movq	%rdi, %rsi				# %rsi = %rdi;			
	salq	$6, %rsi				# %rsi <<= 6;				
	addq	%rsi, %rdi				# %rdi += %rsi;	// i = 65 * i;
	addq	%rax, %rdi				# %rdi += %rax;	// i += 13 * j;
	addq	%rdi, %rdx				# %rdx += %rdi;	// %rdx = k + 65 * i + 13 * j;
	movq	A(,%rdx,8), %rax		# %rax = M[A + 8 * %rdx];	
	movq	%rax, (%rcx)			# M[%rcx] = %rax;
	movl	$3640, %eax				# %rax = 3640;  // 8 * R * S * T = 3640; 
	ret
```
$$
T = 13
$$

$$
S \times T = 65
$$

$$
8 \times R \times S \times T = 3640
$$

+ So the answer is: 
  - $R = 7$
  - $S = 5$
  - $T = 13$

