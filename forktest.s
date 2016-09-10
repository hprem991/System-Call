	.file	"forktest.c"
	.text
.Ltext0:
	.globl	printf
	.type	printf, @function
printf:
.LFB0:
	.file 1 "forktest.c"
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
	subl	$8, %esp
	.loc 1 13 0
	subl	$12, %esp
	pushl	12(%ebp)
	call	strlen
.LVL1:
	addl	$16, %esp
	subl	$4, %esp
	pushl	%eax
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	write
.LVL2:
	addl	$16, %esp
	.loc 1 14 0
	nop
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	printf, .-printf
	.section	.rodata
.LC0:
	.string	"fork test\n"
	.align 4
.LC1:
	.string	"fork claimed to work N times!\n"
.LC2:
	.string	"wait stopped early\n"
.LC3:
	.string	"wait got too many\n"
.LC4:
	.string	"fork test OK\n"
	.text
	.globl	forktest
	.type	forktest, @function
forktest:
.LFB1:
	.loc 1 18 0
	.cfi_startproc
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 21 0
	subl	$8, %esp
	pushl	$.LC0
	pushl	$1
	call	printf
.LVL3:
	addl	$16, %esp
	.loc 1 23 0
	movl	$0, -12(%ebp)
.LVL4:
	jmp	.L3
.L7:
	.loc 1 24 0
	call	fork
.LVL5:
	movl	%eax, -16(%ebp)
.LVL6:
	.loc 1 25 0
	cmpl	$0, -16(%ebp)
	js	.L13
	.loc 1 27 0
	cmpl	$0, -16(%ebp)
	jne	.L6
	.loc 1 28 0
	call	exit
.LVL7:
.L6:
	.loc 1 23 0 discriminator 2
	addl	$1, -12(%ebp)
.LVL8:
.L3:
	.loc 1 23 0 is_stmt 0 discriminator 1
	cmpl	$999, -12(%ebp)
	jle	.L7
	jmp	.L5
.LVL9:
.L13:
	.loc 1 26 0 is_stmt 1
	nop
.LVL10:
.L5:
	.loc 1 31 0
	cmpl	$1000, -12(%ebp)
	jne	.L9
	.loc 1 32 0
	subl	$4, %esp
	pushl	$1000
	pushl	$.LC1
	pushl	$1
	call	printf
.LVL11:
	addl	$16, %esp
	.loc 1 33 0
	call	exit
.LVL12:
.L11:
	.loc 1 37 0
	call	wait
.LVL13:
	testl	%eax, %eax
	jns	.L10
	.loc 1 38 0
	subl	$8, %esp
	pushl	$.LC2
	pushl	$1
	call	printf
.LVL14:
	addl	$16, %esp
	.loc 1 39 0
	call	exit
.LVL15:
.L10:
	.loc 1 36 0
	subl	$1, -12(%ebp)
.L9:
	.loc 1 36 0 is_stmt 0 discriminator 1
	cmpl	$0, -12(%ebp)
	jg	.L11
	.loc 1 43 0 is_stmt 1
	call	wait
.LVL16:
	cmpl	$-1, %eax
	je	.L12
	.loc 1 44 0
	subl	$8, %esp
	pushl	$.LC3
	pushl	$1
	call	printf
.LVL17:
	addl	$16, %esp
	.loc 1 45 0
	call	exit
.LVL18:
.L12:
	.loc 1 48 0
	subl	$8, %esp
	pushl	$.LC4
	pushl	$1
	call	printf
.LVL19:
	addl	$16, %esp
	.loc 1 49 0
	nop
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL20:
	ret
	.cfi_endproc
.LFE1:
	.size	forktest, .-forktest
	.globl	main
	.type	main, @function
main:
.LFB2:
	.loc 1 53 0
	.cfi_startproc
	leal	4(%esp), %ecx
.LCFI6:
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
.LCFI7:
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$4, %esp
	.loc 1 54 0
	call	forktest
