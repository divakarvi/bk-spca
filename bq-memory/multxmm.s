# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-I/usr/caen/intel-12.1/mkl/include -O3 -prec-div -no-ftz -fno-inline-functions -DNDEBUG -restrict -S";
	.file "multxmm.cpp"
	.text
..TXTST0:
# -- Begin  _Z12multxmm4x1x4PdS_S_
# mark_begin;
       .align    16,0x90
	.globl _Z12multxmm4x1x4PdS_S_
_Z12multxmm4x1x4PdS_S_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B1.1:                         # Preds ..B1.0
..___tag_value__Z12multxmm4x1x4PdS_S_.1:                        #36.51
        movaps    (%rdx), %xmm4                                 #38.0
        movaps    32(%rdx), %xmm5                               #39.0
        movaps    64(%rdx), %xmm6                               #40.0
        movaps    96(%rdx), %xmm7                               #41.0
        movaps    16(%rdx), %xmm8                               #42.0
        movaps    48(%rdx), %xmm9                               #43.0
        movaps    80(%rdx), %xmm10                              #44.0
        movaps    112(%rdx), %xmm11                             #45.0
        movaps    (%rdi), %xmm2                                 #47.0
        movaps    (%rsi), %xmm0                                 #48.0
        mulpd     %xmm0, %xmm2                                  #49.0
        movaps    16(%rdi), %xmm3                               #50.0
        movaps    %xmm3, %xmm12                                 #51.0
        mulpd     %xmm0, %xmm3                                  #52.0
        addpd     %xmm2, %xmm4                                  #53.0
        addpd     %xmm3, %xmm8                                  #54.0
        movaps    16(%rsi), %xmm1                               #55.0
        mulpd     %xmm1, %xmm12                                 #56.0
        movaps    (%rdi), %xmm2                                 #57.0
        mulpd     %xmm1, %xmm2                                  #58.0
        addpd     %xmm2, %xmm6                                  #59.0
        addpd     %xmm12, %xmm10                                #60.0
        movaps    (%rdi), %xmm3                                 #62.0
        shufpd    $1, %xmm3, %xmm3                              #63.0
        movaps    %xmm3, %xmm2                                  #64.0
        mulpd     %xmm1, %xmm3                                  #65.0
        mulpd     %xmm0, %xmm2                                  #66.0
        addpd     %xmm3, %xmm7                                  #67.0
        addpd     %xmm2, %xmm5                                  #68.0
        movaps    16(%rdi), %xmm2                               #70.0
        shufpd    $1, %xmm2, %xmm2                              #71.0
        movaps    %xmm2, %xmm3                                  #72.0
        mulpd     %xmm0, %xmm2                                  #73.0
        mulpd     %xmm1, %xmm3                                  #74.0
        addpd     %xmm2, %xmm9                                  #75.0
        addpd     %xmm3, %xmm11                                 #76.0
        movaps    %xmm4, (%rdx)                                 #78.0
        movaps    %xmm5, 32(%rdx)                               #79.0
        movaps    %xmm6, 64(%rdx)                               #80.0
        movaps    %xmm7, 96(%rdx)                               #81.0
        movaps    %xmm8, 16(%rdx)                               #82.0
        movaps    %xmm9, 48(%rdx)                               #83.0
        movaps    %xmm10, 80(%rdx)                              #84.0
        movaps    %xmm11, 112(%rdx)                             #85.0
        ret                                                     #86.1
        .align    16,0x90
..___tag_value__Z12multxmm4x1x4PdS_S_.3:                        #
                                # LOE
# mark_end;
	.type	_Z12multxmm4x1x4PdS_S_,@function
	.size	_Z12multxmm4x1x4PdS_S_,.-_Z12multxmm4x1x4PdS_S_
	.data
# -- End  _Z12multxmm4x1x4PdS_S_
	.text
# -- Begin  _Z13multxmm4x1x4RPdS_S_
# mark_begin;
       .align    16,0x90
	.globl _Z13multxmm4x1x4RPdS_S_
