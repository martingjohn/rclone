# rclone
rclone for Docker

You need to have your config file setup already for authorization - see martinjohn/rclone-auth

For Syncing

    docker run \
           -it \
           --rm \
           -v "/mnt/Onedrive:/mnt" \
           -v "/root/config:/root" \
           martinjohn/rclone \
           sync remote:path/to/files /mnt     
