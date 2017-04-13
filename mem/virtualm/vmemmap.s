# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-O3 -S";
	.file "vmemmap.c"
	.text
..TXTST0:
# -- Begin  main
# mark_begin;
       .align    16,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0
..___tag_value_main.1:                                          #11.11
        pushq     %rbp                                          #11.11
..___tag_value_main.3:                                          #
        movq      %rsp, %rbp                                    #11.11
..___tag_value_main.4:                                          #
        andq      $-128, %rsp                                   #11.11
        subq      $8192, %rsp                                   #11.11
        movl      $3, %edi                                      #11.11
..___tag_value_main.6:                                          #11.11
        call      __intel_new_proc_init                         #11.11
..___tag_value_main.7:                                          #
                                # LOE rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.1
        stmxcsr   4096(%rsp)                                    #11.11
        movl      $.L_2__STRING.1, %edi                         #13.3
        lea       (%rsp), %rsi                                  #13.3
        orl       $32832, 4096(%rsp)                            #11.11
        xorl      %eax, %eax                                    #13.3
        ldmxcsr   4096(%rsp)                                    #11.11
..___tag_value_main.8:                                          #13.3
        call      printf                                        #13.3
..___tag_value_main.9:                                          #
                                # LOE rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.6
        movl      $.L_2__STRING.0, %edi                         #14.3
        lea       4096(%rsp), %rsi                              #14.3
        xorl      %eax, %eax                                    #14.3
..___tag_value_main.10:                                         #14.3
        call      printf                                        #14.3
..___tag_value_main.11:                                         #
                                # LOE rbx r12 r13 r14 r15
..B1.3:                         # Preds ..B1.2
        xorl      %eax, %eax                                    #26.1
        movq      %rbp, %rsp                                    #26.1
        popq      %rbp                                          #26.1
..___tag_value_main.12:                                         #
        ret                                                     #26.1
        .align    16,0x90
..___tag_value_main.14:                                         #
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.data
# -- End  main
	.text
# -- Begin  f
# mark_begin;
       .align    16,0x90
	.globl f
f:
..B2.1:                         # Preds ..B2.0
..___tag_value_f.15:                                            #6.9
        subq      $4104, %rsp                                   #6.9
..___tag_value_f.17:                                            #
        movl      $.L_2__STRING.0, %edi                         #8.3
        xorl      %eax, %eax                                    #8.3
        lea       (%rsp), %rsi                                  #8.3
..___tag_value_f.18:                                            #8.3
        call      printf                                        #8.3
..___tag_value_f.19:                                            #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
        addq      $4104, %rsp                                   #9.1
..___tag_value_f.20:                                            #
        ret                                                     #9.1
        .align    16,0x90
..___tag_value_f.21:                                            #
                                # LOE
# mark_end;
	.type	f,@function
	.size	f,.-f
	.data
# -- End  f
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.1:
	.byte	32
	.byte	109
	.byte	97
	.byte	114
	.byte	114
	.byte	97
	.byte	121
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	112
	.byte	10
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,14
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.byte	32
	.byte	102
	.byte	97
	.byte	114
	.byte	114
	.byte	97
	.byte	121
	.byte	32
	.byte	61
	.byte	32
	.byte	37
	.byte	112
	.byte	10
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,14
	.data
	.comm global,4,4
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x00000034
	.4byte 0x0000001c
	.8byte ..___tag_value_main.1
	.8byte ..___tag_value_main.14-..___tag_value_main.1
	.byte 0x04
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.12-..___tag_value_main.4
	.8byte 0x00000000c608070c
	.2byte 0x0000
	.4byte 0x00000024
	.4byte 0x00000054
	.8byte ..___tag_value_f.15
	.8byte ..___tag_value_f.21-..___tag_value_f.15
	.byte 0x04
	.4byte ..___tag_value_f.17-..___tag_value_f.15
	.4byte 0x0420900e
	.4byte ..___tag_value_f.20-..___tag_value_f.17
	.2byte 0x080e
	.byte 0x00
# End

