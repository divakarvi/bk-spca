	.file "sumcopy.cpp"
	.text
..TXTST0:
# -- Begin  _Z3sumPdl
       .align    16,0x90
	.globl _Z3sumPdl
_Z3sumPdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B1.1:
..___tag_value__Z3sumPdl.1:
        pxor      %xmm0, %xmm0
        testq     %rsi, %rsi
        jle       ..B1.18
..B1.2:
        cmpq      $8, %rsi
        jl        ..B1.19
..B1.3:
        movq      %rdi, %rcx
        andq      $15, %rcx
        je        ..B1.6
..B1.4:
        testq     $7, %rcx
        jne       ..B1.19
..B1.5:
        movl      $1, %ecx
..B1.6:
        lea       8(%rcx), %rax
        cmpq      %rax, %rsi
        jl        ..B1.19
..B1.7:
        movq      %rsi, %rdx
        xorl      %eax, %eax
        subq      %rcx, %rdx
        andq      $7, %rdx
        negq      %rdx
        addq      %rsi, %rdx
        testq     %rcx, %rcx
        jbe       ..B1.11
..B1.9:
        addsd     (%rdi,%rax,8), %xmm0
        incq      %rax
        cmpq      %rcx, %rax
        jb        ..B1.9
..B1.11:
        pxor      %xmm1, %xmm1
        movaps    %xmm1, %xmm2
        movsd     %xmm0, %xmm2
..B1.12:
        addpd     (%rdi,%rcx,8), %xmm2
        addpd     16(%rdi,%rcx,8), %xmm1
        addpd     32(%rdi,%rcx,8), %xmm2
        addpd     48(%rdi,%rcx,8), %xmm1
        addq      $8, %rcx
        cmpq      %rdx, %rcx
        jb        ..B1.12
..B1.13:
        addpd     %xmm1, %xmm2
        movaps    %xmm2, %xmm0
        unpckhpd  %xmm2, %xmm0
        addsd     %xmm0, %xmm2
        movaps    %xmm2, %xmm0
..B1.14:
        cmpq      %rsi, %rdx
        jae       ..B1.18
..B1.16:
        addsd     (%rdi,%rdx,8), %xmm0
        incq      %rdx
        cmpq      %rsi, %rdx
        jb        ..B1.16
..B1.18:
        ret       
..B1.19:
        xorl      %edx, %edx
        jmp       ..B1.14
        .align    16,0x90
..___tag_value__Z3sumPdl.3:
	.type	_Z3sumPdl,@function
	.size	_Z3sumPdl,.-_Z3sumPdl
	.data
# -- End  _Z3sumPdl
	.text
# -- Begin  _Z9sumstridePdli
       .align    16,0x90
	.globl _Z9sumstridePdli
_Z9sumstridePdli:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %edx
..B2.1:
..___tag_value__Z9sumstridePdli.4:
        xorl      %eax, %eax
        movslq    %edx, %rdx
        pxor      %xmm0, %xmm0
        testq     %rsi, %rsi
        jle       ..B2.5
..B2.3:
        addsd     (%rdi,%rax,8), %xmm0
        addq      %rdx, %rax
        cmpq      %rsi, %rax
        jl        ..B2.3
..B2.5:
        ret       
        .align    16,0x90
..___tag_value__Z9sumstridePdli.6:
	.type	_Z9sumstridePdli,@function
	.size	_Z9sumstridePdli,.-_Z9sumstridePdli
	.data
# -- End  _Z9sumstridePdli
	.text
# -- Begin  _Z14sumconststridePdl
       .align    16,0x90
	.globl _Z14sumconststridePdl
_Z14sumconststridePdl:
# parameter 1: %rdi
# parameter 2: %rsi
..B3.1:
..___tag_value__Z14sumconststridePdl.7:
        pxor      %xmm0, %xmm0
        testq     %rsi, %rsi
        jle       ..B3.18
..B3.2:
        cmpq      $8, %rsi
        jl        ..B3.19
..B3.3:
        movq      %rdi, %rcx
        andq      $15, %rcx
        je        ..B3.6
..B3.4:
        testq     $7, %rcx
        jne       ..B3.19
..B3.5:
        movl      $1, %ecx
..B3.6:
        lea       8(%rcx), %rax
        cmpq      %rax, %rsi
        jl        ..B3.19
..B3.7:
        movq      %rsi, %rdx
        xorl      %eax, %eax
        subq      %rcx, %rdx
        andq      $7, %rdx
        negq      %rdx
        addq      %rsi, %rdx
        testq     %rcx, %rcx
        jbe       ..B3.11
