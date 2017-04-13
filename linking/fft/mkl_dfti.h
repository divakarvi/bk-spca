/*****************************************************************************
!                            INTEL CONFIDENTIAL
! Copyright(C) 2002-2008 Intel Corporation. All Rights Reserved.
! The source code contained  or  described herein and all documents related to
! the source code ("Material") are owned by Intel Corporation or its suppliers
! or licensors.  Title to the  Material remains with  Intel Corporation or its
! suppliers and licensors. The Material contains trade secrets and proprietary
! and  confidential  information of  Intel or its suppliers and licensors. The
! Material  is  protected  by  worldwide  copyright  and trade secret laws and
! treaty  provisions. No part of the Material may be used, copied, reproduced,
! modified, published, uploaded, posted, transmitted, distributed or disclosed
! in any way without Intel's prior express written permission.
! No license  under any  patent, copyright, trade secret or other intellectual
! property right is granted to or conferred upon you by disclosure or delivery
! of the Materials,  either expressly, by implication, inducement, estoppel or
! otherwise.  Any  license  under  such  intellectual property  rights must be
! express and approved by Intel in writing.
!
!*****************************************************************************
! Content:
!    Intel(R) Math Kernel Library (MKL)
!    Discrete Fourier Transform Interface (DFTI)
!****************************************************************************/

#ifndef _MKL_DFTI_H_
#define _MKL_DFTI_H_

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#include "mkl_types.h"

/* Error classes */
#define DFTI_NO_ERROR                    0
#define DFTI_MEMORY_ERROR                1
#define DFTI_INVALID_CONFIGURATION       2
#define DFTI_INCONSISTENT_CONFIGURATION  3
#define DFTI_MULTITHREADED_ERROR         4
#define DFTI_BAD_DESCRIPTOR              5
#define DFTI_UNIMPLEMENTED               6
#define DFTI_MKL_INTERNAL_ERROR          7
#define DFTI_NUMBER_OF_THREADS_ERROR     8
#define DFTI_1D_LENGTH_EXCEEDS_INT32     9

#define DFTI_MAX_MESSAGE_LENGTH 80 /* Maximum length of error string */
#define DFTI_MAX_NAME_LENGTH 10 /* Maximum length of descriptor name */
#define DFTI_VERSION_LENGTH 198 /* Maximum length of MKL version string */
#define DFTI_ERROR_CLASS 60     /* (deprecated) */

/* Descriptor configuration parameters [default values in brackets] */
enum DFTI_CONFIG_PARAM
{
    /* Domain for forward transform. No default value */
    DFTI_FORWARD_DOMAIN = 0,

    /* Dimensionality, or rank. No default value */
    DFTI_DIMENSION = 1,

    /* Length(s) of transform. No default value */
    DFTI_LENGTHS = 2,

    /* Floating point precision. No default value */
    DFTI_PRECISION = 3,

    /* Scale factor for forward transform [1.0] */
    DFTI_FORWARD_SCALE  = 4,

    /* Scale factor for backward transform [1.0] */
    DFTI_BACKWARD_SCALE = 5,

    /* Exponent sign for forward transform [DFTI_NEGATIVE]  */
    /* DFTI_FORWARD_SIGN = 6, ## NOT IMPLEMENTED */

    /* Number of data sets to be transformed [1] */
    DFTI_NUMBER_OF_TRANSFORMS = 7,

    /* Storage of finite complex-valued sequences in complex domain
       [DFTI_COMPLEX_COMPLEX] */
    DFTI_COMPLEX_STORAGE = 8,

    /* Storage of finite real-valued sequences in real domain
       [DFTI_REAL_REAL] */
    DFTI_REAL_STORAGE = 9,

    /* Storage of finite complex-valued sequences in conjugate-even
       domain [DFTI_COMPLEX_REAL] */
    DFTI_CONJUGATE_EVEN_STORAGE = 10,

    /* Placement of result [DFTI_INPLACE] */
    DFTI_PLACEMENT = 11,

    /* Generalized strides for input data layout [tigth, row-major for
       C] */
    DFTI_INPUT_STRIDES = 12,

    /* Generalized strides for output data layout [tight, row-major
       for C] */
    DFTI_OUTPUT_STRIDES = 13,

