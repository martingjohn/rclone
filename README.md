# rclone
rclone for Docker

You need to have your config file setup already for authorization - see martinjohn/rclone-auth

For mounting a directory (extra permissions needed for FUSE)

    docker run \
           -it \
           --rm \
           --cap-add SYS_ADMIN \
           --device /dev/fuse \
           -v "/mnt/Onedrive:/mnt" \
           -v "/root/config:/root" \
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
