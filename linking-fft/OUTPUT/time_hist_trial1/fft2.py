#! /usr/bin/env python
from matplotlib import pyplot as plt
from numpy import genfromtxt
fig = plt.figure(1)
ax = plt.subplot(111)
x = genfromtxt('fft2_x.dat', dtype='float')
h, b, p = plt.hist(x, bins = 4000)
plt.title('n = 1024, total trials = 1000000', fontsize=20) 
plt.show() 
