# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-O3 -prec-div -no-ftz -fno-inline-functions -DNDEBUG -S";
	.file "aitken.c"
	.text
..TXTST0:
# -- Begin  aitken
# mark_begin;
       .align    16,0x90
	.globl aitken
aitken:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %edx
..B1.1:                         # Preds ..B1.0
..___tag_value_aitken.1:                                        #4.55
        lea       -2(%rdx), %ecx                                #8.22
        xorl      %eax, %eax                                    #8.9
        testl     %ecx, %ecx                                    #8.22
        jle       ..B1.8        # Prob 10%                      #8.22
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15 edx
..B1.2:                         # Preds ..B1.1
        movslq    %edx, %rdx                                    #8.5
        addq      $-2, %rdx                                     #8.22
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.3:                         # Preds ..B1.6 ..B1.2
        movsd     (%rdi,%rax,8), %xmm4                          #9.7
        movsd     8(%rdi,%rax,8), %xmm0                         #10.9
        movq      (%rdi,%rax,8), %rcx                           #9.7
        movsd     16(%rdi,%rax,8), %xmm2                        #11.9
        ucomisd   %xmm0, %xmm4                                  #12.9
        jp        ..B1.4        # Prob 0%                       #12.9
        je        ..B1.5        # Prob 16%                      #12.9
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15 xmm0 xmm2 xmm4
..B1.4:                         # Preds ..B1.3
        movaps    %xmm0, %xmm1                                  #16.19
        subsd     %xmm4, %xmm1                                  #16.19
        movaps    %xmm1, %xmm3                                  #16.29
        mulsd     %xmm1, %xmm3                                  #16.29
        addsd     %xmm0, %xmm1                                  #16.41
        pxor      %xmm0, %xmm0                                  #16.41
        subsd     %xmm1, %xmm0                                  #16.41
        addsd     %xmm2, %xmm0                                  #16.46
        divsd     %xmm0, %xmm3                                  #16.46
        subsd     %xmm3, %xmm4                                  #16.46
        movsd     %xmm4, (%rsi,%rax,8)                          #15.6
        jmp       ..B1.6        # Prob 100%                     #15.6
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.5:                         # Preds ..B1.3
        movq      %rcx, (%rsi,%rax,8)                           #13.6
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.6:                         # Preds ..B1.5 ..B1.4
        incq      %rax                                          #8.25
        cmpq      %rdx, %rax                                    #8.22
        jl        ..B1.3        # Prob 82%                      #8.22
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15
..B1.8:                         # Preds ..B1.6 ..B1.1
        ret                                                     #18.1
        .align    16,0x90
..___tag_value_aitken.3:                                        #
                                # LOE
# mark_end;
	.type	aitken,@function
	.size	aitken,.-aitken
	.data
# -- End  aitken
	.text
# -- Begin  aitkenExtrapolate
# mark_begin;
       .align    16,0x90
	.globl aitkenExtrapolate
aitkenExtrapolate:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %edx
..B2.1:                         # Preds ..B2.0
..___tag_value_aitkenExtrapolate.4:                             #21.13
        subq      $72, %rsp                                     #21.13
..___tag_value_aitkenExtrapolate.6:                             #
        movl      %edx, %r9d                                    #23.5
        shrl      $31, %r9d                                     #23.5
        movl      %edx, %r10d                                   #24.12
        addl      %edx, %r9d                                    #23.13
        movq      %rdi, %r8                                     #21.13
        sarl      $1, %r9d                                      #23.13
        andl      $-2147483647, %r10d                           #24.12
        jge       ..B2.22       # Prob 50%                      #24.12
                                # LOE rbx rbp rsi r8 r12 r13 r14 r15 edx r9d r10d
..B2.23:                        # Preds ..B2.1
        subl      $1, %r10d                                     #24.12
        orl       $-2, %r10d                                    #24.12
        incl      %r10d                                         #24.12
                                # LOE rbx rbp rsi r8 r12 r13 r14 r15 edx r9d r10d
