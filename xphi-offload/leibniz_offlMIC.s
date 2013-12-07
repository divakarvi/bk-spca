# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) MIC Architecture, Version 13.1.0.1";
# mark_description "46 Beta Build 20130121";
# mark_description " -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP -fno-verbose-asm -S";
	.file "leibniz_offl.cpp"
	.text
..TXTST0:
# -- Begin  main, L_main_58__par_loop0_2.42, __offload_entry_leibniz_offl_cpp_66main, __offload_entry_leibniz_offl_cpp_70main, __offload_entry_leibniz_offl_cpp_73main, __offload_entry_leibniz_offl_cpp_80main
# mark_begin;
# Threads 4
        .align    16,0x90
__offload_entry_leibniz_offl_cpp_80main:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0 Latency 21
..___tag_value_main.1:                                          #80.1
        pushq     %rbp                                          #80.1
..___tag_value_main.3:                                          #
        movq      %rsp, %rbp                                    #80.1
..___tag_value_main.4:                                          #
        andq      $-128, %rsp                                   #80.1
        subq      $384, %rsp                                    #80.1 c1
        movq      %rbx, 368(%rsp)                               #80.1 c5
..___tag_value_main.6:                                          #
        movq      %rdi, %rbx                                    #80.1 c5
        xorl      %edi, %edi                                    #80.1 c9
        movq      %r15, 336(%rsp)                               #80.1 c9
        movq      %r14, 344(%rsp)                               #80.1 c13
        movq      %r13, 352(%rsp)                               #80.1 c13
        movq      %r12, 360(%rsp)                               #80.1 c17
..___tag_value_main.7:                                          #80.1
        call      __intel_new_proc_init_R@PLT                   #80.1
..___tag_value_main.8:                                          #
                                # LOE rbx
..B1.25:                        # Preds ..B1.1 Latency 9
        lea       (%rsp), %r12                                  #80.1 c1
        lea       .2.7_2__offload_var_desc1_p.150(%rip), %rsi   #80.1 c1
        movq      %r12, %rdi                                    #80.1 c5
        movl      $192, %edx                                    #80.1 c5
        call      _intel_fast_memcpy@PLT                        #80.1 c9
                                # LOE rbx r12
..B1.24:                        # Preds ..B1.25 Latency 49
        lea       192(%rsp), %rcx                               #80.1 c1
        lea       240(%rsp), %rax                               #80.1 c1
        lea       328(%rsp), %rdx                               #80.1 c5
        movq      .2.7_2__offload_var_desc2_p.155(%rip), %r8    #80.1 c5
        movq      8+.2.7_2__offload_var_desc2_p.155(%rip), %r9  #80.1 c9
        movq      16+.2.7_2__offload_var_desc2_p.155(%rip), %r10 #80.1 c9
        movq      24+.2.7_2__offload_var_desc2_p.155(%rip), %r11 #80.1 c13
        movq      32+.2.7_2__offload_var_desc2_p.155(%rip), %r13 #80.1 c13
        movq      40+.2.7_2__offload_var_desc2_p.155(%rip), %r14 #80.1 c17
        lea       320(%rsp), %r15                               #80.1 c17
        movq      %rax, 120(%rsp)                               #80.1 c21
        movq      %rbx, %rdi                                    #80.1 c21
        movq      %rdx, 184(%rsp)                               #80.1 c25
        movl      $3, %esi                                      #80.1 c25
        movq      %r12, %rdx                                    #80.1 c29
        xorl      %eax, %eax                                    #80.1 c29
        movq      %r8, (%rcx)                                   #80.1 c33
        movq      %r9, 8(%rcx)                                  #80.1 c33
        movq      %r10, 16(%rcx)                                #80.1 c37
        movq      %r11, 24(%rcx)                                #80.1 c37
        movq      %r13, 32(%rcx)                                #80.1 c41
        movq      %r14, 40(%rcx)                                #80.1 c41
        movq      %r15, 56(%r12)                                #80.1 c45
..___tag_value_main.13:                                         #80.1
        call      __offload_target_enter@PLT                    #80.1
..___tag_value_main.14:                                         #
                                # LOE rbx
..B1.2:                         # Preds ..B1.24 Latency 9
        movq      320(%rsp), %r13                               #80.1 c1
        movq      328(%rsp), %r12                               #80.1 c1
        movq      %r13, %rdi                                    #82.8 c5
        movq      %r12, %rsi                                    #82.8 c5
..___tag_value_main.15:                                         #82.8
        call      _Z7mic_sumPdl@PLT                             #82.8
..___tag_value_main.16:                                         #
                                # LOE rbx r12 r13 zmm0
..B1.3:                         # Preds ..B1.2 Latency 21
        movl      $1, %eax                                      #80.1 c1
        movq      %rbx, %rdi                                    #80.1 c1
        kmov      %eax, %k1                                     #80.1 c5
        xorl      %eax, %eax                                    #80.1 c5
        movq      %r12, 328(%rsp)                               #80.1 c9
        movb      %al, %al                                      #80.1 c9
        vpackstorelpd %zmm0, 240(%rsp){%k1}                     #80.1 c13
        movb      %dl, %dl                                      #80.1 c13
        movq      %r13, 320(%rsp)                               #80.1 c17
..___tag_value_main.17:                                         #80.1
        call      __offload_target_leave@PLT                    #80.1
..___tag_value_main.18:                                         #
                                # LOE
..B1.4:                         # Preds ..B1.3 Latency 17
        movq      336(%rsp), %r15                               #80.1 c1
..___tag_value_main.19:                                         #
        xorl      %eax, %eax                                    #80.1 c1
        movq      344(%rsp), %r14                               #80.1 c5
..___tag_value_main.20:                                         #
        movq      352(%rsp), %r13                               #80.1 c5
..___tag_value_main.21:                                         #
        movq      360(%rsp), %r12                               #80.1 c9
..___tag_value_main.22:                                         #
        movq      368(%rsp), %rbx                               #80.1 c9
..___tag_value_main.23:                                         #
        movq      %rbp, %rsp                                    #80.1 c17
        popq      %rbp                                          #80.1
..___tag_value_main.24:                                         #
        ret                                                     #80.1
..___tag_value_main.26:                                         #
                                # LOE
	.type	__offload_entry_leibniz_offl_cpp_80main,@function
	.size	__offload_entry_leibniz_offl_cpp_80main,.-__offload_entry_leibniz_offl_cpp_80main
__offload_entry_leibniz_offl_cpp_73main:
# parameter 1: %rdi
..B1.5:                         # Preds ..B1.0 Latency 21
        pushq     %rbp                                          #73.1
..___tag_value_main.28:                                         #
        movq      %rsp, %rbp                                    #73.1
..___tag_value_main.29:                                         #
        andq      $-128, %rsp                                   #73.1
        subq      $384, %rsp                                    #73.1 c1
        movq      %rbx, 368(%rsp)                               #73.1 c5
..___tag_value_main.31:                                         #
        movq      %rdi, %rbx                                    #73.1 c5
        xorl      %edi, %edi                                    #73.1 c9
        movq      %r15, 336(%rsp)                               #73.1 c9
        movq      %r14, 344(%rsp)                               #73.1 c13
        movq      %r13, 352(%rsp)                               #73.1 c13
        movq      %r12, 360(%rsp)                               #73.1 c17
..___tag_value_main.32:                                         #73.1
        call      __intel_new_proc_init_R@PLT                   #73.1
..___tag_value_main.33:                                         #
                                # LOE rbx
..B1.28:                        # Preds ..B1.5 Latency 9
        lea       (%rsp), %r12                                  #73.1 c1
        lea       .2.7_2__offload_var_desc1_p.125(%rip), %rsi   #73.1 c1
        movq      %r12, %rdi                                    #73.1 c5
        movl      $192, %edx                                    #73.1 c5
        call      _intel_fast_memcpy@PLT                        #73.1 c9
                                # LOE rbx r12
..B1.27:                        # Preds ..B1.28 Latency 45
        lea       192(%rsp), %rcx                               #73.1 c1
        lea       328(%rsp), %rdx                               #73.1 c1
        movq      .2.7_2__offload_var_desc2_p.130(%rip), %r8    #73.1 c5
        movq      8+.2.7_2__offload_var_desc2_p.130(%rip), %r9  #73.1 c5
        movq      16+.2.7_2__offload_var_desc2_p.130(%rip), %r10 #73.1 c9
        movq      24+.2.7_2__offload_var_desc2_p.130(%rip), %r11 #73.1 c9
        movq      32+.2.7_2__offload_var_desc2_p.130(%rip), %r13 #73.1 c13
        movq      40+.2.7_2__offload_var_desc2_p.130(%rip), %r14 #73.1 c13
        lea       320(%rsp), %r15                               #73.1 c17
        movq      %rdx, 184(%rsp)                               #73.1 c17
        movq      %rbx, %rdi                                    #73.1 c21
        movl      $3, %esi                                      #73.1 c21
        movq      %r12, %rdx                                    #73.1 c25
        xorl      %eax, %eax                                    #73.1 c25
        movq      %r8, (%rcx)                                   #73.1 c29
        movq      %r9, 8(%rcx)                                  #73.1 c29
        movq      %r10, 16(%rcx)                                #73.1 c33
        movq      %r11, 24(%rcx)                                #73.1 c33
        movq      %r13, 32(%rcx)                                #73.1 c37
        movq      %r14, 40(%rcx)                                #73.1 c37
        movq      %r15, 56(%r12)                                #73.1 c41
        movq      %r15, 120(%rsp)                               #73.1 c41
..___tag_value_main.38:                                         #73.1
        call      __offload_target_enter@PLT                    #73.1
..___tag_value_main.39:                                         #
                                # LOE rbx
..B1.6:                         # Preds ..B1.27 Latency 9
        movq      320(%rsp), %r13                               #73.1 c1
        movq      328(%rsp), %r12                               #73.1 c1
        movq      %r13, %rdi                                    #75.2 c5
        movq      %r12, %rsi                                    #75.2 c5
..___tag_value_main.40:                                         #75.2
        call      _Z13hostmic_scalePdl@PLT                      #75.2
..___tag_value_main.41:                                         #
                                # LOE rbx r12 r13
..B1.7:                         # Preds ..B1.6 Latency 9
        movq      %rbx, %rdi                                    #73.1 c1
        xorl      %eax, %eax                                    #73.1 c1
        movq      %r12, 328(%rsp)                               #73.1 c5
        movq      %r13, 320(%rsp)                               #73.1 c5
..___tag_value_main.42:                                         #73.1
        call      __offload_target_leave@PLT                    #73.1
..___tag_value_main.43:                                         #
                                # LOE
..B1.8:                         # Preds ..B1.7 Latency 17
        movq      336(%rsp), %r15                               #73.1 c1
..___tag_value_main.44:                                         #
        xorl      %eax, %eax                                    #73.1 c1
        movq      344(%rsp), %r14                               #73.1 c5
..___tag_value_main.45:                                         #
        movq      352(%rsp), %r13                               #73.1 c5
..___tag_value_main.46:                                         #
        movq      360(%rsp), %r12                               #73.1 c9
..___tag_value_main.47:                                         #
        movq      368(%rsp), %rbx                               #73.1 c9
..___tag_value_main.48:                                         #
        movq      %rbp, %rsp                                    #73.1 c17
        popq      %rbp                                          #73.1
..___tag_value_main.49:                                         #
        ret                                                     #73.1
..___tag_value_main.51:                                         #
                                # LOE
	.type	__offload_entry_leibniz_offl_cpp_73main,@function
	.size	__offload_entry_leibniz_offl_cpp_73main,.-__offload_entry_leibniz_offl_cpp_73main
__offload_entry_leibniz_offl_cpp_70main:
# parameter 1: %rdi
..B1.9:                         # Preds ..B1.0 Latency 21
        pushq     %rbp                                          #70.1
..___tag_value_main.53:                                         #
        movq      %rsp, %rbp                                    #70.1
..___tag_value_main.54:                                         #
        andq      $-128, %rsp                                   #70.1
        subq      $384, %rsp                                    #70.1 c1
        movq      %r12, 360(%rsp)                               #70.1 c5
..___tag_value_main.56:                                         #
        movq      %rdi, %r12                                    #70.1 c5
        xorl      %edi, %edi                                    #70.1 c9
        movq      %rbx, 368(%rsp)                               #70.1 c9
        movq      %r15, 336(%rsp)                               #70.1 c13
        movq      %r14, 344(%rsp)                               #70.1 c13
        movq      %r13, 352(%rsp)                               #70.1 c17
..___tag_value_main.57:                                         #70.1
        call      __intel_new_proc_init_R@PLT                   #70.1
..___tag_value_main.58:                                         #
                                # LOE r12
..B1.30:                        # Preds ..B1.9 Latency 9
        lea       (%rsp), %rbx                                  #70.1 c1
        lea       .2.7_2__offload_var_desc1_p.101(%rip), %rsi   #70.1 c1
        movq      %rbx, %rdi                                    #70.1 c5
        movl      $256, %edx                                    #70.1 c5
        call      _intel_fast_memcpy@PLT                        #70.1 c9
                                # LOE rbx r12
..B1.29:                        # Preds ..B1.30 Latency 1
        lea       256(%rsp), %rcx                               #70.1 c1
        movl      $64, %r9d                                     #70.1 c1
                                # LOE rcx rbx r9 r12
..B1.21:                        # Preds ..B1.21 ..B1.29 Latency 21
        lea       .2.7_2__offload_var_desc2_p.106(%rip), %rdi   #70.1 c1
        movq      -8(%r9,%rdi), %rax                            #70.1 c5
        movq      -16(%r9,%rdi), %rdx                           #70.1 c5
        movq      -24(%r9,%rdi), %rsi                           #70.1 c9
        movq      -32(%r9,%rdi), %r8                            #70.1 c9
        movq      %rax, -8(%rcx,%r9)                            #70.1 c13
        movq      %rdx, -16(%rcx,%r9)                           #70.1 c13
        movq      %rsi, -24(%rcx,%r9)                           #70.1 c17
        movq      %r8, -32(%rcx,%r9)                            #70.1 c17
        subq      $32, %r9                                      #70.1 c21
        jne       ..B1.21       # Prob 50%                      #70.1 c21
                                # LOE rcx rbx r9 r12
