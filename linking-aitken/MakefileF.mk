leibnizf.exe: leibnizf.o aitkenf.o
	ifort -v -o leibnizf.exe leibnizf.o aitkenf.o 

logseriesf.exe: logseriesf.o aitkenf.o
	ifort -o logseriesf.exe logseriesf.o aitkenf.o 

aitkenf.o: aitkenf.f 
	ifort -c aitkenf.f

leibnizf.o: leibnizf.f
	ifort -c leibnizf.f

logseriesf.o: logseriesf.f
	ifort -c logseriesf.f
