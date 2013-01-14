# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-I /home/software/rhel6/fftw-3.3.2/intel-12.1/include -I/usr/caen/intel-12.1/mkl/include -O3 -prec-div -no-f";
# mark_description "tz -fno-inline-functions -DNDEBUG -S";
	.file "Aitken.cpp"
	.text
..TXTST0:
# -- Begin  _Z7AitkenERK6Vectori
# mark_begin;
..___tag_value__Z7AitkenERK6Vectori.2:                         #
        .align    16,0x90
	.globl _Z7AitkenERK6Vectori
_Z7AitkenERK6Vectori:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
..___tag_value__Z7AitkenERK6Vectori.3:                          #28.49
        pushq     %r13                                          #28.49
..___tag_value__Z7AitkenERK6Vectori.5:                          #
        pushq     %r14                                          #28.49
..___tag_value__Z7AitkenERK6Vectori.7:                          #
        pushq     %r15                                          #28.49
..___tag_value__Z7AitkenERK6Vectori.9:                          #
        pushq     %rbx                                          #28.49
..___tag_value__Z7AitkenERK6Vectori.11:                         #
        pushq     %rbp                                          #28.49
..___tag_value__Z7AitkenERK6Vectori.13:                         #
        subq      $64, %rsp                                     #28.49
..___tag_value__Z7AitkenERK6Vectori.15:                         #
        movq      %rdi, %r14                                    #28.49
        movl      %esi, %ebx                                    #28.49
        movl      $64, %esi                                     #30.16
        movl      (%r14), %ebp                                  #29.17
        movslq    %ebp, %rdi                                    #30.16
        shlq      $3, %rdi                                      #30.16
        movl      %ebp, 8(%rsp)                                 #30.10
..___tag_value__Z7AitkenERK6Vectori.16:                         #30.16
        call      MKL_malloc                                    #30.16
..___tag_value__Z7AitkenERK6Vectori.18:                         #
                                # LOE rax r12 r14 ebx ebp
..B1.2:                         # Preds ..B1.1
        movq      8(%r14), %r13                                 #31.9
        cmpq      %r13, %rax                                    #31.9
        movq      %rax, 16(%rsp)                                #30.10
        movl      $1, 24(%rsp)                                  #30.10
        je        ..B1.5        # Prob 33%                      #31.9
..___tag_value__Z7AitkenERK6Vectori.20:                         #
                                # LOE rax r12 r13 r14 ebx ebp
..B1.3:                         # Preds ..B1.2
        movslq    8(%rsp), %rdx                                 #31.9
        movq      %rax, %rdi                                    #31.9
        shlq      $3, %rdx                                      #31.9
        movq      %r13, %rsi                                    #31.9
        call      _intel_fast_memcpy                            #31.9
..___tag_value__Z7AitkenERK6Vectori.21:                         #
                                # LOE r12 r14 ebx ebp
..B1.4:                         # Preds ..B1.3
        movq      8(%r14), %r13                                 #33.5
..___tag_value__Z7AitkenERK6Vectori.22:                         #
                                # LOE r12 r13 r14 ebx ebp
..B1.5:                         # Preds ..B1.4 ..B1.2
        movl      (%r14), %r15d                                 #33.5
        movl      %ebp, %r14d                                   #34.15
        shrl      $31, %r14d                                    #34.15
        addl      %ebp, %r14d                                   #34.15
        sarl      $1, %r14d                                     #34.15
        movl      %r15d, 32(%rsp)                               #33.3
        andl      $-2147483647, %ebp                            #35.10
        movq      %r13, 40(%rsp)                                #33.3
        movl      $0, 48(%rsp)                                  #33.3
        jge       ..B1.23       # Prob 50%                      #35.10
..___tag_value__Z7AitkenERK6Vectori.23:                         #
                                # LOE r12 r13 ebx ebp r14d r15d
..B1.24:                        # Preds ..B1.5
        subl      $1, %ebp                                      #35.10
        orl       $-2, %ebp                                     #35.10
        incl      %ebp                                          #35.10
..___tag_value__Z7AitkenERK6Vectori.24:                         #
                                # LOE r12 r13 ebx ebp r14d r15d
..B1.23:                        # Preds ..B1.5 ..B1.24
        testl     %ebp, %ebp                                    #36.5
        lea       -1(%r14), %eax                                #36.5
        cmove     %eax, %r14d                                   #36.5
        cmpl      $1, %ebx                                      #37.17
        je        ..B1.20       # Prob 5%                       #37.17