    /* Distance between first input elements for multiple transforms
       [0] */
    DFTI_INPUT_DISTANCE = 14,

    /* Distance between first output elements for multiple transforms
       [0] */
    DFTI_OUTPUT_DISTANCE = 15,

    /* Effort spent in initialization [DFTI_MEDIUM] */
    /* DFTI_INITIALIZATION_EFFORT = 16, ## NOT IMPLEMENTED */

    /* Use of workspace during computation [DFTI_ALLOW] */
    /* DFTI_WORKSPACE = 17, ## NOT IMPLEMENTED */

    /* Ordering of the result [DFTI_ORDERED] */
    DFTI_ORDERING = 18,

    /* Possible transposition of result [DFTI_NONE] */
    DFTI_TRANSPOSE = 19,

    /* User-settable descriptor name [""] */
    DFTI_DESCRIPTOR_NAME = 20, /* DEPRECATED */

    /* Packing format for DFTI_COMPLEX_REAL storage of finite
       conjugate-even sequences [DFTI_CCS_FORMAT] */
    DFTI_PACKED_FORMAT = 21,

    /* Commit status of the descriptor - R/O parameter */
    DFTI_COMMIT_STATUS = 22,

    /* Version string for this DFTI implementation - R/O parameter */
    DFTI_VERSION = 23,

    /* Ordering of the forward transform - R/O parameter */
    /* DFTI_FORWARD_ORDERING  = 24, ## NOT IMPLEMENTED */

    /* Ordering of the backward transform - R/O parameter */
    /* DFTI_BACKWARD_ORDERING = 25, ## NOT IMPLEMENTED */

    /* Number of user threads that share the descriptor [1] */
    DFTI_NUMBER_OF_USER_THREADS = 26
};

/* Values of the descriptor configuration parameters */
enum DFTI_CONFIG_VALUE
{
    /* DFTI_COMMIT_STATUS */
    DFTI_COMMITTED = 30,
    DFTI_UNCOMMITTED = 31,

    /* DFTI_FORWARD_DOMAIN */
    DFTI_COMPLEX = 32,
    DFTI_REAL = 33,
    /* DFTI_CONJUGATE_EVEN = 34,   ## NOT IMPLEMENTED */

    /* DFTI_PRECISION */
    DFTI_SINGLE = 35,
    DFTI_DOUBLE = 36,

    /* DFTI_FORWARD_SIGN */
    /* DFTI_NEGATIVE = 37,         ## NOT IMPLEMENTED */
    /* DFTI_POSITIVE = 38,         ## NOT IMPLEMENTED */

    /* DFTI_COMPLEX_STORAGE and DFTI_CONJUGATE_EVEN_STORAGE */
    DFTI_COMPLEX_COMPLEX = 39,
    DFTI_COMPLEX_REAL = 40,

    /* DFTI_REAL_STORAGE */
    DFTI_REAL_COMPLEX = 41,
    DFTI_REAL_REAL = 42,

    /* DFTI_PLACEMENT */
    DFTI_INPLACE = 43,          /* Result overwrites input */
    DFTI_NOT_INPLACE = 44,      /* Have another place for result */

    /* DFTI_INITIALIZATION_EFFORT */
    /* DFTI_LOW = 45,              ## NOT IMPLEMENTED */
    /* DFTI_MEDIUM = 46,           ## NOT IMPLEMENTED */
    /* DFTI_HIGH = 47,             ## NOT IMPLEMENTED */

    /* DFTI_ORDERING */
    DFTI_ORDERED = 48,
    DFTI_BACKWARD_SCRAMBLED = 49,
    /* DFTI_FORWARD_SCRAMBLED = 50, ## NOT IMPLEMENTED */

    /* Allow/avoid certain usages */
    DFTI_ALLOW = 51,            /* Allow transposition or workspace */
    /* DFTI_AVOID = 52,            ## NOT IMPLEMENTED */
    DFTI_NONE = 53,

    /* DFTI_PACKED_FORMAT (for storing congugate-even finite sequence
       in real array) */
    DFTI_CCS_FORMAT = 54,       /* Complex conjugate-symmetric */
    DFTI_PACK_FORMAT = 55,      /* Pack format for real DFT */
    DFTI_PERM_FORMAT = 56,      /* Perm format for real DFT */
    DFTI_CCE_FORMAT = 57        /* Complex conjugate-even */
};