..B2.22:                        # Preds ..B2.1 ..B2.23
        testl     %r10d, %r10d                                  #25.2
        lea       -1(%r9), %eax                                 #25.2
        cmove     %eax, %r9d                                    #25.2
        xorl      %edi, %edi                                    #25.2
        testl     %r9d, %r9d                                    #26.18
        jle       ..B2.10       # Prob 10%                      #26.18
                                # LOE rbx rbp rsi r8 r12 r13 r14 r15 edx edi r9d r10d
..B2.2:                         # Preds ..B2.22
        movq      %r8, %rcx                                     #28.2
        movslq    %edx, %rax                                    #28.2
        subq      %rsi, %rcx                                    #28.2
        movl      %r9d, 64(%rsp)                                #28.2
        movl      %r10d, 32(%rsp)                               #28.2
        movl      %edx, 56(%rsp)                                #28.2
        movq      %r12, 40(%rsp)                                #28.2
..___tag_value_aitkenExtrapolate.7:                             #
        movq      %rsi, %r12                                    #28.2
        movq      %r13, 48(%rsp)                                #28.2
..___tag_value_aitkenExtrapolate.8:                             #
        movq      %r8, %r13                                     #28.2
        movq      %r14, (%rsp)                                  #28.2
..___tag_value_aitkenExtrapolate.9:                             #
        movl      %edi, %r14d                                   #28.2
        movq      %r15, 8(%rsp)                                 #28.2
..___tag_value_aitkenExtrapolate.10:                            #
        movq      %rbx, 16(%rsp)                                #28.2
..___tag_value_aitkenExtrapolate.11:                            #
        movq      %rax, %rbx                                    #28.2
        movq      %rbp, 24(%rsp)                                #28.2
..___tag_value_aitkenExtrapolate.12:                            #
        movq      %rcx, %rbp                                    #28.2
                                # LOE rbx rbp r12 r13 r14d
..B2.3:                         # Preds ..B2.8 ..B2.2
        movq      %r13, %rdi                                    #27.2
        lea       (%r14,%r14), %r15d                            #27.27
        negl      %r15d                                         #27.21
        movq      %r12, %rsi                                    #27.2
        addl      56(%rsp), %r15d                               #27.21
        movl      %r15d, %edx                                   #27.2
..___tag_value_aitkenExtrapolate.13:                            #27.2
        call      aitken                                        #27.2
..___tag_value_aitkenExtrapolate.14:                            #
                                # LOE rbx rbp r12 r13 r14d r15d
..B2.4:                         # Preds ..B2.3
        addl      $-2, %r15d                                    #28.15
        testl     %r15d, %r15d                                  #28.24
        jle       ..B2.8        # Prob 50%                      #28.24
                                # LOE rbx rbp r12 r13 r14d
..B2.5:                         # Preds ..B2.4
        movl      56(%rsp), %edx                                #28.2
        lea       (%r14,%r14), %r9d                             #28.2
        negl      %r9d                                          #28.2
        lea       -2(%rdx,%r9), %eax                            #28.2
        cmpl      $12, %eax                                     #28.2
        jle       ..B2.24       # Prob 10%                      #28.2
                                # LOE rbx rbp r12 r13 eax r14d
..B2.6:                         # Preds ..B2.5
        movslq    %r14d, %rdx                                   #28.2
        movq      %rbp, %r9                                     #28.2
        shlq      $4, %rdx                                      #28.2
        movl      $1, %r10d                                     #28.2
        negq      %rdx                                          #28.2
        xorl      %r15d, %r15d                                  #28.2
        negq      %r9                                           #28.2
        xorl      %r11d, %r11d                                  #28.2
        lea       -16(%rdx,%rbx,8), %rdx                        #28.2
        cmpq      %rdx, %rbp                                    #28.2
        cmovg     %r10d, %r15d                                  #28.2
        cmpq      %rdx, %r9                                     #28.2
        cmovg     %r10d, %r11d                                  #28.2
        orl       %r11d, %r15d                                  #28.2
        je        ..B2.14       # Prob 10%                      #28.2
                                # LOE rdx rbx rbp r12 r13 eax r10d r14d
