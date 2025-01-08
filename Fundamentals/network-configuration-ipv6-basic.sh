:<<'COMMENTS'

IPv6 Addresses

Addresses are 128 bits and written in hexadecimal
    fe80::a662:7399:4bc3:cfe1

Leading zeros can be omitted, as well as long strings of zeros
    fe80::1

When referring to address + port, put the address between square brackets
    [fe80::1]:80

Default subnet mask is /64

Node bit of the address may contain the device mac address


Reserved IPv6 Addresses
-----------------------

::1/128         localhost
::              unspecified address (0.0.0.0)
::/0            default route
2000::/3        global unicast address
fd00::/8        unique local address (private addresses)
fe80::/64       link-local address
ff00::/8        multicast


Obtaining an IPv6 Address
-------------------------

-> fe80::  address is used by default
-> Through static addressing
-> DHCPv6
    Multicast is sent out to ff02::1:2 port 547/UDP.
    This is the all-DHCP multicast group.
    The DHCP server sends a packet back to client 546/UDP
-> SLAAC (Stateless Address Auto Configuration)
    Router solicitation is sent to ff02::2; the all-routers multicast group.
    The router sends back an IP address, which allows the host to learn the
    network prefix. Install the radvd package to use this.




COMMENTS

