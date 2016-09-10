	.file	"cs550_user.c"
	.text
.Ltext0:
	.section	.rodata
	.align 4
.LC0:
	.string	"After Calling date %d %d %d %d %d %d \n"
	.text
	.globl	test_date
	.type	test_date, @function
test_date:
.LFB0:
	.file 1 "cs550_user.c"
	.loc 1 10 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 11 0
	subl	$12, %esp
	pushl	$24
	call	malloc
.LVL0:
	addl	$16, %esp
	movl	%eax, -28(%ebp)
.LVL1:
	.loc 1 12 0
	subl	$12, %esp
	pushl	-28(%ebp)
	call	date
.LVL2:
	addl	$16, %esp
	.loc 1 13 0
	movl	-28(%ebp), %eax
	movl	20(%eax), %edi
	movl	-28(%ebp), %eax
	movl	16(%eax), %esi
	movl	-28(%ebp), %eax
	movl	12(%eax), %ebx
	movl	-28(%ebp), %eax
	movl	8(%eax), %ecx
	movl	-28(%ebp), %eax
	movl	4(%eax), %edx
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$.LC0
	pushl	$1
	call	printf
.LVL3:
	addl	$32, %esp
	.loc 1 14 0
	nop
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL4:
	ret
	.cfi_endproc
.LFE0:
	.size	test_date, .-test_date
	.section	.rodata
	.align 4
.LC1:
	.string	" Time Calculated doing getpid %d\n"
	.text
	.globl	test_getpid
	.type	test_getpid, @function
test_getpid:
.LFB1:
	.loc 1 16 0
	.cfi_startproc
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 17 0
	movl	$0, -12(%ebp)
.LVL5:
	.loc 1 19 0
	call	uptime
.LVL6:
	imull	$1000000000, %eax, %eax
	movl	%eax, -16(%ebp)
.LVL7:
	.loc 1 21 0
	movl	$0, -12(%ebp)
	jmp	.L3
.LVL8:
.L4:
	.loc 1 22 0 discriminator 3
	call	getpid
.LVL9:
	.loc 1 21 0 discriminator 3
	addl	$1, -12(%ebp)
.L3:
	.loc 1 21 0 is_stmt 0 discriminator 1
	cmpl	$99999, -12(%ebp)
	jle	.L4
	.loc 1 24 0 is_stmt 1
	call	uptime
.LVL10:
	imull	$1000000000, %eax, %eax
	movl	%eax, -20(%ebp)
.LVL11:
	.loc 1 25 0
	movl	-20(%ebp), %eax
	subl	-16(%ebp), %eax
.LVL12:
	shrl	$5, %eax
	movl	$175921861, %edx
	mull	%edx
	movl	%edx, %eax
	shrl	$7, %eax
	movl	%eax, -24(%ebp)
.LVL13:
	.loc 1 26 0
	subl	$4, %esp
	pushl	-24(%ebp)
	pushl	$.LC1
	pushl	$1
	call	printf
.LVL14:
	addl	$16, %esp
	.loc 1 27 0
	nop
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL15:
	ret
	.cfi_endproc
.LFE1:
	.size	test_getpid, .-test_getpid
	.section	.rodata
.LC2:
	.string	" Calling ls cal1 01 %d\n"
	.text
	.globl	call01_ls
	.type	call01_ls, @function
call01_ls:
.LFB2:
	.loc 1 29 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 30 0
	movl	$0, -12(%ebp)
.LVL16:
	.loc 1 31 0
	call	ls_call1
.LVL17:
	movl	%eax, -12(%ebp)
.LVL18:
	.loc 1 32 0
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	$.LC2
	pushl	$1
	call	printf
.LVL19:
	addl	$16, %esp
	.loc 1 33 0
	nop
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL20:
	ret
	.cfi_endproc
.LFE2:
	.size	call01_ls, .-call01_ls
	.section	.rodata
.LC3:
	.string	" Calling ls cal1 05 %d\n"
	.text
	.globl	call50_ls
	.type	call50_ls, @function
call50_ls:
.LFB3:
	.loc 1 35 0
	.cfi_startproc
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 36 0
	movl	$0, -12(%ebp)
.LVL21:
	.loc 1 37 0
	call	ls_call50
.LVL22:
	movl	%eax, -12(%ebp)
.LVL23:
	.loc 1 38 0
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	$.LC3
	pushl	$1
	call	printf
.LVL24:
	addl	$16, %esp
	.loc 1 39 0
	nop
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL25:
	ret
	.cfi_endproc
