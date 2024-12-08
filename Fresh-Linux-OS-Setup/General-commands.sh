# Get current Desktop theme
echo $XDG_CURRENT_DESKTOP

# Get default desktop manager
cat /etc/X11/default-display-manager

# Load average
htop
top
uptime
cockpit
cat /proc/loadavg

# Get cpu counts
lproc
cat /proc/cpuinfo
hostnamectl


# How to shorten command line (bash) prompt
    # https://askubuntu.com/a/145626/1015062
if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi

