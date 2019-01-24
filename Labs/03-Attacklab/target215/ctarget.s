
ctarget:     file format elf64-x86-64


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
  400edf:	49 c7 c0 b0 2e 40 00 	mov    $0x402eb0,%r8
  400ee6:	48 c7 c1 40 2e 40 00 	mov    $0x402e40,%rcx
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
  400fd6:	be c8 2e 40 00       	mov    $0x402ec8,%esi
  400fdb:	bf 01 00 00 00       	mov    $0x1,%edi
  400fe0:	b8 00 00 00 00       	mov    $0x0,%eax
  400fe5:	e8 36 fe ff ff       	callq  400e20 <__printf_chk@plt>
  400fea:	bf 00 2f 40 00       	mov    $0x402f00,%edi
  400fef:	e8 fc fc ff ff       	callq  400cf0 <puts@plt>
  400ff4:	bf 78 30 40 00       	mov    $0x403078,%edi
  400ff9:	e8 f2 fc ff ff       	callq  400cf0 <puts@plt>
  400ffe:	bf 28 2f 40 00       	mov    $0x402f28,%edi
  401003:	e8 e8 fc ff ff       	callq  400cf0 <puts@plt>
  401008:	bf 92 30 40 00       	mov    $0x403092,%edi
  40100d:	e8 de fc ff ff       	callq  400cf0 <puts@plt>
  401012:	eb 32                	jmp    401046 <usage+0x80>
  401014:	be ae 30 40 00       	mov    $0x4030ae,%esi
  401019:	bf 01 00 00 00       	mov    $0x1,%edi
  40101e:	b8 00 00 00 00       	mov    $0x0,%eax
  401023:	e8 f8 fd ff ff       	callq  400e20 <__printf_chk@plt>
  401028:	bf 50 2f 40 00       	mov    $0x402f50,%edi
  40102d:	e8 be fc ff ff       	callq  400cf0 <puts@plt>
  401032:	bf 78 2f 40 00       	mov    $0x402f78,%edi
  401037:	e8 b4 fc ff ff       	callq  400cf0 <puts@plt>
  40103c:	bf cc 30 40 00       	mov    $0x4030cc,%edi
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
  40107a:	e8 97 1d 00 00       	callq  402e16 <gencookie>
  40107f:	89 05 9f 44 20 00    	mov    %eax,0x20449f(%rip)        # 605524 <cookie>
  401085:	89 c7                	mov    %eax,%edi
  401087:	e8 8a 1d 00 00       	callq  402e16 <gencookie>
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
  4010e4:	c6 05 5d 50 20 00 63 	movb   $0x63,0x20505d(%rip)        # 606148 <target_prefix>
  4010eb:	83 3d b6 43 20 00 00 	cmpl   $0x0,0x2043b6(%rip)        # 6054a8 <notify>
  4010f2:	0f 84 bb 00 00 00    	je     4011b3 <initialize_target+0x163>
  4010f8:	83 3d 29 44 20 00 00 	cmpl   $0x0,0x204429(%rip)        # 605528 <is_checker>
  4010ff:	0f 85 ae 00 00 00    	jne    4011b3 <initialize_target+0x163>
  401105:	be 00 01 00 00       	mov    $0x100,%esi
  40110a:	48 89 e7             	mov    %rsp,%rdi
  40110d:	e8 4e fd ff ff       	callq  400e60 <gethostname@plt>
  401112:	85 c0                	test   %eax,%eax
  401114:	74 25                	je     40113b <initialize_target+0xeb>
  401116:	bf a8 2f 40 00       	mov    $0x402fa8,%edi
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
  401163:	be e0 2f 40 00       	mov    $0x402fe0,%esi
  401168:	bf 01 00 00 00       	mov    $0x1,%edi
  40116d:	e8 ae fc ff ff       	callq  400e20 <__printf_chk@plt>
  401172:	bf 08 00 00 00       	mov    $0x8,%edi
  401177:	e8 f4 fc ff ff       	callq  400e70 <exit@plt>
  40117c:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  401183:	00 
  401184:	e8 f7 19 00 00       	callq  402b80 <init_driver>
  401189:	85 c0                	test   %eax,%eax
  40118b:	79 26                	jns    4011b3 <initialize_target+0x163>
  40118d:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  401194:	00 
  401195:	be 20 30 40 00       	mov    $0x403020,%esi
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
  4011e3:	be a0 1e 40 00       	mov    $0x401ea0,%esi
  4011e8:	bf 0b 00 00 00       	mov    $0xb,%edi
  4011ed:	e8 8e fb ff ff       	callq  400d80 <signal@plt>
  4011f2:	be 52 1e 40 00       	mov    $0x401e52,%esi
  4011f7:	bf 07 00 00 00       	mov    $0x7,%edi
  4011fc:	e8 7f fb ff ff       	callq  400d80 <signal@plt>
  401201:	be ee 1e 40 00       	mov    $0x401eee,%esi
  401206:	bf 04 00 00 00       	mov    $0x4,%edi
  40120b:	e8 70 fb ff ff       	callq  400d80 <signal@plt>
  401210:	83 3d 11 43 20 00 00 	cmpl   $0x0,0x204311(%rip)        # 605528 <is_checker>
  401217:	74 20                	je     401239 <main+0x64>
  401219:	be 3c 1f 40 00       	mov    $0x401f3c,%esi
  40121e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401223:	e8 58 fb ff ff       	callq  400d80 <signal@plt>
  401228:	bf 05 00 00 00       	mov    $0x5,%edi
  40122d:	e8 0e fb ff ff       	callq  400d40 <alarm@plt>
  401232:	bd ea 30 40 00       	mov    $0x4030ea,%ebp
  401237:	eb 05                	jmp    40123e <main+0x69>
  401239:	bd e5 30 40 00       	mov    $0x4030e5,%ebp
  40123e:	48 8b 05 7b 42 20 00 	mov    0x20427b(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  401245:	48 89 05 c4 42 20 00 	mov    %rax,0x2042c4(%rip)        # 605510 <infile>
  40124c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401252:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401258:	e9 c6 00 00 00       	jmpq   401323 <main+0x14e>
  40125d:	83 e8 61             	sub    $0x61,%eax
  401260:	3c 10                	cmp    $0x10,%al
  401262:	0f 87 9c 00 00 00    	ja     401304 <main+0x12f>
  401268:	0f b6 c0             	movzbl %al,%eax
  40126b:	ff 24 c5 30 31 40 00 	jmpq   *0x403130(,%rax,8)
  401272:	48 8b 3b             	mov    (%rbx),%rdi
  401275:	e8 4c fd ff ff       	callq  400fc6 <usage>
  40127a:	be 3d 34 40 00       	mov    $0x40343d,%esi
  40127f:	48 8b 3d 42 42 20 00 	mov    0x204242(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  401286:	e8 a5 fb ff ff       	callq  400e30 <fopen@plt>
  40128b:	48 89 05 7e 42 20 00 	mov    %rax,0x20427e(%rip)        # 605510 <infile>
  401292:	48 85 c0             	test   %rax,%rax
  401295:	0f 85 88 00 00 00    	jne    401323 <main+0x14e>
  40129b:	48 8b 0d 26 42 20 00 	mov    0x204226(%rip),%rcx        # 6054c8 <optarg@@GLIBC_2.2.5>
  4012a2:	ba f2 30 40 00       	mov    $0x4030f2,%edx
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
  401307:	be 0f 31 40 00       	mov    $0x40310f,%esi
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
  40133b:	be 00 00 00 00       	mov    $0x0,%esi
  401340:	44 89 ef             	mov    %r13d,%edi
  401343:	e8 08 fd ff ff       	callq  401050 <initialize_target>
  401348:	83 3d d9 41 20 00 00 	cmpl   $0x0,0x2041d9(%rip)        # 605528 <is_checker>
  40134f:	74 2a                	je     40137b <main+0x1a6>
  401351:	44 3b 35 c8 41 20 00 	cmp    0x2041c8(%rip),%r14d        # 605520 <authkey>
  401358:	74 21                	je     40137b <main+0x1a6>
  40135a:	44 89 f2             	mov    %r14d,%edx
  40135d:	be 48 30 40 00       	mov    $0x403048,%esi
  401362:	bf 01 00 00 00       	mov    $0x1,%edi
  401367:	b8 00 00 00 00       	mov    $0x0,%eax
  40136c:	e8 af fa ff ff       	callq  400e20 <__printf_chk@plt>
  401371:	b8 00 00 00 00       	mov    $0x0,%eax
  401376:	e8 73 07 00 00       	callq  401aee <check_fail>
  40137b:	8b 15 a3 41 20 00    	mov    0x2041a3(%rip),%edx        # 605524 <cookie>
  401381:	be 22 31 40 00       	mov    $0x403122,%esi
  401386:	bf 01 00 00 00       	mov    $0x1,%edi
  40138b:	b8 00 00 00 00       	mov    $0x0,%eax
  401390:	e8 8b fa ff ff       	callq  400e20 <__printf_chk@plt>
  401395:	48 8b 3d 04 41 20 00 	mov    0x204104(%rip),%rdi        # 6054a0 <buf_offset>
  40139c:	e8 9b 0c 00 00       	callq  40203c <stable_launch>
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
  4018a0:	e8 7e 02 00 00       	callq  401b23 <Gets>
  4018a5:	b8 01 00 00 00       	mov    $0x1,%eax
  4018aa:	48 83 c4 38          	add    $0x38,%rsp
  4018ae:	c3                   	retq   

00000000004018af <touch1>:
  4018af:	48 83 ec 08          	sub    $0x8,%rsp
  4018b3:	c7 05 5f 3c 20 00 01 	movl   $0x1,0x203c5f(%rip)        # 60551c <vlevel>
  4018ba:	00 00 00 
  4018bd:	bf 96 32 40 00       	mov    $0x403296,%edi
  4018c2:	e8 29 f4 ff ff       	callq  400cf0 <puts@plt>
  4018c7:	bf 01 00 00 00       	mov    $0x1,%edi
  4018cc:	e8 97 04 00 00       	callq  401d68 <validate>
  4018d1:	bf 00 00 00 00       	mov    $0x0,%edi
  4018d6:	e8 95 f5 ff ff       	callq  400e70 <exit@plt>

00000000004018db <touch2>:
  4018db:	48 83 ec 08          	sub    $0x8,%rsp
  4018df:	89 fa                	mov    %edi,%edx
  4018e1:	c7 05 31 3c 20 00 02 	movl   $0x2,0x203c31(%rip)        # 60551c <vlevel>
  4018e8:	00 00 00 
  4018eb:	39 3d 33 3c 20 00    	cmp    %edi,0x203c33(%rip)        # 605524 <cookie>
  4018f1:	75 20                	jne    401913 <touch2+0x38>
  4018f3:	be b8 32 40 00       	mov    $0x4032b8,%esi
  4018f8:	bf 01 00 00 00       	mov    $0x1,%edi
  4018fd:	b8 00 00 00 00       	mov    $0x0,%eax
  401902:	e8 19 f5 ff ff       	callq  400e20 <__printf_chk@plt>
  401907:	bf 02 00 00 00       	mov    $0x2,%edi
  40190c:	e8 57 04 00 00       	callq  401d68 <validate>
  401911:	eb 1e                	jmp    401931 <touch2+0x56>
  401913:	be e0 32 40 00       	mov    $0x4032e0,%esi
  401918:	bf 01 00 00 00       	mov    $0x1,%edi
  40191d:	b8 00 00 00 00       	mov    $0x0,%eax
  401922:	e8 f9 f4 ff ff       	callq  400e20 <__printf_chk@plt>
  401927:	bf 02 00 00 00       	mov    $0x2,%edi
  40192c:	e8 f9 04 00 00       	callq  401e2a <fail>
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
  401998:	b9 b3 32 40 00       	mov    $0x4032b3,%ecx
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
  401a0f:	be 08 33 40 00       	mov    $0x403308,%esi
  401a14:	bf 01 00 00 00       	mov    $0x1,%edi
  401a19:	b8 00 00 00 00       	mov    $0x0,%eax
  401a1e:	e8 fd f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a23:	bf 03 00 00 00       	mov    $0x3,%edi
  401a28:	e8 3b 03 00 00       	callq  401d68 <validate>
  401a2d:	eb 21                	jmp    401a50 <touch3+0x64>
  401a2f:	48 89 da             	mov    %rbx,%rdx
  401a32:	be 30 33 40 00       	mov    $0x403330,%esi
  401a37:	bf 01 00 00 00       	mov    $0x1,%edi
  401a3c:	b8 00 00 00 00       	mov    $0x0,%eax
  401a41:	e8 da f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a46:	bf 03 00 00 00       	mov    $0x3,%edi
  401a4b:	e8 da 03 00 00       	callq  401e2a <fail>
  401a50:	bf 00 00 00 00       	mov    $0x0,%edi
  401a55:	e8 16 f4 ff ff       	callq  400e70 <exit@plt>

0000000000401a5a <test>:
  401a5a:	48 83 ec 08          	sub    $0x8,%rsp
  401a5e:	b8 00 00 00 00       	mov    $0x0,%eax
  401a63:	e8 31 fe ff ff       	callq  401899 <getbuf>
  401a68:	89 c2                	mov    %eax,%edx
  401a6a:	be 58 33 40 00       	mov    $0x403358,%esi
  401a6f:	bf 01 00 00 00       	mov    $0x1,%edi
  401a74:	b8 00 00 00 00       	mov    $0x0,%eax
  401a79:	e8 a2 f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401a7e:	48 83 c4 08          	add    $0x8,%rsp
  401a82:	c3                   	retq   

0000000000401a83 <save_char>:
  401a83:	8b 05 bb 46 20 00    	mov    0x2046bb(%rip),%eax        # 606144 <gets_cnt>
  401a89:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401a8e:	7f 49                	jg     401ad9 <save_char+0x56>
  401a90:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401a93:	89 f9                	mov    %edi,%ecx
  401a95:	c0 e9 04             	shr    $0x4,%cl
  401a98:	83 e1 0f             	and    $0xf,%ecx
  401a9b:	0f b6 b1 80 36 40 00 	movzbl 0x403680(%rcx),%esi
  401aa2:	48 63 ca             	movslq %edx,%rcx
  401aa5:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401aac:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401aaf:	83 e7 0f             	and    $0xf,%edi
  401ab2:	0f b6 b7 80 36 40 00 	movzbl 0x403680(%rdi),%esi
  401ab9:	48 63 c9             	movslq %ecx,%rcx
  401abc:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401ac3:	83 c2 02             	add    $0x2,%edx
  401ac6:	48 63 d2             	movslq %edx,%rdx
  401ac9:	c6 82 40 55 60 00 20 	movb   $0x20,0x605540(%rdx)
  401ad0:	83 c0 01             	add    $0x1,%eax
  401ad3:	89 05 6b 46 20 00    	mov    %eax,0x20466b(%rip)        # 606144 <gets_cnt>
  401ad9:	f3 c3                	repz retq 

0000000000401adb <save_term>:
  401adb:	8b 05 63 46 20 00    	mov    0x204663(%rip),%eax        # 606144 <gets_cnt>
  401ae1:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401ae4:	48 98                	cltq   
  401ae6:	c6 80 40 55 60 00 00 	movb   $0x0,0x605540(%rax)
  401aed:	c3                   	retq   

0000000000401aee <check_fail>:
  401aee:	48 83 ec 08          	sub    $0x8,%rsp
  401af2:	0f be 15 4f 46 20 00 	movsbl 0x20464f(%rip),%edx        # 606148 <target_prefix>
  401af9:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401aff:	8b 0d 13 3a 20 00    	mov    0x203a13(%rip),%ecx        # 605518 <check_level>
  401b05:	be 7b 33 40 00       	mov    $0x40337b,%esi
  401b0a:	bf 01 00 00 00       	mov    $0x1,%edi
  401b0f:	b8 00 00 00 00       	mov    $0x0,%eax
  401b14:	e8 07 f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401b19:	bf 01 00 00 00       	mov    $0x1,%edi
  401b1e:	e8 4d f3 ff ff       	callq  400e70 <exit@plt>

0000000000401b23 <Gets>:
  401b23:	41 54                	push   %r12
  401b25:	55                   	push   %rbp
  401b26:	53                   	push   %rbx
  401b27:	49 89 fc             	mov    %rdi,%r12
  401b2a:	c7 05 10 46 20 00 00 	movl   $0x0,0x204610(%rip)        # 606144 <gets_cnt>
  401b31:	00 00 00 
  401b34:	48 89 fb             	mov    %rdi,%rbx
  401b37:	eb 11                	jmp    401b4a <Gets+0x27>
  401b39:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401b3d:	88 03                	mov    %al,(%rbx)
  401b3f:	0f b6 f8             	movzbl %al,%edi
  401b42:	e8 3c ff ff ff       	callq  401a83 <save_char>
  401b47:	48 89 eb             	mov    %rbp,%rbx
  401b4a:	48 8b 3d bf 39 20 00 	mov    0x2039bf(%rip),%rdi        # 605510 <infile>
  401b51:	e8 9a f2 ff ff       	callq  400df0 <_IO_getc@plt>
  401b56:	83 f8 ff             	cmp    $0xffffffff,%eax
  401b59:	74 05                	je     401b60 <Gets+0x3d>
  401b5b:	83 f8 0a             	cmp    $0xa,%eax
  401b5e:	75 d9                	jne    401b39 <Gets+0x16>
  401b60:	c6 03 00             	movb   $0x0,(%rbx)
  401b63:	b8 00 00 00 00       	mov    $0x0,%eax
  401b68:	e8 6e ff ff ff       	callq  401adb <save_term>
  401b6d:	4c 89 e0             	mov    %r12,%rax
  401b70:	5b                   	pop    %rbx
  401b71:	5d                   	pop    %rbp
  401b72:	41 5c                	pop    %r12
  401b74:	c3                   	retq   

0000000000401b75 <notify_server>:
  401b75:	53                   	push   %rbx
  401b76:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401b7d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401b84:	00 00 
  401b86:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401b8d:	00 
  401b8e:	31 c0                	xor    %eax,%eax
  401b90:	83 3d 91 39 20 00 00 	cmpl   $0x0,0x203991(%rip)        # 605528 <is_checker>
  401b97:	0f 85 aa 01 00 00    	jne    401d47 <notify_server+0x1d2>
  401b9d:	89 fb                	mov    %edi,%ebx
  401b9f:	8b 05 9f 45 20 00    	mov    0x20459f(%rip),%eax        # 606144 <gets_cnt>
  401ba5:	83 c0 64             	add    $0x64,%eax
  401ba8:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401bad:	7e 1e                	jle    401bcd <notify_server+0x58>
  401baf:	be b0 34 40 00       	mov    $0x4034b0,%esi
  401bb4:	bf 01 00 00 00       	mov    $0x1,%edi
  401bb9:	b8 00 00 00 00       	mov    $0x0,%eax
  401bbe:	e8 5d f2 ff ff       	callq  400e20 <__printf_chk@plt>
  401bc3:	bf 01 00 00 00       	mov    $0x1,%edi
  401bc8:	e8 a3 f2 ff ff       	callq  400e70 <exit@plt>
  401bcd:	0f be 05 74 45 20 00 	movsbl 0x204574(%rip),%eax        # 606148 <target_prefix>
  401bd4:	83 3d cd 38 20 00 00 	cmpl   $0x0,0x2038cd(%rip)        # 6054a8 <notify>
  401bdb:	74 08                	je     401be5 <notify_server+0x70>
  401bdd:	8b 15 3d 39 20 00    	mov    0x20393d(%rip),%edx        # 605520 <authkey>
  401be3:	eb 05                	jmp    401bea <notify_server+0x75>
  401be5:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401bea:	85 db                	test   %ebx,%ebx
  401bec:	74 08                	je     401bf6 <notify_server+0x81>
  401bee:	41 b9 91 33 40 00    	mov    $0x403391,%r9d
  401bf4:	eb 06                	jmp    401bfc <notify_server+0x87>
  401bf6:	41 b9 96 33 40 00    	mov    $0x403396,%r9d
  401bfc:	68 40 55 60 00       	pushq  $0x605540
  401c01:	56                   	push   %rsi
  401c02:	50                   	push   %rax
  401c03:	52                   	push   %rdx
  401c04:	44 8b 05 5d 35 20 00 	mov    0x20355d(%rip),%r8d        # 605168 <target_id>
  401c0b:	b9 9b 33 40 00       	mov    $0x40339b,%ecx
  401c10:	ba 00 20 00 00       	mov    $0x2000,%edx
  401c15:	be 01 00 00 00       	mov    $0x1,%esi
  401c1a:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401c1f:	b8 00 00 00 00       	mov    $0x0,%eax
  401c24:	e8 77 f2 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  401c29:	48 83 c4 20          	add    $0x20,%rsp
  401c2d:	83 3d 74 38 20 00 00 	cmpl   $0x0,0x203874(%rip)        # 6054a8 <notify>
  401c34:	0f 84 81 00 00 00    	je     401cbb <notify_server+0x146>
  401c3a:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401c41:	00 
  401c42:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401c48:	48 89 e1             	mov    %rsp,%rcx
  401c4b:	48 8b 15 1e 35 20 00 	mov    0x20351e(%rip),%rdx        # 605170 <lab>
  401c52:	48 8b 35 1f 35 20 00 	mov    0x20351f(%rip),%rsi        # 605178 <course>
  401c59:	48 8b 3d 00 35 20 00 	mov    0x203500(%rip),%rdi        # 605160 <user_id>
  401c60:	e8 0e 11 00 00       	callq  402d73 <driver_post>
  401c65:	85 c0                	test   %eax,%eax
  401c67:	79 26                	jns    401c8f <notify_server+0x11a>
  401c69:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401c70:	00 
  401c71:	be b7 33 40 00       	mov    $0x4033b7,%esi
  401c76:	bf 01 00 00 00       	mov    $0x1,%edi
  401c7b:	b8 00 00 00 00       	mov    $0x0,%eax
  401c80:	e8 9b f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401c85:	bf 01 00 00 00       	mov    $0x1,%edi
  401c8a:	e8 e1 f1 ff ff       	callq  400e70 <exit@plt>
  401c8f:	85 db                	test   %ebx,%ebx
  401c91:	74 19                	je     401cac <notify_server+0x137>
  401c93:	bf e0 34 40 00       	mov    $0x4034e0,%edi
  401c98:	e8 53 f0 ff ff       	callq  400cf0 <puts@plt>
  401c9d:	bf c3 33 40 00       	mov    $0x4033c3,%edi
  401ca2:	e8 49 f0 ff ff       	callq  400cf0 <puts@plt>
  401ca7:	e9 9b 00 00 00       	jmpq   401d47 <notify_server+0x1d2>
  401cac:	bf cd 33 40 00       	mov    $0x4033cd,%edi
  401cb1:	e8 3a f0 ff ff       	callq  400cf0 <puts@plt>
  401cb6:	e9 8c 00 00 00       	jmpq   401d47 <notify_server+0x1d2>
  401cbb:	85 db                	test   %ebx,%ebx
  401cbd:	74 07                	je     401cc6 <notify_server+0x151>
  401cbf:	ba 91 33 40 00       	mov    $0x403391,%edx
  401cc4:	eb 05                	jmp    401ccb <notify_server+0x156>
  401cc6:	ba 96 33 40 00       	mov    $0x403396,%edx
  401ccb:	be 18 35 40 00       	mov    $0x403518,%esi
  401cd0:	bf 01 00 00 00       	mov    $0x1,%edi
  401cd5:	b8 00 00 00 00       	mov    $0x0,%eax
  401cda:	e8 41 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401cdf:	48 8b 15 7a 34 20 00 	mov    0x20347a(%rip),%rdx        # 605160 <user_id>
  401ce6:	be d4 33 40 00       	mov    $0x4033d4,%esi
  401ceb:	bf 01 00 00 00       	mov    $0x1,%edi
  401cf0:	b8 00 00 00 00       	mov    $0x0,%eax
  401cf5:	e8 26 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401cfa:	48 8b 15 77 34 20 00 	mov    0x203477(%rip),%rdx        # 605178 <course>
  401d01:	be e1 33 40 00       	mov    $0x4033e1,%esi
  401d06:	bf 01 00 00 00       	mov    $0x1,%edi
  401d0b:	b8 00 00 00 00       	mov    $0x0,%eax
  401d10:	e8 0b f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401d15:	48 8b 15 54 34 20 00 	mov    0x203454(%rip),%rdx        # 605170 <lab>
  401d1c:	be ed 33 40 00       	mov    $0x4033ed,%esi
  401d21:	bf 01 00 00 00       	mov    $0x1,%edi
  401d26:	b8 00 00 00 00       	mov    $0x0,%eax
  401d2b:	e8 f0 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401d30:	48 89 e2             	mov    %rsp,%rdx
  401d33:	be f6 33 40 00       	mov    $0x4033f6,%esi
  401d38:	bf 01 00 00 00       	mov    $0x1,%edi
  401d3d:	b8 00 00 00 00       	mov    $0x0,%eax
  401d42:	e8 d9 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401d47:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  401d4e:	00 
  401d4f:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401d56:	00 00 
  401d58:	74 05                	je     401d5f <notify_server+0x1ea>
  401d5a:	e8 b1 ef ff ff       	callq  400d10 <__stack_chk_fail@plt>
  401d5f:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401d66:	5b                   	pop    %rbx
  401d67:	c3                   	retq   

0000000000401d68 <validate>:
  401d68:	53                   	push   %rbx
  401d69:	89 fb                	mov    %edi,%ebx
  401d6b:	83 3d b6 37 20 00 00 	cmpl   $0x0,0x2037b6(%rip)        # 605528 <is_checker>
  401d72:	74 6b                	je     401ddf <validate+0x77>
  401d74:	39 3d a2 37 20 00    	cmp    %edi,0x2037a2(%rip)        # 60551c <vlevel>
  401d7a:	74 14                	je     401d90 <validate+0x28>
  401d7c:	bf 02 34 40 00       	mov    $0x403402,%edi
  401d81:	e8 6a ef ff ff       	callq  400cf0 <puts@plt>
  401d86:	b8 00 00 00 00       	mov    $0x0,%eax
  401d8b:	e8 5e fd ff ff       	callq  401aee <check_fail>
  401d90:	8b 15 82 37 20 00    	mov    0x203782(%rip),%edx        # 605518 <check_level>
  401d96:	39 d7                	cmp    %edx,%edi
  401d98:	74 20                	je     401dba <validate+0x52>
  401d9a:	89 f9                	mov    %edi,%ecx
  401d9c:	be 40 35 40 00       	mov    $0x403540,%esi
  401da1:	bf 01 00 00 00       	mov    $0x1,%edi
  401da6:	b8 00 00 00 00       	mov    $0x0,%eax
  401dab:	e8 70 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401db0:	b8 00 00 00 00       	mov    $0x0,%eax
  401db5:	e8 34 fd ff ff       	callq  401aee <check_fail>
  401dba:	0f be 15 87 43 20 00 	movsbl 0x204387(%rip),%edx        # 606148 <target_prefix>
  401dc1:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401dc7:	89 f9                	mov    %edi,%ecx
  401dc9:	be 20 34 40 00       	mov    $0x403420,%esi
  401dce:	bf 01 00 00 00       	mov    $0x1,%edi
  401dd3:	b8 00 00 00 00       	mov    $0x0,%eax
  401dd8:	e8 43 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401ddd:	eb 49                	jmp    401e28 <validate+0xc0>
  401ddf:	3b 3d 37 37 20 00    	cmp    0x203737(%rip),%edi        # 60551c <vlevel>
  401de5:	74 18                	je     401dff <validate+0x97>
  401de7:	bf 02 34 40 00       	mov    $0x403402,%edi
  401dec:	e8 ff ee ff ff       	callq  400cf0 <puts@plt>
  401df1:	89 de                	mov    %ebx,%esi
  401df3:	bf 00 00 00 00       	mov    $0x0,%edi
  401df8:	e8 78 fd ff ff       	callq  401b75 <notify_server>
  401dfd:	eb 29                	jmp    401e28 <validate+0xc0>
  401dff:	0f be 0d 42 43 20 00 	movsbl 0x204342(%rip),%ecx        # 606148 <target_prefix>
  401e06:	89 fa                	mov    %edi,%edx
  401e08:	be 68 35 40 00       	mov    $0x403568,%esi
  401e0d:	bf 01 00 00 00       	mov    $0x1,%edi
  401e12:	b8 00 00 00 00       	mov    $0x0,%eax
  401e17:	e8 04 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401e1c:	89 de                	mov    %ebx,%esi
  401e1e:	bf 01 00 00 00       	mov    $0x1,%edi
  401e23:	e8 4d fd ff ff       	callq  401b75 <notify_server>
  401e28:	5b                   	pop    %rbx
  401e29:	c3                   	retq   

0000000000401e2a <fail>:
  401e2a:	48 83 ec 08          	sub    $0x8,%rsp
  401e2e:	83 3d f3 36 20 00 00 	cmpl   $0x0,0x2036f3(%rip)        # 605528 <is_checker>
  401e35:	74 0a                	je     401e41 <fail+0x17>
  401e37:	b8 00 00 00 00       	mov    $0x0,%eax
  401e3c:	e8 ad fc ff ff       	callq  401aee <check_fail>
  401e41:	89 fe                	mov    %edi,%esi
  401e43:	bf 00 00 00 00       	mov    $0x0,%edi
  401e48:	e8 28 fd ff ff       	callq  401b75 <notify_server>
  401e4d:	48 83 c4 08          	add    $0x8,%rsp
  401e51:	c3                   	retq   

0000000000401e52 <bushandler>:
  401e52:	48 83 ec 08          	sub    $0x8,%rsp
  401e56:	83 3d cb 36 20 00 00 	cmpl   $0x0,0x2036cb(%rip)        # 605528 <is_checker>
  401e5d:	74 14                	je     401e73 <bushandler+0x21>
  401e5f:	bf 35 34 40 00       	mov    $0x403435,%edi
  401e64:	e8 87 ee ff ff       	callq  400cf0 <puts@plt>
  401e69:	b8 00 00 00 00       	mov    $0x0,%eax
  401e6e:	e8 7b fc ff ff       	callq  401aee <check_fail>
  401e73:	bf a0 35 40 00       	mov    $0x4035a0,%edi
  401e78:	e8 73 ee ff ff       	callq  400cf0 <puts@plt>
  401e7d:	bf 3f 34 40 00       	mov    $0x40343f,%edi
  401e82:	e8 69 ee ff ff       	callq  400cf0 <puts@plt>
  401e87:	be 00 00 00 00       	mov    $0x0,%esi
  401e8c:	bf 00 00 00 00       	mov    $0x0,%edi
  401e91:	e8 df fc ff ff       	callq  401b75 <notify_server>
  401e96:	bf 01 00 00 00       	mov    $0x1,%edi
  401e9b:	e8 d0 ef ff ff       	callq  400e70 <exit@plt>

0000000000401ea0 <seghandler>:
  401ea0:	48 83 ec 08          	sub    $0x8,%rsp
  401ea4:	83 3d 7d 36 20 00 00 	cmpl   $0x0,0x20367d(%rip)        # 605528 <is_checker>
  401eab:	74 14                	je     401ec1 <seghandler+0x21>
  401ead:	bf 55 34 40 00       	mov    $0x403455,%edi
  401eb2:	e8 39 ee ff ff       	callq  400cf0 <puts@plt>
  401eb7:	b8 00 00 00 00       	mov    $0x0,%eax
  401ebc:	e8 2d fc ff ff       	callq  401aee <check_fail>
  401ec1:	bf c0 35 40 00       	mov    $0x4035c0,%edi
  401ec6:	e8 25 ee ff ff       	callq  400cf0 <puts@plt>
  401ecb:	bf 3f 34 40 00       	mov    $0x40343f,%edi
  401ed0:	e8 1b ee ff ff       	callq  400cf0 <puts@plt>
  401ed5:	be 00 00 00 00       	mov    $0x0,%esi
  401eda:	bf 00 00 00 00       	mov    $0x0,%edi
  401edf:	e8 91 fc ff ff       	callq  401b75 <notify_server>
  401ee4:	bf 01 00 00 00       	mov    $0x1,%edi
  401ee9:	e8 82 ef ff ff       	callq  400e70 <exit@plt>

0000000000401eee <illegalhandler>:
  401eee:	48 83 ec 08          	sub    $0x8,%rsp
  401ef2:	83 3d 2f 36 20 00 00 	cmpl   $0x0,0x20362f(%rip)        # 605528 <is_checker>
  401ef9:	74 14                	je     401f0f <illegalhandler+0x21>
  401efb:	bf 68 34 40 00       	mov    $0x403468,%edi
  401f00:	e8 eb ed ff ff       	callq  400cf0 <puts@plt>
  401f05:	b8 00 00 00 00       	mov    $0x0,%eax
  401f0a:	e8 df fb ff ff       	callq  401aee <check_fail>
  401f0f:	bf e8 35 40 00       	mov    $0x4035e8,%edi
  401f14:	e8 d7 ed ff ff       	callq  400cf0 <puts@plt>
  401f19:	bf 3f 34 40 00       	mov    $0x40343f,%edi
  401f1e:	e8 cd ed ff ff       	callq  400cf0 <puts@plt>
  401f23:	be 00 00 00 00       	mov    $0x0,%esi
  401f28:	bf 00 00 00 00       	mov    $0x0,%edi
  401f2d:	e8 43 fc ff ff       	callq  401b75 <notify_server>
  401f32:	bf 01 00 00 00       	mov    $0x1,%edi
  401f37:	e8 34 ef ff ff       	callq  400e70 <exit@plt>

0000000000401f3c <sigalrmhandler>:
  401f3c:	48 83 ec 08          	sub    $0x8,%rsp
  401f40:	83 3d e1 35 20 00 00 	cmpl   $0x0,0x2035e1(%rip)        # 605528 <is_checker>
  401f47:	74 14                	je     401f5d <sigalrmhandler+0x21>
  401f49:	bf 7c 34 40 00       	mov    $0x40347c,%edi
  401f4e:	e8 9d ed ff ff       	callq  400cf0 <puts@plt>
  401f53:	b8 00 00 00 00       	mov    $0x0,%eax
  401f58:	e8 91 fb ff ff       	callq  401aee <check_fail>
  401f5d:	ba 05 00 00 00       	mov    $0x5,%edx
  401f62:	be 18 36 40 00       	mov    $0x403618,%esi
  401f67:	bf 01 00 00 00       	mov    $0x1,%edi
  401f6c:	b8 00 00 00 00       	mov    $0x0,%eax
  401f71:	e8 aa ee ff ff       	callq  400e20 <__printf_chk@plt>
  401f76:	be 00 00 00 00       	mov    $0x0,%esi
  401f7b:	bf 00 00 00 00       	mov    $0x0,%edi
  401f80:	e8 f0 fb ff ff       	callq  401b75 <notify_server>
  401f85:	bf 01 00 00 00       	mov    $0x1,%edi
  401f8a:	e8 e1 ee ff ff       	callq  400e70 <exit@plt>

0000000000401f8f <launch>:
  401f8f:	55                   	push   %rbp
  401f90:	48 89 e5             	mov    %rsp,%rbp
  401f93:	48 83 ec 10          	sub    $0x10,%rsp
  401f97:	48 89 fa             	mov    %rdi,%rdx
  401f9a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401fa1:	00 00 
  401fa3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401fa7:	31 c0                	xor    %eax,%eax
  401fa9:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401fad:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401fb1:	48 29 c4             	sub    %rax,%rsp
  401fb4:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401fb9:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401fbd:	be f4 00 00 00       	mov    $0xf4,%esi
  401fc2:	e8 69 ed ff ff       	callq  400d30 <memset@plt>
  401fc7:	48 8b 05 f2 34 20 00 	mov    0x2034f2(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  401fce:	48 39 05 3b 35 20 00 	cmp    %rax,0x20353b(%rip)        # 605510 <infile>
  401fd5:	75 14                	jne    401feb <launch+0x5c>
  401fd7:	be 84 34 40 00       	mov    $0x403484,%esi
  401fdc:	bf 01 00 00 00       	mov    $0x1,%edi
  401fe1:	b8 00 00 00 00       	mov    $0x0,%eax
  401fe6:	e8 35 ee ff ff       	callq  400e20 <__printf_chk@plt>
  401feb:	c7 05 27 35 20 00 00 	movl   $0x0,0x203527(%rip)        # 60551c <vlevel>
  401ff2:	00 00 00 
  401ff5:	b8 00 00 00 00       	mov    $0x0,%eax
  401ffa:	e8 5b fa ff ff       	callq  401a5a <test>
  401fff:	83 3d 22 35 20 00 00 	cmpl   $0x0,0x203522(%rip)        # 605528 <is_checker>
  402006:	74 14                	je     40201c <launch+0x8d>
  402008:	bf 91 34 40 00       	mov    $0x403491,%edi
  40200d:	e8 de ec ff ff       	callq  400cf0 <puts@plt>
  402012:	b8 00 00 00 00       	mov    $0x0,%eax
  402017:	e8 d2 fa ff ff       	callq  401aee <check_fail>
  40201c:	bf 9c 34 40 00       	mov    $0x40349c,%edi
  402021:	e8 ca ec ff ff       	callq  400cf0 <puts@plt>
  402026:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40202a:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  402031:	00 00 
  402033:	74 05                	je     40203a <launch+0xab>
  402035:	e8 d6 ec ff ff       	callq  400d10 <__stack_chk_fail@plt>
  40203a:	c9                   	leaveq 
  40203b:	c3                   	retq   

000000000040203c <stable_launch>:
  40203c:	53                   	push   %rbx
  40203d:	48 89 3d c4 34 20 00 	mov    %rdi,0x2034c4(%rip)        # 605508 <global_offset>
  402044:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  40204a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  402050:	b9 32 01 00 00       	mov    $0x132,%ecx
  402055:	ba 07 00 00 00       	mov    $0x7,%edx
  40205a:	be 00 00 10 00       	mov    $0x100000,%esi
  40205f:	bf 00 60 58 55       	mov    $0x55586000,%edi
  402064:	e8 b7 ec ff ff       	callq  400d20 <mmap@plt>
  402069:	48 89 c3             	mov    %rax,%rbx
  40206c:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  402072:	74 37                	je     4020ab <stable_launch+0x6f>
  402074:	be 00 00 10 00       	mov    $0x100000,%esi
  402079:	48 89 c7             	mov    %rax,%rdi
  40207c:	e8 8f ed ff ff       	callq  400e10 <munmap@plt>
  402081:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  402086:	ba 50 36 40 00       	mov    $0x403650,%edx
  40208b:	be 01 00 00 00       	mov    $0x1,%esi
  402090:	48 8b 3d 49 34 20 00 	mov    0x203449(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  402097:	b8 00 00 00 00       	mov    $0x0,%eax
  40209c:	e8 ef ed ff ff       	callq  400e90 <__fprintf_chk@plt>
  4020a1:	bf 01 00 00 00       	mov    $0x1,%edi
  4020a6:	e8 c5 ed ff ff       	callq  400e70 <exit@plt>
  4020ab:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  4020b2:	48 89 15 97 40 20 00 	mov    %rdx,0x204097(%rip)        # 606150 <stack_top>
  4020b9:	48 89 e0             	mov    %rsp,%rax
  4020bc:	48 89 d4             	mov    %rdx,%rsp
  4020bf:	48 89 c2             	mov    %rax,%rdx
  4020c2:	48 89 15 37 34 20 00 	mov    %rdx,0x203437(%rip)        # 605500 <global_save_stack>
  4020c9:	48 8b 3d 38 34 20 00 	mov    0x203438(%rip),%rdi        # 605508 <global_offset>
  4020d0:	e8 ba fe ff ff       	callq  401f8f <launch>
  4020d5:	48 8b 05 24 34 20 00 	mov    0x203424(%rip),%rax        # 605500 <global_save_stack>
  4020dc:	48 89 c4             	mov    %rax,%rsp
  4020df:	be 00 00 10 00       	mov    $0x100000,%esi
  4020e4:	48 89 df             	mov    %rbx,%rdi
  4020e7:	e8 24 ed ff ff       	callq  400e10 <munmap@plt>
  4020ec:	5b                   	pop    %rbx
  4020ed:	c3                   	retq   

00000000004020ee <rio_readinitb>:
  4020ee:	89 37                	mov    %esi,(%rdi)
  4020f0:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  4020f7:	48 8d 47 10          	lea    0x10(%rdi),%rax
  4020fb:	48 89 47 08          	mov    %rax,0x8(%rdi)
  4020ff:	c3                   	retq   

0000000000402100 <sigalrm_handler>:
  402100:	48 83 ec 08          	sub    $0x8,%rsp
  402104:	b9 00 00 00 00       	mov    $0x0,%ecx
  402109:	ba 90 36 40 00       	mov    $0x403690,%edx
  40210e:	be 01 00 00 00       	mov    $0x1,%esi
  402113:	48 8b 3d c6 33 20 00 	mov    0x2033c6(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  40211a:	b8 00 00 00 00       	mov    $0x0,%eax
  40211f:	e8 6c ed ff ff       	callq  400e90 <__fprintf_chk@plt>
  402124:	bf 01 00 00 00       	mov    $0x1,%edi
  402129:	e8 42 ed ff ff       	callq  400e70 <exit@plt>

000000000040212e <rio_writen>:
  40212e:	41 55                	push   %r13
  402130:	41 54                	push   %r12
  402132:	55                   	push   %rbp
  402133:	53                   	push   %rbx
  402134:	48 83 ec 08          	sub    $0x8,%rsp
  402138:	41 89 fc             	mov    %edi,%r12d
  40213b:	48 89 f5             	mov    %rsi,%rbp
  40213e:	49 89 d5             	mov    %rdx,%r13
  402141:	48 89 d3             	mov    %rdx,%rbx
  402144:	eb 28                	jmp    40216e <rio_writen+0x40>
  402146:	48 89 da             	mov    %rbx,%rdx
  402149:	48 89 ee             	mov    %rbp,%rsi
  40214c:	44 89 e7             	mov    %r12d,%edi
  40214f:	e8 ac eb ff ff       	callq  400d00 <write@plt>
  402154:	48 85 c0             	test   %rax,%rax
  402157:	7f 0f                	jg     402168 <rio_writen+0x3a>
  402159:	e8 52 eb ff ff       	callq  400cb0 <__errno_location@plt>
  40215e:	83 38 04             	cmpl   $0x4,(%rax)
  402161:	75 15                	jne    402178 <rio_writen+0x4a>
  402163:	b8 00 00 00 00       	mov    $0x0,%eax
  402168:	48 29 c3             	sub    %rax,%rbx
  40216b:	48 01 c5             	add    %rax,%rbp
  40216e:	48 85 db             	test   %rbx,%rbx
  402171:	75 d3                	jne    402146 <rio_writen+0x18>
  402173:	4c 89 e8             	mov    %r13,%rax
  402176:	eb 07                	jmp    40217f <rio_writen+0x51>
  402178:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40217f:	48 83 c4 08          	add    $0x8,%rsp
  402183:	5b                   	pop    %rbx
  402184:	5d                   	pop    %rbp
  402185:	41 5c                	pop    %r12
  402187:	41 5d                	pop    %r13
  402189:	c3                   	retq   

000000000040218a <rio_read>:
  40218a:	41 55                	push   %r13
  40218c:	41 54                	push   %r12
  40218e:	55                   	push   %rbp
  40218f:	53                   	push   %rbx
  402190:	48 83 ec 08          	sub    $0x8,%rsp
  402194:	48 89 fb             	mov    %rdi,%rbx
  402197:	49 89 f5             	mov    %rsi,%r13
  40219a:	49 89 d4             	mov    %rdx,%r12
  40219d:	eb 2e                	jmp    4021cd <rio_read+0x43>
  40219f:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  4021a3:	8b 3b                	mov    (%rbx),%edi
  4021a5:	ba 00 20 00 00       	mov    $0x2000,%edx
  4021aa:	48 89 ee             	mov    %rbp,%rsi
  4021ad:	e8 ae eb ff ff       	callq  400d60 <read@plt>
  4021b2:	89 43 04             	mov    %eax,0x4(%rbx)
  4021b5:	85 c0                	test   %eax,%eax
  4021b7:	79 0c                	jns    4021c5 <rio_read+0x3b>
  4021b9:	e8 f2 ea ff ff       	callq  400cb0 <__errno_location@plt>
  4021be:	83 38 04             	cmpl   $0x4,(%rax)
  4021c1:	74 0a                	je     4021cd <rio_read+0x43>
  4021c3:	eb 37                	jmp    4021fc <rio_read+0x72>
  4021c5:	85 c0                	test   %eax,%eax
  4021c7:	74 3c                	je     402205 <rio_read+0x7b>
  4021c9:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4021cd:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4021d0:	85 ed                	test   %ebp,%ebp
  4021d2:	7e cb                	jle    40219f <rio_read+0x15>
  4021d4:	89 e8                	mov    %ebp,%eax
  4021d6:	49 39 c4             	cmp    %rax,%r12
  4021d9:	77 03                	ja     4021de <rio_read+0x54>
  4021db:	44 89 e5             	mov    %r12d,%ebp
  4021de:	4c 63 e5             	movslq %ebp,%r12
  4021e1:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4021e5:	4c 89 e2             	mov    %r12,%rdx
  4021e8:	4c 89 ef             	mov    %r13,%rdi
  4021eb:	e8 d0 eb ff ff       	callq  400dc0 <memcpy@plt>
  4021f0:	4c 01 63 08          	add    %r12,0x8(%rbx)
  4021f4:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4021f7:	4c 89 e0             	mov    %r12,%rax
  4021fa:	eb 0e                	jmp    40220a <rio_read+0x80>
  4021fc:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402203:	eb 05                	jmp    40220a <rio_read+0x80>
  402205:	b8 00 00 00 00       	mov    $0x0,%eax
  40220a:	48 83 c4 08          	add    $0x8,%rsp
  40220e:	5b                   	pop    %rbx
  40220f:	5d                   	pop    %rbp
  402210:	41 5c                	pop    %r12
  402212:	41 5d                	pop    %r13
  402214:	c3                   	retq   

0000000000402215 <rio_readlineb>:
  402215:	41 55                	push   %r13
  402217:	41 54                	push   %r12
  402219:	55                   	push   %rbp
  40221a:	53                   	push   %rbx
  40221b:	48 83 ec 18          	sub    $0x18,%rsp
  40221f:	49 89 fd             	mov    %rdi,%r13
  402222:	48 89 f5             	mov    %rsi,%rbp
  402225:	49 89 d4             	mov    %rdx,%r12
  402228:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40222f:	00 00 
  402231:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402236:	31 c0                	xor    %eax,%eax
  402238:	bb 01 00 00 00       	mov    $0x1,%ebx
  40223d:	eb 3f                	jmp    40227e <rio_readlineb+0x69>
  40223f:	ba 01 00 00 00       	mov    $0x1,%edx
  402244:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  402249:	4c 89 ef             	mov    %r13,%rdi
  40224c:	e8 39 ff ff ff       	callq  40218a <rio_read>
  402251:	83 f8 01             	cmp    $0x1,%eax
  402254:	75 15                	jne    40226b <rio_readlineb+0x56>
  402256:	48 8d 45 01          	lea    0x1(%rbp),%rax
  40225a:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  40225f:	88 55 00             	mov    %dl,0x0(%rbp)
  402262:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  402267:	75 0e                	jne    402277 <rio_readlineb+0x62>
  402269:	eb 1a                	jmp    402285 <rio_readlineb+0x70>
  40226b:	85 c0                	test   %eax,%eax
  40226d:	75 22                	jne    402291 <rio_readlineb+0x7c>
  40226f:	48 83 fb 01          	cmp    $0x1,%rbx
  402273:	75 13                	jne    402288 <rio_readlineb+0x73>
  402275:	eb 23                	jmp    40229a <rio_readlineb+0x85>
  402277:	48 83 c3 01          	add    $0x1,%rbx
  40227b:	48 89 c5             	mov    %rax,%rbp
  40227e:	4c 39 e3             	cmp    %r12,%rbx
  402281:	72 bc                	jb     40223f <rio_readlineb+0x2a>
  402283:	eb 03                	jmp    402288 <rio_readlineb+0x73>
  402285:	48 89 c5             	mov    %rax,%rbp
  402288:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  40228c:	48 89 d8             	mov    %rbx,%rax
  40228f:	eb 0e                	jmp    40229f <rio_readlineb+0x8a>
  402291:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402298:	eb 05                	jmp    40229f <rio_readlineb+0x8a>
  40229a:	b8 00 00 00 00       	mov    $0x0,%eax
  40229f:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  4022a4:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  4022ab:	00 00 
  4022ad:	74 05                	je     4022b4 <rio_readlineb+0x9f>
  4022af:	e8 5c ea ff ff       	callq  400d10 <__stack_chk_fail@plt>
  4022b4:	48 83 c4 18          	add    $0x18,%rsp
  4022b8:	5b                   	pop    %rbx
  4022b9:	5d                   	pop    %rbp
  4022ba:	41 5c                	pop    %r12
  4022bc:	41 5d                	pop    %r13
  4022be:	c3                   	retq   

00000000004022bf <urlencode>:
  4022bf:	41 54                	push   %r12
  4022c1:	55                   	push   %rbp
  4022c2:	53                   	push   %rbx
  4022c3:	48 83 ec 10          	sub    $0x10,%rsp
  4022c7:	48 89 fb             	mov    %rdi,%rbx
  4022ca:	48 89 f5             	mov    %rsi,%rbp
  4022cd:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4022d4:	00 00 
  4022d6:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4022db:	31 c0                	xor    %eax,%eax
  4022dd:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4022e4:	f2 ae                	repnz scas %es:(%rdi),%al
  4022e6:	48 f7 d1             	not    %rcx
  4022e9:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4022ec:	e9 aa 00 00 00       	jmpq   40239b <urlencode+0xdc>
  4022f1:	44 0f b6 03          	movzbl (%rbx),%r8d
  4022f5:	41 80 f8 2a          	cmp    $0x2a,%r8b
  4022f9:	0f 94 c2             	sete   %dl
  4022fc:	41 80 f8 2d          	cmp    $0x2d,%r8b
  402300:	0f 94 c0             	sete   %al
  402303:	08 c2                	or     %al,%dl
  402305:	75 24                	jne    40232b <urlencode+0x6c>
  402307:	41 80 f8 2e          	cmp    $0x2e,%r8b
  40230b:	74 1e                	je     40232b <urlencode+0x6c>
  40230d:	41 80 f8 5f          	cmp    $0x5f,%r8b
  402311:	74 18                	je     40232b <urlencode+0x6c>
  402313:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  402317:	3c 09                	cmp    $0x9,%al
  402319:	76 10                	jbe    40232b <urlencode+0x6c>
  40231b:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  40231f:	3c 19                	cmp    $0x19,%al
  402321:	76 08                	jbe    40232b <urlencode+0x6c>
  402323:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  402327:	3c 19                	cmp    $0x19,%al
  402329:	77 0a                	ja     402335 <urlencode+0x76>
  40232b:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  40232f:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402333:	eb 5f                	jmp    402394 <urlencode+0xd5>
  402335:	41 80 f8 20          	cmp    $0x20,%r8b
  402339:	75 0a                	jne    402345 <urlencode+0x86>
  40233b:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  40233f:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402343:	eb 4f                	jmp    402394 <urlencode+0xd5>
  402345:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  402349:	3c 5f                	cmp    $0x5f,%al
  40234b:	0f 96 c2             	setbe  %dl
  40234e:	41 80 f8 09          	cmp    $0x9,%r8b
  402352:	0f 94 c0             	sete   %al
  402355:	08 c2                	or     %al,%dl
  402357:	74 50                	je     4023a9 <urlencode+0xea>
  402359:	45 0f b6 c0          	movzbl %r8b,%r8d
  40235d:	b9 48 37 40 00       	mov    $0x403748,%ecx
  402362:	ba 08 00 00 00       	mov    $0x8,%edx
  402367:	be 01 00 00 00       	mov    $0x1,%esi
  40236c:	48 89 e7             	mov    %rsp,%rdi
  40236f:	b8 00 00 00 00       	mov    $0x0,%eax
  402374:	e8 27 eb ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402379:	0f b6 04 24          	movzbl (%rsp),%eax
  40237d:	88 45 00             	mov    %al,0x0(%rbp)
  402380:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  402385:	88 45 01             	mov    %al,0x1(%rbp)
  402388:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  40238d:	88 45 02             	mov    %al,0x2(%rbp)
  402390:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  402394:	48 83 c3 01          	add    $0x1,%rbx
  402398:	44 89 e0             	mov    %r12d,%eax
  40239b:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  40239f:	85 c0                	test   %eax,%eax
  4023a1:	0f 85 4a ff ff ff    	jne    4022f1 <urlencode+0x32>
  4023a7:	eb 05                	jmp    4023ae <urlencode+0xef>
  4023a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023ae:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4023b3:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4023ba:	00 00 
  4023bc:	74 05                	je     4023c3 <urlencode+0x104>
  4023be:	e8 4d e9 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  4023c3:	48 83 c4 10          	add    $0x10,%rsp
  4023c7:	5b                   	pop    %rbx
  4023c8:	5d                   	pop    %rbp
  4023c9:	41 5c                	pop    %r12
  4023cb:	c3                   	retq   

00000000004023cc <submitr>:
  4023cc:	41 57                	push   %r15
  4023ce:	41 56                	push   %r14
  4023d0:	41 55                	push   %r13
  4023d2:	41 54                	push   %r12
  4023d4:	55                   	push   %rbp
  4023d5:	53                   	push   %rbx
  4023d6:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  4023dd:	49 89 fd             	mov    %rdi,%r13
  4023e0:	89 74 24 0c          	mov    %esi,0xc(%rsp)
  4023e4:	48 89 14 24          	mov    %rdx,(%rsp)
  4023e8:	49 89 ce             	mov    %rcx,%r14
  4023eb:	4d 89 c7             	mov    %r8,%r15
  4023ee:	4d 89 cc             	mov    %r9,%r12
  4023f1:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  4023f8:	00 
  4023f9:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402400:	00 00 
  402402:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  402409:	00 
  40240a:	31 c0                	xor    %eax,%eax
  40240c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  402413:	00 
  402414:	ba 00 00 00 00       	mov    $0x0,%edx
  402419:	be 01 00 00 00       	mov    $0x1,%esi
  40241e:	bf 02 00 00 00       	mov    $0x2,%edi
  402423:	e8 88 ea ff ff       	callq  400eb0 <socket@plt>
  402428:	85 c0                	test   %eax,%eax
  40242a:	79 4e                	jns    40247a <submitr+0xae>
  40242c:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402433:	3a 20 43 
  402436:	48 89 03             	mov    %rax,(%rbx)
  402439:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402440:	20 75 6e 
  402443:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402447:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40244e:	74 6f 20 
  402451:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402455:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  40245c:	65 20 73 
  40245f:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402463:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  40246a:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  402470:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402475:	e9 b3 06 00 00       	jmpq   402b2d <submitr+0x761>
  40247a:	89 c5                	mov    %eax,%ebp
  40247c:	4c 89 ef             	mov    %r13,%rdi
  40247f:	e8 0c e9 ff ff       	callq  400d90 <gethostbyname@plt>
  402484:	48 85 c0             	test   %rax,%rax
  402487:	75 75                	jne    4024fe <submitr+0x132>
  402489:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402490:	3a 20 44 
  402493:	48 89 03             	mov    %rax,(%rbx)
  402496:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  40249d:	20 75 6e 
  4024a0:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4024a4:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4024ab:	74 6f 20 
  4024ae:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4024b2:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4024b9:	76 65 20 
  4024bc:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4024c0:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  4024c7:	61 62 20 
  4024ca:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4024ce:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4024d5:	72 20 61 
  4024d8:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4024dc:	c7 43 30 64 64 72 65 	movl   $0x65726464,0x30(%rbx)
  4024e3:	66 c7 43 34 73 73    	movw   $0x7373,0x34(%rbx)
  4024e9:	c6 43 36 00          	movb   $0x0,0x36(%rbx)
  4024ed:	89 ef                	mov    %ebp,%edi
  4024ef:	e8 5c e8 ff ff       	callq  400d50 <close@plt>
  4024f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024f9:	e9 2f 06 00 00       	jmpq   402b2d <submitr+0x761>
  4024fe:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  402505:	00 00 
  402507:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  40250e:	00 00 
  402510:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  402517:	48 63 50 14          	movslq 0x14(%rax),%rdx
  40251b:	48 8b 40 18          	mov    0x18(%rax),%rax
  40251f:	48 8b 30             	mov    (%rax),%rsi
  402522:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
  402527:	b9 0c 00 00 00       	mov    $0xc,%ecx
  40252c:	e8 6f e8 ff ff       	callq  400da0 <__memmove_chk@plt>
  402531:	0f b7 44 24 0c       	movzwl 0xc(%rsp),%eax
  402536:	66 c1 c8 08          	ror    $0x8,%ax
  40253a:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  40253f:	ba 10 00 00 00       	mov    $0x10,%edx
  402544:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  402549:	89 ef                	mov    %ebp,%edi
  40254b:	e8 30 e9 ff ff       	callq  400e80 <connect@plt>
  402550:	85 c0                	test   %eax,%eax
  402552:	79 67                	jns    4025bb <submitr+0x1ef>
  402554:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  40255b:	3a 20 55 
  40255e:	48 89 03             	mov    %rax,(%rbx)
  402561:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402568:	20 74 6f 
  40256b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40256f:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402576:	65 63 74 
  402579:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40257d:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  402584:	68 65 20 
  402587:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40258b:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  402592:	61 62 20 
  402595:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402599:	c7 43 28 73 65 72 76 	movl   $0x76726573,0x28(%rbx)
  4025a0:	66 c7 43 2c 65 72    	movw   $0x7265,0x2c(%rbx)
  4025a6:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4025aa:	89 ef                	mov    %ebp,%edi
  4025ac:	e8 9f e7 ff ff       	callq  400d50 <close@plt>
  4025b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025b6:	e9 72 05 00 00       	jmpq   402b2d <submitr+0x761>
  4025bb:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  4025c2:	b8 00 00 00 00       	mov    $0x0,%eax
  4025c7:	48 89 f1             	mov    %rsi,%rcx
  4025ca:	4c 89 e7             	mov    %r12,%rdi
  4025cd:	f2 ae                	repnz scas %es:(%rdi),%al
  4025cf:	48 f7 d1             	not    %rcx
  4025d2:	48 89 ca             	mov    %rcx,%rdx
  4025d5:	48 89 f1             	mov    %rsi,%rcx
  4025d8:	48 8b 3c 24          	mov    (%rsp),%rdi
  4025dc:	f2 ae                	repnz scas %es:(%rdi),%al
  4025de:	48 f7 d1             	not    %rcx
  4025e1:	49 89 c8             	mov    %rcx,%r8
  4025e4:	48 89 f1             	mov    %rsi,%rcx
  4025e7:	4c 89 f7             	mov    %r14,%rdi
  4025ea:	f2 ae                	repnz scas %es:(%rdi),%al
  4025ec:	48 f7 d1             	not    %rcx
  4025ef:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  4025f4:	48 89 f1             	mov    %rsi,%rcx
  4025f7:	4c 89 ff             	mov    %r15,%rdi
  4025fa:	f2 ae                	repnz scas %es:(%rdi),%al
  4025fc:	48 89 c8             	mov    %rcx,%rax
  4025ff:	48 f7 d0             	not    %rax
  402602:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  402607:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  40260c:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  402613:	00 
  402614:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  40261a:	76 72                	jbe    40268e <submitr+0x2c2>
  40261c:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402623:	3a 20 52 
  402626:	48 89 03             	mov    %rax,(%rbx)
  402629:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402630:	20 73 74 
  402633:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402637:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40263e:	74 6f 6f 
  402641:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402645:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  40264c:	65 2e 20 
  40264f:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402653:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  40265a:	61 73 65 
  40265d:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402661:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402668:	49 54 52 
  40266b:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40266f:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402676:	55 46 00 
  402679:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40267d:	89 ef                	mov    %ebp,%edi
  40267f:	e8 cc e6 ff ff       	callq  400d50 <close@plt>
  402684:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402689:	e9 9f 04 00 00       	jmpq   402b2d <submitr+0x761>
  40268e:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  402695:	00 
  402696:	b9 00 04 00 00       	mov    $0x400,%ecx
  40269b:	b8 00 00 00 00       	mov    $0x0,%eax
  4026a0:	48 89 f7             	mov    %rsi,%rdi
  4026a3:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4026a6:	4c 89 e7             	mov    %r12,%rdi
  4026a9:	e8 11 fc ff ff       	callq  4022bf <urlencode>
  4026ae:	85 c0                	test   %eax,%eax
  4026b0:	0f 89 8a 00 00 00    	jns    402740 <submitr+0x374>
  4026b6:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4026bd:	3a 20 52 
  4026c0:	48 89 03             	mov    %rax,(%rbx)
  4026c3:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4026ca:	20 73 74 
  4026cd:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4026d1:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4026d8:	63 6f 6e 
  4026db:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4026df:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4026e6:	20 61 6e 
  4026e9:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026ed:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4026f4:	67 61 6c 
  4026f7:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4026fb:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  402702:	6e 70 72 
  402705:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402709:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402710:	6c 65 20 
  402713:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402717:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  40271e:	63 74 65 
  402721:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402725:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  40272b:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  40272f:	89 ef                	mov    %ebp,%edi
  402731:	e8 1a e6 ff ff       	callq  400d50 <close@plt>
  402736:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40273b:	e9 ed 03 00 00       	jmpq   402b2d <submitr+0x761>
  402740:	4c 8d a4 24 40 20 00 	lea    0x2040(%rsp),%r12
  402747:	00 
  402748:	48 83 ec 08          	sub    $0x8,%rsp
  40274c:	41 55                	push   %r13
  40274e:	48 8d 84 24 50 40 00 	lea    0x4050(%rsp),%rax
  402755:	00 
  402756:	50                   	push   %rax
  402757:	41 56                	push   %r14
  402759:	4d 89 f9             	mov    %r15,%r9
  40275c:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
  402761:	b9 b8 36 40 00       	mov    $0x4036b8,%ecx
  402766:	ba 00 20 00 00       	mov    $0x2000,%edx
  40276b:	be 01 00 00 00       	mov    $0x1,%esi
  402770:	4c 89 e7             	mov    %r12,%rdi
  402773:	b8 00 00 00 00       	mov    $0x0,%eax
  402778:	e8 23 e7 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  40277d:	b8 00 00 00 00       	mov    $0x0,%eax
  402782:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402789:	4c 89 e7             	mov    %r12,%rdi
  40278c:	f2 ae                	repnz scas %es:(%rdi),%al
  40278e:	48 f7 d1             	not    %rcx
  402791:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  402795:	48 83 c4 20          	add    $0x20,%rsp
  402799:	4c 89 e6             	mov    %r12,%rsi
  40279c:	89 ef                	mov    %ebp,%edi
  40279e:	e8 8b f9 ff ff       	callq  40212e <rio_writen>
  4027a3:	48 85 c0             	test   %rax,%rax
  4027a6:	79 6b                	jns    402813 <submitr+0x447>
  4027a8:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4027af:	3a 20 43 
  4027b2:	48 89 03             	mov    %rax,(%rbx)
  4027b5:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4027bc:	20 75 6e 
  4027bf:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027c3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027ca:	74 6f 20 
  4027cd:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027d1:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  4027d8:	20 74 6f 
  4027db:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4027df:	48 b8 20 74 68 65 20 	movabs $0x7475412065687420,%rax
  4027e6:	41 75 74 
  4027e9:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4027ed:	48 b8 6f 6c 61 62 20 	movabs $0x7265732062616c6f,%rax
  4027f4:	73 65 72 
  4027f7:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4027fb:	c7 43 30 76 65 72 00 	movl   $0x726576,0x30(%rbx)
  402802:	89 ef                	mov    %ebp,%edi
  402804:	e8 47 e5 ff ff       	callq  400d50 <close@plt>
  402809:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40280e:	e9 1a 03 00 00       	jmpq   402b2d <submitr+0x761>
  402813:	89 ee                	mov    %ebp,%esi
  402815:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40281a:	e8 cf f8 ff ff       	callq  4020ee <rio_readinitb>
  40281f:	ba 00 20 00 00       	mov    $0x2000,%edx
  402824:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  40282b:	00 
  40282c:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402831:	e8 df f9 ff ff       	callq  402215 <rio_readlineb>
  402836:	48 85 c0             	test   %rax,%rax
  402839:	7f 7f                	jg     4028ba <submitr+0x4ee>
  40283b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402842:	3a 20 43 
  402845:	48 89 03             	mov    %rax,(%rbx)
  402848:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40284f:	20 75 6e 
  402852:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402856:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40285d:	74 6f 20 
  402860:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402864:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  40286b:	66 69 72 
  40286e:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402872:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402879:	61 64 65 
  40287c:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402880:	48 b8 72 20 66 72 6f 	movabs $0x41206d6f72662072,%rax
  402887:	6d 20 41 
  40288a:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40288e:	48 b8 75 74 6f 6c 61 	movabs $0x732062616c6f7475,%rax
  402895:	62 20 73 
  402898:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40289c:	c7 43 38 65 72 76 65 	movl   $0x65767265,0x38(%rbx)
  4028a3:	66 c7 43 3c 72 00    	movw   $0x72,0x3c(%rbx)
  4028a9:	89 ef                	mov    %ebp,%edi
  4028ab:	e8 a0 e4 ff ff       	callq  400d50 <close@plt>
  4028b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028b5:	e9 73 02 00 00       	jmpq   402b2d <submitr+0x761>
  4028ba:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  4028c1:	00 
  4028c2:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  4028c7:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  4028ce:	00 
  4028cf:	be 4f 37 40 00       	mov    $0x40374f,%esi
  4028d4:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  4028db:	00 
  4028dc:	b8 00 00 00 00       	mov    $0x0,%eax
  4028e1:	e8 1a e5 ff ff       	callq  400e00 <__isoc99_sscanf@plt>
  4028e6:	e9 92 00 00 00       	jmpq   40297d <submitr+0x5b1>
  4028eb:	ba 00 20 00 00       	mov    $0x2000,%edx
  4028f0:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4028f7:	00 
  4028f8:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4028fd:	e8 13 f9 ff ff       	callq  402215 <rio_readlineb>
  402902:	48 85 c0             	test   %rax,%rax
  402905:	7f 76                	jg     40297d <submitr+0x5b1>
  402907:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40290e:	3a 20 43 
  402911:	48 89 03             	mov    %rax,(%rbx)
  402914:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40291b:	20 75 6e 
  40291e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402922:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402929:	74 6f 20 
  40292c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402930:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402937:	68 65 61 
  40293a:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40293e:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402945:	66 72 6f 
  402948:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40294c:	48 b8 6d 20 41 75 74 	movabs $0x616c6f747541206d,%rax
  402953:	6f 6c 61 
  402956:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40295a:	48 b8 62 20 73 65 72 	movabs $0x7265767265732062,%rax
  402961:	76 65 72 
  402964:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402968:	c6 43 38 00          	movb   $0x0,0x38(%rbx)
  40296c:	89 ef                	mov    %ebp,%edi
  40296e:	e8 dd e3 ff ff       	callq  400d50 <close@plt>
  402973:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402978:	e9 b0 01 00 00       	jmpq   402b2d <submitr+0x761>
  40297d:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  402984:	00 
  402985:	b8 0d 00 00 00       	mov    $0xd,%eax
  40298a:	29 d0                	sub    %edx,%eax
  40298c:	75 1b                	jne    4029a9 <submitr+0x5dd>
  40298e:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  402995:	00 
  402996:	b8 0a 00 00 00       	mov    $0xa,%eax
  40299b:	29 d0                	sub    %edx,%eax
  40299d:	75 0a                	jne    4029a9 <submitr+0x5dd>
  40299f:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  4029a6:	00 
  4029a7:	f7 d8                	neg    %eax
  4029a9:	85 c0                	test   %eax,%eax
  4029ab:	0f 85 3a ff ff ff    	jne    4028eb <submitr+0x51f>
  4029b1:	ba 00 20 00 00       	mov    $0x2000,%edx
  4029b6:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4029bd:	00 
  4029be:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4029c3:	e8 4d f8 ff ff       	callq  402215 <rio_readlineb>
  4029c8:	48 85 c0             	test   %rax,%rax
  4029cb:	0f 8f 80 00 00 00    	jg     402a51 <submitr+0x685>
  4029d1:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4029d8:	3a 20 43 
  4029db:	48 89 03             	mov    %rax,(%rbx)
  4029de:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4029e5:	20 75 6e 
  4029e8:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4029ec:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4029f3:	74 6f 20 
  4029f6:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4029fa:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402a01:	73 74 61 
  402a04:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402a08:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402a0f:	65 73 73 
  402a12:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402a16:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402a1d:	72 6f 6d 
  402a20:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402a24:	48 b8 20 41 75 74 6f 	movabs $0x62616c6f74754120,%rax
  402a2b:	6c 61 62 
  402a2e:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402a32:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  402a39:	65 72 00 
  402a3c:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402a40:	89 ef                	mov    %ebp,%edi
  402a42:	e8 09 e3 ff ff       	callq  400d50 <close@plt>
  402a47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a4c:	e9 dc 00 00 00       	jmpq   402b2d <submitr+0x761>
  402a51:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  402a56:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402a5d:	74 37                	je     402a96 <submitr+0x6ca>
  402a5f:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  402a66:	00 
  402a67:	b9 18 37 40 00       	mov    $0x403718,%ecx
  402a6c:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402a73:	be 01 00 00 00       	mov    $0x1,%esi
  402a78:	48 89 df             	mov    %rbx,%rdi
  402a7b:	b8 00 00 00 00       	mov    $0x0,%eax
  402a80:	e8 1b e4 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402a85:	89 ef                	mov    %ebp,%edi
  402a87:	e8 c4 e2 ff ff       	callq  400d50 <close@plt>
  402a8c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a91:	e9 97 00 00 00       	jmpq   402b2d <submitr+0x761>
  402a96:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402a9d:	00 
  402a9e:	48 89 df             	mov    %rbx,%rdi
  402aa1:	e8 3a e2 ff ff       	callq  400ce0 <strcpy@plt>
  402aa6:	89 ef                	mov    %ebp,%edi
  402aa8:	e8 a3 e2 ff ff       	callq  400d50 <close@plt>
  402aad:	0f b6 03             	movzbl (%rbx),%eax
  402ab0:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402ab5:	29 c2                	sub    %eax,%edx
  402ab7:	75 22                	jne    402adb <submitr+0x70f>
  402ab9:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402abd:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402ac2:	29 c8                	sub    %ecx,%eax
  402ac4:	75 17                	jne    402add <submitr+0x711>
  402ac6:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402aca:	b8 0a 00 00 00       	mov    $0xa,%eax
  402acf:	29 c8                	sub    %ecx,%eax
  402ad1:	75 0a                	jne    402add <submitr+0x711>
  402ad3:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402ad7:	f7 d8                	neg    %eax
  402ad9:	eb 02                	jmp    402add <submitr+0x711>
  402adb:	89 d0                	mov    %edx,%eax
  402add:	85 c0                	test   %eax,%eax
  402adf:	74 40                	je     402b21 <submitr+0x755>
  402ae1:	bf 60 37 40 00       	mov    $0x403760,%edi
  402ae6:	b9 05 00 00 00       	mov    $0x5,%ecx
  402aeb:	48 89 de             	mov    %rbx,%rsi
  402aee:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402af0:	0f 97 c0             	seta   %al
  402af3:	0f 92 c1             	setb   %cl
  402af6:	29 c8                	sub    %ecx,%eax
  402af8:	0f be c0             	movsbl %al,%eax
  402afb:	85 c0                	test   %eax,%eax
  402afd:	74 2e                	je     402b2d <submitr+0x761>
  402aff:	85 d2                	test   %edx,%edx
  402b01:	75 13                	jne    402b16 <submitr+0x74a>
  402b03:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402b07:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402b0c:	29 c2                	sub    %eax,%edx
  402b0e:	75 06                	jne    402b16 <submitr+0x74a>
  402b10:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402b14:	f7 da                	neg    %edx
  402b16:	85 d2                	test   %edx,%edx
  402b18:	75 0e                	jne    402b28 <submitr+0x75c>
  402b1a:	b8 00 00 00 00       	mov    $0x0,%eax
  402b1f:	eb 0c                	jmp    402b2d <submitr+0x761>
  402b21:	b8 00 00 00 00       	mov    $0x0,%eax
  402b26:	eb 05                	jmp    402b2d <submitr+0x761>
  402b28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b2d:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  402b34:	00 
  402b35:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402b3c:	00 00 
  402b3e:	74 05                	je     402b45 <submitr+0x779>
  402b40:	e8 cb e1 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402b45:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402b4c:	5b                   	pop    %rbx
  402b4d:	5d                   	pop    %rbp
  402b4e:	41 5c                	pop    %r12
  402b50:	41 5d                	pop    %r13
  402b52:	41 5e                	pop    %r14
  402b54:	41 5f                	pop    %r15
  402b56:	c3                   	retq   

0000000000402b57 <init_timeout>:
  402b57:	85 ff                	test   %edi,%edi
  402b59:	74 23                	je     402b7e <init_timeout+0x27>
  402b5b:	53                   	push   %rbx
  402b5c:	89 fb                	mov    %edi,%ebx
  402b5e:	85 ff                	test   %edi,%edi
  402b60:	79 05                	jns    402b67 <init_timeout+0x10>
  402b62:	bb 00 00 00 00       	mov    $0x0,%ebx
  402b67:	be 00 21 40 00       	mov    $0x402100,%esi
  402b6c:	bf 0e 00 00 00       	mov    $0xe,%edi
  402b71:	e8 0a e2 ff ff       	callq  400d80 <signal@plt>
  402b76:	89 df                	mov    %ebx,%edi
  402b78:	e8 c3 e1 ff ff       	callq  400d40 <alarm@plt>
  402b7d:	5b                   	pop    %rbx
  402b7e:	f3 c3                	repz retq 

0000000000402b80 <init_driver>:
  402b80:	55                   	push   %rbp
  402b81:	53                   	push   %rbx
  402b82:	48 83 ec 28          	sub    $0x28,%rsp
  402b86:	48 89 fd             	mov    %rdi,%rbp
  402b89:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402b90:	00 00 
  402b92:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402b97:	31 c0                	xor    %eax,%eax
  402b99:	be 01 00 00 00       	mov    $0x1,%esi
  402b9e:	bf 0d 00 00 00       	mov    $0xd,%edi
  402ba3:	e8 d8 e1 ff ff       	callq  400d80 <signal@plt>
  402ba8:	be 01 00 00 00       	mov    $0x1,%esi
  402bad:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402bb2:	e8 c9 e1 ff ff       	callq  400d80 <signal@plt>
  402bb7:	be 01 00 00 00       	mov    $0x1,%esi
  402bbc:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402bc1:	e8 ba e1 ff ff       	callq  400d80 <signal@plt>
  402bc6:	ba 00 00 00 00       	mov    $0x0,%edx
  402bcb:	be 01 00 00 00       	mov    $0x1,%esi
  402bd0:	bf 02 00 00 00       	mov    $0x2,%edi
  402bd5:	e8 d6 e2 ff ff       	callq  400eb0 <socket@plt>
  402bda:	85 c0                	test   %eax,%eax
  402bdc:	79 4f                	jns    402c2d <init_driver+0xad>
  402bde:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402be5:	3a 20 43 
  402be8:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402bec:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402bf3:	20 75 6e 
  402bf6:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402bfa:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402c01:	74 6f 20 
  402c04:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402c08:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402c0f:	65 20 73 
  402c12:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402c16:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402c1d:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402c23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c28:	e9 2a 01 00 00       	jmpq   402d57 <init_driver+0x1d7>
  402c2d:	89 c3                	mov    %eax,%ebx
  402c2f:	bf 85 32 40 00       	mov    $0x403285,%edi
  402c34:	e8 57 e1 ff ff       	callq  400d90 <gethostbyname@plt>
  402c39:	48 85 c0             	test   %rax,%rax
  402c3c:	75 68                	jne    402ca6 <init_driver+0x126>
  402c3e:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402c45:	3a 20 44 
  402c48:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402c4c:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402c53:	20 75 6e 
  402c56:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402c5a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402c61:	74 6f 20 
  402c64:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402c68:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402c6f:	76 65 20 
  402c72:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402c76:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402c7d:	72 20 61 
  402c80:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402c84:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402c8b:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402c91:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402c95:	89 df                	mov    %ebx,%edi
  402c97:	e8 b4 e0 ff ff       	callq  400d50 <close@plt>
  402c9c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ca1:	e9 b1 00 00 00       	jmpq   402d57 <init_driver+0x1d7>
  402ca6:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402cad:	00 
  402cae:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402cb5:	00 00 
  402cb7:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402cbd:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402cc1:	48 8b 40 18          	mov    0x18(%rax),%rax
  402cc5:	48 8b 30             	mov    (%rax),%rsi
  402cc8:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402ccd:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402cd2:	e8 c9 e0 ff ff       	callq  400da0 <__memmove_chk@plt>
  402cd7:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  402cde:	ba 10 00 00 00       	mov    $0x10,%edx
  402ce3:	48 89 e6             	mov    %rsp,%rsi
  402ce6:	89 df                	mov    %ebx,%edi
  402ce8:	e8 93 e1 ff ff       	callq  400e80 <connect@plt>
  402ced:	85 c0                	test   %eax,%eax
  402cef:	79 50                	jns    402d41 <init_driver+0x1c1>
  402cf1:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402cf8:	3a 20 55 
  402cfb:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402cff:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402d06:	20 74 6f 
  402d09:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402d0d:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402d14:	65 63 74 
  402d17:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402d1b:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402d22:	65 72 76 
  402d25:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402d29:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402d2f:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402d33:	89 df                	mov    %ebx,%edi
  402d35:	e8 16 e0 ff ff       	callq  400d50 <close@plt>
  402d3a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d3f:	eb 16                	jmp    402d57 <init_driver+0x1d7>
  402d41:	89 df                	mov    %ebx,%edi
  402d43:	e8 08 e0 ff ff       	callq  400d50 <close@plt>
  402d48:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402d4e:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402d52:	b8 00 00 00 00       	mov    $0x0,%eax
  402d57:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402d5c:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402d63:	00 00 
  402d65:	74 05                	je     402d6c <init_driver+0x1ec>
  402d67:	e8 a4 df ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402d6c:	48 83 c4 28          	add    $0x28,%rsp
  402d70:	5b                   	pop    %rbx
  402d71:	5d                   	pop    %rbp
  402d72:	c3                   	retq   

0000000000402d73 <driver_post>:
  402d73:	53                   	push   %rbx
  402d74:	4c 89 cb             	mov    %r9,%rbx
  402d77:	45 85 c0             	test   %r8d,%r8d
  402d7a:	74 27                	je     402da3 <driver_post+0x30>
  402d7c:	48 89 ca             	mov    %rcx,%rdx
  402d7f:	be 65 37 40 00       	mov    $0x403765,%esi
  402d84:	bf 01 00 00 00       	mov    $0x1,%edi
  402d89:	b8 00 00 00 00       	mov    $0x0,%eax
  402d8e:	e8 8d e0 ff ff       	callq  400e20 <__printf_chk@plt>
  402d93:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402d98:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402d9c:	b8 00 00 00 00       	mov    $0x0,%eax
  402da1:	eb 3f                	jmp    402de2 <driver_post+0x6f>
  402da3:	48 85 ff             	test   %rdi,%rdi
  402da6:	74 2c                	je     402dd4 <driver_post+0x61>
  402da8:	80 3f 00             	cmpb   $0x0,(%rdi)
  402dab:	74 27                	je     402dd4 <driver_post+0x61>
  402dad:	48 83 ec 08          	sub    $0x8,%rsp
  402db1:	41 51                	push   %r9
  402db3:	49 89 c9             	mov    %rcx,%r9
  402db6:	49 89 d0             	mov    %rdx,%r8
  402db9:	48 89 f9             	mov    %rdi,%rcx
  402dbc:	48 89 f2             	mov    %rsi,%rdx
  402dbf:	be 50 00 00 00       	mov    $0x50,%esi
  402dc4:	bf 85 32 40 00       	mov    $0x403285,%edi
  402dc9:	e8 fe f5 ff ff       	callq  4023cc <submitr>
  402dce:	48 83 c4 10          	add    $0x10,%rsp
  402dd2:	eb 0e                	jmp    402de2 <driver_post+0x6f>
  402dd4:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402dd9:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402ddd:	b8 00 00 00 00       	mov    $0x0,%eax
  402de2:	5b                   	pop    %rbx
  402de3:	c3                   	retq   

0000000000402de4 <check>:
  402de4:	89 f8                	mov    %edi,%eax
  402de6:	c1 e8 1c             	shr    $0x1c,%eax
  402de9:	85 c0                	test   %eax,%eax
  402deb:	74 1d                	je     402e0a <check+0x26>
  402ded:	b9 00 00 00 00       	mov    $0x0,%ecx
  402df2:	eb 0b                	jmp    402dff <check+0x1b>
  402df4:	89 f8                	mov    %edi,%eax
  402df6:	d3 e8                	shr    %cl,%eax
  402df8:	3c 0a                	cmp    $0xa,%al
  402dfa:	74 14                	je     402e10 <check+0x2c>
  402dfc:	83 c1 08             	add    $0x8,%ecx
  402dff:	83 f9 1f             	cmp    $0x1f,%ecx
  402e02:	7e f0                	jle    402df4 <check+0x10>
  402e04:	b8 01 00 00 00       	mov    $0x1,%eax
  402e09:	c3                   	retq   
  402e0a:	b8 00 00 00 00       	mov    $0x0,%eax
  402e0f:	c3                   	retq   
  402e10:	b8 00 00 00 00       	mov    $0x0,%eax
  402e15:	c3                   	retq   

0000000000402e16 <gencookie>:
  402e16:	53                   	push   %rbx
  402e17:	83 c7 01             	add    $0x1,%edi
  402e1a:	e8 a1 de ff ff       	callq  400cc0 <srandom@plt>
  402e1f:	e8 bc df ff ff       	callq  400de0 <random@plt>
  402e24:	89 c3                	mov    %eax,%ebx
  402e26:	89 c7                	mov    %eax,%edi
  402e28:	e8 b7 ff ff ff       	callq  402de4 <check>
  402e2d:	85 c0                	test   %eax,%eax
  402e2f:	74 ee                	je     402e1f <gencookie+0x9>
  402e31:	89 d8                	mov    %ebx,%eax
  402e33:	5b                   	pop    %rbx
  402e34:	c3                   	retq   
  402e35:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402e3c:	00 00 00 
  402e3f:	90                   	nop

0000000000402e40 <__libc_csu_init>:
  402e40:	41 57                	push   %r15
  402e42:	41 56                	push   %r14
  402e44:	41 89 ff             	mov    %edi,%r15d
  402e47:	41 55                	push   %r13
  402e49:	41 54                	push   %r12
  402e4b:	4c 8d 25 ae 1f 20 00 	lea    0x201fae(%rip),%r12        # 604e00 <__frame_dummy_init_array_entry>
  402e52:	55                   	push   %rbp
  402e53:	48 8d 2d ae 1f 20 00 	lea    0x201fae(%rip),%rbp        # 604e08 <__init_array_end>
  402e5a:	53                   	push   %rbx
  402e5b:	49 89 f6             	mov    %rsi,%r14
  402e5e:	49 89 d5             	mov    %rdx,%r13
  402e61:	4c 29 e5             	sub    %r12,%rbp
  402e64:	48 83 ec 08          	sub    $0x8,%rsp
  402e68:	48 c1 fd 03          	sar    $0x3,%rbp
  402e6c:	e8 f7 dd ff ff       	callq  400c68 <_init>
  402e71:	48 85 ed             	test   %rbp,%rbp
  402e74:	74 20                	je     402e96 <__libc_csu_init+0x56>
  402e76:	31 db                	xor    %ebx,%ebx
  402e78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402e7f:	00 
  402e80:	4c 89 ea             	mov    %r13,%rdx
  402e83:	4c 89 f6             	mov    %r14,%rsi
  402e86:	44 89 ff             	mov    %r15d,%edi
  402e89:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402e8d:	48 83 c3 01          	add    $0x1,%rbx
  402e91:	48 39 eb             	cmp    %rbp,%rbx
  402e94:	75 ea                	jne    402e80 <__libc_csu_init+0x40>
  402e96:	48 83 c4 08          	add    $0x8,%rsp
  402e9a:	5b                   	pop    %rbx
  402e9b:	5d                   	pop    %rbp
  402e9c:	41 5c                	pop    %r12
  402e9e:	41 5d                	pop    %r13
  402ea0:	41 5e                	pop    %r14
  402ea2:	41 5f                	pop    %r15
  402ea4:	c3                   	retq   
  402ea5:	90                   	nop
  402ea6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402ead:	00 00 00 

0000000000402eb0 <__libc_csu_fini>:
  402eb0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402eb4 <_fini>:
  402eb4:	48 83 ec 08          	sub    $0x8,%rsp
  402eb8:	48 83 c4 08          	add    $0x8,%rsp
  402ebc:	c3                   	retq   
