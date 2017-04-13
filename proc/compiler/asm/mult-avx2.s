	.file "mult.cpp"
	.text
..TXTST0:
# -- Begin  _Z7multijkPdS_S_i
	.text
       .align    16,0x90
	.globl _Z7multijkPdS_S_i
_Z7multijkPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B1.1:
..___tag_value__Z7multijkPdS_S_i.1:
..L2:

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
        vmovsd    (%r15,%rax,8), %xmm0
..B1.6:
        vmovsd    (%rcx,%rdi,8), %xmm1
        lea       (%rbx,%r9,2), %ebp
        movslq    %ebp, %rbp
        incl      %r9d
        addq      %r11, %rdi
        vmulsd    (%rdx,%rbp,8), %xmm1, %xmm2
        vaddsd    %xmm0, %xmm2, %xmm4
        vmovsd    %xmm4, (%r15,%rax,8)
        vmovsd    (%rcx,%r10,8), %xmm0
        addq      %r11, %r10
        vmulsd    8(%rdx,%rbp,8), %xmm0, %xmm3
        vaddsd    %xmm4, %xmm3, %xmm0
        vmovsd    %xmm0, (%r15,%rax,8)
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
        movslq    %ebx, %rbx
        addl      %ebp, %edi
        movslq    %eax, %rax
        movslq    %edi, %rdi
        addq      %rbx, %rax
        vmovsd    (%rsi,%rdi,8), %xmm1
        vmovsd    -8(%rdx,%rax,8), %xmm0
        vfmadd213sd (%r15,%rbx,8), %xmm0, %xmm1
        vmovsd    %xmm1, (%r15,%rbx,8)
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
	.text
       .align    16,0x90
	.globl _Z8multijkxPdS_S_i
_Z8multijkxPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B2.1:
..___tag_value__Z8multijkxPdS_S_i.18:
..L19:

        pushq     %r12
..___tag_value__Z8multijkxPdS_S_i.20:
        pushq     %r13
..___tag_value__Z8multijkxPdS_S_i.22:
        pushq     %r14
..___tag_value__Z8multijkxPdS_S_i.24:
        pushq     %r15
..___tag_value__Z8multijkxPdS_S_i.26:
        pushq     %rbx
..___tag_value__Z8multijkxPdS_S_i.28:
        subq      $160, %rsp
..___tag_value__Z8multijkxPdS_S_i.30:
        xorl      %r9d, %r9d
        movslq    %ecx, %rcx
        movl      %ecx, %r8d
        lea       (,%rcx,4), %eax
        shll      $5, %r8d
        movslq    %eax, %rax
        movq      %rdx, 8(%rsp)
        movq      %rsi, 40(%rsp)
        movq      %rdi, 32(%rsp)
        movq      %rcx, (%rsp)
        movq      %rax, 24(%rsp)
        movl      %r8d, 128(%rsp)
        xorl      %r8d, %r8d
        testl     %ecx, %ecx
        jle       ..B2.28
..B2.2:
        movl      %ecx, %eax
        lea       (,%rcx,4), %edi
        shll      $5, %eax
        lea       (,%rcx,8), %esi
        movl      %ecx, %r10d
        lea       (%rcx,%rcx,4), %r13d
        shll      $4, %r10d
        lea       (%rcx,%rcx,2), %r11d
        vxorpd    %ymm7, %ymm7, %ymm7
        lea       (%rsi,%rcx,4), %edx
        shll      $2, %r13d
        subl      %edi, %eax
        shll      $3, %r11d
..B2.3:
        movq      32(%rsp), %r15
        xorl      %r14d, %r14d
        movq      8(%rsp), %rbx
        movl      %r11d, 136(%rsp)
        movl      %r10d, 64(%rsp)
        lea       (%r15,%r8,8), %r15
        movq      %r15, 120(%rsp)
        lea       (%rbx,%r8,8), %r12
        movl      %eax, 48(%rsp)
        xorl      %ebx, %ebx
        movl      %r13d, 56(%rsp)
        movl      %edx, 72(%rsp)
        movl      %esi, 144(%rsp)
        movl      %edi, 152(%rsp)
        movq      %r8, 16(%rsp)
        movq      (%rsp), %r10
        movq      40(%rsp), %r11
..B2.4:
        vmovsd    (%r12,%rbx,8), %xmm9
        vxorpd    %ymm8, %ymm8, %ymm8
        cmpl      $32, %ecx
        jl        ..B2.30
