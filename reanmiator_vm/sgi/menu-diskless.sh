#!/bin/bash

while true
do

./menu-header.sh

echo "* Diskless workstation menu *"
echo "Please, read https://github.com/Linux-RISC/IRIX-diskless-workstation/"
echo ""
echo "1. Edit /etc/bootparams"
echo "2. Edit /etc/exports"
echo "3. Restart bootparamd service to apply changes"
echo "4. Restart nfs-kernel-server service to apply changes"
echo ""
echo "6. Show 'df -Th' output"
echo "7. List 'diskless' directory"
echo "8. Open a shell on 'diskless' directory"
echo "9. Open Midnight Commander on 'diskless' directory"
echo ""
echo "11. C1 configuration: restore /home/irix/i/diskless.tar to /home/irix/i"
echo "12. C2 configuration: restore /home/irix/i/sda1/diskless.tar to /home/irix/i/sda1 (/dev/sda1 *must* be mounted on /home/irix/i/sda1)"
echo "13. C3 configuration: restore /home/irix/i/diskless/IRIS.tar to /home/irix/i/diskless"
echo ""
echo "99. Exit"
echo -n $enter_selection

read SELECTION

case $SELECTION in

  1)
    sudo nano /etc/bootparams
    ;;

  2)
    sudo nano /etc/exports
    ;;

  3)
    sudo service bootparamd restart
    ;;
    
  4)
    sudo service nfs-kernel-server restart
    ;;

  6)
    df -Th
    read -rsp "$enter_continue"
    ;;

  7)
    ls -l $localdir/diskless
    read -rsp "$enter_continue"
    ;;

  8)
    cd $localdir/diskless
    echo "type 'exit' to return to menu"
    $SHELL
    cd
    ;;

  9)
    cd $localdir/diskless
    mc
    cd
    ;;

  11)
    ./untar.sh diskless.tar $localdir
    read -rsp "$enter_continue"
    ;;

  12)
    ./untar.sh diskless.tar $localdir/sda1
    read -rsp "$enter_continue"
    ;;

  13)
    ./untar.sh IRIS.tar $localdir/diskless
    read -rsp "$enter_continue"
    ;;

  99)
    exit
    ;;

  *)
    echo $try_again
    ;;
esac

done
