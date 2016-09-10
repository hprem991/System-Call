	.file	"exec.c"
	.text
.Ltext0:
	.globl	exec
	.type	exec, @function
exec:
.LFB20:
	.file 1 "exec.c"
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
	subl	$280, %esp
	.loc 1 21 0
	call	begin_op
.LVL1:
	.loc 1 22 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	namei
.LVL2:
	addl	$16, %esp
	movl	%eax, -40(%ebp)
.LVL3:
	cmpl	$0, -40(%ebp)
	jne	.L2
	.loc 1 23 0
	call	end_op
.LVL4:
	.loc 1 24 0
	movl	$-1, %eax
	jmp	.L26
.LVL5:
.L2:
	.loc 1 26 0
	subl	$12, %esp
	pushl	-40(%ebp)
	call	ilock
.LVL6:
	addl	$16, %esp
	.loc 1 27 0
	movl	$0, -44(%ebp)
.LVL7:
	.loc 1 30 0
	pushl	$52
	pushl	$0
	leal	-244(%ebp), %eax
	pushl	%eax
	pushl	-40(%ebp)
	call	readi
.LVL8:
	addl	$16, %esp
	cmpl	$51, %eax
	jbe	.L27
	.loc 1 32 0
	movl	-244(%ebp), %eax
	cmpl	$1179403647, %eax
	jne	.L28
	.loc 1 35 0
	call	setupkvm
.LVL9:
	movl	%eax, -44(%ebp)
.LVL10:
	cmpl	$0, -44(%ebp)
	je	.L29
	.loc 1 39 0
	movl	$0, -32(%ebp)
.LVL11:
	.loc 1 40 0
	movl	$0, -20(%ebp)
.LVL12:
	movl	-216(%ebp), %eax
.LVL13:
	movl	%eax, -24(%ebp)
.LVL14:
	jmp	.L8
.LVL15:
.L14:
	.loc 1 41 0
	movl	-24(%ebp), %eax
	pushl	$32
	pushl	%eax
	leal	-276(%ebp), %eax
	pushl	%eax
	pushl	-40(%ebp)
	call	readi
.LVL16:
	addl	$16, %esp
	cmpl	$32, %eax
	jne	.L30
	.loc 1 43 0
	movl	-276(%ebp), %eax
	cmpl	$1, %eax
	jne	.L31
	.loc 1 45 0
	movl	-256(%ebp), %edx
	movl	-260(%ebp), %eax
	cmpl	%eax, %edx
	jb	.L32
	.loc 1 47 0
	movl	-268(%ebp), %edx
	movl	-256(%ebp), %eax
	addl	%edx, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	-32(%ebp)
	pushl	-44(%ebp)
	call	allocuvm
.LVL17:
	addl	$16, %esp
	movl	%eax, -32(%ebp)
.LVL18:
	cmpl	$0, -32(%ebp)
	je	.L33
	.loc 1 49 0
	movl	-260(%ebp), %edx
	movl	-272(%ebp), %eax
.LVL19:
	movl	-268(%ebp), %ecx
	subl	$12, %esp
	pushl	%edx
	pushl	%eax
	pushl	-40(%ebp)
	pushl	%ecx
	pushl	-44(%ebp)
	call	loaduvm
.LVL20:
	addl	$32, %esp
	testl	%eax, %eax
	js	.L34
	jmp	.L11
.L31:
	.loc 1 44 0
	nop
.L11:
	.loc 1 40 0 discriminator 2
	addl	$1, -20(%ebp)
	movl	-24(%ebp), %eax
	addl	$32, %eax
	movl	%eax, -24(%ebp)
.LVL21:
.L8:
	.loc 1 40 0 is_stmt 0 discriminator 1
	movzwl	-200(%ebp), %eax
	movzwl	%ax, %eax
	cmpl	-20(%ebp), %eax
	jg	.L14
	.loc 1 52 0 is_stmt 1
	subl	$12, %esp
	pushl	-40(%ebp)
	call	iunlockput
.LVL22:
	addl	$16, %esp
	.loc 1 53 0
	call	end_op
