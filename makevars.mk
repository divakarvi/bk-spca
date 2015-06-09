#########
CPP 	 := icpc
CFLAGS 	 := -xhost -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP
ifndef FFTW_INC
   $(info ******** FFTW_INC not defined *********)
endif
ifdef EXTRNL
   CFLAGS := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP
endif
FFTWINC := $(FFTW_INC)
MKLINC := -mkl

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
ifndef FFTW_LINK
   $(info **********  FFTW_LINK not defined ********)
endif
FFTWLIBS := $(FFTW_LINK)

ifneq (,$(findstring FFTW_LINK,$(FFTWLIB)))
    $(info ********** FFTWLIB not set ***********)
endif

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
	rm -f *.o; rm -f *.a; rm -f *.so;  rm -f *.exe; rm -f pbs*.*; \
	rm -f *.d; rm -f DBG/outP*; rm -f slurm*.out;
