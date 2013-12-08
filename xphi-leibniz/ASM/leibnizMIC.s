# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) MIC Architecture, Version 13.1.0.1";
# mark_description "46 Beta Build 20130121";
# mark_description " -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP -fno-verbose-asm -S";
	.file "leibniz.cpp"
	.text
..TXTST0:
# -- Begin  _Z8leibniz1v, __offload_entry_leibniz_cpp_18_Z8leibniz1v, __offload_entry_leibniz_cpp_22_Z8leibniz1v, __offload_entry_leibniz_cpp_25_Z8leibniz1v, __offload_entry_leibniz_cpp_32_Z8leibniz1v
# mark_begin;
# Threads 4
        .align    16,0x90
__offload_entry_leibniz_cpp_32_Z8leibniz1v:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0 Latency 21
..___tag_value__Z8leibniz1v.1:                                  #32.1
        pushq     %rbp                                          #32.1
..___tag_value__Z8leibniz1v.3:                                  #
        movq      %rsp, %rbp                                    #32.1
..___tag_value__Z8leibniz1v.4:                                  #
        andq      $-64, %rsp                                    #32.1
        subq      $384, %rsp                                    #32.1 c1
        lea       .2.7_2__offload_var_desc1_p.114(%rip), %rsi   #32.1 c1
        movq      %r14, 360(%rsp)                               #32.1 c5
..___tag_value__Z8leibniz1v.6:                                  #
        lea       (%rsp), %r14                                  #32.1 c5
        movq      %r13, 368(%rsp)                               #32.1 c9
..___tag_value__Z8leibniz1v.7:                                  #
        movq      %rdi, %r13                                    #32.1 c9
        movq      %r14, %rdi                                    #32.1 c13
        movl      $192, %edx                                    #32.1 c13
        movq      %r15, 352(%rsp)                               #32.1 c17
        call      _intel_fast_memcpy@PLT                        #32.1 c21
..___tag_value__Z8leibniz1v.8:                                  #
                                # LOE rbx r12 r13 r14
..B1.23:                        # Preds ..B1.1 Latency 49
        lea       192(%rsp), %rcx                               #32.1 c1
        movq      40+.2.7_2__offload_var_desc2_p.119(%rip), %rax #32.1 c1
        lea       320(%rsp), %rdx                               #32.1 c5
        lea       240(%rsp), %rsi                               #32.1 c5
        lea       328(%rsp), %rdi                               #32.1 c9
        movq      .2.7_2__offload_var_desc2_p.119(%rip), %r8    #32.1 c9
        movq      8+.2.7_2__offload_var_desc2_p.119(%rip), %r9  #32.1 c13
        movq      16+.2.7_2__offload_var_desc2_p.119(%rip), %r10 #32.1 c13
        movq      24+.2.7_2__offload_var_desc2_p.119(%rip), %r11 #32.1 c17
        movq      32+.2.7_2__offload_var_desc2_p.119(%rip), %r15 #32.1 c17
        movq      %rax, 40(%rcx)                                #32.1 c21
        xorl      %eax, %eax                                    #32.1 c21
        movq      %rdx, 56(%r14)                                #32.1 c25
        movq      %r14, %rdx                                    #32.1 c25
        movq      %rsi, 120(%rsp)                               #32.1 c29
        movl      $3, %esi                                      #32.1 c29
        movq      %rdi, 184(%rsp)                               #32.1 c33
        movq      %r13, %rdi                                    #32.1 c33
        movq      %r8, (%rcx)                                   #32.1 c37
        movq      %r9, 8(%rcx)                                  #32.1 c37
        movq      %r10, 16(%rcx)                                #32.1 c41
        movq      %r11, 24(%rcx)                                #32.1 c41
        movq      %r15, 32(%rcx)                                #32.1 c45
..___tag_value__Z8leibniz1v.9:                                  #32.1
        call      __offload_target_enter@PLT                    #32.1
..___tag_value__Z8leibniz1v.10:                                 #
                                # LOE rbx r12 r13
..B1.2:                         # Preds ..B1.23 Latency 9
        movq      320(%rsp), %r15                               #32.1 c1
        movq      328(%rsp), %r14                               #32.1 c1
        movq      %r15, %rdi                                    #34.8 c5
        movq      %r14, %rsi                                    #34.8 c5
..___tag_value__Z8leibniz1v.11:                                 #34.8
        call      _Z7mic_sumPdl@PLT                             #34.8
..___tag_value__Z8leibniz1v.12:                                 #
                                # LOE rbx r12 r13 r14 r15 zmm0
..B1.3:                         # Preds ..B1.2 Latency 21
        movl      $1, %eax                                      #32.1 c1
        movq      %r13, %rdi                                    #32.1 c1
        kmov      %eax, %k1                                     #32.1 c5
        xorl      %eax, %eax                                    #32.1 c5
        movq      %r14, 328(%rsp)                               #32.1 c9
        movb      %al, %al                                      #32.1 c9
        vpackstorelpd %zmm0, 240(%rsp){%k1}                     #32.1 c13
        movb      %dl, %dl                                      #32.1 c13
        movq      %r15, 320(%rsp)                               #32.1 c17
..___tag_value__Z8leibniz1v.13:                                 #32.1
        call      __offload_target_leave@PLT                    #32.1
..___tag_value__Z8leibniz1v.14:                                 #
                                # LOE rbx r12
..B1.4:                         # Preds ..B1.3 Latency 9
        movq      368(%rsp), %r13                               #32.1 c1
..___tag_value__Z8leibniz1v.15:                                 #
        movq      360(%rsp), %r14                               #32.1 c1
..___tag_value__Z8leibniz1v.16:                                 #
        movq      352(%rsp), %r15                               #32.1 c5
..___tag_value__Z8leibniz1v.17:                                 #
        movq      %rbp, %rsp                                    #32.1 c9
        popq      %rbp                                          #32.1
..___tag_value__Z8leibniz1v.18:                                 #
        ret                                                     #32.1
..___tag_value__Z8leibniz1v.20:                                 #
                                # LOE
	.type	__offload_entry_leibniz_cpp_32_Z8leibniz1v,@function
	.size	__offload_entry_leibniz_cpp_32_Z8leibniz1v,.-__offload_entry_leibniz_cpp_32_Z8leibniz1v
__offload_entry_leibniz_cpp_25_Z8leibniz1v:
# parameter 1: %rdi
..B1.5:                         # Preds ..B1.0 Latency 21
        pushq     %rbp                                          #25.1
..___tag_value__Z8leibniz1v.22:                                 #
        movq      %rsp, %rbp                                    #25.1
..___tag_value__Z8leibniz1v.23:                                 #
        andq      $-64, %rsp                                    #25.1
        subq      $384, %rsp                                    #25.1 c1
        lea       .2.7_2__offload_var_desc1_p.89(%rip), %rsi    #25.1 c1
        movq      %r12, 344(%rsp)                               #25.1 c5
..___tag_value__Z8leibniz1v.25:                                 #
        lea       (%rsp), %r12                                  #25.1 c5
        movq      %rbx, 336(%rsp)                               #25.1 c9
..___tag_value__Z8leibniz1v.26:                                 #
        movq      %rdi, %rbx                                    #25.1 c9
        movq      %r12, %rdi                                    #25.1 c13
        movl      $192, %edx                                    #25.1 c13
        movq      %r15, 352(%rsp)                               #25.1 c17
        call      _intel_fast_memcpy@PLT                        #25.1 c21
