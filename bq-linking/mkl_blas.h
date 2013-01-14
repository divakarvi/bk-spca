/*******************************************************************************
!                             INTEL CONFIDENTIAL
!   Copyright(C) 1999-2008 Intel Corporation. All Rights Reserved.
!   The source code contained  or  described herein and all documents related to
!   the source code ("Material") are owned by Intel Corporation or its suppliers
!   or licensors.  Title to the  Material remains with  Intel Corporation or its
!   suppliers and licensors. The Material contains trade secrets and proprietary
!   and  confidential  information of  Intel or its suppliers and licensors. The
!   Material  is  protected  by  worldwide  copyright  and trade secret laws and
!   treaty  provisions. No part of the Material may be used, copied, reproduced,
!   modified, published, uploaded, posted, transmitted, distributed or disclosed
!   in any way without Intel's prior express written permission.
!   No license  under any  patent, copyright, trade secret or other intellectual
!   property right is granted to or conferred upon you by disclosure or delivery
!   of the Materials,  either expressly, by implication, inducement, estoppel or
!   otherwise.  Any  license  under  such  intellectual property  rights must be
!   express and approved by Intel in writing.
!
!*******************************************************************************
!  Content:
!      Intel(R) Math Kernel Library (MKL) interface for BLAS routines
!******************************************************************************/

#ifndef _MKL_BLAS_H_
#define _MKL_BLAS_H_

#include "mkl_types.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/* Upper case declaration */

void XERBLA(const char *srname, const int *info, const int lsrname);
int LSAME(const char *ca, const char *cb, const MKL_INT lca, const MKL_INT lcb);

/* BLAS Level1 */

double DCABS1(const MKL_Complex16 *z);
float SASUM(const MKL_INT *n, const float *x, const MKL_INT *incx);
void  SAXPY(const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
            float *y, const MKL_INT *incy);
void  SAXPYI(const MKL_INT *nz, const float *a, const float *x, const MKL_INT *indx,float *y);
float SCASUM(const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx);
float SCNRM2(const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx);
void  SCOPY(const MKL_INT *n, const float *x, const MKL_INT *incx, float *y, const MKL_INT *incy);
float SDOT(const MKL_INT *n, const float *x, const MKL_INT *incx,
           const float *y, const MKL_INT *incy);
double DSDOT(const MKL_INT *n, const float *x, const MKL_INT *incx,
             const float *y, const MKL_INT *incy);
float SDOTI(const MKL_INT *nz, const float *x, const MKL_INT *indx, const float *y);
void  SGTHR(const MKL_INT *nz, const float *y, float *x, const MKL_INT *indx);
void  SGTHRZ(const MKL_INT *nz, float *y, float *x, const MKL_INT *indx);
float SNRM2(const MKL_INT *n, const float *x, const MKL_INT *incx);
void  SROT(const MKL_INT *n, float *x, const MKL_INT *incx, float *y, const MKL_INT *incy,
           const float *c, const float *s);
void  SROTG(float *a,float *b,float *c,float *s);
void  SROTI(const MKL_INT *nz, float *x, const MKL_INT *indx, float *y, const float *c, const float *s);
void  SROTM(const MKL_INT *n, float *x, const MKL_INT *incx, float *y, const MKL_INT *incy, const float *param);
void  SROTMG(float *d1, float *d2, float *x1, const float *y1, float *param);
void  SSCAL(const MKL_INT *n, const float *a, float *x, const MKL_INT *incx);
void  SSCTR(const MKL_INT *nz, const float *x, const MKL_INT *indx, float *y);
void  SSWAP(const MKL_INT *n, float *x, const MKL_INT *incx, float *y, const MKL_INT *incy);
MKL_INT   ISAMAX(const MKL_INT *n, const float *x, const MKL_INT *incx);
MKL_INT   ISAMIN(const MKL_INT *n, const float *x, const MKL_INT *incx);

void CAXPY(const MKL_INT *n, const MKL_Complex8 *alpha, const MKL_Complex8 *x, const MKL_INT *incx,
           MKL_Complex8 *y, const MKL_INT *incy);
void CAXPYI(const MKL_INT *nz, const MKL_Complex8 *a,
            const MKL_Complex8 *x, const MKL_INT *indx, MKL_Complex8 *y);
void CCOPY(const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx,
           MKL_Complex8 *y, const MKL_INT *incy);
void CDOTC(MKL_Complex8 *pres, const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx,
           const  MKL_Complex8 *y, const MKL_INT *incy);
void CDOTCI(MKL_Complex8 *pres, const MKL_INT *nz, const MKL_Complex8 *x, const MKL_INT *indx,
            const MKL_Complex8 *y);
void CDOTU(MKL_Complex8 *pres, const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx,
           const  MKL_Complex8 *y, const MKL_INT *incy);
void CDOTUI(MKL_Complex8 *pres, const MKL_INT *nz, const MKL_Complex8 *x, const MKL_INT *indx,
            const MKL_Complex8 *y);
void CGTHR(const MKL_INT *nz, const MKL_Complex8 *y, MKL_Complex8 *x, const MKL_INT *indx);
void CGTHRZ(const MKL_INT *nz, MKL_Complex8 *y, MKL_Complex8 *x, const MKL_INT *indx);
void CROTG(MKL_Complex8 *a, const MKL_Complex8 *b, float *c, MKL_Complex8 *s);
void CSCAL(const MKL_INT *n, const MKL_Complex8 *a, MKL_Complex8 *x, const MKL_INT *incx);
void CSCTR(const MKL_INT *nz, const MKL_Complex8 *x, const MKL_INT *indx, MKL_Complex8 *y);
void CSROT(const MKL_INT *n, MKL_Complex8 *x, const MKL_INT *incx, MKL_Complex8 *y, const MKL_INT *incy,
           const float *c, const float *s);
void CSSCAL(const MKL_INT *n, const float *a, MKL_Complex8 *x, const MKL_INT *incx);
void CSWAP(const MKL_INT *n, MKL_Complex8 *x, const MKL_INT *incx, MKL_Complex8 *y, const MKL_INT *incy);
MKL_INT  ICAMAX(const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx);
MKL_INT  ICAMIN(const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx);

double DASUM(const MKL_INT *n, const double *x, const MKL_INT *incx);
void   DAXPY(const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
             double *y, const MKL_INT *incy);
