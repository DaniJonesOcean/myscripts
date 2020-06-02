#!/bin/bash

# make directory for results
mkdir -p ad_stats

# extract cost function
cat STDOUT.0000 | grep -i 'global fc' | cut -c 15-35 | nl -i 1 > ad_stats/globalfc.txt
cat STDOUT.0000 | grep -i 'local fc' | cut -c 15-35 | nl -i 1 > ad_stats/localfc.txt

# extract uvel stats
cat STDOUT.0000 | grep ad_dynstat_aduvel_min | cut -c 59-77 | nl -i 1 > ad_stats/aduvel_min.txt
cat STDOUT.0000 | grep ad_dynstat_aduvel_mean | cut -c 59-77 | nl -i 1 > ad_stats/aduvel_mean.txt
cat STDOUT.0000 | grep ad_dynstat_aduvel_max | cut -c 59-77 | nl -i 1 > ad_stats/aduvel_max.txt
cat STDOUT.0000 | grep ad_dynstat_aduvel_sd | cut -c 59-77 | nl -i 1 > ad_stats/aduvel_sd.txt
cat STDOUT.0000 | grep ad_dynstat_aduvel_del2 | cut -c 59-77 | nl -i 1 > ad_stats/aduvel_del2.txt

# extract vvel stats
cat STDOUT.0000 | grep ad_dynstat_advvel_min | cut -c 59-77 | nl -i 1 > ad_stats/advvel_min.txt
cat STDOUT.0000 | grep ad_dynstat_advvel_mean | cut -c 59-77 | nl -i 1 > ad_stats/advvel_mean.txt
cat STDOUT.0000 | grep ad_dynstat_advvel_max | cut -c 59-77 | nl -i 1 > ad_stats/advvel_max.txt
cat STDOUT.0000 | grep ad_dynstat_advvel_sd | cut -c 59-77 | nl -i 1 > ad_stats/advvel_sd.txt
cat STDOUT.0000 | grep ad_dynstat_advvel_del2 | cut -c 59-77 | nl -i 1 > ad_stats/advvel_del2.txt

# extract wvel stats
cat STDOUT.0000 | grep ad_dynstat_adwvel_min | cut -c 59-77 | nl -i 1 > ad_stats/adwvel_min.txt
cat STDOUT.0000 | grep ad_dynstat_adwvel_mean | cut -c 59-77 | nl -i 1 > ad_stats/adwvel_mean.txt
cat STDOUT.0000 | grep ad_dynstat_adwvel_max | cut -c 59-77 | nl -i 1 > ad_stats/adwvel_max.txt
cat STDOUT.0000 | grep ad_dynstat_adwvel_sd | cut -c 59-77 | nl -i 1 > ad_stats/adwvel_sd.txt
cat STDOUT.0000 | grep ad_dynstat_adwvel_del2 | cut -c 59-77 | nl -i 1 > ad_stats/adwvel_del2.txt

# extract theta stats
cat STDOUT.0000 | grep ad_dynstat_adtheta_min | cut -c 59-77 | nl -i 1 > ad_stats/adtheta_min.txt
cat STDOUT.0000 | grep ad_dynstat_adtheta_mean | cut -c 59-77 | nl -i 1 > ad_stats/adtheta_mean.txt
cat STDOUT.0000 | grep ad_dynstat_adtheta_max | cut -c 59-77 | nl -i 1 > ad_stats/adtheta_max.txt
cat STDOUT.0000 | grep ad_dynstat_adtheta_sd | cut -c 59-77 | nl -i 1 > ad_stats/adtheta_sd.txt
cat STDOUT.0000 | grep ad_dynstat_adtheta_del2 | cut -c 59-77 | nl -i 1 > ad_stats/adtheta_del2.txt

