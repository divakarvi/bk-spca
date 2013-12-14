.align    16,0x90
.globl    _Z8asm8x1x8PdS_S_
_Z8asm8x1x8PdS_S_:
# parameter 1: %rdi (a)
# parameter 2: %rsi (b)
# parameter 3: %rdx (c)
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

	vmovapd %zmm2, (%rdx)
	vmovapd %zmm3, 64(%rdx)
	vmovapd %zmm4, 128(%rdx)
	vmovapd %zmm5, 192(%rdx)
	vmovapd %zmm6, 256(%rdx)
	vmovapd %zmm7, 320(%rdx)
	vmovapd %zmm8, 384(%rdx)
	vmovapd %zmm9, 448(%rdx)	

	ret
	