void   DAXPYI(const MKL_INT *nz, const double *a, const double *x, const MKL_INT *indx, double *y);
void   DCOPY(const MKL_INT *n, const double *x, const MKL_INT *incx, double *y, const MKL_INT *incy);
double DDOT(const  MKL_INT *n, const double *x, const MKL_INT *incx,
            const double *y, const MKL_INT *incy);
float  SDSDOT(const MKL_INT *n, const double *x, const MKL_INT *incx,
              const double *y, const MKL_INT *incy);
double DDOTI(const MKL_INT *nz, const double *x, const MKL_INT *indx, const double *y);
void   DGTHR(const MKL_INT *nz, const double *y, double *x, const MKL_INT *indx);
void   DGTHRZ(const MKL_INT *nz, double *y, double *x, const MKL_INT *indx);
double DNRM2(const MKL_INT *n, const double *x, const MKL_INT *incx);
void   DROT(const MKL_INT *n, double *x, const MKL_INT *incx, double *y, const MKL_INT *incy,
            const double *c, const double *s);
void   DROTG(double *a,double *b,double *c,double *s);
void   DROTI(const MKL_INT *nz, double *x, const MKL_INT *indx, double *y, const double *c, const double *s);
void   DROTM(const MKL_INT *n, double *x, const MKL_INT *incx, double *y, const MKL_INT *incy, const double *param);
void   DROTMG(double *d1, double *d2, double *x1, const double *y1, double *param);
void   DSCAL(const MKL_INT *n, const double *a, double *x, const MKL_INT *incx);
void   DSCTR(const MKL_INT *nz, const double *x, const MKL_INT *indx, double *y);
void   DSWAP(const MKL_INT *n, double *x, const MKL_INT *incx, double *y, const MKL_INT *incy);
double DZASUM(const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx);
double DZNRM2(const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx);
MKL_INT    IDAMAX(const MKL_INT *n, const double *x, const MKL_INT *incx);
MKL_INT    IDAMIN(const MKL_INT *n, const double *x, const MKL_INT *incx);

void ZAXPY(const MKL_INT *n, const MKL_Complex16 *alpha, const MKL_Complex16 *x, const MKL_INT *incx,
           MKL_Complex16 *y, const MKL_INT *incy);
void ZAXPYI(const MKL_INT *nz, const MKL_Complex16 *a,
            const MKL_Complex16 *x, const MKL_INT *indx, MKL_Complex16 *y);
void ZCOPY(const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx,
           MKL_Complex16 *y, const MKL_INT *incy);
void ZDOTC(MKL_Complex16 *pres, const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx,
           const  MKL_Complex16 *y, const MKL_INT *incy);
void ZDOTCI(MKL_Complex16 *pres,const MKL_INT *nz, const MKL_Complex16 *x, const MKL_INT *indx,
            const MKL_Complex16 *y);
void ZDOTU(MKL_Complex16 *pres, const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *y, const MKL_INT *incy);
void ZDOTUI(MKL_Complex16 *pres, const MKL_INT *nz, const MKL_Complex16 *x, const MKL_INT *indx,
            const MKL_Complex16 *y);
void ZDROT(const MKL_INT *n, MKL_Complex16 *x, const MKL_INT *incx, MKL_Complex16 *y, const MKL_INT *incy,
           const double *c, const double *s);
void ZDSCAL(const MKL_INT *n, const double *a, MKL_Complex16 *x, const MKL_INT *incx);
void ZGTHR(const MKL_INT *nz, const MKL_Complex16 *y, MKL_Complex16 *x, const MKL_INT *indx);
void ZGTHRZ(const MKL_INT *nz, MKL_Complex16 *y, MKL_Complex16 *x, const MKL_INT *indx);
void ZROTG(MKL_Complex16 *a, const MKL_Complex16 *b, double *c, MKL_Complex16 *s);
void ZSCAL(const MKL_INT *n, const MKL_Complex16 *a, MKL_Complex16 *x, const MKL_INT *incx);
void ZSCTR(const MKL_INT *nz, const MKL_Complex16 *x, const MKL_INT *indx, MKL_Complex16 *y);
void ZSWAP(const MKL_INT *n, MKL_Complex16 *x, const MKL_INT *incx, MKL_Complex16 *y, const MKL_INT *incy);
MKL_INT  IZAMAX(const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx);
MKL_INT  IZAMIN(const  MKL_INT *n,const  MKL_Complex16 *x, const MKL_INT *incx);

/* BLAS Level2 */

void SGBMV(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_INT *kl, const MKL_INT *ku,
           const float *alpha, const float *a, const MKL_INT *lda, const float *x, const MKL_INT *incx,
           const float *beta, float *y, const MKL_INT *incy);
void SGEMV(const char *trans, const MKL_INT *m, const MKL_INT *n, const float *alpha,
           const float *a, const MKL_INT *lda, const float *x, const MKL_INT *incx,
           const float *beta, float *y, const MKL_INT *incy);
void SGER(const MKL_INT *m, const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
          const float *y, const MKL_INT *incy, float *a, const MKL_INT *lda);
void SSBMV(const char *uplo, const MKL_INT *n, const MKL_INT *k,
           const float *alpha, const float *a, const MKL_INT *lda, const float *x, const MKL_INT *incx,
           const float *beta, float *y, const MKL_INT *incy);
void SSPMV(const char *uplo, const MKL_INT *n, const float *alpha, const float *ap,
           const float *x, const MKL_INT *incx, const float *beta, float *y, const MKL_INT *incy);
void SSPR(const char *uplo, const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx, float *ap);
void SSPR2(const char *uplo, const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
           const float *y, const MKL_INT *incy, float *ap);
void SSYMV(const char *uplo, const MKL_INT *n, const float *alpha, const float *a, const MKL_INT *lda,
           const float *x, const MKL_INT *incx, const float *beta, float *y, const MKL_INT *incy);
void SSYR(const char *uplo, const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
          float *a, const MKL_INT *lda);
void SSYR2(const char *uplo, const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
           const float *y, const MKL_INT *incy, float *a, const MKL_INT *lda);
