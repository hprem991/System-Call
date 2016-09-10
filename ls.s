	.file	"ls.c"
	.text
.Ltext0:
	.globl	fmtname
	.type	fmtname, @function
fmtname:
.LFB0:
	.file 1 "ls.c"
	.loc 1 8 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	.loc 1 13 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	strlen
.LVL1:
	addl	$16, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -12(%ebp)
.LVL2:
	jmp	.L2
.LVL3:
.L4:
	.loc 1 13 0 is_stmt 0 discriminator 4
	subl	$1, -12(%ebp)
.LVL4:
.L2:
	.loc 1 13 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jb	.L3
	.loc 1 13 0 discriminator 3
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jne	.L4
.L3:
	.loc 1 15 0 is_stmt 1
	addl	$1, -12(%ebp)
.LVL5:
	.loc 1 18 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	strlen
.LVL6:
	addl	$16, %esp
	cmpl	$13, %eax
	jbe	.L5
	.loc 1 19 0
	movl	-12(%ebp), %eax
	jmp	.L6
.L5:
	.loc 1 20 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	strlen
.LVL7:
	addl	$16, %esp
	subl	$4, %esp
	pushl	%eax
	pushl	-12(%ebp)
	pushl	$buf.1324
	call	memmove
.LVL8:
	addl	$16, %esp
	.loc 1 21 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	strlen
.LVL9:
	addl	$16, %esp
	movl	$14, %edx
	movl	%edx, %ebx
	subl	%eax, %ebx
	subl	$12, %esp
	pushl	-12(%ebp)
	call	strlen
.LVL10:
	addl	$16, %esp
	addl	$buf.1324, %eax
	subl	$4, %esp
	pushl	%ebx
	pushl	$32
	pushl	%eax
	call	memset
.LVL11:
	addl	$16, %esp
	.loc 1 22 0
	movl	$buf.1324, %eax
.L6:
	.loc 1 23 0
	movl	-4(%ebp), %ebx
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	fmtname, .-fmtname
	.section	.rodata
.LC0:
	.string	"ls: cannot open %s\n"
.LC1:
	.string	"ls: cannot stat %s\n"
.LC2:
	.string	"%s %d %d %d\n"
.LC3:
	.string	"ls: path too long\n"
	.text
	.globl	ls
	.type	ls, @function
ls:
.LFB1:
	.loc 1 27 0
	.cfi_startproc
.LVL12:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$572, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 33 0
	subl	$8, %esp
	pushl	$0
	pushl	8(%ebp)
	call	open
.LVL13:
	addl	$16, %esp
	movl	%eax, -28(%ebp)
.LVL14:
	cmpl	$0, -28(%ebp)
	jns	.L8
	.loc 1 34 0
	subl	$4, %esp
	pushl	8(%ebp)
	pushl	$.LC0
	pushl	$2
	call	printf
.LVL15:
	addl	$16, %esp
	.loc 1 35 0
	jmp	.L7
.LVL16:
.L8:
	.loc 1 38 0
	subl	$8, %esp
	leal	-580(%ebp), %eax
.LVL17:
	pushl	%eax
	pushl	-28(%ebp)
	call	fstat
.LVL18:
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L10
	.loc 1 39 0
	subl	$4, %esp
	pushl	8(%ebp)
	pushl	$.LC1
	pushl	$2
	call	printf
.LVL19:
	addl	$16, %esp
	.loc 1 40 0
	subl	$12, %esp
	pushl	-28(%ebp)
	call	close
.LVL20:
	addl	$16, %esp
	.loc 1 41 0
	jmp	.L7
.L10:
	.loc 1 44 0
	movzwl	-580(%ebp), %eax
	cwtl
	cmpl	$1, %eax
	je	.L12
	cmpl	$2, %eax
	jne	.L11
	.loc 1 46 0
	movl	-564(%ebp), %edi
	movl	-572(%ebp), %esi
	movzwl	-580(%ebp), %eax
	movswl	%ax, %ebx
	subl	$12, %esp
	pushl	8(%ebp)
	call	fmtname
.LVL21:
	addl	$16, %esp
	subl	$8, %esp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%eax
	pushl	$.LC2
	pushl	$1
	call	printf
.LVL22:
	addl	$32, %esp
	.loc 1 47 0
	jmp	.L11
.L12:
	.loc 1 50 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	strlen
