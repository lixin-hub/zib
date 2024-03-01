 # 定义FFmpeg命令的变量
 commands=(
   "rtmp://localhost:1985/myapp/1760221328952004609?s=e85482b1bcc64599b1c75c4556c691df"
   "rtmp://localhost:1985/myapp/1763474920488062978?s=1e905cd20acf4ca7b3db5361b61b2af0"
   "rtmp://localhost:1985/myapp/1763486619689570305?s=bb7a329369c243d48e5d86500a4ff5db"
   "rtmp://localhost:1985/myapp/1763500139814604801?s=88da02b6b48c4953aa118f8d51253507"
   "rtmp://localhost:1985/myapp/1763500613464772610?s=19e601c3dfce473cb37355dcf86d145a"
   "rtmp://localhost:1985/myapp/1763500700362362881?s=870e7e1b210f4b97a3deb6fd3da221b0"
 )

 # 循环执行每个命令
 for cmd in "${commands[@]}"; do
   echo "执行命令: $cmd"
   ffmpeg -re -stream_loop -1 -i /home/lx/视频/美丽的神话.mp4 -c copy -f flv $cmd &
   echo "FFmpeg进程已在后台启动。"
 done

 echo "所有FFmpeg任务已启动。"