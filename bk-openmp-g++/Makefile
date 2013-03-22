syscall.exe: syscall.c
	gcc -O3 -o syscall.exe syscall.c

time_syscall.exe: time_syscall.o dummy_sys.o
	g++ -o time_syscall.exe time_syscall.o dummy_sys.o
time_syscall.o: time_syscall.cpp
	g++ -O3 -c time_syscall.cpp
dummy_sys.o: dummy_sys.cpp
	g++ -O3 -c dummy_sys.cpp

segf: segf.exe segf.s drv-segf.s
	echo "done segf"
segf.exe: drv-segf.o segf.o  
	g++ -o $@ $^
drv-segf.o: drv-segf.cpp
	g++ -fno-inline-functions -O0 -c $<
segf.o: segf.cpp
	g++ -fno-inline-functions -O0 -c $<
drv-segf.s: drv-segf.cpp
	g++ -S -O0 -c $<
segf.s: segf.cpp
	g++ -S -O0 -c $<

mreg: mreg.exe 
	echo "done mreg"
mreg.exe: drv-mreg.o mreg.o dummy.o 
	g++ -o $@ $^
drv-mreg.o: drv-mreg.cpp
	g++ -O0 -c $<
mreg.o: mreg.cpp
	g++ -O0 -c $<

overhead.exe: overhead.o parallelA.o parallelB.o dummy.o
	g++ -fopenmp -o $@ $^
overhead.o: overhead.cpp
	g++ -fopenmp -c $<
parallelA.o: parallelA.cpp
	g++ -fopenmp -c $<
parallelB.o: parallelB.cpp
	g++ -fopenmp -c $<
dummy.o: dummy.cpp
	g++ -fopenmp -c $<

p_overhead.exe: p_overhead.o
	g++ -o $@ $^ -lpthread 
p_overhead.o: p_overhead.cpp
	g++ -O3 -c $<

p_fastadd.exe: p_fastadd.o
	g++ -o $@ $^ -fopenmp
p_fastadd.o: p_fastadd.cpp
	g++ -O3 -c $< -fopenmp

p_ompadd.exe: p_ompadd.o
	g++ -o $@ $^ -fopenmp
p_ompadd.o: p_ompadd.cpp
	g++ -O3 -c $< -fopenmp

latency.exe: latency.cpp
	g++ -O3 -o latency.exe latency.cpp

latency4n.exe: latency4n.o dummy.o
	g++ -o $@ $^
latency4n.o: latency4n.cpp
	g++ -O3 -c $<

clean:
	rm *.exe; rm *.o;
