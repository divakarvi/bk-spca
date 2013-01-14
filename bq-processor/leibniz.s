# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-O3 -S -fno-inline-functions";
	.file "leibniz.cpp"
	.text
..TXTST0:
# -- Begin  main
# mark_begin;
       .align    16,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0
..___tag_value_main.1:                                          #50.11
        pushq     %rbp                                          #50.11
..___tag_value_main.3:                                          #
        movq      %rsp, %rbp                                    #50.11
..___tag_value_main.4:                                          #
        andq      $-128, %rsp                                   #50.11
        pushq     %r12                                          #50.11
..___tag_value_main.6:                                          #
        pushq     %r13                                          #50.11
..___tag_value_main.7:                                          #
        pushq     %r15                                          #50.11
..___tag_value_main.8:                                          #
        pushq     %rbx                                          #50.11
..___tag_value_main.9:                                          #
        subq      $96, %rsp                                     #50.11
        movl      $3, %edi                                      #50.11
..___tag_value_main.10:                                         #50.11
        call      __intel_new_proc_init                         #50.11
..___tag_value_main.11:                                         #
                                # LOE r14
..B1.25:                        # Preds ..B1.1
        stmxcsr   16(%rsp)                                      #50.11
        orl       $32832, 16(%rsp)                              #50.11
        ldmxcsr   16(%rsp)                                      #50.11
        rdtsc                                                   #54.7
        movq      n.6631.0.8(%rip), %rdi                        #55.10
        movl      %edx, %r15d                                   #54.7
        movl      %eax, %r13d                                   #54.7
        movl      %r15d, 4(%rsp)                                #54.3
        movl      %r13d, (%rsp)                                 #54.3
..___tag_value_main.12:                                         #55.10
        call      _Z7leibnizl                                   #55.10
..___tag_value_main.13:                                         #
                                # LOE r13 r14 r15d xmm0
..B1.24:                        # Preds ..B1.25
        movsd     %xmm0, 24(%rsp)                               #55.10
        movl      $_ZSt4cout, %edi                              #57.7
        rdtsc                                                   #56.23
        movl      $.L_2__STRING.0, %esi                         #57.7
        movsd     .L_2il0floatpacket.46(%rip), %xmm0            #56.23
        movl      %edx, %r12d                                   #56.23
        movl      %eax, %ebx                                    #56.23
        movl      %r12d, 12(%rsp)                               #56.19
        movl      %ebx, 8(%rsp)                                 #56.19
        movsd     %xmm0, 16(%rsp)                               #56.23
..___tag_value_main.14:                                         #57.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #57.7
..___tag_value_main.15:                                         #
                                # LOE rax rbx r13 r14 r12d r15d
..B1.2:                         # Preds ..B1.24
        movsd     24(%rsp), %xmm0                               #57.25
        movq      %rax, %rdi                                    #57.25
..___tag_value_main.16:                                         #57.25
        call      _ZNSolsEd                                     #57.25
..___tag_value_main.17:                                         #
                                # LOE rax rbx r13 r14 r12d r15d
..B1.3:                         # Preds ..B1.2
        movq      %rax, %rdi                                    #57.31
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #57.31
..___tag_value_main.18:                                         #57.31
        call      _ZNSolsEPFRSoS_E                              #57.31
..___tag_value_main.19:                                         #
                                # LOE rbx r13 r14 r12d r15d
..B1.4:                         # Preds ..B1.3
        movl      $_ZSt4cout, %edi                              #58.7
        movl      $.L_2__STRING.1, %esi                         #58.7
..___tag_value_main.20:                                         #58.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #58.7
..___tag_value_main.21:                                         #
                                # LOE rax rbx r13 r14 r12d r15d
..B1.5:                         # Preds ..B1.4
        subl      %r15d, %r12d                                  #58.39
        movq      %rax, %rdi                                    #58.39
        cvtsi2sdq %rbx, %xmm0                                   #58.39
        cvtsi2sdq %r13, %xmm1                                   #58.39
        cvtsi2sdq %r12, %xmm2                                   #58.39
        cvtsi2sdq n.6631.0.8(%rip), %xmm3                       #58.39
        subsd     %xmm1, %xmm0                                  #58.39
        mulsd     16(%rsp), %xmm2                               #58.39
        addsd     %xmm2, %xmm0                                  #58.39
        divsd     %xmm3, %xmm0                                  #58.39
..___tag_value_main.22:                                         #58.39
        call      _ZNSolsEd                                     #58.39
..___tag_value_main.23:                                         #
                                # LOE rax r14
..B1.6:                         # Preds ..B1.5
        movq      %rax, %rdi                                    #58.48
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #58.48
..___tag_value_main.24:                                         #58.48
        call      _ZNSolsEPFRSoS_E                              #58.48
..___tag_value_main.25:                                         #
                                # LOE r14
..B1.7:                         # Preds ..B1.6
        rdtsc                                                   #59.7
        movq      n.6631.0.8(%rip), %rdi                        #60.10
        movl      %edx, %r15d                                   #59.7
        movl      %eax, %r13d                                   #59.7
        movl      %r15d, 4(%rsp)                                #59.3
        movl      %r13d, (%rsp)                                 #59.3
..___tag_value_main.26:                                         #60.10
        call      _Z8leibnizXl                                  #60.10
..___tag_value_main.27:                                         #
                                # LOE r13 r14 r15d xmm0
..B1.30:                        # Preds ..B1.7
        movsd     %xmm0, 24(%rsp)                               #60.10
        movl      $_ZSt4cout, %edi                              #62.7
        rdtsc                                                   #61.15
        movl      $.L_2__STRING.0, %esi                         #62.7
        movl      %edx, %r12d                                   #61.15
        movl      %eax, %ebx                                    #61.15
        movl      %r12d, 12(%rsp)                               #61.11
        movl      %ebx, 8(%rsp)                                 #61.11
..___tag_value_main.28:                                         #62.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #62.7
..___tag_value_main.29:                                         #
                                # LOE rax rbx r13 r14 r12d r15d
..B1.8:                         # Preds ..B1.30
        movsd     24(%rsp), %xmm0                               #62.25
        movq      %rax, %rdi                                    #62.25
