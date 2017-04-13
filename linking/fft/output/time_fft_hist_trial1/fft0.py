#! /usr/bin/env python
import matplotlib as mpl
from matplotlib import pyplot as plt
from numpy import genfromtxt

def hist(x, xmin, xmax, bins):
    def f(xx):
        return (xmin <= xx) and (xx <= xmax)
    
    x = filter(f, x)
    fig = plt.figure(1)
    ax = plt.subplot(111)
    h, b, p = plt.hist(x, bins = bins)
    yticks = ax.get_yticks()
    ax.set_yticks(yticks[1:])
    xticks = ax.get_xticks()
    ax.set_xticks(xticks[::2])
    plt.xlabel("Cycles");
    plt.show() 
    plt.close()

if(__name__ == "__main__"):
    x = genfromtxt('fft0_x.dat', dtype='float')
    mpl.rcParams['font.size'] = 18
    hist(x, 18000, 50000, bins = 150)
    hist(x, 19000, 26000, bins = 150)
    hist(x, 27000, 35000, bins = 40)


