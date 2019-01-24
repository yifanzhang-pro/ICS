/*
 * CS:APP Data Lab
 *
 * <Please put your name and userid here>
 *
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:

  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code
  must conform to the following style:

  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>

  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.


  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function.
     The max operator count is checked by dlc. Note that '=' is not
     counted; you may use as many of these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 *
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce
 *      the correct answers.
 */


#endif
/* Copyright (C) 1991-2016 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses Unicode 8.0.0.  Version 8.0 of the Unicode Standard is
   synchronized with ISO/IEC 10646:2014, plus Amendment 1 (published
   2015-05-15).  */
/* We do not support C11 <threads.h>.  */
/*
 * changeHigh : if low 16-bit of x == y, then let high 16-bit of z = x,
 * otherwise let
 *     high 16-bit of z = y. return z.
 *   Example: changeHigh(0xaaaabbbb, 0xbbbbaaaa, 0xcccccccc) = 0xbbbbcccc,
 *   changeHigh(0xaaaabbbb, 0xddddbbbb, 0xcccccccc) = 0xaaaacccc
 *   Legal ops: ! ~ & ^ | << >>
 *   Max ops: 24
 *   Rating: 1
 */
int changeHigh(int x, int y, int z) {
	/* exploit ability of shifts to compute equality */
	int mask, equality;
	int z_l, x_h, y_h;
	mask = (0xff << 8) | 0xff;    // mask == 0xffff
	equality = !((x ^ y) & mask); // if low 16-bit of x == y
	z_l = z & mask;               // low 16 bit of z
	x_h = x & (~mask);            // hight 16 bit of x
	y_h = y & (~mask);            // hight 16 bit of y
	return z_l | (x_h << ((!equality) << 4)) | (y_h << (equality << 4));
}

/*
 * newOp - define a new bit-wise opertor PKU : 1PKU1 = 1, 1PKU0 = 1,
 * 0PKU1 = 0, 0PKU0 = 1
 *   input int x, y return xPKUy(bit-wise)
 *   Legal ops: ! ~ & ^ |
 *   Max ops: 6
 *   Rating: 1
 */
int newOp(int x, int y) {
	/* true table */
	return x | (~y);
}

/*
 * onlyOne - input x, y return 1 if only one bit of the two numbers is
 * different, return 0 otherwise
 *   Examples onlyOne(12, 14) = 1, onlyOne(12, 15) = 0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int onlyOne(int x, int y) {
	/* xor */
	int xor,b;
	xor = ~(x ^ y);         // equal turns to 1, neq turns to 0
	b = ~(xor | (xor + 1)); // (count 0f 1) sub 1
	return (!b) & !!(x ^ y);
}

/*
 * truncAvg - Compute the average of the two numbers rounded toward 0
 *          without causing overflow
 *   Example: truncAvg(1, 10) = 5,
 *            truncAvg(-3, 6) = 1,
 *            truncAvg(-3, -4) = -3,
 *            truncAvg(0x7fffffff, 0x7fffffff) = 0x7fffffff
 *   Legal ops: ! ~ & | ^ + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int truncAvg(int x, int y) {
	/* divide the addition into two parts, watch out Tmin */
	int ans1, ans2, if_less_zero, sign_sum;
	ans1 = (x & y);
	ans2 = (x ^ y);
	sign_sum = (x + y) >> 31;
	if_less_zero = (ans1 | ((sign_sum) & ans2)) >> 31;
	return ans1 + (ans2 >> 1) + (ans2 & 1 & if_less_zero);
}

/*
 * absVal - absolute value of x
 *   Example: absVal(-1) = 1.
 *   You may assume -TMax <= x <= TMax
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 10
 *   Rating: 2
 */
int absVal(int x) {
	/* notice that 0x00000000 ^ x == x, 0xffffffff ^ x = ~x */
	int sign_x = x >> 31;
	return (x ^ sign_x) + !!(sign_x);
}

