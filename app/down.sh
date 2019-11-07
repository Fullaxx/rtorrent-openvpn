#!/bin/bash

if [ -n ${LOGFILE} ]; then
  TIMESTAMP=`date "+%y%m%d-%H%M%S"`
  echo "${TIMESTAMP}: OPENVPN GOING DOWN - ACTIVATING KILLSWITCH" >> /rtorrent/session/${LOGFILE}
fi

/app/killswitch.sh
