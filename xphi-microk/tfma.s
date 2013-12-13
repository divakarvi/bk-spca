	.file "tfma.cpp"
	.text
..TXTST0:
# -- Begin  _Z3fmaPdS_S_
       .align    16,0x90
	.globl _Z3fmaPdS_S_
_Z3fmaPdS_S_:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B1.1:
..___tag_value__Z3fmaPdS_S_.1:
        vmovapd   (%rdi), %zmm1
        vmovapd   (%rsi), %zmm0
        vfmadd213pd (%rdx), %zmm0, %zmm1
        nop       
        vmovapd   %zmm1, (%rdx)
        ret       
        .align    16,0x90
..___tag_value__Z3fmaPdS_S_.3:
	.type	_Z3fmaPdS_S_,@function
	.size	_Z3fmaPdS_S_,.-_Z3fmaPdS_S_
	.data
# -- End  _Z3fmaPdS_S_
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
	.8byte ..___tag_value__Z3fmaPdS_S_.1
	.8byte ..___tag_value__Z3fmaPdS_S_.3-..___tag_value__Z3fmaPdS_S_.1
	.8byte 0x0000000000000000
# End