.LVL23:
	.loc 1 54 0
	movl	$0, -40(%ebp)
	.loc 1 58 0
	movl	-32(%ebp), %eax
	addl	$4095, %eax
	andl	$-4096, %eax
	movl	%eax, -32(%ebp)
.LVL24:
	.loc 1 59 0
	movl	-32(%ebp), %eax
	addl	$8192, %eax
.LVL25:
	subl	$4, %esp
	pushl	%eax
	pushl	-32(%ebp)
	pushl	-44(%ebp)
	call	allocuvm
.LVL26:
	addl	$16, %esp
	movl	%eax, -32(%ebp)
.LVL27:
	cmpl	$0, -32(%ebp)
	je	.L35
	.loc 1 61 0
	movl	-32(%ebp), %eax
	subl	$8192, %eax
.LVL28:
	subl	$8, %esp
	pushl	%eax
	pushl	-44(%ebp)
	call	clearpteu
.LVL29:
	addl	$16, %esp
	.loc 1 62 0
	movl	-32(%ebp), %eax
	movl	%eax, -36(%ebp)
.LVL30:
	.loc 1 65 0
	movl	$0, -28(%ebp)
.LVL31:
	jmp	.L16
.LVL32:
.L19:
	.loc 1 66 0
	cmpl	$31, -28(%ebp)
	ja	.L36
	.loc 1 68 0
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	strlen
.LVL33:
	addl	$16, %esp
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	subl	%edx, %eax
	subl	$1, %eax
	andl	$-4, %eax
	movl	%eax, -36(%ebp)
.LVL34:
	.loc 1 69 0
	movl	-28(%ebp), %eax
.LVL35:
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	strlen
.LVL36:
	addl	$16, %esp
	addl	$1, %eax
	movl	%eax, %ecx
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	pushl	%ecx
	pushl	%eax
	pushl	-36(%ebp)
	pushl	-44(%ebp)
	call	copyout
