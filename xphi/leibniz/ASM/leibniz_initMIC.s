# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) MIC Architecture, Version 13.1.0.1";
# mark_description "46 Beta Build 20130121";
# mark_description " -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP -fno-verbose-asm -S";
	.file "leibniz_init.cpp"
	.text
..TXTST0:
# -- Begin  _Z7mic_sumPdl, L__Z7mic_sumPdl_15__par_loop0_2.19, L__Z7mic_sumPdl_15__tree_reduce0_2.57
# mark_begin;
# Threads 4
        .align    16,0x90
	.globl _Z7mic_sumPdl
_Z7mic_sumPdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0 Latency 25
..___tag_value__Z7mic_sumPdl.1:                                 #11.36
        pushq     %rbp                                          #11.36
..___tag_value__Z7mic_sumPdl.3:                                 #
        movq      %rsp, %rbp                                    #11.36
..___tag_value__Z7mic_sumPdl.4:                                 #
        andq      $-64, %rsp                                    #11.36
        subq      $128, %rsp                                    #11.36 c1
        movq      %rdi, %rdx                                    #11.36 c1
        movq      %rsi, 8(%rsp)                                 #11.36 c5
        lea       .L_2__STRING.0(%rip), %rdi                    #12.2 c5
        movq      %rdx, %rsi                                    #12.2 c9
        xorl      %eax, %eax                                    #12.2 c9
        movq      %rbx, 48(%rsp)                                #11.36 c13
        movq      %r15, 16(%rsp)                                #11.36 c13
        movq      %r14, 24(%rsp)                                #11.36 c17
        movq      %r13, 32(%rsp)                                #11.36 c17
        movq      %r12, 40(%rsp)                                #11.36 c21
        movq      %rdx, (%rsp)                                  #11.36 c21
..___tag_value__Z7mic_sumPdl.6:                                 #12.2
        call      printf@PLT                                    #12.2
..___tag_value__Z7mic_sumPdl.7:                                 #
                                # LOE
..B1.2:                         # Preds ..B1.1 Latency 9
        lea       .2.5_2_kmpc_loc_struct_pack.12(%rip), %rdi    #15.1 c1
        movq      $0, 56(%rsp)                                  #13.13 c5
        call      __kmpc_global_thread_num@PLT                  #15.1 c9
                                # LOE eax
..B1.38:                        # Preds ..B1.2 Latency 9
        movl      %eax, 64(%rsp)                                #15.1 c1
        lea       .2.5_2_kmpc_loc_struct_pack.21(%rip), %rdi    #15.1 c1
        xorl      %eax, %eax                                    #15.1 c5
..___tag_value__Z7mic_sumPdl.13:                                #15.1
        call      __kmpc_ok_to_fork@PLT                         #15.1
..___tag_value__Z7mic_sumPdl.14:                                #
                                # LOE eax
..B1.3:                         # Preds ..B1.38 Latency 1
        testl     %eax, %eax                                    #15.1 c1
        je        ..B1.5        # Prob 50%                      #15.1 c1
                                # LOE
..B1.4:                         # Preds ..B1.3 Latency 18
        lea       L__Z7mic_sumPdl_15__par_loop0_2.19(%rip), %rdx #15.1 c1
        lea       8(%rsp), %rcx                                 #15.1 c1
        lea       (%rsp), %r8                                   #15.1 c5
        lea       56(%rsp), %r9                                 #15.1 c5
        lea       .2.5_2_kmpc_loc_struct_pack.21(%rip), %rdi    #15.1 c9
        pushq     $3                                            #15.1 c9
        popq      %rsi                                          #15.1
        xorl      %eax, %eax                                    #15.1 c13
..___tag_value__Z7mic_sumPdl.15:                                #15.1
        call      __kmpc_fork_call@PLT                          #15.1
..___tag_value__Z7mic_sumPdl.16:                                #
        jmp       ..B1.8        # Prob 100%                     #15.1 c17
                                # LOE
..B1.5:                         # Preds ..B1.3 Latency 9
        movl      64(%rsp), %esi                                #15.1 c1
        lea       .2.5_2_kmpc_loc_struct_pack.21(%rip), %rdi    #15.1 c1
        xorl      %eax, %eax                                    #15.1 c5
..___tag_value__Z7mic_sumPdl.17:                                #15.1
        call      __kmpc_serialized_parallel@PLT                #15.1
..___tag_value__Z7mic_sumPdl.18:                                #
                                # LOE
..B1.6:                         # Preds ..B1.5 Latency 13
        lea       64(%rsp), %rdi                                #15.1 c1
        lea       ___kmpv_zero_Z7mic_sumPdl_0(%rip), %rsi       #15.1 c1
        lea       8(%rsp), %rdx                                 #15.1 c5
        lea       (%rsp), %rcx                                  #15.1 c5
        lea       56(%rsp), %r8                                 #15.1 c9
..___tag_value__Z7mic_sumPdl.19:                                #15.1
        call      L__Z7mic_sumPdl_15__par_loop0_2.19            #15.1
..___tag_value__Z7mic_sumPdl.20:                                #
                                # LOE
..B1.7:                         # Preds ..B1.6 Latency 9
        movl      64(%rsp), %esi                                #15.1 c1
        lea       .2.5_2_kmpc_loc_struct_pack.21(%rip), %rdi    #15.1 c1
        xorl      %eax, %eax                                    #15.1 c5
..___tag_value__Z7mic_sumPdl.21:                                #15.1
        call      __kmpc_end_serialized_parallel@PLT            #15.1
..___tag_value__Z7mic_sumPdl.22:                                #
                                # LOE
..B1.8:                         # Preds ..B1.7 ..B1.4 Latency 17
        vbroadcastsd 56(%rsp), %zmm0                            #20.9 c1
        movq      16(%rsp), %r15                                #20.9 c1
..___tag_value__Z7mic_sumPdl.23:                                #
        movq      24(%rsp), %r14                                #20.9 c5
..___tag_value__Z7mic_sumPdl.24:                                #
        movq      32(%rsp), %r13                                #20.9 c5
..___tag_value__Z7mic_sumPdl.25:                                #
        movq      40(%rsp), %r12                                #20.9 c9
..___tag_value__Z7mic_sumPdl.26:                                #
        movq      48(%rsp), %rbx                                #20.9 c9
..___tag_value__Z7mic_sumPdl.27:                                #
        movq      %rbp, %rsp                                    #20.9 c17
        popq      %rbp                                          #20.9
..___tag_value__Z7mic_sumPdl.28:                                #
        ret                                                     #20.9
..___tag_value__Z7mic_sumPdl.30:                                #
                                # LOE
L__Z7mic_sumPdl_15__tree_reduce0_2.57:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.9:                         # Preds ..B1.0 Latency 37
        pushq     %rbp                                          #15.1
..___tag_value__Z7mic_sumPdl.32:                                #
        movq      %rsp, %rbp                                    #15.1
..___tag_value__Z7mic_sumPdl.33:                                #
        andq      $-64, %rsp                                    #15.1
        subq      $128, %rsp                                    #15.1 c1
        pushq     $1                                            #15.1 c1
        popq      %rax                                          #15.1
        vbroadcastsd (%rsi), %zmm0                              #15.1 c5
        kmov      %eax, %k1                                     #15.1 c5
        vaddpd    (%rdi){1to8}, %zmm0, %zmm1{%k1}               #15.1 c9
        movq      %rbx, 48(%rsp)                                #15.1 c9
        movq      %r15, 16(%rsp)                                #15.1 c13
        movq      48(%rsp), %rbx                                #15.1 c13
..___tag_value__Z7mic_sumPdl.35:                                #
        movq      %r14, 24(%rsp)                                #15.1 c17
        movq      16(%rsp), %r15                                #15.1 c17
..___tag_value__Z7mic_sumPdl.36:                                #
        movq      %r13, 32(%rsp)                                #15.1 c21
        movq      24(%rsp), %r14                                #15.1 c21
..___tag_value__Z7mic_sumPdl.38:                                #
        movq      %r12, 40(%rsp)                                #15.1 c25
        movq      32(%rsp), %r13                                #15.1 c25
..___tag_value__Z7mic_sumPdl.40:                                #
        movq      40(%rsp), %r12                                #15.1 c29
..___tag_value__Z7mic_sumPdl.42:                                #
        vpackstorelpd %zmm1, (%rdi){%k1}                        #15.1 c29
        movq      %rbp, %rsp                                    #15.1 c37
        popq      %rbp                                          #15.1
..___tag_value__Z7mic_sumPdl.43:                                #
        ret                                                     #15.1
..___tag_value__Z7mic_sumPdl.45:                                #
                                # LOE
L__Z7mic_sumPdl_15__par_loop0_2.19:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
..B1.10:                        # Preds ..B1.0 Latency 29
        pushq     %rbp                                          #15.1
..___tag_value__Z7mic_sumPdl.47:                                #
        movq      %rsp, %rbp                                    #15.1
..___tag_value__Z7mic_sumPdl.48:                                #
        andq      $-64, %rsp                                    #15.1
        subq      $128, %rsp                                    #15.1 c1
        movl      $1, %eax                                      #15.1 c1
        vpxorq    %zmm0, %zmm0, %zmm0                           #15.1 c5
        movq      %r13, 32(%rsp)                                #15.1 c5
        kmov      %eax, %k1                                     #15.1 c9
        movq      %rbx, 48(%rsp)                                #15.1 c9
        movq      %r15, 16(%rsp)                                #15.1 c13