void STBMV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const float *a, const MKL_INT *lda, float *x, const MKL_INT *incx);
void STBSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const float *a, const MKL_INT *lda, float *x, const MKL_INT *incx);
void STPMV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const float *ap, float *x, const MKL_INT *incx);
void STPSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const float *ap, float *x, const MKL_INT *incx);
void STRMV(const char *uplo, const char *transa, const char *diag, const MKL_INT *n,
           const float *a, const MKL_INT *lda, float *b, const MKL_INT *incx);
void STRSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const float *a, const MKL_INT *lda, float *x, const MKL_INT *incx);

void CGBMV(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_INT *kl, const MKL_INT *ku,
           const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *beta,
           MKL_Complex8 *y, const MKL_INT *incy);
void CGEMV(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda, const MKL_Complex8 *x, const MKL_INT *incx,
           const MKL_Complex8 *beta, MKL_Complex8 *y, const MKL_INT *incy);
void CGERC(const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *y, const MKL_INT *incy,
           MKL_Complex8 *a, const MKL_INT *lda);
void CGERU(const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *y, const MKL_INT *incy,
           MKL_Complex8 *a, const MKL_INT *lda);
void CHBMV(const char *uplo, const MKL_INT *n, const MKL_INT *k, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda, const MKL_Complex8 *x, const MKL_INT *incx,
           const MKL_Complex8 *beta, MKL_Complex8 *y, const MKL_INT *incy);
void CHEMV(const char *uplo, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda, const MKL_Complex8 *x, const MKL_INT *incx,
           const MKL_Complex8 *beta, MKL_Complex8 *y, const MKL_INT *incy);
void CHER(const char *uplo, const MKL_INT *n, const float *alpha, const MKL_Complex8 *x, const MKL_INT *incx,
          MKL_Complex8 *a, const MKL_INT *lda);
void CHER2(const char *uplo, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *y, const MKL_INT *incy,
           MKL_Complex8 *a, const MKL_INT *lda);
void CHPMV(const char *uplo, const MKL_INT *n, const MKL_Complex8 *alpha, const MKL_Complex8 *ap,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *beta,
           MKL_Complex8 *y, const MKL_INT *incy);
void CHPR(const char *uplo, const MKL_INT *n, const float *alpha, const MKL_Complex8 *x, const MKL_INT *incx,
          MKL_Complex8 *ap);
void CHPR2(const char *uplo, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *y, const MKL_INT *incy,
           MKL_Complex8 *ap);
void CTBMV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex8 *a, const MKL_INT *lda, MKL_Complex8 *x, const MKL_INT *incx);
void CTBSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex8 *a, const MKL_INT *lda, MKL_Complex8 *x, const MKL_INT *incx);
void CTPMV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex8 *ap, MKL_Complex8 *x, const MKL_INT *incx);
void CTPSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex8 *ap, MKL_Complex8 *x, const MKL_INT *incx);
void CTRMV(const char *uplo, const char *transa, const char *diag, const MKL_INT *n,
           const MKL_Complex8 *a, const MKL_INT *lda, MKL_Complex8 *b, const MKL_INT *incx);
void CTRSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex8 *a, const MKL_INT *lda, MKL_Complex8 *x, const MKL_INT *incx);

void DGBMV(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_INT *kl, const MKL_INT *ku,
           const double *alpha, const double *a, const MKL_INT *lda, const double *x, const MKL_INT *incx,
           const double *beta, double *y, const MKL_INT *incy);
void DGEMV(const char *trans, const MKL_INT *m, const MKL_INT *n, const double *alpha,
           const double *a, const MKL_INT *lda, const double *x, const MKL_INT *incx,
           const double *beta, double *y, const MKL_INT *incy);
void DGER(const MKL_INT *m, const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
          const double *y, const MKL_INT *incy, double *a, const MKL_INT *lda);
void DSBMV(const char *uplo, const MKL_INT *n, const MKL_INT *k, const double *alpha,
           const double *a, const MKL_INT *lda, const double *x, const MKL_INT *incx,
           const double *beta, double *y, const MKL_INT *incy);
void DSPMV(const char *uplo, const MKL_INT *n, const double *alpha, const double *ap,
           const double *x, const MKL_INT *incx, const double *beta, double *y, const MKL_INT *incy);
void DSPR(const char *uplo, const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx, double *ap);
void DSPR2(const char *uplo, const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
           const double *y, const MKL_INT *incy, double *ap);
void DSYMV(const char *uplo, const MKL_INT *n, const double *alpha, const double *a, const MKL_INT *lda,
           const double *x, const MKL_INT *incx, const double *beta, double *y, const MKL_INT *incy);
void DSYR(const char *uplo, const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
          double *a, const MKL_INT *lda);
void DSYR2(const char *uplo, const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
           const double *y, const MKL_INT *incy, double *a, const MKL_INT *lda);
void DTBMV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const double *a, const MKL_INT *lda, double *x, const MKL_INT *incx);
void DTBSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const double *a, const MKL_INT *lda, double *x, const MKL_INT *incx);
void DTPMV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const double *ap, double *x, const MKL_INT *incx);
void DTPSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const double *ap, double *x, const MKL_INT *incx);
void DTRMV(const char *uplo, const char *transa, const char *diag, const MKL_INT *n,
           const double *a, const MKL_INT *lda, double *b, const MKL_INT *incx);
void DTRSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const double *a, const MKL_INT *lda, double *x, const MKL_INT *incx);

void ZGBMV(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_INT *kl, const MKL_INT *ku,
           const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const MKL_Complex16 *x, const MKL_INT *incx, const MKL_Complex16 *beta,
           MKL_Complex16 *y, const MKL_INT *incy);
void ZGEMV(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *a, const MKL_INT *lda, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *beta, MKL_Complex16 *y, const MKL_INT *incy);
void ZGERC(const MKL_INT *m, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *x, const MKL_INT *incx, const MKL_Complex16 *y, const MKL_INT *incy,
           MKL_Complex16 *a, const MKL_INT *lda);
void ZGERU(const MKL_INT *m, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *x, const MKL_INT *incx, const MKL_Complex16 *y, const MKL_INT *incy,
           MKL_Complex16 *a, const MKL_INT *lda);
void ZHBMV(const char *uplo, const MKL_INT *n, const MKL_INT *k, const MKL_Complex16 *alpha,
           const MKL_Complex16 *a, const MKL_INT *lda, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *beta, MKL_Complex16 *y, const MKL_INT *incy);
