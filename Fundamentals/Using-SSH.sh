:<<'COMMENTS'

Using the SSH Client
--------------------

-> When first logging in to an SSH server, the server host key
    is cached in the file ~/.ssh/known_hosts

-> While connecting to a host, the key is checked, and if it doesn't match connection is refused

-> To connect to a non default port, use "-p (ssh)" or "-P (scp)"


Configuring Key-based SSH Login
-------------------------------------

-> By default, SSH access is based on username and password

-> For enhanced security, consider using key-based access

-> The user creates a key pair. Next, public key is copied over to the SSH host
    where it is stored in ~/.ssh/authorized_keys

-> For additional protection, the key may be protected with a passphrase
    -> ssh-keygen
    -> ssh-copy-id sshserver

-> To add protection to SSH keys, they should be protected with a passphrase

-> Entering a passphrase on initialization of every session is annoying

-> Use "ssh-agent /bin/bash" to run the SSH agent, which can cache the passphrase for the session duration
ssh-agent /bin/bash
ssh-add

-> Use "ssh-add" to add the current shell to the agent: you'll enter
    the passphrase once



COMMENTS

# ssh saanvi@msi



