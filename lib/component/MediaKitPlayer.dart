import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/player_control_bar/player_control_bar_view.dart';

import 'ControlsOverlay.dart';
import 'VideoInfo.dart';

class MediaKitPlayer extends StatefulWidget {
  //播放控制器
  final VideoPlayerController controller;

  const MediaKitPlayer({
    super.key,
    required this.controller,
  });

  @override
  State<MediaKitPlayer> createState() => _MediaKitPlayerState();
}

class _MediaKitPlayerState extends State<MediaKitPlayer> {
  late VideoPlayerController _controller;
  bool showInfo = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          children: <Widget>[
            //主播放器
            Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                  height: _controller.value.isInitialized ? _controller.value.size.height : 400,
                  curve: Curves.ease,
                  duration: const Duration(seconds: 1),
                  child: VideoPlayer(_controller)),
            ),
            //覆盖层
            ControlsOverlay(controller: _controller),
            //进度条
            VideoProgressIndicator(_controller, allowScrubbing: true)
                .alignment(Alignment.bottomCenter),
            //控制栏
            PlayerControlBar(_controller).alignment(Alignment.bottomCenter),
            //控制器信息
            if (showInfo) VideoInfo(_controller),
          ],
        ),
      ),
    );
  }
}
