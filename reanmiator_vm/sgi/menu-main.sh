#!/bin/bash

# global variables
export localdir="/home/irix/i"
export remotedir="http://irix.mersisl.com"
export remotedirIRIX="$remotedir/IRIX"
export enter_continue="Press enter to continue..."
export enter_abort="Press enter to continue or enter another string to abort..."
export enter_selection="enter your selection: "
export try_again="incorrect selection, try again"

while true
do

./menu-header.sh

echo "* enabled services *"
echo "sudo, ntp client, bootp, tfptp, rsh, ssh, sftp, anonymous FTP, NFS (versions 2, 3), Samba, AppleTalk"
echo ""
echo "* selections file templates *"
echo "selections file			remote directory for installer	common partition command"
echo "irix@rbpi:i/MIPSPro.txt"
echo "irix@rbpi:i/5.3.txt		IRIX/irix53/1/dist		bootp():IRIX/irix53/1/stand/fx.ARCS"
echo "irix@rbpi:i/6.2.txt		IRIX/irix62/1/dist		bootp():IRIX/irix62/1/stand/fx.ARCS or fx.64"
echo "irix@rbpi:i/6.3.txt		IRIX/irix63/1/dist		bootp():IRIX/irix63/1/stand/fx.ARCS or fx.64"
echo "irix@rbpi:i/6.5.0.txt		IRIX/irix650/1/dist		bootp():IRIX/irix650/1/stand/fx.ARCS or fx.64"
echo "irix@rbpi:i/6.5.7.txt		IRIX/irix657/1/dist		bootp():IRIX/irix657/1/stand/fx.ARCS or fx.64"
echo "irix@rbpi:i/6.5.22.txt		IRIX/6.5.22/ovl1/dist		bootp():IRIX/6.5.22/ovl1/stand/fx.ARCS or fx.64"
echo "irix@rbpi:i/6.5.30.txt		IRIX/6.5.30/disc1/dist		bootp():IRIX/6.5.30/disc1/stand/fx.ARCS or fx.64"
echo ""
echo "name of the server: rbpi(Raspberry Pi 192.168.9.100) or debian(VirtualBox 192.168.9.101)"
echo "Default clients defined in /etc/bootptab and /etc/hosts: IRIS:ip=192.168.9.1 and IRIS2:ip=192.168.9.2"
echo ""

echo "0. Show changelog.txt"
echo "1. Network configuration menu"
echo "2. Download menu"
echo "3. Automount ISO images menu"
echo "4. Mount /dev/sda1 menu (Raspberry Pi only)"
echo "5. tcpser menu - emulate a Hayes compatible modem"
echo "6. Diskless workstation menu"
echo  ""
echo "10. Get Reanimator scripts updated from the Internet"
echo "11. Update this system"
echo "12. Reboot this system"
echo "13. Shut down this system"
echo  ""
echo "99. Exit"
echo -n $enter_selection

read SELECTION

case $SELECTION in

  0)
    more changelog.txt
    read -rsp "$enter_continue"
    ;;

  1)
    ./menu-network.sh
    ;;

  2)
    ./menu-download.sh
    ;;
        

  3)
    ./menu-automount.sh
    ;;

  4)
    ./menu-sda1.sh
    ;;
    
  5)
    ./menu-tcpser.sh
    ;;
        
  6)
    ./menu-diskless.sh
    ;;
        
  10)
    ./update-reanimator.sh
    read -rsp "$enter_continue"
    ;;

  11)
    ./update.sh
    read -rsp "$enter_continue"
    ;;

  12)
    sudo reboot
    ;;

  13)
    sudo poweroff
    ;;

  99)
    echo "type 'exit' to log out"
    exit
    ;;

  *)
    echo $try_again
    ;;
esac

done
