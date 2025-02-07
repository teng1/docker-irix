#!/bin/bash

#declare -a files=$(find /home/irix/i/ISOs -type f -iname "*.iso" -exec basename {} \;)

#for i in "${files[@]}"
./umountall.sh
echo ""

echo "Mounting all *.iso files on 'ISOs' directory..." 
EXT=*.iso
for i in $localdir/ISOs/$EXT
do
    if [ "$(basename "$i")" = $EXT ]; then
       continue;
    fi
    echo $(basename "$i")
    sudo mkdir $localdir"/mnt/$(basename "$i")"
    sudo mount -o loop --read-only $localdir"/ISOs/$(basename "$i")" $localdir"/mnt/$(basename "$i")"
    ret_code=$?
    if [ $ret_code != 0 ]; then
       sudo mount -t efs -o loop --read-only $localdir"/ISOs/$(basename "$i")" $localdir"/mnt/$(basename "$i")"
    fi
done
