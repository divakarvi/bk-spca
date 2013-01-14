# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-I/usr/caen/intel-12.1/mkl/include -O3 -prec-div -no-ftz -fno-inline-functions -DNDEBUG -restrict -S";
	.file "latency4n.cpp"
	.text
..TXTST0:
# -- Begin  main
# mark_begin;
..___tag_value_main.3:                                         #
        .align    16,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0
..___tag_value_main.4:                                          #58.11
        pushq     %rbp                                          #58.11
..___tag_value_main.6:                                          #
        movq      %rsp, %rbp                                    #58.11
..___tag_value_main.7:                                          #
        andq      $-128, %rsp                                   #58.11
        pushq     %r12                                          #58.11
..___tag_value_main.9:                                          #
        pushq     %r13                                          #58.11
..___tag_value_main.10:                                         #
        pushq     %r15                                          #58.11
..___tag_value_main.11:                                         #
        pushq     %rbx                                          #58.11
..___tag_value_main.12:                                         #
        subq      $736, %rsp                                    #58.11
        xorl      %edi, %edi                                    #58.11
..___tag_value_main.13:                                         #58.11
        call      __intel_new_proc_init                         #58.11
..___tag_value_main.15:                                         #
                                # LOE r14
..B1.46:                        # Preds ..B1.1
        movq      nlist.17997.0.0.47(%rip), %rax                #59.15
        movq      %rax, 528(%rsp)                               #59.15
        movq      8+nlist.17997.0.0.47(%rip), %rdx              #59.15
        movq      %rdx, 536(%rsp)                               #59.15
        movq      16+nlist.17997.0.0.47(%rip), %rcx             #59.15
        movq      %rcx, 544(%rsp)                               #59.15
        movq      24+nlist.17997.0.0.47(%rip), %rbx             #59.15
        movq      %rbx, 552(%rsp)                               #59.15
        movq      32+nlist.17997.0.0.47(%rip), %rsi             #59.15
        movq      %rsi, 560(%rsp)                               #59.15
        movq      40+nlist.17997.0.0.47(%rip), %rdi             #59.15
        movq      %rdi, 568(%rsp)                               #59.15
..___tag_value_main.17:                                         #
                                # LOE r14
..B1.2:                         # Preds ..B1.46
        movl      $.L_2__STRING.5, %esi                         #65.18
        lea       8(%rsp), %rdi                                 #65.18
        movl      $48, %edx                                     #65.18
..___tag_value_main.18:                                         #65.18
        call      _ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode #65.18
..___tag_value_main.20:                                         #
                                # LOE r14
..B1.3:                         # Preds ..B1.2
        xorl      %r13d, %r13d                                  #67.12
..___tag_value_main.22:                                         #
                                # LOE r13 r14
..B1.4:                         # Preds ..B1.19 ..B1.3
        movl      528(%rsp,%r13,4), %r12d                       #68.13
        testl     %r12d, %r12d                                  #70.12
        jl        ..B1.32       # Prob 20%                      #70.12
..___tag_value_main.23:                                         #
                                # LOE r13 r14 r12d
..B1.5:                         # Preds ..B1.4
        movl      $5, %eax                                      #73.7
        movl      $100, %r15d                                   #73.7
        cmpl      $1000, %r12d                                  #73.7
        lea       8(%rsp), %rdi                                 #74.10
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #74.10
        cmovg     %eax, %r15d                                   #73.7
..___tag_value_main.24:                                         #74.10
        call      _ZNSolsEPFRSoS_E                              #74.10
..___tag_value_main.26:                                         #
                                # LOE rax r13 r14 r12d r15d
..B1.6:                         # Preds ..B1.5
        movq      %rax, %rdi                                    #74.16
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #74.16
..___tag_value_main.28:                                         #74.16
        call      _ZNSolsEPFRSoS_E                              #74.16
..___tag_value_main.30:                                         #
                                # LOE rax r13 r14 r12d r15d
..B1.7:                         # Preds ..B1.6
        movq      %rax, %rdi                                    #74.22
        lea       (,%r12,4), %esi                               #74.22
..___tag_value_main.32:                                         #74.22
        call      _ZNSolsEi                                     #74.22
..___tag_value_main.34:                                         #
                                # LOE rax r13 r14 r12d r15d
..B1.8:                         # Preds ..B1.7
        movq      %rax, %rdi                                    #74.27
        movl      $.L_2__STRING.6, %esi                         #74.27
..___tag_value_main.36:                                         #74.27
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #74.27
..___tag_value_main.38:                                         #
                                # LOE rax r13 r14 r12d r15d
..B1.9:                         # Preds ..B1.8
        movq      %rax, %rdi                                    #74.37
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #74.37
..___tag_value_main.40:                                         #74.37
        call      _ZNSolsEPFRSoS_E                              #74.37
..___tag_value_main.42:                                         #
                                # LOE r13 r14 r12d r15d
..B1.10:                        # Preds ..B1.9
        movl      %r15d, %edi                                   #75.22
        movl      $64, %esi                                     #75.22
        shlq      $3, %rdi                                      #75.22
        movl      %r15d, 600(%rsp)                              #75.16
..___tag_value_main.44:                                         #75.22
        call      MKL_malloc                                    #75.22
..___tag_value_main.46:                                         #
                                # LOE rax r13 r14 r12d r15d
..B1.11:                        # Preds ..B1.10
        movq      %rax, 608(%rsp)                               #75.16
        xorl      %ebx, %ebx                                    #76.14
        movl      $1, 616(%rsp)                                 #75.16
        movl      $-1, 624(%rsp)                                #75.16
        movl      $0, 628(%rsp)                                 #75.16
..___tag_value_main.48:                                         #
                                # LOE r13 r14 ebx r12d r15d
..B1.12:                        # Preds ..B1.11 ..B1.14
        movl      %r12d, %edi                                   #77.23
..___tag_value_main.49:                                         #77.23
        call      _Z7latencyi                                   #77.23
..___tag_value_main.51:                                         #
                                # LOE r13 r14 ebx r12d r15d xmm0
..B1.39:                        # Preds ..B1.12
        movsd     %xmm0, (%rsp)                                 #77.23
..___tag_value_main.53:                                         #
                                # LOE r13 r14 ebx r12d r15d
..B1.13:                        # Preds ..B1.39
        movslq    628(%rsp), %rdx                               #78.7
        movq      608(%rsp), %rax                               #78.7
        movsd     (%rsp), %xmm0                                 #78.13
        movsd     %xmm0, (%rax,%rdx,8)                          #78.13
        incl      628(%rsp)                                     #78.13
        movl      $-1, 624(%rsp)                                #78.7
        cmpl      $5, %ebx                                      #79.12
        jl        ..B1.29       # Prob 14%                      #79.12
..___tag_value_main.54:                                         #
                                # LOE r13 r14 ebx r12d r15d
..B1.14:                        # Preds ..B1.31 ..B1.13
        incl      %ebx                                          #76.29
        cmpl      %r15d, %ebx                                   #76.22
        jl        ..B1.12       # Prob 82%                      #76.22
..___tag_value_main.55:                                         #
                                # LOE r13 r14 ebx r12d r15d
..B1.15:                        # Preds ..B1.14                 # Infreq
        movq      banner.17999.0.0.47(%rip), %rax               #85.21
        movq      %rax, 576(%rsp)                               #85.21
        movq      8+banner.17999.0.0.47(%rip), %rdx             #85.21
        movq      %rdx, 584(%rsp)                               #85.21
        movl      16+banner.17999.0.0.47(%rip), %ecx            #85.21
        movl      %ecx, 592(%rsp)                               #85.21
..___tag_value_main.56:                                         #
                                # LOE r13 r14
..B1.16:                        # Preds ..B1.15                 # Infreq
        lea       600(%rsp), %rdi                               #87.11
        lea       8(%rsp), %rsi                                 #87.11
        lea       576(%rsp), %rdx                               #87.11
..___tag_value_main.57:                                         #87.11
        call      _ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc #87.11
..___tag_value_main.59:                                         #
                                # LOE r13 r14
..B1.17:                        # Preds ..B1.16                 # Infreq
        cmpl      $0, 616(%rsp)                                 #88.3
        je        ..B1.19       # Prob 78%                      #88.3
..___tag_value_main.61:                                         #
                                # LOE r13 r14
..B1.18:                        # Preds ..B1.17                 # Infreq
        movq      608(%rsp), %rdi                               #88.3
..___tag_value_main.62:                                         #88.3
        call      MKL_free                                      #88.3
..___tag_value_main.64:                                         #
                                # LOE r13 r14
..B1.19:                        # Preds ..B1.18 ..B1.17         # Infreq
        incq      %r13                                          #67.24
        cmpq      $12, %r13                                     #67.20
        jl        ..B1.4        # Prob 91%                      #67.20
..___tag_value_main.66:                                         #
                                # LOE r13 r14
..B1.20:                        # Preds ..B1.19                 # Infreq
        lea       8(%rsp), %rdi                                 #89.9
..___tag_value_main.67:                                         #89.9
        call      _ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv #89.9
..___tag_value_main.69:                                         #
                                # LOE r14
..B1.21:                        # Preds ..B1.20                 # Infreq
        lea       8(%rsp), %rdi                                 #89.9
..___tag_value_main.71:                                         #89.9
        call      _ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev #89.9
..___tag_value_main.73:                                         #
                                # LOE r14
..B1.22:                        # Preds ..B1.21                 # Infreq
        xorl      %eax, %eax                                    #90.1
        addq      $736, %rsp                                    #90.1
..___tag_value_main.75:                                         #
        popq      %rbx                                          #90.1
..___tag_value_main.77:                                         #90.1
        popq      %r15                                          #90.1
..___tag_value_main.78:                                         #90.1
        popq      %r13                                          #90.1
..___tag_value_main.79:                                         #90.1
        popq      %r12                                          #90.1
        movq      %rbp, %rsp                                    #90.1
        popq      %rbp                                          #90.1
..___tag_value_main.80:                                         #
        ret                                                     #90.1
..___tag_value_main.82:                                         #
                                # LOE
..___tag_value_main.1:
..B1.23:                        # Preds ..B1.20 ..B1.18 ..B1.10 ..B1.9 ..B1.8
                                #       ..B1.7 ..B1.6 ..B1.5    # Infreq
        movq      %rax, (%rsp)                                  #65.18
..___tag_value_main.89:                                         #
                                # LOE r14
..B1.24:                        # Preds ..B1.27 ..B1.23         # Infreq
        lea       8(%rsp), %rdi                                 #65.18
..___tag_value_main.90:                                         #65.18
        call      _ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev #65.18
..___tag_value_main.92:                                         #
                                # LOE r14
..B1.25:                        # Preds ..B1.24                 # Infreq
        xorl      %eax, %eax                                    #65.18
        movq      (%rsp), %rdi                                  #65.18
..___tag_value_main.94:                                         #65.18
        call      _Unwind_Resume                                #65.18
..___tag_value_main.96:                                         #
                                # LOE
..___tag_value_main.2:
..B1.26:                        # Preds ..B1.16 ..B1.31 ..B1.30 ..B1.29 ..B1.12
                                #                               # Infreq
        movq      %rax, (%rsp)                                  #75.22
..___tag_value_main.98:                                         #
                                # LOE r14
..B1.27:                        # Preds ..B1.26                 # Infreq
        lea       600(%rsp), %rdi                               #75.22
..___tag_value_main.99:                                         #75.22
        call      _ZN10StatVectorD1Ev                           #75.22
..___tag_value_main.101:                                        #
        jmp       ..B1.24       # Prob 100%                     #75.22
..___tag_value_main.102:                                        #
                                # LOE r14
..B1.29:                        # Preds ..B1.13                 # Infreq
        movl      $.L_2__STRING.7, %esi                         #80.7
        lea       8(%rsp), %rdi                                 #80.7
..___tag_value_main.103:                                        #80.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #80.7
..___tag_value_main.105:                                        #
                                # LOE rax r13 r14 ebx r12d r15d
..B1.30:                        # Preds ..B1.29                 # Infreq
        movsd     (%rsp), %xmm0                                 #80.21
        movq      %rax, %rdi                                    #80.21
..___tag_value_main.107:                                        #80.21
        call      _ZNSolsEd                                     #80.21
..___tag_value_main.109:                                        #
                                # LOE rax r13 r14 ebx r12d r15d
..B1.31:                        # Preds ..B1.30                 # Infreq
        movq      %rax, %rdi                                    #80.29
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #80.29
..___tag_value_main.111:                                        #80.29
        call      _ZNSolsEPFRSoS_E                              #80.29
..___tag_value_main.113:                                        #
        jmp       ..B1.14       # Prob 100%                     #80.29
..___tag_value_main.114:                                        #
                                # LOE r13 r14 ebx r12d r15d
..B1.32:                        # Preds ..B1.4                  # Infreq
        lea       8(%rsp), %rdi                                 #71.7
..___tag_value_main.115:                                        #71.7
        call      _ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev #71.7
..___tag_value_main.117:                                        #
                                # LOE r14
..B1.33:                        # Preds ..B1.32                 # Infreq
        movl      $-1, %eax                                     #71.14
        addq      $736, %rsp                                    #71.14
..___tag_value_main.119:                                        #
        popq      %rbx                                          #71.14
..___tag_value_main.121:                                        #71.14
        popq      %r15                                          #71.14
..___tag_value_main.122:                                        #71.14
        popq      %r13                                          #71.14
..___tag_value_main.123:                                        #71.14
        popq      %r12                                          #71.14
        movq      %rbp, %rsp                                    #71.14
        popq      %rbp                                          #71.14
..___tag_value_main.124:                                        #
        ret                                                     #71.14
        .align    16,0x90
..___tag_value_main.126:                                        #
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.section .gcc_except_table, "a"
	.align 4
main$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value_main.130 - ..___tag_value_main.129
..___tag_value_main.129:
	.byte	1
	.uleb128	..___tag_value_main.128 - ..___tag_value_main.127
..___tag_value_main.127:
	.uleb128	..___tag_value_main.13 - ..___tag_value_main.4
	.uleb128	..___tag_value_main.20 - ..___tag_value_main.13
	.byte	0
	.byte	0
	.uleb128	..___tag_value_main.24 - ..___tag_value_main.4
	.uleb128	..___tag_value_main.46 - ..___tag_value_main.24
	.uleb128	..___tag_value_main.1 - ..___tag_value_main.4
	.byte	0
	.uleb128	..___tag_value_main.49 - ..___tag_value_main.4
	.uleb128	..___tag_value_main.59 - ..___tag_value_main.49
	.uleb128	..___tag_value_main.2 - ..___tag_value_main.4
	.byte	0
	.uleb128	..___tag_value_main.62 - ..___tag_value_main.4
	.uleb128	..___tag_value_main.69 - ..___tag_value_main.62
	.uleb128	..___tag_value_main.1 - ..___tag_value_main.4
	.byte	0
	.uleb128	..___tag_value_main.71 - ..___tag_value_main.4
	.uleb128	..___tag_value_main.73 - ..___tag_value_main.71
	.byte	0
	.byte	0
	.uleb128	..___tag_value_main.94 - ..___tag_value_main.4
	.uleb128	..___tag_value_main.96 - ..___tag_value_main.94
	.byte	0
	.byte	0
	.uleb128	..___tag_value_main.103 - ..___tag_value_main.4
	.uleb128	..___tag_value_main.113 - ..___tag_value_main.103
	.uleb128	..___tag_value_main.2 - ..___tag_value_main.4
	.byte	0
	.uleb128	..___tag_value_main.115 - ..___tag_value_main.4
	.uleb128	..___tag_value_main.117 - ..___tag_value_main.115
	.byte	0
	.byte	0
