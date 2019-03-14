#!/bin/bash

OVPNSLEEPTIME=${OVPNSLEEPTIME:-5}

# https://www.cyberciti.biz/faq/bash-shell-check-for-any-mp3-files-in-directory/
#shopt -s nullglob
#OVPNCFG=`ls -1 /rtorrent/config/*.ovpn | head -n1`
#shopt -u nullglob

if [ x"${OVPNCFG}" != "x" ]; then
  openvpn --config /rtorrent/config/${OVPNCFG} --daemon \
  --script-security 2 --up /app/up.sh --down /app/down.sh || exit 1
  sleep ${OVPNSLEEPTIME}
fi
