
RTMP_URL="rtmp://1.17879192.fme.ustream.tv/ustreamVideo/17879192"
KEY="DheVY6uMpVTjaWusDcHuRMfYtYj7gv3f"

date +"%D %T Starting avconf"

#this previously required injection of timestamp
#avconv -f mjpeg -i "http://localhost:8081/" -r 1 -filter setpts='(N/25.0)*25000000' -f flv "${RTMP_URL}/${KEY}" 
#avconv -f mjpeg -r 1 -i "http://localhost:8081/" -r 1 -filter setpts='(N/25.0)*25000000' -f flv "${RTMP_URL}/${KEY}" 

#This one works at 1frame/second
avconv -f mjpeg -r 1 -i "http://localhost:8081/" -f flv "${RTMP_URL}/${KEY}" 

# Capure logs for debuging
#avconv -f mjpeg -r 1 -i "http://localhost:8081/" -f flv "${RTMP_URL}/${KEY}" >> /home/motion/nest/log/neststream.log

#avconv -f mjpeg - r 5 -i "http://localhost:8081/" -filter setpts='N/(5.0*TB)' -f flv "${RTMP_URL}/${KEY}" >> /home/motion/nest/log/neststream.log
#avconv -f mjpeg -i "http://localhost:8081/" -f flv "${RTMP_URL}/${KEY}" >> /home/motion/nest/log/neststream.log


