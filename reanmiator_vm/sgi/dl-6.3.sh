#!/bin/bash

read -p "$enter_abort" SELECTION
if [[ -n $SELECTION ]]; then
	exit
fi

echo "Downloading IRIX 6.3..." 
./dl-selections.sh 6.3.txt
rm -rf $localdir/IRIX/irix63

wget $remotedirIRIX/irix63.tgz -O - | tar -xz --directory $localdir/IRIX
