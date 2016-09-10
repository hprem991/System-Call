	.file	"console.c"
	.text
.Ltext0:
	.type	inb, @function
inb:
.LFB2:
	.file 1 "x86.h"
	.loc 1 5 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	.loc 1 8 0
	movzwl	-20(%ebp), %eax
	movl	%eax, %edx
#APP
# 8 "x86.h" 1
	in %dx,%al
# 0 "" 2
#NO_APP
	movb	%al, -1(%ebp)
.LVL1:
	.loc 1 9 0
	movzbl	-1(%ebp), %eax
	.loc 1 10 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	inb, .-inb
	.type	outb, @function
outb:
.LFB4:
	.loc 1 23 0
	.cfi_startproc
.LVL2:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
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
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	outb, .-outb
	.type	cli, @function
cli:
.LFB14:
	.loc 1 110 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	.loc 1 111 0
#APP
# 111 "x86.h" 1
	cli
# 0 "" 2
	.loc 1 112 0
#NO_APP
	nop
	popl	%ebp
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	cli, .-cli
	.local	panicked
	.comm	panicked,4,4
	.local	cons
	.comm	cons,56,32
	.type	printint, @function
printint:
.LFB20:
	.file 2 "console.c"
	.loc 2 28 0
	.cfi_startproc
.LVL3:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 2 34 0
	cmpl	$0, 16(%ebp)
	je	.L6
	.loc 2 34 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	shrl	$31, %eax
	movzbl	%al, %eax
	movl	%eax, 16(%ebp)
.LVL4:
	cmpl	$0, 16(%ebp)
	je	.L6
	.loc 2 35 0 is_stmt 1
	movl	8(%ebp), %eax
.LVL5:
	negl	%eax
	movl	%eax, -16(%ebp)
.LVL6:
	jmp	.L7
.LVL7:
.L6:
	.loc 2 37 0
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
.LVL8:
.L7:
	.loc 2 39 0
	movl	$0, -12(%ebp)
.LVL9:
.L8:
	.loc 2 41 0 discriminator 1
	movl	-12(%ebp), %ecx
	leal	1(%ecx), %eax
	movl	%eax, -12(%ebp)
.LVL10:
	movl	12(%ebp), %ebx
	movl	-16(%ebp), %eax
.LVL11:
	movl	$0, %edx
	divl	%ebx
	movl	%edx, %eax
	movzbl	digits.1604(%eax), %eax
	movb	%al, -32(%ebp,%ecx)
	.loc 2 42 0 discriminator 1
	movl	12(%ebp), %ebx
	movl	-16(%ebp), %eax
	movl	$0, %edx
	divl	%ebx
	movl	%eax, -16(%ebp)
.LVL12:
	cmpl	$0, -16(%ebp)
	jne	.L8
	.loc 2 44 0
	cmpl	$0, 16(%ebp)
	je	.L10
	.loc 2 45 0
	movl	-12(%ebp), %eax
.LVL13:
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
.LVL14:
	movb	$45, -32(%ebp,%eax)
	.loc 2 47 0
	jmp	.L10
