include ../makevars.mk
CFLAGSXX := -openmp $(MKLINC)
LIBS := -openmp $(MKLLIBS)
MODS := ../utils ../linking-fft

#############
.PHONY: $(MODS)
$(MODS):
	make --directory=$@ all

#############
fft_thrd.o: fft_thrd.cpp