.LFE3:
	.size	call50_ls, .-call50_ls
	.section	.rodata
	.align 4
.LC4:
	.string	" Time Calculated doing linear %d\n"
	.text
	.globl	ls_linear_time
	.type	ls_linear_time, @function
ls_linear_time:
.LFB4:
	.loc 1 41 0
	.cfi_startproc
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 42 0
	movl	$0, -12(%ebp)
.LVL26:
	.loc 1 44 0
	call	uptime
.LVL27:
	imull	$1000000000, %eax, %eax
	movl	%eax, -16(%ebp)
.LVL28:
	.loc 1 46 0
	movl	$0, -12(%ebp)
	jmp	.L8
.LVL29:
.L9:
	.loc 1 47 0 discriminator 3
	call	ls_call22
.LVL30:
	.loc 1 46 0 discriminator 3
	addl	$1, -12(%ebp)
.L8:
	.loc 1 46 0 is_stmt 0 discriminator 1
	cmpl	$99999, -12(%ebp)
	jle	.L9
	.loc 1 49 0 is_stmt 1
	call	uptime
.LVL31:
	imull	$1000000000, %eax, %eax
	movl	%eax, -20(%ebp)
.LVL32:
	.loc 1 50 0
	movl	-20(%ebp), %eax
	subl	-16(%ebp), %eax
.LVL33:
	shrl	$5, %eax
	movl	$175921861, %edx
	mull	%edx
	movl	%edx, %eax
	shrl	$7, %eax
	movl	%eax, -24(%ebp)
.LVL34:
	.loc 1 51 0
	subl	$4, %esp
	pushl	-24(%ebp)
	pushl	$.LC4
	pushl	$1
	call	printf
.LVL35:
	addl	$16, %esp
	.loc 1 52 0
	nop
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL36:
	ret
	.cfi_endproc
.LFE4:
	.size	ls_linear_time, .-ls_linear_time
	.section	.rodata
.LC5:
	.string	" Calling ls cal1 03 %d\n"
	.text
	.globl	ls_call03
	.type	ls_call03, @function
ls_call03:
.LFB5:
	.loc 1 54 0
	.cfi_startproc
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 55 0
	movl	$0, -12(%ebp)
.LVL37:
	.loc 1 56 0
	call	ls_call3
.LVL38:
	movl	%eax, -12(%ebp)
.LVL39:
	.loc 1 57 0
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	$.LC5
	pushl	$1
	call	printf
.LVL40:
	addl	$16, %esp
	.loc 1 58 0
	nop
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL41:
	ret
	.cfi_endproc
.LFE5:
	.size	ls_call03, .-ls_call03
	.section	.rodata
.LC6:
	.string	" Calling ls cal1 04 %d\n"
	.text
	.globl	ls_call04
	.type	ls_call04, @function
ls_call04:
.LFB6:
	.loc 1 61 0
	.cfi_startproc
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 62 0
	movl	$0, -12(%ebp)
.LVL42:
	.loc 1 63 0
	call	ls_call4
.LVL43:
	movl	%eax, -12(%ebp)
.LVL44:
	.loc 1 64 0
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	$.LC6
	pushl	$1
	call	printf
.LVL45:
	addl	$16, %esp
	.loc 1 65 0
	nop
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL46:
	ret
	.cfi_endproc
.LFE6:
	.size	ls_call04, .-ls_call04
	.section	.rodata
.LC7:
	.string	" Calling ht 01 %d\n"
	.text
	.globl	call01_ht
	.type	call01_ht, @function
call01_ht:
.LFB7:
	.loc 1 68 0
	.cfi_startproc
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 69 0
	movl	$0, -12(%ebp)
.LVL47:
	.loc 1 70 0
	call	ht_call1
.LVL48:
	movl	%eax, -12(%ebp)
.LVL49:
	.loc 1 71 0
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	$.LC7
	pushl	$1
	call	printf
.LVL50:
	addl	$16, %esp
	.loc 1 72 0
	nop
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL51:
	ret
	.cfi_endproc
.LFE7:
	.size	call01_ht, .-call01_ht
	.section	.rodata
.LC8:
	.string	" Calling ht 50 5%d\n"
	.text
	.globl	call50_ht
	.type	call50_ht, @function
call50_ht:
.LFB8:
	.loc 1 74 0
	.cfi_startproc
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 75 0
	movl	$0, -12(%ebp)
.LVL52:
	.loc 1 76 0
	call	ht_call50
.LVL53:
	movl	%eax, -12(%ebp)
.LVL54:
	.loc 1 77 0
	subl	$4, %esp
	pushl	-12(%ebp)
	pushl	$.LC8
	pushl	$1
	call	printf