..___tag_value__Z8leibniz1v.27:                                 #
                                # LOE rbx r12 r13 r14
..B1.25:                        # Preds ..B1.5 Latency 45
        lea       192(%rsp), %rcx                               #25.1 c1
        movq      40+.2.7_2__offload_var_desc2_p.94(%rip), %rax #25.1 c1
        lea       320(%rsp), %rdx                               #25.1 c5
        lea       328(%rsp), %rsi                               #25.1 c5
        movq      .2.7_2__offload_var_desc2_p.94(%rip), %r8     #25.1 c9
        movq      8+.2.7_2__offload_var_desc2_p.94(%rip), %r9   #25.1 c9
        movq      16+.2.7_2__offload_var_desc2_p.94(%rip), %r10 #25.1 c13
        movq      24+.2.7_2__offload_var_desc2_p.94(%rip), %r11 #25.1 c13
        movq      32+.2.7_2__offload_var_desc2_p.94(%rip), %r15 #25.1 c17
        movq      %rax, 40(%rcx)                                #25.1 c17
        movq      %rdx, 56(%r12)                                #25.1 c21
        movq      %rbx, %rdi                                    #25.1 c21
        movq      %rdx, 120(%rsp)                               #25.1 c25
        movq      %r12, %rdx                                    #25.1 c25
        movq      %rsi, 184(%rsp)                               #25.1 c29
        movl      $3, %esi                                      #25.1 c29
        xorl      %eax, %eax                                    #25.1 c33
        movq      %r8, (%rcx)                                   #25.1 c33
        movq      %r9, 8(%rcx)                                  #25.1 c37
        movq      %r10, 16(%rcx)                                #25.1 c37
        movq      %r11, 24(%rcx)                                #25.1 c41
        movq      %r15, 32(%rcx)                                #25.1 c41
..___tag_value__Z8leibniz1v.28:                                 #25.1
        call      __offload_target_enter@PLT                    #25.1
..___tag_value__Z8leibniz1v.29:                                 #
                                # LOE rbx r13 r14
..B1.6:                         # Preds ..B1.25 Latency 9
        movq      320(%rsp), %r15                               #25.1 c1
        movq      328(%rsp), %r12                               #25.1 c1
        movq      %r15, %rdi                                    #27.2 c5
        movq      %r12, %rsi                                    #27.2 c5
..___tag_value__Z8leibniz1v.30:                                 #27.2
        call      _Z13hostmic_scalePdl@PLT                      #27.2
..___tag_value__Z8leibniz1v.31:                                 #
                                # LOE rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6 Latency 9
        movq      %rbx, %rdi                                    #25.1 c1
        xorl      %eax, %eax                                    #25.1 c1
        movq      %r12, 328(%rsp)                               #25.1 c5
        movq      %r15, 320(%rsp)                               #25.1 c5
..___tag_value__Z8leibniz1v.32:                                 #25.1
        call      __offload_target_leave@PLT                    #25.1
..___tag_value__Z8leibniz1v.33:                                 #
                                # LOE r13 r14
..B1.8:                         # Preds ..B1.7 Latency 9
        movq      336(%rsp), %rbx                               #25.1 c1
..___tag_value__Z8leibniz1v.34:                                 #
        movq      344(%rsp), %r12                               #25.1 c1
..___tag_value__Z8leibniz1v.35:                                 #
        movq      352(%rsp), %r15                               #25.1 c5
..___tag_value__Z8leibniz1v.36:                                 #
        movq      %rbp, %rsp                                    #25.1 c9
        popq      %rbp                                          #25.1
..___tag_value__Z8leibniz1v.37:                                 #
        ret                                                     #25.1
..___tag_value__Z8leibniz1v.39:                                 #
                                # LOE
	.type	__offload_entry_leibniz_cpp_25_Z8leibniz1v,@function
	.size	__offload_entry_leibniz_cpp_25_Z8leibniz1v,.-__offload_entry_leibniz_cpp_25_Z8leibniz1v
__offload_entry_leibniz_cpp_22_Z8leibniz1v:
# parameter 1: %rdi
..B1.9:                         # Preds ..B1.0 Latency 21
        pushq     %rbp                                          #22.1
..___tag_value__Z8leibniz1v.41:                                 #
        movq      %rsp, %rbp                                    #22.1
..___tag_value__Z8leibniz1v.42:                                 #
        andq      $-64, %rsp                                    #22.1
        subq      $384, %rsp                                    #22.1 c1
        lea       .2.7_2__offload_var_desc1_p.65(%rip), %rsi    #22.1 c1
        movq      %r13, 368(%rsp)                               #22.1 c5
..___tag_value__Z8leibniz1v.44:                                 #
        lea       (%rsp), %r13                                  #22.1 c5
        movq      %r14, 360(%rsp)                               #22.1 c9
..___tag_value__Z8leibniz1v.45:                                 #
        movq      %rdi, %r14                                    #22.1 c9
        movq      %r13, %rdi                                    #22.1 c13
        movl      $256, %edx                                    #22.1 c13
        movq      %r15, 352(%rsp)                               #22.1 c17
        call      _intel_fast_memcpy@PLT                        #22.1 c21
..___tag_value__Z8leibniz1v.46:                                 #
                                # LOE rbx r12 r13 r14
..B1.26:                        # Preds ..B1.9 Latency 1
        lea       256(%rsp), %rcx                               #22.1 c1
        movl      $64, %r9d                                     #22.1 c1
                                # LOE rcx rbx r9 r12 r13 r14
..B1.20:                        # Preds ..B1.20 ..B1.26 Latency 21
        lea       .2.7_2__offload_var_desc2_p.70(%rip), %rdi    #22.1 c1
        movq      -8(%r9,%rdi), %rax                            #22.1 c5
        movq      -16(%r9,%rdi), %rdx                           #22.1 c5
        movq      -24(%r9,%rdi), %rsi                           #22.1 c9
        movq      -32(%r9,%rdi), %r8                            #22.1 c9
        movq      %rax, -8(%rcx,%r9)                            #22.1 c13
        movq      %rdx, -16(%rcx,%r9)                           #22.1 c13
        movq      %rsi, -24(%rcx,%r9)                           #22.1 c17
        movq      %r8, -32(%rcx,%r9)                            #22.1 c17
        subq      $32, %r9                                      #22.1 c21
        jne       ..B1.20       # Prob 50%                      #22.1 c21
                                # LOE rcx rbx r9 r12 r13 r14
..B1.19:                        # Preds ..B1.20 Latency 25
        lea       320(%rsp), %r8                                #22.1 c1
        lea       328(%rsp), %r9                                #22.1 c1
        movq      %r14, %rdi                                    #22.1 c5
        movl      $4, %esi                                      #22.1 c5
        movq      %r13, %rdx                                    #22.1 c9
        xorl      %eax, %eax                                    #22.1 c9
        movq      %r8, 56(%r13)                                 #22.1 c13
        movq      %r8, 120(%rsp)                                #22.1 c13
        movq      %r8, 184(%rsp)                                #22.1 c17
        movb      %bl, %bl                                      #22.1 c17
        movq      %r9, 248(%rsp)                                #22.1 c21
..___tag_value__Z8leibniz1v.47:                                 #22.1
        call      __offload_target_enter@PLT                    #22.1
..___tag_value__Z8leibniz1v.48:                                 #
                                # LOE rbx r12 r14
