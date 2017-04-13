#########
CPP 	 := icpc
CFLAGS 	 := -O3 -prec-div -no-ftz -restrict -Wshadow -MMD -MP
CFLAGS 	 := $(CFLAGS) -fno-inline-functions -openmp
FFTWINC  := -I $$FFTW_INC
MKLINC := -mkl

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
FFTWLIB  :=  -L $$FFTW_LINK -lfftw3
LIBS := -openmp

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

