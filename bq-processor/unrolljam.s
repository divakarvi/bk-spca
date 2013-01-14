# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-O3 -DNDEBUG -prec-div -no-ftz -restrict -S";
	.file "unrolljam.cpp"
	.text
..TXTST0:
# -- Begin  main
# mark_begin;
       .align    16,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0
..___tag_value_main.1:                                          #34.11
        pushq     %rbp                                          #34.11
..___tag_value_main.3:                                          #
        movq      %rsp, %rbp                                    #34.11
..___tag_value_main.4:                                          #
        andq      $-128, %rsp                                   #34.11
        pushq     %r12                                          #34.11
..___tag_value_main.6:                                          #
        subq      $376, %rsp                                    #34.11
        xorl      %edi, %edi                                    #34.11
..___tag_value_main.7:                                          #34.11
        call      __intel_new_proc_init                         #34.11
..___tag_value_main.8:                                          #
                                # LOE rbx r12 r13 r14 r15
..B1.30:                        # Preds ..B1.1
        movl      $160, %eax                                    #38.3
        pxor      %xmm0, %xmm0                                  #38.3
        movq      %xmm0, 160(%rsp)                              #38.3
                                # LOE rax rbx r12 r13 r14 r15
..B1.28:                        # Preds ..B1.28 ..B1.30
        pxor      %xmm0, %xmm0                                  #38.3
        movaps    %xmm0, -16(%rsp,%rax)                         #38.3
        movaps    %xmm0, -32(%rsp,%rax)                         #38.3
        movaps    %xmm0, -48(%rsp,%rax)                         #38.3
        movaps    %xmm0, -64(%rsp,%rax)                         #38.3
        movaps    %xmm0, -80(%rsp,%rax)                         #38.3
        subq      $80, %rax                                     #38.3
        jne       ..B1.28       # Prob 50%                      #38.3
                                # LOE rax rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.28
        movsd     .L_2il0floatpacket.10(%rip), %xmm3            #38.3
        xorl      %eax, %eax                                    #38.3
                                # LOE rax rbx r12 r13 r14 r15 xmm3
..B1.3:                         # Preds ..B1.5 ..B1.2
        cvtsi2sd  %eax, %xmm1                                   #38.3
        mulsd     %xmm3, %xmm1                                  #38.3
        xorl      %edx, %edx                                    #38.3
        movaps    %xmm1, %xmm0                                  #38.3
        movsd     (%rsp,%rax,8), %xmm2                          #38.16
        mulsd     %xmm1, %xmm0                                  #38.3
                                # LOE rax rbx r12 r13 r14 r15 edx xmm0 xmm1 xmm2 xmm3
..B1.4:                         # Preds ..B1.4 ..B1.3
        pxor      %xmm4, %xmm4                                  #38.3
        lea       2(%rdx,%rdx), %ecx                            #38.3
        lea       3(%rdx,%rdx), %esi                            #38.3
        incl      %edx                                          #38.3
        imull     %ecx, %esi                                    #38.3
        pxor      %xmm5, %xmm5                                  #38.3
        subsd     %xmm0, %xmm5                                  #38.3
        addsd     %xmm1, %xmm2                                  #38.3
        cvtsi2sd  %esi, %xmm4                                   #38.3
        divsd     %xmm4, %xmm5                                  #38.3
        mulsd     %xmm5, %xmm1                                  #38.3
        cmpl      $20, %edx                                     #38.3
        jb        ..B1.4        # Prob 95%                      #38.3
                                # LOE rax rbx r12 r13 r14 r15 edx xmm0 xmm1 xmm2 xmm3
..B1.5:                         # Preds ..B1.4
        movsd     %xmm2, (%rsp,%rax,8)                          #38.16
        incq      %rax                                          #38.3
        cmpq      $21, %rax                                     #38.3
        jb        ..B1.3        # Prob 82%                      #38.3
                                # LOE rax rbx r12 r13 r14 r15 xmm3
..B1.6:                         # Preds ..B1.5
        movl      $2, %eax                                      #40.3
        movq      $0x100000000, %rdx                            #40.3
        movd      %eax, %xmm0                                   #40.3
        movd      %rdx, %xmm1                                   #40.3
        pshufd    $0, %xmm0, %xmm2                              #40.3
        xorl      %eax, %eax                                    #40.3
        movaps    .L_2il0floatpacket.11(%rip), %xmm0            #39.13
                                # LOE rax rbx r12 r13 r14 r15 xmm0 xmm1 xmm2
