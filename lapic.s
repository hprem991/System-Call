	.file	"lapic.c"
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
	.type	readeflags, @function
readeflags:
.LFB12:
	.loc 1 96 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 98 0
#APP
# 98 "x86.h" 1
	pushfl; popl %eax
# 0 "" 2
#NO_APP
	movl	%eax, -4(%ebp)
.LVL3:
	.loc 1 99 0
	movl	-4(%ebp), %eax
	.loc 1 100 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	readeflags, .-readeflags
	.comm	lapic,4,4
	.type	lapicw, @function
lapicw:
.LFB20:
	.file 2 "lapic.c"
	.loc 2 47 0
	.cfi_startproc
.LVL4:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	.loc 2 48 0
	movl	lapic, %eax
	movl	8(%ebp), %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%eax, (%edx)
	.loc 2 49 0
	movl	lapic, %eax
	addl	$32, %eax
	movl	(%eax), %eax
	.loc 2 50 0
	nop
	popl	%ebp
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	lapicw, .-lapicw
	.globl	lapicinit
	.type	lapicinit, @function
lapicinit:
.LFB21:
	.loc 2 55 0
	.cfi_startproc
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	.loc 2 56 0
	movl	lapic, %eax
	testl	%eax, %eax
	je	.L12
	.loc 2 60 0
	pushl	$319
	pushl	$60
	call	lapicw
.LVL5:
	addl	$8, %esp
	.loc 2 66 0
	pushl	$11
	pushl	$248
	call	lapicw
.LVL6:
	addl	$8, %esp
	.loc 2 67 0
	pushl	$131104
	pushl	$200
	call	lapicw
.LVL7:
	addl	$8, %esp
	.loc 2 68 0
	pushl	$10000000
	pushl	$224
	call	lapicw
.LVL8:
	addl	$8, %esp
	.loc 2 71 0
	pushl	$65536
	pushl	$212
	call	lapicw
.LVL9:
	addl	$8, %esp
	.loc 2 72 0
	pushl	$65536
	pushl	$216
	call	lapicw
.LVL10:
	addl	$8, %esp
	.loc 2 76 0
	movl	lapic, %eax
	addl	$48, %eax
	movl	(%eax), %eax
	shrl	$16, %eax
	movzbl	%al, %eax
	cmpl	$3, %eax
	jbe	.L10
	.loc 2 77 0
	pushl	$65536
	pushl	$208
	call	lapicw
.LVL11:
	addl	$8, %esp
.L10:
	.loc 2 80 0
	pushl	$51
	pushl	$220
	call	lapicw
.LVL12:
	addl	$8, %esp
	.loc 2 83 0
	pushl	$0
	pushl	$160
	call	lapicw
.LVL13:
	addl	$8, %esp
	.loc 2 84 0
	pushl	$0
	pushl	$160
	call	lapicw
.LVL14:
	addl	$8, %esp
	.loc 2 87 0
	pushl	$0
	pushl	$44
	call	lapicw
.LVL15:
	addl	$8, %esp
	.loc 2 90 0
	pushl	$0
	pushl	$196
	call	lapicw
.LVL16:
	addl	$8, %esp
	.loc 2 91 0
	pushl	$558336
	pushl	$192
	call	lapicw
.LVL17:
	addl	$8, %esp
	.loc 2 92 0
	nop
.L11:
	.loc 2 92 0 is_stmt 0 discriminator 1
	movl	lapic, %eax
	addl	$768, %eax
	movl	(%eax), %eax
	andl	$4096, %eax
	testl	%eax, %eax
	jne	.L11
	.loc 2 96 0 is_stmt 1
	pushl	$0
	pushl	$32
	call	lapicw
.LVL18:
	addl	$8, %esp
	jmp	.L7
.L12:
	.loc 2 57 0
	nop
.L7:
	.loc 2 97 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	lapicinit, .-lapicinit
	.section	.rodata
	.align 4
.LC0:
	.string	"cpu called from %x with interrupts enabled\n"
	.text
	.globl	cpunum
	.type	cpunum, @function
cpunum:
.LFB22:
	.loc 2 101 0
	.cfi_startproc
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 2 107 0
	call	readeflags
