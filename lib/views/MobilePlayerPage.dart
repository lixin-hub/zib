import 'package:flutter/material.dart';

import '../component/media_player_kit/media_player_kit_view.dart';
import '../component/video_review/video_review_view.dart';

class MobilePlayerPage extends StatefulWidget {

  const MobilePlayerPage( {super.key});

  @override
  State<MobilePlayerPage> createState() => _MobilePlayerPageState();
}

class _MobilePlayerPageState extends State<MobilePlayerPage> {
  late final MediaKitPlayer _player = MediaKitPlayer();

  @override
  void initState() {
    super.initState();

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
              decoration: BoxDecoration(
                  color: const Color(0xff294F7E), borderRadius: BorderRadius.circular(20)),
              child:
                  Container(decoration: const BoxDecoration(color: Colors.white), child: _player)),
          const Expanded(child: VideoReview())
        ],
      ),
    );
  }
}
