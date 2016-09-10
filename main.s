	.file	"main.c"
	.text
.Ltext0:
	.type	v2p, @function
v2p:
.LFB0:
	.file 1 "memlayout.h"
	.loc 1 13 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	.loc 1 13 0
	movl	8(%ebp), %eax
	addl	$-2147483648, %eax
	popl	%ebp
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	v2p, .-v2p
	.type	p2v, @function
p2v:
.LFB1:
	.loc 1 14 0
	.cfi_startproc
.LVL1:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	.loc 1 14 0
	movl	8(%ebp), %eax
	addl	$-2147483648, %eax
	popl	%ebp
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	p2v, .-p2v
	.type	xchg, @function
xchg:
.LFB16:
	.file 2 "x86.h"
	.loc 2 122 0
	.cfi_startproc
.LVL2:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 2 126 0
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
#APP
# 126 "x86.h" 1
	lock; xchgl (%edx), %eax
# 0 "" 2
#NO_APP
	movl	%eax, -4(%ebp)
.LVL3:
	.loc 2 130 0
	movl	-4(%ebp), %eax
	.loc 2 131 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	xchg, .-xchg
	.section	.rodata
.LC0:
	.string	"\ncpu%d: starting xv6\n\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB20:
	.file 3 "main.c"
	.loc 3 19 0
	.cfi_startproc
	leal	4(%esp), %ecx
.LCFI9:
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
.LCFI10:
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$4, %esp
	.loc 3 22 0
	subl	$8, %esp
	pushl	$-2143289344
	pushl	$end
	call	kinit1
.LVL4:
	addl	$16, %esp
	.loc 3 23 0
	call	kvmalloc
.LVL5:
	.loc 3 24 0
	call	mpinit
.LVL6:
	.loc 3 25 0
	call	lapicinit
.LVL7:
	.loc 3 26 0
	call	seginit
.LVL8:
	.loc 3 27 0
	movl	%gs:0, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC0
	call	cprintf
.LVL9:
	addl	$16, %esp
	.loc 3 28 0
	call	picinit
.LVL10:
	.loc 3 29 0
	call	ioapicinit
.LVL11:
	.loc 3 30 0
	call	consoleinit
.LVL12:
	.loc 3 31 0
	call	uartinit
.LVL13:
	.loc 3 32 0
	call	pinit
.LVL14:
	.loc 3 33 0
	call	tvinit
.LVL15:
	.loc 3 34 0
	call	binit
.LVL16:
	.loc 3 35 0
	call	fileinit
.LVL17:
	.loc 3 36 0
	call	ideinit
.LVL18:
	.loc 3 37 0
	movl	ismp, %eax
	testl	%eax, %eax
	jne	.L8
	.loc 3 38 0
	call	timerinit
.LVL19:
.L8:
	.loc 3 39 0
	call	startothers
.LVL20:
	.loc 3 40 0
	subl	$8, %esp
	pushl	$-1912602624
	pushl	$-2143289344
	call	kinit2
.LVL21:
	addl	$16, %esp
	.loc 3 41 0
	call	userinit
.LVL22:
	.loc 3 43 0
	call	mpmain
.LVL23:
	.cfi_endproc
.LFE20:
	.size	main, .-main
	.type	mpenter, @function
mpenter:
.LFB21:
	.loc 3 49 0
	.cfi_startproc
	pushl	%ebp
.LCFI11:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI12:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 3 50 0
	call	switchkvm
.LVL24:
	.loc 3 51 0
	call	seginit
.LVL25:
	.loc 3 52 0
	call	lapicinit
.LVL26:
	.loc 3 53 0
	call	mpmain
.LVL27:
	.cfi_endproc
.LFE21:
	.size	mpenter, .-mpenter
	.section	.rodata
.LC1:
	.string	"cpu%d: starting\n"
	.text
	.type	mpmain, @function
mpmain:
.LFB22:
	.loc 3 59 0
	.cfi_startproc
	pushl	%ebp
