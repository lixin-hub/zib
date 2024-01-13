import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';

import '../component/media_player_kit/media_player_kit_view.dart';
import '../component/video_review/video_review_view.dart';

class DesktopPlayerPage extends StatefulWidget {
  final MediaKitPlayer player;

  const DesktopPlayerPage(this.player, {super.key});

  @override
  State<DesktopPlayerPage> createState() => _DesktopPlayerPageState();
}

class _DesktopPlayerPageState extends State<DesktopPlayerPage> {
  late VideoPlayerController _controller;
  late MediaKitPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = widget.player;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: const Color(0xff294F7E), borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  //toolbar
                  SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(Icons.arrow_back_ios, color: Colors.white))),
                      ],
                    ),
                  ),
                  //player
                  Container(decoration: const BoxDecoration(color: Colors.white), child: _player)
                      .expanded(),
                  //bottom
                  const SizedBox(
                    height: 100,
                    child: Row(
                      children: [],
                    ),
                  ),
                ],
              )).expanded(flex: 1),
          const SizedBox(width: 10),
          Container(
              constraints: BoxConstraints(maxWidth: min(400, 400 * (cons.maxWidth / 1080))),
              child: const VideoReview())
        ],
      );
    });
  }
}