/*
 * subOK - Determine if can compute x-y without overflow
 *   Example: subOK(0x80000000,0x80000000) = 1,
 *            subOK(0x80000000,0x70000000) = 0,
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 2
 */
int subOK(int x, int y) {
  	/*
   	 * consider Tmin
  	 */
	int sign_x,sign_minus_y,minus_y,if_tmin_y;
	int sum, sign_sum, negover, posover;

	minus_y = (~y) + 1;
	if_tmin_y = !(y ^ (1 << 31));
	sum = x + minus_y;
	sign_x = x >> 31;
	sign_minus_y = minus_y >> 31;
	sign_sum = sum >> 31;
	negover = (sign_x & sign_minus_y & (!sign_sum));
	posover = (!sign_x & !sign_minus_y & sign_sum);

	return (!if_tmin_y) ^ (negover | posover);
}

/*
 * fullAdd - 4-bits add using bit-wise operations only.
 *   (0 <= x, y < 16)
 *   Example: fullAdd(12, 7) = 3,
 *            fullAdd(7, 8) = 15,
 *   Legal ops: ~ | ^ & << >>
 *   Max ops: 30
 *   Rating: 2
 */
int fullAdd(int x, int y) {
	/* Implementation of FullAdder with halfAdder */
	int xor,x_and_y;
	int carry1, carry2, carry3, half0, half1, half2, half3, ans;

	xor = x ^ y;
	x_and_y = x & y;
	ans = half0 = (xor & 1);
	half1 = (xor & 2);
	half2 = (xor & 4);
	half3 = (xor & 8);
	carry1 = (x_and_y & 1) << 1;
	carry2 = (((carry1 ) & half1) | ((x_and_y) & 2)) << 1;
	carry3 = (((carry2 ) & half2) | ((x_and_y) & 4)) << 1;
	ans = ans | (half1 ^ carry1) | (half2 ^ carry2) | (half3 ^ carry3);

	return ans;
}

/*
 * theMax - the same as max(x, y)
 *   Example: max(4,5) = 5, max(6,3) = 6
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 28
 *   Rating: 3
 */
int theMax(int x, int y) {
	/* Discussion with cases */
	int sign_x, sign_y, if_tmin_y, sub, sign_sub, if_y;

	sign_x = x >> 31; 			// 0 or 0xffffffff
	sign_y = y >> 31; 			// 0 or 0xffffffff
	if_tmin_y = (!(y ^ (1 << 31))) << 31; 	// 0 or 0xffffffff
	sub = x + (~y)+1;
	sign_sub = sub >> 31; 			// 0 or 0xffffffff
	
	if_y = ((~sign_x) & (~sign_y) & (sign_sub)) |\
	((sign_x) & (sign_y) & (sign_sub) & (~if_tmin_y)) |\
	(sign_x & (~sign_y));

	return (if_y & y) + ((~if_y) & x);
}

/*
 * palindrome - return 1 if x is palindrome in binary form,
 *   return 0 otherwise
 *   A number is palindrome if it is the same when reversed
 *   YOU MAY USE BIG CONST IN THIS PROBLEM, LIKE 0xFFFF0000
 *   YOU MAY USE BIG CONST IN THIS PROBLEM, LIKE 0xFFFF0000
 *   YOU MAY USE BIG CONST IN THIS PROBLEM, LIKE 0xFFFF0000
 *   Example: palindrome(0xff0000ff) = 1,
 *            palindrome(0xff00ff00) = 0
 *   Legal ops: ~ ! | ^ & << >> +
 *   Max ops: 40
 *   Rating: 4
 */
int palindrome(int x) {
  	/* divide and conquer */
	int reverse = x;

	reverse = (((reverse & 0xffff0000) >> 16) & 0x0000ffff) | \
	((reverse & 0x0000ffff) << 16);
	reverse = (((reverse & 0xff00ff00) >>  8) & 0x00ffffff) | \
	((reverse & 0x00ff00ff) <<  8);
	reverse = (((reverse & 0xf0f0f0f0) >>  4) & 0x0fffffff) | \
	((reverse & 0x0f0f0f0f) <<  4);
	reverse = (((reverse & 0xcccccccc) >>  2) & 0x3fffffff) | \
	((reverse & 0x33333333) <<  2);
	reverse = (((reverse & 0xaaaaaaaa) >>  1) & 0x7fffffff) | \
	((reverse & 0x55555555) <<  1);

	return !(reverse ^ x);
}

