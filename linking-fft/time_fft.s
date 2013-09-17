# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-I /usr/caen/intel-12.1/mkl/include -I /home/software/rhel6/fftw-3.3.2/intel-12.1/include -O3 -prec-div -no-";
# mark_description "ftz -restrict -Wshadow -fPIC -S";
	.file "time_fft.cpp"
	.text
..TXTST0:
# -- Begin  main
# mark_begin;
..___tag_value_main.2:                                         #
        .align    16,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0
..___tag_value_main.3:                                          #159.11
        pushq     %rbp                                          #159.11
..___tag_value_main.5:                                          #
        movq      %rsp, %rbp                                    #159.11
..___tag_value_main.6:                                          #
        andq      $-128, %rsp                                   #159.11
        pushq     %r12                                          #159.11
..___tag_value_main.8:                                          #
        pushq     %r13                                          #159.11
..___tag_value_main.9:                                          #
        subq      $752, %rsp                                    #159.11
        xorl      %edi, %edi                                    #159.11
..___tag_value_main.10:                                         #159.11
        call      __intel_new_proc_init@PLT                     #159.11
..___tag_value_main.12:                                         #
                                # LOE rbx r14 r15
..B1.23:                        # Preds ..B1.1
        lea       .L_2__STRING.24(%rip), %rdi                   #160.2
..___tag_value_main.14:                                         #160.2
        call      _Z10verify_dirPKc@PLT                         #160.2
..___tag_value_main.16:                                         #
                                # LOE rbx r14 r15
..B1.2:                         # Preds ..B1.23
        lea       .L_2__STRING.26(%rip), %rsi                   #163.17
        lea       8(%rsp), %rdi                                 #163.17
        movl      $48, %edx                                     #163.17
..___tag_value_main.18:                                         #163.17
        call      _ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode@PLT #163.17
..___tag_value_main.20:                                         #
                                # LOE rbx r14 r15
..B1.3:                         # Preds ..B1.2
        movq      _ZSt4cout@GOTPCREL(%rip), %r13                #169.14
        movq      (%r13), %rax                                  #169.14
        movq      _ZSt4cout@GOTPCREL(%rip), %r13                #169.14
        movq      %r13, %rdi                                    #169.14
        addq      -24(%rax), %rdi                               #169.14
..___tag_value_main.22:                                         #169.14
        call      _ZNKSt9basic_iosIcSt11char_traitsIcEE5rdbufEv@PLT #169.14
..___tag_value_main.24:                                         #
                                # LOE rax rbx r13 r14 r15
..B1.22:                        # Preds ..B1.3
        movq      %rax, %r12                                    #169.14
..___tag_value_main.26:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.4:                         # Preds ..B1.22
        lea       8(%rsp), %rdi                                 #170.19
..___tag_value_main.27:                                         #170.19
        call      _ZNKSt14basic_ofstreamIcSt11char_traitsIcEE5rdbufEv@PLT #170.19
..___tag_value_main.29:                                         #
                                # LOE rax rbx r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4
        movq      _ZSt4cout@GOTPCREL(%rip), %rdx                #170.7
        movq      %r13, %rdi                                    #170.7
        movq      %rax, %rsi                                    #170.7
        movq      (%rdx), %rcx                                  #170.7
        addq      -24(%rcx), %rdi                               #170.7
..___tag_value_main.31:                                         #170.7
        call      _ZNSt9basic_iosIcSt11char_traitsIcEE5rdbufEPSt15basic_streambufIcS1_E@PLT #170.7
..___tag_value_main.33:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
        lea       .L_2__STRING.27(%rip), %rsi                   #172.2
        lea       520(%rsp), %rdi                               #172.2
        lea       .L_2__STRING.25(%rip), %rdx                   #172.2
        xorl      %eax, %eax                                    #172.2
        call      sprintf@PLT                                   #172.2
..___tag_value_main.35:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
        xorl      %edi, %edi                                    #173.2
        lea       520(%rsp), %rsi                               #173.2
..___tag_value_main.36:                                         #173.2
        call      _Z10make_table10yesno_typePKc@PLT             #173.2
..___tag_value_main.38:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7
        lea       .L_2__STRING.28(%rip), %rsi                   #174.2
        lea       520(%rsp), %rdi                               #174.2
        lea       .L_2__STRING.25(%rip), %rdx                   #174.2
        xorl      %eax, %eax                                    #174.2
        call      sprintf@PLT                                   #174.2
..___tag_value_main.40:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.9:                         # Preds ..B1.8
        movl      $1, %edi                                      #175.2
        lea       520(%rsp), %rsi                               #175.2
..___tag_value_main.41:                                         #175.2
        call      _Z10make_table10yesno_typePKc@PLT             #175.2
..___tag_value_main.43:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9
        movq      _ZSt4cout@GOTPCREL(%rip), %rax                #176.7
        movq      %r12, %rsi                                    #176.7
        movq      (%rax), %rdx                                  #176.7
        addq      -24(%rdx), %r13                               #176.7
        movq      %r13, %rdi                                    #176.7
..___tag_value_main.45:                                         #176.7
        call      _ZNSt9basic_iosIcSt11char_traitsIcEE5rdbufEPSt15basic_streambufIcS1_E@PLT #176.7
..___tag_value_main.47:                                         #
                                # LOE rbx r14 r15
..B1.11:                        # Preds ..B1.10
        lea       8(%rsp), %rdi                                 #177.8
..___tag_value_main.49:                                         #177.8
        call      _ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv@PLT #177.8
..___tag_value_main.51:                                         #
                                # LOE rbx r14 r15
..B1.12:                        # Preds ..B1.11
        lea       8(%rsp), %rdi                                 #177.8
..___tag_value_main.53:                                         #177.8
        call      _ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT #177.8
..___tag_value_main.55:                                         #
                                # LOE rbx r14 r15
..B1.13:                        # Preds ..B1.12
        xorl      %eax, %eax                                    #178.1
        addq      $752, %rsp                                    #178.1
..___tag_value_main.57:                                         #
        popq      %r13                                          #178.1
..___tag_value_main.59:                                         #178.1
        popq      %r12                                          #178.1
        movq      %rbp, %rsp                                    #178.1
        popq      %rbp                                          #178.1
..___tag_value_main.60:                                         #
        ret                                                     #178.1
..___tag_value_main.62:                                         #
                                # LOE
..___tag_value_main.1:
..B1.14:                        # Preds ..B1.11 ..B1.10 ..B1.9 ..B1.7 ..B1.5
                                #       ..B1.4 ..B1.3
        movq      %rax, (%rsp)                                  #163.17
..___tag_value_main.67:                                         #
                                # LOE rbx r14 r15
..B1.15:                        # Preds ..B1.14
        lea       8(%rsp), %rdi                                 #163.17
..___tag_value_main.68:                                         #163.17
        call      _ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev@PLT #163.17
..___tag_value_main.70:                                         #
                                # LOE rbx r14 r15
..B1.16:                        # Preds ..B1.15
        xorl      %eax, %eax                                    #163.17
        movq      (%rsp), %rdi                                  #163.17
..___tag_value_main.72:                                         #163.17
        call      _Unwind_Resume@PLT                            #163.17
..___tag_value_main.74:                                         #
        .align    16,0x90
..___tag_value_main.75:                                         #
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.section .gcc_except_table, "a"
	.align 4
main$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value_main.79 - ..___tag_value_main.78
..___tag_value_main.78:
	.byte	1
	.uleb128	..___tag_value_main.77 - ..___tag_value_main.76
..___tag_value_main.76:
	.uleb128	..___tag_value_main.10 - ..___tag_value_main.3
	.uleb128	..___tag_value_main.20 - ..___tag_value_main.10
	.byte	0
	.byte	0
	.uleb128	..___tag_value_main.22 - ..___tag_value_main.3
	.uleb128	..___tag_value_main.51 - ..___tag_value_main.22
	.uleb128	..___tag_value_main.1 - ..___tag_value_main.3
	.byte	0
	.uleb128	..___tag_value_main.53 - ..___tag_value_main.3
	.uleb128	..___tag_value_main.55 - ..___tag_value_main.53
	.byte	0
	.byte	0
	.uleb128	..___tag_value_main.72 - ..___tag_value_main.3
	.uleb128	..___tag_value_main.74 - ..___tag_value_main.72
	.byte	0
	.byte	0
..___tag_value_main.77:
	.long	0
..___tag_value_main.79:
	.data
# -- End  main
	.text
# -- Begin  _Z10make_table10yesno_typePKc
# mark_begin;
       .align    16,0x90
	.globl _Z10make_table10yesno_typePKc
_Z10make_table10yesno_typePKc:
# parameter 1: %edi
# parameter 2: %rsi
..B2.1:                         # Preds ..B2.0
..___tag_value__Z10make_table10yesno_typePKc.80:                #131.65
        pushq     %r12                                          #131.65
..___tag_value__Z10make_table10yesno_typePKc.82:                #
        pushq     %r13                                          #131.65
..___tag_value__Z10make_table10yesno_typePKc.84:                #
        pushq     %r14                                          #131.65
..___tag_value__Z10make_table10yesno_typePKc.86:                #
        pushq     %r15                                          #131.65
..___tag_value__Z10make_table10yesno_typePKc.88:                #
        pushq     %rbx                                          #131.65
..___tag_value__Z10make_table10yesno_typePKc.90:                #
        pushq     %rbp                                          #131.65
..___tag_value__Z10make_table10yesno_typePKc.92:                #
        subq      $328, %rsp                                    #131.65
..___tag_value__Z10make_table10yesno_typePKc.94:                #
        movq      %rsi, %r15                                    #131.65
        movsd     .L_2il0floatpacket.464(%rip), %xmm0           #138.36
        movl      %edi, %ebp                                    #131.65
        movl      $32, 8(%rsp)                                  #133.17
        xorl      %ebx, %ebx                                    #137.11
        movl      $64, 12(%rsp)                                 #133.17
        movl      $80, 16(%rsp)                                 #133.17
        movl      $168, 20(%rsp)                                #133.17
        movl      $192, 24(%rsp)                                #133.17
        movl      $1024, 28(%rsp)                               #133.17
        movl      $131072, 32(%rsp)                             #133.17
        movl      $1048576, 36(%rsp)                            #133.17
        call      log@PLT                                       #138.36
                                # LOE rbx r12 r13 r14 r15 ebp xmm0
..B2.216:                       # Preds ..B2.1
        movsd     %xmm0, 48(%rsp)                               #138.36
        movq      %r15, 320(%rsp)                               #138.36
                                # LOE rbx ebp
..B2.2:                         # Preds ..B2.106 ..B2.216
        cvtsi2sd  8(%rsp,%rbx,4), %xmm0                         #138.17
        movsd     %xmm0, 64(%rsp)                               #138.17
        call      log@PLT                                       #138.22
                                # LOE rbx ebp xmm0
..B2.217:                       # Preds ..B2.2
        mulsd     64(%rsp), %xmm0                               #138.22
        movl      %ebp, %esi                                    #139.3
        divsd     48(%rsp), %xmm0                               #138.36
        movl      8(%rsp,%rbx,4), %edi                          #139.3
        movsd     %xmm0, 56(%rsp)                               #138.36
..___tag_value__Z10make_table10yesno_typePKc.95:                #139.3
        call      _Z8time_ffti10yesno_type@PLT                  #139.3
..___tag_value__Z10make_table10yesno_typePKc.96:                #
                                # LOE rbx ebp
..B2.3:                         # Preds ..B2.217
        movq      stat_mkl(%rip), %r15                          #140.13
        movslq    16(%r15), %rax                                #140.23
        testq     %rax, %rax                                    #140.23
        jle       ..B2.204      # Prob 20%                      #140.23
                                # LOE rax rbx r15 ebp
..B2.4:                         # Preds ..B2.3
        cmpl      $1, 12(%r15)                                  #140.23
        je        ..B2.243      # Prob 41%                      #140.23
                                # LOE rax rbx r15 ebp
..B2.5:                         # Preds ..B2.4
        movq      (%r15), %r14                                  #140.23
        lea       (,%rax,8), %rdx                               #140.23
        lea       (%r14,%rax,8), %r12                           #140.23
        cmpq      %r12, %r14                                    #140.23
        je        ..B2.27       # Prob 33%                      #140.23
                                # LOE rdx rbx r12 r14 r15 ebp
..B2.6:                         # Preds ..B2.5
        movq      %rdx, %rax                                    #140.23
        movq      %r12, %rsi                                    #140.23
        sarq      $3, %rax                                      #140.23
        sarq      $35, %rdx                                     #140.23
        bsr       %eax, %ecx                                    #140.23
        bsr       %edx, %r13d                                   #140.23
        negl      %ecx                                          #140.23
        negl      %r13d                                         #140.23
        addl      $63, %ecx                                     #140.23
        addl      $31, %r13d                                    #140.23
        testl     %edx, %edx                                    #140.23
        cmove     %ecx, %r13d                                   #140.23
        movslq    %r13d, %r13                                   #140.23
        addq      %r13, %r13                                    #140.23
        negq      %r13                                          #140.23
        addq      $126, %r13                                    #140.23
        cmpq      $16, %rax                                     #140.23
        jle       ..B2.168      # Prob 5%                       #140.23
                                # LOE rbx rsi r12 r13 r14 r15 ebp
..B2.7:                         # Preds ..B2.6
        movl      %ebp, 40(%rsp)                                #
                                # LOE rbx rsi r12 r13 r14 r15
..B2.8:                         # Preds ..B2.110 ..B2.7
        movq      %rsi, %rdi                                    #140.23
        subq      %r14, %rdi                                    #140.23
        sarq      $3, %rdi                                      #140.23
        testq     %r13, %r13                                    #140.23
        je        ..B2.133      # Prob 20%                      #140.23
                                # LOE rbx rsi rdi r12 r13 r14 r15
..B2.9:                         # Preds ..B2.8
        movq      %rdi, %rax                                    #140.23
        decq      %r13                                          #140.23
        shrq      $63, %rax                                     #140.23
        addq      %rax, %rdi                                    #140.23
        lea       -8(%rsi), %rax                                #140.23
        shrq      $1, %rdi                                      #140.23
        movsd     (%r14), %xmm2                                 #140.23
        movsd     -8(%rsi), %xmm1                               #140.23
        lea       (%r14,%rdi,8), %rdx                           #140.23
        movsd     (%rdx), %xmm0                                 #140.23
        comisd    %xmm2, %xmm0                                  #140.23
        jbe       ..B2.13       # Prob 50%                      #140.23
                                # LOE rax rdx rbx rsi r12 r13 r14 r15 xmm0 xmm1 xmm2
..B2.10:                        # Preds ..B2.9
        comisd    %xmm0, %xmm1                                  #140.23
        ja        ..B2.12       # Prob 28%                      #140.23
                                # LOE rax rdx rbx rsi r12 r13 r14 r15 xmm1 xmm2
..B2.11:                        # Preds ..B2.10
        comisd    %xmm2, %xmm1                                  #140.23
        movq      %rax, %rdx                                    #140.23
        movq      %r14, %rbp                                    #140.23
        ja        ..B2.16       # Prob 50%                      #140.23
        movq      %r14, %rdx                                    #140.23
        jmp       ..B2.16       # Prob 100%                     #140.23
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15
..B2.12:                        # Preds ..B2.10
        movq      %r14, %rbp                                    #140.23
        jmp       ..B2.16       # Prob 100%                     #140.23
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15
..B2.13:                        # Preds ..B2.9
        comisd    %xmm2, %xmm1                                  #140.23
        ja        ..B2.15       # Prob 28%                      #140.23
                                # LOE rax rdx rbx rsi r12 r13 r14 r15 xmm0 xmm1
..B2.14:                        # Preds ..B2.13
        comisd    %xmm0, %xmm1                                  #140.23
        movq      %r14, %rbp                                    #140.23
        jbe       ..B2.16       # Prob 50%                      #140.23
        movq      %rax, %rdx                                    #140.23
        jmp       ..B2.16       # Prob 100%                     #140.23
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15
..B2.15:                        # Preds ..B2.13
        movq      %r14, %rdx                                    #140.23
        movq      %rdx, %rbp                                    #140.23
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15
..B2.16:                        # Preds ..B2.12 ..B2.11 ..B2.15 ..B2.14
        movq      %rsi, %rax                                    #140.23
        movsd     (%rdx), %xmm0                                 #140.23
        jmp       ..B2.17       # Prob 100%                     #140.23
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.26:                        # Preds ..B2.25
        movsd     %xmm2, (%rbp)                                 #140.23
        addq      $8, %rbp                                      #140.23
        movsd     %xmm1, (%rax)                                 #140.23
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.17:                        # Preds ..B2.26 ..B2.16
        movsd     (%rbp), %xmm1                                 #140.23
        comisd    %xmm1, %xmm0                                  #140.23
        jbe       ..B2.21       # Prob 10%                      #140.23
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.19:                        # Preds ..B2.17 ..B2.19
        addq      $8, %rbp                                      #140.23
        movsd     (%rbp), %xmm1                                 #140.23
        comisd    %xmm1, %xmm0                                  #140.23
        ja        ..B2.19       # Prob 82%                      #140.23
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.21:                        # Preds ..B2.21 ..B2.19 ..B2.17
        addq      $-8, %rax                                     #140.23
        movsd     (%rax), %xmm2                                 #140.23
        comisd    %xmm0, %xmm2                                  #140.23
        ja        ..B2.21       # Prob 90%                      #140.23
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1 xmm2
..B2.25:                        # Preds ..B2.21
        cmpq      %rax, %rbp                                    #140.23
        jae       ..B2.109      # Prob 20%                      #140.23
        jmp       ..B2.26       # Prob 100%                     #140.23
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1 xmm2
..B2.27:                        # Preds ..B2.168 ..B2.179 ..B2.242 ..B2.132 ..B2.5
                                #      
        movl      $1, 12(%r15)                                  #140.23
                                # LOE rbx r14 r15 ebp
..B2.28:                        # Preds ..B2.243 ..B2.27
        movl      16(%r15), %edx                                #140.23
        movl      %edx, %eax                                    #140.3
        shrl      $31, %eax                                     #140.3
        addl      %eax, %edx                                    #140.23
        sarl      $1, %edx                                      #140.23
        movslq    %edx, %rdx                                    #140.23
        movsd     (%r14,%rdx,8), %xmm0                          #140.23
        divsd     56(%rsp), %xmm0                               #140.32
        movq      stat_fftw(%rip), %r14                         #141.21
        movsd     %xmm0, 128(%rsp,%rbx,8)                       #140.3
        movl      16(%r14), %eax                                #141.32
        testl     %eax, %eax                                    #141.32
        jle       ..B2.194      # Prob 20%                      #141.32
                                # LOE rbx r14 eax ebp
..B2.29:                        # Preds ..B2.28
        movq      (%r14), %r12                                  #141.32
        cmpl      $1, 12(%r14)                                  #141.32
        je        ..B2.67       # Prob 41%                      #141.32
                                # LOE rbx r12 r14 eax ebp
..B2.30:                        # Preds ..B2.29
        movslq    %eax, %rax                                    #141.32
        lea       (%r12,%rax,8), %r13                           #141.32
        cmpq      %r13, %r12                                    #141.32
        lea       (,%rax,8), %rdx                               #141.32
        je        ..B2.66       # Prob 33%                      #141.32
                                # LOE rdx rbx r12 r13 r14 eax ebp
..B2.31:                        # Preds ..B2.30
        movq      %rdx, %r15                                    #141.32
        movq      %r12, %rdi                                    #141.32
        sarq      $3, %r15                                      #141.32
        movq      %r13, %rsi                                    #141.32
        sarq      $35, %rdx                                     #141.32
        bsr       %r15d, %eax                                   #141.32
        bsr       %edx, %ecx                                    #141.32
        negl      %eax                                          #141.32
        negl      %ecx                                          #141.32
        addl      $63, %eax                                     #141.32
        addl      $31, %ecx                                     #141.32
        testl     %edx, %edx                                    #141.32
        cmove     %eax, %ecx                                    #141.32
        movslq    %ecx, %rcx                                    #141.32
        addq      %rcx, %rcx                                    #141.32
        negq      %rcx                                          #141.32
        addq      $126, %rcx                                    #141.32
        movq      %rcx, %rdx                                    #141.32
..___tag_value__Z10make_table10yesno_typePKc.97:                #141.32
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_@PLT      #141.32
..___tag_value__Z10make_table10yesno_typePKc.98:                #
                                # LOE rbx r12 r13 r14 r15 ebp
..B2.32:                        # Preds ..B2.31
        cmpq      $16, %r15                                     #141.32
        jle       ..B2.54       # Prob 50%                      #141.32
                                # LOE rbx r12 r13 r14 ebp
..B2.33:                        # Preds ..B2.32
        lea       128(%r12), %rax                               #141.32
                                # LOE rax rbx r12 r13 r14 ebp
..B2.34:                        # Preds ..B2.33
        lea       8(%r12), %r15                                 #141.32
                                # LOE rax rbx r12 r13 r14 r15 ebp
..B2.35:                        # Preds ..B2.34
        movq      %rbx, (%rsp)                                  #
        movq      %rax, %rbx                                    #
        movl      %ebp, 40(%rsp)                                #
                                # LOE rbx r12 r13 r14 r15
..B2.36:                        # Preds ..B2.44 ..B2.35
        movsd     (%r15), %xmm1                                 #141.32
        movsd     (%r12), %xmm0                                 #141.32
        movq      (%r15), %rbp                                  #141.32
        comisd    %xmm1, %xmm0                                  #141.32
        jbe       ..B2.39       # Prob 50%                      #141.32
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.37:                        # Preds ..B2.36
        movq      %r15, %rdx                                    #141.32
        movq      %r12, %rsi                                    #141.32
        subq      %r12, %rdx                                    #141.32
        shrq      $3, %rdx                                      #141.32
        shlq      $3, %rdx                                      #141.32
        movq      %rdx, %rcx                                    #141.32
        negq      %rcx                                          #141.32
        lea       8(%r15,%rcx), %rdi                            #141.32
        call      memmove@PLT                                   #141.32
                                # LOE rbx rbp r12 r13 r14 r15
..B2.38:                        # Preds ..B2.37
        movq      %rbp, (%r12)                                  #141.32
        jmp       ..B2.44       # Prob 100%                     #141.32
                                # LOE rbx r12 r13 r14 r15
