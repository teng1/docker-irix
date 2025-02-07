#!/bin/bash

if [[ -z $1 ]]; then
	exit
fi

rm $localdir/$1
wget $remotedirIRIX/$1 --directory-prefix=$localdir
if [[ -z $(uname -a|grep -i arm) ]]; then
	sed -i 's/rbpi/debian/g' $localdir/$1
fi
