#!/bin/bash --login
#
# request interactive job
#

# Make sure any symbolic links are resolved to absolute path 
export PBS_O_WORKDIR=$(readlink -f $PBS_O_WORKDIR) 

# Change to the directory that the job was submitted from 
# (remember this should be on the /work filesystem) 
cd $PBS_O_WORKDIR 

# Set the number of threads to 1 
# This prevents any system libraries from automatically 
# using threading. 
export OMP_NUM_THREADS=1

# request interactive job
qsub -IVl select=30,walltime=0:30:0 -A n01-BAS1
#qsub -IVl select=2,walltime=4:0:0 -A n01-BAS1
