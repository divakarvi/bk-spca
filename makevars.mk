#########
CPP 	:= icpc
CFLAGS 	:= -O3 -prec-div -no-ftz -restrict -Wshadow

MPIINC 	:= `mpiCC -showme:compile1`
FFTWINC := -I $$FFTW_INC

MKLINC 	:= -I $$MKL_INC
MKLLIBS := -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_sequential -lmkl_core 	\
	-lpthread
MKLTHRD := -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core 	\
	-lpthread -lm
FFTWLIB :=  -L $$FFTW_LINK -lfftw3
MPILIBS := `mpiCC -showme:link`

#########
.SUFFIXES:
.SUFFIXES: .cpp .o .exe .s .d
%.o: %.cpp
	$(CPP) $(CFLAGS) $(CFLAGSXX) -c $<
%.d: %.cpp
	@set -e; rm -f $@; \
	$(CPP) -M $(CFLAGS) $(CFLAGSXX) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$
%.s: %.cpp 
	$(CPP) $(CFLAGS) $(CFLAGSXX) -S $< 
%.o: %.s 
	$(CPP) $(CFLAGS) $(CFLAGSXX) -S $< 
%.exe: %.o 
	$(CPP) $(OMP) -o $@ $(filter %.o,$^) $(LIBS) 

########
.PHONY: clean cleanx cleanxx
clean:
	rm *.o; rm *.exe; rm a.out;

cleanx:
	rm pbs*.*; 

cleanxx:
	rm *.o; rm *.exe; rm pbs*.*; rm *.d; rm DBG/outP*;