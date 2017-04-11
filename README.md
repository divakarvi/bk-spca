## Scientific Programming and Computer Architecture
### Divakar Viswanath
#### MIT Press, 2017
#### ISBN 9780262036290 

The complete text of this book is available in html at [this link][bk]. The html is published under a Creative Commons license. The copyright remains with the publisher. The html has a few blemishes. For example, occasionally when the same source is split between multiple listings, the line numbering is not continued between the listings as it should be. The html does not have an index, although it is searchable. For a more correct and complete version, see the printed book.

This README document provides context for the source code in this GIT repository, with links to the html text as well as sources in the repository.

# [Preface][bk.preface]

What makes computer programs fast or slow? To answer this question, we have to go behind the abstractions of programing languages and look at how a computer really works. This book examines and explains a variety of scientific programming models (programming models relevant to scientists) with an emphasis on how programming constructs map to different parts of the computer's architecture. Two themes emerge: program speed and program modularity. Most books on computer programming are written at the same level of abstraction as the programming language they utilize or explain. This book starts from the premise that to understand programming speed, we have to get under the hood and understand how a computer works. The approach is to begin with specific programs and move up to general principles gradually. 

The book digs into linkers, compilers, operating systems, and computer architecture to understand how the different parts of the computer interact with programs. It begins with a review of C/C++ and explanations of how libraries, linkers, and Makefiles work. Programming models covered include Pthreads, OpenMP, MPI, TCP/IP, and CUDA. The emphasis on how computers work leads the reader into computer architecture and occasionally into the operating system kernel. The operating system studied is Linux, the preferred platform for scientific computing. Linux is also open source, which allows readers to peer into its inner workings. A brief appendix provides a useful table of machines used to time programs.

# [1:][bk.1] C/C++ Review

The review of C/C++ in this chapter attempts to bring out certain features that people often do not learn from a single course or two.

### [1.1:][bk.1.1] An example: The Aitken iteration

The Aitken transformation maps a sequence of numbers to another sequence of numbers. It serves as the vehicle to introduce aspects of C, C++, and Fortran in this chapter. 

#### [1.1.1:][bk.1.1.1] Leibniz series and the logarithmic series

#### [1.1.2:][bk.1.1.2] Modular organization of sources

Before we delve into the syntax of C/C++, let us look at how to structure a program for the Aitken iteration.

[linking/aitken][linking.aitken]

### [1.2:][bk.1.2] C Review

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

We begin with a general type of class, namely, the Vector class. This class helps us review a few of the features of C++ and is used to implement the Aitken iteration later. In a later chapter, we criticize the use of this class and show it to be slow.

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
