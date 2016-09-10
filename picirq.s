	.file	"picirq.c"
	.text
.Ltext0:
	.type	outb, @function
outb:
.LFB2:
	.file 1 "x86.h"
	.loc 1 23 0
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
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movw	%dx, -4(%ebp)
	movb	%al, -8(%ebp)
	.loc 1 24 0
	movzbl	-8(%ebp), %eax
	movzwl	-4(%ebp), %edx
#APP
# 24 "x86.h" 1
	out %al,%dx
# 0 "" 2
	.loc 1 25 0
#NO_APP
	nop
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	outb, .-outb
	.data
	.align 2
	.type	irqmask, @object
	.size	irqmask, 2
irqmask:
	.value	-5
	.text
	.type	picsetmask, @function
picsetmask:
.LFB18:
	.file 2 "picirq.c"
	.loc 2 19 0
	.cfi_startproc
.LVL1:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	.loc 2 20 0
	movzwl	-4(%ebp), %eax
	movw	%ax, irqmask
	.loc 2 21 0
	movzwl	-4(%ebp), %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$33
	call	outb
.LVL2:
	addl	$8, %esp
	.loc 2 22 0
	movzwl	-4(%ebp), %eax
	shrw	$8, %ax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$161
	call	outb
.LVL3:
	addl	$8, %esp
	.loc 2 23 0
	nop
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	picsetmask, .-picsetmask
	.globl	picenable
	.type	picenable, @function
picenable:
.LFB19:
	.loc 2 27 0
	.cfi_startproc
.LVL4:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	.loc 2 28 0
	movl	8(%ebp), %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	notl	%eax
	movl	%eax, %edx
	movzwl	irqmask, %eax
	andl	%edx, %eax
	movzwl	%ax, %eax
	pushl	%eax
	call	picsetmask
.LVL5:
	addl	$4, %esp
	.loc 2 29 0
	nop
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	picenable, .-picenable
	.globl	picinit
	.type	picinit, @function
picinit:
.LFB20:
	.loc 2 34 0
	.cfi_startproc
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	.loc 2 36 0
	pushl	$255
	pushl	$33
	call	outb
.LVL6:
	addl	$8, %esp
	.loc 2 37 0
	pushl	$255
	pushl	$161
	call	outb
.LVL7:
	addl	$8, %esp
	.loc 2 45 0
	pushl	$17
	pushl	$32
	call	outb
.LVL8:
	addl	$8, %esp
	.loc 2 48 0
	pushl	$32
	pushl	$33
	call	outb
.LVL9:
	addl	$8, %esp
	.loc 2 52 0
	pushl	$4
	pushl	$33
	call	outb
.LVL10:
	addl	$8, %esp
	.loc 2 62 0
	pushl	$3
	pushl	$33
	call	outb
.LVL11:
	addl	$8, %esp
	.loc 2 65 0
	pushl	$17
	pushl	$160
	call	outb
.LVL12:
	addl	$8, %esp
	.loc 2 66 0
	pushl	$40
	pushl	$161
	call	outb
.LVL13:
	addl	$8, %esp
	.loc 2 67 0
	pushl	$2
	pushl	$161
	call	outb
.LVL14:
	addl	$8, %esp
	.loc 2 70 0
	pushl	$3
	pushl	$161
	call	outb
.LVL15:
	addl	$8, %esp
	.loc 2 76 0
	pushl	$104
	pushl	$32
	call	outb
.LVL16:
	addl	$8, %esp
	.loc 2 77 0
	pushl	$10
	pushl	$32
	call	outb
.LVL17:
	addl	$8, %esp
	.loc 2 79 0
	pushl	$104
	pushl	$160
	call	outb
.LVL18:
	addl	$8, %esp
	.loc 2 80 0
	pushl	$10
	pushl	$160
	call	outb
.LVL19:
	addl	$8, %esp
	.loc 2 82 0
	movzwl	irqmask, %eax
	cmpw	$-1, %ax
	je	.L6
	.loc 2 83 0
	movzwl	irqmask, %eax
	movzwl	%ax, %eax
	pushl	%eax
	call	picsetmask
