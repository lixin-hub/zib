import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/danmaku/danmaku_view.dart';
import 'package:zib/pages/player_page/player_page_logic.dart';

import '../ControlsOverlay.dart';
import '../VideoInfo.dart';

class MediaKitPlayer extends StatelessWidget {
  final PlayerPageLogic logic = Get.put(PlayerPageLogic());
  late final VideoPlayerController controller;

  MediaKitPlayer({super.key}) {
    controller = logic.controller;
  }

  final bool showInfo = false;
  late final playerValue = const VideoPlayerValue(duration: Duration(milliseconds: 0)).obs;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
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
                    duration: const Duration(milliseconds: 1000),
                    child: VideoPlayer(controller)),
              ),
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: DanmakuWall()),
//覆盖层
              const ControlsOverlay(),
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