..B2.5:
        lea       (%r11,%rbx,8), %rdi
        movq      %rdi, %rax
        andq      $31, %rax
        testl     %eax, %eax
        je        ..B2.8
..B2.6:
        testb     $7, %al
        jne       ..B2.30
..B2.7:
        negl      %eax
        addl      $32, %eax
        shrl      $3, %eax
..B2.8:
        lea       32(%rax), %edx
        cmpl      %edx, %ecx
        jl        ..B2.30
..B2.9:
        movl      %ecx, %r8d
        xorl      %esi, %esi
        subl      %eax, %r8d
        xorl      %r13d, %r13d
        andl      $31, %r8d
        xorl      %edx, %edx
        negl      %r8d
        addl      %ecx, %r8d
        testl     %eax, %eax
        jbe       ..B2.13
..B2.10:
        movq      120(%rsp), %r15
..B2.11:
        vmovsd    (%r15,%rsi,8), %xmm0
        incl      %r13d
        vmulsd    (%rdi,%rdx,8), %xmm0, %xmm1
        addq      %r10, %rsi
        incq      %rdx
        vaddsd    %xmm9, %xmm1, %xmm9
        cmpl      %eax, %r13d
        jb        ..B2.11
..B2.13:
        movl      %ecx, %edx
        movq      %rbx, 80(%rsp)
        movq      %r12, 88(%rsp)
        movl      %r14d, 96(%rsp)
        movl      %r9d, 104(%rsp)
        vxorpd    %ymm5, %ymm5, %ymm5
        vmovapd   %ymm7, %ymm4
        vmovapd   %ymm7, %ymm3
        vmovapd   %ymm7, %ymm2
        vmovapd   %ymm7, %ymm1
        vmovapd   %ymm7, %ymm0
        vmovapd   %ymm7, %ymm6
        movl      %eax, %esi
        imull     %eax, %edx
        movl      %ecx, 112(%rsp)
        movq      120(%rsp), %r13
        movl      48(%rsp), %ebx
        movl      56(%rsp), %r9d
        movl      64(%rsp), %r11d
        movl      72(%rsp), %r12d
        movq      32(%rsp), %r14
