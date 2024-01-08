import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/component/MediaKitPlayer.dart';
import 'package:zib/common/TestingURLs.dart' as test_urls;

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
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(test_urls.OBS_URL_FLV));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {
          print("refresh");
        }));
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("player"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("VideoPlayer"),
            SizedBox(
              height: 200,
              child: MediaKitPlayer(controller: _controller),
            ),
            ElevatedButton(
                onPressed: () {
                  _controller.play();
                },
                child: const Text("play")) , ElevatedButton(
                onPressed: () {
                  // _controller.play();
                  var pos = _controller.position;
                  pos.then((value) {
                    print("pos:${value!.inMilliseconds}");
                    _controller.seekTo(
                        Duration(hours: 1));
                  });
                },
                child: const Text("seek 3 s"))
          ],
        ),
      ),
    );
  }
}
