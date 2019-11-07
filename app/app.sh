#!/bin/bash

bail()
{
  echo "$1"
  exit 1
}

# https://www.cyberciti.biz/faq/bash-shell-check-for-any-mp3-files-in-directory/
#shopt -s nullglob
#OVPNCFG=`ls -1 /rtorrent/config/*.ovpn | head -n1`
#shopt -u nullglob

if [ x"${OVPNCFG}" != "x" ]; then
  /app/openvpn.sh || bail "openvpn startup failed!"
  /app/monitor.sh &
fi

if [ -r /rtorrent/config/rtorrent.rc ]; then
  cp /rtorrent/config/rtorrent.rc /root/.rtorrent.rc
else
  cp /usr/share/rtorrent/rtorrent.rc /root/.rtorrent.rc
fi

# exec rtorrent -n -o import=/rtorrent/config/rtorrent.rc
exec rtorrent
