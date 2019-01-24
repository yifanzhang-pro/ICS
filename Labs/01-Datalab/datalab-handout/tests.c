/* Testing Code */

#include <limits.h>
#include <math.h>

/* Routines used by floation point test code */

/* Convert from bit level representation to floating point number */
float u2f(unsigned u) {
  union {
    unsigned u;
    float f;
  } a;
  a.u = u;
  return a.f;
}

/* Convert from floating point number to bit-level representation */
unsigned f2u(float f) {
  union {
    unsigned u;
    float f;
  } a;
  a.f = f;
  return a.u;
}

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
int test_changeHigh(int x, int y, int z) {
  if ((x & 0x0000ffff) == (y & 0x0000ffff))
    return (x & 0xffff0000) | (z & 0x0000ffff);
  return (y & 0xffff0000) | (z & 0x0000ffff);
}
int test_newOp(int x, int y) {
  return (x & y) | (x & ~y) | (~x & ~y);
}
int test_onlyOne(int x, int y) {
  int i, j = 0;
    for (i = 0; i < 32; i++)
        if ((x&(1<<i)) != (y&(1<<i)))
            ++j;
    return j == 1;
}
int test_truncAvg(int x, int y) {
    if ((x > 0) ^ (y > 0)) // different signs
        return (x + y) / 2;
    // same signs
    int ans = x / 2 + y / 2;
    if (x > 0 && (x & 1) && (y & 1))
        return ans + 1;
    if (x < 0 && (x & 1) && (y & 1))
        return ans - 1;
 return ans;
}
int test_absVal(int x) {
  return (x < 0) ? -x : x;
}
int test_subOK(int x, int y)
{
  long long ldiff = (long long) x - y;
  return ldiff == (int) ldiff;
}
int test_fullAdd(int x, int y) {
    return (x + y) & 0xF;
}
int test_theMax(int x, int y) {
  return x > y ? x : y;
}
int test_palindrome(int x) {
    int ori = x, temp = 0, i;
 for (i = 0;i < 32;++i)
 {
  temp <<= 1;
  temp |= x & 1;
        x >>= 1;
 }
    return ori == temp;
}
int test_distance(int x, int y) {
  int result = 0;
  int i;
  for (i = 0; i < 32; i++)
    result += (((x >> i) & 0x1) != ((y >> i) & 0x1));
  return result;
}
int test_divSix(int x) {
    return x / 6;
}
int test_modThree(int x) {
    return x % 3;
}
int test_float_f2i(unsigned uf) {
  float f = u2f(uf);
  int x = (int) f;
  return x;
}
unsigned test_float_half(unsigned uf) {
  float f = u2f(uf);
  float hf = 0.5*f;
  if (isnan(f))
    return uf;
  else
    return f2u(hf);
}
unsigned test_float_construct(int x, int y) {
 float f = (float)x;
 if (y > -64)
  f = f * u2f((127 + y) << 23);
 else
 {
  f = f * u2f((127 - 64) << 23);
  f = f * u2f((127 + y + 64) << 23);
 }
 return f2u(f);
}
