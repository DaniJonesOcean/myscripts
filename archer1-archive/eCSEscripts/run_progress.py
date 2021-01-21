#! /usr/local/packages/cse/python/2.7.6-pp/bin/python

##!/usr/bin/python

# *******************************************
# Tells the user how many years of simulation are still left.
# by Sudipta Goswami
# Reads the times, sub_archer.sh and repeat_archer.sh files
#
# Usage: ./run_progress AS01_005
# *******************************************

import sys
import os, string, re, time
import datetime

def convertTime(inpValue) :
    # If input is seconds
    
    return outVal

def getEnvVarValue(envVar):
    tmpVal = os.getenv(envVar)
    if not tmpVal:
        print("Environment variable: [%s] not set." % (envVar))
        sys.exit(1)
        
    retValue = tmpVal.strip("'") 
    return retValue

def get_num(x):
    return int(''.join(ele for ele in x if ele.isdigit()))

if len(sys.argv) != 2:
    print "Usage: ./run_progress.py SO_666"
    print "where SO_066 is a JobID in the mitgcm/cases folder"
    sys.exit()
    

M_ROOT=getEnvVarValue('M_ROOT')
File_Path=M_ROOT + '/cases/' + sys.argv[1]
File_Path_R = File_Path + '/run/'
File_Path_S = File_Path + '/scripts/'
File_Path_I = File_Path + '/input/'

# Inp file names and locations
TIMES_FILE = File_Path_R + 'times'
SUB_HEC = File_Path_S + 'sub_archer.sh'
REP_HEC = File_Path_S + 'repeat_archer.sh'
DATA_ST = File_Path_I + 'data'

# Read in ONERUN and FULLRUN
fSH=open(SUB_HEC)
lines=fSH.readlines()
fSH.close()

# If there are multiple integers in the string:

# map(int, re.findall(r'\d+', string1))

for line in lines:
    if not line.strip().startswith("#") :
        if str.find(line, 'ONERUN') != -1 and str.find(line, '$') == -1 :
	    ONERUN = int(re.search(r'\d+', line).group())
	    print 'ONERUN =', ONERUN
        if str.find(line, 'FULLRUN') != -1 and str.find(line, '$') == -1 :
	    FULLRUN = int(re.search(r'\d+', line).group())
	    print 'FULLRUN =', FULLRUN

# Read in WALLTIME
fRH=open(REP_HEC)
lines=fRH.readlines()
fRH.close()

# print WALLTIME
for line in lines:
    if line.strip().startswith("#PBS -l walltime") :
        WALLTIME = time.strptime(re.search(r'\d+:\d+:\d+', line).group(), "%H:%M:%S")

	    
# Read in niter0 from data
fDS = open(DATA_ST)
lines=fDS.readlines()
fDS.close()

for line in lines :
    if line.strip().startswith('niter0') :
	NITER0=get_num(line)
    if line.strip().startswith('deltaT') :
        DELTAT=int(re.search(r'\d+', line).group())

print 'niter0 =', NITER0
print 'deltaT =', DELTAT

if ONERUN > 0 and FULLRUN > 0 :
    ITER_EXPS1=(FULLRUN-NITER0)/(ONERUN)
    ITER_EXPS2 = (FULLRUN-NITER0)/float(ONERUN)
    # ITER_EXP = round(((FULLRUN-NITER0)/float(ONERUN))+0.5,0)
    if ITER_EXPS2 > ITER_EXPS1 :
        ITER_EXP=ITER_EXPS1 + 1
    else :
        ITER_EXP=ITER_EXPS1	
    print 'Number of iterations expected = %.0f' % ITER_EXP


# Now scan the TIMES_FILE for appropriate markers
fTF=open(TIMES_FILE)
lines=fTF.readlines()
fTF.close()

numRT = list()
sumRT = 0
i = 0

for line in lines :
    if line.strip().startswith("Run-time seconds ") :
        numRT.append(int(re.search(r'\d+', line).group()))
	sumRT = sumRT + numRT[i]
	i = i+1
        
if len(numRT) == 0 :
    print "No iterations completed. Exiting script..."
    sys.exit()
    

print "Number of iterations completed:", len(numRT)
print "Total run time = ", str(datetime.timedelta(seconds=sumRT))

if int(ITER_EXP)-len(numRT) > 0 :
    nYrsLeft = (((FULLRUN-NITER0) - (len(numRT))*ONERUN)*DELTAT)/(60.0*60*24*366)
    print "Number of years left to simulate are = ", nYrsLeft
else :
    print "Experiment completed. Check logs to confirm."
