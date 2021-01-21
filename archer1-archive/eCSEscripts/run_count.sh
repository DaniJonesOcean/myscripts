#!/bin/csh -f

# tells the user how many jobs have completed within a run, e.g.
# run_count.sh SO_001 

grep Run- $M_ROOT/cases/$1/run/times > jobs

wc -l jobs 

rm -rf jobs
