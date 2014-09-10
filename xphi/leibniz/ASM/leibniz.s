	.file "leibniz.cpp"
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
        xorl      %edi, %edi
..___tag_value_main.6:
        call      __intel_new_proc_init
..___tag_value_main.7:
..B1.7:
        movl      $.2.11_2_kmpc_loc_struct_pack.1, %edi
        xorl      %esi, %esi
        xorl      %eax, %eax
..___tag_value_main.8:
        call      __kmpc_begin
..___tag_value_main.9:
..B1.2:
..___tag_value_main.10:
        call      _Z8leibniz3v
..___tag_value_main.11:
..B1.3:
        movl      $.2.11_2_kmpc_loc_struct_pack.12, %edi
        xorl      %eax, %eax
..___tag_value_main.12:
        call      __kmpc_end
..___tag_value_main.13:
..B1.4:
        xorl      %eax, %eax
        movq      %rbp, %rsp
        popq      %rbp
..___tag_value_main.14:
        ret       
        .align    16,0x90
..___tag_value_main.16:
	.type	main,@function
	.size	main,.-main
	.data
	.align 4
	.align 4
.2.11_2_kmpc_loc_struct_pack.1:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.11_2__kmpc_loc_pack.0
	.align 4
.2.11_2__kmpc_loc_pack.0:
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
	.byte	57
	.byte	49
	.byte	59
	.byte	57
	.byte	49
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.11_2_kmpc_loc_struct_pack.12:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.11_2__kmpc_loc_pack.11
	.align 4
.2.11_2__kmpc_loc_pack.11:
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
	.byte	57
	.byte	53
	.byte	59
	.byte	57
	.byte	53
	.byte	59
	.byte	59
	.data
# -- End  main
	.text
# -- Begin  _Z8leibniz3v
       .align    16,0x90
	.globl _Z8leibniz3v
_Z8leibniz3v:
..B2.1:
..___tag_value__Z8leibniz3v.17:
        subq      $296, %rsp
..___tag_value__Z8leibniz3v.19:
        lea       280(%rsp), %rdi
..___tag_value__Z8leibniz3v.20:
        call      _Z8mic_initRi
..___tag_value__Z8leibniz3v.21:
..B2.2:
        movq      $0x17d784000, %rdi
        movl      $64, %esi
        movq      $800000000, 256(%rsp)
        call      _mm_malloc
..B2.3:
        movq      %rax, %rdi
        movq      256(%rsp), %rsi
        movq      %rax, 264(%rsp)
..___tag_value__Z8leibniz3v.22:
        call      _Z12leibniz_initPdl
..___tag_value__Z8leibniz3v.23:
..B2.4:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.1, %r8d
        movl      $73, %r9d
        xorl      %eax, %eax
        movq      $0xbff0000000000000, %r10
        movq      %r10, 272(%rsp)
..___tag_value__Z8leibniz3v.24:
        call      __offload_target_acquire
..___tag_value__Z8leibniz3v.25:
..B2.5:
        testq     %rax, %rax
        je        ..B2.9
..B2.6:
        movq      256(%rsp), %rcx
        lea       64(%rsp), %rdi
        movl      $192, %edx
        lea       .2.12_2__offload_var_desc1_p.50(%rip), %rsi
        movq      %rcx, (%rsp)
        movq      %rax, 8(%rsp)
        call      _intel_fast_memcpy
..B2.27:
        movq      16+.2.12_2__offload_var_desc2_p.55(%rip), %r8
        lea       16(%rsp), %r9
        movq      24+.2.12_2__offload_var_desc2_p.55(%rip), %rdx
        movq      %r8, 16(%r9)
        lea       64(%rsp), %r8
        movq      8+.2.12_2__offload_var_desc2_p.55(%rip), %r11
        movq      %rdx, 24(%r9)
        lea       264(%rsp), %rdx
        movq      %rdx, 56(%r8)
        lea       256(%rsp), %rdx
        movq      %r11, 8(%r9)
        movq      %rdx, 184(%rsp)
        lea       272(%rsp), %rdx
        movq      8(%rsp), %rax
        movq      %rax, %rdi
        movq      (%rsp), %r11
        xorl      %eax, %eax
        movq      %rdx, 248(%rsp)
        xorl      %edx, %edx
        pushq     %rsp
..___tag_value__Z8leibniz3v.26:
        pushq     272(%rsp)
..___tag_value__Z8leibniz3v.27:
        pushq     %rdx
..___tag_value__Z8leibniz3v.28:
        movq      32+.2.12_2__offload_var_desc2_p.55(%rip), %rcx
        movq      40+.2.12_2__offload_var_desc2_p.55(%rip), %rsi
        movq      .2.12_2__offload_var_desc2_p.55(%rip), %r10
        movq      %rcx, 32(%r9)
        pushq     $3
        popq      %rcx
        movq      %rsi, 40(%r9)
        movl      $__sd_2inst_string.2, %esi
        movq      %r10, (%r9)
        movb      $1, %r10b
        pushq     %rdx
..___tag_value__Z8leibniz3v.29:
        movb      %r10b, 2(%r8)
        movb      %r10b, 3(%r8)
        movl      $64, 4(%r8)
        movq      %r11, 32(%r8)
..___tag_value__Z8leibniz3v.30:
        call      __offload_offload
..___tag_value__Z8leibniz3v.31:
..B2.26:
        addq      $32, %rsp
..___tag_value__Z8leibniz3v.32:
..B2.7:
        testl     %eax, %eax
        je        ..B2.9
..B2.8:
        movsd     272(%rsp), %xmm0
        jmp       ..B2.14
..B2.9:
        movq      264(%rsp), %rdi
        movq      256(%rsp), %rsi
..___tag_value__Z8leibniz3v.33:
        call      _Z13hostmic_scalePdl