..___tag_value__Z7mic_sumPdl.50:                                #
        movq      (%rdx), %r13                                  #15.1 c13
        movq      %r14, 24(%rsp)                                #15.1 c17
        testq     %r13, %r13                                    #17.20 c17
        movq      %r12, 40(%rsp)                                #15.1 c21
..___tag_value__Z7mic_sumPdl.53:                                #
        movq      %r8, %r12                                     #15.1 c21
        movl      (%rdi), %ebx                                  #15.1 c25
        vpackstorelpd %zmm0, 56(%rsp){%k1}                      #15.1 c25
        movq      (%rcx), %r14                                  #15.1 c29
        jle       ..B1.26       # Prob 10%                      #17.20 c29
                                # LOE r12 r13 r14 ebx
..B1.11:                        # Preds ..B1.10 Latency 45
        movq      $0, 64(%rsp)                                  #15.1 c1
        movl      $0, 88(%rsp)                                  #15.1 c5
        decq      %r13                                          #15.1 c9
        movl      $1, %r11d                                     #15.1 c9
        movq      %r13, 72(%rsp)                                #15.1 c13
        lea       .2.5_2_kmpc_loc_struct_pack.21(%rip), %rdi    #15.1 c13
        movq      %r11, 80(%rsp)                                #15.1 c17
        addq      $-32, %rsp                                    #15.1 c17
        lea       112(%rsp), %r10                               #15.1 c21
        movl      %ebx, %esi                                    #15.1 c21
        movl      $34, %edx                                     #15.1 c25
        lea       120(%rsp), %rcx                               #15.1 c25
        lea       96(%rsp), %r8                                 #15.1 c29
        lea       104(%rsp), %r9                                #15.1 c29
        xorl      %eax, %eax                                    #15.1 c33
        movq      %r10, (%rsp)                                  #15.1 c33
        movq      %r11, 8(%rsp)                                 #15.1 c37
        movq      %r11, 16(%rsp)                                #15.1 c41
..___tag_value__Z7mic_sumPdl.55:                                #15.1
        call      __kmpc_for_static_init_8@PLT                  #15.1
..___tag_value__Z7mic_sumPdl.56:                                #
                                # LOE r12 r13 r14 ebx
..B1.39:                        # Preds ..B1.11 Latency 1
        addq      $32, %rsp                                     #15.1 c1
                                # LOE r12 r13 r14 ebx
..B1.12:                        # Preds ..B1.39 Latency 5
        movq      64(%rsp), %rdx                                #15.1 c1
        movq      72(%rsp), %rax                                #15.1 c1
        cmpq      %r13, %rdx                                    #15.1 c5
        jg        ..B1.25       # Prob 50%                      #15.1 c5
                                # LOE rax rdx r12 r13 r14 ebx
..B1.13:                        # Preds ..B1.12 Latency 9
        cmpq      %r13, %rax                                    #15.1 c1
        jl        ..L57         # Prob 50%                      #15.1 c5
        movq      %r13, %rax                                    #15.1
..L57:                                                          #
        cmpq      %rax, %rdx                                    #17.20 c9
        jg        ..B1.25       # Prob 50%                      #17.20 c9
                                # LOE rax rdx r12 r14 ebx
..B1.14:                        # Preds ..B1.13 Latency 57
        lea       (%r14,%rdx,8), %rdi                           #18.10 c1
        subq      %rdx, %rax                                    #15.1 c1
        movq      %rdi, %rcx                                    #15.1 c5
        xorl      %edx, %edx                                    #15.1 c5
        andq      $63, %rcx                                     #15.1 c9
        incq      %rax                                          #15.1 c9
        subq      %rcx, %rdx                                    #15.1 c13
        addq      $64, %rdx                                     #15.1 c17
        shrq      $3, %rdx                                      #15.1 c21
        testq     %rcx, %rcx                                    #15.1 c21
        jne       ..L58         # Prob 50%                      #15.1 c25
        movq      %rcx, %rdx                                    #15.1
..L58:                                                          #
        xorl      %ecx, %ecx                                    #15.1 c25
        lea       64(%rdx), %rsi                                #15.1 c29
        cmpq      %rsi, %rax                                    #15.1 c33
        movq      %rax, %rsi                                    #15.1 c33
        jge       ..L59         # Prob 50%                      #15.1 c37
        movq      %rax, %rdx                                    #15.1
..L59:                                                          #
        subq      %rdx, %rsi                                    #15.1 c41
        andq      $63, %rsi                                     #15.1 c45
        negq      %rsi                                          #15.1 c49
        addq      %rax, %rsi                                    #15.1 c53
        cmpq      $1, %rdx                                      #15.1 c57
        jae       ..B1.32       # Prob 0%                       #15.1 c57
                                # LOE rax rdx rcx rsi rdi r12 ebx
..B1.15:                        # Preds ..B1.14 ..B1.34 Latency 1
        cmpq      %rdx, %rax                                    #15.1 c1
        je        ..B1.25       # Prob 50%                      #15.1 c1
                                # LOE rax rdx rsi rdi r12 ebx
..B1.16:                        # Preds ..B1.15 Latency 53
        vbroadcastsd 56(%rsp), %zmm0                            #15.1 c1
        vprefetch0 (%rdi)                                       #15.1 c1
        vpxorq    %zmm4, %zmm4, %zmm4                           #15.1 c5
        vprefetch0 512(%rdi)                                    #15.1 c5
        vmovaps   %zmm4, %zmm8                                  #15.1 c9
        vprefetch0 64(%rdi)                                     #15.1 c9
        movl      $1, %ecx                                      #15.1 c13
        vprefetch0 576(%rdi)                                    #15.1 c13
        kmov      %ecx, %k1                                     #15.1 c17
        vprefetch0 128(%rdi)                                    #15.1 c17
        vpackstorelpd %zmm0, (%rsp){%k1}                        #15.1 c21
        vprefetch0 640(%rdi)                                    #15.1 c21
        vbroadcastsd (%rsp), %zmm8{%k1}                         #15.1 c25
        vmovaps   %zmm4, %zmm7                                  #15.1 c29
        vmovaps   %zmm4, %zmm6                                  #15.1 c33
        vmovaps   %zmm4, %zmm5                                  #15.1 c37
        vmovaps   %zmm4, %zmm3                                  #15.1 c41
        vmovaps   %zmm4, %zmm2                                  #15.1 c45
        vmovaps   %zmm4, %zmm1                                  #15.1 c49
        vmovaps   %zmm4, %zmm0                                  #15.1 c53
                                # LOE rax rdx rsi rdi r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8
..B1.17:                        # Preds ..B1.17 ..B1.16 Latency 65
        vaddpd    (%rdi,%rdx,8), %zmm8, %zmm8                   #18.3 c1
        vprefetch1 4096(%rdi,%rdx,8)                            #18.10 c1
        vaddpd    64(%rdi,%rdx,8), %zmm7, %zmm7                 #18.3 c5
        vprefetch0 1024(%rdi,%rdx,8)                            #18.10 c5
        vaddpd    128(%rdi,%rdx,8), %zmm6, %zmm6                #18.3 c9
        vprefetch1 4160(%rdi,%rdx,8)                            #18.10 c9
        vaddpd    192(%rdi,%rdx,8), %zmm5, %zmm5                #18.3 c13
        vprefetch0 1088(%rdi,%rdx,8)                            #18.10 c13
        vaddpd    256(%rdi,%rdx,8), %zmm3, %zmm3                #18.3 c17
        vprefetch1 4224(%rdi,%rdx,8)                            #18.10 c17
        vaddpd    320(%rdi,%rdx,8), %zmm2, %zmm2                #18.3 c21
        vprefetch0 1152(%rdi,%rdx,8)                            #18.10 c21
        vaddpd    384(%rdi,%rdx,8), %zmm1, %zmm1                #18.3 c25
        vprefetch1 4288(%rdi,%rdx,8)                            #18.10 c25
        vaddpd    448(%rdi,%rdx,8), %zmm0, %zmm0                #18.3 c29
        vprefetch0 1216(%rdi,%rdx,8)                            #18.10 c29
        vprefetch1 4352(%rdi,%rdx,8)                            #18.10 c33
        movb      %al, %al                                      #18.10 c33
        vprefetch0 1280(%rdi,%rdx,8)                            #18.10 c37
        movb      %al, %al                                      #18.10 c37
        vprefetch1 4416(%rdi,%rdx,8)                            #18.10 c41
        movb      %al, %al                                      #18.10 c41
        vprefetch0 1344(%rdi,%rdx,8)                            #18.10 c45
        movb      %al, %al                                      #18.10 c45
        vprefetch1 4480(%rdi,%rdx,8)                            #18.10 c49
        movb      %al, %al                                      #18.10 c49
        vprefetch0 1408(%rdi,%rdx,8)                            #18.10 c53
        movb      %al, %al                                      #18.10 c53
        vprefetch1 4544(%rdi,%rdx,8)                            #18.10 c57
        movb      %al, %al                                      #18.10 c57
        vprefetch0 1472(%rdi,%rdx,8)                            #18.10 c61
        addq      $64, %rdx                                     #15.1 c61
        cmpq      %rsi, %rdx                                    #15.1 c65
        jb        ..B1.17       # Prob 82%                      #15.1 c65
                                # LOE rax rdx rsi rdi r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 zmm6 zmm7 zmm8
