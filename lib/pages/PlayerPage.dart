
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/pages/DesktopPlayerPage.dart';
import 'package:zib/pages/MobilePlayerPage.dart';

import '../main.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        // Uri.parse("http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"));
        Uri.parse("https://pull-flv-l1.douyincdn.com/game/stream-690873598648516661_or4.flv?abr_pts=-800&_session_id=037-202401101923126632A97451C5222F1699.1704885799941.88032"));
        // Uri.parse(
        //     "https://sf1-cdn-tos.huoshanstatic.com/obj/media-fe/xgplayer_doc_video/mp4/xgplayer-demo-360p.mp4"));

    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {
          logger.d("controller has been initialized");
        }));
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("player"),
      ),
      body: Center(
          child:
          (width < 700) ? MobilePlayerPage(_controller) :
          DesktopPlayerPage(_controller)),
    );
  }
}