..___tag_value_main.30:                                         #62.25
        call      _ZNSolsEd                                     #62.25
..___tag_value_main.31:                                         #
                                # LOE rax rbx r13 r14 r12d r15d
..B1.9:                         # Preds ..B1.8
        movq      %rax, %rdi                                    #62.31
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #62.31
..___tag_value_main.32:                                         #62.31
        call      _ZNSolsEPFRSoS_E                              #62.31
..___tag_value_main.33:                                         #
                                # LOE rbx r13 r14 r12d r15d
..B1.10:                        # Preds ..B1.9
        movl      $_ZSt4cout, %edi                              #63.7
        movl      $.L_2__STRING.1, %esi                         #63.7
..___tag_value_main.34:                                         #63.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #63.7
..___tag_value_main.35:                                         #
                                # LOE rax rbx r13 r14 r12d r15d
..B1.11:                        # Preds ..B1.10
        subl      %r15d, %r12d                                  #63.39
        movq      %rax, %rdi                                    #63.39
        cvtsi2sdq %rbx, %xmm0                                   #63.39
        cvtsi2sdq %r13, %xmm1                                   #63.39
        cvtsi2sdq %r12, %xmm2                                   #63.39
        cvtsi2sdq n.6631.0.8(%rip), %xmm3                       #63.39
        subsd     %xmm1, %xmm0                                  #63.39
        mulsd     16(%rsp), %xmm2                               #63.39
        addsd     %xmm2, %xmm0                                  #63.39
        divsd     %xmm3, %xmm0                                  #63.39
..___tag_value_main.36:                                         #63.39
        call      _ZNSolsEd                                     #63.39
..___tag_value_main.37:                                         #
                                # LOE rax r14
..B1.12:                        # Preds ..B1.11
        movq      %rax, %rdi                                    #63.48
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #63.48
..___tag_value_main.38:                                         #63.48
        call      _ZNSolsEPFRSoS_E                              #63.48
..___tag_value_main.39:                                         #
                                # LOE r14
..B1.13:                        # Preds ..B1.12
        rdtsc                                                   #64.7
        movq      n.6631.0.8(%rip), %rdi                        #65.10
        movl      %edx, 4(%rsp)                                 #64.7
        movl      %eax, (%rsp)                                  #64.7
..___tag_value_main.40:                                         #65.10
        call      _Z9leibnizXXl                                 #65.10
..___tag_value_main.41:                                         #
                                # LOE r14 xmm0
..B1.34:                        # Preds ..B1.13
        movsd     %xmm0, 24(%rsp)                               #65.10
                                # LOE r14
..B1.14:                        # Preds ..B1.34
        rdtsc                                                   #66.15
        movl      $_ZSt4cout, %edi                              #67.7
        movl      %edx, 12(%rsp)                                #66.11
        movl      $.L_2__STRING.0, %esi                         #67.7
        subl      4(%rsp), %edx                                 #66.15
        movl      %eax, 8(%rsp)                                 #66.11
        movl      %eax, %eax                                    #66.15
        movl      (%rsp), %ecx                                  #66.11
        cvtsi2sdq %rax, %xmm2                                   #66.15
        cvtsi2sdq %rcx, %xmm0                                   #66.15
        cvtsi2sdq %rdx, %xmm1                                   #66.15
        subsd     %xmm0, %xmm2                                  #66.15
        mulsd     16(%rsp), %xmm1                               #66.15
        addsd     %xmm1, %xmm2                                  #66.15
        movsd     %xmm2, 32(%rsp)                               #66.15
..___tag_value_main.42:                                         #67.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #67.7
..___tag_value_main.43:                                         #
                                # LOE rax r14
..B1.15:                        # Preds ..B1.14
        movsd     24(%rsp), %xmm0                               #67.25
        movq      %rax, %rdi                                    #67.25
..___tag_value_main.44:                                         #67.25
        call      _ZNSolsEd                                     #67.25
..___tag_value_main.45:                                         #
                                # LOE rax r14
..B1.16:                        # Preds ..B1.15
        movq      %rax, %rdi                                    #67.31
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #67.31
..___tag_value_main.46:                                         #67.31
        call      _ZNSolsEPFRSoS_E                              #67.31
..___tag_value_main.47:                                         #
                                # LOE r14
..B1.17:                        # Preds ..B1.16
        movl      $_ZSt4cout, %edi                              #68.7
        movl      $.L_2__STRING.1, %esi                         #68.7
..___tag_value_main.48:                                         #68.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #68.7
..___tag_value_main.49:                                         #
                                # LOE rax r14
..B1.18:                        # Preds ..B1.17
        cvtsi2sdq n.6631.0.8(%rip), %xmm1                       #68.39
        movsd     32(%rsp), %xmm0                               #68.39
        movq      %rax, %rdi                                    #68.39
        divsd     %xmm1, %xmm0                                  #68.39
..___tag_value_main.50:                                         #68.39
        call      _ZNSolsEd                                     #68.39
..___tag_value_main.51:                                         #
                                # LOE rax r14
..B1.19:                        # Preds ..B1.18
        movq      %rax, %rdi                                    #68.48
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #68.48
..___tag_value_main.52:                                         #68.48
        call      _ZNSolsEPFRSoS_E                              #68.48
..___tag_value_main.53:                                         #
                                # LOE r14
..B1.20:                        # Preds ..B1.19
        xorl      %eax, %eax                                    #69.1
        addq      $96, %rsp                                     #69.1
..___tag_value_main.54:                                         #69.1
        popq      %rbx                                          #69.1
..___tag_value_main.55:                                         #69.1
        popq      %r15                                          #69.1
..___tag_value_main.56:                                         #69.1
        popq      %r13                                          #69.1
..___tag_value_main.57:                                         #69.1
        popq      %r12                                          #69.1
        movq      %rbp, %rsp                                    #69.1
        popq      %rbp                                          #69.1
..___tag_value_main.58:                                         #
        ret                                                     #69.1
        .align    16,0x90
..___tag_value_main.60:                                         #
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.data
	.align 8
	.align 8
n.6631.0.8:
	.long	0x3b9aca00,0x00000000
	.data
# -- End  main
	.text
