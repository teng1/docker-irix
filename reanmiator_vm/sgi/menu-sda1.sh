#!/bin/bash

while true
do

./menu-header.sh

echo "* /dev/sda1 menu - WARNING: this menu is intended to work on Raspberry Pi only *"
echo ""
echo "- connect a drive and mount it on 'sda1' directory"
echo "1. Show 'df -Th' output"
echo "2. List '/dev/sda' device using 'fdisk -l /dev/sda'"
echo "3. List 'sda1' directory"
echo "4. Mount /dev/sda1 on 'sda1' directory"
echo "5. Umount /dev/sda1"
echo "6. Open a shell on 'sda1' directory"
echo "7. Open Midnight Commander on 'sda1' directory"
echo  ""
echo "99. Exit"
echo -n $enter_selection

read SELECTION

case $SELECTION in

  1)
    df -Th
    read -rsp "$enter_continue"
    ;;
    
  2)
    sudo fdisk -l /dev/sda
    read -rsp "$enter_continue"
    ;;
    
  3)
    ls -l $localdir/sda1
    read -rsp "$enter_continue"
    ;;
    
  4)
    sudo mount /dev/sda1 $localdir/sda1
    read -rsp "$enter_continue"
    ;;
        
  5)
    sudo umount /dev/sda1
    read -rsp "$enter_continue"
    ;;
        
  6)
    cd $localdir/sda1
    echo "type 'exit' to return to menu"
    $SHELL
    cd
    ;;

  7)
    cd $localdir/sda1
    mc
    cd
    ;;

  99)
    exit
    ;;

  *)
    echo $try_again
    ;;
esac

done
