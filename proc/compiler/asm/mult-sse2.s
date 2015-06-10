	.file "mult.cpp"
	.text
..TXTST0:
# -- Begin  _Z7multijkPdS_S_i
       .align    16,0x90
	.globl _Z7multijkPdS_S_i
_Z7multijkPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B1.1:
..___tag_value__Z7multijkPdS_S_i.1:
        pushq     %rbp
..___tag_value__Z7multijkPdS_S_i.3:
        movq      %rdi, %r9
        xorl      %r10d, %r10d
        testl     %ecx, %ecx
        jle       ..B1.13
..B1.2:
        movl      %ecx, %r8d
        lea       (%rcx,%rcx), %eax
        movslq    %eax, %r11
        negl      %eax
        shrl      $31, %r8d
        movl      %ecx, %ebp
        addl      %ecx, %r8d
        negl      %ebp
        sarl      $1, %r8d
        movslq    %ecx, %rdi
        lea       (%rax,%rcx,2), %eax
        movq      %rsi, -72(%rsp)
        movq      %r12, -112(%rsp)
        movq      %r13, -104(%rsp)
        movq      %r14, -96(%rsp)
        movq      %r15, -88(%rsp)
        movq      %rbx, -80(%rsp)
..___tag_value__Z7multijkPdS_S_i.5:
..B1.3:
        movl      %r10d, %ebx
        xorl      %r12d, %r12d
        movq      %rdx, -64(%rsp)
        lea       (%r9,%r10,8), %rsi
        movl      %eax, -40(%rsp)
        lea       (%rdx,%r10,8), %r15
        movq      %rdi, -48(%rsp)
        movq      %r10, -56(%rsp)
        lea       (%rax,%rbx), %r14d
        subl      %ecx, %ebx
        movslq    %r14d, %r14
        movq      %r9, -32(%rsp)
        movq      -72(%rsp), %rdx
        lea       (%rbx,%rcx,2), %r13d
        xorl      %ebx, %ebx
        movslq    %r13d, %r13
..B1.4:
        movl      $1, %eax
        xorl      %r9d, %r9d
        movq      %r13, %r10
        movq      %r14, %rdi
        testl     %r8d, %r8d
        jbe       ..B1.8
..B1.5:
        movslq    %ebx, %rax
        movl      %ecx, -24(%rsp)
        movl      %ebp, -16(%rsp)
        movq      -32(%rsp), %rcx
        movsd     (%r15,%rax,8), %xmm0
..B1.6:
        movsd     (%rcx,%rdi,8), %xmm1
        lea       (%rbx,%r9,2), %ebp
        movslq    %ebp, %rbp
        incl      %r9d
        addq      %r11, %rdi
        mulsd     (%rdx,%rbp,8), %xmm1
        addsd     %xmm1, %xmm0
        movsd     %xmm0, (%r15,%rax,8)
        movsd     (%rcx,%r10,8), %xmm2
        addq      %r11, %r10
        mulsd     8(%rdx,%rbp,8), %xmm2
        addsd     %xmm2, %xmm0
        movsd     %xmm0, (%r15,%rax,8)
        cmpl      %r8d, %r9d
        jb        ..B1.6
..B1.7:
        movl      -16(%rsp), %ebp
        lea       1(%r9,%r9), %eax
        movl      -24(%rsp), %ecx
..B1.8:
        lea       -1(%rax), %edi
        cmpl      %edi, %ecx
        jbe       ..B1.10
..B1.9:
        movl      %eax, %edi
        imull     %ecx, %edi
        addl      %ebp, %edi
        movslq    %ebx, %rbx
        movslq    %edi, %rdi
        movslq    %eax, %rax
        addq      %rbx, %rax
        movsd     (%rsi,%rdi,8), %xmm0
        mulsd     -8(%rdx,%rax,8), %xmm0
        addsd     (%r15,%rbx,8), %xmm0
        movsd     %xmm0, (%r15,%rbx,8)
..B1.10:
        incl      %r12d
        addl      %ecx, %ebx
        cmpl      %ecx, %r12d
        jb        ..B1.4
..B1.11:
        movq      -56(%rsp), %r10
        incq      %r10
        movq      -48(%rsp), %rdi
        movl      -40(%rsp), %eax
        movq      -32(%rsp), %r9
        movq      -64(%rsp), %rdx
        cmpq      %rdi, %r10
        jb        ..B1.3
..B1.12:
        movq      -112(%rsp), %r12
..___tag_value__Z7multijkPdS_S_i.10:
        movq      -104(%rsp), %r13
..___tag_value__Z7multijkPdS_S_i.11:
        movq      -96(%rsp), %r14
..___tag_value__Z7multijkPdS_S_i.12:
        movq      -88(%rsp), %r15
..___tag_value__Z7multijkPdS_S_i.13:
        movq      -80(%rsp), %rbx
..___tag_value__Z7multijkPdS_S_i.14:
..B1.13:
..___tag_value__Z7multijkPdS_S_i.15:
        popq      %rbp
..___tag_value__Z7multijkPdS_S_i.16:
        ret       
        .align    16,0x90
..___tag_value__Z7multijkPdS_S_i.17:
	.type	_Z7multijkPdS_S_i,@function
	.size	_Z7multijkPdS_S_i,.-_Z7multijkPdS_S_i
	.data
# -- End  _Z7multijkPdS_S_i
	.text
# -- Begin  _Z8multijkxPdS_S_i
       .align    16,0x90
	.globl _Z8multijkxPdS_S_i
_Z8multijkxPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B2.1:
..___tag_value__Z8multijkxPdS_S_i.18:
        movq      %rdx, %r9
        movq      %rsi, %r8
        xorl      %edx, %edx
        movslq    %ecx, %rsi
        testl     %ecx, %ecx
        jle       ..B2.23
..B2.2:
        movq      %r12, -104(%rsp)
        lea       (%rcx,%rcx,2), %eax
        movq      %r13, -96(%rsp)
        movq      %r14, -88(%rsp)
        movq      %r15, -80(%rsp)
        movq      %rbx, -72(%rsp)
        movq      %rbp, -64(%rsp)
..___tag_value__Z8multijkxPdS_S_i.20:
..B2.3:
        movl      %eax, -56(%rsp)
        lea       (%r9,%rdx,8), %r13
        movq      %rdi, -24(%rsp)
        lea       (%rdi,%rdx,8), %r10
        movq      %rdx, -48(%rsp)
        lea       (%rdx,%rcx,2), %r14d
        movl      %r14d, -32(%rsp)
        xorl      %ebp, %ebp
        movq      %r9, -40(%rsp)
        lea       (%rdx,%rcx,4), %r11d
        xorl      %ebx, %ebx
        lea       (%rdx,%rax,2), %r12d
..B2.4:
        movsd     (%r13,%rbx,8), %xmm0
        cmpl      $8, %ecx
        jl        ..B2.24
..B2.5:
        lea       (%r8,%rbx,8), %r14
        movq      %r14, %rdi
        andq      $15, %rdi
        testl     %edi, %edi
        je        ..B2.8
..B2.6:
        testl     $7, %edi
        jne       ..B2.24
..B2.7:
        movl      $1, %edi
..B2.8:
        lea       8(%rdi), %eax
        cmpl      %eax, %ecx
        jl        ..B2.24
..B2.9:
        movl      %ecx, %edx
        xorl      %r9d, %r9d
        subl      %edi, %edx
        xorl      %r15d, %r15d
        andl      $7, %edx
        xorl      %eax, %eax
        negl      %edx
        addl      %ecx, %edx
        testl     %edi, %edi
        jbe       ..B2.13
..B2.11:
        movsd     (%r10,%r9,8), %xmm1
        incl      %r15d
        mulsd     (%r14,%rax,8), %xmm1
        addq      %rsi, %r9
        incq      %rax
        addsd     %xmm1, %xmm0
        cmpl      %edi, %r15d
        jb        ..B2.11
..B2.13:
        movl      %ecx, %eax
        xorps     %xmm3, %xmm3
        xorps     %xmm2, %xmm2
        movl      %ebp, -16(%rsp)
        movsd     %xmm0, %xmm3
        movq      %r8, -8(%rsp)
        xorps     %xmm1, %xmm1
        movl      %edi, %r9d
        xorps     %xmm0, %xmm0
        imull     %edi, %eax
        movl      -32(%rsp), %ebp
        movq      -24(%rsp), %r8
..B2.14:
        movslq    %eax, %rax
        addl      $8, %edi
        lea       (%r10,%rax,8), %r15
        movsd     (%r15), %xmm4
        movhpd    (%r15,%rsi,8), %xmm4
        lea       (%rbp,%rax), %r15d
        movslq    %r15d, %r15
        mulpd     (%r14,%r9,8), %xmm4
        addpd     %xmm4, %xmm3
        lea       (%r8,%r15,8), %r15
        movsd     (%r15), %xmm5
        movhpd    (%r15,%rsi,8), %xmm5
        lea       (%r11,%rax), %r15d
        movslq    %r15d, %r15
        mulpd     16(%r14,%r9,8), %xmm5
        addpd     %xmm5, %xmm2
        lea       (%r8,%r15,8), %r15
        movsd     (%r15), %xmm6
        movhpd    (%r15,%rsi,8), %xmm6
        lea       (%r12,%rax), %r15d
        movslq    %r15d, %r15
        lea       (%rax,%rcx,8), %eax
        mulpd     32(%r14,%r9,8), %xmm6
        addpd     %xmm6, %xmm1
        lea       (%r8,%r15,8), %r15
        movsd     (%r15), %xmm7
        movhpd    (%r15,%rsi,8), %xmm7
        mulpd     48(%r14,%r9,8), %xmm7
        addq      $8, %r9
        addpd     %xmm7, %xmm0
        cmpl      %edx, %edi
        jb        ..B2.14
..B2.15:
        addpd     %xmm2, %xmm3
        addpd     %xmm0, %xmm1
        addpd     %xmm1, %xmm3
        movaps    %xmm3, %xmm0
        unpckhpd  %xmm3, %xmm0
        movl      -16(%rsp), %ebp
        addsd     %xmm0, %xmm3
        movq      -8(%rsp), %r8
        movaps    %xmm3, %xmm0
..B2.16:
        movl      %ecx, %edi
        imull     %edx, %edi
        movslq    %edx, %r9
        movslq    %edi, %rdi
        cmpl      %ecx, %edx
        jae       ..B2.20
..B2.17:
        lea       (%r8,%rbx,8), %rax
..B2.18:
        movsd     (%r10,%rdi,8), %xmm1
        incl      %edx
        mulsd     (%rax,%r9,8), %xmm1
        addq      %rsi, %rdi
        incq      %r9
        addsd     %xmm1, %xmm0
        cmpl      %ecx, %edx
        jb        ..B2.18
..B2.20:
        incl      %ebp
        movsd     %xmm0, (%r13,%rbx,8)
        addq      %rsi, %rbx
        cmpl      %ecx, %ebp
        jb        ..B2.4
..B2.21:
        movq      -48(%rsp), %rdx
        incq      %rdx
        movl      -56(%rsp), %eax
        movq      -24(%rsp), %rdi
        movq      -40(%rsp), %r9
        cmpq      %rsi, %rdx
        jb        ..B2.3
..B2.22:
        movq      -104(%rsp), %r12
..___tag_value__Z8multijkxPdS_S_i.26:
        movq      -96(%rsp), %r13
..___tag_value__Z8multijkxPdS_S_i.27:
        movq      -88(%rsp), %r14
..___tag_value__Z8multijkxPdS_S_i.28:
        movq      -80(%rsp), %r15
..___tag_value__Z8multijkxPdS_S_i.29:
        movq      -72(%rsp), %rbx
..___tag_value__Z8multijkxPdS_S_i.30:
        movq      -64(%rsp), %rbp
..___tag_value__Z8multijkxPdS_S_i.31:
..B2.23:
        ret       
..___tag_value__Z8multijkxPdS_S_i.32:
..B2.24:
        xorl      %edx, %edx
        jmp       ..B2.16
        .align    16,0x90
..___tag_value__Z8multijkxPdS_S_i.38:
	.type	_Z8multijkxPdS_S_i,@function
	.size	_Z8multijkxPdS_S_i,.-_Z8multijkxPdS_S_i
	.data
# -- End  _Z8multijkxPdS_S_i
	.text
# -- Begin  _Z7multIJKPdS_S_i
       .align    16,0x90
	.globl _Z7multIJKPdS_S_i
