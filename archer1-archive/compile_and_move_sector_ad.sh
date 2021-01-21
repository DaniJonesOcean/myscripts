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

# Set options file
optfile=/home/n01/n01/dannes1/build_options/archer_intel_dave
#optfile=/home/n01/n01/dannes1/build_options/archer_gnu

# Move to directory that contains the new experiment
cd /home/n01/n01/dannes1/MITgcm_c64t/experiments/$new_exp_name/build/

# Module swap after the default change RUINED MY LIFE (11 Jun 14)
#module swap cce cce/8.2.1
#module swap pmi pmi/4.0.1-1.0000.9753.86.2.ari
#module swap atp atp/1.7.0
#module swap cray-libsci cray-libsci/12.1.2
#module swap cray-mpich cray-mpich/6.1.1
#module swap PrgEnv-cray PrgEnv-intel
#module swap intel intel/13.1.3.192

# Swap modules (start with cray)
#module load old-defaults/jun14
#module swap PrgEnv-cray PrgEnv-gnu
module swap PrgEnv-cray PrgEnv-intel
#module swap intel intel/13.1.3.192
#module load cray-netcdf-hdf5parallel
#module load cray-hdf5-parallel

# Define working directory for compilation
export MYDIR="/home/n01/n01/dannes1/MITgcm_c64t/experiments/$new_exp_name/build/"

# Define MITgcm directory
export ROOTDIR="/home/n01/n01/dannes1/MITgcm_c64t"

# Compile (need to generalize to MPI later)
../../../tools/genmake2 -oad -mpi -mods=../code_oad -of=$optfile
made adAll
#make depend   # DO NOT RUN MAKE DEPEND FOR OPENAD
#make -j 15
#make Clean

# If no executable is produced, return error and terminate script
if [[ ! -f mitgcmuv ]]; then
    echo 'compile_and_move.sh :: Executable mitgcmuv does not exist, aborting.  No experiment created on ~/work.'
    exit
fi

# Populate the 'run' directory and move the experiment to 'work'
# Copy mitgcm executable from build directory to run directory 
mv mitgcmuv ../run
mkdir ~/work/experiments/$new_exp_name/
cd ..
#ln -s ./input/* ./run/
cp -r * ~/work/experiments/$new_exp_name/

# Next, edit various files in input/data to point to the bathymetry and
# other files.  Use absolute paths.  This must be done before running.