/*
 * distance - calculate how many bits are different between x and y
 *   Example: distance(0xabcdabcd, 0xabcddcba) = 12,
 *            distance(0x0000ffff, 0xffff0000) = 32,
 *   Legal ops: ~ ! | ^ & << >> +
 *   Max ops: 40
 *   Rating: 4
 */
int distance(int x, int y) {
	/* divide and conquer */
	int xor, mask55, mask33, mask0f, mask0000ffff, mask00ff00ff;

	xor = x ^ y;
	mask55 = (0x55) | (0x55 << 8);
	mask55 = mask55 | (mask55 << 16); // mask55 = 0x55555555
	mask33 = (0x33) | (0x33 << 8);
	mask33 = mask33 | (mask33 << 16); // mask33 = 0x33333333
	mask0f = (0x0f) | (0x0f << 8);
	mask0f = mask0f | (mask0f << 16); // mask0f = 0x0f0f0f0f
	mask0000ffff = 0xff | (0xff << 8);
	mask00ff00ff = 0xff | (0xff << 16);

	xor = ((xor >> 1) & mask55) + (xor & mask55);
	xor = ((xor >> 2) & mask33) + (xor & mask33);
	xor = ((xor >> 4) & mask0f) + (xor & mask0f);
	xor = ((xor >> 8) & mask00ff00ff) + (xor & mask00ff00ff);
	xor = ((xor >> 16) & mask0000ffff) + (xor & mask0000ffff);

	return xor;
}

/*
 * divSix - calculate x / 6 without using /
 *   Example: divSix(6) = 1,
 *            divSix(2147483647) = 357913941,
 *   Legal ops: ~ ! | ^ & << >> +
 *   Max ops: 40
 *   Rating: 4
 */

int divSix(int x) {
	/* 1/6 = 1/8 + 1/32 + 1/128 + ... */
	int mainbody1, mainbody2, mainbody3, mainbody4;	// main part of ans
	int ans, loss;
	int x2;
	int sign_x = (x >> 31); // 0 or 1

	mainbody1 = (x >> 3) + (x >> 5);
	mainbody1 = mainbody1 + (mainbody1 >> 4);
	mainbody1 = mainbody1 + (mainbody1 >> 8);
	mainbody1 = mainbody1 + (mainbody1 >> 16);
	ans = mainbody1;

	x2 = x + (~((mainbody1 << 2) + (mainbody1 << 1)));	// remainder
	mainbody2 = x2;
	mainbody2 = (mainbody2 >> 3);
	ans += mainbody2;
	loss = x2 + (~((mainbody2 << 2) + (mainbody2 << 1))) + 2;

	mainbody3 = loss >> 3;
	ans += mainbody3;
	loss = (loss & 0x7) + (mainbody3 << 1);

	mainbody4 = !((loss >> 1) ^ 3);	// if loss == 6 || loss == 7
	ans += mainbody4;
	ans += sign_x & !(!loss | !(loss ^ 6));
	return ans;
}

/*
 * modThree - calculate x mod 3 without using %.
 *   Example: modThree(12) = 0,
 *            modThree(2147483647) = 1,
 *            modThree(-8) = -2,
 *   Legal ops: ~ ! | ^ & << >> +
 *   Max ops: 60
 *   Rating: 4
 */