.LVL19:
	andl	$512, %eax
	testl	%eax, %eax
	je	.L14
.LBB2:
	.loc 2 109 0
	movl	n.1521, %eax
	leal	1(%eax), %edx
	movl	%edx, n.1521
	testl	%eax, %eax
	jne	.L14
	.loc 2 110 0
	movl	4(%ebp), %eax
	subl	$8, %esp
	pushl	%eax
	pushl	$.LC0
	call	cprintf
.LVL20:
	addl	$16, %esp
.L14:
.LBE2:
	.loc 2 114 0
	movl	lapic, %eax
	testl	%eax, %eax
	je	.L15
	.loc 2 115 0
	movl	lapic, %eax
	addl	$32, %eax
	movl	(%eax), %eax
	shrl	$24, %eax
	jmp	.L16
.L15:
	.loc 2 116 0
	movl	$0, %eax
.L16:
	.loc 2 117 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	cpunum, .-cpunum
	.globl	lapiceoi
	.type	lapiceoi, @function
lapiceoi:
.LFB23:
	.loc 2 122 0
	.cfi_startproc
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	.loc 2 123 0
	movl	lapic, %eax
	testl	%eax, %eax
	je	.L19
	.loc 2 124 0
	pushl	$0
	pushl	$44
	call	lapicw
.LVL21:
	addl	$8, %esp
.L19:
	.loc 2 125 0
	nop
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	lapiceoi, .-lapiceoi
	.globl	microdelay
	.type	microdelay, @function
microdelay:
.LFB24:
	.loc 2 131 0
	.cfi_startproc
.LVL22:
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	.loc 2 132 0
	nop
	popl	%ebp
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	microdelay, .-microdelay
	.globl	lapicstartap
	.type	lapicstartap, @function
lapicstartap:
.LFB25:
	.loc 2 141 0
	.cfi_startproc
.LVL23:
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	.loc 2 148 0
	pushl	$15
	pushl	$112
	call	outb
.LVL24:
	addl	$8, %esp
	.loc 2 149 0
	pushl	$10
	pushl	$113
	call	outb
.LVL25:
	addl	$8, %esp
	.loc 2 150 0
	movl	$-2147482521, -8(%ebp)
.LVL26:
	.loc 2 151 0
	movl	-8(%ebp), %eax
	movw	$0, (%eax)
	.loc 2 152 0
	movl	-8(%ebp), %eax
	addl	$2, %eax
	movl	12(%ebp), %edx
	shrl	$4, %edx
	movw	%dx, (%eax)
	.loc 2 156 0
	movzbl	-20(%ebp), %eax
	sall	$24, %eax
	pushl	%eax
	pushl	$196
	call	lapicw
.LVL27:
	addl	$8, %esp
	.loc 2 157 0
	pushl	$50432
	pushl	$192
	call	lapicw
.LVL28:
	addl	$8, %esp
	.loc 2 158 0
	pushl	$200
	call	microdelay
.LVL29:
	addl	$4, %esp
	.loc 2 159 0
	pushl	$34048
	pushl	$192
	call	lapicw
.LVL30:
	addl	$8, %esp
	.loc 2 160 0
	pushl	$100
	call	microdelay
.LVL31:
	addl	$4, %esp
	.loc 2 167 0
	movl	$0, -4(%ebp)
.LVL32:
	jmp	.L22
.L23:
	.loc 2 168 0 discriminator 3
	movzbl	-20(%ebp), %eax
	sall	$24, %eax
	pushl	%eax
	pushl	$196
	call	lapicw
.LVL33:
	addl	$8, %esp
	.loc 2 169 0 discriminator 3
	movl	12(%ebp), %eax
	shrl	$12, %eax
	orb	$6, %ah
	pushl	%eax
	pushl	$192
	call	lapicw
.LVL34:
	addl	$8, %esp
	.loc 2 170 0 discriminator 3
	pushl	$200
	call	microdelay
.LVL35:
	addl	$4, %esp
	.loc 2 167 0 discriminator 3
	addl	$1, -4(%ebp)
.L22:
	.loc 2 167 0 is_stmt 0 discriminator 1
	cmpl	$1, -4(%ebp)
	jle	.L23
	.loc 2 172 0 is_stmt 1
	nop
	leave
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	lapicstartap, .-lapicstartap
	.type	cmos_read, @function