..B2.7:                         # Preds ..B2.6
        movq      %r13, %rdi                                    #29.6
        movq      %r12, %rsi                                    #29.6
        call      _intel_fast_memcpy                            #29.6
                                # LOE rbx rbp r12 r13 r14d
..B2.8:                         # Preds ..B2.7 ..B2.4 ..B2.18 ..B2.19
        incl      %r14d                                         #26.5
        cmpl      64(%rsp), %r14d                               #26.5
        jb        ..B2.3        # Prob 82%                      #26.5
                                # LOE rbx rbp r12 r13 r14d
..B2.9:                         # Preds ..B2.8
        movl      32(%rsp), %r10d                               #
        movq      %r13, %r8                                     #
        movq      40(%rsp), %r12                                #
..___tag_value_aitkenExtrapolate.15:                            #
        movq      48(%rsp), %r13                                #
..___tag_value_aitkenExtrapolate.16:                            #
        movq      (%rsp), %r14                                  #
..___tag_value_aitkenExtrapolate.17:                            #
        movq      8(%rsp), %r15                                 #
..___tag_value_aitkenExtrapolate.18:                            #
        movq      16(%rsp), %rbx                                #
..___tag_value_aitkenExtrapolate.19:                            #
        movq      24(%rsp), %rbp                                #
..___tag_value_aitkenExtrapolate.20:                            #
                                # LOE rbx rbp r8 r12 r13 r14 r15 r10d
..B2.10:                        # Preds ..B2.9 ..B2.22
        testl     %r10d, %r10d                                  #31.20
        jne       ..B2.12       # Prob 50%                      #31.20
                                # LOE rbx rbp r8 r12 r13 r14 r15
..B2.11:                        # Preds ..B2.10
        movsd     8(%r8), %xmm0                                 #31.23
        jmp       ..B2.13       # Prob 100%                     #31.23
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B2.12:                        # Preds ..B2.10
        movsd     (%r8), %xmm0                                  #31.31
                                # LOE rbx rbp r12 r13 r14 r15 xmm0
..B2.13:                        # Preds ..B2.11 ..B2.12
        addq      $72, %rsp                                     #31.20
..___tag_value_aitkenExtrapolate.21:                            #
        ret                                                     #31.20
..___tag_value_aitkenExtrapolate.22:                            #
                                # LOE
..B2.14:                        # Preds ..B2.6 ..B2.24
        movl      %eax, %edx                                    #28.2
        xorl      %r9d, %r9d                                    #28.2
        shrl      $31, %edx                                     #28.2
        addl      %eax, %edx                                    #28.2
        sarl      $1, %edx                                      #28.2
        testl     %edx, %edx                                    #28.2
        jbe       ..B2.18       # Prob 10%                      #28.2
                                # LOE rbx rbp r12 r13 eax edx r9d r10d r14d
..B2.16:                        # Preds ..B2.14 ..B2.16
        lea       (%r9,%r9), %r10d                              #29.6
        incl      %r9d                                          #28.2
        movslq    %r10d, %r10                                   #29.16
        cmpl      %edx, %r9d                                    #28.2
        movq      (%r12,%r10,8), %r11                           #20.8
        movq      %r11, (%r13,%r10,8)                           #20.8
        movq      8(%r12,%r10,8), %r15                          #20.8
        movq      %r15, 8(%r13,%r10,8)                          #20.8
        jb        ..B2.16       # Prob 64%                      #28.2
                                # LOE rbx rbp r12 r13 eax edx r9d r14d
..B2.17:                        # Preds ..B2.16
        lea       1(%r9,%r9), %r10d                             #28.2
                                # LOE rbx rbp r12 r13 eax r10d r14d
