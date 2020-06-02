#!/bin/bash 
#
# compile_oad_adjoint
# 
# Usage
#  > ./compile_oad_adjoint compiler
# where 'compiler' is a string (gnu, intel, cray)
#
# Compile MITgcm case on ARCHER using OpenAD
# - Designed for use with default modules
#

# Select compiler (gnu, intel, cray)
compiler="$1"

# Define MITgcm directory (select source code to use)
export HOMEDIR=~
export ROOTDIR=$HOMEDIR'/MITgcm'

# Check compiler
if [[ "$compiler" == "cray" ]]; then

  # Select build options file
  optfile=~/build_options/linux_ia64_cray_archer

  # Have to manually link the c++ libraries
  export LD_LIBRARY_PATH=/opt/gcc/4.9.2/snos/lib64:$LD_LIBRARY_PATH

elif [[ "$compiler" == "intel" ]]; then

  optfile=~/build_options/linux_ia64_intel_opt_archer
  module swap PrgEnv-cray PrgEnv-intel
  export LD_LIBRARY_PATH=/opt/gcc/4.9.2/snos/lib64:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$GCC_X84_64:$LD_LIBRARY_PATH

elif [[ "$compiler" == "gnu" ]]; then

  optfile=/home/n01/n01/dannes1/build_options/linux_ia64_gnu_opt_archer
  module swap PrgEnv-cray PrgEnv-gnu

else

  echo "Cray compiling environment selected by default"
  optfile=~/build_options/linus_ia64_cray_archer  
  export LD_LIBRARY_PATH=/opt/gcc/4.9.2/snos/lib64:$LD_LIBRARY_PATH

fi

# Set OpenAD environment variables (i.e. OPENADROOT)
workingDir=$(pwd)
cd ~/OpenAD/
source ./setenv.sh
cd $workingDir
echo "OPENADROOT is set to: "
echo $OPENADROOT

# To get NetCDF:
module load cray-hdf5-parallel/1.8.13
module load cray-netcdf-hdf5parallel/4.3.2

# Use genmake2 to build make file 
$ROOTDIR/tools/genmake2 -oad -mpi -mods=../code_oad -of=$optfile

# Use makefile to build adjoint using OpenAD
make adAll

## END
