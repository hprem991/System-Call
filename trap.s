	.file	"trap.c"
	.text
.Ltext0:
	.type	lidt, @function
lidt:
.LFB10:
	.file 1 "x86.h"
	.loc 1 78 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 81 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -6(%ebp)
	.loc 1 82 0
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	.loc 1 83 0
	movl	8(%ebp), %eax
	shrl	$16, %eax
	movw	%ax, -2(%ebp)
	.loc 1 85 0
	leal	-6(%ebp), %eax
#APP
# 85 "x86.h" 1
	lidt (%eax)
# 0 "" 2
	.loc 1 86 0
#NO_APP
	nop
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	lidt, .-lidt
	.type	rcr2, @function
rcr2:
.LFB17:
	.loc 1 135 0
	.cfi_startproc
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 137 0
#APP
# 137 "x86.h" 1
	movl %cr2,%eax
# 0 "" 2
#NO_APP
	movl	%eax, -4(%ebp)
.LVL1:
	.loc 1 138 0
	movl	-4(%ebp), %eax
	.loc 1 139 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	rcr2, .-rcr2
	.comm	idt,2048,32
	.comm	tickslock,52,32
	.comm	ticks,4,4
	.section	.rodata
.LC0:
	.string	"time"
	.text
	.globl	tvinit
	.type	tvinit, @function
tvinit:
.LFB20:
	.file 2 "trap.c"
	.loc 2 20 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 23 0
	movl	$0, -12(%ebp)
.LVL2:
	jmp	.L5