..___tag_value__Z8leibniz3v.34:
..B2.10:
        movq      264(%rsp), %rdi
        movq      256(%rsp), %rsi
..___tag_value__Z8leibniz3v.35:
        call      _Z13hostmic_scalePdl
..___tag_value__Z8leibniz3v.36:
..B2.11:
        movq      264(%rsp), %rdi
        movq      256(%rsp), %rsi
..___tag_value__Z8leibniz3v.37:
        call      _Z13hostmic_scalePdl
..___tag_value__Z8leibniz3v.38:
..B2.12:
        movq      264(%rsp), %rdi
        movq      256(%rsp), %rsi
..___tag_value__Z8leibniz3v.39:
        call      _Z7mic_sumPdl
..___tag_value__Z8leibniz3v.40:
..B2.13:
        movsd     %xmm0, 272(%rsp)
..B2.14:
        movl      $.L_2__STRING.3, %edi
        movl      $1, %eax
..___tag_value__Z8leibniz3v.41:
        call      printf
..___tag_value__Z8leibniz3v.42:
..B2.15:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.7, %r8d
        movl      $84, %r9d
        xorl      %eax, %eax
..___tag_value__Z8leibniz3v.43:
        call      __offload_target_acquire
..___tag_value__Z8leibniz3v.44:
..B2.16:
        testq     %rax, %rax
        je        ..B2.18
..B2.17:
        movq      264(%rsp), %r10
        lea       (%rsp), %rdx
        movq      %r10, (%rsp)
        movb      $1, %r11b
        pushq     %rsp
..___tag_value__Z8leibniz3v.45:
        pushq     $0
..___tag_value__Z8leibniz3v.46:
        movzbl    %r11b, %ecx
        movl      $__sd_2inst_string.8, %esi
        pushq     %rdx
..___tag_value__Z8leibniz3v.47:
        pushq     %rcx
..___tag_value__Z8leibniz3v.48:
        xorl      %ecx, %ecx
        movq      %rax, %rdi
        pushq     $1
        popq      %rdx
        xorl      %r8d, %r8d
        xorl      %r9d, %r9d
        xorl      %eax, %eax
..___tag_value__Z8leibniz3v.49:
        call      __offload_offload
..___tag_value__Z8leibniz3v.50:
..B2.30:
        addq      $32, %rsp
..___tag_value__Z8leibniz3v.51:
..B2.18:
        movsd     272(%rsp), %xmm0
        movl      $.L_2__STRING.3, %edi
        movl      $1, %eax
..___tag_value__Z8leibniz3v.52:
        call      printf
..___tag_value__Z8leibniz3v.53:
..B2.19:
        movq      264(%rsp), %rdi
        call      _mm_free
..B2.20:
..___tag_value__Z8leibniz3v.54:
        call      _Z8mic_exitv
..___tag_value__Z8leibniz3v.55:
..B2.21:
        addq      $296, %rsp
..___tag_value__Z8leibniz3v.56:
        ret       
        .align    16,0x90
..___tag_value__Z8leibniz3v.57:
	.type	_Z8leibniz3v,@function
	.size	_Z8leibniz3v,.-_Z8leibniz3v
	.section .gcc_except_table, "a"
	.align 4
_Z8leibniz3v$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value__Z8leibniz3v.61 - ..___tag_value__Z8leibniz3v.60
..___tag_value__Z8leibniz3v.60:
	.byte	1
	.uleb128	..___tag_value__Z8leibniz3v.59 - ..___tag_value__Z8leibniz3v.58
..___tag_value__Z8leibniz3v.58:
	.uleb128	..___tag_value__Z8leibniz3v.20 - ..___tag_value__Z8leibniz3v.17
	.uleb128	..___tag_value__Z8leibniz3v.23 - ..___tag_value__Z8leibniz3v.20
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z8leibniz3v.41 - ..___tag_value__Z8leibniz3v.17
	.uleb128	..___tag_value__Z8leibniz3v.42 - ..___tag_value__Z8leibniz3v.41
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z8leibniz3v.52 - ..___tag_value__Z8leibniz3v.17
	.uleb128	..___tag_value__Z8leibniz3v.55 - ..___tag_value__Z8leibniz3v.52
	.byte	0
	.byte	0
..___tag_value__Z8leibniz3v.59:
	.long	0x00000000,0x00000000
..___tag_value__Z8leibniz3v.61:
	.data
	.space 3, 0x00 	# pad
	.align 8
.2.12_2__offload_var_desc1_p.50:
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
	.align 8
.2.12_2__offload_var_desc2_p.55:
	.quad	__sd_2inst_string.3
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.4
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.5
	.long	0x00000000,0x00000000
	.section .rodata, "a"
	.align 8
	.align 4
__sd_2inst_string.1:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
	.align 4
__sd_2inst_string.3:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.4:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.5:
	.byte	115
	.byte	117
	.byte	109
	.byte	0
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	55
	.byte	51
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	51
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.7:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	56
	.byte	52
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	51
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	55
	.byte	51
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	51
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.6:
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	56
	.byte	52
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	51
	.byte	118
	.byte	0
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_73_Z8leibniz3v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_73_Z8leibniz3v_$entry:
	.type	__offload_entry_leibniz_cpp_73_Z8leibniz3v_$entry,@object
	.size	__offload_entry_leibniz_cpp_73_Z8leibniz3v_$entry,16
	.quad	__sd_2inst_string.0
	.quad	__sd_2inst_string.0
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_84_Z8leibniz3v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_84_Z8leibniz3v_$entry:
	.type	__offload_entry_leibniz_cpp_84_Z8leibniz3v_$entry,@object
	.size	__offload_entry_leibniz_cpp_84_Z8leibniz3v_$entry,16
	.quad	__sd_2inst_string.6
	.quad	__sd_2inst_string.6
	.data
# -- End  _Z8leibniz3v
	.text
