leibnizFinC.exe: leibnizFinC.o aitkenf.o
	icc -o $@ $^ -lifcore 

leibnizFinC.o: leibnizFinC.c
	icc -O3 -c $<

leibnizFinCPP.exe: leibnizFinCPP.o aitkenf.o
	icpc -o $@ $^ -lifcore

leibnizFinCPP.o: leibnizFinCPP.cpp

