aitken.o: aitken.c
	icc -c -fPIC aitken.c
leibniz.o: leibniz.c
	icc -c leibniz.c
logseries.o: logseries.c
	icc -c logseries.c
leibniz.exe: leibniz.o
logseries.exe: logseries.o
leibniz.exe logseries.exe: aitken.o
	icc -o $@ $^ -lm
