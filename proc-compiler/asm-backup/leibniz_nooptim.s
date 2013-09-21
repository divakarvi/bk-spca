# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-O0 -DNDEBUG -prec-div -no-ftz -fno-inline-functions -restrict -S";
	.file "leibniz.cpp"
	.text
..TXTST0:
# -- Begin  _Z7leibnizl
# mark_begin;
       .align    2,0x90
	.globl _Z7leibnizl
_Z7leibnizl:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
..___tag_value__Z7leibnizl.1:                                   #7.27
        pushq     %rbp                                          #7.27
..___tag_value__Z7leibnizl.3:                                   #
        movq      %rsp, %rbp                                    #7.27
..___tag_value__Z7leibnizl.4:                                   #
        subq      $32, %rsp                                     #7.27
        movq      %rdi, -32(%rbp)                               #7.27
        movq      $0, -24(%rbp)                                 #10.7
                                # LOE
..B1.2:                         # Preds ..B1.3 ..B1.1
        movq      -24(%rbp), %rax                               #10.12
        movq      -32(%rbp), %rdx                               #10.16
        cmpq      %rdx, %rax                                    #10.16
        jl        ..B1.4        # Prob 50%                      #10.16
        jmp       ..B1.9        # Prob 100%                     #10.16
                                # LOE
..B1.3:                         # Preds ..B1.5 ..B1.7 ..B1.8
        movl      $1, %eax                                      #10.19
        addq      -24(%rbp), %rax                               #10.19
        movq      %rax, -24(%rbp)                               #10.19
        jmp       ..B1.2        # Prob 100%                     #10.19
                                # LOE
..B1.4:                         # Preds ..B1.2
        movq      -24(%rbp), %rax                               #11.10
        testq     %rax, %rax                                    #11.13
        jne       ..B1.6        # Prob 50%                      #11.13
                                # LOE
..B1.5:                         # Preds ..B1.4
        movsd     .L_2il0floatpacket.1(%rip), %xmm0             #12.10
        movsd     %xmm0, -16(%rbp)                              #12.4
        jmp       ..B1.3        # Prob 100%                     #12.4
                                # LOE
..B1.6:                         # Preds ..B1.4
        movq      -24(%rbp), %rax                               #13.15
        movl      $1, %edx                                      #13.12
        movl      $0, %ecx                                      #13.12
        testq     %rax, %rax                                    #13.12
        cmovl     %edx, %ecx                                    #13.12
        movslq    %ecx, %rcx                                    #13.17
        addq      -24(%rbp), %rcx                               #13.17
        sarq      $1, %rcx                                      #13.17
        imulq     $2, %rcx, %rax                                #13.17
        negq      %rax                                          #13.17
        addq      -24(%rbp), %rax                               #13.17
        cmpq      $1, %rax                                      #13.20
        jne       ..B1.8        # Prob 50%                      #13.20
                                # LOE
..B1.7:                         # Preds ..B1.6
        movsd     .L_2il0floatpacket.1(%rip), %xmm0             #14.12
        movq      -24(%rbp), %rax                               #14.21
        cvtsi2sdq %rax, %xmm1                                   #14.21
        movq      -24(%rbp), %rax                               #14.21
        cvtsi2sdq %rax, %xmm2                                   #14.21
        addsd     %xmm2, %xmm1                                  #14.21
        movsd     .L_2il0floatpacket.2(%rip), %xmm2             #14.4
        addsd     %xmm2, %xmm1                                  #14.23
        divsd     %xmm1, %xmm0                                  #14.23
        movsd     -16(%rbp), %xmm1                              #14.4
        subsd     %xmm0, %xmm1                                  #14.4
        movsd     %xmm1, -16(%rbp)                              #14.4
        jmp       ..B1.3        # Prob 100%                     #14.4
                                # LOE
..B1.8:                         # Preds ..B1.6
        movsd     .L_2il0floatpacket.1(%rip), %xmm0             #16.12
        movq      -24(%rbp), %rax                               #16.21
        cvtsi2sdq %rax, %xmm1                                   #16.21
        movq      -24(%rbp), %rax                               #16.21
        cvtsi2sdq %rax, %xmm2                                   #16.21
        addsd     %xmm2, %xmm1                                  #16.21
        movsd     .L_2il0floatpacket.2(%rip), %xmm2             #16.4
        addsd     %xmm2, %xmm1                                  #16.23
        divsd     %xmm1, %xmm0                                  #16.23
        movsd     -16(%rbp), %xmm1                              #16.4
        addsd     %xmm0, %xmm1                                  #16.4
        movsd     %xmm1, -16(%rbp)                              #16.4
        jmp       ..B1.3        # Prob 100%                     #16.4
                                # LOE
..B1.9:                         # Preds ..B1.2
        movsd     -16(%rbp), %xmm0                              #17.10
        leave                                                   #17.10
..___tag_value__Z7leibnizl.6:                                   #
        ret                                                     #17.10
        .align    2,0x90
..___tag_value__Z7leibnizl.7:                                   #
                                # LOE
# mark_end;
	.type	_Z7leibnizl,@function
	.size	_Z7leibnizl,.-_Z7leibnizl
	.data
# -- End  _Z7leibnizl
	.text
# -- Begin  _Z8leibnizXl
# mark_begin;
       .align    2,0x90
	.globl _Z8leibnizXl
_Z8leibnizXl:
# parameter 1: %rdi
..B2.1:                         # Preds ..B2.0
..___tag_value__Z8leibnizXl.8:                                  #20.28
        pushq     %rbp                                          #20.28
..___tag_value__Z8leibnizXl.10:                                 #
        movq      %rsp, %rbp                                    #20.28
..___tag_value__Z8leibnizXl.11:                                 #
        subq      $32, %rsp                                     #20.28
        movq      %rdi, -32(%rbp)                               #20.28
        movsd     .L_2il0floatpacket.4(%rip), %xmm0             #22.14
        movsd     %xmm0, -24(%rbp)                              #22.14
        pxor      %xmm0, %xmm0                                  #23.14
        movsd     %xmm0, -16(%rbp)                              #23.14
        movq      $2, -8(%rbp)                                  #24.7
                                # LOE
..B2.2:                         # Preds ..B2.3 ..B2.1
        movq      -8(%rbp), %rax                                #24.12
        movq      -32(%rbp), %rdx                               #24.16
        cmpq      %rdx, %rax                                    #24.16
        jge       ..B2.4        # Prob 50%                      #24.16
                                # LOE