# -- Begin  _Z7leibnizl
# mark_begin;
       .align    16,0x90
	.globl _Z7leibnizl
_Z7leibnizl:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
..___tag_value__Z7leibnizl.61:                                  #7.27
        pxor      %xmm0, %xmm0                                  #9.3
        testq     %rdi, %rdi                                    #10.16
        jle       ..B2.9        # Prob 50%                      #10.16
                                # LOE rbx rbp rdi r12 r13 r14 r15 xmm0
..B2.2:                         # Preds ..B2.1
        movsd     .L_2il0floatpacket.48(%rip), %xmm0            #12.4
        xorl      %eax, %eax                                    #10.3
        cmpq      $2, %rdi                                      #10.3
        jl        ..B2.9        # Prob 10%                      #10.3
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 xmm0
..B2.3:                         # Preds ..B2.2
        decq      %rdi                                          #
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 xmm0
..B2.4:                         # Preds ..B2.7 ..B2.3
        movsd     .L_2il0floatpacket.49(%rip), %xmm1            #14.21
        lea       1(%rax), %rsi                                 #13.12
        cvtsi2sdq %rsi, %xmm2                                   #14.21
        movq      %rsi, %rdx                                    #13.12
        addsd     %xmm2, %xmm1                                  #14.21
        shrq      $63, %rdx                                     #13.12
        addsd     %xmm1, %xmm2                                  #14.23
        lea       1(%rax,%rdx), %rcx                            #13.17
        andq      $-2, %rcx                                     #13.17
        cmpq      %rax, %rcx                                    #13.20
        je        ..B2.6        # Prob 16%                      #13.20
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 xmm0 xmm2
..B2.5:                         # Preds ..B2.4
        movsd     .L_2il0floatpacket.48(%rip), %xmm1            #16.23
        divsd     %xmm2, %xmm1                                  #16.23
        addsd     %xmm1, %xmm0                                  #16.4
        jmp       ..B2.7        # Prob 100%                     #16.4
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 xmm0
..B2.6:                         # Preds ..B2.4
        movsd     .L_2il0floatpacket.48(%rip), %xmm1            #14.23
        divsd     %xmm2, %xmm1                                  #14.23
        subsd     %xmm1, %xmm0                                  #14.4
                                # LOE rbx rbp rsi rdi r12 r13 r14 r15 xmm0
..B2.7:                         # Preds ..B2.6 ..B2.5
        movq      %rsi, %rax                                    #10.3
        cmpq      %rdi, %rsi                                    #10.3
        jb        ..B2.4        # Prob 82%                      #10.3
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 xmm0
..B2.9:                         # Preds ..B2.7 ..B2.2 ..B2.1
        ret                                                     #17.10
        .align    16,0x90
..___tag_value__Z7leibnizl.63:                                  #
                                # LOE
# mark_end;
	.type	_Z7leibnizl,@function
	.size	_Z7leibnizl,.-_Z7leibnizl
	.data
# -- End  _Z7leibnizl
	.text
# -- Begin  _Z8leibnizXl
# mark_begin;
       .align    16,0x90
	.globl _Z8leibnizXl
