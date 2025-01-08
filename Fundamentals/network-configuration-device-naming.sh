:<<'COMMENTS'

Understanding Network Device Naming
-----------------------------------

-> In old Linux, network device names were named according to the type of network device: eth0, wlan0

-> In modern Linux, network devices are named according to their physical location in the computer,
    with the help of the driver


Understanding Biosdevname
--------------------------------

-> Biosdevname uses device names that reveal information about physical location,
    and "systemd-udevd" generates the network device names
    - em123 (Ethernet Motherboard Portnumber)
    - p<port>p<slot> (PCI, PCI port)
    - eno123 (EtherNet Onboard)
    - if driver doesn't reveal sufficient information, eth0 etc. is used

-> 


COMMENTS



