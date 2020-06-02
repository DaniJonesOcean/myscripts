#! /bin/bash

module swap cray-hdf5-parallel cray-hdf5
module swap cray-netcdf-hdf5parallel cray-netcdf

ncview -no_auto_overlay $1


module swap cray-hdf5 cray-hdf5-parallel
module swap cray-netcdf cray-netcdf-hdf5parallel
