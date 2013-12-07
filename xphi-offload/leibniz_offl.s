	.file "leibniz_offl.cpp"
	.text
..TXTST0:
# -- Begin  main, L_main_58__par_loop0_2.58, L_main_77__par_loop4_2.142, L_main_77__par_region5_2.162
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
        subq      $1152, %rsp
        xorl      %edi, %edi
        movq      %rbx, 1000(%rsp)
        movq      %r15, 8(%rsp)
        movq      %r14, 976(%rsp)
        movq      %r13, 984(%rsp)
        movq      %r12, 992(%rsp)
..___tag_value_main.6:
        call      __intel_new_proc_init
..___tag_value_main.7:
..B1.120:
        movl      $.2.13_2_kmpc_loc_struct_pack.9, %edi
        xorl      %esi, %esi
        xorl      %eax, %eax
..___tag_value_main.13:
        call      __kmpc_begin
..___tag_value_main.14:
..B1.2:
        movl      $.L_2__STRING.3, %edi
        call      getenv
..B1.3:
        testq     %rax, %rax
        je        ..B1.103
..B1.4:
        movq      %rax, %rdi
        call      atol
..B1.5:
        movl      %eax, %edi
        call      ompc_set_num_threads
..B1.6:
        call      _Offload_number_of_devices
..B1.123:
        movl      %eax, %r13d
..B1.7:
        movl      $.L_2__STRING.9, %edi
        call      getenv
..B1.124:
        movq      %rax, %r12
..B1.8:
        testq     %r12, %r12
        je        ..B1.93
..B1.9:
        xorl      %ebx, %ebx
        testl     %r13d, %r13d
        jle       ..B1.15
..B1.11:
        movq      %r12, %rdi
        call      atol
..B1.12:
        movl      %eax, %edx
        movl      $2, %edi
        movl      %ebx, %esi
..___tag_value_main.15:
        call      omp_set_num_threads_target
..___tag_value_main.16:
..B1.13:
        incl      %ebx
        cmpl      %r13d, %ebx
        jl        ..B1.11
..B1.15:
        movl      $.L_2__STRING.10, %edi
        movq      $0x17d784000, %rsi
        xorl      %eax, %eax
        movq      $800000000, 1008(%rsp)
..___tag_value_main.17:
        call      printf
..___tag_value_main.18:
..B1.16:
        movq      $0x17d784000, %rdi
        movl      $64, %esi
        call      _mm_malloc
..B1.17:
        movl      $.2.13_2_kmpc_loc_struct_pack.20, %edi
        movq      %rax, 1016(%rsp)
        call      __kmpc_global_thread_num
..B1.128:
        movl      %eax, 1048(%rsp)
        movl      $.2.13_2_kmpc_loc_struct_pack.60, %edi
        xorl      %eax, %eax
..___tag_value_main.19:
        call      __kmpc_ok_to_fork
..___tag_value_main.20:
..B1.18:
        testl     %eax, %eax
        je        ..B1.20
..B1.19:
        movl      $L_main_58__par_loop0_2.58, %edx
        lea       1008(%rsp), %r12
        movl      $.2.13_2_kmpc_loc_struct_pack.60, %edi
        lea       1016(%rsp), %rbx
        pushq     $2
        popq      %rsi
        movq      %r12, %rcx
        movq      %rbx, %r8
        xorl      %eax, %eax
..___tag_value_main.21:
        call      __kmpc_fork_call
..___tag_value_main.22:
        jmp       ..B1.23
..B1.20:
        movl      $.2.13_2_kmpc_loc_struct_pack.60, %edi
        xorl      %eax, %eax
        movl      1048(%rsp), %esi
..___tag_value_main.23:
        call      __kmpc_serialized_parallel
..___tag_value_main.24:
..B1.21:
        movl      $___kmpv_zeromain_0, %esi
        lea       1008(%rsp), %r12
        movq      %r12, %rdx
        lea       1016(%rsp), %rbx
        movq      %rbx, %rcx
        lea       1048(%rsp), %rdi
..___tag_value_main.25:
        call      L_main_58__par_loop0_2.58
..___tag_value_main.26:
..B1.22:
        movl      $.2.13_2_kmpc_loc_struct_pack.60, %edi
        xorl      %eax, %eax
        movl      1048(%rsp), %esi
..___tag_value_main.27:
        call      __kmpc_end_serialized_parallel
..___tag_value_main.28:
..B1.23:
        movl      $.L_2__STRING.11, %edi
        xorl      %eax, %eax
        movq      1016(%rsp), %rsi
..___tag_value_main.29:
        call      printf
..___tag_value_main.30:
..B1.24:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.1, %r8d
        movl      $66, %r9d
        xorl      %eax, %eax
..___tag_value_main.31:
        call      __offload_target_acquire
..___tag_value_main.32:
..B1.25:
        testq     %rax, %rax
        je        ..B1.27
..B1.26:
        movq      1008(%rsp), %rdx
        lea       208(%rsp), %r8
        movl      $128, %r11d
..B1.117:
        movq      -8+.2.13_2__offload_var_desc1_p.91(%r11), %rcx
        movq      -16+.2.13_2__offload_var_desc1_p.91(%r11), %rsi
        movq      -24+.2.13_2__offload_var_desc1_p.91(%r11), %r9
        movq      -32+.2.13_2__offload_var_desc1_p.91(%r11), %r10
        movq      %rcx, -8(%r8,%r11)
        movq      %rsi, -16(%r8,%r11)
        movq      %r9, -24(%r8,%r11)
        movq      %r10, -32(%r8,%r11)
        subq      $32, %r11
        jne       ..B1.117
..B1.116:
        movb      $1, 274(%rsp)
        lea       16(%rsp), %r9
        movb      $0, 275(%rsp)
        lea       (%rsp), %r15
        movl      $64, 276(%rsp)
        movl      $__sd_2inst_string.2, %esi
        movq      %rdx, 304(%rsp)
        xorl      %edx, %edx
        movq      %rbx, 328(%rsp)
        movq      %rax, %rdi
        pushq     %rsp
        pushq     %rdx
        pushq     %rdx
        movq      .2.13_2__offload_var_desc2_p.96(%rip), %r10
        pushq     $2
        popq      %rcx
        movq      8+.2.13_2__offload_var_desc2_p.96(%rip), %r11
        xorl      %eax, %eax
        movq      16+.2.13_2__offload_var_desc2_p.96(%rip), %r13
        movq      24+.2.13_2__offload_var_desc2_p.96(%rip), %r14
        pushq     %rdx
        pushq     $1
        popq      %rdx
        movq      %r10, (%r9)
        movq      %r11, 8(%r9)
        movq      %r13, 16(%r9)
        movq      %r14, 24(%r9)
        movq      %r15, 56(%r8)
..___tag_value_main.33:
        call      __offload_offload
..___tag_value_main.34:
..B1.130:
        addq      $32, %rsp
..B1.27:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.6, %r8d
        movl      $70, %r9d
        xorl      %eax, %eax
..___tag_value_main.35:
        call      __offload_target_acquire
..___tag_value_main.36:
..B1.131:
        movq      %rax, %r15
..B1.28:
        testq     %r15, %r15
        je        ..B1.31
..B1.29:
        movl      $256, %edx
        lea       720(%rsp), %r13
        movq      %r13, %rdi
        lea       .2.13_2__offload_var_desc1_p.113(%rip), %rsi
        movq      1008(%rsp), %r14
        call      _intel_fast_memcpy
..B1.132:
        pushq     $64
        popq      %rdi
        lea       144(%rsp), %r9
..B1.119:
        movq      -8+.2.13_2__offload_var_desc2_p.118(%rdi), %rax
        movq      -16+.2.13_2__offload_var_desc2_p.118(%rdi), %rdx
        movq      -24+.2.13_2__offload_var_desc2_p.118(%rdi), %rcx
        movq      -32+.2.13_2__offload_var_desc2_p.118(%rdi), %rsi
        movq      %rax, -8(%r9,%rdi)
        movq      %rdx, -16(%r9,%rdi)
        movq      %rcx, -24(%r9,%rdi)
        movq      %rsi, -32(%r9,%rdi)
        subq      $32, %rdi
        jne       ..B1.119
..B1.118:
        xorl      %r11d, %r11d
        lea       (%rsp), %r10
        xorl      %edi, %edi
        movl      $__sd_2inst_string.7, %esi
        movq      %r10, 840(%rsp)
        pushq     $4
        popq      %rcx
        movb      %r11b, 850(%rsp)
        movq      %r13, %r8
        movb      %dil, 851(%rsp)
        movq      %r15, %rdi
        movq      %r14, 880(%rsp)
        xorl      %r14d, %r14d
        movq      %rbx, 904(%rsp)
        xorl      %edx, %edx
        movq      %r12, 968(%rsp)
        xorl      %eax, %eax
        pushq     %rsp
        pushq     %r14
        pushq     %r14
        pushq     %r14
        movq      %r10, 56(%r13)
..___tag_value_main.37:
        call      __offload_offload
..___tag_value_main.38:
..B1.133:
        addq      $32, %rsp
..B1.30:
        testl     %eax, %eax
        jne       ..B1.32
..B1.31:
        movq      1016(%rsp), %rdi
        movq      1008(%rsp), %rsi
..___tag_value_main.39:
        call      _Z13hostmic_scalePdl
..___tag_value_main.40:
..B1.32:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.13, %r8d
        movl      $73, %r9d
        xorl      %eax, %eax
..___tag_value_main.41:
        call      __offload_target_acquire
..___tag_value_main.42:
..B1.134:
        movq      %rax, %r15
..B1.33:
        testq     %r15, %r15
        je        ..B1.36
..B1.34:
        movl      $192, %edx
        lea       336(%rsp), %r14
        movq      %r14, %rdi
        lea       .2.13_2__offload_var_desc1_p.135(%rip), %rsi
        movq      1008(%rsp), %r13
        call      _intel_fast_memcpy
..B1.136:
        movq      .2.13_2__offload_var_desc2_p.140(%rip), %r10
        lea       48(%rsp), %r9
        xorl      %r8d, %r8d
        lea       (%rsp), %rsi
        movq      %r10, (%r9)
        xorl      %r10d, %r10d
        movb      %r8b, 402(%rsp)
        movq      %r14, %r8
        movb      %r10b, 403(%rsp)
        movl      $64, 404(%rsp)
        movq      %r13, 432(%rsp)
        xorl      %r13d, %r13d
        movq      %rbx, 456(%rsp)
        movq      %r12, 520(%rsp)
        pushq     %rsp
        pushq     %r13
        movq      16+.2.13_2__offload_var_desc2_p.140(%rip), %rdi
        movq      24+.2.13_2__offload_var_desc2_p.140(%rip), %rax
        movq      32+.2.13_2__offload_var_desc2_p.140(%rip), %rdx
        movq      40+.2.13_2__offload_var_desc2_p.140(%rip), %rcx
        pushq     %r13
        movq      8+.2.13_2__offload_var_desc2_p.140(%rip), %r11
        movq      %rdi, 16(%r9)
        movq      %r15, %rdi
        movq      %rax, 24(%r9)
        xorl      %eax, %eax
        movq      %rdx, 32(%r9)
        xorl      %edx, %edx
        movq      %rcx, 40(%r9)
        pushq     $3
        popq      %rcx
        movq      %rsi, 56(%r14)
        movl      $__sd_2inst_string.14, %esi
        pushq     %r13
        movq      %r11, 8(%r9)
..___tag_value_main.43:
        call      __offload_offload
..___tag_value_main.44:
..B1.135:
        addq      $32, %rsp
..B1.35:
        testl     %eax, %eax
        jne       ..B1.37
..B1.36:
        movq      1016(%rsp), %rdi
        movq      1008(%rsp), %rsi
..___tag_value_main.45:
        call      _Z13hostmic_scalePdl
..___tag_value_main.46:
..B1.37:
        movq      1016(%rsp), %rsi
        movl      $.L_2__STRING.1, %edi
        movq      1008(%rsp), %rdx
        xorl      %eax, %eax
        movq      %rsi, 1024(%rsp)
        movq      %rdx, 1032(%rsp)
..___tag_value_main.47:
        call      printf
..___tag_value_main.48:
..B1.38:
        movl      $.2.13_2_kmpc_loc_struct_pack.144, %edi
        xorl      %eax, %eax
