#!/bin/csh -f

# tells the user how many outputs have completed within a run, e.g.
# output_count.sh SO_666 

ls -l $M_ROOT/cases/$1/run/state2D.*.meta > outputs_$1

wc -l outputs_$1 

rm -rf outputs_$1
