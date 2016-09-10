	.file	"echo.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	" "
.LC1:
	.string	"\n"
.LC2:
	.string	"%s%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "echo.c"
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
	movl	$1, -12(%ebp)
.LVL1:
	jmp	.L2
.LVL2:
.L5:
	.loc 1 11 0
	movl	-12(%ebp), %eax
.LVL3:
	addl	$1, %eax
	cmpl	(%ebx), %eax
	jge	.L3
	.loc 1 11 0 is_stmt 0 discriminator 1
	movl	$.LC0, %edx
	jmp	.L4
.L3:
	.loc 1 11 0 discriminator 2
	movl	$.LC1, %edx
.L4:
	.loc 1 11 0 discriminator 4
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	4(%ebx), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	pushl	%edx
.LVL4:
	pushl	%eax
	pushl	$.LC2
	pushl	$1
	call	printf
.LVL5:
	addl	$16, %esp
	.loc 1 10 0 is_stmt 1 discriminator 4
	addl	$1, -12(%ebp)
.LVL6:
.L2:
	.loc 1 10 0 is_stmt 0 discriminator 2
	movl	-12(%ebp), %eax
	cmpl	(%ebx), %eax
	jl	.L5
	.loc 1 12 0 is_stmt 1
	call	exit
.LVL7:
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xcc
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF9
	.byte	0xc
	.long	.LASF10
	.long	.LASF11
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
	.long	.LASF12
	.byte	0x1
	.byte	0x6
	.byte	0x1
	.long	0x41
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xa2
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
	.long	0xa2
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
	.long	.LVL5
	.long	0xb5
	.uleb128 0x7
	.long	.LVL7
	.long	0xc2
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0xa8
	.uleb128 0x8
	.byte	0x4
	.long	0xae
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
	.long	.LVL1-.Ltext0
	.long	.LVL2-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL3-.Ltext0
	.long	.LVL4-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL6-.Ltext0
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
.LASF11:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF7:
	.string	"printf"
.LASF2:
	.string	"unsigned char"
.LASF12:
	.string	"main"
.LASF4:
	.string	"argc"
.LASF1:
	.string	"short unsigned int"
.LASF10:
	.string	"echo.c"
.LASF5:
	.string	"argv"
.LASF8:
	.string	"exit"
.LASF3:
	.string	"short int"
.LASF9:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF6:
	.string	"char"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
