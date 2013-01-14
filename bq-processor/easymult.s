# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-O3 -DNDEBUG -prec-div -no-ftz -fno-inline-functions -restrict -S";
	.file "easymult.cpp"
	.text
..TXTST0:
# -- Begin  _Z7multijkPdS_S_i
# mark_begin;
       .align    16,0x90
	.globl _Z7multijkPdS_S_i
_Z7multijkPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B1.1:                         # Preds ..B1.0
..___tag_value__Z7multijkPdS_S_i.1:                             #2.55
        xorl      %r9d, %r9d                                    #3.3
        testl     %ecx, %ecx                                    #3.20
        jle       ..B1.13       # Prob 10%                      #3.20
                                # LOE rdx rbx rbp rsi rdi r9 r12 r13 r14 r15 ecx
..B1.2:                         # Preds ..B1.1
        movl      %ecx, %r10d                                   #
        lea       (%rcx,%rcx), %eax                             #
        movslq    %eax, %r11                                    #
        negl      %eax                                          #6.16
        shrl      $31, %r10d                                    #
        addl      %ecx, %r10d                                   #
        sarl      $1, %r10d                                     #
        movslq    %ecx, %r8                                     #3.3
        lea       (%rax,%rcx,2), %eax                           #6.16
        movq      %r12, -88(%rsp)                               #6.16
..___tag_value__Z7multijkPdS_S_i.3:                             #
        movq      %r13, -80(%rsp)                               #6.16
..___tag_value__Z7multijkPdS_S_i.4:                             #
        movq      %r14, -72(%rsp)                               #6.16
..___tag_value__Z7multijkPdS_S_i.5:                             #
        movq      %r15, -64(%rsp)                               #6.16
..___tag_value__Z7multijkPdS_S_i.6:                             #
        movq      %rbx, -56(%rsp)                               #6.16
..___tag_value__Z7multijkPdS_S_i.7:                             #
        movq      %rbp, -48(%rsp)                               #6.16
..___tag_value__Z7multijkPdS_S_i.8:                             #
                                # LOE rdx rsi rdi r8 r9 r11 eax ecx r10d
..B1.3:                         # Preds ..B1.11 ..B1.2
        movl      %r9d, %r14d                                   #6.2
        xorl      %ebp, %ebp                                    #4.5
        movl      %r14d, %r15d                                  #6.16
        addl      %eax, %r14d                                   #6.16
        subl      %ecx, %r15d                                   #6.16
        lea       (%rdx,%r9,8), %r12                            #2.6
        movslq    %r14d, %r14                                   #
        xorl      %ebx, %ebx                                    #
        movl      %eax, -16(%rsp)                               #
        movq      %r8, -24(%rsp)                                #
        movq      %r9, -32(%rsp)                                #
        lea       (%r15,%rcx,2), %r13d                          #6.16
        movslq    %r13d, %r13                                   #
        movq      %rdx, -40(%rsp)                               #
                                # LOE rsi rdi r11 r12 r13 r14 ecx ebx ebp r10d r15d
..B1.4:                         # Preds ..B1.3 ..B1.10
        movl      $1, %r9d                                      #5.7
        xorl      %r8d, %r8d                                    #5.7
        movq      %r13, %rax                                    #
        movq      %r14, %rdx                                    #
        testl     %r10d, %r10d                                  #5.7
        jbe       ..B1.8        # Prob 10%                      #5.7
                                # LOE rax rdx rsi rdi r11 r12 r13 r14 ecx ebx ebp r8d r9d r10d r15d
..B1.5:                         # Preds ..B1.4
        movslq    %ebx, %r9                                     #6.2
        movl      %ecx, -8(%rsp)                                #2.6
        movsd     (%r12,%r9,8), %xmm0                           #2.6
                                # LOE rax rdx rsi rdi r9 r11 r12 r13 r14 ebx ebp r8d r10d r15d xmm0
..B1.6:                         # Preds ..B1.6 ..B1.5
        movsd     (%rdi,%rdx,8), %xmm1                          #2.6
        lea       (%rbx,%r8,2), %ecx                            #6.27
        movslq    %ecx, %rcx                                    #6.27
        incl      %r8d                                          #5.7
        addq      %r11, %rdx                                    #5.7
        mulsd     (%rsi,%rcx,8), %xmm1                          #6.27
        addsd     %xmm1, %xmm0                                  #6.2
        movsd     %xmm0, (%r12,%r9,8)                           #2.6
        movsd     (%rdi,%rax,8), %xmm2                          #2.6
        addq      %r11, %rax                                    #5.7
        mulsd     8(%rsi,%rcx,8), %xmm2                         #6.27
        cmpl      %r10d, %r8d                                   #5.7
        addsd     %xmm2, %xmm0                                  #6.2
        movsd     %xmm0, (%r12,%r9,8)                           #2.6
        jb        ..B1.6        # Prob 64%                      #5.7
                                # LOE rax rdx rsi rdi r9 r11 r12 r13 r14 ebx ebp r8d r10d r15d xmm0
..B1.7:                         # Preds ..B1.6
        movl      -8(%rsp), %ecx                                #
        lea       1(%r8,%r8), %r9d                              #5.7
                                # LOE rsi rdi r11 r12 r13 r14 ecx ebx ebp r9d r10d r15d
..B1.8:                         # Preds ..B1.7 ..B1.4
        cmpl      %ecx, %r9d                                    #5.7
        ja        ..B1.10       # Prob 50%                      #5.7
                                # LOE rsi rdi r11 r12 r13 r14 ecx ebx ebp r9d r10d r15d
..B1.9:                         # Preds ..B1.8
        movl      %ecx, %eax                                    #6.2
        imull     %r9d, %eax                                    #6.2
        addl      %r15d, %eax                                   #6.16
        movslq    %ebx, %rbx                                    #6.27
        movslq    %eax, %rax                                    #6.16
        movslq    %r9d, %r9                                     #6.27
        addq      %rbx, %r9                                     #6.27
        movsd     (%rdi,%rax,8), %xmm0                          #2.6
        mulsd     -8(%rsi,%r9,8), %xmm0                         #6.27
        addsd     (%r12,%rbx,8), %xmm0                          #6.2
        movsd     %xmm0, (%r12,%rbx,8)                          #2.6
                                # LOE rsi rdi r11 r12 r13 r14 ecx ebx ebp r10d r15d
..B1.10:                        # Preds ..B1.8 ..B1.9
        incl      %ebp                                          #4.5
        addl      %ecx, %ebx                                    #4.5
        cmpl      %ecx, %ebp                                    #4.5
        jb        ..B1.4        # Prob 82%                      #4.5
                                # LOE rsi rdi r11 r12 r13 r14 ecx ebx ebp r10d r15d
..B1.11:                        # Preds ..B1.10
        movq      -32(%rsp), %r9                                #
        incq      %r9                                           #3.3
        movq      -24(%rsp), %r8                                #
        cmpq      %r8, %r9                                      #3.3
        movl      -16(%rsp), %eax                               #
        movq      -40(%rsp), %rdx                               #
        jb        ..B1.3        # Prob 82%                      #3.3
                                # LOE rdx rsi rdi r8 r9 r11 eax ecx r10d
