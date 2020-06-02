#!/bin/bash
#
# Create a new experiment from the fwd_offline_template 
#

# Set a few variables
new_exp_name='dimes_neill'
rm -f .nam.tmp
echo $new_exp_name > .nam.tmp

# Move to directory that contains the template
cd /home/n01/n01/dannes1/MITgcm_c64t/experiments/

# Create new experiment
cp -r fwd_offline_template/ $new_exp_name
chmod -R u+w $new_exp_name

# Next, change what you want in /code, compile, and move to work filesystem
# Compiling and moving can be done using the compile_and_move script 
