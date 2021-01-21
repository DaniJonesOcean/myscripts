#!/bin/csh -f

#
# set the version number of modules / libraries
#

# set default

#setenv PGI_VER        default # for pgi (leave default)
#setenv PRGENV_PGI     default # for PrgEnv-pgi (loads pgi etc -leave default)
#setenv MPICH2_PGI     default # for xt-mpich2
#setenv NETCDF_HDF5PAR default # for netcdf-hdf5parallel (loads hdf5-parallel)

# fixed r660 on 5/3/13
setenv PRGENV_PGI      4.0.46  # for PrgEnv-pgi
setenv PGI_VER         12.3.0  # for pgi
setenv MPICH2_PGI      5.4.5   # for xt-mpich2
setenv NETCDF_HDF5PAR  4.1.3   # for netcdf-hdf5parallel (loads hdf5-parallel)

# deprecated r572 on 3/1/13
#setenv MPICH2_PGI      5.4.5  # for xt-mpich2
#setenv NETCDF_HDF5PAR  4.1.3  # for netcdf-hdf5parallel (loads hdf5-parallel)

# deprecated r499 on 16/7/12
#setenv MPICH2_PGI      5.4.0   # for xt-mpich2
#setenv NETCDF_HDF5PAR  4.1.2   # for netcdf-hdf5parallel (loads hdf5-parallel)

# individual exceptions 

if ( `whoami` == tmilg ) then
  setenv PRGENV_PGI     4.0.46 
  setenv PGI_VER        12.9.0  # for PrgEnv-pgi (loads pgi etc -leave default)
  setenv MPICH2_PGI     5.4.5   # for xt-mpich2
  setenv NETCDF_HDF5PAR 4.1.3   # for netcdf-hdf5parallel (loads hdf5-parallel)
endif

#
# load and unload modules
#

module unload PrgEnv-cray
module unload xt-mpich2 
module unload cray-mpich2 
module unload hdf5-parallel 
module unload netcdf-hdf5parallel 

module load PrgEnv-pgi/$PRGENV_PGI
module switch pgi/$PGI_VER
module load xt-mpich2/$MPICH2_PGI
module load netcdf-hdf5parallel/$NETCDF_HDF5PAR

module load ncview

#
# point to local MITgcm working copy
#

setenv M_ROOT  $HOME/work/mitgcm

#
# set up all stuff that is not dependent upon local host
#

source $M_ROOT/scripts/mit_allhosts.sh

