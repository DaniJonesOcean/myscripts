#!/bin/bash

#
# -- This command accepts a filename as the first positional argument
# --- Otherwise it will try to use STDOUT.0000 as the filename
#

###########################################
# Script to check ECCOv4-r4 runs for eCSE #
###########################################

# formatting
echo "--__--__--__--__--__--__--__--__--__--__--__--__--__--"
echo " "
echo "Checking ECCOv4-r4 run (eCSE configuration)"
echo " "

# if first argument empty, use default filename
if test -z "$1" 
then
    echo "Using default filename STDOUT.0000"
    filename=STDOUT.0000
else
    filename=$1
fi

# check the last line of standard output
lastline=$(tail -1 $filename)
lastline_ok='PROGRAM MAIN: Execution ended Normally'
if [[ "$lastline" == "$lastline_ok" ]]; then
    echo "MITgcm (ECCOv4-r4) execution ended normally"
else
    echo "WARNING: MITgcm may not have ended normally, check STDOUT"
fi
echo " "
echo "-----"

# check cost function
#echo "-----"
#echo "Total cost function value is given by fc "
#head -1 costfunction0129
#echo "-----"

# min temperature values
echo "-----"
echo "Global minimum potential temperature (deg C)" 
grep _theta_min $filename | cut -c 58-80
echo "-----" 

# mean temperature values
echo "-----"
echo "Global mean potential temperature (deg C)" 
grep dynstat_theta_mean $filename | cut -c 58-80
echo "-----" 

# max temperature values
echo "-----"
echo "Global maximum potential temperature (deg C)" 
grep _theta_max $filename | cut -c 58-80
echo "-----" 

# min salinity values
echo "-----"
echo "Global minimum salinity (psu)" 
grep _salt_min $filename | cut -c 58-80
echo "-----" 

# mean salinity values
echo "-----"
echo "Global mean salinity (psu)" 
grep dynstat_salt_mean $filename | cut -c 58-80
echo "-----" 

# max salinity values
echo "-----"
echo "Global maximum salinity (psu)" 
grep _salt_max $filename | cut -c 58-80
echo "-----" 

# global mean sea ice area
echo "-----"
echo "Global mean sea ice area (m^2/m^2)" 
grep seaice_area_mean $filename | cut -c 57-90
echo "-----" 

# profiling
echo " "
echo " -------------- PROFILING ----------------- "
echo " "

grep -A 3 "Seconds in section" $filename | cut -c 23-90

echo " "
echo " "

#echo " "
#echo " -------------- PROFILING (ADJOINT) --------------- "
#echo " "

#echo "-----"
#echo "Mean sensitivity to temperature"
#grep ad_dynstat_adtheta_mean $filename | cut -c 57-90
#echo "-----"

#echo "-----"
#echo "Mean sensitivity to salinity"
#grep ad_dynstat_adsalt_mean $filename | cut -c 57-90
#echo "-----"

#echo " -------------- ******************* --------------- "

echo "-----" 
echo "Total wall-clock time (seconds)"
grep -m 1 -h -A 3 "Seconds in section" $filename | cut -c 23-90| tail -n 1 | cut -c 18-80
echo "-----" 

# end formatting
echo " "
echo "--__--__--__--__--__--__--__--__--__--__--__--__--__--"
