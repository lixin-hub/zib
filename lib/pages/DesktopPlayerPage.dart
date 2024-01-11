import 'dart:math';

import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/MediaKitPlayer.dart';

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
    _controller = widget.player.controller;
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
          Container(child: _player).expanded(flex: 1),
          const VideoReview()
              .constrained(maxWidth: min(400, 400 * (cons.maxWidth / 1080)))
        ],
      );
    });
  }
}
