	.file	"fs.c"
	.text
.Ltext0:
	.comm	sb,28,4
	.globl	readsb
	.type	readsb, @function
readsb:
.LFB0:
	.file 1 "fs.c"
	.loc 1 30 0
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
	.loc 1 33 0
	movl	8(%ebp), %eax
	subl	$8, %esp
	pushl	$1
	pushl	%eax
	call	bread
.LVL1:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL2:
	.loc 1 34 0
	movl	-12(%ebp), %eax
	addl	$24, %eax
.LVL3:
	subl	$4, %esp
	pushl	$28
	pushl	%eax
	pushl	12(%ebp)
	call	memmove
.LVL4:
	addl	$16, %esp
	.loc 1 35 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	brelse
.LVL5:
	addl	$16, %esp
	.loc 1 36 0
	nop
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	readsb, .-readsb
	.type	bzero, @function
bzero:
.LFB1:
	.loc 1 41 0
	.cfi_startproc
.LVL6:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 44 0
	movl	12(%ebp), %edx
	movl	8(%ebp), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	bread
.LVL7:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL8:
	.loc 1 45 0
	movl	-12(%ebp), %eax
	addl	$24, %eax
.LVL9:
	subl	$4, %esp
	pushl	$512
	pushl	$0
	pushl	%eax
	call	memset
.LVL10:
	addl	$16, %esp
	.loc 1 46 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	log_write
.LVL11:
	addl	$16, %esp
	.loc 1 47 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	brelse
.LVL12:
	addl	$16, %esp
	.loc 1 48 0
	nop
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	bzero, .-bzero
	.section	.rodata
.LC0:
	.string	"balloc: out of blocks"
	.text
	.type	balloc, @function
balloc:
.LFB2:
	.loc 1 55 0
	.cfi_startproc
.LVL13:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 59 0
	movl	$0, -20(%ebp)
.LVL14:
	.loc 1 60 0
	movl	$0, -12(%ebp)
.LVL15:
	jmp	.L4
.LVL16:
.L10:
	.loc 1 61 0
	movl	-12(%ebp), %eax
