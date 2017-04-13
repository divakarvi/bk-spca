	.file "leibniz_init.cpp"
	.text
..TXTST0:
# -- Begin  _Z7mic_sumPdl, L__Z7mic_sumPdl_15__par_loop0_2.19, L__Z7mic_sumPdl_15__tree_reduce0_2.57
       .align    16,0x90
	.globl _Z7mic_sumPdl
_Z7mic_sumPdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:
..___tag_value__Z7mic_sumPdl.1:
        subq      $104, %rsp
..___tag_value__Z7mic_sumPdl.3:
        movq      %rdi, %rdx
        movq      %rsi, 56(%rsp)
        movl      $.L_2__STRING.0, %edi
        movq      %rdx, %rsi
        xorl      %eax, %eax
        movq      %rbp, 48(%rsp)
        movq      %rbx, 40(%rsp)
        movq      %r15, 8(%rsp)
        movq      %r14, 16(%rsp)
        movq      %r13, 24(%rsp)
        movq      %r12, 32(%rsp)
        movq      %rdx, (%rsp)
..___tag_value__Z7mic_sumPdl.4:
        call      printf
..___tag_value__Z7mic_sumPdl.5:
..B1.2:
        movl      $.2.7_2_kmpc_loc_struct_pack.12, %edi
        movq      $0, 64(%rsp)
        call      __kmpc_global_thread_num
..B1.51:
        movl      %eax, 72(%rsp)
        movl      $.2.7_2_kmpc_loc_struct_pack.21, %edi
        xorl      %eax, %eax
..___tag_value__Z7mic_sumPdl.12:
        call      __kmpc_ok_to_fork
..___tag_value__Z7mic_sumPdl.13:
..B1.3:
        testl     %eax, %eax
        je        ..B1.5
..B1.4:
        movl      $L__Z7mic_sumPdl_15__par_loop0_2.19, %edx
        lea       56(%rsp), %rcx
        movl      $.2.7_2_kmpc_loc_struct_pack.21, %edi
        lea       (%rsp), %r8
        pushq     $3
        popq      %rsi
        lea       64(%rsp), %r9
        xorl      %eax, %eax
..___tag_value__Z7mic_sumPdl.14:
        call      __kmpc_fork_call
..___tag_value__Z7mic_sumPdl.15:
        jmp       ..B1.8
..B1.5:
        movl      $.2.7_2_kmpc_loc_struct_pack.21, %edi
        xorl      %eax, %eax
        movl      72(%rsp), %esi
..___tag_value__Z7mic_sumPdl.16:
        call      __kmpc_serialized_parallel
..___tag_value__Z7mic_sumPdl.17:
..B1.6:
        movl      $___kmpv_zero_Z7mic_sumPdl_0, %esi
        lea       72(%rsp), %rdi
        lea       56(%rsp), %rdx
        lea       (%rsp), %rcx
        lea       64(%rsp), %r8
..___tag_value__Z7mic_sumPdl.18:
        call      L__Z7mic_sumPdl_15__par_loop0_2.19
..___tag_value__Z7mic_sumPdl.19:
..B1.7:
        movl      $.2.7_2_kmpc_loc_struct_pack.21, %edi
        xorl      %eax, %eax
        movl      72(%rsp), %esi
..___tag_value__Z7mic_sumPdl.20:
        call      __kmpc_end_serialized_parallel
..___tag_value__Z7mic_sumPdl.21:
..B1.8:
        movq      8(%rsp), %r15
..___tag_value__Z7mic_sumPdl.22:
        movq      16(%rsp), %r14
..___tag_value__Z7mic_sumPdl.23:
        movq      24(%rsp), %r13
..___tag_value__Z7mic_sumPdl.24:
        movq      32(%rsp), %r12
..___tag_value__Z7mic_sumPdl.25:
        movq      40(%rsp), %rbx
..___tag_value__Z7mic_sumPdl.26:
        movq      48(%rsp), %rbp
..___tag_value__Z7mic_sumPdl.27:
        movsd     64(%rsp), %xmm0
        addq      $104, %rsp
..___tag_value__Z7mic_sumPdl.28:
        ret       
..___tag_value__Z7mic_sumPdl.29:
L__Z7mic_sumPdl_15__tree_reduce0_2.57:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.9:
        subq      $104, %rsp
        movsd     (%rsi), %xmm0
        movq      %rbp, 48(%rsp)
        movq      %rbx, 40(%rsp)
        movq      %r15, 8(%rsp)
        movq      %r14, 16(%rsp)
        movq      %r13, 24(%rsp)
        movq      %r12, 32(%rsp)
        movq      8(%rsp), %r15
..___tag_value__Z7mic_sumPdl.31:
        movq      16(%rsp), %r14
..___tag_value__Z7mic_sumPdl.36:
        movq      24(%rsp), %r13
..___tag_value__Z7mic_sumPdl.37:
        movq      32(%rsp), %r12
..___tag_value__Z7mic_sumPdl.38:
        movq      40(%rsp), %rbx
..___tag_value__Z7mic_sumPdl.39:
        movq      48(%rsp), %rbp
..___tag_value__Z7mic_sumPdl.40:
        addsd     (%rdi), %xmm0
        movsd     %xmm0, (%rdi)
        addq      $104, %rsp
..___tag_value__Z7mic_sumPdl.41:
        ret       
..___tag_value__Z7mic_sumPdl.42:
L__Z7mic_sumPdl_15__par_loop0_2.19:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
..B1.10:
        subq      $104, %rsp
        movq      %r12, 32(%rsp)
        pxor      %xmm0, %xmm0
..___tag_value__Z7mic_sumPdl.44:
        movq      (%rdx), %r12
        testq     %r12, %r12
        movq      %rbx, 40(%rsp)
        movq      %r14, 16(%rsp)
        movq      %rbp, 48(%rsp)
..___tag_value__Z7mic_sumPdl.45:
        movq      %r8, %rbp
        movq      %r15, 8(%rsp)
        movq      %r13, 24(%rsp)
..___tag_value__Z7mic_sumPdl.48:
        movl      (%rdi), %ebx
        movq      (%rcx), %r14
        movsd     %xmm0, 56(%rsp)
        jle       ..B1.32
..B1.11:
        decq      %r12
        movl      $1, %r13d
        movq      $0, 64(%rsp)
        movl      $.2.7_2_kmpc_loc_struct_pack.21, %edi
        movq      %r12, 72(%rsp)
        movl      %ebx, %esi
        movl      $0, 88(%rsp)
        movl      $34, %edx
        movq      %r13, 80(%rsp)
        addq      $-32, %rsp
..___tag_value__Z7mic_sumPdl.50:
        xorl      %eax, %eax
        lea       120(%rsp), %rcx
        lea       96(%rsp), %r8
        lea       104(%rsp), %r9
        lea       112(%rsp), %r10
        movq      %r10, (%rsp)
        movq      %r13, 8(%rsp)
        movq      %r13, 16(%rsp)
..___tag_value__Z7mic_sumPdl.51:
        call      __kmpc_for_static_init_8
..___tag_value__Z7mic_sumPdl.52:
..B1.52:
        addq      $32, %rsp
..___tag_value__Z7mic_sumPdl.53:
..B1.12:
        movq      64(%rsp), %rax
        cmpq      %r12, %rax
        movq      72(%rsp), %rdx
        jg        ..B1.31
..B1.13:
        cmpq      %r12, %rdx
        cmovl     %rdx, %r12
        cmpq      %r12, %rax
        jg        ..B1.31
