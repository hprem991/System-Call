	.file	"printf.c"
	.text
.Ltext0:
	.type	putc, @function
putc:
.LFB0:
	.file 1 "printf.c"
	.loc 1 7 0
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
	movl	12(%ebp), %eax
	movb	%al, -12(%ebp)
	.loc 1 8 0
	subl	$4, %esp
	pushl	$1
	leal	-12(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	write
.LVL1:
	addl	$16, %esp
	.loc 1 9 0
	nop
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	putc, .-putc
	.type	printint, @function
printint:
.LFB1:
	.loc 1 13 0
	.cfi_startproc
.LVL2:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 19 0
	movl	$0, -16(%ebp)
.LVL3:
	.loc 1 20 0
	cmpl	$0, 20(%ebp)
	je	.L3
	.loc 1 20 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	jns	.L3
	.loc 1 21 0 is_stmt 1
	movl	$1, -16(%ebp)
.LVL4:
	.loc 1 22 0
	movl	12(%ebp), %eax
	negl	%eax
	movl	%eax, -20(%ebp)
.LVL5:
	jmp	.L4
.LVL6:
.L3:
	.loc 1 24 0
	movl	12(%ebp), %eax
	movl	%eax, -20(%ebp)
.LVL7:
.L4:
	.loc 1 27 0
	movl	$0, -12(%ebp)
.LVL8:
.L5:
	.loc 1 29 0 discriminator 1
	movl	-12(%ebp), %ecx
	leal	1(%ecx), %eax
	movl	%eax, -12(%ebp)
.LVL9:
	movl	16(%ebp), %ebx
	movl	-20(%ebp), %eax
.LVL10:
	movl	$0, %edx
	divl	%ebx
	movl	%edx, %eax
	movzbl	digits.1313(%eax), %eax
	movb	%al, -36(%ebp,%ecx)
	.loc 1 30 0 discriminator 1
	movl	16(%ebp), %ebx
	movl	-20(%ebp), %eax
	movl	$0, %edx
	divl	%ebx
	movl	%eax, -20(%ebp)
.LVL11:
	cmpl	$0, -20(%ebp)
	jne	.L5
	.loc 1 31 0
	cmpl	$0, -16(%ebp)
	je	.L7
	.loc 1 32 0
	movl	-12(%ebp), %eax
.LVL12:
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
.LVL13:
	movb	$45, -36(%ebp,%eax)
	.loc 1 34 0
	jmp	.L7
.LVL14:
.L8:
	.loc 1 35 0
	leal	-36(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	putc
.LVL15:
	addl	$16, %esp
.L7:
	.loc 1 34 0
	subl	$1, -12(%ebp)
.LVL16:
	cmpl	$0, -12(%ebp)
	jns	.L8
	.loc 1 36 0
	nop
	movl	-4(%ebp), %ebx
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	printint, .-printint
	.section	.rodata
.LC0:
	.string	"(null)"
	.text
	.globl	printf
	.type	printf, @function
printf:
.LFB2:
	.loc 1 41 0
	.cfi_startproc
.LVL17:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 46 0
	movl	$0, -20(%ebp)
.LVL18:
	.loc 1 47 0
	leal	12(%ebp), %eax
.LVL19:
	addl	$4, %eax
.LVL20:
	movl	%eax, -24(%ebp)
.LVL21:
	.loc 1 48 0
	movl	$0, -16(%ebp)
.LVL22:
	jmp	.L10
.LVL23:
.L25:
	.loc 1 49 0
	movl	12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	andl	$255, %eax
	movl	%eax, -28(%ebp)
.LVL24:
	.loc 1 50 0
	cmpl	$0, -20(%ebp)
	jne	.L11
	.loc 1 51 0
	cmpl	$37, -28(%ebp)
	jne	.L12
	.loc 1 52 0
	movl	$37, -20(%ebp)
.LVL25:
	jmp	.L14
.L12:
	.loc 1 54 0
	movl	-28(%ebp), %eax
.LVL26:
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	putc
.LVL27:
	addl	$16, %esp
	jmp	.L14
.LVL28:
.L11:
	.loc 1 56 0
	cmpl	$37, -20(%ebp)
	jne	.L14
	.loc 1 57 0
	cmpl	$100, -28(%ebp)
	jne	.L15
	.loc 1 58 0
	movl	-24(%ebp), %eax
.LVL29:
	movl	(%eax), %eax
	pushl	$1
	pushl	$10
	pushl	%eax
	pushl	8(%ebp)
	call	printint
.LVL30:
	addl	$16, %esp
	.loc 1 59 0
	addl	$4, -24(%ebp)
	jmp	.L16
.LVL31:
.L15:
	.loc 1 60 0
	cmpl	$120, -28(%ebp)
	je	.L17
	.loc 1 60 0 is_stmt 0 discriminator 1
	cmpl	$112, -28(%ebp)
	jne	.L18
.L17:
	.loc 1 61 0 is_stmt 1
	movl	-24(%ebp), %eax
.LVL32:
	movl	(%eax), %eax
	pushl	$0
	pushl	$16
	pushl	%eax
	pushl	8(%ebp)
	call	printint
.LVL33:
	addl	$16, %esp
	.loc 1 62 0
	addl	$4, -24(%ebp)
	jmp	.L16
.LVL34:
.L18:
	.loc 1 63 0
	cmpl	$115, -28(%ebp)
	jne	.L19
	.loc 1 64 0
	movl	-24(%ebp), %eax
.LVL35:
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL36:
	.loc 1 65 0
	addl	$4, -24(%ebp)
.LVL37:
	.loc 1 66 0
	cmpl	$0, -12(%ebp)
	jne	.L21
	.loc 1 67 0
	movl	$.LC0, -12(%ebp)
.LVL38:
	.loc 1 68 0
	jmp	.L21
.L22:
	.loc 1 69 0
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	putc
.LVL39:
	addl	$16, %esp
	.loc 1 70 0
	addl	$1, -12(%ebp)
.L21:
	.loc 1 68 0
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L22
	jmp	.L16
.LVL40:
.L19:
	.loc 1 72 0
	cmpl	$99, -28(%ebp)
	jne	.L23
	.loc 1 73 0
	movl	-24(%ebp), %eax
.LVL41:
	movl	(%eax), %eax
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	putc
.LVL42:
	addl	$16, %esp
	.loc 1 74 0
	addl	$4, -24(%ebp)
	jmp	.L16
.LVL43:
.L23:
	.loc 1 75 0
	cmpl	$37, -28(%ebp)
	jne	.L24
	.loc 1 76 0
	movl	-28(%ebp), %eax
.LVL44:
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	putc
.LVL45:
	addl	$16, %esp
	jmp	.L16
.LVL46:
.L24:
	.loc 1 79 0
	subl	$8, %esp
	pushl	$37
	pushl	8(%ebp)
	call	putc
.LVL47:
	addl	$16, %esp
	.loc 1 80 0
	movl	-28(%ebp), %eax
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	putc
.LVL48:
	addl	$16, %esp
.L16:
	.loc 1 82 0
	movl	$0, -20(%ebp)
.L14:
	.loc 1 48 0 discriminator 2
	addl	$1, -16(%ebp)
.LVL49:
.L10:
	.loc 1 48 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L25
	.loc 1 85 0 is_stmt 1
	nop
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	printf, .-printf
	.data
	.align 4
	.type	digits.1313, @object
	.size	digits.1313, 17
digits.1313:
	.string	"0123456789ABCDEF"
	.text
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x22b
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF11
	.byte	0xc
	.long	.LASF12
	.long	.LASF13
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
	.long	.LASF5
	.byte	0x1
	.byte	0x6
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x84
	.uleb128 0x5
	.string	"fd"
	.byte	0x1
	.byte	0x6
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.string	"c"
	.byte	0x1
	.byte	0x6
	.long	0x84
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.long	.LVL1
	.long	0x221
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x4
	.long	.LASF6
	.byte	0x1
	.byte	0xc
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x12b
	.uleb128 0x5
	.string	"fd"
	.byte	0x1
	.byte	0xc
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.string	"xx"
	.byte	0x1
	.byte	0xc
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.long	.LASF7
	.byte	0x1
	.byte	0xc
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x5
	.string	"sgn"
	.byte	0x1
	.byte	0xc
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x8
	.long	.LASF8
	.byte	0x1
	.byte	0xe
	.long	0x12b
	.byte	0x5
	.byte	0x3
	.long	digits.1313
	.uleb128 0x9
	.string	"buf"
	.byte	0x1
	.byte	0xf
	.long	0x142
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xa
	.string	"i"
	.byte	0x1
	.byte	0x10
	.long	0x41
	.long	.LLST2
	.uleb128 0x9
	.string	"neg"
	.byte	0x1
	.byte	0x10
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.string	"x"
	.byte	0x1
	.byte	0x11
	.long	0x25
	.long	.LLST3
	.uleb128 0x6
	.long	.LVL15
	.long	0x48
	.byte	0
	.uleb128 0xb
	.long	0x84
	.long	0x13b
	.uleb128 0xc
	.long	0x13b
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0xb
	.long	0x84
	.long	0x152
	.uleb128 0xc
	.long	0x13b
	.byte	0xf
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST4
	.byte	0x1
	.long	0x215
	.uleb128 0x5
	.string	"fd"
	.byte	0x1
	.byte	0x28
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.string	"fmt"
	.byte	0x1
	.byte	0x28
	.long	0x215
	.long	.LLST5
	.uleb128 0xf
	.uleb128 0xa
	.string	"s"
	.byte	0x1
	.byte	0x2a
	.long	0x215
	.long	.LLST6
	.uleb128 0xa
	.string	"c"
	.byte	0x1
	.byte	0x2b
	.long	0x41
	.long	.LLST7
	.uleb128 0xa
	.string	"i"
	.byte	0x1
	.byte	0x2b
	.long	0x41
	.long	.LLST8
	.uleb128 0x8
	.long	.LASF10
	.byte	0x1
	.byte	0x2b
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.string	"ap"
	.byte	0x1
	.byte	0x2c
	.long	0x21b
	.long	.LLST9
	.uleb128 0x6
	.long	.LVL27
	.long	0x48
	.uleb128 0x6
	.long	.LVL30
	.long	0x8b
	.uleb128 0x6
	.long	.LVL33
	.long	0x8b
	.uleb128 0x6
	.long	.LVL39
	.long	0x48
	.uleb128 0x6
	.long	.LVL42
	.long	0x48
	.uleb128 0x6
	.long	.LVL45
	.long	0x48
	.uleb128 0x6
	.long	.LVL47
	.long	0x48
	.uleb128 0x6
	.long	.LVL48
	.long	0x48
	.byte	0
	.uleb128 0x10
	.byte	0x4
	.long	0x84
	.uleb128 0x10
	.byte	0x4
	.long	0x25
	.uleb128 0x11
	.byte	0x1
	.byte	0x1
	.long	.LASF15
	.long	.LASF15
	.byte	0x2
	.byte	0xb
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
	.uleb128 0x6
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
.LLST2:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL10-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL14-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST3:
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL7-.Ltext0
	.long	.LVL11-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL12-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST4:
	.long	.LFB2-.Ltext0
	.long	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI6-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI7-.Ltext0
	.long	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI8-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LVL17-.Ltext0
	.long	.LVL19-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	.LVL19-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.long	.LVL20-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 -4
	.long	.LVL23-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	0
	.long	0
.LLST6:
	.long	.LVL36-.Ltext0
	.long	.LVL38-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL38-.Ltext0
	.long	.LVL40-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST7:
	.long	.LVL24-.Ltext0
	.long	.LVL26-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL26-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL29-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL31-.Ltext0
	.long	.LVL32-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL32-.Ltext0
	.long	.LVL34-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL34-.Ltext0
	.long	.LVL35-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL35-.Ltext0
	.long	.LVL40-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL40-.Ltext0
	.long	.LVL41-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL41-.Ltext0
	.long	.LVL43-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL43-.Ltext0
	.long	.LVL44-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL44-.Ltext0
	.long	.LVL46-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL46-.Ltext0
	.long	.LVL47-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL47-1-.Ltext0
	.long	.LVL49-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST8:
	.long	.LVL22-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL23-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST9:
	.long	.LVL21-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL23-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
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
.LASF0:
	.string	"unsigned int"
.LASF13:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF12:
	.string	"printf.c"
.LASF7:
	.string	"base"
.LASF15:
	.string	"write"
.LASF2:
	.string	"unsigned char"
.LASF4:
	.string	"char"
.LASF6:
	.string	"printint"
.LASF14:
	.string	"printf"
.LASF1:
	.string	"short unsigned int"
.LASF8:
	.string	"digits"
.LASF10:
	.string	"state"
.LASF5:
	.string	"putc"
.LASF3:
	.string	"short int"
.LASF11:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF9:
	.string	"sizetype"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