..___tag_value_main.128:
	.long	0x00000000,0x00000000
..___tag_value_main.130:
	.section .rodata, "a"
	.align 4
	.align 4
nlist.17997.0.0.47:
	.long	1
	.long	2
	.long	4
	.long	8
	.long	10
	.long	15
	.long	25
	.long	100
	.long	125
	.long	1000
	.long	10000
	.long	100000
	.align 1
banner.17999.0.0.47:
	.byte	67
	.byte	65
	.byte	67
	.byte	72
	.byte	69
	.byte	32
	.byte	70
	.byte	76
	.byte	85
	.byte	83
	.byte	72
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.data
# -- End  main
	.section .text._ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc, "xaG",@progbits,_ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc,comdat
..TXTST1:
# -- Begin  _ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc
# mark_begin;
       .align    16,0x90
	.weak _ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc
_ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B2.1:                         # Preds ..B2.0
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.131: #70.55
        pushq     %r12                                          #70.55
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.133: #
        pushq     %r13                                          #70.55
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.135: #
        pushq     %r14                                          #70.55
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.137: #
        pushq     %r15                                          #70.55
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.139: #
        pushq     %rbx                                          #70.55
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.141: #
        pushq     %rbp                                          #70.55
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.143: #
        subq      $24, %rsp                                     #70.55
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.145: #
        movq      %rsi, %rbp                                    #70.55
        movq      %rdi, %rbx                                    #70.55
        movq      %rbp, %rdi                                    #71.10
        movq      %rdx, %rsi                                    #71.10
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.146: #71.10
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #71.10
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.147: #
                                # LOE rax rbx rbp
..B2.2:                         # Preds ..B2.1
        movq      %rax, %rdi                                    #71.18
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #71.18
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.148: #71.18
        call      _ZNSolsEPFRSoS_E                              #71.18
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.149: #
                                # LOE rbx rbp
..B2.3:                         # Preds ..B2.2
        movq      %rbp, %rdi                                    #72.10
        movl      $10, %esi                                     #72.10
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.150: #72.10
        call      _ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw #72.10
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.151: #
                                # LOE rax rbx rbp
..B2.4:                         # Preds ..B2.3
        movq      %rax, %rdi                                    #72.20
        movl      $.L_2__STRING.0, %esi                         #72.20
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.152: #72.20
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #72.20
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.153: #
                                # LOE rax rbx rbp
..B2.259:                       # Preds ..B2.4
        movq      %rax, %r14                                    #72.20
                                # LOE rbx rbp r14
..B2.5:                         # Preds ..B2.259
        movl      28(%rbx), %eax                                #72.40
        cmpl      $1, 24(%rbx)                                  #72.40
        je        ..B2.273      # Prob 41%                      #72.40
                                # LOE rbx rbp r14 eax
..B2.6:                         # Preds ..B2.5
        movslq    %eax, %rax                                    #72.40
        movq      8(%rbx), %r13                                 #72.40
        lea       (%r13,%rax,8), %r12                           #72.40
        cmpq      %r12, %r13                                    #72.40
        lea       (,%rax,8), %r15                               #72.40
        je        ..B2.42       # Prob 33%                      #72.40
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B2.7:                         # Preds ..B2.6
        movq      %r15, %rax                                    #72.40
        movq      %r13, %rdi                                    #72.40
        sarq      $35, %rax                                     #72.40
        movq      %r12, %rsi                                    #72.40
        sarq      $3, %r15                                      #72.40
        bsr       %r15d, %ecx                                   #72.40
        bsr       %eax, %edx                                    #72.40
        negl      %ecx                                          #72.40
        negl      %edx                                          #72.40
        addl      $63, %ecx                                     #72.40
        addl      $31, %edx                                     #72.40
        testl     %eax, %eax                                    #72.40
        cmove     %ecx, %edx                                    #72.40
        movslq    %edx, %rdx                                    #72.40
        addq      %rdx, %rdx                                    #72.40
        negq      %rdx                                          #72.40
        addq      $126, %rdx                                    #72.40
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.154: #72.40
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_          #72.40
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.155: #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.8:                         # Preds ..B2.7
        cmpq      $16, %r15                                     #72.40
        jle       ..B2.30       # Prob 50%                      #72.40
                                # LOE rbx rbp r12 r13 r14
..B2.9:                         # Preds ..B2.8
        lea       128(%r13), %r15                               #72.40
                                # LOE rbx rbp r12 r13 r14 r15
..B2.10:                        # Preds ..B2.9
        lea       8(%r13), %rax                                 #72.40
                                # LOE rax rbx rbp r12 r13 r14 r15
..B2.11:                        # Preds ..B2.10
        movq      %rbx, (%rsp)                                  #
        movq      %rax, %rbx                                    #
        movq      %rbp, 8(%rsp)                                 #
                                # LOE rbx r12 r13 r14 r15
..B2.12:                        # Preds ..B2.20 ..B2.11
        movsd     (%rbx), %xmm1                                 #72.40
        movsd     (%r13), %xmm0                                 #72.40
        movq      (%rbx), %rbp                                  #72.40
        comisd    %xmm1, %xmm0                                  #72.40
        jbe       ..B2.15       # Prob 50%                      #72.40
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.13:                        # Preds ..B2.12
        movq      %rbx, %rdx                                    #72.40
        movq      %r13, %rsi                                    #72.40
        subq      %r13, %rdx                                    #72.40
        shrq      $3, %rdx                                      #72.40
        shlq      $3, %rdx                                      #72.40
        movq      %rdx, %rcx                                    #72.40
        negq      %rcx                                          #72.40
        lea       8(%rbx,%rcx), %rdi                            #72.40
        call      memmove                                       #72.40
                                # LOE rbx rbp r12 r13 r14 r15
..B2.14:                        # Preds ..B2.13
        movq      %rbp, (%r13)                                  #72.40
        jmp       ..B2.20       # Prob 100%                     #72.40
                                # LOE rbx r12 r13 r14 r15
..B2.15:                        # Preds ..B2.12
        movsd     -8(%rbx), %xmm0                               #72.40
        lea       -16(%rbx), %rcx                               #
        movq      %rbx, %rsi                                    #72.40
        lea       -8(%rbx), %rdx                                #72.40
        comisd    %xmm1, %xmm0                                  #72.40
        jbe       ..B2.19       # Prob 10%                      #72.40
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.17:                        # Preds ..B2.15 ..B2.17
        movsd     %xmm0, (%rsi)                                 #72.40
        movq      %rdx, %rsi                                    #72.40
        movsd     (%rcx), %xmm0                                 #72.40
        addq      $-8, %rcx                                     #72.40
        addq      $-8, %rdx                                     #72.40
        comisd    %xmm1, %xmm0                                  #72.40
        ja        ..B2.17       # Prob 82%                      #72.40
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.19:                        # Preds ..B2.17 ..B2.15
        movq      %rbp, (%rsi)                                  #72.40
                                # LOE rbx r12 r13 r14 r15
..B2.20:                        # Preds ..B2.14 ..B2.19
        addq      $8, %rbx                                      #72.40
        cmpq      %r15, %rbx                                    #72.40
        jne       ..B2.12       # Prob 82%                      #72.40
                                # LOE rbx r12 r13 r14 r15
..B2.21:                        # Preds ..B2.20
        movq      (%rsp), %rbx                                  #
        movq      8(%rsp), %rbp                                 #
                                # LOE rbx rbp r12 r14 r15
..B2.22:                        # Preds ..B2.21
        cmpq      %r12, %r15                                    #72.40
        je        ..B2.29       # Prob 2%                       #72.40
                                # LOE rbx rbp r12 r14 r15
..B2.24:                        # Preds ..B2.22 ..B2.28
        movsd     (%r15), %xmm1                                 #72.40
        lea       -16(%r15), %rdx                               #
        movsd     -8(%r15), %xmm0                               #72.40
        lea       -8(%r15), %rax                                #72.40
        movq      (%r15), %rcx                                  #72.40
        movq      %r15, %rsi                                    #72.40
        comisd    %xmm1, %xmm0                                  #72.40
        jbe       ..B2.28       # Prob 10%                      #72.40
                                # LOE rax rdx rcx rbx rbp rsi r12 r14 r15 xmm0 xmm1
..B2.26:                        # Preds ..B2.24 ..B2.26
        movsd     %xmm0, (%rsi)                                 #72.40
        movq      %rax, %rsi                                    #72.40
        movsd     (%rdx), %xmm0                                 #72.40
        addq      $-8, %rdx                                     #72.40
        addq      $-8, %rax                                     #72.40
        comisd    %xmm1, %xmm0                                  #72.40
        ja        ..B2.26       # Prob 82%                      #72.40
                                # LOE rax rdx rcx rbx rbp rsi r12 r14 r15 xmm0 xmm1
..B2.28:                        # Preds ..B2.26 ..B2.24
        addq      $8, %r15                                      #72.40
        movq      %rcx, (%rsi)                                  #72.40
        cmpq      %r12, %r15                                    #72.40
        jne       ..B2.24       # Prob 82%                      #72.40
                                # LOE rbx rbp r12 r14 r15
..B2.29:                        # Preds ..B2.30 ..B2.22 ..B2.28
        movl      28(%rbx), %eax                                #72.40
        movq      8(%rbx), %r13                                 #72.40
        jmp       ..B2.42       # Prob 100%                     #72.40
                                # LOE rbx rbp r13 r14 eax
..B2.30:                        # Preds ..B2.8
        lea       8(%r13), %r15                                 #72.40
        cmpq      %r12, %r15                                    #72.40
        je        ..B2.29       # Prob 2%                       #72.40
                                # LOE rbx rbp r12 r13 r14 r15
..B2.31:                        # Preds ..B2.30
        movq      %rbp, 8(%rsp)                                 #
                                # LOE rbx r12 r13 r14 r15
..B2.32:                        # Preds ..B2.40 ..B2.31
        movsd     (%r15), %xmm1                                 #72.40
        movsd     (%r13), %xmm0                                 #72.40
        movq      (%r15), %rbp                                  #72.40
        comisd    %xmm1, %xmm0                                  #72.40
        jbe       ..B2.35       # Prob 50%                      #72.40
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.33:                        # Preds ..B2.32
        movq      %r15, %rdx                                    #72.40
        movq      %r13, %rsi                                    #72.40
        subq      %r13, %rdx                                    #72.40
        shrq      $3, %rdx                                      #72.40
        shlq      $3, %rdx                                      #72.40
        movq      %rdx, %rax                                    #72.40
        negq      %rax                                          #72.40
        lea       8(%r15,%rax), %rdi                            #72.40
        call      memmove                                       #72.40
                                # LOE rbx rbp r12 r13 r14 r15
..B2.34:                        # Preds ..B2.33
        movq      %rbp, (%r13)                                  #72.40
        jmp       ..B2.40       # Prob 100%                     #72.40
                                # LOE rbx r12 r13 r14 r15
..B2.35:                        # Preds ..B2.32
        movsd     -8(%r15), %xmm0                               #72.40
        lea       -16(%r15), %rdx                               #
        movq      %r15, %rcx                                    #72.40
        lea       -8(%r15), %rax                                #72.40
        comisd    %xmm1, %xmm0                                  #72.40
        jbe       ..B2.39       # Prob 10%                      #72.40
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.37:                        # Preds ..B2.35 ..B2.37
        movsd     %xmm0, (%rcx)                                 #72.40
        movq      %rax, %rcx                                    #72.40
        movsd     (%rdx), %xmm0                                 #72.40
        addq      $-8, %rdx                                     #72.40
        addq      $-8, %rax                                     #72.40
        comisd    %xmm1, %xmm0                                  #72.40
        ja        ..B2.37       # Prob 82%                      #72.40
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.39:                        # Preds ..B2.37 ..B2.35
        movq      %rbp, (%rcx)                                  #72.40
                                # LOE rbx r12 r13 r14 r15
..B2.40:                        # Preds ..B2.34 ..B2.39
        addq      $8, %r15                                      #72.40
        cmpq      %r12, %r15                                    #72.40
        jne       ..B2.32       # Prob 82%                      #72.40
                                # LOE rbx r12 r13 r14 r15
..B2.41:                        # Preds ..B2.40
        movq      8(%rsp), %rbp                                 #
        movl      28(%rbx), %eax                                #72.40
        movq      8(%rbx), %r13                                 #72.40
                                # LOE rbx rbp r13 r14 eax
..B2.42:                        # Preds ..B2.29 ..B2.41 ..B2.6
        movl      $1, 24(%rbx)                                  #72.40
                                # LOE rbx rbp r13 r14 eax
..B2.43:                        # Preds ..B2.42 ..B2.273
        movl      %eax, %edx                                    #72.32
        movq      %r14, %rdi                                    #72.32
        shrl      $31, %edx                                     #72.32
        addl      %edx, %eax                                    #72.32
        sarl      $1, %eax                                      #72.32
        movslq    %eax, %rax                                    #72.32
        movsd     (%r13,%rax,8), %xmm0                          #72.32
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.156: #72.32
        call      _ZNSolsEd                                     #72.32
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.157: #
                                # LOE rax rbx rbp
..B2.44:                        # Preds ..B2.43
        movq      %rax, %rdi                                    #72.48
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #72.48
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.158: #72.48
        call      _ZNSolsEPFRSoS_E                              #72.48
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.159: #
                                # LOE rbx rbp
..B2.45:                        # Preds ..B2.44
        movq      %rbp, %rdi                                    #73.10
        movl      $10, %esi                                     #73.10
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.160: #73.10
        call      _ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw #73.10
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.161: #
                                # LOE rax rbx rbp
..B2.46:                        # Preds ..B2.45
        movq      %rax, %rdi                                    #73.20
        movl      $.L_2__STRING.1, %esi                         #73.20
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.162: #73.20
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #73.20
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.163: #
                                # LOE rax rbx rbp
..B2.262:                       # Preds ..B2.46
        movq      %rax, %r14                                    #73.20
                                # LOE rbx rbp r14
..B2.47:                        # Preds ..B2.262
        movslq    28(%rbx), %rax                                #73.37
        cmpl      $1, 24(%rbx)                                  #73.37
        je        ..B2.272      # Prob 41%                      #73.37
                                # LOE rax rbx rbp r14
..B2.48:                        # Preds ..B2.47
        movq      8(%rbx), %r13                                 #73.37
        lea       (,%rax,8), %r15                               #73.37
        lea       (%r13,%rax,8), %r12                           #73.37
        cmpq      %r12, %r13                                    #73.37
        je        ..B2.84       # Prob 33%                      #73.37
                                # LOE rax rbx rbp r12 r13 r14 r15
..B2.49:                        # Preds ..B2.48
        movq      %r15, %rax                                    #73.37
        movq      %r13, %rdi                                    #73.37
        sarq      $35, %rax                                     #73.37
        movq      %r12, %rsi                                    #73.37
        sarq      $3, %r15                                      #73.37
        bsr       %r15d, %ecx                                   #73.37
        bsr       %eax, %edx                                    #73.37
        negl      %ecx                                          #73.37
        negl      %edx                                          #73.37
        addl      $63, %ecx                                     #73.37
        addl      $31, %edx                                     #73.37
        testl     %eax, %eax                                    #73.37
        cmove     %ecx, %edx                                    #73.37
        movslq    %edx, %rdx                                    #73.37
        addq      %rdx, %rdx                                    #73.37
        negq      %rdx                                          #73.37
        addq      $126, %rdx                                    #73.37
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.164: #73.37
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_          #73.37
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.165: #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.50:                        # Preds ..B2.49
        cmpq      $16, %r15                                     #73.37
        jle       ..B2.72       # Prob 50%                      #73.37
                                # LOE rbx rbp r12 r13 r14