# extract salt stats
cat STDOUT.0000 | grep ad_dynstat_adsalt_min | cut -c 59-77 | nl -i 1 > ad_stats/adsalt_min.txt
cat STDOUT.0000 | grep ad_dynstat_adsalt_mean | cut -c 59-77 | nl -i 1 > ad_stats/adsalt_mean.txt
cat STDOUT.0000 | grep ad_dynstat_adsalt_max | cut -c 59-77 | nl -i 1 > ad_stats/adsalt_max.txt
cat STDOUT.0000 | grep ad_dynstat_adsalt_sd | cut -c 59-77 | nl -i 1 > ad_stats/adsalt_sd.txt
cat STDOUT.0000 | grep ad_dynstat_adsalt_del2 | cut -c 59-77 | nl -i 1 > ad_stats/adsalt_del2.txt

# extract sst stats
cat STDOUT.0000 | grep ad_dynstat_adsst_min | cut -c 59-77 | nl -i 1 > ad_stats/adsst_min.txt
cat STDOUT.0000 | grep ad_dynstat_adsst_mean | cut -c 59-77 | nl -i 1 > ad_stats/adsst_mean.txt
cat STDOUT.0000 | grep ad_dynstat_adsst_max | cut -c 59-77 | nl -i 1 > ad_stats/adsst_max.txt
cat STDOUT.0000 | grep ad_dynstat_adsst_sd | cut -c 59-77 | nl -i 1 > ad_stats/adsst_sd.txt
cat STDOUT.0000 | grep ad_dynstat_adsst_del2 | cut -c 59-77 | nl -i 1 > ad_stats/adsst_del2.txt

# extract sss stats
cat STDOUT.0000 | grep ad_dynstat_adsss_min | cut -c 59-77 | nl -i 1 > ad_stats/adsss_min.txt
cat STDOUT.0000 | grep ad_dynstat_adsss_mean | cut -c 59-77 | nl -i 1 > ad_stats/adsss_mean.txt
cat STDOUT.0000 | grep ad_dynstat_adsss_max | cut -c 59-77 | nl -i 1 > ad_stats/adsss_max.txt
cat STDOUT.0000 | grep ad_dynstat_adsss_sd | cut -c 59-77 | nl -i 1 > ad_stats/adsss_sd.txt
cat STDOUT.0000 | grep ad_dynstat_adsss_del2 | cut -c 59-77 | nl -i 1 > ad_stats/adsss_del2.txt

# extract swdown stats
cat STDOUT.0000 | grep ad_dynstat_adswdown_min | cut -c 59-77 | nl -i 1 > ad_stats/adswdown_min.txt
cat STDOUT.0000 | grep ad_dynstat_adswdown_mean | cut -c 59-77 | nl -i 1 > ad_stats/adswdown_mean.txt
cat STDOUT.0000 | grep ad_dynstat_adswdown_max | cut -c 59-77 | nl -i 1 > ad_stats/adswdown_max.txt
cat STDOUT.0000 | grep ad_dynstat_adswdown_sd | cut -c 59-77 | nl -i 1 > ad_stats/adswdown_sd.txt
cat STDOUT.0000 | grep ad_dynstat_adswdown_del2 | cut -c 59-77 | nl -i 1 > ad_stats/adswdown_del2.txt

# extract lwdown stats
cat STDOUT.0000 | grep ad_dynstat_adlwdown_min | cut -c 59-77 | nl -i 1 > ad_stats/adlwdown_min.txt
cat STDOUT.0000 | grep ad_dynstat_adlwdown_mean | cut -c 59-77 | nl -i 1 > ad_stats/adlwdown_mean.txt
cat STDOUT.0000 | grep ad_dynstat_adlwdown_max | cut -c 59-77 | nl -i 1 > ad_stats/adlwdown_max.txt
cat STDOUT.0000 | grep ad_dynstat_adlwdown_sd | cut -c 59-77 | nl -i 1 > ad_stats/adlwdown_sd.txt
cat STDOUT.0000 | grep ad_dynstat_adlwdown_del2 | cut -c 59-77 | nl -i 1 > ad_stats/adlwdown_del2.txt
