#!/bin/bash

# Load Subversion

module load svn

# load modules for mitgcm
if [ `module list 2>&1 | grep -o PrgEnv-cray` ]; then
     module swap PrgEnv-cray PrgEnv-gnu
fi
#module swap cray-mpich xt-mpich2

if [ ! `module list 2>&1 | grep -o cray-netcdf-hdf5parallel` ]; then
     module load cray-netcdf-hdf5parallel
fi

if [ ! `module list 2>&1 | grep -o cray-hdf5-parallel` ]; then
     module load cray-hdf5-parallel
#     module swap cray-hdf5-parallel cray-hdf5-parallel/1.8.12
#     module swap cray-netcdf-hdf5parallel cray-netcdf-hdf5parallel/4.3.1
fi

export M_ROOT=/work/ecse0309/ecse0309/gavin4/mitgcm
export TMPDIR=/work/ecse0309/ecse0309/gavin4/SCRATCH

export ROOTDIR=$M_ROOT/MITgcm_c65i
export HECACC=ecse0309
export HOMEUSER="`whoami`"
export HOMEHOST=null   # alias to 'null' to disable rsync
export HOMEROOT="/work/ecse0309/ecse0309/gavin4/mitgcm/cases"


if [ `whoami` == "gavin4" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c65i
  export HECACC=ecse0309
  export HOMEROOT="/work/ecse0309/ecse0309/gavin4/mitgcm/cases"
  export HOMEUSER=gavin4
  export HOMEHOST=null   # alias to 'null' to disable rsync
fi

#
# general stuff
#

export PATH=${PATH}:$ROOTDIR/utils/scripts
export PATH=${PATH}:$M_ROOT/scripts

alias sd='svn diff $M_ROOT'
alias ss='svn --quiet status $M_ROOT'

alias cdm='cd ${M_ROOT}; pwd'
alias cdmb='cd ${M_ROOT}/build_options; pwd'
alias cdmc='cd ${M_ROOT}/cases; pwd'
alias cdmci='cd ${M_ROOT}/cases/isomip_666; pwd'
alias cdmcis='cd ${M_ROOT}/cases/isomip_666/scripts; pwd'
alias cdmcp='cd ${M_ROOT}/cases/PIG_666; pwd'
alias cdmcps='cd ${M_ROOT}/cases/PIG_666/scripts; pwd'
alias cdmcs='cd ${M_ROOT}/cases/SO_666; pwd'
alias cdmcsc='cd ${M_ROOT}/cases/SO_666/code; pwd'
alias cdmcsi='cd ${M_ROOT}/cases/SO_666/input; pwd'
alias cdmcss='cd ${M_ROOT}/cases/SO_666/scripts; pwd'
alias cdmd='cd ${M_ROOT}/data; pwd'
alias cdmm='cd ${M_ROOT}/matlab; pwd'
alias cdmmi='cd ${M_ROOT}/matlab/images; pwd'
alias cdmmis='cd ${M_ROOT}/matlab/interp_SO; pwd'
alias cdmmii='cd ${M_ROOT}/matlab/interp_isomip; pwd'
alias cdmmu='cd ${M_ROOT}/matlab/`whoami`; pwd'
alias cdms='cd ${M_ROOT}/scripts; pwd'
alias cdmu='cd ${M_ROOT}/utilities; pwd'
alias cdmun='cd ${M_ROOT}/utilities/mit2nc; pwd'


