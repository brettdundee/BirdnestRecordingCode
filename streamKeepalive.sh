#!/bin/bash
#
#

PROC=""
if [ -e /var/lock/stream2ustream.sh ]; then
  PROC=`ps -ef | grep avconv | grep -v grep` 
#  echo $PROC
  if [ "$PROC" = "" ]; then
    TODAY=`date`
    echo "$TODAY: streamKeepalive.sh : Restarting Streaming"
    /etc/init.d/neststream start
  fi
fi

