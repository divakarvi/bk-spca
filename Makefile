include root.mk

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
FFTWLIB :=  -L $$FFTW_LINK -lfftw3
MPILIBS := `mpiCC -showme:link`

DVMPILIBS:= `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:link`
ifeq ($(DV),on)
    $(info USING DV BUILD OF OPENMPI)
    MPILIBS  := $(DVMPILIBS)
endif

CPP 	 := icpc
LIBS := 

#########
.SUFFIXES:
.SUFFIXES: .cpp .o .exe .s .d

%.exe: 
	$(CPP) $(EXTRNL) -o $@ $(filter %.o,$^) $(LIBS)