#!/bin/bash
#
##PBS -e ../run
#PBS -j oe
#PBS -m n
##PBS -o ../run
#PBS -l select=serial=true:ncpus=1
#PBS -r n


export USERID=`whoami`

# Change the variable below to point to the folder that needs to be copied

PATH_TO_FOLDERS=/home/n02/n02/$USERID/work/mitgcm/cases/SO_A05/run/stateUvel

# Change dest path if required
#DEST_PATH=/nerc/n02/n02/$USERID/work/mitgcm/cases

#echo "Copying $PATH_TOFOLDER to $DEST_PATH"

#cp -r $PATH_TO_FOLDERS $DEST_PATH

if [ $HOMEHOST != 'null' ] ; then

  HOMEDIR=$HOMEROOT/SO_A05/run

  cd ${PATH_TO_FOLDERS}
  ssh -t $HOMEHOST "mkdir -p $HOMEDIR"
  rsync -avzL *.nc $HOMEHOST:$HOMEDIR

fi


PATH_TO_FOLDERS=/home/n02/n02/$USERID/work/mitgcm/cases/SO_A05/run/stateVvel
cd ${PATH_TO_FOLDERS}
rsync -avzL *.nc $HOMEHOST:$HOMEDIR