..___tag_value__Z7AitkenERK6Vectori.25:                         #
                                # LOE r12 r13 ebx r14d r15d
..B1.6:                         # Preds ..B1.20 ..B1.23
        xorl      %ebp, %ebp                                    #39.12
        testl     %r14d, %r14d                                  #39.20
        jle       ..B1.12       # Prob 4%                       #39.20
..___tag_value__Z7AitkenERK6Vectori.26:                         #
                                # LOE r12 r13 ebx ebp r14d r15d
..B1.8:                         # Preds ..B1.6 ..B1.10
        lea       32(%rsp), %rdi                                #40.5
..___tag_value__Z7AitkenERK6Vectori.27:                         #40.5
        call      _Z6AitkenR6Vector                             #40.5
..___tag_value__Z7AitkenERK6Vectori.29:                         #
                                # LOE r12 r13 ebx ebp r14d r15d
..B1.9:                         # Preds ..B1.8
        addl      $-2, %r15d                                    #41.32
        movl      %r15d, 32(%rsp)                               #41.5
        cmpl      $1, %ebx                                      #42.19
        movl      $0, 48(%rsp)                                  #41.5
        je        ..B1.15       # Prob 5%                       #42.19
..___tag_value__Z7AitkenERK6Vectori.31:                         #
                                # LOE r12 r13 ebx ebp r14d r15d
..B1.10:                        # Preds ..B1.15 ..B1.9
        incl      %ebp                                          #39.23
        cmpl      %r14d, %ebp                                   #39.20
        jl        ..B1.8        # Prob 82%                      #39.20
..___tag_value__Z7AitkenERK6Vectori.32:                         #
                                # LOE r12 r13 ebx ebp r14d r15d
..B1.12:                        # Preds ..B1.10 ..B1.6          # Infreq
        movslq    %r15d, %r15                                   #46.11
        cmpl      $0, 24(%rsp)                                  #46.3
        movsd     -8(%r13,%r15,8), %xmm0                        #46.11
        je        ..B1.14       # Prob 78%                      #46.3
..___tag_value__Z7AitkenERK6Vectori.33:                         #
                                # LOE r12 xmm0
..B1.13:                        # Preds ..B1.12                 # Infreq
        movq      16(%rsp), %rdi                                #46.3
        movsd     %xmm0, (%rsp)                                 #46.3
..___tag_value__Z7AitkenERK6Vectori.34:                         #46.3
        call      MKL_free                                      #46.3
..___tag_value__Z7AitkenERK6Vectori.36:                         #
                                # LOE r12
..B1.26:                        # Preds ..B1.13                 # Infreq
        movsd     (%rsp), %xmm0                                 #
..___tag_value__Z7AitkenERK6Vectori.38:                         #
                                # LOE r12 xmm0
..B1.14:                        # Preds ..B1.26 ..B1.12         # Infreq
        addq      $64, %rsp                                     #46.3
..___tag_value__Z7AitkenERK6Vectori.39:                         #
        popq      %rbp                                          #46.3
..___tag_value__Z7AitkenERK6Vectori.42:                         #
        popq      %rbx                                          #46.3
..___tag_value__Z7AitkenERK6Vectori.44:                         #
        popq      %r15                                          #46.3
..___tag_value__Z7AitkenERK6Vectori.46:                         #
        popq      %r14                                          #46.3
..___tag_value__Z7AitkenERK6Vectori.48:                         #
        popq      %r13                                          #46.3
..___tag_value__Z7AitkenERK6Vectori.50:                         #
        ret                                                     #46.3
..___tag_value__Z7AitkenERK6Vectori.51:                         #
                                # LOE
..B1.15:                        # Preds ..B1.9                  # Infreq
        lea       32(%rsp), %rdi                                #43.7
..___tag_value__Z7AitkenERK6Vectori.58:                         #43.7
        call      _Z8printseqRK6Vector                          #43.7
..___tag_value__Z7AitkenERK6Vectori.60:                         #
        jmp       ..B1.10       # Prob 100%                     #43.7
..___tag_value__Z7AitkenERK6Vectori.61:                         #
                                # LOE r12 r13 ebx ebp r14d r15d
..___tag_value__Z7AitkenERK6Vectori.1:
..B1.16:                        # Preds ..B1.15 ..B1.20         # Infreq
        movq      %rax, (%rsp)                                  #32.10