..B2.51:                        # Preds ..B2.50
        lea       128(%r13), %r15                               #73.37
                                # LOE rbx rbp r12 r13 r14 r15
..B2.52:                        # Preds ..B2.51
        lea       8(%r13), %rax                                 #73.37
                                # LOE rax rbx rbp r12 r13 r14 r15
..B2.53:                        # Preds ..B2.52
        movq      %rbx, (%rsp)                                  #
        movq      %rax, %rbx                                    #
        movq      %rbp, 8(%rsp)                                 #
                                # LOE rbx r12 r13 r14 r15
..B2.54:                        # Preds ..B2.62 ..B2.53
        movsd     (%rbx), %xmm1                                 #73.37
        movsd     (%r13), %xmm0                                 #73.37
        movq      (%rbx), %rbp                                  #73.37
        comisd    %xmm1, %xmm0                                  #73.37
        jbe       ..B2.57       # Prob 50%                      #73.37
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.55:                        # Preds ..B2.54
        movq      %rbx, %rdx                                    #73.37
        movq      %r13, %rsi                                    #73.37
        subq      %r13, %rdx                                    #73.37
        shrq      $3, %rdx                                      #73.37
        shlq      $3, %rdx                                      #73.37
        movq      %rdx, %rcx                                    #73.37
        negq      %rcx                                          #73.37
        lea       8(%rbx,%rcx), %rdi                            #73.37
        call      memmove                                       #73.37
                                # LOE rbx rbp r12 r13 r14 r15
..B2.56:                        # Preds ..B2.55
        movq      %rbp, (%r13)                                  #73.37
        jmp       ..B2.62       # Prob 100%                     #73.37
                                # LOE rbx r12 r13 r14 r15
..B2.57:                        # Preds ..B2.54
        movsd     -8(%rbx), %xmm0                               #73.37
        lea       -16(%rbx), %rcx                               #
        movq      %rbx, %rsi                                    #73.37
        lea       -8(%rbx), %rdx                                #73.37
        comisd    %xmm1, %xmm0                                  #73.37
        jbe       ..B2.61       # Prob 10%                      #73.37
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.59:                        # Preds ..B2.57 ..B2.59
        movsd     %xmm0, (%rsi)                                 #73.37
        movq      %rdx, %rsi                                    #73.37
        movsd     (%rcx), %xmm0                                 #73.37
        addq      $-8, %rcx                                     #73.37
        addq      $-8, %rdx                                     #73.37
        comisd    %xmm1, %xmm0                                  #73.37
        ja        ..B2.59       # Prob 82%                      #73.37
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.61:                        # Preds ..B2.59 ..B2.57
        movq      %rbp, (%rsi)                                  #73.37
                                # LOE rbx r12 r13 r14 r15
..B2.62:                        # Preds ..B2.56 ..B2.61
        addq      $8, %rbx                                      #73.37
        cmpq      %r15, %rbx                                    #73.37
        jne       ..B2.54       # Prob 82%                      #73.37
                                # LOE rbx r12 r13 r14 r15
..B2.63:                        # Preds ..B2.62
        movq      (%rsp), %rbx                                  #
        movq      8(%rsp), %rbp                                 #
                                # LOE rbx rbp r12 r14 r15
..B2.64:                        # Preds ..B2.63
        cmpq      %r12, %r15                                    #73.37
        je        ..B2.71       # Prob 2%                       #73.37
                                # LOE rbx rbp r12 r14 r15
..B2.66:                        # Preds ..B2.64 ..B2.70
        movsd     (%r15), %xmm1                                 #73.37
        lea       -16(%r15), %rdx                               #
        movsd     -8(%r15), %xmm0                               #73.37
        lea       -8(%r15), %rax                                #73.37
        movq      (%r15), %rcx                                  #73.37
        movq      %r15, %rsi                                    #73.37
        comisd    %xmm1, %xmm0                                  #73.37
        jbe       ..B2.70       # Prob 10%                      #73.37
                                # LOE rax rdx rcx rbx rbp rsi r12 r14 r15 xmm0 xmm1
..B2.68:                        # Preds ..B2.66 ..B2.68
        movsd     %xmm0, (%rsi)                                 #73.37
        movq      %rax, %rsi                                    #73.37
        movsd     (%rdx), %xmm0                                 #73.37
        addq      $-8, %rdx                                     #73.37
        addq      $-8, %rax                                     #73.37
        comisd    %xmm1, %xmm0                                  #73.37
        ja        ..B2.68       # Prob 82%                      #73.37
                                # LOE rax rdx rcx rbx rbp rsi r12 r14 r15 xmm0 xmm1
..B2.70:                        # Preds ..B2.68 ..B2.66
        addq      $8, %r15                                      #73.37
        movq      %rcx, (%rsi)                                  #73.37
        cmpq      %r12, %r15                                    #73.37
        jne       ..B2.66       # Prob 82%                      #73.37
                                # LOE rbx rbp r12 r14 r15
..B2.71:                        # Preds ..B2.72 ..B2.64 ..B2.70
        movslq    28(%rbx), %rax                                #73.37
        movq      8(%rbx), %r13                                 #73.37
        jmp       ..B2.84       # Prob 100%                     #73.37
                                # LOE rax rbx rbp r13 r14
..B2.72:                        # Preds ..B2.50
        lea       8(%r13), %r15                                 #73.37
        cmpq      %r12, %r15                                    #73.37
        je        ..B2.71       # Prob 2%                       #73.37
                                # LOE rbx rbp r12 r13 r14 r15
..B2.73:                        # Preds ..B2.72
        movq      %rbp, 8(%rsp)                                 #
                                # LOE rbx r12 r13 r14 r15
..B2.74:                        # Preds ..B2.82 ..B2.73
        movsd     (%r15), %xmm1                                 #73.37
        movsd     (%r13), %xmm0                                 #73.37
        movq      (%r15), %rbp                                  #73.37
        comisd    %xmm1, %xmm0                                  #73.37
        jbe       ..B2.77       # Prob 50%                      #73.37
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.75:                        # Preds ..B2.74
        movq      %r15, %rdx                                    #73.37
        movq      %r13, %rsi                                    #73.37
        subq      %r13, %rdx                                    #73.37
        shrq      $3, %rdx                                      #73.37
        shlq      $3, %rdx                                      #73.37
        movq      %rdx, %rax                                    #73.37
        negq      %rax                                          #73.37
        lea       8(%r15,%rax), %rdi                            #73.37
        call      memmove                                       #73.37
                                # LOE rbx rbp r12 r13 r14 r15
..B2.76:                        # Preds ..B2.75
        movq      %rbp, (%r13)                                  #73.37
        jmp       ..B2.82       # Prob 100%                     #73.37
                                # LOE rbx r12 r13 r14 r15
..B2.77:                        # Preds ..B2.74
        movsd     -8(%r15), %xmm0                               #73.37
        lea       -16(%r15), %rdx                               #
        movq      %r15, %rcx                                    #73.37
        lea       -8(%r15), %rax                                #73.37
        comisd    %xmm1, %xmm0                                  #73.37
        jbe       ..B2.81       # Prob 10%                      #73.37
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.79:                        # Preds ..B2.77 ..B2.79
        movsd     %xmm0, (%rcx)                                 #73.37
        movq      %rax, %rcx                                    #73.37
        movsd     (%rdx), %xmm0                                 #73.37
        addq      $-8, %rdx                                     #73.37
        addq      $-8, %rax                                     #73.37
        comisd    %xmm1, %xmm0                                  #73.37
        ja        ..B2.79       # Prob 82%                      #73.37
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.81:                        # Preds ..B2.79 ..B2.77
        movq      %rbp, (%rcx)                                  #73.37
                                # LOE rbx r12 r13 r14 r15
..B2.82:                        # Preds ..B2.76 ..B2.81
        addq      $8, %r15                                      #73.37
        cmpq      %r12, %r15                                    #73.37
        jne       ..B2.74       # Prob 82%                      #73.37
                                # LOE rbx r12 r13 r14 r15
..B2.83:                        # Preds ..B2.82
        movq      8(%rsp), %rbp                                 #
        movslq    28(%rbx), %rax                                #73.37
        movq      8(%rbx), %r13                                 #73.37
                                # LOE rax rbx rbp r13 r14
..B2.84:                        # Preds ..B2.71 ..B2.83 ..B2.48
        movl      $1, 24(%rbx)                                  #73.37
                                # LOE rax rbx rbp r13 r14
..B2.85:                        # Preds ..B2.84 ..B2.272
        movsd     -8(%r13,%rax,8), %xmm0                        #73.29
        movq      %r14, %rdi                                    #73.29
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.166: #73.29
        call      _ZNSolsEd                                     #73.29
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.167: #
                                # LOE rax rbx rbp
..B2.86:                        # Preds ..B2.85
        movq      %rax, %rdi                                    #73.42
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #73.42
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.168: #73.42
        call      _ZNSolsEPFRSoS_E                              #73.42
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.169: #
                                # LOE rbx rbp
..B2.87:                        # Preds ..B2.86
        movq      %rbp, %rdi                                    #74.10
        movl      $10, %esi                                     #74.10
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.170: #74.10
        call      _ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw #74.10
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.171: #
                                # LOE rax rbx rbp
..B2.88:                        # Preds ..B2.87
        movq      %rax, %rdi                                    #74.20
        movl      $.L_2__STRING.2, %esi                         #74.20
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.172: #74.20
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #74.20
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.173: #
                                # LOE rax rbx rbp
..B2.265:                       # Preds ..B2.88
        movq      %rax, %r13                                    #74.20
                                # LOE rbx rbp r13
..B2.89:                        # Preds ..B2.265
        movl      28(%rbx), %r8d                                #74.38
        cmpl      $1, 24(%rbx)                                  #74.38
        je        ..B2.127      # Prob 41%                      #74.38
                                # LOE rbx rbp r13 r8d
..B2.90:                        # Preds ..B2.89
        movslq    %r8d, %r8                                     #74.38
        movq      8(%rbx), %r14                                 #74.38
        lea       (%r14,%r8,8), %r12                            #74.38
        cmpq      %r12, %r14                                    #74.38
        lea       (,%r8,8), %r15                                #74.38
        je        ..B2.126      # Prob 33%                      #74.38
                                # LOE rbx rbp r12 r13 r14 r15 r8d
..B2.91:                        # Preds ..B2.90
        movq      %r15, %rax                                    #74.38
        movq      %r14, %rdi                                    #74.38
        sarq      $35, %rax                                     #74.38
        movq      %r12, %rsi                                    #74.38
        sarq      $3, %r15                                      #74.38
        bsr       %r15d, %ecx                                   #74.38
        bsr       %eax, %edx                                    #74.38
        negl      %ecx                                          #74.38
        negl      %edx                                          #74.38
        addl      $63, %ecx                                     #74.38
        addl      $31, %edx                                     #74.38
        testl     %eax, %eax                                    #74.38
        cmove     %ecx, %edx                                    #74.38
        movslq    %edx, %rdx                                    #74.38
        addq      %rdx, %rdx                                    #74.38
        negq      %rdx                                          #74.38
        addq      $126, %rdx                                    #74.38
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.174: #74.38
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_          #74.38
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.175: #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.92:                        # Preds ..B2.91
        cmpq      $16, %r15                                     #74.38
        jle       ..B2.114      # Prob 50%                      #74.38
                                # LOE rbx rbp r12 r13 r14
..B2.93:                        # Preds ..B2.92
        lea       128(%r14), %r15                               #74.38
                                # LOE rbx rbp r12 r13 r14 r15
..B2.94:                        # Preds ..B2.93
        lea       8(%r14), %rax                                 #74.38
                                # LOE rax rbx rbp r12 r13 r14 r15
..B2.95:                        # Preds ..B2.94
        movq      %rbx, (%rsp)                                  #
        movq      %rax, %rbx                                    #
        movq      %rbp, 8(%rsp)                                 #
                                # LOE rbx r12 r13 r14 r15
..B2.96:                        # Preds ..B2.104 ..B2.95
        movsd     (%rbx), %xmm1                                 #74.38
        movsd     (%r14), %xmm0                                 #74.38
        movq      (%rbx), %rbp                                  #74.38
        comisd    %xmm1, %xmm0                                  #74.38
        jbe       ..B2.99       # Prob 50%                      #74.38
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.97:                        # Preds ..B2.96
        movq      %rbx, %rdx                                    #74.38
        movq      %r14, %rsi                                    #74.38
        subq      %r14, %rdx                                    #74.38
        shrq      $3, %rdx                                      #74.38
        shlq      $3, %rdx                                      #74.38
        movq      %rdx, %rcx                                    #74.38
        negq      %rcx                                          #74.38
        lea       8(%rbx,%rcx), %rdi                            #74.38
        call      memmove                                       #74.38
                                # LOE rbx rbp r12 r13 r14 r15
..B2.98:                        # Preds ..B2.97
        movq      %rbp, (%r14)                                  #74.38
        jmp       ..B2.104      # Prob 100%                     #74.38
                                # LOE rbx r12 r13 r14 r15
..B2.99:                        # Preds ..B2.96
        movsd     -8(%rbx), %xmm0                               #74.38
        lea       -16(%rbx), %rcx                               #
        movq      %rbx, %rsi                                    #74.38
        lea       -8(%rbx), %rdx                                #74.38
        comisd    %xmm1, %xmm0                                  #74.38
        jbe       ..B2.103      # Prob 10%                      #74.38
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.101:                       # Preds ..B2.99 ..B2.101
        movsd     %xmm0, (%rsi)                                 #74.38
        movq      %rdx, %rsi                                    #74.38
        movsd     (%rcx), %xmm0                                 #74.38
        addq      $-8, %rcx                                     #74.38
        addq      $-8, %rdx                                     #74.38
        comisd    %xmm1, %xmm0                                  #74.38
        ja        ..B2.101      # Prob 82%                      #74.38
                                # LOE rdx rcx rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.103:                       # Preds ..B2.101 ..B2.99
        movq      %rbp, (%rsi)                                  #74.38
                                # LOE rbx r12 r13 r14 r15
..B2.104:                       # Preds ..B2.98 ..B2.103
        addq      $8, %rbx                                      #74.38
        cmpq      %r15, %rbx                                    #74.38
        jne       ..B2.96       # Prob 82%                      #74.38
                                # LOE rbx r12 r13 r14 r15
..B2.105:                       # Preds ..B2.104
        movq      (%rsp), %rbx                                  #
        movq      8(%rsp), %rbp                                 #
                                # LOE rbx rbp r12 r13 r15
..B2.106:                       # Preds ..B2.105
        cmpq      %r12, %r15                                    #74.38
        je        ..B2.113      # Prob 2%                       #74.38
                                # LOE rbx rbp r12 r13 r15
..B2.108:                       # Preds ..B2.106 ..B2.112
        movsd     (%r15), %xmm1                                 #74.38
        lea       -16(%r15), %rdx                               #
        movsd     -8(%r15), %xmm0                               #74.38
        lea       -8(%r15), %rax                                #74.38
        movq      (%r15), %rcx                                  #74.38
        movq      %r15, %rsi                                    #74.38
        comisd    %xmm1, %xmm0                                  #74.38
        jbe       ..B2.112      # Prob 10%                      #74.38
                                # LOE rax rdx rcx rbx rbp rsi r12 r13 r15 xmm0 xmm1
..B2.110:                       # Preds ..B2.108 ..B2.110
        movsd     %xmm0, (%rsi)                                 #74.38
        movq      %rax, %rsi                                    #74.38
        movsd     (%rdx), %xmm0                                 #74.38
        addq      $-8, %rdx                                     #74.38
        addq      $-8, %rax                                     #74.38
        comisd    %xmm1, %xmm0                                  #74.38
        ja        ..B2.110      # Prob 82%                      #74.38
                                # LOE rax rdx rcx rbx rbp rsi r12 r13 r15 xmm0 xmm1