# -- Begin  _Z8leibniz1v
       .align    16,0x90
	.globl _Z8leibniz1v
_Z8leibniz1v:
..B3.1:
..___tag_value__Z8leibniz1v.62:
        subq      $1016, %rsp
..___tag_value__Z8leibniz1v.64:
        lea       1008(%rsp), %rdi
..___tag_value__Z8leibniz1v.65:
        call      _Z8mic_initRi
..___tag_value__Z8leibniz1v.66:
..B3.2:
        movl      $.L_2__STRING.0, %edi
        movq      $0x17d784000, %rsi
        xorl      %eax, %eax
        movq      $800000000, 24(%rsp)
..___tag_value__Z8leibniz1v.67:
        call      printf
..___tag_value__Z8leibniz1v.68:
..B3.3:
        movq      $0x17d784000, %rdi
        movl      $64, %esi
        call      _mm_malloc
..B3.4:
        movq      %rax, %rdi
        movq      24(%rsp), %rsi
        movq      %rax, 992(%rsp)
..___tag_value__Z8leibniz1v.69:
        call      _Z12leibniz_initPdl
..___tag_value__Z8leibniz1v.70:
..B3.5:
        movl      $.L_2__STRING.1, %edi
        xorl      %eax, %eax
        movq      992(%rsp), %rsi
..___tag_value__Z8leibniz1v.71:
        call      printf
..___tag_value__Z8leibniz1v.72:
..B3.6:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.10, %r8d
        movl      $18, %r9d
        xorl      %eax, %eax
..___tag_value__Z8leibniz1v.73:
        call      __offload_target_acquire
..___tag_value__Z8leibniz1v.74:
..B3.7:
        testq     %rax, %rax
        je        ..B3.9
..B3.8:
        movq      24(%rsp), %rdx
        lea       224(%rsp), %r8
        movl      $128, %r11d
..B3.34:
        movq      -8+.2.13_2__offload_var_desc1_p.108(%r11), %rcx
        movq      -16+.2.13_2__offload_var_desc1_p.108(%r11), %rsi
        movq      -24+.2.13_2__offload_var_desc1_p.108(%r11), %r9
        movq      -32+.2.13_2__offload_var_desc1_p.108(%r11), %r10
        movq      %rcx, -8(%r8,%r11)
        movq      %rsi, -16(%r8,%r11)
        movq      %r9, -24(%r8,%r11)
        movq      %r10, -32(%r8,%r11)
        subq      $32, %r11
        jne       ..B3.34
..B3.33:
        movq      .2.13_2__offload_var_desc2_p.113(%rip), %r10
        lea       32(%rsp), %r9
        movq      8+.2.13_2__offload_var_desc2_p.113(%rip), %r11
        movq      %rax, %rdi
        movq      %rdx, 320(%rsp)
        lea       992(%rsp), %rdx
        movq      %r10, (%r9)
        lea       (%rsp), %r10
        movq      %r11, 8(%r9)
        xorl      %r11d, %r11d
        movb      $1, 290(%rsp)
        xorl      %eax, %eax
        movb      $0, 291(%rsp)
        movl      $64, 292(%rsp)
        movq      %rdx, 344(%rsp)
        pushq     $1
        popq      %rdx
        pushq     %rsp
..___tag_value__Z8leibniz1v.75:
        pushq     %r11
..___tag_value__Z8leibniz1v.76:
        movq      16+.2.13_2__offload_var_desc2_p.113(%rip), %rcx
        movq      24+.2.13_2__offload_var_desc2_p.113(%rip), %rsi
        pushq     %r11
..___tag_value__Z8leibniz1v.77:
        movq      %rcx, 16(%r9)
        pushq     $2
        popq      %rcx
        movq      %rsi, 24(%r9)
        movl      $__sd_2inst_string.11, %esi
        pushq     %r11
..___tag_value__Z8leibniz1v.78:
        movq      %r10, 56(%r8)
..___tag_value__Z8leibniz1v.79:
        call      __offload_offload
..___tag_value__Z8leibniz1v.80:
..B3.39:
        addq      $32, %rsp
..___tag_value__Z8leibniz1v.81:
..B3.9:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.15, %r8d
        movl      $22, %r9d
        xorl      %eax, %eax
..___tag_value__Z8leibniz1v.82:
        call      __offload_target_acquire
..___tag_value__Z8leibniz1v.83:
..B3.10:
        testq     %rax, %rax
        je        ..B3.13
..B3.11:
        movq      24(%rsp), %rcx
        lea       736(%rsp), %rdi
        movl      $256, %edx
        lea       .2.13_2__offload_var_desc1_p.130(%rip), %rsi
        movq      %rcx, 8(%rsp)
        movq      %rax, 16(%rsp)
        call      _intel_fast_memcpy
..B3.41:
        movq      16(%rsp), %rax
        lea       64(%rsp), %r9
        pushq     $64
        popq      %r10
..B3.36:
        movq      -8+.2.13_2__offload_var_desc2_p.135(%r10), %rdx
        movq      -16+.2.13_2__offload_var_desc2_p.135(%r10), %rcx
        movq      -24+.2.13_2__offload_var_desc2_p.135(%r10), %rsi
        movq      -32+.2.13_2__offload_var_desc2_p.135(%r10), %r8
        movq      %rdx, -8(%r9,%r10)
        movq      %rcx, -16(%r9,%r10)
        movq      %rsi, -24(%r9,%r10)
        movq      %r8, -32(%r9,%r10)
        subq      $32, %r10
        jne       ..B3.36
