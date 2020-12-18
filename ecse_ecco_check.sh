#!/bin/bash

###########################################
# Script to check ECCOv4-r4 runs for eCSE #
###########################################

# formatting
echo "--__--__--__--__--__--__--__--__--__--__--__--__--__--"
echo " "
echo "Checking ECCOv4-r4 run (eCSE configuration)"
echo " "

# check the last line of standard output
lastline=$(tail -1 STDOUT.0000)
lastline_ok='PROGRAM MAIN: Execution ended Normally'
if [[ "$lastline" == "$lastline_ok" ]]; then
    echo "MITgcm (ECCOv4-r4) execution ended normally"
else
    echo "WARNING: MITgcm may not have ended normally, check STDOUT"
fi
echo " "
echo "-----"

# check cost function
echo "-----"
echo "Total cost function value is given by fc "
head -1 costfunction0129
echo "-----"

# min temperature values
echo "-----"
echo "Global minimum potential temperature (deg C)" 
grep _theta_min STDOUT.0000 | cut -c 58-80
echo "-----" 

# mean temperature values
echo "-----"
echo "Global mean potential temperature (deg C)" 
grep dynstat_theta_mean STDOUT.0000 | cut -c 58-80
echo "-----" 

# max temperature values
echo "-----"
echo "Global maximum potential temperature (deg C)" 
grep _theta_max STDOUT.0000 | cut -c 58-80
echo "-----" 

# min salinity values
echo "-----"
echo "Global minimum salinity (psu)" 
grep _salt_min STDOUT.0000 | cut -c 58-80
echo "-----" 

# mean salinity values
echo "-----"
echo "Global mean salinity (psu)" 
grep dynstat_salt_mean STDOUT.0000 | cut -c 58-80
echo "-----" 

# max salinity values
echo "-----"
echo "Global maximum salinity (psu)" 
grep _salt_max STDOUT.0000 | cut -c 58-80
echo "-----" 

# global mean sea ice area
echo "-----"
echo "Global mean sea ice area (m^2/m^2)" 
grep seaice_area_mean STDOUT.0000 | cut -c 57-90
echo "-----" 

# profiling
echo " "
echo " -------------- PROFILING ----------------- "
echo " "

grep -A 3 "Seconds in section" STDOUT.0000 | cut -c 23-90

echo " "
echo " "

echo " "
echo " -------------- PROFILING (ADJOINT) --------------- "
echo " "

echo "-----"
echo "Mean sensitivity to temperature"
grep ad_dynstat_adtheta_mean STDOUT.0000 | cut -c 57-90
echo "-----"

echo "-----"
echo "Mean sensitivity to salinity"
grep ad_dynstat_adsalt_mean STDOUT.0000 | cut -c 57-90
echo "-----"

echo " -------------- ******************* --------------- "

echo "-----" 
echo "Total wall-clock time (seconds)"
grep -m 1 -h -A 3 "Seconds in section" STDOUT.0000 | cut -c 23-90| tail -n 1 | cut -c 18-80
echo "-----" 

# end formatting
echo " "
echo "--__--__--__--__--__--__--__--__--__--__--__--__--__--"