..___tag_value_main.49:
        call      __kmpc_ok_to_fork
..___tag_value_main.50:
..B1.39:
        testl     %eax, %eax
        je        ..B1.41
..B1.40:
        movl      $L_main_77__par_loop4_2.142, %edx
        lea       1032(%rsp), %rcx
        movl      $.2.13_2_kmpc_loc_struct_pack.144, %edi
        lea       1024(%rsp), %r8
        pushq     $2
        popq      %rsi
        xorl      %eax, %eax
..___tag_value_main.51:
        call      __kmpc_fork_call
..___tag_value_main.52:
        jmp       ..B1.44
..B1.41:
        movl      $.2.13_2_kmpc_loc_struct_pack.144, %edi
        xorl      %eax, %eax
        movl      1048(%rsp), %esi
..___tag_value_main.53:
        call      __kmpc_serialized_parallel
..___tag_value_main.54:
..B1.42:
        movl      $___kmpv_zeromain_4, %esi
        lea       1048(%rsp), %rdi
        lea       1032(%rsp), %rdx
        lea       1024(%rsp), %rcx
..___tag_value_main.55:
        call      L_main_77__par_loop4_2.142
..___tag_value_main.56:
..B1.43:
        movl      $.2.13_2_kmpc_loc_struct_pack.144, %edi
        xorl      %eax, %eax
        movl      1048(%rsp), %esi
..___tag_value_main.57:
        call      __kmpc_end_serialized_parallel
..___tag_value_main.58:
..B1.44:
        movl      $.2.13_2_kmpc_loc_struct_pack.164, %edi
        xorl      %eax, %eax
..___tag_value_main.59:
        call      __kmpc_ok_to_fork
..___tag_value_main.60:
..B1.45:
        testl     %eax, %eax
        je        ..B1.47
..B1.46:
        movl      $L_main_77__par_region5_2.162, %edx
        movl      $.2.13_2_kmpc_loc_struct_pack.164, %edi
        xorl      %esi, %esi
        xorl      %eax, %eax
..___tag_value_main.61:
        call      __kmpc_fork_call
..___tag_value_main.62:
        jmp       ..B1.50
..B1.47:
        movl      $.2.13_2_kmpc_loc_struct_pack.164, %edi
        xorl      %eax, %eax
        movl      1048(%rsp), %esi
..___tag_value_main.63:
        call      __kmpc_serialized_parallel
..___tag_value_main.64:
..B1.48:
        movl      $___kmpv_zeromain_5, %esi
        lea       1048(%rsp), %rdi
..___tag_value_main.65:
        call      L_main_77__par_region5_2.162
..___tag_value_main.66:
..B1.49:
        movl      $.2.13_2_kmpc_loc_struct_pack.164, %edi
        xorl      %eax, %eax
        movl      1048(%rsp), %esi
..___tag_value_main.67:
        call      __kmpc_end_serialized_parallel
..___tag_value_main.68:
..B1.50:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.19, %r8d
        movl      $80, %r9d
        xorl      %eax, %eax
..___tag_value_main.69:
        call      __offload_target_acquire
..___tag_value_main.70:
..B1.139:
        movq      %rax, %r15
..B1.51:
        testq     %r15, %r15
        je        ..B1.55
..B1.52:
        movl      $192, %edx
        lea       528(%rsp), %r14
        movq      %r14, %rdi
        lea       .2.13_2__offload_var_desc1_p.189(%rip), %rsi
        movq      1008(%rsp), %r13
        call      _intel_fast_memcpy
..B1.141:
        movq      %rbx, 56(%r14)
        lea       1040(%rsp), %rbx
        movq      %rbx, 648(%rsp)
        lea       96(%rsp), %r9
        movq      %r12, 712(%rsp)
        xorl      %r12d, %r12d
        pushq     %rsp
        pushq     %r12
        movq      16+.2.13_2__offload_var_desc2_p.194(%rip), %rax
        movl      $__sd_2inst_string.20, %esi
        movq      24+.2.13_2__offload_var_desc2_p.194(%rip), %rdi
        movq      %r14, %r8
        movq      32+.2.13_2__offload_var_desc2_p.194(%rip), %rdx
        movq      40+.2.13_2__offload_var_desc2_p.194(%rip), %rcx
        pushq     %r12
        movq      .2.13_2__offload_var_desc2_p.194(%rip), %r10
        movq      8+.2.13_2__offload_var_desc2_p.194(%rip), %r11
        movq      %rax, 16(%r9)
        xorl      %eax, %eax
        movq      %rdi, 24(%r9)
        movq      %r15, %rdi
        movq      %rdx, 32(%r9)
        xorl      %edx, %edx
        movq      %rcx, 40(%r9)
        pushq     $3
        popq      %rcx
        pushq     %r12
        movq      %r10, (%r9)
        movq      %r11, 8(%r9)
        movb      $0, 2(%r14)
        movb      $1, 3(%r14)
        movl      $64, 4(%r14)
        movq      %r13, 32(%r14)
..___tag_value_main.71:
        call      __offload_offload
..___tag_value_main.72:
..B1.140:
        addq      $32, %rsp
..B1.53:
        testl     %eax, %eax
        je        ..B1.55
..B1.54:
        movsd     1040(%rsp), %xmm0
        jmp       ..B1.57
..B1.55:
        movq      1016(%rsp), %rdi
        movq      1008(%rsp), %rsi
..___tag_value_main.73:
        call      _Z7mic_sumPdl
..___tag_value_main.74:
..B1.56:
        movsd     %xmm0, 1040(%rsp)
..B1.57:
        movl      $.L_2__STRING.12, %edi
        movl      $1, %eax
..___tag_value_main.75:
        call      printf
..___tag_value_main.76:
..B1.58:
        movq      1016(%rsp), %rdi
        call      _mm_free
..B1.59:
        movl      $.2.13_2_kmpc_loc_struct_pack.28, %edi
        xorl      %eax, %eax
..___tag_value_main.77:
        call      __kmpc_end
..___tag_value_main.78:
..B1.60:
        movq      8(%rsp), %r15
..___tag_value_main.79:
        xorl      %eax, %eax
        movq      976(%rsp), %r14
..___tag_value_main.80:
        movq      984(%rsp), %r13
..___tag_value_main.81:
        movq      992(%rsp), %r12
..___tag_value_main.82:
        movq      1000(%rsp), %rbx
..___tag_value_main.83:
        movq      %rbp, %rsp
        popq      %rbp
..___tag_value_main.84:
        ret       
..___tag_value_main.86:
L_main_77__par_region5_2.162:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.61:
        pushq     %rbp
..___tag_value_main.88:
        movq      %rsp, %rbp
..___tag_value_main.89:
        andq      $-128, %rsp
        subq      $1152, %rsp
        xorl      %eax, %eax
        movq      %rbx, 1000(%rsp)
..___tag_value_main.91:
        movl      $.2.13_2_kmpc_loc_struct_pack.47, %ebx
        movq      %r12, 992(%rsp)
..___tag_value_main.92:
        movl      (%rdi), %r12d
        movq      %rbx, %rdi
        movl      %r12d, %esi
        movq      %r15, 8(%rsp)
        movq      %r14, 976(%rsp)
        movq      %r13, 984(%rsp)
..___tag_value_main.93:
        call      __kmpc_master
..___tag_value_main.94:
..B1.62:
        cmpl      $1, %eax
        jne       ..B1.66
..B1.63:
        call      omp_get_num_threads
..B1.64:
        movl      $.L_2__STRING.2, %edi
        movl      %eax, %esi
        xorl      %eax, %eax
..___tag_value_main.98:
        call      printf
..___tag_value_main.99:
..B1.65:
        movq      %rbx, %rdi
        movl      %r12d, %esi
        xorl      %eax, %eax
..___tag_value_main.100:
        call      __kmpc_end_master
..___tag_value_main.101:
..B1.66:
        movq      8(%rsp), %r15
..___tag_value_main.102:
        xorl      %eax, %eax
        movq      976(%rsp), %r14
..___tag_value_main.103:
        movq      984(%rsp), %r13
..___tag_value_main.104:
        movq      992(%rsp), %r12
..___tag_value_main.105:
        movq      1000(%rsp), %rbx
..___tag_value_main.106:
        movq      %rbp, %rsp
        popq      %rbp
..___tag_value_main.107:
        ret       
..___tag_value_main.109:
L_main_77__par_loop4_2.142:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B1.67:
        pushq     %rbp
..___tag_value_main.111:
        movq      %rsp, %rbp
..___tag_value_main.112:
        andq      $-128, %rsp
        subq      $1152, %rsp
        movq      %r13, 984(%rsp)
..___tag_value_main.114:
        movq      (%rdx), %r13
        testq     %r13, %r13
        movq      %r12, 992(%rsp)
        movq      %rbx, 1000(%rsp)
..___tag_value_main.115:
        movq      %rcx, %rbx
        movq      %r15, 8(%rsp)
        movq      %r14, 976(%rsp)
..___tag_value_main.117:
        movl      (%rdi), %r12d
        jle       ..B1.78
..B1.68:
        decq      %r13
        movl      $1, %r14d
        movq      $0, (%rsp)
        movl      $.2.13_2_kmpc_loc_struct_pack.144, %edi
        movq      %r13, 16(%rsp)
        movl      %r12d, %esi
        movl      $0, 32(%rsp)
        movl      $34, %edx
        movq      %r14, 24(%rsp)
        addq      $-32, %rsp
        xorl      %eax, %eax
        lea       64(%rsp), %rcx
        lea       32(%rsp), %r8
        lea       48(%rsp), %r9
        lea       56(%rsp), %r10
        movq      %r10, (%rsp)
        movq      %r14, 8(%rsp)
        movq      %r14, 16(%rsp)
..___tag_value_main.119:
        call      __kmpc_for_static_init_8
..___tag_value_main.120:
..B1.145:
        addq      $32, %rsp
..B1.69:
        movq      (%rsp), %rdx
        cmpq      %r13, %rdx
        movq      16(%rsp), %rax
        jg        ..B1.77
..B1.70:
        cmpq      %r13, %rax
        cmovl     %rax, %r13
        cmpq      %r13, %rdx
        jg        ..B1.77
..B1.71:
        subq      %rdx, %r13
        xorl      %edi, %edi
        lea       1(%r13), %rax
        movq      %rax, %rcx
        shrq      $63, %rcx
        lea       1(%rcx,%r13), %rsi
        xorl      %ecx, %ecx
        sarq      $1, %rsi
        testq     %rsi, %rsi
        jbe       ..B1.75
..B1.72:
        movsd     .L_2il0floatpacket.206(%rip), %xmm0
..B1.73:
        movq      (%rbx), %r8
        incq      %rdi
        lea       (%r8,%rdx,8), %r9
        movsd     (%r9,%rcx), %xmm1
        mulsd     %xmm0, %xmm1
        movsd     %xmm1, (%r9,%rcx)
        movq      (%rbx), %r10
        lea       (%r10,%rdx,8), %r11
        movsd     8(%r11,%rcx), %xmm2
        mulsd     %xmm0, %xmm2
        movsd     %xmm2, 8(%r11,%rcx)
        addq      $16, %rcx
        cmpq      %rsi, %rdi
        jb        ..B1.73
..B1.74:
        lea       1(,%rdi,2), %r14
..B1.75:
        lea       -1(%r14), %rcx
        cmpq      %rcx, %rax
        jbe       ..B1.77
..B1.76:
        addq      %rdx, %r14
        movq      (%rbx), %rax
        movsd     .L_2il0floatpacket.206(%rip), %xmm0
        mulsd     -8(%rax,%r14,8), %xmm0
        movsd     %xmm0, -8(%rax,%r14,8)
..B1.77:
        movl      $.2.13_2_kmpc_loc_struct_pack.144, %edi
        movl      %r12d, %esi
        xorl      %eax, %eax
..___tag_value_main.121:
        call      __kmpc_for_static_fini
..___tag_value_main.122:
..B1.78:
        movq      8(%rsp), %r15
..___tag_value_main.123:
        xorl      %eax, %eax
        movq      976(%rsp), %r14
..___tag_value_main.124:
        movq      984(%rsp), %r13
..___tag_value_main.125:
        movq      992(%rsp), %r12
..___tag_value_main.126:
        movq      1000(%rsp), %rbx
..___tag_value_main.127:
        movq      %rbp, %rsp
        popq      %rbp