cmos_read:
.LFB26:
	.loc 2 186 0
	.cfi_startproc
.LVL36:
	pushl	%ebp
.LCFI27:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI28:
	.cfi_def_cfa_register 5
	.loc 2 187 0
	movl	8(%ebp), %eax
	movzbl	%al, %eax
	pushl	%eax
	pushl	$112
	call	outb
.LVL37:
	addl	$8, %esp
	.loc 2 188 0
	pushl	$200
	call	microdelay
.LVL38:
	addl	$4, %esp
	.loc 2 190 0
	pushl	$113
	call	inb
.LVL39:
	addl	$4, %esp
	movzbl	%al, %eax
	.loc 2 191 0
	leave
.LCFI29:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	cmos_read, .-cmos_read
	.type	fill_rtcdate, @function
fill_rtcdate:
.LFB27:
	.loc 2 194 0
	.cfi_startproc
.LVL40:
	pushl	%ebp
.LCFI30:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI31:
	.cfi_def_cfa_register 5
	.loc 2 195 0
	pushl	$0
	call	cmos_read
.LVL41:
	addl	$4, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 2 196 0
	pushl	$2
	call	cmos_read
.LVL42:
	addl	$4, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	.loc 2 197 0
	pushl	$4
	call	cmos_read
.LVL43:
	addl	$4, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	.loc 2 198 0
	pushl	$7
	call	cmos_read
.LVL44:
	addl	$4, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 12(%eax)
	.loc 2 199 0
	pushl	$8
	call	cmos_read
.LVL45:
	addl	$4, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 16(%eax)
	.loc 2 200 0
	pushl	$9
	call	cmos_read
.LVL46:
	addl	$4, %esp
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 20(%eax)
	.loc 2 201 0
	nop
	leave
.LCFI32:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE27:
	.size	fill_rtcdate, .-fill_rtcdate
	.globl	cmostime
	.type	cmostime, @function
cmostime:
.LFB28:
	.loc 2 205 0
	.cfi_startproc
.LVL47:
	pushl	%ebp
.LCFI33:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI34:
	.cfi_def_cfa_register 5
	subl	$72, %esp
	.loc 2 209 0
	pushl	$11
	call	cmos_read
.LVL48:
	addl	$4, %esp
	movl	%eax, -12(%ebp)
.LVL49:
	.loc 2 211 0
	movl	-12(%ebp), %eax
	andl	$4, %eax
.LVL50:
	testl	%eax, %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -16(%ebp)
.LVL51:
.L31:
	.loc 2 215 0
	leal	-40(%ebp), %eax
	pushl	%eax
	call	fill_rtcdate
.LVL52:
	addl	$4, %esp
	.loc 2 216 0
	pushl	$10
	call	cmos_read
.LVL53:
	addl	$4, %esp
	andl	$128, %eax
	testl	%eax, %eax
	jne	.L34
	.loc 2 218 0
	leal	-64(%ebp), %eax
	pushl	%eax
	call	fill_rtcdate
.LVL54:
	addl	$4, %esp
	.loc 2 219 0
	subl	$4, %esp
	pushl	$24
	leal	-64(%ebp), %eax
	pushl	%eax
	leal	-40(%ebp), %eax
	pushl	%eax
	call	memcmp
.LVL55:
	addl	$16, %esp
	testl	%eax, %eax
	je	.L35
	jmp	.L31
.L34:
	.loc 2 217 0
	nop
	.loc 2 221 0
	jmp	.L31