..B2.14:
        movslq    %edx, %rdx
        movq      %r10, %rcx
        shlq      $4, %rcx
        addl      $32, %eax
        lea       (%r13,%rdx,8), %r15
        vmovsd    (%r15), %xmm10
        vmovhpd   (%r15,%r10,8), %xmm10, %xmm12
        addq      %rcx, %r15
        vmovsd    (%r15), %xmm11
        vmovhpd   (%r15,%r10,8), %xmm11, %xmm13
        movl      152(%rsp), %r15d
        vinsertf128 $1, %xmm13, %ymm12, %ymm14
        vfmadd231pd (%rdi,%rsi,8), %ymm14, %ymm8
        addl      %edx, %r15d
        movslq    %r15d, %r15
        lea       (%r14,%r15,8), %r15
        vmovsd    (%r15), %xmm15
        vmovhpd   (%r15,%r10,8), %xmm15, %xmm11
        addq      %rcx, %r15
        vmovsd    (%r15), %xmm10
        vmovhpd   (%r15,%r10,8), %xmm10, %xmm12
        movl      144(%rsp), %r15d
        vinsertf128 $1, %xmm12, %ymm11, %ymm13
        vfmadd231pd 32(%rdi,%rsi,8), %ymm13, %ymm5
        addl      %edx, %r15d
        movslq    %r15d, %r15
        lea       (%r14,%r15,8), %r15
        vmovsd    (%r15), %xmm14
        vmovhpd   (%r15,%r10,8), %xmm14, %xmm10
        addq      %rcx, %r15
        vmovsd    (%r15), %xmm15
        vmovhpd   (%r15,%r10,8), %xmm15, %xmm11
        lea       (%r12,%rdx), %r15d
        movslq    %r15d, %r15
        vinsertf128 $1, %xmm11, %ymm10, %ymm12
        vfmadd231pd 64(%rdi,%rsi,8), %ymm12, %ymm4
        lea       (%r14,%r15,8), %r15
        vmovsd    (%r15), %xmm13
        vmovhpd   (%r15,%r10,8), %xmm13, %xmm15
        addq      %rcx, %r15
        vmovsd    (%r15), %xmm14
        vmovhpd   (%r15,%r10,8), %xmm14, %xmm10
        lea       (%r11,%rdx), %r15d
        movslq    %r15d, %r15
        vinsertf128 $1, %xmm10, %ymm15, %ymm11
        vfmadd231pd 96(%rdi,%rsi,8), %ymm11, %ymm3
        lea       (%r14,%r15,8), %r15
        vmovsd    (%r15), %xmm12
        vmovhpd   (%r15,%r10,8), %xmm12, %xmm14
        addq      %rcx, %r15
        vmovsd    (%r15), %xmm13
        vmovhpd   (%r15,%r10,8), %xmm13, %xmm10
        lea       (%r9,%rdx), %r15d
        movslq    %r15d, %r15
        vinsertf128 $1, %xmm10, %ymm14, %ymm11
        vfmadd231pd 128(%rdi,%rsi,8), %ymm11, %ymm2
        lea       (%r14,%r15,8), %r15
        .byte     15
        .byte     31
        .byte     0
        vmovsd    (%r15), %xmm12
        vmovhpd   (%r15,%r10,8), %xmm12, %xmm15
        addq      %rcx, %r15
        vmovsd    (%r15), %xmm13
        vmovhpd   (%r15,%r10,8), %xmm13, %xmm10
        movl      136(%rsp), %r15d
        vinsertf128 $1, %xmm10, %ymm15, %ymm11
        vfmadd231pd 160(%rdi,%rsi,8), %ymm11, %ymm1
        addl      %edx, %r15d
        movslq    %r15d, %r15
        lea       (%r14,%r15,8), %r15
        vmovsd    (%r15), %xmm12
        vmovhpd   (%r15,%r10,8), %xmm12, %xmm14
        addq      %rcx, %r15
        vmovsd    (%r15), %xmm13
        vmovhpd   (%r15,%r10,8), %xmm13, %xmm10
        lea       (%rbx,%rdx), %r15d
        movslq    %r15d, %r15
        vinsertf128 $1, %xmm10, %ymm14, %ymm11
        vfmadd231pd 192(%rdi,%rsi,8), %ymm11, %ymm0
        addl      128(%rsp), %edx
        lea       (%r14,%r15,8), %r15
        vmovsd    (%r15), %xmm12
        vmovhpd   (%r15,%r10,8), %xmm12, %xmm15
        addq      %rcx, %r15
        vmovsd    (%r15), %xmm13
        vmovhpd   (%r15,%r10,8), %xmm13, %xmm10
        vinsertf128 $1, %xmm10, %ymm15, %ymm11
        vfmadd231pd 224(%rdi,%rsi,8), %ymm11, %ymm6
        addq      $32, %rsi
        cmpl      %r8d, %eax
        jb        ..B2.14
..B2.15:
        vaddpd    %ymm5, %ymm8, %ymm5
        vaddpd    %ymm3, %ymm4, %ymm3
        vaddpd    %ymm1, %ymm2, %ymm1
        vaddpd    %ymm6, %ymm0, %ymm0
        vaddpd    %ymm3, %ymm5, %ymm4
        vaddpd    %ymm0, %ymm1, %ymm2
        movq      80(%rsp), %rbx
        movq      88(%rsp), %r12
        movl      96(%rsp), %r14d
        movl      104(%rsp), %r9d
        movq      40(%rsp), %r11
        movl      112(%rsp), %ecx
        vaddpd    %ymm2, %ymm4, %ymm8
..B2.16:
        lea       1(%r8), %eax
        cmpl      %eax, %ecx
        jb        ..B2.25
..B2.17:
        movl      %ecx, %edx
        subl      %r8d, %edx
        cmpl      $4, %edx
        jl        ..B2.29
..B2.18:
        movl      %ecx, %edi
        movl      %edx, %eax
        imull     %r8d, %edi
        andl      $-4, %eax
        movslq    %r8d, %rsi
        addl      %r9d, %edi
        addq      %rbx, %rsi
        xorl      %r13d, %r13d
        movslq    %edi, %rdi
        movl      %r14d, 96(%rsp)
        shlq      $3, %rdi
        movl      %r9d, 104(%rsp)
        lea       (%r11,%rsi,8), %r15
        movl      %ecx, 112(%rsp)
        xorl      %esi, %esi
        movq      24(%rsp), %r11
        movq      32(%rsp), %r14
        .align    16,0x90
..B2.19:
        movq      %r10, %rcx
        lea       (%r14,%rdi), %r9
        vmovsd    (%r9), %xmm0
        addl      $4, %r13d
        shlq      $4, %rcx
        lea       (%rdi,%r11,8), %rdi
        vmovhpd   (%r9,%r10,8), %xmm0, %xmm2
        addq      %rcx, %r9
        vmovsd    (%r9), %xmm1
        vmovhpd   (%r9,%r10,8), %xmm1, %xmm3
        vinsertf128 $1, %xmm3, %ymm2, %ymm4
        vmulpd    (%r15,%rsi,8), %ymm4, %ymm5
        addq      $4, %rsi
        vaddpd    %ymm8, %ymm5, %ymm8
        cmpl      %eax, %r13d
        jb        ..B2.19
