# Homework 04
CrazyIvanPro

[TOC]
## 3. 70

### A.

| offset          | 0      | 8         |
| --------------- | ------ | --------- |
| **`struct e1`** | `e1.p` | `e1.y`    |
| **`struct e2`** | `e2.x` | `e2.next` |



### B.

since `sizeof(pointer) = 8` and `sizeof(long_int) = 8`, the answer is $ 16 $.



### C.
+ Assembly
```assembly
# void proc(union ele *up)
# up in %rdi
proc:
  movq 8(%rdi), %rax	# %rax = *(up + 1);	// may e next or y

  movq (%rax), %rdx		# %rdx = *(*(up + 1));	// %rax must be a pointer
  					   # // %rdx = *(up->e2.next)
					   # // %rdx may be p or x

  movq (%rdx), %rdx		# // %rdx was a pointer, then 
  					   # %rdx = *(*(up->e2.next).e1.p)； 
  					   # // since p is a pointer to long, 
  					   # // %rdx is a long int；

  subq 8(%rax), %rdx	# // %rax is a pointer, 
  					   # %rdx = *(up->e2.next + 1);
  					   # // %rax may be y or p；
  					   # // since %rdx is long int, %rax must be y:
					   # %rdx -= *(up->e2.next).e1.y;
						
  movq %rdx, (%rdi)		# //	%rdi hasn't been changed, 
  					   # up->e2.x = %rdx;
 					   # up->e2.x = *(*(up->next).e1.p) - *(up->e2.next).e1.y;
  
  ret
```



+ C
```c
void proc(union ele *up) {
  /* up->  = *(    ) -     ; */
  up->e2.x = *( *(up->e2.next).e1.p ) - *(up->e2.next).e1.y;
}
```


+ The answer is:
  - `e2.x`
  - `*(up->e2.next).e1.p`
  - `*(up->e2.next).e1.y`



## 4. 45
### A.
+ Code of Q 4.7:
```assembly
pushtest:
  movq	%rsp, %rax
  pushq	%rsp
  popq	%rdx
  subq	%rdx, %rax
  ret
```

+ We found that `pushtest` always return 0, which means instruction push the old value of %rsp into stack, then subtract 0x8;

+ Therefore, **the assembly code below doesn't describe the behaviour of `pushq %rsp` correctly**.
```assembly
  subq	$8, %rsp
  movq	REG, (%rsp)
```



### B.
Here is the code:
```assembly
  movq	REG, (%rsp)
  subq	$8, %rsp
```