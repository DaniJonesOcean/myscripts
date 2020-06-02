#!/bin/csh -f

# tells the user how long each sync job within a run took, e.g.
# sync_time.sh 001 

grep Sync- $M_ROOT/cases/SO_$1/run/times