void ZHEMV(const char *uplo, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *a, const MKL_INT *lda, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *beta, MKL_Complex16 *y, const MKL_INT *incy);
void ZHER(const char *uplo, const MKL_INT *n, const double *alpha,
          const MKL_Complex16 *x, const MKL_INT *incx, MKL_Complex16 *a, const MKL_INT *lda);
void ZHER2(const char *uplo, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *x, const MKL_INT *incx, const MKL_Complex16 *y, const MKL_INT *incy,
           MKL_Complex16 *a, const MKL_INT *lda);
void ZHPMV(const char *uplo, const MKL_INT *n, const MKL_Complex16 *alpha, const MKL_Complex16 *ap,
           const MKL_Complex16 *x, const MKL_INT *incx, const MKL_Complex16 *beta,
           MKL_Complex16 *y, const MKL_INT *incy);
void ZHPR(const char *uplo, const MKL_INT *n, const double *alpha, const MKL_Complex16 *x,
          const MKL_INT *incx, MKL_Complex16 *ap);
void ZHPR2(const char *uplo, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *x, const MKL_INT *incx, const MKL_Complex16 *y, const MKL_INT *incy,
           MKL_Complex16 *ap);
void ZTBMV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *x, const MKL_INT *incx);
void ZTBSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *x, const MKL_INT *incx);
void ZTPMV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex16 *ap, MKL_Complex16 *x, const MKL_INT *incx);
void ZTPSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           MKL_Complex16 *ap, MKL_Complex16 *x, const MKL_INT *incx);
void ZTRMV(const char *uplo, const char *transa, const char *diag, const MKL_INT *n,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *b, const MKL_INT *incx);
void ZTRSV(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *x, const MKL_INT *incx);

/* BLAS Level3 */

void SGEMM(const char *transa, const char *transb, const MKL_INT *m, const MKL_INT *n, const MKL_INT *k,
           const float *alpha, const float *a, const MKL_INT *lda, const float *b, const MKL_INT *ldb,
           const float *beta, float *c, const MKL_INT *ldc);
void SSYMM(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const float *alpha, const float *a, const MKL_INT *lda, const float *b, const MKL_INT *ldb,
           const float *beta, float *c, const MKL_INT *ldc);
void SSYR2K(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const float *alpha, const float *a, const MKL_INT *lda, const float *b, const MKL_INT *ldb,
            const float *beta, float *c, const MKL_INT *ldc);
void SSYRK(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const float *alpha, const float *a, const MKL_INT *lda,
           const float *beta, float *c, const MKL_INT *ldc);
void STRMM(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const float *alpha, const float *a, const MKL_INT *lda,
           float *b, const MKL_INT *ldb);
void STRSM(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const float *alpha, const float *a, const MKL_INT *lda,
           float *b, const MKL_INT *ldb);

void CGEMM(const char *transa, const char *transb, const MKL_INT *m, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
           const MKL_Complex8 *b, const MKL_INT *ldb, const MKL_Complex8 *beta,
           MKL_Complex8 *c, const MKL_INT *ldc);
void CHEMM(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
           const MKL_Complex8 *b, const MKL_INT *ldb, const MKL_Complex8 *beta,
           MKL_Complex8 *c, const MKL_INT *ldc);
void CHER2K(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
            const MKL_Complex8 *b, const MKL_INT *ldb, const float *beta,
            MKL_Complex8 *c, const MKL_INT *ldc);
void CHERK(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const float *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
           const float *beta, MKL_Complex8 *c, const MKL_INT *ldc);
void CSYMM(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda, const MKL_Complex8 *b, const MKL_INT *ldb,
           const MKL_Complex8 *beta, MKL_Complex8 *c, const MKL_INT *ldc);
void CSYR2K(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
            const MKL_Complex8 *b, const MKL_INT *ldb,
            const MKL_Complex8 *beta, MKL_Complex8 *c, const MKL_INT *ldc);
void CSYRK(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
           const MKL_Complex8 *beta, MKL_Complex8 *c, const MKL_INT *ldc);
void CTRMM(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda,
           MKL_Complex8 *b, const MKL_INT *ldb);
void CTRSM(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda,
           MKL_Complex8 *b, const MKL_INT *ldb);

void DGEMM(const char *transa, const char *transb, const MKL_INT *m, const MKL_INT *n, const MKL_INT *k,
           const double *alpha, const double *a, const MKL_INT *lda, const double *b, const MKL_INT *ldb,
           const double *beta, double *c, const MKL_INT *ldc);
void DSYMM(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const double *alpha, const double *a, const MKL_INT *lda, const double *b, const MKL_INT *ldb,
           const double *beta, double *c, const MKL_INT *ldc);
void DSYR2K(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const double *alpha, const double *a, const MKL_INT *lda, const double *b, const MKL_INT *ldb,
            double *beta, double *c, const MKL_INT *ldc);
void DSYRK(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const double *alpha, const double *a, const MKL_INT *lda, const double *beta,
           double *c, const MKL_INT *ldc);
void DTRMM(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const double *alpha, const double *a, const MKL_INT *lda,
           double *b, const MKL_INT *ldb);
void DTRSM(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const double *alpha, const double *a, const MKL_INT *lda,
           double *b, const MKL_INT *ldb);

void ZGEMM(const char *transa, const char *transb, const MKL_INT *m, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const MKL_Complex16 *b, const MKL_INT *ldb, const MKL_Complex16 *beta,
           MKL_Complex16 *c, const MKL_INT *ldc);
void ZHEMM(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const MKL_Complex16 *b, const MKL_INT *ldb, const MKL_Complex16 *beta,
           MKL_Complex16 *c, const MKL_INT *ldc);
void ZHER2K(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
            const MKL_Complex16 *b, const MKL_INT *ldb, const double *beta,
            MKL_Complex16 *c, const MKL_INT *ldc);
void ZHERK(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const double *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const double *beta, MKL_Complex16 *c, const MKL_INT *ldc);
void ZSYMM(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const MKL_Complex16 *b, const MKL_INT *ldb, const MKL_Complex16 *beta,
           MKL_Complex16 *c, const MKL_INT *ldc);
