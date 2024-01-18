import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:window_manager/window_manager.dart';

import '../component/media_player_kit/media_player_kit_view.dart';

class FullScreenPlayer extends StatefulWidget {
  const FullScreenPlayer({super.key});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
        focusNode: focusNode,
        autofocus: true,
        onKey: (RawKeyEvent event) {
          // 判断是否按下Esc键
          if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.escape) {
            windowManager.setFullScreen(false);
          }
        },
        child: Container(color: Colors.white, child: MediaKitPlayer()));
  }
}