..B1.20:                        # Preds ..B1.21 Latency 25
        lea       320(%rsp), %r8                                #70.1 c1
        lea       328(%rsp), %r9                                #70.1 c1
        movq      %r12, %rdi                                    #70.1 c5
        movl      $4, %esi                                      #70.1 c5
        movq      %rbx, %rdx                                    #70.1 c9
        xorl      %eax, %eax                                    #70.1 c9
        movq      %r8, 56(%rbx)                                 #70.1 c13
        movq      %r8, 120(%rsp)                                #70.1 c13
        movq      %r8, 184(%rsp)                                #70.1 c17
        movb      %bl, %bl                                      #70.1 c17
        movq      %r9, 248(%rsp)                                #70.1 c21
..___tag_value_main.63:                                         #70.1
        call      __offload_target_enter@PLT                    #70.1
..___tag_value_main.64:                                         #
                                # LOE r12
..B1.10:                        # Preds ..B1.20 Latency 9
        movq      320(%rsp), %r13                               #70.1 c1
        movq      328(%rsp), %rbx                               #70.1 c1
        movq      %r13, %rdi                                    #71.2 c5
        movq      %rbx, %rsi                                    #71.2 c5
..___tag_value_main.65:                                         #71.2
        call      _Z13hostmic_scalePdl@PLT                      #71.2
..___tag_value_main.66:                                         #
                                # LOE rbx r12 r13
..B1.11:                        # Preds ..B1.10 Latency 9
        movq      %r12, %rdi                                    #70.1 c1
        xorl      %eax, %eax                                    #70.1 c1
        movq      %rbx, 328(%rsp)                               #70.1 c5
        movq      %r13, 320(%rsp)                               #70.1 c5
..___tag_value_main.67:                                         #70.1
        call      __offload_target_leave@PLT                    #70.1
..___tag_value_main.68:                                         #
                                # LOE
..B1.12:                        # Preds ..B1.11 Latency 17
        movq      336(%rsp), %r15                               #70.1 c1
..___tag_value_main.69:                                         #
        xorl      %eax, %eax                                    #70.1 c1
        movq      344(%rsp), %r14                               #70.1 c5
..___tag_value_main.70:                                         #
        movq      352(%rsp), %r13                               #70.1 c5
..___tag_value_main.71:                                         #
        movq      360(%rsp), %r12                               #70.1 c9
..___tag_value_main.72:                                         #
        movq      368(%rsp), %rbx                               #70.1 c9
..___tag_value_main.73:                                         #
        movq      %rbp, %rsp                                    #70.1 c17
        popq      %rbp                                          #70.1
..___tag_value_main.74:                                         #
        ret                                                     #70.1
..___tag_value_main.76:                                         #
                                # LOE
	.type	__offload_entry_leibniz_offl_cpp_70main,@function
	.size	__offload_entry_leibniz_offl_cpp_70main,.-__offload_entry_leibniz_offl_cpp_70main
__offload_entry_leibniz_offl_cpp_66main:
# parameter 1: %rdi
..B1.13:                        # Preds ..B1.0 Latency 21
        pushq     %rbp                                          #66.1
..___tag_value_main.78:                                         #
        movq      %rsp, %rbp                                    #66.1
..___tag_value_main.79:                                         #
        andq      $-128, %rsp                                   #66.1
        subq      $384, %rsp                                    #66.1 c1
        movq      %rbx, 368(%rsp)                               #66.1 c5
..___tag_value_main.81:                                         #
        movq      %rdi, %rbx                                    #66.1 c5
        xorl      %edi, %edi                                    #66.1 c9
        movq      %r15, 336(%rsp)                               #66.1 c9
        movq      %r14, 344(%rsp)                               #66.1 c13
        movq      %r13, 352(%rsp)                               #66.1 c13
        movq      %r12, 360(%rsp)                               #66.1 c17
..___tag_value_main.82:                                         #66.1
        call      __intel_new_proc_init_R@PLT                   #66.1
..___tag_value_main.83:                                         #
                                # LOE rbx
..B1.31:                        # Preds ..B1.13 Latency 1
        lea       (%rsp), %rdx                                  #66.1 c1
        movl      $128, %r9d                                    #66.1 c1
                                # LOE rdx rbx r9
..B1.23:                        # Preds ..B1.23 ..B1.31 Latency 21
        lea       .2.7_2__offload_var_desc1_p.77(%rip), %rdi    #66.1 c1
        movq      -8(%r9,%rdi), %rax                            #66.1 c5
        movq      -16(%r9,%rdi), %rcx                           #66.1 c5
        movq      -24(%r9,%rdi), %rsi                           #66.1 c9
        movq      -32(%r9,%rdi), %r8                            #66.1 c9
        movq      %rax, -8(%rdx,%r9)                            #66.1 c13
        movq      %rcx, -16(%rdx,%r9)                           #66.1 c13
        movq      %rsi, -24(%rdx,%r9)                           #66.1 c17
        movq      %r8, -32(%rdx,%r9)                            #66.1 c17
        subq      $32, %r9                                      #66.1 c21
        jne       ..B1.23       # Prob 75%                      #66.1 c21
                                # LOE rdx rbx r9
..B1.22:                        # Preds ..B1.23 Latency 33
        lea       128(%rsp), %rcx                               #66.1 c1
        movq      .2.7_2__offload_var_desc2_p.82(%rip), %r8     #66.1 c1
        movq      8+.2.7_2__offload_var_desc2_p.82(%rip), %r9   #66.1 c5
        movq      16+.2.7_2__offload_var_desc2_p.82(%rip), %r10 #66.1 c5
        movq      24+.2.7_2__offload_var_desc2_p.82(%rip), %r11 #66.1 c9
        lea       320(%rsp), %r12                               #66.1 c9
        movq      %rbx, %rdi                                    #66.1 c13
        movl      $2, %esi                                      #66.1 c13
        xorl      %eax, %eax                                    #66.1 c17
        movq      %r8, (%rcx)                                   #66.1 c17
        movq      %r9, 8(%rcx)                                  #66.1 c21
        movq      %r10, 16(%rcx)                                #66.1 c21
        movq      %r11, 24(%rcx)                                #66.1 c25
        movq      %r12, 56(%rdx)                                #66.1 c25
        movq      %r12, 120(%rsp)                               #66.1 c29
..___tag_value_main.88:                                         #66.1
        call      __offload_target_enter@PLT                    #66.1
..___tag_value_main.89:                                         #
                                # LOE rbx
..B1.14:                        # Preds ..B1.22 Latency 5
        movq      %rbx, %rdi                                    #66.1 c1
        xorl      %eax, %eax                                    #66.1 c1
..___tag_value_main.90:                                         #66.1
        call      __offload_target_leave@PLT                    #66.1
..___tag_value_main.91:                                         #
                                # LOE
..B1.15:                        # Preds ..B1.14 Latency 17
        movq      336(%rsp), %r15                               #66.1 c1
..___tag_value_main.92:                                         #
        xorl      %eax, %eax                                    #66.1 c1
        movq      344(%rsp), %r14                               #66.1 c5
..___tag_value_main.93:                                         #
        movq      352(%rsp), %r13                               #66.1 c5
..___tag_value_main.94:                                         #
        movq      360(%rsp), %r12                               #66.1 c9
..___tag_value_main.95:                                         #
        movq      368(%rsp), %rbx                               #66.1 c9
..___tag_value_main.96:                                         #
        movq      %rbp, %rsp                                    #66.1 c17
        popq      %rbp                                          #66.1
..___tag_value_main.97:                                         #
        ret                                                     #66.1
..___tag_value_main.99:                                         #
                                # LOE
	.type	__offload_entry_leibniz_offl_cpp_66main,@function
	.size	__offload_entry_leibniz_offl_cpp_66main,.-__offload_entry_leibniz_offl_cpp_66main
	.globl main
main:
..B1.16:                        # Preds ..B1.0 Latency 17
        pushq     %rbp                                          #50.11
..___tag_value_main.101:                                        #
        movq      %rsp, %rbp                                    #50.11
..___tag_value_main.102:                                        #
        andq      $-128, %rsp                                   #50.11
        subq      $384, %rsp                                    #50.11 c1
        xorl      %edi, %edi                                    #50.11 c1
        movq      %rbx, 368(%rsp)                               #50.11 c5
        movq      %r15, 336(%rsp)                               #50.11 c5
        movq      %r14, 344(%rsp)                               #50.11 c9
        movq      %r13, 352(%rsp)                               #50.11 c9
        movq      %r12, 360(%rsp)                               #50.11 c13
..___tag_value_main.104:                                        #50.11
        call      __intel_new_proc_init_R@PLT                   #50.11
..___tag_value_main.105:                                        #
                                # LOE
..B1.32:                        # Preds ..B1.16 Latency 17
        movq      336(%rsp), %r15                               #50.11 c1
..___tag_value_main.111:                                        #
        xorl      %eax, %eax                                    #50.11 c1
        movq      344(%rsp), %r14                               #50.11 c5
..___tag_value_main.112:                                        #
        movq      352(%rsp), %r13                               #50.11 c5
..___tag_value_main.113:                                        #
        movq      360(%rsp), %r12                               #50.11 c9
..___tag_value_main.114:                                        #
        movq      368(%rsp), %rbx                               #50.11 c9
..___tag_value_main.115:                                        #
        movq      %rbp, %rsp                                    #50.11 c17
        popq      %rbp                                          #50.11
..___tag_value_main.116:                                        #
        ret                                                     #50.11
..___tag_value_main.118:                                        #
                                # LOE
L_main_58__par_loop0_2.42:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B1.17:                        # Preds ..B1.0 Latency 29
        pushq     %rbp                                          #58.1
..___tag_value_main.120:                                        #
        movq      %rsp, %rbp                                    #58.1
..___tag_value_main.121:                                        #
        andq      $-128, %rsp                                   #58.1
        subq      $384, %rsp                                    #58.1 c1
        xorl      %eax, %eax                                    #50.11 c1
        movq      %rbx, 368(%rsp)                               #58.1 c5
        movq      %r15, 336(%rsp)                               #58.1 c5
        movq      %r14, 344(%rsp)                               #58.1 c9
        movq      336(%rsp), %r15                               #50.11 c9
..___tag_value_main.123:                                        #
        movq      %r13, 352(%rsp)                               #58.1 c13
        movq      344(%rsp), %r14                               #50.11 c13
..___tag_value_main.125:                                        #
        movq      %r12, 360(%rsp)                               #58.1 c17
        movq      352(%rsp), %r13                               #50.11 c17
..___tag_value_main.127:                                        #
        movq      360(%rsp), %r12                               #50.11 c21
..___tag_value_main.129:                                        #
        movq      368(%rsp), %rbx                               #50.11 c21
..___tag_value_main.130:                                        #
        movq      %rbp, %rsp                                    #50.11 c29
        popq      %rbp                                          #50.11
..___tag_value_main.131:                                        #
        ret                                                     #50.11
        .align    16,0x90
..___tag_value_main.133:                                        #
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.section .gcc_except_table, "a"
	.align 4
main$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value_main.137 - ..___tag_value_main.136
..___tag_value_main.136:
	.byte	1
	.uleb128	..___tag_value_main.135 - ..___tag_value_main.134
..___tag_value_main.134:
	.uleb128	..___tag_value_main.7 - ..___tag_value_main.1
	.uleb128	..___tag_value_main.105 - ..___tag_value_main.7
	.byte	0
	.byte	0
..___tag_value_main.135:
	.long	0
..___tag_value_main.137:
	.data
	.align 8
	.align 8
.2.7_2__offload_var_desc1_p.77:
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
.2.7_2__offload_var_desc2_p.82:
	.quad	__sd_2inst_string.1
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.2
	.long	0x00000000,0x00000000
	.align 8
.2.7_2__offload_var_desc1_p.101:
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
.2.7_2__offload_var_desc2_p.106:
	.quad	__sd_2inst_string.4
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.5
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.6
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.7
	.long	0x00000000,0x00000000
	.align 8
.2.7_2__offload_var_desc1_p.125:
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
.2.7_2__offload_var_desc2_p.130:
	.quad	__sd_2inst_string.9
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.10
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.11
	.long	0x00000000,0x00000000
	.align 8
.2.7_2__offload_var_desc1_p.150:
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
.2.7_2__offload_var_desc2_p.155:
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
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	54
	.byte	54
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
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
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	55
	.byte	48
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
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
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	55
	.byte	51
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
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
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	56
	.byte	48
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_offl_cpp_66main_$entry,comdat
	.align 16
__offload_entry_leibniz_offl_cpp_66main_$entry:
	.type	__offload_entry_leibniz_offl_cpp_66main_$entry,@object
	.size	__offload_entry_leibniz_offl_cpp_66main_$entry,16
	.quad	__sd_2inst_string.0
	.quad	__offload_entry_leibniz_offl_cpp_66main
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_offl_cpp_70main_$entry,comdat
	.align 16
__offload_entry_leibniz_offl_cpp_70main_$entry:
	.type	__offload_entry_leibniz_offl_cpp_70main_$entry,@object
	.size	__offload_entry_leibniz_offl_cpp_70main_$entry,16
	.quad	__sd_2inst_string.3
	.quad	__offload_entry_leibniz_offl_cpp_70main
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_offl_cpp_73main_$entry,comdat
	.align 16
__offload_entry_leibniz_offl_cpp_73main_$entry:
	.type	__offload_entry_leibniz_offl_cpp_73main_$entry,@object
	.size	__offload_entry_leibniz_offl_cpp_73main_$entry,16
	.quad	__sd_2inst_string.8
	.quad	__offload_entry_leibniz_offl_cpp_73main
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_offl_cpp_80main_$entry,comdat
	.align 16
__offload_entry_leibniz_offl_cpp_80main_$entry:
	.type	__offload_entry_leibniz_offl_cpp_80main_$entry,@object
	.size	__offload_entry_leibniz_offl_cpp_80main_$entry,16
	.quad	__sd_2inst_string.12
	.quad	__offload_entry_leibniz_offl_cpp_80main
	.data
# -- End  main, L_main_58__par_loop0_2.42, __offload_entry_leibniz_offl_cpp_66main, __offload_entry_leibniz_offl_cpp_70main, __offload_entry_leibniz_offl_cpp_73main, __offload_entry_leibniz_offl_cpp_80main
	.text
# -- Begin  _Z13hostmic_scalePdl, L__Z13hostmic_scalePdl_29__par_loop0_2.192, L__Z13hostmic_scalePdl_33__par_region1_2.212
# mark_begin;
# Threads 4
        .align    16,0x90
	.globl _Z13hostmic_scalePdl
