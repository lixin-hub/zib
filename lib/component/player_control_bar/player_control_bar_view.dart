import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:window_manager/window_manager.dart';
import 'package:zib/component/player_control_bar/VideoProgressBar.dart';
import 'package:zib/pages/player_page/player_page_logic.dart';

import 'player_control_bar_logic.dart';

class PlayerControlBar extends StatefulWidget {
  const PlayerControlBar({super.key});

  @override
  State<PlayerControlBar> createState() => _PlayerControlBarState();
}

class _PlayerControlBarState extends State<PlayerControlBar> {
  final logic = Get.put(PlayerControlBarLogic());
  final PlayerPageLogic _controllerLogic = Get.find<PlayerPageLogic>();
  late final VideoPlayerController _controller;
  late bool isFullscreen;
  double speed = 1;

  playRateAdjust() {
    if (_controller.value.buffered.isEmpty) {
      return;
    }
    final int bufferedEnd = _controller.value.buffered[0].end.inMilliseconds;
    final int position = _controller.value.position.inMilliseconds;
    // print("diff: ${bufferedEnd - position}");
    if (bufferedEnd - position < 1000) {
      if (speed != 1) {
        speed = 1;
        _controller.setPlaybackSpeed(speed);
      }
    } else if (bufferedEnd - position < 10000) {
      if (speed != 1.5) {
        speed = 1.5;
        _controller.setPlaybackSpeed(speed);
      }
    } else {
      // if (speed != 5) {
      //   speed = 5;
      //   _controller.setPlaybackSpeed(speed);
      // }
    }
    // logger.i("bufferd:${bufferedEnd} position:${position}");
  }

  @override
  void initState() {
    super.initState();
    isFullscreen = Get.currentRoute.endsWith('/full_screen_player');
    _controller = _controllerLogic.controller;
    _controller.addListener(playRateAdjust);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.withOpacity(0.3),
      child: Obx(() {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 50),
          // padding: EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              //controller h=35
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 35,
                  alignment: Alignment.center,
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
                          MyIconButton(Icons.refresh, onPressed: () {
                            // final int bufferedEnd =
                            //     _controller.value.buffered[0].end.inMilliseconds;
                            // final int position = _controller.value.duration.inMilliseconds;
                            // if (bufferedEnd - position > 1000) {
                            //   logger.i("pos: $position buffer: $bufferedEnd diff: ${bufferedEnd - position}");
                            //   logger.i("${Duration(milliseconds: position + 500).inMilliseconds}");
                            //   _controller.seekTo(Duration(milliseconds: position+1000));
                            // }
                            // startPlaySpeed();
                          })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const MyIconButton(Icons.format_color_text_outlined),
                          const MyIconButton(Icons.volume_up_outlined),
                          MyIconButton(
                              !isFullscreen ? Icons.fullscreen_rounded : Icons.fullscreen_exit,
                              onPressed: () {
                            if (isFullscreen) {
                              Get.back();
                              windowManager.setFullScreen(false);
                            } else {
                              windowManager.setFullScreen(true);
                              Get.toNamed('/full_screen_player', arguments: _controller);
                            }
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              //进度条
              Align(
                alignment: Alignment.topCenter,
                child: VideoProgressBar(_controller,
                    padding: EdgeInsets.zero,
                    colors: const VideoProgressColors(playedColor: Colors.blue),
                    allowScrubbing: true),
              ),
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
