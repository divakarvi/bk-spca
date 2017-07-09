## Scientific Programming and Computer Architecture
### Divakar Viswanath
#### MIT Press, 2017
#### ISBN 9780262036290 

The complete text of this book is available in html at [this link][bk]. The html is published under a Creative Commons license. The copyright remains with the publisher. The html has a few blemishes. For example, occasionally when the same source is split between multiple listings, the line numbering is not continued between the listings as it should be. The html does not have an index, although it is searchable. For a more correct and complete version, see the printed book:

1. [amazon.com](https://www.amazon.com/Scientific-Programming-Architecture-Engineering-Computation/dp/0262036290/ref=sr_1_1?s=books&ie=UTF8&qid=1497440910&sr=1-1)
2. [bn.com](https://www.barnesandnoble.com/w/scientific-programming-and-computer-architecture-divakar-viswanath/1125986348?ean=9780262036290)

This README document provides context for the source code in this GIT repository, with links to the html text as well as sources in the repository.

* [Preface](#preface) ([html][bk.preface])
* [C/C++ Review](#chapter1) ([html][bk.1])
* [C/C++: Libraries and Makefiles](#chapter2) ([html][bk.2])
* [The Processor](#chapter3) ([html][bk.3])
* [Memory](#chapter4) ([html][bk.4])
* [Threads and Shared Memory](#chapter5) ([html][bk.5])
* [Special Topic: Networks and Message Passing](#chapter6) ([html][bk.6])
* [Special Topic: The Xeon Phi Coprocessor](#chapter7) ([html][bk.7])
* [Special Topic: Graphics Coprocessor](#chapter8) ([html][bk.8])
* [Appendix: Machines used, Plotting, Python, GIT, Cscope, and gcc](#chapter9) ([html][bk.9])

# <a name="preface"></a>[Preface][bk.preface]

What makes computer programs fast or slow? To answer this question, we have to get behind the abstractions of programming languages and look at how a computer really works. This book examines and explains a variety of scientific programming models (programming models relevant to scientists) with an emphasis on how programming constructs map to different parts of the computer's architecture. Two themes emerge: program speed and program modularity.  Throughout this book, the premise is to "get under the hood," and the discussion is tied to specific programs. 

The book digs into linkers, compilers, operating systems, and computer architecture to understand how the different parts of the computer interact with programs. It begins with a review of C/C++ and explanations of how libraries, linkers, and Makefiles work. Programming models covered include Pthreads, OpenMP, MPI, TCP/IP, and CUDA. The emphasis on how computers work leads the reader into computer architecture and occasionally into the operating system kernel. The operating system studied is Linux, the preferred platform for scientific computing. Linux is also open source, which allows users to peer into its inner workings. A brief appendix provides a useful table of machines used to time programs.

# [1][bk.1] <a name="chapter1"></a> C/C++ Review

* [An example: The Aitken iteration](#s1.1) ([html][bk.1.1])
	* [Leibniz series and the logarithmic series](#s1.1.1) ([html][bk.1.1.1])
	* [Modular organization of sources](#s1.1.2) ([html][bk.1.1.2])
* [C Review](#s1.2) ([html][bk.1.2])
	* [Header files](#s1.2.1) ([html][bk.1.2.1])
	* [Arrays and pointers](#s1.2.2) ([html][bk.1.2.2])
	* [The Aitken iteration using arrays and pointers](#s1.2.3) ([html][bk.1.2.3])
	* [Declarations and definitions](#s1.2.4) ([html][bk.1.2.4])
	* [Function calls and the compilation process](#s1.2.5) ([html][bk.1.2.5])
* [C++ Review](#s1.3) ([html][bk.1.3])
	* [The Vector class](#s1.3.1) ([html][bk.1.3.1])
	* [Aitken transformation in C++](#s1.3.2) ([html][bk.1.3.2])
* [A little Fortran](#s1.4) ([html][bk.1.4])

The review of C/C++ in this chapter attempts to bring out certain features that people often do not learn from a single course or two.

### [1.1][bk.1.1] <a name="s1.1"></a> An example: The Aitken iteration

The Aitken transformation maps a sequence of numbers to another sequence of numbers. It serves as the vehicle to introduce aspects of C, C++, and Fortran in this chapter. 

#### [1.1.1][bk.1.1.1] <a name="s1.1.1"></a> Leibniz series and the logarithmic series

#### [1.1.2][bk.1.1.2] <a name="s1.1.2"></a> Modular organization of sources

Before we delve into the syntax of C/C++, let us look at how to structure a program for the Aitken iteration.

[linking/aitken][linking.aitken]

### [1.2][bk.1.2] <a name="s1.2"></a> C Review

In this review, we go over a few features of C, emphasizing points that introductory classes often miss. Thus, we discuss header files, arrays, and pointers, with emphasis on the distinction between lvalues and rvalues, as well as the distinction between declarations and definitions.

#### [1.2.1][bk.1.2.1] <a name="s1.2.1"></a> Header files

A header file in C is an interface to one or more source files.

[aitken.h][aitken.h]

#### [1.2.2][bk.1.2.2] <a name="s1.2.2"></a> Arrays and pointers

Arrays and pointers are the heart of the C language. In C, arrays and pointers are almost interchangeable.

[easypointers.c][easypointers.c]

#### [1.2.3][bk.1.2.3] <a name="s1.2.3"></a> The Aitken iteration using arrays and pointers

Here we use the Aitken example to illustrate how arrays may be passed as pointers.

[aitken.c][aitken.c]

#### [1.2.4][bk.1.2.4] <a name="s1.2.4"></a> Declarations and definitions

Names introduced into a C program are for the most part names of either functions or variables. The names can be introduced as either declarations or definitions.

#### [1.2.5][bk.1.2.5] <a name="s1.2.5"></a> Function calls and the compilation process

Here we take a look at the mechanism of function calls and the compilation process. 

[leibniz.c][leibniz.c]

[logseries.c][logseries.c]

[Makefile][aitken.MakefileC]

### [1.3][bk.1.3] <a name="s1.3"></a> C++ Review

The C++ language is something of a compromise to provide the facilities of high-level languages without sacrificing the speed of C. Despite its name, it is not an incremental extension of C. It is a colossal expansion of C syntax.

#### [1.3.1][bk.1.3.1] <a name="s1.3.1"></a> The Vector class

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

#### [1.3.2][bk.1.3.2]<a name="s1.3.2"></a> Aitken transformation in C++

[Aitken.hh][Aitken.hh]

[Aitken.cpp][Aitken.cpp]

[Leibniz.cpp][Leibniz.cpp]

[Logseries.cpp][Logseries.cpp]

### [1.4][bk.1.4] <a name="s1.4"></a>A little Fortran

The syntax is deliberately Fortran 77 and not the newer varieties. When the need to use old Fortran codes arises, it is often Fortran of this variety. We do not recommend programming in Fortran.

[aitkenf.f][aitkenf.f]

[leibnizf.f][leibnizf.f]

[logseriesf.f][logseriesf.f]

# [2][bk.2] <a name="chapter2"></a> C/C++: Libraries and Makefiles

* [Mixed-language programming](#s2.1) ([html][bk.2.1])
	* [Transmutation of names from source to object files](#s2.1.1) ([html][bk.2.1.1])
	* [Linking Fortran programs with C and C++](#s2.1.2) ([html][bk.2.1.2])
* [Using BLAS and LAPACK libraries](#s2.2) ([html][bk.2.2])
	* [Arrays, matrices, and leading dimensions](#s2.2.1) ([html][bk.2.2.1])
	* [BLAS and LAPACK](#s2.2.2) ([html][bk.2.2.2])
	* [C++ class interface to BLAS/LAPACK](#s2.2.3) ([html][bk.2.2.3])
* [Building programs using GNU Make](#s2.3) ([html][bk.2.3])
	* [The utils/ folder](#s2.3.1) ([html][bk.2.3.1])
	* [Targets, prerequisites, and dependency graphs](#s2.3.2) ([html][bk.2.3.2])
	* [Make variables in makevars.mk](#s2.3.3) ([html][bk.2.3.3])
	* [Pattern rules in makevars.mk](#s2.3.4) ([html][bk.2.3.4])
	* [Phony targets in makevars.mk](#s2.3.5) ([html][bk.2.3.5])
	* [Recursive make and .d files](#s2.3.6) ([html][bk.2.3.6])
	* [Beyond recursive make](#s2.3.7) ([html][bk.2.3.7])
	* [Building your own library](#s2.3.8) ([html][bk.2.3.8])
* [The Fast Fourier Transform](#s2.4) ([html][bk.2.4])
	* [The FFT algorithm in outline](#s2.4.1) ([html][bk.2.4.1])
	* [FFT using MKL](#s2.4.2) ([html][bk.2.4.2])
	* [FFT using FFTW](#s2.4.3) ([html][bk.2.4.3])
	* [Cycles and histograms](#s2.4.4) ([html][bk.2.4.4])
	* [Optimality of FFT implementations](#s2.4.5) ([html][bk.2.4.5])
	
There are two powerful ideas for bringing greater modularity into C/C++ programs, and both of them will be introduced in this chapter. The first idea is to combine object files into libraries, and the second idea is to organize program sources into a source tree.

### [2.1][bk.2.1] <a name="s2.1"></a> Mixed-language programming

We look at the map from sources to object files as a precursor to mixed-language programming.  Beyond the transmutation of names, which differs between the three languages, the additional issue of runtime libraries has to be dealt with.

#### [2.1.1][bk.2.1.1] <a name="s2.1.1"></a> Transmutation of names from source to object files

If the source has a statement such as a=b+c, for example, the names a, b, c typically disappear from the object file. Not all names present in the source disappear, however. Those names present in the source that survive in the object file are some of the most important.

[aitken.c][aitken.c]

[Aitken.cpp][Aitken.cpp]

#### [2.1.2][bk.2.1.2] <a name="s2.1.2"></a> Linking Fortran programs with C and C++

To use Fortran functions within C or C++ programs, the naming used for the Fortran functions in C or C++ has to be cognizant of the way the names in the source files are altered in the object file. We want the names to agree in the object files because it is the object files and not the source files that get linked against each other.

[leibnizFinC.c][leibnizFinC.c]

[leibnizFinCPP.cpp][leibnizFinCPP.cpp]

### [2.2][bk.2.2] <a name="s2.2"></a> Using BLAS and LAPACK libraries

BLAS and LAPACK are widely used numerical linear algebra libraries.

#### [2.2.1][bk.2.2.1] <a name="s2.2.1"></a> Arrays, matrices, and leading dimensions

We look at multidimensional arrays in C/C++ briefly and then at the distinction between column-major format and row-major format.

[array_2d.c][array_2d.c]

#### [2.2.2][bk.2.2.2] <a name="s2.2.2"></a> BLAS and LAPACK
BLAS and LAPACK functions, to which we now turn, typically have long argument lists.

[mkl_blas.h][mkl_blas.h]

[mkl_lapack.h][mkl_lapack.h]

#### [2.2.3][bk.2.2.3] <a name="s2.2.3"></a> C++ class interface to BLAS/LAPACK

The [Vector class][Vector.hh] is an attempt to capture the general concept of vectors. The LU_Solve class of this section is narrowly defined. It does just one thing, which is to provide an easy interface to LAPACK's LU solver functions dgetrf() and dgetrs().

[lusolve.hh][lusolve.hh]

[lusolve.cpp][lusolve.cpp]

[test_lusolve.cpp][test_lusolve.cpp]

[test_lusolve.py][test_lusolve.py]

### [2.3][bk.2.3] <a name="s2.3"></a> Building programs using GNU Make
The organization of source files into directories and subdirectories is the heart of modular programming. The make utility provides a method for building a program from its source tree.

#### [2.3.1][bk.2.3.1] <a name="s.2.3.1"></a> The utils/ folder
The modules in utils/ facilitate timing, generation of random numbers, gathering statistics, making tables, and manipulation of double arrays. All the modules in utils/ are used extensively. We avoid mentioning the modules in utils for the most part, but a brief discussion is given here.

[utils directory listing][utils]

[utils.hh][utils.hh]

[utils.cpp][utils.cpp]

[test_lusolve.cpp][test_lusolve.cpp] showing how utils are used.

#### [2.3.2][bk.2.3.2] <a name="s2.3.2"></a> Targets, prerequisites, and dependency graphs

The first purpose of a Makefile is to capture the dependency graph between headers, sources, object files, and executables.

[Makefile 1][aitken.MakefileC]

[Makefile 2][aitken.MakefileC2]

#### [2.3.3][bk.2.3.3] <a name="s2.3.3"></a> Make variables in makevars.mk
Almost all Makefiles have make variables.

[Root of source tree][bk-spca]

[makevars.mk][makevars.mk]

#### [2.3.4][bk.2.3.4] <a name="s2.3.4"></a> Pattern rules in makevars.mk

The recipes have a formulaic character. For example, if the target is an object file to be built from a C++ source, the recipe generally invokes the C++ compiler specified by CPP using the options listed in CFLAGS. Pattern rules take advantage of the repetitive nature of recipes to simplify their specification.

[makevars.mk][makevars.mk]

#### [2.3.5][bk.2.3.5] <a name="s2.3.5"></a> Phony targets in makevars.mk

Phony targets are always assumed to be out of date.

[makevars.mk][makevars.mk]

#### [2.3.6][bk.2.3.6] <a name="s2.3.6"></a> Recursive make and .d files

When the source and object files required to build a single executable reside in several subdirectories, recursive make may be used to complete the build.

[Makefile with recursion][Makefile.recursive]

[Makefile that is called recursively][Makefile.rcalled]

#### [2.3.7][bk.2.3.7] <a name="s2.3.7"></a> Beyond recursive make

Modularity and simplicity are two virtues of recursive make. However, there are several problems with it.

#### [2.3.8][bk.2.3.8] <a name="s2.3.8"></a> Building your own library


We end our discussion of make by showing how to build and link static and shared libraries. Libraries provide a level of modularity beyond what is possible within a source tree. Any program that is linked against a library in effect treats the external library as a module.

[Makefile for building static/shared library][Makefile.lib]

[libpath.sh][libpath.sh]

### [2.4][bk.2.4] <a name="s2.4"></a> The Fast Fourier Transform

In this last section, we look at the speed of a few implementations of the Fast Fourier Transform (FFT). Program speed is a major theme of the rest of this book.

#### [2.4.1][bk.2.4.1] <a name="s2.4.1"></a> The FFT algorithm in outline

The power of 2 FFT moves through lg(N) levels. The number of arithmetic operations in each level consists of N/2 twiddle factor multiplications, N/2 additions, and N/2 subtractions.

#### [2.4.2][bk.2.4.2] <a name="s2.4.2"></a> FFT using MKL

[fft_mkl.hh][fft_mkl.hh]

[fft_mkl.cpp][fft_mkl.cpp]

#### [2.4.3][bk.2.4.3] <a name="s2.4.3"></a> FFT using FFTW

[fft_fftw.hh][fft_fftw.hh]

[fft_fftw.cpp][fft_fftw.cpp]

#### [2.4.4][bk.2.4.4] <a name="s2.4.4"></a> Cycles and histograms

How many cycles does a one-dimensional complex FFT of dimension 210 = 1024 take? Program performance is influenced by so many factors that the question is too simple to be answered. 

[hist_fft.cpp][hist_fft.cpp]

#### [2.4.5][bk.2.4.5] <a name="s2.4.5"></a> Optimality of FFT implementations

What is the fastest possible speed of an FFT implementation? The many system features that intrude into the histograms hint that this question may not have a straightforward answer.

[nr.hh][nr.hh]

[nr.cpp][nr.cpp] (FFT implementation from Numerical Recipes)

[time_fft.cpp][time_fft.cpp]

# [3][bk.3] <a name="chapter3"></a> The Processor

* [Overview of the x86 architecture](#s3.1)
	*[64-bit x86 architecture](#s3.1.1)
	*[64-bit x86 assembly programming](#s3.1.2)
	*[The Time Stamp Counter](#s3.1.3)
	*[Cache parameters and the CPUID instruction](#s3.1.4)
* [Compiler optimizations](#s3.2)
	*[Preliminaries](#s3.2.1)
	*[Loop unrolling](#s3.2.2)
	*[Loop fusion](#s3.2.3)
	*[Unroll and jam](#s3.2.4)
	*[Loop interchange](#s3.2.5)
	*[C++ overhead](#s3.2.6)
	*[A little compiler theory](#s3.2.7)
* [Optimizing for the instruction pipeline](#s3.3)
	*[Instruction pipelines](#s3.3.1)
	*[Chipsets](#s3.3.2)
	*[Peak floating point performance](#s3.3.3)
	*[Microkernel for matrix multiplication](#s3.3.4)


Even for many simple programs, the compilers of today do not generate optimal code or anything like it. Good, or nearly optimal, programs for modern platforms can be written only with a knowledge of the nuances of the computer’s hardware. With that in mind, this chapter, indeed the rest of this book, will introduce programming models in close concert with computer architecture.

### [3.1][bk.3.1] <a name="s3.1"></a> Overview of the x86 architecture

This section is a basic introduction to the x86 instruction architecture, which has dominated since its introduction in 1978. We look at registers and a little bit of assembly programming.

#### [3.1.1][bk.3.1.1] <a name="s3.1.1"></a> 64-bit x86 architecture

When we write programs, we do so with an awareness of memory. Every variable name is ultimately the name for a segment of memory. However, in most programming, we have no awareness of the registers at all. Registers are very special locations because they are wired into the circuits for carrying out arithmetic and logical operations.

#### [3.1.2][bk.3.1.2] <a name="s3.1.2"></a> 64-bit x86 assembly programming

The reader may find it a little puzzling that “double” (or “long”) is used for 32-bit operands and “quad” for 64-bit operands. A word in the original 8086 machine of 1978 was 16 bits. Thus, double words are 32 bits and quad words are 64 bits, as a result of a choice made long ago.

[add.c][add.c]

[add.s][add.s]

[addtwo.s][addtwo.s]

[addmany.s][addmany.s]

#### [3.1.3][bk.3.1.3] <a name="s3.1.3"></a> The Time Stamp Counter

To do anything useful with assembly code, it helps to have a method to make it part of a C or C++ program. The asm directive allows us to embed assembly code in a C or C++ program. RDTSC or rdtsc is an x86 machine instruction for reading the Time Stamp Counter. This instruction can be embedded in C/C++ programs.

[TimeStamp.hh][TimeStamp.hh]

#### [3.1.4][bk.3.1.4] <a name="s3.1.4"></a> Cache parameters and the CPUID instruction

We will take a closer look at cache memory in the next chapter. Here we will use the cpuid instruction to ask the processor to report information about its cache and thus give us a preliminary idea of cache memory.

[cpuid.cpp][cpuid.cpp]

### [3.2][bk.3.2] <a name="s3.2"></a> Compiler Optimizations

Anyone who seeks to write fast programs must begin by grasping what compilers do. C/C++ programs are turned into machine instructions by the compiler. The speed of the program can vary by a factor of 10, or even more, depending on the instruction stream the compiler generates. While generating machine instructions, compilers can alter the structure of the program considerably.

#### [3.2.1][bk.3.2.1] <a name="s3.2.1"></a> Preliminaries

Cache flush, which we describe here, is one way to eliminate cache effects. We also review compiler options. The C++ classes PyPlot for plotting, StatVector for gathering simple statistics, and Table for making tables are used extensively in the source code for this book. However, they appear only rarely in the text. All three classes are described in the appendix.

#### [3.2.2][bk.3.2.2] <a name="s3.2.2"></a> Loop unrolling

Table 3.2↑ shows that turning on compiler optimization doubles the speed of the code. Rewriting leibniz() to enable loop unrolling, which is one of the most important optimizations, doubles the speed once again. We will use the leibniz() function and its variants to explain how loop unrolling works.

[leibniz.cpp][leibniz.cpp]

#### [3.2.3][bk.3.2.3] <a name="s3.2.3"></a> Loop fusion

Because the speed of modern x86 computers relies on instruction-level parallelism and vector registers, it is often a good idea to have a lot of parallelism in the innermost loops. Loop fusion addresses the situation where we have two distinct loops. It is assumed that the iterations of each loop have dependencies that make loop unrolling ineffective. In such a scenario, merging the bodies of the two loops may be the best way to produce a loop body that is amenable to instruction-level parallelism. The transformation where distinct loop bodies are merged is called loop fusion.

[sincos.cpp][sincos.cpp]

#### [3.2.4][bk.3.2.4] <a name="s3.2.4"></a> Unroll and jam

In this section, we will study a compiler optimization that applies to nested loops. So far we have considered loop unrolling and loop fusion. In loop nests, it may be desirable to unroll the outer loop and fuse several copies of the inner loop that result. That is the unroll and jam transformation.

[sinetable.cpp][sinetable.cpp]

#### [3.2.5][bk.3.2.5] <a name="s3.2.5"></a> Loop interchange

Loop interchange is the next compiler optimization for discussion, and matrix multiplication is the example we use to bring it out.

[mult.cpp][mult.cpp]

#### [3.2.6][bk.3.2.6] <a name="s3.2.6"></a> C++ overhead

[Matrix.hh][Matrix.hh]

[cpp-mult.cpp][cpp-mult.cpp]

[Makefile][proc.compiler.Makefile] (showing inlining for C++)

#### [3.2.7][bk.3.2.7] <a name="s3.2.7"></a> A little compiler theory

The compiler’s view of a program is quite different from that of a human programmer. A human programmer has a problem to be solved and an idea to solve that problem that is expressed as a computer program. What the compiler sees is a sequence of statements that obey the syntactic rules of the programming language. The global view of what the program does is lost.

### [3.3][bk.3.3] <a name="s3.3"></a> Optimizing for the instruction pipeline

Earlier, we found that MKL’s fast Fourier transform and matrix multiplication can be 10 times faster than ordinary C/C++ programs. If the C++ program is written without care, the speedup can even be a factor of 100. What does Intel’s MKL do to be so much faster than ordinary C/C++ programs? The biggest part of the answer to that question is optimizing for the instruction pipeline, which is the topic of the present section.

#### [3.3.1][bk.3.3.1] <a name="s3.3.1"></a> Instruction pipelines

The automobile assembly line offers a useful point of comparison to clarify concepts. An automobile assembly line may take 48 hours to assemble a single car. However, thanks to pipelining and multiple assembly lines, the factory may produce a car every minute. For such a factory, the latency would be 48 hours and the bandwidth 1 car per minute.

#### [3.3.2][bk.3.3.2] <a name="s3.3.2"></a> Chipsets

The processors are central to the computer but are only one among the many components that make up a computer or compute node. Some of the other components are DRAM memory, graphics processor, hard disk, solid state storage, network adapter, keyboard, and monitor. To understand how the processor is connected to all the components, we have to look at chipsets. Chipsets are chips used to assemble computers from many components.

#### [3.3.3][bk.3.3.3] <a name="s3.3.3"></a> Peak floating point performance

In this section, we write a few programs that do nothing meaningful but that get close to the peak performance of 4 flops per cycle using SSE2 instructions. Optimization for the more recent AVX2 instruction set is dealt with in the exercises.

[easyxmm.hh][easyxmm.hh]

[addxmm.cpp][addxmm.cpp]

[addmultxmm.cpp][addmultxmm.cpp]

[peak_onlyreg.cpp][peak_onlyreg.cpp]

[peak_withloads.cpp][peak_withloads.cpp]

[peak_loadnstore.cpp][peak_loadnstore.cpp]

#### [3.3.4][bk.3.3.4] <a name="s3.3.4"></a> Microkernel for matrix multiplication

In this section, we write programs that multiply matrices of dimensions 4 × n and n × 4 using slightly more than 8n cycles. The microkernel with n = 200 is the basis of matrix multiplication routines given in the next chapter. The programs are limited to SSE2 instructions.

[asm4xnx4.hh][asm4xnx4.hh]

[asm4x1x4.s][asm4x1x4.s]

[asm4x4x4.s][asm4x4x4.s]

[asm4x200x4.s][asm4x200x4.s]


# [4][bk.4] <a name="chapter4"></a> Memory
* [DRAM and cache memory](#s4.1)
	*[DRAM and cache memory](#s4.1.1)
	*[Cache memory](#s4.1.2)
	*[Physical memory and virtual memory](#s4.1.3)
	*[Latency to DRAM memory: First attempts](#s4.1.4)
	*[Latency to DRAM](#s4.1.5)
* [Optimizing memory access](#s4.2)
	*[Bandwidth to DRAM](#s4.2.1)
	*[Matrix transpose](#s4.2.2)
	*[Optimized matrix multiplication](#s4.2.3)
* [Reading from and writing to disk](#s4.3)
	*[C versus C++](#s4.3.1)
	*[Latency to disk](#s4.3.2)
	*[Bandwidth to disk](#s4.3.3)
* [Page tables and virtual memory](#s4.4)
	*[Partitioning the virtual address space](#s4.4.1)
	*[Physical address space and page tables](#s4.4.2)

In modern computers, including supercomputers, desktops, laptops, and all kinds of mobile devices, memory invariably refers to DRAM. Although file systems reside on hard disk or some other storage medium, when a program is running, much of the data that is handled is from DRAM.

### [4.1][bk.4.1] <a name="s4.1"></a> DRAM and cache memory

To access a register, the latency is 1 cycle. To access the L1 cache, the latency is 4 cycles. The latency to DRAM, however, can be hundreds of cycles. It is estimated that 40% of the instructions access DRAM, and therefore hiding this large latency to DRAM is a major part of computer architectural design. It is important for the programmer to understand when this latency to DRAM can be hidden.Briefly, the latency to DRAM can be effectively hidden when the data access is sequential and predictable. It cannot be hidden in linked lists and other dynamic data structures because the location of the next item is determined by a link from the present item. However, even in such situations, programming techniques can mitigate the latency to DRAM.

#### [4.1.1][bk.4.1.1] <a name="s4.1.1"></a> DRAM memory

At the finest level, DRAM is an array of bits. Arrays of bits are organized into banks, ranks, and channels. There is a memory controller on each processor package that drives the memory channels.

#### [4.1.2][bk.4.1.2] <a name="s4.1.2"></a> Cache memory

An instruction such as movq %rax, %rdx, which moves one register to another, takes a single cycle. However, a load instruction such as movq (%rsi), %rdx, which moves a quad word from memory to a register, can take more than 100 cycles.

#### [4.1.3][bk.4.1.3] <a name="s4.1.3"></a> Physical memory and virtual memory

Virtual memory is implemented by the operating system and the processor hardware working in concert. Virtual memory is an illusion that simplifies programming, compilation, and linking in addition to keeping programs from interfering with each other. As the program runs, the memory addresses generated by a program are automatically mapped to physical addresses in the DRAM memory.

#### [4.1.4][bk.4.1.4] <a name="s4.1.4"></a> Latency to DRAM memory: First attempts

In this section, we make our first attempts at measuring the access time to DRAM memory. All our attempts fail, but we are led into certain aspects of the memory system that have a bearing on program performance.

[array_walk.hh][array_walk.hh] (accessList in text renamed to chain_walk in code)

[array_walk.cpp][array_walk.cpp]

[time_walk.cpp][time_walk.cpp]

#### [4.1.5][bk.4.1.5] <a name="s4.1.5"></a> Latency to DRAM

Our earlier attempts to measure latency to DRAM memory failed because we did not account for the overhead of creating and accessing page table entries. The more careful program in this section breaks instruction-level parallelism, ensures that none of the cache lines accessed is from L1, L2, or L3 cache, and accesses all of the 256 cache lines within four pages of memory (so that TLB misses are not a factor).

[latency_utils.hh][latency_utils.hh]

[latency_utils.cpp][latency_utils.cpp]

[latency.hh][latency.hh]

[latency.cpp][latency.cpp]

### [4.2][bk.4.2] <a name="s4.2"></a> Optimizing memory access

In this section, we look at optimization of memory access using three examples.

#### [4.2.1][bk.4.2.1] <a name="s4.2.1"></a> Bandwidth to DRAM

The most predictable and common pattern of memory access is to access a long line of data in sequence. Every memory controller is likely to be optimized to handle that pattern efficiently.

[sumcopy.hh][sumcopy.hh]

[sumcopy.cpp][sumcopy.cpp]

#### [4.2.2][bk.4.2.2] <a name="s4.2.2"></a> Matrix transpose

The example we study here is out-of-place matrix transpose. It is always best to access data sequentially with unit stride, but when a matrix is transposed to another matrix stored in the same column-major format, there is no way to access both matrices with unit stride. In many problems of this type, it is useful to break up the data into blocks.

[transpose.hh][transpose.hh]

[transpose.cpp][transpose.cpp]

#### [4.2.3][bk.4.2.3] <a name="s4.2.3"></a> Optimized matrix multiplication

Here we assume the matrices to be in DRAM memory and not in cache, and we show how to optimize matrix multiplication. In outline, the basic idea remains to multiply in blocks, but intermediate blocks are stored in scratch space and in convenient formats to minimize TLB and cache misses. As far as possible, data is stored in a format that enables sequential access with unit stride. The actual execution of this idea can make it look more complicated than it is, but the idea is elegant as well as possibly applicable to many other problems.

[blockmult.hh][blockmult.hh]

[blockmult.cpp][blockmult.cpp]

### [4.3][bk.4.3] <a name="s4.3"></a> Reading from and writing to disk

The data in registers and DRAM memory disappears when the computer is powered off. In contrast, hard disk storage is permanent. The hard disk is a collection of platters. Bits stored on circular tracks on either side of the platters are turned on and off using a magnetic field. More than 100 billion bits can be packed into a single square inch of a platter.

#### [4.3.1][bk.4.3.1] <a name="s4.3.1"></a> C versus C++

With regard to the programming technique for reading and writing files, the simplest lesson is also the most valuable. The C interface can be much faster than the C++ interface as we show and for reasons we explain.

[serial.hh][serial.hh]

[serial.cpp][serial.cpp]

#### [4.3.2][bk.4.3.2] <a name="s4.3.2"></a> Latency to disk

The measurement of latency to hard disk brings up issues not unlike the ones encountered in measuring the latency to DRAM memory. The true latency to hard disk is not easily visible to simple computer programs.

[serial.hh][serial.hh]

[calc_latency.cpp][calc_latency.cpp]

#### [4.3.3][bk.4.3.3] <a name="s4.3.3"></a> Bandwidth to disk

A single array cannot exceed the available DRAM, although it is desirable to work with files much larger than the size of DRAM memory when estimating bandwidth to disk.

[serial.hh][serial.hh]

[serial.cpp][serial.cpp]

### [4.4][bk.4.4] <a name="s4.4"></a> Page tables and virtual memory

In this section, we make our first foray into the operating system kernel. The cost of a single write to memory by an instruction such as movq %rax, (%rsi) brings in many layers of complexity. It could be a cache hit or a cache miss. If the DRAM memory is accessed, the cost of the access depends on preceding and following memory accesses. It depends on the manner in which the memory controllers operate the DRAM devices. It depends on the parallelism in the instruction stream. It depends on the pressure on dispatch ports in the instruction pipeline among other factors. On top of the layers of complexity engineered into hardware, the operating system introduces yet more complexity.

#### [4.4.1][bk.4.4.1] <a name="s4.4.1"></a> Partitioning the virtual address space

Much of virtual address space is an unclaimed wilderness. Figure 4.8 is an incomplete schematic view of the partitioning of the virtual address space of a typical user process. Much of the virtual address space is taken up by the unutilized regions shown as empty gaps.

[vmemmap.c][vmemmap.c]

#### [4.4.2][bk.4.4.2] <a name="s4.4.2"></a> Physical address space and page tables

Program speed is influenced by the paging system in several ways. If a memory word is found in L1 cache and its virtual address is found in TLB, the latency of the memory access would be just 4 cycles. However, if there is a TLB miss, the latency can go up to several hundred cycles. If there is a page fault, the latency of a single memory access can go up to millions, even billions, of cycles.


# [5][bk.5] <a name="chapter5"></a> Threads and Shared Memory

* [Introduction to OpenMP](#s5.1)
	*[OpenMP syntax](#s5.1.1)
	*[Shared variables and OpenMP's memory model](#s5.1.2)
	*[Overheads of OpenMP constructs](#s5.1.3)
* [Optimizing OpenMP programs](#s5.2)
	*[Near memory and far memory](#s5.2.1)
	*[Bandwidth to DRAM memory](#s5.2.2)
	*[Matrix transpose](#s5.2.3)
	*[Fast Fourier transform](#s5.2.4)
* [Introduction to Pthreads](#s5.3)
	*[Pthreads](#s5.3.1)
	*[Overhead of thread creation](#s5.3.2)
	*[Parallel regions using Pthreads](#s5.3.3)
* [Program memory](#s5.4)
	*[An easy system call](#s5.4.1)
	*[Stacks](#s5.4.2)
	*[Segmentation faults and memory errors](#s5.4.3)

Programming with threads is a paradigm of great range and utility that encompasses everything from cell phones to web servers to supercomputers.

### [5.1][bk.5.1] <a name="s5.1"></a> Introduction to OpenMP

OpenMP programs look much like sequential programs, and the syntax is easy to learn. The simplicity is mostly illusory, however. Whenever concurrent programs share memory, as OpenMP programs do, the programming model inevitably becomes very subtle.

#### [5.1.1][bk.5.1.1] <a name="s5.1.1"></a> OpenMP syntax

OpenMP syntax is beguilingly simple.

[leibniz.hh][omp.leibniz.hh]

[leibniz.cpp][omp.leibniz.cpp]

[ompfor.cpp][ompfor.cpp]

[parallel.cpp][parallel.cpp]

[section.cpp][section.cpp]

#### [5.1.2][bk.5.1.2] <a name="s5.1.2"></a> Shared variables and OpenMP's memory model

Implicit flushes are a vital part of OpenMP's memory model.

[printstuff.cpp][printstuff.cpp]

#### [5.1.3][bk.5.1.3] <a name="s5.1.3"></a> Overheads of OpenMP constructs

The parallel, barrier, and for constructs introduce overheads. Work may need to be assigned to threads, threads may need to be created and destroyed, or synchronization and serialization may need to be implemented using system calls to the operating system kernel. These activities consume cycles. If the parallelized task is too small, the benefits of parallelization will be overwhelmed by the overheads. Effective programming requires knowledge of the overheads of OpenMP constructs.

[parallel.hh][parallel.hh]

[parallelA.cpp][parallelA.cpp]

[overhead.hh][overhead.hh]

[barrier.cpp][barrier.cpp]

[ompfor.cpp][ovhd.ompfor.cpp]

### [5.2][bk.5.2] <a name="s5.2"></a> Optimizing OpenMP programs

It is commonly believed that a program running on 16 cores is 16 times faster than a program that runs on 1 core, ignoring communication costs. This belief is completely mistaken. Bandwidth to memory does not scale linearly with the number of cores. Although linear speedup is often claimed in scientific computing research, such claims are a consequence of the program not going out of cache, a surprisingly common occurrence. Algorithms that use memory in a nontrivial manner and achieve linear speedup are rare.

#### [5.2.1][bk.5.2.1] <a name="s5.2.1"></a> Near memory and far memory

It is advantageous if a page frame that is mostly used by a thread resides in near memory. If page frames are in far memory, the speed of the program can degrade by more than a factor of two.

[latency.cpp][omp.latency.cpp]

#### [5.2.2][bk.5.2.2] <a name="s5.2.2"></a> Bandwidth to DRAM memory

Table 5.3 lists the read, write, and copy bandwidths for two different computers. In neither case do we get anything close to linear speedup for reading and copying.

[readwrcopy.hh][readwrcopy.hh]

[readwrcopy.cpp][readwrcopy.cpp]


#### [5.2.3][bk.5.2.3] <a name="s5.2.3"></a> Matrix transpose

The bandwidth realized in transposing is nearly 80% of the bandwidth for copying. Getting to 80% of the best possible in a matrix transpose is quite good.

[transpose.hh][transpose.hh]

[transpose.cpp][transpose.cpp]

#### [5.2.4][bk.5.2.4] <a name="s5.2.4"></a> Fast Fourier transform

The FFT speedups are quite good and reach 75% of linear speedup.

[fft_thrd.hh][fft_thrd.hh]

[fft_thrd.cpp][fft_thrd.cpp]

### [5.3][bk.5.3] <a name="s5.3"></a> Introduction to Pthreads

OpenMP is a limited programming model. It applies mainly to those situations where the data is static and the access patterns are regular. Pthreads are a more powerful programming model.

The Pthread interface for creating and running threads is supported by the Linux kernel. In Linux, each thread is a separate process. Thread creation is the same as process creation. The distinguishing feature of a group of threads is that they all use the same page tables.

#### [5.3.1][bk.5.3.1] <a name="s5.3.1"></a> Pthreads

Pthreads are initiated using functions that take a single argument of type void * and return a single value also of type void *.

[mesg.hh][mesg.hh]

[mesg_plain.cpp][mesg_plain.cpp]

[mesg_mutex.cpp][mesg_mutex.cpp]

[mesg_spin.cpp][mesg_spin.cpp]

[leibniz.cpp][pthreads.leibniz.cpp]

#### [5.3.2][bk.5.3.2] <a name="s5.3.2"></a> Overhead of thread creation

The typical cost of creating and destroying Pthreads appears to be somewhat less than 10**5 cycles. That number is not unreasonable given that each process descriptor used by the kernel is nearly 6 KB. The cost of creating threads will vary from system to system, but the numbers are qualitatively the same on many different systems. The cost of creating a thread per core may be expected to be higher on computers with multiple processor packages.

[thrd_create_ovhd.cpp][thrd_create_ovhd.cpp]

#### [5.3.3][bk.5.3.3] <a name="s5.3.3"></a> Parallel regions using Pthreads

Open MP type parallel regions are implemented using Pthreads in this section. The first implementation is plain C, except for creating and launching Pthreads. The second and third implementations use spinlocks and mutexes, respectively. The final implementation uses conditional variables.  The C implementation highlights the role of cache coherence, which is essential and fundamental to multithreaded programming. Propagating writes from cache to cache can cause significant overhead. The C implementation also introduces memory fences.

[altadd_omp.cpp][altadd_omp.cpp]

[altadd_c.cpp][altadd_c.cpp]

[altadd_mtx.cpp][altadd_mtx.cpp]

[altadd_spin.cpp][altadd_spin.cpp]

[altadd_cond.cpp][altadd_cond.cpp]


### [5.4][bk.5.4] <a name="s5.4"></a> Program memory

Programs rely on operating systems in many more ways than most programmers realize. The little forays we make into the Linux kernel will help us understand segmentation faults, memory errors, and thread creation.

#### [5.4.1][bk.5.4.1] <a name="s5.4.1"></a> An easy system call

The operating system kernel offers its services to user programs through system calls. There are system calls for dealing with every single part of the computing system. There are system calls related to the file system, networks, memory management, and process creation and scheduling. Every printf() or malloc() begins life in the C library but finds its way into the operating system kernel through a system call.

[linux.kernel.patch.11][linux.kernel.patch.11]
(defines a new system call to control printing of messages).

[linux.kernel.patch.22][linux.kernel.patch.22]
(more modifications to print messages)

[dvmesg.h][dvmesg.h]

[dvmesg.c][dvmesg.c]

[syscall.c][syscall.c]

[time_syscall.cpp][time_syscall.cpp]

#### [5.4.2][bk.5.4.2] <a name="s5.4.2"></a> Stacks

Stacks are useful for maintaining the state of running processes. This application is so important that the stack is hardwired into the x86 instruction set as well as most other instruction sets.

[hanoi.cpp][hanoi.cpp]

In Linux, every process gets a kernel mode stack, in addition to its user mode stack. The user mode stack occupies a high region in the user area, and the kernel mode stack is in the kernel area of virtual memory.


#### [5.4.3][bk.5.4.3] <a name="s5.4.3"></a> Segmentation faults and memory errors

The use of pointers exposes the programmer to errors that corrupt memory. Memory errors can befuddle even expert programmers. An erroneous program with memory errors may work on some systems but crash on others. The point where the program crashes can be far away from the point where the error occurs. The program may work for some inputs but not for others. In multithreaded programs, memory errors may be triggered by race conditions that are hard to reproduce, making debugging difficult. In this section, we take a detailed look at segmentation faults and memory errors.

[stacksize.cpp][stacksize.cpp]

[segf.hh][segf.hh]

[segf.cpp][segf.cpp]

[induce_segf.cpp][induce_segf.cpp]

[maccess.hh][maccess.hh]

[maccess.cpp][maccess.cpp]

[induce_merr.cpp][induce_merr.cpp]

# [6][bk.6] <a name="chapter6"></a>Special Topic: Networks and Message Passing


* [MPI: Getting started](#s6.1)
	*[Initializing MPI](#s6.1.1)
	*[Unsafe communication in MPI](#s6.1.2)
* [High-performance network architecture](#s6.2)
	*[Fat-tree network](#s6.2.1)
	*[Infiniband network architecture](#s6.2.2)
* [MPI examples](#s6.3)
	*[Variants of MPI send and receive](#s6.3.1)
	*[Jacobi iteration](#s6.3.2)
	*[Matrix transpose](#s6.3.3)
	*[Collective communication](#s6.3.4)
	*[Parallel I/O in MPI](#s6.3.5)
* [The Internet](#s6.4)
	*[IP addresses](#s6.4.1)
	*[Send and receive](#s6.4.2)
	*[Server](#s6.4.3)
	*[Client](#s6.4.4)
	*[Internet latency](#s6.4.5)
	*[Internet bandwidth](#s6.4.6)

The principal framework for programming high-performance networks is Message Passing Interface (MPI). MPI is a library that allows processes running concurrently on different nodes to communicate by sending and receiving messages.

The Internet is a different kind of a network from the high-performance clusters targeted by MPI. The Internet’s relevance to emerging areas of science is unquestionable. The huge volumes of investment that are and will flow into the Internet will imply that it is integrated more and more deeply into science and scientific computing. Conversely, one should not forget that the World Wide Web was invented by a physicist.

### [6.1][bk.6.1] <a name="s6.1"></a> MPI: Getting started

MPICH, MVAPICH2, and Open MPI are the three major MPI implementations. The details of compilation, linking, and running vary between these implementations as well as between different sites. However, the general picture is the same.

#### [6.1.1][bk.6.1.1] <a name="s6.1.1"></a> Initializing MPI

MPI calls itself a fully featured library---with some justice. It has a lot of features. We will use only a thin sliver of MPI.

[procname.cpp][procname.cpp]

[mpi_init.hh][mpi_init.hh]

[mpi_init.cpp][mpi_init.cpp]

#### [6.1.2][bk.6.1.2] <a name="s6.1.2"></a> Unsafe communication in MPI

MPI syntax allows a process to use either blocking or nonblocking function calls to send and receive. A blocking send or receive waits until the operation is complete. Blocking communication is more vulnerable to deadlocks.

[unsafe.cpp][unsafe.cpp]

### [6.2][bk.6.2] <a name="s6.2"></a> High-performance network architecture

A network connects many computers together. Each computer is an independent entity. Thus, every communication between two computers requires coordination. The coordination is much looser in the vast and decentralized Internet than it is in high-performance networks used in scientific computing.

#### [6.2.1][bk.6.2.1] <a name="s6.2.1"></a> Fat-tree network

In many high-performance clusters, nodes are networked using fat-trees.  A defining property of fat-trees is that the number of links between levels is roughly a constant.

#### [6.2.2][bk.6.2.2] <a name="s6.2.2"></a> Infiniband network architecture

In packet switched networks, such as Infiniband or the Ethernet, data in DRAM memory is converted to a sequence of packets by the source. The packets are transmitted across the network. The packets are reassembled at the destination and stored once again in DRAM memory. The change in data format is fundamental to packet switched networks.

### [6.3][bk.6.3] <a name="s6.3"></a> MPI examples

In this section, we get more deeply into MPI syntax. Our account of MPI syntax is not extensive. However, every bit of syntax introduced is related to computer architecture. The discussion of Infiniband network architecture in the previous section will help us learn MPI with a double focus on syntax and its effectiveness.

#### [6.3.1][bk.6.3.1] <a name="s6.3.1"></a> Variants of MPI send and receive

Function calls that send and receive messages are the heart of the MPI library. An MPI user who masters sending and receive messages, but not much more, can get by quite well.

[exchange.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/exchange/exchange.hh

[exchange.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/exchange/exchange.cpp

[cycle.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/cycle/cycle.hh

[cycle.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/cycle/cycle.hh

#### [6.3.2][bk.6.3.2] <a name="s6.3.2"></a> Jacobi iteration

The Jacobi iteration is a technique for solving linear systems that arise when certain partial differential equations are discretized. Jacobi is an iterative method.

[jacobi.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/jacobi/jacobi.hh

[jacobi.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/jacobi/jacobi.cpp

#### [6.3.3][bk.6.3.3] <a name="s6.3.3"></a> Matrix transpose

In this section, we implement the transposition of large matrices stored on several host computers connected by QDR Infiniband network. The number of host computers ranges from 10 to 100. This examples illustrates the importance of optimizaing copying into and out of buffers and the manner in which MPI can be made to issue RDMA reads and writes so that network activity occurs in parallel with processor activity.

[trans.hh][trans.hh]

[trans.cpp][trans.cpp]

[fast_trans.hh][fast_trans.hh]

[fast_trans.cpp][fast_trans.cpp]

#### [6.3.4][bk.6.3.4] <a name="s6.3.4"></a> Collective communication

The MPI library provides several function calls for collective communication. A collective function call must be made by all processes in a group. The result of collective calls such as Bcast, Scatter, Gather, and Alltoall is data transfer involving all the processes.

[bcast.hh][bcast.hh]

[bcast.cpp][bcast.cpp]

[all2all.hh][all2all.hh]

[all2all.cpp][all2all.cpp]

[reduce.hh][reduce.hh]

[reduce.cpp][reduce.cpp]

#### [6.3.5][bk.6.3.5] <a name="s6.3.5"></a> Parallel I/O in MPI

In parallel I/O, a number of MPI processes simultaneously write to or read from the same file. Typical file systems lock a file when it is being accessed by one process, which precludes other processes from accessing it. Parallel I/O is possible only if the file system allows it.

[lustre.hh][lustre.hh]

[lustre.cpp][lustre.cpp]

### [6.4][bk.6.4] <a name="s6.4"></a> The Internet

The main function of the Internet, as it exists today, is to connect people. There is no doubt that the Internet is one of the most successful technologies. The Internet is not the result of a single act of invention. Even now its design is evolving to accommodate new uses and technologies.

#### [6.4.1][bk.6.4.1] <a name="s6.4.1"></a> IP addresses

The IP address is crucial to the architecture of the Internet. Data leaves the source computer in the form of TCP/IP packets. The TCP/IP packets hop from router to router until they end up at the destination.

[ipaddr.cpp][ipaddr.cpp]


#### [6.4.2][bk.6.4.2] <a name="s6.4.2"></a> Send and receive

Every network interface comes down to sending and receiving data.

[tcp_utils.hh][tcp_utils.hh]

[tcp_utils.cpp][tcp_utils.cpp]

#### [6.4.3][bk.6.4.3] <a name="s6.4.3"></a> Server

The server described here receives a sequence of double-precision numbers from its client and sends back their partial sums.

[server.cpp][server.cpp]

#### [6.4.4][bk.6.4.4] <a name="s6.4.4"></a> Client

The client mirrors the server in some ways but differs in others. The client begins by establishing a connection with the server.

[client.cpp][client.cpp]

#### [6.4.5][bk.6.4.5] <a name="s6.4.5"></a> Internet latency

All measurements were performed by running the server at the Texas Advanced Computing Center (TACC) and the client at the University of Michigan (UM). The median time for send + recv was close to 55 milliseconds in several trials. Understanding why the latency is 55 milliseconds is a fascinating problem.

#### [6.4.6][bk.6.4.6] <a name="s6.4.6"></a> Internet bandwidth

The realized bandwidth is determined to a great extent by TCP’s congestion control algorithm. TCP implements both flow control and congestion control. In flow control, the sender keeps track of the available room in the receiver’s buffer. The sender slows down if there is too little room in the receiver’s buffer. The sender continually adjusts its speed to avoid overwhelming (or starving) the receiver with packets.

# [7][bk.7] <a name="chapter7"></a> Special Topic: The Xeon Phi Coprocessor

* [Xeon Phi architecture](#s7.1)
	*[Peak floating point bandwidth](#s7.1.1)
	*[A simple Phi program](#s7.1.2)
	*[Xeon Phi memory system](#s7.1.3)
* [Offload](#s7.2)
	*[Initializing to use the MIC device](#s7.2.1)
	*[The target(mic) declaration specification](#s7.2.2)
	*[Summing the Leibniz series](#s7.2.3)
	*[Offload bandwidth](#s7.2.4)
* [Two examples: FFT and matrix multiplication](#s7.3)
	*[FFT](#s7.3.1)
	*[Matrix multiplication](#s7.3.2)

The Intel Many Integrated Cores (MIC) or Xeon Phi coprocessor supplements the processor nodes and increases floating point throughput.

### [7.1][bk.7.1] <a name="s7.1"></a> Xeon Phi architecture

In this section, we give an overview of the Xeon Phi’s architecture in three steps. The first step is to calculate the peak floating point bandwidth of the Phi. The second step is to introduce the thread picker. Finally, we reuse Open MP programs to measure the Phi's latency and bandwidth to memory.

#### [7.1.1][bk.7.1.1] <a name="s7.1.1"></a> Peak floating point bandwidth

The peak bandwidth is approached by dense matrix multiplication and LU factorization. However, the peak floating point bandwidth is an irrelevant theoretical number for almost every other application, and even the FFT realizes only 15% of the peak, as we will see later.

#### [7.1.2][bk.7.1.2] <a name="s7.1.2"></a> A simple Phi program

From here onward, we use Phi device and MIC device interchangeably. We begin by explaining why the right number of threads on a MIC/Phi device is typically four times the number of cores.

[hello.cpp][hello.cpp]

#### [7.1.3][bk.7.1.3] <a name="s7.1.3"></a> Xeon Phi memory system

Latency and bandwidth to memory are measured by making slight changes to earlier programs.

[Makefile][mic.intro.Makefile]

### [7.2][bk.7.2] <a name="s7.2"></a> Offload

In offload mode, the master thread of the main program is assumed to be on the host. However, the program holds several segments that are meant to be outsourced to the Phi devices.

Note: offloading may become irrelevant in newer generations of the Phi.

#### [7.2.1][bk.7.2.1] <a name="s7.2.1"></a> Initializing to use the MIC device

In all the offloading programs, it is assumed that mic_init() is called at the beginning.

[mic_init.hh][mic_init.hh]

[mic_init.cpp][mic_init.cpp]

#### [7.2.2][bk.7.2.2] <a name="s7.2.2"></a> The target(mic) declaration specification

The icpc compiler has the ability to compile a function written in C/C++ to produce assembly for both the host computer and MIC device.

[leibniz_init.hh][mic.leibniz_init.hh]

[leibniz_init.cpp][mic.leibniz_init.cpp]


#### [7.2.3][bk.7.2.3] <a name="s7.2.3"></a> Summing the Leibniz series

We will discuss four different programs to sum the Leibniz series to compute pi.Together the programs expose nearly all the offload syntax one needs to know.


[leibniz.cpp][mic.leibniz.cpp]


#### [7.2.4][bk.7.2.4] <a name="s7.2.4"></a> Offload bandwidth

The PCIe bus, which connects the host with the MIC devices, has low bandwidth. Its bandwidth is more than an order of magnitude less than the bandwidth to memory of the MIC devices or even the host. Data transfer between the host and the Xeon Phi coprocessors imposes serious limits on the advantages as well as utility of the coprocessor model.

[offl.hh][offl.hh]

[offl.cpp][offl.cpp]

[time_offl.cpp][time_offl.cpp]

# [7.3][bk.7.3] <a name="s7.3"></a> Two examples: FFT and matrix multiplication

We look at the FFT, the Phi's instruction pipeline, a microkernel in assembly for matrix multiplication, and the MKL library.

### [7.3.1][bk.7.3.1] <a name="s7.3.1"></a> FFT

The FFT is a good basis for comparing the Phi against its AVX host. It is one of the most frequently employed scientific algorithms. Unlike in the LINPACK benchmark employed to rate supercomputers, the cost of memory accesses cannot be completely hidden.

[fft.hh][mic.fft.hh]

[fft.cpp][mic.fft.cpp]

[time_fft_mic.cpp][time_fft_mic.cpp]

### [7.3.2][bk.7.3.2] Matrix multiplication

Algorithms that are capable of approaching the theoretical peak are not many. These algorithms must involve a great number of arithmetic operations relative to the data they access. In addition, their structure must permit hiding the cost of multiple accesses of the same data item. Dense numerical linear algebra is the main source of such algorithms.

[asm8x1x8.s][asm8x1x8.s]

[asm8x48x8.s][asm8x48x8.s]

[time_asm.cpp][time_asm.cpp]

[mmult.hh][mmult.hh]

[mmult.cpp][mmult.cpp]

# [8][bk.8] <a name="chapter8"></a> Special Topic: Graphics Coprocessor

* [Graphics coprocessor architecture](#s8.1)
	*[Graphics processor capability](#s8.1.1)
	*[Host and device memory](#s8.1.2)
	*[Timing CUDA kernels](#s8.1.3)
	*[Warps and thread blocks](#s8.1.4)
* [Introduction to CUDA](#s8.2)
	*[Summing the Leibniz series](#s8.2.1)
	*[CUDA compilation](#s8.2.2)
* [Two examples](#s8.3)
	*[Bandwidth to memory](#s8.3.1)
	*[Matrix multiplication](#s8.3.2)

The graphics libraries provide a number of functions for rendering, shading, texture manipulation, and similar tasks. Graphics devices accelerate the execution of such library functions. In 2007, NVIDIA introduced the Compute Unified Device Architecture (CUDA) framework. CUDA added software layers to the device drivers and the GNU C/C++ compiler to greatly simplify the task of programming graphics coprocessors for scientific use.

### [8.1][bk.8.1] <a name="s8.1"></a> Graphics coprocessor architecture

Basic knowledge of registers, warps, and thread blocks is essential for CUDA programming.

#### [8.1.1][bk.8.1.1] <a name="s8.1.1"></a> Graphics processor capability

NVIDIA graphics processors come in a great variety. The number of devices that are CUDA enabled and are of compute capability anywhere from 1.0 to 3.5 is more than 100. The first task is to find out exactly which graphics processor is available and what its capability is.

[capability.cu][capability.cu]


#### [8.1.2][bk.8.1.2] <a name="s8.1.2"></a> Host and device memory

To set up any computation on the graphics device, data must be transferred from host to device memory. To retrieve the result of a computation on the graphics device, data must be transferred in the other direction from device to host memory.

[dhstmem.hh][dhstmem.hh}

#### [8.1.3][bk.8.1.3] <a name="s8.1.3"></a> Timing CUDA kernels

The simplest programs have much to teach us as long as we time them carefully. Therefore, we begin by looking at mechanisms to time kernels that run on the graphics coprocessor.

[hstTimer.hh][hstTimer.hh]

#### [8.1.4][bk.8.1.4] <a name="s8.1.4"></a> Warps and thread blocks

The K20’s design is so different from that of conventional processors that to program it we need to understand a few things about its architecture. The heart of the microarchitecture is the streaming multiprocessor, and there are 13 of these in Kepler. 

### [8.2][bk.8.2] <a name="s8.2"></a> Introduction to CUDA

The first program for summing the Leibniz series is perhaps not so much harder to code than the corresponding OpenMP program, which runs on the Phi or any x86 machine. However, the second program, in which the entire sum is found on the K20, is easily 100 times harder to code.

#### [8.2.1][bk.8.2.1] <a name="s8.2.1"></a> Summing the Leibniz series

Threads are grouped into warps and warps into thread blocks. Thread blocks are arranged in a grid. The hierarchical grouping of threads can never be forgotten in writing CUDA programs.

[const.hh][const.hh]

[leibniz.hh][cu.leibniz.hh]

[leibniz.cu][leibniz.cu]

[atomicAdd.hh][atomicAdd.hh]

[atomicAdd.cu][atomicAdd.cu]

[leibniz_all.cu][leibniz_all.cu]


#### [8.2.2][bk.8.2.2] <a name="s8.2.2"></a> CUDA compilation

The improvements made by NVIDIA from Tesla to Fermi to Kepler instruction set architectures appear quite substantial. The freedom to make such substantial changes while still being able to run older executables on newer devices is a consequence of just-in-time compilation of PTX embedded in the executables.

### [8.3][bk.8.3] <a name="s8.3"></a> Two examples

In this section, we look at two more examples to better understand the CUDA programming model and the speed of the K20 graphics device.

#### [8.3.1][bk.8.3.1] <a name="s8.3.1"></a> Bandwidth to memory

Blocking memory accesses is the right thing to do on x86 processors. On the K20 and other graphics devices, blocking will lose more than 90% of the bandwidth. Partly because instructions are executed warp by warp, memory accesses must be interleaved.

[addcopy.hh][addcopy.hh]

[add.cu][add.cu]

[copy.cu][copy.cu]


#### [8.3.2][bk.8.3.2] <a name="s8.3.2"></a> Matrix multiplication

To approach peak bandwidth, there is no choice but to optimize for the instruction pipeline. We do not consider such optimization here,  although the basic principles of optimizing for the instruction pipeline do not change drastically from what is described in chapter 3.

Accesses of shared memory are considerably faster than global memory accesses.

[mmult.hh][cu.mmult.hh]

[mmult.cpp][cu.mmult.cpp]

[cumult.hh][cumult.hh]

[cumult.cpp][cumult.cpp]

# [A][bk.9] <a name="chapter9"></a> Machines Used, Plotting, Python, GIT, Cscope, and gcc


* [Machines used](#s9.1)
* [Plotting in C/C++ and other preliminaries](#s9.2)
* [C/C++ versus Python versus MATLAB](#s9.3)
* [GIT](#s9.4)
* [Cscope](#s9.5)
* [Compiling with gcc/g++](#s9.6)

In this appendix, we give a list of machines used in this book as well as several pointers for downloading and using the program code.

[dot.emacs][dot.emacs]

[dot.bashrc][dot.bashrc]

[cln][cln] (program to run "make clean" recursively, "cln +h" for help)

### [A.1][bk.9.1] <a name="s9.1"></a> Machines used

A table of machines we used to time programs is presented.

### [A.2][bk.9.2] <a name="s9.2"></a> Plotting in C/C++ and other preliminaries

In this section, we describe C++ classes for plotting, gathering statistics, and making tables. These classes are used throughout the book. However, in almost every instance, the code showing how these facilities are invoked is suppressed.

[pyplot.hh][pyplot.hh]

[pyplot.cpp][pyplot.cpp]

[pyhist.hh][pyhist.hh]

[pyhist.cpp][pyhist.cpp]

[test_pyplot.cpp][test_pyplot.cpp]

[test_pyhist.cpp][test_pyhist.cpp]

[StatVector.hh][StatVector.hh]

[test_stat.cpp][test_stat.cpp]

[Table.hh][Table.hh]

[Table.cpp][Table.cpp]

[test_table.cpp][test_table.cpp]

### [A.3][bk.9.3] <a name="s9.3"></a> C/C++ versus Python versus MATLAB

How much faster C/C++ can be relative to interpreted languages such as Python and MATLAB is often not understood.

[primes.cpp][primes.cpp]

[primes.py][primes.py]

[primes.m][primes.m]

### [A.4][bk.9.4] <a name="s9.4"></a> GIT

The git utility is a tool for managing sources. Although there are many facilities in GIT, GIT can be grasped easily by paying attention to its internal design.

### [A.5][bk.9.5] <a name="s9.5"></a> Cscope

The cscope utility is invaluable for browsing source code.

[cscope.py][cscope.py]

### [A.6][bk.9.6] <a name="s9.6"></a> Compiling with gcc/g++

The Makefiles in this GIT repository use Intel compilers for the most part. The switch to gcc/g++ is not too complicated

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

[bk.6]: https://divakarvi.github.io/bk-spca/spca.html#toc-Chapter-6
[bk.6.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-6.1
[bk.6.1.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.1.1
[bk.6.1.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.1.2
[bk.6.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-6.2
[bk.6.2.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.2.1
[bk.6.2.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.2.2
[bk.6.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-6.3
[bk.6.3.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.3.1
[bk.6.3.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.3.2
[bk.6.3.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.3.3
[bk.6.3.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.3.4
[bk.6.3.5]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.3.5
[bk.6.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-6.4
[bk.6.4.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.4.1
[bk.6.4.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.4.2
[bk.6.4.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.4.3
[bk.6.4.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.4.4
[bk.6.4.5]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.4.5
[bk.6.4.6]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-6.4.6

[mpi_init.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/init/mpi_init.hh
[mpi_init.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/init/mpi_init.cpp
[procname.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/intro/procname.cpp
[unsafe.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/intro/unsafe.cpp
[exchange.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/exchange/exchange.hh
[exchange.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/exchange/exchange.cpp
[cycle.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/cycle/cycle.hh
[cycle.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/cycle/cycle.cpp
[jacobi.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/jacobi/jacobi.hh
[jacobi.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/jacobi/jacobi.cpp
[trans.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/transpose/trans.hh
[trans.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/transpose/trans.cpp
[fast_trans.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/transpose/fast_trans.hh
[fast_trans.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/transpose/fast_trans.cpp
[bcast.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/collective/bcast.hh
[bcast.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/collective/bcast.cpp
[all2all.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/collective/all2all.hh
[all2all.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/collective/all2all.cpp
[reduce.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/collective/reduce.hh
[reduce.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/collective/reduce.hh
[lustre.hh]: https://github.com/divakarvi/bk-spca/blob/master/mpi/diskio/lustre.hh
[lustre.cpp]: https://github.com/divakarvi/bk-spca/blob/master/mpi/diskio/lustre.cpp
[ipaddr.cpp]: https://github.com/divakarvi/bk-spca/blob/master/tcpip/ipaddr.cpp
[tcp_utils.hh]: https://github.com/divakarvi/bk-spca/blob/master/tcpip/tcp_utils.hh
[tcp_utils.cpp]: https://github.com/divakarvi/bk-spca/blob/master/tcpip/tcp_utils.cpp
[server.cpp]: https://github.com/divakarvi/bk-spca/blob/master/tcpip/server.cpp
[client.cpp]: https://github.com/divakarvi/bk-spca/blob/master/tcpip/client.cpp

[bk.7]: https://divakarvi.github.io/bk-spca/spca.html#toc-Chapter-7
[bk.7.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-7.1
[bk.7.1.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-7.1.1
[bk.7.1.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-7.1.2
[bk.7.1.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-7.1.3
[bk.7.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-7.2
[bk.7.2.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-7.2.1
[bk.7.2.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-7.2.2
[bk.7.2.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-7.2.3
[bk.7.2.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-7.2.4
[bk.7.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-7.3
[bk.7.3.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-7.3.1
[bk.7.3.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-7.3.2

[hello.cpp]: https://github.com/divakarvi/bk-spca/tree/master/xphi/intro/hello.cpp
[mic.intro.Makefile]: https://github.com/divakarvi/bk-spca/blob/master/xphi/intro/Makefile
[mic_init.hh]: https://github.com/divakarvi/bk-spca/blob/master/xphi/init/mic_init.hh
[mic_init.cpp]: https://github.com/divakarvi/bk-spca/blob/master/xphi/init/mic_init.cpp
[mic.leibniz_init.hh]: https://github.com/divakarvi/bk-spca/blob/master/xphi/leibniz/leibniz_init.hh
[mic.leibniz_init.cpp]: https://github.com/divakarvi/bk-spca/blob/master/xphi/leibniz/leibniz_init.cpp
[mic.leibniz.cpp]: https://github.com/divakarvi/bk-spca/blob/master/xphi/leibniz/leibniz.cpp
[offl.hh]: https://github.com/divakarvi/bk-spca/blob/master/xphi/offload/offl.hh
[offl.cpp]: https://github.com/divakarvi/bk-spca/blob/master/xphi/offload/offl.cpp
[time_offl.cpp]: https://github.com/divakarvi/bk-spca/blob/master/xphi/offload/time_offl.cpp
[mic.fft.hh]: https://github.com/divakarvi/bk-spca/blob/master/xphi/fft/fft.hh
[mic.fft.cpp]: https://github.com/divakarvi/bk-spca/blob/master/xphi/fft/fft.cpp
[time_fft_mic.cpp]: https://github.com/divakarvi/bk-spca/blob/master/xphi/fft/time_fft_mic.cpp
[asm8x1x8.s]: https://github.com/divakarvi/bk-spca/blob/master/xphi/microk/asm8x1x8.s
[asm8x48x8.s]: https://github.com/divakarvi/bk-spca/blob/master/xphi/microk/asm8x48x8.s
[time_asm.cpp]: https://github.com/divakarvi/bk-spca/blob/master/xphi/microk/time_asm.cpp
[mmult.hh]: https://github.com/divakarvi/bk-spca/blob/master/xphi/mmult/mmult.hh
[mmult.cpp]: https://github.com/divakarvi/bk-spca/blob/master/xphi/mmult/mmult.cpp

[bk.8]: https://divakarvi.github.io/bk-spca/spca.html#toc-Chapter-8
[bk.8.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-8.1
[bk.8.1.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-8.1.1
[bk.8.1.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-8.1.2
[bk.8.1.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-8.1.3
[bk.8.1.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-8.1.4
[bk.8.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-8.2
[bk.8.2.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-8.2.1
[bk.8.2.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-8.2.2
[bk.8.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-8.3
[bk.8.3.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-8.3.1
[bk.8.3.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Subsection-8.3.2

[capability.cu]: https://github.com/divakarvi/bk-spca/blob/master/gpu/cap/capability.cu
[dhstmem.hh]: https://github.com/divakarvi/bk-spca/blob/master/gpu/utils/dhstmem.hh
[hstTimer.hh]: https://github.com/divakarvi/bk-spca/blob/master/gpu/utils/hstTimer.hh
[const.hh]: https://github.com/divakarvi/bk-spca/blob/master/gpu/utils/const.hh
[cu.leibniz.hh]: https://github.com/divakarvi/bk-spca/blob/master/gpu/leibniz/leibniz.hh
[leibniz.cu]: https://github.com/divakarvi/bk-spca/blob/master/gpu/leibniz/leibniz.cu
[atomicAdd.hh]: https://github.com/divakarvi/bk-spca/blob/master/gpu/leibniz/atomicAdd.hh
[atomicAdd.cu]: https://github.com/divakarvi/bk-spca/blob/master/gpu/leibniz/atomicAdd.cu
[leibniz_all.cu]: https://github.com/divakarvi/bk-spca/blob/master/gpu/leibniz/leibniz_all.cu
[addcopy.hh]: https://github.com/divakarvi/bk-spca/blob/master/gpu/bw2mem/addcopy.hh
[add.cu]: https://github.com/divakarvi/bk-spca/blob/master/gpu/bw2mem/add.cu
[copy.cu]: https://github.com/divakarvi/bk-spca/blob/master/gpu/bw2mem/copy.cu
[cu.mmult.hh]: https://github.com/divakarvi/bk-spca/blob/master/gpu/mmult/mmult.hh
[cu.mmult.cpp]: https://github.com/divakarvi/bk-spca/blob/master/gpu/mmult/mmult.cpp
[cumult.hh]: https://github.com/divakarvi/bk-spca/blob/master/gpu/mmult/cumult.hh
[cumult.cpp]: https://github.com/divakarvi/bk-spca/blob/master/gpu/mmult/cumult.cpp


[bk.9]: https://divakarvi.github.io/bk-spca/spca.html#toc-Chapter-9
[bk.9.1]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-9.1
[bk.9.2]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-9.2
[bk.9.3]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-9.3
[bk.9.4]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-9.4
[bk.9.5]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-9.5
[bk.9.6]: https://divakarvi.github.io/bk-spca/spca.html#toc-Section-9.6

[dot.emacs]: https://github.com/divakarvi/bk-spca/blob/master/sys/emacs/dot.emacs
[dot.bashrc]: https://github.com/divakarvi/bk-spca/blob/master/sys/dot.bashrc
[cln]: https://github.com/divakarvi/bk-spca/blob/master/sys/bin/cln
[pyplot.hh]: https://github.com/divakarvi/bk-spca/blob/master/pyplot/pyplot.hh
[pyplot.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pyplot/pyplot.cpp
[pyhist.hh]: https://github.com/divakarvi/bk-spca/blob/master/pyplot/pyhist.hh
[pyhist.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pyplot/pyhist.cpp
[test_pyplot.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pyplot/test_pyplot.cpp
[test_pyhist.cpp]: https://github.com/divakarvi/bk-spca/blob/master/pyplot/test_pyhist.cpp
[StatVector.hh]: https://github.com/divakarvi/bk-spca/blob/master/utils/StatVector.hh
[test_stat.cpp]: https://github.com/divakarvi/bk-spca/blob/master/utils/test_stat.cpp
[Table.hh]: https://github.com/divakarvi/bk-spca/blob/master/utils/Table.hh
[Table.cpp]: https://github.com/divakarvi/bk-spca/blob/master/utils/Table.cpp
[test_table.cpp]: https://github.com/divakarvi/bk-spca/blob/master/utils/test_table.cpp
[primes.cpp]: https://github.com/divakarvi/bk-spca/blob/master/appendix/primes.cpp
[primes.py]: https://github.com/divakarvi/bk-spca/blob/master/appendix/primes.py
[primes.m]: https://github.com/divakarvi/bk-spca/blob/master/appendix/primes.m
[cscope.py]: https://github.com/divakarvi/bk-spca/blob/master/appendix/cscope.py