..B1.10:                        # Preds ..B1.19 Latency 9
        movq      320(%rsp), %r15                               #22.1 c1
        movq      328(%rsp), %r13                               #22.1 c1
        movq      %r15, %rdi                                    #23.2 c5
        movq      %r13, %rsi                                    #23.2 c5
..___tag_value__Z8leibniz1v.49:                                 #23.2
        call      _Z13hostmic_scalePdl@PLT                      #23.2
..___tag_value__Z8leibniz1v.50:                                 #
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.10 Latency 9
        movq      %r14, %rdi                                    #22.1 c1
        xorl      %eax, %eax                                    #22.1 c1
        movq      %r13, 328(%rsp)                               #22.1 c5
        movq      %r15, 320(%rsp)                               #22.1 c5
..___tag_value__Z8leibniz1v.51:                                 #22.1
        call      __offload_target_leave@PLT                    #22.1
..___tag_value__Z8leibniz1v.52:                                 #
                                # LOE rbx r12
..B1.12:                        # Preds ..B1.11 Latency 9
        movq      368(%rsp), %r13                               #22.1 c1
..___tag_value__Z8leibniz1v.53:                                 #
        movq      360(%rsp), %r14                               #22.1 c1
..___tag_value__Z8leibniz1v.54:                                 #
        movq      352(%rsp), %r15                               #22.1 c5
..___tag_value__Z8leibniz1v.55:                                 #
        movq      %rbp, %rsp                                    #22.1 c9
        popq      %rbp                                          #22.1
..___tag_value__Z8leibniz1v.56:                                 #
        ret                                                     #22.1
..___tag_value__Z8leibniz1v.58:                                 #
                                # LOE
	.type	__offload_entry_leibniz_cpp_22_Z8leibniz1v,@function
	.size	__offload_entry_leibniz_cpp_22_Z8leibniz1v,.-__offload_entry_leibniz_cpp_22_Z8leibniz1v
__offload_entry_leibniz_cpp_18_Z8leibniz1v:
# parameter 1: %rdi
..B1.13:                        # Preds ..B1.0 Latency 9
        pushq     %rbp                                          #18.1
..___tag_value__Z8leibniz1v.60:                                 #
        movq      %rsp, %rbp                                    #18.1
..___tag_value__Z8leibniz1v.61:                                 #
        andq      $-64, %rsp                                    #18.1
        subq      $384, %rsp                                    #18.1 c1
        movl      $128, %r9d                                    #18.1 c1
        movq      %r12, 344(%rsp)                               #18.1 c5
..___tag_value__Z8leibniz1v.63:                                 #
        movq      %rdi, %r12                                    #18.1 c5
        lea       (%rsp), %rdx                                  #18.1 c9
                                # LOE rdx rbx r9 r12 r13 r14 r15
..B1.22:                        # Preds ..B1.22 ..B1.13 Latency 21
        lea       .2.7_2__offload_var_desc1_p.41(%rip), %rdi    #18.1 c1
        movq      -8(%r9,%rdi), %rax                            #18.1 c5
        movq      -16(%r9,%rdi), %rcx                           #18.1 c5
        movq      -24(%r9,%rdi), %rsi                           #18.1 c9
        movq      -32(%r9,%rdi), %r8                            #18.1 c9
        movq      %rax, -8(%rdx,%r9)                            #18.1 c13
        movq      %rcx, -16(%rdx,%r9)                           #18.1 c13
        movq      %rsi, -24(%rdx,%r9)                           #18.1 c17
        movq      %r8, -32(%rdx,%r9)                            #18.1 c17
        subq      $32, %r9                                      #18.1 c21
        jne       ..B1.22       # Prob 75%                      #18.1 c21
                                # LOE rdx rbx r9 r12 r13 r14 r15
..B1.21:                        # Preds ..B1.22 Latency 33
        lea       128(%rsp), %rcx                               #18.1 c1
        lea       320(%rsp), %rax                               #18.1 c1
        movq      .2.7_2__offload_var_desc2_p.46(%rip), %r8     #18.1 c5
        movq      8+.2.7_2__offload_var_desc2_p.46(%rip), %r9   #18.1 c5
        movq      16+.2.7_2__offload_var_desc2_p.46(%rip), %r10 #18.1 c9
        movq      24+.2.7_2__offload_var_desc2_p.46(%rip), %r11 #18.1 c9
        movq      %rax, 56(%rdx)                                #18.1 c13
        movq      %r12, %rdi                                    #18.1 c13
        movq      %rax, 120(%rsp)                               #18.1 c17
        movl      $2, %esi                                      #18.1 c17
        xorl      %eax, %eax                                    #18.1 c21
        movq      %r8, (%rcx)                                   #18.1 c21
        movq      %r9, 8(%rcx)                                  #18.1 c25
        movq      %r10, 16(%rcx)                                #18.1 c25
        movq      %r11, 24(%rcx)                                #18.1 c29
..___tag_value__Z8leibniz1v.64:                                 #18.1
        call      __offload_target_enter@PLT                    #18.1
..___tag_value__Z8leibniz1v.65:                                 #
                                # LOE rbx r12 r13 r14 r15
..B1.14:                        # Preds ..B1.21 Latency 5
        movq      %r12, %rdi                                    #18.1 c1
        xorl      %eax, %eax                                    #18.1 c1
..___tag_value__Z8leibniz1v.66:                                 #18.1
        call      __offload_target_leave@PLT                    #18.1
..___tag_value__Z8leibniz1v.67:                                 #
                                # LOE rbx r13 r14 r15
..B1.15:                        # Preds ..B1.14 Latency 5
        movq      344(%rsp), %r12                               #18.1 c1
..___tag_value__Z8leibniz1v.68:                                 #
        movq      %rbp, %rsp                                    #18.1 c5
        popq      %rbp                                          #18.1
..___tag_value__Z8leibniz1v.69:                                 #
        ret                                                     #18.1
..___tag_value__Z8leibniz1v.71:                                 #
                                # LOE
	.type	__offload_entry_leibniz_cpp_18_Z8leibniz1v,@function
	.size	__offload_entry_leibniz_cpp_18_Z8leibniz1v,.-__offload_entry_leibniz_cpp_18_Z8leibniz1v
	.globl _Z8leibniz1v
_Z8leibniz1v:
..B1.16:                        # Preds ..B1.0 Latency 9
        pushq     %rbp                                          #8.16
..___tag_value__Z8leibniz1v.73:                                 #
        movq      %rsp, %rbp                                    #8.16
..___tag_value__Z8leibniz1v.74:                                 #
        andq      $-64, %rsp                                    #8.16
        subq      $384, %rsp                                    #8.16 c1
        movq      %rbp, %rsp                                    #8.16 c9
        popq      %rbp                                          #8.16
..___tag_value__Z8leibniz1v.76:                                 #
        ret                                                     #8.16
        .align    16,0x90
..___tag_value__Z8leibniz1v.78:                                 #
                                # LOE
# mark_end;
	.type	_Z8leibniz1v,@function
	.size	_Z8leibniz1v,.-_Z8leibniz1v
	.section .gcc_except_table, "a"
	.align 4
_Z8leibniz1v$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value__Z8leibniz1v.82 - ..___tag_value__Z8leibniz1v.81
..___tag_value__Z8leibniz1v.81:
	.byte	1
	.uleb128	..___tag_value__Z8leibniz1v.80 - ..___tag_value__Z8leibniz1v.79
..___tag_value__Z8leibniz1v.79:
	.uleb128	..___tag_value__Z8leibniz1v.9 - ..___tag_value__Z8leibniz1v.1
	.uleb128	..___tag_value__Z8leibniz1v.67 - ..___tag_value__Z8leibniz1v.9
	.byte	0
	.byte	0