..___tag_value_main.128:
        ret       
..___tag_value_main.130:
L_main_58__par_loop0_2.58:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B1.79:
        pushq     %rbp
..___tag_value_main.132:
        movq      %rsp, %rbp
..___tag_value_main.133:
        andq      $-128, %rsp
        subq      $1152, %rsp
        movq      %r12, 992(%rsp)
..___tag_value_main.135:
        movq      (%rdx), %r12
        testq     %r12, %r12
        movq      %rbx, 1000(%rsp)
        movq      %r15, 8(%rsp)
        movq      %r14, 976(%rsp)
        movq      %r13, 984(%rsp)
..___tag_value_main.136:
        movq      %rcx, %r13
        movl      (%rdi), %ebx
        jle       ..B1.92
..B1.80:
        decq      %r12
        movl      $2, %r11d
        movq      $0, (%rsp)
        movl      $.2.13_2_kmpc_loc_struct_pack.60, %edi
        movq      %r12, 16(%rsp)
        movl      %ebx, %esi
        movl      $0, 32(%rsp)
        movl      $34, %edx
        movq      %r11, 24(%rsp)
        addq      $-32, %rsp
        xorl      %eax, %eax
        lea       64(%rsp), %rcx
        lea       32(%rsp), %r8
        lea       48(%rsp), %r9
        lea       56(%rsp), %r10
        movq      %r10, (%rsp)
        movq      %r11, 8(%rsp)
        movq      $1, 16(%rsp)
..___tag_value_main.140:
        call      __kmpc_for_static_init_8
..___tag_value_main.141:
..B1.146:
        addq      $32, %rsp
..B1.81:
        movq      (%rsp), %r9
        cmpq      %r12, %r9
        movq      16(%rsp), %rax
        jg        ..B1.91
..B1.82:
        cmpq      %r12, %rax
        cmovl     %rax, %r12
        cmpq      %r12, %r9
        jg        ..B1.91
..B1.83:
        subq      %r9, %r12
        movq      (%r13), %r8
        lea       2(%r12), %rax
        shrq      $63, %rax
        lea       2(%rax,%r12), %rcx
        sarq      $1, %rcx
        cmpq      $8, %rcx
        jl        ..B1.113
..B1.84:
        movq      %rcx, %rdx
        lea       1(,%r9,2), %rax
        movdqa    .L_2il0floatpacket.207(%rip), %xmm1
        lea       3(,%r9,2), %rsi
        andq      $-8, %rdx
        lea       (%r8,%r9,8), %rdi
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
..B1.85:
        movdqa    %xmm4, %xmm7
        movdqa    %xmm6, %xmm9
        movd      %xmm4, %r10
        addq      $8, %rsi
        psrldq    $8, %xmm7
        psrldq    $8, %xmm9
        movd      %xmm7, %r11
        movd      %xmm6, %r12
        movd      %xmm9, %r13
        movaps    .L_2il0floatpacket.208(%rip), %xmm11
        movaps    .L_2il0floatpacket.209(%rip), %xmm12
        cvtsi2sdq %r10, %xmm0
        cvtsi2sdq %r11, %xmm5
        cvtsi2sdq %r12, %xmm3
        cvtsi2sdq %r13, %xmm2
        paddq     %xmm1, %xmm4
        paddq     %xmm1, %xmm6
        movd      %xmm4, %r14
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
        movd      %xmm14, %r15
        psrldq    $8, %xmm7
        paddq     %xmm1, %xmm4
        movd      %xmm6, %r10
        movd      %xmm7, %r11
        unpckhpd  %xmm12, %xmm13
        movsd     %xmm12, 8(%rax,%rdi)
        movdqa    %xmm4, %xmm12
        cvtsi2sdq %r14, %xmm0
        cvtsi2sdq %r15, %xmm5
        cvtsi2sdq %r10, %xmm3
        cvtsi2sdq %r11, %xmm2
        movd      %xmm4, %r12
        paddq     %xmm1, %xmm6
        paddq     %xmm1, %xmm4
        movd      %xmm6, %r14
        movaps    %xmm0, %xmm15
        movaps    %xmm3, %xmm8
        unpcklpd  %xmm5, %xmm15
        movdqa    %xmm6, %xmm14
        movaps    .L_2il0floatpacket.208(%rip), %xmm9
        divpd     %xmm15, %xmm9
        unpcklpd  %xmm2, %xmm8
        movaps    .L_2il0floatpacket.209(%rip), %xmm10
        psrldq    $8, %xmm12
        divpd     %xmm8, %xmm10
        movd      %xmm12, %r13
        psrldq    $8, %xmm14
        movsd     %xmm13, 16(%rax,%rdi)
        cvtsi2sdq %r12, %xmm0
        cvtsi2sdq %r13, %xmm5
        cvtsi2sdq %r14, %xmm3
        movd      %xmm14, %r15
        paddq     %xmm1, %xmm6
        movd      %xmm4, %r10
        movhpd    %xmm13, 24(%rax,%rdi)
        movaps    %xmm0, %xmm13
        unpcklpd  %xmm5, %xmm13
        movdqa    %xmm6, %xmm12
        cvtsi2sdq %r15, %xmm2
        cvtsi2sdq %r10, %xmm0
        movd      %xmm6, %r12
        paddq     %xmm1, %xmm6
        movaps    .L_2il0floatpacket.208(%rip), %xmm7
        divpd     %xmm13, %xmm7
        movaps    %xmm3, %xmm13
        unpcklpd  %xmm2, %xmm13
        movaps    .L_2il0floatpacket.209(%rip), %xmm8
        divpd     %xmm13, %xmm8
        movsd     %xmm11, (%rax,%rdi)
        movaps    %xmm9, %xmm11
        unpckhpd  %xmm10, %xmm11
        movsd     %xmm10, 40(%rax,%rdi)
        movdqa    %xmm4, %xmm10
        psrldq    $8, %xmm10
        movd      %xmm10, %r11
        psrldq    $8, %xmm12
        movsd     %xmm11, 48(%rax,%rdi)
        movd      %xmm12, %r13
        movhpd    %xmm11, 56(%rax,%rdi)
        movaps    %xmm0, %xmm11
        movsd     %xmm7, 64(%rax,%rdi)
        cvtsi2sdq %r11, %xmm5
        cvtsi2sdq %r12, %xmm3
        cvtsi2sdq %r13, %xmm2
        paddq     %xmm1, %xmm4
        movsd     %xmm9, 32(%rax,%rdi)
        movaps    %xmm7, %xmm9
        unpcklpd  %xmm5, %xmm11
        movaps    %xmm3, %xmm15
        movaps    .L_2il0floatpacket.208(%rip), %xmm7
        movsd     %xmm8, 72(%rax,%rdi)
        unpckhpd  %xmm8, %xmm9
        divpd     %xmm11, %xmm7
        unpcklpd  %xmm2, %xmm15
        movaps    .L_2il0floatpacket.209(%rip), %xmm8
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
        jb        ..B1.85
..B1.87:
        movq      %rdx, %rdi
        shlq      $4, %rdi
        cmpq      %rcx, %rdx
        jae       ..B1.91
..B1.88:
        lea       (%r9,%r9), %rsi
        lea       (%r8,%r9,8), %rax
        .align    16,0x90
..B1.89:
        pxor      %xmm0, %xmm0
        lea       (%rsi,%rdx,4), %r9
        pxor      %xmm2, %xmm2
        lea       1(%r9), %r8
        addq      $3, %r9
        incq      %rdx
        cvtsi2sdq %r8, %xmm0
        cvtsi2sdq %r9, %xmm2
        movsd     .L_2il0floatpacket.211(%rip), %xmm1
        movsd     .L_2il0floatpacket.210(%rip), %xmm3
        divsd     %xmm0, %xmm1
        divsd     %xmm2, %xmm3
        movsd     %xmm1, (%rdi,%rax)
        movsd     %xmm3, 8(%rdi,%rax)
        addq      $16, %rdi
        cmpq      %rcx, %rdx
        jb        ..B1.89
..B1.91:
        movl      $.2.13_2_kmpc_loc_struct_pack.60, %edi
        movl      %ebx, %esi
        xorl      %eax, %eax
..___tag_value_main.142:
        call      __kmpc_for_static_fini
..___tag_value_main.143:
..B1.92:
        movq      8(%rsp), %r15
..___tag_value_main.144:
        xorl      %eax, %eax
        movq      976(%rsp), %r14
..___tag_value_main.145:
        movq      984(%rsp), %r13
..___tag_value_main.146:
        movq      992(%rsp), %r12
..___tag_value_main.147:
        movq      1000(%rsp), %rbx
..___tag_value_main.148:
        movq      %rbp, %rsp
        popq      %rbp
..___tag_value_main.149:
        ret       
..___tag_value_main.151:
..B1.93:
        movl      $_ZSt4cout, %edi
        movl      $.L_2__STRING.4, %esi
..___tag_value_main.158:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value_main.159:
..B1.94:
        movq      %rax, %rdi
        movl      $.L_2__STRING.5, %esi
..___tag_value_main.160:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value_main.161:
..B1.95:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value_main.162:
        call      _ZNSolsEPFRSoS_E
..___tag_value_main.163:
..B1.96:
        movq      %rax, %rdi
        movl      $.L_2__STRING.6, %esi
..___tag_value_main.164:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value_main.165:
..B1.97:
        movq      %rax, %rdi
        movl      $.L_2__STRING.7, %esi
..___tag_value_main.166:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value_main.167:
..B1.98:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value_main.168:
        call      _ZNSolsEPFRSoS_E
..___tag_value_main.169:
..B1.99:
        movq      %rax, %rdi
        movl      $.L_2__STRING.8, %esi
..___tag_value_main.170:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value_main.171:
..B1.100:
        movq      %rax, %rdi
        movl      $45, %esi
..___tag_value_main.172:
        call      _ZNSolsEi
..___tag_value_main.173:
..B1.101:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value_main.174:
        call      _ZNSolsEPFRSoS_E
..___tag_value_main.175:
..B1.102:
        int       $5
..B1.103:
        movl      $_ZSt4cout, %edi
        movl      $.L_2__STRING.4, %esi
..___tag_value_main.176:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value_main.177:
..B1.104:
        movq      %rax, %rdi
        movl      $.L_2__STRING.5, %esi
..___tag_value_main.178:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value_main.179:
..B1.105:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value_main.180:
        call      _ZNSolsEPFRSoS_E
..___tag_value_main.181:
..B1.106:
        movq      %rax, %rdi
        movl      $.L_2__STRING.6, %esi
..___tag_value_main.182:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value_main.183:
..B1.107:
        movq      %rax, %rdi
        movl      $.L_2__STRING.7, %esi
..___tag_value_main.184:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value_main.185:
..B1.108:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value_main.186:
        call      _ZNSolsEPFRSoS_E
..___tag_value_main.187:
..B1.109:
        movq      %rax, %rdi
        movl      $.L_2__STRING.8, %esi
..___tag_value_main.188:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value_main.189:
..B1.110:
        movq      %rax, %rdi
        movl      $40, %esi
..___tag_value_main.190:
        call      _ZNSolsEi
..___tag_value_main.191:
        jmp       ..B1.101
..B1.113:
        xorl      %edx, %edx
        jmp       ..B1.87
        .align    16,0x90
..___tag_value_main.192:
	.type	main,@function
	.size	main,.-main
	.section .gcc_except_table, "a"
	.align 4
main$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value_main.196 - ..___tag_value_main.195
..___tag_value_main.195:
	.byte	1
	.uleb128	..___tag_value_main.194 - ..___tag_value_main.193
..___tag_value_main.193:
	.uleb128	..___tag_value_main.6 - ..___tag_value_main.1
	.uleb128	..___tag_value_main.18 - ..___tag_value_main.6
	.byte	0
	.byte	0
	.uleb128	..___tag_value_main.29 - ..___tag_value_main.1
	.uleb128	..___tag_value_main.30 - ..___tag_value_main.29
	.byte	0
	.byte	0
	.uleb128	..___tag_value_main.47 - ..___tag_value_main.1
	.uleb128	..___tag_value_main.48 - ..___tag_value_main.47
	.byte	0
	.byte	0
	.uleb128	..___tag_value_main.75 - ..___tag_value_main.1
	.uleb128	..___tag_value_main.78 - ..___tag_value_main.75
	.byte	0
	.byte	0
	.uleb128	..___tag_value_main.158 - ..___tag_value_main.1
	.uleb128	..___tag_value_main.191 - ..___tag_value_main.158
	.byte	0
	.byte	0