.LVL21:
	.loc 1 55 0
	call	exit
.LVL22:
	.cfi_endproc
.LFE2:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1ae
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF12
	.byte	0xc
	.long	.LASF13
	.long	.LASF14
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
	.long	.LASF5
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x8f
	.uleb128 0x5
	.string	"fd"
	.byte	0x1
	.byte	0xb
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.string	"s"
	.byte	0x1
	.byte	0xb
	.long	0x8f
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.uleb128 0x7
	.long	.LVL1
	.long	0x170
	.uleb128 0x7
	.long	.LVL2
	.long	0x17d
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x95
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x4
	.byte	0x1
	.long	.LASF6
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x13f
	.uleb128 0x9
	.string	"n"
	.byte	0x1
	.byte	0x13
	.long	0x41
	.long	.LLST2
	.uleb128 0x9
	.string	"pid"
	.byte	0x1
	.byte	0x13
	.long	0x41
	.long	.LLST3
	.uleb128 0x7
	.long	.LVL3
	.long	0x48
	.uleb128 0x7
	.long	.LVL5
	.long	0x18a
	.uleb128 0x7
	.long	.LVL7
	.long	0x197
	.uleb128 0x7
	.long	.LVL11
	.long	0x48
	.uleb128 0x7
	.long	.LVL12
	.long	0x197
	.uleb128 0x7
	.long	.LVL13
	.long	0x1a4
	.uleb128 0x7
	.long	.LVL14
	.long	0x48
	.uleb128 0x7
	.long	.LVL15
	.long	0x197
	.uleb128 0x7
	.long	.LVL16
	.long	0x1a4
	.uleb128 0x7
	.long	.LVL17
	.long	0x48
	.uleb128 0x7
	.long	.LVL18
	.long	0x197
	.uleb128 0x7
	.long	.LVL19
	.long	0x48
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0x41
	.long	.LFB2
	.long	.LFE2
	.long	.LLST4
	.byte	0x1
	.long	0x170
	.uleb128 0x7
	.long	.LVL21
	.long	0x9c
	.uleb128 0x7
	.long	.LVL22
	.long	0x197
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.byte	0x1
	.long	.LASF7
	.long	.LASF7
	.byte	0x2
	.byte	0x90
	.uleb128 0xb
	.byte	0x1
	.byte	0x1
	.long	.LASF8
	.long	.LASF8
	.byte	0x2
	.byte	0xb
	.uleb128 0xb
	.byte	0x1
	.byte	0x1
	.long	.LASF9
	.long	.LASF9
	.byte	0x2
	.byte	0x7
	.uleb128 0xb
	.byte	0x1
	.byte	0x1
	.long	.LASF10
	.long	.LASF10
	.byte	0x2
	.byte	0x8
	.uleb128 0xb
	.byte	0x1
	.byte	0x1
	.long	.LASF11
	.long	.LASF11
	.byte	0x2
	.byte	0x9
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x6
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
	.long	.LVL4-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL20-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST3:
	.long	.LVL6-.Ltext0
	.long	.LVL7-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL7-1-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL7-.Ltext0
	.long	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x1
	.byte	0x50
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
	.byte	0x71
	.sleb128 0
	.long	.LCFI7-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -4
	.byte	0x6
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
.LASF11:
	.string	"wait"
.LASF14:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF15:
	.string	"main"
.LASF6:
	.string	"forktest"
.LASF13:
	.string	"forktest.c"
.LASF8:
	.string	"write"
.LASF2:
	.string	"unsigned char"
.LASF4:
	.string	"char"
.LASF7:
	.string	"strlen"
.LASF1:
	.string	"short unsigned int"
.LASF5:
	.string	"printf"
.LASF9:
	.string	"fork"
.LASF10:
	.string	"exit"
.LASF3:
	.string	"short int"
.LASF12:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