..B2.39:                        # Preds ..B2.36
        movsd     -8(%r15), %xmm0                               #141.32
        lea       -16(%r15), %rcx                               #
        movq      %r15, %rsi                                    #141.32
        lea       -8(%r15), %rdx                                #141.32
        comisd    %xmm1, %xmm0                                  #141.32
        jbe       ..B2.43       # Prob 10%                      #141.32
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.41:                        # Preds ..B2.39 ..B2.41
        movsd     %xmm0, (%rsi)                                 #141.32
        movq      %rdx, %rsi                                    #141.32
        movsd     (%rcx), %xmm0                                 #141.32
        addq      $-8, %rcx                                     #141.32
        addq      $-8, %rdx                                     #141.32
        comisd    %xmm1, %xmm0                                  #141.32
        ja        ..B2.41       # Prob 82%                      #141.32
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.43:                        # Preds ..B2.41 ..B2.39
        movq      %rbp, (%rsi)                                  #141.32
                                # LOE rbx r12 r13 r14 r15
..B2.44:                        # Preds ..B2.38 ..B2.43
        addq      $8, %r15                                      #141.32
        cmpq      %rbx, %r15                                    #141.32
        jne       ..B2.36       # Prob 82%                      #141.32
                                # LOE rbx r12 r13 r14 r15
..B2.45:                        # Preds ..B2.44
        movq      (%rsp), %rbx                                  #
        movl      40(%rsp), %ebp                                #
                                # LOE rbx rbp r12 r13 r14 ebp bpl
..B2.46:                        # Preds ..B2.45
        addq      $128, %r12                                    #141.32
        cmpq      %r13, %r12                                    #141.32
        je        ..B2.53       # Prob 2%                       #141.32
                                # LOE rbx rbp r12 r13 r14 ebp bpl
..B2.48:                        # Preds ..B2.46 ..B2.52
        movsd     (%r12), %xmm1                                 #141.32
        lea       -16(%r12), %rdx                               #
        movsd     -8(%r12), %xmm0                               #141.32
        lea       -8(%r12), %rax                                #141.32
        movq      (%r12), %rcx                                  #141.32
        movq      %r12, %rsi                                    #141.32
        comisd    %xmm1, %xmm0                                  #141.32
        jbe       ..B2.52       # Prob 10%                      #141.32
                                # LOE rax rdx rcx rbx rsi r12 r13 r14 ebp xmm0 xmm1
..B2.50:                        # Preds ..B2.48 ..B2.50
        movsd     %xmm0, (%rsi)                                 #141.32
        movq      %rax, %rsi                                    #141.32
        movsd     (%rdx), %xmm0                                 #141.32
        addq      $-8, %rdx                                     #141.32
        addq      $-8, %rax                                     #141.32
        comisd    %xmm1, %xmm0                                  #141.32
        ja        ..B2.50       # Prob 82%                      #141.32
                                # LOE rax rdx rcx rbx rsi r12 r13 r14 ebp xmm0 xmm1
..B2.52:                        # Preds ..B2.50 ..B2.48
        addq      $8, %r12                                      #141.32
        movq      %rcx, (%rsi)                                  #141.32
        cmpq      %r13, %r12                                    #141.32
        jne       ..B2.48       # Prob 82%                      #141.32
                                # LOE rbx r12 r13 r14 ebp
..B2.53:                        # Preds ..B2.54 ..B2.46 ..B2.52
        movl      16(%r14), %eax                                #141.32
        movq      (%r14), %r12                                  #141.32
        jmp       ..B2.66       # Prob 100%                     #141.32
                                # LOE rbx r12 r14 eax ebp
..B2.54:                        # Preds ..B2.32
        lea       8(%r12), %r15                                 #141.32
        cmpq      %r13, %r15                                    #141.32
        je        ..B2.53       # Prob 2%                       #141.32
                                # LOE rbx r12 r13 r14 r15 ebp
..B2.55:                        # Preds ..B2.54
        movl      %ebp, 40(%rsp)                                #
                                # LOE rbx r12 r13 r14 r15
..B2.56:                        # Preds ..B2.64 ..B2.55
        movsd     (%r15), %xmm1                                 #141.32
        movsd     (%r12), %xmm0                                 #141.32
        movq      (%r15), %rbp                                  #141.32
        comisd    %xmm1, %xmm0                                  #141.32
        jbe       ..B2.59       # Prob 50%                      #141.32
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.57:                        # Preds ..B2.56
        movq      %r15, %rdx                                    #141.32
        movq      %r12, %rsi                                    #141.32
        subq      %r12, %rdx                                    #141.32
        shrq      $3, %rdx                                      #141.32
        shlq      $3, %rdx                                      #141.32
        movq      %rdx, %rax                                    #141.32
        negq      %rax                                          #141.32
        lea       8(%r15,%rax), %rdi                            #141.32
        call      memmove@PLT                                   #141.32
                                # LOE rbx rbp r12 r13 r14 r15
..B2.58:                        # Preds ..B2.57
        movq      %rbp, (%r12)                                  #141.32
        jmp       ..B2.64       # Prob 100%                     #141.32
                                # LOE rbx r12 r13 r14 r15
..B2.59:                        # Preds ..B2.56
        movsd     -8(%r15), %xmm0                               #141.32
        lea       -16(%r15), %rdx                               #
        movq      %r15, %rcx                                    #141.32
        lea       -8(%r15), %rax                                #141.32
        comisd    %xmm1, %xmm0                                  #141.32
        jbe       ..B2.63       # Prob 10%                      #141.32
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.61:                        # Preds ..B2.59 ..B2.61
        movsd     %xmm0, (%rcx)                                 #141.32
        movq      %rax, %rcx                                    #141.32
        movsd     (%rdx), %xmm0                                 #141.32
        addq      $-8, %rdx                                     #141.32
        addq      $-8, %rax                                     #141.32
        comisd    %xmm1, %xmm0                                  #141.32
        ja        ..B2.61       # Prob 82%                      #141.32
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.63:                        # Preds ..B2.61 ..B2.59
        movq      %rbp, (%rcx)                                  #141.32
                                # LOE rbx r12 r13 r14 r15
..B2.64:                        # Preds ..B2.58 ..B2.63
        addq      $8, %r15                                      #141.32
        cmpq      %r13, %r15                                    #141.32
        jne       ..B2.56       # Prob 82%                      #141.32
                                # LOE rbx r12 r13 r14 r15
..B2.65:                        # Preds ..B2.64
        movl      40(%rsp), %ebp                                #
        movl      16(%r14), %eax                                #141.32
        movq      (%r14), %r12                                  #141.32
                                # LOE rbx r12 r14 eax ebp
..B2.66:                        # Preds ..B2.53 ..B2.65 ..B2.30
        movl      $1, 12(%r14)                                  #141.32
                                # LOE rbx r12 eax ebp
..B2.67:                        # Preds ..B2.66 ..B2.29
        movl      %eax, %edx                                    #141.3
        shrl      $31, %edx                                     #141.3
        addl      %edx, %eax                                    #141.32
        sarl      $1, %eax                                      #141.32
        movslq    %eax, %rax                                    #141.32
        movq      stat_nr(%rip), %r14                           #142.23
        movsd     (%r12,%rax,8), %xmm0                          #141.32
        divsd     56(%rsp), %xmm0                               #141.41
        movsd     %xmm0, 192(%rsp,%rbx,8)                       #141.3
        movl      16(%r14), %eax                                #142.32
        testl     %eax, %eax                                    #142.32
        jle       ..B2.184      # Prob 20%                      #142.32
                                # LOE rbx r14 eax ebp
..B2.68:                        # Preds ..B2.67
        movq      (%r14), %r13                                  #142.32
        cmpl      $1, 12(%r14)                                  #142.32
        je        ..B2.106      # Prob 41%                      #142.32
                                # LOE rbx r13 r14 eax ebp
..B2.69:                        # Preds ..B2.68
        movslq    %eax, %rax                                    #142.32
        lea       (%r13,%rax,8), %r12                           #142.32
        cmpq      %r12, %r13                                    #142.32
        lea       (,%rax,8), %rdx                               #142.32
        je        ..B2.105      # Prob 33%                      #142.32
                                # LOE rdx rbx r12 r13 r14 eax ebp
..B2.70:                        # Preds ..B2.69
        movq      %rdx, %r15                                    #142.32
        movq      %r13, %rdi                                    #142.32
        sarq      $3, %r15                                      #142.32
        movq      %r12, %rsi                                    #142.32
        sarq      $35, %rdx                                     #142.32
        bsr       %r15d, %eax                                   #142.32
        bsr       %edx, %ecx                                    #142.32
        negl      %eax                                          #142.32
        negl      %ecx                                          #142.32
        addl      $63, %eax                                     #142.32
        addl      $31, %ecx                                     #142.32
        testl     %edx, %edx                                    #142.32
        cmove     %eax, %ecx                                    #142.32
        movslq    %ecx, %rcx                                    #142.32
        addq      %rcx, %rcx                                    #142.32
        negq      %rcx                                          #142.32
        addq      $126, %rcx                                    #142.32
        movq      %rcx, %rdx                                    #142.32
..___tag_value__Z10make_table10yesno_typePKc.99:                #142.32
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_@PLT      #142.32
..___tag_value__Z10make_table10yesno_typePKc.100:               #
                                # LOE rbx r12 r13 r14 r15 ebp
..B2.71:                        # Preds ..B2.70
        cmpq      $16, %r15                                     #142.32
        jle       ..B2.93       # Prob 50%                      #142.32
                                # LOE rbx r12 r13 r14 ebp
..B2.72:                        # Preds ..B2.71
        lea       128(%r13), %rax                               #142.32
                                # LOE rax rbx r12 r13 r14 ebp
..B2.73:                        # Preds ..B2.72
        lea       8(%r13), %r15                                 #142.32
                                # LOE rax rbx r12 r13 r14 r15 ebp
..B2.74:                        # Preds ..B2.73
        movq      %rbx, (%rsp)                                  #
        movq      %rax, %rbx                                    #
        movl      %ebp, 40(%rsp)                                #
                                # LOE rbx r12 r13 r14 r15
..B2.75:                        # Preds ..B2.83 ..B2.74
        movsd     (%r15), %xmm1                                 #142.32
        movsd     (%r13), %xmm0                                 #142.32
        movq      (%r15), %rbp                                  #142.32
        comisd    %xmm1, %xmm0                                  #142.32
        jbe       ..B2.78       # Prob 50%                      #142.32
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.76:                        # Preds ..B2.75
        movq      %r15, %rdx                                    #142.32
        movq      %r13, %rsi                                    #142.32
        subq      %r13, %rdx                                    #142.32
        shrq      $3, %rdx                                      #142.32
        shlq      $3, %rdx                                      #142.32
        movq      %rdx, %rcx                                    #142.32
        negq      %rcx                                          #142.32
        lea       8(%r15,%rcx), %rdi                            #142.32
        call      memmove@PLT                                   #142.32
                                # LOE rbx rbp r12 r13 r14 r15
..B2.77:                        # Preds ..B2.76
        movq      %rbp, (%r13)                                  #142.32
        jmp       ..B2.83       # Prob 100%                     #142.32
                                # LOE rbx r12 r13 r14 r15
..B2.78:                        # Preds ..B2.75
        movsd     -8(%r15), %xmm0                               #142.32
        lea       -16(%r15), %rcx                               #
        movq      %r15, %rsi                                    #142.32
        lea       -8(%r15), %rdx                                #142.32
        comisd    %xmm1, %xmm0                                  #142.32
        jbe       ..B2.82       # Prob 10%                      #142.32
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.80:                        # Preds ..B2.78 ..B2.80
        movsd     %xmm0, (%rsi)                                 #142.32
        movq      %rdx, %rsi                                    #142.32
        movsd     (%rcx), %xmm0                                 #142.32
        addq      $-8, %rcx                                     #142.32
        addq      $-8, %rdx                                     #142.32
        comisd    %xmm1, %xmm0                                  #142.32
        ja        ..B2.80       # Prob 82%                      #142.32
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.82:                        # Preds ..B2.80 ..B2.78
        movq      %rbp, (%rsi)                                  #142.32
                                # LOE rbx r12 r13 r14 r15
..B2.83:                        # Preds ..B2.77 ..B2.82
        addq      $8, %r15                                      #142.32
        cmpq      %rbx, %r15                                    #142.32
        jne       ..B2.75       # Prob 82%                      #142.32
                                # LOE rbx r12 r13 r14 r15
..B2.84:                        # Preds ..B2.83
        movq      (%rsp), %rbx                                  #
        movl      40(%rsp), %ebp                                #
                                # LOE rbx rbp r12 r13 r14 ebp bpl
..B2.85:                        # Preds ..B2.84
        addq      $128, %r13                                    #142.32
        cmpq      %r12, %r13                                    #142.32
        je        ..B2.92       # Prob 2%                       #142.32
                                # LOE rbx rbp r12 r13 r14 ebp bpl
..B2.87:                        # Preds ..B2.85 ..B2.91
        movsd     (%r13), %xmm1                                 #142.32
        lea       -16(%r13), %rdx                               #
        movsd     -8(%r13), %xmm0                               #142.32
        lea       -8(%r13), %rax                                #142.32
        movq      (%r13), %rcx                                  #142.32
        movq      %r13, %rsi                                    #142.32
        comisd    %xmm1, %xmm0                                  #142.32
        jbe       ..B2.91       # Prob 10%                      #142.32
                                # LOE rax rdx rcx rbx rsi r12 r13 r14 ebp xmm0 xmm1
..B2.89:                        # Preds ..B2.87 ..B2.89
        movsd     %xmm0, (%rsi)                                 #142.32
        movq      %rax, %rsi                                    #142.32
        movsd     (%rdx), %xmm0                                 #142.32
        addq      $-8, %rdx                                     #142.32
        addq      $-8, %rax                                     #142.32
        comisd    %xmm1, %xmm0                                  #142.32
        ja        ..B2.89       # Prob 82%                      #142.32
                                # LOE rax rdx rcx rbx rsi r12 r13 r14 ebp xmm0 xmm1
..B2.91:                        # Preds ..B2.89 ..B2.87
        addq      $8, %r13                                      #142.32
        movq      %rcx, (%rsi)                                  #142.32
        cmpq      %r12, %r13                                    #142.32
        jne       ..B2.87       # Prob 82%                      #142.32
                                # LOE rbx r12 r13 r14 ebp
..B2.92:                        # Preds ..B2.93 ..B2.85 ..B2.91
        movl      16(%r14), %eax                                #142.32
        movq      (%r14), %r13                                  #142.32
        jmp       ..B2.105      # Prob 100%                     #142.32
                                # LOE rbx r13 r14 eax ebp
..B2.93:                        # Preds ..B2.71
        lea       8(%r13), %r15                                 #142.32
        cmpq      %r12, %r15                                    #142.32
        je        ..B2.92       # Prob 2%                       #142.32
                                # LOE rbx r12 r13 r14 r15 ebp
..B2.94:                        # Preds ..B2.93
        movl      %ebp, 40(%rsp)                                #
                                # LOE rbx r12 r13 r14 r15
..B2.95:                        # Preds ..B2.103 ..B2.94
        movsd     (%r15), %xmm1                                 #142.32
        movsd     (%r13), %xmm0                                 #142.32
        movq      (%r15), %rbp                                  #142.32
        comisd    %xmm1, %xmm0                                  #142.32
        jbe       ..B2.98       # Prob 50%                      #142.32
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.96:                        # Preds ..B2.95
        movq      %r15, %rdx                                    #142.32
        movq      %r13, %rsi                                    #142.32
        subq      %r13, %rdx                                    #142.32
        shrq      $3, %rdx                                      #142.32
        shlq      $3, %rdx                                      #142.32
        movq      %rdx, %rax                                    #142.32
        negq      %rax                                          #142.32
        lea       8(%r15,%rax), %rdi                            #142.32
        call      memmove@PLT                                   #142.32
                                # LOE rbx rbp r12 r13 r14 r15
..B2.97:                        # Preds ..B2.96
        movq      %rbp, (%r13)                                  #142.32
        jmp       ..B2.103      # Prob 100%                     #142.32
                                # LOE rbx r12 r13 r14 r15
..B2.98:                        # Preds ..B2.95
        movsd     -8(%r15), %xmm0                               #142.32
        lea       -16(%r15), %rdx                               #
        movq      %r15, %rcx                                    #142.32
        lea       -8(%r15), %rax                                #142.32
        comisd    %xmm1, %xmm0                                  #142.32
        jbe       ..B2.102      # Prob 10%                      #142.32
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.100:                       # Preds ..B2.98 ..B2.100
        movsd     %xmm0, (%rcx)                                 #142.32
        movq      %rax, %rcx                                    #142.32
        movsd     (%rdx), %xmm0                                 #142.32
        addq      $-8, %rdx                                     #142.32
        addq      $-8, %rax                                     #142.32
        comisd    %xmm1, %xmm0                                  #142.32
        ja        ..B2.100      # Prob 82%                      #142.32
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.102:                       # Preds ..B2.100 ..B2.98
        movq      %rbp, (%rcx)                                  #142.32
                                # LOE rbx r12 r13 r14 r15
..B2.103:                       # Preds ..B2.97 ..B2.102
        addq      $8, %r15                                      #142.32
        cmpq      %r12, %r15                                    #142.32
        jne       ..B2.95       # Prob 82%                      #142.32
                                # LOE rbx r12 r13 r14 r15
..B2.104:                       # Preds ..B2.103
        movl      40(%rsp), %ebp                                #
        movl      16(%r14), %eax                                #142.32
        movq      (%r14), %r13                                  #142.32
                                # LOE rbx r13 r14 eax ebp
..B2.105:                       # Preds ..B2.92 ..B2.104 ..B2.69
        movl      $1, 12(%r14)                                  #142.32
                                # LOE rbx r13 eax ebp
..B2.106:                       # Preds ..B2.105 ..B2.68
        movl      %eax, %edx                                    #142.3
        shrl      $31, %edx                                     #142.3
        addl      %edx, %eax                                    #142.32
        sarl      $1, %eax                                      #142.32
        movslq    %eax, %rax                                    #142.32
        movsd     (%r13,%rax,8), %xmm0                          #142.32
        divsd     56(%rsp), %xmm0                               #142.41
        movsd     %xmm0, 256(%rsp,%rbx,8)                       #142.3
        incq      %rbx                                          #137.28
        cmpq      $8, %rbx                                      #137.19
        jl        ..B2.2        # Prob 87%                      #137.19
                                # LOE rbx ebp
..B2.107:                       # Preds ..B2.106
        movq      320(%rsp), %r15                               #
        lea       .L_2__STRING.21(%rip), %rsi                   #153.21
        movq      %rsi, 104(%rsp)                               #153.21
        lea       64(%rsp), %rdi                                #156.8
        movq      %r15, %rsi                                    #156.8
        lea       .L_2__STRING.13(%rip), %rax                   #147.28
        lea       .L_2__STRING.14(%rip), %rdx                   #147.28
        lea       .L_2__STRING.15(%rip), %rcx                   #147.28
        lea       .L_2__STRING.16(%rip), %rbx                   #147.28
        lea       .L_2__STRING.17(%rip), %rbp                   #147.28
        movq      %rax, (%rsp)                                  #147.28
        lea       .L_2__STRING.18(%rip), %r8                    #147.28
        movq      %rdx, 8(%rsp)                                 #147.28
        lea       .L_2__STRING.19(%rip), %r9                    #147.28
        movq      %rcx, 16(%rsp)                                #147.28
        lea       .L_2__STRING.20(%rip), %r10                   #147.28
        movq      %rbx, 24(%rsp)                                #147.28
        lea       (%rsp), %r11                                  #152.13
        lea       .L_2__STRING.22(%rip), %rax                   #153.21
        lea       .L_2__STRING.23(%rip), %rdx                   #153.21
        movl      $15, 68(%rsp)                                 #145.8
        lea       104(%rsp), %rcx                               #154.13
        movl      $8, 96(%rsp)                                  #146.2
        lea       128(%rsp), %rbx                               #155.13
        movl      $3, 100(%rsp)                                 #146.2
        movq      %rbp, 32(%rsp)                                #147.28
        movq      %r8, 40(%rsp)                                 #147.28
        movq      %r9, 48(%rsp)                                 #147.28
        movq      %r10, 56(%rsp)                                #147.28
        movq      %r11, 72(%rsp)                                #152.2
        movq      %rax, 112(%rsp)                               #153.21
        movq      %rdx, 120(%rsp)                               #153.21
        movq      %rcx, 80(%rsp)                                #154.2
        movl      $4, 64(%rsp)                                  #155.2
        movq      %rbx, 88(%rsp)                                #155.2
..___tag_value__Z10make_table10yesno_typePKc.101:               #156.8
        call      _ZN5Table5printEPKc@PLT                       #156.8
..___tag_value__Z10make_table10yesno_typePKc.102:               #
                                # LOE r12 r13 r14
..B2.108:                       # Preds ..B2.107
        addq      $328, %rsp                                    #157.1
..___tag_value__Z10make_table10yesno_typePKc.103:               #
        popq      %rbp                                          #157.1
..___tag_value__Z10make_table10yesno_typePKc.105:               #
        popq      %rbx                                          #157.1
..___tag_value__Z10make_table10yesno_typePKc.107:               #
        popq      %r15                                          #157.1
..___tag_value__Z10make_table10yesno_typePKc.109:               #
        popq      %r14                                          #157.1
..___tag_value__Z10make_table10yesno_typePKc.111:               #
        popq      %r13                                          #157.1
..___tag_value__Z10make_table10yesno_typePKc.113:               #
        popq      %r12                                          #157.1
..___tag_value__Z10make_table10yesno_typePKc.115:               #
        ret                                                     #157.1
..___tag_value__Z10make_table10yesno_typePKc.116:               #
                                # LOE
..B2.109:                       # Preds ..B2.25                 # Infreq
        movq      %rbp, %rdi                                    #140.23
        movq      %r13, %rdx                                    #140.23
..___tag_value__Z10make_table10yesno_typePKc.123:               #140.23
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_@PLT      #140.23
..___tag_value__Z10make_table10yesno_typePKc.124:               #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.110:                       # Preds ..B2.109                # Infreq
        movq      %rbp, %rsi                                    #140.23
        subq      %r14, %rbp                                    #140.23
        sarq      $3, %rbp                                      #140.23
        cmpq      $16, %rbp                                     #140.23
        jg        ..B2.8        # Prob 82%                      #140.23
                                # LOE rbx rsi r12 r13 r14 r15
..B2.111:                       # Preds ..B2.110                # Infreq
        movl      40(%rsp), %ebp                                #
                                # LOE rbx r12 r14 r15 ebp
