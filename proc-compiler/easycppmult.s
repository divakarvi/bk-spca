# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-I/usr/caen/intel-12.1/mkl/include -O3 -DNDEBUG -prec-div -no-ftz -restrict -S";
	.file "easycppmult.cpp"
	.text
..TXTST0:
# -- Begin  _Z7multijkR6VectorS0_S0_i
# mark_begin;
       .align    16,0x90
	.globl _Z7multijkR6VectorS0_S0_i
_Z7multijkR6VectorS0_S0_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B1.1:                         # Preds ..B1.0
..___tag_value__Z7multijkR6VectorS0_S0_i.1:                     #4.55
        pushq     %rbp                                          #4.55
..___tag_value__Z7multijkR6VectorS0_S0_i.3:                     #
        xorl      %r8d, %r8d                                    #5.3
        xorl      %ebp, %ebp                                    #
        testl     %ecx, %ecx                                    #5.20
        jle       ..B1.13       # Prob 10%                      #5.20
                                # LOE rdx rbx rbp rsi rdi r8 r12 r13 r14 r15 ecx
..B1.2:                         # Preds ..B1.1
        movl      %ecx, %r9d                                    #
        lea       (%rcx,%rcx), %eax                             #
        movslq    %eax, %r11                                    #
        negl      %eax                                          #8.17
        shrl      $31, %r9d                                     #
        addl      %ecx, %r9d                                    #
        sarl      $1, %r9d                                      #
        movslq    %ecx, %r10                                    #5.3
        lea       (%rax,%rcx,2), %eax                           #8.17
        movq      %r11, -16(%rsp)                               #8.17
        movq      %r12, -112(%rsp)                              #8.17
..___tag_value__Z7multijkR6VectorS0_S0_i.5:                     #
        movq      %r13, -104(%rsp)                              #8.17
..___tag_value__Z7multijkR6VectorS0_S0_i.6:                     #
        movq      %r14, -96(%rsp)                               #8.17
..___tag_value__Z7multijkR6VectorS0_S0_i.7:                     #
        movq      %r15, -88(%rsp)                               #8.17
..___tag_value__Z7multijkR6VectorS0_S0_i.8:                     #
        movq      %rbx, -80(%rsp)                               #8.17
..___tag_value__Z7multijkR6VectorS0_S0_i.9:                     #
                                # LOE rdx rbp rsi rdi r8 r10 eax ecx r9d
..B1.3:                         # Preds ..B1.11 ..B1.2
        movl      %r8d, %r14d                                   #8.3
        xorl      %r11d, %r11d                                  #6.5
        movl      %r14d, %r12d                                  #8.17
        addl      %eax, %r14d                                   #8.17
        subl      %ecx, %r12d                                   #8.17
        xorl      %ebx, %ebx                                    #
        movslq    %r14d, %r14                                   #
        movl      %eax, -56(%rsp)                               #
        movq      %r10, -64(%rsp)                               #
        movq      %r8, -72(%rsp)                                #
        lea       (%r12,%rcx,2), %r13d                          #8.17
        movslq    %r13d, %r13                                   #
                                # LOE rdx rbp rsi rdi r13 r14 ecx ebx r9d r11d r12d
..B1.4:                         # Preds ..B1.3 ..B1.10
        movl      $1, %eax                                      #7.7
        xorl      %r15d, %r15d                                  #7.7
        movq      %r13, %r8                                     #
        movq      %r14, %r10                                    #
        testl     %r9d, %r9d                                    #7.7
        jbe       ..B1.8        # Prob 10%                      #7.7
                                # LOE rdx rbp rsi rdi r8 r10 r13 r14 eax ecx ebx r9d r11d r12d r15d
..B1.5:                         # Preds ..B1.4
        movslq    %ebx, %rbx                                    #8.3
        movq      %r13, -24(%rsp)                               #8.3
        movl      %r12d, -32(%rsp)                              #8.3
        movq      %rbp, -40(%rsp)                               #8.3
        movl      %ecx, -48(%rsp)                               #8.3
        lea       (%rbp,%rbx,8), %rax                           #8.3
        movq      -16(%rsp), %r13                               #8.3
        .align    16,0x90
                                # LOE rax rdx rsi rdi r8 r10 r13 r14 ebx r9d r11d r15d
