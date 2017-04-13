	.file	"segf.cpp"
	.section	.rodata
.LC0:
	.string	"in ff0: "
	.text
	.globl	_Z3ff0PlS_l
	.type	_Z3ff0PlS_l, @function
_Z3ff0PlS_l:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	$0, -16(%ebp)
	jmp	.L2
.L3:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	$0, (%eax)
	addl	$1, -16(%ebp)
.L2:
	cmpl	$999, -16(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L3
	movl	$0, -12(%ebp)
	jmp	.L4
.L5:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %ecx
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %ebx
	movl	12(%ebp), %eax
	addl	%ebx, %eax
	movl	(%eax), %eax
	imull	%ecx, %eax
	movl	%eax, (%edx)
	addl	$1, -12(%ebp)
.L4:
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	setl	%al
	testb	%al, %al
	jne	.L5
	movl	$.LC0, (%esp)
	call	printf
	movl	$1000, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7sum_arrPll
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	_Z3ff0PlS_l, .-_Z3ff0PlS_l
	.section	.rodata
.LC1:
	.string	"in f1: "
	.text
	.globl	_Z2f1Pll
	.type	_Z2f1Pll, @function
_Z2f1Pll:
.LFB1:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA1
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4000040, %esp
	movl	$0, -4000012(%ebp)
	jmp	.L7
.L8:
	movl	-4000012(%ebp), %eax
	movl	$0, -4000008(%ebp,%eax,4)
	addl	$1, -4000012(%ebp)
.L7:
	cmpl	$999999, -4000012(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L8
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
.LEHB0:
	call	_Z2f0Pll
	movl	$.LC1, (%esp)
	call	printf
	movl	$1000000, 4(%esp)
	leal	-4000008(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7sum_arrPll
.LEHE0:
	jmp	.L11
.L10:
	movl	%eax, (%esp)
.LEHB1:
	call	_Unwind_Resume
.LEHE1:
.L11:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1-.LLSDACSB1
.LLSDACSB1:
	.uleb128 .LEHB0-.LFB1
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L10-.LFB1
	.uleb128 0
	.uleb128 .LEHB1-.LFB1
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE1:
	.text
	.size	_Z2f1Pll, .-_Z2f1Pll
	.section	.rodata
.LC2:
	.string	"in f2: "
	.text
	.globl	_Z2f2v
	.type	_Z2f2v, @function
_Z2f2v:
.LFB2:
	.cfi_startproc
	.cfi_personality 0,__gxx_personality_v0
	.cfi_lsda 0,.LLSDA2
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$4000040, %esp
	movl	$0, -4000012(%ebp)
	jmp	.L13
.L14:
	movl	-4000012(%ebp), %eax
	movl	$0, -4000008(%ebp,%eax,4)
	addl	$1, -4000012(%ebp)
.L13:
	cmpl	$999999, -4000012(%ebp)
	setle	%al
	testb	%al, %al
	jne	.L14
	movl	$.LC2, (%esp)
.LEHB2:
	call	printf
	movl	$1000000, 4(%esp)
	leal	-4000008(%ebp), %eax
	movl	%eax, (%esp)
	call	_Z7sum_arrPll
.LEHE2:
	jmp	.L17
.L16:
	movl	%eax, (%esp)
.LEHB3:
	call	_Unwind_Resume
.LEHE3:
.L17:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.section	.gcc_except_table
.LLSDA2:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2-.LLSDACSB2
.LLSDACSB2:
	.uleb128 .LEHB2-.LFB2
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L16-.LFB2
	.uleb128 0
	.uleb128 .LEHB3-.LFB2
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE2:
	.text
	.size	_Z2f2v, .-_Z2f2v
	.ident	"GCC: (Ubuntu/Linaro 4.7.2-2ubuntu1) 4.7.2"
	.section	.note.GNU-stack,"",@progbits