_Z8leibnizXl:
# parameter 1: %rdi
..B3.1:                         # Preds ..B3.0
..___tag_value__Z8leibnizXl.64:                                 #20.28
        movsd     .L_2il0floatpacket.51(%rip), %xmm0            #22.14
        pxor      %xmm1, %xmm1                                  #23.14
        cmpq      $2, %rdi                                      #24.16
        jle       ..B3.10       # Prob 50%                      #24.16
                                # LOE rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.2:                         # Preds ..B3.1
        lea       -1(%rdi), %rax                                #24.3
        shrq      $63, %rax                                     #24.3
        lea       -1(%rax,%rdi), %rdx                           #24.3
        sarq      $1, %rdx                                      #24.3
        cmpq      $8, %rdx                                      #24.3
        jl        ..B3.20       # Prob 10%                      #24.3
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.3:                         # Preds ..B3.2
        movq      $0x0fffffff8, %rcx                            #24.3
        xorl      %eax, %eax                                    #24.3
        movaps    .L_2il0floatpacket.52(%rip), %xmm0            #22.14
        pxor      %xmm7, %xmm7                                  #22.14
        movdqa    .L_2il0floatpacket.53(%rip), %xmm3            #22.14
        andq      %rdx, %rcx                                    #24.3
        movdqa    .L_2il0floatpacket.54(%rip), %xmm5            #22.14
        movaps    .L_2il0floatpacket.56(%rip), %xmm2            #25.24
                                # LOE rax rdx rcx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B3.4:                         # Preds ..B3.4 ..B3.3
        movdqa    %xmm5, %xmm10                                 #25.22
        addq      $8, %rax                                      #24.3
        movd      %xmm5, %rsi                                   #25.22
        cmpq      %rcx, %rax                                    #24.3
        psrldq    $8, %xmm10                                    #25.22
        paddq     %xmm3, %xmm5                                  #22.14
        movd      %xmm10, %r8                                   #25.22
        movdqa    %xmm5, %xmm14                                 #25.22
        psrldq    $8, %xmm14                                    #25.22
        cvtsi2sdq %rsi, %xmm6                                   #25.22
        cvtsi2sdq %r8, %xmm8                                    #25.22
        cvtsi2sdq %rsi, %xmm9                                   #25.22
        cvtsi2sdq %r8, %xmm4                                    #25.22
        movd      %xmm5, %r9                                    #25.22
        movd      %xmm14, %r10                                  #25.22
        movaps    %xmm6, %xmm12                                 #25.22
        movaps    %xmm9, %xmm11                                 #25.22
        unpcklpd  %xmm8, %xmm12                                 #25.22
        cvtsi2sdq %r9, %xmm6                                    #25.22
        addpd     %xmm2, %xmm12                                 #25.22
        cvtsi2sdq %r10, %xmm8                                   #25.22
        cvtsi2sdq %r9, %xmm9                                    #25.22
        paddq     %xmm3, %xmm5                                  #22.14
        movaps    %xmm6, %xmm10                                 #25.22
        movaps    %xmm9, %xmm15                                 #25.22
        unpcklpd  %xmm4, %xmm11                                 #25.22
        cvtsi2sdq %r10, %xmm4                                   #25.22
        addpd     %xmm11, %xmm12                                #25.24
        movd      %xmm5, %r11                                   #25.22
        unpcklpd  %xmm8, %xmm10                                 #25.22
        addpd     %xmm2, %xmm10                                 #25.22
        cvtsi2sdq %r11, %xmm6                                   #25.22
        cvtsi2sdq %r11, %xmm9                                   #25.22
        unpcklpd  %xmm4, %xmm15                                 #25.22
        movaps    %xmm6, %xmm14                                 #25.22
        addpd     %xmm15, %xmm10                                #25.24
        movaps    .L_2il0floatpacket.55(%rip), %xmm11           #25.24
        divpd     %xmm10, %xmm11                                #25.24
        movaps    .L_2il0floatpacket.55(%rip), %xmm13           #25.24
        divpd     %xmm12, %xmm13                                #25.24
        movdqa    %xmm5, %xmm12                                 #25.22
        psrldq    $8, %xmm12                                    #25.22
        movd      %xmm12, %rsi                                  #25.22
        paddq     %xmm3, %xmm5                                  #22.14
        addpd     %xmm11, %xmm7                                 #25.5
        addpd     %xmm13, %xmm0                                 #25.5
        cvtsi2sdq %rsi, %xmm8                                   #25.22
        cvtsi2sdq %rsi, %xmm4                                   #25.22
        movd      %xmm5, %r8                                    #25.22
        movdqa    %xmm5, %xmm11                                 #25.22
        movaps    %xmm9, %xmm13                                 #25.22
        psrldq    $8, %xmm11                                    #25.22
        movd      %xmm11, %r9                                   #25.22
        unpcklpd  %xmm8, %xmm14                                 #25.22
        unpcklpd  %xmm4, %xmm13                                 #25.22
        cvtsi2sdq %r8, %xmm6                                    #25.22
        addpd     %xmm2, %xmm14                                 #25.22
        cvtsi2sdq %r9, %xmm8                                    #25.22
        cvtsi2sdq %r8, %xmm9                                    #25.22
        cvtsi2sdq %r9, %xmm4                                    #25.22
        addpd     %xmm13, %xmm14                                #25.24
        paddq     %xmm3, %xmm5                                  #22.14
        movaps    %xmm6, %xmm13                                 #25.22
        movaps    %xmm9, %xmm12                                 #25.22
        unpcklpd  %xmm8, %xmm13                                 #25.22
        addpd     %xmm2, %xmm13                                 #25.22
        unpcklpd  %xmm4, %xmm12                                 #25.22
        addpd     %xmm12, %xmm13                                #25.24
        movaps    .L_2il0floatpacket.55(%rip), %xmm10           #25.24
        movaps    .L_2il0floatpacket.55(%rip), %xmm15           #25.24
        divpd     %xmm14, %xmm10                                #25.24
        divpd     %xmm13, %xmm15                                #25.24
        addpd     %xmm10, %xmm0                                 #25.5
        addpd     %xmm15, %xmm7                                 #25.5
        jb        ..B3.4        # Prob 82%                      #24.3
                                # LOE rax rdx rcx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B3.5:                         # Preds ..B3.4
        addpd     %xmm7, %xmm0                                  #22.14
        movaps    %xmm0, %xmm2                                  #22.14
        unpckhpd  %xmm0, %xmm2                                  #22.14
        addsd     %xmm2, %xmm0                                  #22.14
                                # LOE rdx rcx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.6:                         # Preds ..B3.5 ..B3.20
        cmpq      %rdx, %rcx                                    #24.3
        jae       ..B3.11       # Prob 16%                      #24.3
                                # LOE rdx rcx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.8:                         # Preds ..B3.6 ..B3.8
        pxor      %xmm2, %xmm2                                  #25.22
        lea       2(,%rcx,2), %rax                              #25.5
        cvtsi2sdq %rax, %xmm2                                   #25.22
        movsd     .L_2il0floatpacket.58(%rip), %xmm3            #25.22
        incq      %rcx                                          #24.3
        movsd     .L_2il0floatpacket.51(%rip), %xmm4            #25.24
        cmpq      %rdx, %rcx                                    #24.3
        addsd     %xmm2, %xmm3                                  #25.22
        addsd     %xmm2, %xmm3                                  #25.24
        divsd     %xmm3, %xmm4                                  #25.24
        addsd     %xmm4, %xmm0                                  #25.5
        jb        ..B3.8        # Prob 82%                      #24.3
        jmp       ..B3.11       # Prob 100%                     #24.3
                                # LOE rdx rcx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.10:                        # Preds ..B3.1
        cmpq      $1, %rdi                                      #26.16
        jle       ..B3.19       # Prob 50%                      #26.16
                                # LOE rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.11:                        # Preds ..B3.10 ..B3.8 ..B3.6
        movq      %rdi, %rax                                    #26.3
        shrq      $63, %rax                                     #26.3
        addq      %rax, %rdi                                    #26.3
        sarq      $1, %rdi                                      #26.3
        cmpq      $8, %rdi                                      #26.3
        jl        ..B3.21       # Prob 10%                      #26.3
                                # LOE rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.12:                        # Preds ..B3.11
        movq      $0x0fffffff8, %rdx                            #26.3
        xorl      %eax, %eax                                    #26.3
        pxor      %xmm1, %xmm1                                  #23.14
        andq      %rdi, %rdx                                    #26.3
        movdqa    .L_2il0floatpacket.53(%rip), %xmm2            #23.14
        movaps    %xmm1, %xmm7                                  #23.14
        movdqa    .L_2il0floatpacket.57(%rip), %xmm5            #23.14
        movaps    .L_2il0floatpacket.56(%rip), %xmm3            #27.24
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B3.13:                        # Preds ..B3.13 ..B3.12
        movdqa    %xmm5, %xmm10                                 #27.22
        addq      $8, %rax                                      #26.3
        movd      %xmm5, %rcx                                   #27.22
        cmpq      %rdx, %rax                                    #26.3
        psrldq    $8, %xmm10                                    #27.22
        paddq     %xmm2, %xmm5                                  #23.14
        movd      %xmm10, %rsi                                  #27.22
        movdqa    %xmm5, %xmm14                                 #27.22
        psrldq    $8, %xmm14                                    #27.22
        cvtsi2sdq %rcx, %xmm6                                   #27.22
        cvtsi2sdq %rsi, %xmm8                                   #27.22
        cvtsi2sdq %rcx, %xmm9                                   #27.22
        cvtsi2sdq %rsi, %xmm4                                   #27.22
        movd      %xmm5, %r8                                    #27.22
        movd      %xmm14, %r9                                   #27.22
        movaps    %xmm6, %xmm12                                 #27.22
        movaps    %xmm9, %xmm11                                 #27.22
        unpcklpd  %xmm8, %xmm12                                 #27.22
        cvtsi2sdq %r8, %xmm6                                    #27.22
        addpd     %xmm3, %xmm12                                 #27.22
        cvtsi2sdq %r9, %xmm8                                    #27.22
        cvtsi2sdq %r8, %xmm9                                    #27.22
        paddq     %xmm2, %xmm5                                  #23.14
        movaps    %xmm6, %xmm10                                 #27.22
        movaps    %xmm9, %xmm15                                 #27.22
        unpcklpd  %xmm4, %xmm11                                 #27.22
        cvtsi2sdq %r9, %xmm4                                    #27.22
        addpd     %xmm11, %xmm12                                #27.24
        movd      %xmm5, %r10                                   #27.22
        unpcklpd  %xmm8, %xmm10                                 #27.22
        addpd     %xmm3, %xmm10                                 #27.22
        cvtsi2sdq %r10, %xmm6                                   #27.22
        cvtsi2sdq %r10, %xmm9                                   #27.22
        unpcklpd  %xmm4, %xmm15                                 #27.22
        movaps    %xmm6, %xmm14                                 #27.22
        addpd     %xmm15, %xmm10                                #27.24
        movaps    .L_2il0floatpacket.55(%rip), %xmm11           #27.24
        divpd     %xmm10, %xmm11                                #27.24
        movaps    .L_2il0floatpacket.55(%rip), %xmm13           #27.24
        divpd     %xmm12, %xmm13                                #27.24
        movdqa    %xmm5, %xmm12                                 #27.22
        psrldq    $8, %xmm12                                    #27.22
        movd      %xmm12, %r11                                  #27.22
        paddq     %xmm2, %xmm5                                  #23.14
        addpd     %xmm11, %xmm7                                 #27.5
        addpd     %xmm13, %xmm1                                 #27.5
        cvtsi2sdq %r11, %xmm8                                   #27.22
        cvtsi2sdq %r11, %xmm4                                   #27.22
        movd      %xmm5, %rcx                                   #27.22
        movdqa    %xmm5, %xmm11                                 #27.22
        movaps    %xmm9, %xmm13                                 #27.22
        psrldq    $8, %xmm11                                    #27.22
        movd      %xmm11, %rsi                                  #27.22
        unpcklpd  %xmm8, %xmm14                                 #27.22
        unpcklpd  %xmm4, %xmm13                                 #27.22
        cvtsi2sdq %rcx, %xmm6                                   #27.22
        addpd     %xmm3, %xmm14                                 #27.22
        cvtsi2sdq %rsi, %xmm8                                   #27.22
        cvtsi2sdq %rcx, %xmm9                                   #27.22
        cvtsi2sdq %rsi, %xmm4                                   #27.22
        addpd     %xmm13, %xmm14                                #27.24
        paddq     %xmm2, %xmm5                                  #23.14
        movaps    %xmm6, %xmm13                                 #27.22
        movaps    %xmm9, %xmm12                                 #27.22
        unpcklpd  %xmm8, %xmm13                                 #27.22
        addpd     %xmm3, %xmm13                                 #27.22
        unpcklpd  %xmm4, %xmm12                                 #27.22
        addpd     %xmm12, %xmm13                                #27.24
        movaps    .L_2il0floatpacket.55(%rip), %xmm10           #27.24
        movaps    .L_2il0floatpacket.55(%rip), %xmm15           #27.24
        divpd     %xmm14, %xmm10                                #27.24
        divpd     %xmm13, %xmm15                                #27.24
        addpd     %xmm10, %xmm1                                 #27.5
        addpd     %xmm15, %xmm7                                 #27.5
        jb        ..B3.13       # Prob 81%                      #26.3
                                # LOE rax rdx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B3.14:                        # Preds ..B3.13
        addpd     %xmm7, %xmm1                                  #23.14
        movaps    %xmm1, %xmm2                                  #23.14
        unpckhpd  %xmm1, %xmm2                                  #23.14
        addsd     %xmm2, %xmm1                                  #23.14
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.15:                        # Preds ..B3.14 ..B3.21
        cmpq      %rdi, %rdx                                    #26.3
        jae       ..B3.19       # Prob 10%                      #26.3
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.17:                        # Preds ..B3.15 ..B3.17
        pxor      %xmm2, %xmm2                                  #27.22
        lea       1(,%rdx,2), %rax                              #27.5
        cvtsi2sdq %rax, %xmm2                                   #27.22
        movsd     .L_2il0floatpacket.58(%rip), %xmm3            #27.22
        incq      %rdx                                          #26.3
        movsd     .L_2il0floatpacket.51(%rip), %xmm4            #27.24
        cmpq      %rdi, %rdx                                    #26.3
        addsd     %xmm2, %xmm3                                  #27.22
        addsd     %xmm2, %xmm3                                  #27.24
        divsd     %xmm3, %xmm4                                  #27.24
        addsd     %xmm4, %xmm1                                  #27.5
        jb        ..B3.17       # Prob 81%                      #26.3
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.19:                        # Preds ..B3.17 ..B3.15 ..B3.10
        subsd     %xmm1, %xmm0                                  #28.15
        ret                                                     #28.15
                                # LOE
