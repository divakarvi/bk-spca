.PHONY: all 

all: syscall.exe time_syscall.exe segf mreg overhead latency dvmesg

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

overhead: overhead.exe p_overhead.exe ompadd.exe p_fastadd.exe
	echo "overhead done"

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

ompadd.exe: ompadd.o
	g++ -o $@ $^ -fopenmp
ompadd.o: ompadd.cpp
	g++ -O3 -c $< -fopenmp

p_fastadd_c.exe: p_fastadd_c.o
	g++ -o $@ $^ -fopenmp
p_fastadd_c.o: p_fastadd_c.cpp
	g++ -O3 -c $< -fopenmp

p_fastadd_spin.exe: p_fastadd_spin.o
	g++ -o $@ $^ -fopenmp
p_fastadd_spin.o: p_fastadd_spin.cpp
	g++ -O3 -c $< -fopenmp

p_fastadd_mtx.exe: p_fastadd_mtx.o
	g++ -o $@ $^ -fopenmp
p_fastadd_mtx.o: p_fastadd_mtx.cpp
	g++ -O3 -c $< -fopenmp

p_fastadd_cond.exe: p_fastadd_cond.o
	g++ -o $@ $^ -fopenmp
p_fastadd_cond.o: p_fastadd_cond.cpp
	g++ -O3 -c $< -fopenmp


latency: latency4n.exe
	echo "latency done"
latency.exe: latency.cpp
	g++ -O3 -o latency.exe latency.cpp
latency4n.exe: latency4n.o dummy.o
	g++ -o $@ $^
latency4n.o: latency4n.cpp
	g++ -O3 -c $<

dvmesg: dvmesg.c
	gcc -o dvmesg dvmesg.c

clean:
	rm *.exe; rm *.o;
