	.file	"altadd_spin.cpp"
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.text._ZN9TimeStampC2Ev,"axG",@progbits,_ZN9TimeStampC5Ev,comdat
	.align 2
	.weak	_ZN9TimeStampC2Ev
	.type	_ZN9TimeStampC2Ev, @function
_ZN9TimeStampC2Ev:
.LFB1371:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	.cfi_offset 3, -24
	call	_ZN9TimeStamp3ticEv
	movl	$0, %eax
#APP
# 14 "TimeStamp.hh" 1
	cpuid
# 0 "" 2
# 15 "TimeStamp.hh" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, 8(%rax)
	movq	-24(%rbp), %rax
	movl	%edx, 12(%rax)
	movl	$0, %eax
#APP
# 16 "TimeStamp.hh" 1
	cpuid
# 0 "" 2
#NO_APP
	movq	-24(%rbp), %rax
	movl	12(%rax), %edi
	movq	-24(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	4(%rax), %edx
	movq	-24(%rbp), %rax
	movl	(%rax), %esi
	movq	-24(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	_ZN9TimeStamp7convertEjjjj
	cvttsd2si	%xmm0, %edx
	movq	-24(%rbp), %rax
	movl	%edx, 16(%rax)
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	testl	%eax, %eax
	jns	.L1
	movq	-24(%rbp), %rax
	movl	$0, 16(%rax)
.L1:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1371:
	.size	_ZN9TimeStampC2Ev, .-_ZN9TimeStampC2Ev
	.section	.text._ZN9TimeStamp3ticEv,"axG",@progbits,_ZN9TimeStamp3ticEv,comdat
	.align 2
	.weak	_ZN9TimeStamp3ticEv
	.type	_ZN9TimeStamp3ticEv, @function
_ZN9TimeStamp3ticEv:
.LFB1375:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
#APP
# 32 "TimeStamp.hh" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, (%rax)
	movq	-8(%rbp), %rax
	movl	%edx, 4(%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1375:
	.size	_ZN9TimeStamp3ticEv, .-_ZN9TimeStamp3ticEv
	.section	.text._ZN9TimeStamp3tocEv,"axG",@progbits,_ZN9TimeStamp3tocEv,comdat
	.align 2
	.weak	_ZN9TimeStamp3tocEv
	.type	_ZN9TimeStamp3tocEv, @function
_ZN9TimeStamp3tocEv:
.LFB1376:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
#APP
# 35 "TimeStamp.hh" 1
	rdtsc
# 0 "" 2
#NO_APP
	movl	%eax, %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, 8(%rax)
	movq	-8(%rbp), %rax
	movl	%edx, 12(%rax)
	movq	-8(%rbp), %rax
	movl	12(%rax), %edi
	movq	-8(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %esi
	movq	-8(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	_ZN9TimeStamp7convertEjjjj
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1376:
	.size	_ZN9TimeStamp3tocEv, .-_ZN9TimeStamp3tocEv
	.section	.text._ZN9TimeStamp7convertEjjjj,"axG",@progbits,_ZN9TimeStamp7convertEjjjj,comdat
	.align 2
	.weak	_ZN9TimeStamp7convertEjjjj
	.type	_ZN9TimeStamp7convertEjjjj, @function
_ZN9TimeStamp7convertEjjjj:
.LFB1378:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movl	%r8d, -40(%rbp)
	movl	-32(%rbp), %eax
	movl	-40(%rbp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %eax
	testq	%rax, %rax
	js	.L6
	cvtsi2sdq	%rax, %xmm0
	jmp	.L7
.L6:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L7:
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm1
	movsd	.LC0(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	-36(%rbp), %eax
	testq	%rax, %rax
	js	.L8
	cvtsi2sdq	%rax, %xmm0
	jmp	.L9
.L8:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L9:
	movapd	%xmm0, %xmm1
	addsd	-8(%rbp), %xmm1
	movl	-28(%rbp), %eax
	testq	%rax, %rax
	js	.L10
	cvtsi2sdq	%rax, %xmm0
	jmp	.L11
.L10:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L11:
	movapd	%xmm1, %xmm2
	subsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -48(%rbp)
	movsd	-48(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1378:
	.size	_ZN9TimeStamp7convertEjjjj, .-_ZN9TimeStamp7convertEjjjj
	.globl	fnlist
	.bss
	.align 32
	.type	fnlist, @object
	.size	fnlist, 56
fnlist:
	.zero	56
	.globl	arglist
	.align 32
	.type	arglist, @object
	.size	arglist, 56
arglist:
	.zero	56
	.globl	workflag
	.align 16
	.type	workflag, @object
	.size	workflag, 28
workflag:
	.zero	28
	.globl	spin
	.align 16
	.type	spin, @object
	.size	spin, 28
spin:
	.zero	28
	.globl	pthrd
	.align 32
	.type	pthrd, @object
	.size	pthrd, 56
pthrd:
	.zero	56
	.text
	.globl	_Z6addonePv
	.type	_Z6addonePv, @function
_Z6addonePv:
.LFB1379:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	1(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1379:
	.size	_Z6addonePv, .-_Z6addonePv
	.globl	_Z6addtwoPv
	.type	_Z6addtwoPv, @function
_Z6addtwoPv:
.LFB1380:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	leaq	2(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1380:
	.size	_Z6addtwoPv, .-_Z6addtwoPv
	.globl	_Z6exitfnPv
	.type	_Z6exitfnPv, @function
_Z6exitfnPv:
.LFB1381:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	subq	$1, %rax
	salq	$2, %rax
	addq	$spin, %rax
	movq	%rax, %rdi
	call	pthread_spin_unlock
	movl	$0, %edi
	call	pthread_exit
	.cfi_endproc
.LFE1381:
	.size	_Z6exitfnPv, .-_Z6exitfnPv
	.globl	_Z6workerPv
	.type	_Z6workerPv, @function
_Z6workerPv:
.LFB1382:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
.L17:
	movl	-4(%rbp), %eax
	cltq
	subq	$1, %rax
	salq	$2, %rax
	addq	$spin, %rax
	movq	%rax, %rdi
	call	pthread_spin_lock
	movl	-4(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	workflag(,%rax,4), %eax
	cmpl	$1, %eax
	jne	.L16
	movl	-4(%rbp), %eax
	subl	$1, %eax
	cltq
	movq	fnlist(,%rax,8), %rdx
	movl	-4(%rbp), %eax
	subl	$1, %eax
	cltq
	movq	arglist(,%rax,8), %rax
	movq	%rax, %rdi
	call	*%rdx
	movl	-4(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	$0, workflag(,%rax,4)
.L16:
	movl	-4(%rbp), %eax
	cltq
	subq	$1, %rax
	salq	$2, %rax
	addq	$spin, %rax
	movq	%rax, %rdi
	call	pthread_spin_unlock
	jmp	.L17
	.cfi_endproc
.LFE1382:
	.size	_Z6workerPv, .-_Z6workerPv
	.globl	_Z13spawn_workersv
	.type	_Z13spawn_workersv, @function
_Z13spawn_workersv:
.LFB1383:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L19
.L20:
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$spin, %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_spin_init
	movl	-4(%rbp), %eax
	cltq
	movl	$0, workflag(,%rax,4)
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	movl	%edx, _ZZ13spawn_workersvE7tidlist(,%rax,4)
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	_ZZ13spawn_workersvE7tidlist(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	addq	$pthrd, %rax
	movq	%rdx, %rcx
	movl	$_Z6workerPv, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_create
	addl	$1, -4(%rbp)
.L19:
	cmpl	$6, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L20
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1383:
	.size	_Z13spawn_workersv, .-_Z13spawn_workersv
	.globl	_Z16shutdown_workersv
	.type	_Z16shutdown_workersv, @function
_Z16shutdown_workersv:
.LFB1384:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L22
.L25:
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$spin, %rax
	movq	%rax, %rdi
	call	pthread_spin_lock
	movl	-4(%rbp), %eax
	cltq
	movl	workflag(,%rax,4), %eax
	testl	%eax, %eax
	jne	.L23
	movl	-4(%rbp), %eax
	cltq
	movq	$_Z6exitfnPv, fnlist(,%rax,8)
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	movl	%edx, _ZZ16shutdown_workersvE7tidlist(,%rax,4)
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	leaq	_ZZ16shutdown_workersvE7tidlist(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	movq	%rdx, arglist(,%rax,8)
	movl	-4(%rbp), %eax
	cltq
	movl	$1, workflag(,%rax,4)
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$spin, %rax
	movq	%rax, %rdi
	call	pthread_spin_unlock
	nop
	movl	-4(%rbp), %eax
	cltq
	movq	pthrd(,%rax,8), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pthread_join
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$spin, %rax
	movq	%rax, %rdi
	call	pthread_spin_destroy
	addl	$1, -4(%rbp)
	jmp	.L22
.L23:
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$spin, %rax
	movq	%rax, %rdi
	call	pthread_spin_unlock
	jmp	.L25
.L22:
	cmpl	$6, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L25
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1384:
	.size	_Z16shutdown_workersv, .-_Z16shutdown_workersv
	.globl	_Z10assignworkiiPl
	.type	_Z10assignworkiiPl, @function
_Z10assignworkiiPl:
.LFB1385:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	movl	-24(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
.L30:
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$spin, %rax
	movq	%rax, %rdi
	call	pthread_spin_lock
	movl	-4(%rbp), %eax
	cltq
	movl	workflag(,%rax,4), %eax
	testl	%eax, %eax
	jne	.L27
	movl	-20(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L28
	movl	$_Z6addonePv, %eax
	jmp	.L29
.L28:
	movl	$_Z6addtwoPv, %eax
.L29:
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rax, fnlist(,%rdx,8)
	movl	-24(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdx
	addq	-32(%rbp), %rdx
	movl	-4(%rbp), %eax
	cltq
	movq	%rdx, arglist(,%rax,8)
	movl	-4(%rbp), %eax
	cltq
	movl	$1, workflag(,%rax,4)
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$spin, %rax
	movq	%rax, %rdi
	call	pthread_spin_unlock
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L27:
	.cfi_restore_state
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	$spin, %rax
	movq	%rax, %rdi
	call	pthread_spin_unlock
	jmp	.L30
	.cfi_endproc
.LFE1385:
	.size	_Z10assignworkiiPl, .-_Z10assignworkiiPl
	.globl	_Z7managerPli
	.type	_Z7managerPli, @function
_Z7managerPli:
.LFB1386:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	call	_Z13spawn_workersv
	movl	$0, -8(%rbp)
	jmp	.L32
.L37:
	movl	$1, -4(%rbp)
	jmp	.L33
.L34:
	movq	-24(%rbp), %rdx
	movl	-4(%rbp), %ecx
	movl	-8(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	_Z10assignworkiiPl
	addl	$1, -4(%rbp)
.L33:
	cmpl	$7, -4(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L34
	movl	-8(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L35
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_Z6addonePv
	jmp	.L36
.L35:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_Z6addtwoPv
.L36:
	addl	$1, -8(%rbp)
.L32:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	setl	%al
	testb	%al, %al
	jne	.L37
	call	_Z16shutdown_workersv
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1386:
	.size	_Z7managerPli, .-_Z7managerPli
	.section	.rodata
.LC1:
	.string	"OUTPUT/altadd_spin.txt"
.LC2:
	.string	"nprocs = "
.LC3:
	.string	"nthreads = "
.LC4:
	.string	"count = "
.LC5:
	.string	"TIEBREAK = "
	.align 8
.LC6:
	.string	"average per parallel region = "
.LC7:
	.string	"tgid = "
	.text
	.globl	main
	.type	main, @function
main:
.LFB1387:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA1387
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$664, %rsp
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, -556(%rbp)
	jmp	.L39
	.cfi_offset 3, -24
.L40:
	movl	-556(%rbp), %eax
	cltq
	movq	$0, -656(%rbp,%rax,8)
	addl	$1, -556(%rbp)
.L39:
	cmpl	$7, -556(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L40
	movl	$100, -548(%rbp)
	leaq	-592(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9TimeStampC1Ev
	leaq	-592(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9TimeStamp3ticEv
	movl	-548(%rbp), %edx
	leaq	-656(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
.LEHB0:
	call	_Z7managerPli
	leaq	-592(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN9TimeStamp3tocEv
	movsd	%xmm0, -568(%rbp)
	leaq	-544(%rbp), %rax
	movl	$1, %edx
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode
.LEHE0:
	leaq	-544(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
.LEHB1:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	$4, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-544(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	$8, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-544(%rbp), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	-548(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-544(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	$0, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	cvtsi2sd	-548(%rbp), %xmm0
	movsd	-568(%rbp), %xmm1
	movapd	%xmm1, %xmm2
	divsd	%xmm0, %xmm2
	movsd	%xmm2, -664(%rbp)
	leaq	-544(%rbp), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movsd	-664(%rbp), %xmm0
	movq	%rax, %rdi
	call	_ZNSolsEd
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-544(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv
	movl	$.LC2, %esi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	$4, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	movl	$.LC3, %esi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	$8, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	movl	$.LC4, %esi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	-548(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	leaq	-544(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	$0, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	cvtsi2sd	-548(%rbp), %xmm0
	movsd	-568(%rbp), %xmm1
	movapd	%xmm1, %xmm2
	divsd	%xmm0, %xmm2
	movsd	%xmm2, -672(%rbp)
	movl	$.LC6, %esi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movsd	-672(%rbp), %xmm0
	movq	%rax, %rdi
	call	_ZNSolsEd
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	call	getpid
	movl	%eax, %ebx
	movl	$.LC7, %esi
	movl	$_ZSt4cout, %edi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%ebx, %esi
	movq	%rax, %rdi
	call	_ZNSolsEi
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
	movl	$0, -552(%rbp)
	jmp	.L41
.L42:
	movl	-552(%rbp), %eax
	cltq
	movq	-656(%rbp,%rax,8), %rax
	movq	%rax, %rsi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEl
	movl	$_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
	movq	%rax, %rdi
	call	_ZNSolsEPFRSoS_E
.LEHE1:
	addl	$1, -552(%rbp)
.L41:
	cmpl	$7, -552(%rbp)
	setle	%al
	testb	%al, %al
	jne	.L42
	leaq	-544(%rbp), %rax
	movq	%rax, %rdi
.LEHB2:
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
.LEHE2:
	movl	$0, %eax
	movq	-24(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L44
	jmp	.L46
.L45:
	movq	%rax, %rbx
	leaq	-544(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB3:
	call	_Unwind_Resume
.LEHE3:
.L46:
	call	__stack_chk_fail
.L44:
	addq	$664, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1387:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1387:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1387-.LLSDACSB1387
.LLSDACSB1387:
	.uleb128 .LEHB0-.LFB1387
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB1387
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L45-.LFB1387
	.uleb128 0
	.uleb128 .LEHB2-.LFB1387
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB1387
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE1387:
	.text
	.size	main, .-main
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1475:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L47
	cmpl	$65535, -8(%rbp)
	jne	.L47
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$_ZNSt8ios_base4InitD1Ev, %eax
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movq	%rax, %rdi
	call	__cxa_atexit
.L47:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1475:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.section	.rodata
	.align 8
	.type	_ZL2PI, @object
	.size	_ZL2PI, 8
_ZL2PI:
	.long	1413754136
	.long	1074340347
	.align 4
	.type	_ZL8nthreads, @object
	.size	_ZL8nthreads, 4
_ZL8nthreads:
	.long	8
	.align 4
	.type	_ZL6nprocs, @object
	.size	_ZL6nprocs, 4
_ZL6nprocs:
	.long	4
	.text
	.type	_GLOBAL__sub_I_fnlist, @function
_GLOBAL__sub_I_fnlist:
.LFB1476:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1476:
	.size	_GLOBAL__sub_I_fnlist, .-_GLOBAL__sub_I_fnlist
	.section	.ctors,"aw",@progbits
	.align 8
	.quad	_GLOBAL__sub_I_fnlist
	.local	_ZZ16shutdown_workersvE7tidlist
	.comm	_ZZ16shutdown_workersvE7tidlist,28,16
	.local	_ZZ13spawn_workersvE7tidlist
	.comm	_ZZ13spawn_workersvE7tidlist,28,16
	.weakref	_ZL20__gthrw_pthread_oncePiPFvvE,pthread_once
	.weakref	_ZL27__gthrw_pthread_getspecificj,pthread_getspecific
	.weakref	_ZL27__gthrw_pthread_setspecificjPKv,pthread_setspecific
	.weakref	_ZL22__gthrw_pthread_createPmPK14pthread_attr_tPFPvS3_ES3_,pthread_create
	.weakref	_ZL20__gthrw_pthread_joinmPPv,pthread_join
	.weakref	_ZL21__gthrw_pthread_equalmm,pthread_equal
	.weakref	_ZL20__gthrw_pthread_selfv,pthread_self
	.weakref	_ZL22__gthrw_pthread_detachm,pthread_detach
	.weakref	_ZL22__gthrw_pthread_cancelm,pthread_cancel
	.weakref	_ZL19__gthrw_sched_yieldv,sched_yield
	.weakref	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t,pthread_mutex_lock
	.weakref	_ZL29__gthrw_pthread_mutex_trylockP15pthread_mutex_t,pthread_mutex_trylock
	.weakref	_ZL31__gthrw_pthread_mutex_timedlockP15pthread_mutex_tPK8timespec,pthread_mutex_timedlock
	.weakref	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t,pthread_mutex_unlock
	.weakref	_ZL26__gthrw_pthread_mutex_initP15pthread_mutex_tPK19pthread_mutexattr_t,pthread_mutex_init
	.weakref	_ZL29__gthrw_pthread_mutex_destroyP15pthread_mutex_t,pthread_mutex_destroy
	.weakref	_ZL30__gthrw_pthread_cond_broadcastP14pthread_cond_t,pthread_cond_broadcast
	.weakref	_ZL27__gthrw_pthread_cond_signalP14pthread_cond_t,pthread_cond_signal
	.weakref	_ZL25__gthrw_pthread_cond_waitP14pthread_cond_tP15pthread_mutex_t,pthread_cond_wait
	.weakref	_ZL30__gthrw_pthread_cond_timedwaitP14pthread_cond_tP15pthread_mutex_tPK8timespec,pthread_cond_timedwait
	.weakref	_ZL28__gthrw_pthread_cond_destroyP14pthread_cond_t,pthread_cond_destroy
	.weakref	_ZL26__gthrw_pthread_key_createPjPFvPvE,pthread_key_create
	.weakref	_ZL26__gthrw_pthread_key_deletej,pthread_key_delete
	.weakref	_ZL30__gthrw_pthread_mutexattr_initP19pthread_mutexattr_t,pthread_mutexattr_init
	.weakref	_ZL33__gthrw_pthread_mutexattr_settypeP19pthread_mutexattr_ti,pthread_mutexattr_settype
	.weakref	_ZL33__gthrw_pthread_mutexattr_destroyP19pthread_mutexattr_t,pthread_mutexattr_destroy
	.weak	_ZN9TimeStampC1Ev
	.set	_ZN9TimeStampC1Ev,_ZN9TimeStampC2Ev
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1106247680
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits

