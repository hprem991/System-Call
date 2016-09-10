	.file	"kill.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"usage: kill pid...\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "kill.c"
	.loc 1 7 0
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
	pushl	%ebx
	pushl	%ecx
.LCFI1:
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$16, %esp
	movl	%ecx, %ebx
	.loc 1 10 0
	cmpl	$1, (%ebx)
	jg	.L2
	.loc 1 11 0
	subl	$8, %esp
	pushl	$.LC0
	pushl	$2
	call	printf
.LVL1:
	addl	$16, %esp
	.loc 1 12 0
	call	exit
.LVL2:
.L2:
	.loc 1 14 0
	movl	$1, -12(%ebp)
.LVL3:
	jmp	.L3
.LVL4:
.L4:
	.loc 1 15 0 discriminator 3
	movl	-12(%ebp), %eax
.LVL5:
	leal	0(,%eax,4), %edx
	movl	4(%ebx), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
.LVL6:
	call	atoi
.LVL7:
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	kill
.LVL8:
	addl	$16, %esp
	.loc 1 14 0 discriminator 3
	addl	$1, -12(%ebp)
.LVL9:
.L3:
	.loc 1 14 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	(%ebx), %eax
	jl	.L4
	.loc 1 16 0 is_stmt 1
	call	exit
.LVL10:
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x101
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
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x6
	.byte	0x1
	.long	0x41
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xbd
	.uleb128 0x5
	.long	.LASF4
	.byte	0x1
	.byte	0x6
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.long	.LASF5
	.byte	0x1
	.byte	0x6
	.long	0xbd
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x8
	.long	0x41
	.long	.LLST1
	.uleb128 0x7
	.long	.LVL1
	.long	0xd0
	.uleb128 0x7
	.long	.LVL2
	.long	0xdd
	.uleb128 0x7
	.long	.LVL7
	.long	0xea
	.uleb128 0x7
	.long	.LVL8
	.long	0xf7
	.uleb128 0x7
	.long	.LVL10
	.long	0xdd
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0xc3
	.uleb128 0x8
	.byte	0x4
	.long	0xc9
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x9
	.byte	0x1
	.byte	0x1
	.long	.LASF7
	.long	.LASF7
	.byte	0x2
	.byte	0x8e
	.uleb128 0x9
	.byte	0x1
	.byte	0x1
	.long	.LASF8
	.long	.LASF8
	.byte	0x2
	.byte	0x8
	.uleb128 0x9
	.byte	0x1
	.byte	0x1
	.long	.LASF9
	.long	.LASF9
	.byte	0x2
	.byte	0x94
	.uleb128 0x9
	.byte	0x1
	.byte	0x1
	.long	.LASF10
	.long	.LASF10
	.byte	0x2
	.byte	0xe
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
	.sleb128 -8
	.byte	0x6
	.long	0
	.long	0
.LLST1:
	.long	.LVL3-.Ltext0
	.long	.LVL4-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL4-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL9-.Ltext0
	.long	.LFE0-.Ltext0
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
.LASF0:
	.string	"unsigned int"
.LASF13:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF10:
	.string	"kill"
.LASF9:
	.string	"atoi"
.LASF2:
	.string	"unsigned char"
.LASF14:
	.string	"main"
.LASF12:
	.string	"kill.c"
.LASF4:
	.string	"argc"
.LASF1:
	.string	"short unsigned int"
.LASF7:
	.string	"printf"
.LASF5:
	.string	"argv"
.LASF8:
	.string	"exit"
.LASF3:
	.string	"short int"
.LASF11:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF6:
	.string	"char"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
