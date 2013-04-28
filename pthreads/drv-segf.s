	.file	"drv-segf.cpp"
	.section	.rodata
.LC0:
	.string	"sum = %ld\n"
	.text
	.globl	_Z7sum_arrPll
	.type	_Z7sum_arrPll, @function
_Z7sum_arrPll:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$0, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L2
.L3:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	%rax, -8(%rbp)
	addq	$1, -16(%rbp)
.L2:
	movq	-16(%rbp), %rax
	cmpq	-32(%rbp), %rax
	setl	%al
	testb	%al, %al
	jne	.L3
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z7sum_arrPll, .-_Z7sum_arrPll
	.section	.rodata
.LC1:
	.string	"a0 (in f0)= %p\n"
.LC2:
	.string	"pid (in f0) = %ld\n"
	.text
	.globl	_Z2f0Pll
	.type	_Z2f0Pll, @function
_Z2f0Pll:
.LFB1:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$8040, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -8040(%rbp)
	movq	%rsi, -8048(%rbp)
	leaq	-8032(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
.LEHB0:
	call	printf
	movl	$0, -20(%rbp)
	jmp	.L5
.L6:
	movl	-20(%rbp), %eax
	cltq
	movq	$0, -8032(%rbp,%rax,8)
	addl	$1, -20(%rbp)
.L5:
	cmpl	$999, -20(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L6
	movl	$1, %eax
#APP
# 21 "drv-segf.cpp" 1
	cpuid
# 0 "" 2
#NO_APP
	call	getpid
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movq	-8048(%rbp), %rdx
	movq	-8040(%rbp), %rcx
	leaq	-8032(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z3ff0PlS_l
.LEHE0:
	jmp	.L9
.L8:
	movq	%rax, %rdi
.LEHB1:
	call	_Unwind_Resume
.LEHE1:
.L9:
	addq	$8040, %rsp
	popq	%rbx
	popq	%rbp
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
	.uleb128 .L8-.LFB1
	.uleb128 0
	.uleb128 .LEHB1-.LFB1
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE1:
	.text
	.size	_Z2f0Pll, .-_Z2f0Pll
	.globl	_Z4run1v
	.type	_Z4run1v, @function
_Z4run1v:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$40000, %edi
	call	_Znam
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L11
.L12:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	movq	%rax, (%rdx)
	addl	$1, -4(%rbp)
.L11:
	cmpl	$4999, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L12
	movq	-16(%rbp), %rax
	movl	$5000, %esi
	movq	%rax, %rdi
	call	_Z2f0Pll
	cmpq	$0, -16(%rbp)
	je	.L10
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdaPv
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z4run1v, .-_Z4run1v
	.globl	_Z4run2v
	.type	_Z4run2v, @function
_Z4run2v:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$16000, %edi
	call	_Znam
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L15
.L16:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	movq	%rax, (%rdx)
	addl	$1, -4(%rbp)
.L15:
	cmpl	$1999, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L16
	movq	-16(%rbp), %rax
	movl	$2000, %esi
	movq	%rax, %rdi
	call	_Z2f1Pll
	cmpq	$0, -16(%rbp)
	je	.L14
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdaPv
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z4run2v, .-_Z4run2v
	.globl	_Z4run3v
	.type	_Z4run3v, @function
_Z4run3v:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$16000, %edi
	call	_Znam
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L19
.L20:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	addl	$10000, %eax
	cltq
	movq	%rax, (%rdx)
	addl	$1, -4(%rbp)
.L19:
	cmpl	$1999, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L20
	movq	-16(%rbp), %rax
	movl	$2000, %esi
	movq	%rax, %rdi
	call	_Z2f1Pll
	cmpq	$0, -16(%rbp)
	je	.L18
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdaPv
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z4run3v, .-_Z4run3v
	.globl	_Z4run4v
	.type	_Z4run4v, @function
_Z4run4v:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$16000, %edi
	call	_Znam
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L23
.L24:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	negl	%eax
	cltq
	movq	%rax, (%rdx)
	addl	$1, -4(%rbp)
.L23:
	cmpl	$1999, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L24
	movq	-16(%rbp), %rax
	movl	$2000, %esi
	movq	%rax, %rdi
	call	_Z2f0Pll
	cmpq	$0, -16(%rbp)
	je	.L22
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdaPv
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	_Z4run4v, .-_Z4run4v
	.globl	_Z4run5v
	.type	_Z4run5v, @function
_Z4run5v:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$1600000, %edi
	call	_Znam
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L27
.L28:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movl	$-100, %eax
	subl	-4(%rbp), %eax
	cltq
	movq	%rax, (%rdx)
	addl	$1, -4(%rbp)
.L27:
	cmpl	$199999, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L28
	movq	-16(%rbp), %rax
	movl	$200000, %esi
	movq	%rax, %rdi
	call	_Z2f0Pll
	cmpq	$0, -16(%rbp)
	je	.L26
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdaPv
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_Z4run5v, .-_Z4run5v
	.globl	_Z4run6v
	.type	_Z4run6v, @function
_Z4run6v:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$16000, %edi
	call	_Znam
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L31
.L32:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movl	$-100000, %eax
	subl	-4(%rbp), %eax
	cltq
	movq	%rax, (%rdx)
	addl	$1, -4(%rbp)
.L31:
	cmpl	$1999, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L32
	call	_Z2f2v
	movq	-16(%rbp), %rax
	movl	$2000, %esi
	movq	%rax, %rdi
	call	_Z2f0Pll
	cmpq	$0, -16(%rbp)
	je	.L30
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdaPv
.L30:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_Z4run6v, .-_Z4run6v
	.section	.rodata
	.align 8
.LC3:
	.string	"run1(): upward from st ptr, beyond stack_end"
	.align 8
.LC4:
	.string	"run2(): upward from st ptr, within stack_end"
	.align 8
.LC5:
	.string	"run3(): upward from st ptr, within stack_end avoiding %rip\n"
	.align 8
.LC6:
	.string	"run4(): downward from st ptr, within stack_begin, overwrite %rip\n"
	.align 8
.LC7:
	.string	"run5(): downward from st ptr, beyond stack_begin"
	.align 8
.LC8:
	.string	"run6(): downward from st ptr, within stack_begin, no %rip overwrite\n"
.LC9:
	.string	"run = "
.LC10:
	.string	"%d"
.LC11:
	.string	"getpid() again = %ld \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA8
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$.LC3, %edi
.LEHB2:
	call	puts
	movl	$.LC4, %edi
	call	puts
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC6, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC7, %edi
	call	puts
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	leaq	-4(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC10, %edi
	movl	$0, %eax
	call	scanf
	movl	-4(%rbp), %eax
	cmpl	$6, %eax
	ja	.L35
	movl	%eax, %eax
	movq	.L42(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L42:
	.quad	.L35
	.quad	.L36
	.quad	.L37
	.quad	.L38
	.quad	.L39
	.quad	.L40
	.quad	.L41
	.text
.L36:
	call	_Z4run1v
	jmp	.L35
.L37:
	call	_Z4run2v
	jmp	.L35
.L38:
	call	_Z4run3v
	jmp	.L35
.L39:
	call	_Z4run4v
	jmp	.L35
.L40:
	call	_Z4run5v
	movl	$39, %edi
	movl	$0, %eax
	call	syscall
	movq	%rax, %rsi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	jmp	.L35
.L41:
	call	_Z4run6v
.LEHE2:
	nop
.L35:
	movl	$0, %eax
	jmp	.L46
.L45:
	movq	%rax, %rdi
.LEHB3:
	call	_Unwind_Resume
.LEHE3:
.L46:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.section	.gcc_except_table
.LLSDA8:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8-.LLSDACSB8
.LLSDACSB8:
	.uleb128 .LEHB2-.LFB8
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L45-.LFB8
	.uleb128 0
	.uleb128 .LEHB3-.LFB8
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE8:
	.text
	.size	main, .-main
	.ident	"GCC: (GNU) 4.7.2 20120921 (Red Hat 4.7.2-2)"
	.section	.note.GNU-stack,"",@progbits
