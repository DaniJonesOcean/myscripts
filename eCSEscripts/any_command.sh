#!/bin/bash
#
##PBS -e ../run
#PBS -j oe
#PBS -m n
##PBS -o ../run
#PBS -l select=serial=true:ncpus=1
#PBS -r n


export USERID=`whoami`
JOBNO="A05"

# Put the code to carry out any action that needs to be submitted as a job
# such as transferring a large file or files.

cd /home/n02/n02/sgoswami/work/mitgcm/cases/SO_A05/run

  HOMEDIR=$HOMEROOT/SO_${JOBNO}/run
  ssh -t $HOMEHOST "mkdir -p $HOMEDIR"
  rsync -avzL state*vel.nc $HOMEHOST:$HOMEDIR

