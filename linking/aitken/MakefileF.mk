leibnizf.exe: leibnizf.o aitkenf.o
	gfortran -o leibnizf.exe leibnizf.o aitkenf.o 

logseriesf.exe: logseriesf.o aitkenf.o
	gfortran -o logseriesf.exe logseriesf.o aitkenf.o 

aitkenf.o: aitkenf.f 
	gfortran -c aitkenf.f

leibnizf.o: leibnizf.f
	gfortran -c leibnizf.f

logseriesf.o: logseriesf.f
	gfortran -c logseriesf.f
