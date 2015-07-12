	.file "hanoi.c"
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
        pushq     %r15
..___tag_value_main.6:
        subq      $120, %rsp
        movl      $3, %edi
..___tag_value_main.7:
        call      __intel_new_proc_init
..___tag_value_main.8:
..B1.11:
        stmxcsr   (%rsp)
        movl      $.L_2__STRING.1, %edi
        xorl      %eax, %eax
        orl       $32832, (%rsp)
        ldmxcsr   (%rsp)
..___tag_value_main.9:
        call      printf
..___tag_value_main.10:
..B1.2:
        movl      $.L_2__STRING.2, %edi
        lea       (%rsp), %rsi
        xorl      %eax, %eax
        call      __isoc99_scanf
..B1.3:
        movl      (%rsp), %r15d
        cmpl      $1, %r15d
        je        ..B1.8
..B1.4:
        decl      %r15d
        xorl      %edi, %edi
        movl      $2, %esi
        movl      %r15d, %edx
..___tag_value_main.11:
        call      hanoi
..___tag_value_main.12:
..B1.5:
        movl      $.L_2__STRING.0, %edi
        xorl      %esi, %esi
        movl      $1, %edx
        xorl      %eax, %eax
..___tag_value_main.13:
        call      printf
..___tag_value_main.14:
..B1.6:
        movl      $2, %edi
        movl      $1, %esi
        movl      %r15d, %edx
..___tag_value_main.15:
        call      hanoi
..___tag_value_main.16:
..B1.7:
        xorl      %eax, %eax
        addq      $120, %rsp
..___tag_value_main.17:
        popq      %r15
        movq      %rbp, %rsp
        popq      %rbp
..___tag_value_main.18:
        ret       
..___tag_value_main.20:
..B1.8:
        movl      $.L_2__STRING.0, %edi
        xorl      %esi, %esi
        movl      $1, %edx
        xorl      %eax, %eax
..___tag_value_main.23:
        call      printf
..___tag_value_main.24:
        jmp       ..B1.7
        .align    16,0x90
..___tag_value_main.25:
	.type	main,@function
	.size	main,.-main
	.data
# -- End  main
	.text
# -- Begin  hanoi
       .align    16,0x90
	.globl hanoi
hanoi:
# parameter 1: %edi
# parameter 2: %esi
# parameter 3: %edx
..B2.1:
..___tag_value_hanoi.26:
        subq      $40, %rsp
..___tag_value_hanoi.28:
        movl      %edx, %r8d
        movl      %esi, %edx
        movl      %edi, %esi
        movl      %esi, %ecx
        negl      %ecx
        addl      $3, %ecx
        subl      %edx, %ecx
        cmpl      $1, %r8d
        je        ..B2.7
..B2.2:
        movl      %edx, %eax
        negl      %eax
        addl      $3, %eax
        movq      %r12, 32(%rsp)
..___tag_value_hanoi.29:
        movl      %edx, %r12d
        movq      %r13, 24(%rsp)
..___tag_value_hanoi.30:
        movl      %eax, %r13d
        movq      %r14, 16(%rsp)
..___tag_value_hanoi.31:
        movl      %ecx, %r14d
        movq      %r15, 8(%rsp)
..___tag_value_hanoi.32:
        movl      %r8d, %r15d
        movq      %rbx, (%rsp)
..___tag_value_hanoi.33:
        movl      %esi, %ebx
..B2.3:
        decl      %r15d
        movl      %ebx, %edi
        movl      %r14d, %esi
        movl      %r15d, %edx
..___tag_value_hanoi.34:
        call      hanoi
..___tag_value_hanoi.35:
..B2.4:
        movl      $.L_2__STRING.0, %edi
        movl      %ebx, %esi
        movl      %r12d, %edx
        xorl      %eax, %eax
..___tag_value_hanoi.36:
        call      printf
..___tag_value_hanoi.37:
..B2.5:
        movl      %r14d, %ebx
        negl      %r14d
        addl      %r13d, %r14d
        cmpl      $1, %r15d
        jne       ..B2.3
