#!/bin/bash
echo "MEAN VALUES-----------------------------------"
echo "----------------------------------------------"
grep dynstat_theta_mean STDOUT.0000
echo "----------------------------------------------"
grep dynstat_salt_mean STDOUT.0000
echo "----------------------------------------------"
grep ke_mean STDOUT.0000
echo "----------------------------------------------"
grep pe_b_mean STDOUT.0000
echo "----------------------------------------------"
grep vort_r_mean STDOUT.0000
echo "----------------------------------------------"
echo "CFL STABILITY CONDITION-----------------------"
echo "----------------------------------------------"
grep cfl_uvel STDOUT.0000
echo "----------------------------------------------"
grep cfl_vvel STDOUT.0000
echo "----------------------------------------------"
grep cfl_wvel STDOUT.0000
echo "SSH MAX---------------------------------------"
grep _eta_max STDOUT.0000
echo "THETA MAX-------------------------------------"
grep _theta_max STDOUT.0000
echo "SALT MAX-------------------------------------"
grep _salt_max STDOUT.0000
echo "MEAN SEA ICE----------------------------------"
grep seaice_area_mean STDOUT.0000
echo "TRACERS --------------------------------------"
grep _ptracer01_mean STDOUT.0000
echo "----------------------------------------------"
grep _ptracer02_mean STDOUT.0000
echo "----------------------------------------------"
grep _ptracer03_mean STDOUT.0000
echo "----------------------------------------------"
grep _ptracer04_mean STDOUT.0000
echo "----------------------------------------------"
grep _ptracer05_mean STDOUT.0000
echo "----------------------------------------------"
echo "NUMBER OF PICKUP FILES------------------------"
ls pickup*data > out.txt
wc -l out.txt
rm out.txt
echo "END OF STDOUT.0000----------------------------"
tail STDOUT.0000
echo "END OF STDERR.0000----------------------------"
tail STDERR.0000
echo "END-------------------------------------------"
