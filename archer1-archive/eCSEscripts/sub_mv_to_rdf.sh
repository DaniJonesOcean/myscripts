#!/bin/bash
#

#
# wrapper script to qsub script to copy files to RDF
#
# Sudipta Goswami


export JOBID=`date +%s`

echo "Submitting RDF_${JOBID}"

# submit job

qsub -N RDF_${JOBID} \
     -A $HECACC \
     -V \
     -v JOBNO=$JOBID \
     -l walltime=12:00:00 \
     ./mv_to_rdf.sh

