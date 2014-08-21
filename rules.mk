#########
saved := $(d)
d := $(r)

#########
MPIINC 	 := `mpiCC -showme:compile`
FFTWINC  := -I $$FFTW_INC
MKLINC := -mkl
DVMPIINC := `$$HOME/openmpi-1.6.3/bin/mpiCC -showme:compile`

#########
CPP 	 := icpc
$(d)CFLAGS := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP
CFLAGSXX :=
$(d)CFLAGS := $($(d)CFLAGS) $(CFLAGSXX)

#########
$(d)/%.o: $(d)/%.cpp
	$(CPP) $($(d)CFLAGS) $($(d)EXTRNL) -o $@ -c $<
$(d)/%.s: $(d)/%.cpp 
	$(CPP) $($(d)CFLAGS) -fno-verbose-asm  $($(d)EXTRNL) -o $@ -S $< 
$(d)/%.o: $(d)/%.s 
	$(CPP) $($(d)CFLAGS) $($(d)EXTRNL) -o $@ -c $< 

#########

#########
d := $(saved)