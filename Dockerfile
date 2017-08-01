FROM alpine:latest
# Install dependancies and remove cache
RUN apk update && apk add \
        curl \
        unzip \
     && rm -rf /var/cache/apk/*
WORKDIR /tmp/rclone
# Get latest release of rclone, unpack, and install
RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip \
    && unzip rclone-current-linux-amd64.zip \
    && cd rclone-*-linux-amd64 \
    && cp rclone /usr/bin/ \
    && chown root:root /usr/bin/rclone \
    && chmod 755 /usr/bin/rclone \
    && mkdir -p /usr/local/share/man/man1 \
    && cp rclone.1 /usr/local/share/man/man1/ \
    && mandb \
    && rm -rf /tmp/rclone
ENTRYPOINT ["rclone"]
