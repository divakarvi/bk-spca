include ../../makevars.mk
CFLAGS := $(CFLAGS) 

######
MODS := ../../utils ../aitken ../fft
.PHONY: $(MODS)
$(MODS):
	@echo
	make --directory=$@ objl
	@echo

######
test_lib.o: test_lib.cpp
-include test_lib.d

######
libxmath.so: $(MODS)
	g++ -shared -o $@ ../../utils/utils.o			\
			   ../aitken/aitken.o 			\
			   ../fft/fft_fftw.o	
libxmath.a: $(MODS)
	ar rcs $@ ../../utils/utils.o				\
	          ../aitken/aitken.o 				\
		  ../fft/fft_fftw.o

######
#link against shared lib
#to link against static, rm .so file
test_lib.exe: test_lib.o
	g++ -o $@ $^ $ -L$$PWD -lxmath -lfftw3
	echo $$LD_LIBRARY_PATH
	echo "check LD_LIBRARY_PATH and *source* libpath.sh if necessary"