int modThree(int x) {
	/* divide and conquer, implemented with mask */
	int sign_x, abs_x, ans, if_3;
	int mask0000ffff = (0xff << 8) | 0xff;

	sign_x = (x >> 31); // 0 or 0x11111111
	abs_x = (x ^ sign_x) + !!(sign_x);
	ans = ((abs_x >> 16) & mask0000ffff) + (abs_x & (mask0000ffff));
	ans = (ans >> 8) + (ans & 0xff);
	ans = (ans >> 4) + (ans & 0x0f);
	ans = (ans >> 4) + (ans & 0x0f);
	ans = (ans >> 2) + (ans & 0x03);
	ans = (ans >> 2) + (ans & 0x03);
	if_3 = !!(ans ^ 0x3);		// if ans == 3, if_3 = 1, else if_3 = 0
	ans = ((~if_3) + 1) & ans;	// if ans == 3, ans = 0
	return (sign_x & ((~ans) + 1)) + (ans & (~sign_x));
}

/*
 * float_f2i - Return bit-level equivalent of expression (int) f
 *   for floating point argument f.
 *   Argument is passed as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Anything out of range (including NaN and infinity) should return
 *   0x80000000u.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 3
 */
int float_f2i(unsigned uf) {
	/* consider different cases */
	int BIAS, INDEFINITE;
	int s, e, frac;
	int E, M, a;
	int if_denormalized;
	BIAS = 127;
	INDEFINITE = 0x80000000;

	s = uf >> 31; // logical shift
	s = (-2*s) + 1;
	e = (uf << 1) >> 24;
	frac = (uf << 9) >> 9;
	M = frac;

	if_denormalized = !e; // 0 or 1

	if(if_denormalized){
		return 0;
	} else if (e == 0xff) {
		return INDEFINITE;
	} else {
		E = e - BIAS;
		M = M + (1 << 23);
		a = E - 23;
		if (a >= 8){
			return INDEFINITE;
		} else if (a >= 0){
			return s * (M << a);
		} else if (a >=-23 ){
			return s * (M >> (-a));
		} else {
			return 0;
		}
	}
}
/*
 * float_half - Return bit-level equivalent of expression 0.5*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 3
 */
unsigned float_half(unsigned uf) {
	/* consider different cases, watch out rounding to nearest even */
	int s, e, frac;
	int frac_bias;
	int if_denormalized;

	s = uf >> 31; // logical shift
	e = (uf << 1) >> 24;
	frac = (uf << 9) >> 9;

	if_denormalized = !e;
	frac_bias = (1 & frac & (frac >> 1));

	if(if_denormalized){
		return (s << 31) | ((frac + frac_bias) >> 1);
	} else if (e == 0xff) {
		return uf;
	} else {
		if (e != 1) {
			e = e - 1;
			return frac | (s << 31) | (e << 23);
		} else {
			return (s << 31) | (((frac + frac_bias) >> 1)+0x400000);
		}
	}
}

/*
 * float_construct - Return bit-level equivalent of expression float(x*2^y),
 *   you should treat the input as integers: if x = 2, y = 3, you should re
 *   turn a float value of 16
 *   we ensure the constructed number can be represented in float:
 *   X[-65535, 65535], y[-160, 60]
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point value.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 90
 *   Rating: 4
 */
unsigned float_construct(int x, int y) {
	/* consider different cases, watch out rounding to nearest even */
	int BIAS;
	int abs_x, i;
	int E;
	int s, e, frac, shift;
	BIAS = 127;

	if(x==0){
		return 0;
	}
	s = x & 0x80000000;
	abs_x = (x>0)?(x):(-x);

	i = 31;
	while ((i--) && !((1 << i)& abs_x)) {
		;
	}
	E = y + i;

	if (E < -126){
		shift = 149 + y;
		if(shift >= 0){
			frac = abs_x << shift;
		} else {
			int k = -shift;
			int bias1 = 1 & (abs_x >> (k-1)) & (abs_x >> k);
			int bias2 = 1 & (abs_x >> (k-1)) &\
				    ((abs_x % (1 << k)) > (1<<(k-1)));
			frac = (abs_x >> k) + (bias1 | bias2);
		}
		return frac | s;
	} else {
		e = (E + BIAS) << 23;
		frac = (abs_x - (1<< i)) << (23 - i);
		return e | frac | s;
	}
}