_Z7multIJKPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B3.1:
..___tag_value__Z7multIJKPdS_S_i.39:
        pushq     %r12
..___tag_value__Z7multIJKPdS_S_i.41:
        pushq     %r13
..___tag_value__Z7multIJKPdS_S_i.43:
        pushq     %r14
..___tag_value__Z7multIJKPdS_S_i.45:
        pushq     %r15
..___tag_value__Z7multIJKPdS_S_i.47:
        pushq     %rbx
..___tag_value__Z7multIJKPdS_S_i.49:
        pushq     %rbp
..___tag_value__Z7multIJKPdS_S_i.51:
        subq      $360, %rsp
..___tag_value__Z7multIJKPdS_S_i.53:
        movslq    %ecx, %rcx
        movq      %rdi, 104(%rsp)
        movq      %rcx, 128(%rsp)
        testl     %ecx, %ecx
        jle       ..B3.74
..B3.2:
        movl      %ecx, %eax
        movl      $1, %ebx
        sarl      $1, %eax
        shrl      $30, %eax
        addl      %ecx, %eax
        sarl      $2, %eax
        movl      $0, (%rsp)
        movl      %eax, 8(%rsp)
        testl     %eax, %eax
        jbe       ..B3.48
..B3.3:
        movl      %ecx, %r8d
        lea       (,%rcx,4), %r12d
        movslq    %r12d, %r12
        lea       (%rcx,%rcx,2), %r9d
        movq      %r12, 24(%rsp)
        lea       (%rcx,%rcx), %eax
        negl      %r12d
        negl      %r9d
        negl      %eax
        negl      %r8d
        movl      %r8d, 80(%rsp)
        lea       (%r12,%rcx,4), %r14d
        movslq    %r14d, %r12
        lea       (%r9,%rcx,4), %r11d
        movslq    %r11d, %r9
        lea       (%rax,%rcx,4), %edi
        movslq    %edi, %rbx
        lea       (%r8,%rcx,4), %r15d
        movslq    %r15d, %r15
        movl      %r14d, %r13d
        movl      %r11d, %r10d
        movl      %edi, %ebp
        movq      %r15, 40(%rsp)
        xorl      %eax, %eax
        movl      %r15d, 136(%rsp)
        movq      %rbx, 56(%rsp)
        movl      %ebp, 144(%rsp)
        movl      %edi, 160(%rsp)
        movq      %r9, 64(%rsp)
        movl      %r10d, 152(%rsp)
        movl      %r11d, 168(%rsp)
        movq      %r12, 72(%rsp)
        movl      %r13d, 48(%rsp)
        movl      %r14d, 176(%rsp)
..B3.4:
        movq      40(%rsp), %rbp
        xorl      %r9d, %r9d
        movq      72(%rsp), %r10
        xorl      %edi, %edi
        movq      64(%rsp), %r11
        xorl      %r8d, %r8d
        movq      56(%rsp), %r12
        lea       (%rdx,%rbp,8), %rbp
        movq      %rbp, %rbx
        lea       (%rdx,%r10,8), %r14
        andq      $15, %rbx
        lea       (%rdx,%r11,8), %r13
        movl      %ebx, %r10d
        lea       (%rdx,%r12,8), %r11
        andl      $7, %r10d
        movl      %ebx, 264(%rsp)
        movl      %eax, 88(%rsp)
        movq      %rdx, 32(%rsp)
        movl      %r10d, 256(%rsp)
        movq      %r11, 224(%rsp)
        movq      %r13, 232(%rsp)
        movq      %r14, 240(%rsp)
        movq      %rbp, 248(%rsp)
        movl      %r9d, 96(%rsp)
        movl      48(%rsp), %eax
        movq      128(%rsp), %rdx
        movq      104(%rsp), %rbx
..B3.5:
        cmpq      $2, %rdx
        jl        ..B3.83
..B3.6:
        movl      264(%rsp), %ebp
        testl     %ebp, %ebp
        je        ..B3.9
..B3.7:
        cmpl      $0, 256(%rsp)
        jne       ..B3.83
..B3.8:
        movl      $1, %ebp
..B3.9:
        movl      %ebp, %r14d
        lea       2(%r14), %r9
        cmpq      %r9, %rdx
        jl        ..B3.83
..B3.10:
        movl      %edi, %r12d
        negl      %ebp
        subl      %ecx, %r12d
        addl      %ecx, %ebp
        movl      176(%rsp), %r10d
        andl      $1, %ebp
        movl      168(%rsp), %r15d
        negl      %ebp
        addl      %ecx, %ebp
        xorl      %r13d, %r13d
        movslq    %ebp, %rbp
        lea       (%r12,%rcx,4), %r11d
        movslq    %r11d, %r11
        lea       (%r10,%rdi), %r9d
        movslq    %r9d, %r9
        lea       (%r15,%rdi), %r10d
        movslq    %r10d, %r10
        lea       (%rbx,%r11,8), %r12
        lea       (%rbx,%r9,8), %r11
        movl      160(%rsp), %r9d
        lea       (%rbx,%r10,8), %r10
        lea       (%r9,%rdi), %r15d
        movslq    %r15d, %r15
        lea       (%rbx,%r15,8), %r9
        lea       (%rax,%r8), %r15d
        movslq    %r15d, %r15
        movsd     (%rsi,%r15,8), %xmm15
        movsd     8(%rsi,%r15,8), %xmm11
        movsd     16(%rsi,%r15,8), %xmm7
        movsd     24(%rsi,%r15,8), %xmm3
        movl      152(%rsp), %r15d
        addl      %r8d, %r15d
        movslq    %r15d, %r15
        movsd     (%rsi,%r15,8), %xmm14
        movsd     8(%rsi,%r15,8), %xmm10
        movsd     16(%rsi,%r15,8), %xmm6
        movsd     24(%rsi,%r15,8), %xmm2
        movl      144(%rsp), %r15d
        addl      %r8d, %r15d
        movslq    %r15d, %r15
        movsd     (%rsi,%r15,8), %xmm13
        movsd     8(%rsi,%r15,8), %xmm9
        movsd     16(%rsi,%r15,8), %xmm5
        movsd     24(%rsi,%r15,8), %xmm1
        movl      136(%rsp), %r15d
        addl      %r8d, %r15d
        movslq    %r15d, %r15
        movsd     (%rsi,%r15,8), %xmm12
        movsd     8(%rsi,%r15,8), %xmm8
        movsd     16(%rsi,%r15,8), %xmm4
        movsd     24(%rsi,%r15,8), %xmm0
        testq     %r14, %r14
        jbe       ..B3.14
..B3.11:
        movq      %rsi, 120(%rsp)
        movl      %ecx, 112(%rsp)
        movsd     %xmm9, 344(%rsp)
        movsd     %xmm15, 336(%rsp)
        movq      224(%rsp), %rcx
        movq      232(%rsp), %rbx
        movq      240(%rsp), %rsi
        movq      248(%rsp), %r15
