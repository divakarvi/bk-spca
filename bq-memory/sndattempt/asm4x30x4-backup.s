.align 16, 0x90
.globl 	asm4x30x4
asm4x30x4:
# parameter 1: %rdi (a)
# parameter 2: %rsi (b)
# parameter 3: %rdx (c)
# parameter 4: %rcx (lda)
# parameter 5: %r8  (ldb)
# parameter 6: %r9  (ldc)
	pushq %r12
	pushq %r13

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
	
	#xorq 	%r13, %r13
	lea 	(%rsi, %r8), %r13
	
loop:
	#incq %r13

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

	addq 	%rcx, %rdi
	#mult 4x2x4
	movaps	(%r13), %xmm0                                
        movaps	(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x3x4
	movaps	16(%rsi), %xmm0                                
        movaps	16(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x4x4
	movaps	16(%r13), %xmm0                                
        movaps	16(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x5x4
	movaps	32(%rsi), %xmm0                                
        movaps	32(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x6x4
	movaps	32(%r13), %xmm0                                
        movaps	32(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x7x4
	movaps	48(%rsi), %xmm0                                
        movaps	48(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x8x4
	movaps	48(%r13), %xmm0                                
        movaps	48(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x9x4
	movaps	64(%rsi), %xmm0                                
        movaps	64(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x10x4
	movaps	64(%r13), %xmm0                                
        movaps	64(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x11x4
	movaps	80(%rsi), %xmm0                                
        movaps	80(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x12x4
	movaps	80(%r13), %xmm0                                
        movaps	80(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x13x4
	movaps	96(%rsi), %xmm0                                
        movaps	96(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x14x4
	movaps	96(%r13), %xmm0                                
        movaps	96(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x15x4
	movaps	112(%rsi), %xmm0                                
        movaps	112(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x16x4
	movaps	112(%r13), %xmm0                                
        movaps	112(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x17x4
	movaps	128(%rsi), %xmm0                                
        movaps	128(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x18x4
	movaps	128(%r13), %xmm0                                
        movaps	128(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x19x4
	movaps	144(%rsi), %xmm0                                
        movaps	144(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x20x4
	movaps	144(%r13), %xmm0                                
        movaps	144(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x21x4
	movaps	160(%rsi), %xmm0                                
        movaps	160(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x22x4
	movaps	160(%r13), %xmm0                                
        movaps	160(%rax,%r13), %xmm1                            
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

	addq 	%rcx, %rdi	
	#mult 4x23x4
	movaps	176(%rsi), %xmm0                                
        movaps	176(%rax,%rsi), %xmm1
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

	
	addq  	%rcx, %rdi	
	#mult 4x24x4
	movaps	176(%r13), %xmm0                                
        movaps	176(%rax,%r13), %xmm1                            
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
	
	
	#cmp $1000000000, %r13
	#jl loop


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
	popq %r13
	popq %r12
	ret
.align 16, 0x90	
.type asm4x30x4, @function
