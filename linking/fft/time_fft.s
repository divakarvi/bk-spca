	.file "time_fft.cpp"
	.text
..TXTST0:
# -- Begin  main
       .align    16,0x90
	.globl main
main:
..B1.1:
..___tag_value_main.1:
        pushq     %rbp
..___tag_value_main.3:
        movq      %rsp, %rbp
..___tag_value_main.4:
        andq      $-128, %rsp
        subq      $256, %rsp
        xorl      %edi, %edi
..___tag_value_main.6:
        call      __intel_new_proc_init@PLT
..___tag_value_main.7:
..B1.11:
        lea       .L_2__STRING.24(%rip), %rdi
..___tag_value_main.8:
        call      _Z10verify_dirPKc@PLT
..___tag_value_main.9:
..B1.2:
        lea       .L_2__STRING.26(%rip), %rdi
..___tag_value_main.10:
        call      _Z9link_coutPKc@PLT
..___tag_value_main.11:
..B1.3:
        lea       .L_2__STRING.27(%rip), %rsi
        lea       (%rsp), %rdi
        lea       .L_2__STRING.25(%rip), %rdx
        xorl      %eax, %eax
        call      sprintf@PLT
..B1.4:
        xorl      %edi, %edi
        lea       (%rsp), %rsi
..___tag_value_main.12:
        call      _Z10make_table10yesno_typePKc@PLT
..___tag_value_main.13:
..B1.5:
        lea       .L_2__STRING.28(%rip), %rsi
        lea       (%rsp), %rdi
        lea       .L_2__STRING.25(%rip), %rdx
        xorl      %eax, %eax
        call      sprintf@PLT
..B1.6:
        movl      $1, %edi
        lea       (%rsp), %rsi
..___tag_value_main.14:
        call      _Z10make_table10yesno_typePKc@PLT
..___tag_value_main.15:
..B1.7:
..___tag_value_main.16:
        call      _Z11unlink_coutv@PLT
..___tag_value_main.17:
..B1.8:
        xorl      %eax, %eax
        movq      %rbp, %rsp
        popq      %rbp
..___tag_value_main.18:
        ret       
        .align    16,0x90
..___tag_value_main.20:
	.type	main,@function
	.size	main,.-main
	.data
# -- End  main
	.text
# -- Begin  _Z10make_table10yesno_typePKc
       .align    16,0x90
	.globl _Z10make_table10yesno_typePKc
_Z10make_table10yesno_typePKc:
# parameter 1: %edi
# parameter 2: %rsi
..B2.1:
..___tag_value__Z10make_table10yesno_typePKc.21:
        pushq     %r12
..___tag_value__Z10make_table10yesno_typePKc.23:
        pushq     %r13
..___tag_value__Z10make_table10yesno_typePKc.25:
        pushq     %r14
..___tag_value__Z10make_table10yesno_typePKc.27:
        pushq     %r15
..___tag_value__Z10make_table10yesno_typePKc.29:
        pushq     %rbx
..___tag_value__Z10make_table10yesno_typePKc.31:
        pushq     %rbp
..___tag_value__Z10make_table10yesno_typePKc.33:
        subq      $328, %rsp
..___tag_value__Z10make_table10yesno_typePKc.35:
        movq      %rsi, %r15
        movsd     .L_2il0floatpacket.457(%rip), %xmm0
        movl      %edi, %ebp
        movl      $32, 8(%rsp)
        xorl      %ebx, %ebx
        movl      $64, 12(%rsp)
        movl      $80, 16(%rsp)
        movl      $168, 20(%rsp)
        movl      $192, 24(%rsp)
        movl      $1024, 28(%rsp)
        movl      $131072, 32(%rsp)
        movl      $1048576, 36(%rsp)
        call      log@PLT
..B2.216:
        movsd     %xmm0, 48(%rsp)
        movq      %r15, 320(%rsp)
..B2.2:
        cvtsi2sd  8(%rsp,%rbx,4), %xmm0
        movsd     %xmm0, 64(%rsp)
        call      log@PLT
..B2.217:
        mulsd     64(%rsp), %xmm0
        movl      %ebp, %esi
        divsd     48(%rsp), %xmm0
        movl      8(%rsp,%rbx,4), %edi
        movsd     %xmm0, 56(%rsp)
..___tag_value__Z10make_table10yesno_typePKc.36:
        call      _Z8time_ffti10yesno_type@PLT
..___tag_value__Z10make_table10yesno_typePKc.37:
..B2.3:
        movq      stat_mkl(%rip), %r15
        movslq    16(%r15), %rax
        testq     %rax, %rax
        jle       ..B2.204
..B2.4:
        cmpl      $1, 12(%r15)
        je        ..B2.243
..B2.5:
        movq      (%r15), %r14
        lea       (,%rax,8), %rdx
        lea       (%r14,%rax,8), %r12
        cmpq      %r12, %r14
        je        ..B2.27
..B2.6:
        movq      %rdx, %rax
        movq      %r12, %rsi
        sarq      $3, %rax
        sarq      $35, %rdx
        bsr       %eax, %ecx
        bsr       %edx, %r13d
        negl      %ecx
        negl      %r13d
        addl      $63, %ecx
        addl      $31, %r13d
        testl     %edx, %edx
        cmove     %ecx, %r13d
        movslq    %r13d, %r13
        addq      %r13, %r13
        negq      %r13
        addq      $126, %r13
        cmpq      $16, %rax
        jle       ..B2.168
..B2.7:
        movl      %ebp, 40(%rsp)
..B2.8:
        movq      %rsi, %rdi
        subq      %r14, %rdi
        sarq      $3, %rdi
        testq     %r13, %r13
        je        ..B2.133
..B2.9:
        movq      %rdi, %rax
        decq      %r13
        shrq      $63, %rax
        addq      %rax, %rdi
        lea       -8(%rsi), %rax
        shrq      $1, %rdi
        movsd     (%r14), %xmm2
        movsd     -8(%rsi), %xmm1
        lea       (%r14,%rdi,8), %rdx
        movsd     (%rdx), %xmm0
        comisd    %xmm2, %xmm0
        jbe       ..B2.13
..B2.10:
        comisd    %xmm0, %xmm1
        ja        ..B2.12
..B2.11:
        comisd    %xmm2, %xmm1
        movq      %rax, %rdx
        movq      %r14, %rbp
        ja        ..B2.16
        movq      %r14, %rdx
        jmp       ..B2.16
..B2.12:
        movq      %r14, %rbp
        jmp       ..B2.16
..B2.13:
        comisd    %xmm2, %xmm1
        ja        ..B2.15
..B2.14:
        comisd    %xmm0, %xmm1
        movq      %r14, %rbp
        jbe       ..B2.16
        movq      %rax, %rdx
        jmp       ..B2.16
..B2.15:
        movq      %r14, %rdx
        movq      %rdx, %rbp
..B2.16:
        movq      %rsi, %rax
        movsd     (%rdx), %xmm0
        jmp       ..B2.17
..B2.26:
        movsd     %xmm2, (%rbp)
        addq      $8, %rbp
        movsd     %xmm1, (%rax)
..B2.17:
        movsd     (%rbp), %xmm1
        comisd    %xmm1, %xmm0
        jbe       ..B2.21
..B2.19:
        addq      $8, %rbp
        movsd     (%rbp), %xmm1
        comisd    %xmm1, %xmm0
        ja        ..B2.19
..B2.21:
        addq      $-8, %rax
        movsd     (%rax), %xmm2
        comisd    %xmm0, %xmm2
        ja        ..B2.21
..B2.25:
        cmpq      %rax, %rbp
        jae       ..B2.109
        jmp       ..B2.26
..B2.27:
        movl      $1, 12(%r15)
..B2.28:
        movl      16(%r15), %edx
        movl      %edx, %eax
        shrl      $31, %eax
        addl      %eax, %edx
        sarl      $1, %edx
        movslq    %edx, %rdx
        movsd     (%r14,%rdx,8), %xmm0
        divsd     56(%rsp), %xmm0
        movq      stat_fftw(%rip), %r14
        movsd     %xmm0, 128(%rsp,%rbx,8)
        movl      16(%r14), %eax
        testl     %eax, %eax
        jle       ..B2.194
..B2.29:
        movq      (%r14), %r12
        cmpl      $1, 12(%r14)
        je        ..B2.67
..B2.30:
        movslq    %eax, %rax
        lea       (%r12,%rax,8), %r13
        cmpq      %r13, %r12
        lea       (,%rax,8), %rdx
        je        ..B2.66
..B2.31:
        movq      %rdx, %r15
        movq      %r12, %rdi
        sarq      $3, %r15
        movq      %r13, %rsi
        sarq      $35, %rdx
        bsr       %r15d, %eax
        bsr       %edx, %ecx
        negl      %eax
        negl      %ecx
        addl      $63, %eax
        addl      $31, %ecx
        testl     %edx, %edx
        cmove     %eax, %ecx
        movslq    %ecx, %rcx
        addq      %rcx, %rcx
        negq      %rcx
        addq      $126, %rcx
        movq      %rcx, %rdx
..___tag_value__Z10make_table10yesno_typePKc.38:
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_@PLT
..___tag_value__Z10make_table10yesno_typePKc.39:
..B2.32:
        cmpq      $16, %r15
        jle       ..B2.54
..B2.33:
        lea       128(%r12), %rax
..B2.34:
        lea       8(%r12), %r15
..B2.35:
        movq      %rbx, (%rsp)
        movq      %rax, %rbx
        movl      %ebp, 40(%rsp)
..B2.36:
        movsd     (%r15), %xmm1
        movsd     (%r12), %xmm0
        movq      (%r15), %rbp
        comisd    %xmm1, %xmm0
        jbe       ..B2.39
..B2.37:
        movq      %r15, %rdx
        movq      %r12, %rsi
        subq      %r12, %rdx
        shrq      $3, %rdx
        shlq      $3, %rdx
        movq      %rdx, %rcx
        negq      %rcx
        lea       8(%r15,%rcx), %rdi
        call      memmove@PLT
..B2.38:
        movq      %rbp, (%r12)
        jmp       ..B2.44
..B2.39:
        movsd     -8(%r15), %xmm0
        lea       -16(%r15), %rcx
        movq      %r15, %rsi
        lea       -8(%r15), %rdx
        comisd    %xmm1, %xmm0
        jbe       ..B2.43
..B2.41:
        movsd     %xmm0, (%rsi)
        movq      %rdx, %rsi
        movsd     (%rcx), %xmm0
        addq      $-8, %rcx
        addq      $-8, %rdx
        comisd    %xmm1, %xmm0
        ja        ..B2.41
..B2.43:
        movq      %rbp, (%rsi)
..B2.44:
        addq      $8, %r15
        cmpq      %rbx, %r15
        jne       ..B2.36
..B2.45:
        movq      (%rsp), %rbx
        movl      40(%rsp), %ebp
..B2.46:
        addq      $128, %r12
        cmpq      %r13, %r12
        je        ..B2.53
..B2.48:
        movsd     (%r12), %xmm1
        lea       -16(%r12), %rdx
        movsd     -8(%r12), %xmm0
        lea       -8(%r12), %rax
        movq      (%r12), %rcx
        movq      %r12, %rsi
        comisd    %xmm1, %xmm0
        jbe       ..B2.52
..B2.50:
        movsd     %xmm0, (%rsi)
        movq      %rax, %rsi
        movsd     (%rdx), %xmm0
        addq      $-8, %rdx
        addq      $-8, %rax
        comisd    %xmm1, %xmm0
        ja        ..B2.50