_Z13hostmic_scalePdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.1:                         # Preds ..B2.0 Latency 25
..___tag_value__Z13hostmic_scalePdl.138:                        #26.40
        pushq     %rbp                                          #26.40
..___tag_value__Z13hostmic_scalePdl.140:                        #
        movq      %rsp, %rbp                                    #26.40
..___tag_value__Z13hostmic_scalePdl.141:                        #
        andq      $-64, %rsp                                    #26.40
        subq      $128, %rsp                                    #26.40 c1
        movq      %rdi, %rdx                                    #26.40 c1
        movq      %rsi, 48(%rsp)                                #26.40 c5
        lea       .L_2__STRING.1(%rip), %rdi                    #27.2 c5
        movq      %rdx, %rsi                                    #27.2 c9
        xorl      %eax, %eax                                    #27.2 c9
        movq      %rbx, 40(%rsp)                                #26.40 c13
        movq      %r15, 8(%rsp)                                 #26.40 c13
        movq      %r14, 16(%rsp)                                #26.40 c17
        movq      %r13, 24(%rsp)                                #26.40 c17
        movq      %r12, 32(%rsp)                                #26.40 c21
        movq      %rdx, (%rsp)                                  #26.40 c21
..___tag_value__Z13hostmic_scalePdl.143:                        #27.2
        call      printf@PLT                                    #27.2
..___tag_value__Z13hostmic_scalePdl.144:                        #
                                # LOE
..B2.2:                         # Preds ..B2.1 Latency 5
        lea       .2.8_2_kmpc_loc_struct_pack.177(%rip), %rdi   #29.1 c1
        call      __kmpc_global_thread_num@PLT                  #29.1 c5
                                # LOE eax
..B2.44:                        # Preds ..B2.2 Latency 9
        movl      %eax, 56(%rsp)                                #29.1 c1
        lea       .2.8_2_kmpc_loc_struct_pack.194(%rip), %rdi   #29.1 c1
        xorl      %eax, %eax                                    #29.1 c5
..___tag_value__Z13hostmic_scalePdl.150:                        #29.1
        call      __kmpc_ok_to_fork@PLT                         #29.1
..___tag_value__Z13hostmic_scalePdl.151:                        #
                                # LOE eax
..B2.3:                         # Preds ..B2.44 Latency 1
        testl     %eax, %eax                                    #29.1 c1
        je        ..B2.5        # Prob 50%                      #29.1 c1
                                # LOE
..B2.4:                         # Preds ..B2.3 Latency 14
        lea       L__Z13hostmic_scalePdl_29__par_loop0_2.192(%rip), %rdx #29.1 c1
        lea       48(%rsp), %rcx                                #29.1 c1
        lea       (%rsp), %r8                                   #29.1 c5
        lea       .2.8_2_kmpc_loc_struct_pack.194(%rip), %rdi   #29.1 c5
        pushq     $2                                            #29.1 c9
        popq      %rsi                                          #29.1
        xorl      %eax, %eax                                    #29.1 c9
..___tag_value__Z13hostmic_scalePdl.152:                        #29.1
        call      __kmpc_fork_call@PLT                          #29.1
..___tag_value__Z13hostmic_scalePdl.153:                        #
        jmp       ..B2.8        # Prob 100%                     #29.1 c13
                                # LOE
..B2.5:                         # Preds ..B2.3 Latency 9
        movl      56(%rsp), %esi                                #29.1 c1
        lea       .2.8_2_kmpc_loc_struct_pack.194(%rip), %rdi   #29.1 c1
        xorl      %eax, %eax                                    #29.1 c5
..___tag_value__Z13hostmic_scalePdl.154:                        #29.1
        call      __kmpc_serialized_parallel@PLT                #29.1
..___tag_value__Z13hostmic_scalePdl.155:                        #
                                # LOE
..B2.6:                         # Preds ..B2.5 Latency 9
        lea       56(%rsp), %rdi                                #29.1 c1
        lea       ___kmpv_zero_Z13hostmic_scalePdl_0(%rip), %rsi #29.1 c1
        lea       48(%rsp), %rdx                                #29.1 c5
        lea       (%rsp), %rcx                                  #29.1 c5
..___tag_value__Z13hostmic_scalePdl.156:                        #29.1
        call      L__Z13hostmic_scalePdl_29__par_loop0_2.192    #29.1
..___tag_value__Z13hostmic_scalePdl.157:                        #
                                # LOE
..B2.7:                         # Preds ..B2.6 Latency 9
        movl      56(%rsp), %esi                                #29.1 c1
        lea       .2.8_2_kmpc_loc_struct_pack.194(%rip), %rdi   #29.1 c1
        xorl      %eax, %eax                                    #29.1 c5
..___tag_value__Z13hostmic_scalePdl.158:                        #29.1
        call      __kmpc_end_serialized_parallel@PLT            #29.1
..___tag_value__Z13hostmic_scalePdl.159:                        #
                                # LOE
..B2.8:                         # Preds ..B2.7 ..B2.4 Latency 5
        lea       .2.8_2_kmpc_loc_struct_pack.214(%rip), %rdi   #33.1 c1
        xorl      %eax, %eax                                    #33.1 c1
..___tag_value__Z13hostmic_scalePdl.160:                        #33.1
        call      __kmpc_ok_to_fork@PLT                         #33.1
..___tag_value__Z13hostmic_scalePdl.161:                        #
                                # LOE eax
..B2.9:                         # Preds ..B2.8 Latency 1
        testl     %eax, %eax                                    #33.1 c1
        je        ..B2.11       # Prob 50%                      #33.1 c1
                                # LOE
..B2.10:                        # Preds ..B2.9 Latency 10
        lea       L__Z13hostmic_scalePdl_33__par_region1_2.212(%rip), %rdx #33.1 c1
        lea       .2.8_2_kmpc_loc_struct_pack.214(%rip), %rdi   #33.1 c1
        xorl      %esi, %esi                                    #33.1 c5
        xorl      %eax, %eax                                    #33.1 c5
..___tag_value__Z13hostmic_scalePdl.162:                        #33.1
        call      __kmpc_fork_call@PLT                          #33.1
..___tag_value__Z13hostmic_scalePdl.163:                        #
        jmp       ..B2.14       # Prob 100%                     #33.1 c9
                                # LOE
..B2.11:                        # Preds ..B2.9 Latency 9
        movl      56(%rsp), %esi                                #33.1 c1
        lea       .2.8_2_kmpc_loc_struct_pack.214(%rip), %rdi   #33.1 c1
        xorl      %eax, %eax                                    #33.1 c5
..___tag_value__Z13hostmic_scalePdl.164:                        #33.1
        call      __kmpc_serialized_parallel@PLT                #33.1
..___tag_value__Z13hostmic_scalePdl.165:                        #
                                # LOE
..B2.12:                        # Preds ..B2.11 Latency 5
        lea       56(%rsp), %rdi                                #33.1 c1
        lea       ___kmpv_zero_Z13hostmic_scalePdl_1(%rip), %rsi #33.1 c1
..___tag_value__Z13hostmic_scalePdl.166:                        #33.1
        call      L__Z13hostmic_scalePdl_33__par_region1_2.212  #33.1
..___tag_value__Z13hostmic_scalePdl.167:                        #
                                # LOE
..B2.13:                        # Preds ..B2.12 Latency 9
        movl      56(%rsp), %esi                                #33.1 c1
        lea       .2.8_2_kmpc_loc_struct_pack.214(%rip), %rdi   #33.1 c1
        xorl      %eax, %eax                                    #33.1 c5
..___tag_value__Z13hostmic_scalePdl.168:                        #33.1
        call      __kmpc_end_serialized_parallel@PLT            #33.1
..___tag_value__Z13hostmic_scalePdl.169:                        #
                                # LOE
..B2.14:                        # Preds ..B2.10 ..B2.13 Latency 13
        movq      8(%rsp), %r15                                 #36.1 c1
..___tag_value__Z13hostmic_scalePdl.170:                        #
        movq      16(%rsp), %r14                                #36.1 c1
..___tag_value__Z13hostmic_scalePdl.171:                        #
        movq      24(%rsp), %r13                                #36.1 c5
..___tag_value__Z13hostmic_scalePdl.172:                        #
        movq      32(%rsp), %r12                                #36.1 c5
..___tag_value__Z13hostmic_scalePdl.173:                        #
        movq      40(%rsp), %rbx                                #36.1 c9
..___tag_value__Z13hostmic_scalePdl.174:                        #
        movq      %rbp, %rsp                                    #36.1 c13
        popq      %rbp                                          #36.1
..___tag_value__Z13hostmic_scalePdl.175:                        #
        ret                                                     #36.1
..___tag_value__Z13hostmic_scalePdl.177:                        #
                                # LOE
L__Z13hostmic_scalePdl_33__par_region1_2.212:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.15:                        # Preds ..B2.0 Latency 25
        pushq     %rbp                                          #33.1
..___tag_value__Z13hostmic_scalePdl.179:                        #
        movq      %rsp, %rbp                                    #33.1
..___tag_value__Z13hostmic_scalePdl.180:                        #
        andq      $-64, %rsp                                    #33.1
        subq      $128, %rsp                                    #33.1 c1
        xorl      %eax, %eax                                    #34.1 c1
        movq      %rbx, 40(%rsp)                                #33.1 c5
..___tag_value__Z13hostmic_scalePdl.182:                        #
        lea       .2.8_2_kmpc_loc_struct_pack.185(%rip), %rbx   #34.1 c5
        movq      %r12, 32(%rsp)                                #33.1 c9
..___tag_value__Z13hostmic_scalePdl.183:                        #
        movl      (%rdi), %r12d                                 #33.1 c9
        movq      %rbx, %rdi                                    #34.1 c13
        movl      %r12d, %esi                                   #34.1 c13
        movq      %r15, 8(%rsp)                                 #33.1 c17
        movq      %r14, 16(%rsp)                                #33.1 c17
        movq      %r13, 24(%rsp)                                #33.1 c21
..___tag_value__Z13hostmic_scalePdl.184:                        #34.1
        call      __kmpc_master@PLT                             #34.1
..___tag_value__Z13hostmic_scalePdl.185:                        #
                                # LOE rbx eax r12d
..B2.16:                        # Preds ..B2.15 Latency 1
        cmpl      $1, %eax                                      #34.1 c1
        jne       ..B2.20       # Prob 50%                      #34.1 c1
                                # LOE rbx r12d
..B2.17:                        # Preds ..B2.16 Latency 1
        call      omp_get_num_threads@PLT                       #35.37 c1
                                # LOE rbx eax r12d
..B2.18:                        # Preds ..B2.17 Latency 9
        lea       .L_2__STRING.2(%rip), %rdi                    #35.2 c1
        movl      %eax, %esi                                    #35.2 c1
        xorl      %eax, %eax                                    #35.2 c5
..___tag_value__Z13hostmic_scalePdl.189:                        #35.2
        call      printf@PLT                                    #35.2
..___tag_value__Z13hostmic_scalePdl.190:                        #
                                # LOE rbx r12d
..B2.19:                        # Preds ..B2.18 Latency 9
        movq      %rbx, %rdi                                    #34.1 c1
        movl      %r12d, %esi                                   #34.1 c1
        xorl      %eax, %eax                                    #34.1 c5
..___tag_value__Z13hostmic_scalePdl.191:                        #34.1
        call      __kmpc_end_master@PLT                         #34.1
..___tag_value__Z13hostmic_scalePdl.192:                        #
                                # LOE
..B2.20:                        # Preds ..B2.19 ..B2.16 Latency 13
        movq      8(%rsp), %r15                                 #33.1 c1
..___tag_value__Z13hostmic_scalePdl.193:                        #
        movq      16(%rsp), %r14                                #33.1 c1
..___tag_value__Z13hostmic_scalePdl.194:                        #
        movq      24(%rsp), %r13                                #33.1 c5
..___tag_value__Z13hostmic_scalePdl.195:                        #
        movq      32(%rsp), %r12                                #33.1 c5
..___tag_value__Z13hostmic_scalePdl.196:                        #
        movq      40(%rsp), %rbx                                #33.1 c9
..___tag_value__Z13hostmic_scalePdl.197:                        #
        movq      %rbp, %rsp                                    #33.1 c13
        popq      %rbp                                          #33.1
..___tag_value__Z13hostmic_scalePdl.198:                        #
        ret                                                     #33.1
..___tag_value__Z13hostmic_scalePdl.200:                        #
                                # LOE
L__Z13hostmic_scalePdl_29__par_loop0_2.192:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B2.21:                        # Preds ..B2.0 Latency 21
        pushq     %rbp                                          #29.1
..___tag_value__Z13hostmic_scalePdl.202:                        #
        movq      %rsp, %rbp                                    #29.1
..___tag_value__Z13hostmic_scalePdl.203:                        #
        andq      $-64, %rsp                                    #29.1
        subq      $128, %rsp                                    #29.1 c1
        movq      %rbx, 40(%rsp)                                #29.1 c5
..___tag_value__Z13hostmic_scalePdl.205:                        #
        movq      (%rdx), %rbx                                  #29.1 c5
        movq      %r15, 8(%rsp)                                 #29.1 c9
        testq     %rbx, %rbx                                    #30.20 c9
        movq      %r14, 16(%rsp)                                #29.1 c13
        movq      %r13, 24(%rsp)                                #29.1 c13
        movq      %r12, 32(%rsp)                                #29.1 c17
..___tag_value__Z13hostmic_scalePdl.206:                        #
        movl      (%rdi), %r13d                                 #29.1 c17
        movq      (%rcx), %r12                                  #29.1 c21
        jle       ..B2.39       # Prob 10%                      #30.20 c21
                                # LOE rbx r12 r13d
..B2.22:                        # Preds ..B2.21 Latency 45
        movq      $0, 48(%rsp)                                  #29.1 c1
        movl      $0, 72(%rsp)                                  #29.1 c5
        decq      %rbx                                          #29.1 c9
        movl      $1, %r11d                                     #29.1 c9
        movq      %rbx, 56(%rsp)                                #29.1 c13
        lea       .2.8_2_kmpc_loc_struct_pack.194(%rip), %rdi   #29.1 c13
        movq      %r11, 64(%rsp)                                #29.1 c17
        addq      $-32, %rsp                                    #29.1 c17
        lea       96(%rsp), %r10                                #29.1 c21
        movl      %r13d, %esi                                   #29.1 c21
        movl      $34, %edx                                     #29.1 c25
        lea       104(%rsp), %rcx                               #29.1 c25
        lea       80(%rsp), %r8                                 #29.1 c29
        lea       88(%rsp), %r9                                 #29.1 c29
        xorl      %eax, %eax                                    #29.1 c33
        movq      %r10, (%rsp)                                  #29.1 c33
        movq      %r11, 8(%rsp)                                 #29.1 c37
        movq      %r11, 16(%rsp)                                #29.1 c41
