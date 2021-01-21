#!/bin/bash

# select the gnu compiling environment (seems to throw up lots of warnings)
module restore PrgEnv-gnu

# set the following environment variables
export MITGCM_ROOTDIR=../../../../MITgcm/
export PATH=$MITGCM_ROOTDIR/tools:$PATH
export MITGCM_OPT=$MITGCM_ROOTDIR/tools/build_options/linux_amd64_gfortran_archer2

# compile with mpi
../../../tools/genmake2 -mods ../code -mpi -optfile $MITGCM_OPT
make depend
make