..B2.6:
        movq      24(%rsp), %r13
..___tag_value_hanoi.38:
        movl      %ebx, %esi
        movq      16(%rsp), %r14
..___tag_value_hanoi.39:
        movl      %r12d, %edx
        movq      32(%rsp), %r12
..___tag_value_hanoi.40:
        movq      8(%rsp), %r15
..___tag_value_hanoi.41:
        movq      (%rsp), %rbx
..___tag_value_hanoi.42:
..B2.7:
        movl      $.L_2__STRING.0, %edi
        xorl      %eax, %eax
..___tag_value_hanoi.43:
        call      printf
..___tag_value_hanoi.44:
..B2.8:
        addq      $40, %rsp
..___tag_value_hanoi.45:
        ret       
        .align    16,0x90
..___tag_value_hanoi.46:
	.type	hanoi,@function
	.size	hanoi,.-hanoi
	.data
# -- End  hanoi
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.1:
	.byte	110
	.byte	32
	.byte	61
	.byte	32
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,5
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.byte	37
	.byte	100
	.byte	0
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,3
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.byte	109
	.byte	111
	.byte	118
	.byte	101
	.byte	32
	.byte	102
	.byte	114
	.byte	111
	.byte	109
	.byte	32
	.byte	37
	.byte	100
	.byte	32
	.byte	116
	.byte	111
	.byte	32
	.byte	37
	.byte	100
	.byte	32
	.byte	10
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,21
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
	.4byte 0x0000006c
	.4byte 0x0000001c
	.8byte ..___tag_value_main.1
	.8byte ..___tag_value_main.25-..___tag_value_main.1
	.byte 0x04
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.6-..___tag_value_main.4
	.8byte 0xff800d1c380e0f10
	.8byte 0xfffffff80d1affff
	.2byte 0x0422
	.4byte ..___tag_value_main.17-..___tag_value_main.6
	.2byte 0x04cf
	.4byte ..___tag_value_main.18-..___tag_value_main.17
	.4byte 0xc608070c
	.byte 0x04
	.4byte ..___tag_value_main.20-..___tag_value_main.18
	.8byte 0x0e0f10028610060c
	.8byte 0x1affffff800d1c38
	.8byte 0x000022fffffff80d
	.4byte 0x00000000
	.byte 0x00
	.4byte 0x00000064
	.4byte 0x0000008c
	.8byte ..___tag_value_hanoi.26
	.8byte ..___tag_value_hanoi.46-..___tag_value_hanoi.26
	.byte 0x04
	.4byte ..___tag_value_hanoi.28-..___tag_value_hanoi.26
	.2byte 0x300e
	.byte 0x04
	.4byte ..___tag_value_hanoi.29-..___tag_value_hanoi.28
	.2byte 0x028c
	.byte 0x04
	.4byte ..___tag_value_hanoi.30-..___tag_value_hanoi.29
	.2byte 0x038d
	.byte 0x04
	.4byte ..___tag_value_hanoi.31-..___tag_value_hanoi.30
	.2byte 0x048e
	.byte 0x04
	.4byte ..___tag_value_hanoi.32-..___tag_value_hanoi.31
	.2byte 0x058f
	.byte 0x04
	.4byte ..___tag_value_hanoi.33-..___tag_value_hanoi.32
	.2byte 0x0683
	.byte 0x04
	.4byte ..___tag_value_hanoi.38-..___tag_value_hanoi.33
	.2byte 0x04cd
	.4byte ..___tag_value_hanoi.39-..___tag_value_hanoi.38
	.2byte 0x04ce
	.4byte ..___tag_value_hanoi.40-..___tag_value_hanoi.39
	.2byte 0x04cc
	.4byte ..___tag_value_hanoi.41-..___tag_value_hanoi.40
	.2byte 0x04cf
	.4byte ..___tag_value_hanoi.42-..___tag_value_hanoi.41
	.2byte 0x04c3
	.4byte ..___tag_value_hanoi.45-..___tag_value_hanoi.42
	.2byte 0x080e
	.byte 0x00
# End
