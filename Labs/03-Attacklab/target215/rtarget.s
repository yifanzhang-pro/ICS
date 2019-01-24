
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400c68 <_init>:
  400c68:	48 83 ec 08          	sub    $0x8,%rsp
  400c6c:	48 8b 05 85 43 20 00 	mov    0x204385(%rip),%rax        # 604ff8 <_DYNAMIC+0x1e0>
  400c73:	48 85 c0             	test   %rax,%rax
  400c76:	74 05                	je     400c7d <_init+0x15>
  400c78:	e8 43 02 00 00       	callq  400ec0 <socket@plt+0x10>
  400c7d:	48 83 c4 08          	add    $0x8,%rsp
  400c81:	c3                   	retq   

Disassembly of section .plt:

0000000000400c90 <strcasecmp@plt-0x10>:
  400c90:	ff 35 72 43 20 00    	pushq  0x204372(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400c96:	ff 25 74 43 20 00    	jmpq   *0x204374(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400c9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400ca0 <strcasecmp@plt>:
  400ca0:	ff 25 72 43 20 00    	jmpq   *0x204372(%rip)        # 605018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400ca6:	68 00 00 00 00       	pushq  $0x0
  400cab:	e9 e0 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400cb0 <__errno_location@plt>:
  400cb0:	ff 25 6a 43 20 00    	jmpq   *0x20436a(%rip)        # 605020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400cb6:	68 01 00 00 00       	pushq  $0x1
  400cbb:	e9 d0 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400cc0 <srandom@plt>:
  400cc0:	ff 25 62 43 20 00    	jmpq   *0x204362(%rip)        # 605028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400cc6:	68 02 00 00 00       	pushq  $0x2
  400ccb:	e9 c0 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400cd0 <strncmp@plt>:
  400cd0:	ff 25 5a 43 20 00    	jmpq   *0x20435a(%rip)        # 605030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400cd6:	68 03 00 00 00       	pushq  $0x3
  400cdb:	e9 b0 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400ce0 <strcpy@plt>:
  400ce0:	ff 25 52 43 20 00    	jmpq   *0x204352(%rip)        # 605038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400ce6:	68 04 00 00 00       	pushq  $0x4
  400ceb:	e9 a0 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400cf0 <puts@plt>:
  400cf0:	ff 25 4a 43 20 00    	jmpq   *0x20434a(%rip)        # 605040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400cf6:	68 05 00 00 00       	pushq  $0x5
  400cfb:	e9 90 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400d00 <write@plt>:
  400d00:	ff 25 42 43 20 00    	jmpq   *0x204342(%rip)        # 605048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400d06:	68 06 00 00 00       	pushq  $0x6
  400d0b:	e9 80 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400d10 <__stack_chk_fail@plt>:
  400d10:	ff 25 3a 43 20 00    	jmpq   *0x20433a(%rip)        # 605050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400d16:	68 07 00 00 00       	pushq  $0x7
  400d1b:	e9 70 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400d20 <mmap@plt>:
  400d20:	ff 25 32 43 20 00    	jmpq   *0x204332(%rip)        # 605058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400d26:	68 08 00 00 00       	pushq  $0x8
  400d2b:	e9 60 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400d30 <memset@plt>:
  400d30:	ff 25 2a 43 20 00    	jmpq   *0x20432a(%rip)        # 605060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400d36:	68 09 00 00 00       	pushq  $0x9
  400d3b:	e9 50 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400d40 <alarm@plt>:
  400d40:	ff 25 22 43 20 00    	jmpq   *0x204322(%rip)        # 605068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400d46:	68 0a 00 00 00       	pushq  $0xa
  400d4b:	e9 40 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400d50 <close@plt>:
  400d50:	ff 25 1a 43 20 00    	jmpq   *0x20431a(%rip)        # 605070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400d56:	68 0b 00 00 00       	pushq  $0xb
  400d5b:	e9 30 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400d60 <read@plt>:
  400d60:	ff 25 12 43 20 00    	jmpq   *0x204312(%rip)        # 605078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400d66:	68 0c 00 00 00       	pushq  $0xc
  400d6b:	e9 20 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400d70 <__libc_start_main@plt>:
  400d70:	ff 25 0a 43 20 00    	jmpq   *0x20430a(%rip)        # 605080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400d76:	68 0d 00 00 00       	pushq  $0xd
  400d7b:	e9 10 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400d80 <signal@plt>:
  400d80:	ff 25 02 43 20 00    	jmpq   *0x204302(%rip)        # 605088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400d86:	68 0e 00 00 00       	pushq  $0xe
  400d8b:	e9 00 ff ff ff       	jmpq   400c90 <_init+0x28>

0000000000400d90 <gethostbyname@plt>:
  400d90:	ff 25 fa 42 20 00    	jmpq   *0x2042fa(%rip)        # 605090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400d96:	68 0f 00 00 00       	pushq  $0xf
  400d9b:	e9 f0 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400da0 <__memmove_chk@plt>:
  400da0:	ff 25 f2 42 20 00    	jmpq   *0x2042f2(%rip)        # 605098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400da6:	68 10 00 00 00       	pushq  $0x10
  400dab:	e9 e0 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400db0 <strtol@plt>:
  400db0:	ff 25 ea 42 20 00    	jmpq   *0x2042ea(%rip)        # 6050a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400db6:	68 11 00 00 00       	pushq  $0x11
  400dbb:	e9 d0 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400dc0 <memcpy@plt>:
  400dc0:	ff 25 e2 42 20 00    	jmpq   *0x2042e2(%rip)        # 6050a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400dc6:	68 12 00 00 00       	pushq  $0x12
  400dcb:	e9 c0 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400dd0 <time@plt>:
  400dd0:	ff 25 da 42 20 00    	jmpq   *0x2042da(%rip)        # 6050b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400dd6:	68 13 00 00 00       	pushq  $0x13
  400ddb:	e9 b0 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400de0 <random@plt>:
  400de0:	ff 25 d2 42 20 00    	jmpq   *0x2042d2(%rip)        # 6050b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400de6:	68 14 00 00 00       	pushq  $0x14
  400deb:	e9 a0 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400df0 <_IO_getc@plt>:
  400df0:	ff 25 ca 42 20 00    	jmpq   *0x2042ca(%rip)        # 6050c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400df6:	68 15 00 00 00       	pushq  $0x15
  400dfb:	e9 90 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400e00 <__isoc99_sscanf@plt>:
  400e00:	ff 25 c2 42 20 00    	jmpq   *0x2042c2(%rip)        # 6050c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400e06:	68 16 00 00 00       	pushq  $0x16
  400e0b:	e9 80 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400e10 <munmap@plt>:
  400e10:	ff 25 ba 42 20 00    	jmpq   *0x2042ba(%rip)        # 6050d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400e16:	68 17 00 00 00       	pushq  $0x17
  400e1b:	e9 70 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400e20 <__printf_chk@plt>:
  400e20:	ff 25 b2 42 20 00    	jmpq   *0x2042b2(%rip)        # 6050d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400e26:	68 18 00 00 00       	pushq  $0x18
  400e2b:	e9 60 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400e30 <fopen@plt>:
  400e30:	ff 25 aa 42 20 00    	jmpq   *0x2042aa(%rip)        # 6050e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400e36:	68 19 00 00 00       	pushq  $0x19
  400e3b:	e9 50 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400e40 <getopt@plt>:
  400e40:	ff 25 a2 42 20 00    	jmpq   *0x2042a2(%rip)        # 6050e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400e46:	68 1a 00 00 00       	pushq  $0x1a
  400e4b:	e9 40 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400e50 <strtoul@plt>:
  400e50:	ff 25 9a 42 20 00    	jmpq   *0x20429a(%rip)        # 6050f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400e56:	68 1b 00 00 00       	pushq  $0x1b
  400e5b:	e9 30 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400e60 <gethostname@plt>:
  400e60:	ff 25 92 42 20 00    	jmpq   *0x204292(%rip)        # 6050f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400e66:	68 1c 00 00 00       	pushq  $0x1c
  400e6b:	e9 20 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400e70 <exit@plt>:
  400e70:	ff 25 8a 42 20 00    	jmpq   *0x20428a(%rip)        # 605100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400e76:	68 1d 00 00 00       	pushq  $0x1d
  400e7b:	e9 10 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400e80 <connect@plt>:
  400e80:	ff 25 82 42 20 00    	jmpq   *0x204282(%rip)        # 605108 <_GLOBAL_OFFSET_TABLE_+0x108>
  400e86:	68 1e 00 00 00       	pushq  $0x1e
  400e8b:	e9 00 fe ff ff       	jmpq   400c90 <_init+0x28>

0000000000400e90 <__fprintf_chk@plt>:
  400e90:	ff 25 7a 42 20 00    	jmpq   *0x20427a(%rip)        # 605110 <_GLOBAL_OFFSET_TABLE_+0x110>
  400e96:	68 1f 00 00 00       	pushq  $0x1f
  400e9b:	e9 f0 fd ff ff       	jmpq   400c90 <_init+0x28>

0000000000400ea0 <__sprintf_chk@plt>:
  400ea0:	ff 25 72 42 20 00    	jmpq   *0x204272(%rip)        # 605118 <_GLOBAL_OFFSET_TABLE_+0x118>
  400ea6:	68 20 00 00 00       	pushq  $0x20
  400eab:	e9 e0 fd ff ff       	jmpq   400c90 <_init+0x28>

0000000000400eb0 <socket@plt>:
  400eb0:	ff 25 6a 42 20 00    	jmpq   *0x20426a(%rip)        # 605120 <_GLOBAL_OFFSET_TABLE_+0x120>
  400eb6:	68 21 00 00 00       	pushq  $0x21
  400ebb:	e9 d0 fd ff ff       	jmpq   400c90 <_init+0x28>

Disassembly of section .plt.got:

0000000000400ec0 <.plt.got>:
  400ec0:	ff 25 32 41 20 00    	jmpq   *0x204132(%rip)        # 604ff8 <_DYNAMIC+0x1e0>
  400ec6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400ed0 <_start>:
  400ed0:	31 ed                	xor    %ebp,%ebp
  400ed2:	49 89 d1             	mov    %rdx,%r9
  400ed5:	5e                   	pop    %rsi
  400ed6:	48 89 e2             	mov    %rsp,%rdx
  400ed9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400edd:	50                   	push   %rax
  400ede:	54                   	push   %rsp
  400edf:	49 c7 c0 d0 2f 40 00 	mov    $0x402fd0,%r8
  400ee6:	48 c7 c1 60 2f 40 00 	mov    $0x402f60,%rcx
  400eed:	48 c7 c7 d5 11 40 00 	mov    $0x4011d5,%rdi
  400ef4:	e8 77 fe ff ff       	callq  400d70 <__libc_start_main@plt>
  400ef9:	f4                   	hlt    
  400efa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400f00 <deregister_tm_clones>:
  400f00:	b8 b7 54 60 00       	mov    $0x6054b7,%eax
  400f05:	55                   	push   %rbp
  400f06:	48 2d b0 54 60 00    	sub    $0x6054b0,%rax
  400f0c:	48 83 f8 0e          	cmp    $0xe,%rax
  400f10:	48 89 e5             	mov    %rsp,%rbp
  400f13:	76 1b                	jbe    400f30 <deregister_tm_clones+0x30>
  400f15:	b8 00 00 00 00       	mov    $0x0,%eax
  400f1a:	48 85 c0             	test   %rax,%rax
  400f1d:	74 11                	je     400f30 <deregister_tm_clones+0x30>
  400f1f:	5d                   	pop    %rbp
  400f20:	bf b0 54 60 00       	mov    $0x6054b0,%edi
  400f25:	ff e0                	jmpq   *%rax
  400f27:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400f2e:	00 00 
  400f30:	5d                   	pop    %rbp
  400f31:	c3                   	retq   
  400f32:	0f 1f 40 00          	nopl   0x0(%rax)
  400f36:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400f3d:	00 00 00 

0000000000400f40 <register_tm_clones>:
  400f40:	be b0 54 60 00       	mov    $0x6054b0,%esi
  400f45:	55                   	push   %rbp
  400f46:	48 81 ee b0 54 60 00 	sub    $0x6054b0,%rsi
  400f4d:	48 c1 fe 03          	sar    $0x3,%rsi
  400f51:	48 89 e5             	mov    %rsp,%rbp
  400f54:	48 89 f0             	mov    %rsi,%rax
  400f57:	48 c1 e8 3f          	shr    $0x3f,%rax
  400f5b:	48 01 c6             	add    %rax,%rsi
  400f5e:	48 d1 fe             	sar    %rsi
  400f61:	74 15                	je     400f78 <register_tm_clones+0x38>
  400f63:	b8 00 00 00 00       	mov    $0x0,%eax
  400f68:	48 85 c0             	test   %rax,%rax
  400f6b:	74 0b                	je     400f78 <register_tm_clones+0x38>
  400f6d:	5d                   	pop    %rbp
  400f6e:	bf b0 54 60 00       	mov    $0x6054b0,%edi
  400f73:	ff e0                	jmpq   *%rax
  400f75:	0f 1f 00             	nopl   (%rax)
  400f78:	5d                   	pop    %rbp
  400f79:	c3                   	retq   
  400f7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400f80 <__do_global_dtors_aux>:
  400f80:	80 3d 61 45 20 00 00 	cmpb   $0x0,0x204561(%rip)        # 6054e8 <completed.7594>
  400f87:	75 11                	jne    400f9a <__do_global_dtors_aux+0x1a>
  400f89:	55                   	push   %rbp
  400f8a:	48 89 e5             	mov    %rsp,%rbp
  400f8d:	e8 6e ff ff ff       	callq  400f00 <deregister_tm_clones>
  400f92:	5d                   	pop    %rbp
  400f93:	c6 05 4e 45 20 00 01 	movb   $0x1,0x20454e(%rip)        # 6054e8 <completed.7594>
  400f9a:	f3 c3                	repz retq 
  400f9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400fa0 <frame_dummy>:
  400fa0:	bf 10 4e 60 00       	mov    $0x604e10,%edi
  400fa5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400fa9:	75 05                	jne    400fb0 <frame_dummy+0x10>
  400fab:	eb 93                	jmp    400f40 <register_tm_clones>
  400fad:	0f 1f 00             	nopl   (%rax)
  400fb0:	b8 00 00 00 00       	mov    $0x0,%eax
  400fb5:	48 85 c0             	test   %rax,%rax
  400fb8:	74 f1                	je     400fab <frame_dummy+0xb>
  400fba:	55                   	push   %rbp
  400fbb:	48 89 e5             	mov    %rsp,%rbp
  400fbe:	ff d0                	callq  *%rax
  400fc0:	5d                   	pop    %rbp
  400fc1:	e9 7a ff ff ff       	jmpq   400f40 <register_tm_clones>

0000000000400fc6 <usage>:
  400fc6:	48 83 ec 08          	sub    $0x8,%rsp
  400fca:	48 89 fa             	mov    %rdi,%rdx
  400fcd:	83 3d 54 45 20 00 00 	cmpl   $0x0,0x204554(%rip)        # 605528 <is_checker>
  400fd4:	74 3e                	je     401014 <usage+0x4e>
  400fd6:	be e8 2f 40 00       	mov    $0x402fe8,%esi
  400fdb:	bf 01 00 00 00       	mov    $0x1,%edi
  400fe0:	b8 00 00 00 00       	mov    $0x0,%eax
  400fe5:	e8 36 fe ff ff       	callq  400e20 <__printf_chk@plt>
  400fea:	bf 20 30 40 00       	mov    $0x403020,%edi
  400fef:	e8 fc fc ff ff       	callq  400cf0 <puts@plt>
  400ff4:	bf 98 31 40 00       	mov    $0x403198,%edi
  400ff9:	e8 f2 fc ff ff       	callq  400cf0 <puts@plt>
  400ffe:	bf 48 30 40 00       	mov    $0x403048,%edi
  401003:	e8 e8 fc ff ff       	callq  400cf0 <puts@plt>
  401008:	bf b2 31 40 00       	mov    $0x4031b2,%edi
  40100d:	e8 de fc ff ff       	callq  400cf0 <puts@plt>
  401012:	eb 32                	jmp    401046 <usage+0x80>
  401014:	be ce 31 40 00       	mov    $0x4031ce,%esi
  401019:	bf 01 00 00 00       	mov    $0x1,%edi
  40101e:	b8 00 00 00 00       	mov    $0x0,%eax
  401023:	e8 f8 fd ff ff       	callq  400e20 <__printf_chk@plt>
  401028:	bf 70 30 40 00       	mov    $0x403070,%edi
  40102d:	e8 be fc ff ff       	callq  400cf0 <puts@plt>
  401032:	bf 98 30 40 00       	mov    $0x403098,%edi
  401037:	e8 b4 fc ff ff       	callq  400cf0 <puts@plt>
  40103c:	bf ec 31 40 00       	mov    $0x4031ec,%edi
  401041:	e8 aa fc ff ff       	callq  400cf0 <puts@plt>
  401046:	bf 00 00 00 00       	mov    $0x0,%edi
  40104b:	e8 20 fe ff ff       	callq  400e70 <exit@plt>

0000000000401050 <initialize_target>:
  401050:	55                   	push   %rbp
  401051:	53                   	push   %rbx
  401052:	48 81 ec 18 21 00 00 	sub    $0x2118,%rsp
  401059:	89 f5                	mov    %esi,%ebp
  40105b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401062:	00 00 
  401064:	48 89 84 24 08 21 00 	mov    %rax,0x2108(%rsp)
  40106b:	00 
  40106c:	31 c0                	xor    %eax,%eax
  40106e:	89 3d a4 44 20 00    	mov    %edi,0x2044a4(%rip)        # 605518 <check_level>
  401074:	8b 3d ee 40 20 00    	mov    0x2040ee(%rip),%edi        # 605168 <target_id>
  40107a:	e8 b6 1e 00 00       	callq  402f35 <gencookie>
  40107f:	89 05 9f 44 20 00    	mov    %eax,0x20449f(%rip)        # 605524 <cookie>
  401085:	89 c7                	mov    %eax,%edi
  401087:	e8 a9 1e 00 00       	callq  402f35 <gencookie>
  40108c:	89 05 8e 44 20 00    	mov    %eax,0x20448e(%rip)        # 605520 <authkey>
  401092:	8b 05 d0 40 20 00    	mov    0x2040d0(%rip),%eax        # 605168 <target_id>
  401098:	8d 78 01             	lea    0x1(%rax),%edi
  40109b:	e8 20 fc ff ff       	callq  400cc0 <srandom@plt>
  4010a0:	e8 3b fd ff ff       	callq  400de0 <random@plt>
  4010a5:	89 c7                	mov    %eax,%edi
  4010a7:	e8 03 03 00 00       	callq  4013af <scramble>
  4010ac:	89 c3                	mov    %eax,%ebx
  4010ae:	85 ed                	test   %ebp,%ebp
  4010b0:	74 18                	je     4010ca <initialize_target+0x7a>
  4010b2:	bf 00 00 00 00       	mov    $0x0,%edi
  4010b7:	e8 14 fd ff ff       	callq  400dd0 <time@plt>
  4010bc:	89 c7                	mov    %eax,%edi
  4010be:	e8 fd fb ff ff       	callq  400cc0 <srandom@plt>
  4010c3:	e8 18 fd ff ff       	callq  400de0 <random@plt>
  4010c8:	eb 05                	jmp    4010cf <initialize_target+0x7f>
  4010ca:	b8 00 00 00 00       	mov    $0x0,%eax
  4010cf:	01 c3                	add    %eax,%ebx
  4010d1:	0f b7 db             	movzwl %bx,%ebx
  4010d4:	8d 04 dd 00 01 00 00 	lea    0x100(,%rbx,8),%eax
  4010db:	89 c0                	mov    %eax,%eax
  4010dd:	48 89 05 bc 43 20 00 	mov    %rax,0x2043bc(%rip)        # 6054a0 <buf_offset>
  4010e4:	c6 05 5d 50 20 00 72 	movb   $0x72,0x20505d(%rip)        # 606148 <target_prefix>
  4010eb:	83 3d b6 43 20 00 00 	cmpl   $0x0,0x2043b6(%rip)        # 6054a8 <notify>
  4010f2:	0f 84 bb 00 00 00    	je     4011b3 <initialize_target+0x163>
  4010f8:	83 3d 29 44 20 00 00 	cmpl   $0x0,0x204429(%rip)        # 605528 <is_checker>
  4010ff:	0f 85 ae 00 00 00    	jne    4011b3 <initialize_target+0x163>
  401105:	be 00 01 00 00       	mov    $0x100,%esi
  40110a:	48 89 e7             	mov    %rsp,%rdi
  40110d:	e8 4e fd ff ff       	callq  400e60 <gethostname@plt>
  401112:	85 c0                	test   %eax,%eax
  401114:	74 25                	je     40113b <initialize_target+0xeb>
  401116:	bf c8 30 40 00       	mov    $0x4030c8,%edi
  40111b:	e8 d0 fb ff ff       	callq  400cf0 <puts@plt>
  401120:	bf 08 00 00 00       	mov    $0x8,%edi
  401125:	e8 46 fd ff ff       	callq  400e70 <exit@plt>
  40112a:	48 89 e6             	mov    %rsp,%rsi
  40112d:	e8 6e fb ff ff       	callq  400ca0 <strcasecmp@plt>
  401132:	85 c0                	test   %eax,%eax
  401134:	74 21                	je     401157 <initialize_target+0x107>
  401136:	83 c3 01             	add    $0x1,%ebx
  401139:	eb 05                	jmp    401140 <initialize_target+0xf0>
  40113b:	bb 00 00 00 00       	mov    $0x0,%ebx
  401140:	48 63 c3             	movslq %ebx,%rax
  401143:	48 8b 3c c5 80 51 60 	mov    0x605180(,%rax,8),%rdi
  40114a:	00 
  40114b:	48 85 ff             	test   %rdi,%rdi
  40114e:	75 da                	jne    40112a <initialize_target+0xda>
  401150:	b8 00 00 00 00       	mov    $0x0,%eax
  401155:	eb 05                	jmp    40115c <initialize_target+0x10c>
  401157:	b8 01 00 00 00       	mov    $0x1,%eax
  40115c:	85 c0                	test   %eax,%eax
  40115e:	75 1c                	jne    40117c <initialize_target+0x12c>
  401160:	48 89 e2             	mov    %rsp,%rdx
  401163:	be 00 31 40 00       	mov    $0x403100,%esi
  401168:	bf 01 00 00 00       	mov    $0x1,%edi
  40116d:	e8 ae fc ff ff       	callq  400e20 <__printf_chk@plt>
  401172:	bf 08 00 00 00       	mov    $0x8,%edi
  401177:	e8 f4 fc ff ff       	callq  400e70 <exit@plt>
  40117c:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  401183:	00 
  401184:	e8 16 1b 00 00       	callq  402c9f <init_driver>
  401189:	85 c0                	test   %eax,%eax
  40118b:	79 26                	jns    4011b3 <initialize_target+0x163>
  40118d:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  401194:	00 
  401195:	be 40 31 40 00       	mov    $0x403140,%esi
  40119a:	bf 01 00 00 00       	mov    $0x1,%edi
  40119f:	b8 00 00 00 00       	mov    $0x0,%eax
  4011a4:	e8 77 fc ff ff       	callq  400e20 <__printf_chk@plt>
  4011a9:	bf 08 00 00 00       	mov    $0x8,%edi
  4011ae:	e8 bd fc ff ff       	callq  400e70 <exit@plt>
  4011b3:	48 8b 84 24 08 21 00 	mov    0x2108(%rsp),%rax
  4011ba:	00 
  4011bb:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4011c2:	00 00 
  4011c4:	74 05                	je     4011cb <initialize_target+0x17b>
  4011c6:	e8 45 fb ff ff       	callq  400d10 <__stack_chk_fail@plt>
  4011cb:	48 81 c4 18 21 00 00 	add    $0x2118,%rsp
  4011d2:	5b                   	pop    %rbx
  4011d3:	5d                   	pop    %rbp
  4011d4:	c3                   	retq   

00000000004011d5 <main>:
  4011d5:	41 56                	push   %r14
  4011d7:	41 55                	push   %r13
  4011d9:	41 54                	push   %r12
  4011db:	55                   	push   %rbp
  4011dc:	53                   	push   %rbx
  4011dd:	41 89 fc             	mov    %edi,%r12d
  4011e0:	48 89 f3             	mov    %rsi,%rbx
  4011e3:	be bf 1f 40 00       	mov    $0x401fbf,%esi
  4011e8:	bf 0b 00 00 00       	mov    $0xb,%edi
  4011ed:	e8 8e fb ff ff       	callq  400d80 <signal@plt>
  4011f2:	be 71 1f 40 00       	mov    $0x401f71,%esi
  4011f7:	bf 07 00 00 00       	mov    $0x7,%edi
  4011fc:	e8 7f fb ff ff       	callq  400d80 <signal@plt>
  401201:	be 0d 20 40 00       	mov    $0x40200d,%esi
  401206:	bf 04 00 00 00       	mov    $0x4,%edi
  40120b:	e8 70 fb ff ff       	callq  400d80 <signal@plt>
  401210:	83 3d 11 43 20 00 00 	cmpl   $0x0,0x204311(%rip)        # 605528 <is_checker>
  401217:	74 20                	je     401239 <main+0x64>
  401219:	be 5b 20 40 00       	mov    $0x40205b,%esi
  40121e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401223:	e8 58 fb ff ff       	callq  400d80 <signal@plt>
  401228:	bf 05 00 00 00       	mov    $0x5,%edi
  40122d:	e8 0e fb ff ff       	callq  400d40 <alarm@plt>
  401232:	bd 0a 32 40 00       	mov    $0x40320a,%ebp
  401237:	eb 05                	jmp    40123e <main+0x69>
  401239:	bd 05 32 40 00       	mov    $0x403205,%ebp
  40123e:	48 8b 05 7b 42 20 00 	mov    0x20427b(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  401245:	48 89 05 c4 42 20 00 	mov    %rax,0x2042c4(%rip)        # 605510 <infile>
  40124c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401252:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401258:	e9 c6 00 00 00       	jmpq   401323 <main+0x14e>
  40125d:	83 e8 61             	sub    $0x61,%eax
  401260:	3c 10                	cmp    $0x10,%al
  401262:	0f 87 9c 00 00 00    	ja     401304 <main+0x12f>
  401268:	0f b6 c0             	movzbl %al,%eax
  40126b:	ff 24 c5 50 32 40 00 	jmpq   *0x403250(,%rax,8)
  401272:	48 8b 3b             	mov    (%rbx),%rdi
  401275:	e8 4c fd ff ff       	callq  400fc6 <usage>
  40127a:	be 5d 35 40 00       	mov    $0x40355d,%esi
  40127f:	48 8b 3d 42 42 20 00 	mov    0x204242(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  401286:	e8 a5 fb ff ff       	callq  400e30 <fopen@plt>
  40128b:	48 89 05 7e 42 20 00 	mov    %rax,0x20427e(%rip)        # 605510 <infile>
  401292:	48 85 c0             	test   %rax,%rax
  401295:	0f 85 88 00 00 00    	jne    401323 <main+0x14e>
  40129b:	48 8b 0d 26 42 20 00 	mov    0x204226(%rip),%rcx        # 6054c8 <optarg@@GLIBC_2.2.5>
  4012a2:	ba 12 32 40 00       	mov    $0x403212,%edx
  4012a7:	be 01 00 00 00       	mov    $0x1,%esi
  4012ac:	48 8b 3d 2d 42 20 00 	mov    0x20422d(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  4012b3:	e8 d8 fb ff ff       	callq  400e90 <__fprintf_chk@plt>
  4012b8:	b8 01 00 00 00       	mov    $0x1,%eax
  4012bd:	e9 e4 00 00 00       	jmpq   4013a6 <main+0x1d1>
  4012c2:	ba 10 00 00 00       	mov    $0x10,%edx
  4012c7:	be 00 00 00 00       	mov    $0x0,%esi
  4012cc:	48 8b 3d f5 41 20 00 	mov    0x2041f5(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  4012d3:	e8 78 fb ff ff       	callq  400e50 <strtoul@plt>
  4012d8:	41 89 c6             	mov    %eax,%r14d
  4012db:	eb 46                	jmp    401323 <main+0x14e>
  4012dd:	ba 0a 00 00 00       	mov    $0xa,%edx
  4012e2:	be 00 00 00 00       	mov    $0x0,%esi
  4012e7:	48 8b 3d da 41 20 00 	mov    0x2041da(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  4012ee:	e8 bd fa ff ff       	callq  400db0 <strtol@plt>
  4012f3:	41 89 c5             	mov    %eax,%r13d
  4012f6:	eb 2b                	jmp    401323 <main+0x14e>
  4012f8:	c7 05 a6 41 20 00 00 	movl   $0x0,0x2041a6(%rip)        # 6054a8 <notify>
  4012ff:	00 00 00 
  401302:	eb 1f                	jmp    401323 <main+0x14e>
  401304:	0f be d2             	movsbl %dl,%edx
  401307:	be 2f 32 40 00       	mov    $0x40322f,%esi
  40130c:	bf 01 00 00 00       	mov    $0x1,%edi
  401311:	b8 00 00 00 00       	mov    $0x0,%eax
  401316:	e8 05 fb ff ff       	callq  400e20 <__printf_chk@plt>
  40131b:	48 8b 3b             	mov    (%rbx),%rdi
  40131e:	e8 a3 fc ff ff       	callq  400fc6 <usage>
  401323:	48 89 ea             	mov    %rbp,%rdx
  401326:	48 89 de             	mov    %rbx,%rsi
  401329:	44 89 e7             	mov    %r12d,%edi
  40132c:	e8 0f fb ff ff       	callq  400e40 <getopt@plt>
  401331:	89 c2                	mov    %eax,%edx
  401333:	3c ff                	cmp    $0xff,%al
  401335:	0f 85 22 ff ff ff    	jne    40125d <main+0x88>
  40133b:	be 01 00 00 00       	mov    $0x1,%esi
  401340:	44 89 ef             	mov    %r13d,%edi
  401343:	e8 08 fd ff ff       	callq  401050 <initialize_target>
  401348:	83 3d d9 41 20 00 00 	cmpl   $0x0,0x2041d9(%rip)        # 605528 <is_checker>
  40134f:	74 2a                	je     40137b <main+0x1a6>
  401351:	44 3b 35 c8 41 20 00 	cmp    0x2041c8(%rip),%r14d        # 605520 <authkey>
  401358:	74 21                	je     40137b <main+0x1a6>
  40135a:	44 89 f2             	mov    %r14d,%edx
  40135d:	be 68 31 40 00       	mov    $0x403168,%esi
  401362:	bf 01 00 00 00       	mov    $0x1,%edi
  401367:	b8 00 00 00 00       	mov    $0x0,%eax
  40136c:	e8 af fa ff ff       	callq  400e20 <__printf_chk@plt>
  401371:	b8 00 00 00 00       	mov    $0x0,%eax
  401376:	e8 92 08 00 00       	callq  401c0d <check_fail>
  40137b:	8b 15 a3 41 20 00    	mov    0x2041a3(%rip),%edx        # 605524 <cookie>
  401381:	be 42 32 40 00       	mov    $0x403242,%esi
  401386:	bf 01 00 00 00       	mov    $0x1,%edi
  40138b:	b8 00 00 00 00       	mov    $0x0,%eax
  401390:	e8 8b fa ff ff       	callq  400e20 <__printf_chk@plt>
  401395:	48 8b 3d 04 41 20 00 	mov    0x204104(%rip),%rdi        # 6054a0 <buf_offset>
  40139c:	e8 0d 0d 00 00       	callq  4020ae <launch>
  4013a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4013a6:	5b                   	pop    %rbx
  4013a7:	5d                   	pop    %rbp
  4013a8:	41 5c                	pop    %r12
  4013aa:	41 5d                	pop    %r13
  4013ac:	41 5e                	pop    %r14
  4013ae:	c3                   	retq   

00000000004013af <scramble>:
  4013af:	48 83 ec 38          	sub    $0x38,%rsp
  4013b3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4013ba:	00 00 
  4013bc:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  4013c1:	31 c0                	xor    %eax,%eax
  4013c3:	eb 10                	jmp    4013d5 <scramble+0x26>
  4013c5:	69 d0 bc dc 00 00    	imul   $0xdcbc,%eax,%edx
  4013cb:	01 fa                	add    %edi,%edx
  4013cd:	89 c1                	mov    %eax,%ecx
  4013cf:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
  4013d2:	83 c0 01             	add    $0x1,%eax
  4013d5:	83 f8 09             	cmp    $0x9,%eax
  4013d8:	76 eb                	jbe    4013c5 <scramble+0x16>
  4013da:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4013de:	69 c0 4d e9 00 00    	imul   $0xe94d,%eax,%eax
  4013e4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4013e8:	8b 04 24             	mov    (%rsp),%eax
  4013eb:	69 c0 e7 04 00 00    	imul   $0x4e7,%eax,%eax
  4013f1:	89 04 24             	mov    %eax,(%rsp)
  4013f4:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4013f8:	69 c0 25 25 00 00    	imul   $0x2525,%eax,%eax
  4013fe:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401402:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401406:	69 c0 59 67 00 00    	imul   $0x6759,%eax,%eax
  40140c:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401410:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401414:	69 c0 b3 8d 00 00    	imul   $0x8db3,%eax,%eax
  40141a:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40141e:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401422:	69 c0 96 7b 00 00    	imul   $0x7b96,%eax,%eax
  401428:	89 44 24 08          	mov    %eax,0x8(%rsp)
  40142c:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401430:	69 c0 0d f2 00 00    	imul   $0xf20d,%eax,%eax
  401436:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40143a:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40143e:	69 c0 5b 84 00 00    	imul   $0x845b,%eax,%eax
  401444:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401448:	8b 44 24 04          	mov    0x4(%rsp),%eax
  40144c:	69 c0 fd 6f 00 00    	imul   $0x6ffd,%eax,%eax
  401452:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401456:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40145a:	69 c0 98 60 00 00    	imul   $0x6098,%eax,%eax
  401460:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401464:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401468:	69 c0 64 52 00 00    	imul   $0x5264,%eax,%eax
  40146e:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401472:	8b 44 24 20          	mov    0x20(%rsp),%eax
  401476:	69 c0 3b a8 00 00    	imul   $0xa83b,%eax,%eax
  40147c:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401480:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401484:	69 c0 cf fc 00 00    	imul   $0xfccf,%eax,%eax
  40148a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40148e:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401492:	69 c0 56 af 00 00    	imul   $0xaf56,%eax,%eax
  401498:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40149c:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4014a0:	89 c2                	mov    %eax,%edx
  4014a2:	c1 e2 07             	shl    $0x7,%edx
  4014a5:	c1 e0 0d             	shl    $0xd,%eax
  4014a8:	01 d0                	add    %edx,%eax
  4014aa:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4014ae:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4014b2:	69 c0 ac ad 00 00    	imul   $0xadac,%eax,%eax
  4014b8:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4014bc:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4014c0:	69 c0 1d 76 00 00    	imul   $0x761d,%eax,%eax
  4014c6:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4014ca:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4014ce:	69 c0 eb e0 00 00    	imul   $0xe0eb,%eax,%eax
  4014d4:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4014d8:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4014dc:	69 c0 28 5e 00 00    	imul   $0x5e28,%eax,%eax
  4014e2:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4014e6:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4014ea:	69 c0 19 73 00 00    	imul   $0x7319,%eax,%eax
  4014f0:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4014f4:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4014f8:	69 c0 72 d9 00 00    	imul   $0xd972,%eax,%eax
  4014fe:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401502:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401506:	69 c0 7a 1b 00 00    	imul   $0x1b7a,%eax,%eax
  40150c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401510:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401514:	69 c0 98 b2 00 00    	imul   $0xb298,%eax,%eax
  40151a:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40151e:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401522:	69 c0 53 79 00 00    	imul   $0x7953,%eax,%eax
  401528:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40152c:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401530:	69 c0 e7 eb 00 00    	imul   $0xebe7,%eax,%eax
  401536:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40153a:	8b 44 24 24          	mov    0x24(%rsp),%eax
  40153e:	69 c0 ba 21 00 00    	imul   $0x21ba,%eax,%eax
  401544:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401548:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40154c:	69 c0 02 60 00 00    	imul   $0x6002,%eax,%eax
  401552:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401556:	8b 44 24 04          	mov    0x4(%rsp),%eax
  40155a:	69 c0 f0 b1 00 00    	imul   $0xb1f0,%eax,%eax
  401560:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401564:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401568:	69 c0 5c 3d 00 00    	imul   $0x3d5c,%eax,%eax
  40156e:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401572:	8b 04 24             	mov    (%rsp),%eax
  401575:	69 c0 c1 2d 00 00    	imul   $0x2dc1,%eax,%eax
  40157b:	89 04 24             	mov    %eax,(%rsp)
  40157e:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401582:	69 c0 39 6f 00 00    	imul   $0x6f39,%eax,%eax
  401588:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40158c:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401590:	69 c0 aa 67 00 00    	imul   $0x67aa,%eax,%eax
  401596:	89 44 24 08          	mov    %eax,0x8(%rsp)
  40159a:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40159e:	69 c0 00 8e 00 00    	imul   $0x8e00,%eax,%eax
  4015a4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4015a8:	8b 04 24             	mov    (%rsp),%eax
  4015ab:	69 c0 99 80 00 00    	imul   $0x8099,%eax,%eax
  4015b1:	89 04 24             	mov    %eax,(%rsp)
  4015b4:	8b 04 24             	mov    (%rsp),%eax
  4015b7:	69 c0 da 90 00 00    	imul   $0x90da,%eax,%eax
  4015bd:	89 04 24             	mov    %eax,(%rsp)
  4015c0:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4015c4:	69 c0 03 d8 00 00    	imul   $0xd803,%eax,%eax
  4015ca:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4015ce:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4015d2:	69 c0 62 e2 00 00    	imul   $0xe262,%eax,%eax
  4015d8:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4015dc:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4015e0:	69 c0 cb 35 00 00    	imul   $0x35cb,%eax,%eax
  4015e6:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4015ea:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4015ee:	69 c0 53 93 00 00    	imul   $0x9353,%eax,%eax
  4015f4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4015f8:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4015fc:	69 c0 90 b7 00 00    	imul   $0xb790,%eax,%eax
  401602:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401606:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40160a:	69 c0 0b 89 00 00    	imul   $0x890b,%eax,%eax
  401610:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401614:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401618:	69 c0 85 bd 00 00    	imul   $0xbd85,%eax,%eax
  40161e:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401622:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401626:	69 c0 3f a3 00 00    	imul   $0xa33f,%eax,%eax
  40162c:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401630:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401634:	69 c0 df 45 00 00    	imul   $0x45df,%eax,%eax
  40163a:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40163e:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401642:	69 c0 bb d0 00 00    	imul   $0xd0bb,%eax,%eax
  401648:	89 44 24 10          	mov    %eax,0x10(%rsp)
  40164c:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401650:	69 c0 78 3e 00 00    	imul   $0x3e78,%eax,%eax
  401656:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40165a:	8b 44 24 20          	mov    0x20(%rsp),%eax
  40165e:	69 c0 0d 4f 00 00    	imul   $0x4f0d,%eax,%eax
  401664:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401668:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40166c:	69 c0 4b 25 00 00    	imul   $0x254b,%eax,%eax
  401672:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401676:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40167a:	69 c0 b7 ee 00 00    	imul   $0xeeb7,%eax,%eax
  401680:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401684:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401688:	69 c0 35 c9 00 00    	imul   $0xc935,%eax,%eax
  40168e:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401692:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401696:	69 c0 97 99 00 00    	imul   $0x9997,%eax,%eax
  40169c:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4016a0:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4016a4:	69 c0 de e9 00 00    	imul   $0xe9de,%eax,%eax
  4016aa:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4016ae:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4016b2:	69 c0 b6 94 00 00    	imul   $0x94b6,%eax,%eax
  4016b8:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4016bc:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4016c0:	69 c0 f3 10 00 00    	imul   $0x10f3,%eax,%eax
  4016c6:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4016ca:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4016ce:	69 c0 c9 ce 00 00    	imul   $0xcec9,%eax,%eax
  4016d4:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4016d8:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4016dc:	69 c0 43 a7 00 00    	imul   $0xa743,%eax,%eax
  4016e2:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4016e6:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4016ea:	69 c0 cd a1 00 00    	imul   $0xa1cd,%eax,%eax
  4016f0:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4016f4:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4016f8:	69 c0 e1 40 00 00    	imul   $0x40e1,%eax,%eax
  4016fe:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401702:	8b 44 24 20          	mov    0x20(%rsp),%eax
  401706:	69 c0 3e d4 00 00    	imul   $0xd43e,%eax,%eax
  40170c:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401710:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401714:	69 c0 a8 25 00 00    	imul   $0x25a8,%eax,%eax
  40171a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40171e:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401722:	69 c0 60 fa 00 00    	imul   $0xfa60,%eax,%eax
  401728:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40172c:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401730:	69 c0 ee e4 00 00    	imul   $0xe4ee,%eax,%eax
  401736:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40173a:	8b 04 24             	mov    (%rsp),%eax
  40173d:	69 c0 42 0a 00 00    	imul   $0xa42,%eax,%eax
  401743:	89 04 24             	mov    %eax,(%rsp)
  401746:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40174a:	69 c0 7a 26 00 00    	imul   $0x267a,%eax,%eax
  401750:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401754:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401758:	69 c0 1e b0 00 00    	imul   $0xb01e,%eax,%eax
  40175e:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401762:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401766:	69 c0 8b 78 00 00    	imul   $0x788b,%eax,%eax
  40176c:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401770:	8b 04 24             	mov    (%rsp),%eax
  401773:	69 c0 e8 90 00 00    	imul   $0x90e8,%eax,%eax
  401779:	89 04 24             	mov    %eax,(%rsp)
  40177c:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401780:	69 c0 ae c5 00 00    	imul   $0xc5ae,%eax,%eax
  401786:	89 44 24 10          	mov    %eax,0x10(%rsp)
  40178a:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40178e:	69 c0 14 82 00 00    	imul   $0x8214,%eax,%eax
  401794:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401798:	8b 44 24 04          	mov    0x4(%rsp),%eax
  40179c:	69 c0 a7 4d 00 00    	imul   $0x4da7,%eax,%eax
  4017a2:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4017a6:	8b 04 24             	mov    (%rsp),%eax
  4017a9:	69 c0 25 9f 00 00    	imul   $0x9f25,%eax,%eax
  4017af:	89 04 24             	mov    %eax,(%rsp)
  4017b2:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4017b6:	69 c0 b1 a8 00 00    	imul   $0xa8b1,%eax,%eax
  4017bc:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4017c0:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4017c4:	69 c0 b2 59 00 00    	imul   $0x59b2,%eax,%eax
  4017ca:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4017ce:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4017d2:	69 c0 ff 85 00 00    	imul   $0x85ff,%eax,%eax
  4017d8:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4017dc:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4017e0:	69 c0 53 70 00 00    	imul   $0x7053,%eax,%eax
  4017e6:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4017ea:	8b 44 24 04          	mov    0x4(%rsp),%eax
  4017ee:	69 c0 ea d2 00 00    	imul   $0xd2ea,%eax,%eax
  4017f4:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4017f8:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4017fc:	69 c0 c7 0f 00 00    	imul   $0xfc7,%eax,%eax
  401802:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401806:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40180a:	69 c0 21 b4 00 00    	imul   $0xb421,%eax,%eax
  401810:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401814:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401818:	69 c0 12 c2 00 00    	imul   $0xc212,%eax,%eax
  40181e:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401822:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401826:	69 c0 03 13 00 00    	imul   $0x1303,%eax,%eax
  40182c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401830:	8b 04 24             	mov    (%rsp),%eax
  401833:	69 c0 4b ca 00 00    	imul   $0xca4b,%eax,%eax
  401839:	89 04 24             	mov    %eax,(%rsp)
  40183c:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401840:	69 c0 e6 bb 00 00    	imul   $0xbbe6,%eax,%eax
  401846:	89 44 24 14          	mov    %eax,0x14(%rsp)
  40184a:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40184e:	69 c0 f8 ed 00 00    	imul   $0xedf8,%eax,%eax
  401854:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401858:	8b 04 24             	mov    (%rsp),%eax
  40185b:	69 c0 d1 80 00 00    	imul   $0x80d1,%eax,%eax
  401861:	89 04 24             	mov    %eax,(%rsp)
  401864:	ba 00 00 00 00       	mov    $0x0,%edx
  401869:	b8 00 00 00 00       	mov    $0x0,%eax
  40186e:	eb 0a                	jmp    40187a <scramble+0x4cb>
  401870:	89 d1                	mov    %edx,%ecx
  401872:	8b 0c 8c             	mov    (%rsp,%rcx,4),%ecx
  401875:	01 c8                	add    %ecx,%eax
  401877:	83 c2 01             	add    $0x1,%edx
  40187a:	83 fa 09             	cmp    $0x9,%edx
  40187d:	76 f1                	jbe    401870 <scramble+0x4c1>
  40187f:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  401884:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  40188b:	00 00 
  40188d:	74 05                	je     401894 <scramble+0x4e5>
  40188f:	e8 7c f4 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  401894:	48 83 c4 38          	add    $0x38,%rsp
  401898:	c3                   	retq   

0000000000401899 <getbuf>:
  401899:	48 83 ec 38          	sub    $0x38,%rsp
  40189d:	48 89 e7             	mov    %rsp,%rdi
  4018a0:	e8 9d 03 00 00       	callq  401c42 <Gets>
  4018a5:	b8 01 00 00 00       	mov    $0x1,%eax
  4018aa:	48 83 c4 38          	add    $0x38,%rsp
  4018ae:	c3                   	retq   

00000000004018af <touch1>:
  4018af:	48 83 ec 08          	sub    $0x8,%rsp
  4018b3:	c7 05 5f 3c 20 00 01 	movl   $0x1,0x203c5f(%rip)        # 60551c <vlevel>
  4018ba:	00 00 00 
  4018bd:	bf b6 33 40 00       	mov    $0x4033b6,%edi
  4018c2:	e8 29 f4 ff ff       	callq  400cf0 <puts@plt>
  4018c7:	bf 01 00 00 00       	mov    $0x1,%edi
  4018cc:	e8 b6 05 00 00       	callq  401e87 <validate>
  4018d1:	bf 00 00 00 00       	mov    $0x0,%edi
  4018d6:	e8 95 f5 ff ff       	callq  400e70 <exit@plt>

00000000004018db <touch2>:
  4018db:	48 83 ec 08          	sub    $0x8,%rsp
  4018df:	89 fa                	mov    %edi,%edx
  4018e1:	c7 05 31 3c 20 00 02 	movl   $0x2,0x203c31(%rip)        # 60551c <vlevel>
  4018e8:	00 00 00 
  4018eb:	39 3d 33 3c 20 00    	cmp    %edi,0x203c33(%rip)        # 605524 <cookie>
  4018f1:	75 20                	jne    401913 <touch2+0x38>
  4018f3:	be d8 33 40 00       	mov    $0x4033d8,%esi
  4018f8:	bf 01 00 00 00       	mov    $0x1,%edi
  4018fd:	b8 00 00 00 00       	mov    $0x0,%eax
  401902:	e8 19 f5 ff ff       	callq  400e20 <__printf_chk@plt>
  401907:	bf 02 00 00 00       	mov    $0x2,%edi
  40190c:	e8 76 05 00 00       	callq  401e87 <validate>
  401911:	eb 1e                	jmp    401931 <touch2+0x56>
  401913:	be 00 34 40 00       	mov    $0x403400,%esi
  401918:	bf 01 00 00 00       	mov    $0x1,%edi
  40191d:	b8 00 00 00 00       	mov    $0x0,%eax
  401922:	e8 f9 f4 ff ff       	callq  400e20 <__printf_chk@plt>
  401927:	bf 02 00 00 00       	mov    $0x2,%edi
  40192c:	e8 18 06 00 00       	callq  401f49 <fail>
  401931:	bf 00 00 00 00       	mov    $0x0,%edi
  401936:	e8 35 f5 ff ff       	callq  400e70 <exit@plt>

000000000040193b <hexmatch>:
  40193b:	41 54                	push   %r12
  40193d:	55                   	push   %rbp
  40193e:	53                   	push   %rbx
  40193f:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  401943:	89 fd                	mov    %edi,%ebp
  401945:	48 89 f3             	mov    %rsi,%rbx
  401948:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40194f:	00 00 
  401951:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  401956:	31 c0                	xor    %eax,%eax
  401958:	e8 83 f4 ff ff       	callq  400de0 <random@plt>
  40195d:	48 89 c1             	mov    %rax,%rcx
  401960:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401967:	0a d7 a3 
  40196a:	48 f7 ea             	imul   %rdx
  40196d:	48 01 ca             	add    %rcx,%rdx
  401970:	48 c1 fa 06          	sar    $0x6,%rdx
  401974:	48 89 c8             	mov    %rcx,%rax
  401977:	48 c1 f8 3f          	sar    $0x3f,%rax
  40197b:	48 29 c2             	sub    %rax,%rdx
  40197e:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  401982:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  401986:	48 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%rax
  40198d:	00 
  40198e:	48 29 c1             	sub    %rax,%rcx
  401991:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  401995:	41 89 e8             	mov    %ebp,%r8d
  401998:	b9 d3 33 40 00       	mov    $0x4033d3,%ecx
  40199d:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4019a4:	be 01 00 00 00       	mov    $0x1,%esi
  4019a9:	4c 89 e7             	mov    %r12,%rdi
  4019ac:	b8 00 00 00 00       	mov    $0x0,%eax
  4019b1:	e8 ea f4 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  4019b6:	ba 09 00 00 00       	mov    $0x9,%edx
  4019bb:	4c 89 e6             	mov    %r12,%rsi
  4019be:	48 89 df             	mov    %rbx,%rdi
  4019c1:	e8 0a f3 ff ff       	callq  400cd0 <strncmp@plt>
  4019c6:	85 c0                	test   %eax,%eax
  4019c8:	0f 94 c0             	sete   %al
  4019cb:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
  4019d0:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  4019d7:	00 00 
  4019d9:	74 05                	je     4019e0 <hexmatch+0xa5>
  4019db:	e8 30 f3 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  4019e0:	0f b6 c0             	movzbl %al,%eax
  4019e3:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
  4019e7:	5b                   	pop    %rbx
  4019e8:	5d                   	pop    %rbp
  4019e9:	41 5c                	pop    %r12
  4019eb:	c3                   	retq   

00000000004019ec <touch3>:
  4019ec:	53                   	push   %rbx
  4019ed:	48 89 fb             	mov    %rdi,%rbx
  4019f0:	c7 05 22 3b 20 00 03 	movl   $0x3,0x203b22(%rip)        # 60551c <vlevel>
  4019f7:	00 00 00 
  4019fa:	48 89 fe             	mov    %rdi,%rsi
  4019fd:	8b 3d 21 3b 20 00    	mov    0x203b21(%rip),%edi        # 605524 <cookie>
  401a03:	e8 33 ff ff ff       	callq  40193b <hexmatch>
  401a08:	85 c0                	test   %eax,%eax
  401a0a:	74 23                	je     401a2f <touch3+0x43>
  401a0c:	48 89 da             	mov    %rbx,%rdx
  401a0f:	be 28 34 40 00       	mov    $0x403428,%esi
  401a14:	bf 01 00 00 00       	mov    $0x1,%edi
  401a19:	b8 00 00 00 00       	mov    $0x0,%eax
  401a1e:	e8 fd f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a23:	bf 03 00 00 00       	mov    $0x3,%edi
  401a28:	e8 5a 04 00 00       	callq  401e87 <validate>
  401a2d:	eb 21                	jmp    401a50 <touch3+0x64>
  401a2f:	48 89 da             	mov    %rbx,%rdx
  401a32:	be 50 34 40 00       	mov    $0x403450,%esi
  401a37:	bf 01 00 00 00       	mov    $0x1,%edi
  401a3c:	b8 00 00 00 00       	mov    $0x0,%eax
  401a41:	e8 da f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a46:	bf 03 00 00 00       	mov    $0x3,%edi
  401a4b:	e8 f9 04 00 00       	callq  401f49 <fail>
  401a50:	bf 00 00 00 00       	mov    $0x0,%edi
  401a55:	e8 16 f4 ff ff       	callq  400e70 <exit@plt>

0000000000401a5a <test>:
  401a5a:	48 83 ec 08          	sub    $0x8,%rsp
  401a5e:	b8 00 00 00 00       	mov    $0x0,%eax
  401a63:	e8 31 fe ff ff       	callq  401899 <getbuf>
  401a68:	89 c2                	mov    %eax,%edx
  401a6a:	be 78 34 40 00       	mov    $0x403478,%esi
  401a6f:	bf 01 00 00 00       	mov    $0x1,%edi
  401a74:	b8 00 00 00 00       	mov    $0x0,%eax
  401a79:	e8 a2 f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a7e:	48 83 c4 08          	add    $0x8,%rsp
  401a82:	c3                   	retq   

0000000000401a83 <start_farm>:
  401a83:	b8 01 00 00 00       	mov    $0x1,%eax
  401a88:	c3                   	retq   

0000000000401a89 <addval_182>:
  401a89:	8d 87 48 89 c7 91    	lea    -0x6e3876b8(%rdi),%eax
  401a8f:	c3                   	retq   

0000000000401a90 <getval_407>:
  401a90:	b8 58 c3 3e e0       	mov    $0xe03ec358,%eax
  401a95:	c3                   	retq   

0000000000401a96 <getval_225>:
  401a96:	b8 58 92 90 90       	mov    $0x90909258,%eax
  401a9b:	c3                   	retq   

0000000000401a9c <setval_454>:
  401a9c:	c7 07 48 81 c7 90    	movl   $0x90c78148,(%rdi)
  401aa2:	c3                   	retq   

0000000000401aa3 <addval_455>:
  401aa3:	8d 87 18 c3 86 9a    	lea    -0x65793ce8(%rdi),%eax
  401aa9:	c3                   	retq   

0000000000401aaa <getval_406>:
  401aaa:	b8 64 20 58 c3       	mov    $0xc3582064,%eax
  401aaf:	c3                   	retq   

0000000000401ab0 <setval_449>:
  401ab0:	c7 07 48 89 c7 90    	movl   $0x90c78948,(%rdi)
  401ab6:	c3                   	retq   

0000000000401ab7 <addval_338>:
  401ab7:	8d 87 48 89 c7 c3    	lea    -0x3c3876b8(%rdi),%eax
  401abd:	c3                   	retq   

0000000000401abe <mid_farm>:
  401abe:	b8 01 00 00 00       	mov    $0x1,%eax
  401ac3:	c3                   	retq   

0000000000401ac4 <add_xy>:
  401ac4:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  401ac8:	c3                   	retq   

0000000000401ac9 <addval_181>:
  401ac9:	8d 87 4a 89 e0 c3    	lea    -0x3c1f76b6(%rdi),%eax
  401acf:	c3                   	retq   

0000000000401ad0 <addval_312>:
  401ad0:	8d 87 89 ca 08 d2    	lea    -0x2df73577(%rdi),%eax
  401ad6:	c3                   	retq   

0000000000401ad7 <getval_281>:
  401ad7:	b8 09 d6 08 db       	mov    $0xdb08d609,%eax
  401adc:	c3                   	retq   

0000000000401add <setval_376>:
  401add:	c7 07 89 ca 48 db    	movl   $0xdb48ca89,(%rdi)
  401ae3:	c3                   	retq   

0000000000401ae4 <setval_482>:
  401ae4:	c7 07 48 89 e0 c7    	movl   $0xc7e08948,(%rdi)
  401aea:	c3                   	retq   

0000000000401aeb <addval_438>:
  401aeb:	8d 87 48 89 e0 90    	lea    -0x6f1f76b8(%rdi),%eax
  401af1:	c3                   	retq   

0000000000401af2 <setval_189>:
  401af2:	c7 07 89 c1 08 db    	movl   $0xdb08c189,(%rdi)
  401af8:	c3                   	retq   

0000000000401af9 <getval_498>:
  401af9:	b8 89 ca 94 c9       	mov    $0xc994ca89,%eax
  401afe:	c3                   	retq   

0000000000401aff <setval_480>:
  401aff:	c7 07 89 d6 48 c9    	movl   $0xc948d689,(%rdi)
  401b05:	c3                   	retq   

0000000000401b06 <addval_429>:
  401b06:	8d 87 e8 b3 89 d6    	lea    -0x29764c18(%rdi),%eax
  401b0c:	c3                   	retq   

0000000000401b0d <getval_322>:
  401b0d:	b8 8d c1 84 c9       	mov    $0xc984c18d,%eax
  401b12:	c3                   	retq   

0000000000401b13 <getval_134>:
  401b13:	b8 89 c1 84 d2       	mov    $0xd284c189,%eax
  401b18:	c3                   	retq   

0000000000401b19 <getval_101>:
  401b19:	b8 48 81 e0 90       	mov    $0x90e08148,%eax
  401b1e:	c3                   	retq   

0000000000401b1f <setval_383>:
  401b1f:	c7 07 8b c1 c3 bd    	movl   $0xbdc3c18b,(%rdi)
  401b25:	c3                   	retq   

0000000000401b26 <getval_408>:
  401b26:	b8 a9 d6 08 c0       	mov    $0xc008d6a9,%eax
  401b2b:	c3                   	retq   

0000000000401b2c <getval_491>:
  401b2c:	b8 89 c1 94 d2       	mov    $0xd294c189,%eax
  401b31:	c3                   	retq   

0000000000401b32 <getval_197>:
  401b32:	b8 89 d6 84 c0       	mov    $0xc084d689,%eax
  401b37:	c3                   	retq   

0000000000401b38 <getval_230>:
  401b38:	b8 89 c1 92 c3       	mov    $0xc392c189,%eax
  401b3d:	c3                   	retq   

0000000000401b3e <addval_303>:
  401b3e:	8d 87 09 d6 90 90    	lea    -0x6f6f29f7(%rdi),%eax
  401b44:	c3                   	retq   

0000000000401b45 <addval_453>:
  401b45:	8d 87 04 89 ca 91    	lea    -0x6e3576fc(%rdi),%eax
  401b4b:	c3                   	retq   

0000000000401b4c <setval_186>:
  401b4c:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  401b52:	c3                   	retq   

0000000000401b53 <setval_262>:
  401b53:	c7 07 81 d6 84 db    	movl   $0xdb84d681,(%rdi)
  401b59:	c3                   	retq   

0000000000401b5a <setval_111>:
  401b5a:	c7 07 89 ca 00 db    	movl   $0xdb00ca89,(%rdi)
  401b60:	c3                   	retq   

0000000000401b61 <addval_163>:
  401b61:	8d 87 8d d6 90 c3    	lea    -0x3c6f2973(%rdi),%eax
  401b67:	c3                   	retq   

0000000000401b68 <setval_191>:
  401b68:	c7 07 89 ca 48 d2    	movl   $0xd248ca89,(%rdi)
  401b6e:	c3                   	retq   

0000000000401b6f <getval_127>:
  401b6f:	b8 4d 09 ca 90       	mov    $0x90ca094d,%eax
  401b74:	c3                   	retq   

0000000000401b75 <getval_359>:
  401b75:	b8 82 89 c1 92       	mov    $0x92c18982,%eax
  401b7a:	c3                   	retq   

0000000000401b7b <setval_112>:
  401b7b:	c7 07 48 c9 e0 c3    	movl   $0xc3e0c948,(%rdi)
  401b81:	c3                   	retq   

0000000000401b82 <getval_401>:
  401b82:	b8 48 89 e0 c1       	mov    $0xc1e08948,%eax
  401b87:	c3                   	retq   

0000000000401b88 <addval_341>:
  401b88:	8d 87 89 c1 90 c1    	lea    -0x3e6f3e77(%rdi),%eax
  401b8e:	c3                   	retq   

0000000000401b8f <addval_364>:
  401b8f:	8d 87 48 89 e0 94    	lea    -0x6b1f76b8(%rdi),%eax
  401b95:	c3                   	retq   

0000000000401b96 <getval_404>:
  401b96:	b8 89 ca 90 90       	mov    $0x9090ca89,%eax
  401b9b:	c3                   	retq   

0000000000401b9c <end_farm>:
  401b9c:	b8 01 00 00 00       	mov    $0x1,%eax
  401ba1:	c3                   	retq   

0000000000401ba2 <save_char>:
  401ba2:	8b 05 9c 45 20 00    	mov    0x20459c(%rip),%eax        # 606144 <gets_cnt>
  401ba8:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401bad:	7f 49                	jg     401bf8 <save_char+0x56>
  401baf:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401bb2:	89 f9                	mov    %edi,%ecx
  401bb4:	c0 e9 04             	shr    $0x4,%cl
  401bb7:	83 e1 0f             	and    $0xf,%ecx
  401bba:	0f b6 b1 a0 37 40 00 	movzbl 0x4037a0(%rcx),%esi
  401bc1:	48 63 ca             	movslq %edx,%rcx
  401bc4:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401bcb:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401bce:	83 e7 0f             	and    $0xf,%edi
  401bd1:	0f b6 b7 a0 37 40 00 	movzbl 0x4037a0(%rdi),%esi
  401bd8:	48 63 c9             	movslq %ecx,%rcx
  401bdb:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401be2:	83 c2 02             	add    $0x2,%edx
  401be5:	48 63 d2             	movslq %edx,%rdx
  401be8:	c6 82 40 55 60 00 20 	movb   $0x20,0x605540(%rdx)
  401bef:	83 c0 01             	add    $0x1,%eax
  401bf2:	89 05 4c 45 20 00    	mov    %eax,0x20454c(%rip)        # 606144 <gets_cnt>
  401bf8:	f3 c3                	repz retq 

0000000000401bfa <save_term>:
  401bfa:	8b 05 44 45 20 00    	mov    0x204544(%rip),%eax        # 606144 <gets_cnt>
  401c00:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401c03:	48 98                	cltq   
  401c05:	c6 80 40 55 60 00 00 	movb   $0x0,0x605540(%rax)
  401c0c:	c3                   	retq   

0000000000401c0d <check_fail>:
  401c0d:	48 83 ec 08          	sub    $0x8,%rsp
  401c11:	0f be 15 30 45 20 00 	movsbl 0x204530(%rip),%edx        # 606148 <target_prefix>
  401c18:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401c1e:	8b 0d f4 38 20 00    	mov    0x2038f4(%rip),%ecx        # 605518 <check_level>
  401c24:	be 9b 34 40 00       	mov    $0x40349b,%esi
  401c29:	bf 01 00 00 00       	mov    $0x1,%edi
  401c2e:	b8 00 00 00 00       	mov    $0x0,%eax
  401c33:	e8 e8 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401c38:	bf 01 00 00 00       	mov    $0x1,%edi
  401c3d:	e8 2e f2 ff ff       	callq  400e70 <exit@plt>

0000000000401c42 <Gets>:
  401c42:	41 54                	push   %r12
  401c44:	55                   	push   %rbp
  401c45:	53                   	push   %rbx
  401c46:	49 89 fc             	mov    %rdi,%r12
  401c49:	c7 05 f1 44 20 00 00 	movl   $0x0,0x2044f1(%rip)        # 606144 <gets_cnt>
  401c50:	00 00 00 
  401c53:	48 89 fb             	mov    %rdi,%rbx
  401c56:	eb 11                	jmp    401c69 <Gets+0x27>
  401c58:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401c5c:	88 03                	mov    %al,(%rbx)
  401c5e:	0f b6 f8             	movzbl %al,%edi
  401c61:	e8 3c ff ff ff       	callq  401ba2 <save_char>
  401c66:	48 89 eb             	mov    %rbp,%rbx
  401c69:	48 8b 3d a0 38 20 00 	mov    0x2038a0(%rip),%rdi        # 605510 <infile>
  401c70:	e8 7b f1 ff ff       	callq  400df0 <_IO_getc@plt>
  401c75:	83 f8 ff             	cmp    $0xffffffff,%eax
  401c78:	74 05                	je     401c7f <Gets+0x3d>
  401c7a:	83 f8 0a             	cmp    $0xa,%eax
  401c7d:	75 d9                	jne    401c58 <Gets+0x16>
  401c7f:	c6 03 00             	movb   $0x0,(%rbx)
  401c82:	b8 00 00 00 00       	mov    $0x0,%eax
  401c87:	e8 6e ff ff ff       	callq  401bfa <save_term>
  401c8c:	4c 89 e0             	mov    %r12,%rax
  401c8f:	5b                   	pop    %rbx
  401c90:	5d                   	pop    %rbp
  401c91:	41 5c                	pop    %r12
  401c93:	c3                   	retq   

0000000000401c94 <notify_server>:
  401c94:	53                   	push   %rbx
  401c95:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401c9c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401ca3:	00 00 
  401ca5:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401cac:	00 
  401cad:	31 c0                	xor    %eax,%eax
  401caf:	83 3d 72 38 20 00 00 	cmpl   $0x0,0x203872(%rip)        # 605528 <is_checker>
  401cb6:	0f 85 aa 01 00 00    	jne    401e66 <notify_server+0x1d2>
  401cbc:	89 fb                	mov    %edi,%ebx
  401cbe:	8b 05 80 44 20 00    	mov    0x204480(%rip),%eax        # 606144 <gets_cnt>
  401cc4:	83 c0 64             	add    $0x64,%eax
  401cc7:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401ccc:	7e 1e                	jle    401cec <notify_server+0x58>
  401cce:	be d0 35 40 00       	mov    $0x4035d0,%esi
  401cd3:	bf 01 00 00 00       	mov    $0x1,%edi
  401cd8:	b8 00 00 00 00       	mov    $0x0,%eax
  401cdd:	e8 3e f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401ce2:	bf 01 00 00 00       	mov    $0x1,%edi
  401ce7:	e8 84 f1 ff ff       	callq  400e70 <exit@plt>
  401cec:	0f be 05 55 44 20 00 	movsbl 0x204455(%rip),%eax        # 606148 <target_prefix>
  401cf3:	83 3d ae 37 20 00 00 	cmpl   $0x0,0x2037ae(%rip)        # 6054a8 <notify>
  401cfa:	74 08                	je     401d04 <notify_server+0x70>
  401cfc:	8b 15 1e 38 20 00    	mov    0x20381e(%rip),%edx        # 605520 <authkey>
  401d02:	eb 05                	jmp    401d09 <notify_server+0x75>
  401d04:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401d09:	85 db                	test   %ebx,%ebx
  401d0b:	74 08                	je     401d15 <notify_server+0x81>
  401d0d:	41 b9 b1 34 40 00    	mov    $0x4034b1,%r9d
  401d13:	eb 06                	jmp    401d1b <notify_server+0x87>
  401d15:	41 b9 b6 34 40 00    	mov    $0x4034b6,%r9d
  401d1b:	68 40 55 60 00       	pushq  $0x605540
  401d20:	56                   	push   %rsi
  401d21:	50                   	push   %rax
  401d22:	52                   	push   %rdx
  401d23:	44 8b 05 3e 34 20 00 	mov    0x20343e(%rip),%r8d        # 605168 <target_id>
  401d2a:	b9 bb 34 40 00       	mov    $0x4034bb,%ecx
  401d2f:	ba 00 20 00 00       	mov    $0x2000,%edx
  401d34:	be 01 00 00 00       	mov    $0x1,%esi
  401d39:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401d3e:	b8 00 00 00 00       	mov    $0x0,%eax
  401d43:	e8 58 f1 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  401d48:	48 83 c4 20          	add    $0x20,%rsp
  401d4c:	83 3d 55 37 20 00 00 	cmpl   $0x0,0x203755(%rip)        # 6054a8 <notify>
  401d53:	0f 84 81 00 00 00    	je     401dda <notify_server+0x146>
  401d59:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401d60:	00 
  401d61:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401d67:	48 89 e1             	mov    %rsp,%rcx
  401d6a:	48 8b 15 ff 33 20 00 	mov    0x2033ff(%rip),%rdx        # 605170 <lab>
  401d71:	48 8b 35 00 34 20 00 	mov    0x203400(%rip),%rsi        # 605178 <course>
  401d78:	48 8b 3d e1 33 20 00 	mov    0x2033e1(%rip),%rdi        # 605160 <user_id>
  401d7f:	e8 0e 11 00 00       	callq  402e92 <driver_post>
  401d84:	85 c0                	test   %eax,%eax
  401d86:	79 26                	jns    401dae <notify_server+0x11a>
  401d88:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401d8f:	00 
  401d90:	be d7 34 40 00       	mov    $0x4034d7,%esi
  401d95:	bf 01 00 00 00       	mov    $0x1,%edi
  401d9a:	b8 00 00 00 00       	mov    $0x0,%eax
  401d9f:	e8 7c f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401da4:	bf 01 00 00 00       	mov    $0x1,%edi
  401da9:	e8 c2 f0 ff ff       	callq  400e70 <exit@plt>
  401dae:	85 db                	test   %ebx,%ebx
  401db0:	74 19                	je     401dcb <notify_server+0x137>
  401db2:	bf 00 36 40 00       	mov    $0x403600,%edi
  401db7:	e8 34 ef ff ff       	callq  400cf0 <puts@plt>
  401dbc:	bf e3 34 40 00       	mov    $0x4034e3,%edi
  401dc1:	e8 2a ef ff ff       	callq  400cf0 <puts@plt>
  401dc6:	e9 9b 00 00 00       	jmpq   401e66 <notify_server+0x1d2>
  401dcb:	bf ed 34 40 00       	mov    $0x4034ed,%edi
  401dd0:	e8 1b ef ff ff       	callq  400cf0 <puts@plt>
  401dd5:	e9 8c 00 00 00       	jmpq   401e66 <notify_server+0x1d2>
  401dda:	85 db                	test   %ebx,%ebx
  401ddc:	74 07                	je     401de5 <notify_server+0x151>
  401dde:	ba b1 34 40 00       	mov    $0x4034b1,%edx
  401de3:	eb 05                	jmp    401dea <notify_server+0x156>
  401de5:	ba b6 34 40 00       	mov    $0x4034b6,%edx
  401dea:	be 38 36 40 00       	mov    $0x403638,%esi
  401def:	bf 01 00 00 00       	mov    $0x1,%edi
  401df4:	b8 00 00 00 00       	mov    $0x0,%eax
  401df9:	e8 22 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401dfe:	48 8b 15 5b 33 20 00 	mov    0x20335b(%rip),%rdx        # 605160 <user_id>
  401e05:	be f4 34 40 00       	mov    $0x4034f4,%esi
  401e0a:	bf 01 00 00 00       	mov    $0x1,%edi
  401e0f:	b8 00 00 00 00       	mov    $0x0,%eax
  401e14:	e8 07 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401e19:	48 8b 15 58 33 20 00 	mov    0x203358(%rip),%rdx        # 605178 <course>
  401e20:	be 01 35 40 00       	mov    $0x403501,%esi
  401e25:	bf 01 00 00 00       	mov    $0x1,%edi
  401e2a:	b8 00 00 00 00       	mov    $0x0,%eax
  401e2f:	e8 ec ef ff ff       	callq  400e20 <__printf_chk@plt>
  401e34:	48 8b 15 35 33 20 00 	mov    0x203335(%rip),%rdx        # 605170 <lab>
  401e3b:	be 0d 35 40 00       	mov    $0x40350d,%esi
  401e40:	bf 01 00 00 00       	mov    $0x1,%edi
  401e45:	b8 00 00 00 00       	mov    $0x0,%eax
  401e4a:	e8 d1 ef ff ff       	callq  400e20 <__printf_chk@plt>
  401e4f:	48 89 e2             	mov    %rsp,%rdx
  401e52:	be 16 35 40 00       	mov    $0x403516,%esi
  401e57:	bf 01 00 00 00       	mov    $0x1,%edi
  401e5c:	b8 00 00 00 00       	mov    $0x0,%eax
  401e61:	e8 ba ef ff ff       	callq  400e20 <__printf_chk@plt>
  401e66:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  401e6d:	00 
  401e6e:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401e75:	00 00 
  401e77:	74 05                	je     401e7e <notify_server+0x1ea>
  401e79:	e8 92 ee ff ff       	callq  400d10 <__stack_chk_fail@plt>
  401e7e:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401e85:	5b                   	pop    %rbx
  401e86:	c3                   	retq   

0000000000401e87 <validate>:
  401e87:	53                   	push   %rbx
  401e88:	89 fb                	mov    %edi,%ebx
  401e8a:	83 3d 97 36 20 00 00 	cmpl   $0x0,0x203697(%rip)        # 605528 <is_checker>
  401e91:	74 6b                	je     401efe <validate+0x77>
  401e93:	39 3d 83 36 20 00    	cmp    %edi,0x203683(%rip)        # 60551c <vlevel>
  401e99:	74 14                	je     401eaf <validate+0x28>
  401e9b:	bf 22 35 40 00       	mov    $0x403522,%edi
  401ea0:	e8 4b ee ff ff       	callq  400cf0 <puts@plt>
  401ea5:	b8 00 00 00 00       	mov    $0x0,%eax
  401eaa:	e8 5e fd ff ff       	callq  401c0d <check_fail>
  401eaf:	8b 15 63 36 20 00    	mov    0x203663(%rip),%edx        # 605518 <check_level>
  401eb5:	39 d7                	cmp    %edx,%edi
  401eb7:	74 20                	je     401ed9 <validate+0x52>
  401eb9:	89 f9                	mov    %edi,%ecx
  401ebb:	be 60 36 40 00       	mov    $0x403660,%esi
  401ec0:	bf 01 00 00 00       	mov    $0x1,%edi
  401ec5:	b8 00 00 00 00       	mov    $0x0,%eax
  401eca:	e8 51 ef ff ff       	callq  400e20 <__printf_chk@plt>
  401ecf:	b8 00 00 00 00       	mov    $0x0,%eax
  401ed4:	e8 34 fd ff ff       	callq  401c0d <check_fail>
  401ed9:	0f be 15 68 42 20 00 	movsbl 0x204268(%rip),%edx        # 606148 <target_prefix>
  401ee0:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401ee6:	89 f9                	mov    %edi,%ecx
  401ee8:	be 40 35 40 00       	mov    $0x403540,%esi
  401eed:	bf 01 00 00 00       	mov    $0x1,%edi
  401ef2:	b8 00 00 00 00       	mov    $0x0,%eax
  401ef7:	e8 24 ef ff ff       	callq  400e20 <__printf_chk@plt>
  401efc:	eb 49                	jmp    401f47 <validate+0xc0>
  401efe:	3b 3d 18 36 20 00    	cmp    0x203618(%rip),%edi        # 60551c <vlevel>
  401f04:	74 18                	je     401f1e <validate+0x97>
  401f06:	bf 22 35 40 00       	mov    $0x403522,%edi
  401f0b:	e8 e0 ed ff ff       	callq  400cf0 <puts@plt>
  401f10:	89 de                	mov    %ebx,%esi
  401f12:	bf 00 00 00 00       	mov    $0x0,%edi
  401f17:	e8 78 fd ff ff       	callq  401c94 <notify_server>
  401f1c:	eb 29                	jmp    401f47 <validate+0xc0>
  401f1e:	0f be 0d 23 42 20 00 	movsbl 0x204223(%rip),%ecx        # 606148 <target_prefix>
  401f25:	89 fa                	mov    %edi,%edx
  401f27:	be 88 36 40 00       	mov    $0x403688,%esi
  401f2c:	bf 01 00 00 00       	mov    $0x1,%edi
  401f31:	b8 00 00 00 00       	mov    $0x0,%eax
  401f36:	e8 e5 ee ff ff       	callq  400e20 <__printf_chk@plt>
  401f3b:	89 de                	mov    %ebx,%esi
  401f3d:	bf 01 00 00 00       	mov    $0x1,%edi
  401f42:	e8 4d fd ff ff       	callq  401c94 <notify_server>
  401f47:	5b                   	pop    %rbx
  401f48:	c3                   	retq   

0000000000401f49 <fail>:
  401f49:	48 83 ec 08          	sub    $0x8,%rsp
  401f4d:	83 3d d4 35 20 00 00 	cmpl   $0x0,0x2035d4(%rip)        # 605528 <is_checker>
  401f54:	74 0a                	je     401f60 <fail+0x17>
  401f56:	b8 00 00 00 00       	mov    $0x0,%eax
  401f5b:	e8 ad fc ff ff       	callq  401c0d <check_fail>
  401f60:	89 fe                	mov    %edi,%esi
  401f62:	bf 00 00 00 00       	mov    $0x0,%edi
  401f67:	e8 28 fd ff ff       	callq  401c94 <notify_server>
  401f6c:	48 83 c4 08          	add    $0x8,%rsp
  401f70:	c3                   	retq   

0000000000401f71 <bushandler>:
  401f71:	48 83 ec 08          	sub    $0x8,%rsp
  401f75:	83 3d ac 35 20 00 00 	cmpl   $0x0,0x2035ac(%rip)        # 605528 <is_checker>
  401f7c:	74 14                	je     401f92 <bushandler+0x21>
  401f7e:	bf 55 35 40 00       	mov    $0x403555,%edi
  401f83:	e8 68 ed ff ff       	callq  400cf0 <puts@plt>
  401f88:	b8 00 00 00 00       	mov    $0x0,%eax
  401f8d:	e8 7b fc ff ff       	callq  401c0d <check_fail>
  401f92:	bf c0 36 40 00       	mov    $0x4036c0,%edi
  401f97:	e8 54 ed ff ff       	callq  400cf0 <puts@plt>
  401f9c:	bf 5f 35 40 00       	mov    $0x40355f,%edi
  401fa1:	e8 4a ed ff ff       	callq  400cf0 <puts@plt>
  401fa6:	be 00 00 00 00       	mov    $0x0,%esi
  401fab:	bf 00 00 00 00       	mov    $0x0,%edi
  401fb0:	e8 df fc ff ff       	callq  401c94 <notify_server>
  401fb5:	bf 01 00 00 00       	mov    $0x1,%edi
  401fba:	e8 b1 ee ff ff       	callq  400e70 <exit@plt>

0000000000401fbf <seghandler>:
  401fbf:	48 83 ec 08          	sub    $0x8,%rsp
  401fc3:	83 3d 5e 35 20 00 00 	cmpl   $0x0,0x20355e(%rip)        # 605528 <is_checker>
  401fca:	74 14                	je     401fe0 <seghandler+0x21>
  401fcc:	bf 75 35 40 00       	mov    $0x403575,%edi
  401fd1:	e8 1a ed ff ff       	callq  400cf0 <puts@plt>
  401fd6:	b8 00 00 00 00       	mov    $0x0,%eax
  401fdb:	e8 2d fc ff ff       	callq  401c0d <check_fail>
  401fe0:	bf e0 36 40 00       	mov    $0x4036e0,%edi
  401fe5:	e8 06 ed ff ff       	callq  400cf0 <puts@plt>
  401fea:	bf 5f 35 40 00       	mov    $0x40355f,%edi
  401fef:	e8 fc ec ff ff       	callq  400cf0 <puts@plt>
  401ff4:	be 00 00 00 00       	mov    $0x0,%esi
  401ff9:	bf 00 00 00 00       	mov    $0x0,%edi
  401ffe:	e8 91 fc ff ff       	callq  401c94 <notify_server>
  402003:	bf 01 00 00 00       	mov    $0x1,%edi
  402008:	e8 63 ee ff ff       	callq  400e70 <exit@plt>

000000000040200d <illegalhandler>:
  40200d:	48 83 ec 08          	sub    $0x8,%rsp
  402011:	83 3d 10 35 20 00 00 	cmpl   $0x0,0x203510(%rip)        # 605528 <is_checker>
  402018:	74 14                	je     40202e <illegalhandler+0x21>
  40201a:	bf 88 35 40 00       	mov    $0x403588,%edi
  40201f:	e8 cc ec ff ff       	callq  400cf0 <puts@plt>
  402024:	b8 00 00 00 00       	mov    $0x0,%eax
  402029:	e8 df fb ff ff       	callq  401c0d <check_fail>
  40202e:	bf 08 37 40 00       	mov    $0x403708,%edi
  402033:	e8 b8 ec ff ff       	callq  400cf0 <puts@plt>
  402038:	bf 5f 35 40 00       	mov    $0x40355f,%edi
  40203d:	e8 ae ec ff ff       	callq  400cf0 <puts@plt>
  402042:	be 00 00 00 00       	mov    $0x0,%esi
  402047:	bf 00 00 00 00       	mov    $0x0,%edi
  40204c:	e8 43 fc ff ff       	callq  401c94 <notify_server>
  402051:	bf 01 00 00 00       	mov    $0x1,%edi
  402056:	e8 15 ee ff ff       	callq  400e70 <exit@plt>

000000000040205b <sigalrmhandler>:
  40205b:	48 83 ec 08          	sub    $0x8,%rsp
  40205f:	83 3d c2 34 20 00 00 	cmpl   $0x0,0x2034c2(%rip)        # 605528 <is_checker>
  402066:	74 14                	je     40207c <sigalrmhandler+0x21>
  402068:	bf 9c 35 40 00       	mov    $0x40359c,%edi
  40206d:	e8 7e ec ff ff       	callq  400cf0 <puts@plt>
  402072:	b8 00 00 00 00       	mov    $0x0,%eax
  402077:	e8 91 fb ff ff       	callq  401c0d <check_fail>
  40207c:	ba 05 00 00 00       	mov    $0x5,%edx
  402081:	be 38 37 40 00       	mov    $0x403738,%esi
  402086:	bf 01 00 00 00       	mov    $0x1,%edi
  40208b:	b8 00 00 00 00       	mov    $0x0,%eax
  402090:	e8 8b ed ff ff       	callq  400e20 <__printf_chk@plt>
  402095:	be 00 00 00 00       	mov    $0x0,%esi
  40209a:	bf 00 00 00 00       	mov    $0x0,%edi
  40209f:	e8 f0 fb ff ff       	callq  401c94 <notify_server>
  4020a4:	bf 01 00 00 00       	mov    $0x1,%edi
  4020a9:	e8 c2 ed ff ff       	callq  400e70 <exit@plt>

00000000004020ae <launch>:
  4020ae:	55                   	push   %rbp
  4020af:	48 89 e5             	mov    %rsp,%rbp
  4020b2:	48 83 ec 10          	sub    $0x10,%rsp
  4020b6:	48 89 fa             	mov    %rdi,%rdx
  4020b9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4020c0:	00 00 
  4020c2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4020c6:	31 c0                	xor    %eax,%eax
  4020c8:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  4020cc:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  4020d0:	48 29 c4             	sub    %rax,%rsp
  4020d3:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  4020d8:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  4020dc:	be f4 00 00 00       	mov    $0xf4,%esi
  4020e1:	e8 4a ec ff ff       	callq  400d30 <memset@plt>
  4020e6:	48 8b 05 d3 33 20 00 	mov    0x2033d3(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  4020ed:	48 39 05 1c 34 20 00 	cmp    %rax,0x20341c(%rip)        # 605510 <infile>
  4020f4:	75 14                	jne    40210a <launch+0x5c>
  4020f6:	be a4 35 40 00       	mov    $0x4035a4,%esi
  4020fb:	bf 01 00 00 00       	mov    $0x1,%edi
  402100:	b8 00 00 00 00       	mov    $0x0,%eax
  402105:	e8 16 ed ff ff       	callq  400e20 <__printf_chk@plt>
  40210a:	c7 05 08 34 20 00 00 	movl   $0x0,0x203408(%rip)        # 60551c <vlevel>
  402111:	00 00 00 
  402114:	b8 00 00 00 00       	mov    $0x0,%eax
  402119:	e8 3c f9 ff ff       	callq  401a5a <test>
  40211e:	83 3d 03 34 20 00 00 	cmpl   $0x0,0x203403(%rip)        # 605528 <is_checker>
  402125:	74 14                	je     40213b <launch+0x8d>
  402127:	bf b1 35 40 00       	mov    $0x4035b1,%edi
  40212c:	e8 bf eb ff ff       	callq  400cf0 <puts@plt>
  402131:	b8 00 00 00 00       	mov    $0x0,%eax
  402136:	e8 d2 fa ff ff       	callq  401c0d <check_fail>
  40213b:	bf bc 35 40 00       	mov    $0x4035bc,%edi
  402140:	e8 ab eb ff ff       	callq  400cf0 <puts@plt>
  402145:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  402149:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  402150:	00 00 
  402152:	74 05                	je     402159 <launch+0xab>
  402154:	e8 b7 eb ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402159:	c9                   	leaveq 
  40215a:	c3                   	retq   

000000000040215b <stable_launch>:
  40215b:	53                   	push   %rbx
  40215c:	48 89 3d a5 33 20 00 	mov    %rdi,0x2033a5(%rip)        # 605508 <global_offset>
  402163:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  402169:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  40216f:	b9 32 01 00 00       	mov    $0x132,%ecx
  402174:	ba 07 00 00 00       	mov    $0x7,%edx
  402179:	be 00 00 10 00       	mov    $0x100000,%esi
  40217e:	bf 00 60 58 55       	mov    $0x55586000,%edi
  402183:	e8 98 eb ff ff       	callq  400d20 <mmap@plt>
  402188:	48 89 c3             	mov    %rax,%rbx
  40218b:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  402191:	74 37                	je     4021ca <stable_launch+0x6f>
  402193:	be 00 00 10 00       	mov    $0x100000,%esi
  402198:	48 89 c7             	mov    %rax,%rdi
  40219b:	e8 70 ec ff ff       	callq  400e10 <munmap@plt>
  4021a0:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  4021a5:	ba 70 37 40 00       	mov    $0x403770,%edx
  4021aa:	be 01 00 00 00       	mov    $0x1,%esi
  4021af:	48 8b 3d 2a 33 20 00 	mov    0x20332a(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  4021b6:	b8 00 00 00 00       	mov    $0x0,%eax
  4021bb:	e8 d0 ec ff ff       	callq  400e90 <__fprintf_chk@plt>
  4021c0:	bf 01 00 00 00       	mov    $0x1,%edi
  4021c5:	e8 a6 ec ff ff       	callq  400e70 <exit@plt>
  4021ca:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  4021d1:	48 89 15 78 3f 20 00 	mov    %rdx,0x203f78(%rip)        # 606150 <stack_top>
  4021d8:	48 89 e0             	mov    %rsp,%rax
  4021db:	48 89 d4             	mov    %rdx,%rsp
  4021de:	48 89 c2             	mov    %rax,%rdx
  4021e1:	48 89 15 18 33 20 00 	mov    %rdx,0x203318(%rip)        # 605500 <global_save_stack>
  4021e8:	48 8b 3d 19 33 20 00 	mov    0x203319(%rip),%rdi        # 605508 <global_offset>
  4021ef:	e8 ba fe ff ff       	callq  4020ae <launch>
  4021f4:	48 8b 05 05 33 20 00 	mov    0x203305(%rip),%rax        # 605500 <global_save_stack>
  4021fb:	48 89 c4             	mov    %rax,%rsp
  4021fe:	be 00 00 10 00       	mov    $0x100000,%esi
  402203:	48 89 df             	mov    %rbx,%rdi
  402206:	e8 05 ec ff ff       	callq  400e10 <munmap@plt>
  40220b:	5b                   	pop    %rbx
  40220c:	c3                   	retq   

000000000040220d <rio_readinitb>:
  40220d:	89 37                	mov    %esi,(%rdi)
  40220f:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  402216:	48 8d 47 10          	lea    0x10(%rdi),%rax
  40221a:	48 89 47 08          	mov    %rax,0x8(%rdi)
  40221e:	c3                   	retq   

000000000040221f <sigalrm_handler>:
  40221f:	48 83 ec 08          	sub    $0x8,%rsp
  402223:	b9 00 00 00 00       	mov    $0x0,%ecx
  402228:	ba b0 37 40 00       	mov    $0x4037b0,%edx
  40222d:	be 01 00 00 00       	mov    $0x1,%esi
  402232:	48 8b 3d a7 32 20 00 	mov    0x2032a7(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  402239:	b8 00 00 00 00       	mov    $0x0,%eax
  40223e:	e8 4d ec ff ff       	callq  400e90 <__fprintf_chk@plt>
  402243:	bf 01 00 00 00       	mov    $0x1,%edi
  402248:	e8 23 ec ff ff       	callq  400e70 <exit@plt>

000000000040224d <rio_writen>:
  40224d:	41 55                	push   %r13
  40224f:	41 54                	push   %r12
  402251:	55                   	push   %rbp
  402252:	53                   	push   %rbx
  402253:	48 83 ec 08          	sub    $0x8,%rsp
  402257:	41 89 fc             	mov    %edi,%r12d
  40225a:	48 89 f5             	mov    %rsi,%rbp
  40225d:	49 89 d5             	mov    %rdx,%r13
  402260:	48 89 d3             	mov    %rdx,%rbx
  402263:	eb 28                	jmp    40228d <rio_writen+0x40>
  402265:	48 89 da             	mov    %rbx,%rdx
  402268:	48 89 ee             	mov    %rbp,%rsi
  40226b:	44 89 e7             	mov    %r12d,%edi
  40226e:	e8 8d ea ff ff       	callq  400d00 <write@plt>
  402273:	48 85 c0             	test   %rax,%rax
  402276:	7f 0f                	jg     402287 <rio_writen+0x3a>
  402278:	e8 33 ea ff ff       	callq  400cb0 <__errno_location@plt>
  40227d:	83 38 04             	cmpl   $0x4,(%rax)
  402280:	75 15                	jne    402297 <rio_writen+0x4a>
  402282:	b8 00 00 00 00       	mov    $0x0,%eax
  402287:	48 29 c3             	sub    %rax,%rbx
  40228a:	48 01 c5             	add    %rax,%rbp
  40228d:	48 85 db             	test   %rbx,%rbx
  402290:	75 d3                	jne    402265 <rio_writen+0x18>
  402292:	4c 89 e8             	mov    %r13,%rax
  402295:	eb 07                	jmp    40229e <rio_writen+0x51>
  402297:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40229e:	48 83 c4 08          	add    $0x8,%rsp
  4022a2:	5b                   	pop    %rbx
  4022a3:	5d                   	pop    %rbp
  4022a4:	41 5c                	pop    %r12
  4022a6:	41 5d                	pop    %r13
  4022a8:	c3                   	retq   

00000000004022a9 <rio_read>:
  4022a9:	41 55                	push   %r13
  4022ab:	41 54                	push   %r12
  4022ad:	55                   	push   %rbp
  4022ae:	53                   	push   %rbx
  4022af:	48 83 ec 08          	sub    $0x8,%rsp
  4022b3:	48 89 fb             	mov    %rdi,%rbx
  4022b6:	49 89 f5             	mov    %rsi,%r13
  4022b9:	49 89 d4             	mov    %rdx,%r12
  4022bc:	eb 2e                	jmp    4022ec <rio_read+0x43>
  4022be:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  4022c2:	8b 3b                	mov    (%rbx),%edi
  4022c4:	ba 00 20 00 00       	mov    $0x2000,%edx
  4022c9:	48 89 ee             	mov    %rbp,%rsi
  4022cc:	e8 8f ea ff ff       	callq  400d60 <read@plt>
  4022d1:	89 43 04             	mov    %eax,0x4(%rbx)
  4022d4:	85 c0                	test   %eax,%eax
  4022d6:	79 0c                	jns    4022e4 <rio_read+0x3b>
  4022d8:	e8 d3 e9 ff ff       	callq  400cb0 <__errno_location@plt>
  4022dd:	83 38 04             	cmpl   $0x4,(%rax)
  4022e0:	74 0a                	je     4022ec <rio_read+0x43>
  4022e2:	eb 37                	jmp    40231b <rio_read+0x72>
  4022e4:	85 c0                	test   %eax,%eax
  4022e6:	74 3c                	je     402324 <rio_read+0x7b>
  4022e8:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4022ec:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4022ef:	85 ed                	test   %ebp,%ebp
  4022f1:	7e cb                	jle    4022be <rio_read+0x15>
  4022f3:	89 e8                	mov    %ebp,%eax
  4022f5:	49 39 c4             	cmp    %rax,%r12
  4022f8:	77 03                	ja     4022fd <rio_read+0x54>
  4022fa:	44 89 e5             	mov    %r12d,%ebp
  4022fd:	4c 63 e5             	movslq %ebp,%r12
  402300:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  402304:	4c 89 e2             	mov    %r12,%rdx
  402307:	4c 89 ef             	mov    %r13,%rdi
  40230a:	e8 b1 ea ff ff       	callq  400dc0 <memcpy@plt>
  40230f:	4c 01 63 08          	add    %r12,0x8(%rbx)
  402313:	29 6b 04             	sub    %ebp,0x4(%rbx)
  402316:	4c 89 e0             	mov    %r12,%rax
  402319:	eb 0e                	jmp    402329 <rio_read+0x80>
  40231b:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402322:	eb 05                	jmp    402329 <rio_read+0x80>
  402324:	b8 00 00 00 00       	mov    $0x0,%eax
  402329:	48 83 c4 08          	add    $0x8,%rsp
  40232d:	5b                   	pop    %rbx
  40232e:	5d                   	pop    %rbp
  40232f:	41 5c                	pop    %r12
  402331:	41 5d                	pop    %r13
  402333:	c3                   	retq   

0000000000402334 <rio_readlineb>:
  402334:	41 55                	push   %r13
  402336:	41 54                	push   %r12
  402338:	55                   	push   %rbp
  402339:	53                   	push   %rbx
  40233a:	48 83 ec 18          	sub    $0x18,%rsp
  40233e:	49 89 fd             	mov    %rdi,%r13
  402341:	48 89 f5             	mov    %rsi,%rbp
  402344:	49 89 d4             	mov    %rdx,%r12
  402347:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40234e:	00 00 
  402350:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402355:	31 c0                	xor    %eax,%eax
  402357:	bb 01 00 00 00       	mov    $0x1,%ebx
  40235c:	eb 3f                	jmp    40239d <rio_readlineb+0x69>
  40235e:	ba 01 00 00 00       	mov    $0x1,%edx
  402363:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  402368:	4c 89 ef             	mov    %r13,%rdi
  40236b:	e8 39 ff ff ff       	callq  4022a9 <rio_read>
  402370:	83 f8 01             	cmp    $0x1,%eax
  402373:	75 15                	jne    40238a <rio_readlineb+0x56>
  402375:	48 8d 45 01          	lea    0x1(%rbp),%rax
  402379:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  40237e:	88 55 00             	mov    %dl,0x0(%rbp)
  402381:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  402386:	75 0e                	jne    402396 <rio_readlineb+0x62>
  402388:	eb 1a                	jmp    4023a4 <rio_readlineb+0x70>
  40238a:	85 c0                	test   %eax,%eax
  40238c:	75 22                	jne    4023b0 <rio_readlineb+0x7c>
  40238e:	48 83 fb 01          	cmp    $0x1,%rbx
  402392:	75 13                	jne    4023a7 <rio_readlineb+0x73>
  402394:	eb 23                	jmp    4023b9 <rio_readlineb+0x85>
  402396:	48 83 c3 01          	add    $0x1,%rbx
  40239a:	48 89 c5             	mov    %rax,%rbp
  40239d:	4c 39 e3             	cmp    %r12,%rbx
  4023a0:	72 bc                	jb     40235e <rio_readlineb+0x2a>
  4023a2:	eb 03                	jmp    4023a7 <rio_readlineb+0x73>
  4023a4:	48 89 c5             	mov    %rax,%rbp
  4023a7:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  4023ab:	48 89 d8             	mov    %rbx,%rax
  4023ae:	eb 0e                	jmp    4023be <rio_readlineb+0x8a>
  4023b0:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4023b7:	eb 05                	jmp    4023be <rio_readlineb+0x8a>
  4023b9:	b8 00 00 00 00       	mov    $0x0,%eax
  4023be:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  4023c3:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4023ca:	00 00 
  4023cc:	74 05                	je     4023d3 <rio_readlineb+0x9f>
  4023ce:	e8 3d e9 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  4023d3:	48 83 c4 18          	add    $0x18,%rsp
  4023d7:	5b                   	pop    %rbx
  4023d8:	5d                   	pop    %rbp
  4023d9:	41 5c                	pop    %r12
  4023db:	41 5d                	pop    %r13
  4023dd:	c3                   	retq   

00000000004023de <urlencode>:
  4023de:	41 54                	push   %r12
  4023e0:	55                   	push   %rbp
  4023e1:	53                   	push   %rbx
  4023e2:	48 83 ec 10          	sub    $0x10,%rsp
  4023e6:	48 89 fb             	mov    %rdi,%rbx
  4023e9:	48 89 f5             	mov    %rsi,%rbp
  4023ec:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4023f3:	00 00 
  4023f5:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4023fa:	31 c0                	xor    %eax,%eax
  4023fc:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402403:	f2 ae                	repnz scas %es:(%rdi),%al
  402405:	48 f7 d1             	not    %rcx
  402408:	8d 41 ff             	lea    -0x1(%rcx),%eax
  40240b:	e9 aa 00 00 00       	jmpq   4024ba <urlencode+0xdc>
  402410:	44 0f b6 03          	movzbl (%rbx),%r8d
  402414:	41 80 f8 2a          	cmp    $0x2a,%r8b
  402418:	0f 94 c2             	sete   %dl
  40241b:	41 80 f8 2d          	cmp    $0x2d,%r8b
  40241f:	0f 94 c0             	sete   %al
  402422:	08 c2                	or     %al,%dl
  402424:	75 24                	jne    40244a <urlencode+0x6c>
  402426:	41 80 f8 2e          	cmp    $0x2e,%r8b
  40242a:	74 1e                	je     40244a <urlencode+0x6c>
  40242c:	41 80 f8 5f          	cmp    $0x5f,%r8b
  402430:	74 18                	je     40244a <urlencode+0x6c>
  402432:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  402436:	3c 09                	cmp    $0x9,%al
  402438:	76 10                	jbe    40244a <urlencode+0x6c>
  40243a:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  40243e:	3c 19                	cmp    $0x19,%al
  402440:	76 08                	jbe    40244a <urlencode+0x6c>
  402442:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  402446:	3c 19                	cmp    $0x19,%al
  402448:	77 0a                	ja     402454 <urlencode+0x76>
  40244a:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  40244e:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402452:	eb 5f                	jmp    4024b3 <urlencode+0xd5>
  402454:	41 80 f8 20          	cmp    $0x20,%r8b
  402458:	75 0a                	jne    402464 <urlencode+0x86>
  40245a:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  40245e:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402462:	eb 4f                	jmp    4024b3 <urlencode+0xd5>
  402464:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  402468:	3c 5f                	cmp    $0x5f,%al
  40246a:	0f 96 c2             	setbe  %dl
  40246d:	41 80 f8 09          	cmp    $0x9,%r8b
  402471:	0f 94 c0             	sete   %al
  402474:	08 c2                	or     %al,%dl
  402476:	74 50                	je     4024c8 <urlencode+0xea>
  402478:	45 0f b6 c0          	movzbl %r8b,%r8d
  40247c:	b9 68 38 40 00       	mov    $0x403868,%ecx
  402481:	ba 08 00 00 00       	mov    $0x8,%edx
  402486:	be 01 00 00 00       	mov    $0x1,%esi
  40248b:	48 89 e7             	mov    %rsp,%rdi
  40248e:	b8 00 00 00 00       	mov    $0x0,%eax
  402493:	e8 08 ea ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402498:	0f b6 04 24          	movzbl (%rsp),%eax
  40249c:	88 45 00             	mov    %al,0x0(%rbp)
  40249f:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  4024a4:	88 45 01             	mov    %al,0x1(%rbp)
  4024a7:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  4024ac:	88 45 02             	mov    %al,0x2(%rbp)
  4024af:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  4024b3:	48 83 c3 01          	add    $0x1,%rbx
  4024b7:	44 89 e0             	mov    %r12d,%eax
  4024ba:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  4024be:	85 c0                	test   %eax,%eax
  4024c0:	0f 85 4a ff ff ff    	jne    402410 <urlencode+0x32>
  4024c6:	eb 05                	jmp    4024cd <urlencode+0xef>
  4024c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024cd:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4024d2:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4024d9:	00 00 
  4024db:	74 05                	je     4024e2 <urlencode+0x104>
  4024dd:	e8 2e e8 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  4024e2:	48 83 c4 10          	add    $0x10,%rsp
  4024e6:	5b                   	pop    %rbx
  4024e7:	5d                   	pop    %rbp
  4024e8:	41 5c                	pop    %r12
  4024ea:	c3                   	retq   

00000000004024eb <submitr>:
  4024eb:	41 57                	push   %r15
  4024ed:	41 56                	push   %r14
  4024ef:	41 55                	push   %r13
  4024f1:	41 54                	push   %r12
  4024f3:	55                   	push   %rbp
  4024f4:	53                   	push   %rbx
  4024f5:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  4024fc:	49 89 fd             	mov    %rdi,%r13
  4024ff:	89 74 24 0c          	mov    %esi,0xc(%rsp)
  402503:	48 89 14 24          	mov    %rdx,(%rsp)
  402507:	49 89 ce             	mov    %rcx,%r14
  40250a:	4d 89 c7             	mov    %r8,%r15
  40250d:	4d 89 cc             	mov    %r9,%r12
  402510:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  402517:	00 
  402518:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40251f:	00 00 
  402521:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  402528:	00 
  402529:	31 c0                	xor    %eax,%eax
  40252b:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  402532:	00 
  402533:	ba 00 00 00 00       	mov    $0x0,%edx
  402538:	be 01 00 00 00       	mov    $0x1,%esi
  40253d:	bf 02 00 00 00       	mov    $0x2,%edi
  402542:	e8 69 e9 ff ff       	callq  400eb0 <socket@plt>
  402547:	85 c0                	test   %eax,%eax
  402549:	79 4e                	jns    402599 <submitr+0xae>
  40254b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402552:	3a 20 43 
  402555:	48 89 03             	mov    %rax,(%rbx)
  402558:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40255f:	20 75 6e 
  402562:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402566:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40256d:	74 6f 20 
  402570:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402574:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  40257b:	65 20 73 
  40257e:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402582:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402589:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  40258f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402594:	e9 b3 06 00 00       	jmpq   402c4c <submitr+0x761>
  402599:	89 c5                	mov    %eax,%ebp
  40259b:	4c 89 ef             	mov    %r13,%rdi
  40259e:	e8 ed e7 ff ff       	callq  400d90 <gethostbyname@plt>
  4025a3:	48 85 c0             	test   %rax,%rax
  4025a6:	75 75                	jne    40261d <submitr+0x132>
  4025a8:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4025af:	3a 20 44 
  4025b2:	48 89 03             	mov    %rax,(%rbx)
  4025b5:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4025bc:	20 75 6e 
  4025bf:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4025c3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4025ca:	74 6f 20 
  4025cd:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4025d1:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4025d8:	76 65 20 
  4025db:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4025df:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  4025e6:	61 62 20 
  4025e9:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025ed:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4025f4:	72 20 61 
  4025f7:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025fb:	c7 43 30 64 64 72 65 	movl   $0x65726464,0x30(%rbx)
  402602:	66 c7 43 34 73 73    	movw   $0x7373,0x34(%rbx)
  402608:	c6 43 36 00          	movb   $0x0,0x36(%rbx)
  40260c:	89 ef                	mov    %ebp,%edi
  40260e:	e8 3d e7 ff ff       	callq  400d50 <close@plt>
  402613:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402618:	e9 2f 06 00 00       	jmpq   402c4c <submitr+0x761>
  40261d:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  402624:	00 00 
  402626:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  40262d:	00 00 
  40262f:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  402636:	48 63 50 14          	movslq 0x14(%rax),%rdx
  40263a:	48 8b 40 18          	mov    0x18(%rax),%rax
  40263e:	48 8b 30             	mov    (%rax),%rsi
  402641:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
  402646:	b9 0c 00 00 00       	mov    $0xc,%ecx
  40264b:	e8 50 e7 ff ff       	callq  400da0 <__memmove_chk@plt>
  402650:	0f b7 44 24 0c       	movzwl 0xc(%rsp),%eax
  402655:	66 c1 c8 08          	ror    $0x8,%ax
  402659:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  40265e:	ba 10 00 00 00       	mov    $0x10,%edx
  402663:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  402668:	89 ef                	mov    %ebp,%edi
  40266a:	e8 11 e8 ff ff       	callq  400e80 <connect@plt>
  40266f:	85 c0                	test   %eax,%eax
  402671:	79 67                	jns    4026da <submitr+0x1ef>
  402673:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  40267a:	3a 20 55 
  40267d:	48 89 03             	mov    %rax,(%rbx)
  402680:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402687:	20 74 6f 
  40268a:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40268e:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402695:	65 63 74 
  402698:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40269c:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  4026a3:	68 65 20 
  4026a6:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026aa:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  4026b1:	61 62 20 
  4026b4:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4026b8:	c7 43 28 73 65 72 76 	movl   $0x76726573,0x28(%rbx)
  4026bf:	66 c7 43 2c 65 72    	movw   $0x7265,0x2c(%rbx)
  4026c5:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4026c9:	89 ef                	mov    %ebp,%edi
  4026cb:	e8 80 e6 ff ff       	callq  400d50 <close@plt>
  4026d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026d5:	e9 72 05 00 00       	jmpq   402c4c <submitr+0x761>
  4026da:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  4026e1:	b8 00 00 00 00       	mov    $0x0,%eax
  4026e6:	48 89 f1             	mov    %rsi,%rcx
  4026e9:	4c 89 e7             	mov    %r12,%rdi
  4026ec:	f2 ae                	repnz scas %es:(%rdi),%al
  4026ee:	48 f7 d1             	not    %rcx
  4026f1:	48 89 ca             	mov    %rcx,%rdx
  4026f4:	48 89 f1             	mov    %rsi,%rcx
  4026f7:	48 8b 3c 24          	mov    (%rsp),%rdi
  4026fb:	f2 ae                	repnz scas %es:(%rdi),%al
  4026fd:	48 f7 d1             	not    %rcx
  402700:	49 89 c8             	mov    %rcx,%r8
  402703:	48 89 f1             	mov    %rsi,%rcx
  402706:	4c 89 f7             	mov    %r14,%rdi
  402709:	f2 ae                	repnz scas %es:(%rdi),%al
  40270b:	48 f7 d1             	not    %rcx
  40270e:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  402713:	48 89 f1             	mov    %rsi,%rcx
  402716:	4c 89 ff             	mov    %r15,%rdi
  402719:	f2 ae                	repnz scas %es:(%rdi),%al
  40271b:	48 89 c8             	mov    %rcx,%rax
  40271e:	48 f7 d0             	not    %rax
  402721:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  402726:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  40272b:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  402732:	00 
  402733:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  402739:	76 72                	jbe    4027ad <submitr+0x2c2>
  40273b:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402742:	3a 20 52 
  402745:	48 89 03             	mov    %rax,(%rbx)
  402748:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  40274f:	20 73 74 
  402752:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402756:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40275d:	74 6f 6f 
  402760:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402764:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  40276b:	65 2e 20 
  40276e:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402772:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402779:	61 73 65 
  40277c:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402780:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402787:	49 54 52 
  40278a:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40278e:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402795:	55 46 00 
  402798:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40279c:	89 ef                	mov    %ebp,%edi
  40279e:	e8 ad e5 ff ff       	callq  400d50 <close@plt>
  4027a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027a8:	e9 9f 04 00 00       	jmpq   402c4c <submitr+0x761>
  4027ad:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  4027b4:	00 
  4027b5:	b9 00 04 00 00       	mov    $0x400,%ecx
  4027ba:	b8 00 00 00 00       	mov    $0x0,%eax
  4027bf:	48 89 f7             	mov    %rsi,%rdi
  4027c2:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4027c5:	4c 89 e7             	mov    %r12,%rdi
  4027c8:	e8 11 fc ff ff       	callq  4023de <urlencode>
  4027cd:	85 c0                	test   %eax,%eax
  4027cf:	0f 89 8a 00 00 00    	jns    40285f <submitr+0x374>
  4027d5:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4027dc:	3a 20 52 
  4027df:	48 89 03             	mov    %rax,(%rbx)
  4027e2:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4027e9:	20 73 74 
  4027ec:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027f0:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4027f7:	63 6f 6e 
  4027fa:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027fe:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  402805:	20 61 6e 
  402808:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40280c:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  402813:	67 61 6c 
  402816:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40281a:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  402821:	6e 70 72 
  402824:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402828:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  40282f:	6c 65 20 
  402832:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402836:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  40283d:	63 74 65 
  402840:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402844:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  40284a:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  40284e:	89 ef                	mov    %ebp,%edi
  402850:	e8 fb e4 ff ff       	callq  400d50 <close@plt>
  402855:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40285a:	e9 ed 03 00 00       	jmpq   402c4c <submitr+0x761>
  40285f:	4c 8d a4 24 40 20 00 	lea    0x2040(%rsp),%r12
  402866:	00 
  402867:	48 83 ec 08          	sub    $0x8,%rsp
  40286b:	41 55                	push   %r13
  40286d:	48 8d 84 24 50 40 00 	lea    0x4050(%rsp),%rax
  402874:	00 
  402875:	50                   	push   %rax
  402876:	41 56                	push   %r14
  402878:	4d 89 f9             	mov    %r15,%r9
  40287b:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
  402880:	b9 d8 37 40 00       	mov    $0x4037d8,%ecx
  402885:	ba 00 20 00 00       	mov    $0x2000,%edx
  40288a:	be 01 00 00 00       	mov    $0x1,%esi
  40288f:	4c 89 e7             	mov    %r12,%rdi
  402892:	b8 00 00 00 00       	mov    $0x0,%eax
  402897:	e8 04 e6 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  40289c:	b8 00 00 00 00       	mov    $0x0,%eax
  4028a1:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4028a8:	4c 89 e7             	mov    %r12,%rdi
  4028ab:	f2 ae                	repnz scas %es:(%rdi),%al
  4028ad:	48 f7 d1             	not    %rcx
  4028b0:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  4028b4:	48 83 c4 20          	add    $0x20,%rsp
  4028b8:	4c 89 e6             	mov    %r12,%rsi
  4028bb:	89 ef                	mov    %ebp,%edi
  4028bd:	e8 8b f9 ff ff       	callq  40224d <rio_writen>
  4028c2:	48 85 c0             	test   %rax,%rax
  4028c5:	79 6b                	jns    402932 <submitr+0x447>
  4028c7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4028ce:	3a 20 43 
  4028d1:	48 89 03             	mov    %rax,(%rbx)
  4028d4:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4028db:	20 75 6e 
  4028de:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4028e2:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4028e9:	74 6f 20 
  4028ec:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4028f0:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  4028f7:	20 74 6f 
  4028fa:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4028fe:	48 b8 20 74 68 65 20 	movabs $0x7475412065687420,%rax
  402905:	41 75 74 
  402908:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40290c:	48 b8 6f 6c 61 62 20 	movabs $0x7265732062616c6f,%rax
  402913:	73 65 72 
  402916:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40291a:	c7 43 30 76 65 72 00 	movl   $0x726576,0x30(%rbx)
  402921:	89 ef                	mov    %ebp,%edi
  402923:	e8 28 e4 ff ff       	callq  400d50 <close@plt>
  402928:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40292d:	e9 1a 03 00 00       	jmpq   402c4c <submitr+0x761>
  402932:	89 ee                	mov    %ebp,%esi
  402934:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402939:	e8 cf f8 ff ff       	callq  40220d <rio_readinitb>
  40293e:	ba 00 20 00 00       	mov    $0x2000,%edx
  402943:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  40294a:	00 
  40294b:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402950:	e8 df f9 ff ff       	callq  402334 <rio_readlineb>
  402955:	48 85 c0             	test   %rax,%rax
  402958:	7f 7f                	jg     4029d9 <submitr+0x4ee>
  40295a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402961:	3a 20 43 
  402964:	48 89 03             	mov    %rax,(%rbx)
  402967:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40296e:	20 75 6e 
  402971:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402975:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40297c:	74 6f 20 
  40297f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402983:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  40298a:	66 69 72 
  40298d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402991:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402998:	61 64 65 
  40299b:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40299f:	48 b8 72 20 66 72 6f 	movabs $0x41206d6f72662072,%rax
  4029a6:	6d 20 41 
  4029a9:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4029ad:	48 b8 75 74 6f 6c 61 	movabs $0x732062616c6f7475,%rax
  4029b4:	62 20 73 
  4029b7:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4029bb:	c7 43 38 65 72 76 65 	movl   $0x65767265,0x38(%rbx)
  4029c2:	66 c7 43 3c 72 00    	movw   $0x72,0x3c(%rbx)
  4029c8:	89 ef                	mov    %ebp,%edi
  4029ca:	e8 81 e3 ff ff       	callq  400d50 <close@plt>
  4029cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029d4:	e9 73 02 00 00       	jmpq   402c4c <submitr+0x761>
  4029d9:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  4029e0:	00 
  4029e1:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  4029e6:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  4029ed:	00 
  4029ee:	be 6f 38 40 00       	mov    $0x40386f,%esi
  4029f3:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  4029fa:	00 
  4029fb:	b8 00 00 00 00       	mov    $0x0,%eax
  402a00:	e8 fb e3 ff ff       	callq  400e00 <__isoc99_sscanf@plt>
  402a05:	e9 92 00 00 00       	jmpq   402a9c <submitr+0x5b1>
  402a0a:	ba 00 20 00 00       	mov    $0x2000,%edx
  402a0f:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402a16:	00 
  402a17:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402a1c:	e8 13 f9 ff ff       	callq  402334 <rio_readlineb>
  402a21:	48 85 c0             	test   %rax,%rax
  402a24:	7f 76                	jg     402a9c <submitr+0x5b1>
  402a26:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a2d:	3a 20 43 
  402a30:	48 89 03             	mov    %rax,(%rbx)
  402a33:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402a3a:	20 75 6e 
  402a3d:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402a41:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402a48:	74 6f 20 
  402a4b:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402a4f:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402a56:	68 65 61 
  402a59:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402a5d:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402a64:	66 72 6f 
  402a67:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402a6b:	48 b8 6d 20 41 75 74 	movabs $0x616c6f747541206d,%rax
  402a72:	6f 6c 61 
  402a75:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402a79:	48 b8 62 20 73 65 72 	movabs $0x7265767265732062,%rax
  402a80:	76 65 72 
  402a83:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402a87:	c6 43 38 00          	movb   $0x0,0x38(%rbx)
  402a8b:	89 ef                	mov    %ebp,%edi
  402a8d:	e8 be e2 ff ff       	callq  400d50 <close@plt>
  402a92:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a97:	e9 b0 01 00 00       	jmpq   402c4c <submitr+0x761>
  402a9c:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  402aa3:	00 
  402aa4:	b8 0d 00 00 00       	mov    $0xd,%eax
  402aa9:	29 d0                	sub    %edx,%eax
  402aab:	75 1b                	jne    402ac8 <submitr+0x5dd>
  402aad:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  402ab4:	00 
  402ab5:	b8 0a 00 00 00       	mov    $0xa,%eax
  402aba:	29 d0                	sub    %edx,%eax
  402abc:	75 0a                	jne    402ac8 <submitr+0x5dd>
  402abe:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  402ac5:	00 
  402ac6:	f7 d8                	neg    %eax
  402ac8:	85 c0                	test   %eax,%eax
  402aca:	0f 85 3a ff ff ff    	jne    402a0a <submitr+0x51f>
  402ad0:	ba 00 20 00 00       	mov    $0x2000,%edx
  402ad5:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402adc:	00 
  402add:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402ae2:	e8 4d f8 ff ff       	callq  402334 <rio_readlineb>
  402ae7:	48 85 c0             	test   %rax,%rax
  402aea:	0f 8f 80 00 00 00    	jg     402b70 <submitr+0x685>
  402af0:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402af7:	3a 20 43 
  402afa:	48 89 03             	mov    %rax,(%rbx)
  402afd:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402b04:	20 75 6e 
  402b07:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402b0b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b12:	74 6f 20 
  402b15:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402b19:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402b20:	73 74 61 
  402b23:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402b27:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402b2e:	65 73 73 
  402b31:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402b35:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402b3c:	72 6f 6d 
  402b3f:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402b43:	48 b8 20 41 75 74 6f 	movabs $0x62616c6f74754120,%rax
  402b4a:	6c 61 62 
  402b4d:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402b51:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  402b58:	65 72 00 
  402b5b:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402b5f:	89 ef                	mov    %ebp,%edi
  402b61:	e8 ea e1 ff ff       	callq  400d50 <close@plt>
  402b66:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b6b:	e9 dc 00 00 00       	jmpq   402c4c <submitr+0x761>
  402b70:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  402b75:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402b7c:	74 37                	je     402bb5 <submitr+0x6ca>
  402b7e:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  402b85:	00 
  402b86:	b9 38 38 40 00       	mov    $0x403838,%ecx
  402b8b:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402b92:	be 01 00 00 00       	mov    $0x1,%esi
  402b97:	48 89 df             	mov    %rbx,%rdi
  402b9a:	b8 00 00 00 00       	mov    $0x0,%eax
  402b9f:	e8 fc e2 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402ba4:	89 ef                	mov    %ebp,%edi
  402ba6:	e8 a5 e1 ff ff       	callq  400d50 <close@plt>
  402bab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402bb0:	e9 97 00 00 00       	jmpq   402c4c <submitr+0x761>
  402bb5:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402bbc:	00 
  402bbd:	48 89 df             	mov    %rbx,%rdi
  402bc0:	e8 1b e1 ff ff       	callq  400ce0 <strcpy@plt>
  402bc5:	89 ef                	mov    %ebp,%edi
  402bc7:	e8 84 e1 ff ff       	callq  400d50 <close@plt>
  402bcc:	0f b6 03             	movzbl (%rbx),%eax
  402bcf:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402bd4:	29 c2                	sub    %eax,%edx
  402bd6:	75 22                	jne    402bfa <submitr+0x70f>
  402bd8:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402bdc:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402be1:	29 c8                	sub    %ecx,%eax
  402be3:	75 17                	jne    402bfc <submitr+0x711>
  402be5:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402be9:	b8 0a 00 00 00       	mov    $0xa,%eax
  402bee:	29 c8                	sub    %ecx,%eax
  402bf0:	75 0a                	jne    402bfc <submitr+0x711>
  402bf2:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402bf6:	f7 d8                	neg    %eax
  402bf8:	eb 02                	jmp    402bfc <submitr+0x711>
  402bfa:	89 d0                	mov    %edx,%eax
  402bfc:	85 c0                	test   %eax,%eax
  402bfe:	74 40                	je     402c40 <submitr+0x755>
  402c00:	bf 80 38 40 00       	mov    $0x403880,%edi
  402c05:	b9 05 00 00 00       	mov    $0x5,%ecx
  402c0a:	48 89 de             	mov    %rbx,%rsi
  402c0d:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402c0f:	0f 97 c0             	seta   %al
  402c12:	0f 92 c1             	setb   %cl
  402c15:	29 c8                	sub    %ecx,%eax
  402c17:	0f be c0             	movsbl %al,%eax
  402c1a:	85 c0                	test   %eax,%eax
  402c1c:	74 2e                	je     402c4c <submitr+0x761>
  402c1e:	85 d2                	test   %edx,%edx
  402c20:	75 13                	jne    402c35 <submitr+0x74a>
  402c22:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402c26:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402c2b:	29 c2                	sub    %eax,%edx
  402c2d:	75 06                	jne    402c35 <submitr+0x74a>
  402c2f:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402c33:	f7 da                	neg    %edx
  402c35:	85 d2                	test   %edx,%edx
  402c37:	75 0e                	jne    402c47 <submitr+0x75c>
  402c39:	b8 00 00 00 00       	mov    $0x0,%eax
  402c3e:	eb 0c                	jmp    402c4c <submitr+0x761>
  402c40:	b8 00 00 00 00       	mov    $0x0,%eax
  402c45:	eb 05                	jmp    402c4c <submitr+0x761>
  402c47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c4c:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  402c53:	00 
  402c54:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402c5b:	00 00 
  402c5d:	74 05                	je     402c64 <submitr+0x779>
  402c5f:	e8 ac e0 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402c64:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402c6b:	5b                   	pop    %rbx
  402c6c:	5d                   	pop    %rbp
  402c6d:	41 5c                	pop    %r12
  402c6f:	41 5d                	pop    %r13
  402c71:	41 5e                	pop    %r14
  402c73:	41 5f                	pop    %r15
  402c75:	c3                   	retq   

0000000000402c76 <init_timeout>:
  402c76:	85 ff                	test   %edi,%edi
  402c78:	74 23                	je     402c9d <init_timeout+0x27>
  402c7a:	53                   	push   %rbx
  402c7b:	89 fb                	mov    %edi,%ebx
  402c7d:	85 ff                	test   %edi,%edi
  402c7f:	79 05                	jns    402c86 <init_timeout+0x10>
  402c81:	bb 00 00 00 00       	mov    $0x0,%ebx
  402c86:	be 1f 22 40 00       	mov    $0x40221f,%esi
  402c8b:	bf 0e 00 00 00       	mov    $0xe,%edi
  402c90:	e8 eb e0 ff ff       	callq  400d80 <signal@plt>
  402c95:	89 df                	mov    %ebx,%edi
  402c97:	e8 a4 e0 ff ff       	callq  400d40 <alarm@plt>
  402c9c:	5b                   	pop    %rbx
  402c9d:	f3 c3                	repz retq 

0000000000402c9f <init_driver>:
  402c9f:	55                   	push   %rbp
  402ca0:	53                   	push   %rbx
  402ca1:	48 83 ec 28          	sub    $0x28,%rsp
  402ca5:	48 89 fd             	mov    %rdi,%rbp
  402ca8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402caf:	00 00 
  402cb1:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402cb6:	31 c0                	xor    %eax,%eax
  402cb8:	be 01 00 00 00       	mov    $0x1,%esi
  402cbd:	bf 0d 00 00 00       	mov    $0xd,%edi
  402cc2:	e8 b9 e0 ff ff       	callq  400d80 <signal@plt>
  402cc7:	be 01 00 00 00       	mov    $0x1,%esi
  402ccc:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402cd1:	e8 aa e0 ff ff       	callq  400d80 <signal@plt>
  402cd6:	be 01 00 00 00       	mov    $0x1,%esi
  402cdb:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402ce0:	e8 9b e0 ff ff       	callq  400d80 <signal@plt>
  402ce5:	ba 00 00 00 00       	mov    $0x0,%edx
  402cea:	be 01 00 00 00       	mov    $0x1,%esi
  402cef:	bf 02 00 00 00       	mov    $0x2,%edi
  402cf4:	e8 b7 e1 ff ff       	callq  400eb0 <socket@plt>
  402cf9:	85 c0                	test   %eax,%eax
  402cfb:	79 4f                	jns    402d4c <init_driver+0xad>
  402cfd:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402d04:	3a 20 43 
  402d07:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402d0b:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402d12:	20 75 6e 
  402d15:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402d19:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402d20:	74 6f 20 
  402d23:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402d27:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402d2e:	65 20 73 
  402d31:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402d35:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402d3c:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402d42:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d47:	e9 2a 01 00 00       	jmpq   402e76 <init_driver+0x1d7>
  402d4c:	89 c3                	mov    %eax,%ebx
  402d4e:	bf a5 33 40 00       	mov    $0x4033a5,%edi
  402d53:	e8 38 e0 ff ff       	callq  400d90 <gethostbyname@plt>
  402d58:	48 85 c0             	test   %rax,%rax
  402d5b:	75 68                	jne    402dc5 <init_driver+0x126>
  402d5d:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402d64:	3a 20 44 
  402d67:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402d6b:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402d72:	20 75 6e 
  402d75:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402d79:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402d80:	74 6f 20 
  402d83:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402d87:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402d8e:	76 65 20 
  402d91:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402d95:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402d9c:	72 20 61 
  402d9f:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402da3:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402daa:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402db0:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402db4:	89 df                	mov    %ebx,%edi
  402db6:	e8 95 df ff ff       	callq  400d50 <close@plt>
  402dbb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402dc0:	e9 b1 00 00 00       	jmpq   402e76 <init_driver+0x1d7>
  402dc5:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402dcc:	00 
  402dcd:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402dd4:	00 00 
  402dd6:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402ddc:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402de0:	48 8b 40 18          	mov    0x18(%rax),%rax
  402de4:	48 8b 30             	mov    (%rax),%rsi
  402de7:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402dec:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402df1:	e8 aa df ff ff       	callq  400da0 <__memmove_chk@plt>
  402df6:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  402dfd:	ba 10 00 00 00       	mov    $0x10,%edx
  402e02:	48 89 e6             	mov    %rsp,%rsi
  402e05:	89 df                	mov    %ebx,%edi
  402e07:	e8 74 e0 ff ff       	callq  400e80 <connect@plt>
  402e0c:	85 c0                	test   %eax,%eax
  402e0e:	79 50                	jns    402e60 <init_driver+0x1c1>
  402e10:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402e17:	3a 20 55 
  402e1a:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402e1e:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402e25:	20 74 6f 
  402e28:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402e2c:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402e33:	65 63 74 
  402e36:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402e3a:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402e41:	65 72 76 
  402e44:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402e48:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402e4e:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402e52:	89 df                	mov    %ebx,%edi
  402e54:	e8 f7 de ff ff       	callq  400d50 <close@plt>
  402e59:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402e5e:	eb 16                	jmp    402e76 <init_driver+0x1d7>
  402e60:	89 df                	mov    %ebx,%edi
  402e62:	e8 e9 de ff ff       	callq  400d50 <close@plt>
  402e67:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402e6d:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402e71:	b8 00 00 00 00       	mov    $0x0,%eax
  402e76:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402e7b:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402e82:	00 00 
  402e84:	74 05                	je     402e8b <init_driver+0x1ec>
  402e86:	e8 85 de ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402e8b:	48 83 c4 28          	add    $0x28,%rsp
  402e8f:	5b                   	pop    %rbx
  402e90:	5d                   	pop    %rbp
  402e91:	c3                   	retq   

0000000000402e92 <driver_post>:
  402e92:	53                   	push   %rbx
  402e93:	4c 89 cb             	mov    %r9,%rbx
  402e96:	45 85 c0             	test   %r8d,%r8d
  402e99:	74 27                	je     402ec2 <driver_post+0x30>
  402e9b:	48 89 ca             	mov    %rcx,%rdx
  402e9e:	be 85 38 40 00       	mov    $0x403885,%esi
  402ea3:	bf 01 00 00 00       	mov    $0x1,%edi
  402ea8:	b8 00 00 00 00       	mov    $0x0,%eax
  402ead:	e8 6e df ff ff       	callq  400e20 <__printf_chk@plt>
  402eb2:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402eb7:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402ebb:	b8 00 00 00 00       	mov    $0x0,%eax
  402ec0:	eb 3f                	jmp    402f01 <driver_post+0x6f>
  402ec2:	48 85 ff             	test   %rdi,%rdi
  402ec5:	74 2c                	je     402ef3 <driver_post+0x61>
  402ec7:	80 3f 00             	cmpb   $0x0,(%rdi)
  402eca:	74 27                	je     402ef3 <driver_post+0x61>
  402ecc:	48 83 ec 08          	sub    $0x8,%rsp
  402ed0:	41 51                	push   %r9
  402ed2:	49 89 c9             	mov    %rcx,%r9
  402ed5:	49 89 d0             	mov    %rdx,%r8
  402ed8:	48 89 f9             	mov    %rdi,%rcx
  402edb:	48 89 f2             	mov    %rsi,%rdx
  402ede:	be 50 00 00 00       	mov    $0x50,%esi
  402ee3:	bf a5 33 40 00       	mov    $0x4033a5,%edi
  402ee8:	e8 fe f5 ff ff       	callq  4024eb <submitr>
  402eed:	48 83 c4 10          	add    $0x10,%rsp
  402ef1:	eb 0e                	jmp    402f01 <driver_post+0x6f>
  402ef3:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402ef8:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402efc:	b8 00 00 00 00       	mov    $0x0,%eax
  402f01:	5b                   	pop    %rbx
  402f02:	c3                   	retq   

0000000000402f03 <check>:
  402f03:	89 f8                	mov    %edi,%eax
  402f05:	c1 e8 1c             	shr    $0x1c,%eax
  402f08:	85 c0                	test   %eax,%eax
  402f0a:	74 1d                	je     402f29 <check+0x26>
  402f0c:	b9 00 00 00 00       	mov    $0x0,%ecx
  402f11:	eb 0b                	jmp    402f1e <check+0x1b>
  402f13:	89 f8                	mov    %edi,%eax
  402f15:	d3 e8                	shr    %cl,%eax
  402f17:	3c 0a                	cmp    $0xa,%al
  402f19:	74 14                	je     402f2f <check+0x2c>
  402f1b:	83 c1 08             	add    $0x8,%ecx
  402f1e:	83 f9 1f             	cmp    $0x1f,%ecx
  402f21:	7e f0                	jle    402f13 <check+0x10>
  402f23:	b8 01 00 00 00       	mov    $0x1,%eax
  402f28:	c3                   	retq   
  402f29:	b8 00 00 00 00       	mov    $0x0,%eax
  402f2e:	c3                   	retq   
  402f2f:	b8 00 00 00 00       	mov    $0x0,%eax
  402f34:	c3                   	retq   

0000000000402f35 <gencookie>:
  402f35:	53                   	push   %rbx
  402f36:	83 c7 01             	add    $0x1,%edi
  402f39:	e8 82 dd ff ff       	callq  400cc0 <srandom@plt>
  402f3e:	e8 9d de ff ff       	callq  400de0 <random@plt>
  402f43:	89 c3                	mov    %eax,%ebx
  402f45:	89 c7                	mov    %eax,%edi
  402f47:	e8 b7 ff ff ff       	callq  402f03 <check>
  402f4c:	85 c0                	test   %eax,%eax
  402f4e:	74 ee                	je     402f3e <gencookie+0x9>
  402f50:	89 d8                	mov    %ebx,%eax
  402f52:	5b                   	pop    %rbx
  402f53:	c3                   	retq   
  402f54:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402f5b:	00 00 00 
  402f5e:	66 90                	xchg   %ax,%ax

0000000000402f60 <__libc_csu_init>:
  402f60:	41 57                	push   %r15
  402f62:	41 56                	push   %r14
  402f64:	41 89 ff             	mov    %edi,%r15d
  402f67:	41 55                	push   %r13
  402f69:	41 54                	push   %r12
  402f6b:	4c 8d 25 8e 1e 20 00 	lea    0x201e8e(%rip),%r12        # 604e00 <__frame_dummy_init_array_entry>
  402f72:	55                   	push   %rbp
  402f73:	48 8d 2d 8e 1e 20 00 	lea    0x201e8e(%rip),%rbp        # 604e08 <__init_array_end>
  402f7a:	53                   	push   %rbx
  402f7b:	49 89 f6             	mov    %rsi,%r14
  402f7e:	49 89 d5             	mov    %rdx,%r13
  402f81:	4c 29 e5             	sub    %r12,%rbp
  402f84:	48 83 ec 08          	sub    $0x8,%rsp
  402f88:	48 c1 fd 03          	sar    $0x3,%rbp
  402f8c:	e8 d7 dc ff ff       	callq  400c68 <_init>
  402f91:	48 85 ed             	test   %rbp,%rbp
  402f94:	74 20                	je     402fb6 <__libc_csu_init+0x56>
  402f96:	31 db                	xor    %ebx,%ebx
  402f98:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402f9f:	00 
  402fa0:	4c 89 ea             	mov    %r13,%rdx
  402fa3:	4c 89 f6             	mov    %r14,%rsi
  402fa6:	44 89 ff             	mov    %r15d,%edi
  402fa9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402fad:	48 83 c3 01          	add    $0x1,%rbx
  402fb1:	48 39 eb             	cmp    %rbp,%rbx
  402fb4:	75 ea                	jne    402fa0 <__libc_csu_init+0x40>
  402fb6:	48 83 c4 08          	add    $0x8,%rsp
  402fba:	5b                   	pop    %rbx
  402fbb:	5d                   	pop    %rbp
  402fbc:	41 5c                	pop    %r12
  402fbe:	41 5d                	pop    %r13
  402fc0:	41 5e                	pop    %r14
  402fc2:	41 5f                	pop    %r15
  402fc4:	c3                   	retq   
  402fc5:	90                   	nop
  402fc6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402fcd:	00 00 00 

0000000000402fd0 <__libc_csu_fini>:
  402fd0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402fd4 <_fini>:
  402fd4:	48 83 ec 08          	sub    $0x8,%rsp
  402fd8:	48 83 c4 08          	add    $0x8,%rsp
  402fdc:	c3                   	retq   
