:<<'COMMENTS'

Modifying Service Configuration
-------------------------------

-> systemctl cat name.service
    reads current unit configuration

-> systemctl show name.service
    shows all available configuration parameters

-> systemctl edit name.service
    allows you to edit service configuration

-> After modifying service configuration, use
    systemctl daemon-reload

-> Next, use systemctl restart name.service to restart service

COMMENTS

# get postgres services
sudo systemctl list-units | grep postgres

    :<<'RESULTS'

    postgresql.service                                                                                                             loaded active exited    PostgreSQL RDBMS
    postgresql@16-main.service                                                                                                     loaded active running   PostgreSQL Cluster 16-main
    system-postgresql.slice                                                                                                        loaded active active    Slice /system/postgresql
RESULTS

# get all config files
sudo systemctl cat sshd.service

    :<<'COMMAND_RESULT'
# /usr/lib/systemd/system/sshd.service
[Unit]
Description=OpenSSH server daemon
Documentation=man:sshd(8) man:sshd_config(5)
After=network.target sshd-keygen.target
Wants=sshd-keygen.target
Wants=ssh-host-keys-migration.service

[Service]
Type=notify
EnvironmentFile=-/etc/sysconfig/sshd
ExecStart=/usr/sbin/sshd -D $OPTIONS
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartSec=42s

[Install]
WantedBy=multi-user.target

# /usr/lib/systemd/system/service.d/10-timeout-abort.conf

[Service]
TimeoutStopFailureMode=abort

[Service]
Environment=SYSTEMD_SLEEP_FREEZE_USER_SESSIONS=0
COMMAND_RESULT

# Make config change on http server
    # Enable restart of httpd service on crash
sudo systemctl edit httpd

    :<<'CONTENT_2_ADD'
[Service]
Restart=on-failure
RestartSec=42s
CONTENT_2_ADD

# restart service
sudo systemctl restart httpd

# check loaded/active settings
sudo systemctl status httpd
    # Main PID: 4009 (httpd)
sudo systemctl cat httpd | grep -i -C 2 restart

    :<<'COMMAND_OUTPUT'

# /etc/systemd/system/httpd.service.d/override.conf
[Service]
Restart=on-failure
RestartSec=42s

COMMAND_OUTPUT

# kill PID of httpd
sudo kill -9 4571
sudo systemctl status httpd
    # Notice the "Active: " section saying "activating (auto-restart)"
    # Once service restarts, PID will change

    :<<'COMMAND_OUTPUT'
adwivedi@pgprod:~$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)
    Drop-In: /usr/lib/systemd/system/service.d
             └─10-timeout-abort.conf, 50-keep-warm.conf
             /etc/systemd/system/httpd.service.d
             └─override.conf
     Active: activating (auto-restart) (Result: signal) since Wed 2025-01-08 20:34:45 IST; 2s ago
 Invocation: 2e5de7925ff0457ba89753f43f3bafcd
       Docs: man:httpd.service(8)
    Process: 4571 ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND (code=killed, signal=KILL)
   Main PID: 4571 (code=killed, signal=KILL)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
   Mem peak: 14.8M
        CPU: 159ms
COMMAND_OUTPUT



