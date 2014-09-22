leibniz.exe: leibniz.o aitken.o
	icc -o leibniz.exe leibniz.o aitken.o

logseries.exe: logseries.o aitken.o
	icc  -o logseries.exe logseries.o aitken.o -lm

aitken.o: aitken.c aitken.h
	icc -fPIC -c aitken.c

leibniz.o: leibniz.c aitken.h
	icc -c leibniz.c

logseries.o: logseries.c aitken.h
	icc -c logseries.c