.LVL37:
	addl	$16, %esp
	testl	%eax, %eax
	js	.L37
	.loc 1 71 0 discriminator 2
	movl	-28(%ebp), %eax
	leal	3(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, -192(%ebp,%edx,4)
	.loc 1 65 0 discriminator 2
	addl	$1, -28(%ebp)
.L16:
	.loc 1 65 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L19
	.loc 1 73 0 is_stmt 1
	movl	-28(%ebp), %eax
	addl	$3, %eax
	movl	$0, -192(%ebp,%eax,4)
	.loc 1 75 0
	movl	$-1, -192(%ebp)
	.loc 1 76 0
	movl	-28(%ebp), %eax
	movl	%eax, -188(%ebp)
	.loc 1 77 0
	movl	-28(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	subl	%edx, %eax
	movl	%eax, -184(%ebp)
	.loc 1 79 0
	movl	-28(%ebp), %eax
	addl	$4, %eax
	sall	$2, %eax
	subl	%eax, -36(%ebp)
.LVL38:
	.loc 1 80 0
	movl	-28(%ebp), %eax
	addl	$4, %eax
	sall	$2, %eax
	pushl	%eax
	leal	-192(%ebp), %eax
	pushl	%eax
	pushl	-36(%ebp)
	pushl	-44(%ebp)
	call	copyout
.LVL39:
	addl	$16, %esp
	testl	%eax, %eax
	js	.L38
	.loc 1 84 0
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
.LVL40:
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
.LVL41:
	jmp	.L21
.LVL42:
.L23:
	.loc 1 85 0
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jne	.L22
	.loc 1 86 0
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
.LVL43:
.L22:
	.loc 1 84 0 discriminator 2
	addl	$1, -12(%ebp)
.LVL44:
.L21:
	.loc 1 84 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L23
	.loc 1 87 0 is_stmt 1
	movl	%gs:4, %eax
	addl	$108, %eax
	subl	$4, %esp
	pushl	$16
	pushl	-16(%ebp)
	pushl	%eax
	call	safestrcpy
.LVL45:
	addl	$16, %esp
	.loc 1 90 0
	movl	%gs:4, %eax
	movl	4(%eax), %eax
	movl	%eax, -48(%ebp)
.LVL46:
	.loc 1 91 0
	movl	%gs:4, %eax
.LVL47:
	movl	-44(%ebp), %edx
	movl	%edx, 4(%eax)
.LVL48:
	.loc 1 92 0
	movl	%gs:4, %eax
	movl	-32(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 93 0
	movl	%gs:4, %eax
	movl	24(%eax), %eax
	movl	-220(%ebp), %edx
	movl	%edx, 56(%eax)
	.loc 1 94 0
	movl	%gs:4, %eax
	movl	24(%eax), %eax
	movl	-36(%ebp), %edx
	movl	%edx, 68(%eax)
	.loc 1 95 0
	movl	%gs:4, %eax
	subl	$12, %esp
	pushl	%eax
	call	switchuvm
.LVL49:
	addl	$16, %esp
	.loc 1 96 0
	subl	$12, %esp
	pushl	-48(%ebp)
	call	freevm
.LVL50:
	addl	$16, %esp
	.loc 1 97 0
	movl	$0, %eax
	jmp	.L26
.LVL51:
.L27:
	.loc 1 31 0
	nop
	jmp	.L5
.L28:
	.loc 1 33 0
	nop
	jmp	.L5
.LVL52:
.L29:
	.loc 1 36 0
	nop
	jmp	.L5
.LVL53:
.L30:
	.loc 1 42 0
	nop
	jmp	.L5
.L32:
	.loc 1 46 0
	nop
	jmp	.L5
.LVL54:
.L33:
	.loc 1 48 0
	nop
	jmp	.L5
.LVL55:
.L34:
	.loc 1 50 0
	nop
	jmp	.L5
.LVL56:
.L35:
	.loc 1 60 0
	nop
	jmp	.L5
.LVL57:
.L36:
	.loc 1 67 0
	nop
	jmp	.L5
.L37:
	.loc 1 70 0
	nop
	jmp	.L5
.L38:
	.loc 1 81 0
	nop
.LVL58:
.L5:
	.loc 1 100 0
	cmpl	$0, -44(%ebp)
	je	.L24
	.loc 1 101 0
	subl	$12, %esp
	pushl	-44(%ebp)
	call	freevm
.LVL59:
	addl	$16, %esp
.L24:
	.loc 1 102 0
	cmpl	$0, -40(%ebp)
	je	.L25
	.loc 1 103 0
	subl	$12, %esp
	pushl	-40(%ebp)
	call	iunlockput
.LVL60:
	addl	$16, %esp
	.loc 1 104 0
	call	end_op
.LVL61:
.L25:
	.loc 1 106 0
	movl	$-1, %eax
.LVL62:
.L26:
	.loc 1 107 0 discriminator 1
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	exec, .-exec
.Letext0:
	.file 2 "types.h"
	.file 3 "proc.h"
	.file 4 "x86.h"
	.file 5 "elf.h"
	.file 6 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x7a4
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF79
	.byte	0xc
	.long	.LASF80
	.long	.LASF81
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
	.byte	0x4
	.uleb128 0x5
	.long	.LASF8
	.byte	0x14
	.byte	0x3
	.byte	0x2c
	.long	0xbb
	.uleb128 0x6
	.string	"edi"
	.byte	0x3
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"esi"
	.byte	0x3
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ebx"
	.byte	0x3
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"ebp"
	.byte	0x3
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"eip"
	.byte	0x3
	.byte	0x31
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x68
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.long	.LASF9
	.byte	0x7c
	.byte	0x3
	.byte	0x37
	.long	0x190
	.uleb128 0x6
	.string	"sz"
	.byte	0x3
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF10
	.byte	0x3
	.byte	0x39
	.long	0x1cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF11
	.byte	0x3
	.byte	0x3a
	.long	0x1d1
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF12
	.byte	0x3
	.byte	0x3b
	.long	0x196
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"pid"
	.byte	0x3
	.byte	0x3c
	.long	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF13
	.byte	0x3
	.byte	0x3d
	.long	0x190
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"tf"
	.byte	0x3
	.byte	0x3e
	.long	0x343
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF8
	.byte	0x3
	.byte	0x3f
	.long	0xbb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.long	.LASF14
	.byte	0x3
	.byte	0x40
	.long	0x66
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF15
	.byte	0x3
	.byte	0x41
	.long	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x9
	.long	.LASF16
	.byte	0x3
	.byte	0x42
	.long	0x349
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.string	"cwd"
	.byte	0x3
	.byte	0x43
	.long	0x36b
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.long	.LASF17
	.byte	0x3
	.byte	0x44
	.long	0x371
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0xcf
	.uleb128 0xa
	.long	.LASF82
	.byte	0x4
	.long	0x30
	.byte	0x3
	.byte	0x34
	.long	0x1cb
	.uleb128 0xb
	.long	.LASF18
	.byte	0
	.uleb128 0xb
	.long	.LASF19
	.byte	0x1
	.uleb128 0xb
	.long	.LASF20
	.byte	0x2
	.uleb128 0xb
	.long	.LASF21
	.byte	0x3
	.uleb128 0xb
	.long	.LASF22
	.byte	0x4
	.uleb128 0xb
	.long	.LASF23
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x5b
	.uleb128 0x7
	.byte	0x4
	.long	0x1d7
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF24
	.uleb128 0x5
	.long	.LASF25
	.byte	0x4c
	.byte	0x4
	.byte	0x9c
	.long	0x343
	.uleb128 0x6
	.string	"edi"
	.byte	0x4
	.byte	0x9e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"esi"
	.byte	0x4
	.byte	0x9f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ebp"
	.byte	0x4
	.byte	0xa0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0xa1
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"ebx"
	.byte	0x4
	.byte	0xa2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.string	"edx"
	.byte	0x4
	.byte	0xa3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"ecx"
	.byte	0x4
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.string	"eax"
	.byte	0x4
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.string	"gs"
	.byte	0x4
	.byte	0xa8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0xa9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x6
	.string	"fs"
	.byte	0x4
	.byte	0xaa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0xab
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x6
	.string	"es"
	.byte	0x4
	.byte	0xac
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x6
	.string	"ds"
	.byte	0x4
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0xb0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x6
	.string	"err"
	.byte	0x4
	.byte	0xb3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x6
	.string	"eip"
	.byte	0x4
	.byte	0xb4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x6
	.string	"cs"
	.byte	0x4
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0xb7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x6
	.string	"esp"
	.byte	0x4
	.byte	0xba
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.string	"ss"
	.byte	0x4
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x1de
	.uleb128 0xc
	.long	0x359
	.long	0x359
	.uleb128 0xd
	.long	0xc1
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x35f
	.uleb128 0xe
	.long	.LASF35
	.byte	0x1
	.uleb128 0xe
	.long	.LASF36
	.byte	0x1
	.uleb128 0x7
	.byte	0x4
	.long	0x365
	.uleb128 0xc
	.long	0x1d7
	.long	0x381
	.uleb128 0xd
	.long	0xc1
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.long	.LASF37
	.byte	0x34
	.byte	0x5
	.byte	0x6
	.long	0x460
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.byte	0x7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"elf"
	.byte	0x5
	.byte	0x8
	.long	0x460
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.byte	0x9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.byte	0xa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x9
	.long	.LASF41
	.byte	0x5
	.byte	0xb
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.long	.LASF42
	.byte	0x5
	.byte	0xc
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF43
	.byte	0x5
	.byte	0xd
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.long	.LASF44
	.byte	0x5
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF45
	.byte	0x5
	.byte	0xf
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x9
	.long	.LASF46
	.byte	0x5
	.byte	0x10
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF47
	.byte	0x5
	.byte	0x11
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x9
	.long	.LASF48
	.byte	0x5
	.byte	0x12
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x9
	.long	.LASF49
	.byte	0x5
	.byte	0x13
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x9
	.long	.LASF50
	.byte	0x5
	.byte	0x14
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF51
	.byte	0x5
	.byte	0x15
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.byte	0
	.uleb128 0xc
	.long	0x49
	.long	0x470
	.uleb128 0xd
	.long	0xc1
	.byte	0xb
	.byte	0
	.uleb128 0x5
	.long	.LASF52
	.byte	0x20
	.byte	0x5
	.byte	0x19
	.long	0x4ed
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.byte	0x1a
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"off"
	.byte	0x5
	.byte	0x1b
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF53
	.byte	0x5
	.byte	0x1c
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF54
	.byte	0x5
	.byte	0x1d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.long	.LASF55
	.byte	0x5
	.byte	0x1e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF56
	.byte	0x5
	.byte	0x1f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.long	.LASF45
	.byte	0x5
	.byte	0x20
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF57
	.byte	0x5
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF83
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.long	0xc8
	.long	.LFB20
	.long	.LFE20
	.long	.LLST0
	.byte	0x1
	.long	0x6bd
	.uleb128 0x10
	.long	.LASF58
	.byte	0x1
	.byte	0xb
	.long	0x1d1
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.long	.LASF59
	.byte	0x1
	.byte	0xb
	.long	0x6bd
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.string	"s"
	.byte	0x1
	.byte	0xd
	.long	0x1d1
	.long	.LLST1
	.uleb128 0x12
	.long	.LASF60
	.byte	0x1
	.byte	0xd
	.long	0x1d1
	.long	.LLST2
	.uleb128 0x11
	.string	"i"
	.byte	0x1
	.byte	0xe
	.long	0xc8
	.long	.LLST3
	.uleb128 0x11
	.string	"off"
	.byte	0x1
	.byte	0xe
	.long	0xc8
	.long	.LLST4
	.uleb128 0x12
	.long	.LASF61
	.byte	0x1
	.byte	0xf
	.long	0x25
	.long	.LLST5
	.uleb128 0x11
	.string	"sz"
	.byte	0x1
	.byte	0xf
	.long	0x25
	.long	.LLST6
	.uleb128 0x11
	.string	"sp"
	.byte	0x1
	.byte	0xf
	.long	0x25
	.long	.LLST7
	.uleb128 0x13
	.long	.LASF62
	.byte	0x1
	.byte	0xf
	.long	0x6c3
	.byte	0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x14
	.string	"elf"
	.byte	0x1
	.byte	0x10
	.long	0x381
	.byte	0x3
	.byte	0x91
	.sleb128 -252
	.uleb128 0x11
	.string	"ip"
	.byte	0x1
	.byte	0x11
	.long	0x36b
	.long	.LLST8
	.uleb128 0x14
	.string	"ph"
	.byte	0x1
	.byte	0x12
	.long	0x470
	.byte	0x3
	.byte	0x91
	.sleb128 -284
	.uleb128 0x12
	.long	.LASF10
	.byte	0x1
	.byte	0x13
	.long	0x1cb
	.long	.LLST9
	.uleb128 0x12
	.long	.LASF63
	.byte	0x1
	.byte	0x13
	.long	0x1cb
	.long	.LLST10
	.uleb128 0x15
	.string	"bad"
	.byte	0x1
	.byte	0x63
	.long	.L5
	.uleb128 0x16
	.long	.LVL1
	.long	0x6e4
	.uleb128 0x16
	.long	.LVL2
	.long	0x6f1
	.uleb128 0x16
	.long	.LVL4
	.long	0x6fe
	.uleb128 0x16
	.long	.LVL6
	.long	0x70b
	.uleb128 0x16
	.long	.LVL8
	.long	0x718
	.uleb128 0x16
	.long	.LVL9
	.long	0x725
	.uleb128 0x16
	.long	.LVL16
	.long	0x718
	.uleb128 0x16
	.long	.LVL17
	.long	0x732
	.uleb128 0x16
	.long	.LVL20
	.long	0x73f
	.uleb128 0x16
	.long	.LVL22
	.long	0x74c
	.uleb128 0x16
	.long	.LVL23
	.long	0x6fe
	.uleb128 0x16
	.long	.LVL26
	.long	0x732
	.uleb128 0x16
	.long	.LVL29
	.long	0x759
	.uleb128 0x16
	.long	.LVL33
	.long	0x766
	.uleb128 0x16
	.long	.LVL36
	.long	0x766
	.uleb128 0x16
	.long	.LVL37
	.long	0x773
	.uleb128 0x16
	.long	.LVL39
	.long	0x773
	.uleb128 0x16
	.long	.LVL45
	.long	0x780
	.uleb128 0x16
	.long	.LVL49
	.long	0x78d
	.uleb128 0x16
	.long	.LVL50
	.long	0x79a
	.uleb128 0x16
	.long	.LVL59
	.long	0x79a
	.uleb128 0x16
	.long	.LVL60
	.long	0x74c
	.uleb128 0x16
	.long	.LVL61
	.long	0x6fe
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x1d1
	.uleb128 0xc
	.long	0x25
	.long	0x6d3
	.uleb128 0xd
	.long	0xc1
	.byte	0x23
	.byte	0
	.uleb128 0x17
	.long	.LASF9
	.byte	0x3
	.byte	0x1f
	.long	.LASF84
	.long	0x190
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF64
	.long	.LASF64
	.byte	0x6
	.byte	0x56
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF65
	.long	.LASF65
	.byte	0x6
	.byte	0x31
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF66
	.long	.LASF66
	.byte	0x6
	.byte	0x57
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF67
	.long	.LASF67
	.byte	0x6
	.byte	0x2b
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF68
	.long	.LASF68
	.byte	0x6
	.byte	0x33
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF69
	.long	.LASF69
	.byte	0x6
	.byte	0xa9
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF70
	.long	.LASF70
	.byte	0x6
	.byte	0xab
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF71
	.long	.LASF71
	.byte	0x6
	.byte	0xaf
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF72
	.long	.LASF72
	.byte	0x6
	.byte	0x2e
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF73
	.long	.LASF73
	.byte	0x6
	.byte	0xb4
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF74
	.long	.LASF74
	.byte	0x6
	.byte	0x8b
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF75
	.long	.LASF75
	.byte	0x6
	.byte	0xb3
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF76
	.long	.LASF76
	.byte	0x6
	.byte	0x8a
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF77
	.long	.LASF77
	.byte	0x6
	.byte	0xb1
	.uleb128 0x18
	.byte	0x1
	.byte	0x1
	.long	.LASF78
	.long	.LASF78
	.byte	0x6
	.byte	0xad
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x18
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
	.long	.LFB20-.Ltext0
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
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LVL40-.Ltext0
	.long	.LVL42-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL42-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST2:
	.long	.LVL41-.Ltext0
	.long	.LVL42-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL42-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST3:
	.long	.LVL12-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL15-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL53-.Ltext0
	.long	.LVL58-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST4:
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL15-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL53-.Ltext0
	.long	.LVL58-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST5:
	.long	.LVL31-.Ltext0
	.long	.LVL32-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -48
	.long	.LVL32-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL57-.Ltext0
	.long	.LVL58-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST6:
	.long	.LVL11-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL18-.Ltext0
	.long	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL19-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL24-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL25-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL27-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL28-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL53-.Ltext0
	.long	.LVL54-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL54-.Ltext0
	.long	.LVL55-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL55-.Ltext0
	.long	.LVL56-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL56-.Ltext0
	.long	.LVL57-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL57-.Ltext0
	.long	.LVL58-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	0
	.long	0
.LLST7:
	.long	.LVL30-.Ltext0
	.long	.LVL32-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL32-.Ltext0
	.long	.LVL34-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -44
	.long	.LVL34-.Ltext0
	.long	.LVL35-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL35-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -44
	.long	.LVL57-.Ltext0
	.long	.LVL58-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -44
	.long	0
	.long	0
.LLST8:
	.long	.LVL3-.Ltext0
	.long	.LVL4-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL4-1-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -48
	.long	.LVL5-.Ltext0
	.long	.LVL6-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL6-1-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -48
	.long	0
	.long	0
.LLST9:
	.long	.LVL7-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -52
	.long	.LVL10-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL13-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -52
	.long	.LVL52-.Ltext0
	.long	.LVL53-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL53-.Ltext0
	.long	.LVL62-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -52
	.long	0
	.long	0
.LLST10:
	.long	.LVL46-.Ltext0
	.long	.LVL47-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL47-.Ltext0
	.long	.LVL48-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 4
	.long	.LVL48-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -56
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
.LASF44:
	.string	"shoff"
.LASF56:
	.string	"memsz"
.LASF54:
	.string	"paddr"
.LASF19:
	.string	"EMBRYO"
.LASF20:
	.string	"SLEEPING"
.LASF36:
	.string	"inode"
.LASF21:
	.string	"RUNNABLE"
.LASF12:
	.string	"state"
.LASF64:
	.string	"begin_op"
.LASF84:
	.string	"%gs:4"
.LASF80:
	.string	"exec.c"
.LASF7:
	.string	"sizetype"
.LASF33:
	.string	"eflags"
.LASF25:
	.string	"trapframe"
.LASF0:
	.string	"uint"
.LASF35:
	.string	"file"
.LASF50:
	.string	"shnum"
.LASF66:
	.string	"end_op"
.LASF48:
	.string	"phnum"
.LASF47:
	.string	"phentsize"
.LASF52:
	.string	"proghdr"
.LASF13:
	.string	"parent"
.LASF15:
	.string	"killed"
.LASF63:
	.string	"oldpgdir"
.LASF79:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF83:
	.string	"exec"
.LASF49:
	.string	"shentsize"
.LASF1:
	.string	"ushort"
.LASF28:
	.string	"padding2"
.LASF29:
	.string	"padding3"
.LASF30:
	.string	"padding4"
.LASF6:
	.string	"pde_t"
.LASF34:
	.string	"padding6"
.LASF27:
	.string	"padding1"
.LASF77:
	.string	"switchuvm"
.LASF8:
	.string	"context"
.LASF4:
	.string	"uchar"
.LASF55:
	.string	"filesz"
.LASF72:
	.string	"iunlockput"
.LASF17:
	.string	"name"
.LASF45:
	.string	"flags"
.LASF42:
	.string	"entry"
.LASF32:
	.string	"padding5"
.LASF71:
	.string	"loaduvm"
.LASF16:
	.string	"ofile"
.LASF5:
	.string	"unsigned char"
.LASF43:
	.string	"phoff"
.LASF61:
	.string	"argc"
.LASF78:
	.string	"freevm"
.LASF65:
	.string	"namei"
.LASF9:
	.string	"proc"
.LASF39:
	.string	"type"
.LASF2:
	.string	"unsigned int"
.LASF59:
	.string	"argv"
.LASF60:
	.string	"last"
.LASF51:
	.string	"shstrndx"
.LASF11:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF76:
	.string	"safestrcpy"
.LASF14:
	.string	"chan"
.LASF24:
	.string	"char"
.LASF53:
	.string	"vaddr"
.LASF22:
	.string	"RUNNING"
.LASF74:
	.string	"strlen"
.LASF18:
	.string	"UNUSED"
.LASF46:
	.string	"ehsize"
.LASF73:
	.string	"clearpteu"
.LASF31:
	.string	"trapno"
.LASF40:
	.string	"machine"
.LASF69:
	.string	"setupkvm"
.LASF68:
	.string	"readi"
.LASF58:
	.string	"path"
.LASF70:
	.string	"allocuvm"
.LASF67:
	.string	"ilock"
.LASF26:
	.string	"oesp"
.LASF82:
	.string	"procstate"
.LASF75:
	.string	"copyout"
.LASF38:
	.string	"magic"
.LASF10:
	.string	"pgdir"
.LASF62:
	.string	"ustack"
.LASF37:
	.string	"elfhdr"
.LASF81:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF57:
	.string	"align"
.LASF23:
	.string	"ZOMBIE"
.LASF41:
	.string	"version"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
