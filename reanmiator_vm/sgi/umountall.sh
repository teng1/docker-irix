#!/bin/bash

echo "Umounting all entries on 'mnt' directory..." 
EXT=*.iso
for i in $localdir/mnt/$EXT
do
    if [ "$(basename "$i")" = $EXT ]; then
       continue;
    fi
    echo $(basename "$i")
    sudo umount "$i"
    sudo rmdir "$i"
done
