.align    16,0x90
.globl _Z3fmaPdS_S_
_Z3fmaPdS_S_:
# parameter 1: %rdi (a)
# parameter 2: %rsi (b)
# parameter 3: %rdx (c)
        vmovapd (%rdi), %zmm0
        vmovapd (%rsi), %zmm1
	vmovapd (%rdx), %zmm2
	
        vfmadd231pd %zmm1{badc}, %zmm0, %zmm2

        vmovapd %zmm2, (%rdx)
        ret       



	