..B1.14:
        subq      %rax, %r12
        movb      $0, %sil
        incq      %r12
        cmpq      $16, %r12
        jl        ..B1.38
..B1.15:
        lea       (%r14,%rax,8), %rcx
        movq      %rcx, %rdx
        andq      $15, %rdx
        je        ..B1.18
..B1.16:
        testq     $7, %rdx
        jne       ..B1.38
..B1.17:
        movq      %r13, %rdx
..B1.18:
        lea       16(%rdx), %rdi
        cmpq      %rdi, %r12
        jl        ..B1.38
..B1.19:
        movq      %r12, %rdi
        xorl      %r8d, %r8d
        subq      %rdx, %rdi
        andq      $15, %rdi
        negq      %rdi
        addq      %r12, %rdi
        testq     %rdx, %rdx
        ja        ..B1.43
..B1.20:
        movsd     56(%rsp), %xmm0
        pxor      %xmm6, %xmm6
        movaps    %xmm6, %xmm7
        movaps    %xmm6, %xmm5
        movsd     %xmm0, %xmm7
        movaps    %xmm6, %xmm4
        movaps    %xmm6, %xmm3
        movaps    %xmm6, %xmm2
        movaps    %xmm6, %xmm1
        movaps    %xmm6, %xmm0
..B1.21:
        addpd     (%rcx,%rdx,8), %xmm7
        addpd     16(%rcx,%rdx,8), %xmm6
        addpd     32(%rcx,%rdx,8), %xmm5
        addpd     48(%rcx,%rdx,8), %xmm4
        addpd     64(%rcx,%rdx,8), %xmm3
        addpd     80(%rcx,%rdx,8), %xmm2
        addpd     96(%rcx,%rdx,8), %xmm1
        addpd     112(%rcx,%rdx,8), %xmm0
        addq      $16, %rdx
        cmpq      %rdi, %rdx
        jb        ..B1.21
..B1.22:
        addpd     %xmm6, %xmm7
        addpd     %xmm4, %xmm5
        addpd     %xmm2, %xmm3
        addpd     %xmm0, %xmm1
        addpd     %xmm5, %xmm7
        addpd     %xmm1, %xmm3
        addpd     %xmm3, %xmm7
        movaps    %xmm7, %xmm0
        unpckhpd  %xmm7, %xmm0
        addsd     %xmm0, %xmm7
        movsd     %xmm7, 56(%rsp)
..B1.23:
        lea       1(%rdi), %rdx
        cmpq      %rdx, %r12
        jb        ..B1.31
..B1.24:
        subq      %rdi, %r12
        cmpb      $1, %sil
        jne       ..B1.26
..B1.25:
        xorl      %esi, %esi
        jmp       ..B1.30
..B1.26:
        cmpq      $2, %r12
        jl        ..B1.25
..B1.27:
        movsd     56(%rsp), %xmm1
        lea       (%rax,%rdi), %rdx
        movq      %r12, %rsi
        pxor      %xmm0, %xmm0
        andq      $-2, %rsi
        xorl      %ecx, %ecx
        movsd     %xmm1, %xmm0
        lea       (%r14,%rdx,8), %rdx
..B1.28:
        addpd     (%rdx,%rcx,8), %xmm0
        addq      $2, %rcx
        cmpq      %rsi, %rcx
        jb        ..B1.28
..B1.29:
        movaps    %xmm0, %xmm1
        unpckhpd  %xmm0, %xmm1
        addsd     %xmm1, %xmm0
        movsd     %xmm0, 56(%rsp)
..B1.30:
        cmpq      %r12, %rsi
        jb        ..B1.39
..B1.31:
        movl      $.2.7_2_kmpc_loc_struct_pack.21, %edi
        movl      %ebx, %esi
        xorl      %eax, %eax
..___tag_value__Z7mic_sumPdl.54:
        call      __kmpc_for_static_fini
..___tag_value__Z7mic_sumPdl.55:
..B1.32:
        movsd     56(%rsp), %xmm0
        movl      $.2.7_2_kmpc_loc_struct_pack.50, %r12d
        movsd     %xmm0, (%rsp)
        lea       (%rsp), %r8
        pushq     %rsp
..___tag_value__Z7mic_sumPdl.56:
        movl      $L__Z7mic_sumPdl_15__tree_reduce0_2.57, %r9d
        movq      %r12, %rdi
        movl      %ebx, %esi
        pushq     $1
        popq      %rdx
        pushq     $8
        popq      %rcx
        xorl      %eax, %eax
        pushq     $mic_sum_kmpc_tree_reduct_lock_0
..___tag_value__Z7mic_sumPdl.57:
        call      __kmpc_reduce_nowait
..___tag_value__Z7mic_sumPdl.59:
..B1.53:
        addq      $16, %rsp
..___tag_value__Z7mic_sumPdl.60:
..B1.33:
        cmpl      $1, %eax
        jne       ..B1.35
..B1.34:
        movsd     (%rsp), %xmm0
        movl      $mic_sum_kmpc_tree_reduct_lock_0, %edx
        movq      %r12, %rdi
        movl      %ebx, %esi
        xorl      %eax, %eax
        addsd     (%rbp), %xmm0
        movsd     %xmm0, (%rbp)
..___tag_value__Z7mic_sumPdl.61:
        call      __kmpc_end_reduce_nowait
..___tag_value__Z7mic_sumPdl.62:
        jmp       ..B1.37
..B1.35:
        cmpl      $2, %eax
        jne       ..B1.37
..B1.36:
        movsd     (%rsp), %xmm0
        movq      %r12, %rdi
        movl      %ebx, %esi
        movq      %rbp, %rdx
        pushq     $1
        popq      %rax
..___tag_value__Z7mic_sumPdl.63:
        call      __kmpc_atomic_float8_add
..___tag_value__Z7mic_sumPdl.64:
..B1.37:
        movq      8(%rsp), %r15
..___tag_value__Z7mic_sumPdl.65:
        movq      16(%rsp), %r14
..___tag_value__Z7mic_sumPdl.66:
        movq      24(%rsp), %r13
..___tag_value__Z7mic_sumPdl.67:
        movq      32(%rsp), %r12
..___tag_value__Z7mic_sumPdl.68:
        movq      40(%rsp), %rbx
..___tag_value__Z7mic_sumPdl.69:
        movq      48(%rsp), %rbp
..___tag_value__Z7mic_sumPdl.70:
        addq      $104, %rsp
..___tag_value__Z7mic_sumPdl.71:
        ret       
..___tag_value__Z7mic_sumPdl.72:
..B1.38:
        movb      $1, %sil
        xorl      %edi, %edi
        jmp       ..B1.23
..B1.39:
        addq      %rdi, %rax
        movsd     56(%rsp), %xmm0
        lea       (%r14,%rax,8), %rax
..B1.40:
        addsd     (%rax,%rsi,8), %xmm0
        incq      %rsi
        cmpq      %r12, %rsi
        jb        ..B1.40
..B1.41:
        movsd     %xmm0, 56(%rsp)
        jmp       ..B1.31
..B1.43:
        movsd     56(%rsp), %xmm0
..B1.44:
        addsd     (%rcx,%r8,8), %xmm0
        incq      %r8
        cmpq      %rdx, %r8
        jb        ..B1.44
..B1.45:
        movsd     %xmm0, 56(%rsp)
        jmp       ..B1.20
        .align    16,0x90
..___tag_value__Z7mic_sumPdl.79:
	.type	_Z7mic_sumPdl,@function
	.size	_Z7mic_sumPdl,.-_Z7mic_sumPdl
	.data
	.align 4
	.align 4
