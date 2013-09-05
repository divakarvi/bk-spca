include ../makevars.mk

##################
.PHONY: ../utils ../linking-aitken  ../linking-fft ld_lib_path
MODS := ../utils ../linking-aitken ../linking-fft
$(MODS):
	make --directory=$@ all
ld_lib_path: 
	echo $$PWD


##################
libxmath.so: ../linking-aitken ../linking-linalg ../linking-fft
	icpc -shared -o $@ ../utils/utils.o			\
			   ../linking-aitken/aitken.o 		\
			   ../linking-fft/fft-mkl.o	

test_lib.o: test_lib.cpp
include test_lib.d

test_lib.exe: test_lib.o
	icpc -o $@ $^ $(MKLLIBS) -L$$PWD -lxmath 
	echo "check LD_LIBRARY_PATH, make ld_lib_path to set it"