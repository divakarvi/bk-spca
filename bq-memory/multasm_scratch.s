# -- Begin  _Z13multxmm4x1x4RPdS_S_lll
# mark_begin;
       .align    16,0x90
	.globl _Z13multxmm4x1x4RPdS_S_lll
_Z13multxmm4x1x4RPdS_S_lll:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
# parameter 6: %r9
..B2.1:                         # Preds ..B2.0
..___tag_value__Z13multxmm4x1x4RPdS_S_lll.4:                    #99.46
        movq      %r9, %r10                                     #103.3
        movaps    (%rdx), %xmm4                                 #101.0
        lea       (%r9,%r9,2), %rcx                             #104.3
        movaps    (%rdx,%r9,8), %xmm5                           #102.0
        xorl      %eax, %eax                                    #109.17
        shlq      $4, %r10                                      #103.3
        movaps    (%r10,%rdx), %xmm6                            #103.0
        movaps    (%rdx,%rcx,8), %xmm7                          #104.0
        movaps    16(%rdx), %xmm8                               #105.0
        movaps    16(%rdx,%r9,8), %xmm9                         #106.0
        movaps    16(%rdx,%r10), %xmm10                         #107.0
        movaps    16(%rdx,%rcx,8), %xmm11                       #108.0
        shlq      $4, %r8                                       #112.5
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15
..B2.2:                         # Preds ..B2.2 ..B2.1
        movaps    (%rsi), %xmm0                                 #111.0
        incq      %rax                                          #109.41
        movaps    (%r8,%rsi), %xmm1                             #112.0
        movaps    (%rdi), %xmm2                                 #114.0
        movaps    %xmm2, %xmm3                                  #115.0
        mulpd     %xmm0, %xmm2                                  #117.0
        addpd     %xmm2, %xmm4                                  #118.0
        mulpd     %xmm1, %xmm3                                  #119.0
        addpd     %xmm3, %xmm6                                  #120.0
        movaps    (%rdi), %xmm2                                 #122.0
        shufpd    $1, %xmm2, %xmm2                              #123.0
        movaps    %xmm2, %xmm3                                  #124.0
        mulpd     %xmm0, %xmm2                                  #126.0
        addpd     %xmm2, %xmm5                                  #127.0
        mulpd     %xmm1, %xmm3                                  #128.0
        addpd     %xmm3, %xmm7                                  #129.0
        movaps    16(%rdi), %xmm2                               #131.0
        movaps    %xmm2, %xmm3                                  #132.0
        mulpd     %xmm0, %xmm2                                  #134.0
        addpd     %xmm2, %xmm8                                  #135.0
        mulpd     %xmm1, %xmm3                                  #136.0
        addpd     %xmm3, %xmm10                                 #137.0
        movaps    16(%rdi), %xmm2                               #139.0
        shufpd    $1, %xmm2, %xmm2                              #140.0
        movaps    %xmm2, %xmm3                                  #141.0
        mulpd     %xmm0, %xmm2                                  #143.0
        addpd     %xmm2, %xmm9                                  #144.0
        mulpd     %xmm1, %xmm3                                  #145.0
        addpd     %xmm3, %xmm11                                 #146.0
        cmpq      $1000000000, %rax                             #109.25
        jl        ..B2.2        # Prob 100%                     #109.25
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
        movaps    %xmm4, (%rdx)                                 #149.0
        movaps    %xmm5, (%rdx,%r9,8)                           #150.0
        movaps    %xmm6, (%r10,%rdx)                            #151.0
        movaps    %xmm7, (%rdx,%rcx,8)                          #152.0
        movaps    %xmm8, 16(%rdx)                               #153.0
        movaps    %xmm9, 16(%rdx,%r9,8)                         #154.0
        movaps    %xmm10, 16(%rdx,%r10)                         #155.0
        movaps    %xmm11, 16(%rdx,%rcx,8)                       #156.0
        ret                                                     #157.1
        .align    16,0x90
..___tag_value__Z13multxmm4x1x4RPdS_S_lll.6:                    #
                                # LOE
# mark_end;
	.type	_Z13multxmm4x1x4RPdS_S_lll,@function
	.size	_Z13multxmm4x1x4RPdS_S_lll,.-_Z13multxmm4x1x4RPdS_S_lll
	.data
# -- End  _Z13multxmm4x1x4RPdS_S_lll