.L35:
	.loc 2 220 0
	nop
	.loc 2 224 0
	cmpl	$0, -16(%ebp)
	je	.L32
	.loc 2 226 0
	movl	-40(%ebp), %eax
	shrl	$4, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-40(%ebp), %eax
	andl	$15, %eax
	addl	%edx, %eax
	movl	%eax, -40(%ebp)
	.loc 2 227 0
	movl	-36(%ebp), %eax
	shrl	$4, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-36(%ebp), %eax
	andl	$15, %eax
	addl	%edx, %eax
	movl	%eax, -36(%ebp)
	.loc 2 228 0
	movl	-32(%ebp), %eax
	shrl	$4, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	andl	$15, %eax
	addl	%edx, %eax
	movl	%eax, -32(%ebp)
	.loc 2 229 0
	movl	-28(%ebp), %eax
	shrl	$4, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-28(%ebp), %eax
	andl	$15, %eax
	addl	%edx, %eax
	movl	%eax, -28(%ebp)
	.loc 2 230 0
	movl	-24(%ebp), %eax
	shrl	$4, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-24(%ebp), %eax
	andl	$15, %eax
	addl	%edx, %eax
	movl	%eax, -24(%ebp)
	.loc 2 231 0
	movl	-20(%ebp), %eax
	shrl	$4, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	andl	$15, %eax
	addl	%edx, %eax
	movl	%eax, -20(%ebp)
