import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/media_player_kit/media_player_kit_logic.dart';
import 'package:zib/main.dart';

import 'player_control_bar_logic.dart';

class PlayerControlBar extends StatefulWidget {
  final MediaPlayerKitLogic controllerLogic;

  const PlayerControlBar(this.controllerLogic, {super.key});

  @override
  State<PlayerControlBar> createState() => _PlayerControlBarState();
}

class _PlayerControlBarState extends State<PlayerControlBar> {
  final logic = Get.put(PlayerControlBarLogic());
  late  MediaPlayerKitLogic _controllerLogic;
  late final VideoPlayerController _controller;
  late bool isFullscreen;

  @override
  void initState() {
    super.initState();
    _controllerLogic = Get.put(MediaPlayerKitLogic());
    _controller = _controllerLogic.controller;
    isFullscreen = Get.currentRoute.endsWith('/full_screen_player');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(() {
        return Container(
          // padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          color: Colors.blueGrey.withOpacity(0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _controllerLogic.isPlaying.value
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyIconButton(Icons.format_color_text_outlined),
                  MyIconButton(Icons.volume_up_outlined),
                  MyIconButton(!isFullscreen ? Icons.fullscreen_rounded : Icons.fullscreen_exit,
                      onPressed: () {
                    logger.i(Get.currentRoute);
                    if (isFullscreen) {
                      Get.back();
                    } else {
                      Get.toNamed('/full_screen_player', arguments: _controller);
                    }
                  }),
                ],
              ).expanded()
            ],
          ),
        );
      }),
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