..B2.18:                        # Preds ..B2.17 ..B2.14
        cmpl      %eax, %r10d                                   #28.2
        ja        ..B2.8        # Prob 50%                      #28.2
                                # LOE rbx rbp r12 r13 r10d r14d
..B2.19:                        # Preds ..B2.18
        movslq    %r10d, %r10                                   #29.16
        movq      -8(%r12,%r10,8), %rdx                         #20.8
        movq      %rdx, -8(%r13,%r10,8)                         #20.8
        jmp       ..B2.8        # Prob 100%                     #20.8
                                # LOE rbx rbp r12 r13 r14d
..B2.24:                        # Preds ..B2.5
        pushq     $1                                            #28.2
        popq      %r10                                          #28.2
        jmp       ..B2.14       # Prob 100%                     #28.2
        .align    16,0x90
..___tag_value_aitkenExtrapolate.29:                            #
                                # LOE rbx rbp r12 r13 eax r10d r14d
# mark_end;
	.type	aitkenExtrapolate,@function
	.size	aitkenExtrapolate,.-aitkenExtrapolate
	.data
# -- End  aitkenExtrapolate
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x00000014
	.4byte 0x0000001c
	.8byte ..___tag_value_aitken.1
	.8byte ..___tag_value_aitken.3-..___tag_value_aitken.1
	.4byte 0x00000084
	.4byte 0x00000034
	.8byte ..___tag_value_aitkenExtrapolate.4
	.8byte ..___tag_value_aitkenExtrapolate.29-..___tag_value_aitkenExtrapolate.4
	.byte 0x04
	.4byte ..___tag_value_aitkenExtrapolate.6-..___tag_value_aitkenExtrapolate.4
	.2byte 0x500e
	.byte 0x04
	.4byte ..___tag_value_aitkenExtrapolate.7-..___tag_value_aitkenExtrapolate.6
	.2byte 0x058c
	.byte 0x04
	.4byte ..___tag_value_aitkenExtrapolate.8-..___tag_value_aitkenExtrapolate.7
	.2byte 0x048d
	.byte 0x04
	.4byte ..___tag_value_aitkenExtrapolate.9-..___tag_value_aitkenExtrapolate.8
	.2byte 0x0a8e
	.byte 0x04
	.4byte ..___tag_value_aitkenExtrapolate.10-..___tag_value_aitkenExtrapolate.9
	.2byte 0x098f
	.byte 0x04
	.4byte ..___tag_value_aitkenExtrapolate.11-..___tag_value_aitkenExtrapolate.10
	.2byte 0x0883
	.byte 0x04
	.4byte ..___tag_value_aitkenExtrapolate.12-..___tag_value_aitkenExtrapolate.11
	.2byte 0x0786
	.byte 0x04
	.4byte ..___tag_value_aitkenExtrapolate.15-..___tag_value_aitkenExtrapolate.12
	.2byte 0x04cc
	.4byte ..___tag_value_aitkenExtrapolate.16-..___tag_value_aitkenExtrapolate.15
	.2byte 0x04cd
	.4byte ..___tag_value_aitkenExtrapolate.17-..___tag_value_aitkenExtrapolate.16
	.2byte 0x04ce
	.4byte ..___tag_value_aitkenExtrapolate.18-..___tag_value_aitkenExtrapolate.17
	.2byte 0x04cf
	.4byte ..___tag_value_aitkenExtrapolate.19-..___tag_value_aitkenExtrapolate.18
	.2byte 0x04c3
	.4byte ..___tag_value_aitkenExtrapolate.20-..___tag_value_aitkenExtrapolate.19
	.2byte 0x04c6
	.4byte ..___tag_value_aitkenExtrapolate.21-..___tag_value_aitkenExtrapolate.20
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value_aitkenExtrapolate.22-..___tag_value_aitkenExtrapolate.21
	.8byte 0x058c07860883500e
	.4byte 0x0a8e048d
	.2byte 0x098f
	.byte 0x00
# End

