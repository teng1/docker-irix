#!/bin/bash

read -p "$enter_abort" SELECTION
if [[ -n $SELECTION ]]; then
	exit
fi

echo "Downloading IRIX 5.3..." 
./dl-selections.sh 5.3.txt
rm -rf $localdir/IRIX/irix53

wget $remotedirIRIX/irix53.tgz -O - | tar -xz --directory $localdir/IRIX