.2.7_2_kmpc_loc_struct_pack.12:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.7_2__kmpc_loc_pack.11
	.align 4
.2.7_2__kmpc_loc_pack.11:
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
.2.7_2_kmpc_loc_struct_pack.21:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.7_2__kmpc_loc_pack.20
	.align 4
.2.7_2__kmpc_loc_pack.20:
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
.2.7_2_kmpc_loc_struct_pack.50:
	.long	0
	.long	18
	.long	0
	.long	0
	.quad	.2.7_2__kmpc_loc_pack.49
	.align 4
.2.7_2__kmpc_loc_pack.49:
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
# -- Begin  _Z13hostmic_scalePdl, L__Z13hostmic_scalePdl_27__par_loop0_2.94, L__Z13hostmic_scalePdl_31__par_region1_2.114
       .align    16,0x90
	.globl _Z13hostmic_scalePdl
_Z13hostmic_scalePdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.1:
..___tag_value__Z13hostmic_scalePdl.80:
        subq      $88, %rsp
..___tag_value__Z13hostmic_scalePdl.82:
        movq      %rdi, %rdx
        movq      %rsi, 56(%rsp)
        movl      $.L_2__STRING.1, %edi
        movq      %rdx, %rsi
        xorl      %eax, %eax
        movq      %rbp, 40(%rsp)
        movq      %rbx, 32(%rsp)
        movq      %r15, (%rsp)
        movq      %r14, 8(%rsp)
        movq      %r13, 16(%rsp)
        movq      %r12, 24(%rsp)
        movq      %rdx, 48(%rsp)
..___tag_value__Z13hostmic_scalePdl.83:
        call      printf
..___tag_value__Z13hostmic_scalePdl.84:
..B2.2:
        movl      $.2.8_2_kmpc_loc_struct_pack.79, %edi
        call      __kmpc_global_thread_num
..B2.49:
        movl      %eax, 64(%rsp)
        movl      $.2.8_2_kmpc_loc_struct_pack.96, %edi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.91:
        call      __kmpc_ok_to_fork
..___tag_value__Z13hostmic_scalePdl.92:
..B2.3:
        testl     %eax, %eax
        je        ..B2.5
..B2.4:
        movl      $L__Z13hostmic_scalePdl_27__par_loop0_2.94, %edx
        lea       56(%rsp), %rcx
        movl      $.2.8_2_kmpc_loc_struct_pack.96, %edi
        lea       48(%rsp), %r8
        pushq     $2
        popq      %rsi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.93:
        call      __kmpc_fork_call
..___tag_value__Z13hostmic_scalePdl.94:
        jmp       ..B2.8
..B2.5:
        movl      $.2.8_2_kmpc_loc_struct_pack.96, %edi
        xorl      %eax, %eax
        movl      64(%rsp), %esi
..___tag_value__Z13hostmic_scalePdl.95:
        call      __kmpc_serialized_parallel
..___tag_value__Z13hostmic_scalePdl.96:
..B2.6:
        movl      $___kmpv_zero_Z13hostmic_scalePdl_0, %esi
        lea       64(%rsp), %rdi
        lea       56(%rsp), %rdx
        lea       48(%rsp), %rcx
..___tag_value__Z13hostmic_scalePdl.97:
        call      L__Z13hostmic_scalePdl_27__par_loop0_2.94
..___tag_value__Z13hostmic_scalePdl.98:
..B2.7:
        movl      $.2.8_2_kmpc_loc_struct_pack.96, %edi
        xorl      %eax, %eax
        movl      64(%rsp), %esi
..___tag_value__Z13hostmic_scalePdl.99:
        call      __kmpc_end_serialized_parallel
..___tag_value__Z13hostmic_scalePdl.100:
..B2.8:
        movl      $.2.8_2_kmpc_loc_struct_pack.116, %edi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.101:
        call      __kmpc_ok_to_fork
..___tag_value__Z13hostmic_scalePdl.102:
..B2.9:
        testl     %eax, %eax
        je        ..B2.11
..B2.10:
        movl      $L__Z13hostmic_scalePdl_31__par_region1_2.114, %edx
        movl      $.2.8_2_kmpc_loc_struct_pack.116, %edi
        xorl      %esi, %esi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.103:
        call      __kmpc_fork_call
..___tag_value__Z13hostmic_scalePdl.104:
        jmp       ..B2.14
..B2.11:
        movl      $.2.8_2_kmpc_loc_struct_pack.116, %edi
        xorl      %eax, %eax
        movl      64(%rsp), %esi
..___tag_value__Z13hostmic_scalePdl.105:
        call      __kmpc_serialized_parallel
..___tag_value__Z13hostmic_scalePdl.106:
..B2.12:
        movl      $___kmpv_zero_Z13hostmic_scalePdl_1, %esi
        lea       64(%rsp), %rdi
..___tag_value__Z13hostmic_scalePdl.107:
        call      L__Z13hostmic_scalePdl_31__par_region1_2.114
..___tag_value__Z13hostmic_scalePdl.108:
..B2.13:
        movl      $.2.8_2_kmpc_loc_struct_pack.116, %edi
        xorl      %eax, %eax
        movl      64(%rsp), %esi
..___tag_value__Z13hostmic_scalePdl.109:
        call      __kmpc_end_serialized_parallel
..___tag_value__Z13hostmic_scalePdl.110:
..B2.14:
        movq      (%rsp), %r15
..___tag_value__Z13hostmic_scalePdl.111:
        movq      8(%rsp), %r14
..___tag_value__Z13hostmic_scalePdl.112:
        movq      16(%rsp), %r13
..___tag_value__Z13hostmic_scalePdl.113:
        movq      24(%rsp), %r12
..___tag_value__Z13hostmic_scalePdl.114:
        movq      32(%rsp), %rbx
..___tag_value__Z13hostmic_scalePdl.115:
        movq      40(%rsp), %rbp
..___tag_value__Z13hostmic_scalePdl.116:
        addq      $88, %rsp
..___tag_value__Z13hostmic_scalePdl.117:
        ret       
..___tag_value__Z13hostmic_scalePdl.118:
L__Z13hostmic_scalePdl_31__par_region1_2.114:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.15:
        subq      $88, %rsp
        xorl      %eax, %eax
        movq      %rbx, 32(%rsp)
..___tag_value__Z13hostmic_scalePdl.120:
        movl      $.2.8_2_kmpc_loc_struct_pack.87, %ebx
        movq      %rbp, 40(%rsp)
..___tag_value__Z13hostmic_scalePdl.121:
        movl      (%rdi), %ebp
        movq      %rbx, %rdi
        movl      %ebp, %esi
        movq      %r15, (%rsp)
        movq      %r14, 8(%rsp)
        movq      %r13, 16(%rsp)
        movq      %r12, 24(%rsp)
..___tag_value__Z13hostmic_scalePdl.122:
        call      __kmpc_master
..___tag_value__Z13hostmic_scalePdl.123:
..B2.16:
        cmpl      $1, %eax
        jne       ..B2.20
..B2.17:
        call      omp_get_num_threads
..B2.18:
        movl      $.L_2__STRING.2, %edi
        movl      %eax, %esi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.128:
        call      printf
..___tag_value__Z13hostmic_scalePdl.129:
..B2.19:
        movq      %rbx, %rdi
        movl      %ebp, %esi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.130:
        call      __kmpc_end_master
..___tag_value__Z13hostmic_scalePdl.131:
..B2.20:
        movq      (%rsp), %r15
