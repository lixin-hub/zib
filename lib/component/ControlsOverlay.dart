import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/media_player_kit/media_player_kit_logic.dart';
import 'package:zib/main.dart';

class ControlsOverlay extends StatefulWidget {
  const ControlsOverlay(this.controllerLogic, {super.key});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final MediaPlayerKitLogic controllerLogic;

  @override
  State<ControlsOverlay> createState() => _ControlsOverlayState();
}

class _ControlsOverlayState extends State<ControlsOverlay> {
  late final MediaPlayerKitLogic _controllerLogic;
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controllerLogic = widget.controllerLogic;
    _controller = _controllerLogic.controller;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
          Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: PopupMenuButton<Duration>(
                initialValue: _controller.value.captionOffset,
                tooltip: 'Caption Offset',
                onSelected: (Duration delay) {
                  _controller.setCaptionOffset(delay);
                },
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<Duration>>[
                    for (final Duration offsetDuration in ControlsOverlay._exampleCaptionOffsets)
                      PopupMenuItem<Duration>(
                        value: offsetDuration,
                        child: Text('${offsetDuration.inMilliseconds}ms'),
                      )
                  ];
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    // Using less vertical padding as the text is also longer
                    // horizontally, so it feels like it would need more spacing
                    // horizontally (matching the aspect ratio of the video).
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Text('${_controller.value.captionOffset.inMilliseconds}ms'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Material(
              child: PopupMenuButton<double>(
                initialValue: _controller.value.playbackSpeed,
                tooltip: 'Playback speed',
                onSelected: (double speed) {
                  _controller.setPlaybackSpeed(speed);
                },
                itemBuilder: (BuildContext context) {
                  return <PopupMenuItem<double>>[
                    for (final double speed in ControlsOverlay._examplePlaybackRates)
                      PopupMenuItem<double>(
                        value: speed,
                        child: Text('${speed}x'),
                      )
                  ];
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    // Using less vertical padding as the text is also longer
                    // horizontally, so it feels like it would need more spacing
                    // horizontally (matching the aspect ratio of the video).
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Text('${_controller.value.playbackSpeed}x'),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