.LCFI13:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI14:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 3 60 0
	movl	%gs:0, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC1
	call	cprintf
.LVL28:
	addl	$16, %esp
	.loc 3 61 0
	call	idtinit
.LVL29:
	.loc 3 62 0
	movl	%gs:0, %eax
	addl	$168, %eax
	subl	$8, %esp
	pushl	$1
	pushl	%eax
	call	xchg
.LVL30:
	addl	$16, %esp
	.loc 3 63 0
	call	scheduler
.LVL31:
	.cfi_endproc
.LFE22:
	.size	mpmain, .-mpmain
	.globl	entrypgdir
	.data
	.align 4096
	.type	entrypgdir, @object
	.size	entrypgdir, 4096
entrypgdir:
	.long	131
	.zero	2044
	.long	131
	.zero	2044
	.text
	.type	startothers, @function
startothers:
.LFB23:
	.loc 3 71 0
	.cfi_startproc
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	.loc 3 80 0
	pushl	$28672
	call	p2v
.LVL32:
	addl	$4, %esp
	movl	%eax, -16(%ebp)
.LVL33:
	.loc 3 81 0
	movl	$_binary_entryother_size, %eax
.LVL34:
	subl	$4, %esp
	pushl	%eax
	pushl	$_binary_entryother_start
	pushl	-16(%ebp)
	call	memmove
.LVL35:
	addl	$16, %esp
	.loc 3 83 0
	movl	$cpus, -12(%ebp)
.LVL36:
	jmp	.L12
.L16:
	.loc 3 84 0
	call	cpunum
.LVL37:
	imull	$188, %eax, %eax
	addl	$cpus, %eax
	cmpl	-12(%ebp), %eax
	je	.L17
	.loc 3 90 0
	call	kalloc
.LVL38:
	movl	%eax, -20(%ebp)
.LVL39:
	.loc 3 91 0
	movl	-16(%ebp), %eax
.LVL40:
	subl	$4, %eax
	movl	-20(%ebp), %edx
	addl	$4096, %edx
	movl	%edx, (%eax)
	.loc 3 92 0
	movl	-16(%ebp), %eax
	subl	$8, %eax
	movl	$mpenter, (%eax)
	.loc 3 93 0
	movl	-16(%ebp), %eax
	leal	-12(%eax), %ebx
	subl	$12, %esp
	pushl	$entrypgdir
	call	v2p
.LVL41:
	addl	$16, %esp
	movl	%eax, (%ebx)
	.loc 3 95 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	v2p
.LVL42:
	addl	$16, %esp
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	lapicstartap
.LVL43:
	addl	$16, %esp
	.loc 3 98 0
	nop
.L15:
	.loc 3 98 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	168(%eax), %eax
	testl	%eax, %eax
	je	.L15
	jmp	.L14
.LVL44:
.L17:
	.loc 3 85 0 is_stmt 1
	nop
.L14:
	.loc 3 83 0 discriminator 2
	addl	$188, -12(%ebp)
.L12:
	.loc 3 83 0 is_stmt 0 discriminator 1
	movl	ncpu, %eax
	imull	$188, %eax, %eax
	addl	$cpus, %eax
	cmpl	-12(%ebp), %eax
	ja	.L16
	.loc 3 101 0 is_stmt 1
	nop
	movl	-4(%ebp), %ebx
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
.LVL45:
	ret
	.cfi_endproc
.LFE23:
	.size	startothers, .-startothers