..B2.20:
        movl      96(%rsp), %r14d
        movl      104(%rsp), %r9d
        movq      40(%rsp), %r11
        movl      112(%rsp), %ecx
..B2.21:
        movl      %ecx, %esi
        imull     %eax, %esi
        movslq    %eax, %rdi
        cmpl      %edx, %eax
        jae       ..B2.25
..B2.22:
        movl      %ecx, %r13d
        imull     %r8d, %r13d
        movslq    %r8d, %r8
        addl      %r9d, %r13d
        addq      %rbx, %r8
        addl      %r13d, %esi
        movslq    %esi, %rsi
        movq      32(%rsp), %r13
        lea       (%r11,%r8,8), %r8
..B2.23:
        vmovsd    (%r13,%rsi,8), %xmm0
        incl      %eax
        vmulsd    (%r8,%rdi,8), %xmm0, %xmm1
        addq      %r10, %rsi
        incq      %rdi
        vaddsd    %xmm9, %xmm1, %xmm9
        cmpl      %edx, %eax
        jb        ..B2.23
..B2.25:
        incl      %r14d
        vextractf128 $1, %ymm8, %xmm0
        vaddpd    %xmm0, %xmm8, %xmm1
        vunpckhpd %xmm1, %xmm1, %xmm2
        vaddsd    %xmm2, %xmm1, %xmm3
        vaddsd    %xmm9, %xmm3, %xmm4
        vmovsd    %xmm4, (%r12,%rbx,8)
        addq      %r10, %rbx
        cmpl      %ecx, %r14d
        jb        ..B2.4
..B2.26:
        incl      %r9d
        movl      48(%rsp), %eax
        movl      136(%rsp), %r11d
        incl      %eax
        movl      56(%rsp), %r13d
        incl      %r11d
        movl      64(%rsp), %r10d
        incl      %r13d
        movl      72(%rsp), %edx
        incl      %r10d
        movl      144(%rsp), %esi
        incl      %edx
        movl      152(%rsp), %edi
        incl      %esi
        movq      16(%rsp), %r8
        incl      %edi
        incq      %r8
        cmpl      %ecx, %r9d
        jb        ..B2.3
..B2.28:
        vzeroupper 
        addq      $160, %rsp
..___tag_value__Z8multijkxPdS_S_i.31:
        popq      %rbx
..___tag_value__Z8multijkxPdS_S_i.33:
        popq      %r15
..___tag_value__Z8multijkxPdS_S_i.35:
        popq      %r14
..___tag_value__Z8multijkxPdS_S_i.37:
        popq      %r13
..___tag_value__Z8multijkxPdS_S_i.39:
        popq      %r12
..___tag_value__Z8multijkxPdS_S_i.41:
        ret       
..___tag_value__Z8multijkxPdS_S_i.42:
..B2.29:
        xorl      %eax, %eax
        jmp       ..B2.21
..B2.30:
        xorl      %r8d, %r8d
        jmp       ..B2.16
        .align    16,0x90
..___tag_value__Z8multijkxPdS_S_i.48:
	.type	_Z8multijkxPdS_S_i,@function
	.size	_Z8multijkxPdS_S_i,.-_Z8multijkxPdS_S_i
	.data
# -- End  _Z8multijkxPdS_S_i
	.text
# -- Begin  _Z7multIJKPdS_S_i
	.text
       .align    16,0x90
	.globl _Z7multIJKPdS_S_i
_Z7multIJKPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B3.1:
..___tag_value__Z7multIJKPdS_S_i.49:
..L50:

        movq      %rdx, %r9
        movslq    %ecx, %rdx
        movq      %rsi, %r8
        xorl      %esi, %esi
        xorl      %eax, %eax
        testl     %ecx, %ecx
        jle       ..B3.28
..B3.2:
        movq      %r12, -88(%rsp)
        movq      %r13, -80(%rsp)
        movq      %r14, -72(%rsp)
        movq      %r15, -64(%rsp)
        movq      %rbx, -56(%rsp)