..B1.7:                         # Preds ..B1.7 ..B1.6
        cvtdq2pd  %xmm1, %xmm3                                  #41.16
        paddd     %xmm2, %xmm1                                  #41.5
        cvtdq2pd  %xmm1, %xmm4                                  #41.16
        mulpd     %xmm0, %xmm3                                  #41.18
        mulpd     %xmm0, %xmm4                                  #41.18
        movaps    %xmm3, 176(%rsp,%rax,8)                       #41.5
        paddd     %xmm2, %xmm1                                  #41.5
        movaps    %xmm4, 192(%rsp,%rax,8)                       #41.5
        addq      $4, %rax                                      #40.3
        cmpq      $20, %rax                                     #40.3
        jb        ..B1.7        # Prob 95%                      #40.3
                                # LOE rax rbx r12 r13 r14 r15 xmm0 xmm1 xmm2
..B1.8:                         # Preds ..B1.7
        movq      $0x3ff921fb54442d18, %rax                     #41.18
        movq      %rax, 336(%rsp)                               #41.5
        xorl      %eax, %eax                                    #42.3
        movq      %rax, %r12                                    #42.3
                                # LOE rbx r12 r13 r14 r15
..B1.9:                         # Preds ..B1.11 ..B1.8
        cvtsi2sd  %r12d, %xmm0                                  #43.19
        mulsd     .L_2il0floatpacket.10(%rip), %xmm0            #43.19
        call      sin                                           #43.19
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.32:                        # Preds ..B1.9
        movsd     (%rsp,%r12,8), %xmm1                          #43.9
        movl      $_ZSt4cout, %edi                              #43.9
        subsd     %xmm0, %xmm1                                  #43.9
        movaps    %xmm1, %xmm0                                  #43.9
..___tag_value_main.9:                                          #43.9
        call      _ZNSolsEd                                     #43.9
..___tag_value_main.10:                                         #
                                # LOE rax rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.32
        movq      %rax, %rdi                                    #43.28
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #43.28
..___tag_value_main.11:                                         #43.28
        call      _ZNSolsEPFRSoS_E                              #43.28
..___tag_value_main.12:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.10
        incq      %r12                                          #42.3
        cmpq      $21, %r12                                     #42.3
        jb        ..B1.9        # Prob 95%                      #42.3
                                # LOE rbx r12 r13 r14 r15
..B1.12:                        # Preds ..B1.11
        movl      $_ZSt4cout, %edi                              #44.7
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #44.7
..___tag_value_main.13:                                         #44.7
        call      _ZNSolsEPFRSoS_E                              #44.7
..___tag_value_main.14:                                         #
                                # LOE rax rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.12
        movq      %rax, %rdi                                    #44.13
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #44.13
..___tag_value_main.15:                                         #44.13
        call      _ZNSolsEPFRSoS_E                              #44.13
..___tag_value_main.16:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.14:                        # Preds ..B1.13
        movl      $160, %eax                                    #45.3
        pxor      %xmm0, %xmm0                                  #45.3
        movq      %xmm0, 160(%rsp)                              #45.3
                                # LOE rax rbx r12 r13 r14 r15
..B1.29:                        # Preds ..B1.29 ..B1.14
        pxor      %xmm0, %xmm0                                  #45.3
        movaps    %xmm0, -16(%rsp,%rax)                         #45.3
        movaps    %xmm0, -32(%rsp,%rax)                         #45.3
        movaps    %xmm0, -48(%rsp,%rax)                         #45.3
        movaps    %xmm0, -64(%rsp,%rax)                         #45.3
        movaps    %xmm0, -80(%rsp,%rax)                         #45.3
        subq      $80, %rax                                     #45.3
        jne       ..B1.29       # Prob 50%                      #45.3
                                # LOE rax rbx r12 r13 r14 r15
..B1.15:                        # Preds ..B1.29
        xorl      %eax, %eax                                    #45.3
                                # LOE rax rbx r12 r13 r14 r15
..B1.16:                        # Preds ..B1.18 ..B1.15
        movsd     176(%rsp,%rax,8), %xmm1                       #45.16
        xorl      %edx, %edx                                    #45.3
        movhpd    184(%rsp,%rax,8), %xmm1                       #45.16
        movsd     (%rsp,%rax,8), %xmm2                          #45.23
        movaps    %xmm1, %xmm0                                  #45.16
        movhpd    8(%rsp,%rax,8), %xmm2                         #45.23
                                # LOE rax rbx r12 r13 r14 r15 edx xmm0 xmm1 xmm2
