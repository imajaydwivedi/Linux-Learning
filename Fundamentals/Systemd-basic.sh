:<<'COMMENTS'

Understanding Systemd
----------------------

-> Systemd is the manager of everything

-> It's the first thing that is started after starting the Linux Kernel

-> It starts processes and can do that in parallel

-> It also manages mounts, timers, paths, and much more

-> It is event driven, which means that it can react to specific events

-> The items that are managed by systemd are called units

-> Default units are in /usr/lib/systemd/system, custom units are in /etc/systemd/system

-- *********************************************************************************************************
-- *********************************************************************************************************

Managing Services
-----------------

# Get all systemd units
sudo systemctl -t help

    Available unit types:
    service
    mount
    swap
    socket
    target
    device
    automount
    timer
    path
    slice
    scope

# Get unit files
sudo systemctl list-unit-files

# what is happening right now
systemctl  list-units
sudo systemctl list-units | grep -i postgres


COMMENTS

# install httpd web server
sudo dnf install -y httpd

# check initial status
sudo systemctl status httpd

    :<<'OUTPUT'
adwivedi@pgprod:~$ sudo systemctl status httpd
○ httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
    Drop-In: /usr/lib/systemd/system/service.d
             └─10-timeout-abort.conf, 50-keep-warm.conf
     Active: inactive (dead)
       Docs: man:httpd.service(8)
adwivedi@pgprod:~$ 
OUTPUT

# start web server service
sudo systemctl start httpd
sudo systemctl status httpd

    :<<'COMMAND_OUTPUT'
adwivedi@pgprod:~$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
    Drop-In: /usr/lib/systemd/system/service.d
             └─10-timeout-abort.conf, 50-keep-warm.conf
     Active: active (running) since Wed 2025-01-08 18:43:21 IST; 48s ago
 Invocation: 2e8173d2fc184c1ab1c69ddd35c49193
       Docs: man:httpd.service(8)
   Main PID: 3454 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 177 (limit: 9477)
     Memory: 14.8M (peak: 15.5M)
        CPU: 131ms
     CGroup: /system.slice/httpd.service
             ├─3454 /usr/sbin/httpd -DFOREGROUND
             ├─3455 /usr/sbin/httpd -DFOREGROUND
             ├─3456 /usr/sbin/httpd -DFOREGROUND
             ├─3457 /usr/sbin/httpd -DFOREGROUND
             └─3458 /usr/sbin/httpd -DFOREGROUND

Jan 08 18:43:21 pgprod systemd[1]: Starting httpd.service - The Apache HTTP Server...
Jan 08 18:43:21 pgprod (httpd)[3454]: httpd.service: Referenced but unset environment variable evaluates to an empty string: OPTIONS
Jan 08 18:43:21 pgprod httpd[3454]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using fe80::b6f7:6039:9bce:681b%enp1s0. Set the 'ServerName' directive globally to supp>
Jan 08 18:43:21 pgprod httpd[3454]: Server configured, listening on: port 80
Jan 08 18:43:21 pgprod systemd[1]: Started httpd.service - The Apache HTTP Server.
lines 1-24/24 (END)
COMMAND_OUTPUT


# Set service to start with OS
sudo systemctl enable httpd

# Stop service
sudo systemctl stop httpd
