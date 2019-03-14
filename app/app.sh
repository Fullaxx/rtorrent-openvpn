#!/bin/bash

bail()
{
  echo "$1"
  exit 1
}

/app/openvpn.sh || bail "openvpn startup failed!"

if [ -r /rtorrent/config/rtorrent.rc ]; then
  cp /rtorrent/config/rtorrent.rc /root/.rtorrent.rc
else
  cp /usr/share/rtorrent/rtorrent.rc /root/.rtorrent.rc
fi

# exec rtorrent -n -o import=/rtorrent/config/rtorrent.rc
exec rtorrent
