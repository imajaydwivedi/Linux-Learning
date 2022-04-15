# Copying files using rsync from remote server to local machine
    # https://stackoverflow.com/a/9090859
    # https://linuxhint.com/copy-files-between-directories-linux/
rsync -chavzP --stats user@remote.host:/path/to/copy /path/to/local/storage


# Copying Directories with cp Command
    # https://linuxize.com/post/cp-command-in-linux/
cp -R Pictures Pictures_backup
cp -RT Pictures Pictures_backup


# Copy in Multi-Threaded mode
    # https://stackoverflow.com/a/62460707
rclone copy "${source}/${subfolder}/" "${target}/${subfolder}/" --progress --multi-thread-streams=N
ls /srv/mail | xargs -n1 -P4 -I% rsync -Pa % myserver.com:/srv/mail/


