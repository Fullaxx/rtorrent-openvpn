#!/bin/bash

bail()
{
  echo "$1"
  exit 1
}

OVPNSLEEPTIME=${OVPNSLEEPTIME:-5}

# https://www.cyberciti.biz/faq/bash-shell-check-for-any-mp3-files-in-directory/
#shopt -s nullglob
#OVPNCFG=`ls -1 /rtorrent/config/*.ovpn | head -n1`
#shopt -u nullglob

if [ x"${OVPNCFG}" != "x" ]; then
  if [ ! -r /rtorrent/config/${OVPNCFG} ]; then bail "/rtorrent/config/${OVPNCFG} not available!"; fi
  openvpn --config /rtorrent/config/${OVPNCFG} --daemon \
  --script-security 2 --up /app/up.sh --down /app/down.sh
  sleep ${OVPNSLEEPTIME}
fi
