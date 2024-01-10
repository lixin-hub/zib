import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatelessWidget {
  VideoPlayerController _controller;

  VideoInfo(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("during:${_controller.value.duration}"),
        Text("buffered:${_controller.value.buffered}"),
        Text("size:${_controller.value.size}"),
        Text("position:${_controller.value.position}"),
        Text("volume:${_controller.value.volume}"),
        Text("playbackSpeed:${_controller.value.playbackSpeed}"),
      ],
    ).backgroundColor(Colors.white.withOpacity(0.9));
  }
}