..___tag_value__Z7multIJKPdS_S_i.51:
..B3.3:
        movq      %rax, -24(%rsp)
        lea       (%r9,%rax,8), %r12
        movq      %r12, %r13
        xorl      %r11d, %r11d
        andq      $31, %r13
        lea       (%r8,%rax,8), %r14
        movl      %r13d, %r15d
        movl      %r13d, %ebx
        negl      %r15d
        andl      $7, %ebx
        addl      $32, %r15d
        xorl      %r10d, %r10d
        shrl      $3, %r15d
        movl      %r15d, -16(%rsp)
        movl      %esi, -32(%rsp)
        movq      %rdx, -8(%rsp)
        movq      %r8, -40(%rsp)
        movq      %r9, -48(%rsp)
..B3.4:
        cmpl      $16, %ecx
        jl        ..B3.30
..B3.5:
        movl      %r13d, %esi
        testl     %r13d, %r13d
        je        ..B3.8
..B3.6:
        testl     %ebx, %ebx
        jne       ..B3.30
..B3.7:
        movl      -16(%rsp), %esi
..B3.8:
        lea       16(%rsi), %eax
        cmpl      %eax, %ecx
        jl        ..B3.30
..B3.9:
        movl      %ecx, %r9d
        xorl      %eax, %eax
        subl      %esi, %r9d
        lea       (%rdi,%r10,8), %rdx
        andl      $15, %r9d
        negl      %r9d
        addl      %ecx, %r9d
        vmovsd    (%r14), %xmm0
        testq     %rsi, %rsi
        jbe       ..B3.13
..B3.11:
        vmovsd    (%rdx,%rax,8), %xmm1
        vfmadd213sd (%r12,%rax,8), %xmm0, %xmm1
        vmovsd    %xmm1, (%r12,%rax,8)
        incq      %rax
        cmpq      %rsi, %rax
        jb        ..B3.11
..B3.13:
        movslq    %r9d, %rax
        vbroadcastsd %xmm0, %ymm0
        .align    16,0x90
..B3.14:
        vmovupd   (%rdx,%rsi,8), %ymm1
        vmovupd   32(%rdx,%rsi,8), %ymm2
        vmovupd   64(%rdx,%rsi,8), %ymm3
        vmovupd   96(%rdx,%rsi,8), %ymm4
        vfmadd213pd (%r12,%rsi,8), %ymm0, %ymm1
        vfmadd213pd 32(%r12,%rsi,8), %ymm0, %ymm2
        vfmadd213pd 64(%r12,%rsi,8), %ymm0, %ymm3
        vfmadd213pd 96(%r12,%rsi,8), %ymm0, %ymm4
        vmovupd   %ymm1, (%r12,%rsi,8)
        vmovupd   %ymm2, 32(%r12,%rsi,8)
        vmovupd   %ymm3, 64(%r12,%rsi,8)
        vmovupd   %ymm4, 96(%r12,%rsi,8)
        addq      $16, %rsi
        cmpq      %rax, %rsi
        jb        ..B3.14
..B3.16:
        lea       1(%r9), %eax
        cmpl      %eax, %ecx
        jb        ..B3.25
..B3.17:
        movslq    %r9d, %r8
        negq      %r8
        addq      -8(%rsp), %r8
        cmpq      $4, %r8
        jl        ..B3.29
..B3.18:
        movslq    %r9d, %r9
        movl      %r8d, %esi
        andl      $-4, %esi
        lea       (%rdi,%r10,8), %rax
        movslq    %esi, %rsi
        xorl      %edx, %edx
        vbroadcastsd (%r14), %ymm0
        lea       (%rax,%r9,8), %rax
        lea       (%r12,%r9,8), %r15
..B3.19:
        vmovupd   (%rax,%rdx,8), %ymm1
        vfmadd213pd (%r15,%rdx,8), %ymm0, %ymm1
        vmovupd   %ymm1, (%r15,%rdx,8)
        addq      $4, %rdx
        cmpq      %rsi, %rdx
        jb        ..B3.19
..B3.21:
        cmpq      %r8, %rsi
        jae       ..B3.25
..B3.22:
        movslq    %r9d, %r9
        lea       (%rdi,%r10,8), %rdx
        vmovsd    (%r14), %xmm0
        lea       (%rdx,%r9,8), %rdx
        lea       (%r12,%r9,8), %rax
..B3.23:
        vmovsd    (%rdx,%rsi,8), %xmm1
        vfmadd213sd (%rax,%rsi,8), %xmm0, %xmm1
        vmovsd    %xmm1, (%rax,%rsi,8)
        incq      %rsi
        cmpq      %r8, %rsi
        jb        ..B3.23
