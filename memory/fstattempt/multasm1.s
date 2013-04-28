	.text
# -- Begin  _Z13multxmm2x4x4BPdS_S_lll
# mark_begin;
       .align    16,0x90
	.globl multasm1
multasm1:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
# parameter 6: %r9
..B2.1:                         # Preds ..B2.0
..___tag_value__Z13multxmm2x4x4BPdS_S_lll.8:                    #180.46
        movq      %r9, %r10                                     #230.3
        pxor      %xmm0, %xmm0                                  #181.0
        movq      %rcx, %rsi                                    #266.3
        pxor      %xmm1, %xmm1                                  #182.0
        xorl      %r11d, %r11d                                  #197.17
        pxor      %xmm2, %xmm2                                  #183.0
        lea       (%r9,%r9,2), %r8                              #231.3
        pxor      %xmm3, %xmm3                                  #184.0
        lea       (%rcx,%rcx,2), %rax                           #292.3
        pxor      %xmm4, %xmm4                                  #185.0
        pxor      %xmm5, %xmm5                                  #186.0
        pxor      %xmm6, %xmm6                                  #187.0
        pxor      %xmm7, %xmm7                                  #188.0
        pxor      %xmm8, %xmm8                                  #189.0
        pxor      %xmm9, %xmm9                                  #190.0
        pxor      %xmm10, %xmm10                                #191.0
        pxor      %xmm11, %xmm11                                #192.0
        pxor      %xmm12, %xmm12                                #193.0
        pxor      %xmm13, %xmm13                                #194.0
        pxor      %xmm14, %xmm14                                #195.0
        pxor      %xmm15, %xmm15                                #196.0
        shlq      $4, %r10                                      #230.3
        shlq      $4, %rsi                                      #266.3
	shlq      $3, %r8
	shlq 	  $3, %r9
	shlq      $3, %rcx
	shlq      $3, %rax
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
..B2.2:                         # Preds ..B2.2 ..B2.1
        movaps    (%rdx), %xmm8                                 #207.0
        incq      %r11                                          #197.46
        movaps    (%rdx,%r9), %xmm9                           #208.0
        movaps    (%rdi), %xmm12                                #211.0
        movaps    (%rdi), %xmm13                                #212.0
        shufpd    $1, %xmm13, %xmm13                            #213.0
        movaps    %xmm12, %xmm14                                #214.0
        movaps    %xmm13, %xmm15                                #215.0
        mulpd     %xmm0, %xmm12                                 #217.0
        addpd     %xmm12, %xmm8                                 #218.0
        mulpd     %xmm0, %xmm13                                 #220.0
        addpd     %xmm13, %xmm9                                 #221.0
        movaps    (%r10,%rdx), %xmm10                           #230.0
        movaps    (%rdx,%r8), %xmm11                          #231.0
        mulpd     %xmm1, %xmm14                                 #233.0
        addpd     %xmm14, %xmm10                                #234.0
        mulpd     %xmm1, %xmm15                                 #236.0
        addpd     %xmm15, %xmm11                                #237.0
        movaps    (%rdi,%rcx), %xmm13                         #240.0
        movaps    (%rdi,%rcx), %xmm12                         #241.0
        shufpd    $1, %xmm13, %xmm13                            #242.0
        movaps    %xmm13, %xmm15                                #243.0
        movaps    %xmm12, %xmm14                                #244.0
        mulpd     %xmm2, %xmm12                                 #246.0
        addpd     %xmm12, %xmm8                                 #247.0
        mulpd     %xmm2, %xmm13                                 #249.0
        addpd     %xmm13, %xmm9                                 #250.0
        mulpd     %xmm3, %xmm14                                 #252.0
        addpd     %xmm14, %xmm10                                #253.0
        mulpd     %xmm3, %xmm15                                 #255.0
        addpd     %xmm15, %xmm11                                #256.0
        movaps    (%rsi,%rdi), %xmm13                           #266.0
        movaps    (%rsi,%rdi), %xmm12                           #267.0
        shufpd    $1, %xmm13, %xmm13                            #268.0
        movaps    %xmm13, %xmm15                                #269.0
        movaps    %xmm12, %xmm14                                #270.0
        mulpd     %xmm4, %xmm12                                 #272.0
        addpd     %xmm12, %xmm8                                 #273.0
        mulpd     %xmm4, %xmm13                                 #275.0
        addpd     %xmm13, %xmm9                                 #276.0
        mulpd     %xmm5, %xmm14                                 #284.0
        addpd     %xmm14, %xmm10                                #285.0
        mulpd     %xmm5, %xmm15                                 #287.0
        addpd     %xmm15, %xmm11                                #288.0
        movaps    (%rdi,%rax), %xmm13                         #292.0
        movaps    (%rdi,%rax), %xmm12                         #293.0
        shufpd    $1, %xmm13, %xmm13                            #294.0
        movaps    %xmm13, %xmm15                                #295.0
        movaps    %xmm12, %xmm14                                #296.0
        mulpd     %xmm6, %xmm12                                 #298.0
        addpd     %xmm12, %xmm8                                 #299.0
        mulpd     %xmm6, %xmm13                                 #301.0
        addpd     %xmm13, %xmm9                                 #302.0
        mulpd     %xmm7, %xmm14                                 #305.0
        addpd     %xmm14, %xmm10                                #306.0
        mulpd     %xmm7, %xmm15                                 #308.0
        addpd     %xmm15, %xmm11                                #309.0
        cmpq      $1000000000, %r11                             #197.25
        jl        ..B2.2        # Prob 100%                     #197.25
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
        ret                                                     #319.1
        .align    16,0x90
..___tag_value__Z13multxmm2x4x4BPdS_S_lll.10:                   #
                                # LOE
# mark_end;
	.type	multasm1,@function
	.size	_Z13multxmm2x4x4BPdS_S_lll,.-_Z13multxmm2x4x4BPdS_S_lll
	.data
# -- End  _Z13multxmm2x4x4BPdS_S_lll
