#!/bin/bash

conf_modified="network configuration modified, please reboot to apply changes"
confirm="are you sure to apply the selected configuration (y/n)?"

while true
do

./menu-header.sh

echo "* Network assistant menu - WARNING: this menu is intended to work on Raspberry Pi only *"
echo ""
echo "- select a network template configuration according to your Raspberry Pi network configuration"
echo "1. (default) No Wi-Fi connection on RBPi, sgi computer-->(router or switch)<--Raspberry Pi 192.168.9.100"
echo  "Use this configuration if both RBPi and sgi are connected to a wired network, with or without Internet access"
echo  "If Internet is available, configure your gateway and a DNS on your sgi, for example DNS=8.8.8.8"
echo ""
echo "2. Wi-Fi<--Raspberry Pi 3 or 4 (Wi-Fi DHCP,Ethernet 192.168.9.100)-->sgi computer"
echo  "* REQUIRES RBPi 3 or 4 *"
echo  "Use this configuration if you just have Wi-Fi connection to the Internet"
echo  "The RBPi will work as a router for your sgi computer, allowing access to the Internet through your Wi-Fi network"
echo  "Configure the RBPi as gateway on your sgi (by default 192.168.9.100) and a DNS, for example DNS=8.8.8.8"
echo  ""
echo "99. Exit"
echo -n $enter_selection

read SELECTION

case $SELECTION in

  1)
    echo -n $confirm
    read SELECTION
    if [[ $SELECTION =~ [Yy] ]]; then
	#sudo ./iptables-reset.sh
	sudo cp dhcpcd.conf /etc
	#sometimes the wifi is not disabled
	#sudo rfkill block wifi
	sudo cp wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
	sudo rfkill block wifi
	echo $conf_modified
    fi
    read -rsp "$enter_continue"
    ;;
    
  2)
    echo -n $confirm
    read SELECTION
    if [[ $SELECTION =~ [Yy] ]]; then
	#sudo sudo apt-get install netfilter-persistent
	#sudo ./iptables-rules.sh
	sudo cp dhcpcd.conf /etc
	# disable gateway
	sudo sed -i 's/^static routers=192.168.9.254/#static routers=192.168.9.254/g' /etc/dhcpcd.conf
	# enable ip forwading
	sudo sed -i 's/^#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
	#sudo rfkill unblock wifi
	sudo cp wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf
	sudo rfkill unblock wifi
	echo "configure Wi-Fi on raspi-config: 1 System Options --> S1 Wireless LAN"
    	read -rsp "$enter_continue"
	sudo raspi-config
	echo $conf_modified
    fi
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