..B3.25:
        incl      %r11d
        addq      $8, %r14
        addq      -8(%rsp), %r10
        cmpl      %ecx, %r11d
        jb        ..B3.4
..B3.26:
        movl      -32(%rsp), %esi
        incl      %esi
        movq      -24(%rsp), %rax
        movq      -8(%rsp), %rdx
        addq      %rdx, %rax
        movq      -40(%rsp), %r8
        movq      -48(%rsp), %r9
        cmpl      %ecx, %esi
        jb        ..B3.3
..B3.27:
        movq      -88(%rsp), %r12
..___tag_value__Z7multIJKPdS_S_i.56:
        movq      -80(%rsp), %r13
..___tag_value__Z7multIJKPdS_S_i.57:
        movq      -72(%rsp), %r14
..___tag_value__Z7multIJKPdS_S_i.58:
        movq      -64(%rsp), %r15
..___tag_value__Z7multIJKPdS_S_i.59:
        movq      -56(%rsp), %rbx
..___tag_value__Z7multIJKPdS_S_i.60:
..B3.28:
        vzeroupper 
        ret       
..___tag_value__Z7multIJKPdS_S_i.61:
..B3.29:
        xorl      %esi, %esi
        jmp       ..B3.21
..B3.30:
        xorl      %r9d, %r9d
        jmp       ..B3.16
        .align    16,0x90
..___tag_value__Z7multIJKPdS_S_i.66:
	.type	_Z7multIJKPdS_S_i,@function
	.size	_Z7multIJKPdS_S_i,.-_Z7multIJKPdS_S_i
	.data
# -- End  _Z7multIJKPdS_S_i
	.text
# -- Begin  _Z8multIJKXPdS_S_i
	.text
       .align    16,0x90
	.globl _Z8multIJKXPdS_S_i
_Z8multIJKXPdS_S_i:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
..B4.1:
..___tag_value__Z8multIJKXPdS_S_i.67:
..L68:

        movq      %rdx, %r9
        movslq    %ecx, %rdx
        movq      %rsi, %r8
        xorl      %esi, %esi
        xorl      %eax, %eax
        testl     %ecx, %ecx
        jle       ..B4.28
..B4.2:
        movq      %r12, -88(%rsp)
        movq      %r13, -80(%rsp)
        movq      %r14, -72(%rsp)
        movq      %r15, -64(%rsp)
        movq      %rbx, -56(%rsp)
..___tag_value__Z8multIJKXPdS_S_i.69:
..B4.3:
        movq      %rax, -24(%rsp)
        lea       (%r9,%rax,8), %r12
        movq      %r12, %r13
        xorl      %r11d, %r11d
        andq      $31, %r13
        lea       (%r8,%rax,8), %r14
        movl      %r13d, %r15d
        movl      %r13d, %ebx
        negl      %r15d
        andl      $7, %ebx
        addl      $32, %r15d
        xorl      %r10d, %r10d
        shrl      $3, %r15d
        movl      %r15d, -16(%rsp)
        movl      %esi, -32(%rsp)
        movq      %rdx, -8(%rsp)
        movq      %r8, -40(%rsp)
        movq      %r9, -48(%rsp)
..B4.4:
        cmpl      $16, %ecx
        jl        ..B4.30
..B4.5:
        movl      %r13d, %esi
        testl     %r13d, %r13d
        je        ..B4.8
..B4.6:
        testl     %ebx, %ebx
        jne       ..B4.30
..B4.7:
        movl      -16(%rsp), %esi
..B4.8:
        lea       16(%rsi), %eax
        cmpl      %eax, %ecx
        jl        ..B4.30
..B4.9:
        movl      %ecx, %r9d
        xorl      %eax, %eax
        subl      %esi, %r9d
        lea       (%rdi,%r10,8), %rdx
        andl      $15, %r9d
        negl      %r9d
        addl      %ecx, %r9d
        vmovsd    (%r14), %xmm0
        testq     %rsi, %rsi
        jbe       ..B4.13
..B4.11:
        vmovsd    (%rdx,%rax,8), %xmm1
        vfmadd213sd (%r12,%rax,8), %xmm0, %xmm1
        vmovsd    %xmm1, (%r12,%rax,8)
        incq      %rax
        cmpq      %rsi, %rax
        jb        ..B4.11
..B4.13:
        movslq    %r9d, %rax
        vbroadcastsd %xmm0, %ymm0
        .align    16,0x90