..B3.20:                        # Preds ..B3.2                  # Infreq
        xorl      %ecx, %ecx                                    #24.3
        jmp       ..B3.6        # Prob 100%                     #24.3
                                # LOE rdx rcx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
..B3.21:                        # Preds ..B3.11                 # Infreq
        xorl      %edx, %edx                                    #26.3
        jmp       ..B3.15       # Prob 100%                     #26.3
        .align    16,0x90
..___tag_value__Z8leibnizXl.66:                                 #
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 xmm0 xmm1
# mark_end;
	.type	_Z8leibnizXl,@function
	.size	_Z8leibnizXl,.-_Z8leibnizXl
	.data
# -- End  _Z8leibnizXl
	.text
# -- Begin  _Z9leibnizXXl
# mark_begin;
       .align    16,0x90
	.globl _Z9leibnizXXl
_Z9leibnizXXl:
# parameter 1: %rdi
..B4.1:                         # Preds ..B4.0
..___tag_value__Z9leibnizXXl.67:                                #31.29
        pxor      %xmm0, %xmm0                                  #33.17
        movaps    %xmm0, -88(%rsp)                              #33.17
        movaps    %xmm0, -72(%rsp)                              #33.17
        movaps    %xmm0, -56(%rsp)                              #33.17
        movaps    %xmm0, -40(%rsp)                              #33.17
        movaps    %xmm0, -24(%rsp)                              #33.17
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B4.2:                         # Preds ..B4.1
        testq     %rdi, %rdi                                    #34.16
        jle       ..B4.9        # Prob 50%                      #34.16
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B4.3:                         # Preds ..B4.2
        addq      $9, %rdi                                      #34.3
        movq      $0x6666666666666667, %rax                     #34.3
        imulq     %rdi                                          #34.3
        sarq      $2, %rdx                                      #34.3
        movl      $1, %esi                                      #34.3
        sarq      $63, %rdi                                     #34.3
        xorl      %ecx, %ecx                                    #34.3
        subq      %rdi, %rdx                                    #34.3
        movq      %rdx, %rax                                    #34.3
        shrq      $1, %rax                                      #34.3
        testq     %rax, %rax                                    #34.3
        jbe       ..B4.7        # Prob 10%                      #34.3
                                # LOE rax rdx rcx rbx rbp rsi r12 r13 r14 r15