..B2.112:                       # Preds ..B2.110 ..B2.108
        addq      $8, %r15                                      #74.38
        movq      %rcx, (%rsi)                                  #74.38
        cmpq      %r12, %r15                                    #74.38
        jne       ..B2.108      # Prob 82%                      #74.38
                                # LOE rbx rbp r12 r13 r15
..B2.113:                       # Preds ..B2.114 ..B2.106 ..B2.112
        movl      28(%rbx), %r8d                                #74.38
        jmp       ..B2.126      # Prob 100%                     #74.38
                                # LOE rbx rbp r13 r8d
..B2.114:                       # Preds ..B2.92
        lea       8(%r14), %r15                                 #74.38
        cmpq      %r12, %r15                                    #74.38
        je        ..B2.113      # Prob 2%                       #74.38
                                # LOE rbx rbp r12 r13 r14 r15
..B2.115:                       # Preds ..B2.114
        movq      %rbp, 8(%rsp)                                 #
                                # LOE rbx r12 r13 r14 r15
..B2.116:                       # Preds ..B2.124 ..B2.115
        movsd     (%r15), %xmm1                                 #74.38
        movsd     (%r14), %xmm0                                 #74.38
        movq      (%r15), %rbp                                  #74.38
        comisd    %xmm1, %xmm0                                  #74.38
        jbe       ..B2.119      # Prob 50%                      #74.38
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.117:                       # Preds ..B2.116
        movq      %r15, %rdx                                    #74.38
        movq      %r14, %rsi                                    #74.38
        subq      %r14, %rdx                                    #74.38
        shrq      $3, %rdx                                      #74.38
        shlq      $3, %rdx                                      #74.38
        movq      %rdx, %rax                                    #74.38
        negq      %rax                                          #74.38
        lea       8(%r15,%rax), %rdi                            #74.38
        call      memmove                                       #74.38
                                # LOE rbx rbp r12 r13 r14 r15
..B2.118:                       # Preds ..B2.117
        movq      %rbp, (%r14)                                  #74.38
        jmp       ..B2.124      # Prob 100%                     #74.38
                                # LOE rbx r12 r13 r14 r15
..B2.119:                       # Preds ..B2.116
        movsd     -8(%r15), %xmm0                               #74.38
        lea       -16(%r15), %rdx                               #
        movq      %r15, %rcx                                    #74.38
        lea       -8(%r15), %rax                                #74.38
        comisd    %xmm1, %xmm0                                  #74.38
        jbe       ..B2.123      # Prob 10%                      #74.38
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.121:                       # Preds ..B2.119 ..B2.121
        movsd     %xmm0, (%rcx)                                 #74.38
        movq      %rax, %rcx                                    #74.38
        movsd     (%rdx), %xmm0                                 #74.38
        addq      $-8, %rdx                                     #74.38
        addq      $-8, %rax                                     #74.38
        comisd    %xmm1, %xmm0                                  #74.38
        ja        ..B2.121      # Prob 82%                      #74.38
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.123:                       # Preds ..B2.121 ..B2.119
        movq      %rbp, (%rcx)                                  #74.38
                                # LOE rbx r12 r13 r14 r15
..B2.124:                       # Preds ..B2.118 ..B2.123
        addq      $8, %r15                                      #74.38
        cmpq      %r12, %r15                                    #74.38
        jne       ..B2.116      # Prob 82%                      #74.38
                                # LOE rbx r12 r13 r14 r15
..B2.125:                       # Preds ..B2.124
        movq      8(%rsp), %rbp                                 #
        movl      28(%rbx), %r8d                                #74.38
                                # LOE rbx rbp r13 r8d
..B2.126:                       # Preds ..B2.113 ..B2.125 ..B2.90
        movl      $1, 24(%rbx)                                  #74.38
                                # LOE rbx rbp r13 r8d
..B2.127:                       # Preds ..B2.126 ..B2.89
        testl     %r8d, %r8d                                    #74.38
        pxor      %xmm0, %xmm0                                  #74.38
        jle       ..B2.144      # Prob 0%                       #74.38
                                # LOE rbx rbp r13 r8d xmm0
..B2.128:                       # Preds ..B2.127
        movslq    %r8d, %rsi                                    #74.38
        movq      8(%rbx), %rdi                                 #74.38
        cmpq      $8, %rsi                                      #74.38
        jl        ..B2.181      # Prob 10%                      #74.38
                                # LOE rbx rbp rsi rdi r13 r8d xmm0
..B2.129:                       # Preds ..B2.128
        movq      %rdi, %rdx                                    #74.38
        andq      $15, %rdx                                     #74.38
        testl     %edx, %edx                                    #74.38
        je        ..B2.132      # Prob 50%                      #74.38
                                # LOE rbx rbp rsi rdi r13 edx r8d xmm0
..B2.130:                       # Preds ..B2.129
        testb     $7, %dl                                       #74.38
        jne       ..B2.181      # Prob 10%                      #74.38
                                # LOE rbx rbp rsi rdi r13 r8d xmm0
..B2.131:                       # Preds ..B2.130
        pushq     $1                                            #74.38
        popq      %rdx                                          #74.38
                                # LOE rbx rbp rsi rdi r13 edx r8d xmm0
..B2.132:                       # Preds ..B2.131 ..B2.129
        movl      %edx, %ecx                                    #74.38
        lea       8(%rcx), %rax                                 #74.38
        cmpq      %rax, %rsi                                    #74.38
        jl        ..B2.181      # Prob 10%                      #74.38
                                # LOE rcx rbx rbp rsi rdi r13 edx r8d xmm0
..B2.133:                       # Preds ..B2.132
        negl      %edx                                          #74.38
        xorl      %eax, %eax                                    #74.38
        addl      %r8d, %edx                                    #74.38
        andl      $7, %edx                                      #74.38
        negl      %edx                                          #74.38
        addl      %r8d, %edx                                    #74.38
        movslq    %edx, %rdx                                    #74.38
        testq     %rcx, %rcx                                    #74.38
        jbe       ..B2.137      # Prob 10%                      #74.38
                                # LOE rax rdx rcx rbx rbp rsi rdi r13 r8d xmm0
..B2.135:                       # Preds ..B2.133 ..B2.135
        addsd     (%rdi,%rax,8), %xmm0                          #74.38
        incq      %rax                                          #74.38
        cmpq      %rcx, %rax                                    #74.38
        jb        ..B2.135      # Prob 82%                      #74.38
                                # LOE rax rdx rcx rbx rbp rsi rdi r13 r8d xmm0
..B2.137:                       # Preds ..B2.135 ..B2.133
        pxor      %xmm1, %xmm1                                  #74.38
        movaps    %xmm1, %xmm2                                  #74.38
        movsd     %xmm0, %xmm2                                  #74.38
                                # LOE rdx rcx rbx rbp rsi rdi r13 r8d xmm1 xmm2
..B2.138:                       # Preds ..B2.138 ..B2.137
        addpd     (%rdi,%rcx,8), %xmm2                          #74.38
        addpd     16(%rdi,%rcx,8), %xmm1                        #74.38
        addpd     32(%rdi,%rcx,8), %xmm2                        #74.38
        addpd     48(%rdi,%rcx,8), %xmm1                        #74.38
        addq      $8, %rcx                                      #74.38
        cmpq      %rdx, %rcx                                    #74.38
        jb        ..B2.138      # Prob 82%                      #74.38
                                # LOE rdx rcx rbx rbp rsi rdi r13 r8d xmm1 xmm2
..B2.139:                       # Preds ..B2.138
        addpd     %xmm1, %xmm2                                  #74.38
        movaps    %xmm2, %xmm0                                  #74.38
        unpckhpd  %xmm2, %xmm0                                  #74.38
        addsd     %xmm0, %xmm2                                  #74.38
        movaps    %xmm2, %xmm0                                  #74.38
                                # LOE rdx rbx rbp rsi rdi r13 r8d xmm0
..B2.140:                       # Preds ..B2.139 ..B2.181
        cmpq      %rsi, %rdx                                    #74.38
        jae       ..B2.144      # Prob 10%                      #74.38
                                # LOE rdx rbx rbp rsi rdi r13 r8d xmm0
..B2.142:                       # Preds ..B2.140 ..B2.142
        addsd     (%rdi,%rdx,8), %xmm0                          #74.38
        incq      %rdx                                          #74.38
        cmpq      %rsi, %rdx                                    #74.38
        jb        ..B2.142      # Prob 82%                      #74.38
                                # LOE rdx rbx rbp rsi rdi r13 r8d xmm0
..B2.144:                       # Preds ..B2.142 ..B2.127 ..B2.140
        cvtsi2sd  %r8d, %xmm1                                   #74.30
        divsd     %xmm1, %xmm0                                  #74.30
        movq      %r13, %rdi                                    #74.30
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.176: #74.30
        call      _ZNSolsEd                                     #74.30
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.177: #
                                # LOE rax rbx rbp
..B2.145:                       # Preds ..B2.144
        movq      %rax, %rdi                                    #74.44
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #74.44
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.178: #74.44
        call      _ZNSolsEPFRSoS_E                              #74.44
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.179: #
                                # LOE rbx rbp
..B2.146:                       # Preds ..B2.145
        movq      %rbp, %rdi                                    #75.10
        movl      $10, %esi                                     #75.10
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.180: #75.10
        call      _ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw #75.10
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.181: #
                                # LOE rax rbx
..B2.147:                       # Preds ..B2.146
        movq      %rax, %rdi                                    #75.20
        movl      $.L_2__STRING.3, %esi                         #75.20
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.182: #75.20
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #75.20
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.183: #
                                # LOE rax rbx
..B2.268:                       # Preds ..B2.147
        movq      %rax, %r14                                    #75.20
                                # LOE rbx r14
..B2.148:                       # Preds ..B2.268
        cmpl      $1, 24(%rbx)                                  #75.37
        je        ..B2.271      # Prob 41%                      #75.37
                                # LOE rbx r14
..B2.149:                       # Preds ..B2.148
        movq      8(%rbx), %r15                                 #75.37
        movslq    28(%rbx), %rax                                #75.37
        lea       (%r15,%rax,8), %r13                           #75.37
        cmpq      %r13, %r15                                    #75.37
        lea       (,%rax,8), %rdx                               #75.37
        je        ..B2.171      # Prob 33%                      #75.37
                                # LOE rdx rbx r13 r14 r15
..B2.150:                       # Preds ..B2.149
        movq      %rdx, %rax                                    #75.37
        movq      %r13, %rsi                                    #75.37
        sarq      $35, %rax                                     #75.37
        sarq      $3, %rdx                                      #75.37
        bsr       %edx, %ecx                                    #75.37
        bsr       %eax, %r12d                                   #75.37
        negl      %ecx                                          #75.37
        negl      %r12d                                         #75.37
        addl      $63, %ecx                                     #75.37
        addl      $31, %r12d                                    #75.37
        testl     %eax, %eax                                    #75.37
        cmove     %ecx, %r12d                                   #75.37
        movslq    %r12d, %r12                                   #75.37
        addq      %r12, %r12                                    #75.37
        negq      %r12                                          #75.37
        addq      $126, %r12                                    #75.37
        cmpq      $16, %rdx                                     #75.37
        jle       ..B2.241      # Prob 5%                       #75.37
                                # LOE rbx rsi r12 r13 r14 r15
..B2.152:                       # Preds ..B2.150 ..B2.183
        movq      %rsi, %r9                                     #75.37
        subq      %r15, %r9                                     #75.37
        sarq      $3, %r9                                       #75.37
        testq     %r12, %r12                                    #75.37
        je        ..B2.206      # Prob 20%                      #75.37
                                # LOE rbx rsi r9 r12 r13 r14 r15
..B2.153:                       # Preds ..B2.152
        movq      %r9, %rax                                     #75.37
        decq      %r12                                          #75.37
        shrq      $63, %rax                                     #75.37
        addq      %rax, %r9                                     #75.37
        shrq      $1, %r9                                       #75.37
        movsd     (%r15), %xmm2                                 #75.37
        movsd     -8(%rsi), %xmm1                               #75.37
        lea       (%r15,%r9,8), %rdx                            #75.37
        movsd     (%rdx), %xmm0                                 #75.37
        comisd    %xmm2, %xmm0                                  #75.37
        jbe       ..B2.157      # Prob 50%                      #75.37
                                # LOE rdx rbx rsi r12 r13 r14 r15 xmm0 xmm1 xmm2
..B2.154:                       # Preds ..B2.153
        comisd    %xmm0, %xmm1                                  #75.37
        ja        ..B2.156      # Prob 28%                      #75.37
                                # LOE rdx rbx rsi r12 r13 r14 r15 xmm1 xmm2
..B2.155:                       # Preds ..B2.154
        comisd    %xmm2, %xmm1                                  #75.37
        movq      %r15, %rbp                                    #75.37
        lea       -8(%rsi), %rdx                                #75.37
        ja        ..B2.160      # Prob 50%                      #75.37
        movq      %r15, %rdx                                    #75.37
        jmp       ..B2.160      # Prob 100%                     #75.37
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15
..B2.156:                       # Preds ..B2.154
        movq      %r15, %rbp                                    #75.37
        jmp       ..B2.160      # Prob 100%                     #75.37
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15
..B2.157:                       # Preds ..B2.153
        comisd    %xmm2, %xmm1                                  #75.37
        ja        ..B2.159      # Prob 28%                      #75.37
                                # LOE rdx rbx rsi r12 r13 r14 r15 xmm0 xmm1
..B2.158:                       # Preds ..B2.157
        comisd    %xmm0, %xmm1                                  #75.37
        movq      %r15, %rbp                                    #75.37
        lea       -8(%rsi), %rax                                #75.37
        jbe       ..B2.160      # Prob 50%                      #75.37
        movq      %rax, %rdx                                    #75.37
        jmp       ..B2.160      # Prob 100%                     #75.37
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15
..B2.159:                       # Preds ..B2.157
        movq      %r15, %rdx                                    #75.37
        movq      %rdx, %rbp                                    #75.37
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15
..B2.160:                       # Preds ..B2.156 ..B2.155 ..B2.159 ..B2.158
        movq      %rsi, %rax                                    #75.37
        movsd     (%rdx), %xmm0                                 #75.37
        jmp       ..B2.161      # Prob 100%                     #75.37
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.170:                       # Preds ..B2.169
        movsd     %xmm2, (%rbp)                                 #75.37
        addq      $8, %rbp                                      #75.37
        movsd     %xmm1, (%rax)                                 #75.37
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.161:                       # Preds ..B2.170 ..B2.160
        movsd     (%rbp), %xmm1                                 #75.37
        comisd    %xmm1, %xmm0                                  #75.37
        jbe       ..B2.165      # Prob 10%                      #75.37
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.163:                       # Preds ..B2.161 ..B2.163
        addq      $8, %rbp                                      #75.37
        movsd     (%rbp), %xmm1                                 #75.37
        comisd    %xmm1, %xmm0                                  #75.37
        ja        ..B2.163      # Prob 82%                      #75.37
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1
..B2.165:                       # Preds ..B2.165 ..B2.163 ..B2.161
        addq      $-8, %rax                                     #75.37
        movsd     (%rax), %xmm2                                 #75.37
        comisd    %xmm0, %xmm2                                  #75.37
        ja        ..B2.165      # Prob 90%                      #75.37
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1 xmm2
..B2.169:                       # Preds ..B2.165
        cmpq      %rax, %rbp                                    #75.37
        jae       ..B2.182      # Prob 20%                      #75.37
        jmp       ..B2.170      # Prob 100%                     #75.37
                                # LOE rax rbx rbp rsi r12 r13 r14 r15 xmm0 xmm1 xmm2
