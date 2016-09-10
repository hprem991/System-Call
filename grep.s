	.file	"grep.c"
	.text
.Ltext0:
	.comm	buf,1024,32
	.globl	grep
	.type	grep, @function
grep:
.LFB0:
	.file 1 "grep.c"
	.loc 1 12 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 16 0
	movl	$0, -12(%ebp)
.LVL1:
	.loc 1 17 0
	jmp	.L2
.LVL2:
.L7:
	.loc 1 18 0
	movl	-20(%ebp), %eax
.LVL3:
	addl	%eax, -12(%ebp)
	.loc 1 19 0
	movl	-12(%ebp), %eax
	addl	$buf, %eax
	movb	$0, (%eax)
	.loc 1 20 0
	movl	$buf, -16(%ebp)
.LVL4:
	.loc 1 21 0
	jmp	.L3
.LVL5:
.L5:
	.loc 1 22 0
	movl	-24(%ebp), %eax
.LVL6:
	movb	$0, (%eax)
	.loc 1 23 0
	subl	$8, %esp
	pushl	-16(%ebp)
	pushl	8(%ebp)
	call	match
.LVL7:
	addl	$16, %esp
	testl	%eax, %eax
	je	.L4
	.loc 1 24 0
	movl	-24(%ebp), %eax
	movb	$10, (%eax)
	.loc 1 25 0
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	-16(%ebp)
	pushl	$1
	call	write
.LVL8:
	addl	$16, %esp
.L4:
	.loc 1 27 0
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
.LVL9:
.L3:
	.loc 1 21 0
	subl	$8, %esp
	pushl	$10
	pushl	-16(%ebp)
	call	strchr
.LVL10:
	addl	$16, %esp
	movl	%eax, -24(%ebp)
.LVL11:
	cmpl	$0, -24(%ebp)
	jne	.L5
	.loc 1 29 0
	cmpl	$buf, -16(%ebp)
	jne	.L6
	.loc 1 30 0
	movl	$0, -12(%ebp)
.L6:
	.loc 1 31 0
	cmpl	$0, -12(%ebp)
	jle	.L2
	.loc 1 32 0
	movl	-16(%ebp), %eax
.LVL12:
	movl	$buf, %edx
	subl	%edx, %eax
	subl	%eax, -12(%ebp)
.LVL13:
	.loc 1 33 0
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	-16(%ebp)
	pushl	$buf
	call	memmove
.LVL14:
	addl	$16, %esp
.LVL15:
.L2:
	.loc 1 17 0
	movl	-12(%ebp), %eax
	movl	$1023, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	$buf, %eax
	subl	$4, %esp
	pushl	%edx
	pushl	%eax
	pushl	12(%ebp)
	call	read
.LVL16:
	addl	$16, %esp
	movl	%eax, -20(%ebp)
.LVL17:
	cmpl	$0, -20(%ebp)
	jg	.L7
	.loc 1 36 0
	nop
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	grep, .-grep
	.section	.rodata
	.align 4
.LC0:
	.string	"usage: grep pattern [file ...]\n"
.LC1:
	.string	"grep: cannot open %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 40 0
	.cfi_startproc
.LVL18:
	leal	4(%esp), %ecx
.LCFI3:
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
.LCFI4:
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$16, %esp
	movl	%ecx, %ebx
	.loc 1 44 0
	cmpl	$1, (%ebx)
	jg	.L9
	.loc 1 45 0
	subl	$8, %esp
	pushl	$.LC0
	pushl	$2
	call	printf
.LVL19:
	addl	$16, %esp
	.loc 1 46 0
	call	exit
.LVL20:
.L9:
	.loc 1 48 0
	movl	4(%ebx), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
.LVL21:
	.loc 1 50 0
	cmpl	$2, (%ebx)
	jg	.L10
	.loc 1 51 0
	subl	$8, %esp
	pushl	$0
	pushl	-16(%ebp)
	call	grep
.LVL22:
	addl	$16, %esp
	.loc 1 52 0
	call	exit
.LVL23:
.L10:
	.loc 1 55 0
	movl	$2, -12(%ebp)
.LVL24:
	jmp	.L11
.LVL25:
.L13:
	.loc 1 56 0
	movl	-12(%ebp), %eax
.LVL26:
	leal	0(,%eax,4), %edx
	movl	4(%ebx), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	$0
.LVL27:
	pushl	%eax
	call	open