..B1.12:                        # Preds ..B1.11
        movq      -88(%rsp), %r12                               #
..___tag_value__Z7multijkPdS_S_i.9:                             #
        movq      -80(%rsp), %r13                               #
..___tag_value__Z7multijkPdS_S_i.10:                            #
        movq      -72(%rsp), %r14                               #
..___tag_value__Z7multijkPdS_S_i.11:                            #
        movq      -64(%rsp), %r15                               #
..___tag_value__Z7multijkPdS_S_i.12:                            #
        movq      -56(%rsp), %rbx                               #
..___tag_value__Z7multijkPdS_S_i.13:                            #
        movq      -48(%rsp), %rbp                               #
..___tag_value__Z7multijkPdS_S_i.14:                            #
                                # LOE rbx rbp r12 r13 r14 r15
..B1.13:                        # Preds ..B1.1 ..B1.12
        ret                                                     #7.1
        .align    16,0x90
..___tag_value__Z7multijkPdS_S_i.15:                            #
                                # LOE
# mark_end;
	.type	_Z7multijkPdS_S_i,@function
	.size	_Z7multijkPdS_S_i,.-_Z7multijkPdS_S_i
	.data
# -- End  _Z7multijkPdS_S_i
	.text
# -- Begin  _Z8multijkxPdS_S_i
# mark_begin;
       .align    16,0x90
	.globl _Z8multijkxPdS_S_i
_Z8multijkxPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B2.1:                         # Preds ..B2.0
..___tag_value__Z8multijkxPdS_S_i.16:                           #9.56
        xorl      %r8d, %r8d                                    #10.3
        movslq    %ecx, %r9                                     #
        testl     %ecx, %ecx                                    #10.20
        jle       ..B2.23       # Prob 10%                      #10.20
                                # LOE rdx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 ecx
..B2.2:                         # Preds ..B2.1
        movq      %r12, -104(%rsp)                              #
..___tag_value__Z8multijkxPdS_S_i.18:                           #
        lea       (%rcx,%rcx,2), %eax                           #
        movq      %r13, -96(%rsp)                               #
..___tag_value__Z8multijkxPdS_S_i.19:                           #
        movq      %r14, -88(%rsp)                               #
..___tag_value__Z8multijkxPdS_S_i.20:                           #
        movq      %r15, -80(%rsp)                               #
..___tag_value__Z8multijkxPdS_S_i.21:                           #
        movq      %rbx, -72(%rsp)                               #
..___tag_value__Z8multijkxPdS_S_i.22:                           #
        movq      %rbp, -64(%rsp)                               #
..___tag_value__Z8multijkxPdS_S_i.23:                           #
                                # LOE rdx rsi rdi r8 r9 eax ecx
..B2.3:                         # Preds ..B2.21 ..B2.2
        movl      %eax, -56(%rsp)                               #
        lea       (%rdx,%r8,8), %r13                            #9.6
        movq      %rdi, -24(%rsp)                               #
        lea       (%rdi,%r8,8), %r10                            #9.6
        movq      %r8, -48(%rsp)                                #
        lea       (%r8,%rcx,2), %r14d                           #14.7
        movl      %r14d, -32(%rsp)                              #
        xorl      %ebp, %ebp                                    #11.5
        movq      %rdx, -40(%rsp)                               #
        lea       (%r8,%rcx,4), %r11d                           #14.7
        xorl      %ebx, %ebx                                    #
        lea       (%r8,%rax,2), %r12d                           #14.7
                                # LOE rbx rsi r9 r10 r13 ecx ebp r11d r12d
..B2.4:                         # Preds ..B2.20 ..B2.3
        movsd     (%r13,%rbx,8), %xmm0                          #9.6
        cmpl      $8, %ecx                                      #13.7
        jl        ..B2.24       # Prob 10%                      #13.7
                                # LOE rbx rsi r9 r10 r13 ecx ebp r11d r12d xmm0
..B2.5:                         # Preds ..B2.4
        lea       (%rsi,%rbx,8), %r14                           #9.6
        movq      %r14, %rdi                                    #13.7
        andq      $15, %rdi                                     #13.7
        testl     %edi, %edi                                    #13.7
        je        ..B2.8        # Prob 50%                      #13.7
                                # LOE rbx rsi r9 r10 r13 r14 ecx ebp edi r11d r12d xmm0
..B2.6:                         # Preds ..B2.5
        testl     $7, %edi                                      #13.7
        jne       ..B2.24       # Prob 10%                      #13.7
                                # LOE rbx rsi r9 r10 r13 r14 ecx ebp r11d r12d xmm0
..B2.7:                         # Preds ..B2.6
        movl      $1, %edi                                      #13.7
                                # LOE rbx rsi r9 r10 r13 r14 ecx ebp edi r11d r12d xmm0
..B2.8:                         # Preds ..B2.7 ..B2.5
        lea       8(%rdi), %eax                                 #13.7
        cmpl      %eax, %ecx                                    #13.7
        jl        ..B2.24       # Prob 10%                      #13.7
                                # LOE rbx rsi r9 r10 r13 r14 ecx ebp edi r11d r12d xmm0
..B2.9:                         # Preds ..B2.8
        movl      %ecx, %edx                                    #13.7
        xorl      %r8d, %r8d                                    #
        subl      %edi, %edx                                    #13.7
        xorl      %r15d, %r15d                                  #13.7
        andl      $7, %edx                                      #13.7
        xorl      %eax, %eax                                    #
        negl      %edx                                          #13.7
        addl      %ecx, %edx                                    #13.7
        testl     %edi, %edi                                    #13.7
        jbe       ..B2.13       # Prob 10%                      #13.7
                                # LOE rax rbx rsi r8 r9 r10 r13 r14 edx ecx ebp edi r11d r12d r15d xmm0
..B2.11:                        # Preds ..B2.9 ..B2.11
        movsd     (%r10,%r8,8), %xmm1                           #9.6
        incl      %r15d                                         #13.7
        mulsd     (%r14,%rax,8), %xmm1                          #14.18
        addq      %r9, %r8                                      #13.7
        incq      %rax                                          #13.7
        addsd     %xmm1, %xmm0                                  #14.2
        cmpl      %edi, %r15d                                   #13.7
        jb        ..B2.11       # Prob 82%                      #13.7
                                # LOE rax rbx rsi r8 r9 r10 r13 r14 edx ecx ebp edi r11d r12d r15d xmm0
..B2.13:                        # Preds ..B2.11 ..B2.9
        movl      %ecx, %eax                                    #
        pxor      %xmm1, %xmm1                                  #12.16
        movl      %ebp, -16(%rsp)                               #
        movsd     %xmm0, %xmm1                                  #12.16
        movq      %rsi, -8(%rsp)                                #
        movl      %edi, %r8d                                    #
        pxor      %xmm0, %xmm0                                  #12.16
        imull     %edi, %eax                                    #
        movl      -32(%rsp), %ebp                               #
        movq      -24(%rsp), %rsi                               #
                                # LOE rbx rsi r8 r9 r10 r13 r14 eax edx ecx ebp edi r11d r12d xmm0 xmm1