.LVL15:
.L11:
	.loc 2 48 0
	leal	-32(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	consputc
.LVL16:
	addl	$16, %esp
.L10:
	.loc 2 47 0
	subl	$1, -12(%ebp)
.LVL17:
	cmpl	$0, -12(%ebp)
	jns	.L11
	.loc 2 49 0
	nop
	movl	-4(%ebp), %ebx
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	printint, .-printint
	.section	.rodata
.LC0:
	.string	"null fmt"
.LC1:
	.string	"(null)"
	.text
	.globl	cprintf
	.type	cprintf, @function
cprintf:
.LFB21:
	.loc 2 55 0
	.cfi_startproc
.LVL18:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 60 0
	movl	cons+52, %eax
	movl	%eax, -24(%ebp)
.LVL19:
	.loc 2 61 0
	cmpl	$0, -24(%ebp)
	je	.L13
	.loc 2 62 0
	subl	$12, %esp
	pushl	$cons
	call	acquire
.LVL20:
	addl	$16, %esp
.L13:
	.loc 2 64 0
	movl	8(%ebp), %eax
	testl	%eax, %eax
	jne	.L14
	.loc 2 65 0
	subl	$12, %esp
	pushl	$.LC0
	call	panic
.LVL21:
.L14:
	.loc 2 67 0
	leal	12(%ebp), %eax
	movl	%eax, -16(%ebp)
.LVL22:
	.loc 2 68 0
	movl	$0, -12(%ebp)
.LVL23:
	jmp	.L15
.LVL24:
.L29:
	.loc 2 69 0
	cmpl	$37, -28(%ebp)
	je	.L16
	.loc 2 70 0
	subl	$12, %esp
	pushl	-28(%ebp)
	call	consputc
.LVL25:
	addl	$16, %esp
	.loc 2 71 0
	jmp	.L17
.LVL26:
.L16:
	.loc 2 73 0
	movl	8(%ebp), %edx
	addl	$1, -12(%ebp)
.LVL27:
	movl	-12(%ebp), %eax
.LVL28:
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	andl	$255, %eax
	movl	%eax, -28(%ebp)
.LVL29:
	.loc 2 74 0
	cmpl	$0, -28(%ebp)
	je	.L31
	.loc 2 76 0
	movl	-28(%ebp), %eax
	cmpl	$112, %eax
	je	.L21
	cmpl	$112, %eax
	jg	.L22
	cmpl	$37, %eax
	je	.L23
	cmpl	$100, %eax
	je	.L24
	jmp	.L20
.L22:
	cmpl	$115, %eax
	je	.L25
	cmpl	$120, %eax
	je	.L21
	jmp	.L20
.L24:
	.loc 2 78 0
	movl	-16(%ebp), %eax
.LVL30:
	leal	4(%eax), %edx
	movl	%edx, -16(%ebp)
.LVL31:
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	$1
	pushl	$10
	pushl	%eax
	call	printint
.LVL32:
	addl	$16, %esp
	.loc 2 79 0
	jmp	.L17
.LVL33:
.L21:
	.loc 2 82 0
	movl	-16(%ebp), %eax
.LVL34:
	leal	4(%eax), %edx
	movl	%edx, -16(%ebp)
.LVL35:
	movl	(%eax), %eax
	subl	$4, %esp
	pushl	$0
	pushl	$16
	pushl	%eax
	call	printint
.LVL36:
	addl	$16, %esp
	.loc 2 83 0
	jmp	.L17
.LVL37:
.L25:
	.loc 2 85 0
	movl	-16(%ebp), %eax
.LVL38:
	leal	4(%eax), %edx
	movl	%edx, -16(%ebp)
.LVL39:
	movl	(%eax), %eax
	movl	%eax, -20(%ebp)
.LVL40:
	cmpl	$0, -20(%ebp)
	jne	.L27
	.loc 2 86 0
	movl	$.LC1, -20(%ebp)
.LVL41:
	.loc 2 87 0
	jmp	.L27
.LVL42:
.L28:
	.loc 2 88 0 discriminator 2
	movl	-20(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	consputc
.LVL43:
	addl	$16, %esp
	.loc 2 87 0 discriminator 2
	addl	$1, -20(%ebp)
.L27:
	.loc 2 87 0 is_stmt 0 discriminator 1
	movl	-20(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L28
	.loc 2 89 0 is_stmt 1
	jmp	.L17
.LVL44:
.L23:
	.loc 2 91 0
	subl	$12, %esp
	pushl	$37
	call	consputc
.LVL45:
	addl	$16, %esp
	.loc 2 92 0
	jmp	.L17
.LVL46:
.L20:
	.loc 2 95 0
	subl	$12, %esp
	pushl	$37
	call	consputc
.LVL47:
	addl	$16, %esp
	.loc 2 96 0
	subl	$12, %esp
	pushl	-28(%ebp)
	call	consputc
.LVL48:
	addl	$16, %esp
	.loc 2 97 0
	nop
.L17:
	.loc 2 68 0 discriminator 2
	addl	$1, -12(%ebp)
.LVL49:
.L15:
	.loc 2 68 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	andl	$255, %eax
	movl	%eax, -28(%ebp)
.LVL50:
	cmpl	$0, -28(%ebp)
	jne	.L29
	jmp	.L19
.L31:
	.loc 2 75 0 is_stmt 1
	nop
.L19:
	.loc 2 101 0
	cmpl	$0, -24(%ebp)
	je	.L32
	.loc 2 102 0
	subl	$12, %esp
	pushl	$cons
	call	release
.LVL51:
	addl	$16, %esp
.L32:
	.loc 2 103 0
	nop
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	cprintf, .-cprintf
	.section	.rodata
.LC2:
	.string	"cpu%d: panic: "
.LC3:
	.string	"\n"
.LC4:
	.string	" %p"
	.text
	.globl	panic
	.type	panic, @function
panic:
.LFB22:
	.loc 2 107 0
	.cfi_startproc
.LVL52:
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 2 111 0
	call	cli
.LVL53:
	.loc 2 112 0
	movl	$0, cons+52
	.loc 2 113 0
	movl	%gs:0, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC2
	call	cprintf
.LVL54:
	addl	$16, %esp
	.loc 2 114 0
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	cprintf
.LVL55:
	addl	$16, %esp
	.loc 2 115 0
	subl	$12, %esp
	pushl	$.LC3
	call	cprintf
.LVL56:
	addl	$16, %esp
	.loc 2 116 0
	subl	$8, %esp
	leal	-52(%ebp), %eax
	pushl	%eax
	leal	8(%ebp), %eax
.LVL57:
	pushl	%eax
	call	getcallerpcs
.LVL58:
	addl	$16, %esp
	.loc 2 117 0
	movl	$0, -12(%ebp)
.LVL59:
	jmp	.L34
.L35:
	.loc 2 118 0 discriminator 3
	movl	-12(%ebp), %eax
	movl	-52(%ebp,%eax,4), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC4
	call	cprintf
.LVL60:
	addl	$16, %esp
	.loc 2 117 0 discriminator 3
	addl	$1, -12(%ebp)
.L34:
	.loc 2 117 0 is_stmt 0 discriminator 1
	cmpl	$9, -12(%ebp)
	jle	.L35
	.loc 2 119 0 is_stmt 1
	movl	$1, panicked
.L36:
	.loc 2 121 0 discriminator 1
	jmp	.L36
	.cfi_endproc
.LFE22:
	.size	panic, .-panic
	.data
	.align 4
	.type	crt, @object
	.size	crt, 4
crt:
	.long	-2146729984
	.section	.rodata
.LC5:
	.string	"pos under/overflow"
	.text
	.type	cgaputc, @function
cgaputc:
.LFB23:
	.loc 2 131 0
	.cfi_startproc
.LVL61:
	pushl	%ebp
.LCFI17:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI18:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 135 0
	pushl	$14
	pushl	$980
	call	outb
.LVL62:
	addl	$8, %esp
	.loc 2 136 0
	pushl	$981
	call	inb
.LVL63:
	addl	$4, %esp
	movzbl	%al, %eax
	sall	$8, %eax
	movl	%eax, -12(%ebp)
.LVL64:
	.loc 2 137 0
	pushl	$15
	pushl	$980
	call	outb
.LVL65:
	addl	$8, %esp
	.loc 2 138 0
	pushl	$981
	call	inb
.LVL66:
	addl	$4, %esp
	movzbl	%al, %eax
	orl	%eax, -12(%ebp)
	.loc 2 140 0
	cmpl	$10, 8(%ebp)
	jne	.L38
	.loc 2 141 0
	movl	-12(%ebp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$4, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	movl	$80, %eax
	subl	%edx, %eax
	addl	%eax, -12(%ebp)
.LVL67:
	jmp	.L39
.L38:
	.loc 2 142 0
	cmpl	$256, 8(%ebp)
	jne	.L40
	.loc 2 143 0
	cmpl	$0, -12(%ebp)
	jle	.L39
	.loc 2 143 0 is_stmt 0 discriminator 1
	subl	$1, -12(%ebp)
.LVL68:
	jmp	.L39
.L40:
	.loc 2 145 0 is_stmt 1
	movl	crt, %ecx
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
.LVL69:
	addl	%eax, %eax
	addl	%ecx, %eax
	movl	8(%ebp), %edx
.LVL70:
	movzbl	%dl, %edx
	orb	$7, %dh
	movw	%dx, (%eax)
.L39:
	.loc 2 147 0
	cmpl	$0, -12(%ebp)
	js	.L42
	.loc 2 147 0 is_stmt 0 discriminator 1
	cmpl	$2000, -12(%ebp)
	jle	.L43
.L42:
	.loc 2 148 0 is_stmt 1
	subl	$12, %esp
	pushl	$.LC5
	call	panic
.LVL71:
.L43:
	.loc 2 150 0
	cmpl	$1919, -12(%ebp)
	jle	.L44
	.loc 2 151 0
	movl	crt, %eax
	leal	160(%eax), %edx
	movl	crt, %eax
	subl	$4, %esp
	pushl	$3680
	pushl	%edx
	pushl	%eax
	call	memmove
.LVL72:
	addl	$16, %esp
	.loc 2 152 0
	subl	$80, -12(%ebp)
	.loc 2 153 0
	movl	$1920, %eax
	subl	-12(%ebp), %eax
	leal	(%eax,%eax), %edx
	movl	crt, %eax
	movl	-12(%ebp), %ecx
	addl	%ecx, %ecx
	addl	%ecx, %eax
	subl	$4, %esp
	pushl	%edx
	pushl	$0
	pushl	%eax
	call	memset
.LVL73:
	addl	$16, %esp
.L44:
	.loc 2 156 0
	subl	$8, %esp
	pushl	$14
	pushl	$980
	call	outb
.LVL74:
	addl	$16, %esp
	.loc 2 157 0
	movl	-12(%ebp), %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$981
	call	outb
.LVL75:
	addl	$16, %esp
	.loc 2 158 0
	subl	$8, %esp
	pushl	$15
	pushl	$980
	call	outb
.LVL76:
	addl	$16, %esp
	.loc 2 159 0
	movl	-12(%ebp), %eax
	movzbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$981
	call	outb
.LVL77:
	addl	$16, %esp
	.loc 2 160 0
	movl	crt, %eax
	movl	-12(%ebp), %edx
	addl	%edx, %edx
	addl	%edx, %eax
	movw	$1824, (%eax)
	.loc 2 161 0
	nop
	leave
.LCFI19:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	cgaputc, .-cgaputc
	.type	consputc, @function
consputc:
.LFB24:
	.loc 2 165 0
	.cfi_startproc
.LVL78:
	pushl	%ebp
.LCFI20:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI21:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 2 166 0
	movl	panicked, %eax
	testl	%eax, %eax
	je	.L46
	.loc 2 167 0
	call	cli
.LVL79:
.L47:
	.loc 2 169 0 discriminator 1
	jmp	.L47
.L46:
	.loc 2 172 0
	cmpl	$256, 8(%ebp)
	jne	.L48
	.loc 2 173 0
	subl	$12, %esp
	pushl	$8
	call	uartputc
.LVL80:
	addl	$16, %esp
	subl	$12, %esp
	pushl	$32
	call	uartputc
.LVL81:
	addl	$16, %esp
	subl	$12, %esp
	pushl	$8
	call	uartputc
.LVL82:
	addl	$16, %esp
	jmp	.L49
.L48:
	.loc 2 175 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	uartputc
.LVL83:
	addl	$16, %esp
.L49:
	.loc 2 176 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	cgaputc
.LVL84:
	addl	$16, %esp
	.loc 2 177 0
	nop
	leave
.LCFI22:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	consputc, .-consputc
	.comm	input,140,32
	.globl	consoleintr
	.type	consoleintr, @function
consoleintr:
.LFB25:
	.loc 2 191 0
	.cfi_startproc
.LVL85:
	pushl	%ebp
.LCFI23:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI24:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 192 0
	movl	$0, -12(%ebp)
.LVL86:
	.loc 2 194 0
	subl	$12, %esp
	pushl	$cons
	call	acquire
.LVL87:
	addl	$16, %esp
	.loc 2 195 0
	jmp	.L51
.LVL88:
.L65:
	.loc 2 196 0
	movl	-16(%ebp), %eax
.LVL89:
	cmpl	$16, %eax
	je	.L53
	cmpl	$16, %eax
	jg	.L54
	cmpl	$8, %eax
	je	.L55
	jmp	.L52
.L54:
	cmpl	$21, %eax
	je	.L57
	cmpl	$127, %eax
	je	.L55
	jmp	.L52
.L53:
	.loc 2 198 0
	movl	$1, -12(%ebp)
	.loc 2 199 0
	jmp	.L51
.L59:
	.loc 2 203 0
	movl	input+136, %eax
	subl	$1, %eax
	movl	%eax, input+136
	.loc 2 204 0
	subl	$12, %esp
	pushl	$256
	call	consputc
.LVL90:
	addl	$16, %esp
.L57:
	.loc 2 201 0
	movl	input+136, %edx
	movl	input+132, %eax
	cmpl	%eax, %edx
	je	.L51
	.loc 2 202 0 discriminator 1
	movl	input+136, %eax
	subl	$1, %eax
	andl	$127, %eax
	movzbl	input(%eax), %eax
	.loc 2 201 0 discriminator 1
	cmpb	$10, %al
	jne	.L59
	.loc 2 206 0
	jmp	.L51
.L55:
	.loc 2 208 0
	movl	input+136, %edx
	movl	input+132, %eax
	cmpl	%eax, %edx
	je	.L51
	.loc 2 209 0
	movl	input+136, %eax
	subl	$1, %eax
	movl	%eax, input+136
	.loc 2 210 0
	subl	$12, %esp
	pushl	$256
	call	consputc
.LVL91:
	addl	$16, %esp
	.loc 2 212 0
	jmp	.L51
.L52:
	.loc 2 214 0
	cmpl	$0, -16(%ebp)
	je	.L68
	.loc 2 214 0 is_stmt 0 discriminator 1
	movl	input+136, %edx
	movl	input+128, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$127, %eax
	ja	.L68
	.loc 2 215 0 is_stmt 1
	cmpl	$13, -16(%ebp)
	je	.L62
	.loc 2 215 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	jmp	.L63
.L62:
	.loc 2 215 0 discriminator 2
	movl	$10, %eax
.L63:
	.loc 2 215 0 discriminator 4
	movl	%eax, -16(%ebp)
.LVL92:
	.loc 2 216 0 is_stmt 1 discriminator 4
	movl	input+136, %eax
.LVL93:
	leal	1(%eax), %edx
	movl	%edx, input+136
	andl	$127, %eax
	movl	-16(%ebp), %edx
	movb	%dl, input(%eax)
	.loc 2 217 0 discriminator 4
	subl	$12, %esp
	pushl	-16(%ebp)
	call	consputc
.LVL94:
	addl	$16, %esp
	.loc 2 218 0 discriminator 4
	cmpl	$10, -16(%ebp)
	je	.L64
	.loc 2 218 0 is_stmt 0 discriminator 1
	cmpl	$4, -16(%ebp)
	je	.L64
	.loc 2 218 0 discriminator 2
	movl	input+136, %eax
	movl	input+128, %edx
	subl	$-128, %edx
	cmpl	%edx, %eax
	jne	.L68
.L64:
	.loc 2 219 0 is_stmt 1
	movl	input+136, %eax
	movl	%eax, input+132
	.loc 2 220 0
	subl	$12, %esp
	pushl	$input+128
	call	wakeup
.LVL95:
	addl	$16, %esp
.L68:
	.loc 2 223 0
	nop
.LVL96:
.L51:
	.loc 2 195 0
	movl	8(%ebp), %eax
	call	*%eax
.LVL97:
	movl	%eax, -16(%ebp)
.LVL98:
	cmpl	$0, -16(%ebp)
	jns	.L65
	.loc 2 226 0
	subl	$12, %esp
	pushl	$cons
	call	release
.LVL99:
	addl	$16, %esp
	.loc 2 227 0
	cmpl	$0, -12(%ebp)
	je	.L67
	.loc 2 228 0
	call	procdump
.LVL100:
.L67:
	.loc 2 230 0
	nop
	leave
.LCFI25:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	consoleintr, .-consoleintr
	.globl	consoleread
	.type	consoleread, @function
consoleread:
.LFB26:
	.loc 2 234 0
	.cfi_startproc
.LVL101:
	pushl	%ebp
.LCFI26:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI27:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 238 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	iunlock
.LVL102:
	addl	$16, %esp
	.loc 2 239 0
	movl	16(%ebp), %eax
	movl	%eax, -12(%ebp)
.LVL103:
	.loc 2 240 0
	subl	$12, %esp
	pushl	$cons
	call	acquire
.LVL104:
	addl	$16, %esp
	.loc 2 241 0
	jmp	.L70
.L74:
	.loc 2 243 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L72
	.loc 2 244 0
	subl	$12, %esp
	pushl	$cons
	call	release
.LVL105:
	addl	$16, %esp
	.loc 2 245 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	ilock
.LVL106:
	addl	$16, %esp
	.loc 2 246 0
	movl	$-1, %eax
	jmp	.L73
.L72:
	.loc 2 248 0
	subl	$8, %esp
	pushl	$cons
	pushl	$input+128
	call	sleep
.LVL107:
	addl	$16, %esp
.L71:
	.loc 2 242 0
	movl	input+128, %edx
	movl	input+132, %eax
	cmpl	%eax, %edx
	je	.L74
	.loc 2 250 0
	movl	input+128, %eax
	leal	1(%eax), %edx
	movl	%edx, input+128
	andl	$127, %eax
	movzbl	input(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, -16(%ebp)
.LVL108:
	.loc 2 251 0
	cmpl	$4, -16(%ebp)
	jne	.L75
	.loc 2 252 0
	movl	16(%ebp), %eax
.LVL109:
	cmpl	-12(%ebp), %eax
	jnb	.L79
	.loc 2 255 0
	movl	input+128, %eax
	subl	$1, %eax
	movl	%eax, input+128
	.loc 2 257 0
	jmp	.L79
.LVL110:
.L75:
	.loc 2 259 0
	movl	12(%ebp), %eax
.LVL111:
	leal	1(%eax), %edx
	movl	%edx, 12(%ebp)
.LVL112:
	movl	-16(%ebp), %edx
.LVL113:
	movb	%dl, (%eax)
	.loc 2 260 0
	subl	$1, 16(%ebp)
	.loc 2 261 0
	cmpl	$10, -16(%ebp)
	je	.L80
.LVL114:
.L70:
	.loc 2 241 0
	cmpl	$0, 16(%ebp)
	jg	.L71
	jmp	.L77
.LVL115:
.L79:
	.loc 2 257 0
	nop
	jmp	.L77
.L80:
	.loc 2 262 0
	nop
.LVL116:
.L77:
	.loc 2 264 0
	subl	$12, %esp
	pushl	$cons
	call	release
.LVL117:
	addl	$16, %esp
	.loc 2 265 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	ilock
.LVL118:
	addl	$16, %esp
	.loc 2 267 0
	movl	16(%ebp), %eax
	movl	-12(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
.L73:
	.loc 2 268 0
	leave
.LCFI28:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	consoleread, .-consoleread
	.globl	consolewrite
	.type	consolewrite, @function
consolewrite:
.LFB27:
	.loc 2 272 0
	.cfi_startproc
.LVL119:
	pushl	%ebp
.LCFI29:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI30:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 275 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	iunlock
.LVL120:
	addl	$16, %esp
	.loc 2 276 0
	subl	$12, %esp
	pushl	$cons
	call	acquire
.LVL121:
	addl	$16, %esp
	.loc 2 277 0
	movl	$0, -12(%ebp)
.LVL122:
	jmp	.L82
.LVL123:
.L83:
	.loc 2 278 0 discriminator 3
	movl	-12(%ebp), %edx
	movl	12(%ebp), %eax
.LVL124:
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movzbl	%al, %eax
	subl	$12, %esp
	pushl	%eax
	call	consputc
.LVL125:
	addl	$16, %esp
	.loc 2 277 0 discriminator 3
	addl	$1, -12(%ebp)
.L82:
	.loc 2 277 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L83
	.loc 2 279 0 is_stmt 1
	subl	$12, %esp
	pushl	$cons
	call	release
.LVL126:
	addl	$16, %esp
	.loc 2 280 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	ilock
.LVL127:
	addl	$16, %esp
	.loc 2 282 0
	movl	16(%ebp), %eax
	.loc 2 283 0
	leave
.LCFI31:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE27:
	.size	consolewrite, .-consolewrite
	.section	.rodata
.LC6:
	.string	"console"
	.text
	.globl	consoleinit
	.type	consoleinit, @function
consoleinit:
.LFB28:
	.loc 2 287 0
	.cfi_startproc
	pushl	%ebp
.LCFI32:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI33:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 2 288 0
	subl	$8, %esp
	pushl	$.LC6
	pushl	$cons
	call	initlock
.LVL128:
	addl	$16, %esp
	.loc 2 290 0
	movl	$consolewrite, devsw+12
	.loc 2 291 0
	movl	$consoleread, devsw+8
	.loc 2 292 0
	movl	$1, cons+52
	.loc 2 294 0
	subl	$12, %esp
	pushl	$1
	call	picenable
.LVL129:
	addl	$16, %esp
	.loc 2 295 0
	subl	$8, %esp
	pushl	$0
	pushl	$1
	call	ioapicenable
.LVL130:
	addl	$16, %esp
	.loc 2 296 0
	nop
	leave
.LCFI34:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE28:
	.size	consoleinit, .-consoleinit
	.data
	.align 4
	.type	digits.1604, @object
	.size	digits.1604, 17
digits.1604:
	.string	"0123456789abcdef"
	.text
.Letext0:
	.file 3 "types.h"
	.file 4 "spinlock.h"
	.file 5 "proc.h"
	.file 6 "file.h"
	.file 7 "mmu.h"
	.file 8 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xfe9
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF116
	.byte	0xc
	.long	.LASF117
	.long	.LASF118
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
	.long	.LASF10
	.byte	0x34
	.byte	0x4
	.byte	0x2
	.long	0xab
	.uleb128 0x5
	.long	.LASF7
	.byte	0x4
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF8
	.byte	0x4
	.byte	0x6
	.long	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"cpu"
	.byte	0x4
	.byte	0x7
	.long	0x146
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pcs"
	.byte	0x4
	.byte	0x8
	.long	0x14c
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0xb1
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x8
	.string	"cpu"
	.byte	0xbc
	.byte	0x5
	.byte	0x5
	.long	0x146
	.uleb128 0x6
	.string	"id"
	.byte	0x5
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF11
	.byte	0x5
	.byte	0x7
	.long	0x64b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ts"
	.byte	0x5
	.byte	0x8
	.long	0x3e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"gdt"
	.byte	0x5
	.byte	0x9
	.long	0x651
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x5
	.long	.LASF12
	.byte	0x5
	.byte	0xa
	.long	0x661
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x5
	.long	.LASF13
	.byte	0x5
	.byte	0xb
	.long	0x207
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x5
	.long	.LASF14
	.byte	0x5
	.byte	0xc
	.long	0x207
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x6
	.string	"cpu"
	.byte	0x5
	.byte	0xf
	.long	0x146
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x5
	.long	.LASF15
	.byte	0x5
	.byte	0x10
	.long	0x727
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0xb8
	.uleb128 0x9
	.long	0x25
	.long	0x15c
	.uleb128 0xa
	.long	0x15c
	.byte	0x9
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF16
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF17
	.uleb128 0x9
	.long	0x25
	.long	0x17a
	.uleb128 0xa
	.long	0x15c
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.long	0x30
	.byte	0x6
	.byte	0x2
	.long	0x199
	.uleb128 0xc
	.long	.LASF18
	.byte	0
	.uleb128 0xc
	.long	.LASF19
	.byte	0x1
	.uleb128 0xc
	.long	.LASF20
	.byte	0x2
	.byte	0
	.uleb128 0x4
	.long	.LASF21
	.byte	0x18
	.byte	0x6
	.byte	0x1
	.long	0x207
	.uleb128 0x5
	.long	.LASF22
	.byte	0x6
	.byte	0x2
	.long	0x17a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"ref"
	.byte	0x6
	.byte	0x3
	.long	0x207
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF23
	.byte	0x6
	.byte	0x4
	.long	0xb1
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF24
	.byte	0x6
	.byte	0x5
	.long	0xb1
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x5
	.long	.LASF25
	.byte	0x6
	.byte	0x6
	.long	0x214
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"ip"
	.byte	0x6
	.byte	0x7
	.long	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.string	"off"
	.byte	0x6
	.byte	0x8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xe
	.long	.LASF25
	.byte	0x1
	.uleb128 0x7
	.byte	0x4
	.long	0x20e
	.uleb128 0x4
	.long	.LASF26
	.byte	0x50
	.byte	0x6
	.byte	0xd
	.long	0x2b3
	.uleb128 0x6
	.string	"dev"
	.byte	0x6
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF27
	.byte	0x6
	.byte	0xf
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ref"
	.byte	0x6
	.byte	0x10
	.long	0x207
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF28
	.byte	0x6
	.byte	0x11
	.long	0x207
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF22
	.byte	0x6
	.byte	0x13
	.long	0x163
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF29
	.byte	0x6
	.byte	0x14
	.long	0x163
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x5
	.long	.LASF30
	.byte	0x6
	.byte	0x15
	.long	0x163
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.long	.LASF31
	.byte	0x6
	.byte	0x16
	.long	0x163
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x5
	.long	.LASF32
	.byte	0x6
	.byte	0x17
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.long	.LASF33
	.byte	0x6
	.byte	0x18
	.long	0x16a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x21a
	.uleb128 0x4
	.long	.LASF34
	.byte	0x8
	.byte	0x6
	.byte	0x1f
	.long	0x2e2
	.uleb128 0x5
	.long	.LASF35
	.byte	0x6
	.byte	0x20
	.long	0x2fc
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF36
	.byte	0x6
	.byte	0x21
	.long	0x2fc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	0x207
	.long	0x2fc
	.uleb128 0x10
	.long	0x2b3
	.uleb128 0x10
	.long	0xab
	.uleb128 0x10
	.long	0x207
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x2e2
	.uleb128 0x4
	.long	.LASF37
	.byte	0x8
	.byte	0x7
	.byte	0x34
	.long	0x3e5
	.uleb128 0x11
	.long	.LASF38
	.byte	0x7
	.byte	0x35
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x11
	.long	.LASF39
	.byte	0x7
	.byte	0x36
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x11
	.long	.LASF40
	.byte	0x7
	.byte	0x37
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x11
	.long	.LASF22
	.byte	0x7
	.byte	0x38
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.string	"s"
	.byte	0x7
	.byte	0x39
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.string	"dpl"
	.byte	0x7
	.byte	0x3a
	.long	0x25
	.byte	0x4
	.byte	0x2
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.string	"p"
	.byte	0x7
	.byte	0x3b
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x11
	.long	.LASF41
	.byte	0x7
	.byte	0x3c
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.string	"avl"
	.byte	0x7
	.byte	0x3d
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x11
	.long	.LASF42
	.byte	0x7
	.byte	0x3e
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.string	"db"
	.byte	0x7
	.byte	0x3f
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x12
	.string	"g"
	.byte	0x7
	.byte	0x40
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x11
	.long	.LASF43
	.byte	0x7
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
	.long	.LASF44
	.byte	0x68
	.byte	0x7
	.byte	0x97
	.long	0x5f0
	.uleb128 0x5
	.long	.LASF45
	.byte	0x7
	.byte	0x98
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF46
	.byte	0x7
	.byte	0x99
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ss0"
	.byte	0x7
	.byte	0x9a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF47
	.byte	0x7
	.byte	0x9b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x5
	.long	.LASF48
	.byte	0x7
	.byte	0x9c
	.long	0x5f0
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"ss1"
	.byte	0x7
	.byte	0x9d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF49
	.byte	0x7
	.byte	0x9e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x5
	.long	.LASF50
	.byte	0x7
	.byte	0x9f
	.long	0x5f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"ss2"
	.byte	0x7
	.byte	0xa0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.long	.LASF51
	.byte	0x7
	.byte	0xa1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x6
	.string	"cr3"
	.byte	0x7
	.byte	0xa2
	.long	0x5f6
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.string	"eip"
	.byte	0x7
	.byte	0xa3
	.long	0x5f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.long	.LASF52
	.byte	0x7
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.string	"eax"
	.byte	0x7
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.string	"ecx"
	.byte	0x7
	.byte	0xa6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x6
	.string	"edx"
	.byte	0x7
	.byte	0xa7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x6
	.string	"ebx"
	.byte	0x7
	.byte	0xa8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x6
	.string	"esp"
	.byte	0x7
	.byte	0xa9
	.long	0x5f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x6
	.string	"ebp"
	.byte	0x7
	.byte	0xaa
	.long	0x5f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x6
	.string	"esi"
	.byte	0x7
	.byte	0xab
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x6
	.string	"edi"
	.byte	0x7
	.byte	0xac
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.string	"es"
	.byte	0x7
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x5
	.long	.LASF53
	.byte	0x7
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x6
	.string	"cs"
	.byte	0x7
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x5
	.long	.LASF54
	.byte	0x7
	.byte	0xb0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x6
	.string	"ss"
	.byte	0x7
	.byte	0xb1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x5
	.long	.LASF55
	.byte	0x7
	.byte	0xb2
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x6
	.string	"ds"
	.byte	0x7
	.byte	0xb3
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x5
	.long	.LASF56
	.byte	0x7
	.byte	0xb4
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x6
	.string	"fs"
	.byte	0x7
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x5
	.long	.LASF57
	.byte	0x7
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x6
	.string	"gs"
	.byte	0x7
	.byte	0xb7
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x5
	.long	.LASF58
	.byte	0x7
	.byte	0xb8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x6
	.string	"ldt"
	.byte	0x7
	.byte	0xb9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x5
	.long	.LASF59
	.byte	0x7
	.byte	0xba
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x6
	.string	"t"
	.byte	0x7
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x5
	.long	.LASF60
	.byte	0x7
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x25
	.uleb128 0x13
	.byte	0x4
	.uleb128 0x4
	.long	.LASF61
	.byte	0x14
	.byte	0x5
	.byte	0x2c
	.long	0x64b
	.uleb128 0x6
	.string	"edi"
	.byte	0x5
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"esi"
	.byte	0x5
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ebx"
	.byte	0x5
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"ebp"
	.byte	0x5
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"eip"
	.byte	0x5
	.byte	0x31
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x5f8
	.uleb128 0x9
	.long	0x302
	.long	0x661
	.uleb128 0xa
	.long	0x15c
	.byte	0x6
	.byte	0
	.uleb128 0x14
	.long	0x25
	.uleb128 0x4
	.long	.LASF15
	.byte	0x7c
	.byte	0x5
	.byte	0x37
	.long	0x727
	.uleb128 0x6
	.string	"sz"
	.byte	0x5
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF62
	.byte	0x5
	.byte	0x39
	.long	0x762
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF63
	.byte	0x5
	.byte	0x3a
	.long	0xab
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF64
	.byte	0x5
	.byte	0x3b
	.long	0x72d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"pid"
	.byte	0x5
	.byte	0x3c
	.long	0x207
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF65
	.byte	0x5
	.byte	0x3d
	.long	0x727
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"tf"
	.byte	0x5
	.byte	0x3e
	.long	0x8cd
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.long	.LASF61
	.byte	0x5
	.byte	0x3f
	.long	0x64b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.long	.LASF66
	.byte	0x5
	.byte	0x40
	.long	0x5f6
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.long	.LASF67
	.byte	0x5
	.byte	0x41
	.long	0x207
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.long	.LASF68
	.byte	0x5
	.byte	0x42
	.long	0x8d3
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.string	"cwd"
	.byte	0x5
	.byte	0x43
	.long	0x2b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x5
	.long	.LASF8
	.byte	0x5
	.byte	0x44
	.long	0x8e9
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x666
	.uleb128 0x15
	.long	.LASF119
	.byte	0x4
	.long	0x30
	.byte	0x5
	.byte	0x34
	.long	0x762
	.uleb128 0xc
	.long	.LASF69
	.byte	0
	.uleb128 0xc
	.long	.LASF70
	.byte	0x1
	.uleb128 0xc
	.long	.LASF71
	.byte	0x2
	.uleb128 0xc
	.long	.LASF72
	.byte	0x3
	.uleb128 0xc
	.long	.LASF73
	.byte	0x4
	.uleb128 0xc
	.long	.LASF74
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x5b
	.uleb128 0x4
	.long	.LASF75
	.byte	0x4c
	.byte	0x1
	.byte	0x9c
	.long	0x8cd
	.uleb128 0x6
	.string	"edi"
	.byte	0x1
	.byte	0x9e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"esi"
	.byte	0x1
	.byte	0x9f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ebp"
	.byte	0x1
	.byte	0xa0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF76
	.byte	0x1
	.byte	0xa1
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"ebx"
	.byte	0x1
	.byte	0xa2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.string	"edx"
	.byte	0x1
	.byte	0xa3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"ecx"
	.byte	0x1
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.string	"eax"
	.byte	0x1
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.string	"gs"
	.byte	0x1
	.byte	0xa8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.long	.LASF47
	.byte	0x1
	.byte	0xa9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x6
	.string	"fs"
	.byte	0x1
	.byte	0xaa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.long	.LASF49
	.byte	0x1
	.byte	0xab
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x6
	.string	"es"
	.byte	0x1
	.byte	0xac
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.long	.LASF51
	.byte	0x1
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x6
	.string	"ds"
	.byte	0x1
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x5
	.long	.LASF53
	.byte	0x1
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x5
	.long	.LASF77
	.byte	0x1
	.byte	0xb0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x6
	.string	"err"
	.byte	0x1
	.byte	0xb3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x6
	.string	"eip"
	.byte	0x1
	.byte	0xb4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x6
	.string	"cs"
	.byte	0x1
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x5
	.long	.LASF54
	.byte	0x1
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x5
	.long	.LASF52
	.byte	0x1
	.byte	0xb7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x6
	.string	"esp"
	.byte	0x1
	.byte	0xba
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.string	"ss"
	.byte	0x1
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x5
	.long	.LASF55
	.byte	0x1
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x768
	.uleb128 0x9
	.long	0x8e3
	.long	0x8e3
	.uleb128 0xa
	.long	0x15c
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x199
	.uleb128 0x9
	.long	0xb1
	.long	0x8f9
	.uleb128 0xa
	.long	0x15c
	.byte	0xf
	.byte	0
	.uleb128 0x16
	.byte	0x38
	.byte	0x2
	.byte	0x15
	.long	0x91e
	.uleb128 0x5
	.long	.LASF78
	.byte	0x2
	.byte	0x16
	.long	0x66
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF79
	.byte	0x2
	.byte	0x17
	.long	0x207
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x16
	.byte	0x8c
	.byte	0x2
	.byte	0xb4
	.long	0x95c
	.uleb128 0x6
	.string	"buf"
	.byte	0x2
	.byte	0xb5
	.long	0x95c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"r"
	.byte	0x2
	.byte	0xb6
	.long	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x6
	.string	"w"
	.byte	0x2
	.byte	0xb7
	.long	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0x84
	.uleb128 0x6
	.string	"e"
	.byte	0x2
	.byte	0xb8
	.long	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.byte	0
	.uleb128 0x9
	.long	0xb1
	.long	0x96c
	.uleb128 0xa
	.long	0x15c
	.byte	0x7f
	.byte	0
	.uleb128 0x17
	.string	"inb"
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.long	0x49
	.long	.LFB2
	.long	.LFE2
	.long	.LLST0
	.byte	0x1
	.long	0x9a5
	.uleb128 0x18
	.long	.LASF80
	.byte	0x1
	.byte	0x4
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.long	.LASF81
	.byte	0x1
	.byte	0x6
	.long	0x49
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x1a
	.long	.LASF82
	.byte	0x1
	.byte	0x16
	.byte	0x1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST1
	.byte	0x1
	.long	0x9db
	.uleb128 0x18
	.long	.LASF80
	.byte	0x1
	.byte	0x16
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.long	.LASF81
	.byte	0x1
	.byte	0x16
	.long	0x49
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x1b
	.string	"cli"
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.long	.LFB14
	.long	.LFE14
	.long	.LLST2
	.byte	0x1
	.uleb128 0x1a
	.long	.LASF83
	.byte	0x2
	.byte	0x1b
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST3
	.byte	0x1
	.long	0xa76
	.uleb128 0x1c
	.string	"xx"
	.byte	0x2
	.byte	0x1b
	.long	0x207
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.long	.LASF84
	.byte	0x2
	.byte	0x1b
	.long	0x207
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1d
	.long	.LASF85
	.byte	0x2
	.byte	0x1b
	.long	0x207
	.long	.LLST4
	.uleb128 0x19
	.long	.LASF86
	.byte	0x2
	.byte	0x1d
	.long	0xa76
	.byte	0x5
	.byte	0x3
	.long	digits.1604
	.uleb128 0x1e
	.string	"buf"
	.byte	0x2
	.byte	0x1e
	.long	0x8e9
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1f
	.string	"i"
	.byte	0x2
	.byte	0x1f
	.long	0x207
	.long	.LLST5
	.uleb128 0x1f
	.string	"x"
	.byte	0x2
	.byte	0x20
	.long	0x25
	.long	.LLST6
	.uleb128 0x20
	.long	.LVL16
	.long	0xc5f
	.byte	0
	.uleb128 0x9
	.long	0xb1
	.long	0xa86
	.uleb128 0xa
	.long	0x15c
	.byte	0x10
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF90
	.byte	0x2
	.byte	0x36
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST7
	.byte	0x1
	.long	0xb4e
	.uleb128 0x1c
	.string	"fmt"
	.byte	0x2
	.byte	0x36
	.long	0xab
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x22
	.uleb128 0x1e
	.string	"i"
	.byte	0x2
	.byte	0x38
	.long	0x207
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.string	"c"
	.byte	0x2
	.byte	0x38
	.long	0x207
	.long	.LLST8
	.uleb128 0x23
	.long	.LASF79
	.byte	0x2
	.byte	0x38
	.long	0x207
	.long	.LLST9
	.uleb128 0x23
	.long	.LASF87
	.byte	0x2
	.byte	0x39
	.long	0x5f0
	.long	.LLST10
	.uleb128 0x1f
	.string	"s"
	.byte	0x2
	.byte	0x3a
	.long	0xab
	.long	.LLST11
	.uleb128 0x20
	.long	.LVL20
	.long	0xf36
	.uleb128 0x20
	.long	.LVL21
	.long	0xb4e
	.uleb128 0x20
	.long	.LVL25
	.long	0xc5f
	.uleb128 0x20
	.long	.LVL32
	.long	0x9f0
	.uleb128 0x20
	.long	.LVL36
	.long	0x9f0
	.uleb128 0x20
	.long	.LVL43
	.long	0xc5f
	.uleb128 0x20
	.long	.LVL45
	.long	0xc5f
	.uleb128 0x20
	.long	.LVL47
	.long	0xc5f
	.uleb128 0x20
	.long	.LVL48
	.long	0xc5f
	.uleb128 0x20
	.long	.LVL51
	.long	0xf43
	.byte	0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF94
	.byte	0x2
	.byte	0x6a
	.byte	0x1
	.byte	0x1
	.long	.LFB22
	.long	.LFE22
	.long	.LLST12
	.byte	0x1
	.long	0xbc7
	.uleb128 0x25
	.string	"s"
	.byte	0x2
	.byte	0x6a
	.long	0xab
	.long	.LLST13
	.uleb128 0x1e
	.string	"i"
	.byte	0x2
	.byte	0x6c
	.long	0x207
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x1e
	.string	"pcs"
	.byte	0x2
	.byte	0x6d
	.long	0x14c
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x20
	.long	.LVL53
	.long	0x9db
	.uleb128 0x20
	.long	.LVL54
	.long	0xa86
	.uleb128 0x20
	.long	.LVL55
	.long	0xa86
	.uleb128 0x20
	.long	.LVL56
	.long	0xa86
	.uleb128 0x20
	.long	.LVL58
	.long	0xf50
	.uleb128 0x20
	.long	.LVL60
	.long	0xa86
	.byte	0
	.uleb128 0x1a
	.long	.LASF88
	.byte	0x2
	.byte	0x82
	.byte	0x1
	.long	.LFB23
	.long	.LFE23
	.long	.LLST14
	.byte	0x1
	.long	0xc5f
	.uleb128 0x1c
	.string	"c"
	.byte	0x2
	.byte	0x82
	.long	0x207
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.string	"pos"
	.byte	0x2
	.byte	0x84
	.long	0x207
	.long	.LLST15
	.uleb128 0x20
	.long	.LVL62
	.long	0x9a5
	.uleb128 0x20
	.long	.LVL63
	.long	0x96c
	.uleb128 0x20
	.long	.LVL65
	.long	0x9a5
	.uleb128 0x20
	.long	.LVL66
	.long	0x96c
	.uleb128 0x20
	.long	.LVL71
	.long	0xb4e
	.uleb128 0x20
	.long	.LVL72
	.long	0xf5d
	.uleb128 0x20
	.long	.LVL73
	.long	0xf6a
	.uleb128 0x20
	.long	.LVL74
	.long	0x9a5
	.uleb128 0x20
	.long	.LVL75
	.long	0x9a5
	.uleb128 0x20
	.long	.LVL76
	.long	0x9a5
	.uleb128 0x20
	.long	.LVL77
	.long	0x9a5
	.byte	0
	.uleb128 0x1a
	.long	.LASF89
	.byte	0x2
	.byte	0xa4
	.byte	0x1
	.long	.LFB24
	.long	.LFE24
	.long	.LLST16
	.byte	0x1
	.long	0xcbb
	.uleb128 0x1c
	.string	"c"
	.byte	0x2
	.byte	0xa4
	.long	0x207
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.long	.LVL79
	.long	0x9db
	.uleb128 0x20
	.long	.LVL80
	.long	0xf77
	.uleb128 0x20
	.long	.LVL81
	.long	0xf77
	.uleb128 0x20
	.long	.LVL82
	.long	0xf77
	.uleb128 0x20
	.long	.LVL83
	.long	0xf77
	.uleb128 0x20
	.long	.LVL84
	.long	0xbc7
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF91
	.byte	0x2
	.byte	0xbe
	.byte	0x1
	.long	.LFB25
	.long	.LFE25
	.long	.LLST17
	.byte	0x1
	.long	0xd47
	.uleb128 0x18
	.long	.LASF92
	.byte	0x2
	.byte	0xbe
	.long	0xd4d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1f
	.string	"c"
	.byte	0x2
	.byte	0xc0
	.long	0x207
	.long	.LLST18
	.uleb128 0x19
	.long	.LASF93
	.byte	0x2
	.byte	0xc0
	.long	0x207
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.long	.LVL87
	.long	0xf36
	.uleb128 0x20
	.long	.LVL90
	.long	0xc5f
	.uleb128 0x20
	.long	.LVL91
	.long	0xc5f
	.uleb128 0x20
	.long	.LVL94
	.long	0xc5f
	.uleb128 0x20
	.long	.LVL95
	.long	0xf84
	.uleb128 0x26
	.long	.LVL97
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x20
	.long	.LVL99
	.long	0xf43
	.uleb128 0x20
	.long	.LVL100
	.long	0xf91
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	0x207
	.uleb128 0x7
	.byte	0x4
	.long	0xd47
	.uleb128 0x28
	.byte	0x1
	.long	.LASF95
	.byte	0x2
	.byte	0xe9
	.byte	0x1
	.long	0x207
	.long	.LFB26
	.long	.LFE26
	.long	.LLST19
	.byte	0x1
	.long	0xdf5
	.uleb128 0x1c
	.string	"ip"
	.byte	0x2
	.byte	0xe9
	.long	0x2b3
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x25
	.string	"dst"
	.byte	0x2
	.byte	0xe9
	.long	0xab
	.long	.LLST20
	.uleb128 0x1c
	.string	"n"
	.byte	0x2
	.byte	0xe9
	.long	0x207
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x23
	.long	.LASF96
	.byte	0x2
	.byte	0xeb
	.long	0x25
	.long	.LLST21
	.uleb128 0x1f
	.string	"c"
	.byte	0x2
	.byte	0xec
	.long	0x207
	.long	.LLST22
	.uleb128 0x20
	.long	.LVL102
	.long	0xf9e
	.uleb128 0x20
	.long	.LVL104
	.long	0xf36
	.uleb128 0x20
	.long	.LVL105
	.long	0xf43
	.uleb128 0x20
	.long	.LVL106
	.long	0xfab
	.uleb128 0x20
	.long	.LVL107
	.long	0xfb8
	.uleb128 0x20
	.long	.LVL117
	.long	0xf43
	.uleb128 0x20
	.long	.LVL118
	.long	0xfab
	.byte	0
	.uleb128 0x29
	.byte	0x1
	.long	.LASF97
	.byte	0x2
	.value	0x10f
	.byte	0x1
	.long	0x207
	.long	.LFB27
	.long	.LFE27
	.long	.LLST23
	.byte	0x1
	.long	0xe7a
	.uleb128 0x2a
	.string	"ip"
	.byte	0x2
	.value	0x10f
	.long	0x2b3
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2a
	.string	"buf"
	.byte	0x2
	.value	0x10f
	.long	0xab
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2a
	.string	"n"
	.byte	0x2
	.value	0x10f
	.long	0x207
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2b
	.string	"i"
	.byte	0x2
	.value	0x111
	.long	0x207
	.long	.LLST24
	.uleb128 0x20
	.long	.LVL120
	.long	0xf9e
	.uleb128 0x20
	.long	.LVL121
	.long	0xf36
	.uleb128 0x20
	.long	.LVL125
	.long	0xc5f
	.uleb128 0x20
	.long	.LVL126
	.long	0xf43
	.uleb128 0x20
	.long	.LVL127
	.long	0xfab
	.byte	0
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF98
	.byte	0x2
	.value	0x11e
	.byte	0x1
	.long	.LFB28
	.long	.LFE28
	.long	.LLST25
	.byte	0x1
	.long	0xeb1
	.uleb128 0x20
	.long	.LVL128
	.long	0xfc5
	.uleb128 0x20
	.long	.LVL129
	.long	0xfd2
	.uleb128 0x20
	.long	.LVL130
	.long	0xfdf
	.byte	0
	.uleb128 0x19
	.long	.LASF99
	.byte	0x2
	.byte	0x13
	.long	0x207
	.byte	0x5
	.byte	0x3
	.long	panicked
	.uleb128 0x19
	.long	.LASF100
	.byte	0x2
	.byte	0x18
	.long	0x8f9
	.byte	0x5
	.byte	0x3
	.long	cons
	.uleb128 0x1e
	.string	"crt"
	.byte	0x2
	.byte	0x7f
	.long	0xee4
	.byte	0x5
	.byte	0x3
	.long	crt
	.uleb128 0x7
	.byte	0x4
	.long	0x37
	.uleb128 0x9
	.long	0x2b9
	.long	0xef5
	.uleb128 0x2d
	.byte	0
	.uleb128 0x2e
	.long	.LASF34
	.byte	0x6
	.byte	0x24
	.long	0xeea
	.byte	0x1
	.byte	0x1
	.uleb128 0x2f
	.string	"cpu"
	.byte	0x5
	.byte	0x1e
	.long	.LASF120
	.long	0x146
	.byte	0x1
	.byte	0x1
	.uleb128 0x30
	.long	.LASF15
	.byte	0x5
	.byte	0x1f
	.long	.LASF121
	.long	0x727
	.byte	0x1
	.byte	0x1
	.uleb128 0x31
	.long	.LASF101
	.byte	0x2
	.byte	0xb9
	.long	0x91e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	input
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF102
	.long	.LASF102
	.byte	0x8
	.byte	0x7e
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF103
	.long	.LASF103
	.byte	0x8
	.byte	0x82
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF104
	.long	.LASF104
	.byte	0x8
	.byte	0x7f
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF105
	.long	.LASF105
	.byte	0x8
	.byte	0x88
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF106
	.long	.LASF106
	.byte	0x8
	.byte	0x89
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF107
	.long	.LASF107
	.byte	0x8
	.byte	0xa3
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF108
	.long	.LASF108
	.byte	0x8
	.byte	0x77
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF109
	.long	.LASF109
	.byte	0x8
	.byte	0x71
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF110
	.long	.LASF110
	.byte	0x8
	.byte	0x2d
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF111
	.long	.LASF111
	.byte	0x8
	.byte	0x2b
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF112
	.long	.LASF112
	.byte	0x8
	.byte	0x74
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF113
	.long	.LASF113
	.byte	0x8
	.byte	0x81
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF114
	.long	.LASF114
	.byte	0x8
	.byte	0x60
	.uleb128 0x32
	.byte	0x1
	.byte	0x1
	.long	.LASF115
	.long	.LASF115
	.byte	0x8
	.byte	0x3d
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0x19
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
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2113
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.long	.LFB4-.Ltext0
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
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB14-.Ltext0
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
	.long	.LFE14-.Ltext0
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
.LLST4:
	.long	.LVL3-.Ltext0
	.long	.LVL4-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 8
	.long	.LVL4-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL5-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 8
	.long	0
	.long	0
.LLST5:
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL10-.Ltext0
	.long	.LVL11-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL11-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL15-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST6:
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL8-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL12-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL13-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST7:
	.long	.LFB21-.Ltext0
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
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST8:
	.long	.LVL24-.Ltext0
	.long	.LVL25-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL25-1-.Ltext0
	.long	.LVL26-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL26-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL29-.Ltext0
	.long	.LVL30-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL30-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL33-.Ltext0
	.long	.LVL34-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL34-.Ltext0
	.long	.LVL37-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL37-.Ltext0
	.long	.LVL38-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL38-.Ltext0
	.long	.LVL44-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL44-.Ltext0
	.long	.LVL45-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL45-1-.Ltext0
	.long	.LVL46-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL46-.Ltext0
	.long	.LVL47-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL47-1-.Ltext0
	.long	.LVL49-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL50-.Ltext0
	.long	.LVL51-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL51-1-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST9:
	.long	.LVL19-.Ltext0
	.long	.LVL20-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL20-1-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST10:
	.long	.LVL22-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL24-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL31-.Ltext0
	.long	.LVL32-1-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL32-1-.Ltext0
	.long	.LVL35-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL35-.Ltext0
	.long	.LVL36-1-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL36-1-.Ltext0
	.long	.LVL39-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL39-.Ltext0
	.long	.LVL42-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL42-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST11:
	.long	.LVL40-.Ltext0
	.long	.LVL41-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL41-.Ltext0
	.long	.LVL44-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST12:
	.long	.LFB22-.Ltext0
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
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST13:
	.long	.LVL52-.Ltext0
	.long	.LVL57-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL57-.Ltext0
	.long	.LVL58-1-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.long	.LVL58-1-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST14:
	.long	.LFB23-.Ltext0
	.long	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI17-.Ltext0
	.long	.LCFI18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI18-.Ltext0
	.long	.LCFI19-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI19-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST15:
	.long	.LVL64-.Ltext0
	.long	.LVL65-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL65-1-.Ltext0
	.long	.LVL69-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL69-.Ltext0
	.long	.LVL70-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL70-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST16:
	.long	.LFB24-.Ltext0
	.long	.LCFI20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI20-.Ltext0
	.long	.LCFI21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI21-.Ltext0
	.long	.LCFI22-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI22-.Ltext0
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST17:
	.long	.LFB25-.Ltext0
	.long	.LCFI23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI23-.Ltext0
	.long	.LCFI24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI24-.Ltext0
	.long	.LCFI25-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI25-.Ltext0
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST18:
	.long	.LVL88-.Ltext0
	.long	.LVL89-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL89-.Ltext0
	.long	.LVL92-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL92-.Ltext0
	.long	.LVL93-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL93-.Ltext0
	.long	.LVL96-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL98-.Ltext0
	.long	.LVL99-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL99-1-.Ltext0
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST19:
	.long	.LFB26-.Ltext0
	.long	.LCFI26-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI26-.Ltext0
	.long	.LCFI27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI27-.Ltext0
	.long	.LCFI28-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI28-.Ltext0
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST20:
	.long	.LVL101-.Ltext0
	.long	.LVL112-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	.LVL112-.Ltext0
	.long	.LVL113-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL113-.Ltext0
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	0
	.long	0
.LLST21:
	.long	.LVL103-.Ltext0
	.long	.LVL104-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL104-1-.Ltext0
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST22:
	.long	.LVL108-.Ltext0
	.long	.LVL109-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL109-.Ltext0
	.long	.LVL110-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL110-.Ltext0
	.long	.LVL111-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL111-.Ltext0
	.long	.LVL114-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL115-.Ltext0
	.long	.LVL116-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST23:
	.long	.LFB27-.Ltext0
	.long	.LCFI29-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI29-.Ltext0
	.long	.LCFI30-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI30-.Ltext0
	.long	.LCFI31-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI31-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST24:
	.long	.LVL122-.Ltext0
	.long	.LVL123-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL123-.Ltext0
	.long	.LVL124-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL124-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST25:
	.long	.LFB28-.Ltext0
	.long	.LCFI32-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI32-.Ltext0
	.long	.LCFI33-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI33-.Ltext0
	.long	.LCFI34-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI34-.Ltext0
	.long	.LFE28-.Ltext0
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
.LASF70:
	.string	"EMBRYO"
.LASF11:
	.string	"scheduler"
.LASF104:
	.string	"getcallerpcs"
.LASF98:
	.string	"consoleinit"
.LASF42:
	.string	"rsv1"
.LASF22:
	.string	"type"
.LASF38:
	.string	"lim_15_0"
.LASF12:
	.string	"started"
.LASF48:
	.string	"esp1"
.LASF50:
	.string	"esp2"
.LASF25:
	.string	"pipe"
.LASF81:
	.string	"data"
.LASF71:
	.string	"SLEEPING"
.LASF103:
	.string	"release"
.LASF10:
	.string	"spinlock"
.LASF65:
	.string	"parent"
.LASF64:
	.string	"state"
.LASF97:
	.string	"consolewrite"
.LASF100:
	.string	"cons"
.LASF34:
	.string	"devsw"
.LASF119:
	.string	"procstate"
.LASF18:
	.string	"FD_NONE"
.LASF20:
	.string	"FD_INODE"
.LASF43:
	.string	"base_31_24"
.LASF45:
	.string	"link"
.LASF120:
	.string	"%gs:0"
.LASF94:
	.string	"panic"
.LASF121:
	.string	"%gs:4"
.LASF6:
	.string	"pde_t"
.LASF80:
	.string	"port"
.LASF2:
	.string	"unsigned int"
.LASF108:
	.string	"wakeup"
.LASF92:
	.string	"getc"
.LASF15:
	.string	"proc"
.LASF30:
	.string	"minor"
.LASF76:
	.string	"oesp"
.LASF19:
	.string	"FD_PIPE"
.LASF102:
	.string	"acquire"
.LASF115:
	.string	"ioapicenable"
.LASF8:
	.string	"name"
.LASF23:
	.string	"readable"
.LASF72:
	.string	"RUNNABLE"
.LASF60:
	.string	"iomb"
.LASF32:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF112:
	.string	"sleep"
.LASF46:
	.string	"esp0"
.LASF31:
	.string	"nlink"
.LASF68:
	.string	"ofile"
.LASF118:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF39:
	.string	"base_15_0"
.LASF96:
	.string	"target"
.LASF62:
	.string	"pgdir"
.LASF69:
	.string	"UNUSED"
.LASF47:
	.string	"padding1"
.LASF36:
	.string	"write"
.LASF53:
	.string	"padding4"
.LASF54:
	.string	"padding5"
.LASF55:
	.string	"padding6"
.LASF56:
	.string	"padding7"
.LASF57:
	.string	"padding8"
.LASF58:
	.string	"padding9"
.LASF75:
	.string	"trapframe"
.LASF16:
	.string	"sizetype"
.LASF77:
	.string	"trapno"
.LASF74:
	.string	"ZOMBIE"
.LASF1:
	.string	"ushort"
.LASF110:
	.string	"iunlock"
.LASF52:
	.string	"eflags"
.LASF7:
	.string	"locked"
.LASF33:
	.string	"addrs"
.LASF82:
	.string	"outb"
.LASF44:
	.string	"taskstate"
.LASF4:
	.string	"uchar"
.LASF95:
	.string	"consoleread"
.LASF93:
	.string	"doprocdump"
.LASF90:
	.string	"cprintf"
.LASF0:
	.string	"uint"
.LASF26:
	.string	"inode"
.LASF49:
	.string	"padding2"
.LASF63:
	.string	"kstack"
.LASF51:
	.string	"padding3"
.LASF84:
	.string	"base"
.LASF113:
	.string	"initlock"
.LASF114:
	.string	"picenable"
.LASF27:
	.string	"inum"
.LASF41:
	.string	"lim_19_16"
.LASF5:
	.string	"unsigned char"
.LASF109:
	.string	"procdump"
.LASF17:
	.string	"short int"
.LASF21:
	.string	"file"
.LASF14:
	.string	"intena"
.LASF40:
	.string	"base_23_16"
.LASF73:
	.string	"RUNNING"
.LASF107:
	.string	"uartputc"
.LASF101:
	.string	"input"
.LASF111:
	.string	"ilock"
.LASF99:
	.string	"panicked"
.LASF66:
	.string	"chan"
.LASF88:
	.string	"cgaputc"
.LASF9:
	.string	"char"
.LASF83:
	.string	"printint"
.LASF91:
	.string	"consoleintr"
.LASF24:
	.string	"writable"
.LASF86:
	.string	"digits"
.LASF61:
	.string	"context"
.LASF117:
	.string	"console.c"
.LASF79:
	.string	"locking"
.LASF116:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF59:
	.string	"padding10"
.LASF106:
	.string	"memset"
.LASF13:
	.string	"ncli"
.LASF105:
	.string	"memmove"
.LASF85:
	.string	"sign"
.LASF37:
	.string	"segdesc"
.LASF28:
	.string	"flags"
.LASF35:
	.string	"read"
.LASF89:
	.string	"consputc"
.LASF29:
	.string	"major"
.LASF67:
	.string	"killed"
.LASF87:
	.string	"argp"
.LASF78:
	.string	"lock"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
