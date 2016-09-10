	.file	"vm.c"
	.text
.Ltext0:
	.type	lgdt, @function
lgdt:
.LFB7:
	.file 1 "x86.h"
	.loc 1 64 0
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
	.loc 1 67 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -6(%ebp)
	.loc 1 68 0
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	.loc 1 69 0
	movl	8(%ebp), %eax
	shrl	$16, %eax
	movw	%ax, -2(%ebp)
	.loc 1 71 0
	leal	-6(%ebp), %eax
#APP
# 71 "x86.h" 1
	lgdt (%eax)
# 0 "" 2
	.loc 1 72 0
#NO_APP
	nop
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	lgdt, .-lgdt
	.type	ltr, @function
ltr:
.LFB9:
	.loc 1 90 0
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
	.loc 1 91 0
	movzwl	-4(%ebp), %eax
#APP
# 91 "x86.h" 1
	ltr %ax
# 0 "" 2
	.loc 1 92 0
#NO_APP
	nop
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	ltr, .-ltr
	.type	loadgs, @function
loadgs:
.LFB11:
	.loc 1 104 0
	.cfi_startproc
.LVL2:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	.loc 1 105 0
	movzwl	-4(%ebp), %eax
#APP
# 105 "x86.h" 1
	movw %ax, %gs
# 0 "" 2
	.loc 1 106 0
#NO_APP
	nop
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	loadgs, .-loadgs
	.type	lcr3, @function
lcr3:
.LFB16:
	.loc 1 143 0
	.cfi_startproc
.LVL3:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	.loc 1 144 0
	movl	8(%ebp), %eax
#APP
# 144 "x86.h" 1
	movl %eax,%cr3
# 0 "" 2
	.loc 1 145 0
#NO_APP
	nop
	popl	%ebp
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	lcr3, .-lcr3
	.type	v2p, @function
v2p:
.LFB18:
	.file 2 "memlayout.h"
	.loc 2 13 0
	.cfi_startproc
.LVL4:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	.loc 2 13 0
	movl	8(%ebp), %eax
	addl	$-2147483648, %eax
	popl	%ebp
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	v2p, .-v2p
	.type	p2v, @function
p2v:
.LFB19:
	.loc 2 14 0
	.cfi_startproc
.LVL5:
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	.loc 2 14 0
	movl	8(%ebp), %eax
	addl	$-2147483648, %eax
	popl	%ebp
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	p2v, .-p2v
	.comm	kpgdir,4,4
	.comm	gdt,56,32
	.globl	seginit
	.type	seginit, @function
seginit:
.LFB20:
	.file 3 "vm.c"
	.loc 3 18 0
	.cfi_startproc
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	.loc 3 25 0
	call	cpunum
.LVL6:
	imull	$188, %eax, %eax
	addl	$cpus, %eax
	movl	%eax, -12(%ebp)