..B1.17:                        # Preds ..B1.17 ..B1.16
        pxor      %xmm3, %xmm3                                  #45.3
        lea       2(%rdx,%rdx), %ecx                            #45.3
        pxor      %xmm4, %xmm4                                  #45.3
        lea       3(%rdx,%rdx), %esi                            #45.3
        subpd     %xmm0, %xmm4                                  #45.3
        addpd     %xmm1, %xmm2                                  #45.3
        imull     %ecx, %esi                                    #45.3
        mulpd     %xmm0, %xmm4                                  #45.3
        cvtsi2sd  %esi, %xmm3                                   #45.3
        incl      %edx                                          #45.3
        unpcklpd  %xmm3, %xmm3                                  #45.3
        cmpl      $20, %edx                                     #45.3
        divpd     %xmm3, %xmm4                                  #45.3
        mulpd     %xmm4, %xmm1                                  #45.3
        jb        ..B1.17       # Prob 95%                      #45.3
                                # LOE rax rbx r12 r13 r14 r15 edx xmm0 xmm1 xmm2
..B1.18:                        # Preds ..B1.17
        movsd     %xmm2, (%rsp,%rax,8)                          #45.23
        movhpd    %xmm2, 8(%rsp,%rax,8)                         #45.23
        addq      $2, %rax                                      #45.3
        cmpq      $20, %rax                                     #45.3
        jb        ..B1.16       # Prob 82%                      #45.3
                                # LOE rax rbx r12 r13 r14 r15
..B1.19:                        # Preds ..B1.18
        movsd     336(%rsp), %xmm1                              #45.16
        xorl      %eax, %eax                                    #45.3
        movaps    %xmm1, %xmm0                                  #45.3
        movsd     160(%rsp), %xmm2                              #45.23
        mulsd     %xmm1, %xmm0                                  #45.3
                                # LOE rbx r12 r13 r14 r15 eax xmm0 xmm1 xmm2
..B1.20:                        # Preds ..B1.20 ..B1.19
        pxor      %xmm3, %xmm3                                  #45.3
        lea       2(%rax,%rax), %edx                            #45.3
        lea       3(%rax,%rax), %ecx                            #45.3
        incl      %eax                                          #45.3
        imull     %edx, %ecx                                    #45.3
        pxor      %xmm4, %xmm4                                  #45.3
        subsd     %xmm0, %xmm4                                  #45.3
        addsd     %xmm1, %xmm2                                  #45.3
        cvtsi2sd  %ecx, %xmm3                                   #45.3
        divsd     %xmm3, %xmm4                                  #45.3
        mulsd     %xmm4, %xmm1                                  #45.3
        cmpl      $20, %eax                                     #45.3
        jb        ..B1.20       # Prob 95%                      #45.3
                                # LOE rbx r12 r13 r14 r15 eax xmm0 xmm1 xmm2
..B1.21:                        # Preds ..B1.20
        xorl      %eax, %eax                                    #46.3
        movsd     %xmm2, 160(%rsp)                              #45.23
        movq      %rax, %r12                                    #46.3
                                # LOE rbx r12 r13 r14 r15
..B1.22:                        # Preds ..B1.24 ..B1.21
        cvtsi2sd  %r12d, %xmm0                                  #47.19
        mulsd     .L_2il0floatpacket.10(%rip), %xmm0            #47.19
        call      sin                                           #47.19
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.35:                        # Preds ..B1.22
        movsd     (%rsp,%r12,8), %xmm1                          #47.9
        movl      $_ZSt4cout, %edi                              #47.9
        subsd     %xmm0, %xmm1                                  #47.9
        movaps    %xmm1, %xmm0                                  #47.9
..___tag_value_main.17:                                         #47.9
        call      _ZNSolsEd                                     #47.9
..___tag_value_main.18:                                         #
                                # LOE rax rbx r12 r13 r14 r15
..B1.23:                        # Preds ..B1.35
        movq      %rax, %rdi                                    #47.28
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #47.28
..___tag_value_main.19:                                         #47.28
        call      _ZNSolsEPFRSoS_E                              #47.28
..___tag_value_main.20:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.24:                        # Preds ..B1.23
        incq      %r12                                          #46.3
        cmpq      $21, %r12                                     #46.3
        jb        ..B1.22       # Prob 95%                      #46.3
                                # LOE rbx r12 r13 r14 r15
