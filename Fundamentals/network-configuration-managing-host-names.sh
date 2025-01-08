:<<'COMMENTS'

Managing Host Identity
-----------------------

-> For correct operations, it's important that Linux hosts have the right name set

-> Also, hostname resolution is required, as often reversed host name lookups are
    performed in communication between hosts

-> Use "hostnamectl" to set hostname

-> Configure the /etc/hosts file with appropriate host name lookup settings


Managing Host Name Resolution
-----------------------------

-> Host name resolution allows host names to be matched to IP addresses and the other way around

-> The local /etc/hosts file is the primary solution

-> DNS name servers are configured in /etc/resolv.conf

-> The order of host name resolution mechanisms is specified in /etc/nsswitch.conf

grep -C 2 'hosts:' /etc/nsswitch.conf


COMMENTS

