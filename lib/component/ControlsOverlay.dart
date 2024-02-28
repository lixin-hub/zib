import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/player_control_bar/player_control_bar_view.dart';
import 'package:zib/pages/player_page/player_page_logic.dart';

class ControlsOverlay extends StatefulWidget {
  const ControlsOverlay({super.key});

  // static const List<double> _examplePlaybackRates = <double>[
  //   0.25,
  //   0.5,
  //   1.0,
  //   1.5,
  //   2.0,
  //   3.0,
  //   5.0,
  //   10.0,
  // ];

  @override
  State<ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<ControlsOverlay> {
  final PlayerPageLogic _controllerLogic = Get.find<PlayerPageLogic>();
  late final VideoPlayerController _controller;
  bool isHover = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _controller = _controllerLogic.controller;
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double bottom = 0;
    return Obx(() {
      if (!_controllerLogic.isPlaying.value) {
        bottom = 0;
      } else {
        //正在播放
        if (isHover) {
          bottom = 0;
        } else {
          bottom = -50;
        }
      }

      return LayoutBuilder(builder: (context, cons) {
        return Stack(
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 50),
              reverseDuration: const Duration(milliseconds: 200),
              child: _controllerLogic.isPlaying.value
                  ? const SizedBox.shrink()
                  : Container(
                      color: Colors.black26,
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 100.0,
                          semanticLabel: 'Play',
                        ),
                      ),
                    ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _controller.value.isPlaying ? _controller.pause() : _controller.play();
                });
              },
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Material(
            //     child: PopupMenuButton<Duration>(
            //       initialValue: _controller.value.captionOffset,
            //       tooltip: 'Caption Offset',
            //       onSelected: (Duration delay) {
            //         _controller.setCaptionOffset(delay);
            //       },
            //       itemBuilder: (BuildContext context) {
            //         return <PopupMenuItem<Duration>>[
            //           for (final Duration offsetDuration in ControlsOverlay._exampleCaptionOffsets)
            //             PopupMenuItem<Duration>(
            //               value: offsetDuration,
            //               child: Text('${offsetDuration.inMilliseconds}ms'),
            //             )
            //         ];
            //       },
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //           // Using less vertical padding as the text is also longer
            //           // horizontally, so it feels like it would need more spacing
            //           // horizontally (matching the aspect ratio of the video).
            //           vertical: 12,
            //           horizontal: 16,
            //         ),
            //         child: Text('${_controller.value.captionOffset.inMilliseconds}ms'),
            //       ),
            //     ),
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: Material(
            //     child: PopupMenuButton<double>(
            //       initialValue: _controller.value.playbackSpeed,
            //       tooltip: 'Playback speed',
            //       onSelected: (double speed) {
            //         _controller.setPlaybackSpeed(speed);
            //       },
            //       itemBuilder: (BuildContext context) {
            //         return <PopupMenuItem<double>>[
            //           for (final double speed in ControlsOverlay._examplePlaybackRates)
            //             PopupMenuItem<double>(
            //               value: speed,
            //               child: Text('${speed}x'),
            //             )
            //         ];
            //       },
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //           // Using less vertical padding as the text is also longer
            //           // horizontally, so it feels like it would need more spacing
            //           // horizontally (matching the aspect ratio of the video).
            //           vertical: 12,
            //           horizontal: 16,
            //         ),
            //         child: Text('${_controller.value.playbackSpeed}x'),
            //       ),
            //     ),
            //   ),
            // ),
            AnimatedPositioned(
                bottom: bottom,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                child: SizedBox(
                  height: 50,
                  width: cons.maxWidth,
                  child: const PlayerControlBar(),
                )),
            MouseRegion(
                opaque: false,
                onHover: (e) {
                  if (timer != null) {
                    timer?.cancel();
                  } else {
                    setState(() {
                      isHover = true;
                    });
                  }
                  timer = Timer(const Duration(milliseconds: 2000), () {
                    timer = null;
                    setState(() {
                      isHover = false;
                    });
                  });
                }),
          ],
        );
      });
    });
  }
}
