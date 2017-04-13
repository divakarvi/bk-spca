# -- Machine type EFI2
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
        jle       ..B1.17
..B1.2:
        movq      %rdi, %rcx
        andq      $15, %rcx
        je        ..B1.5
..B1.3:
        testq     $7, %rcx
        jne       ..B1.18
..B1.4:
        movl      $1, %ecx
..B1.5:
        lea       8(%rcx), %rax
        cmpq      %rax, %rsi
        jl        ..B1.18
..B1.6:
        movq      %rsi, %rdx
        subq      %rcx, %rdx
        andq      $7, %rdx
        negq      %rdx
        addq      %rsi, %rdx
        xorl      %eax, %eax
        testq     %rcx, %rcx
        jbe       ..B1.10
..B1.8:
        addsd     (%rdi,%rax,8), %xmm0
        incq      %rax
        cmpq      %rcx, %rax
        jb        ..B1.8
..B1.10:
        pxor      %xmm1, %xmm1
..B1.11:
        addpd     (%rdi,%rcx,8), %xmm0
        addpd     16(%rdi,%rcx,8), %xmm1
        addpd     32(%rdi,%rcx,8), %xmm0
        addpd     48(%rdi,%rcx,8), %xmm1
        addq      $8, %rcx
        cmpq      %rdx, %rcx
        jb        ..B1.11
..B1.12:
        addpd     %xmm1, %xmm0
        movaps    %xmm0, %xmm1
        unpckhpd  %xmm0, %xmm1
        addsd     %xmm1, %xmm0
..B1.13:
        cmpq      %rsi, %rdx
        jae       ..B1.17
..B1.15:
        addsd     (%rdi,%rdx,8), %xmm0
        incq      %rdx
        cmpq      %rsi, %rdx
        jb        ..B1.15
..B1.17:
        ret       
..B1.18:
        xorl      %edx, %edx
        jmp       ..B1.13
        .align    16,0x90
..___tag_value__Z3sumPdl.2:
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
..___tag_value__Z9sumstridePdli.3:
        movslq    %edx, %rdx
        xorl      %eax, %eax
        testq     %rsi, %rsi
        pxor      %xmm0, %xmm0
        jle       ..B2.5
..B2.3:
        addsd     (%rdi,%rax,8), %xmm0
        addq      %rdx, %rax
        cmpq      %rsi, %rax
        jl        ..B2.3
..B2.5:
        ret       
        .align    16,0x90
..___tag_value__Z9sumstridePdli.4:
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
..___tag_value__Z14sumconststridePdl.5:
        pxor      %xmm0, %xmm0
        testq     %rsi, %rsi
        jle       ..B3.17
..B3.2:
        movq      %rdi, %rcx
        andq      $15, %rcx
        je        ..B3.5
..B3.3:
        testq     $7, %rcx
        jne       ..B3.18
..B3.4:
        movl      $1, %ecx
..B3.5:
        lea       8(%rcx), %rax
        cmpq      %rax, %rsi
        jl        ..B3.18
..B3.6:
        movq      %rsi, %rdx
        subq      %rcx, %rdx
        andq      $7, %rdx
        negq      %rdx
        addq      %rsi, %rdx
        xorl      %eax, %eax
        testq     %rcx, %rcx
        jbe       ..B3.10
..B3.8:
        addsd     (%rdi,%rax,8), %xmm0
        incq      %rax
        cmpq      %rcx, %rax
        jb        ..B3.8
..B3.10:
        pxor      %xmm1, %xmm1
..B3.11:
        addpd     (%rdi,%rcx,8), %xmm0
        addpd     16(%rdi,%rcx,8), %xmm1
        addpd     32(%rdi,%rcx,8), %xmm0
        addpd     48(%rdi,%rcx,8), %xmm1
        addq      $8, %rcx
        cmpq      %rdx, %rcx
        jb        ..B3.11
..B3.12:
        addpd     %xmm1, %xmm0
        movaps    %xmm0, %xmm1
        unpckhpd  %xmm0, %xmm1
        addsd     %xmm1, %xmm0
