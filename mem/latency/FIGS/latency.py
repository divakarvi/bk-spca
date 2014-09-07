#! /usr/bin/env python
from matplotlib import pyplot as plt
from numpy import genfromtxt
fig = plt.figure(1)
ax = plt.subplot(111)
x = genfromtxt('latency_x.dat', dtype='float')
h, b, p = plt.hist(x, bins = 150)
plt.title('latency to dram, each measurement used one page', fontsize=20) 
plt.savefig('latency.eps') 
