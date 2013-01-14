# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-O3 -DNDEBUG -prec-div -no-ftz -fno-inline-functions -restrict -S";
	.file "fusion.cpp"
	.text
..TXTST0:
# -- Begin  main
# mark_begin;
       .align    16,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0
..___tag_value_main.1:                                          #20.11
        pushq     %rbp                                          #20.11
..___tag_value_main.3:                                          #
        movq      %rsp, %rbp                                    #20.11
..___tag_value_main.4:                                          #
        andq      $-128, %rsp                                   #20.11
        pushq     %rbx                                          #20.11
..___tag_value_main.6:                                          #
        subq      $120, %rsp                                    #20.11
        xorl      %edi, %edi                                    #20.11
..___tag_value_main.7:                                          #20.11
        call      __intel_new_proc_init                         #20.11
..___tag_value_main.8:                                          #
                                # LOE r12 r13 r14 r15
..B1.23:                        # Preds ..B1.1
        movl      $_ZSt4cout, %edi                              #21.7
        movl      $.L_2__STRING.0, %esi                         #21.7
..___tag_value_main.9:                                          #21.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #21.7
..___tag_value_main.10:                                         #
                                # LOE r12 r13 r14 r15
..B1.2:                         # Preds ..B1.23
        movl      $_ZSt3cin, %edi                               #23.6
        lea       (%rsp), %rsi                                  #23.6
..___tag_value_main.11:                                         #23.6
        call      _ZNSirsERd                                    #23.6
..___tag_value_main.12:                                         #
                                # LOE r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
        movl      $_ZSt4cout, %edi                              #24.7
        movl      $.L_2__STRING.1, %esi                         #24.7
..___tag_value_main.13:                                         #24.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #24.7
..___tag_value_main.14:                                         #
                                # LOE r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
        movl      $_ZSt3cin, %edi                               #26.6
        lea       24(%rsp), %rsi                                #26.6
..___tag_value_main.15:                                         #26.6
        call      _ZNSirsERi                                    #26.6
..___tag_value_main.16:                                         #
                                # LOE r12 r13 r14 r15
..B1.5:                         # Preds ..B1.4
        movsd     (%rsp), %xmm0                                 #28.3
        lea       8(%rsp), %rsi                                 #28.3
        movl      24(%rsp), %edi                                #28.3
        lea       16(%rsp), %rdx                                #28.3
..___tag_value_main.17:                                         #28.3
        call      _Z6sincosdiRdS_                               #28.3
..___tag_value_main.18:                                         #
                                # LOE r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5
        movq      _ZSt4cout(%rip), %rax                         #29.3
        movl      $_ZSt4cout, %edi                              #31.7
        movl      $.L_2__STRING.2, %esi                         #31.7
        movq      -24(%rax), %rdx                               #29.3
        movq      $15, 8+_ZSt4cout(%rdx)                        #29.8
        movq      _ZSt4cout(%rip), %rcx                         #30.3
        movq      -24(%rcx), %r8                                #30.3
        movl      24+_ZSt4cout(%r8), %ebx                       #30.8
        andl      $-261, %ebx                                   #30.8
        orl       $256, %ebx                                    #30.8
        movl      %ebx, 24+_ZSt4cout(%r8)                       #30.8
..___tag_value_main.19:                                         #31.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #31.7
..___tag_value_main.20:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6
        movq      %rax, %rdi                                    #31.20
        movl      $25, %esi                                     #31.20
..___tag_value_main.21:                                         #31.20
        call      _ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw #31.20
..___tag_value_main.22:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7
        movsd     16(%rsp), %xmm0                               #31.30
        movq      %rax, %rdi                                    #31.30
..___tag_value_main.23:                                         #31.30
        call      _ZNSolsEd                                     #31.30
..___tag_value_main.24:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.9:                         # Preds ..B1.8
        movq      %rax, %rdi                                    #31.33
        movl      $.L_2__STRING.3, %esi                         #31.33
..___tag_value_main.25:                                         #31.33
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #31.33
..___tag_value_main.26:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9
        movq      %rax, %rdi                                    #31.38
        movl      $25, %esi                                     #31.38
..___tag_value_main.27:                                         #31.38
        call      _ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw #31.38
