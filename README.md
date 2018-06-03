# skewer-isc-dhcp

## Goal
Run a DHCP server on a local network.

## Configuration
To specify the configuration of the local network, create the file `etc/secret` based on the following template:
```
DOMAIN=lan
LAN_ID=192.168.1.0
LAN_MASK=255.255.255.0
IP_BEGIN=192.168.1.100
IP_END=192.168.1.254
ROUTER_IP=192.168.1.1
DNS_LIST=192.168.1.1
```