.Letext0:
	.file 4 "types.h"
	.file 5 "mmu.h"
	.file 6 "proc.h"
	.file 7 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xb9d
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF98
	.byte	0xc
	.long	.LASF99
	.long	.LASF100
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x4
	.byte	0x1
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x4
	.byte	0x2
	.long	0x42
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x4
	.byte	0x3
	.long	0x54
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x2
	.long	.LASF6
	.byte	0x4
	.byte	0x4
	.long	0x25
	.uleb128 0x4
	.long	.LASF14
	.byte	0x8
	.byte	0x5
	.byte	0x34
	.long	0x149
	.uleb128 0x5
	.long	.LASF7
	.byte	0x5
	.byte	0x35
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF8
	.byte	0x5
	.byte	0x36
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF9
	.byte	0x5
	.byte	0x37
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF10
	.byte	0x5
	.byte	0x38
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"s"
	.byte	0x5
	.byte	0x39
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"dpl"
	.byte	0x5
	.byte	0x3a
	.long	0x25
	.byte	0x4
	.byte	0x2
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"p"
	.byte	0x5
	.byte	0x3b
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF11
	.byte	0x5
	.byte	0x3c
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"avl"
	.byte	0x5
	.byte	0x3d
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF12
	.byte	0x5
	.byte	0x3e
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"db"
	.byte	0x5
	.byte	0x3f
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"g"
	.byte	0x5
	.byte	0x40
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF13
	.byte	0x5
	.byte	0x41
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x4
	.long	.LASF15
	.byte	0x68
	.byte	0x5
	.byte	0x97
	.long	0x354
	.uleb128 0x7
	.long	.LASF16
	.byte	0x5
	.byte	0x98
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF17
	.byte	0x5
	.byte	0x99
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ss0"
	.byte	0x5
	.byte	0x9a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF18
	.byte	0x5
	.byte	0x9b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x7
	.long	.LASF19
	.byte	0x5
	.byte	0x9c
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"ss1"
	.byte	0x5
	.byte	0x9d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF20
	.byte	0x5
	.byte	0x9e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x7
	.long	.LASF21
	.byte	0x5
	.byte	0x9f
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"ss2"
	.byte	0x5
	.byte	0xa0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.long	.LASF22
	.byte	0x5
	.byte	0xa1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x8
	.string	"cr3"
	.byte	0x5
	.byte	0xa2
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.string	"eip"
	.byte	0x5
	.byte	0xa3
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF23
	.byte	0x5
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.string	"eax"
	.byte	0x5
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.string	"ecx"
	.byte	0x5
	.byte	0xa6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.string	"edx"
	.byte	0x5
	.byte	0xa7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.string	"ebx"
	.byte	0x5
	.byte	0xa8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.string	"esp"
	.byte	0x5
	.byte	0xa9
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.string	"ebp"
	.byte	0x5
	.byte	0xaa
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x8
	.string	"esi"
	.byte	0x5
	.byte	0xab
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.string	"edi"
	.byte	0x5
	.byte	0xac
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.string	"es"
	.byte	0x5
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x7
	.long	.LASF24
	.byte	0x5
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x8
	.string	"cs"
	.byte	0x5
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x7
	.long	.LASF25
	.byte	0x5
	.byte	0xb0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x8
	.string	"ss"
	.byte	0x5
	.byte	0xb1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x7
	.long	.LASF26
	.byte	0x5
	.byte	0xb2
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x8
	.string	"ds"
	.byte	0x5
	.byte	0xb3
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x7
	.long	.LASF27
	.byte	0x5
	.byte	0xb4
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x8
	.string	"fs"
	.byte	0x5
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x7
	.long	.LASF28
	.byte	0x5
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x8
	.string	"gs"
	.byte	0x5
	.byte	0xb7
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x7
	.long	.LASF29
	.byte	0x5
	.byte	0xb8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x8
	.string	"ldt"
	.byte	0x5
	.byte	0xb9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x7
	.long	.LASF30
	.byte	0x5
	.byte	0xba
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x8
	.string	"t"
	.byte	0x5
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x7
	.long	.LASF31
	.byte	0x5
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x25
	.uleb128 0xa
	.byte	0x4
	.uleb128 0xb
	.string	"cpu"
	.byte	0xbc
	.byte	0x6
	.byte	0x5
	.long	0x3ea
	.uleb128 0x8
	.string	"id"
	.byte	0x6
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x6
	.byte	0x7
	.long	0x43d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ts"
	.byte	0x6
	.byte	0x8
	.long	0x149
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"gdt"
	.byte	0x6
	.byte	0x9
	.long	0x443
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x7
	.long	.LASF33
	.byte	0x6
	.byte	0xa
	.long	0x45a
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x7
	.long	.LASF34
	.byte	0x6
	.byte	0xb
	.long	0x45f
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x7
	.long	.LASF35
	.byte	0x6
	.byte	0xc
	.long	0x45f
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x8
	.string	"cpu"
	.byte	0x6
	.byte	0xf
	.long	0x466
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x7
	.long	.LASF36
	.byte	0x6
	.byte	0x10
	.long	0x52d
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x4
	.long	.LASF37
	.byte	0x14
	.byte	0x6
	.byte	0x2c
	.long	0x43d
	.uleb128 0x8
	.string	"edi"
	.byte	0x6
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"esi"
	.byte	0x6
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ebx"
	.byte	0x6
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"ebp"
	.byte	0x6
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"eip"
	.byte	0x6
	.byte	0x31
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x3ea
	.uleb128 0xc
	.long	0x66
	.long	0x453
	.uleb128 0xd
	.long	0x453
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF38
	.uleb128 0xe
	.long	0x25
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x9
	.byte	0x4
	.long	0x35c
	.uleb128 0x4
	.long	.LASF36
	.byte	0x7c
	.byte	0x6
	.byte	0x37
	.long	0x52d
	.uleb128 0x8
	.string	"sz"
	.byte	0x6
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF39
	.byte	0x6
	.byte	0x39
	.long	0x568
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF40
	.byte	0x6
	.byte	0x3a
	.long	0x56e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF41
	.byte	0x6
	.byte	0x3b
	.long	0x533
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"pid"
	.byte	0x6
	.byte	0x3c
	.long	0x45f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF42
	.byte	0x6
	.byte	0x3d
	.long	0x52d
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"tf"
	.byte	0x6
	.byte	0x3e
	.long	0x6e0
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.long	.LASF37
	.byte	0x6
	.byte	0x3f
	.long	0x43d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.long	.LASF43
	.byte	0x6
	.byte	0x40
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF44
	.byte	0x6
	.byte	0x41
	.long	0x45f
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.long	.LASF45
	.byte	0x6
	.byte	0x42
	.long	0x6e6
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.string	"cwd"
	.byte	0x6
	.byte	0x43
	.long	0x708
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x7
	.long	.LASF46
	.byte	0x6
	.byte	0x44
	.long	0x70e
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x46c
	.uleb128 0x10
	.long	.LASF101
	.byte	0x4
	.long	0x30
	.byte	0x6
	.byte	0x34
	.long	0x568
	.uleb128 0x11
	.long	.LASF47
	.byte	0
	.uleb128 0x11
	.long	.LASF48
	.byte	0x1
	.uleb128 0x11
	.long	.LASF49
	.byte	0x2
	.uleb128 0x11
	.long	.LASF50
	.byte	0x3
	.uleb128 0x11
	.long	.LASF51
	.byte	0x4
	.uleb128 0x11
	.long	.LASF52
	.byte	0x5
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x5b
	.uleb128 0x9
	.byte	0x4
	.long	0x574
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF53
	.uleb128 0x4
	.long	.LASF54
	.byte	0x4c
	.byte	0x2
	.byte	0x9c
	.long	0x6e0
	.uleb128 0x8
	.string	"edi"
	.byte	0x2
	.byte	0x9e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"esi"
	.byte	0x2
	.byte	0x9f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ebp"
	.byte	0x2
	.byte	0xa0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF55
	.byte	0x2
	.byte	0xa1
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"ebx"
	.byte	0x2
	.byte	0xa2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.string	"edx"
	.byte	0x2
	.byte	0xa3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"ecx"
	.byte	0x2
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.string	"eax"
	.byte	0x2
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.string	"gs"
	.byte	0x2
	.byte	0xa8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF18
	.byte	0x2
	.byte	0xa9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x8
	.string	"fs"
	.byte	0x2
	.byte	0xaa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.long	.LASF20
	.byte	0x2
	.byte	0xab
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x8
	.string	"es"
	.byte	0x2
	.byte	0xac
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x7
	.long	.LASF22
	.byte	0x2
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x8
	.string	"ds"
	.byte	0x2
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x7
	.long	.LASF24
	.byte	0x2
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x7
	.long	.LASF56
	.byte	0x2
	.byte	0xb0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.string	"err"
	.byte	0x2
	.byte	0xb3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.string	"eip"
	.byte	0x2
	.byte	0xb4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.string	"cs"
	.byte	0x2
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x7
	.long	.LASF25
	.byte	0x2
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x7
	.long	.LASF23
	.byte	0x2
	.byte	0xb7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.string	"esp"
	.byte	0x2
	.byte	0xba
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.string	"ss"
	.byte	0x2
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x7
	.long	.LASF26
	.byte	0x2
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x57b
	.uleb128 0xc
	.long	0x6f6
	.long	0x6f6
	.uleb128 0xd
	.long	0x453
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x6fc
	.uleb128 0x12
	.long	.LASF57
	.byte	0x1
	.uleb128 0x12
	.long	.LASF58
	.byte	0x1
	.uleb128 0x9
	.byte	0x4
	.long	0x702
	.uleb128 0xc
	.long	0x574
	.long	0x71e
	.uleb128 0xd
	.long	0x453
	.byte	0xf
	.byte	0
	.uleb128 0x13
	.string	"v2p"
	.byte	0x1
	.byte	0xd
	.byte	0x1
	.long	0x25
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x748
	.uleb128 0x14
	.string	"a"
	.byte	0x1
	.byte	0xd
	.long	0x35a
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.string	"p2v"
	.byte	0x1
	.byte	0xe
	.byte	0x1
	.long	0x35a
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x772
	.uleb128 0x14
	.string	"a"
	.byte	0x1
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.long	.LASF59
	.byte	0x2
	.byte	0x79
	.byte	0x1
	.long	0x25
	.long	.LFB16
	.long	.LFE16
	.long	.LLST2
	.byte	0x1
	.long	0x7b9
	.uleb128 0x16
	.long	.LASF60
	.byte	0x2
	.byte	0x79
	.long	0x7b9
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.long	.LASF61
	.byte	0x2
	.byte	0x79
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.long	.LASF67
	.byte	0x2
	.byte	0x7b
	.long	0x25
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x45a
	.uleb128 0x18
	.byte	0x1
	.long	.LASF102
	.byte	0x3
	.byte	0x12
	.byte	0x1
	.long	0x45f
	.long	.LFB20
	.long	.LFE20
	.long	.LLST3
	.byte	0x1
	.long	0x892
	.uleb128 0x19
	.long	.LVL4
	.long	0xa5b
	.uleb128 0x19
	.long	.LVL5
	.long	0xa68
	.uleb128 0x19
	.long	.LVL6
	.long	0xa75
	.uleb128 0x19
	.long	.LVL7
	.long	0xa82
	.uleb128 0x19
	.long	.LVL8
	.long	0xa8f
	.uleb128 0x19
	.long	.LVL9
	.long	0xa9c
	.uleb128 0x19
	.long	.LVL10
	.long	0xaa9
	.uleb128 0x19
	.long	.LVL11
	.long	0xab6
	.uleb128 0x19
	.long	.LVL12
	.long	0xac3
	.uleb128 0x19
	.long	.LVL13
	.long	0xad0
	.uleb128 0x19
	.long	.LVL14
	.long	0xadd
	.uleb128 0x19
	.long	.LVL15
	.long	0xaea
	.uleb128 0x19
	.long	.LVL16
	.long	0xaf7
	.uleb128 0x19
	.long	.LVL17
	.long	0xb04
	.uleb128 0x19
	.long	.LVL18
	.long	0xb11
	.uleb128 0x19
	.long	.LVL19
	.long	0xb1e
	.uleb128 0x19
	.long	.LVL20
	.long	0x90f
	.uleb128 0x19
	.long	.LVL21
	.long	0xb2b
	.uleb128 0x19
	.long	.LVL22
	.long	0xb38
	.uleb128 0x19
	.long	.LVL23
	.long	0x8d0
	.byte	0
	.uleb128 0x1a
	.long	.LASF63
	.byte	0x3
	.byte	0x30
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST4
	.byte	0x1
	.long	0x8d0
	.uleb128 0x19
	.long	.LVL24
	.long	0xb45
	.uleb128 0x19
	.long	.LVL25
	.long	0xa8f
	.uleb128 0x19
	.long	.LVL26
	.long	0xa82
	.uleb128 0x19
	.long	.LVL27
	.long	0x8d0
	.byte	0
	.uleb128 0x1b
	.long	.LASF62
	.byte	0x3
	.byte	0x3a
	.byte	0x1
	.byte	0x1
	.long	.LFB22
	.long	.LFE22
	.long	.LLST5
	.byte	0x1
	.long	0x90f
	.uleb128 0x19
	.long	.LVL28
	.long	0xa9c
	.uleb128 0x19
	.long	.LVL29
	.long	0xb52
	.uleb128 0x19
	.long	.LVL30
	.long	0x772
	.uleb128 0x19
	.long	.LVL31
	.long	0xb5f
	.byte	0
	.uleb128 0x1a
	.long	.LASF64
	.byte	0x3
	.byte	0x46
	.byte	0x1
	.long	.LFB23
	.long	.LFE23
	.long	.LLST6
	.byte	0x1
	.long	0x9ad
	.uleb128 0x1c
	.long	.LASF65
	.byte	0x3
	.byte	0x48
	.long	0x9ad
	.byte	0x1
	.byte	0x1
	.uleb128 0x1c
	.long	.LASF66
	.byte	0x3
	.byte	0x48
	.long	0x9ad
	.byte	0x1
	.byte	0x1
	.uleb128 0x1d
	.long	.LASF68
	.byte	0x3
	.byte	0x49
	.long	0x9b8
	.long	.LLST7
	.uleb128 0x1e
	.string	"c"
	.byte	0x3
	.byte	0x4a
	.long	0x466
	.long	.LLST8
	.uleb128 0x1d
	.long	.LASF69
	.byte	0x3
	.byte	0x4b
	.long	0x56e
	.long	.LLST9
	.uleb128 0x19
	.long	.LVL32
	.long	0x748
	.uleb128 0x19
	.long	.LVL35
	.long	0xb6c
	.uleb128 0x19
	.long	.LVL37
	.long	0xb79
	.uleb128 0x19
	.long	.LVL38
	.long	0xb86
	.uleb128 0x19
	.long	.LVL41
	.long	0x71e
	.uleb128 0x19
	.long	.LVL42
	.long	0x71e
	.uleb128 0x19
	.long	.LVL43
	.long	0xb93
	.byte	0
	.uleb128 0xc
	.long	0x49
	.long	0x9b8
	.uleb128 0x1f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x49
	.uleb128 0x1c
	.long	.LASF70
	.byte	0x7
	.byte	0x5a
	.long	0x45f
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	0x35c
	.long	0x9db
	.uleb128 0xd
	.long	0x453
	.byte	0x7
	.byte	0
	.uleb128 0x1c
	.long	.LASF71
	.byte	0x6
	.byte	0x13
	.long	0x9cb
	.byte	0x1
	.byte	0x1
	.uleb128 0x1c
	.long	.LASF72
	.byte	0x6
	.byte	0x14
	.long	0x45f
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.string	"cpu"
	.byte	0x6
	.byte	0x1e
	.long	.LASF103
	.long	0x466
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	0x574
	.long	0xa11
	.uleb128 0x1f
	.byte	0
	.uleb128 0x21
	.string	"end"
	.byte	0x3
	.byte	0xc
	.long	0xa06
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	0x5b
	.long	0xa2f
	.uleb128 0x22
	.long	0x453
	.value	0x3ff
	.byte	0
	.uleb128 0x23
	.long	.LASF73
	.byte	0x3
	.byte	0x6c
	.long	0xa1e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	entrypgdir
	.uleb128 0x1c
	.long	.LASF65
	.byte	0x3
	.byte	0x48
	.long	0x9ad
	.byte	0x1
	.byte	0x1
	.uleb128 0x1c
	.long	.LASF66
	.byte	0x3
	.byte	0x48
	.long	0x9ad
	.byte	0x1
	.byte	0x1
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF74
	.long	.LASF74
	.byte	0x7
	.byte	0x44
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF75
	.long	.LASF75
	.byte	0x7
	.byte	0xa7
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF76
	.long	.LASF76
	.byte	0x7
	.byte	0x5c
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF77
	.long	.LASF77
	.byte	0x7
	.byte	0x4f
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF78
	.long	.LASF78
	.byte	0x7
	.byte	0xa6
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF79
	.long	.LASF79
	.byte	0x7
	.byte	0x14
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF80
	.long	.LASF80
	.byte	0x7
	.byte	0x61
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF81
	.long	.LASF81
	.byte	0x7
	.byte	0x3f
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF82
	.long	.LASF82
	.byte	0x7
	.byte	0x13
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF83
	.long	.LASF83
	.byte	0x7
	.byte	0xa1
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF84
	.long	.LASF84
	.byte	0x7
	.byte	0x70
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF85
	.long	.LASF85
	.byte	0x7
	.byte	0x9d
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF86
	.long	.LASF86
	.byte	0x7
	.byte	0xd
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF87
	.long	.LASF87
	.byte	0x7
	.byte	0x1f
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF88
	.long	.LASF88
	.byte	0x7
	.byte	0x38
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF89
	.long	.LASF89
	.byte	0x7
	.byte	0x98
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF90
	.long	.LASF90
	.byte	0x7
	.byte	0x45
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF91
	.long	.LASF91
	.byte	0x7
	.byte	0x75
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF92
	.long	.LASF92
	.byte	0x7
	.byte	0xb2
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF93
	.long	.LASF93
	.byte	0x7
	.byte	0x9b
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF32
	.long	.LASF32
	.byte	0x7
	.byte	0x72
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF94
	.long	.LASF94
	.byte	0x7
	.byte	0x88
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF95
	.long	.LASF95
	.byte	0x7
	.byte	0x4c
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF96
	.long	.LASF96
	.byte	0x7
	.byte	0x42
	.uleb128 0x24
	.byte	0x1
	.byte	0x1
	.long	.LASF97
	.long	.LASF97
	.byte	0x7
	.byte	0x50
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
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x87
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
	.uleb128 0x1c
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.long	.LFB16-.Ltext0
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
	.long	.LFE16-.Ltext0
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
	.byte	0x71
	.sleb128 0
	.long	.LCFI10-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -4
	.byte	0x6
	.long	0
	.long	0
