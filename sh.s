	.file	"sh.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"runcmd"
.LC1:
	.string	"exec %s failed\n"
.LC2:
	.string	"open %s failed\n"
.LC3:
	.string	"pipe"
	.text
	.globl	runcmd
	.type	runcmd, @function
runcmd:
.LFB0:
	.file 1 "sh.c"
	.loc 1 59 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 67 0
	cmpl	$0, 8(%ebp)
	jne	.L2
	.loc 1 68 0
	call	exit
.LVL1:
.L2:
	.loc 1 70 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	ja	.L3
	movl	.L5(,%eax,4), %eax
	jmp	*%eax
	.section	.rodata
	.align 4
	.align 4
.L5:
	.long	.L3
	.long	.L4
	.long	.L6
	.long	.L7
	.long	.L8
	.long	.L9
	.text
.L3:
	.loc 1 72 0
	subl	$12, %esp
	pushl	$.LC0
	call	panic
.LVL2:
	addl	$16, %esp
.L4:
	.loc 1 75 0
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
.LVL3:
	.loc 1 76 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
.LVL4:
	testl	%eax, %eax
	jne	.L10
	.loc 1 77 0
	call	exit
.LVL5:
.L10:
	.loc 1 78 0
	movl	-12(%ebp), %eax
	leal	4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	exec
.LVL6:
	addl	$16, %esp
	.loc 1 79 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC1
	pushl	$2
	call	printf
.LVL7:
	addl	$16, %esp
	.loc 1 80 0
	jmp	.L11
.LVL8:
.L6:
	.loc 1 83 0
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
.LVL9:
	.loc 1 84 0
	movl	-16(%ebp), %eax
	movl	20(%eax), %eax
.LVL10:
	subl	$12, %esp
	pushl	%eax
	call	close
.LVL11:
	addl	$16, %esp
	.loc 1 85 0
	movl	-16(%ebp), %eax
	movl	16(%eax), %edx
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	open
.LVL12:
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L12
	.loc 1 86 0
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC2
	pushl	$2
	call	printf
.LVL13:
	addl	$16, %esp
	.loc 1 87 0
	call	exit
.LVL14:
.L12:
	.loc 1 89 0
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	runcmd
.LVL15:
	addl	$16, %esp
	.loc 1 90 0
	jmp	.L11
.LVL16:
.L8:
	.loc 1 93 0
	movl	8(%ebp), %eax
	movl	%eax, -20(%ebp)
.LVL17:
	.loc 1 94 0
	call	fork1
.LVL18:
	testl	%eax, %eax
	jne	.L13
	.loc 1 95 0
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	runcmd
.LVL19:
	addl	$16, %esp
.L13:
	.loc 1 96 0
	call	wait
.LVL20:
	.loc 1 97 0
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	runcmd
.LVL21:
	addl	$16, %esp
	.loc 1 98 0
	jmp	.L11
.LVL22:
.L7:
	.loc 1 101 0
	movl	8(%ebp), %eax
	movl	%eax, -24(%ebp)
.LVL23:
	.loc 1 102 0
	subl	$12, %esp
	leal	-36(%ebp), %eax
.LVL24:
	pushl	%eax
	call	pipe
.LVL25:
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L14
	.loc 1 103 0
	subl	$12, %esp
	pushl	$.LC3
	call	panic
.LVL26:
	addl	$16, %esp
.L14:
	.loc 1 104 0
	call	fork1
.LVL27:
	testl	%eax, %eax
	jne	.L15
	.loc 1 105 0
	subl	$12, %esp
	pushl	$1
	call	close
