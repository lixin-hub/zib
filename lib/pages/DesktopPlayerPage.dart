import 'dart:math';

import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/MediaKitPlayer.dart';

import '../component/video_review/video_review_view.dart';

class DesktopPlayerPage extends StatefulWidget {
  final VideoPlayerController controller;

  const DesktopPlayerPage(this.controller, {super.key});

  @override
  State<DesktopPlayerPage> createState() => _DesktopPlayerPageState();
}

class _DesktopPlayerPageState extends State<DesktopPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,cons) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child: MediaKitPlayer(controller: _controller))
                .expanded(flex: 1),
            VideoReview().constrained(maxWidth:min(400,400*(cons.maxWidth/1080)))
          ],
        );
      }
    );
  }
}
