#!/bin/bash

read -p "$enter_abort" SELECTION
if [[ -n $SELECTION ]]; then
        exit
fi

echo "Downloading IRIX 6.5.22..." 
./dl-selections.sh 6.5.22.txt
rm -rf $localdir/IRIX/6.5.22
mkdir -p $localdir/IRIX/6.5.22

wget $remotedirIRIX/6.5.22/disc1.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.22
wget $remotedirIRIX/6.5.22/disc2.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.22
wget $remotedirIRIX/6.5.22/disc3.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.22
wget $remotedirIRIX/6.5.22/apps.tar.gz -O - | tar -xz --directory $localdir/IRIX/6.5.22
