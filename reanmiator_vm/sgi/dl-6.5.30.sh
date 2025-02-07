#!/bin/bash

read -p "$enter_abort" SELECTION
if [[ -n $SELECTION ]]; then
        exit
fi

echo "Downloading IRIX 6.5.30..." 
./dl-selections.sh 6.5.30.txt
rm -rf $localdir/IRIX/6.5.30
mkdir -p $localdir/IRIX/6.5.30

wget $remotedirIRIX/6.5.30/disc1.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.30
wget $remotedirIRIX/6.5.30/disc2.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.30
wget $remotedirIRIX/6.5.30/disc3.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.30
wget $remotedirIRIX/6.5.30/apps.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.30
wget $remotedirIRIX/6.5.30/capps.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.30