..B1.18:                        # Preds ..B1.17 Latency 49
        vaddpd    %zmm7, %zmm8, %zmm7                           #15.1 c1
        vaddpd    %zmm5, %zmm6, %zmm5                           #15.1 c1
        vaddpd    %zmm2, %zmm3, %zmm2                           #15.1 c5
        vaddpd    %zmm0, %zmm1, %zmm0                           #15.1 c5
        vaddpd    %zmm5, %zmm7, %zmm1                           #15.1 c9
        vaddpd    %zmm0, %zmm2, %zmm3                           #15.1 c9
        vaddpd    %zmm3, %zmm1, %zmm8                           #15.1 c13
        movl      $1, %edx                                      #15.1 c13
        kmov      %edx, %k1                                     #15.1 c17
        lea       1(%rsi), %rdx                                 #15.1 c17
        vpermf32x4 $238, %zmm8, %zmm6                           #15.1 c21
        cmpq      %rdx, %rax                                    #15.1 c21
        vaddpd    %zmm8, %zmm6, %zmm9                           #15.1 c25
        nop                                                     #15.1 c29
        vaddpd    %zmm9{badc}, %zmm9, %zmm10                    #15.1 c33
        nop                                                     #15.1 c37
        vaddpd    %zmm10{cdab}, %zmm10, %zmm11                  #15.1 c41
        nop                                                     #15.1 c45
        vpackstorelpd %zmm11, 56(%rsp){%k1}                     #15.1 c49
        jb        ..B1.25       # Prob 50%                      #15.1 c49
                                # LOE rax rsi rdi r12 ebx zmm4
..B1.19:                        # Preds ..B1.18 Latency 37
        vbroadcastsd 56(%rsp), %zmm0                            #15.1 c1
        pushq     $1                                            #15.1 c1
        popq      %rdx                                          #15.1
        kmov      %edx, %k1                                     #15.1 c5
        subq      %rsi, %rax                                    #15.1 c5
        vpackstorelpd %zmm0, (%rsp){%k1}                        #15.1 c9
        lea       (%rdi,%rsi,8), %rdx                           #18.10 c9
        vbroadcastsd (%rsp), %zmm4{%k1}                         #15.1 c13
        movl      $21845, %esi                                  #18.10 c13
        movq      %rax, 8(%rsp)                                 #15.1 c17
        kmov      %esi, %k2                                     #18.10 c17
        movl      $43690, %esi                                  #18.10 c21
        xorl      %ecx, %ecx                                    #15.1 c21
        vpbroadcastq .L_2il0floatpacket.67(%rip), %zmm3         #15.1 c25
        vmovaps   .L_2il0floatpacket.68(%rip), %zmm2            #15.1 c29
        vpbroadcastq 8(%rsp), %zmm1                             #15.1 c33
        kmov      %esi, %k1                                     #18.10 c33
        vpxord    %zmm0, %zmm0, %zmm0                           #18.10 c37
                                # LOE rax rdx rcx r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 k1 k2
..B1.20:                        # Preds ..B1.23 ..B1.19 Latency 57
        vpcmpud   $6, %zmm1, %zmm2, %k4                         #15.1 c1
        vpcmpud   $0, %zmm1, %zmm2, %k3                         #15.1 c5
        vpcmpgtd  %zmm1, %zmm2, %k0                             #15.1 c9
        kmov      %k4, %r8d                                     #15.1 c9
        vmovaps   %zmm0, %zmm5                                  #15.1 c13
        kmov      %k3, %esi                                     #15.1 c13
        addl      %r8d, %r8d                                    #15.1 c17
        kmov      %k0, %edi                                     #15.1 c17
        andl      %esi, %r8d                                    #15.1 c21
        orl       %edi, %r8d                                    #15.1 c25
        andl      $-21846, %r8d                                 #15.1 c29
        kmov      %r8d, %k5                                     #15.1 c33
        vbroadcastss .L_2il0floatpacket.69(%rip), %zmm5{%k5}    #15.1 c37
        vcmpneqpd %zmm5, %zmm0, %k6                             #15.1 c41
        nop                                                     #15.1 c45
        knot      %k6, %k3                                      #15.1 c49
        knot      %k3, %k7                                      #15.1 c53
        jknzd     ..B1.22, %k7  # Prob 9%                       #15.1 c57
                                # LOE rax rdx rcx r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 k1 k2 k3
..B1.21:                        # Preds ..B1.20 Latency 2
        vaddpd    (%rdx), %zmm4, %zmm4                          #18.3 c1
        jmp       ..B1.23       # Prob 100%                     #18.3 c1
                                # LOE rax rdx rcx r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 k1 k2
..B1.22:                        # Preds ..B1.20 Latency 1
        vaddpd    (%rdx), %zmm4, %zmm4{%k3}                     #18.3 c1
                                # LOE rax rdx rcx r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 k1 k2
..B1.23:                        # Preds ..B1.21 ..B1.22 Latency 21
        vpaddsetcd %zmm3, %k3, %zmm2{%k2}                       #15.1 c1
        addq      $8, %rcx                                      #15.1 c1
        addq      $64, %rdx                                     #15.1 c5
        movb      %al, %al                                      #15.1 c5
        kmov      %k3, %esi                                     #15.1 c9
        addl      %esi, %esi                                    #15.1 c13
        kmov      %esi, %k4                                     #15.1 c17
        cmpq      %rax, %rcx                                    #15.1 c17
        vpadcd    %zmm3, %k4, %zmm2{%k1}                        #15.1 c21
        jb        ..B1.20       # Prob 82%                      #15.1 c21
                                # LOE rax rdx rcx r12 ebx zmm0 zmm1 zmm2 zmm3 zmm4 k1 k2
..B1.24:                        # Preds ..B1.23 Latency 29
        vpermf32x4 $238, %zmm4, %zmm0                           #15.1 c1
        movl      $1, %eax                                      #15.1 c1
        vaddpd    %zmm4, %zmm0, %zmm1                           #15.1 c5
        kmov      %eax, %k1                                     #15.1 c5
        nop                                                     #15.1 c9
        vaddpd    %zmm1{badc}, %zmm1, %zmm2                     #15.1 c13
        nop                                                     #15.1 c17
        vaddpd    %zmm2{cdab}, %zmm2, %zmm3                     #15.1 c21
        nop                                                     #15.1 c25
        vpackstorelpd %zmm3, 56(%rsp){%k1}                      #15.1 c29
                                # LOE r12 ebx
..B1.25:                        # Preds ..B1.12 ..B1.13 ..B1.15 ..B1.24 ..B1.18
                                #       Latency 9
        lea       .2.5_2_kmpc_loc_struct_pack.21(%rip), %rdi    #15.1 c1
        movl      %ebx, %esi                                    #15.1 c1
        xorl      %eax, %eax                                    #15.1 c5
..___tag_value__Z7mic_sumPdl.60:                                #15.1
        call      __kmpc_for_static_fini@PLT                    #15.1
..___tag_value__Z7mic_sumPdl.61:                                #
                                # LOE r12 ebx
..B1.26:                        # Preds ..B1.10 ..B1.25 Latency 33
        vbroadcastsd 56(%rsp), %zmm0                            #15.1 c1
        pushq     $1                                            #15.1 c1
        popq      %rdx                                          #15.1
        lea       .2.5_2_kmpc_loc_struct_pack.50(%rip), %r13    #15.1 c5
        kmov      %edx, %k1                                     #15.1 c5
        movq      mic_sum_kmpc_tree_reduct_lock_0@GOTPCREL(%rip), %r14 #15.1 c9
        vpackstorelpd %zmm0, (%rsp){%k1}                        #15.1 c9
        lea       (%rsp), %r8                                   #15.1 c13
        lea       L__Z7mic_sumPdl_15__tree_reduce0_2.57(%rip), %r9 #15.1 c13
        movq      %r13, %rdi                                    #15.1 c17
        movl      %ebx, %esi                                    #15.1 c17
        pushq     $8                                            #15.1 c21
        popq      %rcx                                          #15.1
        xorl      %eax, %eax                                    #15.1 c21
        pushq     %rsp                                          #15.1 c25
        pushq     %r14                                          #15.1 c29
..___tag_value__Z7mic_sumPdl.62:                                #15.1
        call      __kmpc_reduce_nowait@PLT                      #15.1
..___tag_value__Z7mic_sumPdl.63:                                #
                                # LOE r12 r13 r14 eax ebx
..B1.40:                        # Preds ..B1.26 Latency 1
        addq      $16, %rsp                                     #15.1 c1
                                # LOE r12 r13 r14 eax ebx
..B1.27:                        # Preds ..B1.40 Latency 1
        cmpl      $1, %eax                                      #15.1 c1
        jne       ..B1.29       # Prob 50%                      #15.1 c1
                                # LOE r12 r13 r14 eax ebx
..B1.28:                        # Preds ..B1.27 Latency 22
        vbroadcastsd (%rsp), %zmm0                              #15.1 c1
        pushq     $1                                            #15.1 c1
        popq      %rax                                          #15.1
        kmov      %eax, %k1                                     #15.1 c5
        movq      %r13, %rdi                                    #15.1 c5
        vaddpd    (%r12){1to8}, %zmm0, %zmm1{%k1}               #15.1 c9
        movl      %ebx, %esi                                    #15.1 c9
        movq      %r14, %rdx                                    #15.1 c13
        xorl      %eax, %eax                                    #15.1 c13
        vpackstorelpd %zmm1, (%r12){%k1}                        #15.1 c17
..___tag_value__Z7mic_sumPdl.64:                                #15.1
        call      __kmpc_end_reduce_nowait@PLT                  #15.1