..B2.3:                         # Preds ..B2.2
        movsd     .L_2il0floatpacket.4(%rip), %xmm0             #25.13
        movq      -8(%rbp), %rax                                #25.22
        cvtsi2sdq %rax, %xmm1                                   #25.22
        movq      -8(%rbp), %rax                                #25.22
        cvtsi2sdq %rax, %xmm2                                   #25.22
        addsd     %xmm2, %xmm1                                  #25.22
        movsd     .L_2il0floatpacket.5(%rip), %xmm2             #25.5
        addsd     %xmm2, %xmm1                                  #25.24
        divsd     %xmm1, %xmm0                                  #25.24
        movsd     -24(%rbp), %xmm1                              #25.5
        addsd     %xmm0, %xmm1                                  #25.5
        movsd     %xmm1, -24(%rbp)                              #25.5
        movl      $2, %eax                                      #24.19
        addq      -8(%rbp), %rax                                #24.23
        movq      %rax, -8(%rbp)                                #24.19
        jmp       ..B2.2        # Prob 100%                     #24.19
                                # LOE
..B2.4:                         # Preds ..B2.2
        movq      $1, -8(%rbp)                                  #26.7
                                # LOE
..B2.5:                         # Preds ..B2.6 ..B2.4
        movq      -8(%rbp), %rax                                #26.12
        movq      -32(%rbp), %rdx                               #26.16
        cmpq      %rdx, %rax                                    #26.16
        jge       ..B2.7        # Prob 50%                      #26.16
                                # LOE
..B2.6:                         # Preds ..B2.5
        movsd     .L_2il0floatpacket.4(%rip), %xmm0             #27.13
        movq      -8(%rbp), %rax                                #27.22
        cvtsi2sdq %rax, %xmm1                                   #27.22
        movq      -8(%rbp), %rax                                #27.22
        cvtsi2sdq %rax, %xmm2                                   #27.22
        addsd     %xmm2, %xmm1                                  #27.22
        movsd     .L_2il0floatpacket.5(%rip), %xmm2             #27.5
        addsd     %xmm2, %xmm1                                  #27.24
        divsd     %xmm1, %xmm0                                  #27.24
        movsd     -16(%rbp), %xmm1                              #27.5
        addsd     %xmm0, %xmm1                                  #27.5
        movsd     %xmm1, -16(%rbp)                              #27.5
        movl      $2, %eax                                      #26.19
        addq      -8(%rbp), %rax                                #26.23
        movq      %rax, -8(%rbp)                                #26.19
        jmp       ..B2.5        # Prob 100%                     #26.19
                                # LOE
..B2.7:                         # Preds ..B2.5
        movsd     -24(%rbp), %xmm0                              #28.10
        movsd     -16(%rbp), %xmm1                              #28.15
        subsd     %xmm1, %xmm0                                  #28.15
        leave                                                   #28.15
..___tag_value__Z8leibnizXl.13:                                 #
        ret                                                     #28.15
        .align    2,0x90
..___tag_value__Z8leibnizXl.14:                                 #
                                # LOE
# mark_end;
	.type	_Z8leibnizXl,@function
	.size	_Z8leibnizXl,.-_Z8leibnizXl
	.data
# -- End  _Z8leibnizXl
	.text
# -- Begin  _Z9leibnizXXl
# mark_begin;
       .align    2,0x90
	.globl _Z9leibnizXXl
_Z9leibnizXXl:
# parameter 1: %rdi
..B3.1:                         # Preds ..B3.0
..___tag_value__Z9leibnizXXl.15:                                #31.29
        pushq     %rbp                                          #31.29
..___tag_value__Z9leibnizXXl.17:                                #
        movq      %rsp, %rbp                                    #31.29
..___tag_value__Z9leibnizXXl.18:                                #
        subq      $96, %rsp                                     #31.29
        movq      %rdi, -96(%rbp)                               #31.29
        lea       -88(%rbp), %rax                               #33.17
        movl      $0, %edx                                      #33.17
        movl      $80, %ecx                                     #33.17
        movq      %rax, %rdi                                    #33.17
        movl      %edx, %eax                                    #33.17
        andl      $65535, %eax                                  #33.17
        movb      %al, %ah                                      #33.17
        movl      %eax, %edx                                    #33.17
        shll      $16, %eax                                     #33.17
        orl       %edx, %eax                                    #33.17
        movl      %ecx, %esi                                    #33.17
        shrl      $2, %ecx                                      #33.17
        rep                                                     #33.17
        stosl                                                   #33.17
        movl      %esi, %ecx                                    #33.17
        andl      $3, %ecx                                      #33.17
        rep                                                     #33.17
        stosb                                                   #33.17
                                # LOE
..B3.2:                         # Preds ..B3.1
        movq      $0, -8(%rbp)                                  #34.7
                                # LOE
..B3.3:                         # Preds ..B3.4 ..B3.2
        movq      -8(%rbp), %rax                                #34.12
        movq      -96(%rbp), %rdx                               #34.16
        cmpq      %rdx, %rax                                    #34.16
        jge       ..B3.5        # Prob 50%                      #34.16
                                # LOE