..B3.12:
        movsd     (%r11,%r13,8), %xmm15
        movaps    %xmm15, %xmm9
        mulsd     336(%rsp), %xmm9
        addsd     (%rsi,%r13,8), %xmm9
        movsd     %xmm9, (%rsi,%r13,8)
        movaps    %xmm15, %xmm9
        mulsd     %xmm14, %xmm9
        addsd     (%rbx,%r13,8), %xmm9
        movsd     %xmm9, (%rbx,%r13,8)
        movaps    %xmm15, %xmm9
        mulsd     %xmm13, %xmm9
        mulsd     %xmm12, %xmm15
        addsd     (%rcx,%r13,8), %xmm9
        movsd     %xmm9, (%rcx,%r13,8)
        movsd     (%r10,%r13,8), %xmm9
        addsd     (%r15,%r13,8), %xmm15
        movsd     %xmm15, (%r15,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     %xmm11, %xmm15
        addsd     (%rsi,%r13,8), %xmm15
        movsd     %xmm15, (%rsi,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     %xmm10, %xmm15
        addsd     (%rbx,%r13,8), %xmm15
        movsd     %xmm15, (%rbx,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     344(%rsp), %xmm15
        mulsd     %xmm8, %xmm9
        addsd     (%rcx,%r13,8), %xmm15
        movsd     %xmm15, (%rcx,%r13,8)
        movsd     (%r9,%r13,8), %xmm15
        addsd     (%r15,%r13,8), %xmm9
        movsd     %xmm9, (%r15,%r13,8)
        movaps    %xmm15, %xmm9
        mulsd     %xmm7, %xmm9
        addsd     (%rsi,%r13,8), %xmm9
        movsd     %xmm9, (%rsi,%r13,8)
        movaps    %xmm15, %xmm9
        mulsd     %xmm6, %xmm9
        addsd     (%rbx,%r13,8), %xmm9
        movsd     %xmm9, (%rbx,%r13,8)
        movaps    %xmm15, %xmm9
        mulsd     %xmm5, %xmm9
        mulsd     %xmm4, %xmm15
        addsd     (%rcx,%r13,8), %xmm9
        movsd     %xmm9, (%rcx,%r13,8)
        .byte     144
        movsd     (%r12,%r13,8), %xmm9
        addsd     (%r15,%r13,8), %xmm15
        movsd     %xmm15, (%r15,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     %xmm3, %xmm15
        addsd     (%rsi,%r13,8), %xmm15
        movsd     %xmm15, (%rsi,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     %xmm2, %xmm15
        addsd     (%rbx,%r13,8), %xmm15
        movsd     %xmm15, (%rbx,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     %xmm1, %xmm15
        mulsd     %xmm0, %xmm9
        addsd     (%rcx,%r13,8), %xmm15
        movsd     %xmm15, (%rcx,%r13,8)
        addsd     (%r15,%r13,8), %xmm9
        movsd     %xmm9, (%r15,%r13,8)
        incq      %r13
        cmpq      %r14, %r13
        jb        ..B3.12
..B3.13:
        movsd     344(%rsp), %xmm9
        movsd     336(%rsp), %xmm15
        movq      104(%rsp), %rbx
        movq      120(%rsp), %rsi
        movl      112(%rsp), %ecx
..B3.14:
        movq      %rsi, 120(%rsp)
        movddup   %xmm15, %xmm15
        movddup   %xmm14, %xmm14
        movddup   %xmm13, %xmm13
        movl      %ecx, 112(%rsp)
        movddup   %xmm12, %xmm12
        movddup   %xmm11, %xmm11
        movddup   %xmm10, %xmm10
        movddup   %xmm9, %xmm9
        movddup   %xmm8, %xmm8
        movddup   %xmm7, %xmm7
        movddup   %xmm6, %xmm6
        movddup   %xmm5, %xmm5
        movddup   %xmm4, %xmm4
        movddup   %xmm3, %xmm3
        movddup   %xmm2, %xmm2
        movddup   %xmm1, %xmm1
        movddup   %xmm0, %xmm0
        movups    %xmm13, 304(%rsp)
        movups    %xmm14, 288(%rsp)
        movups    %xmm15, 272(%rsp)
        movq      224(%rsp), %rcx
        movq      232(%rsp), %rsi
        movq      240(%rsp), %r13
        movq      248(%rsp), %r15
..B3.15:
        movups    (%r11,%r14,8), %xmm13
        movups    (%r13,%r14,8), %xmm15
        movups    272(%rsp), %xmm14
        mulpd     %xmm13, %xmm14
        addpd     %xmm14, %xmm15
        movups    288(%rsp), %xmm14
        mulpd     %xmm13, %xmm14
        movups    %xmm15, (%r13,%r14,8)
        movups    (%rsi,%r14,8), %xmm15
        addpd     %xmm14, %xmm15
        movups    304(%rsp), %xmm14
        mulpd     %xmm13, %xmm14
        movups    %xmm15, (%rsi,%r14,8)
        mulpd     %xmm12, %xmm13
        movups    (%rcx,%r14,8), %xmm15
        addpd     %xmm14, %xmm15
        movups    %xmm15, (%rcx,%r14,8)
        movups    (%r10,%r14,8), %xmm15
        addpd     (%r15,%r14,8), %xmm13
        movups    %xmm13, (%r15,%r14,8)
        movaps    %xmm11, %xmm13
        mulpd     %xmm15, %xmm13
        movups    (%r13,%r14,8), %xmm14
        addpd     %xmm13, %xmm14
        movaps    %xmm10, %xmm13
        mulpd     %xmm15, %xmm13
        movups    %xmm14, (%r13,%r14,8)
        movups    (%rsi,%r14,8), %xmm14
        addpd     %xmm13, %xmm14
        movaps    %xmm9, %xmm13
        mulpd     %xmm15, %xmm13
        movups    %xmm14, (%rsi,%r14,8)
        mulpd     %xmm8, %xmm15
        movups    (%rcx,%r14,8), %xmm14
        addpd     %xmm13, %xmm14
        movups    %xmm14, (%rcx,%r14,8)
        movups    (%r9,%r14,8), %xmm14
        addpd     (%r15,%r14,8), %xmm15
        movups    %xmm15, (%r15,%r14,8)
        movaps    %xmm7, %xmm15
        mulpd     %xmm14, %xmm15
        movups    (%r13,%r14,8), %xmm13
        addpd     %xmm15, %xmm13
        movaps    %xmm6, %xmm15
        mulpd     %xmm14, %xmm15
        movups    %xmm13, (%r13,%r14,8)
        movups    (%rsi,%r14,8), %xmm13
        addpd     %xmm15, %xmm13
        movaps    %xmm5, %xmm15
        mulpd     %xmm14, %xmm15
        movups    %xmm13, (%rsi,%r14,8)
        mulpd     %xmm4, %xmm14
        movups    (%rcx,%r14,8), %xmm13
        addpd     %xmm15, %xmm13
        movups    %xmm13, (%rcx,%r14,8)
        movups    (%r12,%r14,8), %xmm13
        addpd     (%r15,%r14,8), %xmm14
        movups    %xmm14, (%r15,%r14,8)
        movaps    %xmm3, %xmm14
        mulpd     %xmm13, %xmm14
        movups    (%r13,%r14,8), %xmm15
        addpd     %xmm14, %xmm15
        movaps    %xmm2, %xmm14
        mulpd     %xmm13, %xmm14
        movups    %xmm15, (%r13,%r14,8)
        .byte     144
        movups    (%rsi,%r14,8), %xmm15
        addpd     %xmm14, %xmm15
        movaps    %xmm1, %xmm14
        mulpd     %xmm13, %xmm14
        movups    %xmm15, (%rsi,%r14,8)
        mulpd     %xmm0, %xmm13
        movups    (%rcx,%r14,8), %xmm15
        addpd     %xmm14, %xmm15
        movups    %xmm15, (%rcx,%r14,8)
        addpd     (%r15,%r14,8), %xmm13
        movups    %xmm13, (%r15,%r14,8)
        addq      $2, %r14
        cmpq      %rbp, %r14
        jb        ..B3.15
..B3.16:
        movq      120(%rsp), %rsi
        movl      112(%rsp), %ecx
..B3.17:
        cmpq      %rdx, %rbp
        jae       ..B3.21
..B3.18:
        movl      168(%rsp), %r13d
        movl      %edi, %r12d
        subl      %ecx, %r12d
        movl      176(%rsp), %r10d
        movl      160(%rsp), %r15d
        lea       (%r13,%rdi), %r14d
        movslq    %r14d, %r14
        lea       (%rax,%r8), %r13d
        movslq    %r13d, %r13
        lea       (%r12,%rcx,4), %r11d
        movslq    %r11d, %r11
        lea       (%r10,%rdi), %r9d
        movslq    %r9d, %r9
        movl      %ecx, 112(%rsp)
        lea       (%rbx,%r14,8), %r10
        movl      152(%rsp), %r14d
        movsd     (%rsi,%r13,8), %xmm13
        lea       (%rbx,%r11,8), %r12
        movsd     8(%rsi,%r13,8), %xmm15
        lea       (%rbx,%r9,8), %r11
        movsd     16(%rsi,%r13,8), %xmm12
        lea       (%r15,%rdi), %r9d
        movsd     24(%rsi,%r13,8), %xmm11
        lea       (%r14,%r8), %r15d
        movl      144(%rsp), %r13d
        movslq    %r15d, %r15
        movslq    %r9d, %r9
        movq      224(%rsp), %rcx
        lea       (%r13,%r8), %r14d
        movl      136(%rsp), %r13d
        movsd     (%rsi,%r15,8), %xmm10
        movsd     8(%rsi,%r15,8), %xmm9
        lea       (%rbx,%r9,8), %r9
        movsd     16(%rsi,%r15,8), %xmm8
        movsd     24(%rsi,%r15,8), %xmm7
        lea       (%r13,%r8), %r15d
        movslq    %r14d, %r14
        movslq    %r15d, %r15
        movsd     %xmm15, 320(%rsp)
        movq      232(%rsp), %r13
        movsd     (%rsi,%r14,8), %xmm14
        movsd     8(%rsi,%r14,8), %xmm6
        movsd     16(%rsi,%r14,8), %xmm5
        movsd     24(%rsi,%r14,8), %xmm4
        movsd     (%rsi,%r15,8), %xmm3
        movsd     8(%rsi,%r15,8), %xmm2
        movsd     16(%rsi,%r15,8), %xmm1
        movsd     24(%rsi,%r15,8), %xmm0
        movsd     %xmm14, 328(%rsp)
        movq      240(%rsp), %r14
        movq      248(%rsp), %r15
..B3.19:
        movsd     (%r11,%rbp,8), %xmm15
        movaps    %xmm13, %xmm14
        mulsd     %xmm15, %xmm14
        addsd     (%r14,%rbp,8), %xmm14
        movsd     %xmm14, (%r14,%rbp,8)
        movaps    %xmm15, %xmm14
        mulsd     %xmm10, %xmm14
        addsd     (%r13,%rbp,8), %xmm14
        movsd     %xmm14, (%r13,%rbp,8)
        movaps    %xmm15, %xmm14
        mulsd     328(%rsp), %xmm14
        mulsd     %xmm3, %xmm15
        addsd     (%rcx,%rbp,8), %xmm14
        movsd     %xmm14, (%rcx,%rbp,8)
        movsd     (%r10,%rbp,8), %xmm14
        addsd     (%r15,%rbp,8), %xmm15
        movsd     %xmm15, (%r15,%rbp,8)
        movsd     320(%rsp), %xmm15
        mulsd     %xmm14, %xmm15
        addsd     (%r14,%rbp,8), %xmm15
        movsd     %xmm15, (%r14,%rbp,8)
        movaps    %xmm14, %xmm15
        mulsd     %xmm9, %xmm15
        addsd     (%r13,%rbp,8), %xmm15
        movsd     %xmm15, (%r13,%rbp,8)
        movaps    %xmm14, %xmm15
        mulsd     %xmm6, %xmm15
        mulsd     %xmm2, %xmm14
        addsd     (%rcx,%rbp,8), %xmm15
        movsd     %xmm15, (%rcx,%rbp,8)
        movsd     (%r9,%rbp,8), %xmm15
        addsd     (%r15,%rbp,8), %xmm14
        movsd     %xmm14, (%r15,%rbp,8)
        movaps    %xmm12, %xmm14
        mulsd     %xmm15, %xmm14
        addsd     (%r14,%rbp,8), %xmm14
        movsd     %xmm14, (%r14,%rbp,8)
        movaps    %xmm15, %xmm14
        mulsd     %xmm8, %xmm14
        addsd     (%r13,%rbp,8), %xmm14
        movsd     %xmm14, (%r13,%rbp,8)
        movaps    %xmm15, %xmm14
        mulsd     %xmm5, %xmm14
        mulsd     %xmm1, %xmm15
        addsd     (%rcx,%rbp,8), %xmm14
        movsd     %xmm14, (%rcx,%rbp,8)
        movsd     (%r12,%rbp,8), %xmm14
        addsd     (%r15,%rbp,8), %xmm15
        movsd     %xmm15, (%r15,%rbp,8)
        movaps    %xmm11, %xmm15
        mulsd     %xmm14, %xmm15
        addsd     (%r14,%rbp,8), %xmm15
        movsd     %xmm15, (%r14,%rbp,8)
        movaps    %xmm14, %xmm15
        mulsd     %xmm7, %xmm15
        addsd     (%r13,%rbp,8), %xmm15
        movsd     %xmm15, (%r13,%rbp,8)
        movaps    %xmm14, %xmm15
        mulsd     %xmm4, %xmm15
        mulsd     %xmm0, %xmm14
        addsd     (%rcx,%rbp,8), %xmm15
        movsd     %xmm15, (%rcx,%rbp,8)
        addsd     (%r15,%rbp,8), %xmm14
        movsd     %xmm14, (%r15,%rbp,8)
        incq      %rbp
        cmpq      %rdx, %rbp
        jb        ..B3.19
..B3.20:
        movl      112(%rsp), %ecx
..B3.21:
        movl      96(%rsp), %ebp
        addl      $4, %r8d
        incl      %ebp
        lea       (%rdi,%rcx,4), %edi
        movl      %ebp, 96(%rsp)
        cmpl      8(%rsp), %ebp
        jb        ..B3.5
..B3.22:
        movl      %ebp, %r9d
        lea       1(,%r9,4), %ebx
        movl      %ecx, %r10d
        lea       -1(%rbx), %r8d
        movl      %r8d, 16(%rsp)
        movslq    %r8d, %r8
        imull     %r8d, %r10d
        movl      %eax, 48(%rsp)
        lea       (,%r8,8), %r9
        movl      88(%rsp), %eax
        movq      32(%rsp), %rdx
        movslq    %r10d, %r10
        cmpl      %ecx, %ebx
        ja        ..B3.46
..B3.23:
        movl      80(%rsp), %r11d
        movl      176(%rsp), %ebp
        movl      168(%rsp), %edi
        movl      160(%rsp), %r12d
        lea       (%r11,%rcx,4), %r14d
        movslq    %r14d, %r14
        lea       (%rbp,%rax), %r13d
        movslq    %r13d, %r13
        lea       (%rdi,%rax), %ebx
        movslq    %ebx, %rbx
        lea       (%r12,%rax), %r15d
        movslq    %r15d, %r15
        movl      %eax, 88(%rsp)
        lea       (%rsi,%r14,8), %r11
        movq      %rdx, 32(%rsp)
        lea       (%rdx,%r14,8), %r14
        movq      %r14, 216(%rsp)
        lea       (%rsi,%r13,8), %rbp
        movq      %rsi, 120(%rsp)
        lea       (%rdx,%r13,8), %r13
        movq      %r13, 208(%rsp)
        lea       (%rsi,%rbx,8), %rdi
        movq      128(%rsp), %rax
        lea       (%rdx,%rbx,8), %rbx
        movq      %rbx, 200(%rsp)
        lea       (%rsi,%r15,8), %r12
        lea       (%rdx,%r15,8), %r15
        movq      104(%rsp), %rdx
        movq      %r15, 192(%rsp)
..B3.24:
        cmpq      $2, %rax
        jl        ..B3.80
..B3.25:
        lea       (%rdx,%r10,8), %r15
        movq      %r15, %r14
        andq      $15, %r14
        testl     %r14d, %r14d
        je        ..B3.28
..B3.26:
        testl     $7, %r14d
        jne       ..B3.80
..B3.27:
        movl      $1, %r14d
..B3.28:
        movl      %r14d, %r13d
        lea       2(%r13), %rbx
        cmpq      %rbx, %rax
        jl        ..B3.80
..B3.29:
        movl      %ecx, %ebx
        xorl      %esi, %esi
        subl      %r14d, %ebx
        andl      $1, %ebx
        negl      %ebx
        addl      %ecx, %ebx
        movslq    %ebx, %rbx
        testq     %r13, %r13
        jbe       ..B3.79
..B3.30:
        movq      %r8, 184(%rsp)
        movl      %ecx, 112(%rsp)
        movsd     (%r9,%r11), %xmm2
        movsd     (%r9,%rbp), %xmm1
        movsd     (%r9,%rdi), %xmm3
        movsd     (%r9,%r12), %xmm0
        movq      192(%rsp), %rax
        movq      200(%rsp), %rdx
        movq      208(%rsp), %rcx
        movq      216(%rsp), %r8
        .align    16,0x90
..B3.31:
        movsd     (%r15,%rsi,8), %xmm7
        movaps    %xmm7, %xmm4
        movaps    %xmm7, %xmm5
        mulsd     %xmm1, %xmm4
        movaps    %xmm7, %xmm6
        mulsd     %xmm3, %xmm5
        mulsd     %xmm0, %xmm6
        addsd     (%rcx,%rsi,8), %xmm4
        mulsd     %xmm2, %xmm7
        movsd     %xmm4, (%rcx,%rsi,8)
        addsd     (%rdx,%rsi,8), %xmm5
        movsd     %xmm5, (%rdx,%rsi,8)
        addsd     (%rax,%rsi,8), %xmm6
        movsd     %xmm6, (%rax,%rsi,8)
        addsd     (%r8,%rsi,8), %xmm7
        movsd     %xmm7, (%r8,%rsi,8)
        incq      %rsi
        cmpq      %r13, %rsi
        jb        ..B3.31
..B3.32:
        movq      184(%rsp), %r8
        movq      128(%rsp), %rax
        movq      104(%rsp), %rdx
        movl      112(%rsp), %ecx
..B3.33:
        movl      %r14d, %r14d
        movq      216(%rsp), %rsi
        lea       (%rsi,%r14,8), %rsi
        testq     $15, %rsi
        je        ..B3.37
..B3.34:
        movl      %ecx, 112(%rsp)
        movddup   %xmm1, %xmm1
        movddup   %xmm3, %xmm4
        movddup   %xmm0, %xmm3
        movddup   %xmm2, %xmm0
        movq      192(%rsp), %rdx
        movq      200(%rsp), %rcx
        movq      208(%rsp), %rsi
        movq      216(%rsp), %r14
        .align    16,0x90
..B3.35:
        movups    (%r15,%r13,8), %xmm10
        movaps    %xmm10, %xmm2
        movaps    %xmm10, %xmm6
        mulpd     %xmm1, %xmm2
        movups    (%rsi,%r13,8), %xmm5
        mulpd     %xmm4, %xmm6
        addpd     %xmm2, %xmm5
        movups    %xmm5, (%rsi,%r13,8)
        movaps    %xmm10, %xmm8
        movups    (%rcx,%r13,8), %xmm7
        mulpd     %xmm3, %xmm8
        addpd     %xmm6, %xmm7
        mulpd     %xmm0, %xmm10
        movups    %xmm7, (%rcx,%r13,8)
        movups    (%rdx,%r13,8), %xmm9
        addpd     %xmm8, %xmm9
        movups    %xmm9, (%rdx,%r13,8)
        movups    (%r14,%r13,8), %xmm11
        addpd     %xmm10, %xmm11
        movups    %xmm11, (%r14,%r13,8)
        addq      $2, %r13
        cmpq      %rbx, %r13
        jb        ..B3.35
        jmp       ..B3.39
..B3.37:
        movl      %ecx, 112(%rsp)
        movddup   %xmm1, %xmm4
        movddup   %xmm3, %xmm3
        movddup   %xmm0, %xmm1
        movddup   %xmm2, %xmm0
        movq      192(%rsp), %rdx
        movq      200(%rsp), %rcx
        movq      208(%rsp), %rsi
        movq      216(%rsp), %r14
        .align    16,0x90
..B3.38:
        movups    (%r15,%r13,8), %xmm10
        movaps    %xmm10, %xmm2
        movaps    %xmm10, %xmm6
        mulpd     %xmm4, %xmm2
        movups    (%rsi,%r13,8), %xmm5
        mulpd     %xmm3, %xmm6
        addpd     %xmm2, %xmm5
        movups    %xmm5, (%rsi,%r13,8)
        movaps    %xmm10, %xmm8
        movups    (%rcx,%r13,8), %xmm7
        mulpd     %xmm1, %xmm8
        addpd     %xmm6, %xmm7
        mulpd     %xmm0, %xmm10
        movups    %xmm7, (%rcx,%r13,8)
        movups    (%rdx,%r13,8), %xmm9
        addpd     %xmm8, %xmm9
        movups    %xmm9, (%rdx,%r13,8)
        addpd     (%r14,%r13,8), %xmm10
        movups    %xmm10, (%r14,%r13,8)
        addq      $2, %r13
        cmpq      %rbx, %r13
        jb        ..B3.38
..B3.39:
        movq      104(%rsp), %rdx
        movl      112(%rsp), %ecx
..B3.40:
        cmpq      %rax, %rbx
        jae       ..B3.44
..B3.41:
        movl      %ecx, 112(%rsp)
        lea       (%rdx,%r10,8), %rsi
        movsd     (%r11,%r8,8), %xmm3
        movsd     (%rbp,%r8,8), %xmm2
        movsd     (%rdi,%r8,8), %xmm1
        movsd     (%r12,%r8,8), %xmm0
        movq      192(%rsp), %rcx
        movq      200(%rsp), %r13
        movq      208(%rsp), %r14
        movq      216(%rsp), %r15
        .align    16,0x90
..B3.42:
        movsd     (%rsi,%rbx,8), %xmm7
        movaps    %xmm7, %xmm4
        movaps    %xmm7, %xmm5
        mulsd     %xmm2, %xmm4
        movaps    %xmm7, %xmm6
        mulsd     %xmm1, %xmm5
        mulsd     %xmm0, %xmm6
        addsd     (%r14,%rbx,8), %xmm4
        mulsd     %xmm3, %xmm7
        movsd     %xmm4, (%r14,%rbx,8)
        addsd     (%r13,%rbx,8), %xmm5
        movsd     %xmm5, (%r13,%rbx,8)
        addsd     (%rcx,%rbx,8), %xmm6
        movsd     %xmm6, (%rcx,%rbx,8)
        addsd     (%r15,%rbx,8), %xmm7
        movsd     %xmm7, (%r15,%rbx,8)
        incq      %rbx
        cmpq      %rax, %rbx
        jb        ..B3.42
..B3.43:
        movl      112(%rsp), %ecx
..B3.44:
        movl      16(%rsp), %ebx
        addq      %rax, %r10
        incl      %ebx
        addq      $8, %r9
        incq      %r8
        movl      %ebx, 16(%rsp)
        cmpl      %ecx, %ebx
        jb        ..B3.24
..B3.45:
        movl      88(%rsp), %eax
        movq      120(%rsp), %rsi
        movq      32(%rsp), %rdx
..B3.46:
        movl      136(%rsp), %ebx
        lea       (%rax,%rcx,4), %eax
        movl      80(%rsp), %edi
        movl      144(%rsp), %r9d
        movl      152(%rsp), %r11d
        lea       (%rbx,%rcx,4), %ebp
        movl      48(%rsp), %r14d
        lea       (%rdi,%rcx,4), %r8d
        movq      24(%rsp), %r13
        lea       (%r9,%rcx,4), %r10d
        movl      (%rsp), %ebx
        lea       (%r11,%rcx,4), %r12d
        incl      %ebx
        lea       (%r14,%rcx,4), %r15d
        addq      %r13, 40(%rsp)
        addq      %r13, 56(%rsp)
        addq      %r13, 64(%rsp)
        addq      %r13, 72(%rsp)
        movl      %ebp, 136(%rsp)
        movl      %r8d, 80(%rsp)
        movl      %r10d, 144(%rsp)
        movl      %r12d, 152(%rsp)
        movl      %r15d, 48(%rsp)
        movl      %ebx, (%rsp)
        cmpl      8(%rsp), %ebx
        jb        ..B3.4
..B3.47:
        movl      %ebx, %eax
        lea       1(,%rax,4), %ebx
..B3.48:
        movl      %ecx, %r12d
        lea       -1(%rbx), %r13d
        imull     %r13d, %r12d
        movslq    %r12d, %r12
        cmpl      %ecx, %ebx
        ja        ..B3.74
..B3.49:
        movq      128(%rsp), %rdi
..B3.50:
        xorl      %eax, %eax
        lea       (%rdx,%r12,8), %r11
        movq      %r11, %r14
        xorl      %r8d, %r8d
        andq      $15, %r14
        xorl      %ebx, %ebx
        movl      %r14d, %r15d
        lea       (%rsi,%r12,8), %r10
        andl      $7, %r15d
        xorl      %ebp, %ebp
        movl      %r15d, 24(%rsp)
        xorl      %r9d, %r9d
        movl      %r14d, 40(%rsp)
        movq      %r11, 16(%rsp)
        movq      %r12, (%rsp)
        movl      %r13d, 8(%rsp)
        movq      %rsi, 120(%rsp)
        movq      %rdx, 32(%rsp)
        movq      104(%rsp), %r15
..B3.51:
        cmpq      $8, %rdi
        jl        ..B3.76
..B3.52:
        movl      40(%rsp), %r12d
        testl     %r12d, %r12d
        je        ..B3.55
..B3.53:
        cmpl      $0, 24(%rsp)
        jne       ..B3.76
..B3.54:
        movl      $1, %r12d
..B3.55:
        movl      %r12d, %r13d
        lea       8(%r13), %rdx
        cmpq      %rdx, %rdi
        jl        ..B3.76
..B3.56:
        movl      %ecx, %r14d
        xorl      %edx, %edx
        subl      %r12d, %r14d
        movslq    %ebp, %rsi
        andl      $7, %r14d
        negl      %r14d
        addl      %ecx, %r14d
        movslq    %r14d, %r14
        lea       (%r15,%rsi,8), %r11
        testq     %r13, %r13
        jbe       ..B3.75
..B3.57:
        movl      %ecx, 112(%rsp)
        movsd     (%rbx,%r10), %xmm0
        movq      16(%rsp), %rcx
..B3.58:
        movsd     (%r11,%rdx,8), %xmm1
        mulsd     %xmm0, %xmm1
        addsd     (%rcx,%rdx,8), %xmm1
        movsd     %xmm1, (%rcx,%rdx,8)
        incq      %rdx
        cmpq      %r13, %rdx
        jb        ..B3.58
..B3.59:
        movl      112(%rsp), %ecx
..B3.60:
        addq      %r12, %rsi
        lea       (%r15,%rsi,8), %rdx
        testq     $15, %rdx
        je        ..B3.64
..B3.61:
        movq      16(%rsp), %rdx
        movddup   %xmm0, %xmm0
        .align    16,0x90
..B3.62:
        movups    (%r11,%r13,8), %xmm1
        movups    16(%r11,%r13,8), %xmm2
        movups    32(%r11,%r13,8), %xmm3
        movups    48(%r11,%r13,8), %xmm4
        mulpd     %xmm0, %xmm1
        mulpd     %xmm0, %xmm2
        mulpd     %xmm0, %xmm3
        mulpd     %xmm0, %xmm4
        addpd     (%rdx,%r13,8), %xmm1
        addpd     16(%rdx,%r13,8), %xmm2
        addpd     32(%rdx,%r13,8), %xmm3
        addpd     48(%rdx,%r13,8), %xmm4
        movups    %xmm1, (%rdx,%r13,8)
        movups    %xmm2, 16(%rdx,%r13,8)
        movups    %xmm3, 32(%rdx,%r13,8)
        movups    %xmm4, 48(%rdx,%r13,8)
        addq      $8, %r13
        cmpq      %r14, %r13
        jb        ..B3.62
        jmp       ..B3.67
..B3.64:
        movq      16(%rsp), %rdx
        movddup   %xmm0, %xmm0
        .align    16,0x90
..B3.65:
        movups    (%r11,%r13,8), %xmm1
        movups    16(%r11,%r13,8), %xmm2
        movups    32(%r11,%r13,8), %xmm3
        movups    48(%r11,%r13,8), %xmm4
        mulpd     %xmm0, %xmm1
        mulpd     %xmm0, %xmm2
        mulpd     %xmm0, %xmm3
        mulpd     %xmm0, %xmm4
        addpd     (%rdx,%r13,8), %xmm1
        addpd     16(%rdx,%r13,8), %xmm2
        addpd     32(%rdx,%r13,8), %xmm3
        addpd     48(%rdx,%r13,8), %xmm4
        movups    %xmm1, (%rdx,%r13,8)
        movups    %xmm2, 16(%rdx,%r13,8)
        movups    %xmm3, 32(%rdx,%r13,8)
        movups    %xmm4, 48(%rdx,%r13,8)
        addq      $8, %r13
        cmpq      %r14, %r13
        jb        ..B3.65
..B3.67:
        cmpq      %rdi, %r14
        jae       ..B3.71
..B3.68:
        movsd     (%r10,%rax,8), %xmm0
        lea       (%r15,%r9,8), %rdx
        movq      16(%rsp), %rsi
..B3.69:
        movsd     (%rdx,%r14,8), %xmm1
        mulsd     %xmm0, %xmm1
        addsd     (%rsi,%r14,8), %xmm1
        movsd     %xmm1, (%rsi,%r14,8)
        incq      %r14
        cmpq      %rdi, %r14
        jb        ..B3.69
..B3.71:
        incl      %r8d
        addq      %rdi, %r9
        addl      %ecx, %ebp
        addq      $8, %rbx
        incq      %rax
        cmpl      %ecx, %r8d
        jb        ..B3.51
..B3.72:
        movl      8(%rsp), %r13d
        incl      %r13d
        movq      (%rsp), %r12
        addq      %rdi, %r12
        movq      120(%rsp), %rsi
        movq      32(%rsp), %rdx
        cmpl      %ecx, %r13d
        jb        ..B3.50
..B3.74:
        addq      $360, %rsp
..___tag_value__Z7multIJKPdS_S_i.54:
        popq      %rbp
..___tag_value__Z7multIJKPdS_S_i.56:
        popq      %rbx
..___tag_value__Z7multIJKPdS_S_i.58:
        popq      %r15
..___tag_value__Z7multIJKPdS_S_i.60:
        popq      %r14
..___tag_value__Z7multIJKPdS_S_i.62:
        popq      %r13
..___tag_value__Z7multIJKPdS_S_i.64:
        popq      %r12
..___tag_value__Z7multIJKPdS_S_i.66:
        ret       
..___tag_value__Z7multIJKPdS_S_i.67:
..B3.75:
        movsd     (%r10,%rax,8), %xmm0
        jmp       ..B3.60
..B3.76:
        xorl      %r14d, %r14d
        jmp       ..B3.67
..B3.79:
        movsd     (%r11,%r8,8), %xmm2
        movsd     (%rbp,%r8,8), %xmm1
        movsd     (%rdi,%r8,8), %xmm3
        movsd     (%r12,%r8,8), %xmm0
        jmp       ..B3.33
..B3.80:
        xorl      %ebx, %ebx
        jmp       ..B3.40
..B3.83:
        xorl      %ebp, %ebp
        jmp       ..B3.17
        .align    16,0x90
..___tag_value__Z7multIJKPdS_S_i.74:
	.type	_Z7multIJKPdS_S_i,@function
	.size	_Z7multIJKPdS_S_i,.-_Z7multIJKPdS_S_i
	.data
# -- End  _Z7multIJKPdS_S_i
	.text
# -- Begin  _Z8multIJKXPdS_S_i
       .align    16,0x90
	.globl _Z8multIJKXPdS_S_i
_Z8multIJKXPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B4.1:
..___tag_value__Z8multIJKXPdS_S_i.75:
        pushq     %r12
..___tag_value__Z8multIJKXPdS_S_i.77:
        pushq     %r13
..___tag_value__Z8multIJKXPdS_S_i.79:
        pushq     %r14
..___tag_value__Z8multIJKXPdS_S_i.81:
        pushq     %r15
..___tag_value__Z8multIJKXPdS_S_i.83:
        pushq     %rbx
..___tag_value__Z8multIJKXPdS_S_i.85:
        pushq     %rbp
..___tag_value__Z8multIJKXPdS_S_i.87:
        subq      $360, %rsp
..___tag_value__Z8multIJKXPdS_S_i.89:
        movslq    %ecx, %rcx
        movq      %rdi, 104(%rsp)
        movq      %rcx, 128(%rsp)
        testl     %ecx, %ecx
        jle       ..B4.74
..B4.2:
        movl      %ecx, %eax
        movl      $1, %ebx
        sarl      $1, %eax
        shrl      $30, %eax
        addl      %ecx, %eax
        sarl      $2, %eax
        movl      $0, (%rsp)
        movl      %eax, 8(%rsp)
        testl     %eax, %eax
        jbe       ..B4.48
..B4.3:
        movl      %ecx, %r8d
        lea       (,%rcx,4), %r12d
        movslq    %r12d, %r12
        lea       (%rcx,%rcx,2), %r9d
        movq      %r12, 24(%rsp)
        lea       (%rcx,%rcx), %eax
        negl      %r12d
        negl      %r9d
        negl      %eax
        negl      %r8d
        movl      %r8d, 80(%rsp)
        lea       (%r12,%rcx,4), %r14d
        movslq    %r14d, %r12
        lea       (%r9,%rcx,4), %r11d
        movslq    %r11d, %r9
        lea       (%rax,%rcx,4), %edi
        movslq    %edi, %rbx
        lea       (%r8,%rcx,4), %r15d
        movslq    %r15d, %r15
        movl      %r14d, %r13d
        movl      %r11d, %r10d
        movl      %edi, %ebp
        movq      %r15, 40(%rsp)
        xorl      %eax, %eax
        movl      %r15d, 136(%rsp)
        movq      %rbx, 56(%rsp)
        movl      %ebp, 144(%rsp)
        movl      %edi, 160(%rsp)
        movq      %r9, 64(%rsp)
        movl      %r10d, 152(%rsp)
        movl      %r11d, 168(%rsp)
        movq      %r12, 72(%rsp)
        movl      %r13d, 48(%rsp)
        movl      %r14d, 176(%rsp)
..B4.4:
        movq      40(%rsp), %rbp
        xorl      %r9d, %r9d
        movq      72(%rsp), %r10
        xorl      %edi, %edi
        movq      64(%rsp), %r11
        xorl      %r8d, %r8d
        movq      56(%rsp), %r12
        lea       (%rdx,%rbp,8), %rbp
        movq      %rbp, %rbx
        lea       (%rdx,%r10,8), %r14
        andq      $15, %rbx
        lea       (%rdx,%r11,8), %r13
        movl      %ebx, %r10d
        lea       (%rdx,%r12,8), %r11
        andl      $7, %r10d
        movl      %ebx, 264(%rsp)
        movl      %eax, 88(%rsp)
        movq      %rdx, 32(%rsp)
        movl      %r10d, 256(%rsp)
        movq      %r11, 224(%rsp)
        movq      %r13, 232(%rsp)
        movq      %r14, 240(%rsp)
        movq      %rbp, 248(%rsp)
        movl      %r9d, 96(%rsp)
        movl      48(%rsp), %eax
        movq      128(%rsp), %rdx
        movq      104(%rsp), %rbx
..B4.5:
        cmpq      $2, %rdx
        jl        ..B4.83
..B4.6:
        movl      264(%rsp), %ebp
        testl     %ebp, %ebp
        je        ..B4.9
..B4.7:
        cmpl      $0, 256(%rsp)
        jne       ..B4.83
..B4.8:
        movl      $1, %ebp
..B4.9:
        movl      %ebp, %r14d
        lea       2(%r14), %r9
        cmpq      %r9, %rdx
        jl        ..B4.83
..B4.10:
        movl      %edi, %r12d
        negl      %ebp
        subl      %ecx, %r12d
        addl      %ecx, %ebp
        movl      176(%rsp), %r10d
        andl      $1, %ebp
        movl      168(%rsp), %r15d
        negl      %ebp
        addl      %ecx, %ebp
        xorl      %r13d, %r13d
        movslq    %ebp, %rbp
        lea       (%r12,%rcx,4), %r11d
        movslq    %r11d, %r11
        lea       (%r10,%rdi), %r9d
        movslq    %r9d, %r9
        lea       (%r15,%rdi), %r10d
        movslq    %r10d, %r10
        lea       (%rbx,%r11,8), %r12
        lea       (%rbx,%r9,8), %r11
        movl      160(%rsp), %r9d
        lea       (%rbx,%r10,8), %r10
        lea       (%r9,%rdi), %r15d
        movslq    %r15d, %r15
        lea       (%rbx,%r15,8), %r9
        lea       (%rax,%r8), %r15d
        movslq    %r15d, %r15
        movsd     (%rsi,%r15,8), %xmm15
        movsd     8(%rsi,%r15,8), %xmm11
        movsd     16(%rsi,%r15,8), %xmm7
        movsd     24(%rsi,%r15,8), %xmm3
        movl      152(%rsp), %r15d
        addl      %r8d, %r15d
        movslq    %r15d, %r15
        movsd     (%rsi,%r15,8), %xmm14
        movsd     8(%rsi,%r15,8), %xmm10
        movsd     16(%rsi,%r15,8), %xmm6
        movsd     24(%rsi,%r15,8), %xmm2
        movl      144(%rsp), %r15d
        addl      %r8d, %r15d
        movslq    %r15d, %r15
        movsd     (%rsi,%r15,8), %xmm13
        movsd     8(%rsi,%r15,8), %xmm9
        movsd     16(%rsi,%r15,8), %xmm5
        movsd     24(%rsi,%r15,8), %xmm1
        movl      136(%rsp), %r15d
        addl      %r8d, %r15d
        movslq    %r15d, %r15
        movsd     (%rsi,%r15,8), %xmm12
        movsd     8(%rsi,%r15,8), %xmm8
        movsd     16(%rsi,%r15,8), %xmm4
        movsd     24(%rsi,%r15,8), %xmm0
        testq     %r14, %r14
        jbe       ..B4.14
..B4.11:
        movq      %rsi, 120(%rsp)
        movl      %ecx, 112(%rsp)
        movsd     %xmm9, 344(%rsp)
        movsd     %xmm15, 336(%rsp)
        movq      224(%rsp), %rcx
        movq      232(%rsp), %rbx
        movq      240(%rsp), %rsi
        movq      248(%rsp), %r15
..B4.12:
        movsd     (%r11,%r13,8), %xmm15
        movaps    %xmm15, %xmm9
        mulsd     336(%rsp), %xmm9
        addsd     (%rsi,%r13,8), %xmm9
        movsd     %xmm9, (%rsi,%r13,8)
        movaps    %xmm15, %xmm9
        mulsd     %xmm14, %xmm9
        addsd     (%rbx,%r13,8), %xmm9
        movsd     %xmm9, (%rbx,%r13,8)
        movaps    %xmm15, %xmm9
        mulsd     %xmm13, %xmm9
        mulsd     %xmm12, %xmm15
        addsd     (%rcx,%r13,8), %xmm9
        movsd     %xmm9, (%rcx,%r13,8)
        movsd     (%r10,%r13,8), %xmm9
        addsd     (%r15,%r13,8), %xmm15
        movsd     %xmm15, (%r15,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     %xmm11, %xmm15
        addsd     (%rsi,%r13,8), %xmm15
        movsd     %xmm15, (%rsi,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     %xmm10, %xmm15
        addsd     (%rbx,%r13,8), %xmm15
        movsd     %xmm15, (%rbx,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     344(%rsp), %xmm15
        mulsd     %xmm8, %xmm9
        addsd     (%rcx,%r13,8), %xmm15
        movsd     %xmm15, (%rcx,%r13,8)
        movsd     (%r9,%r13,8), %xmm15
        addsd     (%r15,%r13,8), %xmm9
        movsd     %xmm9, (%r15,%r13,8)
        movaps    %xmm15, %xmm9
        mulsd     %xmm7, %xmm9
        addsd     (%rsi,%r13,8), %xmm9
        movsd     %xmm9, (%rsi,%r13,8)
        movaps    %xmm15, %xmm9
        mulsd     %xmm6, %xmm9
        addsd     (%rbx,%r13,8), %xmm9
        movsd     %xmm9, (%rbx,%r13,8)
        movaps    %xmm15, %xmm9
        mulsd     %xmm5, %xmm9
        mulsd     %xmm4, %xmm15
        addsd     (%rcx,%r13,8), %xmm9
        movsd     %xmm9, (%rcx,%r13,8)
        .byte     144
        movsd     (%r12,%r13,8), %xmm9
        addsd     (%r15,%r13,8), %xmm15
        movsd     %xmm15, (%r15,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     %xmm3, %xmm15
        addsd     (%rsi,%r13,8), %xmm15
        movsd     %xmm15, (%rsi,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     %xmm2, %xmm15
        addsd     (%rbx,%r13,8), %xmm15
        movsd     %xmm15, (%rbx,%r13,8)
        movaps    %xmm9, %xmm15
        mulsd     %xmm1, %xmm15
        mulsd     %xmm0, %xmm9
        addsd     (%rcx,%r13,8), %xmm15
        movsd     %xmm15, (%rcx,%r13,8)
        addsd     (%r15,%r13,8), %xmm9
        movsd     %xmm9, (%r15,%r13,8)
        incq      %r13
        cmpq      %r14, %r13
        jb        ..B4.12
..B4.13:
        movsd     344(%rsp), %xmm9
        movsd     336(%rsp), %xmm15
        movq      104(%rsp), %rbx
        movq      120(%rsp), %rsi
        movl      112(%rsp), %ecx
..B4.14:
        movq      %rsi, 120(%rsp)
        movddup   %xmm15, %xmm15
        movddup   %xmm14, %xmm14
        movddup   %xmm13, %xmm13
        movl      %ecx, 112(%rsp)
        movddup   %xmm12, %xmm12
        movddup   %xmm11, %xmm11
        movddup   %xmm10, %xmm10
        movddup   %xmm9, %xmm9
        movddup   %xmm8, %xmm8
        movddup   %xmm7, %xmm7
        movddup   %xmm6, %xmm6
        movddup   %xmm5, %xmm5
        movddup   %xmm4, %xmm4
        movddup   %xmm3, %xmm3
        movddup   %xmm2, %xmm2
        movddup   %xmm1, %xmm1
        movddup   %xmm0, %xmm0
        movups    %xmm13, 304(%rsp)
        movups    %xmm14, 288(%rsp)
        movups    %xmm15, 272(%rsp)
        movq      224(%rsp), %rcx
        movq      232(%rsp), %rsi
        movq      240(%rsp), %r13
        movq      248(%rsp), %r15
..B4.15:
        movups    (%r11,%r14,8), %xmm13
        movups    (%r13,%r14,8), %xmm15
        movups    272(%rsp), %xmm14
        mulpd     %xmm13, %xmm14
        addpd     %xmm14, %xmm15
        movups    288(%rsp), %xmm14
        mulpd     %xmm13, %xmm14
        movups    %xmm15, (%r13,%r14,8)
        movups    (%rsi,%r14,8), %xmm15
        addpd     %xmm14, %xmm15
        movups    304(%rsp), %xmm14
        mulpd     %xmm13, %xmm14
        movups    %xmm15, (%rsi,%r14,8)
        mulpd     %xmm12, %xmm13
        movups    (%rcx,%r14,8), %xmm15
        addpd     %xmm14, %xmm15
        movups    %xmm15, (%rcx,%r14,8)
        movups    (%r10,%r14,8), %xmm15
        addpd     (%r15,%r14,8), %xmm13
        movups    %xmm13, (%r15,%r14,8)
        movaps    %xmm11, %xmm13
        mulpd     %xmm15, %xmm13
        movups    (%r13,%r14,8), %xmm14
        addpd     %xmm13, %xmm14
        movaps    %xmm10, %xmm13
        mulpd     %xmm15, %xmm13
        movups    %xmm14, (%r13,%r14,8)
        movups    (%rsi,%r14,8), %xmm14
        addpd     %xmm13, %xmm14
        movaps    %xmm9, %xmm13
        mulpd     %xmm15, %xmm13
        movups    %xmm14, (%rsi,%r14,8)
        mulpd     %xmm8, %xmm15
        movups    (%rcx,%r14,8), %xmm14
        addpd     %xmm13, %xmm14
        movups    %xmm14, (%rcx,%r14,8)
        movups    (%r9,%r14,8), %xmm14
        addpd     (%r15,%r14,8), %xmm15
        movups    %xmm15, (%r15,%r14,8)
        movaps    %xmm7, %xmm15
        mulpd     %xmm14, %xmm15
        movups    (%r13,%r14,8), %xmm13
        addpd     %xmm15, %xmm13
        movaps    %xmm6, %xmm15
        mulpd     %xmm14, %xmm15
        movups    %xmm13, (%r13,%r14,8)
        movups    (%rsi,%r14,8), %xmm13
        addpd     %xmm15, %xmm13
        movaps    %xmm5, %xmm15
        mulpd     %xmm14, %xmm15
        movups    %xmm13, (%rsi,%r14,8)
        mulpd     %xmm4, %xmm14
        movups    (%rcx,%r14,8), %xmm13
        addpd     %xmm15, %xmm13
        movups    %xmm13, (%rcx,%r14,8)
        movups    (%r12,%r14,8), %xmm13
        addpd     (%r15,%r14,8), %xmm14
        movups    %xmm14, (%r15,%r14,8)
        movaps    %xmm3, %xmm14
        mulpd     %xmm13, %xmm14
        movups    (%r13,%r14,8), %xmm15
        addpd     %xmm14, %xmm15
        movaps    %xmm2, %xmm14
        mulpd     %xmm13, %xmm14
        movups    %xmm15, (%r13,%r14,8)
        .byte     144
        movups    (%rsi,%r14,8), %xmm15
        addpd     %xmm14, %xmm15
        movaps    %xmm1, %xmm14
        mulpd     %xmm13, %xmm14
        movups    %xmm15, (%rsi,%r14,8)
        mulpd     %xmm0, %xmm13
        movups    (%rcx,%r14,8), %xmm15
        addpd     %xmm14, %xmm15
        movups    %xmm15, (%rcx,%r14,8)
        addpd     (%r15,%r14,8), %xmm13
        movups    %xmm13, (%r15,%r14,8)
        addq      $2, %r14
        cmpq      %rbp, %r14
        jb        ..B4.15
..B4.16:
        movq      120(%rsp), %rsi
        movl      112(%rsp), %ecx
..B4.17:
        cmpq      %rdx, %rbp
        jae       ..B4.21
..B4.18:
        movl      168(%rsp), %r13d
        movl      %edi, %r12d
        subl      %ecx, %r12d
        movl      176(%rsp), %r10d
        movl      160(%rsp), %r15d
        lea       (%r13,%rdi), %r14d
        movslq    %r14d, %r14
        lea       (%rax,%r8), %r13d
        movslq    %r13d, %r13
        lea       (%r12,%rcx,4), %r11d
        movslq    %r11d, %r11
        lea       (%r10,%rdi), %r9d
        movslq    %r9d, %r9
        movl      %ecx, 112(%rsp)
        lea       (%rbx,%r14,8), %r10
        movl      152(%rsp), %r14d
        movsd     (%rsi,%r13,8), %xmm13
        lea       (%rbx,%r11,8), %r12
        movsd     8(%rsi,%r13,8), %xmm15
        lea       (%rbx,%r9,8), %r11
        movsd     16(%rsi,%r13,8), %xmm12
        lea       (%r15,%rdi), %r9d
        movsd     24(%rsi,%r13,8), %xmm11
        lea       (%r14,%r8), %r15d
        movl      144(%rsp), %r13d
        movslq    %r15d, %r15
        movslq    %r9d, %r9
        movq      224(%rsp), %rcx
        lea       (%r13,%r8), %r14d
        movl      136(%rsp), %r13d
        movsd     (%rsi,%r15,8), %xmm10
        movsd     8(%rsi,%r15,8), %xmm9
        lea       (%rbx,%r9,8), %r9
        movsd     16(%rsi,%r15,8), %xmm8
        movsd     24(%rsi,%r15,8), %xmm7
        lea       (%r13,%r8), %r15d
        movslq    %r14d, %r14
        movslq    %r15d, %r15
        movsd     %xmm15, 320(%rsp)
        movq      232(%rsp), %r13
        movsd     (%rsi,%r14,8), %xmm14
        movsd     8(%rsi,%r14,8), %xmm6
        movsd     16(%rsi,%r14,8), %xmm5
        movsd     24(%rsi,%r14,8), %xmm4
        movsd     (%rsi,%r15,8), %xmm3
        movsd     8(%rsi,%r15,8), %xmm2
        movsd     16(%rsi,%r15,8), %xmm1
        movsd     24(%rsi,%r15,8), %xmm0
        movsd     %xmm14, 328(%rsp)
        movq      240(%rsp), %r14
        movq      248(%rsp), %r15
..B4.19:
        movsd     (%r11,%rbp,8), %xmm15
        movaps    %xmm13, %xmm14
        mulsd     %xmm15, %xmm14
        addsd     (%r14,%rbp,8), %xmm14
        movsd     %xmm14, (%r14,%rbp,8)
        movaps    %xmm15, %xmm14
        mulsd     %xmm10, %xmm14
        addsd     (%r13,%rbp,8), %xmm14
        movsd     %xmm14, (%r13,%rbp,8)
        movaps    %xmm15, %xmm14
        mulsd     328(%rsp), %xmm14
        mulsd     %xmm3, %xmm15
        addsd     (%rcx,%rbp,8), %xmm14
        movsd     %xmm14, (%rcx,%rbp,8)
        movsd     (%r10,%rbp,8), %xmm14
        addsd     (%r15,%rbp,8), %xmm15
        movsd     %xmm15, (%r15,%rbp,8)
        movsd     320(%rsp), %xmm15
        mulsd     %xmm14, %xmm15
        addsd     (%r14,%rbp,8), %xmm15
        movsd     %xmm15, (%r14,%rbp,8)
        movaps    %xmm14, %xmm15
        mulsd     %xmm9, %xmm15
        addsd     (%r13,%rbp,8), %xmm15
        movsd     %xmm15, (%r13,%rbp,8)
        movaps    %xmm14, %xmm15
        mulsd     %xmm6, %xmm15
        mulsd     %xmm2, %xmm14
        addsd     (%rcx,%rbp,8), %xmm15
        movsd     %xmm15, (%rcx,%rbp,8)
        movsd     (%r9,%rbp,8), %xmm15
        addsd     (%r15,%rbp,8), %xmm14
        movsd     %xmm14, (%r15,%rbp,8)
        movaps    %xmm12, %xmm14
        mulsd     %xmm15, %xmm14
        addsd     (%r14,%rbp,8), %xmm14
        movsd     %xmm14, (%r14,%rbp,8)
        movaps    %xmm15, %xmm14
        mulsd     %xmm8, %xmm14
        addsd     (%r13,%rbp,8), %xmm14
        movsd     %xmm14, (%r13,%rbp,8)
        movaps    %xmm15, %xmm14
        mulsd     %xmm5, %xmm14
        mulsd     %xmm1, %xmm15
        addsd     (%rcx,%rbp,8), %xmm14
        movsd     %xmm14, (%rcx,%rbp,8)
        movsd     (%r12,%rbp,8), %xmm14
        addsd     (%r15,%rbp,8), %xmm15
        movsd     %xmm15, (%r15,%rbp,8)
        movaps    %xmm11, %xmm15
        mulsd     %xmm14, %xmm15
        addsd     (%r14,%rbp,8), %xmm15
        movsd     %xmm15, (%r14,%rbp,8)
        movaps    %xmm14, %xmm15
        mulsd     %xmm7, %xmm15
        addsd     (%r13,%rbp,8), %xmm15
        movsd     %xmm15, (%r13,%rbp,8)
        movaps    %xmm14, %xmm15
        mulsd     %xmm4, %xmm15
        mulsd     %xmm0, %xmm14
        addsd     (%rcx,%rbp,8), %xmm15
        movsd     %xmm15, (%rcx,%rbp,8)
        addsd     (%r15,%rbp,8), %xmm14
        movsd     %xmm14, (%r15,%rbp,8)
        incq      %rbp
        cmpq      %rdx, %rbp
        jb        ..B4.19
..B4.20:
        movl      112(%rsp), %ecx
..B4.21:
        movl      96(%rsp), %ebp
        addl      $4, %r8d
        incl      %ebp
        lea       (%rdi,%rcx,4), %edi
        movl      %ebp, 96(%rsp)
        cmpl      8(%rsp), %ebp
        jb        ..B4.5
..B4.22:
        movl      %ebp, %r9d
        lea       1(,%r9,4), %ebx
        movl      %ecx, %r10d
        lea       -1(%rbx), %r8d
        movl      %r8d, 16(%rsp)
        movslq    %r8d, %r8
        imull     %r8d, %r10d
        movl      %eax, 48(%rsp)
        lea       (,%r8,8), %r9
        movl      88(%rsp), %eax
        movq      32(%rsp), %rdx
        movslq    %r10d, %r10
        cmpl      %ecx, %ebx
        ja        ..B4.46
..B4.23:
        movl      80(%rsp), %r11d
        movl      176(%rsp), %ebp
        movl      168(%rsp), %edi
        movl      160(%rsp), %r12d
        lea       (%r11,%rcx,4), %r14d
        movslq    %r14d, %r14
        lea       (%rbp,%rax), %r13d
        movslq    %r13d, %r13
        lea       (%rdi,%rax), %ebx
        movslq    %ebx, %rbx
        lea       (%r12,%rax), %r15d
        movslq    %r15d, %r15
        movl      %eax, 88(%rsp)
        lea       (%rsi,%r14,8), %r11
        movq      %rdx, 32(%rsp)
        lea       (%rdx,%r14,8), %r14
        movq      %r14, 216(%rsp)
        lea       (%rsi,%r13,8), %rbp
        movq      %rsi, 120(%rsp)
        lea       (%rdx,%r13,8), %r13
        movq      %r13, 208(%rsp)
        lea       (%rsi,%rbx,8), %rdi
        movq      128(%rsp), %rax
        lea       (%rdx,%rbx,8), %rbx
        movq      %rbx, 200(%rsp)
        lea       (%rsi,%r15,8), %r12
        lea       (%rdx,%r15,8), %r15
        movq      104(%rsp), %rdx
        movq      %r15, 192(%rsp)
..B4.24:
        cmpq      $2, %rax
        jl        ..B4.80
..B4.25:
        lea       (%rdx,%r10,8), %r15
        movq      %r15, %r14
        andq      $15, %r14
        testl     %r14d, %r14d
        je        ..B4.28
..B4.26:
        testl     $7, %r14d
        jne       ..B4.80
..B4.27:
        movl      $1, %r14d
..B4.28:
        movl      %r14d, %r13d
        lea       2(%r13), %rbx
        cmpq      %rbx, %rax
        jl        ..B4.80
..B4.29:
        movl      %ecx, %ebx
        xorl      %esi, %esi
        subl      %r14d, %ebx
        andl      $1, %ebx
        negl      %ebx
        addl      %ecx, %ebx
        movslq    %ebx, %rbx
        testq     %r13, %r13
        jbe       ..B4.79
..B4.30:
        movq      %r8, 184(%rsp)
        movl      %ecx, 112(%rsp)
        movsd     (%r9,%r11), %xmm2
        movsd     (%r9,%rbp), %xmm1
        movsd     (%r9,%rdi), %xmm3
        movsd     (%r9,%r12), %xmm0
        movq      192(%rsp), %rax
        movq      200(%rsp), %rdx
        movq      208(%rsp), %rcx
        movq      216(%rsp), %r8
        .align    16,0x90
..B4.31:
        movsd     (%r15,%rsi,8), %xmm7
        movaps    %xmm7, %xmm4
        movaps    %xmm7, %xmm5
        mulsd     %xmm1, %xmm4
        movaps    %xmm7, %xmm6
        mulsd     %xmm3, %xmm5
        mulsd     %xmm0, %xmm6
        addsd     (%rcx,%rsi,8), %xmm4
        mulsd     %xmm2, %xmm7
        movsd     %xmm4, (%rcx,%rsi,8)
        addsd     (%rdx,%rsi,8), %xmm5
        movsd     %xmm5, (%rdx,%rsi,8)
        addsd     (%rax,%rsi,8), %xmm6
        movsd     %xmm6, (%rax,%rsi,8)
        addsd     (%r8,%rsi,8), %xmm7
        movsd     %xmm7, (%r8,%rsi,8)
        incq      %rsi
        cmpq      %r13, %rsi
        jb        ..B4.31
..B4.32:
        movq      184(%rsp), %r8
        movq      128(%rsp), %rax
        movq      104(%rsp), %rdx
        movl      112(%rsp), %ecx
..B4.33:
        movl      %r14d, %r14d
        movq      216(%rsp), %rsi
        lea       (%rsi,%r14,8), %rsi
        testq     $15, %rsi
        je        ..B4.37
..B4.34:
        movl      %ecx, 112(%rsp)
        movddup   %xmm1, %xmm1
        movddup   %xmm3, %xmm4
        movddup   %xmm0, %xmm3
        movddup   %xmm2, %xmm0
        movq      192(%rsp), %rdx
        movq      200(%rsp), %rcx
        movq      208(%rsp), %rsi
        movq      216(%rsp), %r14
        .align    16,0x90
..B4.35:
        movups    (%r15,%r13,8), %xmm10
        movaps    %xmm10, %xmm2
        movaps    %xmm10, %xmm6
        mulpd     %xmm1, %xmm2
        movups    (%rsi,%r13,8), %xmm5
        mulpd     %xmm4, %xmm6
        addpd     %xmm2, %xmm5
        movups    %xmm5, (%rsi,%r13,8)
        movaps    %xmm10, %xmm8
        movups    (%rcx,%r13,8), %xmm7
        mulpd     %xmm3, %xmm8
        addpd     %xmm6, %xmm7
        mulpd     %xmm0, %xmm10
        movups    %xmm7, (%rcx,%r13,8)
        movups    (%rdx,%r13,8), %xmm9
        addpd     %xmm8, %xmm9
        movups    %xmm9, (%rdx,%r13,8)
        movups    (%r14,%r13,8), %xmm11
        addpd     %xmm10, %xmm11
        movups    %xmm11, (%r14,%r13,8)
        addq      $2, %r13
        cmpq      %rbx, %r13
        jb        ..B4.35
        jmp       ..B4.39
..B4.37:
        movl      %ecx, 112(%rsp)
        movddup   %xmm1, %xmm4
        movddup   %xmm3, %xmm3
        movddup   %xmm0, %xmm1
        movddup   %xmm2, %xmm0
        movq      192(%rsp), %rdx
        movq      200(%rsp), %rcx
        movq      208(%rsp), %rsi
        movq      216(%rsp), %r14
        .align    16,0x90
..B4.38:
        movups    (%r15,%r13,8), %xmm10
        movaps    %xmm10, %xmm2
        movaps    %xmm10, %xmm6
        mulpd     %xmm4, %xmm2
        movups    (%rsi,%r13,8), %xmm5
        mulpd     %xmm3, %xmm6
        addpd     %xmm2, %xmm5
        movups    %xmm5, (%rsi,%r13,8)
        movaps    %xmm10, %xmm8
        movups    (%rcx,%r13,8), %xmm7
        mulpd     %xmm1, %xmm8
        addpd     %xmm6, %xmm7
        mulpd     %xmm0, %xmm10
        movups    %xmm7, (%rcx,%r13,8)
        movups    (%rdx,%r13,8), %xmm9
        addpd     %xmm8, %xmm9
        movups    %xmm9, (%rdx,%r13,8)
        addpd     (%r14,%r13,8), %xmm10
        movups    %xmm10, (%r14,%r13,8)
        addq      $2, %r13
        cmpq      %rbx, %r13
        jb        ..B4.38
..B4.39:
        movq      104(%rsp), %rdx
        movl      112(%rsp), %ecx
..B4.40:
        cmpq      %rax, %rbx
        jae       ..B4.44
..B4.41:
        movl      %ecx, 112(%rsp)
        lea       (%rdx,%r10,8), %rsi
        movsd     (%r11,%r8,8), %xmm3
        movsd     (%rbp,%r8,8), %xmm2
        movsd     (%rdi,%r8,8), %xmm1
        movsd     (%r12,%r8,8), %xmm0
        movq      192(%rsp), %rcx
        movq      200(%rsp), %r13
        movq      208(%rsp), %r14
        movq      216(%rsp), %r15
        .align    16,0x90
..B4.42:
        movsd     (%rsi,%rbx,8), %xmm7
        movaps    %xmm7, %xmm4
        movaps    %xmm7, %xmm5
        mulsd     %xmm2, %xmm4
        movaps    %xmm7, %xmm6
        mulsd     %xmm1, %xmm5
        mulsd     %xmm0, %xmm6
        addsd     (%r14,%rbx,8), %xmm4
        mulsd     %xmm3, %xmm7
        movsd     %xmm4, (%r14,%rbx,8)
        addsd     (%r13,%rbx,8), %xmm5
        movsd     %xmm5, (%r13,%rbx,8)
        addsd     (%rcx,%rbx,8), %xmm6
        movsd     %xmm6, (%rcx,%rbx,8)
        addsd     (%r15,%rbx,8), %xmm7
        movsd     %xmm7, (%r15,%rbx,8)
        incq      %rbx
        cmpq      %rax, %rbx
        jb        ..B4.42
..B4.43:
        movl      112(%rsp), %ecx
..B4.44:
        movl      16(%rsp), %ebx
        addq      %rax, %r10
        incl      %ebx
        addq      $8, %r9
        incq      %r8
        movl      %ebx, 16(%rsp)
        cmpl      %ecx, %ebx
        jb        ..B4.24
..B4.45:
        movl      88(%rsp), %eax
        movq      120(%rsp), %rsi
        movq      32(%rsp), %rdx
..B4.46:
        movl      136(%rsp), %ebx
        lea       (%rax,%rcx,4), %eax
        movl      80(%rsp), %edi
        movl      144(%rsp), %r9d
        movl      152(%rsp), %r11d
        lea       (%rbx,%rcx,4), %ebp
        movl      48(%rsp), %r14d
        lea       (%rdi,%rcx,4), %r8d
        movq      24(%rsp), %r13
        lea       (%r9,%rcx,4), %r10d
        movl      (%rsp), %ebx
        lea       (%r11,%rcx,4), %r12d
        incl      %ebx
        lea       (%r14,%rcx,4), %r15d
        addq      %r13, 40(%rsp)
        addq      %r13, 56(%rsp)
        addq      %r13, 64(%rsp)
        addq      %r13, 72(%rsp)
        movl      %ebp, 136(%rsp)
        movl      %r8d, 80(%rsp)
        movl      %r10d, 144(%rsp)
        movl      %r12d, 152(%rsp)
        movl      %r15d, 48(%rsp)
        movl      %ebx, (%rsp)
        cmpl      8(%rsp), %ebx
        jb        ..B4.4
..B4.47:
        movl      %ebx, %eax
        lea       1(,%rax,4), %ebx
..B4.48:
        movl      %ecx, %r12d
        lea       -1(%rbx), %r13d
        imull     %r13d, %r12d
        movslq    %r12d, %r12
        cmpl      %ecx, %ebx
        ja        ..B4.74
..B4.49:
        movq      128(%rsp), %rdi
..B4.50:
        xorl      %eax, %eax
        lea       (%rdx,%r12,8), %r11
        movq      %r11, %r14
        xorl      %r8d, %r8d
        andq      $15, %r14
        xorl      %ebx, %ebx
        movl      %r14d, %r15d
        lea       (%rsi,%r12,8), %r10
        andl      $7, %r15d
        xorl      %ebp, %ebp
        movl      %r15d, 24(%rsp)
        xorl      %r9d, %r9d
        movl      %r14d, 40(%rsp)
        movq      %r11, 16(%rsp)
        movq      %r12, (%rsp)
        movl      %r13d, 8(%rsp)
        movq      %rsi, 120(%rsp)
        movq      %rdx, 32(%rsp)
        movq      104(%rsp), %r15
..B4.51:
        cmpq      $8, %rdi
        jl        ..B4.76
..B4.52:
        movl      40(%rsp), %r12d
        testl     %r12d, %r12d
        je        ..B4.55
..B4.53:
        cmpl      $0, 24(%rsp)
        jne       ..B4.76
..B4.54:
        movl      $1, %r12d
..B4.55:
        movl      %r12d, %r13d
        lea       8(%r13), %rdx
        cmpq      %rdx, %rdi
        jl        ..B4.76
..B4.56:
        movl      %ecx, %r14d
        xorl      %edx, %edx
        subl      %r12d, %r14d
        movslq    %ebp, %rsi
        andl      $7, %r14d
        negl      %r14d
        addl      %ecx, %r14d
        movslq    %r14d, %r14
        lea       (%r15,%rsi,8), %r11
        testq     %r13, %r13
        jbe       ..B4.75
..B4.57:
        movl      %ecx, 112(%rsp)
        movsd     (%rbx,%r10), %xmm0
        movq      16(%rsp), %rcx
..B4.58:
        movsd     (%r11,%rdx,8), %xmm1
        mulsd     %xmm0, %xmm1
        addsd     (%rcx,%rdx,8), %xmm1
        movsd     %xmm1, (%rcx,%rdx,8)
        incq      %rdx
        cmpq      %r13, %rdx
        jb        ..B4.58
..B4.59:
        movl      112(%rsp), %ecx
..B4.60:
        addq      %r12, %rsi
        lea       (%r15,%rsi,8), %rdx
        testq     $15, %rdx
        je        ..B4.64
..B4.61:
        movq      16(%rsp), %rdx
        movddup   %xmm0, %xmm0
        .align    16,0x90
..B4.62:
        movups    (%r11,%r13,8), %xmm1
        movups    16(%r11,%r13,8), %xmm2
        movups    32(%r11,%r13,8), %xmm3
        movups    48(%r11,%r13,8), %xmm4
        mulpd     %xmm0, %xmm1
        mulpd     %xmm0, %xmm2
        mulpd     %xmm0, %xmm3
        mulpd     %xmm0, %xmm4
        addpd     (%rdx,%r13,8), %xmm1
        addpd     16(%rdx,%r13,8), %xmm2
        addpd     32(%rdx,%r13,8), %xmm3
        addpd     48(%rdx,%r13,8), %xmm4
        movups    %xmm1, (%rdx,%r13,8)
        movups    %xmm2, 16(%rdx,%r13,8)
        movups    %xmm3, 32(%rdx,%r13,8)
        movups    %xmm4, 48(%rdx,%r13,8)
        addq      $8, %r13
        cmpq      %r14, %r13
        jb        ..B4.62
        jmp       ..B4.67
..B4.64:
        movq      16(%rsp), %rdx
        movddup   %xmm0, %xmm0
        .align    16,0x90
..B4.65:
        movups    (%r11,%r13,8), %xmm1
        movups    16(%r11,%r13,8), %xmm2
        movups    32(%r11,%r13,8), %xmm3
        movups    48(%r11,%r13,8), %xmm4
        mulpd     %xmm0, %xmm1
        mulpd     %xmm0, %xmm2
        mulpd     %xmm0, %xmm3
        mulpd     %xmm0, %xmm4
        addpd     (%rdx,%r13,8), %xmm1
        addpd     16(%rdx,%r13,8), %xmm2
        addpd     32(%rdx,%r13,8), %xmm3
        addpd     48(%rdx,%r13,8), %xmm4
        movups    %xmm1, (%rdx,%r13,8)
        movups    %xmm2, 16(%rdx,%r13,8)
        movups    %xmm3, 32(%rdx,%r13,8)
        movups    %xmm4, 48(%rdx,%r13,8)
        addq      $8, %r13
        cmpq      %r14, %r13
        jb        ..B4.65
..B4.67:
        cmpq      %rdi, %r14
        jae       ..B4.71
..B4.68:
        movsd     (%r10,%rax,8), %xmm0
        lea       (%r15,%r9,8), %rdx
        movq      16(%rsp), %rsi
..B4.69:
        movsd     (%rdx,%r14,8), %xmm1
        mulsd     %xmm0, %xmm1
        addsd     (%rsi,%r14,8), %xmm1
        movsd     %xmm1, (%rsi,%r14,8)
        incq      %r14
        cmpq      %rdi, %r14
        jb        ..B4.69
..B4.71:
        incl      %r8d
        addq      %rdi, %r9
        addl      %ecx, %ebp
        addq      $8, %rbx
        incq      %rax
        cmpl      %ecx, %r8d
        jb        ..B4.51
..B4.72:
        movl      8(%rsp), %r13d
        incl      %r13d
        movq      (%rsp), %r12
        addq      %rdi, %r12
        movq      120(%rsp), %rsi
        movq      32(%rsp), %rdx
        cmpl      %ecx, %r13d
        jb        ..B4.50
..B4.74:
        addq      $360, %rsp
..___tag_value__Z8multIJKXPdS_S_i.90:
        popq      %rbp
..___tag_value__Z8multIJKXPdS_S_i.92:
        popq      %rbx
..___tag_value__Z8multIJKXPdS_S_i.94:
        popq      %r15
..___tag_value__Z8multIJKXPdS_S_i.96:
        popq      %r14
..___tag_value__Z8multIJKXPdS_S_i.98:
        popq      %r13
..___tag_value__Z8multIJKXPdS_S_i.100:
        popq      %r12
..___tag_value__Z8multIJKXPdS_S_i.102:
        ret       
..___tag_value__Z8multIJKXPdS_S_i.103:
..B4.75:
        movsd     (%r10,%rax,8), %xmm0
        jmp       ..B4.60
..B4.76:
        xorl      %r14d, %r14d
        jmp       ..B4.67
..B4.79:
        movsd     (%r11,%r8,8), %xmm2
        movsd     (%rbp,%r8,8), %xmm1
        movsd     (%rdi,%r8,8), %xmm3
        movsd     (%r12,%r8,8), %xmm0
        jmp       ..B4.33
..B4.80:
        xorl      %ebx, %ebx
        jmp       ..B4.40
..B4.83:
        xorl      %ebp, %ebp
        jmp       ..B4.17
        .align    16,0x90
..___tag_value__Z8multIJKXPdS_S_i.110:
	.type	_Z8multIJKXPdS_S_i,@function
	.size	_Z8multIJKXPdS_S_i,.-_Z8multIJKXPdS_S_i
	.data
# -- End  _Z8multIJKXPdS_S_i
	.data
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
	.4byte 0x0000005c
	.4byte 0x00000024
	.8byte ..___tag_value__Z7multijkPdS_S_i.1
	.8byte ..___tag_value__Z7multijkPdS_S_i.17-..___tag_value__Z7multijkPdS_S_i.1
	.2byte 0x0400
	.4byte ..___tag_value__Z7multijkPdS_S_i.3-..___tag_value__Z7multijkPdS_S_i.1
	.4byte 0x0286100e
	.byte 0x04
	.4byte ..___tag_value__Z7multijkPdS_S_i.5-..___tag_value__Z7multijkPdS_S_i.3
	.8byte 0x0e8e0f8d108c0c83
	.2byte 0x0d8f
	.byte 0x04
	.4byte ..___tag_value__Z7multijkPdS_S_i.10-..___tag_value__Z7multijkPdS_S_i.5
	.2byte 0x04cc
	.4byte ..___tag_value__Z7multijkPdS_S_i.11-..___tag_value__Z7multijkPdS_S_i.10
	.2byte 0x04cd
	.4byte ..___tag_value__Z7multijkPdS_S_i.12-..___tag_value__Z7multijkPdS_S_i.11
	.2byte 0x04ce
	.4byte ..___tag_value__Z7multijkPdS_S_i.13-..___tag_value__Z7multijkPdS_S_i.12
	.2byte 0x04cf
	.4byte ..___tag_value__Z7multijkPdS_S_i.14-..___tag_value__Z7multijkPdS_S_i.13
	.2byte 0x04c3
	.4byte ..___tag_value__Z7multijkPdS_S_i.15-..___tag_value__Z7multijkPdS_S_i.14
	.2byte 0x04c6
	.4byte ..___tag_value__Z7multijkPdS_S_i.16-..___tag_value__Z7multijkPdS_S_i.15
	.4byte 0x0000080e
	.2byte 0x0000
	.4byte 0x0000005c
	.4byte 0x00000084
	.8byte ..___tag_value__Z8multijkxPdS_S_i.18
	.8byte ..___tag_value__Z8multijkxPdS_S_i.38-..___tag_value__Z8multijkxPdS_S_i.18
	.2byte 0x0400
	.4byte ..___tag_value__Z8multijkxPdS_S_i.20-..___tag_value__Z8multijkxPdS_S_i.18
	.8byte 0x0d8d0e8c09860a83
	.4byte 0x0b8f0c8e
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.26-..___tag_value__Z8multijkxPdS_S_i.20
	.2byte 0x04cc
	.4byte ..___tag_value__Z8multijkxPdS_S_i.27-..___tag_value__Z8multijkxPdS_S_i.26
	.2byte 0x04cd
	.4byte ..___tag_value__Z8multijkxPdS_S_i.28-..___tag_value__Z8multijkxPdS_S_i.27
	.2byte 0x04ce
	.4byte ..___tag_value__Z8multijkxPdS_S_i.29-..___tag_value__Z8multijkxPdS_S_i.28
	.2byte 0x04cf
	.4byte ..___tag_value__Z8multijkxPdS_S_i.30-..___tag_value__Z8multijkxPdS_S_i.29
	.2byte 0x04c3
	.4byte ..___tag_value__Z8multijkxPdS_S_i.31-..___tag_value__Z8multijkxPdS_S_i.30
	.2byte 0x04c6
	.4byte ..___tag_value__Z8multijkxPdS_S_i.32-..___tag_value__Z8multijkxPdS_S_i.31
	.8byte 0x0d8d0e8c09860a83
	.4byte 0x0b8f0c8e
	.byte 0x00
	.4byte 0x000000a4
	.4byte 0x000000e4
	.8byte ..___tag_value__Z7multIJKPdS_S_i.39
	.8byte ..___tag_value__Z7multIJKPdS_S_i.74-..___tag_value__Z7multIJKPdS_S_i.39
	.2byte 0x0400
	.4byte ..___tag_value__Z7multIJKPdS_S_i.41-..___tag_value__Z7multIJKPdS_S_i.39
	.4byte 0x028c100e
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.43-..___tag_value__Z7multIJKPdS_S_i.41
	.4byte 0x038d180e
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.45-..___tag_value__Z7multIJKPdS_S_i.43
	.4byte 0x048e200e
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.47-..___tag_value__Z7multIJKPdS_S_i.45
	.4byte 0x058f280e
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.49-..___tag_value__Z7multIJKPdS_S_i.47
	.4byte 0x0683300e
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.51-..___tag_value__Z7multIJKPdS_S_i.49
	.4byte 0x0786380e
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.53-..___tag_value__Z7multIJKPdS_S_i.51
	.4byte 0x0403a00e
	.4byte ..___tag_value__Z7multIJKPdS_S_i.54-..___tag_value__Z7multIJKPdS_S_i.53
	.4byte 0x04c6380e
	.4byte ..___tag_value__Z7multIJKPdS_S_i.56-..___tag_value__Z7multIJKPdS_S_i.54
	.4byte 0x04c3300e
	.4byte ..___tag_value__Z7multIJKPdS_S_i.58-..___tag_value__Z7multIJKPdS_S_i.56
	.4byte 0x04cf280e
	.4byte ..___tag_value__Z7multIJKPdS_S_i.60-..___tag_value__Z7multIJKPdS_S_i.58
	.4byte 0x04ce200e
	.4byte ..___tag_value__Z7multIJKPdS_S_i.62-..___tag_value__Z7multIJKPdS_S_i.60
	.4byte 0x04cd180e
	.4byte ..___tag_value__Z7multIJKPdS_S_i.64-..___tag_value__Z7multIJKPdS_S_i.62
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z7multIJKPdS_S_i.66-..___tag_value__Z7multIJKPdS_S_i.64
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.67-..___tag_value__Z7multIJKPdS_S_i.66
	.8byte 0x8c0786068303a00e
	.8byte 0x00058f048e038d02
	.4byte 0x00000000
	.byte 0x00
	.4byte 0x000000a4
	.4byte 0x0000018c
	.8byte ..___tag_value__Z8multIJKXPdS_S_i.75
	.8byte ..___tag_value__Z8multIJKXPdS_S_i.110-..___tag_value__Z8multIJKXPdS_S_i.75
	.2byte 0x0400
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.77-..___tag_value__Z8multIJKXPdS_S_i.75
	.4byte 0x028c100e
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.79-..___tag_value__Z8multIJKXPdS_S_i.77
	.4byte 0x038d180e
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.81-..___tag_value__Z8multIJKXPdS_S_i.79
	.4byte 0x048e200e
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.83-..___tag_value__Z8multIJKXPdS_S_i.81
	.4byte 0x058f280e
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.85-..___tag_value__Z8multIJKXPdS_S_i.83
	.4byte 0x0683300e
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.87-..___tag_value__Z8multIJKXPdS_S_i.85
	.4byte 0x0786380e
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.89-..___tag_value__Z8multIJKXPdS_S_i.87
	.4byte 0x0403a00e
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.90-..___tag_value__Z8multIJKXPdS_S_i.89
	.4byte 0x04c6380e
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.92-..___tag_value__Z8multIJKXPdS_S_i.90
	.4byte 0x04c3300e
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.94-..___tag_value__Z8multIJKXPdS_S_i.92
	.4byte 0x04cf280e
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.96-..___tag_value__Z8multIJKXPdS_S_i.94
	.4byte 0x04ce200e
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.98-..___tag_value__Z8multIJKXPdS_S_i.96
	.4byte 0x04cd180e
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.100-..___tag_value__Z8multIJKXPdS_S_i.98
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.102-..___tag_value__Z8multIJKXPdS_S_i.100
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.103-..___tag_value__Z8multIJKXPdS_S_i.102
	.8byte 0x8c0786068303a00e
	.8byte 0x00058f048e038d02
	.4byte 0x00000000
	.byte 0x00
# End