..B4.4:                         # Preds ..B4.3
        movaps    .L_2il0floatpacket.61(%rip), %xmm6            #35.15
        movaps    .L_2__cnst_pck.59(%rip), %xmm11               #35.26
        movaps    16+.L_2__cnst_pck.59(%rip), %xmm10            #35.26
        movaps    32+.L_2__cnst_pck.59(%rip), %xmm8             #35.26
        movaps    48+.L_2__cnst_pck.59(%rip), %xmm5             #35.26
        movaps    64+.L_2__cnst_pck.59(%rip), %xmm2             #35.26
        movaps    -88(%rsp), %xmm3                              #35.5
        movaps    -72(%rsp), %xmm9                              #35.5
        movaps    -56(%rsp), %xmm7                              #35.5
        movaps    -40(%rsp), %xmm4                              #35.5
        movaps    -24(%rsp), %xmm12                             #35.5
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12
..B4.5:                         # Preds ..B4.5 ..B4.4
        pxor      %xmm1, %xmm1                                  #35.24
        lea       (%rcx,%rcx,4), %rdi                           #35.24
        movaps    %xmm10, %xmm15                                #35.26
        lea       (,%rdi,4), %rsi                               #35.24
        cvtsi2sdq %rsi, %xmm1                                   #35.24
        movaps    %xmm11, %xmm13                                #35.26
        movaps    %xmm6, %xmm0                                  #35.26
        movaps    %xmm6, %xmm14                                 #35.26
        lea       10(,%rdi,4), %r8                              #35.24
        incq      %rcx                                          #34.3
        addsd     %xmm1, %xmm1                                  #35.24
        cmpq      %rax, %rcx                                    #34.3
        unpcklpd  %xmm1, %xmm1                                  #35.24
        addpd     %xmm1, %xmm15                                 #35.26
        addpd     %xmm1, %xmm13                                 #35.26
        divpd     %xmm15, %xmm0                                 #35.26
        divpd     %xmm13, %xmm14                                #35.26
        movaps    %xmm8, %xmm13                                 #35.26
        movaps    %xmm6, %xmm15                                 #35.26
        addpd     %xmm0, %xmm9                                  #35.5
        addpd     %xmm1, %xmm13                                 #35.26
        addpd     %xmm14, %xmm3                                 #35.5
        movaps    %xmm5, %xmm0                                  #35.26
        movaps    %xmm6, %xmm14                                 #35.26
        addpd     %xmm1, %xmm0                                  #35.26
        addpd     %xmm2, %xmm1                                  #35.26
        divpd     %xmm13, %xmm14                                #35.26
        movaps    %xmm6, %xmm13                                 #35.26
        divpd     %xmm0, %xmm13                                 #35.26
        cvtsi2sdq %r8, %xmm0                                    #35.24
        addpd     %xmm13, %xmm4                                 #35.5
        addpd     %xmm14, %xmm7                                 #35.5
        divpd     %xmm1, %xmm15                                 #35.26
        movaps    %xmm11, %xmm1                                 #35.26
        movaps    %xmm6, %xmm13                                 #35.26
        movaps    %xmm10, %xmm14                                #35.26
        addsd     %xmm0, %xmm0                                  #35.24
        addpd     %xmm15, %xmm12                                #35.5
        unpcklpd  %xmm0, %xmm0                                  #35.24
        movaps    %xmm6, %xmm15                                 #35.26
        addpd     %xmm0, %xmm1                                  #35.26
        addpd     %xmm0, %xmm14                                 #35.26
        divpd     %xmm1, %xmm13                                 #35.26
        movaps    %xmm8, %xmm1                                  #35.26
        addpd     %xmm0, %xmm1                                  #35.26
        addpd     %xmm13, %xmm3                                 #35.5
        divpd     %xmm14, %xmm15                                #35.26
        movaps    %xmm6, %xmm13                                 #35.26
        movaps    %xmm5, %xmm14                                 #35.26
        divpd     %xmm1, %xmm13                                 #35.26
        addpd     %xmm0, %xmm14                                 #35.26
        addpd     %xmm2, %xmm0                                  #35.26
        addpd     %xmm13, %xmm7                                 #35.5
        addpd     %xmm15, %xmm9                                 #35.5
        movaps    %xmm6, %xmm1                                  #35.26
        movaps    %xmm6, %xmm13                                 #35.26
        divpd     %xmm14, %xmm1                                 #35.26
        divpd     %xmm0, %xmm13                                 #35.26
        addpd     %xmm1, %xmm4                                  #35.5
        addpd     %xmm13, %xmm12                                #35.5
        jb        ..B4.5        # Prob 56%                      #34.3
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12
..B4.6:                         # Preds ..B4.5
        movaps    %xmm12, -24(%rsp)                             #35.5
        lea       1(,%rcx,2), %rsi                              #34.3
        movaps    %xmm4, -40(%rsp)                              #35.5
        movaps    %xmm7, -56(%rsp)                              #35.5
        movaps    %xmm9, -72(%rsp)                              #35.5
        movaps    %xmm3, -88(%rsp)                              #35.5
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15
..B4.7:                         # Preds ..B4.6 ..B4.3
        cmpq      %rdx, %rsi                                    #34.3
        ja        ..B4.9        # Prob 50%                      #34.3
                                # LOE rbx rbp rsi r12 r13 r14 r15
