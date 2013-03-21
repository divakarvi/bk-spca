.align 16, 0x90
.globl 	asm4x4x4
asm4x4x4:
# parameter 1: %rdi (a)
# parameter 2: %rsi (b)
# parameter 3: %rdx (c)
# parameter 4: %rcx (lda)
# parameter 5: %r8  (ldb)
# parameter 6: %r9  (ldc)
	shlq	$3, %rcx 		#scale lda
	shlq	$3, %r8  		#scale ldb
	shlq	$3, %r9  		#scale ldc
	#begin loading c (r10 used as a temporary)
	movaps 	(%rdx), %xmm4
	movaps 	(%rdx,%r9), %xmm5
	movaps 	(%rdx,%r9,2), %xmm6
	lea 	(%r9,%r9,2), %r10
	movaps 	(%rdx,%r10), %xmm7
	movaps 	16(%rdx), %xmm8
	movaps 	16(%rdx,%r9), %xmm9
	movaps 	16(%rdx,%r9,2), %xmm10
	movaps 	16(%rdx,%r10), %xmm11
	#end loading c
	
	lea 	(%rsi,%r8), %rax       	#rax = b+ldb
	lea   	(%r8, %r8, 2), %r10    	#r10 used as temp
	lea  	(%rsi, %r10), %r11     	#r11 = b+3*ldb
	lea 	(%rsi, %r8, 2), %r10   	#r10 = b+2*ldb

	.align 	16, 0x90