.LVL55:
	addl	$16, %esp
	.loc 1 78 0
	nop
	leave
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL56:
	ret
	.cfi_endproc
.LFE8:
	.size	call50_ht, .-call50_ht
	.globl	main
	.type	main, @function
main:
.LFB9:
	.loc 1 81 0
	.cfi_startproc
.LVL57:
	leal	4(%esp), %ecx
.LCFI27:
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
.LCFI28:
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$4, %esp
	.loc 1 82 0
	call	test_date
.LVL58:
	.loc 1 83 0
	call	test_getpid
.LVL59:
	.loc 1 84 0
	call	call01_ls
.LVL60:
	.loc 1 85 0
	call	call50_ls
.LVL61:
	.loc 1 86 0
	call	ls_linear_time
.LVL62:
	.loc 1 87 0
	call	call01_ht
.LVL63:
	.loc 1 88 0
	call	call50_ht
.LVL64:
	.loc 1 89 0
	movl	$0, %eax
	.loc 1 90 0
	addl	$4, %esp
	popl	%ecx
.LCFI29:
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
.LCFI30:
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
.Letext0:
	.file 2 "date.h"
	.file 3 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x45d
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF36
	.byte	0xc
	.long	.LASF37
	.long	.LASF38
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
	.long	.LASF39
	.byte	0x18
	.byte	0x2
	.byte	0x1
	.long	0xa9
	.uleb128 0x5
	.long	.LASF4
	.byte	0x2
	.byte	0x2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF5
	.byte	0x2
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF6
	.byte	0x2
	.byte	0x4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"day"
	.byte	0x2
	.byte	0x5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF7
	.byte	0x2
	.byte	0x6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF8
	.byte	0x2
	.byte	0x7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF9
	.byte	0x1
	.byte	0xa
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xeb
	.uleb128 0x8
	.string	"r"
	.byte	0x1
	.byte	0xb
	.long	0xeb
	.long	.LLST1
	.uleb128 0x9
	.long	.LVL0
	.long	0x3c4
	.uleb128 0x9
	.long	.LVL2
	.long	0x3d1
	.uleb128 0x9
	.long	.LVL3
	.long	0x3de
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x48
	.uleb128 0x7
	.byte	0x1
	.long	.LASF10
	.byte	0x1
	.byte	0x10
	.long	.LFB1
	.long	.LFE1
	.long	.LLST2
	.byte	0x1
	.long	0x169
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x11
	.long	0x41
	.long	.LLST3
	.uleb128 0xb
	.long	.LASF11
	.byte	0x1
	.byte	0x13
	.long	0x25
	.long	.LLST4
	.uleb128 0xb
	.long	.LASF12
	.byte	0x1
	.byte	0x18
	.long	0x25
	.long	.LLST5
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.byte	0x19
	.long	0x25
	.long	.LLST6
	.uleb128 0x9
	.long	.LVL6
	.long	0x3eb
	.uleb128 0x9
	.long	.LVL9
	.long	0x3f8
	.uleb128 0x9
	.long	.LVL10
	.long	0x3eb
	.uleb128 0x9
	.long	.LVL14
	.long	0x3de
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x1d
	.long	.LFB2
	.long	.LFE2
	.long	.LLST7
	.byte	0x1
	.long	0x1a2
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x1e
	.long	0x41
	.long	.LLST8
	.uleb128 0x9
	.long	.LVL17
	.long	0x405
	.uleb128 0x9
	.long	.LVL19
	.long	0x3de
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0x23
	.long	.LFB3
	.long	.LFE3
	.long	.LLST9
	.byte	0x1
	.long	0x1db
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x24
	.long	0x41
	.long	.LLST10
	.uleb128 0x9
	.long	.LVL22
	.long	0x412
	.uleb128 0x9
	.long	.LVL24
	.long	0x3de
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0x29
	.long	.LFB4
	.long	.LFE4
	.long	.LLST11
	.byte	0x1
	.long	0x253
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x2a
	.long	0x41
	.long	.LLST12
	.uleb128 0xb
	.long	.LASF11
	.byte	0x1
	.byte	0x2c
	.long	0x25
	.long	.LLST13
	.uleb128 0xb
	.long	.LASF12
	.byte	0x1
	.byte	0x31
	.long	0x25
	.long	.LLST14
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.byte	0x32
	.long	0x25
	.long	.LLST15
	.uleb128 0x9
	.long	.LVL27
	.long	0x3eb
	.uleb128 0x9
	.long	.LVL30
	.long	0x41f
	.uleb128 0x9
	.long	.LVL31
	.long	0x3eb
	.uleb128 0x9
	.long	.LVL35
	.long	0x3de
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0x36
	.long	.LFB5
	.long	.LFE5
	.long	.LLST16
	.byte	0x1
	.long	0x28c
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x37
	.long	0x41
	.long	.LLST17
	.uleb128 0x9
	.long	.LVL38
	.long	0x42c
	.uleb128 0x9
	.long	.LVL40
	.long	0x3de
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.byte	0x3d
	.long	.LFB6
	.long	.LFE6
	.long	.LLST18
	.byte	0x1
	.long	0x2c5
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x3e
	.long	0x41
	.long	.LLST19
	.uleb128 0x9
	.long	.LVL43
	.long	0x439
	.uleb128 0x9
	.long	.LVL45
	.long	0x3de
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0x44
	.long	.LFB7
	.long	.LFE7
	.long	.LLST20
	.byte	0x1
	.long	0x2fe
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x45
	.long	0x41
	.long	.LLST21
	.uleb128 0x9
	.long	.LVL48
	.long	0x446
	.uleb128 0x9
	.long	.LVL50
	.long	0x3de
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.byte	0x4a
	.long	.LFB8
	.long	.LFE8
	.long	.LLST22
	.byte	0x1
	.long	0x337
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x4b
	.long	0x41
	.long	.LLST23
	.uleb128 0x9
	.long	.LVL53
	.long	0x453
	.uleb128 0x9
	.long	.LVL55
	.long	0x3de
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.long	0x41
	.long	.LFB9
	.long	.LFE9
	.long	.LLST24
	.byte	0x1
	.long	0x3b1
	.uleb128 0xd
	.long	.LASF21
	.byte	0x1
	.byte	0x50
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.long	.LASF22
	.byte	0x1
	.byte	0x50
	.long	0x3b1
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x9
	.long	.LVL58
	.long	0xa9
	.uleb128 0x9
	.long	.LVL59
	.long	0xf1
	.uleb128 0x9
	.long	.LVL60
	.long	0x169
	.uleb128 0x9
	.long	.LVL61
	.long	0x1a2
	.uleb128 0x9
	.long	.LVL62
	.long	0x1db
	.uleb128 0x9
	.long	.LVL63
	.long	0x2c5
	.uleb128 0x9
	.long	.LVL64
	.long	0x2fe
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x3b7
	.uleb128 0xa
	.byte	0x4
	.long	0x3bd
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF23
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF24
	.long	.LASF24
	.byte	0x3
	.byte	0x92
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF25
	.long	.LASF25
	.byte	0x3
	.byte	0x1f
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF26
	.long	.LASF26
	.byte	0x3
	.byte	0x8e
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF27
	.long	.LASF27
	.byte	0x3
	.byte	0x1b
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF28
	.long	.LASF28
	.byte	0x3
	.byte	0x18
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF29
	.long	.LASF29
	.byte	0x3
	.byte	0x21
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF30
	.long	.LASF30
	.byte	0x3
	.byte	0x52
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF31
	.long	.LASF31
	.byte	0x3
	.byte	0x36
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF32
	.long	.LASF32
	.byte	0x3
	.byte	0x23
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF33
	.long	.LASF33
	.byte	0x3
	.byte	0x24
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF34
	.long	.LASF34
	.byte	0x3
	.byte	0x55
	.uleb128 0xe
	.byte	0x1
	.byte	0x1
	.long	.LASF35
	.long	.LASF35
	.byte	0x3
	.byte	0x86
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
	.uleb128 0x38
	.uleb128 0xa
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
	.uleb128 0x9
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.long	.LVL4-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -28
	.long	.LVL4-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
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
	.long	.LVL5-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL15-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST4:
	.long	.LVL7-.Ltext0
	.long	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL8-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL15-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST5:
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL12-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -20
	.long	.LVL15-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST6:
	.long	.LVL13-.Ltext0
	.long	.LVL14-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL14-1-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -24
	.long	.LVL15-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST7:
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
.LLST8:
	.long	.LVL16-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL18-.Ltext0
	.long	.LVL19-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL19-1-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL20-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST9:
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
.LLST10:
	.long	.LVL21-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL23-.Ltext0
	.long	.LVL24-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL24-1-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL25-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST11:
	.long	.LFB4-.Ltext0
	.long	.LCFI12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI12-.Ltext0
	.long	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI13-.Ltext0
	.long	.LCFI14-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI14-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST12:
	.long	.LVL26-.Ltext0
	.long	.LVL36-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL36-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST13:
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL29-.Ltext0
	.long	.LVL36-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL36-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST14:
	.long	.LVL32-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL33-.Ltext0
	.long	.LVL36-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -20
	.long	.LVL36-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST15:
	.long	.LVL34-.Ltext0
	.long	.LVL35-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL35-1-.Ltext0
	.long	.LVL36-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -24
	.long	.LVL36-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST16:
	.long	.LFB5-.Ltext0
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
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST17:
	.long	.LVL37-.Ltext0
	.long	.LVL39-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL39-.Ltext0
	.long	.LVL40-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL40-1-.Ltext0
	.long	.LVL41-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL41-.Ltext0
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST18:
	.long	.LFB6-.Ltext0
	.long	.LCFI18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI18-.Ltext0
	.long	.LCFI19-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI19-.Ltext0
	.long	.LCFI20-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI20-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST19:
	.long	.LVL42-.Ltext0
	.long	.LVL44-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL44-.Ltext0
	.long	.LVL45-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL45-1-.Ltext0
	.long	.LVL46-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL46-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST20:
	.long	.LFB7-.Ltext0
	.long	.LCFI21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI21-.Ltext0
	.long	.LCFI22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI22-.Ltext0
	.long	.LCFI23-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI23-.Ltext0
	.long	.LFE7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST21:
	.long	.LVL47-.Ltext0
	.long	.LVL49-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL49-.Ltext0
	.long	.LVL50-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL50-1-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL51-.Ltext0
	.long	.LFE7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST22:
	.long	.LFB8-.Ltext0
	.long	.LCFI24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI24-.Ltext0
	.long	.LCFI25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI25-.Ltext0
	.long	.LCFI26-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI26-.Ltext0
	.long	.LFE8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST23:
	.long	.LVL52-.Ltext0
	.long	.LVL54-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL54-.Ltext0
	.long	.LVL55-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL55-1-.Ltext0
	.long	.LVL56-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL56-.Ltext0
	.long	.LFE8-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST24:
	.long	.LFB9-.Ltext0
	.long	.LCFI27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI27-.Ltext0
	.long	.LCFI28-.Ltext0
	.value	0x2
	.byte	0x71
	.sleb128 0
	.long	.LCFI28-.Ltext0
	.long	.LCFI29-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -4
	.byte	0x6
	.long	.LCFI29-.Ltext0
	.long	.LCFI30-.Ltext0
	.value	0x3
	.byte	0x71
	.sleb128 -4
	.byte	0x6
	.long	.LCFI30-.Ltext0
	.long	.LFE9-.Ltext0
	.value	0x5
	.byte	0x74
	.sleb128 -4
	.byte	0x6
	.byte	0x23
	.uleb128 0x4
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
.LASF28:
	.string	"getpid"
