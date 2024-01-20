import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/media_player_kit/media_player_kit_logic.dart';
import 'package:zib/component/media_player_kit/media_player_kit_view.dart';
import 'package:zib/views/DesktopPlayerPage.dart';
import 'package:zib/views/MobilePlayerPage.dart';
import 'package:zib/pages/player_page/player_page_logic.dart';

import '../../main.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final logic = Get.put(PlayerPageLogic());
  late VideoPlayerController _controller;
  late MobilePlayerPage _mobilePlayerPage;
  late DesktopPlayerPage _desktopPlayerPage;
  late MediaKitPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = MediaKitPlayer();
    _controller = Get.find<MediaPlayerKitLogic>().controller;
    _controller.initialize().then((_) {
      // _controller.play();
      setState(() {});
    });
    _mobilePlayerPage = MobilePlayerPage(_player);
    _desktopPlayerPage = DesktopPlayerPage(_player);
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
    // if (width > 700) {
    //   // padding = width / 1080 * 10;
    // }
    return Scaffold(
      body: Material(
        child: Container(
          // color: const Color(0x8a77afde),
          child: Container(
            // decoration: BoxDecoration(
            //   color: const Color(0xff294F7E),
            //   borderRadius: BorderRadius.circular(20)
            // ),
            padding: EdgeInsets.all(padding),
            child: Stack(
              children: [(width < 700) ? _mobilePlayerPage : _desktopPlayerPage],
            ),
          ),
        ),
      ),
    );
  }
}