..B3.13:
        cmpq      %rsi, %rdx
        jae       ..B3.17
..B3.15:
        addsd     (%rdi,%rdx,8), %xmm0
        incq      %rdx
        cmpq      %rsi, %rdx
        jb        ..B3.15
..B3.17:
        ret       
..B3.18:
        xorl      %edx, %edx
        jmp       ..B3.13
        .align    16,0x90
..___tag_value__Z14sumconststridePdl.6:
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
..___tag_value__Z4copyPdS_l.7:
        pushq     %rsi
..___tag_value__Z4copyPdS_l.8:
        movq      %rdx, %r8
        movq      %rsi, %rcx
        movq      %rdi, %rsi
        testq     %r8, %r8
        jle       ..B4.4
..B4.2:
        movq      %rsi, %r10
        subq      %rcx, %r10
        lea       (,%r8,8), %rdx
        movq      %r10, %r9
        negq      %r9
        movl      $1, %eax
        xorl      %r11d, %r11d
        cmpq      %rdx, %r9
        movl      %r11d, %r9d
        cmovg     %eax, %r9d
        cmpq      %rdx, %r10
        cmovg     %eax, %r11d
        orl       %r11d, %r9d
        je        ..B4.5
..B4.3:
        movq      %rcx, %rdi
        call      _intel_fast_memcpy
..B4.4:
        popq      %rcx
..___tag_value__Z4copyPdS_l.9:
        ret       
..___tag_value__Z4copyPdS_l.10:
..B4.5:
        movq      %rcx, %r10
        andq      $15, %r10
        je        ..B4.8
..B4.6:
        testq     $7, %r10
        jne       ..B4.24
..B4.7:
        movl      $1, %r10d
..B4.8:
        lea       8(%r10), %rax
        cmpq      %rax, %r8
        jl        ..B4.24
..B4.9:
        movq      %r8, %r9
        subq      %r10, %r9
        andq      $7, %r9
        negq      %r9
        addq      %r8, %r9
        xorl      %eax, %eax
        testq     %r10, %r10
        jbe       ..B4.13
..B4.11:
        movq      (%rsi,%rax,8), %r11
        movq      %r11, (%rcx,%rax,8)
        incq      %rax
        cmpq      %r10, %rax
        jb        ..B4.11
..B4.13:
        lea       (%rsi,%r10,8), %rax
        testq     $15, %rax
        je        ..B4.18
..B4.15:
        movsd     (%rsi,%r10,8), %xmm0
        movhpd    8(%rsi,%r10,8), %xmm0
        movsd     16(%rsi,%r10,8), %xmm1
        movhpd    24(%rsi,%r10,8), %xmm1
        movsd     32(%rsi,%r10,8), %xmm2
        movhpd    40(%rsi,%r10,8), %xmm2
        movsd     48(%rsi,%r10,8), %xmm3
        movhpd    56(%rsi,%r10,8), %xmm3
        movaps    %xmm0, (%rcx,%r10,8)
        movaps    %xmm1, 16(%rcx,%r10,8)
        movaps    %xmm2, 32(%rcx,%r10,8)
        movaps    %xmm3, 48(%rcx,%r10,8)
        addq      $8, %r10
        cmpq      %r9, %r10
        jb        ..B4.15
        jmp       ..B4.20
..B4.18:
        movaps    (%rsi,%r10,8), %xmm0
        movaps    16(%rsi,%r10,8), %xmm1
        movaps    32(%rsi,%r10,8), %xmm2
        movaps    48(%rsi,%r10,8), %xmm3
        movaps    %xmm0, (%rcx,%r10,8)
        movaps    %xmm1, 16(%rcx,%r10,8)
        movaps    %xmm2, 32(%rcx,%r10,8)
        movaps    %xmm3, 48(%rcx,%r10,8)
        addq      $8, %r10
        cmpq      %r9, %r10
        jb        ..B4.18
..B4.20:
        cmpq      %r8, %r9
        jae       ..B4.4