..B3.4:                         # Preds ..B3.3
        lea       -88(%rbp), %rax                               #35.5
        addq      $0, %rax                                      #35.5
        movsd     .L_2il0floatpacket.7(%rip), %xmm0             #35.15
        movq      -8(%rbp), %rdx                                #35.24
        cvtsi2sdq %rdx, %xmm1                                   #35.24
        movq      -8(%rbp), %rdx                                #35.24
        cvtsi2sdq %rdx, %xmm2                                   #35.24
        addsd     %xmm2, %xmm1                                  #35.24
        movsd     .L_2il0floatpacket.17(%rip), %xmm2            #35.5
        addsd     %xmm2, %xmm1                                  #35.26
        divsd     %xmm1, %xmm0                                  #35.26
        movsd     (%rax), %xmm1                                 #35.5
        addsd     %xmm0, %xmm1                                  #35.5
        lea       -88(%rbp), %rax                               #35.5
        addq      $0, %rax                                      #35.5
        movsd     %xmm1, (%rax)                                 #35.5
        lea       -88(%rbp), %rax                               #36.5
        addq      $8, %rax                                      #36.5
        movsd     .L_2il0floatpacket.7(%rip), %xmm0             #36.15
        movq      -8(%rbp), %rdx                                #36.24
        cvtsi2sdq %rdx, %xmm1                                   #36.24
        movq      -8(%rbp), %rdx                                #36.24
        cvtsi2sdq %rdx, %xmm2                                   #36.24
        addsd     %xmm2, %xmm1                                  #36.24
        movsd     .L_2il0floatpacket.8(%rip), %xmm2             #36.26
        addsd     %xmm2, %xmm1                                  #36.26
        divsd     %xmm1, %xmm0                                  #36.26
        movsd     (%rax), %xmm1                                 #36.5
        addsd     %xmm0, %xmm1                                  #36.5
        lea       -88(%rbp), %rax                               #36.5
        addq      $8, %rax                                      #36.5
        movsd     %xmm1, (%rax)                                 #36.5
        lea       -88(%rbp), %rax                               #37.5
        addq      $16, %rax                                     #37.5
        movsd     .L_2il0floatpacket.7(%rip), %xmm0             #37.15
        movq      -8(%rbp), %rdx                                #37.24
        cvtsi2sdq %rdx, %xmm1                                   #37.24
        movq      -8(%rbp), %rdx                                #37.24
        cvtsi2sdq %rdx, %xmm2                                   #37.24
        addsd     %xmm2, %xmm1                                  #37.24
        movsd     .L_2il0floatpacket.9(%rip), %xmm2             #37.26
        addsd     %xmm2, %xmm1                                  #37.26
        divsd     %xmm1, %xmm0                                  #37.26
        movsd     (%rax), %xmm1                                 #37.5
        addsd     %xmm0, %xmm1                                  #37.5
        lea       -88(%rbp), %rax                               #37.5
        addq      $16, %rax                                     #37.5
        movsd     %xmm1, (%rax)                                 #37.5
        lea       -88(%rbp), %rax                               #38.5
        addq      $24, %rax                                     #38.5
        movsd     .L_2il0floatpacket.7(%rip), %xmm0             #38.15
        movq      -8(%rbp), %rdx                                #38.24
        cvtsi2sdq %rdx, %xmm1                                   #38.24
        movq      -8(%rbp), %rdx                                #38.24
        cvtsi2sdq %rdx, %xmm2                                   #38.24
        addsd     %xmm2, %xmm1                                  #38.24
        movsd     .L_2il0floatpacket.10(%rip), %xmm2            #38.26
        addsd     %xmm2, %xmm1                                  #38.26
        divsd     %xmm1, %xmm0                                  #38.26
        movsd     (%rax), %xmm1                                 #38.5
        addsd     %xmm0, %xmm1                                  #38.5
        lea       -88(%rbp), %rax                               #38.5
        addq      $24, %rax                                     #38.5
        movsd     %xmm1, (%rax)                                 #38.5
        lea       -88(%rbp), %rax                               #39.5
        addq      $32, %rax                                     #39.5
        movsd     .L_2il0floatpacket.7(%rip), %xmm0             #39.15
        movq      -8(%rbp), %rdx                                #39.24
        cvtsi2sdq %rdx, %xmm1                                   #39.24
        movq      -8(%rbp), %rdx                                #39.24
        cvtsi2sdq %rdx, %xmm2                                   #39.24
        addsd     %xmm2, %xmm1                                  #39.24
        movsd     .L_2il0floatpacket.11(%rip), %xmm2            #39.26
        addsd     %xmm2, %xmm1                                  #39.26
        divsd     %xmm1, %xmm0                                  #39.26
        movsd     (%rax), %xmm1                                 #39.5
        addsd     %xmm0, %xmm1                                  #39.5
        lea       -88(%rbp), %rax                               #39.5
        addq      $32, %rax                                     #39.5
        movsd     %xmm1, (%rax)                                 #39.5
        lea       -88(%rbp), %rax                               #40.5
        addq      $40, %rax                                     #40.5
        movsd     .L_2il0floatpacket.7(%rip), %xmm0             #40.15
        movq      -8(%rbp), %rdx                                #40.24
        cvtsi2sdq %rdx, %xmm1                                   #40.24
        movq      -8(%rbp), %rdx                                #40.24
        cvtsi2sdq %rdx, %xmm2                                   #40.24
        addsd     %xmm2, %xmm1                                  #40.24
        movsd     .L_2il0floatpacket.12(%rip), %xmm2            #40.26
        addsd     %xmm2, %xmm1                                  #40.26
        divsd     %xmm1, %xmm0                                  #40.26
        movsd     (%rax), %xmm1                                 #40.5
        addsd     %xmm0, %xmm1                                  #40.5
        lea       -88(%rbp), %rax                               #40.5
        addq      $40, %rax                                     #40.5
        movsd     %xmm1, (%rax)                                 #40.5
        lea       -88(%rbp), %rax                               #41.5
        addq      $48, %rax                                     #41.5
        movsd     .L_2il0floatpacket.7(%rip), %xmm0             #41.15
        movq      -8(%rbp), %rdx                                #41.24
        cvtsi2sdq %rdx, %xmm1                                   #41.24
        movq      -8(%rbp), %rdx                                #41.24
        cvtsi2sdq %rdx, %xmm2                                   #41.24
        addsd     %xmm2, %xmm1                                  #41.24
        movsd     .L_2il0floatpacket.13(%rip), %xmm2            #41.26
        addsd     %xmm2, %xmm1                                  #41.26
        divsd     %xmm1, %xmm0                                  #41.26
        movsd     (%rax), %xmm1                                 #41.5
        addsd     %xmm0, %xmm1                                  #41.5
        lea       -88(%rbp), %rax                               #41.5
        addq      $48, %rax                                     #41.5
        movsd     %xmm1, (%rax)                                 #41.5
        lea       -88(%rbp), %rax                               #42.5
        addq      $56, %rax                                     #42.5
        movsd     .L_2il0floatpacket.7(%rip), %xmm0             #42.15
        movq      -8(%rbp), %rdx                                #42.24
        cvtsi2sdq %rdx, %xmm1                                   #42.24
        movq      -8(%rbp), %rdx                                #42.24
        cvtsi2sdq %rdx, %xmm2                                   #42.24
        addsd     %xmm2, %xmm1                                  #42.24
        movsd     .L_2il0floatpacket.14(%rip), %xmm2            #42.26
        addsd     %xmm2, %xmm1                                  #42.26
        divsd     %xmm1, %xmm0                                  #42.26
        movsd     (%rax), %xmm1                                 #42.5
        addsd     %xmm0, %xmm1                                  #42.5
        lea       -88(%rbp), %rax                               #42.5
        addq      $56, %rax                                     #42.5
        movsd     %xmm1, (%rax)                                 #42.5
        lea       -88(%rbp), %rax                               #43.5
        addq      $64, %rax                                     #43.5
        movsd     .L_2il0floatpacket.7(%rip), %xmm0             #43.15
        movq      -8(%rbp), %rdx                                #43.24
        cvtsi2sdq %rdx, %xmm1                                   #43.24
        movq      -8(%rbp), %rdx                                #43.24
        cvtsi2sdq %rdx, %xmm2                                   #43.24
        addsd     %xmm2, %xmm1                                  #43.24
        movsd     .L_2il0floatpacket.15(%rip), %xmm2            #43.26
        addsd     %xmm2, %xmm1                                  #43.26
        divsd     %xmm1, %xmm0                                  #43.26
        movsd     (%rax), %xmm1                                 #43.5
        addsd     %xmm0, %xmm1                                  #43.5
        lea       -88(%rbp), %rax                               #43.5
        addq      $64, %rax                                     #43.5
        movsd     %xmm1, (%rax)                                 #43.5
        lea       -88(%rbp), %rax                               #44.5
        addq      $72, %rax                                     #44.5
        movsd     .L_2il0floatpacket.7(%rip), %xmm0             #44.15
        movq      -8(%rbp), %rdx                                #44.24
        cvtsi2sdq %rdx, %xmm1                                   #44.24
        movq      -8(%rbp), %rdx                                #44.24
        cvtsi2sdq %rdx, %xmm2                                   #44.24
        addsd     %xmm2, %xmm1                                  #44.24
        movsd     .L_2il0floatpacket.16(%rip), %xmm2            #44.26
        addsd     %xmm2, %xmm1                                  #44.26
        divsd     %xmm1, %xmm0                                  #44.26
        movsd     (%rax), %xmm1                                 #44.5
        addsd     %xmm0, %xmm1                                  #44.5
        lea       -88(%rbp), %rax                               #44.5
        addq      $72, %rax                                     #44.5
        movsd     %xmm1, (%rax)                                 #44.5
        movl      $10, %eax                                     #34.19
        addq      -8(%rbp), %rax                                #34.19
        movq      %rax, -8(%rbp)                                #34.19
        jmp       ..B3.3        # Prob 100%                     #34.19
                                # LOE