..B1.25:                        # Preds ..B1.24
        xorl      %eax, %eax                                    #48.1
        addq      $376, %rsp                                    #48.1
..___tag_value_main.21:                                         #48.1
        popq      %r12                                          #48.1
        movq      %rbp, %rsp                                    #48.1
        popq      %rbp                                          #48.1
..___tag_value_main.22:                                         #
        ret                                                     #48.1
        .align    16,0x90
..___tag_value_main.24:                                         #
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.data
# -- End  main
	.text
# -- Begin  _Z9sinetableiPd
# mark_begin;
       .align    16,0x90
	.globl _Z9sinetableiPd
_Z9sinetableiPd:
# parameter 1: %edi
# parameter 2: %rsi
..B2.1:                         # Preds ..B2.0
..___tag_value__Z9sinetableiPd.25:                              #9.45
        lea       15(%rsi), %rcx                                #13.5
        andq      $-16, %rcx                                    #13.5
        xorl      %edx, %edx                                    #13.5
        pxor      %xmm0, %xmm0                                  #13.5
        movl      $128, %eax                                    #13.5
        movq      %xmm0, (%rsi)                                 #13.5
        movl      %edx, 8(%rsi)                                 #13.5
        movw      %dx, 12(%rsi)                                 #13.5
        movb      %dl, 14(%rsi)                                 #13.5
        movq      %xmm0, 144(%rsi)                              #13.5
        movq      %xmm0, 152(%rsi)                              #13.5
        movq      %xmm0, 160(%rsi)                              #13.5
        movaps    %xmm0, 128(%rcx)                              #13.5
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 edx xmm0
..B2.9:                         # Preds ..B2.9 ..B2.1
        movaps    %xmm0, -16(%rcx,%rax)                         #13.5
        movaps    %xmm0, -32(%rcx,%rax)                         #13.5
        movaps    %xmm0, -48(%rcx,%rax)                         #13.5
        movaps    %xmm0, -64(%rcx,%rax)                         #13.5
        subq      $64, %rax                                     #13.5
        jne       ..B2.9        # Prob 50%                      #13.5
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 edx xmm0
..B2.2:                         # Preds ..B2.9
        movsd     .L_2il0floatpacket.15(%rip), %xmm0            #10.41
        xorl      %eax, %eax                                    #11.3
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 edx xmm0
..B2.3:                         # Preds ..B2.5 ..B2.2
        cvtsi2sd  %eax, %xmm2                                   #12.17
        mulsd     %xmm0, %xmm2                                  #12.19
        movl      %edx, %ecx                                    #15.5
        movaps    %xmm2, %xmm1                                  #17.16
        movsd     (%rsi,%rax,8), %xmm3                          #9.6
        mulsd     %xmm2, %xmm1                                  #17.16
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 edx ecx xmm0 xmm1 xmm2 xmm3
..B2.4:                         # Preds ..B2.4 ..B2.3
        pxor      %xmm4, %xmm4                                  #17.32
        lea       2(%rcx,%rcx), %edi                            #17.32
        lea       3(%rcx,%rcx), %r8d                            #17.24
        incl      %ecx                                          #15.5
        imull     %edi, %r8d                                    #17.32
        pxor      %xmm5, %xmm5                                  #17.16
        subsd     %xmm1, %xmm5                                  #17.16
        addsd     %xmm2, %xmm3                                  #16.7
        cvtsi2sd  %r8d, %xmm4                                   #17.32
        divsd     %xmm4, %xmm5                                  #17.32
        mulsd     %xmm5, %xmm2                                  #17.7
        cmpl      $20, %ecx                                     #15.5
        jb        ..B2.4        # Prob 95%                      #15.5
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 edx ecx xmm0 xmm1 xmm2 xmm3
..B2.5:                         # Preds ..B2.4
        movsd     %xmm3, (%rsi,%rax,8)                          #9.6
        incq      %rax                                          #11.3
        cmpq      $21, %rax                                     #11.3
        jb        ..B2.3        # Prob 82%                      #11.3
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 edx xmm0
..B2.6:                         # Preds ..B2.5
        ret                                                     #20.1
        .align    16,0x90
..___tag_value__Z9sinetableiPd.27:                              #
                                # LOE
# mark_end;
	.type	_Z9sinetableiPd,@function
	.size	_Z9sinetableiPd,.-_Z9sinetableiPd
	.data
# -- End  _Z9sinetableiPd
	.text
# -- Begin  _Z9sinetableiPdS_
# mark_begin;
       .align    16,0x90
	.globl _Z9sinetableiPdS_
