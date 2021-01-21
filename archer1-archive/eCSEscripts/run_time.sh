#!/bin/csh -f

# tells the user how many jobs have completed within a run, e.g.
# run_time.sh 001 

grep Run- $M_ROOT/cases/SO_$1/run/times
