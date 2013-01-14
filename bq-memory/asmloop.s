.align 16, 0x90
.globl 	asmloop
asmloop:
# parameter 1: %rdi (a)
# parameter 2: %rsi (b)
# parameter 3: %rdx (c)
	#loading c
	movaps	(%rdx), %xmm4                                 
        movaps	32(%rdx), %xmm5                               
        movaps	64(%rdx), %xmm6                               
        movaps	96(%rdx), %xmm7                               
        movaps	16(%rdx), %xmm8                               
        movaps	48(%rdx), %xmm9                               
        movaps	80(%rdx), %xmm10                              
        movaps	112(%rdx), %xmm11

	xorq	%rax, %rax
	#mult 4xnx4
	.align 	16, 0x90
loop:
	incq	%rax
        movaps	(%rdi), %xmm2                                 
        movaps	(%rsi), %xmm0                                 
        mulpd	%xmm0, %xmm2                                  
        movaps	16(%rdi), %xmm3                               
        movaps	%xmm3, %xmm12                                 
        mulpd	%xmm0, %xmm3                                  
        addpd	%xmm2, %xmm4                                  
        addpd	%xmm3, %xmm8                                  
        movaps	16(%rsi), %xmm1
        mulpd	%xmm1, %xmm12                                 
        movaps	(%rdi), %xmm2
        mulpd	%xmm1, %xmm2                                  
        addpd	%xmm2, %xmm6                                  
        addpd	%xmm12, %xmm10
        movaps	(%rdi), %xmm3
        shufpd	$1, %xmm3, %xmm3                              
        movaps	%xmm3, %xmm2                                  
        mulpd 	%xmm1, %xmm3                                  
        mulpd 	%xmm0, %xmm2
        addq	$32, %rsi
        addpd 	%xmm3, %xmm7                                  
        addpd 	%xmm2, %xmm5                                  
        movaps	16(%rdi), %xmm2
        addq	$32, %rdi
        shufpd	$1, %xmm2, %xmm2                              
        movaps 	%xmm2, %xmm3                                  
        mulpd 	%xmm0, %xmm2                                  
        mulpd	%xmm1, %xmm3                                  
        addpd 	%xmm2, %xmm9                                  
        addpd	%xmm3, %xmm11
	cmpq 	$100,  %rax
	jl	loop
	
	#storing c
        movaps 	%xmm4, (%rdx)                                 
        movaps	%xmm5, 32(%rdx)                               
        movaps	%xmm6, 64(%rdx)                               
        movaps	%xmm7, 96(%rdx)                               
        movaps	%xmm8, 16(%rdx)                               
        movaps	%xmm9, 48(%rdx)                               
        movaps	%xmm10, 80(%rdx)                              
        movaps	%xmm11, 112(%rdx)                             
	ret
.align 16, 0x90
.type asmloop, @function
	
	
	
	