..B4.14:
        vmovupd   (%rdx,%rsi,8), %ymm1
        vmovupd   32(%rdx,%rsi,8), %ymm2
        vmovupd   64(%rdx,%rsi,8), %ymm3
        vmovupd   96(%rdx,%rsi,8), %ymm4
        vfmadd213pd (%r12,%rsi,8), %ymm0, %ymm1
        vfmadd213pd 32(%r12,%rsi,8), %ymm0, %ymm2
        vfmadd213pd 64(%r12,%rsi,8), %ymm0, %ymm3
        vfmadd213pd 96(%r12,%rsi,8), %ymm0, %ymm4
        vmovupd   %ymm1, (%r12,%rsi,8)
        vmovupd   %ymm2, 32(%r12,%rsi,8)
        vmovupd   %ymm3, 64(%r12,%rsi,8)
        vmovupd   %ymm4, 96(%r12,%rsi,8)
        addq      $16, %rsi
        cmpq      %rax, %rsi
        jb        ..B4.14
..B4.16:
        lea       1(%r9), %eax
        cmpl      %eax, %ecx
        jb        ..B4.25
..B4.17:
        movslq    %r9d, %r8
        negq      %r8
        addq      -8(%rsp), %r8
        cmpq      $4, %r8
        jl        ..B4.29
..B4.18:
        movslq    %r9d, %r9
        movl      %r8d, %esi
        andl      $-4, %esi
        lea       (%rdi,%r10,8), %rax
        movslq    %esi, %rsi
        xorl      %edx, %edx
        vbroadcastsd (%r14), %ymm0
        lea       (%rax,%r9,8), %rax
        lea       (%r12,%r9,8), %r15
..B4.19:
        vmovupd   (%rax,%rdx,8), %ymm1
        vfmadd213pd (%r15,%rdx,8), %ymm0, %ymm1
        vmovupd   %ymm1, (%r15,%rdx,8)
        addq      $4, %rdx
        cmpq      %rsi, %rdx
        jb        ..B4.19
..B4.21:
        cmpq      %r8, %rsi
        jae       ..B4.25
..B4.22:
        movslq    %r9d, %r9
        lea       (%rdi,%r10,8), %rdx
        vmovsd    (%r14), %xmm0
        lea       (%rdx,%r9,8), %rdx
        lea       (%r12,%r9,8), %rax
..B4.23:
        vmovsd    (%rdx,%rsi,8), %xmm1
        vfmadd213sd (%rax,%rsi,8), %xmm0, %xmm1
        vmovsd    %xmm1, (%rax,%rsi,8)
        incq      %rsi
        cmpq      %r8, %rsi
        jb        ..B4.23
..B4.25:
        incl      %r11d
        addq      $8, %r14
        addq      -8(%rsp), %r10
        cmpl      %ecx, %r11d
        jb        ..B4.4
..B4.26:
        movl      -32(%rsp), %esi
        incl      %esi
        movq      -24(%rsp), %rax
        movq      -8(%rsp), %rdx
        addq      %rdx, %rax
        movq      -40(%rsp), %r8
        movq      -48(%rsp), %r9
        cmpl      %ecx, %esi
        jb        ..B4.3
..B4.27:
        movq      -88(%rsp), %r12
..___tag_value__Z8multIJKXPdS_S_i.74:
        movq      -80(%rsp), %r13
..___tag_value__Z8multIJKXPdS_S_i.75:
        movq      -72(%rsp), %r14
..___tag_value__Z8multIJKXPdS_S_i.76:
        movq      -64(%rsp), %r15
..___tag_value__Z8multIJKXPdS_S_i.77:
        movq      -56(%rsp), %rbx
..___tag_value__Z8multIJKXPdS_S_i.78:
..B4.28:
        vzeroupper 
        ret       
..___tag_value__Z8multIJKXPdS_S_i.79:
..B4.29:
        xorl      %esi, %esi
        jmp       ..B4.21
..B4.30:
        xorl      %r9d, %r9d
        jmp       ..B4.16
        .align    16,0x90