..B2.14:                        # Preds ..B2.14 ..B2.13
        movslq    %eax, %rax                                    #14.7
        addl      $8, %edi                                      #13.7
        lea       (%r10,%rax,8), %r15                           #14.7
        movsd     (%r15), %xmm2                                 #14.7
        movhpd    (%r15,%r9,8), %xmm2                           #14.7
        lea       (%rbp,%rax), %r15d                            #14.7
        movslq    %r15d, %r15                                   #14.7
        mulpd     (%r14,%r8,8), %xmm2                           #14.18
        addpd     %xmm2, %xmm1                                  #14.2
        lea       (%rsi,%r15,8), %r15                           #14.7
        movsd     (%r15), %xmm3                                 #14.7
        movhpd    (%r15,%r9,8), %xmm3                           #14.7
        lea       (%r11,%rax), %r15d                            #14.7
        movslq    %r15d, %r15                                   #14.7
        mulpd     16(%r14,%r8,8), %xmm3                         #14.18
        addpd     %xmm3, %xmm0                                  #14.2
        lea       (%rsi,%r15,8), %r15                           #14.7
        movsd     (%r15), %xmm4                                 #14.7
        movhpd    (%r15,%r9,8), %xmm4                           #14.7
        lea       (%r12,%rax), %r15d                            #14.7
        movslq    %r15d, %r15                                   #14.7
        lea       (%rax,%rcx,8), %eax                           #13.7
        mulpd     32(%r14,%r8,8), %xmm4                         #14.18
        addpd     %xmm4, %xmm1                                  #14.2
        lea       (%rsi,%r15,8), %r15                           #14.7
        movsd     (%r15), %xmm5                                 #14.7
        movhpd    (%r15,%r9,8), %xmm5                           #14.7
        mulpd     48(%r14,%r8,8), %xmm5                         #14.18
        addq      $8, %r8                                       #13.7
        addpd     %xmm5, %xmm0                                  #14.2
        cmpl      %edx, %edi                                    #13.7
        jb        ..B2.14       # Prob 82%                      #13.7
                                # LOE rbx rsi r8 r9 r10 r13 r14 eax edx ecx ebp edi r11d r12d xmm0 xmm1
..B2.15:                        # Preds ..B2.14
        addpd     %xmm0, %xmm1                                  #12.16
        movaps    %xmm1, %xmm0                                  #12.16
        unpckhpd  %xmm1, %xmm0                                  #12.16
        movl      -16(%rsp), %ebp                               #
        addsd     %xmm0, %xmm1                                  #12.16
        movq      -8(%rsp), %rsi                                #
        movaps    %xmm1, %xmm0                                  #12.16
                                # LOE rbx rsi r9 r10 r13 edx ecx ebp r11d r12d xmm0
..B2.16:                        # Preds ..B2.15 ..B2.24
        movl      %ecx, %edi                                    #
        imull     %edx, %edi                                    #
        movslq    %edx, %r8                                     #
        cmpl      %ecx, %edx                                    #13.7
        movslq    %edi, %rdi                                    #
        jae       ..B2.20       # Prob 10%                      #13.7
                                # LOE rbx rsi rdi r8 r9 r10 r13 edx ecx ebp r11d r12d xmm0
..B2.17:                        # Preds ..B2.16
        lea       (%rsi,%rbx,8), %rax                           #9.6
                                # LOE rax rbx rsi rdi r8 r9 r10 r13 edx ecx ebp r11d r12d xmm0
..B2.18:                        # Preds ..B2.18 ..B2.17
        movsd     (%r10,%rdi,8), %xmm1                          #9.6
        incl      %edx                                          #13.7
        mulsd     (%rax,%r8,8), %xmm1                           #14.18
        addq      %r9, %rdi                                     #13.7
        incq      %r8                                           #13.7
        addsd     %xmm1, %xmm0                                  #14.2
        cmpl      %ecx, %edx                                    #13.7
        jb        ..B2.18       # Prob 82%                      #13.7
                                # LOE rax rbx rsi rdi r8 r9 r10 r13 edx ecx ebp r11d r12d xmm0
..B2.20:                        # Preds ..B2.18 ..B2.16
        incl      %ebp                                          #11.5
        movsd     %xmm0, (%r13,%rbx,8)                          #9.6
        addq      %r9, %rbx                                     #11.5
        cmpl      %ecx, %ebp                                    #11.5
        jb        ..B2.4        # Prob 82%                      #11.5
                                # LOE rbx rsi r9 r10 r13 ecx ebp r11d r12d
..B2.21:                        # Preds ..B2.20
        movq      -48(%rsp), %r8                                #
        incq      %r8                                           #10.3
        movl      -56(%rsp), %eax                               #
        cmpq      %r9, %r8                                      #10.3
        movq      -24(%rsp), %rdi                               #
        movq      -40(%rsp), %rdx                               #
        jb        ..B2.3        # Prob 82%                      #10.3
                                # LOE rdx rsi rdi r8 r9 eax ecx
..B2.22:                        # Preds ..B2.21
        movq      -104(%rsp), %r12                              #
..___tag_value__Z8multijkxPdS_S_i.24:                           #
        movq      -96(%rsp), %r13                               #
..___tag_value__Z8multijkxPdS_S_i.25:                           #
        movq      -88(%rsp), %r14                               #
..___tag_value__Z8multijkxPdS_S_i.26:                           #
        movq      -80(%rsp), %r15                               #
..___tag_value__Z8multijkxPdS_S_i.27:                           #
        movq      -72(%rsp), %rbx                               #
..___tag_value__Z8multijkxPdS_S_i.28:                           #
        movq      -64(%rsp), %rbp                               #
..___tag_value__Z8multijkxPdS_S_i.29:                           #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.23:                        # Preds ..B2.1 ..B2.22
        ret                                                     #17.1
..___tag_value__Z8multijkxPdS_S_i.30:                           #
                                # LOE
..B2.24:                        # Preds ..B2.4 ..B2.8 ..B2.6    # Infreq
        xorl      %edx, %edx                                    #13.7
        jmp       ..B2.16       # Prob 100%                     #13.7
        .align    16,0x90
..___tag_value__Z8multijkxPdS_S_i.36:                           #
                                # LOE rbx rsi r9 r10 r13 edx ecx ebp r11d r12d xmm0
# mark_end;
	.type	_Z8multijkxPdS_S_i,@function
	.size	_Z8multijkxPdS_S_i,.-_Z8multijkxPdS_S_i
	.data
# -- End  _Z8multijkxPdS_S_i
	.text
# -- Begin  _Z7multIJKPdS_S_i
# mark_begin;
       .align    16,0x90
	.globl _Z7multIJKPdS_S_i
