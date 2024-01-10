import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';

import 'player_control_bar_logic.dart';

class PlayerControlBar extends StatefulWidget {
  VideoPlayerController controller;

  PlayerControlBar(this.controller, {super.key});

  @override
  State<PlayerControlBar> createState() => _PlayerControlBarState();
}

class _PlayerControlBarState extends State<PlayerControlBar> {
  final logic = Get.put(PlayerControlBarLogic());
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.blueGrey.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _controller.value.isPlaying
                  ? createIconButton(Icons.pause, onPressed: () {
                      _controller.pause();
                    })
                  : createIconButton(Icons.play_arrow, onPressed: () {
                      _controller.play();
                    }),
              createIconButton(Icons.refresh)
            ],
          ).expanded(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              createIconButton(Icons.format_color_text_outlined),
              createIconButton(Icons.volume_up_outlined),
              createIconButton(Icons.fullscreen_rounded),
            ],
          ).expanded()
        ],
      ),
    );
  }
}

createIconButton(IconData iconData, {String? tooltip, onPressed}) {
  return IconButton(
    icon: Icon(
      iconData,
      color: Colors.white,
      size: 30,
    ),
    // hoverColor: Colors.blueGrey,
    // highlightColor: Colors.blue,
    tooltip: tooltip,
    style: buttonStyle(),
    onPressed: onPressed,
  );
}

buttonStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), side: BorderSide.none)));
}
