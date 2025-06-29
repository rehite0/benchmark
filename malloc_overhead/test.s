	.file	"test.c"
	.text
.Ltext0:
	.file 0 "/home/rh0/.git_repo/benchmark/malloc_overhead" "test.c"
	.globl	main
	.type	main, @function
main:
.LFB6:
	.file 1 "test.c"
	.loc 1 15 11
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 19 2
	movl	$8192, %edi
	call	test2
	movl	$0, %eax
	.loc 1 23 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC0:
	.string	"num allocated:%d\nsize:%lu\n"
	.text
	.globl	test
	.type	test, @function
test:
.LFB7:
	.loc 1 24 22
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8000048, %rsp
	movq	%rdi, -8000040(%rbp)
	.loc 1 24 22
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.LBB2:
	.loc 1 26 10
	movl	$0, -8000024(%rbp)
	.loc 1 26 2
	jmp	.L4
.L5:
	.loc 1 27 10
	movq	-8000040(%rbp), %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	.loc 1 27 9 discriminator 1
	movl	-8000024(%rbp), %eax
	cltq
	movq	%rdx, -8000016(%rbp,%rax,8)
	.loc 1 26 26 discriminator 3
	addl	$1, -8000024(%rbp)
.L4:
	.loc 1 26 15 discriminator 1
	cmpl	$999999, -8000024(%rbp)
	jle	.L5
.LBE2:
.LBB3:
	.loc 1 29 10
	movl	$0, -8000020(%rbp)
	.loc 1 29 2
	jmp	.L6
.L7:
	.loc 1 30 3
	movl	-8000020(%rbp), %eax
	cltq
	movq	-8000016(%rbp,%rax,8), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 29 26 discriminator 3
	addl	$1, -8000020(%rbp)
.L6:
	.loc 1 29 15 discriminator 1
	cmpl	$999999, -8000020(%rbp)
	jle	.L7