_Z7multIJKPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B3.1:                         # Preds ..B3.0
..___tag_value__Z7multIJKPdS_S_i.37:                            #21.15
        xorl      %r9d, %r9d                                    #23.5
        movslq    %ecx, %r8                                     #
        xorl      %eax, %eax                                    #
        testl     %ecx, %ecx                                    #23.22
        jle       ..B3.27       # Prob 10%                      #23.22
                                # LOE rdx rbx rbp rsi rdi r8 r12 r13 r14 r15 eax ecx r9d
..B3.2:                         # Preds ..B3.1
        movq      %rdi, -72(%rsp)                               #
        movq      %r12, -120(%rsp)                              #
..___tag_value__Z7multIJKPdS_S_i.39:                            #
        movq      %r13, -112(%rsp)                              #
..___tag_value__Z7multIJKPdS_S_i.40:                            #
        movq      %r14, -104(%rsp)                              #
..___tag_value__Z7multIJKPdS_S_i.41:                            #
        movq      %r15, -96(%rsp)                               #
..___tag_value__Z7multIJKPdS_S_i.42:                            #
        movq      %rbx, -88(%rsp)                               #
..___tag_value__Z7multIJKPdS_S_i.43:                            #
        movq      %rbp, -80(%rsp)                               #
..___tag_value__Z7multIJKPdS_S_i.44:                            #
                                # LOE rdx rsi r8 eax ecx r9d
..B3.3:                         # Preds ..B3.25 ..B3.2
        movslq    %eax, %rax                                    #25.27
        xorl      %ebp, %ebp                                    #
        xorl      %r11d, %r11d                                  #24.7
        xorl      %ebx, %ebx                                    #
        movl      %eax, -64(%rsp)                               #
        xorl      %edi, %edi                                    #
        movl      %r9d, -56(%rsp)                               #
        xorl      %r12d, %r12d                                  #
        movq      %rsi, -48(%rsp)                               #
        lea       (%rdx,%rax,8), %r14                           #20.6
        movq      %r14, %r13                                    #22.3
        lea       (%rsi,%rax,8), %r10                           #20.6
        andq      $15, %r13                                     #22.3
        movl      %r13d, %r15d                                  #22.3
        andl      $7, %r15d                                     #22.3
        movl      %r15d, -32(%rsp)                              #
        movl      %r13d, -24(%rsp)                              #
        movq      %r14, -8(%rsp)                                #
        movq      %rdx, -40(%rsp)                               #
        movq      -72(%rsp), %r15                               #
                                # LOE rbx rbp r8 r10 r12 r15 ecx edi r11d
..B3.4:                         # Preds ..B3.24 ..B3.3
        cmpq      $8, %r8                                       #22.3
        jl        ..B3.28       # Prob 10%                      #22.3
                                # LOE rbx rbp r8 r10 r12 r15 ecx edi r11d
..B3.5:                         # Preds ..B3.4
        movl      -24(%rsp), %r9d                               #22.3
        testl     %r9d, %r9d                                    #22.3
        je        ..B3.8        # Prob 50%                      #22.3
                                # LOE rbx rbp r8 r9 r10 r12 r15 ecx edi r11d
..B3.6:                         # Preds ..B3.5
        cmpl      $0, -32(%rsp)                                 #22.3
        jne       ..B3.28       # Prob 10%                      #22.3
                                # LOE rbx rbp r8 r10 r12 r15 ecx edi r11d
..B3.7:                         # Preds ..B3.6
        movl      $1, %r9d                                      #22.3
                                # LOE rbx rbp r8 r9 r10 r12 r15 ecx edi r11d
..B3.8:                         # Preds ..B3.7 ..B3.5
        movl      %r9d, %r13d                                   #22.3
        lea       8(%r13), %rax                                 #22.3
        cmpq      %rax, %r8                                     #22.3
        jl        ..B3.28       # Prob 10%                      #22.3
                                # LOE rbx rbp r8 r9 r10 r12 r13 r15 ecx edi r11d
..B3.9:                         # Preds ..B3.8
        movl      %ecx, %r14d                                   #22.3
        xorl      %eax, %eax                                    #22.3
        subl      %r9d, %r14d                                   #22.3
        movslq    %edi, %rsi                                    #25.16
        andl      $7, %r14d                                     #22.3
        negl      %r14d                                         #22.3
        addl      %ecx, %r14d                                   #22.3
        movslq    %r14d, %r14                                   #22.3
        testq     %r13, %r13                                    #22.3
        lea       (%r15,%rsi,8), %rdx                           #20.6
        jbe       ..B3.29       # Prob 0%                       #22.3
                                # LOE rax rdx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 ecx edi r11d
..B3.10:                        # Preds ..B3.9
        movl      %ecx, -16(%rsp)                               #20.6
        movsd     (%rbx,%r10), %xmm0                            #20.6
        movq      -8(%rsp), %rcx                                #20.6
                                # LOE rax rdx rcx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 edi r11d xmm0
..B3.11:                        # Preds ..B3.11 ..B3.10
        movsd     (%rdx,%rax,8), %xmm1                          #20.6
        mulsd     %xmm0, %xmm1                                  #25.27
        addsd     (%rcx,%rax,8), %xmm1                          #25.2
        movsd     %xmm1, (%rcx,%rax,8)                          #20.6
        incq      %rax                                          #22.3
        cmpq      %r13, %rax                                    #22.3
        jb        ..B3.11       # Prob 82%                      #22.3
                                # LOE rax rdx rcx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 edi r11d xmm0
..B3.12:                        # Preds ..B3.11
        movl      -16(%rsp), %ecx                               #
                                # LOE rdx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 ecx edi r11d xmm0
..B3.13:                        # Preds ..B3.12 ..B3.29
        addq      %r9, %rsi                                     #25.16
        lea       (%r15,%rsi,8), %rax                           #20.6
        testq     $15, %rax                                     #22.3
        je        ..B3.17       # Prob 60%                      #22.3
                                # LOE rdx rbx rbp r8 r10 r12 r13 r14 r15 ecx edi r11d xmm0
..B3.14:                        # Preds ..B3.13
        movq      -8(%rsp), %rax                                #25.27
        unpcklpd  %xmm0, %xmm0                                  #25.27
                                # LOE rax rdx rbx rbp r8 r10 r12 r13 r14 r15 ecx edi r11d xmm0
