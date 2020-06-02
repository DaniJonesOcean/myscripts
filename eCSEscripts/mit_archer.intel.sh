#!/bin/bash

# Load Subversion

module load svn


# load modules for mitgcm
# Switch compilers as  the Cray compiler gives an error.
if [ `module list 2>&1 | grep -o PrgEnv-cray` ]; then
     module swap PrgEnv-cray PrgEnv-intel
     module load fix_intel_mpich
     #module swap intel intel/13.1.3.192
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

#module swap cray-netcdf netcdf
#module load netcdf-hdf5parallel

# SG: vvvvvv Added due to Jun 11, 2014 module updates vvvvvv

#export LC_CRAY_MPICH2_DIR=/opt/cray/mpt/6.3.1/gni/mpich2-intel/130

# SG: ^^^^^^^^ End of modifications for module updates ^^^^^^^^


#module load ncview

#
# point to local MITgcm working copy
#

export M_ROOT=/work/ecse0309/ecse0309/gavin4/mitgcm
export TMPDIR=/work/ecse0309/ecse0309/gavin4/SCRATCH

# export m=${M_ROOT}

#
# set up all stuff that is dependent upon local host
#

## source $M_ROOT/scripts/mit_allhosts_archer.sh

#
# standard aliasup
#

export ROOTDIR=$M_ROOT/MITgcm_c65i
export HECACC=ecse0309
export HOMEUSER="`whoami`"
export HOMEHOST=null   # alias to 'null' to disable rsync
#export HOMEROOT="/data/oceans_output/shelf/`whoami`/mitgcm"
export HOMEROOT="/work/ecse0309/ecse0309/gavin4/mitgcm/cases"
#export HOMEROOT /data/scihub-users/`whoami`/mitgcm/cases

#
# individual user exceptions
#

if [ `whoami` == "hegan41" ] ; then
#  export ROOTDIR $M_ROOT/MITgcm_c63k
  export ROOTDIR=$M_ROOT/MITgcm_c62r
  export HECACC=n02-NEH02333X
  export HOMEROOT=/data/scihub-users/hegan41/mitgcm/cases
fi

if [ `whoami` == "hhiester" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c62r
fi

if [ `whoami` == "janryd69" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c64
  export HECACC=n02-NEH02333X
fi

if [ `whoami` == "jjordan" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm
  export HECACC=n02-NEH02333X
  export HOMEUSER=jamrda26
  export HOMEHOST=$HOMEUSER@bslceng.nerc-bas.ac.uk
  export HOMEROOT="/data/oceans_output/shelf/jamrda26/mitgcm"
fi

if [ `whoami` == "marun" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c62r
  export HOMEROOT=/data/scihub-users/`whoami`/mitgcm/cases
  export HECACC=n02-NEI025867
fi

if [ `whoami` == "nicbru" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c62r
fi

if [ `whoami` == "pahol" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c62r
  #export ROOTDIR $M_ROOT/MITgcm_c64c
  export HECACC=n02-NEH02333X
  #export HECACC n02-NEG018391
  #export HECACC n02-NEI025867
fi

if [ `whoami` == "rutrns" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c64r
#  export ROOTDIR $M_ROOT/MITgcm_c62r
  export HECACC=n02-NEH02333X
#  export HOMEROOT /data/scihub-users/rutrns/mitgcm/cases
fi

if [ `whoami` == "ryapat30" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c62r
  export HECACC=n02-NEH02333X
fi

if [ `whoami` == "sgoswami" ] ; then
#  export ROOTDIR=$M_ROOT/MITgcm_c62r
  export ROOTDIR=$M_ROOT/MITgcm_c65i
  #export ROOTDIR=$M_ROOT/MITgcm_c64r
  #export ROOTDIR=$M_ROOT/MITgcm_c64y
  #export ROOTDIR=$M_ROOT/MITgcm_c62m
  #export HECACC=n02-NEH02333X
  export HECACC=n02-bas
  export HOMEROOT=/data/oceans_output/shelf/sudami/mitgcm
  export HOMEUSER=sudami
  export HOMEHOST=$HOMEUSER@bslceng.nerc-bas.ac.uk   # alias to 'null' to disable rsync
fi

if [ `whoami` == "gavin4" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c65i
  export HECACC=ecse0309
  export HOMEROOT="/work/ecse0309/ecse0309/gavin4/mitgcm/cases"
  export HOMEUSER=gavin4
  export HOMEHOST=null   # alias to 'null' to disable rsync
fi


if [ `whoami` == "skimura" ]; then
	export ROOTDIR=$M_ROOT/MITgcm_c62r
	export HECACC=n02-NEG018391
	export HOMEUSER="satmur65"
	export HOMEHOST=$HOMEUSER@bslcene.nerc-bas.ac.uk   # alias to 'null' to disable rsync
	export HOMEROOT="/data/oceans_output/shelf/satmur65/mitgcm"
# export HOMEROOT /data/scihub-users/`whoami`/mitgcm/cases
fi

if [ `whoami` == "tmilg" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c63k
  export HOMEUSER=tmilg
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


