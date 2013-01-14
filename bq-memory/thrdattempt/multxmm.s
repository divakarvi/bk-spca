# mark_description "Intel(R) C++ Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 12.1 Build 20111011";
# mark_description "-I/usr/caen/intel-12.1/mkl/include -O3 -prec-div -no-ftz -DNDEBUG -fno-inline-functions -restrict -S";
	.file "multxmm.cpp"
	.text
..TXTST0:
# -- Begin  _Z12multxmm4x1x4PdS_S_lll
# mark_begin;
       .align    16,0x90
	.globl _Z12multxmm4x1x4PdS_S_lll
_Z12multxmm4x1x4PdS_S_lll:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
# parameter 6: %r9
..B1.1:                         # Preds ..B1.0
..___tag_value__Z12multxmm4x1x4PdS_S_lll.1:                     #37.47
        movq      %r9, %rax                                     #41.3
        movaps    (%rdx), %xmm4                                 #39.0
        lea       (%r9,%r9,2), %r10                             #42.3
        movaps    (%rdx,%r9,8), %xmm5                           #40.0
        shlq      $4, %rax                                      #41.3
        movaps    (%rax,%rdx), %xmm6                            #41.0
        movaps    (%rdx,%r10,8), %xmm7                          #42.0
        movaps    16(%rdx), %xmm8                               #43.0
        movaps    16(%rdx,%r9,8), %xmm9                         #44.0
        movaps    16(%rdx,%rax), %xmm10                         #45.0
        movaps    16(%rdx,%r10,8), %xmm11                       #46.0
        movaps    (%rdi), %xmm2                                 #49.0
        movaps    (%rsi), %xmm0                                 #50.0
        mulpd     %xmm0, %xmm2                                  #51.0
        movaps    16(%rdi), %xmm3                               #52.0
        movaps    %xmm3, %xmm12                                 #53.0
        mulpd     %xmm0, %xmm3                                  #54.0
        addpd     %xmm2, %xmm4                                  #55.0
        addpd     %xmm3, %xmm8                                  #56.0
        movaps    16(%rsi), %xmm1                               #57.0
        mulpd     %xmm1, %xmm12                                 #58.0
        movaps    (%rdi), %xmm2                                 #59.0
        mulpd     %xmm1, %xmm2                                  #60.0
        addpd     %xmm2, %xmm6                                  #61.0
        addpd     %xmm12, %xmm10                                #62.0
        movaps    (%rdi), %xmm3                                 #64.0
        shufpd    $1, %xmm3, %xmm3                              #65.0
        movaps    %xmm3, %xmm2                                  #66.0
        mulpd     %xmm1, %xmm3                                  #67.0
        mulpd     %xmm0, %xmm2                                  #68.0
        addpd     %xmm3, %xmm7                                  #69.0
        addpd     %xmm2, %xmm5                                  #70.0
        movaps    16(%rdi), %xmm2                               #72.0
        shufpd    $1, %xmm2, %xmm2                              #73.0
        movaps    %xmm2, %xmm3                                  #74.0
        mulpd     %xmm0, %xmm2                                  #75.0
        mulpd     %xmm1, %xmm3                                  #76.0
        addpd     %xmm2, %xmm9                                  #77.0
        addpd     %xmm3, %xmm11                                 #78.0
        movaps    %xmm4, (%rdx)                                 #81.0
        movaps    %xmm5, (%rdx,%r9,8)                           #82.0
        movaps    %xmm6, (%rax,%rdx)                            #83.0
        movaps    %xmm7, (%rdx,%r10,8)                          #84.0
        movaps    %xmm8, 16(%rdx)                               #85.0
        movaps    %xmm9, 16(%rdx,%r9,8)                         #86.0
        movaps    %xmm10, 16(%rdx,%rax)                         #87.0
        movaps    %xmm11, 16(%rdx,%r10,8)                       #88.0
        ret                                                     #89.1
        .align    16,0x90
..___tag_value__Z12multxmm4x1x4PdS_S_lll.3:                     #
                                # LOE
