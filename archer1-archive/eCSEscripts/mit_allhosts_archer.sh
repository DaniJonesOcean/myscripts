#!/bin/bash

# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# 
# THIS FILE IS NO LONGER MAINTAINED!
#
# All relevant information has been moved to mit_archer.sh
#
# DO NOT MODIFY THIS FILE.
#
# Sudipta Goswami
#
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


#
# standard aliasup
#

export ROOTDIR=$M_ROOT/MITgcm_c63k
export HECACC=n02-bas
export HOMEUSER="`whoami`"
export HOMEHOST=$HOMEUSER@bslceng.nerc-bas.ac.uk   # alias to 'null' to disable rsync
export HOMEROOT="/data/oceans_output/shelf/`whoami`/mitgcm"
# export HOMEROOT /data/scihub-users/`whoami`/mitgcm/cases

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

if [ `whoami` == "sgoswami" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c62r
  export HECACC=n02-NEH02333X
  export HOMEROOT=/data/oceans_output/shelf/sudami/mitgcm
  export HOMEUSER=sudami
  export HOMEHOST=$HOMEUSER@bslceng.nerc-bas.ac.uk   # alias to 'null' to disable rsync
  export FAVCASE1=AS01_A06
  export FAVCASE2=AS01_666
  alias mcf1='cd ${M_ROOT}/cases/${FAVCASE1}; pwd'
  alias mcf1b='cd ${M_ROOT}/cases/${FAVCASE1}/build; pwd'
  alias mcf1c='cd ${M_ROOT}/cases/${FAVCASE1}/code; pwd'
  alias mcf1i='cd ${M_ROOT}/cases/${FAVCASE1}/input; pwd'
  alias mcf1s='cd ${M_ROOT}/cases/${FAVCASE1}/scripts; pwd'
  alias mcf1r='cd ${M_ROOT}/cases/${FAVCASE1}/run; pwd'
  alias mcf2='cd ${M_ROOT}/cases/${FAVCASE2}; pwd'
  alias mcf2b='cd ${M_ROOT}/cases/${FAVCASE2}/build; pwd'
  alias mcf2c='cd ${M_ROOT}/cases/${FAVCASE2}/code; pwd'
  alias mcf2i='cd ${M_ROOT}/cases/${FAVCASE2}/input; pwd'
  alias mcf2s='cd ${M_ROOT}/cases/${FAVCASE2}/scripts; pwd'
  alias mcf2r='cd ${M_ROOT}/cases/${FAVCASE2}/run; pwd'
fi

if [ 'whoami' == "skimura" ]; then
	export ROOTDIR=$M_ROOT/MITgcm_c62r
	export HECACC=n02-NEG018391
	export HOMEUSER="satmur65"
	export HOMEHOST=$HOMEUSER@bslcene.nerc-bas.ac.uk   # alias to 'null' to disable rsync
	export HOMEROOT="/data/oceans_output/shelf/satmur65/mitgcm"
# export HOMEROOT /data/scihub-users/`whoami`/mitgcm/cases


fi


if [ `whoami` == "rutrns" ] ; then
  export ROOTDIR=$M_ROOT/MITgcm_c64r
#  export ROOTDIR $M_ROOT/MITgcm_c62r
  export HECACC=n02-NEH02333X
#  export HOMEROOT /data/scihub-users/rutrns/mitgcm/cases
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

