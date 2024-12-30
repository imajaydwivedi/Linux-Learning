:<<'COMMENTS'

Configuring sudo

Use "visudo" to open the /etc/sudoers configuration file

Alternatively, add drop-in files to /etc/sudoers.d/ directory

    %wheel ALL=(ALL) ALL enabled sudo access for users that are members of the "wheel" group on Red Hat
    %sudo ALL=(ALL) ALL enabled sudo access for users that are members of the "sudo" group on Ubuntu

    %wheel ALL=(ALL) NOPASSWD: ALL enabled sudo access without password prompt for users that are members of the "wheel" group on Red Hat

    # allowed adwivedi user to run passwd command but not as root
    adwivedi ALL=/usr/bin/passwd, ! /usr/bin/passwd root, /usr/sbin/useradd, /usr/sbin/usermod

Add the following to cache valid sudo credentials for 4 hours:

    Defaults timestamp_type=global,timestamp_timeout=240

# tail -5 /etc/sudoers

Examples:

    # Allow saanvi user to impersonate adwivedi user without password
    saanvi ALL=(adwivedi) NOPASSWD:ALL

    # Allow adwivedi user to run all commands as postgres user without password
    adwivedi ALL=(postgres) NOPASSWD:ALL

    # no password should be prompted for below command
    sudo -i -u adwivedi

    # within adwivedi user context, run below command
        # no password prompt should appear
    sudo -u postgres psql

COMMENTS

