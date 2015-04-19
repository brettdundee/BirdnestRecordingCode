#!/bin/bash

if [ -e /var/lock/Move2Dropbox.sh ]; then
    TODAY=`date`
    echo "$TODAY: Move2Dropbox.sh : Already running. If not then rm /var/lock/Move2Dropbox.sh"
    exit
fi

touch /var/lock/Move2Dropbox.sh
DIR_DROP="/home/motion/nest"
DIR_TO_SEND="/home/motion/capture"

DROPBOXFOLDER="NestBox1"
FILES=`ls -tr $DIR_TO_SEND/*.avi | tail -n +1`
today=`date +"%Y%m%d"` 
time=`date +"%HH%MM%SS"` 
DEST="$DROPBOXFOLDER/$today"

$DIR_DROP/Dropbox-Uploader/dropbox_uploader.sh mkdir $DEST

for f in $FILES
do

  lsof "$f" | grep -q COMMAND &>/dev/null
  if [ $? -ne 0 ]
  then
    time=`date +"%HH%MM%SS"` 
    echo "$today $time : Uploading $f to dropbox ..."
    # take action on each file. $f store current file name
    fname="${f##*/}"
    FILE_NOT_GONE=1
    while [ $FILE_NOT_GONE -ne 0 ]
    do
      $DIR_DROP/Dropbox-Uploader/dropbox_uploader.sh upload $f $DEST/$fname
      FILE_NOT_GONE=$?
      if [ $FILE_NOT_GONE -ne 0 ]
      then
        sleep 20
      fi
    done
    rm $f

  else
      echo "Warning: file $f is open by other process. Ignoring it"
  fi
done

rm -f /var/lock/Move2Dropbox.sh