..___tag_value_main.28:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.28:                        # Preds ..B1.10
        movq      %rax, %rbx                                    #31.38
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.28
        movsd     (%rsp), %xmm0                                 #31.50
        call      sin                                           #31.50
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.30:                        # Preds ..B1.11
        movq      %rbx, %rdi                                    #31.48
..___tag_value_main.29:                                         #31.48
        call      _ZNSolsEd                                     #31.48
..___tag_value_main.30:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.12:                        # Preds ..B1.30
        movq      %rax, %rdi                                    #31.56
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #31.56
..___tag_value_main.31:                                         #31.56
        call      _ZNSolsEPFRSoS_E                              #31.56
..___tag_value_main.32:                                         #
                                # LOE r12 r13 r14 r15
..B1.13:                        # Preds ..B1.12
        movl      $_ZSt4cout, %edi                              #32.7
        movl      $.L_2__STRING.4, %esi                         #32.7
..___tag_value_main.33:                                         #32.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #32.7
..___tag_value_main.34:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.14:                        # Preds ..B1.13
        movq      %rax, %rdi                                    #32.20
        movl      $25, %esi                                     #32.20
..___tag_value_main.35:                                         #32.20
        call      _ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw #32.20
..___tag_value_main.36:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.15:                        # Preds ..B1.14
        movsd     8(%rsp), %xmm0                                #32.30
        movq      %rax, %rdi                                    #32.30
..___tag_value_main.37:                                         #32.30
        call      _ZNSolsEd                                     #32.30
..___tag_value_main.38:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.16:                        # Preds ..B1.15
        movq      %rax, %rdi                                    #32.33
        movl      $.L_2__STRING.3, %esi                         #32.33
..___tag_value_main.39:                                         #32.33
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #32.33
..___tag_value_main.40:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.17:                        # Preds ..B1.16
        movq      %rax, %rdi                                    #32.38
        movl      $25, %esi                                     #32.38
..___tag_value_main.41:                                         #32.38
        call      _ZStlsIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_St5_Setw #32.38
..___tag_value_main.42:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.35:                        # Preds ..B1.17
        movq      %rax, %rbx                                    #32.38
                                # LOE rbx r12 r13 r14 r15
..B1.18:                        # Preds ..B1.35
        movsd     (%rsp), %xmm0                                 #32.50
        call      cos                                           #32.50
                                # LOE rbx r12 r13 r14 r15 xmm0
..B1.37:                        # Preds ..B1.18
        movq      %rbx, %rdi                                    #32.48
..___tag_value_main.43:                                         #32.48
        call      _ZNSolsEd                                     #32.48
..___tag_value_main.44:                                         #
                                # LOE rax r12 r13 r14 r15
..B1.19:                        # Preds ..B1.37
        movq      %rax, %rdi                                    #32.56
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi #32.56
..___tag_value_main.45:                                         #32.56
        call      _ZNSolsEPFRSoS_E                              #32.56
..___tag_value_main.46:                                         #
                                # LOE r12 r13 r14 r15
..B1.20:                        # Preds ..B1.19
        xorl      %eax, %eax                                    #33.1
        addq      $120, %rsp                                    #33.1
..___tag_value_main.47:                                         #33.1
        popq      %rbx                                          #33.1
        movq      %rbp, %rsp                                    #33.1
        popq      %rbp                                          #33.1
..___tag_value_main.48:                                         #
        ret                                                     #33.1
        .align    16,0x90
..___tag_value_main.50:                                         #
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.data
# -- End  main
	.text
# -- Begin  _Z6sincosdiRdS_
# mark_begin;
       .align    16,0x90
	.globl _Z6sincosdiRdS_
