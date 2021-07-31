#!/bin/bash

# select the compiling environment
module restore PrgEnv-gnu
module load cray-netcdf-hdf5parallel
module load cray-hdf5-parallel

# set the following environment variables
export MITGCM_ROOTDIR=../../../../MITgcm
export PATH=$MITGCM_ROOTDIR/tools:$PATH
export MITGCM_OPT=$MITGCM_ROOTDIR/tools/build_options/dev_linux_amd64_gnu_archer2

# make the make file
../../../tools/genmake2 -mpi -mods ../code/ -optfile $MITGCM_OPT
make depend
make

