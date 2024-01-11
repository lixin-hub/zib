import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';

import '../main.dart';

class VideoInfo extends StatefulWidget {
  final VideoPlayerController controller;

  const VideoInfo(this.controller, {super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  late final VideoPlayerController _controller;

  updateInfo() {
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(updateInfo);
  }

  @override
  void dispose() {
    _controller.removeListener(updateInfo);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("during:${_controller.value.duration}"),
        Text("buffered:${_controller.value.buffered}"),
        Text("size:${_controller.value.size}"),
        Text("screen:${MediaQuery.of(context).size}"),
        Text("position:${_controller.value.position}"),
        Text("volume:${_controller.value.volume}"),
        Text("playbackSpeed:${_controller.value.playbackSpeed}"),
      ],
    ).backgroundColor(Colors.white.withOpacity(0.9));
  }
}