..___tag_value__Z13hostmic_scalePdl.210:                        #29.1
        call      __kmpc_for_static_init_8@PLT                  #29.1
..___tag_value__Z13hostmic_scalePdl.211:                        #
                                # LOE rbx r12 r13d
..B2.48:                        # Preds ..B2.22 Latency 1
        addq      $32, %rsp                                     #29.1 c1
                                # LOE rbx r12 r13d
..B2.23:                        # Preds ..B2.48 Latency 5
        movq      48(%rsp), %rdi                                #29.1 c1
        movq      56(%rsp), %rax                                #29.1 c1
        cmpq      %rbx, %rdi                                    #29.1 c5
        jg        ..B2.38       # Prob 50%                      #29.1 c5
                                # LOE rax rbx rdi r12 r13d
..B2.24:                        # Preds ..B2.23 Latency 9
        cmpq      %rbx, %rax                                    #29.1 c1
        jl        ..L212        # Prob 50%                      #29.1 c5
        movq      %rbx, %rax                                    #29.1
..L212:                                                         #
        cmpq      %rax, %rdi                                    #30.20 c9
        jg        ..B2.38       # Prob 50%                      #30.20 c9
                                # LOE rax rdi r12 r13d
..B2.25:                        # Preds ..B2.24 Latency 57
        lea       (%r12,%rdi,8), %rsi                           #31.3 c1
        xorl      %ecx, %ecx                                    #30.2 c1
        movq      %rsi, %rdx                                    #30.2 c5
        subq      %rdi, %rax                                    #30.2 c5
        andq      $63, %rdx                                     #30.2 c9
        incq      %rax                                          #30.2 c9
        subq      %rdx, %rcx                                    #30.2 c13
        addq      $64, %rcx                                     #30.2 c17
        shrq      $3, %rcx                                      #30.2 c21
        testq     %rdx, %rdx                                    #30.2 c21
        jne       ..L213        # Prob 50%                      #30.2 c25
        movq      %rdx, %rcx                                    #30.2
..L213:                                                         #
        xorl      %edx, %edx                                    #30.2 c25
        lea       32(%rcx), %rbx                                #30.2 c29
        cmpq      %rbx, %rax                                    #30.2 c33
        movq      %rax, %rbx                                    #30.2 c33
        jge       ..L214        # Prob 50%                      #30.2 c37
        movq      %rax, %rcx                                    #30.2
..L214:                                                         #
        subq      %rcx, %rbx                                    #30.2 c41
        andq      $31, %rbx                                     #30.2 c45
        negq      %rbx                                          #30.2 c49
        addq      %rax, %rbx                                    #30.2 c53
        cmpq      $1, %rcx                                      #30.2 c57
        jb        ..B2.29       # Prob 0%                       #30.2 c57
                                # LOE rax rdx rcx rbx rsi rdi r12 r13d
..B2.26:                        # Preds ..B2.25 Latency 9
        movl      $1, %r8d                                      #31.11 c1
        vbroadcastsd .L_2il0floatpacket.231(%rip), %zmm0        #31.11 c5
        kmov      %r8d, %k1                                     #31.11 c9
                                # LOE rax rdx rcx rbx rsi rdi r12 r13d zmm0 k1
..B2.27:                        # Preds ..B2.27 ..B2.26 Latency 13
        vmulpd    (%rsi,%rdx,8){1to8}, %zmm0, %zmm1{%k1}        #31.3 c1
        nop                                                     #31.3 c5
        vpackstorelpd %zmm1, (%rsi,%rdx,8){%k1}                 #31.3 c9
        incq      %rdx                                          #30.2 c9
        cmpq      %rcx, %rdx                                    #30.2 c13
        jb        ..B2.27       # Prob 82%                      #30.2 c13
                                # LOE rax rdx rcx rbx rsi rdi r12 r13d zmm0 k1
..B2.29:                        # Preds ..B2.27 ..B2.25 Latency 1
        cmpq      %rcx, %rax                                    #30.2 c1
        je        ..B2.38       # Prob 50%                      #30.2 c1
                                # LOE rax rcx rbx rsi rdi r12 r13d
..B2.30:                        # Preds ..B2.29 Latency 25
        vbroadcastsd .L_2il0floatpacket.231(%rip), %zmm5        #31.11 c1
        vprefetch0 (%rsi)                                       #30.2 c5
        movb      %al, %al                                      #30.2 c5
        vprefetch0 256(%rsi)                                    #30.2 c9
        movb      %al, %al                                      #30.2 c9
        vprefetch0 512(%rsi)                                    #30.2 c13
        movb      %al, %al                                      #30.2 c13
        vprefetch0 768(%rsi)                                    #30.2 c17
        movb      %al, %al                                      #30.2 c17
        vprefetch0 64(%rsi)                                     #30.2 c21
        movb      %al, %al                                      #30.2 c21
        vprefetch0 320(%rsi)                                    #30.2 c25
                                # LOE rax rcx rbx rsi rdi r12 r13d zmm5
..B2.31:                        # Preds ..B2.31 ..B2.30 Latency 37
        vmulpd    (%rsi,%rcx,8), %zmm5, %zmm0                   #31.3 c1
        vprefetche1 2048(%rsi,%rcx,8)                           #31.3 c1
        vmulpd    64(%rsi,%rcx,8), %zmm5, %zmm1                 #31.3 c5
        vprefetch0 1024(%rsi,%rcx,8)                            #31.3 c5
        vmulpd    128(%rsi,%rcx,8), %zmm5, %zmm2                #31.3 c9
        vprefetche1 2112(%rsi,%rcx,8)                           #31.3 c9
        vmulpd    192(%rsi,%rcx,8), %zmm5, %zmm3                #31.3 c13
        vprefetch0 1088(%rsi,%rcx,8)                            #31.3 c13
        vmovapd   %zmm0, (%rsi,%rcx,8)                          #31.3 c17
        vprefetche1 2176(%rsi,%rcx,8)                           #31.3 c17
        vmovapd   %zmm1, 64(%rsi,%rcx,8)                        #31.3 c21
        vprefetch0 1152(%rsi,%rcx,8)                            #31.3 c21
        vmovapd   %zmm2, 128(%rsi,%rcx,8)                       #31.3 c25
        vprefetche1 2240(%rsi,%rcx,8)                           #31.3 c25
        vmovapd   %zmm3, 192(%rsi,%rcx,8)                       #31.3 c29
        vprefetch0 1216(%rsi,%rcx,8)                            #31.3 c29
        addq      $32, %rcx                                     #30.2 c33
        cmpq      %rbx, %rcx                                    #30.2 c37
        jb        ..B2.31       # Prob 82%                      #30.2 c37
                                # LOE rax rcx rbx rsi rdi r12 r13d zmm5
..B2.32:                        # Preds ..B2.31 Latency 5
        lea       1(%rbx), %rdx                                 #30.2 c1
        cmpq      %rdx, %rax                                    #30.2 c5
        jb        ..B2.38       # Prob 50%                      #30.2 c5
                                # LOE rax rbx rdi r12 r13d zmm5
..B2.33:                        # Preds ..B2.32 Latency 29
        addq      %rbx, %rdi                                    #31.3 c1
        subq      %rbx, %rax                                    #30.2 c1
        movl      $21845, %ebx                                  #31.3 c5
        movq      %rax, (%rsp)                                  #30.2 c5
        kmov      %ebx, %k2                                     #31.3 c9
        movl      $43690, %ebx                                  #31.3 c9
        vpbroadcastq .L_2il0floatpacket.232(%rip), %zmm4        #30.2 c13
        vmovaps   .L_2il0floatpacket.233(%rip), %zmm3           #30.2 c17
        vpbroadcastq (%rsp), %zmm2                              #30.2 c21
        xorl      %ecx, %ecx                                    #30.2 c21
        vpxorq    %zmm1, %zmm1, %zmm1                           #31.3 c25
        lea       (%r12,%rdi,8), %rdx                           #31.3 c25
        vpxord    %zmm0, %zmm0, %zmm0                           #31.3 c29
        kmov      %ebx, %k1                                     #31.3 c29
                                # LOE rax rdx rcx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1 k2
..B2.34:                        # Preds ..B2.36 ..B2.33 Latency 57
        vpcmpud   $6, %zmm2, %zmm3, %k4                         #30.2 c1
        vpcmpud   $0, %zmm2, %zmm3, %k3                         #30.2 c5
        vpcmpgtd  %zmm2, %zmm3, %k0                             #30.2 c9
        kmov      %k4, %edi                                     #30.2 c9
        vmovaps   %zmm0, %zmm6                                  #30.2 c13
        kmov      %k3, %ebx                                     #30.2 c13
        addl      %edi, %edi                                    #30.2 c17
        kmov      %k0, %esi                                     #30.2 c17
        andl      %ebx, %edi                                    #30.2 c21
        orl       %esi, %edi                                    #30.2 c25
        andl      $-21846, %edi                                 #30.2 c29
        kmov      %edi, %k5                                     #30.2 c33
        vbroadcastss .L_2il0floatpacket.234(%rip), %zmm6{%k5}   #30.2 c37
        vcmpneqpd %zmm6, %zmm0, %k6                             #30.2 c41
        nop                                                     #30.2 c45
        knot      %k6, %k3                                      #30.2 c49
        knot      %k3, %k7                                      #30.2 c53
        jknzd     ..B2.40, %k7  # Prob 9%                       #30.2 c57
                                # LOE rax rdx rcx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1 k2 k3
..B2.35:                        # Preds ..B2.34 Latency 9
        vmulpd    (%rdx,%rcx,8), %zmm5, %zmm6                   #31.3 c1
        nop                                                     #31.3 c5
        vmovapd   %zmm6, (%rdx,%rcx,8)                          #31.3 c9
                                # LOE rax rdx rcx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1 k2
..B2.36:                        # Preds ..B2.40 ..B2.35 Latency 21
        vpaddsetcd %zmm4, %k3, %zmm3{%k2}                       #30.2 c1
        addq      $8, %rcx                                      #30.2 c1
        nop                                                     #30.2 c5
        kmov      %k3, %ebx                                     #30.2 c9
        addl      %ebx, %ebx                                    #30.2 c13
        kmov      %ebx, %k4                                     #30.2 c17
        cmpq      %rax, %rcx                                    #30.2 c17
        vpadcd    %zmm4, %k4, %zmm3{%k1}                        #30.2 c21
        jb        ..B2.34       # Prob 82%                      #30.2 c21
                                # LOE rax rdx rcx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1 k2
..B2.38:                        # Preds ..B2.36 ..B2.24 ..B2.29 ..B2.32 ..B2.23
                                #       Latency 9
        lea       .2.8_2_kmpc_loc_struct_pack.194(%rip), %rdi   #29.1 c1
        movl      %r13d, %esi                                   #29.1 c1
        xorl      %eax, %eax                                    #29.1 c5
..___tag_value__Z13hostmic_scalePdl.215:                        #29.1
        call      __kmpc_for_static_fini@PLT                    #29.1
..___tag_value__Z13hostmic_scalePdl.216:                        #
                                # LOE
..B2.39:                        # Preds ..B2.38 ..B2.21 Latency 13
        movq      8(%rsp), %r15                                 #29.1 c1
..___tag_value__Z13hostmic_scalePdl.217:                        #
        movq      16(%rsp), %r14                                #29.1 c1
..___tag_value__Z13hostmic_scalePdl.218:                        #
        movq      24(%rsp), %r13                                #29.1 c5
..___tag_value__Z13hostmic_scalePdl.219:                        #
        movq      32(%rsp), %r12                                #29.1 c5
..___tag_value__Z13hostmic_scalePdl.220:                        #
        movq      40(%rsp), %rbx                                #29.1 c9
..___tag_value__Z13hostmic_scalePdl.221:                        #
        movq      %rbp, %rsp                                    #29.1 c13
        popq      %rbp                                          #29.1
..___tag_value__Z13hostmic_scalePdl.222:                        #
        ret                                                     #29.1
..___tag_value__Z13hostmic_scalePdl.224:                        #
                                # LOE
..B2.40:                        # Preds ..B2.34                 # Infreq Latency 18
        vmovaps   %zmm1, %zmm6                                  #31.3 c1
        vmovapd   (%rdx,%rcx,8), %zmm6{%k3}                     #31.3 c5
        vmulpd    %zmm6, %zmm5, %zmm7                           #31.3 c9
        nop                                                     #31.3 c13
        vmovapd   %zmm7, (%rdx,%rcx,8){%k3}                     #31.3 c17
        jmp       ..B2.36       # Prob 100%                     #31.3 c17
        .align    16,0x90
..___tag_value__Z13hostmic_scalePdl.231:                        #
                                # LOE rax rdx rcx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1 k2
# mark_end;
	.type	_Z13hostmic_scalePdl,@function
	.size	_Z13hostmic_scalePdl,.-_Z13hostmic_scalePdl
	.section .gcc_except_table, "a"
	.align 4
_Z13hostmic_scalePdl$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value__Z13hostmic_scalePdl.235 - ..___tag_value__Z13hostmic_scalePdl.234
..___tag_value__Z13hostmic_scalePdl.234:
	.byte	1
	.uleb128	..___tag_value__Z13hostmic_scalePdl.233 - ..___tag_value__Z13hostmic_scalePdl.232
..___tag_value__Z13hostmic_scalePdl.232:
	.uleb128	..___tag_value__Z13hostmic_scalePdl.143 - ..___tag_value__Z13hostmic_scalePdl.138
	.uleb128	..___tag_value__Z13hostmic_scalePdl.144 - ..___tag_value__Z13hostmic_scalePdl.143
	.byte	0
	.byte	0
..___tag_value__Z13hostmic_scalePdl.233:
	.long	0
..___tag_value__Z13hostmic_scalePdl.235:
	.data
	.align 4
.2.8_2_kmpc_loc_struct_pack.177:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.8_2__kmpc_loc_pack.176
	.align 4