..B3.35:
        movq      8(%rsp), %rdx
        lea       736(%rsp), %r8
        xorl      %r11d, %r11d
        lea       (%rsp), %r10
        movq      %r10, 56(%r8)
        lea       992(%rsp), %rcx
        movq      %r10, 856(%rsp)
        lea       24(%rsp), %rsi
        movb      %r11b, 866(%rsp)
        xorl      %r10d, %r10d
        movb      %r11b, 867(%rsp)
        movq      %rax, %rdi
        movq      %rdx, 896(%rsp)
        xorl      %edx, %edx
        movq      %rcx, 920(%rsp)
        pushq     $4
        popq      %rcx
        movq      %rsi, 984(%rsp)
        movl      $__sd_2inst_string.16, %esi
        pushq     %rsp
..___tag_value__Z8leibniz1v.84:
        pushq     %r10
..___tag_value__Z8leibniz1v.85:
        pushq     %r10
..___tag_value__Z8leibniz1v.86:
        xorl      %eax, %eax
        pushq     %r10
..___tag_value__Z8leibniz1v.87:
        call      __offload_offload
..___tag_value__Z8leibniz1v.89:
..B3.42:
        addq      $32, %rsp
..___tag_value__Z8leibniz1v.90:
..B3.12:
        testl     %eax, %eax
        jne       ..B3.14
..B3.13:
        movq      992(%rsp), %rdi
        movq      24(%rsp), %rsi
..___tag_value__Z8leibniz1v.91:
        call      _Z13hostmic_scalePdl
..___tag_value__Z8leibniz1v.92:
..B3.14:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.22, %r8d
        movl      $25, %r9d
        xorl      %eax, %eax
..___tag_value__Z8leibniz1v.93:
        call      __offload_target_acquire
..___tag_value__Z8leibniz1v.94:
..B3.15:
        testq     %rax, %rax
        je        ..B3.18
..B3.16:
        movq      24(%rsp), %rcx
        lea       352(%rsp), %rdi
        movl      $192, %edx
        lea       .2.13_2__offload_var_desc1_p.152(%rip), %rsi
        movq      %rcx, 8(%rsp)
        movq      %rax, 16(%rsp)
        call      _intel_fast_memcpy
..B3.45:
        movq      24+.2.13_2__offload_var_desc2_p.157(%rip), %rdx
        lea       128(%rsp), %r9
        movq      %rdx, 24(%r9)
        movq      8(%rsp), %rdx
        movq      8+.2.13_2__offload_var_desc2_p.157(%rip), %r11
        movq      .2.13_2__offload_var_desc2_p.157(%rip), %r10
        movq      16+.2.13_2__offload_var_desc2_p.157(%rip), %r8
        movq      %rdx, 448(%rsp)
        lea       992(%rsp), %rdx
        movq      %r11, 8(%r9)
        xorl      %r11d, %r11d
        movq      %rdx, 472(%rsp)
        lea       24(%rsp), %rdx
        movq      16(%rsp), %rax
        movq      %rax, %rdi
        movq      %r10, (%r9)
        lea       (%rsp), %r10
        movq      %r8, 16(%r9)
        lea       352(%rsp), %r8
        movb      %r11b, 418(%rsp)
        xorl      %eax, %eax
        movb      %r11b, 419(%rsp)
        movl      $64, 420(%rsp)
        movq      %rdx, 536(%rsp)
        xorl      %edx, %edx
        pushq     %rsp
..___tag_value__Z8leibniz1v.95:
        pushq     %rdx
..___tag_value__Z8leibniz1v.96:
        movq      32+.2.13_2__offload_var_desc2_p.157(%rip), %rcx
        movq      40+.2.13_2__offload_var_desc2_p.157(%rip), %rsi
        pushq     %rdx
..___tag_value__Z8leibniz1v.97:
        movq      %rcx, 32(%r9)
        pushq     $3
        popq      %rcx
        movq      %rsi, 40(%r9)
        movl      $__sd_2inst_string.23, %esi
        pushq     %rdx
..___tag_value__Z8leibniz1v.98:
        movq      %r10, 56(%r8)
..___tag_value__Z8leibniz1v.99:
        call      __offload_offload
..___tag_value__Z8leibniz1v.100:
..B3.44:
        addq      $32, %rsp
..___tag_value__Z8leibniz1v.101:
..B3.17:
        testl     %eax, %eax
        jne       ..B3.19
..B3.18:
        movq      992(%rsp), %rdi
        movq      24(%rsp), %rsi
..___tag_value__Z8leibniz1v.102:
        call      _Z13hostmic_scalePdl
..___tag_value__Z8leibniz1v.103:
..B3.19:
        movq      992(%rsp), %rdi
        movq      24(%rsp), %rsi
..___tag_value__Z8leibniz1v.104:
        call      _Z13hostmic_scalePdl
..___tag_value__Z8leibniz1v.105:
..B3.20:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.28, %r8d
        movl      $32, %r9d
        xorl      %eax, %eax
..___tag_value__Z8leibniz1v.106:
        call      __offload_target_acquire
..___tag_value__Z8leibniz1v.107:
..B3.21:
        testq     %rax, %rax
        je        ..B3.25
..B3.22:
        movq      24(%rsp), %rcx
        lea       544(%rsp), %rdi
        movl      $192, %edx
        lea       .2.13_2__offload_var_desc1_p.175(%rip), %rsi
        movq      %rcx, 8(%rsp)
        movq      %rax, 16(%rsp)
        call      _intel_fast_memcpy
..B3.48:
        movq      24+.2.13_2__offload_var_desc2_p.180(%rip), %rdx
        lea       176(%rsp), %r9
        movq      .2.13_2__offload_var_desc2_p.180(%rip), %r10
        movq      8+.2.13_2__offload_var_desc2_p.180(%rip), %r11
        movq      16+.2.13_2__offload_var_desc2_p.180(%rip), %r8
        movq      %rdx, 24(%r9)
        lea       1000(%rsp), %rdx
        movq      %r10, (%r9)
        movq      %rdx, 664(%rsp)
        lea       24(%rsp), %rdx
        movq      16(%rsp), %rax
        movq      %rax, %rdi
        movq      8(%rsp), %r10
        xorl      %eax, %eax
        movq      %r11, 8(%r9)
        lea       992(%rsp), %r11
        movq      %r8, 16(%r9)
        lea       544(%rsp), %r8
        movq      %rdx, 728(%rsp)
        xorl      %edx, %edx
        pushq     %rsp
