# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:bionic
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C

# ------------------------------------------------------------------------------
# Install applications and clean up
RUN apt-get update && apt-get install -y --no-install-recommends \
rtorrent openvpn screen tmux locales && \
sed -e 's/# en_US.UTF-8/en_US.UTF-8/' -i /etc/locale.gen && locale-gen && \
apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Prepare rtorrent directories
RUN mkdir -p \
/rtorrent/torrents \
/rtorrent/session \
/rtorrent/complete

# ------------------------------------------------------------------------------
# Install startup scripts
COPY app/*.sh /app/

# ------------------------------------------------------------------------------
# Configure rtorrent
COPY rtorrent.rc /usr/share/rtorrent/rtorrent.rc

# ------------------------------------------------------------------------------
# Identify Volumes
VOLUME /rtorrent/torrents
VOLUME /rtorrent/session

# ------------------------------------------------------------------------------
# Define default command
CMD ["/app/app.sh"]
