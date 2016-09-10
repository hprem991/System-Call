	.file	"init.c"
	.text
.Ltext0:
	.globl	argv
	.section	.rodata
.LC0:
	.string	"sh"
	.data
	.align 4
	.type	argv, @object
	.size	argv, 8
argv:
	.long	.LC0
	.long	0
	.section	.rodata
.LC1:
	.string	"console"
.LC2:
	.string	"init: starting sh\n"
.LC3:
	.string	"init: fork failed\n"
.LC4:
	.string	"init: exec sh failed\n"
.LC5:
	.string	"zombie!\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "init.c"
	.loc 1 12 0
	.cfi_startproc
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
	subl	$20, %esp
	.loc 1 15 0
	subl	$8, %esp
	pushl	$2
	pushl	$.LC1
	call	open
.LVL0:
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L2
	.loc 1 16 0
	subl	$4, %esp
	pushl	$1
	pushl	$1
	pushl	$.LC1
	call	mknod
.LVL1:
	addl	$16, %esp
	.loc 1 17 0
	subl	$8, %esp
	pushl	$2
	pushl	$.LC1
	call	open
.LVL2:
	addl	$16, %esp
.L2:
	.loc 1 19 0
	subl	$12, %esp
	pushl	$0
	call	dup
.LVL3:
	addl	$16, %esp
	.loc 1 20 0
	subl	$12, %esp
	pushl	$0
	call	dup
.LVL4:
	addl	$16, %esp
.L8:
	.loc 1 23 0
	subl	$8, %esp
	pushl	$.LC2
	pushl	$1
	call	printf
.LVL5:
	addl	$16, %esp
	.loc 1 24 0
	call	fork
.LVL6:
	movl	%eax, -12(%ebp)
.LVL7:
	.loc 1 25 0
	cmpl	$0, -12(%ebp)
	jns	.L3
	.loc 1 26 0
	subl	$8, %esp
	pushl	$.LC3
	pushl	$1
	call	printf
.LVL8:
	addl	$16, %esp
	.loc 1 27 0
	call	exit
.LVL9:
.L3:
	.loc 1 29 0
	cmpl	$0, -12(%ebp)
	jne	.L5
	.loc 1 30 0
	subl	$8, %esp
	pushl	$argv
	pushl	$.LC0
	call	exec
.LVL10:
	addl	$16, %esp
	.loc 1 31 0
	subl	$8, %esp
	pushl	$.LC4
	pushl	$1
	call	printf
.LVL11:
	addl	$16, %esp
	.loc 1 32 0
	call	exit
.LVL12:
.L7:
	.loc 1 35 0
	subl	$8, %esp
	pushl	$.LC5
	pushl	$1
	call	printf
.LVL13:
	addl	$16, %esp
.L5:
	.loc 1 34 0
	call	wait
.LVL14:
	movl	%eax, -16(%ebp)
.LVL15:
	cmpl	$0, -16(%ebp)
	js	.L8
	.loc 1 34 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jne	.L7
	.loc 1 36 0 is_stmt 1
	jmp	.L8
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x19e
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF14
	.byte	0xc
	.long	.LASF15
	.long	.LASF16
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
	.long	.LASF17
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.long	0x41
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x103
	.uleb128 0x5
	.string	"pid"
	.byte	0x1
	.byte	0xd
	.long	0x41
	.long	.LLST1
	.uleb128 0x6
	.long	.LASF4
	.byte	0x1
	.byte	0xd
	.long	0x41
	.long	.LLST2
	.uleb128 0x7
	.long	.LVL0
	.long	0x139
	.uleb128 0x7
	.long	.LVL1
	.long	0x146
	.uleb128 0x7
	.long	.LVL2
	.long	0x139
	.uleb128 0x7
	.long	.LVL3
	.long	0x153
	.uleb128 0x7
	.long	.LVL4
	.long	0x153
	.uleb128 0x7
	.long	.LVL5
	.long	0x160
	.uleb128 0x7
	.long	.LVL6
	.long	0x16d
	.uleb128 0x7
	.long	.LVL8
	.long	0x160
	.uleb128 0x7
	.long	.LVL9
	.long	0x17a
	.uleb128 0x7
	.long	.LVL10
	.long	0x187
	.uleb128 0x7
	.long	.LVL11
	.long	0x160
	.uleb128 0x7
	.long	.LVL12
	.long	0x17a
	.uleb128 0x7
	.long	.LVL13
	.long	0x160
	.uleb128 0x7
	.long	.LVL14
	.long	0x194
	.byte	0
	.uleb128 0x8
	.long	0x11a
	.long	0x113
	.uleb128 0x9
	.long	0x113
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0xa
	.byte	0x4
	.long	0x120
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0xb
	.long	.LASF18
	.byte	0x1
	.byte	0x8
	.long	0x103
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	argv
	.uleb128 0xc
	.byte	0x1
	.byte	0x1
	.long	.LASF7
	.long	.LASF7
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.byte	0x1
	.byte	0x1
	.long	.LASF8
	.long	.LASF8
	.byte	0x2
	.byte	0x11
	.uleb128 0xd
	.byte	0x1
	.byte	0x1
	.string	"dup"
	.string	"dup"
	.byte	0x2
	.byte	0x17
	.uleb128 0xc
	.byte	0x1
	.byte	0x1
	.long	.LASF9
	.long	.LASF9
	.byte	0x2
	.byte	0x8e
	.uleb128 0xc
	.byte	0x1
	.byte	0x1
	.long	.LASF10
	.long	.LASF10
	.byte	0x2
	.byte	0x7
	.uleb128 0xc
	.byte	0x1
	.byte	0x1
	.long	.LASF11
	.long	.LASF11
	.byte	0x2
	.byte	0x8
	.uleb128 0xc
	.byte	0x1
	.byte	0x1
	.long	.LASF12
	.long	.LASF12
	.byte	0x2
	.byte	0xf
	.uleb128 0xc
	.byte	0x1
	.byte	0x1
	.long	.LASF13
	.long	.LASF13
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
	.uleb128 0x6
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x2007
	.uleb128 0x8
	.uleb128 0x3
	.uleb128 0x8
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
	.long	.LVL7-.Ltext0
	.long	.LVL8-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL9-.Ltext0
	.long	.LVL10-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL12-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST2:
	.long	.LVL12-.Ltext0
	.long	.LVL13-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL15-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x1
	.byte	0x50
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
.LASF7:
	.string	"open"
.LASF0:
	.string	"unsigned int"
.LASF13:
	.string	"wait"
.LASF16:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF12:
	.string	"exec"
.LASF6:
	.string	"char"
.LASF2:
	.string	"unsigned char"
.LASF17:
	.string	"main"
.LASF8:
	.string	"mknod"
.LASF4:
	.string	"wpid"
.LASF1:
	.string	"short unsigned int"
.LASF9:
	.string	"printf"
.LASF18:
	.string	"argv"
.LASF10:
	.string	"fork"
.LASF11:
	.string	"exit"
.LASF3:
	.string	"short int"
.LASF15:
	.string	"init.c"
.LASF14:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF5:
	.string	"sizetype"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