..___tag_value__Z7mic_sumPdl.65:                                #
        jmp       ..B1.31       # Prob 100%                     #15.1 c21
                                # LOE
..B1.29:                        # Preds ..B1.27 Latency 1
        cmpl      $2, %eax                                      #15.1 c1
        jne       ..B1.31       # Prob 50%                      #15.1 c1
                                # LOE r12 r13 ebx
..B1.30:                        # Preds ..B1.29 Latency 13
        vbroadcastsd (%rsp), %zmm0                              #15.1 c1
        movq      %r13, %rdi                                    #15.1 c1
        movl      %ebx, %esi                                    #15.1 c5
        movq      %r12, %rdx                                    #15.1 c5
        pushq     $1                                            #15.1 c9
        popq      %rax                                          #15.1
..___tag_value__Z7mic_sumPdl.66:                                #15.1
        call      __kmpc_atomic_float8_add@PLT                  #15.1
..___tag_value__Z7mic_sumPdl.67:                                #
                                # LOE
..B1.31:                        # Preds ..B1.28 ..B1.30 ..B1.29 Latency 13
        movq      16(%rsp), %r15                                #15.1 c1
..___tag_value__Z7mic_sumPdl.68:                                #
        movq      24(%rsp), %r14                                #15.1 c1
..___tag_value__Z7mic_sumPdl.69:                                #
        movq      32(%rsp), %r13                                #15.1 c5
..___tag_value__Z7mic_sumPdl.70:                                #
        movq      40(%rsp), %r12                                #15.1 c5
..___tag_value__Z7mic_sumPdl.71:                                #
        movq      48(%rsp), %rbx                                #15.1 c9
..___tag_value__Z7mic_sumPdl.72:                                #
        movq      %rbp, %rsp                                    #15.1 c13
        popq      %rbp                                          #15.1
..___tag_value__Z7mic_sumPdl.73:                                #
        ret                                                     #15.1
..___tag_value__Z7mic_sumPdl.75:                                #
                                # LOE
..B1.32:                        # Preds ..B1.14                 # Infreq Latency 5
        movl      $1, %r8d                                      # c1
        vbroadcastsd 56(%rsp), %zmm0                            # c5
        kmov      %r8d, %k1                                     # c5
                                # LOE rax rdx rcx rsi rdi r12 ebx zmm0 k1
..B1.33:                        # Preds ..B1.33 ..B1.32         # Infreq Latency 5
        vaddpd    (%rdi,%rcx,8){1to8}, %zmm0, %zmm0{%k1}        #18.3 c1
        incq      %rcx                                          #15.1 c1
        cmpq      %rdx, %rcx                                    #15.1 c5
        jb        ..B1.33       # Prob 82%                      #15.1 c5
                                # LOE rax rdx rcx rsi rdi r12 ebx zmm0 k1
..B1.34:                        # Preds ..B1.33                 # Infreq Latency 10
        movl      $1, %ecx                                      # c1
        kmov      %ecx, %k1                                     # c5
        vpackstorelpd %zmm0, 56(%rsp){%k1}                      # c9
        jmp       ..B1.15       # Prob 100%                     # c9
        .align    16,0x90
..___tag_value__Z7mic_sumPdl.82:                                #
                                # LOE rax rdx rsi rdi r12 ebx
# mark_end;
	.type	_Z7mic_sumPdl,@function
	.size	_Z7mic_sumPdl,.-_Z7mic_sumPdl
	.section .gcc_except_table, "a"
	.align 4
_Z7mic_sumPdl$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value__Z7mic_sumPdl.86 - ..___tag_value__Z7mic_sumPdl.85
..___tag_value__Z7mic_sumPdl.85:
	.byte	1
	.uleb128	..___tag_value__Z7mic_sumPdl.84 - ..___tag_value__Z7mic_sumPdl.83
..___tag_value__Z7mic_sumPdl.83:
	.uleb128	..___tag_value__Z7mic_sumPdl.6 - ..___tag_value__Z7mic_sumPdl.1
	.uleb128	..___tag_value__Z7mic_sumPdl.7 - ..___tag_value__Z7mic_sumPdl.6
	.byte	0
	.byte	0
..___tag_value__Z7mic_sumPdl.84:
	.long	0
..___tag_value__Z7mic_sumPdl.86:
	.data
	.align 4
	.align 4
.2.5_2_kmpc_loc_struct_pack.12:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.5_2__kmpc_loc_pack.11
	.align 4
.2.5_2__kmpc_loc_pack.11:
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
	.byte	53
	.byte	59
	.byte	49
	.byte	53
	.byte	59
	.byte	59
	.align 4
.2.5_2_kmpc_loc_struct_pack.21:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.5_2__kmpc_loc_pack.20
	.align 4
.2.5_2__kmpc_loc_pack.20:
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
	.byte	53
	.byte	59
	.byte	50
	.byte	48
	.byte	59
	.byte	59
	.align 4
.2.5_2_kmpc_loc_struct_pack.50:
	.long	0
	.long	18
	.long	0
	.long	0
	.quad	.2.5_2__kmpc_loc_pack.49
	.align 4
.2.5_2__kmpc_loc_pack.49:
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
	.byte	53
	.byte	59
	.byte	49
	.byte	53
	.byte	59
	.byte	59
	.data
# -- End  _Z7mic_sumPdl, L__Z7mic_sumPdl_15__par_loop0_2.19, L__Z7mic_sumPdl_15__tree_reduce0_2.57
	.text
# -- Begin  _Z13hostmic_scalePdl, L__Z13hostmic_scalePdl_27__par_loop0_2.97, L__Z13hostmic_scalePdl_31__par_region1_2.117
# mark_begin;
# Threads 4
        .align    16,0x90
	.globl _Z13hostmic_scalePdl
_Z13hostmic_scalePdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.1:                         # Preds ..B2.0 Latency 25
..___tag_value__Z13hostmic_scalePdl.87:                         #24.40
        pushq     %rbp                                          #24.40
..___tag_value__Z13hostmic_scalePdl.89:                         #
        movq      %rsp, %rbp                                    #24.40
..___tag_value__Z13hostmic_scalePdl.90:                         #
        andq      $-64, %rsp                                    #24.40
        subq      $128, %rsp                                    #24.40 c1
        movq      %rdi, %rdx                                    #24.40 c1
        movq      %rsi, 48(%rsp)                                #24.40 c5
        lea       .L_2__STRING.1(%rip), %rdi                    #25.2 c5
        movq      %rdx, %rsi                                    #25.2 c9
        xorl      %eax, %eax                                    #25.2 c9
        movq      %rbx, 40(%rsp)                                #24.40 c13
        movq      %r15, 8(%rsp)                                 #24.40 c13
        movq      %r14, 16(%rsp)                                #24.40 c17
        movq      %r13, 24(%rsp)                                #24.40 c17
        movq      %r12, 32(%rsp)                                #24.40 c21
        movq      %rdx, (%rsp)                                  #24.40 c21
..___tag_value__Z13hostmic_scalePdl.92:                         #25.2
        call      printf@PLT                                    #25.2
..___tag_value__Z13hostmic_scalePdl.93:                         #
                                # LOE
..B2.2:                         # Preds ..B2.1 Latency 5
        lea       .2.6_2_kmpc_loc_struct_pack.82(%rip), %rdi    #27.1 c1
        call      __kmpc_global_thread_num@PLT                  #27.1 c5
                                # LOE eax
..B2.44:                        # Preds ..B2.2 Latency 9
        movl      %eax, 56(%rsp)                                #27.1 c1
        lea       .2.6_2_kmpc_loc_struct_pack.99(%rip), %rdi    #27.1 c1
        xorl      %eax, %eax                                    #27.1 c5
..___tag_value__Z13hostmic_scalePdl.99:                         #27.1
        call      __kmpc_ok_to_fork@PLT                         #27.1
..___tag_value__Z13hostmic_scalePdl.100:                        #
                                # LOE eax
..B2.3:                         # Preds ..B2.44 Latency 1
        testl     %eax, %eax                                    #27.1 c1
        je        ..B2.5        # Prob 50%                      #27.1 c1
                                # LOE
..B2.4:                         # Preds ..B2.3 Latency 14
        lea       L__Z13hostmic_scalePdl_27__par_loop0_2.97(%rip), %rdx #27.1 c1
        lea       48(%rsp), %rcx                                #27.1 c1
        lea       (%rsp), %r8                                   #27.1 c5
        lea       .2.6_2_kmpc_loc_struct_pack.99(%rip), %rdi    #27.1 c5
        pushq     $2                                            #27.1 c9
        popq      %rsi                                          #27.1
        xorl      %eax, %eax                                    #27.1 c9
..___tag_value__Z13hostmic_scalePdl.101:                        #27.1
        call      __kmpc_fork_call@PLT                          #27.1
..___tag_value__Z13hostmic_scalePdl.102:                        #
        jmp       ..B2.8        # Prob 100%                     #27.1 c13
                                # LOE
..B2.5:                         # Preds ..B2.3 Latency 9
        movl      56(%rsp), %esi                                #27.1 c1
        lea       .2.6_2_kmpc_loc_struct_pack.99(%rip), %rdi    #27.1 c1
        xorl      %eax, %eax                                    #27.1 c5
..___tag_value__Z13hostmic_scalePdl.103:                        #27.1
        call      __kmpc_serialized_parallel@PLT                #27.1