..B4.22:
        movq      (%rsi,%r9,8), %rax
        movq      %rax, (%rcx,%r9,8)
        incq      %r9
        cmpq      %r8, %r9
        jb        ..B4.22
        jmp       ..B4.4
..B4.24:
        xorl      %r9d, %r9d
        jmp       ..B4.20
        .align    16,0x90
..___tag_value__Z4copyPdS_l.11:
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
..___tag_value__Z15copyconststridePdS_l.12:
        pushq     %rsi
..___tag_value__Z15copyconststridePdS_l.13:
        movq      %rdx, %r8
        movq      %rsi, %rcx
        movq      %rdi, %rsi
        testq     %r8, %r8
        jle       ..B5.4
..B5.2:
        movq      %rsi, %r10
        subq      %rcx, %r10
        lea       (,%r8,8), %rdx
        movq      %r10, %r9
        negq      %r9
        movl      $1, %eax
        xorl      %r11d, %r11d
        cmpq      %rdx, %r9
        movl      %r11d, %r9d
        cmovg     %eax, %r9d
        cmpq      %rdx, %r10
        cmovg     %eax, %r11d
        orl       %r11d, %r9d
        je        ..B5.5
..B5.3:
        movq      %rcx, %rdi
        call      _intel_fast_memcpy
..B5.4:
        popq      %rcx
..___tag_value__Z15copyconststridePdS_l.14:
        ret       
..___tag_value__Z15copyconststridePdS_l.15:
..B5.5:
        movq      %rcx, %r10
        andq      $15, %r10
        je        ..B5.8
..B5.6:
        testq     $7, %r10
        jne       ..B5.24
..B5.7:
        movl      $1, %r10d
..B5.8:
        lea       8(%r10), %rax
        cmpq      %rax, %r8
        jl        ..B5.24
..B5.9:
        movq      %r8, %r9
        subq      %r10, %r9
        andq      $7, %r9
        negq      %r9
        addq      %r8, %r9
        xorl      %eax, %eax
        testq     %r10, %r10
        jbe       ..B5.13
..B5.11:
        movq      (%rsi,%rax,8), %r11
        movq      %r11, (%rcx,%rax,8)
        incq      %rax
        cmpq      %r10, %rax
        jb        ..B5.11
..B5.13:
        lea       (%rsi,%r10,8), %rax
        testq     $15, %rax
        je        ..B5.18
..B5.15:
        movsd     (%rsi,%r10,8), %xmm0
        movhpd    8(%rsi,%r10,8), %xmm0
        movsd     16(%rsi,%r10,8), %xmm1
        movhpd    24(%rsi,%r10,8), %xmm1
        movsd     32(%rsi,%r10,8), %xmm2
        movhpd    40(%rsi,%r10,8), %xmm2
        movsd     48(%rsi,%r10,8), %xmm3
        movhpd    56(%rsi,%r10,8), %xmm3
        movaps    %xmm0, (%rcx,%r10,8)
        movaps    %xmm1, 16(%rcx,%r10,8)
        movaps    %xmm2, 32(%rcx,%r10,8)
        movaps    %xmm3, 48(%rcx,%r10,8)
        addq      $8, %r10
        cmpq      %r9, %r10
        jb        ..B5.15
        jmp       ..B5.20
..B5.18:
        movaps    (%rsi,%r10,8), %xmm0
        movaps    16(%rsi,%r10,8), %xmm1
        movaps    32(%rsi,%r10,8), %xmm2
        movaps    48(%rsi,%r10,8), %xmm3
        movaps    %xmm0, (%rcx,%r10,8)
        movaps    %xmm1, 16(%rcx,%r10,8)
        movaps    %xmm2, 32(%rcx,%r10,8)
        movaps    %xmm3, 48(%rcx,%r10,8)
        addq      $8, %r10
        cmpq      %r9, %r10
        jb        ..B5.18
..B5.20:
        cmpq      %r8, %r9
        jae       ..B5.4
..B5.22:
        movq      (%rsi,%r9,8), %rax
        movq      %rax, (%rcx,%r9,8)
        incq      %r9
        cmpq      %r8, %r9
        jb        ..B5.22
        jmp       ..B5.4
