import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../component/media_player_kit/media_player_kit_view.dart';

class FullScreenPlayer extends StatefulWidget {
  const FullScreenPlayer({super.key});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: MediaKitPlayer());
  }
}