..___tag_value__Z8leibniz1v.108:
        pushq     %rdx
..___tag_value__Z8leibniz1v.109:
        movq      32+.2.13_2__offload_var_desc2_p.180(%rip), %rcx
        movq      40+.2.13_2__offload_var_desc2_p.180(%rip), %rsi
        pushq     %rdx
..___tag_value__Z8leibniz1v.110:
        movq      %rcx, 32(%r9)
        pushq     $3
        popq      %rcx
        movq      %rsi, 40(%r9)
        movl      $__sd_2inst_string.29, %esi
        pushq     %rdx
..___tag_value__Z8leibniz1v.111:
        movb      $0, 2(%r8)
        movb      $1, 3(%r8)
        movl      $64, 4(%r8)
        movq      %r10, 32(%r8)
        movq      %r11, 56(%r8)
..___tag_value__Z8leibniz1v.112:
        call      __offload_offload
..___tag_value__Z8leibniz1v.113:
..B3.47:
        addq      $32, %rsp
..___tag_value__Z8leibniz1v.114:
..B3.23:
        testl     %eax, %eax
        je        ..B3.25
..B3.24:
        movsd     1000(%rsp), %xmm0
        jmp       ..B3.27
..B3.25:
        movq      992(%rsp), %rdi
        movq      24(%rsp), %rsi
..___tag_value__Z8leibniz1v.115:
        call      _Z7mic_sumPdl
..___tag_value__Z8leibniz1v.116:
..B3.26:
        movsd     %xmm0, 1000(%rsp)
..B3.27:
        movl      $.L_2__STRING.2, %edi
        movl      $1, %eax
..___tag_value__Z8leibniz1v.117:
        call      printf
..___tag_value__Z8leibniz1v.118:
..B3.28:
        movq      992(%rsp), %rdi
        call      _mm_free
..B3.29:
..___tag_value__Z8leibniz1v.119:
        call      _Z8mic_exitv
..___tag_value__Z8leibniz1v.120:
..B3.30:
        addq      $1016, %rsp
..___tag_value__Z8leibniz1v.121:
        ret       
        .align    16,0x90
..___tag_value__Z8leibniz1v.122:
	.type	_Z8leibniz1v,@function
	.size	_Z8leibniz1v,.-_Z8leibniz1v
	.data
	.align 8
.2.13_2__offload_var_desc1_p.108:
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
.2.13_2__offload_var_desc2_p.113:
	.quad	__sd_2inst_string.12
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.13
	.long	0x00000000,0x00000000
	.align 8
.2.13_2__offload_var_desc1_p.130:
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
.2.13_2__offload_var_desc2_p.135:
	.quad	__sd_2inst_string.17
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.18
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.19
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.20
	.long	0x00000000,0x00000000
	.align 8
.2.13_2__offload_var_desc1_p.152:
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
.2.13_2__offload_var_desc2_p.157:
	.quad	__sd_2inst_string.24
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.25
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.26
	.long	0x00000000,0x00000000
	.align 8
.2.13_2__offload_var_desc1_p.175:
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
.2.13_2__offload_var_desc2_p.180:
	.quad	__sd_2inst_string.30
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.31
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.32
	.long	0x00000000,0x00000000
	.section .rodata, "a"
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.10:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	46
	.byte	99
	.byte	112
	.byte	112
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
__sd_2inst_string.13:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.11:
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	49
	.byte	56
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.15:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
	.align 4
__sd_2inst_string.17:
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
__sd_2inst_string.19:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.20:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.16:
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	50
	.byte	50
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.22:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
	.align 4
__sd_2inst_string.24:
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
__sd_2inst_string.25:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.26:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.23:
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	50
	.byte	53
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.28:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
	.align 4
__sd_2inst_string.30:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.31:
	.byte	115
	.byte	117
	.byte	109
	.byte	0
	.align 4
__sd_2inst_string.32:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.29:
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	51
	.byte	50
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	49
	.byte	56
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	50
	.byte	50
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.21:
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	50
	.byte	53
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.27:
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	51
	.byte	50
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	49
	.byte	118
	.byte	0
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_18_Z8leibniz1v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_18_Z8leibniz1v_$entry:
	.type	__offload_entry_leibniz_cpp_18_Z8leibniz1v_$entry,@object
	.size	__offload_entry_leibniz_cpp_18_Z8leibniz1v_$entry,16
	.quad	__sd_2inst_string.9
	.quad	__sd_2inst_string.9
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_22_Z8leibniz1v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_22_Z8leibniz1v_$entry:
	.type	__offload_entry_leibniz_cpp_22_Z8leibniz1v_$entry,@object
	.size	__offload_entry_leibniz_cpp_22_Z8leibniz1v_$entry,16
	.quad	__sd_2inst_string.14
	.quad	__sd_2inst_string.14
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_25_Z8leibniz1v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_25_Z8leibniz1v_$entry:
	.type	__offload_entry_leibniz_cpp_25_Z8leibniz1v_$entry,@object
	.size	__offload_entry_leibniz_cpp_25_Z8leibniz1v_$entry,16
	.quad	__sd_2inst_string.21
	.quad	__sd_2inst_string.21
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_32_Z8leibniz1v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_32_Z8leibniz1v_$entry:
	.type	__offload_entry_leibniz_cpp_32_Z8leibniz1v_$entry,@object
	.size	__offload_entry_leibniz_cpp_32_Z8leibniz1v_$entry,16
	.quad	__sd_2inst_string.27
	.quad	__sd_2inst_string.27
	.data
