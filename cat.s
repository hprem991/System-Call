	.file	"cat.c"
	.text
.Ltext0:
	.comm	buf,512,32
	.section	.rodata
.LC0:
	.string	"cat: read error\n"
	.text
	.globl	cat
	.type	cat, @function
cat:
.LFB0:
	.file 1 "cat.c"
	.loc 1 9 0
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
	.loc 1 12 0
	jmp	.L2
.LVL1:
.L3:
	.loc 1 13 0
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	$buf
	pushl	$1
	call	write
.LVL2:
	addl	$16, %esp
.LVL3:
.L2:
	.loc 1 12 0
	subl	$4, %esp
	pushl	$512
	pushl	$buf
	pushl	8(%ebp)
	call	read
.LVL4:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL5:
	cmpl	$0, -12(%ebp)
	jg	.L3
	.loc 1 14 0
	cmpl	$0, -12(%ebp)
	jns	.L5
	.loc 1 15 0
	subl	$8, %esp
	pushl	$.LC0
	pushl	$1
	call	printf
.LVL6:
	addl	$16, %esp
	.loc 1 16 0
	call	exit
.LVL7:
.L5:
	.loc 1 18 0
	nop
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	cat, .-cat
	.section	.rodata
.LC1:
	.string	"cat: cannot open %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 22 0
	.cfi_startproc
.LVL8:
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
	.loc 1 25 0
	cmpl	$1, (%ebx)
	jg	.L7
	.loc 1 26 0
	subl	$12, %esp
	pushl	$0
	call	cat
.LVL9:
	addl	$16, %esp
	.loc 1 27 0
	call	exit
.LVL10:
.L7:
	.loc 1 30 0
	movl	$1, -12(%ebp)
.LVL11:
	jmp	.L8
.LVL12:
.L10:
	.loc 1 31 0
	movl	-12(%ebp), %eax
.LVL13:
	leal	0(,%eax,4), %edx
	movl	4(%ebx), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	$0
.LVL14:
	pushl	%eax
	call	open
.LVL15:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL16:
	cmpl	$0, -16(%ebp)
	jns	.L9
	.loc 1 32 0
	movl	-12(%ebp), %eax
.LVL17:
	leal	0(,%eax,4), %edx
	movl	4(%ebx), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	%eax
.LVL18:
	pushl	$.LC1
	pushl	$1
	call	printf
.LVL19:
	addl	$16, %esp
	.loc 1 33 0
	call	exit
.LVL20:
.L9:
	.loc 1 35 0 discriminator 2
	subl	$12, %esp
	pushl	-16(%ebp)
	call	cat
.LVL21:
	addl	$16, %esp
	.loc 1 36 0 discriminator 2
	subl	$12, %esp
	pushl	-16(%ebp)
	call	close
.LVL22:
	addl	$16, %esp
	.loc 1 30 0 discriminator 2
	addl	$1, -12(%ebp)
.LVL23:
.L8:
	.loc 1 30 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	(%ebx), %eax
	jl	.L10
	.loc 1 38 0 is_stmt 1
	call	exit
.LVL24:
	.cfi_endproc
.LFE1:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1c7
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
	.string	"cat"
	.byte	0x1
	.byte	0x8
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xa1
	.uleb128 0x5
	.string	"fd"
	.byte	0x1
	.byte	0x8
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"n"
	.byte	0x1
	.byte	0xa
	.long	0x41
	.long	.LLST1
	.uleb128 0x7
	.long	.LVL2
	.long	0x17c
	.uleb128 0x7
	.long	.LVL4
	.long	0x189
	.uleb128 0x7
	.long	.LVL6
	.long	0x196
	.uleb128 0x7
	.long	.LVL7
	.long	0x1a3
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0x15
	.byte	0x1
	.long	0x41
	.long	.LFB1
	.long	.LFE1
	.long	.LLST2
	.byte	0x1
	.long	0x13f
	.uleb128 0x9
	.long	.LASF4
	.byte	0x1
	.byte	0x15
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x9
	.long	.LASF5
	.byte	0x1
	.byte	0x15
	.long	0x13f
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.string	"fd"
	.byte	0x1
	.byte	0x17
	.long	0x41
	.long	.LLST3
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x17
	.long	0x41
	.long	.LLST4
	.uleb128 0x7
	.long	.LVL9
	.long	0x48
	.uleb128 0x7
	.long	.LVL10
	.long	0x1a3
	.uleb128 0x7
	.long	.LVL15
	.long	0x1b0
	.uleb128 0x7
	.long	.LVL19
	.long	0x196
	.uleb128 0x7
	.long	.LVL20
	.long	0x1a3
	.uleb128 0x7
	.long	.LVL21
	.long	0x48
	.uleb128 0x7
	.long	.LVL22
	.long	0x1bd
	.uleb128 0x7
	.long	.LVL24
	.long	0x1a3
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x145
	.uleb128 0xa
	.byte	0x4
	.long	0x14b
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0xb
	.long	0x14b
	.long	0x163
	.uleb128 0xc
	.long	0x163
	.value	0x1ff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0xd
	.string	"buf"
	.byte	0x1
	.byte	0x5
	.long	0x152
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	buf
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF8
	.long	.LASF8
	.byte	0x2
	.byte	0xb
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF9
	.long	.LASF9
	.byte	0x2
	.byte	0xc
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF10
	.long	.LASF10
	.byte	0x2
	.byte	0x8e
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF11
	.long	.LASF11
	.byte	0x2
	.byte	0x8
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF12
	.long	.LASF12
	.byte	0x2
	.byte	0x10
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF13
	.long	.LASF13
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
	.uleb128 0x9
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
	.uleb128 0x5
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.long	.LVL1-.Ltext0
	.long	.LVL2-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL2-1-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL5-.Ltext0
	.long	.LVL6-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL6-1-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL7-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x1
	.byte	0x50
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
.LLST3:
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL17-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL20-.Ltext0
	.long	.LVL21-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LLST4:
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL12-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL23-.Ltext0
	.long	.LFE1-.Ltext0
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
.LASF12:
	.string	"open"
.LASF0:
	.string	"unsigned int"
.LASF16:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF13:
	.string	"close"
.LASF8:
	.string	"write"
.LASF2:
	.string	"unsigned char"
.LASF17:
	.string	"main"
.LASF5:
	.string	"argv"
.LASF4:
	.string	"argc"
.LASF9:
	.string	"read"
.LASF1:
	.string	"short unsigned int"
.LASF10:
	.string	"printf"
.LASF15:
	.string	"cat.c"
.LASF7:
	.string	"sizetype"
.LASF11:
	.string	"exit"
.LASF3:
	.string	"short int"
.LASF14:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF6:
	.string	"char"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