..B2.52:
        addq      $8, %r12
        movq      %rcx, (%rsi)
        cmpq      %r13, %r12
        jne       ..B2.48
..B2.53:
        movl      16(%r14), %eax
        movq      (%r14), %r12
        jmp       ..B2.66
..B2.54:
        lea       8(%r12), %r15
        cmpq      %r13, %r15
        je        ..B2.53
..B2.55:
        movl      %ebp, 40(%rsp)
..B2.56:
        movsd     (%r15), %xmm1
        movsd     (%r12), %xmm0
        movq      (%r15), %rbp
        comisd    %xmm1, %xmm0
        jbe       ..B2.59
..B2.57:
        movq      %r15, %rdx
        movq      %r12, %rsi
        subq      %r12, %rdx
        shrq      $3, %rdx
        shlq      $3, %rdx
        movq      %rdx, %rax
        negq      %rax
        lea       8(%r15,%rax), %rdi
        call      memmove@PLT
..B2.58:
        movq      %rbp, (%r12)
        jmp       ..B2.64
..B2.59:
        movsd     -8(%r15), %xmm0
        lea       -16(%r15), %rdx
        movq      %r15, %rcx
        lea       -8(%r15), %rax
        comisd    %xmm1, %xmm0
        jbe       ..B2.63
..B2.61:
        movsd     %xmm0, (%rcx)
        movq      %rax, %rcx
        movsd     (%rdx), %xmm0
        addq      $-8, %rdx
        addq      $-8, %rax
        comisd    %xmm1, %xmm0
        ja        ..B2.61
..B2.63:
        movq      %rbp, (%rcx)
..B2.64:
        addq      $8, %r15
        cmpq      %r13, %r15
        jne       ..B2.56
..B2.65:
        movl      40(%rsp), %ebp
        movl      16(%r14), %eax
        movq      (%r14), %r12
..B2.66:
        movl      $1, 12(%r14)
..B2.67:
        movl      %eax, %edx
        shrl      $31, %edx
        addl      %edx, %eax
        sarl      $1, %eax
        movslq    %eax, %rax
        movq      stat_nr(%rip), %r14
        movsd     (%r12,%rax,8), %xmm0
        divsd     56(%rsp), %xmm0
        movsd     %xmm0, 192(%rsp,%rbx,8)
        movl      16(%r14), %eax
        testl     %eax, %eax
        jle       ..B2.184
..B2.68:
        movq      (%r14), %r13
        cmpl      $1, 12(%r14)
        je        ..B2.106
..B2.69:
        movslq    %eax, %rax
        lea       (%r13,%rax,8), %r12
        cmpq      %r12, %r13
        lea       (,%rax,8), %rdx
        je        ..B2.105
..B2.70:
        movq      %rdx, %r15
        movq      %r13, %rdi
        sarq      $3, %r15
        movq      %r12, %rsi
        sarq      $35, %rdx
        bsr       %r15d, %eax
        bsr       %edx, %ecx
        negl      %eax
        negl      %ecx
        addl      $63, %eax
        addl      $31, %ecx
        testl     %edx, %edx
        cmove     %eax, %ecx
        movslq    %ecx, %rcx
        addq      %rcx, %rcx
        negq      %rcx
        addq      $126, %rcx
        movq      %rcx, %rdx
..___tag_value__Z10make_table10yesno_typePKc.40:
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_@PLT
..___tag_value__Z10make_table10yesno_typePKc.41:
..B2.71:
        cmpq      $16, %r15
        jle       ..B2.93
..B2.72:
        lea       128(%r13), %rax
..B2.73:
        lea       8(%r13), %r15
..B2.74:
        movq      %rbx, (%rsp)
        movq      %rax, %rbx
        movl      %ebp, 40(%rsp)
..B2.75:
        movsd     (%r15), %xmm1
        movsd     (%r13), %xmm0
        movq      (%r15), %rbp
        comisd    %xmm1, %xmm0
        jbe       ..B2.78
..B2.76:
        movq      %r15, %rdx
        movq      %r13, %rsi
        subq      %r13, %rdx
        shrq      $3, %rdx
        shlq      $3, %rdx
        movq      %rdx, %rcx
        negq      %rcx
        lea       8(%r15,%rcx), %rdi
        call      memmove@PLT
..B2.77:
        movq      %rbp, (%r13)
        jmp       ..B2.83
..B2.78:
        movsd     -8(%r15), %xmm0
        lea       -16(%r15), %rcx
        movq      %r15, %rsi
        lea       -8(%r15), %rdx
        comisd    %xmm1, %xmm0
        jbe       ..B2.82
..B2.80:
        movsd     %xmm0, (%rsi)
        movq      %rdx, %rsi
        movsd     (%rcx), %xmm0
        addq      $-8, %rcx
        addq      $-8, %rdx
        comisd    %xmm1, %xmm0
        ja        ..B2.80
..B2.82:
        movq      %rbp, (%rsi)
..B2.83:
        addq      $8, %r15
        cmpq      %rbx, %r15
        jne       ..B2.75
..B2.84:
        movq      (%rsp), %rbx
        movl      40(%rsp), %ebp
..B2.85:
        addq      $128, %r13
        cmpq      %r12, %r13
        je        ..B2.92
..B2.87:
        movsd     (%r13), %xmm1
        lea       -16(%r13), %rdx
        movsd     -8(%r13), %xmm0
        lea       -8(%r13), %rax
        movq      (%r13), %rcx
        movq      %r13, %rsi
        comisd    %xmm1, %xmm0
        jbe       ..B2.91
..B2.89:
        movsd     %xmm0, (%rsi)
        movq      %rax, %rsi
        movsd     (%rdx), %xmm0
        addq      $-8, %rdx
        addq      $-8, %rax
        comisd    %xmm1, %xmm0
        ja        ..B2.89
..B2.91:
        addq      $8, %r13
        movq      %rcx, (%rsi)
        cmpq      %r12, %r13
        jne       ..B2.87
..B2.92:
        movl      16(%r14), %eax
        movq      (%r14), %r13
        jmp       ..B2.105
..B2.93:
        lea       8(%r13), %r15
        cmpq      %r12, %r15
        je        ..B2.92
..B2.94:
        movl      %ebp, 40(%rsp)
..B2.95:
        movsd     (%r15), %xmm1
        movsd     (%r13), %xmm0
        movq      (%r15), %rbp
        comisd    %xmm1, %xmm0
        jbe       ..B2.98
..B2.96:
        movq      %r15, %rdx
        movq      %r13, %rsi
        subq      %r13, %rdx
        shrq      $3, %rdx
        shlq      $3, %rdx
        movq      %rdx, %rax
        negq      %rax
        lea       8(%r15,%rax), %rdi
        call      memmove@PLT
..B2.97:
        movq      %rbp, (%r13)
        jmp       ..B2.103
..B2.98:
        movsd     -8(%r15), %xmm0
        lea       -16(%r15), %rdx
        movq      %r15, %rcx
        lea       -8(%r15), %rax
        comisd    %xmm1, %xmm0
        jbe       ..B2.102
..B2.100:
        movsd     %xmm0, (%rcx)
        movq      %rax, %rcx
        movsd     (%rdx), %xmm0
        addq      $-8, %rdx
        addq      $-8, %rax
        comisd    %xmm1, %xmm0
        ja        ..B2.100
..B2.102:
        movq      %rbp, (%rcx)
..B2.103:
        addq      $8, %r15
        cmpq      %r12, %r15
        jne       ..B2.95
..B2.104:
        movl      40(%rsp), %ebp
        movl      16(%r14), %eax
        movq      (%r14), %r13
..B2.105:
        movl      $1, 12(%r14)
..B2.106:
        movl      %eax, %edx
        shrl      $31, %edx
        addl      %edx, %eax
        sarl      $1, %eax
        movslq    %eax, %rax
        movsd     (%r13,%rax,8), %xmm0
        divsd     56(%rsp), %xmm0
        movsd     %xmm0, 256(%rsp,%rbx,8)
        incq      %rbx
        cmpq      $8, %rbx
        jl        ..B2.2
..B2.107:
        movq      320(%rsp), %r15
        lea       .L_2__STRING.21(%rip), %rsi
        movq      %rsi, 104(%rsp)
        lea       64(%rsp), %rdi
        movq      %r15, %rsi
        lea       .L_2__STRING.13(%rip), %rax
        lea       .L_2__STRING.14(%rip), %rdx
        lea       .L_2__STRING.15(%rip), %rcx
        lea       .L_2__STRING.16(%rip), %rbx
        lea       .L_2__STRING.17(%rip), %rbp
        movq      %rax, (%rsp)
        lea       .L_2__STRING.18(%rip), %r8
        movq      %rdx, 8(%rsp)
        lea       .L_2__STRING.19(%rip), %r9
        movq      %rcx, 16(%rsp)
        lea       .L_2__STRING.20(%rip), %r10
        movq      %rbx, 24(%rsp)
        lea       (%rsp), %r11
        lea       .L_2__STRING.22(%rip), %rax
        lea       .L_2__STRING.23(%rip), %rdx
        movl      $15, 68(%rsp)
        lea       104(%rsp), %rcx
        movl      $8, 96(%rsp)
        lea       128(%rsp), %rbx
        movl      $3, 100(%rsp)
        movq      %rbp, 32(%rsp)
        movq      %r8, 40(%rsp)
        movq      %r9, 48(%rsp)
        movq      %r10, 56(%rsp)
        movq      %r11, 72(%rsp)
        movq      %rax, 112(%rsp)
        movq      %rdx, 120(%rsp)
        movq      %rcx, 80(%rsp)
        movl      $4, 64(%rsp)
        movq      %rbx, 88(%rsp)
..___tag_value__Z10make_table10yesno_typePKc.42:
        call      _ZN5Table5printEPKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.43:
..B2.108:
        addq      $328, %rsp
..___tag_value__Z10make_table10yesno_typePKc.44:
        popq      %rbp
..___tag_value__Z10make_table10yesno_typePKc.46:
        popq      %rbx
..___tag_value__Z10make_table10yesno_typePKc.48:
        popq      %r15
..___tag_value__Z10make_table10yesno_typePKc.50:
        popq      %r14
..___tag_value__Z10make_table10yesno_typePKc.52:
        popq      %r13
..___tag_value__Z10make_table10yesno_typePKc.54:
        popq      %r12
..___tag_value__Z10make_table10yesno_typePKc.56:
        ret       
..___tag_value__Z10make_table10yesno_typePKc.57:
..B2.109:
        movq      %rbp, %rdi
        movq      %r13, %rdx
..___tag_value__Z10make_table10yesno_typePKc.64:
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_@PLT
..___tag_value__Z10make_table10yesno_typePKc.65:
..B2.110:
        movq      %rbp, %rsi
        subq      %r14, %rbp
        sarq      $3, %rbp
        cmpq      $16, %rbp
        jg        ..B2.8
..B2.111:
        movl      40(%rsp), %ebp
..B2.112:
        lea       128(%r14), %r13
..B2.113:
        lea       8(%r14), %rax
..B2.114:
        movq      %rbx, (%rsp)
        movq      %rax, %rbx
        movl      %ebp, 40(%rsp)
..B2.115:
        movsd     (%rbx), %xmm1
        movsd     (%r14), %xmm0
        movq      (%rbx), %rbp
        comisd    %xmm1, %xmm0
        jbe       ..B2.118
..B2.116:
        movq      %rbx, %rdx
        movq      %r14, %rsi
        subq      %r14, %rdx
        shrq      $3, %rdx
        shlq      $3, %rdx
        movq      %rdx, %rcx
        negq      %rcx
        lea       8(%rbx,%rcx), %rdi
        call      memmove@PLT