..B2.171:                       # Preds ..B2.205 ..B2.270 ..B2.252 ..B2.241 ..B2.149
                                #      
        movl      $1, 24(%rbx)                                  #75.37
                                # LOE r14 r15
..B2.172:                       # Preds ..B2.271 ..B2.171
        movsd     (%r15), %xmm0                                 #75.29
        movq      %r14, %rdi                                    #75.29
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.184: #75.29
        call      _ZNSolsEd                                     #75.29
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.185: #
                                # LOE rax
..B2.173:                       # Preds ..B2.172
        movq      %rax, %rdi                                    #75.42
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #75.42
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.186: #75.42
        call      _ZNSolsEPFRSoS_E                              #75.42
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.187: #
                                # LOE
..B2.174:                       # Preds ..B2.173
        addq      $24, %rsp                                     #76.3
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.188: #
        popq      %rbp                                          #76.3
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.190: #
        popq      %rbx                                          #76.3
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.192: #
        popq      %r15                                          #76.3
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.194: #
        popq      %r14                                          #76.3
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.196: #
        popq      %r13                                          #76.3
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.198: #
        popq      %r12                                          #76.3
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.200: #
        ret                                                     #76.3
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.201: #
                                # LOE
..B2.181:                       # Preds ..B2.128 ..B2.132 ..B2.130 # Infreq
        xorl      %edx, %edx                                    #74.38
        jmp       ..B2.140      # Prob 100%                     #74.38
                                # LOE rdx rbx rbp rsi rdi r13 r8d xmm0
..B2.182:                       # Preds ..B2.169                # Infreq
        movq      %rbp, %rdi                                    #75.37
        movq      %r12, %rdx                                    #75.37
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.208: #75.37
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_          #75.37
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.209: #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.183:                       # Preds ..B2.182                # Infreq
        movq      %rbp, %rsi                                    #75.37
        subq      %r15, %rbp                                    #75.37
        sarq      $3, %rbp                                      #75.37
        cmpq      $16, %rbp                                     #75.37
        jg        ..B2.152      # Prob 82%                      #75.37
                                # LOE rbx rsi r12 r13 r14 r15
..B2.185:                       # Preds ..B2.220 ..B2.183 ..B2.207 # Infreq
        lea       128(%r15), %r12                               #75.37
                                # LOE rbx r12 r13 r14 r15
..B2.186:                       # Preds ..B2.185                # Infreq
        lea       8(%r15), %rbp                                 #75.37
                                # LOE rbx rbp r12 r13 r14 r15
..B2.187:                       # Preds ..B2.186                # Infreq
        movq      %rbx, (%rsp)                                  #
                                # LOE rbp r12 r13 r14 r15
..B2.188:                       # Preds ..B2.196 ..B2.187       # Infreq
        movsd     (%rbp), %xmm1                                 #75.37
        movsd     (%r15), %xmm0                                 #75.37
        movq      (%rbp), %rbx                                  #75.37
        comisd    %xmm1, %xmm0                                  #75.37
        jbe       ..B2.191      # Prob 50%                      #75.37
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.189:                       # Preds ..B2.188                # Infreq
        movq      %rbp, %rdx                                    #75.37
        movq      %r15, %rsi                                    #75.37
        subq      %r15, %rdx                                    #75.37
        shrq      $3, %rdx                                      #75.37
        shlq      $3, %rdx                                      #75.37
        movq      %rdx, %rax                                    #75.37
        negq      %rax                                          #75.37
        lea       8(%rbp,%rax), %rdi                            #75.37
        call      memmove                                       #75.37
                                # LOE rbx rbp r12 r13 r14 r15
..B2.190:                       # Preds ..B2.189                # Infreq
        movq      %rbx, (%r15)                                  #75.37
        jmp       ..B2.196      # Prob 100%                     #75.37
                                # LOE rbp r12 r13 r14 r15
..B2.191:                       # Preds ..B2.188                # Infreq
        movsd     -8(%rbp), %xmm0                               #75.37
        lea       -16(%rbp), %rdx                               #
        movq      %rbp, %rcx                                    #75.37
        lea       -8(%rbp), %rax                                #75.37
        comisd    %xmm1, %xmm0                                  #75.37
        jbe       ..B2.195      # Prob 10%                      #75.37
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.193:                       # Preds ..B2.191 ..B2.193       # Infreq
        movsd     %xmm0, (%rcx)                                 #75.37
        movq      %rax, %rcx                                    #75.37
        movsd     (%rdx), %xmm0                                 #75.37
        addq      $-8, %rdx                                     #75.37
        addq      $-8, %rax                                     #75.37
        comisd    %xmm1, %xmm0                                  #75.37
        ja        ..B2.193      # Prob 82%                      #75.37
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.195:                       # Preds ..B2.193 ..B2.191       # Infreq
        movq      %rbx, (%rcx)                                  #75.37
                                # LOE rbp r12 r13 r14 r15
..B2.196:                       # Preds ..B2.190 ..B2.195       # Infreq
        addq      $8, %rbp                                      #75.37
        cmpq      %r12, %rbp                                    #75.37
        jne       ..B2.188      # Prob 82%                      #75.37
                                # LOE rbp r12 r13 r14 r15
..B2.197:                       # Preds ..B2.196                # Infreq
        movq      (%rsp), %rbx                                  #
                                # LOE rbx r12 r13 r14
..B2.198:                       # Preds ..B2.197                # Infreq
        cmpq      %r13, %r12                                    #75.37
        je        ..B2.270      # Prob 2%                       #75.37
                                # LOE rbx r12 r13 r14
..B2.200:                       # Preds ..B2.198 ..B2.204       # Infreq
        movsd     (%r12), %xmm1                                 #75.37
        lea       -16(%r12), %rdx                               #
        movsd     -8(%r12), %xmm0                               #75.37
        lea       -8(%r12), %rax                                #75.37
        movq      (%r12), %rcx                                  #75.37
        movq      %r12, %rbp                                    #75.37
        comisd    %xmm1, %xmm0                                  #75.37
        jbe       ..B2.204      # Prob 10%                      #75.37
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 xmm0 xmm1
..B2.202:                       # Preds ..B2.200 ..B2.202       # Infreq
        movsd     %xmm0, (%rbp)                                 #75.37
        movq      %rax, %rbp                                    #75.37
        movsd     (%rdx), %xmm0                                 #75.37
        addq      $-8, %rdx                                     #75.37
        addq      $-8, %rax                                     #75.37
        comisd    %xmm1, %xmm0                                  #75.37
        ja        ..B2.202      # Prob 82%                      #75.37
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 xmm0 xmm1
..B2.204:                       # Preds ..B2.202 ..B2.200       # Infreq
        addq      $8, %r12                                      #75.37
        movq      %rcx, (%rbp)                                  #75.37
        cmpq      %r13, %r12                                    #75.37
        jne       ..B2.200      # Prob 82%                      #75.37
                                # LOE rbx r12 r13 r14
..B2.205:                       # Preds ..B2.204                # Infreq
        movq      8(%rbx), %r15                                 #72.40
        jmp       ..B2.171      # Prob 100%                     #72.40
                                # LOE rbx r14 r15
..B2.206:                       # Preds ..B2.152                # Infreq
        cmpq      $2, %r9                                       #75.37
        jge       ..B2.222      # Prob 72%                      #75.37
                                # LOE rbx rsi r9 r13 r14 r15
..B2.207:                       # Preds ..B2.235 ..B2.206       # Infreq
        movq      %rsi, %r8                                     #
        subq      %r15, %r8                                     #
        cmpq      $1, %r9                                       #75.37
        jle       ..B2.185      # Prob 10%                      #75.37
                                # LOE rbx rsi r8 r13 r14 r15
..B2.208:                       # Preds ..B2.207                # Infreq
        movl      $1, %edi                                      #74.38
                                # LOE rbx rsi r8 r13 r14 r15 edi
..B2.209:                       # Preds ..B2.220 ..B2.208       # Infreq
        addq      $-8, %r8                                      #75.37
        xorl      %r9d, %r9d                                    #75.37
        movq      %r8, %rcx                                     #75.37
        addq      $-8, %rsi                                     #75.37
        sarq      $3, %rcx                                      #75.37
        xorl      %edx, %edx                                    #75.37
        testq     %rcx, %rcx                                    #75.37
        movq      (%r15), %rax                                  #75.37
        cmovle    %edi, %r9d                                    #75.37
        movsd     (%rsi), %xmm0                                 #75.37
        movq      (%rsi), %rbp                                  #75.37
        movq      %rax, (%rsi)                                  #75.37
        xorl      %eax, %eax                                    #75.37
        lea       -1(%rcx,%r9), %r9                             #75.37
        sarq      $1, %r9                                       #75.37
        testq     %r9, %r9                                      #75.37
        jle       ..B2.212      # Prob 10%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi r8 r9 r13 r14 r15 edi xmm0
..B2.211:                       # Preds ..B2.209 ..B2.211       # Infreq
        lea       2(,%rax,2), %r10                              #75.37
        movsd     -8(%r15,%r10,8), %xmm1                        #75.37
        lea       -1(%r10), %rax                                #75.37
        comisd    (%r15,%r10,8), %xmm1                          #75.37
        ja        ..L210        # Prob 50%                      #75.37
        movq      %r10, %rax                                    #75.37
..L210:                                                         #
        movq      (%r15,%rax,8), %r11                           #75.37
        cmpq      %r9, %rax                                     #75.37
        movq      %r11, (%r15,%rdx,8)                           #75.37
        movq      %rax, %rdx                                    #75.37
        jl        ..B2.211      # Prob 82%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi r8 r9 r13 r14 r15 edi xmm0
..B2.212:                       # Preds ..B2.209 ..B2.211       # Infreq
        testq     $1, %rcx                                      #75.37
        jne       ..B2.215      # Prob 40%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi r8 r13 r14 r15 edi xmm0
..B2.213:                       # Preds ..B2.212                # Infreq
        movq      %rcx, %r9                                     #75.37
        xorl      %r10d, %r10d                                  #75.37
        addq      $-2, %r9                                      #75.37
        cmovl     %edi, %r10d                                   #75.37
        lea       -2(%rcx,%r10), %r11                           #75.37
        sarq      $1, %r11                                      #75.37
        cmpq      %r11, %rax                                    #75.37
        jne       ..B2.215      # Prob 38%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi r8 r13 r14 r15 edi xmm0
..B2.214:                       # Preds ..B2.213                # Infreq
        lea       2(,%rax,2), %r9                               #75.37
        movq      -8(%r15,%r9,8), %rax                          #75.37
        movq      %rax, (%r15,%rdx,8)                           #75.37
        lea       -1(%r9), %rdx                                 #75.37
                                # LOE rdx rcx rbx rbp rsi r8 r13 r14 r15 edi xmm0
..B2.215:                       # Preds ..B2.214 ..B2.213 ..B2.212 # Infreq
        lea       -1(%rdx), %rax                                #75.37
        shrq      $63, %rax                                     #75.37
        lea       -1(%rdx,%rax), %rax                           #75.37
        sarq      $1, %rax                                      #75.37
        testq     %rdx, %rdx                                    #75.37
        jle       ..B2.220      # Prob 10%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi r8 r13 r14 r15 edi xmm0
..B2.217:                       # Preds ..B2.215 ..B2.218       # Infreq
        movq      (%r15,%rax,8), %r9                            #75.37
        comisd    (%r15,%rax,8), %xmm0                          #75.37
        jbe       ..B2.220      # Prob 20%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi r8 r9 r13 r14 r15 edi xmm0
..B2.218:                       # Preds ..B2.217                # Infreq
        movq      %r9, (%r15,%rdx,8)                            #75.37
        lea       -1(%rax), %r9                                 #75.37
        shrq      $63, %r9                                      #75.37
        movq      %rax, %rdx                                    #75.37
        lea       -1(%rax,%r9), %rax                            #75.37
        sarq      $1, %rax                                      #75.37
        testq     %rdx, %rdx                                    #75.37
        jg        ..B2.217      # Prob 82%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi r8 r13 r14 r15 edi xmm0
..B2.220:                       # Preds ..B2.217 ..B2.218 ..B2.215 # Infreq
        .byte     144                                           #75.37
        .byte     72                                            #75.37
        .byte     141                                           #75.37
        .byte     116                                           #75.37
        .byte     38                                            #75.37
        .byte     0                                             #75.37
        movq      %rbp, (%r15,%rdx,8)                           #75.37
        cmpq      $1, %rcx                                      #75.37
        jg        ..B2.209      # Prob 82%                      #75.37
        jmp       ..B2.185      # Prob 100%                     #75.37
                                # LOE rbx rsi r8 r13 r14 r15 edi
..B2.222:                       # Preds ..B2.206                # Infreq
        movl      $1, %edx                                      #75.37
        xorl      %ebp, %ebp                                    #75.37
        testq     %r9, %r9                                      #75.37
        movq      %r9, %rax                                     #75.37
        cmovle    %edx, %ebp                                    #75.37
        xorl      %r8d, %r8d                                    #75.37
        addq      $-2, %rax                                     #75.37
        lea       -2(%r9), %rcx                                 #75.37
        cmovl     %edx, %r8d                                    #75.37
        movq      %r9, %rdi                                     #75.37
        shrq      $63, %rcx                                     #75.37
        andq      $1, %rdi                                      #75.37
        lea       -2(%r9,%rcx), %rcx                            #75.37
        sarq      $1, %rcx                                      #75.37
        lea       -1(%r9,%rbp), %rbp                            #75.37
        sarq      $1, %rbp                                      #75.37
        lea       -2(%r9,%r8), %rax                             #75.37
        sarq      $1, %rax                                      #75.37
        jmp       ..B2.223      # Prob 100%                     #75.37
                                # LOE rax rcx rbx rbp rsi rdi r9 r13 r14 r15
..B2.236:                       # Preds ..B2.235                # Infreq
        decq      %rcx                                          #75.37
                                # LOE rax rcx rbx rbp rsi rdi r9 r13 r14 r15
..B2.223:                       # Preds ..B2.236 ..B2.222       # Infreq
        movsd     (%r15,%rcx,8), %xmm0                          #75.37
        movq      %rcx, %rdx                                    #75.37
        movq      (%r15,%rcx,8), %r8                            #75.37
        movq      %rcx, %r10                                    #75.37
        cmpq      %rbp, %rcx                                    #75.37
        jge       ..B2.227      # Prob 10%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r13 r14 r15 xmm0
..B2.225:                       # Preds ..B2.223 ..B2.225       # Infreq
        lea       2(,%r10,2), %r11                              #75.37
        movsd     -8(%r15,%r11,8), %xmm1                        #75.37
        lea       -1(%r11), %r10                                #75.37
        comisd    (%r15,%r11,8), %xmm1                          #75.37
        ja        ..L211        # Prob 50%                      #75.37
        movq      %r11, %r10                                    #75.37
..L211:                                                         #
        movq      (%r15,%r10,8), %r12                           #75.37
        cmpq      %rbp, %r10                                    #75.37
        movq      %r12, (%r15,%rdx,8)                           #75.37
        movq      %r10, %rdx                                    #75.37
        jl        ..B2.225      # Prob 82%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r13 r14 r15 xmm0
..B2.227:                       # Preds ..B2.225 ..B2.223       # Infreq
        testq     %rdi, %rdi                                    #75.37
        jne       ..B2.230      # Prob 40%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r13 r14 r15 xmm0