..B1.6:                         # Preds ..B1.6 ..B1.5
        movq      8(%rdi), %rcx                                 #8.17
        lea       (%rbx,%r15,2), %ebp                           #8.28
        movslq    %ebp, %rbp                                    #8.28
        incl      %r15d                                         #7.7
        movq      8(%rdx), %r12                                 #8.3
        movsd     (%rcx,%r10,8), %xmm0                          #8.3
        addq      %r13, %r10                                    #7.7
        movq      8(%rsi), %rcx                                 #8.28
        mulsd     (%rcx,%rbp,8), %xmm0                          #8.28
        addsd     (%rax,%r12), %xmm0                            #8.3
        movsd     %xmm0, (%rax,%r12)                            #8.3
        movq      8(%rdi), %r12                                 #8.17
        movq      8(%rdx), %rcx                                 #8.3
        movsd     (%r12,%r8,8), %xmm1                           #8.3
        addq      %r13, %r8                                     #7.7
        movq      8(%rsi), %r12                                 #8.28
        cmpl      %r9d, %r15d                                   #7.7
        mulsd     8(%r12,%rbp,8), %xmm1                         #8.28
        addsd     (%rax,%rcx), %xmm1                            #8.3
        movsd     %xmm1, (%rax,%rcx)                            #8.3
        jb        ..B1.6        # Prob 64%                      #7.7
                                # LOE rax rdx rsi rdi r8 r10 r13 r14 ebx r9d r11d r15d
..B1.7:                         # Preds ..B1.6
        movq      -24(%rsp), %r13                               #
        lea       1(%r15,%r15), %eax                            #7.7
        movl      -32(%rsp), %r12d                              #
        movq      -40(%rsp), %rbp                               #
        movl      -48(%rsp), %ecx                               #
                                # LOE rdx rbp rsi rdi r13 r14 eax ecx ebx r9d r11d r12d
..B1.8:                         # Preds ..B1.7 ..B1.4
        cmpl      %ecx, %eax                                    #7.7
        ja        ..B1.10       # Prob 50%                      #7.7
                                # LOE rdx rbp rsi rdi r13 r14 eax ecx ebx r9d r11d r12d
..B1.9:                         # Preds ..B1.8
        movl      %ecx, %r10d                                   #8.3
        movq      %rbp, %r8                                     #8.3
        imull     %eax, %r10d                                   #8.3
        addl      %r12d, %r10d                                  #8.17
        movslq    %r10d, %r10                                   #8.17
        movq      8(%rdi), %r15                                 #8.17
        movslq    %ebx, %rbx                                    #8.3
        movslq    %eax, %rax                                    #8.28
        addq      %rbx, %rax                                    #8.28
        movsd     (%r15,%r10,8), %xmm0                          #8.3
        movq      8(%rsi), %r10                                 #8.28
        addq      8(%rdx), %r8                                  #8.3
        mulsd     -8(%r10,%rax,8), %xmm0                        #8.28
        addsd     (%r8,%rbx,8), %xmm0                           #8.3
        movsd     %xmm0, (%r8,%rbx,8)                           #8.3
                                # LOE rdx rbp rsi rdi r13 r14 ecx ebx r9d r11d r12d
..B1.10:                        # Preds ..B1.8 ..B1.9
        incl      %r11d                                         #6.5
        addl      %ecx, %ebx                                    #6.5
        cmpl      %ecx, %r11d                                   #6.5
        jb        ..B1.4        # Prob 82%                      #6.5
                                # LOE rdx rbp rsi rdi r13 r14 ecx ebx r9d r11d r12d
..B1.11:                        # Preds ..B1.10
        movq      -72(%rsp), %r8                                #
        addq      $8, %rbp                                      #5.3
        incq      %r8                                           #5.3
        movq      -64(%rsp), %r10                               #
        cmpq      %r10, %r8                                     #5.3
        movl      -56(%rsp), %eax                               #
        jb        ..B1.3        # Prob 82%                      #5.3
                                # LOE rdx rbp rsi rdi r8 r10 eax ecx r9d
..B1.12:                        # Preds ..B1.11
        movq      -112(%rsp), %r12                              #
..___tag_value__Z7multijkR6VectorS0_S0_i.10:                    #
        movq      -104(%rsp), %r13                              #
..___tag_value__Z7multijkR6VectorS0_S0_i.11:                    #
        movq      -96(%rsp), %r14                               #
