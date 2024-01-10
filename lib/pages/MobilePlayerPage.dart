import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/MediaKitPlayer.dart';

import '../component/video_review/video_review_view.dart';

class MobilePlayerPage extends StatefulWidget {
  final VideoPlayerController controller;
  const MobilePlayerPage(this.controller, {super.key});

  @override
  State<MobilePlayerPage> createState() => _MobilePlayerPageState();
}

class _MobilePlayerPageState extends State<MobilePlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width * (9 / 16);
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MediaKitPlayer(controller: _controller).constrained(height: height),
            Expanded(child: VideoReview())
          ],
        ),
    );
  }
}
