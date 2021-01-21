#!/bin/csh -f

# quad or myri queue
module remove mpich/ge/pgi
module add mpich/mx/pgi
module add mx

module add pgi
module add netcdf/pgi
module add sge

module use /data/hades-data/polair/modulefiles
module add svn
module add ncview
module load pbstop
unsetup mlsdmatlab
setup mlsdmatlab

setenv HOME /data/hades-users/pahol

setenv M_ROOT  $HOME/mitgcm
setenv ROOTDIR $M_ROOT/MITgcm_c62r

setenv PATH ${PATH}:$ROOTDIR/utils/scripts
setenv PATH ${PATH}:$M_ROOT/scripts
setenv PATH ${PATH}:/data/hades-data/polair/nco-4.0.0/bin

source $M_ROOT/scripts/general_env.sh