# -- End  _Z8leibniz1v
	.text
# -- Begin  _Z8leibniz2v
       .align    16,0x90
	.globl _Z8leibniz2v
_Z8leibniz2v:
..B4.1:
..___tag_value__Z8leibniz2v.123:
        subq      $296, %rsp
..___tag_value__Z8leibniz2v.125:
        lea       280(%rsp), %rdi
..___tag_value__Z8leibniz2v.126:
        call      _Z8mic_initRi
..___tag_value__Z8leibniz2v.127:
..B4.2:
        movq      $0x17d784000, %rdi
        movl      $64, %esi
        movq      $800000000, 256(%rsp)
        call      _mm_malloc
..B4.3:
        movq      %rax, %rdi
        movq      256(%rsp), %rsi
        movq      %rax, 264(%rsp)
..___tag_value__Z8leibniz2v.128:
        call      _Z12leibniz_initPdl
..___tag_value__Z8leibniz2v.129:
..B4.4:
        xorl      %esi, %esi
        movl      $2, %edi
        xorl      %edx, %edx
        xorl      %ecx, %ecx
        movl      $__sd_2inst_string.34, %r8d
        movl      $50, %r9d
        xorl      %eax, %eax
..___tag_value__Z8leibniz2v.130:
        call      __offload_target_acquire
..___tag_value__Z8leibniz2v.131:
..B4.5:
        testq     %rax, %rax
        je        ..B4.9
..B4.6:
        movq      256(%rsp), %rcx
        lea       64(%rsp), %rdi
        movl      $192, %edx
        lea       .2.14_2__offload_var_desc1_p.213(%rip), %rsi
        movq      %rcx, (%rsp)
        movq      %rax, 8(%rsp)
        call      _intel_fast_memcpy
..B4.23:
        movq      16+.2.14_2__offload_var_desc2_p.218(%rip), %r8
        lea       16(%rsp), %r9
        movq      24+.2.14_2__offload_var_desc2_p.218(%rip), %rdx
        movq      %r8, 16(%r9)
        lea       64(%rsp), %r8
        movq      8+.2.14_2__offload_var_desc2_p.218(%rip), %r11
        movq      %rdx, 24(%r9)
        lea       264(%rsp), %rdx
        movq      %rdx, 56(%r8)
        lea       256(%rsp), %rdx
        movq      %r11, 8(%r9)
        movq      %rdx, 184(%rsp)
        lea       272(%rsp), %rdx
        movq      8(%rsp), %rax
        movq      %rax, %rdi
        movq      (%rsp), %r11
        xorl      %eax, %eax
        movq      %rdx, 248(%rsp)
        xorl      %edx, %edx
        pushq     %rsp
..___tag_value__Z8leibniz2v.132:
        pushq     %rdx
..___tag_value__Z8leibniz2v.133:
        movq      32+.2.14_2__offload_var_desc2_p.218(%rip), %rcx
        movq      40+.2.14_2__offload_var_desc2_p.218(%rip), %rsi
        movq      .2.14_2__offload_var_desc2_p.218(%rip), %r10
        pushq     %rdx
..___tag_value__Z8leibniz2v.134:
        movq      %rcx, 32(%r9)
        pushq     $3
        popq      %rcx
        movq      %rsi, 40(%r9)
        movl      $__sd_2inst_string.35, %esi
        movq      %r10, (%r9)
        movb      $1, %r10b
        pushq     %rdx
..___tag_value__Z8leibniz2v.135:
        movb      %r10b, 2(%r8)
        movb      %r10b, 3(%r8)
        movl      $64, 4(%r8)
        movq      %r11, 32(%r8)
..___tag_value__Z8leibniz2v.136:
        call      __offload_offload
..___tag_value__Z8leibniz2v.137:
..B4.22:
        addq      $32, %rsp
..___tag_value__Z8leibniz2v.138:
..B4.7:
        testl     %eax, %eax
        je        ..B4.9
..B4.8:
        movsd     272(%rsp), %xmm0
        jmp       ..B4.14
..B4.9:
        movq      264(%rsp), %rdi
        movq      256(%rsp), %rsi
..___tag_value__Z8leibniz2v.139:
        call      _Z13hostmic_scalePdl
..___tag_value__Z8leibniz2v.140:
..B4.10:
        movq      264(%rsp), %rdi
        movq      256(%rsp), %rsi
..___tag_value__Z8leibniz2v.141:
        call      _Z13hostmic_scalePdl
..___tag_value__Z8leibniz2v.142:
..B4.11:
        movq      264(%rsp), %rdi
        movq      256(%rsp), %rsi
..___tag_value__Z8leibniz2v.143:
        call      _Z13hostmic_scalePdl
..___tag_value__Z8leibniz2v.144:
..B4.12:
        movq      264(%rsp), %rdi
        movq      256(%rsp), %rsi
..___tag_value__Z8leibniz2v.145:
        call      _Z7mic_sumPdl
..___tag_value__Z8leibniz2v.146:
..B4.13:
        movsd     %xmm0, 272(%rsp)
..B4.14:
        movl      $.L_2__STRING.3, %edi
        movl      $1, %eax
..___tag_value__Z8leibniz2v.147:
        call      printf
..___tag_value__Z8leibniz2v.148:
..B4.15:
        movq      264(%rsp), %rdi
        call      _mm_free
..B4.16:
..___tag_value__Z8leibniz2v.149:
        call      _Z8mic_exitv
..___tag_value__Z8leibniz2v.150:
..B4.17:
        addq      $296, %rsp
..___tag_value__Z8leibniz2v.151:
        ret       
        .align    16,0x90
..___tag_value__Z8leibniz2v.152:
	.type	_Z8leibniz2v,@function
	.size	_Z8leibniz2v,.-_Z8leibniz2v
	.section .gcc_except_table, "a"
	.align 4
