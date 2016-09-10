	.file	"stressfs.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"stressfs starting\n"
.LC1:
	.string	"write %d\n"
.LC2:
	.string	"read\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "stressfs.c"
	.loc 1 18 0
	.cfi_startproc
.LVL0:
	leal	4(%esp), %ecx
.LCFI0:
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
.LCFI1:
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$548, %esp
	.loc 1 20 0
	movl	$1701999731, -26(%ebp)
	movl	$1936094067, -22(%ebp)
	movw	$48, -18(%ebp)
	.loc 1 23 0
	subl	$8, %esp
	pushl	$.LC0
	pushl	$1
	call	printf
.LVL1:
	addl	$16, %esp
	.loc 1 24 0
	subl	$4, %esp
	pushl	$512
	pushl	$97
	leal	-538(%ebp), %eax
	pushl	%eax
	call	memset
.LVL2:
	addl	$16, %esp
	.loc 1 26 0
	movl	$0, -12(%ebp)
.LVL3:
	jmp	.L2
.L5:
	.loc 1 27 0
	call	fork
.LVL4:
	testl	%eax, %eax
	jg	.L10
	.loc 1 26 0 discriminator 2
	addl	$1, -12(%ebp)
.LVL5:
.L2:
	.loc 1 26 0 is_stmt 0 discriminator 1
	cmpl	$3, -12(%ebp)
	jle	.L5
	jmp	.L4
.L10:
	.loc 1 28 0 is_stmt 1
	nop
.L4:
	.loc 1 30 0
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	$.LC1
	pushl	$1
	call	printf