.LVL20:
	addl	$4, %esp
.L6:
	.loc 2 84 0
	nop
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	picinit, .-picinit
.Letext0:
	.file 3 "types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1a9
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
	.uleb128 0x3
	.long	.LASF2
	.byte	0x3
	.byte	0x2
	.long	0x37
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x3
	.byte	0x3
	.long	0x49
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x4
	.long	.LASF7
	.byte	0x1
	.byte	0x16
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST0
	.byte	0x1
	.long	0x86
	.uleb128 0x5
	.long	.LASF5
	.byte	0x1
	.byte	0x16
	.long	0x2c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.long	.LASF6
	.byte	0x1
	.byte	0x16
	.long	0x3e
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x4
	.long	.LASF8
	.byte	0x2
	.byte	0x12
	.byte	0x1
	.long	.LFB18
	.long	.LFE18
	.long	.LLST1
	.byte	0x1
	.long	0xc0
	.uleb128 0x5
	.long	.LASF9
	.byte	0x2
	.byte	0x12
	.long	0x2c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.long	.LVL2
	.long	0x50
	.uleb128 0x6
	.long	.LVL3
	.long	0x50
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF10
	.byte	0x2
	.byte	0x1a
	.byte	0x1
	.long	.LFB19
	.long	.LFE19
	.long	.LLST2
	.byte	0x1
	.long	0xf2
	.uleb128 0x8
	.string	"irq"
	.byte	0x2
	.byte	0x1a
	.long	0xf2
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.long	.LVL5
	.long	0x86
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x7
	.byte	0x1
	.long	.LASF11
	.byte	0x2
	.byte	0x21
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST3
	.byte	0x1
	.long	0x19b
	.uleb128 0x6
	.long	.LVL6
	.long	0x50
	.uleb128 0x6
	.long	.LVL7
	.long	0x50
	.uleb128 0x6
	.long	.LVL8
	.long	0x50
	.uleb128 0x6
	.long	.LVL9
	.long	0x50
	.uleb128 0x6
	.long	.LVL10
	.long	0x50
	.uleb128 0x6
	.long	.LVL11
	.long	0x50
	.uleb128 0x6
	.long	.LVL12
	.long	0x50
	.uleb128 0x6
	.long	.LVL13
	.long	0x50
	.uleb128 0x6
	.long	.LVL14
	.long	0x50
	.uleb128 0x6
	.long	.LVL15
	.long	0x50
	.uleb128 0x6
	.long	.LVL16
	.long	0x50
	.uleb128 0x6
	.long	.LVL17
	.long	0x50
	.uleb128 0x6
	.long	.LVL18
	.long	0x50
	.uleb128 0x6
	.long	.LVL19
	.long	0x50
	.uleb128 0x6
	.long	.LVL20
	.long	0x86
	.byte	0
	.uleb128 0xa
	.long	.LASF15
	.byte	0x2
	.byte	0xf
	.long	0x2c
	.byte	0x5
	.byte	0x3
	.long	irqmask
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB2-.Ltext0
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
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB18-.Ltext0
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
	.long	.LFE18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB19-.Ltext0
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
	.long	.LFE19-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LFB20-.Ltext0
	.long	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI9-.Ltext0
	.long	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI10-.Ltext0
	.long	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI11-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
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
	.string	"picirq.c"
.LASF11:
	.string	"picinit"
.LASF10:
	.string	"picenable"
.LASF6:
	.string	"data"
.LASF4:
	.string	"unsigned char"
.LASF15:
	.string	"irqmask"
.LASF1:
	.string	"short unsigned int"
.LASF3:
	.string	"uchar"
.LASF14:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF8:
	.string	"picsetmask"
.LASF7:
	.string	"outb"
.LASF0:
	.string	"unsigned int"
.LASF2:
	.string	"ushort"
.LASF12:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF9:
	.string	"mask"
.LASF5:
	.string	"port"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
