 # 定义FFmpeg命令的变量
 commands=(
   "rtmp://localhost:1985/myapp/1760221328952004609?s=e85482b1bcc64599b1c75c4556c691df"
#    "rtmp://localhost:1985/myapp/1763474920488062978?s=1e905cd20acf4ca7b3db5361b61b2af0"
#    "rtmp://localhost:1985/myapp/1763486619689570305?s=bb7a329369c243d48e5d86500a4ff5db"
#    "rtmp://localhost:1985/myapp/1763500139814604801?s=88da02b6b48c4953aa118f8d51253507"
#    "rtmp://localhost:1985/myapp/1763500613464772610?s=19e601c3dfce473cb37355dcf86d145a"
#    "rtmp://localhost:1985/myapp/1763500700362362881?s=870e7e1b210f4b97a3deb6fd3da221b0"
  )

 # 存储FFmpeg进程的PID
 pids=()

 # 函数：重新运行FFmpeg任务
 restart_ffmpeg() {
   echo "重新启动所有FFmpeg任务..."
   kill_all_ffmpeg
   for cmd in "${commands[@]}"; do
     ffmpeg -re -stream_loop -1 -i /home/lx/视频/美丽的神话.mp4 -c copy -f flv "$cmd" &
     pids+=($!)
   done
 }

 # 函数：关闭所有FFmpeg任务
 kill_all_ffmpeg() {
   echo "关闭所有FFmpeg任务..."
   for pid in "${pids[@]}"; do
     if kill -0 "$pid" 2>/dev/null; then
       kill "$pid"
     fi
   done
   pids=()
 }

 # 主循环
 while true; do
   read -p "请输入命令 (r: 重新运行, c: 关闭, q: 退出): " cmd
   case "$cmd" in
     r)
       restart_ffmpeg
       ;;
     c)
       kill_all_ffmpeg
       ;;
     q)
       echo "退出脚本。"
       break
       ;;
     *)
       echo "无效的命令。"
       ;;
   esac
 done

 echo "脚本已退出。"