..B3.15:                        # Preds ..B3.15 ..B3.14
        movsd     (%rdx,%r13,8), %xmm1                          #25.27
        movsd     16(%rdx,%r13,8), %xmm2                        #25.27
        movsd     32(%rdx,%r13,8), %xmm3                        #25.27
        movsd     48(%rdx,%r13,8), %xmm4                        #25.27
        movhpd    8(%rdx,%r13,8), %xmm1                         #25.27
        movhpd    24(%rdx,%r13,8), %xmm2                        #25.27
        movhpd    40(%rdx,%r13,8), %xmm3                        #25.27
        movhpd    56(%rdx,%r13,8), %xmm4                        #25.27
        mulpd     %xmm0, %xmm1                                  #25.27
        mulpd     %xmm0, %xmm2                                  #25.27
        mulpd     %xmm0, %xmm3                                  #25.27
        mulpd     %xmm0, %xmm4                                  #25.27
        addpd     (%rax,%r13,8), %xmm1                          #25.2
        addpd     16(%rax,%r13,8), %xmm2                        #25.2
        addpd     32(%rax,%r13,8), %xmm3                        #25.2
        addpd     48(%rax,%r13,8), %xmm4                        #25.2
        movaps    %xmm1, (%rax,%r13,8)                          #20.6
        movaps    %xmm2, 16(%rax,%r13,8)                        #20.6
        movaps    %xmm3, 32(%rax,%r13,8)                        #20.6
        movaps    %xmm4, 48(%rax,%r13,8)                        #20.6
        addq      $8, %r13                                      #22.3
        cmpq      %r14, %r13                                    #22.3
        jb        ..B3.15       # Prob 82%                      #22.3
        jmp       ..B3.20       # Prob 100%                     #22.3
                                # LOE rax rdx rbx rbp r8 r10 r12 r13 r14 r15 ecx edi r11d xmm0
..B3.17:                        # Preds ..B3.13
        movq      -8(%rsp), %rax                                #25.27
        unpcklpd  %xmm0, %xmm0                                  #25.27
        .align    16,0x90
                                # LOE rax rdx rbx rbp r8 r10 r12 r13 r14 r15 ecx edi r11d xmm0
..B3.18:                        # Preds ..B3.18 ..B3.17
        movaps    (%rdx,%r13,8), %xmm1                          #25.27
        movaps    16(%rdx,%r13,8), %xmm2                        #25.27
        movaps    32(%rdx,%r13,8), %xmm3                        #25.27
        movaps    48(%rdx,%r13,8), %xmm4                        #25.27
        mulpd     %xmm0, %xmm1                                  #25.27
        mulpd     %xmm0, %xmm2                                  #25.27
        mulpd     %xmm0, %xmm3                                  #25.27
        mulpd     %xmm0, %xmm4                                  #25.27
        addpd     (%rax,%r13,8), %xmm1                          #25.2
        addpd     16(%rax,%r13,8), %xmm2                        #25.2
        addpd     32(%rax,%r13,8), %xmm3                        #25.2
        addpd     48(%rax,%r13,8), %xmm4                        #25.2
        movaps    %xmm1, (%rax,%r13,8)                          #20.6
        movaps    %xmm2, 16(%rax,%r13,8)                        #20.6
        movaps    %xmm3, 32(%rax,%r13,8)                        #20.6
        movaps    %xmm4, 48(%rax,%r13,8)                        #20.6
        addq      $8, %r13                                      #22.3
        cmpq      %r14, %r13                                    #22.3
        jb        ..B3.18       # Prob 82%                      #22.3
                                # LOE rax rdx rbx rbp r8 r10 r12 r13 r14 r15 ecx edi r11d xmm0
..B3.20:                        # Preds ..B3.18 ..B3.15 ..B3.28
        cmpq      %r8, %r14                                     #22.3
        jae       ..B3.24       # Prob 0%                       #22.3
                                # LOE rbx rbp r8 r10 r12 r14 r15 ecx edi r11d
..B3.21:                        # Preds ..B3.20
        movsd     (%r10,%rbp,8), %xmm0                          #20.6
        lea       (%r15,%r12,8), %rax                           #20.6
        movq      -8(%rsp), %rdx                                #20.6
                                # LOE rax rdx rbx rbp r8 r10 r12 r14 r15 ecx edi r11d xmm0
..B3.22:                        # Preds ..B3.22 ..B3.21
        movsd     (%rax,%r14,8), %xmm1                          #20.6
        mulsd     %xmm0, %xmm1                                  #25.27
        addsd     (%rdx,%r14,8), %xmm1                          #25.2
        movsd     %xmm1, (%rdx,%r14,8)                          #20.6
        incq      %r14                                          #22.3
        cmpq      %r8, %r14                                     #22.3
        jb        ..B3.22       # Prob 82%                      #22.3
                                # LOE rax rdx rbx rbp r8 r10 r12 r14 r15 ecx edi r11d xmm0
..B3.24:                        # Preds ..B3.22 ..B3.20
        incl      %r11d                                         #24.7
        addq      %r8, %r12                                     #24.7
        addl      %ecx, %edi                                    #24.7
        addq      $8, %rbx                                      #24.7
        incq      %rbp                                          #24.7
        cmpl      %ecx, %r11d                                   #24.7
        jb        ..B3.4        # Prob 82%                      #24.7
                                # LOE rbx rbp r8 r10 r12 r15 ecx edi r11d
..B3.25:                        # Preds ..B3.24
        movl      -56(%rsp), %r9d                               #
        incl      %r9d                                          #23.5
        movl      -64(%rsp), %eax                               #
        addl      %ecx, %eax                                    #23.5
        movq      -48(%rsp), %rsi                               #
        cmpl      %ecx, %r9d                                    #23.5
        movq      -40(%rsp), %rdx                               #
        jb        ..B3.3        # Prob 82%                      #23.5
                                # LOE rdx rsi r8 eax ecx r9d
..B3.26:                        # Preds ..B3.25
        movq      -120(%rsp), %r12                              #
..___tag_value__Z7multIJKPdS_S_i.45:                            #
        movq      -112(%rsp), %r13                              #
..___tag_value__Z7multIJKPdS_S_i.46:                            #
        movq      -104(%rsp), %r14                              #
..___tag_value__Z7multIJKPdS_S_i.47:                            #
        movq      -96(%rsp), %r15                               #
..___tag_value__Z7multIJKPdS_S_i.48:                            #
        movq      -88(%rsp), %rbx                               #
..___tag_value__Z7multIJKPdS_S_i.49:                            #
        movq      -80(%rsp), %rbp                               #
..___tag_value__Z7multIJKPdS_S_i.50:                            #
                                # LOE rbx rbp r12 r13 r14 r15
..B3.27:                        # Preds ..B3.1 ..B3.26
        ret                                                     #26.1
..___tag_value__Z7multIJKPdS_S_i.51:                            #
                                # LOE
..B3.28:                        # Preds ..B3.4 ..B3.8 ..B3.6    # Infreq
        xorl      %r14d, %r14d                                  #22.3
        jmp       ..B3.20       # Prob 100%                     #22.3
                                # LOE rbx rbp r8 r10 r12 r14 r15 ecx edi r11d
..B3.29:                        # Preds ..B3.9                  # Infreq
        movsd     (%r10,%rbp,8), %xmm0                          #20.6
        jmp       ..B3.13       # Prob 100%                     #20.6
        .align    16,0x90
..___tag_value__Z7multIJKPdS_S_i.57:                            #
                                # LOE rdx rbx rbp rsi r8 r9 r10 r12 r13 r14 r15 ecx edi r11d xmm0
# mark_end;
	.type	_Z7multIJKPdS_S_i,@function
	.size	_Z7multIJKPdS_S_i,.-_Z7multIJKPdS_S_i
	.data
