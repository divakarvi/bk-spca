all: capability.exe leibniz.exe add.exe copy.exe
mmult.exe: mmult.cu
	nvcc --ptxas-options=-v  -arch=sm_20 mmult.cu -o mmult.exe
collatz.exe: collatz.cu
	nvcc --ptxas-options=-v -Xptxas -dlcm=cg -arch=sm_20 collatz.cu -o collatz.exe
dcopy.exe: dcopy.cu
	nvcc --ptxas-options=-v -arch=sm_20 dcopy.cu -o dcopy.exe
copy.exe: copy.cu
	nvcc --ptxas-options=-v -arch=sm_20  -DNUMTHREADS=384 copy.cu -o copy.exe
add.exe: add.cu
	nvcc --ptxas-options=-v -arch=sm_20  -DNUMTHREADS=384 add.cu -o add.exe
leibniz.exe: leibniz.cu
	nvcc --ptxas-options=-v -arch=sm_20  leibniz.cu -o leibniz.exe
capability.exe: capability.cu 
	nvcc --ptxas-options=-v -arch=sm_20  capability.cu -o capability.exe
clean:
	rm *.exe
cleanx:
	rm pbs*
