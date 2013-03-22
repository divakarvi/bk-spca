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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	addl	$1, -4(%rbp)
.L2:
	cmpl	$999, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L3
	movq	$0, -16(%rbp)
	jmp	.L4
.L5:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rcx
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rsi
	movq	-32(%rbp), %rax
	addq	%rsi, %rax
	movq	(%rax), %rax
	imulq	%rcx, %rax
	movq	%rax, (%rdx)
	addq	$1, -16(%rbp)
.L4:
	movq	-16(%rbp), %rax
	cmpq	-40(%rbp), %rax
	setl	%al
	testb	%al, %al
	jne	.L5
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movq	-24(%rbp), %rax
	movl	$1000, %esi
	movq	%rax, %rdi
	call	_Z7sum_arrPll
	leave
	.cfi_def_cfa 7, 8
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
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8000032, %rsp
	movq	%rdi, -8000024(%rbp)
	movq	%rsi, -8000032(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L7
.L8:
	movl	-4(%rbp), %eax
	cltq
	movq	$0, -8000016(%rbp,%rax,8)
	addl	$1, -4(%rbp)
.L7:
	cmpl	$999999, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L8
	movq	-8000032(%rbp), %rdx
	movq	-8000024(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
.LEHB0:
	call	_Z2f0Pll
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	leaq	-8000016(%rbp), %rax
	movl	$1000000, %esi
	movq	%rax, %rdi
	call	_Z7sum_arrPll
.LEHE0:
	jmp	.L11
.L10:
	movq	%rax, %rdi
.LEHB1:
	call	_Unwind_Resume
.LEHE1:
.L11:
	leave
	.cfi_def_cfa 7, 8
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
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA2
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8000016, %rsp
	movl	$0, -4(%rbp)
	jmp	.L13
.L14:
	movl	-4(%rbp), %eax
	cltq
	movq	$0, -8000016(%rbp,%rax,8)
	addl	$1, -4(%rbp)
.L13:
	cmpl	$999999, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L14
	movl	$.LC2, %edi
	movl	$0, %eax
.LEHB2:
	call	printf
	leaq	-8000016(%rbp), %rax
	movl	$1000000, %esi
	movq	%rax, %rdi
	call	_Z7sum_arrPll
.LEHE2:
	jmp	.L17
.L16:
	movq	%rax, %rdi
.LEHB3:
	call	_Unwind_Resume
.LEHE3:
.L17:
	leave
	.cfi_def_cfa 7, 8
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
	.ident	"GCC: (GNU) 4.7.2 20120921 (Red Hat 4.7.2-2)"
	.section	.note.GNU-stack,"",@progbits
