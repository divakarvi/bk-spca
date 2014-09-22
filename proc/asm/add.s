	.file	"add.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"The sum of %d and %d is %d \n"
	.text
	.p2align 4,,15
.globl main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	movl	$3, %ecx
	movl	$2, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	xorl	%eax, %eax
	jmp	printf
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-4)"
	.section	.note.GNU-stack,"",@progbits
