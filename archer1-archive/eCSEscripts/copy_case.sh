#! /bin/bash
# make a new case by copying an old case 
# (without copying results files or unnecessary binaries)
#
# e.g. copy_case.sh SO_032 SO_033

MC=$M_ROOT/cases

mkdir $MC/$2
mkdir $MC/$2/run
mkdir $MC/$2/build

cp $MC/$1/build/mitgcmuv $MC/$2/build
cp $MC/$1/build/genmake.log $MC/$2/build

cp -r $MC/$1/code $MC/$2
cp -r $MC/$1/input $MC/$2
cp -r $MC/$1/scripts $MC/$2

# Added by Sudipta Goswami
# Changes the JOBNO in sub_*.sh scripts if the two JOBIDS
# contain an '_'

cd $MC/$2/scripts

var1u=`echo $1 | grep -b -o '_' | awk 'BEGIN {FS=":"}{print $1}'`
var1u=`expr $var1u+1`

var2u=`echo $2 | grep -b -o '_' | awk 'BEGIN {FS=":"}{print $1}'`
var2u=`expr $var2u+1`

IDstring="JOBNO="

var1old=$IDstring${1:$var1u}
var2new=$IDstring${2:$var2u}

perl -pi -e "s/$var1old/$var2new/g" sub*.sh