# -- End  _Z7multIJKPdS_S_i
	.text
# -- Begin  _Z8multIJKXPdS_S_i
# mark_begin;
       .align    16,0x90
	.globl _Z8multIJKXPdS_S_i
_Z8multIJKXPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B4.1:                         # Preds ..B4.0
..___tag_value__Z8multIJKXPdS_S_i.58:                           #29.16
        xorl      %r8d, %r8d                                    #30.3
        movslq    %ecx, %r9                                     #
        testl     %ecx, %ecx                                    #30.20
        jle       ..B4.23       # Prob 10%                      #30.20
                                # LOE rdx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15 ecx
..B4.2:                         # Preds ..B4.1
        movq      %r12, -104(%rsp)                              #
..___tag_value__Z8multIJKXPdS_S_i.60:                           #
        lea       (%rcx,%rcx,2), %eax                           #
        movq      %r13, -96(%rsp)                               #
..___tag_value__Z8multIJKXPdS_S_i.61:                           #
        movq      %r14, -88(%rsp)                               #
..___tag_value__Z8multIJKXPdS_S_i.62:                           #
        movq      %r15, -80(%rsp)                               #
..___tag_value__Z8multIJKXPdS_S_i.63:                           #
        movq      %rbx, -72(%rsp)                               #
..___tag_value__Z8multIJKXPdS_S_i.64:                           #
        movq      %rbp, -64(%rsp)                               #
..___tag_value__Z8multIJKXPdS_S_i.65:                           #
                                # LOE rdx rsi rdi r8 r9 eax ecx
..B4.3:                         # Preds ..B4.21 ..B4.2
        movl      %eax, -56(%rsp)                               #
        lea       (%rdx,%r8,8), %r13                            #28.6
        movq      %rdi, -24(%rsp)                               #
        lea       (%rdi,%r8,8), %r10                            #28.6
        movq      %r8, -48(%rsp)                                #
        lea       (%r8,%rcx,2), %r14d                           #34.7
        movl      %r14d, -32(%rsp)                              #
        xorl      %ebp, %ebp                                    #31.5
        movq      %rdx, -40(%rsp)                               #
        lea       (%r8,%rcx,4), %r11d                           #34.7
        xorl      %ebx, %ebx                                    #
        lea       (%r8,%rax,2), %r12d                           #34.7
                                # LOE rbx rsi r9 r10 r13 ecx ebp r11d r12d
..B4.4:                         # Preds ..B4.20 ..B4.3
        movsd     (%r13,%rbx,8), %xmm0                          #28.6
        cmpl      $8, %ecx                                      #33.7
        jl        ..B4.24       # Prob 10%                      #33.7
                                # LOE rbx rsi r9 r10 r13 ecx ebp r11d r12d xmm0
..B4.5:                         # Preds ..B4.4
        lea       (%rsi,%rbx,8), %r14                           #28.6
        movq      %r14, %rdi                                    #33.7
        andq      $15, %rdi                                     #33.7
        testl     %edi, %edi                                    #33.7
        je        ..B4.8        # Prob 50%                      #33.7
                                # LOE rbx rsi r9 r10 r13 r14 ecx ebp edi r11d r12d xmm0
..B4.6:                         # Preds ..B4.5
        testl     $7, %edi                                      #33.7
        jne       ..B4.24       # Prob 10%                      #33.7
                                # LOE rbx rsi r9 r10 r13 r14 ecx ebp r11d r12d xmm0
..B4.7:                         # Preds ..B4.6
        movl      $1, %edi                                      #33.7
                                # LOE rbx rsi r9 r10 r13 r14 ecx ebp edi r11d r12d xmm0
..B4.8:                         # Preds ..B4.7 ..B4.5
        lea       8(%rdi), %eax                                 #33.7
        cmpl      %eax, %ecx                                    #33.7
        jl        ..B4.24       # Prob 10%                      #33.7
                                # LOE rbx rsi r9 r10 r13 r14 ecx ebp edi r11d r12d xmm0
..B4.9:                         # Preds ..B4.8
        movl      %ecx, %edx                                    #33.7
        xorl      %r8d, %r8d                                    #
        subl      %edi, %edx                                    #33.7
        xorl      %r15d, %r15d                                  #33.7
        andl      $7, %edx                                      #33.7
        xorl      %eax, %eax                                    #
        negl      %edx                                          #33.7
        addl      %ecx, %edx                                    #33.7
        testl     %edi, %edi                                    #33.7
        jbe       ..B4.13       # Prob 10%                      #33.7
                                # LOE rax rbx rsi r8 r9 r10 r13 r14 edx ecx ebp edi r11d r12d r15d xmm0
..B4.11:                        # Preds ..B4.9 ..B4.11
        movsd     (%r10,%r8,8), %xmm1                           #28.6
        incl      %r15d                                         #33.7
        mulsd     (%r14,%rax,8), %xmm1                          #34.18
        addq      %r9, %r8                                      #33.7
        incq      %rax                                          #33.7
        addsd     %xmm1, %xmm0                                  #34.2
        cmpl      %edi, %r15d                                   #33.7
        jb        ..B4.11       # Prob 82%                      #33.7
                                # LOE rax rbx rsi r8 r9 r10 r13 r14 edx ecx ebp edi r11d r12d r15d xmm0
..B4.13:                        # Preds ..B4.11 ..B4.9
        movl      %ecx, %eax                                    #
        pxor      %xmm1, %xmm1                                  #32.16
        movl      %ebp, -16(%rsp)                               #
        movsd     %xmm0, %xmm1                                  #32.16
        movq      %rsi, -8(%rsp)                                #
        movl      %edi, %r8d                                    #
        pxor      %xmm0, %xmm0                                  #32.16
        imull     %edi, %eax                                    #
        movl      -32(%rsp), %ebp                               #
        movq      -24(%rsp), %rsi                               #
                                # LOE rbx rsi r8 r9 r10 r13 r14 eax edx ecx ebp edi r11d r12d xmm0 xmm1