_Z9sinetableiPdS_:
# parameter 1: %edi
# parameter 2: %rsi
# parameter 3: %rdx
..B3.1:                         # Preds ..B3.0
..___tag_value__Z9sinetableiPdS_.28:                            #22.69
        lea       15(%rdx), %rdi                                #24.5
        andq      $-16, %rdi                                    #24.5
        xorl      %ecx, %ecx                                    #24.5
        pxor      %xmm0, %xmm0                                  #24.5
        movl      $128, %eax                                    #24.5
        movq      %xmm0, (%rdx)                                 #24.5
        movl      %ecx, 8(%rdx)                                 #24.5
        movw      %cx, 12(%rdx)                                 #24.5
        movb      %cl, 14(%rdx)                                 #24.5
        movq      %xmm0, 144(%rdx)                              #24.5
        movq      %xmm0, 152(%rdx)                              #24.5
        movq      %xmm0, 160(%rdx)                              #24.5
        movaps    %xmm0, 128(%rdi)                              #24.5
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx xmm0
..B3.11:                        # Preds ..B3.11 ..B3.1
        movaps    %xmm0, -16(%rdi,%rax)                         #24.5
        movaps    %xmm0, -32(%rdi,%rax)                         #24.5
        movaps    %xmm0, -48(%rdi,%rax)                         #24.5
        movaps    %xmm0, -64(%rdi,%rax)                         #24.5
        subq      $64, %rax                                     #24.5
        jne       ..B3.11       # Prob 50%                      #24.5
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15 ecx xmm0
..B3.2:                         # Preds ..B3.11
        xorl      %eax, %eax                                    #23.3
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx
..B3.3:                         # Preds ..B3.5 ..B3.2
        movsd     (%rsi,%rax,8), %xmm1                          #22.6
        movl      %ecx, %edi                                    #26.5
        movhpd    8(%rsi,%rax,8), %xmm1                         #22.6
        movsd     (%rdx,%rax,8), %xmm2                          #22.6
        movaps    %xmm1, %xmm0                                  #22.6
        movhpd    8(%rdx,%rax,8), %xmm2                         #22.6
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0 xmm1 xmm2
..B3.4:                         # Preds ..B3.4 ..B3.3
        pxor      %xmm3, %xmm3                                  #28.46
        lea       2(%rdi,%rdi), %r8d                            #28.46
        pxor      %xmm4, %xmm4                                  #28.23
        lea       3(%rdi,%rdi), %r9d                            #28.46
        subpd     %xmm0, %xmm4                                  #28.23
        addpd     %xmm1, %xmm2                                  #27.7
        imull     %r8d, %r9d                                    #28.46
        mulpd     %xmm0, %xmm4                                  #28.23
        cvtsi2sd  %r9d, %xmm3                                   #28.46
        incl      %edi                                          #26.5
        unpcklpd  %xmm3, %xmm3                                  #28.46
        cmpl      $20, %edi                                     #26.5
        divpd     %xmm3, %xmm4                                  #28.46
        mulpd     %xmm4, %xmm1                                  #28.7
        jb        ..B3.4        # Prob 95%                      #26.5
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx edi xmm0 xmm1 xmm2
..B3.5:                         # Preds ..B3.4
        movsd     %xmm2, (%rdx,%rax,8)                          #22.6
        movhpd    %xmm2, 8(%rdx,%rax,8)                         #22.6
        addq      $2, %rax                                      #23.3
        cmpq      $20, %rax                                     #23.3
        jb        ..B3.3        # Prob 82%                      #23.3
                                # LOE rax rdx rbx rbp rsi r12 r13 r14 r15 ecx
..B3.6:                         # Preds ..B3.5
        movsd     160(%rsi), %xmm1                              #22.6
        movaps    %xmm1, %xmm0                                  #28.23
        mulsd     %xmm1, %xmm0                                  #28.23
        movsd     160(%rdx), %xmm2                              #22.6
                                # LOE rdx rbx rbp r12 r13 r14 r15 ecx xmm0 xmm1 xmm2
