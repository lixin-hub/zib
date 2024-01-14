import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/media_player_kit/media_player_kit_logic.dart';
import 'package:zib/component/player_control_bar/player_control_bar_view.dart';

import '../ControlsOverlay.dart';
import '../VideoInfo.dart';

class MediaKitPlayer extends StatelessWidget {
  final MediaPlayerKitLogic logic = Get.put(MediaPlayerKitLogic());
  late final VideoPlayerController controller;

  MediaKitPlayer({super.key}) {
    controller = logic.controller;
  }

  bool showInfo = false;
  late var playerValue = const VideoPlayerValue(duration: Duration(milliseconds: 0)).obs;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: Hero(
          tag: "player",
          child: Stack(
            children: <Widget>[
//主播放器
              Align(
                alignment: Alignment.center,
                child: AnimatedContainer(
// height: _controller.value.isInitialized ? _controller.value.size.height : 400,
                    width: size.width,
                    height: size.height,
                    curve: Curves.ease,
                    duration: const Duration(seconds: 1),
                    child: VideoPlayer(controller)),
              ),
//覆盖层
              ControlsOverlay(logic),
//控制栏
//控制器信息
              if (showInfo) VideoInfo(controller).marginSymmetric(vertical: 40, horizontal: 20),
            ],
          ),
        ),
      ),
    );
  }
}