..___tag_value__Z13hostmic_scalePdl.104:                        #
                                # LOE
..B2.6:                         # Preds ..B2.5 Latency 9
        lea       56(%rsp), %rdi                                #27.1 c1
        lea       ___kmpv_zero_Z13hostmic_scalePdl_0(%rip), %rsi #27.1 c1
        lea       48(%rsp), %rdx                                #27.1 c5
        lea       (%rsp), %rcx                                  #27.1 c5
..___tag_value__Z13hostmic_scalePdl.105:                        #27.1
        call      L__Z13hostmic_scalePdl_27__par_loop0_2.97     #27.1
..___tag_value__Z13hostmic_scalePdl.106:                        #
                                # LOE
..B2.7:                         # Preds ..B2.6 Latency 9
        movl      56(%rsp), %esi                                #27.1 c1
        lea       .2.6_2_kmpc_loc_struct_pack.99(%rip), %rdi    #27.1 c1
        xorl      %eax, %eax                                    #27.1 c5
..___tag_value__Z13hostmic_scalePdl.107:                        #27.1
        call      __kmpc_end_serialized_parallel@PLT            #27.1
..___tag_value__Z13hostmic_scalePdl.108:                        #
                                # LOE
..B2.8:                         # Preds ..B2.7 ..B2.4 Latency 5
        lea       .2.6_2_kmpc_loc_struct_pack.119(%rip), %rdi   #31.1 c1
        xorl      %eax, %eax                                    #31.1 c1
..___tag_value__Z13hostmic_scalePdl.109:                        #31.1
        call      __kmpc_ok_to_fork@PLT                         #31.1
..___tag_value__Z13hostmic_scalePdl.110:                        #
                                # LOE eax
..B2.9:                         # Preds ..B2.8 Latency 1
        testl     %eax, %eax                                    #31.1 c1
        je        ..B2.11       # Prob 50%                      #31.1 c1
                                # LOE
..B2.10:                        # Preds ..B2.9 Latency 10
        lea       L__Z13hostmic_scalePdl_31__par_region1_2.117(%rip), %rdx #31.1 c1
        lea       .2.6_2_kmpc_loc_struct_pack.119(%rip), %rdi   #31.1 c1
        xorl      %esi, %esi                                    #31.1 c5
        xorl      %eax, %eax                                    #31.1 c5
..___tag_value__Z13hostmic_scalePdl.111:                        #31.1
        call      __kmpc_fork_call@PLT                          #31.1
..___tag_value__Z13hostmic_scalePdl.112:                        #
        jmp       ..B2.14       # Prob 100%                     #31.1 c9
                                # LOE
..B2.11:                        # Preds ..B2.9 Latency 9
        movl      56(%rsp), %esi                                #31.1 c1
        lea       .2.6_2_kmpc_loc_struct_pack.119(%rip), %rdi   #31.1 c1
        xorl      %eax, %eax                                    #31.1 c5
..___tag_value__Z13hostmic_scalePdl.113:                        #31.1
        call      __kmpc_serialized_parallel@PLT                #31.1
..___tag_value__Z13hostmic_scalePdl.114:                        #
                                # LOE
..B2.12:                        # Preds ..B2.11 Latency 5
        lea       56(%rsp), %rdi                                #31.1 c1
        lea       ___kmpv_zero_Z13hostmic_scalePdl_1(%rip), %rsi #31.1 c1
..___tag_value__Z13hostmic_scalePdl.115:                        #31.1
        call      L__Z13hostmic_scalePdl_31__par_region1_2.117  #31.1
..___tag_value__Z13hostmic_scalePdl.116:                        #
                                # LOE
..B2.13:                        # Preds ..B2.12 Latency 9
        movl      56(%rsp), %esi                                #31.1 c1
        lea       .2.6_2_kmpc_loc_struct_pack.119(%rip), %rdi   #31.1 c1
        xorl      %eax, %eax                                    #31.1 c5
..___tag_value__Z13hostmic_scalePdl.117:                        #31.1
        call      __kmpc_end_serialized_parallel@PLT            #31.1
..___tag_value__Z13hostmic_scalePdl.118:                        #
                                # LOE
..B2.14:                        # Preds ..B2.10 ..B2.13 Latency 13
        movq      8(%rsp), %r15                                 #34.1 c1
..___tag_value__Z13hostmic_scalePdl.119:                        #
        movq      16(%rsp), %r14                                #34.1 c1
..___tag_value__Z13hostmic_scalePdl.120:                        #
        movq      24(%rsp), %r13                                #34.1 c5
..___tag_value__Z13hostmic_scalePdl.121:                        #
        movq      32(%rsp), %r12                                #34.1 c5
..___tag_value__Z13hostmic_scalePdl.122:                        #
        movq      40(%rsp), %rbx                                #34.1 c9
..___tag_value__Z13hostmic_scalePdl.123:                        #
        movq      %rbp, %rsp                                    #34.1 c13
        popq      %rbp                                          #34.1
..___tag_value__Z13hostmic_scalePdl.124:                        #
        ret                                                     #34.1
..___tag_value__Z13hostmic_scalePdl.126:                        #
                                # LOE
L__Z13hostmic_scalePdl_31__par_region1_2.117:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.15:                        # Preds ..B2.0 Latency 25
        pushq     %rbp                                          #31.1
..___tag_value__Z13hostmic_scalePdl.128:                        #
        movq      %rsp, %rbp                                    #31.1
..___tag_value__Z13hostmic_scalePdl.129:                        #
        andq      $-64, %rsp                                    #31.1
        subq      $128, %rsp                                    #31.1 c1
        xorl      %eax, %eax                                    #32.1 c1
        movq      %rbx, 40(%rsp)                                #31.1 c5
..___tag_value__Z13hostmic_scalePdl.131:                        #
        lea       .2.6_2_kmpc_loc_struct_pack.90(%rip), %rbx    #32.1 c5
        movq      %r12, 32(%rsp)                                #31.1 c9
..___tag_value__Z13hostmic_scalePdl.132:                        #
        movl      (%rdi), %r12d                                 #31.1 c9
        movq      %rbx, %rdi                                    #32.1 c13
        movl      %r12d, %esi                                   #32.1 c13
        movq      %r15, 8(%rsp)                                 #31.1 c17
        movq      %r14, 16(%rsp)                                #31.1 c17
        movq      %r13, 24(%rsp)                                #31.1 c21
..___tag_value__Z13hostmic_scalePdl.133:                        #32.1
        call      __kmpc_master@PLT                             #32.1
..___tag_value__Z13hostmic_scalePdl.134:                        #
                                # LOE rbx eax r12d
..B2.16:                        # Preds ..B2.15 Latency 1
        cmpl      $1, %eax                                      #32.1 c1
        jne       ..B2.20       # Prob 50%                      #32.1 c1
                                # LOE rbx r12d
..B2.17:                        # Preds ..B2.16 Latency 1
        call      omp_get_num_threads@PLT                       #33.37 c1
                                # LOE rbx eax r12d
..B2.18:                        # Preds ..B2.17 Latency 9
        lea       .L_2__STRING.2(%rip), %rdi                    #33.2 c1
        movl      %eax, %esi                                    #33.2 c1
        xorl      %eax, %eax                                    #33.2 c5
..___tag_value__Z13hostmic_scalePdl.138:                        #33.2
        call      printf@PLT                                    #33.2
..___tag_value__Z13hostmic_scalePdl.139:                        #
                                # LOE rbx r12d
..B2.19:                        # Preds ..B2.18 Latency 9
        movq      %rbx, %rdi                                    #32.1 c1
        movl      %r12d, %esi                                   #32.1 c1
        xorl      %eax, %eax                                    #32.1 c5
..___tag_value__Z13hostmic_scalePdl.140:                        #32.1
        call      __kmpc_end_master@PLT                         #32.1
..___tag_value__Z13hostmic_scalePdl.141:                        #
                                # LOE
..B2.20:                        # Preds ..B2.19 ..B2.16 Latency 13
        movq      8(%rsp), %r15                                 #31.1 c1
..___tag_value__Z13hostmic_scalePdl.142:                        #
        movq      16(%rsp), %r14                                #31.1 c1
..___tag_value__Z13hostmic_scalePdl.143:                        #
        movq      24(%rsp), %r13                                #31.1 c5
..___tag_value__Z13hostmic_scalePdl.144:                        #
        movq      32(%rsp), %r12                                #31.1 c5
..___tag_value__Z13hostmic_scalePdl.145:                        #
        movq      40(%rsp), %rbx                                #31.1 c9
..___tag_value__Z13hostmic_scalePdl.146:                        #
        movq      %rbp, %rsp                                    #31.1 c13
        popq      %rbp                                          #31.1
..___tag_value__Z13hostmic_scalePdl.147:                        #
        ret                                                     #31.1
..___tag_value__Z13hostmic_scalePdl.149:                        #
                                # LOE
L__Z13hostmic_scalePdl_27__par_loop0_2.97:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B2.21:                        # Preds ..B2.0 Latency 21
        pushq     %rbp                                          #27.1
..___tag_value__Z13hostmic_scalePdl.151:                        #
        movq      %rsp, %rbp                                    #27.1
..___tag_value__Z13hostmic_scalePdl.152:                        #
        andq      $-64, %rsp                                    #27.1
        subq      $128, %rsp                                    #27.1 c1
        movq      %rbx, 40(%rsp)                                #27.1 c5