void ZSYR2K(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
            const MKL_Complex16 *b, const MKL_INT *ldb, const MKL_Complex16 *beta,
            MKL_Complex16 *c, const MKL_INT *ldc);
void ZSYRK(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const MKL_Complex16 *beta, MKL_Complex16 *c, const MKL_INT *ldc);
void ZTRMM(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *b, const MKL_INT *ldb);
void ZTRSM(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *b, const MKL_INT *ldb);

/* Lower case declaration */

void xerbla(const char *srname, const int *info, const int lsrname);
int lsame(const char *ca, const char *cb, const MKL_INT lca, const MKL_INT lcb);

/* BLAS Level1 */
double dcabs1(MKL_Complex16 *z);
float sasum(const MKL_INT *n, const float *x, const MKL_INT *incx);
void  saxpy(const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
            float *y, const MKL_INT *incy);
void  saxpyi(const MKL_INT *nz, const float *a, const float *x, const MKL_INT *indx, float *y);
float scasum(const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx);
float scnrm2(const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx);
void  scopy(const MKL_INT *n, const float *x, const MKL_INT *incx, float *y, const MKL_INT *incy);
float sdot(const MKL_INT *n, const float *x, const MKL_INT *incx, const float *y, const MKL_INT *incy);
float sdoti(const MKL_INT *nz, const float *x, const MKL_INT *indx, const float *y);
void  sgthr(const MKL_INT *nz, const float *y, float *x, const MKL_INT *indx);
void  sgthrz(const MKL_INT *nz, float *y, float *x, const MKL_INT *indx);
float snrm2(const MKL_INT *n, const float *x, const MKL_INT *incx);
void  srot(const MKL_INT *n, float *x, const MKL_INT *incx, float *y, const MKL_INT *incy,
           const float *c, const float *s);
void  srotg(float *a,float *b,float *c,float *s);
void  sroti(const MKL_INT *nz, float *x, const MKL_INT *indx, float *y, const float *c, const float *s);
void  srotm(const MKL_INT *n, float *x, const MKL_INT *incx, float *y, const MKL_INT *incy, const float *param);
void  srotmg(float *d1, float *d2, float *x1, const float *y1, float *param);
void  sscal(const MKL_INT *n, const float *a, float *x, const MKL_INT *incx);
void  ssctr(const MKL_INT *nz, const float *x, const MKL_INT *indx, float *y);
void  sswap(const MKL_INT *n, float *x, const MKL_INT *incx, float *y, const MKL_INT *incy);
MKL_INT   isamax(const MKL_INT *n, const float *x, const MKL_INT *incx);
MKL_INT   isamin(const MKL_INT *n, const float *x, const MKL_INT *incx);

void caxpy(const MKL_INT *n, const MKL_Complex8 *alpha, const MKL_Complex8 *x, const MKL_INT *incx,
           MKL_Complex8 *y, const MKL_INT *incy);
void caxpyi(const MKL_INT *nz, const MKL_Complex8 *a, const MKL_Complex8 *x, const MKL_INT *indx,
            MKL_Complex8 *y);
void ccopy(const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx, MKL_Complex8 *y, const MKL_INT *incy);
void cdotc(MKL_Complex8 *pres, const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx,
           const MKL_Complex8 *y, const MKL_INT *incy);
void cdotci(MKL_Complex8 *pres, const MKL_INT *nz, const MKL_Complex8 *x, const MKL_INT *indx,
            const MKL_Complex8 *y);
void cdotu(MKL_Complex8 *pres, const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx,
           const MKL_Complex8 *y, const MKL_INT *incy);
void cdotui(MKL_Complex8 *pres, const MKL_INT *nz, const MKL_Complex8 *x, const MKL_INT *indx,
            const MKL_Complex8 *y);
void cgthr(const MKL_INT *nz, const MKL_Complex8 *y, MKL_Complex8 *x, const MKL_INT *indx);
void cgthrz(const MKL_INT *nz, MKL_Complex8 *y, MKL_Complex8 *x, const MKL_INT *indx);
void crotg(MKL_Complex8 *a, const MKL_Complex8 *b, float *c, MKL_Complex8 *s);
void cscal(const MKL_INT *n, const MKL_Complex8 *a, MKL_Complex8 *x, const MKL_INT *incx);
void csctr(const MKL_INT *nz, const MKL_Complex8 *x, const MKL_INT *indx, MKL_Complex8 *y);
void csrot(const MKL_INT *n, MKL_Complex8 *x, const MKL_INT *incx, MKL_Complex8 *y, const MKL_INT *incy,
           const float *c, const float *s);
void csscal(const MKL_INT *n, const float *a, MKL_Complex8 *x, const MKL_INT *incx);
void cswap(const MKL_INT *n, MKL_Complex8 *x, const MKL_INT *incx, MKL_Complex8 *y, const MKL_INT *incy);
MKL_INT  icamax(const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx);
MKL_INT  icamin(const MKL_INT *n, const MKL_Complex8 *x, const MKL_INT *incx);

double dasum(const MKL_INT *n, const double *x, const MKL_INT *incx);
void   daxpy(const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
             double *y, const MKL_INT *incy);
void   daxpyi(const MKL_INT *nz, const double *a, const double *x, const MKL_INT *indx, double *y);
void   dcopy(const MKL_INT *n, const double *x, const MKL_INT *incx, double *y, const MKL_INT *incy);
double ddot(const MKL_INT *n, const double *x, const MKL_INT *incx, const double *y, const MKL_INT *incy);
double ddoti(const MKL_INT *nz, const double *x, const MKL_INT *indx, const double *y);
void   dgthr(const MKL_INT *nz, const double *y, double *x, const MKL_INT *indx);
void   dgthrz(const MKL_INT *nz, double *y, double *x, const MKL_INT *indx);
double dnrm2(const MKL_INT *n, const double *x, const MKL_INT *incx);
void   drot(const MKL_INT *n, double *x, const MKL_INT *incx, double *y, const MKL_INT *incy,
            const double *c, const double *s);
