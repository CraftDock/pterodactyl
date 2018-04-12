FROM craftdock/alpine-nodejs:lts

LABEL maintainer="Hexosse <hexosse@gmail.com>" \
      description="The server control and management daemon built specifically for Pterodactyl Panel"

# Pterodactyl Daemon version :https://github.com/Pterodactyl/Daemon/releases
ENV DAEMON_VERSION 0.5.5

# Define working directory
WORKDIR /srv/daemon

# Install Pterodactyl Daemon : https://daemon.pterodactyl.io/docs/install-daemon
RUN \
    # Print executed commands
    set -x \
    # Update repository indexes
    && apk-update \
    # Add temporary packages
    && apk-install --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --virtual .build-dependencies \
        tar \
        unzip \
        make \
        gcc \
        g++ \
        python \
    # Add packages
    && apk-install --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        curl \
        coreutils  \
        openssl \
        gnupg  \
    # Download Pterodactyl Daemon
    && curl -Lo "${DAEMON_VERSION}.tar.gz" "https://github.com/Pterodactyl/Daemon/releases/download/v${DAEMON_VERSION}/daemon.tar.gz" \
    && tar --strip-components=1 -xzvf ${DAEMON_VERSION}.tar.gz \
    && rm "${DAEMON_VERSION}.tar.gz" \
    # Install Pterodactyl Daemon
    && npm install --only=production \
    # default timezone
    && set-timezone UTC \
    # Clear apk's cache
    && apk-remove .build-dependencies \
    && apk-cleanup \
    # Extra cleaning
    && find /srv/daemon -name ".gitkeep" -type f -delete \
    && find /srv/daemon -name ".githold" -type f -delete \
    && find /srv/daemon -name ".gitignore" -type f -delete \
    # Remove default nodejs service
    && rm -rf /etc/service.d/nodejs


# Add volume to allow persistence
VOLUME ["/daemon", "/srv/daemon-data"]

# Copy scripts
COPY /rootfs /

# Expose the port used by the daemon
EXPOSE 8080