..___tag_value__Z13hostmic_scalePdl.132:
        movq      8(%rsp), %r14
..___tag_value__Z13hostmic_scalePdl.133:
        movq      16(%rsp), %r13
..___tag_value__Z13hostmic_scalePdl.134:
        movq      24(%rsp), %r12
..___tag_value__Z13hostmic_scalePdl.135:
        movq      32(%rsp), %rbx
..___tag_value__Z13hostmic_scalePdl.136:
        movq      40(%rsp), %rbp
..___tag_value__Z13hostmic_scalePdl.137:
        addq      $88, %rsp
..___tag_value__Z13hostmic_scalePdl.138:
        ret       
..___tag_value__Z13hostmic_scalePdl.139:
L__Z13hostmic_scalePdl_27__par_loop0_2.94:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B2.21:
        subq      $88, %rsp
        movq      %r12, 24(%rsp)
..___tag_value__Z13hostmic_scalePdl.141:
        movq      (%rdx), %r12
        testq     %r12, %r12
        movq      %rbp, 40(%rsp)
        movq      %r13, 16(%rsp)
        movq      %rbx, 32(%rsp)
        movq      %r15, (%rsp)
        movq      %r14, 8(%rsp)
..___tag_value__Z13hostmic_scalePdl.142:
        movl      (%rdi), %r13d
        movq      (%rcx), %rbp
        jle       ..B2.42
..B2.22:
        decq      %r12
        movl      $1, %ebx
        movq      $0, 48(%rsp)
        movl      $.2.8_2_kmpc_loc_struct_pack.96, %edi
        movq      %r12, 56(%rsp)
        movl      %r13d, %esi
        movl      $0, 72(%rsp)
        movl      $34, %edx
        movq      %rbx, 64(%rsp)
        addq      $-32, %rsp
..___tag_value__Z13hostmic_scalePdl.147:
        xorl      %eax, %eax
        lea       104(%rsp), %rcx
        lea       80(%rsp), %r8
        lea       88(%rsp), %r9
        lea       96(%rsp), %r10
        movq      %r10, (%rsp)
        movq      %rbx, 8(%rsp)
        movq      %rbx, 16(%rsp)
..___tag_value__Z13hostmic_scalePdl.148:
        call      __kmpc_for_static_init_8
..___tag_value__Z13hostmic_scalePdl.149:
..B2.53:
        addq      $32, %rsp
..___tag_value__Z13hostmic_scalePdl.150:
..B2.23:
        movq      48(%rsp), %rdi
        cmpq      %r12, %rdi
        movq      56(%rsp), %rax
        jg        ..B2.41
..B2.24:
        cmpq      %r12, %rax
        cmovl     %rax, %r12
        cmpq      %r12, %rdi
        jg        ..B2.41
..B2.25:
        subq      %rdi, %r12
        incq      %r12
        cmpq      $8, %r12
        jl        ..B2.43
..B2.26:
        lea       (%rbp,%rdi,8), %rsi
        movq      %rsi, %rcx
        andq      $15, %rcx
        je        ..B2.29
..B2.27:
        testq     $7, %rcx
        jne       ..B2.43
..B2.28:
        movq      %rbx, %rcx
..B2.29:
        lea       8(%rcx), %rax
        cmpq      %rax, %r12
        jl        ..B2.43
..B2.30:
        movq      %r12, %rdx
        xorl      %eax, %eax
        subq      %rcx, %rdx
        andq      $7, %rdx
        negq      %rdx
        addq      %r12, %rdx
        testq     %rcx, %rcx
        jbe       ..B2.34
..B2.31:
        movsd     .L_2il0floatpacket.133(%rip), %xmm0
..B2.32:
        movsd     (%rsi,%rax,8), %xmm1
        mulsd     %xmm0, %xmm1
        movsd     %xmm1, (%rsi,%rax,8)
        incq      %rax
        cmpq      %rcx, %rax
        jb        ..B2.32
..B2.34:
        movaps    .L_2il0floatpacket.134(%rip), %xmm0
..B2.35:
        movaps    (%rsi,%rcx,8), %xmm1
        movaps    16(%rsi,%rcx,8), %xmm2
        movaps    32(%rsi,%rcx,8), %xmm3
        movaps    48(%rsi,%rcx,8), %xmm4
        mulpd     %xmm0, %xmm1
        mulpd     %xmm0, %xmm2
        mulpd     %xmm0, %xmm3
        mulpd     %xmm0, %xmm4
        movaps    %xmm1, (%rsi,%rcx,8)
        movaps    %xmm2, 16(%rsi,%rcx,8)
        movaps    %xmm3, 32(%rsi,%rcx,8)
        movaps    %xmm4, 48(%rsi,%rcx,8)
        addq      $8, %rcx
        cmpq      %rdx, %rcx
        jb        ..B2.35
..B2.37:
        cmpq      %r12, %rdx
        jae       ..B2.41
..B2.38:
        movsd     .L_2il0floatpacket.133(%rip), %xmm0
        lea       (%rbp,%rdi,8), %rax
        lea       (%rax,%rdx,8), %rax
..B2.39:
        movsd     (%rax), %xmm1
        incq      %rdx
        mulsd     %xmm0, %xmm1
        movsd     %xmm1, (%rax)
        addq      $8, %rax
        cmpq      %r12, %rdx
        jb        ..B2.39
..B2.41:
        movl      $.2.8_2_kmpc_loc_struct_pack.96, %edi
        movl      %r13d, %esi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.151:
        call      __kmpc_for_static_fini
..___tag_value__Z13hostmic_scalePdl.152:
..B2.42:
        movq      (%rsp), %r15
..___tag_value__Z13hostmic_scalePdl.153:
        movq      8(%rsp), %r14
..___tag_value__Z13hostmic_scalePdl.154:
        movq      16(%rsp), %r13
..___tag_value__Z13hostmic_scalePdl.155:
        movq      24(%rsp), %r12
..___tag_value__Z13hostmic_scalePdl.156:
        movq      32(%rsp), %rbx
..___tag_value__Z13hostmic_scalePdl.157:
        movq      40(%rsp), %rbp
..___tag_value__Z13hostmic_scalePdl.158:
        addq      $88, %rsp
..___tag_value__Z13hostmic_scalePdl.159:
        ret       
..___tag_value__Z13hostmic_scalePdl.160:
..B2.43:
        xorl      %edx, %edx
        jmp       ..B2.37
        .align    16,0x90
..___tag_value__Z13hostmic_scalePdl.167:
	.type	_Z13hostmic_scalePdl,@function
	.size	_Z13hostmic_scalePdl,.-_Z13hostmic_scalePdl
	.section .gcc_except_table, "a"
	.align 4
_Z13hostmic_scalePdl$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value__Z13hostmic_scalePdl.171 - ..___tag_value__Z13hostmic_scalePdl.170
..___tag_value__Z13hostmic_scalePdl.170:
	.byte	1
	.uleb128	..___tag_value__Z13hostmic_scalePdl.169 - ..___tag_value__Z13hostmic_scalePdl.168
..___tag_value__Z13hostmic_scalePdl.168:
	.uleb128	..___tag_value__Z13hostmic_scalePdl.83 - ..___tag_value__Z13hostmic_scalePdl.80
	.uleb128	..___tag_value__Z13hostmic_scalePdl.84 - ..___tag_value__Z13hostmic_scalePdl.83
	.byte	0
	.byte	0
..___tag_value__Z13hostmic_scalePdl.169:
	.long	0x00000000,0x00000000
..___tag_value__Z13hostmic_scalePdl.171:
	.data
	.align 4
