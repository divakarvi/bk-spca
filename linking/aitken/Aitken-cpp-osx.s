	.file "Aitken.cpp"
	.text
..TXTST0:
# -- Begin  _Z7AitkenERK6Vectori
..___tag_value__Z7AitkenERK6Vectori.2:
        .align    16,0x90
	.globl _Z7AitkenERK6Vectori
_Z7AitkenERK6Vectori:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:
..___tag_value__Z7AitkenERK6Vectori.3:
        pushq     %r12
..___tag_value__Z7AitkenERK6Vectori.5:
        pushq     %r13
..___tag_value__Z7AitkenERK6Vectori.7:
        pushq     %r14
..___tag_value__Z7AitkenERK6Vectori.9:
        pushq     %rbx
..___tag_value__Z7AitkenERK6Vectori.11:
        pushq     %rbp
..___tag_value__Z7AitkenERK6Vectori.13:
        subq      $64, %rsp
..___tag_value__Z7AitkenERK6Vectori.15:
        movq      %rdi, %r14
        movl      %esi, %ebx
        movq      (%r14), %rbp
        movslq    %ebp, %r13
        movq      %r13, 8(%rsp)
        lea       (,%r13,8), %r12
        movq      %r12, %rdi
        call      malloc
..___tag_value__Z7AitkenERK6Vectori.16:
..B1.2:
        movq      (%r14), %rcx
        cmpq      %rcx, %r13
        movq      %rax, 16(%rsp)
        movl      $1, 24(%rsp)
        jne       ..B1.36
..___tag_value__Z7AitkenERK6Vectori.17:
..B1.3:
        movq      8(%r14), %rsi
        cmpq      %rsi, %rax
        jae       ..B1.5
..___tag_value__Z7AitkenERK6Vectori.18:
..B1.4:
        lea       -8(%rax,%r13,8), %rdx
        cmpq      %rdx, %rsi
        ja        ..B1.7
..___tag_value__Z7AitkenERK6Vectori.19:
..B1.43:
        cmpq      %rsi, %rax
..___tag_value__Z7AitkenERK6Vectori.20:
..B1.5:
        jbe       ..B1.10
..___tag_value__Z7AitkenERK6Vectori.21:
..B1.6:
        lea       -8(%rsi,%r13,8), %rdx
        cmpq      %rdx, %rax
        ja        ..B1.7
..___tag_value__Z7AitkenERK6Vectori.22:
..B1.42:
        cmpq      %rsi, %rax
        jne       ..B1.35
        jmp       ..B1.11
..___tag_value__Z7AitkenERK6Vectori.23:
..B1.7:
        cmpq      %rsi, %rax
        je        ..B1.11
..___tag_value__Z7AitkenERK6Vectori.24:
..B1.8:
        movq      %rax, %rdi
        movq      %r12, %rdx
        call      _intel_fast_memcpy
..___tag_value__Z7AitkenERK6Vectori.25:
..B1.9:
        movq      (%r14), %rcx
        movq      8(%r14), %rsi
        jmp       ..B1.11
..___tag_value__Z7AitkenERK6Vectori.26:
..B1.10:
        jne       ..B1.35
..___tag_value__Z7AitkenERK6Vectori.27:
..B1.11:
        movl      %ebp, %r12d
        shrl      $31, %r12d
        addl      %ebp, %r12d
        sarl      $1, %r12d
        movq      %rcx, 32(%rsp)
        andl      $-2147483647, %ebp
        movq      %rsi, 40(%rsp)
        movl      $0, 48(%rsp)
        jge       ..B1.39
..___tag_value__Z7AitkenERK6Vectori.28:
..B1.40:
        subl      $1, %ebp
        orl       $-2, %ebp
        incl      %ebp
..___tag_value__Z7AitkenERK6Vectori.29:
..B1.39:
        testl     %ebp, %ebp
        lea       -1(%r12), %eax
        cmove     %eax, %r12d
        cmpl      $1, %ebx
        je        ..B1.34