.2.8_2__kmpc_loc_pack.176:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	104
	.byte	111
	.byte	115
	.byte	116
	.byte	109
	.byte	105
	.byte	99
	.byte	95
	.byte	115
	.byte	99
	.byte	97
	.byte	108
	.byte	101
	.byte	59
	.byte	50
	.byte	57
	.byte	59
	.byte	50
	.byte	57
	.byte	59
	.byte	59
	.space 2, 0x00 	# pad
	.align 4
.2.8_2_kmpc_loc_struct_pack.194:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.8_2__kmpc_loc_pack.193
	.align 4
.2.8_2__kmpc_loc_pack.193:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	104
	.byte	111
	.byte	115
	.byte	116
	.byte	109
	.byte	105
	.byte	99
	.byte	95
	.byte	115
	.byte	99
	.byte	97
	.byte	108
	.byte	101
	.byte	59
	.byte	50
	.byte	57
	.byte	59
	.byte	51
	.byte	53
	.byte	59
	.byte	59
	.space 2, 0x00 	# pad
	.align 4
.2.8_2_kmpc_loc_struct_pack.214:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.8_2__kmpc_loc_pack.213
	.align 4
.2.8_2__kmpc_loc_pack.213:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	104
	.byte	111
	.byte	115
	.byte	116
	.byte	109
	.byte	105
	.byte	99
	.byte	95
	.byte	115
	.byte	99
	.byte	97
	.byte	108
	.byte	101
	.byte	59
	.byte	51
	.byte	51
	.byte	59
	.byte	51
	.byte	53
	.byte	59
	.byte	59
	.space 2, 0x00 	# pad
	.align 4
.2.8_2_kmpc_loc_struct_pack.185:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.8_2__kmpc_loc_pack.184
	.align 4
.2.8_2__kmpc_loc_pack.184:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	104
	.byte	111
	.byte	115
	.byte	116
	.byte	109
	.byte	105
	.byte	99
	.byte	95
	.byte	115
	.byte	99
	.byte	97
	.byte	108
	.byte	101
	.byte	59
	.byte	51
	.byte	52
	.byte	59
	.byte	51
	.byte	53
	.byte	59
	.byte	59
	.data
# -- End  _Z13hostmic_scalePdl, L__Z13hostmic_scalePdl_29__par_loop0_2.192, L__Z13hostmic_scalePdl_33__par_region1_2.212
	.text
# -- Begin  _Z7mic_sumPdl, L__Z7mic_sumPdl_17__par_loop0_2.254, L__Z7mic_sumPdl_17__tree_reduce0_2.292
# mark_begin;
# Threads 4
        .align    16,0x90
	.globl _Z7mic_sumPdl
_Z7mic_sumPdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B3.1:                         # Preds ..B3.0 Latency 25
..___tag_value__Z7mic_sumPdl.236:                               #13.36
        pushq     %rbp                                          #13.36
..___tag_value__Z7mic_sumPdl.238:                               #
        movq      %rsp, %rbp                                    #13.36
..___tag_value__Z7mic_sumPdl.239:                               #
        andq      $-64, %rsp                                    #13.36
        subq      $128, %rsp                                    #13.36 c1
        movq      %rdi, %rdx                                    #13.36 c1
        movq      %rsi, 8(%rsp)                                 #13.36 c5
        lea       .L_2__STRING.0(%rip), %rdi                    #14.2 c5
        movq      %rdx, %rsi                                    #14.2 c9
        xorl      %eax, %eax                                    #14.2 c9
        movq      %rbx, 48(%rsp)                                #13.36 c13
        movq      %r15, 16(%rsp)                                #13.36 c13
        movq      %r14, 24(%rsp)                                #13.36 c17
        movq      %r13, 32(%rsp)                                #13.36 c17
        movq      %r12, 40(%rsp)                                #13.36 c21
        movq      %rdx, (%rsp)                                  #13.36 c21
..___tag_value__Z7mic_sumPdl.241:                               #14.2
        call      printf@PLT                                    #14.2
..___tag_value__Z7mic_sumPdl.242:                               #
                                # LOE
..B3.2:                         # Preds ..B3.1 Latency 9
        lea       .2.9_2_kmpc_loc_struct_pack.247(%rip), %rdi   #17.1 c1
        movq      $0, 56(%rsp)                                  #15.13 c5
        call      __kmpc_global_thread_num@PLT                  #17.1 c9
                                # LOE eax
..B3.38:                        # Preds ..B3.2 Latency 9
        movl      %eax, 64(%rsp)                                #17.1 c1
        lea       .2.9_2_kmpc_loc_struct_pack.256(%rip), %rdi   #17.1 c1
        xorl      %eax, %eax                                    #17.1 c5
..___tag_value__Z7mic_sumPdl.248:                               #17.1
        call      __kmpc_ok_to_fork@PLT                         #17.1
..___tag_value__Z7mic_sumPdl.249:                               #
                                # LOE eax
..B3.3:                         # Preds ..B3.38 Latency 1
        testl     %eax, %eax                                    #17.1 c1
        je        ..B3.5        # Prob 50%                      #17.1 c1
                                # LOE
..B3.4:                         # Preds ..B3.3 Latency 18
        lea       L__Z7mic_sumPdl_17__par_loop0_2.254(%rip), %rdx #17.1 c1
        lea       8(%rsp), %rcx                                 #17.1 c1
        lea       (%rsp), %r8                                   #17.1 c5
        lea       56(%rsp), %r9                                 #17.1 c5
        lea       .2.9_2_kmpc_loc_struct_pack.256(%rip), %rdi   #17.1 c9
        pushq     $3                                            #17.1 c9
        popq      %rsi                                          #17.1
        xorl      %eax, %eax                                    #17.1 c13
..___tag_value__Z7mic_sumPdl.250:                               #17.1
        call      __kmpc_fork_call@PLT                          #17.1
..___tag_value__Z7mic_sumPdl.251:                               #
        jmp       ..B3.8        # Prob 100%                     #17.1 c17
                                # LOE
..B3.5:                         # Preds ..B3.3 Latency 9
        movl      64(%rsp), %esi                                #17.1 c1
        lea       .2.9_2_kmpc_loc_struct_pack.256(%rip), %rdi   #17.1 c1
        xorl      %eax, %eax                                    #17.1 c5
..___tag_value__Z7mic_sumPdl.252:                               #17.1
        call      __kmpc_serialized_parallel@PLT                #17.1
..___tag_value__Z7mic_sumPdl.253:                               #
                                # LOE
..B3.6:                         # Preds ..B3.5 Latency 13
        lea       64(%rsp), %rdi                                #17.1 c1
        lea       ___kmpv_zero_Z7mic_sumPdl_0(%rip), %rsi       #17.1 c1
        lea       8(%rsp), %rdx                                 #17.1 c5
        lea       (%rsp), %rcx                                  #17.1 c5
        lea       56(%rsp), %r8                                 #17.1 c9
..___tag_value__Z7mic_sumPdl.254:                               #17.1
        call      L__Z7mic_sumPdl_17__par_loop0_2.254           #17.1
..___tag_value__Z7mic_sumPdl.255:                               #
                                # LOE
..B3.7:                         # Preds ..B3.6 Latency 9
        movl      64(%rsp), %esi                                #17.1 c1
        lea       .2.9_2_kmpc_loc_struct_pack.256(%rip), %rdi   #17.1 c1
        xorl      %eax, %eax                                    #17.1 c5
..___tag_value__Z7mic_sumPdl.256:                               #17.1
        call      __kmpc_end_serialized_parallel@PLT            #17.1
..___tag_value__Z7mic_sumPdl.257:                               #
                                # LOE
..B3.8:                         # Preds ..B3.7 ..B3.4 Latency 17
        vbroadcastsd 56(%rsp), %zmm0                            #22.9 c1
        movq      16(%rsp), %r15                                #22.9 c1
..___tag_value__Z7mic_sumPdl.258:                               #
        movq      24(%rsp), %r14                                #22.9 c5
..___tag_value__Z7mic_sumPdl.259:                               #
        movq      32(%rsp), %r13                                #22.9 c5
..___tag_value__Z7mic_sumPdl.260:                               #
        movq      40(%rsp), %r12                                #22.9 c9
..___tag_value__Z7mic_sumPdl.261:                               #
        movq      48(%rsp), %rbx                                #22.9 c9
..___tag_value__Z7mic_sumPdl.262:                               #
        movq      %rbp, %rsp                                    #22.9 c17
        popq      %rbp                                          #22.9
..___tag_value__Z7mic_sumPdl.263:                               #
        ret                                                     #22.9
..___tag_value__Z7mic_sumPdl.265:                               #
                                # LOE
L__Z7mic_sumPdl_17__tree_reduce0_2.292:
# parameter 1: %rdi
# parameter 2: %rsi
..B3.9:                         # Preds ..B3.0 Latency 37
        pushq     %rbp                                          #17.1
..___tag_value__Z7mic_sumPdl.267:                               #
        movq      %rsp, %rbp                                    #17.1
..___tag_value__Z7mic_sumPdl.268:                               #
        andq      $-64, %rsp                                    #17.1
        subq      $128, %rsp                                    #17.1 c1
        pushq     $1                                            #17.1 c1
        popq      %rax                                          #17.1
        vbroadcastsd (%rsi), %zmm0                              #17.1 c5
        kmov      %eax, %k1                                     #17.1 c5
        vaddpd    (%rdi){1to8}, %zmm0, %zmm1{%k1}               #17.1 c9
        movq      %rbx, 48(%rsp)                                #17.1 c9
        movq      %r15, 16(%rsp)                                #17.1 c13
        movq      48(%rsp), %rbx                                #17.1 c13
..___tag_value__Z7mic_sumPdl.270:                               #
        movq      %r14, 24(%rsp)                                #17.1 c17
        movq      16(%rsp), %r15                                #17.1 c17
..___tag_value__Z7mic_sumPdl.271:                               #
        movq      %r13, 32(%rsp)                                #17.1 c21
        movq      24(%rsp), %r14                                #17.1 c21
..___tag_value__Z7mic_sumPdl.273:                               #
        movq      %r12, 40(%rsp)                                #17.1 c25
        movq      32(%rsp), %r13                                #17.1 c25
..___tag_value__Z7mic_sumPdl.275:                               #
        movq      40(%rsp), %r12                                #17.1 c29
..___tag_value__Z7mic_sumPdl.277:                               #
        vpackstorelpd %zmm1, (%rdi){%k1}                        #17.1 c29
        movq      %rbp, %rsp                                    #17.1 c37
        popq      %rbp                                          #17.1
..___tag_value__Z7mic_sumPdl.278:                               #
        ret                                                     #17.1
..___tag_value__Z7mic_sumPdl.280:                               #
                                # LOE
L__Z7mic_sumPdl_17__par_loop0_2.254:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
..B3.10:                        # Preds ..B3.0 Latency 29
        pushq     %rbp                                          #17.1
..___tag_value__Z7mic_sumPdl.282:                               #
        movq      %rsp, %rbp                                    #17.1
..___tag_value__Z7mic_sumPdl.283:                               #
        andq      $-64, %rsp                                    #17.1
        subq      $128, %rsp                                    #17.1 c1
        movl      $1, %eax                                      #17.1 c1
        vpxorq    %zmm0, %zmm0, %zmm0                           #17.1 c5
        movq      %r13, 32(%rsp)                                #17.1 c5
        kmov      %eax, %k1                                     #17.1 c9
        movq      %rbx, 48(%rsp)                                #17.1 c9
        movq      %r15, 16(%rsp)                                #17.1 c13
..___tag_value__Z7mic_sumPdl.285:                               #
        movq      (%rdx), %r13                                  #17.1 c13
        movq      %r14, 24(%rsp)                                #17.1 c17
        testq     %r13, %r13                                    #19.20 c17
        movq      %r12, 40(%rsp)                                #17.1 c21
..___tag_value__Z7mic_sumPdl.288:                               #
        movq      %r8, %r12                                     #17.1 c21
        movl      (%rdi), %ebx                                  #17.1 c25
        vpackstorelpd %zmm0, 56(%rsp){%k1}                      #17.1 c25
        movq      (%rcx), %r14                                  #17.1 c29
        jle       ..B3.26       # Prob 10%                      #19.20 c29
                                # LOE r12 r13 r14 ebx
..B3.11:                        # Preds ..B3.10 Latency 45
        movq      $0, 64(%rsp)                                  #17.1 c1
        movl      $0, 88(%rsp)                                  #17.1 c5
        decq      %r13                                          #17.1 c9
        movl      $1, %r11d                                     #17.1 c9
        movq      %r13, 72(%rsp)                                #17.1 c13
        lea       .2.9_2_kmpc_loc_struct_pack.256(%rip), %rdi   #17.1 c13
        movq      %r11, 80(%rsp)                                #17.1 c17
        addq      $-32, %rsp                                    #17.1 c17
        lea       112(%rsp), %r10                               #17.1 c21
        movl      %ebx, %esi                                    #17.1 c21
        movl      $34, %edx                                     #17.1 c25
        lea       120(%rsp), %rcx                               #17.1 c25
        lea       96(%rsp), %r8                                 #17.1 c29
        lea       104(%rsp), %r9                                #17.1 c29
        xorl      %eax, %eax                                    #17.1 c33
        movq      %r10, (%rsp)                                  #17.1 c33
        movq      %r11, 8(%rsp)                                 #17.1 c37
        movq      %r11, 16(%rsp)                                #17.1 c41
..___tag_value__Z7mic_sumPdl.290:                               #17.1
        call      __kmpc_for_static_init_8@PLT                  #17.1
..___tag_value__Z7mic_sumPdl.291:                               #
                                # LOE r12 r13 r14 ebx
..B3.39:                        # Preds ..B3.11 Latency 1
        addq      $32, %rsp                                     #17.1 c1
                                # LOE r12 r13 r14 ebx
..B3.12:                        # Preds ..B3.39 Latency 5
        movq      64(%rsp), %rdx                                #17.1 c1
        movq      72(%rsp), %rax                                #17.1 c1
        cmpq      %r13, %rdx                                    #17.1 c5
        jg        ..B3.25       # Prob 50%                      #17.1 c5
                                # LOE rax rdx r12 r13 r14 ebx
..B3.13:                        # Preds ..B3.12 Latency 9
        cmpq      %r13, %rax                                    #17.1 c1
        jl        ..L292        # Prob 50%                      #17.1 c5
        movq      %r13, %rax                                    #17.1
..L292:                                                         #
        cmpq      %rax, %rdx                                    #19.20 c9
        jg        ..B3.25       # Prob 50%                      #19.20 c9
                                # LOE rax rdx r12 r14 ebx