..B3.5:                         # Preds ..B3.3
        lea       -88(%rbp), %rax                               #46.10
        addq      $0, %rax                                      #47.34
        lea       -88(%rbp), %rdx                               #46.17
        addq      $16, %rdx                                     #47.34
        movsd     (%rax), %xmm0                                 #46.10
        movsd     (%rdx), %xmm1                                 #46.17
        addsd     %xmm1, %xmm0                                  #46.17
        lea       -88(%rbp), %rax                               #46.24
        addq      $32, %rax                                     #47.34
        movsd     (%rax), %xmm1                                 #46.24
        addsd     %xmm1, %xmm0                                  #46.24
        lea       -88(%rbp), %rax                               #46.31
        addq      $48, %rax                                     #47.34
        movsd     (%rax), %xmm1                                 #46.31
        addsd     %xmm1, %xmm0                                  #46.31
        lea       -88(%rbp), %rax                               #46.38
        addq      $64, %rax                                     #47.34
        movsd     (%rax), %xmm1                                 #46.38
        addsd     %xmm1, %xmm0                                  #46.38
        lea       -88(%rbp), %rax                               #47.6
        addq      $8, %rax                                      #47.34
        movsd     (%rax), %xmm1                                 #47.6
        subsd     %xmm1, %xmm0                                  #47.6
        lea       -88(%rbp), %rax                               #47.13
        addq      $24, %rax                                     #47.34
        movsd     (%rax), %xmm1                                 #47.13
        subsd     %xmm1, %xmm0                                  #47.13
        lea       -88(%rbp), %rax                               #47.20
        addq      $40, %rax                                     #47.34
        movsd     (%rax), %xmm1                                 #47.20
        subsd     %xmm1, %xmm0                                  #47.20
        lea       -88(%rbp), %rax                               #47.27
        addq      $56, %rax                                     #47.34
        movsd     (%rax), %xmm1                                 #47.27
        subsd     %xmm1, %xmm0                                  #47.27
        lea       -88(%rbp), %rax                               #47.34
        addq      $72, %rax                                     #47.34
        movsd     (%rax), %xmm1                                 #47.34
        subsd     %xmm1, %xmm0                                  #47.34
        leave                                                   #47.34
..___tag_value__Z9leibnizXXl.20:                                #
        ret                                                     #47.34
        .align    2,0x90
..___tag_value__Z9leibnizXXl.21:                                #
                                # LOE
# mark_end;
	.type	_Z9leibnizXXl,@function
	.size	_Z9leibnizXXl,.-_Z9leibnizXXl
	.data
# -- End  _Z9leibnizXXl
	.text
# -- Begin  main
# mark_begin;
       .align    2,0x90
	.globl main
main:
..B4.1:                         # Preds ..B4.0
..___tag_value_main.22:                                         #50.11
        pushq     %rbp                                          #50.11
..___tag_value_main.24:                                         #
        movq      %rsp, %rbp                                    #50.11
..___tag_value_main.25:                                         #
        subq      $464, %rsp                                    #50.11
        lea       -464(%rbp), %rax                              #54.3
        movq      %rax, -448(%rbp)                              #54.7
        movq      -448(%rbp), %rax                              #54.7
        movq      -448(%rbp), %rdx                              #54.7
        movq      %rax, -96(%rbp)                               #54.7
        movq      %rdx, -88(%rbp)                               #54.7
        rdtsc                                                   #54.7
        movq      -88(%rbp), %rcx                               #54.7
        movl      %edx, 4(%rcx)                                 #54.7
        movq      -96(%rbp), %rdx                               #54.7
        movl      %eax, (%rdx)                                  #54.7
        movl      $1000000000, %edi                             #55.10
..___tag_value_main.27:                                         #55.10
        call      _Z7leibnizl                                   #55.10
..___tag_value_main.28:                                         #
                                # LOE xmm0
..B4.28:                        # Preds ..B4.1
        movsd     %xmm0, -440(%rbp)                             #55.10
                                # LOE
..B4.2:                         # Preds ..B4.28
        movsd     -440(%rbp), %xmm0                             #55.10
        movsd     %xmm0, -432(%rbp)                             #55.3
        lea       -464(%rbp), %rax                              #56.19
        movq      %rax, -424(%rbp)                              #56.23
        movq      -424(%rbp), %rax                              #56.23
        movq      -424(%rbp), %rdx                              #56.23
        movq      %rax, -80(%rbp)                               #56.23
        movq      %rdx, -72(%rbp)                               #56.23
        rdtsc                                                   #56.23
        movq      -72(%rbp), %rcx                               #56.23
        movl      %edx, 12(%rcx)                                #56.23
        movq      -80(%rbp), %rdx                               #56.23
        movl      %eax, 8(%rdx)                                 #56.23
        movq      -424(%rbp), %rax                              #56.23
        movl      (%rax), %eax                                  #56.23
        movl      %eax, -416(%rbp)                              #56.23
        movq      -424(%rbp), %rax                              #56.23
        movl      4(%rax), %eax                                 #56.23
        movl      %eax, -408(%rbp)                              #56.23
        movq      -424(%rbp), %rax                              #56.23
        movl      8(%rax), %eax                                 #56.23
        movl      %eax, -400(%rbp)                              #56.23
        movq      -424(%rbp), %rax                              #56.23
        movl      -408(%rbp), %edx                              #56.23
        negl      %edx                                          #56.23
        addl      12(%rax), %edx                                #56.23
        cvtsi2sdq %rdx, %xmm0                                   #56.23
        movsd     %xmm0, -392(%rbp)                             #56.23
        movss     .L_2il0floatpacket.65(%rip), %xmm0            #56.23
        cvtss2sd  %xmm0, %xmm0                                  #56.23
        movss     .L_2il0floatpacket.66(%rip), %xmm1            #56.23
        cvtss2sd  %xmm1, %xmm1                                  #56.23
..___tag_value_main.29:                                         #56.23
        call      pow                                           #56.23
..___tag_value_main.30:                                         #
                                # LOE xmm0
