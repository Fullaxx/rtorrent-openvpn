#!/bin/bash

RESTARTCOUNT=`grep 'Restart pause, 300 second(s)' /var/log/openvpn/openvpn.log | wc -l`
while [ "${RESTARTCOUNT}" -lt 3 ]; do
  sleep 1
  RESTARTCOUNT=`grep 'Restart pause, 300 second(s)' /var/log/openvpn/openvpn.log | wc -l`
done

if [ -n ${LOGFILE} ]; then
  TIMESTAMP=`date "+%y%m%d-%H%M%S"`
  echo "${TIMESTAMP}: RESTART MONITOR ACTIVATING KILLSWITCH" >> /rtorrent/session/${LOGFILE}
fi

/app/killswitch.sh
