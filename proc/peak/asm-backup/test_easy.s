# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-O3 -prec-div -no-ftz -restrict -Wshadow -fno-inline-functions -S";
	.file "test_easy.cpp"
	.text
..TXTST0:
# -- Begin  main
# mark_begin;
       .align    16,0x90
	.globl main
main:
..B1.1:                         # Preds ..B1.0
..___tag_value_main.1:                                          #19.11
        pushq     %rbp                                          #19.11
..___tag_value_main.3:                                          #
        movq      %rsp, %rbp                                    #19.11
..___tag_value_main.4:                                          #
        andq      $-128, %rsp                                   #19.11
        xorl      %edi, %edi                                    #19.11
..___tag_value_main.6:                                          #19.11
        call      __intel_new_proc_init                         #19.11
..___tag_value_main.7:                                          #
                                # LOE rbx r12 r13 r14 r15
..B1.5:                         # Preds ..B1.1
..___tag_value_main.8:                                          #20.2
        call      _Z7xmmtestv                                   #20.2
..___tag_value_main.9:                                          #
                                # LOE rbx r12 r13 r14 r15
..B1.2:                         # Preds ..B1.5
        xorl      %eax, %eax                                    #21.1
        movq      %rbp, %rsp                                    #21.1
        popq      %rbp                                          #21.1
..___tag_value_main.10:                                         #
        ret                                                     #21.1
        .align    16,0x90
..___tag_value_main.12:                                         #
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.data
# -- End  main
	.text
# -- Begin  _Z7xmmtestv
# mark_begin;
       .align    16,0x90
	.globl _Z7xmmtestv
_Z7xmmtestv:
..B2.1:                         # Preds ..B2.0
..___tag_value__Z7xmmtestv.13:                                  #9.15
        subq      $40, %rsp                                     #9.15
..___tag_value__Z7xmmtestv.15:                                  #
        movq      $0x3ff0000000000000, %rdx                     #10.35
        movq      $0x4000000000000000, %rcx                     #10.35
        movq      $0xbff0000000000000, %rsi                     #11.35
        movq      $0xc000000000000000, %r8                      #11.35
        movl      $.L_2__STRING.0, %edi                         #16.2
        movq      %rdx, (%rsp)                                  #10.35
        movl      $2, %eax                                      #16.2
        movq      %rcx, 8(%rsp)                                 #10.35
        movq      %rsi, 16(%rsp)                                #11.35
        movq      %r8, 24(%rsp)                                 #11.35
        movaps    (%rsp), %xmm0                                 #12.0
        movaps    16(%rsp), %xmm1                               #13.0
        addpd     %xmm1, %xmm0                                  #14.0
        movaps    %xmm0, (%rsp)                                 #15.0
        movsd     (%rsp), %xmm0                                 #16.2
        movsd     8(%rsp), %xmm1                                #16.2
..___tag_value__Z7xmmtestv.16:                                  #16.2
        call      printf                                        #16.2
..___tag_value__Z7xmmtestv.17:                                  #
                                # LOE rbx rbp r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
        addq      $40, %rsp                                     #17.1
..___tag_value__Z7xmmtestv.18:                                  #
        ret                                                     #17.1
        .align    16,0x90
..___tag_value__Z7xmmtestv.19:                                  #
                                # LOE
# mark_end;
	.type	_Z7xmmtestv,@function
	.size	_Z7xmmtestv,.-_Z7xmmtestv
	.data
# -- End  _Z7xmmtestv
	.section .rodata, "a"
	.align 8
	.align 8
.L_2il0floatpacket.0:
	.long	0x00000000,0x40000000
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,8
	.align 8
.L_2il0floatpacket.1:
	.long	0x00000000,0xbff00000
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.align 8
.L_2il0floatpacket.2:
	.long	0x00000000,0xc0000000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.3:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
.L_2__STRING.0:
	.byte	37
	.byte	102
	.byte	32
	.byte	37
	.byte	102
	.byte	32
	.byte	10
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,8
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
	.4byte 0x00000034
	.4byte 0x00000024
	.8byte ..___tag_value_main.1
	.8byte ..___tag_value_main.12-..___tag_value_main.1
	.2byte 0x0400
	.4byte ..___tag_value_main.3-..___tag_value_main.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.4-..___tag_value_main.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.10-..___tag_value_main.4
	.8byte 0x00000000c608070c
	.byte 0x00
	.4byte 0x00000024
	.4byte 0x0000005c
	.8byte ..___tag_value__Z7xmmtestv.13
	.8byte ..___tag_value__Z7xmmtestv.19-..___tag_value__Z7xmmtestv.13
	.2byte 0x0400
	.4byte ..___tag_value__Z7xmmtestv.15-..___tag_value__Z7xmmtestv.13
	.2byte 0x300e
	.byte 0x04
	.4byte ..___tag_value__Z7xmmtestv.18-..___tag_value__Z7xmmtestv.15
	.2byte 0x080e
	.byte 0x00
# End