..B3.9:
        addsd     (%rdi,%rax,8), %xmm0
        incq      %rax
        cmpq      %rcx, %rax
        jb        ..B3.9
..B3.11:
        pxor      %xmm1, %xmm1
        movaps    %xmm1, %xmm2
        movsd     %xmm0, %xmm2
..B3.12:
        addpd     (%rdi,%rcx,8), %xmm2
        addpd     16(%rdi,%rcx,8), %xmm1
        addpd     32(%rdi,%rcx,8), %xmm2
        addpd     48(%rdi,%rcx,8), %xmm1
        addq      $8, %rcx
        cmpq      %rdx, %rcx
        jb        ..B3.12
..B3.13:
        addpd     %xmm1, %xmm2
        movaps    %xmm2, %xmm0
        unpckhpd  %xmm2, %xmm0
        addsd     %xmm0, %xmm2
        movaps    %xmm2, %xmm0
..B3.14:
        cmpq      %rsi, %rdx
        jae       ..B3.18
..B3.16:
        addsd     (%rdi,%rdx,8), %xmm0
        incq      %rdx
        cmpq      %rsi, %rdx
        jb        ..B3.16
..B3.18:
        ret       
..B3.19:
        xorl      %edx, %edx
        jmp       ..B3.14
        .align    16,0x90
..___tag_value__Z14sumconststridePdl.9:
	.type	_Z14sumconststridePdl,@function
	.size	_Z14sumconststridePdl,.-_Z14sumconststridePdl
	.data
# -- End  _Z14sumconststridePdl
	.text
# -- Begin  _Z4copyPdS_l
       .align    16,0x90
	.globl _Z4copyPdS_l
_Z4copyPdS_l:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B4.1:
..___tag_value__Z4copyPdS_l.10:
        pushq     %rsi
..___tag_value__Z4copyPdS_l.12:
        movq      %rdx, %rcx
        movq      %rdi, %rax
        testq     %rcx, %rcx
        jle       ..B4.5
..B4.2:
        cmpq      $12, %rcx
        jle       ..B4.6
..B4.3:
        movq      %rsi, %r8
        lea       (,%rcx,8), %rdx
        subq      %rax, %r8
        movl      $1, %r9d
        xorl      %r11d, %r11d
        cmpq      %rdx, %r8
        cmovg     %r9d, %r11d
        xorl      %r10d, %r10d
        negq      %r8
        cmpq      %rdx, %r8
        cmovg     %r9d, %r10d
        orl       %r10d, %r11d
        je        ..B4.6
..B4.4:
        movq      %rsi, %rdi
        movq      %rax, %rsi
        call      _intel_fast_memcpy
..B4.5:
        popq      %rcx
..___tag_value__Z4copyPdS_l.13:
        ret       
..___tag_value__Z4copyPdS_l.14:
..B4.6:
        movq      %rcx, %r9
        xorl      %r10d, %r10d
        shrq      $63, %r9
        movl      $1, %r11d
        addq      %rcx, %r9
        xorl      %r8d, %r8d
        sarq      $1, %r9
        testq     %r9, %r9
        jbe       ..B4.10
..B4.8:
        movq      (%r8,%rax), %r11
        incq      %r10
        movq      %r11, (%r8,%rsi)
        movq      8(%r8,%rax), %r11
        movq      %r11, 8(%r8,%rsi)
        addq      $16, %r8
        cmpq      %r9, %r10
        jb        ..B4.8
..B4.9:
        lea       1(,%r10,2), %r11
..B4.10:
        cmpq      %rcx, %r11
        ja        ..B4.5
..B4.11:
        movq      -8(%rax,%r11,8), %rax
        movq      %rax, -8(%rsi,%r11,8)
        popq      %rcx
..___tag_value__Z4copyPdS_l.15:
        ret       
        .align    16,0x90
..___tag_value__Z4copyPdS_l.16:
	.type	_Z4copyPdS_l,@function
	.size	_Z4copyPdS_l,.-_Z4copyPdS_l
	.data
# -- End  _Z4copyPdS_l
	.text
# -- Begin  _Z15copyconststridePdS_l
       .align    16,0x90
	.globl _Z15copyconststridePdS_l
_Z15copyconststridePdS_l:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
..B5.1:
..___tag_value__Z15copyconststridePdS_l.17:
        pushq     %rsi
..___tag_value__Z15copyconststridePdS_l.19:
        movq      %rdx, %rcx
        movq      %rdi, %rax
        testq     %rcx, %rcx
        jle       ..B5.5