..___tag_value__Z7AitkenERK6Vectori.62:                         #
                                # LOE r12
..B1.17:                        # Preds ..B1.16                 # Infreq
        lea       32(%rsp), %rdi                                #32.10
..___tag_value__Z7AitkenERK6Vectori.63:                         #32.10
        call      _ZN6VectorD1Ev                                #32.10
..___tag_value__Z7AitkenERK6Vectori.65:                         #
                                # LOE r12
..B1.18:                        # Preds ..B1.17                 # Infreq
        lea       8(%rsp), %rdi                                 #30.16
..___tag_value__Z7AitkenERK6Vectori.67:                         #30.16
        call      _ZN6VectorD1Ev                                #30.16
..___tag_value__Z7AitkenERK6Vectori.69:                         #
                                # LOE r12
..B1.19:                        # Preds ..B1.18                 # Infreq
        xorl      %eax, %eax                                    #30.16
        movq      (%rsp), %rdi                                  #30.16
..___tag_value__Z7AitkenERK6Vectori.71:                         #30.16
        call      _Unwind_Resume                                #30.16
..___tag_value__Z7AitkenERK6Vectori.73:                         #
                                # LOE
..B1.20:                        # Preds ..B1.23                 # Infreq
        lea       32(%rsp), %rdi                                #38.5
..___tag_value__Z7AitkenERK6Vectori.75:                         #38.5
        call      _Z8printseqRK6Vector                          #38.5
..___tag_value__Z7AitkenERK6Vectori.77:                         #
        jmp       ..B1.6        # Prob 100%                     #38.5
        .align    16,0x90
..___tag_value__Z7AitkenERK6Vectori.78:                         #
                                # LOE r12 r13 ebx r14d r15d
# mark_end;
	.type	_Z7AitkenERK6Vectori,@function
	.size	_Z7AitkenERK6Vectori,.-_Z7AitkenERK6Vectori
	.section .gcc_except_table, "a"
	.align 4
_Z7AitkenERK6Vectori$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.82 - ..___tag_value__Z7AitkenERK6Vectori.81
..___tag_value__Z7AitkenERK6Vectori.81:
	.byte	1
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.80 - ..___tag_value__Z7AitkenERK6Vectori.79
..___tag_value__Z7AitkenERK6Vectori.79:
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.16 - ..___tag_value__Z7AitkenERK6Vectori.3
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.18 - ..___tag_value__Z7AitkenERK6Vectori.16
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.27 - ..___tag_value__Z7AitkenERK6Vectori.3
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.29 - ..___tag_value__Z7AitkenERK6Vectori.27
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.1 - ..___tag_value__Z7AitkenERK6Vectori.3
	.byte	0
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.34 - ..___tag_value__Z7AitkenERK6Vectori.3
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.36 - ..___tag_value__Z7AitkenERK6Vectori.34
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.58 - ..___tag_value__Z7AitkenERK6Vectori.3
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.60 - ..___tag_value__Z7AitkenERK6Vectori.58
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.1 - ..___tag_value__Z7AitkenERK6Vectori.3
	.byte	0
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.71 - ..___tag_value__Z7AitkenERK6Vectori.3
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.73 - ..___tag_value__Z7AitkenERK6Vectori.71
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.75 - ..___tag_value__Z7AitkenERK6Vectori.3
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.77 - ..___tag_value__Z7AitkenERK6Vectori.75
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.1 - ..___tag_value__Z7AitkenERK6Vectori.3
	.byte	0
..___tag_value__Z7AitkenERK6Vectori.80:
	.long	0x00000000,0x00000000
..___tag_value__Z7AitkenERK6Vectori.82:
	.data
# -- End  _Z7AitkenERK6Vectori
	.text
# -- Begin  _Z8printseqRK6Vector
# mark_begin;
       .align    16,0x90
	.globl _Z8printseqRK6Vector
_Z8printseqRK6Vector:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
..___tag_value__Z8printseqRK6Vector.83:                         #22.31
        pushq     %r12                                          #22.31
..___tag_value__Z8printseqRK6Vector.85:                         #
        subq      $16, %rsp                                     #22.31
..___tag_value__Z8printseqRK6Vector.87:                         #
        movq      %rdi, %r12                                    #22.31
        movl      $.L_2__STRING.0, %edi                         #23.3
        xorl      %eax, %eax                                    #23.3