..___tag_value__Z8leibniz1v.80:
	.long	0
..___tag_value__Z8leibniz1v.82:
	.data
	.align 8
	.align 8
.2.7_2__offload_var_desc1_p.41:
	.byte	68
	.byte	2
	.byte	1
	.byte	1
	.long	0
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	34
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.align 8
.2.7_2__offload_var_desc2_p.46:
	.quad	__sd_2inst_string.1
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.2
	.long	0x00000000,0x00000000
	.align 8
.2.7_2__offload_var_desc1_p.65:
	.byte	68
	.byte	1
	.byte	1
	.byte	1
	.long	0
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	68
	.byte	2
	.byte	1
	.byte	1
	.long	0
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.align 8
.2.7_2__offload_var_desc2_p.70:
	.quad	__sd_2inst_string.4
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.5
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.6
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.7
	.long	0x00000000,0x00000000
	.align 8
.2.7_2__offload_var_desc1_p.89:
	.byte	68
	.byte	1
	.byte	1
	.byte	1
	.long	0
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	34
	.byte	2
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.align 8
.2.7_2__offload_var_desc2_p.94:
	.quad	__sd_2inst_string.9
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.10
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.11
	.long	0x00000000,0x00000000
	.align 8
.2.7_2__offload_var_desc1_p.114:
	.byte	34
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	2
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.align 8
.2.7_2__offload_var_desc2_p.119:
	.quad	__sd_2inst_string.13
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.14
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.15
	.long	0x00000000,0x00000000
	.section .rodata, "a"
	.align 4
	.align 4
__sd_2inst_string.1:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.2:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.4:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.5:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.6:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.7:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.9:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.10:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.11:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.13:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.14:
	.byte	115
	.byte	117
	.byte	109
	.byte	0
	.align 4
__sd_2inst_string.15:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.0:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	49
	.byte	56
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.3:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	50
	.byte	50
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.8:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	50
	.byte	53
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.12:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	51
	.byte	50
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_18_Z8leibniz1v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_18_Z8leibniz1v_$entry:
	.type	__offload_entry_leibniz_cpp_18_Z8leibniz1v_$entry,@object
	.size	__offload_entry_leibniz_cpp_18_Z8leibniz1v_$entry,16
	.quad	__sd_2inst_string.0
	.quad	__offload_entry_leibniz_cpp_18_Z8leibniz1v
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_22_Z8leibniz1v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_22_Z8leibniz1v_$entry:
	.type	__offload_entry_leibniz_cpp_22_Z8leibniz1v_$entry,@object
	.size	__offload_entry_leibniz_cpp_22_Z8leibniz1v_$entry,16
	.quad	__sd_2inst_string.3
	.quad	__offload_entry_leibniz_cpp_22_Z8leibniz1v
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_25_Z8leibniz1v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_25_Z8leibniz1v_$entry:
	.type	__offload_entry_leibniz_cpp_25_Z8leibniz1v_$entry,@object
	.size	__offload_entry_leibniz_cpp_25_Z8leibniz1v_$entry,16
	.quad	__sd_2inst_string.8
	.quad	__offload_entry_leibniz_cpp_25_Z8leibniz1v
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_32_Z8leibniz1v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_32_Z8leibniz1v_$entry:
	.type	__offload_entry_leibniz_cpp_32_Z8leibniz1v_$entry,@object
	.size	__offload_entry_leibniz_cpp_32_Z8leibniz1v_$entry,16
	.quad	__sd_2inst_string.12
	.quad	__offload_entry_leibniz_cpp_32_Z8leibniz1v
	.data
# -- End  _Z8leibniz1v, __offload_entry_leibniz_cpp_18_Z8leibniz1v, __offload_entry_leibniz_cpp_22_Z8leibniz1v, __offload_entry_leibniz_cpp_25_Z8leibniz1v, __offload_entry_leibniz_cpp_32_Z8leibniz1v
	.text
# -- Begin  _Z8leibniz2v, __offload_entry_leibniz_cpp_50_Z8leibniz2v
# mark_begin;
# Threads 4
        .align    16,0x90
__offload_entry_leibniz_cpp_50_Z8leibniz2v:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0 Latency 25
..___tag_value__Z8leibniz2v.83:                                 #50.1
        pushq     %rbp                                          #50.1
..___tag_value__Z8leibniz2v.85:                                 #
        movq      %rsp, %rbp                                    #50.1
..___tag_value__Z8leibniz2v.86:                                 #
        andq      $-64, %rsp                                    #50.1
        pushq     %r13                                          #50.1 c1
        pushq     %r14                                          #50.1 c5
        pushq     %r15                                          #50.1 c9
        subq      $296, %rsp                                    #50.1 c9
..___tag_value__Z8leibniz2v.88:                                 #
        lea       (%rsp), %r14                                  #50.1 c13
        movq      %rdi, %r13                                    #50.1 c13
        movq      %r14, %rdi                                    #50.1 c17
        lea       .2.8_2__offload_var_desc1_p.158(%rip), %rsi   #50.1 c17
        movl      $192, %edx                                    #50.1 c21
        call      _intel_fast_memcpy@PLT                        #50.1 c25
                                # LOE rbx r12 r13 r14
..B2.11:                        # Preds ..B2.1 Latency 49
        lea       192(%rsp), %rcx                               #50.1 c1
        movq      40+.2.8_2__offload_var_desc2_p.163(%rip), %rax #50.1 c1
        lea       240(%rsp), %rdx                               #50.1 c5
        lea       248(%rsp), %rsi                               #50.1 c5
        lea       256(%rsp), %rdi                               #50.1 c9
        movq      .2.8_2__offload_var_desc2_p.163(%rip), %r8    #50.1 c9
        movq      8+.2.8_2__offload_var_desc2_p.163(%rip), %r9  #50.1 c13
        movq      16+.2.8_2__offload_var_desc2_p.163(%rip), %r10 #50.1 c13
        movq      24+.2.8_2__offload_var_desc2_p.163(%rip), %r11 #50.1 c17
        movq      32+.2.8_2__offload_var_desc2_p.163(%rip), %r15 #50.1 c17
        movq      %rax, 40(%rcx)                                #50.1 c21
        xorl      %eax, %eax                                    #50.1 c21
        movq      %rdx, 56(%r14)                                #50.1 c25
        movq      %r14, %rdx                                    #50.1 c25
        movq      %rsi, 120(%rsp)                               #50.1 c29
        movl      $3, %esi                                      #50.1 c29
        movq      %rdi, 184(%rsp)                               #50.1 c33
        movq      %r13, %rdi                                    #50.1 c33
        movq      %r8, (%rcx)                                   #50.1 c37
        movq      %r9, 8(%rcx)                                  #50.1 c37
        movq      %r10, 16(%rcx)                                #50.1 c41
        movq      %r11, 24(%rcx)                                #50.1 c41
        movq      %r15, 32(%rcx)                                #50.1 c45
..___tag_value__Z8leibniz2v.91:                                 #50.1
        call      __offload_target_enter@PLT                    #50.1
..___tag_value__Z8leibniz2v.92:                                 #
                                # LOE rbx r12 r13
..B2.2:                         # Preds ..B2.11 Latency 9
        movq      240(%rsp), %r15                               #50.1 c1
        movq      248(%rsp), %r14                               #50.1 c1
        movq      %r15, %rdi                                    #53.3 c5
        movq      %r14, %rsi                                    #53.3 c5