..B5.2:
        cmpq      $12, %rcx
        jle       ..B5.6
..B5.3:
        movq      %rsi, %r8
        lea       (,%rcx,8), %rdx
        subq      %rax, %r8
        movl      $1, %r9d
        xorl      %r11d, %r11d
        cmpq      %rdx, %r8
        cmovg     %r9d, %r11d
        xorl      %r10d, %r10d
        negq      %r8
        cmpq      %rdx, %r8
        cmovg     %r9d, %r10d
        orl       %r10d, %r11d
        je        ..B5.6
..B5.4:
        movq      %rsi, %rdi
        movq      %rax, %rsi
        call      _intel_fast_memcpy
..B5.5:
        popq      %rcx
..___tag_value__Z15copyconststridePdS_l.20:
        ret       
..___tag_value__Z15copyconststridePdS_l.21:
..B5.6:
        movq      %rcx, %r9
        xorl      %r10d, %r10d
        shrq      $63, %r9
        movl      $1, %r11d
        addq      %rcx, %r9
        xorl      %r8d, %r8d
        sarq      $1, %r9
        testq     %r9, %r9
        jbe       ..B5.10
..B5.8:
        movq      (%r8,%rax), %r11
        incq      %r10
        movq      %r11, (%r8,%rsi)
        movq      8(%r8,%rax), %r11
        movq      %r11, 8(%r8,%rsi)
        addq      $16, %r8
        cmpq      %r9, %r10
        jb        ..B5.8
..B5.9:
        lea       1(,%r10,2), %r11
..B5.10:
        cmpq      %rcx, %r11
        ja        ..B5.5
..B5.11:
        movq      -8(%rax,%r11,8), %rax
        movq      %rax, -8(%rsi,%r11,8)
        popq      %rcx
..___tag_value__Z15copyconststridePdS_l.22:
        ret       
        .align    16,0x90
..___tag_value__Z15copyconststridePdS_l.23:
	.type	_Z15copyconststridePdS_l,@function
	.size	_Z15copyconststridePdS_l,.-_Z15copyconststridePdS_l
	.data
# -- End  _Z15copyconststridePdS_l
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
	.8byte ..___tag_value__Z3sumPdl.1
	.8byte ..___tag_value__Z3sumPdl.3-..___tag_value__Z3sumPdl.1
	.8byte 0x0000000000000000
	.4byte 0x0000001c
	.4byte 0x00000044
	.8byte ..___tag_value__Z9sumstridePdli.4
	.8byte ..___tag_value__Z9sumstridePdli.6-..___tag_value__Z9sumstridePdli.4
	.8byte 0x0000000000000000
	.4byte 0x0000001c
	.4byte 0x00000064
	.8byte ..___tag_value__Z14sumconststridePdl.7
	.8byte ..___tag_value__Z14sumconststridePdl.9-..___tag_value__Z14sumconststridePdl.7
	.8byte 0x0000000000000000
	.4byte 0x00000034
	.4byte 0x00000084
	.8byte ..___tag_value__Z4copyPdS_l.10
	.8byte ..___tag_value__Z4copyPdS_l.16-..___tag_value__Z4copyPdS_l.10
	.2byte 0x0400
	.4byte ..___tag_value__Z4copyPdS_l.12-..___tag_value__Z4copyPdS_l.10
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z4copyPdS_l.13-..___tag_value__Z4copyPdS_l.12
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z4copyPdS_l.14-..___tag_value__Z4copyPdS_l.13
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z4copyPdS_l.15-..___tag_value__Z4copyPdS_l.14
	.4byte 0x0000080e
	.byte 0x00
	.4byte 0x00000034
	.4byte 0x000000bc
	.8byte ..___tag_value__Z15copyconststridePdS_l.17
	.8byte ..___tag_value__Z15copyconststridePdS_l.23-..___tag_value__Z15copyconststridePdS_l.17
	.2byte 0x0400
	.4byte ..___tag_value__Z15copyconststridePdS_l.19-..___tag_value__Z15copyconststridePdS_l.17
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z15copyconststridePdS_l.20-..___tag_value__Z15copyconststridePdS_l.19
	.2byte 0x080e
	.byte 0x04
	.4byte ..___tag_value__Z15copyconststridePdS_l.21-..___tag_value__Z15copyconststridePdS_l.20
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z15copyconststridePdS_l.22-..___tag_value__Z15copyconststridePdS_l.21
	.4byte 0x0000080e
	.byte 0x00
# End