..___tag_value__Z8printseqRK6Vector.88:                         #23.3
        call      printf                                        #23.3
..___tag_value__Z8printseqRK6Vector.89:                         #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
        xorl      %eax, %eax                                    #24.12
        cmpl      $0, (%r12)                                    #24.22
        jle       ..B2.7        # Prob 10%                      #24.22
                                # LOE rax rbx rbp r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
        movq      %r13, (%rsp)                                  #
..___tag_value__Z8printseqRK6Vector.90:                         #
        movq      %r12, %r13                                    #
        movq      %rax, %r12                                    #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.4:                         # Preds ..B2.5 ..B2.3
        movq      8(%r13), %rdx                                 #25.5
        movl      $.L_2__STRING.1, %edi                         #25.5
        movl      $1, %eax                                      #25.5
        movsd     (%rdx,%r12,8), %xmm0                          #25.5
..___tag_value__Z8printseqRK6Vector.91:                         #25.5
        call      printf                                        #25.5
..___tag_value__Z8printseqRK6Vector.92:                         #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.5:                         # Preds ..B2.4
        incq      %r12                                          #24.33
        movslq    (%r13), %rdx                                  #24.22
        cmpq      %rdx, %r12                                    #24.22
        jl        ..B2.4        # Prob 82%                      #24.22
                                # LOE rbx rbp r12 r13 r14 r15
..B2.6:                         # Preds ..B2.5
        movq      (%rsp), %r13                                  #
..___tag_value__Z8printseqRK6Vector.93:                         #
                                # LOE rbx rbp r13 r14 r15
..B2.7:                         # Preds ..B2.6 ..B2.2
        addq      $16, %rsp                                     #26.1
..___tag_value__Z8printseqRK6Vector.94:                         #
        popq      %r12                                          #26.1
..___tag_value__Z8printseqRK6Vector.96:                         #
        ret                                                     #26.1
        .align    16,0x90
..___tag_value__Z8printseqRK6Vector.97:                         #
                                # LOE
# mark_end;
	.type	_Z8printseqRK6Vector,@function
	.size	_Z8printseqRK6Vector,.-_Z8printseqRK6Vector
	.data
# -- End  _Z8printseqRK6Vector
	.text
# -- Begin  _Z6AitkenR6Vector
# mark_begin;
       .align    16,0x90
	.globl _Z6AitkenR6Vector
_Z6AitkenR6Vector:
# parameter 1: %rdi
..B3.1:                         # Preds ..B3.0
..___tag_value__Z6AitkenR6Vector.98:                            #6.26
        xorl      %ecx, %ecx                                    #8.12
        movl      (%rdi), %esi                                  #7.18
        xorl      %eax, %eax                                    #8.12
        lea       -2(%rsi), %edx                                #8.24
        testl     %edx, %edx                                    #8.24
        jle       ..B3.11       # Prob 10%                      #8.24
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 esi
..B3.2:                         # Preds ..B3.1
        movslq    %esi, %rsi                                    #8.3
        lea       -2(%rsi), %rdx                                #8.24
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B3.3:                         # Preds ..B3.6 ..B3.2
        movq      8(%rdi), %r8                                  #9.21
        movsd     (%r8,%rcx,8), %xmm4                           #9.21
        movsd     8(%r8,%rcx,8), %xmm0                          #10.23
        movsd     16(%r8,%rcx,8), %xmm2                         #11.23
        ucomisd   %xmm0, %xmm4                                  #12.12
        jp        ..B3.4        # Prob 0%                       #12.12
        je        ..B3.6        # Prob 16%                      #12.12
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 xmm0 xmm2 xmm4
..B3.4:                         # Preds ..B3.3
        movaps    %xmm0, %xmm1                                  #16.8
        subsd     %xmm4, %xmm1                                  #16.8
        movaps    %xmm1, %xmm3                                  #16.18
        mulsd     %xmm1, %xmm3                                  #16.18
        addsd     %xmm0, %xmm1                                  #16.30
        pxor      %xmm0, %xmm0                                  #16.30
        subsd     %xmm1, %xmm0                                  #16.30
        addsd     %xmm2, %xmm0                                  #16.35
        divsd     %xmm0, %xmm3                                  #16.35
        subsd     %xmm3, %xmm4                                  #16.35
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 xmm4
..B3.6:                         # Preds ..B3.3 ..B3.4
        movsd     %xmm4, (%r8,%rcx,8)                           #13.11
        incq      %rcx                                          #8.27
        cmpq      %rdx, %rcx                                    #8.24
        jl        ..B3.3        # Prob 82%                      #8.24
                                # LOE rax rdx rcx rbx rbp rsi rdi r12 r13 r14 r15