..B2.117:
        movq      %rbp, (%r14)
        jmp       ..B2.123
..B2.118:
        movsd     -8(%rbx), %xmm0
        lea       -16(%rbx), %rcx
        movq      %rbx, %rsi
        lea       -8(%rbx), %rdx
        comisd    %xmm1, %xmm0
        jbe       ..B2.122
..B2.120:
        movsd     %xmm0, (%rsi)
        movq      %rdx, %rsi
        movsd     (%rcx), %xmm0
        addq      $-8, %rcx
        addq      $-8, %rdx
        comisd    %xmm1, %xmm0
        ja        ..B2.120
..B2.122:
        movq      %rbp, (%rsi)
..B2.123:
        addq      $8, %rbx
        cmpq      %r13, %rbx
        jne       ..B2.115
..B2.124:
        movq      (%rsp), %rbx
        movl      40(%rsp), %ebp
..B2.125:
        cmpq      %r12, %r13
        je        ..B2.242
..B2.127:
        movsd     (%r13), %xmm1
        lea       -16(%r13), %rdx
        movsd     -8(%r13), %xmm0
        lea       -8(%r13), %rax
        movq      (%r13), %rcx
        movq      %r13, %rsi
        comisd    %xmm1, %xmm0
        jbe       ..B2.131
..B2.129:
        movsd     %xmm0, (%rsi)
        movq      %rax, %rsi
        movsd     (%rdx), %xmm0
        addq      $-8, %rdx
        addq      $-8, %rax
        comisd    %xmm1, %xmm0
        ja        ..B2.129
..B2.131:
        addq      $8, %r13
        movq      %rcx, (%rsi)
        cmpq      %r12, %r13
        jne       ..B2.127
..B2.132:
        movq      (%r15), %r14
        jmp       ..B2.27
..B2.133:
        movl      40(%rsp), %ebp
        cmpq      $2, %rdi
        jge       ..B2.149
..B2.134:
        movq      %rsi, %r9
        subq      %r14, %r9
        cmpq      $1, %rdi
        jle       ..B2.112
..B2.135:
        movl      $1, %ecx
..B2.136:
        addq      $-8, %r9
        xorl      %r10d, %r10d
        movq      %r9, %rdx
        addq      $-8, %rsi
        sarq      $3, %rdx
        xorl      %r8d, %r8d
        testq     %rdx, %rdx
        movq      (%r14), %rax
        cmovle    %ecx, %r10d
        movsd     (%rsi), %xmm0
        movq      (%rsi), %rdi
        movq      %rax, (%rsi)
        xorl      %eax, %eax
        lea       -1(%rdx,%r10), %r10
        sarq      $1, %r10
        testq     %r10, %r10
        jle       ..B2.139
..B2.138:
        lea       2(,%rax,2), %r11
        movsd     -8(%r14,%r11,8), %xmm1
        lea       -1(%r11), %rax
        comisd    (%r14,%r11,8), %xmm1
        ja        ..L66
        movq      %r11, %rax
..L66:
        movq      (%r14,%rax,8), %r13
        cmpq      %r10, %rax
        movq      %r13, (%r14,%r8,8)
        movq      %rax, %r8
        jl        ..B2.138
..B2.139:
        testq     $1, %rdx
        jne       ..B2.142
..B2.140:
        movq      %rdx, %r10
        xorl      %r11d, %r11d
        addq      $-2, %r10
        cmovl     %ecx, %r11d
        lea       -2(%rdx,%r11), %r13
        sarq      $1, %r13
        cmpq      %r13, %rax
        jne       ..B2.142
..B2.141:
        lea       2(,%rax,2), %r10
        movq      -8(%r14,%r10,8), %rax
        movq      %rax, (%r14,%r8,8)
        lea       -1(%r10), %r8
..B2.142:
        lea       -1(%r8), %rax
        shrq      $63, %rax
        lea       -1(%r8,%rax), %rax
        sarq      $1, %rax
        testq     %r8, %r8
        jle       ..B2.147
..B2.144:
        movq      (%r14,%rax,8), %r10
        comisd    (%r14,%rax,8), %xmm0
        jbe       ..B2.147
..B2.145:
        movq      %r10, (%r14,%r8,8)
        lea       -1(%rax), %r10
        shrq      $63, %r10
        movq      %rax, %r8
        lea       -1(%rax,%r10), %rax
        sarq      $1, %rax
        testq     %r8, %r8
        jg        ..B2.144
..B2.147:
        .byte     144
        .byte     72
        .byte     141
        .byte     116
        .byte     38
        .byte     0
        movq      %rdi, (%r14,%r8,8)
        cmpq      $1, %rdx
        jg        ..B2.136
        jmp       ..B2.112
..B2.149:
        movl      $1, %r8d
        xorl      %eax, %eax
        testq     %rdi, %rdi
        movq      %rdi, %r9
        cmovle    %r8d, %eax
        xorl      %r10d, %r10d
        addq      $-2, %r9
        lea       -2(%rdi), %rcx
        cmovl     %r8d, %r10d
        movq      %rdi, %rdx
        shrq      $63, %rcx
        andq      $1, %rdx
        lea       -2(%rdi,%rcx), %rcx
        sarq      $1, %rcx
        lea       -1(%rdi,%rax), %rax
        sarq      $1, %rax
        lea       -2(%rdi,%r10), %r10
        sarq      $1, %r10
        jmp       ..B2.150
..B2.163:
        decq      %rcx
..B2.150:
        movsd     (%r14,%rcx,8), %xmm0
        movq      %rcx, %r11
        movq      (%r14,%rcx,8), %r9
        movq      %rcx, %r8
        cmpq      %rax, %rcx
        jge       ..B2.154
..B2.152:
        lea       2(,%r8,2), %r13
        movsd     -8(%r14,%r13,8), %xmm1
        lea       -1(%r13), %r8
        comisd    (%r14,%r13,8), %xmm1
        ja        ..L67
        movq      %r13, %r8
..L67:
        movq      (%r14,%r8,8), %r13
        cmpq      %rax, %r8
        movq      %r13, (%r14,%r11,8)
        movq      %r8, %r11
        jl        ..B2.152
..B2.154:
        testq     %rdx, %rdx
        jne       ..B2.157
..B2.155:
        cmpq      %r10, %r8
        jne       ..B2.157
..B2.156:
        lea       2(,%r8,2), %r13
        movq      -8(%r14,%r13,8), %r8
        movq      %r8, (%r14,%r11,8)
        lea       -1(%r13), %r11
..B2.157:
        lea       -1(%r11), %r8
        shrq      $63, %r8
        lea       -1(%r11,%r8), %r8
        sarq      $1, %r8
        cmpq      %rcx, %r11
        jle       ..B2.162
..B2.159:
        movq      (%r14,%r8,8), %r13
        comisd    (%r14,%r8,8), %xmm0
        jbe       ..B2.162
..B2.160:
        movq      %r13, (%r14,%r11,8)
        lea       -1(%r8), %r13
        shrq      $63, %r13
        movq      %r8, %r11
        lea       -1(%r8,%r13), %r8
        sarq      $1, %r8
        cmpq      %rcx, %r11
        jg        ..B2.159
..B2.162:
        movq      %r9, (%r14,%r11,8)
        testq     %rcx, %rcx
        je        ..B2.134
        jmp       ..B2.163
..B2.168:
        lea       8(%r14), %r13
        cmpq      %r12, %r13
        je        ..B2.27
..B2.169:
        movl      %ebp, 40(%rsp)
..B2.170:
        movsd     (%r13), %xmm1
        movsd     (%r14), %xmm0
        movq      (%r13), %rbp
        comisd    %xmm1, %xmm0
        jbe       ..B2.173
..B2.171:
        movq      %r13, %rdx
        movq      %r14, %rsi
        subq      %r14, %rdx
        shrq      $3, %rdx
        shlq      $3, %rdx
        movq      %rdx, %rax
        negq      %rax
        lea       8(%r13,%rax), %rdi
        call      memmove@PLT
..B2.172:
        movq      %rbp, (%r14)
        jmp       ..B2.178
..B2.173:
        movsd     -8(%r13), %xmm0
        lea       -16(%r13), %rdx
        movq      %r13, %rcx
        lea       -8(%r13), %rax
        comisd    %xmm1, %xmm0
        jbe       ..B2.177
..B2.175:
        movsd     %xmm0, (%rcx)
        movq      %rax, %rcx
        movsd     (%rdx), %xmm0
        addq      $-8, %rdx
        addq      $-8, %rax
        comisd    %xmm1, %xmm0
        ja        ..B2.175
..B2.177:
        movq      %rbp, (%rcx)
..B2.178:
        addq      $8, %r13
        cmpq      %r12, %r13
        jne       ..B2.170
..B2.179:
        movl      40(%rsp), %ebp
        movq      (%r15), %r14
        jmp       ..B2.27
