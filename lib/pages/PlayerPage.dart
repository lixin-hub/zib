import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/MediaKitPlayer.dart';
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
  late MediaKitPlayer _player;
  late MobilePlayerPage _mobilePlayerPage;
  late DesktopPlayerPage _desktopPlayerPage;

  @override
  void initState() {
    super.initState();
    logger.i("_PlayerPageState init");
    _controller = VideoPlayerController.networkUrl(
        // Uri.parse("http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"));
    // Uri.parse("https://pull-flv-l1.douyincdn.com/game/stream-690873598648516661_or4.flv?abr_pts=-800&_session_id=037-202401101923126632A97451C5222F1699.1704885799941.88032"));
    Uri.parse(
        "https://sf1-cdn-tos.huoshanstatic.com/obj/media-fe/xgplayer_doc_video/mp4/xgplayer-demo-360p.mp4"));

    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {
          logger.d("controller has been initialized");
        }));
    _player = MediaKitPlayer(controller: _controller);
    _mobilePlayerPage = MobilePlayerPage(_player);
    _desktopPlayerPage = DesktopPlayerPage(_player);
    // _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    logger.w("_PlayerPageState dispose");
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    double padding = 0;
    if (width > 700) {
      padding = width / 1080 * 10;
    }
    return Scaffold(

      body: Container(
        color: const Color(0x8a77afde),
        child: Container(
          // decoration: BoxDecoration(
          //   color: const Color(0xff294F7E),
          //   borderRadius: BorderRadius.circular(20)
          // ),
          padding: EdgeInsets.all(padding),
          child: Stack(
            children: [
              (width < 700) ? _mobilePlayerPage : _desktopPlayerPage],
          ),
        ),
      ),
    );
  }
}