.LVL28:
	addl	$16, %esp
	movl	%eax, -20(%ebp)
.LVL29:
	cmpl	$0, -20(%ebp)
	jns	.L12
	.loc 1 57 0
	movl	-12(%ebp), %eax
.LVL30:
	leal	0(,%eax,4), %edx
	movl	4(%ebx), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
.LVL31:
	pushl	$.LC1
	pushl	$1
	call	printf
.LVL32:
	addl	$16, %esp
	.loc 1 58 0
	call	exit
.LVL33:
.L12:
	.loc 1 60 0 discriminator 2
	subl	$8, %esp
	pushl	-20(%ebp)
	pushl	-16(%ebp)
	call	grep
.LVL34:
	addl	$16, %esp
	.loc 1 61 0 discriminator 2
	subl	$12, %esp
	pushl	-20(%ebp)
	call	close
.LVL35:
	addl	$16, %esp
	.loc 1 55 0 discriminator 2
	addl	$1, -12(%ebp)
.LVL36:
.L11:
	.loc 1 55 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	(%ebx), %eax
	jl	.L13
	.loc 1 63 0 is_stmt 1
	call	exit
.LVL37:
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	match
	.type	match, @function
match:
.LFB2:
	.loc 1 74 0
	.cfi_startproc
.LVL38:
	pushl	%ebp
.LCFI5:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI6:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 75 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$94, %al
	jne	.L15
	.loc 1 76 0
	movl	8(%ebp), %eax
	addl	$1, %eax
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	%eax
	call	matchhere
.LVL39:
	addl	$16, %esp
	jmp	.L16
.L15:
	.loc 1 78 0
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	matchhere
.LVL40:
	addl	$16, %esp
	testl	%eax, %eax
	je	.L17
	.loc 1 79 0
	movl	$1, %eax
	jmp	.L16
.L17:
	.loc 1 80 0
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 12(%ebp)
.LVL41:
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L15
	.loc 1 81 0
	movl	$0, %eax
.LVL42:
.L16:
	.loc 1 82 0
	leave
.LCFI7:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	match, .-match
	.globl	matchhere
	.type	matchhere, @function
matchhere:
.LFB3:
	.loc 1 86 0
	.cfi_startproc
.LVL43:
	pushl	%ebp
.LCFI8:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI9:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 87 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L19
	.loc 1 88 0
	movl	$1, %eax
	jmp	.L20
.L19:
	.loc 1 89 0
	movl	8(%ebp), %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	cmpb	$42, %al
	jne	.L21
	.loc 1 90 0
	movl	8(%ebp), %eax
	leal	2(%eax), %edx
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	%edx
	pushl	%eax
	call	matchstar
.LVL44:
	addl	$16, %esp
	jmp	.L20
.L21:
	.loc 1 91 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$36, %al
	jne	.L22
	.loc 1 91 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L22
	.loc 1 92 0 is_stmt 1
	movl	12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L20
