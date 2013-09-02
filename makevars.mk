#########
CPP 	:= icpc
ifdef $(NOINLINE)
	CFLAGS 	:= -O3 -prec-div -no-ftz -restrict -Wshadow	\
	-fno-inline-functions					\
	-I $$MKL_INC 						\
	-I $$FFTW_INC						\
	-openmp							\
	`mpiCC -showme:compile`	
else
	CFLAGS 	:= -O3 -prec-div -no-ftz -restrict -Wshadow	\
	-I $$MKL_INC 						\
	-I $$FFTW_INC						\
	-openmp							\
	`mpiCC -showme:compile`
endif
MKLLIBS := -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_sequential -lmkl_core 	\
	-lpthread
MKLTHRD := -L$$MKL_LINK -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core 	\
	-lpthread -lm
FFTWLIB :=  -L $$FFTW_LINK -lfftw3

#########
.SUFFIXES:
.SUFFIXES: .cpp .o .exe .s .d
%.o: %.cpp
	$(CPP) $(CFLAGS) -c $<
%.d: %.cpp
	@set -e; rm -f $@; \
	$(CPP) -M $(CFLAGS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$
%.s: %.cpp 
	$(CPP) $(CFLAGS) -S $< 
%.exe: %.o 
	$(CPP) $(OMP) -o $@ $^ $(LIBS) 

########
.PHONY: clean cleanx cleanxx
clean:
	rm *.o; rm *.exe; rm a.out;

cleanx:
	rm pbs*.*; 

cleanxx:
	rm *.o; rm *.exe; rm pbs*.*; rm *.d; rm DBG/outP*;