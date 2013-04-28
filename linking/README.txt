Sept 2010:

I got the following error

opt/intel/Compiler/11.0/074/lib/intel64/libimf.so: warning: warning: feupdateenv is not implemented and will always fail

when linking fortran with C and CPP.

The following solution from google search:

I had this problem in the past.  The problem is the you are linking against the Intel math library only.  The Intel math library (libimf) has optimized replacements for many of the routines in the system math library (libm).  However, the Intel math library does not provide replacements for all functions.

The solution is simple.  Always link against both math libraries: libimf libm

...Tim