..B2.184:
        lea       .L_2__STRING.0(%rip), %rsi
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi
..___tag_value__Z10make_table10yesno_typePKc.68:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.69:
..B2.185:
        movq      %rax, %rdi
        lea       .L_2__STRING.5(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.70:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.71:
..B2.186:
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z10make_table10yesno_typePKc.72:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z10make_table10yesno_typePKc.73:
..B2.187:
        movq      %rax, %rdi
        lea       .L_2__STRING.2(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.74:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.75:
..B2.188:
        movq      %rax, %rdi
        lea       .L_2__STRING.3(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.76:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.77:
..B2.189:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z10make_table10yesno_typePKc.78:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z10make_table10yesno_typePKc.79:
..B2.190:
        movq      %rax, %rdi
        lea       .L_2__STRING.4(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.80:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.81:
..B2.191:
        movq      %rax, %rdi
        movl      $37, %esi
..___tag_value__Z10make_table10yesno_typePKc.82:
        call      _ZNSolsEi@PLT
..___tag_value__Z10make_table10yesno_typePKc.83:
..B2.192:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z10make_table10yesno_typePKc.84:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z10make_table10yesno_typePKc.85:
..B2.193:
        int       $5
..B2.194:
        lea       .L_2__STRING.0(%rip), %rsi
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi
..___tag_value__Z10make_table10yesno_typePKc.86:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.87:
..B2.195:
        movq      %rax, %rdi
        lea       .L_2__STRING.5(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.88:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.89:
..B2.196:
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z10make_table10yesno_typePKc.90:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z10make_table10yesno_typePKc.91:
..B2.197:
        movq      %rax, %rdi
        lea       .L_2__STRING.2(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.92:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.93:
..B2.198:
        movq      %rax, %rdi
        lea       .L_2__STRING.3(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.94:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.95:
..B2.199:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z10make_table10yesno_typePKc.96:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z10make_table10yesno_typePKc.97:
..B2.200:
        movq      %rax, %rdi
        lea       .L_2__STRING.4(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.98:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.99:
        jmp       ..B2.191
..B2.204:
        lea       .L_2__STRING.0(%rip), %rsi
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi
..___tag_value__Z10make_table10yesno_typePKc.100:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.101:
..B2.205:
        movq      %rax, %rdi
        lea       .L_2__STRING.5(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.102:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.103:
..B2.206:
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z10make_table10yesno_typePKc.104:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z10make_table10yesno_typePKc.105:
..B2.207:
        movq      %rax, %rdi
        lea       .L_2__STRING.2(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.106:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.107:
..B2.208:
        movq      %rax, %rdi
        lea       .L_2__STRING.3(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.108:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.109:
..B2.209:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z10make_table10yesno_typePKc.110:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z10make_table10yesno_typePKc.111:
..B2.210:
        movq      %rax, %rdi
        lea       .L_2__STRING.4(%rip), %rsi
..___tag_value__Z10make_table10yesno_typePKc.112:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z10make_table10yesno_typePKc.113:
        jmp       ..B2.191
..B2.242:
        movq      (%r15), %r14
        jmp       ..B2.27
..B2.243:
        movq      (%r15), %r14
        jmp       ..B2.28
        .align    16,0x90
..___tag_value__Z10make_table10yesno_typePKc.114:
	.type	_Z10make_table10yesno_typePKc,@function
	.size	_Z10make_table10yesno_typePKc,.-_Z10make_table10yesno_typePKc
	.data
# -- End  _Z10make_table10yesno_typePKc
	.section .text._ZSt16__introsort_loopIPdlEvT_S1_T0_, "xaG",@progbits,_ZSt16__introsort_loopIPdlEvT_S1_T0_,comdat
..TXTST1:
# -- Begin  _ZSt16__introsort_loopIPdlEvT_S1_T0_
       .align    16,0x90
	.weak _ZSt16__introsort_loopIPdlEvT_S1_T0_
_ZSt16__introsort_loopIPdlEvT_S1_T0_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B3.1:
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.115:
        pushq     %r12
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.117:
        pushq     %r13
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.119:
        pushq     %rsi
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.121:
        movq      %rsi, %rax
        subq      %rdi, %rax
        sarq      $3, %rax
        cmpq      $16, %rax
        jle       ..B3.25
..B3.2:
        movq      %r14, (%rsp)
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.122:
        movq      %rdx, %r14
        movq      %rdi, %r13
..B3.3:
        movq      %rsi, %rax
        subq      %r13, %rax
        sarq      $3, %rax
        testq     %r14, %r14
        je        ..B3.26
..B3.4:
        movq      %rax, %rcx
        decq      %r14
        shrq      $63, %rcx
        addq      %rcx, %rax
        shrq      $1, %rax
        movsd     (%r13), %xmm2
        movsd     -8(%rsi), %xmm1
        lea       (%r13,%rax,8), %rcx
        movsd     (%rcx), %xmm0
        lea       -8(%rsi), %rax
        comisd    %xmm2, %xmm0
        jbe       ..B3.8
..B3.5:
        comisd    %xmm0, %xmm1
        ja        ..B3.7
..B3.6:
        comisd    %xmm2, %xmm1
        movq      %rax, %rcx
        movq      %r13, %r12
        ja        ..B3.11
        movq      %r13, %rcx
        jmp       ..B3.11
..B3.7:
        movq      %r13, %r12
        jmp       ..B3.11
..B3.8:
        comisd    %xmm2, %xmm1
        ja        ..B3.10
..B3.9:
        comisd    %xmm0, %xmm1
        movq      %r13, %r12
        jbe       ..B3.11
        movq      %rax, %rcx
        jmp       ..B3.11
..B3.10:
        movq      %r13, %rcx
        movq      %rcx, %r12
..B3.11:
        movq      %rsi, %rax
        movsd     (%rcx), %xmm0
        jmp       ..B3.12
..B3.21:
        movsd     %xmm2, (%r12)
        addq      $8, %r12
        movsd     %xmm1, (%rax)
..B3.12:
        movsd     (%r12), %xmm1
        comisd    %xmm1, %xmm0
        jbe       ..B3.16
..B3.14:
        addq      $8, %r12
        movsd     (%r12), %xmm1
        comisd    %xmm1, %xmm0
        ja        ..B3.14
..B3.16:
        addq      $-8, %rax
        movsd     (%rax), %xmm2
        comisd    %xmm0, %xmm2
        ja        ..B3.16
..B3.20:
        cmpq      %rax, %r12
        jb        ..B3.21
..B3.22:
        movq      %r12, %rdi
        movq      %r14, %rdx
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.123:
        call      _ZSt16__introsort_loopIPdlEvT_S1_T0_@PLT
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.124:
..B3.23:
        movq      %r12, %rsi
        subq      %r13, %r12
        sarq      $3, %r12
        cmpq      $16, %r12
        jg        ..B3.3
..B3.24:
        movq      (%rsp), %r14
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.125:
..B3.25:
        popq      %rcx
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.126:
        popq      %r13
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.128:
        popq      %r12
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.130:
        ret       
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.131:
..B3.26:
        movq      (%rsp), %r14
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.135:
        movq      %r13, %rdi
        cmpq      $2, %rax
        jge       ..B3.45
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.136:
..B3.27:
        movq      %rsi, %rdx
        subq      %rdi, %rdx
        cmpq      $1, %rax
        jle       ..B3.44
..B3.28:
        movl      $1, %r9d
..B3.29:
        addq      $-8, %rdx
        xorl      %r11d, %r11d
        movq      %rdx, %r10
        addq      $-8, %rsi
        sarq      $3, %r10
        xorl      %r8d, %r8d
        testq     %r10, %r10
        movq      (%rdi), %rax
        cmovle    %r9d, %r11d
        movsd     (%rsi), %xmm0
        movq      (%rsi), %rcx
        movq      %rax, (%rsi)
        xorl      %eax, %eax
        lea       -1(%r10,%r11), %r11
        sarq      $1, %r11
        testq     %r11, %r11
        jle       ..B3.34
..B3.31:
        lea       2(,%rax,2), %rax
        movsd     (%rdi,%rax,8), %xmm2
        movsd     -8(%rdi,%rax,8), %xmm1
        comisd    %xmm2, %xmm1
        jbe       ..B3.33
..B3.32:
        decq      %rax
        movsd     (%rdi,%rax,8), %xmm2
..B3.33:
        movsd     %xmm2, (%rdi,%r8,8)
        movq      %rax, %r8
        cmpq      %r11, %rax
        jl        ..B3.31
..B3.34:
        testq     $1, %r10
        jne       ..B3.37
..B3.35:
        movq      %r10, %r11
        addq      $-2, %r11
        movl      $0, %r11d
        cmovl     %r9d, %r11d
        lea       -2(%r10,%r11), %r11
        sarq      $1, %r11
        cmpq      %r11, %rax
        jne       ..B3.37
..B3.36:
        lea       2(,%rax,2), %r11
        movq      -8(%rdi,%r11,8), %rax
        movq      %rax, (%rdi,%r8,8)
        lea       -1(%r11), %r8
..B3.37:
        lea       -1(%r8), %rax
        shrq      $63, %rax
        lea       -1(%r8,%rax), %rax
        sarq      $1, %rax
        testq     %r8, %r8
        jle       ..B3.42
..B3.39:
        movq      (%rdi,%rax,8), %r11
        comisd    (%rdi,%rax,8), %xmm0
        jbe       ..B3.42
..B3.40:
        movq      %r11, (%rdi,%r8,8)
        lea       -1(%rax), %r11
        shrq      $63, %r11
        movq      %rax, %r8
        lea       -1(%rax,%r11), %rax
        sarq      $1, %rax
        testq     %r8, %r8
        jg        ..B3.39
..B3.42:
        .byte     144
        .byte     72
        .byte     141
        .byte     116
        .byte     38
        .byte     0
        movq      %rcx, (%rdi,%r8,8)
        cmpq      $1, %r10
        jg        ..B3.29
..B3.44:
        popq      %rcx
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.137:
        popq      %r13
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.139:
        popq      %r12
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.141:
        ret       
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.142:
..B3.45:
        movl      $1, %edx
        xorl      %ecx, %ecx
        testq     %rax, %rax
        movq      %rax, %r10
        cmovle    %edx, %ecx
        xorl      %r11d, %r11d
        addq      $-2, %r10
        lea       -2(%rax), %r9
        cmovl     %edx, %r11d
        shrq      $63, %r9
        lea       -2(%rax,%r9), %r9
        sarq      $1, %r9
        lea       -1(%rax,%rcx), %r8
        movq      %rax, %rcx
        lea       -2(%rax,%r11), %rdx
        sarq      $1, %r8
        andq      $1, %rcx
        sarq      $1, %rdx
        jmp       ..B3.46
..B3.61:
        decq      %r9
..B3.46:
        movsd     (%rdi,%r9,8), %xmm0
        movq      %r9, %r11
        movq      (%rdi,%r9,8), %r12
        movq      %r9, %r10
        cmpq      %r8, %r9
        jge       ..B3.52
..B3.48:
        lea       2(,%r10,2), %r10
        movsd     (%rdi,%r10,8), %xmm2
        movsd     -8(%rdi,%r10,8), %xmm1
        comisd    %xmm2, %xmm1
        jbe       ..B3.50
..B3.49:
        decq      %r10
        movsd     (%rdi,%r10,8), %xmm2
..B3.50:
        movsd     %xmm2, (%rdi,%r11,8)
        movq      %r10, %r11
        cmpq      %r8, %r10
        jl        ..B3.48
..B3.52:
        testq     %rcx, %rcx
        jne       ..B3.55
..B3.53:
        cmpq      %rdx, %r10
        jne       ..B3.55
..B3.54:
        lea       2(,%r10,2), %r13
        movq      -8(%rdi,%r13,8), %r10
        movq      %r10, (%rdi,%r11,8)
        lea       -1(%r13), %r11
..B3.55:
        lea       -1(%r11), %r10
        shrq      $63, %r10
        lea       -1(%r11,%r10), %r10
        sarq      $1, %r10
        cmpq      %r9, %r11
        jle       ..B3.60
..B3.57:
        movq      (%rdi,%r10,8), %r13
        comisd    (%rdi,%r10,8), %xmm0
        jbe       ..B3.60
..B3.58:
        movq      %r13, (%rdi,%r11,8)
        lea       -1(%r10), %r13
        shrq      $63, %r13
        movq      %r10, %r11
        lea       -1(%r10,%r13), %r10
        sarq      $1, %r10
        cmpq      %r9, %r11
        jg        ..B3.57
..B3.60:
        movq      %r12, (%rdi,%r11,8)
        testq     %r9, %r9
        je        ..B3.27
        jmp       ..B3.61
        .align    16,0x90
..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.145:
	.type	_ZSt16__introsort_loopIPdlEvT_S1_T0_,@function
	.size	_ZSt16__introsort_loopIPdlEvT_S1_T0_,.-_ZSt16__introsort_loopIPdlEvT_S1_T0_
	.data
# -- End  _ZSt16__introsort_loopIPdlEvT_S1_T0_
	.text
# -- Begin  _Z8time_ffti10yesno_type
..___tag_value__Z8time_ffti10yesno_type.151:
        .align    16,0x90
	.globl _Z8time_ffti10yesno_type
_Z8time_ffti10yesno_type:
# parameter 1: %edi
# parameter 2: %esi
..B4.1:
..___tag_value__Z8time_ffti10yesno_type.152:
        pushq     %r12
..___tag_value__Z8time_ffti10yesno_type.154:
        pushq     %r13
..___tag_value__Z8time_ffti10yesno_type.156:
        pushq     %r14
..___tag_value__Z8time_ffti10yesno_type.158:
        pushq     %r15
..___tag_value__Z8time_ffti10yesno_type.160:
        pushq     %rbx
..___tag_value__Z8time_ffti10yesno_type.162:
        pushq     %rbp
..___tag_value__Z8time_ffti10yesno_type.164:
        subq      $88, %rsp
..___tag_value__Z8time_ffti10yesno_type.166:
        movl      %edi, %r14d
        movslq    %r14d, %r14
        movl      %esi, %r15d
        movq      %r14, (%rsp)
        movl      %r14d, %edx
        xorl      %r13d, %r13d
        cmpq      $1, %r14
        jle       ..B4.5
..___tag_value__Z8time_ffti10yesno_type.167:
..B4.3:
        movl      %edx, %eax
        andl      $-2147483647, %eax
        jge       ..B4.220
..___tag_value__Z8time_ffti10yesno_type.168:
..B4.221:
        subl      $1, %eax
        orl       $-2, %eax
        incl      %eax
..___tag_value__Z8time_ffti10yesno_type.169:
..B4.220:
        cmpl      $1, %eax
        cmove     %eax, %r13d
        movl      %edx, %eax
        shrl      $31, %eax
        addl      %eax, %edx
        sarl      $1, %edx
        cmpl      $1, %edx
        jg        ..B4.3
..___tag_value__Z8time_ffti10yesno_type.170:
..B4.5:
        movq      $0x2540be400, %rdi
        movl      $64, %esi
        call      _mm_malloc@PLT
..___tag_value__Z8time_ffti10yesno_type.171:
..B4.222:
        movq      %rax, %r12
..___tag_value__Z8time_ffti10yesno_type.172:
..B4.6:
        movq      (%rsp), %rcx
        movq      $0x2540be400, %rax
        shlq      $4, %rcx
        xorl      %edx, %edx
        divq      %rcx
        movq      stat_mkl(%rip), %rbx
        testq     %rbx, %rbx
        movq      %rcx, 64(%rsp)
        movq      %rax, 72(%rsp)
        je        ..B4.10
..___tag_value__Z8time_ffti10yesno_type.173:
..B4.7:
        movq      (%rbx), %rdi
        testq     %rdi, %rdi
        je        ..B4.9
..___tag_value__Z8time_ffti10yesno_type.174:
..B4.8:
        call      _ZdaPv@PLT
..___tag_value__Z8time_ffti10yesno_type.175:
..B4.9:
        movq      %rbx, %rdi
        call      _ZdlPv@PLT
..___tag_value__Z8time_ffti10yesno_type.176:
..B4.10:
        movl      $24, %edi
        movl      $0, 16(%rsp)
..___tag_value__Z8time_ffti10yesno_type.177:
        call      _Znwm@PLT
..___tag_value__Z8time_ffti10yesno_type.179:
..B4.219:
        movq      %rax, %rbx
..___tag_value__Z8time_ffti10yesno_type.181:
..B4.11:
        movq      %rbx, 8(%rsp)
        testq     %rbx, %rbx
        je        ..B4.14
..___tag_value__Z8time_ffti10yesno_type.182:
..B4.12:
        movq      72(%rsp), %rax
        movslq    %eax, %rdi
        shlq      $3, %rdi
        movl      $1, 16(%rsp)
        movl      %eax, 8(%rbx)
..___tag_value__Z8time_ffti10yesno_type.183:
        call      _Znam@PLT
..___tag_value__Z8time_ffti10yesno_type.185:
..B4.13:
        movq      %rax, (%rbx)
        xorl      %eax, %eax
        movl      %eax, 16(%rbx)
        movl      %eax, 16(%rsp)
        movl      $-1, 12(%rbx)
        movq      8(%rsp), %rax
        jmp       ..B4.15
..___tag_value__Z8time_ffti10yesno_type.187:
..B4.14:
        xorl      %eax, %eax
..___tag_value__Z8time_ffti10yesno_type.188:
..B4.15:
        movq      stat_fftw(%rip), %rbx
        testq     %rbx, %rbx
        movq      %rax, stat_mkl(%rip)
        je        ..B4.19
..___tag_value__Z8time_ffti10yesno_type.189:
..B4.16:
        movq      (%rbx), %rdi
        testq     %rdi, %rdi
        je        ..B4.18
..___tag_value__Z8time_ffti10yesno_type.190:
..B4.17:
        call      _ZdaPv@PLT
..___tag_value__Z8time_ffti10yesno_type.191:
..B4.18:
        movq      %rbx, %rdi
        call      _ZdlPv@PLT
..___tag_value__Z8time_ffti10yesno_type.192:
..B4.19:
        movl      $24, %edi
        movl      $0, 16(%rsp)
..___tag_value__Z8time_ffti10yesno_type.193:
        call      _Znwm@PLT
..___tag_value__Z8time_ffti10yesno_type.195:
..B4.217:
        movq      %rax, %rbx
..___tag_value__Z8time_ffti10yesno_type.197:
..B4.20:
        movq      %rbx, 8(%rsp)
        testq     %rbx, %rbx
        je        ..B4.23
..___tag_value__Z8time_ffti10yesno_type.198:
..B4.21:
        movq      72(%rsp), %rax
        movslq    %eax, %rdi
        shlq      $3, %rdi
        movl      $1, 16(%rsp)
        movl      %eax, 8(%rbx)
..___tag_value__Z8time_ffti10yesno_type.199:
        call      _Znam@PLT
..___tag_value__Z8time_ffti10yesno_type.201:
..B4.22:
        movq      %rax, (%rbx)
        xorl      %eax, %eax
        movl      %eax, 16(%rbx)
        movl      %eax, 16(%rsp)
        movl      $-1, 12(%rbx)
        movq      8(%rsp), %rax
        jmp       ..B4.24
..___tag_value__Z8time_ffti10yesno_type.203:
..B4.23:
        xorl      %eax, %eax
..___tag_value__Z8time_ffti10yesno_type.204:
..B4.24:
        movq      stat_nr(%rip), %rbx
        testq     %rbx, %rbx
        movq      %rax, stat_fftw(%rip)
        je        ..B4.28
..___tag_value__Z8time_ffti10yesno_type.205:
..B4.25:
        movq      (%rbx), %rdi
        testq     %rdi, %rdi
        je        ..B4.27
..___tag_value__Z8time_ffti10yesno_type.206:
..B4.26:
        call      _ZdaPv@PLT
..___tag_value__Z8time_ffti10yesno_type.207:
..B4.27:
        movq      %rbx, %rdi
        call      _ZdlPv@PLT
..___tag_value__Z8time_ffti10yesno_type.208:
..B4.28:
        movl      $24, %edi
        movl      $0, 16(%rsp)
..___tag_value__Z8time_ffti10yesno_type.209:
        call      _Znwm@PLT
..___tag_value__Z8time_ffti10yesno_type.211:
..B4.215:
        movq      %rax, %rbx
..___tag_value__Z8time_ffti10yesno_type.213:
..B4.29:
        movq      %rbx, 8(%rsp)
        testq     %rbx, %rbx
        je        ..B4.32
..___tag_value__Z8time_ffti10yesno_type.214:
..B4.30:
        movq      72(%rsp), %rax
        movslq    %eax, %rdi
        shlq      $3, %rdi
        movl      $1, 16(%rsp)
        movl      %eax, 8(%rbx)
..___tag_value__Z8time_ffti10yesno_type.215:
        call      _Znam@PLT
..___tag_value__Z8time_ffti10yesno_type.217:
..B4.31:
        movq      %rax, (%rbx)
        xorl      %eax, %eax
        movl      %eax, 16(%rbx)
        movl      %eax, 16(%rsp)
        movl      $-1, 12(%rbx)
        movq      8(%rsp), %rax
        jmp       ..B4.33
..___tag_value__Z8time_ffti10yesno_type.219:
..B4.32:
        xorl      %eax, %eax
..___tag_value__Z8time_ffti10yesno_type.220:
..B4.33:
        movq      %rax, stat_nr(%rip)
        testl     %r15d, %r15d
        jne       ..B4.40
..___tag_value__Z8time_ffti10yesno_type.221:
..B4.34:
        movq      72(%rsp), %rax
        xorl      %ebx, %ebx
        movq      %r12, %rcx
        testq     %rax, %rax
        jle       ..B4.44
..___tag_value__Z8time_ffti10yesno_type.222:
..B4.35:
        movq      (%rsp), %rax
        testq     %rax, %rax
        jle       ..B4.44
..___tag_value__Z8time_ffti10yesno_type.223:
..B4.36:
        pushq     $2
        popq      %rax
        movq      $0x100000000, %rbp
        movl      %r14d, %edx
        movaps    .L_2il0floatpacket.662(%rip), %xmm7
        andl      $-8, %edx
        movsd     .L_2il0floatpacket.663(%rip), %xmm6
        movd      %eax, %xmm0
        movd      %rbp, %xmm8
        pshufd    $0, %xmm0, %xmm9
        movaps    .L_2il0floatpacket.664(%rip), %xmm5
        movsd     .L_2il0floatpacket.665(%rip), %xmm4
        movsd     .L_2il0floatpacket.666(%rip), %xmm3
..___tag_value__Z8time_ffti10yesno_type.224:
..B4.37:
        cmpl      $8, %r14d
        jl        ..B4.143
..___tag_value__Z8time_ffti10yesno_type.225:
..B4.38:
        movq      %rbx, %rsi
        xorl      %ebp, %ebp
        imulq     %rbx, %rsi
        cvtsi2sdq %rbx, %xmm1
        cvtsi2sdq %rsi, %xmm0
        addsd     %xmm6, %xmm1
        addsd     %xmm6, %xmm0
        unpcklpd  %xmm1, %xmm1
        movdqa    %xmm8, %xmm2
        unpcklpd  %xmm0, %xmm0
        movl      %edx, %eax
..___tag_value__Z8time_ffti10yesno_type.226:
..B4.39:
        cvtdq2pd  %xmm2, %xmm11
        movaps    %xmm1, %xmm10
        movaps    %xmm7, %xmm12
        addpd     %xmm11, %xmm10
        addpd     %xmm0, %xmm11
        divpd     %xmm10, %xmm12
        paddd     %xmm9, %xmm2
        movaps    %xmm5, %xmm13
        cvtdq2pd  %xmm2, %xmm10
        divpd     %xmm11, %xmm13
        movaps    %xmm1, %xmm15
        lea       (%rbp,%rbp), %esi
        addpd     %xmm10, %xmm15
        addpd     %xmm0, %xmm10
        movslq    %esi, %rsi
        movaps    %xmm7, %xmm11
        divpd     %xmm15, %xmm11
        movsd     %xmm12, (%rcx,%rsi,8)
        movaps    %xmm12, %xmm14
        movaps    %xmm5, %xmm12
        paddd     %xmm9, %xmm2
        divpd     %xmm10, %xmm12
        cvtdq2pd  %xmm2, %xmm10
        unpckhpd  %xmm13, %xmm14
        paddd     %xmm9, %xmm2
        movsd     %xmm14, 16(%rcx,%rsi,8)
        movaps    %xmm1, %xmm15
        movhpd    %xmm14, 24(%rcx,%rsi,8)
        movaps    %xmm1, %xmm14
        addpd     %xmm10, %xmm14
        addpd     %xmm0, %xmm10
        movsd     %xmm13, 8(%rcx,%rsi,8)
        movaps    %xmm11, %xmm13
        movsd     %xmm11, 32(%rcx,%rsi,8)
        movaps    %xmm7, %xmm11
        unpckhpd  %xmm12, %xmm13
        addl      $8, %ebp
        movsd     %xmm12, 40(%rcx,%rsi,8)
        movaps    %xmm5, %xmm12
        divpd     %xmm14, %xmm11
        divpd     %xmm10, %xmm12
        cvtdq2pd  %xmm2, %xmm10
        addpd     %xmm10, %xmm15
        addpd     %xmm0, %xmm10
        movsd     %xmm13, 48(%rcx,%rsi,8)
        paddd     %xmm9, %xmm2
        movhpd    %xmm13, 56(%rcx,%rsi,8)
        movaps    %xmm11, %xmm13
        movsd     %xmm11, 64(%rcx,%rsi,8)
        movaps    %xmm7, %xmm11
        unpckhpd  %xmm12, %xmm13
        cmpl      %edx, %ebp
        movsd     %xmm12, 72(%rcx,%rsi,8)
        movaps    %xmm5, %xmm12
        divpd     %xmm15, %xmm11
        divpd     %xmm10, %xmm12
        movsd     %xmm13, 80(%rcx,%rsi,8)
        movhpd    %xmm13, 88(%rcx,%rsi,8)
        movaps    %xmm11, %xmm13
        unpckhpd  %xmm12, %xmm13
        movsd     %xmm11, 96(%rcx,%rsi,8)
        movsd     %xmm12, 104(%rcx,%rsi,8)
        movsd     %xmm13, 112(%rcx,%rsi,8)
        movhpd    %xmm13, 120(%rcx,%rsi,8)
        jb        ..B4.39
        jmp       ..B4.138
..___tag_value__Z8time_ffti10yesno_type.227:
..B4.40:
        movq      (%rsp), %rax
        testq     %rax, %rax
        jle       ..B4.44
..___tag_value__Z8time_ffti10yesno_type.228:
..B4.41:
        cmpl      $8, %r14d
        jl        ..B4.151
..___tag_value__Z8time_ffti10yesno_type.229:
..B4.42:
        movl      %r14d, %ecx
        xorl      %eax, %eax
        andl      $-8, %ecx
        pxor      %xmm0, %xmm0
..___tag_value__Z8time_ffti10yesno_type.230:
..B4.43:
        lea       (%rax,%rax), %edx
        addl      $8, %eax
        movslq    %edx, %rdx
        cmpl      %ecx, %eax
        movaps    %xmm0, (%r12,%rdx,8)
        movaps    %xmm0, 16(%r12,%rdx,8)
        movaps    %xmm0, 32(%r12,%rdx,8)
        movaps    %xmm0, 48(%r12,%rdx,8)
        movaps    %xmm0, 64(%r12,%rdx,8)
        movaps    %xmm0, 80(%r12,%rdx,8)
        movaps    %xmm0, 96(%r12,%rdx,8)
        movaps    %xmm0, 112(%r12,%rdx,8)
        jb        ..B4.43
        jmp       ..B4.147
..___tag_value__Z8time_ffti10yesno_type.231:
..B4.44:
        movl      %r14d, %esi
        lea       48(%rsp), %rdi
..___tag_value__Z8time_ffti10yesno_type.232:
        call      _ZN7fft_mklC1Ei@PLT
..___tag_value__Z8time_ffti10yesno_type.234:
..B4.45:
        xorl      %ebp, %ebp
        movq      72(%rsp), %rax
        xorl      %ebx, %ebx
        testq     %rax, %rax
        jle       ..B4.51
..___tag_value__Z8time_ffti10yesno_type.236:
..B4.47:
        testl     %r15d, %r15d
        lea       (%r12,%rbx), %rsi
        cmovne    %r12, %rsi
        rdtsc     
        movl      %eax, 32(%rsp)
        xorl      %eax, %eax
        movq      56(%rsp), %rdi
        movl      %edx, 36(%rsp)
..___tag_value__Z8time_ffti10yesno_type.237:
        call      DftiComputeForward@PLT
..___tag_value__Z8time_ffti10yesno_type.239:
..B4.48:
        rdtsc     
        movq      stat_mkl(%rip), %rsi
        movl      32(%rsp), %r8d
        movl      36(%rsp), %r9d
        movslq    16(%rsi), %rcx
        movslq    8(%rsi), %rdi
        cmpq      %rdi, %rcx
        jge       ..B4.156
..___tag_value__Z8time_ffti10yesno_type.241:
..B4.49:
        subl      %r9d, %edx
        incq      %rbp
        movl      %eax, %eax
        cvtsi2sdq %rax, %xmm2
        cvtsi2sdq %r8, %xmm0
        cvtsi2sdq %rdx, %xmm1
        subsd     %xmm0, %xmm2
        mulsd     .L_2il0floatpacket.667(%rip), %xmm1
        movq      (%rsi), %rdi
        addsd     %xmm1, %xmm2
        movsd     %xmm2, (%rdi,%rcx,8)
        incl      16(%rsi)
        addq      64(%rsp), %rbx
        movl      $-1, 12(%rsi)
        cmpq      72(%rsp), %rbp
        jl        ..B4.47
..___tag_value__Z8time_ffti10yesno_type.242:
..B4.51:
        movl      %r14d, %esi
        lea       8(%rsp), %rdi
..___tag_value__Z8time_ffti10yesno_type.243:
        call      _ZN8fft_fftwC1Ei@PLT
..___tag_value__Z8time_ffti10yesno_type.245:
..B4.52:
        xorl      %r14d, %r14d
        movq      72(%rsp), %rax
        xorl      %ebp, %ebp
        testq     %rax, %rax
        jle       ..B4.63
..___tag_value__Z8time_ffti10yesno_type.247:
..B4.54:
        testl     %r15d, %r15d
        lea       (%r12,%rbp), %rbx
        cmovne    %r12, %rbx
        movq      %rbx, %rcx
        sarq      $3, %rcx
        shrq      $60, %rcx
        addq      %rbx, %rcx
        andq      $-16, %rcx
        rdtsc     
        movl      %edx, 36(%rsp)
        cmpq      %rbx, %rcx
        movl      %eax, 32(%rsp)
        jne       ..B4.119
..___tag_value__Z8time_ffti10yesno_type.248:
..B4.55:
        movq      %rbx, %rsi
        movq      %rbx, %rdx
        movq      16(%rsp), %rdi
..___tag_value__Z8time_ffti10yesno_type.249:
        call      fftw_execute_dft@PLT
..___tag_value__Z8time_ffti10yesno_type.251:
..B4.56:
        movl      8(%rsp), %esi
        lea       (%rsi,%rsi), %eax
        testl     %eax, %eax
        jle       ..B4.60
..___tag_value__Z8time_ffti10yesno_type.253:
..B4.57:
        movslq    %esi, %rcx
        addq      %rcx, %rcx
        cmpq      $8, %rcx
        jl        ..B4.103
..___tag_value__Z8time_ffti10yesno_type.254:
..B4.58:
        cvtsi2sd  %esi, %xmm0
        movl      %ecx, %eax
        xorl      %edx, %edx
        andl      $-8, %eax
        movslq    %eax, %rax
        unpcklpd  %xmm0, %xmm0
..___tag_value__Z8time_ffti10yesno_type.255:
..B4.59:
        movaps    (%rbx,%rdx,8), %xmm1
        movaps    16(%rbx,%rdx,8), %xmm2
        movaps    32(%rbx,%rdx,8), %xmm3
        movaps    48(%rbx,%rdx,8), %xmm4
        divpd     %xmm0, %xmm1
        divpd     %xmm0, %xmm2
        divpd     %xmm0, %xmm3
        divpd     %xmm0, %xmm4
        movaps    %xmm1, (%rbx,%rdx,8)
        movaps    %xmm2, 16(%rbx,%rdx,8)
        movaps    %xmm3, 32(%rbx,%rdx,8)
        movaps    %xmm4, 48(%rbx,%rdx,8)
        addq      $8, %rdx
        cmpq      %rax, %rdx
        jb        ..B4.59
        jmp       ..B4.104
..___tag_value__Z8time_ffti10yesno_type.256:
..B4.60:
        rdtsc     
        movq      stat_fftw(%rip), %r8
        movl      32(%rsp), %ebx
        movl      36(%rsp), %esi
        movslq    16(%r8), %rdi
        movslq    8(%r8), %rcx
        cmpq      %rcx, %rdi
        jge       ..B4.109
..___tag_value__Z8time_ffti10yesno_type.257:
..B4.61:
        subl      %esi, %edx
        incq      %r14
        movl      %eax, %eax
        cvtsi2sdq %rax, %xmm2
        cvtsi2sdq %rbx, %xmm0
        cvtsi2sdq %rdx, %xmm1
        subsd     %xmm0, %xmm2
        mulsd     .L_2il0floatpacket.667(%rip), %xmm1
        movq      (%r8), %rcx
        addsd     %xmm1, %xmm2
        movsd     %xmm2, (%rcx,%rdi,8)
        incl      16(%r8)
        addq      64(%rsp), %rbp
        movl      $-1, 12(%r8)
        cmpq      72(%rsp), %r14
        jl        ..B4.54
..___tag_value__Z8time_ffti10yesno_type.258:
..B4.63:
        cmpl      $1, %r13d
        jne       ..B4.66
..___tag_value__Z8time_ffti10yesno_type.259:
..B4.64:
        movq      stat_nr(%rip), %rcx
        movslq    16(%rcx), %rdx
        movslq    8(%rcx), %rax
        cmpq      %rax, %rdx
        jge       ..B4.76
..___tag_value__Z8time_ffti10yesno_type.260:
..B4.65:
        movq      (%rcx), %rax
        movq      $0, (%rax,%rdx,8)
        incl      16(%rcx)
        movl      $-1, 12(%rcx)
        jmp       ..B4.72
..___tag_value__Z8time_ffti10yesno_type.261:
..B4.66:
        testl     %r13d, %r13d
        jne       ..B4.72
..___tag_value__Z8time_ffti10yesno_type.262:
..B4.67:
        xorl      %ebp, %ebp
        movq      72(%rsp), %rax
        xorl      %ebx, %ebx
        testq     %rax, %rax
        jle       ..B4.72
..___tag_value__Z8time_ffti10yesno_type.263:
..B4.69:
        testl     %r15d, %r15d
        lea       (%r12,%rbx), %rdi
        cmovne    %r12, %rdi
        rdtsc     
        movq      (%rsp), %rsi
        movl      %edx, 36(%rsp)
        movl      %eax, 32(%rsp)
..___tag_value__Z8time_ffti10yesno_type.264:
        call      _Z5nrfwdPdm@PLT
..___tag_value__Z8time_ffti10yesno_type.266:
..B4.70:
        rdtsc     
        movq      stat_nr(%rip), %r9
        movl      32(%rsp), %esi
        movl      36(%rsp), %edi
        movslq    16(%r9), %r8
        movslq    8(%r9), %rcx
        cmpq      %rcx, %r8
        jge       ..B4.92
..___tag_value__Z8time_ffti10yesno_type.268:
..B4.71:
        subl      %edi, %edx
        incq      %rbp
        movl      %eax, %eax
        cvtsi2sdq %rax, %xmm2
        cvtsi2sdq %rsi, %xmm0
        cvtsi2sdq %rdx, %xmm1
        subsd     %xmm0, %xmm2
        mulsd     .L_2il0floatpacket.667(%rip), %xmm1
        movq      (%r9), %rcx
        addsd     %xmm1, %xmm2
        movsd     %xmm2, (%rcx,%r8,8)
        incl      16(%r9)
        addq      64(%rsp), %rbx
        movl      $-1, 12(%r9)
        cmpq      72(%rsp), %rbp
        jl        ..B4.69
..___tag_value__Z8time_ffti10yesno_type.269:
..B4.72:
        movq      %r12, %rdi
        call      _mm_free@PLT
..___tag_value__Z8time_ffti10yesno_type.270:
..B4.73:
        lea       8(%rsp), %rdi
..___tag_value__Z8time_ffti10yesno_type.271:
        call      _ZN8fft_fftwD1Ev@PLT
..___tag_value__Z8time_ffti10yesno_type.273:
..B4.74:
        lea       48(%rsp), %rdi
..___tag_value__Z8time_ffti10yesno_type.275:
        call      _ZN7fft_mklD1Ev@PLT
..___tag_value__Z8time_ffti10yesno_type.277:
..B4.75:
        addq      $88, %rsp
..___tag_value__Z8time_ffti10yesno_type.279:
        popq      %rbp
..___tag_value__Z8time_ffti10yesno_type.282:
        popq      %rbx
..___tag_value__Z8time_ffti10yesno_type.284:
        popq      %r15
..___tag_value__Z8time_ffti10yesno_type.286:
        popq      %r14
..___tag_value__Z8time_ffti10yesno_type.288:
        popq      %r13
..___tag_value__Z8time_ffti10yesno_type.290:
        popq      %r12
..___tag_value__Z8time_ffti10yesno_type.292:
        ret       
..___tag_value__Z8time_ffti10yesno_type.293:
..B4.76:
        lea       .L_2__STRING.0(%rip), %rsi
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi
..___tag_value__Z8time_ffti10yesno_type.301:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.303:
..B4.77:
        movq      %rax, %rdi
        lea       .L_2__STRING.1(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.305:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.307:
..B4.78:
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.309:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.311:
..B4.79:
        movq      %rax, %rdi
        lea       .L_2__STRING.2(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.313:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.315:
..B4.80:
        movq      %rax, %rdi
        lea       .L_2__STRING.3(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.317:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.319:
..B4.81:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.321:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.323:
..B4.82:
        movq      %rax, %rdi
        lea       .L_2__STRING.4(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.325:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.327:
..B4.83:
        movq      %rax, %rdi
        movl      $31, %esi
..___tag_value__Z8time_ffti10yesno_type.329:
        call      _ZNSolsEi@PLT
..___tag_value__Z8time_ffti10yesno_type.331:
..B4.84:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.333:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.335:
..B4.85:
        int       $5
..___tag_value__Z8time_ffti10yesno_type.337:
..___tag_value__Z8time_ffti10yesno_type.150:
..B4.86:
        movq      %rax, (%rsp)
..___tag_value__Z8time_ffti10yesno_type.338:
..B4.87:
        lea       8(%rsp), %rdi
..___tag_value__Z8time_ffti10yesno_type.339:
        call      _ZN8fft_fftwD1Ev@PLT
..___tag_value__Z8time_ffti10yesno_type.341:
..B4.89:
        lea       48(%rsp), %rdi
..___tag_value__Z8time_ffti10yesno_type.343:
        call      _ZN7fft_mklD1Ev@PLT
..___tag_value__Z8time_ffti10yesno_type.345:
..B4.90:
        xorl      %eax, %eax
        movq      (%rsp), %rdi
..___tag_value__Z8time_ffti10yesno_type.347:
        call      _Unwind_Resume@PLT
..___tag_value__Z8time_ffti10yesno_type.349:
..B4.92:
        lea       .L_2__STRING.0(%rip), %rsi
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi
..___tag_value__Z8time_ffti10yesno_type.351:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.353:
..B4.93:
        movq      %rax, %rdi
        lea       .L_2__STRING.1(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.355:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.357:
..B4.94:
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.359:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.361:
..B4.95:
        movq      %rax, %rdi
        lea       .L_2__STRING.2(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.363:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.365:
..B4.96:
        movq      %rax, %rdi
        lea       .L_2__STRING.3(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.367:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.369:
..B4.97:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.371:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.373:
..B4.98:
        movq      %rax, %rdi
        lea       .L_2__STRING.4(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.375:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.377:
..B4.99:
        movq      %rax, %rdi
        movl      $31, %esi
..___tag_value__Z8time_ffti10yesno_type.379:
        call      _ZNSolsEi@PLT
..___tag_value__Z8time_ffti10yesno_type.381:
..B4.100:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.383:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.385:
        jmp       ..B4.85
..___tag_value__Z8time_ffti10yesno_type.386:
..___tag_value__Z8time_ffti10yesno_type.149:
..B4.102:
        movq      %rax, (%rsp)
        jmp       ..B4.89
..___tag_value__Z8time_ffti10yesno_type.387:
..B4.103:
        xorl      %eax, %eax
..___tag_value__Z8time_ffti10yesno_type.388:
..B4.104:
        cmpq      %rcx, %rax
        lea       (%rbx,%rax,8), %rdx
        jae       ..B4.60
..___tag_value__Z8time_ffti10yesno_type.389:
..B4.105:
        cvtsi2sd  %esi, %xmm1
..___tag_value__Z8time_ffti10yesno_type.390:
..B4.106:
        movsd     (%rdx), %xmm0
        incq      %rax
        divsd     %xmm1, %xmm0
        movsd     %xmm0, (%rdx)
        addq      $8, %rdx
        cmpq      %rcx, %rax
        jb        ..B4.106
        jmp       ..B4.60
..___tag_value__Z8time_ffti10yesno_type.391:
..B4.109:
        lea       .L_2__STRING.0(%rip), %rsi
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi
..___tag_value__Z8time_ffti10yesno_type.392:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.394:
..B4.110:
        movq      %rax, %rdi
        lea       .L_2__STRING.1(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.396:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.398:
..B4.111:
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.400:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.402:
..B4.112:
        movq      %rax, %rdi
        lea       .L_2__STRING.2(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.404:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.406:
..B4.113:
        movq      %rax, %rdi
        lea       .L_2__STRING.3(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.408:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.410:
..B4.114:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.412:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.414:
..B4.115:
        movq      %rax, %rdi
        lea       .L_2__STRING.4(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.416:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.418:
..B4.116:
        movq      %rax, %rdi
        movl      $31, %esi
..___tag_value__Z8time_ffti10yesno_type.420:
        call      _ZNSolsEi@PLT
..___tag_value__Z8time_ffti10yesno_type.422:
..B4.117:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.424:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.426:
        jmp       ..B4.85
..___tag_value__Z8time_ffti10yesno_type.427:
..B4.119:
        lea       .L_2__STRING.0(%rip), %rsi
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi
..___tag_value__Z8time_ffti10yesno_type.428:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.430:
..B4.120:
        movq      %rax, %rdi
        lea       .L_2__STRING.11(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.432:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.434:
..B4.121:
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.436:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.438:
..B4.122:
        movq      %rax, %rdi
        lea       .L_2__STRING.2(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.440:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.442:
..B4.123:
        movq      %rax, %rdi
        lea       .L_2__STRING.12(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.444:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.446:
..B4.124:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.448:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.450:
..B4.125:
        movq      %rax, %rdi
        lea       .L_2__STRING.4(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.452:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.454:
..B4.126:
        movq      %rax, %rdi
        movl      $20, %esi
..___tag_value__Z8time_ffti10yesno_type.456:
        call      _ZNSolsEi@PLT
..___tag_value__Z8time_ffti10yesno_type.458:
..B4.127:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.460:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.462:
        jmp       ..B4.85
..___tag_value__Z8time_ffti10yesno_type.463:
..___tag_value__Z8time_ffti10yesno_type.147:
..B4.129:
        movq      %rax, (%rsp)
..___tag_value__Z8time_ffti10yesno_type.464:
..B4.130:
        cmpl      $0, 16(%rsp)
        je        ..B4.90
..___tag_value__Z8time_ffti10yesno_type.465:
..B4.131:
        movq      8(%rsp), %rdi
        call      _ZdlPv@PLT
        jmp       ..B4.90
..___tag_value__Z8time_ffti10yesno_type.466:
..___tag_value__Z8time_ffti10yesno_type.148:
..B4.133:
        movq      %rax, (%rsp)
..___tag_value__Z8time_ffti10yesno_type.467:
..B4.134:
        cmpl      $0, 16(%rsp)
        je        ..B4.90
..___tag_value__Z8time_ffti10yesno_type.468:
..B4.135:
        movq      8(%rsp), %rdi
        call      _ZdlPv@PLT
        jmp       ..B4.90
..___tag_value__Z8time_ffti10yesno_type.469:
..B4.138:
        cmpl      %r14d, %eax
        jae       ..B4.141
..___tag_value__Z8time_ffti10yesno_type.470:
..B4.139:
        movq      %rbx, %rbp
        imulq     %rbx, %rbp
        cvtsi2sdq %rbx, %xmm12
        cvtsi2sdq %rbp, %xmm11
        addsd     %xmm6, %xmm12
        addsd     %xmm6, %xmm11
..___tag_value__Z8time_ffti10yesno_type.471:
..B4.140:
        cvtsi2sd  %eax, %xmm2
        movaps    %xmm12, %xmm0
        movaps    %xmm4, %xmm1
        movaps    %xmm3, %xmm10
        lea       (%rax,%rax), %ebp
        movslq    %ebp, %rbp
        incl      %eax
        cmpl      %r14d, %eax
        addsd     %xmm2, %xmm0
        addsd     %xmm11, %xmm2
        divsd     %xmm0, %xmm1
        divsd     %xmm2, %xmm10
        movsd     %xmm1, (%rcx,%rbp,8)
        movsd     %xmm10, 8(%rcx,%rbp,8)
        jb        ..B4.140
..___tag_value__Z8time_ffti10yesno_type.472:
..B4.141:
        incq      %rbx
        addq      64(%rsp), %rcx
        cmpq      72(%rsp), %rbx
        jb        ..B4.37
        jmp       ..B4.44
..___tag_value__Z8time_ffti10yesno_type.473:
..B4.143:
        xorl      %eax, %eax
        jmp       ..B4.138
..___tag_value__Z8time_ffti10yesno_type.474:
..B4.147:
        cmpl      %r14d, %ecx
        jae       ..B4.44
..___tag_value__Z8time_ffti10yesno_type.475:
..B4.148:
        xorl      %edx, %edx
..___tag_value__Z8time_ffti10yesno_type.476:
..B4.149:
        lea       (%rcx,%rcx), %eax
        incl      %ecx
        movslq    %eax, %rax
        cmpl      %r14d, %ecx
        movq      %rdx, 8(%r12,%rax,8)
        movq      %rdx, (%r12,%rax,8)
        jb        ..B4.149
        jmp       ..B4.44
..___tag_value__Z8time_ffti10yesno_type.477:
..B4.151:
        xorl      %ecx, %ecx
        jmp       ..B4.147
..___tag_value__Z8time_ffti10yesno_type.478:
..___tag_value__Z8time_ffti10yesno_type.146:
..B4.152:
        movq      %rax, (%rsp)
..___tag_value__Z8time_ffti10yesno_type.479:
..B4.153:
        cmpl      $0, 16(%rsp)
        je        ..B4.90
..___tag_value__Z8time_ffti10yesno_type.480:
..B4.154:
        movq      8(%rsp), %rdi
        call      _ZdlPv@PLT
        jmp       ..B4.90
..___tag_value__Z8time_ffti10yesno_type.481:
..B4.156:
        lea       .L_2__STRING.0(%rip), %rsi
        movq      _ZSt4cout@GOTPCREL(%rip), %rdi
..___tag_value__Z8time_ffti10yesno_type.482:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.484:
..B4.157:
        movq      %rax, %rdi
        lea       .L_2__STRING.1(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.486:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.488:
..B4.158:
        movq      _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rbx
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.490:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.492:
..B4.159:
        movq      %rax, %rdi
        lea       .L_2__STRING.2(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.494:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.496:
..B4.160:
        movq      %rax, %rdi
        lea       .L_2__STRING.3(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.498:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.500:
..B4.161:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.502:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.504:
..B4.162:
        movq      %rax, %rdi
        lea       .L_2__STRING.4(%rip), %rsi
..___tag_value__Z8time_ffti10yesno_type.506:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
..___tag_value__Z8time_ffti10yesno_type.508:
..B4.163:
        movq      %rax, %rdi
        movl      $31, %esi
..___tag_value__Z8time_ffti10yesno_type.510:
        call      _ZNSolsEi@PLT
..___tag_value__Z8time_ffti10yesno_type.512:
..B4.164:
        movq      %rax, %rdi
        movq      %rbx, %rsi
..___tag_value__Z8time_ffti10yesno_type.514:
        call      _ZNSolsEPFRSoS_E@PLT
..___tag_value__Z8time_ffti10yesno_type.516:
..B4.165:
        int       $5
        .align    16,0x90
..___tag_value__Z8time_ffti10yesno_type.518:
	.type	_Z8time_ffti10yesno_type,@function
	.size	_Z8time_ffti10yesno_type,.-_Z8time_ffti10yesno_type
	.section .gcc_except_table, "a"
	.align 4
_Z8time_ffti10yesno_type$$LSDA:
	.byte	255
	.byte	155
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.522 - ..___tag_value__Z8time_ffti10yesno_type.521
..___tag_value__Z8time_ffti10yesno_type.521:
	.byte	1
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.520 - ..___tag_value__Z8time_ffti10yesno_type.519
..___tag_value__Z8time_ffti10yesno_type.519:
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.177 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.185 - ..___tag_value__Z8time_ffti10yesno_type.177
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.146 - ..___tag_value__Z8time_ffti10yesno_type.152
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.193 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.201 - ..___tag_value__Z8time_ffti10yesno_type.193
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.147 - ..___tag_value__Z8time_ffti10yesno_type.152
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.209 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.217 - ..___tag_value__Z8time_ffti10yesno_type.209
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.148 - ..___tag_value__Z8time_ffti10yesno_type.152
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.232 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.234 - ..___tag_value__Z8time_ffti10yesno_type.232
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.237 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.245 - ..___tag_value__Z8time_ffti10yesno_type.237
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.149 - ..___tag_value__Z8time_ffti10yesno_type.152
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.249 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.266 - ..___tag_value__Z8time_ffti10yesno_type.249
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.150 - ..___tag_value__Z8time_ffti10yesno_type.152
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.271 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.273 - ..___tag_value__Z8time_ffti10yesno_type.271
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.149 - ..___tag_value__Z8time_ffti10yesno_type.152
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.275 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.277 - ..___tag_value__Z8time_ffti10yesno_type.275
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.301 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.335 - ..___tag_value__Z8time_ffti10yesno_type.301
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.150 - ..___tag_value__Z8time_ffti10yesno_type.152
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.347 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.349 - ..___tag_value__Z8time_ffti10yesno_type.347
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.351 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.462 - ..___tag_value__Z8time_ffti10yesno_type.351
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.150 - ..___tag_value__Z8time_ffti10yesno_type.152
	.byte	0
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.482 - ..___tag_value__Z8time_ffti10yesno_type.152
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.516 - ..___tag_value__Z8time_ffti10yesno_type.482
	.uleb128	..___tag_value__Z8time_ffti10yesno_type.149 - ..___tag_value__Z8time_ffti10yesno_type.152
	.byte	0
..___tag_value__Z8time_ffti10yesno_type.520:
	.long	0
..___tag_value__Z8time_ffti10yesno_type.522:
	.data
# -- End  _Z8time_ffti10yesno_type
	.text
# -- Begin  __sti__$E
       .align    16,0x90
__sti__$E:
..B5.1:
..___tag_value___sti__$E.523:
        pushq     %rsi
..___tag_value___sti__$E.525:
        lea       _ZSt8__ioinit(%rip), %rdi
..___tag_value___sti__$E.526:
        call      _ZNSt8ios_base4InitC1Ev@PLT
..___tag_value___sti__$E.527:
..B5.2:
        lea       _ZSt8__ioinit(%rip), %rsi
        lea       __dso_handle(%rip), %rdx
        xorl      %eax, %eax
        movq      _ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
..___tag_value___sti__$E.528:
        call      __cxa_atexit@PLT
..___tag_value___sti__$E.529:
..B5.3:
        popq      %rcx
..___tag_value___sti__$E.530:
        ret       
        .align    16,0x90
..___tag_value___sti__$E.531:
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
.L_2il0floatpacket.662:
	.long	0x00000000,0x401c0000,0x00000000,0x401c0000
	.type	.L_2il0floatpacket.662,@object
	.size	.L_2il0floatpacket.662,16
	.align 16
.L_2il0floatpacket.664:
	.long	0x00000000,0x40534000,0x00000000,0x40534000
	.type	.L_2il0floatpacket.664,@object
	.size	.L_2il0floatpacket.664,16
	.align 8
.L_2il0floatpacket.457:
	.long	0x00000000,0x40000000
	.type	.L_2il0floatpacket.457,@object
	.size	.L_2il0floatpacket.457,8
	.align 8
.L_2il0floatpacket.663:
	.long	0x00000000,0x40200000
	.type	.L_2il0floatpacket.663,@object
	.size	.L_2il0floatpacket.663,8
	.align 8
.L_2il0floatpacket.665:
	.long	0x00000000,0x401c0000
	.type	.L_2il0floatpacket.665,@object
	.size	.L_2il0floatpacket.665,8
	.align 8
.L_2il0floatpacket.666:
	.long	0x00000000,0x40534000
	.type	.L_2il0floatpacket.666,@object
	.size	.L_2il0floatpacket.666,8
	.align 8
.L_2il0floatpacket.667:
	.long	0x00000000,0x41f00000
	.type	.L_2il0floatpacket.667,@object
	.size	.L_2il0floatpacket.667,8
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
	.8byte 0x52507a0100000000
	.4byte 0x10780100
	.2byte 0x9b06
	.4byte DW.ref.__gxx_personality_v0-.
	.8byte 0x0000019008070c1b
	.2byte 0x0000
	.4byte 0x0000001c
	.8byte 0x4c507a0100000000
	.4byte 0x78010052
	.2byte 0x0710
	.byte 0x9b
	.4byte DW.ref.__gxx_personality_v0-.
	.8byte 0x00019008070c1b1b
	.byte 0x00
	.4byte 0x0000002c
	.4byte 0x00000044
	.4byte ..___tag_value_main.1-.
	.4byte ..___tag_value_main.20-..___tag_value_main.1
	.2byte 0x0400
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.18-..___tag_value_main.4
	.8byte 0x00000000c608070c
	.byte 0x00
	.4byte 0x0000009c
	.4byte 0x00000074
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.21-.
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.114-..___tag_value__Z10make_table10yesno_typePKc.21
	.2byte 0x0400
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.23-..___tag_value__Z10make_table10yesno_typePKc.21
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.25-..___tag_value__Z10make_table10yesno_typePKc.23
	.4byte 0x180e038d
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.27-..___tag_value__Z10make_table10yesno_typePKc.25
	.4byte 0x200e048e
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.29-..___tag_value__Z10make_table10yesno_typePKc.27
	.4byte 0x280e058f
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.31-..___tag_value__Z10make_table10yesno_typePKc.29
	.4byte 0x300e0683
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.33-..___tag_value__Z10make_table10yesno_typePKc.31
	.4byte 0x380e0786
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.35-..___tag_value__Z10make_table10yesno_typePKc.33
	.4byte 0x0403800e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.44-..___tag_value__Z10make_table10yesno_typePKc.35
	.4byte 0x04c6380e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.46-..___tag_value__Z10make_table10yesno_typePKc.44
	.4byte 0x04c3300e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.48-..___tag_value__Z10make_table10yesno_typePKc.46
	.4byte 0x04cf280e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.50-..___tag_value__Z10make_table10yesno_typePKc.48
	.4byte 0x04ce200e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.52-..___tag_value__Z10make_table10yesno_typePKc.50
	.4byte 0x04cd180e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.54-..___tag_value__Z10make_table10yesno_typePKc.52
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.56-..___tag_value__Z10make_table10yesno_typePKc.54
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z10make_table10yesno_typePKc.57-..___tag_value__Z10make_table10yesno_typePKc.56
	.8byte 0x8c0786068303800e
	.8byte 0x00058f048e038d02
	.4byte 0x00000000
	.byte 0x00
	.4byte 0x0000008c
	.4byte 0x00000114
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.115-.
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.145-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.115
	.2byte 0x0400
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.117-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.115
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.119-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.117
	.4byte 0x180e038d
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.121-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.119
	.2byte 0x200e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.122-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.121
	.2byte 0x048e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.125-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.122
	.2byte 0x04ce
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.126-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.125
	.4byte 0x04cd180e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.128-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.126
	.4byte 0x04cc100e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.130-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.128
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.131-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.130
	.8byte 0x048e038d028c200e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.135-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.131
	.2byte 0x04ce
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.136-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.135
	.2byte 0x048e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.137-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.136
	.4byte 0x04cd180e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.139-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.137
	.4byte 0x04cc100e
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.141-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.139
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.142-..___tag_value__ZSt16__introsort_loopIPdlEvT_S1_T0_.141
	.8byte 0x0000038d028c200e
	.4byte 0x00000000
	.4byte 0x0000009c
	.4byte 0x00000184
	.4byte ..___tag_value__Z8time_ffti10yesno_type.152-.
	.4byte ..___tag_value__Z8time_ffti10yesno_type.518-..___tag_value__Z8time_ffti10yesno_type.152
	.byte 0x04
	.4byte _Z8time_ffti10yesno_type$$LSDA-.
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.154-..___tag_value__Z8time_ffti10yesno_type.152
	.4byte 0x100e028c
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.156-..___tag_value__Z8time_ffti10yesno_type.154
	.4byte 0x180e038d
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.158-..___tag_value__Z8time_ffti10yesno_type.156
	.4byte 0x200e048e
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.160-..___tag_value__Z8time_ffti10yesno_type.158
	.4byte 0x280e058f
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.162-..___tag_value__Z8time_ffti10yesno_type.160
	.4byte 0x300e0683
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.164-..___tag_value__Z8time_ffti10yesno_type.162
	.4byte 0x380e0786
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.166-..___tag_value__Z8time_ffti10yesno_type.164
	.4byte 0x0401900e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.279-..___tag_value__Z8time_ffti10yesno_type.166
	.4byte 0x04c6380e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.282-..___tag_value__Z8time_ffti10yesno_type.279
	.4byte 0x04c3300e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.284-..___tag_value__Z8time_ffti10yesno_type.282
	.4byte 0x04cf280e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.286-..___tag_value__Z8time_ffti10yesno_type.284
	.4byte 0x04ce200e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.288-..___tag_value__Z8time_ffti10yesno_type.286
	.4byte 0x04cd180e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.290-..___tag_value__Z8time_ffti10yesno_type.288
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z8time_ffti10yesno_type.292-..___tag_value__Z8time_ffti10yesno_type.290
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z8time_ffti10yesno_type.293-..___tag_value__Z8time_ffti10yesno_type.292
	.8byte 0x8c0786068301900e
	.8byte 0x00058f048e038d02
	.byte 0x00
	.4byte 0x0000001c
	.4byte 0x00000244
	.4byte ..___tag_value___sti__$E.523-.
	.4byte ..___tag_value___sti__$E.531-..___tag_value___sti__$E.523
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.525-..___tag_value___sti__$E.523
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.530-..___tag_value___sti__$E.525
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
