	.file "test.cpp"
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
        call      __intel_new_proc_init_R
..___tag_value_main.7:
..B1.7:
        movl      $.2.9_2_kmpc_loc_struct_pack.1, %edi
        xorl      %esi, %esi
        xorl      %eax, %eax
..___tag_value_main.8:
        call      __kmpc_begin
..___tag_value_main.9:
..B1.2:
..___tag_value_main.10:
        call      _Z8test_fmav
..___tag_value_main.11:
..B1.3:
        movl      $.2.9_2_kmpc_loc_struct_pack.12, %edi
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
.2.9_2_kmpc_loc_struct_pack.1:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.0
	.align 4
.2.9_2__kmpc_loc_pack.0:
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
	.byte	50
	.byte	49
	.byte	59
	.byte	50
	.byte	49
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.9_2_kmpc_loc_struct_pack.12:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.11
	.align 4
.2.9_2__kmpc_loc_pack.11:
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
	.byte	50
	.byte	51
	.byte	59
	.byte	50
	.byte	51
	.byte	59
	.byte	59
	.data
# -- End  main
	.text
# -- Begin  _Z8test_fmav
       .align    16,0x90
	.globl _Z8test_fmav
_Z8test_fmav:
..B2.1:
..___tag_value__Z8test_fmav.17:
        pushq     %rbp
..___tag_value__Z8test_fmav.19:
        movq      %rsp, %rbp
..___tag_value__Z8test_fmav.20:
        andq      $-64, %rsp
        pushq     %r12
        subq      $248, %rsp
        movq      $0x401c000000000000, %rdi
        movq      $0x4020000000000000, %rsi
        movq      $0x3ff0000000000000, %rax
        movq      $0x4000000000000000, %rcx
        movq      $0x4008000000000000, %r8
        movq      $0x4010000000000000, %r9
        movq      $0x4014000000000000, %r10
        movq      $0x4018000000000000, %r11
        movq      %rdi, 48(%rsp)
        movq      %rsi, 56(%rsp)
        movq      %rdi, 112(%rsp)
        movq      %rsi, 120(%rsp)
        movq      %rdi, 176(%rsp)
        movq      %rsi, 184(%rsp)
        lea       (%rsp), %rdi
        lea       64(%rsp), %rsi
        lea       128(%rsp), %rdx
        movq      %rax, (%rsp)
        movq      %rcx, 8(%rsp)
        movq      %r8, 16(%rsp)
        movq      %r9, 24(%rsp)
        movq      %r10, 32(%rsp)
        movq      %r11, 40(%rsp)
        movq      %rax, 64(%rsp)
        movq      %rcx, 72(%rsp)
        movq      %r8, 80(%rsp)
        movq      %r9, 88(%rsp)
        movq      %r10, 96(%rsp)
        movq      %r11, 104(%rsp)
        movq      %rax, 128(%rsp)
        movq      %rcx, 136(%rsp)
        movq      %r8, 144(%rsp)
        movq      %r9, 152(%rsp)
        movq      %r10, 160(%rsp)
        movq      %r11, 168(%rsp)
..___tag_value__Z8test_fmav.22:
        call      fma
..___tag_value__Z8test_fmav.23:
..B2.2:
        xorl      %eax, %eax
        vprefetch0 (%rsp)
        vprefetch0 8(%rsp)
        movq      %rax, %r12
        vprefetch0 64(%rsp)
        movb      %al, %al
        vprefetch0 72(%rsp)
        movb      %al, %al
        vprefetch0 128(%rsp)
        movb      %al, %al
        vprefetch0 136(%rsp)
..B2.3:
        movl      $_ZSt4cout, %edi
        movl      $.L_2__STRING.0, %esi
..___tag_value__Z8test_fmav.25:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8test_fmav.26:
..B2.4:
        vbroadcastsd (%rsp,%r12,8), %zmm0
        movq      %rax, %rdi
..___tag_value__Z8test_fmav.27:
        call      _ZNSolsEd
..___tag_value__Z8test_fmav.28:
..B2.5:
        movq      %rax, %rdi
        movl      $.L_2__STRING.1, %esi
..___tag_value__Z8test_fmav.29:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8test_fmav.30:
..B2.6:
        vbroadcastsd 64(%rsp,%r12,8), %zmm0
        movq      %rax, %rdi
..___tag_value__Z8test_fmav.31:
        call      _ZNSolsEd
..___tag_value__Z8test_fmav.32:
..B2.7:
        movq      %rax, %rdi
        movl      $.L_2__STRING.1, %esi
..___tag_value__Z8test_fmav.33:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8test_fmav.34:
..B2.8:
        vbroadcastsd 128(%rsp,%r12,8), %zmm0
        movq      %rax, %rdi
..___tag_value__Z8test_fmav.35:
        call      _ZNSolsEd
..___tag_value__Z8test_fmav.36:
..B2.9:
        movq      %rax, %rdi
        movl      $.L_2__STRING.2, %esi
..___tag_value__Z8test_fmav.37:
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
..___tag_value__Z8test_fmav.38:
..B2.10:
        movq      %rax, %rdi
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %esi
..___tag_value__Z8test_fmav.39:
        call      _ZNSolsEPFRSoS_E
