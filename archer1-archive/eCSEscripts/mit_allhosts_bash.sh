#!/bin/bash

#
# standard setup
#

export ROOTDIR=$M_ROOT/MITgcm_c63k
export HECACC="n02-bas"
export HOMEHOST="bslceng.nerc-bas.ac.uk"   # set to 'null' to disable rsync
export HOMEROOT="/data/oceans_output/shelf/`whoami`/mitgcm"

#
# individual user exceptions
#

if [ `whoami` == hhiester ]; then
  export ROOTDIR=$M_ROOT/MITgcm_c62r
fi

if [ `whoami` == janryd69 ]; then
  setenv ROOTDIR $M_ROOT/MITgcm_c64
  setenv HECACC n02-NEH02333X
fi

if [ `whoami` == tmilg ]; then
  setenv ROOTDIR $M_ROOT/MITgcm_c63k
fi

if [ `whoami` == marun ]; then
  setenv ROOTDIR $M_ROOT/MITgcm_c64b
  setenv HOMEROOT /data/scihub-users/`whoami`/mitgcm/cases
  setenv HECACC n02-NEI025867
fi

if [ `whoami` == nicbru ]; then
  setenv ROOTDIR $M_ROOT/MITgcm_c62r
fi

if [ `whoami` == pahol ]; then
  setenv ROOTDIR $M_ROOT/MITgcm_c62r
  #setenv ROOTDIR $M_ROOT/MITgcm_c64c
  setenv HECACC n02-NEH02333X
  #setenv HECACC n02-NEG018391
  #setenv HECACC n02-NEI025867
fi

if [ `whoami` == "sudami" ]; then
  export ROOTDIR=$M_ROOT/MITgcm_c65i
  export HECACC="n02-NEH02333X"
fi

if [ `whoami` == "sgoswami" ]; then
  export ROOTDIR=$M_ROOT/MITgcm_c65i
  export HECACC="n02-NEH02333X"
fi

#
# general stuff
#

export PATH=${PATH}:$ROOTDIR/utils/scripts
export PATH=${PATH}:$M_ROOT/scripts

alias sd="svn diff $M_ROOT"
alias ss="svn --quiet status $M_ROOT"

alias m='cd ${M_ROOT}'
alias mb='cd ${M_ROOT}/build_options'
alias mc='cd ${M_ROOT}/cases'
alias mci='cd ${M_ROOT}/cases/isomip_666'
alias mcis='cd ${M_ROOT}/cases/isomip_666/scripts'
alias mcp='cd ${M_ROOT}/cases/PIG_666'
alias mcps='cd ${M_ROOT}/cases/PIG_666/scripts'
alias mcs='cd ${M_ROOT}/cases/SO_666'
alias mcsc='cd ${M_ROOT}/cases/SO_666/code'
alias mcsi='cd ${M_ROOT}/cases/SO_666/input'
alias mcss='cd ${M_ROOT}/cases/SO_666/scripts'
alias md='cd ${M_ROOT}/data'
alias mm='cd ${M_ROOT}/matlab'
alias mmi='cd ${M_ROOT}/matlab/images'
alias mmis='cd ${M_ROOT}/matlab/interp_SO'
alias mmii='cd ${M_ROOT}/matlab/interp_isomip'
alias mmu='cd ${M_ROOT}/matlab/`whoami`'
alias ms='cd ${M_ROOT}/scripts'
alias mu='cd ${M_ROOT}/utilities'

