#!/bin/sh
set -e

echo 1 > /proc/sys/net/ipv4/ip_no_pmtu_disc
echo "2048 32767" > /proc/sys/net/ipv4/ip_local_port_range
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6

/usr/bin/supervisord -c /etc/supervisord.conf

# while true
#  do 
#    sleep 10000000000
#  done 

