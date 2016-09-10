	.file	"pipe.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"pipe"
	.text
	.globl	pipealloc
	.type	pipealloc, @function
pipealloc:
.LFB0:
	.file 1 "pipe.c"
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
	subl	$24, %esp
	.loc 1 26 0
	movl	$0, -12(%ebp)
.LVL1:
	.loc 1 27 0
	movl	12(%ebp), %eax
	movl	$0, (%eax)
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 28 0
	call	filealloc
.LVL2:
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L2
	.loc 1 28 0 is_stmt 0 discriminator 1
	call	filealloc
.LVL3:
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L2
	.loc 1 30 0 is_stmt 1
	call	kalloc
.LVL4:
	movl	%eax, -12(%ebp)
.LVL5:
	cmpl	$0, -12(%ebp)
	je	.L8
	.loc 1 32 0
	movl	-12(%ebp), %eax
	movl	$1, 572(%eax)
	.loc 1 33 0
	movl	-12(%ebp), %eax
	movl	$1, 576(%eax)
	.loc 1 34 0
	movl	-12(%ebp), %eax
	movl	$0, 568(%eax)
	.loc 1 35 0
	movl	-12(%ebp), %eax
	movl	$0, 564(%eax)
	.loc 1 36 0
	movl	-12(%ebp), %eax
	subl	$8, %esp
	pushl	$.LC0
	pushl	%eax
	call	initlock
.LVL6:
	addl	$16, %esp
	.loc 1 37 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	$1, (%eax)
	.loc 1 38 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movb	$1, 8(%eax)
	.loc 1 39 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movb	$0, 9(%eax)
	.loc 1 40 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 12(%eax)
	.loc 1 41 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	$1, (%eax)
	.loc 1 42 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movb	$0, 8(%eax)
	.loc 1 43 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movb	$1, 9(%eax)
	.loc 1 44 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 12(%eax)
	.loc 1 45 0
	movl	$0, %eax
	jmp	.L4
.LVL7:
.L8:
	.loc 1 31 0
	nop
.LVL8:
.L2:
	.loc 1 49 0
	cmpl	$0, -12(%ebp)
	je	.L5
	.loc 1 50 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	kfree
.LVL9:
	addl	$16, %esp
.L5:
	.loc 1 51 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L6
	.loc 1 52 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	fileclose
.LVL10:
	addl	$16, %esp
.L6:
	.loc 1 53 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L7
	.loc 1 54 0
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	fileclose
.LVL11:
	addl	$16, %esp
.L7:
	.loc 1 55 0
	movl	$-1, %eax
.L4:
	.loc 1 56 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	pipealloc, .-pipealloc
	.globl	pipeclose
	.type	pipeclose, @function
pipeclose:
.LFB1:
	.loc 1 60 0
	.cfi_startproc
.LVL12:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 61 0
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	acquire
.LVL13:
	addl	$16, %esp
	.loc 1 62 0
	cmpl	$0, 12(%ebp)
	je	.L10
	.loc 1 63 0
	movl	8(%ebp), %eax
	movl	$0, 576(%eax)
	.loc 1 64 0
	movl	8(%ebp), %eax
	addl	$564, %eax
	subl	$12, %esp
	pushl	%eax
	call	wakeup
.LVL14:
	addl	$16, %esp
	jmp	.L11
.L10:
	.loc 1 66 0
	movl	8(%ebp), %eax
	movl	$0, 572(%eax)
	.loc 1 67 0
	movl	8(%ebp), %eax
	addl	$568, %eax
	subl	$12, %esp
	pushl	%eax
	call	wakeup
.LVL15:
	addl	$16, %esp
.L11:
	.loc 1 69 0
	movl	8(%ebp), %eax
	movl	572(%eax), %eax
	testl	%eax, %eax
	jne	.L12
	.loc 1 69 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	576(%eax), %eax
	testl	%eax, %eax
	jne	.L12
	.loc 1 70 0 is_stmt 1
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	release
.LVL16:
	addl	$16, %esp
	.loc 1 71 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	kfree
.LVL17:
	addl	$16, %esp
	jmp	.L13
.L12:
	.loc 1 73 0
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	release
.LVL18:
	addl	$16, %esp