void   drotg(double *a, double *b, double *c, double *s);
void   droti(const MKL_INT *nz, double *x, const MKL_INT *indx, double *y, const double *c, const double *s);
void   drotm(const MKL_INT *n, double *x, const MKL_INT *incx, double *y, const MKL_INT *incy, const double *param);
void   drotmg(double *d1, double *d2, double *x1, const double *y1, double *param);
void   dscal(const MKL_INT *n, const double *a, double *x, const MKL_INT *incx);
void   dsctr(const MKL_INT *nz, const double *x, const MKL_INT *indx, double *y);
void   dswap(const MKL_INT *n, double *x, const MKL_INT *incx, double *y, const MKL_INT *incy);
double dzasum(const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx);
double dznrm2(const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx);
MKL_INT    idamax(const MKL_INT *n, const double *x, const MKL_INT *incx);
MKL_INT    idamin(const MKL_INT *n, const double *x, const MKL_INT *incx);

void zaxpy(const MKL_INT *n, const MKL_Complex16 *alpha, const MKL_Complex16 *x, const MKL_INT *incx,
           MKL_Complex16 *y, const MKL_INT *incy);
void zaxpyi(const MKL_INT *nz, const MKL_Complex16 *a, const MKL_Complex16 *x, const MKL_INT *indx,
            MKL_Complex16 *y);
void zcopy(const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx,
           MKL_Complex16 *y, const MKL_INT *incy);
void zdotc(MKL_Complex16 *pres, const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *y, const MKL_INT *incy);
void zdotci(MKL_Complex16 *pres, const MKL_INT *nz, const MKL_Complex16 *x, const MKL_INT *indx,
            const MKL_Complex16 *y);
void zdotu(MKL_Complex16 *pres, const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *y, const MKL_INT *incy);
void zdotui(MKL_Complex16 *pres, const MKL_INT *nz, const MKL_Complex16 *x, const MKL_INT *indx,
            const MKL_Complex16 *y);
void zdrot(const MKL_INT *n, MKL_Complex16 *x, const MKL_INT *incx, MKL_Complex16 *y, const MKL_INT *incy,
           const double *c, const double *s);
void zdscal(const MKL_INT *n, const double *a, MKL_Complex16 *x, const MKL_INT *incx);
void zgthr(const MKL_INT *nz, const MKL_Complex16 *y, MKL_Complex16 *x, const MKL_INT *indx);
void zgthrz(const MKL_INT *nz, MKL_Complex16 *y, MKL_Complex16 *x, const MKL_INT *indx);
void zrotg(MKL_Complex16 *a, const MKL_Complex16 *b, double *c, MKL_Complex16 *s);
void zscal(const MKL_INT *n, const MKL_Complex16 *a, MKL_Complex16 *x, const MKL_INT *incx);
void zsctr(const MKL_INT *nz, const MKL_Complex16 *x, const MKL_INT *indx, MKL_Complex16 *y);
void zswap(const MKL_INT *n, MKL_Complex16 *x, const MKL_INT *incx, MKL_Complex16 *y, const MKL_INT *incy);
MKL_INT  izamax(const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx);
MKL_INT  izamin(const MKL_INT *n, const MKL_Complex16 *x, const MKL_INT *incx);

/* blas level2 */

void sgbmv(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_INT *kl, const MKL_INT *ku,
           const float *alpha, const float *a, const MKL_INT *lda, const float *x, const MKL_INT *incx,
           const float *beta, float *y, const MKL_INT *incy);
void sgemv(const char *trans, const MKL_INT *m, const MKL_INT *n, const float *alpha,
           const float *a, const MKL_INT *lda, const float *x, const MKL_INT *incx,
           const float *beta, float *y, const MKL_INT *incy);
void sger(const MKL_INT *m, const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
          const float *y, const MKL_INT *incy, float *a, const MKL_INT *lda);
void ssbmv(const char *uplo, const MKL_INT *n, const MKL_INT *k, const float *alpha,
           const float *a, const MKL_INT *lda, const float *x, const MKL_INT *incx,
           const float *beta, float *y, const MKL_INT *incy);
void sspmv(const char *uplo, const MKL_INT *n, const float *alpha, const float *ap,
           const float *x, const MKL_INT *incx, const float *beta, float *y, const MKL_INT *incy);
void sspr(const char *uplo, const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
          float *ap);
void sspr2(const char *uplo, const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
           const float *y, const MKL_INT *incy, float *ap);
void ssymv(const char *uplo, const MKL_INT *n, const float *alpha, const float *a, const MKL_INT *lda,
           const float *x, const MKL_INT *incx, const float *beta, float *y, const MKL_INT *incy);
void ssyr(const char *uplo, const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
          float *a, const MKL_INT *lda);
void ssyr2(const char *uplo, const MKL_INT *n, const float *alpha, const float *x, const MKL_INT *incx,
           const float *y, const MKL_INT *incy, float *a, const MKL_INT *lda);
void stbmv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const float *a, const MKL_INT *lda, float *x, const MKL_INT *incx);
void stbsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const float *a, const MKL_INT *lda, float *x, const MKL_INT *incx);
void stpmv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const float *ap,
           float *x, const MKL_INT *incx);
void stpsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const float *ap,
           float *x, const MKL_INT *incx);
void strmv(const char *uplo, const char *transa, const char *diag, const MKL_INT *n, const float *a,
           const MKL_INT *lda, float *b, const MKL_INT *incx);
void strsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const float *a, const MKL_INT *lda, float *x, const MKL_INT *incx);

void cgbmv(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_INT *kl, const MKL_INT *ku,
           const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *beta,
           MKL_Complex8 *y, const MKL_INT *incy);
void cgemv(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda, const MKL_Complex8 *x, const MKL_INT *incx,
           const MKL_Complex8 *beta, MKL_Complex8 *y, const MKL_INT *incy);
void cgerc(const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *y, const MKL_INT *incy,
           MKL_Complex8 *a, const MKL_INT *lda);
void cgeru(const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *y, const MKL_INT *incy,
           MKL_Complex8 *a, const MKL_INT *lda);
void chbmv(const char *uplo, const MKL_INT *n, const MKL_INT *k, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda, const MKL_Complex8 *x, const MKL_INT *incx,
           const MKL_Complex8 *beta, MKL_Complex8 *y, const MKL_INT *incy);
void chemv(const char *uplo, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda, const MKL_Complex8 *x, const MKL_INT *incx,
           const MKL_Complex8 *beta, MKL_Complex8 *y, const MKL_INT *incy);