..___tag_value_main.194:
	.long	0x00000000,0x00000000
..___tag_value_main.196:
	.data
	.align 8
	.align 8
.2.13_2__offload_var_desc1_p.91:
	.byte	68
	.byte	2
	.byte	1
	.byte	1
	.long	0
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	34
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.align 8
.2.13_2__offload_var_desc2_p.96:
	.quad	__sd_2inst_string.3
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.4
	.long	0x00000000,0x00000000
	.align 8
.2.13_2__offload_var_desc1_p.113:
	.byte	68
	.byte	1
	.byte	1
	.byte	1
	.long	0
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	68
	.byte	2
	.byte	1
	.byte	1
	.long	0
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.align 8
.2.13_2__offload_var_desc2_p.118:
	.quad	__sd_2inst_string.8
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.9
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.10
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.11
	.long	0x00000000,0x00000000
	.align 8
.2.13_2__offload_var_desc1_p.135:
	.byte	68
	.byte	1
	.byte	1
	.byte	1
	.long	0
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	34
	.byte	2
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.align 8
.2.13_2__offload_var_desc2_p.140:
	.quad	__sd_2inst_string.15
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.16
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.17
	.long	0x00000000,0x00000000
	.align 8
.2.13_2__offload_var_desc1_p.189:
	.byte	34
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	2
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.byte	17
	.byte	1
	.byte	1
	.byte	1
	.long	8
	.long	0
	.long	0
	.long	0x00000000,0x00000000
	.long	0x00000008,0x00000000
	.long	0x00000001,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.long	0x00000000,0x00000000
	.align 8
.2.13_2__offload_var_desc2_p.194:
	.quad	__sd_2inst_string.21
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.22
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.23
	.long	0x00000000,0x00000000
	.align 4
.2.13_2_kmpc_loc_struct_pack.9:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.13_2__kmpc_loc_pack.8
	.align 4
.2.13_2__kmpc_loc_pack.8:
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
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	53
	.byte	48
	.byte	59
	.byte	53
	.byte	48
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.13_2_kmpc_loc_struct_pack.20:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.13_2__kmpc_loc_pack.19
	.align 4
.2.13_2__kmpc_loc_pack.19:
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
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	53
	.byte	56
	.byte	59
	.byte	53
	.byte	56
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.13_2_kmpc_loc_struct_pack.60:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.13_2__kmpc_loc_pack.59
	.align 4
.2.13_2__kmpc_loc_pack.59:
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
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	53
	.byte	56
	.byte	59
	.byte	54
	.byte	50
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.13_2_kmpc_loc_struct_pack.144:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.13_2__kmpc_loc_pack.143
	.align 4
.2.13_2__kmpc_loc_pack.143:
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
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	55
	.byte	55
	.byte	59
	.byte	55
	.byte	55
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.13_2_kmpc_loc_struct_pack.164:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.13_2__kmpc_loc_pack.163
	.align 4
.2.13_2__kmpc_loc_pack.163:
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
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	55
	.byte	55
	.byte	59
	.byte	55
	.byte	55
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.13_2_kmpc_loc_struct_pack.28:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.13_2__kmpc_loc_pack.27
	.align 4
.2.13_2__kmpc_loc_pack.27:
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
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	56
	.byte	55
	.byte	59
	.byte	56
	.byte	55
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.13_2_kmpc_loc_struct_pack.47:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.13_2__kmpc_loc_pack.46
	.align 4
.2.13_2__kmpc_loc_pack.46:
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
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	55
	.byte	55
	.byte	59
	.byte	55
	.byte	55
	.byte	59
	.byte	59
	.section .rodata, "a"
	.align 16
	.align 4
__sd_2inst_string.1:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
__sd_2inst_string.3:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	115
	.byte	104
	.byte	97
	.byte	100
	.byte	111
	.byte	119
	.byte	95
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.4:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.2:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	54
	.byte	54
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
	.align 4
__sd_2inst_string.6:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
__sd_2inst_string.8:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	115
	.byte	104
	.byte	97
	.byte	100
	.byte	111
	.byte	119
	.byte	95
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.9:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	115
	.byte	104
	.byte	97
	.byte	100
	.byte	111
	.byte	119
	.byte	95
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.10:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.11:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.7:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	55
	.byte	48
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
	.align 4
__sd_2inst_string.13:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
__sd_2inst_string.15:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	115
	.byte	104
	.byte	97
	.byte	100
	.byte	111
	.byte	119
	.byte	95
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.16:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.17:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.14:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	55
	.byte	51
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
	.align 4
__sd_2inst_string.19:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
__sd_2inst_string.21:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.22:
	.byte	115
	.byte	117
	.byte	109
	.byte	0
	.align 4
__sd_2inst_string.23:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.20:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	56
	.byte	48
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
	.align 4
__sd_2inst_string.0:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	54
	.byte	54
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
	.align 4
__sd_2inst_string.5:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	55
	.byte	48
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
	.align 4
__sd_2inst_string.12:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	55
	.byte	51
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
	.align 4
__sd_2inst_string.18:
	.byte	95
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	111
	.byte	97
	.byte	100
	.byte	95
	.byte	101
	.byte	110
	.byte	116
	.byte	114
	.byte	121
	.byte	95
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	95
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	56
	.byte	48
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	0
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_offl_cpp_66main_$entry,comdat
	.align 16
__offload_entry_leibniz_offl_cpp_66main_$entry:
	.type	__offload_entry_leibniz_offl_cpp_66main_$entry,@object
	.size	__offload_entry_leibniz_offl_cpp_66main_$entry,16
	.quad	__sd_2inst_string.0
	.quad	__sd_2inst_string.0
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_offl_cpp_70main_$entry,comdat
	.align 16
__offload_entry_leibniz_offl_cpp_70main_$entry:
	.type	__offload_entry_leibniz_offl_cpp_70main_$entry,@object
	.size	__offload_entry_leibniz_offl_cpp_70main_$entry,16
	.quad	__sd_2inst_string.5
	.quad	__sd_2inst_string.5
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_offl_cpp_73main_$entry,comdat
	.align 16
__offload_entry_leibniz_offl_cpp_73main_$entry:
	.type	__offload_entry_leibniz_offl_cpp_73main_$entry,@object
	.size	__offload_entry_leibniz_offl_cpp_73main_$entry,16
	.quad	__sd_2inst_string.12
	.quad	__sd_2inst_string.12
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_offl_cpp_80main_$entry,comdat
	.align 16
__offload_entry_leibniz_offl_cpp_80main_$entry:
	.type	__offload_entry_leibniz_offl_cpp_80main_$entry,@object
	.size	__offload_entry_leibniz_offl_cpp_80main_$entry,16
	.quad	__sd_2inst_string.18
	.quad	__sd_2inst_string.18
	.data
# -- End  main, L_main_58__par_loop0_2.58, L_main_77__par_loop4_2.142, L_main_77__par_region5_2.162
	.text
# -- Begin  _Z13hostmic_scalePdl, L__Z13hostmic_scalePdl_29__par_loop0_2.239, L__Z13hostmic_scalePdl_33__par_region1_2.259
       .align    16,0x90
	.globl _Z13hostmic_scalePdl
_Z13hostmic_scalePdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.1:
..___tag_value__Z13hostmic_scalePdl.197:
        subq      $88, %rsp
..___tag_value__Z13hostmic_scalePdl.199:
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
..___tag_value__Z13hostmic_scalePdl.200:
        call      printf
..___tag_value__Z13hostmic_scalePdl.201:
..B2.2:
        movl      $.2.14_2_kmpc_loc_struct_pack.224, %edi
        call      __kmpc_global_thread_num
..B2.49:
        movl      %eax, 64(%rsp)
        movl      $.2.14_2_kmpc_loc_struct_pack.241, %edi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.208:
        call      __kmpc_ok_to_fork
..___tag_value__Z13hostmic_scalePdl.209:
..B2.3:
        testl     %eax, %eax
        je        ..B2.5
..B2.4:
        movl      $L__Z13hostmic_scalePdl_29__par_loop0_2.239, %edx
        lea       56(%rsp), %rcx
        movl      $.2.14_2_kmpc_loc_struct_pack.241, %edi
        lea       48(%rsp), %r8
        pushq     $2
        popq      %rsi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.210:
        call      __kmpc_fork_call
..___tag_value__Z13hostmic_scalePdl.211:
        jmp       ..B2.8
..B2.5:
        movl      $.2.14_2_kmpc_loc_struct_pack.241, %edi
        xorl      %eax, %eax
        movl      64(%rsp), %esi
..___tag_value__Z13hostmic_scalePdl.212:
        call      __kmpc_serialized_parallel
..___tag_value__Z13hostmic_scalePdl.213:
..B2.6:
        movl      $___kmpv_zero_Z13hostmic_scalePdl_0, %esi
        lea       64(%rsp), %rdi
        lea       56(%rsp), %rdx
        lea       48(%rsp), %rcx
..___tag_value__Z13hostmic_scalePdl.214:
        call      L__Z13hostmic_scalePdl_29__par_loop0_2.239
..___tag_value__Z13hostmic_scalePdl.215:
..B2.7:
        movl      $.2.14_2_kmpc_loc_struct_pack.241, %edi
        xorl      %eax, %eax
        movl      64(%rsp), %esi
..___tag_value__Z13hostmic_scalePdl.216:
        call      __kmpc_end_serialized_parallel
..___tag_value__Z13hostmic_scalePdl.217:
..B2.8:
        movl      $.2.14_2_kmpc_loc_struct_pack.261, %edi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.218:
        call      __kmpc_ok_to_fork
..___tag_value__Z13hostmic_scalePdl.219:
..B2.9:
        testl     %eax, %eax
        je        ..B2.11
..B2.10:
        movl      $L__Z13hostmic_scalePdl_33__par_region1_2.259, %edx
        movl      $.2.14_2_kmpc_loc_struct_pack.261, %edi
        xorl      %esi, %esi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.220:
        call      __kmpc_fork_call
..___tag_value__Z13hostmic_scalePdl.221:
        jmp       ..B2.14
..B2.11:
        movl      $.2.14_2_kmpc_loc_struct_pack.261, %edi
        xorl      %eax, %eax
        movl      64(%rsp), %esi
..___tag_value__Z13hostmic_scalePdl.222:
        call      __kmpc_serialized_parallel
..___tag_value__Z13hostmic_scalePdl.223:
..B2.12:
        movl      $___kmpv_zero_Z13hostmic_scalePdl_1, %esi
        lea       64(%rsp), %rdi
..___tag_value__Z13hostmic_scalePdl.224:
        call      L__Z13hostmic_scalePdl_33__par_region1_2.259
..___tag_value__Z13hostmic_scalePdl.225:
..B2.13:
        movl      $.2.14_2_kmpc_loc_struct_pack.261, %edi
        xorl      %eax, %eax
        movl      64(%rsp), %esi
..___tag_value__Z13hostmic_scalePdl.226:
        call      __kmpc_end_serialized_parallel
..___tag_value__Z13hostmic_scalePdl.227:
..B2.14:
        movq      (%rsp), %r15
..___tag_value__Z13hostmic_scalePdl.228:
        movq      8(%rsp), %r14
..___tag_value__Z13hostmic_scalePdl.229:
        movq      16(%rsp), %r13
..___tag_value__Z13hostmic_scalePdl.230:
        movq      24(%rsp), %r12
..___tag_value__Z13hostmic_scalePdl.231:
        movq      32(%rsp), %rbx
..___tag_value__Z13hostmic_scalePdl.232:
        movq      40(%rsp), %rbp
..___tag_value__Z13hostmic_scalePdl.233:
        addq      $88, %rsp
..___tag_value__Z13hostmic_scalePdl.234:
        ret       
..___tag_value__Z13hostmic_scalePdl.235:
L__Z13hostmic_scalePdl_33__par_region1_2.259:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.15:
        subq      $88, %rsp
        xorl      %eax, %eax
        movq      %rbx, 32(%rsp)
..___tag_value__Z13hostmic_scalePdl.237:
        movl      $.2.14_2_kmpc_loc_struct_pack.232, %ebx
        movq      %rbp, 40(%rsp)
