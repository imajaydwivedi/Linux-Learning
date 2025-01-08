:<<'COMMENTS'

IPv4 (Internet Protocol version 4) is the fourth version of the Internet Protocol, responsible for
  addressing, and routing packets across networks.

IPv4 Address Structure
-----------------------
-> Format: Dotted-decimal notation (e.g., 192.168.1.1)
-> Total Address Space: 32 bits, divided into 4 octets (8 bits each).
-> Range: Each octet ranges from 0 to 255.
-> Binary Representation Example: 192.168.1.1 → 11000000.10101000.00000001.00000001

+-------+-----------------------------+-----------------+----------------+
| Class | Range                       | Default Subnet  | Purpose        |
|       |                             | Mask            |                |
+-------+-----------------------------+-----------------+----------------+
| A     | 1.0.0.0 - 126.0.0.0         | 255.0.0.0       | Large networks |
| B     | 128.0.0.0 - 191.255.255.255 | 255.255.0.0     | Medium networks|
| C     | 192.0.0.0 - 223.255.255.255 | 255.255.255.0   | Small networks |
| D     | 224.0.0.0 - 239.255.255.255 | N/A             | Multicasting   |
| E     | 240.0.0.0 - 255.255.255.255 | N/A             | Reserved       |
+-------+-----------------------------+-----------------+----------------+

Key Notes:

Private IP Ranges:
-----------------
- Class A: 10.0.0.0/8
- Class B: 172.16.0.0/12
- Class C: 192.168.0.0/16

Loopback Address: 127.0.0.1 (used for local testing and internal communication).
APIPA: 169.254.0.0/16 (automatic IP if DHCP fails).


IPv4 Subnetting
----------------
Subnetting divides an IP address into:
- Network ID: Identifies the network.
- Host ID: Identifies devices in the network.

Subnetting Example:
IP: 192.168.1.0/24 → 256 addresses (254 usable)

Network Address -> 192.168.1.12/24. "/24" represent netmask, that is network address bits.

                                +-----------------+
                                |    Internet     |
                                +--------+--------+
                                         |
                                         |
                                +--------v--------+
                                |     Router      |
                                | 192.168.1.254   |
                                +--------+--------+
                                         |
             +---------------------------+---------------------------+
             |                           |                           |
         192.168.1.12/24           192.168.1.13/24              DNS Server
             N                           N                           |
             |                           |                           |
             +-------------------------------------------------------+
                                         |
                                     Router
                                         |
        +-------------------------------+-----------------------------+
        |                               |                             |
        N                               N                             N
        |                               |                             |
    +---+---+                       +---+---+                     +---+---+
    |       |                       |       |                     |       |
    N       N                       N       N                     N       N






COMMENTS