..B2.228:                       # Preds ..B2.227                # Infreq
        cmpq      %rax, %r10                                    #75.37
        jne       ..B2.230      # Prob 38%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r13 r14 r15 xmm0
..B2.229:                       # Preds ..B2.228                # Infreq
        lea       2(,%r10,2), %r11                              #75.37
        movq      -8(%r15,%r11,8), %r10                         #75.37
        movq      %r10, (%r15,%rdx,8)                           #75.37
        lea       -1(%r11), %rdx                                #75.37
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r13 r14 r15 xmm0
..B2.230:                       # Preds ..B2.229 ..B2.228 ..B2.227 # Infreq
        lea       -1(%rdx), %r10                                #75.37
        shrq      $63, %r10                                     #75.37
        lea       -1(%rdx,%r10), %r10                           #75.37
        sarq      $1, %r10                                      #75.37
        cmpq      %rcx, %rdx                                    #75.37
        jle       ..B2.235      # Prob 10%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r13 r14 r15 xmm0
..B2.232:                       # Preds ..B2.230 ..B2.233       # Infreq
        movq      (%r15,%r10,8), %r11                           #75.37
        comisd    (%r15,%r10,8), %xmm0                          #75.37
        jbe       ..B2.235      # Prob 20%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r13 r14 r15 xmm0
..B2.233:                       # Preds ..B2.232                # Infreq
        movq      %r11, (%r15,%rdx,8)                           #75.37
        lea       -1(%r10), %r11                                #75.37
        shrq      $63, %r11                                     #75.37
        movq      %r10, %rdx                                    #75.37
        lea       -1(%r10,%r11), %r10                           #75.37
        sarq      $1, %r10                                      #75.37
        cmpq      %rcx, %rdx                                    #75.37
        jg        ..B2.232      # Prob 82%                      #75.37
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r13 r14 r15 xmm0
..B2.235:                       # Preds ..B2.232 ..B2.233 ..B2.230 # Infreq
        movq      %r8, (%r15,%rdx,8)                            #75.37
        testq     %rcx, %rcx                                    #75.37
        je        ..B2.207      # Prob 20%                      #75.37
        jmp       ..B2.236      # Prob 100%                     #75.37
                                # LOE rax rcx rbx rbp rsi rdi r9 r13 r14 r15
..B2.241:                       # Preds ..B2.150                # Infreq
        lea       8(%r15), %rbp                                 #75.37
        cmpq      %r13, %rbp                                    #75.37
        je        ..B2.171      # Prob 2%                       #75.37
                                # LOE rbx rbp r13 r14 r15
..B2.243:                       # Preds ..B2.241 ..B2.251       # Infreq
        movsd     (%rbp), %xmm1                                 #75.37
        movsd     (%r15), %xmm0                                 #75.37
        movq      (%rbp), %r12                                  #75.37
        comisd    %xmm1, %xmm0                                  #75.37
        jbe       ..B2.246      # Prob 50%                      #75.37
                                # LOE rbx rbp r12 r13 r14 r15 xmm1
..B2.244:                       # Preds ..B2.243                # Infreq
        movq      %rbp, %rdx                                    #75.37
        movq      %r15, %rsi                                    #75.37
        subq      %r15, %rdx                                    #75.37
        shrq      $3, %rdx                                      #75.37
        shlq      $3, %rdx                                      #75.37
        movq      %rdx, %rax                                    #75.37
        negq      %rax                                          #75.37
        lea       8(%rbp,%rax), %rdi                            #75.37
        call      memmove                                       #75.37
                                # LOE rbx rbp r12 r13 r14 r15
..B2.245:                       # Preds ..B2.244                # Infreq
        movq      %r12, (%r15)                                  #75.37
        jmp       ..B2.251      # Prob 100%                     #75.37
                                # LOE rbx rbp r13 r14 r15
..B2.246:                       # Preds ..B2.243                # Infreq
        movsd     -8(%rbp), %xmm0                               #75.37
        lea       -16(%rbp), %rdx                               #
        movq      %rbp, %rcx                                    #75.37
        lea       -8(%rbp), %rax                                #75.37
        comisd    %xmm1, %xmm0                                  #75.37
        jbe       ..B2.250      # Prob 10%                      #75.37
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.248:                       # Preds ..B2.246 ..B2.248       # Infreq
        movsd     %xmm0, (%rcx)                                 #75.37
        movq      %rax, %rcx                                    #75.37
        movsd     (%rdx), %xmm0                                 #75.37
        addq      $-8, %rdx                                     #75.37
        addq      $-8, %rax                                     #75.37
        comisd    %xmm1, %xmm0                                  #75.37
        ja        ..B2.248      # Prob 82%                      #75.37
                                # LOE rax rdx rcx rbx rbp r12 r13 r14 r15 xmm0 xmm1
..B2.250:                       # Preds ..B2.248 ..B2.246       # Infreq
        movq      %r12, (%rcx)                                  #75.37
                                # LOE rbx rbp r13 r14 r15
..B2.251:                       # Preds ..B2.245 ..B2.250       # Infreq
        addq      $8, %rbp                                      #75.37
        cmpq      %r13, %rbp                                    #75.37
        jne       ..B2.243      # Prob 82%                      #75.37
                                # LOE rbx rbp r13 r14 r15
..B2.252:                       # Preds ..B2.251                # Infreq
        movq      8(%rbx), %r15                                 #72.40
        jmp       ..B2.171      # Prob 100%                     #72.40
                                # LOE rbx r14 r15
..B2.270:                       # Preds ..B2.198                # Infreq
        movq      8(%rbx), %r15                                 #72.40
        jmp       ..B2.171      # Prob 100%                     #72.40
                                # LOE rbx r14 r15
..B2.271:                       # Preds ..B2.148                # Infreq
        movq      8(%rbx), %r15                                 #72.40
        jmp       ..B2.172      # Prob 100%                     #72.40
                                # LOE r14 r15
..B2.272:                       # Preds ..B2.47                 # Infreq
        movq      8(%rbx), %r13                                 #72.40
        jmp       ..B2.85       # Prob 100%                     #72.40
                                # LOE rax rbx rbp r13 r14
..B2.273:                       # Preds ..B2.5                  # Infreq
        movq      8(%rbx), %r13                                 #72.40
        jmp       ..B2.43       # Prob 100%                     #72.40
        .align    16,0x90
..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.212: #
                                # LOE rbx rbp r13 r14 eax
# mark_end;
	.type	_ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc,@function
	.size	_ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc,.-_ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc
	.data
# -- End  _ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc
	.section .text._ZSt16__introsort_loopIPdlEvT_S1_T0_, "xaG",@progbits,_ZSt16__introsort_loopIPdlEvT_S1_T0_,comdat
..TXTST2:
# -- Begin  _ZSt16__introsort_loopIPdlEvT_S1_T0_
# mark_begin;
       .align    16,0x90
	.weak _ZSt16__introsort_loopIPdlEvT_S1_T0_
_ZSt16__introsort_loopIPdlEvT_S1_T0_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B3.1:                         # Preds ..B3.0
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.213:        #2248.5
        pushq     %r12                                          #2248.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.215:        #
        pushq     %r13                                          #2248.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.217:        #
        pushq     %rsi                                          #2248.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.219:        #
        movq      %rsi, %rax                                    #2252.14
        subq      %rdi, %rax                                    #2252.14
        sarq      $3, %rax                                      #2252.23
        cmpq      $16, %rax                                     #2252.33
        jle       ..B3.25       # Prob 5%                       #2252.33
                                # LOE rdx rbx rbp rsi rdi r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1
        movq      %r14, (%rsp)                                  #
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.220:        #
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
        comisd    %xmm2, %xmm0                                  #2262.23
        jbe       ..B3.8        # Prob 50%                      #2262.23
                                # LOE rcx rbx rbp rsi r13 r14 r15 xmm0 xmm1 xmm2
..B3.5:                         # Preds ..B3.4
        comisd    %xmm0, %xmm1                                  #2262.23
        ja        ..B3.7        # Prob 28%                      #2262.23
                                # LOE rcx rbx rbp rsi r13 r14 r15 xmm1 xmm2
..B3.6:                         # Preds ..B3.5
        comisd    %xmm2, %xmm1                                  #2262.23
        movq      %r13, %r12                                    #2262.23
        lea       -8(%rsi), %rcx                                #2268.13
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
                                # LOE rcx rbx rbp rsi r13 r14 r15 xmm0 xmm1
..B3.9:                         # Preds ..B3.8
        comisd    %xmm0, %xmm1                                  #2262.23
        movq      %r13, %r12                                    #2262.23
        lea       -8(%rsi), %rax                                #2268.13
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
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.221:        #2269.4
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_          #2269.4
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.222:        #
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
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.223:        #
                                # LOE rbx rbp r12 r13 r14 r15
..B3.25:                        # Preds ..B3.24 ..B3.1          # Infreq
        popq      %rcx                                          #2272.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.224:        #
        popq      %r13                                          #2272.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.226:        #
        popq      %r12                                          #2272.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.228:        #
        ret                                                     #2272.5
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.229:        #
                                # LOE
..B3.26:                        # Preds ..B3.3                  # Infreq
        movq      (%rsp), %r14                                  #
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.233:        #
        movq      %r13, %rdi                                    #
        cmpq      $2, %rax                                      #2256.8
        jge       ..B3.45       # Prob 72%                      #2256.8
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.234:        #
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
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.235:        #
        popq      %r13                                          #2257.8
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.237:        #
        popq      %r12                                          #2257.8
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.239:        #
        ret                                                     #2257.8
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.240:        #
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
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.243:        #
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r14 r15
# mark_end;
	.type	_ZSt16__introsort_loopIPdlEvT_S1_T0_,@function
	.size	_ZSt16__introsort_loopIPdlEvT_S1_T0_,.-_ZSt16__introsort_loopIPdlEvT_S1_T0_
	.data
# -- End  _ZSt16__introsort_loopIPdlEvT_S1_T0_
	.text
# -- Begin  _Z7latencyi
# mark_begin;
       .align    16,0x90
	.globl _Z7latencyi
_Z7latencyi:
# parameter 1: %edi
..B4.1:                         # Preds ..B4.0
..___tag_value__Z7latencyi.244:                                 #24.22
        pushq     %r12                                          #24.22
..___tag_value__Z7latencyi.246:                                 #
        pushq     %r13                                          #24.22
..___tag_value__Z7latencyi.248:                                 #
        pushq     %r14                                          #24.22
..___tag_value__Z7latencyi.250:                                 #
        pushq     %rbx                                          #24.22
..___tag_value__Z7latencyi.252:                                 #
        pushq     %rbp                                          #24.22
..___tag_value__Z7latencyi.254:                                 #
        subq      $32, %rsp                                     #24.22
..___tag_value__Z7latencyi.256:                                 #
        movl      %edi, %r12d                                   #24.22
        movl      %r12d, %r14d                                  #25.23
        shll      $8, %r14d                                     #25.23
        movslq    %r14d, %rbx                                   #25.23
        shlq      $2, %rbx                                      #25.23
        movq      %rbx, %rdi                                    #25.23
..___tag_value__Z7latencyi.257:                                 #25.23
        call      _Znam                                         #25.23
..___tag_value__Z7latencyi.258:                                 #
                                # LOE rax rbx r15 r12d r14d
..B4.39:                        # Preds ..B4.1
        movq      %rax, %r13                                    #25.23
                                # LOE rbx r13 r15 r12d r14d
..B4.2:                         # Preds ..B4.39
        movq      %r13, %rdi                                    #26.3
        movl      %r14d, %esi                                   #26.3
..___tag_value__Z7latencyi.259:                                 #26.3
        call      _Z7randompPii                                 #26.3
..___tag_value__Z7latencyi.260:                                 #
                                # LOE rbx r13 r15 r12d r14d
..B4.3:                         # Preds ..B4.2
        movq      %rbx, %rdi                                    #27.24
..___tag_value__Z7latencyi.261:                                 #27.24
        call      _Znam                                         #27.24
..___tag_value__Z7latencyi.262:                                 #
                                # LOE rax r13 r15 r12d r14d
..B4.40:                        # Preds ..B4.3
        movq      %rax, %rbx                                    #27.24
                                # LOE rbx r13 r15 r12d r14d
..B4.4:                         # Preds ..B4.40
        xorl      %ebp, %ebp                                    #28.3
        xorl      %ecx, %ecx                                    #
        testl     %r14d, %r14d                                  #28.22
        jle       ..B4.8        # Prob 10%                      #28.22
                                # LOE rcx rbx r13 r15 ebp r12d r14d
..B4.6:                         # Preds ..B4.4 ..B4.6
        incl      %ebp                                          #29.28
        movl      %ebp, %eax                                    #29.34
        cltd                                                    #29.34
        idivl     %r14d                                         #29.34
        movslq    (%r13,%rcx,4), %rdi                           #25.23
        incq      %rcx                                          #29.28
        movslq    %edx, %rdx                                    #29.20
        cmpl      %r14d, %ebp                                   #28.3
        movl      (%r13,%rdx,4), %esi                           #29.20
        movl      %esi, (%rbx,%rdi,4)                           #29.5
        jb        ..B4.6        # Prob 82%                      #28.3
                                # LOE rcx rbx r13 r15 ebp r12d r14d
..B4.8:                         # Preds ..B4.6 ..B4.4
        movl      %r12d, %edi                                   #31.27
        movl      $4096, %esi                                   #31.27
        shll      $14, %edi                                     #31.27
        movslq    %edi, %rdi                                    #31.27
..___tag_value__Z7latencyi.263:                                 #31.27
        call      MKL_malloc                                    #31.27
..___tag_value__Z7latencyi.264:                                 #
                                # LOE rax rbx r13 r15 r12d r14d
..B4.41:                        # Preds ..B4.8
        movq      %rax, %rbp                                    #31.27
                                # LOE rbx rbp r13 r15 r12d r14d
..B4.9:                         # Preds ..B4.41
        testl     %r14d, %r14d                                  #32.24
        jle       ..B4.16       # Prob 50%                      #32.24
                                # LOE rbx rbp r13 r15 r12d r14d
..B4.10:                        # Preds ..B4.9
        movl      %r14d, %edx                                   #32.3
        xorl      %ecx, %ecx                                    #32.3
        shrl      $31, %edx                                     #32.3
        movl      $1, %esi                                      #32.3
        addl      %r14d, %edx                                   #32.3
        xorl      %eax, %eax                                    #
        sarl      $1, %edx                                      #32.3
        testl     %edx, %edx                                    #32.3
        jbe       ..B4.14       # Prob 10%                      #32.3
                                # LOE rbx rbp r13 r15 eax edx ecx esi r12d r14d
..B4.12:                        # Preds ..B4.10 ..B4.12
        movslq    %eax, %rax                                    #33.5
        lea       (%rcx,%rcx), %esi                             #33.5
        movslq    %esi, %rsi                                    #33.24
        incl      %ecx                                          #32.3
        movl      (%rbx,%rsi,4), %edi                           #27.24
        movl      4(%rbx,%rsi,4), %r8d                          #27.24
        movl      %edi, (%rbp,%rax,4)                           #31.27
        movl      %r8d, 64(%rbp,%rax,4)                         #31.27
        addl      $32, %eax                                     #32.3
        cmpl      %edx, %ecx                                    #32.3
        jb        ..B4.12       # Prob 63%                      #32.3
                                # LOE rbx rbp r13 r15 eax edx ecx r12d r14d
..B4.13:                        # Preds ..B4.12
        lea       1(%rcx,%rcx), %esi                            #32.3
                                # LOE rbx rbp r13 r15 esi r12d r14d