..B2.112:                       # Preds ..B2.147 ..B2.134 ..B2.111 # Infreq
        lea       128(%r14), %r13                               #140.23
                                # LOE rbx r12 r13 r14 r15 ebp
..B2.113:                       # Preds ..B2.112                # Infreq
        lea       8(%r14), %rax                                 #140.23
                                # LOE rax rbx r12 r13 r14 r15 ebp
..B2.114:                       # Preds ..B2.113                # Infreq
        movq      %rbx, (%rsp)                                  #
        movq      %rax, %rbx                                    #
        movl      %ebp, 40(%rsp)                                #
                                # LOE rbx r12 r13 r14 r15
..B2.115:                       # Preds ..B2.123 ..B2.114       # Infreq
        movsd     (%rbx), %xmm1                                 #140.23
        movsd     (%r14), %xmm0                                 #140.23
        movq      (%rbx), %rbp                                  #140.23
        comisd    %xmm1, %xmm0                                  #140.23
        jbe       ..B2.118      # Prob 50%                      #140.23
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.116:                       # Preds ..B2.115                # Infreq
        movq      %rbx, %rdx                                    #140.23
        movq      %r14, %rsi                                    #140.23
        subq      %r14, %rdx                                    #140.23
        shrq      $3, %rdx                                      #140.23
        shlq      $3, %rdx                                      #140.23
        movq      %rdx, %rcx                                    #140.23
        negq      %rcx                                          #140.23
        lea       8(%rbx,%rcx), %rdi                            #140.23
        call      memmove@PLT                                   #140.23
                                # LOE rbx rbp r12 r13 r14 r15
..B2.117:                       # Preds ..B2.116                # Infreq
        movq      %rbp, (%r14)                                  #140.23
        jmp       ..B2.123      # Prob 100%                     #140.23
                                # LOE rbx r12 r13 r14 r15
..B2.118:                       # Preds ..B2.115                # Infreq
        movsd     -8(%rbx), %xmm0                               #140.23
        lea       -16(%rbx), %rcx                               #
        movq      %rbx, %rsi                                    #140.23
        lea       -8(%rbx), %rdx                                #140.23
        comisd    %xmm1, %xmm0                                  #140.23
        jbe       ..B2.122      # Prob 10%                      #140.23
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.120:                       # Preds ..B2.118 ..B2.120       # Infreq
        movsd     %xmm0, (%rsi)                                 #140.23
        movq      %rdx, %rsi                                    #140.23
        movsd     (%rcx), %xmm0                                 #140.23
        addq      $-8, %rcx                                     #140.23
        addq      $-8, %rdx                                     #140.23
        comisd    %xmm1, %xmm0                                  #140.23
        ja        ..B2.120      # Prob 82%                      #140.23
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.122:                       # Preds ..B2.120 ..B2.118       # Infreq
        movq      %rbp, (%rsi)                                  #140.23
                                # LOE rbx r12 r13 r14 r15
..B2.123:                       # Preds ..B2.117 ..B2.122       # Infreq
        addq      $8, %rbx                                      #140.23
        cmpq      %r13, %rbx                                    #140.23
        jne       ..B2.115      # Prob 82%                      #140.23
                                # LOE rbx r12 r13 r14 r15
..B2.124:                       # Preds ..B2.123                # Infreq
        movq      (%rsp), %rbx                                  #
        movl      40(%rsp), %ebp                                #
                                # LOE rbx rbp r12 r13 r15 ebp bpl
..B2.125:                       # Preds ..B2.124                # Infreq
        cmpq      %r12, %r13                                    #140.23
        je        ..B2.242      # Prob 2%                       #140.23
                                # LOE rbx rbp r12 r13 r15 ebp bpl
..B2.127:                       # Preds ..B2.125 ..B2.131       # Infreq
        movsd     (%r13), %xmm1                                 #140.23
        lea       -16(%r13), %rdx                               #
        movsd     -8(%r13), %xmm0                               #140.23
        lea       -8(%r13), %rax                                #140.23
        movq      (%r13), %rcx                                  #140.23
        movq      %r13, %rsi                                    #140.23
        comisd    %xmm1, %xmm0                                  #140.23
        jbe       ..B2.131      # Prob 10%                      #140.23
                                # LOE rax rdx rcx rbx rsi r12 r13 r15 ebp xmm0 xmm1
..B2.129:                       # Preds ..B2.127 ..B2.129       # Infreq
        movsd     %xmm0, (%rsi)                                 #140.23
        movq      %rax, %rsi                                    #140.23
        movsd     (%rdx), %xmm0                                 #140.23
        addq      $-8, %rdx                                     #140.23
        addq      $-8, %rax                                     #140.23
        comisd    %xmm1, %xmm0                                  #140.23
        ja        ..B2.129      # Prob 82%                      #140.23
                                # LOE rax rdx rcx rbx rsi r12 r13 r15 ebp xmm0 xmm1
..B2.131:                       # Preds ..B2.129 ..B2.127       # Infreq
        addq      $8, %r13                                      #140.23
        movq      %rcx, (%rsi)                                  #140.23
        cmpq      %r12, %r13                                    #140.23
        jne       ..B2.127      # Prob 82%                      #140.23
                                # LOE rbx r12 r13 r15 ebp
..B2.132:                       # Preds ..B2.131                # Infreq
        movq      (%r15), %r14                                  #140.23
        jmp       ..B2.27       # Prob 100%                     #140.23
                                # LOE rbx r14 r15 ebp
..B2.133:                       # Preds ..B2.8                  # Infreq
        movl      40(%rsp), %ebp                                #
        cmpq      $2, %rdi                                      #140.23
        jge       ..B2.149      # Prob 72%                      #140.23
                                # LOE rbx rbp rsi rdi r12 r14 r15 ebp bpl
..B2.134:                       # Preds ..B2.162 ..B2.133       # Infreq
        movq      %rsi, %r9                                     #
        subq      %r14, %r9                                     #
        cmpq      $1, %rdi                                      #140.23
        jle       ..B2.112      # Prob 10%                      #140.23
                                # LOE rbx rsi r9 r12 r14 r15 ebp
..B2.135:                       # Preds ..B2.134                # Infreq
        movl      $1, %ecx                                      #140.23
                                # LOE rbx rsi r9 r12 r14 r15 ecx ebp
..B2.136:                       # Preds ..B2.147 ..B2.135       # Infreq
        addq      $-8, %r9                                      #140.23
        xorl      %r10d, %r10d                                  #140.23
        movq      %r9, %rdx                                     #140.23
        addq      $-8, %rsi                                     #140.23
        sarq      $3, %rdx                                      #140.23
        xorl      %r8d, %r8d                                    #140.23
        testq     %rdx, %rdx                                    #140.23
        movq      (%r14), %rax                                  #140.23
        cmovle    %ecx, %r10d                                   #140.23
        movsd     (%rsi), %xmm0                                 #140.23
        movq      (%rsi), %rdi                                  #140.23
        movq      %rax, (%rsi)                                  #140.23
        xorl      %eax, %eax                                    #140.23
        lea       -1(%rdx,%r10), %r10                           #140.23
        sarq      $1, %r10                                      #140.23
        testq     %r10, %r10                                    #140.23
        jle       ..B2.139      # Prob 10%                      #140.23
                                # LOE rax rdx rbx rsi rdi r8 r9 r10 r12 r14 r15 ecx ebp xmm0
..B2.138:                       # Preds ..B2.136 ..B2.138       # Infreq
        lea       2(,%rax,2), %r11                              #140.23
        movsd     -8(%r14,%r11,8), %xmm1                        #140.23
        lea       -1(%r11), %rax                                #140.23
        comisd    (%r14,%r11,8), %xmm1                          #140.23
        ja        ..L125        # Prob 50%                      #140.23
        movq      %r11, %rax                                    #140.23
..L125:                                                         #
        movq      (%r14,%rax,8), %r13                           #140.23
        cmpq      %r10, %rax                                    #140.23
        movq      %r13, (%r14,%r8,8)                            #140.23
        movq      %rax, %r8                                     #140.23
        jl        ..B2.138      # Prob 82%                      #140.23
                                # LOE rax rdx rbx rsi rdi r8 r9 r10 r12 r14 r15 ecx ebp xmm0
..B2.139:                       # Preds ..B2.136 ..B2.138       # Infreq
        testq     $1, %rdx                                      #140.23
        jne       ..B2.142      # Prob 40%                      #140.23
                                # LOE rax rdx rbx rsi rdi r8 r9 r12 r14 r15 ecx ebp xmm0
..B2.140:                       # Preds ..B2.139                # Infreq
        movq      %rdx, %r10                                    #140.23
        xorl      %r11d, %r11d                                  #140.23
        addq      $-2, %r10                                     #140.23
        cmovl     %ecx, %r11d                                   #140.23
        lea       -2(%rdx,%r11), %r13                           #140.23
        sarq      $1, %r13                                      #140.23
        cmpq      %r13, %rax                                    #140.23
        jne       ..B2.142      # Prob 38%                      #140.23
                                # LOE rax rdx rbx rsi rdi r8 r9 r12 r14 r15 ecx ebp xmm0
..B2.141:                       # Preds ..B2.140                # Infreq
        lea       2(,%rax,2), %r10                              #140.23
        movq      -8(%r14,%r10,8), %rax                         #140.23
        movq      %rax, (%r14,%r8,8)                            #140.23
        lea       -1(%r10), %r8                                 #140.23
                                # LOE rdx rbx rsi rdi r8 r9 r12 r14 r15 ecx ebp xmm0
..B2.142:                       # Preds ..B2.141 ..B2.140 ..B2.139 # Infreq
        lea       -1(%r8), %rax                                 #140.23
        shrq      $63, %rax                                     #140.23
        lea       -1(%r8,%rax), %rax                            #140.23
        sarq      $1, %rax                                      #140.23
        testq     %r8, %r8                                      #140.23
        jle       ..B2.147      # Prob 10%                      #140.23
                                # LOE rax rdx rbx rsi rdi r8 r9 r12 r14 r15 ecx ebp xmm0
..B2.144:                       # Preds ..B2.142 ..B2.145       # Infreq
        movq      (%r14,%rax,8), %r10                           #140.23
        comisd    (%r14,%rax,8), %xmm0                          #140.23
        jbe       ..B2.147      # Prob 20%                      #140.23
                                # LOE rax rdx rbx rsi rdi r8 r9 r10 r12 r14 r15 ecx ebp xmm0
..B2.145:                       # Preds ..B2.144                # Infreq
        movq      %r10, (%r14,%r8,8)                            #140.23
        lea       -1(%rax), %r10                                #140.23
        shrq      $63, %r10                                     #140.23
        movq      %rax, %r8                                     #140.23
        lea       -1(%rax,%r10), %rax                           #140.23
        sarq      $1, %rax                                      #140.23
        testq     %r8, %r8                                      #140.23
        jg        ..B2.144      # Prob 82%                      #140.23
                                # LOE rax rdx rbx rsi rdi r8 r9 r12 r14 r15 ecx ebp xmm0
..B2.147:                       # Preds ..B2.144 ..B2.145 ..B2.142 # Infreq
        .byte     144                                           #140.23
        .byte     72                                            #140.23
        .byte     141                                           #140.23
        .byte     116                                           #140.23
        .byte     38                                            #140.23
        .byte     0                                             #140.23
        movq      %rdi, (%r14,%r8,8)                            #140.23
        cmpq      $1, %rdx                                      #140.23
        jg        ..B2.136      # Prob 82%                      #140.23
        jmp       ..B2.112      # Prob 100%                     #140.23
                                # LOE rbx rsi r9 r12 r14 r15 ecx ebp
..B2.149:                       # Preds ..B2.133                # Infreq
        movl      $1, %r8d                                      #140.23
        xorl      %eax, %eax                                    #140.23
        testq     %rdi, %rdi                                    #140.23
        movq      %rdi, %r9                                     #140.23
        cmovle    %r8d, %eax                                    #140.23
        xorl      %r10d, %r10d                                  #140.23
        addq      $-2, %r9                                      #140.23
        lea       -2(%rdi), %rcx                                #140.23
        cmovl     %r8d, %r10d                                   #140.23
        movq      %rdi, %rdx                                    #140.23
        shrq      $63, %rcx                                     #140.23
        andq      $1, %rdx                                      #140.23
        lea       -2(%rdi,%rcx), %rcx                           #140.23
        sarq      $1, %rcx                                      #140.23
        lea       -1(%rdi,%rax), %rax                           #140.23
        sarq      $1, %rax                                      #140.23
        lea       -2(%rdi,%r10), %r10                           #140.23
        sarq      $1, %r10                                      #140.23
        jmp       ..B2.150      # Prob 100%                     #140.23
                                # LOE rax rdx rcx rbx rsi rdi r10 r12 r14 r15 ebp
..B2.163:                       # Preds ..B2.162                # Infreq
        decq      %rcx                                          #140.23
                                # LOE rax rdx rcx rbx rsi rdi r10 r12 r14 r15 ebp
..B2.150:                       # Preds ..B2.163 ..B2.149       # Infreq
        movsd     (%r14,%rcx,8), %xmm0                          #140.23
        movq      %rcx, %r11                                    #140.23
        movq      (%r14,%rcx,8), %r9                            #140.23
        movq      %rcx, %r8                                     #140.23
        cmpq      %rax, %rcx                                    #140.23
        jge       ..B2.154      # Prob 10%                      #140.23
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebp xmm0
..B2.152:                       # Preds ..B2.150 ..B2.152       # Infreq
        lea       2(,%r8,2), %r13                               #140.23
        movsd     -8(%r14,%r13,8), %xmm1                        #140.23
        lea       -1(%r13), %r8                                 #140.23
        comisd    (%r14,%r13,8), %xmm1                          #140.23
        ja        ..L126        # Prob 50%                      #140.23
        movq      %r13, %r8                                     #140.23
..L126:                                                         #
        movq      (%r14,%r8,8), %r13                            #140.23
        cmpq      %rax, %r8                                     #140.23
        movq      %r13, (%r14,%r11,8)                           #140.23
        movq      %r8, %r11                                     #140.23
        jl        ..B2.152      # Prob 82%                      #140.23
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebp xmm0
..B2.154:                       # Preds ..B2.152 ..B2.150       # Infreq
        testq     %rdx, %rdx                                    #140.23
        jne       ..B2.157      # Prob 40%                      #140.23
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebp xmm0
..B2.155:                       # Preds ..B2.154                # Infreq
        cmpq      %r10, %r8                                     #140.23
        jne       ..B2.157      # Prob 38%                      #140.23
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebp xmm0
..B2.156:                       # Preds ..B2.155                # Infreq
        lea       2(,%r8,2), %r13                               #140.23
        movq      -8(%r14,%r13,8), %r8                          #140.23
        movq      %r8, (%r14,%r11,8)                            #140.23
        lea       -1(%r13), %r11                                #140.23
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r12 r14 r15 ebp xmm0
..B2.157:                       # Preds ..B2.156 ..B2.155 ..B2.154 # Infreq
        lea       -1(%r11), %r8                                 #140.23
        shrq      $63, %r8                                      #140.23
        lea       -1(%r11,%r8), %r8                             #140.23
        sarq      $1, %r8                                       #140.23
        cmpq      %rcx, %r11                                    #140.23
        jle       ..B2.162      # Prob 10%                      #140.23
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebp xmm0
..B2.159:                       # Preds ..B2.157 ..B2.160       # Infreq
        movq      (%r14,%r8,8), %r13                            #140.23
        comisd    (%r14,%r8,8), %xmm0                           #140.23
        jbe       ..B2.162      # Prob 20%                      #140.23
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ebp xmm0
..B2.160:                       # Preds ..B2.159                # Infreq
        movq      %r13, (%r14,%r11,8)                           #140.23
        lea       -1(%r8), %r13                                 #140.23
        shrq      $63, %r13                                     #140.23
        movq      %r8, %r11                                     #140.23
        lea       -1(%r8,%r13), %r8                             #140.23
        sarq      $1, %r8                                       #140.23
        cmpq      %rcx, %r11                                    #140.23
        jg        ..B2.159      # Prob 82%                      #140.23
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebp xmm0
..B2.162:                       # Preds ..B2.159 ..B2.160 ..B2.157 # Infreq
        movq      %r9, (%r14,%r11,8)                            #140.23
        testq     %rcx, %rcx                                    #140.23
        je        ..B2.134      # Prob 20%                      #140.23
        jmp       ..B2.163      # Prob 100%                     #140.23
                                # LOE rax rdx rcx rbx rsi rdi r10 r12 r14 r15 ebp
..B2.168:                       # Preds ..B2.6                  # Infreq
        lea       8(%r14), %r13                                 #140.23
        cmpq      %r12, %r13                                    #140.23
        je        ..B2.27       # Prob 2%                       #140.23
                                # LOE rbx r12 r13 r14 r15 ebp
..B2.169:                       # Preds ..B2.168                # Infreq
        movl      %ebp, 40(%rsp)                                #
                                # LOE rbx r12 r13 r14 r15
..B2.170:                       # Preds ..B2.178 ..B2.169       # Infreq
        movsd     (%r13), %xmm1                                 #140.23
        movsd     (%r14), %xmm0                                 #140.23
        movq      (%r13), %rbp                                  #140.23
        comisd    %xmm1, %xmm0                                  #140.23
        jbe       ..B2.173      # Prob 50%                      #140.23
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.171:                       # Preds ..B2.170                # Infreq
        movq      %r13, %rdx                                    #140.23
        movq      %r14, %rsi                                    #140.23
        subq      %r14, %rdx                                    #140.23
        shrq      $3, %rdx                                      #140.23
        shlq      $3, %rdx                                      #140.23
        movq      %rdx, %rax                                    #140.23
        negq      %rax                                          #140.23
        lea       8(%r13,%rax), %rdi                            #140.23
        call      memmove@PLT                                   #140.23
                                # LOE rbx rbp r12 r13 r14 r15
..B2.172:                       # Preds ..B2.171                # Infreq
        movq      %rbp, (%r14)                                  #140.23
        jmp       ..B2.178      # Prob 100%                     #140.23
                                # LOE rbx r12 r13 r14 r15
..B2.173:                       # Preds ..B2.170                # Infreq
        movsd     -8(%r13), %xmm0                               #140.23
        lea       -16(%r13), %rdx                               #
        movq      %r13, %rcx                                    #140.23
        lea       -8(%r13), %rax                                #140.23
        comisd    %xmm1, %xmm0                                  #140.23
        jbe       ..B2.177      # Prob 10%                      #140.23
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.175:                       # Preds ..B2.173 ..B2.175       # Infreq
        movsd     %xmm0, (%rcx)                                 #140.23
        movq      %rax, %rcx                                    #140.23
        movsd     (%rdx), %xmm0                                 #140.23
        addq      $-8, %rdx                                     #140.23
        addq      $-8, %rax                                     #140.23
        comisd    %xmm1, %xmm0                                  #140.23
        ja        ..B2.175      # Prob 82%                      #140.23
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.177:                       # Preds ..B2.175 ..B2.173       # Infreq
        movq      %rbp, (%rcx)                                  #140.23
                                # LOE rbx r12 r13 r14 r15
..B2.178:                       # Preds ..B2.172 ..B2.177       # Infreq
        addq      $8, %r13                                      #140.23
        cmpq      %r12, %r13                                    #140.23
        jne       ..B2.170      # Prob 82%                      #140.23
                                # LOE rbx r12 r13 r14 r15
..B2.179:                       # Preds ..B2.178                # Infreq
        movl      40(%rsp), %ebp                                #
        movq      (%r15), %r14                                  #140.23
        jmp       ..B2.27       # Prob 100%                     #140.23
                                # LOE rbx r14 r15 ebp
..B2.184:                       # Preds ..B2.67                 # Infreq
        lea       .L_2__STRING.0(%rip), %rsi                    #142.32
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #142.32
..___tag_value__Z10make_table10yesno_typePKc.127:               #142.32
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #142.32
..___tag_value__Z10make_table10yesno_typePKc.128:               #
                                # LOE rax r12 r13 r14
..B2.185:                       # Preds ..B2.184                # Infreq
        movq      %rax, %rdi                                    #142.32
        lea       .L_2__STRING.5(%rip), %rsi                    #142.32
..___tag_value__Z10make_table10yesno_typePKc.129:               #142.32
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #142.32
..___tag_value__Z10make_table10yesno_typePKc.130:               #
                                # LOE rax r12 r13 r14
..B2.186:                       # Preds ..B2.185                # Infreq
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx #142.32
        movq      %rax, %rdi                                    #142.32
        movq      %rbx, %rsi                                    #142.32
..___tag_value__Z10make_table10yesno_typePKc.131:               #142.32
        call      _ZNSolsEPFRSoS_E@PLT                          #142.32
..___tag_value__Z10make_table10yesno_typePKc.132:               #
                                # LOE rax rbx r12 r13 r14
..B2.187:                       # Preds ..B2.186                # Infreq
        movq      %rax, %rdi                                    #142.32
        lea       .L_2__STRING.2(%rip), %rsi                    #142.32
..___tag_value__Z10make_table10yesno_typePKc.133:               #142.32
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #142.32
..___tag_value__Z10make_table10yesno_typePKc.134:               #
                                # LOE rax rbx r12 r13 r14
..B2.188:                       # Preds ..B2.187                # Infreq
        movq      %rax, %rdi                                    #142.32
        lea       .L_2__STRING.3(%rip), %rsi                    #142.32
..___tag_value__Z10make_table10yesno_typePKc.135:               #142.32
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #142.32
..___tag_value__Z10make_table10yesno_typePKc.136:               #
                                # LOE rax rbx r12 r13 r14
..B2.189:                       # Preds ..B2.188                # Infreq
        movq      %rax, %rdi                                    #142.32
        movq      %rbx, %rsi                                    #142.32
..___tag_value__Z10make_table10yesno_typePKc.137:               #142.32
        call      _ZNSolsEPFRSoS_E@PLT                          #142.32
..___tag_value__Z10make_table10yesno_typePKc.138:               #
                                # LOE rax rbx r12 r13 r14
..B2.190:                       # Preds ..B2.189                # Infreq
        movq      %rax, %rdi                                    #142.32
        lea       .L_2__STRING.4(%rip), %rsi                    #142.32
..___tag_value__Z10make_table10yesno_typePKc.139:               #142.32
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #142.32
..___tag_value__Z10make_table10yesno_typePKc.140:               #
                                # LOE rax rbx r12 r13 r14
..B2.191:                       # Preds ..B2.210 ..B2.200 ..B2.190 # Infreq
        movq      %rax, %rdi                                    #142.32
        movl      $38, %esi                                     #142.32
