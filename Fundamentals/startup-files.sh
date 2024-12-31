:<<'COMMENTS'

Understanding Bash Startup Files
--------------------------------

/etc/environment contains a list of variables and is the first file
  that is processed while starting bash (empty by default)

/etc/profile is executed while users login
  > /etc/profile.d is used as a snapin directory that contains additional configuration
  > ~/.bash_profile can be used as a user-specific version
  > ~/.bash_logout is processed when a user logs out

/etc/bashrc is processed every time a subshell is started
  > A user-specific ~/.bashrc file may be used

# Modify HISTSIZE & HISTFILESIZE
sudo vim /etc/profile.d/history.sh

HISTSIZE=2500
HISTFILESIZE=10000

COMMENTS