.2.8_2_kmpc_loc_struct_pack.79:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.8_2__kmpc_loc_pack.78
	.align 4
.2.8_2__kmpc_loc_pack.78:
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
.2.8_2_kmpc_loc_struct_pack.96:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.8_2__kmpc_loc_pack.95
	.align 4
.2.8_2__kmpc_loc_pack.95:
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
.2.8_2_kmpc_loc_struct_pack.116:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.8_2__kmpc_loc_pack.115
	.align 4
.2.8_2__kmpc_loc_pack.115:
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
.2.8_2_kmpc_loc_struct_pack.87:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.8_2__kmpc_loc_pack.86
	.align 4
.2.8_2__kmpc_loc_pack.86:
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
# -- End  _Z13hostmic_scalePdl, L__Z13hostmic_scalePdl_27__par_loop0_2.94, L__Z13hostmic_scalePdl_31__par_region1_2.114
	.text
# -- Begin  _Z12leibniz_initPdl, L__Z12leibniz_initPdl_37__par_loop0_2.154
       .align    16,0x90
	.globl _Z12leibniz_initPdl
_Z12leibniz_initPdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B3.1:
..___tag_value__Z12leibniz_initPdl.172:
        subq      $88, %rsp
..___tag_value__Z12leibniz_initPdl.174:
        movq      %rdi, 48(%rsp)
        movl      $.2.9_2_kmpc_loc_struct_pack.147, %edi
        movq      %rbp, 40(%rsp)
        movq      %rbx, 32(%rsp)
        movq      %r15, (%rsp)
        movq      %r14, 8(%rsp)
        movq      %r13, 16(%rsp)
        movq      %r12, 24(%rsp)
        movq      %rsi, 56(%rsp)
        call      __kmpc_global_thread_num
..___tag_value__Z12leibniz_initPdl.175:
..B3.26:
        movl      %eax, 64(%rsp)
        movl      $.2.9_2_kmpc_loc_struct_pack.156, %edi
        xorl      %eax, %eax
..___tag_value__Z12leibniz_initPdl.181:
        call      __kmpc_ok_to_fork
..___tag_value__Z12leibniz_initPdl.182:
..B3.2:
        testl     %eax, %eax
        je        ..B3.4
..B3.3:
        movl      $L__Z12leibniz_initPdl_37__par_loop0_2.154, %edx
        lea       56(%rsp), %rcx
        movl      $.2.9_2_kmpc_loc_struct_pack.156, %edi
        lea       48(%rsp), %r8
        pushq     $2
        popq      %rsi
        xorl      %eax, %eax
..___tag_value__Z12leibniz_initPdl.183:
        call      __kmpc_fork_call
..___tag_value__Z12leibniz_initPdl.184:
        jmp       ..B3.7
..B3.4:
        movl      $.2.9_2_kmpc_loc_struct_pack.156, %edi
        xorl      %eax, %eax
        movl      64(%rsp), %esi
..___tag_value__Z12leibniz_initPdl.185:
        call      __kmpc_serialized_parallel
..___tag_value__Z12leibniz_initPdl.186:
..B3.5:
        movl      $___kmpv_zero_Z12leibniz_initPdl_0, %esi
        lea       64(%rsp), %rdi
        lea       56(%rsp), %rdx
        lea       48(%rsp), %rcx
..___tag_value__Z12leibniz_initPdl.187:
        call      L__Z12leibniz_initPdl_37__par_loop0_2.154
..___tag_value__Z12leibniz_initPdl.188:
..B3.6:
        movl      $.2.9_2_kmpc_loc_struct_pack.156, %edi
        xorl      %eax, %eax
        movl      64(%rsp), %esi
..___tag_value__Z12leibniz_initPdl.189:
        call      __kmpc_end_serialized_parallel
..___tag_value__Z12leibniz_initPdl.190:
..B3.7:
        movq      (%rsp), %r15
..___tag_value__Z12leibniz_initPdl.191:
        movq      8(%rsp), %r14
..___tag_value__Z12leibniz_initPdl.192:
        movq      16(%rsp), %r13
..___tag_value__Z12leibniz_initPdl.193:
        movq      24(%rsp), %r12
..___tag_value__Z12leibniz_initPdl.194:
        movq      32(%rsp), %rbx
..___tag_value__Z12leibniz_initPdl.195:
        movq      40(%rsp), %rbp
..___tag_value__Z12leibniz_initPdl.196:
        addq      $88, %rsp
..___tag_value__Z12leibniz_initPdl.197:
        ret       
..___tag_value__Z12leibniz_initPdl.198:
L__Z12leibniz_initPdl_37__par_loop0_2.154:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B3.8:
        subq      $88, %rsp
        movq      %r12, 24(%rsp)
..___tag_value__Z12leibniz_initPdl.200:
        movq      (%rdx), %r12
        testq     %r12, %r12
        movq      %rbp, 40(%rsp)
        movq      %rbx, 32(%rsp)
        movq      %r15, (%rsp)
        movq      %r14, 8(%rsp)
        movq      %r13, 16(%rsp)
..___tag_value__Z12leibniz_initPdl.201:
        movl      (%rdi), %ebp
        movq      (%rcx), %rbx
        jle       ..B3.21
..B3.9:
        decq      %r12
        movl      $2, %r11d
        movq      $0, 48(%rsp)
        movl      $.2.9_2_kmpc_loc_struct_pack.156, %edi
        movq      %r12, 56(%rsp)
        movl      %ebp, %esi
        movl      $0, 72(%rsp)
        movl      $34, %edx
        movq      %r11, 64(%rsp)
        addq      $-32, %rsp
..___tag_value__Z12leibniz_initPdl.206:
        xorl      %eax, %eax
        lea       104(%rsp), %rcx
        lea       80(%rsp), %r8
        lea       88(%rsp), %r9
        lea       96(%rsp), %r10
        movq      %r10, (%rsp)
        movq      %r11, 8(%rsp)
        movq      $1, 16(%rsp)
..___tag_value__Z12leibniz_initPdl.207:
        call      __kmpc_for_static_init_8
..___tag_value__Z12leibniz_initPdl.208:
..B3.27:
        addq      $32, %rsp
..___tag_value__Z12leibniz_initPdl.209:
..B3.10:
        movq      48(%rsp), %r8
        cmpq      %r12, %r8
        movq      56(%rsp), %rax
        jg        ..B3.20
..B3.11:
        cmpq      %r12, %rax
        cmovl     %rax, %r12
        cmpq      %r12, %r8
        jg        ..B3.20
..B3.12:
        subq      %r8, %r12
        lea       2(%r12), %rax
        shrq      $63, %rax
        lea       2(%rax,%r12), %rcx
        sarq      $1, %rcx
        cmpq      $8, %rcx
        jl        ..B3.22
..B3.13:
        movq      %rcx, %rdx
        lea       1(,%r8,2), %rax
        movdqa    .L_2il0floatpacket.180(%rip), %xmm1
        lea       3(,%r8,2), %rsi
        andq      $-8, %rdx
        lea       (%rbx,%r8,8), %rdi
        movd      %rax, %xmm4
        addq      $4, %rax
        movd      %rax, %xmm6
        punpcklqdq %xmm6, %xmm4
        movd      %rsi, %xmm6
        addq      $4, %rsi
        movd      %rsi, %xmm0
        xorl      %esi, %esi
        punpcklqdq %xmm0, %xmm6
        xorl      %eax, %eax