..___tag_value__Z7AitkenERK6Vectori.30:
..B1.12:
        xorl      %ebp, %ebp
        testl     %r12d, %r12d
        jle       ..B1.20
..___tag_value__Z7AitkenERK6Vectori.31:
..B1.14:
        lea       32(%rsp), %rdi
..___tag_value__Z7AitkenERK6Vectori.32:
        call      _Z6AitkenR6Vector
..___tag_value__Z7AitkenERK6Vectori.34:
..B1.15:
        movq      32(%rsp), %rax
        cmpl      $0, 48(%rsp)
        lea       -2(%rax), %rdx
        jne       ..B1.33
..___tag_value__Z7AitkenERK6Vectori.36:
..B1.16:
        cmpq      %rax, %rdx
        jg        ..B1.32
..___tag_value__Z7AitkenERK6Vectori.37:
..B1.17:
        movq      %rdx, 32(%rsp)
        cmpl      $1, %ebx
        movl      $0, 48(%rsp)
        je        ..B1.27
..___tag_value__Z7AitkenERK6Vectori.38:
..B1.18:
        incl      %ebp
        cmpl      %r12d, %ebp
        jl        ..B1.14
..___tag_value__Z7AitkenERK6Vectori.39:
..B1.20:
        movq      32(%rsp), %rdx
        lea       -1(%rdx), %rax
        movslq    %eax, %rax
        cmpq      %rdx, %rax
        jge       ..B1.26
..___tag_value__Z7AitkenERK6Vectori.40:
..B1.21:
        movq      40(%rsp), %rdi
        cmpl      $0, 48(%rsp)
        movsd     (%rdi,%rax,8), %xmm0
        je        ..B1.23
..___tag_value__Z7AitkenERK6Vectori.41:
..B1.22:
        movsd     %xmm0, (%rsp)
        call      free
..___tag_value__Z7AitkenERK6Vectori.42:
..B1.45:
        movsd     (%rsp), %xmm0
..___tag_value__Z7AitkenERK6Vectori.43:
..B1.23:
        cmpl      $0, 24(%rsp)
        je        ..B1.25
..___tag_value__Z7AitkenERK6Vectori.44:
..B1.24:
        movq      16(%rsp), %rdi
        movsd     %xmm0, (%rsp)
        call      free
..___tag_value__Z7AitkenERK6Vectori.45:
..B1.44:
        movsd     (%rsp), %xmm0
..___tag_value__Z7AitkenERK6Vectori.46:
..B1.25:
        addq      $64, %rsp
..___tag_value__Z7AitkenERK6Vectori.47:
        popq      %rbp
..___tag_value__Z7AitkenERK6Vectori.50:
        popq      %rbx
..___tag_value__Z7AitkenERK6Vectori.52:
        popq      %r14
..___tag_value__Z7AitkenERK6Vectori.54:
        popq      %r13
..___tag_value__Z7AitkenERK6Vectori.56:
        popq      %r12
..___tag_value__Z7AitkenERK6Vectori.58:
        ret       
..___tag_value__Z7AitkenERK6Vectori.59:
..B1.26:
        movl      $.L_2__STRING.3, %edi
        movl      $.L_2__STRING.1, %esi
        movl      $90, %edx
        movl      $__$U3, %ecx
        call      __assert_fail
..___tag_value__Z7AitkenERK6Vectori.66:
..B1.27:
        lea       32(%rsp), %rdi
..___tag_value__Z7AitkenERK6Vectori.67:
        call      _Z8printseqRK6Vector
..___tag_value__Z7AitkenERK6Vectori.69:
        jmp       ..B1.18
..___tag_value__Z7AitkenERK6Vectori.70:
..___tag_value__Z7AitkenERK6Vectori.1:
..B1.28:
        movq      %rax, (%rsp)
..___tag_value__Z7AitkenERK6Vectori.71:
..B1.29:
        lea       32(%rsp), %rdi
..___tag_value__Z7AitkenERK6Vectori.72:
        call      _ZN6VectorD1Ev
..___tag_value__Z7AitkenERK6Vectori.74:
..B1.30:
        lea       8(%rsp), %rdi
