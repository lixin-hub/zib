import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fplayer/fplayer.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:zib/pages/LinuxPlayer.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  var url_rtmp = "rtmp://192.168.1.105:1985/myapp/test";
  var url_flv =
      "http://192.168.1.105:80/live.flv?port=1985&app=myapp&stream=test";
  final FPlayer player_flv = FPlayer();
  final FPlayer player_rtmp = FPlayer();
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    player_flv.setDataSource(url_flv, autoPlay: true);
    player_rtmp.setDataSource(url_rtmp, autoPlay: true);
    _controller = VideoPlayerController.network(
      url_flv,
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    player_flv.release();
    player_rtmp.release();
    _controller.dispose();
  }

  videoPlayer() {
    if (_controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("player"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text("flv"),
            // Container(
            //   color: Colors.red,
            //   child: FView(
            //     height: 200,
            //     player: player_flv,
            //     panelBuilder: fPanelBuilder(),
            //   ),
            // ),
            Text("mediakit"),
            LinuxPlayer() ,
            Text("VideoPlayer"),
            Container(
              height: 200,
              child: videoPlayer(),
            ),
            ElevatedButton(
                onPressed: () {
                  _controller.play();
                },
                child: Text("play"))
            // Text("rtmp"),
            // Container(
            //   child: FView(
            //     player: player_rtmp,
            //     panelBuilder: fPanelBuilder(),
            //   ),
            // ).expanded(),
          ],
        ),
      ),
    );
  }
}
