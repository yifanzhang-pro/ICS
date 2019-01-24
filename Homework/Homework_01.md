# Homework 01
CrazyIvanPro

[TOC]
## 2.88
$$
v = (-1)^s \cdot M \cdot 2 ^ E
$$

| Form A      |             |             |             |
| ----------- | ----------- | ----------- | ----------- |
| **Bits**    | E           | M           | **Value**   |
| 1 01110 001 | -1  | $1.001_{2}$ | $-9 \times 2^{-4}$ |
| 0 10110 101 | 7    | $1.101_2$     | $13 \times 2^4$|
| 1 00111 110 | -8     | $1.110_2$     | $-7 \times 2^{-10}$ |
| 0 00000 101 | -14  | $0.101_2$     | $5 \times 2^{-17}$ |
| 1 11011 000 | 12    | $1.000_2$     | $-1 \times 2^{12}$ |
| 0 11000 100 | 9    | $1.100_2$     | $3 \times 2^8$ |

| Form B      |             |             |             |
| ----------- | ----------- | ----------- | ----------- |
| **Bits**    | E           | M           | **Value**   |
| 1 0110 0010 | -1  | $1.0010_{2}$ | $-9 \times 2^{-4}$ |
| 0 1110 1010 | 7    | $1.1010_2$     | $13 \times 2^4$|
| 1 0000 0111 | -6    | $0.0111_2$     | $-7 \times 2^{-10}$ |
| 0 0000 0001 | -6   | $0.0001_2$ | $1 \times 2^{-10}$ |
| 1 1110 1111 | 7   | $1.1111_2$ | $-31 \times 2^{3}$ |
| 0 1111 0000 | ____ | ____ | $+\infty$ |

+ So the answer is below:
| Format A    |                     | Format B    |                    |
| ----------- | --------            | --------    | -----              |
| Bits        | Value               | Bits        | Value              |
| 1 01110 001 | $-9 \times 2^{-4}$  | 1 0110 0010 | $-9 \times 2^{-4}$ |
| 0 10110 101 | $13 \times 2^4$     | 0 1110 1010 | $13 \times 2^4$    |
| 1 00111 110 | $-7 \times 2^{-10}$ | 1 0000 0111 | $-7 \times 2^{-10}$ |
| 0 00000 101 | $5 \times 2^{-17}$  | 0 0000 0001 | $1 \times 2^{-10}$ |
| 1 11011 000 | $-1 \times 2^{12}$  | 1 1110 1111 | $-31 \times 2^{3}$ |
| 0 11000 100 | $3 \times 2^8$      | 0 1111 0000 | $+\infty$          |



## 2.91
### (A)
```c
0x40490FDB
0100 0000 0100 1001 0000 1111 1101 1011
0 10000000 10010010000111111011011
```
| 4    | 0    | 4    | 9    | 0    | F    | D    | B    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0100 | 0000 | 0100 | 1001 | 0000 | 1111 | 1101 | 1011 |

| s    | exp      | frac                    |
| ---- | -------- | ----------------------- |
| 0    | 10000000 | 10010010000111111011011 |

| s    | E      | M                    |
| ---- | -------- | ----------------------- |
| 0    | 1 | 1.10010010000111111011011 |


```c
v = 0b11.0010010000111111011011
```
$$
v = 11.0010010000111111011011_2
$$


### (B)
+ From Question 2.83, we know that given n  = 0.yyyyy... :
```c
n = 0.yyyyy...

(n << k) == y.yyyyy... == Y + n

(n << k) - n == Y

n == Y/(2^k - 1)
```

+ Consider y = 101, Y = 5, k = 3, we can figure out that n = $\frac{5}{7}$.
+ So $\frac{22}{7}$ = `0b11.001001...[001]`

$$
\frac{22}{7} = 11.001001...[001]_2
$$


### (C)
$$
\begin{align}
v             & = 11.00100100001111110110110000000000_2 \\

\frac{22}{7}  & = 11.001001001001001001001001001...[001]_2
\end{align}
$$

+ From the 9th bit.



## 2.93
+ Function float-absval: 

```c
/*
 * float-absval: Compute |f|. If f is NaN then return f.
 */
float_bits float_absval(float_bits f) {
	unsigned s = f >> 31;
	unsigned exp = f >> 23 & 0xFF;
	unsigned frac = f & 0x7FFFFF;

	int is_NAN = (exp == 0xFF) && (frac != 0);
	if (is_NAN) {
		return f;
	}

	return 0x7fffffff & f;
}
```

+ Test program: 
```c
#include <stdio.h>
#include <math.h>

typedef unsigned char *byte_pointer;
typedef unsigned float_bits;

/* Floating point helper */
static float u2f(unsigned u)
{
	union {
		unsigned u;
		float f;
	} v;
	v.u = u;
	return v.f;
}

void show_bytes(byte_pointer start, size_t len) {
	size_t i;
	for (i = 0; i < len; i++)
		printf("%.2x", start[i]);
	printf("\n");
}

void show_float(float x) {
	show_bytes((byte_pointer)&x, sizeof(float));
}

void show_unsigned(unsigned x) {
	show_bytes((byte_pointer)&x, sizeof(float));
}

float_bits float_absval(float_bits f) {
	unsigned s = f >> 31;
	unsigned exp = f >> 23 & 0xFF;
	unsigned frac = f & 0x7FFFFF;

	int is_NAN = (exp == 0xFF) && (frac != 0);
	if (is_NAN) {
		return f;
	}
	return 0x7fffffff & f;
}

void compare(unsigned i) {
	float f = u2f(i);
	float abs_f = fabsf(f);
	float *p_abs_f = &abs_f;
	float_bits bit_test_f = float_absval(i);
	unsigned *bit_p_abs_f = (unsigned *)p_abs_f;
	int equality = (*bit_p_abs_f == bit_test_f);
	if (!equality) {
		printf("f:\t");
		show_float(f);
		printf("fabsf:\t");
		show_float(abs_f);
		printf("test:\t");
		show_unsigned(bit_test_f);
		printf("\n");
	}
}

int main() {
	for (unsigned i = 0x00000000; i < 0xffffffff; i++) {
		compare(i);
	}
	compare(0xffffffff);
	return 0;
}
```

+ from the output, we can figure out that there exist some differences:
  - Function `fabsf()` will change the sign bit of NaN to 0. 
```c
fabsf(0xffffffff) == 0x7fffffff
```

+ Notice that because of Little Endian conventions, the least significant byte has the lowest address. Therefore, the output of `show_bytes` is arranged according to the Little Endian conventions.