.LLST4:
	.long	.LFB21-.Ltext0
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
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST5:
	.long	.LFB22-.Ltext0
	.long	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI13-.Ltext0
	.long	.LCFI14-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI14-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST6:
	.long	.LFB23-.Ltext0
	.long	.LCFI15-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI15-.Ltext0
	.long	.LCFI16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI16-.Ltext0
	.long	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI17-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LVL33-.Ltext0
	.long	.LVL34-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL34-.Ltext0
	.long	.LVL45-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL45-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST8:
	.long	.LVL36-.Ltext0
	.long	.LVL45-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL45-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST9:
	.long	.LVL39-.Ltext0
	.long	.LVL40-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL40-.Ltext0
	.long	.LVL44-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -20
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
.LASF67:
	.string	"result"
.LASF48:
	.string	"EMBRYO"
.LASF71:
	.string	"cpus"
.LASF58:
	.string	"inode"
.LASF50:
	.string	"RUNNABLE"
.LASF63:
	.string	"mpenter"
.LASF41:
	.string	"state"
.LASF103:
	.string	"%gs:0"
.LASF78:
	.string	"seginit"
.LASF91:
	.string	"userinit"
.LASF85:
	.string	"tvinit"
.LASF8:
	.string	"base_15_0"
.LASF38:
	.string	"sizetype"
