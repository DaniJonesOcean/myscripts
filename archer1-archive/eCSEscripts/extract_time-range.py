#! /usr/local/packages/cse/python/2.7.6-pp/bin/python

##!/usr/bin/python

# *******************************************
# This script reads the meta files from MITgcm
# and extracts the timeStepNumber & timeInterval
#
# by Sudipta Goswami
#
# 04/09/2013
#
# *******************************************

import os

JOBID = 'SO_A02'
# JOBID = 'SO_591'

M_ROOT = '/work/n02/n02/sgoswami/mitgcm/'
M_CASE = M_ROOT + 'cases/' + JOBID + '/'
M_RUN = M_CASE + 'run/'

# Read in filelist
inpFileName = M_CASE + 'times-files.txt'
f = open(inpFileName)
#lines = f.readline()
lines = [line.strip() for line in f]
f.close()

outFileName = M_CASE + JOBID + 'state2D_TI.txt'
output_file = open(outFileName, "w")
# Write out the header line
output_file.write('timeStepNumber\ttimeIntervalStart\ttimeInterval\n')

for filename in lines :
    runfilename = M_RUN+filename
    #print runfilename
    fln = open(runfilename)
    timelines1 = fln.readlines()#[7]
    aln1 = []
    for t1 in timelines1[7].split() :
        try :
	    aln1.append(float(t1))
	except ValueError :
	    pass
    fln.seek(0)
    timelines2 = fln.readlines()[8]
    aln1=str(aln1).replace('[','')
    aln1=str(aln1).replace(']','')
    aln2 = []
    for t2 in timelines2.split() :
        try :
	    aln2.append(float(t2))
	except ValueError :
	    pass
    aln2=str(aln2).replace('[','')
    aln2=str(aln2).replace(']','')
    aln2=str(aln2).replace(', ','\t')
    out_nums1 = str(aln1) + '\t' + str(aln2) + '\n'
    output_file.write(out_nums1)
    fln.close()


output_file.close()
