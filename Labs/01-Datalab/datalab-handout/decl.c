#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define TMin INT_MIN
#define TMax INT_MAX

#include "btest.h"
#include "bits.h"

test_rec test_set[] = {
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
 {"changeHigh", (funct_t) changeHigh, (funct_t) test_changeHigh, 3, "! ~ & ^ | + << >>", 24, 1,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},
 {"newOp", (funct_t) newOp, (funct_t) test_newOp, 2, "! ~ & ^ | +", 6, 1,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},
 {"onlyOne", (funct_t) onlyOne, (funct_t) test_onlyOne, 2, "! ~ & ^ | + << >>", 16, 2,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},
  {"truncAvg", (funct_t) truncAvg, (funct_t) test_truncAvg, 2,
      "! ~ & ^ | << >>", 12, 3, {{TMin, TMax},{TMin, TMax},{TMin, TMax}}},
 {"absVal", (funct_t) absVal, (funct_t) test_absVal, 1, "! ~ & ^ | + << >>", 10, 4,
  {{-TMax, TMax},{TMin,TMax},{TMin,TMax}}},
 {"subOK", (funct_t) subOK, (funct_t) test_subOK, 2,
    "! ~ & ^ | + << >>", 20, 3,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},
 {"fullAdd", (funct_t) fullAdd, (funct_t) test_fullAdd, 2,
    "~ & ^ | << >>", 30, 2,
  {{0, 15}, {0, 15}, {TMin, TMax}}},
 {"theMax", (funct_t) theMax, (funct_t) test_theMax, 2, "! ~ & ^ | + << >>", 28, 3,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},
 {"palindrome", (funct_t) palindrome, (funct_t) test_palindrome, 1,
   "! ~ & ^ | + << >>", 40, 3,
  {{TMin,TMax},{TMin,TMax},{TMin,TMax}}},
 {"distance", (funct_t) distance, (funct_t) test_distance, 2, "! ~ & ^ | + << >>", 40, 4,
  {{TMin, TMax},{TMin,TMax},{TMin,TMax}}},
 {"divSix", (funct_t) divSix, (funct_t) test_divSix, 1,
   "! ~ & ^ | + << >>", 40, 4,
  {{TMin,TMax},{TMin,TMax},{TMin,TMax}}},
 {"modThree", (funct_t) modThree, (funct_t) test_modThree, 1,
    "~ ! | ^ & << >> +", 60, 4,
  {{TMin, TMax}, {TMin, TMax}, {TMin, TMax}}},
 {"float_f2i", (funct_t) float_f2i, (funct_t) test_float_f2i, 1,
    "$", 30, 4,
     {{1, 1},{1,1},{1,1}}},
 {"float_half", (funct_t) float_half, (funct_t) test_float_half, 1,
    "$", 30, 4,
     {{1, 1},{1,1},{1,1}}},
 {"float_construct", (funct_t) float_construct, (funct_t) test_float_construct, 2,
    "$", 90, 4,
     {{-65535, 65535},{-160, 60},{1,1}}},
  {"", NULL, NULL, 0, "", 0, 0,
   {{0, 0},{0,0},{0,0}}}
};