..___tag_value__Z13hostmic_scalePdl.238:
        movl      (%rdi), %ebp
        movq      %rbx, %rdi
        movl      %ebp, %esi
        movq      %r15, (%rsp)
        movq      %r14, 8(%rsp)
        movq      %r13, 16(%rsp)
        movq      %r12, 24(%rsp)
..___tag_value__Z13hostmic_scalePdl.239:
        call      __kmpc_master
..___tag_value__Z13hostmic_scalePdl.240:
..B2.16:
        cmpl      $1, %eax
        jne       ..B2.20
..B2.17:
        call      omp_get_num_threads
..B2.18:
        movl      $.L_2__STRING.2, %edi
        movl      %eax, %esi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.245:
        call      printf
..___tag_value__Z13hostmic_scalePdl.246:
..B2.19:
        movq      %rbx, %rdi
        movl      %ebp, %esi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.247:
        call      __kmpc_end_master
..___tag_value__Z13hostmic_scalePdl.248:
..B2.20:
        movq      (%rsp), %r15
..___tag_value__Z13hostmic_scalePdl.249:
        movq      8(%rsp), %r14
..___tag_value__Z13hostmic_scalePdl.250:
        movq      16(%rsp), %r13
..___tag_value__Z13hostmic_scalePdl.251:
        movq      24(%rsp), %r12
..___tag_value__Z13hostmic_scalePdl.252:
        movq      32(%rsp), %rbx
..___tag_value__Z13hostmic_scalePdl.253:
        movq      40(%rsp), %rbp
..___tag_value__Z13hostmic_scalePdl.254:
        addq      $88, %rsp
..___tag_value__Z13hostmic_scalePdl.255:
        ret       
..___tag_value__Z13hostmic_scalePdl.256:
L__Z13hostmic_scalePdl_29__par_loop0_2.239:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
..B2.21:
        subq      $88, %rsp
        movq      %r12, 24(%rsp)
..___tag_value__Z13hostmic_scalePdl.258:
        movq      (%rdx), %r12
        testq     %r12, %r12
        movq      %rbp, 40(%rsp)
        movq      %r13, 16(%rsp)
        movq      %rbx, 32(%rsp)
        movq      %r15, (%rsp)
        movq      %r14, 8(%rsp)
..___tag_value__Z13hostmic_scalePdl.259:
        movl      (%rdi), %r13d
        movq      (%rcx), %rbp
        jle       ..B2.42
..B2.22:
        decq      %r12
        movl      $1, %ebx
        movq      $0, 48(%rsp)
        movl      $.2.14_2_kmpc_loc_struct_pack.241, %edi
        movq      %r12, 56(%rsp)
        movl      %r13d, %esi
        movl      $0, 72(%rsp)
        movl      $34, %edx
        movq      %rbx, 64(%rsp)
        addq      $-32, %rsp
..___tag_value__Z13hostmic_scalePdl.264:
        xorl      %eax, %eax
        lea       104(%rsp), %rcx
        lea       80(%rsp), %r8
        lea       88(%rsp), %r9
        lea       96(%rsp), %r10
        movq      %r10, (%rsp)
        movq      %rbx, 8(%rsp)
        movq      %rbx, 16(%rsp)
..___tag_value__Z13hostmic_scalePdl.265:
        call      __kmpc_for_static_init_8
..___tag_value__Z13hostmic_scalePdl.266:
..B2.53:
        addq      $32, %rsp
..___tag_value__Z13hostmic_scalePdl.267:
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
        movsd     .L_2il0floatpacket.278(%rip), %xmm0
..B2.32:
        movsd     (%rsi,%rax,8), %xmm1
        mulsd     %xmm0, %xmm1
        movsd     %xmm1, (%rsi,%rax,8)
        incq      %rax
        cmpq      %rcx, %rax
        jb        ..B2.32
..B2.34:
        movaps    .L_2il0floatpacket.279(%rip), %xmm0
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
        movsd     .L_2il0floatpacket.278(%rip), %xmm0
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
        movl      $.2.14_2_kmpc_loc_struct_pack.241, %edi
        movl      %r13d, %esi
        xorl      %eax, %eax
..___tag_value__Z13hostmic_scalePdl.268:
        call      __kmpc_for_static_fini
..___tag_value__Z13hostmic_scalePdl.269:
..B2.42:
        movq      (%rsp), %r15
..___tag_value__Z13hostmic_scalePdl.270:
        movq      8(%rsp), %r14
..___tag_value__Z13hostmic_scalePdl.271:
        movq      16(%rsp), %r13
..___tag_value__Z13hostmic_scalePdl.272:
        movq      24(%rsp), %r12
..___tag_value__Z13hostmic_scalePdl.273:
        movq      32(%rsp), %rbx
..___tag_value__Z13hostmic_scalePdl.274:
        movq      40(%rsp), %rbp
..___tag_value__Z13hostmic_scalePdl.275:
        addq      $88, %rsp
..___tag_value__Z13hostmic_scalePdl.276:
        ret       
..___tag_value__Z13hostmic_scalePdl.277:
..B2.43:
        xorl      %edx, %edx
        jmp       ..B2.37
        .align    16,0x90
..___tag_value__Z13hostmic_scalePdl.284:
	.type	_Z13hostmic_scalePdl,@function
	.size	_Z13hostmic_scalePdl,.-_Z13hostmic_scalePdl
	.section .gcc_except_table, "a"
	.align 4
_Z13hostmic_scalePdl$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value__Z13hostmic_scalePdl.288 - ..___tag_value__Z13hostmic_scalePdl.287
..___tag_value__Z13hostmic_scalePdl.287:
	.byte	1
	.uleb128	..___tag_value__Z13hostmic_scalePdl.286 - ..___tag_value__Z13hostmic_scalePdl.285
..___tag_value__Z13hostmic_scalePdl.285:
	.uleb128	..___tag_value__Z13hostmic_scalePdl.200 - ..___tag_value__Z13hostmic_scalePdl.197
	.uleb128	..___tag_value__Z13hostmic_scalePdl.201 - ..___tag_value__Z13hostmic_scalePdl.200
	.byte	0
	.byte	0
..___tag_value__Z13hostmic_scalePdl.286:
	.long	0x00000000,0x00000000
..___tag_value__Z13hostmic_scalePdl.288:
	.data
	.space 3, 0x00 	# pad
	.align 4
.2.14_2_kmpc_loc_struct_pack.224:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.14_2__kmpc_loc_pack.223
	.align 4
.2.14_2__kmpc_loc_pack.223:
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
	.byte	57
	.byte	59
	.byte	50
	.byte	57
	.byte	59
	.byte	59
	.space 2, 0x00 	# pad
	.align 4
.2.14_2_kmpc_loc_struct_pack.241:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.14_2__kmpc_loc_pack.240
	.align 4
.2.14_2__kmpc_loc_pack.240:
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
	.byte	57
	.byte	59
	.byte	51
	.byte	53
	.byte	59
	.byte	59
	.space 2, 0x00 	# pad
	.align 4
.2.14_2_kmpc_loc_struct_pack.261:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.14_2__kmpc_loc_pack.260
	.align 4
.2.14_2__kmpc_loc_pack.260:
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
	.byte	51
	.byte	59
	.byte	51
	.byte	53
	.byte	59
	.byte	59
	.space 2, 0x00 	# pad
	.align 4
.2.14_2_kmpc_loc_struct_pack.232:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.14_2__kmpc_loc_pack.231
	.align 4
.2.14_2__kmpc_loc_pack.231:
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
	.byte	52
	.byte	59
	.byte	51
	.byte	53
	.byte	59
	.byte	59
	.data
# -- End  _Z13hostmic_scalePdl, L__Z13hostmic_scalePdl_29__par_loop0_2.239, L__Z13hostmic_scalePdl_33__par_region1_2.259
	.text
# -- Begin  _Z7mic_sumPdl, L__Z7mic_sumPdl_17__par_loop0_2.299, L__Z7mic_sumPdl_17__tree_reduce0_2.337
       .align    16,0x90
	.globl _Z7mic_sumPdl
_Z7mic_sumPdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B3.1:
..___tag_value__Z7mic_sumPdl.289:
        subq      $104, %rsp
..___tag_value__Z7mic_sumPdl.291:
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
..___tag_value__Z7mic_sumPdl.292:
        call      printf
..___tag_value__Z7mic_sumPdl.293:
..B3.2:
        movl      $.2.15_2_kmpc_loc_struct_pack.292, %edi
        movq      $0, 64(%rsp)
        call      __kmpc_global_thread_num
..B3.51:
        movl      %eax, 72(%rsp)
        movl      $.2.15_2_kmpc_loc_struct_pack.301, %edi
        xorl      %eax, %eax
..___tag_value__Z7mic_sumPdl.300:
        call      __kmpc_ok_to_fork
..___tag_value__Z7mic_sumPdl.301:
..B3.3:
        testl     %eax, %eax
        je        ..B3.5
..B3.4:
        movl      $L__Z7mic_sumPdl_17__par_loop0_2.299, %edx
        lea       56(%rsp), %rcx
        movl      $.2.15_2_kmpc_loc_struct_pack.301, %edi
        lea       (%rsp), %r8
        pushq     $3
        popq      %rsi
        lea       64(%rsp), %r9
        xorl      %eax, %eax
..___tag_value__Z7mic_sumPdl.302:
        call      __kmpc_fork_call
..___tag_value__Z7mic_sumPdl.303:
        jmp       ..B3.8
..B3.5:
        movl      $.2.15_2_kmpc_loc_struct_pack.301, %edi
        xorl      %eax, %eax
        movl      72(%rsp), %esi
..___tag_value__Z7mic_sumPdl.304:
        call      __kmpc_serialized_parallel
..___tag_value__Z7mic_sumPdl.305:
..B3.6:
        movl      $___kmpv_zero_Z7mic_sumPdl_0, %esi
        lea       72(%rsp), %rdi
        lea       56(%rsp), %rdx
        lea       (%rsp), %rcx
        lea       64(%rsp), %r8
..___tag_value__Z7mic_sumPdl.306:
        call      L__Z7mic_sumPdl_17__par_loop0_2.299
..___tag_value__Z7mic_sumPdl.307:
..B3.7:
        movl      $.2.15_2_kmpc_loc_struct_pack.301, %edi
        xorl      %eax, %eax
        movl      72(%rsp), %esi
..___tag_value__Z7mic_sumPdl.308:
        call      __kmpc_end_serialized_parallel
..___tag_value__Z7mic_sumPdl.309:
..B3.8:
        movq      8(%rsp), %r15
..___tag_value__Z7mic_sumPdl.310:
        movq      16(%rsp), %r14
..___tag_value__Z7mic_sumPdl.311:
        movq      24(%rsp), %r13
..___tag_value__Z7mic_sumPdl.312:
        movq      32(%rsp), %r12
..___tag_value__Z7mic_sumPdl.313:
        movq      40(%rsp), %rbx
..___tag_value__Z7mic_sumPdl.314:
        movq      48(%rsp), %rbp
..___tag_value__Z7mic_sumPdl.315:
        movsd     64(%rsp), %xmm0
        addq      $104, %rsp
..___tag_value__Z7mic_sumPdl.316:
        ret       
..___tag_value__Z7mic_sumPdl.317:
L__Z7mic_sumPdl_17__tree_reduce0_2.337:
# parameter 1: %rdi
# parameter 2: %rsi
..B3.9:
        subq      $104, %rsp
        movsd     (%rsi), %xmm0
        movq      %rbp, 48(%rsp)
        movq      %rbx, 40(%rsp)
        movq      %r15, 8(%rsp)
        movq      %r14, 16(%rsp)
        movq      %r13, 24(%rsp)
        movq      %r12, 32(%rsp)
        movq      8(%rsp), %r15
..___tag_value__Z7mic_sumPdl.319:
        movq      16(%rsp), %r14
..___tag_value__Z7mic_sumPdl.324:
        movq      24(%rsp), %r13
..___tag_value__Z7mic_sumPdl.325:
        movq      32(%rsp), %r12
..___tag_value__Z7mic_sumPdl.326:
        movq      40(%rsp), %rbx
..___tag_value__Z7mic_sumPdl.327:
        movq      48(%rsp), %rbp
