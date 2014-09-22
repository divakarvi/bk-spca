.file	"addtwo.s"
	.section	.mydata,"aMS",@progbits,1
.LC0:
	.string	"The sum of %d and %d is %d\n"
	.text
.globl main
	.type	main, @function
main:
	movl	$3, %ecx
	movl	$2, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	call	printf
	ret
