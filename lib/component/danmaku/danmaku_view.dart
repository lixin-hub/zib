import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_barrage/flutter_barrage.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/main.dart';
import 'package:zib/pages/player_page/player_page_logic.dart';

//弹幕
class DanmakuWall extends StatefulWidget {
  DanmakuWall({super.key}) {}

  @override
  State<DanmakuWall> createState() => _DanmakuWallState();
}

class _DanmakuWallState extends State<DanmakuWall> {
  Random random = Random();
  late List<Bullet> bullets;
  late ValueNotifier<BarrageValue> timelineNotifier;
  late VideoPlayerController videoPlayerController;
  late BarrageWallController barrageWallController;

  func() {
    timelineNotifier.value = timelineNotifier.value.copyWith(
        timeline: videoPlayerController.value.position.inMilliseconds,
        isPlaying: videoPlayerController.value.isPlaying);
  }

  @override
  void initState() {
    super.initState();
    bullets = List<Bullet>.generate(60 * 20, (i) {
      final showTime = random.nextInt(60 * 60 * 1000);
      return Bullet(
        showTime: showTime,
        child: Text(
          '$i-$showTime',
          style: const TextStyle(color: Colors.pink),
        ),
        // child: IgnorePointer(child: Text('$i-$showTime')),
      );
    });
    logger.i('init');
    var player = Get.find<PlayerPageLogic>();
    timelineNotifier = ValueNotifier(BarrageValue());
    videoPlayerController = player.controller;
    videoPlayerController.addListener(func);
    barrageWallController = BarrageWallController(timelineNotifier: timelineNotifier);
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.removeListener(func);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // debugPrint('overlay: ${constraints.maxWidth} ${constraints.maxHeight}');
      return BarrageWall(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        debug: false,
        // do not send bullets to the safe area
        safeBottomHeight: 60,
        // speed: 8,
        // massiveMode: false,
        // speedCorrectionInMilliseconds: 1000,
        controller: barrageWallController,
        // timelineNotifier: logic.timelineNotifier,
        bullets: bullets,
        child: Container(),
      );
    });
  }
}