..B3.7:                         # Preds ..B3.7 ..B3.6
        pxor      %xmm3, %xmm3                                  #28.46
        lea       2(%rcx,%rcx), %eax                            #28.46
        lea       3(%rcx,%rcx), %esi                            #28.38
        incl      %ecx                                          #26.5
        imull     %eax, %esi                                    #28.46
        pxor      %xmm4, %xmm4                                  #28.23
        subsd     %xmm0, %xmm4                                  #28.23
        addsd     %xmm1, %xmm2                                  #27.7
        cvtsi2sd  %esi, %xmm3                                   #28.46
        divsd     %xmm3, %xmm4                                  #28.46
        mulsd     %xmm4, %xmm1                                  #28.7
        cmpl      $20, %ecx                                     #26.5
        jb        ..B3.7        # Prob 95%                      #26.5
                                # LOE rdx rbx rbp r12 r13 r14 r15 ecx xmm0 xmm1 xmm2
..B3.8:                         # Preds ..B3.7
        movsd     %xmm2, 160(%rdx)                              #22.6
        ret                                                     #31.1
        .align    16,0x90
..___tag_value__Z9sinetableiPdS_.30:                            #
                                # LOE
# mark_end;
	.type	_Z9sinetableiPdS_,@function
	.size	_Z9sinetableiPdS_,.-_Z9sinetableiPdS_
	.data
# -- End  _Z9sinetableiPdS_
	.text
# -- Begin  __sti__$E
# mark_begin;
       .align    16,0x90
__sti__$E:
..B4.1:                         # Preds ..B4.0
..___tag_value___sti__$E.31:                                    #
        pushq     %rsi                                          #
..___tag_value___sti__$E.33:                                    #
        movl      $_ZSt8__ioinit, %edi                          #72.25
..___tag_value___sti__$E.34:                                    #72.25
        call      _ZNSt8ios_base4InitC1Ev                       #72.25
..___tag_value___sti__$E.35:                                    #
                                # LOE rbx rbp r12 r13 r14 r15
..B4.2:                         # Preds ..B4.1
        movl      $_ZNSt8ios_base4InitD1Ev, %edi                #72.25
        movl      $_ZSt8__ioinit, %esi                          #72.25
        movl      $__dso_handle, %edx                           #72.25
        xorl      %eax, %eax                                    #72.25
..___tag_value___sti__$E.36:                                    #72.25
        call      __cxa_atexit                                  #72.25
..___tag_value___sti__$E.37:                                    #
                                # LOE rbx rbp r12 r13 r14 r15
..B4.3:                         # Preds ..B4.2
        popq      %rcx                                          #72.25
..___tag_value___sti__$E.38:                                    #
        ret                                                     #72.25
        .align    16,0x90
..___tag_value___sti__$E.39:                                    #
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
.L_2il0floatpacket.11:
	.long	0x769cf0e0,0x3fb41b2f,0x769cf0e0,0x3fb41b2f
	.type	.L_2il0floatpacket.11,@object
	.size	.L_2il0floatpacket.11,16
	.align 8
.L_2il0floatpacket.10:
	.long	0x769cf0e0,0x3fb41b2f
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,8
	.align 8
.L_2il0floatpacket.12:
	.long	0x54442d18,0x3ff921fb
	.type	.L_2il0floatpacket.12,@object
	.size	.L_2il0floatpacket.12,8
	.align 8
.L_2il0floatpacket.15:
	.long	0x769cf0e0,0x3fb41b2f
	.type	.L_2il0floatpacket.15,@object
	.size	.L_2il0floatpacket.15,8
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
	.4byte 0x0000004c
	.4byte 0x00000024
	.8byte ..___tag_value_main.1
	.8byte ..___tag_value_main.24-..___tag_value_main.1
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
	.4byte ..___tag_value_main.21-..___tag_value_main.6
	.2byte 0x04cc
	.4byte ..___tag_value_main.22-..___tag_value_main.21
	.4byte 0xc608070c
	.byte 0x00
	.4byte 0x0000001c
	.4byte 0x00000074
	.8byte ..___tag_value__Z9sinetableiPd.25
	.8byte ..___tag_value__Z9sinetableiPd.27-..___tag_value__Z9sinetableiPd.25
	.8byte 0x0000000000000000
	.4byte 0x0000001c
	.4byte 0x00000094
	.8byte ..___tag_value__Z9sinetableiPdS_.28
	.8byte ..___tag_value__Z9sinetableiPdS_.30-..___tag_value__Z9sinetableiPdS_.28
	.8byte 0x0000000000000000
	.4byte 0x00000024
	.4byte 0x000000b4
	.8byte ..___tag_value___sti__$E.31
	.8byte ..___tag_value___sti__$E.39-..___tag_value___sti__$E.31
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.33-..___tag_value___sti__$E.31
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.38-..___tag_value___sti__$E.33
	.2byte 0x080e
	.byte 0x00
# End