.L6:
	.loc 2 24 0 discriminator 3
	movl	-12(%ebp), %eax
	movl	vectors(,%eax,4), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movw	%dx, idt(,%eax,8)
	movl	-12(%ebp), %eax
	movw	$8, idt+2(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+4(,%eax,8), %edx
	andl	$-32, %edx
	movb	%dl, idt+4(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+4(,%eax,8), %edx
	andl	$31, %edx
	movb	%dl, idt+4(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+5(,%eax,8), %edx
	andl	$-16, %edx
	orl	$14, %edx
	movb	%dl, idt+5(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+5(,%eax,8), %edx
	andl	$-17, %edx
	movb	%dl, idt+5(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+5(,%eax,8), %edx
	andl	$-97, %edx
	movb	%dl, idt+5(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+5(,%eax,8), %edx
	orl	$-128, %edx
	movb	%dl, idt+5(,%eax,8)
	movl	-12(%ebp), %eax
	movl	vectors(,%eax,4), %eax
	shrl	$16, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movw	%dx, idt+6(,%eax,8)
	.loc 2 23 0 discriminator 3
	addl	$1, -12(%ebp)
.LVL3:
.L5:
	.loc 2 23 0 is_stmt 0 discriminator 1
	cmpl	$255, -12(%ebp)
	jle	.L6
	.loc 2 25 0 is_stmt 1
	movl	vectors+256, %eax
	movw	%ax, idt+512
	movw	$8, idt+514
	movzbl	idt+516, %eax
	andl	$-32, %eax
	movb	%al, idt+516
	movzbl	idt+516, %eax
	andl	$31, %eax
	movb	%al, idt+516
	movzbl	idt+517, %eax
	orl	$15, %eax
	movb	%al, idt+517
	movzbl	idt+517, %eax
	andl	$-17, %eax
	movb	%al, idt+517
	movzbl	idt+517, %eax
	orl	$96, %eax
	movb	%al, idt+517
	movzbl	idt+517, %eax
	orl	$-128, %eax
	movb	%al, idt+517
	movl	vectors+256, %eax
	shrl	$16, %eax
	movw	%ax, idt+518
	.loc 2 27 0
	movl	vectors+260, %eax
	movw	%ax, idt+520
	movw	$8, idt+522
	movzbl	idt+524, %eax
	andl	$-32, %eax
	movb	%al, idt+524
	movzbl	idt+524, %eax
	andl	$31, %eax
	movb	%al, idt+524
	movzbl	idt+525, %eax
	orl	$15, %eax
	movb	%al, idt+525
	movzbl	idt+525, %eax
	andl	$-17, %eax
	movb	%al, idt+525
	movzbl	idt+525, %eax
	orl	$96, %eax
	movb	%al, idt+525
	movzbl	idt+525, %eax
	orl	$-128, %eax
	movb	%al, idt+525
	movl	vectors+260, %eax
	shrl	$16, %eax
	movw	%ax, idt+526
	.loc 2 28 0
	movl	vectors+264, %eax
	movw	%ax, idt+528
	movw	$8, idt+530
	movzbl	idt+532, %eax
	andl	$-32, %eax
	movb	%al, idt+532
	movzbl	idt+532, %eax
	andl	$31, %eax
	movb	%al, idt+532
	movzbl	idt+533, %eax
	orl	$15, %eax
	movb	%al, idt+533
	movzbl	idt+533, %eax
	andl	$-17, %eax
	movb	%al, idt+533
	movzbl	idt+533, %eax
	orl	$96, %eax
	movb	%al, idt+533
	movzbl	idt+533, %eax
	orl	$-128, %eax
	movb	%al, idt+533
	movl	vectors+264, %eax
	shrl	$16, %eax
	movw	%ax, idt+534
	.loc 2 30 0
	subl	$8, %esp
	pushl	$.LC0
	pushl	$tickslock
	call	initlock
.LVL4:
	addl	$16, %esp
	.loc 2 31 0
	nop
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL5:
	ret
	.cfi_endproc
.LFE20:
	.size	tvinit, .-tvinit
	.globl	idtinit
	.type	idtinit, @function
idtinit:
.LFB21:
	.loc 2 35 0
	.cfi_startproc
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	.loc 2 36 0
	pushl	$2048
	pushl	$idt
	call	lidt
.LVL6:
	addl	$8, %esp
	.loc 2 37 0
	nop
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	idtinit, .-idtinit
	.section	.rodata
	.align 4
.LC1:
	.string	"cpu%d: spurious interrupt at %x:%x\n"
	.align 4
.LC2:
	.string	"unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n"
.LC3:
	.string	"trap"
	.align 4
.LC4:
	.string	"pid %d %s: trap %d err %d on cpu %d eip 0x%x addr 0x%x--kill proc\n"
	.text
	.globl	trap
	.type	trap, @function
trap:
.LFB22:
	.loc 2 42 0
	.cfi_startproc
.LVL7:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 2 43 0
	movl	8(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$64, %eax
	jne	.L9
	.loc 2 44 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L10
	.loc 2 45 0
	call	exit
.LVL8:
.L10:
	.loc 2 46 0
	movl	%gs:4, %eax
	movl	8(%ebp), %edx
	movl	%edx, 24(%eax)
	.loc 2 47 0
	call	syscall
.LVL9:
	.loc 2 48 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L33
	.loc 2 49 0
	call	exit
.LVL10:
	.loc 2 50 0
	jmp	.L33
.L9:
	.loc 2 53 0
	movl	8(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$65, %eax
	jne	.L13
	.loc 2 54 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L14
	.loc 2 55 0
	call	exit
.LVL11:
.L14:
	.loc 2 56 0
	movl	%gs:4, %eax
	movl	8(%ebp), %edx
	movl	%edx, 24(%eax)
	.loc 2 57 0
	call	ls_syscall
.LVL12:
	.loc 2 58 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L34
	.loc 2 59 0
	call	exit
.LVL13:
	.loc 2 60 0
	jmp	.L34
.L13:
	.loc 2 63 0
	movl	8(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$66, %eax
	jne	.L16
	.loc 2 64 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L17
	.loc 2 65 0
	call	exit
.LVL14:
.L17:
	.loc 2 66 0
	movl	%gs:4, %eax
	movl	8(%ebp), %edx
	movl	%edx, 24(%eax)
	.loc 2 67 0
	call	ht_syscall
.LVL15:
	.loc 2 68 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L35
	.loc 2 69 0
	call	exit
.LVL16:
	.loc 2 70 0
	jmp	.L35
.L16:
	.loc 2 74 0
	movl	8(%ebp), %eax
	movl	48(%eax), %eax
	subl	$32, %eax
	cmpl	$31, %eax
	ja	.L19
	movl	.L21(,%eax,4), %eax
	jmp	*%eax
	.section	.rodata
	.align 4
	.align 4
.L21:
	.long	.L20
	.long	.L22
	.long	.L19
	.long	.L19
	.long	.L23
	.long	.L19
	.long	.L19
	.long	.L24
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L25
	.long	.L36
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L19
	.long	.L24
	.text
.L20:
	.loc 2 76 0
	movl	%gs:0, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L27
	.loc 2 77 0
	subl	$12, %esp
	pushl	$tickslock
	call	acquire
.LVL17:
	addl	$16, %esp
	.loc 2 78 0
	movl	ticks, %eax
	addl	$1, %eax
	movl	%eax, ticks
	.loc 2 79 0
	subl	$12, %esp
	pushl	$ticks
	call	wakeup
.LVL18:
	addl	$16, %esp
	.loc 2 80 0
	subl	$12, %esp
	pushl	$tickslock
	call	release
.LVL19:
	addl	$16, %esp
.L27:
	.loc 2 82 0
	call	lapiceoi
.LVL20:
	.loc 2 83 0
	jmp	.L28
.L25:
	.loc 2 85 0
	call	ideintr
.LVL21:
	.loc 2 86 0
	call	lapiceoi
.LVL22:
	.loc 2 87 0
	jmp	.L28
.L22:
	.loc 2 92 0
	call	kbdintr
.LVL23:
	.loc 2 93 0
	call	lapiceoi
.LVL24:
	.loc 2 94 0
	jmp	.L28
.L23:
	.loc 2 96 0
	call	uartintr
.LVL25:
	.loc 2 97 0
	call	lapiceoi
.LVL26:
	.loc 2 98 0
	jmp	.L28
.L24:
	.loc 2 101 0
	movl	8(%ebp), %eax
	movl	56(%eax), %ecx
	.loc 2 102 0
	movl	8(%ebp), %eax
	movzwl	60(%eax), %eax
	.loc 2 101 0
	movzwl	%ax, %edx
	.loc 2 102 0
	movl	%gs:0, %eax
	movzbl	(%eax), %eax
	.loc 2 101 0
	movzbl	%al, %eax
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$.LC1
	call	cprintf
.LVL27:
	addl	$16, %esp
	.loc 2 103 0
	call	lapiceoi
.LVL28:
	.loc 2 104 0
	jmp	.L28
.L19:
	.loc 2 108 0
	movl	%gs:4, %eax
	testl	%eax, %eax
	je	.L29
	.loc 2 108 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movzwl	60(%eax), %eax
	movzwl	%ax, %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L30
.L29:
	.loc 2 110 0 is_stmt 1
	call	rcr2
.LVL29:
	movl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	56(%eax), %ecx
	.loc 2 111 0
	movl	%gs:0, %eax
	movzbl	(%eax), %eax
	.loc 2 110 0
	movzbl	%al, %edx
	movl	8(%ebp), %eax
	movl	48(%eax), %eax
	subl	$12, %esp
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$.LC2
	call	cprintf
.LVL30:
	addl	$32, %esp
	.loc 2 112 0
	subl	$12, %esp
	pushl	$.LC3
	call	panic
.LVL31:
.L30:
	.loc 2 115 0
	call	rcr2
.LVL32:
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	movl	56(%eax), %esi
	.loc 2 117 0
	movl	%gs:0, %eax
	movzbl	(%eax), %eax
	.loc 2 115 0
	movzbl	%al, %ebx
	movl	8(%ebp), %eax
	movl	52(%eax), %ecx
	movl	8(%ebp), %eax
	movl	48(%eax), %edx
	.loc 2 117 0
	movl	%gs:4, %eax
	leal	108(%eax), %edi
	movl	%gs:4, %eax
	.loc 2 115 0
	movl	16(%eax), %eax
	pushl	-28(%ebp)
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%edi
	pushl	%eax
	pushl	$.LC4
	call	cprintf
.LVL33:
	addl	$32, %esp
	.loc 2 119 0
	movl	%gs:4, %eax
	movl	$1, 36(%eax)
	jmp	.L28
.L36:
	.loc 2 90 0
	nop
.L28:
	.loc 2 125 0
	movl	%gs:4, %eax
	testl	%eax, %eax
	je	.L31
	.loc 2 125 0 is_stmt 0 discriminator 1
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L31
	.loc 2 125 0 discriminator 2
	movl	8(%ebp), %eax
	movzwl	60(%eax), %eax
	movzwl	%ax, %eax
	andl	$3, %eax
	cmpl	$3, %eax
	jne	.L31
	.loc 2 126 0 is_stmt 1
	call	exit
.LVL34:
.L31:
	.loc 2 130 0
	movl	%gs:4, %eax
	testl	%eax, %eax
	je	.L32
	.loc 2 130 0 is_stmt 0 discriminator 1
	movl	%gs:4, %eax
	movl	12(%eax), %eax
	cmpl	$4, %eax
	jne	.L32
	.loc 2 130 0 discriminator 2
	movl	8(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$32, %eax
	jne	.L32
	.loc 2 131 0 is_stmt 1
	call	yield
.LVL35:
.L32:
	.loc 2 134 0
	movl	%gs:4, %eax
	testl	%eax, %eax
	je	.L8
	.loc 2 134 0 is_stmt 0 discriminator 1
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L8
	.loc 2 134 0 discriminator 2
	movl	8(%ebp), %eax
	movzwl	60(%eax), %eax
	movzwl	%ax, %eax
	andl	$3, %eax
	cmpl	$3, %eax
	jne	.L8
	.loc 2 135 0 is_stmt 1
	call	exit
.LVL36:
	jmp	.L8
.L33:
	.loc 2 50 0
	nop
	jmp	.L8
.L34:
	.loc 2 60 0
	nop
	jmp	.L8
.L35:
	.loc 2 70 0
	nop
.L8:
	.loc 2 136 0
	leal	-12(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	trap, .-trap
.Letext0:
	.file 3 "types.h"
	.file 4 "mmu.h"
	.file 5 "proc.h"
	.file 6 "spinlock.h"
	.file 7 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xb62
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF87
	.byte	0xc
	.long	.LASF88
	.long	.LASF89
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x3
	.byte	0x1
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x3
	.byte	0x2
	.long	0x42
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x3
	.byte	0x3
	.long	0x54
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x2
	.long	.LASF6
	.byte	0x3
	.byte	0x4
	.long	0x25
	.uleb128 0x4
	.long	.LASF14
	.byte	0x8
	.byte	0x4
	.byte	0x34
	.long	0x149
	.uleb128 0x5
	.long	.LASF7
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
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
	.byte	0x4
	.byte	0x97
	.long	0x354
	.uleb128 0x7
	.long	.LASF16
	.byte	0x4
	.byte	0x98
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF17
	.byte	0x4
	.byte	0x99
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ss0"
	.byte	0x4
	.byte	0x9a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF18
	.byte	0x4
	.byte	0x9b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x7
	.long	.LASF19
	.byte	0x4
	.byte	0x9c
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"ss1"
	.byte	0x4
	.byte	0x9d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF20
	.byte	0x4
	.byte	0x9e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x7
	.long	.LASF21
	.byte	0x4
	.byte	0x9f
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"ss2"
	.byte	0x4
	.byte	0xa0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.long	.LASF22
	.byte	0x4
	.byte	0xa1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x8
	.string	"cr3"
	.byte	0x4
	.byte	0xa2
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.string	"eip"
	.byte	0x4
	.byte	0xa3
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF23
	.byte	0x4
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.string	"eax"
	.byte	0x4
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.string	"ecx"
	.byte	0x4
	.byte	0xa6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.string	"edx"
	.byte	0x4
	.byte	0xa7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.string	"ebx"
	.byte	0x4
	.byte	0xa8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.string	"esp"
	.byte	0x4
	.byte	0xa9
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.string	"ebp"
	.byte	0x4
	.byte	0xaa
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x8
	.string	"esi"
	.byte	0x4
	.byte	0xab
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.string	"edi"
	.byte	0x4
	.byte	0xac
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.string	"es"
	.byte	0x4
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x7
	.long	.LASF24
	.byte	0x4
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x8
	.string	"cs"
	.byte	0x4
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x7
	.long	.LASF25
	.byte	0x4
	.byte	0xb0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x8
	.string	"ss"
	.byte	0x4
	.byte	0xb1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x7
	.long	.LASF26
	.byte	0x4
	.byte	0xb2
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x8
	.string	"ds"
	.byte	0x4
	.byte	0xb3
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x7
	.long	.LASF27
	.byte	0x4
	.byte	0xb4
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x8
	.string	"fs"
	.byte	0x4
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x7
	.long	.LASF28
	.byte	0x4
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x8
	.string	"gs"
	.byte	0x4
	.byte	0xb7
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x7
	.long	.LASF29
	.byte	0x4
	.byte	0xb8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x8
	.string	"ldt"
	.byte	0x4
	.byte	0xb9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x7
	.long	.LASF30
	.byte	0x4
	.byte	0xba
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x8
	.string	"t"
	.byte	0x4
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x7
	.long	.LASF31
	.byte	0x4
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
	.uleb128 0x4
	.long	.LASF32
	.byte	0x8
	.byte	0x4
	.byte	0xc1
	.long	0x3fd
	.uleb128 0x5
	.long	.LASF33
	.byte	0x4
	.byte	0xc2
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"cs"
	.byte	0x4
	.byte	0xc3
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF34
	.byte	0x4
	.byte	0xc4
	.long	0x25
	.byte	0x4
	.byte	0x5
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF12
	.byte	0x4
	.byte	0xc5
	.long	0x25
	.byte	0x4
	.byte	0x3
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF10
	.byte	0x4
	.byte	0xc6
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"s"
	.byte	0x4
	.byte	0xc7
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"dpl"
	.byte	0x4
	.byte	0xc8
	.long	0x25
	.byte	0x4
	.byte	0x2
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"p"
	.byte	0x4
	.byte	0xc9
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF35
	.byte	0x4
	.byte	0xca
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0xb
	.string	"cpu"
	.byte	0xbc
	.byte	0x5
	.byte	0x5
	.long	0x48b
	.uleb128 0x8
	.string	"id"
	.byte	0x5
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF36
	.byte	0x5
	.byte	0x7
	.long	0x4de
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ts"
	.byte	0x5
	.byte	0x8
	.long	0x149
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"gdt"
	.byte	0x5
	.byte	0x9
	.long	0x4e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x7
	.long	.LASF37
	.byte	0x5
	.byte	0xa
	.long	0x4fb
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x7
	.long	.LASF38
	.byte	0x5
	.byte	0xb
	.long	0x500
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x7
	.long	.LASF39
	.byte	0x5
	.byte	0xc
	.long	0x500
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x8
	.string	"cpu"
	.byte	0x5
	.byte	0xf
	.long	0x507
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x7
	.long	.LASF40
	.byte	0x5
	.byte	0x10
	.long	0x5ce
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x4
	.long	.LASF41
	.byte	0x14
	.byte	0x5
	.byte	0x2c
	.long	0x4de
	.uleb128 0x8
	.string	"edi"
	.byte	0x5
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"esi"
	.byte	0x5
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ebx"
	.byte	0x5
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"ebp"
	.byte	0x5
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"eip"
	.byte	0x5
	.byte	0x31
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x48b
	.uleb128 0xc
	.long	0x66
	.long	0x4f4
	.uleb128 0xd
	.long	0x4f4
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF42
	.uleb128 0xe
	.long	0x25
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x9
	.byte	0x4
	.long	0x3fd
	.uleb128 0x4
	.long	.LASF40
	.byte	0x7c
	.byte	0x5
	.byte	0x37
	.long	0x5ce
	.uleb128 0x8
	.string	"sz"
	.byte	0x5
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF43
	.byte	0x5
	.byte	0x39
	.long	0x609
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF44
	.byte	0x5
	.byte	0x3a
	.long	0x60f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF45
	.byte	0x5
	.byte	0x3b
	.long	0x5d4
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"pid"
	.byte	0x5
	.byte	0x3c
	.long	0x500
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF46
	.byte	0x5
	.byte	0x3d
	.long	0x5ce
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"tf"
	.byte	0x5
	.byte	0x3e
	.long	0x781
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.long	.LASF41
	.byte	0x5
	.byte	0x3f
	.long	0x4de
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.long	.LASF47
	.byte	0x5
	.byte	0x40
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF48
	.byte	0x5
	.byte	0x41
	.long	0x500
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.long	.LASF49
	.byte	0x5
	.byte	0x42
	.long	0x787
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.string	"cwd"
	.byte	0x5
	.byte	0x43
	.long	0x7a9
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x7
	.long	.LASF50
	.byte	0x5
	.byte	0x44
	.long	0x7af
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x50d
	.uleb128 0x10
	.long	.LASF90
	.byte	0x4
	.long	0x30
	.byte	0x5
	.byte	0x34
	.long	0x609
	.uleb128 0x11
	.long	.LASF51
	.byte	0
	.uleb128 0x11
	.long	.LASF52
	.byte	0x1
	.uleb128 0x11
	.long	.LASF53
	.byte	0x2
	.uleb128 0x11
	.long	.LASF54
	.byte	0x3
	.uleb128 0x11
	.long	.LASF55
	.byte	0x4
	.uleb128 0x11
	.long	.LASF56
	.byte	0x5
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x5b
	.uleb128 0x9
	.byte	0x4
	.long	0x615
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF57
	.uleb128 0x4
	.long	.LASF58
	.byte	0x4c
	.byte	0x1
	.byte	0x9c
	.long	0x781
	.uleb128 0x8
	.string	"edi"
	.byte	0x1
	.byte	0x9e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"esi"
	.byte	0x1
	.byte	0x9f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ebp"
	.byte	0x1
	.byte	0xa0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF59
	.byte	0x1
	.byte	0xa1
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"ebx"
	.byte	0x1
	.byte	0xa2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.string	"edx"
	.byte	0x1
	.byte	0xa3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"ecx"
	.byte	0x1
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.string	"eax"
	.byte	0x1
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.string	"gs"
	.byte	0x1
	.byte	0xa8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF18
	.byte	0x1
	.byte	0xa9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x8
	.string	"fs"
	.byte	0x1
	.byte	0xaa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.long	.LASF20
	.byte	0x1
	.byte	0xab
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x8
	.string	"es"
	.byte	0x1
	.byte	0xac
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x7
	.long	.LASF22
	.byte	0x1
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x8
	.string	"ds"
	.byte	0x1
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x7
	.long	.LASF24
	.byte	0x1
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x7
	.long	.LASF60
	.byte	0x1
	.byte	0xb0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.string	"err"
	.byte	0x1
	.byte	0xb3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.string	"eip"
	.byte	0x1
	.byte	0xb4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.string	"cs"
	.byte	0x1
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x7
	.long	.LASF25
	.byte	0x1
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x7
	.long	.LASF23
	.byte	0x1
	.byte	0xb7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.string	"esp"
	.byte	0x1
	.byte	0xba
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.string	"ss"
	.byte	0x1
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x7
	.long	.LASF26
	.byte	0x1
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x61c
	.uleb128 0xc
	.long	0x797
	.long	0x797
	.uleb128 0xd
	.long	0x4f4
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x79d
	.uleb128 0x12
	.long	.LASF61
	.byte	0x1
	.uleb128 0x12
	.long	.LASF62
	.byte	0x1
	.uleb128 0x9
	.byte	0x4
	.long	0x7a3
	.uleb128 0xc
	.long	0x615
	.long	0x7bf
	.uleb128 0xd
	.long	0x4f4
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF63
	.byte	0x34
	.byte	0x6
	.byte	0x2
	.long	0x804
	.uleb128 0x7
	.long	.LASF64
	.byte	0x6
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF50
	.byte	0x6
	.byte	0x6
	.long	0x60f
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"cpu"
	.byte	0x6
	.byte	0x7
	.long	0x507
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"pcs"
	.byte	0x6
	.byte	0x8
	.long	0x804
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0xc
	.long	0x25
	.long	0x814
	.uleb128 0xd
	.long	0x4f4
	.byte	0x9
	.byte	0
	.uleb128 0x13
	.long	.LASF91
	.byte	0x1
	.byte	0x4d
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.long	.LLST0
	.byte	0x1
	.long	0x855
	.uleb128 0x14
	.string	"p"
	.byte	0x1
	.byte	0x4d
	.long	0x855
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF65
	.byte	0x1
	.byte	0x4d
	.long	0x500
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.string	"pd"
	.byte	0x1
	.byte	0x4f
	.long	0x870
	.byte	0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x35c
	.uleb128 0xc
	.long	0x86b
	.long	0x86b
	.uleb128 0xd
	.long	0x4f4
	.byte	0x2
	.byte	0
	.uleb128 0xe
	.long	0x37
	.uleb128 0xe
	.long	0x85b
	.uleb128 0x17
	.long	.LASF92
	.byte	0x1
	.byte	0x86
	.byte	0x1
	.long	0x25
	.long	.LFB17
	.long	.LFE17
	.long	.LLST1
	.byte	0x1
	.long	0x8a0
	.uleb128 0x16
	.string	"val"
	.byte	0x1
	.byte	0x88
	.long	0x25
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF66
	.byte	0x2
	.byte	0x13
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST2
	.byte	0x1
	.long	0x8d1
	.uleb128 0x19
	.string	"i"
	.byte	0x2
	.byte	0x15
	.long	0x500
	.long	.LLST3
	.uleb128 0x1a
	.long	.LVL4
	.long	0xaa2
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF67
	.byte	0x2
	.byte	0x22
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST4
	.byte	0x1
	.long	0x8f5
	.uleb128 0x1a
	.long	.LVL6
	.long	0x814
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF68
	.byte	0x2
	.byte	0x29
	.byte	0x1
	.long	.LFB22
	.long	.LFE22
	.long	.LLST5
	.byte	0x1
	.long	0xa22
	.uleb128 0x14
	.string	"tf"
	.byte	0x2
	.byte	0x29
	.long	0x781
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.long	.LVL8
	.long	0xaaf
	.uleb128 0x1a
	.long	.LVL9
	.long	0xabc
	.uleb128 0x1a
	.long	.LVL10
	.long	0xaaf
	.uleb128 0x1a
	.long	.LVL11
	.long	0xaaf
	.uleb128 0x1a
	.long	.LVL12
	.long	0xac9
	.uleb128 0x1a
	.long	.LVL13
	.long	0xaaf
	.uleb128 0x1a
	.long	.LVL14
	.long	0xaaf
	.uleb128 0x1a
	.long	.LVL15
	.long	0xad6
	.uleb128 0x1a
	.long	.LVL16
	.long	0xaaf
	.uleb128 0x1a
	.long	.LVL17
	.long	0xae3
	.uleb128 0x1a
	.long	.LVL18
	.long	0xaf0
	.uleb128 0x1a
	.long	.LVL19
	.long	0xafd
	.uleb128 0x1a
	.long	.LVL20
	.long	0xb0a
	.uleb128 0x1a
	.long	.LVL21
	.long	0xb17
	.uleb128 0x1a
	.long	.LVL22
	.long	0xb0a
	.uleb128 0x1a
	.long	.LVL23
	.long	0xb24
	.uleb128 0x1a
	.long	.LVL24
	.long	0xb0a
	.uleb128 0x1a
	.long	.LVL25
	.long	0xb31
	.uleb128 0x1a
	.long	.LVL26
	.long	0xb0a
	.uleb128 0x1a
	.long	.LVL27
	.long	0xb3e
	.uleb128 0x1a
	.long	.LVL28
	.long	0xb0a
	.uleb128 0x1a
	.long	.LVL29
	.long	0x875
	.uleb128 0x1a
	.long	.LVL30
	.long	0xb3e
	.uleb128 0x1a
	.long	.LVL31
	.long	0xb4b
	.uleb128 0x1a
	.long	.LVL32
	.long	0x875
	.uleb128 0x1a
	.long	.LVL33
	.long	0xb3e
	.uleb128 0x1a
	.long	.LVL34
	.long	0xaaf
	.uleb128 0x1a
	.long	.LVL35
	.long	0xb58
	.uleb128 0x1a
	.long	.LVL36
	.long	0xaaf
	.byte	0
	.uleb128 0x1b
	.long	.LASF69
	.byte	0x2
	.byte	0x10
	.long	0x25
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ticks
	.uleb128 0x1b
	.long	.LASF70
	.byte	0x2
	.byte	0xf
	.long	0x7bf
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tickslock
	.uleb128 0x1c
	.string	"cpu"
	.byte	0x5
	.byte	0x1e
	.long	.LASF93
	.long	0x507
	.byte	0x1
	.byte	0x1
	.uleb128 0x1d
	.long	.LASF40
	.byte	0x5
	.byte	0x1f
	.long	.LASF94
	.long	0x5ce
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	0x35c
	.long	0xa78
	.uleb128 0xd
	.long	0x4f4
	.byte	0xff
	.byte	0
	.uleb128 0x1e
	.string	"idt"
	.byte	0x2
	.byte	0xd
	.long	0xa68
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	idt
	.uleb128 0xc
	.long	0x25
	.long	0xa95
	.uleb128 0x1f
	.byte	0
	.uleb128 0x20
	.long	.LASF71
	.byte	0x2
	.byte	0xe
	.long	0xa8a
	.byte	0x1
	.byte	0x1
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF72
	.long	.LASF72
	.byte	0x7
	.byte	0x81
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF73
	.long	.LASF73
	.byte	0x7
	.byte	0x6c
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF74
	.long	.LASF74
	.byte	0x7
	.byte	0x95
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF75
	.long	.LASF75
	.byte	0x7
	.byte	0xba
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF76
	.long	.LASF76
	.byte	0x7
	.byte	0xbb
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF77
	.long	.LASF77
	.byte	0x7
	.byte	0x7e
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF78
	.long	.LASF78
	.byte	0x7
	.byte	0x77
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF79
	.long	.LASF79
	.byte	0x7
	.byte	0x82
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF80
	.long	.LASF80
	.byte	0x7
	.byte	0x4e
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF81
	.long	.LASF81
	.byte	0x7
	.byte	0x39
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF82
	.long	.LASF82
	.byte	0x7
	.byte	0x48
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF83
	.long	.LASF83
	.byte	0x7
	.byte	0xa2
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF84
	.long	.LASF84
	.byte	0x7
	.byte	0x14
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF85
	.long	.LASF85
	.byte	0x7
	.byte	0x16
	.uleb128 0x21
	.byte	0x1
	.byte	0x1
	.long	.LASF86
	.long	.LASF86
	.byte	0x7
	.byte	0x78
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x21
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
	.long	.LFB10-.Ltext0
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
	.long	.LFE10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB17-.Ltext0
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
	.long	.LFE17-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB20-.Ltext0
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
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LVL2-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL5-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST4:
	.long	.LFB21-.Ltext0
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
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LFB22-.Ltext0
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
	.long	.LFE22-.Ltext0
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
.LASF69:
	.string	"ticks"
.LASF52:
	.string	"EMBRYO"
.LASF62:
	.string	"inode"
.LASF54:
	.string	"RUNNABLE"
.LASF45:
	.string	"state"
.LASF93:
	.string	"%gs:0"
.LASF79:
	.string	"release"
.LASF94:
	.string	"%gs:4"
.LASF66:
	.string	"tvinit"
.LASF8:
	.string	"base_15_0"
.LASF42:
	.string	"sizetype"
.LASF23:
	.string	"eflags"
.LASF58:
	.string	"trapframe"
.LASF12:
	.string	"rsv1"
.LASF85:
	.string	"panic"
.LASF14:
	.string	"segdesc"
.LASF72:
	.string	"initlock"
.LASF71:
	.string	"vectors"
.LASF0:
	.string	"uint"
.LASF53:
	.string	"SLEEPING"
.LASF61:
	.string	"file"
.LASF78:
	.string	"wakeup"
.LASF77:
	.string	"acquire"
.LASF48:
	.string	"killed"
.LASF84:
	.string	"cprintf"
.LASF16:
	.string	"link"
.LASF87:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF47:
	.string	"chan"
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
.LASF33:
	.string	"off_15_0"
.LASF13:
	.string	"base_31_24"
.LASF4:
	.string	"uchar"
.LASF25:
	.string	"padding5"
.LASF46:
	.string	"parent"
.LASF28:
	.string	"padding8"
.LASF7:
	.string	"lim_15_0"
.LASF75:
	.string	"ls_syscall"
.LASF9:
	.string	"base_23_16"
.LASF80:
	.string	"lapiceoi"
.LASF49:
	.string	"ofile"
.LASF5:
	.string	"unsigned char"
.LASF27:
	.string	"padding7"
.LASF68:
	.string	"trap"
.LASF86:
	.string	"yield"
.LASF31:
	.string	"iomb"
.LASF40:
	.string	"proc"
.LASF65:
	.string	"size"
.LASF10:
	.string	"type"
.LASF2:
	.string	"unsigned int"
.LASF34:
	.string	"args"
.LASF41:
	.string	"context"
.LASF55:
	.string	"RUNNING"
.LASF74:
	.string	"syscall"
.LASF37:
	.string	"started"
.LASF44:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF81:
	.string	"ideintr"
.LASF17:
	.string	"esp0"
.LASF19:
	.string	"esp1"
.LASF21:
	.string	"esp2"
.LASF57:
	.string	"char"
.LASF64:
	.string	"locked"
.LASF32:
	.string	"gatedesc"
.LASF91:
	.string	"lidt"
.LASF70:
	.string	"tickslock"
.LASF51:
	.string	"UNUSED"
.LASF30:
	.string	"padding10"
.LASF76:
	.string	"ht_syscall"
.LASF35:
	.string	"off_31_16"
.LASF60:
	.string	"trapno"
.LASF39:
	.string	"intena"
.LASF36:
	.string	"scheduler"
.LASF15:
	.string	"taskstate"
.LASF83:
	.string	"uartintr"
.LASF63:
	.string	"spinlock"
.LASF11:
	.string	"lim_19_16"
.LASF73:
	.string	"exit"
.LASF88:
	.string	"trap.c"
.LASF82:
	.string	"kbdintr"
.LASF50:
	.string	"name"
.LASF59:
	.string	"oesp"
.LASF90:
	.string	"procstate"
.LASF92:
	.string	"rcr2"
.LASF43:
	.string	"pgdir"
.LASF67:
	.string	"idtinit"
.LASF38:
	.string	"ncli"
.LASF89:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF56:
	.string	"ZOMBIE"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