_Z6sincosdiRdS_:
# parameter 1: %xmm0
# parameter 2: %edi
# parameter 3: %rsi
# parameter 4: %rdx
..B2.1:                         # Preds ..B2.0
..___tag_value__Z6sincosdiRdS_.51:                              #6.51
        xorl      %eax, %eax                                    #9.3
        pxor      %xmm4, %xmm4                                  #7.7
        xorl      %ecx, %ecx                                    #9.3
        movsd     .L_2il0floatpacket.52(%rip), %xmm2            #8.13
        movaps    %xmm4, %xmm3                                  #7.3
        testl     %edi, %edi                                    #9.18
        jle       ..B2.11       # Prob 10%                      #9.18
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 eax ecx edi xmm0 xmm2 xmm3 xmm4
..B2.2:                         # Preds ..B2.1
        movaps    %xmm0, %xmm1                                  #11.14
        mulsd     %xmm0, %xmm1                                  #11.14
        .align    16,0x90
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 eax ecx edi xmm0 xmm1 xmm2 xmm3 xmm4
..B2.3:                         # Preds ..B2.3 ..B2.2
        pxor      %xmm6, %xmm6                                  #11.21
        addsd     %xmm2, %xmm3                                  #10.5
        cvtsi2sd  %eax, %xmm6                                   #11.21
        movsd     .L_2il0floatpacket.50(%rip), %xmm5            #11.21
        pxor      %xmm8, %xmm8                                  #11.14
        movsd     .L_2il0floatpacket.52(%rip), %xmm7            #11.31
        incl      %eax                                          #9.3
        cmpl      %edi, %eax                                    #9.3
        addsd     %xmm6, %xmm5                                  #11.21
        subsd     %xmm1, %xmm8                                  #11.14
        addsd     %xmm6, %xmm7                                  #11.31
        addsd     %xmm6, %xmm5                                  #11.23
        addsd     %xmm6, %xmm7                                  #11.33
        divsd     %xmm5, %xmm8                                  #11.23
        divsd     %xmm7, %xmm8                                  #11.33
        mulsd     %xmm8, %xmm2                                  #11.5
        jb        ..B2.3        # Prob 82%                      #9.3
                                # LOE rdx rbx rbp rsi r12 r13 r14 r15 eax ecx edi xmm0 xmm1 xmm2 xmm3 xmm4
..B2.4:                         # Preds ..B2.3
        movsd     %xmm3, (%rsi)                                 #10.5
        testl     %edi, %edi                                    #10.5
                                # LOE rdx rbx rbp r12 r13 r14 r15 ecx edi xmm0 xmm4
..B2.5:                         # Preds ..B2.4
        jle       ..B2.10       # Prob 10%                      #14.18
                                # LOE rdx rbx rbp r12 r13 r14 r15 ecx edi xmm0 xmm4
..B2.6:                         # Preds ..B2.11 ..B2.5
        movaps    %xmm0, %xmm1                                  #16.14
        mulsd     %xmm0, %xmm1                                  #16.14
        .align    16,0x90
                                # LOE rdx rbx rbp r12 r13 r14 r15 ecx edi xmm0 xmm1 xmm4
..B2.7:                         # Preds ..B2.7 ..B2.6
        pxor      %xmm3, %xmm3                                  #16.21
        addsd     %xmm0, %xmm4                                  #15.5
        cvtsi2sd  %ecx, %xmm3                                   #16.21
        movsd     .L_2il0floatpacket.51(%rip), %xmm2            #16.21
        pxor      %xmm6, %xmm6                                  #16.14
        movsd     .L_2il0floatpacket.50(%rip), %xmm5            #16.31
        incl      %ecx                                          #14.3
        cmpl      %edi, %ecx                                    #14.3
        addsd     %xmm3, %xmm2                                  #16.21
        subsd     %xmm1, %xmm6                                  #16.14
        addsd     %xmm3, %xmm5                                  #16.31
        addsd     %xmm3, %xmm2                                  #16.23
        addsd     %xmm3, %xmm5                                  #16.33
        divsd     %xmm2, %xmm6                                  #16.23
        divsd     %xmm5, %xmm6                                  #16.33
        mulsd     %xmm6, %xmm0                                  #16.5
        jb        ..B2.7        # Prob 82%                      #14.3
                                # LOE rdx rbx rbp r12 r13 r14 r15 ecx edi xmm0 xmm1 xmm4
..B2.8:                         # Preds ..B2.7
        movsd     %xmm4, (%rdx)                                 #15.5
                                # LOE rbx rbp r12 r13 r14 r15
..B2.9:                         # Preds ..B2.8
        ret                                                     #18.1
                                # LOE
..B2.10:                        # Preds ..B2.11 ..B2.5          # Infreq
        xorl      %eax, %eax                                    #15.5
        movq      %rax, (%rdx)                                  #15.5
        ret                                                     #15.5
                                # LOE rbx rbp r12 r13 r14 r15
