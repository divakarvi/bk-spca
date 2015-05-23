leibnizFinC.exe: leibnizFinC.o aitkenf.o
	gcc -o $@ $^ -lgfortran 

leibnizFinC.o: leibnizFinC.c
	gcc -O3 -c $<

leibnizFinCPP.exe: leibnizFinCPP.o aitkenf.o
	g++ -o $@ $^ -lgfortran

leibnizFinCPP.o: leibnizFinCPP.cpp
