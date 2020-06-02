#!/bin/bash 
#
# Usage
# ./compile_adjoint compiler
# where 'compiler' is a string (cray [default], intel, gnu)
#
# Compile MITgcm case on ARCHER using TAF
# -Designed for use with default modules
#
# This script works if you start with the default login shell options
# It may not work if you use non-default modules
# This script creates its own environment and doesn't affect the login shell
#

# Select compiler (cray [default], intel, gnu)
compiler="$1"

# Define MITgcm directory (select source code to use)
export ROOTDIR=$(cd ~/MITgcm; pwd)
#export ROOTDIR="/home/n01/n01/dannes1/MITgcm-checkpoint65f"

# Check compiler
if [[ "$compiler" == "cray" ]]; then

  # Select build options file
  optfile=$ROOTDIR/tools/build_options/linux_ia64_cray_archer 

elif [[ "$compiler" == "intel" ]]; then

  optfile=/home/n01/n01/dannes1/build_options/linux_ia64_intel_opt_archer 
  module swap PrgEnv-cray PrgEnv-intel

elif [[ "$compiler" == "gnu" ]]; then

  optfile=/home/n01/n01/dannes1/build_options/linux_ia64_gnu_opt_archer
  module swap PrgEnv-cray PrgEnv-gnu

else

  echo "Cray compiling environment selected by default"
  optfile=$ROOTDIR/tools/build_options/linux_ia64_cray_archer

fi

# Adjoint build options file
#adoptfile=$ROOTDIR/tools/adjoint_options/adjoint_default

# Load NetCDF and HDF5 modules
module load cray-netcdf-hdf5parallel
module load cray-hdf5-parallel

# Compile 
$ROOTDIR/tools/genmake2 -ieee -mpi -mods=../code -of=$optfile
make depend
make adtaf
make adall