..B3.14:                        # Preds ..B3.13 Latency 57
        lea       (%r14,%rdx,8), %rdi                           #20.10 c1
        subq      %rdx, %rax                                    #17.1 c1
        movq      %rdi, %rcx                                    #17.1 c5
        xorl      %edx, %edx                                    #17.1 c5
        andq      $63, %rcx                                     #17.1 c9
        incq      %rax                                          #17.1 c9
        subq      %rcx, %rdx                                    #17.1 c13
        addq      $64, %rdx                                     #17.1 c17
        shrq      $3, %rdx                                      #17.1 c21
        testq     %rcx, %rcx                                    #17.1 c21
        jne       ..L293        # Prob 50%                      #17.1 c25
        movq      %rcx, %rdx                                    #17.1
..L293:                                                         #
        xorl      %ecx, %ecx                                    #17.1 c25
        lea       64(%rdx), %rsi                                #17.1 c29
        cmpq      %rsi, %rax                                    #17.1 c33
        movq      %rax, %rsi                                    #17.1 c33
        jge       ..L294        # Prob 50%                      #17.1 c37
        movq      %rax, %rdx                                    #17.1
..L294:                                                         #
        subq      %rdx, %rsi                                    #17.1 c41
        andq      $63, %rsi                                     #17.1 c45
        negq      %rsi                                          #17.1 c49
        addq      %rax, %rsi                                    #17.1 c53
        cmpq      $1, %rdx                                      #17.1 c57
        jae       ..B3.32       # Prob 0%                       #17.1 c57
                                # LOE rax rdx rcx rsi rdi r12 ebx
..B3.15:                        # Preds ..B3.14 ..B3.34 Latency 1
        cmpq      %rdx, %rax                                    #17.1 c1
        je        ..B3.25       # Prob 50%                      #17.1 c1
                                # LOE rax rdx rsi rdi r12 ebx
..B3.16:                        # Preds ..B3.15 Latency 53
        vbroadcastsd 56(%rsp), %zmm0                            #17.1 c1
        vprefetch0 (%rdi)                                       #17.1 c1
        vpxorq    %zmm4, %zmm4, %zmm4                           #17.1 c5
        vprefetch0 512(%rdi)                                    #17.1 c5
        vmovaps   %zmm4, %zmm8                                  #17.1 c9
        vprefetch0 64(%rdi)                                     #17.1 c9
        movl      $1, %ecx                                      #17.1 c13
        vprefetch0 576(%rdi)                                    #17.1 c13
        kmov      %ecx, %k1                                     #17.1 c17
        vprefetch0 128(%rdi)                                    #17.1 c17
        vpackstorelpd %zmm0, (%rsp){%k1}                        #17.1 c21
        vprefetch0 640(%rdi)                                    #17.1 c21
        vbroadcastsd (%rsp), %zmm8{%k1}                         #17.1 c25
        vmovaps   %zmm4, %zmm7                                  #17.1 c29
        vmovaps   %zmm4, %zmm6                                  #17.1 c33
        vmovaps   %zmm4, %zmm5                                  #17.1 c37
        vmovaps   %zmm4, %zmm3                                  #17.1 c41
        vmovaps   %zmm4, %zmm2                                  #17.1 c45
        vmovaps   %zmm4, %zmm1                                  #17.1 c49
        vmovaps   %zmm4, %zmm0                                  #17.1 c53
                                # LOE rax rdx rsi rdi r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8
..B3.17:                        # Preds ..B3.17 ..B3.16 Latency 65
        vaddpd    (%rdi,%rdx,8), %zmm8, %zmm8                   #20.3 c1
        vprefetch1 4096(%rdi,%rdx,8)                            #20.10 c1
        vaddpd    64(%rdi,%rdx,8), %zmm7, %zmm7                 #20.3 c5
        vprefetch0 1024(%rdi,%rdx,8)                            #20.10 c5
        vaddpd    128(%rdi,%rdx,8), %zmm6, %zmm6                #20.3 c9
        vprefetch1 4160(%rdi,%rdx,8)                            #20.10 c9
        vaddpd    192(%rdi,%rdx,8), %zmm5, %zmm5                #20.3 c13
        vprefetch0 1088(%rdi,%rdx,8)                            #20.10 c13
        vaddpd    256(%rdi,%rdx,8), %zmm3, %zmm3                #20.3 c17
        vprefetch1 4224(%rdi,%rdx,8)                            #20.10 c17
        vaddpd    320(%rdi,%rdx,8), %zmm2, %zmm2                #20.3 c21
        vprefetch0 1152(%rdi,%rdx,8)                            #20.10 c21
        vaddpd    384(%rdi,%rdx,8), %zmm1, %zmm1                #20.3 c25
        vprefetch1 4288(%rdi,%rdx,8)                            #20.10 c25
        vaddpd    448(%rdi,%rdx,8), %zmm0, %zmm0                #20.3 c29
        vprefetch0 1216(%rdi,%rdx,8)                            #20.10 c29
        vprefetch1 4352(%rdi,%rdx,8)                            #20.10 c33
        movb      %al, %al                                      #20.10 c33
        vprefetch0 1280(%rdi,%rdx,8)                            #20.10 c37
        movb      %al, %al                                      #20.10 c37
        vprefetch1 4416(%rdi,%rdx,8)                            #20.10 c41
        movb      %al, %al                                      #20.10 c41
        vprefetch0 1344(%rdi,%rdx,8)                            #20.10 c45
        movb      %al, %al                                      #20.10 c45
        vprefetch1 4480(%rdi,%rdx,8)                            #20.10 c49
        movb      %al, %al                                      #20.10 c49
        vprefetch0 1408(%rdi,%rdx,8)                            #20.10 c53
        movb      %al, %al                                      #20.10 c53
        vprefetch1 4544(%rdi,%rdx,8)                            #20.10 c57
        movb      %al, %al                                      #20.10 c57
        vprefetch0 1472(%rdi,%rdx,8)                            #20.10 c61
        addq      $64, %rdx                                     #17.1 c61
        cmpq      %rsi, %rdx                                    #17.1 c65
        jb        ..B3.17       # Prob 82%                      #17.1 c65
                                # LOE rax rdx rsi rdi r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8
..B3.18:                        # Preds ..B3.17 Latency 49
        vaddpd    %zmm7, %zmm8, %zmm7                           #17.1 c1
        vaddpd    %zmm5, %zmm6, %zmm5                           #17.1 c1
        vaddpd    %zmm2, %zmm3, %zmm2                           #17.1 c5
        vaddpd    %zmm0, %zmm1, %zmm0                           #17.1 c5
        vaddpd    %zmm5, %zmm7, %zmm1                           #17.1 c9
        vaddpd    %zmm0, %zmm2, %zmm3                           #17.1 c9
        vaddpd    %zmm3, %zmm1, %zmm8                           #17.1 c13
        movl      $1, %edx                                      #17.1 c13
        kmov      %edx, %k1                                     #17.1 c17
        lea       1(%rsi), %rdx                                 #17.1 c17
        vpermf32x4 $238, %zmm8, %zmm6                           #17.1 c21
        cmpq      %rdx, %rax                                    #17.1 c21
        vaddpd    %zmm8, %zmm6, %zmm9                           #17.1 c25
        nop                                                     #17.1 c29
        vaddpd    %zmm9{badc}, %zmm9, %zmm10                    #17.1 c33
        nop                                                     #17.1 c37
        vaddpd    %zmm10{cdab}, %zmm10, %zmm11                  #17.1 c41
        nop                                                     #17.1 c45
        vpackstorelpd %zmm11, 56(%rsp){%k1}                     #17.1 c49
        jb        ..B3.25       # Prob 50%                      #17.1 c49
                                # LOE rax rsi rdi r12 ebx zmm4
..B3.19:                        # Preds ..B3.18 Latency 37
        vbroadcastsd 56(%rsp), %zmm0                            #17.1 c1
        pushq     $1                                            #17.1 c1
        popq      %rdx                                          #17.1
        kmov      %edx, %k1                                     #17.1 c5
        subq      %rsi, %rax                                    #17.1 c5
        vpackstorelpd %zmm0, (%rsp){%k1}                        #17.1 c9
        lea       (%rdi,%rsi,8), %rdx                           #20.10 c9
        vbroadcastsd (%rsp), %zmm4{%k1}                         #17.1 c13
        movl      $21845, %esi                                  #20.10 c13
        movq      %rax, 8(%rsp)                                 #17.1 c17
        kmov      %esi, %k2                                     #20.10 c17
        movl      $43690, %esi                                  #20.10 c21
        xorl      %ecx, %ecx                                    #17.1 c21
        vpbroadcastq .L_2il0floatpacket.302(%rip), %zmm3        #17.1 c25
        vmovaps   .L_2il0floatpacket.303(%rip), %zmm2           #17.1 c29
        vpbroadcastq 8(%rsp), %zmm1                             #17.1 c33
        kmov      %esi, %k1                                     #20.10 c33
        vpxord    %zmm0, %zmm0, %zmm0                           #20.10 c37
                                # LOE rax rdx rcx r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 k1 k2
..B3.20:                        # Preds ..B3.23 ..B3.19 Latency 57
        vpcmpud   $6, %zmm1, %zmm2, %k4                         #17.1 c1
        vpcmpud   $0, %zmm1, %zmm2, %k3                         #17.1 c5
        vpcmpgtd  %zmm1, %zmm2, %k0                             #17.1 c9
        kmov      %k4, %r8d                                     #17.1 c9
        vmovaps   %zmm0, %zmm5                                  #17.1 c13
        kmov      %k3, %esi                                     #17.1 c13
        addl      %r8d, %r8d                                    #17.1 c17
        kmov      %k0, %edi                                     #17.1 c17
        andl      %esi, %r8d                                    #17.1 c21
        orl       %edi, %r8d                                    #17.1 c25
        andl      $-21846, %r8d                                 #17.1 c29
        kmov      %r8d, %k5                                     #17.1 c33
        vbroadcastss .L_2il0floatpacket.304(%rip), %zmm5{%k5}   #17.1 c37
        vcmpneqpd %zmm5, %zmm0, %k6                             #17.1 c41
        nop                                                     #17.1 c45
        knot      %k6, %k3                                      #17.1 c49
        knot      %k3, %k7                                      #17.1 c53
        jknzd     ..B3.22, %k7  # Prob 9%                       #17.1 c57
                                # LOE rax rdx rcx r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 k1 k2 k3
..B3.21:                        # Preds ..B3.20 Latency 2
        vaddpd    (%rdx), %zmm4, %zmm4                          #20.3 c1
        jmp       ..B3.23       # Prob 100%                     #20.3 c1
                                # LOE rax rdx rcx r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 k1 k2
..B3.22:                        # Preds ..B3.20 Latency 1
        vaddpd    (%rdx), %zmm4, %zmm4{%k3}                     #20.3 c1
                                # LOE rax rdx rcx r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 k1 k2
..B3.23:                        # Preds ..B3.21 ..B3.22 Latency 21
        vpaddsetcd %zmm3, %k3, %zmm2{%k2}                       #17.1 c1
        addq      $8, %rcx                                      #17.1 c1
        addq      $64, %rdx                                     #17.1 c5
        movb      %al, %al                                      #17.1 c5
        kmov      %k3, %esi                                     #17.1 c9
        addl      %esi, %esi                                    #17.1 c13
        kmov      %esi, %k4                                     #17.1 c17
        cmpq      %rax, %rcx                                    #17.1 c17
        vpadcd    %zmm3, %k4, %zmm2{%k1}                        #17.1 c21
        jb        ..B3.20       # Prob 82%                      #17.1 c21
                                # LOE rax rdx rcx r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 k1 k2
..B3.24:                        # Preds ..B3.23 Latency 29
        vpermf32x4 $238, %zmm4, %zmm0                           #17.1 c1
        movl      $1, %eax                                      #17.1 c1
        vaddpd    %zmm4, %zmm0, %zmm1                           #17.1 c5
        kmov      %eax, %k1                                     #17.1 c5
        nop                                                     #17.1 c9
        vaddpd    %zmm1{badc}, %zmm1, %zmm2                     #17.1 c13
        nop                                                     #17.1 c17
        vaddpd    %zmm2{cdab}, %zmm2, %zmm3                     #17.1 c21
        nop                                                     #17.1 c25
        vpackstorelpd %zmm3, 56(%rsp){%k1}                      #17.1 c29
                                # LOE r12 ebx
..B3.25:                        # Preds ..B3.12 ..B3.13 ..B3.15 ..B3.24 ..B3.18
                                #       Latency 9
        lea       .2.9_2_kmpc_loc_struct_pack.256(%rip), %rdi   #17.1 c1
        movl      %ebx, %esi                                    #17.1 c1
        xorl      %eax, %eax                                    #17.1 c5
..___tag_value__Z7mic_sumPdl.295:                               #17.1
        call      __kmpc_for_static_fini@PLT                    #17.1
..___tag_value__Z7mic_sumPdl.296:                               #
                                # LOE r12 ebx
..B3.26:                        # Preds ..B3.10 ..B3.25 Latency 33
        vbroadcastsd 56(%rsp), %zmm0                            #17.1 c1
        pushq     $1                                            #17.1 c1
        popq      %rdx                                          #17.1
        lea       .2.9_2_kmpc_loc_struct_pack.285(%rip), %r13   #17.1 c5
        kmov      %edx, %k1                                     #17.1 c5
        movq      mic_sum_kmpc_tree_reduct_lock_0@GOTPCREL(%rip), %r14 #17.1 c9
        vpackstorelpd %zmm0, (%rsp){%k1}                        #17.1 c9
        lea       (%rsp), %r8                                   #17.1 c13
        lea       L__Z7mic_sumPdl_17__tree_reduce0_2.292(%rip), %r9 #17.1 c13
        movq      %r13, %rdi                                    #17.1 c17
        movl      %ebx, %esi                                    #17.1 c17
        pushq     $8                                            #17.1 c21
        popq      %rcx                                          #17.1
        xorl      %eax, %eax                                    #17.1 c21
        pushq     %rsp                                          #17.1 c25
        pushq     %r14                                          #17.1 c29
..___tag_value__Z7mic_sumPdl.297:                               #17.1
        call      __kmpc_reduce_nowait@PLT                      #17.1
..___tag_value__Z7mic_sumPdl.298:                               #
                                # LOE r12 r13 r14 eax ebx
..B3.40:                        # Preds ..B3.26 Latency 1
        addq      $16, %rsp                                     #17.1 c1
                                # LOE r12 r13 r14 eax ebx