..B4.29:                        # Preds ..B4.2
        movsd     %xmm0, -384(%rbp)                             #56.23
                                # LOE
..B4.3:                         # Preds ..B4.29
        movsd     -392(%rbp), %xmm0                             #56.23
        movsd     -384(%rbp), %xmm1                             #56.23
        mulsd     %xmm1, %xmm0                                  #56.23
        movsd     %xmm0, -392(%rbp)                             #56.23
        movl      -400(%rbp), %eax                              #56.23
        cvtsi2sdq %rax, %xmm0                                   #56.23
        movsd     -392(%rbp), %xmm1                             #56.23
        addsd     %xmm0, %xmm1                                  #56.23
        movl      -416(%rbp), %eax                              #56.23
        cvtsi2sdq %rax, %xmm0                                   #56.23
        subsd     %xmm0, %xmm1                                  #56.23
        movsd     %xmm1, -392(%rbp)                             #56.23
        movsd     -392(%rbp), %xmm0                             #56.23
        movsd     %xmm0, -376(%rbp)                             #56.17
        movl      $_ZSt4cout, %eax                              #57.7
        movl      $.L_2__STRING.0, %edx                         #57.7
        movq      %rax, %rdi                                    #57.7
        movq      %rdx, %rsi                                    #57.7
..___tag_value_main.31:                                         #57.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #57.7
..___tag_value_main.32:                                         #
                                # LOE rax
..B4.30:                        # Preds ..B4.3
        movq      %rax, -368(%rbp)                              #57.7
                                # LOE
..B4.4:                         # Preds ..B4.30
        movq      -368(%rbp), %rax                              #57.25
        movsd     -432(%rbp), %xmm0                             #57.25
        movq      %rax, %rdi                                    #57.25
..___tag_value_main.33:                                         #57.25
        call      _ZNSolsEd                                     #57.25
..___tag_value_main.34:                                         #
                                # LOE rax
..B4.31:                        # Preds ..B4.4
        movq      %rax, -360(%rbp)                              #57.25
                                # LOE
..B4.5:                         # Preds ..B4.31
        movq      -360(%rbp), %rax                              #57.31
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %edx #57.31
        movq      %rax, %rdi                                    #57.31
        movq      %rdx, %rsi                                    #57.31
..___tag_value_main.35:                                         #57.31
        call      _ZNSolsEPFRSoS_E                              #57.31
..___tag_value_main.36:                                         #
                                # LOE rax
..B4.32:                        # Preds ..B4.5
        movq      %rax, -352(%rbp)                              #57.31
                                # LOE
..B4.6:                         # Preds ..B4.32
        movl      $_ZSt4cout, %eax                              #58.7
        movl      $.L_2__STRING.1, %edx                         #58.7
        movq      %rax, %rdi                                    #58.7
        movq      %rdx, %rsi                                    #58.7
..___tag_value_main.37:                                         #58.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #58.7
..___tag_value_main.38:                                         #
                                # LOE rax
..B4.33:                        # Preds ..B4.6
        movq      %rax, -344(%rbp)                              #58.7
                                # LOE
..B4.7:                         # Preds ..B4.33
        movq      -344(%rbp), %rax                              #58.39
        movsd     -376(%rbp), %xmm0                             #58.39
        movsd     .L_2il0floatpacket.64(%rip), %xmm1            #58.39
        divsd     %xmm1, %xmm0                                  #58.39
        movq      %rax, %rdi                                    #58.39
..___tag_value_main.39:                                         #58.39
        call      _ZNSolsEd                                     #58.39
..___tag_value_main.40:                                         #
                                # LOE rax
..B4.34:                        # Preds ..B4.7
        movq      %rax, -336(%rbp)                              #58.39
                                # LOE
..B4.8:                         # Preds ..B4.34
        movq      -336(%rbp), %rax                              #58.48
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %edx #58.48
        movq      %rax, %rdi                                    #58.48
        movq      %rdx, %rsi                                    #58.48
..___tag_value_main.41:                                         #58.48
        call      _ZNSolsEPFRSoS_E                              #58.48
..___tag_value_main.42:                                         #
                                # LOE rax
..B4.35:                        # Preds ..B4.8
        movq      %rax, -328(%rbp)                              #58.48
                                # LOE
..B4.9:                         # Preds ..B4.35
        lea       -464(%rbp), %rax                              #59.3
        movq      %rax, -320(%rbp)                              #59.7
        movq      -320(%rbp), %rax                              #59.7
        movq      -320(%rbp), %rdx                              #59.7
        movq      %rax, -64(%rbp)                               #59.7
        movq      %rdx, -56(%rbp)                               #59.7
        rdtsc                                                   #59.7
        movq      -56(%rbp), %rcx                               #59.7
        movl      %edx, 4(%rcx)                                 #59.7
        movq      -64(%rbp), %rdx                               #59.7
        movl      %eax, (%rdx)                                  #59.7
        movl      $1000000000, %edi                             #60.10
..___tag_value_main.43:                                         #60.10
        call      _Z8leibnizXl                                  #60.10
..___tag_value_main.44:                                         #
                                # LOE xmm0
..B4.36:                        # Preds ..B4.9
        movsd     %xmm0, -312(%rbp)                             #60.10
                                # LOE
..B4.10:                        # Preds ..B4.36
        movsd     -312(%rbp), %xmm0                             #60.10
        movsd     %xmm0, -432(%rbp)                             #60.3
        lea       -464(%rbp), %rax                              #61.11
        movq      %rax, -304(%rbp)                              #61.15
        movq      -304(%rbp), %rax                              #61.15
        movq      -304(%rbp), %rdx                              #61.15
        movq      %rax, -48(%rbp)                               #61.15
        movq      %rdx, -40(%rbp)                               #61.15
        rdtsc                                                   #61.15
        movq      -40(%rbp), %rcx                               #61.15
        movl      %edx, 12(%rcx)                                #61.15
        movq      -48(%rbp), %rdx                               #61.15
        movl      %eax, 8(%rdx)                                 #61.15
        movq      -304(%rbp), %rax                              #61.15
        movl      (%rax), %eax                                  #61.15
        movl      %eax, -296(%rbp)                              #61.15
        movq      -304(%rbp), %rax                              #61.15
        movl      4(%rax), %eax                                 #61.15
        movl      %eax, -288(%rbp)                              #61.15
        movq      -304(%rbp), %rax                              #61.15
        movl      8(%rax), %eax                                 #61.15
        movl      %eax, -280(%rbp)                              #61.15
        movq      -304(%rbp), %rax                              #61.15
        movl      -288(%rbp), %edx                              #61.15
        negl      %edx                                          #61.15
        addl      12(%rax), %edx                                #61.15
        cvtsi2sdq %rdx, %xmm0                                   #61.15
        movsd     %xmm0, -272(%rbp)                             #61.15
        movss     .L_2il0floatpacket.65(%rip), %xmm0            #61.15
        cvtss2sd  %xmm0, %xmm0                                  #61.15
        movss     .L_2il0floatpacket.66(%rip), %xmm1            #61.15
        cvtss2sd  %xmm1, %xmm1                                  #61.15
