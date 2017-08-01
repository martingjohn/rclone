FROM alpine:latest

# global environment settings
ENV RCLONE_VERSION="latest"
ENV PLATFORM_ARCH="amd64"

# Install dependancies and remove cache (fuse for mount - will that work?)
RUN apk update && apk add \
        curl \
        fuse \
        unzip \
     && rm -rf /var/cache/apk/*

# Get latest release of rclone, unpack, and install
WORKDIR /tmp/rclone
RUN curl -O https://beta.rclone.org/rclone-beta-${RCLONE_VERSION}-linux-${PLATFORM_ARCH}.zip \
    && unzip rclone-beta-${RCLONE_VERSION}-linux-${PLATFORM_ARCH}.zip \
    && cd rclone-*-linux-${PLATFORM_ARCH} \
    && cp rclone /usr/bin/ \
    && chown root:root /usr/bin/rclone \
    && chmod 755 /usr/bin/rclone \
    && rm -rf /tmp/rclone
ENTRYPOINT ["rclone"]