.LVL6:
	addl	$16, %esp
	.loc 1 32 0
	movzbl	-18(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movb	%al, -18(%ebp)
	.loc 1 33 0
	subl	$8, %esp
	pushl	$514
	leal	-26(%ebp), %eax
	pushl	%eax
	call	open
.LVL7:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL8:
	.loc 1 34 0
	movl	$0, -12(%ebp)
	jmp	.L6
.LVL9:
.L7:
	.loc 1 36 0 discriminator 3
	subl	$4, %esp
	pushl	$512
.LVL10:
	leal	-538(%ebp), %eax
	pushl	%eax
	pushl	-16(%ebp)
	call	write
.LVL11:
	addl	$16, %esp
	.loc 1 34 0 discriminator 3
	addl	$1, -12(%ebp)
.LVL12:
.L6:
	.loc 1 34 0 is_stmt 0 discriminator 1
	cmpl	$19, -12(%ebp)
	jle	.L7
	.loc 1 37 0 is_stmt 1
	subl	$12, %esp
	pushl	-16(%ebp)
.LVL13:
	call	close
.LVL14:
	addl	$16, %esp
	.loc 1 39 0
	subl	$8, %esp
	pushl	$.LC2
	pushl	$1
	call	printf
.LVL15:
	addl	$16, %esp
	.loc 1 41 0
	subl	$8, %esp
	pushl	$0
	leal	-26(%ebp), %eax
	pushl	%eax
	call	open
.LVL16:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL17:
	.loc 1 42 0
	movl	$0, -12(%ebp)
.LVL18:
	jmp	.L8
.LVL19:
.L9:
	.loc 1 43 0 discriminator 3
	subl	$4, %esp
	pushl	$512
.LVL20:
	leal	-538(%ebp), %eax
	pushl	%eax
	pushl	-16(%ebp)
	call	read
.LVL21:
	addl	$16, %esp
	.loc 1 42 0 discriminator 3
	addl	$1, -12(%ebp)
.LVL22:
.L8:
	.loc 1 42 0 is_stmt 0 discriminator 1
	cmpl	$19, -12(%ebp)
	jle	.L9
	.loc 1 44 0 is_stmt 1
	subl	$12, %esp
	pushl	-16(%ebp)
.LVL23:
	call	close
.LVL24:
	addl	$16, %esp
	.loc 1 46 0
	call	wait
.LVL25:
	.loc 1 48 0
	call	exit
.LVL26:
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1dd
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF19
	.byte	0xc
	.long	.LASF20
	.long	.LASF21
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0x4
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.long	0x41
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x13e
	.uleb128 0x5
	.long	.LASF6
	.byte	0x1
	.byte	0x11
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.long	.LASF7
	.byte	0x1
	.byte	0x11
	.long	0x13e
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.string	"fd"
	.byte	0x1
	.byte	0x13
	.long	0x41
	.long	.LLST1
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x13
	.long	0x41
	.long	.LLST2
	.uleb128 0x7
	.long	.LASF8
	.byte	0x1
	.byte	0x14
	.long	0x14a
	.byte	0x2
	.byte	0x75
	.sleb128 -26
	.uleb128 0x7
	.long	.LASF9
	.byte	0x1
	.byte	0x15
	.long	0x15a
	.byte	0x3
	.byte	0x75
	.sleb128 -538
	.uleb128 0x8
	.long	.LVL1
	.long	0x16b
	.uleb128 0x8
	.long	.LVL2
	.long	0x178
	.uleb128 0x8
	.long	.LVL4
	.long	0x185
	.uleb128 0x8
	.long	.LVL6
	.long	0x16b
	.uleb128 0x8
	.long	.LVL7
	.long	0x192
	.uleb128 0x8
	.long	.LVL11
	.long	0x19f
	.uleb128 0x8
	.long	.LVL14
	.long	0x1ac
	.uleb128 0x8
	.long	.LVL15
	.long	0x16b
	.uleb128 0x8
	.long	.LVL16
	.long	0x192
	.uleb128 0x8
	.long	.LVL21
	.long	0x1b9
	.uleb128 0x8
	.long	.LVL24
	.long	0x1ac
	.uleb128 0x8
	.long	.LVL25
	.long	0x1c6
	.uleb128 0x8
	.long	.LVL26
	.long	0x1d3
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x144
	.uleb128 0x9
	.byte	0x4
	.long	0x4f
	.uleb128 0xa
	.long	0x4f
	.long	0x15a
	.uleb128 0xb
	.long	0x48
	.byte	0x9
	.byte	0
	.uleb128 0xa
	.long	0x4f
	.long	0x16b
	.uleb128 0xc
	.long	0x48
	.value	0x1ff
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.byte	0x1
	.long	.LASF10
	.long	.LASF10
	.byte	0x2
	.byte	0x8e
	.uleb128 0xd
	.byte	0x1
	.byte	0x1
	.long	.LASF11
	.long	.LASF11
	.byte	0x2
	.byte	0x91
	.uleb128 0xd
	.byte	0x1
	.byte	0x1
	.long	.LASF12
	.long	.LASF12
	.byte	0x2
	.byte	0x7
	.uleb128 0xd
	.byte	0x1
	.byte	0x1
	.long	.LASF13
	.long	.LASF13
	.byte	0x2
	.byte	0x10
	.uleb128 0xd
	.byte	0x1
	.byte	0x1
	.long	.LASF14
	.long	.LASF14
	.byte	0x2
	.byte	0xb
	.uleb128 0xd
	.byte	0x1
	.byte	0x1
	.long	.LASF15
	.long	.LASF15
	.byte	0x2
	.byte	0xd
	.uleb128 0xd
	.byte	0x1
	.byte	0x1
	.long	.LASF16
	.long	.LASF16
	.byte	0x2
	.byte	0xc
	.uleb128 0xd
	.byte	0x1
	.byte	0x1
	.long	.LASF17
	.long	.LASF17
	.byte	0x2
	.byte	0x9
	.uleb128 0xd
	.byte	0x1
	.byte	0x1
	.long	.LASF18
	.long	.LASF18
	.byte	0x2
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.byte	0x71
	.sleb128 0
	.long	.LCFI1-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -4
	.byte	0x6
	.long	0
	.long	0
.LLST1:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL9-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL17-.Ltext0
	.long	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL19-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	0
	.long	0
.LLST2:
	.long	.LVL3-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL12-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL18-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL22-.Ltext0
	.long	.LVL23-.Ltext0
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
.LASF13:
	.string	"open"
.LASF18:
	.string	"exit"
.LASF10:
	.string	"printf"
.LASF9:
	.string	"data"
.LASF2:
	.string	"unsigned char"
.LASF1:
	.string	"short unsigned int"
.LASF14:
	.string	"write"
.LASF11:
	.string	"memset"
.LASF21:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF16:
	.string	"read"
.LASF17:
	.string	"wait"
.LASF22:
	.string	"main"
.LASF0:
	.string	"unsigned int"
.LASF12:
	.string	"fork"
.LASF5:
	.string	"char"
.LASF6:
	.string	"argc"
.LASF4:
	.string	"sizetype"
.LASF19:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF20:
	.string	"stressfs.c"
.LASF3:
	.string	"short int"
.LASF7:
	.string	"argv"
.LASF8:
	.string	"path"
.LASF15:
	.string	"close"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