..___tag_value_main.45:                                         #61.15
        call      pow                                           #61.15
..___tag_value_main.46:                                         #
                                # LOE xmm0
..B4.37:                        # Preds ..B4.10
        movsd     %xmm0, -264(%rbp)                             #61.15
                                # LOE
..B4.11:                        # Preds ..B4.37
        movsd     -272(%rbp), %xmm0                             #61.15
        movsd     -264(%rbp), %xmm1                             #61.15
        mulsd     %xmm1, %xmm0                                  #61.15
        movsd     %xmm0, -272(%rbp)                             #61.15
        movl      -280(%rbp), %eax                              #61.15
        cvtsi2sdq %rax, %xmm0                                   #61.15
        movsd     -272(%rbp), %xmm1                             #61.15
        addsd     %xmm0, %xmm1                                  #61.15
        movl      -296(%rbp), %eax                              #61.15
        cvtsi2sdq %rax, %xmm0                                   #61.15
        subsd     %xmm0, %xmm1                                  #61.15
        movsd     %xmm1, -272(%rbp)                             #61.15
        movsd     -272(%rbp), %xmm0                             #61.15
        movsd     %xmm0, -376(%rbp)                             #61.3
        movl      $_ZSt4cout, %eax                              #62.7
        movl      $.L_2__STRING.0, %edx                         #62.7
        movq      %rax, %rdi                                    #62.7
        movq      %rdx, %rsi                                    #62.7
..___tag_value_main.47:                                         #62.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #62.7
..___tag_value_main.48:                                         #
                                # LOE rax
..B4.38:                        # Preds ..B4.11
        movq      %rax, -256(%rbp)                              #62.7
                                # LOE
..B4.12:                        # Preds ..B4.38
        movq      -256(%rbp), %rax                              #62.25
        movsd     -432(%rbp), %xmm0                             #62.25
        movq      %rax, %rdi                                    #62.25
..___tag_value_main.49:                                         #62.25
        call      _ZNSolsEd                                     #62.25
..___tag_value_main.50:                                         #
                                # LOE rax
..B4.39:                        # Preds ..B4.12
        movq      %rax, -248(%rbp)                              #62.25
                                # LOE
..B4.13:                        # Preds ..B4.39
        movq      -248(%rbp), %rax                              #62.31
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %edx #62.31
        movq      %rax, %rdi                                    #62.31
        movq      %rdx, %rsi                                    #62.31
..___tag_value_main.51:                                         #62.31
        call      _ZNSolsEPFRSoS_E                              #62.31
..___tag_value_main.52:                                         #
                                # LOE rax
..B4.40:                        # Preds ..B4.13
        movq      %rax, -240(%rbp)                              #62.31
                                # LOE
..B4.14:                        # Preds ..B4.40
        movl      $_ZSt4cout, %eax                              #63.7
        movl      $.L_2__STRING.1, %edx                         #63.7
        movq      %rax, %rdi                                    #63.7
        movq      %rdx, %rsi                                    #63.7
..___tag_value_main.53:                                         #63.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #63.7
..___tag_value_main.54:                                         #
                                # LOE rax
..B4.41:                        # Preds ..B4.14
        movq      %rax, -232(%rbp)                              #63.7
                                # LOE
..B4.15:                        # Preds ..B4.41
        movq      -232(%rbp), %rax                              #63.39
        movsd     -376(%rbp), %xmm0                             #63.39
        movsd     .L_2il0floatpacket.64(%rip), %xmm1            #63.39
        divsd     %xmm1, %xmm0                                  #63.39
        movq      %rax, %rdi                                    #63.39
..___tag_value_main.55:                                         #63.39
        call      _ZNSolsEd                                     #63.39
..___tag_value_main.56:                                         #
                                # LOE rax
..B4.42:                        # Preds ..B4.15
        movq      %rax, -224(%rbp)                              #63.39
                                # LOE
..B4.16:                        # Preds ..B4.42
        movq      -224(%rbp), %rax                              #63.48
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %edx #63.48
        movq      %rax, %rdi                                    #63.48
        movq      %rdx, %rsi                                    #63.48
..___tag_value_main.57:                                         #63.48
        call      _ZNSolsEPFRSoS_E                              #63.48
..___tag_value_main.58:                                         #
                                # LOE rax
..B4.43:                        # Preds ..B4.16
        movq      %rax, -216(%rbp)                              #63.48
                                # LOE
..B4.17:                        # Preds ..B4.43
        lea       -464(%rbp), %rax                              #64.3
        movq      %rax, -208(%rbp)                              #64.7
        movq      -208(%rbp), %rax                              #64.7
        movq      -208(%rbp), %rdx                              #64.7
        movq      %rax, -32(%rbp)                               #64.7
        movq      %rdx, -24(%rbp)                               #64.7
        rdtsc                                                   #64.7
        movq      -24(%rbp), %rcx                               #64.7
        movl      %edx, 4(%rcx)                                 #64.7
        movq      -32(%rbp), %rdx                               #64.7
        movl      %eax, (%rdx)                                  #64.7
        movl      $1000000000, %edi                             #65.10
..___tag_value_main.59:                                         #65.10
        call      _Z9leibnizXXl                                 #65.10
..___tag_value_main.60:                                         #
                                # LOE xmm0
..B4.44:                        # Preds ..B4.17
        movsd     %xmm0, -200(%rbp)                             #65.10
                                # LOE
..B4.18:                        # Preds ..B4.44
        movsd     -200(%rbp), %xmm0                             #65.10
        movsd     %xmm0, -432(%rbp)                             #65.3
        lea       -464(%rbp), %rax                              #66.11
        movq      %rax, -192(%rbp)                              #66.15
        movq      -192(%rbp), %rax                              #66.15
        movq      -192(%rbp), %rdx                              #66.15
        movq      %rax, -16(%rbp)                               #66.15
        movq      %rdx, -8(%rbp)                                #66.15
        rdtsc                                                   #66.15
        movq      -8(%rbp), %rcx                                #66.15
        movl      %edx, 12(%rcx)                                #66.15
        movq      -16(%rbp), %rdx                               #66.15
        movl      %eax, 8(%rdx)                                 #66.15
        movq      -192(%rbp), %rax                              #66.15
        movl      (%rax), %eax                                  #66.15
        movl      %eax, -184(%rbp)                              #66.15
        movq      -192(%rbp), %rax                              #66.15
        movl      4(%rax), %eax                                 #66.15
        movl      %eax, -176(%rbp)                              #66.15
        movq      -192(%rbp), %rax                              #66.15
        movl      8(%rax), %eax                                 #66.15
        movl      %eax, -168(%rbp)                              #66.15
        movq      -192(%rbp), %rax                              #66.15
        movl      -176(%rbp), %edx                              #66.15
        negl      %edx                                          #66.15
        addl      12(%rax), %edx                                #66.15
        cvtsi2sdq %rdx, %xmm0                                   #66.15
        movsd     %xmm0, -160(%rbp)                             #66.15
        movss     .L_2il0floatpacket.65(%rip), %xmm0            #66.15
        cvtss2sd  %xmm0, %xmm0                                  #66.15
        movss     .L_2il0floatpacket.66(%rip), %xmm1            #66.15
        cvtss2sd  %xmm1, %xmm1                                  #66.15
