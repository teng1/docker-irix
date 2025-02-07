#!/bin/bash

while true
do

./menu-header.sh

echo "* Automount menu *"
echo ""
echo "- upload ISO images to 'ISOs' directory to be automatically mounted on boot on 'mnt' directory"
echo "1. Show 'df -Th' output"
echo "2. List 'ISOs' directory"
echo "3. List 'mnt' directory"
echo "4. Mount all .iso files on 'ISOs' directory"
echo "5. Umount all entries on 'mnt' directory"
echo "6. Open a shell on 'mnt' directory"
echo "7. Open Midnight Commander on 'mnt' directory"
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
    ls -l $localdir/ISOs
    read -rsp "$enter_continue"
    ;;
    
  3)
    ls -l $localdir/mnt
    read -rsp "$enter_continue"
    ;;
    
  4)
    ./mountall.sh
    read -rsp "$enter_continue"
    ;;
        
  5)
    ./umountall.sh
    read -rsp "$enter_continue"
    ;;
        
  6)
    cd localdir$/mnt
    echo "type 'exit' to return to menu"
    $SHELL
    cd
    ;;

  7)
    cd $localdir/mnt
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