..___tag_value__Z7AitkenERK6Vectori.76:
        call      _ZN6VectorD1Ev
..___tag_value__Z7AitkenERK6Vectori.78:
..B1.31:
        xorl      %eax, %eax
        movq      (%rsp), %rdi
..___tag_value__Z7AitkenERK6Vectori.80:
        call      _Unwind_Resume
..___tag_value__Z7AitkenERK6Vectori.82:
..B1.32:
        movl      $.L_2__STRING.2, %edi
        movl      $.L_2__STRING.1, %esi
        movl      $70, %edx
        movl      $__$U2, %ecx
        call      __assert_fail
..___tag_value__Z7AitkenERK6Vectori.84:
..B1.33:
        movl      $.L_2__STRING.0, %edi
        movl      $.L_2__STRING.1, %esi
        movl      $69, %edx
        movl      $__$U2, %ecx
        call      __assert_fail
..___tag_value__Z7AitkenERK6Vectori.85:
..B1.34:
        lea       32(%rsp), %rdi
..___tag_value__Z7AitkenERK6Vectori.86:
        call      _Z8printseqRK6Vector
..___tag_value__Z7AitkenERK6Vectori.88:
        jmp       ..B1.12
..___tag_value__Z7AitkenERK6Vectori.89:
..B1.35:
        movl      $.L_2__STRING.6, %edi
        movl      $.L_2__STRING.1, %esi
        movl      $105, %edx
        movl      $__$U5, %ecx
        call      __assert_fail
..___tag_value__Z7AitkenERK6Vectori.90:
..B1.36:
        movl      $.L_2__STRING.5, %edi
        movl      $.L_2__STRING.1, %esi
        movl      $102, %edx
        movl      $__$U5, %ecx
        call      __assert_fail
        .align    16,0x90
..___tag_value__Z7AitkenERK6Vectori.91:
	.type	_Z7AitkenERK6Vectori,@function
	.size	_Z7AitkenERK6Vectori,.-_Z7AitkenERK6Vectori
	.section .gcc_except_table, "a"
	.align 4
_Z7AitkenERK6Vectori$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.95 - ..___tag_value__Z7AitkenERK6Vectori.94
..___tag_value__Z7AitkenERK6Vectori.94:
	.byte	1
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.93 - ..___tag_value__Z7AitkenERK6Vectori.92
..___tag_value__Z7AitkenERK6Vectori.92:
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.32 - ..___tag_value__Z7AitkenERK6Vectori.3
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.69 - ..___tag_value__Z7AitkenERK6Vectori.32
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.1 - ..___tag_value__Z7AitkenERK6Vectori.3
	.byte	0
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.80 - ..___tag_value__Z7AitkenERK6Vectori.3
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.82 - ..___tag_value__Z7AitkenERK6Vectori.80
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.86 - ..___tag_value__Z7AitkenERK6Vectori.3
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.88 - ..___tag_value__Z7AitkenERK6Vectori.86
	.uleb128	..___tag_value__Z7AitkenERK6Vectori.1 - ..___tag_value__Z7AitkenERK6Vectori.3
	.byte	0
..___tag_value__Z7AitkenERK6Vectori.93:
	.long	0x00000000,0x00000000
..___tag_value__Z7AitkenERK6Vectori.95:
	.data
# -- End  _Z7AitkenERK6Vectori
	.text
# -- Begin  _Z8printseqRK6Vector
       .align    16,0x90
	.globl _Z8printseqRK6Vector
_Z8printseqRK6Vector:
# parameter 1: %rdi
..B2.1:
..___tag_value__Z8printseqRK6Vector.96:
        pushq     %r12
..___tag_value__Z8printseqRK6Vector.98:
        subq      $16, %rsp
..___tag_value__Z8printseqRK6Vector.100:
        movq      %rdi, %r12
        movl      $.L_2__STRING.7, %edi
        xorl      %eax, %eax
..___tag_value__Z8printseqRK6Vector.101:
        call      printf
