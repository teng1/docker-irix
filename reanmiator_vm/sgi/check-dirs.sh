#!/bin/bash

function checkDir()
{
   if [ -z "$1" ]; then
      return
   fi
   
   if [ ! -d $dir ]; then
      sudo mkdir $dir
      sudo chmod 777 $dir
   fi
}

dir="/diskless"
checkDir $dir

dir="/home/irix/i"
checkDir $dir

dir="/home/irix/i/IRIX"
checkDir $dir

dir="/home/irix/i/ISOs"
checkDir $dir

dir="/home/irix/i/mnt"
checkDir $dir

dir="/home/irix/i/sda1"
checkDir $dir

dir="/home/irix/i/diskless"
checkDir $dir