..___tag_value__Z7multijkR6VectorS0_S0_i.12:                    #
        movq      -88(%rsp), %r15                               #
..___tag_value__Z7multijkR6VectorS0_S0_i.13:                    #
        movq      -80(%rsp), %rbx                               #
..___tag_value__Z7multijkR6VectorS0_S0_i.14:                    #
                                # LOE rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.1 ..B1.12
..___tag_value__Z7multijkR6VectorS0_S0_i.15:                    #9.1
        popq      %rbp                                          #9.1
..___tag_value__Z7multijkR6VectorS0_S0_i.16:                    #
        ret                                                     #9.1
        .align    16,0x90
..___tag_value__Z7multijkR6VectorS0_S0_i.17:                    #
                                # LOE
# mark_end;
	.type	_Z7multijkR6VectorS0_S0_i,@function
	.size	_Z7multijkR6VectorS0_S0_i,.-_Z7multijkR6VectorS0_S0_i
	.data
# -- End  _Z7multijkR6VectorS0_S0_i
	.text
# -- Begin  _Z7multijkR6MatrixS0_S0_
# mark_begin;
       .align    16,0x90
	.globl _Z7multijkR6MatrixS0_S0_
_Z7multijkR6MatrixS0_S0_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B2.1:                         # Preds ..B2.0
..___tag_value__Z7multijkR6MatrixS0_S0_.18:                     #11.46
        xorl      %ecx, %ecx                                    #18.3
        movslq    (%rdi), %rax                                  #12.13
        testq     %rax, %rax                                    #18.20
        movl      4(%rdi), %r9d                                 #13.13
        movl      4(%rsi), %r8d                                 #15.13
        jle       ..B2.17       # Prob 10%                      #18.20
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 r8d r9d
..B2.2:                         # Preds ..B2.1
        movq      %r12, -72(%rsp)                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.20:                     #
        movq      %r13, -64(%rsp)                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.21:                     #
        movq      %r14, -56(%rsp)                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.22:                     #
        movq      %r15, -48(%rsp)                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.23:                     #
        movq      %rbx, -40(%rsp)                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.24:                     #
        movq      %rbp, -32(%rsp)                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.25:                     #
                                # LOE rax rdx rcx rsi rdi r8d r9d
..B2.3:                         # Preds ..B2.18 ..B2.5 ..B2.2
        xorl      %r10d, %r10d                                  #19.5
        xorl      %ebx, %ebx                                    #
        testl     %r9d, %r9d                                    #19.22
        jle       ..B2.18       # Prob 10%                      #19.22
                                # LOE rax rdx rcx rbx rsi rdi r8d r9d r10d
..B2.4:                         # Preds ..B2.3
        testl     %r8d, %r8d                                    #20.24
        jg        ..B2.6        # Prob 50%                      #20.24
                                # LOE rax rdx rcx rbx rsi rdi r8d r9d r10d
..B2.5:                         # Preds ..B2.23 ..B2.4
        incq      %rcx                                          #18.3
        cmpq      %rax, %rcx                                    #18.3
        jb        ..B2.3        # Prob 82%                      #18.3
        jmp       ..B2.16       # Prob 100%                     #18.3
                                # LOE rax rdx rcx rsi rdi r8d r9d
..B2.6:                         # Preds ..B2.4
        movl      %r8d, %r11d                                   #
        xorl      %ebp, %ebp                                    #
        incl      %ebp                                          #
        shrl      $31, %r11d                                    #
        addl      %r8d, %r11d                                   #
        sarl      $1, %r11d                                     #
        movq      %rax, -24(%rsp)                               #
                                # LOE rdx rcx rbx rsi rdi ebp r8d r9d r10d r11d
..B2.7:                         # Preds ..B2.12 ..B2.13 ..B2.6
        movl      %ebp, %r14d                                   #20.7
        xorl      %eax, %eax                                    #20.7
        testl     %r11d, %r11d                                  #20.7
        jbe       ..B2.11       # Prob 10%                      #20.7
                                # LOE rdx rcx rbx rsi rdi eax ebp r8d r9d r10d r11d r14d
..B2.8:                         # Preds ..B2.7
        movl      %r9d, -16(%rsp)                               #
                                # LOE rdx rcx rbx rsi rdi eax ebp r8d r10d r11d