..___tag_value__Z8printseqRK6Vector.102:
..B2.2:
        xorl      %edx, %edx
        movq      (%r12), %rax
        testq     %rax, %rax
        jle       ..B2.7
..B2.3:
        movq      8(%r12), %rcx
        movq      %rax, %r12
        movq      %r13, 8(%rsp)
..___tag_value__Z8printseqRK6Vector.103:
        movq      %rdx, %r13
        movq      %r14, (%rsp)
..___tag_value__Z8printseqRK6Vector.104:
        movq      %rcx, %r14
..B2.4:
        movsd     (%r14,%r13,8), %xmm0
        movl      $.L_2__STRING.8, %edi
        movl      $1, %eax
..___tag_value__Z8printseqRK6Vector.105:
        call      printf
..___tag_value__Z8printseqRK6Vector.106:
..B2.5:
        incq      %r13
        cmpq      %r12, %r13
        jl        ..B2.4
..B2.6:
        movq      8(%rsp), %r13
..___tag_value__Z8printseqRK6Vector.107:
        movq      (%rsp), %r14
..___tag_value__Z8printseqRK6Vector.108:
..B2.7:
        addq      $16, %rsp
..___tag_value__Z8printseqRK6Vector.109:
        popq      %r12
..___tag_value__Z8printseqRK6Vector.111:
        ret       
        .align    16,0x90
..___tag_value__Z8printseqRK6Vector.112:
	.type	_Z8printseqRK6Vector,@function
	.size	_Z8printseqRK6Vector,.-_Z8printseqRK6Vector
	.data
# -- End  _Z8printseqRK6Vector
	.text
# -- Begin  _Z6AitkenR6Vector
       .align    16,0x90
	.globl _Z6AitkenR6Vector
_Z6AitkenR6Vector:
# parameter 1: %rdi
..B3.1:
..___tag_value__Z6AitkenR6Vector.113:
        pushq     %rsi
..___tag_value__Z6AitkenR6Vector.115:
        xorl      %edx, %edx
        movq      (%rdi), %rax
        movl      %eax, %r9d
        movslq    %eax, %rcx
        addl      $-2, %r9d
        xorl      %esi, %esi
        testl     %r9d, %r9d
        lea       -2(%rcx), %r8
        jle       ..B3.8
..B3.3:
        cmpq      %rax, %rdx
        jge       ..B3.11
..B3.4:
        movq      8(%rdi), %r10
        lea       1(%rdx), %r11
        cmpq      %rax, %r11
        movsd     (%r10,%rdx,8), %xmm3
        jge       ..B3.11
..B3.5:
        movsd     (%r10,%r11,8), %xmm0
        lea       2(%rdx), %r9
        cmpq      %rax, %r9
        jge       ..B3.11
..B3.6:
        movaps    %xmm0, %xmm1
        cmpq      %r8, %r11
        subsd     %xmm3, %xmm1
        movaps    %xmm1, %xmm2
        mulsd     %xmm1, %xmm2
        addsd     %xmm0, %xmm1
        pxor      %xmm0, %xmm0
        subsd     %xmm1, %xmm0
        addsd     (%r10,%r9,8), %xmm0
        divsd     %xmm0, %xmm2
        subsd     %xmm2, %xmm3
        movsd     %xmm3, (%r10,%rdx,8)
        movq      %r11, %rdx
        jge       ..B3.7
..B3.18:
        movq      (%rdi), %rax
        jmp       ..B3.3
..B3.7:
        movq      (%rdi), %rax
..B3.8:
        cmpq      %rax, %r8
        jge       ..B3.11
..B3.9:
        movq      8(%rdi), %rax
        decq      %rcx
        movq      %rsi, (%rax,%r8,8)
        cmpq      (%rdi), %rcx
        jge       ..B3.11
..B3.10:
        movq      8(%rdi), %rax
        movq      %rsi, (%rax,%rcx,8)
        popq      %rcx
..___tag_value__Z6AitkenR6Vector.116:
        ret       