..B4.14:                        # Preds ..B4.13 ..B4.10
        cmpl      %r14d, %esi                                   #32.3
        ja        ..B4.16       # Prob 50%                      #32.3
                                # LOE rbx rbp r13 r15 esi r12d r14d
..B4.15:                        # Preds ..B4.14
        movslq    %esi, %rax                                    #33.24
        shll      $4, %esi                                      #33.5
        movslq    %esi, %rsi                                    #33.5
        movl      -4(%rbx,%rax,4), %edx                         #27.24
        movl      %edx, -64(%rbp,%rsi,4)                        #31.27
                                # LOE rbx rbp r13 r15 r12d r14d
..B4.16:                        # Preds ..B4.9 ..B4.14 ..B4.15
        movl      %r12d, %eax                                   #38.25
        xorl      %ecx, %ecx                                    #38.12
        shll      $12, %eax                                     #38.25
        xorl      %edx, %edx                                    #
        testl     %eax, %eax                                    #38.25
        jle       ..B4.20       # Prob 10%                      #38.25
                                # LOE rdx rcx rbx rbp r13 r15 r12d r14d
..B4.17:                        # Preds ..B4.16
        movslq    %r12d, %rax                                   #38.3
        shlq      $12, %rax                                     #38.25
                                # LOE rax rdx rcx rbx rbp r13 r15 r12d r14d
..B4.18:                        # Preds ..B4.18 ..B4.17
        incq      %rcx                                          #38.28
        clflush   (%rdx,%rbp)                                   #39.5
        addq      $4, %rdx                                      #38.28
        cmpq      %rax, %rcx                                    #38.25
        jl        ..B4.18       # Prob 82%                      #38.25
                                # LOE rax rdx rcx rbx rbp r13 r15 r12d r14d
..B4.20:                        # Preds ..B4.18 ..B4.16
        rdtsc                                                   #43.7
        movl      $17, %ecx                                     #41.13
        movl      %edx, 4(%rsp)                                 #43.7
        testl     %r14d, %r14d                                  #44.24
        movl      %eax, (%rsp)                                  #43.7
        jle       ..B4.27       # Prob 50%                      #44.24
                                # LOE rbx rbp r13 r15 ecx r12d r14d
..B4.21:                        # Preds ..B4.20
        movl      %r14d, %eax                                   #44.3
        movl      $1, %esi                                      #44.3
        shrl      $31, %eax                                     #44.3
        xorl      %edx, %edx                                    #44.3
        addl      %r14d, %eax                                   #44.3
        sarl      $1, %eax                                      #44.3
        testl     %eax, %eax                                    #44.3
        jbe       ..B4.25       # Prob 10%                      #44.3
                                # LOE rbx rbp r13 r15 eax edx ecx esi r12d r14d
..B4.23:                        # Preds ..B4.21 ..B4.23
        shll      $4, %ecx                                      #45.27
        incl      %edx                                          #44.3
        movslq    %ecx, %rcx                                    #45.13
        movl      (%rbp,%rcx,4), %esi                           #45.13
        shll      $4, %esi                                      #45.27
        movslq    %esi, %rsi                                    #45.13
        cmpl      %eax, %edx                                    #44.3
        movl      (%rbp,%rsi,4), %ecx                           #45.13
        jb        ..B4.23       # Prob 63%                      #44.3
                                # LOE rbx rbp r13 r15 eax edx ecx r12d r14d
..B4.24:                        # Preds ..B4.23
        lea       1(%rdx,%rdx), %esi                            #44.3
                                # LOE rbx rbp r13 r15 ecx esi r12d r14d
..B4.25:                        # Preds ..B4.24 ..B4.21
        cmpl      %r14d, %esi                                   #44.3
        ja        ..B4.27       # Prob 50%                      #44.3
                                # LOE rbx rbp r13 r15 ecx r12d
..B4.26:                        # Preds ..B4.25
        shll      $4, %ecx                                      #45.27
        movslq    %ecx, %rcx                                    #45.13
        movl      (%rbp,%rcx,4), %ecx                           #45.13
                                # LOE rbx rbp r13 r15 ecx r12d
..B4.27:                        # Preds ..B4.26 ..B4.25 ..B4.20
        rdtsc                                                   #47.23
        movl      (%rsp), %esi                                  #47.19
        subl      4(%rsp), %edx                                 #47.23
        movl      %eax, %eax                                    #47.23
        cmpl      $17, %ecx                                     #48.15
        cvtsi2sdq %rax, %xmm2                                   #47.23
        cvtsi2sdq %rsi, %xmm0                                   #47.23
        cvtsi2sdq %rdx, %xmm1                                   #47.23
        subsd     %xmm0, %xmm2                                  #47.23
        mulsd     .L_2il0floatpacket.735(%rip), %xmm1           #47.23
        addsd     %xmm1, %xmm2                                  #47.23
        movsd     %xmm2, 16(%rsp)                               #47.23
        jne       ..B4.34       # Prob 21%                      #48.15
                                # LOE rbx rbp r13 r15 r12d
..B4.28:                        # Preds ..B4.27
        testq     %r13, %r13                                    #52.12
        je        ..B4.30       # Prob 33%                      #52.12
                                # LOE rbx rbp r13 r15 r12d
..B4.29:                        # Preds ..B4.28
        movq      %r13, %rdi                                    #52.3
        call      _ZdaPv                                        #52.3
                                # LOE rbx rbp r15 r12d
..B4.30:                        # Preds ..B4.29 ..B4.28
        testq     %rbx, %rbx                                    #53.12
        je        ..B4.32       # Prob 33%                      #53.12
                                # LOE rbx rbp r15 r12d
..B4.31:                        # Preds ..B4.30
        movq      %rbx, %rdi                                    #53.3
        call      _ZdaPv                                        #53.3
                                # LOE rbp r15 r12d
..B4.32:                        # Preds ..B4.31 ..B4.30
        movq      %rbp, %rdi                                    #54.3
..___tag_value__Z7latencyi.265:                                 #54.3
        call      MKL_free                                      #54.3
..___tag_value__Z7latencyi.266:                                 #
                                # LOE r15 r12d
..B4.33:                        # Preds ..B4.32
        cvtsi2sd  %r12d, %xmm1                                  #55.21
        movsd     16(%rsp), %xmm0                               #55.17
        mulsd     .L_2il0floatpacket.736(%rip), %xmm0           #55.17
        divsd     %xmm1, %xmm0                                  #55.21
        addq      $32, %rsp                                     #55.21
..___tag_value__Z7latencyi.267:                                 #
        popq      %rbp                                          #55.21
..___tag_value__Z7latencyi.269:                                 #
        popq      %rbx                                          #55.21
..___tag_value__Z7latencyi.271:                                 #
        popq      %r14                                          #55.21
..___tag_value__Z7latencyi.273:                                 #
        popq      %r13                                          #55.21
..___tag_value__Z7latencyi.275:                                 #
        popq      %r12                                          #55.21
..___tag_value__Z7latencyi.277:                                 #
        ret                                                     #55.21
..___tag_value__Z7latencyi.278:                                 #
                                # LOE
..B4.34:                        # Preds ..B4.27
        movl      $_ZSt4cout, %edi                              #49.9
        movl      $.L_2__STRING.4, %esi                         #49.9
..___tag_value__Z7latencyi.284:                                 #49.9
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #49.9
..___tag_value__Z7latencyi.285:                                 #
                                # LOE rax r15
..B4.35:                        # Preds ..B4.34
        movq      %rax, %rdi                                    #49.28
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #49.28
..___tag_value__Z7latencyi.286:                                 #49.28
        call      _ZNSolsEPFRSoS_E                              #49.28
..___tag_value__Z7latencyi.287:                                 #
                                # LOE
..B4.36:                        # Preds ..B4.35
        call      abort                                         #50.5
        .align    16,0x90
..___tag_value__Z7latencyi.288:                                 #
                                # LOE
# mark_end;
	.type	_Z7latencyi,@function
	.size	_Z7latencyi,.-_Z7latencyi
	.data
# -- End  _Z7latencyi
	.text
# -- Begin  _Z7randompPii
# mark_begin;
       .align    16,0x90
	.globl _Z7randompPii
_Z7randompPii:
# parameter 1: %rdi
# parameter 2: %esi
..B5.1:                         # Preds ..B5.0
..___tag_value__Z7randompPii.289:                               #13.33
        subq      $40, %rsp                                     #13.33
..___tag_value__Z7randompPii.291:                               #
        testl     %esi, %esi                                    #14.20
        jle       ..B5.18       # Prob 50%                      #14.20
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi
..B5.2:                         # Preds ..B5.1
        cmpl      $4, %esi                                      #14.3
        jl        ..B5.24       # Prob 10%                      #14.3
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi
..B5.3:                         # Preds ..B5.2
        movq      %rdi, %rdx                                    #14.3
        andq      $15, %rdx                                     #14.3
        testl     %edx, %edx                                    #14.3
        je        ..B5.6        # Prob 50%                      #14.3
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx esi
..B5.4:                         # Preds ..B5.3
        testb     $3, %dl                                       #14.3
        jne       ..B5.24       # Prob 10%                      #14.3
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx esi
..B5.5:                         # Preds ..B5.4
        negl      %edx                                          #14.3
        addl      $16, %edx                                     #14.3
        shrl      $2, %edx                                      #14.3
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx esi
..B5.6:                         # Preds ..B5.5 ..B5.3
        lea       4(%rdx), %eax                                 #14.3
        cmpl      %eax, %esi                                    #14.3
        jl        ..B5.24       # Prob 10%                      #14.3
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx esi
..B5.7:                         # Preds ..B5.6
        movl      %esi, %ecx                                    #14.3
        subl      %edx, %ecx                                    #14.3
        andl      $3, %ecx                                      #14.3
        movslq    %esi, %rax                                    #14.3
        movl      %edx, %r8d                                    #14.3
        subq      %rcx, %rax                                    #14.3
        xorl      %ecx, %ecx                                    #14.3
        testq     %r8, %r8                                      #14.3
        jbe       ..B5.11       # Prob 10%                      #14.3
                                # LOE rax rcx rbx rbp rdi r8 r12 r13 r14 r15 edx esi
..B5.9:                         # Preds ..B5.7 ..B5.9
        movl      %ecx, (%rdi,%rcx,4)                           #13.6
        incq      %rcx                                          #14.3
        cmpq      %r8, %rcx                                     #14.3
        jb        ..B5.9        # Prob 82%                      #14.3
                                # LOE rax rcx rbx rbp rdi r8 r12 r13 r14 r15 edx esi
..B5.11:                        # Preds ..B5.9 ..B5.7
        movl      $4, %ecx                                      #14.3
        lea       1(%rdx), %r9d                                 #14.3
        lea       2(%rdx), %r10d                                #14.3
        movd      %ecx, %xmm0                                   #14.3
        movd      %r9d, %xmm2                                   #14.3
        pshufd    $0, %xmm0, %xmm1                              #14.3
        movd      %edx, %xmm0                                   #14.3
        addl      $3, %edx                                      #14.3
        movd      %r10d, %xmm4                                  #14.3
        punpcklqdq %xmm2, %xmm0                                 #14.3
        movd      %edx, %xmm3                                   #14.3
        punpcklqdq %xmm3, %xmm4                                 #14.3
        shufps    $136, %xmm4, %xmm0                            #14.3
                                # LOE rax rbx rbp rdi r8 r12 r13 r14 r15 esi xmm0 xmm1
..B5.12:                        # Preds ..B5.12 ..B5.11
        movdqa    %xmm0, (%rdi,%r8,4)                           #13.6
        addq      $4, %r8                                       #14.3
        paddd     %xmm1, %xmm0                                  #15.5
        cmpq      %rax, %r8                                     #14.3
        jb        ..B5.12       # Prob 82%                      #14.3
                                # LOE rax rbx rbp rdi r8 r12 r13 r14 r15 esi xmm0 xmm1
..B5.14:                        # Preds ..B5.12 ..B5.24
        movl      %eax, %edx                                    #14.3
        movslq    %eax, %rax                                    #
        cmpl      %esi, %edx                                    #14.3
        jae       ..B5.31       # Prob 10%                      #14.3
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx esi
..B5.16:                        # Preds ..B5.14 ..B5.16
        movl      %edx, (%rdi,%rax,4)                           #13.6
        incl      %edx                                          #14.3
        incq      %rax                                          #14.3
        cmpl      %esi, %edx                                    #14.3
        jb        ..B5.16       # Prob 82%                      #14.3
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx esi
..B5.17:                        # Preds ..B5.16
        testl     %esi, %esi                                    #14.20
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi
..B5.18:                        # Preds ..B5.1 ..B5.31 ..B5.17
        movl      $0, %edx                                      #16.3
        jle       ..B5.23       # Prob 10%                      #16.20
                                # LOE rdx rbx rbp rdi r12 r13 r14 r15 esi
..B5.19:                        # Preds ..B5.18
        movslq    %esi, %rax                                    #16.3
        movq      %r12, 24(%rsp)                                #16.3
..___tag_value__Z7randompPii.292:                               #
        movl      %esi, %r12d                                   #16.3
        movq      %r13, 16(%rsp)                                #16.3
..___tag_value__Z7randompPii.293:                               #
        movq      %rdi, %r13                                    #16.3
        movq      %r14, 8(%rsp)                                 #16.3
..___tag_value__Z7randompPii.294:                               #
        movq      %rdx, %r14                                    #16.3
        movq      %r15, (%rsp)                                  #16.3
..___tag_value__Z7randompPii.295:                               #
        movq      %rax, %r15                                    #16.3
                                # LOE rbx rbp r13 r14 r15 r12d
..B5.20:                        # Preds ..B5.21 ..B5.19
        call      rand                                          #17.13
                                # LOE rbx rbp r13 r14 r15 eax r12d
..B5.21:                        # Preds ..B5.20
        movl      %r14d, %ecx                                   #17.28
        negl      %ecx                                          #17.21
        cltd                                                    #17.25
        addl      %r12d, %ecx                                   #17.21
        idivl     %ecx                                          #17.25
        movl      (%r13,%r14,4), %r8d                           #13.6
        movslq    %edx, %rdx                                    #17.28
        addq      %r14, %rdx                                    #18.16
        movl      (%r13,%rdx,4), %r9d                           #18.16
        movl      %r8d, (%r13,%rdx,4)                           #19.5
        movl      %r9d, (%r13,%r14,4)                           #13.6
        incq      %r14                                          #16.3
        cmpq      %r15, %r14                                    #16.3
        jb        ..B5.20       # Prob 82%                      #16.3
                                # LOE rbx rbp r13 r14 r15 r12d
..B5.22:                        # Preds ..B5.21
        movq      24(%rsp), %r12                                #
..___tag_value__Z7randompPii.296:                               #
        movq      16(%rsp), %r13                                #
..___tag_value__Z7randompPii.297:                               #
        movq      8(%rsp), %r14                                 #
..___tag_value__Z7randompPii.298:                               #
        movq      (%rsp), %r15                                  #
..___tag_value__Z7randompPii.299:                               #
                                # LOE rbx rbp r12 r13 r14 r15
..B5.23:                        # Preds ..B5.22 ..B5.18
        addq      $40, %rsp                                     #22.1
..___tag_value__Z7randompPii.300:                               #
        ret                                                     #22.1
..___tag_value__Z7randompPii.301:                               #
                                # LOE
..B5.24:                        # Preds ..B5.2 ..B5.6 ..B5.4    # Infreq
        xorl      %eax, %eax                                    #14.3
        jmp       ..B5.14       # Prob 100%                     #14.3
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 esi
..B5.31:                        # Preds ..B5.14                 # Infreq
        testl     %esi, %esi                                    #14.20
        jmp       ..B5.18       # Prob 100%                     #14.20
        .align    16,0x90