..B2.9:                         # Preds ..B2.9 ..B2.8
        movl      8(%rdi), %r9d                                 #21.13
        movq      16(%rdi), %r14                                #21.13
        movq      16(%rdx), %r12                                #21.3
        imull     %r10d, %r9d                                   #21.13
        movslq    %r9d, %r9                                     #21.13
        lea       (%r12,%rcx,8), %r13                           #21.3
        movl      8(%rdx), %r15d                                #21.3
        lea       (%r14,%rcx,8), %r12                           #21.13
        movl      8(%rsi), %r14d                                #21.20
        addl      %r15d, %r15d                                  #21.3
        addl      %r14d, %r14d                                  #21.3
        imull     %eax, %r14d                                   #21.20
        movsd     (%r12,%r9,8), %xmm0                           #21.13
        imull     %eax, %r15d                                   #21.3
        movq      16(%rsi), %r12                                #21.20
        movslq    %r14d, %r14                                   #21.20
        movslq    %r15d, %r15                                   #21.3
        lea       (%r12,%rbx,8), %r9                            #21.20
        mulsd     (%r9,%r14,8), %xmm0                           #21.20
        lea       1(%rax,%rax), %r14d                           #21.3
        incl      %eax                                          #20.7
        addsd     (%r13,%r15,8), %xmm0                          #21.3
        movsd     %xmm0, (%r13,%r15,8)                          #21.3
        movq      16(%rdi), %r15                                #21.13
        movl      8(%rdx), %r12d                                #21.3
        imull     %r14d, %r12d                                  #21.3
        movq      16(%rdx), %r13                                #21.3
        lea       (%r15,%rcx,8), %r9                            #21.13
        movl      8(%rdi), %r15d                                #21.13
        imull     %r10d, %r15d                                  #21.13
        movslq    %r15d, %r15                                   #21.13
        lea       (%r13,%rcx,8), %r13                           #21.3
        movslq    %r12d, %r12                                   #21.3
        movsd     (%r9,%r15,8), %xmm1                           #21.13
        movl      8(%rsi), %r9d                                 #21.20
        imull     %r14d, %r9d                                   #21.20
        movq      16(%rsi), %r14                                #21.20
        cmpl      %r11d, %eax                                   #20.7
        movslq    %r9d, %r9                                     #21.20
        lea       (%r14,%rbx,8), %r14                           #21.20
        mulsd     (%r14,%r9,8), %xmm1                           #21.20
        addsd     (%r13,%r12,8), %xmm1                          #21.3
        movsd     %xmm1, (%r13,%r12,8)                          #21.3
        jb        ..B2.9        # Prob 64%                      #20.7
                                # LOE rdx rcx rbx rsi rdi eax ebp r8d r10d r11d
..B2.10:                        # Preds ..B2.9
        movl      -16(%rsp), %r9d                               #
        lea       1(%rax,%rax), %r14d                           #20.7
                                # LOE rdx rcx rbx rsi rdi ebp r8d r9d r10d r11d r14d
..B2.11:                        # Preds ..B2.10 ..B2.7
        cmpl      %r8d, %r14d                                   #20.7
        ja        ..B2.13       # Prob 50%                      #20.7
                                # LOE rdx rcx rbx rsi rdi ebp r8d r9d r10d r11d r14d
..B2.12:                        # Preds ..B2.11
        movl      8(%rdi), %eax                                 #21.13
        decl      %r14d                                         #21.3
        imull     %r10d, %eax                                   #21.13
        incl      %r10d                                         #19.5
        movq      16(%rdx), %r15                                #21.3
        movslq    %eax, %rax                                    #21.13
        movl      8(%rdx), %r12d                                #21.3
        imull     %r14d, %r12d                                  #21.3
        lea       (%r15,%rcx,8), %r13                           #21.3
        movq      16(%rdi), %r15                                #21.13
        movslq    %r12d, %r12                                   #21.3
        lea       (%r15,%rcx,8), %r15                           #21.13
        movsd     (%r15,%rax,8), %xmm0                          #21.13
        movl      8(%rsi), %eax                                 #21.20
        imull     %r14d, %eax                                   #21.20
        movslq    %eax, %rax                                    #21.20
        addq      %rbx, %rax                                    #21.3
        incq      %rbx                                          #19.5
        movq      16(%rsi), %r14                                #21.20
        cmpl      %r9d, %r10d                                   #19.5
        mulsd     (%r14,%rax,8), %xmm0                          #21.20
        addsd     (%r13,%r12,8), %xmm0                          #21.3
        movsd     %xmm0, (%r13,%r12,8)                          #21.3
        jb        ..B2.7        # Prob 82%                      #19.5
        jmp       ..B2.23       # Prob 100%                     #19.5
                                # LOE rdx rcx rbx rsi rdi ebp r8d r9d r10d r11d