.LBE3:
	.loc 1 32 2
	movq	-8000040(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	movl	$1000000, %esi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 33 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L8
	call	__stack_chk_fail@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	test, .-test
	.section	.rodata
.LC1:
	.string	"test.c"
.LC2:
	.string	"top==0"
	.text
	.globl	test2
	.type	test2, @function
test2:
.LFB8:
	.loc 1 34 23
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8000064, %rsp
	movq	%rdi, -8000056(%rbp)
	.loc 1 34 23
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 36 8
	movq	$0, -8000032(%rbp)
	.loc 1 37 8
	movq	$0, -8000024(%rbp)
	.loc 1 38 5
	cmpq	$0, -8000032(%rbp)
	jne	.L10
	.loc 1 38 47 discriminator 1
	movq	-8000056(%rbp), %rax
	imulq	$1000000, %rax, %rax
	.loc 1 38 36 discriminator 1
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -8000032(%rbp)
.L10:
	.loc 1 40 2
	movl	$15, %edi
	call	sleep@PLT
.LBB4:
	.loc 1 41 10
	movl	$0, -8000040(%rbp)
	.loc 1 41 2
	jmp	.L11
.L12:
	.loc 1 42 17
	movq	-8000032(%rbp), %rdx
	movq	-8000024(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 42 9
	movl	-8000040(%rbp), %eax
	cltq
	movq	%rdx, -8000016(%rbp,%rax,8)
	.loc 1 43 14
	movl	-8000040(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	-8000016(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 43 17
	movl	$1, (%rax)
	.loc 1 44 6
	movq	-8000056(%rbp), %rax
	addq	%rax, -8000024(%rbp)
	.loc 1 41 26 discriminator 3
	addl	$1, -8000040(%rbp)
.L11:
	.loc 1 41 15 discriminator 1
	cmpl	$999999, -8000040(%rbp)
	jle	.L12
.LBE4:
.LBB5:
	.loc 1 46 10
	movl	$0, -8000036(%rbp)
	.loc 1 46 2
	jmp	.L13
.L14:
	.loc 1 47 6
	movq	-8000056(%rbp), %rax
	subq	%rax, -8000024(%rbp)
	.loc 1 46 26 discriminator 3
	addl	$1, -8000036(%rbp)
.L13:
	.loc 1 46 15 discriminator 1
	cmpl	$999999, -8000036(%rbp)
	jle	.L14
.LBE5:
	.loc 1 50 2
	cmpq	$0, -8000024(%rbp)
	je	.L15
	.loc 1 50 2 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.2(%rip), %rdx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rax
	movq	%rdx, %rcx
	movl	$50, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L15:
	.loc 1 51 2 is_stmt 1
	movq	-8000032(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 52 2
	movq	-8000056(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	movl	$1000000, %esi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 53 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	test2, .-test2
	.section	.rodata
	.align 8
.LC3:
	.string	"0==getrlimit(RLIMIT_STACK,&lim)"
	.align 8
.LC4:
	.string	"size*num_alloc-5000<lim.rlim_cur&&\"too big for stack allocation\""
	.text
	.globl	control
	.type	control, @function
control:
.LFB9:
	.loc 1 55 25
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8000064, %rsp
	movq	%rdi, -8000056(%rbp)
	.loc 1 55 25
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 58 2
	leaq	-8000032(%rbp), %rax
	movq	%rax, %rsi
	movl	$3, %edi
	call	getrlimit@PLT
	.loc 1 58 2 is_stmt 0 discriminator 1
	testl	%eax, %eax
	je	.L18
	.loc 1 58 2 discriminator 2
	leaq	__PRETTY_FUNCTION__.1(%rip), %rdx
	leaq	.LC1(%rip), %rsi
	leaq	.LC3(%rip), %rax
	movq	%rdx, %rcx
	movl	$58, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L18:
	.loc 1 59 2 is_stmt 1
	movq	-8000056(%rbp), %rax
	imulq	$1000000, %rax, %rax
	leaq	-5000(%rax), %rdx
	movq	-8000032(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L19
	.loc 1 59 2 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.1(%rip), %rdx
	leaq	.LC1(%rip), %rsi
	leaq	.LC4(%rip), %rax
	movq	%rdx, %rcx
	movl	$59, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L19:
.LBB6:
	.loc 1 62 10 is_stmt 1
	movl	$0, -8000040(%rbp)
	.loc 1 62 2
	jmp	.L20
.L21:
	.loc 1 63 10
	movq	-8000056(%rbp), %rax
	leaq	8(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	.loc 1 63 9 discriminator 1
	movl	-8000040(%rbp), %eax
	cltq
	movq	%rdx, -8000016(%rbp,%rax,8)
	.loc 1 62 26 discriminator 3
	addl	$1, -8000040(%rbp)
.L20:
	.loc 1 62 15 discriminator 1
	cmpl	$999999, -8000040(%rbp)
	jle	.L21
.LBE6:
.LBB7:
	.loc 1 66 10
	movl	$0, -8000036(%rbp)
	.loc 1 66 2
	jmp	.L22
.L23:
	.loc 1 66 26 discriminator 3
	addl	$1, -8000036(%rbp)
.L22:
	.loc 1 66 15 discriminator 1
	cmpl	$999999, -8000036(%rbp)
	jle	.L23
.LBE7:
	.loc 1 69 2
	movq	-8000056(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rax, %rdx
	movl	$1000000, %esi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 70 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	control, .-control
	.section	.rodata
.LC5:
	.string	"%lu\n"
	.text
	.globl	alloca_limit
	.type	alloca_limit, @function
alloca_limit:
.LFB10:
	.loc 1 71 20
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 71 20
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 73 10
	movq	i.0(%rip), %rax
	subq	$-128, %rax
	movq	%rax, i.0(%rip)
	movq	i.0(%rip), %rax
	leaq	8(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	movq	%rax, -16(%rbp)
	.loc 1 75 2
	movq	i.0(%rip), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 76 1
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	alloca_limit, .-alloca_limit
	.section	.rodata
	.type	__PRETTY_FUNCTION__.2, @object
	.size	__PRETTY_FUNCTION__.2, 6
__PRETTY_FUNCTION__.2:
	.string	"test2"
	.align 8
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 8
__PRETTY_FUNCTION__.1:
	.string	"control"
	.local	i.0
	.comm	i.0,8,8
	.text
.Letext0:
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/sys/types.h"
	.file 4 "/usr/include/bits/resource.h"
	.file 5 "/usr/include/sys/resource.h"
	.file 6 "/usr/include/assert.h"
	.file 7 "/usr/include/unistd.h"
	.file 8 "/usr/include/stdio.h"
	.file 9 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x481
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x11
	.long	.LASF49
	.byte	0x1d
	.byte	0x3
	.long	0x31647
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x12
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x13
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x5
	.long	.LASF11
	.byte	0x2
	.byte	0x9d
	.byte	0x1a
	.long	0x33
	.uleb128 0x7
	.long	0x7e
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x8
	.long	0x7e
	.uleb128 0x7
	.long	0x85
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF12
	.byte	0x3
	.byte	0x94
	.byte	0x1b
	.long	0x33
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF13
	.uleb128 0x14
	.long	.LASF50
	.byte	0x7
	.byte	0x4
	.long	0x3a
	.byte	0x4
	.byte	0x1f
	.byte	0x6
	.long	0x12e
	.uleb128 0x1
	.long	.LASF14
	.byte	0
	.uleb128 0x1
	.long	.LASF15
	.byte	0x1
	.uleb128 0x1
	.long	.LASF16
	.byte	0x2
	.uleb128 0x1
	.long	.LASF17
	.byte	0x3
	.uleb128 0x1
	.long	.LASF18
	.byte	0x4
	.uleb128 0x1
	.long	.LASF19
	.byte	0x5
	.uleb128 0x1
	.long	.LASF20
	.byte	0x7
	.uleb128 0x1
	.long	.LASF21
	.byte	0x7
	.uleb128 0x1
	.long	.LASF22
	.byte	0x9
	.uleb128 0x1
	.long	.LASF23
	.byte	0x6
	.uleb128 0x1
	.long	.LASF24
	.byte	0x8
	.uleb128 0x1
	.long	.LASF25
	.byte	0xa
	.uleb128 0x1
	.long	.LASF26
	.byte	0xb
	.uleb128 0x1
	.long	.LASF27
	.byte	0xc
	.uleb128 0x1
	.long	.LASF28
	.byte	0xd
	.uleb128 0x1
	.long	.LASF29
	.byte	0xe
	.uleb128 0x1
	.long	.LASF30
	.byte	0xf
	.uleb128 0x1
	.long	.LASF31
	.byte	0x10
	.uleb128 0x1
	.long	.LASF32
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.long	.LASF33
	.byte	0x4
	.byte	0x83
	.byte	0x12
	.long	0x6d
	.uleb128 0x15
	.long	.LASF51
	.byte	0x10
	.byte	0x4
	.byte	0x8b
	.byte	0x8
	.long	0x15e
	.uleb128 0xe
	.long	.LASF34
	.byte	0x8e
	.long	0x12e
	.byte	0
	.uleb128 0xe
	.long	.LASF35
	.byte	0x90
	.long	0x12e
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.long	.LASF36
	.byte	0x5
	.byte	0x2a
	.byte	0xd
	.long	0x5f
	.uleb128 0x16
	.long	.LASF37
	.byte	0x5
	.byte	0x32
	.byte	0xc
	.long	0x5f
	.long	0x185
	.uleb128 0x4
	.long	0x15e
	.uleb128 0x4
	.long	0x185
	.byte	0
	.uleb128 0x7
	.long	0x13a
	.uleb128 0x17
	.long	.LASF38
	.byte	0x6
	.byte	0x43
	.byte	0xd
	.long	0x1ab
	.uleb128 0x4
	.long	0x8a
	.uleb128 0x4
	.long	0x8a
	.uleb128 0x4
	.long	0x3a
	.uleb128 0x4
	.long	0x8a
	.byte	0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x7
	.value	0x1d0
	.byte	0x15
	.long	0x3a
	.long	0x1c2
	.uleb128 0x4
	.long	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x8
	.value	0x16b
	.byte	0xc
	.long	0x5f
	.long	0x1da
	.uleb128 0x4
	.long	0x8a
	.uleb128 0x18
	.byte	0
	.uleb128 0x19
	.long	.LASF52
	.byte	0x9
	.value	0x2af
	.byte	0xd
	.long	0x1ed
	.uleb128 0x4
	.long	0x41
	.byte	0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x9
	.value	0x2a0
	.byte	0xe
	.long	0x41
	.long	0x204
	.uleb128 0x4
	.long	0x33
	.byte	0
	.uleb128 0x6
	.long	.LASF42
	.byte	0x47
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x240
	.uleb128 0x2
	.string	"i"
	.byte	0x48
	.byte	0xf
	.long	0x96
	.uleb128 0x9
	.byte	0x3
	.quad	i.0
	.uleb128 0x2
	.string	"a"
	.byte	0x49
	.byte	0x8
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.long	.LASF43
	.byte	0x37
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x2e9
	.uleb128 0xa
	.long	.LASF45
	.byte	0x37
	.byte	0x14
	.long	0x96
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000072
	.uleb128 0x2
	.string	"lim"
	.byte	0x39
	.byte	0x10
	.long	0x13a
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000048
	.uleb128 0xf
	.long	.LASF47
	.long	0x2f9
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.1
	.uleb128 0x2
	.string	"arr"
	.byte	0x3d
	.byte	0x8
	.long	0x2fe
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000032
	.uleb128 0xb
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x2c7
	.uleb128 0x2
	.string	"i"
	.byte	0x3e
	.byte	0xa
	.long	0x5f
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000056
	.byte	0
	.uleb128 0xc
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0x2
	.string	"i"
	.byte	0x42
	.byte	0xa
	.long	0x5f
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000052
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x85
	.long	0x2f9
	.uleb128 0x10
	.long	0x33
	.byte	0x7
	.byte	0
	.uleb128 0x8
	.long	0x2e9
	.uleb128 0xd
	.long	0x41
	.long	0x311
	.uleb128 0x1a
	.long	0x33
	.long	0xf423f
	.byte	0
	.uleb128 0x6
	.long	.LASF44
	.byte	0x22
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x3cc
	.uleb128 0xa
	.long	.LASF45
	.byte	0x22
	.byte	0x12
	.long	0x96
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000072
	.uleb128 0x1b
	.long	.LASF46
	.byte	0x1
	.byte	0x24
	.byte	0x8
	.long	0x79
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000048
	.uleb128 0x2
	.string	"top"
	.byte	0x25
	.byte	0x8
	.long	0x96
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000040
	.uleb128 0x2
	.string	"arr"
	.byte	0x27
	.byte	0x8
	.long	0x2fe
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000032
	.uleb128 0xf
	.long	.LASF47
	.long	0x3dc
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.2
	.uleb128 0xb
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x3aa
	.uleb128 0x2
	.string	"i"
	.byte	0x29
	.byte	0xa
	.long	0x5f
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000056
	.byte	0
	.uleb128 0xc
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x2
	.string	"i"
	.byte	0x2e
	.byte	0xa
	.long	0x5f
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000052
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x85
	.long	0x3dc
	.uleb128 0x10
	.long	0x33
	.byte	0x5
	.byte	0
	.uleb128 0x8
	.long	0x3cc
	.uleb128 0x6
	.long	.LASF48
	.byte	0x18
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x466
	.uleb128 0xa
	.long	.LASF45
	.byte	0x18
	.byte	0x11
	.long	0x96
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000056
	.uleb128 0x2
	.string	"arr"
	.byte	0x19
	.byte	0x8
	.long	0x2fe
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000032
	.uleb128 0xb
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x444
	.uleb128 0x2
	.string	"i"
	.byte	0x1a
	.byte	0xa
	.long	0x5f
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000040
	.byte	0
	.uleb128 0xc
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x2
	.string	"i"
	.byte	0x1d
	.byte	0xa
	.long	0x5f
	.uleb128 0x5
	.byte	0x91
	.sleb128 -8000036
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LASF53
	.byte	0x1
	.byte	0xf
	.byte	0x5
	.long	0x5f
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x90
	.uleb128 0xb
	.uleb128 0x91
	.uleb128 0x6
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF26:
	.string	"__RLIMIT_SIGPENDING"
.LASF46:
	.string	"mempool"
.LASF38:
	.string	"__assert_fail"
.LASF17:
	.string	"RLIMIT_STACK"
.LASF24:
	.string	"__RLIMIT_MEMLOCK"
.LASF5:
	.string	"short unsigned int"
.LASF23:
	.string	"__RLIMIT_NPROC"
.LASF20:
	.string	"RLIMIT_NOFILE"
.LASF16:
	.string	"RLIMIT_DATA"
.LASF28:
	.string	"__RLIMIT_NICE"
.LASF36:
	.string	"__rlimit_resource_t"
.LASF47:
	.string	"__PRETTY_FUNCTION__"
.LASF25:
	.string	"__RLIMIT_LOCKS"
.LASF45:
	.string	"size"
.LASF35:
	.string	"rlim_max"
.LASF19:
	.string	"__RLIMIT_RSS"
.LASF32:
	.string	"__RLIM_NLIMITS"
.LASF2:
	.string	"long unsigned int"
.LASF34:
	.string	"rlim_cur"
.LASF11:
	.string	"__rlim_t"
.LASF43:
	.string	"control"
.LASF12:
	.string	"ulong"
.LASF4:
	.string	"unsigned char"
.LASF37:
	.string	"getrlimit"
.LASF21:
	.string	"__RLIMIT_OFILE"
.LASF14:
	.string	"RLIMIT_CPU"
.LASF27:
	.string	"__RLIMIT_MSGQUEUE"
.LASF53:
	.string	"main"
.LASF15:
	.string	"RLIMIT_FSIZE"
.LASF48:
	.string	"test"
.LASF3:
	.string	"unsigned int"
.LASF33:
	.string	"rlim_t"
.LASF49:
	.string	"GNU C23 15.1.1 20250425 -mtune=generic -march=x86-64 -ggdb"
.LASF13:
	.string	"long long unsigned int"
.LASF31:
	.string	"__RLIMIT_NLIMITS"
.LASF22:
	.string	"RLIMIT_AS"
.LASF52:
	.string	"free"
.LASF10:
	.string	"long long int"
.LASF50:
	.string	"__rlimit_resource"
.LASF42:
	.string	"alloca_limit"
.LASF40:
	.string	"printf"
.LASF29:
	.string	"__RLIMIT_RTPRIO"
.LASF7:
	.string	"short int"
.LASF30:
	.string	"__RLIMIT_RTTIME"
.LASF18:
	.string	"RLIMIT_CORE"
.LASF51:
	.string	"rlimit"
.LASF8:
	.string	"long int"
.LASF9:
	.string	"char"
.LASF6:
	.string	"signed char"
.LASF39:
	.string	"sleep"
.LASF44:
	.string	"test2"
.LASF41:
	.string	"malloc"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"test.c"
.LASF1:
	.string	"/home/rh0/.git_repo/benchmark/malloc_overhead"
	.ident	"GCC: (GNU) 15.1.1 20250425"
	.section	.note.GNU-stack,"",@progbits
