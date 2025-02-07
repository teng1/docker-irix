#!/bin/bash

read -p "$enter_abort" SELECTION
if [[ -n $SELECTION ]]; then
	exit
fi

echo "Downloading IRIX 6.5.x..." 
rm -rf $localdir/IRIX/irix65x

wget $remotedirIRIX/irix65x.tgz -O - | tar -xz --directory $localdir/IRIX
