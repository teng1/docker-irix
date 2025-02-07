#!/bin/bash

read -p "$enter_abort" SELECTION
if [[ -n $SELECTION ]]; then
	exit
fi

echo "Downloading IRIX 6.2..." 
./dl-selections.sh 6.2.txt
rm -rf $localdir/IRIX/irix62

wget $remotedirIRIX/irix62.tgz -O - | tar -xz --directory $localdir/IRIX
