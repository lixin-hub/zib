import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'barrage_logic.dart';

//弹幕显示
class BarrageOverlay extends StatefulWidget {
  const BarrageOverlay({super.key});

  @override
  State<BarrageOverlay> createState() => _BarrageOverlayState();
}

class _BarrageOverlayState extends State<BarrageOverlay> {
  final logic = Get.put(BarrageLogic());
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
