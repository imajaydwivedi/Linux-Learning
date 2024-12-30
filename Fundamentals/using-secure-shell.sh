:<<'COMMENTS'

ssh - Secure Shell
  provides remote shell access

It is a protocol that provides remote access using the Secure Shell server (sshd) and the Secure Shell client (ssh).

It replaces telnet, which are used to establish remote connections without encryption.

The sshd service may need to be installed and enabled

    sudo apt install openssh-server
    sudo dnf install openssh-server; sudo systemctl enable --now sshd

Next, an ssh client can be used to access the ssh server
    On linux and MacOS, a native command line ssh client is available
    On Windows, use Mobaxterm, Putty, or the Windows Subsystem for Linux (WSL)

"scp" is a convenient tool that allows you to copy files from local computer to the remote computer

    scp /etc/hosts msi:/tmp
    On Windows, use WinSCP

COMMENTS