..B3.27:                        # Preds ..B3.40 Latency 1
        cmpl      $1, %eax                                      #17.1 c1
        jne       ..B3.29       # Prob 50%                      #17.1 c1
                                # LOE r12 r13 r14 eax ebx
..B3.28:                        # Preds ..B3.27 Latency 22
        vbroadcastsd (%rsp), %zmm0                              #17.1 c1
        pushq     $1                                            #17.1 c1
        popq      %rax                                          #17.1
        kmov      %eax, %k1                                     #17.1 c5
        movq      %r13, %rdi                                    #17.1 c5
        vaddpd    (%r12){1to8}, %zmm0, %zmm1{%k1}               #17.1 c9
        movl      %ebx, %esi                                    #17.1 c9
        movq      %r14, %rdx                                    #17.1 c13
        xorl      %eax, %eax                                    #17.1 c13
        vpackstorelpd %zmm1, (%r12){%k1}                        #17.1 c17
..___tag_value__Z7mic_sumPdl.299:                               #17.1
        call      __kmpc_end_reduce_nowait@PLT                  #17.1
..___tag_value__Z7mic_sumPdl.300:                               #
        jmp       ..B3.31       # Prob 100%                     #17.1 c21
                                # LOE
..B3.29:                        # Preds ..B3.27 Latency 1
        cmpl      $2, %eax                                      #17.1 c1
        jne       ..B3.31       # Prob 50%                      #17.1 c1
                                # LOE r12 r13 ebx
..B3.30:                        # Preds ..B3.29 Latency 13
        vbroadcastsd (%rsp), %zmm0                              #17.1 c1
        movq      %r13, %rdi                                    #17.1 c1
        movl      %ebx, %esi                                    #17.1 c5
        movq      %r12, %rdx                                    #17.1 c5
        pushq     $1                                            #17.1 c9
        popq      %rax                                          #17.1
..___tag_value__Z7mic_sumPdl.301:                               #17.1
        call      __kmpc_atomic_float8_add@PLT                  #17.1
..___tag_value__Z7mic_sumPdl.302:                               #
                                # LOE
..B3.31:                        # Preds ..B3.28 ..B3.30 ..B3.29 Latency 13
        movq      16(%rsp), %r15                                #17.1 c1
..___tag_value__Z7mic_sumPdl.303:                               #
        movq      24(%rsp), %r14                                #17.1 c1
..___tag_value__Z7mic_sumPdl.304:                               #
        movq      32(%rsp), %r13                                #17.1 c5
..___tag_value__Z7mic_sumPdl.305:                               #
        movq      40(%rsp), %r12                                #17.1 c5
..___tag_value__Z7mic_sumPdl.306:                               #
        movq      48(%rsp), %rbx                                #17.1 c9
..___tag_value__Z7mic_sumPdl.307:                               #
        movq      %rbp, %rsp                                    #17.1 c13
        popq      %rbp                                          #17.1
..___tag_value__Z7mic_sumPdl.308:                               #
        ret                                                     #17.1
..___tag_value__Z7mic_sumPdl.310:                               #
                                # LOE
..B3.32:                        # Preds ..B3.14                 # Infreq Latency 5
        movl      $1, %r8d                                      # c1
        vbroadcastsd 56(%rsp), %zmm0                            # c5
        kmov      %r8d, %k1                                     # c5
                                # LOE rax rdx rcx rsi rdi r12 ebx zmm0 k1
..B3.33:                        # Preds ..B3.33 ..B3.32         # Infreq Latency 5
        vaddpd    (%rdi,%rcx,8){1to8}, %zmm0, %zmm0{%k1}        #20.3 c1
        incq      %rcx                                          #17.1 c1
        cmpq      %rdx, %rcx                                    #17.1 c5
        jb        ..B3.33       # Prob 82%                      #17.1 c5
                                # LOE rax rdx rcx rsi rdi r12 ebx zmm0 k1
..B3.34:                        # Preds ..B3.33                 # Infreq Latency 10
        movl      $1, %ecx                                      # c1
        kmov      %ecx, %k1                                     # c5
        vpackstorelpd %zmm0, 56(%rsp){%k1}                      # c9
        jmp       ..B3.15       # Prob 100%                     # c9
        .align    16,0x90
..___tag_value__Z7mic_sumPdl.317:                               #
                                # LOE rax rdx rsi rdi r12 ebx
# mark_end;
	.type	_Z7mic_sumPdl,@function
	.size	_Z7mic_sumPdl,.-_Z7mic_sumPdl
	.section .gcc_except_table, "a"
	.align 4
_Z7mic_sumPdl$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value__Z7mic_sumPdl.321 - ..___tag_value__Z7mic_sumPdl.320
..___tag_value__Z7mic_sumPdl.320:
	.byte	1
	.uleb128	..___tag_value__Z7mic_sumPdl.319 - ..___tag_value__Z7mic_sumPdl.318
..___tag_value__Z7mic_sumPdl.318:
	.uleb128	..___tag_value__Z7mic_sumPdl.241 - ..___tag_value__Z7mic_sumPdl.236
	.uleb128	..___tag_value__Z7mic_sumPdl.242 - ..___tag_value__Z7mic_sumPdl.241
	.byte	0
	.byte	0
..___tag_value__Z7mic_sumPdl.319:
	.long	0
..___tag_value__Z7mic_sumPdl.321:
	.data
	.space 2, 0x00 	# pad
	.align 4
.2.9_2_kmpc_loc_struct_pack.247:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.246
	.align 4
.2.9_2__kmpc_loc_pack.246:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	105
	.byte	99
	.byte	95
	.byte	115
	.byte	117
	.byte	109
	.byte	59
	.byte	49
	.byte	55
	.byte	59
	.byte	49
	.byte	55
	.byte	59
	.byte	59
	.align 4
.2.9_2_kmpc_loc_struct_pack.256:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.255
	.align 4
.2.9_2__kmpc_loc_pack.255:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	105
	.byte	99
	.byte	95
	.byte	115
	.byte	117
	.byte	109
	.byte	59
	.byte	49
	.byte	55
	.byte	59
	.byte	50
	.byte	50
	.byte	59
	.byte	59
	.align 4
.2.9_2_kmpc_loc_struct_pack.285:
	.long	0
	.long	18
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.284
	.align 4
.2.9_2__kmpc_loc_pack.284:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	105
	.byte	99
	.byte	95
	.byte	115
	.byte	117
	.byte	109
	.byte	59
	.byte	49
	.byte	55
	.byte	59
	.byte	49
	.byte	55
	.byte	59
	.byte	59
	.data
# -- End  _Z7mic_sumPdl, L__Z7mic_sumPdl_17__par_loop0_2.254, L__Z7mic_sumPdl_17__tree_reduce0_2.292
	.bss
	.align 4
	.align 4
___kmpv_zero_Z13hostmic_scalePdl_0:
	.type	___kmpv_zero_Z13hostmic_scalePdl_0,@object
	.size	___kmpv_zero_Z13hostmic_scalePdl_0,4
	.space 4	# pad
	.align 4
___kmpv_zero_Z13hostmic_scalePdl_1:
	.type	___kmpv_zero_Z13hostmic_scalePdl_1,@object
	.size	___kmpv_zero_Z13hostmic_scalePdl_1,4
	.space 4	# pad
	.align 4
___kmpv_zero_Z7mic_sumPdl_0:
	.type	___kmpv_zero_Z7mic_sumPdl_0,@object
	.size	___kmpv_zero_Z7mic_sumPdl_0,4
	.space 4	# pad
	.section .rodata, "a"
	.space 48, 0x00 	# pad
	.align 64
.L_2il0floatpacket.233:
	.long	0x00000001,0x00000000,0x00000002,0x00000000,0x00000003,0x00000000,0x00000004,0x00000000,0x00000005,0x00000000,0x00000006,0x00000000,0x00000007,0x00000000,0x00000008,0x00000000
	.type	.L_2il0floatpacket.233,@object
	.size	.L_2il0floatpacket.233,64
	.align 64
.L_2il0floatpacket.303:
	.long	0x00000001,0x00000000,0x00000002,0x00000000,0x00000003,0x00000000,0x00000004,0x00000000,0x00000005,0x00000000,0x00000006,0x00000000,0x00000007,0x00000000,0x00000008,0x00000000
	.type	.L_2il0floatpacket.303,@object
	.size	.L_2il0floatpacket.303,64
	.align 8
.L_2il0floatpacket.231:
	.long	0xa53d6e3c,0x3ff965fe
	.type	.L_2il0floatpacket.231,@object
	.size	.L_2il0floatpacket.231,8
	.align 8
.L_2il0floatpacket.232:
	.long	0x00000008,0x00000000
	.type	.L_2il0floatpacket.232,@object
	.size	.L_2il0floatpacket.232,8
	.align 8
.L_2il0floatpacket.302:
	.long	0x00000008,0x00000000
	.type	.L_2il0floatpacket.302,@object
	.size	.L_2il0floatpacket.302,8
	.align 4
.L_2il0floatpacket.234:
	.long	0x40000000
	.type	.L_2il0floatpacket.234,@object
	.size	.L_2il0floatpacket.234,4
	.align 4
.L_2il0floatpacket.304:
	.long	0x40000000
	.type	.L_2il0floatpacket.304,@object
	.size	.L_2il0floatpacket.304,4
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.1:
	.byte	104
	.byte	111
	.byte	115
	.byte	116
	.byte	47
	.byte	109
	.byte	105
	.byte	99
	.byte	32
	.byte	112
	.byte	111
	.byte	105
	.byte	110
	.byte	116
	.byte	101
	.byte	114
	.byte	32
	.byte	118
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	112
	.byte	32
	.byte	10
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,26
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	110
	.byte	117
	.byte	109
	.byte	32
	.byte	111
	.byte	102
	.byte	32
	.byte	116
	.byte	104
	.byte	114
	.byte	101
	.byte	97
	.byte	100
	.byte	115
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,25
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	109
	.byte	105
	.byte	99
	.byte	32
	.byte	112
	.byte	111
	.byte	105
	.byte	110
	.byte	116
	.byte	101
	.byte	114
	.byte	32
	.byte	118
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	112
	.byte	32
	.byte	10
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,26
	.data
	.comm mic_sum_kmpc_tree_reduct_lock_0,32,8
