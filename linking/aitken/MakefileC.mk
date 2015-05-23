leibniz.exe: leibniz.o aitken.o
	gcc -o leibniz.exe leibniz.o aitken.o

logseries.exe: logseries.o aitken.o
	gcc  -o logseries.exe logseries.o aitken.o -lm

aitken.o: aitken.c aitken.h
	gcc -fPIC -c aitken.c

leibniz.o: leibniz.c aitken.h
	gcc -c leibniz.c

logseries.o: logseries.c aitken.h
	gcc -c logseries.c
