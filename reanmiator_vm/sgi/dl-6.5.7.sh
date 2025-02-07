#!/bin/bash

read -p "$enter_abort" SELECTION
if [[ -n $SELECTION ]]; then
	exit
fi

echo "Downloading IRIX 6.5.7..." 
./dl-selections.sh 6.5.7.txt
rm -rf $localdir/IRIX/irix657

wget $remotedirIRIX/irix657.tgz -O - | tar -xz --directory $localdir/IRIX
