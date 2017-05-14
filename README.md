## Scientific Programming and Computer Architecture
### Divakar Viswanath
#### MIT Press, 2017
#### ISBN 9780262036290 

The complete text of this book is available in html at [this link][bk]. The html is published under a Creative Commons license. The copyright remains with the publisher. The html has a few blemishes. For example, occasionally when the same source is split between multiple listings, the line numbering is not continued between the listings as it should be. The html does not have an index, although it is searchable. For a more correct and complete version, see the printed book:

1. [amazon.com](amazon.com)
2. [bn.com](bn.com)

This README document provides context for the source code in this GIT repository, with links to the html text as well as sources in the repository.

* [Preface](#Preface)
* [C/C++ Review](#C/C++-Review)
* [C/C++: Libraries and Makefiles](#C/C++:-Libraries-and-Makefiles)

# [Preface][bk.preface]

What makes computer programs fast or slow? To answer this question, we have to go behind the abstractions of programming languages and look at how a computer really works. This book examines and explains a variety of scientific programming models (programming models relevant to scientists) with an emphasis on how programming constructs map to different parts of the computer's architecture. Two themes emerge: program speed and program modularity. Most books on computer programming are written at the same level of abstraction as the programming language they utilize or explain. In contrast, this book starts from the premise that to understand program speed, we have to get under the hood and understand how a computer works. The approach is to begin with specific programs and move up to general principles gradually. 

The book digs into linkers, compilers, operating systems, and computer architecture to understand how the different parts of the computer interact with programs. It begins with a review of C/C++ and explanations of how libraries, linkers, and Makefiles work. Programming models covered include Pthreads, OpenMP, MPI, TCP/IP, and CUDA. The emphasis on how computers work leads the reader into computer architecture and occasionally into the operating system kernel. The operating system studied is Linux, the preferred platform for scientific computing. Linux is also open source, which allows users to peer into its inner workings. A brief appendix provides a useful table of machines used to time programs.

# [1][bk.1] C/C++ Review

The review of C/C++ in this chapter attempts to bring out certain features that people often do not learn from a single course or two.

### [1.1][bk.1.1] An example: The Aitken iteration

The Aitken transformation maps a sequence of numbers to another sequence of numbers. It serves as the vehicle to introduce aspects of C, C++, and Fortran in this chapter. 

#### [1.1.1][bk.1.1.1] Leibniz series and the logarithmic series

#### [1.1.2][bk.1.1.2] Modular organization of sources

Before we delve into the syntax of C/C++, let us look at how to structure a program for the Aitken iteration.

[linking/aitken][linking.aitken]

### [1.2][bk.1.2] C Review

In this review, we go over a few features of C, emphasizing points that introductory classes often miss. Thus, we discuss header files, arrays, and pointers, with emphasis on the distinction between lvalues and rvalues, as well as the distinction between declarations and definitions.

#### [1.2.1][bk.1.2.1] Header files

A header file in C is an interface to one or more source files.

[aitken.h][aitken.h]

#### [1.2.2][bk.1.2.2] Arrays and pointers

Arrays and pointers are the heart of the C language. In C, arrays and pointers are almost interchangeable.

[easypointers.c][easypointers.c]

#### [1.2.3][bk.1.2.3] The Aitken iteration using arrays and pointers

Here we use the Aitken example to illustrate how arrays may be passed as pointers.

[aitken.c][aitken.c]

#### [1.2.4][bk.1.2.4] Declarations and definitions

Names introduced into a C program are for the most part names of either functions or variables. The names can be introduced as either declarations or definitions.

#### [1.2.5][bk.1.2.5] Function calls and the compilation process

Here we take a look at the mechanism of function calls and the compilation process. 

[leibniz.c][leibniz.c]

[logseries.c][logseries.c]

[Makefile][aitken.MakefileC]

### [1.3][bk.1.3] C++ Review

The C++ language is something of a compromise to provide the facilities of high-level languages without sacrificing the speed of C. Despite its name, it is not an incremental extension of C. It is a colossal expansion of C syntax.

#### [1.3.1][bk.1.3.1] The Vector class

We begin with a general type of class, namely, the Vector class. This class helps us review a few of the features of C++ and is used to implement the Aitken iteration later. In a later chapter, we criticize the use of this class and show it to be slow. Except for this class, our classes are narrowly defined and follow the "one class, one task" principle.

[Vector.hh][Vector.hh] illustrates some of the following:

* Header file with class definition
* Private section
* Member functions
* References
* Operator and function name overloading
* Function call inlining
* Constructors and desctructors
* The const qualifier
* Default arguments
* The -> operator
* Abstraction features of C++

#### [1.3.2][bk.1.3.2] Aitken transformation in C++

[Aitken.hh][Aitken.hh]

[Aitken.cpp][Aitken.cpp]

[Leibniz.cpp][Leibniz.cpp]

[Logseries.cpp][Logseries.cpp]

### [1.4][bk.1.4] A little Fortran

The syntax is deliberately Fortran 77 and not the newer varieties. When the need to use old Fortran codes arises, it is often Fortran of this variety. We do not recommend programming in Fortran.

[aitkenf.f][aitkenf.f]

[leibnizf.f][leibnizf.f]

[logseriesf.f][logseriesf.f]

# [2][bk.2] C/C++: Libraries and Makefiles

There are two powerful ideas for bringing greater modularity into C/C++ programs, and both of them will be introduced in this chapter. The first idea is to combine object files into libraries, and the second idea is to organize program sources into a source tree.

### [2.1][bk.2.1] Mixed-language programming

We look at the map from sources to object files as a precursor to mixed-language programming.  Beyond the transmutation of names, which differs between the three languages, the additional issue of runtime libraries has to be dealt with.

#### [2.1.1][bk.2.1.1] Transmutation of names from source to object files

If the source has a statement such as a=b+c, for example, the names a, b, c typically disappear from the object file. Not all names present in the source disappear, however. Those names present in the source that survive in the object file are some of the most important.

[aitken.c][aitken.c]

[Aitken.cpp][Aitken.cpp]

#### [2.1.2][bk.2.1.2] Linking Fortran programs with C and C++

To use Fortran functions within C or C++ programs, the naming used for the Fortran functions in C or C++ has to be cognizant of the way the names in the source files are altered in the object file. We want the names to agree in the object files because it is the object files and not the source files that get linked against each other.

[leibnizFinC.c][leibnizFinC.c]

[leibnizFinCPP.cpp][leibnizFinCPP.cpp]

### [2.2][bk.2.2] Using BLAS and LAPACK libraries

BLAS and LAPACK are widely used numerical linear algebra libraries.

#### [2.2.1][bk.2.2.1] Arrays, matrices, and leading dimensions

We look at multidimensional arrays in C/C++ briefly and then at the distinction between column-major format and row-major format.

[array_2d.c][array_2d.c]

#### [2.2.2][bk.2.2.2] BLAS and LAPACK
BLAS and LAPACK functions, to which we now turn, typically have long argument lists.

[mkl_blas.h][mkl_blas.h]

[mkl_lapack.h][mkl_lapack.h]

#### [2.2.3][bk.2.2.3] C++ class interface to BLAS/LAPACK

The [Vector class][Vector.hh] is an attempt to capture the general concept of vectors. The LU_Solve class of this section is narrowly defined. It does just one thing, which is to provide an easy interface to LAPACK's LU solver functions dgetrf() and dgetrs().

[lusolve.hh][lusolve.hh]

[lusolve.cpp][lusolve.cpp]

[test_lusolve.cpp][test_lusolve.cpp]

[test_lusolve.py][test_lusolve.py]

### [2.3][bk.2.3] Building programs using GNU Make
The organization of source files into directories and subdirectories is the heart of modular programming. The make utility provides a method for building a program from its source tree.

#### [2.3.1][bk.2.3.1] The utils/ folder
The modules in utils/ facilitate timing, generation of random numbers, gathering statistics, making tables, and manipulation of double arrays. All the modules in utils/ are used extensively. We avoid mentioning the modules in utils for the most part, but a brief discussion is given here.

[utils directory listing][utils]

[utils.hh][utils.hh]

[utils.cpp][utils.cpp]

[test_lusolve.cpp][test_lusolve.cpp] showing how utils are used.

#### [2.3.2][bk.2.3.2] Targets, prerequisites, and dependency graphs

The first purpose of a Makefile is to capture the dependency graph between headers, sources, object files, and executables.

[Makefile 1][aitken.MakefileC]

[Makefile 2][aitken.MakefileC2]

#### [2.3.3][bk.2.3.3] Make variables in makevars.mk
Almost all Makefiles have make variables.

[Root of source tree][bk-spca]

[makevars.mk][makevars.mk]

#### [2.3.4][bk.2.3.4] Pattern rules in makevars.mk

The recipes have a formulaic character. For example, if the target is an object file to be built from a C++ source, the recipe generally invokes the C++ compiler specified by CPP using the options listed in CFLAGS. Pattern rules take advantage of the repetitive nature of recipes to simplify their specification.

[makevars.mk][makevars.mk]

#### [2.3.5][bk.2.3.5] Phony targets in makevars.m

Phony targets are always assumed to be out of date.

[makevars.mk][makevars.mk]

#### [2.3.6][bk.2.3.6] Recursive make and .d files

When the source and object files required to build a single executable reside in several subdirectories, recursive make may be used to complete the build.

[Makefile with recursion][Makefile.recursive]

[Makefile that is called recursively][Makefile.rcalled]

#### [2.3.7][bk.2.3.7] Beyond recursive make

Modularity and simplicity are two virtues of recursive make. However, there are several problems with it.

#### [2.3.8][bk.2.3.8] Building your own library


We end our discussion of make by showing how to build and link static and shared libraries. Libraries provide a level of modularity beyond what is possible within a source tree. Any program that is linked against a library in effect treats the external library as a module.

[Makefile for building static/shared library][Makefile.lib]

[libpath.sh][libpath.sh]

### [2.4][bk.2.4] The Fast Fourier Transform

In this last section, we look at the speed of a few implementations of the Fast Fourier Transform (FFT). Program speed is a major theme of the rest of this book.

#### [2.4.1][bk.2.4.1] The FFT algorithm in outline

The power of 2 FFT moves through lg(N) levels. The number of arithmetic operations in each level consists of N/2 twiddle factor multiplications, N/2 additions, and N/2 subtractions.

#### [2.4.2][bk.2.4.2] FFT using MKL

[fft_mkl.hh][fft_mkl.hh]

[fft_mkl.cpp][fft_mkl.cpp]

#### [2.4.3][bk.2.4.3] FFT using FFTW

[fft_fftw.hh][fft_fftw.hh]

[fft_fftw.cpp][fft_fftw.cpp]

#### [2.4.4][bk.2.4.4] Cycles and histograms

How many cycles does a one-dimensional complex FFT of dimension 210 = 1024 take? Program performance is influenced by so many factors that the question is too simple to be answered. 

[hist_fft.cpp][hist_fft.cpp]

#### [2.4.5][bk.2.4.5] Optimality of FFT implementations

What is the fastest possible speed of an FFT implementation? The many system features that intrude into the histograms hint that this question may not have a straightforward answer.

[nr.hh][nr.hh]

[nr.cpp][nr.cpp] (FFT implementation from Numerical Recipes)

[time_fft.cpp][time_fft.cpp]

# [3][bk.3] The Processor

Even for many simple programs, the compilers of today do not generate optimal code or anything like it. Good, or nearly optimal, programs for modern platforms can be written only with a knowledge of the nuances of the computer’s hardware. With that in mind, this chapter, indeed the rest of this book, will introduce programming models in close concert with computer architecture.

### [3.1][bk.3.1] Overview of the x86 architecture

This section is a basic introduction to the x86 instruction architecture, which has dominated since its introduction in 1978. We look at registers and a little bit of assembly programming.

#### [3.1.1][bk.3.1.1] 64-bit x86 architecture

When we write programs, we do so with an awareness of memory. Every variable name is ultimately the name for a segment of memory. However, in most programming, we have no awareness of the registers at all. Registers are very special locations because they are wired into the circuits for carrying out arithmetic and logical operations.

#### [3.1.2][bk.3.1.2] 64-bit x86 assembly programming

The reader may find it a little puzzling that “double” (or “long”) is used for 32-bit operands and “quad” for 64-bit operands. A word in the original 8086 machine of 1978 was 16 bits. Thus, double words are 32 bits and quad words are 64 bits, as a result of a choice made long ago.

[add.c][add.c]

[add.s][add.s]

[addtwo.s][addtwo.s]

[addmany.s][addmany.s]

#### [3.1.3][bk.3.1.3] The Time Stamp Counter

To do anything useful with assembly code, it helps to have a method to make it part of a C or C++ program. The asm directive allows us to embed assembly code in a C or C++ program. RDTSC or rdtsc is an x86 machine instruction for reading the Time Stamp Counter. This instruction can be embedded in C/C++ programs.

[TimeStamp.hh][TimeStamp.hh]

#### [3.1.4][bk.3.1.4] Cache parameters and the CPUID instruction

We will take a closer look at cache memory in the next chapter. Here we will use the cpuid instruction to ask the processor to report information about its cache and thus give us a preliminary idea of cache memory.

[cpuid.cpp][cpuid.cpp]

### [3.2][bk.3.2] Compiler Optimizations

Anyone who seeks to write fast programs must begin by grasping what compilers do. C/C++ programs are turned into machine instructions by the compiler. The speed of the program can vary by a factor of 10, or even more, depending on the instruction stream the compiler generates. While generating machine instructions, compilers can alter the structure of the program considerably.

#### [3.2.1][bk.3.2.1] Preliminaries

Cache flush, which we describe here, is one way to eliminate cache effects. We also review compiler options. The C++ classes PyPlot for plotting, StatVector for gathering simple statistics, and Table for making tables are used extensively in the source code for this book. However, they appear only rarely in the text. All three classes are described in the appendix.

#### [3.2.2][bk.3.2.2] Loop unrolling

Table 3.2↑ shows that turning on compiler optimization doubles the speed of the code. Rewriting leibniz() to enable loop unrolling, which is one of the most important optimizations, doubles the speed once again. We will use the leibniz() function and its variants to explain how loop unrolling works.

[leibniz.cpp][leibniz.cpp]

#### [3.2.3][bk.3.2.3] Loop fusion

Because the speed of modern x86 computers relies on instruction-level parallelism and vector registers, it is often a good idea to have a lot of parallelism in the innermost loops. Loop fusion addresses the situation where we have two distinct loops. It is assumed that the iterations of each loop have dependencies that make loop unrolling ineffective. In such a scenario, merging the bodies of the two loops may be the best way to produce a loop body that is amenable to instruction-level parallelism. The transformation where distinct loop bodies are merged is called loop fusion.

[sincos.cpp][sincos.cpp]

#### [3.2.4][bk.3.2.4] Unroll and jam

In this section, we will study a compiler optimization that applies to nested loops. So far we have considered loop unrolling and loop fusion. In loop nests, it may be desirable to unroll the outer loop and fuse several copies of the inner loop that result. That is the unroll and jam transformation.

[sinetable.cpp][sinetable.cpp]

#### [3.2.5][bk.3.2.5] Loop interchange

Loop interchange is the next compiler optimization for discussion, and matrix multiplication is the example we use to bring it out.

[mult.cpp][mult.cpp]

#### [3.2.6][bk.3.2.6] C++ overhead

[Matrix.hh][Matrix.hh]

[cpp-mult.cpp][cpp-mult.cpp]

[Makefile][proc.compiler.Makefile] (showing inlining for C++)

#### [3.2.7][bk.3.2.7] A little compiler theory

The compiler’s view of a program is quite different from that of a human programmer. A human programmer has a problem to be solved and an idea to solve that problem that is expressed as a computer program. What the compiler sees is a sequence of statements that obey the syntactic rules of the programming language. The global view of what the program does is lost.

### [3.3][bk.3.3] Optimizing for the instruction pipeline

Earlier, we found that MKL’s fast Fourier transform and matrix multiplication can be 10 times faster than ordinary C/C++ programs. If the C++ program is written without care, the speedup can even be a factor of 100. What does Intel’s MKL do to be so much faster than ordinary C/C++ programs? The biggest part of the answer to that question is optimizing for the instruction pipeline, which is the topic of the present section.

#### [3.3.1][bk.3.3.1] Instruction pipelines

The automobile assembly line offers a useful point of comparison to clarify concepts. An automobile assembly line may take 48 hours to assemble a single car. However, thanks to pipelining and multiple assembly lines, the factory may produce a car every minute. For such a factory, the latency would be 48 hours and the bandwidth 1 car per minute.

#### [3.3.2][bk.3.3.2] Chipsets

The processors are central to the computer but are only one among the many components that make up a computer or compute node. Some of the other components are DRAM memory, graphics processor, hard disk, solid state storage, network adapter, keyboard, and monitor. To understand how the processor is connected to all the components, we have to look at chipsets. Chipsets are chips used to assemble computers from many components.

#### [3.3.3][bk.3.3.3] Peak floating point performance

In this section, we write a few programs that do nothing meaningful but that get close to the peak performance of 4 flops per cycle using SSE2 instructions. Optimization for the more recent AVX2 instruction set is dealt with in the exercises.

[easyxmm.hh][easyxmm.hh]

[addxmm.cpp][addxmm.cpp]

[addmultxmm.cpp][addmultxmm.cpp]

[peak_onlyreg.cpp][peak_onlyreg.cpp]

[peak_withloads.cpp][peak_withloads.cpp]

[peak_loadnstore.cpp][peak_loadnstore.cpp]

#### [3.3.4][bk.3.3.4] Microkernel for matrix multiplication

In this section, we write programs that multiply matrices of dimensions 4 × n and n × 4 using slightly more than 8n cycles. The microkernel with n = 200 is the basis of matrix multiplication routines given in the next chapter. The programs are limited to SSE2 instructions.

[asm4xnx4.hh][asm4xnx4.hh]

[asm4x1x4.s][asm4x1x4.s]

[asm4x4x4.s][asm4x4x4.s]

[asm4x200x4.s][asm4x200x4.s]


# [4][bk.4] Memory

In modern computers, including supercomputers, desktops, laptops, and all kinds of mobile devices, memory invariably refers to DRAM. Although file systems reside on hard disk or some other storage medium, when a program is running, much of the data that is handled is from DRAM.

### [4.1][bk.4.1] DRAM and cache memory

To access a register, the latency is 1 cycle. To access the L1 cache, the latency is 4 cycles. The latency to DRAM, however, can be hundreds of cycles. It is estimated that 40% of the instructions access DRAM, and therefore hiding this large latency to DRAM is a major part of computer architectural design. It is important for the programmer to understand when this latency to DRAM can be hidden.Briefly, the latency to DRAM can be effectively hidden when the data access is sequential and predictable. It cannot be hidden in linked lists and other dynamic data structures because the location of the next item is determined by a link from the present item. However, even in such situations, programming techniques can mitigate the latency to DRAM.

#### [4.1.1][bk.4.1.1] DRAM memory

At the finest level, DRAM is an array of bits. Arrays of bits are organized into banks, ranks, and channels. There is a memory controller on each processor package that drives the memory channels.

#### [4.1.2][bk.4.1.2] Cache memory

An instruction such as movq %rax, %rdx, which moves one register to another, takes a single cycle. However, a load instruction such as movq (%rsi), %rdx, which moves a quad word from memory to a register, can take more than 100 cycles.

#### [4.1.3][bk.4.1.3] Physical memory and virtual memory

Virtual memory is implemented by the operating system and the processor hardware working in concert. Virtual memory is an illusion that simplifies programming, compilation, and linking in addition to keeping programs from interfering with each other. As the program runs, the memory addresses generated by a program are automatically mapped to physical addresses in the DRAM memory.

#### [4.1.4][bk.4.1.4] Latency to DRAM memory: First attempts

In this section, we make our first attempts at measuring the access time to DRAM memory. All our attempts fail, but we are led into certain aspects of the memory system that have a bearing on program performance.

[array_walk.hh][array_walk.hh] (accessList in text renamed to chain_walk in code)

[array_walk.cpp][array_walk.cpp]

[time_walk.cpp][time_walk.cpp]

#### [4.1.5][bk.4.1.5] Latency to DRAM

Our earlier attempts to measure latency to DRAM memory failed because we did not account for the overhead of creating and accessing page table entries. The more careful program in this section breaks instruction-level parallelism, ensures that none of the cache lines accessed is from L1, L2, or L3 cache, and accesses all of the 256 cache lines within four pages of memory (so that TLB misses are not a factor).

[latency_utils.hh][latency_utils.hh]

[latency_utils.cpp][latency_utils.cpp]

[latency.hh][latency.hh]

[latency.cpp][latency.cpp]

### [4.2][bk.4.2] Optimizing memory access

In this section, we look at optimization of memory access using three examples.

#### [4.2.1][bk.4.2.1] Bandwidth to DRAM

The most predictable and common pattern of memory access is to access a long line of data in sequence. Every memory controller is likely to be optimized to handle that pattern efficiently.

[sumcopy.hh][sumcopy.hh]

[sumcopy.cpp][sumcopy.cpp]

#### [4.2.2][bk.4.2.2] Matrix transpose

The example we study here is out-of-place matrix transpose. It is always best to access data sequentially with unit stride, but when a matrix is transposed to another matrix stored in the same column-major format, there is no way to access both matrices with unit stride. In many problems of this type, it is useful to break up the data into blocks.

[transpose.hh][transpose.hh]

[transpose.cpp][transpose.cpp]

#### [4.2.3][bk.4.2.3] Optimized matrix multiplication

Here we assume the matrices to be in DRAM memory and not in cache, and we show how to optimize matrix multiplication. In outline, the basic idea remains to multiply in blocks, but intermediate blocks are stored in scratch space and in convenient formats to minimize TLB and cache misses. As far as possible, data is stored in a format that enables sequential access with unit stride. The actual execution of this idea can make it look more complicated than it is, but the idea is elegant as well as possibly applicable to many other problems.

[blockmult.hh][blockmult.hh]

[blockmult.cpp][blockmult.cpp]

### [4.3][bk.4.3] Reading from and writing to disk

The data in registers and DRAM memory disappears when the computer is powered off. In contrast, hard disk storage is permanent. The hard disk is a collection of platters. Bits stored on circular tracks on either side of the platters are turned on and off using a magnetic field. More than 100 billion bits can be packed into a single square inch of a platter.

#### [4.3.1][bk.4.3.1] C versus C++

With regard to the programming technique for reading and writing files, the simplest lesson is also the most valuable. The C interface can be much faster than the C++ interface as we show and for reasons we explain.

[serial.hh][serial.hh]

[serial.cpp][serial.cpp]

#### [4.3.2][bk.4.3.2] Latency to disk

The measurement of latency to hard disk brings up issues not unlike the ones encountered in measuring the latency to DRAM memory. The true latency to hard disk is not easily visible to simple computer programs.

[serial.hh][serial.hh]

[calc_latency.cpp][calc_latency.cpp]

#### [4.3.3][bk.4.3.3] Bandwidth to disk

A single array cannot exceed the available DRAM, although it is desirable to work with files much larger than the size of DRAM memory when estimating bandwidth to disk.

[serial.hh][serial.hh]

[serial.cpp][serial.cpp]

### [4.4][bk.4.4] Page tables and virtual memory

In this section, we make our first foray into the operating system kernel. [83]  The cost of a single write to memory by an instruction such as movq %rax, (%rsi) brings in many layers of complexity. It could be a cache hit or a cache miss. If the DRAM memory is accessed, the cost of the access depends on preceding and following memory accesses. It depends on the manner in which the memory controllers operate the DRAM devices. It depends on the parallelism in the instruction stream. It depends on the pressure on dispatch ports in the instruction pipeline among other factors. On top of the layers of complexity engineered into hardware, the operating system introduces yet more complexity.

#### [4.4.1][bk.4.4.1] Partitioning the virtual address space

Much of virtual address space is an unclaimed wilderness. Figure 4.8 is an incomplete schematic view of the partitioning of the virtual address space of a typical user process. Much of the virtual address space is taken up by the unutilized regions shown as empty gaps.

[vmemmap.c][vmemmap.c]

#### [4.4.2][bk.4.4.2] Physical address space and page tables

Program speed is influenced by the paging system in several ways. If a memory word is found in L1 cache and its virtual address is found in TLB, the latency of the memory access would be just 4 cycles. However, if there is a TLB miss, the latency can go up to several hundred cycles. If there is a page fault, the latency of a single memory access can go up to millions, even billions, of cycles.


# [5][bk.5] Threads and Shared Memory

Programming with threads is a paradigm of great range and utility that encompasses everything from cell phones to web servers to supercomputers.

### [5.1][bk.5.1] Introduction to OpenMP

OpenMP programs look much like sequential programs, and the syntax is easy to learn. The simplicity is mostly illusory, however. Whenever concurrent programs share memory, as OpenMP programs do, the programming model inevitably becomes very subtle.

#### [5.1.1][bk.5.1.1] OpenMP syntax

OpenMP syntax is beguilingly simple.

[leibniz.hh][omp.leibniz.hh]

[leibniz.cpp][omp.leibniz.cpp]

[ompfor.cpp][ompfor.cpp]

[parallel.cpp][parallel.cpp]

[section.cpp][section.cpp]

#### [5.1.2][bk.5.1.2] Shared variables and OpenMP's memory model

Implicit flushes are a vital part of OpenMP's memory model.

[printstuff.cpp][printstuff.cpp]

#### [5.1.3][bk.5.1.3] Overheads of OpenMP constructs

The parallel, barrier, and for constructs introduce overheads. Work may need to be assigned to threads, threads may need to be created and destroyed, or synchronization and serialization may need to be implemented using system calls to the operating system kernel. These activities consume cycles. If the parallelized task is too small, the benefits of parallelization will be overwhelmed by the overheads. Effective programming requires knowledge of the overheads of OpenMP constructs.

[parallel.hh][parallel.hh]

[parallelA.cpp][parallelA.cpp]

[overhead.hh][overhead.hh]

[barrier.cpp][barrier.cpp]

[ompfor.cpp][ovhd.ompfor.cpp]

### [5.2][bk.5.2] Optimizing OpenMP programs

It is commonly believed that a program running on 16 cores is 16 times faster than a program that runs on 1 core, ignoring communication costs. This belief is completely mistaken. Bandwidth to memory does not scale linearly with the number of cores. Although linear speedup is often claimed in scientific computing research, such claims are a consequence of the program not going out of cache, a surprisingly common occurrence. Algorithms that use memory in a nontrivial manner and achieve linear speedup are rare.

#### [5.2.1][bk.5.2.1] Near memory and far memory

It is advantageous if a page frame that is mostly used by a thread resides in near memory. If page frames are in far memory, the speed of the program can degrade by more than a factor of two.

[latency.cpp][omp.latency.cpp]

#### [5.2.2][bk.5.2.2] Bandwidth to DRAM memory

Table 5.3 lists the read, write, and copy bandwidths for two different computers. In neither case do we get anything close to linear speedup for reading and copying.

[readwrcopy.hh][readwrcopy.hh]

[readwrcopy.cpp][readwrcopy.cpp]


#### [5.2.3][bk.5.2.3] Matrix transpose

The bandwidth realized in transposing is nearly 80% of the bandwidth for copying. Getting to 80% of the best possible in a matrix transpose is quite good.

[transpose.hh][transpose.hh]

[transpose.cpp][transpose.cpp]

#### [5.2.4][bk.5.2.4] Fast Fourier transform

The FFT speedups are quite good and reach 75% of linear speedup.

[fft_thrd.hh][fft_thrd.hh]

[fft_thrd.cpp][fft_thrd.cpp]

### [5.3][bk.5.3] Introduction to Pthreads

OpenMP is a limited programming model. It applies mainly to those situations where the data is static and the access patterns are regular. Pthreads are a more powerful programming model.

The Pthread interface for creating and running threads is supported by the Linux kernel. In Linux, each thread is a separate process. Thread creation is the same as process creation. The distinguishing feature of a group of threads is that they all use the same page tables.

#### [5.3.1][bk.5.3.1] Pthreads

Pthreads are initiated using functions that take a single argument of type void * and return a single value also of type void *.

[mesg.hh][mesg.hh]

[mesg_plain.cpp][mesg_plain.cpp]

[mesg_mutex.cpp][mesg_mutex.cpp]

[mesg_spin.cpp][mesg_spin.cpp]

[leibniz.cpp][pthreads.leibniz.cpp]

#### [5.3.2][bk.5.3.2] Overhead of thread creation

The typical cost of creating and destroying Pthreads appears to be somewhat less than 10**5 cycles. That number is not unreasonable given that each process descriptor used by the kernel is nearly 6 KB. The cost of creating threads will vary from system to system, but the numbers are qualitatively the same on many different systems. The cost of creating a thread per core may be expected to be higher on computers with multiple processor packages.

[thrd_create_ovhd.cpp][thrd_create_ovhd.cpp]

#### [5.3.3][bk.5.3.3] Parallel regions using Pthreads

Open MP type parallel regions are implemented using Pthreads in this section. The first implementation is plain C, except for creating and launching Pthreads. The second and third implementations use spinlocks and mutexes, respectively. The final implementation uses conditional variables.  The C implementation highlights the role of cache coherence, which is essential and fundamental to multithreaded programming. Propagating writes from cache to cache can cause significant overhead. The C implementation also introduces memory fences.

[altadd_omp.cpp][altadd_omp.cpp]

[altadd_c.cpp][altadd_c.cpp]

[altadd_mtx.cpp][altadd_mtx.cpp]

[altadd_spin.cpp][altadd_spin.cpp]

[altadd_cond.cpp][altadd_cond.cpp]


### [5.4][bk.5.4] Program memory

Programs rely on operating systems in many more ways than most programmers realize. The little forays we make into the Linux kernel will help us understand segmentation faults, memory errors, and thread creation.

#### [5.4.1][bk.5.4.1] An easy system call

The operating system kernel offers its services to user programs through system calls. There are system calls for dealing with every single part of the computing system. There are system calls related to the file system, networks, memory management, and process creation and scheduling. Every printf() or malloc() begins life in the C library but finds its way into the operating system kernel through a system call.

[linux.kernel.patch.11][linux.kernel.patch.11]
(defines a new system call to control printing of messages).

[linux.kernel.patch.22][linux.kernel.patch.22]
(more modifications to print messages)

[dvmesg.h][dvmesg.h]

[dvmesg.c][dvmesg.c]

[syscall.c][syscall.c]

[time_syscall.cpp][time_syscall.cpp]

#### [5.4.2][bk.5.4.2] Stacks

Stacks are useful for maintaining the state of running processes. This application is so important that the stack is hardwired into the x86 instruction set as well as most other instruction sets.

[hanoi.cpp][hanoi.cpp]

In Linux, every process gets a kernel mode stack, in addition to its user mode stack. The user mode stack occupies a high region in the user area, and the kernel mode stack is in the kernel area of virtual memory.


#### [5.4.3][bk.5.4.3] Segmentation faults and memory errors

The use of pointers exposes the programmer to errors that corrupt memory. Memory errors can befuddle even expert programmers. An erroneous program with memory errors may work on some systems but crash on others. The point where the program crashes can be far away from the point where the error occurs. The program may work for some inputs but not for others. In multithreaded programs, memory errors may be triggered by race conditions that are hard to reproduce, making debugging difficult. In this section, we take a detailed look at segmentation faults and memory errors.

[stacksize.cpp][stacksize.cpp]

[segf.hh][segf.hh]

[segf.cpp][segf.cpp]

[induce_segf.cpp][induce_segf.cpp]

[maccess.hh][maccess.hh]

[maccess.cpp][maccess.cpp]

[induce_merr.cpp][induce_merr.cpp]



[bk]: https://divakarvi.github.io/bk-spca/spca.html
[bk.preface]: https://divakarvi.github.io/bk-spca/spca.html#toc-Chapter--1
[bk.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Chapter-1
[bk.1.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-1.1
[bk.1.1.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-1.1.1
[bk.1.1.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-1.1.2
[linking.aitken]: https://github.com/divakarvi/bk-spca/tree/master/linking/aitken
[bk.1.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-1.2
[bk.1.2.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-1.2.1
[aitken.h]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/aitken.h
[bk.1.2.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-1.2.2
[easypointers.c]: https://github.com/divakarvi/bk-spca/blob/master/linking/easy/easypointers.c
[bk.1.2.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-1.2.3
[aitken.c]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/aitken.c
[bk.1.2.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-1.2.4
[bk.1.2.5]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-1.2.5
[leibniz.c]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/leibniz.c
[logseries.c]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/logseries.c
[aitken.MakefileC]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/MakefileC.mk
[bk.1.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-1.3
[bk.1.3.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-1.3.1
[Vector.hh]: https://github.com/divakarvi/bk-spca/blob/master/utils/Vector.hh
[bk.1.3.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-1.3.2
[Aitken.hh]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/Aitken.hh
[Aitken.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/Aitken.cpp
[Leibniz.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/Leibniz.cpp
[Logseries.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/LogSeries.cpp
[bk.1.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-1.4
[aitkenf.f]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/aitkenf.f
[leibnizf.f]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/leibnizf.f
[logseriesf.f]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/logseriesf.f

[bk.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Chapter-2
[bk.2.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-2.1
[bk.2.1.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.1.1
[bk.2.1.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.1.2
[leibnizFinC.c]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/leibnizFinC.c
[leibnizFinCPP.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/leibnizFinCPP.cpp
[bk.2.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-2.2
[bk.2.2.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.2.1
[array_2d.c]: https://github.com/divakarvi/bk-spca/blob/master/linking/linalg/array_2d.c
[bk.2.2.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.2.2
[mkl_blas.h]: https://github.com/divakarvi/bk-spca/blob/master/linking/linalg/mkl_blas.h
[mkl_lapack.h]: https://github.com/divakarvi/bk-spca/blob/master/linking/linalg/mkl_lapack.h
[bk.2.2.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.2.3
[lusolve.hh]: https://github.com/divakarvi/bk-spca/blob/master/linking/linalg/lusolve.hh
[lusolve.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/linalg/lusolve.cpp
[test_lusolve.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/linalg/test_lusolve.cpp
[test_lusolve.py]: https://github.com/divakarvi/bk-spca/blob/master/linking/linalg/test_lusolve.py
[bk.2.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-2.3
[bk.2.3.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.3.1
[utils]: https://github.com/divakarvi/bk-spca/tree/master/utils
[utils.hh]: https://github.com/divakarvi/bk-spca/blob/master/utils/utils.hh
[utils.cpp]: https://github.com/divakarvi/bk-spca/blob/master/utils/utils.cpp
[bk.2.3.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.3.2
[aitken.MakefileC2]: https://github.com/divakarvi/bk-spca/blob/master/linking/aitken/MakefileC2.mk
[bk.2.3.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.3.3
[makevars.mk]: https://github.com/divakarvi/bk-spca/blob/master/makevars.mk
[bk-spca]: https://github.com/divakarvi/bk-spca
[bk.2.3.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.3.4
[bk.2.3.5]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.3.5
[bk.2.3.6]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.3.6
[Makefile.recursive]: https://github.com/divakarvi/bk-spca/blob/master/linking/linalg/Makefile
[Makefile.rcalled]: https://github.com/divakarvi/bk-spca/blob/master/utils/Makefile
[bk.2.3.7]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.3.7
[bk.2.3.8]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.3.8
[Makefile.lib]: https://github.com/divakarvi/bk-spca/blob/master/linking/lib/Makefile
[libpath.sh]: https://github.com/divakarvi/bk-spca/blob/master/linking/lib/libpath.sh
[bk.2.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-2.4
[bk.2.4.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.4.1
[bk.2.4.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.4.2
[fft_mkl.hh]: https://github.com/divakarvi/bk-spca/blob/master/linking/fft/fft_mkl.hh
[fft_mkl.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/fft/fft_mkl.cpp
[bk.2.4.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.4.3
[fft_fftw.hh]: https://github.com/divakarvi/bk-spca/blob/master/linking/fft/fft_fftw.hh
[fft_fftw.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/fft/fft_fftw.cpp
[bk.2.4.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.4.4
[hist_fft.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/fft/hist_fft.cpp
[bk.2.4.5]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-2.4.5
[nr.hh]: https://github.com/divakarvi/bk-spca/blob/master/linking/fft/nr.hh
[nr.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/fft/nr.cpp
[time_fft.cpp]: https://github.com/divakarvi/bk-spca/blob/master/linking/fft/time_fft.cpp

[bk.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Chapter-3
[bk.3.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-3.1
[bk.3.1.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.1.1
[bk.3.1.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.1.2
[bk.3.1.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.1.3
[bk.3.1.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.1.4
[bk.3.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-3.2
[bk.3.2.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.2.1
[bk.3.2.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.2.2
[bk.3.2.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.2.3
[bk.3.2.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.2.4
[bk.3.2.5]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.2.5
[bk.3.2.6]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.2.6
[bk.3.2.7]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.2.7
[bk.3.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-3.3
[bk.3.3.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.3.1
[bk.3.3.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.3.2
[bk.3.3.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.3.3
[bk.3.3.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-3.3.4
[add.c]: https://github.com/divakarvi/bk-spca/blob/master/proc/asm/add.c
[add.s]: https://github.com/divakarvi/bk-spca/blob/master/proc/asm/add.s
[addtwo.s]: https://github.com/divakarvi/bk-spca/blob/master/proc/asm/addtwo.s
[addmany.s]: https://github.com/divakarvi/bk-spca/blob/master/proc/asm/addmany.s
[TimeStamp.hh]: https://github.com/divakarvi/bk-spca/blob/master/utils/TimeStamp.hh
[cpuid.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/asm/cpuid.cpp
[leibniz.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/compiler/leibniz.cpp
[sincos.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/compiler/sincos.cpp
[sinetable.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/compiler/sinetable.cpp
[mult.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/compiler/mult.cpp
[Matrix.hh]: https://github.com/divakarvi/bk-spca/blob/master/proc/compiler/Matrix.hh
[cpp-mult.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/compiler/cpp-mult.cpp
[proc.compiler.Makefile]: https://github.com/divakarvi/bk-spca/blob/master/proc/compiler/Makefile
[easyxmm.hh]: https://github.com/divakarvi/bk-spca/blob/master/proc/peak/easyxmm.hh
[addxmm.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/peak/addxmm.cpp
[addmultxmm.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/peak/addmultxmm.cpp
[peak_onlyreg.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/peak/peak_onlyreg.cpp
[peak_withloads.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/peak/peak_withloads.cpp
[peak_loadnstore.cpp]: https://github.com/divakarvi/bk-spca/blob/master/proc/peak/peak_loadnstore.cpp
[asm4xnx4.hh]: https://github.com/divakarvi/bk-spca/blob/master/proc/microk/asm4xnx4.hh
[asm4x1x4.s]: https://github.com/divakarvi/bk-spca/blob/master/proc/microk/asm4x1x4.s
[asm4x4x4.s]: https://github.com/divakarvi/bk-spca/blob/master/proc/microk/asm4x4x4.s
[asm4x200x4.s]: https://github.com/divakarvi/bk-spca/blob/master/proc/microk/asm4x200x4.s

[bk.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Chapter-4
[bk.4.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-4.1
[bk.4.1.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.1.1
[bk.4.1.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.1.2
[bk.4.1.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.1.3
[bk.4.1.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.1.4
[bk.4.1.5]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.1.5
[bk.4.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-4.2
[bk.4.2.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.2.1
[bk.4.2.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.2.2
[bk.4.2.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.2.3
[bk.4.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-4.3
[bk.4.3.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.3.1
[bk.4.3.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.3.2
[bk.4.3.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.3.3
[bk.4.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-4.4
[bk.4.4.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.4.1
[bk.4.4.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-4.4.2
[array_walk.hh]: https://github.com/divakarvi/bk-spca/blob/master/mem/latency/array_walk.hh
[array_walk.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mem/latency/array_walk.cpp
[time_walk.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mem/latency/time_walk.cpp
[latency_utils.hh]: https://github.com/divakarvi/bk-spca/blob/master/mem/latency/latency_utils.hh
[latency_utils.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mem/latency/latency_utils.cpp
[latency.hh]: https://github.com/divakarvi/bk-spca/blob/master/mem/latency/latency.hh
[latency.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mem/latency/latency.cpp
[sumcopy.hh]: https://github.com/divakarvi/bk-spca/blob/master/mem/bandwidth/sumcopy.hh
[sumcopy.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mem/bandwidth/sumcopy.cpp
[transpose.hh]: https://github.com/divakarvi/bk-spca/blob/master/mem/transpose/transpose.hh
[transpose.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mem/transpose/transpose.cpp
[blockmult.hh]: https://github.com/divakarvi/bk-spca/blob/master/mem/blockmult/blockmult.hh
[blockmult.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mem/blockmult/blockmult.cpp
[serial.hh]:https://github.com/divakarvi/bk-spca/blob/master/mem/diskio/serial.hh
[serial.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mem/diskio/serial.cpp
[calc_latency.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mem/diskio/calc_latency.cpp
[vmemmap.c]: https://github.com/divakarvi/bk-spca/blob/master/mem/virtualm/vmemmap.c

[bk.5]: https://divakarvi.github.io/bk-spca/spca.html#toc-Chapter-5
[bk.5.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-5.1
[bk.5.1.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.1.1
[bk.5.1.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.1.2
[bk.5.1.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.1.3
[bk.5.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-5.2
[bk.5.2.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.2.1
[bk.5.2.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.2.2
[bk.5.2.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.2.3
[bk.5.2.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.2.4
[bk.5.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-5.3
[bk.5.3.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.3.1
[bk.5.3.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.3.2
[bk.5.3.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.3.3
[bk.5.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-5.4
[bk.5.4.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.4.
[bk.5.4.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.4.2
[bk.5.4.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-5.4.3

[omp.leibniz.hh]: https://github.com/divakarvi/bk-spca/blob/master/omp/leibniz/leibniz.hh
[omp.leibniz.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/leibniz/leibniz.cpp
[ompfor.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/leibniz/ompfor.cpp
[parallel.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/leibniz/parallel.cpp
[section.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/leibniz/section.cpp
[printstuff.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/leibniz/printstuff.cpp
[parallel.hh]: https://github.com/divakarvi/bk-spca/blob/master/omp/overhead/parallel.hh
[parallelA.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/overhead/parallelA.cpp
[overhead.hh]: https://github.com/divakarvi/bk-spca/blob/master/omp/overhead/overhead.hh
[barrier.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/overhead/barrier.cpp
[ovhd.ompfor.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/overhead/ompfor.cpp
[omp.latency.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/latency/latency.cpp
[readwrcopy.hh]: https://github.com/divakarvi/bk-spca/blob/master/omp/bw2mem/readwrcopy.hh
[readwrcopy.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/bw2mem/readwrcopy.cpp
[transpose.hh]: https://github.com/divakarvi/bk-spca/blob/master/omp/transpose/transpose.hh
[transpose.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/transpose/transpose.cpp
[fft_thrd.hh]: https://github.com/divakarvi/bk-spca/blob/master/omp/fft/fft_thrd.hh
[fft_thrd.cpp]: https://github.com/divakarvi/bk-spca/blob/master/omp/fft/fft_thrd.cpp
[mesg.hh]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/intro/mesg.hh
[mesg_plain.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/intro/mesg_plain.cpp
[mesg_mutex.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/intro/mesg_mutex.cpp
[mesg_spin.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/intro/mesg_spin.cpp
[print_mesg.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/intro/print_mesg.cpp
[pthreads.leibniz.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/intro/leibniz.cpp
[thrd_create_ovhd.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/overhead/thrd_create_ovhd.cpp
[altadd_omp.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/ompp/altadd_omp.cpp
[altadd_c.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/ompp/altadd_c.cpp
[altadd_mtx.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/ompp/altadd_mtx.cpp
[altadd_spin.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/ompp/altadd_spin.cpp
[altadd_cond.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pthreads/ompp/altadd_cond.cpp
[linux.kernel.patch.11]: https://github.com/divakarvi/bk-spca/blob/master/kernel-linux/patches/dv.11.patch
[linux.kernel.patch.22]: https://github.com/divakarvi/bk-spca/blob/master/kernel-linux/patches/dv.22.patch
[dvmesg.h]: https://github.com/divakarvi/bk-spca/blob/master/kernel-linux/syscall/dvmesg.h
[dvmesg.c]: https://github.com/divakarvi/bk-spca/blob/master/kernel-linux/syscall/dvmesg.c
[syscall.c]: https://github.com/divakarvi/bk-spca/blob/master/kernel-linux/syscall/syscall.c
[time_syscall.cpp]: https://github.com/divakarvi/bk-spca/blob/master/kernel-linux/syscall/time_syscall.cpp
[hanoi.cpp]: https://github.com/divakarvi/bk-spca/blob/master/vmarea/hanoi.cpp
[stacksize.cpp]: https://github.com/divakarvi/bk-spca/blob/master/vmarea/stacksize.cpp
[segf.hh]: https://github.com/divakarvi/bk-spca/blob/master/vmarea/segf.hh
[segf.cpp]: https://github.com/divakarvi/bk-spca/blob/master/vmarea/segf.cpp
[induce_segf.cpp]: https://github.com/divakarvi/bk-spca/blob/master/vmarea/induce_segf.cpp
[maccess.hh]: https://github.com/divakarvi/bk-spca/blob/master/vmarea/maccess.hh
[maccess.cpp]: https://github.com/divakarvi/bk-spca/blob/master/vmarea/maccess.cpp
[induce_merr.cpp]: https://github.com/divakarvi/bk-spca/blob/master/vmarea/induce_merr.cpp