_Z8leibniz2v$$LSDA:
	.byte	255
	.byte	0
	.uleb128	..___tag_value__Z8leibniz2v.156 - ..___tag_value__Z8leibniz2v.155
..___tag_value__Z8leibniz2v.155:
	.byte	1
	.uleb128	..___tag_value__Z8leibniz2v.154 - ..___tag_value__Z8leibniz2v.153
..___tag_value__Z8leibniz2v.153:
	.uleb128	..___tag_value__Z8leibniz2v.126 - ..___tag_value__Z8leibniz2v.123
	.uleb128	..___tag_value__Z8leibniz2v.129 - ..___tag_value__Z8leibniz2v.126
	.byte	0
	.byte	0
	.uleb128	..___tag_value__Z8leibniz2v.147 - ..___tag_value__Z8leibniz2v.123
	.uleb128	..___tag_value__Z8leibniz2v.150 - ..___tag_value__Z8leibniz2v.147
	.byte	0
	.byte	0
..___tag_value__Z8leibniz2v.154:
	.long	0x00000000,0x00000000
..___tag_value__Z8leibniz2v.156:
	.data
	.align 8
.2.14_2__offload_var_desc1_p.213:
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
	.align 8
.2.14_2__offload_var_desc2_p.218:
	.quad	__sd_2inst_string.36
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.37
	.long	0x00000000,0x00000000
	.quad	__sd_2inst_string.38
	.long	0x00000000,0x00000000
	.section .rodata, "a"
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.34:
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	46
	.byte	99
	.byte	112
	.byte	112
	.byte	0
	.align 4
__sd_2inst_string.36:
	.byte	118
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.37:
	.byte	110
	.byte	0
	.space 2, 0x00 	# pad
	.align 4
__sd_2inst_string.38:
	.byte	115
	.byte	117
	.byte	109
	.byte	0
	.align 4
__sd_2inst_string.35:
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	53
	.byte	48
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	50
	.byte	118
	.byte	0
	.space 1, 0x00 	# pad
	.align 4
__sd_2inst_string.33:
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
	.byte	99
	.byte	112
	.byte	112
	.byte	95
	.byte	53
	.byte	48
	.byte	95
	.byte	90
	.byte	56
	.byte	108
	.byte	101
	.byte	105
	.byte	98
	.byte	110
	.byte	105
	.byte	122
	.byte	50
	.byte	118
	.byte	0
	.section .OffloadEntryTable., "waG",@progbits,__offload_entry_leibniz_cpp_50_Z8leibniz2v_$entry,comdat
	.align 16
__offload_entry_leibniz_cpp_50_Z8leibniz2v_$entry:
	.type	__offload_entry_leibniz_cpp_50_Z8leibniz2v_$entry,@object
	.size	__offload_entry_leibniz_cpp_50_Z8leibniz2v_$entry,16
	.quad	__sd_2inst_string.33
	.quad	__sd_2inst_string.33
	.data
# -- End  _Z8leibniz2v
	.text
# -- Begin  __sti__$E
       .align    16,0x90
__sti__$E:
..B5.1:
..___tag_value___sti__$E.157:
        pushq     %rsi
..___tag_value___sti__$E.159:
        movl      $_ZSt8__ioinit, %edi
..___tag_value___sti__$E.160:
        call      _ZNSt8ios_base4InitC1Ev
..___tag_value___sti__$E.161:
..B5.2:
        movl      $_ZNSt8ios_base4InitD1Ev, %edi
        movl      $_ZSt8__ioinit, %esi
        movl      $__dso_handle, %edx
        addq      $8, %rsp
..___tag_value___sti__$E.162:
        jmp       __cxa_atexit
        .align    16,0x90
..___tag_value___sti__$E.163:
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
	.space 5, 0x00 	# pad
	.align 8
.L_2il0floatpacket.68:
	.long	0x00000000,0xbff00000
	.type	.L_2il0floatpacket.68,@object
	.size	.L_2il0floatpacket.68,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.3:
	.byte	9
	.byte	9
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
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,12
	.align 4
