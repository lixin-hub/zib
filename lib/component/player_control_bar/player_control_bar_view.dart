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
      // padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      color: Colors.blueGrey.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _controller.value.isPlaying
                  ? MyIconButton(Icons.pause, onPressed: () {
                      setState(() {
                        _controller.pause();
                      });
                    })
                  : MyIconButton(Icons.play_arrow, onPressed: () {
                      setState(() {
                        _controller.play();
                      });
                    }),
              const MyIconButton(Icons.refresh)
            ],
          ).expanded(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyIconButton(Icons.format_color_text_outlined),
              MyIconButton(Icons.volume_up_outlined),
              MyIconButton(Icons.fullscreen_rounded),
            ],
          ).expanded()
        ],
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  final IconData iconData;
  final String? tooltip;
  final VoidCallback? onPressed;

  const MyIconButton(this.iconData, {super.key, this.tooltip, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        iconData,
        color: Colors.white,
        size: 30,
      ),
      // hoverColor: Colors.blueGrey,
      // highlightColor: Colors.blue,
      tooltip: tooltip,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), side: BorderSide.none))),
      onPressed: onPressed,
    );
  }
}