..___tag_value__Z6AitkenR6Vector.117:
..B3.11:
        movl      $.L_2__STRING.3, %edi
        movl      $.L_2__STRING.1, %esi
        movl      $90, %edx
        movl      $__$U3, %ecx
        call      __assert_fail
        .align    16,0x90
..___tag_value__Z6AitkenR6Vector.118:
	.type	_Z6AitkenR6Vector,@function
	.size	_Z6AitkenR6Vector,.-_Z6AitkenR6Vector
	.data
# -- End  _Z6AitkenR6Vector
	.section .text._ZN6VectorD1Ev, "xaG",@progbits,_ZN6VectorD1Ev,comdat
..TXTST1:
# -- Begin  _ZN6VectorD1Ev
       .align    16,0x90
	.weak _ZN6VectorD1Ev
_ZN6VectorD1Ev:
# parameter 1: %rdi
..B4.1:
..___tag_value__ZN6VectorD1Ev.119:
        pushq     %rsi
..___tag_value__ZN6VectorD1Ev.121:
        cmpl      $0, 16(%rdi)
        je        ..B4.3
..B4.2:
        movq      8(%rdi), %rdi
        call      free
..B4.3:
        popq      %rcx
..___tag_value__ZN6VectorD1Ev.122:
        ret       
        .align    16,0x90
..___tag_value__ZN6VectorD1Ev.123:
	.type	_ZN6VectorD1Ev,@function
	.size	_ZN6VectorD1Ev,.-_ZN6VectorD1Ev
	.data
# -- End  _ZN6VectorD1Ev
	.text
# -- Begin  __sti__$E
       .align    16,0x90
__sti__$E:
..B5.1:
..___tag_value___sti__$E.124:
        pushq     %rsi
..___tag_value___sti__$E.126:
        movl      $_ZSt8__ioinit, %edi
..___tag_value___sti__$E.127:
        call      _ZNSt8ios_base4InitC1Ev
..___tag_value___sti__$E.128:
..B5.2:
        movl      $_ZNSt8ios_base4InitD1Ev, %edi
        movl      $_ZSt8__ioinit, %esi
        movl      $__dso_handle, %edx
        xorl      %eax, %eax
..___tag_value___sti__$E.129:
        call      __cxa_atexit
..___tag_value___sti__$E.130:
..B5.3:
        popq      %rcx
..___tag_value___sti__$E.131:
        ret       
        .align    16,0x90
..___tag_value___sti__$E.132:
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
	.align 4
	.align 1
__$U5:
	.byte	86
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	32
	.byte	38
	.byte	86
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	58
	.byte	58
	.byte	111
	.byte	112
	.byte	101
	.byte	114
	.byte	97
	.byte	116
	.byte	111
	.byte	114
	.byte	61
	.byte	40
	.byte	99
	.byte	111
	.byte	110
	.byte	115
	.byte	116
	.byte	32
	.byte	86
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	32
	.byte	38
	.byte	41
	.byte	0
	.type	__$U5,@object
	.size	__$U5,42
	.align 1
__$U2:
	.byte	118
	.byte	111
	.byte	105
	.byte	100
	.byte	32
	.byte	86
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	58
	.byte	58
	.byte	115
	.byte	104
	.byte	97
	.byte	100
	.byte	111
	.byte	119
	.byte	40
	.byte	99
	.byte	111
	.byte	110
	.byte	115
	.byte	116
	.byte	32
	.byte	86
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	32
	.byte	38
	.byte	44
	.byte	32
	.byte	108
	.byte	111
	.byte	110
	.byte	103
	.byte	44
	.byte	32
	.byte	108
	.byte	111
	.byte	110
	.byte	103
	.byte	41
	.byte	0
	.type	__$U2,@object
	.size	__$U2,48
	.align 1