.LASF8:
	.string	"year"
.LASF5:
	.string	"minute"
.LASF37:
	.string	"cs550_user.c"
.LASF11:
	.string	"start"
.LASF7:
	.string	"month"
.LASF25:
	.string	"date"
.LASF12:
	.string	"stop"
.LASF2:
	.string	"unsigned char"
.LASF19:
	.string	"call01_ht"
.LASF20:
	.string	"call50_ht"
.LASF17:
	.string	"ls_call03"
.LASF18:
	.string	"ls_call04"
.LASF1:
	.string	"short unsigned int"
.LASF31:
	.string	"ls_call22"
.LASF9:
	.string	"test_date"
.LASF10:
	.string	"test_getpid"
.LASF4:
	.string	"second"
.LASF15:
	.string	"call50_ls"
.LASF38:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF40:
	.string	"main"
.LASF0:
	.string	"unsigned int"
.LASF23:
	.string	"char"
.LASF6:
	.string	"hour"
.LASF34:
	.string	"ht_call1"
.LASF32:
	.string	"ls_call3"
.LASF21:
	.string	"argc"
.LASF16:
	.string	"ls_linear_time"
.LASF13:
	.string	"diff"
.LASF27:
	.string	"uptime"
.LASF36:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF26:
	.string	"printf"
.LASF3:
	.string	"short int"
.LASF22:
	.string	"argv"
.LASF29:
	.string	"ls_call1"
.LASF35:
	.string	"ht_call50"
.LASF14:
	.string	"call01_ls"
.LASF33:
	.string	"ls_call4"
.LASF39:
	.string	"rtcdate"
.LASF30:
	.string	"ls_call50"
.LASF24:
	.string	"malloc"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
