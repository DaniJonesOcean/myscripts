#!/bin/bash
#
# Create a new experiment from the fwd_tracer_template 
#

# Set a few variables
new_exp_name='rbcs_test3'
rm -f .nam.tmp
echo $new_exp_name > .nam.tmp

# Move to directory that contains the template
cd /home/n01/n01/dannes1/MITgcm/experiments/

# Create new experiment
cp -r fwd_tracer_template $new_exp_name

# Link to offline input, choose the specific input in data.off
cd $new_exp_name/input/
ln -s ~/work/offline_input/unsmoothed/ .
ln -s ~/work/FWDinputs/*.* SO6inputs/
ln -s ~/work/init_tracers/trials_round1/ .
ln -s ~/work/rbcs/* .

# Next, change what you want in /code, compile, and move to work filesystem
# Compiling and moving can be done using the compile_and_move script 