__$U3:
	.byte	100
	.byte	111
	.byte	117
	.byte	98
	.byte	108
	.byte	101
	.byte	32
	.byte	38
	.byte	86
	.byte	101
	.byte	99
	.byte	116
	.byte	111
	.byte	114
	.byte	58
	.byte	58
	.byte	111
	.byte	112
	.byte	101
	.byte	114
	.byte	97
	.byte	116
	.byte	111
	.byte	114
	.byte	40
	.byte	41
	.byte	40
	.byte	108
	.byte	111
	.byte	110
	.byte	103
	.byte	41
	.byte	0
	.type	__$U3,@object
	.size	__$U3,33
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.1:
	.byte	46
	.byte	46
	.byte	47
	.byte	117
	.byte	116
	.byte	105
	.byte	108
	.byte	115
	.byte	47
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
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,19
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.5:
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	61
	.byte	61
	.byte	118
	.byte	46
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	0
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,13
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.byte	33
	.byte	111
	.byte	119
	.byte	110
	.byte	101
	.byte	114
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,7
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.byte	105
	.byte	43
	.byte	108
	.byte	101
	.byte	110
	.byte	60
	.byte	61
	.byte	118
	.byte	46
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.byte	105
	.byte	32
	.byte	60
	.byte	32
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,9
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.7:
	.byte	10
	.byte	32
	.byte	10
	.byte	0
	.type	.L_2__STRING.7,@object
	.size	.L_2__STRING.7,4
	.align 4
.L_2__STRING.8:
	.byte	37
	.byte	45
	.byte	46
	.byte	49
	.byte	48
	.byte	102
	.byte	10
	.byte	0
	.type	.L_2__STRING.8,@object
	.size	.L_2__STRING.8,8
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 32
.L_2__STRING.6:
	.byte	40
	.byte	40
	.byte	100
	.byte	97
	.byte	116
	.byte	97
	.byte	60
	.byte	118
	.byte	46
	.byte	100
	.byte	97
	.byte	116
	.byte	97
	.byte	41
	.byte	38
	.byte	38
	.byte	40
	.byte	40
	.byte	100
	.byte	97
	.byte	116
	.byte	97
	.byte	43
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	45
	.byte	49
	.byte	41
	.byte	60
	.byte	118
	.byte	46
	.byte	100
	.byte	97
	.byte	116
	.byte	97
	.byte	41
	.byte	41
	.byte	124
	.byte	124
	.byte	32
	.byte	40
	.byte	40
	.byte	100
	.byte	97
	.byte	116
	.byte	97
	.byte	62
	.byte	118
	.byte	46
	.byte	100
	.byte	97
	.byte	116
	.byte	97
	.byte	41
	.byte	38
	.byte	38
	.byte	32
	.byte	40
	.byte	100
	.byte	97
	.byte	116
	.byte	97
	.byte	62
	.byte	40
	.byte	118
	.byte	46
	.byte	100
	.byte	97
	.byte	116
	.byte	97
	.byte	43
	.byte	115
	.byte	105
	.byte	122
	.byte	101
	.byte	45
	.byte	49
	.byte	41
	.byte	41
	.byte	41
	.byte	124
	.byte	124
	.byte	32
	.byte	40
	.byte	100
	.byte	97
	.byte	116
	.byte	97
	.byte	61
	.byte	61
	.byte	118
	.byte	46
	.byte	100
	.byte	97
	.byte	116
	.byte	97
	.byte	41
	.byte	0
	.type	.L_2__STRING.6,@object
	.size	.L_2__STRING.6,100
	.section .ctors, "wa"
	.align 8
