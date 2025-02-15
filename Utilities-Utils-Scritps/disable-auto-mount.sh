# Disable auto mount on Ubuntu
    # https://www.baeldung.com/linux/ubuntu-disable-automated-mounting
    # https://unix.stackexchange.com/a/729656

# Install dconf-editor
sudo apt-get install dconf-editor
sudo dnf install dconf-editor

# Launch dconf-editor
dconf-editor

# On dconf-editor GUI, Disable automount on ubuntu/fedora by navingating to "org.gnome.desktop.media-handling" and unchecking "automount" option
automount false
audotmount-open false

# Commandline way
gsettings set org.gnome.desktop.media-handling automount false
gsettings set org.gnome.desktop.media-handling automount-open false