..B3.8:                         # Preds ..B3.6 ..B3.11
        movq      8(%rdi), %rdx                                 #18.7
        movq      %rax, -16(%rdx,%rsi,8)                        #18.7
        movq      8(%rdi), %rcx                                 #19.7
        movq      %rax, -8(%rcx,%rsi,8)                         #19.7
        ret                                                     #20.1
                                # LOE
..B3.11:                        # Preds ..B3.1
        movslq    %esi, %rsi                                    #8.3
        jmp       ..B3.8        # Prob 100%                     #8.3
        .align    16,0x90
..___tag_value__Z6AitkenR6Vector.100:                           #
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15
# mark_end;
	.type	_Z6AitkenR6Vector,@function
	.size	_Z6AitkenR6Vector,.-_Z6AitkenR6Vector
	.data
# -- End  _Z6AitkenR6Vector
	.section .text._ZN6VectorD1Ev, "xaG",@progbits,_ZN6VectorD1Ev,comdat
..TXTST1:
# -- Begin  _ZN6VectorD1Ev
# mark_begin;
       .align    16,0x90
	.weak _ZN6VectorD1Ev
_ZN6VectorD1Ev:
# parameter 1: %rdi
..B4.1:                         # Preds ..B4.0
..___tag_value__ZN6VectorD1Ev.101:                              #50.12
        pushq     %rsi                                          #50.12
..___tag_value__ZN6VectorD1Ev.103:                              #
        cmpl      $0, 16(%rdi)                                  #51.15
        je        ..B4.3        # Prob 78%                      #51.15
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B4.2:                         # Preds ..B4.1
        movq      8(%rdi), %rdi                                 #52.7
..___tag_value__ZN6VectorD1Ev.104:                              #52.7
        call      MKL_free                                      #52.7
..___tag_value__ZN6VectorD1Ev.105:                              #
                                # LOE rbx rbp r12 r13 r14 r15
..B4.3:                         # Preds ..B4.2 ..B4.1
        popq      %rcx                                          #53.3
..___tag_value__ZN6VectorD1Ev.106:                              #
        ret                                                     #53.3
        .align    16,0x90
..___tag_value__ZN6VectorD1Ev.107:                              #
                                # LOE
# mark_end;
	.type	_ZN6VectorD1Ev,@function
	.size	_ZN6VectorD1Ev,.-_ZN6VectorD1Ev
	.data
# -- End  _ZN6VectorD1Ev
	.text
# -- Begin  __sti__$E
# mark_begin;
       .align    16,0x90
__sti__$E:
..B5.1:                         # Preds ..B5.0
..___tag_value___sti__$E.108:                                   #
        pushq     %rsi                                          #
..___tag_value___sti__$E.110:                                   #
        movl      $_ZSt8__ioinit, %edi                          #72.25
..___tag_value___sti__$E.111:                                   #72.25
        call      _ZNSt8ios_base4InitC1Ev                       #72.25
..___tag_value___sti__$E.112:                                   #
                                # LOE rbx rbp r12 r13 r14 r15
..B5.2:                         # Preds ..B5.1
        movl      $_ZNSt8ios_base4InitD1Ev, %edi                #72.25
        movl      $_ZSt8__ioinit, %esi                          #72.25
        movl      $__dso_handle, %edx                           #72.25
        xorl      %eax, %eax                                    #72.25
..___tag_value___sti__$E.113:                                   #72.25
        call      __cxa_atexit                                  #72.25
..___tag_value___sti__$E.114:                                   #
                                # LOE rbx rbp r12 r13 r14 r15
..B5.3:                         # Preds ..B5.2
        popq      %rcx                                          #72.25
..___tag_value___sti__$E.115:                                   #
        ret                                                     #72.25
        .align    16,0x90
..___tag_value___sti__$E.116:                                   #
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
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.byte	10
	.byte	32
	.byte	10
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,4
	.align 4