__init_0:
	.type	__init_0,@object
	.size	__init_0,8
	.quad	__sti__$E
	.data
	.hidden __dso_handle
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
	.8byte ..___tag_value__Z7AitkenERK6Vectori.91-..___tag_value__Z7AitkenERK6Vectori.3
	.byte 0x08
	.8byte _Z7AitkenERK6Vectori$$LSDA
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.5-..___tag_value__Z7AitkenERK6Vectori.3
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.7-..___tag_value__Z7AitkenERK6Vectori.5
	.4byte 0x180e038d
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.9-..___tag_value__Z7AitkenERK6Vectori.7
	.4byte 0x200e048e
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
	.4byte ..___tag_value__Z7AitkenERK6Vectori.47-..___tag_value__Z7AitkenERK6Vectori.15
	.4byte 0x04c6300e
	.4byte ..___tag_value__Z7AitkenERK6Vectori.50-..___tag_value__Z7AitkenERK6Vectori.47
	.4byte 0x04c3280e
	.4byte ..___tag_value__Z7AitkenERK6Vectori.52-..___tag_value__Z7AitkenERK6Vectori.50
	.4byte 0x04ce200e
	.4byte ..___tag_value__Z7AitkenERK6Vectori.54-..___tag_value__Z7AitkenERK6Vectori.52
	.4byte 0x04cd180e
	.4byte ..___tag_value__Z7AitkenERK6Vectori.56-..___tag_value__Z7AitkenERK6Vectori.54
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z7AitkenERK6Vectori.58-..___tag_value__Z7AitkenERK6Vectori.56
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7AitkenERK6Vectori.59-..___tag_value__Z7AitkenERK6Vectori.58
	.8byte 0x028c06860583700e
	.4byte 0x048e038d
	.2byte 0x0000
	.byte 0x00
	.4byte 0x00000054
	.4byte 0x000000bc
	.8byte ..___tag_value__Z8printseqRK6Vector.96
	.8byte ..___tag_value__Z8printseqRK6Vector.112-..___tag_value__Z8printseqRK6Vector.96
	.2byte 0x0400
	.4byte ..___tag_value__Z8printseqRK6Vector.98-..___tag_value__Z8printseqRK6Vector.96
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__Z8printseqRK6Vector.100-..___tag_value__Z8printseqRK6Vector.98
	.2byte 0x200e
	.byte 0x04
	.4byte ..___tag_value__Z8printseqRK6Vector.103-..___tag_value__Z8printseqRK6Vector.100
	.2byte 0x038d
	.byte 0x04
	.4byte ..___tag_value__Z8printseqRK6Vector.104-..___tag_value__Z8printseqRK6Vector.103
	.2byte 0x048e
	.byte 0x04
	.4byte ..___tag_value__Z8printseqRK6Vector.107-..___tag_value__Z8printseqRK6Vector.104
	.2byte 0x04cd
	.4byte ..___tag_value__Z8printseqRK6Vector.108-..___tag_value__Z8printseqRK6Vector.107
	.2byte 0x04ce
	.4byte ..___tag_value__Z8printseqRK6Vector.109-..___tag_value__Z8printseqRK6Vector.108
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z8printseqRK6Vector.111-..___tag_value__Z8printseqRK6Vector.109
	.8byte 0x000000000000080e
	.4byte 0x0000002c
	.4byte 0x00000114
	.8byte ..___tag_value__Z6AitkenR6Vector.113
	.8byte ..___tag_value__Z6AitkenR6Vector.118-..___tag_value__Z6AitkenR6Vector.113
	.2byte 0x0400
	.4byte ..___tag_value__Z6AitkenR6Vector.115-..___tag_value__Z6AitkenR6Vector.113
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z6AitkenR6Vector.116-..___tag_value__Z6AitkenR6Vector.115
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z6AitkenR6Vector.117-..___tag_value__Z6AitkenR6Vector.116
	.4byte 0x0000100e
	.4byte 0x00000024
	.4byte 0x00000144
	.8byte ..___tag_value__ZN6VectorD1Ev.119
	.8byte ..___tag_value__ZN6VectorD1Ev.123-..___tag_value__ZN6VectorD1Ev.119
	.2byte 0x0400
	.4byte ..___tag_value__ZN6VectorD1Ev.121-..___tag_value__ZN6VectorD1Ev.119
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__ZN6VectorD1Ev.122-..___tag_value__ZN6VectorD1Ev.121
	.2byte 0x080e
	.byte 0x00
	.4byte 0x00000024
	.4byte 0x0000016c
	.8byte ..___tag_value___sti__$E.124
	.8byte ..___tag_value___sti__$E.132-..___tag_value___sti__$E.124
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.126-..___tag_value___sti__$E.124
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.131-..___tag_value___sti__$E.126
	.2byte 0x080e
	.byte 0x00
# End

