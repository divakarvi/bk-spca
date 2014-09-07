#! /usr/bin/env python
import numpy as np
from scipy import fftpack
from scipy import linalg
from StringIO import StringIO
import sys

def read(fname):
    return np.genfromtxt(fname, dtype='float')

def verify(v, vf):
    """
    v = name of file with data for complex vector v
    vf = name of file with data for complex vector vf
    checks if vf is the fft of v
    """
    v = read(v).T
    n = v.shape[0]
    vf = read(vf).T
    j = complex(0,1);
    v = v[:,0] + j*v[:,1]
    vf = vf[:,0] + j*vf[:,1]
    vff = fftpack.fft(v)/n
    rerror = linalg.norm(vf-vff)/linalg.norm(vff);
    print '\n\n\tpython verify'
    print '\tn = ', n
    print '\trel error  = ', rerror
    

if(__name__ == "__main__"):
    verify(sys.argv[1], sys.argv[2])
