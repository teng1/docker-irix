#!/bin/bash

## FLUSH rules
/sbin/iptables -F
/sbin/iptables -X
/sbin/iptables -Z
/sbin/iptables -t nat -F

## FORWARD
# redirect all traffic from eth0
/sbin/iptables -A FORWARD -i eth0 -o wlan0 -j ACCEPT

## POSTROUTING
# NAT on wlan0 interface
/sbin/iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE

#netfilter-persistent save