..___tag_value__Z10make_table10yesno_typePKc.141:               #142.32
        call      _ZNSolsEi@PLT                                 #142.32
..___tag_value__Z10make_table10yesno_typePKc.142:               #
                                # LOE rax rbx r12 r13 r14
..B2.192:                       # Preds ..B2.191                # Infreq
        movq      %rax, %rdi                                    #142.32
        movq      %rbx, %rsi                                    #142.32
..___tag_value__Z10make_table10yesno_typePKc.143:               #142.32
        call      _ZNSolsEPFRSoS_E@PLT                          #142.32
..___tag_value__Z10make_table10yesno_typePKc.144:               #
                                # LOE
..B2.193:                       # Preds ..B2.192                # Infreq
        int       $5                                            #142.32
                                # LOE
..B2.194:                       # Preds ..B2.28                 # Infreq
        lea       .L_2__STRING.0(%rip), %rsi                    #141.32
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #141.32
..___tag_value__Z10make_table10yesno_typePKc.145:               #141.32
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #141.32
..___tag_value__Z10make_table10yesno_typePKc.146:               #
                                # LOE rax r12 r13 r14
..B2.195:                       # Preds ..B2.194                # Infreq
        movq      %rax, %rdi                                    #141.32
        lea       .L_2__STRING.5(%rip), %rsi                    #141.32
..___tag_value__Z10make_table10yesno_typePKc.147:               #141.32
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #141.32
..___tag_value__Z10make_table10yesno_typePKc.148:               #
                                # LOE rax r12 r13 r14
..B2.196:                       # Preds ..B2.195                # Infreq
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx #141.32
        movq      %rax, %rdi                                    #141.32
        movq      %rbx, %rsi                                    #141.32
..___tag_value__Z10make_table10yesno_typePKc.149:               #141.32
        call      _ZNSolsEPFRSoS_E@PLT                          #141.32
..___tag_value__Z10make_table10yesno_typePKc.150:               #
                                # LOE rax rbx r12 r13 r14
..B2.197:                       # Preds ..B2.196                # Infreq
        movq      %rax, %rdi                                    #141.32
        lea       .L_2__STRING.2(%rip), %rsi                    #141.32
..___tag_value__Z10make_table10yesno_typePKc.151:               #141.32
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #141.32
..___tag_value__Z10make_table10yesno_typePKc.152:               #
                                # LOE rax rbx r12 r13 r14
..B2.198:                       # Preds ..B2.197                # Infreq
        movq      %rax, %rdi                                    #141.32
        lea       .L_2__STRING.3(%rip), %rsi                    #141.32
..___tag_value__Z10make_table10yesno_typePKc.153:               #141.32
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #141.32
..___tag_value__Z10make_table10yesno_typePKc.154:               #
                                # LOE rax rbx r12 r13 r14
..B2.199:                       # Preds ..B2.198                # Infreq
        movq      %rax, %rdi                                    #141.32
        movq      %rbx, %rsi                                    #141.32
..___tag_value__Z10make_table10yesno_typePKc.155:               #141.32
        call      _ZNSolsEPFRSoS_E@PLT                          #141.32
..___tag_value__Z10make_table10yesno_typePKc.156:               #
                                # LOE rax rbx r12 r13 r14
..B2.200:                       # Preds ..B2.199                # Infreq
        movq      %rax, %rdi                                    #141.32
        lea       .L_2__STRING.4(%rip), %rsi                    #141.32
..___tag_value__Z10make_table10yesno_typePKc.157:               #141.32
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #141.32
..___tag_value__Z10make_table10yesno_typePKc.158:               #
        jmp       ..B2.191      # Prob 100%                     #141.32
                                # LOE rax rbx r12 r13 r14
..B2.204:                       # Preds ..B2.3                  # Infreq
        lea       .L_2__STRING.0(%rip), %rsi                    #140.23
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #140.23
..___tag_value__Z10make_table10yesno_typePKc.159:               #140.23
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #140.23
..___tag_value__Z10make_table10yesno_typePKc.160:               #
                                # LOE rax r12 r13 r14
..B2.205:                       # Preds ..B2.204                # Infreq
        movq      %rax, %rdi                                    #140.23
        lea       .L_2__STRING.5(%rip), %rsi                    #140.23
..___tag_value__Z10make_table10yesno_typePKc.161:               #140.23
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #140.23
..___tag_value__Z10make_table10yesno_typePKc.162:               #
                                # LOE rax r12 r13 r14
..B2.206:                       # Preds ..B2.205                # Infreq
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx #140.23
        movq      %rax, %rdi                                    #140.23
        movq      %rbx, %rsi                                    #140.23
..___tag_value__Z10make_table10yesno_typePKc.163:               #140.23
        call      _ZNSolsEPFRSoS_E@PLT                          #140.23
..___tag_value__Z10make_table10yesno_typePKc.164:               #
                                # LOE rax rbx r12 r13 r14
..B2.207:                       # Preds ..B2.206                # Infreq
        movq      %rax, %rdi                                    #140.23
        lea       .L_2__STRING.2(%rip), %rsi                    #140.23
..___tag_value__Z10make_table10yesno_typePKc.165:               #140.23
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #140.23
..___tag_value__Z10make_table10yesno_typePKc.166:               #
                                # LOE rax rbx r12 r13 r14
..B2.208:                       # Preds ..B2.207                # Infreq
        movq      %rax, %rdi                                    #140.23
        lea       .L_2__STRING.3(%rip), %rsi                    #140.23
..___tag_value__Z10make_table10yesno_typePKc.167:               #140.23
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #140.23
..___tag_value__Z10make_table10yesno_typePKc.168:               #
                                # LOE rax rbx r12 r13 r14
..B2.209:                       # Preds ..B2.208                # Infreq
        movq      %rax, %rdi                                    #140.23
        movq      %rbx, %rsi                                    #140.23
..___tag_value__Z10make_table10yesno_typePKc.169:               #140.23
        call      _ZNSolsEPFRSoS_E@PLT                          #140.23
..___tag_value__Z10make_table10yesno_typePKc.170:               #
                                # LOE rax rbx r12 r13 r14
..B2.210:                       # Preds ..B2.209                # Infreq
        movq      %rax, %rdi                                    #140.23
        lea       .L_2__STRING.4(%rip), %rsi                    #140.23
..___tag_value__Z10make_table10yesno_typePKc.171:               #140.23
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #140.23
..___tag_value__Z10make_table10yesno_typePKc.172:               #
        jmp       ..B2.191      # Prob 100%                     #140.23
                                # LOE rax rbx r12 r13 r14
..B2.242:                       # Preds ..B2.125                # Infreq
        movq      (%r15), %r14                                  #140.23
        jmp       ..B2.27       # Prob 100%                     #140.23
                                # LOE rbx r14 r15 ebp
..B2.243:                       # Preds ..B2.4                  # Infreq
        movq      (%r15), %r14                                  #140.23
        jmp       ..B2.28       # Prob 100%                     #140.23
        .align    16,0x90
..___tag_value__Z10make_table10yesno_typePKc.173:               #
                                # LOE rbx r14 r15 ebp
# mark_end;
	.type	_Z10make_table10yesno_typePKc,@function
	.size	_Z10make_table10yesno_typePKc,.-_Z10make_table10yesno_typePKc
	.data
# -- End  _Z10make_table10yesno_typePKc
	.section .text._ZSt16__introsort_loopIPdlEvT_S1_T0_, "xaG",@progbits,_ZSt16__introsort_loopIPdlEvT_S1_T0_,comdat
..TXTST1:
# -- Begin  _ZSt16__introsort_loopIPdlEvT_S1_T0_
# mark_begin;
       .align    16,0x90
	.weak _ZSt16__introsort_loopIPdlEvT_S1_T0_
_ZSt16__introsort_loopIPdlEvT_S1_T0_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B3.1:                         # Preds ..B3.0
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.174:        #2248.5
        pushq     %r12                                          #2248.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.176:        #
        pushq     %r13                                          #2248.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.178:        #
        pushq     %rsi                                          #2248.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.180:        #
        movq      %rsi, %rax                                    #2252.14
        subq      %rdi, %rax                                    #2252.14
        sarq      $3, %rax                                      #2252.23
        cmpq      $16, %rax                                     #2252.33
        jle       ..B3.25       # Prob 5%                       #2252.33
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1
        movq      %r14, (%rsp)                                  #
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.181:        #
        movq      %rdx, %r14                                    #
        movq      %rdi, %r13                                    #
                                # LOE rbx rbp rsi r13 r14 r15
..B3.3:                         # Preds ..B3.23 ..B3.2
        movq      %rsi, %rax                                    #2256.8
        subq      %r13, %rax                                    #2256.8
        sarq      $3, %rax                                      #2256.8
        testq     %r14, %r14                                    #2254.25
        je        ..B3.26       # Prob 20%                      #2254.25
                                # LOE rax rbx rbp rsi r13 r14 r15
..B3.4:                         # Preds ..B3.3
        movq      %rax, %rcx                                    #2262.23
        decq      %r14                                          #2259.6
        shrq      $63, %rcx                                     #2262.23
        addq      %rcx, %rax                                    #2266.13
        shrq      $1, %rax                                      #2266.13
        movsd     (%r13), %xmm2                                 #2262.23
        movsd     -8(%rsi), %xmm1                               #2262.23
        lea       (%r13,%rax,8), %rcx                           #2263.11
        movsd     (%rcx), %xmm0                                 #2262.23
        lea       -8(%rsi), %rax                                #2268.13
        comisd    %xmm2, %xmm0                                  #2262.23
        jbe       ..B3.8        # Prob 50%                      #2262.23
                                # LOE rax rcx rbx rbp rsi r13 r14 r15 xmm0 xmm1 xmm2
..B3.5:                         # Preds ..B3.4
        comisd    %xmm0, %xmm1                                  #2262.23
        ja        ..B3.7        # Prob 28%                      #2262.23
                                # LOE rax rcx rbx rbp rsi r13 r14 r15 xmm1 xmm2
..B3.6:                         # Preds ..B3.5
        comisd    %xmm2, %xmm1                                  #2262.23
        movq      %rax, %rcx                                    #2262.23
        movq      %r13, %r12                                    #2262.23
        ja        ..B3.11       # Prob 50%                      #2262.23
        movq      %r13, %rcx                                    #2262.23
        jmp       ..B3.11       # Prob 100%                     #2262.23
                                # LOE rcx rbx rbp rsi r12 r13 r14 r15
..B3.7:                         # Preds ..B3.5
        movq      %r13, %r12                                    #2262.23
        jmp       ..B3.11       # Prob 100%                     #2262.23
                                # LOE rcx rbx rbp rsi r12 r13 r14 r15
..B3.8:                         # Preds ..B3.4
        comisd    %xmm2, %xmm1                                  #2262.23
        ja        ..B3.10       # Prob 28%                      #2262.23
                                # LOE rax rcx rbx rbp rsi r13 r14 r15 xmm0 xmm1
..B3.9:                         # Preds ..B3.8
        comisd    %xmm0, %xmm1                                  #2262.23
        movq      %r13, %r12                                    #2262.23
        jbe       ..B3.11       # Prob 50%                      #2262.23
        movq      %rax, %rcx                                    #2262.23
        jmp       ..B3.11       # Prob 100%                     #2262.23
                                # LOE rcx rbx rbp rsi r12 r13 r14 r15
..B3.10:                        # Preds ..B3.8
        movq      %r13, %rcx                                    #2262.23
        movq      %rcx, %r12                                    #2262.23
                                # LOE rcx rbx rbp rsi r12 r13 r14 r15
..B3.11:                        # Preds ..B3.7 ..B3.6 ..B3.10 ..B3.9
        movq      %rsi, %rax                                    #2261.6
        movsd     (%rcx), %xmm0                                 #2262.23
        jmp       ..B3.12       # Prob 100%                     #2262.23
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0
..B3.21:                        # Preds ..B3.20
        movsd     %xmm2, (%r12)                                 #2261.6
        addq      $8, %r12                                      #2261.6
        movsd     %xmm1, (%rax)                                 #2261.6
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0
..B3.12:                        # Preds ..B3.21 ..B3.11
        movsd     (%r12), %xmm1                                 #2261.6
        comisd    %xmm1, %xmm0                                  #2261.6
        jbe       ..B3.16       # Prob 10%                      #2261.6
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B3.14:                        # Preds ..B3.12 ..B3.14
        addq      $8, %r12                                      #2261.6
        movsd     (%r12), %xmm1                                 #2261.6
        comisd    %xmm1, %xmm0                                  #2261.6
        ja        ..B3.14       # Prob 82%                      #2261.6
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B3.16:                        # Preds ..B3.16 ..B3.14 ..B3.12
        addq      $-8, %rax                                     #2261.6
        movsd     (%rax), %xmm2                                 #2261.6
        comisd    %xmm0, %xmm2                                  #2261.6
        ja        ..B3.16       # Prob 90%                      #2261.6
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1 xmm2
..B3.20:                        # Preds ..B3.16
        cmpq      %rax, %r12                                    #2261.6
        jb        ..B3.21       # Prob 80%                      #2261.6
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1 xmm2
..B3.22:                        # Preds ..B3.20                 # Infreq
        movq      %r12, %rdi                                    #2269.4
        movq      %r14, %rdx                                    #2269.4
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.182:        #2269.4
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_@PLT      #2269.4
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.183:        #
                                # LOE rbx rbp r12 r13 r14 r15
..B3.23:                        # Preds ..B3.22                 # Infreq
        movq      %r12, %rsi                                    #2270.4
        subq      %r13, %r12                                    #2252.14
        sarq      $3, %r12                                      #2252.23
        cmpq      $16, %r12                                     #2252.33
        jg        ..B3.3        # Prob 82%                      #2252.33
                                # LOE rbx rbp rsi r13 r14 r15
..B3.24:                        # Preds ..B3.23                 # Infreq
        movq      (%rsp), %r14                                  #
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.184:        #
                                # LOE rbx rbp r12 r13 r14 r15
..B3.25:                        # Preds ..B3.24 ..B3.1          # Infreq
        popq      %rcx                                          #2272.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.185:        #
        popq      %r13                                          #2272.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.187:        #
        popq      %r12                                          #2272.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.189:        #
        ret                                                     #2272.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.190:        #
                                # LOE
..B3.26:                        # Preds ..B3.3                  # Infreq
        movq      (%rsp), %r14                                  #
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.194:        #
        movq      %r13, %rdi                                    #
        cmpq      $2, %rax                                      #2256.8
        jge       ..B3.45       # Prob 72%                      #2256.8
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.195:        #
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15
..B3.27:                        # Preds ..B3.60 ..B3.26         # Infreq
        movq      %rsi, %rdx                                    #
        subq      %rdi, %rdx                                    #
        cmpq      $1, %rax                                      #2256.8
        jle       ..B3.44       # Prob 10%                      #2256.8
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15
..B3.28:                        # Preds ..B3.27                 # Infreq
        movl      $1, %r9d                                      #2256.8
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 r9d
..B3.29:                        # Preds ..B3.42 ..B3.28         # Infreq
        addq      $-8, %rdx                                     #2256.8
        xorl      %r11d, %r11d                                  #2256.8
        movq      %rdx, %r10                                    #2256.8
        addq      $-8, %rsi                                     #2256.8
        sarq      $3, %r10                                      #2256.8
        xorl      %r8d, %r8d                                    #2256.8
        testq     %r10, %r10                                    #2256.8
        movq      (%rdi), %rax                                  #2256.8
        cmovle    %r9d, %r11d                                   #2256.8
        movsd     (%rsi), %xmm0                                 #2256.8
        movq      (%rsi), %rcx                                  #2256.8
        movq      %rax, (%rsi)                                  #2256.8
        xorl      %eax, %eax                                    #2256.8
        lea       -1(%r10,%r11), %r11                           #2256.8
        sarq      $1, %r11                                      #2256.8
        testq     %r11, %r11                                    #2256.8
        jle       ..B3.34       # Prob 10%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r11 r12 r13 r14 r15 r9d xmm0
..B3.31:                        # Preds ..B3.29 ..B3.33         # Infreq
        lea       2(,%rax,2), %rax                              #2256.8
        movsd     (%rdi,%rax,8), %xmm2                          #2256.8
        movsd     -8(%rdi,%rax,8), %xmm1                        #2256.8
        comisd    %xmm2, %xmm1                                  #2256.8
        jbe       ..B3.33       # Prob 50%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r11 r12 r13 r14 r15 r9d xmm0 xmm2
..B3.32:                        # Preds ..B3.31                 # Infreq
        decq      %rax                                          #2256.8
        movsd     (%rdi,%rax,8), %xmm2                          #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r11 r12 r13 r14 r15 r9d xmm0 xmm2
..B3.33:                        # Preds ..B3.32 ..B3.31         # Infreq
        movsd     %xmm2, (%rdi,%r8,8)                           #2256.8
        movq      %rax, %r8                                     #2256.8
        cmpq      %r11, %rax                                    #2256.8
        jl        ..B3.31       # Prob 82%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r11 r12 r13 r14 r15 r9d xmm0
..B3.34:                        # Preds ..B3.29 ..B3.33         # Infreq
        testq     $1, %r10                                      #2256.8
        jne       ..B3.37       # Prob 40%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r12 r13 r14 r15 r9d xmm0
..B3.35:                        # Preds ..B3.34                 # Infreq
        movq      %r10, %r11                                    #2256.8
        addq      $-2, %r11                                     #2256.8
        movl      $0, %r11d                                     #2256.8
        cmovl     %r9d, %r11d                                   #2256.8
        lea       -2(%r10,%r11), %r11                           #2256.8
        sarq      $1, %r11                                      #2256.8
        cmpq      %r11, %rax                                    #2256.8
        jne       ..B3.37       # Prob 38%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r12 r13 r14 r15 r9d xmm0
..B3.36:                        # Preds ..B3.35                 # Infreq
        lea       2(,%rax,2), %r11                              #2256.8
        movq      -8(%rdi,%r11,8), %rax                         #2256.8
        movq      %rax, (%rdi,%r8,8)                            #2256.8
        lea       -1(%r11), %r8                                 #2256.8
                                # LOE rdx rcx rbx rbp rsi rdi r8 r10 r12 r13 r14 r15 r9d xmm0
..B3.37:                        # Preds ..B3.36 ..B3.35 ..B3.34 # Infreq
        lea       -1(%r8), %rax                                 #2256.8
        shrq      $63, %rax                                     #2256.8
        lea       -1(%r8,%rax), %rax                            #2256.8
        sarq      $1, %rax                                      #2256.8
        testq     %r8, %r8                                      #2256.8
        jle       ..B3.42       # Prob 10%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r12 r13 r14 r15 r9d xmm0
..B3.39:                        # Preds ..B3.37 ..B3.40         # Infreq
        movq      (%rdi,%rax,8), %r11                           #2256.8
        comisd    (%rdi,%rax,8), %xmm0                          #2256.8
        jbe       ..B3.42       # Prob 20%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r11 r12 r13 r14 r15 r9d xmm0
..B3.40:                        # Preds ..B3.39                 # Infreq
        movq      %r11, (%rdi,%r8,8)                            #2256.8
        lea       -1(%rax), %r11                                #2256.8
        shrq      $63, %r11                                     #2256.8
        movq      %rax, %r8                                     #2256.8
        lea       -1(%rax,%r11), %rax                           #2256.8
        sarq      $1, %rax                                      #2256.8
        testq     %r8, %r8                                      #2256.8
        jg        ..B3.39       # Prob 82%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r12 r13 r14 r15 r9d xmm0
..B3.42:                        # Preds ..B3.39 ..B3.40 ..B3.37 # Infreq
        .byte     144                                           #2256.8
        .byte     72                                            #2256.8
        .byte     141                                           #2256.8
        .byte     116                                           #2256.8
        .byte     38                                            #2256.8
        .byte     0                                             #2256.8
        movq      %rcx, (%rdi,%r8,8)                            #2256.8
        cmpq      $1, %r10                                      #2256.8
        jg        ..B3.29       # Prob 82%                      #2256.8
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15 r9d
..B3.44:                        # Preds ..B3.42 ..B3.27         # Infreq
        popq      %rcx                                          #2257.8
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.196:        #
        popq      %r13                                          #2257.8
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.198:        #
        popq      %r12                                          #2257.8
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.200:        #
        ret                                                     #2257.8
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.201:        #
                                # LOE
..B3.45:                        # Preds ..B3.26                 # Infreq
        movl      $1, %edx                                      #2256.8
        xorl      %ecx, %ecx                                    #2256.8
        testq     %rax, %rax                                    #2256.8
        movq      %rax, %r10                                    #2256.8
        cmovle    %edx, %ecx                                    #2256.8
        xorl      %r11d, %r11d                                  #2256.8
        addq      $-2, %r10                                     #2256.8
        lea       -2(%rax), %r9                                 #2256.8
        cmovl     %edx, %r11d                                   #2256.8
        shrq      $63, %r9                                      #2256.8
        lea       -2(%rax,%r9), %r9                             #2256.8
        sarq      $1, %r9                                       #2256.8
        lea       -1(%rax,%rcx), %r8                            #2256.8
        movq      %rax, %rcx                                    #2256.8
        lea       -2(%rax,%r11), %rdx                           #2256.8
        sarq      $1, %r8                                       #2256.8
        andq      $1, %rcx                                      #2256.8
        sarq      $1, %rdx                                      #2256.8
        jmp       ..B3.46       # Prob 100%                     #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r14 r15
..B3.61:                        # Preds ..B3.60                 # Infreq
        decq      %r9                                           #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r14 r15
..B3.46:                        # Preds ..B3.61 ..B3.45         # Infreq
        movsd     (%rdi,%r9,8), %xmm0                           #2256.8
        movq      %r9, %r11                                     #2256.8
        movq      (%rdi,%r9,8), %r12                            #2256.8
        movq      %r9, %r10                                     #2256.8
        cmpq      %r8, %r9                                      #2256.8
        jge       ..B3.52       # Prob 10%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r14 r15 xmm0
..B3.48:                        # Preds ..B3.46 ..B3.50         # Infreq
        lea       2(,%r10,2), %r10                              #2256.8
        movsd     (%rdi,%r10,8), %xmm2                          #2256.8
        movsd     -8(%rdi,%r10,8), %xmm1                        #2256.8
        comisd    %xmm2, %xmm1                                  #2256.8
        jbe       ..B3.50       # Prob 50%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r14 r15 xmm0 xmm2
