#!/bin/bash
echo "MEAN VALUES-----------------------------------"
echo "----------------------------------------------"
grep dynstat_theta_mean STDOUT.0000
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
echo "MEAN SEA ICE----------------------------------"
grep seaice_area_mean STDOUT.0000
echo "ADJOINT --------------------------------------"
grep f_ STDOUT.0000
echo "----------------------------------------------"
grep f_gencost STDOUT.0000
echo "----------------------------------------------"
grep 'fc' STDOUT.0000
echo "----------------------------------------------"
grep ad_dynstat_adtheta_mean STDOUT.0000
echo "----------------------------------------------"
grep ad_dynstat_adsst_mean STDOUT.0000      
echo "----------------------------------------------"
grep ad_dynstat_adsss_mean STDOUT.0000       
echo "----------------------------------------------"
grep ad_exf_adqnet_mean STDOUT.0000          
echo "----------------------------------------------"
grep adptracer STDOUT.0000
echo "----------------------------------------------"
echo "GRADIENT CHECK -------------------------------"
grep adjoint_gradient STDOUT.0000
grep finite-diff_grad STDOUT.0000 
echo "NUMBER OF PICKUP FILES------------------------"
ls pickup*data > out.txt
wc -l out.txt
rm out.txt
echo "END-------------------------------------------"
