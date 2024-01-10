import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/MediaKitPlayer.dart';
import 'package:zib/common/TestingURLs.dart' as test_urls;

import '../component/video_review/video_review_view.dart';

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
        //Uri.parse("https://113-240-80-113.bytefcdnrd.com/game/stream-402635204261577502_sd.flv?302_type=cold_aggr&_session_id=037-202401091116133DC12934755ADC9B3D26.1704770206414.40625&abr_pts=-800&cb_retry=0&domain=pull-hs-f5.flive.douyincdn.com&fp_user_url=https%3A%2F%2Fpull-hs-f5.flive.douyincdn.com%2Fgame%2Fstream-402635204261577502_sd.flv%3Fabr_pts%3D-800%26_session_id%3D037-202401091116133DC12934755ADC9B3D26.1704770206414.40625&manage_ip=&mir=true&node_id=&pro_type=http2&redirect_from=pod.cn-ag0ozt.fq54.nss&vhost=push-rtmp-hs-f5.douyincdn.com"));
    Uri.parse("https://sf1-cdn-tos.huoshanstatic.com/obj/media-fe/xgplayer_doc_video/mp4/xgplayer-demo-360p.mp4"));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {
          print("initialized");
        }));
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width * (9 / 16);
    return Scaffold(
      appBar: AppBar(
        title: const Text("player"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MediaKitPlayer(controller: _controller).constrained(height: height),
            VideoReview().expanded(flex: 1)
          ],
        ),
      ),
    );
  }
}