..B4.8:                         # Preds ..B4.7
        movaps    .L_2__cnst_pck.59(%rip), %xmm1                #35.26
        lea       (%rsi,%rsi,4), %rax                           #35.24
        movaps    16+.L_2__cnst_pck.59(%rip), %xmm3             #35.26
        lea       -10(,%rax,2), %rdx                            #35.24
        cvtsi2sdq %rdx, %xmm0                                   #35.24
        movaps    32+.L_2__cnst_pck.59(%rip), %xmm5             #35.26
        addsd     %xmm0, %xmm0                                  #35.24
        movaps    48+.L_2__cnst_pck.59(%rip), %xmm7             #35.26
        movaps    64+.L_2__cnst_pck.59(%rip), %xmm9             #35.26
        unpcklpd  %xmm0, %xmm0                                  #35.24
        addpd     %xmm0, %xmm1                                  #35.26
        addpd     %xmm0, %xmm3                                  #35.26
        addpd     %xmm0, %xmm5                                  #35.26
        addpd     %xmm0, %xmm7                                  #35.26
        addpd     %xmm9, %xmm0                                  #35.26
        movaps    .L_2il0floatpacket.61(%rip), %xmm10           #35.15
        movaps    %xmm10, %xmm2                                 #35.26
        movaps    %xmm10, %xmm4                                 #35.26
        movaps    %xmm10, %xmm6                                 #35.26
        movaps    %xmm10, %xmm8                                 #35.26
        divpd     %xmm1, %xmm2                                  #35.26
        divpd     %xmm3, %xmm4                                  #35.26
        divpd     %xmm5, %xmm6                                  #35.26
        divpd     %xmm7, %xmm8                                  #35.26
        divpd     %xmm0, %xmm10                                 #35.26
        addpd     -88(%rsp), %xmm2                              #35.5
        addpd     -72(%rsp), %xmm4                              #35.5
        addpd     -56(%rsp), %xmm6                              #35.5
        addpd     -40(%rsp), %xmm8                              #35.5
        addpd     -24(%rsp), %xmm10                             #35.5
        movaps    %xmm2, -88(%rsp)                              #35.5
        movaps    %xmm4, -72(%rsp)                              #35.5
        movaps    %xmm6, -56(%rsp)                              #35.5
        movaps    %xmm8, -40(%rsp)                              #35.5
        movaps    %xmm10, -24(%rsp)                             #35.5
                                # LOE rbx rbp r12 r13 r14 r15
..B4.9:                         # Preds ..B4.7 ..B4.2 ..B4.8
        movsd     -88(%rsp), %xmm0                              #46.10
        addsd     -72(%rsp), %xmm0                              #46.17
        addsd     -56(%rsp), %xmm0                              #46.24
        addsd     -40(%rsp), %xmm0                              #46.31
        addsd     -24(%rsp), %xmm0                              #46.38
        subsd     -80(%rsp), %xmm0                              #47.6
        subsd     -64(%rsp), %xmm0                              #47.13
        subsd     -48(%rsp), %xmm0                              #47.20
        subsd     -32(%rsp), %xmm0                              #47.27
        subsd     -16(%rsp), %xmm0                              #47.34
        ret                                                     #47.34
        .align    16,0x90
..___tag_value__Z9leibnizXXl.69:                                #
                                # LOE
# mark_end;
	.type	_Z9leibnizXXl,@function
	.size	_Z9leibnizXXl,.-_Z9leibnizXXl
	.data
# -- End  _Z9leibnizXXl
	.text
# -- Begin  __sti__$E
# mark_begin;
       .align    16,0x90
__sti__$E:
..B5.1:                         # Preds ..B5.0
..___tag_value___sti__$E.70:                                    #
        pushq     %rsi                                          #
..___tag_value___sti__$E.72:                                    #
        movl      $_ZSt8__ioinit, %edi                          #72.25
..___tag_value___sti__$E.73:                                    #72.25
        call      _ZNSt8ios_base4InitC1Ev                       #72.25
..___tag_value___sti__$E.74:                                    #
                                # LOE rbx rbp r12 r13 r14 r15
..B5.2:                         # Preds ..B5.1
        movl      $_ZNSt8ios_base4InitD1Ev, %edi                #72.25
        movl      $_ZSt8__ioinit, %esi                          #72.25
        movl      $__dso_handle, %edx                           #72.25
        xorl      %eax, %eax                                    #72.25
..___tag_value___sti__$E.75:                                    #72.25
        call      __cxa_atexit                                  #72.25
..___tag_value___sti__$E.76:                                    #
                                # LOE rbx rbp r12 r13 r14 r15
..B5.3:                         # Preds ..B5.2
        popq      %rcx                                          #72.25
..___tag_value___sti__$E.77:                                    #
        ret                                                     #72.25
        .align    16,0x90
..___tag_value___sti__$E.78:                                    #
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
	.section .rodata, "a"
	.align 16
	.align 16