..B3.14:
        movdqa    %xmm4, %xmm7
        movdqa    %xmm6, %xmm9
        movd      %xmm4, %r9
        addq      $8, %rsi
        psrldq    $8, %xmm7
        psrldq    $8, %xmm9
        movd      %xmm7, %r10
        movd      %xmm6, %r11
        movd      %xmm9, %r12
        movaps    .L_2il0floatpacket.181(%rip), %xmm11
        movaps    .L_2il0floatpacket.182(%rip), %xmm12
        cvtsi2sdq %r9, %xmm0
        cvtsi2sdq %r10, %xmm5
        cvtsi2sdq %r11, %xmm3
        cvtsi2sdq %r12, %xmm2
        paddq     %xmm1, %xmm4
        paddq     %xmm1, %xmm6
        movd      %xmm4, %r13
        movaps    %xmm0, %xmm8
        movaps    %xmm3, %xmm10
        unpcklpd  %xmm5, %xmm8
        movdqa    %xmm4, %xmm14
        divpd     %xmm8, %xmm11
        unpcklpd  %xmm2, %xmm10
        movdqa    %xmm6, %xmm7
        divpd     %xmm10, %xmm12
        psrldq    $8, %xmm14
        movaps    %xmm11, %xmm13
        movd      %xmm14, %r14
        psrldq    $8, %xmm7
        paddq     %xmm1, %xmm4
        movd      %xmm6, %r15
        movd      %xmm7, %r9
        unpckhpd  %xmm12, %xmm13
        movsd     %xmm12, 8(%rax,%rdi)
        movdqa    %xmm4, %xmm12
        cvtsi2sdq %r13, %xmm0
        cvtsi2sdq %r14, %xmm5
        cvtsi2sdq %r15, %xmm3
        cvtsi2sdq %r9, %xmm2
        movd      %xmm4, %r10
        paddq     %xmm1, %xmm6
        paddq     %xmm1, %xmm4
        movd      %xmm6, %r12
        movaps    %xmm0, %xmm15
        movaps    %xmm3, %xmm8
        unpcklpd  %xmm5, %xmm15
        movdqa    %xmm6, %xmm14
        movaps    .L_2il0floatpacket.181(%rip), %xmm9
        divpd     %xmm15, %xmm9
        unpcklpd  %xmm2, %xmm8
        movaps    .L_2il0floatpacket.182(%rip), %xmm10
        psrldq    $8, %xmm12
        divpd     %xmm8, %xmm10
        movd      %xmm12, %r11
        psrldq    $8, %xmm14
        movsd     %xmm13, 16(%rax,%rdi)
        cvtsi2sdq %r10, %xmm0
        cvtsi2sdq %r11, %xmm5
        cvtsi2sdq %r12, %xmm3
        movd      %xmm14, %r13
        paddq     %xmm1, %xmm6
        movd      %xmm4, %r14
        movhpd    %xmm13, 24(%rax,%rdi)
        movaps    %xmm0, %xmm13
        unpcklpd  %xmm5, %xmm13
        movdqa    %xmm6, %xmm12
        cvtsi2sdq %r13, %xmm2
        cvtsi2sdq %r14, %xmm0
        movd      %xmm6, %r9
        paddq     %xmm1, %xmm6
        movaps    .L_2il0floatpacket.181(%rip), %xmm7
        divpd     %xmm13, %xmm7
        movaps    %xmm3, %xmm13
        unpcklpd  %xmm2, %xmm13
        movaps    .L_2il0floatpacket.182(%rip), %xmm8
        divpd     %xmm13, %xmm8
        movsd     %xmm11, (%rax,%rdi)
        movaps    %xmm9, %xmm11
        unpckhpd  %xmm10, %xmm11
        movsd     %xmm10, 40(%rax,%rdi)
        movdqa    %xmm4, %xmm10
        psrldq    $8, %xmm10
        movd      %xmm10, %r15
        psrldq    $8, %xmm12
        movsd     %xmm11, 48(%rax,%rdi)
        movd      %xmm12, %r10
        movhpd    %xmm11, 56(%rax,%rdi)
        movaps    %xmm0, %xmm11
        movsd     %xmm7, 64(%rax,%rdi)
        cvtsi2sdq %r15, %xmm5
        cvtsi2sdq %r9, %xmm3
        cvtsi2sdq %r10, %xmm2
        paddq     %xmm1, %xmm4
        movsd     %xmm9, 32(%rax,%rdi)
        movaps    %xmm7, %xmm9
        unpcklpd  %xmm5, %xmm11
        movaps    %xmm3, %xmm15
        movaps    .L_2il0floatpacket.181(%rip), %xmm7
        movsd     %xmm8, 72(%rax,%rdi)
        unpckhpd  %xmm8, %xmm9
        divpd     %xmm11, %xmm7
        unpcklpd  %xmm2, %xmm15
        movaps    .L_2il0floatpacket.182(%rip), %xmm8
        divpd     %xmm15, %xmm8
        movsd     %xmm9, 80(%rax,%rdi)
        movhpd    %xmm9, 88(%rax,%rdi)
        movaps    %xmm7, %xmm9
        unpckhpd  %xmm8, %xmm9
        movsd     %xmm7, 96(%rax,%rdi)
        movsd     %xmm8, 104(%rax,%rdi)
        movsd     %xmm9, 112(%rax,%rdi)
        movhpd    %xmm9, 120(%rax,%rdi)
        addq      $128, %rax
        cmpq      %rdx, %rsi
        jb        ..B3.14
..B3.16:
        movq      %rdx, %rdi
        shlq      $4, %rdi
        cmpq      %rcx, %rdx
        jae       ..B3.20
..B3.17:
        lea       (%r8,%r8), %rsi
        lea       (%rbx,%r8,8), %rax
        .align    16,0x90
..B3.18:
        pxor      %xmm0, %xmm0
        lea       (%rsi,%rdx,4), %r8
        pxor      %xmm2, %xmm2
        lea       1(%r8), %rbx
        addq      $3, %r8
        incq      %rdx
        cvtsi2sdq %rbx, %xmm0
        cvtsi2sdq %r8, %xmm2
        movsd     .L_2il0floatpacket.184(%rip), %xmm1
        movsd     .L_2il0floatpacket.183(%rip), %xmm3
        divsd     %xmm0, %xmm1
        divsd     %xmm2, %xmm3
        movsd     %xmm1, (%rdi,%rax)
        movsd     %xmm3, 8(%rdi,%rax)
        addq      $16, %rdi
        cmpq      %rcx, %rdx
        jb        ..B3.18
..B3.20:
        movl      $.2.9_2_kmpc_loc_struct_pack.156, %edi
        movl      %ebp, %esi
        xorl      %eax, %eax
..___tag_value__Z12leibniz_initPdl.210:
        call      __kmpc_for_static_fini
..___tag_value__Z12leibniz_initPdl.211:
..B3.21:
        movq      (%rsp), %r15
..___tag_value__Z12leibniz_initPdl.212:
        movq      8(%rsp), %r14
..___tag_value__Z12leibniz_initPdl.213:
        movq      16(%rsp), %r13
..___tag_value__Z12leibniz_initPdl.214:
        movq      24(%rsp), %r12
..___tag_value__Z12leibniz_initPdl.215:
        movq      32(%rsp), %rbx
..___tag_value__Z12leibniz_initPdl.216:
        movq      40(%rsp), %rbp
..___tag_value__Z12leibniz_initPdl.217:
        addq      $88, %rsp
..___tag_value__Z12leibniz_initPdl.218:
        ret       