..___tag_value_main.61:                                         #66.15
        call      pow                                           #66.15
..___tag_value_main.62:                                         #
                                # LOE xmm0
..B4.45:                        # Preds ..B4.18
        movsd     %xmm0, -152(%rbp)                             #66.15
                                # LOE
..B4.19:                        # Preds ..B4.45
        movsd     -160(%rbp), %xmm0                             #66.15
        movsd     -152(%rbp), %xmm1                             #66.15
        mulsd     %xmm1, %xmm0                                  #66.15
        movsd     %xmm0, -160(%rbp)                             #66.15
        movl      -168(%rbp), %eax                              #66.15
        cvtsi2sdq %rax, %xmm0                                   #66.15
        movsd     -160(%rbp), %xmm1                             #66.15
        addsd     %xmm0, %xmm1                                  #66.15
        movl      -184(%rbp), %eax                              #66.15
        cvtsi2sdq %rax, %xmm0                                   #66.15
        subsd     %xmm0, %xmm1                                  #66.15
        movsd     %xmm1, -160(%rbp)                             #66.15
        movsd     -160(%rbp), %xmm0                             #66.15
        movsd     %xmm0, -376(%rbp)                             #66.3
        movl      $_ZSt4cout, %eax                              #67.7
        movl      $.L_2__STRING.0, %edx                         #67.7
        movq      %rax, %rdi                                    #67.7
        movq      %rdx, %rsi                                    #67.7
..___tag_value_main.63:                                         #67.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #67.7
..___tag_value_main.64:                                         #
                                # LOE rax
..B4.46:                        # Preds ..B4.19
        movq      %rax, -144(%rbp)                              #67.7
                                # LOE
..B4.20:                        # Preds ..B4.46
        movq      -144(%rbp), %rax                              #67.25
        movsd     -432(%rbp), %xmm0                             #67.25
        movq      %rax, %rdi                                    #67.25
..___tag_value_main.65:                                         #67.25
        call      _ZNSolsEd                                     #67.25
..___tag_value_main.66:                                         #
                                # LOE rax
..B4.47:                        # Preds ..B4.20
        movq      %rax, -136(%rbp)                              #67.25
                                # LOE
..B4.21:                        # Preds ..B4.47
        movq      -136(%rbp), %rax                              #67.31
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %edx #67.31
        movq      %rax, %rdi                                    #67.31
        movq      %rdx, %rsi                                    #67.31
..___tag_value_main.67:                                         #67.31
        call      _ZNSolsEPFRSoS_E                              #67.31
..___tag_value_main.68:                                         #
                                # LOE rax
..B4.48:                        # Preds ..B4.21
        movq      %rax, -128(%rbp)                              #67.31
                                # LOE
..B4.22:                        # Preds ..B4.48
        movl      $_ZSt4cout, %eax                              #68.7
        movl      $.L_2__STRING.1, %edx                         #68.7
        movq      %rax, %rdi                                    #68.7
        movq      %rdx, %rsi                                    #68.7
..___tag_value_main.69:                                         #68.7
        call      _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc #68.7
..___tag_value_main.70:                                         #
                                # LOE rax
..B4.49:                        # Preds ..B4.22
        movq      %rax, -120(%rbp)                              #68.7
                                # LOE
..B4.23:                        # Preds ..B4.49
        movq      -120(%rbp), %rax                              #68.39
        movsd     -376(%rbp), %xmm0                             #68.39
        movsd     .L_2il0floatpacket.64(%rip), %xmm1            #68.39
        divsd     %xmm1, %xmm0                                  #68.39
        movq      %rax, %rdi                                    #68.39
..___tag_value_main.71:                                         #68.39
        call      _ZNSolsEd                                     #68.39
..___tag_value_main.72:                                         #
                                # LOE rax
..B4.50:                        # Preds ..B4.23
        movq      %rax, -112(%rbp)                              #68.39
                                # LOE
..B4.24:                        # Preds ..B4.50
        movq      -112(%rbp), %rax                              #68.48
        movl      $_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, %edx #68.48
        movq      %rax, %rdi                                    #68.48
        movq      %rdx, %rsi                                    #68.48
..___tag_value_main.73:                                         #68.48
        call      _ZNSolsEPFRSoS_E                              #68.48
..___tag_value_main.74:                                         #
                                # LOE rax
..B4.51:                        # Preds ..B4.24
        movq      %rax, -104(%rbp)                              #68.48
                                # LOE
..B4.25:                        # Preds ..B4.51
        movl      $0, %eax                                      #69.1
        leave                                                   #69.1
..___tag_value_main.75:                                         #
        ret                                                     #69.1
        .align    2,0x90
..___tag_value_main.76:                                         #
                                # LOE
# mark_end;
	.type	main,@function
	.size	main,.-main
	.data
# -- End  main
	.text
# -- Begin  __sti__$E
# mark_begin;
       .align    2,0x90
__sti__$E:
..B5.1:                         # Preds ..B5.0
..___tag_value___sti__$E.77:                                    #
        pushq     %rbp                                          #
..___tag_value___sti__$E.79:                                    #
        movq      %rsp, %rbp                                    #
..___tag_value___sti__$E.80:                                    #
        subq      $16, %rsp                                     #
        movl      $_ZSt8__ioinit, %eax                          #72.25
        movq      %rax, %rdi                                    #72.25
..___tag_value___sti__$E.82:                                    #72.25
        call      _ZNSt8ios_base4InitC1Ev                       #72.25
..___tag_value___sti__$E.83:                                    #
                                # LOE
..B5.2:                         # Preds ..B5.1
        movl      $_ZNSt8ios_base4InitD1Ev, %eax                #72.25
        movl      $_ZSt8__ioinit, %edx                          #72.25
        movl      $__dso_handle, %ecx                           #72.25
        movq      %rax, %rdi                                    #72.25
        movq      %rdx, %rsi                                    #72.25
        movq      %rcx, %rdx                                    #72.25
        movl      $0, %eax                                      #72.25
..___tag_value___sti__$E.84:                                    #72.25
        call      __cxa_atexit                                  #72.25
..___tag_value___sti__$E.85:                                    #
                                # LOE eax
..B5.6:                         # Preds ..B5.2
        movl      %eax, -16(%rbp)                               #72.25
                                # LOE
..B5.3:                         # Preds ..B5.6
        leave                                                   #72.25
