#!/bin/bash

while true
do

./menu-header.sh

echo "* Networking menu *"
echo ""
echo "* Change client names and IPs *"
echo "1. Edit /etc/hosts"
echo "2. Edit /etc/bootptab"
echo ""
echo "* Change server's IP, gateway and DNS configuration *"
echo "3. Automatic configuration: Network assistant menu (Raspberry Pi only)"
echo "4. Manual configuration: Edit /etc/dhcpcd.conf (Raspberry Pi OS)"
echo "5. Manual configuration: Edit /etc/network/interfaces (Debian on VirtualBox)"
echo ""
echo "6. Reboot to apply network configuration changes"
echo  ""
echo "99. Exit"
echo -n $enter_selection

read SELECTION

case $SELECTION in

  1)
    sudo nano /etc/hosts
    ;;

  2)
    sudo nano +9999 /etc/bootptab
    ;;

  3)
    ./menu-netassistant.sh
    ;;
    
  4)
    sudo nano +9999 /etc/dhcpcd.conf
    ;;

  5)
    sudo nano /etc/network/interfaces
    ;;
    
  6)
    sudo reboot
    ;;
        
  99)
    exit
    ;;

  *)
    echo $try_again
    ;;
esac

done
