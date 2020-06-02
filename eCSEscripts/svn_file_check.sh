#!/bin/bash

# Sudipta Goswami
#
# script to find missing file/folder in svn repository
#

# Change the string below to match what you are looking for
LOOKINGFOR='SO_591'
REV_START=900
SVNURL=`svn info | grep URL | grep -v 'Relative' | awk '{ print $2; }'`
REV_FINISH=`svn info ${SVNURL} | grep 'Revision' | awk '{ print $2; }'`

cd $M_ROOT

echo "Searching from $REV_START to $REV_FINISH for ${LOOKINGFOR}"

for (( i=$REV_START; i<=$REV_FINISH; i++ ))
do
    svn log -r $i -v | grep ${LOOKINGFOR}
done



