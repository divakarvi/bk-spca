.align    16,0x90
.globl    _Z9asm8x12x8PdS_S_
_Z9asm8x12x8PdS_S_:
# parameter 1: %rdi (a)
# parameter 2: %rsi (b)
# parameter 3: %rdx (c)

	#1st outer product
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1

	vmovapd (%rdx), %zmm2
        vfmadd231pd %zmm1, %zmm0, %zmm2

	vmovapd 64(%rdx), %zmm3
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3

	vmovapd 128(%rdx), %zmm4
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4

	vmovapd 192(%rdx), %zmm5
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5

	vpermf32x4 $78, %zmm1, %zmm1

	vmovapd 256(%rdx), %zmm6
        vfmadd231pd %zmm1, %zmm0, %zmm6

	vmovapd 320(%rdx), %zmm7
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7

	vmovapd 384(%rdx), %zmm8
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8

	vmovapd 448(%rdx), %zmm9
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#2nd outer product
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#3rd outer product
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#4th outer product	
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#5th outer product	
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#6th outer product	
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#7th outer product	
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#8th outer product	
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#9th outer product	
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#10th outer product	
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#11th outer product	
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	#12th outer product	
	addq $64, %rdi
	addq $64, %rsi
	vmovapd (%rdi), %zmm0	
        vmovapd (%rsi), %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm2	
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm3
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm4
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm5
	vpermf32x4 $78, %zmm1, %zmm1
	vfmadd231pd %zmm1, %zmm0, %zmm6
	vfmadd231pd %zmm1{cdab}, %zmm0, %zmm7
	vfmadd231pd %zmm1{badc}, %zmm0, %zmm8
	vmovapd %zmm1{badc}, %zmm1
        vfmadd231pd %zmm1{cdab}, %zmm0, %zmm9

	
	
	vmovapd %zmm2, (%rdx)
	vmovapd %zmm3, 64(%rdx)
	vmovapd %zmm4, 128(%rdx)
	vmovapd %zmm5, 192(%rdx)
	vmovapd %zmm6, 256(%rdx)
	vmovapd %zmm7, 320(%rdx)
	vmovapd %zmm8, 384(%rdx)
	vmovapd %zmm9, 448(%rdx)	

	ret
	
