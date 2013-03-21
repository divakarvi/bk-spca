.align 16, 0x90
.globl 	asm4x1x4
asm4x1x4:
# parameter 1: %rdi (a)
# parameter 2: %rsi (b)
# parameter 3: %rdx (c)
# parameter 4: %rcx (lda)
# parameter 5: %r8  (ldb)
# parameter 6: %r9  (ldc)
	pushq   %r12				
	#load c
	shlq $3, %rcx
	shlq $3, %r8
	shlq $3, %r9
	movaps 	(%rdx), %xmm4
	movaps 	(%rdx,%r9), %xmm5
	movaps 	(%rdx,%r9,2), %xmm6
	lea 	(%r9,%r9,2), %r10
	movaps 	(%rdx,%r10), %xmm7
	movaps 	16(%rdx), %xmm8
	movaps 	16(%rdx,%r9), %xmm9
	movaps 	16(%rdx,%r9,2), %xmm10
	lea 	(%r9,%r9,2), %r10
	movaps 	16(%rdx,%r10), %xmm11

	
	#rax=16*ldb, save a and b in r11/12 for later
	lea 	(%r8, %r8), %rax
	movq 	%rdi, %r11
	movq 	%rsi, %r12

	#mult 4x1x4
	movaps	(%rsi), %xmm0                                
        movaps	(%rax,%rsi), %xmm1                            
        movaps	(%rdi), %xmm2                                
        movaps	%xmm2, %xmm3
        mulpd	%xmm0, %xmm2                                 
        addpd	%xmm2, %xmm4                                 
        mulpd 	%xmm1, %xmm3                                 
        addpd	%xmm3, %xmm6                                 
        movaps	(%rdi), %xmm2                                
        shufpd	$1, %xmm2, %xmm2                             
        movaps	%xmm2, %xmm3                                 
        mulpd	%xmm0, %xmm2                                 
        addpd	%xmm2, %xmm5                                 
        mulpd	%xmm1, %xmm3                                 
        addpd	%xmm3, %xmm7                                 
        movaps	16(%rdi), %xmm2                              
        movaps	%xmm2, %xmm3                                 
        mulpd	%xmm0, %xmm2                                 
        addpd	%xmm2, %xmm8                                 
        mulpd	%xmm1, %xmm3                                 
        addpd	%xmm3, %xmm10                                
        movaps	16(%rdi), %xmm2                              
        shufpd	$1, %xmm2, %xmm2                             
        movaps	%xmm2, %xmm3                                 
        mulpd	%xmm0, %xmm2                                 
        addpd	%xmm2, %xmm9                                 
        mulpd	%xmm1, %xmm3                                 
        addpd	%xmm3, %xmm11     

		
	#store c
	movaps 	%xmm4, (%rdx)
	movaps 	%xmm5, (%rdx,%r9)
	movaps 	%xmm6, (%rdx,%r9,2)
	lea 	(%r9,%r9,2), %r10
	movaps 	%xmm7, (%rdx,%r10)
	movaps 	%xmm8, 16(%rdx)
	movaps 	%xmm9, 16(%rdx,%r9)
	movaps 	%xmm10, 16(%rdx,%r9,2)
	lea 	(%r9,%r9,2), %r10
	movaps 	%xmm11, 16(%rdx,%r10)
	
	popq %r12
	ret
.align 16, 0x90
.type asm4x1x4, @function
	
	
	
	