..B2.13:                        # Preds ..B2.11
        incl      %r10d                                         #19.5
        incq      %rbx                                          #19.5
        cmpl      %r9d, %r10d                                   #19.5
        jb        ..B2.7        # Prob 82%                      #19.5
                                # LOE rdx rcx rbx rsi rdi ebp r8d r9d r10d r11d
..B2.23:                        # Preds ..B2.13 ..B2.12
        movq      -24(%rsp), %rax                               #
        jmp       ..B2.5        # Prob 100%                     #
                                # LOE rax rdx rcx rsi rdi r8d r9d
..B2.16:                        # Preds ..B2.18 ..B2.5          # Infreq
        movq      -72(%rsp), %r12                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.26:                     #
        movq      -64(%rsp), %r13                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.27:                     #
        movq      -56(%rsp), %r14                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.28:                     #
        movq      -48(%rsp), %r15                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.29:                     #
        movq      -40(%rsp), %rbx                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.30:                     #
        movq      -32(%rsp), %rbp                               #
..___tag_value__Z7multijkR6MatrixS0_S0_.31:                     #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.17:                        # Preds ..B2.16 ..B2.1          # Infreq
        ret                                                     #22.1
..___tag_value__Z7multijkR6MatrixS0_S0_.32:                     #
                                # LOE
..B2.18:                        # Preds ..B2.3                  # Infreq
        incq      %rcx                                          #18.3
        cmpq      %rax, %rcx                                    #18.3
        jb        ..B2.3        # Prob 82%                      #18.3
        jmp       ..B2.16       # Prob 100%                     #18.3
        .align    16,0x90
..___tag_value__Z7multijkR6MatrixS0_S0_.38:                     #
                                # LOE rax rdx rcx rsi rdi r8d r9d
# mark_end;
	.type	_Z7multijkR6MatrixS0_S0_,@function
	.size	_Z7multijkR6MatrixS0_S0_,.-_Z7multijkR6MatrixS0_S0_
	.data
# -- End  _Z7multijkR6MatrixS0_S0_
	.text
# -- Begin  __sti__$E
# mark_begin;
       .align    16,0x90
__sti__$E:
..B3.1:                         # Preds ..B3.0
..___tag_value___sti__$E.39:                                    #
        pushq     %rsi                                          #
..___tag_value___sti__$E.41:                                    #
        movl      $_ZSt8__ioinit, %edi                          #72.25
..___tag_value___sti__$E.42:                                    #72.25
        call      _ZNSt8ios_base4InitC1Ev                       #72.25
..___tag_value___sti__$E.43:                                    #
                                # LOE rbx rbp r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1
        movl      $_ZNSt8ios_base4InitD1Ev, %edi                #72.25
        movl      $_ZSt8__ioinit, %esi                          #72.25
        movl      $__dso_handle, %edx                           #72.25
        xorl      %eax, %eax                                    #72.25
..___tag_value___sti__$E.44:                                    #72.25
        call      __cxa_atexit                                  #72.25
..___tag_value___sti__$E.45:                                    #
                                # LOE rbx rbp r12 r13 r14 r15
..B3.3:                         # Preds ..B3.2
        popq      %rcx                                          #72.25
..___tag_value___sti__$E.46:                                    #
        ret                                                     #72.25
        .align    16,0x90
..___tag_value___sti__$E.47:                                    #
                                # LOE
# mark_end;
	.type	__sti__$E,@function
	.size	__sti__$E,.-__sti__$E
	.data
# -- End  __sti__$E
	.bss
	.align 4
	.align 1
_ZSt8__ioinit:
	.type	_ZSt8__ioinit,@object
	.size	_ZSt8__ioinit,1
	.space 1	# pad
	.section .ctors, "wa"
	.align 8
__init_0:
	.type	__init_0,@object
	.size	__init_0,8
	.quad	__sti__$E
	.data
	.hidden __dso_handle