void cher(const char *uplo, const MKL_INT *n, const float *alpha, const MKL_Complex8 *x, const MKL_INT *incx,
          MKL_Complex8 *a, const MKL_INT *lda);
void cher2(const char *uplo, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *y, const MKL_INT *incy,
           MKL_Complex8 *a, const MKL_INT *lda);
void chpmv(const char *uplo, const MKL_INT *n, const MKL_Complex8 *alpha, const MKL_Complex8 *ap,
           const MKL_Complex8 *x, const MKL_INT *incx, const MKL_Complex8 *beta,
           MKL_Complex8 *y, const MKL_INT *incy);
void chpr(const char *uplo, const MKL_INT *n, const float *alpha, const MKL_Complex8 *x, const MKL_INT *incx,
          MKL_Complex8 *ap);
void chpr2(const char *uplo, const MKL_INT *n, const MKL_Complex8 *alpha, const MKL_Complex8 *x, const MKL_INT *incx,
           const MKL_Complex8 *y, const MKL_INT *incy, MKL_Complex8 *ap);
void ctbmv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex8 *a, const MKL_INT *lda, MKL_Complex8 *x, const MKL_INT *incx);
void ctbsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex8 *a, const MKL_INT *lda, MKL_Complex8 *x, const MKL_INT *incx);
void ctpmv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex8 *ap, MKL_Complex8 *x, const MKL_INT *incx);
void ctpsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex8 *ap, MKL_Complex8 *x, const MKL_INT *incx);
void ctrmv(const char *uplo, const char *transa, const char *diag, const MKL_INT *n,
           const MKL_Complex8 *a, const MKL_INT *lda, MKL_Complex8 *b, const MKL_INT *incx);
void ctrsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex8 *a, const MKL_INT *lda, MKL_Complex8 *x, const MKL_INT *incx);

void dgbmv(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_INT *kl, const MKL_INT *ku,
           const double *alpha, const double *a, const MKL_INT *lda, const double *x, const MKL_INT *incx,
           const double *beta, double *y, const MKL_INT *incy);
void dgemv(const char *trans, const MKL_INT *m, const MKL_INT *n, const double *alpha,
           const double *a, const MKL_INT *lda, const double *x, const MKL_INT *incx,
           const double *beta, double *y, const MKL_INT *incy);
void dger(const MKL_INT *m, const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
          const double *y, const MKL_INT *incy, double *a, const MKL_INT *lda);
void dsbmv(const char *uplo, const MKL_INT *n, const MKL_INT *k, const double *alpha,
           const double *a, const MKL_INT *lda, const double *x, const MKL_INT *incx,
           const double *beta, double *y, const MKL_INT *incy);
void dspmv(const char *uplo, const MKL_INT *n, const double *alpha, const double *ap,
           const double *x, const MKL_INT *incx, const double *beta,
           double *y, const MKL_INT *incy);
void dspr(const char *uplo, const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
          double *ap);
void dspr2(const char *uplo, const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
           const double *y, const MKL_INT *incy, double *ap);
void dsymv(const char *uplo, const MKL_INT *n, const double *alpha, const double *a, const MKL_INT *lda,
           const double *x, const MKL_INT *incx, const double *beta, double *y, const MKL_INT *incy);
void dsyr(const char *uplo, const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
          double *a, const MKL_INT *lda);
void dsyr2(const char *uplo, const MKL_INT *n, const double *alpha, const double *x, const MKL_INT *incx,
           const double *y, const MKL_INT *incy, double *a, const MKL_INT *lda);
void dtbmv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const double *a, const MKL_INT *lda, double *x, const MKL_INT *incx);
void dtbsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const double *a, const MKL_INT *lda, double *x, const MKL_INT *incx);
void dtpmv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const double *ap, double *x, const MKL_INT *incx);
void dtpsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const double *ap, double *x, const MKL_INT *incx);
void dtrmv(const char *uplo, const char *transa, const char *diag, const MKL_INT *n,
           const double *a, const MKL_INT *lda, double *b, const MKL_INT *incx);
void dtrsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const double *a, const MKL_INT *lda, double *x, const MKL_INT *incx);

void zgbmv(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_INT *kl, const MKL_INT *ku,
           const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const MKL_Complex16 *x, const MKL_INT *incx, const MKL_Complex16 *beta,
           MKL_Complex16 *y, const MKL_INT *incy);
void zgemv(const char *trans, const MKL_INT *m, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *a, const MKL_INT *lda, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *beta, MKL_Complex16 *y, const MKL_INT *incy);
void zgerc(const MKL_INT *m, const MKL_INT *n, const MKL_Complex16 *alpha, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *y, const MKL_INT *incy, MKL_Complex16 *a, const MKL_INT *lda);
void zgeru(const MKL_INT *m, const MKL_INT *n, const MKL_Complex16 *alpha, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *y, const MKL_INT *incy, MKL_Complex16 *a, const MKL_INT *lda);
void zhbmv(const char *uplo, const MKL_INT *n, const MKL_INT *k, const MKL_Complex16 *alpha,
           const MKL_Complex16 *a, const MKL_INT *lda, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *beta, MKL_Complex16 *y, const MKL_INT *incy);
void zhemv(const char *uplo, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *a, const MKL_INT *lda, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *beta, MKL_Complex16 *y, const MKL_INT *incy);
void zher(const char *uplo, const MKL_INT *n, const double *alpha, const MKL_Complex16 *x, const MKL_INT *incx,
          MKL_Complex16 *a, const MKL_INT *lda);
void zher2(const char *uplo, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *x, const MKL_INT *incx, const MKL_Complex16 *y, const MKL_INT *incy,
           MKL_Complex16 *a, const MKL_INT *lda);
void zhpmv(const char *uplo, const MKL_INT *n, const MKL_Complex16 *alpha, const MKL_Complex16 *ap,
           const MKL_Complex16 *x, const MKL_INT *incx, const MKL_Complex16 *beta,
           MKL_Complex16 *y, const MKL_INT *incy);
void zhpr(const char *uplo, const MKL_INT *n, const double *alpha, const MKL_Complex16 *x, const MKL_INT *incx,
          MKL_Complex16 *ap);
void zhpr2(const char *uplo, const MKL_INT *n, const MKL_Complex16 *alpha, const MKL_Complex16 *x, const MKL_INT *incx,
           const MKL_Complex16 *y, const MKL_INT *incy, MKL_Complex16 *ap);
