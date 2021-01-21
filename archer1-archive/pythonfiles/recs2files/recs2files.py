import numpy as np
import MITgcmutils as mit

floc = '/fs4/n01/n01/shared/SOSE/Iter100/DAILY/'
gloc = '/fs4/n01/n01/shared/SOSEfiles/'

L = ['KPPghatK']

for item in L:
    for x in range(0,2192):
        f = mit.rdmds(floc+item,100,rec=x)
        g = mit.wrmds(gloc+item,f,x+1)
