#!/bin/csh -f

# tells the user how long each job within a run queued for, e.g.
# queue_time.sh 001 

grep Queue- $M_ROOT/cases/SO_$1/run/times
