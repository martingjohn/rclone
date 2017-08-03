# rclone
rclone for Docker

You need to have your config file setup already for authorization - see martinjohn/rclone-auth

For mounting a directory (extra permissions needed for FUSE mount)

    docker run \
           -it \
           --rm \
           --cap-add SYS_ADMIN \
           --security-opt apparmor:unconfined \
           --device /dev/fuse \
           -v "<mount path>:/mnt" \
           -v "<config path>:/data" \
           martinjohn/rclone \
           mount remote:path/to/files /mnt

For Syncing

    docker run \
           -it \
           --rm \
           -v "/mnt/Onedrive:/mnt" \
           -v "/root/config:/root" \
           martinjohn/rclone \
           sync remote:path/to/files /mnt     
