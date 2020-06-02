import numpy as np
import MITgcmutils as mit

floc = '/home/n01/n01/dannes1/work/experiments/exposeOffline_c65i/run_ad/'

L = ['PTRACER01']

for item in L:
    f = mit.rdmds(floc+item,1)