..___tag_value__Z8leibniz2v.93:                                 #53.3
        call      _Z13hostmic_scalePdl@PLT                      #53.3
..___tag_value__Z8leibniz2v.94:                                 #
                                # LOE rbx r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2 Latency 5
        movq      %r15, %rdi                                    #54.3 c1
        movq      %r14, %rsi                                    #54.3 c1
..___tag_value__Z8leibniz2v.95:                                 #54.3
        call      _Z13hostmic_scalePdl@PLT                      #54.3
..___tag_value__Z8leibniz2v.96:                                 #
                                # LOE rbx r12 r13 r14 r15
..B2.4:                         # Preds ..B2.3 Latency 5
        movq      %r15, %rdi                                    #55.3 c1
        movq      %r14, %rsi                                    #55.3 c1
..___tag_value__Z8leibniz2v.97:                                 #55.3
        call      _Z13hostmic_scalePdl@PLT                      #55.3
..___tag_value__Z8leibniz2v.98:                                 #
                                # LOE rbx r12 r13 r14 r15
..B2.5:                         # Preds ..B2.4 Latency 5
        movq      %r15, %rdi                                    #56.9 c1
        movq      %r14, %rsi                                    #56.9 c1
..___tag_value__Z8leibniz2v.99:                                 #56.9
        call      _Z7mic_sumPdl@PLT                             #56.9
..___tag_value__Z8leibniz2v.100:                                #
                                # LOE rbx r12 r13 r14 r15 zmm0
..B2.6:                         # Preds ..B2.5 Latency 17
        movl      $1, %eax                                      #50.1 c1
        movq      %r13, %rdi                                    #50.1 c1
        kmov      %eax, %k1                                     #50.1 c5
        xorl      %eax, %eax                                    #50.1 c5
        vpackstorelpd %zmm0, 256(%rsp){%k1}                     #50.1 c9
        movb      %al, %al                                      #50.1 c9
        movq      %r14, 248(%rsp)                               #50.1 c13
        movq      %r15, 240(%rsp)                               #50.1 c13
..___tag_value__Z8leibniz2v.101:                                #50.1
        call      __offload_target_leave@PLT                    #50.1
..___tag_value__Z8leibniz2v.102:                                #
                                # LOE rbx r12
..B2.7:                         # Preds ..B2.6 Latency 17
        addq      $296, %rsp                                    #50.1 c1
..___tag_value__Z8leibniz2v.103:                                #50.1
        popq      %r15                                          #50.1
..___tag_value__Z8leibniz2v.104:                                #50.1
        popq      %r14                                          #50.1
..___tag_value__Z8leibniz2v.105:                                #50.1
        popq      %r13                                          #50.1
        movq      %rbp, %rsp                                    #50.1 c17
        popq      %rbp                                          #50.1
..___tag_value__Z8leibniz2v.106:                                #
        ret                                                     #50.1
..___tag_value__Z8leibniz2v.108:                                #
                                # LOE
	.type	__offload_entry_leibniz_cpp_50_Z8leibniz2v,@function
	.size	__offload_entry_leibniz_cpp_50_Z8leibniz2v,.-__offload_entry_leibniz_cpp_50_Z8leibniz2v
	.globl _Z8leibniz2v
_Z8leibniz2v:
..B2.8:                         # Preds ..B2.0 Latency 29
        pushq     %rbp                                          #41.16
..___tag_value__Z8leibniz2v.110:                                #
        movq      %rsp, %rbp                                    #41.16
..___tag_value__Z8leibniz2v.111:                                #
        andq      $-64, %rsp                                    #41.16
        pushq     %r13                                          #41.16 c1
        pushq     %r14                                          #41.16 c5
        pushq     %r15                                          #41.16 c9
        subq      $296, %rsp                                    #41.16 c9
        addq      $296, %rsp                                    #41.16 c13
..___tag_value__Z8leibniz2v.113:                                #
        popq      %r15                                          #41.16
..___tag_value__Z8leibniz2v.117:                                #41.16
        popq      %r14                                          #41.16
..___tag_value__Z8leibniz2v.118:                                #41.16
        popq      %r13                                          #41.16
        movq      %rbp, %rsp                                    #41.16 c29
        popq      %rbp                                          #41.16
..___tag_value__Z8leibniz2v.119:                                #
        ret                                                     #41.16
        .align    16,0x90
..___tag_value__Z8leibniz2v.121:                                #
                                # LOE
# mark_end;
	.type	_Z8leibniz2v,@function
	.size	_Z8leibniz2v,.-_Z8leibniz2v
	.section .gcc_except_table, "a"
	.align 4
_Z8leibniz2v$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value__Z8leibniz2v.125 - ..___tag_value__Z8leibniz2v.124
..___tag_value__Z8leibniz2v.124:
	.byte	1
	.uleb128	..___tag_value__Z8leibniz2v.123 - ..___tag_value__Z8leibniz2v.122
..___tag_value__Z8leibniz2v.122:
	.uleb128	..___tag_value__Z8leibniz2v.91 - ..___tag_value__Z8leibniz2v.83
	.uleb128	..___tag_value__Z8leibniz2v.102 - ..___tag_value__Z8leibniz2v.91
	.byte	0
	.byte	0
..___tag_value__Z8leibniz2v.123:
	.long	0
..___tag_value__Z8leibniz2v.125:
	.data
	.align 8
.2.8_2__offload_var_desc1_p.158:
	.byte	34
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	2
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.align 8
.2.8_2__offload_var_desc2_p.163:
	.quad	__sd_2inst_string.17
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.18
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.19
	.long	0x00000000,0x00000000
	.section .rodata, "a"
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.17:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.18:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.19:
	.byte	115
	.byte	117
	.byte	109
	.byte	0
	.align 4
__sd_2inst_string.16:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	53
	.byte	48
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	50
	.byte	118
	.byte	0
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_50_Z8leibniz2v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_50_Z8leibniz2v_$entry:
	.type	__offload_entry_leibniz_cpp_50_Z8leibniz2v_$entry,@object
	.size	__offload_entry_leibniz_cpp_50_Z8leibniz2v_$entry,16
	.quad	__sd_2inst_string.16
	.quad	__offload_entry_leibniz_cpp_50_Z8leibniz2v
	.data
# -- End  _Z8leibniz2v, __offload_entry_leibniz_cpp_50_Z8leibniz2v
	.text
# -- Begin  _Z8leibniz3v, __offload_entry_leibniz_cpp_73_Z8leibniz3v, __offload_entry_leibniz_cpp_84_Z8leibniz3v
# mark_begin;
# Threads 4
        .align    16,0x90
__offload_entry_leibniz_cpp_84_Z8leibniz3v:
# parameter 1: %rdi
..B3.1:                         # Preds ..B3.0 Latency 17
..___tag_value__Z8leibniz3v.126:                                #84.1
        pushq     %rbp                                          #84.1
..___tag_value__Z8leibniz3v.128:                                #
        movq      %rsp, %rbp                                    #84.1
..___tag_value__Z8leibniz3v.129:                                #
        andq      $-64, %rsp                                    #84.1
        subq      $320, %rsp                                    #84.1 c1
        xorl      %esi, %esi                                    #84.1 c1
        xorl      %edx, %edx                                    #84.1 c5
        xorl      %ecx, %ecx                                    #84.1 c5
        xorl      %eax, %eax                                    #84.1 c9
        movq      %rbx, 288(%rsp)                               #84.1 c9