# mark_end;
	.type	_Z12multxmm4x1x4PdS_S_lll,@function
	.size	_Z12multxmm4x1x4PdS_S_lll,.-_Z12multxmm4x1x4PdS_S_lll
	.data
# -- End  _Z12multxmm4x1x4PdS_S_lll
	.text
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
..___tag_value__Z13multxmm4x1x4RPdS_S_lll.4:                    #93.46
	pushq     $rbx
        movq      %r9, %r8                                      #97.3
        movaps    (%rdx), %xmm4                                 #95.0
        lea       (%r9,%r9,2), %rcx                             #98.3
        movaps    (%rdx,%r9,8), %xmm5                           #96.0
        xorl      %eax, %eax                                    #103.17
        shlq      $4, %r8                                       #97.3
        movaps    (%r8,%rdx), %xmm6                             #97.0
        movaps    (%rdx,%rcx,8), %xmm7                          #98.0
        movaps    16(%rdx), %xmm8                               #99.0
        movaps    16(%rdx,%r9,8), %xmm9                         #100.0
        movaps    16(%rdx,%r8), %xmm10                          #101.0
        movaps    16(%rdx,%rcx,8), %xmm11                       #102.0
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B2.2:                         # Preds ..B2.2 ..B2.1
        movaps    (%rdi), %xmm2                                 #104.0
        incq      %rax                                          #103.41
        movaps    (%rsi), %xmm0                                 #105.0
        mulpd     %xmm0, %xmm2                                  #106.0
        movaps    16(%rdi), %xmm3                               #107.0
        movaps    %xmm3, %xmm12                                 #108.0
        mulpd     %xmm0, %xmm3                                  #109.0
        addpd     %xmm2, %xmm4                                  #110.0
        addpd     %xmm3, %xmm8                                  #111.0
        movaps    16(%rsi), %xmm1                               #112.0
        mulpd     %xmm1, %xmm12                                 #113.0
        movaps    (%rdi), %xmm2                                 #114.0
        mulpd     %xmm1, %xmm2                                  #115.0
        addpd     %xmm2, %xmm6                                  #116.0
        addpd     %xmm12, %xmm10                                #117.0
        movaps    (%rdi), %xmm3                                 #118.0
        shufpd    $1, %xmm3, %xmm3                              #119.0
        movaps    %xmm3, %xmm2                                  #120.0
        mulpd     %xmm1, %xmm3                                  #121.0
        mulpd     %xmm0, %xmm2                                  #122.0
        addpd     %xmm3, %xmm7                                  #123.0
        addpd     %xmm2, %xmm5                                  #124.0
        movaps    16(%rdi), %xmm2                               #125.0
        shufpd    $1, %xmm2, %xmm2                              #126.0
        movaps    %xmm2, %xmm3                                  #127.0
        mulpd     %xmm0, %xmm2                                  #128.0
        mulpd     %xmm1, %xmm3                                  #129.0
        addpd     %xmm2, %xmm9                                  #130.0
        addpd     %xmm3, %xmm11                                 #131.0
        cmpq      $1000000000, %rax                             #103.25
        jl        ..B2.2        # Prob 100%                     #103.25
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
        movaps    %xmm4, (%rdx)                                 #134.0
        movaps    %xmm5, (%rdx,%r9,8)                           #135.0
        movaps    %xmm6, (%r8,%rdx)                             #136.0
        movaps    %xmm7, (%rdx,%rcx,8)                          #137.0
        movaps    %xmm8, 16(%rdx)                               #138.0
        movaps    %xmm9, 16(%rdx,%r9,8)                         #139.0
        movaps    %xmm10, 16(%rdx,%r8)                          #140.0
        movaps    %xmm11, 16(%rdx,%rcx,8)                       #141.0
	.align    64, 0x90
	addq 	  $32, %rsi
	addq      $32, %rax
	addq      $32, %rdx
	addq      $32, %rbx
	addq      $32, %rcx
	addq      $32, %r8
	addq      $32, %r9
	addq      $32, %r10
	addq      $32, %r11
	addq      $32, %r12
	addq      $32, %r13
	addq      $32, %r14
	addq      $32, %r15	
	addq      %rbx, %rdi
	addq      %r8,  %rdi
	addq      %r9,  %rdi
	addq      %r10,  %rdi
	addq      %r9,  %rdi
	addq      %r10,  %rdi
	addq      %r11,  %rdi
	addq      %r12,  %rdi
	addq      %r13,  %rdi	
	popq      %rbx
        ret                                                     #142.1
        .align    16,0x90