..B3.49:                        # Preds ..B3.48                 # Infreq
        decq      %r10                                          #2256.8
        movsd     (%rdi,%r10,8), %xmm2                          #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r14 r15 xmm0 xmm2
..B3.50:                        # Preds ..B3.49 ..B3.48         # Infreq
        movsd     %xmm2, (%rdi,%r11,8)                          #2256.8
        movq      %r10, %r11                                    #2256.8
        cmpq      %r8, %r10                                     #2256.8
        jl        ..B3.48       # Prob 82%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r14 r15 xmm0
..B3.52:                        # Preds ..B3.50 ..B3.46         # Infreq
        testq     %rcx, %rcx                                    #2256.8
        jne       ..B3.55       # Prob 40%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r14 r15 xmm0
..B3.53:                        # Preds ..B3.52                 # Infreq
        cmpq      %rdx, %r10                                    #2256.8
        jne       ..B3.55       # Prob 38%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r14 r15 xmm0
..B3.54:                        # Preds ..B3.53                 # Infreq
        lea       2(,%r10,2), %r13                              #2256.8
        movq      -8(%rdi,%r13,8), %r10                         #2256.8
        movq      %r10, (%rdi,%r11,8)                           #2256.8
        lea       -1(%r13), %r11                                #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r11 r12 r14 r15 xmm0
..B3.55:                        # Preds ..B3.54 ..B3.53 ..B3.52 # Infreq
        lea       -1(%r11), %r10                                #2256.8
        shrq      $63, %r10                                     #2256.8
        lea       -1(%r11,%r10), %r10                           #2256.8
        sarq      $1, %r10                                      #2256.8
        cmpq      %r9, %r11                                     #2256.8
        jle       ..B3.60       # Prob 10%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r14 r15 xmm0
..B3.57:                        # Preds ..B3.55 ..B3.58         # Infreq
        movq      (%rdi,%r10,8), %r13                           #2256.8
        comisd    (%rdi,%r10,8), %xmm0                          #2256.8
        jbe       ..B3.60       # Prob 20%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 xmm0
..B3.58:                        # Preds ..B3.57                 # Infreq
        movq      %r13, (%rdi,%r11,8)                           #2256.8
        lea       -1(%r10), %r13                                #2256.8
        shrq      $63, %r13                                     #2256.8
        movq      %r10, %r11                                    #2256.8
        lea       -1(%r10,%r13), %r10                           #2256.8
        sarq      $1, %r10                                      #2256.8
        cmpq      %r9, %r11                                     #2256.8
        jg        ..B3.57       # Prob 82%                      #2256.8
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r14 r15 xmm0
..B3.60:                        # Preds ..B3.57 ..B3.58 ..B3.55 # Infreq
        movq      %r12, (%rdi,%r11,8)                           #2256.8
        testq     %r9, %r9                                      #2256.8
        je        ..B3.27       # Prob 20%                      #2256.8
        jmp       ..B3.61       # Prob 100%                     #2256.8
        .align    16,0x90
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.204:        #
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r14 r15
# mark_end;
	.type	_ZSt16__introsort_loopIPdlEvT_S1_T0_,@function
	.size	_ZSt16__introsort_loopIPdlEvT_S1_T0_,.-_ZSt16__introsort_loopIPdlEvT_S1_T0_
	.data
# -- End  _ZSt16__introsort_loopIPdlEvT_S1_T0_
	.text
# -- Begin  _Z8time_ffti10yesno_type
# mark_begin;
..___tag_value__Z8time_ffti10yesno_type.210:                   #
        .align    16,0x90
	.globl _Z8time_ffti10yesno_type
_Z8time_ffti10yesno_type:
# parameter 1: %edi
# parameter 2: %esi
..B4.1:                         # Preds ..B4.0
..___tag_value__Z8time_ffti10yesno_type.211:                    #21.47
        pushq     %r12                                          #21.47
..___tag_value__Z8time_ffti10yesno_type.213:                    #
        pushq     %r13                                          #21.47
..___tag_value__Z8time_ffti10yesno_type.215:                    #
        pushq     %r14                                          #21.47
..___tag_value__Z8time_ffti10yesno_type.217:                    #
        pushq     %r15                                          #21.47
..___tag_value__Z8time_ffti10yesno_type.219:                    #
        pushq     %rbx                                          #21.47
..___tag_value__Z8time_ffti10yesno_type.221:                    #
        pushq     %rbp                                          #21.47
..___tag_value__Z8time_ffti10yesno_type.223:                    #
        subq      $88, %rsp                                     #21.47
..___tag_value__Z8time_ffti10yesno_type.225:                    #
        movl      %edi, %r14d                                   #21.47
        movslq    %r14d, %r14                                   #21.47
        movl      %esi, %r15d                                   #21.47
        movq      %r14, (%rsp)                                  #21.47
        movl      %r14d, %edx                                   #25.11
        xorl      %r13d, %r13d                                  #26.23
        cmpq      $1, %r14                                      #27.13
        jle       ..B4.5        # Prob 10%                      #27.13
..___tag_value__Z8time_ffti10yesno_type.226:                    #
                                # LOE edx r13d r14d r15d
..B4.3:                         # Preds ..B4.1 ..B4.214
        movl      %edx, %eax                                    #28.9
        andl      $-2147483647, %eax                            #28.9
        jge       ..B4.214      # Prob 50%                      #28.9
..___tag_value__Z8time_ffti10yesno_type.227:                    #
                                # LOE eax edx r13d r14d r15d
..B4.215:                       # Preds ..B4.3
        subl      $1, %eax                                      #28.9
        orl       $-2, %eax                                     #28.9
        incl      %eax                                          #28.9
..___tag_value__Z8time_ffti10yesno_type.228:                    #
                                # LOE eax edx r13d r14d r15d
..B4.214:                       # Preds ..B4.3 ..B4.215
        cmpl      $1, %eax                                      #29.4
        cmove     %eax, %r13d                                   #29.4
        movl      %edx, %eax                                    #30.3
        shrl      $31, %eax                                     #30.3
        addl      %eax, %edx                                    #30.3
        sarl      $1, %edx                                      #30.3
        cmpl      $1, %edx                                      #27.13
        jg        ..B4.3        # Prob 82%                      #27.13
..___tag_value__Z8time_ffti10yesno_type.229:                    #
                                # LOE edx r13d r14d r15d
..B4.5:                         # Preds ..B4.214 ..B4.1         # Infreq
        movq      $0x2540be400, %rdi                            #37.28
        movl      $64, %esi                                     #37.28
..___tag_value__Z8time_ffti10yesno_type.230:                    #37.28
        call      MKL_malloc@PLT                                #37.28
..___tag_value__Z8time_ffti10yesno_type.232:                    #
                                # LOE rax r13d r14d r15d
..B4.216:                       # Preds ..B4.5                  # Infreq
        movq      %rax, %r12                                    #37.28
..___tag_value__Z8time_ffti10yesno_type.234:                    #
                                # LOE r12 r13d r14d r15d
..B4.6:                         # Preds ..B4.216                # Infreq
        movq      (%rsp), %rcx                                  #38.27
        movq      $0x2540be400, %rax                            #38.29
        shlq      $4, %rcx                                      #38.27
        xorl      %edx, %edx                                    #38.29
        divq      %rcx                                          #38.29
        movq      stat_mkl(%rip), %rbx                          #43.5
        testq     %rbx, %rbx                                    #43.17
        movq      %rcx, 40(%rsp)                                #38.27
        movq      %rax, 48(%rsp)                                #38.29
        je        ..B4.10       # Prob 12%                      #43.17
..___tag_value__Z8time_ffti10yesno_type.235:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.7:                         # Preds ..B4.6                  # Infreq
        movq      (%rbx), %rdi                                  #44.3
        testq     %rdi, %rdi                                    #44.3
        je        ..B4.9        # Prob 33%                      #44.3
..___tag_value__Z8time_ffti10yesno_type.236:                    #
                                # LOE rbx rdi r12 r13d r14d r15d
..B4.8:                         # Preds ..B4.7                  # Infreq
        call      _ZdaPv@PLT                                    #44.3
..___tag_value__Z8time_ffti10yesno_type.237:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.9:                         # Preds ..B4.8 ..B4.7           # Infreq
        movq      %rbx, %rdi                                    #44.3
        call      _ZdlPv@PLT                                    #44.3
..___tag_value__Z8time_ffti10yesno_type.238:                    #
                                # LOE r12 r13d r14d r15d
..B4.10:                        # Preds ..B4.9 ..B4.6           # Infreq
        movl      $24, %edi                                     #45.28
        movl      $0, 16(%rsp)                                  #45.2
..___tag_value__Z8time_ffti10yesno_type.239:                    #45.28
        call      _Znwm@PLT                                     #45.28
..___tag_value__Z8time_ffti10yesno_type.241:                    #
                                # LOE rax r12 r13d r14d r15d
..B4.213:                       # Preds ..B4.10                 # Infreq
        movq      %rax, %rbx                                    #45.28
..___tag_value__Z8time_ffti10yesno_type.243:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.11:                        # Preds ..B4.213                # Infreq
        movq      %rbx, 8(%rsp)                                 #45.28
        testq     %rbx, %rbx                                    #45.28
        je        ..B4.14       # Prob 33%                      #45.28
..___tag_value__Z8time_ffti10yesno_type.244:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.12:                        # Preds ..B4.11                 # Infreq
        movq      48(%rsp), %rax                                #45.28
        movslq    %eax, %rdi                                    #45.28
        shlq      $3, %rdi                                      #45.28
        movl      $1, 16(%rsp)                                  #45.2
        movl      %eax, 8(%rbx)                                 #45.28
..___tag_value__Z8time_ffti10yesno_type.245:                    #45.28
        call      _Znam@PLT                                     #45.28
..___tag_value__Z8time_ffti10yesno_type.247:                    #
                                # LOE rax rbx r12 r13d r14d r15d
..B4.13:                        # Preds ..B4.12                 # Infreq
        movq      %rax, (%rbx)                                  #45.28
        xorl      %eax, %eax                                    #45.28
        movl      %eax, 16(%rbx)                                #45.28
        movl      %eax, 16(%rsp)                                #45.28
        movl      $-1, 12(%rbx)                                 #45.28
        movq      8(%rsp), %rax                                 #45.28
        jmp       ..B4.15       # Prob 100%                     #45.28
..___tag_value__Z8time_ffti10yesno_type.249:                    #
                                # LOE rax r12 r13d r14d r15d
..B4.14:                        # Preds ..B4.11                 # Infreq
        xorl      %eax, %eax                                    #45.28
..___tag_value__Z8time_ffti10yesno_type.250:                    #
                                # LOE rax r12 r13d r14d r15d
..B4.15:                        # Preds ..B4.13 ..B4.14         # Infreq
        movq      stat_fftw(%rip), %rbx                         #47.5
        testq     %rbx, %rbx                                    #47.18
        movq      %rax, stat_mkl(%rip)                          #45.2
        je        ..B4.19       # Prob 12%                      #47.18
..___tag_value__Z8time_ffti10yesno_type.251:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.16:                        # Preds ..B4.15                 # Infreq
        movq      (%rbx), %rdi                                  #48.3
        testq     %rdi, %rdi                                    #48.3
        je        ..B4.18       # Prob 33%                      #48.3
..___tag_value__Z8time_ffti10yesno_type.252:                    #
                                # LOE rbx rdi r12 r13d r14d r15d
..B4.17:                        # Preds ..B4.16                 # Infreq
        call      _ZdaPv@PLT                                    #48.3
..___tag_value__Z8time_ffti10yesno_type.253:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.18:                        # Preds ..B4.17 ..B4.16         # Infreq
        movq      %rbx, %rdi                                    #48.3
        call      _ZdlPv@PLT                                    #48.3
..___tag_value__Z8time_ffti10yesno_type.254:                    #
                                # LOE r12 r13d r14d r15d
..B4.19:                        # Preds ..B4.18 ..B4.15         # Infreq
        movl      $24, %edi                                     #49.29
        movl      $0, 16(%rsp)                                  #49.2
..___tag_value__Z8time_ffti10yesno_type.255:                    #49.29
        call      _Znwm@PLT                                     #49.29
..___tag_value__Z8time_ffti10yesno_type.257:                    #
                                # LOE rax r12 r13d r14d r15d
..B4.211:                       # Preds ..B4.19                 # Infreq
        movq      %rax, %rbx                                    #49.29
..___tag_value__Z8time_ffti10yesno_type.259:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.20:                        # Preds ..B4.211                # Infreq
        movq      %rbx, 8(%rsp)                                 #49.29
        testq     %rbx, %rbx                                    #49.29
        je        ..B4.23       # Prob 33%                      #49.29
..___tag_value__Z8time_ffti10yesno_type.260:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.21:                        # Preds ..B4.20                 # Infreq
        movq      48(%rsp), %rax                                #49.29
        movslq    %eax, %rdi                                    #49.29
        shlq      $3, %rdi                                      #49.29
        movl      $1, 16(%rsp)                                  #49.2
        movl      %eax, 8(%rbx)                                 #49.29
..___tag_value__Z8time_ffti10yesno_type.261:                    #49.29
        call      _Znam@PLT                                     #49.29
..___tag_value__Z8time_ffti10yesno_type.263:                    #
                                # LOE rax rbx r12 r13d r14d r15d
..B4.22:                        # Preds ..B4.21                 # Infreq
        movq      %rax, (%rbx)                                  #49.29
        xorl      %eax, %eax                                    #49.29
        movl      %eax, 16(%rbx)                                #49.29
        movl      %eax, 16(%rsp)                                #49.29
        movl      $-1, 12(%rbx)                                 #49.29
        movq      8(%rsp), %rax                                 #49.29
        jmp       ..B4.24       # Prob 100%                     #49.29
..___tag_value__Z8time_ffti10yesno_type.265:                    #
                                # LOE rax r12 r13d r14d r15d
..B4.23:                        # Preds ..B4.20                 # Infreq
        xorl      %eax, %eax                                    #49.29
..___tag_value__Z8time_ffti10yesno_type.266:                    #
                                # LOE rax r12 r13d r14d r15d
..B4.24:                        # Preds ..B4.22 ..B4.23         # Infreq
        movq      stat_nr(%rip), %rbx                           #51.5
        testq     %rbx, %rbx                                    #51.16
        movq      %rax, stat_fftw(%rip)                         #49.2
        je        ..B4.28       # Prob 12%                      #51.16
..___tag_value__Z8time_ffti10yesno_type.267:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.25:                        # Preds ..B4.24                 # Infreq
        movq      (%rbx), %rdi                                  #52.3
        testq     %rdi, %rdi                                    #52.3
        je        ..B4.27       # Prob 33%                      #52.3
..___tag_value__Z8time_ffti10yesno_type.268:                    #
                                # LOE rbx rdi r12 r13d r14d r15d
..B4.26:                        # Preds ..B4.25                 # Infreq
        call      _ZdaPv@PLT                                    #52.3
..___tag_value__Z8time_ffti10yesno_type.269:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.27:                        # Preds ..B4.26 ..B4.25         # Infreq
        movq      %rbx, %rdi                                    #52.3
        call      _ZdlPv@PLT                                    #52.3
..___tag_value__Z8time_ffti10yesno_type.270:                    #
                                # LOE r12 r13d r14d r15d
..B4.28:                        # Preds ..B4.27 ..B4.24         # Infreq
        movl      $24, %edi                                     #53.27
        movl      $0, 16(%rsp)                                  #53.2
..___tag_value__Z8time_ffti10yesno_type.271:                    #53.27
        call      _Znwm@PLT                                     #53.27
..___tag_value__Z8time_ffti10yesno_type.273:                    #
                                # LOE rax r12 r13d r14d r15d
..B4.209:                       # Preds ..B4.28                 # Infreq
        movq      %rax, %rbx                                    #53.27
..___tag_value__Z8time_ffti10yesno_type.275:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.29:                        # Preds ..B4.209                # Infreq
        movq      %rbx, 8(%rsp)                                 #53.27
        testq     %rbx, %rbx                                    #53.27
        je        ..B4.32       # Prob 33%                      #53.27
..___tag_value__Z8time_ffti10yesno_type.276:                    #
                                # LOE rbx r12 r13d r14d r15d
..B4.30:                        # Preds ..B4.29                 # Infreq
        movq      48(%rsp), %rax                                #53.27
        movslq    %eax, %rdi                                    #53.27
        shlq      $3, %rdi                                      #53.27
        movl      $1, 16(%rsp)                                  #53.2
        movl      %eax, 8(%rbx)                                 #53.27
..___tag_value__Z8time_ffti10yesno_type.277:                    #53.27
        call      _Znam@PLT                                     #53.27
..___tag_value__Z8time_ffti10yesno_type.279:                    #
                                # LOE rax rbx r12 r13d r14d r15d
..B4.31:                        # Preds ..B4.30                 # Infreq
        movq      %rax, (%rbx)                                  #53.27
        xorl      %eax, %eax                                    #53.27
        movl      %eax, 16(%rbx)                                #53.27
        movl      %eax, 16(%rsp)                                #53.27
        movl      $-1, 12(%rbx)                                 #53.27
        movq      8(%rsp), %rax                                 #53.27
        jmp       ..B4.33       # Prob 100%                     #53.27
..___tag_value__Z8time_ffti10yesno_type.281:                    #
                                # LOE rax r12 r13d r14d r15d
..B4.32:                        # Preds ..B4.29                 # Infreq
        xorl      %eax, %eax                                    #53.27
..___tag_value__Z8time_ffti10yesno_type.282:                    #
                                # LOE rax r12 r13d r14d r15d
..B4.33:                        # Preds ..B4.31 ..B4.32         # Infreq
        movq      %rax, stat_nr(%rip)                           #53.2
        testl     %r15d, %r15d                                  #59.17
        jne       ..B4.40       # Prob 50%                      #59.17
..___tag_value__Z8time_ffti10yesno_type.283:                    #
                                # LOE r12 r13d r14d r15d
..B4.34:                        # Preds ..B4.33                 # Infreq
        movq      48(%rsp), %rax                                #60.23
        xorl      %ebx, %ebx                                    #60.3
        movq      %r12, %rcx                                    #
        testq     %rax, %rax                                    #60.23
        jle       ..B4.44       # Prob 10%                      #60.23
..___tag_value__Z8time_ffti10yesno_type.284:                    #
                                # LOE rcx rbx r12 r13d r14d r15d
..B4.35:                        # Preds ..B4.34                 # Infreq
        movq      (%rsp), %rax                                  #62.23
        testq     %rax, %rax                                    #62.23
        jle       ..B4.44       # Prob 50%                      #62.23
..___tag_value__Z8time_ffti10yesno_type.285:                    #
                                # LOE rcx rbx r12 r13d r14d r15d
..B4.36:                        # Preds ..B4.35                 # Infreq
        pushq     $2                                            #62.4
        popq      %rax                                          #62.4
        movq      $0x100000000, %rbp                            #62.4
        movl      %r14d, %edx                                   #62.4
        movaps    .L_2il0floatpacket.669(%rip), %xmm7           #63.14
        andl      $-8, %edx                                     #62.4
        movsd     .L_2il0floatpacket.670(%rip), %xmm6           #63.19
        movd      %eax, %xmm0                                   #62.4
        movd      %rbp, %xmm8                                   #62.4
        pshufd    $0, %xmm0, %xmm9                              #62.4
        movaps    .L_2il0floatpacket.671(%rip), %xmm5           #64.16
        movsd     .L_2il0floatpacket.672(%rip), %xmm4           #63.14
        movsd     .L_2il0floatpacket.673(%rip), %xmm3           #64.16
..___tag_value__Z8time_ffti10yesno_type.286:                    #
                                # LOE rcx rbx r12 edx r13d r14d r15d xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B4.37:                        # Preds ..B4.135 ..B4.36        # Infreq
        cmpl      $8, %r14d                                     #62.4
        jl        ..B4.137      # Prob 10%                      #62.4
..___tag_value__Z8time_ffti10yesno_type.287:                    #
                                # LOE rcx rbx r12 edx r13d r14d r15d xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B4.38:                        # Preds ..B4.37                 # Infreq
        movq      %rbx, %rsi                                    #64.26
        xorl      %ebp, %ebp                                    #62.4
        imulq     %rbx, %rsi                                    #64.26
        cvtsi2sdq %rbx, %xmm1                                   #63.23
        cvtsi2sdq %rsi, %xmm0                                   #64.26
        addsd     %xmm6, %xmm1                                  #63.23
        addsd     %xmm6, %xmm0                                  #64.26
        unpcklpd  %xmm1, %xmm1                                  #63.23
        movdqa    %xmm8, %xmm2                                  #62.4
        unpcklpd  %xmm0, %xmm0                                  #64.26
        movl      %edx, %eax                                    #62.4