..___tag_value__Z7mic_sumPdl.328:
        addsd     (%rdi), %xmm0
        movsd     %xmm0, (%rdi)
        addq      $104, %rsp
..___tag_value__Z7mic_sumPdl.329:
        ret       
..___tag_value__Z7mic_sumPdl.330:
L__Z7mic_sumPdl_17__par_loop0_2.299:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
..B3.10:
        subq      $104, %rsp
        movq      %r12, 32(%rsp)
        pxor      %xmm0, %xmm0
..___tag_value__Z7mic_sumPdl.332:
        movq      (%rdx), %r12
        testq     %r12, %r12
        movq      %rbx, 40(%rsp)
        movq      %r14, 16(%rsp)
        movq      %rbp, 48(%rsp)
..___tag_value__Z7mic_sumPdl.333:
        movq      %r8, %rbp
        movq      %r15, 8(%rsp)
        movq      %r13, 24(%rsp)
..___tag_value__Z7mic_sumPdl.336:
        movl      (%rdi), %ebx
        movq      (%rcx), %r14
        movsd     %xmm0, 56(%rsp)
        jle       ..B3.32
..B3.11:
        decq      %r12
        movl      $1, %r13d
        movq      $0, 64(%rsp)
        movl      $.2.15_2_kmpc_loc_struct_pack.301, %edi
        movq      %r12, 72(%rsp)
        movl      %ebx, %esi
        movl      $0, 88(%rsp)
        movl      $34, %edx
        movq      %r13, 80(%rsp)
        addq      $-32, %rsp
..___tag_value__Z7mic_sumPdl.338:
        xorl      %eax, %eax
        lea       120(%rsp), %rcx
        lea       96(%rsp), %r8
        lea       104(%rsp), %r9
        lea       112(%rsp), %r10
        movq      %r10, (%rsp)
        movq      %r13, 8(%rsp)
        movq      %r13, 16(%rsp)
..___tag_value__Z7mic_sumPdl.339:
        call      __kmpc_for_static_init_8
..___tag_value__Z7mic_sumPdl.340:
..B3.52:
        addq      $32, %rsp
..___tag_value__Z7mic_sumPdl.341:
..B3.12:
        movq      64(%rsp), %rax
        cmpq      %r12, %rax
        movq      72(%rsp), %rdx
        jg        ..B3.31
..B3.13:
        cmpq      %r12, %rdx
        cmovl     %rdx, %r12
        cmpq      %r12, %rax
        jg        ..B3.31
..B3.14:
        subq      %rax, %r12
        movb      $0, %sil
        incq      %r12
        cmpq      $16, %r12
        jl        ..B3.38
..B3.15:
        lea       (%r14,%rax,8), %rcx
        movq      %rcx, %rdx
        andq      $15, %rdx
        je        ..B3.18
..B3.16:
        testq     $7, %rdx
        jne       ..B3.38
..B3.17:
        movq      %r13, %rdx
..B3.18:
        lea       16(%rdx), %rdi
        cmpq      %rdi, %r12
        jl        ..B3.38
..B3.19:
        movq      %r12, %rdi
        xorl      %r8d, %r8d
        subq      %rdx, %rdi
        andq      $15, %rdi
        negq      %rdi
        addq      %r12, %rdi
        testq     %rdx, %rdx
        ja        ..B3.43
..B3.20:
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
..B3.21:
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
        jb        ..B3.21
..B3.22:
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
..B3.23:
        lea       1(%rdi), %rdx
        cmpq      %rdx, %r12
        jb        ..B3.31
..B3.24:
        subq      %rdi, %r12
        cmpb      $1, %sil
        jne       ..B3.26
..B3.25:
        xorl      %esi, %esi
        jmp       ..B3.30
..B3.26:
        cmpq      $2, %r12
        jl        ..B3.25
..B3.27:
        movsd     56(%rsp), %xmm1
        lea       (%rax,%rdi), %rdx
        movq      %r12, %rsi
        pxor      %xmm0, %xmm0
        andq      $-2, %rsi
        xorl      %ecx, %ecx
        movsd     %xmm1, %xmm0
        lea       (%r14,%rdx,8), %rdx
..B3.28:
        addpd     (%rdx,%rcx,8), %xmm0
        addq      $2, %rcx
        cmpq      %rsi, %rcx
        jb        ..B3.28
..B3.29:
        movaps    %xmm0, %xmm1
        unpckhpd  %xmm0, %xmm1
        addsd     %xmm1, %xmm0
        movsd     %xmm0, 56(%rsp)
..B3.30:
        cmpq      %r12, %rsi
        jb        ..B3.39
..B3.31:
        movl      $.2.15_2_kmpc_loc_struct_pack.301, %edi
        movl      %ebx, %esi
        xorl      %eax, %eax
..___tag_value__Z7mic_sumPdl.342:
        call      __kmpc_for_static_fini
..___tag_value__Z7mic_sumPdl.343:
..B3.32:
        movsd     56(%rsp), %xmm0
        movl      $.2.15_2_kmpc_loc_struct_pack.330, %r12d
        movsd     %xmm0, (%rsp)
        lea       (%rsp), %r8
        pushq     %rsp
..___tag_value__Z7mic_sumPdl.344:
        movl      $L__Z7mic_sumPdl_17__tree_reduce0_2.337, %r9d
        movq      %r12, %rdi
        movl      %ebx, %esi
        pushq     $1
        popq      %rdx
        pushq     $8
        popq      %rcx
        xorl      %eax, %eax
        pushq     $mic_sum_kmpc_tree_reduct_lock_0
..___tag_value__Z7mic_sumPdl.345:
        call      __kmpc_reduce_nowait
..___tag_value__Z7mic_sumPdl.347:
..B3.53:
        addq      $16, %rsp
..___tag_value__Z7mic_sumPdl.348:
..B3.33:
        cmpl      $1, %eax
        jne       ..B3.35
..B3.34:
        movsd     (%rsp), %xmm0
        movl      $mic_sum_kmpc_tree_reduct_lock_0, %edx
        movq      %r12, %rdi
        movl      %ebx, %esi
        xorl      %eax, %eax
        addsd     (%rbp), %xmm0
        movsd     %xmm0, (%rbp)
..___tag_value__Z7mic_sumPdl.349:
        call      __kmpc_end_reduce_nowait
..___tag_value__Z7mic_sumPdl.350:
        jmp       ..B3.37
..B3.35:
        cmpl      $2, %eax
        jne       ..B3.37
..B3.36:
        movsd     (%rsp), %xmm0
        movq      %r12, %rdi
        movl      %ebx, %esi
        movq      %rbp, %rdx
        pushq     $1
        popq      %rax
..___tag_value__Z7mic_sumPdl.351:
        call      __kmpc_atomic_float8_add
..___tag_value__Z7mic_sumPdl.352:
..B3.37:
        movq      8(%rsp), %r15
..___tag_value__Z7mic_sumPdl.353:
        movq      16(%rsp), %r14
..___tag_value__Z7mic_sumPdl.354:
        movq      24(%rsp), %r13
..___tag_value__Z7mic_sumPdl.355:
        movq      32(%rsp), %r12
..___tag_value__Z7mic_sumPdl.356:
        movq      40(%rsp), %rbx
..___tag_value__Z7mic_sumPdl.357:
        movq      48(%rsp), %rbp
..___tag_value__Z7mic_sumPdl.358:
        addq      $104, %rsp
..___tag_value__Z7mic_sumPdl.359:
        ret       
..___tag_value__Z7mic_sumPdl.360:
..B3.38:
        movb      $1, %sil
        xorl      %edi, %edi
        jmp       ..B3.23
..B3.39:
        addq      %rdi, %rax
        movsd     56(%rsp), %xmm0
        lea       (%r14,%rax,8), %rax
..B3.40:
        addsd     (%rax,%rsi,8), %xmm0
        incq      %rsi
        cmpq      %r12, %rsi
        jb        ..B3.40
..B3.41:
        movsd     %xmm0, 56(%rsp)
        jmp       ..B3.31
..B3.43:
        movsd     56(%rsp), %xmm0
..B3.44:
        addsd     (%rcx,%r8,8), %xmm0
        incq      %r8
        cmpq      %rdx, %r8
        jb        ..B3.44
..B3.45:
        movsd     %xmm0, 56(%rsp)
        jmp       ..B3.20
        .align    16,0x90
..___tag_value__Z7mic_sumPdl.367:
	.type	_Z7mic_sumPdl,@function
	.size	_Z7mic_sumPdl,.-_Z7mic_sumPdl
	.data
	.space 2, 0x00 	# pad
	.align 4
.2.15_2_kmpc_loc_struct_pack.292:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.15_2__kmpc_loc_pack.291
	.align 4
.2.15_2__kmpc_loc_pack.291:
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
	.byte	55
	.byte	59
	.byte	49
	.byte	55
	.byte	59
	.byte	59
	.align 4
.2.15_2_kmpc_loc_struct_pack.301:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.15_2__kmpc_loc_pack.300
	.align 4
.2.15_2__kmpc_loc_pack.300:
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
	.byte	55
	.byte	59
	.byte	50
	.byte	50
	.byte	59
	.byte	59
	.align 4
.2.15_2_kmpc_loc_struct_pack.330:
	.long	0
	.long	18
	.long	0
	.long	0
	.quad	.2.15_2__kmpc_loc_pack.329
	.align 4
.2.15_2__kmpc_loc_pack.329:
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
	.byte	55
	.byte	59
	.byte	49
	.byte	55
	.byte	59
	.byte	59
	.data
# -- End  _Z7mic_sumPdl, L__Z7mic_sumPdl_17__par_loop0_2.299, L__Z7mic_sumPdl_17__tree_reduce0_2.337
	.text
# -- Begin  __sti__$E
       .align    16,0x90
__sti__$E:
..B4.1:
..___tag_value___sti__$E.368:
        pushq     %rsi
..___tag_value___sti__$E.370:
        movl      $_ZSt8__ioinit, %edi
..___tag_value___sti__$E.371:
        call      _ZNSt8ios_base4InitC1Ev
..___tag_value___sti__$E.372:
..B4.2:
        movl      $_ZNSt8ios_base4InitD1Ev, %edi
        movl      $_ZSt8__ioinit, %esi
        movl      $__dso_handle, %edx
        addq      $8, %rsp
..___tag_value___sti__$E.373:
        jmp       __cxa_atexit
        .align    16,0x90
..___tag_value___sti__$E.374:
	.type	__sti__$E,@function
	.size	__sti__$E,.-__sti__$E
	.data
# -- End  __sti__$E
	.text
# -- Begin  _Z8mic_initv
       .align    16,0x90
	.globl _Z8mic_initv
_Z8mic_initv:
..B5.1:
..___tag_value__Z8mic_initv.375:
        pushq     %r12
..___tag_value__Z8mic_initv.377:
        subq      $16, %rsp
..___tag_value__Z8mic_initv.379:
        movl      $.L_2__STRING.3, %edi
        call      getenv
..B5.2:
        testq     %rax, %rax
        je        ..B5.25
..B5.3:
        movq      %rax, %rdi
        call      atol
..B5.4:
        movl      %eax, %edi
        call      ompc_set_num_threads
..B5.5:
        call      _Offload_number_of_devices
..B5.39:
        movl      %eax, %r12d
..B5.6:
        movl      $.L_2__STRING.9, %edi
        call      getenv
..B5.40:
        movq      %rax, %rdx
..B5.7:
        testq     %rdx, %rdx
        je        ..B5.15
..B5.8:
        xorl      %eax, %eax
        testl     %r12d, %r12d
        jle       ..B5.14
..B5.9:
        movq      %r13, 8(%rsp)
..___tag_value__Z8mic_initv.380:
        movq      %rdx, %r13
        movq      %r14, (%rsp)
..___tag_value__Z8mic_initv.381:
        movl      %r12d, %r14d
        movl      %eax, %r12d
..B5.10:
        movq      %r13, %rdi
        call      atol
..B5.11:
        movl      %eax, %edx
        movl      $2, %edi
        movl      %r12d, %esi
..___tag_value__Z8mic_initv.382:
        call      omp_set_num_threads_target
..___tag_value__Z8mic_initv.383:
..B5.12:
        incl      %r12d
        cmpl      %r14d, %r12d
        jl        ..B5.10
..B5.13:
        movq      8(%rsp), %r13
..___tag_value__Z8mic_initv.384:
        movq      (%rsp), %r14