..___tag_value__Z13multxmm4x1x4RPdS_S_lll.6:                    #
                                # LOE
# mark_end;
	.type	_Z13multxmm4x1x4RPdS_S_lll,@function
	.size	_Z13multxmm4x1x4RPdS_S_lll,.-_Z13multxmm4x1x4RPdS_S_lll
	.data
# -- End  _Z13multxmm4x1x4RPdS_S_lll
	.text
# -- Begin  _Z15multxmm4x1x4RU2PdS_S_iii
# mark_begin;
       .align    16,0x90
	.globl _Z15multxmm4x1x4RU2PdS_S_iii
_Z15multxmm4x1x4RU2PdS_S_iii:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %ecx
# parameter 5: %r8d
# parameter 6: %r9d
..B3.1:                         # Preds ..B3.0
..___tag_value__Z15multxmm4x1x4RU2PdS_S_iii.7:                  #146.34
        lea       (%r9,%r9), %r8d                               #149.3
        movaps    (%rdx), %xmm0                                 #148.0
        xorl      %eax, %eax                                    #156.17
        movslq    %r8d, %r8                                     #149.3
        movslq    %r9d, %r9                                     #150.3
        movaps    (%rdx,%r8,8), %xmm2                           #149.0
        lea       (%r9,%r9,2), %ecx                             #151.3
        movaps    (%rdx,%r9,8), %xmm1                           #150.0
        movslq    %ecx, %rcx                                    #151.3
        movaps    (%rdx,%rcx,8), %xmm3                          #151.0
        movaps    16(%rdx), %xmm4                               #152.0
        movaps    16(%rdx,%r8,8), %xmm6                         #153.0
        movaps    16(%rdx,%r9,8), %xmm5                         #154.0
        movaps    16(%rdx,%rcx,8), %xmm7                        #155.0
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B3.2:                         # Preds ..B3.2 ..B3.1
        movaps    (%rdi), %xmm2                                 #158.0
        incq      %rax                                          #156.43
        movaps    (%rsi), %xmm0                                 #159.0
        mulpd     %xmm0, %xmm2                                  #160.0
        movaps    16(%rdi), %xmm3                               #161.0
        movaps    %xmm3, %xmm12                                 #162.0
        mulpd     %xmm0, %xmm3                                  #163.0
        addpd     %xmm2, %xmm4                                  #164.0
        addpd     %xmm3, %xmm8                                  #165.0
        movaps    16(%rsi), %xmm1                               #166.0
        mulpd     %xmm1, %xmm12                                 #167.0
        movaps    (%rdi), %xmm2                                 #168.0
        mulpd     %xmm1, %xmm2                                  #169.0
        addpd     %xmm2, %xmm6                                  #170.0
        addpd     %xmm12, %xmm10                                #171.0
        movaps    (%rdi), %xmm3                                 #172.0
        shufpd    $1, %xmm3, %xmm3                              #173.0
        movaps    %xmm3, %xmm2                                  #174.0
        mulpd     %xmm1, %xmm3                                  #175.0
        mulpd     %xmm0, %xmm2                                  #176.0
        addpd     %xmm3, %xmm7                                  #177.0
        addpd     %xmm2, %xmm5                                  #178.0
        movaps    16(%rdi), %xmm2                               #179.0
        shufpd    $1, %xmm2, %xmm2                              #180.0
        movaps    %xmm2, %xmm3                                  #181.0
        mulpd     %xmm0, %xmm2                                  #182.0
        mulpd     %xmm1, %xmm3                                  #183.0
        addpd     %xmm2, %xmm9                                  #184.0
        addpd     %xmm3, %xmm11                                 #185.0
        movaps    (%rdi), %xmm2                                 #187.0
        movaps    (%rsi), %xmm0                                 #188.0
        mulpd     %xmm0, %xmm2                                  #189.0
        movaps    16(%rdi), %xmm3                               #190.0
        movaps    %xmm3, %xmm12                                 #191.0
        mulpd     %xmm0, %xmm3                                  #192.0
        addpd     %xmm2, %xmm4                                  #193.0
        addpd     %xmm3, %xmm8                                  #194.0
        movaps    16(%rsi), %xmm1                               #195.0
        mulpd     %xmm1, %xmm12                                 #196.0
        movaps    (%rdi), %xmm2                                 #197.0
        mulpd     %xmm1, %xmm2                                  #198.0
        addpd     %xmm2, %xmm6                                  #199.0
        addpd     %xmm12, %xmm10                                #200.0
        movaps    (%rdi), %xmm3                                 #201.0
        shufpd    $1, %xmm3, %xmm3                              #202.0
        movaps    %xmm3, %xmm2                                  #203.0
        mulpd     %xmm1, %xmm3                                  #204.0
        mulpd     %xmm0, %xmm2                                  #205.0
        addpd     %xmm3, %xmm7                                  #206.0
        addpd     %xmm2, %xmm5                                  #207.0
        movaps    16(%rdi), %xmm2                               #208.0
        shufpd    $1, %xmm2, %xmm2                              #209.0
        movaps    %xmm2, %xmm3                                  #210.0
        mulpd     %xmm0, %xmm2                                  #211.0
        mulpd     %xmm1, %xmm3                                  #212.0
        addpd     %xmm2, %xmm9                                  #213.0
        addpd     %xmm3, %xmm11                                 #214.0
        cmpq      $500000000, %rax                              #156.25
        jl        ..B3.2        # Prob 100%                     #156.25
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B3.3:                         # Preds ..B3.2
        movaps    %xmm4, (%rdx)                                 #218.0
        movaps    %xmm5, (%rdx,%r9,8)                           #219.0
        movaps    %xmm6, (%rdx,%r8,8)                           #220.0
        movaps    %xmm7, (%rdx,%rcx,8)                          #221.0
        movaps    %xmm8, 16(%rdx)                               #222.0
        movaps    %xmm9, 16(%rdx,%r9,8)                         #223.0
        movaps    %xmm10, 16(%rdx,%r8,8)                        #224.0
        movaps    %xmm11, 16(%rdx,%rcx,8)                       #225.0
        ret                                                     #226.1
        .align    16,0x90