.L_2__STRING.1:
	.byte	37
	.byte	45
	.byte	46
	.byte	49
	.byte	48
	.byte	102
	.byte	10
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,8
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
	.4byte 0x00000094
	.4byte 0x00000044
	.8byte ..___tag_value__Z7AitkenERK6Vectori.3
	.8byte ..___tag_value__Z7AitkenERK6Vectori.78-..___tag_value__Z7AitkenERK6Vectori.3
	.byte 0x08
	.8byte _Z7AitkenERK6Vectori$$LSDA
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.5-..___tag_value__Z7AitkenERK6Vectori.3
	.4byte 0x100e028d
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.7-..___tag_value__Z7AitkenERK6Vectori.5
	.4byte 0x180e038e
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.9-..___tag_value__Z7AitkenERK6Vectori.7
	.4byte 0x200e048f
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.11-..___tag_value__Z7AitkenERK6Vectori.9
	.4byte 0x280e0583
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.13-..___tag_value__Z7AitkenERK6Vectori.11
	.4byte 0x300e0686
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.15-..___tag_value__Z7AitkenERK6Vectori.13
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.39-..___tag_value__Z7AitkenERK6Vectori.15
	.4byte 0x04c6300e
	.4byte ..___tag_value__Z7AitkenERK6Vectori.42-..___tag_value__Z7AitkenERK6Vectori.39
	.4byte 0x04c3280e
	.4byte ..___tag_value__Z7AitkenERK6Vectori.44-..___tag_value__Z7AitkenERK6Vectori.42
	.4byte 0x04cf200e
	.4byte ..___tag_value__Z7AitkenERK6Vectori.46-..___tag_value__Z7AitkenERK6Vectori.44
	.4byte 0x04ce180e
	.4byte ..___tag_value__Z7AitkenERK6Vectori.48-..___tag_value__Z7AitkenERK6Vectori.46
	.4byte 0x04cd100e
	.4byte ..___tag_value__Z7AitkenERK6Vectori.50-..___tag_value__Z7AitkenERK6Vectori.48
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.51-..___tag_value__Z7AitkenERK6Vectori.50
	.8byte 0x028d06860583700e
	.4byte 0x048f038e
	.2byte 0x0000
	.byte 0x00
	.4byte 0x00000044
	.4byte 0x000000bc
	.8byte ..___tag_value__Z8printseqRK6Vector.83
	.8byte ..___tag_value__Z8printseqRK6Vector.97-..___tag_value__Z8printseqRK6Vector.83
	.2byte 0x0400
	.4byte ..___tag_value__Z8printseqRK6Vector.85-..___tag_value__Z8printseqRK6Vector.83
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__Z8printseqRK6Vector.87-..___tag_value__Z8printseqRK6Vector.85
	.2byte 0x200e
	.byte 0x04
	.4byte ..___tag_value__Z8printseqRK6Vector.90-..___tag_value__Z8printseqRK6Vector.87
	.2byte 0x048d
	.byte 0x04
	.4byte ..___tag_value__Z8printseqRK6Vector.93-..___tag_value__Z8printseqRK6Vector.90
	.2byte 0x04cd
	.4byte ..___tag_value__Z8printseqRK6Vector.94-..___tag_value__Z8printseqRK6Vector.93
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z8printseqRK6Vector.96-..___tag_value__Z8printseqRK6Vector.94
	.4byte 0x0000080e
	.byte 0x00
	.4byte 0x0000001c
	.4byte 0x00000104
	.8byte ..___tag_value__Z6AitkenR6Vector.98
	.8byte ..___tag_value__Z6AitkenR6Vector.100-..___tag_value__Z6AitkenR6Vector.98
	.8byte 0x0000000000000000
	.4byte 0x00000024
	.4byte 0x00000124
	.8byte ..___tag_value__ZN6VectorD1Ev.101
	.8byte ..___tag_value__ZN6VectorD1Ev.107-..___tag_value__ZN6VectorD1Ev.101
	.2byte 0x0400
	.4byte ..___tag_value__ZN6VectorD1Ev.103-..___tag_value__ZN6VectorD1Ev.101
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__ZN6VectorD1Ev.106-..___tag_value__ZN6VectorD1Ev.103
	.2byte 0x080e
	.byte 0x00
	.4byte 0x00000024
	.4byte 0x0000014c
	.8byte ..___tag_value___sti__$E.108
	.8byte ..___tag_value___sti__$E.116-..___tag_value___sti__$E.108
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.110-..___tag_value___sti__$E.108
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.115-..___tag_value___sti__$E.110
	.2byte 0x080e
	.byte 0x00
# End
