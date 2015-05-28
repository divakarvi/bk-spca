#########
CPP 	 := g++
CFLAGS 	 := -O3  -Drestrict=__restrict__ -Wshadow -MMD -MP
ifndef FFTW_INC 
    $(info ******** FFTW_INC is not set ***********)
endif
FFTWINC := $(FFTW_INC) 

#########
LALIBS := -lblas -llapack
LATHRD := -lblas -llapack
ifndef FFTW_LINK
    $(info ******* FFTW_LINK is not set ***********)
endif
FFTWLIBS := $(FFTW_LINK)


#########
.SUFFIXES:
.SUFFIXES: .cpp .o .exe .s .d
%.o: %.cpp
	$(CPP) $(EXTRNL) $(CFLAGS)  -c $<
%.s: %.cpp 
	$(CPP) $(EXTRNL) $(CFLAGS) -fno-verbose-asm  -S $< 
%.o: %.s 
	$(CPP) $(EXTRNL) $(CFLAGS) -c $< 
%.exe: %.o 
	$(CPP) $(EXTRNL) $(LFLAGS) -o $@ $(filter %.o,$^) $(LIBS) 

########
.PHONY: clean cleanx cleanxx
clean:
	rm -f *.o; rm -f *.exe; rm -f a.out;

cleanx:
	rm -f pbs*.*; 

cleanxx:
	rm -f *.o; rm -f *.exe; rm -f pbs*.*; rm -f *.d; rm -f DBG/outP*; \
	rm -f slurm*.out;
