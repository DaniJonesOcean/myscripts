#!/bin/bash

module load netcdf
module load netcdf/gcc/64/4.2
module load ncview
module load mvapich/pgi
module load pgi
module load netcdf/pgi
module load sge

export M_ROOT="/data/scihub-users/`whoami`/mitgcm"

# export PATH="/data/scihub-data/oceans-input/Programs/nco-4.0.8/bin":${PATH}

source $M_ROOT/scripts/mit_allhosts_bash.sh

export TMPDIR=/data/scihub-users/`whoami`/SCRATCH