..___tag_value__Z8time_ffti10yesno_type.288:                    #
                                # LOE rcx rbx r12 eax edx ebp r13d r14d r15d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B4.39:                        # Preds ..B4.39 ..B4.38         # Infreq
        cvtdq2pd  %xmm2, %xmm11                                 #63.25
        movaps    %xmm1, %xmm10                                 #63.25
        movaps    %xmm7, %xmm12                                 #63.25
        addpd     %xmm11, %xmm10                                #63.25
        addpd     %xmm0, %xmm11                                 #64.28
        divpd     %xmm10, %xmm12                                #63.25
        paddd     %xmm9, %xmm2                                  #64.5
        movaps    %xmm5, %xmm13                                 #64.28
        cvtdq2pd  %xmm2, %xmm10                                 #63.25
        divpd     %xmm11, %xmm13                                #64.28
        movaps    %xmm1, %xmm15                                 #63.25
        lea       (%rbp,%rbp), %esi                             #64.5
        addpd     %xmm10, %xmm15                                #63.25
        addpd     %xmm0, %xmm10                                 #64.28
        movslq    %esi, %rsi                                    #63.5
        movaps    %xmm7, %xmm11                                 #63.25
        divpd     %xmm15, %xmm11                                #63.25
        movsd     %xmm12, (%rcx,%rsi,8)                         #61.14
        movaps    %xmm12, %xmm14                                #64.5
        movaps    %xmm5, %xmm12                                 #64.28
        paddd     %xmm9, %xmm2                                  #64.5
        divpd     %xmm10, %xmm12                                #64.28
        cvtdq2pd  %xmm2, %xmm10                                 #63.25
        unpckhpd  %xmm13, %xmm14                                #64.5
        paddd     %xmm9, %xmm2                                  #64.5
        movsd     %xmm14, 16(%rcx,%rsi,8)                       #61.14
        movaps    %xmm1, %xmm15                                 #63.25
        movhpd    %xmm14, 24(%rcx,%rsi,8)                       #61.14
        movaps    %xmm1, %xmm14                                 #63.25
        addpd     %xmm10, %xmm14                                #63.25
        addpd     %xmm0, %xmm10                                 #64.28
        movsd     %xmm13, 8(%rcx,%rsi,8)                        #61.14
        movaps    %xmm11, %xmm13                                #64.5
        movsd     %xmm11, 32(%rcx,%rsi,8)                       #61.14
        movaps    %xmm7, %xmm11                                 #63.25
        unpckhpd  %xmm12, %xmm13                                #64.5
        addl      $8, %ebp                                      #62.4
        movsd     %xmm12, 40(%rcx,%rsi,8)                       #61.14
        movaps    %xmm5, %xmm12                                 #64.28
        divpd     %xmm14, %xmm11                                #63.25
        divpd     %xmm10, %xmm12                                #64.28
        cvtdq2pd  %xmm2, %xmm10                                 #63.25
        addpd     %xmm10, %xmm15                                #63.25
        addpd     %xmm0, %xmm10                                 #64.28
        movsd     %xmm13, 48(%rcx,%rsi,8)                       #61.14
        paddd     %xmm9, %xmm2                                  #64.5
        movhpd    %xmm13, 56(%rcx,%rsi,8)                       #61.14
        movaps    %xmm11, %xmm13                                #64.5
        movsd     %xmm11, 64(%rcx,%rsi,8)                       #61.14
        movaps    %xmm7, %xmm11                                 #63.25
        unpckhpd  %xmm12, %xmm13                                #64.5
        cmpl      %edx, %ebp                                    #62.4
        movsd     %xmm12, 72(%rcx,%rsi,8)                       #61.14
        movaps    %xmm5, %xmm12                                 #64.28
        divpd     %xmm15, %xmm11                                #63.25
        divpd     %xmm10, %xmm12                                #64.28
        movsd     %xmm13, 80(%rcx,%rsi,8)                       #61.14
        movhpd    %xmm13, 88(%rcx,%rsi,8)                       #61.14
        movaps    %xmm11, %xmm13                                #64.5
        unpckhpd  %xmm12, %xmm13                                #64.5
        movsd     %xmm11, 96(%rcx,%rsi,8)                       #61.14
        movsd     %xmm12, 104(%rcx,%rsi,8)                      #61.14
        movsd     %xmm13, 112(%rcx,%rsi,8)                      #61.14
        movhpd    %xmm13, 120(%rcx,%rsi,8)                      #61.14
        jb        ..B4.39       # Prob 82%                      #62.4
        jmp       ..B4.132      # Prob 100%                     #62.4
..___tag_value__Z8time_ffti10yesno_type.289:                    #
                                # LOE rcx rbx r12 eax edx ebp r13d r14d r15d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B4.40:                        # Preds ..B4.33                 # Infreq
        movq      (%rsp), %rax                                  #69.22
        testq     %rax, %rax                                    #69.22
        jle       ..B4.44       # Prob 50%                      #69.22
..___tag_value__Z8time_ffti10yesno_type.290:                    #
                                # LOE r12 r13d r14d r15d
..B4.41:                        # Preds ..B4.40                 # Infreq
        cmpl      $8, %r14d                                     #69.3
        jl        ..B4.145      # Prob 10%                      #69.3
..___tag_value__Z8time_ffti10yesno_type.291:                    #
                                # LOE r12 r13d r14d r15d
..B4.42:                        # Preds ..B4.41                 # Infreq
        movl      %r14d, %ebx                                   #69.3
        xorl      %eax, %eax                                    #69.3
        xorl      %ecx, %ecx                                    #70.24
        andl      $-8, %ebx                                     #69.3
        pxor      %xmm0, %xmm0                                  #70.24
..___tag_value__Z8time_ffti10yesno_type.292:                    #
                                # LOE rcx r12 eax ebx r13d r14d r15d xmm0
..B4.43:                        # Preds ..B4.43 ..B4.42         # Infreq
        lea       (%rax,%rax), %edx                             #70.4
        addl      $8, %eax                                      #69.3
        movslq    %edx, %rdx                                    #70.4
        cmpl      %ebx, %eax                                    #69.3
        movq      %rcx, (%r12,%rdx,8)                           #37.28
        movhpd    %xmm0, 8(%r12,%rdx,8)                         #37.28
        movq      %rcx, 16(%r12,%rdx,8)                         #37.28
        movhpd    %xmm0, 24(%r12,%rdx,8)                        #37.28
        movq      %rcx, 32(%r12,%rdx,8)                         #37.28
        movhpd    %xmm0, 40(%r12,%rdx,8)                        #37.28
        movq      %rcx, 48(%r12,%rdx,8)                         #37.28
        movhpd    %xmm0, 56(%r12,%rdx,8)                        #37.28
        movq      %rcx, 64(%r12,%rdx,8)                         #37.28
        movhpd    %xmm0, 72(%r12,%rdx,8)                        #37.28
        movq      %rcx, 80(%r12,%rdx,8)                         #37.28
        movhpd    %xmm0, 88(%r12,%rdx,8)                        #37.28
        movq      %rcx, 96(%r12,%rdx,8)                         #37.28
        movhpd    %xmm0, 104(%r12,%rdx,8)                       #37.28
        movq      %rcx, 112(%r12,%rdx,8)                        #37.28
        movhpd    %xmm0, 120(%r12,%rdx,8)                       #37.28
        jb        ..B4.43       # Prob 82%                      #69.3
        jmp       ..B4.141      # Prob 100%                     #69.3
..___tag_value__Z8time_ffti10yesno_type.293:                    #
                                # LOE rcx r12 eax ebx r13d r14d r15d xmm0
..B4.44:                        # Preds ..B4.143 ..B4.135 ..B4.40 ..B4.141 ..B4.34
                                #       ..B4.35                 # Infreq
        movl      %r14d, %esi                                   #77.14
        lea       24(%rsp), %rdi                                #77.14
..___tag_value__Z8time_ffti10yesno_type.294:                    #77.14
        call      _ZN7fft_mklC1Ei@PLT                           #77.14
..___tag_value__Z8time_ffti10yesno_type.296:                    #
                                # LOE r12 r13d r14d r15d
..B4.45:                        # Preds ..B4.44                 # Infreq
        xorl      %ebp, %ebp                                    #78.13
        movq      48(%rsp), %rax                                #78.22
        xorl      %ebx, %ebx                                    #
        testq     %rax, %rax                                    #78.22
        jle       ..B4.51       # Prob 4%                       #78.22
..___tag_value__Z8time_ffti10yesno_type.298:                    #
                                # LOE rbx rbp r12 r13d r14d r15d
..B4.47:                        # Preds ..B4.45 ..B4.49         # Infreq
        testl     %r15d, %r15d                                  #82.7
        lea       (%r12,%rbx), %rsi                             #
        cmovne    %r12, %rsi                                    #82.7
        rdtsc                                                   #80.7
        movl      %eax, 8(%rsp)                                 #80.7
        xorl      %eax, %eax                                    #82.7
        movq      32(%rsp), %rdi                                #82.7
        movl      %edx, 12(%rsp)                                #80.7
..___tag_value__Z8time_ffti10yesno_type.299:                    #82.7
        call      DftiComputeForward@PLT                        #82.7
..___tag_value__Z8time_ffti10yesno_type.301:                    #
                                # LOE rbx rbp r12 r13d r14d r15d
..B4.48:                        # Preds ..B4.47                 # Infreq
        rdtsc                                                   #86.23
        movq      stat_mkl(%rip), %rsi                          #87.3
        movl      8(%rsp), %r8d                                 #86.19
        movl      12(%rsp), %r9d                                #86.19
        movslq    16(%rsi), %rcx                                #87.13
        movslq    8(%rsi), %rdi                                 #87.13
        cmpq      %rdi, %rcx                                    #87.13
        jge       ..B4.150      # Prob 20%                      #87.13
..___tag_value__Z8time_ffti10yesno_type.303:                    #
                                # LOE rcx rbx rbp rsi r8 r12 eax edx r9d r13d r14d r15d
..B4.49:                        # Preds ..B4.48                 # Infreq
        subl      %r9d, %edx                                    #86.23
        incq      %rbp                                          #78.29
        movl      %eax, %eax                                    #86.23
        cvtsi2sdq %rax, %xmm2                                   #86.23
        cvtsi2sdq %r8, %xmm0                                    #86.23
        cvtsi2sdq %rdx, %xmm1                                   #86.23
        subsd     %xmm0, %xmm2                                  #86.23
        mulsd     .L_2il0floatpacket.674(%rip), %xmm1           #86.23
        movq      (%rsi), %rdi                                  #87.13
        addsd     %xmm1, %xmm2                                  #86.23
        movsd     %xmm2, (%rdi,%rcx,8)                          #87.13
        incl      16(%rsi)                                      #87.13
        addq      40(%rsp), %rbx                                #78.29
        movl      $-1, 12(%rsi)                                 #87.13
        cmpq      48(%rsp), %rbp                                #78.22
        jl        ..B4.47       # Prob 82%                      #78.22
..___tag_value__Z8time_ffti10yesno_type.304:                    #
                                # LOE rbx rbp r12 r13d r14d r15d
..B4.51:                        # Preds ..B4.49 ..B4.45         # Infreq
        movl      %r14d, %esi                                   #93.16
        lea       56(%rsp), %rdi                                #93.16
..___tag_value__Z8time_ffti10yesno_type.305:                    #93.16
        call      _ZN8fft_fftwC1Ei@PLT                          #93.16
..___tag_value__Z8time_ffti10yesno_type.307:                    #
                                # LOE r12 r13d r15d
..B4.52:                        # Preds ..B4.51                 # Infreq
        xorl      %r14d, %r14d                                  #94.13
        movq      48(%rsp), %rax                                #94.22
        xorl      %ebp, %ebp                                    #
        testq     %rax, %rax                                    #94.22
        jle       ..B4.63       # Prob 10%                      #94.22
..___tag_value__Z8time_ffti10yesno_type.309:                    #
                                # LOE rbp r12 r14 r13d r15d
..B4.54:                        # Preds ..B4.52 ..B4.61         # Infreq
        testl     %r15d, %r15d                                  #95.28
        lea       (%r12,%rbp), %rbx                             #
        cmovne    %r12, %rbx                                    #95.28
        movq      %rbx, %rcx                                    #98.8
        sarq      $3, %rcx                                      #98.8
        shrq      $60, %rcx                                     #98.8
        addq      %rbx, %rcx                                    #98.8
        andq      $-16, %rcx                                    #98.8
        rdtsc                                                   #96.7
        movl      %edx, 12(%rsp)                                #96.7
        cmpq      %rbx, %rcx                                    #98.8
        movl      %eax, 8(%rsp)                                 #96.7
        jne       ..B4.113      # Prob 20%                      #98.8
..___tag_value__Z8time_ffti10yesno_type.310:                    #
                                # LOE rbx rbp r12 r14 r13d r15d
..B4.55:                        # Preds ..B4.54                 # Infreq
        movq      %rbx, %rsi                                    #98.8
        movq      %rbx, %rdx                                    #98.8
        movq      64(%rsp), %rdi                                #98.8
..___tag_value__Z8time_ffti10yesno_type.311:                    #98.8
        call      fftw_execute_dft@PLT                          #98.8
..___tag_value__Z8time_ffti10yesno_type.313:                    #
                                # LOE rbx rbp r12 r14 r13d r15d
..B4.56:                        # Preds ..B4.55                 # Infreq
        movl      56(%rsp), %edx                                #98.3
        xorl      %ecx, %ecx                                    #98.8
        lea       (%rdx,%rdx), %eax                             #98.8
        testl     %eax, %eax                                    #98.8
        jle       ..B4.60       # Prob 10%                      #98.8
..___tag_value__Z8time_ffti10yesno_type.315:                    #
                                # LOE rcx rbx rbp r12 r14 edx r13d r15d
..B4.58:                        # Preds ..B4.56 ..B4.58         # Infreq
        cvtsi2sd  %edx, %xmm0                                   #98.8
        movsd     (%rbx), %xmm1                                 #98.8
        incq      %rcx                                          #98.8
        divsd     %xmm0, %xmm1                                  #98.8
        movsd     %xmm1, (%rbx)                                 #98.8
        addq      $8, %rbx                                      #98.8
        movl      56(%rsp), %edx                                #98.3
        movslq    %edx, %rax                                    #98.8
        addq      %rax, %rax                                    #98.8
        cmpq      %rax, %rcx                                    #98.8
        jl        ..B4.58       # Prob 82%                      #98.8
..___tag_value__Z8time_ffti10yesno_type.316:                    #
                                # LOE rcx rbx rbp r12 r14 edx r13d r15d
..B4.60:                        # Preds ..B4.58 ..B4.56         # Infreq
        rdtsc                                                   #102.23
        movq      stat_fftw(%rip), %r8                          #103.3
        movl      8(%rsp), %ebx                                 #102.19
        movl      12(%rsp), %esi                                #102.19
        movslq    16(%r8), %rdi                                 #103.14
        movslq    8(%r8), %rcx                                  #103.14
        cmpq      %rcx, %rdi                                    #103.14
        jge       ..B4.103      # Prob 20%                      #103.14
..___tag_value__Z8time_ffti10yesno_type.317:                    #
                                # LOE rbx rbp rdi r8 r12 r14 eax edx esi r13d r15d
..B4.61:                        # Preds ..B4.60                 # Infreq
        subl      %esi, %edx                                    #102.23
        incq      %r14                                          #94.29
        movl      %eax, %eax                                    #102.23
        cvtsi2sdq %rax, %xmm2                                   #102.23
        cvtsi2sdq %rbx, %xmm0                                   #102.23
        cvtsi2sdq %rdx, %xmm1                                   #102.23
        subsd     %xmm0, %xmm2                                  #102.23
        mulsd     .L_2il0floatpacket.674(%rip), %xmm1           #102.23
        movq      (%r8), %rcx                                   #103.14
        addsd     %xmm1, %xmm2                                  #102.23
        movsd     %xmm2, (%rcx,%rdi,8)                          #103.14
        incl      16(%r8)                                       #103.14
        addq      40(%rsp), %rbp                                #94.29
        movl      $-1, 12(%r8)                                  #103.14
        cmpq      48(%rsp), %r14                                #94.22
        jl        ..B4.54       # Prob 82%                      #94.22
..___tag_value__Z8time_ffti10yesno_type.318:                    #
                                # LOE rbp r12 r14 r13d r15d
..B4.63:                        # Preds ..B4.61 ..B4.52         # Infreq
        cmpl      $1, %r13d                                     #109.9
        jne       ..B4.66       # Prob 67%                      #109.9
..___tag_value__Z8time_ffti10yesno_type.319:                    #
                                # LOE r12 r13d r15d
..B4.64:                        # Preds ..B4.63                 # Infreq
        movq      stat_nr(%rip), %rcx                           #111.3
        movslq    16(%rcx), %rdx                                #111.12
        movslq    8(%rcx), %rax                                 #111.12
        cmpq      %rax, %rdx                                    #111.12
        jge       ..B4.76       # Prob 20%                      #111.12
..___tag_value__Z8time_ffti10yesno_type.320:                    #
                                # LOE rdx rcx r12
..B4.65:                        # Preds ..B4.64                 # Infreq
        movq      (%rcx), %rax                                  #111.12
        movq      $0, (%rax,%rdx,8)                             #111.12
        incl      16(%rcx)                                      #111.12
        movl      $-1, 12(%rcx)                                 #111.12
        jmp       ..B4.72       # Prob 100%                     #111.12
..___tag_value__Z8time_ffti10yesno_type.321:                    #
                                # LOE r12
..B4.66:                        # Preds ..B4.63                 # Infreq
        testl     %r13d, %r13d                                  #109.9
        jne       ..B4.72       # Prob 50%                      #109.9
..___tag_value__Z8time_ffti10yesno_type.322:                    #
                                # LOE r12 r15d
..B4.67:                        # Preds ..B4.66                 # Infreq
        xorl      %ebp, %ebp                                    #114.13
        movq      48(%rsp), %rax                                #114.21
        xorl      %ebx, %ebx                                    #
        testq     %rax, %rax                                    #114.21
        jle       ..B4.72       # Prob 10%                      #114.21
..___tag_value__Z8time_ffti10yesno_type.323:                    #
                                # LOE rbx rbp r12 r15d
..B4.69:                        # Preds ..B4.67 ..B4.71         # Infreq
        testl     %r15d, %r15d                                  #118.4
        lea       (%r12,%rbx), %rdi                             #
        cmovne    %r12, %rdi                                    #118.4
        rdtsc                                                   #116.8
        movq      (%rsp), %rsi                                  #118.4
        movl      %edx, 12(%rsp)                                #116.8
        movl      %eax, 8(%rsp)                                 #116.8
..___tag_value__Z8time_ffti10yesno_type.324:                    #118.4
        call      _Z5nrfwdPdm@PLT                               #118.4
..___tag_value__Z8time_ffti10yesno_type.326:                    #
                                # LOE rbx rbp r12 r15d
..B4.70:                        # Preds ..B4.69                 # Infreq
        rdtsc                                                   #122.24
        movq      stat_nr(%rip), %r9                            #123.4
        movl      8(%rsp), %esi                                 #122.20
        movl      12(%rsp), %edi                                #122.20
        movslq    16(%r9), %r8                                  #123.13
        movslq    8(%r9), %rcx                                  #123.13
        cmpq      %rcx, %r8                                     #123.13
        jge       ..B4.92       # Prob 20%                      #123.13
..___tag_value__Z8time_ffti10yesno_type.328:                    #
                                # LOE rbx rbp rsi r8 r9 r12 eax edx edi r15d
..B4.71:                        # Preds ..B4.70                 # Infreq
        subl      %edi, %edx                                    #122.24
        incq      %rbp                                          #114.28
        movl      %eax, %eax                                    #122.24
        cvtsi2sdq %rax, %xmm2                                   #122.24
        cvtsi2sdq %rsi, %xmm0                                   #122.24
        cvtsi2sdq %rdx, %xmm1                                   #122.24
        subsd     %xmm0, %xmm2                                  #122.24
        mulsd     .L_2il0floatpacket.674(%rip), %xmm1           #122.24
        movq      (%r9), %rcx                                   #123.13
        addsd     %xmm1, %xmm2                                  #122.24
        movsd     %xmm2, (%rcx,%r8,8)                           #123.13
        incl      16(%r9)                                       #123.13
        addq      40(%rsp), %rbx                                #114.28
        movl      $-1, 12(%r9)                                  #123.13
        cmpq      48(%rsp), %rbp                                #114.21
        jl        ..B4.69       # Prob 82%                      #114.21
..___tag_value__Z8time_ffti10yesno_type.329:                    #
                                # LOE rbx rbp r12 r15d
..B4.72:                        # Preds ..B4.71 ..B4.67 ..B4.66 ..B4.65 # Infreq
        movq      %r12, %rdi                                    #128.2
..___tag_value__Z8time_ffti10yesno_type.330:                    #128.2
        call      MKL_free@PLT                                  #128.2
..___tag_value__Z8time_ffti10yesno_type.332:                    #
                                # LOE
..B4.73:                        # Preds ..B4.72                 # Infreq
        lea       56(%rsp), %rdi                                #128.2
..___tag_value__Z8time_ffti10yesno_type.334:                    #128.2
        call      _ZN8fft_fftwD1Ev@PLT                          #128.2
..___tag_value__Z8time_ffti10yesno_type.336:                    #
                                # LOE
..B4.74:                        # Preds ..B4.73                 # Infreq
        lea       24(%rsp), %rdi                                #128.2
..___tag_value__Z8time_ffti10yesno_type.338:                    #128.2
        call      _ZN7fft_mklD1Ev@PLT                           #128.2
..___tag_value__Z8time_ffti10yesno_type.340:                    #
                                # LOE
..B4.75:                        # Preds ..B4.74                 # Infreq
        addq      $88, %rsp                                     #129.1
..___tag_value__Z8time_ffti10yesno_type.342:                    #
        popq      %rbp                                          #129.1
..___tag_value__Z8time_ffti10yesno_type.345:                    #
        popq      %rbx                                          #129.1
..___tag_value__Z8time_ffti10yesno_type.347:                    #
        popq      %r15                                          #129.1
..___tag_value__Z8time_ffti10yesno_type.349:                    #
        popq      %r14                                          #129.1
..___tag_value__Z8time_ffti10yesno_type.351:                    #
        popq      %r13                                          #129.1
..___tag_value__Z8time_ffti10yesno_type.353:                    #
        popq      %r12                                          #129.1
..___tag_value__Z8time_ffti10yesno_type.355:                    #
        ret                                                     #129.1
..___tag_value__Z8time_ffti10yesno_type.356:                    #
                                # LOE
..B4.76:                        # Preds ..B4.64                 # Infreq
        lea       .L_2__STRING.0(%rip), %rsi                    #111.12
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #111.12
..___tag_value__Z8time_ffti10yesno_type.364:                    #111.12
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #111.12
..___tag_value__Z8time_ffti10yesno_type.366:                    #
                                # LOE rax
..B4.77:                        # Preds ..B4.76                 # Infreq
        movq      %rax, %rdi                                    #111.12
        lea       .L_2__STRING.1(%rip), %rsi                    #111.12
..___tag_value__Z8time_ffti10yesno_type.368:                    #111.12
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #111.12
..___tag_value__Z8time_ffti10yesno_type.370:                    #
                                # LOE rax
..B4.78:                        # Preds ..B4.77                 # Infreq
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx #111.12
        movq      %rax, %rdi                                    #111.12
        movq      %rbx, %rsi                                    #111.12
..___tag_value__Z8time_ffti10yesno_type.372:                    #111.12
        call      _ZNSolsEPFRSoS_E@PLT                          #111.12
..___tag_value__Z8time_ffti10yesno_type.374:                    #
                                # LOE rax rbx
..B4.79:                        # Preds ..B4.78                 # Infreq
        movq      %rax, %rdi                                    #111.12
        lea       .L_2__STRING.2(%rip), %rsi                    #111.12
..___tag_value__Z8time_ffti10yesno_type.376:                    #111.12
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #111.12
..___tag_value__Z8time_ffti10yesno_type.378:                    #
                                # LOE rax rbx
..B4.80:                        # Preds ..B4.79                 # Infreq
        movq      %rax, %rdi                                    #111.12
        lea       .L_2__STRING.3(%rip), %rsi                    #111.12
