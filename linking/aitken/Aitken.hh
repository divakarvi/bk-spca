#ifndef __AitkenAugust09DVjli__
#define __AitkenAugust09DVjli__
#include "../../utils/Vector.hh"

/* 
 * applies Aitken transformation to seq1 to produce seq2.
 * length of seq2 must be 2 less than that of seq1.
 */
void Aitken(const Vector& seq1, Vector& seq2);

/*
 * overwrites seq after the Aitken transformation.
 * the last two entries of seq are set to zero.
 */
void Aitken(Vector& seq);

/*
 * extrapolates seq using repeated Aitken transformations.
 * returns extrapolated value. 
 * if printflag=1, the sequence is printed after each 
 * iteration.
 */
double AitkenE(const Vector& seq, int printflag=0);
#endif

