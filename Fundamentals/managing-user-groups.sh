:<<'INTRODUCTION'

Creating Groups
---------------

-> To crate a group, use "groupadd groupname"

-> Add users to a group as secondary group, using "usermod -aG groupname username"



INTRODUCTION

# create dba group
sudo groupadd dba

# add saanvi/adwivedi to dba group
sudo usermod -aG dba saanvi
sudo usermod -aG dba adwivedi

# check details
id saanvi adwivedi postgres sshd | grep -En 'dba|$'

