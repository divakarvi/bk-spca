#########
CPP 	 := g++
CFLAGS 	 := -O3  -Drestrict=__restrict__ -Wshadow -MMD -MP
FFTWINC  := -I $$FFTW_INC
MKLINC := -mkl

#########
MKLLIBS := -mkl=sequential
MKLTHRD := -mkl=parallel
FFTWLIB  :=  -L $$FFTW_LINK -lfftw3

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
	rm *.o 2>/dev/null; rm *.exe 2>/dev/null; rm a.out 2>/dev/null;

cleanx:
	rm pbs*.* 2>/dev/null; 

cleanxx:
	rm *.o 2>/dev/null; rm *.a 2>/dev/null; rm *.so 2>/dev/null;  \
	rm *.exe 2>/dev/null; rm pbs*.* 2>/dev/null; rm *.d 2>/dev/null; \
	rm DBG/outP* 2>/dev/null; rm slurm*.out 2>/dev/null;
