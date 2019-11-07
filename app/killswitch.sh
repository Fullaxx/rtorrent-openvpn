#!/bin/bash

if [ -n ${LOGFILE} ]; then
  TIMESTAMP=`date "+%y%m%d-%H%M%S"`
  echo "${TIMESTAMP}: KILLSWITCH ACTIVATED" >> /rtorrent/session/${LOGFILE}
fi

# ps a | grep -v grep | grep rtorrent | awk '{print $1}' | xargs kill
pkill rtorrent
