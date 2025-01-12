:<<'COMMENTS'

Understanding Linux Time
-------------------------

-> date
    check time and set time display format

-> hwclock
    manipulate the hardware time

-> timedatectl
    generic utility to manage time related properties

-> "ntp"
    helps to sync time from external server
    -> 1000 seconds is threshold for NTP sync b/w  hwclock & NTP time


Managing Linux Time
-------------------------

-> "date":
    -> Print or set the system date and time

    #Display the current date in UTC, using the ISO 8601 format:
    date -u +%Y-%m-%dT%H:%M:%S%Z



Understanding the NTP Protocol (Network Time Protocol)
-----------------------------------------------------------

-> It is common practice to make system time from NTP

-> Linux has different NTP service
    -> chrony
    -> systemd-timesyncd


Managing Time Synchronization
---------------------------------------

-> timedatectl set-ntp
    Enables / disables timesync

-> timedatectl timesync-status
    shows timesync status information

    timedatectl status

-> chronyc sources
    shows currently used time sources

-> chronyc tracking
    shows details about timesync




COMMENTS


# format date
tldr date
date +%Y-%m-%d_%H%M

# backup /etc
sudo tar cvf /tmp/backup-$(date +%Y-%m-%d_%H%M).tar /etc

# synchronize hardware clock from system time
sudo apt install util-linux-extra
sudo hwclock
sudo hwclock --help
sudo hwclock --systohc

# Get details of system time and date
sudo timedatectl
sudo timedatectl show

    :<<'COMMAND_OUTPUT'
               Local time: Sun 2025-01-12 15:18:52 IST
           Universal time: Sun 2025-01-12 09:48:52 UTC
                 RTC time: Sun 2025-01-12 09:48:52
                Time zone: Asia/Kolkata (IST, +0530)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no

Timezone=Asia/Kolkata
LocalRTC=no
CanNTP=yes
NTP=yes
NTPSynchronized=yes
TimeUSec=Sun 2025-01-12 15:21:59 IST
RTCTimeUSec=Sun 2025-01-12 15:21:58 IST
COMMAND_OUTPUT

# Set timezone to IST
sudo timedatectl set-timezone Asia/Calcutta

# In Redhat, check status of chronyd
sudo systemctl status chronyd

# In Ubuntu, check status of systemd-timesyncd
sudo systemctl status systemd-timesyncd

    :<<'TIMESYNCD_COMMAND_OUTPUT'
● systemd-timesyncd.service - Network Time Synchronization
     Loaded: loaded (/usr/lib/systemd/system/systemd-timesyncd.service; enabled; preset: enabled)
     Active: active (running) since Sun 2025-01-12 07:46:07 IST; 12h ago
       Docs: man:systemd-timesyncd.service(8)
   Main PID: 1473 (systemd-timesyn)
     Status: "Contacted time server 185.125.190.58:123 (ntp.ubuntu.com)."
      Tasks: 2 (limit: 154384)
     Memory: 1.9M (peak: 2.6M)
        CPU: 106ms
     CGroup: /system.slice/systemd-timesyncd.service
             └─1473 /usr/lib/systemd/systemd-timesyncd

Jan 12 07:46:07 ryzen9 systemd[1]: Starting systemd-timesyncd.service - Network Time Synchronization...
Jan 12 07:46:07 ryzen9 systemd[1]: Started systemd-timesyncd.service - Network Time Synchronization.
Jan 12 07:46:38 ryzen9 systemd-timesyncd[1473]: Contacted time server 185.125.190.58:123 (ntp.ubuntu.com).
Jan 12 07:46:38 ryzen9 systemd-timesyncd[1473]: Initial clock synchronization to Sun 2025-01-12 07:46:38.756398 IST.
TIMESYNCD_COMMAND_OUTPUT