.LVL7:
	.loc 3 26 0
	movl	-12(%ebp), %eax
	movw	$-1, 120(%eax)
	movl	-12(%ebp), %eax
	movw	$0, 122(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 124(%eax)
	movl	-12(%ebp), %eax
	movzbl	125(%eax), %edx
	andl	$-16, %edx
	orl	$10, %edx
	movb	%dl, 125(%eax)
	movl	-12(%ebp), %eax
.LVL8:
	movzbl	125(%eax), %edx
	orl	$16, %edx
	movb	%dl, 125(%eax)
.LVL9:
	movl	-12(%ebp), %eax
	movzbl	125(%eax), %edx
	andl	$-97, %edx
	movb	%dl, 125(%eax)
	movl	-12(%ebp), %eax
	movzbl	125(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 125(%eax)
	movl	-12(%ebp), %eax
	movzbl	126(%eax), %edx
	orl	$15, %edx
	movb	%dl, 126(%eax)
	movl	-12(%ebp), %eax
	movzbl	126(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 126(%eax)
	movl	-12(%ebp), %eax
	movzbl	126(%eax), %edx
	andl	$-33, %edx
	movb	%dl, 126(%eax)
	movl	-12(%ebp), %eax
	movzbl	126(%eax), %edx
	orl	$64, %edx
	movb	%dl, 126(%eax)
	movl	-12(%ebp), %eax
	movzbl	126(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 126(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 127(%eax)
	.loc 3 27 0
	movl	-12(%ebp), %eax
	movw	$-1, 128(%eax)
	movl	-12(%ebp), %eax
	movw	$0, 130(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 132(%eax)
	movl	-12(%ebp), %eax
	movzbl	133(%eax), %edx
	andl	$-16, %edx
	orl	$2, %edx
	movb	%dl, 133(%eax)
	movl	-12(%ebp), %eax
	movzbl	133(%eax), %edx
	orl	$16, %edx
	movb	%dl, 133(%eax)
	movl	-12(%ebp), %eax
	movzbl	133(%eax), %edx
	andl	$-97, %edx
	movb	%dl, 133(%eax)
	movl	-12(%ebp), %eax
	movzbl	133(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 133(%eax)
	movl	-12(%ebp), %eax
	movzbl	134(%eax), %edx
	orl	$15, %edx
	movb	%dl, 134(%eax)
	movl	-12(%ebp), %eax
	movzbl	134(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 134(%eax)
	movl	-12(%ebp), %eax
	movzbl	134(%eax), %edx
	andl	$-33, %edx
	movb	%dl, 134(%eax)
	movl	-12(%ebp), %eax
	movzbl	134(%eax), %edx
	orl	$64, %edx
	movb	%dl, 134(%eax)
	movl	-12(%ebp), %eax
	movzbl	134(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 134(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 135(%eax)
	.loc 3 28 0
	movl	-12(%ebp), %eax
	movw	$-1, 144(%eax)
	movl	-12(%ebp), %eax
	movw	$0, 146(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 148(%eax)
	movl	-12(%ebp), %eax
	movzbl	149(%eax), %edx
	andl	$-16, %edx
	orl	$10, %edx
	movb	%dl, 149(%eax)
	movl	-12(%ebp), %eax
	movzbl	149(%eax), %edx
	orl	$16, %edx
	movb	%dl, 149(%eax)
	movl	-12(%ebp), %eax
	movzbl	149(%eax), %edx
	orl	$96, %edx
	movb	%dl, 149(%eax)
	movl	-12(%ebp), %eax
	movzbl	149(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 149(%eax)
	movl	-12(%ebp), %eax
	movzbl	150(%eax), %edx
	orl	$15, %edx
	movb	%dl, 150(%eax)
	movl	-12(%ebp), %eax
	movzbl	150(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 150(%eax)
	movl	-12(%ebp), %eax
	movzbl	150(%eax), %edx
	andl	$-33, %edx
	movb	%dl, 150(%eax)
	movl	-12(%ebp), %eax
	movzbl	150(%eax), %edx
	orl	$64, %edx
	movb	%dl, 150(%eax)
	movl	-12(%ebp), %eax
	movzbl	150(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 150(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 151(%eax)
	.loc 3 29 0
	movl	-12(%ebp), %eax
	movw	$-1, 152(%eax)
	movl	-12(%ebp), %eax
	movw	$0, 154(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 156(%eax)
	movl	-12(%ebp), %eax
	movzbl	157(%eax), %edx
	andl	$-16, %edx
	orl	$2, %edx
	movb	%dl, 157(%eax)
	movl	-12(%ebp), %eax
	movzbl	157(%eax), %edx
	orl	$16, %edx
	movb	%dl, 157(%eax)
	movl	-12(%ebp), %eax
	movzbl	157(%eax), %edx
	orl	$96, %edx
	movb	%dl, 157(%eax)
	movl	-12(%ebp), %eax
	movzbl	157(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 157(%eax)
	movl	-12(%ebp), %eax
	movzbl	158(%eax), %edx
	orl	$15, %edx
	movb	%dl, 158(%eax)
	movl	-12(%ebp), %eax
	movzbl	158(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 158(%eax)
	movl	-12(%ebp), %eax
	movzbl	158(%eax), %edx
	andl	$-33, %edx
	movb	%dl, 158(%eax)
	movl	-12(%ebp), %eax
	movzbl	158(%eax), %edx
	orl	$64, %edx
	movb	%dl, 158(%eax)
	movl	-12(%ebp), %eax
	movzbl	158(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 158(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 159(%eax)
	.loc 3 32 0
	movl	-12(%ebp), %eax
	addl	$180, %eax
	movl	%eax, %ebx
	movl	-12(%ebp), %eax
	addl	$180, %eax
	shrl	$16, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	$180, %eax
	shrl	$24, %eax
	movl	%eax, %ecx
	movl	-12(%ebp), %eax
	movw	$0, 136(%eax)
	movl	-12(%ebp), %eax
	movw	%bx, 138(%eax)
	movl	-12(%ebp), %eax
	movb	%dl, 140(%eax)
	movl	-12(%ebp), %eax
	movzbl	141(%eax), %edx
	andl	$-16, %edx
	orl	$2, %edx
	movb	%dl, 141(%eax)
	movl	-12(%ebp), %eax
	movzbl	141(%eax), %edx
	orl	$16, %edx
	movb	%dl, 141(%eax)
	movl	-12(%ebp), %eax
	movzbl	141(%eax), %edx
	andl	$-97, %edx
	movb	%dl, 141(%eax)
	movl	-12(%ebp), %eax
	movzbl	141(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 141(%eax)
	movl	-12(%ebp), %eax
	movzbl	142(%eax), %edx
	andl	$-16, %edx
	movb	%dl, 142(%eax)
	movl	-12(%ebp), %eax
	movzbl	142(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 142(%eax)
	movl	-12(%ebp), %eax
	movzbl	142(%eax), %edx
	andl	$-33, %edx
	movb	%dl, 142(%eax)
	movl	-12(%ebp), %eax
	movzbl	142(%eax), %edx
	orl	$64, %edx
	movb	%dl, 142(%eax)
	movl	-12(%ebp), %eax
	movzbl	142(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 142(%eax)
	movl	-12(%ebp), %eax
	movb	%cl, 143(%eax)
	.loc 3 34 0
	movl	-12(%ebp), %eax
	addl	$112, %eax
	subl	$8, %esp
	pushl	$56
	pushl	%eax
	call	lgdt
.LVL10:
	addl	$16, %esp
	.loc 3 35 0
	subl	$12, %esp
	pushl	$24
	call	loadgs
.LVL11:
	addl	$16, %esp
	.loc 3 38 0
	movl	-12(%ebp), %eax
	movl	%eax, %gs:0
	.loc 3 39 0
	movl	$0, %gs:4
	.loc 3 40 0
	nop
	movl	-4(%ebp), %ebx
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	seginit, .-seginit
	.type	walkpgdir, @function
walkpgdir:
.LFB21:
	.loc 3 47 0
	.cfi_startproc
.LVL12:
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 3 51 0
	movl	12(%ebp), %eax
	shrl	$22, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -16(%ebp)
.LVL13:
	.loc 3 52 0
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
.LVL14:
	andl	$1, %eax
	testl	%eax, %eax
	je	.L11
	.loc 3 53 0
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	pushl	%eax
	call	p2v
.LVL15:
	addl	$4, %esp
	movl	%eax, -12(%ebp)
.LVL16:
	jmp	.L12
.LVL17:
.L11:
	.loc 3 55 0
	cmpl	$0, 16(%ebp)
	je	.L13
	.loc 3 55 0 is_stmt 0 discriminator 1
	call	kalloc
.LVL18:
	movl	%eax, -12(%ebp)
.LVL19:
	cmpl	$0, -12(%ebp)
	jne	.L14
.LVL20:
.L13:
	.loc 3 56 0 is_stmt 1
	movl	$0, %eax
	jmp	.L15
.LVL21:
.L14:
	.loc 3 58 0
	subl	$4, %esp
	pushl	$4096
	pushl	$0
	pushl	-12(%ebp)
	call	memset
.LVL22:
	addl	$16, %esp
	.loc 3 62 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	v2p
.LVL23:
	addl	$16, %esp
	orl	$7, %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%edx, (%eax)
.L12:
	.loc 3 64 0
	movl	12(%ebp), %eax
	shrl	$12, %eax
	andl	$1023, %eax
	leal	0(,%eax,4), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
.LVL24:
.L15:
	.loc 3 65 0
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	walkpgdir, .-walkpgdir
	.section	.rodata
.LC0:
	.string	"remap"
	.text
	.type	mappages, @function
mappages:
.LFB22:
	.loc 3 72 0
	.cfi_startproc
.LVL25:
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 3 76 0
	movl	12(%ebp), %eax
	andl	$-4096, %eax
	movl	%eax, -12(%ebp)
.LVL26:
	.loc 3 77 0
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
.LVL27:
	addl	%edx, %eax
	subl	$1, %eax
	andl	$-4096, %eax
	movl	%eax, -16(%ebp)
.LVL28:
.L22:
	.loc 3 79 0
	subl	$4, %esp
	pushl	$1
	pushl	-12(%ebp)
	pushl	8(%ebp)
	call	walkpgdir
.LVL29:
	addl	$16, %esp
	movl	%eax, -20(%ebp)
.LVL30:
	cmpl	$0, -20(%ebp)
	jne	.L17
	.loc 3 80 0
	movl	$-1, %eax
.LVL31:
	jmp	.L18
.LVL32:
.L17:
	.loc 3 81 0
	movl	-20(%ebp), %eax
.LVL33:
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L19
	.loc 3 82 0
	subl	$12, %esp
	pushl	$.LC0
	call	panic
.LVL34:
.L19:
	.loc 3 83 0
	movl	24(%ebp), %eax
	orl	20(%ebp), %eax
	orl	$1, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, (%eax)
	.loc 3 84 0
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	je	.L24
	.loc 3 86 0
	addl	$4096, -12(%ebp)
	.loc 3 87 0
	addl	$4096, 20(%ebp)
	.loc 3 88 0
	jmp	.L22
.L24:
	.loc 3 85 0
	nop
	.loc 3 89 0
	movl	$0, %eax
.L18:
	.loc 3 90 0
	leave
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	mappages, .-mappages
	.data
	.align 32
	.type	kmap, @object
	.size	kmap, 64
kmap:
	.long	-2147483648
	.long	0
	.long	1048576
	.long	2
	.long	-2146435072
	.long	1048576
	.long	data-2147483648
	.long	0
	.long	data
	.long	data-2147483648
	.long	234881024
	.long	2
	.long	-33554432
	.long	-33554432
	.long	0
	.long	2
	.section	.rodata
.LC1:
	.string	"PHYSTOP too high"
	.text
	.globl	setupkvm
	.type	setupkvm, @function
setupkvm:
.LFB23:
	.loc 3 130 0
	.cfi_startproc
	pushl	%ebp
.LCFI27:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI28:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	.loc 3 134 0
	call	kalloc
.LVL35:
	movl	%eax, -16(%ebp)
.LVL36:
	cmpl	$0, -16(%ebp)
	jne	.L26
	.loc 3 135 0
	movl	$0, %eax
.LVL37:
	jmp	.L27
.LVL38:
.L26:
	.loc 3 136 0
	subl	$4, %esp
	pushl	$4096
	pushl	$0
	pushl	-16(%ebp)
	call	memset
.LVL39:
	addl	$16, %esp
	.loc 3 137 0
	subl	$12, %esp
	pushl	$234881024
	call	p2v
.LVL40:
	addl	$16, %esp
	cmpl	$-33554432, %eax
	jbe	.L28
	.loc 3 138 0
	subl	$12, %esp
	pushl	$.LC1
	call	panic
.LVL41:
.L28:
	.loc 3 139 0
	movl	$kmap, -12(%ebp)
.LVL42:
	jmp	.L29
.L31:
	.loc 3 140 0
	movl	-12(%ebp), %eax
	movl	12(%eax), %ecx
	.loc 3 141 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %edx
	.loc 3 140 0
	movl	-12(%ebp), %eax
	movl	8(%eax), %ebx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	subl	%eax, %ebx
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%ecx
	pushl	%edx
	pushl	%ebx
	pushl	%eax
	pushl	-16(%ebp)
	call	mappages
.LVL43:
	addl	$32, %esp
	testl	%eax, %eax
	jns	.L30
	.loc 3 142 0
	movl	$0, %eax
	jmp	.L27
.L30:
	.loc 3 139 0 discriminator 2
	addl	$16, -12(%ebp)
.L29:
	.loc 3 139 0 is_stmt 0 discriminator 1
	cmpl	$kmap+64, -12(%ebp)
	jb	.L31
	.loc 3 143 0 is_stmt 1
	movl	-16(%ebp), %eax
.LVL44:
.L27:
	.loc 3 144 0
	movl	-4(%ebp), %ebx
	leave
.LCFI29:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
.LVL45:
	ret
	.cfi_endproc
.LFE23:
	.size	setupkvm, .-setupkvm
	.globl	kvmalloc
	.type	kvmalloc, @function
kvmalloc:
.LFB24:
	.loc 3 150 0
	.cfi_startproc
	pushl	%ebp
.LCFI30:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI31:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 3 151 0
	call	setupkvm
.LVL46:
	movl	%eax, kpgdir
	.loc 3 152 0
	call	switchkvm
.LVL47:
	.loc 3 153 0
	nop
	leave
.LCFI32:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	kvmalloc, .-kvmalloc
	.globl	switchkvm
	.type	switchkvm, @function
switchkvm:
.LFB25:
	.loc 3 159 0
	.cfi_startproc
	pushl	%ebp
.LCFI33:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI34:
	.cfi_def_cfa_register 5
	.loc 3 160 0
	movl	kpgdir, %eax
	pushl	%eax
	call	v2p
.LVL48:
	addl	$4, %esp
	pushl	%eax
	call	lcr3
.LVL49:
	addl	$4, %esp
	.loc 3 161 0
	nop
	leave
.LCFI35:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	switchkvm, .-switchkvm
	.section	.rodata
.LC2:
	.string	"switchuvm: no pgdir"
	.text
	.globl	switchuvm
	.type	switchuvm, @function
switchuvm:
.LFB26:
	.loc 3 166 0
	.cfi_startproc
.LVL50:
	pushl	%ebp
.LCFI36:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI37:
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 3 167 0
	call	pushcli
.LVL51:
	.loc 3 168 0
	movl	%gs:0, %eax
	movl	%gs:0, %edx
	addl	$8, %edx
	movl	%edx, %esi
	movl	%gs:0, %edx
	addl	$8, %edx
	shrl	$16, %edx
	movl	%edx, %ebx
	movl	%gs:0, %edx
	addl	$8, %edx
	shrl	$24, %edx
	movl	%edx, %ecx
	movw	$103, 160(%eax)
	movw	%si, 162(%eax)
	movb	%bl, 164(%eax)
	movzbl	165(%eax), %edx
	andl	$-16, %edx
	orl	$9, %edx
	movb	%dl, 165(%eax)
	movzbl	165(%eax), %edx
	orl	$16, %edx
	movb	%dl, 165(%eax)
	movzbl	165(%eax), %edx
	andl	$-97, %edx
	movb	%dl, 165(%eax)
	movzbl	165(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 165(%eax)
	movzbl	166(%eax), %edx
	andl	$-16, %edx
	movb	%dl, 166(%eax)
	movzbl	166(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 166(%eax)
	movzbl	166(%eax), %edx
	andl	$-33, %edx
	movb	%dl, 166(%eax)
	movzbl	166(%eax), %edx
	orl	$64, %edx
	movb	%dl, 166(%eax)
	movzbl	166(%eax), %edx
	andl	$127, %edx
	movb	%dl, 166(%eax)
	movb	%cl, 167(%eax)
	.loc 3 169 0
	movl	%gs:0, %eax
	movzbl	165(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 165(%eax)
	.loc 3 170 0
	movl	%gs:0, %eax
	movw	$16, 16(%eax)
	.loc 3 171 0
	movl	%gs:0, %eax
	movl	%gs:4, %edx
	movl	8(%edx), %edx
	addl	$4096, %edx
	movl	%edx, 12(%eax)
	.loc 3 172 0
	subl	$12, %esp
	pushl	$48
	call	ltr
.LVL52:
	addl	$16, %esp
	.loc 3 173 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L35
	.loc 3 174 0
	subl	$12, %esp
	pushl	$.LC2
	call	panic
.LVL53:
.L35:
	.loc 3 175 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	v2p
.LVL54:
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	lcr3
.LVL55:
	addl	$16, %esp
	.loc 3 176 0
	call	popcli
.LVL56:
	.loc 3 177 0
	nop
	leal	-8(%ebp), %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
.LCFI38:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	switchuvm, .-switchuvm
	.section	.rodata
.LC3:
	.string	"inituvm: more than a page"
	.text
	.globl	inituvm
	.type	inituvm, @function
inituvm:
.LFB27:
	.loc 3 183 0
	.cfi_startproc
.LVL57:
	pushl	%ebp
.LCFI39:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI40:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 3 186 0
	cmpl	$4095, 16(%ebp)
	jbe	.L37
	.loc 3 187 0
	subl	$12, %esp
	pushl	$.LC3
	call	panic
.LVL58:
.L37:
	.loc 3 188 0
	call	kalloc
.LVL59:
	movl	%eax, -12(%ebp)
.LVL60:
	.loc 3 189 0
	subl	$4, %esp
	pushl	$4096
	pushl	$0
	pushl	-12(%ebp)
	call	memset
.LVL61:
	addl	$16, %esp
	.loc 3 190 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	v2p
.LVL62:
	addl	$16, %esp
	subl	$12, %esp
	pushl	$6
	pushl	%eax
	pushl	$4096
	pushl	$0
	pushl	8(%ebp)
	call	mappages
.LVL63:
	addl	$32, %esp
	.loc 3 191 0
	subl	$4, %esp
	pushl	16(%ebp)
	pushl	12(%ebp)
	pushl	-12(%ebp)
	call	memmove
.LVL64:
	addl	$16, %esp
	.loc 3 192 0
	nop
	leave
.LCFI41:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE27:
	.size	inituvm, .-inituvm
	.section	.rodata
	.align 4
.LC4:
	.string	"loaduvm: addr must be page aligned"
.LC5:
	.string	"loaduvm: address should exist"
	.text
	.globl	loaduvm
	.type	loaduvm, @function
loaduvm:
.LFB28:
	.loc 3 198 0
	.cfi_startproc
.LVL65:
	pushl	%ebp
.LCFI42:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI43:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	.loc 3 202 0
	movl	12(%ebp), %eax
	andl	$4095, %eax
	testl	%eax, %eax
	je	.L39
	.loc 3 203 0
	subl	$12, %esp
	pushl	$.LC4
	call	panic
.LVL66:
.L39:
	.loc 3 204 0
	movl	$0, -12(%ebp)
.LVL67:
	jmp	.L40
.LVL68:
.L46:
	.loc 3 205 0
	movl	12(%ebp), %edx
	movl	-12(%ebp), %eax
.LVL69:
	addl	%edx, %eax
	subl	$4, %esp
	pushl	$0
	pushl	%eax
	pushl	8(%ebp)
	call	walkpgdir
.LVL70:
	addl	$16, %esp
	movl	%eax, -20(%ebp)
.LVL71:
	cmpl	$0, -20(%ebp)
	jne	.L41
	.loc 3 206 0
	subl	$12, %esp
	pushl	$.LC5
	call	panic
.LVL72:
.L41:
	.loc 3 207 0
	movl	-20(%ebp), %eax
.LVL73:
	movl	(%eax), %eax
	andl	$-4096, %eax
	movl	%eax, -24(%ebp)
.LVL74:
	.loc 3 208 0
	movl	24(%ebp), %eax
.LVL75:
	subl	-12(%ebp), %eax
	cmpl	$4095, %eax
	ja	.L42
	.loc 3 209 0
	movl	24(%ebp), %eax
	subl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
.LVL76:
	jmp	.L43
.LVL77:
.L42:
	.loc 3 211 0
	movl	$4096, -16(%ebp)
.LVL78:
.L43:
	.loc 3 212 0
	movl	20(%ebp), %edx
	movl	-12(%ebp), %eax
	leal	(%edx,%eax), %ebx
	subl	$12, %esp
	pushl	-24(%ebp)
	call	p2v
.LVL79:
	addl	$16, %esp
	pushl	-16(%ebp)
	pushl	%ebx
	pushl	%eax
	pushl	16(%ebp)
	call	readi
.LVL80:
	addl	$16, %esp
	cmpl	-16(%ebp), %eax
	je	.L44
	.loc 3 213 0
	movl	$-1, %eax
	jmp	.L45
.L44:
	.loc 3 204 0 discriminator 2
	addl	$4096, -12(%ebp)
.LVL81:
.L40:
	.loc 3 204 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	24(%ebp), %eax
	jb	.L46
	.loc 3 215 0 is_stmt 1
	movl	$0, %eax
.L45:
	.loc 3 216 0
	movl	-4(%ebp), %ebx
	leave
.LCFI44:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE28:
	.size	loaduvm, .-loaduvm
	.section	.rodata
.LC6:
	.string	"allocuvm out of memory\n"
	.text
	.globl	allocuvm
	.type	allocuvm, @function
allocuvm:
.LFB29:
	.loc 3 222 0
	.cfi_startproc
.LVL82:
	pushl	%ebp
.LCFI45:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI46:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 3 226 0
	movl	16(%ebp), %eax
	testl	%eax, %eax
	jns	.L48
	.loc 3 227 0
	movl	$0, %eax
	jmp	.L49
.L48:
	.loc 3 228 0
	movl	16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jnb	.L50
	.loc 3 229 0
	movl	12(%ebp), %eax
	jmp	.L49
.L50:
	.loc 3 231 0
	movl	12(%ebp), %eax
	addl	$4095, %eax
	andl	$-4096, %eax
	movl	%eax, -12(%ebp)
.LVL83:
	.loc 3 232 0
	jmp	.L51
.L53:
	.loc 3 233 0
	call	kalloc
.LVL84:
	movl	%eax, -16(%ebp)
.LVL85:
	.loc 3 234 0
	cmpl	$0, -16(%ebp)
	jne	.L52
	.loc 3 235 0
	subl	$12, %esp
	pushl	$.LC6
	call	cprintf
.LVL86:
	addl	$16, %esp
	.loc 3 236 0
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	deallocuvm
.LVL87:
	addl	$16, %esp
	.loc 3 237 0
	movl	$0, %eax
	jmp	.L49
.LVL88:
.L52:
	.loc 3 239 0
	subl	$4, %esp
	pushl	$4096
	pushl	$0
	pushl	-16(%ebp)
	call	memset
.LVL89:
	addl	$16, %esp
	.loc 3 240 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	v2p
.LVL90:
	addl	$16, %esp
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	subl	$12, %esp
	pushl	$6
	pushl	%edx
	pushl	$4096
	pushl	%eax
	pushl	8(%ebp)
	call	mappages
.LVL91:
	addl	$32, %esp
	.loc 3 232 0
	addl	$4096, -12(%ebp)
.LVL92:
.L51:
	.loc 3 232 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jb	.L53
	.loc 3 242 0 is_stmt 1
	movl	16(%ebp), %eax
.LVL93:
.L49:
	.loc 3 243 0
	leave
.LCFI47:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE29:
	.size	allocuvm, .-allocuvm
	.section	.rodata
.LC7:
	.string	"kfree"
	.text
	.globl	deallocuvm
	.type	deallocuvm, @function
deallocuvm:
.LFB30:
	.loc 3 251 0
	.cfi_startproc
.LVL94:
	pushl	%ebp
.LCFI48:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI49:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 3 255 0
	movl	16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	.L55
	.loc 3 256 0
	movl	12(%ebp), %eax
	jmp	.L56
.L55:
	.loc 3 258 0
	movl	16(%ebp), %eax
	addl	$4095, %eax
	andl	$-4096, %eax
	movl	%eax, -12(%ebp)
.LVL95:
	.loc 3 259 0
	jmp	.L57
.L61:
	.loc 3 260 0
	movl	-12(%ebp), %eax
.LVL96:
	subl	$4, %esp
	pushl	$0
	pushl	%eax
	pushl	8(%ebp)
	call	walkpgdir
.LVL97:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL98:
	.loc 3 261 0
	cmpl	$0, -16(%ebp)
	jne	.L58
	.loc 3 262 0
	addl	$4190208, -12(%ebp)
	jmp	.L59
.L58:
	.loc 3 263 0
	movl	-16(%ebp), %eax
.LVL99:
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L59
.LBB2:
	.loc 3 264 0
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	movl	%eax, -20(%ebp)
.LVL100:
	.loc 3 265 0
	cmpl	$0, -20(%ebp)
	jne	.L60
	.loc 3 266 0
	subl	$12, %esp
	pushl	$.LC7
	call	panic
.LVL101:
.L60:
	.loc 3 267 0
	subl	$12, %esp
	pushl	-20(%ebp)
	call	p2v
.LVL102:
	addl	$16, %esp
	movl	%eax, -24(%ebp)
.LVL103:
	.loc 3 268 0
	subl	$12, %esp
	pushl	-24(%ebp)
	call	kfree
.LVL104:
	addl	$16, %esp
	.loc 3 269 0
	movl	-16(%ebp), %eax
	movl	$0, (%eax)
.LVL105:
.L59:
.LBE2:
	.loc 3 259 0
	addl	$4096, -12(%ebp)
.LVL106:
.L57:
	.loc 3 259 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	.L61
	.loc 3 272 0 is_stmt 1
	movl	16(%ebp), %eax
.LVL107:
.L56:
	.loc 3 273 0
	leave
.LCFI50:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE30:
	.size	deallocuvm, .-deallocuvm
	.section	.rodata
.LC8:
	.string	"freevm: no pgdir"
	.text
	.globl	freevm
	.type	freevm, @function
freevm:
.LFB31:
	.loc 3 279 0
	.cfi_startproc
.LVL108:
	pushl	%ebp
.LCFI51:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI52:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 3 282 0
	cmpl	$0, 8(%ebp)
	jne	.L63
	.loc 3 283 0
	subl	$12, %esp
	pushl	$.LC8
	call	panic
.LVL109:
.L63:
	.loc 3 284 0
	subl	$4, %esp
	pushl	$0
	pushl	$-2147483648
	pushl	8(%ebp)
	call	deallocuvm
.LVL110:
	addl	$16, %esp
	.loc 3 285 0
	movl	$0, -12(%ebp)
.LVL111:
	jmp	.L64
.L66:
	.loc 3 286 0
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L65
.LBB3:
	.loc 3 287 0
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	subl	$12, %esp
	pushl	%eax
	call	p2v
.LVL112:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL113:
	.loc 3 288 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	kfree
.LVL114:
	addl	$16, %esp
.LVL115:
.L65:
.LBE3:
	.loc 3 285 0 discriminator 2
	addl	$1, -12(%ebp)
.L64:
	.loc 3 285 0 is_stmt 0 discriminator 1
	cmpl	$1023, -12(%ebp)
	jbe	.L66
	.loc 3 291 0 is_stmt 1
	subl	$12, %esp
	pushl	8(%ebp)
	call	kfree
.LVL116:
	addl	$16, %esp
	.loc 3 292 0
	nop
	leave
.LCFI53:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE31:
	.size	freevm, .-freevm
	.section	.rodata
.LC9:
	.string	"clearpteu"
	.text
	.globl	clearpteu
	.type	clearpteu, @function
clearpteu:
.LFB32:
	.loc 3 298 0
	.cfi_startproc
.LVL117:
	pushl	%ebp
.LCFI54:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI55:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 3 301 0
	subl	$4, %esp
	pushl	$0
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	walkpgdir
.LVL118:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL119:
	.loc 3 302 0
	cmpl	$0, -12(%ebp)
	jne	.L68
	.loc 3 303 0
	subl	$12, %esp
	pushl	$.LC9
	call	panic
.LVL120:
.L68:
	.loc 3 304 0
	movl	-12(%ebp), %eax
.LVL121:
	movl	(%eax), %eax
	andl	$-5, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 3 305 0
	nop
	leave
.LCFI56:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE32:
	.size	clearpteu, .-clearpteu
	.section	.rodata
.LC10:
	.string	"copyuvm: pte should exist"
.LC11:
	.string	"copyuvm: page not present"
	.text
	.globl	copyuvm
	.type	copyuvm, @function
copyuvm:
.LFB33:
	.loc 3 311 0
	.cfi_startproc
.LVL122:
	pushl	%ebp
.LCFI57:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI58:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 3 317 0
	call	setupkvm
.LVL123:
	movl	%eax, -16(%ebp)
.LVL124:
	cmpl	$0, -16(%ebp)
	jne	.L70
	.loc 3 318 0
	movl	$0, %eax
.LVL125:
	jmp	.L71
.LVL126:
.L70:
	.loc 3 319 0
	movl	$0, -12(%ebp)
.LVL127:
	jmp	.L72
.LVL128:
.L78:
	.loc 3 320 0
	movl	-12(%ebp), %eax
.LVL129:
	subl	$4, %esp
	pushl	$0
	pushl	%eax
	pushl	8(%ebp)
	call	walkpgdir
.LVL130:
	addl	$16, %esp
	movl	%eax, -20(%ebp)
.LVL131:
	cmpl	$0, -20(%ebp)
	jne	.L73
	.loc 3 321 0
	subl	$12, %esp
	pushl	$.LC10
	call	panic
.LVL132:
.L73:
	.loc 3 322 0
	movl	-20(%ebp), %eax
.LVL133:
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L74
	.loc 3 323 0
	subl	$12, %esp
	pushl	$.LC11
	call	panic
.LVL134:
.L74:
	.loc 3 324 0
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	movl	%eax, -24(%ebp)
.LVL135:
	.loc 3 325 0
	movl	-20(%ebp), %eax
.LVL136:
	movl	(%eax), %eax
	andl	$4095, %eax
	movl	%eax, -28(%ebp)
.LVL137:
	.loc 3 326 0
	call	kalloc
.LVL138:
	movl	%eax, -32(%ebp)
.LVL139:
	cmpl	$0, -32(%ebp)
	je	.L79
	.loc 3 328 0
	subl	$12, %esp
	pushl	-24(%ebp)
	call	p2v
.LVL140:
	addl	$16, %esp
	subl	$4, %esp
	pushl	$4096
	pushl	%eax
	pushl	-32(%ebp)
	call	memmove
.LVL141:
	addl	$16, %esp
	.loc 3 329 0
	movl	-28(%ebp), %ebx
	subl	$12, %esp
	pushl	-32(%ebp)
	call	v2p
.LVL142:
	addl	$16, %esp
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	subl	$12, %esp
	pushl	%ebx
	pushl	%edx
	pushl	$4096
	pushl	%eax
	pushl	-16(%ebp)
	call	mappages
.LVL143:
	addl	$32, %esp
	testl	%eax, %eax
	js	.L80
	.loc 3 319 0 discriminator 2
	addl	$4096, -12(%ebp)
.LVL144:
.L72:
	.loc 3 319 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	.L78
	.loc 3 332 0 is_stmt 1
	movl	-16(%ebp), %eax
	jmp	.L71
.LVL145:
.L79:
	.loc 3 327 0
	nop
	jmp	.L76
.LVL146:
.L80:
	.loc 3 330 0
	nop
.L76:
	.loc 3 335 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	freevm
.LVL147:
	addl	$16, %esp
	.loc 3 336 0
	movl	$0, %eax
.LVL148:
.L71:
	.loc 3 337 0
	movl	-4(%ebp), %ebx
	leave
.LCFI59:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE33:
	.size	copyuvm, .-copyuvm
	.globl	uva2ka
	.type	uva2ka, @function
uva2ka:
.LFB34:
	.loc 3 343 0
	.cfi_startproc
.LVL149:
	pushl	%ebp
.LCFI60:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI61:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 3 346 0
	subl	$4, %esp
	pushl	$0
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	walkpgdir
.LVL150:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL151:
	.loc 3 347 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
.LVL152:
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L82
	.loc 3 348 0
	movl	$0, %eax
	jmp	.L83
.L82:
	.loc 3 349 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	andl	$4, %eax
	testl	%eax, %eax
	jne	.L84
	.loc 3 350 0
	movl	$0, %eax
	jmp	.L83
.L84:
	.loc 3 351 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	subl	$12, %esp
	pushl	%eax
	call	p2v
.LVL153:
	addl	$16, %esp
.L83:
	.loc 3 352 0
	leave
.LCFI62:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE34:
	.size	uva2ka, .-uva2ka
	.globl	copyout
	.type	copyout, @function
copyout:
.LFB35:
	.loc 3 359 0
	.cfi_startproc
.LVL154:
	pushl	%ebp
.LCFI63:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI64:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 3 363 0
	movl	16(%ebp), %eax
	movl	%eax, -12(%ebp)
.LVL155:
	.loc 3 364 0
	jmp	.L86
.LVL156:
.L90:
	.loc 3 365 0
	movl	12(%ebp), %eax
	andl	$-4096, %eax
	movl	%eax, -20(%ebp)
.LVL157:
	.loc 3 366 0
	movl	-20(%ebp), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	uva2ka
.LVL158:
	addl	$16, %esp
	movl	%eax, -24(%ebp)
.LVL159:
	.loc 3 367 0
	cmpl	$0, -24(%ebp)
	jne	.L87
	.loc 3 368 0
	movl	$-1, %eax
.LVL160:
	jmp	.L88
.LVL161:
.L87:
	.loc 3 369 0
	movl	-20(%ebp), %eax
.LVL162:
	subl	12(%ebp), %eax
	addl	$4096, %eax
	movl	%eax, -16(%ebp)
.LVL163:
	.loc 3 370 0
	movl	-16(%ebp), %eax
	cmpl	20(%ebp), %eax
	jbe	.L89
	.loc 3 371 0
	movl	20(%ebp), %eax
.LVL164:
	movl	%eax, -16(%ebp)
.LVL165:
.L89:
	.loc 3 372 0
	movl	12(%ebp), %eax
	subl	-20(%ebp), %eax
	movl	%eax, %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	subl	$4, %esp
	pushl	-16(%ebp)
	pushl	-12(%ebp)
	pushl	%eax
	call	memmove
.LVL166:
	addl	$16, %esp
	.loc 3 373 0
	movl	-16(%ebp), %eax
	subl	%eax, 20(%ebp)
	.loc 3 374 0
	movl	-16(%ebp), %eax
	addl	%eax, -12(%ebp)
	.loc 3 375 0
	movl	-20(%ebp), %eax
	addl	$4096, %eax
	movl	%eax, 12(%ebp)
.LVL167:
.L86:
	.loc 3 364 0
	cmpl	$0, 20(%ebp)
	jne	.L90
	.loc 3 377 0
	movl	$0, %eax
.L88:
	.loc 3 378 0
	leave
.LCFI65:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE35:
	.size	copyout, .-copyout
.Letext0:
	.file 4 "types.h"
	.file 5 "mmu.h"
	.file 6 "proc.h"
	.file 7 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x11d3
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF107
	.byte	0xc
	.long	.LASF108
	.long	.LASF109
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
	.long	.LASF16
	.byte	0x4c
	.byte	0x1
	.byte	0x9c
	.long	0x1cb
	.uleb128 0x5
	.string	"edi"
	.byte	0x1
	.byte	0x9e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.string	"esi"
	.byte	0x1
	.byte	0x9f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ebp"
	.byte	0x1
	.byte	0xa0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF7
	.byte	0x1
	.byte	0xa1
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"ebx"
	.byte	0x1
	.byte	0xa2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.string	"edx"
	.byte	0x1
	.byte	0xa3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.string	"ecx"
	.byte	0x1
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.string	"eax"
	.byte	0x1
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.string	"gs"
	.byte	0x1
	.byte	0xa8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF8
	.byte	0x1
	.byte	0xa9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x5
	.string	"fs"
	.byte	0x1
	.byte	0xaa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.long	.LASF9
	.byte	0x1
	.byte	0xab
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x5
	.string	"es"
	.byte	0x1
	.byte	0xac
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.long	.LASF10
	.byte	0x1
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x5
	.string	"ds"
	.byte	0x1
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x6
	.long	.LASF11
	.byte	0x1
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x6
	.long	.LASF12
	.byte	0x1
	.byte	0xb0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x5
	.string	"err"
	.byte	0x1
	.byte	0xb3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x5
	.string	"eip"
	.byte	0x1
	.byte	0xb4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x5
	.string	"cs"
	.byte	0x1
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x6
	.long	.LASF13
	.byte	0x1
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x6
	.long	.LASF14
	.byte	0x1
	.byte	0xb7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x5
	.string	"esp"
	.byte	0x1
	.byte	0xba
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x5
	.string	"ss"
	.byte	0x1
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.long	.LASF15
	.byte	0x1
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x4
	.long	.LASF17
	.byte	0x8
	.byte	0x5
	.byte	0x34
	.long	0x2ae
	.uleb128 0x7
	.long	.LASF18
	.byte	0x5
	.byte	0x35
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF19
	.byte	0x5
	.byte	0x36
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF20
	.byte	0x5
	.byte	0x37
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF21
	.byte	0x5
	.byte	0x38
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
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
	.uleb128 0x8
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
	.uleb128 0x8
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
	.uleb128 0x7
	.long	.LASF22
	.byte	0x5
	.byte	0x3c
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
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
	.uleb128 0x7
	.long	.LASF23
	.byte	0x5
	.byte	0x3e
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
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
	.uleb128 0x8
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
	.uleb128 0x7
	.long	.LASF24
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
	.uleb128 0x2
	.long	.LASF25
	.byte	0x5
	.byte	0x94
	.long	0x25
	.uleb128 0x4
	.long	.LASF26
	.byte	0x68
	.byte	0x5
	.byte	0x97
	.long	0x4c4
	.uleb128 0x6
	.long	.LASF27
	.byte	0x5
	.byte	0x98
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF28
	.byte	0x5
	.byte	0x99
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ss0"
	.byte	0x5
	.byte	0x9a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF8
	.byte	0x5
	.byte	0x9b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x6
	.long	.LASF29
	.byte	0x5
	.byte	0x9c
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"ss1"
	.byte	0x5
	.byte	0x9d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF9
	.byte	0x5
	.byte	0x9e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x6
	.long	.LASF30
	.byte	0x5
	.byte	0x9f
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.string	"ss2"
	.byte	0x5
	.byte	0xa0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.long	.LASF10
	.byte	0x5
	.byte	0xa1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x5
	.string	"cr3"
	.byte	0x5
	.byte	0xa2
	.long	0x4ca
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.string	"eip"
	.byte	0x5
	.byte	0xa3
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF14
	.byte	0x5
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.string	"eax"
	.byte	0x5
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.string	"ecx"
	.byte	0x5
	.byte	0xa6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x5
	.string	"edx"
	.byte	0x5
	.byte	0xa7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x5
	.string	"ebx"
	.byte	0x5
	.byte	0xa8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x5
	.string	"esp"
	.byte	0x5
	.byte	0xa9
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x5
	.string	"ebp"
	.byte	0x5
	.byte	0xaa
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x5
	.string	"esi"
	.byte	0x5
	.byte	0xab
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x5
	.string	"edi"
	.byte	0x5
	.byte	0xac
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x5
	.string	"es"
	.byte	0x5
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.long	.LASF11
	.byte	0x5
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x5
	.string	"cs"
	.byte	0x5
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x6
	.long	.LASF13
	.byte	0x5
	.byte	0xb0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x5
	.string	"ss"
	.byte	0x5
	.byte	0xb1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x6
	.long	.LASF15
	.byte	0x5
	.byte	0xb2
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x5
	.string	"ds"
	.byte	0x5
	.byte	0xb3
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x6
	.long	.LASF31
	.byte	0x5
	.byte	0xb4
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x5
	.string	"fs"
	.byte	0x5
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x6
	.long	.LASF32
	.byte	0x5
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x5
	.string	"gs"
	.byte	0x5
	.byte	0xb7
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x6
	.long	.LASF33
	.byte	0x5
	.byte	0xb8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x5
	.string	"ldt"
	.byte	0x5
	.byte	0xb9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x6
	.long	.LASF34
	.byte	0x5
	.byte	0xba
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x5
	.string	"t"
	.byte	0x5
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x6
	.long	.LASF35
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
	.long	0x55a
	.uleb128 0x5
	.string	"id"
	.byte	0x6
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF36
	.byte	0x6
	.byte	0x7
	.long	0x5ad
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ts"
	.byte	0x6
	.byte	0x8
	.long	0x2b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.string	"gdt"
	.byte	0x6
	.byte	0x9
	.long	0x5b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x6
	.long	.LASF37
	.byte	0x6
	.byte	0xa
	.long	0x5ca
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x6
	.long	.LASF38
	.byte	0x6
	.byte	0xb
	.long	0x5cf
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x6
	.long	.LASF39
	.byte	0x6
	.byte	0xc
	.long	0x5cf
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x5
	.string	"cpu"
	.byte	0x6
	.byte	0xf
	.long	0x5d6
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x6
	.long	.LASF40
	.byte	0x6
	.byte	0x10
	.long	0x69d
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x4
	.long	.LASF41
	.byte	0x14
	.byte	0x6
	.byte	0x2c
	.long	0x5ad
	.uleb128 0x5
	.string	"edi"
	.byte	0x6
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.string	"esi"
	.byte	0x6
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ebx"
	.byte	0x6
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.string	"ebp"
	.byte	0x6
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
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
	.long	0x55a
	.uleb128 0xc
	.long	0x1cb
	.long	0x5c3
	.uleb128 0xd
	.long	0x5c3
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
	.long	0x4cc
	.uleb128 0x4
	.long	.LASF40
	.byte	0x7c
	.byte	0x6
	.byte	0x37
	.long	0x69d
	.uleb128 0x5
	.string	"sz"
	.byte	0x6
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF43
	.byte	0x6
	.byte	0x39
	.long	0x6d8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF44
	.byte	0x6
	.byte	0x3a
	.long	0x6de
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF45
	.byte	0x6
	.byte	0x3b
	.long	0x6a3
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"pid"
	.byte	0x6
	.byte	0x3c
	.long	0x5cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF46
	.byte	0x6
	.byte	0x3d
	.long	0x69d
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.string	"tf"
	.byte	0x6
	.byte	0x3e
	.long	0x6eb
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.long	.LASF41
	.byte	0x6
	.byte	0x3f
	.long	0x5ad
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.long	.LASF47
	.byte	0x6
	.byte	0x40
	.long	0x4ca
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF48
	.byte	0x6
	.byte	0x41
	.long	0x5cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.long	.LASF49
	.byte	0x6
	.byte	0x42
	.long	0x6f1
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.string	"cwd"
	.byte	0x6
	.byte	0x43
	.long	0x713
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x6
	.long	.LASF50
	.byte	0x6
	.byte	0x44
	.long	0x719
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x5dc
	.uleb128 0x10
	.long	.LASF110
	.byte	0x4
	.long	0x30
	.byte	0x6
	.byte	0x34
	.long	0x6d8
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
	.long	0x6e4
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF57
	.uleb128 0x9
	.byte	0x4
	.long	0x66
	.uleb128 0xc
	.long	0x701
	.long	0x701
	.uleb128 0xd
	.long	0x5c3
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x707
	.uleb128 0x12
	.long	.LASF58
	.byte	0x1
	.uleb128 0x12
	.long	.LASF59
	.byte	0x1
	.uleb128 0x9
	.byte	0x4
	.long	0x70d
	.uleb128 0xc
	.long	0x6e4
	.long	0x729
	.uleb128 0xd
	.long	0x5c3
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF60
	.byte	0x10
	.byte	0x3
	.byte	0x73
	.long	0x76e
	.uleb128 0x6
	.long	.LASF61
	.byte	0x3
	.byte	0x74
	.long	0x4ca
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF62
	.byte	0x3
	.byte	0x75
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF63
	.byte	0x3
	.byte	0x76
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF64
	.byte	0x3
	.byte	0x77
	.long	0x5cf
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x13
	.long	.LASF66
	.byte	0x1
	.byte	0x3f
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.long	.LLST0
	.byte	0x1
	.long	0x7af
	.uleb128 0x14
	.string	"p"
	.byte	0x1
	.byte	0x3f
	.long	0x7af
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF65
	.byte	0x1
	.byte	0x3f
	.long	0x5cf
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.string	"pd"
	.byte	0x1
	.byte	0x41
	.long	0x7ca
	.byte	0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x1cb
	.uleb128 0xc
	.long	0x7c5
	.long	0x7c5
	.uleb128 0xd
	.long	0x5c3
	.byte	0x2
	.byte	0
	.uleb128 0xe
	.long	0x37
	.uleb128 0xe
	.long	0x7b5
	.uleb128 0x17
	.string	"ltr"
	.byte	0x1
	.byte	0x59
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST1
	.byte	0x1
	.long	0x7f7
	.uleb128 0x14
	.string	"sel"
	.byte	0x1
	.byte	0x59
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.long	.LASF67
	.byte	0x1
	.byte	0x67
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.long	.LLST2
	.byte	0x1
	.long	0x81d
	.uleb128 0x14
	.string	"v"
	.byte	0x1
	.byte	0x67
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.long	.LASF68
	.byte	0x1
	.byte	0x8e
	.byte	0x1
	.long	.LFB16
	.long	.LFE16
	.long	.LLST3
	.byte	0x1
	.long	0x845
	.uleb128 0x14
	.string	"val"
	.byte	0x1
	.byte	0x8e
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x18
	.string	"v2p"
	.byte	0x2
	.byte	0xd
	.byte	0x1
	.long	0x25
	.long	.LFB18
	.long	.LFE18
	.long	.LLST4
	.byte	0x1
	.long	0x86f
	.uleb128 0x14
	.string	"a"
	.byte	0x2
	.byte	0xd
	.long	0x4ca
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x18
	.string	"p2v"
	.byte	0x2
	.byte	0xe
	.byte	0x1
	.long	0x4ca
	.long	.LFB19
	.long	.LFE19
	.long	.LLST5
	.byte	0x1
	.long	0x899
	.uleb128 0x14
	.string	"a"
	.byte	0x2
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF74
	.byte	0x3
	.byte	0x11
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST6
	.byte	0x1
	.long	0x8dc
	.uleb128 0x1a
	.string	"c"
	.byte	0x3
	.byte	0x13
	.long	0x5d6
	.long	.LLST7
	.uleb128 0x1b
	.long	.LVL6
	.long	0x1154
	.uleb128 0x1b
	.long	.LVL10
	.long	0x76e
	.uleb128 0x1b
	.long	.LVL11
	.long	0x7f7
	.byte	0
	.uleb128 0x1c
	.long	.LASF69
	.byte	0x3
	.byte	0x2e
	.byte	0x1
	.long	0x965
	.long	.LFB21
	.long	.LFE21
	.long	.LLST8
	.byte	0x1
	.long	0x965
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0x2e
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"va"
	.byte	0x3
	.byte	0x2e
	.long	0x96b
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.long	.LASF70
	.byte	0x3
	.byte	0x2e
	.long	0x5cf
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.string	"pde"
	.byte	0x3
	.byte	0x30
	.long	0x6d8
	.long	.LLST9
	.uleb128 0x1d
	.long	.LASF71
	.byte	0x3
	.byte	0x31
	.long	0x965
	.long	.LLST10
	.uleb128 0x1b
	.long	.LVL15
	.long	0x86f
	.uleb128 0x1b
	.long	.LVL18
	.long	0x1161
	.uleb128 0x1b
	.long	.LVL22
	.long	0x116e
	.uleb128 0x1b
	.long	.LVL23
	.long	0x845
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x2ae
	.uleb128 0x9
	.byte	0x4
	.long	0x971
	.uleb128 0x1e
	.uleb128 0x1c
	.long	.LASF72
	.byte	0x3
	.byte	0x47
	.byte	0x1
	.long	0x5cf
	.long	.LFB22
	.long	.LFE22
	.long	.LLST11
	.byte	0x1
	.long	0xa10
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0x47
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"va"
	.byte	0x3
	.byte	0x47
	.long	0x4ca
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.long	.LASF65
	.byte	0x3
	.byte	0x47
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.string	"pa"
	.byte	0x3
	.byte	0x47
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x15
	.long	.LASF64
	.byte	0x3
	.byte	0x47
	.long	0x5cf
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.string	"a"
	.byte	0x3
	.byte	0x49
	.long	0x6de
	.long	.LLST12
	.uleb128 0x1f
	.long	.LASF73
	.byte	0x3
	.byte	0x49
	.long	0x6de
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.string	"pte"
	.byte	0x3
	.byte	0x4a
	.long	0x965
	.long	.LLST13
	.uleb128 0x1b
	.long	.LVL29
	.long	0x8dc
	.uleb128 0x1b
	.long	.LVL34
	.long	0x117b
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF80
	.byte	0x3
	.byte	0x81
	.byte	0x1
	.long	0x6d8
	.long	.LFB23
	.long	.LFE23
	.long	.LLST14
	.byte	0x1
	.long	0xa78
	.uleb128 0x1d
	.long	.LASF43
	.byte	0x3
	.byte	0x83
	.long	0x6d8
	.long	.LLST15
	.uleb128 0x1a
	.string	"k"
	.byte	0x3
	.byte	0x84
	.long	0xa78
	.long	.LLST16
	.uleb128 0x1b
	.long	.LVL35
	.long	0x1161
	.uleb128 0x1b
	.long	.LVL39
	.long	0x116e
	.uleb128 0x1b
	.long	.LVL40
	.long	0x86f
	.uleb128 0x1b
	.long	.LVL41
	.long	0x117b
	.uleb128 0x1b
	.long	.LVL43
	.long	0x972
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x729
	.uleb128 0x19
	.byte	0x1
	.long	.LASF75
	.byte	0x3
	.byte	0x95
	.byte	0x1
	.long	.LFB24
	.long	.LFE24
	.long	.LLST17
	.byte	0x1
	.long	0xaab
	.uleb128 0x1b
	.long	.LVL46
	.long	0xa10
	.uleb128 0x1b
	.long	.LVL47
	.long	0xaab
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF76
	.byte	0x3
	.byte	0x9e
	.byte	0x1
	.long	.LFB25
	.long	.LFE25
	.long	.LLST18
	.byte	0x1
	.long	0xad8
	.uleb128 0x1b
	.long	.LVL48
	.long	0x845
	.uleb128 0x1b
	.long	.LVL49
	.long	0x81d
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF77
	.byte	0x3
	.byte	0xa5
	.byte	0x1
	.long	.LFB26
	.long	.LFE26
	.long	.LLST19
	.byte	0x1
	.long	0xb35
	.uleb128 0x14
	.string	"p"
	.byte	0x3
	.byte	0xa5
	.long	0x69d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.long	.LVL51
	.long	0x1188
	.uleb128 0x1b
	.long	.LVL52
	.long	0x7cf
	.uleb128 0x1b
	.long	.LVL53
	.long	0x117b
	.uleb128 0x1b
	.long	.LVL54
	.long	0x845
	.uleb128 0x1b
	.long	.LVL55
	.long	0x81d
	.uleb128 0x1b
	.long	.LVL56
	.long	0x1195
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF78
	.byte	0x3
	.byte	0xb6
	.byte	0x1
	.long	.LFB27
	.long	.LFE27
	.long	.LLST20
	.byte	0x1
	.long	0xbbe
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0xb6
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF79
	.byte	0x3
	.byte	0xb6
	.long	0x6de
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.string	"sz"
	.byte	0x3
	.byte	0xb6
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.string	"mem"
	.byte	0x3
	.byte	0xb8
	.long	0x6de
	.long	.LLST21
	.uleb128 0x1b
	.long	.LVL58
	.long	0x117b
	.uleb128 0x1b
	.long	.LVL59
	.long	0x1161
	.uleb128 0x1b
	.long	.LVL61
	.long	0x116e
	.uleb128 0x1b
	.long	.LVL62
	.long	0x845
	.uleb128 0x1b
	.long	.LVL63
	.long	0x972
	.uleb128 0x1b
	.long	.LVL64
	.long	0x11a2
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF81
	.byte	0x3
	.byte	0xc5
	.byte	0x1
	.long	0x5cf
	.long	.LFB28
	.long	.LFE28
	.long	.LLST22
	.byte	0x1
	.long	0xc85
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0xc5
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF82
	.byte	0x3
	.byte	0xc5
	.long	0x6de
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.string	"ip"
	.byte	0x3
	.byte	0xc5
	.long	0x713
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.long	.LASF83
	.byte	0x3
	.byte	0xc5
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x14
	.string	"sz"
	.byte	0x3
	.byte	0xc5
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.string	"i"
	.byte	0x3
	.byte	0xc7
	.long	0x25
	.long	.LLST23
	.uleb128 0x1a
	.string	"pa"
	.byte	0x3
	.byte	0xc7
	.long	0x25
	.long	.LLST24
	.uleb128 0x1a
	.string	"n"
	.byte	0x3
	.byte	0xc7
	.long	0x25
	.long	.LLST25
	.uleb128 0x1a
	.string	"pte"
	.byte	0x3
	.byte	0xc8
	.long	0x965
	.long	.LLST26
	.uleb128 0x1b
	.long	.LVL66
	.long	0x117b
	.uleb128 0x1b
	.long	.LVL70
	.long	0x8dc
	.uleb128 0x1b
	.long	.LVL72
	.long	0x117b
	.uleb128 0x1b
	.long	.LVL79
	.long	0x86f
	.uleb128 0x1b
	.long	.LVL80
	.long	0x11af
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF84
	.byte	0x3
	.byte	0xdd
	.byte	0x1
	.long	0x5cf
	.long	.LFB29
	.long	.LFE29
	.long	.LLST27
	.byte	0x1
	.long	0xd20
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0xdd
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF85
	.byte	0x3
	.byte	0xdd
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.long	.LASF86
	.byte	0x3
	.byte	0xdd
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.string	"mem"
	.byte	0x3
	.byte	0xdf
	.long	0x6de
	.long	.LLST28
	.uleb128 0x1a
	.string	"a"
	.byte	0x3
	.byte	0xe0
	.long	0x25
	.long	.LLST29
	.uleb128 0x1b
	.long	.LVL84
	.long	0x1161
	.uleb128 0x1b
	.long	.LVL86
	.long	0x11bc
	.uleb128 0x1b
	.long	.LVL87
	.long	0xd20
	.uleb128 0x1b
	.long	.LVL89
	.long	0x116e
	.uleb128 0x1b
	.long	.LVL90
	.long	0x845
	.uleb128 0x1b
	.long	.LVL91
	.long	0x972
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF87
	.byte	0x3
	.byte	0xfa
	.byte	0x1
	.long	0x5cf
	.long	.LFB30
	.long	.LFE30
	.long	.LLST30
	.byte	0x1
	.long	0xdd3
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0xfa
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF85
	.byte	0x3
	.byte	0xfa
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.long	.LASF86
	.byte	0x3
	.byte	0xfa
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.string	"pte"
	.byte	0x3
	.byte	0xfc
	.long	0x965
	.long	.LLST31
	.uleb128 0x1a
	.string	"a"
	.byte	0x3
	.byte	0xfd
	.long	0x25
	.long	.LLST32
	.uleb128 0x1a
	.string	"pa"
	.byte	0x3
	.byte	0xfd
	.long	0x25
	.long	.LLST33
	.uleb128 0x21
	.long	.LBB2
	.long	.LBE2
	.long	0xdc9
	.uleb128 0x22
	.string	"v"
	.byte	0x3
	.value	0x10b
	.long	0x6de
	.long	.LLST34
	.uleb128 0x1b
	.long	.LVL101
	.long	0x117b
	.uleb128 0x1b
	.long	.LVL102
	.long	0x86f
	.uleb128 0x1b
	.long	.LVL104
	.long	0x11c9
	.byte	0
	.uleb128 0x1b
	.long	.LVL97
	.long	0x8dc
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF88
	.byte	0x3
	.value	0x116
	.byte	0x1
	.long	.LFB31
	.long	.LFE31
	.long	.LLST35
	.byte	0x1
	.long	0xe54
	.uleb128 0x24
	.long	.LASF43
	.byte	0x3
	.value	0x116
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x25
	.string	"i"
	.byte	0x3
	.value	0x118
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.long	.LBB3
	.long	.LBE3
	.long	0xe38
	.uleb128 0x22
	.string	"v"
	.byte	0x3
	.value	0x11f
	.long	0x6de
	.long	.LLST36
	.uleb128 0x1b
	.long	.LVL112
	.long	0x86f
	.uleb128 0x1b
	.long	.LVL114
	.long	0x11c9
	.byte	0
	.uleb128 0x1b
	.long	.LVL109
	.long	0x117b
	.uleb128 0x1b
	.long	.LVL110
	.long	0xd20
	.uleb128 0x1b
	.long	.LVL116
	.long	0x11c9
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF89
	.byte	0x3
	.value	0x129
	.byte	0x1
	.long	.LFB32
	.long	.LFE32
	.long	.LLST37
	.byte	0x1
	.long	0xeb0
	.uleb128 0x24
	.long	.LASF43
	.byte	0x3
	.value	0x129
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x26
	.string	"uva"
	.byte	0x3
	.value	0x129
	.long	0x6de
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x22
	.string	"pte"
	.byte	0x3
	.value	0x12b
	.long	0x965
	.long	.LLST38
	.uleb128 0x1b
	.long	.LVL118
	.long	0x8dc
	.uleb128 0x1b
	.long	.LVL120
	.long	0x117b
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF90
	.byte	0x3
	.value	0x136
	.byte	0x1
	.long	0x6d8
	.long	.LFB33
	.long	.LFE33
	.long	.LLST39
	.byte	0x1
	.long	0xfae
	.uleb128 0x24
	.long	.LASF43
	.byte	0x3
	.value	0x136
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x26
	.string	"sz"
	.byte	0x3
	.value	0x136
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x22
	.string	"d"
	.byte	0x3
	.value	0x138
	.long	0x6d8
	.long	.LLST40
	.uleb128 0x22
	.string	"pte"
	.byte	0x3
	.value	0x139
	.long	0x965
	.long	.LLST41
	.uleb128 0x22
	.string	"pa"
	.byte	0x3
	.value	0x13a
	.long	0x25
	.long	.LLST42
	.uleb128 0x22
	.string	"i"
	.byte	0x3
	.value	0x13a
	.long	0x25
	.long	.LLST43
	.uleb128 0x28
	.long	.LASF91
	.byte	0x3
	.value	0x13a
	.long	0x25
	.long	.LLST44
	.uleb128 0x22
	.string	"mem"
	.byte	0x3
	.value	0x13b
	.long	0x6de
	.long	.LLST45
	.uleb128 0x29
	.string	"bad"
	.byte	0x3
	.value	0x14e
	.long	.L76
	.uleb128 0x1b
	.long	.LVL123
	.long	0xa10
	.uleb128 0x1b
	.long	.LVL130
	.long	0x8dc
	.uleb128 0x1b
	.long	.LVL132
	.long	0x117b
	.uleb128 0x1b
	.long	.LVL134
	.long	0x117b
	.uleb128 0x1b
	.long	.LVL138
	.long	0x1161
	.uleb128 0x1b
	.long	.LVL140
	.long	0x86f
	.uleb128 0x1b
	.long	.LVL141
	.long	0x11a2
	.uleb128 0x1b
	.long	.LVL142
	.long	0x845
	.uleb128 0x1b
	.long	.LVL143
	.long	0x972
	.uleb128 0x1b
	.long	.LVL147
	.long	0xdd3
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF92
	.byte	0x3
	.value	0x156
	.byte	0x1
	.long	0x6de
	.long	.LFB34
	.long	.LFE34
	.long	.LLST46
	.byte	0x1
	.long	0x100e
	.uleb128 0x24
	.long	.LASF43
	.byte	0x3
	.value	0x156
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x26
	.string	"uva"
	.byte	0x3
	.value	0x156
	.long	0x6de
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x22
	.string	"pte"
	.byte	0x3
	.value	0x158
	.long	0x965
	.long	.LLST47
	.uleb128 0x1b
	.long	.LVL150
	.long	0x8dc
	.uleb128 0x1b
	.long	.LVL153
	.long	0x86f
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF93
	.byte	0x3
	.value	0x166
	.byte	0x1
	.long	0x5cf
	.long	.LFB35
	.long	.LFE35
	.long	.LLST48
	.byte	0x1
	.long	0x10b8
	.uleb128 0x24
	.long	.LASF43
	.byte	0x3
	.value	0x166
	.long	0x6d8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2a
	.string	"va"
	.byte	0x3
	.value	0x166
	.long	0x25
	.long	.LLST49
	.uleb128 0x26
	.string	"p"
	.byte	0x3
	.value	0x166
	.long	0x4ca
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x26
	.string	"len"
	.byte	0x3
	.value	0x166
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x22
	.string	"buf"
	.byte	0x3
	.value	0x168
	.long	0x6de
	.long	.LLST50
	.uleb128 0x22
	.string	"pa0"
	.byte	0x3
	.value	0x168
	.long	0x6de
	.long	.LLST51
	.uleb128 0x22
	.string	"n"
	.byte	0x3
	.value	0x169
	.long	0x25
	.long	.LLST52
	.uleb128 0x22
	.string	"va0"
	.byte	0x3
	.value	0x169
	.long	0x25
	.long	.LLST53
	.uleb128 0x1b
	.long	.LVL158
	.long	0xfae
	.uleb128 0x1b
	.long	.LVL166
	.long	0x11a2
	.byte	0
	.uleb128 0xc
	.long	0x729
	.long	0x10c8
	.uleb128 0xd
	.long	0x5c3
	.byte	0x3
	.byte	0
	.uleb128 0x1f
	.long	.LASF60
	.byte	0x3
	.byte	0x78
	.long	0x10b8
	.byte	0x5
	.byte	0x3
	.long	kmap
	.uleb128 0xc
	.long	0x4cc
	.long	0x10e9
	.uleb128 0xd
	.long	0x5c3
	.byte	0x7
	.byte	0
	.uleb128 0x2b
	.long	.LASF94
	.byte	0x6
	.byte	0x13
	.long	0x10d9
	.byte	0x1
	.byte	0x1
	.uleb128 0x2c
	.string	"cpu"
	.byte	0x6
	.byte	0x1e
	.long	.LASF111
	.long	0x5d6
	.byte	0x1
	.byte	0x1
	.uleb128 0x2d
	.long	.LASF40
	.byte	0x6
	.byte	0x1f
	.long	.LASF112
	.long	0x69d
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	0x6e4
	.long	0x1123
	.uleb128 0x2e
	.byte	0
	.uleb128 0x2b
	.long	.LASF95
	.byte	0x3
	.byte	0xa
	.long	0x1118
	.byte	0x1
	.byte	0x1
	.uleb128 0x2f
	.long	.LASF96
	.byte	0x3
	.byte	0xb
	.long	0x6d8
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	kpgdir
	.uleb128 0x30
	.string	"gdt"
	.byte	0x3
	.byte	0xc
	.long	0x5b3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	gdt
	.uleb128 0x31
	.byte	0x1
	.byte	0x1
	.long	.LASF97
	.long	.LASF97
	.byte	0x7
	.byte	0x4c
	.uleb128 0x31
	.byte	0x1
	.byte	0x1
	.long	.LASF98
	.long	.LASF98
	.byte	0x7
	.byte	0x42
	.uleb128 0x31
	.byte	0x1
	.byte	0x1
	.long	.LASF99
	.long	.LASF99
	.byte	0x7
	.byte	0x89
	.uleb128 0x31
	.byte	0x1
	.byte	0x1
	.long	.LASF100
	.long	.LASF100
	.byte	0x7
	.byte	0x16
	.uleb128 0x31
	.byte	0x1
	.byte	0x1
	.long	.LASF101
	.long	.LASF101
	.byte	0x7
	.byte	0x83
	.uleb128 0x31
	.byte	0x1
	.byte	0x1
	.long	.LASF102
	.long	.LASF102
	.byte	0x7
	.byte	0x84
	.uleb128 0x31
	.byte	0x1
	.byte	0x1
	.long	.LASF103
	.long	.LASF103
	.byte	0x7
	.byte	0x88
	.uleb128 0x31
	.byte	0x1
	.byte	0x1
	.long	.LASF104
	.long	.LASF104
	.byte	0x7
	.byte	0x33
	.uleb128 0x31
	.byte	0x1
	.byte	0x1
	.long	.LASF105
	.long	.LASF105
	.byte	0x7
	.byte	0x14
	.uleb128 0x31
	.byte	0x1
	.byte	0x1
	.long	.LASF106
	.long	.LASF106
	.byte	0x7
	.byte	0x43
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
	.uleb128 0x6
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
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
	.long	.LFB7-.Ltext0
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
	.long	.LFE7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB9-.Ltext0
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
	.long	.LFE9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB11-.Ltext0
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
	.long	.LFE11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LFB16-.Ltext0
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
	.long	.LFE16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST4:
	.long	.LFB18-.Ltext0
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
	.long	.LFE18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LFB19-.Ltext0
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
	.long	.LFE19-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST6:
	.long	.LFB20-.Ltext0
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
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LVL7-.Ltext0
	.long	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST8:
	.long	.LFB21-.Ltext0
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
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST9:
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL14-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST10:
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL19-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL21-.Ltext0
	.long	.LVL22-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL22-1-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST11:
	.long	.LFB22-.Ltext0
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
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST12:
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL27-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST13:
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL31-.Ltext0
	.long	.LVL32-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL32-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL33-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST14:
	.long	.LFB23-.Ltext0
	.long	.LCFI27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI27-.Ltext0
	.long	.LCFI28-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI28-.Ltext0
	.long	.LCFI29-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI29-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST15:
	.long	.LVL36-.Ltext0
	.long	.LVL37-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL37-.Ltext0
	.long	.LVL38-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL38-.Ltext0
	.long	.LVL39-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL39-1-.Ltext0
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
.LLST16:
	.long	.LVL42-.Ltext0
	.long	.LVL44-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST17:
	.long	.LFB24-.Ltext0
	.long	.LCFI30-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI30-.Ltext0
	.long	.LCFI31-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI31-.Ltext0
	.long	.LCFI32-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI32-.Ltext0
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST18:
	.long	.LFB25-.Ltext0
	.long	.LCFI33-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI33-.Ltext0
	.long	.LCFI34-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI34-.Ltext0
	.long	.LCFI35-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI35-.Ltext0
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST19:
	.long	.LFB26-.Ltext0
	.long	.LCFI36-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI36-.Ltext0
	.long	.LCFI37-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI37-.Ltext0
	.long	.LCFI38-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI38-.Ltext0
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST20:
	.long	.LFB27-.Ltext0
	.long	.LCFI39-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI39-.Ltext0
	.long	.LCFI40-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI40-.Ltext0
	.long	.LCFI41-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI41-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST21:
	.long	.LVL60-.Ltext0
	.long	.LVL61-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL61-1-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST22:
	.long	.LFB28-.Ltext0
	.long	.LCFI42-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI42-.Ltext0
	.long	.LCFI43-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI43-.Ltext0
	.long	.LCFI44-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI44-.Ltext0
	.long	.LFE28-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST23:
	.long	.LVL67-.Ltext0
	.long	.LVL68-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL68-.Ltext0
	.long	.LVL69-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL69-.Ltext0
	.long	.LFE28-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST24:
	.long	.LVL74-.Ltext0
	.long	.LVL75-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL75-.Ltext0
	.long	.LVL81-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST25:
	.long	.LVL76-.Ltext0
	.long	.LVL77-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL78-.Ltext0
	.long	.LVL81-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST26:
	.long	.LVL71-.Ltext0
	.long	.LVL72-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL72-1-.Ltext0
	.long	.LVL72-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL72-.Ltext0
	.long	.LVL73-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL73-.Ltext0
	.long	.LVL81-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST27:
	.long	.LFB29-.Ltext0
	.long	.LCFI45-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI45-.Ltext0
	.long	.LCFI46-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI46-.Ltext0
	.long	.LCFI47-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI47-.Ltext0
	.long	.LFE29-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST28:
	.long	.LVL85-.Ltext0
	.long	.LVL86-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL86-1-.Ltext0
	.long	.LVL88-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL88-.Ltext0
	.long	.LVL89-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL89-1-.Ltext0
	.long	.LVL92-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST29:
	.long	.LVL83-.Ltext0
	.long	.LVL84-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL84-1-.Ltext0
	.long	.LVL93-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST30:
	.long	.LFB30-.Ltext0
	.long	.LCFI48-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI48-.Ltext0
	.long	.LCFI49-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI49-.Ltext0
	.long	.LCFI50-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI50-.Ltext0
	.long	.LFE30-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST31:
	.long	.LVL98-.Ltext0
	.long	.LVL99-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL99-.Ltext0
	.long	.LVL106-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST32:
	.long	.LVL95-.Ltext0
	.long	.LVL96-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL96-.Ltext0
	.long	.LVL107-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST33:
	.long	.LVL100-.Ltext0
	.long	.LVL101-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL101-1-.Ltext0
	.long	.LVL101-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL101-.Ltext0
	.long	.LVL102-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL102-1-.Ltext0
	.long	.LVL105-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST34:
	.long	.LVL103-.Ltext0
	.long	.LVL104-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL104-1-.Ltext0
	.long	.LVL105-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST35:
	.long	.LFB31-.Ltext0
	.long	.LCFI51-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI51-.Ltext0
	.long	.LCFI52-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI52-.Ltext0
	.long	.LCFI53-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI53-.Ltext0
	.long	.LFE31-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST36:
	.long	.LVL113-.Ltext0
	.long	.LVL114-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL114-1-.Ltext0
	.long	.LVL115-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST37:
	.long	.LFB32-.Ltext0
	.long	.LCFI54-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI54-.Ltext0
	.long	.LCFI55-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI55-.Ltext0
	.long	.LCFI56-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI56-.Ltext0
	.long	.LFE32-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST38:
	.long	.LVL119-.Ltext0
	.long	.LVL120-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL120-1-.Ltext0
	.long	.LVL120-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL120-.Ltext0
	.long	.LVL121-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL121-.Ltext0
	.long	.LFE32-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST39:
	.long	.LFB33-.Ltext0
	.long	.LCFI57-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI57-.Ltext0
	.long	.LCFI58-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI58-.Ltext0
	.long	.LCFI59-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI59-.Ltext0
	.long	.LFE33-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST40:
	.long	.LVL124-.Ltext0
	.long	.LVL125-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL125-.Ltext0
	.long	.LVL126-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL126-.Ltext0
	.long	.LVL128-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL128-.Ltext0
	.long	.LFE33-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST41:
	.long	.LVL131-.Ltext0
	.long	.LVL132-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL132-1-.Ltext0
	.long	.LVL132-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL132-.Ltext0
	.long	.LVL133-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL133-.Ltext0
	.long	.LVL144-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL145-.Ltext0
	.long	.LVL148-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST42:
	.long	.LVL135-.Ltext0
	.long	.LVL136-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL136-.Ltext0
	.long	.LVL144-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL145-.Ltext0
	.long	.LVL148-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST43:
	.long	.LVL127-.Ltext0
	.long	.LVL128-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL128-.Ltext0
	.long	.LVL129-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL129-.Ltext0
	.long	.LVL148-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST44:
	.long	.LVL137-.Ltext0
	.long	.LVL138-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL138-1-.Ltext0
	.long	.LVL144-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL145-.Ltext0
	.long	.LVL148-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST45:
	.long	.LVL139-.Ltext0
	.long	.LVL140-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL140-1-.Ltext0
	.long	.LVL144-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL145-.Ltext0
	.long	.LVL146-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL146-.Ltext0
	.long	.LVL148-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	0
	.long	0
.LLST46:
	.long	.LFB34-.Ltext0
	.long	.LCFI60-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI60-.Ltext0
	.long	.LCFI61-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI61-.Ltext0
	.long	.LCFI62-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI62-.Ltext0
	.long	.LFE34-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST47:
	.long	.LVL151-.Ltext0
	.long	.LVL152-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL152-.Ltext0
	.long	.LFE34-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST48:
	.long	.LFB35-.Ltext0
	.long	.LCFI63-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI63-.Ltext0
	.long	.LCFI64-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI64-.Ltext0
	.long	.LCFI65-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI65-.Ltext0
	.long	.LFE35-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST49:
	.long	.LVL154-.Ltext0
	.long	.LVL167-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	.LVL167-.Ltext0
	.long	.LFE35-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	0
	.long	0
.LLST50:
	.long	.LVL155-.Ltext0
	.long	.LVL156-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL156-.Ltext0
	.long	.LFE35-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST51:
	.long	.LVL159-.Ltext0
	.long	.LVL160-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL160-.Ltext0
	.long	.LVL161-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL161-.Ltext0
	.long	.LVL162-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL162-.Ltext0
	.long	.LVL167-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST52:
	.long	.LVL163-.Ltext0
	.long	.LVL164-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL164-.Ltext0
	.long	.LVL167-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST53:
	.long	.LVL157-.Ltext0
	.long	.LVL158-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL158-1-.Ltext0
	.long	.LVL167-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
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
.LASF52:
	.string	"EMBRYO"
.LASF76:
	.string	"switchkvm"
.LASF61:
	.string	"virt"
.LASF36:
	.string	"scheduler"
.LASF23:
	.string	"rsv1"
.LASF21:
	.string	"type"
.LASF18:
	.string	"lim_15_0"
.LASF37:
	.string	"started"
.LASF82:
	.string	"addr"
.LASF64:
	.string	"perm"
.LASF69:
	.string	"walkpgdir"
.LASF87:
	.string	"deallocuvm"
.LASF97:
	.string	"cpunum"
.LASF53:
	.string	"SLEEPING"
.LASF78:
	.string	"inituvm"
.LASF77:
	.string	"switchuvm"
.LASF75:
	.string	"kvmalloc"
.LASF46:
	.string	"parent"
.LASF45:
	.string	"state"
.LASF70:
	.string	"alloc"
.LASF88:
	.string	"freevm"
.LASF110:
	.string	"procstate"
.LASF67:
	.string	"loadgs"
.LASF102:
	.string	"popcli"
.LASF27:
	.string	"link"
.LASF111:
	.string	"%gs:0"
.LASF100:
	.string	"panic"
.LASF112:
	.string	"%gs:4"
.LASF6:
	.string	"pde_t"
.LASF108:
	.string	"vm.c"
.LASF86:
	.string	"newsz"
.LASF93:
	.string	"copyout"
.LASF40:
	.string	"proc"
.LASF7:
	.string	"oesp"
.LASF66:
	.string	"lgdt"
.LASF106:
	.string	"kfree"
.LASF90:
	.string	"copyuvm"
.LASF50:
	.string	"name"
.LASF54:
	.string	"RUNNABLE"
.LASF101:
	.string	"pushcli"
.LASF35:
	.string	"iomb"
.LASF65:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF28:
	.string	"esp0"
.LASF29:
	.string	"esp1"
.LASF30:
	.string	"esp2"
.LASF73:
	.string	"last"
.LASF49:
	.string	"ofile"
.LASF109:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF19:
	.string	"base_15_0"
.LASF96:
	.string	"kpgdir"
.LASF74:
	.string	"seginit"
.LASF43:
	.string	"pgdir"
.LASF51:
	.string	"UNUSED"
.LASF8:
	.string	"padding1"
.LASF9:
	.string	"padding2"
.LASF10:
	.string	"padding3"
.LASF11:
	.string	"padding4"
.LASF13:
	.string	"padding5"
.LASF15:
	.string	"padding6"
.LASF31:
	.string	"padding7"
.LASF32:
	.string	"padding8"
.LASF33:
	.string	"padding9"
.LASF16:
	.string	"trapframe"
.LASF42:
	.string	"sizetype"
.LASF12:
	.string	"trapno"
.LASF56:
	.string	"ZOMBIE"
.LASF62:
	.string	"phys_start"
.LASF1:
	.string	"ushort"
.LASF14:
	.string	"eflags"
.LASF25:
	.string	"pte_t"
.LASF26:
	.string	"taskstate"
.LASF4:
	.string	"uchar"
.LASF79:
	.string	"init"
.LASF105:
	.string	"cprintf"
.LASF72:
	.string	"mappages"
.LASF0:
	.string	"uint"
.LASF85:
	.string	"oldsz"
.LASF59:
	.string	"inode"
.LASF44:
	.string	"kstack"
.LASF22:
	.string	"lim_19_16"
.LASF5:
	.string	"unsigned char"
.LASF84:
	.string	"allocuvm"
.LASF24:
	.string	"base_31_24"
.LASF58:
	.string	"file"
.LASF39:
	.string	"intena"
.LASF20:
	.string	"base_23_16"
.LASF55:
	.string	"RUNNING"
.LASF47:
	.string	"chan"
.LASF57:
	.string	"char"
.LASF17:
	.string	"segdesc"
.LASF98:
	.string	"kalloc"
.LASF2:
	.string	"unsigned int"
.LASF68:
	.string	"lcr3"
.LASF71:
	.string	"pgtab"
.LASF89:
	.string	"clearpteu"
.LASF83:
	.string	"offset"
.LASF95:
	.string	"data"
.LASF92:
	.string	"uva2ka"
.LASF41:
	.string	"context"
.LASF107:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF34:
	.string	"padding10"
.LASF104:
	.string	"readi"
.LASF99:
	.string	"memset"
.LASF81:
	.string	"loaduvm"
.LASF38:
	.string	"ncli"
.LASF103:
	.string	"memmove"
.LASF91:
	.string	"flags"
.LASF63:
	.string	"phys_end"
.LASF80:
	.string	"setupkvm"
.LASF94:
	.string	"cpus"
.LASF48:
	.string	"killed"
.LASF60:
	.string	"kmap"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