..___tag_value__Z7randompPii.302:                               #
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi
# mark_end;
	.type	_Z7randompPii,@function
	.size	_Z7randompPii,.-_Z7randompPii
	.data
# -- End  _Z7randompPii
	.section .text._ZN10StatVectorD1Ev, "xaG",@progbits,_ZN10StatVectorD1Ev,comdat
..TXTST3:
# -- Begin  _ZN10StatVectorD1Ev
# mark_begin;
..___tag_value__ZN10StatVectorD1Ev.303:                        #
        .align    16,0x90
	.weak _ZN10StatVectorD1Ev
_ZN10StatVectorD1Ev:
# parameter 1: %rdi
..B6.1:                         # Preds ..B6.0
..___tag_value__ZN10StatVectorD1Ev.304:                         #25.16
        pushq     %rsi                                          #25.16
..___tag_value__ZN10StatVectorD1Ev.306:                         #
        cmpl      $0, 16(%rdi)                                  #25.17
        je        ..B6.3        # Prob 78%                      #25.17
..___tag_value__ZN10StatVectorD1Ev.307:                         #
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B6.2:                         # Preds ..B6.1
        movq      8(%rdi), %rdi                                 #25.17
..___tag_value__ZN10StatVectorD1Ev.308:                         #25.17
        call      MKL_free                                      #25.17
..___tag_value__ZN10StatVectorD1Ev.310:                         #
                                # LOE rbx rbp r12 r13 r14 r15
..B6.3:                         # Preds ..B6.2 ..B6.1
        popq      %rcx                                          #25.17
..___tag_value__ZN10StatVectorD1Ev.312:                         #
        ret                                                     #25.17
        .align    16,0x90
..___tag_value__ZN10StatVectorD1Ev.314:                         #
                                # LOE
# mark_end;
	.type	_ZN10StatVectorD1Ev,@function
	.size	_ZN10StatVectorD1Ev,.-_ZN10StatVectorD1Ev
	.section .gcc_except_table, "a"
	.align 4
_ZN10StatVectorD1Ev$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value__ZN10StatVectorD1Ev.318 - ..___tag_value__ZN10StatVectorD1Ev.317
..___tag_value__ZN10StatVectorD1Ev.317:
	.byte	1
	.uleb128	..___tag_value__ZN10StatVectorD1Ev.316 - ..___tag_value__ZN10StatVectorD1Ev.315
..___tag_value__ZN10StatVectorD1Ev.315:
	.uleb128	..___tag_value__ZN10StatVectorD1Ev.308 - ..___tag_value__ZN10StatVectorD1Ev.304
	.uleb128	..___tag_value__ZN10StatVectorD1Ev.310 - ..___tag_value__ZN10StatVectorD1Ev.308
	.byte	0
	.byte	0
..___tag_value__ZN10StatVectorD1Ev.316:
	.long	0x00000000,0x00000000
..___tag_value__ZN10StatVectorD1Ev.318:
	.data
# -- End  _ZN10StatVectorD1Ev
	.text
# -- Begin  __sti__$E
# mark_begin;
       .align    16,0x90
__sti__$E:
..B7.1:                         # Preds ..B7.0
..___tag_value___sti__$E.319:                                   #
        pushq     %rsi                                          #
..___tag_value___sti__$E.321:                                   #
        movl      $_ZSt8__ioinit, %edi                          #72.25
..___tag_value___sti__$E.322:                                   #72.25
        call      _ZNSt8ios_base4InitC1Ev                       #72.25
..___tag_value___sti__$E.323:                                   #
                                # LOE rbx rbp r12 r13 r14 r15
..B7.2:                         # Preds ..B7.1
        movl      $_ZNSt8ios_base4InitD1Ev, %edi                #72.25
        movl      $_ZSt8__ioinit, %esi                          #72.25
        movl      $__dso_handle, %edx                           #72.25
        xorl      %eax, %eax                                    #72.25
..___tag_value___sti__$E.324:                                   #72.25
        call      __cxa_atexit                                  #72.25
..___tag_value___sti__$E.325:                                   #
                                # LOE rbx rbp r12 r13 r14 r15
..B7.3:                         # Preds ..B7.2
        popq      %rcx                                          #72.25
..___tag_value___sti__$E.326:                                   #
        ret                                                     #72.25
        .align    16,0x90
..___tag_value___sti__$E.327:                                   #
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
	.space 4, 0x00 	# pad
	.align 8
.L_2il0floatpacket.735:
	.long	0x00000000,0x41f00000
	.type	.L_2il0floatpacket.735,@object
	.size	.L_2il0floatpacket.735,8
	.align 8
.L_2il0floatpacket.736:
	.long	0x00000000,0x3f700000
	.type	.L_2il0floatpacket.736,@object
	.size	.L_2il0floatpacket.736,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.5:
	.byte	108
	.byte	97
	.byte	116
	.byte	101
	.byte	110
	.byte	99
	.byte	121
	.byte	95
	.byte	99
	.byte	108
	.byte	102
	.byte	108
	.byte	117
	.byte	115
	.byte	104
	.byte	46
	.byte	116
	.byte	120
	.byte	116
	.byte	0
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,20
	.align 4
.L_2__STRING.6:
	.byte	32
	.byte	112
	.byte	97
	.byte	103
	.byte	101
	.byte	115
	.byte	0
	.type	.L_2__STRING.6,@object
	.size	.L_2__STRING.6,7
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.7:
	.byte	108
	.byte	97
	.byte	116
	.byte	101
	.byte	110
	.byte	99
	.byte	121
	.byte	32
	.byte	61
	.byte	32
	.byte	0
	.type	.L_2__STRING.7,@object
	.size	.L_2__STRING.7,11
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.byte	109
	.byte	101
	.byte	100
	.byte	105
	.byte	97
	.byte	110
	.byte	58
	.byte	32
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,9
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.byte	109
	.byte	97
	.byte	120
	.byte	58
	.byte	32
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,6
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.byte	109
	.byte	101
	.byte	97
	.byte	110
	.byte	58
	.byte	32
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,7
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.byte	109
	.byte	105
	.byte	110
	.byte	58
	.byte	32
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,6
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.4:
	.byte	115
	.byte	111
	.byte	109
	.byte	101
	.byte	116
	.byte	104
	.byte	105
	.byte	110
	.byte	103
	.byte	32
	.byte	119
	.byte	114
	.byte	111
	.byte	110
	.byte	103
	.byte	0
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,16
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
	.8byte 0x4c507a0100000000
	.4byte 0x10780100
	.2byte 0x000a
	.8byte __gxx_personality_v0
	.4byte 0x08070c00
	.2byte 0x0190
	.4byte 0x0000001c
	.8byte 0x00507a0100000000
	.4byte 0x09107801
	.byte 0x00
	.8byte __gxx_personality_v0
	.4byte 0x9008070c
	.2byte 0x0001
	.byte 0x00
	.4byte 0x0000011c
	.4byte 0x00000044
	.8byte ..___tag_value_main.4
	.8byte ..___tag_value_main.126-..___tag_value_main.4
	.byte 0x08
	.8byte main$$LSDA
	.byte 0x04
	.4byte ..___tag_value_main.6-..___tag_value_main.4
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.7-..___tag_value_main.6
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.9-..___tag_value_main.7
	.8byte 0xff800d1c380e0c10
	.8byte 0xfffffff80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.10-..___tag_value_main.9
	.8byte 0xff800d1c380e0d10
	.8byte 0xfffffff00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.11-..___tag_value_main.10
	.8byte 0xff800d1c380e0f10
	.8byte 0xffffffe80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.12-..___tag_value_main.11
	.8byte 0xff800d1c380e0310
	.8byte 0xffffffe00d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.75-..___tag_value_main.12
	.2byte 0x04c3
	.4byte ..___tag_value_main.77-..___tag_value_main.75
	.2byte 0x04cf
	.4byte ..___tag_value_main.78-..___tag_value_main.77
	.2byte 0x04cd
	.4byte ..___tag_value_main.79-..___tag_value_main.78
	.2byte 0x04cc
	.4byte ..___tag_value_main.80-..___tag_value_main.79
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.82-..___tag_value_main.80
	.8byte 0x1c380e031010060c
	.8byte 0xe00d1affffff800d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffff800d1c380e
	.8byte 0x1022fffffff80d1a
	.8byte 0xffff800d1c380e0d
	.8byte 0x22fffffff00d1aff
	.8byte 0xff800d1c380e0f10
	.8byte 0xffffffe80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.119-..___tag_value_main.82
	.2byte 0x04c3
	.4byte ..___tag_value_main.121-..___tag_value_main.119
	.2byte 0x04cf
	.4byte ..___tag_value_main.122-..___tag_value_main.121
	.2byte 0x04cd
	.4byte ..___tag_value_main.123-..___tag_value_main.122
	.2byte 0x04cc
	.4byte ..___tag_value_main.124-..___tag_value_main.123
	.8byte 0x00000000c608070c
	.2byte 0x0000
	.4byte 0x0000009c
	.4byte 0x00000144
	.8byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.131
	.8byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.212-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.131
	.2byte 0x0400
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.133-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.131
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.135-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.133
	.4byte 0x180e038d
	.byte 0x04
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.137-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.135
	.4byte 0x200e048e
	.byte 0x04
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.139-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.137
	.4byte 0x280e058f
	.byte 0x04
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.141-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.139
	.4byte 0x300e0683
	.byte 0x04
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.143-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.141
	.4byte 0x380e0786
	.byte 0x04
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.145-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.143
	.2byte 0x500e
	.byte 0x04
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.188-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.145
	.4byte 0x04c6380e
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.190-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.188
	.4byte 0x04c3300e
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.192-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.190
	.4byte 0x04cf280e
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.194-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.192
	.4byte 0x04ce200e
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.196-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.194
	.4byte 0x04cd180e
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.198-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.196
	.4byte 0x04cc100e
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.200-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.198
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.201-..___tag_value__ZN10StatVector5printERSt14basic_ofstreamIcSt11char_traitsIcEEPKc.200
	.8byte 0x028c07860683500e
	.4byte 0x048e038d
	.2byte 0x058f
	.4byte 0x00000094
	.4byte 0x000001e4
	.8byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.213
	.8byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.243-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.213
	.2byte 0x0400
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.215-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.213
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.217-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.215
	.4byte 0x180e038d
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.219-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.217
	.2byte 0x200e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.220-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.219
	.2byte 0x048e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.223-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.220
	.2byte 0x04ce
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.224-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.223
	.4byte 0x04cd180e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.226-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.224
	.4byte 0x04cc100e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.228-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.226
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.229-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.228
	.8byte 0x048e038d028c200e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.233-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.229
	.2byte 0x04ce
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.234-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.233
	.2byte 0x048e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.235-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.234
	.4byte 0x04cd180e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.237-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.235
	.4byte 0x04cc100e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.239-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.237
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.240-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.239
	.8byte 0x0000038d028c200e
	.4byte 0x00000000
	.4byte 0x0000008c
	.4byte 0x0000027c
	.8byte ..___tag_value__Z7latencyi.244
	.8byte ..___tag_value__Z7latencyi.288-..___tag_value__Z7latencyi.244
	.2byte 0x0400
	.4byte ..___tag_value__Z7latencyi.246-..___tag_value__Z7latencyi.244
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__Z7latencyi.248-..___tag_value__Z7latencyi.246
	.4byte 0x180e038d
	.byte 0x04
	.4byte ..___tag_value__Z7latencyi.250-..___tag_value__Z7latencyi.248
	.4byte 0x200e048e
	.byte 0x04
	.4byte ..___tag_value__Z7latencyi.252-..___tag_value__Z7latencyi.250
	.4byte 0x280e0583
	.byte 0x04
	.4byte ..___tag_value__Z7latencyi.254-..___tag_value__Z7latencyi.252
	.4byte 0x300e0686
	.byte 0x04
	.4byte ..___tag_value__Z7latencyi.256-..___tag_value__Z7latencyi.254
	.2byte 0x500e
	.byte 0x04
	.4byte ..___tag_value__Z7latencyi.267-..___tag_value__Z7latencyi.256
	.4byte 0x04c6300e
	.4byte ..___tag_value__Z7latencyi.269-..___tag_value__Z7latencyi.267
	.4byte 0x04c3280e
	.4byte ..___tag_value__Z7latencyi.271-..___tag_value__Z7latencyi.269
	.4byte 0x04ce200e
	.4byte ..___tag_value__Z7latencyi.273-..___tag_value__Z7latencyi.271
	.4byte 0x04cd180e
	.4byte ..___tag_value__Z7latencyi.275-..___tag_value__Z7latencyi.273
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z7latencyi.277-..___tag_value__Z7latencyi.275
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7latencyi.278-..___tag_value__Z7latencyi.277
	.8byte 0x028c06860583500e
	.4byte 0x048e038d
	.2byte 0x0000
	.byte 0x00
	.4byte 0x00000064
	.4byte 0x0000030c
	.8byte ..___tag_value__Z7randompPii.289
	.8byte ..___tag_value__Z7randompPii.302-..___tag_value__Z7randompPii.289
	.2byte 0x0400
	.4byte ..___tag_value__Z7randompPii.291-..___tag_value__Z7randompPii.289
	.2byte 0x300e
	.byte 0x04
	.4byte ..___tag_value__Z7randompPii.292-..___tag_value__Z7randompPii.291
	.2byte 0x038c
	.byte 0x04
	.4byte ..___tag_value__Z7randompPii.293-..___tag_value__Z7randompPii.292
	.2byte 0x048d
	.byte 0x04
	.4byte ..___tag_value__Z7randompPii.294-..___tag_value__Z7randompPii.293
	.2byte 0x058e
	.byte 0x04
	.4byte ..___tag_value__Z7randompPii.295-..___tag_value__Z7randompPii.294
	.2byte 0x068f
	.byte 0x04
	.4byte ..___tag_value__Z7randompPii.296-..___tag_value__Z7randompPii.295
	.2byte 0x04cc
	.4byte ..___tag_value__Z7randompPii.297-..___tag_value__Z7randompPii.296
	.2byte 0x04cd
	.4byte ..___tag_value__Z7randompPii.298-..___tag_value__Z7randompPii.297
	.2byte 0x04ce
	.4byte ..___tag_value__Z7randompPii.299-..___tag_value__Z7randompPii.298
	.2byte 0x04cf
	.4byte ..___tag_value__Z7randompPii.300-..___tag_value__Z7randompPii.299
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7randompPii.301-..___tag_value__Z7randompPii.300
	.8byte 0x000000000000300e
	.4byte 0x0000002c
	.4byte 0x00000394
	.8byte ..___tag_value__ZN10StatVectorD1Ev.304
	.8byte ..___tag_value__ZN10StatVectorD1Ev.314-..___tag_value__ZN10StatVectorD1Ev.304
	.byte 0x08
	.8byte _ZN10StatVectorD1Ev$$LSDA
	.byte 0x04
	.4byte ..___tag_value__ZN10StatVectorD1Ev.306-..___tag_value__ZN10StatVectorD1Ev.304
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__ZN10StatVectorD1Ev.312-..___tag_value__ZN10StatVectorD1Ev.306
	.2byte 0x080e
	.byte 0x00
	.4byte 0x00000024
	.4byte 0x000003a4
	.8byte ..___tag_value___sti__$E.319
	.8byte ..___tag_value___sti__$E.327-..___tag_value___sti__$E.319
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.321-..___tag_value___sti__$E.319
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.326-..___tag_value___sti__$E.321
	.2byte 0x080e
	.byte 0x00
# End
