.file	"addmany.s"	
	.section	.mydata,"aMS",@progbits,1
.LC0:
	.string	"The sum of %d %d %d %d %d %d %d %d  is %d \n"
	.text
.globl main
	.type	main, @function
main:
	subq	$32, %rsp
	movl	$5, %r9d
	movl	$4, %r8d
	movl	$3, %ecx
	movl	$2, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	movl	$36, 24(%rsp)
	movl	$8, 16(%rsp)
	movl	$7, 8(%rsp)
	movl	$6, (%rsp)
	call	printf
	addq	$32, %rsp
	ret