_Z13multxmm4x1x4RPdS_S_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B2.1:                         # Preds ..B2.0
..___tag_value__Z13multxmm4x1x4RPdS_S_.4:                       #90.52
        xorl      %eax, %eax                                    #100.17
        movaps    (%rdx), %xmm4                                 #92.0
        movaps    32(%rdx), %xmm5                               #93.0
        movaps    64(%rdx), %xmm6                               #94.0
        movaps    96(%rdx), %xmm7                               #95.0
        movaps    16(%rdx), %xmm8                               #96.0
        movaps    48(%rdx), %xmm9                               #97.0
        movaps    80(%rdx), %xmm10                              #98.0
        movaps    112(%rdx), %xmm11                             #99.0
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15
..B2.2:                         # Preds ..B2.2 ..B2.1
        movaps    (%rdi), %xmm2                                 #101.0
        incq      %rax                                          #100.41
        movaps    (%rsi), %xmm0                                 #102.0
        mulpd     %xmm0, %xmm2                                  #103.0
        movaps    16(%rdi), %xmm3                               #104.0
        movaps    %xmm3, %xmm12                                 #105.0
        mulpd     %xmm0, %xmm3                                  #106.0
        addpd     %xmm2, %xmm4                                  #107.0
        addpd     %xmm3, %xmm8                                  #108.0
        movaps    16(%rsi), %xmm1                               #109.0
        mulpd     %xmm1, %xmm12                                 #110.0
        movaps    (%rdi), %xmm2                                 #111.0
        mulpd     %xmm1, %xmm2                                  #113.0
        addpd     %xmm2, %xmm6                                  #114.0
        addpd     %xmm12, %xmm10                                #115.0
        movaps    (%rdi), %xmm3                                 #116.0
        shufpd    $1, %xmm3, %xmm3                              #117.0
        movaps    %xmm3, %xmm2                                  #118.0
        mulpd     %xmm1, %xmm3                                  #119.0
        mulpd     %xmm0, %xmm2                                  #120.0
        addpd     %xmm3, %xmm7                                  #121.0
        addpd     %xmm2, %xmm5                                  #122.0
        movaps    16(%rdi), %xmm2                               #123.0
        shufpd    $1, %xmm2, %xmm2                              #124.0
        movaps    %xmm2, %xmm3                                  #125.0
        mulpd     %xmm0, %xmm2                                  #126.0
        mulpd     %xmm1, %xmm3                                  #127.0
        addpd     %xmm2, %xmm9                                  #128.0
        addpd     %xmm3, %xmm11                                 #129.0
        cmpq      $1000000000, %rax                             #100.25
        jl        ..B2.2        # Prob 100%                     #100.25
                                # LOE rax rdx rbx rbp rsi rdi r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
        movaps    %xmm4, (%rdx)                                 #132.0
        movaps    %xmm5, 32(%rdx)                               #133.0
        movaps    %xmm6, 64(%rdx)                               #134.0
        movaps    %xmm7, 96(%rdx)                               #135.0
        movaps    %xmm8, 16(%rdx)                               #136.0
        movaps    %xmm9, 48(%rdx)                               #137.0
        movaps    %xmm10, 80(%rdx)                              #138.0
        movaps    %xmm11, 112(%rdx)                             #139.0
        ret                                                     #140.1
        .align    16,0x90
..___tag_value__Z13multxmm4x1x4RPdS_S_.6:                       #
                                # LOE
# mark_end;
	.type	_Z13multxmm4x1x4RPdS_S_,@function
	.size	_Z13multxmm4x1x4RPdS_S_,.-_Z13multxmm4x1x4RPdS_S_
	.data
# -- End  _Z13multxmm4x1x4RPdS_S_
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
	.8byte ..___tag_value__Z12multxmm4x1x4PdS_S_.1
	.8byte ..___tag_value__Z12multxmm4x1x4PdS_S_.3-..___tag_value__Z12multxmm4x1x4PdS_S_.1
	.8byte 0x0000000000000000
	.4byte 0x0000001c
	.4byte 0x00000044
	.8byte ..___tag_value__Z13multxmm4x1x4RPdS_S_.4
	.8byte ..___tag_value__Z13multxmm4x1x4RPdS_S_.6-..___tag_value__Z13multxmm4x1x4RPdS_S_.4
	.8byte 0x0000000000000000
# End
