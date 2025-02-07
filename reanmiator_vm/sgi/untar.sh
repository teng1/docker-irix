#!/bin/bash

if [[ -z $1 ]]; then
	exit
fi

if [[ -z $2 ]]; then
	exit
fi

read -p "$enter_abort" SELECTION
if [[ -n $SELECTION ]]; then
	exit
fi

echo "Restoring "$2"/"$1" to "$2
sudo tar xvf $2/$1 --directory $2
