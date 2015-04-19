#!/bin/bash
#  cyclelogs.sh
#  Run this just before midnight
#  By Brett Fitzpatrick

TODAY=`date +"%Y%m%d"`
LOGFILE="/home/motion/nest/log/neststream"
mv $LOGFILE.log $LOGFILE$TODAY.log

LOGFILE="/home/motion/nest/log/dropbox"
mv $LOGFILE.log $LOGFILE$TODAY.log

find /home/motion/nest/log/*.log -mtime +5 -exec rm {} \;