void ztbmv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *x, const MKL_INT *incx);
void ztbsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *x, const MKL_INT *incx);
void ztpmv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex16 *ap, MKL_Complex16 *x, const MKL_INT *incx);
void ztpsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex16 *ap, MKL_Complex16 *x, const MKL_INT *incx);
void ztrmv(const char *uplo, const char *transa, const char *diag, const MKL_INT *n,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *b, const MKL_INT *incx);
void ztrsv(const char *uplo, const char *trans, const char *diag, const MKL_INT *n,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *x, const MKL_INT *incx);

/* blas level3 */

void sgemm(const char *transa, const char *transb, const MKL_INT *m, const MKL_INT *n, const MKL_INT *k,
           const float *alpha, const float *a, const MKL_INT *lda, const float *b, const MKL_INT *ldb,
           const float *beta, float *c, const MKL_INT *ldc);
void ssymm(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const float *alpha, const float *a, const MKL_INT *lda, const float *b, const MKL_INT *ldb,
           const float *beta, float *c, const MKL_INT *ldc);
void ssyr2k(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const float *alpha, const float *a, const MKL_INT *lda, const float *b, const MKL_INT *ldb,
            float *beta, float *c, const MKL_INT *ldc);
void ssyrk(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const float *alpha, const float *a, const MKL_INT *lda, const float *beta,
           float *c, const MKL_INT *ldc);
void strmm(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const float *alpha, const float *a, const MKL_INT *lda,
           float *b, const MKL_INT *ldb);
void strsm(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const float *alpha, const float *a, const MKL_INT *lda,
           float *b, const MKL_INT *ldb);

void cgemm(const char *transa, const char *transb, const MKL_INT *m, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
           const MKL_Complex8 *b, const MKL_INT *ldb, const MKL_Complex8 *beta,
           MKL_Complex8 *c, const MKL_INT *ldc);
void chemm(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
           const MKL_Complex8 *b, const MKL_INT *ldb, const MKL_Complex8 *beta,
           MKL_Complex8 *c, const MKL_INT *ldc);
void cher2k(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
            const MKL_Complex8 *b, const MKL_INT *ldb, const float *beta,
            MKL_Complex8 *c, const MKL_INT *ldc);
void cherk(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const float *alpha, const MKL_Complex8 *a, const MKL_INT *lda, const float *beta,
           MKL_Complex8 *c, const MKL_INT *ldc);
void csymm(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
           const MKL_Complex8 *b, const MKL_INT *ldb, const MKL_Complex8 *beta,
           MKL_Complex8 *c, const MKL_INT *ldc);
void csyr2k(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
            const MKL_Complex8 *b, const MKL_INT *ldb, const MKL_Complex8 *beta,
            MKL_Complex8 *c, const MKL_INT *ldc);
void csyrk(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex8 *alpha, const MKL_Complex8 *a, const MKL_INT *lda,
           const MKL_Complex8 *beta, MKL_Complex8 *c, const MKL_INT *ldc);
void ctrmm(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda, MKL_Complex8 *b, const MKL_INT *ldb);
void ctrsm(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const MKL_Complex8 *alpha,
           const MKL_Complex8 *a, const MKL_INT *lda, MKL_Complex8 *b, const MKL_INT *ldb);

void dgemm(const char *transa, const char *transb, const MKL_INT *m, const MKL_INT *n, const MKL_INT *k,
           const double *alpha, const double *a, const MKL_INT *lda, const double *b, const MKL_INT *ldb,
           const double *beta, double *c, const MKL_INT *ldc);
void dsymm(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const double *alpha, const double *a, const MKL_INT *lda, const double *b, const MKL_INT *ldb,
           const double *beta, double *c, const MKL_INT *ldc);
void dsyr2k(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const double *alpha, const double *a, const MKL_INT *lda, const double *b, const MKL_INT *ldb,
            const double *beta, double *c, const MKL_INT *ldc);
void dsyrk(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const double *alpha, const double *a, const MKL_INT *lda, const double *beta,
           double *c, const MKL_INT *ldc);
void dtrmm(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const double *alpha, const double *a, const MKL_INT *lda,
           double *b, const MKL_INT *ldb);
void dtrsm(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const double *alpha, const double *a, const MKL_INT *lda,
           double *b, const MKL_INT *ldb);

void zgemm(const char *transa, const char *transb, const MKL_INT *m, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const MKL_Complex16 *b, const MKL_INT *ldb, const MKL_Complex16 *beta,
           MKL_Complex16 *c, const MKL_INT *ldc);
void zhemm(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const MKL_Complex16 *b, const MKL_INT *ldb, const MKL_Complex16 *beta,
           MKL_Complex16 *c, const MKL_INT *ldc);
void zher2k(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
            const MKL_Complex16 *b, const MKL_INT *ldb, const double *beta,
            MKL_Complex16 *c, const MKL_INT *ldc);
void zherk(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const double *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const double *beta, MKL_Complex16 *c, const MKL_INT *ldc);
void zsymm(const char *side, const char *uplo, const MKL_INT *m, const MKL_INT *n,
           const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const MKL_Complex16 *b, const MKL_INT *ldb, const MKL_Complex16 *beta,
           MKL_Complex16 *c, const MKL_INT *ldc);
void zsyr2k(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
            const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
            const MKL_Complex16 *b, const MKL_INT *ldb, const MKL_Complex16 *beta,
            MKL_Complex16 *c, const MKL_INT *ldc);
void zsyrk(const char *uplo, const char *trans, const MKL_INT *n, const MKL_INT *k,
           const MKL_Complex16 *alpha, const MKL_Complex16 *a, const MKL_INT *lda,
           const MKL_Complex16 *beta, MKL_Complex16 *c, const MKL_INT *ldc);
void ztrmm(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *b, const MKL_INT *ldb);
void ztrsm(const char *side, const char *uplo, const char *transa, const char *diag,
           const MKL_INT *m, const MKL_INT *n, const MKL_Complex16 *alpha,
           const MKL_Complex16 *a, const MKL_INT *lda, MKL_Complex16 *b, const MKL_INT *ldb);


#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* _MKL_BLAS_H_ */