..___tag_value__Z8leibniz3v.131:                                #
        movq      %rdi, %rbx                                    #84.1 c13
..___tag_value__Z8leibniz3v.132:                                #84.1
        call      __offload_target_enter@PLT                    #84.1
..___tag_value__Z8leibniz3v.133:                                #
                                # LOE rbx r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1 Latency 5
        movq      %rbx, %rdi                                    #84.1 c1
        xorl      %eax, %eax                                    #84.1 c1
..___tag_value__Z8leibniz3v.134:                                #84.1
        call      __offload_target_leave@PLT                    #84.1
..___tag_value__Z8leibniz3v.135:                                #
                                # LOE r12 r13 r14 r15
..B3.3:                         # Preds ..B3.2 Latency 5
        movq      288(%rsp), %rbx                               #84.1 c1
..___tag_value__Z8leibniz3v.136:                                #
        movq      %rbp, %rsp                                    #84.1 c5
        popq      %rbp                                          #84.1
..___tag_value__Z8leibniz3v.137:                                #
        ret                                                     #84.1
..___tag_value__Z8leibniz3v.139:                                #
                                # LOE
	.type	__offload_entry_leibniz_cpp_84_Z8leibniz3v,@function
	.size	__offload_entry_leibniz_cpp_84_Z8leibniz3v,.-__offload_entry_leibniz_cpp_84_Z8leibniz3v
__offload_entry_leibniz_cpp_73_Z8leibniz3v:
# parameter 1: %rdi
..B3.4:                         # Preds ..B3.0 Latency 21
        pushq     %rbp                                          #73.1
..___tag_value__Z8leibniz3v.141:                                #
        movq      %rsp, %rbp                                    #73.1
..___tag_value__Z8leibniz3v.142:                                #
        andq      $-64, %rsp                                    #73.1
        subq      $320, %rsp                                    #73.1 c1
        lea       .2.9_2__offload_var_desc1_p.199(%rip), %rsi   #73.1 c1
        movq      %r14, 272(%rsp)                               #73.1 c5
..___tag_value__Z8leibniz3v.144:                                #
        lea       (%rsp), %r14                                  #73.1 c5
        movq      %r13, 280(%rsp)                               #73.1 c9
..___tag_value__Z8leibniz3v.145:                                #
        movq      %rdi, %r13                                    #73.1 c9
        movq      %r14, %rdi                                    #73.1 c13
        movl      $192, %edx                                    #73.1 c13
        movq      %r15, 264(%rsp)                               #73.1 c17
        call      _intel_fast_memcpy@PLT                        #73.1 c21
..___tag_value__Z8leibniz3v.146:                                #
                                # LOE rbx r12 r13 r14
..B3.14:                        # Preds ..B3.4 Latency 49
        lea       192(%rsp), %rcx                               #73.1 c1
        movq      40+.2.9_2__offload_var_desc2_p.204(%rip), %rax #73.1 c1
        lea       240(%rsp), %rdx                               #73.1 c5
        lea       248(%rsp), %rsi                               #73.1 c5
        lea       256(%rsp), %rdi                               #73.1 c9
        movq      .2.9_2__offload_var_desc2_p.204(%rip), %r8    #73.1 c9
        movq      8+.2.9_2__offload_var_desc2_p.204(%rip), %r9  #73.1 c13
        movq      16+.2.9_2__offload_var_desc2_p.204(%rip), %r10 #73.1 c13
        movq      24+.2.9_2__offload_var_desc2_p.204(%rip), %r11 #73.1 c17
        movq      32+.2.9_2__offload_var_desc2_p.204(%rip), %r15 #73.1 c17
        movq      %rax, 40(%rcx)                                #73.1 c21
        xorl      %eax, %eax                                    #73.1 c21
        movq      %rdx, 56(%r14)                                #73.1 c25
        movq      %r14, %rdx                                    #73.1 c25
        movq      %rsi, 120(%rsp)                               #73.1 c29
        movl      $3, %esi                                      #73.1 c29
        movq      %rdi, 184(%rsp)                               #73.1 c33
        movq      %r13, %rdi                                    #73.1 c33
        movq      %r8, (%rcx)                                   #73.1 c37
        movq      %r9, 8(%rcx)                                  #73.1 c37
        movq      %r10, 16(%rcx)                                #73.1 c41
        movq      %r11, 24(%rcx)                                #73.1 c41
        movq      %r15, 32(%rcx)                                #73.1 c45
..___tag_value__Z8leibniz3v.147:                                #73.1
        call      __offload_target_enter@PLT                    #73.1
..___tag_value__Z8leibniz3v.148:                                #
                                # LOE rbx r12 r13
..B3.5:                         # Preds ..B3.14 Latency 9
        movq      240(%rsp), %r15                               #73.1 c1
        movq      248(%rsp), %r14                               #73.1 c1
        movq      %r15, %rdi                                    #77.3 c5
        movq      %r14, %rsi                                    #77.3 c5
..___tag_value__Z8leibniz3v.149:                                #77.3
        call      _Z13hostmic_scalePdl@PLT                      #77.3
..___tag_value__Z8leibniz3v.150:                                #
                                # LOE rbx r12 r13 r14 r15
..B3.6:                         # Preds ..B3.5 Latency 5
        movq      %r15, %rdi                                    #78.3 c1
        movq      %r14, %rsi                                    #78.3 c1
..___tag_value__Z8leibniz3v.151:                                #78.3
        call      _Z13hostmic_scalePdl@PLT                      #78.3
..___tag_value__Z8leibniz3v.152:                                #
                                # LOE rbx r12 r13 r14 r15
..B3.7:                         # Preds ..B3.6 Latency 5
        movq      %r15, %rdi                                    #79.3 c1
        movq      %r14, %rsi                                    #79.3 c1
..___tag_value__Z8leibniz3v.153:                                #79.3
        call      _Z13hostmic_scalePdl@PLT                      #79.3
..___tag_value__Z8leibniz3v.154:                                #
                                # LOE rbx r12 r13 r14 r15
..B3.8:                         # Preds ..B3.7 Latency 5
        movq      %r15, %rdi                                    #80.9 c1
        movq      %r14, %rsi                                    #80.9 c1
..___tag_value__Z8leibniz3v.155:                                #80.9
        call      _Z7mic_sumPdl@PLT                             #80.9
..___tag_value__Z8leibniz3v.156:                                #
                                # LOE rbx r12 r13 r14 r15 zmm0
..B3.9:                         # Preds ..B3.8 Latency 17
        movl      $1, %eax                                      #73.1 c1
        movq      %r13, %rdi                                    #73.1 c1
        kmov      %eax, %k1                                     #73.1 c5
        xorl      %eax, %eax                                    #73.1 c5
        vpackstorelpd %zmm0, 256(%rsp){%k1}                     #73.1 c9
        movb      %al, %al                                      #73.1 c9
        movq      %r14, 248(%rsp)                               #73.1 c13
        movq      %r15, 240(%rsp)                               #73.1 c13
..___tag_value__Z8leibniz3v.157:                                #73.1
        call      __offload_target_leave@PLT                    #73.1
..___tag_value__Z8leibniz3v.158:                                #
                                # LOE rbx r12
..B3.10:                        # Preds ..B3.9 Latency 9
        movq      280(%rsp), %r13                               #73.1 c1
..___tag_value__Z8leibniz3v.159:                                #
        movq      272(%rsp), %r14                               #73.1 c1
