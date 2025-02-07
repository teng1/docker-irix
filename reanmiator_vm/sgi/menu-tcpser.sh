#!/bin/bash

while true
do

./menu-header.sh

echo "* tcpser menu - emulate a Hayes compatible modem *"
echo ""
echo "- default configuration: /dev/ttyUSB0, 9600 bps"
echo "- the device must exist to start tcpser at boot"
echo "- a null-modem cable is required"
echo "1. List /dev/tty* devices"
echo "2. Edit tcpser configuration"
echo "3. Show tcpser status"
echo "4. start tcpser"
echo "5. stop tcpser"
echo  ""
echo "99. Exit"
echo -n $enter_selection

read SELECTION

case $SELECTION in
    
  1)
    ls /dev/tty*
    read -rsp "$enter_continue"
    ;;
    
  2)
    sudo nano /etc/init.d/tcpser.sh
    ;;
    
  3)
    sudo /etc/init.d/tcpser.sh status
    read -rsp "$enter_continue"
    ;;
    
  4)
    sudo /etc/init.d/tcpser.sh start
    read -rsp "$enter_continue"
    ;;
    
  5)
    sudo /etc/init.d/tcpser.sh stop
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
