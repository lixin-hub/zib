ffmpeg -re -stream_loop -1 -i ~/视频/美丽的神话.mp4 \
-c copy -f flv rtmp://localhost:1985/myapp/test?username=
#-c copy -f flv rtmp://193.112.200.88:1985/myapp/test?username=10