# mark_proc_addr_taken __sti__$E;
# mark_proc_addr_taken _ZNSt8ios_base4InitD1Ev;
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
	.4byte 0x0000006c
	.4byte 0x00000024
	.8byte ..___tag_value__Z7multijkR6VectorS0_S0_i.1
	.8byte ..___tag_value__Z7multijkR6VectorS0_S0_i.17-..___tag_value__Z7multijkR6VectorS0_S0_i.1
	.2byte 0x0400
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.3-..___tag_value__Z7multijkR6VectorS0_S0_i.1
	.4byte 0x100e0286
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.5-..___tag_value__Z7multijkR6VectorS0_S0_i.3
	.2byte 0x108c
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.6-..___tag_value__Z7multijkR6VectorS0_S0_i.5
	.2byte 0x0f8d
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.7-..___tag_value__Z7multijkR6VectorS0_S0_i.6
	.2byte 0x0e8e
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.8-..___tag_value__Z7multijkR6VectorS0_S0_i.7
	.2byte 0x0d8f
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.9-..___tag_value__Z7multijkR6VectorS0_S0_i.8
	.2byte 0x0c83
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.10-..___tag_value__Z7multijkR6VectorS0_S0_i.9
	.2byte 0x04cc
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.11-..___tag_value__Z7multijkR6VectorS0_S0_i.10
	.2byte 0x04cd
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.12-..___tag_value__Z7multijkR6VectorS0_S0_i.11
	.2byte 0x04ce
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.13-..___tag_value__Z7multijkR6VectorS0_S0_i.12
	.2byte 0x04cf
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.14-..___tag_value__Z7multijkR6VectorS0_S0_i.13
	.2byte 0x04c3
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.15-..___tag_value__Z7multijkR6VectorS0_S0_i.14
	.2byte 0x04c6
	.4byte ..___tag_value__Z7multijkR6VectorS0_S0_i.16-..___tag_value__Z7multijkR6VectorS0_S0_i.15
	.2byte 0x080e
	.4byte 0x00000074
	.4byte 0x00000094
	.8byte ..___tag_value__Z7multijkR6MatrixS0_S0_.18
	.8byte ..___tag_value__Z7multijkR6MatrixS0_S0_.38-..___tag_value__Z7multijkR6MatrixS0_S0_.18
	.2byte 0x0400
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.20-..___tag_value__Z7multijkR6MatrixS0_S0_.18
	.2byte 0x0a8c
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.21-..___tag_value__Z7multijkR6MatrixS0_S0_.20
	.2byte 0x098d
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.22-..___tag_value__Z7multijkR6MatrixS0_S0_.21
	.2byte 0x088e
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.23-..___tag_value__Z7multijkR6MatrixS0_S0_.22
	.2byte 0x078f
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.24-..___tag_value__Z7multijkR6MatrixS0_S0_.23
	.2byte 0x0683
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.25-..___tag_value__Z7multijkR6MatrixS0_S0_.24
	.2byte 0x0586
	.byte 0x04
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.26-..___tag_value__Z7multijkR6MatrixS0_S0_.25
	.2byte 0x04cc
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.27-..___tag_value__Z7multijkR6MatrixS0_S0_.26
	.2byte 0x04cd
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.28-..___tag_value__Z7multijkR6MatrixS0_S0_.27
	.2byte 0x04ce
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.29-..___tag_value__Z7multijkR6MatrixS0_S0_.28
	.2byte 0x04cf
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.30-..___tag_value__Z7multijkR6MatrixS0_S0_.29
	.2byte 0x04c3
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.31-..___tag_value__Z7multijkR6MatrixS0_S0_.30
	.2byte 0x04c6
	.4byte ..___tag_value__Z7multijkR6MatrixS0_S0_.32-..___tag_value__Z7multijkR6MatrixS0_S0_.31
	.8byte 0x098d0a8c05860683
	.4byte 0x078f088e
	.4byte 0x00000024
	.4byte 0x0000010c
	.8byte ..___tag_value___sti__$E.39
	.8byte ..___tag_value___sti__$E.47-..___tag_value___sti__$E.39
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.41-..___tag_value___sti__$E.39
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.46-..___tag_value___sti__$E.41
	.2byte 0x080e
	.byte 0x00
# End