..___tag_value__Z8leibniz3v.160:                                #
        movq      264(%rsp), %r15                               #73.1 c5
..___tag_value__Z8leibniz3v.161:                                #
        movq      %rbp, %rsp                                    #73.1 c9
        popq      %rbp                                          #73.1
..___tag_value__Z8leibniz3v.162:                                #
        ret                                                     #73.1
..___tag_value__Z8leibniz3v.164:                                #
                                # LOE
	.type	__offload_entry_leibniz_cpp_73_Z8leibniz3v,@function
	.size	__offload_entry_leibniz_cpp_73_Z8leibniz3v,.-__offload_entry_leibniz_cpp_73_Z8leibniz3v
	.globl _Z8leibniz3v
_Z8leibniz3v:
..B3.11:                        # Preds ..B3.0 Latency 9
        pushq     %rbp                                          #64.16
..___tag_value__Z8leibniz3v.166:                                #
        movq      %rsp, %rbp                                    #64.16
..___tag_value__Z8leibniz3v.167:                                #
        andq      $-64, %rsp                                    #64.16
        subq      $320, %rsp                                    #64.16 c1
        movq      %rbp, %rsp                                    #64.16 c9
        popq      %rbp                                          #64.16
..___tag_value__Z8leibniz3v.169:                                #
        ret                                                     #64.16
        .align    16,0x90
..___tag_value__Z8leibniz3v.171:                                #
                                # LOE
# mark_end;
	.type	_Z8leibniz3v,@function
	.size	_Z8leibniz3v,.-_Z8leibniz3v
	.section .gcc_except_table, "a"
	.align 4
_Z8leibniz3v$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value__Z8leibniz3v.175 - ..___tag_value__Z8leibniz3v.174
..___tag_value__Z8leibniz3v.174:
	.byte	1
	.uleb128	..___tag_value__Z8leibniz3v.173 - ..___tag_value__Z8leibniz3v.172
..___tag_value__Z8leibniz3v.172:
	.uleb128	..___tag_value__Z8leibniz3v.132 - ..___tag_value__Z8leibniz3v.126
	.uleb128	..___tag_value__Z8leibniz3v.158 - ..___tag_value__Z8leibniz3v.132
	.byte	0
	.byte	0
..___tag_value__Z8leibniz3v.173:
	.long	0
..___tag_value__Z8leibniz3v.175:
	.data
	.align 8
.2.9_2__offload_var_desc1_p.199:
	.byte	34
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	2
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.align 8
.2.9_2__offload_var_desc2_p.204:
	.quad	__sd_2inst_string.21
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.22
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.23
	.long	0x00000000,0x00000000
	.section .rodata, "a"
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.21:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.22:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.23:
	.byte	115
	.byte	117
	.byte	109
	.byte	0
	.align 4
__sd_2inst_string.20:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	55
	.byte	51
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	51
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.24:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	56
	.byte	52
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	51
	.byte	118
	.byte	0
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_73_Z8leibniz3v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_73_Z8leibniz3v_$entry:
	.type	__offload_entry_leibniz_cpp_73_Z8leibniz3v_$entry,@object
	.size	__offload_entry_leibniz_cpp_73_Z8leibniz3v_$entry,16
	.quad	__sd_2inst_string.20
	.quad	__offload_entry_leibniz_cpp_73_Z8leibniz3v
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_84_Z8leibniz3v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_84_Z8leibniz3v_$entry:
	.type	__offload_entry_leibniz_cpp_84_Z8leibniz3v_$entry,@object
	.size	__offload_entry_leibniz_cpp_84_Z8leibniz3v_$entry,16
	.quad	__sd_2inst_string.24
	.quad	__offload_entry_leibniz_cpp_84_Z8leibniz3v
	.data