..___tag_value__Z15multxmm4x1x4RU2PdS_S_iii.9:                  #
                                # LOE
# mark_end;
	.type	_Z15multxmm4x1x4RU2PdS_S_iii,@function
	.size	_Z15multxmm4x1x4RU2PdS_S_iii,.-_Z15multxmm4x1x4RU2PdS_S_iii
	.data
# -- End  _Z15multxmm4x1x4RU2PdS_S_iii
	.text
# -- Begin  _Z15multxmm4x1x4RU5PdS_S_lll
# mark_begin;
       .align    16,0x90
	.globl _Z15multxmm4x1x4RU5PdS_S_lll
_Z15multxmm4x1x4RU5PdS_S_lll:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
# parameter 6: %r9
..B4.1:                         # Preds ..B4.0
..___tag_value__Z15multxmm4x1x4RU5PdS_S_lll.10:                 #230.46
        movq      %r9, %r8                                      #233.3
        movaps    (%rdx), %xmm0                                 #232.0
        lea       (%r9,%r9,2), %rcx                             #235.3
        shlq      $4, %r8                                       #233.3
        xorl      %eax, %eax                                    #240.17
        movaps    (%r8,%rdx), %xmm2                             #233.0
        movaps    (%rdx,%r9,8), %xmm1                           #234.0
        movaps    (%rdx,%rcx,8), %xmm3                          #235.0
        movaps    16(%rdx), %xmm4                               #236.0
        movaps    16(%rdx,%r8), %xmm6                           #237.0
        movaps    16(%rdx,%r9,8), %xmm5                         #238.0
        movaps    16(%rdx,%rcx,8), %xmm7                        #239.0
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B4.2:                         # Preds ..B4.2 ..B4.1
        movaps    (%rdi), %xmm2                                 #242.0
        incq      %rax                                          #240.43
        movaps    (%rsi), %xmm0                                 #243.0
        mulpd     %xmm0, %xmm2                                  #244.0
        movaps    16(%rdi), %xmm3                               #245.0
        movaps    %xmm3, %xmm12                                 #246.0
        mulpd     %xmm0, %xmm3                                  #247.0
        addpd     %xmm2, %xmm4                                  #248.0
        addpd     %xmm3, %xmm8                                  #249.0
        movaps    16(%rsi), %xmm1                               #250.0
        mulpd     %xmm1, %xmm12                                 #251.0
        movaps    (%rdi), %xmm2                                 #252.0
        mulpd     %xmm1, %xmm2                                  #253.0
        addpd     %xmm2, %xmm6                                  #254.0
        addpd     %xmm12, %xmm10                                #255.0
        movaps    (%rdi), %xmm3                                 #256.0
        shufpd    $1, %xmm3, %xmm3                              #257.0
        movaps    %xmm3, %xmm2                                  #258.0
        mulpd     %xmm1, %xmm3                                  #259.0
        mulpd     %xmm0, %xmm2                                  #260.0
        addpd     %xmm3, %xmm7                                  #261.0
        addpd     %xmm2, %xmm5                                  #262.0
        movaps    16(%rdi), %xmm2                               #263.0
        shufpd    $1, %xmm2, %xmm2                              #264.0
        movaps    %xmm2, %xmm3                                  #265.0
        mulpd     %xmm0, %xmm2                                  #266.0
        mulpd     %xmm1, %xmm3                                  #267.0
        addpd     %xmm2, %xmm9                                  #268.0
        addpd     %xmm3, %xmm11                                 #269.0
        movaps    (%rdi), %xmm2                                 #271.0
        movaps    (%rsi), %xmm0                                 #272.0
        mulpd     %xmm0, %xmm2                                  #273.0
        movaps    16(%rdi), %xmm3                               #274.0
        movaps    %xmm3, %xmm12                                 #275.0
        mulpd     %xmm0, %xmm3                                  #276.0
        addpd     %xmm2, %xmm4                                  #277.0
        addpd     %xmm3, %xmm8                                  #278.0
        movaps    16(%rsi), %xmm1                               #279.0
        mulpd     %xmm1, %xmm12                                 #280.0
        movaps    (%rdi), %xmm2                                 #281.0
        mulpd     %xmm1, %xmm2                                  #282.0
        addpd     %xmm2, %xmm6                                  #283.0
        addpd     %xmm12, %xmm10                                #284.0
        movaps    (%rdi), %xmm3                                 #285.0
        shufpd    $1, %xmm3, %xmm3                              #286.0
        movaps    %xmm3, %xmm2                                  #287.0
        mulpd     %xmm1, %xmm3                                  #288.0
        mulpd     %xmm0, %xmm2                                  #289.0
        addpd     %xmm3, %xmm7                                  #290.0
        addpd     %xmm2, %xmm5                                  #291.0
        movaps    16(%rdi), %xmm2                               #292.0
        shufpd    $1, %xmm2, %xmm2                              #293.0
        movaps    %xmm2, %xmm3                                  #294.0
        mulpd     %xmm0, %xmm2                                  #295.0
        mulpd     %xmm1, %xmm3                                  #296.0
        addpd     %xmm2, %xmm9                                  #297.0
        addpd     %xmm3, %xmm11                                 #298.0
        movaps    (%rdi), %xmm2                                 #300.0
        movaps    (%rsi), %xmm0                                 #301.0
        mulpd     %xmm0, %xmm2                                  #302.0
        movaps    16(%rdi), %xmm3                               #303.0
        movaps    %xmm3, %xmm12                                 #304.0
        mulpd     %xmm0, %xmm3                                  #305.0
        addpd     %xmm2, %xmm4                                  #306.0
        addpd     %xmm3, %xmm8                                  #307.0
        movaps    16(%rsi), %xmm1                               #308.0
        mulpd     %xmm1, %xmm12                                 #309.0
        .byte     72                                            #310.0
        .byte     141                                           #310.0
        .byte     118                                           #310.0
        .byte     0                                             #310.0
        movaps    (%rdi), %xmm2                                 #310.0
        mulpd     %xmm1, %xmm2                                  #311.0
        addpd     %xmm2, %xmm6                                  #312.0
        addpd     %xmm12, %xmm10                                #313.0
        movaps    (%rdi), %xmm3                                 #314.0
        shufpd    $1, %xmm3, %xmm3                              #315.0
        movaps    %xmm3, %xmm2                                  #316.0
        mulpd     %xmm1, %xmm3                                  #317.0
        mulpd     %xmm0, %xmm2                                  #318.0
        addpd     %xmm3, %xmm7                                  #319.0
        addpd     %xmm2, %xmm5                                  #320.0
        movaps    16(%rdi), %xmm2                               #321.0
        shufpd    $1, %xmm2, %xmm2                              #322.0
        movaps    %xmm2, %xmm3                                  #323.0
        mulpd     %xmm0, %xmm2                                  #324.0
        mulpd     %xmm1, %xmm3                                  #325.0
        addpd     %xmm2, %xmm9                                  #326.0
        addpd     %xmm3, %xmm11                                 #327.0
        movaps    (%rdi), %xmm2                                 #329.0
        movaps    (%rsi), %xmm0                                 #330.0
        mulpd     %xmm0, %xmm2                                  #331.0
        movaps    16(%rdi), %xmm3                               #332.0
        movaps    %xmm3, %xmm12                                 #333.0
        mulpd     %xmm0, %xmm3                                  #334.0
        addpd     %xmm2, %xmm4                                  #335.0
        addpd     %xmm3, %xmm8                                  #336.0
        movaps    16(%rsi), %xmm1                               #337.0
        mulpd     %xmm1, %xmm12                                 #338.0
        movaps    (%rdi), %xmm2                                 #339.0
        mulpd     %xmm1, %xmm2                                  #340.0
        addpd     %xmm2, %xmm6                                  #341.0
        addpd     %xmm12, %xmm10                                #342.0
        movaps    (%rdi), %xmm3                                 #343.0
        shufpd    $1, %xmm3, %xmm3                              #344.0
        movaps    %xmm3, %xmm2                                  #345.0
        mulpd     %xmm1, %xmm3                                  #346.0
        mulpd     %xmm0, %xmm2                                  #347.0
        addpd     %xmm3, %xmm7                                  #348.0
        addpd     %xmm2, %xmm5                                  #349.0
        movaps    16(%rdi), %xmm2                               #350.0
        shufpd    $1, %xmm2, %xmm2                              #351.0
        movaps    %xmm2, %xmm3                                  #352.0
        mulpd     %xmm0, %xmm2                                  #353.0
        mulpd     %xmm1, %xmm3                                  #354.0
        addpd     %xmm2, %xmm9                                  #355.0
        addpd     %xmm3, %xmm11                                 #356.0
        movaps    (%rdi), %xmm2                                 #358.0
        movaps    (%rsi), %xmm0                                 #359.0
        mulpd     %xmm0, %xmm2                                  #360.0
        movaps    16(%rdi), %xmm3                               #361.0
        movaps    %xmm3, %xmm12                                 #362.0
        mulpd     %xmm0, %xmm3                                  #363.0
        addpd     %xmm2, %xmm4                                  #364.0
        addpd     %xmm3, %xmm8                                  #365.0
        movaps    16(%rsi), %xmm1                               #366.0
        mulpd     %xmm1, %xmm12                                 #367.0
        movaps    (%rdi), %xmm2                                 #368.0
        mulpd     %xmm1, %xmm2                                  #369.0
        addpd     %xmm2, %xmm6                                  #370.0
        addpd     %xmm12, %xmm10                                #371.0
        movaps    (%rdi), %xmm3                                 #372.0
        shufpd    $1, %xmm3, %xmm3                              #373.0
        movaps    %xmm3, %xmm2                                  #374.0
        mulpd     %xmm1, %xmm3                                  #375.0
        mulpd     %xmm0, %xmm2                                  #376.0
        addpd     %xmm3, %xmm7                                  #377.0
        addpd     %xmm2, %xmm5                                  #378.0
        movaps    16(%rdi), %xmm2                               #379.0
        shufpd    $1, %xmm2, %xmm2                              #380.0
        movaps    %xmm2, %xmm3                                  #381.0
        mulpd     %xmm0, %xmm2                                  #382.0
        mulpd     %xmm1, %xmm3                                  #383.0
        addpd     %xmm2, %xmm9                                  #384.0
        addpd     %xmm3, %xmm11                                 #385.0
        cmpq      $200000000, %rax                              #240.25
        jl        ..B4.2        # Prob 100%                     #240.25
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r9 r12 r13 r14 r15
..B4.3:                         # Preds ..B4.2
        movaps    %xmm4, (%rdx)                                 #389.0
        movaps    %xmm5, (%rdx,%r9,8)                           #390.0
        movaps    %xmm6, (%r8,%rdx)                             #391.0
        movaps    %xmm7, (%rdx,%rcx,8)                          #392.0
        movaps    %xmm8, 16(%rdx)                               #393.0
        movaps    %xmm9, 16(%rdx,%r9,8)                         #394.0
        movaps    %xmm10, 16(%rdx,%r8)                          #395.0
        movaps    %xmm11, 16(%rdx,%rcx,8)                       #396.0
        ret                                                     #397.1
        .align    16,0x90