.LVL23:
	addl	$16, %esp
	addl	$16, %eax
	cmpl	$512, %eax
	jbe	.L14
	.loc 1 51 0
	subl	$8, %esp
	pushl	$.LC3
	pushl	$1
	call	printf
.LVL24:
	addl	$16, %esp
	.loc 1 52 0
	jmp	.L11
.L14:
	.loc 1 54 0
	subl	$8, %esp
	pushl	8(%ebp)
	leal	-544(%ebp), %eax
	pushl	%eax
	call	strcpy
.LVL25:
	addl	$16, %esp
	.loc 1 55 0
	subl	$12, %esp
	leal	-544(%ebp), %eax
	pushl	%eax
	call	strlen
.LVL26:
	addl	$16, %esp
	movl	%eax, %edx
	leal	-544(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -32(%ebp)
.LVL27:
	.loc 1 56 0
	movl	-32(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -32(%ebp)
.LVL28:
	movb	$47, (%eax)
	.loc 1 57 0
	jmp	.L15
.LVL29:
.L18:
	.loc 1 58 0
	movzwl	-560(%ebp), %eax
	testw	%ax, %ax
	jne	.L16
	.loc 1 59 0
	jmp	.L15
.L16:
	.loc 1 60 0
	subl	$4, %esp
	pushl	$14
	leal	-560(%ebp), %eax
	addl	$2, %eax
	pushl	%eax
	pushl	-32(%ebp)
	call	memmove
.LVL30:
	addl	$16, %esp
	.loc 1 61 0
	movl	-32(%ebp), %eax
	addl	$14, %eax
	movb	$0, (%eax)
	.loc 1 62 0
	subl	$8, %esp
	leal	-580(%ebp), %eax
	pushl	%eax
	leal	-544(%ebp), %eax
	pushl	%eax
	call	stat
.LVL31:
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L17
	.loc 1 63 0
	subl	$4, %esp
	leal	-544(%ebp), %eax
	pushl	%eax
	pushl	$.LC1
	pushl	$1
	call	printf
.LVL32:
	addl	$16, %esp
	.loc 1 64 0
	jmp	.L15
.L17:
	.loc 1 66 0
	movl	-564(%ebp), %edi
	movl	-572(%ebp), %esi
	movzwl	-580(%ebp), %eax
	movswl	%ax, %ebx
	subl	$12, %esp
	leal	-544(%ebp), %eax
	pushl	%eax
	call	fmtname
.LVL33:
	addl	$16, %esp
	subl	$8, %esp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%eax
	pushl	$.LC2
	pushl	$1
	call	printf
.LVL34:
	addl	$32, %esp
.L15:
	.loc 1 57 0
	subl	$4, %esp
	pushl	$16
	leal	-560(%ebp), %eax
	pushl	%eax
	pushl	-28(%ebp)
	call	read
.LVL35:
	addl	$16, %esp
	cmpl	$16, %eax
	je	.L18
	.loc 1 68 0
	nop
.LVL36:
.L11:
	.loc 1 70 0 discriminator 1
	subl	$12, %esp
	pushl	-28(%ebp)
	call	close
.LVL37:
	addl	$16, %esp
.L7:
	.loc 1 71 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	ls, .-ls
	.section	.rodata
.LC4:
	.string	"."
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.loc 1 75 0
	.cfi_startproc
.LVL38:
	leal	4(%esp), %ecx
.LCFI6:
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
.LCFI7:
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$16, %esp
	movl	%ecx, %ebx
	.loc 1 78 0
	cmpl	$1, (%ebx)
	jg	.L21
	.loc 1 79 0
	subl	$12, %esp
	pushl	$.LC4
	call	ls
.LVL39:
	addl	$16, %esp
	.loc 1 80 0
	call	exit
.LVL40:
.L21:
	.loc 1 82 0
	movl	$1, -12(%ebp)
.LVL41:
	jmp	.L22
.LVL42:
.L23:
	.loc 1 83 0 discriminator 3
	movl	-12(%ebp), %eax
.LVL43:
	leal	0(,%eax,4), %edx
	movl	4(%ebx), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
.LVL44:
	call	ls
.LVL45:
	addl	$16, %esp
	.loc 1 82 0 discriminator 3
	addl	$1, -12(%ebp)
.LVL46:
.L22:
	.loc 1 82 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	(%ebx), %eax
	jl	.L23
	.loc 1 84 0 is_stmt 1
	call	exit
.LVL47:
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.local	buf.1324
	.comm	buf.1324,15,4
.Letext0:
	.file 2 "stat.h"
	.file 3 "fs.h"
	.file 4 "user.h"
	.file 5 "types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3ac
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF28
	.byte	0xc
	.long	.LASF29
	.long	.LASF30
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF31
	.byte	0x5
	.byte	0x1
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x4
	.long	.LASF8
	.byte	0x14
	.byte	0x2
	.byte	0x5
	.long	0x98
	.uleb128 0x5
	.long	.LASF3
	.byte	0x2
	.byte	0x6
	.long	0x98
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"dev"
	.byte	0x2
	.byte	0x7
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ino"
	.byte	0x2
	.byte	0x8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF4
	.byte	0x2
	.byte	0x9
	.long	0x98
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF5
	.byte	0x2
	.byte	0xa
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF6
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x4
	.long	.LASF9
	.byte	0x10
	.byte	0x3
	.byte	0x34
	.long	0xd6
	.uleb128 0x5
	.long	.LASF10
	.byte	0x3
	.byte	0x35
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF11
	.byte	0x3
	.byte	0x36
	.long	0xd6
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0x8
	.long	0xe6
	.long	0xe6
	.uleb128 0x9
	.long	0xa6
	.byte	0xd
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0xa
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.long	0x177
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x177
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.byte	0x7
	.long	0x177
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xc
	.string	"buf"
	.byte	0x1
	.byte	0x9
	.long	0x17d
	.byte	0x5
	.byte	0x3
	.long	buf.1324
	.uleb128 0xd
	.string	"p"
	.byte	0x1
	.byte	0xa
	.long	0x177
	.long	.LLST1
	.uleb128 0xe
	.long	.LVL1
	.long	0x320
	.uleb128 0xe
	.long	.LVL6
	.long	0x320
	.uleb128 0xe
	.long	.LVL7
	.long	0x320
	.uleb128 0xe
	.long	.LVL8
	.long	0x32d
	.uleb128 0xe
	.long	.LVL9
	.long	0x320
	.uleb128 0xe
	.long	.LVL10
	.long	0x320
	.uleb128 0xe
	.long	.LVL11
	.long	0x33a
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.long	0xe6
	.uleb128 0x8
	.long	0xe6
	.long	0x18d
	.uleb128 0x9
	.long	0xa6
	.byte	0xe
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.string	"ls"
	.byte	0x1
	.byte	0x1a
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST2
	.byte	0x1
	.long	0x29d
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.byte	0x1a
	.long	0x177
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xc
	.string	"buf"
	.byte	0x1
	.byte	0x1c
	.long	0x29d
	.byte	0x3
	.byte	0x91
	.sleb128 -552
	.uleb128 0xd
	.string	"p"
	.byte	0x1
	.byte	0x1c
	.long	0x177
	.long	.LLST3
	.uleb128 0xd
	.string	"fd"
	.byte	0x1
	.byte	0x1d
	.long	0x9f
	.long	.LLST4
	.uleb128 0xc
	.string	"de"
	.byte	0x1
	.byte	0x1e
	.long	0xad
	.byte	0x3
	.byte	0x91
	.sleb128 -568
	.uleb128 0xc
	.string	"st"
	.byte	0x1
	.byte	0x1f
	.long	0x45
	.byte	0x3
	.byte	0x91
	.sleb128 -588
	.uleb128 0xe
	.long	.LVL13
	.long	0x347
	.uleb128 0xe
	.long	.LVL15
	.long	0x354
	.uleb128 0xe
	.long	.LVL18
	.long	0x361
	.uleb128 0xe
	.long	.LVL19
	.long	0x354
	.uleb128 0xe
	.long	.LVL20
	.long	0x36e
	.uleb128 0xe
	.long	.LVL21
	.long	0xed
	.uleb128 0xe
	.long	.LVL22
	.long	0x354
	.uleb128 0xe
	.long	.LVL23
	.long	0x320
	.uleb128 0xe
	.long	.LVL24
	.long	0x354
	.uleb128 0xe
	.long	.LVL25
	.long	0x37b
	.uleb128 0xe
	.long	.LVL26
	.long	0x320
	.uleb128 0xe
	.long	.LVL30
	.long	0x32d
	.uleb128 0xe
	.long	.LVL31
	.long	0x388
	.uleb128 0xe
	.long	.LVL32
	.long	0x354
	.uleb128 0xe
	.long	.LVL33
	.long	0xed
	.uleb128 0xe
	.long	.LVL34
	.long	0x354
	.uleb128 0xe
	.long	.LVL35
	.long	0x395
	.uleb128 0xe
	.long	.LVL37
	.long	0x36e
	.byte	0
	.uleb128 0x8
	.long	0xe6
	.long	0x2ae
	.uleb128 0x11
	.long	0xa6
	.value	0x1ff
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0x4a
	.byte	0x1
	.long	0x9f
	.long	.LFB2
	.long	.LFE2
	.long	.LLST5
	.byte	0x1
	.long	0x31a
	.uleb128 0xb
	.long	.LASF16
	.byte	0x1
	.byte	0x4a
	.long	0x9f
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.long	.LASF17
	.byte	0x1
	.byte	0x4a
	.long	0x31a
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xd
	.string	"i"
	.byte	0x1
	.byte	0x4c
	.long	0x9f
	.long	.LLST6
	.uleb128 0xe
	.long	.LVL39
	.long	0x18d
	.uleb128 0xe
	.long	.LVL40
	.long	0x3a2
	.uleb128 0xe
	.long	.LVL45
	.long	0x18d
	.uleb128 0xe
	.long	.LVL47
	.long	0x3a2
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.long	0x177
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF18
	.long	.LASF18
	.byte	0x4
	.byte	0x90
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF19
	.long	.LASF19
	.byte	0x4
	.byte	0x8b
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF20
	.long	.LASF20
	.byte	0x4
	.byte	0x91
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF21
	.long	.LASF21
	.byte	0x4
	.byte	0x10
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF22
	.long	.LASF22
	.byte	0x4
	.byte	0x8e
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF23
	.long	.LASF23
	.byte	0x4
	.byte	0x13
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF24
	.long	.LASF24
	.byte	0x4
	.byte	0xd
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF25
	.long	.LASF25
	.byte	0x4
	.byte	0x8a
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF8
	.long	.LASF8
	.byte	0x4
	.byte	0x89
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF26
	.long	.LASF26
	.byte	0x4
	.byte	0xc
	.uleb128 0x12
	.byte	0x1
	.byte	0x1
	.long	.LASF27
	.long	.LASF27
	.byte	0x4
	.byte	0x8
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB0-.Ltext0
	.long	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI0-.Ltext0
	.long	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI1-.Ltext0
	.long	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI2-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL3-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST2:
	.long	.LFB1-.Ltext0
	.long	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI3-.Ltext0
	.long	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI4-.Ltext0
	.long	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI5-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LVL27-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL29-.Ltext0
	.long	.LVL36-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	0
	.long	0
.LLST4:
	.long	.LVL14-.Ltext0
	.long	.LVL15-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL15-1-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL17-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST5:
	.long	.LFB2-.Ltext0
	.long	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI6-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x71
	.sleb128 0
	.long	.LCFI7-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -8
	.byte	0x6
	.long	0
	.long	0
.LLST6:
	.long	.LVL41-.Ltext0
	.long	.LVL42-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL42-.Ltext0
	.long	.LVL43-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL43-.Ltext0
	.long	.LVL44-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL46-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF21:
	.string	"open"
.LASF19:
	.string	"memmove"
.LASF8:
	.string	"stat"
.LASF9:
	.string	"dirent"
.LASF14:
	.string	"fmtname"
.LASF18:
	.string	"strlen"
.LASF27:
	.string	"exit"
.LASF29:
	.string	"ls.c"
.LASF2:
	.string	"unsigned char"
.LASF25:
	.string	"strcpy"
.LASF1:
	.string	"short unsigned int"
.LASF20:
	.string	"memset"
.LASF10:
	.string	"inum"
.LASF30:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF26:
	.string	"read"
.LASF31:
	.string	"uint"
.LASF15:
	.string	"main"
.LASF0:
	.string	"unsigned int"
.LASF12:
	.string	"char"
.LASF23:
	.string	"fstat"
.LASF16:
	.string	"argc"
.LASF7:
	.string	"sizetype"
.LASF28:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF11:
	.string	"name"
.LASF22:
	.string	"printf"
.LASF3:
	.string	"type"
.LASF6:
	.string	"short int"
.LASF17:
	.string	"argv"
.LASF13:
	.string	"path"
.LASF24:
	.string	"close"
.LASF4:
	.string	"nlink"
.LASF5:
	.string	"size"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