..___tag_value__Z13hostmic_scalePdl.154:                        #
        movq      (%rdx), %rbx                                  #27.1 c5
        movq      %r15, 8(%rsp)                                 #27.1 c9
        testq     %rbx, %rbx                                    #28.20 c9
        movq      %r14, 16(%rsp)                                #27.1 c13
        movq      %r13, 24(%rsp)                                #27.1 c13
        movq      %r12, 32(%rsp)                                #27.1 c17
..___tag_value__Z13hostmic_scalePdl.155:                        #
        movl      (%rdi), %r13d                                 #27.1 c17
        movq      (%rcx), %r12                                  #27.1 c21
        jle       ..B2.39       # Prob 10%                      #28.20 c21
                                # LOE rbx r12 r13d
..B2.22:                        # Preds ..B2.21 Latency 45
        movq      $0, 48(%rsp)                                  #27.1 c1
        movl      $0, 72(%rsp)                                  #27.1 c5
        decq      %rbx                                          #27.1 c9
        movl      $1, %r11d                                     #27.1 c9
        movq      %rbx, 56(%rsp)                                #27.1 c13
        lea       .2.6_2_kmpc_loc_struct_pack.99(%rip), %rdi    #27.1 c13
        movq      %r11, 64(%rsp)                                #27.1 c17
        addq      $-32, %rsp                                    #27.1 c17
        lea       96(%rsp), %r10                                #27.1 c21
        movl      %r13d, %esi                                   #27.1 c21
        movl      $34, %edx                                     #27.1 c25
        lea       104(%rsp), %rcx                               #27.1 c25
        lea       80(%rsp), %r8                                 #27.1 c29
        lea       88(%rsp), %r9                                 #27.1 c29
        xorl      %eax, %eax                                    #27.1 c33
        movq      %r10, (%rsp)                                  #27.1 c33
        movq      %r11, 8(%rsp)                                 #27.1 c37
        movq      %r11, 16(%rsp)                                #27.1 c41
..___tag_value__Z13hostmic_scalePdl.159:                        #27.1
        call      __kmpc_for_static_init_8@PLT                  #27.1
..___tag_value__Z13hostmic_scalePdl.160:                        #
                                # LOE rbx r12 r13d
..B2.48:                        # Preds ..B2.22 Latency 1
        addq      $32, %rsp                                     #27.1 c1
                                # LOE rbx r12 r13d
..B2.23:                        # Preds ..B2.48 Latency 5
        movq      48(%rsp), %rdi                                #27.1 c1
        movq      56(%rsp), %rax                                #27.1 c1
        cmpq      %rbx, %rdi                                    #27.1 c5
        jg        ..B2.38       # Prob 50%                      #27.1 c5
                                # LOE rax rbx rdi r12 r13d
..B2.24:                        # Preds ..B2.23 Latency 9
        cmpq      %rbx, %rax                                    #27.1 c1
        jl        ..L161        # Prob 50%                      #27.1 c5
        movq      %rbx, %rax                                    #27.1
..L161:                                                         #
        cmpq      %rax, %rdi                                    #28.20 c9
        jg        ..B2.38       # Prob 50%                      #28.20 c9
                                # LOE rax rdi r12 r13d
..B2.25:                        # Preds ..B2.24 Latency 57
        lea       (%r12,%rdi,8), %rsi                           #29.3 c1
        xorl      %ecx, %ecx                                    #28.2 c1
        movq      %rsi, %rdx                                    #28.2 c5
        subq      %rdi, %rax                                    #28.2 c5
        andq      $63, %rdx                                     #28.2 c9
        incq      %rax                                          #28.2 c9
        subq      %rdx, %rcx                                    #28.2 c13
        addq      $64, %rcx                                     #28.2 c17
        shrq      $3, %rcx                                      #28.2 c21
        testq     %rdx, %rdx                                    #28.2 c21
        jne       ..L162        # Prob 50%                      #28.2 c25
        movq      %rdx, %rcx                                    #28.2
..L162:                                                         #
        xorl      %edx, %edx                                    #28.2 c25
        lea       32(%rcx), %rbx                                #28.2 c29
        cmpq      %rbx, %rax                                    #28.2 c33
        movq      %rax, %rbx                                    #28.2 c33
        jge       ..L163        # Prob 50%                      #28.2 c37
        movq      %rax, %rcx                                    #28.2
..L163:                                                         #
        subq      %rcx, %rbx                                    #28.2 c41
        andq      $31, %rbx                                     #28.2 c45
        negq      %rbx                                          #28.2 c49
        addq      %rax, %rbx                                    #28.2 c53
        cmpq      $1, %rcx                                      #28.2 c57
        jb        ..B2.29       # Prob 0%                       #28.2 c57
                                # LOE rax rdx rcx rbx rsi rdi r12 r13d
..B2.26:                        # Preds ..B2.25 Latency 9
        movl      $1, %r8d                                      #29.11 c1
        vbroadcastsd .L_2il0floatpacket.136(%rip), %zmm0        #29.11 c5
        kmov      %r8d, %k1                                     #29.11 c9
                                # LOE rax rdx rcx rbx rsi rdi r12 r13d zmm0 k1
..B2.27:                        # Preds ..B2.27 ..B2.26 Latency 13
        vmulpd    (%rsi,%rdx,8){1to8}, %zmm0, %zmm1{%k1}        #29.3 c1
        nop                                                     #29.3 c5
        vpackstorelpd %zmm1, (%rsi,%rdx,8){%k1}                 #29.3 c9
        incq      %rdx                                          #28.2 c9
        cmpq      %rcx, %rdx                                    #28.2 c13
        jb        ..B2.27       # Prob 82%                      #28.2 c13
                                # LOE rax rdx rcx rbx rsi rdi r12 r13d zmm0 k1
..B2.29:                        # Preds ..B2.27 ..B2.25 Latency 1
        cmpq      %rcx, %rax                                    #28.2 c1
        je        ..B2.38       # Prob 50%                      #28.2 c1
                                # LOE rax rcx rbx rsi rdi r12 r13d
..B2.30:                        # Preds ..B2.29 Latency 25
        vbroadcastsd .L_2il0floatpacket.136(%rip), %zmm5        #29.11 c1
        vprefetch0 (%rsi)                                       #28.2 c5
        movb      %al, %al                                      #28.2 c5
        vprefetch0 256(%rsi)                                    #28.2 c9
        movb      %al, %al                                      #28.2 c9
        vprefetch0 512(%rsi)                                    #28.2 c13
        movb      %al, %al                                      #28.2 c13
        vprefetch0 768(%rsi)                                    #28.2 c17
        movb      %al, %al                                      #28.2 c17
        vprefetch0 64(%rsi)                                     #28.2 c21
        movb      %al, %al                                      #28.2 c21
        vprefetch0 320(%rsi)                                    #28.2 c25
                                # LOE rax rcx rbx rsi rdi r12 r13d zmm5
..B2.31:                        # Preds ..B2.31 ..B2.30 Latency 37
        vmulpd    (%rsi,%rcx,8), %zmm5, %zmm0                   #29.3 c1
        vprefetche1 2048(%rsi,%rcx,8)                           #29.3 c1
        vmulpd    64(%rsi,%rcx,8), %zmm5, %zmm1                 #29.3 c5
        vprefetch0 1024(%rsi,%rcx,8)                            #29.3 c5
        vmulpd    128(%rsi,%rcx,8), %zmm5, %zmm2                #29.3 c9
        vprefetche1 2112(%rsi,%rcx,8)                           #29.3 c9
        vmulpd    192(%rsi,%rcx,8), %zmm5, %zmm3                #29.3 c13
        vprefetch0 1088(%rsi,%rcx,8)                            #29.3 c13
        vmovapd   %zmm0, (%rsi,%rcx,8)                          #29.3 c17
        vprefetche1 2176(%rsi,%rcx,8)                           #29.3 c17
        vmovapd   %zmm1, 64(%rsi,%rcx,8)                        #29.3 c21
        vprefetch0 1152(%rsi,%rcx,8)                            #29.3 c21
        vmovapd   %zmm2, 128(%rsi,%rcx,8)                       #29.3 c25
        vprefetche1 2240(%rsi,%rcx,8)                           #29.3 c25
        vmovapd   %zmm3, 192(%rsi,%rcx,8)                       #29.3 c29
        vprefetch0 1216(%rsi,%rcx,8)                            #29.3 c29
        addq      $32, %rcx                                     #28.2 c33
        cmpq      %rbx, %rcx                                    #28.2 c37
        jb        ..B2.31       # Prob 82%                      #28.2 c37
                                # LOE rax rcx rbx rsi rdi r12 r13d zmm5
..B2.32:                        # Preds ..B2.31 Latency 5
        lea       1(%rbx), %rdx                                 #28.2 c1
        cmpq      %rdx, %rax                                    #28.2 c5
        jb        ..B2.38       # Prob 50%                      #28.2 c5
                                # LOE rax rbx rdi r12 r13d zmm5
..B2.33:                        # Preds ..B2.32 Latency 29
        addq      %rbx, %rdi                                    #29.3 c1
        subq      %rbx, %rax                                    #28.2 c1
        movl      $21845, %ebx                                  #29.3 c5
        movq      %rax, (%rsp)                                  #28.2 c5
        kmov      %ebx, %k2                                     #29.3 c9
        movl      $43690, %ebx                                  #29.3 c9
        vpbroadcastq .L_2il0floatpacket.137(%rip), %zmm4        #28.2 c13
        vmovaps   .L_2il0floatpacket.138(%rip), %zmm3           #28.2 c17
        vpbroadcastq (%rsp), %zmm2                              #28.2 c21
        xorl      %ecx, %ecx                                    #28.2 c21
        vpxorq    %zmm1, %zmm1, %zmm1                           #29.3 c25
        lea       (%r12,%rdi,8), %rdx                           #29.3 c25
        vpxord    %zmm0, %zmm0, %zmm0                           #29.3 c29
        kmov      %ebx, %k1                                     #29.3 c29
                                # LOE rax rdx rcx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1 k2