..___tag_value__Z12leibniz_initPdl.219:
..B3.22:
        xorl      %edx, %edx
        jmp       ..B3.16
        .align    16,0x90
..___tag_value__Z12leibniz_initPdl.226:
	.type	_Z12leibniz_initPdl,@function
	.size	_Z12leibniz_initPdl,.-_Z12leibniz_initPdl
	.section .gcc_except_table, "a"
	.align 4
_Z12leibniz_initPdl$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value__Z12leibniz_initPdl.230 - ..___tag_value__Z12leibniz_initPdl.229
..___tag_value__Z12leibniz_initPdl.229:
	.byte	1
	.uleb128	..___tag_value__Z12leibniz_initPdl.228 - ..___tag_value__Z12leibniz_initPdl.227
..___tag_value__Z12leibniz_initPdl.227:
..___tag_value__Z12leibniz_initPdl.228:
	.long	0x00000000,0x00000000
..___tag_value__Z12leibniz_initPdl.230:
	.data
	.space 2, 0x00 	# pad
	.align 4
.2.9_2_kmpc_loc_struct_pack.147:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.146
	.align 4
.2.9_2__kmpc_loc_pack.146:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	105
	.byte	110
	.byte	105
	.byte	116
	.byte	59
	.byte	51
	.byte	55
	.byte	59
	.byte	51
	.byte	55
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.9_2_kmpc_loc_struct_pack.156:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.155
	.align 4
.2.9_2__kmpc_loc_pack.155:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	105
	.byte	110
	.byte	105
	.byte	116
	.byte	59
	.byte	51
	.byte	55
	.byte	59
	.byte	52
	.byte	49
	.byte	59
	.byte	59
	.data
# -- End  _Z12leibniz_initPdl, L__Z12leibniz_initPdl_37__par_loop0_2.154
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
	.align 4
___kmpv_zero_Z12leibniz_initPdl_0:
	.type	___kmpv_zero_Z12leibniz_initPdl_0,@object
	.size	___kmpv_zero_Z12leibniz_initPdl_0,4
	.space 4	# pad
	.section .rodata, "a"
	.align 16
	.align 16
.L_2il0floatpacket.134:
	.long	0xa53d6e3c,0x3ff965fe,0xa53d6e3c,0x3ff965fe
	.type	.L_2il0floatpacket.134,@object
	.size	.L_2il0floatpacket.134,16
	.align 16
.L_2il0floatpacket.180:
	.long	0x00000008,0x00000000,0x00000008,0x00000000
	.type	.L_2il0floatpacket.180,@object
	.size	.L_2il0floatpacket.180,16
	.align 16
.L_2il0floatpacket.181:
	.long	0x00000000,0x3ff00000,0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.181,@object
	.size	.L_2il0floatpacket.181,16
	.align 16
.L_2il0floatpacket.182:
	.long	0x00000000,0xbff00000,0x00000000,0xbff00000
	.type	.L_2il0floatpacket.182,@object
	.size	.L_2il0floatpacket.182,16
	.align 8
.L_2il0floatpacket.133:
	.long	0xa53d6e3c,0x3ff965fe
	.type	.L_2il0floatpacket.133,@object
	.size	.L_2il0floatpacket.133,8
	.align 8
.L_2il0floatpacket.183:
	.long	0x00000000,0xbff00000
	.type	.L_2il0floatpacket.183,@object
	.size	.L_2il0floatpacket.183,8
	.align 8