..___tag_value__Z8mic_initv.385:
..B5.14:
        addq      $16, %rsp
..___tag_value__Z8mic_initv.386:
        popq      %r12
..___tag_value__Z8mic_initv.388:
        ret       
..___tag_value__Z8mic_initv.389:
..B5.15:
        movl      $_ZSt4cout, %edi
        movl      $.L_2__STRING.4, %esi
..___tag_value__Z8mic_initv.391:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8mic_initv.392:
..B5.16:
        movq      %rax, %rdi
        movl      $.L_2__STRING.5, %esi
..___tag_value__Z8mic_initv.393:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8mic_initv.394:
..B5.17:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value__Z8mic_initv.395:
        call      _ZNSolsEPFRSoS_E
..___tag_value__Z8mic_initv.396:
..B5.18:
        movq      %rax, %rdi
        movl      $.L_2__STRING.6, %esi
..___tag_value__Z8mic_initv.397:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8mic_initv.398:
..B5.19:
        movq      %rax, %rdi
        movl      $.L_2__STRING.7, %esi
..___tag_value__Z8mic_initv.399:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8mic_initv.400:
..B5.20:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value__Z8mic_initv.401:
        call      _ZNSolsEPFRSoS_E
..___tag_value__Z8mic_initv.402:
..B5.21:
        movq      %rax, %rdi
        movl      $.L_2__STRING.8, %esi
..___tag_value__Z8mic_initv.403:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8mic_initv.404:
..B5.22:
        movq      %rax, %rdi
        movl      $45, %esi
..___tag_value__Z8mic_initv.405:
        call      _ZNSolsEi
..___tag_value__Z8mic_initv.406:
..B5.23:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value__Z8mic_initv.407:
        call      _ZNSolsEPFRSoS_E
..___tag_value__Z8mic_initv.408:
..B5.24:
        int       $5
..B5.25:
        movl      $_ZSt4cout, %edi
        movl      $.L_2__STRING.4, %esi
..___tag_value__Z8mic_initv.409:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8mic_initv.410:
..B5.26:
        movq      %rax, %rdi
        movl      $.L_2__STRING.5, %esi
..___tag_value__Z8mic_initv.411:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8mic_initv.412:
..B5.27:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value__Z8mic_initv.413:
        call      _ZNSolsEPFRSoS_E
..___tag_value__Z8mic_initv.414:
..B5.28:
        movq      %rax, %rdi
        movl      $.L_2__STRING.6, %esi
..___tag_value__Z8mic_initv.415:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8mic_initv.416:
..B5.29:
        movq      %rax, %rdi
        movl      $.L_2__STRING.7, %esi
..___tag_value__Z8mic_initv.417:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8mic_initv.418:
..B5.30:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value__Z8mic_initv.419:
        call      _ZNSolsEPFRSoS_E
..___tag_value__Z8mic_initv.420:
..B5.31:
        movq      %rax, %rdi
        movl      $.L_2__STRING.8, %esi
..___tag_value__Z8mic_initv.421:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8mic_initv.422:
..B5.32:
        movq      %rax, %rdi
        movl      $40, %esi
..___tag_value__Z8mic_initv.423:
        call      _ZNSolsEi
..___tag_value__Z8mic_initv.424:
        jmp       ..B5.23
        .align    16,0x90
..___tag_value__Z8mic_initv.425:
	.type	_Z8mic_initv,@function
	.size	_Z8mic_initv,.-_Z8mic_initv
	.data
# -- End  _Z8mic_initv
	.bss
	.align 4
	.align 4
___kmpv_zeromain_0:
	.type	___kmpv_zeromain_0,@object
	.size	___kmpv_zeromain_0,4
	.space 4	# pad
	.align 4
___kmpv_zeromain_4:
	.type	___kmpv_zeromain_4,@object
	.size	___kmpv_zeromain_4,4
	.space 4	# pad
	.align 4
___kmpv_zeromain_5:
	.type	___kmpv_zeromain_5,@object
	.size	___kmpv_zeromain_5,4
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
___kmpv_zero_Z7mic_sumPdl_0:
	.type	___kmpv_zero_Z7mic_sumPdl_0,@object
	.size	___kmpv_zero_Z7mic_sumPdl_0,4
	.space 4	# pad
	.align 1
_ZSt8__ioinit:
	.type	_ZSt8__ioinit,@object
	.size	_ZSt8__ioinit,1
	.space 1	# pad
	.section .rodata, "a"
	.align 16
.L_2il0floatpacket.207:
	.long	0x00000008,0x00000000,0x00000008,0x00000000
	.type	.L_2il0floatpacket.207,@object
	.size	.L_2il0floatpacket.207,16
	.align 16
.L_2il0floatpacket.208:
	.long	0x00000000,0x3ff00000,0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.208,@object
	.size	.L_2il0floatpacket.208,16
	.align 16
.L_2il0floatpacket.209:
	.long	0x00000000,0xbff00000,0x00000000,0xbff00000
	.type	.L_2il0floatpacket.209,@object
	.size	.L_2il0floatpacket.209,16
	.align 16
.L_2il0floatpacket.279:
	.long	0xa53d6e3c,0x3ff965fe,0xa53d6e3c,0x3ff965fe
	.type	.L_2il0floatpacket.279,@object
	.size	.L_2il0floatpacket.279,16
	.align 8
.L_2il0floatpacket.206:
	.long	0xa53d6e3c,0x3ff965fe
	.type	.L_2il0floatpacket.206,@object
	.size	.L_2il0floatpacket.206,8
	.align 8
.L_2il0floatpacket.210:
	.long	0x00000000,0xbff00000
	.type	.L_2il0floatpacket.210,@object
	.size	.L_2il0floatpacket.210,8
	.align 8
.L_2il0floatpacket.211:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.211,@object
	.size	.L_2il0floatpacket.211,8
	.align 8
.L_2il0floatpacket.278:
	.long	0xa53d6e3c,0x3ff965fe
	.type	.L_2il0floatpacket.278,@object
	.size	.L_2il0floatpacket.278,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.3:
	.byte	79
	.byte	77
	.byte	80
	.byte	95
	.byte	78
	.byte	85
	.byte	77
	.byte	95
	.byte	84
	.byte	72
	.byte	82
	.byte	69
	.byte	65
	.byte	68
	.byte	83
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,16
	.align 4
.L_2__STRING.4:
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
	.type	.L_2__STRING.4,@object
	.size	.L_2__STRING.4,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.5:
	.byte	115
	.byte	32
	.byte	33
	.byte	61
	.byte	32
	.byte	78
	.byte	85
	.byte	76
	.byte	76
	.byte	0
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,10
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.6:
	.byte	102
	.byte	105
	.byte	108
	.byte	101
	.byte	58
	.byte	32
	.byte	0
	.type	.L_2__STRING.6,@object
	.size	.L_2__STRING.6,7
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.7:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	95
	.byte	111
	.byte	102
	.byte	102
	.byte	108
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
	.type	.L_2__STRING.7,@object
	.size	.L_2__STRING.7,17
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.8:
	.byte	108
	.byte	105
	.byte	110
	.byte	101
	.byte	58
	.byte	32
	.byte	0
	.type	.L_2__STRING.8,@object
	.size	.L_2__STRING.8,7
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.9:
	.byte	77
	.byte	73
	.byte	67
	.byte	95
	.byte	79
	.byte	77
	.byte	80
	.byte	95
	.byte	78
	.byte	85
	.byte	77
	.byte	95
	.byte	84
	.byte	72
	.byte	82
	.byte	69
	.byte	65
	.byte	68
	.byte	83
	.byte	0
	.type	.L_2__STRING.9,@object
	.size	.L_2__STRING.9,20
	.align 4
.L_2__STRING.10:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	110
	.byte	98
	.byte	121
	.byte	116
	.byte	101
	.byte	115
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	108
	.byte	100
	.byte	10
	.byte	0
	.type	.L_2__STRING.10,@object
	.size	.L_2__STRING.10,26
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.11:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	104
	.byte	111
	.byte	115
	.byte	116
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
	.type	.L_2__STRING.11,@object
	.size	.L_2__STRING.11,26
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
.L_2__STRING.12:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	115
	.byte	117
	.byte	109
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	102
	.byte	10
	.byte	0
	.type	.L_2__STRING.12,@object
	.size	.L_2__STRING.12,25
	.space 3, 0x00 	# pad
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
	.space 3, 0x00 	# pad
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
	.section .ctors, "wa"
	.align 8
