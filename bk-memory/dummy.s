# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-I/usr/caen/intel-12.1/mkl/include -O3 -prec-div -no-ftz -fno-inline-functions -DNDEBUG -restrict -S";
	.file "dummy.cpp"
	.text
..TXTST0:
# -- Begin  _Z5dummyPdi
# mark_begin;
       .align    16,0x90
	.globl _Z5dummyPdi
_Z5dummyPdi:
# parameter 1: %rdi
# parameter 2: %esi
..B1.1:                         # Preds ..B1.0
..___tag_value__Z5dummyPdi.1:                                   #1.31
        xorl      %r8d, %r8d                                    #2.12
        xorl      %ecx, %ecx                                    #
        testl     %esi, %esi                                    #2.20
        jle       ..B1.5        # Prob 10%                      #2.20
        .align    16,0x90
                                # LOE rcx rbx rbp rdi r12 r13 r14 r15 esi r8d
..B1.3:                         # Preds ..B1.1 ..B1.3
        movl      $892460737, %eax                              #3.15
        movl      %r8d, %r9d                                    #3.15
        imull     %r8d                                          #3.15
        sarl      $31, %r9d                                     #3.15
        pxor      %xmm0, %xmm0                                  #3.22
        sarl      $4, %edx                                      #3.15
        subl      %r9d, %edx                                    #3.15
        imull     $77, %edx, %r10d                              #3.15
        negl      %r10d                                         #3.15
        addl      %r8d, %r10d                                   #3.15
        imull     $1001, %r10d, %r11d                           #3.22
        imull     %r8d, %r11d                                   #3.22
        incl      %r8d                                          #2.25
        cvtsi2sd  %r11d, %xmm0                                  #3.22
        movsd     %xmm0, (%rdi,%rcx,8)                          #3.5
        incq      %rcx                                          #2.25
        cmpl      %esi, %r8d                                    #2.20
        jl        ..B1.3        # Prob 82%                      #2.20
                                # LOE rcx rbx rbp rdi r12 r13 r14 r15 esi r8d
..B1.5:                         # Preds ..B1.3 ..B1.1
        ret                                                     #4.1
        .align    16,0x90
..___tag_value__Z5dummyPdi.3:                                   #
                                # LOE
# mark_end;
	.type	_Z5dummyPdi,@function
	.size	_Z5dummyPdi,.-_Z5dummyPdi
	.data
# -- End  _Z5dummyPdi
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
	.4byte 0x0000001c
	.4byte 0x00000024
	.8byte ..___tag_value__Z5dummyPdi.1
	.8byte ..___tag_value__Z5dummyPdi.3-..___tag_value__Z5dummyPdi.1
	.8byte 0x0000000000000000
# End