.LASF23:
	.string	"eflags"
.LASF54:
	.string	"trapframe"
.LASF12:
	.string	"rsv1"
.LASF102:
	.string	"main"
.LASF14:
	.string	"segdesc"
.LASF0:
	.string	"uint"
.LASF49:
	.string	"SLEEPING"
.LASF57:
	.string	"file"
.LASF66:
	.string	"_binary_entryother_size"
.LASF95:
	.string	"cpunum"
.LASF64:
	.string	"startothers"
.LASF80:
	.string	"picinit"
.LASF44:
	.string	"killed"
.LASF89:
	.string	"timerinit"
.LASF79:
	.string	"cprintf"
.LASF84:
	.string	"pinit"
.LASF16:
	.string	"link"
.LASF98:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF43:
	.string	"chan"
.LASF62:
	.string	"mpmain"
.LASF1:
	.string	"ushort"
.LASF20:
	.string	"padding2"
.LASF22:
	.string	"padding3"
.LASF24:
	.string	"padding4"
.LASF6:
	.string	"pde_t"
.LASF26:
	.string	"padding6"
.LASF29:
	.string	"padding9"
.LASF18:
	.string	"padding1"
.LASF94:
	.string	"memmove"
.LASF13:
	.string	"base_31_24"
.LASF4:
	.string	"uchar"
