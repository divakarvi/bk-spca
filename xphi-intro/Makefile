include ../makevars.mk
CFLAGSXX := -fno-inline-functions -openmp $(MKLINC)
LIBS := -openmp $(MKLLIBS) 
MODS := ../utils
MMIC := -mmic
export MMIC

hello.o: hello.cpp
-include hello.d

hello.exe: hello.o

time_leibniz:
	make --directory=../omp-leibniz time_leibniz.exe
	mv ../omp-leibniz/time_leibniz.exe .

test_rwc:	
	make --directory=../omp-bw2mem test_rwc.exe
	mv ../omp-bw2mem/test_rwc.exe test_rwc.exe

time_rwc:	
	make --directory=../omp-bw2mem time_rwc.exe
	mv ../omp-bw2mem/time_rwc.exe time_rwc.exe

test_trans:
	make --directory=../omp-transpose test_trans.exe
	mv ../omp-transpose/test_trans.exe test_trans.exe

time_trans:
	make --directory=../omp-transpose time_trans.exe
	mv ../omp-transpose/time_trans.exe time_trans.exe

test_fft:
	make --directory=../omp-fft test_fft.exe
	mv ../omp-fft/test_fft.exe test_fft.exe

time_fft:
	make --directory=../omp-fft time_fft.exe
	mv ../omp-fft/time_fft.exe time_fft.exe

latency:
	make --directory=../omp-latency latency.exe
	mv ../omp-latency/latency.exe latency.exe