..___tag_value___sti__$E.86:                                    #
        ret                                                     #72.25
        .align    2,0x90
..___tag_value___sti__$E.87:                                    #
                                # LOE
# mark_end;
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
.L_2il0floatpacket.1:
	.long	0x00000000,0x40100000
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.align 8
.L_2il0floatpacket.2:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.4:
	.long	0x00000000,0x40100000
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,8
	.align 8
.L_2il0floatpacket.5:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,8
	.align 8
.L_2il0floatpacket.7:
	.long	0x00000000,0x40100000
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,8
	.align 8
.L_2il0floatpacket.8:
	.long	0x00000000,0x40080000
	.type	.L_2il0floatpacket.8,@object
	.size	.L_2il0floatpacket.8,8
	.align 8
.L_2il0floatpacket.9:
	.long	0x00000000,0x40140000
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,8
	.align 8
.L_2il0floatpacket.10:
	.long	0x00000000,0x401c0000
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,8
	.align 8
.L_2il0floatpacket.11:
	.long	0x00000000,0x40220000
	.type	.L_2il0floatpacket.11,@object
	.size	.L_2il0floatpacket.11,8
	.align 8
.L_2il0floatpacket.12:
	.long	0x00000000,0x40260000
	.type	.L_2il0floatpacket.12,@object
	.size	.L_2il0floatpacket.12,8
	.align 8
.L_2il0floatpacket.13:
	.long	0x00000000,0x402a0000
	.type	.L_2il0floatpacket.13,@object
	.size	.L_2il0floatpacket.13,8
	.align 8
.L_2il0floatpacket.14:
	.long	0x00000000,0x402e0000
	.type	.L_2il0floatpacket.14,@object
	.size	.L_2il0floatpacket.14,8
	.align 8
.L_2il0floatpacket.15:
	.long	0x00000000,0x40310000
	.type	.L_2il0floatpacket.15,@object
	.size	.L_2il0floatpacket.15,8
	.align 8
.L_2il0floatpacket.16:
	.long	0x00000000,0x40330000
	.type	.L_2il0floatpacket.16,@object
	.size	.L_2il0floatpacket.16,8
	.align 8
.L_2il0floatpacket.17:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.17,@object
	.size	.L_2il0floatpacket.17,8
	.align 8
.L_2il0floatpacket.62:
	.long	0x00000000,0x40000000
	.type	.L_2il0floatpacket.62,@object
	.size	.L_2il0floatpacket.62,8
	.align 8
.L_2il0floatpacket.63:
	.long	0x00000000,0x40400000
	.type	.L_2il0floatpacket.63,@object
	.size	.L_2il0floatpacket.63,8
	.align 8
.L_2il0floatpacket.64:
	.long	0x00000000,0x41cdcd65
	.type	.L_2il0floatpacket.64,@object
	.size	.L_2il0floatpacket.64,8
	.align 4
.L_2__STRING.0:
	.byte	112
	.byte	97
	.byte	114
	.byte	116
	.byte	105
	.byte	97
	.byte	108
	.byte	32
	.byte	115
	.byte	117
	.byte	109
	.byte	32
	.byte	61
	.byte	32
	.byte	0
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,15
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.byte	99
	.byte	121
	.byte	99
	.byte	108
	.byte	101
	.byte	115
	.byte	32
	.byte	112
	.byte	101
	.byte	114
	.byte	32
	.byte	116
	.byte	101
	.byte	114
	.byte	109
	.byte	32
	.byte	105
	.byte	110
	.byte	32
	.byte	115
	.byte	101
	.byte	114
	.byte	105
	.byte	101
	.byte	115
	.byte	32
	.byte	61
	.byte	32
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,29
	.space 3, 0x00 	# pad
	.align 4
.L_2il0floatpacket.65:
	.long	0x40000000
	.type	.L_2il0floatpacket.65,@object
	.size	.L_2il0floatpacket.65,4
	.align 4
.L_2il0floatpacket.66:
	.long	0x42000000
	.type	.L_2il0floatpacket.66,@object
	.size	.L_2il0floatpacket.66,4
	.section .ctors, "wa"
	.align 8
__init_0:
	.type	__init_0,@object
	.size	__init_0,8
	.quad	__sti__$E
	.data
	.hidden __dso_handle
# mark_proc_addr_taken __sti__$E;
# mark_proc_addr_taken _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_;
# mark_proc_addr_taken _ZNSt8ios_base4InitD1Ev;
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
	.4byte 0x0000002c
	.4byte 0x00000024
	.8byte ..___tag_value__Z7leibnizl.1
	.8byte ..___tag_value__Z7leibnizl.7-..___tag_value__Z7leibnizl.1
	.2byte 0x0400
	.4byte ..___tag_value__Z7leibnizl.3-..___tag_value__Z7leibnizl.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z7leibnizl.4-..___tag_value__Z7leibnizl.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z7leibnizl.6-..___tag_value__Z7leibnizl.4
	.byte 0xc6
	.4byte 0x0000002c
	.4byte 0x00000054
	.8byte ..___tag_value__Z8leibnizXl.8
	.8byte ..___tag_value__Z8leibnizXl.14-..___tag_value__Z8leibnizXl.8
	.2byte 0x0400
	.4byte ..___tag_value__Z8leibnizXl.10-..___tag_value__Z8leibnizXl.8
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z8leibnizXl.11-..___tag_value__Z8leibnizXl.10
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z8leibnizXl.13-..___tag_value__Z8leibnizXl.11
	.byte 0xc6
	.4byte 0x0000002c
	.4byte 0x00000084
	.8byte ..___tag_value__Z9leibnizXXl.15
	.8byte ..___tag_value__Z9leibnizXXl.21-..___tag_value__Z9leibnizXXl.15
	.2byte 0x0400
	.4byte ..___tag_value__Z9leibnizXXl.17-..___tag_value__Z9leibnizXXl.15
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value__Z9leibnizXXl.18-..___tag_value__Z9leibnizXXl.17
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value__Z9leibnizXXl.20-..___tag_value__Z9leibnizXXl.18
	.byte 0xc6
	.4byte 0x0000002c
	.4byte 0x000000b4
	.8byte ..___tag_value_main.22
	.8byte ..___tag_value_main.76-..___tag_value_main.22
	.2byte 0x0400
	.4byte ..___tag_value_main.24-..___tag_value_main.22
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_main.25-..___tag_value_main.24
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_main.75-..___tag_value_main.25
	.byte 0xc6
	.4byte 0x0000002c
	.4byte 0x000000e4
	.8byte ..___tag_value___sti__$E.77
	.8byte ..___tag_value___sti__$E.87-..___tag_value___sti__$E.77
	.2byte 0x0400
	.4byte ..___tag_value___sti__$E.79-..___tag_value___sti__$E.77
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value___sti__$E.80-..___tag_value___sti__$E.79
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value___sti__$E.86-..___tag_value___sti__$E.80
	.byte 0xc6
# End