..B2.34:                        # Preds ..B2.36 ..B2.33 Latency 57
        vpcmpud   $6, %zmm2, %zmm3, %k4                         #28.2 c1
        vpcmpud   $0, %zmm2, %zmm3, %k3                         #28.2 c5
        vpcmpgtd  %zmm2, %zmm3, %k0                             #28.2 c9
        kmov      %k4, %edi                                     #28.2 c9
        vmovaps   %zmm0, %zmm6                                  #28.2 c13
        kmov      %k3, %ebx                                     #28.2 c13
        addl      %edi, %edi                                    #28.2 c17
        kmov      %k0, %esi                                     #28.2 c17
        andl      %ebx, %edi                                    #28.2 c21
        orl       %esi, %edi                                    #28.2 c25
        andl      $-21846, %edi                                 #28.2 c29
        kmov      %edi, %k5                                     #28.2 c33
        vbroadcastss .L_2il0floatpacket.139(%rip), %zmm6{%k5}   #28.2 c37
        vcmpneqpd %zmm6, %zmm0, %k6                             #28.2 c41
        nop                                                     #28.2 c45
        knot      %k6, %k3                                      #28.2 c49
        knot      %k3, %k7                                      #28.2 c53
        jknzd     ..B2.40, %k7  # Prob 9%                       #28.2 c57
                                # LOE rax rdx rcx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1 k2 k3
..B2.35:                        # Preds ..B2.34 Latency 9
        vmulpd    (%rdx,%rcx,8), %zmm5, %zmm6                   #29.3 c1
        nop                                                     #29.3 c5
        vmovapd   %zmm6, (%rdx,%rcx,8)                          #29.3 c9
                                # LOE rax rdx rcx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1 k2
..B2.36:                        # Preds ..B2.40 ..B2.35 Latency 21
        vpaddsetcd %zmm4, %k3, %zmm3{%k2}                       #28.2 c1
        addq      $8, %rcx                                      #28.2 c1
        nop                                                     #28.2 c5
        kmov      %k3, %ebx                                     #28.2 c9
        addl      %ebx, %ebx                                    #28.2 c13
        kmov      %ebx, %k4                                     #28.2 c17
        cmpq      %rax, %rcx                                    #28.2 c17
        vpadcd    %zmm4, %k4, %zmm3{%k1}                        #28.2 c21
        jb        ..B2.34       # Prob 82%                      #28.2 c21
                                # LOE rax rdx rcx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1 k2
..B2.38:                        # Preds ..B2.36 ..B2.24 ..B2.29 ..B2.32 ..B2.23
                                #       Latency 9
        lea       .2.6_2_kmpc_loc_struct_pack.99(%rip), %rdi    #27.1 c1
        movl      %r13d, %esi                                   #27.1 c1
        xorl      %eax, %eax                                    #27.1 c5
..___tag_value__Z13hostmic_scalePdl.164:                        #27.1
        call      __kmpc_for_static_fini@PLT                    #27.1
..___tag_value__Z13hostmic_scalePdl.165:                        #
                                # LOE
..B2.39:                        # Preds ..B2.38 ..B2.21 Latency 13
        movq      8(%rsp), %r15                                 #27.1 c1
..___tag_value__Z13hostmic_scalePdl.166:                        #
        movq      16(%rsp), %r14                                #27.1 c1
..___tag_value__Z13hostmic_scalePdl.167:                        #
        movq      24(%rsp), %r13                                #27.1 c5
..___tag_value__Z13hostmic_scalePdl.168:                        #
        movq      32(%rsp), %r12                                #27.1 c5
..___tag_value__Z13hostmic_scalePdl.169:                        #
        movq      40(%rsp), %rbx                                #27.1 c9
..___tag_value__Z13hostmic_scalePdl.170:                        #
        movq      %rbp, %rsp                                    #27.1 c13
        popq      %rbp                                          #27.1
..___tag_value__Z13hostmic_scalePdl.171:                        #
        ret                                                     #27.1
..___tag_value__Z13hostmic_scalePdl.173:                        #
                                # LOE
..B2.40:                        # Preds ..B2.34                 # Infreq Latency 18
        vmovaps   %zmm1, %zmm6                                  #29.3 c1
        vmovapd   (%rdx,%rcx,8), %zmm6{%k3}                     #29.3 c5
        vmulpd    %zmm6, %zmm5, %zmm7                           #29.3 c9
        nop                                                     #29.3 c13
        vmovapd   %zmm7, (%rdx,%rcx,8){%k3}                     #29.3 c17
        jmp       ..B2.36       # Prob 100%                     #29.3 c17
        .align    16,0x90
..___tag_value__Z13hostmic_scalePdl.180:                        #
                                # LOE rax rdx rcx r13d zmm0 zmm1 zmm2 zmm3 zmm4 zmm5 k1 k2
# mark_end;
	.type	_Z13hostmic_scalePdl,@function
	.size	_Z13hostmic_scalePdl,.-_Z13hostmic_scalePdl
	.section .gcc_except_table, "a"
	.align 4
_Z13hostmic_scalePdl$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value__Z13hostmic_scalePdl.184 - ..___tag_value__Z13hostmic_scalePdl.183
..___tag_value__Z13hostmic_scalePdl.183:
	.byte	1
	.uleb128	..___tag_value__Z13hostmic_scalePdl.182 - ..___tag_value__Z13hostmic_scalePdl.181
..___tag_value__Z13hostmic_scalePdl.181:
	.uleb128	..___tag_value__Z13hostmic_scalePdl.92 - ..___tag_value__Z13hostmic_scalePdl.87
	.uleb128	..___tag_value__Z13hostmic_scalePdl.93 - ..___tag_value__Z13hostmic_scalePdl.92
	.byte	0
	.byte	0
..___tag_value__Z13hostmic_scalePdl.182:
	.long	0
..___tag_value__Z13hostmic_scalePdl.184:
	.data
	.align 4
.2.6_2_kmpc_loc_struct_pack.82:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.6_2__kmpc_loc_pack.81
	.align 4
.2.6_2__kmpc_loc_pack.81:
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
	.byte	55
	.byte	59
	.byte	50
	.byte	55
	.byte	59
	.byte	59
	.space 2, 0x00 	# pad
	.align 4
.2.6_2_kmpc_loc_struct_pack.99:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.6_2__kmpc_loc_pack.98
	.align 4
.2.6_2__kmpc_loc_pack.98:
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
	.byte	55
	.byte	59
	.byte	51
	.byte	51
	.byte	59
	.byte	59
	.space 2, 0x00 	# pad
	.align 4
.2.6_2_kmpc_loc_struct_pack.119:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.6_2__kmpc_loc_pack.118
	.align 4
.2.6_2__kmpc_loc_pack.118:
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
	.byte	49
	.byte	59
	.byte	51
	.byte	51
	.byte	59
	.byte	59
	.space 2, 0x00 	# pad
	.align 4
.2.6_2_kmpc_loc_struct_pack.90:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.6_2__kmpc_loc_pack.89
	.align 4
.2.6_2__kmpc_loc_pack.89:
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
	.byte	50
	.byte	59
	.byte	51
	.byte	51
	.byte	59
	.byte	59
	.data
# -- End  _Z13hostmic_scalePdl, L__Z13hostmic_scalePdl_27__par_loop0_2.97, L__Z13hostmic_scalePdl_31__par_region1_2.117
	.bss
	.align 4
	.align 4
___kmpv_zero_Z7mic_sumPdl_0:
	.type	___kmpv_zero_Z7mic_sumPdl_0,@object
	.size	___kmpv_zero_Z7mic_sumPdl_0,4
	.space 4	# pad
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
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.68:
	.long	0x00000001,0x00000000,0x00000002,0x00000000,0x00000003,0x00000000,0x00000004,0x00000000,0x00000005,0x00000000,0x00000006,0x00000000,0x00000007,0x00000000,0x00000008,0x00000000
	.type	.L_2il0floatpacket.68,@object
	.size	.L_2il0floatpacket.68,64
	.align 64
.L_2il0floatpacket.138:
	.long	0x00000001,0x00000000,0x00000002,0x00000000,0x00000003,0x00000000,0x00000004,0x00000000,0x00000005,0x00000000,0x00000006,0x00000000,0x00000007,0x00000000,0x00000008,0x00000000
	.type	.L_2il0floatpacket.138,@object
	.size	.L_2il0floatpacket.138,64
	.align 8
.L_2il0floatpacket.67:
	.long	0x00000008,0x00000000
	.type	.L_2il0floatpacket.67,@object
	.size	.L_2il0floatpacket.67,8
	.align 8
.L_2il0floatpacket.136:
	.long	0xa53d6e3c,0x3ff965fe
	.type	.L_2il0floatpacket.136,@object
	.size	.L_2il0floatpacket.136,8
	.align 8
.L_2il0floatpacket.137:
	.long	0x00000008,0x00000000
	.type	.L_2il0floatpacket.137,@object
	.size	.L_2il0floatpacket.137,8
	.align 4
