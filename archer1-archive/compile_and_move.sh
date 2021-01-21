#!/bin/bash 
#
# Compile the experiment and move it to the 'work' filesystem
# Should be run AFTER copy_fwd_tempalte
# 
# This script works if you start with the default login shell options
# It may not work if you use non-default modules
# This script creates its own environment and doesn't affect the login shell
#

# Get new experiment name (stored in hidden temporary file .nam.tmp)
new_exp_name=$(head -n 1 .nam.tmp)

# Move to directory that contains the new experiment
cd /home/n01/n01/dannes1/MITgcm/experiments/$new_exp_name/build/

# Swap modules (start with cray)
#module swap PrgEnv-cray PrgEnv-gnu
module swap PrgEnv-cray PrgEnv-intel
module load cray-netcdf-hdf5parallel
module load cray-hdf5-parallel

# Compile (need to generalize to MPI later)
../../../tools/genmake2 -mpi -mods=../code -of=/home/n01/n01/dannes1/build_options/archer_intel
make depend
make -j 15
make Clean

# If no executable is produced, return error and terminate script
if [[ ! -f mitgcmuv ]]; then
    echo 'compile_and_move.sh :: Executable mitgcmuv does not exist, aborting.  No experiment created on ~/work.'
    exit
fi

# Populate the 'run' directory and move the experiment to 'work'
cd ../run/
ln -s mitgcmuv ../run/
ln -s ../input/* .
mkdir ~/work/experiments/$new_exp_name/
cd ..
cp -r * ~/work/experiments/$new_exp_name/