.LVL28:
	addl	$16, %esp
	.loc 1 106 0
	movl	-32(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	dup
.LVL29:
	addl	$16, %esp
	.loc 1 107 0
	movl	-36(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	close
.LVL30:
	addl	$16, %esp
	.loc 1 108 0
	movl	-32(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	close
.LVL31:
	addl	$16, %esp
	.loc 1 109 0
	movl	-24(%ebp), %eax
	movl	4(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	runcmd
.LVL32:
	addl	$16, %esp
.L15:
	.loc 1 111 0
	call	fork1
.LVL33:
	testl	%eax, %eax
	jne	.L16
	.loc 1 112 0
	subl	$12, %esp
	pushl	$0
	call	close
.LVL34:
	addl	$16, %esp
	.loc 1 113 0
	movl	-36(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	dup
.LVL35:
	addl	$16, %esp
	.loc 1 114 0
	movl	-36(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	close
.LVL36:
	addl	$16, %esp
	.loc 1 115 0
	movl	-32(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	close
.LVL37:
	addl	$16, %esp
	.loc 1 116 0
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	runcmd
.LVL38:
	addl	$16, %esp
.L16:
	.loc 1 118 0
	movl	-36(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	close
.LVL39:
	addl	$16, %esp
	.loc 1 119 0
	movl	-32(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	close
.LVL40:
	addl	$16, %esp
	.loc 1 120 0
	call	wait
.LVL41:
	.loc 1 121 0
	call	wait
.LVL42:
	.loc 1 122 0
	jmp	.L11
.LVL43:
.L9:
	.loc 1 125 0
	movl	8(%ebp), %eax
	movl	%eax, -28(%ebp)
.LVL44:
	.loc 1 126 0
	call	fork1
.LVL45:
	testl	%eax, %eax
	jne	.L18
	.loc 1 127 0
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	runcmd
.LVL46:
	addl	$16, %esp
.L18:
	.loc 1 128 0
	nop
.LVL47:
.L11:
	.loc 1 130 0
	call	exit
.LVL48:
	.cfi_endproc
.LFE0:
	.size	runcmd, .-runcmd
	.section	.rodata
.LC4:
	.string	"$ "
	.text
	.globl	getcmd
	.type	getcmd, @function
getcmd:
.LFB1:
	.loc 1 135 0
	.cfi_startproc
.LVL49:
	pushl	%ebp
.LCFI2:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI3:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 136 0
	subl	$8, %esp
	pushl	$.LC4
	pushl	$2
	call	printf
.LVL50:
	addl	$16, %esp
	.loc 1 137 0
	movl	12(%ebp), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$0
	pushl	8(%ebp)
	call	memset
.LVL51:
	addl	$16, %esp
	.loc 1 138 0
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	gets
.LVL52:
	addl	$16, %esp
	.loc 1 139 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L20
	.loc 1 140 0
	movl	$-1, %eax
	jmp	.L21
.L20:
	.loc 1 141 0
	movl	$0, %eax
.L21:
	.loc 1 142 0
	leave
.LCFI4:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	getcmd, .-getcmd
	.section	.rodata
.LC5:
	.string	"console"
.LC6:
	.string	"cannot cd %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.loc 1 146 0
	.cfi_startproc
	leal	4(%esp), %ecx
.LCFI5:
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
.LCFI6:
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$20, %esp
	.loc 1 151 0
	jmp	.L23
.LVL53:
.L25:
	.loc 1 152 0
	cmpl	$2, -12(%ebp)
	jle	.L23
	.loc 1 153 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	close
.LVL54:
	addl	$16, %esp
	.loc 1 154 0
	jmp	.L24
.L23:
	.loc 1 151 0
	subl	$8, %esp
	pushl	$2
	pushl	$.LC5
	call	open
.LVL55:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL56:
	cmpl	$0, -12(%ebp)
	jns	.L25
.LVL57:
.L24:
	.loc 1 159 0
	jmp	.L26
.L30:
	.loc 1 160 0
	movzbl	buf.1351, %eax
	cmpb	$99, %al
	jne	.L27
	.loc 1 160 0 is_stmt 0 discriminator 1
	movzbl	buf.1351+1, %eax
	cmpb	$100, %al
	jne	.L27
	.loc 1 160 0 discriminator 2
	movzbl	buf.1351+2, %eax
	cmpb	$32, %al
	jne	.L27
	.loc 1 163 0 is_stmt 1
	subl	$12, %esp
	pushl	$buf.1351
	call	strlen
.LVL58:
	addl	$16, %esp
	subl	$1, %eax
	movb	$0, buf.1351(%eax)
	.loc 1 164 0
	movl	$buf.1351+3, %eax
	subl	$12, %esp
	pushl	%eax
	call	chdir
.LVL59:
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L26
	.loc 1 165 0
	movl	$buf.1351+3, %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC6
	pushl	$2
	call	printf
.LVL60:
	addl	$16, %esp
	.loc 1 166 0
	jmp	.L26
.L27:
	.loc 1 168 0
	call	fork1
.LVL61:
	testl	%eax, %eax
	jne	.L29
	.loc 1 169 0
	subl	$12, %esp
	pushl	$buf.1351
	call	parsecmd
.LVL62:
	addl	$16, %esp
	subl	$12, %esp
	pushl	%eax
	call	runcmd
.LVL63:
	addl	$16, %esp
.L29:
	.loc 1 170 0
	call	wait
.LVL64:
.L26:
	.loc 1 159 0
	subl	$8, %esp
	pushl	$100
	pushl	$buf.1351
	call	getcmd
.LVL65:
	addl	$16, %esp
	testl	%eax, %eax
	jns	.L30
	.loc 1 172 0
	call	exit
.LVL66:
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
.LC7:
	.string	"%s\n"
	.text
	.globl	panic
	.type	panic, @function
panic:
.LFB3:
	.loc 1 177 0
	.cfi_startproc
.LVL67:
	pushl	%ebp
.LCFI7:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI8:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 178 0
	subl	$4, %esp
	pushl	8(%ebp)
	pushl	$.LC7
	pushl	$2
	call	printf
.LVL68:
	addl	$16, %esp
	.loc 1 179 0
	call	exit
.LVL69:
	.cfi_endproc
.LFE3:
	.size	panic, .-panic
	.section	.rodata
.LC8:
	.string	"fork"
	.text
	.globl	fork1
	.type	fork1, @function
fork1:
.LFB4:
	.loc 1 184 0
	.cfi_startproc
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 187 0
	call	fork
.LVL70:
	movl	%eax, -12(%ebp)
.LVL71:
	.loc 1 188 0
	cmpl	$-1, -12(%ebp)
	jne	.L33
	.loc 1 189 0
	subl	$12, %esp
	pushl	$.LC8
	call	panic
.LVL72:
	addl	$16, %esp
.L33:
	.loc 1 190 0
	movl	-12(%ebp), %eax
	.loc 1 191 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL73:
	ret
	.cfi_endproc
.LFE4:
	.size	fork1, .-fork1
	.globl	execcmd
	.type	execcmd, @function
execcmd:
.LFB5:
	.loc 1 198 0
	.cfi_startproc
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 201 0
	subl	$12, %esp
	pushl	$84
	call	malloc
.LVL74:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL75:
	.loc 1 202 0
	subl	$4, %esp
	pushl	$84
	pushl	$0
	pushl	-12(%ebp)
	call	memset
.LVL76:
	addl	$16, %esp
	.loc 1 203 0
	movl	-12(%ebp), %eax
	movl	$1, (%eax)
	.loc 1 204 0
	movl	-12(%ebp), %eax
	.loc 1 205 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL77:
	ret
	.cfi_endproc
.LFE5:
	.size	execcmd, .-execcmd
	.globl	redircmd
	.type	redircmd, @function
redircmd:
.LFB6:
	.loc 1 209 0
	.cfi_startproc
.LVL78:
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 212 0
	subl	$12, %esp
	pushl	$24
	call	malloc
.LVL79:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL80:
	.loc 1 213 0
	subl	$4, %esp
	pushl	$24
	pushl	$0
	pushl	-12(%ebp)
	call	memset
.LVL81:
	addl	$16, %esp
	.loc 1 214 0
	movl	-12(%ebp), %eax
	movl	$2, (%eax)
	.loc 1 215 0
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%eax)
	.loc 1 216 0
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	.loc 1 217 0
	movl	-12(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 12(%eax)
	.loc 1 218 0
	movl	-12(%ebp), %eax
	movl	20(%ebp), %edx
	movl	%edx, 16(%eax)
	.loc 1 219 0
	movl	-12(%ebp), %eax
	movl	24(%ebp), %edx
	movl	%edx, 20(%eax)
	.loc 1 220 0
	movl	-12(%ebp), %eax
	.loc 1 221 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	redircmd, .-redircmd
	.globl	pipecmd
	.type	pipecmd, @function
pipecmd:
.LFB7:
	.loc 1 225 0
	.cfi_startproc
.LVL82:
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 228 0
	subl	$12, %esp
	pushl	$12
	call	malloc
.LVL83:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL84:
	.loc 1 229 0
	subl	$4, %esp
	pushl	$12
	pushl	$0
	pushl	-12(%ebp)
	call	memset
.LVL85:
	addl	$16, %esp
	.loc 1 230 0
	movl	-12(%ebp), %eax
	movl	$3, (%eax)
	.loc 1 231 0
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%eax)
	.loc 1 232 0
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	.loc 1 233 0
	movl	-12(%ebp), %eax
	.loc 1 234 0
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	pipecmd, .-pipecmd
	.globl	listcmd
	.type	listcmd, @function
listcmd:
.LFB8:
	.loc 1 238 0
	.cfi_startproc
.LVL86:
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 241 0
	subl	$12, %esp
	pushl	$12
	call	malloc
.LVL87:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL88:
	.loc 1 242 0
	subl	$4, %esp
	pushl	$12
	pushl	$0
	pushl	-12(%ebp)
	call	memset
.LVL89:
	addl	$16, %esp
	.loc 1 243 0
	movl	-12(%ebp), %eax
	movl	$4, (%eax)
	.loc 1 244 0
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%eax)
	.loc 1 245 0
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	.loc 1 246 0
	movl	-12(%ebp), %eax
	.loc 1 247 0
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	listcmd, .-listcmd
	.globl	backcmd
	.type	backcmd, @function
backcmd:
.LFB9:
	.loc 1 251 0
	.cfi_startproc
.LVL90:
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 254 0
	subl	$12, %esp
	pushl	$8
	call	malloc
.LVL91:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL92:
	.loc 1 255 0
	subl	$4, %esp
	pushl	$8
	pushl	$0
	pushl	-12(%ebp)
	call	memset
.LVL93:
	addl	$16, %esp
	.loc 1 256 0
	movl	-12(%ebp), %eax
	movl	$5, (%eax)
	.loc 1 257 0
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%eax)
	.loc 1 258 0
	movl	-12(%ebp), %eax
	.loc 1 259 0
	leave
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	backcmd, .-backcmd
	.globl	whitespace
	.data
	.align 4
	.type	whitespace, @object
	.size	whitespace, 6
whitespace:
	.string	" \t\r\n\013"
	.globl	symbols
	.align 4
	.type	symbols, @object
	.size	symbols, 8
symbols:
	.string	"<|>&;()"
	.text
	.globl	gettoken
	.type	gettoken, @function
gettoken:
.LFB10:
	.loc 1 268 0
	.cfi_startproc
.LVL94:
	pushl	%ebp
.LCFI27:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI28:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 272 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL95:
	.loc 1 273 0
	jmp	.L46
.LVL96:
.L48:
	.loc 1 274 0
	addl	$1, -12(%ebp)
.L46:
	.loc 1 273 0
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jnb	.L47
	.loc 1 273 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$whitespace
	call	strchr
.LVL97:
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L48
.L47:
	.loc 1 275 0 is_stmt 1
	cmpl	$0, 16(%ebp)
	je	.L49
	.loc 1 276 0
	movl	16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
.L49:
	.loc 1 277 0
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, -16(%ebp)
.LVL98:
	.loc 1 278 0
	movl	-12(%ebp), %eax
.LVL99:
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	cmpl	$41, %eax
	jg	.L51
	cmpl	$40, %eax
	jge	.L52
	testl	%eax, %eax
	je	.L66
	cmpl	$38, %eax
	je	.L52
	jmp	.L50
.L51:
	cmpl	$62, %eax
	je	.L54
	cmpl	$62, %eax
	jg	.L55
	subl	$59, %eax
	cmpl	$1, %eax
	ja	.L50
	jmp	.L52
.LVL100:
.L55:
	cmpl	$124, %eax
	jne	.L50
.LVL101:
.L52:
	.loc 1 287 0
	addl	$1, -12(%ebp)
	.loc 1 288 0
	jmp	.L56
.LVL102:
.L54:
	.loc 1 290 0
	addl	$1, -12(%ebp)
	.loc 1 291 0
	movl	-12(%ebp), %eax
.LVL103:
	movzbl	(%eax), %eax
	cmpb	$62, %al
	jne	.L67
	.loc 1 292 0
	movl	$43, -16(%ebp)
.LVL104:
	.loc 1 293 0
	addl	$1, -12(%ebp)
.LVL105:
	.loc 1 295 0
	jmp	.L67
.L50:
	.loc 1 297 0
	movl	$97, -16(%ebp)
.LVL106:
	.loc 1 298 0
	jmp	.L58
.L60:
	.loc 1 299 0
	addl	$1, -12(%ebp)
.L58:
	.loc 1 298 0
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jnb	.L68
	.loc 1 298 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$whitespace
	call	strchr
.LVL107:
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L68
	.loc 1 298 0 discriminator 2
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$symbols
	call	strchr
.LVL108:
	addl	$16, %esp
	testl	%eax, %eax
	je	.L60
	.loc 1 300 0 is_stmt 1
	jmp	.L68
.LVL109:
.L66:
	.loc 1 280 0
	nop
	jmp	.L56
.LVL110:
.L67:
	.loc 1 295 0
	nop
	jmp	.L56
.L68:
	.loc 1 300 0
	nop
.L56:
	.loc 1 302 0
	cmpl	$0, 20(%ebp)
	je	.L62
	.loc 1 303 0
	movl	20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 305 0
	jmp	.L62
.L64:
	.loc 1 306 0
	addl	$1, -12(%ebp)
.L62:
	.loc 1 305 0
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jnb	.L63
	.loc 1 305 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$whitespace
	call	strchr
.LVL111:
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L64
.L63:
	.loc 1 307 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 308 0
	movl	-16(%ebp), %eax
	.loc 1 309 0
	leave
.LCFI29:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	gettoken, .-gettoken
	.globl	peek
	.type	peek, @function
peek:
.LFB11:
	.loc 1 313 0
	.cfi_startproc
.LVL112:
	pushl	%ebp
.LCFI30:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI31:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 316 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL113:
	.loc 1 317 0
	jmp	.L70
.LVL114:
.L72:
	.loc 1 318 0
	addl	$1, -12(%ebp)
.L70:
	.loc 1 317 0
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jnb	.L71
	.loc 1 317 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$whitespace
	call	strchr
.LVL115:
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L72
.L71:
	.loc 1 319 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 320 0
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	.L73
	.loc 1 320 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	16(%ebp)
	call	strchr
.LVL116:
	addl	$16, %esp
	testl	%eax, %eax
	je	.L73
	.loc 1 320 0 discriminator 3
	movl	$1, %eax
	jmp	.L74
.L73:
	.loc 1 320 0 discriminator 4
	movl	$0, %eax
.L74:
	.loc 1 321 0 is_stmt 1 discriminator 6
	leave
.LCFI32:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	peek, .-peek
	.section	.rodata
.LC9:
	.string	""
.LC10:
	.string	"leftovers: %s\n"
.LC11:
	.string	"syntax"
	.text
	.globl	parsecmd
	.type	parsecmd, @function
parsecmd:
.LFB12:
	.loc 1 330 0
	.cfi_startproc
.LVL117:
	pushl	%ebp
.LCFI33:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI34:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	.loc 1 334 0
	movl	8(%ebp), %ebx
	movl	8(%ebp), %eax
	subl	$12, %esp
	pushl	%eax
	call	strlen
.LVL118:
	addl	$16, %esp
	addl	%ebx, %eax
	movl	%eax, -12(%ebp)
.LVL119:
	.loc 1 335 0
	subl	$8, %esp
	pushl	-12(%ebp)
	leal	8(%ebp), %eax
.LVL120:
	pushl	%eax
	call	parseline
.LVL121:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL122:
	.loc 1 336 0
	subl	$4, %esp
	pushl	$.LC9
	pushl	-12(%ebp)
	leal	8(%ebp), %eax
.LVL123:
	pushl	%eax
	call	peek
.LVL124:
	addl	$16, %esp
	.loc 1 337 0
	movl	8(%ebp), %eax
	cmpl	-12(%ebp), %eax
	je	.L77
	.loc 1 338 0
	movl	8(%ebp), %eax
	subl	$4, %esp
	pushl	%eax
	pushl	$.LC10
	pushl	$2
	call	printf
.LVL125:
	addl	$16, %esp
	.loc 1 339 0
	subl	$12, %esp
	pushl	$.LC11
	call	panic
.LVL126:
	addl	$16, %esp
.L77:
	.loc 1 341 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	nulterminate
.LVL127:
	addl	$16, %esp
	.loc 1 342 0
	movl	-16(%ebp), %eax
	.loc 1 343 0
	movl	-4(%ebp), %ebx
	leave
.LCFI35:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
.LVL128:
	ret
	.cfi_endproc
.LFE12:
	.size	parsecmd, .-parsecmd
	.section	.rodata
.LC12:
	.string	"&"
.LC13:
	.string	";"
	.text
	.globl	parseline
	.type	parseline, @function
parseline:
.LFB13:
	.loc 1 347 0
	.cfi_startproc
.LVL129:
	pushl	%ebp
.LCFI36:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI37:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 350 0
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	parsepipe
.LVL130:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL131:
	.loc 1 351 0
	jmp	.L80
.LVL132:
.L81:
	.loc 1 352 0
	pushl	$0
	pushl	$0
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	gettoken
.LVL133:
	addl	$16, %esp
	.loc 1 353 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	backcmd
.LVL134:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL135:
.L80:
	.loc 1 351 0
	subl	$4, %esp
	pushl	$.LC12
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	peek
.LVL136:
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L81
	.loc 1 355 0
	subl	$4, %esp
	pushl	$.LC13
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	peek
.LVL137:
	addl	$16, %esp
	testl	%eax, %eax
	je	.L82
	.loc 1 356 0
	pushl	$0
	pushl	$0
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	gettoken
.LVL138:
	addl	$16, %esp
	.loc 1 357 0
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	parseline
.LVL139:
	addl	$16, %esp
	subl	$8, %esp
	pushl	%eax
	pushl	-12(%ebp)
	call	listcmd
.LVL140:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL141:
.L82:
	.loc 1 359 0
	movl	-12(%ebp), %eax
	.loc 1 360 0
	leave
.LCFI38:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	parseline, .-parseline
	.section	.rodata
.LC14:
	.string	"|"
	.text
	.globl	parsepipe
	.type	parsepipe, @function
parsepipe:
.LFB14:
	.loc 1 364 0
	.cfi_startproc
.LVL142:
	pushl	%ebp
.LCFI39:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI40:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 367 0
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	parseexec
.LVL143:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL144:
	.loc 1 368 0
	subl	$4, %esp
	pushl	$.LC14
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	peek
.LVL145:
	addl	$16, %esp
	testl	%eax, %eax
	je	.L85
	.loc 1 369 0
	pushl	$0
	pushl	$0
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	gettoken
.LVL146:
	addl	$16, %esp
	.loc 1 370 0
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	parsepipe
.LVL147:
	addl	$16, %esp
	subl	$8, %esp
	pushl	%eax
	pushl	-12(%ebp)
	call	pipecmd
.LVL148:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL149:
.L85:
	.loc 1 372 0
	movl	-12(%ebp), %eax
	.loc 1 373 0
	leave
.LCFI41:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	parsepipe, .-parsepipe
	.section	.rodata
.LC15:
	.string	"missing file for redirection"
.LC16:
	.string	"<>"
	.text
	.globl	parseredirs
	.type	parseredirs, @function
parseredirs:
.LFB15:
	.loc 1 377 0
	.cfi_startproc
.LVL150:
	pushl	%ebp
.LCFI42:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI43:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 381 0
	jmp	.L88
.L93:
	.loc 1 382 0
	pushl	$0
	pushl	$0
	pushl	16(%ebp)
	pushl	12(%ebp)
	call	gettoken
.LVL151:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL152:
	.loc 1 383 0
	leal	-20(%ebp), %eax
.LVL153:
	pushl	%eax
	leal	-16(%ebp), %eax
	pushl	%eax
	pushl	16(%ebp)
	pushl	12(%ebp)
	call	gettoken
.LVL154:
	addl	$16, %esp
	cmpl	$97, %eax
	je	.L89
	.loc 1 384 0
	subl	$12, %esp
	pushl	$.LC15
	call	panic
.LVL155:
	addl	$16, %esp
.L89:
	.loc 1 385 0
	movl	-12(%ebp), %eax
	cmpl	$60, %eax
	je	.L90
	cmpl	$62, %eax
	je	.L91
	cmpl	$43, %eax
	je	.L92
	jmp	.L88
.L90:
	.loc 1 387 0
	movl	-20(%ebp), %edx
	movl	-16(%ebp), %eax
	subl	$12, %esp
	pushl	$0
	pushl	$0
	pushl	%edx
	pushl	%eax
	pushl	8(%ebp)
	call	redircmd
.LVL156:
	addl	$32, %esp
	movl	%eax, 8(%ebp)
.LVL157:
	.loc 1 388 0
	jmp	.L88
.LVL158:
.L91:
	.loc 1 390 0
	movl	-20(%ebp), %edx
	movl	-16(%ebp), %eax
	subl	$12, %esp
	pushl	$1
	pushl	$513
	pushl	%edx
	pushl	%eax
	pushl	8(%ebp)
	call	redircmd
.LVL159:
	addl	$32, %esp
	movl	%eax, 8(%ebp)
.LVL160:
	.loc 1 391 0
	jmp	.L88
.LVL161:
.L92:
	.loc 1 393 0
	movl	-20(%ebp), %edx
	movl	-16(%ebp), %eax
	subl	$12, %esp
	pushl	$1
	pushl	$513
	pushl	%edx
	pushl	%eax
	pushl	8(%ebp)
	call	redircmd
.LVL162:
	addl	$32, %esp
	movl	%eax, 8(%ebp)
.LVL163:
	.loc 1 394 0
	nop
.LVL164:
.L88:
	.loc 1 381 0
	subl	$4, %esp
	pushl	$.LC16
	pushl	16(%ebp)
	pushl	12(%ebp)
	call	peek
.LVL165:
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L93
	.loc 1 397 0
	movl	8(%ebp), %eax
	.loc 1 398 0
	leave
.LCFI44:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	parseredirs, .-parseredirs
	.section	.rodata
.LC17:
	.string	"("
.LC18:
	.string	"parseblock"
.LC19:
	.string	")"
.LC20:
	.string	"syntax - missing )"
	.text
	.globl	parseblock
	.type	parseblock, @function
parseblock:
.LFB16:
	.loc 1 402 0
	.cfi_startproc
.LVL166:
	pushl	%ebp
.LCFI45:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI46:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 405 0
	subl	$4, %esp
	pushl	$.LC17
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	peek
.LVL167:
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L96
	.loc 1 406 0
	subl	$12, %esp
	pushl	$.LC18
	call	panic
.LVL168:
	addl	$16, %esp
.L96:
	.loc 1 407 0
	pushl	$0
	pushl	$0
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	gettoken
.LVL169:
	addl	$16, %esp
	.loc 1 408 0
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	parseline
.LVL170:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL171:
	.loc 1 409 0
	subl	$4, %esp
	pushl	$.LC19
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	peek
.LVL172:
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L97
	.loc 1 410 0
	subl	$12, %esp
	pushl	$.LC20
	call	panic
.LVL173:
	addl	$16, %esp
.L97:
	.loc 1 411 0
	pushl	$0
	pushl	$0
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	gettoken
.LVL174:
	addl	$16, %esp
	.loc 1 412 0
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	pushl	-12(%ebp)
	call	parseredirs
.LVL175:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL176:
	.loc 1 413 0
	movl	-12(%ebp), %eax
	.loc 1 414 0
	leave
.LCFI47:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	parseblock, .-parseblock
	.section	.rodata
.LC21:
	.string	"too many args"
.LC22:
	.string	"|)&;"
	.text
	.globl	parseexec
	.type	parseexec, @function
parseexec:
.LFB17:
	.loc 1 418 0
	.cfi_startproc
.LVL177:
	pushl	%ebp
.LCFI48:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI49:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 424 0
	subl	$4, %esp
	pushl	$.LC17
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	peek
.LVL178:
	addl	$16, %esp
	testl	%eax, %eax
	je	.L100
	.loc 1 425 0
	subl	$8, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	parseblock
.LVL179:
	addl	$16, %esp
	jmp	.L108
.L100:
	.loc 1 427 0
	call	execcmd
.LVL180:
	movl	%eax, -16(%ebp)
.LVL181:
	.loc 1 428 0
	movl	-16(%ebp), %eax
	movl	%eax, -20(%ebp)
.LVL182:
	.loc 1 430 0
	movl	$0, -12(%ebp)
.LVL183:
	.loc 1 431 0
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	pushl	-16(%ebp)
	call	parseredirs
.LVL184:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL185:
	.loc 1 432 0
	jmp	.L102
.LVL186:
.L107:
	.loc 1 433 0
	leal	-32(%ebp), %eax
	pushl	%eax
	leal	-28(%ebp), %eax
	pushl	%eax
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	gettoken
.LVL187:
	addl	$16, %esp
	movl	%eax, -24(%ebp)
.LVL188:
	cmpl	$0, -24(%ebp)
	je	.L109
	.loc 1 435 0
	cmpl	$97, -24(%ebp)
	je	.L105
	.loc 1 436 0
	subl	$12, %esp
	pushl	$.LC11
	call	panic
.LVL189:
	addl	$16, %esp
.L105:
	.loc 1 437 0
	movl	-28(%ebp), %ecx
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%ecx, 4(%eax,%edx,4)
	.loc 1 438 0
	movl	-32(%ebp), %edx
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %ecx
	addl	$8, %ecx
	movl	%edx, 12(%eax,%ecx,4)
	.loc 1 439 0
	addl	$1, -12(%ebp)
	.loc 1 440 0
	cmpl	$9, -12(%ebp)
	jle	.L106
	.loc 1 441 0
	subl	$12, %esp
	pushl	$.LC21
	call	panic
.LVL190:
	addl	$16, %esp
.L106:
	.loc 1 442 0
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	8(%ebp)
	pushl	-16(%ebp)
	call	parseredirs
.LVL191:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL192:
.L102:
	.loc 1 432 0
	subl	$4, %esp
	pushl	$.LC22
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	peek
.LVL193:
	addl	$16, %esp
	testl	%eax, %eax
	je	.L107
	jmp	.L104
.LVL194:
.L109:
	.loc 1 434 0
	nop
.LVL195:
.L104:
	.loc 1 444 0
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	$0, 4(%eax,%edx,4)
	.loc 1 445 0
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	addl	$8, %edx
	movl	$0, 12(%eax,%edx,4)
	.loc 1 446 0
	movl	-16(%ebp), %eax
.LVL196:
.L108:
	.loc 1 447 0 discriminator 1
	leave
.LCFI50:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	parseexec, .-parseexec
	.globl	nulterminate
	.type	nulterminate, @function
nulterminate:
.LFB18:
	.loc 1 452 0
	.cfi_startproc
.LVL197:
	pushl	%ebp
.LCFI51:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI52:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 460 0
	cmpl	$0, 8(%ebp)
	jne	.L111
	.loc 1 461 0
	movl	$0, %eax
	jmp	.L112
.L111:
	.loc 1 463 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$5, %eax
	ja	.L113
	movl	.L115(,%eax,4), %eax
	jmp	*%eax
	.section	.rodata
	.align 4
	.align 4
.L115:
	.long	.L113
	.long	.L114
	.long	.L116
	.long	.L117
	.long	.L118
	.long	.L119
	.text
.L114:
	.loc 1 465 0
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
.LVL198:
	.loc 1 466 0
	movl	$0, -12(%ebp)
.LVL199:
	jmp	.L120
.LVL200:
.L121:
	.loc 1 467 0 discriminator 3
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
.LVL201:
	addl	$8, %edx
	movl	12(%eax,%edx,4), %eax
	movb	$0, (%eax)
	.loc 1 466 0 discriminator 3
	addl	$1, -12(%ebp)
.LVL202:
.L120:
	.loc 1 466 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	4(%eax,%edx,4), %eax
	testl	%eax, %eax
	jne	.L121
	.loc 1 468 0 is_stmt 1
	jmp	.L113
.LVL203:
.L116:
	.loc 1 471 0
	movl	8(%ebp), %eax
	movl	%eax, -20(%ebp)
.LVL204:
	.loc 1 472 0
	movl	-20(%ebp), %eax
	movl	4(%eax), %eax
.LVL205:
	subl	$12, %esp
	pushl	%eax
	call	nulterminate
.LVL206:
	addl	$16, %esp
	.loc 1 473 0
	movl	-20(%ebp), %eax
	movl	12(%eax), %eax
	movb	$0, (%eax)
	.loc 1 474 0
	jmp	.L113
.LVL207:
.L117:
	.loc 1 477 0
	movl	8(%ebp), %eax
	movl	%eax, -24(%ebp)
.LVL208:
	.loc 1 478 0
	movl	-24(%ebp), %eax
	movl	4(%eax), %eax
.LVL209:
	subl	$12, %esp
	pushl	%eax
	call	nulterminate
.LVL210:
	addl	$16, %esp
	.loc 1 479 0
	movl	-24(%ebp), %eax
	movl	8(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	nulterminate
.LVL211:
	addl	$16, %esp
	.loc 1 480 0
	jmp	.L113
.LVL212:
.L118:
	.loc 1 483 0
	movl	8(%ebp), %eax
	movl	%eax, -28(%ebp)
.LVL213:
	.loc 1 484 0
	movl	-28(%ebp), %eax
	movl	4(%eax), %eax
.LVL214:
	subl	$12, %esp
	pushl	%eax
	call	nulterminate
.LVL215:
	addl	$16, %esp
	.loc 1 485 0
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	nulterminate
.LVL216:
	addl	$16, %esp
	.loc 1 486 0
	jmp	.L113
.LVL217:
.L119:
	.loc 1 489 0
	movl	8(%ebp), %eax
	movl	%eax, -32(%ebp)
.LVL218:
	.loc 1 490 0
	movl	-32(%ebp), %eax
	movl	4(%eax), %eax
.LVL219:
	subl	$12, %esp
	pushl	%eax
	call	nulterminate
.LVL220:
	addl	$16, %esp
	.loc 1 491 0
	nop
.LVL221:
.L113:
	.loc 1 493 0
	movl	8(%ebp), %eax
.L112:
	.loc 1 494 0
	leave
.LCFI53:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	nulterminate, .-nulterminate
	.local	buf.1351
	.comm	buf.1351,100,32
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xd7d
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF57
	.byte	0xc
	.long	.LASF58
	.long	.LASF59
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
	.uleb128 0x3
	.string	"cmd"
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.long	0x55
	.uleb128 0x4
	.long	.LASF4
	.byte	0x1
	.byte	0x11
	.long	0x55
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.long	.LASF3
	.byte	0x54
	.byte	0x1
	.byte	0x14
	.long	0x93
	.uleb128 0x4
	.long	.LASF4
	.byte	0x1
	.byte	0x15
	.long	0x55
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.long	.LASF5
	.byte	0x1
	.byte	0x16
	.long	0x93
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x4
	.long	.LASF6
	.byte	0x1
	.byte	0x17
	.long	0x93
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.byte	0
	.uleb128 0x7
	.long	0xaa
	.long	0xa3
	.uleb128 0x8
	.long	0xa3
	.byte	0x9
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x9
	.byte	0x4
	.long	0xb0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x6
	.long	.LASF9
	.byte	0x18
	.byte	0x1
	.byte	0x1a
	.long	0x117
	.uleb128 0x4
	.long	.LASF4
	.byte	0x1
	.byte	0x1b
	.long	0x55
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.string	"cmd"
	.byte	0x1
	.byte	0x1c
	.long	0x117
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x4
	.long	.LASF10
	.byte	0x1
	.byte	0x1d
	.long	0xaa
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x4
	.long	.LASF11
	.byte	0x1
	.byte	0x1e
	.long	0xaa
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x4
	.long	.LASF12
	.byte	0x1
	.byte	0x1f
	.long	0x55
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.string	"fd"
	.byte	0x1
	.byte	0x20
	.long	0x55
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x3a
	.uleb128 0x6
	.long	.LASF13
	.byte	0xc
	.byte	0x1
	.byte	0x23
	.long	0x154
	.uleb128 0x4
	.long	.LASF4
	.byte	0x1
	.byte	0x24
	.long	0x55
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.long	.LASF14
	.byte	0x1
	.byte	0x25
	.long	0x117
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x4
	.long	.LASF15
	.byte	0x1
	.byte	0x26
	.long	0x117
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x6
	.long	.LASF16
	.byte	0xc
	.byte	0x1
	.byte	0x29
	.long	0x18b
	.uleb128 0x4
	.long	.LASF4
	.byte	0x1
	.byte	0x2a
	.long	0x55
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.long	.LASF14
	.byte	0x1
	.byte	0x2b
	.long	0x117
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x4
	.long	.LASF15
	.byte	0x1
	.byte	0x2c
	.long	0x117
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x6
	.long	.LASF17
	.byte	0x8
	.byte	0x1
	.byte	0x2f
	.long	0x1b4
	.uleb128 0x4
	.long	.LASF4
	.byte	0x1
	.byte	0x30
	.long	0x55
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.string	"cmd"
	.byte	0x1
	.byte	0x31
	.long	0x117
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF26
	.byte	0x1
	.byte	0x3a
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x36f
	.uleb128 0xc
	.string	"cmd"
	.byte	0x1
	.byte	0x3a
	.long	0x117
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.string	"p"
	.byte	0x1
	.byte	0x3c
	.long	0x36f
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xe
	.long	.LASF18
	.byte	0x1
	.byte	0x3d
	.long	0x37f
	.long	.LLST1
	.uleb128 0xe
	.long	.LASF19
	.byte	0x1
	.byte	0x3e
	.long	0x385
	.long	.LLST2
	.uleb128 0xe
	.long	.LASF20
	.byte	0x1
	.byte	0x3f
	.long	0x38b
	.long	.LLST3
	.uleb128 0xe
	.long	.LASF21
	.byte	0x1
	.byte	0x40
	.long	0x391
	.long	.LLST4
	.uleb128 0xe
	.long	.LASF22
	.byte	0x1
	.byte	0x41
	.long	0x397
	.long	.LLST5
	.uleb128 0xf
	.long	.LVL1
	.long	0xcbd
	.uleb128 0xf
	.long	.LVL2
	.long	0x4a4
	.uleb128 0xf
	.long	.LVL5
	.long	0xcbd
	.uleb128 0xf
	.long	.LVL6
	.long	0xcca
	.uleb128 0xf
	.long	.LVL7
	.long	0xcd7
	.uleb128 0xf
	.long	.LVL11
	.long	0xce4
	.uleb128 0xf
	.long	.LVL12
	.long	0xcf1
	.uleb128 0xf
	.long	.LVL13
	.long	0xcd7
	.uleb128 0xf
	.long	.LVL14
	.long	0xcbd
	.uleb128 0xf
	.long	.LVL15
	.long	0x1b4
	.uleb128 0xf
	.long	.LVL18
	.long	0x4dd
	.uleb128 0xf
	.long	.LVL19
	.long	0x1b4
	.uleb128 0xf
	.long	.LVL20
	.long	0xcfe
	.uleb128 0xf
	.long	.LVL21
	.long	0x1b4
	.uleb128 0xf
	.long	.LVL25
	.long	0xd0b
	.uleb128 0xf
	.long	.LVL26
	.long	0x4a4
	.uleb128 0xf
	.long	.LVL27
	.long	0x4dd
	.uleb128 0xf
	.long	.LVL28
	.long	0xce4
	.uleb128 0xf
	.long	.LVL29
	.long	0xd18
	.uleb128 0xf
	.long	.LVL30
	.long	0xce4
	.uleb128 0xf
	.long	.LVL31
	.long	0xce4
	.uleb128 0xf
	.long	.LVL32
	.long	0x1b4
	.uleb128 0xf
	.long	.LVL33
	.long	0x4dd
	.uleb128 0xf
	.long	.LVL34
	.long	0xce4
	.uleb128 0xf
	.long	.LVL35
	.long	0xd18
	.uleb128 0xf
	.long	.LVL36
	.long	0xce4
	.uleb128 0xf
	.long	.LVL37
	.long	0xce4
	.uleb128 0xf
	.long	.LVL38
	.long	0x1b4
	.uleb128 0xf
	.long	.LVL39
	.long	0xce4
	.uleb128 0xf
	.long	.LVL40
	.long	0xce4
	.uleb128 0xf
	.long	.LVL41
	.long	0xcfe
	.uleb128 0xf
	.long	.LVL42
	.long	0xcfe
	.uleb128 0xf
	.long	.LVL45
	.long	0x4dd
	.uleb128 0xf
	.long	.LVL46
	.long	0x1b4
	.uleb128 0xf
	.long	.LVL48
	.long	0xcbd
	.byte	0
	.uleb128 0x7
	.long	0x55
	.long	0x37f
	.uleb128 0x8
	.long	0xa3
	.byte	0x1
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x18b
	.uleb128 0x9
	.byte	0x4
	.long	0x5c
	.uleb128 0x9
	.byte	0x4
	.long	0x154
	.uleb128 0x9
	.byte	0x4
	.long	0x11d
	.uleb128 0x9
	.byte	0x4
	.long	0xb7
	.uleb128 0x10
	.byte	0x1
	.long	.LASF24
	.byte	0x1
	.byte	0x86
	.byte	0x1
	.long	0x55
	.long	.LFB1
	.long	.LFE1
	.long	.LLST6
	.byte	0x1
	.long	0x3f3
	.uleb128 0xc
	.string	"buf"
	.byte	0x1
	.byte	0x86
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.long	.LASF23
	.byte	0x1
	.byte	0x86
	.long	0x55
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xf
	.long	.LVL50
	.long	0xcd7
	.uleb128 0xf
	.long	.LVL51
	.long	0xd25
	.uleb128 0xf
	.long	.LVL52
	.long	0xd32
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF25
	.byte	0x1
	.byte	0x91
	.byte	0x1
	.long	0x55
	.long	.LFB2
	.long	.LFE2
	.long	.LLST7
	.byte	0x1
	.long	0x494
	.uleb128 0xd
	.string	"buf"
	.byte	0x1
	.byte	0x93
	.long	0x494
	.byte	0x5
	.byte	0x3
	.long	buf.1351
	.uleb128 0x12
	.string	"fd"
	.byte	0x1
	.byte	0x94
	.long	0x55
	.long	.LLST8
	.uleb128 0xf
	.long	.LVL54
	.long	0xce4
	.uleb128 0xf
	.long	.LVL55
	.long	0xcf1
	.uleb128 0xf
	.long	.LVL58
	.long	0xd3f
	.uleb128 0xf
	.long	.LVL59
	.long	0xd4c
	.uleb128 0xf
	.long	.LVL60
	.long	0xcd7
	.uleb128 0xf
	.long	.LVL61
	.long	0x4dd
	.uleb128 0xf
	.long	.LVL62
	.long	0x7f2
	.uleb128 0xf
	.long	.LVL63
	.long	0x1b4
	.uleb128 0xf
	.long	.LVL64
	.long	0xcfe
	.uleb128 0xf
	.long	.LVL65
	.long	0x39d
	.uleb128 0xf
	.long	.LVL66
	.long	0xcbd
	.byte	0
	.uleb128 0x7
	.long	0xb0
	.long	0x4a4
	.uleb128 0x8
	.long	0xa3
	.byte	0x63
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF27
	.byte	0x1
	.byte	0xb0
	.byte	0x1
	.long	.LFB3
	.long	.LFE3
	.long	.LLST9
	.byte	0x1
	.long	0x4dd
	.uleb128 0xc
	.string	"s"
	.byte	0x1
	.byte	0xb0
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xf
	.long	.LVL68
	.long	0xcd7
	.uleb128 0xf
	.long	.LVL69
	.long	0xcbd
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF28
	.byte	0x1
	.byte	0xb7
	.byte	0x1
	.long	0x55
	.long	.LFB4
	.long	.LFE4
	.long	.LLST10
	.byte	0x1
	.long	0x51d
	.uleb128 0x12
	.string	"pid"
	.byte	0x1
	.byte	0xb9
	.long	0x55
	.long	.LLST11
	.uleb128 0xf
	.long	.LVL70
	.long	0xd59
	.uleb128 0xf
	.long	.LVL72
	.long	0x4a4
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF3
	.byte	0x1
	.byte	0xc5
	.byte	0x1
	.long	0x117
	.long	.LFB5
	.long	.LFE5
	.long	.LLST12
	.byte	0x1
	.long	0x55d
	.uleb128 0x12
	.string	"cmd"
	.byte	0x1
	.byte	0xc7
	.long	0x385
	.long	.LLST13
	.uleb128 0xf
	.long	.LVL74
	.long	0xd66
	.uleb128 0xf
	.long	.LVL76
	.long	0xd25
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF9
	.byte	0x1
	.byte	0xd0
	.byte	0x1
	.long	0x117
	.long	.LFB6
	.long	.LFE6
	.long	.LLST14
	.byte	0x1
	.long	0x5e2
	.uleb128 0x11
	.long	.LASF29
	.byte	0x1
	.byte	0xd0
	.long	0x117
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.long	.LASF10
	.byte	0x1
	.byte	0xd0
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.long	.LASF11
	.byte	0x1
	.byte	0xd0
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x11
	.long	.LASF12
	.byte	0x1
	.byte	0xd0
	.long	0x55
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0xc
	.string	"fd"
	.byte	0x1
	.byte	0xd0
	.long	0x55
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x12
	.string	"cmd"
	.byte	0x1
	.byte	0xd2
	.long	0x397
	.long	.LLST15
	.uleb128 0xf
	.long	.LVL79
	.long	0xd66
	.uleb128 0xf
	.long	.LVL81
	.long	0xd25
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0xe0
	.byte	0x1
	.long	0x117
	.long	.LFB7
	.long	.LFE7
	.long	.LLST16
	.byte	0x1
	.long	0x63e
	.uleb128 0x11
	.long	.LASF14
	.byte	0x1
	.byte	0xe0
	.long	0x117
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.long	.LASF15
	.byte	0x1
	.byte	0xe0
	.long	0x117
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.string	"cmd"
	.byte	0x1
	.byte	0xe2
	.long	0x391
	.long	.LLST17
	.uleb128 0xf
	.long	.LVL83
	.long	0xd66
	.uleb128 0xf
	.long	.LVL85
	.long	0xd25
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0xed
	.byte	0x1
	.long	0x117
	.long	.LFB8
	.long	.LFE8
	.long	.LLST18
	.byte	0x1
	.long	0x69a
	.uleb128 0x11
	.long	.LASF14
	.byte	0x1
	.byte	0xed
	.long	0x117
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.long	.LASF15
	.byte	0x1
	.byte	0xed
	.long	0x117
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.string	"cmd"
	.byte	0x1
	.byte	0xef
	.long	0x38b
	.long	.LLST19
	.uleb128 0xf
	.long	.LVL87
	.long	0xd66
	.uleb128 0xf
	.long	.LVL89
	.long	0xd25
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0xfa
	.byte	0x1
	.long	0x117
	.long	.LFB9
	.long	.LFE9
	.long	.LLST20
	.byte	0x1
	.long	0x6e8
	.uleb128 0x11
	.long	.LASF29
	.byte	0x1
	.byte	0xfa
	.long	0x117
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.string	"cmd"
	.byte	0x1
	.byte	0xfc
	.long	0x37f
	.long	.LLST21
	.uleb128 0xf
	.long	.LVL91
	.long	0xd66
	.uleb128 0xf
	.long	.LVL93
	.long	0xd25
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.value	0x10b
	.byte	0x1
	.long	0x55
	.long	.LFB10
	.long	.LFE10
	.long	.LLST22
	.byte	0x1
	.long	0x781
	.uleb128 0x14
	.string	"ps"
	.byte	0x1
	.value	0x10b
	.long	0x781
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"es"
	.byte	0x1
	.value	0x10b
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.string	"q"
	.byte	0x1
	.value	0x10b
	.long	0x781
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.string	"eq"
	.byte	0x1
	.value	0x10b
	.long	0x781
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x15
	.string	"s"
	.byte	0x1
	.value	0x10d
	.long	0xaa
	.long	.LLST23
	.uleb128 0x15
	.string	"ret"
	.byte	0x1
	.value	0x10e
	.long	0x55
	.long	.LLST24
	.uleb128 0xf
	.long	.LVL97
	.long	0xd73
	.uleb128 0xf
	.long	.LVL107
	.long	0xd73
	.uleb128 0xf
	.long	.LVL108
	.long	0xd73
	.uleb128 0xf
	.long	.LVL111
	.long	0xd73
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0xaa
	.uleb128 0x13
	.byte	0x1
	.long	.LASF31
	.byte	0x1
	.value	0x138
	.byte	0x1
	.long	0x55
	.long	.LFB11
	.long	.LFE11
	.long	.LLST25
	.byte	0x1
	.long	0x7f2
	.uleb128 0x14
	.string	"ps"
	.byte	0x1
	.value	0x138
	.long	0x781
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"es"
	.byte	0x1
	.value	0x138
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.long	.LASF32
	.byte	0x1
	.value	0x138
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.string	"s"
	.byte	0x1
	.value	0x13a
	.long	0xaa
	.long	.LLST26
	.uleb128 0xf
	.long	.LVL115
	.long	0xd73
	.uleb128 0xf
	.long	.LVL116
	.long	0xd73
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF33
	.byte	0x1
	.value	0x149
	.byte	0x1
	.long	0x117
	.long	.LFB12
	.long	.LFE12
	.long	.LLST27
	.byte	0x1
	.long	0x875
	.uleb128 0x17
	.string	"s"
	.byte	0x1
	.value	0x149
	.long	0xaa
	.long	.LLST28
	.uleb128 0x15
	.string	"es"
	.byte	0x1
	.value	0x14b
	.long	0xaa
	.long	.LLST29
	.uleb128 0x15
	.string	"cmd"
	.byte	0x1
	.value	0x14c
	.long	0x117
	.long	.LLST30
	.uleb128 0xf
	.long	.LVL118
	.long	0xd3f
	.uleb128 0xf
	.long	.LVL121
	.long	0x875
	.uleb128 0xf
	.long	.LVL124
	.long	0x787
	.uleb128 0xf
	.long	.LVL125
	.long	0xcd7
	.uleb128 0xf
	.long	.LVL126
	.long	0x4a4
	.uleb128 0xf
	.long	.LVL127
	.long	0xbb4
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF34
	.byte	0x1
	.value	0x15a
	.byte	0x1
	.long	0x117
	.long	.LFB13
	.long	.LFE13
	.long	.LLST31
	.byte	0x1
	.long	0x909
	.uleb128 0x14
	.string	"ps"
	.byte	0x1
	.value	0x15a
	.long	0x781
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"es"
	.byte	0x1
	.value	0x15a
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.string	"cmd"
	.byte	0x1
	.value	0x15c
	.long	0x117
	.long	.LLST32
	.uleb128 0xf
	.long	.LVL130
	.long	0x909
	.uleb128 0xf
	.long	.LVL133
	.long	0x6e8
	.uleb128 0xf
	.long	.LVL134
	.long	0x69a
	.uleb128 0xf
	.long	.LVL136
	.long	0x787
	.uleb128 0xf
	.long	.LVL137
	.long	0x787
	.uleb128 0xf
	.long	.LVL138
	.long	0x6e8
	.uleb128 0xf
	.long	.LVL139
	.long	0x875
	.uleb128 0xf
	.long	.LVL140
	.long	0x63e
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF35
	.byte	0x1
	.value	0x16b
	.byte	0x1
	.long	0x117
	.long	.LFB14
	.long	.LFE14
	.long	.LLST33
	.byte	0x1
	.long	0x982
	.uleb128 0x14
	.string	"ps"
	.byte	0x1
	.value	0x16b
	.long	0x781
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"es"
	.byte	0x1
	.value	0x16b
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.string	"cmd"
	.byte	0x1
	.value	0x16d
	.long	0x117
	.long	.LLST34
	.uleb128 0xf
	.long	.LVL143
	.long	0xacc
	.uleb128 0xf
	.long	.LVL145
	.long	0x787
	.uleb128 0xf
	.long	.LVL146
	.long	0x6e8
	.uleb128 0xf
	.long	.LVL147
	.long	0x909
	.uleb128 0xf
	.long	.LVL148
	.long	0x5e2
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF36
	.byte	0x1
	.value	0x178
	.byte	0x1
	.long	0x117
	.long	.LFB15
	.long	.LFE15
	.long	.LLST35
	.byte	0x1
	.long	0xa38
	.uleb128 0x17
	.string	"cmd"
	.byte	0x1
	.value	0x178
	.long	0x117
	.long	.LLST36
	.uleb128 0x14
	.string	"ps"
	.byte	0x1
	.value	0x178
	.long	0x781
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.string	"es"
	.byte	0x1
	.value	0x178
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.string	"tok"
	.byte	0x1
	.value	0x17a
	.long	0x55
	.long	.LLST37
	.uleb128 0x18
	.string	"q"
	.byte	0x1
	.value	0x17b
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.string	"eq"
	.byte	0x1
	.value	0x17b
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xf
	.long	.LVL151
	.long	0x6e8
	.uleb128 0xf
	.long	.LVL154
	.long	0x6e8
	.uleb128 0xf
	.long	.LVL155
	.long	0x4a4
	.uleb128 0xf
	.long	.LVL156
	.long	0x55d
	.uleb128 0xf
	.long	.LVL159
	.long	0x55d
	.uleb128 0xf
	.long	.LVL162
	.long	0x55d
	.uleb128 0xf
	.long	.LVL165
	.long	0x787
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF37
	.byte	0x1
	.value	0x191
	.byte	0x1
	.long	0x117
	.long	.LFB16
	.long	.LFE16
	.long	.LLST38
	.byte	0x1
	.long	0xacc
	.uleb128 0x14
	.string	"ps"
	.byte	0x1
	.value	0x191
	.long	0x781
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"es"
	.byte	0x1
	.value	0x191
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.string	"cmd"
	.byte	0x1
	.value	0x193
	.long	0x117
	.long	.LLST39
	.uleb128 0xf
	.long	.LVL167
	.long	0x787
	.uleb128 0xf
	.long	.LVL168
	.long	0x4a4
	.uleb128 0xf
	.long	.LVL169
	.long	0x6e8
	.uleb128 0xf
	.long	.LVL170
	.long	0x875
	.uleb128 0xf
	.long	.LVL172
	.long	0x787
	.uleb128 0xf
	.long	.LVL173
	.long	0x4a4
	.uleb128 0xf
	.long	.LVL174
	.long	0x6e8
	.uleb128 0xf
	.long	.LVL175
	.long	0x982
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF38
	.byte	0x1
	.value	0x1a1
	.byte	0x1
	.long	0x117
	.long	.LFB17
	.long	.LFE17
	.long	.LLST40
	.byte	0x1
	.long	0xbb4
	.uleb128 0x14
	.string	"ps"
	.byte	0x1
	.value	0x1a1
	.long	0x781
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"es"
	.byte	0x1
	.value	0x1a1
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.string	"q"
	.byte	0x1
	.value	0x1a3
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.string	"eq"
	.byte	0x1
	.value	0x1a3
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.string	"tok"
	.byte	0x1
	.value	0x1a4
	.long	0x55
	.long	.LLST41
	.uleb128 0x19
	.long	.LASF39
	.byte	0x1
	.value	0x1a4
	.long	0x55
	.long	.LLST42
	.uleb128 0x15
	.string	"cmd"
	.byte	0x1
	.value	0x1a5
	.long	0x385
	.long	.LLST43
	.uleb128 0x15
	.string	"ret"
	.byte	0x1
	.value	0x1a6
	.long	0x117
	.long	.LLST44
	.uleb128 0xf
	.long	.LVL178
	.long	0x787
	.uleb128 0xf
	.long	.LVL179
	.long	0xa38
	.uleb128 0xf
	.long	.LVL180
	.long	0x51d
	.uleb128 0xf
	.long	.LVL184
	.long	0x982
	.uleb128 0xf
	.long	.LVL187
	.long	0x6e8
	.uleb128 0xf
	.long	.LVL189
	.long	0x4a4
	.uleb128 0xf
	.long	.LVL190
	.long	0x4a4
	.uleb128 0xf
	.long	.LVL191
	.long	0x982
	.uleb128 0xf
	.long	.LVL193
	.long	0x787
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.value	0x1c3
	.byte	0x1
	.long	0x117
	.long	.LFB18
	.long	.LFE18
	.long	.LLST45
	.byte	0x1
	.long	0xc77
	.uleb128 0x14
	.string	"cmd"
	.byte	0x1
	.value	0x1c3
	.long	0x117
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.value	0x1c5
	.long	0x55
	.long	.LLST46
	.uleb128 0x19
	.long	.LASF18
	.byte	0x1
	.value	0x1c6
	.long	0x37f
	.long	.LLST47
	.uleb128 0x19
	.long	.LASF19
	.byte	0x1
	.value	0x1c7
	.long	0x385
	.long	.LLST48
	.uleb128 0x19
	.long	.LASF20
	.byte	0x1
	.value	0x1c8
	.long	0x38b
	.long	.LLST49
	.uleb128 0x19
	.long	.LASF21
	.byte	0x1
	.value	0x1c9
	.long	0x391
	.long	.LLST50
	.uleb128 0x19
	.long	.LASF22
	.byte	0x1
	.value	0x1ca
	.long	0x397
	.long	.LLST51
	.uleb128 0xf
	.long	.LVL206
	.long	0xbb4
	.uleb128 0xf
	.long	.LVL210
	.long	0xbb4
	.uleb128 0xf
	.long	.LVL211
	.long	0xbb4
	.uleb128 0xf
	.long	.LVL215
	.long	0xbb4
	.uleb128 0xf
	.long	.LVL216
	.long	0xbb4
	.uleb128 0xf
	.long	.LVL220
	.long	0xbb4
	.byte	0
	.uleb128 0x7
	.long	0xb0
	.long	0xc87
	.uleb128 0x8
	.long	0xa3
	.byte	0x5
	.byte	0
	.uleb128 0x1a
	.long	.LASF41
	.byte	0x1
	.value	0x107
	.long	0xc77
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	whitespace
	.uleb128 0x7
	.long	0xb0
	.long	0xcaa
	.uleb128 0x8
	.long	0xa3
	.byte	0x7
	.byte	0
	.uleb128 0x1a
	.long	.LASF42
	.byte	0x1
	.value	0x108
	.long	0xc9a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	symbols
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF43
	.long	.LASF43
	.byte	0x2
	.byte	0x8
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF44
	.long	.LASF44
	.byte	0x2
	.byte	0xf
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF45
	.long	.LASF45
	.byte	0x2
	.byte	0x8e
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF46
	.long	.LASF46
	.byte	0x2
	.byte	0xd
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF47
	.long	.LASF47
	.byte	0x2
	.byte	0x10
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF48
	.long	.LASF48
	.byte	0x2
	.byte	0x9
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF49
	.long	.LASF49
	.byte	0x2
	.byte	0xa
	.uleb128 0x1c
	.byte	0x1
	.byte	0x1
	.string	"dup"
	.string	"dup"
	.byte	0x2
	.byte	0x17
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF50
	.long	.LASF50
	.byte	0x2
	.byte	0x91
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF51
	.long	.LASF51
	.byte	0x2
	.byte	0x8f
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF52
	.long	.LASF52
	.byte	0x2
	.byte	0x90
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF53
	.long	.LASF53
	.byte	0x2
	.byte	0x16
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF54
	.long	.LASF54
	.byte	0x2
	.byte	0x7
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF55
	.long	.LASF55
	.byte	0x2
	.byte	0x92
	.uleb128 0x1b
	.byte	0x1
	.byte	0x1
	.long	.LASF56
	.long	.LASF56
	.byte	0x2
	.byte	0x8c
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x2007
	.uleb128 0x8
	.uleb128 0x3
	.uleb128 0x8
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
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST1:
	.long	.LVL44-.Ltext0
	.long	.LVL45-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL45-1-.Ltext0
	.long	.LVL47-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST2:
	.long	.LVL3-.Ltext0
	.long	.LVL4-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL4-.Ltext0
	.long	.LVL8-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST3:
	.long	.LVL17-.Ltext0
	.long	.LVL18-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL18-1-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST4:
	.long	.LVL23-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL24-.Ltext0
	.long	.LVL43-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST5:
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL10-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST6:
	.long	.LFB1-.Ltext0
	.long	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI2-.Ltext0
	.long	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI3-.Ltext0
	.long	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI4-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LFB2-.Ltext0
	.long	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI5-.Ltext0
	.long	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x71
	.sleb128 0
	.long	.LCFI6-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x3
	.byte	0x75
	.sleb128 -4
	.byte	0x6
	.long	0
	.long	0
.LLST8:
	.long	.LVL53-.Ltext0
	.long	.LVL54-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL56-.Ltext0
	.long	.LVL57-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LLST9:
	.long	.LFB3-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI7-.Ltext0
	.long	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI8-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST10:
	.long	.LFB4-.Ltext0
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
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST11:
	.long	.LVL71-.Ltext0
	.long	.LVL72-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL72-1-.Ltext0
	.long	.LVL73-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL73-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST12:
	.long	.LFB5-.Ltext0
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
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST13:
	.long	.LVL75-.Ltext0
	.long	.LVL76-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL76-1-.Ltext0
	.long	.LVL77-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL77-.Ltext0
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST14:
	.long	.LFB6-.Ltext0
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
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST15:
	.long	.LVL80-.Ltext0
	.long	.LVL81-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL81-1-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST16:
	.long	.LFB7-.Ltext0
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
	.long	.LFE7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST17:
	.long	.LVL84-.Ltext0
	.long	.LVL85-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL85-1-.Ltext0
	.long	.LFE7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST18:
	.long	.LFB8-.Ltext0
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
	.long	.LFE8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST19:
	.long	.LVL88-.Ltext0
	.long	.LVL89-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL89-1-.Ltext0
	.long	.LFE8-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST20:
	.long	.LFB9-.Ltext0
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
	.long	.LFE9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST21:
	.long	.LVL92-.Ltext0
	.long	.LVL93-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL93-1-.Ltext0
	.long	.LFE9-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST22:
	.long	.LFB10-.Ltext0
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
	.long	.LFE10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST23:
	.long	.LVL95-.Ltext0
	.long	.LVL96-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL96-.Ltext0
	.long	.LFE10-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST24:
	.long	.LVL98-.Ltext0
	.long	.LVL99-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL99-.Ltext0
	.long	.LVL100-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL100-.Ltext0
	.long	.LVL101-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL101-.Ltext0
	.long	.LVL102-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL102-.Ltext0
	.long	.LVL103-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL103-.Ltext0
	.long	.LVL109-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL109-.Ltext0
	.long	.LVL110-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL110-.Ltext0
	.long	.LFE10-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST25:
	.long	.LFB11-.Ltext0
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
	.long	.LFE11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST26:
	.long	.LVL113-.Ltext0
	.long	.LVL114-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL114-.Ltext0
	.long	.LFE11-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST27:
	.long	.LFB12-.Ltext0
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
	.long	.LFE12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST28:
	.long	.LVL117-.Ltext0
	.long	.LVL120-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL120-.Ltext0
	.long	.LVL121-1-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.long	.LVL121-1-.Ltext0
	.long	.LVL123-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LVL123-.Ltext0
	.long	.LVL124-1-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.long	.LVL124-1-.Ltext0
	.long	.LVL128-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LVL128-.Ltext0
	.long	.LFE12-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST29:
	.long	.LVL119-.Ltext0
	.long	.LVL120-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL120-.Ltext0
	.long	.LVL121-1-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 -20
	.long	.LVL121-1-.Ltext0
	.long	.LVL123-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL123-.Ltext0
	.long	.LVL124-1-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 -20
	.long	.LVL124-1-.Ltext0
	.long	.LVL128-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL128-.Ltext0
	.long	.LFE12-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST30:
	.long	.LVL122-.Ltext0
	.long	.LVL123-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL123-.Ltext0
	.long	.LVL124-1-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 -24
	.long	.LVL124-1-.Ltext0
	.long	.LVL128-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL128-.Ltext0
	.long	.LFE12-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST31:
	.long	.LFB13-.Ltext0
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
	.long	.LFE13-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST32:
	.long	.LVL131-.Ltext0
	.long	.LVL132-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL132-.Ltext0
	.long	.LFE13-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST33:
	.long	.LFB14-.Ltext0
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
	.long	.LFE14-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST34:
	.long	.LVL144-.Ltext0
	.long	.LVL145-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL145-1-.Ltext0
	.long	.LFE14-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST35:
	.long	.LFB15-.Ltext0
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
	.long	.LFE15-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST36:
	.long	.LVL150-.Ltext0
	.long	.LVL157-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL157-.Ltext0
	.long	.LVL158-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL158-.Ltext0
	.long	.LVL160-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL160-.Ltext0
	.long	.LVL161-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL161-.Ltext0
	.long	.LVL163-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL163-.Ltext0
	.long	.LVL164-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL164-.Ltext0
	.long	.LFE15-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST37:
	.long	.LVL152-.Ltext0
	.long	.LVL153-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL153-.Ltext0
	.long	.LVL164-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST38:
	.long	.LFB16-.Ltext0
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
	.long	.LFE16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST39:
	.long	.LVL171-.Ltext0
	.long	.LVL172-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL172-1-.Ltext0
	.long	.LVL176-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL176-.Ltext0
	.long	.LFE16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LLST40:
	.long	.LFB17-.Ltext0
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
	.long	.LFE17-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST41:
	.long	.LVL188-.Ltext0
	.long	.LVL189-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL189-1-.Ltext0
	.long	.LVL192-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL194-.Ltext0
	.long	.LVL195-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LLST42:
	.long	.LVL183-.Ltext0
	.long	.LVL196-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST43:
	.long	.LVL182-.Ltext0
	.long	.LVL184-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL184-1-.Ltext0
	.long	.LVL196-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST44:
	.long	.LVL181-.Ltext0
	.long	.LVL184-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL184-1-.Ltext0
	.long	.LVL185-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL185-.Ltext0
	.long	.LVL186-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL186-.Ltext0
	.long	.LVL196-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST45:
	.long	.LFB18-.Ltext0
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
	.long	.LFE18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST46:
	.long	.LVL199-.Ltext0
	.long	.LVL200-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL200-.Ltext0
	.long	.LVL201-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL201-.Ltext0
	.long	.LVL203-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST47:
	.long	.LVL218-.Ltext0
	.long	.LVL219-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL219-.Ltext0
	.long	.LVL221-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST48:
	.long	.LVL198-.Ltext0
	.long	.LVL200-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL200-.Ltext0
	.long	.LVL203-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST49:
	.long	.LVL213-.Ltext0
	.long	.LVL214-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL214-.Ltext0
	.long	.LVL217-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST50:
	.long	.LVL208-.Ltext0
	.long	.LVL209-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL209-.Ltext0
	.long	.LVL212-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST51:
	.long	.LVL204-.Ltext0
	.long	.LVL205-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL205-.Ltext0
	.long	.LVL207-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
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
.LASF20:
	.string	"lcmd"
.LASF26:
	.string	"runcmd"
.LASF17:
	.string	"backcmd"
.LASF41:
	.string	"whitespace"
.LASF53:
	.string	"chdir"
.LASF32:
	.string	"toks"
.LASF36:
	.string	"parseredirs"
.LASF21:
	.string	"pcmd"
.LASF27:
	.string	"panic"
.LASF14:
	.string	"left"
.LASF16:
	.string	"listcmd"
.LASF22:
	.string	"rcmd"
.LASF33:
	.string	"parsecmd"
.LASF56:
	.string	"strchr"
.LASF3:
	.string	"execcmd"
.LASF52:
	.string	"strlen"
.LASF10:
	.string	"file"
.LASF42:
	.string	"symbols"
.LASF47:
	.string	"open"
.LASF2:
	.string	"unsigned char"
.LASF23:
	.string	"nbuf"
.LASF54:
	.string	"fork"
.LASF11:
	.string	"efile"
.LASF46:
	.string	"close"
.LASF1:
	.string	"short unsigned int"
.LASF31:
	.string	"peek"
.LASF28:
	.string	"fork1"
.LASF37:
	.string	"parseblock"
.LASF29:
	.string	"subcmd"
.LASF50:
	.string	"memset"
.LASF51:
	.string	"gets"
.LASF59:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF19:
	.string	"ecmd"
.LASF49:
	.string	"pipe"
.LASF48:
	.string	"wait"
.LASF25:
	.string	"main"
.LASF44:
	.string	"exec"
.LASF0:
	.string	"unsigned int"
.LASF15:
	.string	"right"
.LASF13:
	.string	"pipecmd"
.LASF8:
	.string	"char"
.LASF24:
	.string	"getcmd"
.LASF12:
	.string	"mode"
.LASF30:
	.string	"gettoken"
.LASF39:
	.string	"argc"
.LASF7:
	.string	"sizetype"
.LASF57:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF45:
	.string	"printf"
.LASF4:
	.string	"type"
.LASF43:
	.string	"exit"
.LASF40:
	.string	"nulterminate"
.LASF5:
	.string	"argv"
.LASF58:
	.string	"sh.c"
.LASF35:
	.string	"parsepipe"
.LASF18:
	.string	"bcmd"
.LASF6:
	.string	"eargv"
.LASF9:
	.string	"redircmd"
.LASF38:
	.string	"parseexec"
.LASF55:
	.string	"malloc"
.LASF34:
	.string	"parseline"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
