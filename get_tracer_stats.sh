#!/bin/bash

# extract mean values
cat stdOUT.txt | grep trcstat_ptracer01_mean | cut -c 59-77 | nl -i 1 > ptr1_mean.txt
cat stdOUT.txt | grep trcstat_ptracer02_mean | cut -c 59-77 | nl -i 1 > ptr2_mean.txt
cat stdOUT.txt | grep trcstat_ptracer03_mean | cut -c 59-77 | nl -i 1 > ptr3_mean.txt
cat stdOUT.txt | grep trcstat_ptracer04_mean | cut -c 59-77 | nl -i 1 > ptr4_mean.txt
cat stdOUT.txt | grep trcstat_ptracer05_mean | cut -c 59-77 | nl -i 1 > ptr5_mean.txt

# extract min values
cat stdOUT.txt | grep trcstat_ptracer01_min | cut -c 59-77 | nl -i 1 > ptr1_min.txt
cat stdOUT.txt | grep trcstat_ptracer02_min | cut -c 59-77 | nl -i 1 > ptr2_min.txt
cat stdOUT.txt | grep trcstat_ptracer03_min | cut -c 59-77 | nl -i 1 > ptr3_min.txt
cat stdOUT.txt | grep trcstat_ptracer04_min | cut -c 59-77 | nl -i 1 > ptr4_min.txt
cat stdOUT.txt | grep trcstat_ptracer05_min | cut -c 59-77 | nl -i 1 > ptr5_min.txt

# extract max values
cat stdOUT.txt | grep trcstat_ptracer01_max | cut -c 59-77 | nl -i 1 > ptr1_max.txt
cat stdOUT.txt | grep trcstat_ptracer02_max | cut -c 59-77 | nl -i 1 > ptr2_max.txt
cat stdOUT.txt | grep trcstat_ptracer03_max | cut -c 59-77 | nl -i 1 > ptr3_max.txt
cat stdOUT.txt | grep trcstat_ptracer04_max | cut -c 59-77 | nl -i 1 > ptr4_max.txt
cat stdOUT.txt | grep trcstat_ptracer05_max | cut -c 59-77 | nl -i 1 > ptr5_max.txt

# extract sd values
cat stdOUT.txt | grep trcstat_ptracer01_sd | cut -c 59-77 | nl -i 1 > ptr1_sd.txt
cat stdOUT.txt | grep trcstat_ptracer02_sd | cut -c 59-77 | nl -i 1 > ptr2_sd.txt
cat stdOUT.txt | grep trcstat_ptracer03_sd | cut -c 59-77 | nl -i 1 > ptr3_sd.txt
cat stdOUT.txt | grep trcstat_ptracer04_sd | cut -c 59-77 | nl -i 1 > ptr4_sd.txt
cat stdOUT.txt | grep trcstat_ptracer05_sd | cut -c 59-77 | nl -i 1 > ptr5_sd.txt

# extract del2 values
cat stdOUT.txt | grep trcstat_ptracer01_del2 | cut -c 59-77 | nl -i 1 > ptr1_del2.txt
cat stdOUT.txt | grep trcstat_ptracer02_del2 | cut -c 59-77 | nl -i 1 > ptr2_del2.txt
cat stdOUT.txt | grep trcstat_ptracer03_del2 | cut -c 59-77 | nl -i 1 > ptr3_del2.txt
cat stdOUT.txt | grep trcstat_ptracer04_del2 | cut -c 59-77 | nl -i 1 > ptr4_del2.txt
cat stdOUT.txt | grep trcstat_ptracer05_del2 | cut -c 59-77 | nl -i 1 > ptr5_del2.txt

# extract seaice values
cat stdOUT.txt | grep seaice_area_mean | cut -c 59-77 | nl -i 1 > sice_area_mean.txt
cat stdOUT.txt | grep seaice_area_max | cut -c 59-77 | nl -i 1 > sice_area_max.txt

# cfl
cat stdOUT.txt | grep advcfl_uvel_max | cut -c 59-77 | nl -i 1 > cfl_uvel_max.txt
cat stdOUT.txt | grep advcfl_vvel_max | cut -c 59-77 | nl -i 1 > cfl_vvel_max.txt
cat stdOUT.txt | grep advcfl_wvel_max | cut -c 59-77 | nl -i 1 > cfl_wvel_max.txt