..B2.11:                        # Preds ..B2.1                  # Infreq
        movl      $0, %eax                                      #10.5
        movq      %rax, (%rsi)                                  #10.5
        jg        ..B2.6        # Prob 90%                      #10.5
        jmp       ..B2.10       # Prob 100%                     #10.5
        .align    16,0x90
..___tag_value__Z6sincosdiRdS_.53:                              #
                                # LOE rdx rbx rbp r12 r13 r14 r15 ecx edi xmm0 xmm4
# mark_end;
	.type	_Z6sincosdiRdS_,@function
	.size	_Z6sincosdiRdS_,.-_Z6sincosdiRdS_
	.data
# -- End  _Z6sincosdiRdS_
	.text
# -- Begin  __sti__$E
# mark_begin;
       .align    16,0x90
__sti__$E:
..B3.1:                         # Preds ..B3.0
..___tag_value___sti__$E.54:                                    #
        pushq     %rsi                                          #
..___tag_value___sti__$E.56:                                    #
        movl      $_ZSt8__ioinit, %edi                          #72.25
..___tag_value___sti__$E.57:                                    #72.25
        call      _ZNSt8ios_base4InitC1Ev                       #72.25
..___tag_value___sti__$E.58:                                    #
                                # LOE rbx rbp r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1
        movl      $_ZNSt8ios_base4InitD1Ev, %edi                #72.25
        movl      $_ZSt8__ioinit, %esi                          #72.25
        movl      $__dso_handle, %edx                           #72.25
        xorl      %eax, %eax                                    #72.25
..___tag_value___sti__$E.59:                                    #72.25
        call      __cxa_atexit                                  #72.25
..___tag_value___sti__$E.60:                                    #
                                # LOE rbx rbp r12 r13 r14 r15
..B3.3:                         # Preds ..B3.2
        popq      %rcx                                          #72.25
..___tag_value___sti__$E.61:                                    #
        ret                                                     #72.25
        .align    16,0x90
..___tag_value___sti__$E.62:                                    #
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
	.align 8
	.align 8
.L_2il0floatpacket.50:
	.long	0x00000000,0x40000000
	.type	.L_2il0floatpacket.50,@object
	.size	.L_2il0floatpacket.50,8
	.align 8
.L_2il0floatpacket.51:
	.long	0x00000000,0x40080000
	.type	.L_2il0floatpacket.51,@object
	.size	.L_2il0floatpacket.51,8
	.align 8
.L_2il0floatpacket.52:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.52,@object
	.size	.L_2il0floatpacket.52,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.byte	100
	.byte	111
	.byte	117
	.byte	98
	.byte	108
	.byte	101
	.byte	32
	.byte	120
	.byte	32
	.byte	61
	.byte	32
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,12
	.align 4
.L_2__STRING.1:
	.byte	105
	.byte	110
	.byte	116
	.byte	32
	.byte	110
	.byte	32
	.byte	61
	.byte	32
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,9
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.byte	115
	.byte	105
	.byte	110
	.byte	40
	.byte	120
	.byte	41
	.byte	32
	.byte	61
	.byte	32
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,10
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.byte	32
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,2
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.4:
	.byte	99
	.byte	111
	.byte	115
	.byte	40
	.byte	120
	.byte	41
	.byte	32
	.byte	61
	.byte	32
	.byte	0
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,10
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
	.8byte ..___tag_value_main.50-..___tag_value_main.1
	.2byte 0x0400
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.6-..___tag_value_main.4
	.8byte 0xff800d1c380e0310
	.8byte 0xfffffff80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.47-..___tag_value_main.6
	.2byte 0x04c3
	.4byte ..___tag_value_main.48-..___tag_value_main.47
	.4byte 0xc608070c
	.byte 0x00
	.4byte 0x0000001c
	.4byte 0x00000074
	.8byte ..___tag_value__Z6sincosdiRdS_.51
	.8byte ..___tag_value__Z6sincosdiRdS_.53-..___tag_value__Z6sincosdiRdS_.51
	.8byte 0x0000000000000000
	.4byte 0x00000024
	.4byte 0x00000094
	.8byte ..___tag_value___sti__$E.54
	.8byte ..___tag_value___sti__$E.62-..___tag_value___sti__$E.54
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.56-..___tag_value___sti__$E.54
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.61-..___tag_value___sti__$E.56
	.2byte 0x080e
	.byte 0x00
# End