.L_2il0floatpacket.69:
	.long	0x40000000
	.type	.L_2il0floatpacket.69,@object
	.size	.L_2il0floatpacket.69,4
	.align 4
.L_2il0floatpacket.139:
	.long	0x40000000
	.type	.L_2il0floatpacket.139,@object
	.size	.L_2il0floatpacket.139,4
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
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
	.space 2, 0x00 	# pad
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
	.data
	.comm mic_sum_kmpc_tree_reduct_lock_0,32,8
# mark_proc_addr_taken L__Z13hostmic_scalePdl_31__par_region1_2.117;
# mark_proc_addr_taken L__Z13hostmic_scalePdl_27__par_loop0_2.97;
# mark_proc_addr_taken L__Z7mic_sumPdl_15__tree_reduce0_2.57;
# mark_proc_addr_taken L__Z7mic_sumPdl_15__par_loop0_2.19;
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
	.4byte 0x0000022c
	.4byte 0x00000024
	.4byte ..___tag_value__Z7mic_sumPdl.1-.
	.4byte ..___tag_value__Z7mic_sumPdl.82-..___tag_value__Z7mic_sumPdl.1
	.byte 0x04
	.4byte _Z7mic_sumPdl$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.3-..___tag_value__Z7mic_sumPdl.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.4-..___tag_value__Z7mic_sumPdl.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z7mic_sumPdl.7-..___tag_value__Z7mic_sumPdl.4
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
	.4byte ..___tag_value__Z7mic_sumPdl.23-..___tag_value__Z7mic_sumPdl.7
	.2byte 0x04cf
	.4byte ..___tag_value__Z7mic_sumPdl.24-..___tag_value__Z7mic_sumPdl.23
	.2byte 0x04ce
	.4byte ..___tag_value__Z7mic_sumPdl.25-..___tag_value__Z7mic_sumPdl.24
	.2byte 0x04cd
	.4byte ..___tag_value__Z7mic_sumPdl.26-..___tag_value__Z7mic_sumPdl.25
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.27-..___tag_value__Z7mic_sumPdl.26
	.2byte 0x04c3
	.4byte ..___tag_value__Z7mic_sumPdl.28-..___tag_value__Z7mic_sumPdl.27
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.30-..___tag_value__Z7mic_sumPdl.28
	.4byte 0x0410060c
	.4byte ..___tag_value__Z7mic_sumPdl.32-..___tag_value__Z7mic_sumPdl.30
	.4byte 0x0410070c
	.4byte ..___tag_value__Z7mic_sumPdl.33-..___tag_value__Z7mic_sumPdl.32
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z7mic_sumPdl.35-..___tag_value__Z7mic_sumPdl.33
	.8byte 0xffc00d1c380e0f10
	.8byte 0xffffff900d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z7mic_sumPdl.36-..___tag_value__Z7mic_sumPdl.35
	.8byte 0xffc00d1c380e0e10
	.8byte 0xffffff980d1affff
	.2byte 0xcf22
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.38-..___tag_value__Z7mic_sumPdl.36
	.8byte 0xffc00d1c380e0d10
	.8byte 0xffffffa00d1affff
	.2byte 0xce22
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.40-..___tag_value__Z7mic_sumPdl.38
	.8byte 0xffc00d1c380e0c10
	.8byte 0xffffffa80d1affff
	.2byte 0xcd22
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.42-..___tag_value__Z7mic_sumPdl.40
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.43-..___tag_value__Z7mic_sumPdl.42
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.45-..___tag_value__Z7mic_sumPdl.43
	.4byte 0x0410060c
	.4byte ..___tag_value__Z7mic_sumPdl.47-..___tag_value__Z7mic_sumPdl.45
	.4byte 0x0410070c
	.4byte ..___tag_value__Z7mic_sumPdl.48-..___tag_value__Z7mic_sumPdl.47
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z7mic_sumPdl.50-..___tag_value__Z7mic_sumPdl.48
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffb00d1affff
	.8byte 0xc00d1c380e0d1022
	.8byte 0xffffa00d1affffff
	.8byte 0x0d1c380e0f1022ff
	.8byte 0xff900d1affffffc0
	.4byte 0x0422ffff
	.4byte ..___tag_value__Z7mic_sumPdl.53-..___tag_value__Z7mic_sumPdl.50
	.8byte 0xffc00d1c380e0c10
	.8byte 0xffffffa80d1affff
	.8byte 0xc00d1c380e0e1022
	.8byte 0xffff980d1affffff
	.2byte 0x22ff
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.68-..___tag_value__Z7mic_sumPdl.53
	.2byte 0x04cf
	.4byte ..___tag_value__Z7mic_sumPdl.69-..___tag_value__Z7mic_sumPdl.68
	.2byte 0x04ce
	.4byte ..___tag_value__Z7mic_sumPdl.70-..___tag_value__Z7mic_sumPdl.69
	.2byte 0x04cd
	.4byte ..___tag_value__Z7mic_sumPdl.71-..___tag_value__Z7mic_sumPdl.70
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.72-..___tag_value__Z7mic_sumPdl.71
	.2byte 0x04c3
	.4byte ..___tag_value__Z7mic_sumPdl.73-..___tag_value__Z7mic_sumPdl.72
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.75-..___tag_value__Z7mic_sumPdl.73
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
	.4byte 0x0000024c
	.4byte 0x00000254
	.4byte ..___tag_value__Z13hostmic_scalePdl.87-.
	.4byte ..___tag_value__Z13hostmic_scalePdl.180-..___tag_value__Z13hostmic_scalePdl.87
	.byte 0x04
	.4byte _Z13hostmic_scalePdl$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.89-..___tag_value__Z13hostmic_scalePdl.87
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.90-..___tag_value__Z13hostmic_scalePdl.89
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z13hostmic_scalePdl.93-..___tag_value__Z13hostmic_scalePdl.90
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
	.4byte ..___tag_value__Z13hostmic_scalePdl.119-..___tag_value__Z13hostmic_scalePdl.93
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.120-..___tag_value__Z13hostmic_scalePdl.119
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.121-..___tag_value__Z13hostmic_scalePdl.120
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.122-..___tag_value__Z13hostmic_scalePdl.121
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.123-..___tag_value__Z13hostmic_scalePdl.122
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.124-..___tag_value__Z13hostmic_scalePdl.123
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.126-..___tag_value__Z13hostmic_scalePdl.124
	.4byte 0x0410060c
	.4byte ..___tag_value__Z13hostmic_scalePdl.128-..___tag_value__Z13hostmic_scalePdl.126
	.4byte 0x0410070c
	.4byte ..___tag_value__Z13hostmic_scalePdl.129-..___tag_value__Z13hostmic_scalePdl.128
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z13hostmic_scalePdl.131-..___tag_value__Z13hostmic_scalePdl.129
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffa80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z13hostmic_scalePdl.132-..___tag_value__Z13hostmic_scalePdl.131
	.8byte 0xffc00d1c380e0c10
	.8byte 0xffffffa00d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z13hostmic_scalePdl.134-..___tag_value__Z13hostmic_scalePdl.132
	.8byte 0xffc00d1c380e0d10
	.8byte 0xffffff980d1affff
	.8byte 0xc00d1c380e0e1022
	.8byte 0xffff900d1affffff
	.8byte 0x0d1c380e0f1022ff
	.8byte 0xff880d1affffffc0
	.4byte 0x0422ffff
	.4byte ..___tag_value__Z13hostmic_scalePdl.142-..___tag_value__Z13hostmic_scalePdl.134
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.143-..___tag_value__Z13hostmic_scalePdl.142
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.144-..___tag_value__Z13hostmic_scalePdl.143
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.145-..___tag_value__Z13hostmic_scalePdl.144
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.146-..___tag_value__Z13hostmic_scalePdl.145
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.147-..___tag_value__Z13hostmic_scalePdl.146
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.149-..___tag_value__Z13hostmic_scalePdl.147
	.4byte 0x0410060c
	.4byte ..___tag_value__Z13hostmic_scalePdl.151-..___tag_value__Z13hostmic_scalePdl.149
	.4byte 0x0410070c
	.4byte ..___tag_value__Z13hostmic_scalePdl.152-..___tag_value__Z13hostmic_scalePdl.151
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z13hostmic_scalePdl.154-..___tag_value__Z13hostmic_scalePdl.152
	.8byte 0xffc00d1c380e0310
	.8byte 0xffffffa80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z13hostmic_scalePdl.155-..___tag_value__Z13hostmic_scalePdl.154
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
	.4byte ..___tag_value__Z13hostmic_scalePdl.166-..___tag_value__Z13hostmic_scalePdl.155
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.167-..___tag_value__Z13hostmic_scalePdl.166
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.168-..___tag_value__Z13hostmic_scalePdl.167
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.169-..___tag_value__Z13hostmic_scalePdl.168
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.170-..___tag_value__Z13hostmic_scalePdl.169
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.171-..___tag_value__Z13hostmic_scalePdl.170
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.173-..___tag_value__Z13hostmic_scalePdl.171
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
// -- Begin DWARF2 SEGMENT .gnu.linkonce.d.DW.ref.__gxx_personality_v0
	.section .gnu.linkonce.d.DW.ref.__gxx_personality_v0,"a",@progbits
	.weak DW.ref.__gxx_personality_v0
	.align 1
.hidden DW.ref.__gxx_personality_v0
DW.ref.__gxx_personality_v0:
	.8byte __gxx_personality_v0
# End