.L22:
	.loc 1 93 0
	movl	12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	.L23
	.loc 1 93 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$46, %al
	je	.L24
	.loc 1 93 0 discriminator 2
	movl	8(%ebp), %eax
	movzbl	(%eax), %edx
	movl	12(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L23
.L24:
	.loc 1 94 0 is_stmt 1
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	addl	$1, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	matchhere
.LVL45:
	addl	$16, %esp
	jmp	.L20
.L23:
	.loc 1 95 0
	movl	$0, %eax
.L20:
	.loc 1 96 0
	leave
.LCFI10:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	matchhere, .-matchhere
	.globl	matchstar
	.type	matchstar, @function
matchstar:
.LFB4:
	.loc 1 100 0
	.cfi_startproc
.LVL46:
	pushl	%ebp
.LCFI11:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI12:
	.cfi_def_cfa_register 5
	subl	$8, %esp
.L29:
	.loc 1 102 0
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	12(%ebp)
	call	matchhere
.LVL47:
	addl	$16, %esp
	testl	%eax, %eax
	je	.L26
	.loc 1 103 0
	movl	$1, %eax
	jmp	.L27
.L26:
	.loc 1 104 0
	movl	16(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	.L28
	.loc 1 104 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 16(%ebp)
.LVL48:
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	cmpl	8(%ebp), %eax
	je	.L29
	.loc 1 104 0 discriminator 2
	cmpl	$46, 8(%ebp)
	je	.L29
.LVL49:
.L28:
	.loc 1 105 0 is_stmt 1
	movl	$0, %eax
.L27:
	.loc 1 106 0
	leave
.LCFI13:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	matchstar, .-matchstar
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x328
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF22
	.byte	0xc
	.long	.LASF23
	.long	.LASF24
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.byte	0x1
	.long	.LASF25
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xde
	.uleb128 0x5
	.long	.LASF4
	.byte	0x1
	.byte	0xb
	.long	0xde
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"fd"
	.byte	0x1
	.byte	0xb
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.string	"n"
	.byte	0x1
	.byte	0xd
	.long	0x41
	.long	.LLST1
	.uleb128 0x8
	.string	"m"
	.byte	0x1
	.byte	0xd
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.string	"p"
	.byte	0x1
	.byte	0xe
	.long	0xde
	.long	.LLST2
	.uleb128 0x7
	.string	"q"
	.byte	0x1
	.byte	0xe
	.long	0xde
	.long	.LLST3
	.uleb128 0x9
	.long	.LVL7
	.long	0x1b0
	.uleb128 0x9
	.long	.LVL8
	.long	0x2c3
	.uleb128 0x9
	.long	.LVL10
	.long	0x2d0
	.uleb128 0x9
	.long	.LVL14
	.long	0x2dd
	.uleb128 0x9
	.long	.LVL16
	.long	0x2ea
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0xe4
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0xb
	.byte	0x1
	.long	.LASF8
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.long	0x41
	.long	.LFB1
	.long	.LFE1
	.long	.LLST4
	.byte	0x1
	.long	0x1aa
	.uleb128 0x5
	.long	.LASF6
	.byte	0x1
	.byte	0x27
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.long	.LASF7
	.byte	0x1
	.byte	0x27
	.long	0x1aa
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.string	"fd"
	.byte	0x1
	.byte	0x29
	.long	0x41
	.long	.LLST5
	.uleb128 0x7
	.string	"i"
	.byte	0x1
	.byte	0x29
	.long	0x41
	.long	.LLST6
	.uleb128 0xc
	.long	.LASF4
	.byte	0x1
	.byte	0x2a
	.long	0xde
	.long	.LLST7
	.uleb128 0x9
	.long	.LVL19
	.long	0x2f7
	.uleb128 0x9
	.long	.LVL20
	.long	0x304
	.uleb128 0x9
	.long	.LVL22
	.long	0x48
	.uleb128 0x9
	.long	.LVL23
	.long	0x304
	.uleb128 0x9
	.long	.LVL28
	.long	0x311
	.uleb128 0x9
	.long	.LVL32
	.long	0x2f7
	.uleb128 0x9
	.long	.LVL33
	.long	0x304
	.uleb128 0x9
	.long	.LVL34
	.long	0x48
	.uleb128 0x9
	.long	.LVL35
	.long	0x31e
	.uleb128 0x9
	.long	.LVL37
	.long	0x304
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0xde
	.uleb128 0xb
	.byte	0x1
	.long	.LASF9
	.byte	0x1
	.byte	0x49
	.byte	0x1
	.long	0x41
	.long	.LFB2
	.long	.LFE2
	.long	.LLST8
	.byte	0x1
	.long	0x1fd
	.uleb128 0x6
	.string	"re"
	.byte	0x1
	.byte	0x49
	.long	0xde
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.long	.LASF10
	.byte	0x1
	.byte	0x49
	.long	0xde
	.long	.LLST9
	.uleb128 0x9
	.long	.LVL39
	.long	0x1fd
	.uleb128 0x9
	.long	.LVL40
	.long	0x1fd
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.long	0x41
	.long	.LFB3
	.long	.LFE3
	.long	.LLST10
	.byte	0x1
	.long	0x249
	.uleb128 0x6
	.string	"re"
	.byte	0x1
	.byte	0x55
	.long	0xde
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.long	.LASF10
	.byte	0x1
	.byte	0x55
	.long	0xde
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x9
	.long	.LVL44
	.long	0x249
	.uleb128 0x9
	.long	.LVL45
	.long	0x1fd
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0x63
	.byte	0x1
	.long	0x41
	.long	.LFB4
	.long	.LFE4
	.long	.LLST11
	.byte	0x1
	.long	0x299
	.uleb128 0x6
	.string	"c"
	.byte	0x1
	.byte	0x63
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"re"
	.byte	0x1
	.byte	0x63
	.long	0xde
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xd
	.long	.LASF10
	.byte	0x1
	.byte	0x63
	.long	0xde
	.long	.LLST12
	.uleb128 0x9
	.long	.LVL47
	.long	0x1fd
	.byte	0
	.uleb128 0xe
	.long	0xe4
	.long	0x2aa
	.uleb128 0xf
	.long	0x2aa
	.value	0x3ff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF13
	.uleb128 0x10
	.string	"buf"
	.byte	0x1
	.byte	0x7
	.long	0x299
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	buf
	.uleb128 0x11
	.byte	0x1
	.byte	0x1
	.long	.LASF14
	.long	.LASF14
	.byte	0x2
	.byte	0xb
	.uleb128 0x11
	.byte	0x1
	.byte	0x1
	.long	.LASF15
	.long	.LASF15
	.byte	0x2
	.byte	0x8c
	.uleb128 0x11
	.byte	0x1
	.byte	0x1
	.long	.LASF16
	.long	.LASF16
	.byte	0x2
	.byte	0x8b
	.uleb128 0x11
	.byte	0x1
	.byte	0x1
	.long	.LASF17
	.long	.LASF17
	.byte	0x2
	.byte	0xc
	.uleb128 0x11
	.byte	0x1
	.byte	0x1
	.long	.LASF18
	.long	.LASF18
	.byte	0x2
	.byte	0x8e
	.uleb128 0x11
	.byte	0x1
	.byte	0x1
	.long	.LASF19
	.long	.LASF19
	.byte	0x2
	.byte	0x8
	.uleb128 0x11
	.byte	0x1
	.byte	0x1
	.long	.LASF20
	.long	.LASF20
	.byte	0x2
	.byte	0x10
	.uleb128 0x11
	.byte	0x1
	.byte	0x1
	.long	.LASF21
	.long	.LASF21
	.byte	0x2
	.byte	0xd
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x5
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x34
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.long	.LVL15-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL17-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LLST2:
	.long	.LVL4-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST3:
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL6-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL12-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST4:
	.long	.LFB1-.Ltext0
	.long	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI3-.Ltext0
	.long	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x71
	.sleb128 0
	.long	.LCFI4-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -8
	.byte	0x6
	.long	0
	.long	0
.LLST5:
	.long	.LVL29-.Ltext0
	.long	.LVL30-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -20
	.long	.LVL33-.Ltext0
	.long	.LVL34-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LLST6:
	.long	.LVL24-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL25-.Ltext0
	.long	.LVL26-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL36-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST7:
	.long	.LVL21-.Ltext0
	.long	.LVL22-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL22-1-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL23-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL25-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	0
	.long	0
.LLST8:
	.long	.LFB2-.Ltext0
	.long	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI5-.Ltext0
	.long	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI6-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI7-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST9:
	.long	.LVL38-.Ltext0
	.long	.LVL41-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	.LVL41-.Ltext0
	.long	.LVL42-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL42-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	0
	.long	0
.LLST10:
	.long	.LFB3-.Ltext0
	.long	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI8-.Ltext0
	.long	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI9-.Ltext0
	.long	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI10-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST11:
	.long	.LFB4-.Ltext0
	.long	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI11-.Ltext0
	.long	.LCFI12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI12-.Ltext0
	.long	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI13-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST12:
	.long	.LVL46-.Ltext0
	.long	.LVL48-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 8
	.long	.LVL48-.Ltext0
	.long	.LVL49-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL49-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 8
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
.LASF25:
	.string	"grep"
.LASF16:
	.string	"memmove"
.LASF19:
	.string	"exit"
.LASF10:
	.string	"text"
.LASF15:
	.string	"strchr"
.LASF11:
	.string	"matchhere"
.LASF12:
	.string	"matchstar"
.LASF2:
	.string	"unsigned char"
.LASF9:
	.string	"match"
.LASF1:
	.string	"short unsigned int"
.LASF14:
	.string	"write"
.LASF24:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF17:
	.string	"read"
.LASF8:
	.string	"main"
.LASF0:
	.string	"unsigned int"
.LASF5:
	.string	"char"
.LASF6:
	.string	"argc"
.LASF13:
	.string	"sizetype"
.LASF4:
	.string	"pattern"
.LASF22:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF18:
	.string	"printf"
.LASF20:
	.string	"open"
.LASF3:
	.string	"short int"
.LASF7:
	.string	"argv"
.LASF23:
	.string	"grep.c"
.LASF21:
	.string	"close"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