loop:	
	#mult 4x1x4
	movaps 	(%rdi), %xmm2                                 
        movaps 	(%rsi), %xmm0                                 
        mulpd 	%xmm0, %xmm2                                  
        movaps	16(%rdi), %xmm3                               
        movaps	%xmm3, %xmm12                                 
        mulpd 	%xmm0, %xmm3                                  
        addpd 	%xmm2, %xmm4                                  
        addpd  	%xmm3, %xmm8                                  
        movaps 	16(%rsi), %xmm1                               
        mulpd  	%xmm1, %xmm12                                 
        movaps 	(%rdi), %xmm2                                 
        mulpd  	%xmm1, %xmm2                                  
        addpd  	%xmm2, %xmm6                                  
        addpd 	%xmm12, %xmm10                                
        movaps	(%rdi), %xmm3                                 
        shufpd 	$1, %xmm3, %xmm3                              
        movaps 	%xmm3, %xmm2                                  
        mulpd 	%xmm1, %xmm3                                  
        mulpd	%xmm0, %xmm2                                  
        addpd	%xmm3, %xmm7                                  
        addpd	%xmm2, %xmm5                                  
        movaps	16(%rdi), %xmm2                               
        shufpd	$1, %xmm2, %xmm2                              
        movaps	%xmm2, %xmm3                                  
        mulpd 	%xmm0, %xmm2                                  
        mulpd	%xmm1, %xmm3                                  
        addpd	%xmm2, %xmm9                                  
        addpd	%xmm3, %xmm11

	addq    %rcx, %rdi
	#mult 4x2x4
	movaps 	(%rdi), %xmm2                                 
        movaps 	(%rax), %xmm0                                 
        mulpd 	%xmm0, %xmm2                                  
        movaps	16(%rdi), %xmm3                               
        movaps	%xmm3, %xmm12                                 
        mulpd 	%xmm0, %xmm3                                  
        addpd 	%xmm2, %xmm4                                  
        addpd  	%xmm3, %xmm8                                  
        movaps 	16(%rax), %xmm1                               
        mulpd  	%xmm1, %xmm12                                 
        movaps 	(%rdi), %xmm2                                 
        mulpd  	%xmm1, %xmm2                                  
        addpd  	%xmm2, %xmm6                                  
        addpd 	%xmm12, %xmm10                                
        movaps	(%rdi), %xmm3                                 
        shufpd 	$1, %xmm3, %xmm3                              
        movaps 	%xmm3, %xmm2                                  
        mulpd 	%xmm1, %xmm3                                  
        mulpd	%xmm0, %xmm2                                  
        addpd	%xmm3, %xmm7                                  
        addpd	%xmm2, %xmm5                                  
        movaps	16(%rdi), %xmm2                               
        shufpd	$1, %xmm2, %xmm2                              
        movaps	%xmm2, %xmm3                                  
        mulpd 	%xmm0, %xmm2                                  
        mulpd	%xmm1, %xmm3                                  
        addpd	%xmm2, %xmm9                                  
        addpd	%xmm3, %xmm11

	addq	%rcx, %rdi
	#mult 4x3x4
	movaps 	(%rdi), %xmm2                                 
        movaps 	(%r10), %xmm0                                 
        mulpd 	%xmm0, %xmm2                                  
        movaps	16(%rdi), %xmm3                               
        movaps	%xmm3, %xmm12                                 
        mulpd 	%xmm0, %xmm3                                  
        addpd 	%xmm2, %xmm4                                  
        addpd  	%xmm3, %xmm8                                  
        movaps 	16(%r10), %xmm1                               
        mulpd  	%xmm1, %xmm12                                 
        movaps 	(%rdi), %xmm2                                 
        mulpd  	%xmm1, %xmm2                                  
        addpd  	%xmm2, %xmm6                                  
        addpd 	%xmm12, %xmm10                                
        movaps	(%rdi), %xmm3                                 
        shufpd 	$1, %xmm3, %xmm3                              
        movaps 	%xmm3, %xmm2                                  
        mulpd 	%xmm1, %xmm3                                  
        mulpd	%xmm0, %xmm2                                  
        addpd	%xmm3, %xmm7                                  
        addpd	%xmm2, %xmm5                                  
        movaps	16(%rdi), %xmm2                               
        shufpd	$1, %xmm2, %xmm2                              
        movaps	%xmm2, %xmm3                                  
        mulpd 	%xmm0, %xmm2                                  
        mulpd	%xmm1, %xmm3                                  
        addpd	%xmm2, %xmm9                                  
        addpd	%xmm3, %xmm11

	addq	%rcx, %rdi
	#mult 4x4x4
	movaps 	(%rdi), %xmm2                                 
        movaps 	(%r11), %xmm0                                 
        mulpd 	%xmm0, %xmm2                                  
        movaps	16(%rdi), %xmm3                               
        movaps	%xmm3, %xmm12                                 
        mulpd 	%xmm0, %xmm3                                  
        addpd 	%xmm2, %xmm4                                  
        addpd  	%xmm3, %xmm8                                  
        movaps 	16(%r11), %xmm1                               
        mulpd  	%xmm1, %xmm12                                 
        movaps 	(%rdi), %xmm2                                 
        mulpd  	%xmm1, %xmm2                                  
        addpd  	%xmm2, %xmm6                                  
        addpd 	%xmm12, %xmm10                                
        movaps	(%rdi), %xmm3                                 
        shufpd 	$1, %xmm3, %xmm3                              
        movaps 	%xmm3, %xmm2                                  
        mulpd 	%xmm1, %xmm3                                  
        mulpd	%xmm0, %xmm2                                  
        addpd	%xmm3, %xmm7                                  
        addpd	%xmm2, %xmm5                                  
        movaps	16(%rdi), %xmm2                               
        shufpd	$1, %xmm2, %xmm2                              
        movaps	%xmm2, %xmm3                                  
        mulpd 	%xmm0, %xmm2                                  
        mulpd	%xmm1, %xmm3                                  
        addpd	%xmm2, %xmm9                                  
        addpd	%xmm3, %xmm11
	
	#begin storing c (r10 used as a temporary)
	movaps 	%xmm4, (%rdx)
	movaps 	%xmm5, (%rdx,%r9)
	movaps 	%xmm6, (%rdx,%r9,2)
	lea 	(%r9,%r9,2), %r10
	movaps 	%xmm7, (%rdx,%r10)
	movaps 	%xmm8, 16(%rdx)
	movaps 	%xmm9, 16(%rdx,%r9)
	movaps 	%xmm10, 16(%rdx,%r9,2)
	movaps 	%xmm11, 16(%rdx,%r10)
	#end storing c

	ret	
.align 16, 0x90	
.type asm4x4x4, @function