..B4.14:                        # Preds ..B4.14 ..B4.13
        movslq    %eax, %rax                                    #34.7
        addl      $8, %edi                                      #33.7
        lea       (%r10,%rax,8), %r15                           #34.7
        movsd     (%r15), %xmm2                                 #34.7
        movhpd    (%r15,%r9,8), %xmm2                           #34.7
        lea       (%rbp,%rax), %r15d                            #34.7
        movslq    %r15d, %r15                                   #34.7
        mulpd     (%r14,%r8,8), %xmm2                           #34.18
        addpd     %xmm2, %xmm1                                  #34.2
        lea       (%rsi,%r15,8), %r15                           #34.7
        movsd     (%r15), %xmm3                                 #34.7
        movhpd    (%r15,%r9,8), %xmm3                           #34.7
        lea       (%r11,%rax), %r15d                            #34.7
        movslq    %r15d, %r15                                   #34.7
        mulpd     16(%r14,%r8,8), %xmm3                         #34.18
        addpd     %xmm3, %xmm0                                  #34.2
        lea       (%rsi,%r15,8), %r15                           #34.7
        movsd     (%r15), %xmm4                                 #34.7
        movhpd    (%r15,%r9,8), %xmm4                           #34.7
        lea       (%r12,%rax), %r15d                            #34.7
        movslq    %r15d, %r15                                   #34.7
        lea       (%rax,%rcx,8), %eax                           #33.7
        mulpd     32(%r14,%r8,8), %xmm4                         #34.18
        addpd     %xmm4, %xmm1                                  #34.2
        lea       (%rsi,%r15,8), %r15                           #34.7
        movsd     (%r15), %xmm5                                 #34.7
        movhpd    (%r15,%r9,8), %xmm5                           #34.7
        mulpd     48(%r14,%r8,8), %xmm5                         #34.18
        addq      $8, %r8                                       #33.7
        addpd     %xmm5, %xmm0                                  #34.2
        cmpl      %edx, %edi                                    #33.7
        jb        ..B4.14       # Prob 82%                      #33.7
                                # LOE rbx rsi r8 r9 r10 r13 r14 eax edx ecx ebp edi r11d r12d xmm0 xmm1
..B4.15:                        # Preds ..B4.14
        addpd     %xmm0, %xmm1                                  #32.16
        movaps    %xmm1, %xmm0                                  #32.16
        unpckhpd  %xmm1, %xmm0                                  #32.16
        movl      -16(%rsp), %ebp                               #
        addsd     %xmm0, %xmm1                                  #32.16
        movq      -8(%rsp), %rsi                                #
        movaps    %xmm1, %xmm0                                  #32.16
                                # LOE rbx rsi r9 r10 r13 edx ecx ebp r11d r12d xmm0
..B4.16:                        # Preds ..B4.15 ..B4.24
        movl      %ecx, %edi                                    #
        imull     %edx, %edi                                    #
        movslq    %edx, %r8                                     #
        cmpl      %ecx, %edx                                    #33.7
        movslq    %edi, %rdi                                    #
        jae       ..B4.20       # Prob 10%                      #33.7
                                # LOE rbx rsi rdi r8 r9 r10 r13 edx ecx ebp r11d r12d xmm0
..B4.17:                        # Preds ..B4.16
        lea       (%rsi,%rbx,8), %rax                           #28.6
                                # LOE rax rbx rsi rdi r8 r9 r10 r13 edx ecx ebp r11d r12d xmm0
..B4.18:                        # Preds ..B4.18 ..B4.17
        movsd     (%r10,%rdi,8), %xmm1                          #28.6
        incl      %edx                                          #33.7
        mulsd     (%rax,%r8,8), %xmm1                           #34.18
        addq      %r9, %rdi                                     #33.7
        incq      %r8                                           #33.7
        addsd     %xmm1, %xmm0                                  #34.2
        cmpl      %ecx, %edx                                    #33.7
        jb        ..B4.18       # Prob 82%                      #33.7
                                # LOE rax rbx rsi rdi r8 r9 r10 r13 edx ecx ebp r11d r12d xmm0
..B4.20:                        # Preds ..B4.18 ..B4.16
        incl      %ebp                                          #31.5
        movsd     %xmm0, (%r13,%rbx,8)                          #28.6
        addq      %r9, %rbx                                     #31.5
        cmpl      %ecx, %ebp                                    #31.5
        jb        ..B4.4        # Prob 82%                      #31.5
                                # LOE rbx rsi r9 r10 r13 ecx ebp r11d r12d
..B4.21:                        # Preds ..B4.20
        movq      -48(%rsp), %r8                                #
        incq      %r8                                           #30.3
        movl      -56(%rsp), %eax                               #
        cmpq      %r9, %r8                                      #30.3
        movq      -24(%rsp), %rdi                               #
        movq      -40(%rsp), %rdx                               #
        jb        ..B4.3        # Prob 82%                      #30.3
                                # LOE rdx rsi rdi r8 r9 eax ecx
..B4.22:                        # Preds ..B4.21
        movq      -104(%rsp), %r12                              #
..___tag_value__Z8multIJKXPdS_S_i.66:                           #
        movq      -96(%rsp), %r13                               #
..___tag_value__Z8multIJKXPdS_S_i.67:                           #
        movq      -88(%rsp), %r14                               #
..___tag_value__Z8multIJKXPdS_S_i.68:                           #
        movq      -80(%rsp), %r15                               #
..___tag_value__Z8multIJKXPdS_S_i.69:                           #
        movq      -72(%rsp), %rbx                               #
..___tag_value__Z8multIJKXPdS_S_i.70:                           #
        movq      -64(%rsp), %rbp                               #
..___tag_value__Z8multIJKXPdS_S_i.71:                           #
                                # LOE rbx rbp r12 r13 r14 r15
..B4.23:                        # Preds ..B4.1 ..B4.22
        ret                                                     #37.1
..___tag_value__Z8multIJKXPdS_S_i.72:                           #
                                # LOE
..B4.24:                        # Preds ..B4.4 ..B4.8 ..B4.6    # Infreq
        xorl      %edx, %edx                                    #33.7
        jmp       ..B4.16       # Prob 100%                     #33.7
        .align    16,0x90
..___tag_value__Z8multIJKXPdS_S_i.78:                           #
                                # LOE rbx rsi r9 r10 r13 edx ecx ebp r11d r12d xmm0
# mark_end;
	.type	_Z8multIJKXPdS_S_i,@function
	.size	_Z8multIJKXPdS_S_i,.-_Z8multIJKXPdS_S_i
	.data