..B5.24:
        xorl      %r9d, %r9d
        jmp       ..B5.20
        .align    16,0x90
..___tag_value__Z15copyconststridePdS_l.16:
	.type	_Z15copyconststridePdS_l,@function
	.size	_Z15copyconststridePdS_l,.-_Z15copyconststridePdS_l
	.data
# -- End  _Z15copyconststridePdS_l
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .debug_line
	.section .debug_line
.debug_line_seg:
	.align 1
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x0000001c
	.4byte 0x00000000
	.byte 0x01
	.4byte 0x004c507a
	.byte 0x01
	.byte 0x78
	.byte 0x10
	.byte 0x0a
	.byte 0x00
	.8byte __gxx_personality_v0
	.byte 0x00
	.4byte 0x9008070c
	.byte 0x01
	.4byte 0x00000024
	.4byte 0x00000024
	.8byte ..___tag_value__Z3sumPdl.1
	.8byte ..___tag_value__Z3sumPdl.2-..___tag_value__Z3sumPdl.1
	.byte 0x08
	.8byte 0x0000000000000000
	.4byte 0x00000000
	.2byte 0x0000
	.byte 0x00
	.4byte 0x00000024
	.4byte 0x0000004c
	.8byte ..___tag_value__Z9sumstridePdli.3
	.8byte ..___tag_value__Z9sumstridePdli.4-..___tag_value__Z9sumstridePdli.3
	.byte 0x08
	.8byte 0x0000000000000000
	.4byte 0x00000000
	.2byte 0x0000
	.byte 0x00
	.4byte 0x00000024
	.4byte 0x00000074
	.8byte ..___tag_value__Z14sumconststridePdl.5
	.8byte ..___tag_value__Z14sumconststridePdl.6-..___tag_value__Z14sumconststridePdl.5
	.byte 0x08
	.8byte 0x0000000000000000
	.4byte 0x00000000
	.2byte 0x0000
	.byte 0x00
	.4byte 0x0000003c
	.4byte 0x0000009c
	.8byte ..___tag_value__Z4copyPdS_l.7
	.8byte ..___tag_value__Z4copyPdS_l.11-..___tag_value__Z4copyPdS_l.7
	.byte 0x08
	.8byte 0x0000000000000000
	.byte 0x04
	.4byte ..___tag_value__Z4copyPdS_l.8-..___tag_value__Z4copyPdS_l.7
	.byte 0x0c
	.2byte 0x1007
	.byte 0x04
	.4byte ..___tag_value__Z4copyPdS_l.9-..___tag_value__Z4copyPdS_l.8
	.byte 0x0c
	.2byte 0x0807
	.byte 0x04
	.4byte ..___tag_value__Z4copyPdS_l.10-..___tag_value__Z4copyPdS_l.9
	.byte 0x0c
	.2byte 0x1007
	.4byte 0x00000000
	.2byte 0x0000
	.byte 0x00
	.4byte 0x0000003c
	.4byte 0x000000dc
	.8byte ..___tag_value__Z15copyconststridePdS_l.12
	.8byte ..___tag_value__Z15copyconststridePdS_l.16-..___tag_value__Z15copyconststridePdS_l.12
	.byte 0x08
	.8byte 0x0000000000000000
	.byte 0x04
	.4byte ..___tag_value__Z15copyconststridePdS_l.13-..___tag_value__Z15copyconststridePdS_l.12
	.byte 0x0c
	.2byte 0x1007
	.byte 0x04
	.4byte ..___tag_value__Z15copyconststridePdS_l.14-..___tag_value__Z15copyconststridePdS_l.13
	.byte 0x0c
	.2byte 0x0807
	.byte 0x04
	.4byte ..___tag_value__Z15copyconststridePdS_l.15-..___tag_value__Z15copyconststridePdS_l.14
	.byte 0x0c
	.2byte 0x1007
	.4byte 0x00000000
	.2byte 0x0000
	.byte 0x00
# End

