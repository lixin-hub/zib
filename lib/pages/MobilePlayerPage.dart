import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/MediaKitPlayer.dart';

import '../component/video_review/video_review_view.dart';

class MobilePlayerPage extends StatefulWidget {
  final MediaKitPlayer player;

  const MobilePlayerPage(this.player, {super.key});

  @override
  State<MobilePlayerPage> createState() => _MobilePlayerPageState();
}

class _MobilePlayerPageState extends State<MobilePlayerPage> {
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
    final height = MediaQuery.of(context).size.width * (9 / 16);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              constraints: BoxConstraints(maxHeight: height),
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: const Color(0xff294F7E), borderRadius: BorderRadius.circular(20)),
              child:
                  Container(decoration: const BoxDecoration(color: Colors.white), child: _player)),
          const SizedBox(height: 10),
          const Expanded(child: VideoReview())
        ],
      ),
    );
  }
}
