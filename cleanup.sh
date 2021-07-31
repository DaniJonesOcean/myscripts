#!/bin/bash
# cleanup after a run

read -p "Are you sure you want to clean up this directory? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # clean up directory 
    rm -f scratch*
    cp STDOUT.0000 stdOUT.txt
    cp STDERR.0000 stdERR.txt
    rm -f STDOUT* STDERR*
    rm -rf .0*
    rm -rf tapes/
    rm -f tapes*
    rm -f w2*
    rm slurm*
fi
