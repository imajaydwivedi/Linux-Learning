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


# How to shorten command line prompt (bash prompt) & change colors
    # https://askubuntu.com/a/145626/1015062
if [ "$color_prompt" = yes ]; then
    # username@host:Directory || colored prompt
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
    # username@host:Directory || colored & new line prompt
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\n\$ '
    # username@host:Directory || colored new line prompt
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\n\[\033[1;30m\]\$\[\033[00m\] '
    # [yyyy-MMM-dd HHmm] username@host:Directory || colored new line prompt
    PS1='---- [\[\033[32m\]$(date +"%Y-%b-%d %H:%M:%S")\[\033[00m\]] \[\033[33m\]\u@\h\[\033[00m\]:\[\033[34m\]\W\[\033[00m\]\n|---------- \[\033[33m\]\$\[\033[00m\] '
    #PS1='\[\033[40m\]---- [\033[32m\]$(date +"%Y-%b-%d %H:%M:%S")\[\033[00m\]] \[\033[33m\]\u@\h\[\033[00m\]:\[\033[34m\]\W\[\033[00m\]\n|---------- \[\033[33m\]\$\[\033[0m\]'
else
    # username@host:Directory
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
    # username@host:Directory || new line prompt
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\n\[\033[1;30m\]\$\[\033[00m\] '
    # [yyyy-MMM-dd HHmm] username@host:Directory || new line prompt
    PS1='---- [\[\033[32m\]$(date +"%Y-%b-%d %H:%M:%S")\[\033[00m\]] \[\033[33m\]\u@\h\[\033[00m\]:\[\033[34m\]\W\[\033[00m\]\n|---------- \[\033[33m\]\$\[\033[00m\] '
    #PS1='\[\033[40m\]---- [\033[32m\]$(date +"%Y-%b-%d %H:%M:%S")\[\033[00m\]] \[\033[33m\]\u@\h\[\033[00m\]:\[\033[34m\]\W\[\033[00m\]\n|---------- \[\033[33m\]\$\[\033[0m\]'
fi

<# *************************************************************************** #>
I want Prompt in following format ->

---- [2024-Dec-08 19:08:19] saanvi@ryzen9:Linux-Learning
|---------- $ 


following is color coding to follow -
- timestamp should be in green
- username@host should be in yellow
- directory should be in blue
- $ should be in Yellow

<# *************************************************************************** #>