include ../makevars.mk
CFLAGSXX := $(MKLINC)

######
MODS := ../utils ../linking-aitken ../linking-fft
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

######
libxmath.so: $(MODS)
	icpc -shared -o $@ ../utils/utils.o			\
			   ../linking-aitken/aitken.o 		\
			   ../linking-fft/fft_mkl.o	
libxmath.a: $(MODS)
	ar rcs $@ ../utils/utils.o			\
	          ../linking-aitken/aitken.o 		\
		  ../linking-fft/fft_mkl.o

test_lib.o: test_lib.cpp
-include test_lib.d

#link against shared lib
#to link against static, rm .so file
test_lib.exe: test_lib.o
	icpc -o $@ $^ $(MKLLIBS) -L$$PWD -lxmath 
	echo $$LD_LIBRARY_PATH
	echo "check LD_LIBRARY_PATH and source libpath.sh if necessary"