..___tag_value__Z8time_ffti10yesno_type.380:                    #111.12
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #111.12
..___tag_value__Z8time_ffti10yesno_type.382:                    #
                                # LOE rax rbx
..B4.81:                        # Preds ..B4.80                 # Infreq
        movq      %rax, %rdi                                    #111.12
        movq      %rbx, %rsi                                    #111.12
..___tag_value__Z8time_ffti10yesno_type.384:                    #111.12
        call      _ZNSolsEPFRSoS_E@PLT                          #111.12
..___tag_value__Z8time_ffti10yesno_type.386:                    #
                                # LOE rax rbx
..B4.82:                        # Preds ..B4.81                 # Infreq
        movq      %rax, %rdi                                    #111.12
        lea       .L_2__STRING.4(%rip), %rsi                    #111.12
..___tag_value__Z8time_ffti10yesno_type.388:                    #111.12
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #111.12
..___tag_value__Z8time_ffti10yesno_type.390:                    #
                                # LOE rax rbx
..B4.83:                        # Preds ..B4.82                 # Infreq
        movq      %rax, %rdi                                    #111.12
        movl      $32, %esi                                     #111.12
..___tag_value__Z8time_ffti10yesno_type.392:                    #111.12
        call      _ZNSolsEi@PLT                                 #111.12
..___tag_value__Z8time_ffti10yesno_type.394:                    #
                                # LOE rax rbx
..B4.84:                        # Preds ..B4.83                 # Infreq
        movq      %rax, %rdi                                    #111.12
        movq      %rbx, %rsi                                    #111.12
..___tag_value__Z8time_ffti10yesno_type.396:                    #111.12
        call      _ZNSolsEPFRSoS_E@PLT                          #111.12
..___tag_value__Z8time_ffti10yesno_type.398:                    #
                                # LOE
..B4.85:                        # Preds ..B4.121 ..B4.111 ..B4.100 ..B4.84 # Infreq
        int       $5                                            #111.12
..___tag_value__Z8time_ffti10yesno_type.400:                    #
                                # LOE
..___tag_value__Z8time_ffti10yesno_type.209:
..B4.86:                        # Preds ..B4.100 ..B4.99 ..B4.98 ..B4.97 ..B4.96
                                #       ..B4.95 ..B4.94 ..B4.93 ..B4.92 ..B4.69
                                #       ..B4.72 ..B4.84 ..B4.83 ..B4.82 ..B4.81
                                #       ..B4.80 ..B4.79 ..B4.78 ..B4.77 ..B4.76
                                #       ..B4.111 ..B4.110 ..B4.109 ..B4.108 ..B4.107
                                #       ..B4.106 ..B4.105 ..B4.104 ..B4.103 ..B4.55
                                #       ..B4.121 ..B4.120 ..B4.119 ..B4.118 ..B4.117
                                #       ..B4.116 ..B4.115 ..B4.114 ..B4.113 # Infreq
        movq      %rax, (%rsp)                                  #93.16
..___tag_value__Z8time_ffti10yesno_type.401:                    #
                                # LOE
..B4.87:                        # Preds ..B4.86                 # Infreq
        lea       56(%rsp), %rdi                                #93.16
..___tag_value__Z8time_ffti10yesno_type.402:                    #93.16
        call      _ZN8fft_fftwD1Ev@PLT                          #93.16
..___tag_value__Z8time_ffti10yesno_type.404:                    #
                                # LOE
..B4.89:                        # Preds ..B4.87 ..B4.102        # Infreq
        lea       24(%rsp), %rdi                                #77.14
..___tag_value__Z8time_ffti10yesno_type.406:                    #77.14
        call      _ZN7fft_mklD1Ev@PLT                           #77.14
..___tag_value__Z8time_ffti10yesno_type.408:                    #
                                # LOE
..B4.90:                        # Preds ..B4.147 ..B4.148 ..B4.128 ..B4.129 ..B4.124
                                #       ..B4.125 ..B4.89        # Infreq
        xorl      %eax, %eax                                    #77.14
        movq      (%rsp), %rdi                                  #77.14
..___tag_value__Z8time_ffti10yesno_type.410:                    #77.14
        call      _Unwind_Resume@PLT                            #77.14
..___tag_value__Z8time_ffti10yesno_type.412:                    #
                                # LOE
..B4.92:                        # Preds ..B4.70                 # Infreq
        lea       .L_2__STRING.0(%rip), %rsi                    #123.13
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #123.13
..___tag_value__Z8time_ffti10yesno_type.414:                    #123.13
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #123.13
..___tag_value__Z8time_ffti10yesno_type.416:                    #
                                # LOE rax
..B4.93:                        # Preds ..B4.92                 # Infreq
        movq      %rax, %rdi                                    #123.13
        lea       .L_2__STRING.1(%rip), %rsi                    #123.13
..___tag_value__Z8time_ffti10yesno_type.418:                    #123.13
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #123.13
..___tag_value__Z8time_ffti10yesno_type.420:                    #
                                # LOE rax
..B4.94:                        # Preds ..B4.93                 # Infreq
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx #123.13
        movq      %rax, %rdi                                    #123.13
        movq      %rbx, %rsi                                    #123.13
..___tag_value__Z8time_ffti10yesno_type.422:                    #123.13
        call      _ZNSolsEPFRSoS_E@PLT                          #123.13
..___tag_value__Z8time_ffti10yesno_type.424:                    #
                                # LOE rax rbx
..B4.95:                        # Preds ..B4.94                 # Infreq
        movq      %rax, %rdi                                    #123.13
        lea       .L_2__STRING.2(%rip), %rsi                    #123.13
..___tag_value__Z8time_ffti10yesno_type.426:                    #123.13
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #123.13
..___tag_value__Z8time_ffti10yesno_type.428:                    #
                                # LOE rax rbx
..B4.96:                        # Preds ..B4.95                 # Infreq
        movq      %rax, %rdi                                    #123.13
        lea       .L_2__STRING.3(%rip), %rsi                    #123.13
..___tag_value__Z8time_ffti10yesno_type.430:                    #123.13
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #123.13
..___tag_value__Z8time_ffti10yesno_type.432:                    #
                                # LOE rax rbx
..B4.97:                        # Preds ..B4.96                 # Infreq
        movq      %rax, %rdi                                    #123.13
        movq      %rbx, %rsi                                    #123.13
..___tag_value__Z8time_ffti10yesno_type.434:                    #123.13
        call      _ZNSolsEPFRSoS_E@PLT                          #123.13
..___tag_value__Z8time_ffti10yesno_type.436:                    #
                                # LOE rax rbx
..B4.98:                        # Preds ..B4.97                 # Infreq
        movq      %rax, %rdi                                    #123.13
        lea       .L_2__STRING.4(%rip), %rsi                    #123.13
..___tag_value__Z8time_ffti10yesno_type.438:                    #123.13
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #123.13
..___tag_value__Z8time_ffti10yesno_type.440:                    #
                                # LOE rax rbx
..B4.99:                        # Preds ..B4.98                 # Infreq
        movq      %rax, %rdi                                    #123.13
        movl      $32, %esi                                     #123.13
..___tag_value__Z8time_ffti10yesno_type.442:                    #123.13
        call      _ZNSolsEi@PLT                                 #123.13
..___tag_value__Z8time_ffti10yesno_type.444:                    #
                                # LOE rax rbx
..B4.100:                       # Preds ..B4.99                 # Infreq
        movq      %rax, %rdi                                    #123.13
        movq      %rbx, %rsi                                    #123.13
..___tag_value__Z8time_ffti10yesno_type.446:                    #123.13
        call      _ZNSolsEPFRSoS_E@PLT                          #123.13
..___tag_value__Z8time_ffti10yesno_type.448:                    #
        jmp       ..B4.85       # Prob 100%                     #123.13
..___tag_value__Z8time_ffti10yesno_type.449:                    #
                                # LOE
..___tag_value__Z8time_ffti10yesno_type.208:
..B4.102:                       # Preds ..B4.73 ..B4.51 ..B4.158 ..B4.157 ..B4.156
                                #       ..B4.155 ..B4.154 ..B4.153 ..B4.152 ..B4.151
                                #       ..B4.150 ..B4.47        # Infreq
        movq      %rax, (%rsp)                                  #77.14
        jmp       ..B4.89       # Prob 100%                     #77.14
..___tag_value__Z8time_ffti10yesno_type.450:                    #
                                # LOE
..B4.103:                       # Preds ..B4.60                 # Infreq
        lea       .L_2__STRING.0(%rip), %rsi                    #103.14
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #103.14
..___tag_value__Z8time_ffti10yesno_type.451:                    #103.14
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #103.14
..___tag_value__Z8time_ffti10yesno_type.453:                    #
                                # LOE rax
..B4.104:                       # Preds ..B4.103                # Infreq
        movq      %rax, %rdi                                    #103.14
        lea       .L_2__STRING.1(%rip), %rsi                    #103.14
..___tag_value__Z8time_ffti10yesno_type.455:                    #103.14
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #103.14
..___tag_value__Z8time_ffti10yesno_type.457:                    #
                                # LOE rax
..B4.105:                       # Preds ..B4.104                # Infreq
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx #103.14
        movq      %rax, %rdi                                    #103.14
        movq      %rbx, %rsi                                    #103.14
..___tag_value__Z8time_ffti10yesno_type.459:                    #103.14
        call      _ZNSolsEPFRSoS_E@PLT                          #103.14
..___tag_value__Z8time_ffti10yesno_type.461:                    #
                                # LOE rax rbx
..B4.106:                       # Preds ..B4.105                # Infreq
        movq      %rax, %rdi                                    #103.14
        lea       .L_2__STRING.2(%rip), %rsi                    #103.14
..___tag_value__Z8time_ffti10yesno_type.463:                    #103.14
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #103.14
..___tag_value__Z8time_ffti10yesno_type.465:                    #
                                # LOE rax rbx
..B4.107:                       # Preds ..B4.106                # Infreq
        movq      %rax, %rdi                                    #103.14
        lea       .L_2__STRING.3(%rip), %rsi                    #103.14
..___tag_value__Z8time_ffti10yesno_type.467:                    #103.14
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #103.14
..___tag_value__Z8time_ffti10yesno_type.469:                    #
                                # LOE rax rbx
..B4.108:                       # Preds ..B4.107                # Infreq
        movq      %rax, %rdi                                    #103.14
        movq      %rbx, %rsi                                    #103.14
..___tag_value__Z8time_ffti10yesno_type.471:                    #103.14
        call      _ZNSolsEPFRSoS_E@PLT                          #103.14
..___tag_value__Z8time_ffti10yesno_type.473:                    #
                                # LOE rax rbx
..B4.109:                       # Preds ..B4.108                # Infreq
        movq      %rax, %rdi                                    #103.14
        lea       .L_2__STRING.4(%rip), %rsi                    #103.14
..___tag_value__Z8time_ffti10yesno_type.475:                    #103.14
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #103.14
..___tag_value__Z8time_ffti10yesno_type.477:                    #
                                # LOE rax rbx
..B4.110:                       # Preds ..B4.109                # Infreq
        movq      %rax, %rdi                                    #103.14
        movl      $32, %esi                                     #103.14
..___tag_value__Z8time_ffti10yesno_type.479:                    #103.14
        call      _ZNSolsEi@PLT                                 #103.14
..___tag_value__Z8time_ffti10yesno_type.481:                    #
                                # LOE rax rbx
..B4.111:                       # Preds ..B4.110                # Infreq
        movq      %rax, %rdi                                    #103.14
        movq      %rbx, %rsi                                    #103.14
..___tag_value__Z8time_ffti10yesno_type.483:                    #103.14
        call      _ZNSolsEPFRSoS_E@PLT                          #103.14
..___tag_value__Z8time_ffti10yesno_type.485:                    #
        jmp       ..B4.85       # Prob 100%                     #103.14
..___tag_value__Z8time_ffti10yesno_type.486:                    #
                                # LOE
..B4.113:                       # Preds ..B4.54                 # Infreq
        lea       .L_2__STRING.0(%rip), %rsi                    #98.8
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #98.8
..___tag_value__Z8time_ffti10yesno_type.487:                    #98.8
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #98.8
..___tag_value__Z8time_ffti10yesno_type.489:                    #
                                # LOE rax
..B4.114:                       # Preds ..B4.113                # Infreq
        movq      %rax, %rdi                                    #98.8
        lea       .L_2__STRING.11(%rip), %rsi                   #98.8
..___tag_value__Z8time_ffti10yesno_type.491:                    #98.8
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #98.8
..___tag_value__Z8time_ffti10yesno_type.493:                    #
                                # LOE rax
..B4.115:                       # Preds ..B4.114                # Infreq
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx #98.8
        movq      %rax, %rdi                                    #98.8
        movq      %rbx, %rsi                                    #98.8
..___tag_value__Z8time_ffti10yesno_type.495:                    #98.8
        call      _ZNSolsEPFRSoS_E@PLT                          #98.8
..___tag_value__Z8time_ffti10yesno_type.497:                    #
                                # LOE rax rbx
..B4.116:                       # Preds ..B4.115                # Infreq
        movq      %rax, %rdi                                    #98.8
        lea       .L_2__STRING.2(%rip), %rsi                    #98.8
..___tag_value__Z8time_ffti10yesno_type.499:                    #98.8
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #98.8
..___tag_value__Z8time_ffti10yesno_type.501:                    #
                                # LOE rax rbx
..B4.117:                       # Preds ..B4.116                # Infreq
        movq      %rax, %rdi                                    #98.8
        lea       .L_2__STRING.12(%rip), %rsi                   #98.8
..___tag_value__Z8time_ffti10yesno_type.503:                    #98.8
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #98.8
..___tag_value__Z8time_ffti10yesno_type.505:                    #
                                # LOE rax rbx
..B4.118:                       # Preds ..B4.117                # Infreq
        movq      %rax, %rdi                                    #98.8
        movq      %rbx, %rsi                                    #98.8
..___tag_value__Z8time_ffti10yesno_type.507:                    #98.8
        call      _ZNSolsEPFRSoS_E@PLT                          #98.8
..___tag_value__Z8time_ffti10yesno_type.509:                    #
                                # LOE rax rbx
..B4.119:                       # Preds ..B4.118                # Infreq
        movq      %rax, %rdi                                    #98.8
        lea       .L_2__STRING.4(%rip), %rsi                    #98.8
..___tag_value__Z8time_ffti10yesno_type.511:                    #98.8
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #98.8
..___tag_value__Z8time_ffti10yesno_type.513:                    #
                                # LOE rax rbx
..B4.120:                       # Preds ..B4.119                # Infreq
        movq      %rax, %rdi                                    #98.8
        movl      $20, %esi                                     #98.8
..___tag_value__Z8time_ffti10yesno_type.515:                    #98.8
        call      _ZNSolsEi@PLT                                 #98.8
..___tag_value__Z8time_ffti10yesno_type.517:                    #
                                # LOE rax rbx
..B4.121:                       # Preds ..B4.120                # Infreq
        movq      %rax, %rdi                                    #98.8
        movq      %rbx, %rsi                                    #98.8
..___tag_value__Z8time_ffti10yesno_type.519:                    #98.8
        call      _ZNSolsEPFRSoS_E@PLT                          #98.8
..___tag_value__Z8time_ffti10yesno_type.521:                    #
        jmp       ..B4.85       # Prob 100%                     #98.8
..___tag_value__Z8time_ffti10yesno_type.522:                    #
                                # LOE
..___tag_value__Z8time_ffti10yesno_type.206:
..B4.123:                       # Preds ..B4.21 ..B4.19         # Infreq
        movq      %rax, (%rsp)                                  #49.2
..___tag_value__Z8time_ffti10yesno_type.523:                    #
                                # LOE
..B4.124:                       # Preds ..B4.123                # Infreq
        cmpl      $0, 16(%rsp)                                  #49.2
        je        ..B4.90       # Prob 78%                      #49.2
..___tag_value__Z8time_ffti10yesno_type.524:                    #
                                # LOE
..B4.125:                       # Preds ..B4.124                # Infreq
        movq      8(%rsp), %rdi                                 #49.2
        call      _ZdlPv@PLT                                    #49.2
        jmp       ..B4.90       # Prob 100%                     #49.2
..___tag_value__Z8time_ffti10yesno_type.525:                    #
                                # LOE
..___tag_value__Z8time_ffti10yesno_type.207:
..B4.127:                       # Preds ..B4.30 ..B4.28         # Infreq
        movq      %rax, (%rsp)                                  #53.2
..___tag_value__Z8time_ffti10yesno_type.526:                    #
                                # LOE
..B4.128:                       # Preds ..B4.127                # Infreq
        cmpl      $0, 16(%rsp)                                  #53.2
        je        ..B4.90       # Prob 78%                      #53.2
..___tag_value__Z8time_ffti10yesno_type.527:                    #
                                # LOE
..B4.129:                       # Preds ..B4.128                # Infreq
        movq      8(%rsp), %rdi                                 #53.2
        call      _ZdlPv@PLT                                    #53.2
        jmp       ..B4.90       # Prob 100%                     #53.2
..___tag_value__Z8time_ffti10yesno_type.528:                    #
                                # LOE
..B4.132:                       # Preds ..B4.39 ..B4.137        # Infreq
        cmpl      %r14d, %eax                                   #62.4
        jae       ..B4.135      # Prob 10%                      #62.4
..___tag_value__Z8time_ffti10yesno_type.529:                    #
                                # LOE rcx rbx r12 eax edx r13d r14d r15d xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B4.133:                       # Preds ..B4.132                # Infreq
        movq      %rbx, %rbp                                    #64.26
        imulq     %rbx, %rbp                                    #64.26
        cvtsi2sdq %rbx, %xmm12                                  #63.23
        cvtsi2sdq %rbp, %xmm11                                  #64.26
        addsd     %xmm6, %xmm12                                 #63.23
        addsd     %xmm6, %xmm11                                 #64.26
..___tag_value__Z8time_ffti10yesno_type.530:                    #
                                # LOE rcx rbx r12 eax edx r13d r14d r15d xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm11 xmm12
..B4.134:                       # Preds ..B4.134 ..B4.133       # Infreq
        cvtsi2sd  %eax, %xmm2                                   #63.25
        movaps    %xmm12, %xmm0                                 #63.25
        movaps    %xmm4, %xmm1                                  #63.25
        movaps    %xmm3, %xmm10                                 #64.28
        lea       (%rax,%rax), %ebp                             #63.5
        movslq    %ebp, %rbp                                    #63.5
        incl      %eax                                          #62.4
        cmpl      %r14d, %eax                                   #62.4
        addsd     %xmm2, %xmm0                                  #63.25
        addsd     %xmm11, %xmm2                                 #64.28
        divsd     %xmm0, %xmm1                                  #63.25
        divsd     %xmm2, %xmm10                                 #64.28
        movsd     %xmm1, (%rcx,%rbp,8)                          #61.14
        movsd     %xmm10, 8(%rcx,%rbp,8)                        #61.14
        jb        ..B4.134      # Prob 82%                      #62.4
..___tag_value__Z8time_ffti10yesno_type.531:                    #
                                # LOE rcx rbx r12 eax edx r13d r14d r15d xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm11 xmm12
..B4.135:                       # Preds ..B4.132 ..B4.134       # Infreq
        incq      %rbx                                          #60.3
        addq      40(%rsp), %rcx                                #60.3
        cmpq      48(%rsp), %rbx                                #60.3
        jb        ..B4.37       # Prob 82%                      #60.3
        jmp       ..B4.44       # Prob 100%                     #60.3
..___tag_value__Z8time_ffti10yesno_type.532:                    #
                                # LOE rcx rbx r12 edx r13d r14d r15d xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B4.137:                       # Preds ..B4.37                 # Infreq
        xorl      %eax, %eax                                    #62.4
        jmp       ..B4.132      # Prob 100%                     #62.4
..___tag_value__Z8time_ffti10yesno_type.533:                    #
                                # LOE rcx rbx r12 eax edx r13d r14d r15d xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
..B4.141:                       # Preds ..B4.43 ..B4.145        # Infreq
        cmpl      %r14d, %ebx                                   #69.3
        jae       ..B4.44       # Prob 10%                      #69.3
..___tag_value__Z8time_ffti10yesno_type.534:                    #
                                # LOE r12 ebx r13d r14d r15d
..B4.142:                       # Preds ..B4.141                # Infreq
        xorl      %edx, %edx                                    #70.24
..___tag_value__Z8time_ffti10yesno_type.535:                    #
                                # LOE rdx r12 ebx r13d r14d r15d
..B4.143:                       # Preds ..B4.143 ..B4.142       # Infreq
        lea       (%rbx,%rbx), %eax                             #70.13
        incl      %ebx                                          #69.3
        movslq    %eax, %rax                                    #70.13
        cmpl      %r14d, %ebx                                   #69.3
        movq      %rdx, 8(%r12,%rax,8)                          #37.28
        movq      %rdx, (%r12,%rax,8)                           #37.28
        jb        ..B4.143      # Prob 82%                      #69.3
        jmp       ..B4.44       # Prob 100%                     #69.3
..___tag_value__Z8time_ffti10yesno_type.536:                    #
                                # LOE rdx r12 ebx r13d r14d r15d
..B4.145:                       # Preds ..B4.41                 # Infreq
        xorl      %ebx, %ebx                                    #69.3
        jmp       ..B4.141      # Prob 100%                     #69.3
..___tag_value__Z8time_ffti10yesno_type.537:                    #
                                # LOE r12 ebx r13d r14d r15d
..___tag_value__Z8time_ffti10yesno_type.205:
..B4.146:                       # Preds ..B4.12 ..B4.10         # Infreq
        movq      %rax, (%rsp)                                  #45.2
..___tag_value__Z8time_ffti10yesno_type.538:                    #
                                # LOE
..B4.147:                       # Preds ..B4.146                # Infreq
        cmpl      $0, 16(%rsp)                                  #45.2
        je        ..B4.90       # Prob 78%                      #45.2
..___tag_value__Z8time_ffti10yesno_type.539:                    #
                                # LOE
..B4.148:                       # Preds ..B4.147                # Infreq
        movq      8(%rsp), %rdi                                 #45.2
        call      _ZdlPv@PLT                                    #45.2
        jmp       ..B4.90       # Prob 100%                     #45.2
..___tag_value__Z8time_ffti10yesno_type.540:                    #
                                # LOE
..B4.150:                       # Preds ..B4.48                 # Infreq
        lea       .L_2__STRING.0(%rip), %rsi                    #87.13
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi                #87.13
..___tag_value__Z8time_ffti10yesno_type.541:                    #87.13
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #87.13
..___tag_value__Z8time_ffti10yesno_type.543:                    #
                                # LOE rax