__init_0:
	.type	__init_0,@object
	.size	__init_0,8
	.quad	__sti__$E
	.data
	.hidden __dso_handle
	.comm mic_sum_kmpc_tree_reduct_lock_0,32,8
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
	.4byte 0x000002fc
	.4byte 0x00000044
	.8byte ..___tag_value_main.1
	.8byte ..___tag_value_main.192-..___tag_value_main.1
	.byte 0x08
	.8byte main$$LSDA
	.byte 0x04
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.7-..___tag_value_main.4
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff680d1affff
	.8byte 0x800d1c380e0c1022
	.8byte 0xffff600d1affffff
	.8byte 0x0d1c380e0d1022ff
	.8byte 0xff580d1affffff80
	.8byte 0x1c380e0e1022ffff
	.8byte 0x500d1affffff800d
	.8byte 0x380e0f1022ffffff
	.8byte 0x0d1affffff800d1c
	.4byte 0xfffffb88
	.2byte 0x0422
	.4byte ..___tag_value_main.79-..___tag_value_main.7
	.2byte 0x04cf
	.4byte ..___tag_value_main.80-..___tag_value_main.79
	.2byte 0x04ce
	.4byte ..___tag_value_main.81-..___tag_value_main.80
	.2byte 0x04cd
	.4byte ..___tag_value_main.82-..___tag_value_main.81
	.2byte 0x04cc
	.4byte ..___tag_value_main.83-..___tag_value_main.82
	.2byte 0x04c3
	.4byte ..___tag_value_main.84-..___tag_value_main.83
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.86-..___tag_value_main.84
	.4byte 0x0410060c
	.4byte ..___tag_value_main.88-..___tag_value_main.86
	.4byte 0x0410070c
	.4byte ..___tag_value_main.89-..___tag_value_main.88
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.91-..___tag_value_main.89
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff680d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.92-..___tag_value_main.91
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffff600d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.94-..___tag_value_main.92
	.8byte 0xff800d1c380e0d10
	.8byte 0xffffff580d1affff
	.8byte 0x800d1c380e0e1022
	.8byte 0xffff500d1affffff
	.8byte 0x0d1c380e0f1022ff
	.8byte 0xfb880d1affffff80
	.4byte 0x0422ffff
	.4byte ..___tag_value_main.102-..___tag_value_main.94
	.2byte 0x04cf
	.4byte ..___tag_value_main.103-..___tag_value_main.102
	.2byte 0x04ce
	.4byte ..___tag_value_main.104-..___tag_value_main.103
	.2byte 0x04cd
	.4byte ..___tag_value_main.105-..___tag_value_main.104
	.2byte 0x04cc
	.4byte ..___tag_value_main.106-..___tag_value_main.105
	.2byte 0x04c3
	.4byte ..___tag_value_main.107-..___tag_value_main.106
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.109-..___tag_value_main.107
	.4byte 0x0410060c
	.4byte ..___tag_value_main.111-..___tag_value_main.109
	.4byte 0x0410070c
	.4byte ..___tag_value_main.112-..___tag_value_main.111
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.114-..___tag_value_main.112
	.8byte 0xff800d1c380e0d10
	.8byte 0xffffff580d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.115-..___tag_value_main.114
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff680d1affff
	.8byte 0x800d1c380e0c1022
	.8byte 0xffff600d1affffff
	.2byte 0x22ff
	.byte 0x04
	.4byte ..___tag_value_main.117-..___tag_value_main.115
	.8byte 0xff800d1c380e0e10
	.8byte 0xffffff500d1affff
	.8byte 0x800d1c380e0f1022
	.8byte 0xfffb880d1affffff
	.2byte 0x22ff
	.byte 0x04
	.4byte ..___tag_value_main.123-..___tag_value_main.117
	.2byte 0x04cf
	.4byte ..___tag_value_main.124-..___tag_value_main.123
	.2byte 0x04ce
	.4byte ..___tag_value_main.125-..___tag_value_main.124
	.2byte 0x04cd
	.4byte ..___tag_value_main.126-..___tag_value_main.125
	.2byte 0x04cc
	.4byte ..___tag_value_main.127-..___tag_value_main.126
	.2byte 0x04c3
	.4byte ..___tag_value_main.128-..___tag_value_main.127
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.130-..___tag_value_main.128
	.4byte 0x0410060c
	.4byte ..___tag_value_main.132-..___tag_value_main.130
	.4byte 0x0410070c
	.4byte ..___tag_value_main.133-..___tag_value_main.132
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.135-..___tag_value_main.133
	.8byte 0xff800d1c380e0c10
	.8byte 0xffffff600d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.136-..___tag_value_main.135
	.8byte 0xff800d1c380e0310
	.8byte 0xffffff680d1affff
	.8byte 0x800d1c380e0d1022
	.8byte 0xffff580d1affffff
	.8byte 0x0d1c380e0e1022ff
	.8byte 0xff500d1affffff80
	.8byte 0x1c380e0f1022ffff
	.8byte 0x880d1affffff800d
	.4byte 0x22fffffb
	.byte 0x04
	.4byte ..___tag_value_main.144-..___tag_value_main.136
	.2byte 0x04cf
	.4byte ..___tag_value_main.145-..___tag_value_main.144
	.2byte 0x04ce
	.4byte ..___tag_value_main.146-..___tag_value_main.145
	.2byte 0x04cd
	.4byte ..___tag_value_main.147-..___tag_value_main.146
	.2byte 0x04cc
	.4byte ..___tag_value_main.148-..___tag_value_main.147
	.2byte 0x04c3
	.4byte ..___tag_value_main.149-..___tag_value_main.148
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.151-..___tag_value_main.149
	.8byte 0x1c380e031010060c
	.8byte 0x680d1affffff800d
	.8byte 0x0c10028622ffffff
	.8byte 0xffffff800d1c380e
	.8byte 0x1022ffffff600d1a
	.8byte 0xffff800d1c380e0d
	.8byte 0x22ffffff580d1aff
	.8byte 0xff800d1c380e0e10
	.8byte 0xffffff500d1affff
	.8byte 0x800d1c380e0f1022
	.8byte 0xfffb880d1affffff
	.4byte 0x000022ff
	.2byte 0x0000
	.4byte 0x0000011c
	.4byte 0x00000344
	.8byte ..___tag_value__Z13hostmic_scalePdl.197
	.8byte ..___tag_value__Z13hostmic_scalePdl.284-..___tag_value__Z13hostmic_scalePdl.197
	.byte 0x08
	.8byte _Z13hostmic_scalePdl$$LSDA
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.199-..___tag_value__Z13hostmic_scalePdl.197
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.201-..___tag_value__Z13hostmic_scalePdl.199
	.8byte 0x0a8d098c07860883
	.4byte 0x0c8f0b8e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.228-..___tag_value__Z13hostmic_scalePdl.201
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.229-..___tag_value__Z13hostmic_scalePdl.228
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.230-..___tag_value__Z13hostmic_scalePdl.229
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.231-..___tag_value__Z13hostmic_scalePdl.230
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.232-..___tag_value__Z13hostmic_scalePdl.231
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.233-..___tag_value__Z13hostmic_scalePdl.232
	.2byte 0x04c6
	.4byte ..___tag_value__Z13hostmic_scalePdl.234-..___tag_value__Z13hostmic_scalePdl.233
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.235-..___tag_value__Z13hostmic_scalePdl.234
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.237-..___tag_value__Z13hostmic_scalePdl.235
	.2byte 0x0883
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.238-..___tag_value__Z13hostmic_scalePdl.237
	.2byte 0x0786
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.240-..___tag_value__Z13hostmic_scalePdl.238
	.8byte 0x0c8f0b8e0a8d098c
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.249-..___tag_value__Z13hostmic_scalePdl.240
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.250-..___tag_value__Z13hostmic_scalePdl.249
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.251-..___tag_value__Z13hostmic_scalePdl.250
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.252-..___tag_value__Z13hostmic_scalePdl.251
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.253-..___tag_value__Z13hostmic_scalePdl.252
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.254-..___tag_value__Z13hostmic_scalePdl.253
	.2byte 0x04c6
	.4byte ..___tag_value__Z13hostmic_scalePdl.255-..___tag_value__Z13hostmic_scalePdl.254
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.256-..___tag_value__Z13hostmic_scalePdl.255
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.258-..___tag_value__Z13hostmic_scalePdl.256
	.2byte 0x098c
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.259-..___tag_value__Z13hostmic_scalePdl.258
	.8byte 0x0b8e0a8d07860883
	.2byte 0x0c8f
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.264-..___tag_value__Z13hostmic_scalePdl.259
	.4byte 0x0401800e
	.4byte ..___tag_value__Z13hostmic_scalePdl.267-..___tag_value__Z13hostmic_scalePdl.264
	.2byte 0x600e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.270-..___tag_value__Z13hostmic_scalePdl.267
	.2byte 0x04cf
	.4byte ..___tag_value__Z13hostmic_scalePdl.271-..___tag_value__Z13hostmic_scalePdl.270
	.2byte 0x04ce
	.4byte ..___tag_value__Z13hostmic_scalePdl.272-..___tag_value__Z13hostmic_scalePdl.271
	.2byte 0x04cd
	.4byte ..___tag_value__Z13hostmic_scalePdl.273-..___tag_value__Z13hostmic_scalePdl.272
	.2byte 0x04cc
	.4byte ..___tag_value__Z13hostmic_scalePdl.274-..___tag_value__Z13hostmic_scalePdl.273
	.2byte 0x04c3
	.4byte ..___tag_value__Z13hostmic_scalePdl.275-..___tag_value__Z13hostmic_scalePdl.274
	.2byte 0x04c6
	.4byte ..___tag_value__Z13hostmic_scalePdl.276-..___tag_value__Z13hostmic_scalePdl.275
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z13hostmic_scalePdl.277-..___tag_value__Z13hostmic_scalePdl.276
	.8byte 0x098c07860883600e
	.8byte 0x00000c8f0b8e0a8d
	.2byte 0x0000
	.byte 0x00
	.4byte 0x0000011c
	.4byte 0x00000444
	.8byte ..___tag_value__Z7mic_sumPdl.289
	.8byte ..___tag_value__Z7mic_sumPdl.367-..___tag_value__Z7mic_sumPdl.289
	.2byte 0x0400
	.4byte ..___tag_value__Z7mic_sumPdl.291-..___tag_value__Z7mic_sumPdl.289
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.293-..___tag_value__Z7mic_sumPdl.291
	.8byte 0x0b8d0a8c08860983
	.4byte 0x0d8f0c8e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.310-..___tag_value__Z7mic_sumPdl.293
	.2byte 0x04cf
	.4byte ..___tag_value__Z7mic_sumPdl.311-..___tag_value__Z7mic_sumPdl.310
	.2byte 0x04ce
	.4byte ..___tag_value__Z7mic_sumPdl.312-..___tag_value__Z7mic_sumPdl.311
	.2byte 0x04cd
	.4byte ..___tag_value__Z7mic_sumPdl.313-..___tag_value__Z7mic_sumPdl.312
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.314-..___tag_value__Z7mic_sumPdl.313
	.2byte 0x04c3
	.4byte ..___tag_value__Z7mic_sumPdl.315-..___tag_value__Z7mic_sumPdl.314
	.2byte 0x04c6
	.4byte ..___tag_value__Z7mic_sumPdl.316-..___tag_value__Z7mic_sumPdl.315
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.317-..___tag_value__Z7mic_sumPdl.316
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.319-..___tag_value__Z7mic_sumPdl.317
	.8byte 0x0b8d0a8c08860983
	.2byte 0x0c8e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.324-..___tag_value__Z7mic_sumPdl.319
	.2byte 0x04ce
	.4byte ..___tag_value__Z7mic_sumPdl.325-..___tag_value__Z7mic_sumPdl.324
	.2byte 0x04cd
	.4byte ..___tag_value__Z7mic_sumPdl.326-..___tag_value__Z7mic_sumPdl.325
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.327-..___tag_value__Z7mic_sumPdl.326
	.2byte 0x04c3
	.4byte ..___tag_value__Z7mic_sumPdl.328-..___tag_value__Z7mic_sumPdl.327
	.2byte 0x04c6
	.4byte ..___tag_value__Z7mic_sumPdl.329-..___tag_value__Z7mic_sumPdl.328
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.330-..___tag_value__Z7mic_sumPdl.329
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.332-..___tag_value__Z7mic_sumPdl.330
	.2byte 0x0a8c
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.333-..___tag_value__Z7mic_sumPdl.332
	.4byte 0x08860983
	.2byte 0x0c8e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.336-..___tag_value__Z7mic_sumPdl.333
	.4byte 0x0d8f0b8d
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.338-..___tag_value__Z7mic_sumPdl.336
	.4byte 0x0401900e
	.4byte ..___tag_value__Z7mic_sumPdl.341-..___tag_value__Z7mic_sumPdl.338
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.344-..___tag_value__Z7mic_sumPdl.341
	.2byte 0x780e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.345-..___tag_value__Z7mic_sumPdl.344
	.4byte 0x0401800e
	.4byte ..___tag_value__Z7mic_sumPdl.348-..___tag_value__Z7mic_sumPdl.345
	.2byte 0x700e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.353-..___tag_value__Z7mic_sumPdl.348
	.2byte 0x04cf
	.4byte ..___tag_value__Z7mic_sumPdl.354-..___tag_value__Z7mic_sumPdl.353
	.2byte 0x04ce
	.4byte ..___tag_value__Z7mic_sumPdl.355-..___tag_value__Z7mic_sumPdl.354
	.2byte 0x04cd
	.4byte ..___tag_value__Z7mic_sumPdl.356-..___tag_value__Z7mic_sumPdl.355
	.2byte 0x04cc
	.4byte ..___tag_value__Z7mic_sumPdl.357-..___tag_value__Z7mic_sumPdl.356
	.2byte 0x04c3
	.4byte ..___tag_value__Z7mic_sumPdl.358-..___tag_value__Z7mic_sumPdl.357
	.2byte 0x04c6
	.4byte ..___tag_value__Z7mic_sumPdl.359-..___tag_value__Z7mic_sumPdl.358
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z7mic_sumPdl.360-..___tag_value__Z7mic_sumPdl.359
	.8byte 0x0a8c08860983700e
	.8byte 0x00000d8f0c8e0b8d
	.2byte 0x0000
	.4byte 0x00000024
	.4byte 0x00000564
	.8byte ..___tag_value___sti__$E.368
	.8byte ..___tag_value___sti__$E.374-..___tag_value___sti__$E.368
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.370-..___tag_value___sti__$E.368
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.373-..___tag_value___sti__$E.370
	.2byte 0x080e
	.byte 0x00
	.4byte 0x0000005c
	.4byte 0x0000058c
	.8byte ..___tag_value__Z8mic_initv.375
	.8byte ..___tag_value__Z8mic_initv.425-..___tag_value__Z8mic_initv.375
	.2byte 0x0400
	.4byte ..___tag_value__Z8mic_initv.377-..___tag_value__Z8mic_initv.375
	.4byte 0x028c100e
	.byte 0x04
	.4byte ..___tag_value__Z8mic_initv.379-..___tag_value__Z8mic_initv.377
	.2byte 0x200e
	.byte 0x04
	.4byte ..___tag_value__Z8mic_initv.380-..___tag_value__Z8mic_initv.379
	.2byte 0x038d
	.byte 0x04
	.4byte ..___tag_value__Z8mic_initv.381-..___tag_value__Z8mic_initv.380
	.2byte 0x048e
	.byte 0x04
	.4byte ..___tag_value__Z8mic_initv.384-..___tag_value__Z8mic_initv.381
	.2byte 0x04cd
	.4byte ..___tag_value__Z8mic_initv.385-..___tag_value__Z8mic_initv.384
	.2byte 0x04ce
	.4byte ..___tag_value__Z8mic_initv.386-..___tag_value__Z8mic_initv.385
	.4byte 0x04cc100e
	.4byte ..___tag_value__Z8mic_initv.388-..___tag_value__Z8mic_initv.386
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z8mic_initv.389-..___tag_value__Z8mic_initv.388
	.8byte 0x00000000028c200e
	.byte 0x00
# End