.L_2il0floatpacket.52:
	.long	0x00000000,0x40100000,0x00000000,0x00000000
	.type	.L_2il0floatpacket.52,@object
	.size	.L_2il0floatpacket.52,16
	.align 16
.L_2il0floatpacket.53:
	.long	0x00000004,0x00000000,0x00000004,0x00000000
	.type	.L_2il0floatpacket.53,@object
	.size	.L_2il0floatpacket.53,16
	.align 16
.L_2il0floatpacket.54:
	.long	0x00000002,0x00000000,0x00000004,0x00000000
	.type	.L_2il0floatpacket.54,@object
	.size	.L_2il0floatpacket.54,16
	.align 16
.L_2il0floatpacket.55:
	.long	0x00000000,0x40100000,0x00000000,0x40100000
	.type	.L_2il0floatpacket.55,@object
	.size	.L_2il0floatpacket.55,16
	.align 16
.L_2il0floatpacket.56:
	.long	0x00000000,0x3ff00000,0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.56,@object
	.size	.L_2il0floatpacket.56,16
	.align 16
.L_2il0floatpacket.57:
	.long	0x00000001,0x00000000,0x00000003,0x00000000
	.type	.L_2il0floatpacket.57,@object
	.size	.L_2il0floatpacket.57,16
	.align 16
.L_2__cnst_pck.59:
	.long	0x00000000,0x3ff00000
	.long	0x00000000,0x40080000
	.long	0x00000000,0x40140000
	.long	0x00000000,0x401c0000
	.long	0x00000000,0x40220000
	.long	0x00000000,0x40260000
	.long	0x00000000,0x402a0000
	.long	0x00000000,0x402e0000
	.long	0x00000000,0x40310000
	.long	0x00000000,0x40330000
	.type	.L_2__cnst_pck.59,@object
	.size	.L_2__cnst_pck.59,80
	.align 16
.L_2il0floatpacket.61:
	.long	0x00000000,0x40100000,0x00000000,0x40100000
	.type	.L_2il0floatpacket.61,@object
	.size	.L_2il0floatpacket.61,16
	.align 8
.L_2il0floatpacket.46:
	.long	0x00000000,0x41f00000
	.type	.L_2il0floatpacket.46,@object
	.size	.L_2il0floatpacket.46,8
	.align 8
.L_2il0floatpacket.48:
	.long	0x00000000,0x40100000
	.type	.L_2il0floatpacket.48,@object
	.size	.L_2il0floatpacket.48,8
	.align 8
.L_2il0floatpacket.49:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.49,@object
	.size	.L_2il0floatpacket.49,8
	.align 8
.L_2il0floatpacket.51:
	.long	0x00000000,0x40100000
	.type	.L_2il0floatpacket.51,@object
	.size	.L_2il0floatpacket.51,8
	.align 8
.L_2il0floatpacket.58:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.58,@object
	.size	.L_2il0floatpacket.58,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.byte	112
	.byte	97
	.byte	114
	.byte	116
	.byte	105
	.byte	97
	.byte	108
	.byte	32
	.byte	115
	.byte	117
	.byte	109
	.byte	32
	.byte	61
	.byte	32
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,15
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.byte	99
	.byte	121
	.byte	99
	.byte	108
	.byte	101
	.byte	115
	.byte	32
	.byte	112
	.byte	101
	.byte	114
	.byte	32
	.byte	116
	.byte	101
	.byte	114
	.byte	109
	.byte	32
	.byte	105
	.byte	110
	.byte	32
	.byte	115
	.byte	101
	.byte	114
	.byte	105
	.byte	101
	.byte	115
	.byte	32
	.byte	61
	.byte	32
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,29
	.section .ctors, "wa"
	.align 8
__init_0:
	.type	__init_0,@object
	.size	__init_0,8
	.quad	__sti__$E
	.data
	.hidden __dso_handle
# mark_proc_addr_taken __sti__$E;
# mark_proc_addr_taken _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_;
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
	.4byte 0x000000a4
	.4byte 0x00000024
	.8byte ..___tag_value_main.1
	.8byte ..___tag_value_main.60-..___tag_value_main.1
	.2byte 0x0400
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.6-..___tag_value_main.4
	.8byte 0xff800d1c380e0c10
	.8byte 0xfffffff80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.7-..___tag_value_main.6
	.8byte 0xff800d1c380e0d10
	.8byte 0xfffffff00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.8-..___tag_value_main.7
	.8byte 0xff800d1c380e0f10
	.8byte 0xffffffe80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.9-..___tag_value_main.8
	.8byte 0xff800d1c380e0310
	.8byte 0xffffffe00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.54-..___tag_value_main.9
	.2byte 0x04c3
	.4byte ..___tag_value_main.55-..___tag_value_main.54
	.2byte 0x04cf
	.4byte ..___tag_value_main.56-..___tag_value_main.55
	.2byte 0x04cd
	.4byte ..___tag_value_main.57-..___tag_value_main.56
	.2byte 0x04cc
	.4byte ..___tag_value_main.58-..___tag_value_main.57
	.8byte 0x00000000c608070c
	.byte 0x00
	.4byte 0x0000001c
	.4byte 0x000000cc
	.8byte ..___tag_value__Z7leibnizl.61
	.8byte ..___tag_value__Z7leibnizl.63-..___tag_value__Z7leibnizl.61
	.8byte 0x0000000000000000
	.4byte 0x0000001c
	.4byte 0x000000ec
	.8byte ..___tag_value__Z8leibnizXl.64
	.8byte ..___tag_value__Z8leibnizXl.66-..___tag_value__Z8leibnizXl.64
	.8byte 0x0000000000000000
	.4byte 0x0000001c
	.4byte 0x0000010c
	.8byte ..___tag_value__Z9leibnizXXl.67
	.8byte ..___tag_value__Z9leibnizXXl.69-..___tag_value__Z9leibnizXXl.67
	.8byte 0x0000000000000000
	.4byte 0x00000024
	.4byte 0x0000012c
	.8byte ..___tag_value___sti__$E.70
	.8byte ..___tag_value___sti__$E.78-..___tag_value___sti__$E.70
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.72-..___tag_value___sti__$E.70
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.77-..___tag_value___sti__$E.72
	.2byte 0x080e
	.byte 0x00
# End