typedef struct DFTI_DFT_Desc_struct DFTI_Descriptor_struct;
#define DFTI_Descriptor DFTI_Descriptor_struct
#define DFTI_DESCRIPTOR DFTI_Descriptor
#define DFTI_DESCRIPTOR_HANDLE DFTI_DESCRIPTOR*

MKL_LONG DftiCreateDescriptor(DFTI_DESCRIPTOR_HANDLE*,
                              enum DFTI_CONFIG_VALUE, /* precision */
                              enum DFTI_CONFIG_VALUE, /* domain */
                              MKL_LONG, ...);
MKL_LONG DftiCopyDescriptor(DFTI_DESCRIPTOR_HANDLE, /* from descriptor */
                            DFTI_DESCRIPTOR_HANDLE*); /* to descriptor */
MKL_LONG DftiCommitDescriptor(DFTI_DESCRIPTOR_HANDLE);
MKL_LONG DftiComputeForward(DFTI_DESCRIPTOR_HANDLE, void*, ...);
MKL_LONG DftiComputeBackward(DFTI_DESCRIPTOR_HANDLE, void*, ...);
MKL_LONG DftiSetValue(DFTI_DESCRIPTOR_HANDLE, enum DFTI_CONFIG_PARAM, ...);
MKL_LONG DftiGetValue(DFTI_DESCRIPTOR_HANDLE, enum DFTI_CONFIG_PARAM, ...);
MKL_LONG DftiCopyDescriptor(DFTI_DESCRIPTOR_HANDLE, DFTI_DESCRIPTOR_HANDLE*);
MKL_LONG DftiFreeDescriptor(DFTI_DESCRIPTOR_HANDLE*);
char* DftiErrorMessage(MKL_LONG);
MKL_LONG DftiErrorClass(MKL_LONG, MKL_LONG);
/**********************************************************************
 * INTERNAL INTERFACES. These internal interfaces are not intended to
 * be called directly by MKL users and may change in future releases.
 */
MKL_LONG DftiCreateDescriptor_s_1d(DFTI_DESCRIPTOR_HANDLE *,
                                   enum DFTI_CONFIG_VALUE domain,
                                   MKL_LONG onedim);
MKL_LONG DftiCreateDescriptor_s_md(DFTI_DESCRIPTOR_HANDLE *,
                                   enum DFTI_CONFIG_VALUE domain,
                                   MKL_LONG many,
                                   MKL_LONG * dims);
MKL_LONG DftiCreateDescriptor_d_1d(DFTI_DESCRIPTOR_HANDLE *,
                                   enum DFTI_CONFIG_VALUE domain,
                                   MKL_LONG onedim);
MKL_LONG DftiCreateDescriptor_d_md(DFTI_DESCRIPTOR_HANDLE *,
                                   enum DFTI_CONFIG_VALUE domain,
                                   MKL_LONG many,
                                   MKL_LONG * dims);

/**********************************************************************
 * Compile-time separation of specific cases
 */
#ifndef DftiCreateDescriptor
#define DftiCreateDescriptor(desc,prec,domain,dim,sizes) \
    (/* single precision specific cases */ \
     ((prec)==DFTI_SINGLE && (dim)==1) ? \
     DftiCreateDescriptor_s_1d((desc),(domain),(MKL_LONG)(sizes)) : \
     ((prec)==DFTI_SINGLE) ? \
     DftiCreateDescriptor_s_md((desc),(domain),(dim),(MKL_LONG*)(sizes)) : \
     /* double precision specific cases */ \
     ((prec)==DFTI_DOUBLE && (dim)==1) ? \
     DftiCreateDescriptor_d_1d((desc),(domain),(MKL_LONG)(sizes)) : \
     ((prec)==DFTI_DOUBLE) ? \
     DftiCreateDescriptor_d_md((desc),(domain),(dim),(MKL_LONG*)(sizes)) : \
     /* no specific case matches, fall back to original call */ \
     DftiCreateDescriptor((desc),(prec),(domain),(dim),(sizes)))
#endif

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* _MKL_DFTI_H_ */