.L32:
	.loc 2 235 0
	movl	8(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	%edx, (%eax)
	movl	-36(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-32(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-28(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-24(%ebp), %edx
	movl	%edx, 16(%eax)
	movl	-20(%ebp), %edx
	movl	%edx, 20(%eax)
	.loc 2 236 0
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	leal	2000(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 20(%eax)
	.loc 2 237 0
	nop
	leave
.LCFI35:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE28:
	.size	cmostime, .-cmostime
	.local	n.1521
	.comm	n.1521,4,4
.Letext0:
	.file 3 "types.h"
	.file 4 "date.h"
	.file 5 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4df
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF30
	.byte	0xc
	.long	.LASF31
	.long	.LASF32
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
	.uleb128 0x4
	.long	.LASF33
	.byte	0x18
	.byte	0x4
	.byte	0x1
	.long	0xbc
	.uleb128 0x5
	.long	.LASF6
	.byte	0x4
	.byte	0x2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF7
	.byte	0x4
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF8
	.byte	0x4
	.byte	0x4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"day"
	.byte	0x4
	.byte	0x5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF9
	.byte	0x4
	.byte	0x6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF10
	.byte	0x4
	.byte	0x7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0x7
	.string	"inb"
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.long	0x49
	.long	.LFB2
	.long	.LFE2
	.long	.LLST0
	.byte	0x1
	.long	0xf5
	.uleb128 0x8
	.long	.LASF11
	.byte	0x1
	.byte	0x4
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x1
	.byte	0x6
	.long	0x49
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0xa
	.long	.LASF15
	.byte	0x1
	.byte	0x16
	.byte	0x1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST1
	.byte	0x1
	.long	0x12b
	.uleb128 0x8
	.long	.LASF11
	.byte	0x1
	.byte	0x16
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x8
	.long	.LASF12
	.byte	0x1
	.byte	0x16
	.long	0x49
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0xb
	.long	.LASF13
	.byte	0x1
	.byte	0x5f
	.byte	0x1
	.long	0x25
	.long	.LFB12
	.long	.LFE12
	.long	.LLST2
	.byte	0x1
	.long	0x156
	.uleb128 0x9
	.long	.LASF14
	.byte	0x1
	.byte	0x61
	.long	0x25
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0xa
	.long	.LASF16
	.byte	0x2
	.byte	0x2e
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST3
	.byte	0x1
	.long	0x18c
	.uleb128 0x8
	.long	.LASF17
	.byte	0x2
	.byte	0x2e
	.long	0x18c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x8
	.long	.LASF18
	.byte	0x2
	.byte	0x2e
	.long	0x18c
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xd
	.byte	0x1
	.long	.LASF19
	.byte	0x2
	.byte	0x36
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST4
	.byte	0x1
	.long	0x22c
	.uleb128 0xe
	.long	.LVL5
	.long	0x156
	.uleb128 0xe
	.long	.LVL6
	.long	0x156
	.uleb128 0xe
	.long	.LVL7
	.long	0x156
	.uleb128 0xe
	.long	.LVL8
	.long	0x156
	.uleb128 0xe
	.long	.LVL9
	.long	0x156
	.uleb128 0xe
	.long	.LVL10
	.long	0x156
	.uleb128 0xe
	.long	.LVL11
	.long	0x156
	.uleb128 0xe
	.long	.LVL12
	.long	0x156
	.uleb128 0xe
	.long	.LVL13
	.long	0x156
	.uleb128 0xe
	.long	.LVL14
	.long	0x156
	.uleb128 0xe
	.long	.LVL15
	.long	0x156
	.uleb128 0xe
	.long	.LVL16
	.long	0x156
	.uleb128 0xe
	.long	.LVL17
	.long	0x156
	.uleb128 0xe
	.long	.LVL18
	.long	0x156
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF34
	.byte	0x2
	.byte	0x64
	.byte	0x1
	.long	0x18c
	.long	.LFB22
	.long	.LFE22
	.long	.LLST5
	.byte	0x1
	.long	0x27a
	.uleb128 0x10
	.long	.LBB2
	.long	.LBE2
	.long	0x270
	.uleb128 0x11
	.string	"n"
	.byte	0x2
	.byte	0x6c
	.long	0x18c
	.byte	0x5
	.byte	0x3
	.long	n.1521
	.uleb128 0xe
	.long	.LVL20
	.long	0x4c8
	.byte	0
	.uleb128 0xe
	.long	.LVL19
	.long	0x12b
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF20
	.byte	0x2
	.byte	0x79
	.byte	0x1
	.long	.LFB23
	.long	.LFE23
	.long	.LLST6
	.byte	0x1
	.long	0x29e
	.uleb128 0xe
	.long	.LVL21
	.long	0x156
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF21
	.byte	0x2
	.byte	0x82
	.byte	0x1
	.long	.LFB24
	.long	.LFE24
	.long	.LLST7
	.byte	0x1
	.long	0x2c6
	.uleb128 0x12
	.string	"us"
	.byte	0x2
	.byte	0x82
	.long	0x18c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF22
	.byte	0x2
	.byte	0x8c
	.byte	0x1
	.long	.LFB25
	.long	.LFE25
	.long	.LLST8
	.byte	0x1
	.long	0x371
	.uleb128 0x8
	.long	.LASF23
	.byte	0x2
	.byte	0x8c
	.long	0x49
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x8
	.long	.LASF24
	.byte	0x2
	.byte	0x8c
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.string	"i"
	.byte	0x2
	.byte	0x8e
	.long	0x18c
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.string	"wrv"
	.byte	0x2
	.byte	0x8f
	.long	0x371
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.long	.LVL24
	.long	0xf5
	.uleb128 0xe
	.long	.LVL25
	.long	0xf5
	.uleb128 0xe
	.long	.LVL27
	.long	0x156
	.uleb128 0xe
	.long	.LVL28
	.long	0x156
	.uleb128 0xe
	.long	.LVL29
	.long	0x29e
	.uleb128 0xe
	.long	.LVL30
	.long	0x156
	.uleb128 0xe
	.long	.LVL31
	.long	0x29e
	.uleb128 0xe
	.long	.LVL33
	.long	0x156
	.uleb128 0xe
	.long	.LVL34
	.long	0x156
	.uleb128 0xe
	.long	.LVL35
	.long	0x29e
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.long	0x37
	.uleb128 0xb
	.long	.LASF25
	.byte	0x2
	.byte	0xb9
	.byte	0x1
	.long	0x25
	.long	.LFB26
	.long	.LFE26
	.long	.LLST9
	.byte	0x1
	.long	0x3be
	.uleb128 0x12
	.string	"reg"
	.byte	0x2
	.byte	0xb9
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.long	.LVL37
	.long	0xf5
	.uleb128 0xe
	.long	.LVL38
	.long	0x29e
	.uleb128 0xe
	.long	.LVL39
	.long	0xbc
	.byte	0
	.uleb128 0xa
	.long	.LASF26
	.byte	0x2
	.byte	0xc1
	.byte	0x1
	.long	.LFB27
	.long	.LFE27
	.long	.LLST10
	.byte	0x1
	.long	0x41a
	.uleb128 0x12
	.string	"r"
	.byte	0x2
	.byte	0xc1
	.long	0x41a
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xe
	.long	.LVL41
	.long	0x377
	.uleb128 0xe
	.long	.LVL42
	.long	0x377
	.uleb128 0xe
	.long	.LVL43
	.long	0x377
	.uleb128 0xe
	.long	.LVL44
	.long	0x377
	.uleb128 0xe
	.long	.LVL45
	.long	0x377
	.uleb128 0xe
	.long	.LVL46
	.long	0x377
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.long	0x5b
	.uleb128 0xd
	.byte	0x1
	.long	.LASF27
	.byte	0x2
	.byte	0xcc
	.byte	0x1
	.long	.LFB28
	.long	.LFE28
	.long	.LLST11
	.byte	0x1
	.long	0x4ab
	.uleb128 0x12
	.string	"r"
	.byte	0x2
	.byte	0xcc
	.long	0x41a
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.string	"t1"
	.byte	0x2
	.byte	0xce
	.long	0x5b
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x11
	.string	"t2"
	.byte	0x2
	.byte	0xce
	.long	0x5b
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x14
	.string	"sb"
	.byte	0x2
	.byte	0xcf
	.long	0x18c
	.long	.LLST12
	.uleb128 0x11
	.string	"bcd"
	.byte	0x2
	.byte	0xcf
	.long	0x18c
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.long	.LVL48
	.long	0x377
	.uleb128 0xe
	.long	.LVL52
	.long	0x3be
	.uleb128 0xe
	.long	.LVL53
	.long	0x377
	.uleb128 0xe
	.long	.LVL54
	.long	0x3be
	.uleb128 0xe
	.long	.LVL55
	.long	0x4d5
	.byte	0
	.uleb128 0x15
	.long	.LASF35
	.byte	0x2
	.byte	0x2b
	.long	0x4bd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lapic
	.uleb128 0x13
	.byte	0x4
	.long	0x4c3
	.uleb128 0x16
	.long	0x25
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF28
	.long	.LASF28
	.byte	0x5
	.byte	0x14
	.uleb128 0x17
	.byte	0x1
	.byte	0x1
	.long	.LASF29
	.long	.LASF29
	.byte	0x5
	.byte	0x87
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.long	.LFB12-.Ltext0
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
	.long	.LFE12-.Ltext0
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
.LLST5:
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
	.long	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI17-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST6:
	.long	.LFB23-.Ltext0
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
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LFB24-.Ltext0
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
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST8:
	.long	.LFB25-.Ltext0
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
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST9:
	.long	.LFB26-.Ltext0
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
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST10:
	.long	.LFB27-.Ltext0
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
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST11:
	.long	.LFB28-.Ltext0
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
	.long	.LFE28-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST12:
	.long	.LVL49-.Ltext0
	.long	.LVL50-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL50-.Ltext0
	.long	.LFE28-.Ltext0
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
.LASF13:
	.string	"readeflags"
.LASF23:
	.string	"apicid"
.LASF14:
	.string	"eflags"
.LASF0:
	.string	"uint"
.LASF10:
	.string	"year"
.LASF18:
	.string	"value"
.LASF25:
	.string	"cmos_read"
.LASF17:
	.string	"index"
.LASF15:
	.string	"outb"
.LASF28:
	.string	"cprintf"
.LASF30:
	.string	"GNU C11 5.3.1 20160413 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF29:
	.string	"memcmp"
.LASF33:
	.string	"rtcdate"
.LASF1:
	.string	"ushort"
.LASF26:
	.string	"fill_rtcdate"
.LASF24:
	.string	"addr"
.LASF4:
	.string	"uchar"
.LASF8:
	.string	"hour"
.LASF5:
	.string	"unsigned char"
.LASF20:
	.string	"lapiceoi"
.LASF35:
	.string	"lapic"
.LASF21:
	.string	"microdelay"
.LASF6:
	.string	"second"
.LASF2:
	.string	"unsigned int"
.LASF19:
	.string	"lapicinit"
.LASF3:
	.string	"short unsigned int"
.LASF31:
	.string	"lapic.c"
.LASF34:
	.string	"cpunum"
.LASF9:
	.string	"month"
.LASF12:
	.string	"data"
.LASF7:
	.string	"minute"
.LASF11:
	.string	"port"
.LASF27:
	.string	"cmostime"
.LASF16:
	.string	"lapicw"
.LASF22:
	.string	"lapicstartap"
.LASF32:
	.string	"/home/hprem991/Desktop/Academics/Binghamton/Courses/OS/Patching/xv6-cs550-2016,1s-p1-baseline"
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