..B4.151:                       # Preds ..B4.150                # Infreq
        movq      %rax, %rdi                                    #87.13
        lea       .L_2__STRING.1(%rip), %rsi                    #87.13
..___tag_value__Z8time_ffti10yesno_type.545:                    #87.13
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #87.13
..___tag_value__Z8time_ffti10yesno_type.547:                    #
                                # LOE rax
..B4.152:                       # Preds ..B4.151                # Infreq
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx #87.13
        movq      %rax, %rdi                                    #87.13
        movq      %rbx, %rsi                                    #87.13
..___tag_value__Z8time_ffti10yesno_type.549:                    #87.13
        call      _ZNSolsEPFRSoS_E@PLT                          #87.13
..___tag_value__Z8time_ffti10yesno_type.551:                    #
                                # LOE rax rbx
..B4.153:                       # Preds ..B4.152                # Infreq
        movq      %rax, %rdi                                    #87.13
        lea       .L_2__STRING.2(%rip), %rsi                    #87.13
..___tag_value__Z8time_ffti10yesno_type.553:                    #87.13
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #87.13
..___tag_value__Z8time_ffti10yesno_type.555:                    #
                                # LOE rax rbx
..B4.154:                       # Preds ..B4.153                # Infreq
        movq      %rax, %rdi                                    #87.13
        lea       .L_2__STRING.3(%rip), %rsi                    #87.13
..___tag_value__Z8time_ffti10yesno_type.557:                    #87.13
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #87.13
..___tag_value__Z8time_ffti10yesno_type.559:                    #
                                # LOE rax rbx
..B4.155:                       # Preds ..B4.154                # Infreq
        movq      %rax, %rdi                                    #87.13
        movq      %rbx, %rsi                                    #87.13
..___tag_value__Z8time_ffti10yesno_type.561:                    #87.13
        call      _ZNSolsEPFRSoS_E@PLT                          #87.13
..___tag_value__Z8time_ffti10yesno_type.563:                    #
                                # LOE rax rbx
..B4.156:                       # Preds ..B4.155                # Infreq
        movq      %rax, %rdi                                    #87.13
        lea       .L_2__STRING.4(%rip), %rsi                    #87.13
..___tag_value__Z8time_ffti10yesno_type.565:                    #87.13
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT #87.13
..___tag_value__Z8time_ffti10yesno_type.567:                    #
                                # LOE rax rbx
..B4.157:                       # Preds ..B4.156                # Infreq
        movq      %rax, %rdi                                    #87.13
        movl      $32, %esi                                     #87.13
..___tag_value__Z8time_ffti10yesno_type.569:                    #87.13
        call      _ZNSolsEi@PLT                                 #87.13
..___tag_value__Z8time_ffti10yesno_type.571:                    #
                                # LOE rax rbx
..B4.158:                       # Preds ..B4.157                # Infreq
        movq      %rax, %rdi                                    #87.13
        movq      %rbx, %rsi                                    #87.13
..___tag_value__Z8time_ffti10yesno_type.573:                    #87.13
        call      _ZNSolsEPFRSoS_E@PLT                          #87.13
..___tag_value__Z8time_ffti10yesno_type.575:                    #
                                # LOE
..B4.159:                       # Preds ..B4.158                # Infreq
        int       $5                                            #87.13
        .align    16,0x90
..___tag_value__Z8time_ffti10yesno_type.577:                    #
                                # LOE
# mark_end;
	.type	_Z8time_ffti10yesno_type,@function
	.size	_Z8time_ffti10yesno_type,.-_Z8time_ffti10yesno_type
	.section .gcc_except_table, "a"
	.align 4
_Z8time_ffti10yesno_type$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.581 - ..___tag_value__Z8time_ffti10yesno_type.580
..___tag_value__Z8time_ffti10yesno_type.580:
	.byte	1
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.579 - ..___tag_value__Z8time_ffti10yesno_type.578
..___tag_value__Z8time_ffti10yesno_type.578:
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.230 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.232 - ..___tag_value__Z8time_ffti10yesno_type.230
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.239 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.247 - ..___tag_value__Z8time_ffti10yesno_type.239
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.205 - ..___tag_value__Z8time_ffti10yesno_type.211
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.255 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.263 - ..___tag_value__Z8time_ffti10yesno_type.255
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.206 - ..___tag_value__Z8time_ffti10yesno_type.211
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.271 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.279 - ..___tag_value__Z8time_ffti10yesno_type.271
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.207 - ..___tag_value__Z8time_ffti10yesno_type.211
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.294 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.296 - ..___tag_value__Z8time_ffti10yesno_type.294
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.299 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.307 - ..___tag_value__Z8time_ffti10yesno_type.299
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.208 - ..___tag_value__Z8time_ffti10yesno_type.211
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.311 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.332 - ..___tag_value__Z8time_ffti10yesno_type.311
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.209 - ..___tag_value__Z8time_ffti10yesno_type.211
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.334 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.336 - ..___tag_value__Z8time_ffti10yesno_type.334
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.208 - ..___tag_value__Z8time_ffti10yesno_type.211
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.338 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.340 - ..___tag_value__Z8time_ffti10yesno_type.338
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.364 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.398 - ..___tag_value__Z8time_ffti10yesno_type.364
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.209 - ..___tag_value__Z8time_ffti10yesno_type.211
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.410 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.412 - ..___tag_value__Z8time_ffti10yesno_type.410
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.414 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.521 - ..___tag_value__Z8time_ffti10yesno_type.414
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.209 - ..___tag_value__Z8time_ffti10yesno_type.211
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.541 - ..___tag_value__Z8time_ffti10yesno_type.211
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.575 - ..___tag_value__Z8time_ffti10yesno_type.541
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.208 - ..___tag_value__Z8time_ffti10yesno_type.211
	.byte	0
..___tag_value__Z8time_ffti10yesno_type.579:
	.long	0
..___tag_value__Z8time_ffti10yesno_type.581:
	.data
# -- End  _Z8time_ffti10yesno_type
	.text
# -- Begin  __sti__$E
# mark_begin;
       .align    16,0x90
__sti__$E:
..B5.1:                         # Preds ..B5.0
..___tag_value___sti__$E.582:                                   #
        pushq     %rsi                                          #
..___tag_value___sti__$E.584:                                   #
        lea       _ZSt8__ioinit(%rip), %rdi                     #72.25
..___tag_value___sti__$E.585:                                   #72.25
        call      _ZNSt8ios_base4InitC1Ev@PLT                   #72.25
..___tag_value___sti__$E.586:                                   #
                                # LOE rbx rbp r12 r13 r14 r15
..B5.2:                         # Preds ..B5.1
        lea       _ZSt8__ioinit(%rip), %rsi                     #72.25
        lea       __dso_handle(%rip), %rdx                      #72.25
        xorl      %eax, %eax                                    #72.25
        movq      _ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi  #72.25
..___tag_value___sti__$E.587:                                   #72.25
        call      __cxa_atexit@PLT                              #72.25
..___tag_value___sti__$E.588:                                   #
                                # LOE rbx rbp r12 r13 r14 r15
..B5.3:                         # Preds ..B5.2
        popq      %rcx                                          #72.25
..___tag_value___sti__$E.589:                                   #
        ret                                                     #72.25
        .align    16,0x90
..___tag_value___sti__$E.590:                                   #
                                # LOE
# mark_end;
	.type	__sti__$E,@function
	.size	__sti__$E,.-__sti__$E
	.data
# -- End  __sti__$E
	.bss
	.align 8
	.align 8
stat_mkl:
	.type	stat_mkl,@object
	.size	stat_mkl,8
	.space 8	# pad
	.align 8
stat_fftw:
	.type	stat_fftw,@object
	.size	stat_fftw,8
	.space 8	# pad
	.align 8
stat_nr:
	.type	stat_nr,@object
	.size	stat_nr,8
	.space 8	# pad
	.align 1
_ZSt8__ioinit:
	.type	_ZSt8__ioinit,@object
	.size	_ZSt8__ioinit,1
	.space 1	# pad
	.section .rodata, "a"
	.align 16
	.align 16
.L_2il0floatpacket.669:
	.long	0x00000000,0x401c0000,0x00000000,0x401c0000
	.type	.L_2il0floatpacket.669,@object
	.size	.L_2il0floatpacket.669,16
	.align 16
.L_2il0floatpacket.671:
	.long	0x00000000,0x40534000,0x00000000,0x40534000
	.type	.L_2il0floatpacket.671,@object
	.size	.L_2il0floatpacket.671,16
	.align 8
.L_2il0floatpacket.464:
	.long	0x00000000,0x40000000
	.type	.L_2il0floatpacket.464,@object
	.size	.L_2il0floatpacket.464,8
	.align 8
.L_2il0floatpacket.670:
	.long	0x00000000,0x40200000
	.type	.L_2il0floatpacket.670,@object
	.size	.L_2il0floatpacket.670,8
	.align 8
.L_2il0floatpacket.672:
	.long	0x00000000,0x401c0000
	.type	.L_2il0floatpacket.672,@object
	.size	.L_2il0floatpacket.672,8
	.align 8
.L_2il0floatpacket.673:
	.long	0x00000000,0x40534000
	.type	.L_2il0floatpacket.673,@object
	.size	.L_2il0floatpacket.673,8
	.align 8
.L_2il0floatpacket.674:
	.long	0x00000000,0x41f00000
	.type	.L_2il0floatpacket.674,@object
	.size	.L_2il0floatpacket.674,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.24:
	.byte	68
	.byte	66
	.byte	71
	.byte	47
	.byte	0
	.type	.L_2__STRING.24,@object
	.size	.L_2__STRING.24,5
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.26:
	.byte	68
	.byte	66
	.byte	71
	.byte	47
	.byte	116
	.byte	105
	.byte	109
	.byte	101
	.byte	95
	.byte	102
	.byte	102
	.byte	116
	.byte	95
	.byte	102
	.byte	119
	.byte	100
	.byte	46
	.byte	100
	.byte	97
	.byte	116
	.byte	0
	.type	.L_2__STRING.26,@object
	.size	.L_2__STRING.26,21
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.25:
	.byte	40
	.byte	102
	.byte	119
	.byte	100
	.byte	32
	.byte	102
	.byte	102
	.byte	116
	.byte	41
	.byte	0
	.type	.L_2__STRING.25,@object
	.size	.L_2__STRING.25,10
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.byte	65
	.byte	83
	.byte	83
	.byte	82
	.byte	84
	.byte	32
	.byte	70
	.byte	65
	.byte	73
	.byte	76
	.byte	69
	.byte	68
	.byte	58
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.5:
	.byte	110
	.byte	117
	.byte	109
	.byte	105
	.byte	116
	.byte	101
	.byte	109
	.byte	115
	.byte	32
	.byte	62
	.byte	32
	.byte	48
	.byte	0
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,13
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.byte	102
	.byte	105
	.byte	108
	.byte	101
	.byte	58
	.byte	32
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,7
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.byte	46
	.byte	46
	.byte	47
	.byte	117
	.byte	116
	.byte	105
	.byte	108
	.byte	115
	.byte	47
	.byte	83
	.byte	116
	.byte	97
	.byte	116
	.byte	86
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	46
	.byte	104
	.byte	104
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,23
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.4:
	.byte	108
	.byte	105
	.byte	110
	.byte	101
	.byte	58
	.byte	32
	.byte	0
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,7
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.13:
	.byte	51
	.byte	50
	.byte	0
	.type	.L_2__STRING.13,@object
	.size	.L_2__STRING.13,3
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.14:
	.byte	54
	.byte	52
	.byte	0
	.type	.L_2__STRING.14,@object
	.size	.L_2__STRING.14,3
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.15:
	.byte	56
	.byte	48
	.byte	0
	.type	.L_2__STRING.15,@object
	.size	.L_2__STRING.15,3
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.16:
	.byte	56
	.byte	42
	.byte	51
	.byte	42
	.byte	55
	.byte	0
	.type	.L_2__STRING.16,@object
	.size	.L_2__STRING.16,6
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.17:
	.byte	49
	.byte	57
	.byte	50
	.byte	0
	.type	.L_2__STRING.17,@object
	.size	.L_2__STRING.17,4
	.align 4
.L_2__STRING.18:
	.byte	49
	.byte	48
	.byte	50
	.byte	52
	.byte	0
	.type	.L_2__STRING.18,@object
	.size	.L_2__STRING.18,5
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.19:
	.byte	49
	.byte	48
	.byte	50
	.byte	52
	.byte	42
	.byte	49
	.byte	50
	.byte	56
	.byte	0
	.type	.L_2__STRING.19,@object
	.size	.L_2__STRING.19,9
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.20:
	.byte	49
	.byte	48
	.byte	50
	.byte	52
	.byte	42
	.byte	49
	.byte	48
	.byte	50
	.byte	52
	.byte	0
	.type	.L_2__STRING.20,@object
	.size	.L_2__STRING.20,10
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.21:
	.byte	109
	.byte	107
	.byte	108
	.byte	0
	.type	.L_2__STRING.21,@object
	.size	.L_2__STRING.21,4
	.align 4
.L_2__STRING.22:
	.byte	102
	.byte	102
	.byte	116
	.byte	119
	.byte	0
	.type	.L_2__STRING.22,@object
	.size	.L_2__STRING.22,5
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.23:
	.byte	110
	.byte	32
	.byte	114
	.byte	101
	.byte	99
	.byte	105
	.byte	112
	.byte	101
	.byte	115
	.byte	0
	.type	.L_2__STRING.23,@object
	.size	.L_2__STRING.23,10
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.byte	110
	.byte	117
	.byte	109
	.byte	105
	.byte	116
	.byte	101
	.byte	109
	.byte	115
	.byte	32
	.byte	60
	.byte	32
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,16
	.align 4
.L_2__STRING.11:
	.byte	40
	.byte	108
	.byte	111
	.byte	110
	.byte	103
	.byte	41
	.byte	102
	.byte	37
	.byte	49
	.byte	54
	.byte	32
	.byte	61
	.byte	61
	.byte	32
	.byte	48
	.byte	0
	.type	.L_2__STRING.11,@object
	.size	.L_2__STRING.11,16
	.align 4
.L_2__STRING.12:
	.byte	102
	.byte	102
	.byte	116
	.byte	95
	.byte	102
	.byte	102
	.byte	116
	.byte	119
	.byte	46
	.byte	104
	.byte	104
	.byte	0
	.type	.L_2__STRING.12,@object
	.size	.L_2__STRING.12,12
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 4
.L_2__STRING.27:
	.byte	119
	.byte	105
	.byte	116
	.byte	104
	.byte	32
	.byte	99
	.byte	97
	.byte	99
	.byte	104
	.byte	101
	.byte	32
	.byte	101
	.byte	118
	.byte	105
	.byte	99
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	32
	.byte	40
	.byte	110
	.byte	109
	.byte	108
	.byte	122
	.byte	32
	.byte	98
	.byte	121
	.byte	32
	.byte	110
	.byte	42
	.byte	108
	.byte	103
	.byte	50
	.byte	110
	.byte	41
	.byte	32
	.byte	37
	.byte	115
	.byte	0
	.type	.L_2__STRING.27,@object
	.size	.L_2__STRING.27,40
	.align 4
.L_2__STRING.28:
	.byte	119
	.byte	105
	.byte	116
	.byte	104
	.byte	111
	.byte	117
	.byte	116
	.byte	32
	.byte	99
	.byte	97
	.byte	99
	.byte	104
	.byte	101
	.byte	32
	.byte	101
	.byte	118
	.byte	105
	.byte	99
	.byte	116
	.byte	105
	.byte	111
	.byte	110
	.byte	32
	.byte	40
	.byte	110
	.byte	109
	.byte	108
	.byte	122
	.byte	32
	.byte	98
	.byte	121
	.byte	32
	.byte	110
	.byte	42
	.byte	108
	.byte	103
	.byte	50
	.byte	110
	.byte	41
	.byte	32
	.byte	37
	.byte	115
	.byte	0
	.type	.L_2__STRING.28,@object
	.size	.L_2__STRING.28,43
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
	.4byte 0x0000001c
	.8byte 0x52507a0100000000
	.4byte 0x10780100
	.2byte 0x9b06
	.4byte DW.ref.__gxx_personality_v0-.
	.8byte 0x0000019008070c1b
	.2byte 0x0000
	.4byte 0x00000094
	.4byte 0x00000044
	.4byte ..___tag_value_main.3-.
	.4byte ..___tag_value_main.75-..___tag_value_main.3
	.byte 0x04
	.4byte main$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value_main.5-..___tag_value_main.3
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.6-..___tag_value_main.5
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.8-..___tag_value_main.6
	.8byte 0xff800d1c380e0c10
	.8byte 0xfffffff80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.9-..___tag_value_main.8
	.8byte 0xff800d1c380e0d10
	.8byte 0xfffffff00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.57-..___tag_value_main.9
	.2byte 0x04cd
	.4byte ..___tag_value_main.59-..___tag_value_main.57
	.2byte 0x04cc
	.4byte ..___tag_value_main.60-..___tag_value_main.59
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.62-..___tag_value_main.60
	.8byte 0x0e0c10028610060c
	.8byte 0x1affffff800d1c38
	.8byte 0x0d1022fffffff80d
	.8byte 0xffffff800d1c380e
	.8byte 0x0022fffffff00d1a
	.4byte 0x00000000
	.4byte 0x0000009c
	.4byte 0x000000bc
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.80-.
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.173-..___tag_value__Z10make_table10yesno_typePKc.80
	.2byte 0x0400
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.82-..___tag_value__Z10make_table10yesno_typePKc.80
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.84-..___tag_value__Z10make_table10yesno_typePKc.82
	.4byte 0x180e038d
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.86-..___tag_value__Z10make_table10yesno_typePKc.84
	.4byte 0x200e048e
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.88-..___tag_value__Z10make_table10yesno_typePKc.86
	.4byte 0x280e058f
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.90-..___tag_value__Z10make_table10yesno_typePKc.88
	.4byte 0x300e0683
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.92-..___tag_value__Z10make_table10yesno_typePKc.90
	.4byte 0x380e0786
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.94-..___tag_value__Z10make_table10yesno_typePKc.92
	.4byte 0x0403800e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.103-..___tag_value__Z10make_table10yesno_typePKc.94
	.4byte 0x04c6380e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.105-..___tag_value__Z10make_table10yesno_typePKc.103
	.4byte 0x04c3300e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.107-..___tag_value__Z10make_table10yesno_typePKc.105
	.4byte 0x04cf280e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.109-..___tag_value__Z10make_table10yesno_typePKc.107
	.4byte 0x04ce200e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.111-..___tag_value__Z10make_table10yesno_typePKc.109
	.4byte 0x04cd180e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.113-..___tag_value__Z10make_table10yesno_typePKc.111
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.115-..___tag_value__Z10make_table10yesno_typePKc.113
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.116-..___tag_value__Z10make_table10yesno_typePKc.115
	.8byte 0x8c0786068303800e
	.8byte 0x00058f048e038d02
	.4byte 0x00000000
	.byte 0x00
	.4byte 0x0000008c
	.4byte 0x0000015c
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.174-.
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.204-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.174
	.2byte 0x0400
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.176-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.174
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.178-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.176
	.4byte 0x180e038d
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.180-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.178
	.2byte 0x200e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.181-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.180
	.2byte 0x048e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.184-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.181
	.2byte 0x04ce
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.185-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.184
	.4byte 0x04cd180e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.187-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.185
	.4byte 0x04cc100e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.189-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.187
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.190-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.189
	.8byte 0x048e038d028c200e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.194-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.190
	.2byte 0x04ce
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.195-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.194
	.2byte 0x048e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.196-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.195
	.4byte 0x04cd180e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.198-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.196
	.4byte 0x04cc100e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.200-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.198
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.201-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.200
	.8byte 0x0000038d028c200e
	.4byte 0x00000000
	.4byte 0x0000009c
	.4byte 0x0000020c
	.4byte ..___tag_value__Z8time_ffti10yesno_type.211-.
	.4byte ..___tag_value__Z8time_ffti10yesno_type.577-..___tag_value__Z8time_ffti10yesno_type.211
	.byte 0x04
	.4byte _Z8time_ffti10yesno_type$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.213-..___tag_value__Z8time_ffti10yesno_type.211
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.215-..___tag_value__Z8time_ffti10yesno_type.213
	.4byte 0x180e038d
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.217-..___tag_value__Z8time_ffti10yesno_type.215
	.4byte 0x200e048e
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.219-..___tag_value__Z8time_ffti10yesno_type.217
	.4byte 0x280e058f
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.221-..___tag_value__Z8time_ffti10yesno_type.219
	.4byte 0x300e0683
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.223-..___tag_value__Z8time_ffti10yesno_type.221
	.4byte 0x380e0786
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.225-..___tag_value__Z8time_ffti10yesno_type.223
	.4byte 0x0401900e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.342-..___tag_value__Z8time_ffti10yesno_type.225
	.4byte 0x04c6380e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.345-..___tag_value__Z8time_ffti10yesno_type.342
	.4byte 0x04c3300e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.347-..___tag_value__Z8time_ffti10yesno_type.345
	.4byte 0x04cf280e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.349-..___tag_value__Z8time_ffti10yesno_type.347
	.4byte 0x04ce200e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.351-..___tag_value__Z8time_ffti10yesno_type.349
	.4byte 0x04cd180e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.353-..___tag_value__Z8time_ffti10yesno_type.351
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.355-..___tag_value__Z8time_ffti10yesno_type.353
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.356-..___tag_value__Z8time_ffti10yesno_type.355
	.8byte 0x8c0786068301900e
	.8byte 0x00058f048e038d02
	.byte 0x00
	.4byte 0x0000001c
	.4byte 0x0000028c
	.4byte ..___tag_value___sti__$E.582-.
	.4byte ..___tag_value___sti__$E.590-..___tag_value___sti__$E.582
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.584-..___tag_value___sti__$E.582
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.589-..___tag_value___sti__$E.584
	.2byte 0x080e
	.byte 0x00
// -- Begin DWARF2 SEGMENT .gnu.linkonce.d.DW.ref.__gxx_personality_v0
	.section .gnu.linkonce.d.DW.ref.__gxx_personality_v0,"a",@progbits
	.weak DW.ref.__gxx_personality_v0
	.align 1
.hidden DW.ref.__gxx_personality_v0
DW.ref.__gxx_personality_v0:
	.8byte __gxx_personality_v0
# End