..___tag_value__Z8multIJKXPdS_S_i.84:
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
	.4byte 0x0000008c
	.4byte 0x00000084
	.8byte ..___tag_value__Z8multijkxPdS_S_i.18
	.8byte ..___tag_value__Z8multijkxPdS_S_i.48-..___tag_value__Z8multijkxPdS_S_i.18
	.2byte 0x0400
	.4byte ..___tag_value__Z8multijkxPdS_S_i.20-..___tag_value__Z8multijkxPdS_S_i.18
	.4byte 0x028c100e
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.22-..___tag_value__Z8multijkxPdS_S_i.20
	.4byte 0x038d180e
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.24-..___tag_value__Z8multijkxPdS_S_i.22
	.4byte 0x048e200e
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.26-..___tag_value__Z8multijkxPdS_S_i.24
	.4byte 0x058f280e
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.28-..___tag_value__Z8multijkxPdS_S_i.26
	.4byte 0x0683300e
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.30-..___tag_value__Z8multijkxPdS_S_i.28
	.4byte 0x0401d00e
	.4byte ..___tag_value__Z8multijkxPdS_S_i.31-..___tag_value__Z8multijkxPdS_S_i.30
	.4byte 0x04c3300e
	.4byte ..___tag_value__Z8multijkxPdS_S_i.33-..___tag_value__Z8multijkxPdS_S_i.31
	.4byte 0x04cf280e
	.4byte ..___tag_value__Z8multijkxPdS_S_i.35-..___tag_value__Z8multijkxPdS_S_i.33
	.4byte 0x04ce200e
	.4byte ..___tag_value__Z8multijkxPdS_S_i.37-..___tag_value__Z8multijkxPdS_S_i.35
	.4byte 0x04cd180e
	.4byte ..___tag_value__Z8multijkxPdS_S_i.39-..___tag_value__Z8multijkxPdS_S_i.37
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z8multijkxPdS_S_i.41-..___tag_value__Z8multijkxPdS_S_i.39
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z8multijkxPdS_S_i.42-..___tag_value__Z8multijkxPdS_S_i.41
	.8byte 0x8d028c068301d00e
	.4byte 0x8f048e03
	.2byte 0x0005
	.4byte 0x00000054
	.4byte 0x00000114
	.8byte ..___tag_value__Z7multIJKPdS_S_i.49
	.8byte ..___tag_value__Z7multIJKPdS_S_i.66-..___tag_value__Z7multIJKPdS_S_i.49
	.2byte 0x0400
	.4byte ..___tag_value__Z7multIJKPdS_S_i.51-..___tag_value__Z7multIJKPdS_S_i.49
	.8byte 0x0a8e0b8d0c8c0883
	.2byte 0x098f
	.byte 0x04
	.4byte ..___tag_value__Z7multIJKPdS_S_i.56-..___tag_value__Z7multIJKPdS_S_i.51
	.2byte 0x04cc
	.4byte ..___tag_value__Z7multIJKPdS_S_i.57-..___tag_value__Z7multIJKPdS_S_i.56
	.2byte 0x04cd
	.4byte ..___tag_value__Z7multIJKPdS_S_i.58-..___tag_value__Z7multIJKPdS_S_i.57
	.2byte 0x04ce
	.4byte ..___tag_value__Z7multIJKPdS_S_i.59-..___tag_value__Z7multIJKPdS_S_i.58
	.2byte 0x04cf
	.4byte ..___tag_value__Z7multIJKPdS_S_i.60-..___tag_value__Z7multIJKPdS_S_i.59
	.2byte 0x04c3
	.4byte ..___tag_value__Z7multIJKPdS_S_i.61-..___tag_value__Z7multIJKPdS_S_i.60
	.8byte 0x0a8e0b8d0c8c0883
	.4byte 0x0000098f
	.byte 0x00
	.4byte 0x00000054
	.4byte 0x0000016c
	.8byte ..___tag_value__Z8multIJKXPdS_S_i.67
	.8byte ..___tag_value__Z8multIJKXPdS_S_i.84-..___tag_value__Z8multIJKXPdS_S_i.67
	.2byte 0x0400
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.69-..___tag_value__Z8multIJKXPdS_S_i.67
	.8byte 0x0a8e0b8d0c8c0883
	.2byte 0x098f
	.byte 0x04
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.74-..___tag_value__Z8multIJKXPdS_S_i.69
	.2byte 0x04cc
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.75-..___tag_value__Z8multIJKXPdS_S_i.74
	.2byte 0x04cd
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.76-..___tag_value__Z8multIJKXPdS_S_i.75
	.2byte 0x04ce
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.77-..___tag_value__Z8multIJKXPdS_S_i.76
	.2byte 0x04cf
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.78-..___tag_value__Z8multIJKXPdS_S_i.77
	.2byte 0x04c3
	.4byte ..___tag_value__Z8multIJKXPdS_S_i.79-..___tag_value__Z8multIJKXPdS_S_i.78
	.8byte 0x0a8e0b8d0c8c0883
	.4byte 0x0000098f
	.byte 0x00
# End