.L_2__STRING.0:
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
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,26
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
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
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,26
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.2:
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
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,25
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
	.4byte 0x00000034
	.4byte 0x00000044
	.8byte ..___tag_value_main.1
	.8byte ..___tag_value_main.16-..___tag_value_main.1
	.2byte 0x0400
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.14-..___tag_value_main.4
	.8byte 0x00000000c608070c
	.byte 0x00
	.4byte 0x0000007c
	.4byte 0x0000005c
	.8byte ..___tag_value__Z8leibniz3v.17
	.8byte ..___tag_value__Z8leibniz3v.57-..___tag_value__Z8leibniz3v.17
	.byte 0x08
	.8byte _Z8leibniz3v$$LSDA
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz3v.19-..___tag_value__Z8leibniz3v.17
	.4byte 0x0402b00e
	.4byte ..___tag_value__Z8leibniz3v.26-..___tag_value__Z8leibniz3v.19
	.4byte 0x0402b80e
	.4byte ..___tag_value__Z8leibniz3v.27-..___tag_value__Z8leibniz3v.26
	.4byte 0x0402c00e
	.4byte ..___tag_value__Z8leibniz3v.28-..___tag_value__Z8leibniz3v.27
	.4byte 0x0402c80e
	.4byte ..___tag_value__Z8leibniz3v.29-..___tag_value__Z8leibniz3v.28
	.4byte 0x0402d00e
	.4byte ..___tag_value__Z8leibniz3v.32-..___tag_value__Z8leibniz3v.29
	.4byte 0x0402b00e
	.4byte ..___tag_value__Z8leibniz3v.45-..___tag_value__Z8leibniz3v.32
	.4byte 0x0402b80e
	.4byte ..___tag_value__Z8leibniz3v.46-..___tag_value__Z8leibniz3v.45
	.4byte 0x0402c00e
	.4byte ..___tag_value__Z8leibniz3v.47-..___tag_value__Z8leibniz3v.46
	.4byte 0x0402c80e
	.4byte ..___tag_value__Z8leibniz3v.48-..___tag_value__Z8leibniz3v.47
	.4byte 0x0402d00e
	.4byte ..___tag_value__Z8leibniz3v.51-..___tag_value__Z8leibniz3v.48
	.4byte 0x0402b00e
	.4byte ..___tag_value__Z8leibniz3v.56-..___tag_value__Z8leibniz3v.51
	.2byte 0x080e
	.4byte 0x000000c4
	.4byte 0x000000fc
	.8byte ..___tag_value__Z8leibniz1v.62
	.8byte ..___tag_value__Z8leibniz1v.122-..___tag_value__Z8leibniz1v.62
	.2byte 0x0400
	.4byte ..___tag_value__Z8leibniz1v.64-..___tag_value__Z8leibniz1v.62
	.4byte 0x0408800e
	.4byte ..___tag_value__Z8leibniz1v.75-..___tag_value__Z8leibniz1v.64
	.4byte 0x0408880e
	.4byte ..___tag_value__Z8leibniz1v.76-..___tag_value__Z8leibniz1v.75
	.4byte 0x0408900e
	.4byte ..___tag_value__Z8leibniz1v.77-..___tag_value__Z8leibniz1v.76
	.4byte 0x0408980e
	.4byte ..___tag_value__Z8leibniz1v.78-..___tag_value__Z8leibniz1v.77
	.4byte 0x0408a00e
	.4byte ..___tag_value__Z8leibniz1v.81-..___tag_value__Z8leibniz1v.78
	.4byte 0x0408800e
	.4byte ..___tag_value__Z8leibniz1v.84-..___tag_value__Z8leibniz1v.81
	.4byte 0x0408880e
	.4byte ..___tag_value__Z8leibniz1v.85-..___tag_value__Z8leibniz1v.84
	.4byte 0x0408900e
	.4byte ..___tag_value__Z8leibniz1v.86-..___tag_value__Z8leibniz1v.85
	.4byte 0x0408980e
	.4byte ..___tag_value__Z8leibniz1v.87-..___tag_value__Z8leibniz1v.86
	.4byte 0x0408a00e
	.4byte ..___tag_value__Z8leibniz1v.90-..___tag_value__Z8leibniz1v.87
	.4byte 0x0408800e
	.4byte ..___tag_value__Z8leibniz1v.95-..___tag_value__Z8leibniz1v.90
	.4byte 0x0408880e
	.4byte ..___tag_value__Z8leibniz1v.96-..___tag_value__Z8leibniz1v.95
	.4byte 0x0408900e
	.4byte ..___tag_value__Z8leibniz1v.97-..___tag_value__Z8leibniz1v.96
	.4byte 0x0408980e
	.4byte ..___tag_value__Z8leibniz1v.98-..___tag_value__Z8leibniz1v.97
	.4byte 0x0408a00e
	.4byte ..___tag_value__Z8leibniz1v.101-..___tag_value__Z8leibniz1v.98
	.4byte 0x0408800e
	.4byte ..___tag_value__Z8leibniz1v.108-..___tag_value__Z8leibniz1v.101
	.4byte 0x0408880e
	.4byte ..___tag_value__Z8leibniz1v.109-..___tag_value__Z8leibniz1v.108
	.4byte 0x0408900e
	.4byte ..___tag_value__Z8leibniz1v.110-..___tag_value__Z8leibniz1v.109
	.4byte 0x0408980e
	.4byte ..___tag_value__Z8leibniz1v.111-..___tag_value__Z8leibniz1v.110
	.4byte 0x0408a00e
	.4byte ..___tag_value__Z8leibniz1v.114-..___tag_value__Z8leibniz1v.111
	.4byte 0x0408800e
	.4byte ..___tag_value__Z8leibniz1v.121-..___tag_value__Z8leibniz1v.114
	.2byte 0x080e
	.4byte 0x00000054
	.4byte 0x000001a4
	.8byte ..___tag_value__Z8leibniz2v.123
	.8byte ..___tag_value__Z8leibniz2v.152-..___tag_value__Z8leibniz2v.123
	.byte 0x08
	.8byte _Z8leibniz2v$$LSDA
	.byte 0x04
	.4byte ..___tag_value__Z8leibniz2v.125-..___tag_value__Z8leibniz2v.123
	.4byte 0x0402b00e
	.4byte ..___tag_value__Z8leibniz2v.132-..___tag_value__Z8leibniz2v.125
	.4byte 0x0402b80e
	.4byte ..___tag_value__Z8leibniz2v.133-..___tag_value__Z8leibniz2v.132
	.4byte 0x0402c00e
	.4byte ..___tag_value__Z8leibniz2v.134-..___tag_value__Z8leibniz2v.133
	.4byte 0x0402c80e
	.4byte ..___tag_value__Z8leibniz2v.135-..___tag_value__Z8leibniz2v.134
	.4byte 0x0402d00e
	.4byte ..___tag_value__Z8leibniz2v.138-..___tag_value__Z8leibniz2v.135
	.4byte 0x0402b00e
	.4byte ..___tag_value__Z8leibniz2v.151-..___tag_value__Z8leibniz2v.138
	.2byte 0x080e
	.4byte 0x00000024
	.4byte 0x0000021c
	.8byte ..___tag_value___sti__$E.157
	.8byte ..___tag_value___sti__$E.163-..___tag_value___sti__$E.157
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.159-..___tag_value___sti__$E.157
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.162-..___tag_value___sti__$E.159
	.2byte 0x080e
	.byte 0x00
# End
