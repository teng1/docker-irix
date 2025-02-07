#!/bin/bash

read -p "$enter_abort" SELECTION
if [[ -n $SELECTION ]]; then
	exit
fi

echo "Downloading IRIX 6.5.0..." 
./dl-selections.sh 6.5.0.txt
rm -rf $localdir/IRIX/irix650

wget $remotedirIRIX/irix650.tgz -O - | tar -xz --directory $localdir/IRIX
