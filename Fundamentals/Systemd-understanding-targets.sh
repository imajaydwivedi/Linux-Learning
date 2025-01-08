:<<'COMMENTS'

Understanding Targets
---------------------

-> A target is a group of services

-> Some targets are isolatable, which means that you can use them to define
    the state your system should be started in
    -> emergency.target
    -> rescue.target
    -> multi-user.target
    -> graphical.target

-> Use "systemctl list-dependencies name.target" to see the contents and
    dependencies of a systemd target

-- get default target
sudo systemctl get-default

-- get all targets in default target
sudo systemctl list-dependencies

systemctl list-units -t target

******************************************************************************************
******************************************************************************************

Managing Targets
----------------

systemctl start name.target
systemctl isolate name.target
systemctl list-dependencies name.target
systemctl get-default
systemctl set-default name.target


COMMENTS