# -- End  _Z8multIJKXPdS_S_i
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x0000001c
	.8byte 0x00507a0100000000
	.4byte 0x09107801
	.byte 0x00
	.8byte __gxx_personality_v0
	.4byte 0x9008070c
	.2byte 0x0001
	.byte 0x00
	.4byte 0x00000064
	.4byte 0x00000024
	.8byte ..___tag_value__Z7multijkPdS_S_i.1
	.8byte ..___tag_value__Z7multijkPdS_S_i.15-..___tag_value__Z7multijkPdS_S_i.1
	.2byte 0x0400
	.4byte ..___tag_value__Z7multijkPdS_S_i.3-..___tag_value__Z7multijkPdS_S_i.1
	.2byte 0x0c8c
	.byte 0x04
	.4byte ..___tag_value__Z7multijkPdS_S_i.4-..___tag_value__Z7multijkPdS_S_i.3
	.2byte 0x0b8d
	.byte 0x04
	.4byte ..___tag_value__Z7multijkPdS_S_i.5-..___tag_value__Z7multijkPdS_S_i.4
	.2byte 0x0a8e
	.byte 0x04
	.4byte ..___tag_value__Z7multijkPdS_S_i.6-..___tag_value__Z7multijkPdS_S_i.5
	.2byte 0x098f
	.byte 0x04
	.4byte ..___tag_value__Z7multijkPdS_S_i.7-..___tag_value__Z7multijkPdS_S_i.6
	.2byte 0x0883
	.byte 0x04
	.4byte ..___tag_value__Z7multijkPdS_S_i.8-..___tag_value__Z7multijkPdS_S_i.7
	.2byte 0x0786
	.byte 0x04
	.4byte ..___tag_value__Z7multijkPdS_S_i.9-..___tag_value__Z7multijkPdS_S_i.8
	.2byte 0x04cc
	.4byte ..___tag_value__Z7multijkPdS_S_i.10-..___tag_value__Z7multijkPdS_S_i.9
	.2byte 0x04cd
	.4byte ..___tag_value__Z7multijkPdS_S_i.11-..___tag_value__Z7multijkPdS_S_i.10
	.2byte 0x04ce
	.4byte ..___tag_value__Z7multijkPdS_S_i.12-..___tag_value__Z7multijkPdS_S_i.11
	.2byte 0x04cf
	.4byte ..___tag_value__Z7multijkPdS_S_i.13-..___tag_value__Z7multijkPdS_S_i.12
	.2byte 0x04c3
	.4byte ..___tag_value__Z7multijkPdS_S_i.14-..___tag_value__Z7multijkPdS_S_i.13
	.2byte 0x00c6
	.4byte 0x00000074
	.4byte 0x0000008c
	.8byte ..___tag_value__Z8multijkxPdS_S_i.16
	.8byte ..___tag_value__Z8multijkxPdS_S_i.36-..___tag_value__Z8multijkxPdS_S_i.16
	.2byte 0x0400
	.4byte ..___tag_value__Z8multijkxPdS_S_i.18-..___tag_value__Z8multijkxPdS_S_i.16
	.2byte 0x0e8c
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.19-..___tag_value__Z8multijkxPdS_S_i.18
	.2byte 0x0d8d
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.20-..___tag_value__Z8multijkxPdS_S_i.19
	.2byte 0x0c8e
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.21-..___tag_value__Z8multijkxPdS_S_i.20
	.2byte 0x0b8f
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.22-..___tag_value__Z8multijkxPdS_S_i.21
	.2byte 0x0a83
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.23-..___tag_value__Z8multijkxPdS_S_i.22
	.2byte 0x0986
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.24-..___tag_value__Z8multijkxPdS_S_i.23
	.2byte 0x04cc
	.4byte ..___tag_value__Z8multijkxPdS_S_i.25-..___tag_value__Z8multijkxPdS_S_i.24
	.2byte 0x04cd
	.4byte ..___tag_value__Z8multijkxPdS_S_i.26-..___tag_value__Z8multijkxPdS_S_i.25
	.2byte 0x04ce
	.4byte ..___tag_value__Z8multijkxPdS_S_i.27-..___tag_value__Z8multijkxPdS_S_i.26
	.2byte 0x04cf
	.4byte ..___tag_value__Z8multijkxPdS_S_i.28-..___tag_value__Z8multijkxPdS_S_i.27
	.2byte 0x04c3
	.4byte ..___tag_value__Z8multijkxPdS_S_i.29-..___tag_value__Z8multijkxPdS_S_i.28
	.2byte 0x04c6
	.4byte ..___tag_value__Z8multijkxPdS_S_i.30-..___tag_value__Z8multijkxPdS_S_i.29
	.8byte 0x0d8d0e8c09860a83
	.4byte 0x0b8f0c8e
	.4byte 0x00000074
	.4byte 0x00000104
	.8byte ..___tag_value__Z7multIJKPdS_S_i.37
	.8byte ..___tag_value__Z7multIJKPdS_S_i.57-..___tag_value__Z7multIJKPdS_S_i.37
	.2byte 0x0400
	.4byte ..___tag_value__Z7multIJKPdS_S_i.39-..___tag_value__Z7multIJKPdS_S_i.37
	.2byte 0x108c
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.40-..___tag_value__Z7multIJKPdS_S_i.39
	.2byte 0x0f8d
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.41-..___tag_value__Z7multIJKPdS_S_i.40
	.2byte 0x0e8e
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.42-..___tag_value__Z7multIJKPdS_S_i.41
	.2byte 0x0d8f
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.43-..___tag_value__Z7multIJKPdS_S_i.42
	.2byte 0x0c83
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.44-..___tag_value__Z7multIJKPdS_S_i.43
	.2byte 0x0b86
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.45-..___tag_value__Z7multIJKPdS_S_i.44
	.2byte 0x04cc
	.4byte ..___tag_value__Z7multIJKPdS_S_i.46-..___tag_value__Z7multIJKPdS_S_i.45
	.2byte 0x04cd
	.4byte ..___tag_value__Z7multIJKPdS_S_i.47-..___tag_value__Z7multIJKPdS_S_i.46
	.2byte 0x04ce
	.4byte ..___tag_value__Z7multIJKPdS_S_i.48-..___tag_value__Z7multIJKPdS_S_i.47
	.2byte 0x04cf
	.4byte ..___tag_value__Z7multIJKPdS_S_i.49-..___tag_value__Z7multIJKPdS_S_i.48
	.2byte 0x04c3
	.4byte ..___tag_value__Z7multIJKPdS_S_i.50-..___tag_value__Z7multIJKPdS_S_i.49
	.2byte 0x04c6
	.4byte ..___tag_value__Z7multIJKPdS_S_i.51-..___tag_value__Z7multIJKPdS_S_i.50
	.8byte 0x0f8d108c0b860c83
	.4byte 0x0d8f0e8e
	.4byte 0x00000074
	.4byte 0x0000017c
	.8byte ..___tag_value__Z8multIJKXPdS_S_i.58
	.8byte ..___tag_value__Z8multIJKXPdS_S_i.78-..___tag_value__Z8multIJKXPdS_S_i.58
	.2byte 0x0400
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.60-..___tag_value__Z8multIJKXPdS_S_i.58
	.2byte 0x0e8c
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.61-..___tag_value__Z8multIJKXPdS_S_i.60
	.2byte 0x0d8d
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.62-..___tag_value__Z8multIJKXPdS_S_i.61
	.2byte 0x0c8e
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.63-..___tag_value__Z8multIJKXPdS_S_i.62
	.2byte 0x0b8f
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.64-..___tag_value__Z8multIJKXPdS_S_i.63
	.2byte 0x0a83
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.65-..___tag_value__Z8multIJKXPdS_S_i.64
	.2byte 0x0986
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.66-..___tag_value__Z8multIJKXPdS_S_i.65
	.2byte 0x04cc
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.67-..___tag_value__Z8multIJKXPdS_S_i.66
	.2byte 0x04cd
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.68-..___tag_value__Z8multIJKXPdS_S_i.67
	.2byte 0x04ce
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.69-..___tag_value__Z8multIJKXPdS_S_i.68
	.2byte 0x04cf
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.70-..___tag_value__Z8multIJKXPdS_S_i.69
	.2byte 0x04c3
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.71-..___tag_value__Z8multIJKXPdS_S_i.70
	.2byte 0x04c6
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.72-..___tag_value__Z8multIJKXPdS_S_i.71
	.8byte 0x0d8d0e8c09860a83
	.4byte 0x0b8f0c8e
# End