.LASF65:
	.string	"_binary_entryother_start"
.LASF25:
	.string	"padding5"
.LASF87:
	.string	"fileinit"
.LASF42:
	.string	"parent"
.LASF28:
	.string	"padding8"
.LASF7:
	.string	"lim_15_0"
.LASF9:
	.string	"base_23_16"
.LASF45:
	.string	"ofile"
.LASF5:
	.string	"unsigned char"
.LASF27:
	.string	"padding7"
.LASF61:
	.string	"newval"
.LASF73:
	.string	"entrypgdir"
.LASF82:
	.string	"consoleinit"
.LASF31:
	.string	"iomb"
.LASF36:
	.string	"proc"
.LASF10:
	.string	"type"
.LASF92:
	.string	"switchkvm"
.LASF2:
	.string	"unsigned int"
.LASF75:
	.string	"kvmalloc"
.LASF69:
	.string	"stack"
.LASF37:
	.string	"context"
.LASF68:
	.string	"code"
.LASF97:
	.string	"lapicstartap"
.LASF51:
	.string	"RUNNING"
.LASF33:
	.string	"started"
.LASF40:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF17:
	.string	"esp0"
.LASF19:
	.string	"esp1"
.LASF21:
	.string	"esp2"
.LASF53:
	.string	"char"
.LASF60:
	.string	"addr"
.LASF88:
	.string	"ideinit"
.LASF47:
	.string	"UNUSED"
.LASF30:
	.string	"padding10"
.LASF99:
	.string	"main.c"
.LASF56:
	.string	"trapno"
.LASF70:
	.string	"ismp"
.LASF72:
	.string	"ncpu"
.LASF86:
	.string	"binit"
.LASF35:
	.string	"intena"
.LASF32:
	.string	"scheduler"
.LASF15:
	.string	"taskstate"
.LASF76:
	.string	"mpinit"
.LASF11:
	.string	"lim_19_16"
.LASF46:
	.string	"name"
.LASF83:
	.string	"uartinit"
.LASF55:
	.string	"oesp"
.LASF101:
	.string	"procstate"
.LASF39:
	.string	"pgdir"
.LASF74:
	.string	"kinit1"
.LASF90:
	.string	"kinit2"
.LASF93:
	.string	"idtinit"
.LASF34:
	.string	"ncli"
.LASF81:
	.string	"ioapicinit"
.LASF100:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF77:
	.string	"lapicinit"
.LASF52:
	.string	"ZOMBIE"
.LASF59:
	.string	"xchg"
.LASF96:
	.string	"kalloc"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