..___tag_value__Z8test_fmav.40:
..B2.11:
        vprefetch1 32(%rsp,%r12,8)
        movb      %al, %al
        vprefetch0 16(%rsp,%r12,8)
        movb      %al, %al
        vprefetch1 96(%rsp,%r12,8)
        movb      %al, %al
        vprefetch0 80(%rsp,%r12,8)
        movb      %al, %al
        vprefetch1 160(%rsp,%r12,8)
        vprefetch0 144(%rsp,%r12,8)
        incq      %r12
        cmpq      $8, %r12
        jb        ..B2.3
..B2.12:
        addq      $248, %rsp
..___tag_value__Z8test_fmav.41:
        popq      %r12
        movq      %rbp, %rsp
        popq      %rbp
..___tag_value__Z8test_fmav.42:
        ret       
        .align    16,0x90
..___tag_value__Z8test_fmav.44:
	.type	_Z8test_fmav,@function
	.size	_Z8test_fmav,.-_Z8test_fmav
	.data
# -- End  _Z8test_fmav
	.text
# -- Begin  fma
       .align    16,0x90
	.globl fma
fma:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B3.1:
..___tag_value_fma.45:
        vmovapd   (%rdi), %zmm1
        vmovapd   (%rsi), %zmm0
        vfmadd213pd (%rdx), %zmm0, %zmm1
        nop       
        vmovapd   %zmm1, (%rdx)
        ret       
        .align    16,0x90
..___tag_value_fma.47:
	.type	fma,@function
	.size	fma,.-fma
	.data
# -- End  fma
	.text
# -- Begin  __sti__$E
       .align    16,0x90
__sti__$E:
..B4.1:
..___tag_value___sti__$E.48:
        pushq     %rsi
..___tag_value___sti__$E.50:
        movl      $_ZSt8__ioinit, %edi
..___tag_value___sti__$E.51:
        call      _ZNSt8ios_base4InitC1Ev
..___tag_value___sti__$E.52:
..B4.2:
        movl      $_ZNSt8ios_base4InitD1Ev, %edi
        movl      $_ZSt8__ioinit, %esi
        movl      $__dso_handle, %edx
        addq      $8, %rsp
..___tag_value___sti__$E.53:
        jmp       __cxa_atexit
        .align    16,0x90
..___tag_value___sti__$E.54:
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
.L_2il0floatpacket.19:
	.long	0x00000000,0x40000000
	.type	.L_2il0floatpacket.19,@object
	.size	.L_2il0floatpacket.19,8
	.align 8
.L_2il0floatpacket.20:
	.long	0x00000000,0x40080000
	.type	.L_2il0floatpacket.20,@object
	.size	.L_2il0floatpacket.20,8
	.align 8
.L_2il0floatpacket.21:
	.long	0x00000000,0x40100000
	.type	.L_2il0floatpacket.21,@object
	.size	.L_2il0floatpacket.21,8
	.align 8
.L_2il0floatpacket.22:
	.long	0x00000000,0x40140000
	.type	.L_2il0floatpacket.22,@object
	.size	.L_2il0floatpacket.22,8
	.align 8
.L_2il0floatpacket.23:
	.long	0x00000000,0x40180000
	.type	.L_2il0floatpacket.23,@object
	.size	.L_2il0floatpacket.23,8
	.align 8
.L_2il0floatpacket.24:
	.long	0x00000000,0x401c0000
	.type	.L_2il0floatpacket.24,@object
	.size	.L_2il0floatpacket.24,8
	.align 8
.L_2il0floatpacket.25:
	.long	0x00000000,0x40200000
	.type	.L_2il0floatpacket.25,@object
	.size	.L_2il0floatpacket.25,8
	.align 8
.L_2il0floatpacket.26:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.26,@object
	.size	.L_2il0floatpacket.26,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.byte	40
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,2
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.byte	44
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,2
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.byte	41
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,2
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
	.4byte 0x00000034
	.4byte 0x00000024
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
	.4byte 0x0000004c
	.4byte 0x0000005c
	.8byte ..___tag_value__Z8test_fmav.17
	.8byte ..___tag_value__Z8test_fmav.44-..___tag_value__Z8test_fmav.17
	.2byte 0x0400
	.4byte ..___tag_value__Z8test_fmav.19-..___tag_value__Z8test_fmav.17
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z8test_fmav.20-..___tag_value__Z8test_fmav.19
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8test_fmav.23-..___tag_value__Z8test_fmav.20
	.8byte 0xffc00d1c380e0c10
	.8byte 0xfffffff80d1affff
	.2byte 0x0422
	.4byte ..___tag_value__Z8test_fmav.41-..___tag_value__Z8test_fmav.23
	.2byte 0x04cc
	.4byte ..___tag_value__Z8test_fmav.42-..___tag_value__Z8test_fmav.41
	.4byte 0xc608070c
	.byte 0x00
	.4byte 0x0000001c
	.4byte 0x000000ac
	.8byte ..___tag_value_fma.45
	.8byte ..___tag_value_fma.47-..___tag_value_fma.45
	.8byte 0x0000000000000000
	.4byte 0x00000024
	.4byte 0x000000cc
	.8byte ..___tag_value___sti__$E.48
	.8byte ..___tag_value___sti__$E.54-..___tag_value___sti__$E.48
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.50-..___tag_value___sti__$E.48
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.53-..___tag_value___sti__$E.50
	.2byte 0x080e
	.byte 0x00
# End