# mark_proc_addr_taken L__Z7mic_sumPdl_17__tree_reduce0_2.292;
# mark_proc_addr_taken L__Z7mic_sumPdl_17__par_loop0_2.254;
# mark_proc_addr_taken L__Z13hostmic_scalePdl_33__par_region1_2.212;
# mark_proc_addr_taken L__Z13hostmic_scalePdl_29__par_loop0_2.192;
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
	.4byte 0x000003ac
	.4byte 0x00000024
	.4byte ..___tag_value_main.1-.
	.4byte ..___tag_value_main.133-..___tag_value_main.1
	.byte 0x04
	.4byte main$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.6-..___tag_value_main.4
	.8byte 0xff800d1c380e0310
	.8byte 0xfffffff00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.8-..___tag_value_main.6
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffffe80d1affff
	.8byte 0x800d1c380e0d1022
	.8byte 0xffffe00d1affffff
	.8byte 0x0d1c380e0e1022ff
	.8byte 0xffd80d1affffff80
	.8byte 0x1c380e0f1022ffff
	.8byte 0xd00d1affffff800d
	.4byte 0x22ffffff
	.byte 0x04
	.4byte ..___tag_value_main.19-..___tag_value_main.8
	.2byte 0x04cf
	.4byte ..___tag_value_main.20-..___tag_value_main.19
	.2byte 0x04ce
	.4byte ..___tag_value_main.21-..___tag_value_main.20
	.2byte 0x04cd
	.4byte ..___tag_value_main.22-..___tag_value_main.21
	.2byte 0x04cc
	.4byte ..___tag_value_main.23-..___tag_value_main.22
	.2byte 0x04c3
	.4byte ..___tag_value_main.24-..___tag_value_main.23
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.26-..___tag_value_main.24
	.4byte 0x0410060c
	.4byte ..___tag_value_main.28-..___tag_value_main.26
	.4byte 0x0410070c
	.4byte ..___tag_value_main.29-..___tag_value_main.28
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.31-..___tag_value_main.29
	.8byte 0xff800d1c380e0310
	.8byte 0xfffffff00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.33-..___tag_value_main.31
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffffe80d1affff
	.8byte 0x800d1c380e0d1022
	.8byte 0xffffe00d1affffff
	.8byte 0x0d1c380e0e1022ff
	.8byte 0xffd80d1affffff80
	.8byte 0x1c380e0f1022ffff
	.8byte 0xd00d1affffff800d
	.4byte 0x22ffffff
	.byte 0x04
	.4byte ..___tag_value_main.44-..___tag_value_main.33
	.2byte 0x04cf
	.4byte ..___tag_value_main.45-..___tag_value_main.44
	.2byte 0x04ce
	.4byte ..___tag_value_main.46-..___tag_value_main.45
	.2byte 0x04cd
	.4byte ..___tag_value_main.47-..___tag_value_main.46
	.2byte 0x04cc
	.4byte ..___tag_value_main.48-..___tag_value_main.47
	.2byte 0x04c3
	.4byte ..___tag_value_main.49-..___tag_value_main.48
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.51-..___tag_value_main.49
	.4byte 0x0410060c
	.4byte ..___tag_value_main.53-..___tag_value_main.51
	.4byte 0x0410070c
	.4byte ..___tag_value_main.54-..___tag_value_main.53
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.56-..___tag_value_main.54
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffffe80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.58-..___tag_value_main.56
	.8byte 0xff800d1c380e0310
	.8byte 0xfffffff00d1affff
	.8byte 0x800d1c380e0d1022
	.8byte 0xffffe00d1affffff
	.8byte 0x0d1c380e0e1022ff
	.8byte 0xffd80d1affffff80
	.8byte 0x1c380e0f1022ffff
	.8byte 0xd00d1affffff800d
	.4byte 0x22ffffff
	.byte 0x04
	.4byte ..___tag_value_main.69-..___tag_value_main.58
	.2byte 0x04cf
	.4byte ..___tag_value_main.70-..___tag_value_main.69
	.2byte 0x04ce
	.4byte ..___tag_value_main.71-..___tag_value_main.70
	.2byte 0x04cd
	.4byte ..___tag_value_main.72-..___tag_value_main.71
	.2byte 0x04cc
	.4byte ..___tag_value_main.73-..___tag_value_main.72
	.2byte 0x04c3
	.4byte ..___tag_value_main.74-..___tag_value_main.73
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.76-..___tag_value_main.74
	.4byte 0x0410060c
	.4byte ..___tag_value_main.78-..___tag_value_main.76
	.4byte 0x0410070c
	.4byte ..___tag_value_main.79-..___tag_value_main.78
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.81-..___tag_value_main.79
	.8byte 0xff800d1c380e0310
	.8byte 0xfffffff00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.83-..___tag_value_main.81
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffffe80d1affff
	.8byte 0x800d1c380e0d1022
	.8byte 0xffffe00d1affffff
	.8byte 0x0d1c380e0e1022ff
	.8byte 0xffd80d1affffff80
	.8byte 0x1c380e0f1022ffff
	.8byte 0xd00d1affffff800d
	.4byte 0x22ffffff
	.byte 0x04
	.4byte ..___tag_value_main.92-..___tag_value_main.83
	.2byte 0x04cf
	.4byte ..___tag_value_main.93-..___tag_value_main.92
	.2byte 0x04ce
	.4byte ..___tag_value_main.94-..___tag_value_main.93
	.2byte 0x04cd
	.4byte ..___tag_value_main.95-..___tag_value_main.94
	.2byte 0x04cc
	.4byte ..___tag_value_main.96-..___tag_value_main.95
	.2byte 0x04c3
	.4byte ..___tag_value_main.97-..___tag_value_main.96
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.99-..___tag_value_main.97
	.4byte 0x0410060c
	.4byte ..___tag_value_main.101-..___tag_value_main.99
	.4byte 0x0410070c
	.4byte ..___tag_value_main.102-..___tag_value_main.101
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.105-..___tag_value_main.102
	.8byte 0xff800d1c380e0310
	.8byte 0xfffffff00d1affff
	.8byte 0x800d1c380e0c1022
	.8byte 0xffffe80d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xffe00d1affffff80
	.8byte 0x1c380e0e1022ffff
	.8byte 0xd80d1affffff800d
	.8byte 0x380e0f1022ffffff
	.8byte 0x0d1affffff800d1c
	.4byte 0xffffffd0
	.2byte 0x0422
	.4byte ..___tag_value_main.111-..___tag_value_main.105
	.2byte 0x04cf
	.4byte ..___tag_value_main.112-..___tag_value_main.111
	.2byte 0x04ce
	.4byte ..___tag_value_main.113-..___tag_value_main.112
	.2byte 0x04cd
	.4byte ..___tag_value_main.114-..___tag_value_main.113
	.2byte 0x04cc
	.4byte ..___tag_value_main.115-..___tag_value_main.114
	.2byte 0x04c3
	.4byte ..___tag_value_main.116-..___tag_value_main.115
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.118-..___tag_value_main.116
	.4byte 0x0410060c
	.4byte ..___tag_value_main.120-..___tag_value_main.118
	.4byte 0x0410070c
	.4byte ..___tag_value_main.121-..___tag_value_main.120
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.123-..___tag_value_main.121
	.8byte 0xff800d1c380e0310
	.8byte 0xfffffff00d1affff
	.8byte 0x800d1c380e0e1022
	.8byte 0xffffd80d1affffff
	.2byte 0x22ff
	.byte 0x04
	.4byte ..___tag_value_main.125-..___tag_value_main.123
	.8byte 0xff800d1c380e0d10
	.8byte 0xffffffe00d1affff
	.2byte 0xce22
	.byte 0x04
	.4byte ..___tag_value_main.127-..___tag_value_main.125
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffffe80d1affff
	.2byte 0xcd22
	.byte 0x04
	.4byte ..___tag_value_main.129-..___tag_value_main.127
	.2byte 0x04cc
	.4byte ..___tag_value_main.130-..___tag_value_main.129
	.2byte 0x04c3
	.4byte ..___tag_value_main.131-..___tag_value_main.130
	.8byte 0x00000000c608070c
	.byte 0x00
	.4byte 0x0000024c
	.4byte 0x000003d4
	.4byte ..___tag_value__Z13hostmic_scalePdl.138-.
	.4byte ..___tag_value__Z13hostmic_scalePdl.231-..___tag_value__Z13hostmic_scalePdl.138
	.byte 0x04
	.4byte _Z13hostmic_scalePdl$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.140-..___tag_value__Z13hostmic_scalePdl.138
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.141-..___tag_value__Z13hostmic_scalePdl.140
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z13hostmic_scalePdl.144-..___tag_value__Z13hostmic_scalePdl.141
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffa80d1affff
	.8byte 0xc00d1c380e0c1022
	.8byte 0xffffa00d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xff980d1affffffc0
	.8byte 0x1c380e0e1022ffff
	.8byte 0x900d1affffffc00d
	.8byte 0x380e0f1022ffffff
	.8byte 0x0d1affffffc00d1c
	.4byte 0xffffff88
	.2byte 0x0422
	.4byte ..___tag_value__Z13hostmic_scalePdl.170-..___tag_value__Z13hostmic_scalePdl.144
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.171-..___tag_value__Z13hostmic_scalePdl.170
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.172-..___tag_value__Z13hostmic_scalePdl.171
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.173-..___tag_value__Z13hostmic_scalePdl.172
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.174-..___tag_value__Z13hostmic_scalePdl.173
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.175-..___tag_value__Z13hostmic_scalePdl.174
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.177-..___tag_value__Z13hostmic_scalePdl.175
	.4byte 0x0410060c
	.4byte ..___tag_value__Z13hostmic_scalePdl.179-..___tag_value__Z13hostmic_scalePdl.177
	.4byte 0x0410070c
	.4byte ..___tag_value__Z13hostmic_scalePdl.180-..___tag_value__Z13hostmic_scalePdl.179
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z13hostmic_scalePdl.182-..___tag_value__Z13hostmic_scalePdl.180
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffa80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z13hostmic_scalePdl.183-..___tag_value__Z13hostmic_scalePdl.182
	.8byte 0xffc00d1c380e0c10
	.8byte 0xffffffa00d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z13hostmic_scalePdl.185-..___tag_value__Z13hostmic_scalePdl.183
	.8byte 0xffc00d1c380e0d10
	.8byte 0xffffff980d1affff
	.8byte 0xc00d1c380e0e1022
	.8byte 0xffff900d1affffff
	.8byte 0x0d1c380e0f1022ff
	.8byte 0xff880d1affffffc0
	.4byte 0x0422ffff
	.4byte ..___tag_value__Z13hostmic_scalePdl.193-..___tag_value__Z13hostmic_scalePdl.185
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.194-..___tag_value__Z13hostmic_scalePdl.193
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.195-..___tag_value__Z13hostmic_scalePdl.194
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.196-..___tag_value__Z13hostmic_scalePdl.195
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.197-..___tag_value__Z13hostmic_scalePdl.196
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.198-..___tag_value__Z13hostmic_scalePdl.197
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.200-..___tag_value__Z13hostmic_scalePdl.198
	.4byte 0x0410060c
	.4byte ..___tag_value__Z13hostmic_scalePdl.202-..___tag_value__Z13hostmic_scalePdl.200
	.4byte 0x0410070c
	.4byte ..___tag_value__Z13hostmic_scalePdl.203-..___tag_value__Z13hostmic_scalePdl.202
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z13hostmic_scalePdl.205-..___tag_value__Z13hostmic_scalePdl.203
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffa80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z13hostmic_scalePdl.206-..___tag_value__Z13hostmic_scalePdl.205
	.8byte 0xffc00d1c380e0c10
	.8byte 0xffffffa00d1affff
	.8byte 0xc00d1c380e0d1022
	.8byte 0xffff980d1affffff
	.8byte 0x0d1c380e0e1022ff
	.8byte 0xff900d1affffffc0
	.8byte 0x1c380e0f1022ffff
	.8byte 0x880d1affffffc00d
	.4byte 0x22ffffff
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.217-..___tag_value__Z13hostmic_scalePdl.206
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.218-..___tag_value__Z13hostmic_scalePdl.217
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.219-..___tag_value__Z13hostmic_scalePdl.218
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.220-..___tag_value__Z13hostmic_scalePdl.219
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.221-..___tag_value__Z13hostmic_scalePdl.220
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.222-..___tag_value__Z13hostmic_scalePdl.221
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.224-..___tag_value__Z13hostmic_scalePdl.222
	.8byte 0x1c380e031010060c
	.8byte 0xa80d1affffffc00d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffffc00d1c380e
	.8byte 0x1022ffffffa00d1a
	.8byte 0xffffc00d1c380e0d
	.8byte 0x22ffffff980d1aff
	.8byte 0xffc00d1c380e0e10
	.8byte 0xffffff900d1affff
	.8byte 0xc00d1c380e0f1022
	.8byte 0xffff880d1affffff
	.4byte 0x000022ff
	.2byte 0x0000
	.byte 0x00
	.4byte 0x0000022c
	.4byte 0x00000624
	.4byte ..___tag_value__Z7mic_sumPdl.236-.
	.4byte ..___tag_value__Z7mic_sumPdl.317-..___tag_value__Z7mic_sumPdl.236
	.byte 0x04
	.4byte _Z7mic_sumPdl$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.238-..___tag_value__Z7mic_sumPdl.236
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.239-..___tag_value__Z7mic_sumPdl.238
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z7mic_sumPdl.242-..___tag_value__Z7mic_sumPdl.239
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffb00d1affff
	.8byte 0xc00d1c380e0c1022
	.8byte 0xffffa80d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xffa00d1affffffc0
	.8byte 0x1c380e0e1022ffff
	.8byte 0x980d1affffffc00d
	.8byte 0x380e0f1022ffffff
	.8byte 0x0d1affffffc00d1c
	.4byte 0xffffff90
	.2byte 0x0422
	.4byte ..___tag_value__Z7mic_sumPdl.258-..___tag_value__Z7mic_sumPdl.242
	.2byte 0x04cf
	.4byte ..___tag_value__Z7mic_sumPdl.259-..___tag_value__Z7mic_sumPdl.258
	.2byte 0x04ce
	.4byte ..___tag_value__Z7mic_sumPdl.260-..___tag_value__Z7mic_sumPdl.259
	.2byte 0x04cd
	.4byte ..___tag_value__Z7mic_sumPdl.261-..___tag_value__Z7mic_sumPdl.260
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.262-..___tag_value__Z7mic_sumPdl.261
	.2byte 0x04c3
	.4byte ..___tag_value__Z7mic_sumPdl.263-..___tag_value__Z7mic_sumPdl.262
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.265-..___tag_value__Z7mic_sumPdl.263
	.4byte 0x0410060c
	.4byte ..___tag_value__Z7mic_sumPdl.267-..___tag_value__Z7mic_sumPdl.265
	.4byte 0x0410070c
	.4byte ..___tag_value__Z7mic_sumPdl.268-..___tag_value__Z7mic_sumPdl.267
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z7mic_sumPdl.270-..___tag_value__Z7mic_sumPdl.268
	.8byte 0xffc00d1c380e0f10
	.8byte 0xffffff900d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z7mic_sumPdl.271-..___tag_value__Z7mic_sumPdl.270
	.8byte 0xffc00d1c380e0e10
	.8byte 0xffffff980d1affff
	.2byte 0xcf22
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.273-..___tag_value__Z7mic_sumPdl.271
	.8byte 0xffc00d1c380e0d10
	.8byte 0xffffffa00d1affff
	.2byte 0xce22
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.275-..___tag_value__Z7mic_sumPdl.273
	.8byte 0xffc00d1c380e0c10
	.8byte 0xffffffa80d1affff
	.2byte 0xcd22
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.277-..___tag_value__Z7mic_sumPdl.275
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.278-..___tag_value__Z7mic_sumPdl.277
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.280-..___tag_value__Z7mic_sumPdl.278
	.4byte 0x0410060c
	.4byte ..___tag_value__Z7mic_sumPdl.282-..___tag_value__Z7mic_sumPdl.280
	.4byte 0x0410070c
	.4byte ..___tag_value__Z7mic_sumPdl.283-..___tag_value__Z7mic_sumPdl.282
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z7mic_sumPdl.285-..___tag_value__Z7mic_sumPdl.283
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffb00d1affff
	.8byte 0xc00d1c380e0d1022
	.8byte 0xffffa00d1affffff
	.8byte 0x0d1c380e0f1022ff
	.8byte 0xff900d1affffffc0
	.4byte 0x0422ffff
	.4byte ..___tag_value__Z7mic_sumPdl.288-..___tag_value__Z7mic_sumPdl.285
	.8byte 0xffc00d1c380e0c10
	.8byte 0xffffffa80d1affff
	.8byte 0xc00d1c380e0e1022
	.8byte 0xffff980d1affffff
	.2byte 0x22ff
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.303-..___tag_value__Z7mic_sumPdl.288
	.2byte 0x04cf
	.4byte ..___tag_value__Z7mic_sumPdl.304-..___tag_value__Z7mic_sumPdl.303
	.2byte 0x04ce
	.4byte ..___tag_value__Z7mic_sumPdl.305-..___tag_value__Z7mic_sumPdl.304
	.2byte 0x04cd
	.4byte ..___tag_value__Z7mic_sumPdl.306-..___tag_value__Z7mic_sumPdl.305
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.307-..___tag_value__Z7mic_sumPdl.306
	.2byte 0x04c3
	.4byte ..___tag_value__Z7mic_sumPdl.308-..___tag_value__Z7mic_sumPdl.307
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.310-..___tag_value__Z7mic_sumPdl.308
	.8byte 0x1c380e031010060c
	.8byte 0xb00d1affffffc00d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffffc00d1c380e
	.8byte 0x1022ffffffa80d1a
	.8byte 0xffffc00d1c380e0d
	.8byte 0x22ffffffa00d1aff
	.8byte 0xffc00d1c380e0e10
	.8byte 0xffffff980d1affff
	.8byte 0xc00d1c380e0f1022
	.8byte 0xffff900d1affffff
	.8byte 0x00000000000022ff
// -- Begin DWARF2 SEGMENT .gnu.linkonce.d.DW.ref.__gxx_personality_v0
	.section .gnu.linkonce.d.DW.ref.__gxx_personality_v0,"a",@progbits
	.weak DW.ref.__gxx_personality_v0
	.align 1
.hidden DW.ref.__gxx_personality_v0
DW.ref.__gxx_personality_v0:
	.8byte __gxx_personality_v0
# End