# -- End  _Z8leibniz3v, __offload_entry_leibniz_cpp_73_Z8leibniz3v, __offload_entry_leibniz_cpp_84_Z8leibniz3v
	.data
	.section .note.GNU-stack, ""
	.weak DW.ref.__gxx_personality_v0
	.hidden DW.ref.__gxx_personality_v0
	.type	DW.ref.__gxx_personality_v0,@object
	.size	DW.ref.__gxx_personality_v0,8
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 1
	.4byte 0x0000001c
	.8byte 0x4c507a0100000000
	.4byte 0x78010052
	.2byte 0x0710
	.byte 0x9b
	.4byte DW.ref.__gxx_personality_v0-.
	.8byte 0x00019008070c1b1b
	.byte 0x00
	.4byte 0x000001d4
	.4byte 0x00000024
	.4byte ..___tag_value__Z8leibniz1v.1-.
	.4byte ..___tag_value__Z8leibniz1v.78-..___tag_value__Z8leibniz1v.1
	.byte 0x04
	.4byte _Z8leibniz1v$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz1v.3-..___tag_value__Z8leibniz1v.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz1v.4-..___tag_value__Z8leibniz1v.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibniz1v.6-..___tag_value__Z8leibniz1v.4
	.8byte 0xffc00d1c380e0e10
	.8byte 0xffffffe80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz1v.7-..___tag_value__Z8leibniz1v.6
	.8byte 0xffc00d1c380e0d10
	.8byte 0xfffffff00d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz1v.8-..___tag_value__Z8leibniz1v.7
	.8byte 0xffc00d1c380e0f10
	.8byte 0xffffffe00d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz1v.15-..___tag_value__Z8leibniz1v.8
	.2byte 0x04cd
	.4byte ..___tag_value__Z8leibniz1v.16-..___tag_value__Z8leibniz1v.15
	.2byte 0x04ce
	.4byte ..___tag_value__Z8leibniz1v.17-..___tag_value__Z8leibniz1v.16
	.2byte 0x04cf
	.4byte ..___tag_value__Z8leibniz1v.18-..___tag_value__Z8leibniz1v.17
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz1v.20-..___tag_value__Z8leibniz1v.18
	.4byte 0x0410060c
	.4byte ..___tag_value__Z8leibniz1v.22-..___tag_value__Z8leibniz1v.20
	.4byte 0x0410070c
	.4byte ..___tag_value__Z8leibniz1v.23-..___tag_value__Z8leibniz1v.22
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibniz1v.25-..___tag_value__Z8leibniz1v.23
	.8byte 0xffc00d1c380e0c10
	.8byte 0xffffffd80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz1v.26-..___tag_value__Z8leibniz1v.25
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffd00d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz1v.27-..___tag_value__Z8leibniz1v.26
	.8byte 0xffc00d1c380e0f10
	.8byte 0xffffffe00d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz1v.34-..___tag_value__Z8leibniz1v.27
	.2byte 0x04c3
	.4byte ..___tag_value__Z8leibniz1v.35-..___tag_value__Z8leibniz1v.34
	.2byte 0x04cc
	.4byte ..___tag_value__Z8leibniz1v.36-..___tag_value__Z8leibniz1v.35
	.2byte 0x04cf
	.4byte ..___tag_value__Z8leibniz1v.37-..___tag_value__Z8leibniz1v.36
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz1v.39-..___tag_value__Z8leibniz1v.37
	.4byte 0x0410060c
	.4byte ..___tag_value__Z8leibniz1v.41-..___tag_value__Z8leibniz1v.39
	.4byte 0x0410070c
	.4byte ..___tag_value__Z8leibniz1v.42-..___tag_value__Z8leibniz1v.41
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibniz1v.44-..___tag_value__Z8leibniz1v.42
	.8byte 0xffc00d1c380e0d10
	.8byte 0xfffffff00d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz1v.45-..___tag_value__Z8leibniz1v.44
	.8byte 0xffc00d1c380e0e10
	.8byte 0xffffffe80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz1v.46-..___tag_value__Z8leibniz1v.45
	.8byte 0xffc00d1c380e0f10
	.8byte 0xffffffe00d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz1v.53-..___tag_value__Z8leibniz1v.46
	.2byte 0x04cd
	.4byte ..___tag_value__Z8leibniz1v.54-..___tag_value__Z8leibniz1v.53
	.2byte 0x04ce
	.4byte ..___tag_value__Z8leibniz1v.55-..___tag_value__Z8leibniz1v.54
	.2byte 0x04cf
	.4byte ..___tag_value__Z8leibniz1v.56-..___tag_value__Z8leibniz1v.55
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz1v.58-..___tag_value__Z8leibniz1v.56
	.4byte 0x0410060c
	.4byte ..___tag_value__Z8leibniz1v.60-..___tag_value__Z8leibniz1v.58
	.4byte 0x0410070c
	.4byte ..___tag_value__Z8leibniz1v.61-..___tag_value__Z8leibniz1v.60
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibniz1v.63-..___tag_value__Z8leibniz1v.61
	.8byte 0xffc00d1c380e0c10
	.8byte 0xffffffd80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz1v.68-..___tag_value__Z8leibniz1v.63
	.2byte 0x04cc
	.4byte ..___tag_value__Z8leibniz1v.69-..___tag_value__Z8leibniz1v.68
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz1v.71-..___tag_value__Z8leibniz1v.69
	.4byte 0x0410060c
	.4byte ..___tag_value__Z8leibniz1v.73-..___tag_value__Z8leibniz1v.71
	.4byte 0x0410070c
	.4byte ..___tag_value__Z8leibniz1v.74-..___tag_value__Z8leibniz1v.73
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibniz1v.76-..___tag_value__Z8leibniz1v.74
	.8byte 0x00000000c608070c
	.byte 0x00
	.4byte 0x000000e4
	.4byte 0x000001fc
	.4byte ..___tag_value__Z8leibniz2v.83-.
	.4byte ..___tag_value__Z8leibniz2v.121-..___tag_value__Z8leibniz2v.83
	.byte 0x04
	.4byte _Z8leibniz2v$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz2v.85-..___tag_value__Z8leibniz2v.83
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz2v.86-..___tag_value__Z8leibniz2v.85
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibniz2v.88-..___tag_value__Z8leibniz2v.86
	.8byte 0xffc00d1c380e0d10
	.8byte 0xfffffff80d1affff
	.8byte 0xc00d1c380e0e1022
	.8byte 0xfffff00d1affffff
	.8byte 0x0d1c380e0f1022ff
	.8byte 0xffe80d1affffffc0
	.4byte 0x0422ffff
	.4byte ..___tag_value__Z8leibniz2v.103-..___tag_value__Z8leibniz2v.88
	.2byte 0x04cf
	.4byte ..___tag_value__Z8leibniz2v.104-..___tag_value__Z8leibniz2v.103
	.2byte 0x04ce
	.4byte ..___tag_value__Z8leibniz2v.105-..___tag_value__Z8leibniz2v.104
	.2byte 0x04cd
	.4byte ..___tag_value__Z8leibniz2v.106-..___tag_value__Z8leibniz2v.105
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz2v.108-..___tag_value__Z8leibniz2v.106
	.4byte 0x0410060c
	.4byte ..___tag_value__Z8leibniz2v.110-..___tag_value__Z8leibniz2v.108
	.4byte 0x0410070c
	.4byte ..___tag_value__Z8leibniz2v.111-..___tag_value__Z8leibniz2v.110
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibniz2v.113-..___tag_value__Z8leibniz2v.111
	.8byte 0xffc00d1c380e0d10
	.8byte 0xfffffff80d1affff
	.8byte 0xc00d1c380e0e1022
	.8byte 0xfffff00d1affffff
	.8byte 0x0d1c380e0f1022ff
	.8byte 0xffe80d1affffffc0
	.4byte 0xcf22ffff
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz2v.117-..___tag_value__Z8leibniz2v.113
	.2byte 0x04ce
	.4byte ..___tag_value__Z8leibniz2v.118-..___tag_value__Z8leibniz2v.117
	.2byte 0x04cd
	.4byte ..___tag_value__Z8leibniz2v.119-..___tag_value__Z8leibniz2v.118
	.8byte 0x00000000c608070c
	.2byte 0x0000
	.byte 0x00
	.4byte 0x000000e4
	.4byte 0x000002e4
	.4byte ..___tag_value__Z8leibniz3v.126-.
	.4byte ..___tag_value__Z8leibniz3v.171-..___tag_value__Z8leibniz3v.126
	.byte 0x04
	.4byte _Z8leibniz3v$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz3v.128-..___tag_value__Z8leibniz3v.126
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz3v.129-..___tag_value__Z8leibniz3v.128
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibniz3v.131-..___tag_value__Z8leibniz3v.129
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffe00d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz3v.136-..___tag_value__Z8leibniz3v.131
	.2byte 0x04c3
	.4byte ..___tag_value__Z8leibniz3v.137-..___tag_value__Z8leibniz3v.136
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz3v.139-..___tag_value__Z8leibniz3v.137
	.4byte 0x0410060c
	.4byte ..___tag_value__Z8leibniz3v.141-..___tag_value__Z8leibniz3v.139
	.4byte 0x0410070c
	.4byte ..___tag_value__Z8leibniz3v.142-..___tag_value__Z8leibniz3v.141
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibniz3v.144-..___tag_value__Z8leibniz3v.142
	.8byte 0xffc00d1c380e0e10
	.8byte 0xffffffd00d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz3v.145-..___tag_value__Z8leibniz3v.144
	.8byte 0xffc00d1c380e0d10
	.8byte 0xffffffd80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz3v.146-..___tag_value__Z8leibniz3v.145
	.8byte 0xffc00d1c380e0f10
	.8byte 0xffffffc80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8leibniz3v.159-..___tag_value__Z8leibniz3v.146
	.2byte 0x04cd
	.4byte ..___tag_value__Z8leibniz3v.160-..___tag_value__Z8leibniz3v.159
	.2byte 0x04ce
	.4byte ..___tag_value__Z8leibniz3v.161-..___tag_value__Z8leibniz3v.160
	.2byte 0x04cf
	.4byte ..___tag_value__Z8leibniz3v.162-..___tag_value__Z8leibniz3v.161
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz3v.164-..___tag_value__Z8leibniz3v.162
	.4byte 0x0410060c
	.4byte ..___tag_value__Z8leibniz3v.166-..___tag_value__Z8leibniz3v.164
	.4byte 0x0410070c
	.4byte ..___tag_value__Z8leibniz3v.167-..___tag_value__Z8leibniz3v.166
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibniz3v.169-..___tag_value__Z8leibniz3v.167
	.4byte 0xc608070c
	.2byte 0x0000
	.byte 0x00
// -- Begin DWARF2 SEGMENT .gnu.linkonce.d.DW.ref.__gxx_personality_v0
	.section .gnu.linkonce.d.DW.ref.__gxx_personality_v0,"a",@progbits
	.weak DW.ref.__gxx_personality_v0
	.align 1
.hidden DW.ref.__gxx_personality_v0
DW.ref.__gxx_personality_v0:
	.8byte __gxx_personality_v0
# End
