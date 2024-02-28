ffmpeg -re -stream_loop -1 -i ~/视频/美丽的神话.mp4 \
-c copy -f flv rtmp://localhost:1985/myapp/1760221328952004609?s=e85482b1bcc64599b1c75c4556c691df
#-c copy -f flv rtmp://193.112.200.88:1985/myapp/test?username=10
#直播地址：rtmp://localhost:1985/myapp?s=1760221328952004609