.L_2il0floatpacket.184:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.184,@object
	.size	.L_2il0floatpacket.184,8
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
	.4byte 0x0000001c
	.8byte 0x4c507a0100000000
	.4byte 0x10780100
	.2byte 0x000a
	.8byte __gxx_personality_v0
	.4byte 0x08070c00
	.2byte 0x0190
	.4byte 0x0000011c
	.4byte 0x00000044
	.8byte ..___tag_value__Z7mic_sumPdl.1
	.8byte ..___tag_value__Z7mic_sumPdl.79-..___tag_value__Z7mic_sumPdl.1
	.2byte 0x0400
	.4byte ..___tag_value__Z7mic_sumPdl.3-..___tag_value__Z7mic_sumPdl.1
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.5-..___tag_value__Z7mic_sumPdl.3
	.8byte 0x0b8d0a8c08860983
	.4byte 0x0d8f0c8e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.22-..___tag_value__Z7mic_sumPdl.5
	.2byte 0x04cf
	.4byte ..___tag_value__Z7mic_sumPdl.23-..___tag_value__Z7mic_sumPdl.22
	.2byte 0x04ce
	.4byte ..___tag_value__Z7mic_sumPdl.24-..___tag_value__Z7mic_sumPdl.23
	.2byte 0x04cd
	.4byte ..___tag_value__Z7mic_sumPdl.25-..___tag_value__Z7mic_sumPdl.24
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.26-..___tag_value__Z7mic_sumPdl.25
	.2byte 0x04c3
	.4byte ..___tag_value__Z7mic_sumPdl.27-..___tag_value__Z7mic_sumPdl.26
	.2byte 0x04c6
	.4byte ..___tag_value__Z7mic_sumPdl.28-..___tag_value__Z7mic_sumPdl.27
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.29-..___tag_value__Z7mic_sumPdl.28
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.31-..___tag_value__Z7mic_sumPdl.29
	.8byte 0x0b8d0a8c08860983
	.2byte 0x0c8e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.36-..___tag_value__Z7mic_sumPdl.31
	.2byte 0x04ce
	.4byte ..___tag_value__Z7mic_sumPdl.37-..___tag_value__Z7mic_sumPdl.36
	.2byte 0x04cd
	.4byte ..___tag_value__Z7mic_sumPdl.38-..___tag_value__Z7mic_sumPdl.37
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.39-..___tag_value__Z7mic_sumPdl.38
	.2byte 0x04c3
	.4byte ..___tag_value__Z7mic_sumPdl.40-..___tag_value__Z7mic_sumPdl.39
	.2byte 0x04c6
	.4byte ..___tag_value__Z7mic_sumPdl.41-..___tag_value__Z7mic_sumPdl.40
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.42-..___tag_value__Z7mic_sumPdl.41
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.44-..___tag_value__Z7mic_sumPdl.42
	.2byte 0x0a8c
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.45-..___tag_value__Z7mic_sumPdl.44
	.4byte 0x08860983
	.2byte 0x0c8e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.48-..___tag_value__Z7mic_sumPdl.45
	.4byte 0x0d8f0b8d
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.50-..___tag_value__Z7mic_sumPdl.48
	.4byte 0x0401900e
	.4byte ..___tag_value__Z7mic_sumPdl.53-..___tag_value__Z7mic_sumPdl.50
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.56-..___tag_value__Z7mic_sumPdl.53
	.2byte 0x780e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.57-..___tag_value__Z7mic_sumPdl.56
	.4byte 0x0401800e
	.4byte ..___tag_value__Z7mic_sumPdl.60-..___tag_value__Z7mic_sumPdl.57
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.65-..___tag_value__Z7mic_sumPdl.60
	.2byte 0x04cf
	.4byte ..___tag_value__Z7mic_sumPdl.66-..___tag_value__Z7mic_sumPdl.65
	.2byte 0x04ce
	.4byte ..___tag_value__Z7mic_sumPdl.67-..___tag_value__Z7mic_sumPdl.66
	.2byte 0x04cd
	.4byte ..___tag_value__Z7mic_sumPdl.68-..___tag_value__Z7mic_sumPdl.67
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.69-..___tag_value__Z7mic_sumPdl.68
	.2byte 0x04c3
	.4byte ..___tag_value__Z7mic_sumPdl.70-..___tag_value__Z7mic_sumPdl.69
	.2byte 0x04c6
	.4byte ..___tag_value__Z7mic_sumPdl.71-..___tag_value__Z7mic_sumPdl.70
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.72-..___tag_value__Z7mic_sumPdl.71
	.8byte 0x0a8c08860983700e
	.8byte 0x00000d8f0c8e0b8d
	.2byte 0x0000
	.4byte 0x0000011c
	.4byte 0x00000144
	.8byte ..___tag_value__Z13hostmic_scalePdl.80
	.8byte ..___tag_value__Z13hostmic_scalePdl.167-..___tag_value__Z13hostmic_scalePdl.80
	.byte 0x08
	.8byte _Z13hostmic_scalePdl$$LSDA
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.82-..___tag_value__Z13hostmic_scalePdl.80
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.84-..___tag_value__Z13hostmic_scalePdl.82
	.8byte 0x0a8d098c07860883
	.4byte 0x0c8f0b8e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.111-..___tag_value__Z13hostmic_scalePdl.84
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.112-..___tag_value__Z13hostmic_scalePdl.111
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.113-..___tag_value__Z13hostmic_scalePdl.112
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.114-..___tag_value__Z13hostmic_scalePdl.113
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.115-..___tag_value__Z13hostmic_scalePdl.114
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.116-..___tag_value__Z13hostmic_scalePdl.115
	.2byte 0x04c6
	.4byte ..___tag_value__Z13hostmic_scalePdl.117-..___tag_value__Z13hostmic_scalePdl.116
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.118-..___tag_value__Z13hostmic_scalePdl.117
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.120-..___tag_value__Z13hostmic_scalePdl.118
	.2byte 0x0883
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.121-..___tag_value__Z13hostmic_scalePdl.120
	.2byte 0x0786
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.123-..___tag_value__Z13hostmic_scalePdl.121
	.8byte 0x0c8f0b8e0a8d098c
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.132-..___tag_value__Z13hostmic_scalePdl.123
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.133-..___tag_value__Z13hostmic_scalePdl.132
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.134-..___tag_value__Z13hostmic_scalePdl.133
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.135-..___tag_value__Z13hostmic_scalePdl.134
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.136-..___tag_value__Z13hostmic_scalePdl.135
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.137-..___tag_value__Z13hostmic_scalePdl.136
	.2byte 0x04c6
	.4byte ..___tag_value__Z13hostmic_scalePdl.138-..___tag_value__Z13hostmic_scalePdl.137
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.139-..___tag_value__Z13hostmic_scalePdl.138
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.141-..___tag_value__Z13hostmic_scalePdl.139
	.2byte 0x098c
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.142-..___tag_value__Z13hostmic_scalePdl.141
	.8byte 0x0b8e0a8d07860883
	.2byte 0x0c8f
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.147-..___tag_value__Z13hostmic_scalePdl.142
	.4byte 0x0401800e
	.4byte ..___tag_value__Z13hostmic_scalePdl.150-..___tag_value__Z13hostmic_scalePdl.147
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.153-..___tag_value__Z13hostmic_scalePdl.150
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.154-..___tag_value__Z13hostmic_scalePdl.153
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.155-..___tag_value__Z13hostmic_scalePdl.154
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.156-..___tag_value__Z13hostmic_scalePdl.155
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.157-..___tag_value__Z13hostmic_scalePdl.156
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.158-..___tag_value__Z13hostmic_scalePdl.157
	.2byte 0x04c6
	.4byte ..___tag_value__Z13hostmic_scalePdl.159-..___tag_value__Z13hostmic_scalePdl.158
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.160-..___tag_value__Z13hostmic_scalePdl.159
	.8byte 0x098c07860883600e
	.8byte 0x00000c8f0b8e0a8d
	.2byte 0x0000
	.byte 0x00
	.4byte 0x000000cc
	.4byte 0x00000264
	.8byte ..___tag_value__Z12leibniz_initPdl.172
	.8byte ..___tag_value__Z12leibniz_initPdl.226-..___tag_value__Z12leibniz_initPdl.172
	.byte 0x08
	.8byte _Z12leibniz_initPdl$$LSDA
	.byte 0x04
	.4byte ..___tag_value__Z12leibniz_initPdl.174-..___tag_value__Z12leibniz_initPdl.172
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z12leibniz_initPdl.175-..___tag_value__Z12leibniz_initPdl.174
	.8byte 0x0a8d098c07860883
	.4byte 0x0c8f0b8e
	.byte 0x04
	.4byte ..___tag_value__Z12leibniz_initPdl.191-..___tag_value__Z12leibniz_initPdl.175
	.2byte 0x04cf
	.4byte ..___tag_value__Z12leibniz_initPdl.192-..___tag_value__Z12leibniz_initPdl.191
	.2byte 0x04ce
	.4byte ..___tag_value__Z12leibniz_initPdl.193-..___tag_value__Z12leibniz_initPdl.192
	.2byte 0x04cd
	.4byte ..___tag_value__Z12leibniz_initPdl.194-..___tag_value__Z12leibniz_initPdl.193
	.2byte 0x04cc
	.4byte ..___tag_value__Z12leibniz_initPdl.195-..___tag_value__Z12leibniz_initPdl.194
	.2byte 0x04c3
	.4byte ..___tag_value__Z12leibniz_initPdl.196-..___tag_value__Z12leibniz_initPdl.195
	.2byte 0x04c6
	.4byte ..___tag_value__Z12leibniz_initPdl.197-..___tag_value__Z12leibniz_initPdl.196
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z12leibniz_initPdl.198-..___tag_value__Z12leibniz_initPdl.197
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z12leibniz_initPdl.200-..___tag_value__Z12leibniz_initPdl.198
	.2byte 0x098c
	.byte 0x04
	.4byte ..___tag_value__Z12leibniz_initPdl.201-..___tag_value__Z12leibniz_initPdl.200
	.8byte 0x0b8e0a8d07860883
	.2byte 0x0c8f
	.byte 0x04
	.4byte ..___tag_value__Z12leibniz_initPdl.206-..___tag_value__Z12leibniz_initPdl.201
	.4byte 0x0401800e
	.4byte ..___tag_value__Z12leibniz_initPdl.209-..___tag_value__Z12leibniz_initPdl.206
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z12leibniz_initPdl.212-..___tag_value__Z12leibniz_initPdl.209
	.2byte 0x04cf
	.4byte ..___tag_value__Z12leibniz_initPdl.213-..___tag_value__Z12leibniz_initPdl.212
	.2byte 0x04ce
	.4byte ..___tag_value__Z12leibniz_initPdl.214-..___tag_value__Z12leibniz_initPdl.213
	.2byte 0x04cd
	.4byte ..___tag_value__Z12leibniz_initPdl.215-..___tag_value__Z12leibniz_initPdl.214
	.2byte 0x04cc
	.4byte ..___tag_value__Z12leibniz_initPdl.216-..___tag_value__Z12leibniz_initPdl.215
	.2byte 0x04c3
	.4byte ..___tag_value__Z12leibniz_initPdl.217-..___tag_value__Z12leibniz_initPdl.216
	.2byte 0x04c6
	.4byte ..___tag_value__Z12leibniz_initPdl.218-..___tag_value__Z12leibniz_initPdl.217
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z12leibniz_initPdl.219-..___tag_value__Z12leibniz_initPdl.218
	.8byte 0x098c07860883600e
	.8byte 0x00000c8f0b8e0a8d
# End