.LVL17:
	leal	4095(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$12, %eax
	movl	%eax, %edx
	movl	sb+24, %eax
	addl	%edx, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	bread
.LVL18:
	addl	$16, %esp
	movl	%eax, -20(%ebp)
.LVL19:
	.loc 1 62 0
	movl	$0, -16(%ebp)
.LVL20:
	jmp	.L5
.LVL21:
.L9:
	.loc 1 63 0
	movl	-16(%ebp), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%eax, -24(%ebp)
.LVL22:
	.loc 1 64 0
	movl	-16(%ebp), %eax
.LVL23:
	leal	7(%eax), %edx
.LVL24:
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movzbl	24(%eax,%edx), %eax
	movzbl	%al, %eax
	andl	-24(%ebp), %eax
	testl	%eax, %eax
	jne	.L6
	.loc 1 65 0
	movl	-16(%ebp), %eax
	leal	7(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	movl	-20(%ebp), %edx
	movzbl	24(%edx,%eax), %edx
	movl	%edx, %ecx
	movl	-24(%ebp), %edx
	orl	%ecx, %edx
	movl	%edx, %ecx
	movl	-20(%ebp), %edx
	movb	%cl, 24(%edx,%eax)
	.loc 1 66 0
	subl	$12, %esp
	pushl	-20(%ebp)
	call	log_write
.LVL25:
	addl	$16, %esp
	.loc 1 67 0
	subl	$12, %esp
	pushl	-20(%ebp)
	call	brelse
.LVL26:
	addl	$16, %esp
	.loc 1 68 0
	movl	-12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	bzero
.LVL27:
	addl	$16, %esp
	.loc 1 69 0
	movl	-12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	jmp	.L11
.L6:
	.loc 1 62 0 discriminator 2
	addl	$1, -16(%ebp)
.LVL28:
.L5:
	.loc 1 62 0 is_stmt 0 discriminator 1
	cmpl	$4095, -16(%ebp)
	jg	.L8
	.loc 1 62 0 discriminator 3
	movl	-12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	sb, %eax
	cmpl	%eax, %edx
	jb	.L9
.L8:
	.loc 1 72 0 is_stmt 1 discriminator 2
	subl	$12, %esp
	pushl	-20(%ebp)
	call	brelse
.LVL29:
	addl	$16, %esp
	.loc 1 60 0 discriminator 2
	addl	$4096, -12(%ebp)
.LVL30:
.L4:
	.loc 1 60 0 is_stmt 0 discriminator 1
	movl	sb, %edx
	movl	-12(%ebp), %eax
	cmpl	%eax, %edx
	ja	.L10
	.loc 1 74 0 is_stmt 1
	subl	$12, %esp
	pushl	$.LC0
	call	panic
.LVL31:
.L11:
	.loc 1 75 0 discriminator 1
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	balloc, .-balloc
	.section	.rodata
.LC1:
	.string	"freeing free block"
	.text
	.type	bfree, @function
bfree:
.LFB3:
	.loc 1 80 0
	.cfi_startproc
.LVL32:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 84 0
	subl	$8, %esp
	pushl	$sb
	pushl	8(%ebp)
	call	readsb
.LVL33:
	addl	$16, %esp
	.loc 1 85 0
	movl	12(%ebp), %eax
	shrl	$12, %eax
	movl	%eax, %edx
	movl	sb+24, %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	bread
.LVL34:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL35:
	.loc 1 86 0
	movl	12(%ebp), %eax
.LVL36:
	andl	$4095, %eax
	movl	%eax, -16(%ebp)
.LVL37:
	.loc 1 87 0
	movl	-16(%ebp), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
.LVL38:
	andl	$7, %eax
	subl	%edx, %eax
	movl	$1, %edx
	movl	%eax, %ecx
	sall	%cl, %edx
	movl	%edx, %eax
	movl	%eax, -20(%ebp)
.LVL39:
	.loc 1 88 0
	movl	-16(%ebp), %eax
.LVL40:
	leal	7(%eax), %edx
.LVL41:
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movzbl	24(%eax,%edx), %eax
	movzbl	%al, %eax
	andl	-20(%ebp), %eax
	testl	%eax, %eax
	jne	.L13
	.loc 1 89 0
	subl	$12, %esp
	pushl	$.LC1
	call	panic
.LVL42:
.L13:
	.loc 1 90 0
	movl	-16(%ebp), %eax
	leal	7(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	movl	-12(%ebp), %edx
	movzbl	24(%edx,%eax), %edx
	movl	%edx, %ecx
	movl	-20(%ebp), %edx
	notl	%edx
	andl	%ecx, %edx
	movl	%edx, %ecx
	movl	-12(%ebp), %edx
	movb	%cl, 24(%edx,%eax)
	.loc 1 91 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	log_write
.LVL43:
	addl	$16, %esp
	.loc 1 92 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	brelse
.LVL44:
	addl	$16, %esp
	.loc 1 93 0
	nop
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	bfree, .-bfree
	.comm	icache,4052,32
	.section	.rodata
.LC2:
	.string	"icache"
	.align 4
.LC3:
	.string	"sb: size %d nblocks %d ninodes %d nlog %d logstart %d inodestart %d bmap start %d\n"
	.text
	.globl	iinit
	.type	iinit, @function
iinit:
.LFB4:
	.loc 1 164 0
	.cfi_startproc
.LVL45:
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
	.loc 1 165 0
	subl	$8, %esp
	pushl	$.LC2
	pushl	$icache
	call	initlock
.LVL46:
	addl	$16, %esp
	.loc 1 166 0
	subl	$8, %esp
	pushl	$sb
	pushl	8(%ebp)
	call	readsb
.LVL47:
	addl	$16, %esp
	.loc 1 167 0
	movl	sb+24, %eax
	movl	%eax, -28(%ebp)
	movl	sb+20, %edi
	movl	sb+16, %esi
	movl	sb+12, %ebx
	movl	sb+8, %ecx
	movl	sb+4, %edx
	movl	sb, %eax
	pushl	-28(%ebp)
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	$.LC3
	call	cprintf
.LVL48:
	addl	$32, %esp
	.loc 1 169 0
	nop
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
.LFE4:
	.size	iinit, .-iinit
	.section	.rodata
.LC4:
	.string	"ialloc: no inodes"
	.text
	.globl	ialloc
	.type	ialloc, @function
ialloc:
.LFB5:
	.loc 1 178 0
	.cfi_startproc
.LVL49:
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movw	%ax, -28(%ebp)
	.loc 1 183 0
	movl	$1, -12(%ebp)
.LVL50:
	jmp	.L16
.LVL51:
.L19:
	.loc 1 184 0
	movl	-12(%ebp), %eax
.LVL52:
	shrl	$3, %eax
	movl	%eax, %edx
	movl	sb+20, %eax
	addl	%edx, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	bread
.LVL53:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL54:
	.loc 1 185 0
	movl	-16(%ebp), %eax
	leal	24(%eax), %edx
	movl	-12(%ebp), %eax
.LVL55:
	andl	$7, %eax
	sall	$6, %eax
	addl	%edx, %eax
	movl	%eax, -20(%ebp)
.LVL56:
	.loc 1 186 0
	movl	-20(%ebp), %eax
	movzwl	(%eax), %eax
.LVL57:
	testw	%ax, %ax
	jne	.L17
	.loc 1 187 0
	subl	$4, %esp
	pushl	$64
	pushl	$0
	pushl	-20(%ebp)
	call	memset
.LVL58:
	addl	$16, %esp
	.loc 1 188 0
	movl	-20(%ebp), %eax
	movzwl	-28(%ebp), %edx
	movw	%dx, (%eax)
	.loc 1 189 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	log_write
.LVL59:
	addl	$16, %esp
	.loc 1 190 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	brelse
.LVL60:
	addl	$16, %esp
	.loc 1 191 0
	movl	-12(%ebp), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	iget
.LVL61:
	addl	$16, %esp
	jmp	.L20
.L17:
	.loc 1 193 0 discriminator 2
	subl	$12, %esp
	pushl	-16(%ebp)
	call	brelse
.LVL62:
	addl	$16, %esp
	.loc 1 183 0 discriminator 2
	addl	$1, -12(%ebp)
.LVL63:
.L16:
	.loc 1 183 0 is_stmt 0 discriminator 1
	movl	sb+8, %edx
	movl	-12(%ebp), %eax
	cmpl	%eax, %edx
	ja	.L19
	.loc 1 195 0 is_stmt 1
	subl	$12, %esp
	pushl	$.LC4
	call	panic
.LVL64:
.L20:
	.loc 1 196 0 discriminator 1
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	ialloc, .-ialloc
	.globl	iupdate
	.type	iupdate, @function
iupdate:
.LFB6:
	.loc 1 201 0
	.cfi_startproc
.LVL65:
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 205 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	shrl	$3, %eax
	movl	%eax, %edx
	movl	sb+20, %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	bread
.LVL66:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL67:
	.loc 1 206 0
	movl	-12(%ebp), %eax
	leal	24(%eax), %edx
	movl	8(%ebp), %eax
.LVL68:
	movl	4(%eax), %eax
	andl	$7, %eax
	sall	$6, %eax
	addl	%edx, %eax
	movl	%eax, -16(%ebp)
.LVL69:
	.loc 1 207 0
	movl	8(%ebp), %eax
.LVL70:
	movzwl	16(%eax), %edx
	movl	-16(%ebp), %eax
	movw	%dx, (%eax)
	.loc 1 208 0
	movl	8(%ebp), %eax
	movzwl	18(%eax), %edx
	movl	-16(%ebp), %eax
	movw	%dx, 2(%eax)
	.loc 1 209 0
	movl	8(%ebp), %eax
	movzwl	20(%eax), %edx
	movl	-16(%ebp), %eax
	movw	%dx, 4(%eax)
	.loc 1 210 0
	movl	8(%ebp), %eax
	movzwl	22(%eax), %edx
	movl	-16(%ebp), %eax
	movw	%dx, 6(%eax)
	.loc 1 211 0
	movl	8(%ebp), %eax
	movl	24(%eax), %edx
	movl	-16(%ebp), %eax
	movl	%edx, 8(%eax)
	.loc 1 212 0
	movl	8(%ebp), %eax
	leal	28(%eax), %edx
	movl	-16(%ebp), %eax
	addl	$12, %eax
	subl	$4, %esp
	pushl	$52
	pushl	%edx
	pushl	%eax
	call	memmove
.LVL71:
	addl	$16, %esp
	.loc 1 213 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	log_write
.LVL72:
	addl	$16, %esp
	.loc 1 214 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	brelse
.LVL73:
	addl	$16, %esp
	.loc 1 215 0
	nop
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	iupdate, .-iupdate
	.section	.rodata
.LC5:
	.string	"iget: no inodes"
	.text
	.type	iget, @function
iget:
.LFB7:
	.loc 1 222 0
	.cfi_startproc
.LVL74:
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 225 0
	subl	$12, %esp
	pushl	$icache
	call	acquire
.LVL75:
	addl	$16, %esp
	.loc 1 228 0
	movl	$0, -16(%ebp)
.LVL76:
	.loc 1 229 0
	movl	$icache+52, -12(%ebp)
.LVL77:
	jmp	.L23
.L27:
	.loc 1 230 0
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jle	.L24
	.loc 1 230 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	8(%ebp), %eax
	jne	.L24
	.loc 1 230 0 discriminator 2
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	12(%ebp), %eax
	jne	.L24
	.loc 1 231 0 is_stmt 1
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	leal	1(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	.loc 1 232 0
	subl	$12, %esp
	pushl	$icache
	call	release
.LVL78:
	addl	$16, %esp
	.loc 1 233 0
	movl	-12(%ebp), %eax
	jmp	.L25
.L24:
	.loc 1 235 0
	cmpl	$0, -16(%ebp)
	jne	.L26
	.loc 1 235 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L26
	.loc 1 236 0 is_stmt 1
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
.LVL79:
.L26:
	.loc 1 229 0 discriminator 2
	addl	$80, -12(%ebp)
.LVL80:
.L23:
	.loc 1 229 0 is_stmt 0 discriminator 1
	cmpl	$icache+4052, -12(%ebp)
	jb	.L27
	.loc 1 240 0 is_stmt 1
	cmpl	$0, -16(%ebp)
	jne	.L28
	.loc 1 241 0
	subl	$12, %esp
	pushl	$.LC5
	call	panic
.LVL81:
.L28:
	.loc 1 243 0
	movl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
.LVL82:
	.loc 1 244 0
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 245 0
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	.loc 1 246 0
	movl	-12(%ebp), %eax
	movl	$1, 8(%eax)
	.loc 1 247 0
	movl	-12(%ebp), %eax
	movl	$0, 12(%eax)
	.loc 1 248 0
	subl	$12, %esp
	pushl	$icache
	call	release
.LVL83:
	addl	$16, %esp
	.loc 1 250 0
	movl	-12(%ebp), %eax
.L25:
	.loc 1 251 0
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	iget, .-iget
	.globl	idup
	.type	idup, @function
idup:
.LFB8:
	.loc 1 257 0
	.cfi_startproc
.LVL84:
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 258 0
	subl	$12, %esp
	pushl	$icache
	call	acquire
.LVL85:
	addl	$16, %esp
	.loc 1 259 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	.loc 1 260 0
	subl	$12, %esp
	pushl	$icache
	call	release
.LVL86:
	addl	$16, %esp
	.loc 1 261 0
	movl	8(%ebp), %eax
	.loc 1 262 0
	leave
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	idup, .-idup
	.section	.rodata
.LC6:
	.string	"ilock"
.LC7:
	.string	"ilock: no type"
	.text
	.globl	ilock
	.type	ilock, @function
ilock:
.LFB9:
	.loc 1 268 0
	.cfi_startproc
.LVL87:
	pushl	%ebp
.LCFI27:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI28:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 272 0
	cmpl	$0, 8(%ebp)
	je	.L32
	.loc 1 272 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jg	.L33
.L32:
	.loc 1 273 0 is_stmt 1
	subl	$12, %esp
	pushl	$.LC6
	call	panic
.LVL88:
.L33:
	.loc 1 275 0
	subl	$12, %esp
	pushl	$icache
	call	acquire
.LVL89:
	addl	$16, %esp
	.loc 1 276 0
	jmp	.L34
.L35:
	.loc 1 277 0
	subl	$8, %esp
	pushl	$icache
	pushl	8(%ebp)
	call	sleep
.LVL90:
	addl	$16, %esp
.L34:
	.loc 1 276 0
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L35
	.loc 1 278 0
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	orl	$1, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 12(%eax)
	.loc 1 279 0
	subl	$12, %esp
	pushl	$icache
	call	release
.LVL91:
	addl	$16, %esp
	.loc 1 281 0
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	andl	$2, %eax
	testl	%eax, %eax
	jne	.L37
	.loc 1 282 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	shrl	$3, %eax
	movl	%eax, %edx
	movl	sb+20, %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	bread
.LVL92:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL93:
	.loc 1 283 0
	movl	-12(%ebp), %eax
	leal	24(%eax), %edx
	movl	8(%ebp), %eax
.LVL94:
	movl	4(%eax), %eax
	andl	$7, %eax
	sall	$6, %eax
	addl	%edx, %eax
	movl	%eax, -16(%ebp)
.LVL95:
	.loc 1 284 0
	movl	-16(%ebp), %eax
	movzwl	(%eax), %edx
	movl	8(%ebp), %eax
.LVL96:
	movw	%dx, 16(%eax)
	.loc 1 285 0
	movl	-16(%ebp), %eax
	movzwl	2(%eax), %edx
	movl	8(%ebp), %eax
	movw	%dx, 18(%eax)
	.loc 1 286 0
	movl	-16(%ebp), %eax
	movzwl	4(%eax), %edx
	movl	8(%ebp), %eax
	movw	%dx, 20(%eax)
	.loc 1 287 0
	movl	-16(%ebp), %eax
	movzwl	6(%eax), %edx
	movl	8(%ebp), %eax
	movw	%dx, 22(%eax)
	.loc 1 288 0
	movl	-16(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 24(%eax)
	.loc 1 289 0
	movl	-16(%ebp), %eax
	leal	12(%eax), %edx
	movl	8(%ebp), %eax
	addl	$28, %eax
	subl	$4, %esp
	pushl	$52
	pushl	%edx
	pushl	%eax
	call	memmove
.LVL97:
	addl	$16, %esp
	.loc 1 290 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	brelse
.LVL98:
	addl	$16, %esp
	.loc 1 291 0
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 12(%eax)
	.loc 1 292 0
	movl	8(%ebp), %eax
	movzwl	16(%eax), %eax
	testw	%ax, %ax
	jne	.L37
	.loc 1 293 0
	subl	$12, %esp
	pushl	$.LC7
	call	panic
.LVL99:
.L37:
	.loc 1 295 0
	nop
	leave
.LCFI29:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	ilock, .-ilock
	.section	.rodata
.LC8:
	.string	"iunlock"
	.text
	.globl	iunlock
	.type	iunlock, @function
iunlock:
.LFB10:
	.loc 1 300 0
	.cfi_startproc
.LVL100:
	pushl	%ebp
.LCFI30:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI31:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 301 0
	cmpl	$0, 8(%ebp)
	je	.L39
	.loc 1 301 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L39
	.loc 1 301 0 discriminator 2
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jg	.L40
.L39:
	.loc 1 302 0 is_stmt 1
	subl	$12, %esp
	pushl	$.LC8
	call	panic
.LVL101:
.L40:
	.loc 1 304 0
	subl	$12, %esp
	pushl	$icache
	call	acquire
.LVL102:
	addl	$16, %esp
	.loc 1 305 0
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	andl	$-2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 12(%eax)
	.loc 1 306 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	wakeup
.LVL103:
	addl	$16, %esp
	.loc 1 307 0
	subl	$12, %esp
	pushl	$icache
	call	release
.LVL104:
	addl	$16, %esp
	.loc 1 308 0
	nop
	leave
.LCFI32:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	iunlock, .-iunlock
	.section	.rodata
.LC9:
	.string	"iput busy"
	.text
	.globl	iput
	.type	iput, @function
iput:
.LFB11:
	.loc 1 319 0
	.cfi_startproc
.LVL105:
	pushl	%ebp
.LCFI33:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI34:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 320 0
	subl	$12, %esp
	pushl	$icache
	call	acquire
.LVL106:
	addl	$16, %esp
	.loc 1 321 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$1, %eax
	jne	.L42
	.loc 1 321 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L42
	.loc 1 321 0 discriminator 2
	movl	8(%ebp), %eax
	movzwl	22(%eax), %eax
	testw	%ax, %ax
	jne	.L42
	.loc 1 323 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L43
	.loc 1 324 0
	subl	$12, %esp
	pushl	$.LC9
	call	panic
.LVL107:
.L43:
	.loc 1 325 0
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	orl	$1, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 12(%eax)
	.loc 1 326 0
	subl	$12, %esp
	pushl	$icache
	call	release
.LVL108:
	addl	$16, %esp
	.loc 1 327 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	itrunc
.LVL109:
	addl	$16, %esp
	.loc 1 328 0
	movl	8(%ebp), %eax
	movw	$0, 16(%eax)
	.loc 1 329 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	iupdate
.LVL110:
	addl	$16, %esp
	.loc 1 330 0
	subl	$12, %esp
	pushl	$icache
	call	acquire
.LVL111:
	addl	$16, %esp
	.loc 1 331 0
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
	.loc 1 332 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	wakeup
.LVL112:
	addl	$16, %esp
.L42:
	.loc 1 334 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	.loc 1 335 0
	subl	$12, %esp
	pushl	$icache
	call	release
.LVL113:
	addl	$16, %esp
	.loc 1 336 0
	nop
	leave
.LCFI35:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	iput, .-iput
	.globl	iunlockput
	.type	iunlockput, @function
iunlockput:
.LFB12:
	.loc 1 341 0
	.cfi_startproc
.LVL114:
	pushl	%ebp
.LCFI36:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI37:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 342 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	iunlock
.LVL115:
	addl	$16, %esp
	.loc 1 343 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	iput
.LVL116:
	addl	$16, %esp
	.loc 1 344 0
	nop
	leave
.LCFI38:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	iunlockput, .-iunlockput
	.section	.rodata
.LC10:
	.string	"bmap: out of range"
	.text
	.type	bmap, @function
bmap:
.LFB13:
	.loc 1 358 0
	.cfi_startproc
.LVL117:
	pushl	%ebp
.LCFI39:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI40:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	.loc 1 362 0
	cmpl	$11, 12(%ebp)
	ja	.L46
	.loc 1 363 0
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	addl	$4, %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -12(%ebp)
.LVL118:
	cmpl	$0, -12(%ebp)
	jne	.L47
	.loc 1 364 0
	movl	8(%ebp), %eax
.LVL119:
	movl	(%eax), %eax
.LVL120:
	subl	$12, %esp
	pushl	%eax
.LVL121:
	call	balloc
.LVL122:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL123:
	movl	8(%ebp), %eax
.LVL124:
	movl	12(%ebp), %edx
	leal	4(%edx), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, 12(%eax,%ecx,4)
.L47:
	.loc 1 365 0
	movl	-12(%ebp), %eax
	jmp	.L48
.LVL125:
.L46:
	.loc 1 367 0
	subl	$12, 12(%ebp)
.LVL126:
	.loc 1 369 0
	cmpl	$127, 12(%ebp)
	ja	.L49
	.loc 1 371 0
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL127:
	cmpl	$0, -12(%ebp)
	jne	.L50
	.loc 1 372 0
	movl	8(%ebp), %eax
.LVL128:
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	balloc
.LVL129:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL130:
	movl	8(%ebp), %eax
.LVL131:
	movl	-12(%ebp), %edx
	movl	%edx, 76(%eax)
.L50:
	.loc 1 373 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	-12(%ebp)
	pushl	%eax
	call	bread
.LVL132:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL133:
	.loc 1 374 0
	movl	-16(%ebp), %eax
	addl	$24, %eax
.LVL134:
	movl	%eax, -20(%ebp)
.LVL135:
	.loc 1 375 0
	movl	12(%ebp), %eax
.LVL136:
	leal	0(,%eax,4), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL137:
	cmpl	$0, -12(%ebp)
	jne	.L51
	.loc 1 376 0
	movl	12(%ebp), %eax
.LVL138:
	leal	0(,%eax,4), %edx
	movl	-20(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	balloc
.LVL139:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL140:
	movl	-12(%ebp), %eax
	movl	%eax, (%ebx)
	.loc 1 377 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	log_write
.LVL141:
	addl	$16, %esp
.L51:
	.loc 1 379 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	brelse
.LVL142:
	addl	$16, %esp
	.loc 1 380 0
	movl	-12(%ebp), %eax
	jmp	.L48
.LVL143:
.L49:
	.loc 1 383 0
	subl	$12, %esp
	pushl	$.LC10
	call	panic
.LVL144:
.L48:
	.loc 1 384 0
	movl	-4(%ebp), %ebx
	leave
.LCFI41:
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	bmap, .-bmap
	.type	itrunc, @function
itrunc:
.LFB14:
	.loc 1 393 0
	.cfi_startproc
.LVL145:
	pushl	%ebp
.LCFI42:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI43:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 398 0
	movl	$0, -12(%ebp)
.LVL146:
	jmp	.L53
.L55:
	.loc 1 399 0
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	addl	$4, %edx
	movl	12(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L54
	.loc 1 400 0
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	addl	$4, %edx
	movl	12(%eax,%edx,4), %eax
	movl	8(%ebp), %edx
	movl	(%edx), %edx
	subl	$8, %esp
	pushl	%eax
	pushl	%edx
	call	bfree
.LVL147:
	addl	$16, %esp
	.loc 1 401 0
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	addl	$4, %edx
	movl	$0, 12(%eax,%edx,4)
.L54:
	.loc 1 398 0 discriminator 2
	addl	$1, -12(%ebp)
.L53:
	.loc 1 398 0 is_stmt 0 discriminator 1
	cmpl	$11, -12(%ebp)
	jle	.L55
	.loc 1 405 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	je	.L56
	.loc 1 406 0
	movl	8(%ebp), %eax
	movl	76(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	bread
.LVL148:
	addl	$16, %esp
	movl	%eax, -20(%ebp)
.LVL149:
	.loc 1 407 0
	movl	-20(%ebp), %eax
	addl	$24, %eax
.LVL150:
	movl	%eax, -24(%ebp)
.LVL151:
	.loc 1 408 0
	movl	$0, -16(%ebp)
.LVL152:
	jmp	.L57
.LVL153:
.L59:
	.loc 1 409 0
	movl	-16(%ebp), %eax
.LVL154:
	leal	0(,%eax,4), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L58
	.loc 1 410 0
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-24(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	8(%ebp), %edx
	movl	(%edx), %edx
	subl	$8, %esp
	pushl	%eax
	pushl	%edx
	call	bfree
.LVL155:
	addl	$16, %esp
.L58:
	.loc 1 408 0 discriminator 2
	addl	$1, -16(%ebp)
.L57:
	.loc 1 408 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	$127, %eax
	jbe	.L59
	.loc 1 412 0 is_stmt 1
	subl	$12, %esp
	pushl	-20(%ebp)
	call	brelse
.LVL156:
	addl	$16, %esp
	.loc 1 413 0
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	8(%ebp), %edx
	movl	(%edx), %edx
	subl	$8, %esp
	pushl	%eax
	pushl	%edx
	call	bfree
.LVL157:
	addl	$16, %esp
	.loc 1 414 0
	movl	8(%ebp), %eax
	movl	$0, 76(%eax)
.LVL158:
.L56:
	.loc 1 417 0
	movl	8(%ebp), %eax
	movl	$0, 24(%eax)
	.loc 1 418 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	iupdate
.LVL159:
	addl	$16, %esp
	.loc 1 419 0
	nop
	leave
.LCFI44:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	itrunc, .-itrunc
	.globl	stati
	.type	stati, @function
stati:
.LFB15:
	.loc 1 424 0
	.cfi_startproc
.LVL160:
	pushl	%ebp
.LCFI45:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI46:
	.cfi_def_cfa_register 5
	.loc 1 425 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%eax)
	.loc 1 426 0
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 8(%eax)
	.loc 1 427 0
	movl	8(%ebp), %eax
	movzwl	16(%eax), %edx
	movl	12(%ebp), %eax
	movw	%dx, (%eax)
	.loc 1 428 0
	movl	8(%ebp), %eax
	movzwl	22(%eax), %edx
	movl	12(%ebp), %eax
	movw	%dx, 12(%eax)
	.loc 1 429 0
	movl	8(%ebp), %eax
	movl	24(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 16(%eax)
	.loc 1 430 0
	nop
	popl	%ebp
.LCFI47:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	stati, .-stati
	.globl	readi
	.type	readi, @function
readi:
.LFB16:
	.loc 1 436 0
	.cfi_startproc
.LVL161:
	pushl	%ebp
.LCFI48:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI49:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 440 0
	movl	8(%ebp), %eax
	movzwl	16(%eax), %eax
	cmpw	$3, %ax
	jne	.L62
	.loc 1 441 0
	movl	8(%ebp), %eax
	movzwl	18(%eax), %eax
	testw	%ax, %ax
	js	.L63
	.loc 1 441 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movzwl	18(%eax), %eax
	cmpw	$9, %ax
	jg	.L63
	.loc 1 441 0 discriminator 2
	movl	8(%ebp), %eax
	movzwl	18(%eax), %eax
	cwtl
	movl	devsw(,%eax,8), %eax
	testl	%eax, %eax
	jne	.L64
.L63:
	.loc 1 442 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L65
.L64:
	.loc 1 443 0
	movl	8(%ebp), %eax
	movzwl	18(%eax), %eax
	cwtl
	movl	devsw(,%eax,8), %eax
	movl	20(%ebp), %edx
	subl	$4, %esp
	pushl	%edx
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
.LVL162:
	addl	$16, %esp
	jmp	.L65
.L62:
	.loc 1 446 0
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	cmpl	16(%ebp), %eax
	jb	.L66
	.loc 1 446 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	cmpl	16(%ebp), %eax
	jnb	.L67
.L66:
	.loc 1 447 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L65
.L67:
	.loc 1 448 0
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	cmpl	%eax, %edx
	jbe	.L68
	.loc 1 449 0
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	subl	16(%ebp), %eax
	movl	%eax, 20(%ebp)
.LVL163:
.L68:
	.loc 1 451 0
	movl	$0, -12(%ebp)
.LVL164:
	jmp	.L69
.LVL165:
.L70:
	.loc 1 452 0 discriminator 3
	movl	16(%ebp), %eax
.LVL166:
	shrl	$9, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	bmap
.LVL167:
	addl	$16, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	bread
.LVL168:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL169:
	.loc 1 453 0 discriminator 3
	movl	16(%ebp), %eax
.LVL170:
	andl	$511, %eax
	movl	$512, %edx
	subl	%eax, %edx
	movl	20(%ebp), %eax
	subl	-12(%ebp), %eax
	cmpl	%eax, %edx
	cmovbe	%edx, %eax
	movl	%eax, -20(%ebp)
.LVL171:
	.loc 1 454 0 discriminator 3
	movl	-16(%ebp), %eax
.LVL172:
	leal	24(%eax), %edx
	movl	16(%ebp), %eax
	andl	$511, %eax
	addl	%edx, %eax
	subl	$4, %esp
	pushl	-20(%ebp)
	pushl	%eax
	pushl	12(%ebp)
	call	memmove
.LVL173:
	addl	$16, %esp
	.loc 1 455 0 discriminator 3
	subl	$12, %esp
	pushl	-16(%ebp)
	call	brelse
.LVL174:
	addl	$16, %esp
	.loc 1 451 0 discriminator 3
	movl	-20(%ebp), %eax
	addl	%eax, -12(%ebp)
	movl	-20(%ebp), %eax
	addl	%eax, 16(%ebp)
	movl	-20(%ebp), %eax
	addl	%eax, 12(%ebp)
.LVL175:
.L69:
	.loc 1 451 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	20(%ebp), %eax
	jb	.L70
	.loc 1 457 0 is_stmt 1
	movl	20(%ebp), %eax
.LVL176:
.L65:
	.loc 1 458 0
	leave
.LCFI50:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	readi, .-readi
	.globl	writei
	.type	writei, @function
writei:
.LFB17:
	.loc 1 464 0
	.cfi_startproc
.LVL177:
	pushl	%ebp
.LCFI51:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI52:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 468 0
	movl	8(%ebp), %eax
	movzwl	16(%eax), %eax
	cmpw	$3, %ax
	jne	.L72
	.loc 1 469 0
	movl	8(%ebp), %eax
	movzwl	18(%eax), %eax
	testw	%ax, %ax
	js	.L73
	.loc 1 469 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movzwl	18(%eax), %eax
	cmpw	$9, %ax
	jg	.L73
	.loc 1 469 0 discriminator 2
	movl	8(%ebp), %eax
	movzwl	18(%eax), %eax
	cwtl
	movl	devsw+4(,%eax,8), %eax
	testl	%eax, %eax
	jne	.L74
.L73:
	.loc 1 470 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L75
.L74:
	.loc 1 471 0
	movl	8(%ebp), %eax
	movzwl	18(%eax), %eax
	cwtl
	movl	devsw+4(,%eax,8), %eax
	movl	20(%ebp), %edx
	subl	$4, %esp
	pushl	%edx
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	*%eax
.LVL178:
	addl	$16, %esp
	jmp	.L75
.L72:
	.loc 1 474 0
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	cmpl	16(%ebp), %eax
	jb	.L76
	.loc 1 474 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	cmpl	16(%ebp), %eax
	jnb	.L77
.L76:
	.loc 1 475 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L75
.L77:
	.loc 1 476 0
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	addl	%edx, %eax
	cmpl	$71680, %eax
	jbe	.L78
	.loc 1 477 0
	movl	$-1, %eax
	jmp	.L75
.L78:
	.loc 1 479 0
	movl	$0, -12(%ebp)
.LVL179:
	jmp	.L79
.LVL180:
.L80:
	.loc 1 480 0 discriminator 3
	movl	16(%ebp), %eax
.LVL181:
	shrl	$9, %eax
	subl	$8, %esp
	pushl	%eax
	pushl	8(%ebp)
	call	bmap
.LVL182:
	addl	$16, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	%edx
	pushl	%eax
	call	bread
.LVL183:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL184:
	.loc 1 481 0 discriminator 3
	movl	16(%ebp), %eax
.LVL185:
	andl	$511, %eax
	movl	$512, %edx
	subl	%eax, %edx
	movl	20(%ebp), %eax
	subl	-12(%ebp), %eax
	cmpl	%eax, %edx
	cmovbe	%edx, %eax
	movl	%eax, -20(%ebp)
.LVL186:
	.loc 1 482 0 discriminator 3
	movl	-16(%ebp), %eax
.LVL187:
	leal	24(%eax), %edx
	movl	16(%ebp), %eax
	andl	$511, %eax
	addl	%edx, %eax
	subl	$4, %esp
	pushl	-20(%ebp)
	pushl	12(%ebp)
	pushl	%eax
	call	memmove
.LVL188:
	addl	$16, %esp
	.loc 1 483 0 discriminator 3
	subl	$12, %esp
	pushl	-16(%ebp)
	call	log_write
.LVL189:
	addl	$16, %esp
	.loc 1 484 0 discriminator 3
	subl	$12, %esp
	pushl	-16(%ebp)
	call	brelse
.LVL190:
	addl	$16, %esp
	.loc 1 479 0 discriminator 3
	movl	-20(%ebp), %eax
	addl	%eax, -12(%ebp)
	movl	-20(%ebp), %eax
	addl	%eax, 16(%ebp)
	movl	-20(%ebp), %eax
	addl	%eax, 12(%ebp)
.LVL191:
.L79:
	.loc 1 479 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	20(%ebp), %eax
	jb	.L80
	.loc 1 487 0 is_stmt 1
	cmpl	$0, 20(%ebp)
	je	.L81
	.loc 1 487 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	cmpl	16(%ebp), %eax
	jnb	.L81
	.loc 1 488 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 24(%eax)
	.loc 1 489 0
	subl	$12, %esp
	pushl	8(%ebp)
	call	iupdate
.LVL192:
	addl	$16, %esp
.L81:
	.loc 1 491 0
	movl	20(%ebp), %eax
.LVL193:
.L75:
	.loc 1 492 0
	leave
.LCFI53:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	writei, .-writei
	.globl	namecmp
	.type	namecmp, @function
namecmp:
.LFB18:
	.loc 1 499 0
	.cfi_startproc
.LVL194:
	pushl	%ebp
.LCFI54:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI55:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 500 0
	subl	$4, %esp
	pushl	$14
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	strncmp
.LVL195:
	addl	$16, %esp
	.loc 1 501 0
	leave
.LCFI56:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	namecmp, .-namecmp
	.section	.rodata
.LC11:
	.string	"dirlookup not DIR"
.LC12:
	.string	"dirlink read"
	.text
	.globl	dirlookup
	.type	dirlookup, @function
dirlookup:
.LFB19:
	.loc 1 507 0
	.cfi_startproc
.LVL196:
	pushl	%ebp
.LCFI57:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI58:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 511 0
	movl	8(%ebp), %eax
	movzwl	16(%eax), %eax
	cmpw	$1, %ax
	je	.L85
	.loc 1 512 0
	subl	$12, %esp
	pushl	$.LC11
	call	panic
.LVL197:
.L85:
	.loc 1 514 0
	movl	$0, -12(%ebp)
.LVL198:
	jmp	.L86
.L92:
	.loc 1 515 0
	pushl	$16
	pushl	-12(%ebp)
	leal	-32(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	readi
.LVL199:
	addl	$16, %esp
	cmpl	$16, %eax
	je	.L87
	.loc 1 516 0
	subl	$12, %esp
	pushl	$.LC12
	call	panic
.LVL200:
.L87:
	.loc 1 517 0
	movzwl	-32(%ebp), %eax
	testw	%ax, %ax
	je	.L94
	.loc 1 519 0
	subl	$8, %esp
	leal	-32(%ebp), %eax
	addl	$2, %eax
	pushl	%eax
	pushl	12(%ebp)
	call	namecmp
.LVL201:
	addl	$16, %esp
	testl	%eax, %eax
	jne	.L89
	.loc 1 521 0
	cmpl	$0, 16(%ebp)
	je	.L90
	.loc 1 522 0
	movl	16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
.L90:
	.loc 1 523 0
	movzwl	-32(%ebp), %eax
	movzwl	%ax, %eax
	movl	%eax, -16(%ebp)
.LVL202:
	.loc 1 524 0
	movl	8(%ebp), %eax
.LVL203:
	movl	(%eax), %eax
	subl	$8, %esp
	pushl	-16(%ebp)
	pushl	%eax
	call	iget
.LVL204:
	addl	$16, %esp
	jmp	.L93
.LVL205:
.L94:
	.loc 1 518 0
	nop
.L89:
	.loc 1 514 0 discriminator 2
	addl	$16, -12(%ebp)
.L86:
	.loc 1 514 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	.L92
	.loc 1 528 0 is_stmt 1
	movl	$0, %eax
.L93:
	.loc 1 529 0 discriminator 1
	leave
.LCFI59:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	dirlookup, .-dirlookup
	.section	.rodata
.LC13:
	.string	"dirlink"
	.text
	.globl	dirlink
	.type	dirlink, @function
dirlink:
.LFB20:
	.loc 1 534 0
	.cfi_startproc
.LVL206:
	pushl	%ebp
.LCFI60:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI61:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 540 0
	subl	$4, %esp
	pushl	$0
	pushl	12(%ebp)
	pushl	8(%ebp)
	call	dirlookup
.LVL207:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL208:
	cmpl	$0, -16(%ebp)
	je	.L96
	.loc 1 541 0
	subl	$12, %esp
	pushl	-16(%ebp)
	call	iput
.LVL209:
	addl	$16, %esp
	.loc 1 542 0
	movl	$-1, %eax
	jmp	.L104
.LVL210:
.L96:
	.loc 1 546 0
	movl	$0, -12(%ebp)
.LVL211:
	jmp	.L98
.LVL212:
.L102:
	.loc 1 547 0
	movl	-12(%ebp), %eax
.LVL213:
	pushl	$16
	pushl	%eax
	leal	-32(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	readi
.LVL214:
	addl	$16, %esp
	cmpl	$16, %eax
	je	.L99
	.loc 1 548 0
	subl	$12, %esp
	pushl	$.LC12
	call	panic
.LVL215:
.L99:
	.loc 1 549 0
	movzwl	-32(%ebp), %eax
	testw	%ax, %ax
	je	.L105
	.loc 1 546 0 discriminator 2
	movl	-12(%ebp), %eax
	addl	$16, %eax
	movl	%eax, -12(%ebp)
.LVL216:
.L98:
	.loc 1 546 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	24(%eax), %edx
	movl	-12(%ebp), %eax
	cmpl	%eax, %edx
	ja	.L102
	jmp	.L101
.L105:
	.loc 1 550 0 is_stmt 1
	nop
.L101:
	.loc 1 553 0
	subl	$4, %esp
	pushl	$14
	pushl	12(%ebp)
	leal	-32(%ebp), %eax
	addl	$2, %eax
	pushl	%eax
	call	strncpy
.LVL217:
	addl	$16, %esp
	.loc 1 554 0
	movl	16(%ebp), %eax
	movw	%ax, -32(%ebp)
	.loc 1 555 0
	movl	-12(%ebp), %eax
	pushl	$16
	pushl	%eax
	leal	-32(%ebp), %eax
	pushl	%eax
	pushl	8(%ebp)
	call	writei
.LVL218:
	addl	$16, %esp
	cmpl	$16, %eax
	je	.L103
	.loc 1 556 0
	subl	$12, %esp
	pushl	$.LC13
	call	panic
.LVL219:
.L103:
	.loc 1 558 0
	movl	$0, %eax
.LVL220:
.L104:
	.loc 1 559 0 discriminator 1
	leave
.LCFI62:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	dirlink, .-dirlink
	.type	skipelem, @function
skipelem:
.LFB21:
	.loc 1 578 0
	.cfi_startproc
.LVL221:
	pushl	%ebp
.LCFI63:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI64:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 582 0
	jmp	.L107
.L108:
	.loc 1 583 0
	addl	$1, 8(%ebp)
.LVL222:
.L107:
	.loc 1 582 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	je	.L108
	.loc 1 584 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L109
	.loc 1 585 0
	movl	$0, %eax
	jmp	.L110
.L109:
	.loc 1 586 0
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
.LVL223:
	.loc 1 587 0
	jmp	.L111
.LVL224:
.L113:
	.loc 1 588 0
	addl	$1, 8(%ebp)
.LVL225:
.L111:
	.loc 1 587 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	je	.L112
	.loc 1 587 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L113
.L112:
	.loc 1 589 0 is_stmt 1
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -16(%ebp)
.LVL226:
	.loc 1 590 0
	cmpl	$13, -16(%ebp)
	jle	.L114
	.loc 1 591 0
	subl	$4, %esp
	pushl	$14
	pushl	-12(%ebp)
	pushl	12(%ebp)
	call	memmove
.LVL227:
	addl	$16, %esp
	jmp	.L116
.LVL228:
.L114:
	.loc 1 593 0
	movl	-16(%ebp), %eax
.LVL229:
	subl	$4, %esp
	pushl	%eax
	pushl	-12(%ebp)
	pushl	12(%ebp)
	call	memmove
.LVL230:
	addl	$16, %esp
	.loc 1 594 0
	movl	-16(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
	.loc 1 596 0
	jmp	.L116
.L117:
	.loc 1 597 0
	addl	$1, 8(%ebp)
.LVL231:
.L116:
	.loc 1 596 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	je	.L117
	.loc 1 598 0
	movl	8(%ebp), %eax
.LVL232:
.L110:
	.loc 1 599 0
	leave
.LCFI65:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	skipelem, .-skipelem
	.type	namex, @function
namex:
.LFB22:
	.loc 1 607 0
	.cfi_startproc
.LVL233:
	pushl	%ebp
.LCFI66:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI67:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 610 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jne	.L119
	.loc 1 611 0
	subl	$8, %esp
	pushl	$1
	pushl	$1
	call	iget
.LVL234:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL235:
	jmp	.L121
.LVL236:
.L119:
	.loc 1 613 0
	movl	%gs:4, %eax
	movl	104(%eax), %eax
	subl	$12, %esp
	pushl	%eax
	call	idup
.LVL237:
	addl	$16, %esp
	movl	%eax, -12(%ebp)
.LVL238:
	.loc 1 615 0
	jmp	.L121
.LVL239:
.L126:
	.loc 1 616 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	ilock
.LVL240:
	addl	$16, %esp
	.loc 1 617 0
	movl	-12(%ebp), %eax
	movzwl	16(%eax), %eax
	cmpw	$1, %ax
	je	.L122
	.loc 1 618 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	iunlockput
.LVL241:
	addl	$16, %esp
	.loc 1 619 0
	movl	$0, %eax
	jmp	.L123
.L122:
	.loc 1 621 0
	cmpl	$0, 12(%ebp)
	je	.L124
	.loc 1 621 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L124
	.loc 1 623 0 is_stmt 1
	subl	$12, %esp
	pushl	-12(%ebp)
	call	iunlock
.LVL242:
	addl	$16, %esp
	.loc 1 624 0
	movl	-12(%ebp), %eax
	jmp	.L123
.L124:
	.loc 1 626 0
	subl	$4, %esp
	pushl	$0
	pushl	16(%ebp)
	pushl	-12(%ebp)
	call	dirlookup
.LVL243:
	addl	$16, %esp
	movl	%eax, -16(%ebp)
.LVL244:
	cmpl	$0, -16(%ebp)
	jne	.L125
	.loc 1 627 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	iunlockput
.LVL245:
	addl	$16, %esp
	.loc 1 628 0
	movl	$0, %eax
	jmp	.L123
.LVL246:
.L125:
	.loc 1 630 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	iunlockput
.LVL247:
	addl	$16, %esp
	.loc 1 631 0
	movl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
.LVL248:
.L121:
	.loc 1 615 0
	subl	$8, %esp
	pushl	16(%ebp)
	pushl	8(%ebp)
	call	skipelem
.LVL249:
	addl	$16, %esp
	movl	%eax, 8(%ebp)
.LVL250:
	cmpl	$0, 8(%ebp)
	jne	.L126
	.loc 1 633 0
	cmpl	$0, 12(%ebp)
	je	.L127
	.loc 1 634 0
	subl	$12, %esp
	pushl	-12(%ebp)
	call	iput
.LVL251:
	addl	$16, %esp
	.loc 1 635 0
	movl	$0, %eax
	jmp	.L123
.LVL252:
.L127:
	.loc 1 637 0
	movl	-12(%ebp), %eax
.LVL253:
.L123:
	.loc 1 638 0
	leave
.LCFI68:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	namex, .-namex
	.globl	namei
	.type	namei, @function
namei:
.LFB23:
	.loc 1 642 0
	.cfi_startproc
.LVL254:
	pushl	%ebp
.LCFI69:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI70:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 644 0
	subl	$4, %esp
	leal	-22(%ebp), %eax
	pushl	%eax
	pushl	$0
	pushl	8(%ebp)
	call	namex
.LVL255:
	addl	$16, %esp
	.loc 1 645 0
	leave
.LCFI71:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	namei, .-namei
	.globl	nameiparent
	.type	nameiparent, @function
nameiparent:
.LFB24:
	.loc 1 649 0
	.cfi_startproc
.LVL256:
	pushl	%ebp
.LCFI72:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI73:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 650 0
	subl	$4, %esp
	pushl	12(%ebp)
	pushl	$1
	pushl	8(%ebp)
	call	namex
.LVL257:
	addl	$16, %esp
	.loc 1 651 0
	leave
.LCFI74:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	nameiparent, .-nameiparent
.Letext0:
	.file 2 "types.h"
	.file 3 "stat.h"
	.file 4 "mmu.h"
	.file 5 "proc.h"
	.file 6 "file.h"
	.file 7 "spinlock.h"
	.file 8 "fs.h"
	.file 9 "buf.h"
	.file 10 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1693
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF136
	.byte	0xc
	.long	.LASF137
	.long	.LASF138
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
	.long	.LASF11
	.byte	0x14
	.byte	0x3
	.byte	0x5
	.long	0xb9
	.uleb128 0x5
	.long	.LASF7
	.byte	0x3
	.byte	0x6
	.long	0xb9
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"dev"
	.byte	0x3
	.byte	0x7
	.long	0xc0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ino"
	.byte	0x3
	.byte	0x8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF8
	.byte	0x3
	.byte	0x9
	.long	0xb9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF9
	.byte	0x3
	.byte	0xa
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	.LASF12
	.byte	0x8
	.byte	0x4
	.byte	0x34
	.long	0x1aa
	.uleb128 0x8
	.long	.LASF13
	.byte	0x4
	.byte	0x35
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x4
	.byte	0x36
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.long	.LASF15
	.byte	0x4
	.byte	0x37
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.long	.LASF7
	.byte	0x4
	.byte	0x38
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
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
	.uleb128 0x9
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
	.uleb128 0x9
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
	.uleb128 0x8
	.long	.LASF16
	.byte	0x4
	.byte	0x3c
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
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
	.uleb128 0x8
	.long	.LASF17
	.byte	0x4
	.byte	0x3e
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
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
	.uleb128 0x9
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
	.uleb128 0x8
	.long	.LASF18
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
	.long	.LASF19
	.byte	0x68
	.byte	0x4
	.byte	0x97
	.long	0x3b5
	.uleb128 0x5
	.long	.LASF20
	.byte	0x4
	.byte	0x98
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF21
	.byte	0x4
	.byte	0x99
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ss0"
	.byte	0x4
	.byte	0x9a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF22
	.byte	0x4
	.byte	0x9b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x5
	.long	.LASF23
	.byte	0x4
	.byte	0x9c
	.long	0x3b5
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"ss1"
	.byte	0x4
	.byte	0x9d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF24
	.byte	0x4
	.byte	0x9e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x5
	.long	.LASF25
	.byte	0x4
	.byte	0x9f
	.long	0x3b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"ss2"
	.byte	0x4
	.byte	0xa0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.long	.LASF26
	.byte	0x4
	.byte	0xa1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x6
	.string	"cr3"
	.byte	0x4
	.byte	0xa2
	.long	0x3bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.string	"eip"
	.byte	0x4
	.byte	0xa3
	.long	0x3b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.long	.LASF27
	.byte	0x4
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.string	"eax"
	.byte	0x4
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.string	"ecx"
	.byte	0x4
	.byte	0xa6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x6
	.string	"edx"
	.byte	0x4
	.byte	0xa7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x6
	.string	"ebx"
	.byte	0x4
	.byte	0xa8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x6
	.string	"esp"
	.byte	0x4
	.byte	0xa9
	.long	0x3b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x6
	.string	"ebp"
	.byte	0x4
	.byte	0xaa
	.long	0x3b5
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x6
	.string	"esi"
	.byte	0x4
	.byte	0xab
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x6
	.string	"edi"
	.byte	0x4
	.byte	0xac
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.string	"es"
	.byte	0x4
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x5
	.long	.LASF28
	.byte	0x4
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x6
	.string	"cs"
	.byte	0x4
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x5
	.long	.LASF29
	.byte	0x4
	.byte	0xb0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x6
	.string	"ss"
	.byte	0x4
	.byte	0xb1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x5
	.long	.LASF30
	.byte	0x4
	.byte	0xb2
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x6
	.string	"ds"
	.byte	0x4
	.byte	0xb3
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x5
	.long	.LASF31
	.byte	0x4
	.byte	0xb4
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x6
	.string	"fs"
	.byte	0x4
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x5
	.long	.LASF32
	.byte	0x4
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x6
	.string	"gs"
	.byte	0x4
	.byte	0xb7
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x5
	.long	.LASF33
	.byte	0x4
	.byte	0xb8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x6
	.string	"ldt"
	.byte	0x4
	.byte	0xb9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x5
	.long	.LASF34
	.byte	0x4
	.byte	0xba
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x6
	.string	"t"
	.byte	0x4
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x5
	.long	.LASF35
	.byte	0x4
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x25
	.uleb128 0xb
	.byte	0x4
	.uleb128 0xc
	.string	"cpu"
	.byte	0xbc
	.byte	0x5
	.byte	0x5
	.long	0x44b
	.uleb128 0x6
	.string	"id"
	.byte	0x5
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF36
	.byte	0x5
	.byte	0x7
	.long	0x49e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ts"
	.byte	0x5
	.byte	0x8
	.long	0x1aa
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"gdt"
	.byte	0x5
	.byte	0x9
	.long	0x4a4
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x5
	.long	.LASF37
	.byte	0x5
	.byte	0xa
	.long	0x4bb
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x5
	.long	.LASF38
	.byte	0x5
	.byte	0xb
	.long	0xc0
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x5
	.long	.LASF39
	.byte	0x5
	.byte	0xc
	.long	0xc0
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x6
	.string	"cpu"
	.byte	0x5
	.byte	0xf
	.long	0x4c0
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x5
	.long	.LASF40
	.byte	0x5
	.byte	0x10
	.long	0x587
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x4
	.long	.LASF41
	.byte	0x14
	.byte	0x5
	.byte	0x2c
	.long	0x49e
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
	.uleb128 0xa
	.byte	0x4
	.long	0x44b
	.uleb128 0xd
	.long	0xc7
	.long	0x4b4
	.uleb128 0xe
	.long	0x4b4
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF42
	.uleb128 0xf
	.long	0x25
	.uleb128 0xa
	.byte	0x4
	.long	0x3bd
	.uleb128 0x4
	.long	.LASF40
	.byte	0x7c
	.byte	0x5
	.byte	0x37
	.long	0x587
	.uleb128 0x6
	.string	"sz"
	.byte	0x5
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF43
	.byte	0x5
	.byte	0x39
	.long	0x5c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF44
	.byte	0x5
	.byte	0x3a
	.long	0x5c8
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF45
	.byte	0x5
	.byte	0x3b
	.long	0x58d
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"pid"
	.byte	0x5
	.byte	0x3c
	.long	0xc0
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF46
	.byte	0x5
	.byte	0x3d
	.long	0x587
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"tf"
	.byte	0x5
	.byte	0x3e
	.long	0x5db
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.long	.LASF41
	.byte	0x5
	.byte	0x3f
	.long	0x49e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.long	.LASF47
	.byte	0x5
	.byte	0x40
	.long	0x3bb
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.long	.LASF48
	.byte	0x5
	.byte	0x41
	.long	0xc0
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.long	.LASF49
	.byte	0x5
	.byte	0x42
	.long	0x5e1
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.string	"cwd"
	.byte	0x5
	.byte	0x43
	.long	0x6fe
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x5
	.long	.LASF50
	.byte	0x5
	.byte	0x44
	.long	0x704
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x4c6
	.uleb128 0x10
	.long	.LASF139
	.byte	0x4
	.long	0x30
	.byte	0x5
	.byte	0x34
	.long	0x5c2
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
	.uleb128 0xa
	.byte	0x4
	.long	0x5b
	.uleb128 0xa
	.byte	0x4
	.long	0x5ce
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF57
	.uleb128 0x12
	.long	.LASF87
	.byte	0x1
	.uleb128 0xa
	.byte	0x4
	.long	0x5d5
	.uleb128 0xd
	.long	0x5f1
	.long	0x5f1
	.uleb128 0xe
	.long	0x4b4
	.byte	0xf
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x5f7
	.uleb128 0x4
	.long	.LASF58
	.byte	0x18
	.byte	0x6
	.byte	0x1
	.long	0x665
	.uleb128 0x5
	.long	.LASF7
	.byte	0x6
	.byte	0x2
	.long	0x909
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"ref"
	.byte	0x6
	.byte	0x3
	.long	0xc0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF59
	.byte	0x6
	.byte	0x4
	.long	0x5ce
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF60
	.byte	0x6
	.byte	0x5
	.long	0x5ce
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x5
	.long	.LASF61
	.byte	0x6
	.byte	0x6
	.long	0x92e
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"ip"
	.byte	0x6
	.byte	0x7
	.long	0x6fe
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
	.uleb128 0x4
	.long	.LASF62
	.byte	0x50
	.byte	0x6
	.byte	0xd
	.long	0x6fe
	.uleb128 0x6
	.string	"dev"
	.byte	0x6
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF63
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
	.long	0xc0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF64
	.byte	0x6
	.byte	0x11
	.long	0xc0
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF7
	.byte	0x6
	.byte	0x13
	.long	0xb9
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF65
	.byte	0x6
	.byte	0x14
	.long	0xb9
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x5
	.long	.LASF66
	.byte	0x6
	.byte	0x15
	.long	0xb9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.long	.LASF8
	.byte	0x6
	.byte	0x16
	.long	0xb9
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x5
	.long	.LASF9
	.byte	0x6
	.byte	0x17
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.long	.LASF67
	.byte	0x6
	.byte	0x18
	.long	0x839
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x665
	.uleb128 0xd
	.long	0x5ce
	.long	0x714
	.uleb128 0xe
	.long	0x4b4
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF68
	.byte	0x34
	.byte	0x7
	.byte	0x2
	.long	0x759
	.uleb128 0x5
	.long	.LASF69
	.byte	0x7
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF50
	.byte	0x7
	.byte	0x6
	.long	0x5c8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"cpu"
	.byte	0x7
	.byte	0x7
	.long	0x4c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pcs"
	.byte	0x7
	.byte	0x8
	.long	0x759
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0xd
	.long	0x25
	.long	0x769
	.uleb128 0xe
	.long	0x4b4
	.byte	0x9
	.byte	0
	.uleb128 0x4
	.long	.LASF70
	.byte	0x1c
	.byte	0x8
	.byte	0xd
	.long	0x7d8
	.uleb128 0x5
	.long	.LASF9
	.byte	0x8
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF71
	.byte	0x8
	.byte	0xf
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF72
	.byte	0x8
	.byte	0x10
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF73
	.byte	0x8
	.byte	0x11
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF74
	.byte	0x8
	.byte	0x12
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF75
	.byte	0x8
	.byte	0x13
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.long	.LASF76
	.byte	0x8
	.byte	0x14
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0
	.uleb128 0x4
	.long	.LASF77
	.byte	0x40
	.byte	0x8
	.byte	0x1c
	.long	0x839
	.uleb128 0x5
	.long	.LASF7
	.byte	0x8
	.byte	0x1d
	.long	0xb9
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF65
	.byte	0x8
	.byte	0x1e
	.long	0xb9
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x5
	.long	.LASF66
	.byte	0x8
	.byte	0x1f
	.long	0xb9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF8
	.byte	0x8
	.byte	0x20
	.long	0xb9
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x5
	.long	.LASF9
	.byte	0x8
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF67
	.byte	0x8
	.byte	0x22
	.long	0x839
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0xd
	.long	0x25
	.long	0x849
	.uleb128 0xe
	.long	0x4b4
	.byte	0xc
	.byte	0
	.uleb128 0x4
	.long	.LASF78
	.byte	0x10
	.byte	0x8
	.byte	0x34
	.long	0x872
	.uleb128 0x5
	.long	.LASF63
	.byte	0x8
	.byte	0x35
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF50
	.byte	0x8
	.byte	0x36
	.long	0x872
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0xd
	.long	0x5ce
	.long	0x882
	.uleb128 0xe
	.long	0x4b4
	.byte	0xd
	.byte	0
	.uleb128 0x13
	.string	"buf"
	.value	0x218
	.byte	0x9
	.byte	0x1
	.long	0x8f2
	.uleb128 0x5
	.long	.LASF64
	.byte	0x9
	.byte	0x2
	.long	0xc0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"dev"
	.byte	0x9
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF79
	.byte	0x9
	.byte	0x4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF80
	.byte	0x9
	.byte	0x5
	.long	0x8f2
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF81
	.byte	0x9
	.byte	0x6
	.long	0x8f2
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF82
	.byte	0x9
	.byte	0x7
	.long	0x8f2
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.long	.LASF83
	.byte	0x9
	.byte	0x8
	.long	0x8f8
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x882
	.uleb128 0xd
	.long	0x49
	.long	0x909
	.uleb128 0x14
	.long	0x4b4
	.value	0x1ff
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.long	0x30
	.byte	0x6
	.byte	0x2
	.long	0x928
	.uleb128 0x11
	.long	.LASF84
	.byte	0
	.uleb128 0x11
	.long	.LASF85
	.byte	0x1
	.uleb128 0x11
	.long	.LASF86
	.byte	0x2
	.byte	0
	.uleb128 0x12
	.long	.LASF61
	.byte	0x1
	.uleb128 0xa
	.byte	0x4
	.long	0x928
	.uleb128 0x4
	.long	.LASF88
	.byte	0x8
	.byte	0x6
	.byte	0x1f
	.long	0x95d
	.uleb128 0x5
	.long	.LASF89
	.byte	0x6
	.byte	0x20
	.long	0x977
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF90
	.byte	0x6
	.byte	0x21
	.long	0x977
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	0xc0
	.long	0x977
	.uleb128 0x17
	.long	0x6fe
	.uleb128 0x17
	.long	0x5c8
	.uleb128 0x17
	.long	0xc0
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x95d
	.uleb128 0x18
	.value	0xfd4
	.byte	0x1
	.byte	0x9d
	.long	0x9a3
	.uleb128 0x5
	.long	.LASF91
	.byte	0x1
	.byte	0x9e
	.long	0x714
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF62
	.byte	0x1
	.byte	0x9f
	.long	0x9a3
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0xd
	.long	0x665
	.long	0x9b3
	.uleb128 0xe
	.long	0x4b4
	.byte	0x31
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF94
	.byte	0x1
	.byte	0x1d
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xa12
	.uleb128 0x1a
	.string	"dev"
	.byte	0x1
	.byte	0x1d
	.long	0xc0
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.string	"sb"
	.byte	0x1
	.byte	0x1d
	.long	0xa12
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.string	"bp"
	.byte	0x1
	.byte	0x1f
	.long	0x8f2
	.long	.LLST1
	.uleb128 0x1c
	.long	.LVL1
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL4
	.long	0x15ed
	.uleb128 0x1c
	.long	.LVL5
	.long	0x15fa
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x769
	.uleb128 0x1d
	.long	.LASF92
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST2
	.byte	0x1
	.long	0xa80
	.uleb128 0x1a
	.string	"dev"
	.byte	0x1
	.byte	0x28
	.long	0xc0
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.string	"bno"
	.byte	0x1
	.byte	0x28
	.long	0xc0
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.string	"bp"
	.byte	0x1
	.byte	0x2a
	.long	0x8f2
	.long	.LLST3
	.uleb128 0x1c
	.long	.LVL7
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL10
	.long	0x1607
	.uleb128 0x1c
	.long	.LVL11
	.long	0x1614
	.uleb128 0x1c
	.long	.LVL12
	.long	0x15fa
	.byte	0
	.uleb128 0x1e
	.long	.LASF97
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.long	0x25
	.long	.LFB2
	.long	.LFE2
	.long	.LLST4
	.byte	0x1
	.long	0xb18
	.uleb128 0x1a
	.string	"dev"
	.byte	0x1
	.byte	0x36
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.string	"b"
	.byte	0x1
	.byte	0x38
	.long	0xc0
	.long	.LLST5
	.uleb128 0x1b
	.string	"bi"
	.byte	0x1
	.byte	0x38
	.long	0xc0
	.long	.LLST6
	.uleb128 0x1b
	.string	"m"
	.byte	0x1
	.byte	0x38
	.long	0xc0
	.long	.LLST7
	.uleb128 0x1b
	.string	"bp"
	.byte	0x1
	.byte	0x39
	.long	0x8f2
	.long	.LLST8
	.uleb128 0x1c
	.long	.LVL18
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL25
	.long	0x1614
	.uleb128 0x1c
	.long	.LVL26
	.long	0x15fa
	.uleb128 0x1c
	.long	.LVL27
	.long	0xa18
	.uleb128 0x1c
	.long	.LVL29
	.long	0x15fa
	.uleb128 0x1c
	.long	.LVL31
	.long	0x1621
	.byte	0
	.uleb128 0x1d
	.long	.LASF93
	.byte	0x1
	.byte	0x4f
	.byte	0x1
	.long	.LFB3
	.long	.LFE3
	.long	.LLST9
	.byte	0x1
	.long	0xba2
	.uleb128 0x1a
	.string	"dev"
	.byte	0x1
	.byte	0x4f
	.long	0xc0
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.string	"b"
	.byte	0x1
	.byte	0x4f
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.string	"bp"
	.byte	0x1
	.byte	0x51
	.long	0x8f2
	.long	.LLST10
	.uleb128 0x1b
	.string	"bi"
	.byte	0x1
	.byte	0x52
	.long	0xc0
	.long	.LLST11
	.uleb128 0x1b
	.string	"m"
	.byte	0x1
	.byte	0x52
	.long	0xc0
	.long	.LLST12
	.uleb128 0x1c
	.long	.LVL33
	.long	0x9b3
	.uleb128 0x1c
	.long	.LVL34
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL42
	.long	0x1621
	.uleb128 0x1c
	.long	.LVL43
	.long	0x1614
	.uleb128 0x1c
	.long	.LVL44
	.long	0x15fa
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF95
	.byte	0x1
	.byte	0xa3
	.byte	0x1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST13
	.byte	0x1
	.long	0xbe6
	.uleb128 0x1a
	.string	"dev"
	.byte	0x1
	.byte	0xa3
	.long	0xc0
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.LVL46
	.long	0x162e
	.uleb128 0x1c
	.long	.LVL47
	.long	0x9b3
	.uleb128 0x1c
	.long	.LVL48
	.long	0x163b
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF100
	.byte	0x1
	.byte	0xb1
	.byte	0x1
	.long	0x6fe
	.long	.LFB5
	.long	.LFE5
	.long	.LLST14
	.byte	0x1
	.long	0xc8c
	.uleb128 0x1a
	.string	"dev"
	.byte	0x1
	.byte	0xb1
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.long	.LASF7
	.byte	0x1
	.byte	0xb1
	.long	0xb9
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x21
	.long	.LASF63
	.byte	0x1
	.byte	0xb3
	.long	0xc0
	.long	.LLST15
	.uleb128 0x1b
	.string	"bp"
	.byte	0x1
	.byte	0xb4
	.long	0x8f2
	.long	.LLST16
	.uleb128 0x1b
	.string	"dip"
	.byte	0x1
	.byte	0xb5
	.long	0xc8c
	.long	.LLST17
	.uleb128 0x1c
	.long	.LVL53
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL58
	.long	0x1607
	.uleb128 0x1c
	.long	.LVL59
	.long	0x1614
	.uleb128 0x1c
	.long	.LVL60
	.long	0x15fa
	.uleb128 0x1c
	.long	.LVL61
	.long	0xcfb
	.uleb128 0x1c
	.long	.LVL62
	.long	0x15fa
	.uleb128 0x1c
	.long	.LVL64
	.long	0x1621
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x7d8
	.uleb128 0x19
	.byte	0x1
	.long	.LASF96
	.byte	0x1
	.byte	0xc8
	.byte	0x1
	.long	.LFB6
	.long	.LFE6
	.long	.LLST18
	.byte	0x1
	.long	0xcfb
	.uleb128 0x1a
	.string	"ip"
	.byte	0x1
	.byte	0xc8
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.string	"bp"
	.byte	0x1
	.byte	0xca
	.long	0x8f2
	.long	.LLST19
	.uleb128 0x1b
	.string	"dip"
	.byte	0x1
	.byte	0xcb
	.long	0xc8c
	.long	.LLST20
	.uleb128 0x1c
	.long	.LVL66
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL71
	.long	0x15ed
	.uleb128 0x1c
	.long	.LVL72
	.long	0x1614
	.uleb128 0x1c
	.long	.LVL73
	.long	0x15fa
	.byte	0
	.uleb128 0x1e
	.long	.LASF98
	.byte	0x1
	.byte	0xdd
	.byte	0x1
	.long	0x6fe
	.long	.LFB7
	.long	.LFE7
	.long	.LLST21
	.byte	0x1
	.long	0xd75
	.uleb128 0x1a
	.string	"dev"
	.byte	0x1
	.byte	0xdd
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x20
	.long	.LASF63
	.byte	0x1
	.byte	0xdd
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.string	"ip"
	.byte	0x1
	.byte	0xdf
	.long	0x6fe
	.long	.LLST22
	.uleb128 0x22
	.long	.LASF99
	.byte	0x1
	.byte	0xdf
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.long	.LVL75
	.long	0x1648
	.uleb128 0x1c
	.long	.LVL78
	.long	0x1655
	.uleb128 0x1c
	.long	.LVL81
	.long	0x1621
	.uleb128 0x1c
	.long	.LVL83
	.long	0x1655
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF101
	.byte	0x1
	.value	0x100
	.byte	0x1
	.long	0x6fe
	.long	.LFB8
	.long	.LFE8
	.long	.LLST23
	.byte	0x1
	.long	0xdb5
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x100
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.LVL85
	.long	0x1648
	.uleb128 0x1c
	.long	.LVL86
	.long	0x1655
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF102
	.byte	0x1
	.value	0x10b
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST24
	.byte	0x1
	.long	0xe46
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x10b
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x26
	.string	"bp"
	.byte	0x1
	.value	0x10d
	.long	0x8f2
	.long	.LLST25
	.uleb128 0x26
	.string	"dip"
	.byte	0x1
	.value	0x10e
	.long	0xc8c
	.long	.LLST26
	.uleb128 0x1c
	.long	.LVL88
	.long	0x1621
	.uleb128 0x1c
	.long	.LVL89
	.long	0x1648
	.uleb128 0x1c
	.long	.LVL90
	.long	0x1662
	.uleb128 0x1c
	.long	.LVL91
	.long	0x1655
	.uleb128 0x1c
	.long	.LVL92
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL97
	.long	0x15ed
	.uleb128 0x1c
	.long	.LVL98
	.long	0x15fa
	.uleb128 0x1c
	.long	.LVL99
	.long	0x1621
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF103
	.byte	0x1
	.value	0x12b
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.long	.LLST27
	.byte	0x1
	.long	0xe94
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x12b
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.LVL101
	.long	0x1621
	.uleb128 0x1c
	.long	.LVL102
	.long	0x1648
	.uleb128 0x1c
	.long	.LVL103
	.long	0x166f
	.uleb128 0x1c
	.long	.LVL104
	.long	0x1655
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF104
	.byte	0x1
	.value	0x13e
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.long	.LLST28
	.byte	0x1
	.long	0xf06
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x13e
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.LVL106
	.long	0x1648
	.uleb128 0x1c
	.long	.LVL107
	.long	0x1621
	.uleb128 0x1c
	.long	.LVL108
	.long	0x1655
	.uleb128 0x1c
	.long	.LVL109
	.long	0xfea
	.uleb128 0x1c
	.long	.LVL110
	.long	0xc92
	.uleb128 0x1c
	.long	.LVL111
	.long	0x1648
	.uleb128 0x1c
	.long	.LVL112
	.long	0x166f
	.uleb128 0x1c
	.long	.LVL113
	.long	0x1655
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF105
	.byte	0x1
	.value	0x154
	.byte	0x1
	.long	.LFB12
	.long	.LFE12
	.long	.LLST29
	.byte	0x1
	.long	0xf42
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x154
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.LVL115
	.long	0xe46
	.uleb128 0x1c
	.long	.LVL116
	.long	0xe94
	.byte	0
	.uleb128 0x27
	.long	.LASF106
	.byte	0x1
	.value	0x165
	.byte	0x1
	.long	0x25
	.long	.LFB13
	.long	.LFE13
	.long	.LLST30
	.byte	0x1
	.long	0xfea
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x165
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x28
	.string	"bn"
	.byte	0x1
	.value	0x165
	.long	0x25
	.long	.LLST31
	.uleb128 0x29
	.long	.LASF107
	.byte	0x1
	.value	0x167
	.long	0x25
	.long	.LLST32
	.uleb128 0x26
	.string	"a"
	.byte	0x1
	.value	0x167
	.long	0x3b5
	.long	.LLST33
	.uleb128 0x26
	.string	"bp"
	.byte	0x1
	.value	0x168
	.long	0x8f2
	.long	.LLST34
	.uleb128 0x1c
	.long	.LVL122
	.long	0xa80
	.uleb128 0x1c
	.long	.LVL129
	.long	0xa80
	.uleb128 0x1c
	.long	.LVL132
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL139
	.long	0xa80
	.uleb128 0x1c
	.long	.LVL141
	.long	0x1614
	.uleb128 0x1c
	.long	.LVL142
	.long	0x15fa
	.uleb128 0x1c
	.long	.LVL144
	.long	0x1621
	.byte	0
	.uleb128 0x2a
	.long	.LASF108
	.byte	0x1
	.value	0x188
	.byte	0x1
	.long	.LFB14
	.long	.LFE14
	.long	.LLST35
	.byte	0x1
	.long	0x1081
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x188
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2b
	.string	"i"
	.byte	0x1
	.value	0x18a
	.long	0xc0
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x26
	.string	"j"
	.byte	0x1
	.value	0x18a
	.long	0xc0
	.long	.LLST36
	.uleb128 0x26
	.string	"bp"
	.byte	0x1
	.value	0x18b
	.long	0x8f2
	.long	.LLST37
	.uleb128 0x26
	.string	"a"
	.byte	0x1
	.value	0x18c
	.long	0x3b5
	.long	.LLST38
	.uleb128 0x1c
	.long	.LVL147
	.long	0xb18
	.uleb128 0x1c
	.long	.LVL148
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL155
	.long	0xb18
	.uleb128 0x1c
	.long	.LVL156
	.long	0x15fa
	.uleb128 0x1c
	.long	.LVL157
	.long	0xb18
	.uleb128 0x1c
	.long	.LVL159
	.long	0xc92
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF109
	.byte	0x1
	.value	0x1a7
	.byte	0x1
	.long	.LFB15
	.long	.LFE15
	.long	.LLST39
	.byte	0x1
	.long	0x10b9
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x1a7
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x24
	.string	"st"
	.byte	0x1
	.value	0x1a7
	.long	0x10b9
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x66
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF110
	.byte	0x1
	.value	0x1b3
	.byte	0x1
	.long	0xc0
	.long	.LFB16
	.long	.LFE16
	.long	.LLST40
	.byte	0x1
	.long	0x116a
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x1b3
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x24
	.string	"dst"
	.byte	0x1
	.value	0x1b3
	.long	0x5c8
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x24
	.string	"off"
	.byte	0x1
	.value	0x1b3
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x28
	.string	"n"
	.byte	0x1
	.value	0x1b3
	.long	0x25
	.long	.LLST41
	.uleb128 0x26
	.string	"tot"
	.byte	0x1
	.value	0x1b5
	.long	0x25
	.long	.LLST42
	.uleb128 0x26
	.string	"m"
	.byte	0x1
	.value	0x1b5
	.long	0x25
	.long	.LLST43
	.uleb128 0x26
	.string	"bp"
	.byte	0x1
	.value	0x1b6
	.long	0x8f2
	.long	.LLST44
	.uleb128 0x1c
	.long	.LVL167
	.long	0xf42
	.uleb128 0x1c
	.long	.LVL168
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL173
	.long	0x15ed
	.uleb128 0x1c
	.long	.LVL174
	.long	0x15fa
	.byte	0
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF111
	.byte	0x1
	.value	0x1cf
	.byte	0x1
	.long	0xc0
	.long	.LFB17
	.long	.LFE17
	.long	.LLST45
	.byte	0x1
	.long	0x1226
	.uleb128 0x24
	.string	"ip"
	.byte	0x1
	.value	0x1cf
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x24
	.string	"src"
	.byte	0x1
	.value	0x1cf
	.long	0x5c8
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x24
	.string	"off"
	.byte	0x1
	.value	0x1cf
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x24
	.string	"n"
	.byte	0x1
	.value	0x1cf
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x26
	.string	"tot"
	.byte	0x1
	.value	0x1d1
	.long	0x25
	.long	.LLST46
	.uleb128 0x26
	.string	"m"
	.byte	0x1
	.value	0x1d1
	.long	0x25
	.long	.LLST47
	.uleb128 0x26
	.string	"bp"
	.byte	0x1
	.value	0x1d2
	.long	0x8f2
	.long	.LLST48
	.uleb128 0x1c
	.long	.LVL182
	.long	0xf42
	.uleb128 0x1c
	.long	.LVL183
	.long	0x15e0
	.uleb128 0x1c
	.long	.LVL188
	.long	0x15ed
	.uleb128 0x1c
	.long	.LVL189
	.long	0x1614
	.uleb128 0x1c
	.long	.LVL190
	.long	0x15fa
	.uleb128 0x1c
	.long	.LVL192
	.long	0xc92
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF112
	.byte	0x1
	.value	0x1f2
	.byte	0x1
	.long	0xc0
	.long	.LFB18
	.long	.LFE18
	.long	.LLST49
	.byte	0x1
	.long	0x1269
	.uleb128 0x24
	.string	"s"
	.byte	0x1
	.value	0x1f2
	.long	0x1269
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x24
	.string	"t"
	.byte	0x1
	.value	0x1f2
	.long	0x1269
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1c
	.long	.LVL195
	.long	0x167c
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x126f
	.uleb128 0x2d
	.long	0x5ce
	.uleb128 0x23
	.byte	0x1
	.long	.LASF113
	.byte	0x1
	.value	0x1fa
	.byte	0x1
	.long	0x6fe
	.long	.LFB19
	.long	.LFE19
	.long	.LLST50
	.byte	0x1
	.long	0x131a
	.uleb128 0x24
	.string	"dp"
	.byte	0x1
	.value	0x1fa
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2e
	.long	.LASF50
	.byte	0x1
	.value	0x1fa
	.long	0x5c8
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2e
	.long	.LASF114
	.byte	0x1
	.value	0x1fa
	.long	0x3b5
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2b
	.string	"off"
	.byte	0x1
	.value	0x1fc
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x29
	.long	.LASF63
	.byte	0x1
	.value	0x1fc
	.long	0x25
	.long	.LLST51
	.uleb128 0x2b
	.string	"de"
	.byte	0x1
	.value	0x1fd
	.long	0x849
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.long	.LVL197
	.long	0x1621
	.uleb128 0x1c
	.long	.LVL199
	.long	0x10bf
	.uleb128 0x1c
	.long	.LVL200
	.long	0x1621
	.uleb128 0x1c
	.long	.LVL201
	.long	0x1226
	.uleb128 0x1c
	.long	.LVL204
	.long	0xcfb
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF115
	.byte	0x1
	.value	0x215
	.byte	0x1
	.long	0xc0
	.long	.LFB20
	.long	.LFE20
	.long	.LLST52
	.byte	0x1
	.long	0x13d2
	.uleb128 0x24
	.string	"dp"
	.byte	0x1
	.value	0x215
	.long	0x6fe
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2e
	.long	.LASF50
	.byte	0x1
	.value	0x215
	.long	0x5c8
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2e
	.long	.LASF63
	.byte	0x1
	.value	0x215
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x26
	.string	"off"
	.byte	0x1
	.value	0x217
	.long	0xc0
	.long	.LLST53
	.uleb128 0x2b
	.string	"de"
	.byte	0x1
	.value	0x218
	.long	0x849
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x26
	.string	"ip"
	.byte	0x1
	.value	0x219
	.long	0x6fe
	.long	.LLST54
	.uleb128 0x1c
	.long	.LVL207
	.long	0x1274
	.uleb128 0x1c
	.long	.LVL209
	.long	0xe94
	.uleb128 0x1c
	.long	.LVL214
	.long	0x10bf
	.uleb128 0x1c
	.long	.LVL215
	.long	0x1621
	.uleb128 0x1c
	.long	.LVL217
	.long	0x1689
	.uleb128 0x1c
	.long	.LVL218
	.long	0x116a
	.uleb128 0x1c
	.long	.LVL219
	.long	0x1621
	.byte	0
	.uleb128 0x27
	.long	.LASF116
	.byte	0x1
	.value	0x241
	.byte	0x1
	.long	0x5c8
	.long	.LFB21
	.long	.LFE21
	.long	.LLST55
	.byte	0x1
	.long	0x1440
	.uleb128 0x2f
	.long	.LASF117
	.byte	0x1
	.value	0x241
	.long	0x5c8
	.long	.LLST56
	.uleb128 0x2e
	.long	.LASF50
	.byte	0x1
	.value	0x241
	.long	0x5c8
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x26
	.string	"s"
	.byte	0x1
	.value	0x243
	.long	0x5c8
	.long	.LLST57
	.uleb128 0x26
	.string	"len"
	.byte	0x1
	.value	0x244
	.long	0xc0
	.long	.LLST58
	.uleb128 0x1c
	.long	.LVL227
	.long	0x15ed
	.uleb128 0x1c
	.long	.LVL230
	.long	0x15ed
	.byte	0
	.uleb128 0x27
	.long	.LASF118
	.byte	0x1
	.value	0x25e
	.byte	0x1
	.long	0x6fe
	.long	.LFB22
	.long	.LFE22
	.long	.LLST59
	.byte	0x1
	.long	0x1506
	.uleb128 0x2f
	.long	.LASF117
	.byte	0x1
	.value	0x25e
	.long	0x5c8
	.long	.LLST60
	.uleb128 0x2e
	.long	.LASF119
	.byte	0x1
	.value	0x25e
	.long	0xc0
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2e
	.long	.LASF50
	.byte	0x1
	.value	0x25e
	.long	0x5c8
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x26
	.string	"ip"
	.byte	0x1
	.value	0x260
	.long	0x6fe
	.long	.LLST61
	.uleb128 0x29
	.long	.LASF81
	.byte	0x1
	.value	0x260
	.long	0x6fe
	.long	.LLST62
	.uleb128 0x1c
	.long	.LVL234
	.long	0xcfb
	.uleb128 0x1c
	.long	.LVL237
	.long	0xd75
	.uleb128 0x1c
	.long	.LVL240
	.long	0xdb5
	.uleb128 0x1c
	.long	.LVL241
	.long	0xf06
	.uleb128 0x1c
	.long	.LVL242
	.long	0xe46
	.uleb128 0x1c
	.long	.LVL243
	.long	0x1274
	.uleb128 0x1c
	.long	.LVL245
	.long	0xf06
	.uleb128 0x1c
	.long	.LVL247
	.long	0xf06
	.uleb128 0x1c
	.long	.LVL249
	.long	0x13d2
	.uleb128 0x1c
	.long	.LVL251
	.long	0xe94
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF120
	.byte	0x1
	.value	0x281
	.byte	0x1
	.long	0x6fe
	.long	.LFB23
	.long	.LFE23
	.long	.LLST63
	.byte	0x1
	.long	0x154d
	.uleb128 0x2e
	.long	.LASF117
	.byte	0x1
	.value	0x281
	.long	0x5c8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x30
	.long	.LASF50
	.byte	0x1
	.value	0x283
	.long	0x872
	.byte	0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x1c
	.long	.LVL255
	.long	0x1440
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF119
	.byte	0x1
	.value	0x288
	.byte	0x1
	.long	0x6fe
	.long	.LFB24
	.long	.LFE24
	.long	.LLST64
	.byte	0x1
	.long	0x1594
	.uleb128 0x2e
	.long	.LASF117
	.byte	0x1
	.value	0x288
	.long	0x5c8
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2e
	.long	.LASF50
	.byte	0x1
	.value	0x288
	.long	0x5c8
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1c
	.long	.LVL257
	.long	0x1440
	.byte	0
	.uleb128 0x31
	.long	.LASF40
	.byte	0x5
	.byte	0x1f
	.long	.LASF140
	.long	0x587
	.byte	0x1
	.byte	0x1
	.uleb128 0xd
	.long	0x934
	.long	0x15b0
	.uleb128 0x32
	.byte	0
	.uleb128 0x33
	.long	.LASF88
	.byte	0x6
	.byte	0x24
	.long	0x15a5
	.byte	0x1
	.byte	0x1
	.uleb128 0x34
	.string	"sb"
	.byte	0x1
	.byte	0x19
	.long	0x769
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	sb
	.uleb128 0x35
	.long	.LASF121
	.byte	0x1
	.byte	0xa0
	.long	0x97d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	icache
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF122
	.long	.LASF122
	.byte	0xa
	.byte	0xe
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF123
	.long	.LASF123
	.byte	0xa
	.byte	0x88
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF124
	.long	.LASF124
	.byte	0xa
	.byte	0xf
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF125
	.long	.LASF125
	.byte	0xa
	.byte	0x89
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF126
	.long	.LASF126
	.byte	0xa
	.byte	0x55
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF127
	.long	.LASF127
	.byte	0xa
	.byte	0x16
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF128
	.long	.LASF128
	.byte	0xa
	.byte	0x81
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF129
	.long	.LASF129
	.byte	0xa
	.byte	0x14
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF130
	.long	.LASF130
	.byte	0xa
	.byte	0x7e
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF131
	.long	.LASF131
	.byte	0xa
	.byte	0x82
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF132
	.long	.LASF132
	.byte	0xa
	.byte	0x74
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF133
	.long	.LASF133
	.byte	0xa
	.byte	0x77
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF134
	.long	.LASF134
	.byte	0xa
	.byte	0x8c
	.uleb128 0x36
	.byte	0x1
	.byte	0x1
	.long	.LASF135
	.long	.LASF135
	.byte	0xa
	.byte	0x8d
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x29
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
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0xa
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x6
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x32
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x33
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
	.uleb128 0x34
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
	.uleb128 0x35
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
	.uleb128 0x36
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
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL3-.Ltext0
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
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL9-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST4:
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
.LLST5:
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL17-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST6:
	.long	.LVL20-.Ltext0
	.long	.LVL30-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL31-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST7:
	.long	.LVL22-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL23-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL24-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL31-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST8:
	.long	.LVL14-.Ltext0
	.long	.LVL19-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL19-.Ltext0
	.long	.LVL21-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL21-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
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
	.long	.LVL35-.Ltext0
	.long	.LVL36-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL36-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST11:
	.long	.LVL37-.Ltext0
	.long	.LVL38-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL38-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST12:
	.long	.LVL39-.Ltext0
	.long	.LVL40-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL40-.Ltext0
	.long	.LVL41-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL41-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST13:
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
.LLST14:
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
.LLST15:
	.long	.LVL50-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL51-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL52-.Ltext0
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST16:
	.long	.LVL54-.Ltext0
	.long	.LVL55-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL55-.Ltext0
	.long	.LVL63-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL64-.Ltext0
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST17:
	.long	.LVL56-.Ltext0
	.long	.LVL57-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL57-.Ltext0
	.long	.LVL63-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL64-.Ltext0
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
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
	.long	.LVL67-.Ltext0
	.long	.LVL68-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL68-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST20:
	.long	.LVL69-.Ltext0
	.long	.LVL70-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL70-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST21:
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
.LLST22:
	.long	.LVL77-.Ltext0
	.long	.LVL82-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL82-.Ltext0
	.long	.LVL83-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL83-1-.Ltext0
	.long	.LFE7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST23:
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
.LLST24:
	.long	.LFB9-.Ltext0
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
	.long	.LFE9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST25:
	.long	.LVL93-.Ltext0
	.long	.LVL94-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL94-.Ltext0
	.long	.LVL99-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST26:
	.long	.LVL95-.Ltext0
	.long	.LVL96-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL96-.Ltext0
	.long	.LVL99-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST27:
	.long	.LFB10-.Ltext0
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
	.long	.LFE10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST28:
	.long	.LFB11-.Ltext0
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
	.long	.LFE11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST29:
	.long	.LFB12-.Ltext0
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
	.long	.LFE12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST30:
	.long	.LFB13-.Ltext0
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
	.long	.LFE13-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST31:
	.long	.LVL117-.Ltext0
	.long	.LVL126-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	.LVL126-.Ltext0
	.long	.LFE13-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	0
	.long	0
.LLST32:
	.long	.LVL118-.Ltext0
	.long	.LVL119-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL119-.Ltext0
	.long	.LVL120-.Ltext0
	.value	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x70
	.sleb128 0
	.byte	0x22
	.byte	0x23
	.uleb128 0xc
	.long	.LVL120-.Ltext0
	.long	.LVL121-.Ltext0
	.value	0xa
	.byte	0x72
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x22
	.byte	0x23
	.uleb128 0xc
	.long	.LVL121-.Ltext0
	.long	.LVL123-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL123-.Ltext0
	.long	.LVL124-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL124-.Ltext0
	.long	.LVL125-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL127-.Ltext0
	.long	.LVL128-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL128-.Ltext0
	.long	.LVL130-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL130-.Ltext0
	.long	.LVL131-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL131-.Ltext0
	.long	.LVL137-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL137-.Ltext0
	.long	.LVL138-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL138-.Ltext0
	.long	.LVL140-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL140-.Ltext0
	.long	.LVL141-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL141-1-.Ltext0
	.long	.LVL143-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL144-.Ltext0
	.long	.LFE13-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST33:
	.long	.LVL135-.Ltext0
	.long	.LVL136-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL136-.Ltext0
	.long	.LVL143-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST34:
	.long	.LVL133-.Ltext0
	.long	.LVL134-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL134-.Ltext0
	.long	.LVL143-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST35:
	.long	.LFB14-.Ltext0
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
	.long	.LFE14-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST36:
	.long	.LVL152-.Ltext0
	.long	.LVL153-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL153-.Ltext0
	.long	.LVL154-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL154-.Ltext0
	.long	.LVL158-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST37:
	.long	.LVL149-.Ltext0
	.long	.LVL150-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL150-.Ltext0
	.long	.LVL158-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST38:
	.long	.LVL151-.Ltext0
	.long	.LVL153-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL153-.Ltext0
	.long	.LVL158-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST39:
	.long	.LFB15-.Ltext0
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
	.long	.LFE15-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST40:
	.long	.LFB16-.Ltext0
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
	.long	.LFE16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST41:
	.long	.LVL161-.Ltext0
	.long	.LVL163-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 12
	.long	.LVL163-.Ltext0
	.long	.LFE16-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 12
	.long	0
	.long	0
.LLST42:
	.long	.LVL164-.Ltext0
	.long	.LVL165-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL165-.Ltext0
	.long	.LVL166-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL166-.Ltext0
	.long	.LVL176-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST43:
	.long	.LVL171-.Ltext0
	.long	.LVL172-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL172-.Ltext0
	.long	.LVL175-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST44:
	.long	.LVL169-.Ltext0
	.long	.LVL170-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL170-.Ltext0
	.long	.LVL175-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST45:
	.long	.LFB17-.Ltext0
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
	.long	.LFE17-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST46:
	.long	.LVL179-.Ltext0
	.long	.LVL180-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL180-.Ltext0
	.long	.LVL181-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL181-.Ltext0
	.long	.LVL193-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST47:
	.long	.LVL186-.Ltext0
	.long	.LVL187-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL187-.Ltext0
	.long	.LVL191-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST48:
	.long	.LVL184-.Ltext0
	.long	.LVL185-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL185-.Ltext0
	.long	.LVL191-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST49:
	.long	.LFB18-.Ltext0
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
	.long	.LFE18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST50:
	.long	.LFB19-.Ltext0
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
	.long	.LFE19-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST51:
	.long	.LVL202-.Ltext0
	.long	.LVL203-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL203-.Ltext0
	.long	.LVL205-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST52:
	.long	.LFB20-.Ltext0
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
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST53:
	.long	.LVL211-.Ltext0
	.long	.LVL212-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL212-.Ltext0
	.long	.LVL213-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL213-.Ltext0
	.long	.LVL220-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST54:
	.long	.LVL208-.Ltext0
	.long	.LVL209-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL209-1-.Ltext0
	.long	.LVL210-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL210-.Ltext0
	.long	.LVL212-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL212-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST55:
	.long	.LFB21-.Ltext0
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
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST56:
	.long	.LVL221-.Ltext0
	.long	.LVL222-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL222-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST57:
	.long	.LVL223-.Ltext0
	.long	.LVL224-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL224-.Ltext0
	.long	.LVL232-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST58:
	.long	.LVL226-.Ltext0
	.long	.LVL227-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL227-1-.Ltext0
	.long	.LVL228-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL228-.Ltext0
	.long	.LVL229-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL229-.Ltext0
	.long	.LVL230-1-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL230-1-.Ltext0
	.long	.LVL232-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST59:
	.long	.LFB22-.Ltext0
	.long	.LCFI66-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI66-.Ltext0
	.long	.LCFI67-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI67-.Ltext0
	.long	.LCFI68-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI68-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST60:
	.long	.LVL233-.Ltext0
	.long	.LVL239-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL239-.Ltext0
	.long	.LVL240-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL240-1-.Ltext0
	.long	.LVL250-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL250-.Ltext0
	.long	.LVL251-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL251-1-.Ltext0
	.long	.LVL252-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL252-.Ltext0
	.long	.LVL253-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL253-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST61:
	.long	.LVL235-.Ltext0
	.long	.LVL236-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL238-.Ltext0
	.long	.LVL239-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL239-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST62:
	.long	.LVL244-.Ltext0
	.long	.LVL245-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL245-1-.Ltext0
	.long	.LVL246-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL246-.Ltext0
	.long	.LVL247-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL247-1-.Ltext0
	.long	.LVL248-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST63:
	.long	.LFB23-.Ltext0
	.long	.LCFI69-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI69-.Ltext0
	.long	.LCFI70-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI70-.Ltext0
	.long	.LCFI71-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI71-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST64:
	.long	.LFB24-.Ltext0
	.long	.LCFI72-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI72-.Ltext0
	.long	.LCFI73-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI73-.Ltext0
	.long	.LCFI74-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI74-.Ltext0
	.long	.LFE24-.Ltext0
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
.LASF74:
	.string	"logstart"
.LASF52:
	.string	"EMBRYO"
.LASF82:
	.string	"qnext"
.LASF36:
	.string	"scheduler"
.LASF95:
	.string	"iinit"
.LASF90:
	.string	"write"
.LASF113:
	.string	"dirlookup"
.LASF80:
	.string	"prev"
.LASF17:
	.string	"rsv1"
.LASF7:
	.string	"type"
.LASF135:
	.string	"strncpy"
.LASF13:
	.string	"lim_15_0"
.LASF117:
	.string	"path"
.LASF37:
	.string	"started"
.LASF25:
	.string	"esp2"
.LASF61:
	.string	"pipe"
.LASF83:
	.string	"data"
.LASF81:
	.string	"next"
.LASF53:
	.string	"SLEEPING"
.LASF11:
	.string	"stat"
.LASF131:
	.string	"release"
.LASF70:
	.string	"superblock"
.LASF99:
	.string	"empty"
.LASF46:
	.string	"parent"
.LASF45:
	.string	"state"
.LASF122:
	.string	"bread"
.LASF127:
	.string	"panic"
.LASF109:
	.string	"stati"
.LASF128:
	.string	"initlock"
.LASF88:
	.string	"devsw"
.LASF100:
	.string	"ialloc"
.LASF139:
	.string	"procstate"
.LASF84:
	.string	"FD_NONE"
.LASF86:
	.string	"FD_INODE"
.LASF18:
	.string	"base_31_24"
.LASF20:
	.string	"link"
.LASF104:
	.string	"iput"
.LASF140:
	.string	"%gs:4"
.LASF6:
	.string	"pde_t"
.LASF2:
	.string	"unsigned int"
.LASF133:
	.string	"wakeup"
.LASF40:
	.string	"proc"
.LASF115:
	.string	"dirlink"
.LASF66:
	.string	"minor"
.LASF85:
	.string	"FD_PIPE"
.LASF130:
	.string	"acquire"
.LASF50:
	.string	"name"
.LASF54:
	.string	"RUNNABLE"
.LASF35:
	.string	"iomb"
.LASF9:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF119:
	.string	"nameiparent"
.LASF132:
	.string	"sleep"
.LASF21:
	.string	"esp0"
.LASF23:
	.string	"esp1"
.LASF8:
	.string	"nlink"
.LASF111:
	.string	"writei"
.LASF49:
	.string	"ofile"
.LASF75:
	.string	"inodestart"
.LASF138:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
.LASF14:
	.string	"base_15_0"
.LASF116:
	.string	"skipelem"
.LASF96:
	.string	"iupdate"
.LASF101:
	.string	"idup"
.LASF43:
	.string	"pgdir"
.LASF51:
	.string	"UNUSED"
.LASF22:
	.string	"padding1"
.LASF26:
	.string	"padding3"
.LASF28:
	.string	"padding4"
.LASF29:
	.string	"padding5"
.LASF30:
	.string	"padding6"
.LASF31:
	.string	"padding7"
.LASF32:
	.string	"padding8"
.LASF33:
	.string	"padding9"
.LASF87:
	.string	"trapframe"
.LASF42:
	.string	"sizetype"
.LASF56:
	.string	"ZOMBIE"
.LASF124:
	.string	"brelse"
.LASF1:
	.string	"ushort"
.LASF103:
	.string	"iunlock"
.LASF27:
	.string	"eflags"
.LASF78:
	.string	"dirent"
.LASF69:
	.string	"locked"
.LASF67:
	.string	"addrs"
.LASF19:
	.string	"taskstate"
.LASF92:
	.string	"bzero"
.LASF4:
	.string	"uchar"
.LASF129:
	.string	"cprintf"
.LASF0:
	.string	"uint"
.LASF62:
	.string	"inode"
.LASF24:
	.string	"padding2"
.LASF44:
	.string	"kstack"
.LASF59:
	.string	"readable"
.LASF120:
	.string	"namei"
.LASF107:
	.string	"addr"
.LASF63:
	.string	"inum"
.LASF16:
	.string	"lim_19_16"
.LASF5:
	.string	"unsigned char"
.LASF73:
	.string	"nlog"
.LASF134:
	.string	"strncmp"
.LASF10:
	.string	"short int"
.LASF114:
	.string	"poff"
.LASF58:
	.string	"file"
.LASF39:
	.string	"intena"
.LASF72:
	.string	"ninodes"
.LASF15:
	.string	"base_23_16"
.LASF55:
	.string	"RUNNING"
.LASF93:
	.string	"bfree"
.LASF137:
	.string	"fs.c"
.LASF102:
	.string	"ilock"
.LASF118:
	.string	"namex"
.LASF79:
	.string	"blockno"
.LASF108:
	.string	"itrunc"
.LASF47:
	.string	"chan"
.LASF57:
	.string	"char"
.LASF97:
	.string	"balloc"
.LASF60:
	.string	"writable"
.LASF98:
	.string	"iget"
.LASF41:
	.string	"context"
.LASF77:
	.string	"dinode"
.LASF136:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF34:
	.string	"padding10"
.LASF110:
	.string	"readi"
.LASF112:
	.string	"namecmp"
.LASF125:
	.string	"memset"
.LASF126:
	.string	"log_write"
.LASF38:
	.string	"ncli"
.LASF123:
	.string	"memmove"
.LASF12:
	.string	"segdesc"
.LASF64:
	.string	"flags"
.LASF94:
	.string	"readsb"
.LASF105:
	.string	"iunlockput"
.LASF89:
	.string	"read"
.LASF121:
	.string	"icache"
.LASF71:
	.string	"nblocks"
.LASF68:
	.string	"spinlock"
.LASF65:
	.string	"major"
.LASF48:
	.string	"killed"
.LASF106:
	.string	"bmap"
.LASF76:
	.string	"bmapstart"
.LASF91:
	.string	"lock"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
