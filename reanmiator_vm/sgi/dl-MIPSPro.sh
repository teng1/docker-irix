#!/bin/bash

read -p "$enter_abort" SELECTION
if [[ -n $SELECTION ]]; then
	exit
fi

echo "Downloading MIPSPro ..." 
./dl-selections.sh MIPSPro.txt
rm -rf $localdir/IRIX/MIPSPro
mkdir -p $localdir/IRIX/MIPSPro/C
mkdir -p $localdir/IRIX/MIPSPro/C++

wget $remotedirIRIX/MIPSPro/"MIPSpro C++ Compiler 7.4.tar" -O - | tar -x --directory $localdir/IRIX/MIPSPro/C++
wget $remotedirIRIX/MIPSPro/"MIPSpro C Compiler 7.4.tar" -O - | tar -x --directory $localdir/IRIX/MIPSPro/C
