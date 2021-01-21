#!/bin/tcsh -f

#
# standard setup
#

setenv ROOTDIR  $M_ROOT/MITgcm_c63k
setenv HECACC   n02-bas
setenv HOMEUSER `whoami`
setenv HOMEHOST $HOMEUSER@bslceng.nerc-bas.ac.uk   # set to 'null' to disable rsync
setenv HOMEROOT /data/oceans_output/shelf/`whoami`/mitgcm
# setenv HOMEROOT /data/scihub-users/`whoami`/mitgcm/cases

#
# individual user exceptions
#

if ( `whoami` == hegan41 ) then
#  setenv ROOTDIR $M_ROOT/MITgcm_c63k
  setenv ROOTDIR $M_ROOT/MITgcm_c62r
  setenv HECACC n02-NEH02333X
  setenv HOMEROOT /data/scihub-users/hegan41/mitgcm/cases
endif

if ( `whoami` == hhiester) then
  setenv ROOTDIR $M_ROOT/MITgcm_c62r
endif

if ( `whoami` == janryd69 ) then
  setenv ROOTDIR $M_ROOT/MITgcm_c64
  setenv HECACC n02-NEH02333X
endif

if ( `whoami` == marun ) then
  setenv ROOTDIR $M_ROOT/MITgcm_c62r
  setenv HOMEROOT /data/scihub-users/`whoami`/mitgcm/cases
  setenv HECACC n02-NEI025867
endif

if ( `whoami` == nicbru ) then
  setenv ROOTDIR $M_ROOT/MITgcm_c62r
endif

if ( `whoami` == pahol ) then
  setenv ROOTDIR $M_ROOT/MITgcm_c62r
  #setenv ROOTDIR $M_ROOT/MITgcm_c64c
  setenv HECACC n02-NEH02333X
  #setenv HECACC n02-NEG018391
  #setenv HECACC n02-NEI025867
endif


if ( `whoami` == sgoswami ) then
  setenv ROOTDIR $M_ROOT/MITgcm_c62r
  setenv HECACC n02-NEH02333X
  setenv HOMEROOT /data/oceans_output/shelf/sudami/mitgcm
  setenv HOMEUSER sudami
  setenv HOMEHOST $HOMEUSER@bslceng.nerc-bas.ac.uk   # set to 'null' to disable rsync
endif


if ( `whoami` == rutrns ) then
  setenv ROOTDIR $M_ROOT/MITgcm_c64r
#  setenv ROOTDIR $M_ROOT/MITgcm_c62r
  setenv HECACC n02-NEH02333X
#  setenv HOMEROOT /data/scihub-users/rutrns/mitgcm/cases
endif

if ( `whoami` == tmilg ) then
  setenv ROOTDIR $M_ROOT/MITgcm_c63k
endif


#
# general stuff
#

setenv PATH ${PATH}:$ROOTDIR/utils/scripts
setenv PATH ${PATH}:$M_ROOT/scripts

alias sd 'svn diff $M_ROOT'
alias ss 'svn --quiet status $M_ROOT'

set m=${M_ROOT}
set mb=${M_ROOT}/build_options
set mc=${M_ROOT}/cases
set mci=${M_ROOT}/cases/isomip_666
set mcis=${M_ROOT}/cases/isomip_666/scripts
set mcp=${M_ROOT}/cases/PIG_666
set mcps=${M_ROOT}/cases/PIG_666/scripts
set mcs=${M_ROOT}/cases/SO_666
set mcsc=${M_ROOT}/cases/SO_666/code
set mcsi=${M_ROOT}/cases/SO_666/input
set mcss=${M_ROOT}/cases/SO_666/scripts
set md=${M_ROOT}/data
set mm=${M_ROOT}/matlab
set mmi=${M_ROOT}/matlab/images
set mmis=${M_ROOT}/matlab/interp_SO
set mmii=${M_ROOT}/matlab/interp_isomip
set mmu=${M_ROOT}/matlab/`whoami`
set ms=${M_ROOT}/scripts
set mu=${M_ROOT}/utilities