.L13:
	.loc 1 74 0
	nop
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	pipeclose, .-pipeclose
	.globl	pipewrite
	.type	pipewrite, @function
pipewrite:
.LFB2:
	.loc 1 79 0
	.cfi_startproc
.LVL19:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 82 0
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	acquire
.LVL20:
	addl	$16, %esp
	.loc 1 83 0
	movl	$0, -12(%ebp)
.LVL21:
	jmp	.L15
.L20:
	.loc 1 85 0
	movl	8(%ebp), %eax
	movl	572(%eax), %eax
	testl	%eax, %eax
	je	.L17
	.loc 1 85 0 is_stmt 0 discriminator 1
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L18
.L17:
	.loc 1 86 0 is_stmt 1
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	release
.LVL22:
	addl	$16, %esp
	.loc 1 87 0
	movl	$-1, %eax
	jmp	.L19
.L18:
	.loc 1 89 0
	movl	8(%ebp), %eax
	addl	$564, %eax
	subl	$12, %esp
	pushl	%eax
	call	wakeup
.LVL23:
	addl	$16, %esp
	.loc 1 90 0
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$568, %edx
	subl	$8, %esp
	pushl	%eax
	pushl	%edx
	call	sleep
.LVL24:
	addl	$16, %esp
.L16:
	.loc 1 84 0
	movl	8(%ebp), %eax
	movl	568(%eax), %edx
	movl	8(%ebp), %eax
	movl	564(%eax), %eax
	addl	$512, %eax
	cmpl	%eax, %edx
	je	.L20
	.loc 1 92 0 discriminator 2
	movl	8(%ebp), %eax
	movl	568(%eax), %eax
	leal	1(%eax), %ecx
	movl	8(%ebp), %edx
	movl	%ecx, 568(%edx)
	andl	$511, %eax
	movl	%eax, %ecx
	movl	-12(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %edx
	movl	8(%ebp), %eax
	movb	%dl, 52(%eax,%ecx)
	.loc 1 83 0 discriminator 2
	addl	$1, -12(%ebp)
.L15:
	.loc 1 83 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L16
	.loc 1 94 0 is_stmt 1
	movl	8(%ebp), %eax
	addl	$564, %eax
	subl	$12, %esp
	pushl	%eax
	call	wakeup
.LVL25:
	addl	$16, %esp
	.loc 1 95 0
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	release
.LVL26:
	addl	$16, %esp
	.loc 1 96 0
	movl	16(%ebp), %eax
.L19:
	.loc 1 97 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	pipewrite, .-pipewrite
	.globl	piperead
	.type	piperead, @function
piperead:
.LFB3:
	.loc 1 101 0
	.cfi_startproc
.LVL27:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	.loc 1 104 0
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	acquire
.LVL28:
	addl	$16, %esp
	.loc 1 105 0
	jmp	.L23
.L27:
	.loc 1 106 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L24
	.loc 1 107 0
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	release
.LVL29:
	addl	$16, %esp
	.loc 1 108 0
	movl	$-1, %eax
	jmp	.L25
.L24:
	.loc 1 110 0
	movl	8(%ebp), %eax
	movl	8(%ebp), %edx
	addl	$564, %edx
	subl	$8, %esp
	pushl	%eax
	pushl	%edx
	call	sleep
.LVL30:
	addl	$16, %esp
.L23:
	.loc 1 105 0
	movl	8(%ebp), %eax
	movl	564(%eax), %edx
	movl	8(%ebp), %eax
	movl	568(%eax), %eax
	cmpl	%eax, %edx
	jne	.L26
	.loc 1 105 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	576(%eax), %eax
	testl	%eax, %eax
	jne	.L27
.L26:
	.loc 1 112 0 is_stmt 1
	movl	$0, -12(%ebp)
.LVL31:
	jmp	.L28
.LVL32:
.L31:
	.loc 1 113 0
	movl	8(%ebp), %eax
.LVL33:
	movl	564(%eax), %edx
	movl	8(%ebp), %eax
	movl	568(%eax), %eax
	cmpl	%eax, %edx
	je	.L32
	.loc 1 115 0 discriminator 2
	movl	-12(%ebp), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movl	8(%ebp), %eax
	movl	564(%eax), %eax
	leal	1(%eax), %ecx
	movl	8(%ebp), %edx
	movl	%ecx, 564(%edx)
	andl	$511, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movzbl	52(%eax,%edx), %eax
	movb	%al, (%ebx)
	.loc 1 112 0 discriminator 2
	addl	$1, -12(%ebp)
.LVL34:
.L28:
	.loc 1 112 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L31
	jmp	.L30
.L32:
	.loc 1 114 0 is_stmt 1
	nop
.L30:
	.loc 1 117 0
	movl	8(%ebp), %eax
	addl	$568, %eax
	subl	$12, %esp
	pushl	%eax
	call	wakeup
.LVL35:
	addl	$16, %esp
	.loc 1 118 0
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	release
.LVL36:
	addl	$16, %esp
	.loc 1 119 0
	movl	-12(%ebp), %eax
.LVL37:
.L25:
	.loc 1 120 0
	movl	-4(%ebp), %ebx
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	piperead, .-piperead
.Letext0:
	.file 2 "types.h"
	.file 3 "mmu.h"
	.file 4 "proc.h"
	.file 5 "file.h"
	.file 6 "spinlock.h"
	.file 7 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa4c
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF91
	.byte	0xc
	.long	.LASF92
	.long	.LASF93
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x2
	.byte	0x1
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x2
	.byte	0x2
	.long	0x42
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x2
	.byte	0x3
	.long	0x54
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x2
	.long	.LASF6
	.byte	0x2
	.byte	0x4
	.long	0x25
	.uleb128 0x4
	.long	.LASF14
	.byte	0x8
	.byte	0x3
	.byte	0x34
	.long	0x149
	.uleb128 0x5
	.long	.LASF7
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
	.byte	0x97
	.long	0x354
	.uleb128 0x7
	.long	.LASF16
	.byte	0x3
	.byte	0x98
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF17
	.byte	0x3
	.byte	0x99
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ss0"
	.byte	0x3
	.byte	0x9a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF18
	.byte	0x3
	.byte	0x9b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x7
	.long	.LASF19
	.byte	0x3
	.byte	0x9c
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"ss1"
	.byte	0x3
	.byte	0x9d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF20
	.byte	0x3
	.byte	0x9e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x7
	.long	.LASF21
	.byte	0x3
	.byte	0x9f
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"ss2"
	.byte	0x3
	.byte	0xa0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.long	.LASF22
	.byte	0x3
	.byte	0xa1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x8
	.string	"cr3"
	.byte	0x3
	.byte	0xa2
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.string	"eip"
	.byte	0x3
	.byte	0xa3
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF23
	.byte	0x3
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.string	"eax"
	.byte	0x3
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.string	"ecx"
	.byte	0x3
	.byte	0xa6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.string	"edx"
	.byte	0x3
	.byte	0xa7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.string	"ebx"
	.byte	0x3
	.byte	0xa8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.string	"esp"
	.byte	0x3
	.byte	0xa9
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.string	"ebp"
	.byte	0x3
	.byte	0xaa
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x8
	.string	"esi"
	.byte	0x3
	.byte	0xab
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.string	"edi"
	.byte	0x3
	.byte	0xac
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.string	"es"
	.byte	0x3
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x7
	.long	.LASF24
	.byte	0x3
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x8
	.string	"cs"
	.byte	0x3
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x7
	.long	.LASF25
	.byte	0x3
	.byte	0xb0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x8
	.string	"ss"
	.byte	0x3
	.byte	0xb1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x7
	.long	.LASF26
	.byte	0x3
	.byte	0xb2
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x8
	.string	"ds"
	.byte	0x3
	.byte	0xb3
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x7
	.long	.LASF27
	.byte	0x3
	.byte	0xb4
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x8
	.string	"fs"
	.byte	0x3
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x7
	.long	.LASF28
	.byte	0x3
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x8
	.string	"gs"
	.byte	0x3
	.byte	0xb7
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x7
	.long	.LASF29
	.byte	0x3
	.byte	0xb8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x8
	.string	"ldt"
	.byte	0x3
	.byte	0xb9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x7
	.long	.LASF30
	.byte	0x3
	.byte	0xba
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x8
	.string	"t"
	.byte	0x3
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x7
	.long	.LASF31
	.byte	0x3
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
	.byte	0x4
	.byte	0x5
	.long	0x3ea
	.uleb128 0x8
	.string	"id"
	.byte	0x4
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x4
	.byte	0x7
	.long	0x43d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ts"
	.byte	0x4
	.byte	0x8
	.long	0x149
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"gdt"
	.byte	0x4
	.byte	0x9
	.long	0x443
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x7
	.long	.LASF33
	.byte	0x4
	.byte	0xa
	.long	0x45a
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x7
	.long	.LASF34
	.byte	0x4
	.byte	0xb
	.long	0x45f
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x7
	.long	.LASF35
	.byte	0x4
	.byte	0xc
	.long	0x45f
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x8
	.string	"cpu"
	.byte	0x4
	.byte	0xf
	.long	0x466
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x7
	.long	.LASF36
	.byte	0x4
	.byte	0x10
	.long	0x52d
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x4
	.long	.LASF37
	.byte	0x14
	.byte	0x4
	.byte	0x2c
	.long	0x43d
	.uleb128 0x8
	.string	"edi"
	.byte	0x4
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"esi"
	.byte	0x4
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ebx"
	.byte	0x4
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"ebp"
	.byte	0x4
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"eip"
	.byte	0x4
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
	.byte	0x4
	.byte	0x37
	.long	0x52d
	.uleb128 0x8
	.string	"sz"
	.byte	0x4
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF39
	.byte	0x4
	.byte	0x39
	.long	0x568
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF40
	.byte	0x4
	.byte	0x3a
	.long	0x56e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF41
	.byte	0x4
	.byte	0x3b
	.long	0x533
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"pid"
	.byte	0x4
	.byte	0x3c
	.long	0x45f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF42
	.byte	0x4
	.byte	0x3d
	.long	0x52d
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"tf"
	.byte	0x4
	.byte	0x3e
	.long	0x581
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.long	.LASF37
	.byte	0x4
	.byte	0x3f
	.long	0x43d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.long	.LASF43
	.byte	0x4
	.byte	0x40
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF44
	.byte	0x4
	.byte	0x41
	.long	0x45f
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.long	.LASF45
	.byte	0x4
	.byte	0x42
	.long	0x587
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.string	"cwd"
	.byte	0x4
	.byte	0x43
	.long	0x6a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x7
	.long	.LASF46
	.byte	0x4
	.byte	0x44
	.long	0x6aa
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x46c
	.uleb128 0x10
	.long	.LASF94
	.byte	0x4
	.long	0x30
	.byte	0x4
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
	.uleb128 0x12
	.long	.LASF95
	.byte	0x1
	.uleb128 0x9
	.byte	0x4
	.long	0x57b
	.uleb128 0xc
	.long	0x597
	.long	0x597
	.uleb128 0xd
	.long	0x453
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x59d
	.uleb128 0x4
	.long	.LASF54
	.byte	0x18
	.byte	0x5
	.byte	0x1
	.long	0x60b
	.uleb128 0x7
	.long	.LASF10
	.byte	0x5
	.byte	0x2
	.long	0x6d1
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"ref"
	.byte	0x5
	.byte	0x3
	.long	0x45f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF55
	.byte	0x5
	.byte	0x4
	.long	0x574
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF56
	.byte	0x5
	.byte	0x5
	.long	0x574
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x7
	.long	.LASF57
	.byte	0x5
	.byte	0x6
	.long	0x756
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"ip"
	.byte	0x5
	.byte	0x7
	.long	0x6a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.string	"off"
	.byte	0x5
	.byte	0x8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0x4
	.long	.LASF58
	.byte	0x50
	.byte	0x5
	.byte	0xd
	.long	0x6a4
	.uleb128 0x8
	.string	"dev"
	.byte	0x5
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF59
	.byte	0x5
	.byte	0xf
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ref"
	.byte	0x5
	.byte	0x10
	.long	0x45f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF60
	.byte	0x5
	.byte	0x11
	.long	0x45f
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x7
	.long	.LASF10
	.byte	0x5
	.byte	0x13
	.long	0x6ba
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF61
	.byte	0x5
	.byte	0x14
	.long	0x6ba
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x7
	.long	.LASF62
	.byte	0x5
	.byte	0x15
	.long	0x6ba
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x7
	.long	.LASF63
	.byte	0x5
	.byte	0x16
	.long	0x6ba
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x7
	.long	.LASF64
	.byte	0x5
	.byte	0x17
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.long	.LASF65
	.byte	0x5
	.byte	0x18
	.long	0x6c1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x60b
	.uleb128 0xc
	.long	0x574
	.long	0x6ba
	.uleb128 0xd
	.long	0x453
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF66
	.uleb128 0xc
	.long	0x25
	.long	0x6d1
	.uleb128 0xd
	.long	0x453
	.byte	0xc
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.long	0x30
	.byte	0x5
	.byte	0x2
	.long	0x6f0
	.uleb128 0x11
	.long	.LASF67
	.byte	0
	.uleb128 0x11
	.long	.LASF68
	.byte	0x1
	.uleb128 0x11
	.long	.LASF69
	.byte	0x2
	.byte	0
	.uleb128 0x14
	.long	.LASF57
	.value	0x244
	.byte	0x1
	.byte	0xc
	.long	0x756
	.uleb128 0x7
	.long	.LASF70
	.byte	0x1
	.byte	0xd
	.long	0x75c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF71
	.byte	0x1
	.byte	0xe
	.long	0x7b1
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x7
	.long	.LASF72
	.byte	0x1
	.byte	0xf
	.long	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0x234
	.uleb128 0x7
	.long	.LASF73
	.byte	0x1
	.byte	0x10
	.long	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0x238
	.uleb128 0x7
	.long	.LASF74
	.byte	0x1
	.byte	0x11
	.long	0x45f
	.byte	0x3
	.byte	0x23
	.uleb128 0x23c
	.uleb128 0x7
	.long	.LASF75
	.byte	0x1
	.byte	0x12
	.long	0x45f
	.byte	0x3
	.byte	0x23
	.uleb128 0x240
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x6f0
	.uleb128 0x4
	.long	.LASF76
	.byte	0x34
	.byte	0x6
	.byte	0x2
	.long	0x7a1
	.uleb128 0x7
	.long	.LASF77
	.byte	0x6
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF46
	.byte	0x6
	.byte	0x6
	.long	0x56e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"cpu"
	.byte	0x6
	.byte	0x7
	.long	0x466
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"pcs"
	.byte	0x6
	.byte	0x8
	.long	0x7a1
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0xc
	.long	0x25
	.long	0x7b1
	.uleb128 0xd
	.long	0x453
	.byte	0x9
	.byte	0
	.uleb128 0xc
	.long	0x574
	.long	0x7c2
	.uleb128 0x15
	.long	0x453
	.value	0x1ff
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF78
	.byte	0x1
	.byte	0x16
	.byte	0x1
	.long	0x45f
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x852
	.uleb128 0x17
	.string	"f0"
	.byte	0x1
	.byte	0x16
	.long	0x852
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.string	"f1"
	.byte	0x1
	.byte	0x16
	.long	0x852
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.string	"p"
	.byte	0x1
	.byte	0x18
	.long	0x756
	.long	.LLST1
	.uleb128 0x19
	.string	"bad"
	.byte	0x1
	.byte	0x30
	.long	.L2
	.uleb128 0x1a
	.long	.LVL2
	.long	0x9da
	.uleb128 0x1a
	.long	.LVL3
	.long	0x9da
	.uleb128 0x1a
	.long	.LVL4
	.long	0x9e7
	.uleb128 0x1a
	.long	.LVL6
	.long	0x9f4
	.uleb128 0x1a
	.long	.LVL9
	.long	0xa01
	.uleb128 0x1a
	.long	.LVL10
	.long	0xa0e
	.uleb128 0x1a
	.long	.LVL11
	.long	0xa0e
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x597
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF96
	.byte	0x1
	.byte	0x3b
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST2
	.byte	0x1
	.long	0x8c3
	.uleb128 0x17
	.string	"p"
	.byte	0x1
	.byte	0x3b
	.long	0x756
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.LASF56
	.byte	0x1
	.byte	0x3b
	.long	0x45f
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.long	.LVL13
	.long	0xa1b
	.uleb128 0x1a
	.long	.LVL14
	.long	0xa28
	.uleb128 0x1a
	.long	.LVL15
	.long	0xa28
	.uleb128 0x1a
	.long	.LVL16
	.long	0xa35
	.uleb128 0x1a
	.long	.LVL17
	.long	0xa01
	.uleb128 0x1a
	.long	.LVL18
	.long	0xa35
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF79
	.byte	0x1
	.byte	0x4e
	.byte	0x1
	.long	0x45f
	.long	.LFB2
	.long	.LFE2
	.long	.LLST3
	.byte	0x1
	.long	0x94a
	.uleb128 0x17
	.string	"p"
	.byte	0x1
	.byte	0x4e
	.long	0x756
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.LASF80
	.byte	0x1
	.byte	0x4e
	.long	0x56e
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.string	"n"
	.byte	0x1
	.byte	0x4e
	.long	0x45f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1d
	.string	"i"
	.byte	0x1
	.byte	0x50
	.long	0x45f
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.long	.LVL20
	.long	0xa1b
	.uleb128 0x1a
	.long	.LVL22
	.long	0xa35
	.uleb128 0x1a
	.long	.LVL23
	.long	0xa28
	.uleb128 0x1a
	.long	.LVL24
	.long	0xa42
	.uleb128 0x1a
	.long	.LVL25
	.long	0xa28
	.uleb128 0x1a
	.long	.LVL26
	.long	0xa35
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF81
	.byte	0x1
	.byte	0x64
	.byte	0x1
	.long	0x45f
	.long	.LFB3
	.long	.LFE3
	.long	.LLST4
	.byte	0x1
	.long	0x9c9
	.uleb128 0x17
	.string	"p"
	.byte	0x1
	.byte	0x64
	.long	0x756
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.LASF80
	.byte	0x1
	.byte	0x64
	.long	0x56e
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x17
	.string	"n"
	.byte	0x1
	.byte	0x64
	.long	0x45f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x18
	.string	"i"
	.byte	0x1
	.byte	0x66
	.long	0x45f
	.long	.LLST5
	.uleb128 0x1a
	.long	.LVL28
	.long	0xa1b
	.uleb128 0x1a
	.long	.LVL29
	.long	0xa35
	.uleb128 0x1a
	.long	.LVL30
	.long	0xa42
	.uleb128 0x1a
	.long	.LVL35
	.long	0xa28
	.uleb128 0x1a
	.long	.LVL36
	.long	0xa35
	.byte	0
	.uleb128 0x1e
	.long	.LASF36
	.byte	0x4
	.byte	0x1f
	.long	.LASF97
	.long	0x52d
	.byte	0x1
	.byte	0x1
	.uleb128 0x1f
	.byte	0x1
	.byte	0x1
	.long	.LASF82
	.long	.LASF82
	.byte	0x7
	.byte	0x1c
	.uleb128 0x1f
	.byte	0x1
	.byte	0x1
	.long	.LASF83
	.long	.LASF83
	.byte	0x7
	.byte	0x42
	.uleb128 0x1f
	.byte	0x1
	.byte	0x1
	.long	.LASF84
	.long	.LASF84
	.byte	0x7
	.byte	0x81
	.uleb128 0x1f
	.byte	0x1
	.byte	0x1
	.long	.LASF85
	.long	.LASF85
	.byte	0x7
	.byte	0x43
	.uleb128 0x1f
	.byte	0x1
	.byte	0x1
	.long	.LASF86
	.long	.LASF86
	.byte	0x7
	.byte	0x1d
	.uleb128 0x1f
	.byte	0x1
	.byte	0x1
	.long	.LASF87
	.long	.LASF87
	.byte	0x7
	.byte	0x7e
	.uleb128 0x1f
	.byte	0x1
	.byte	0x1
	.long	.LASF88
	.long	.LASF88
	.byte	0x7
	.byte	0x77
	.uleb128 0x1f
	.byte	0x1
	.byte	0x1
	.long	.LASF89
	.long	.LASF89
	.byte	0x7
	.byte	0x82
	.uleb128 0x1f
	.byte	0x1
	.byte	0x1
	.long	.LASF90
	.long	.LASF90
	.byte	0x7
	.byte	0x74
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
	.uleb128 0x4
	.byte	0x1
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
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x1f
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
	.long	.LVL5-.Ltext0
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
	.long	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL8-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
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
.LLST3:
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
.LLST4:
	.long	.LFB3-.Ltext0
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
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LVL31-.Ltext0
	.long	.LVL32-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL32-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL33-.Ltext0
	.long	.LVL37-.Ltext0
	.value	0x2
	.byte	0x91
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
.LASF55:
	.string	"readable"
.LASF67:
	.string	"FD_NONE"
.LASF48:
	.string	"EMBRYO"
.LASF58:
	.string	"inode"
.LASF50:
	.string	"RUNNABLE"
.LASF41:
	.string	"state"
.LASF66:
	.string	"short int"
.LASF97:
	.string	"%gs:4"
.LASF8:
	.string	"base_15_0"
.LASF38:
	.string	"sizetype"
.LASF23:
	.string	"eflags"
.LASF95:
	.string	"trapframe"
.LASF12:
	.string	"rsv1"
.LASF85:
	.string	"kfree"
.LASF79:
	.string	"pipewrite"
.LASF14:
	.string	"segdesc"
.LASF71:
	.string	"data"
.LASF0:
	.string	"uint"
.LASF62:
	.string	"minor"
.LASF49:
	.string	"SLEEPING"
.LASF54:
	.string	"file"
.LASF61:
	.string	"major"
.LASF88:
	.string	"wakeup"
.LASF87:
	.string	"acquire"
.LASF63:
	.string	"nlink"
.LASF44:
	.string	"killed"
.LASF65:
	.string	"addrs"
.LASF16:
	.string	"link"
.LASF60:
	.string	"flags"
.LASF91:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF43:
	.string	"chan"
.LASF78:
	.string	"pipealloc"
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
.LASF92:
	.string	"pipe.c"
.LASF18:
	.string	"padding1"
.LASF96:
	.string	"pipeclose"
.LASF13:
	.string	"base_31_24"
.LASF4:
	.string	"uchar"
.LASF25:
	.string	"padding5"
.LASF70:
	.string	"lock"
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
.LASF72:
	.string	"nread"
.LASF27:
	.string	"padding7"
.LASF68:
	.string	"FD_PIPE"
.LASF29:
	.string	"padding9"
.LASF31:
	.string	"iomb"
.LASF36:
	.string	"proc"
.LASF64:
	.string	"size"
.LASF10:
	.string	"type"
.LASF2:
	.string	"unsigned int"
.LASF37:
	.string	"context"
.LASF69:
	.string	"FD_INODE"
.LASF90:
	.string	"sleep"
.LASF51:
	.string	"RUNNING"
.LASF75:
	.string	"writeopen"
.LASF33:
	.string	"started"
.LASF40:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF81:
	.string	"piperead"
.LASF17:
	.string	"esp0"
.LASF19:
	.string	"esp1"
.LASF21:
	.string	"esp2"
.LASF53:
	.string	"char"
.LASF77:
	.string	"locked"
.LASF80:
	.string	"addr"
.LASF47:
	.string	"UNUSED"
.LASF30:
	.string	"padding10"
.LASF82:
	.string	"filealloc"
.LASF73:
	.string	"nwrite"
.LASF74:
	.string	"readopen"
.LASF76:
	.string	"spinlock"
.LASF89:
	.string	"release"
.LASF35:
	.string	"intena"
.LASF32:
	.string	"scheduler"
.LASF15:
	.string	"taskstate"
.LASF59:
	.string	"inum"
.LASF11:
	.string	"lim_19_16"
.LASF57:
	.string	"pipe"
.LASF86:
	.string	"fileclose"
.LASF46:
	.string	"name"
.LASF94:
	.string	"procstate"
.LASF84:
	.string	"initlock"
.LASF56:
	.string	"writable"
.LASF39:
	.string	"pgdir"
.LASF34:
	.string	"ncli"
.LASF93:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF52:
	.string	"ZOMBIE"
.LASF83:
	.string	"kalloc"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