..___tag_value__Z15multxmm4x1x4RU5PdS_S_lll.12:                 #
                                # LOE
# mark_end;
	.type	_Z15multxmm4x1x4RU5PdS_S_lll,@function
	.size	_Z15multxmm4x1x4RU5PdS_S_lll,.-_Z15multxmm4x1x4RU5PdS_S_lll
	.data
# -- End  _Z15multxmm4x1x4RU5PdS_S_lll
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
	.8byte ..___tag_value__Z12multxmm4x1x4PdS_S_lll.1
	.8byte ..___tag_value__Z12multxmm4x1x4PdS_S_lll.3-..___tag_value__Z12multxmm4x1x4PdS_S_lll.1
	.8byte 0x0000000000000000
	.4byte 0x0000001c
	.4byte 0x00000044
	.8byte ..___tag_value__Z13multxmm4x1x4RPdS_S_lll.4
	.8byte ..___tag_value__Z13multxmm4x1x4RPdS_S_lll.6-..___tag_value__Z13multxmm4x1x4RPdS_S_lll.4
	.8byte 0x0000000000000000
	.4byte 0x0000001c
	.4byte 0x00000064
	.8byte ..___tag_value__Z15multxmm4x1x4RU2PdS_S_iii.7
	.8byte ..___tag_value__Z15multxmm4x1x4RU2PdS_S_iii.9-..___tag_value__Z15multxmm4x1x4RU2PdS_S_iii.7
	.8byte 0x0000000000000000
	.4byte 0x0000001c
	.4byte 0x00000084
	.8byte ..___tag_value__Z15multxmm4x1x4RU5PdS_S_lll.10
	.8byte ..___tag_value__Z15multxmm4x1x4RU5PdS_S_lll.12-..___tag_value__Z15multxmm4x1x4RU5PdS_S_lll.10
	.8byte 0x0000000000000000
# End
