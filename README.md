
# docker-irix-network-install 

tcpdump -v -i lo

Start Bootpd in foreground
bootpd -s -d4


tcpdump -v -i lo

Works
curl -O tftp://0.0.0.0/file.boot

works (as root on host)
rsh -l irix localhost

curl -T file.boot tftp://localhost/

Bootp
dhcping -c irix -s 127.0.0.1